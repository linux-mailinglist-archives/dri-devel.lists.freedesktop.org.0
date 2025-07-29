Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54F3EB15213
	for <lists+dri-devel@lfdr.de>; Tue, 29 Jul 2025 19:29:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B767A10E3F6;
	Tue, 29 Jul 2025 17:29:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QMGZshGe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E4EA10E047
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jul 2025 17:29:14 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-6154d14d6b7so2469837a12.2
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jul 2025 10:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753810152; x=1754414952; darn=lists.freedesktop.org;
 h=content-transfer-encoding:hash:mime-version:message-id:date:subject
 :cc:to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xnoxrgHFXOhqbLG6SX/FzeU8ZrjULS73YjFpkHDk5aE=;
 b=QMGZshGeDQwu8gjuqavAYSFHAQfh9JTVq8orvm8JH3KPtGlZ1+GUhdscHfAMWs+Rq7
 IMk48kqrSp1BolKLrOcmq9fGahmjMhOhgeOvund2Hg+scvYHl5F0+OHIb23upxnxAZPP
 XD6dTQyDiMYehCxLg1TKqzQurPtZASeAeSTIkG8OuME4lgylyVAd1ziK3qQ4vwgqdZb8
 2i4G4B6r9tYF92cOKn+Zo9vJmeM1N0K744+GSLw/jwMVcHWH2dz6jMaPdrsYC3I5f4R7
 SDhQDc6ISDCS8YuUtkilr//jPdzdFfqgWAbxOpgX9BEoHvPjCkK5Ge9A4IBvAHO/FDnv
 V+CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753810152; x=1754414952;
 h=content-transfer-encoding:hash:mime-version:message-id:date:subject
 :cc:to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xnoxrgHFXOhqbLG6SX/FzeU8ZrjULS73YjFpkHDk5aE=;
 b=AVhFFMKAvLXkO2xV8BbP9LWd5j32GhROJ5o89F+IxcMm0jwKjy8bshUAu4edS2Ow4K
 iWUnrzmdU6KErAFCmqNUwKGrFt6oJJwEmZl3evMOXUc4+gv+CYRATAlfKpnccJ7nSvJ0
 nmgWWSJYILdK4OTNPOYPuydlGyXQVARmUybBXcnWE8KVtreSOdJlwpH1JiXie91/K8pN
 2jTq1IwwVSLdWkZv25dF68UEbGjJpYDr8Bc69mE+aurW69S/Th7D+6eAx0pSuaOgw/ax
 TNCsl0stQvXcb0qkpiIRtQQTcmBmikKwF1dsi+ooUAe1QvmEM6skb8nqeQbYaG4AItM2
 rKtA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+obxAXnxu9qCq1Mjdq6lWJuTwzz9+m3WTaLw9aNu7/dp85fZHZ1JzK+r0Yo9s2pdsrfr4w3nC7WI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzm8J1FInGVpjKVQCW6tv59/0Ip746l865Pd589dpiA8dHOU5rK
 wqlj8L4CSM8fBUZDT5U4lPtxUQoNoP1n91zkNbuZZy7/72eB4tpu/5W8
X-Gm-Gg: ASbGnctm2VTWVe6PsvI6Iyq/9L//GuwmI2QPlv+fTGZaDEx8H+Fcz1/cRchcA6kXGNe
 AFeSIi3bTcnnx5OdTe1/rqv3lG0M02qAqzBGjBZ/HZD9/eMMPJT+jIRpcN8/1YinODwINuuG/JA
 gYtO4hmSLf+yx+edV+HibIjmv4YmnZwpwW6Bg1cSdkuo5uQ7toK23+fD+Y2T+3M/BJKXTi2hWyg
 mlbo1/zHxvAWP1DOLcpD/TkzU9KQV4wqkwTmdzz2EHlFo20x6XFL8vV2RmqbI0mwWYOi+pBkroB
 V86FxvtYrFbczC+FJ4qm4R7/3Zj855c69MkTUgRdj+umEcxDnndJvBDnEyRV3+OwfzhE9gLS1rB
 jUUOQ6f2LKPMIMN997AihCNmSH1vEnReuUQQ9RklpCLArOubnC1IOoqLQPl6tjYYbzl3RS+Y8w6
 qGyGzQ+WpDKamg
X-Google-Smtp-Source: AGHT+IHnaMLK/wutqRPOwtt4VCoijTWOUWF8FDkzAMzpyaI9zHP0/CU8jriOVzEXS8nqjG/RYQCL6w==
X-Received: by 2002:a17:907:3ea9:b0:ae3:f16e:4863 with SMTP id
 a640c23a62f3a-af8fd691b1dmr41914766b.1.1753810151950; 
 Tue, 29 Jul 2025 10:29:11 -0700 (PDT)
