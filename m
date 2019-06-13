Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1294A44D26
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 22:13:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BB1B8929C;
	Thu, 13 Jun 2019 20:13:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2A0D8928F
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 20:13:52 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id 107so409151otj.8
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 13:13:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DdSbzBj3GN9lmFE97uLhhDp9bhFpPD/Ri2wBNX09PfQ=;
 b=j2Tlfh4TpqYLQrjk+UkPDT547qYu1oYRZUWZ9Rix/3nyBsPmEBcDo3gS8bvZ2b0UL8
 fBB93fjUGhBeeXurmRyeIBM44EazFgZP52W2P5W8Rddlz7Uwqvaz0kSp8klq0LolabAa
 oXec6AM+NjpNFYw3FPqhGEnYTfGy7dwsCGcKSceQCNl1aAbSr7bXzkHrWqF7kVcA7RqB
 MjW2pNh9XoZ/VTwle0WDmbbXiRdVbDGvcipnYkXQ36GoI92c1uzGrHZYIdK4DsDOt9PJ
 UcYlpEqJbMxktCBuiYLC53CCEUqvuFjt21eV+55iaQjmy9V9Lwbxs30tpTnshQUkRboU
 6U5A==
X-Gm-Message-State: APjAAAXTevN90GAO0VftcGPLnOs90oQofSYFUV6BpuAbNJeDDctB6pek
 Nf586SDWHsC8UpOMGRgWZCvk3gc4YEFeMm7RRnWaSg==
X-Google-Smtp-Source: APXvYqykaGayuOdeZmPun6lqMah28WqyaWO5bFenPtOzBFg0qXVTvO/T6gfkniMpvZVUXEcVxeJc+t1pW1I4QrwLh2Q=
X-Received: by 2002:a9d:7a9a:: with SMTP id l26mr37784514otn.71.1560456832159; 
 Thu, 13 Jun 2019 13:13:52 -0700 (PDT)
MIME-Version: 1.0
References: <20190613094326.24093-1-hch@lst.de>
 <20190613094326.24093-10-hch@lst.de>
 <20190613193427.GU22062@mellanox.com>
In-Reply-To: <20190613193427.GU22062@mellanox.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Thu, 13 Jun 2019 13:13:41 -0700
Message-ID: <CAPcyv4iwVPm2XBviR8E32VJG+ZZTHZLGxDdXS3et22CTT_3qNA@mail.gmail.com>
Subject: Re: [PATCH 09/22] memremap: lift the devmap_enable manipulation into
 devm_memremap_pages
To: Jason Gunthorpe <jgg@mellanox.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=DdSbzBj3GN9lmFE97uLhhDp9bhFpPD/Ri2wBNX09PfQ=;
 b=OSBqGRX5/KZ8rtnYLy8/+VzWXJoy8dOkJHihIoyUXY2eP7FoiV7nziOVkOw4+nZKoB
 8BX3vQfUbWi26DrxuPJOZQTkwLvG8bcvI5bR3K46S8XaTPV6uYDB19u7pEoWDIMGVXIT
 76Gat4HdmnE0UfZtW6tDnTRkZMx/UjOMIIhYc/M0re4EVEJMI//Xgzy79OcW2RngZAFY
 Ex/a+k84aj46psorP2SyODhm0RWUknVG0v09x5bcP8Nl31V8edNccp6WpICo1yfvAEqk
 4PlHWylrgwZOgDTADWj7FVO4iX7LA9uouJaVlZvN2+vo54OtBLhCAxLVmuocFehTb/fy
 IX0Q==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: "linux-nvdimm@lists.01.org" <linux-nvdimm@lists.01.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Ben Skeggs <bskeggs@redhat.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdW4gMTMsIDIwMTkgYXQgMTI6MzUgUE0gSmFzb24gR3VudGhvcnBlIDxqZ2dAbWVs
