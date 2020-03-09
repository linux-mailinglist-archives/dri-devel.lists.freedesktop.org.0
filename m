Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E5DA17E4AA
	for <lists+dri-devel@lfdr.de>; Mon,  9 Mar 2020 17:21:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67FD46E02E;
	Mon,  9 Mar 2020 16:21:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2064.outbound.protection.outlook.com [40.107.243.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31C7C89CDE
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Mar 2020 16:21:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ay8nhP5Emt/RBLmwFw51TdFmjv3AtCTqEVLdOCqEwqpye/AoCtiiyYs4hIHlgFU+H9BJcYFX6o8HsJYO8O9f44a3w2M1bXZ7gFNmGrNfdwEYSbal6106tHEfvVrj3eJgmwpxLjE1N7PVUCxGBjONE4s1zFyz7TMxAl1ipu/08hCpOPc22tZaO+PE0HxQ0SFE4RYsZQqz5iS6t8OcKZLhhFDr3/TXDHT749DVzgKrb65O2XQ04psO0rjkzZxjIRPCIVb/u/4Xszu/8Z9qw68M2otHwk+I0w+Q1kjgRDq9oKOe5Hp9gFqV1mGatgYlP28HvY9go0kG1/Byux+iMx//Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sfdtfa45UOIUhzkdK6Y15K9szw4UTEq9EdA3bf2EmOQ=;
 b=oPOsvaCue2adp9q70uVOfte+ScOBdgu/feohR0kC+3Or1d7pz0PImnihdRq60X52a+3eIObbNI/f+GcswjEkEGXa4CVxz6bfTayffyAJF+B8IE9WgWgbvUmAkIXFwx5Dlgx0UVa2h7pXaSQ5fJCsyY78kmakZd8Kye/du5KNPgHrxmB3fsdMhFz/KhCI8coOWS4owlaCPCB8mU9MIOrBxc8bQz2E+rs4i7x7HKzKhlwrCTGxxSUKXumu8eNlz9IgNPC6HUFHWDN4TvcR6mGxUr1zlXK8HQ1hHmGTvnkss8Cd0E8Vzv0SDI9UQhqB6ZETupPI9LsBDhgewQK9gMaM1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sfdtfa45UOIUhzkdK6Y15K9szw4UTEq9EdA3bf2EmOQ=;
 b=i+wUak5kpUEeEwOm9pDFLXFDLTNEamPWKkzOl2Eaz5dRqVlcef9hUsuEI47omTmqWwL+bdVhh6S8uv+dA+kRnrXE2l/CQevmTqoj1MJLc4vo7M8WDtj8U5dKTwLp0DVv0WvWsGC0z5/qrkFWW3bm+TVLdMwkWWYGzh9dDCnyMVU=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (2603:10b6:3:10c::22)
 by DM5PR12MB1612.namprd12.prod.outlook.com (2603:10b6:4:a::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2793.17; Mon, 9 Mar 2020 16:21:32 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::d40e:7339:8605:bc92]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::d40e:7339:8605:bc92%11]) with mapi id 15.20.2793.013; Mon, 9 Mar 2020
 16:21:32 +0000
Subject: Re: [PATCH] RFC: dma-buf: Add an API for importing and exporting sync
 files
