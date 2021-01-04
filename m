Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E25402E9795
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jan 2021 15:48:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65EA989F77;
	Mon,  4 Jan 2021 14:48:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2075.outbound.protection.outlook.com [40.107.93.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8902989F8E
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Jan 2021 14:48:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jTJv/jrWWA/ICtCtLb3oSOGwlINY2LoZyDTV8ea/PsLDL6poP9rhbwGG5niMGpo6wOJXB5YoJzAJHul/YWLf/vqQwqcHfLMI3Ge3nVFUD08EzrTWExVRq3zBIkz2ZhkiYWjOiGpJU9pemY00OByxcXxiocP3XfCfPZJeO9YaY//HuP+ep6bBDdwLN9Mbmgr6w5a8IasPo3Lba9DRkYwTORa3TbX7UWmCU8h/rBFrWXxd4QkupMYO1EUbRo2urg8tb+z/iN+ReiemYl6nFzZIeWTtMzIEkd1DQ3G1l0R32OR/V2VOW8hBhdKWZZMtrPoeRwIgRSom1neUeeWB3weSLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dqXaQ67tYzRsRMlNbZLzKEtSJqcOmpaH3G49k8yO9pM=;
 b=NxYCvqJGK7PZXypnYHVCxHfFvrrpEg+PlsFB0K2dc/HQP8ofGYcxjJAOSYQLsXYH6FPDU+vkDT5ynku0GGeoHuxoPJglQNRKyhyQH3dF8Wo74x5GH8MZZxF6gdwIgimsVHLK/PMHR9Rk3imd7dky7rIWHbEzrJ0327Ha7FgCHhArkEh5aXVT1U+nnOsFH2ZLwPrgXZuveGune+mFKb+NfUXc32n5SXY5SIgAovStkPUS+uiFJMRsTobsH3Ml0MM/upPWyyVoDpMDE1shUe94loumRApm2SAw2fM3NMLOw7rWChaOTJ5IGwOPY2Vkiu/zi+yoyXih6g7AcV3U9P6dWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dqXaQ67tYzRsRMlNbZLzKEtSJqcOmpaH3G49k8yO9pM=;
 b=ituu6FfeNNc4s/z/kR0VHHGxGUkL4gyLEWLQpmv6ClZvJHDr4aylDGqVJZEOY21ZfIeZcyP1snqfhm4qpPvQU9durUcfzytUuuui9nWNC5qeGbyPxfT1bY2v1Kxbf0xnQMeTdovHE/G66udmsG8xPepc9m9V2ydmu9FvYP1JWtc=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3727.namprd12.prod.outlook.com (2603:10b6:208:15a::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.19; Mon, 4 Jan
 2021 14:48:25 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5%3]) with mapi id 15.20.3721.024; Mon, 4 Jan 2021
 14:48:25 +0000
Subject: Re: 5.11-rc1 TTM list corruption
To: Borislav Petkov <bp@alien8.de>
References: <20201231104020.GA4504@zn.tnic>
 <e3bfa0a4-5d0a-bd68-6cc8-73db1d29f22c@amd.com>
 <20210104105802.GD32151@zn.tnic>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <e7ac0a5a-9384-b533-7b28-98e5469715bd@amd.com>
