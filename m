Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C07EA9F39
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2019 12:05:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8074890D8;
	Thu,  5 Sep 2019 10:05:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52FB5890BA
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Sep 2019 10:05:32 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id CA9A026D;
 Thu,  5 Sep 2019 12:05:30 +0200 (CEST)
Date: Thu, 5 Sep 2019 13:05:24 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jyri Sarha <jsarha@ti.com>
Subject: Re: [PATCH 4/7] drm/omap: Implement CTM property for CRTC using OVL
 managers CPR matrix
Message-ID: <20190905100524.GF5035@pendragon.ideasonboard.com>
References: <20190902125359.18001-1-tomi.valkeinen@ti.com>
 <20190902125359.18001-5-tomi.valkeinen@ti.com>
 <20190903152413.GB8247@pendragon.ideasonboard.com>
 <b44372e2-1bb7-ddb8-d121-ae096b38d918@ti.com>
 <20190904111105.GA4811@pendragon.ideasonboard.com>
 <d75b942b-0256-3824-9055-1f6b68bb8c3b@ti.com>
 <20190904215200.GN5433@pendragon.ideasonboard.com>
 <67eafe69-e947-5572-b29c-f306b792f8ee@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <67eafe69-e947-5572-b29c-f306b792f8ee@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1567677931;
 bh=Lt42htfi4ReODk7UgoKZ7zFdMfCrpv46ZFf3Ztyor8Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EQ+w25oSHrM/IZDHPPDG+oLDkp2AbdXS6VHa7958apIIUjwTuxoQZrGOtcPLia/J0
 SbwjKQMlQEAIY1dILK2pxCnP113kQAhEnUWrTvSjN664Fh12BA0sryVND90yg0fIV+
 Ibmr3rNTvgj6IpF+kWolKLNyOZBIG94g7DJAfZrc=
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
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSnlyaSwKCk9uIFRodSwgU2VwIDA1LCAyMDE5IGF0IDAxOjAwOjUxUE0gKzAzMDAsIEp5cmkg
U2FyaGEgd3JvdGU6Cj4gT24gMDUvMDkvMjAxOSAwMDo1MiwgTGF1cmVudCBQaW5jaGFydCB3cm90
ZToKPiA+Pj4+Pj4gIHN0YXRpYyB2b2lkIG9tYXBfY3J0Y193cml0ZV9jcnRjX3Byb3BlcnRpZXMo
c3RydWN0IGRybV9jcnRjICpjcnRjKQo+ID4+Pj4+PiAgewo+ID4+Pj4+PiAgCXN0cnVjdCBvbWFw
X2RybV9wcml2YXRlICpwcml2ID0gY3J0Yy0+ZGV2LT5kZXZfcHJpdmF0ZTsKPiA+Pj4+Pj4gQEAg
LTQwMiw3ICs0MjgsMTYgQEAgc3RhdGljIHZvaWQgb21hcF9jcnRjX3dyaXRlX2NydGNfcHJvcGVy
dGllcyhzdHJ1Y3QgZHJtX2NydGMgKmNydGMpCj4gPj4+Pj4+ICAJaW5mby5kZWZhdWx0X2NvbG9y
ID0gMHgwMDAwMDA7Cj4gPj4+Pj4+ICAJaW5mby50cmFuc19lbmFibGVkID0gZmFsc2U7Cj4gPj4+
Pj4+ICAJaW5mby5wYXJ0aWFsX2FscGhhX2VuYWJsZWQgPSBmYWxzZTsKPiA+Pj4+Pj4gLQlpbmZv
LmNwcl9lbmFibGUgPSBmYWxzZTsKPiA+Pj4+Pj4gKwo+ID4+Pj4+PiArCWlmIChjcnRjLT5zdGF0
ZS0+Y3RtKSB7Cj4gPj4+Pj4+ICsJCXN0cnVjdCBkcm1fY29sb3JfY3RtICpjdG0gPQo+ID4+Pj4+
PiArCQkJKHN0cnVjdCBkcm1fY29sb3JfY3RtICopIGNydGMtPnN0YXRlLT5jdG0tPmRhdGE7Cj4g
Pj4+Pj4+ICsKPiA+Pj4+Pj4gKwkJaW5mby5jcHJfZW5hYmxlID0gdHJ1ZTsKPiA+Pj4+Pj4gKwkJ
b21hcF9jcnRjX2Nwcl9jb2Vmc19mcm9tX2N0bShjdG0sICZpbmZvLmNwcl9jb2Vmcyk7Cj4gPj4+
Pj4KPiA+Pj4+PiBBcyBhbiBvcHRpbWlzYXRpb24gaXQgd291bGQgYmUgbmljZSB0byBvbmx5IHdy
aXRlIHRoZSBjb2VmZmljaWVudHMgd2hlbgo+ID4+Pj4+IHRoZXkgYWN0dWFsbHkgY2hhbmdlLiBU
aGF0IGNvdWxkIGJlIGltcGxlbWVudGVkIG9uIHRvcCBvZiB0aGlzIHNlcmllcy4KPiA+Pj4+Cj4g
Pj4+PiBFLmcuIGFwcGx5IHRoaXMgPwo+ID4+Pj4KPiA+Pj4+IC0gaWYgKGNydGMtPnN0YXRlLT5j
dG0pCj4gPj4+PiArIGlmIChjcnRjLT5zdGF0ZS0+Y29sb3JfbWdtdF9jaGFuZ2VkICYmIGNydGMt
PnN0YXRlLT5jdG0pCj4gPj4+Cj4gPj4+IFNvbWV0aGluZyBsaWtlIHRoYXQsIGJ1dCAubWdyX3Nl
dHVwKCkgc2hvdWxkIHRoZW4gYmUgdGF1Z2h0IG5vdCB0byB3cml0ZQo+ID4+PiB1bmNoYW5nZWQg
Q1RNIHRhYmxlcyB0byByZWdpc3RlcnMuIERvIHlvdSB0aGluayBpdCB3b3VsZCBiZSB3b3J0aCBp
dCA/Cj4gPj4KPiA+PiBIbW1tLCBqZXNzIEkgc2hvdWxkIGRvIGl0IGxpa2UgdGhpczoKPiA+PiBp
ZiAoY3J0Yy0+c3RhdGUtPmNvbG9yX21nbXRfY2hhbmdlZCkgewo+ID4+IAlpZiAoY3J0Yy0+c3Rh
dGUtPmN0bSkgewo+ID4+IC4uLgo+ID4+Pj4+PiArCX0gZWxzZSB7Cj4gPj4+Pj4+ICsJCWluZm8u
Y3ByX2VuYWJsZSA9IGZhbHNlOwo+ID4+Pj4+PiArCX0KPiA+PiB9Cj4gPj4KPiA+PiBUaGlzIHdh
eSB0aGUgd2hvbGUgQ1BSIGZ1bmN0aW9uYWxpdHkgaXMgdHVybmVkIG9mZiwgaWYgdGhlIHRoZXJl
IGlzIG5vCj4gPj4gQ1RNIGluIHRoZSBjcnRjIHN0YXRlLgo+ID4KPiA+IFllcywgYnV0IHlvdSB3
b3VsZCBhbHNvIG5lZWQgdG8gdXBkYXRlIC5tZ3Jfc2V0dXAoKSA6LSkgQSBuZXcKPiA+IGNvbG9y
X21nbXRfY2hhbmdlZCBmbGFnIHdvdWxkIGJlIG5lZWRlZCBpbiB0aGUgaW5mbyBzdHJ1Y3R1cmUg
dG9vLgo+IAo+IEkgYW0gc3RhcnRpbmcgdG8gdGhpbmcgdGhhdCBzdWNoIGFuICJvcHRpbWl6YXRp
b24iIG1heSBub3QgYmUgd29ydGggdGhlCj4gYWRkZWQgY29tcGxleGl0eS4gVGhlIGFyaXRobWV0
aWMgYW5kIHdyaXRpbmcgdGhyZWUgcmVnaXN0ZXJzIGlzIG5vdCB0aGF0Cj4gY29zdGx5IGFuZCB3
ZSBkbyBub3QgY29tbWl0IGEgbmV3IGNydGMgc3RhdGUgdGhhdCBvZnRlbi4KCldlIGNhbGwgb21h
cF9jcnRjX3dyaXRlX2NydGNfcHJvcGVydGllcygpIGluIG9tYXBfY3J0Y19hdG9taWNfZmx1c2go
KSwKc28gdGhhdCdzIGF0IGV2ZXJ5IHBhZ2UgZmxpcC4uLgoKPiBJZiB3ZSBsYXRlciBjb25zaWRl
ciBvdGhlcndpc2Ugd2UgY2FuIGFkZCB0aGUgb3B0aW1pemF0aW9uIGFzIGEgc2VwYXJhdGUKPiBw
YXRjaC4KCi0tIApSZWdhcmRzLAoKTGF1cmVudCBQaW5jaGFydApfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
