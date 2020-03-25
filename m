Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B20591923B0
	for <lists+dri-devel@lfdr.de>; Wed, 25 Mar 2020 10:08:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBEC66E5CD;
	Wed, 25 Mar 2020 09:08:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CD886E5CD
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Mar 2020 09:08:37 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id b12so1450877wmj.3;
 Wed, 25 Mar 2020 02:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XIUdQLhj5Pc75TUvcZ0tOKDsdZmwm019gn6D+9JuS6w=;
 b=mXJTQiFObD2+7P3KfspCMe5UXynkuywXffCR5WsPA8tjfynSlKOm0NBB3QjoP6LDzq
 Wz0zHDBmyOJbKrtLWVHfevcqnJJEFvjZyMSjaa/Bn8/dwCNTCI8Wmcv7xZqpHp0erP0u
 vn1QTutDwin4d0cZ+3DAgpaV22CxUd0RoPJrkS1a1U70332X0oYJhY0GBJSNfyXe+hlU
 rXbU1C31crfr3PwWko2cM42XvdDtdDIquSQ6LO2rE7OKT7danHk5SaA/zJDjBXPB3eHy
 kM1rAVSFPSgfQth+b0e3N0nHfM/MQ4PUK5DOT+TpsVpjPGDG3S54I3jUhfUeghNys21x
 Eomw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XIUdQLhj5Pc75TUvcZ0tOKDsdZmwm019gn6D+9JuS6w=;
 b=smEaA5j7BYCtQ7U0tItRAgM7SyKu4z/Vq9/ReHIs36fMfA0UjHlZKP8g4UjOo0k+Ua
 pUllIHVKVTDbtViCllS5f21eFfkCVv7xfmmPQcoywyKq+FspYoS+W9P71ltJVvS027+Z
 Ul7UlZO6eoICtGJpn7U98Pi7swdwh9NVDLHYwiWeB0BPEzQDS/4t2lIyoQsqShl5EbVV
 CQ2/ICC+EqtwDRDCu3j+MrD7Fthlx4AXsVi7XyHQTeRrwOANPrL3W/hureishTaZ5Dno
 8cXpbOawlKDvvy6HS8hIGE6eE+qZnU0vr+15kQ1u2meaQda4Op4qRNf7J+6VdoNOQ9lw
 XJjA==
X-Gm-Message-State: ANhLgQ1/sgpif1XFvVPH0FTwjQMjH7I+YTmDDrsZHApgwgng1DfVSald
 4a2uI/R6/CDwSjo4w2VvwjUoOXoK4EU=
X-Google-Smtp-Source: ADFU+vs4zpchGXsW1LwA3DrZsQ+YXxDctXvUmSKUptU1A50v2mdge/WrAGiWh+lvWepXYhaN5jIHDw==
X-Received: by 2002:a05:600c:286:: with SMTP id
 6mr2387027wmk.101.1585127315630; 
 Wed, 25 Mar 2020 02:08:35 -0700 (PDT)
Received: from wasp.lan (250.128.208.46.dyn.plus.net. [46.208.128.250])
 by smtp.googlemail.com with ESMTPSA id 127sm8565048wmd.38.2020.03.25.02.08.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Mar 2020 02:08:34 -0700 (PDT)
From: Shane Francis <bigbeeshane@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 0/3] AMDGPU / RADEON / DRM Fix mapping of user pages
Date: Wed, 25 Mar 2020 09:07:38 +0000
Message-Id: <20200325090741.21957-1-bigbeeshane@gmail.com>
X-Mailer: git-send-email 2.26.0
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org, bigbeeshane@gmail.com,
 amd-gfx-request@lists.freedesktop.org, alexander.deucher@amd.com,
 christian.koenig@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch set is to fix a bug in amdgpu / radeon drm that results in
a crash when dma_map_sg combines elemnets within a scatterlist table. 

There are 2 shortfalls in the current kernel.

1) AMDGPU / RADEON assumes that the requested and created scatterlist
   table lengths using from dma_map_sg are equal. This may not be the
   case using the newer dma-iommu implementation

2) drm_prime does not fetch the length of the scatterlist
   via the correct dma macro, this can use the incorrect length
   being used (>0) in places where dma_map_sg has updated the table
   elements.

   The sg_dma_len macro is representative of the length of the sg item
   after dma_map_sg

Example Crash :
> [drm:amdgpu_ttm_backend_bind [amdgpu]] *ERROR* failed to pin userptr

This happens in OpenCL applications, causing them to crash or hang, on
either amdgpu-pro or ROCm OpenCL implementations

I have verified this fixes the above on kernel 5.5 and 5.5rc using an
AMD Vega 64 GPU

Shane Francis (3):
  drm/prime: use dma length macro when mapping sg to arrays
  drm/amdgpu: fix scatter-gather mapping with user pages
  drm/radeon: fix scatter-gather mapping with user pages

 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 2 +-
 drivers/gpu/drm/drm_prime.c             | 2 +-
 drivers/gpu/drm/radeon/radeon_ttm.c     | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
