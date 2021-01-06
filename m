Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97EDA2EC405
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jan 2021 20:36:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54ACE89DF9;
	Wed,  6 Jan 2021 19:36:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.micronovasrl.com (mail.micronovasrl.com [212.103.203.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83B4189DD8
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Jan 2021 19:36:20 +0000 (UTC)
Received: from mail.micronovasrl.com (mail.micronovasrl.com [127.0.0.1])
 by mail.micronovasrl.com (Postfix) with ESMTP id 587F5B045F2
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Jan 2021 20:28:05 +0100 (CET)
Authentication-Results: mail.micronovasrl.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)" header.d=micronovasrl.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=micronovasrl.com;
 h=content-transfer-encoding:content-type:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :date:subject:subject:to:from:from; s=dkim; t=1609961284; x=
 1610825285; bh=ve6PpitMBRMOaeoWwDbFW/+W2p3l0jAVa8GJuKa7cPU=; b=Z
 rp4OyzhkjkCe5i7Cf2qd19lvV2zr6Z3UrtnrHaYNiI9MGYtgweIWYGf+vBUmLJ2F
 7oD5XlNNpJRo3jBw4QUzE4y6th6q8DuuqhMLh6V2hf7l9Xj3CscV4JOSoFLio44L
 6aeu6z3EV/TfA+Tyiup3gsXrP+BSphlGtQJVmKlZto=
X-Virus-Scanned: Debian amavisd-new at mail.micronovasrl.com
X-Spam-Flag: NO
X-Spam-Score: -2.9
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 tagged_above=-10 required=4.5
 tests=[ALL_TRUSTED=-1, BAYES_00=-1.9]
 autolearn=unavailable autolearn_force=no
Received: from mail.micronovasrl.com ([127.0.0.1])
 by mail.micronovasrl.com (mail.micronovasrl.com [127.0.0.1]) (amavisd-new,
 port 10026)
 with ESMTP id 6QBAdkWIJssU for <dri-devel@lists.freedesktop.org>;
 Wed,  6 Jan 2021 20:28:04 +0100 (CET)
Received: from ubuntu.localdomain (146-241-198-163.dyn.eolo.it
 [146.241.198.163])
 by mail.micronovasrl.com (Postfix) with ESMTPSA id D3D2DB04586;
 Wed,  6 Jan 2021 20:28:02 +0100 (CET)
From: Giulio Benetti <giulio.benetti@micronovasrl.com>
To: Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 2/2] drm/sun4i: tcon: improve DCLK polarity handling
Date: Wed,  6 Jan 2021 20:28:00 +0100
Message-Id: <20210106192800.164052-3-giulio.benetti@micronovasrl.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210106192800.164052-1-giulio.benetti@micronovasrl.com>
References: <20210106192800.164052-1-giulio.benetti@micronovasrl.com>
MIME-Version: 1.0
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, airlied@linux.ie,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, wens@csie.org,
 linux-arm-kernel@lists.infradead.org, treding@nvidia.com,
 Giulio Benetti <giulio.benetti@micronovasrl.com>,
 Marjan Pascolo <marjan.pascolo@trexom.it>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SXQgdHVybmVkIG91dChNYXhpbWUgc3VnZ2VzdGlvbikgdGhhdCBiaXQgMjYgb2YgU1VONElfVENP
