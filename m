Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE8D2DB4E9
	for <lists+dri-devel@lfdr.de>; Tue, 15 Dec 2020 21:19:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F8B489317;
	Tue, 15 Dec 2020 20:19:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2058.outbound.protection.outlook.com [40.107.244.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0E9B89322;
 Tue, 15 Dec 2020 20:19:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W6WGnzKVH+Ec+X3Mfgd7wd0j5JI4Z+L9+S+LE34sKD/QE6Wzv3IJB/uIz7yUKYJ7H2Y0jM/jtVeLTPmtT4Jzd0tzkEWU1Up9btoMhdOIPg87ElQ6bxzFedCyn/W7953182lFRC2KX5GTzm5GM108HI4Be/KnJ+mWpbQaYu+mUTzE7vl4rScvie1focCRVK8xVunPE6dqy2je/q/psv7J9PEQ/sPyjjQ3X20GJqcsoHYFEusDozIr3yH2aiF0A8a5YxAydlC5N/vwYBqU8ppp4vn8kLMAWLXLkhkvgtZo5YRWvbIDtyXxF1E+5R+M1zOcgw+152fviEtYd5ZDD5JLkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VR+CcG5cNB86laOFrRe/OTJptsaNFc+7fu4U7xSWFf8=;
 b=aJxlBKz+6TYcFscaXNN25zTjXjStgsiSXT3+K1xIsMdlvI+M7ScAJn5OKnXCt2XQv27p87y1oSPFoH75dSJ5ctFK0HZafi9y+kzn7O8ySFz9cLsPK3nK99BEneNHWKnre46aoGi1dNskx1LiEbDV0H3x6QtpI51yJUE7LRuk5Sc/awwndmAXkLgs7vkGgaIruBbjsrKeAuH6aHsAbZ+m3fksNF5PjW9uw5LsmNiFaIwbG3/TPt6k95lZm4xMU6xcSZtuyNi7Cy1qaAXgzTKLrVdDwbgrDrR8fRsCDRRNm432Pxtr/Gw7p0IPqtn1IzqwTqkVmCbJZ4UzipvQXK1y9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VR+CcG5cNB86laOFrRe/OTJptsaNFc+7fu4U7xSWFf8=;
 b=Jz5hn4FW0kdRT2jf/jFLyg2dOsKOYxt26x0EShYQIOXEkrxHSvXtIPAEJH6WU2cwfzbYR5wLu0ALfqv4sfq96aKeJEnzrn5EaDCEjNTMdBbI3QVPmVZ2ki6sRL8RBlkMTw/Mp+XPder20PUBI4u4QDu3YaCgOqsq3318IwVZeno=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from MWHPR12MB1664.namprd12.prod.outlook.com (2603:10b6:301:b::15)
 by MWHPR1201MB2493.namprd12.prod.outlook.com (2603:10b6:300:ec::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.17; Tue, 15 Dec
 2020 20:19:03 +0000
Received: from MWHPR12MB1664.namprd12.prod.outlook.com
 ([fe80::1d8a:6f7b:1bb1:28bb]) by MWHPR12MB1664.namprd12.prod.outlook.com
 ([fe80::1d8a:6f7b:1bb1:28bb%4]) with mapi id 15.20.3654.025; Tue, 15 Dec 2020
 20:19:02 +0000
Subject: Re: [PATCH v3 05/12] drm/ttm: Expose ttm_tt_unpopulate for driver use
To: christian.koenig@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, daniel.vetter@ffwll.ch, robh@kernel.org,
 l.stach@pengutronix.de, yuq825@gmail.com, eric@anholt.net
References: <1605936082-3099-1-git-send-email-andrey.grodzovsky@amd.com>
 <1605936082-3099-6-git-send-email-andrey.grodzovsky@amd.com>
 <28332cf0-612c-10bd-c64e-fff6e1f18653@gmail.com>
 <320ff94c-78f4-b9a5-4c6f-40f7ce162bd3@amd.com>
 <41b35672-2dd6-13e2-8383-c65279fdb648@gmail.com>
 <e2f4f1dc-2a2a-face-87b2-6d61ed7d3305@amd.com>
 <01280cba-56b8-77c6-b40f-d7e69a5ad4c6@amd.com>
 <0ceca974-80f8-feb3-d5e9-5182f35bb2c4@amd.com>
 <20288c45-270c-3ed7-2ac4-eeb6e5c50776@amd.com>
 <2df98c1a-8ed4-fb87-f8f7-e3962e8d9c52@amd.com>
 <041210e5-e237-b72e-dcbc-17027d057c55@gmail.com>
From: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
Message-ID: <1fa4dd77-deec-aa7b-7499-0537e9a01919@amd.com>
Date: Tue, 15 Dec 2020 15:18:59 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
In-Reply-To: <041210e5-e237-b72e-dcbc-17027d057c55@gmail.com>
Content-Language: en-US
X-Originating-IP: [2607:fea8:3edf:49b0:1a8:981c:b82c:9d66]
X-ClientProxiedBy: BN9PR03CA0116.namprd03.prod.outlook.com
 (2603:10b6:408:fd::31) To MWHPR12MB1664.namprd12.prod.outlook.com
 (2603:10b6:301:b::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:1a8:981c:b82c:9d66]
 (2607:fea8:3edf:49b0:1a8:981c:b82c:9d66) by
 BN9PR03CA0116.namprd03.prod.outlook.com (2603:10b6:408:fd::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.12 via Frontend Transport; Tue, 15 Dec 2020 20:19:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 5098d430-e192-4890-d35c-08d8a136aa2d
X-MS-TrafficTypeDiagnostic: MWHPR1201MB2493:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR1201MB24931E29A1A1257E180E94B7EAC60@MWHPR1201MB2493.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yNacwjOesYw9tQYhmIUV+Pu8YPQHlYYInclThB1khS5/Z4mL/EDgVy6+O8XRuWIQyS4xm2lF4GyKL+Fj1S8t5K7qVNKhMjo6G/z1I7OCUT6Upz4eTczlTDOzUVzORa3h3bmKu3DWGNrM31tW7qnh5D4KkVx4L+b5edZGXO6IwhNCVRvP+A4hO3SGhqYgSrYNU0zqlrfwCS8b/h/9rx5tIyWfoKcFidJkQekmpigQ4cbwZm29qPKge4XJsCBrTcL3NIK8eP0KaUZ0MZtXozCep9shyblsKjWH7FosUM9jhct8V4DBA6mf7oho6brz78m/3rG5u+oqOPw+M3Vc9V+miFiT9vB5fTsMZdAukRqha8ERKwTQPSdYg94OxEVcDA6+cQh5VoK3z6Z/MLOKbSWq5iowU+p9YdFHVEEv5DuFmPgRLzTAFxU3Rz6CceL67ChB
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR12MB1664.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(366004)(136003)(8936002)(86362001)(6486002)(508600001)(186003)(5660300002)(66476007)(66574015)(2616005)(16526019)(36756003)(4326008)(31696002)(53546011)(66556008)(34490700003)(66946007)(52116002)(83380400001)(8676002)(2906002)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Qkp0ZHFYc1habHhram5QV2xacXN1WnBnaTkrRnZ2UDRhUGhicjR2NGNBYzVP?=
 =?utf-8?B?Q0sxWndlcks2WXlQV00wK1FuK1JXZDVNQlM0WVd6STIrMG9QUGNnaFQ3VDNU?=
 =?utf-8?B?Tis3aE1SNVJXK2ttYkZ2MnFCajM1aFpFM1RvVzFNR0dacWFHNnZUNGtsUjg2?=
 =?utf-8?B?MFM2NXkxSHowbGs5a0ZCMFRpMXBBKytvUDZGWFl3RTR0WjJpcVlya3hhMFNv?=
 =?utf-8?B?MUYwQm5yR3c3N2M2c2o4RlRJK204ai9ZenlJejFtWVlsRi93MmNRVU5rbmdC?=
 =?utf-8?B?enFsK3F4aHIvRGJOYnVxMEVvN1h0dUVmUmt5STVmY2NuWjJlN0VVTWhySk1R?=
 =?utf-8?B?ZTFJZTRFVFBJQ3c2KzJINGRVNUMzUm5JbVZTcWJTTVk2Z2wvVXQ1ZFl2eElL?=
 =?utf-8?B?bjdmSEtURmxjbG1TU0IyOFF1WnRHUVZrRkt2cmxjd3o3Rk9haDhzRjVrNzM0?=
 =?utf-8?B?b0RCRTdJZm9sNWZuU1JnamRoVHZpYlFGN3pEZU1hMzdEMkx4VlFNTVBKZmtu?=
 =?utf-8?B?TTNSc2prUmhCT2dTSXFVL3lKQUxmY0YyNVFiYkJSckVubHRtc3dORmwwbzhz?=
 =?utf-8?B?TWt1SnNkcTZGaWVkUDYrN3JWMThCbFNxSmNnT0w1YlVpN3FUVWJRRmNzS0NN?=
 =?utf-8?B?OXl0YVRKbjJxSnEzTFJHRmNIc0Q0OU5xVnpET0dmWktIMlduL25CWnY0emZM?=
 =?utf-8?B?WktubHZyL3BxMTJ3Z1V2aEtEaFdRejZaMldUNzIyR0pwdFo2L0d5LzVxSFlR?=
 =?utf-8?B?NTFzTnlRa1BnRVlLY3dEdjhtUEdRYklnb0ZNNTN4VmhpZUc3UWx4ZGFQTU1Y?=
 =?utf-8?B?Q2JtWCtWTVp0ODROdTBVZ202dE5UMlcvT3VidGxqNlVBSmpQOGkweWlZUTNK?=
 =?utf-8?B?UlBWMEpzT0tTUGZjZWhMUndIZW90L0ZHWVY1R0JweWk1RzBRdllBaXJTL2s0?=
 =?utf-8?B?emV0aDVBRzI2MzYyMVFtUTVjS2Vjd2xKS21ueHcveW1KZ05ncXYrWDRtQmlZ?=
 =?utf-8?B?RXoyaExsTmd1YXVZYndveVhFdk1UVzdCNmJhcEQrTTNJcHdtNWdYMkZsRWJt?=
 =?utf-8?B?VGM0Y2tSNEhJQTNheE1IUlBMb1Y3V1NEMWpTck40YVFZZkRuOW04aHNxbWdl?=
 =?utf-8?B?eGVSQ0k4aldiTEpteUJOZTFuQSt0cXVKUUlwa2JUbTlkN1pJdFF1UGdnZEM1?=
 =?utf-8?B?bnJMU21ZVWoyT1BFZzRBcUdML2ptRzgrU3hPRDdzcmlwRWVBZDZVbG1ZcjZW?=
 =?utf-8?B?ZURBYWdHZE4yNVJtOUF0Z3lWUXhwSHBEcXVWUWxBaG95cCsrcGFaS3JSelFw?=
 =?utf-8?B?ZDI0S1E1TDZrNWJPS2hHQ2FIMExBajFvVERDRm1mTWoycFRrZzBFS2J1cWNm?=
 =?utf-8?B?NzBWalpPQkFpeUQvR0NRUlRNMTVzVU5vZERweE1LZzRRaUR0bmRNSG56L0Nv?=
 =?utf-8?Q?CAn8TXP8?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: MWHPR12MB1664.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2020 20:19:02.6941 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: 5098d430-e192-4890-d35c-08d8a136aa2d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YwMWcxP2064g5A5zA1BCAljnOYgSu04SD2vYIODbwrjcZcwY11p5Ff6EfuUMWSfnMxFHAjtTIze5OYbPh6nYJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB2493
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
Cc: Alexander.Deucher@amd.com, gregkh@linuxfoundation.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDExLzI0LzIwIDExOjQ0IEFNLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+IEFtIDI0LjEx
LjIwIHVtIDE3OjIyIHNjaHJpZWIgQW5kcmV5IEdyb2R6b3Zza3k6Cj4+Cj4+IE9uIDExLzI0LzIw
IDI6NDEgQU0sIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4+PiBBbSAyMy4xMS4yMCB1bSAyMjow
OCBzY2hyaWViIEFuZHJleSBHcm9kem92c2t5Ogo+Pj4+Cj4+Pj4gT24gMTEvMjMvMjAgMzo0MSBQ
TSwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPj4+Pj4gQW0gMjMuMTEuMjAgdW0gMjE6Mzggc2No
cmllYiBBbmRyZXkgR3JvZHpvdnNreToKPj4+Pj4+Cj4+Pj4+PiBPbiAxMS8yMy8yMCAzOjIwIFBN
LCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+Pj4+Pj4+IEFtIDIzLjExLjIwIHVtIDIxOjA1IHNj
aHJpZWIgQW5kcmV5IEdyb2R6b3Zza3k6Cj4+Pj4+Pj4+Cj4+Pj4+Pj4+IE9uIDExLzI1LzIwIDU6
NDIgQU0sIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4+Pj4+Pj4+PiBBbSAyMS4xMS4yMCB1bSAw
NjoyMSBzY2hyaWViIEFuZHJleSBHcm9kem92c2t5Ogo+Pj4+Pj4+Pj4+IEl0J3MgbmVlZGVkIHRv
IGRyb3AgaW9tbXUgYmFja2VkIHBhZ2VzIG9uIGRldmljZSB1bnBsdWcKPj4+Pj4+Pj4+PiBiZWZv
cmUgZGV2aWNlJ3MgSU9NTVUgZ3JvdXAgaXMgcmVsZWFzZWQuCj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4g
SXQgd291bGQgYmUgY2xlYW5lciBpZiB3ZSBjb3VsZCBkbyB0aGUgd2hvbGUgaGFuZGxpbmcgaW4g
VFRNLiBJIGFsc28gCj4+Pj4+Pj4+PiBuZWVkIHRvIGRvdWJsZSBjaGVjayB3aGF0IHlvdSBhcmUg
ZG9pbmcgd2l0aCB0aGlzIGZ1bmN0aW9uLgo+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+IENocmlzdGlhbi4K
Pj4+Pj4+Pj4KPj4+Pj4+Pj4KPj4+Pj4+Pj4gQ2hlY2sgcGF0Y2ggImRybS9hbWRncHU6IFJlZ2lz
dGVyIElPTU1VIHRvcG9sb2d5IG5vdGlmaWVyIHBlciBkZXZpY2UuIiAKPj4+Pj4+Pj4gdG8gc2Vl
Cj4+Pj4+Pj4+IGhvdyBpIHVzZSBpdC4gSSBkb24ndCBzZWUgd2h5IHRoaXMgc2hvdWxkIGdvIGlu
dG8gVFRNIG1pZC1sYXllciAtIHRoZSAKPj4+Pj4+Pj4gc3R1ZmYgSSBkbyBpbnNpZGUKPj4+Pj4+
Pj4gaXMgdmVuZG9yIHNwZWNpZmljIGFuZCBhbHNvIEkgZG9uJ3QgdGhpbmsgVFRNIGlzIGV4cGxp
Y2l0bHkgYXdhcmUgb2YgCj4+Pj4+Pj4+IElPTU1VID8KPj4+Pj4+Pj4gRG8geW91IG1lYW4geW91
IHByZWZlciB0aGUgSU9NTVUgbm90aWZpZXIgdG8gYmUgcmVnaXN0ZXJlZCBmcm9tIHdpdGhpbiBU
VE0KPj4+Pj4+Pj4gYW5kIHRoZW4gdXNlIGEgaG9vayB0byBjYWxsIGludG8gdmVuZG9yIHNwZWNp
ZmljIGhhbmRsZXIgPwo+Pj4+Pj4+Cj4+Pj4+Pj4gTm8sIHRoYXQgaXMgcmVhbGx5IHZlbmRvciBz
cGVjaWZpYy4KPj4+Pj4+Pgo+Pj4+Pj4+IFdoYXQgSSBtZWFudCBpcyB0byBoYXZlIGEgZnVuY3Rp
b24gbGlrZSB0dG1fcmVzb3VyY2VfbWFuYWdlcl9ldmljdF9hbGwoKSAKPj4+Pj4+PiB3aGljaCB5
b3Ugb25seSBuZWVkIHRvIGNhbGwgYW5kIGFsbCB0dCBvYmplY3RzIGFyZSB1bnBvcHVsYXRlZC4K
Pj4+Pj4+Cj4+Pj4+Pgo+Pj4+Pj4gU28gaW5zdGVhZCBvZiB0aGlzIEJPIGxpc3QgaSBjcmVhdGUg
YW5kIGxhdGVyIGl0ZXJhdGUgaW4gYW1kZ3B1IGZyb20gdGhlIAo+Pj4+Pj4gSU9NTVUgcGF0Y2gg
eW91IGp1c3Qgd2FudCB0byBkbyBpdCB3aXRoaW4KPj4+Pj4+IFRUTSB3aXRoIGEgc2luZ2xlIGZ1
bmN0aW9uID8gTWFrZXMgbXVjaCBtb3JlIHNlbnNlLgo+Pj4+Pgo+Pj4+PiBZZXMsIGV4YWN0bHku
Cj4+Pj4+Cj4+Pj4+IFRoZSBsaXN0X2VtcHR5KCkgY2hlY2tzIHdlIGhhdmUgaW4gVFRNIGZvciB0
aGUgTFJVIGFyZSBhY3R1YWxseSBub3QgdGhlIAo+Pj4+PiBiZXN0IGlkZWEsIHdlIHNob3VsZCBu
b3cgY2hlY2sgdGhlIHBpbl9jb3VudCBpbnN0ZWFkLiBUaGlzIHdheSB3ZSBjb3VsZCAKPj4+Pj4g
YWxzbyBoYXZlIGEgbGlzdCBvZiB0aGUgcGlubmVkIEJPcyBpbiBUVE0uCj4+Pj4KPj4+Pgo+Pj4+
IFNvIGZyb20gbXkgSU9NTVUgdG9wb2xvZ3kgaGFuZGxlciBJIHdpbGwgaXRlcmF0ZSB0aGUgVFRN
IExSVSBmb3IgdGhlIAo+Pj4+IHVucGlubmVkIEJPcyBhbmQgdGhpcyBuZXcgZnVuY3Rpb24gZm9y
IHRoZSBwaW5uZWQgb25lc8KgID8KPj4+PiBJdCdzIHByb2JhYmx5IGEgZ29vZCBpZGVhIHRvIGNv
bWJpbmUgYm90aCBpdGVyYXRpb25zIGludG8gdGhpcyBuZXcgZnVuY3Rpb24gCj4+Pj4gdG8gY292
ZXIgYWxsIHRoZSBCT3MgYWxsb2NhdGVkIG9uIHRoZSBkZXZpY2UuCj4+Pgo+Pj4gWWVzLCB0aGF0
J3Mgd2hhdCBJIGhhZCBpbiBteSBtaW5kIGFzIHdlbGwuCj4+Pgo+Pj4+Cj4+Pj4KPj4+Pj4KPj4+
Pj4gQlRXOiBIYXZlIHlvdSB0aG91Z2h0IGFib3V0IHdoYXQgaGFwcGVucyB3aGVuIHdlIHVucG9w
dWxhdGUgYSBCTyB3aGlsZSB3ZSAKPj4+Pj4gc3RpbGwgdHJ5IHRvIHVzZSBhIGtlcm5lbCBtYXBw
aW5nIGZvciBpdD8gVGhhdCBjb3VsZCBoYXZlIHVuZm9yZXNlZW4gCj4+Pj4+IGNvbnNlcXVlbmNl
cy4KPj4+Pgo+Pj4+Cj4+Pj4gQXJlIHlvdSBhc2tpbmcgd2hhdCBoYXBwZW5zIHRvIGttYXAgb3Ig
dm1hcCBzdHlsZSBtYXBwZWQgQ1BVIGFjY2Vzc2VzIG9uY2UgCj4+Pj4gd2UgZHJvcCBhbGwgdGhl
IERNQSBiYWNraW5nIHBhZ2VzIGZvciBhIHBhcnRpY3VsYXIgQk8gPyBCZWNhdXNlIGZvciB1c2Vy
IAo+Pj4+IG1hcHBpbmdzCj4+Pj4gKG1tYXApIHdlIHRvb2sgY2FyZSBvZiB0aGlzIHdpdGggZHVt
bXkgcGFnZSByZXJvdXRlIGJ1dCBpbmRlZWQgbm90aGluZyB3YXMgCj4+Pj4gZG9uZSBmb3IgaW4g
a2VybmVsIENQVSBtYXBwaW5ncy4KPj4+Cj4+PiBZZXMgZXhhY3RseSB0aGF0Lgo+Pj4KPj4+IElu
IG90aGVyIHdvcmRzIHdoYXQgaGFwcGVucyBpZiB3ZSBmcmVlIHRoZSByaW5nIGJ1ZmZlciB3aGls
ZSB0aGUga2VybmVsIAo+Pj4gc3RpbGwgd3JpdGVzIHRvIGl0Pwo+Pj4KPj4+IENocmlzdGlhbi4K
Pj4KPj4KPj4gV2hpbGUgd2UgY2FuJ3QgY29udHJvbCB1c2VyIGFwcGxpY2F0aW9uIGFjY2Vzc2Vz
IHRvIHRoZSBtYXBwZWQgYnVmZmVycyAKPj4gZXhwbGljaXRseSBhbmQgaGVuY2Ugd2UgdXNlIHBh
Z2UgZmF1bHQgcmVyb3V0aW5nCj4+IEkgYW0gdGhpbmtpbmcgdGhhdCBpbiB0aGlzwqAgY2FzZSB3
ZSBtYXkgYmUgYWJsZSB0byBzcHJpbmtsZSAKPj4gZHJtX2Rldl9lbnRlci9leGl0IGluIGFueSBz
dWNoIHNlbnNpdGl2ZSBwbGFjZSB3ZXJlIHdlIG1pZ2h0Cj4+IENQVSBhY2Nlc3MgYSBETUEgYnVm
ZmVyIGZyb20gdGhlIGtlcm5lbCA/Cj4KPiBZZXMsIEkgZmVhciB3ZSBhcmUgZ29pbmcgdG8gbmVl
ZCB0aGF0Lgo+Cj4+IFRoaW5ncyBsaWtlIENQVSBwYWdlIHRhYmxlIHVwZGF0ZXMsIHJpbmcgYnVm
ZmVyIGFjY2Vzc2VzIGFuZCBGVyBtZW1jcHkgPyBJcyAKPj4gdGhlcmUgb3RoZXIgcGxhY2VzID8K
Pgo+IFB1aCwgZ29vZCBxdWVzdGlvbi4gSSBoYXZlIG5vIGlkZWEuCj4KPj4gQW5vdGhlciBwb2lu
dCBpcyB0aGF0IGF0IHRoaXMgcG9pbnQgdGhlIGRyaXZlciBzaG91bGRuJ3QgYWNjZXNzIGFueSBz
dWNoIAo+PiBidWZmZXJzIGFzIHdlIGFyZSBhdCB0aGUgcHJvY2VzcyBmaW5pc2hpbmcgdGhlIGRl
dmljZS4KPj4gQUZBSUsgdGhlcmUgaXMgbm8gcGFnZSBmYXVsdCBtZWNoYW5pc20gZm9yIGtlcm5l
bCBtYXBwaW5ncyBzbyBJIGRvbid0IHRoaW5rIAo+PiB0aGVyZSBpcyBhbnl0aGluZyBlbHNlIHRv
IGRvID8KPgo+IFdlbGwgdGhlcmUgaXMgYSBwYWdlIGZhdWx0IGhhbmRsZXIgZm9yIGtlcm5lbCBt
YXBwaW5ncywgYnV0IHRoYXQgb25lIGp1c3QgCj4gcHJpbnRzIHRoZSBzdGFjayB0cmFjZSBpbnRv
IHRoZSBzeXN0ZW0gbG9nIGFuZCBjYWxscyBCVUcoKTsgOikKPgo+IExvbmcgc3Rvcnkgc2hvcnQg
d2UgbmVlZCB0byBhdm9pZCBhbnkgYWNjZXNzIHRvIHJlbGVhc2VkIHBhZ2VzIGFmdGVyIHVucGx1
Zy4gCj4gTm8gbWF0dGVyIGlmIGl0J3MgZnJvbSB0aGUga2VybmVsIG9yIHVzZXJzcGFjZS4KCgpJ
IHdhcyBqdXN0IGFib3V0IHRvIHN0YXJ0IGd1YXJkaW5nIHdpdGggZHJtX2Rldl9lbnRlci9leGl0
IENQVSBhY2Nlc3NlcyBmcm9tIAprZXJuZWwgdG8gR1RUIG90IFZSQU0gYnVmZmVycyBidXQgdGhl
biBpIGxvb2tlZCBtb3JlIGluIHRoZSBjb2RlCmFuZCBzZWVtcyBsaWtlIHR0bV90dF91bnBvcHVs
YXRlIGp1c3QgZGVsZXRlcyBETUEgbWFwcGluZ3MgKGZvciB0aGUgc2FrZSBvZiAKZGV2aWNlIHRv
IG1haW4gbWVtb3J5IGFjY2VzcykuIEtlcm5lbCBwYWdlIHRhYmxlIGlzIG5vdCB0b3VjaGVkCnVu
dGlsIGxhc3QgYm8gcmVmY291bnQgaXMgZHJvcHBlZCBhbmQgdGhlIGJvIGlzIHJlbGVhc2VkIAoo
dHRtX2JvX3JlbGVhc2UtPmRlc3Ryb3ktPmFtZGdwdV9ib19kZXN0cm95LT5hbWRncHVfYm9fa3Vu
bWFwKS4gVGhpcyBpcyBib3RoCmZvciBHVFQgQk9zIG1hcGVkIHRvIGtlcm5lbCBieSBrbWFwIChv
ciB2bWFwKSBhbmQgZm9yIFZSQU0gQk9zIG1hcHBlZCBieSAKaW9yZW1hcC4gU28gYXMgaSBzZWUg
aXQsIG5vdGhpbmcgd2lsbCBiYWQgd2lsbCBoYXBwZW4gYWZ0ZXIgd2UKdW5wb3B1bGF0ZSBhIEJP
IHdoaWxlIHdlIHN0aWxsIHRyeSB0byB1c2UgYSBrZXJuZWwgbWFwcGluZyBmb3IgaXQsIHN5c3Rl
bSBtZW1vcnkgCnBhZ2VzIGJhY2tpbmcgR1RUIEJPcyBhcmUgc3RpbGwgbWFwcGVkIGFuZCBub3Qg
ZnJlZWQgYW5kIGZvcgpWUkFNIEJPcyBzYW1lIGlzIGZvciB0aGUgSU8gcGh5c2ljYWwgcmFuZ2Vz
IG1hcHBlZCBpbnRvIHRoZSBrZXJuZWwgcGFnZSB0YWJsZSAKc2luY2UgaW91bm1hcCB3YXNuJ3Qg
Y2FsbGVkIHlldC4gSSBsb2FkZWQgdGhlIGRyaXZlciB3aXRoIHZtX3VwZGF0ZV9tb2RlPTMKbWVh
bmluZyBhbGwgVk0gdXBkYXRlcyBkb25lIHVzaW5nIENQVSBhbmQgaGFzbid0IHNlZW4gYW55IE9P
UHMgYWZ0ZXIgcmVtb3ZpbmcgCnRoZSBkZXZpY2UuIEkgZ3Vlc3MgaSBjYW4gdGVzdCBpdCBtb3Jl
IGJ5IGFsbG9jYXRpbmcgR1RUIGFuZCBWUkFNIEJPcwphbmQgdHJ5aW5nIHRvIHJlYWQvd3JpdGUg
dG8gdGhlbSBhZnRlciBkZXZpY2UgaXMgcmVtb3ZlZC4KCkFuZHJleQoKCj4KPiBSZWdhcmRzLAo+
IENocmlzdGlhbi4KPgo+Pgo+PiBBbmRyZXkKPgo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbAo=
