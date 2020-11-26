Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C772C53CB
	for <lists+dri-devel@lfdr.de>; Thu, 26 Nov 2020 13:16:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C1FF6E8F5;
	Thu, 26 Nov 2020 12:16:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700071.outbound.protection.outlook.com [40.107.70.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C70EB6E8EC;
 Thu, 26 Nov 2020 12:16:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bs4Iplg6UI+8wYE8Q7AoYn+P/1+Z8clTN0tc740FrqM41MvX6rI5lTZQpupPO0Ai1Je5QTdAPWT4aEeIjkJhWwi56/t13CHDlcyvWTvpYHNZAGVEuznWsLO4gUE9Sg/3HvOJQZPoOZQG2xxjiL5Rw0/3dQhiD7QzC9kSn/1sPPcVCrVhmjto6P1jePfbAutEKRg8ELlZfCqNyrQs+nHmDE0QL4yRETFGeGqLU+OZZSsm9kXLpoGu9uY+PecM+DjCc8QM4LPa/lTs/+1ZOQsoMLhC8mKrRCS8b16w4j/dtxzowLZZjls4cHKrPZcschwdHHKY9jsN/U2802KDLShBJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PKm7r+ojsD3Q/woOc9MNLomDu4FEHpncvVeKQExtleA=;
 b=JePmo+kJ004iV6V6RdQDhHSFPPiJ0E4nSspnn6LI/TsNhtEa9WrtMJKIQbFs/Zf3DABbWO9MZvUmiSA1jVMGpbmXM5unvviWA7SQFi90DzDXbUBp9Mktb1xuafrTFbT5Gz/hV4X1T/W5UpA0uKKt5/jsxhxiDIsycZaa1M9fhL9vva8iBa3Dn7szfvTzliiFXbaI3dJaBv1QplngA8mFB4CtvDtHfKDQIojIoqWs6Jful6N+1MZbxWmQJHUqHx/p9KsVTHHygcUxD8bLuRW2VCyJ7/COI/jiXdmH8juXpJk+mepm7z0X3+wJPSwHdPN3zQWUsA5xe4LtUlXqXs9qMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PKm7r+ojsD3Q/woOc9MNLomDu4FEHpncvVeKQExtleA=;
 b=jc/wYBBoG05Xj6aXs4fprc4yyv47UykINe6xZFotE/BOa3oq56czR/D17gjfxiH2D3urRNH5Iceh+p3C/MC3SHzTsXzsd94Bf/XA8YVKJLyEyQEOKP5p39kZdMFwJ/IA+dshhMey3vNdUWaQx+dRLDVQekA7AWZmFx6qUhTBNqg=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB2386.namprd12.prod.outlook.com (2603:10b6:207:47::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.25; Thu, 26 Nov
 2020 12:16:11 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::1ccc:8a9a:45d3:dd31]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::1ccc:8a9a:45d3:dd31%7]) with mapi id 15.20.3589.032; Thu, 26 Nov 2020
 12:16:11 +0000
Subject: Re: [PATCH 4/7] drm/radeon: Pin buffers while they are vmap'ed
To: Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel@ffwll.ch>
References: <d1508c4f-df3e-fa3c-3071-d8a58295e674@suse.de>
 <cbfa3e8d-81a3-5620-d4fc-72188cfb42ee@amd.com>
 <6d2ee787-0bf5-de1d-73af-7c87bad63cda@suse.de>
 <2431a0e1-7159-b3e7-e1ca-3e7f55c38d8a@amd.com>
 <b356ee3d-64bd-30c9-23f6-dea3a1b87bea@suse.de>
 <20201124140937.GK401619@phenom.ffwll.local>
 <278a4498-bdde-402a-1cea-668e9683f7eb@suse.de>
 <2f8a252a-5413-4b75-a367-f6233121e36e@amd.com>
 <20201125103645.GU401619@phenom.ffwll.local>
 <fd9dff4a-ec16-46d8-d892-b06dad5c11d3@suse.de>
 <20201125163251.GY401619@phenom.ffwll.local>
 <75385451-7969-e199-1a8e-f29fd08d5043@suse.de>
 <CAKMK7uGfaHdTOEBPmeNiFWz2GVb4C+-cYO7SkJsyQCsa-sCZ5Q@mail.gmail.com>
 <1cad6728-ca8b-80c6-55a8-b75d4c7a8a60@suse.de>
 <4dd0d521-908c-db23-d8b2-6d3a80a2bff3@amd.com>
 <16453932-6a1d-0f93-f887-c96f4688b7bb@suse.de>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <6db9285e-393c-1da5-a10c-3ce952c6230e@amd.com>