bGFub3guY29tPiB3cm90ZToKPgo+IE9uIFRodSwgSnVuIDEzLCAyMDE5IGF0IDExOjQzOjEyQU0g
KzAyMDAsIENocmlzdG9waCBIZWxsd2lnIHdyb3RlOgo+ID4gSnVzdCBjaGVjayBpZiB0aGVyZSBp
cyBhIC0+cGFnZV9mcmVlIG9wZXJhdGlvbiBzZXQgYW5kIHRha2UgY2FyZSBvZiB0aGUKPiA+IHN0
YXRpYyBrZXkgZW5hYmxlLCBhcyB3ZWxsIGFzIHRoZSBwdXQgdXNpbmcgZGV2aWNlIG1hbmFnZWQg
cmVzb3VyY2VzLgo+ID4gZGlmZiAtLWdpdCBhL21tL2htbS5jIGIvbW0vaG1tLmMKPiA+IGluZGV4
IGM3NmExYjVkZWZkYS4uNmRjNzY5ZmViMmUxIDEwMDY0NAo+ID4gKysrIGIvbW0vaG1tLmMKPiA+
IEBAIC0xMzc4LDggKzEzNzgsNiBAQCBzdHJ1Y3QgaG1tX2Rldm1lbSAqaG1tX2Rldm1lbV9hZGQo
Y29uc3Qgc3RydWN0IGhtbV9kZXZtZW1fb3BzICpvcHMsCj4gPiAgICAgICB2b2lkICpyZXN1bHQ7
Cj4gPiAgICAgICBpbnQgcmV0Owo+ID4KPiA+IC0gICAgIGRldl9wYWdlbWFwX2dldF9vcHMoKTsK
PiA+IC0KPgo+IFdoZXJlIHdhcyB0aGUgbWF0Y2hpbmcgZGV2X3BhZ2VtYXBfcHV0X29wcygpIGZv
ciB0aGlzIGhtbSBjYXNlPyBUaGlzCj4gaXMgYSBidWcgZml4IHRvbz8KPgoKSXQgbmV2ZXIgZXhp
c3RlZC4gSE1NIHR1cm5lZCBvbiB0aGUgZmFjaWxpdHkgYW5kIG1hZGUgZXZlcnlvbmUncwpwdXRf
cGFnZSgpIG9wZXJhdGlvbnMgc2xvd2VyIHJlZ2FyZGxlc3Mgb2Ygd2hldGhlciBITU0gd2FzIGlu
IGFjdGl2ZQp1c2UuCgo+IFRoZSBub3V2ZWF1IGRyaXZlciBpcyB0aGUgb25seSBvbmUgdG8gYWN0
dWFsbHkgY2FsbCB0aGlzIGhtbSBmdW5jdGlvbgo+IGFuZCBpdCBkb2VzIGl0IGFzIHBhcnQgb2Yg
YSBwcm9iZSBmdW5jdGlvbi4KPgo+IFNlZW1zIHJlYXNvbmFibGUsIGhvd2V2ZXIsIGluIHRoZSB1
bmxpa2VseSBldmVudCB0aGF0IGl0IGZhaWxzIHRvIGluaXQKPiAnZG1lbScgdGhlIGRyaXZlciB3
aWxsIHJldGFpbiBhIGRldl9wYWdlbWFwX2dldF9vcHMgdW50aWwgaXQgdW5sb2Fkcy4KPiBUaGlz
IGltYmFsYW5jZSBkb2Vzbid0IHNlZW0gd29ydGggd29ycnlpbmcgYWJvdXQuCgpSaWdodCwgdW5s
ZXNzL3VudGlsIHRoZSBvdmVyaGVhZCBvZiBjaGVja2luZyBmb3IgcHV0X3BhZ2UoKSBjYWxsYmFj
a3MKc3RhcnRzIHRvIGh1cnQgbGVhdmluZyBwYWdlbWFwX29wcyB0aWVkIHRvIGxpZmV0aW1lIG9m
IHRoZSBkcml2ZXIgbG9hZApzZWVtcyBhY2NlcHRhYmxlIGJlY2F1c2Ugd2hvIHVuYmluZHMgdGhl
aXIgR1BVIGRldmljZSBhdCBydW50aW1lPyBPbgp0aGUgb3RoZXIgaGFuZCBpdCB3YXMgc2ltcGxl
IGVub3VnaCBmb3IgdGhlIHBtZW0gZHJpdmVyIHRvIGRyb3AgdGhlCnJlZmVyZW5jZSBlYWNoIHRp
bWUgYSBkZXZpY2Ugd2FzIHVuYm91bmQganVzdCB0byBjbG9zZSB0aGUgbG9vcC4KCj4KPiBSZXZp
ZXdlZC1ieTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+CgouLi5taW5vciB0eXBvLgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
