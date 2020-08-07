Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6753223E71B
	for <lists+dri-devel@lfdr.de>; Fri,  7 Aug 2020 07:52:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55FC96E95D;
	Fri,  7 Aug 2020 05:52:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96DBB6E95D
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Aug 2020 05:52:27 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B438120866;
 Fri,  7 Aug 2020 05:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596779547;
 bh=VrTc5pr7hXkvJgVB3uN/B80HBQFTxP5+kpw5LS5EzAg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UFNPuzPGH9tHUnlaF2r5NMb+vdjJwWbNUP64KapCaARfWmoTWnCqkiXj/3IQoYjiQ
 ZyEL5J/FuZr/i59mk/feuDtu5nfUo9pZYTd1rWHykE8rgHlGclkNGK1PMqJZKxZH5F
 7exPTDGS7SGZieec/4LE40wqiwlrmr7MZauHh2ek=
Date: Fri, 7 Aug 2020 07:52:41 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: =?utf-8?B?5L2V6ZGr?= <hexin.op@bytedance.com>
Subject: Re: [PATCH v3] drm/virtio: fix missing dma_fence_put() in
 virtio_gpu_execbuffer_ioctl()
Message-ID: <20200807055241.GA3025028@kroah.com>
References: <20200721101647.42653-1-hexin.op@bytedance.com>
 <CACKzwj=obkJPmMb1cGKDwBdgkxa92kpPTP9c2SzFWbbzcD6Luw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACKzwj=obkJPmMb1cGKDwBdgkxa92kpPTP9c2SzFWbbzcD6Luw@mail.gmail.com>
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 kraxel@redhat.com, Muchun Song <songmuchun@bytedance.com>,
 Qi Liu <liuqi.16@bytedance.com>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBBdWcgMDcsIDIwMjAgYXQgMTE6MDA6MTFBTSArMDgwMCwg5L2V6ZGrIHdyb3RlOgo+