Date: Thu, 26 Nov 2020 13:16:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <16453932-6a1d-0f93-f887-c96f4688b7bb@suse.de>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM0P190CA0010.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:208:190::20) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0P190CA0010.EURP190.PROD.OUTLOOK.COM (2603:10a6:208:190::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3611.20 via Frontend Transport; Thu, 26 Nov 2020 12:16:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 38d44428-1cc3-48c3-2c56-08d892050fc1
X-MS-TrafficTypeDiagnostic: BL0PR12MB2386:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB2386026B3FB1569225D16F6383F90@BL0PR12MB2386.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SXK3+I31ng6wg6ux89V0DWzznybGDhHVFrA5txHrqjDpYzUx8rPURal5S83LtuKzACsCRX7CZIQ4I+PGnjBRdgUMTfv5plTzkN1f1vvLnHXA7jkjqL5X2Cl6WyTiF7AFctkJnTz1H1MgKrB4uFJuEXbwDJEayUySiROOmuFlu74TQctb30FWxvey7ngzLmuRqi65b0QdxVbaIP76vwqTZGlErqz9u6S/l/sEaTKCcbQ/nMtyMu4atWUZJJxZmERhhRoJKWRAZrrG3ioeVK0n0BICLtCl2xOA6QuxYlf8c8xP69MvLCuQmSNOlx69onpew5QbBVUvpiCkYeb3M4jl5y2amAcfvB66yLWeTTqqIKgV5dg59FROBX4QaQwuI3ZujWASrrgZ+9SJfzDSCkpfl2zmTXGWoucUuHMKned8/r8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(39860400002)(136003)(366004)(376002)(4326008)(54906003)(83380400001)(2616005)(66946007)(31696002)(186003)(66556008)(8936002)(110136005)(2906002)(966005)(66476007)(66574015)(6666004)(8676002)(5660300002)(31686004)(86362001)(316002)(478600001)(36756003)(52116002)(16526019)(6486002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MnJmVkdEODc4VGtia1AvU1FoUjkrY09FUFFwaXludDE3RTJKazIyaWhnc2JM?=
 =?utf-8?B?RUxvV3RDV21zai9CdUlDQW1RMURsVVpueUdtbU5sRDJIakFxK0FXUFB4SEZr?=
 =?utf-8?B?Nm9MU1RoWTl4L0dBUGJqUXBlaTM4VHNMUCt5ajY4aHA0UkpncG83WlNiNnVu?=
 =?utf-8?B?NDU5M0tURUFzSFVRWUNYOFIzQlJaRWVtS2JtQjdoWTNiaVVZRGk4Nk5yczVr?=
 =?utf-8?B?TEJZd2N0VVVoKzJ0ZWFrR3NuWmdPaVd0aEJicnZJSnk3cFovV1YzVWg0QzNU?=
 =?utf-8?B?dzh0RWVtNmVGdHMwUmNSckFhaC9relZ1SmJhbzN0dFJza1htRXJidW1VN0My?=
 =?utf-8?B?eEorYVp1eGkweXMwajhwVzd5ZWhyemlGVmV3TFhaZ1pzQk1kcjMzcVVSV1ZW?=
 =?utf-8?B?MERsRWtCUTdlakVoTFE3UGMxZ3BVTkloakZOZEhiOFQ0WHNLWUpYejByYzNM?=
 =?utf-8?B?WEo2WWNaZjgzSjFqQjVUNDhPNS8wZjc1d2pRZ1E0eHVIamQvVkJJS21uOUsw?=
 =?utf-8?B?aVIxMjFsbUVXSDB1YlRyM1BjNnRBb1NNT043V2hOczg3cHRqNWczM0xleEVW?=
 =?utf-8?B?eE9FZC9OdEw5NGpWY3lacU1nMGplWWVKVUpUaXJ3NTV6dVFEZ2N3Mlc5TWFp?=
 =?utf-8?B?d2VSNXBJemV2RTQ1bldDcXBJdVFVZXpUR2dzWCt3eWRpdnlEQkxuUDlvZGRo?=
 =?utf-8?B?bmRReFB5QUR3K2xWRlpyUG8yRVJBK1djbmpGSmZvM0JpUWt5ZVZjQVRhc0kx?=
 =?utf-8?B?YjlXQnZueFAvRVpWdWdyWEFjVDloT2tWY21lUXVGaXZ4VUwzdFhVQjJSSHR6?=
 =?utf-8?B?YTA2djBUb2VCUXdQNTFRS1NuMHVxK3hJRE9VMWpnallKTExrb2wvN3NDeUJH?=
 =?utf-8?B?alAvTmtNUnRiMW9hYjgzSGVFQmxud25ibUVBajlUZUU1aXd6YSs3V0pLNkpr?=
 =?utf-8?B?WlhDNGNWQ0c5aFRxRmxkYkkrMThOSnYxWUdsREdQMU12Z3FjRXdyOW0xUHli?=
 =?utf-8?B?SWhucFF1bFdnTmdlVFhYZUtSNWMrV3h2YkJDaXZucXgvQ3JlOHppT21VQVJr?=
 =?utf-8?B?STdyNUZXSWxzUXowTGRsRFhTazkvZDA3eVYyNC9rV1pEbnplVS9VZWJPTUdV?=
 =?utf-8?B?eEQ0S2JvV005a0tua043SGVnTjVTeFh3V0VLQ1d2VzN0RlRHRTNhRlFqYVpV?=
 =?utf-8?B?V2JXb2N3S3VuWVBhYUw4Mkhmd3lhcE9kY2pidm9seXJsMHZUZ0hvV3JuUngy?=
 =?utf-8?B?dGFSNTVOVUtzcHdXcmtoMG5OSDI5YUh3VWhaRk9QK1QxS3czcGEwWEJXdXFy?=
 =?utf-8?B?WEVReERmaS9oaStpQkNPVm1zRnFkVDNZQmdEY2xIYURqUFFnVGRsc2NjUE9v?=
 =?utf-8?B?MHRSVVVYeFlNZjBrR0JHWVJScHpYUlFyeVhLekFxQ01vdmtVNEtBRmVZUUNC?=
 =?utf-8?Q?YFfcbF9v?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38d44428-1cc3-48c3-2c56-08d892050fc1
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2020 12:16:11.2513 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d5six53JC8wUmdrhzAjjp42s1F583e1N1wSCvfO274a+21zFII1ziHCFOHZaED0Y
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2386
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
Cc: Dave Airlie <airlied@linux.ie>, Alex Deucher <alexander.deucher@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjYuMTEuMjAgdW0gMTM6MTQgc2NocmllYiBUaG9tYXMgWmltbWVybWFubjoKPiBIaQo+Cj4g
QW0gMjYuMTEuMjAgdW0gMTM6MDggc2NocmllYiBDaHJpc3RpYW4gS8O2bmlnOgo+Pj4gWy4uLl0K
Pj4+IFllYWgsIEkgcmVtZW1iZXIgYSBidWcgcmVwb3J0IGFib3V0IGZyZXF1ZW50IHBhZ2UtdGFi
bGUgCj4+PiBtb2RpZmljYXRpb25zIHdydCB0byB2cmFtIGhlbHBlcnMuIFNvIHdlIGltcGxlbWVu
dGVkIHRoZSBsYXp5IAo+Pj4gdW5tYXBwaW5nIC8gdm1hcCBjYWNoaW5nLCBhcyBzdWdnZXN0ZWQg
YnkgQ2hyaXN0aWFuIGJhY2sgdGhlbS4gTXkgCj4+PiBndWVzcyBpcyB0aGF0IGFueXRoaW5nIFRU
TS1iYXNlZCBjYW4gdXNlIGEgc2ltaWxhciBwYXR0ZXJuLiAKPj4+IENocmlzdGlhbiBwcm9iYWJs
eSBrbm93cyB0aGUgY29ybmVyIGNhc2VzLgo+Pgo+PiBNeSBtZW1vcnkgaXMgZmFpbGluZyBtZSwg
d2hhdCBjb3JuZXIgY2FzZSBhcmUgeW91IHRhbGtpbmcgYWJvdXQ/Cj4KPiBIYWhhISA6RCBXaGF0
IEkgbWVhbnQgd2FzIHRoYXQgaWYgdGhlcmUgd2VyZSBjb3JuZXIgY2FzZXMsIHlvdSdkIGtub3cg
Cj4gYWJvdXQgdGhlbS4gRnJvbSB5b3VyIGNvbW1lbnQsIEkgZ3Vlc3MgdGhlcmUgYXJlIG5vbmUu
CgpBaCwgb2sgOikgSSB3YXMgd29uZGVyaW5nIGZvciBhIG1vbWVudCBpZiBJIGhhdmUgbWlzc2Vk
IHNvbWV0aGluZy4KCkNoZWVycywKQ2hyaXN0aWFuLgoKPgo+IEJlc3QgcmVnYXJkcwo+IFRob21h
cwo+Cj4+Cj4+IENocmlzdGlhbi4KPj4KPj4+Cj4+PiBDTUEgc2VlbXMgb2J2aW91c2x5IHdvcmtp
bmcgY29ycmVjdGx5IGFscmVhZHkuCj4+Pgo+Pj4gRm9yIFNITUVNLCBJJ2QgaGF2ZSB0byBmaWd1
cmUgb3V0IHRoZSByZWZlcmVuY2UgY291bnRpbmcgb2YgdGhlIAo+Pj4gcGFnZXMgaW52b2x2ZWQu
IE15IGd1ZXNzIGlzIHRoYXQgdGhlIHZ1bm1hcCBpbiAKPj4+IGRybV9nZW1fc2htZW1fdnVubWFw
KCkgY291bGQgYmUgbW92ZWQgaW50byB0aGUgZnJlZSBjYWxsYmFjaywgcGx1cyBhIAo+Pj4gZmV3
IG90aGVyIG1vZGlmaWNhdGlvbnMuCj4+Pgo+Pj4gQmVzdCByZWdhcmRzCj4+PiBUaG9tYXMKPj4+
Cj4+Pj4KPj4+PiBCdXQgaWYgeW91J3JlIHdpbGxpbmcgdG8gZG8gYWxsIHRoYXQgY29udmVyc2lv
biBvZiBjYWxsZXJzLCB0aGVuIG9mCj4+Pj4gY291cnNlIEknbSBub3Qgc3RvcHBpbmcgeW91LiBO
b3QgYXQgYWxsLCBpdCdzIGdyZWF0IHRvIHNlZSB0aGF0IGtpbmQKPj4+PiBvZiBtYXplIHVudGFu
Z2xlZC4KPj4+PiAtRGFuaWVsCj4+Pj4KPj4+Pj4KPj4+Pj4gQmVzdCByZWdhcmRzCj4+Pj4+IFRo
b21hcwo+Pj4+Pgo+Pj4+Pj4KPj4+Pj4+IFRoYXQgc2hvdWxkIGdpdmUgdXMgYXQgbGVhc3Qgc29t
ZSB3YXkgZm9yd2FyZCB0byBncmFkdWFsbHkgY29udmVyIAo+Pj4+Pj4gYWxsIHRoZQo+Pj4+Pj4g
ZHJpdmVycyBhbmQgaGVscGVycyBvdmVyIHRvIGRtYV9yZXN2IGxvY2tpbmcuCj4+Pj4+PiAtRGFu
aWVsCj4+Pj4+Pgo+Pj4+Pj4+IFRoZSBwaW4gY291bnQgaXMgY3VycmVudGx5IG1haW50YWluZWQg
YnkgdGhlIHZtYXAgaW1wbGVtZW50YXRpb24gCj4+Pj4+Pj4gaW4gdnJhbQo+Pj4+Pj4+IGhlbHBl
cnMuIENhbGxpbmcgdm1hcCBpcyBhbiBpbXBsaWNpdCBwaW47IGNhbGxpbmcgdnVubWFwIGlzIGFu
IAo+Pj4+Pj4+IGltcGxpY2l0Cj4+Pj4+Pj4gdW5waW4uIFRoaXMgcHJldmVudHMgZXZpY3Rpb24g
aW4gdGhlIGRhbWFnZSB3b3JrZXIuIEJ1dCBub3cgSSAKPj4+Pj4+PiB3YXMgdG9sZCB0aGFuCj4+
Pj4+Pj4gcGlubmluZyBpcyBvbmx5IGZvciBCT3MgdGhhdCBhcmUgY29udHJvbGxlZCBieSB1c2Vy
c3BhY2UgYW5kIAo+Pj4+Pj4+IGludGVybmFsIHVzZXJzCj4+Pj4+Pj4gc2hvdWxkIGFjcXVpcmUg
dGhlIHJlc3YgbG9jay4gU28gdnJhbSBoZWxwZXJzIGhhdmUgdG8gYmUgZml4ZWQsIAo+Pj4+Pj4+
IGFjdHVhbGx5Lgo+Pj4+Pj4+Cj4+Pj4+Pj4gSW4gdnJhbSBoZWxwZXJzLCB1bm1hcHBpbmcgZG9l
cyBub3QgbWVhbiBldmljdGlvbi4gVGhlIHVubWFwIAo+Pj4+Pj4+IG9wZXJhdGlvbiBvbmx5Cj4+
Pj4+Pj4gbWFya3MgdGhlIEJPIGFzIHVubWFwcGFibGUuIFRoZSByZWFsIHVubWFwIGhhcHBlbnMg
d2hlbiB0aGUgCj4+Pj4+Pj4gZXZpY3Rpb24gdGFrZXMKPj4+Pj4+PiBwbGFjZS4gVGhpcyBhdm9p
ZHMgbWFueSBtb2RpZmljYXRpb25zIHRvIHRoZSBwYWdlIHRhYmxlcy4gSU9XIGFuIAo+Pj4+Pj4+
IHVucGlubmVkLAo+Pj4+Pj4+IHVubWFwcGVkIEJPIHdpbGwgcmVtYWluIGluIFZSQU0gdW50aWwg
dGhlIG1lbW9yeSBpcyBhY3R1YWxseSAKPj4+Pj4+PiBuZWVkZWQuCj4+Pj4+Pj4KPj4+Pj4+PiBC
ZXN0IHJlZ2FyZHMKPj4+Pj4+PiBUaG9tYXMKPj4+Pj4+Pgo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBTbyBJ
J20gc3RpbGwgbm90IHNlZWluZyBob3cgdGhpcyBjYW4gZ28gYm9vbS4KPj4+Pj4+Pj4KPj4+Pj4+
Pj4gTm93IGxvbmcgdGVybSBpdCdkIGJlIG5pY2UgdG8gY3V0IGV2ZXJ5dGhpbmcgb3ZlciB0byBk
bWFfcmVzdiAKPj4+Pj4+Pj4gbG9ja2luZywgYnV0Cj4+Pj4+Pj4+IHRoZSBpc3N1ZSB0aGVyZSBp
cyB0aGF0IGJleW9uZCB0dG0sIG5vbmUgb2YgdGhlIGhlbHBlcnMgKGFuZCAKPj4+Pj4+Pj4gZmV3
IG9mIHRoZQo+Pj4+Pj4+PiBkcml2ZXJzKSB1c2UgZG1hX3Jlc3YuIFNvIHRoaXMgaXMgYSBmYWly
bHkgYmlnIHVwaGlsbCBiYXR0bGUuIAo+Pj4+Pj4+PiBRdWljawo+Pj4+Pj4+PiBpbnRlcmltIGZp
eCBzZWVtcyBsaWtlIHRoZSByaWdodCBzb2x1dGlvbiB0byBtZS4KPj4+Pj4+Pj4gLURhbmllbAo+
Pj4+Pj4+Pgo+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+IFJlZ2FyZHMsCj4+Pj4+Pj4+PiBDaHJpc3RpYW4u
Cj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4gQmVzdCByZWdhcmRzCj4+Pj4+Pj4+Pj4g
VGhvbWFzCj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+Pj4+IFRoZXJlJ3Mgbm8gcmVj
dXJzaW9uIHRha2luZyBwbGFjZSwgc28gSSBndWVzcyB0aGUgcmVzZXJ2YXRpb24KPj4+Pj4+Pj4+
Pj4+IGxvY2sgY291bGQgYmUKPj4+Pj4+Pj4+Pj4+IGFjcXVpcmVkL3JlbGVhc2UgaW4gZHJtX2Ns
aWVudF9idWZmZXJfdm1hcC92dW5tYXAoKSwgb3IgYQo+Pj4+Pj4+Pj4+Pj4gc2VwYXJhdGUgcGFp
ciBvZgo+Pj4+Pj4+Pj4+Pj4gRFJNIGNsaWVudCBmdW5jdGlvbnMgY291bGQgZG8gdGhlIGxvY2tp
bmcuCj4+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4+IEdpdmVuIGhvdyB0aGlzICJkbyB0aGUgcmlnaHQg
bG9ja2luZyIgaXMgYSBjYW4gb2Ygd29ybXMgKGFuZCAKPj4+Pj4+Pj4+Pj4gSSB0aGluawo+Pj4+
Pj4+Pj4+PiBpdCdzCj4+Pj4+Pj4+Pj4+IHdvcnNlIHRoYW4gd2hhdCB5b3UgZHVnIG91dCBhbHJl
YWR5KSBJIHRoaW5rIHRoZSAKPj4+Pj4+Pj4+Pj4gZmJfaGVscGVyLmxvY2sgaGFjayBpcwo+Pj4+
Pj4+Pj4+PiBwZXJmZWN0bHkgZ29vZCBlbm91Z2guCj4+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4+IEkn
bSBhbHNvIHNvbWV3aGF0IHdvcnJpZWQgdGhhdCBzdGFydGluZyB0byB1c2UgZG1hX3Jlc3YgbG9j
ayAKPj4+Pj4+Pj4+Pj4gaW4gZ2VuZXJpYwo+Pj4+Pj4+Pj4+PiBjb2RlLCB3aGlsZSBtYW55IGhl
bHBlcnMvZHJpdmVycyBzdGlsbCBoYXZlIHRoZWlyIAo+Pj4+Pj4+Pj4+PiBoYW5kLXJvbGxlZCBs
b2NraW5nLAo+Pj4+Pj4+Pj4+PiB3aWxsIG1ha2UgY29udmVyc2lvbiBvdmVyIHRvIGRtYV9yZXN2
IG5lZWRsZXNzbHkgbW9yZSAKPj4+Pj4+Pj4+Pj4gY29tcGxpY2F0ZWQuCj4+Pj4+Pj4+Pj4+IC1E
YW5pZWwKPj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4+PiBCZXN0IHJlZ2FyZHMK
Pj4+Pj4+Pj4+Pj4+IFRob21hcwo+Pj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+Pj4+IFsxXSAKPj4+Pj4+
Pj4+Pj4+IGh0dHBzOi8vY2dpdC5mcmVlZGVza3RvcC5vcmcvZHJtL2RybS10aXAvdHJlZS9kcml2
ZXJzL2dwdS9kcm0vZHJtX2ZiX2hlbHBlci5jP2lkPWFjNjBmM2YzMDkwMTE1ZDIxZjAyOGJmZmEy
ZGNmYjY3ZjY5NWM0ZjIjbjM5NCAKPj4+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+
Pj4+Cj4+Pj4+Pj4+Pj4+Pj4gUGxlYXNlIG5vdGUgdGhhdCB0aGUgcmVzZXJ2YXRpb24gbG9jayB5
b3UgbmVlZCB0byB0YWtlIAo+Pj4+Pj4+Pj4+Pj4+IGhlcmUgaXMgcGFydCBvZgo+Pj4+Pj4+Pj4+
Pj4+IHRoZSBHRU0gb2JqZWN0Lgo+Pj4+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4+Pj4gVXN1YWxseSB3
ZSBkZXNpZ24gdGhpbmdzIGluIHRoZSB3YXkgdGhhdCB0aGUgY29kZSBuZWVkcyB0byAKPj4+Pj4+
Pj4+Pj4+PiB0YWtlIGEgbG9jawo+Pj4+Pj4+Pj4+Pj4+IHdoaWNoIHByb3RlY3RzIGFuIG9iamVj
dCwgdGhlbiBkbyBzb21lIG9wZXJhdGlvbnMgd2l0aCB0aGUgCj4+Pj4+Pj4+Pj4+Pj4gb2JqZWN0
IGFuZAo+Pj4+Pj4+Pj4+Pj4+IHRoZW4gcmVsZWFzZSB0aGUgbG9jayBhZ2Fpbi4KPj4+Pj4+Pj4+
Pj4+Pgo+Pj4+Pj4+Pj4+Pj4+IEhhdmluZyBpbiB0aGUgbG9jayBpbnNpZGUgdGhlIG9wZXJhdGlv
biBjYW4gYmUgZG9uZSBhcyAKPj4+Pj4+Pj4+Pj4+PiB3ZWxsLCBidXQKPj4+Pj4+Pj4+Pj4+PiBy
ZXR1cm5pbmcgd2l0aCBpdCBpcyBraW5kIG9mIHVudXN1YWwgZGVzaWduLgo+Pj4+Pj4+Pj4+Pj4+
Cj4+Pj4+Pj4+Pj4+Pj4+IFNvcnJ5IGZvciB0aGUgbm9vYiBxdWVzdGlvbnMuIEknbSBzdGlsbCB0
cnlpbmcgdG8gCj4+Pj4+Pj4+Pj4+Pj4+IHVuZGVyc3RhbmQgdGhlCj4+Pj4+Pj4+Pj4+Pj4+IGlt
cGxpY2F0aW9ucyBvZiBhY3F1aXJpbmcgdGhlc2UgbG9ja3MuCj4+Pj4+Pj4+Pj4+Pj4KPj4+Pj4+
Pj4+Pj4+PiBXZWxsIHRoaXMgaXMgdGhlIHJlc2VydmF0aW9uIGxvY2sgb2YgdGhlIEdFTSBvYmpl
Y3Qgd2UgYXJlCj4+Pj4+Pj4+Pj4+Pj4gdGFsa2luZyBhYm91dAo+Pj4+Pj4+Pj4+Pj4+IGhlcmUu
IFdlIG5lZWQgdG8gdGFrZSB0aGF0IGZvciBhIGNvdXBsZSBvZiBkaWZmZXJlbnQgCj4+Pj4+Pj4+
Pj4+Pj4gb3BlcmF0aW9ucywKPj4+Pj4+Pj4+Pj4+PiB2bWFwL3Z1bm1hcCBkb2Vzbid0IHNvdW5k
IGxpa2UgYSBzcGVjaWFsIGNhc2UgdG8gbWUuCj4+Pj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+Pj4+PiBS
ZWdhcmRzLAo+Pj4+Pj4+Pj4+Pj4+IENocmlzdGlhbi4KPj4+Pj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+
Pj4+Pgo+Pj4+Pj4+Pj4+Pj4+PiBCZXN0IHJlZ2FyZHMKPj4+Pj4+Pj4+Pj4+Pj4gVGhvbWFzCj4+
Pj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+Pj4+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwo+Pj4+Pj4+Pj4+Pj4+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPj4+
Pj4+Pj4+Pj4+PiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4+Pj4+Pj4+Pj4+Pj4g
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
Pj4+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4+PiAtLSAKPj4+Pj4+Pj4+Pj4+IFRob21hcyBaaW1tZXJt
YW5uCj4+Pj4+Pj4+Pj4+PiBHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyCj4+Pj4+Pj4+Pj4+PiBT
VVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgKPj4+Pj4+Pj4+Pj4+IE1heGZlbGRz
dHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQo+Pj4+Pj4+Pj4+Pj4gKEhSQiAzNjgwOSwg
QUcgTsO8cm5iZXJnKQo+Pj4+Pj4+Pj4+Pj4gR2VzY2jDpGZ0c2bDvGhyZXI6IEZlbGl4IEltZW5k
w7ZyZmZlcgo+Pj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+Pgo+
Pj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pgo+Pj4+
Pj4+Cj4+Pj4+Pj4gLS0gCj4+Pj4+Pj4gVGhvbWFzIFppbW1lcm1hbm4KPj4+Pj4+PiBHcmFwaGlj
cyBEcml2ZXIgRGV2ZWxvcGVyCj4+Pj4+Pj4gU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFu
eSBHbWJICj4+Pj4+Pj4gTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55Cj4+
Pj4+Pj4gKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQo+Pj4+Pj4+IEdlc2Now6RmdHNmw7xocmVy
OiBGZWxpeCBJbWVuZMO2cmZmZXIKPj4+Pj4+Cj4+Pj4+Pgo+Pj4+Pj4KPj4+Pj4+Cj4+Pj4+Pgo+
Pj4+Pj4KPj4+Pj4KPj4+Pj4gLS0gCj4+Pj4+IFRob21hcyBaaW1tZXJtYW5uCj4+Pj4+IEdyYXBo
aWNzIERyaXZlciBEZXZlbG9wZXIKPj4+Pj4gU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFu
eSBHbWJICj4+Pj4+IE1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQo+Pj4+
PiAoSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpCj4+Pj4+IEdlc2Now6RmdHNmw7xocmVyOiBGZWxp
eCBJbWVuZMO2cmZmZXIKPj4+Pgo+Pj4+Cj4+Pj4KPj4+Cj4+Cj4+IF9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
Pj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+PiBodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo+CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
