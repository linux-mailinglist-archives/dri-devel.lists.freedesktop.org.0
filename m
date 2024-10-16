Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 531DC9A050C
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2024 11:08:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36AAB10E035;
	Wed, 16 Oct 2024 09:08:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="I3poZyBM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F60510E035;
 Wed, 16 Oct 2024 09:08:16 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-37d4ac91d97so5393916f8f.2; 
 Wed, 16 Oct 2024 02:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729069694; x=1729674494; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pCckWqcba+fa3Shgw28lw4/flbtKS6dT3/BQMij0a0E=;
 b=I3poZyBM7kWnNaDRUrhO/0WrbsqAzywSUlzou7d6kqGyqcKkYaZCqXZDhQi/tiBT6O
 T/2yTajn9OTHwA6okizilPJDdQCt+EUnoAXaPYUWobPqQchSZZPWtZVh+E9bo0wL1URv
 DLl51oHdMV3lJOBO2p6b9PzF9x2JtV3Rq6a+aOUae57TXycICs3J3O1e2g4TElks19ej
 t0nMc/rHrksZyl92tFo1me/b2T4FP6klIvT8tJ81N9Trs47GtgICrsk3dvoLZmpDgKDN
 6krbW4zkhAuhXJFBoB2W6G6zX7NKreO2cjzUZHsCRmPuc9EUOlmidtVaItBNg7TKv+Qb
 Dp+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729069694; x=1729674494;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pCckWqcba+fa3Shgw28lw4/flbtKS6dT3/BQMij0a0E=;
 b=C2pQqf5mU6DqvUy8Lahuje2G99E03PNItTNCLgz0otWGrV287Hyzj61R021fzGd2+h
 G8llQfbT8kSp04Q6GL84fgoyskOvOgAgoLLRHezRXSex3il7DeGayqQjaBlRbZvK7Gux
 Phvt4xqwhUqWd9B48Ihq7+tuoKqGEpRdObpWwKm2Ro7dOW1iLxJqrjwE7jfpwZDVkfti
 S5gLGhecYT7hJRcGr3gz4m8czqR63dfgB2+gmzIotpicDi37ZmgVxsaeudLiHSbrxkFn
 jgr+j3auhCfaGa4ULl+zzOGhGk7SWxKeEHpMvombOXXwlymq95v9jznPmf5xFSVCSCxs
 Xoig==
X-Forwarded-Encrypted: i=1;
 AJvYcCWDTyGCrOjBMVTS8KZG7nmM9HdGK58dNC5E0C8HPr5E7MJ77PoxGFY0rLF2AOFesq2UWJK9nN0v@lists.freedesktop.org,
 AJvYcCWmPFP07CKrrQz+/tt40IE/H5gFipA7cMbbEDX+CrK1OVh7ZSd+ETPWglRarmjA/s2Qv/ZSvuBJKb9L@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzAhaaAeT7mhJAOwnziX3Nt9EOIwGgeMSfzD9IB/q+QVHLsvUw8
 7NsSZjBYJzHy2WVth6LPod+FAJEHh24PlO1douCy7CuQ/ApRg2dq
X-Google-Smtp-Source: AGHT+IEuoW36ECs0G3BohpHYmIuQ52zx189xfDZHUYwD27qVnNtffHsYOR71klxFyQQ5Hjzch7ywDQ==
X-Received: by 2002:adf:9bd2:0:b0:37d:51b7:5e08 with SMTP id
 ffacd0b85a97d-37d5ff5a4cemr13000270f8f.18.1729069694199; 
 Wed, 16 Oct 2024 02:08:14 -0700 (PDT)
Received: from localhost ([194.120.133.34]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37d7fa7a04asm3780781f8f.8.2024.10.16.02.08.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Oct 2024 02:08:13 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] drm/amd/display: Fix spelling mistake "tunndeling" ->
 "tunneling"
Date: Wed, 16 Oct 2024 10:08:12 +0100
Message-Id: <20241016090812.280238-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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

There is a spelling mistake in a dm_error message. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 .../gpu/drm/amd/display/dc/link/protocols/link_dp_capability.c  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capability.c b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capability.c
index 518e5d1f3d90..e05b8fddf2af 100644
--- a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capability.c
+++ b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capability.c
@@ -1637,7 +1637,7 @@ static bool retrieve_link_cap(struct dc_link *link)
 	/* Read DP tunneling information. */
 	status = dpcd_get_tunneling_device_data(link);
 	if (status != DC_OK)
-		dm_error("%s: Read tunndeling device data failed.\n", __func__);
+		dm_error("%s: Read tunneling device data failed.\n", __func__);
 
 	dpcd_set_source_specific_data(link);
 	/* Sink may need to configure internals based on vendor, so allow some
-- 
2.39.5

