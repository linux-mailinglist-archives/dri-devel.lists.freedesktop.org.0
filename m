Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B76C24FCC87
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 04:38:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8332B10E668;
	Tue, 12 Apr 2022 02:38:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com
 [IPv6:2001:4860:4864:20::33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C42C10E668
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 02:38:33 +0000 (UTC)
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-e2a00f2cc8so9997721fac.4
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Apr 2022 19:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bsj0qNf1cqMOve8zTWuJ9drSqXyGdLK4Rj/oCK1m/Vw=;
 b=XgOzj0UeLzDuVIHBr4rcreeBNCwlWGmgYsjRFbX4BFVJevtNwnkJNh1j0zC+/uCDwS
 NLH8fVwppFIpzyPYQYlv7EGsEJXDiQAjj02zu/LPpAgv+cUKNLpQpEodJpSR35MQvnOL
 vG/YOFXZnWse/RhQIM5+xlgkGzRwKjNcvKSLT9cAzUcRBSvGsC8lH1HpRdG0MGFFxMJR
 9s5lqMbmfo+jfWpsksadb0qyE20SvBA6TBBRrHksRfdxSeNxgyXe5mJmItVby9ZWDsp2
 pabGIvhlsHAnQPG4GXtkiLi6zBmHobjjwQbXwT3TEjkFAHf4vZ8GKJDpLj4IyCOAhbae
 Ul6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bsj0qNf1cqMOve8zTWuJ9drSqXyGdLK4Rj/oCK1m/Vw=;
 b=uAPKoWuV8pK2GL7Dx/haUNe6L2TFf2TL0WJ4roVcL4wOY5ywLtXJtBUp5gPjO1ITH/
 M/Qn/Rm6Fq0onkp6Yk5ij8jEbI+W4jqGeZa8U6Ze0XL1CmExqgR7BFLn5H6/0mOdIkK+
 wa4sgNWtioD52tk7CxXlmsk+VI6n6vwnseb8yh3BDxFeTBrbmzzvG43DDWWBg6H3J1FK
 bzdNZd4Ueaetd8f3/PNVVY1eMUPtoBw2/W8sQrGmpOi+iLzo7pcbsEs9gu2D+VlkH0wd
 VsbyWXYO1De8AGQJdKATGNZmKVXlIiVclG3aJ2W9WpfLemdWN8hrXudWOMbTQYJj10Mx
 D6Fg==
X-Gm-Message-State: AOAM533J79XKjtz276jCQ0jHgrVqvSgUdn9an+EJhkPqNKmOqsDPjbl8
 nNVfvh82ENV30IjKPsJdGG0=
X-Google-Smtp-Source: ABdhPJwn/eT7Uj7b2LPhT6qe+2cTBrkNzNfeW2ilc6QDKRQT9NdJmPl9aVBmcnoAGFAqimrtB/qAVw==
X-Received: by 2002:a05:6870:a1a0:b0:dd:e471:8baf with SMTP id
 a32-20020a056870a1a000b000dde4718bafmr1148349oaf.40.1649731112320; 
 Mon, 11 Apr 2022 19:38:32 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:4c2:8a9b::1002])
 by smtp.gmail.com with ESMTPSA id
 p14-20020a9d744e000000b005b235f5cf92sm12995256otk.65.2022.04.11.19.38.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Apr 2022 19:38:32 -0700 (PDT)
From: Tales Lelo da Aparecida <tales.aparecida@gmail.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, andrealmeid@riseup.net
Subject: [PATCH 1/1] drm/vkms: check plane_composer->map[0] before using it
Date: Mon, 11 Apr 2022 20:38:01 -0300
Message-Id: <20220411233801.36297-2-tales.aparecida@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220411233801.36297-1-tales.aparecida@gmail.com>
References: <20220411233801.36297-1-tales.aparecida@gmail.com>
MIME-Version: 1.0
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
Cc: Tales Lelo da Aparecida <tales.aparecida@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix a copypasta error, which resulted in checking repeatedly if the
primary_composer->map[0] was null, instead of checking each
plane_composer while composing planes.

Signed-off-by: Tales Lelo da Aparecida <tales.aparecida@gmail.com>
---
 drivers/gpu/drm/vkms/vkms_composer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index c6a1036bf2ea..b47ac170108c 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -157,7 +157,7 @@ static void compose_plane(struct vkms_composer *primary_composer,
 	void *vaddr;
 	void (*pixel_blend)(const u8 *p_src, u8 *p_dst);
 
-	if (WARN_ON(iosys_map_is_null(&primary_composer->map[0])))
+	if (WARN_ON(iosys_map_is_null(&plane_composer->map[0])))
 		return;
 
 	vaddr = plane_composer->map[0].vaddr;
-- 
2.35.1

