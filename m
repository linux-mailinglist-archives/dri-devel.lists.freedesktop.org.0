Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2D738CFD8C
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2024 11:56:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E62E10F9C5;
	Mon, 27 May 2024 09:56:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="i6qZGnop";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A39710F9C6
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2024 09:55:59 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id
 d2e1a72fcca58-6f8ea3e9543so2356674b3a.2
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2024 02:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1716803759; x=1717408559;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xVqObQW1tDXZp0fIQB+e2zlQS1L4PNA6wMGDb0OfNVs=;
 b=i6qZGnopLLz9VG4h+FdDWETDCr6pmbS3VjfJ8x5p85ZRHfjADzeNWTyopnBoOFJrXv
 DcW1W9DUQov4zU1krDDJInqnV/HO7dQM2YOatg3MHa8OwFCtMSC7HO8rp8M195wBRS0W
 Q0l/rlVDnt3RS/VxpfU/MOa2fO2toImo3X0nU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716803759; x=1717408559;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xVqObQW1tDXZp0fIQB+e2zlQS1L4PNA6wMGDb0OfNVs=;
 b=d28xHeKcc5TS4Yq+b/1ATGMRkz2sdAxcBRKL0LpU8quB/L5pZaWnncf/iSBiIiGzDb
 TkJaG2iJYiC09CnLZIjbXzGfBRcsFAaS2gqu/Yv9Uh2s7jEgYcElintFYIFJOjtBL3CL
 oTr2d/KIY3QA2xi/Eosp1Pus2Cuf/GXFThj+QHe87LIb1yXW7QBl3ukx2o0xOwyto7SZ
 p59YXRx/s3IaYhGFHbQjaSX+oCkjsfy8a1wFXP/VLjjYQRvfhF1e25L8KnuCqxhb7/zC
 d5dkAs631+ijOzQUh9Rss9kJjltwgYJeL+Eqtpi6NwAEKXkV8eYh3f9w3aKM9FcmZ/Ql
 flYQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXgMtjyj1dmvODeujMQE/PFlsDFoKUN47DTBEOvjm1Fp4LM1O/i2wS+X8wUrMEMVjzMbcB6C7CY+W6enOeQcrfi2HU2AvmximePpkgRBsGo
X-Gm-Message-State: AOJu0YxptRx0Ef1L5H2RnzhlOLP6ZEbqhkxx4+ogTIxarF6WcOOyjgGl
 DccS5tJxzlZzq1CyFJwcWqKvay0YwaglePSrmdQj/D3QX7tdBeqKxJ20ZkqlNQ==
X-Google-Smtp-Source: AGHT+IGSeRQ9ncSvLh1p/paH6YS7lQiGlvz0ZoxgQ9AWSvApeNL+VJvo1/NPMaTOG4LA1ELaniNmyg==
X-Received: by 2002:a05:6a00:450a:b0:6ea:74d4:a01c with SMTP id
 d2e1a72fcca58-6f8f34aa591mr10007490b3a.14.1716803758828; 
 Mon, 27 May 2024 02:55:58 -0700 (PDT)
Received: from treapking.tpe.corp.google.com
 ([2401:fa00:1:10:a9ab:23f:9d2d:dc0e])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-6fd94372addsm2951616b3a.186.2024.05.27.02.55.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 May 2024 02:55:58 -0700 (PDT)
From: Pin-yen Lin <treapking@chromium.org>
To: Douglas Anderson <dianders@chromium.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Pin-yen Lin <treapking@chromium.org>
Subject: [PATCH 0/2] Support more panels used by MT8173 Chromebooks in
 edp-panel
Date: Mon, 27 May 2024 17:54:48 +0800
Message-ID: <20240527095511.719825-1-treapking@chromium.org>
X-Mailer: git-send-email 2.45.1.288.g0e0cd299f1-goog
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

This series contains 2 patches.

The first patch adds more panel entries with the delays from the
datasheets.

The second patch adds 3 panel entries whose datasheets are not available.
For more backgrounds of the rationale behind these conservative timings,
please refer to the commit message of commit 7c8690d8fc80 ("drm/panel-edp:
Add some panels with conservative timings") and the related mailing list
discussion[1].

[1]: https://lore.kernel.org/all/CAD=FV=V=K9L=bJiNvFJ+K_DHUTPxA4WtukXA+E_VW6uihE8kdQ@mail.gmail.com/


Pin-yen Lin (2):
  drm/panel-edp: Add support for several panels
  drm/panel-edp: Add more panels with conservative timings

 drivers/gpu/drm/panel/panel-edp.c | 6 ++++++
 1 file changed, 6 insertions(+)

-- 
2.45.1.288.g0e0cd299f1-goog

