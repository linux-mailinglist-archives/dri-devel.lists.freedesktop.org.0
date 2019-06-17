Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A97349201
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2019 23:09:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D349B89FDB;
	Mon, 17 Jun 2019 21:09:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8154489FCC
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2019 21:09:36 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id l15so1517917otn.9
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2019 14:09:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=WJY8mRWNKYbMrxiqtcC6On1cSl2WUj/ZIwS4ootoQak=;
 b=OtVA/WtmCLqm70Vp9ZXpYwsufpzNbwH8vOLB0f4I54HqgO4fOON2VwO1BaMM1JeZ+L
 SKtnyNGW1bHKOqoZZQA3nxV9czTdngjTFDJDkmnq6/yCbqiYubgsydLN1q7yOts9s94k
 oFdnhK7GrAxy5jRL9iTn92y8uBtKQNERtbl9o5IE/bm/qo9zji5cFHSOHoJq1xlYjC/g
 rJCzcHF7FE4khsB+BdxHBdIaKIdVbLVJXFPTxRJDXjroK8B34gMl4HhWzBQT3Ga9tXY9
 V3flqL2a/Bx2PT+O6GzfKZEHPA6KMO4pkGdmoH9vzNOFy5oRwDzduQ2ioi0WsgjWlW2M
 vYIw==
X-Gm-Message-State: APjAAAWiLFLJkvfEeoKqROZKRXY9qlX0q6MFKufdeCwRNKh2efszputU
 i4QVg22N95K4UKMYbQMhjAVyHFnoAxrPIALje4SANw==
X-Google-Smtp-Source: APXvYqyAU1TcMvPiGYVYhBbyC0eVXwwhkAqKTWqXoLyuFCBz8f0kthsk9jFJXToSNfs33gSFBQCmV/94ID8R2le9oJQ=
X-Received: by 2002:a9d:7a8b:: with SMTP id l11mr55835238otn.247.1560805775819; 
 Mon, 17 Jun 2019 14:09:35 -0700 (PDT)
MIME-Version: 1.0
References: <20190617122733.22432-1-hch@lst.de>
 <20190617122733.22432-9-hch@lst.de>
 <CAPcyv4i_0wUJHDqY91R=x5M2o_De+_QKZxPyob5=E9CCv8rM7A@mail.gmail.com>
 <20190617195526.GB20275@lst.de>
In-Reply-To: <20190617195526.GB20275@lst.de>
From: Dan Williams <dan.j.williams@intel.com>
Date: Mon, 17 Jun 2019 14:09:24 -0700
Message-ID: <CAPcyv4iYP-7QtO7hDkAeaxJsfUCrCTBSJi3bK6e5v-VVAKQz-w@mail.gmail.com>
Subject: Re: [PATCH 08/25] memremap: move dev_pagemap callbacks into a
 separate structure
To: Christoph Hellwig <hch@lst.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=WJY8mRWNKYbMrxiqtcC6On1cSl2WUj/ZIwS4ootoQak=;
 b=1CPoHsv8eJYyjii0r2v+tpwEGCkSWwSYtZacx/AqtzGMRs3fZPgZrV7RbEeA45KDwP
 lsJvq7QgmiqEwVzp5wdQHibzWroOdc9btguH5MJ/BTdcEtQKRrkY2A644oJ5v1entk28
 jQX1i10dz7Bzaag9WMXeIi4g9aL/drgYMGhz0EwOOdHkXNcNmVY9Lux9aw2TbX6HsoFA
 rgd+c/SR//qS9xH7huYep7vdqcSElSiqUL7CnczUCly0wMqqGAQdyboSJvis9joomSOv
 KyK08LiIatM0igaxt5Yo3ksIlA7sTKvevIo1tgB6DFbvKhgZgBfO8B1hLUl5bdDehAB/
 2KGw==
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
Cc: linux-nvdimm <linux-nvdimm@lists.01.org>, nouveau@lists.freedesktop.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Linux MM <linux-mm@kvack.org>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>,
 linux-pci@vger.kernel.org, Logan Gunthorpe <logang@deltatee.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdW4gMTcsIDIwMTkgYXQgMTI6NTkgUE0gQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBs
c3QuZGU+IHdyb3RlOgo+Cj4gT24gTW9uLCBKdW4gMTcsIDIwMTkgYXQgMTA6NTE6MzVBTSAtMDcw
MCwgRGFuIFdpbGxpYW1zIHdyb3RlOgo+ID4gPiAtICAgICAgIHN0cnVjdCBkZXZfcGFnZW1hcCAq
cGdtYXAgPSBfcGdtYXA7Cj4gPgo+ID4gV2hvb3BzLCBuZWVkZWQgdG8ga2VlcCB0aGlzIGxpbmUg
dG8gYXZvaWQ6Cj4gPgo+ID4gdG9vbHMvdGVzdGluZy9udmRpbW0vdGVzdC9pb21hcC5jOjEwOTox
MTogZXJyb3I6IOKAmHBnbWFw4oCZIHVuZGVjbGFyZWQKPiA+IChmaXJzdCB1c2UgaW4gdGhpcyBm
dW5jdGlvbik7IGRpZCB5b3UgbWVhbiDigJhfcGdtYXDigJk/Cj4KPiBTbyBJIHJlYWxseSBzaG91
bGRuJ3QgYmUgdHJpcHBpbmcgb3ZlciB0aGlzIGFueW1vcmUsIGJ1dCBjYW4gd2Ugc29tZWhvdwo+
IHRoaXMgbWVzcz8KPgo+ICAtIGF0IGxlYXN0IGFkZCBpdCB0byB0aGUgbm9ybWFsIGJ1aWxkIHN5
c3RlbSBhbmQga2NvbmZpZyBkZXBzIGluc3RlYWQKPiAgICBvZiBzdGFzaGluZyBpdCBhd2F5IHNv
IHRoYXQgdGhpbmdzIGxpa2UgYnVpbGRib3QgY2FuIGJ1aWxkIGl0Pwo+ICAtIGF0IGxlYXN0IGFs
bG93IGJ1aWxkaW5nIGl0ICh1bmRlciBDT01QSUxFX1RFU1QpIGlmIG5lZWRlZCBldmVuIHdoZW4K
PiAgICBwbWVtLmtvIGFuZCBmcmllbmRzIGFyZSBidWlsdCBpbiB0aGUga2VybmVsPwoKRG9uZTog
aHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wYXRjaC8xMTAwMDQ3Ny8KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
