Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 087041D4A14
	for <lists+dri-devel@lfdr.de>; Fri, 15 May 2020 11:55:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F4976EC4F;
	Fri, 15 May 2020 09:54:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1E086EC42
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 09:54:28 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id g12so1955226wmh.3
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 02:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rs1sPOFZLvwe+OYscCrv3EkrjqZEk5qakgv4PiQKNeA=;
 b=mlPrrJ41b466Uwib6Z+KUNde0nauQ7RjKrsbxmN0Bb8ohnfFclxRK1HirnHimHwMZC
 GiWBfYgU8cNChk+UiIDXRMNZttDLaFQhoTJ9OAOTmq2cd4cz4i9hbeKRREPZbMun0exC
 ncrsUOrK61dZpUpakNMX/xxHHMvgjhRF0kHhT6t8LP8OdCye+NZqrUk8afmc2Os+h0sn
 kTMImXLF1VqdRRlDVsnafW6CcnCpRCljpzcqSkNR78lFOu/0U728iBMm94Z4tMO2hU2v
 nRamszXuTkH1tCxrRiA/Zmjhx5/Axn+5GUzUG7MKJUgl0z/WYx/n7jZVjsurCHbHh/Al
 037w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rs1sPOFZLvwe+OYscCrv3EkrjqZEk5qakgv4PiQKNeA=;
 b=GRSdeaVu78LMFTtMVcXQQvC5eWrAy+NIRHOPukdektpB40NKWez8JAXm1b6H9e8na4
 8qAFkl9trAv9nE1yNJNP2Rfw+AcPGz0DE8d1VSsyZ0115/M28i0A9WIg/GG6jGHXTZCf
 sXCUr4pESeNm5Jss+URRdCKQz+7VoelXn2vo3kNBXomX9+4WhT26GxdeSd0as+yl5glt
 MLV+iHhhd4rL9MyWf6SuA7n+BxyptJmR3ZSoWeHWO7VBU9kYq4mb5OM+Hx2Z+VddJ6BS
 P2A+teKMqowDFsuOtwqM0lZ9ayHLxvXv6zjzWKIaMEGRKNoRXxgRTb/QApIBipOcMZ/0
 eLdg==
X-Gm-Message-State: AOAM5315fnxGhIo2dTb/nwKAQ7RfyB+TorYyoMVqiIPeeo7uMl8/0aP1
 VVmkn29/TI2UOMX2za/M7MHsML0x
X-Google-Smtp-Source: ABdhPJzBDGfRE9v30bOml9LjRmG7nf3RUPOxA+BpeldE46gmLULLrk/a0ZVU4fFGhotqPZvd+/Eubw==
X-Received: by 2002:a7b:c3da:: with SMTP id t26mr2967429wmj.146.1589536466889; 
 Fri, 15 May 2020 02:54:26 -0700 (PDT)
Received: from localhost.localdomain
 (cpc91192-cmbg18-2-0-cust374.5-4.cable.virginm.net. [80.6.113.119])
 by smtp.gmail.com with ESMTPSA id s12sm2705817wmc.7.2020.05.15.02.54.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2020 02:54:26 -0700 (PDT)
From: Emil Velikov <emil.l.velikov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 22/38] drm/mediatek: remove _unlocked suffix in
 drm_object_put_unlocked
Date: Fri, 15 May 2020 10:51:02 +0100
Message-Id: <20200515095118.2743122-23-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200515095118.2743122-1-emil.l.velikov@gmail.com>
References: <20200515095118.2743122-1-emil.l.velikov@gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 emil.l.velikov@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Emil Velikov <emil.velikov@collabora.com>

Spelling out _unlocked for each and every driver is a annoying.
Especially if we consider how many drivers, do not know (or need to)
about the horror stories involving struct_mutex.

Just drop the suffix. It makes the API cleaner.

Done via the following script:

__from=drm_gem_object_put_unlocked
__to=drm_gem_object_put
for __file in $(git grep --name-only $__from); do
  sed -i  "s/$__from/$__to/g" $__file;
done

Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: David Airlie <airlied@linux.ie>
Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
Acked-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
---
 drivers/gpu/drm/mediatek/mtk_drm_gem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_gem.c b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
index b04a3c2b111e..fcb81f354224 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_gem.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
@@ -117,7 +117,7 @@ int mtk_drm_gem_dumb_create(struct drm_file *file_priv, struct drm_device *dev,
 		goto err_handle_create;
 
 	/* drop reference from allocate - handle holds it now. */
-	drm_gem_object_put_unlocked(&mtk_gem->base);
+	drm_gem_object_put(&mtk_gem->base);
 
 	return 0;
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
