Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 63DB4190240
	for <lists+dri-devel@lfdr.de>; Tue, 24 Mar 2020 00:53:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A53C6E433;
	Mon, 23 Mar 2020 23:52:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 360E46E433
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Mar 2020 23:52:56 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id d1so1636445wmb.2
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Mar 2020 16:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0D1ven5JkcRCqC0QsOiOJmOuTCslMBwDzlZznsJjoow=;
 b=jIRtGpJp7y300Fp9BPmkqlX0ZG+UfkfZHpMAEaWzl7ieOtb8cMO4RTWLFnwo17atti
 IHgXMPhzneIkIpIarOCBtEmdALKsNLCy0dDBzLWRQTpY7G+DNQy9M32WBzj6YrEzVJiH
 yrgefwAQeIDYItt06T6CwPXJNlzt64IpcFAeyXHUxUnaJVqiJ5S9R/ANzFZAoxIA5n+f
 0+koICZy7WDADCf97aDoocEjYbdh1ohjPi3zmCKDz4njGYjoD4JlEwLHK1D1PAzDvvoZ
 PY8Edfw4+v30l2veCdgEhMkPmBv7MakYmKdpJHA0lbqEGe76EWvASLt2PApaGsDO+dEA
 c+cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0D1ven5JkcRCqC0QsOiOJmOuTCslMBwDzlZznsJjoow=;
 b=G0mckSLFO73COxwwEmI6YSIYhWHb97u6bzwMIdYtcr41L8sj0KRcWnemLiPWpwEPpo
 pjiU9gMwwqI6CED9MBtIRvspl3oSAZo29K87vg3xerN4yBZYU/i4S0wK/ugGLqclAMd3
 aKpJ0TXuhFgxz7V1K3jddVI74rDHSNmuC36VFE1wMGCPHWy9AsKuDMytwem0mwXftmYX
 KShACttv4TnXW7YqZqyCsV8K652qCOQJq/4I2IyC/PeaxatbfvQd5sD46evx60GsRsLU
 HHWt4IWJqbJdHd2IRuexfUMRSinp563xXJs+ma41iXt4ZDPclh4K3Jfjm83i6VSpzuZz
 Fuow==
X-Gm-Message-State: ANhLgQ3dGtOFs3V+LqjvNkjVi1OoxgigV1y47wPmSMfbkpbcn835FuV3
 j5D6JF3DAy6XLrr8GW8yoQ3hBObrHoM=
X-Google-Smtp-Source: ADFU+vs7P4GgYfITIFxh1PEVHLQ9GKD5JZ9pabfglJe0oP9P6ktXgwfuAJl+Ff4mW7Am+vGNQa53VQ==
X-Received: by 2002:a1c:2c41:: with SMTP id s62mr1967544wms.188.1585007574588; 
 Mon, 23 Mar 2020 16:52:54 -0700 (PDT)
Received: from wasp.lan (250.128.208.46.dyn.plus.net. [46.208.128.250])
 by smtp.googlemail.com with ESMTPSA id t1sm26729287wrq.36.2020.03.23.16.52.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Mar 2020 16:52:54 -0700 (PDT)
From: Shane Francis <bigbeeshane@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/3] AMDGPU / RADEON / DRM Fix mapping of user pages
Date: Mon, 23 Mar 2020 23:51:35 +0000
Message-Id: <20200323235138.207442-1-bigbeeshane@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200323205137.136530-1-bigbeeshane@gmail.com>
References: <20200323205137.136530-1-bigbeeshane@gmail.com>
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
Cc: bigbeeshane@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch set is to fix a bug in amdgpu / radeon drm that results in
a crash when dma_map_sg combines segments. There are 2 shortfalls
in the current kernel.

1) AMDGPU / RADEON assumes that the requested and created segments
   from dma_map_sg are equal

2) drm_prime does not allow for setting the segment length
   via the correct dma macro

Shane Francis (3):
  drm/prime: correct logic for mapping sg to arrays
  drm/amdgpu: fix scatter-gather mapping with user pages
  drm/radeon: fix scatter-gather mapping with user pages

 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c |  7 +--
 drivers/gpu/drm/drm_prime.c             | 71 +++++++++++++++++++++----
 drivers/gpu/drm/radeon/radeon_ttm.c     |  7 +--
 include/drm/drm_prime.h                 |  5 ++
 4 files changed, 75 insertions(+), 15 deletions(-)

-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
