Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7183989EB98
	for <lists+dri-devel@lfdr.de>; Wed, 10 Apr 2024 09:15:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CBE8112A1D;
	Wed, 10 Apr 2024 07:14:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="o+3Cbu0V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F9E9112A1D
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Apr 2024 07:14:56 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id
 d2e1a72fcca58-6ed3cafd766so2340251b3a.0
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Apr 2024 00:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1712733296; x=1713338096; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=oIMOd1zj3gkMdcIscBRTSVUzcEAoxAPXNWZxjmNC33Y=;
 b=o+3Cbu0VX3UudLq6zMTSAly+EkxL5KRA2JxUZUbn0y3DCDQD4taClYouPcnW874FFN
 ZWSPH+UiLLmdVJrTFg3CLP3SBUdY2KsoPAEo8h89Ihf40gwP2vtcUXgf4+Dc/wIaomLK
 5/p2fcfEViXvFFe6lEm7IzHyiTzqQFuenPPNvnhE5IDbPUkiKjUOytvVUXwkZDjPGEq9
 rMY3ZzgVBVtpk2tjxmoor0ru0yjHjU4RA16rW3Rt604VVTvZqCwe4lDcCpytg6jRXhwS
 WCtPzM4Z5qXozeYyuBPx5SBVJrWi/7S5TgJZE75GHXr0Jy6U4naF60j/w4erBU85Rhws
 Eswg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712733296; x=1713338096;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oIMOd1zj3gkMdcIscBRTSVUzcEAoxAPXNWZxjmNC33Y=;
 b=kRTwkb6l5UOx/D+Zw0GrPpStbpZPEikwgOiPRyYWf9ZoqLW8xJu033SS+IwUb2vJC0
 yZGr1DMdb7oWPOx+ODZVs1RZMvcxa64MKiZezJt+4RfgCjLqWCy7OJ4PztQNspFwwKU2
 x10GQP6gqu4G/675gnK3lubic5HYusU99ajWYP+/Fc/ohBmthPreJZqG4qk0gJby/dcj
 LqhlBG1IXMVlipqjkVHgWtQv7Qz9xesENshuWoXCwQsYWRzeUZ8JGTw/asVyubZDjeIc
 avpf0iDtiTVpxLJyBQPjH6Xq5HEWA+Qbs1KBXaMDcAJAUAiDwS3a5MfossNx9vsTL5dg
 aBQQ==
X-Gm-Message-State: AOJu0YyQaMmUoNzgvsLs+shNdnZKw10USo8Uz202fmPR+QbXvzm/41fV
 AyfBaEP7E+3zhwa3S5qe9BZgQOrHbNbyVMJPZiaXLW1IJAe987yfetVzchx1ts4=
X-Google-Smtp-Source: AGHT+IEVm6HJ8DLUI4GT5B2aoRikQtW20BaDdKOMt4/+udHIsI3m/VTV3o3lGXByhjg8ncO4JyMRtA==
X-Received: by 2002:a05:6a20:9698:b0:1a8:4254:5cdf with SMTP id
 hp24-20020a056a20969800b001a842545cdfmr1796798pzc.22.1712733295666; 
 Wed, 10 Apr 2024 00:14:55 -0700 (PDT)
Received: from localhost.localdomain ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 z17-20020a170903409100b001e264b50964sm10107975plc.205.2024.04.10.00.14.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Apr 2024 00:14:55 -0700 (PDT)
From: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
To: sam@ravnborg.org, neil.armstrong@linaro.org, daniel@ffwll.ch,
 dianders@chromium.org, airlied@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>
Subject: [PATCH v1 0/2] Support BOE nv110wum-l60 and IVO t109nw41 MIPI-DSI
 panel
Date: Wed, 10 Apr 2024 15:14:35 +0800
Message-Id: <20240410071439.2152588-1-yangcong5@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
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

BOE nv110wum-l60 and IVO t109nw41 both 11.0" WUXGA TFT LCD panel,
which fits in nicely with the existing panel-boe-tv101wum-nl6 driver.
Add compatible for BOE nv110wum-l60 and IVO t109nw41
in dt-bindings.

Cong Yang (4):
  dt-bindings: display: panel: Add compatible for BOE nv110wum-l60
  drm/panel: boe-tv101wum-nl6: Support for BOE nv110wum-l60 MIPI-DSI
    panel
  dt-bindings: display: panel: Add compatible for IVO t109nw41
  drm/panel: boe-tv101wum-nl6: Support for IVO t109nw41 MIPI-DSI panel

 .../display/panel/boe,tv101wum-nl6.yaml       |   4 +
 .../gpu/drm/panel/panel-boe-tv101wum-nl6.c    | 213 ++++++++++++++++++
 2 files changed, 217 insertions(+)

-- 
2.25.1

