Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CDAF243B2
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2019 00:51:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2809A89193;
	Mon, 20 May 2019 22:51:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F138889193;
 Mon, 20 May 2019 22:51:38 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id q15so898579wmj.0;
 Mon, 20 May 2019 15:51:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OIPvZjuI/lMeNdF8mkeNCYnvgnDdXkv0Gu6SZLCKPLw=;
 b=S2rX/ZeiUQybThzeiARDeTL6aISGgZNCAKVfFduFhALeTngBXIgWJsXjMghpTdP8ni
 fOYnQjfyKzMvqBwoUIoTSUa7f6ASc4QcVZoCq84QqJXFczv6aPiSHsbrVlMdPkvGe71/
 cOItREgG3ZaPUfGNj1JUjJKlfkj34s8CClXVnKndvg0n9MQjSUKCWkcpvmr+G6qXPevS
 T0ajfio+pLODnfA2sQtXlCkGGH4Lj8mrgFn8tVtfAz8ZSr2Z99JEUP0lMBmqPrm/zrSD
 SB5af15UdZ0W1NUnFiy+txdqL2ogfimwON9+i21g7nuPkBbSB+qZko7x9Pr4n2TFgFIz
 GYzQ==
X-Gm-Message-State: APjAAAVY5F60GxbRL3blJOGGDEVDxOgK74seFA1IUsuAgPyMok59PH/N
 CB97kHjmMy2wY7oGRwoeaiM=
X-Google-Smtp-Source: APXvYqw/IpNploDES7UUoe7huaUQZvVZ9UwxV7+lgQS22h+aoq1lMdB+uXR92EXT3NccKD6rOsDNEA==
X-Received: by 2002:a7b:ca42:: with SMTP id m2mr975726wml.35.1558392697679;
 Mon, 20 May 2019 15:51:37 -0700 (PDT)
Received: from localhost.localdomain (ip-94-112-137-51.net.upcbroadband.cz.
 [94.112.137.51])
 by smtp.gmail.com with ESMTPSA id x64sm2165979wmg.17.2019.05.20.15.51.36
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 20 May 2019 15:51:37 -0700 (PDT)
From: Erico Nunes <nunes.erico@gmail.com>
To: Qiang Yu <yuq825@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>,
 christian.koenig@amd.com, Nayan Deshmukh <nayan26deshmukh@gmail.com>,
 Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 Eric Anholt <eric@anholt.net>, Sharat Masetty <smasetty@codeaurora.org>,
 dri-devel@lists.freedesktop.org, lima@lists.freedesktop.org
Subject: [PATCH] drm/scheduler: Fix job cleanup without timeout handler
Date: Tue, 21 May 2019 00:50:58 +0200
Message-Id: <20190520225058.21406-1-nunes.erico@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OIPvZjuI/lMeNdF8mkeNCYnvgnDdXkv0Gu6SZLCKPLw=;
 b=ohwvQTRuPG+pblUW8WWalVU8R0qsq9YuGGnaCEgAUwRtlbS46CQq9uI2Xj6owEH46l
 gbkGJhRImR92mb/VBVGatqbSwVzBnnCBWh8tYqzeA4KNVZEGMEUmG+1a9Ap0CriTzM9+
 uoVpRSxd7Fyxq5/B8mLyXE/MKN4x+rNOml0Eid/MyoN9TY22bmhJJYaescO58BZRCwP0
 3gZSky3XMDapkr8EtSgpNhYeb+ojywhAEk+Yw9R/2erPsCbIBv1EKfnPMVl3ig6vfLWc
 AHSjLBVHkAN8zFbLd+MBWX9yZJfeLePx8mxbLmqDB8a1FVmJKueQya4N1aaXssvtoUNy
 ILwA==
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
Cc: Erico Nunes <nunes.erico@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWZ0ZXIgIjU5MTgwNDVjNGVkNCBkcm0vc2NoZWR1bGVyOiByZXdvcmsgam9iIGRlc3RydWN0aW9u
Iiwgam9icyBhcmUKb25seSBkZWxldGVkIHdoZW4gdGhlIHRpbWVvdXQgaGFuZGxlciBpcyBhYmxl
IHRvIGJlIGNhbmNlbGxlZApzdWNjZXNzZnVsbHkuCgpJbiBjYXNlIG5vIHRpbWVvdXQgaGFuZGxl
ciBpcyBydW5uaW5nICh0aW1lb3V0ID09IE1BWF9TQ0hFRFVMRV9USU1FT1VUKSwKam9iIGNsZWFu
dXAgd291bGQgYmUgc2tpcHBlZCB3aGljaCBtYXkgcmVzdWx0IGluIG1lbW9yeSBsZWFrcy4KCkFk
ZCB0aGUgaGFuZGxpbmcgZm9yIHRoZSAodGltZW91dCA9PSBNQVhfU0NIRURVTEVfVElNRU9VVCkg
Y2FzZSBpbgpkcm1fc2NoZWRfY2xlYW51cF9qb2JzLgoKU2lnbmVkLW9mZi1ieTogRXJpY28gTnVu
ZXMgPG51bmVzLmVyaWNvQGdtYWlsLmNvbT4KQ2M6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlh
bi5rb2VuaWdAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX21h
aW4uYyB8IDMgKystCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9u
KC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9tYWluLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX21haW4uYwppbmRleCBmOGYwZTFjMTkw
MDIuLjA3ZWNhYmExNTEyNyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9z
Y2hlZF9tYWluLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9tYWluLmMK
QEAgLTYzMCw3ICs2MzAsOCBAQCBzdGF0aWMgdm9pZCBkcm1fc2NoZWRfY2xlYW51cF9qb2JzKHN0
cnVjdCBkcm1fZ3B1X3NjaGVkdWxlciAqc2NoZWQpCiAJdW5zaWduZWQgbG9uZyBmbGFnczsKIAog
CS8qIERvbid0IGRlc3Ryb3kgam9icyB3aGlsZSB0aGUgdGltZW91dCB3b3JrZXIgaXMgcnVubmlu
ZyAqLwotCWlmICghY2FuY2VsX2RlbGF5ZWRfd29yaygmc2NoZWQtPndvcmtfdGRyKSkKKwlpZiAo
c2NoZWQtPnRpbWVvdXQgIT0gTUFYX1NDSEVEVUxFX1RJTUVPVVQgJiYKKwkgICAgY2FuY2VsX2Rl
bGF5ZWRfd29yaygmc2NoZWQtPndvcmtfdGRyKSkKIAkJcmV0dXJuOwogCiAKLS0gCjIuMjAuMQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
