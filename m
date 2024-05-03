Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D828BB24A
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 20:15:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04A28112923;
	Fri,  3 May 2024 18:15:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="lxsn7uWI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A8A1112921
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2024 18:15:07 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-2dd7e56009cso121321481fa.3
 for <dri-devel@lists.freedesktop.org>; Fri, 03 May 2024 11:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714760105; x=1715364905; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6VHpW3YwQdLN/LIIhzeDsDWWk0Ue/DwBQ65FA5shOuA=;
 b=lxsn7uWIeMyRjPTKNUjRO66MRSS4p1ivXuhrjJ3gWo+hHuQQd+VtLtbFdKd4Fqn/pd
 oleuzmEYDZJF5/uqO01zt/y1ha/eJ72w5xAmRZN2BXtAI6rgQ/8aYqjbxz0AaA8tw93T
 IV8tLa92wuR5aHrMUoD36JtMBnPqDKeh4f1jAJnlwIqICmOjbKyTyQZ0xgYnomt/WS5a
 eRWQigzRSr9lefCw6cmEZNXG5k9FJdm40Dzbk8s3FhqqgFjZmxbY3zCuXwCx4Y2uTQ+9
 lz35gO1ydx6gTbygpAFFYquXyLmLXNfEX5ltQmIluOox95zaWew9MhiNjtrcvxuhwOYS
 gS/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714760105; x=1715364905;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6VHpW3YwQdLN/LIIhzeDsDWWk0Ue/DwBQ65FA5shOuA=;
 b=baiOyWSjtibUhUsY1l3teioTOzN4pdr1+/mi/JmbKaJnIn67xa6sUmX2T4lS7JQ3hS
 Fvf5DhpSLYNdIqaxYxmNjYwJjSGZ1MRizUA5oxah4VYhTFdc95NLrPiAV6ypfV5/XVxO
 11gsu8iAVaUCIQXDXGUgb9rwzHpecrOy3f7aTUzkVydm/twiq7eru1gdKRnAZ8CMZBVU
 5r1/OqN/epBvW6IXZRKob49/OfpYG7yO50JqDhdncW8CohpN7pOt5epN2h5UaDWodgMD
 uhFRKVrECMN+dGz0kZ/fwMnVVi4XM+BdRt1SEBX/WT3GhAuLJ1j1kVIH7js8WEEkQFRN
 mb8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWBlTE/2jk1n5hKCKGpqCNEa7PsG3tyI1CigWnqbZElhxcW8abIw4z6dWOxtSaSnISyLqM4gCGdYYJYCq30hoq9WKzSpMMerYkdcjqzyMNL
X-Gm-Message-State: AOJu0YwRNVBo1qK7hTPA21yTIbr74M784cV0NjAHfh6WODdasW7ubr/W
 i4+1j0moqd35GczcP4zOubpzY01+yP+rXNKyiWgdYjay4BOvC0/xZZxef1V/C/8=
X-Google-Smtp-Source: AGHT+IG270X7V/CPMT0cBVd0CUNrSK1X11hI+m8mqCij2hT0ErOlBIlX6u6taZn8Okcumuf+hZtf/Q==
X-Received: by 2002:a2e:b385:0:b0:2e1:bd06:51b0 with SMTP id
 f5-20020a2eb385000000b002e1bd0651b0mr2559625lje.35.1714760105181; 
 Fri, 03 May 2024 11:15:05 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 s7-20020a2e9c07000000b002de118decbbsm605548lji.53.2024.05.03.11.15.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 May 2024 11:15:04 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v2 0/2] drm/msm/gen_header: allow skipping the validation
Date: Fri, 03 May 2024 21:15:02 +0300
Message-Id: <20240503-fd-fix-lxml-v2-0-f80a60ce21a1@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKYpNWYC/22MQQ7CIBBFr9LM2jFQkYir3sN00cDQToJgwDQ1D
 XcXu3b5/s97OxTKTAXu3Q6ZVi6cYoP+1IFdpjgTsmsMveiVUMKgd+h5w7A9AxJZq40yXiuCZrw
 yte+oPcbGC5d3yp8jvsrf+r+zSpRIV3sRwmkr7W0IHKeczinPMNZav+uC+CqnAAAA
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Helen Koike <helen.koike@collabora.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Stephen Rothwell <sfr@canb.auug.org.au>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1791;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=b7uOun1ntNdzPOKIgV03PceTfRzyuh2qAoZEj2CCG+U=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmNSmn1LRPvp7NI+bsZssbP+ut3TuZL6Yc4tpig
 T9NM2DLbJ6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZjUppwAKCRCLPIo+Aiko
 1XEZCAChGQwzME/xcgNIXEa1YQRSf9nPsFpkjNFwkng3JTq7gJoKSB+KtK0yw/ZxZjVdh5geZzy
 895HYO1C5z9R0cmLb3j9RZ7xxWZyx9H7KVfQ42xbwP4IcMP/KGLI7k5xwOKRqxqT/zf6zlNDps6
 nsxOCkfXILrhSCUvZYZvEv8taBq3IuuJ4Cki3m/4y1jLtgD+zPHf5ItSWEcL+g3zC5uxS0ysRnP
 coMbWIi21rZZDCDMEq534giV7AFtqnaBIaJU5pLMUgjWhtfrCPKmMiRx2CKupcinWfcjdXI8ny3
 vTGY4fDmV53N3n0td6d/B03Dsnko3NaKgCv4XLmERrNHL+8a
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

In order to remove pointless messages regarding missing lxml, skip
validation of MSM register files against the schema. Only the driver
developers really care and/or can fix the files.

Keep the validation enabled during one of DRM CI stages, so that we
still catch errors, introduced by mistake.

To: Rob Clark <robdclark@gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: Sean Paul <sean@poorly.run>
To: Marijn Suijten <marijn.suijten@somainline.org>
To: David Airlie <airlied@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
To: Helen Koike <helen.koike@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Changes in v2:
- added validation of XML files agains schema in in DRM CI
- Link to v1: https://lore.kernel.org/r/20240409-fd-fix-lxml-v1-1-e5c300d6c1c8@linaro.org

---
Dmitry Baryshkov (2):
      drm/msm/gen_header: allow skipping the validation
      drm/ci: validate drm/msm XML register files against schema

 drivers/gpu/drm/ci/build.sh                 |  3 +++
 drivers/gpu/drm/ci/build.yml                |  1 +
 drivers/gpu/drm/msm/Kconfig                 |  8 ++++++++
 drivers/gpu/drm/msm/Makefile                |  9 ++++++++-
 drivers/gpu/drm/msm/registers/gen_header.py | 14 +++++++++++---
 5 files changed, 31 insertions(+), 4 deletions(-)
---
base-commit: 104e548a7c97da24224b375632fca0fc8b64c0db
change-id: 20240409-fd-fix-lxml-eecc6949f64e

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

