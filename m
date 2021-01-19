Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2492F2FB520
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jan 2021 11:09:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16B016E071;
	Tue, 19 Jan 2021 10:09:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2068.outbound.protection.outlook.com [40.107.94.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F9906E071
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Jan 2021 10:09:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EuaCUDOTvZA7qBAdGkwN7pFPkBexNvOdxXiXtA9E2hG11M/nx/Sun6f9J3BpBGwtwT5DHex1640CJOf5w9a71qxd11nDFXAhZL4KP+IxkUFZYXmmwdVtB5rH2sNBvE0vaHy/bVA5lusv+uWx7qR7rLLCgr3nxyFgVX9zKXXS3hQOaupkqhyMu/lxb7NFKke508da2Dxj1bDiKtEcr+VC9wZJTJObEkGkBSg1wl7n1y9YHvmlXh+++mYHfRuWOc4I/UAJwPBi4hN3CKSmjDTE1bHLI+s88iWZ9imHxuKLo1SczwUPzObC7SegS4BZ6CAyNP+IUX/MXBP1J3iYESu9Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y7adigLItf66vIfP62vEeEZp/QNW0eGW4H4AaOqJIuI=;
 b=kXQGWehwO+SkT02lLSPUvPStN5O/E5azwj/57hwhby2jA9Mhl9naKdm9F+zWpszDFAQxJWFcwg8XBZhiDexC+e+qJ6BWmlWq7IKlayM7q0jPbYBZpf0esNGsZRAI0NdsdYN4R0RP1Y30N5E8t1KDNc3hPhQA3L/uSOJixOMtWr0OAwTyL09CaiQleyEkjfQHrWrkXvLnmidHHgzSr03skOcputC5KeH682NYTP0wR2VOk88wetAMo2aqVAYQ1h11f12pip/G1q8LF+s18OztNe+0/C502OTWwdSehBB4BllUeD+OxzItvHyb3E/xkcUhXybeN1GghhOZv7ZsZB0vCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y7adigLItf66vIfP62vEeEZp/QNW0eGW4H4AaOqJIuI=;
 b=bpAeo5NSaf7ZZFpvDrgz8KNLJ3dywFwDN0s4Ggpgmx/aWAnk4qdodwJInFGxaW0WlnyptGB13fxE/xAwFGs6RhW5FeNtmek1+uM+hcT++XR7DGpkwCrz0yf0yrPebuTxeprRTNRnt8pXzIoxbiJo/kBxitTcuEAUPWzE/cVvqAM=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB4706.namprd12.prod.outlook.com (2603:10b6:208:82::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.11; Tue, 19 Jan
 2021 10:09:00 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5%3]) with mapi id 15.20.3763.014; Tue, 19 Jan 2021
 10:09:00 +0000
Subject: Re: [PATCH] drm/syncobj: make lockdep complain on WAIT_FOR_SUBMIT v2
To: Peter Zijlstra <peterz@infradead.org>
References: <20210118180334.43714-1-christian.koenig@amd.com>
 <20210118180334.43714-2-christian.koenig@amd.com>
 <YAan6haGjnIlNIoJ@hirez.programming.kicks-ass.net>
 <019f2342-9d64-f6c6-d03d-0ab8ddce101d@gmail.com>
 <YAau1CBmMNPM5KqV@hirez.programming.kicks-ass.net>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <ebf6940b-223c-9b92-3220-a79063723373@amd.com>