IFhpbiBIZSA8aGV4aW4ub3BAYnl0ZWRhbmNlLmNvbT4g5LqOMjAyMOW5tDfmnIgyMeaXpeWRqOS6
jCDkuIvljYg2OjE35YaZ6YGT77yaCj4gPgo+ID4gRnJvbTogUWkgTGl1IDxsaXVxaS4xNkBieXRl
ZGFuY2UuY29tPgo+ID4KPiA+IFdlIHNob3VsZCBwdXQgdGhlIHJlZmVyZW5jZSBjb3VudCBvZiB0
aGUgZmVuY2UgYWZ0ZXIgY2FsbGluZwo+ID4gdmlydGlvX2dwdV9jbWRfc3VibWl0KCkuIFNvIGFk
ZCB0aGUgbWlzc2luZyBkbWFfZmVuY2VfcHV0KCkuCj4gPgo+ID4gRml4ZXM6IDJjZDdiNmYwOGJj
NCAoImRybS92aXJ0aW86IGFkZCBpbi9vdXQgZmVuY2Ugc3VwcG9ydCBmb3IgZXhwbGljaXQgc3lu
Y2hyb25pemF0aW9uIikKPiA+IENvLWRldmVsb3BlZC1ieTogWGluIEhlIDxoZXhpbi5vcEBieXRl
ZGFuY2UuY29tPgo+ID4gU2lnbmVkLW9mZi1ieTogWGluIEhlIDxoZXhpbi5vcEBieXRlZGFuY2Uu
Y29tPgo+ID4gU2lnbmVkLW9mZi1ieTogUWkgTGl1IDxsaXVxaS4xNkBieXRlZGFuY2UuY29tPgo+
ID4gUmV2aWV3ZWQtYnk6IE11Y2h1biBTb25nIDxzb25nbXVjaHVuQGJ5dGVkYW5jZS5jb20+Cj4g
PiAtLS0KPiA+Cj4gPiBjaGFuZ2Vsb2cgaW4gdjM6Cj4gPiAxKSBDaGFuZ2UgdGhlIHN1YmplY3Qg
ZnJvbSAiZHJtL3ZpcnRpbzogZml4ZWQgbWVtb3J5IGxlYWsgaW4gdmlydGlvX2dwdV9leGVjYnVm
ZmVyX2lvY3RsKCkiIHRvCj4gPiAgICAiZHJtL3ZpcnRpbzogZml4IG1pc3NpbmcgZG1hX2ZlbmNl
X3B1dCgpIGluIHZpcnRpb19ncHVfZXhlY2J1ZmZlcl9pb2N0bCgpIgo+ID4gMikgUmV3b3JrIHRo
ZSBjb21taXQgbG9nCj4gPgo+ID4gY2hhbmdlbG9nIGluIHYyOgo+ID4gMSkgQWRkIGEgY2hhbmdl
IGRlc2NyaXB0aW9uCj4gPgo+ID4gIGRyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9pb2N0
bC5jIHwgMSArCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4gPgo+ID4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9pb2N0bC5jIGIvZHJpdmVy
cy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X2lvY3RsLmMKPiA+IGluZGV4IDVkZjcyMjA3MmJhMC4u
MTljNWJjMDFlYjc5IDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0
Z3B1X2lvY3RsLmMKPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9pb2N0
bC5jCj4gPiBAQCAtMTc5LDYgKzE3OSw3IEBAIHN0YXRpYyBpbnQgdmlydGlvX2dwdV9leGVjYnVm
ZmVyX2lvY3RsKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHZvaWQgKmRhdGEsCj4gPgo+ID4gICAg
ICAgICB2aXJ0aW9fZ3B1X2NtZF9zdWJtaXQodmdkZXYsIGJ1ZiwgZXhidWYtPnNpemUsCj4gPiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICB2ZnByaXYtPmN0eF9pZCwgYnVmbGlzdCwgb3V0
X2ZlbmNlKTsKPiA+ICsgICAgICAgZG1hX2ZlbmNlX3B1dCgmb3V0X2ZlbmNlLT5mKTsKPiA+ICAg
ICAgICAgdmlydGlvX2dwdV9ub3RpZnkodmdkZXYpOwo+ID4gICAgICAgICByZXR1cm4gMDsKPiA+
Cj4gPiAtLQo+ID4gMi4yMS4xIChBcHBsZSBHaXQtMTIyLjMpCj4gPgo+IAo+IGNjIEdyZWcKCldo
eT8KCiQgLi9zY3JpcHRzL2dldF9tYWludGFpbmVyLnBsIC0tZmlsZSBkcml2ZXJzL2dwdS9kcm0v
dmlydGlvL3ZpcnRncHVfaW9jdGwuYwpEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+ICht
YWludGFpbmVyOlZJUlRJTyBHUFUgRFJJVkVSKQpHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVkaGF0
LmNvbT4gKG1haW50YWluZXI6VklSVElPIEdQVSBEUklWRVIpCkRhbmllbCBWZXR0ZXIgPGRhbmll
bEBmZndsbC5jaD4gKG1haW50YWluZXI6RFJNIERSSVZFUlMpClN1bWl0IFNlbXdhbCA8c3VtaXQu
c2Vtd2FsQGxpbmFyby5vcmc+IChtYWludGFpbmVyOkRNQSBCVUZGRVIgU0hBUklORyBGUkFNRVdP
UkspCiJDaHJpc3RpYW4gS8O2bmlnIiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPiAobWFpbnRh
aW5lcjpETUEgQlVGRkVSIFNIQVJJTkcgRlJBTUVXT1JLKQpkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnIChvcGVuIGxpc3Q6VklSVElPIEdQVSBEUklWRVIpCnZpcnR1YWxpemF0aW9uQGxp
c3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnIChvcGVuIGxpc3Q6VklSVElPIEdQVSBEUklWRVIpCmxp
bnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcgKG9wZW4gbGlzdCkKbGludXgtbWVkaWFAdmdlci5r
ZXJuZWwub3JnIChvcGVuIGxpc3Q6RE1BIEJVRkZFUiBTSEFSSU5HIEZSQU1FV09SSykKbGluYXJv
LW1tLXNpZ0BsaXN0cy5saW5hcm8ub3JnIChtb2RlcmF0ZWQgbGlzdDpETUEgQlVGRkVSIFNIQVJJ
TkcgRlJBTUVXT1JLKQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCg==
