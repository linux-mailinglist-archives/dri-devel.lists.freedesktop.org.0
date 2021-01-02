Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E72EF2E878B
	for <lists+dri-devel@lfdr.de>; Sat,  2 Jan 2021 15:02:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8238A89580;
	Sat,  2 Jan 2021 14:02:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69AC589580
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Jan 2021 14:02:17 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id q18so26507027wrn.1
 for <dri-devel@lists.freedesktop.org>; Sat, 02 Jan 2021 06:02:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=basnieuwenhuizen.nl; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=o7zKydJb0Dcw2Io6v+je4B87Ru1VW10/8CbqarypUlc=;
 b=ZMk7e3sBGmIkoz2Xsc36XN4Gp0GUKT3ZbdwVUvd4NHh5R/ImNgVCBkaN5TBJV9AKFO
 /W5BuNuMN7mCXAbHlXcEDdp91QIJhryd+pvjcsQEy7Lzues1An4W39KBpNU0Kyl7AZFi
 1WyKTGJN3Ol7gEPl55LQlMUUoaPq9WeTvG1rQAcSsrFSDED3aVwNquILafswg0W97g7Z
 OsHa/v8a5zNAo7av3WvzmXgXrIh9O0FTl9m9lYkEI3ptaGV4Hfxemul8EjJrg3rOxHze
 M+mRYcGvZWEb+N8ovwhaCuEvhLZsPliziyZA9YkC8JhNR/vTcXWwVaOJf/UtoSRdrM6q
 8LqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=o7zKydJb0Dcw2Io6v+je4B87Ru1VW10/8CbqarypUlc=;
 b=UbA838/yl+8y+VDERKEaTvi6NvmxCaJ2U4QVTpFLM/3M9m2B/hzgeuBHvZFXXvbXjA
 mbmkqmvlhC6r+2KXcKA9HI54JiD87juo9LQdrE80xzpoHcHXJB4Fr2N1y35VxNrQdz8A
 HQyD4XEeGfWz3mHkOhPtjdyUgO1EGiPlJxHnDpIwGYfewdzY0c7K9gr6nNh+aOegsFir
 1ZHwxe+5zf9YrhsJmB3LHBaFHuVSL9Di89NqP2C+yU0RkMFknh9ILesvZuK3Y+63p3/m
 XDYJtbu/RpIEGqtb29ouLjmSgsiv7fPrYzZxSqBpbRYk0hgEeFF0lo2K74RNHiRVmmZl
 H8aA==
X-Gm-Message-State: AOAM532Ibv+X1QPHk9TLoHLnU1blP6KqDYYmWfplkDz6GnFza/l0mF7o
 duOeoCdJN5A69aYPhrURx1DxggORp/ALqg==
X-Google-Smtp-Source: ABdhPJw0HQuTYaIfp0n4UcVwK7cHb10Oi6dDLM4N82ru4gYFeAJhwA07gykh7kCKcwShKilDJoUCUQ==
X-Received: by 2002:adf:f88d:: with SMTP id u13mr74567521wrp.161.1609596135709; 
 Sat, 02 Jan 2021 06:02:15 -0800 (PST)
Received: from bas-workstation.. ([2a02:aa12:a77f:2000:7285:c2ff:fe67:a82f])
 by smtp.gmail.com with ESMTPSA id e15sm80603402wrx.86.2021.01.02.06.02.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Jan 2021 06:02:14 -0800 (PST)
From: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm: Check actual format for legacy pageflip.
Date: Sat,  2 Jan 2021 15:02:35 +0100
Message-Id: <20210102140235.514039-1-bas@basnieuwenhuizen.nl>
X-Mailer: git-send-email 2.29.2
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
Cc: daniel.vetter@ffwll.ch, zhan.liu@amd.com, amd-gfx@lists.freedesktop.org,
 alexander.deucher@amd.com, nicholas.kazlauskas@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

With modifiers one can actually have different format_info structs
for the same format, which now matters for AMDGPU since we convert
implicit modifiers to explicit modifiers with multiple planes.

I checked other drivers and it doesn't look like they end up triggering
this case so I think this is safe to relax.

Signed-off-by: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
Fixes: 816853f9dc40 ("drm/amd/display: Set new format info for converted metadata.")
---
 drivers/gpu/drm/drm_plane.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
index e6231947f987..f5085990cfac 100644
--- a/drivers/gpu/drm/drm_plane.c
+++ b/drivers/gpu/drm/drm_plane.c
@@ -1163,7 +1163,7 @@ int drm_mode_page_flip_ioctl(struct drm_device *dev,
 	if (ret)
 		goto out;
 
-	if (old_fb->format != fb->format) {
+	if (old_fb->format->format != fb->format->format) {
 		DRM_DEBUG_KMS("Page flip is not allowed to change frame buffer format.\n");
 		ret = -EINVAL;
 		goto out;
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
