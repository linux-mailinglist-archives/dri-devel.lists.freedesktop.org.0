Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 632324AFDA
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2019 04:08:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09EAC6E27B;
	Wed, 19 Jun 2019 02:08:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5622A6E27A;
 Wed, 19 Jun 2019 02:08:00 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id k8so24616447eds.7;
 Tue, 18 Jun 2019 19:08:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:content-transfer-encoding:user-agent;
 bh=s9lpMBH/IugmiFXNYI6ZpyhR++3sMpJb2daAAUrg87c=;
 b=DQMibW+YiMo7/lataS4vUvT3P4DtZqaIDjUt8Odt+ZddSYvG2kcSqK5mJWPtBDu49H
 pqB8gTb/xhNg7HwSaw/dAA8saugTO/2yih5hhoLj2k+mCtK7HLBoCVM/WE1ze+M1yTzK
 sFY3D9OXscq0rEM2vtzE+WsymoZsasIkdzg6Lj8snjVZI3WewMGORaPaP674OsJw8obg
 snD5l/w/3cmRvJM053pOlUkofgV4NyqpZZnUQEobHD+97i0BTJHdvi4pIcMcZb1+MRTo
 4sSkuuPK5Q1mO+QNKe/3VrFSbWTPLyCUu1nEzbDOzSwJizBWvYTFz/UNZPeA0jZDrgG8
 3jAg==
X-Gm-Message-State: APjAAAViltHv5KIgqwzhvr70hTkT18w8bYkAmlc3YbDIA8ulQL7sJpGy
 KW0H/6uW1X8gVkDjdBl81O0=
X-Google-Smtp-Source: APXvYqyV3lljKw+wProWO8jUjFZkqDRUPrpL6ShZ5xRp5iz2PaEe1L1taSJ0vgFMnRqhprl/oGHqww==
X-Received: by 2002:a17:906:2301:: with SMTP id
 l1mr54424834eja.92.1560910077820; 
 Tue, 18 Jun 2019 19:07:57 -0700 (PDT)
