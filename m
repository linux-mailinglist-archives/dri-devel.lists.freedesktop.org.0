Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 05AD12E820A
	for <lists+dri-devel@lfdr.de>; Thu, 31 Dec 2020 21:52:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84CE789BFB;
	Thu, 31 Dec 2020 20:52:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7868D89BFB;
 Thu, 31 Dec 2020 20:52:07 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id p22so19040158edu.11;
 Thu, 31 Dec 2020 12:52:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=M4An2ikClnWimyLo/HuSeT7fgSzheBJPPXkyucZEwSY=;
 b=G+GtrXJ4FW0cRf8GuZVwDqb6EDmExGHjsDYh2HTa4gQFPuYBxbxu4Z6sFZH/sNz/kT
 1eKoxK8gh+4EZ6ogKS4O/8NXISD4XFJsCGoEfiziC+ouUqKu34H1ku4UyXCMUvs7eWfa
 A6lVIbd7APGf5/glem3WeReZuy6usPgRB1szX6GGLhNa/Wi3AF62eDEFaHbwMkl9qC/B
 OPf/kb+A1auUv+2NuXJNK95Xws9NMG6pOpC8vuQOicuYTmdAlapWy9E88lUqu5Q0j3Rg
 3kHJrBFczmODdytJE1xPlfqcVkah0B8U5RjC4KWDgE22LHZMSZHKyJkv8STsVRHebKAv
 DUTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=M4An2ikClnWimyLo/HuSeT7fgSzheBJPPXkyucZEwSY=;
 b=J+sDq6ebz/CECGM3xoHsJSpu6Hgk2S3CiAN0mc68Wb/P627RzTkQL9n1IYmff4AT9D
 fpPBkCv5JtheZos5rYzF40aF4RnGt7gsQC7jCYcC62uPRvBnjsjrFWn4uEsqDegfPjWT
 LirBvoeR67+4ACtVoI3caGaVsnjT8BgTE/qFh4tzvqzJ/MjkryjOqlDKJSPwKglQPpF6
 4vzhtdRHUiYmn74b8RVJJIyGCQQwmGXqxHGvwpeKXv8gLaFG7M937sLCHWohASX59LBY
 44rTFNLys4gpBpgGVFXndbVvU0Yi2c9ITxH9Ahz5GSe/5q3zJIjxk1Fu0qfH4avxTmdO
 UXNw==
X-Gm-Message-State: AOAM532Io28Hqo6Z0Uj65V4ojS1nI88fF/L9SnoCfKEAgsnXo1nc6NeC
 Xc8J8h87++fwz97W8lawpkTyCDFV3ow=
X-Google-Smtp-Source: ABdhPJxWSjjjZMXDcdkHDq+vAi1Occidxsq4qb0m35BBXnyVW5fw4xU3QovP2hhT3prUiv/W+cHGIA==
X-Received: by 2002:a50:a684:: with SMTP id e4mr56056487edc.148.1609447925825; 
 Thu, 31 Dec 2020 12:52:05 -0800 (PST)
Received: from twisty.localdomain
 (dynamic-2a01-0c23-8404-e900-6cbb-50d4-b91e-5b37.c23.pool.telefonica.de.
 [2a01:c23:8404:e900:6cbb:50d4:b91e:5b37])
 by smtp.gmail.com with ESMTPSA id z1sm18462558edm.89.2020.12.31.12.52.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Dec 2020 12:52:05 -0800 (PST)
From: Mario Kleiner <mario.kleiner.de@gmail.com>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH] drm/amd/display: Fix pageflipping for XOrg in Linux 5.11+
Date: Thu, 31 Dec 2020 21:51:36 +0100
Message-Id: <20201231205136.11422-1-mario.kleiner.de@gmail.com>
X-Mailer: git-send-email 2.24.0
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit 816853f9dc4057b6c7ee3c45ca9bd5905 ("drm/amd/display: Set new
format info for converted metadata.") may fix the getfb2 ioctl, but
in exchange it completely breaks all pageflipping for classic user
space, e.g., XOrg, as tested with both amdgpu-ddx and modesetting-ddx.
This leads to massive tearing, broken visual timing/timestamping etc.

Reason is that the classic pageflip ioctl doesn't allow a fb format
change during flip, and at least X uses classic pageflip ioctl and no
atomic modesetting api at all.

As one attempted workaround, only set the new format info for converted
metadata if the calling client isn't X. Not sure if this is the best
way, or if a better check would not be "not all atomic clients" or
similar? In any case it works for XOrg X-Server. Checking the ddx
code of intel-ddx/modesetting-ddx/amdgpu-ddx as well as grepping over
Mesa doesn't show any users of the getfb2 ioctl(), so the need for this
format info assignment seems to be more the exception than the rule?

Fixes: 816853f9dc40 ("drm/amd/display: Set new format info for converted metadata.")
Cc: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
Cc: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Mario Kleiner <mario.kleiner.de@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
index f764803c53a4..cb414b3d327a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
@@ -828,7 +828,8 @@ static int convert_tiling_flags_to_modifier(struct amdgpu_framebuffer *afb)
 			if (!format_info)
 				return -EINVAL;
 
-			afb->base.format = format_info;
+			if (afb->base.comm[0] != 'X')
+				afb->base.format = format_info;
 		}
 	}
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
