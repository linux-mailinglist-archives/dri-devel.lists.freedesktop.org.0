Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF2E079437C
	for <lists+dri-devel@lfdr.de>; Wed,  6 Sep 2023 21:03:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2109C10E71A;
	Wed,  6 Sep 2023 19:02:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67E1310E70E;
 Wed,  6 Sep 2023 19:02:36 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id
 ca18e2360f4ac-794cd987ea6so4443539f.2; 
 Wed, 06 Sep 2023 12:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694026955; x=1694631755; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=usLeqXzE5U9X3mWlGIhl2wkCPYgPL1jt55C0ImyryHk=;
 b=npZ3pZivWvRqUaXwwfgbiguPH8fIFg/ymvUutQrUntSfmh/E29WtFKknD9snKamVwN
 Okc/tkNL3PRzrkzp746RGHAcMyHeJ+8Y4F3u/t9moLokgDmVrT4ydrNxu0DmbIUFMnw5
 j5ceMAYRhfBZxpniBBxheQaXfDXOAM5FS7matSrvmj1y6sRL6nj69oRHm7FDq4VHFpyk
 wVPiBDa8LuUDgxWJLmYouZ+ut7fTZOoc5SjVJnghuDf+FH1R9RhnyWDiFwsrHKcrq7AF
 fvoLus6My1popPUKgRoZ26Pvi6xILs99qtTOic3DTCMMO4NzUVhpNRKqU4QnUYBJ2c8a
 KzKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1694026955; x=1694631755;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=usLeqXzE5U9X3mWlGIhl2wkCPYgPL1jt55C0ImyryHk=;
 b=Sk97UZyd8Y1bFPBuoqqv1xCI2maLXSph0qsR7eeoXcJqdtWX4k5IrqjJpWfdlV/q8n
 xlCmDqs5HSK1JFroGsTkYGes2hqdlelZNQLohI/V60h7f8TudSlrt145gcBCEUWxV/Qg
 yKxnZgwZ73pcI57Nzs1ZYrp3nNf+vABdNcr9kHW8+7HZU9vYCKuIR91PGjsEfyom+ETL
 cAWxSJKpn6nQh0enHARycqduTXucxVSz6oowS3eqmgFQPf0K4D+shGadSE1m3KF3mP/b
 hHI8rXWHdSwej2/Th0c+OhlBRKq+I8Y2YCpb3hFe9PJ+vqlS+17OFVEgDuVjDU4PsLXL
 N+1w==
X-Gm-Message-State: AOJu0YwTHTGkBWgWgMTYPnSt7o3G3jIjhfCcUFCppQspKqNfc7zDqRmX
 j3xwYprtviRkpMDGMhsnUPY=
X-Google-Smtp-Source: AGHT+IFTPVrAnUWjjhREw0Hvr2AR0rY8UkvdcnI2CamAN17ipmhg22bz+NrpSLLjzXAWDFV8FZHQ6Q==
X-Received: by 2002:a6b:dd0b:0:b0:791:16ba:d764 with SMTP id
 f11-20020a6bdd0b000000b0079116bad764mr18373492ioc.16.1694026955566; 
 Wed, 06 Sep 2023 12:02:35 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 w11-20020a5d844b000000b0076ffebfc9fasm5152306ior.47.2023.09.06.12.02.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Sep 2023 12:02:35 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 5/5] drm/Makefile: use correct ccflags-y syntax
Date: Wed,  6 Sep 2023 13:02:23 -0600
Message-ID: <20230906190224.583577-6-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230906190224.583577-1-jim.cromie@gmail.com>
References: <20230906190224.583577-1-jim.cromie@gmail.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, jani.nikula@intel.com,
 daniel.vetter@ffwll.ch, Maxime Ripard <mripard@kernel.org>,
 seanpaul@chromium.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Incorrect CFLAGS- usage failed to add -DDYNAMIC_DEBUG_MODULE when needed,
which broke builds with:

CONFIG_DRM_USE_DYNAMIC_DEBUG=Y
CONFIG_DYNAMIC_DEBUG_CORE=Y
CONFIG_DYNAMIC_DEBUG=N

Also add subdir-ccflags so that all drivers pick up the addition.

Fixes: 84ec67288c10 ("drm_print: wrap drm_*_dbg in dyndbg descriptor factory macro")
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 7a09a89b493b..013cde886326 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -3,7 +3,8 @@
 # Makefile for the drm device driver.  This driver provides support for the
 # Direct Rendering Infrastructure (DRI) in XFree86 4.1.0 and higher.
 
-CFLAGS-$(CONFIG_DRM_USE_DYNAMIC_DEBUG)	+= -DDYNAMIC_DEBUG_MODULE
+ccflags-$(CONFIG_DRM_USE_DYNAMIC_DEBUG)		+= -DDYNAMIC_DEBUG_MODULE
+subdir-ccflags-$(CONFIG_DRM_USE_DYNAMIC_DEBUG)	+= -DDYNAMIC_DEBUG_MODULE
 
 drm-y := \
 	drm_aperture.o \
-- 
2.41.0

