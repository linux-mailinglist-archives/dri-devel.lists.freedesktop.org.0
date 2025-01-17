Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43892A14BE9
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2025 10:15:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9605B10E2F4;
	Fri, 17 Jan 2025 09:15:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="hYGieTiq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7390C10E2F4
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2025 09:15:48 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-216426b0865so32161085ad.0
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2025 01:15:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1737105288; x=1737710088; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3gWXakbHgB5iMmIuN6yvz2ugNZNRQpwCC7j+Jd2K3sY=;
 b=hYGieTiq7WVbom1mVWsQNvPCOJ7S0jNzmdGqhSGwgbng19q9oq67iJPmIhi4kEXhG+
 W0wIG9TgXZfR+XQ1iBt6+ezXC2HCdjlUtllSfW1W8fa8fF6brw4w+v1Wmjy9QDP8OgUv
 5yfViYFb1AeAySjwtaeBPvgqXeZSvUgFjFmxz1uRTd0qvbUINQI2c1s1WO3+brJcs9x7
 cfuPVttoqMIBBywckLH6HPV24h4QqI0R5SKi80G3qPN2y+UwOnx+w2hDsG1v3vfHMz/4
 Rzdvtrli+y8j3iuW0KNR41JLSCmVmFNRcsNLdtFIwDYHhBzfxpIMX/3McBUARPcxMm7r
 THxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737105288; x=1737710088;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3gWXakbHgB5iMmIuN6yvz2ugNZNRQpwCC7j+Jd2K3sY=;
 b=jEUASZI3qSBmjZvvf5FoI+deJvBuW4X3i5iwG852wAgPLVUrtLMNsfXFrRDJ/dMtFe
 eSRhxsEwAwAR+QdO1mv52ZmdOvwvb3qDKMmBxCBTv0zjv4mvuNvwR6/ltnObRDdgL014
 TVaBAF9B4NX6qo1s3tkudP6x/S3z3BWPg9Qvjp2EFr+zu+/NqfTPjBc7xSS5r0IS25mM
 Niku14OrVrFe5QBjUeJXqsfKg+34mKnVFqjxtInAXPPFIofrjnIjGlb3RWJO8+yYVPRL
 Y41vavY4bbI7VFV3vksW5D3ps17B06tO7uZfIs06R2wUcRlT31ARY+Fh2CSCgJIAjsf6
 Thrg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW8lFPnTM4/o0s0t8qFb/r4qqsx+d2RE5TwsADt5zTDGkDd/L6keY15ht0th7Cw0u+YWnGT/X+6QEs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzYq5xk5sPRjYv9KOG9l9Kt5OGZrcR+PzJM6dbFXpgeYS+gt11b
 g32kHjR6sc13SeKF7Ql0KYde3YFbh2nDs10yfsJRvnst+pazxXjrttcC54oZfio=
X-Gm-Gg: ASbGncvLuVblJ+x8NFCQ4A76L+HvqE/IgGBN9brv/+fY8iB82TVOi8SH+/rNnBmpWWn
 CVNvGn74Gi74NiSjwRcAUY8dQwJ/g7bG/1fvNW6ENSbsvaNDKV3pj/6fDIY6oRgez8kynSb4T/5
 sjHSZr3aPxLS/DdjnCrEF+3KV48lGSKNS8IoFqjdEkVPMijL5SN7Bt1mh3P9kTlL3ztgP+bN6Fl
 26TziuUeOODN3JJybhuRQEHbuoFQj8hnQJKNogl3JjW6j2xnHz6uGlLs5WHwnXPom7CO8Sm4FcB
 zLVfJNalb3rZ4OV1U/YhJ7pL3LCY
X-Google-Smtp-Source: AGHT+IGld8+38ABLyxgpL6rBqG8jXM4I/MF9pggqcLYDHPJGhIvYfsKXzvqLOtrAUQ1W6y5Dhp/nUA==
X-Received: by 2002:a05:6a00:2444:b0:725:e37d:cd36 with SMTP id
 d2e1a72fcca58-72daf929e6cmr3480886b3a.2.1737105288003; 
 Fri, 17 Jan 2025 01:14:48 -0800 (PST)
Received: from dgp100339560-01.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72dab815bccsm1421548b3a.56.2025.01.17.01.14.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jan 2025 01:14:47 -0800 (PST)
From: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
To: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, thierry.reding@gmail.com, sam@ravnborg.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
Subject: [PATCH v3 0/4] Resend and include all necessary To entries
Date: Fri, 17 Jan 2025 17:14:34 +0800
Message-Id: <20250117091438.1486732-1-yelangyan@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.34.1
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

Fix the workflow of the previous email and resend it with all necessary recipient entries

Changes in v3:
- Link to v2: https://lore.kernel.org/all/20250117050410.933312-1-yelangyan@huaqin.corp-partner.google.com/

Changes in v2:
- PATCH 1/4: Add compatible for KINGDISPLAY KD110N11-51IE
- PATCH 2/4: Add compatible for STARRY 2082109QFH040022-50E
- Link to v1: https://lore.kernel.org/all/20250116130530.3010117-1-yelangyan@huaqin.corp-partner.google.com/

Langyan Ye (4):
  dt-bindings: display: panel: Add compatible for KINGDISPLAY
    KD110N11-51IE
  dt-bindings: display: panel: Add compatible for STARRY
    2082109QFH040022-50E
  drm/panel: boe-tv101wum-nl6: support for kingdisplay-kd110n11-51ie
    MIPI-DSI panel
  drm/panel: boe-tv101wum-nl6: support for starry-2082109qfh040022-50e
    MIPI-DSI panel

 .../display/panel/boe,tv101wum-nl6.yaml       |   4 +
 .../gpu/drm/panel/panel-boe-tv101wum-nl6.c    | 270 ++++++++++++++++++
 2 files changed, 274 insertions(+)

-- 
2.34.1

