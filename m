Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC870A1C1AF
	for <lists+dri-devel@lfdr.de>; Sat, 25 Jan 2025 07:47:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A856F10EA9E;
	Sat, 25 Jan 2025 06:47:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OqlAps6E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com
 [209.85.166.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0B9410EA9C;
 Sat, 25 Jan 2025 06:47:44 +0000 (UTC)
Received: by mail-io1-f47.google.com with SMTP id
 ca18e2360f4ac-844e1eb50e2so75459439f.0; 
 Fri, 24 Jan 2025 22:47:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737787664; x=1738392464; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fouGDaKOIh0ynQt2BoYSXSSrIxHSbFED02bH/Ai9Jxw=;
 b=OqlAps6ED1shoaz1WnIfFBQtYrAymUnKAm5cTcYC5wBCobMV0d65hKGy1ErTFPkGCd
 gpaoGApUHwCUnD0yOx3fLuqvIu+5k1aro6YlzJNHKsb69XcYYd0Aj08dK64Wo3/MIaPu
 591AKZxVyFwTTID2uJmHULR1ey5u4x1J/yBg0rXvM5z0SXnJWHu9r69fKBk1CK30cc3m
 RvkK7x78ber95NFSVSwXGrutOpuc2Vh2Z44GR/ZzIDW89eUCow+/ZI/1Cq/WgiqVunaD
 z7m2Hc/nLBZWIxEGTkLDAoAj6r1J5wtvYSRz8P17a48jNc1IoSDNCNEPISA9l0UUqu/C
 yuKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737787664; x=1738392464;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fouGDaKOIh0ynQt2BoYSXSSrIxHSbFED02bH/Ai9Jxw=;
 b=lDUFZlGCEkAm2xKRUE0Y0PFFqmmPEtwAJ81LJcWMzrkr3gom2XljbEunF1eluec/G4
 GyGEl/qzeber1hMKOaz2bkOVwOg9KMBfAZfuHxMbf8Cu5QtPvzDv2rygC4xQaBaM14Ft
 cgphiuFNv2Um0uKxm+VoaqtetwaHdt5WMgnIPLQ+j993cs+5STb3JxHlKA4sXDAW6umz
 gpNQece62dwpZPvwVVeUC2FaPmhXckvuVSeTvOGa42Z5vrQsobmapgsHK6CUs/EYLAzP
 7c8QO92jQ90PkwCG2GnLaNR581Vtn24Zx75qUGeyezgHlPSKQVgMgwFPs1GOa39cQZJv
 4hlQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV3C2DnrMuy6XQ6HBTLKV9FN1nGzXA70m6wEaiJ7I24MBa+u7vqS2m4k+twxodefFR3gAd2KxJ7fPVp@lists.freedesktop.org,
 AJvYcCVltPrSglES/YZvuGa8EbsEqvCk8auJzI+2VE4KaOdAsdxJOLMkws4UoXZNU6VLg/k8+tSTK6Zu@lists.freedesktop.org,
 AJvYcCX/pYAHjigEID1sfBqGL3Fom+/n1GiS9XTJ2zuh5YGUMQAtE+jNCTuazwhTyoL6aWiUjzeeDCw+z/pl@lists.freedesktop.org,
 AJvYcCX7v6K1+kljGX1Gnx+Bnhw0chPh3550KlEoUnBzymsLGfS953WRHAZ7u4H3I3cny4HkS6LR11rL2Pffk3LDxg==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw5cqZ1DpKWU/8NHUuP26gseakDoYETMuaYVfSPk50s2tgkuaT6
 qGljTRzfJSzTOM1Cb5nwR/6yldYSc3dblSo4wyqMeZT4i571Xw9a
X-Gm-Gg: ASbGncuAKKToDzqQETuaq8Jsq4HcNm/DQ9D0zCFaoQHkvrhuyWUb7IaFqsuPjAdvWsu
 NMc/EIV9X/7fYzAPw0Mw6TrLVT4jt5xTHYBLXODM09JvzNGeEps25NY1+kY9qw4V+xt7zPKHjxR
 OFYW2ZMNAsLkfEUBdet7QdZDU3Jg6xhxqg/V0yBAXlOIXF6qo9qhPPVja6DI4crduY3F8JyBZXH
 YyHyKaHfkCTTQtDEuByA/KQOHpBt4TunL/t2XthaPvDd1VmIedpIzSjytr37due2OA6uhBodPwN
 yz1HenXLrQhzT6ll6bnDq3SPqRGaFaJlDTnBng==
X-Google-Smtp-Source: AGHT+IHe/VBH/Ym8KO8omBNYUPHpPaX/1NrJiiHCIRpffb4uvJC3io6oEswUJV0nSwe5qmSt+gVTSg==
X-Received: by 2002:a05:6602:6d1a:b0:83e:5860:5189 with SMTP id
 ca18e2360f4ac-851b6284084mr2527651839f.10.1737787664021; 
 Fri, 24 Jan 2025 22:47:44 -0800 (PST)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-4ec1da476fesm1174144173.58.2025.01.24.22.47.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 22:47:43 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org
Cc: intel-gfx-trybot@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH 63/63] drm: restore CONFIG_DRM_USE_DYNAMIC_DEBUG un-BROKEN
Date: Fri, 24 Jan 2025 23:46:17 -0700
Message-ID: <20250125064619.8305-64-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250125064619.8305-1-jim.cromie@gmail.com>
References: <20250125064619.8305-1-jim.cromie@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Time for some thorough CI.

Also, the previous 18 patches could perhaps be replaced by a single
invocation of DYNDBG_CLASSMAP_USE, from a C-file linked into all drm
drivers & helpers.  I didn't find such a file, nor a drm-client
linkage item in the Makefile.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/Kconfig | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 772fc7625639..dde5a5e37680 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -53,8 +53,7 @@ config DRM_DEBUG_MM
 
 config DRM_USE_DYNAMIC_DEBUG
 	bool "use dynamic debug to implement drm.debug"
-	default n
-	depends on BROKEN
+	default y
 	depends on DRM
 	depends on DYNAMIC_DEBUG || DYNAMIC_DEBUG_CORE
 	depends on JUMP_LABEL
-- 
2.48.1