Received: from shashanks-buildpc.. (p5b30e3c6.dip0.t-ipconnect.de.
 [91.48.227.198]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af63589cab0sm608384366b.38.2025.07.29.10.29.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jul 2025 10:29:11 -0700 (PDT)
From: Shashank Sharma <contactshashanksharma@gmail.com>
To: xorg-announce@lists.x.org,
	dri-devel@lists.freedesktop.org
Cc: alexander.deucher@amd.com, xorg@lists.x.org, shashank.sharma@amd.com,
 mario.limonciello@amd.com
Subject: 
Date: Tue, 29 Jul 2025 19:29:00 +0200
Message-ID: <20250729172901.681337-1-contactshashanksharma@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Hash: SHA512
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Subject: [ANNOUNCE] xf86-video-amdgpu 25.0.0
To: xorg-announce@lists.x.org
Cc: xorg@lists.x.org

Alan Coopersmith (3):
      gitlab CI: add builds against server-21.1-branch
      Revert "use dixDestroyPixmap() instead of direct driver call"
      Improve man page formatting

Chris Bainbridge (2):
      Fix segfault on dock suspend, unplug, resume
      Free output_ids

Enrico Weigelt, metux IT consult (8):
      bump minimal xorg version to 1.18
      drop compat with ancient xserver versions
      dont check for HAS_DIRTYTRACKING_ROTATION: it's always enabled.
      dont use obsolete pict_f_transform alias anymore
      use XNFalloc() instead of xnfalloc
      use XNFcallocarray() instead of xnfcalloc macro
      use dixDestroyPixmap() instead of direct driver call
      ci: compactify redundant declarations via matrix

Hamza Mahfooz (1):
      Enable TearFree if it's set to auto and VariableRefresh is enabled

Herman Semenov (1):
      Fixed AMDGPUOptions_KMS for align structures 64bit

Marek Olšák (1):
      Check GFX12 swizzle mode correctly

Mario Limonciello (9):
      Fix a crash when initializing with a property with no atoms
      trivial: Add workflow rules
      Add missing xorg-server.h header
      Add support for the meson build system
      Migrate CI over to meson
      Drop support for autotools build system
      trivial: drop unused gitignore
      trivial: ignore .vscode directory
      Bump version for 25.0.0 release

Pierre-Eric Pelloux-Prayer (3):
      ci: switch from testing to bookworm
      ci: use gfx-ci/ci-deb-repo to get latest libdrm
      Use GBM_BO_USE_FRONT_RENDERING on front_buffer alloc

Uday Kiran Pichika (1):
      Handling of color management properties

git tag: xf86-video-amdgpu-25.0.0

https://xorg.freedesktop.org/archive/individual/driver/xf86-video-amdgpu-25.0.0.tar.xz
SHA256: 7653cead024a6820ed1139958503278d78b4b3f80befcacf54ce87a5199b0ce2  xf86-video-amdgpu-25.0.0.tar.xz
SHA512: d143294fead7073c14100299ccab20d1f5eab8b7e36c1770b12aaade958211e1961f4353dc47123c3b9af9f7a911d913def71d25b83dab3dee1d289043869891  xf86-video-amdgpu-25.0.0.tar.xz
PGP:  https://xorg.freedesktop.org/archive/individual/driver/xf86-video-amdgpu-25.0.0.tar.xz.sig

BEGIN PGP SIGNATURE:
iQGzBAEBCgAdFiEE8REeSq+YTJdjeV/+SyW1GAUiuNkFAmiI+vwACgkQSyW1GAUi
uNnZQwv9G2dLy/A44yG8iFfrCKt3i7Pk6A2QT5y7Q9j4xhplVv1F0V+3olYxRV4D
uAbBvEExP/qHEtkGeIruEoXdfQ+lMLjIeyAXCVHP6qxgVHBWKwXzsD96dSkm0F+4
lq5kHtKb8gMiFgpvPh2rNa1wlYUvwse4/wX8EJxkXedVVRcQiC/IdHXl8wAZyNdI
4YwedqEKSejBJfCEP/AyGW5k6vNQ+2nz7F/XKb680A/FyUThlL/RYV5RtVzpL03i
b5z/Cesc4oU9mkJprwannma7z5P2Jo6Mf/k5zmieeo+J9lS7tLxgpClyk8pe/Q5q
telItLqWoF7YAJGLFeHgxhYsymHIOXH7OAZvarzIy1qRVjND54GNoLc43WU+y9sR
4AEZkYhCOWZySvBdJ18t7/pYl03f3Q5SMnumDJV3LkmwTnbex2RtL/C5g3FKSAeD
aa3U5HWUoazd3c5o+eKCQfz+VIKYUGn+c0pPeUl3Nmc/6oRNss0aTEKqXIDlYG/u
9gzaKC99
=i6RD
END PGP SIGNATURE
