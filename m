Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CA7F2EAA28
	for <lists+dri-devel@lfdr.de>; Tue,  5 Jan 2021 12:49:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C3F26E0EC;
	Tue,  5 Jan 2021 11:49:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2076.outbound.protection.outlook.com [40.107.243.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F9EE6E0EC
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Jan 2021 11:49:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mwbRlfPLPOhO/a1fxg1isB4T3K2ohn6jZe0QZyMV3N+Imga96wDdga5e2mFBBZt19y9Fnvnl6yxSPrjkyeLCm9lFBeg+AiUr+pV/+1PDDoloT58cx1AJBPWIZj9Onq5uOOGf7nmjfhY31jSqk5ky0gFBWyh3szo2LloT1Ib4Pte6oS+tbI8I9+SFg9XPHsYidBNtNFB2qCScZNAWsK4pmbnlBU8FwVuAnUakzseVWyHVzANnKrPqUNcMvSkXoMS+8XupMThjmv9wp0AeUVjTm2+SF7ubcO/Lvr+/wXkr8P4gW9xoqt/OwUzMUKoWIk4DvoRGXehJUgxbWgQT12PbXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rIJal2AhFjCTaqm1IKapEXDkueplJC4RIzkZj55pxCM=;
 b=YtlMpGm0lo2YC5s4wgOILeRL5dAo6NimfV9SXJ/rd5K/HnPPbqESghZLfnMJtB5nqribS60inax79FzG+FCxcEQxP/98PQ+ZUl00P2tv2Wr+s+LBgdJGfu94wBbCyPkI+Jj118vL9M3QI+KSnOvG5yzOS7vKtTt7bCOQfDXPdld+XOV/1Y+Sjc7RtbnnXhFTYG3lFhQ3IZSv1jrsKfk9A3zyngpnlqcDSMQmXNrYv7El6Jgt2npW1Wymh9JtAG35x5ahW4p448LVYkTnVJTvz+YCkGHqIzxzDwAk2zQ6opUegm7yUWq6eK4WkV70RD91wR+L6BanHd1+BhTIYmDL+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rIJal2AhFjCTaqm1IKapEXDkueplJC4RIzkZj55pxCM=;
 b=HL8pR9E4nzOejW2pp+CZjPDydHq6hfzT4VSTF1nejzpZCmMh+sAf796jQkQaufJsDGi1n1JJhLlmD9Tx+uaUFWaD2HHydpJM/BHFJekDDtwxPQMiD9NFD6MyZ26ojHuEEu8OvSY+IdjzEdNmhRUJ78fq1PoN0cg9HTPTUG8GHZ8=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4551.namprd12.prod.outlook.com (2603:10b6:208:263::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.21; Tue, 5 Jan
 2021 11:49:16 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5%3]) with mapi id 15.20.3742.006; Tue, 5 Jan 2021
 11:49:16 +0000
Subject: Re: [PATCH] drm/ttm: Remove pinned bos from LRU in
 ttm_bo_move_to_lru_tail()
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
To: Lyude Paul <lyude@redhat.com>, dri-devel@lists.freedesktop.org
References: <20210104231358.154521-1-lyude@redhat.com>
 <cc501d40-fdae-93a8-394a-4db840b9b0ef@amd.com>
