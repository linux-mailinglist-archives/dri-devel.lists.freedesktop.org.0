Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC8BA4FCA
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2019 09:24:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C62189269;
	Mon,  2 Sep 2019 07:24:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C0E8892EE
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2019 03:54:49 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id 26so5853501pfp.9
 for <dri-devel@lists.freedesktop.org>; Sun, 01 Sep 2019 20:54:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OH1ekUs0bAkwdIcXuhIeBy1Fe7rzwyed9i4anOS+QSk=;
 b=N/ce9WmXhHs7nIEGSLmMeVGTGQGCYQQrOwg1K3mtWekXankeJSrRab155D8Qs0EfCu
 X8irT0CSdlF1s0AX3NeTVBfL3dDkWi9VF69DijKq6osJ6QS/wM9SdATJpYJyh/K8Oz2r
 HJHgzWxtQPnJXO5kgnYPsUX/1x0OQEgZ28rnzU3/Ed4XptzV4MlmBHob+eYUHmqTo2cO
 q+PEy/nRKnid+x7FNX9tMgkL2xD6sNRxOzRHf7MGM8+mkKkBfZALnuIAinimXUQ34TMt
 80irCZbDtm1q3OiHekrt4loLr8qufB06sLDM13g4N3g++YHQbweawjHyv6MLfqg3QrVC
 dCDw==
X-Gm-Message-State: APjAAAWbICUx3upcMc7IaMfKdtp39aAChjvUR4yM/tecTll/mRWhqh8R
 lxleCRsRE5IfhiEG2vEPzaY5EQ==
X-Google-Smtp-Source: APXvYqyLLTVcLzaki/zpgHyUnP83/ENMttMFuYtnXoMrj+6ZqRMI+e1TuQ0iyviYJx0zTEuLTNFtzg==
X-Received: by 2002:a63:f401:: with SMTP id g1mr24388291pgi.314.1567396489069; 
 Sun, 01 Sep 2019 20:54:49 -0700 (PDT)
Received: from localhost ([2401:fa00:1:10:79b4:bd83:e4a5:a720])
 by smtp.gmail.com with ESMTPSA id y16sm14382217pfn.173.2019.09.01.20.54.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 01 Sep 2019 20:54:48 -0700 (PDT)
From: Cheng-Yi Chiang <cychiang@chromium.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm: dw-hdmi-i2s: enable audio clock in audio_startup
Date: Mon,  2 Sep 2019 11:54:35 +0800
Message-Id: <20190902035435.44463-1-cychiang@chromium.org>
X-Mailer: git-send-email 2.23.0.187.g17f5b7556c-goog
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 02 Sep 2019 07:24:25 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OH1ekUs0bAkwdIcXuhIeBy1Fe7rzwyed9i4anOS+QSk=;
 b=D9yjCxOsKpxC2MY18oXKvPMh45HPOOO/2e6rqJimjQ57JSKfThLSfjFt2TWGoleJYA
 E0AElnWelyQ7JaAGl2mZzXl5pOrn4anpOQ00XxONWEggwisR/j5HvuSMs+qD8B5HkkrJ
 pDcjEHJYYMW/VQhxlYQREAnlnIwtdaxV6E5qw=
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
Cc: alsa-devel@alsa-project.org, tzungbi@chromium.org, zhengxing@rock-chips.com,
 kuninori.morimoto.gx@renesas.com, airlied@linux.ie, jeffy.chen@rock-chips.com,
 dianders@chromium.org, dri-devel@lists.freedesktop.org,
 cain.cai@rock-chips.com, linux-rockchip@lists.infradead.org,
 Jonas Karlman <jonas@kwiboo.se>, eddie.cai@rock-chips.com,
 Laurent.pinchart@ideasonboard.com, enric.balletbo@collabora.com,
 dgreid@chromium.org, sam@ravnborg.org, linux-arm-kernel@lists.infradead.org,
 cychiang@chromium.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW4gdGhlIGRlc2lnbndhcmUgZGF0YWJvb2ssIHRoZSBzZXF1ZW5jZSBvZiBlbmFibGluZyBhdWRp
