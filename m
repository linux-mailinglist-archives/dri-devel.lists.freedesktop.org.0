Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 996C23827BB
	for <lists+dri-devel@lfdr.de>; Mon, 17 May 2021 11:04:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BEA96E912;
	Mon, 17 May 2021 09:04:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91F6B6E8FD
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 08:50:04 +0000 (UTC)
Received: by mail-pg1-x533.google.com with SMTP id j12so4172646pgh.7
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 01:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=d+8KyNMS3UthpalbMaLNFWd7rsxivR4hVqKsroFzDcg=;
 b=I2vVFxhA/ATWt2N/IbXFrPqogS3dn7PJKuOhKTE9wb6Y27GzC6XH0PNcvDhiFwtqoG
 YXaTEeoWR57cr1amPtOREU6IqcjKRjX7ILkdjUzKl6zF4VmWPWoAYVMH8cfbOb4/Nrjl
 pDr+i536viDbi3M1/qgku3ixXyGHzoZmzC+P8PrdtFzOHLFZjoB3jsremhb9gKPBcSoe
 dU6x2rRw6J0YjRW3O41UoB7NpgnZXP9RjEAgHxAq2gT/0RzOQWxYvfgXTEZuQc8QtHWv
 EvivxnjN+4Klsi8fZjBzKB6nge9z2xKXCltLdifKAfrEcf7/PRAPbcSEFZrZjGYhXGvn
 qY5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=d+8KyNMS3UthpalbMaLNFWd7rsxivR4hVqKsroFzDcg=;
 b=HU5F2a92XEqvvdgZmnfm2BlVzIS4Tg6dR54TgiADVZVm3GpevRoH1CwM4yqXbowefK
 eedCnM2RsAjPaEI+UJ4677cxVmYughOPC/7SA3Zfdp6gLKdjTyleh2sPI7QOI/r+PWoJ
 vu/KhKrs456wneDzjkq/0GHVTnG9ChQEuqqCVJytW7Z8mNb0mU8g3tzgYRxzPJoMzq/8
 yUQzFjVgKNpw6v/p+HGD/8rZ/xWvn5NHjAU9l6w+mSobXIf+/ujrynfJxFMRXKPOgwzU
 t/MYiRbnmmNfvRdkHc5GpFsJSbTBE4OSKbbe/yaaLvrmlNFCJjF1fKVLyXuODlagJMTq
 OY4Q==
X-Gm-Message-State: AOAM5301rKTkNpQrh8vzLLSTQ6guygV3Rb8AjECgX8CNKk/pcIHeiUzN
 yjmZGkFmEUjsA4JZGiHxRPyo
X-Google-Smtp-Source: ABdhPJw2RVR5C9qLDvNyBYxDUPNmHMatdeABhT67H0qozX74M91VbOZGu4vh0ni1shh7ISITfh1NIg==
X-Received: by 2002:aa7:9ede:0:b029:2d9:ed92:3fad with SMTP id
 r30-20020aa79ede0000b02902d9ed923fadmr8823581pfq.10.1621241404015; 
 Mon, 17 May 2021 01:50:04 -0700 (PDT)
Received: from localhost ([139.177.225.253])
 by smtp.gmail.com with ESMTPSA id i2sm14381206pjj.25.2021.05.17.01.50.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 01:50:03 -0700 (PDT)
From: Xie Yongji <xieyongji@bytedance.com>
To: airlied@linux.ie,
	kraxel@redhat.com,
	daniel@ffwll.ch
Subject: [PATCH 1/3] drm/virtio: Fixes a potential NULL pointer dereference on
 probe failure
Date: Mon, 17 May 2021 16:49:11 +0800
Message-Id: <20210517084913.403-1-xieyongji@bytedance.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 17 May 2021 09:04:21 +0000
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The dev->dev_private might not be allocated if virtio_gpu_pci_quirk()
or virtio_gpu_init() failed. In this case, we should avoid the cleanup
in virtio_gpu_release().

Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
---
 drivers/gpu/drm/virtio/virtgpu_kms.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/virtio/virtgpu_kms.c b/drivers/gpu/drm/virtio/virtgpu_kms.c
index b375394193be..aa532ad31a23 100644
--- a/drivers/gpu/drm/virtio/virtgpu_kms.c
+++ b/drivers/gpu/drm/virtio/virtgpu_kms.c
@@ -264,6 +264,9 @@ void virtio_gpu_release(struct drm_device *dev)
 {
 	struct virtio_gpu_device *vgdev = dev->dev_private;
 
+	if (!vgdev)
+		return;
+
 	virtio_gpu_modeset_fini(vgdev);
 	virtio_gpu_free_vbufs(vgdev);
 	virtio_gpu_cleanup_cap_cache(vgdev);
-- 
2.11.0

