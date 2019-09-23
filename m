Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 471ABBB8D9
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2019 18:01:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 329206E969;
	Mon, 23 Sep 2019 16:00:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E4F86E966
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2019 16:00:55 +0000 (UTC)
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id B1C8D81DE8
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2019 16:00:54 +0000 (UTC)
Received: by mail-qk1-f198.google.com with SMTP id q80so18116479qke.22
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2019 09:00:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=FnrZlG9onHbzoUOas395WBpQBkqdPWiXJrz3kgJAMNs=;
 b=j/ICZLuyCx4f0L2TBWDFQfbkHRXXnPFIzEBvw/+T+zuhLKD7bWgbmNYc/PhMJTDG7K
 16QmA8gleTGDOb202h5GoReeCjf+60DMZ5XGPW6/3Kgh3PBVB9SE1+pucf309j+8WoPL
 Brl9OEB7vhbxUOTO5cgcqM8P46l8Rjm9508zGQf/TZPkAgmY54jcTPpn0TI0XasqE5tc
 jpcePABTcodPPy7Cl2zVKPCBbAGeTX4TmJYjE4RCX99Ds+5uYiJ8+1Jg+MKQ4LJCSkzD
 I372o5Ubpz9+wbmRadWmRGMdX9voseXnxX2KmO7TT86MJ1kcCt1o89GA6NRAHthIAf1P
 DTtg==
X-Gm-Message-State: APjAAAXMHNLLVoK7MNh7G0/gjacAPd3oSqxQ7MdPISTmYq6CddjdX2Q9
 qR3BmG7wquzpFgrcFDlKDwhVZLUE4pv+ZMTviJFV3FpT64G88Cy6BpEKjbCud4HYoy6jo2oSI6m
 0phGC1cy4tXKu9zyAVONr/MWUqAeM
X-Received: by 2002:a0c:e48b:: with SMTP id n11mr25662871qvl.38.1569254453748; 
 Mon, 23 Sep 2019 09:00:53 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzeS0qH7VWztyzQkjfFK33LHuBL/0r9aVYJeACu8zWG4i5I+VaFWBP3hOAewtn9oF8WJysLNw==
X-Received: by 2002:a0c:e48b:: with SMTP id n11mr25662820qvl.38.1569254453463; 
 Mon, 23 Sep 2019 09:00:53 -0700 (PDT)
Received: from redhat.com (bzq-79-176-40-226.red.bezeqint.net. [79.176.40.226])
 by smtp.gmail.com with ESMTPSA id m125sm5840827qkd.3.2019.09.23.09.00.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Sep 2019 09:00:52 -0700 (PDT)
Date: Mon, 23 Sep 2019 12:00:41 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [PATCH 5/6] vringh: fix copy direction of vringh_iov_push_kern()
Message-ID: <20190923115930-mutt-send-email-mst@kernel.org>
References: <20190923130331.29324-1-jasowang@redhat.com>
 <20190923130331.29324-6-jasowang@redhat.com>
 <20190923094559.765da494@x1.home>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190923094559.765da494@x1.home>
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
Cc: kvm@vger.kernel.org, airlied@linux.ie, Jason Wang <jasowang@redhat.com>,
 heiko.carstens@de.ibm.com, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, kwankhede@nvidia.com,
 rob.miller@broadcom.com, linux-s390@vger.kernel.org, sebott@linux.ibm.com,
 lulu@redhat.com, eperezma@redhat.com, pasic@linux.ibm.com,
 borntraeger@de.ibm.com, haotian.wang@sifive.com,
 intel-gfx@lists.freedesktop.org, zhi.a.wang@intel.com, farman@linux.ibm.com,
 idos@mellanox.com, gor@linux.ibm.com, cunming.liang@intel.com,
 rodrigo.vivi@intel.com, xiao.w.wang@intel.com, freude@linux.ibm.com,
 parav@mellanox.com, zhihong.wang@intel.com,
 intel-gvt-dev@lists.freedesktop.org, akrowiak@linux.ibm.com,
 oberpar@linux.ibm.com, tiwei.bie@intel.com, netdev@vger.kernel.org,
 cohuck@redhat.com, linux-kernel@vger.kernel.org, maxime.coquelin@redhat.com,
 lingshan.zhu@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBTZXAgMjMsIDIwMTkgYXQgMDk6NDU6NTlBTSAtMDYwMCwgQWxleCBXaWxsaWFtc29u