byBjbG9jayBhbmQKc2V0dGluZyBmb3JtYXQgaXMgbm90IGNsZWFybHkgc3BlY2lmaWVkLgpDdXJy
ZW50bHksIGF1ZGlvIGNsb2NrIGlzIGVuYWJsZWQgaW4gdGhlIGVuZCBvZiBod19wYXJhbSBvcHMg
YWZ0ZXIKc2V0dGluZyBmb3JtYXQuCgpPbiBzb21lIG1vbml0b3JzLCB0aGVyZSBpcyBhIHBvc3Np
YmlsaXR5IHRoYXQgYXVkaW8gZG9lcyBub3QgY29tZSBvdXQuCkZpeCB0aGlzIGJ5IGVuYWJsaW5n
IGF1ZGlvIGNsb2NrIGluIGF1ZGlvX3N0YXJ0dXAgb3BzCmJlZm9yZSBod19wYXJhbSBvcHMgc2V0
dGluZyBmb3JtYXQuCgpTaWduZWQtb2ZmLWJ5OiBDaGVuZy1ZaSBDaGlhbmcgPGN5Y2hpYW5nQGNo
cm9taXVtLm9yZz4KUmV2aWV3ZWQtYnk6IERvdWdsYXMgQW5kZXJzb24gPGRpYW5kZXJzQGNocm9t
aXVtLm9yZz4KUmV2aWV3ZWQtYnk6IEpvbmFzIEthcmxtYW4gPGpvbmFzQGt3aWJvby5zZT4KVGVz
dGVkLWJ5OiBEb3VnbGFzIEFuZGVyc29uIDxkaWFuZGVyc0BjaHJvbWl1bS5vcmc+Ci0tLQogQ2hh
bmdlcyBmcm9tIHYxOgogMS4gTW92ZSBhdWRpb19zdGFydHVwIHRvIHRoZSBmcm9udCBvZiBhdWRp
b19zaHV0ZG93bi4KIDIuIEZpeCB0aGUgaW5kZW50YXRpb24gb2YgYXVkaW9fc3RhcnR1cCBlcXVh
bCBzaWduIHVzaW5nIHRhYi4KIDMuIFJlYmFzZSB0aGUgcGF0Y2ggb24gbGludXgtbmV4dC9tYXN0
ZXIuCiA0LiBBZGQgUmV2aWV3ZWQtYnkgYW5kIFRlc3RlZC1ieSBmaWVsZHMgZnJvbSBkaWFuZGVy
c0BjaHJvbWl1bS5vcmcuCiA1LiBBZGQgUmV2aWV3ZWQtYnkgZmllbGQgZnJvbSBqb25hc0Brd2li
b28uc2UuCgogZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLWkycy1hdWRp
by5jIHwgOSArKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKykKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWktaTJzLWF1ZGlv
LmMgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWktaTJzLWF1ZGlvLmMK
aW5kZXggMWQxNWNmOWI2ODIxLi4zNGQ4ZTgzNzU1NWYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS1pMnMtYXVkaW8uYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWktaTJzLWF1ZGlvLmMKQEAgLTEwOSw2ICsxMDks
MTQgQEAgc3RhdGljIGludCBkd19oZG1pX2kyc19od19wYXJhbXMoc3RydWN0IGRldmljZSAqZGV2
LCB2b2lkICpkYXRhLAogCWhkbWlfd3JpdGUoYXVkaW8sIGNvbmYwLCBIRE1JX0FVRF9DT05GMCk7
CiAJaGRtaV93cml0ZShhdWRpbywgY29uZjEsIEhETUlfQVVEX0NPTkYxKTsKIAorCXJldHVybiAw
OworfQorCitzdGF0aWMgaW50IGR3X2hkbWlfaTJzX2F1ZGlvX3N0YXJ0dXAoc3RydWN0IGRldmlj
ZSAqZGV2LCB2b2lkICpkYXRhKQoreworCXN0cnVjdCBkd19oZG1pX2kyc19hdWRpb19kYXRhICph
dWRpbyA9IGRhdGE7CisJc3RydWN0IGR3X2hkbWkgKmhkbWkgPSBhdWRpby0+aGRtaTsKKwogCWR3
X2hkbWlfYXVkaW9fZW5hYmxlKGhkbWkpOwogCiAJcmV0dXJuIDA7CkBAIC0xNTMsNiArMTYxLDcg
QEAgc3RhdGljIGludCBkd19oZG1pX2kyc19nZXRfZGFpX2lkKHN0cnVjdCBzbmRfc29jX2NvbXBv
bmVudCAqY29tcG9uZW50LAogCiBzdGF0aWMgc3RydWN0IGhkbWlfY29kZWNfb3BzIGR3X2hkbWlf
aTJzX29wcyA9IHsKIAkuaHdfcGFyYW1zCT0gZHdfaGRtaV9pMnNfaHdfcGFyYW1zLAorCS5hdWRp
b19zdGFydHVwICA9IGR3X2hkbWlfaTJzX2F1ZGlvX3N0YXJ0dXAsCiAJLmF1ZGlvX3NodXRkb3du
CT0gZHdfaGRtaV9pMnNfYXVkaW9fc2h1dGRvd24sCiAJLmdldF9lbGQJPSBkd19oZG1pX2kyc19n
ZXRfZWxkLAogCS5nZXRfZGFpX2lkCT0gZHdfaGRtaV9pMnNfZ2V0X2RhaV9pZCwKLS0gCjIuMjMu
MC4xODcuZzE3ZjViNzU1NmMtZ29vZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
