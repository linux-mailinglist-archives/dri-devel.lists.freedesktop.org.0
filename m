Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A4234AA70
	for <lists+dri-devel@lfdr.de>; Fri, 26 Mar 2021 15:51:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F8586F408;
	Fri, 26 Mar 2021 14:51:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 444826F405
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Mar 2021 14:51:26 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id p19so3142967wmq.1
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Mar 2021 07:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1jY8mwnQnAeWLndXGjoVPFOh3LwZ9LMn1afxTK8ioYU=;
 b=cYq7anr9I5TabG+pA/dIDgs1ukMI/RJ5lyFqfgAVps2FCdtEjfXm1GStbQpi2qXjZS
 ySsNNfwQApaE20yjFGrODOhPG5agByHc+eadWqk55iEZNZ5wh6XJ7JXXLuI6xEMzortj
 pcL/O+JETN9SYJgQEbFVXB4K/C2RD0THr8R6PrhRdvLC8X9nZochrfTc3mCZxoXbc4hh
 mr9ABiBh66SO58+xocwUbq00OB1hPqf5fS6FOYwRjFWdC+TkZRNIDdb5sC9+Buv7byF7
 al3ZanAVPb/V6B6jdB+U7FyyNrQqFuJwnc2xTQSwtoIJviE8Y1JeB2u7wIqVunNRVfzk
 QyqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1jY8mwnQnAeWLndXGjoVPFOh3LwZ9LMn1afxTK8ioYU=;
 b=XlLbQhbAcoclb4q70TFlrFoKHB4qJwv3Bej3dlhFd8mZkqPyUEfpD9dgF2dpmVCojc
 N1jA4J6Qrc7B/oopdkgAiSkzPYQQ1v2eZ1SaedbmNrmFXduFASloLVUqwzQgVsvfjXLf
 7Vgr4iuE580qWVbH3sb/sRTA462nbitHX5DU5DU86yA5+AiyuvbLA4W1IyIYMWEKrhUc
 JJsOrH+/gfhj/XD02RAaf7uEj2qCZgXQKv9xZmtDF8+76k9Jkr5HHt4TOqbizXX0W/h4
 6z7SXqj5S8L977FtI8DDcNcBfQy+qh54pIA6G0peRu1KD0a1KaZXVl2VEbWXsUpv0WRx
 KhSA==
X-Gm-Message-State: AOAM533Xo9h3nmCX8iV/1og0yZ8zAaHxoX7SjA4GDYTO8LPUBbe1xd5W
 9WBQnRWtgdaEn1pP1CQ5TsI=
X-Google-Smtp-Source: ABdhPJwLGnx999mXR/dfcnAYVGLYaE5B2HwvvEGVFtaZgHK51cReNLWGwGqZh/E9awvbrmVp/RyPdQ==
X-Received: by 2002:a05:600c:290b:: with SMTP id
 i11mr13888176wmd.129.1616770284982; 
 Fri, 26 Mar 2021 07:51:24 -0700 (PDT)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id m11sm13001228wrz.40.2021.03.26.07.51.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Mar 2021 07:51:24 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v2 01/10] drm/fourcc: Add macros to determine the modifier
 vendor
Date: Fri, 26 Mar 2021 15:51:30 +0100
Message-Id: <20210326145139.467072-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210326145139.467072-1-thierry.reding@gmail.com>
References: <20210326145139.467072-1-thierry.reding@gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, James Jones <jajones@nvidia.com>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-tegra@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thierry Reding <treding@nvidia.com>

When working with framebuffer modifiers, it can be useful to extract the
vendor identifier or check a modifier against a given vendor identifier.
Add one macro that extracts the vendor identifier and a helper to check
a modifier against a given vendor identifier.

v2: add macro to extract vendor ID from modifier (Simon)

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 include/uapi/drm/drm_fourcc.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index f76de49c768f..64f01bc2624c 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -366,6 +366,12 @@ extern "C" {
 
 #define DRM_FORMAT_RESERVED	      ((1ULL << 56) - 1)
 
+#define fourcc_mod_get_vendor(modifier) \
+	(((modifier) >> 56) & 0xff)
+
+#define fourcc_mod_is_vendor(modifier, vendor) \
+	(fourcc_mod_get_vendor(modifier) == DRM_FORMAT_MOD_VENDOR_## vendor)
+
 #define fourcc_mod_code(vendor, val) \
 	((((__u64)DRM_FORMAT_MOD_VENDOR_## vendor) << 56) | ((val) & 0x00ffffffffffffffULL))
 
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