To: Jason Ekstrand <jason@jlekstrand.net>
References: <20200225235856.975366-1-jason@jlekstrand.net>
 <8066d8b2-dd6a-10ef-a7bb-2c18a0661912@amd.com>
 <20200226100523.GQ2363188@phenom.ffwll.local>
 <CAOFGe94O66HL212aXqhi9tdYqw---Xm-fwNSV4pxHyPmpSGpbg@mail.gmail.com>
 <CAP+8YyEUz29fXDW5kO_0ZG6c849=TuFWCK8ynT3LuM+Tn+rMzw@mail.gmail.com>
 <810a26e7-4294-a615-b7ee-18148ac70641@amd.com>
 <CAOFGe96namyeQXTvdrduM+=wkJuoWWx34CxcsJHS3fcCaKDadw@mail.gmail.com>
 <21aeacc0-f3ae-c5dd-66df-4d2f3d73f73e@amd.com>
 <CAOFGe95Gx=kX=sxwhx1FYmXQuPtGAKwt2V5YodQBwJXujE3WwA@mail.gmail.com>
 <CAOFGe97XSxgzCViOH=2+B2_d5P3vGifKmvAw-JrzRQbbRMRbcg@mail.gmail.com>
 <6fb8becf-9e6b-f59e-9c22-2b20069241a7@amd.com>
 <CAOFGe94gv9N+6n6oEC2aRtsmy7kBfx1D_R6WLQSGq7-8yUM_OQ@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <203505dc-7b75-1135-587e-cc6e88ade8cd@amd.com>
