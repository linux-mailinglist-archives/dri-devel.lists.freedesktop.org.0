Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 342DAB16B6
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2019 01:39:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03D6C6EE5B;
	Thu, 12 Sep 2019 23:39:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22D5F6EE5B
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2019 23:39:36 +0000 (UTC)
Received: from pendragon.ideasonboard.com (bl10-204-24.dsl.telepac.pt
 [85.243.204.24])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 80B6333A;
 Fri, 13 Sep 2019 01:39:33 +0200 (CEST)
Date: Fri, 13 Sep 2019 02:39:26 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo@jmondi.org>
Subject: Re: [PATCH 20/20] drm: rcar-du: kms: Update CMM in atomic commit tail
Message-ID: <20190912233926.GE6006@pendragon.ideasonboard.com>
References: <20190606142220.1392-1-jacopo+renesas@jmondi.org>
 <20190606142220.1392-21-jacopo+renesas@jmondi.org>
 <20190607120633.GI7593@pendragon.ideasonboard.com>
 <20190614081913.n5yxpotto5fzl7sh@uno.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190614081913.n5yxpotto5fzl7sh@uno.localdomain>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1568331573;
 bh=rSB3fRu2IlFPBSvlPy+jtq6mdxKXzyTDfvAcmWR2amA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NlwWdHC6oAJq+tTeowWPPu0lEG2J+OP6al+AgFQGa4UHzKvrXG9rc4FkwgFbJLCq4
 JA2B1Jol/lB1mWkso2d3OwTMWJIrSyZlAqsbimb+Ojb0q3Nr9F0eV2M63aRtnlWpxv
 mMUG3mdmUW/8iCcz0PXUKf7ft2rxEnbmGWuiacwM=
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
Cc: muroya@ksk.co.jp, VenkataRajesh.Kalakodima@in.bosch.com, airlied@linux.ie,
 koji.matsuoka.xm@renesas.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 kieran.bingham+renesas@ideasonboard.com,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Harsha.ManjulaMallikarjun@in.bosch.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSmFjb3BvLAoKT24gRnJpLCBKdW4gMTQsIDIwMTkgYXQgMTA6MTk6MTNBTSArMDIwMCwgSmFj
