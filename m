Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC29E27C419
	for <lists+dri-devel@lfdr.de>; Tue, 29 Sep 2020 13:11:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AA836E19A;
	Tue, 29 Sep 2020 11:11:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2058.outbound.protection.outlook.com [40.107.93.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B84E96E174;
 Tue, 29 Sep 2020 11:11:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nQoewyJpfCBCE3/qElf5nkUfJw0dMuVa6B+HVoEp1mTfiWlIp8/AD3UN8VJtkOVV3RNLttwRcpkCfVTcKvD1Xyl9S2po+i5jxX1YS7KpYXoQAPVsIaiTEpiEV84ujTFL7OegqFDJCoY5gQLxNjA3IrFUz+VVQH7YLJrzOowjeYGH0TLv938euVhHIPLrSiBdoiXObTyoAAFd6M7sW7Dp86wUabH5QigKaaxsJok9dKAxT6O65KiP9Oqoor7xLpERQ9t0ZJfWZ2N0D4DDgEvxlT6DI2MIoFqbbMLy8E9BzevnfPhQyCfc+qJWNlVAU43vc7ZGMF9u2ItRF4lSg81vmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LALp6CBHaJNvdlpYOzbYmeKb8DFCHGK1mLsYgah15Z4=;
 b=WbIfcnebGBmHytxcLMSyt3DuAJbw+5zBMucRidQY2KahlHWeYpEUhJmZ0ZETvRsQLzoaqGqUCqxbblWOeiiT2PMrNSeGuRHWIXOERa05zGzvdmPmOvw/i9HrzbVCb5wdcktxQDomEWBTCJ6+5KUZu5lPh7am4mAUwU9ER2E4iDf4ZfPfhU5wDp8lG3f6JOIR6y4TdEQgj9K9FVdisPsTqw+32YmHkyfrhOgMhhWC8WeNrZa/rmjd/XVutR/8gyKlmHPttycVDzDmo4MYBHf0pznwL2h4E9grVyhGEE0WGLdMCcW+P18ex92ffpXuBBenuVb1ws+Q72Oofn7SHVKseQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LALp6CBHaJNvdlpYOzbYmeKb8DFCHGK1mLsYgah15Z4=;
 b=rEr8rwa9vzEoyNe6kb9v/E3u/yJIEzoQmqpD2M4cqLvHfA4uCAQw6ARW1OHyCrLpuXNSfke65aTFbJzTBGxWZ88Xo311aD9bOGb8BcjvLymmKpyEtelsvQOTRyxIbhIkvjom585h3nNS+3uz6Qe6n4aKsuK6JmmPeaQOocN8TA4=
Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB2386.namprd12.prod.outlook.com (2603:10b6:207:47::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.22; Tue, 29 Sep
 2020 11:09:54 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60%6]) with mapi id 15.20.3433.032; Tue, 29 Sep 2020
 11:09:54 +0000
Subject: Re: [PATCH v3 0/4] dma-buf: Flag vmap'ed memory as system or I/O
 memory
To: Daniel Vetter <daniel@ffwll.ch>
References: <20200925115601.23955-1-tzimmermann@suse.de>
 <20200926071334.GA42915@ravnborg.org>
 <8761e0dd-569e-0ea0-7bc5-25e4f7cb67cc@suse.de>
 <20200927191605.GA237178@ravnborg.org>
 <3f703297-7b4f-dcca-ea56-70b2413a1e3d@amd.com>
 <ef4400a7-397b-e550-7114-1d4238dd36f3@suse.de>
 <49c4dcec-cd69-510a-9781-e8fa5fb669f9@amd.com>
 <20200929091445.GI438822@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <774e382e-6e60-450c-ee88-bd9ea2916fb4@amd.com>
