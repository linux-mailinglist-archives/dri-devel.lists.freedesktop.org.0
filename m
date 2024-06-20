Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BFBD91024A
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2024 13:14:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33D0010E057;
	Thu, 20 Jun 2024 11:14:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="JbGnMx6a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f99.google.com (mail-lf1-f99.google.com
 [209.85.167.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3856610E90C
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 11:14:08 +0000 (UTC)
Received: by mail-lf1-f99.google.com with SMTP id
 2adb3069b0e04-52c82101407so1239341e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 04:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1718882046; x=1719486846;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Pt/6vLN2gjnSD5krP08RARcHOcq8WSzGeAMpfloEqds=;
 b=JbGnMx6avaDxceakZmdXfd7rPRFBdoUbnQbeHYsFA244ZQyUIhfgFPFf0dzuA+J9T0
 zb//HHfg8wZgKPsnyoABGIbPnCBPoDGL56r0NDBpvfbxTgY6r7mGW9vpbUuen93Wl0J7
 /25U2JbHBteIzSbpF08UARduAzvDxdMZQvHc9ogoms6Rujaru1EPNLsPQB2SQ5fBxvks
 cnZxH1Y0hdwxGq3zYXKWOWpicqdZmGVNm2awAxSZUs4XfGYU1MCMnHhWgC2dtIHf/dVF
 Lkd9rENeX+BDMIUVTCcIWBaygx1jbtEyK2luJbqy6nhiFHqr9X4Fmv+ER4LH2OIFAAE8
 WzTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718882046; x=1719486846;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Pt/6vLN2gjnSD5krP08RARcHOcq8WSzGeAMpfloEqds=;
 b=PgigOvMjP8m/+hN70gYoOwse5U0jxwaj0DxDLSVUTvhComSvlFPUze/Jo5mlevRFI1
 r52/Dr9TfJIvphi8ihanfiFp4H5wQnPUMb8I1NFW47gNrNBgj0MDwwLZ1IaKUABVFyiB
 O+1Jpolxf+ABS5a07EKDFuKTdJEfGdliBcOr7ePaEADwoni3XC8A/Z/Q3tXBWgfyGBxe
 BvnE3YDAyRepPS7y/Fx+E93Vfe+iGS7egNOZFy+D++4t3fbW4IVLQqMXbwKNBLyyzDct
 8JV6WqhbevHVCQsfdX0WOHgw1vmwyYCk4F2Iq1A6e4DC2Rb6nunkfHZO9lrski4IDyoG
 MZXA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU9nVHa8fPW++W0pUNLmHOsRZmGY98LvOE/dkVQVBl8FlLrTXR6uhMIimzAh/wMObKJ5z1MJ3dt13D0s7Wma3CPrpfjChrl162ueMykIA+1
X-Gm-Message-State: AOJu0YwXy4w19KZ9sySXK/aKqpyrYHWxYMAgkAglNslJqA1M2qboy3AB
 m0DWxpNiPAdGlgp6d7iRHKrxXytw4O0EvbHsnYgKM1vncBwghEIuf0NsXX+QbvxZdFq4wYQFCmg
 pKY147gsZ14dUsRNWc7x0lhVT/Z0MaGtV
X-Google-Smtp-Source: AGHT+IGBDKMu+3jYe/JEen+E2J/hhyUsdX/O0nf2ezKkzA80Zhh2LUqxr/mTWdE1YFlA3ww3uYH0+6S/+XaL
X-Received: by 2002:a19:c216:0:b0:52c:76d:dbb4 with SMTP id
 2adb3069b0e04-52ccaa5250amr3870055e87.49.1718882046014; 
 Thu, 20 Jun 2024 04:14:06 -0700 (PDT)
Received: from raspberrypi.com ([188.39.149.98])
 by smtp-relay.gmail.com with ESMTPS id
 a640c23a62f3a-a6f56d782e8sm26470766b.13.2024.06.20.04.14.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jun 2024 04:14:05 -0700 (PDT)
X-Relaying-Domain: raspberrypi.com
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH 2/2] MAINTAINERS: drm : vc4: Drop Emma's tree
Date: Thu, 20 Jun 2024 12:14:01 +0100
Message-Id: <20240620111401.3629380-2-dave.stevenson@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240620111401.3629380-1-dave.stevenson@raspberrypi.com>
References: <20240620111401.3629380-1-dave.stevenson@raspberrypi.com>
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

Emma stepped back from VC4 maintenance a while ago, and
all patches are now merged through drm-misc.

Drop Emma's tree from MAINTAINERS.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index b6dd628d5bc6..3deb52366be1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7523,7 +7523,6 @@ M:	Maxime Ripard <mripard@kernel.org>
 M:	Dave Stevenson <dave.stevenson@raspberrypi.com>
 M:	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
 S:	Supported
-T:	git git://github.com/anholt/linux
 T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/devicetree/bindings/display/brcm,bcm2835-*.yaml
 F:	drivers/gpu/drm/vc4/
-- 
2.34.1

