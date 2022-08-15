Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 332A7593EA1
	for <lists+dri-devel@lfdr.de>; Mon, 15 Aug 2022 23:15:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53429D50B8;
	Mon, 15 Aug 2022 21:14:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EB9C9B6F9;
 Mon, 15 Aug 2022 21:14:50 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id
 q9-20020a17090a2dc900b001f58bcaca95so15545562pjm.3; 
 Mon, 15 Aug 2022 14:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=X3Fu4ehStrUEKyTXt+fee6+Wug+zWXwk64af5B5Ru/4=;
 b=HaCbD+HDElK/diS+4llLWSlfdYQZ9dhgsMPOP1KRoiDFm0npey1Bqa9/oVRvRlmMgD
 9RnEx1/9LjeYmmhxwgvIEhTBuv/80m4RTRXqZ2NIIN7342CVBG8pwf7idUapDTtycmNC
 iMjnjJVXDV1snHkG/s2ykjGrlToed+buswZ10/XVNE93crGX5U9glQ6siCgMZ7wGgSuO
 +o7Swelyq6Wsr2Wm1lPPhQ7IpyEtlJVwBkiHzC/t4LsipXNSWJ8+cy3EurJuTBTncRBj
 Tka2ijvbVuiN0O8CfMRv1Db/cGVXkTPRKshz1b5h3QxyqHl1VVMQxzSG1uEXUGNLd60Y
 eLqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=X3Fu4ehStrUEKyTXt+fee6+Wug+zWXwk64af5B5Ru/4=;
 b=kUnkQQranl2BZtdD/j+ehfk1QqTQCey/u4w7KoLlg0DGX+FPtvZBxoBCIfAkR9xJUZ
 k4+4ykYbyuQY0MK2bZqnnjC4B2muau67snUAu3jRQwGrF0gU1ay9f3IyFFXLR+RpTMfB
 XPcqAw9003cdw7C/wjvmYW635nAjxCyQul1cx0zvp4CjBwGRVW+9E99ox82j17okSgOy
 ZGI4BCL11NrX0gqVcCHCpElLc7Gg4rooOC46tfDlLhykr7hS3oTe4/KXyhVIFaA0IZhi
 CKgdlkCNsCPav8zp2/iAZAHC3dG8iatDMeXYBoLvYpDtxqENzbEWVe2q7nslSx2RfBV+
 G0Vg==
X-Gm-Message-State: ACgBeo2gDwj9M1MBV3VTMLnHtMHrowCdRWDskqWyGOegB7nqh+7rajBr
 s+TipZviUSLVlrhhSKUKndmp4pxlBYQ=
X-Google-Smtp-Source: AA6agR44865ylIMa+b8PphQX9njk4C+gUcPVunj5mJCRWKVNX7lX7QczSovUoJeBOAsy56Hbx/SlLQ==
X-Received: by 2002:a17:903:120a:b0:172:5a63:7442 with SMTP id
 l10-20020a170903120a00b001725a637442mr13083405plh.55.1660598088926; 
 Mon, 15 Aug 2022 14:14:48 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
 by smtp.gmail.com with ESMTPSA id
 a24-20020a63d418000000b004277f43b736sm3569439pgh.92.2022.08.15.14.14.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Aug 2022 14:14:47 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/3] dma-buf: map-info support
Date: Mon, 15 Aug 2022 14:15:11 -0700
Message-Id: <20220815211516.3169470-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.36.1
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
Cc: Rob Clark <robdclark@chromium.org>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jerome.pouiller@silabs.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Sean Paul <sean@poorly.run>, freedreno@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

See 1/3 for motivation.

Rob Clark (3):
  dma-buf: Add ioctl to query mmap coherency/cache info
  drm/prime: Wire up mmap_info support
  drm/msm/prime: Add mmap_info support

 drivers/dma-buf/dma-buf.c     | 63 ++++++++++++++++++++++++++------
 drivers/gpu/drm/drm_prime.c   |  3 ++
 drivers/gpu/drm/msm/msm_gem.c | 12 +++++++
 include/drm/drm_gem.h         | 11 ++++++
 include/linux/dma-buf.h       | 11 ++++++
 include/uapi/linux/dma-buf.h  | 68 +++++++++++++++++++++++++++++++++++
 6 files changed, 158 insertions(+), 10 deletions(-)

-- 
2.36.1

