Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 89729F5A03
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2019 22:37:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 507F96FA92;
	Fri,  8 Nov 2019 21:37:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E06396FA92
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Nov 2019 21:37:37 +0000 (UTC)
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.129]) with ESMTPA (Nemesis) id
 1N3sye-1hkxG40Ils-00zl9w; Fri, 08 Nov 2019 22:37:20 +0100
From: Arnd Bergmann <arnd@arndb.de>
To: y2038@lists.linaro.org, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 14/16] drm/msm: avoid using 'timespec'
Date: Fri,  8 Nov 2019 22:32:52 +0100
Message-Id: <20191108213257.3097633-15-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20191108213257.3097633-1-arnd@arndb.de>
References: <20191108213257.3097633-1-arnd@arndb.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:RjEXZPsu7wpFhVxxI0dg1gh3Sz1Hs1tSIhY/d+ypW54uoydpUSG
 AmGQqqAY8JV5SlTDcXhYy28Cbwi6/UGOCD0adGaB381dFQFh/45M+dKBA0PhUP+o9KaobMD
 qQ4+kG6gGE9DhvaaTxM/81sndh8nhZ8P0Vu53TlGZW7N7R5T5iUpKVXTQlPxMFUkAtL5rs2
 msQ7tFAGZ+6hiDk9RernQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:D5yuQNG3OL4=:+hVgFS2myj/sb8ogFE78Gf
 FbKWcflcE8+US9yHfM4XVrV8foC/5BoESWZWiO/u184ma1eEMd/MnwSldHbYazHDHwj+Hk0cc
 w1ZZoSZHw4i2n04uf7GQRD305sbby6a/ARii8mddT6zRtv89NmMt7YKRV2k6pa2McGa46TLXI
 27ESG6TqgROSWOlECco2f8f6/fAopAzdxTLoLuQQSdHwFAHO4VOhbQRmpC6yZ8gP75krH1mxD
 7RpqwXn3BD8r/pG1dTm/d6vf0KUkeMhjmjhvMn35EUGy10yqOyibgRSRNggUOVk+JXvqcbADt
 k+HAhYEhuPLgVd0+QAe1B4po/j2ou2y1fW0/nx9zGNC0/cRdk9b+ndgOFHcmTRdjHOxOEwmTb
 ibhZMHBgI7GoZJzMrt1nQ7+PYx+XcaL8O7kFdja71uOK/2P9ZFdFLRyROE0XQztIxXE+r3eF1
 YfSIi582gUSMzpxM4iIcFe3ieBp8J6DKYq6NX8x8B4ylUAUAs0I9f6B6kp4Pnwz2JAsjHWEwG
 h6f/GW3C8Uczi7An1srzRVP1SZriDAsuGBZvIamli9X7+IKnh09hTiJng40aSYHPBbKor/nDS
 gLMC3fT2lbdLzt5MYBKransgJZ2pbKZ8Np/YdZxRnO69REzQyXI449mSspVn/wbf/VeQoL144
 DUMHUqUPSL4P6uzETmFemX8tGWajJnhrjGeV0NLaelE2Lxhvsxn7IM3NAJW59eNULBS0RcMiD
 IZQ2f7Gv6anhh/MtSw2sEO5tpQ7Ggk+81o17ssiA635dGoVymkpMfpRJxjJmoh6SY9w3HbS+D
 nEhwjGkP08t6b86oomYL9qFNuRI5fmLgCcd45bPGdaCNzD2zaFO0+hUcD5kHmsalbPgc0w11X
 zFmCZZt7G4MqQdjIlmUw==
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
Cc: freedreno@lists.freedesktop.org, Jonathan Marek <jonathan@marek.ca>,
 Arnd Bergmann <arnd@arndb.de>, linux-arm-msm@vger.kernel.org,
 "Kristian H. Kristensen" <hoegsberg@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Joe Perches <joe@perches.com>,
 Sam Ravnborg <sam@ravnborg.org>, Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIHRpbWVzcGVjIHN0cnVjdHVyZSBhbmQgYXNzb2NpYXRlZCBpbnRlcmZhY2VzIGFyZSBkZXBy
ZWNhdGVkIGFuZCB3aWxsCmJlIHJlbW92ZWQgaW4gdGhlIGZ1dHVyZSBiZWNhdXNlIG9mIHRoZSB5
MjAzOCBvdmVyZmxvdy4KClRoZSB1c2Ugb2Yga3RpbWVfdG9fdGltZXNwZWMoKSBpbiB0aW1lb3V0
X3RvX2ppZmZpZXMoKSBkb2VzIG5vdApzdWZmZXIgZnJvbSB0aGF0IG92ZXJmbG93LCBidXQgaXMg
ZWFzeSB0byBhdm9pZCBieSBqdXN0IGNvbnZlcnRpbmcKdGhlIGt0aW1lX3QgaW50byBqaWZmaWVz
IGRpcmVjdGx5LgoKU2lnbmVkLW9mZi1ieTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4K
LS0tCiBkcml2ZXJzL2dwdS9kcm0vbXNtL21zbV9kcnYuaCB8IDMgKy0tCiAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL21zbS9tc21fZHJ2LmggYi9kcml2ZXJzL2dwdS9kcm0vbXNtL21zbV9kcnYuaAppbmRl
eCA3MTU0N2U3NTZlMjkuLjc0MGJmN2M3MGQ4ZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L21zbS9tc21fZHJ2LmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL21zbS9tc21fZHJ2LmgKQEAgLTQ1
NCw4ICs0NTQsNyBAQCBzdGF0aWMgaW5saW5lIHVuc2lnbmVkIGxvbmcgdGltZW91dF90b19qaWZm
aWVzKGNvbnN0IGt0aW1lX3QgKnRpbWVvdXQpCiAJCXJlbWFpbmluZ19qaWZmaWVzID0gMDsKIAl9
IGVsc2UgewogCQlrdGltZV90IHJlbSA9IGt0aW1lX3N1YigqdGltZW91dCwgbm93KTsKLQkJc3Ry
dWN0IHRpbWVzcGVjIHRzID0ga3RpbWVfdG9fdGltZXNwZWMocmVtKTsKLQkJcmVtYWluaW5nX2pp
ZmZpZXMgPSB0aW1lc3BlY190b19qaWZmaWVzKCZ0cyk7CisJCXJlbWFpbmluZ19qaWZmaWVzID0g
a3RpbWVfZGl2bnMocmVtLCBOU0VDX1BFUl9TRUMgLyBIWik7CiAJfQogCiAJcmV0dXJuIHJlbWFp
bmluZ19qaWZmaWVzOwotLSAKMi4yMC4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
