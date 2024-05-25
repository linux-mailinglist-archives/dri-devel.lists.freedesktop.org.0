Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A1B28CF271
	for <lists+dri-devel@lfdr.de>; Sun, 26 May 2024 04:18:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3648E10E6BD;
	Sun, 26 May 2024 02:18:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gwZoCPXp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57E1210E0BB
 for <dri-devel@lists.freedesktop.org>; Sat, 25 May 2024 14:26:59 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-2e964acff1aso9258901fa.0
 for <dri-devel@lists.freedesktop.org>; Sat, 25 May 2024 07:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1716647217; x=1717252017; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=oKAAkWWMlxIl2EN1rlWZQebyBeQkVqcJLORuvsM2/HU=;
 b=gwZoCPXpNIH7N4XcNqvMDuHPGc2cfhO5OY0soWffY0L2iKeB9vxAlbrGboDz3TAR72
 zlL1hGq7mBOzcTKtvjhm66uG9qUG3OX9hLoKi1S+i0B9YNCKQMa0aW/5EbVtKRK0ARgP
 GoVTsLFEnFSBPgP+8HSbQZ/TBW/ne6KCNJkIFP9/QmpHoNm/y5jd+izzwiNC/HX/L+xo
 H1qu4j75uBCDO9cZKFiL5U708l/39RqvRpCQi3fCRB7YUmNItSbXrcx84yxDKhcZCIsc
 DzqygOyxc5gKgIFX+wA7e4TGMvlb3nAUAWhC7wgEDMP3UzIjBXxuB6HqGhWn8PJHW3U4
 9mYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716647217; x=1717252017;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oKAAkWWMlxIl2EN1rlWZQebyBeQkVqcJLORuvsM2/HU=;
 b=PhcTOyNTBJ+lyt1TBtWcv/TogfzRrdCmZuXnlH/RQKMz3d7CNj/prX1oj55f2d9jlc
 WVEQruapGPhCmq71VHxsN/dL+IEzX4hmnkM+Uiz9SawVfdmdEyoiFxB3EVI8Kod13UIB
 9D8XbmHC0VcpRCtVWQ4kOM0MkOGX0OkbwiUYGR5rNrV4xwehpKYTprA5vPu19bP9LHeV
 KwDYVvYOjRXRd+mcFgNi4DBL46ujOH5nlJjodBdIl9uEuQX+FmbPB3CVaCOMyNH/PnPG
 CU0RQ4SwW62pF/TYjrkmgLbx22bJFWaQ39bV7/dlrNc1aqqGPYcQfS6KYH6EZB5x2Q8v
 WSCA==
X-Gm-Message-State: AOJu0YxPoSsmMCM4iKiMTIi8GPx9D0BrFJ46sJn9huitCC2fs9YR4w6k
 iNQ6axJL62sfiObiIh+r213uAZ3/e5AU2PjKIquw6HSh9CFYOmSn
X-Google-Smtp-Source: AGHT+IF3Of33Ktr4h0E4kS+dmkhk5yMGJdpEvxoOA1AG/NeJsq3KtVqBD2gwZlfYu7IiqNPzSwNtqA==
X-Received: by 2002:a2e:9d84:0:b0:2e2:2791:9842 with SMTP id
 38308e7fff4ca-2e95b2da90emr34562491fa.44.1716647216785; 
 Sat, 25 May 2024 07:26:56 -0700 (PDT)
Received: from killbill.home (static-241-112-224-77.ipcom.comunitel.net.
 [77.224.112.241]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3557dcf06dcsm4144451f8f.106.2024.05.25.07.26.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 May 2024 07:26:56 -0700 (PDT)
From: Melissa Wen <melissa.srw@gmail.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mairacanal@riseup.net>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org,
	kernel-dev@igalia.com
Subject: [PATCH] MAINTAINERS: remove myself as a VKMS maintainer
Date: Sat, 25 May 2024 16:26:28 +0200
Message-ID: <20240525142637.82586-1-melissa.srw@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 26 May 2024 02:18:28 +0000
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

I haven't been able to follow or review the work on the driver for some
time now and I don't see the situation improving anytime soon. I'd like
to continue being listed as a reviewer.

Signed-off-by: Melissa Wen <melissa.srw@gmail.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7d735037a383..79fe536355b0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7027,10 +7027,10 @@ F:	drivers/gpu/drm/udl/
 
 DRM DRIVER FOR VIRTUAL KERNEL MODESETTING (VKMS)
 M:	Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
-M:	Melissa Wen <melissa.srw@gmail.com>
 M:	Maíra Canal <mairacanal@riseup.net>
 R:	Haneen Mohammed <hamohammed.sa@gmail.com>
 R:	Daniel Vetter <daniel@ffwll.ch>
+R:	Melissa Wen <melissa.srw@gmail.com>
 L:	dri-devel@lists.freedesktop.org
 S:	Maintained
 T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
-- 
2.43.0