Received: from smtp.gmail.com ([187.121.151.146])
 by smtp.gmail.com with ESMTPSA id k11sm1974837edq.54.2019.06.18.19.07.53
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 18 Jun 2019 19:07:57 -0700 (PDT)
Date: Tue, 18 Jun 2019 23:07:50 -0300
From: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH V4] drm/drm_vblank: Change EINVAL by the correct errno
Message-ID: <20190619020750.swzerehjbvx6sbk2@smtp.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :content-transfer-encoding:user-agent;
 bh=s9lpMBH/IugmiFXNYI6ZpyhR++3sMpJb2daAAUrg87c=;
 b=pWuu1Ni7Pj1W/hQq6vtS/AHazRgRHRM9Y7pAnxIHlPNPp6BXKMhcu6/Tn5/pJhbGQ5
 vPGGQLKsfjVFADDj+ujB57FNC1EWIjbJTvto5xsdO4cvQVbAfVinkdDrBbRPrbdw9F+I
 jklYuAY0LP1WIV2QiiCA36FGAMYk+MswrcAPW/Sfze4f491rr9WEqVlAqgB6+dQEJddA
 IuCq61M1lW1DJKw84V3pP9YP41wIR/AuOw4qzzZyWaRfjXQbl6ps/M5QAILuNMM5cVTE
 ehUjrIf8MRNDvanyPP30lFjG79ieh+IhvWp7g9VERKAKow8gzilKfGkm8C5LTnWFkUbm
 c7Dg==
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
Cc: intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rm9yIGhpc3RvcmljYWwgcmVhc29uLCB0aGUgZnVuY3Rpb24gZHJtX3dhaXRfdmJsYW5rX2lvY3Rs
IGFsd2F5cyByZXR1cm4KLUVJTlZBTCBpZiBzb21ldGhpbmcgZ2V0cyB3cm9uZy4gVGhpcyBzY2Vu
YXJpbyBsaW1pdHMgdGhlIGZsZXhpYmlsaXR5CmZvciB0aGUgdXNlcnNwYWNlIG1ha2UgZGV0YWls
ZWQgdmVyaWZpY2F0aW9uIG9mIHRoZSBwcm9ibGVtIGFuZCB0YWtlCnNvbWUgYWN0aW9uLiBJbiBw
YXJ0aWN1bGFyLCB0aGUgdmFsaWRhdGlvbiBvZiDigJxpZiAoIWRldi0+aXJxX2VuYWJsZWQp4oCd
CmluIHRoZSBkcm1fd2FpdF92YmxhbmtfaW9jdGwgaXMgcmVzcG9uc2libGUgZm9yIGNoZWNraW5n
IGlmIHRoZSBkcml2ZXIKc3VwcG9ydCB2Ymxhbmsgb3Igbm90LiBJZiB0aGUgZHJpdmVyIGRvZXMg
bm90IHN1cHBvcnQgVkJsYW5rLCB0aGUKZnVuY3Rpb24gZHJtX3dhaXRfdmJsYW5rX2lvY3RsIHJl
dHVybnMgRUlOVkFMIHdoaWNoIGRvZXMgbm90IHJlcHJlc2VudAp0aGUgcmVhbCBpc3N1ZTsgdGhp
cyBwYXRjaCBjaGFuZ2VzIHRoaXMgYmVoYXZpb3IgYnkgcmV0dXJuIEVPUE5PVFNVUFAuCkFkZGl0
aW9uYWxseSwgc29tZSBvcGVyYXRpb25zIGFyZSB1bnN1cHBvcnRlZCBieSB0aGlzIGZ1bmN0aW9u
LCBhbmQKcmV0dXJucyBFSU5WQUw7IHRoaXMgcGF0Y2ggYWxzbyBjaGFuZ2VzIHRoZSByZXR1cm4g
dmFsdWUgdG8gRU9QTk9UU1VQUAppbiB0aGlzIGNhc2UuIExhc3RseSwgdGhlIGZ1bmN0aW9uIGRy
bV93YWl0X3ZibGFua19pb2N0bCBpcyBpbnZva2VkIGJ5CmxpYmRybSwgd2hpY2ggaXMgdXNlZCBi
eSBtYW55IGNvbXBvc2l0b3JzOyBiZWNhdXNlIG9mIHRoaXMsIGl0IGlzCmltcG9ydGFudCB0byBj
aGVjayBpZiB0aGlzIGNoYW5nZSBicmVha3MgYW55IGNvbXBvc2l0b3IuIEluIHRoaXMgc2Vuc2Us
CnRoZSBmb2xsb3dpbmcgcHJvamVjdHMgd2VyZSBleGFtaW5lZDoKCiogRHJtLWh3Y29tcG9zZXIK
KiBLd2luCiogU3dheQoqIFdscm9vdHMKKiBXYXlsYW5kLWNvcmUKKiBXZXN0b24KKiBYb3JnICg2
NyBkaWZmZXJlbnQgZHJpdmVycykKCkZvciBlYWNoIHJlcG9zaXRvcnkgdGhlIHZlcmlmaWNhdGlv
biBoYXBwZW5lZCBpbiB0aHJlZSBzdGVwczoKCiogVXBkYXRlIHRoZSBtYWluIGJyYW5jaAoqIExv
b2sgZm9yIGFueSBvY2N1cnJlbmNlICJkcm1XYWl0VkJsYW5rIiB3aXRoIHRoZSBjb21tYW5kOgog
IGdpdCBncmVwIC1uICJkcm1XYWl0VkJsYW5rIgoqIExvb2sgaW4gdGhlIGdpdCBoaXN0b3J5IG9m
IHRoZSBwcm9qZWN0IHdpdGggdGhlIGNvbW1hbmQ6CiAgZ2l0IGxvZyAtU2RybVdhaXRWQmxhbmsK
CkZpbmFsbHksIG5vbmUgb2YgdGhlIGFib3ZlIHByb2plY3RzIHZhbGlkYXRlIHRoZSB1c2Ugb2Yg
RUlOVkFMIHdoaWNoCm1ha2Ugc2FmZSwgYXQgbGVhc3QgZm9yIHRoZXNlIHByb2plY3RzLCB0byBj
aGFuZ2UgdGhlIHJldHVybiB2YWx1ZXMuCgpDaGFuZ2Ugc2luY2UgVjM6CiAtIFJldHVybiBFSU5W
QUwgZm9yIF9EUk1fVkJMQU5LX1NJR05BTCAoRGFuaWVsKQoKQ2hhbmdlIHNpbmNlIFYyOgogRGFu
aWVsIFZldHRlciBhbmQgQ2hyaXMgV2lsc29uCiAtIFJlcGxhY2UgRU5PVFRZIGJ5IEVPUE5PVFNV
UFAKIC0gUmV0dXJuIEVJTlZBTCBpZiB0aGUgcGFyYW1ldGVycyBhcmUgd3JvbmcKClNpZ25lZC1v
ZmYtYnk6IFJvZHJpZ28gU2lxdWVpcmEgPHJvZHJpZ29zaXF1ZWlyYW1lbG9AZ21haWwuY29tPgot
LS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fdmJsYW5rLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vZHJtX3ZibGFuay5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV92YmxhbmsuYwppbmRleCA2MDNh
YjEwNTEyNWQuLmJlZDIzMzM2MTYxNCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV92
YmxhbmsuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3ZibGFuay5jCkBAIC0xNTgyLDcgKzE1
ODIsNyBAQCBpbnQgZHJtX3dhaXRfdmJsYW5rX2lvY3RsKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYs
IHZvaWQgKmRhdGEsCiAJdW5zaWduZWQgaW50IGZsYWdzLCBwaXBlLCBoaWdoX3BpcGU7CiAKIAlp
ZiAoIWRldi0+aXJxX2VuYWJsZWQpCi0JCXJldHVybiAtRUlOVkFMOworCQlyZXR1cm4gLUVPUE5P
VFNVUFA7CiAKIAlpZiAodmJsd2FpdC0+cmVxdWVzdC50eXBlICYgX0RSTV9WQkxBTktfU0lHTkFM
KQogCQlyZXR1cm4gLUVJTlZBTDsKLS0gCjIuMjEuMApfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
