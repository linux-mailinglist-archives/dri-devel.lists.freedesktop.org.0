Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B412647A7D
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2019 09:13:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C55F89183;
	Mon, 17 Jun 2019 07:13:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from onstation.org (onstation.org [52.200.56.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 094AD89083;
 Mon, 17 Jun 2019 00:18:53 +0000 (UTC)
Received: from localhost (c-98-239-145-235.hsd1.wv.comcast.net
 [98.239.145.235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: masneyb)
 by onstation.org (Postfix) with ESMTPSA id 523DC3E956;
 Mon, 17 Jun 2019 00:18:52 +0000 (UTC)
Date: Sun, 16 Jun 2019 20:18:51 -0400
From: Brian Masney <masneyb@onstation.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 6/6] drm/msm/gpu: add ocmem init/cleanup functions
Message-ID: <20190617001851.GA19038@onstation.org>
References: <20190616132930.6942-1-masneyb@onstation.org>
 <20190616132930.6942-7-masneyb@onstation.org>
 <20190616180633.GS22737@tuxbook-pro>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190616180633.GS22737@tuxbook-pro>
X-Mailman-Approved-At: Mon, 17 Jun 2019 07:13:34 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=onstation.org; s=default; t=1560730732;
 bh=wqA8kfgeU/wUimDPIjCQxIw3A0hNMdWnQpZyfBayxSU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=k8G3nAUTxcqNgWImzT7xSUUpvFWnN0uIXQY0GSCS5P4TBF3nLsLWog4BZA6HedlLN
 Fe1ps7X05QlQkibypgS1bULvBX066jBkqIn5KG3pWVgoIPG/ZtMEiovQ63Ur8yjS8J
 aVmk4fijaFoLxcWSZedSPwER1/S1LOwGaFbjs4oY=
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
Cc: mark.rutland@arm.com, freedreno@lists.freedesktop.org, jonathan@marek.ca,
 devicetree@vger.kernel.org, airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, david.brown@linaro.org,
 agross@kernel.org, dri-devel@lists.freedesktop.org, sean@poorly.run
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQmpvcm4sCgpPbiBTdW4sIEp1biAxNiwgMjAxOSBhdCAxMTowNjozM0FNIC0wNzAwLCBCam9y
biBBbmRlcnNzb24gd3JvdGU6Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21zbS9h
ZHJlbm8vYWRyZW5vX2dwdS5jIGIvZHJpdmVycy9ncHUvZHJtL21zbS9hZHJlbm8vYWRyZW5vX2dw
dS5jCj4gPiBpbmRleCA2ZjdmNDExNGFmY2YuLmUwYTk0MDljOGEzMiAxMDA2NDQKPiA+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9tc20vYWRyZW5vL2FkcmVub19ncHUuYwo+ID4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL21zbS9hZHJlbm8vYWRyZW5vX2dwdS5jCj4gPiBAQCAtMjksNiArMjksMTAgQEAK
PiA+ICAjaW5jbHVkZSAibXNtX2dlbS5oIgo+ID4gICNpbmNsdWRlICJtc21fbW11LmgiCj4gPiAg
Cj4gPiArI2lmZGVmIENPTkZJR19RQ09NX09DTUVNCj4gPiArIyAgaW5jbHVkZSA8c29jL3Fjb20v
b2NtZW0uaD4KPiA+ICsjZW5kaWYKPiAKPiBUaGlzIGZpbGUgZXhpc3RzIChhZnRlciB0aGUgcHJl
dmlvdXMgcGF0Y2gpLCBzbyBubyBuZWVkIHRvIG1ha2UgaXRzCj4gaW5jbHVzaW9uIGNvbmRpdGlv
bmFsLgo+IAo+ID4gKwo+ID4gIHN0YXRpYyBib29sIHphcF9hdmFpbGFibGUgPSB0cnVlOwo+ID4g
IAo+ID4gIHN0YXRpYyBpbnQgemFwX3NoYWRlcl9sb2FkX21kdChzdHJ1Y3QgbXNtX2dwdSAqZ3B1
LCBjb25zdCBjaGFyICpmd25hbWUsCj4gPiBAQCAtODk3LDYgKzkwMSw0MyBAQCBzdGF0aWMgaW50
IGFkcmVub19nZXRfcHdybGV2ZWxzKHN0cnVjdCBkZXZpY2UgKmRldiwKPiA+ICAJcmV0dXJuIDA7
Cj4gPiAgfQo+ID4gIAo+ID4gK2ludCBhZHJlbm9fZ3B1X29jbWVtX2luaXQoc3RydWN0IGRldmlj
ZSAqZGV2LCBzdHJ1Y3QgYWRyZW5vX2dwdSAqYWRyZW5vX2dwdSwKPiA+ICsJCQkgIHN0cnVjdCBh
ZHJlbm9fb2NtZW0gKmFkcmVub19vY21lbSkKPiA+ICt7Cj4gPiArI2lmZGVmIENPTkZJR19RQ09N
X09DTUVNCj4gCj4gTm8gbmVlZCB0byBtYWtlIHRoaXMgY29uZGl0aW9uYWwuCgpJIGhhdmUgdGhl
c2UgI2lmZGVmcyBmb3IgdGhlIGE1eHggYW5kIGE2eHggR1BVcyB0aGF0IGRvbid0IGhhdmUgb2Nt
ZW0KaW4gdGhlIFNvQy4gV2l0aG91dCB0aGUgI2lmZGVmcywgdGhvc2Ugc3lzdGVtcyB3b3VsZCBu
ZWVkIHRvIGhhdmUgdGhlCm9jbWVtIGRyaXZlciBpbiB0aGVpciBrZXJuZWwuCgpUaGFua3MgZm9y
IHRoZSBxdWljayByZXZpZXcgb24gdGhlIHBhdGNoIHNldCEKCkJyaWFuCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