Date: Mon, 9 Mar 2020 17:21:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <CAOFGe94gv9N+6n6oEC2aRtsmy7kBfx1D_R6WLQSGq7-8yUM_OQ@mail.gmail.com>
Content-Language: en-US
X-ClientProxiedBy: FR2P281CA0020.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::7) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 FR2P281CA0020.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:14::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2793.16 via Frontend Transport; Mon, 9 Mar 2020 16:21:29 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 7ca5cfad-ccd1-4b08-cd7b-08d7c445ee22
X-MS-TrafficTypeDiagnostic: DM5PR12MB1612:
X-Microsoft-Antispam-PRVS: <DM5PR12MB16121BAB8EC10FCF51EFAA5783FE0@DM5PR12MB1612.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-Forefront-PRVS: 0337AFFE9A
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(346002)(376002)(366004)(39860400002)(189003)(199004)(54906003)(316002)(66556008)(66476007)(86362001)(53546011)(4326008)(2616005)(186003)(16526019)(478600001)(8676002)(8936002)(81156014)(36756003)(81166006)(66946007)(31696002)(6916009)(6666004)(31686004)(7416002)(66574012)(52116002)(6486002)(2906002)(5660300002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1612;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +/hJFmwB1HLZNQcNzv44PO6sa+6EGKRpf6XHMG43a0JcBbiiwWnf4PCAzSqJh2CbTPzho+hJwW/md6dJIPaGN4H0UOjGEAHx7DvR06J+TeY5QmEfAmJalNgQrslDJsdaSUJdvUQbLnkZ6t3lubq8a11XHmSMwQm9e71qLl2+iu2HIY2aiKi5JZY+YykPj5GYzTYUU9cJAGkEZqUgNWCkExb9cOYicMvgTJNRugqvvhUpPRZuO8ZEissNNQeXJfxLSQd+Lr2TF1j4qreMUR3vK+rVZgWr839ZbmeLG53SrfhQDqWVGz+86eM4W8gccc7pWKKtH4xnoGMR94Q0hajN2mVHtDSLPvNxX7Md3qmMAR2Ta9TFE1MbA4RV0z738D5EehNl4ou0TZh25qhT4ykc9emG2UX2fK22AsrSKqkpiM7XwjwGtE7mM08vucnbZSZs
X-MS-Exchange-AntiSpam-MessageData: T9G+7euyMKv3bp/XmxiHvsMM7wknz1gyYHLaODAsiHJV1qZex9MB6HPYTHyl59SewsQAEX013vTR2pUdCLXmndvwSRkTjxdiaypriUPz5byAfzXQ5vXyp7ptDQ2/G60YWoY38jpivElZS1iUvkpXbSk43h1aN0pU1lOowfrWyuYgdPnn+C4JayxzExdSV402PdaQsZvTSEuzI+NW6pA2Xw==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ca5cfad-ccd1-4b08-cd7b-08d7c445ee22
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2020 16:21:32.5689 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OCMqKJ8rt5KaAPNgxneLzSzDJTeTyeYZf4z2KXRVDpgxL9xo/f0RQQmiZb8YBUR9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1612
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
Cc: Chenbo Feng <fengc@google.com>, Daniel Stone <daniels@collabora.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, James Jones <jajones@nvidia.com>,
 LKML <linux-kernel@vger.kernel.org>, Greg Hackmann <ghackmann@google.com>,
 linaro-mm-sig@lists.linaro.org,
 =?UTF-8?Q?Kristian_H=c3=b8gsberg?= <hoegsberg@google.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Dave Airlie <airlied@redhat.com>, Jesse Hall <jessehall@google.com>,
 linux-media@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMDUuMDMuMjAgdW0gMTY6NTQgc2NocmllYiBKYXNvbiBFa3N0cmFuZDoKPiBPbiBUaHUsIE1h
ciA1LCAyMDIwIGF0IDc6MDYgQU0gQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0Bh
bWQuY29tPiB3cm90ZToKPj4gW1NOSVBdCj4+IFdlbGwgYXMgZmFyIGFzIEkgY2FuIHNlZSB0aGlz
IHdvbid0IHdvcmsgYmVjYXVzZSBpdCB3b3VsZCBicmVhayB0aGUKPj4gc2VtYW50aWNzIG9mIHRo
ZSB0aW1lbGluZSBzeW5jLgo+IEknbSBub3QgMTAwJSBjb252aW5jZWQgaXQgaGFzIHRvLiAgV2Ug
YWxyZWFkeSBoYXZlIHN1cHBvcnQgZm9yIHRoZQo+IHNlcW5vIHJlZ3Jlc3NpbmcgYW5kIHdlIGVu
c3VyZSB0aGF0IHdlIHN0aWxsIHdhaXQgZm9yIGFsbCB0aGUgZmVuY2VzLgo+IEkgdGhvdWdodCBt
YXliZSB3ZSBjb3VsZCB1c2UgdGhhdCBidXQgSSBoYXZlbid0IHNwZW50IGVub3VnaCB0aW1lCj4g
bG9va2luZyBhdCB0aGUgZGV0YWlscyB0byBiZSBzdXJlLiAgSSBtYXkgYmUgbWlzc2luZyBzb21l
dGhpbmcuCgpUaGF0IHdvbid0IHdvcmsuIFRoZSBzZXFubyByZWdyZXNzaW9uIHdvcmtzIGJ5IHB1
bmlzaGluZyB1c2Vyc3BhY2UgZm9yIApkb2luZyBzb21ldGhpbmcgc3R1cGlkIGFuZCB1bmRlZmlu
ZWQuCgpCZSB3ZSBjYW4ndCBkbyB0aGF0IHVuZGVyIG5vcm1hbCBjaXJjdW1zdGFuY2VzLgoKPj4g
SSBjYW4gcHJvdG90eXBlIHRoYXQgaWYgeW91IHdhbnQsIHNob3VsZG4ndCBiZSBtb3JlIHRoYW4g
YSBmZXcgaG91cnMgb2YKPj4gaGFja2luZyBhbnl3YXkuCj4gSWYgeW91J2QgbGlrZSB0bywgZ28g
Zm9yIGl0LiAgSSdkIGJlIGhhcHB5IHRvIGdpdmUgaXQgYSBnbyBhcyB3ZWxsIGJ1dAo+IGlmIHlv
dSBhbHJlYWR5IGtub3cgd2hhdCB5b3Ugd2FudCwgaXQgbWF5IGJlIGVhc2llciBmb3IgeW91IHRv
IGp1c3QKPiB3cml0ZSB0aGUgcGF0Y2ggZm9yIHRoZSBjdXJzb3IuCgpTZW5kIHlvdSB0d28gcGF0
Y2hlcyBmb3IgdGhhdCBhIGZldyBtaW51dGVzIGFnby4gQnV0IGtlZXAgaW4gbWluZCB0aGF0IAp0
aG9zZSBhcmUgY29tcGxldGVseSB1bnRlc3RlZC4KCj4gVHdvIG1vcmUgcXVlc3Rpb25zOgo+Cj4g
ICAxLiBEbyB5b3Ugd2FudCB0aGlzIGNvbGxhcHNpbmcgdG8gaGFwcGVuIGV2ZXJ5IHRpbWUgd2Ug
Y3JlYXRlIGEKPiBkbWFfZmVuY2VfYXJyYXkgb3Igc2hvdWxkIGl0IGJlIGEgc3BlY2lhbCBlbnRy
eXBvaW50PyAgQ29sbGFwc2luZyBhbGwKPiB0aGUgdGltZSBsaWtlbHkgbWVhbnMgZG9pbmcgZXh0
cmEgYXJyYXkgY2FsY3VsYXRpb25zIGluc3RlYWQgb2YgdGhlCj4gZG1hX2ZlbmNlX2FycmF5IHRh
a2luZyBvd25lcnNoaXAgb2YgdGhlIGFycmF5IHRoYXQncyBwYXNzZWQgaW4uICBNeQo+IGd1dCBz
YXlzIHRoYXQgY29zdCBpcyBvazsgYnV0IG15IGd1dCBkb2Vzbid0IHNwZW5kIG11Y2ggdGltZSBp
biBrZXJuZWwKPiBzcGFjZS4KCkluIG15IHByb3RvdHlwZSBpbXBsZW1lbnRhdGlvbiB0aGF0IGlz
IGEgZG1hX3Jlc3YgZnVuY3Rpb24geW91IGNhbGwgYW5kIApnZXQgZWl0aGVyIGEgc2luZ2xlIGZl
bmNlIG9yIGEgZG1hX2ZlbmNlX2FycmF5IHdpdGggdGhlIGNvbGxhcHNlZCBmZW5jZXMgCmluIHJl
dHVybi4KCkJ1dCBJIHdvdWxkbid0IGFkZCB0aGF0IHRvIHRoZSBnZW5lcmFsIGRtYV9mZW5jZV9h
cnJheV9pbml0IGZ1bmN0aW9uIApzaW5jZSB0aGlzIGlzIHN0aWxsIGEgcmF0aGVyIHNwZWNpYWwg
Y2FzZS4gV2VsbCBzZWUgdGhlIHBhdGNoZXMsIHRoZXkgCnNob3VsZCBiZSBwcmV0dHkgc2VsZiBl
eHBsYWluaW5nLgoKPiAgIDIuIFdoZW4gd2UgZG8gdGhlIGNvbGxhcHNpbmcsIHNob3VsZCB3ZSBj
YWxsIGRtYV9mZW5jZV9pc19zaWduYWxlZCgpCj4gdG8gYXZvaWQgYWRkaW5nIHNpZ25hbGVkIGZl
bmNlcyB0byB0aGUgYXJyYXk/ICBJdCBzZWVtcyBsaWtlIGF2b2lkaW5nCj4gYWRkaW5nIHJlZmVy
ZW5jZXMgdG8gZmVuY2VzIHRoYXQgYXJlIGFscmVhZHkgc2lnbmFsZWQgd291bGQgbGV0IHRoZQo+
IGtlcm5lbCBjbGVhbiB0aGVtIHVwIGZhc3RlciBhbmQgcmVkdWNlIHRoZSBsaWtlbGlob29kIHRo
YXQgYSBmZW5jZQo+IHdpbGwgaGFuZyBhcm91bmQgZm9yZXZlciBiZWNhdXNlIGl0IGtlZXBzIGdl
dHRpbmcgYWRkZWQgdG8gYXJyYXlzIHdpdGgKPiBvdGhlciB1bnNpZ25hbGVkIGZlbmNlcy4KCkkg
dGhpbmsgc28uIENhbid0IHRoaW5rIG9mIGEgZ29vZCByZWFzb24gd2h5IHdlIHdvdWxkIHdhbnQg
dG8gYWRkIAphbHJlYWR5IHNpZ25hbGVkIGZlbmNlcyB0byB0aGUgYXJyYXkuCgpDaHJpc3RpYW4u
Cgo+Cj4gLS1KYXNvbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCg==
