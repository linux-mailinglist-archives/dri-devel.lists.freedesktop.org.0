Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6585EA1C1B2
	for <lists+dri-devel@lfdr.de>; Sat, 25 Jan 2025 07:47:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3109210EAA5;
	Sat, 25 Jan 2025 06:47:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="RxD4QmWQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com
 [209.85.166.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA8AE10EA84;
 Sat, 25 Jan 2025 06:47:38 +0000 (UTC)
Received: by mail-io1-f49.google.com with SMTP id
 ca18e2360f4ac-84cdacbc3dbso225295039f.2; 
 Fri, 24 Jan 2025 22:47:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737787658; x=1738392458; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ml0f3Pd8Ka4iU5aZCXEGIrryKcpgrL2K29uQN80cdi8=;
 b=RxD4QmWQ6SvbrUHpgeZDZTBcRW6wkqmPIok82xofMSvzaeFitmXnNRbL44sPlMvk+D
 QgfsSn15B9gRnUdL3Fd4aI0Fs4KCZq8ID21DyUWSn6Yy2qTPl81jM9Odgx/N6+2JP7k5
 /nmPjhOVZh2F9EzH6lG+Na4Z93RVynIWVC1ihZQeDYe3Ce0/jo6crYgqvrXDZPRdL3Pj
 87DgTEiVBc6aKgy+F2ARx4alxB21gABbAuXVQl/U2koagL41rNdXFYt3jppy6DU0pW/F
 MJV2UqeuVSc4hpv3cDb0J2R44Xo4Mup+9uk4xX67ehUD+TbBsnv3NxUREL/Kd0rf2jvZ
 tWYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737787658; x=1738392458;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ml0f3Pd8Ka4iU5aZCXEGIrryKcpgrL2K29uQN80cdi8=;
 b=XAZKEB7V4teSP4TeGl/DWgFnZq4/Vfp2989AKNXgmnVnll/WkZ0wSFLcOE9d8P5uxW
 ddo2+AdHbq9A7viQIxas6xUNz31S2C+gQflVr2FPeMyRC3u8JMSFgafpW58PKLPmsuX4
 GWpgjMrfpNaJw/yCtEdnmX8AeZt7QnmMfWkxo7e4VFZsIaPqjYKgnMFYM9HtnCnb6lAW
 2f1AA7OYqnzHGJuiRqjjtZLFj6wmo8WnC4aq7F4NUJxJRujqQOlmEjFZchsJv6q69nIp
 olmSRcm2w/xBhhgBI3g2f9JErx/jO65KtrrcFdrUMxeAajOHcLxrB2hPXyqZcNwT/NKN
 CLGw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNoumw89s5z7+QOEeppy77r0bEQcLynezzSwSIuYVX37DjUMR1w5cnaNCuDGNfoYl8AK6FS9aRTDw4@lists.freedesktop.org,
 AJvYcCVID6HEbv5iWgTfooDA4sIbI4qDDxEW1/8AonO98BBBC9wfgvXRG6LLXweWcb3Q/LvcHvjmv2dr@lists.freedesktop.org,
 AJvYcCVblgJV3q3IBlNp62x8awGImZn4i6+iwD9vCxvVjTTXCa9d7bO5w2xVY0dxzDcAyIlw35Ye5+M79RNpH9QRjQ==@lists.freedesktop.org,
 AJvYcCW4fBeRHM8JPC4Kgd7/V5tGKZLWyQlyTSXb64ohW58MTbJwUiHIB3ZQtM6x3gbM1ntCszxc/9Mi6smB@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwC3XBDEso5qaidZbRrkNAWEsDBlh6BpXLE3heKUZiBKi3620Go
 cKRNXVIGxi7ehDxIF4pScPh2PNtLVumpFIVpt05EZOLli+afHnD7
X-Gm-Gg: ASbGncvDyobk1d415ayirXZddgd7XdmvaCnr9Hhp/Qwq80cLtmhMR3JwHEV0jP7g0OF
 ckPD/Qi5ReI8HMQ48I0K8rJWbvdSGbzn3/7PF6oCvnViPOublpVduNbDbu4aOTcpKW++PHyg7uW
 uRBdLEhMTo/Xus78XkvOKvseLc72jA4/cECCqw+14fCvA8dAkZ+twX/9N6bH8edi0HJGh1of04W
 KtEkZ5B15/GrjDpz//00BwBIQSAWh6uUKue6i6fGtdceZEBqTYNwsOaMyQQwBay82W7it2nLq3b
 PBBPC8XjsxkcY1yuDgyaE5Grk1iVLKkHbKyEuw==
X-Google-Smtp-Source: AGHT+IGce0KIu/cX2IH/rWl8zI4G4c6laHe0V/hYkyUUaTQ687Q3YC1U7XADmcyJKObXxSVBExI4fA==
X-Received: by 2002:a05:6602:134c:b0:835:3ffe:fe31 with SMTP id
 ca18e2360f4ac-851b61cad45mr3108696839f.8.1737787658078; 
 Fri, 24 Jan 2025 22:47:38 -0800 (PST)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-4ec1da476fesm1174144173.58.2025.01.24.22.47.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 22:47:37 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org
Cc: intel-gfx-trybot@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH 57/63] drm-dyndbg: add DRM_CLASSMAP_USE to vkms driver
Date: Fri, 24 Jan 2025 23:46:11 -0700
Message-ID: <20250125064619.8305-58-jim.cromie@gmail.com>
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

The vkms driver has a number of DRM_UT_* debugs, make them
controllable when CONFIG_DRM_USE_DYNAMIC_DEBUG=y by telling dyndbg
that the module uses them.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/vkms/vkms_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index 2d1e95cb66e5..4d6b525dc5a0 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -40,6 +40,8 @@
 
 static struct vkms_config *default_config;
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 static bool enable_cursor = true;
 module_param_named(enable_cursor, enable_cursor, bool, 0444);
 MODULE_PARM_DESC(enable_cursor, "Enable/Disable cursor support");
-- 
2.48.1

