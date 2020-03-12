Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AEC54182DA8
	for <lists+dri-devel@lfdr.de>; Thu, 12 Mar 2020 11:31:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 574A46E124;
	Thu, 12 Mar 2020 10:31:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2050.outbound.protection.outlook.com [40.107.94.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D02C6E0E4;
 Thu, 12 Mar 2020 10:31:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aPUh0J4gkBP7lk7Vziw2GMC2riD2hSOjrgeAv7oSw6AblP3sbKJA5Zv4DHvx/WCAHIt6HGq66XDzokxGrLzkcSFaqzVz4KCIIvlV8/sYsenCp8gelW9h3ECZWTs/0q/mlXlXb1Wwgu1M/jJnQRnLFQvdr9Z9J+t09nbtDEylOcfhrR3resLfU2w+vo7FLgjS+F2j0ooeTWzAnzPCohQwfQJ7jZBHzLeef7pYtW58QiDhcv4SFEpUJQbNhq8j4MvLS4bDaSGsH8yV2VdVCNmZ9kKjWY4nRU/RnHzt09giz4Wh4gqt3vGZcRp9jKRrZhnLIyDaWgDmlZaWzRwDtt9Vow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hA90Oj6Ub3TqtzkvkB3GgE7rC0jM1iftaVn90Vn+TOw=;
 b=g9iF4X0S483mn6/OvQPfZWrqKclpEE2uQZ43JPgsUhzTSbRfj0frRKE8ipYhOvCLJnQJzaYkjX5MjUBoiwVyQCuErH9kHIjAb/Ffvp3y3I0ge0/AZj4He93M3lLdmHtcwwowuwJjhtx3MdUSljgENTGPKW6rwGFIlcNoq9XH9ZsZ6x0kh07noSNnxQC70lK0dnbuOparx8TRNQnyjPsQDxBgbT3HNMj99XYp+4v9AFy0xIxM6HgwaTUqFh7Ptf16b2N8GBqYeJ2ueT8hbfqHWkQAbXhtwM0lxOKJMzeAmkERJaOrAlpahX+hOP54SAUqg1+A+tdpvka1JEcsYmkV2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hA90Oj6Ub3TqtzkvkB3GgE7rC0jM1iftaVn90Vn+TOw=;
 b=4P/1ikVJlPaFk7aCsdanMJi7FbmN20+BgTBeUMGR7jLv6mn5Ba210knAQv+efjBaZcdeUL7nb70yAuYSTA8OWOCKL3Uf4Ds/vGJ9kEfAcBaxi0ieTREV8TqubrdCCetc809/c/MaUs1YXUn7ommQbpJLZLk0EaeyLIx9fpxQv7U=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (2603:10b6:3:10c::22)
 by DM5PR12MB2342.namprd12.prod.outlook.com (2603:10b6:4:ba::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2793.17; Thu, 12 Mar
 2020 10:31:41 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::d40e:7339:8605:bc92]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::d40e:7339:8605:bc92%11]) with mapi id 15.20.2793.018; Thu, 12 Mar
 2020 10:31:41 +0000
Subject: Re: [PATCH 1/6] lib/scatterlist: add sg_set_dma_addr() function
To: Christoph Hellwig <hch@infradead.org>
References: <20200311135158.3310-1-christian.koenig@amd.com>
 <20200311135158.3310-2-christian.koenig@amd.com>
 <20200311152838.GA24280@infradead.org>
 <f2b46f49-a8d0-9d43-3120-e1ed36fc3a80@gmail.com>
 <20200312101943.GA14618@infradead.org>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <b5db44eb-1dde-1671-feb0-9e47d120f172@amd.com>
