Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 159C328BC4
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2019 22:46:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F8756E06F;
	Thu, 23 May 2019 20:46:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C8166E06F;
 Thu, 23 May 2019 20:46:44 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id 4D24A60E41; Thu, 23 May 2019 20:46:44 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
 version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: jcrouse@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id EF69E6030E;
 Thu, 23 May 2019 20:46:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org EF69E6030E
Date: Thu, 23 May 2019 14:46:41 -0600
From: Jordan Crouse <jcrouse@codeaurora.org>
To: Sean Paul <sean@poorly.run>
Subject: Re: [PATCH v2 1/6] drm/msm/a6xx: Avoid freeing gmu resources
 multiple times
Message-ID: <20190523204640.GB18360@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Sean Paul <sean@poorly.run>,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Sean Paul <seanpaul@chromium.org>, Rob Clark <robdclark@gmail.com>,
 linux-arm-msm@vger.kernel.org
References: <20190523171653.138678-1-sean@poorly.run>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190523171653.138678-1-sean@poorly.run>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1558644404;
 bh=Ir/HRhOrB0L3PO9O6yHN6CugZdjLH2Ob1K2L92FVfHs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=h3RKebO6g5Uo1nTjJ+nT7mURYYRzLOcnu4Gq7WW2uPmAms0caAp6qoyE3HVPaBMW1
 XyJWqwWJjJ+p8IGu9EngDXcsSYYeY/Sizo4VshjB+aH50GaJfvoWnOLiyLssNNlls9
 g+E+NKaH/QJ7i9xv8bt4akt+tWaey5t8Ot8dr52Y=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1558644403;
 bh=Ir/HRhOrB0L3PO9O6yHN6CugZdjLH2Ob1K2L92FVfHs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=K/6jQpMR+YFjj3a/oinAU4mvGY8z1dIPxmsKp6Tn6Rij0bFY9HQWt25dlgUfTha6y
 HoB9xcWHP8d1vi8+6UWwKWTQ1gIQn6VvvwhWcNIXpd9zDKpQ6g5xuEMRhjZ91KVq4u
 a4JdS61QZJx3oL/dpqgnn197t56Vzn6x50bEBipc=
X-Mailman-Original-Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 dmarc=none (p=none dis=none)
 header.from=codeaurora.org