b3BvIE1vbmRpIHdyb3RlOgo+IE9uIEZyaSwgSnVuIDA3LCAyMDE5IGF0IDAzOjA2OjMzUE0gKzAz
MDAsIExhdXJlbnQgUGluY2hhcnQgd3JvdGU6Cj4gPiBPbiBUaHUsIEp1biAwNiwgMjAxOSBhdCAw
NDoyMjoyMFBNICswMjAwLCBKYWNvcG8gTW9uZGkgd3JvdGU6Cj4gPj4gVXBkYXRlIENNTSBzZXR0
aW5ncyBhdCBpbiB0aGUgYXRvbWljIGNvbW1pdCB0YWlsIGhlbHBlciBtZXRob2QuCj4gPj4KPiA+
PiBUaGUgQ01NIGlzIHVwZGF0ZWQgd2l0aCBuZXcgZ2FtbWEgdmFsdWVzIHByb3ZpZGVkIHRvIHRo
ZSBkcml2ZXIKPiA+PiBpbiB0aGUgR0FNTUFfTFVUIGJsb2IgcHJvcGVydHkuCj4gPj4KPiA+PiBT
aWduZWQtb2ZmLWJ5OiBKYWNvcG8gTW9uZGkgPGphY29wbytyZW5lc2FzQGptb25kaS5vcmc+Cj4g
Pj4gLS0tCj4gPj4gIGRyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfZHVfa21zLmMgfCAzNiAr
KysrKysrKysrKysrKysrKysrKysrKysrKysKPiA+PiAgMSBmaWxlIGNoYW5nZWQsIDM2IGluc2Vy
dGlvbnMoKykKPiA+Pgo+ID4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcmNhci1kdS9y
Y2FyX2R1X2ttcy5jIGIvZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9kdV9rbXMuYwo+ID4+
IGluZGV4IDVhOTEwYTA0ZTFkOS4uMjlhMjAyMGE0NmI1IDEwMDY0NAo+ID4+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfZHVfa21zLmMKPiA+PiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vcmNhci1kdS9yY2FyX2R1X2ttcy5jCj4gPj4gQEAgLTIxLDYgKzIxLDcgQEAKPiA+PiAgI2lu
Y2x1ZGUgPGxpbnV4L29mX3BsYXRmb3JtLmg+Cj4gPj4gICNpbmNsdWRlIDxsaW51eC93YWl0Lmg+
Cj4gPj4KPiA+PiArI2luY2x1ZGUgInJjYXJfY21tLmgiCj4gPj4gICNpbmNsdWRlICJyY2FyX2R1
X2NydGMuaCIKPiA+PiAgI2luY2x1ZGUgInJjYXJfZHVfZHJ2LmgiCj4gPj4gICNpbmNsdWRlICJy
Y2FyX2R1X2VuY29kZXIuaCIKPiA+PiBAQCAtMzY3LDYgKzM2OCwzOCBAQCByY2FyX2R1X2ZiX2Ny
ZWF0ZShzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCBzdHJ1Y3QgZHJtX2ZpbGUgKmZpbGVfcHJpdiwK
PiA+PiAgICogQXRvbWljIENoZWNrIGFuZCBVcGRhdGUKPiA+PiAgICovCj4gPj4KPiA+PiArc3Rh
dGljIHZvaWQgcmNhcl9kdV9hdG9taWNfY29tbWl0X3VwZGF0ZV9jbW0oc3RydWN0IGRybV9jcnRj
ICpjcnRjLAo+ID4+ICsJCQkJCSAgICAgc3RydWN0IGRybV9jcnRjX3N0YXRlICpvbGRfc3RhdGUp
Cj4gPj4gK3sKPiA+PiArCXN0cnVjdCByY2FyX2R1X2NydGMgKnJjcnRjID0gdG9fcmNhcl9jcnRj
KGNydGMpOwo+ID4+ICsJc3RydWN0IHJjYXJfY21tX2NvbmZpZyBjbW1fY29uZmlnID0ge307Cj4g
Pj4gKwo+ID4+ICsJaWYgKCFyY3J0Yy0+Y21tIHx8ICFjcnRjLT5zdGF0ZS0+Y29sb3JfbWdtdF9j
aGFuZ2VkKQo+ID4+ICsJCXJldHVybjsKPiA+PiArCj4gPj4gKwlpZiAoIWNydGMtPnN0YXRlLT5n
YW1tYV9sdXQpIHsKPiA+PiArCQljbW1fY29uZmlnLmx1dC5lbmFibGUgPSBmYWxzZTsKPiA+PiAr
CQlyY2FyX2NtbV9zZXR1cChyY3J0Yy0+Y21tLCAmY21tX2NvbmZpZyk7Cj4gPj4gKwo+ID4+ICsJ
CXJldHVybjsKPiA+PiArCX0KPiA+PiArCj4gPj4gKwljbW1fY29uZmlnLmx1dC5lbmFibGUgPSB0
cnVlOwo+ID4+ICsJY21tX2NvbmZpZy5sdXQudGFibGUgPSAoc3RydWN0IGRybV9jb2xvcl9sdXQg
KikKPiA+PiArCQkJICAgICAgIGNydGMtPnN0YXRlLT5nYW1tYV9sdXQtPmRhdGE7Cj4gPj4gKwo+
ID4+ICsJLyogU2V0IExVVCB0YWJsZSBzaXplIHRvIDAgaWYgZW50cmllcyBzaG91bGQgbm90IGJl
IHVwZGF0ZWQuICovCj4gPj4gKwlpZiAoIW9sZF9zdGF0ZS0+Z2FtbWFfbHV0IHx8Cj4gPj4gKwkg
ICAgKG9sZF9zdGF0ZS0+Z2FtbWFfbHV0LT5iYXNlLmlkICE9Cj4gPj4gKwkgICAgY3J0Yy0+c3Rh
dGUtPmdhbW1hX2x1dC0+YmFzZS5pZCkpCj4gPj4gKwkJY21tX2NvbmZpZy5sdXQuc2l6ZSA9IGNy
dGMtPnN0YXRlLT5nYW1tYV9sdXQtPmxlbmd0aAo+ID4+ICsJCQkJICAgIC8gc2l6ZW9mKGNtbV9j
b25maWcubHV0LnRhYmxlWzBdKTsKPiA+Cj4gPiBEbyB5b3UgbmVlZCB0byBjYWxsIHJjYXJfY21t
X3NldHVwKCkgYXQgYWxsIGluIHRoaXMgY2FzZSA/Cj4gCj4gRG8geW91IG1lYW4gaW4gY2FzZSB0
aGUgbHV0LnNpemUgZmllbGQgaXMgc2V0IHRvIDAgPwo+IEkgY29uc2lkZXJlZCBpdCB1c2VmdWwg
d2hlbiB0aGUgQ01NIGhhcyB0byBiZSByZS1lbmFibGVkIHdpdGhvdXQKPiB1cGRhdGVpbmcgdGhl
IExVVCB0YWJsZSBlbnRyaWVzPyBJdCBpcyBub3QgcmVxdWlyZWQgaW4geW91ciBvcGluaW9uPwoK
WW91J3JlIHJpZ2h0LCBJIHRob3VnaHQgdXNlcnNwYWNlIGNvdWxkbid0IGRvIHRoaXMsIGJ1dCBp
dCBhY3R1YWxseSBjYW4uCgo+ID4+ICsJZWxzZQo+ID4+ICsJCWNtbV9jb25maWcubHV0LnNpemUg
PSAwOwo+ID4+ICsKPiA+PiArCXJjYXJfY21tX3NldHVwKHJjcnRjLT5jbW0sICZjbW1fY29uZmln
KTsKPiA+PiArfQo+ID4+ICsKPiA+PiAgc3RhdGljIGludCByY2FyX2R1X2F0b21pY19jaGVjayhz
dHJ1Y3QgZHJtX2RldmljZSAqZGV2LAo+ID4+ICAJCQkJc3RydWN0IGRybV9hdG9taWNfc3RhdGUg
KnN0YXRlKQo+ID4+ICB7Cj4gPj4gQEAgLTQwOSw2ICs0NDIsOSBAQCBzdGF0aWMgdm9pZCByY2Fy
X2R1X2F0b21pY19jb21taXRfdGFpbChzdHJ1Y3QgZHJtX2F0b21pY19zdGF0ZSAqb2xkX3N0YXRl
KQo+ID4+ICAJCQlyY2R1LT5kcGFkMV9zb3VyY2UgPSByY3J0Yy0+aW5kZXg7Cj4gPj4gIAl9Cj4g
Pj4KPiA+PiArCWZvcl9lYWNoX29sZF9jcnRjX2luX3N0YXRlKG9sZF9zdGF0ZSwgY3J0YywgY3J0
Y19zdGF0ZSwgaSkKPiA+PiArCQlyY2FyX2R1X2F0b21pY19jb21taXRfdXBkYXRlX2NtbShjcnRj
LCBjcnRjX3N0YXRlKTsKPiA+PiArCj4gPj4gIAkvKiBBcHBseSB0aGUgYXRvbWljIHVwZGF0ZS4g
Ki8KPiA+PiAgCWRybV9hdG9taWNfaGVscGVyX2NvbW1pdF9tb2Rlc2V0X2Rpc2FibGVzKGRldiwg
b2xkX3N0YXRlKTsKPiA+PiAgCWRybV9hdG9taWNfaGVscGVyX2NvbW1pdF9wbGFuZXMoZGV2LCBv
bGRfc3RhdGUsCgotLSAKUmVnYXJkcywKCkxhdXJlbnQgUGluY2hhcnQKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
