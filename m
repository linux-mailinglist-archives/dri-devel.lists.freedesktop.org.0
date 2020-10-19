Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0083F292E79
	for <lists+dri-devel@lfdr.de>; Mon, 19 Oct 2020 21:28:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D408B6EA52;
	Mon, 19 Oct 2020 19:28:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 135D56E8DF;
 Mon, 19 Oct 2020 09:09:16 +0000 (UTC)
Received: by mail-pj1-x1041.google.com with SMTP id a1so5319845pjd.1;
 Mon, 19 Oct 2020 02:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent; bh=uZj2/UkGwPHGYRDabmeLYz7fWi97ENwgCaw+/fZnSYg=;
 b=mFffBM5SCEC7HStDzuJnoAlobmVwBD4eyao2JgF0wZnAI/P+Kgnsw4kjjQgpTZQwIs
 YC3iuAxEFovt/87e4fkAD0q4BSMw84jvJsN1k3NiisvYNARvpkGzpPo1cgHuaDCWTeVC
 UmhtsSNm+1ns7HKxuCNUiwmZqTGT+na3z/jRstf2vKu70qwUMvL3onrbMFD+/R5mxJEf
 Xp2eMvNcM0Ze7E5ZT6JOdRJNKhjrtutkH9FWZhddenpL9r35OqVfmceptnGANqCULd5I
 NARjSr/WzyklS1gmtdIbsYVqw3AqUZvzS/49RbqlGA+TzLfMDgr/94wlYsVRpD1F20Gr
 5cNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=uZj2/UkGwPHGYRDabmeLYz7fWi97ENwgCaw+/fZnSYg=;
 b=inCj3VzxG+pqWLG6EZHbEpBiLVB5bvDkqBzzCP+aSpg978cXbWcO+Zx4EFdfSRwqFH
 q3fMc2KLQA1qMVxikofFoOOmDIerWbjaiCSp8FjexxzZIko4KgNNLEnCrIw+psvR1AgZ
 rMDQEDKf62OPJ1rwFGg2JZhzgNI2/yUQV5s0rOtZxSDcVhhXdx9IGwTMFCP+qowWD8Mh
 eq6i2zWeYGSkc58Wyn3hInFWkb64zK8PLtjYG8/3VguQ3a6pSD7aemU062DL2/BU7myX
 g83uhWyfJ/oQxcZ9DM4tQvGRfQ0SdT1zOAOmvjYLM7Rtioi77aztjVYA+5xLehnCQHsX
 iidg==
X-Gm-Message-State: AOAM531lK0CXkVvfsacU3Oy5eTU9fi4hm14VCQN12LnodVqzyCe3CBkg
 6TD7U3YbDGloQobPnlkK/Sk=
X-Google-Smtp-Source: ABdhPJxI4EO/P6d4Q9eq8l1sQFrZJO4zeg7b5XiYAqk9apQxYq/Tm5davUSsCKXQW0INQyia5aTfrA==
X-Received: by 2002:a17:90a:fd0f:: with SMTP id
 cv15mr16124050pjb.161.1603098555712; 
 Mon, 19 Oct 2020 02:09:15 -0700 (PDT)
Received: from cosmos ([103.113.142.250])
 by smtp.gmail.com with ESMTPSA id f15sm11300828pfk.21.2020.10.19.02.09.11
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 19 Oct 2020 02:09:14 -0700 (PDT)
Date: Mon, 19 Oct 2020 14:39:04 +0530
From: Vamshi K Sthambamkadi <vamshi.k.sthambamkadi@gmail.com>
To: bskeggs@redhat.com, airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH] drm/nouveau: fix memory leak in iccsense/base.c
Message-ID: <20201019090854.GA2085@cosmos>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Mailman-Approved-At: Mon, 19 Oct 2020 19:28:29 +0000
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

kmemleak report:
  unreferenced object 0xffff9071c65644e0 (size 96):
  comm "systemd-udevd", pid 347, jiffies 4294898424 (age 810.828s)
  hex dump (first 32 bytes):
    02 01 00 00 00 00 00 00 00 00 10 00 02 04 00 00  ................
    00 00 00 00 00 00 a0 86 00 00 00 00 00 00 00 00  ................
  backtrace:
    [<000000007c0d0ac3>] __kmalloc+0x337/0x500
    [<00000000551bfaeb>] nvbios_iccsense_parse+0xf7/0x280 [nouveau]
    [<00000000e3e8968b>] nvkm_iccsense_oneinit+0x6c/0x4e0 [nouveau]
    [<00000000287e7701>] nvkm_subdev_init+0x58/0xd0 [nouveau]
    [<0000000008e4793e>] nvkm_device_init+0x118/0x1a0 [nouveau]
    [<000000008cd3afa3>] nvkm_udevice_init+0x48/0x60 [nouveau]
    [<000000007e047aee>] nvkm_object_init+0x43/0x110 [nouveau]
    [<000000006c56b3a4>] nvkm_ioctl_new+0x184/0x210 [nouveau]
    [<0000000080abc890>] nvkm_ioctl+0xf0/0x190 [nouveau]
    [<00000000f35056a2>] nvkm_client_ioctl+0x12/0x20 [nouveau]
    [<000000000f001008>] nvif_object_ioctl+0x4f/0x60 [nouveau]
    [<0000000098d66807>] nvif_object_ctor+0xfb/0x160 [nouveau]
    [<00000000fe24934a>] nvif_device_ctor+0x24/0x70 [nouveau]
    [<00000000878b3286>] nouveau_cli_init+0x1a3/0x460 [nouveau]
    [<00000000a1578335>] nouveau_drm_device_init+0x77/0x740 [nouveau]
    [<00000000faef6b28>] nouveau_drm_probe+0x132/0x1f0 [nouveau]

Fix nvkm_iccsense_oneinit(), to free stbl.rail post iteration.

Signed-off-by: Vamshi K Sthambamkadi <vamshi.k.sthambamkadi@gmail.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/iccsense/base.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/iccsense/base.c b/drivers/gpu/drm/nouveau/nvkm/subdev/iccsense/base.c
index fecfa6a..23d91b6 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/iccsense/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/iccsense/base.c
@@ -291,6 +291,7 @@ nvkm_iccsense_oneinit(struct nvkm_subdev *subdev)
 			list_add_tail(&rail->head, &iccsense->rails);
 		}
 	}
+	kfree(stbl.rail);
 	return 0;
 }
 
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
