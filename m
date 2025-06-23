Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 670CBAE554B
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jun 2025 00:09:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB9F310E467;
	Mon, 23 Jun 2025 22:09:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=darkrefraction-com.20230601.gappssmtp.com header.i=@darkrefraction-com.20230601.gappssmtp.com header.b="MWEpLuoX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com
 [209.85.222.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A74510E467
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jun 2025 22:09:46 +0000 (UTC)
Received: by mail-qk1-f173.google.com with SMTP id
 af79cd13be357-7d3dd14a7edso777779785a.2
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jun 2025 15:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=darkrefraction-com.20230601.gappssmtp.com; s=20230601; t=1750716585;
 x=1751321385; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=a6Itdrajtub6A7UvqXvcGrPAJtKcMtzT+DoBQUAOCEc=;
 b=MWEpLuoXSgHS3gdxacPjKkLqdk3TwnTfdrqGXAS5tr8kQgtvwijjK1xY52FBPEoCPU
 le+2FMWa8MrkNZxI0yJjauOkNF2d3s5QibJiHCIvRhc7FiwCZIENGYDCy2XZPKmWI0S6
 DfoEYj1tswZFqcjoTsb5Y1hjDNVYuzMl+cY3d651jkFYGAEUb0SGY0ntNN+UPym7+EJ1
 aoL9+JTF1B5N/KbH9aj4dmnyqWLvjX+IFeiFYj5WtPnw4gD2jCQSppVa0HENfqBXGMJA
 a8WeD0rzXr2ORvuluUGXd+6viKEm+rm42gZfq60BF184I6GE75wUXf3nqUh1g3ApTaas
 usUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750716585; x=1751321385;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=a6Itdrajtub6A7UvqXvcGrPAJtKcMtzT+DoBQUAOCEc=;
 b=N1dKNvYCSYciJv+DQQDAQYpmtdzhPrSj951djUWd/PblGhpn8E/bFpyCDfdFkjekkW
 MfrK8SVRUSoZtRILLZAqiqOMTgApTrWXXw7zktzl+H0Keh226+Z2bgXO95nDevOIASHt
 4fsk02kqoHcp68yykWVoKt9HovjinweKwNmyTuZrZWMJGNmSRIkOUMcnptnWO7J7r2rO
 A0Fsy2oGViYqJziD86om5EHXMNGgVsqcV7DXF9IQWnDEMfG7ZHXQggeD+1uTcimhHQKh
 fOPHiyKb3+g7jtmkQCpwmgC3RU0M7wHLsjanBneGfgsx8sBXhSyVfbwGoqcdn8SVHzAq
 Mmng==
X-Forwarded-Encrypted: i=1;
 AJvYcCVVFe8RZlexYEQrzG1u1u/qpEcEAhavo7N1AWJoGGBOTKn7grlKzZpJsST6XpaxdpXXN87ezri/Iu8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyuq4RgsfkzFcOjw0YJJfGuo8+EL+U0WRH9aNmmtPMAAahgKIWQ
 K9qPqT7vGqIBzIijGWo8rhDaKveJJlUVMq8MwEQfYBMXEoPqMJHlFRQ4Mwg7bQOKUKU=
X-Gm-Gg: ASbGncsBT2BNPV/szwMDjLeQ3C4TvEILFfv0PCEXrXFZY2wE1PFC+j6usDvQqSz4sC8
 VpfK27gKm1s879PQAT2n93xUd1vWDRVTwaQub2jO3iKw069/PLdCQYd/3zKw0yWmPL/FmklANm1
 cyOmPdovjFjDimaFaQHRvVDlneMn1GQmv4R9mwthS5daQCF9kpiQTdN9jwb4/JAHTD+AY2/Vdtx
 F6KlVcsJF4HdwKYJzaI5+GPQs2KtnbjVkNxMB29n5svQ4/DMDaDzgyjPTYCTkNY1wmJs1mCDMpr
 Ren6AYzsaYTpsgA3gTCBp+IhIc3wjmXYPNZCuJ2PNmcpE9d4auZcVtHNTdoZlarDsuOStwzANkR
 3fP27XIXiEg/o7lHKa2UYgD4qjFWmzOuT8+b6GcZ4HezJvBdqFVU=
X-Google-Smtp-Source: AGHT+IEDt6kybhGAY1jpZltfpu6uVp4P3y+iM+WcPgbCnfImQA0JN2So/u+8H6r/LrtI2lF8hDVc3g==
X-Received: by 2002:a05:620a:444a:b0:7d2:2780:c6e9 with SMTP id
 af79cd13be357-7d3f98c3b76mr1871441085a.2.1750716585138; 
 Mon, 23 Jun 2025 15:09:45 -0700 (PDT)
Received: from m-kiwi.verizon.net (pool-71-167-25-61.nycmny.fios.verizon.net.
 [71.167.25.61]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6fd09425af6sm50019856d6.27.2025.06.23.15.09.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jun 2025 15:09:44 -0700 (PDT)
From: Mel Henning <mhenning@darkrefraction.com>
To: Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Faith Ekstrand <faith.ekstrand@collabora.com>, ttabi@nvidia.com,
 bskeggs@nvidia.com, martin.peres@free.fr, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Cc: Mel Henning <mhenning@darkrefraction.com>
Subject: [PATCH 0/2] drm/nouveau: Remove DRM_NOUVEAU_GSP_DEFAULT config
Date: Mon, 23 Jun 2025 18:04:00 -0400
Message-ID: <20250623220909.7591-1-mhenning@darkrefraction.com>
X-Mailer: git-send-email 2.50.0
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

Following earlier discussion at
https://lists.freedesktop.org/archives/nouveau/2025-June/047887.html
this series removes DRM_NOUVEAU_GSP_DEFAULT.

Mel Henning (2):
  drm/nouveau: Remove DRM_NOUVEAU_GSP_DEFAULT config
  drm/nouveau: Remove nvkm_gsp_fwif.enable

 drivers/gpu/drm/nouveau/Kconfig                 | 8 --------
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c | 4 ++--
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/gb100.c | 2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/gb202.c | 2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/gh100.c | 2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h  | 1 -
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c | 6 +-----
 7 files changed, 6 insertions(+), 19 deletions(-)

-- 
2.50.0