TjBfSU9fUE9MX1JFRyBpcwpkZWRpY2F0ZWQgdG8gaW52ZXJ0IERDTEsgcG9sYXJpdHkgYW5kIHRo
aXMgbWFrZXMgdGhpbmcgcmVhbGx5IGVhc2llciB0aGFuCmJlZm9yZS4gU28gbGV0J3MgaGFuZGxl
IERDTEsgcG9sYXJpdHkgYnkgYWRkaW5nClNVTjRJX1RDT04wX0lPX1BPTF9EQ0xLX1BPU0lUSVZF
IGFzIGJpdCAyNiBhbmQgYWN0aXZhdGluZyBhY2NvcmRpbmcgdG8KYnVzX2ZsYWdzIHRoZSBzYW1l
IHdheSBpcyBkb25lIGZvciBhbGwgdGhlIG90aGVyIHNpZ25hbHMuCgpDYzogTWF4aW1lIFJpcGFy
ZCA8bWF4aW1lQGNlcm5vLnRlY2g+ClNpZ25lZC1vZmYtYnk6IEdpdWxpbyBCZW5ldHRpIDxnaXVs
aW8uYmVuZXR0aUBtaWNyb25vdmFzcmwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9zdW40aS9z
dW40aV90Y29uLmMgfCAyMCArLS0tLS0tLS0tLS0tLS0tLS0tLQogZHJpdmVycy9ncHUvZHJtL3N1
bjRpL3N1bjRpX3Rjb24uaCB8ICAxICsKIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCsp
LCAxOSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3Vu
NGlfdGNvbi5jIGIvZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1bjRpX3Rjb24uYwppbmRleCA1MjU5
OGJiMGZiMGIuLjMwMTcxY2NkODdlNSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3N1bjRp
L3N1bjRpX3Rjb24uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3VuNGlfdGNvbi5jCkBA
IC01NjksMjYgKzU2OSw4IEBAIHN0YXRpYyB2b2lkIHN1bjRpX3Rjb24wX21vZGVfc2V0X3JnYihz
dHJ1Y3Qgc3VuNGlfdGNvbiAqdGNvbiwKIAlpZiAoaW5mby0+YnVzX2ZsYWdzICYgRFJNX0JVU19G
TEFHX0RFX0xPVykKIAkJdmFsIHw9IFNVTjRJX1RDT04wX0lPX1BPTF9ERV9ORUdBVElWRTsKIAot
CS8qCi0JICogT24gQTIwIGFuZCBzaW1pbGFyIFNvQ3MsIHRoZSBvbmx5IHdheSB0byBhY2hpZXZl
IFBvc2l0aXZlIEVkZ2UKLQkgKiAoUmlzaW5nIEVkZ2UpLCBpcyBzZXR0aW5nIGRjbGsgY2xvY2sg
cGhhc2UgdG8gMi8zKDI0MMKwKS4KLQkgKiBCeSBkZWZhdWx0IFRDT04gd29ya3MgaW4gTmVnYXRp
dmUgRWRnZShGYWxsaW5nIEVkZ2UpLAotCSAqIHRoaXMgaXMgd2h5IHBoYXNlIGlzIHNldCB0byAw
IGluIHRoYXQgY2FzZS4KLQkgKiBVbmZvcnR1bmF0ZWx5IHRoZXJlJ3Mgbm8gd2F5IHRvIGxvZ2lj
YWxseSBpbnZlcnQgZGNsayB0aHJvdWdoCi0JICogSU9fUE9MIHJlZ2lzdGVyLgotCSAqIFRoZSBv
bmx5IGFjY2VwdGFibGUgd2F5IHRvIHdvcmssIHRyaXBsZSBjaGVja2VkIHdpdGggc2NvcGUsCi0J
ICogaXMgdXNpbmcgY2xvY2sgcGhhc2Ugc2V0IHRvIDDCsCBmb3IgTmVnYXRpdmUgRWRnZSBhbmQg
c2V0IHRvIDI0MMKwCi0JICogZm9yIFBvc2l0aXZlIEVkZ2UuCi0JICogT24gQTMzIGFuZCBzaW1p
bGFyIFNvQ3MgdGhlcmUgd291bGQgYmUgYSA5MMKwIHBoYXNlIG9wdGlvbiwKLQkgKiBidXQgaXQg
ZGl2aWRlcyBhbHNvIGRjbGsgYnkgMi4KLQkgKiBGb2xsb3dpbmcgY29kZSBpcyBhIHdheSB0byBh
dm9pZCBxdWlya3MgYWxsIGFyb3VuZCBUQ09OCi0JICogYW5kIERPVENMT0NLIGRyaXZlcnMuCi0J
ICovCiAJaWYgKGluZm8tPmJ1c19mbGFncyAmIERSTV9CVVNfRkxBR19QSVhEQVRBX0RSSVZFX1BP
U0VER0UpCi0JCWNsa19zZXRfcGhhc2UodGNvbi0+ZGNsaywgMCk7Ci0KLQlpZiAoaW5mby0+YnVz
X2ZsYWdzICYgRFJNX0JVU19GTEFHX1BJWERBVEFfRFJJVkVfTkVHRURHRSkKLQkJY2xrX3NldF9w
aGFzZSh0Y29uLT5kY2xrLCAyNDApOworCQl2YWwgfD0gU1VONElfVENPTjBfSU9fUE9MX0RDTEtf
UE9TSVRJVkU7CiAKIAlyZWdtYXBfdXBkYXRlX2JpdHModGNvbi0+cmVncywgU1VONElfVENPTjBf
SU9fUE9MX1JFRywKIAkJCSAgIFNVTjRJX1RDT04wX0lPX1BPTF9IU1lOQ19QT1NJVElWRSB8CmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3VuNGlfdGNvbi5oIGIvZHJpdmVycy9n
cHUvZHJtL3N1bjRpL3N1bjRpX3Rjb24uaAppbmRleCBjZmJmNGU2YzE2NzkuLjBjZTcxZDEwYTMx
YiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1bjRpX3Rjb24uaAorKysgYi9k
cml2ZXJzL2dwdS9kcm0vc3VuNGkvc3VuNGlfdGNvbi5oCkBAIC0xMTMsNiArMTEzLDcgQEAKICNk
ZWZpbmUgU1VONElfVENPTjBfSU9fUE9MX1JFRwkJCTB4ODgKICNkZWZpbmUgU1VONElfVENPTjBf
SU9fUE9MX0RDTEtfUEhBU0UocGhhc2UpCQkoKHBoYXNlICYgMykgPDwgMjgpCiAjZGVmaW5lIFNV
TjRJX1RDT04wX0lPX1BPTF9ERV9ORUdBVElWRQkJCUJJVCgyNykKKyNkZWZpbmUgU1VONElfVENP
TjBfSU9fUE9MX0RDTEtfUE9TSVRJVkUJCUJJVCgyNikKICNkZWZpbmUgU1VONElfVENPTjBfSU9f
UE9MX0hTWU5DX1BPU0lUSVZFCQlCSVQoMjUpCiAjZGVmaW5lIFNVTjRJX1RDT04wX0lPX1BPTF9W
U1lOQ19QT1NJVElWRQkJQklUKDI0KQogCi0tIAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
