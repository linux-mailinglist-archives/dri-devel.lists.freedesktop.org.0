Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C021B3281B
	for <lists+dri-devel@lfdr.de>; Sat, 23 Aug 2025 12:04:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABF3B10E1CB;
	Sat, 23 Aug 2025 10:03:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ironrobin.net header.i=@ironrobin.net header.b="Txovt1j8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4327.protonmail.ch (mail-4327.protonmail.ch [185.70.43.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B987010E06C;
 Sat, 23 Aug 2025 02:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ironrobin.net;
 s=protonmail3; t=1755914987; x=1756174187;
 bh=7uyzeRQggc6oxgd0PY2L8gdeh5mdqNaDhpkqBh9myCA=;
 h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=Txovt1j8ozud0Fl9wUnCIPLjQ3vGhuZGrVCHDOGxYKJ89H0ZpJOpKLu2fiKFZqm+G
 1kg6LjHoRhSbihBUeejCB+fckqcEsStN+doMMIl44drLq2sXPeEJgQMUkYDWnfysH+
 gkMBb6EG4Dccp06a9HdUzVeXwTu0bc9LQk0GU905bwJWt74RF8I1PoEGYK7x+WoFVN
 J6vRclyjG6SHa7ZK3zZAgO21irhpb4e2HiHSe6Z6hUkJ4JfH9GBkG7YiQRMQMSXBhY
 ozZsqC3ps7Sr6+YWHwf+/9mAXXhEPSCp5Y4PCvSG3UPot/Pq0VXPshVWlHR0tdwAtG
 BC+FmYtqyWyOQ==
Date: Sat, 23 Aug 2025 02:09:39 +0000
To: robin.clark@oss.qualcomm.com
From: Alex Robinson <alex@ironrobin.net>
Cc: lumag@kernel.org, abhinav.kumar@linux.dev, jessica.zhang@oss.qualcomm.com,
 sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
 simona@ffwll.ch, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Alex Robinson <alex@ironrobin.net>
Subject: [PATCH] drm/msm: fix race in Adreno header generation
Message-ID: <20250823020919.9947-1-alex@ironrobin.net>
Feedback-ID: 54785507:user:proton
X-Pm-Message-ID: 34fe4442870d8e3fff6aaa4af76ca24c06fbe3f5
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Sat, 23 Aug 2025 10:03:57 +0000
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

Builds can compile msm-y objects (e.g. msm_gpu_devfreq.o)
before adreno_common.xml.h is generated in trees that generate Adreno
headers at build time. Make msm-y depend on the generated headers,
removing the race.

Signed-off-by: Alex Robinson <alex@ironrobin.net>
---
 drivers/gpu/drm/msm/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
index 0c0dfb25f01b..1a918d44ac48 100644
--- a/drivers/gpu/drm/msm/Makefile
+++ b/drivers/gpu/drm/msm/Makefile
@@ -221,6 +221,7 @@ DISPLAY_HEADERS =3D \
 =09generated/sfpb.xml.h
=20
 $(addprefix $(obj)/,$(adreno-y)): $(addprefix $(obj)/,$(ADRENO_HEADERS))
+$(addprefix $(obj)/,$(msm-y)): $(addprefix $(obj)/,$(ADRENO_HEADERS))
 $(addprefix $(obj)/,$(msm-display-y)): $(addprefix $(obj)/,$(DISPLAY_HEADE=
RS))
=20
 targets +=3D $(ADRENO_HEADERS) $(DISPLAY_HEADERS)
--=20
2.50.1