Date: Tue, 19 Jan 2021 11:08:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <YAau1CBmMNPM5KqV@hirez.programming.kicks-ass.net>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM8P190CA0017.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:219::22) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM8P190CA0017.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:219::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3763.9 via Frontend Transport; Tue, 19 Jan 2021 10:08:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 56d71303-a445-477d-a467-08d8bc623ded
X-MS-TrafficTypeDiagnostic: BL0PR12MB4706:
X-Microsoft-Antispam-PRVS: <BL0PR12MB4706F0C66ABBB3E1E767DD6B83A30@BL0PR12MB4706.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:41;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: M74RmmDa8/xTMC9V/xcEOASS5owmU1Uag2bv3PivE0sOnlKj23hkZtkUznQa4ri0oe+hPmd52xT1qwtCt1YmCcCADHgfveplAhP/D5StH5P86OVZ6XdPi4wKKUrGsL3/NZVVfw8avFIXCtbv98WfGBn8OoZSqwtQZLPl6iXllRi70Ah1Oxw6fKqIYCC7azjGyims7ZjFpusn3NzSdIGaMtndhBFWxajBHu9A7QlkwIs1FPou/CvvaIKd0JfTivbwEsxa3WWmhsUbb+ILs90QsbPzS5YcO2EPYW/2rKaxTXBuDUB4tao1lxWNdVIdGTU24SnwH97OF32dkRVWi2laJR2910y90m50iOgnjh0vFNUxTmSM45Y/2Bn7arPJ7lFk9hrV0nkF5z7yt6RbZpkukD53xN3n7Gj+BCAT+uz+TpCG/B4ZACoeUOXzrnj6zU2aHcigTPXSBPbA2I1DLiEgo93Tx/NDl37pR4SpjM1VnP9Qifw+rspSgs0l+iEdJo8qKKuUZGgeRrDn3j0QO9CUBV2u0k+YXAlE6gcG6GjxV1JBTBgd74Ag2l09ViLxQVpTQhmoFGUWdQtMP11HeyMINWx4p48my+/v+kORT6npbfE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(376002)(346002)(366004)(136003)(8936002)(83380400001)(31696002)(6486002)(316002)(4744005)(8676002)(66556008)(186003)(66946007)(36756003)(86362001)(31686004)(6916009)(5660300002)(2616005)(16526019)(52116002)(66476007)(478600001)(6666004)(4326008)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MyszUlJVMHJrUXZMTy9Qck5tNmNQbi95THErdUZwVWQxMUpmL3FxTXRhZHZa?=
 =?utf-8?B?UVhLWGlNOWphazlxdG9Zc3lUUGpWRCtaVHNKbWRSZDhsbFlZRUhXSVRlQ3VZ?=
 =?utf-8?B?VkttMFc2bzU2VEZwR3E4a1Q2UTF0Q2ZFTFkvL1RVOHZHSWRsbTJkcWQzM08x?=
 =?utf-8?B?TXFNVzJuYkNwZzFBanR0U3llYmF0RXE1R2w5d3R1YjcwQUt5ZUJZSWdWajYv?=
 =?utf-8?B?WU56ejM4d09BTHJLazJJM0o3TkRqSXVSZ1FaL3pqMFhZUG83UEgrdWt0VEVO?=
 =?utf-8?B?S1FRS3laMEZIUHl4OXNqK0txeUdXV3gwS01JSEl1eWt2QlBVT1pwZUdRdzRw?=
 =?utf-8?B?aWhPRUtuUlBITkg1ZVFsRDJJT2tiSVJXOENVbmtyeDZYL294WmpvbFR0UmNC?=
 =?utf-8?B?Q29tR3E2bWtTL3ZtN0xoK3lQcUZJVFVnU251TTBQNmRkMERMaGtzOUgvaDJT?=
 =?utf-8?B?Z3RURFBPcDAxMmRteU9qL0pRcjhKbkdiR2hIa3hQN0Z3cGpDY1lzdmZlaGhz?=
 =?utf-8?B?T1lSdzBKUXRPUXpwbTFzOUNxaDU5R3hBZ3FtU05XN2kyWjZEVmJkaUlUZmlN?=
 =?utf-8?B?S3cwN2xXOGNrQVAvSnJnWm5CR0dWWUpkR2NabUkzbzI4YVIvRjAzTFlxK1dW?=
 =?utf-8?B?VkcyT3FmNmY3cTJMNFYrTzE1NC84cWJHb25xK0cvZi8xUzVoS1BjbHdNRUdV?=
 =?utf-8?B?djltL1ZqMUsvQjI2WFBCakVaN2dYSW03N0dVV3BZNkRZblp3M0pNaDhWQ2VD?=
 =?utf-8?B?b0J2eWNsWkFweEZkdXVETnhOd2Riamk4U0F4N2I4TGp1VFV3VDN1WlNvbGY4?=
 =?utf-8?B?RHhleE4rNnRsOEY5eGFZc01sUGdRazltem8xSDhTUytNMmxHRWkvbGZLRU1n?=
 =?utf-8?B?d25HWnRIakcxajBGTkxNOFhlNFlIUUlSWGxNRUtkY0dCNnRxVFY4SkMxdDNs?=
 =?utf-8?B?bVRmeVY3ekN3R0tkcTZZZDVlUDMxa3hpQWdDdUxyZmZxWXFCUkk1MWI3by94?=
 =?utf-8?B?OSs4SVJuRU9jVVBKV1FRRWk0UW02VVdVN2NsVTVrd09Td0NtVzhRcGRCRHRO?=
 =?utf-8?B?MXRGN2pIOGx3R1d3Mm1hSXRlSjBtbXpuVno5dTIyMGtCSnQzbHVnZjl4MEhJ?=
 =?utf-8?B?RlE1UjlUcEpad1p5TjFpZEJJemJ0cGh3OTdEYW1NK05kWEVXd1hNR2FMRW1i?=
 =?utf-8?B?U2V3aE0yOXhVTDFjSG5UVkRuYlN2dUZTTDc4VTNOS0tCai9LcW1FZUZ3SHVq?=
 =?utf-8?B?L3cxRE5nUUoyRGVaV2FkMFZvdk1iYk5IazNLRm9zeFh1UzVrYk9KMFRKNGpw?=
 =?utf-8?B?RjRYUkVlRkRzaGwxSFlJcHBHc1VxSUFnMUdMOHZBQk9pN0RXY3ZMK1VPY2pu?=
 =?utf-8?B?Qnhwd0xWeFVrVG1RY0VqL0dldUx3SDNtOVNVQUhjdzMvemtQLzUrL0s1d3U1?=
 =?utf-8?B?bmhJcnVHc1ZLQTlsQnNZWmxFaHlDa2Znclc2NFRORThvT0p5RkNUTldDREdu?=
 =?utf-8?B?V0JwRjNPWlFIV0RZTDZzWWxJb1Jab3JSZUFUNm96clFUZk80b3ZsQzdWR21w?=
 =?utf-8?B?K1pwZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56d71303-a445-477d-a467-08d8bc623ded
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2021 10:09:00.7634 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AO1iS9v29vGkuHdMyIDcrDDrLfUScuB70gBfRXb+7mucPKoJvkkUolzogpQDLo4E
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4706
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: mingo@redhat.com, will@kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTkuMDEuMjEgdW0gMTE6MDUgc2NocmllYiBQZXRlciBaaWpsc3RyYToKPiBPbiBUdWUsIEph
biAxOSwgMjAyMSBhdCAxMDo0Njo1M0FNICswMTAwLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+
PiBCdXQgSSdtIGdvaW5nIHRvIGRvdWJsZSBjaGVjayBpZiBkcm1fc3luY29ial9mZW5jZV9hZGRf
d2FpdCgpIGlzbid0IHVzZWQKPj4gZWxzZXdoZXJlIGFzIHdlbGwuCj4gZHJtX3N5bmNvYmpfYXJy
YXlfd2FpdF90aW1lb3V0KCkKPgo+IFdoaWNoIGlzIHdoeSBJIGFza2VkLi4gOi0pCgpPaywgZ29v
ZCBwb2ludCBhcyB3ZWxsLiBCdXQgdGhpcyBpc24ndCBkcml2ZXIgaW50ZXJmYWNlIGFuZCByYXRo
ZXIgSU9DVEwgCmltcGxlbWVudGF0aW9uLgoKU28gaWYgd2UgaG9sZCBhbnkgbG9ja3MgdGhlcmUg
aXQgaXMgb3VyIG93biBzdHVwaWRpdHkuIEdvaW5nIHRvIGFkZCB0aGUgCmFwcHJvcHJpYXRlIGFu
bm90YXRpb24gYW55d2F5LgoKVGhhbmtzLApDaHJpc3RpYW4uCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