Message-ID: <b32bcd58-cd3e-5545-83c1-acb9f5973d48@amd.com>
Date: Tue, 5 Jan 2021 12:49:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <cc501d40-fdae-93a8-394a-4db840b9b0ef@amd.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM4PR07CA0016.eurprd07.prod.outlook.com
 (2603:10a6:205:1::29) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM4PR07CA0016.eurprd07.prod.outlook.com (2603:10a6:205:1::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.4 via Frontend Transport; Tue, 5 Jan 2021 11:49:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: fe8c17fd-f1d1-4daa-01d5-08d8b16fedd5
X-MS-TrafficTypeDiagnostic: MN2PR12MB4551:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4551C70A4A957ED56F53CB0B83D10@MN2PR12MB4551.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sn6v5V3010YgqyYT7t4huzpTERsVs4y7HSzW598P/CtcC8SCtX742ApjE2iQXQd06Op3Pu3D4G9jCHuQR19qlmPHZ3FGELinG55DBJfA4Wt1xjs8GUl6ieqwnvVa/WHSsZeziM0o5yQsFi8DI2jf1jNidL/+86m5ZZPBeQoB7h5wck8rPJsKq+Do/F/QOYwLA72+mTGch5e/CxOhSLclpIs1WojGpZQ7//Ya/hR119kVO52HncREfosNHYvqbXfi0n9ZmrYhTCPgg2KPmJGte8Ldq/kztLzDzE0PAYe6a5JD9IRU5/P3XmMoDEbaMQ+6LG5axyGV5CqbSwdMVm3x9V/xtZrjelqzJ8UV3g9DLWQ8hsAmmHTIGI2pUHgQlZaCiVA3kHMSGtVVMXmJlrzufQ/3/oxoL6djr9r+Yc9YK/O3CYjeTUpF521r3KL68kIdV1cNirxk7g+llWr9rStF8qOUc5wKocwjYOq8RC0K8zk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(346002)(136003)(39860400002)(366004)(5660300002)(6666004)(8936002)(52116002)(31686004)(316002)(8676002)(16526019)(66946007)(36756003)(2616005)(2906002)(186003)(478600001)(66476007)(66556008)(6486002)(54906003)(4326008)(66574015)(86362001)(31696002)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?QUhjNDM1NkVVR2cxRmVDT1VRNnFySGNYSUZpMHRwVmNXQmd1YTh0eXNnTFlD?=
 =?utf-8?B?U0VpdXNnd2JjN2hoVnhiK3kxcndWMkkvVDd4Y3BqT2hZeWhWSTg4UWZLdjlq?=
 =?utf-8?B?YThnU0NNNS9NMUROc1JHSk1qcmhLYjdjYmVKRXRoUlZDeEcxTTVMZmY4RDdR?=
 =?utf-8?B?eDBhTk9BdU1HRmxCQ3RQWkI2U1g1aFlVdnhIRmVjZlR1SEJtdy9mK3dySkhQ?=
 =?utf-8?B?dWQvYmUxWkNWZXhyenF2NEFPNVBoNFJXbDdmekVwRnNlS3lzNXh4My9DK0tz?=
 =?utf-8?B?UUVtU0Rhdyt6UVZVU28vRUZ3N2pMdXgwdlJnQ2lLUThLZGhXY24vdEJOUk5k?=
 =?utf-8?B?NXdwT2xRbEVQSGI0OGtuaU15ZHpSc3psSmlPZmg0R0Q3VjQ2ODZGZEdkaXgr?=
 =?utf-8?B?aXFsVVB6ZmJIa2Uwakg5bjFrS3FhQ0RFQVVyWmRidll1d2hvUDYyaU9nZUI4?=
 =?utf-8?B?dXFvSEFmQnNET0NpOThUd3crN09kRGJkaVI0WE1nTEd4Uys3eXllRlZUdDdK?=
 =?utf-8?B?UVB6Qk1mWTJBM3o4Q1phb2Vmc0hzYlZ2RndMMlM4R1FEZkNSdHg4ejV1b0tz?=
 =?utf-8?B?S3NicllpZi8ySkxRMXVtSElpRkZNNXBSRzMyS1RLZ0NRVEV3L1N6bERRU20r?=
 =?utf-8?B?ZjRhUkJsdTg0d2ZPem1QTTZBSEFYR2NIdVF3OVNRaTZtelp5SnhFZ3ltNERK?=
 =?utf-8?B?eFR2TEpvKzFlTUdJMnIwRkNUNHplYkxJZHRDVkpTREY1V01UeDJ2ZUhaT25F?=
 =?utf-8?B?MDE1ZHVscXJUZkIrVGlHTm5QRDFQY0tYU1BTODBSSGgwK044U01COHBtVUZU?=
 =?utf-8?B?aHdMaHRzaEZnRm5GUXdwRFBjWk5PbEtOOS8vNStiaWJpeGVvcm1VNWkzN3g3?=
 =?utf-8?B?TVZBanl1ZVN1UGhVNm44b21pWlB4UmxuSVoyWThBM2NIVU5aQklSc0JNMVNW?=
 =?utf-8?B?VGoxQTdkdHJmL0lIQ01SdzFDL3dXWXdrMXg4eFNjbWp1aGpsZ1N3R3JlQk9Y?=
 =?utf-8?B?Nk9BRG40bjVlZzZyNmV6QUp0UTJBbjNwdHFiVlZRa1lWNmNDc1ZNTlpNL3hS?=
 =?utf-8?B?VmhMa3ozUVVwYWFNVk05dU1GUlE4WGxQQkRkaTBMUjRXanBlRzBMQnFydVhx?=
 =?utf-8?B?SG81ZXVWY0VWNjMzY25TZk9MM2ZxT3lGWU5senk0S21YdjRlUUc3Z2dpTXd2?=
 =?utf-8?B?OTlsSGlIemhzTkE3OUt1cVg2bkwwZU8vMHNLWXlCMXhEeGpScVRXdmNrVCsz?=
 =?utf-8?B?T0xkeGNuTHU3UXd6VFJGUGhLMThySkc0WWZxbkJvSmJFOEFGOFE1bVpzM09t?=
 =?utf-8?B?VnhpMWFXci9qR05sWFYzNnZRSENmbWNOdURuMVVpcVBqNStSYm1hMXEwWHRJ?=
 =?utf-8?B?RW9LNlRqd2hlbjlDbFpjN0M1K2tFeXFFSklCa1hsM09LYVBrQk0ybkNSRlhr?=
 =?utf-8?Q?2/HDhrpN?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2021 11:49:16.1681 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: fe8c17fd-f1d1-4daa-01d5-08d8b16fedd5
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I7brQZptETP8L9dr4QNxoOFjyNi91YWwQDAxHg62npBXkf+URkTuVfkDGimNXT8P
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4551
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 Huang Rui <ray.huang@amd.com>, Dave Airlie <airlied@redhat.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMDQuMDEuMjEgdW0gMjI6MDYgc2NocmllYiBDaHJpc3RpYW4gS8O2bmlnOgo+IEFtIDA1LjAx
LjIxIHVtIDAwOjEzIHNjaHJpZWIgTHl1ZGUgUGF1bDoKPj4gUmVjZW50bHkgYSByZWdyZXNzaW9u
IHdhcyBpbnRyb2R1Y2VkIHdoaWNoIGNhdXNlZCBUVE0ncyBidWZmZXIgCj4+IGV2aWN0aW9uIHRv
Cj4+IGF0dGVtcHQgdG8gZXZpY3QgYWxyZWFkeS1waW5uZWQgQk9zLCBjYXVzaW5nIGlzc3VlcyB3
aXRoIGJ1ZmZlciBldmljdGlvbgo+PiB1bmRlciBtZW1vcnkgcHJlc3N1cmUgYWxvbmcgd2l0aCBz
dXNwZW5kL3Jlc3VtZToKPj4KPj4gwqDCoCBub3V2ZWF1IDAwMDA6MWY6MDAuMDogRFJNOiBldmlj
dGluZyBidWZmZXJzLi4uCj4+IMKgwqAgbm91dmVhdSAwMDAwOjFmOjAwLjA6IERSTTogTW92aW5n
IHBpbm5lZCBvYmplY3QgMDAwMDAwMDBjNDI4YzNmZiEKPj4gwqDCoCBub3V2ZWF1IDAwMDA6MWY6
MDAuMDogZmlmbzogZmF1bHQgMDAgW1JFQURdIGF0IDAwMDAwMDAwMDAyMDAwMDAgCj4+IGVuZ2lu
ZSAwNAo+PiDCoMKgIFtCQVIxXSBjbGllbnQgMDcgW0hVQi9IT1NUX0NQVV0gcmVhc29uIDAyIFtQ
VEVdIG9uIGNoYW5uZWwgLTEgCj4+IFswMGZmZWFhMDAwCj4+IMKgwqAgdW5rbm93bl0KPj4gwqDC
oCBub3V2ZWF1IDAwMDA6MWY6MDAuMDogZmlmbzogRFJPUFBFRF9NTVVfRkFVTFQgMDAwMDEwMDAK
Pj4gwqDCoCBub3V2ZWF1IDAwMDA6MWY6MDAuMDogZmlmbzogZmF1bHQgMDEgW1dSSVRFXSBhdCAw
MDAwMDAwMDAwMDIwMDAwIAo+PiBlbmdpbmUKPj4gwqDCoCAwYyBbSE9TVDZdIGNsaWVudCAwNyBb
SFVCL0hPU1RfQ1BVXSByZWFzb24gMDIgW1BURV0gb24gY2hhbm5lbCAxCj4+IMKgwqAgWzAwZmZi
MjgwMDAgRFJNXQo+PiDCoMKgIG5vdXZlYXUgMDAwMDoxZjowMC4wOiBmaWZvOiBjaGFubmVsIDE6
IGtpbGxlZAo+PiDCoMKgIG5vdXZlYXUgMDAwMDoxZjowMC4wOiBmaWZvOiBydW5saXN0IDA6IHNj
aGVkdWxlZCBmb3IgcmVjb3ZlcnkKPj4gwqDCoCBbVFRNXSBCdWZmZXIgZXZpY3Rpb24gZmFpbGVk
Cj4+IMKgwqAgbm91dmVhdSAwMDAwOjFmOjAwLjA6IERSTTogd2FpdGluZyBmb3Iga2VybmVsIGNo
YW5uZWxzIHRvIGdvIGlkbGUuLi4KPj4gwqDCoCBub3V2ZWF1IDAwMDA6MWY6MDAuMDogRFJNOiBm
YWlsZWQgdG8gaWRsZSBjaGFubmVsIDEgW0RSTV0KPj4gwqDCoCBub3V2ZWF1IDAwMDA6MWY6MDAu
MDogRFJNOiByZXN1bWluZyBkaXNwbGF5Li4uCj4+Cj4+IEFmdGVyIHNvbWUgYmlzZWN0aW9uIGFu
ZCBpbnZlc3RpZ2F0aW9uLCBpdCBhcHBlYXJzIHRoaXMgcmVzdWx0ZWQgZnJvbSAKPj4gdGhlCj4+
IHJlY2VudCBjaGFuZ2VzIHRvIHR0bV9ib19tb3ZlX3RvX2xydV90YWlsKCkuIFByZXZpb3VzbHkg
d2hlbiBhIGJ1ZmZlciAKPj4gd2FzCj4+IHBpbm5lZCwgdGhlIGJ1ZmZlciB3b3VsZCBiZSByZW1v
dmVkIGZyb20gdGhlIExSVSBvbmNlIHR0bV9ib191bnJlc2VydmUKPj4gdG8gbWFpbnRhaW4gdGhl
IExSVSBsaXN0IHdoZW4gcGlubmluZyBvciB1bnBpbm5pbmcgQk9zLiBIb3dldmVyLCBzaW5jZToK
Pj4KPj4gY29tbWl0IDNkMWE4OGUxMDUxZiAoImRybS90dG06IGNsZWFudXAgTFJVIGhhbmRsaW5n
IGZ1cnRoZXIiKQo+Pgo+PiBXZSd2ZSBiZWVuIGV4aXRpbmcgZnJvbSB0dG1fYm9fbW92ZV90b19s
cnVfdGFpbCgpIGF0IHRoZSB2ZXJ5IAo+PiBiZWdpbm5pbmcgb2YKPj4gdGhlIGZ1bmN0aW9uIGlm
IHRoZSBibyB3ZSdyZSBsb29raW5nIGF0IGlzIHBpbm5lZCwgcmVzdWx0aW5nIGluIHRoZSAKPj4g
cGlubmVkCj4+IEJPIG5ldmVyIGdldHRpbmcgcmVtb3ZlZCBmcm9tIHRoZSBscnUgYW5kIGFzIGEg
cmVzdWx0IC0gY2F1c2luZyAKPj4gaXNzdWVzIHdoZW4KPj4gaXQgZXZlbnR1YWxseSBiZWNvbWVz
IHRpbWUgZm9yIGV2aWN0aW9uLgo+Pgo+PiBTbywgbGV0J3MgZml4IHRoaXMgYnkgY2FsbGluZyB0
dG1fYm9fZGVsX2Zyb21fbHJ1KCkgZnJvbQo+PiB0dG1fYm9fbW92ZV90b19scnVfdGFpbCgpIGlu
IHRoZSBldmVudCB0aGF0IHdlJ3JlIGRlYWxpbmcgd2l0aCBhIHBpbm5lZAo+PiBidWZmZXIuCgo+
PiBBcyB3ZWxsLCBhZGQgYmFjayB0aGUgaHVua3MgaW4gdHRtX2JvX2RlbF9mcm9tX2xydSgpIHRo
YXQgd2VyZQo+PiByZW1vdmVkIHdoaWNoIGNoZWNrZWQgd2hldGhlciB3ZSB3YW50IHRvIGNhbGwK
Pj4gYmRldi0+ZHJpdmVyLT5kZWxfZnJvbV9scnVfbm90aWZ5KCkgb3Igbm90LiBXZSBkbyB0aGlz
IGxhc3QgcGFydCB0byAKPj4gYXZvaWQKPj4gY2FsbGluZyB0aGUgaG9vayB3aGVuIHRoZSBibyBp
biBxdWVzdGlvbiB3YXMgYWxyZWFkeSByZW1vdmVkIGZyb20gdGhlIAo+PiBMUlUuCgpJdCB0dXJu
ZWQgb3V0IHRoYXQgdGhpcyBpcyBub3QgY29ycmVjdCwgd2UgYWx3YXlzIHdhbnQgdG8gY2FsbCB0
aGUgCmNhbGxiYWNrIHdoZW5ldmVyIHdlIHdvdWxkIG1vdmUgdGhlIEJPIG9uIHRoZSBMUlUuCgpJ
J3ZlIG1vZGlmaWVkIHRoZSBwYXRjaCBhbmQgc2VuZCBpdCBvdXQgb25jZSBtb3JlLCBwbGVhc2Ug
cmV2aWV3LgoKVGhhbmtzLApDaHJpc3RpYW4uCgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBMeXVkZSBQ
YXVsIDxseXVkZUByZWRoYXQuY29tPgo+PiBGaXhlczogM2QxYTg4ZTEwNTFmICgiZHJtL3R0bTog
Y2xlYW51cCBMUlUgaGFuZGxpbmcgZnVydGhlciIpCj4+IENjOiBDaHJpc3RpYW4gS8O2bmlnIDxj
aHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4+IENjOiBEYXZlIEFpcmxpZSA8YWlybGllZEByZWRo
YXQuY29tPgo+Cj4gSSB3YXMgYWxyZWFkeSB3b3JraW5nIG9uIGEgZml4IGFzIHdlbGwsIGJ1dCB5
b3UgaGF2ZSBiZWVuIGZhc3RlciB0aGFuIAo+IG1lIDopCj4KPiBSZXZpZXdlZC1ieTogQ2hyaXN0
aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+Cj4gR29pbmcgdG8gcGljayB0
aGlzIHVwIGZvciBkcm0tbWlzYy1uZXh0IG9yIGRybS1taXNjLWZpeGVzIGluIGEgZmV3IAo+IG1p
bnV0ZXMuCj4KPiBUaGFua3MsCj4gQ2hyaXN0aWFuLgo+Cj4+IC0tLQo+PiDCoCBkcml2ZXJzL2dw
dS9kcm0vdHRtL3R0bV9iby5jIHwgMjAgKysrKysrKysrKysrKysrKy0tLS0KPj4gwqAgMSBmaWxl
IGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90
dG1fYm8uYwo+PiBpbmRleCAzMWU4YjNkYTU1NjMuLjBmMzczYjc4ZTdmYSAxMDA2NDQKPj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYwo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
dHRtL3R0bV9iby5jCj4+IEBAIC0xMTMsMTEgKzExMywxOCBAQCBzdGF0aWMgc3RydWN0IGtvYmpf
dHlwZSB0dG1fYm9fZ2xvYl9rb2JqX3R5cGXCoCA9IHsKPj4gwqAgc3RhdGljIHZvaWQgdHRtX2Jv
X2RlbF9mcm9tX2xydShzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvKQo+PiDCoCB7Cj4+IMKg
wqDCoMKgwqAgc3RydWN0IHR0bV9ib19kZXZpY2UgKmJkZXYgPSBiby0+YmRldjsKPj4gK8KgwqDC
oCBib29sIG5vdGlmeSA9IGZhbHNlOwo+PiDCoCAtwqDCoMKgIGxpc3RfZGVsX2luaXQoJmJvLT5z
d2FwKTsKPj4gLcKgwqDCoCBsaXN0X2RlbF9pbml0KCZiby0+bHJ1KTsKPj4gK8KgwqDCoCBpZiAo
IWxpc3RfZW1wdHkoJmJvLT5zd2FwKSkgewo+PiArwqDCoMKgwqDCoMKgwqAgbm90aWZ5ID0gdHJ1
ZTsKPj4gK8KgwqDCoMKgwqDCoMKgIGxpc3RfZGVsX2luaXQoJmJvLT5zd2FwKTsKPj4gK8KgwqDC
oCB9Cj4+ICvCoMKgwqAgaWYgKCFsaXN0X2VtcHR5KCZiby0+bHJ1KSkgewo+PiArwqDCoMKgwqDC
oMKgwqAgbm90aWZ5ID0gdHJ1ZTsKPj4gK8KgwqDCoMKgwqDCoMKgIGxpc3RfZGVsX2luaXQoJmJv
LT5scnUpOwo+PiArwqDCoMKgIH0KPj4gwqAgLcKgwqDCoCBpZiAoYmRldi0+ZHJpdmVyLT5kZWxf
ZnJvbV9scnVfbm90aWZ5KQo+PiArwqDCoMKgIGlmIChub3RpZnkgJiYgYmRldi0+ZHJpdmVyLT5k
ZWxfZnJvbV9scnVfbm90aWZ5KQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgYmRldi0+ZHJpdmVyLT5k
ZWxfZnJvbV9scnVfbm90aWZ5KGJvKTsKPj4gwqAgfQo+PiDCoCBAQCAtMTM4LDggKzE0NSwxMyBA
QCB2b2lkIHR0bV9ib19tb3ZlX3RvX2xydV90YWlsKHN0cnVjdCAKPj4gdHRtX2J1ZmZlcl9vYmpl
Y3QgKmJvLAo+PiDCoCDCoMKgwqDCoMKgIGRtYV9yZXN2X2Fzc2VydF9oZWxkKGJvLT5iYXNlLnJl
c3YpOwo+PiDCoCAtwqDCoMKgIGlmIChiby0+cGluX2NvdW50KQo+PiArwqDCoMKgIC8qIFBpbm5l
ZCBib3Mgd2lsbCBoYXZlIGJlZW4gYWRkZWQgdG8gdGhlIExSVSBiZWZvcmUgdGhleSB3ZXJlIAo+
PiBwaW5uZWQsIHNvIG1ha2Ugc3VyZSB3ZQo+PiArwqDCoMKgwqAgKiBhbHdheXMgcmVtb3ZlIHRo
ZW0gaGVyZQo+PiArwqDCoMKgwqAgKi8KPj4gK8KgwqDCoCBpZiAoYm8tPnBpbl9jb3VudCkgewo+
PiArwqDCoMKgwqDCoMKgwqAgdHRtX2JvX2RlbF9mcm9tX2xydShibyk7Cj4+IMKgwqDCoMKgwqDC
oMKgwqDCoCByZXR1cm47Cj4+ICvCoMKgwqAgfQo+PiDCoCDCoMKgwqDCoMKgIG1hbiA9IHR0bV9t
YW5hZ2VyX3R5cGUoYmRldiwgbWVtLT5tZW1fdHlwZSk7Cj4+IMKgwqDCoMKgwqAgbGlzdF9tb3Zl
X3RhaWwoJmJvLT5scnUsICZtYW4tPmxydVtiby0+cHJpb3JpdHldKTsKPgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