X-Mailman-Original-Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 spf=none
 smtp.mailfrom=jcrouse@codeaurora.org
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
Cc: Sean Paul <seanpaul@chromium.org>, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBNYXkgMjMsIDIwMTkgYXQgMDE6MTY6NDBQTSAtMDQwMCwgU2VhbiBQYXVsIHdyb3Rl
Ogo+IEZyb206IFNlYW4gUGF1bCA8c2VhbnBhdWxAY2hyb21pdW0ub3JnPgo+IAo+IFRoZSBkcml2
ZXIgY2hlY2tzIGZvciBnbXUtPm1taW8gYXMgYSBzaWduIHRoYXQgdGhlIGRldmljZSBoYXMgYmVl
bgo+IGluaXRpYWxpemVkLCBob3dldmVyIHRoZXJlIGFyZSBmYWlsdXJlcyBpbiBwcm9iZSBiZWxv
dyB0aGUgbW1pbyBpbml0Lgo+IElmIG9uZSBvZiB0aG9zZSBpcyBoaXQsIG1taW8gd2lsbCBiZSBu
b24tbnVsbCBidXQgZnJlZWQuCj4gCj4gSW4gdGhhdCBjYXNlLCBhNnh4X2dtdV9wcm9iZSB3aWxs
IHJldHVybiBhbiBlcnJvciB0byBhNnh4X2dwdV9pbml0IHdoaWNoCj4gd2lsbCBpbiB0dXJuIGNh
bGwgYTZ4eF9nbXVfcmVtb3ZlIHdoaWNoIGNoZWNrcyBnbXUtPm1taW8gYW5kIHRyaWVzIHRvIGZy
ZWUKPiByZXNvdXJjZXMgZm9yIGEgc2Vjb25kIHRpbWUuIFRoaXMgY2F1c2VzIGEgZ3JlYXQgYm9v
bS4KPiAKPiBGaXggdGhpcyBieSBhZGRpbmcgYW4gaW5pdGlhbGl6ZWQgbWVtYmVyIHRvIGdtdSB3
aGljaCBpcyBzZXQgb24KPiBzdWNjZXNzZnVsIHByb2JlIGFuZCBjbGVhcmVkIG9uIHJlbW92YWwu
Cj4gCj4gQ2hhbmdlcyBpbiB2MjoKPiAtIE5vbmUKPiAKPiBDYzogSm9yZGFuIENyb3VzZSA8amNy
b3VzZUBjb2RlYXVyb3JhLm9yZz4KPiBTaWduZWQtb2ZmLWJ5OiBTZWFuIFBhdWwgPHNlYW5wYXVs
QGNocm9taXVtLm9yZz4KClJldmlld2VkLWJ5OiBKb3JkYW4gQ3JvdXNlIDxqY3JvdXNlQGNvZGVh
dXJvcmEub3JnPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hNnh4X2dtdS5j
IHwgMTQgKysrKysrKysrLS0tLS0KPiAgZHJpdmVycy9ncHUvZHJtL21zbS9hZHJlbm8vYTZ4eF9n
bXUuaCB8ICAxICsKPiAgMiBmaWxlcyBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCA1IGRlbGV0
aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hNnh4
X2dtdS5jIGIvZHJpdmVycy9ncHUvZHJtL21zbS9hZHJlbm8vYTZ4eF9nbXUuYwo+IGluZGV4IDM4
ZTJjZmE5Y2VjNy4uYWE4NGVkYjI1ZDkxIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9t
c20vYWRyZW5vL2E2eHhfZ211LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9h
Nnh4X2dtdS5jCj4gQEAgLTc0LDcgKzc0LDcgQEAgYm9vbCBhNnh4X2dtdV9zcHRwcmFjX2lzX29u
KHN0cnVjdCBhNnh4X2dtdSAqZ211KQo+ICAJdTMyIHZhbDsKPiAgCj4gIAkvKiBUaGlzIGNhbiBi
ZSBjYWxsZWQgZnJvbSBncHUgc3RhdGUgY29kZSBzbyBtYWtlIHN1cmUgR01VIGlzIHZhbGlkICov
Cj4gLQlpZiAoSVNfRVJSX09SX05VTEwoZ211LT5tbWlvKSkKPiArCWlmICghZ211LT5pbml0aWFs
aXplZCkKPiAgCQlyZXR1cm4gZmFsc2U7Cj4gIAo+ICAJdmFsID0gZ211X3JlYWQoZ211LCBSRUdf
QTZYWF9HTVVfU1BUUFJBQ19QV1JfQ0xLX1NUQVRVUyk7Cj4gQEAgLTkwLDcgKzkwLDcgQEAgYm9v
bCBhNnh4X2dtdV9neF9pc19vbihzdHJ1Y3QgYTZ4eF9nbXUgKmdtdSkKPiAgCXUzMiB2YWw7Cj4g
IAo+ICAJLyogVGhpcyBjYW4gYmUgY2FsbGVkIGZyb20gZ3B1IHN0YXRlIGNvZGUgc28gbWFrZSBz
dXJlIEdNVSBpcyB2YWxpZCAqLwo+IC0JaWYgKElTX0VSUl9PUl9OVUxMKGdtdS0+bW1pbykpCj4g
KwlpZiAoIWdtdS0+aW5pdGlhbGl6ZWQpCj4gIAkJcmV0dXJuIGZhbHNlOwo+ICAKPiAgCXZhbCA9
IGdtdV9yZWFkKGdtdSwgUkVHX0E2WFhfR01VX1NQVFBSQUNfUFdSX0NMS19TVEFUVVMpOwo+IEBA
IC02OTUsNyArNjk1LDcgQEAgaW50IGE2eHhfZ211X3Jlc3VtZShzdHJ1Y3QgYTZ4eF9ncHUgKmE2
eHhfZ3B1KQo+ICAJc3RydWN0IGE2eHhfZ211ICpnbXUgPSAmYTZ4eF9ncHUtPmdtdTsKPiAgCWlu
dCBzdGF0dXMsIHJldDsKPiAgCj4gLQlpZiAoV0FSTighZ211LT5tbWlvLCAiVGhlIEdNVSBpcyBu
b3Qgc2V0IHVwIHlldFxuIikpCj4gKwlpZiAoV0FSTighZ211LT5pbml0aWFsaXplZCwgIlRoZSBH
TVUgaXMgbm90IHNldCB1cCB5ZXRcbiIpKQo+ICAJCXJldHVybiAwOwo+ICAKPiAgCWdtdS0+aHVu
ZyA9IGZhbHNlOwo+IEBAIC03NjUsNyArNzY1LDcgQEAgYm9vbCBhNnh4X2dtdV9pc2lkbGUoc3Ry
dWN0IGE2eHhfZ211ICpnbXUpCj4gIHsKPiAgCXUzMiByZWc7Cj4gIAo+IC0JaWYgKCFnbXUtPm1t
aW8pCj4gKwlpZiAoIWdtdS0+aW5pdGlhbGl6ZWQpCj4gIAkJcmV0dXJuIHRydWU7Cj4gIAo+ICAJ
cmVnID0gZ211X3JlYWQoZ211LCBSRUdfQTZYWF9HUFVfR01VX0FPX0dQVV9DWF9CVVNZX1NUQVRV
Uyk7Cj4gQEAgLTEyMjcsNyArMTIyNyw3IEBAIHZvaWQgYTZ4eF9nbXVfcmVtb3ZlKHN0cnVjdCBh
Nnh4X2dwdSAqYTZ4eF9ncHUpCj4gIHsKPiAgCXN0cnVjdCBhNnh4X2dtdSAqZ211ID0gJmE2eHhf
Z3B1LT5nbXU7Cj4gIAo+IC0JaWYgKElTX0VSUl9PUl9OVUxMKGdtdS0+bW1pbykpCj4gKwlpZiAo
IWdtdS0+aW5pdGlhbGl6ZWQpCj4gIAkJcmV0dXJuOwo+ICAKPiAgCWE2eHhfZ211X3N0b3AoYTZ4
eF9ncHUpOwo+IEBAIC0xMjQ1LDYgKzEyNDUsOCBAQCB2b2lkIGE2eHhfZ211X3JlbW92ZShzdHJ1
Y3QgYTZ4eF9ncHUgKmE2eHhfZ3B1KQo+ICAJaW9tbXVfZGV0YWNoX2RldmljZShnbXUtPmRvbWFp
biwgZ211LT5kZXYpOwo+ICAKPiAgCWlvbW11X2RvbWFpbl9mcmVlKGdtdS0+ZG9tYWluKTsKPiAr
Cj4gKwlnbXUtPmluaXRpYWxpemVkID0gZmFsc2U7Cj4gIH0KPiAgCj4gIGludCBhNnh4X2dtdV9w
cm9iZShzdHJ1Y3QgYTZ4eF9ncHUgKmE2eHhfZ3B1LCBzdHJ1Y3QgZGV2aWNlX25vZGUgKm5vZGUp
Cj4gQEAgLTEzMDksNiArMTMxMSw4IEBAIGludCBhNnh4X2dtdV9wcm9iZShzdHJ1Y3QgYTZ4eF9n
cHUgKmE2eHhfZ3B1LCBzdHJ1Y3QgZGV2aWNlX25vZGUgKm5vZGUpCj4gIAkvKiBTZXQgdXAgdGhl
IEhGSSBxdWV1ZXMgKi8KPiAgCWE2eHhfaGZpX2luaXQoZ211KTsKPiAgCj4gKwlnbXUtPmluaXRp
YWxpemVkID0gdHJ1ZTsKPiArCj4gIAlyZXR1cm4gMDsKPiAgZXJyOgo+ICAJYTZ4eF9nbXVfbWVt
b3J5X2ZyZWUoZ211LCBnbXUtPmhmaSk7Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9t
c20vYWRyZW5vL2E2eHhfZ211LmggYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hNnh4X2dt
dS5oCj4gaW5kZXggYmVkZDhlNmE2M2FhLi4zOWEyNmRkNjM2NzQgMTAwNjQ0Cj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL21zbS9hZHJlbm8vYTZ4eF9nbXUuaAo+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9tc20vYWRyZW5vL2E2eHhfZ211LmgKPiBAQCAtNzUsNiArNzUsNyBAQCBzdHJ1Y3QgYTZ4eF9n
bXUgewo+ICAKPiAgCXN0cnVjdCBhNnh4X2hmaV9xdWV1ZSBxdWV1ZXNbMl07Cj4gIAo+ICsJYm9v
bCBpbml0aWFsaXplZDsKPiAgCWJvb2wgaHVuZzsKPiAgfTsKPiAgCj4gLS0gCj4gU2VhbiBQYXVs
LCBTb2Z0d2FyZSBFbmdpbmVlciwgR29vZ2xlIC8gQ2hyb21pdW0gT1MKPiAKCi0tIApUaGUgUXVh
bGNvbW0gSW5ub3ZhdGlvbiBDZW50ZXIsIEluYy4gaXMgYSBtZW1iZXIgb2YgQ29kZSBBdXJvcmEg
Rm9ydW0sCmEgTGludXggRm91bmRhdGlvbiBDb2xsYWJvcmF0aXZlIFByb2plY3QKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
