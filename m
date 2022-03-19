Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 484A64DEA52
	for <lists+dri-devel@lfdr.de>; Sat, 19 Mar 2022 20:15:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88C6610E378;
	Sat, 19 Mar 2022 19:14:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03A8410E5E9
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Mar 2022 14:59:45 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id d10so22026699eje.10
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Mar 2022 07:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pqrs.dk; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Un98TWN0bbthuEn4ebu9fEG7PBhy2GZCpdv54lxLkpM=;
 b=IAUbWl0Uagk19yLVwRpqPwmPOCYwVq5Ux9RkjGwj4eM4vGmQ0iImKVnKbKmIcMS6Nq
 JSEPUgnl34KTzHF6wwbC3eYG298jybkhu4kQdsjIhNJOV5sDOL+JdQaISAKexqJ8C+t1
 0qdkXNg5iCcMw3qGr0c0XipDBb0sRB1RkCd0I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Un98TWN0bbthuEn4ebu9fEG7PBhy2GZCpdv54lxLkpM=;
 b=rYbrYrV9Vqe7N1G5FsxPS8LKi0+coZ8fvxkJsb3KIPK6aZaVoiZ+T59u4pTFA851hB
 KBlIuIh4PdRUugTmU+fnlAP+Q8G5MOELY0iTITIoHpafUcT6Ho7Sbw/Y+LXDzzXNCVVE
 HqeeLaNNX2GMMlF0r/mysD3RinNsmKrhqOb1IstovbGERDpbnvvtdCQS67UtGMW88Glx
 9cNBxyjhhbbnciyxcnyslmOR5m3Wkd0TYO6SX65QsoH0562jg4zhqaIoRkQ98EHeTjMF
 ZQWj3eBKu7tgCyrafAY1WbiRqcnL8qpGoS1/ZkJc/6qS28xBp/eHoifhxv269GPsG0Fa
 DRbw==
X-Gm-Message-State: AOAM530RMkTOEBInljOzW8SFJqGH3/QqqWU2aFUl0jRF10+UTU6ttFuj
 C9YYanjTtFlAdKljYd+lNMNIRA==
X-Google-Smtp-Source: ABdhPJzSd3AnRcUe4wVCLYAoFppqJH2n2gxgiQFSvgJ3xO5CqntK/G4uH9t8BBrEByHdEWFR8J29eg==
X-Received: by 2002:a17:906:2695:b0:6ce:b94d:9f07 with SMTP id
 t21-20020a170906269500b006ceb94d9f07mr13588934ejc.297.1647701984055; 
 Sat, 19 Mar 2022 07:59:44 -0700 (PDT)
Received: from capella.. (80.71.142.18.ipv4.parknet.dk. [80.71.142.18])
 by smtp.gmail.com with ESMTPSA id
 m25-20020a170906161900b006d43be5b95fsm4923329ejd.118.2022.03.19.07.59.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Mar 2022 07:59:43 -0700 (PDT)
From: =?UTF-8?q?Alvin=20=C5=A0ipraga?= <alvin@pqrs.dk>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Archit Taneja <architt@codeaurora.org>,
 Hans Verkuil <hans.verkuil@cisco.com>
Subject: [PATCH 0/2] drm: bridge: adv7511: two fixes for CEC
Date: Sat, 19 Mar 2022 15:59:37 +0100
Message-Id: <20220319145939.978087-1-alvin@pqrs.dk>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 19 Mar 2022 19:14:45 +0000
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
 =?UTF-8?q?Alvin=20=C5=A0ipraga?= <alsi@bang-olufsen.dk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Alvin Šipraga <alsi@bang-olufsen.dk>

The patches are sent against drm-misc-next. Thanks!

Alvin Šipraga (2):
  drm: bridge: adv7511: fix CEC power down control register offset
  drm: bridge: adv7511: unregister cec i2c device after cec adapter

 drivers/gpu/drm/bridge/adv7511/adv7511.h     | 5 +----
 drivers/gpu/drm/bridge/adv7511/adv7511_cec.c | 4 ++--
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 5 ++---
 3 files changed, 5 insertions(+), 9 deletions(-)

-- 
2.35.1

