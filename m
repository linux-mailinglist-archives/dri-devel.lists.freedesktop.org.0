Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 40C082CA3E2
	for <lists+dri-devel@lfdr.de>; Tue,  1 Dec 2020 14:32:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C86A56E52C;
	Tue,  1 Dec 2020 13:32:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com
 [IPv6:2a00:1450:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6612A6E52C
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Dec 2020 13:32:13 +0000 (UTC)
Received: by mail-ej1-x642.google.com with SMTP id pg6so4105362ejb.6
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Dec 2020 05:32:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=piBtpneYLO58P28A0TXRBgzJoQ61ll2ILAXaeCK+w04=;
 b=PWHKDPKKiUmf55kNeLM+Wb6q0jqjwZnHoGN/izgWHhXhv4tNk3cFLXJ2zCR494tF9X
 DtBDJQdeII2PUzXj3JuFRAUTGQyyFDfLLS+bBr9c/3lBVOyZPBdzUVsFSktsjcUtU5wu
 olv4dCMDslub6Di3M98mOkhXDSFLknOtcyXzvULTzeyhinkO/N37ubWZJo3hzYzkUl0b
 N8OwxR9P/FdouPM1vy79WsC/j8ZdyC31esmr/WoJwOOJ7i7jin6wBEOiNyOe6Xn7Neou
 2U7gt9hvbow5I/WDxyCWFFDP0qjbLKPOHSod2FPR9Mk3UEPJ7wkjn1tR3x+ylAAdecoI
 V6eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=piBtpneYLO58P28A0TXRBgzJoQ61ll2ILAXaeCK+w04=;
 b=Z6yVBWpFC0kcBGiYjeOuVosXYph63OwsyWTZBJBdHlzoTXbln1OecdYziwtTpGsndc
 ie8SGBdEveiBUYTTwdJOg25GCMUuRsj8c+xmgjk89BJpjFDNVlnro4hSYscb/GyzhZ1K
 66r0hAaBuj2dFcIbedJUugqhXdES/3hVRi76KjIVzjJ02ZYqmt1DsGyfMxPiClIffq9E
 xaHoRIgEYv0oEGm6FuQwwXMwnAlTV+1q4bxnbibOyUtr6Xc0JuM1hLvtWKEkQqfyDXyD
 1uIoOlgetLTBdei148t4kvX9/BmLr76i+yfG7JDuPp8tQVhmowYjE72LOl559SAADOll
 R8gQ==
X-Gm-Message-State: AOAM533IRLCVTMaCEP8uY3yIbSrWL8jHSSj1sbP9+F0tCSBKL3T0JA7a
 SihonSqs+AJvindgytGARQ6ADRlqYIU=
X-Google-Smtp-Source: ABdhPJycJSu2IB8DiDJoSMoOvaghpNZdQyV/u3NJHqTfmup/naYTXv/X5q1V7eCPvcQ79Pr5b47ZeA==
X-Received: by 2002:a17:906:b7d6:: with SMTP id
 fy22mr2964388ejb.219.1606829531820; 
 Tue, 01 Dec 2020 05:32:11 -0800 (PST)
Received: from laptop.fritz.box ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id 3sm861210ejn.7.2020.12.01.05.32.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Dec 2020 05:32:11 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/ttm: stop destroying pinned ghost object
Date: Tue,  1 Dec 2020 14:32:10 +0100
Message-Id: <20201201133210.109309-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RGFuaWVsIGFkZGVkIGEgd2FybmluZyBmb3IgdGhpcywgYnV0IHdlIHdlcmUgYWJ1c2luZyB0aGF0
IGJlaGF2aW9yIGhlcmUuCgpTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3Rp
YW4ua29lbmlnQGFtZC5jb20+CkZpeGVzOiA1N2ZjZDU1MGViMTUgKCJkcm0vdHRtOiBXYXJuIG9u
IHBpbm5pbmcgd2l0aG91dCBob2xkaW5nIGEgcmVmZXJlbmNlIikKLS0tCiBkcml2ZXJzL2dwdS9k
cm0vdHRtL3R0bV9ib191dGlsLmMgfCA0ICsrKy0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlv
bnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0
bV9ib191dGlsLmMgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib191dGlsLmMKaW5kZXggN2Nj
YjIyOTVjYWMxLi41YmJjMTMzOWQyOGUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS90dG0v
dHRtX2JvX3V0aWwuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib191dGlsLmMKQEAg
LTMxMCw3ICszMTAsNyBAQCBzdGF0aWMgaW50IHR0bV9idWZmZXJfb2JqZWN0X3RyYW5zZmVyKHN0
cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8sCiAJa3JlZl9pbml0KCZmYm8tPmJhc2Uua3JlZik7
CiAJZmJvLT5iYXNlLmRlc3Ryb3kgPSAmdHRtX3RyYW5zZmVyZWRfZGVzdHJveTsKIAlmYm8tPmJh
c2UuYWNjX3NpemUgPSAwOwotCWZiby0+YmFzZS5waW5fY291bnQgPSAxOworCWZiby0+YmFzZS5w
aW5fY291bnQgPSAwOwogCWlmIChiby0+dHlwZSAhPSB0dG1fYm9fdHlwZV9zZykKIAkJZmJvLT5i
YXNlLmJhc2UucmVzdiA9ICZmYm8tPmJhc2UuYmFzZS5fcmVzdjsKIApAQCAtMzE5LDYgKzMxOSw4
IEBAIHN0YXRpYyBpbnQgdHRtX2J1ZmZlcl9vYmplY3RfdHJhbnNmZXIoc3RydWN0IHR0bV9idWZm
ZXJfb2JqZWN0ICpibywKIAlyZXQgPSBkbWFfcmVzdl90cnlsb2NrKCZmYm8tPmJhc2UuYmFzZS5f
cmVzdik7CiAJV0FSTl9PTighcmV0KTsKIAorCXR0bV9ib19tb3ZlX3RvX2xydV90YWlsX3VubG9j
a2VkKCZmYm8tPmJhc2UpOworCiAJKm5ld19vYmogPSAmZmJvLT5iYXNlOwogCXJldHVybiAwOwog
fQotLSAKMi4yNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWwK
