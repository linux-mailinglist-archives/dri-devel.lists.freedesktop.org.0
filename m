Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F8995ADE4
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2024 08:47:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46E0A10E769;
	Thu, 22 Aug 2024 06:47:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="JbbBl7Hr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD18710E769
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2024 06:46:59 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-201e64607a5so3166015ad.2
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2024 23:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1724309219; x=1724914019;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8PKT7sjGktvi1hrrMiQcV4qsyDxjdMEYuTJhST1ej0Q=;
 b=JbbBl7Hreci0iUrajejrLvqv4fybYNIh/nVT71JlbSfYJ/YA7fzAWf24Fjr7+rmqPk
 pRd6Nx7Tb122C9CFGQFZYTljvj64YkWJxS1KOrSVdYWAtnIXw2/JC72va9meVRztoRfw
 aLxHaJdq4cBDA82rydyy2woW2JtdhCle48zsY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724309219; x=1724914019;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8PKT7sjGktvi1hrrMiQcV4qsyDxjdMEYuTJhST1ej0Q=;
 b=u+rs9PWgCzvyMGWZqpE2lU1h2C+Wgc8Xx2jWZmaH8BNaCeSzSWXtztqj55bjRdNzAD
 AdJPRhLyF5qJV34M/lZSLNk8wzBhd/UYIDm9diOkzZL74+2QOkWHAdRsMn03XmXwUT4R
 YvO3y+VhuyhMNl/CUAYQ7qas1WCaYB9h8IpCbEx5feywDCPOvrgajBfAEY9FqE9rJFzi
 9rBJvRguJTubq9Xt7A2o4Vke8yY190BdO20o8KObVAAzZP2DpeIgZeFnLVzPLJpj2EVQ
 hi6q7mLf1nliKGQ9taPC3arRvHFoYt4iGdeOqMQTdpMgL7Ek5R9iPPtTYpPljAwLK8HG
 NalA==
X-Gm-Message-State: AOJu0Ywx1MW/bMxzsz5mHIBJCiQ4q9g58vpEMOuHHEn3vAVFWL2/Qexb
 bWaad+muhbCYHRTUPxn7J7WMuLsnv2u1d8ikn50I6YYOEZKg0NfKkWxhu0qzag==
X-Google-Smtp-Source: AGHT+IF05n9K3CL+M63P08MGc6+22/ERQOuhVD94PT0FR2/G0i0HFMNVwflN0PwwvODsfTnybf75Vw==
X-Received: by 2002:a17:902:c94e:b0:202:1547:66ad with SMTP id
 d9443c01a7336-20388e34ce7mr10308775ad.65.1724309219112; 
 Wed, 21 Aug 2024 23:46:59 -0700 (PDT)
Received: from localhost (185.174.143.34.bc.googleusercontent.com.
 [34.143.174.185]) by smtp.gmail.com with UTF8SMTPSA id
 d9443c01a7336-2038558137csm6046845ad.99.2024.08.21.23.46.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Aug 2024 23:46:58 -0700 (PDT)
From: Rohit Agarwal <rohiagar@chromium.org>
To: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com,
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, ck.hu@mediatek.com,
 jitao.shi@mediatek.com
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Rohit Agarwal <rohiagar@chromium.org>
Subject: [PATCH v3 0/3] Devicetree updates for MT8186
Date: Thu, 22 Aug 2024 06:46:47 +0000
Message-ID: <20240822064650.1473930-1-rohiagar@chromium.org>
X-Mailer: git-send-email 2.46.0.295.g3b9ea8a38a-goog
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

Hi,

Changes in v3:
 - Update some formatting errors in the bindings patch.

Changes in v2:
 - Update the binding to include power domain in only some
   specific variants.

This series updates the DPI node to add power domain and
adds the Mediatek SVS node as well to MT8186.

Thanks,
Rohit.

Rohit Agarwal (3):
  dt-bindings: display: mediatek: dpi: Add power domains
  arm64: dts: mediatek: mt8186: Add power domain for DPI
  arm64: dts: mediatek: mt8186: Add svs node

 .../display/mediatek/mediatek,dpi.yaml        | 17 +++++++++++++++
 arch/arm64/boot/dts/mediatek/mt8186.dtsi      | 21 +++++++++++++++++++
 2 files changed, 38 insertions(+)

-- 
2.46.0.295.g3b9ea8a38a-goog

