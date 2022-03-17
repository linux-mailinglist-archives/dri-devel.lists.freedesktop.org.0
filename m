Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ABB2B4DCBB4
	for <lists+dri-devel@lfdr.de>; Thu, 17 Mar 2022 17:51:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95C8D10E03A;
	Thu, 17 Mar 2022 16:51:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BD8610E03A;
 Thu, 17 Mar 2022 16:51:09 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id
 mz9-20020a17090b378900b001c657559290so5764212pjb.2; 
 Thu, 17 Mar 2022 09:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1fhGdDZ+4+A9O0kCAE2qwkKzIiiq6BxVXVjKbXoOSjc=;
 b=ac9lDNWQnaCjB8ARNToKqWJDqJP5c28Oek7OnIM8tObf04cglsVkYnXBmiuN9c3Vv5
 2NYJaoYf5XGUKw3PSYK+DyxInZZKD+1OAcKuFi5M5X8gN4eXpwEBM/lXs/2jp4AB3HtV
 Op8GJqf+gOusx4Twv2NDLrsanY7dvJieFhLKej2mwDe8ynGiPDWcxYkH8fIoFoeHSzDD
 S3QJ4T2e0YrbaBaapqQuGQ2R+jZ3nxjWphDWla4JwCtJCimnu3watw7KvWCSxfPq8yw1
 pN1Efdd8hY6wHe2SlJHqkKgy1i+D5xu9uPDhn10kskC5Oix83cLBVBFyURLBiUmXw8kg
 OJPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1fhGdDZ+4+A9O0kCAE2qwkKzIiiq6BxVXVjKbXoOSjc=;
 b=xE+Y0+G8SvTUKHysJF3k/JsqLZHluFOfmrhYIAyEuVEJiLgRclGFMOUsnwVlU5z52J
 64MslkZ4HiSeEj1UOyzAhv0TMFf+XGhNDavWyyGej7yZ92q+aV6PxRPaXSEOYFMukWAj
 1MKasSCpVMz9hfTbwK5Ysu2TIW2S4n4GrC/dPXJYDpOtAv3ZFStKwRjxK7n9tFSj3NEG
 z8VLOnyicoBxRUcUnIVOrhtpcIRd4TOg2zUqV/XhehZd+kmvgC9PXAd3pZwVJHZTbBLb
 QCO72RWH0BQZ63NEDUFqRj5nFJhe8+hocAuI5fbHDWEC1i6D1hur7nPbVz6u+w+Huoa0
 n+Yw==
X-Gm-Message-State: AOAM532ukmQT7KNWs98Tg2CpG+u1Se+wUHz4auchD9CmUchuEhE/JF89
 l8Jf2+/YJoDHA/5CicRd+yOvNI5TROs=
X-Google-Smtp-Source: ABdhPJwOV8GUTP9XpL07YdxSy7tQQ35mfNlI37jPr60/Ls8AYizX9BfbQrjuvdQDSL4LF/zStG7h0w==
X-Received: by 2002:a17:90b:1d8d:b0:1c4:ba77:3e29 with SMTP id
 pf13-20020a17090b1d8d00b001c4ba773e29mr6509256pjb.206.1647535868296; 
 Thu, 17 Mar 2022 09:51:08 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id
 d19-20020a056a00199300b004f7b7bb0733sm7071888pfl.60.2022.03.17.09.51.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Mar 2022 09:51:07 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/3] drm/msm: Add comm/cmdline override
Date: Thu, 17 Mar 2022 09:51:37 -0700
Message-Id: <20220317165144.222101-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.35.1
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
 open list <linux-kernel@vger.kernel.org>, Jonathan Marek <jonathan@marek.ca>,
 Emma Anholt <emma@anholt.net>, Akhil P Oommen <quic_akhilpo@quicinc.com>,
 linux-arm-msm@vger.kernel.org, Vladimir Lypak <vladimir.lypak@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, freedreno@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Add a way to override comm/cmdline per-drm_file.  This is useful for
VM scenarios where the host process is just a proxy for the actual
guest process.

Rob Clark (3):
  drm/msm: Add support for pointer params
  drm/msm: Split out helper to get comm/cmdline
  drm/msm: Add a way to override processes comm/cmdline

 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 49 ++++++++++++++++++++++++-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h |  4 +-
 drivers/gpu/drm/msm/msm_drv.c           |  8 ++--
 drivers/gpu/drm/msm/msm_gpu.c           | 40 ++++++++++++--------
 drivers/gpu/drm/msm/msm_gpu.h           | 10 ++++-
 drivers/gpu/drm/msm/msm_rd.c            |  5 ++-
 drivers/gpu/drm/msm/msm_submitqueue.c   |  2 +
 include/uapi/drm/msm_drm.h              |  4 ++
 8 files changed, 94 insertions(+), 28 deletions(-)

-- 
2.35.1