IHdyb3RlOgo+IE9uIE1vbiwgMjMgU2VwIDIwMTkgMjE6MDM6MzAgKzA4MDAKPiBKYXNvbiBXYW5n
IDxqYXNvd2FuZ0ByZWRoYXQuY29tPiB3cm90ZToKPiAKPiA+IFdlIHdhbnQgdG8gY29weSBmcm9t
IGlvdiB0byBidWYsIHNvIHRoZSBkaXJlY3Rpb24gd2FzIHdyb25nLgo+ID4gCj4gPiBTaWduZWQt
b2ZmLWJ5OiBKYXNvbiBXYW5nIDxqYXNvd2FuZ0ByZWRoYXQuY29tPgo+ID4gLS0tCj4gPiAgZHJp
dmVycy92aG9zdC92cmluZ2guYyB8IDggKysrKysrKy0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgNyBp
bnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gCj4gV2h5IGlzIHRoaXMgaW5jbHVkZWQg
aW4gdGhlIHNlcmllcz8gIFNlZW1zIGxpa2UgYW4gdW5yZWxhdGVkIGZpeCBiZWluZwo+IGhlbGQg
dXAgd2l0aGluIGEgcHJvcG9zYWwgZm9yIGEgbmV3IGZlYXR1cmUuICBUaGFua3MsCj4gCj4gQWxl
eAoKSXQncyBiZXR0ZXIgdG8gaGF2ZSBpdCBhcyBwYXRjaCAxLzYsIGJ1dCBpdCdzIGEgZGVwZW5k
ZW5jeSBvZiB0aGUKZXhhbXBsZSBkcml2ZXIgaW4gdGhlIHNlcmllcy4gSSBjYW4gcmVvcmRlciB3
aGVuIEkgYXBwbHkuCgoKPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3Zob3N0L3ZyaW5naC5jIGIv
ZHJpdmVycy92aG9zdC92cmluZ2guYwo+ID4gaW5kZXggMDhhZDBkMWYwNDc2Li5hMGEyZDc0OTY3
ZWYgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL3Zob3N0L3ZyaW5naC5jCj4gPiArKysgYi9kcml2
ZXJzL3Zob3N0L3ZyaW5naC5jCj4gPiBAQCAtODUyLDYgKzg1MiwxMiBAQCBzdGF0aWMgaW5saW5l
IGludCB4ZmVyX2tlcm4odm9pZCAqc3JjLCB2b2lkICpkc3QsIHNpemVfdCBsZW4pCj4gPiAgCXJl
dHVybiAwOwo+ID4gIH0KPiA+ICAKPiA+ICtzdGF0aWMgaW5saW5lIGludCBrZXJuX3hmZXIodm9p
ZCAqZHN0LCB2b2lkICpzcmMsIHNpemVfdCBsZW4pCj4gPiArewo+ID4gKwltZW1jcHkoZHN0LCBz
cmMsIGxlbik7Cj4gPiArCXJldHVybiAwOwo+ID4gK30KPiA+ICsKPiA+ICAvKioKPiA+ICAgKiB2
cmluZ2hfaW5pdF9rZXJuIC0gaW5pdGlhbGl6ZSBhIHZyaW5naCBmb3IgYSBrZXJuZWxzcGFjZSB2
cmluZy4KPiA+ICAgKiBAdnJoOiB0aGUgdnJpbmdoIHRvIGluaXRpYWxpemUuCj4gPiBAQCAtOTU4
LDcgKzk2NCw3IEBAIEVYUE9SVF9TWU1CT0wodnJpbmdoX2lvdl9wdWxsX2tlcm4pOwo+ID4gIHNz
aXplX3QgdnJpbmdoX2lvdl9wdXNoX2tlcm4oc3RydWN0IHZyaW5naF9raW92ICp3aW92LAo+ID4g
IAkJCSAgICAgY29uc3Qgdm9pZCAqc3JjLCBzaXplX3QgbGVuKQo+ID4gIHsKPiA+IC0JcmV0dXJu
IHZyaW5naF9pb3ZfeGZlcih3aW92LCAodm9pZCAqKXNyYywgbGVuLCB4ZmVyX2tlcm4pOwo+ID4g
KwlyZXR1cm4gdnJpbmdoX2lvdl94ZmVyKHdpb3YsICh2b2lkICopc3JjLCBsZW4sIGtlcm5feGZl
cik7Cj4gPiAgfQo+ID4gIEVYUE9SVF9TWU1CT0wodnJpbmdoX2lvdl9wdXNoX2tlcm4pOwo+ID4g
IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
