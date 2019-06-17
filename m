Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 89AEC4917A
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2019 22:37:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 244BC89F73;
	Mon, 17 Jun 2019 20:36:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8287C89F75
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2019 20:36:57 +0000 (UTC)
Received: by mail-oi1-x244.google.com with SMTP id 65so7691304oid.13
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2019 13:36:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WUuONrlgmwtIZdvsw0S0/4Mq9T1WyA1gy6J4VLXnacI=;
 b=W7Z3mnM1tqs9eR0nb0Hte3QcDZklUxMe/TdBD3NUniucM7xkznR9gqvBfEY2mgkgoP
 wvmTS/72LNZxoaLAa+12lG4/b8gkZDadA1KvcYG9MOlXyrVKMJ8P4aO1KBi376jUSs/m
 jTrveoT65h91GtqanYVaM7agX2PbwzQmagcMImTH/56+u4R0w0hGpdxrGSvrUOA4DNlv
 UGI5aYhVu58+M8lAnfV0/fAgQRIi31tlOkiDsNV0/rrPj88K2lTzCcHIdwO9c+sq2m4g
 LJ152iQBNWz4VHxFyf2ayeLZJ0H7xJhPt/zZU4jUlIXc2tqkURghpf+Gv6kTWOz0k195
 cuJQ==
X-Gm-Message-State: APjAAAWk+Csw6SzA64ZqrT5dENdrIesy1fHnpZQXt+Q/NqPib0a2H5jL
 ncvspWXUV39WwBL9UTXiQYYm/8mHq8AVh7lo6QrD/g==
X-Google-Smtp-Source: APXvYqyP6F9zlBzZPah8lr14kIAj+Xnb/4HPIraAg3Phba4tJ1HESSkAprhGKci8EGOWV3IPPT/MSOptYr7l5lvozUE=
X-Received: by 2002:aca:3006:: with SMTP id w6mr9263oiw.5.1560803816566; Mon,
 17 Jun 2019 13:36:56 -0700 (PDT)
MIME-Version: 1.0
References: <20190617122733.22432-1-hch@lst.de>
 <20190617122733.22432-8-hch@lst.de>
 <CAPcyv4hbGfOawfafqQ-L1CMr6OMFGmnDtdgLTXrgQuPxYNHA2w@mail.gmail.com>
 <20190617195404.GA20275@lst.de>
In-Reply-To: <20190617195404.GA20275@lst.de>
From: Dan Williams <dan.j.williams@intel.com>
Date: Mon, 17 Jun 2019 13:36:44 -0700
Message-ID: <CAPcyv4jhhEbLDi82gVw7GLASEtqU=U7Ty67AGwTijmzMqw8X8Q@mail.gmail.com>
Subject: Re: [PATCH 07/25] memremap: validate the pagemap type passed to
 devm_memremap_pages
To: Christoph Hellwig <hch@lst.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=WUuONrlgmwtIZdvsw0S0/4Mq9T1WyA1gy6J4VLXnacI=;
 b=iJnOfDSpsfcRrkO7Z3UmtsU/3SdEZ7eTfjySEwglR4kCk3eP1rlaXEv8n0WSdyQhgA
 KaWNKrnvNbK3Ivdrsdf3WrCRENxklnMUOfkYt77DH4iUmhsBJjRM+eotXHjLnTJ0fpft
 IRATZl7xjDYDdLodZoW7pDj5e/et1XUyWXubUfGW4vRD1RKoqQhNZy2/KBjKy8cusMgh
 2woSBHrnLGC1xQF+N5ZRLi9uSQi5GRNsM2OXCHe8Pv4k1LMuUVnyUieU8WnCi9CQp/zd
 XBqL0kuZ9/hoegyaGxXD87pJJNEmxb5JL0BejjNLkP1oeIbdjPfVsh40yBVMT2gDQuUx
 ng8g==
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
 linux-pci@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdW4gMTcsIDIwMTkgYXQgMTI6NTkgUE0gQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBs
c3QuZGU+IHdyb3RlOgo+Cj4gT24gTW9uLCBKdW4gMTcsIDIwMTkgYXQgMTI6MDI6MDlQTSAtMDcw
MCwgRGFuIFdpbGxpYW1zIHdyb3RlOgo+ID4gTmVlZCBhIGxlYWQgaW4gcGF0Y2ggdGhhdCBpbnRy
b2R1Y2VzIE1FTU9SWV9ERVZJQ0VfREVWREFYLCBvdGhlcndpc2U6Cj4KPiBPciBtYXliZSBhIE1F
TU9SWV9ERVZJQ0VfREVGQVVMVCA9IDAgc2hhcmVkIGJ5IGZzZGF4IGFuZCBwMnBkbWE/CgpJIHRo
b3VnaHQgYWJvdXQgdGhhdCwgYnV0IGl0IHNlZW1zIGlzX3BjaV9wMnBkbWFfcGFnZSgpIG5lZWRz
IHRoZQpkaXN0aW5jdGlvbiBiZXR3ZWVuIHRoZSAyIHR5cGVzLgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
