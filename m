Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D707CE3DD
	for <lists+dri-devel@lfdr.de>; Wed, 18 Oct 2023 19:07:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAB5110E439;
	Wed, 18 Oct 2023 17:06:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 568EB10E43F;
 Wed, 18 Oct 2023 17:06:39 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id
 ca18e2360f4ac-7a66bbb6c1dso41075039f.0; 
 Wed, 18 Oct 2023 10:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697648798; x=1698253598; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3SAgGhvFgEq3ojom6jJPWJ2MyF/faZd9tWGs5HOFcQQ=;
 b=YGHWIge1iXM5CfXM3U2Da2n2BUsjBp1tEfIwTUffD79RAuHPIiGHDKVDIQnLVk2rDg
 WbfbxRn5zmkllEk9GcHx+3fs1mxvw12w8x0zIwZ4eMqgWBDPbOjJhIkAUknxahhTDvSZ
 AiruVd1IWrOgCNnWgUdWYo6jusxMqHSn9KZE/xYJJCqVG7OE98KmiGxECRxnXWC4Zam1
 8UpJ9LjtN5flGOq+aA5zfizVjM0a1h8N/Chh77XgiMt6wPgzC3the48bu4ow9OAvB0fq
 b+qJgPiypJjEgkKnmcJZg0sg+fX+MzQhoxSalldEkDYp4d8Ekqzg0V+22NWv7LQMh5jm
 AG/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697648798; x=1698253598;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3SAgGhvFgEq3ojom6jJPWJ2MyF/faZd9tWGs5HOFcQQ=;
 b=ZejJlfW6YndSwlkeEEkRFJQm2+DbGfrXoSkofB4H3sdmkPL8vIk6DFAf4lxLofvv/P
 7AEJKqdPcBQqzesaTVKqRoI4+zL0X5gtkPtCpmA+F3QsG40tB1W3Dp0T/jVlH+p54NwV
 Uj1QhbdtWJ7zyvc2F8JjEKlTTXwFT1QxNVacTFY0MAP5If8/lQpOBe2MU73r03V9xEQ1
 gIPe9E1Ka50sOcOLdo2ajeXSFxIDBtSbkYj0wExeLei7DzwlMxLLqustFPG+qp5AAExl
 6n53Ez8T3HSJFitggvyIFVxvcxn9QyAx3zOmEihu9ba1goIOOeGMBQ/iuUWb0G7+lUMp
 ikYQ==
X-Gm-Message-State: AOJu0YwLlluRQvS/auIV0Rp3HOi5Zsg7SY5pqw1GcFMqc9eWqMWjn/6L
 aw+1isC6WeebbnrUiDhdriM=
X-Google-Smtp-Source: AGHT+IFTSza/HJPQYSXt9aC+Z3bMnTeu2Q7duokDt8Cb04HcVXXahtQEMWsjZYgH+ocYvA0wZN+VWA==
X-Received: by 2002:a05:6602:2f09:b0:79f:97b6:76de with SMTP id
 q9-20020a0566022f0900b0079f97b676demr6696853iow.3.1697648798580; 
 Wed, 18 Oct 2023 10:06:38 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 n4-20020a5d8244000000b0079fa1a7cd36sm1228944ioo.30.2023.10.18.10.06.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Oct 2023 10:06:38 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v7c 24/24] drm: restore CONFIG_DRM_USE_DYNAMIC_DEBUG un-BROKEN
Date: Wed, 18 Oct 2023 11:06:04 -0600
Message-ID: <20231018170604.569042-25-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231018170604.569042-1-jim.cromie@gmail.com>
References: <20231018170604.569042-1-jim.cromie@gmail.com>
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
Cc: lb@semihalf.com, groeck@google.com, linux-doc@vger.kernel.org,
 jani.nikula@intel.com, daniel.vetter@ffwll.ch, linux@rasmusvillemoes.dk,
 rostedt@goodmis.org, mcgrof@kernel.org, seanpaul@chromium.org, joe@perches.com,
 bleung@google.com, yanivt@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Lots of burn-in testing needed before signing, upstreaming.

NOTE: I set default Y to maximize testing by default.
Is there a better way to do this ?

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/Kconfig | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 3caa020391c7..708f5e8cb205 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -55,8 +55,7 @@ config DRM_DEBUG_MM
 
 config DRM_USE_DYNAMIC_DEBUG
 	bool "use dynamic debug to implement drm.debug"
-	default n
-	depends on BROKEN
+	default y
 	depends on DRM
 	depends on DYNAMIC_DEBUG || DYNAMIC_DEBUG_CORE
 	depends on JUMP_LABEL
-- 
2.41.0

