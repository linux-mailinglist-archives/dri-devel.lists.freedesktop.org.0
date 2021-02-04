Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DBE4310059
	for <lists+dri-devel@lfdr.de>; Thu,  4 Feb 2021 23:54:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A24D56EE8A;
	Thu,  4 Feb 2021 22:54:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 961656EE87;
 Thu,  4 Feb 2021 22:54:14 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id q20so3040398pfu.8;
 Thu, 04 Feb 2021 14:54:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mdTwxZRVmDjNbDvFpGlHxe4YobP1MixFfZCkGPsWCxs=;
 b=qCSC/wVatdr4qz/USj4a8Cm09DUro653to4ZGejSPTfuHxXsMrHxCpCtDgsbgoNr/1
 Ticsyi1hD+0BKN2I+9oXDvYMJ5zcjTeCNxuhh050tDGo0pjzwAqt3iqLyq8fecaAyC9G
 ajJZEjYBlywf0SoTCwmZasrQgz46PGLYOiXeVQhrKIUdg5MRmuz2+iB8xgPCMIIzKrQL
 NyLGgw+LptN0tSEWvy1mSY5m+EdfJXy4tcdcJ1VDz+fhtK+IfO4o9FDtRkjt9exsQjnU
 Vu08fGozzk5eMj+v9QII9BhCTy3V8Vqi4SzwFkBzBSiSRzkpg18s9NQ74qyK8+hIZ0Ji
 HxpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mdTwxZRVmDjNbDvFpGlHxe4YobP1MixFfZCkGPsWCxs=;
 b=BEEAy7p6ZQ9q3UG4nKutpnhzSRrpmH98ncZ4/ogp3CsZ8xaQh5b0AUaKMc6PZwey+X
 59idK6u9xBhqyiXcoV6EritkskwQQJISVTEeprj+m6ZBcQUcMl7iTbvDHH9fmZFlQZeT
 ulFp3zSdXoKtHue8F33AoCeYIVWMRZDYAAPQy3L9xR/ehZX3ENyae80xPImBr1TdOroz
 xXMwzMIdp1nHwCVtAiqrRZaz8sJpZIwNOU3Y+WYSy2QzdaL/qCcQsv6ieFPmnc8jKYKc
 LpdEVPbeaJzBVdu4ozjRT0r0FZXEiIH7hSavfqLTXWs5tsvaAyVlKE5WPUfw2Q1o9mOV
 crfA==
X-Gm-Message-State: AOAM533c6jvAAyb0EfKCmPaXBMQ2xbF4ZfxotTLpM4TFoW9i02OFXwgI
 crVx/kEeY8rN5iv25Gjvw8rEY/0p1/0Z4A==
X-Google-Smtp-Source: ABdhPJxvN4byxugjYm4+2KCdf2189pKaG5B0yxje7rgqJb8Kx9C6qDRtFqbmjRmwrty6MCrhIrxolQ==
X-Received: by 2002:a63:7051:: with SMTP id a17mr1248360pgn.26.1612479253528; 
 Thu, 04 Feb 2021 14:54:13 -0800 (PST)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 b65sm7277488pfg.3.2021.02.04.14.54.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Feb 2021 14:54:12 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/msm: Fix legacy relocs path
Date: Thu,  4 Feb 2021 14:56:49 -0800
Message-Id: <20210204225650.1284384-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "Kristian H. Kristensen" <hoegsberg@google.com>, Sean Paul <sean@poorly.run>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

In moving code around, we ended up using the same pointer to
copy_from_user() the relocs tables as we used for the cmd table
entry, which is clearly not right.  This went unnoticed because
modern mesa on non-ancent kernels does not actually use relocs.
But this broke ancient mesa on modern kernels.

Reported-by: Emil Velikov <emil.velikov@collabora.com>
Fixes: 20224d715a88 ("drm/msm/submit: Move copy_from_user ahead of locking bos")
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem_submit.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index d04c349d8112..5480852bdeda 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -198,6 +198,8 @@ static int submit_lookup_cmds(struct msm_gem_submit *submit,
 		submit->cmd[i].idx  = submit_cmd.submit_idx;
 		submit->cmd[i].nr_relocs = submit_cmd.nr_relocs;
 
+		userptr = u64_to_user_ptr(submit_cmd.relocs);
+
 		sz = array_size(submit_cmd.nr_relocs,
 				sizeof(struct drm_msm_gem_submit_reloc));
 		/* check for overflow: */
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
