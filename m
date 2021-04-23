Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3026369AC0
	for <lists+dri-devel@lfdr.de>; Fri, 23 Apr 2021 21:12:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C5426EC4C;
	Fri, 23 Apr 2021 19:12:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com
 [IPv6:2607:f8b0:4864:20::729])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 949A66E15D
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Apr 2021 19:12:20 +0000 (UTC)
Received: by mail-qk1-x729.google.com with SMTP id v7so22608322qkj.13
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Apr 2021 12:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=H896F4PjwDY8jmfWwaLDr4shp26B+KmxkyhAPtoMs4M=;
 b=pRma3lac0c5ClpyVGp+FlxDrBykek+53y2UaGikk8p9eHwfH7nW4VE/v7DHQV32oeZ
 5G9WhJZyojjSE6DFn0ndsv4QXv9e1QHpZg07YBRQ/JPMA+MNwFKGdwDu6VXN6kdmcxZo
 1nByFst29E593MUK+C0aJPfnNnZ6ITjj7qF32THxkIdgfRugqs2kBTpMTXIv2+p/1eSH
 LnjKtF3RenT8LbipYN3UZqka5GF9siPGVro+5MTLey4gXPqR3y4gMSfV5V1ftQUwMkhK
 AfJUaiGZIjlyNn3ErcmbmmVME5EYXwOyjigc6yKMlspVMy4AfHPS0ZJY1J+tDLhUa0Sk
 NiOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=H896F4PjwDY8jmfWwaLDr4shp26B+KmxkyhAPtoMs4M=;
 b=VUHoAYhLKLVyeBzrezWPyeuCRqsbPEJGP3AIM+HXdYW7oyDzmg0Ux2SdHR0xlytvft
 4qsX4SPMFms/ZL2JzNd4qEaQ2ETRWA6F9iE/73k+Lbz+AICrxwxRkyfTNKbMJsYSiJn5
 ugk7sh0S1dtTl1AZuXZSPWSh1QkJ3Z6xbQAFCja/Ljso+v8ARV/JkjZV9bn/045/yKRC
 RdBNUoXt6t2GS7BWmeSdb4J6EqVFPi//gNWnZMUWwag5oPGqjCMozoy+BWMQfWF4P9Ff
 MFqBwHsaxg9F9RkBUhKPHws7pn6vt7EXKdcfXBWqprF1V190SjDZiTboO4gDa2zNlpNk
 zzJQ==
X-Gm-Message-State: AOAM530zytgA5ZAXG5kfqvuF3RThzQUkuoK5zi8F6MoR/G7hjde+F7hH
 WQvaC4HSkYMe1OXLeikyOUidAQ==
X-Google-Smtp-Source: ABdhPJxtl7HyuuifiNlkFxXYO7ncQRrKu5Xh1IELP5GvMv+x2eQ8MKIDTBx5pc6kfeilwBtBpV4L+Q==
X-Received: by 2002:a37:a90a:: with SMTP id s10mr5507081qke.63.1619205139696; 
 Fri, 23 Apr 2021 12:12:19 -0700 (PDT)
Received: from localhost.localdomain
 (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
 by smtp.gmail.com with ESMTPSA id a22sm4834630qtp.80.2021.04.23.12.12.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Apr 2021 12:12:19 -0700 (PDT)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org
Subject: [PATCH 5/5] drm/msm: deprecate MSM_BO_UNCACHED (map as writecombine
 instead)
Date: Fri, 23 Apr 2021 15:08:21 -0400
Message-Id: <20210423190833.25319-6-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20210423190833.25319-1-jonathan@marek.ca>
References: <20210423190833.25319-1-jonathan@marek.ca>
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
Cc: David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There shouldn't be any reason to ever use uncached over writecombine,
so just use writecombine for MSM_BO_UNCACHED.

Note: userspace never used MSM_BO_UNCACHED anyway

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/gpu/drm/msm/msm_gem.c | 4 +---
 include/uapi/drm/msm_drm.h    | 2 +-
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 2e92e80009c8..56bca9178253 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -201,10 +201,8 @@ void msm_gem_put_pages(struct drm_gem_object *obj)
 
 static pgprot_t msm_gem_pgprot(struct msm_gem_object *msm_obj, pgprot_t prot)
 {
-	if (msm_obj->flags & MSM_BO_WC)
+	if (msm_obj->flags & (MSM_BO_WC|MSM_BO_UNCACHED))
 		return pgprot_writecombine(prot);
-	if (msm_obj->flags & MSM_BO_UNCACHED)
-		return pgprot_noncached(prot);
 	return prot;
 }
 
diff --git a/include/uapi/drm/msm_drm.h b/include/uapi/drm/msm_drm.h
index a92d90a6d96f..f075851021c3 100644
--- a/include/uapi/drm/msm_drm.h
+++ b/include/uapi/drm/msm_drm.h
@@ -94,7 +94,7 @@ struct drm_msm_param {
 /* cache modes */
 #define MSM_BO_CACHED        0x00010000
 #define MSM_BO_WC            0x00020000
-#define MSM_BO_UNCACHED      0x00040000
+#define MSM_BO_UNCACHED      0x00040000 /* deprecated, use MSM_BO_WC */
 #define MSM_BO_CACHED_COHERENT 0x080000
 
 #define MSM_BO_FLAGS         (MSM_BO_SCANOUT | \
-- 
2.26.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