Date: Thu, 12 Mar 2020 11:31:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <20200312101943.GA14618@infradead.org>
Content-Language: en-US
X-ClientProxiedBy: AM0PR07CA0027.eurprd07.prod.outlook.com
 (2603:10a6:208:ac::40) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR07CA0027.eurprd07.prod.outlook.com (2603:10a6:208:ac::40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2814.9 via Frontend Transport; Thu, 12 Mar 2020 10:31:39 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 2c641981-85e3-44de-36c0-08d7c6708d30
X-MS-TrafficTypeDiagnostic: DM5PR12MB2342:|DM5PR12MB2342:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB2342CE177E2B0507E6E9954283FD0@DM5PR12MB2342.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 0340850FCD
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(366004)(376002)(39860400002)(136003)(346002)(199004)(86362001)(31696002)(4326008)(8676002)(81166006)(81156014)(8936002)(316002)(6666004)(52116002)(6486002)(2906002)(31686004)(36756003)(478600001)(66556008)(66476007)(66946007)(5660300002)(186003)(6916009)(16526019)(2616005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB2342;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Lr9viplUrcl6DhI0HkvDRmRaA4VjKDutJAyezSDXpC4yEiT54rPCQRyJvjlimLM9OLGahIQF4XZsaB0BvyrhXcn/hTKjpvpQhysIurNfGOqBDRzsVJHL4M7hpQSA9eYKAoGoNh5sdyss+4U+oPywugQ/4LRwtFAX6t1CfSOQKVLhPVcdVYzXqkA/exWMjBzUnXzYbRX80lIdNQ0Y3vmVe202eAnEUoTJQQ7nkn1oLhlELDHI8VwWHGhaXX9eFyJuL+vjv3+hCCPHTWVgPh10JUqeCvD6WSgKtQIiBmBFVifSIwNRMgDMjF4+v+gO2aFrjqeeVF3sCy9Hxzy6ZuGo6+WVNerx6s+LwNe1RRhLYoKoR8owROOnvxpE9/0zL6V/MREE3o65/2lwZGiPfTerJPDI9iN/YvelHtg9L+pJt+8WbcjjJKJBtu+d6g0r0qey
X-MS-Exchange-AntiSpam-MessageData: dCBqD0fN+EqLU6Qcdb9WCET67m44AjVsK1Mc6a9h2Dmfd7YhDo/RGsW8NZkiWNM6DaOK79/JsHybXA40IcEelmDt5jfjA2VklgAtRnEtL/biSCNlHAd4d7ITs+0AAmTLzPwZzyfjmtZbmdCA/k2plKbL1sWcFef4HUGeOc8GQ7xgtFXul0jV4FMqLhALgF4P9RqmS0PtbNsLXGq8p0gSvQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c641981-85e3-44de-36c0-08d7c6708d30
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2020 10:31:40.7456 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hmtKYFAHlo4VD8p2VkqlSb8jJ9dY9Jodal+8HXec4H0fEL2HFC72bJF1hQe2dpqT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2342
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, jgg@ziepe.ca, linux-media@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTIuMDMuMjAgdW0gMTE6MTkgc2NocmllYiBDaHJpc3RvcGggSGVsbHdpZzoKPiBPbiBUaHUs
IE1hciAxMiwgMjAyMCBhdCAxMToxNDoyMkFNICswMTAwLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3Rl
Ogo+Pj4+IFRoZSBwYWdlIHBvaW50ZXIgaXMgc2V0IHRvIE5VTEwgYW5kIG9ubHkgdGhlIERNQSBh
ZGRyZXNzLAo+Pj4+IGxlbmd0aCBhbmQgb2Zmc2V0IHZhbHVlcyBhcmUgdmFsaWQuCj4+PiBOQUsu
ICBUaGUgb25seSB2YWxpZCB3YXkgdG8gZmlsbCBETUEgYWRkcmVzcyBpbiBzY2F0dGVybGlzdHMg
aXMKPj4+IGRtYV9tYXBfc2cgLyBkbWFfbWFwX3NnX2F0dHIuCj4+IEhvdyBjYW4gd2UgdGhlbiBt
YXAgUENJZSBCQVJzIGludG8gYW4gc2NhdHRlcmxpc3Qgd2hpY2ggYXJlIG5vdCBiYWNrZWQgYnkK
Pj4gc3RydWN0IHBhZ2VzPwo+IFlvdSBjYW4ndC4gIHNjYXR0ZXJsaXN0cyBieSBkZWZpbml0aW9u
IG1hcCBtZW1vcnkgYmFja2VkIGJ5IGEgc3RydWN0Cj4gcGFnZS4gIElmIHlvdSB3YW50IHRvIG1h
cCBzb21ldGhpbmcgZWxzZSBzdHJ1Y3Qgc2NhdHRlcmxpc3QgaXMgdGhlCj4gd3Jvbmcgc3RydWN0
dXJlIGFuZCB5b3UgbmVlZCB0byB1c2Ugc29tZXRoaW5nIGVsc2UgKHdoaWNoIHlvdSBzaG91bGQK
PiBhbnl3YXkgYXMgc3RydWN0IHNjYXR0ZXJsaXN0IGlzIGEgYmFkIGRlc2lnbiBwYXR0ZXIsIGFu
ZCB0aGUgYWJvdmUKPiBpcyBvbmx5IG9uZSBvZiB0aGUgbWFueSBpc3N1ZXMgd2l0aCBpdCkuCgpC
dXQgaG93IHNob3VsZCB3ZSB0aGVuIGRlYWwgd2l0aCBhbGwgdGhlIGV4aXN0aW5nIGludGVyZmFj
ZXMgd2hpY2ggCmFscmVhZHkgdGFrZSBhIHNjYXR0ZXJsaXN0L3NnX3RhYmxlID8KClRoZSB3aG9s
ZSBETUEtYnVmIGRlc2lnbiBhbmQgYSBsb3Qgb2YgZHJpdmVycyBhcmUgYnVpbGQgYXJvdW5kIApz
Y2F0dGVybGlzdC9zZ190YWJsZSBhbmQgdG8gbWUgdGhhdCBhY3R1YWxseSBtYWtlcyBxdWl0ZSBh
IGxvdCBvZiBzZW5zZS4KCkZvciBUVE0gSSdtIGFsc28gdHJ5aW5nIGZvciBxdWl0ZSBhIHdoaWxl
IHRvIGp1c3QgbnVrZSB0aGUgbWFudWFsIApkbWFfYWRkcmVzcyBhcnJheXMgd2UgaGF2ZSBhbmQg
c3dpdGNoIG92ZXIgdG8gc2NhdHRlcmxpc3Qvc2dfdGFibGUuCgpJIG1lYW4gd2UgY291bGQgY29t
ZSB1cCB3aXRoIGEgbmV3IHN0cnVjdHVyZSBmb3IgdGhpcywgYnV0IHRvIG1lIHRoYXQgCmp1c3Qg
bG9va3MgbGlrZSByZWludmVudGluZyB0aGUgd2hlZWwuIEVzcGVjaWFsbHkgc2luY2UgZHJpdmVy
cyBuZWVkIHRvIApiZSBhYmxlIHRvIGhhbmRsZSBib3RoIEkvTyB0byBzeXN0ZW0gbWVtb3J5IGFu
ZCBJL08gdG8gUENJZSBCQVJzLgoKUmVnYXJkcywKQ2hyaXN0aWFuLgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