Date: Tue, 29 Sep 2020 13:09:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200929091445.GI438822@phenom.ffwll.local>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM0PR06CA0124.eurprd06.prod.outlook.com
 (2603:10a6:208:ab::29) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR06CA0124.eurprd06.prod.outlook.com (2603:10a6:208:ab::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3412.22 via Frontend Transport; Tue, 29 Sep 2020 11:09:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a2f129a8-075b-43d8-74c9-08d8646830ff
X-MS-TrafficTypeDiagnostic: BL0PR12MB2386:
X-Microsoft-Antispam-PRVS: <BL0PR12MB2386ECD0145541655827DCA683320@BL0PR12MB2386.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2yP1TRasLE1vKmCSuxaj024bNfGenbBRrgIOMO6Gw5EQIFYmwmOKRRAvyXmghT0SXyA0qnZ2A3vAd5m6YL2VJyqWma9sUDjS1AIy0KBq/NO5yEkQ3oAZkxLGRV2iRN8lgA7sLv/hrJuio5F88uq3iz4iMAnrt3g9jNEvaEVERYdKCp0h2us8tDIsvRbzovR6uE/ZfkqrEIANH5JNxkQcIpmapEdJ/7I3aYIdBf1NoFk+0FQc/QuBKbwUov/CRXH8Wipibwgzf8O7u/8AXjM7yTe9HSqpUKJmwyS2JTBGTYnQC/6Uts2NbOjXxDJcPwmUGLBstwYum51BshYgJRTCeXHJa7uOBsXDzpDU4A3p72sCg8IjXtRVV0OUtlwdMUqGlyCzhUVQfSoyTKbKgKSb71c0SmwEMn/taTwsBzm4bSH2/2NCqfuUyldSfzPym/OwtbrVYBV80j7I1Phf6f0klQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(366004)(346002)(376002)(136003)(8676002)(7416002)(2906002)(4326008)(6916009)(966005)(7406005)(66476007)(66556008)(86362001)(31686004)(66574015)(83380400001)(31696002)(36756003)(8936002)(54906003)(16526019)(2616005)(186003)(316002)(6666004)(5660300002)(66946007)(6486002)(52116002)(478600001)(45080400002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: 4bThE3sAYgmvlXt6iy6dj7Y/h2+PA/7qfJddyLVH7oGy83QGtR7i3iY4ab1K3tvpY38n82/hbdSjc2qUhxtKeE6OCPmIRT5+8QXIlnDxxh9cr13jw+hgRkthn1SqEHRCdhlshwaU/b23+q+tCAiw+u/gfw6Fw5IaZPxB/leSowaVPSiqXtKVnSakGpKGKhhgqXB1OSG6Np40MknBKb94exg4GusX4qJ67a+71ZiFZ/wELfodfBLOlhr9uFuWD5pxbtcZcdiXlsTI9/5nW6UhhRyzgNoKFuw9Y5YZAje+P9vu2HAhOhzoAGDf9aLXfoDxSsAIzvai9ncMS/Ryap9FnBj973wGfwXNW209zPqA19bfqFmld7J1Yx/U2KFTQSq7lY3+QKK63jFkcg2SQDsPGKcAUaCWaKMz1Ax31XgAHmTv0Rd7/E/E5WKjwgdj6jeUAQyPW/OtClyShFKcu5/Oxai0409KJ+OM8kyPEy/F4Zs6RBn7tUl9cDiqLgJ3YmLoG7G0IBJh/aP7wGs2vYR7XzmMAi8BKReJCw89jt06DXvwimumzmLiYjDkMwKK8nKmDPhnzC98AlQc7zOvRDTmfbJK+gY9nsKMqigKcnPkG+ioawqj0O5J6IP5AnDEv3op+cGpSZx0Gy3nLYCxRHQ9luIbp30mO6Fmc25V94QLe1SO1YC06ARO95Kj2NmHYChmwWvpPIkb33fhWxszyUTjGQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2f129a8-075b-43d8-74c9-08d8646830ff
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2020 11:09:54.0326 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5j52JEA12Idjn/FC7IEnEgz9tY3UOwz7AyYNf2Ig3e8ylgqhY7k71oz4l7J+TXZk
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
Cc: linux-doc@vger.kernel.org, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, thierry.reding@gmail.com, kraxel@redhat.com,
 tfiga@chromium.org, Sam Ravnborg <sam@ravnborg.org>, m.szyprowski@samsung.com,
 arnd@arndb.de, corbet@lwn.net, jonathanh@nvidia.com, matthew.auld@intel.com,
 linux+etnaviv@armlinux.org.uk, labbott@redhat.com, linux-media@vger.kernel.org,
 pawel@osciak.com, intel-gfx@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 thomas.hellstrom@intel.com, rodrigo.vivi@intel.com,
 linux-tegra@vger.kernel.org, mchehab@kernel.org, gregkh@linuxfoundation.org,
 lmark@codeaurora.org, afd@ti.com, kyungmin.park@samsung.com,
 Thomas Zimmermann <tzimmermann@suse.de>, robin.murphy@arm.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjkuMDkuMjAgdW0gMTE6MTQgc2NocmllYiBEYW5pZWwgVmV0dGVyOgo+IE9uIE1vbiwgU2Vw
IDI4LCAyMDIwIGF0IDAxOjIyOjEzUE0gKzAyMDAsIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4+
IEFtIDI4LjA5LjIwIHVtIDA5OjM3IHNjaHJpZWIgVGhvbWFzIFppbW1lcm1hbm46Cj4+PiBIaQo+
Pj4KPj4+IEFtIDI4LjA5LjIwIHVtIDA4OjUwIHNjaHJpZWIgQ2hyaXN0aWFuIEvDtm5pZzoKPj4+
PiBBbSAyNy4wOS4yMCB1bSAyMToxNiBzY2hyaWViIFNhbSBSYXZuYm9yZzoKPj4+Pj4gSGkgVGhv
bWFzLgo+Pj4+Pgo+Pj4+Pj4+IHN0cnVjdCBzaW1hcCB7Cj4+Pj4+Pj4gICDCoMKgwqDCoMKgwqDC
oCB1bmlvbiB7Cj4+Pj4+Pj4gICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdm9pZCBf
X2lvbWVtICp2YWRkcl9pb21lbTsKPj4+Pj4+PiAgIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCB2b2lkICp2YWRkcjsKPj4+Pj4+PiAgIMKgwqDCoMKgwqDCoMKgIH07Cj4+Pj4+Pj4gICDC
oMKgwqDCoMKgwqDCoCBib29sIGlzX2lvbWVtOwo+Pj4+Pj4+IH07Cj4+Pj4+Pj4KPj4+Pj4+PiBX
aGVyZSBzaW1hcCBpcyBhIHNob3J0aGFuZCBmb3Igc3lzdGVtX2lvbWVtX21hcAo+Pj4+Pj4+IEFu
ZCBpdCBjb3VsZCBhbCBiZSBzdHVmZmVkIGludG8gYSBpbmNsdWRlL2xpbnV4L3NpbWFwLmggZmls
ZS4KPj4+Pj4+Pgo+Pj4+Pj4+IE5vdCB0b3RhbGx5IHNvbGQgb24gdGhlIHNpbWFwIG5hbWUgLSBi
dXQgd2FudGVkIHRvIGNvbWUgdXAgd2l0aAo+Pj4+Pj4+IHNvbWV0aGluZy4KPj4+Pj4+IFllcy4g
T3RoZXJzLCBteXNlbGYgaW5jbHVkZWQsIGhhdmUgc3VnZ2VzdGVkIHRvIHVzZSBhIG5hbWUgdGhh
dCBkb2VzIG5vdAo+Pj4+Pj4gaW1wbHkgYSBjb25uZWN0aW9uIHRvIHRoZSBkbWEtYnVmIGZyYW1l
d29yaywgYnV0IG5vIG9uZSBoYXMgY29tZSB1cCB3aXRoCj4+Pj4+PiAgIMKgIGEgZ29vZCBuYW1l
Lgo+Pj4+Pj4KPj4+Pj4+IEkgc3Ryb25nbHkgZGlzbGlrZSBzaW1hcCwgYXMgaXQncyBlbnRpcmVs
eSBub24tb2J2aW91cyB3aGF0IGl0IGRvZXMuCj4+Pj4+PiBkbWEtYnVmLW1hcCBpcyBub3QgYWN0
dWFsbHkgd3JvbmcuIFRoZSBzdHJ1Y3R1cmVzIHJlcHJlc2VudHMgdGhlIG1hcHBpbmcKPj4+Pj4+
IG9mIGEgZG1hLWFibGUgYnVmZmVyIGluIG1vc3QgY2FzZXMuCj4+Pj4+Pgo+Pj4+Pj4+IFdpdGgg
dGhpcyBhcHByb2FjaCB1c2VycyBkbyBub3QgaGF2ZSB0byBwdWxsIGluIGRtYS1idWYgdG8gdXNl
IGl0IGFuZAo+Pj4+Pj4+IHVzZXJzIHdpbGwgbm90IGNvbmZ1c2UgdGhhdCB0aGlzIGlzIG9ubHkg
Zm9yIGRtYS1idWYgdXNhZ2UuCj4+Pj4+PiBUaGVyZSdzIG5vIG5lZWQgdG8gZW5hYmxlIGRtYS1i
dWYuIEl0J3MgYWxsIGluIHRoZSBoZWFkZXIgZmlsZSB3aXRob3V0Cj4+Pj4+PiBkZXBlbmRlbmNp
ZXMgb24gZG1hLWJ1Zi4gSXQncyByZWFsbHkganVzdCB0aGUgbmFtZS4KPj4+Pj4+Cj4+Pj4+PiBC
dXQgdGhlcmUncyBzb21ldGhpbmcgZWxzZSB0byB0YWtlIGludG8gYWNjb3VudC4gVGhlIHdob2xl
IGlzc3VlIGhlcmUgaXMKPj4+Pj4+IHRoYXQgdGhlIGJ1ZmZlciBpcyBkaXNjb25uZWN0ZWQgZnJv
bSBpdHMgb3JpZ2luYXRpbmcgZHJpdmVyLCBzbyB3ZSBkb24ndAo+Pj4+Pj4ga25vdyB3aGljaCBr
aW5kIG9mIG1lbW9yeSBvcHMgd2UgaGF2ZSB0byB1c2UuIFRoaW5raW5nIGFib3V0IGl0LCBJCj4+
Pj4+PiByZWFsaXplZCB0aGF0IG5vIG9uZSBlbHNlIHNlZW1lZCB0byBoYXZlIHRoaXMgcHJvYmxl
bSB1bnRpbCBub3cuCj4+Pj4+PiBPdGhlcndpc2UgdGhlcmUgd291bGQgYmUgYSBzb2x1dGlvbiBh
bHJlYWR5LiBTbyBtYXliZSB0aGUgZG1hLWJ1Zgo+Pj4+Pj4gZnJhbWV3b3JrICppcyogdGhlIG5h
dGl2ZSB1c2UgY2FzZSBmb3IgdGhpcyBkYXRhIHN0cnVjdHVyZS4KPj4+Pj4gV2UgaGF2ZSBhdCBs
ZWFzdDoKPj4+Pj4gbGludXgvZmIuaDoKPj4+Pj4gICDCoMKgwqDCoHVuaW9uIHsKPj4+Pj4gICDC
oMKgwqDCoMKgwqDCoCBjaGFyIF9faW9tZW0gKnNjcmVlbl9iYXNlO8KgwqDCoMKgwqAgLyogVmly
dHVhbCBhZGRyZXNzICovCj4+Pj4+ICAgwqDCoMKgwqDCoMKgwqAgY2hhciAqc2NyZWVuX2J1ZmZl
cjsKPj4+Pj4gICDCoMKgwqDCoH07Cj4+Pj4+Cj4+Pj4+IFdoaWNoIHNvbHZlIG1vcmUgb3IgbGVz
cyB0aGUgc2FtZSBwcm9ibGVtLgo+Pj4gSSB0aG91Z2h0IHRoaXMgd2FzIGZvciBjb252ZW5pZW5j
ZS4gVGhlIGltcG9ydGFudCBpc19pb21lbSBiaXQgaXMgbWlzc2luZy4KPj4+Cj4+Pj4gSSBhbHNv
IGFscmVhZHkgbm90ZWQgdGhhdCBpbiBUVE0gd2UgaGF2ZSBleGFjdGx5IHRoZSBzYW1lIHByb2Js
ZW0gYW5kIGEKPj4+PiB3aG9sZSBidW5jaCBvZiBoZWxwZXJzIHRvIGFsbG93IG9wZXJhdGlvbnMg
b24gdGhvc2UgcG9pbnRlcnMuCj4+PiBIb3cgZG8geW91IGNhbGwgdGhpcyB3aXRoaW4gVFRNPwo+
PiB0dG1fYnVzX3BsYWNlbWVudCwgYnV0IEkgcmVhbGx5IGRvbid0IGxpa2UgdGhhdCBuYW1lLgo+
Pgo+Pj4gVGhlIGRhdGEgc3RydWN0dXJlIHJlcHJlc2VudHMgYSBwb2ludGVyIHRvIGVpdGhlciBz
eXN0ZW0gb3IgSS9PIG1lbW9yeSwKPj4+IGJ1dCBub3QgbmVjZXNzYXRyaWx5IGRldmljZSBtZW1v
cnkuIEl0IGNvbnRhaW5zIHJhdyBkYXRhLiBUaGF0IHdvdWxkCj4+PiBnaXZlIHNvbWV0aGluZyBs
aWtlCj4+Pgo+Pj4gICAgIHN0cnVjdCBkYXRhYnVmX21hcAo+Pj4gICAgIHN0cnVjdCBkYXRhYnVm
X3B0cgo+Pj4gICAgIHN0cnVjdCBkYnVmX21hcAo+Pj4gICAgIHN0cnVjdCBkYnVmX3B0cgo+Pj4K
Pj4+IE15IGZhdm9yaXRlIHdvdWxkIGJlIGRidWZfcHRyLiBJdCdzIHNob3J0IGFuZCB0aGUgQVBJ
IG5hbWVzIHdvdWxkIG1ha2UKPj4+IHNlbnNlOiBkYnVmX3B0cl9jbGVhcigpIGZvciBjbGVhcmlu
ZywgZGJ1Zl9wdHJfc2V0X3ZhZGRyKCkgdG8gc2V0IGFuCj4+PiBhZGRyZXNzLCBkYnVmX3B0cl9p
bmNyKCkgdG8gaW5jcmVtZW50LCBldGMuIEFsc28sIHRoZSBfcHRyIGluZGljYXRlcwo+Pj4gdGhh
dCBpdCdzIGEgc2luZ2xlIGFkZHJlc3M7IG5vdCBhbiBvZmZzZXQgd2l0aCBsZW5ndGguCj4+IFB1
aCwgbm8gaWRlYS4gQWxsIG9mIHRoYXQgZG9lc24ndCBzb3VuZCBsaWtlIGl0IDEwMCUgaGl0cyB0
aGUgdW5kZXJseWluZwo+PiBtZWFuaW5nIG9mIHRoZSBzdHJ1Y3R1cmUuCj4gSW1vIGZpcnN0IGxl
dCdzIG1lcmdlIHRoaXMgYW5kIHRoZW4gc2Vjb25kIHdpdGggbW9yZSB1c2VycyB3ZSBtaWdodCBj
b21lCj4gdXAgd2l0aCBhIGJldHRlciBuYW1lLiBBbmQgY29jY2kgaXMgZmFpcmx5IGdvb2QgYXQg
bGFyZ2Utc2NhbGUgcmVuYW1lLCB0bwo+IHRoZSBwb2ludCB3aGVyZSB3ZSBtYW5nZWQgdG8gcmVu
YW1lIHN0cnVjdCBmZW5jZSB0byBzdHJ1Y3QgZG1hX2ZlbmNlLgoKQWdyZWVkLCByZW5hbWluZyB0
aGluZ3MgbGF0ZXIgb24gaXMgZWFzeSBpZiBzb21lYm9keSBjb21lcyB1cCB3aXRoIApzb21ldGhp
bmcgYmV0dGVyLgoKQnV0IGJsb2NraW5nIGEgbmVjZXNzYXJ5IHRlY2huaWNhbCBjaGFuZ2UganVz
dCBiZWNhdXNlIG9mIHRoZSBuYW1pbmcgaXMgCnVzdWFsbHkgbm90IGEgZ29vZCBpZGVhLgoKQ2hy
aXN0aWFuLgoKPgo+IEFsc28gdGhpcyBlbnRpcmUgdGhyZWFkIGhlcmUgaW1vIHNob3dzIHRoYXQg
d2UgaGF2ZW4ndCB5ZXQgZmlndXJlZCBvdXQgdGhlCj4gcGVyZmVjdCBuYW1lIGFueXdheSwgYW5k
IEkgZG9uJ3QgdGhpbmsgaXQncyB3b3J0aCBpdCB0byBob2xkIHRoaXMgdXAKPiBiZWNhdXNlIG9m
IHRoaXMgYmlrZXNoZWQgOi0pCj4KPiBDaGVlcnMsIERhbmllbAo+Cj4+IENocmlzdGlhbi4KPj4K
Pj4+IEJlc3QgcmVnYXJkcwo+Pj4gVGhvbWFzCj4+Pgo+Pj4+IENocmlzdGlhbi4KPj4+Pgo+Pj4+
Pj4gQW55d2F5LCBpZiBhIGJldHRlciBuYW1lIHRoYW4gZG1hLWJ1Zi1tYXAgY29tZXMgaW4sIEkn
bSB3aWxsaW5nIHRvCj4+Pj4+PiByZW5hbWUgdGhlIHRoaW5nLiBPdGhlcndpc2UgSSBpbnRlbmQg
dG8gbWVyZ2UgdGhlIHBhdGNoc2V0IGJ5IHRoZSBlbmQgb2YKPj4+Pj4+IHRoZSB3ZWVrLgo+Pj4+
PiBXZWxsLCB0aGUgbWFpbiB0aGluZyBpcyB0aGF0IEkgdGhpbmsgdGhpcyBzaG91ZCBiZSBtb3Zl
ZCBhd2F5IGZyb20KPj4+Pj4gZG1hLWJ1Zi4gQnV0IGlmIGluZGVlZCBkbWEtYnVmIGlzIHRoZSBv
bmx5IHJlbGV2YW50IHVzZXIgaW4gZHJtIHRoZW4KPj4+Pj4gSSBhbSB0b3RhbGx5IGZpbmUgd2l0
aCB0aGUgY3VycmVudCBuYW1pbmcuCj4+Pj4+Cj4+Pj4+IE9uZSBhbHRlcm5hdGl2ZSBuYW1lZCB0
aGF0IHBvcHBlZCB1cCBpbiBteSBoZWFkOiBzdHJ1Y3Qgc3lzX2lvX21hcCB7fQo+Pj4+PiBCdXQg
YWdhaW4sIGlmIHRoaXMgaXMga2VwdCBpbiBkbWEtYnVmIHRoZW4gSSBhbSBmaW5lIHdpdGggdGhl
IGN1cnJlbnQKPj4+Pj4gbmFtaW5nLgo+Pj4+Pgo+Pj4+PiBJbiBvdGhlciB3b3JkcywgaWYgeW91
IGNvbnRpbnVlIHRvIHRoaW5rIHRoaXMgaXMgbW9zdGx5IGEgZG1hLWJ1Zgo+Pj4+PiB0aGluZyBh
bGwgdGhyZWUgcGF0Y2hlcyBhcmU6Cj4+Pj4+IEFja2VkLWJ5OiBTYW0gUmF2bmJvcmcgPHNhbUBy
YXZuYm9yZy5vcmc+Cj4+Pj4+Cj4+Pj4+ICAgwqDCoMKgwqBTYW0KPj4+PiBfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+Pj4+IGRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKPj4+PiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4+Pj4gaHR0cHM6Ly9u
YW0xMS5zYWZlbGlua3MucHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0dHBzJTNBJTJGJTJG
bGlzdHMuZnJlZWRlc2t0b3Aub3JnJTJGbWFpbG1hbiUyRmxpc3RpbmZvJTJGZHJpLWRldmVsJmFt
cDtkYXRhPTAyJTdDMDElN0NjaHJpc3RpYW4ua29lbmlnJTQwYW1kLmNvbSU3QzcxYzYzMGE3Y2Ex
ZDQ4NDc2ZWVkMDhkODY0NTgxZTRmJTdDM2RkODk2MWZlNDg4NGU2MDhlMTFhODJkOTk0ZTE4M2Ql
N0MwJTdDMCU3QzYzNzM2OTY3NjkyNTAzMjg0OCZhbXA7c2RhdGE9Q3Nla3pBU3ZqMmxZJTJCNzRG
SWlMYzlCNVFHN0FIbWE4QjJNNXk4Q2Fzc2o0JTNEJmFtcDtyZXNlcnZlZD0wCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
