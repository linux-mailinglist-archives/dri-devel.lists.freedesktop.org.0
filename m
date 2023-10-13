Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC14C7C9101
	for <lists+dri-devel@lfdr.de>; Sat, 14 Oct 2023 00:49:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2598010E64F;
	Fri, 13 Oct 2023 22:49:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com
 [IPv6:2607:f8b0:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 545F410E695;
 Fri, 13 Oct 2023 22:49:01 +0000 (UTC)
Received: by mail-il1-x12b.google.com with SMTP id
 e9e14a558f8ab-35748b32d73so10075755ab.0; 
 Fri, 13 Oct 2023 15:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697237340; x=1697842140; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3SAgGhvFgEq3ojom6jJPWJ2MyF/faZd9tWGs5HOFcQQ=;
 b=enHp9S8sE7p8ECxxp9vTBwkyEkf9e83bFjRq5n1rBINkpY1sD1tQDrBYMZeoeDq/tO
 eH7ScldmtEcu4axKIkM8OUO+NIEU+qfiqruVUf1Gm+sW9eDWnLd6eqcAQvAubXX9aMdN
 6dxHt149hWCcaayjZvNhlv9/zwrmde1dxrQ/uIFAarW3ThDKD0tzBt++DM1TDB09Slzd
 2njW21bDa7jggnzh6sEr7GgBwCHI8Ynev7KWkG3rxmvnk9DvLDS5ArjJuMwpVMNIBzR5
 u5VKwrxTgIUXe7nH0XzhFeBLAdHwnawEqbdYIgLzlGIsnrgkHrn1fC7eTH+9bBiGcPc7
 mSCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697237340; x=1697842140;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3SAgGhvFgEq3ojom6jJPWJ2MyF/faZd9tWGs5HOFcQQ=;
 b=OAi+kSFOdMnm4VyQCm40eAhyflCJtELOg2EjtgT6/wdc/3lzTF48Wlarlei8CAdlRN
 jwRs2/nGT4PA/9tlr1YYrHRlp2jP8cAKztjXGEgw65MrGCqR2vRK38ytocwyGIvuo/tC
 kC00S+rgqHpjJnepLF1UxdLUURULwx9QcsJuAmRpMCb0rclGABM/zR8SPD4IcrEwt0oW
 jA1aWfXP1ZJNGh1vtDMCcyHlCzaZfgz0lATKo1xLBrHpmEBogKk37Zd2kTPM4zpLuK2G
 N05mCw8A5TXKL6Zub29VGPSts4siVZMonHiM2Otwlb/qWFLg1ZaWHbzziBf8bMUdEfyM
 9wUg==
X-Gm-Message-State: AOJu0YxwjyXY4kcB6OCgUFUAbr+tcjT/k5MvvoErHIuipa66G+s5KmnI
 h9A1vKBy44Cfprp/RN1AZng=
X-Google-Smtp-Source: AGHT+IGabCzGZckH890sOFHM0bOgw3lVPHOXqyusXaXzxwFPYH0hLfKtQHAFmLNjwmQTHTLQKcZ52Q==
X-Received: by 2002:a05:6e02:164f:b0:351:57d5:51bb with SMTP id
 v15-20020a056e02164f00b0035157d551bbmr39248796ilu.16.1697237340380; 
 Fri, 13 Oct 2023 15:49:00 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 t10-20020a92dc0a000000b003512c3e8809sm1683071iln.71.2023.10.13.15.48.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Oct 2023 15:48:59 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v7b 25/25] drm: restore CONFIG_DRM_USE_DYNAMIC_DEBUG un-BROKEN
Date: Fri, 13 Oct 2023 16:48:17 -0600
Message-ID: <20231013224818.3456409-26-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231013224818.3456409-1-jim.cromie@gmail.com>
References: <20231013224818.3456409-1-jim.cromie@gmail.com>
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
 mcgrof@kernel.org, seanpaul@chromium.org, joe@perches.com, bleung@google.com,
 yanivt@google.com
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

