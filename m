Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ABEC36E3B
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2019 10:12:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F03EF89341;
	Thu,  6 Jun 2019 08:12:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AE4C89341;
 Thu,  6 Jun 2019 08:12:45 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Jun 2019 01:12:45 -0700
X-ExtLoop1: 1
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga001.fm.intel.com with SMTP; 06 Jun 2019 01:12:42 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 06 Jun 2019 11:12:41 +0300
Date: Thu, 6 Jun 2019 11:12:41 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH] drm/crc-debugfs: User irqsafe spinlock in
 drm_crtc_add_crc_entry
Message-ID: <20190606081241.GT5942@intel.com>
References: <20190605194556.16744-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190605194556.16744-1-daniel.vetter@ffwll.ch>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdW4gMDUsIDIwMTkgYXQgMDk6NDU6NTZQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBXZSBjYW4gYmUgY2FsbGVkIGZyb20gYW55IGNvbnRleHQsIHdlIG5lZWQgdG8gYmUg
cHJlcGFyZWQuCj4gCj4gTm90aWNlZCB0aGlzIHdoaWxlIGhhY2tpbmcgb24gdmttcywgd2hpY2gg
Y2FsbHMgdGhpcyBmdW5jdGlvbiBmcm9tIGEKPiBub3JtYWwgd29ya2VyLiBXaGljaCByZWFsbHkg
dXBzZXRzIGxvY2tkZXAuCj4gCj4gQ2M6IFJvZHJpZ28gU2lxdWVpcmEgPHJvZHJpZ29zaXF1ZWly
YW1lbG9AZ21haWwuY29tPgo+IENjOiBUb21ldSBWaXpvc28gPHRvbWV1LnZpem9zb0Bjb2xsYWJv
cmEuY29tPgo+IENjOiBFbWlsIFZlbGlrb3YgPGVtaWwudmVsaWtvdkBjb2xsYWJvcmEuY29tPgo+
IENjOiBCZW5qYW1pbiBHYWlnbmFyZCA8YmVuamFtaW4uZ2FpZ25hcmRAbGluYXJvLm9yZz4KPiBT
aWduZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4KClJl
dmlld2VkLWJ5OiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29t
PgoKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2RybV9kZWJ1Z2ZzX2NyYy5jIHwgNSArKystLQo+
ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RlYnVnZnNfY3JjLmMgYi9kcml2ZXJzL2dw
dS9kcm0vZHJtX2RlYnVnZnNfY3JjLmMKPiBpbmRleCA1ODUxNjlmMGRjYzUuLjdmMzViNWJhMTky
NCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RlYnVnZnNfY3JjLmMKPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RlYnVnZnNfY3JjLmMKPiBAQCAtMzk2LDggKzM5Niw5IEBA
IGludCBkcm1fY3J0Y19hZGRfY3JjX2VudHJ5KHN0cnVjdCBkcm1fY3J0YyAqY3J0YywgYm9vbCBo
YXNfZnJhbWUsCj4gIAlzdHJ1Y3QgZHJtX2NydGNfY3JjICpjcmMgPSAmY3J0Yy0+Y3JjOwo+ICAJ
c3RydWN0IGRybV9jcnRjX2NyY19lbnRyeSAqZW50cnk7Cj4gIAlpbnQgaGVhZCwgdGFpbDsKPiAr
CXVuc2lnbmVkIGxvbmcgZmxhZ3M7Cj4gIAo+IC0Jc3Bpbl9sb2NrKCZjcmMtPmxvY2spOwo+ICsJ
c3Bpbl9sb2NrX2lycXNhdmUoJmNyYy0+bG9jaywgZmxhZ3MpOwo+ICAKPiAgCS8qIENhbGxlciBt
YXkgbm90IGhhdmUgbm90aWNlZCB5ZXQgdGhhdCB1c2Vyc3BhY2UgaGFzIHN0b3BwZWQgcmVhZGlu
ZyAqLwo+ICAJaWYgKCFjcmMtPmVudHJpZXMpIHsKPiBAQCAtNDI4LDcgKzQyOSw3IEBAIGludCBk
cm1fY3J0Y19hZGRfY3JjX2VudHJ5KHN0cnVjdCBkcm1fY3J0YyAqY3J0YywgYm9vbCBoYXNfZnJh
bWUsCj4gIAloZWFkID0gKGhlYWQgKyAxKSAmIChEUk1fQ1JDX0VOVFJJRVNfTlIgLSAxKTsKPiAg
CWNyYy0+aGVhZCA9IGhlYWQ7Cj4gIAo+IC0Jc3Bpbl91bmxvY2soJmNyYy0+bG9jayk7Cj4gKwlz
cGluX3VubG9ja19pcnFyZXN0b3JlKCZjcmMtPmxvY2ssIGZsYWdzKTsKPiAgCj4gIAl3YWtlX3Vw
X2ludGVycnVwdGlibGUoJmNyYy0+d3EpOwo+ICAKPiAtLSAKPiAyLjIwLjEKPiAKPiBfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKCi0tIApWaWxsZSBT
eXJqw6Rsw6QKSW50ZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