Date: Mon, 4 Jan 2021 15:48:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20210104105802.GD32151@zn.tnic>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM0PR02CA0189.eurprd02.prod.outlook.com
 (2603:10a6:20b:28e::26) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR02CA0189.eurprd02.prod.outlook.com (2603:10a6:20b:28e::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.19 via Frontend
 Transport; Mon, 4 Jan 2021 14:48:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e85c0930-7f30-4477-9c5d-08d8b0bfca66
X-MS-TrafficTypeDiagnostic: MN2PR12MB3727:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB372785E1C4FB48DB4B85D55983D20@MN2PR12MB3727.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XXKFuyFKNXxMb6/M0JJd+yfKLz4t/wdLPfYEGvQYBqxiO4ymDy7suEOOgG3QoKHDRbyqB7CBjyS2xKFluff1Vf4iMt6dvV/a2epnY3jLFsKsQtpqpYEvquhAAj8+D5tgizAYPJboZhITSEBNs2j49snPAahshxtdu/7q2ki3yJF5BdRdUEa0LheL6K4y8RqOLqjJoldFtCVTZAvaD/idV5lEKEMYeBmMi+t//m6VPeygMipeitpK9B9AP/RDbGIswq7tIGwFcDT/rMekasii39TY7YFugzRuvQutEtUYM7CoNkGp6C6HCcQkxeu667e3MXmbMR7Q6LM3rh5u24i7axwAxpG419aX6mK4rIhOSvFuyOXOzRz/JBPm8Y66aa3xAC7TxFFsgc6QkCQyf7GcDPgMjbOq1RtXuR734zC+1xT5YaDWjYCGyam0JxGwNdKc0vaxbbiME8n8fLv6x9ITdtaJm16727QXeJAviJ5ka1s=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(396003)(366004)(346002)(136003)(478600001)(4326008)(31696002)(6666004)(36756003)(8676002)(6486002)(2616005)(66476007)(316002)(6916009)(54906003)(4744005)(5660300002)(66556008)(16526019)(186003)(86362001)(8936002)(66946007)(52116002)(31686004)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RVgyVDl2Ym9hb0ZYK0JVR3doRWNoWU1PY09iZWpaeWVqaWRzYmRNMkhKYVFD?=
 =?utf-8?B?WExKUWtmMHllSzd0RnJVMlo5S0g3WkErblhZMUthS3VRM3dMVGZjZ3F5aHNi?=
 =?utf-8?B?RlhLajM2blVCWlJhb3hNWHpNS3M0bnBSbmtGcnRvRFlXeXJRMzlleS9YRVl6?=
 =?utf-8?B?eXhWR2ZXTGI1MW1aY3dHVWxrbFgrWm04MkZReHFvQTlyQ2llUXFvT0dCTi9S?=
 =?utf-8?B?K2dKY0h5U1VLWXVwVkdDWGppdU1TbmNieWdRYlZWR0N1Z3BYWmt3K0lxaXhG?=
 =?utf-8?B?ZUhFNytSVDZjMjhTTDBSVVJBb0lBTEYwZGx0N1ZXQW5KeDlTdjVqYk9PNzVD?=
 =?utf-8?B?QjExNHhpNHBzQUxGM1cvbCtwWklSNFVQMER2T28xZjhkRjBFRUFMalpIdW9p?=
 =?utf-8?B?MExnUHE3VlNiVk9vZE8zb0IzS2lKY1hETVBzZFRweHA3Z2pxQ213aTFoVVcr?=
 =?utf-8?B?ZCtOa2FJNklGYUN6QW9LQ0I1NWdHRnAvY2NTMU5LTVpXaEJWY3k0ZHZOK1dt?=
 =?utf-8?B?WVE2VTg0Y0lpMnI1dGViaGlhaHRuK3dSYW5TTkhDTVRDbEkrZ3BJUlNIMkpZ?=
 =?utf-8?B?Qk9JaUkzTmIwUk1vRnRLQjJGeGVJYURrV204aUozU2xTRHM3TmVuR2xOL2xq?=
 =?utf-8?B?Nm84VE1kUUVZcHdKaXJ6a0VYODJRV3FpUDFTMU5BRFlGN0FCQTREdm9oVGZR?=
 =?utf-8?B?b2lZQnlMY0tHSzJEdnhVRlBmeHI4a2RoM3A1djNqeFNFWjNRTTVYT0ZtVXh4?=
 =?utf-8?B?QVJFZWozZHkvQlN5ZGp0czZmNW5WTEJleTlwRVZwTzZKUUlpT1dHelBnMGVH?=
 =?utf-8?B?OURvSHdFMjQ4ZjRnb3JmdGxqZlh4Yll6V0hIYjBnMXNmd2h6bGRPNlRYWllz?=
 =?utf-8?B?dnJlYm50K3RDSWZJNUpBYWpJM2VyRVhjY1dDZ1QvNmdQdmFqTTA2a21PK2hz?=
 =?utf-8?B?U3lyOCtQZTV6MVJUUHJEd3lyamhkQ2MvU2tlaG10MGkyNmlTemt4akw5cWRw?=
 =?utf-8?B?ZWgyVE4vd2h2TEdsWW5ZR3JpUTBPWHZ5MWNSdlZwTkttU3BUSFRncDhHbDBt?=
 =?utf-8?B?YXBsL0hBV05FSlY1ZVk1TE81VXJNMHZRc2FFNTB2S1N0eU9VaWFnOUJZQ1Rl?=
 =?utf-8?B?UHBaWmVrRDVYMXpTTUU3SEJ3TGpQM2pHT2FOZms4Nk05Vk81cFgzOCt4SFVy?=
 =?utf-8?B?TUVqZjEyWktxY3lOZDh3SFRVSVJhU3U3OXlSZWttRUlXa3BxZGVvRE85ZzVn?=
 =?utf-8?B?L01WUmtSY0Y0RzB3QVdNRFVjWXBCMDZFZ1lpYThIZWdEY3lFMzY5Y1RqeXJT?=
 =?utf-8?B?d1FNVlNpWHh5TkhaeFFMUXJOWkV0V0MyVUJwMmQrcFdhMUtObHpFUEFaTGxB?=
 =?utf-8?B?Zlh1ZVZKRHU5R0VmTDJldVpTN2VnV1hCVWljbVJGS29WK3ZzbkI5OWRGM3d5?=
 =?utf-8?Q?u6/HZfZ8?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2021 14:48:25.2890 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: e85c0930-7f30-4477-9c5d-08d8b0bfca66
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KMbm+cShUHTekUh6+YCRdeM+zOmhrAXdLTz7HD2/oHQR1+OIrP/MXR57bDtwwFgd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3727
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
Cc: Huang Rui <ray.huang@amd.com>, lkml <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMDQuMDEuMjEgdW0gMTE6NTggc2NocmllYiBCb3Jpc2xhdiBQZXRrb3Y6Cj4gT24gRnJpLCBK
YW4gMDEsIDIwMjEgYXQgMDM6MzQ6MjhQTSArMDEwMCwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToK
Pj4gR29pbmcgdG8gZG91YmxlIGNoZWNrIHRoZSBjb2RlLCBidXQgY2FuIHlvdSByZXByb2R1Y2Ug
dGhpcyBpc3N1ZQo+PiByZWxpYWJsZT8KPiBMZW1tZSBmaW5kIGEgdGVzdCBib3ggd2hpY2ggY2Fu
IHRyaWdnZXIgaXQgdG9vIC0gdGhlIHNwbGF0IGhhcHBlbmVkCj4gb24gbXkgd29ya3N0YXRpb24g
YW5kIEknZCBsaWtlIHRvIGF2b2lkIGRlYnVnZ2luZyB0aGVyZSBmb3Igb2J2aW91cwo+IHJlYXNv
bnMuCgpQbGVhc2UgZG8gc28gc2luY2UgSSBjYW4ndCByZXByb2R1Y2UgdGhpcyBwcm9ibGVtIGFu
ZCBkb3VibGUgY2hlY2tpbmcgCnRoZSBzb3VyY2UgZG9lc24ndCBzaG93IGFueXRoaW5nIG9idmlv
dXMgZWl0aGVyLgoKVGhhbmtzLApDaHJpc3RpYW4uCgo+Cj4gVGh4Lgo+CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
