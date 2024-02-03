Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F27288488EB
	for <lists+dri-devel@lfdr.de>; Sat,  3 Feb 2024 22:20:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0674F10FD1A;
	Sat,  3 Feb 2024 21:20:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=marliere.net header.i=@marliere.net header.b="Q8nZDUpm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA93B10F748
 for <dri-devel@lists.freedesktop.org>; Sat,  3 Feb 2024 18:24:40 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-1d93f2c3701so16973715ad.3
 for <dri-devel@lists.freedesktop.org>; Sat, 03 Feb 2024 10:24:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706984680; x=1707589480;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:dkim-signature:from:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=1tBtDof9oDKavazJV1vIQGt3aWtLYVYOxE0CKitiEaw=;
 b=lLsdomBzhvrBw9Yo8idhMJ/mh1WlMcAsaUU/B/Q+4PkGYCqWaggN3bSEvW7H5SYlXd
 adqYPNZ+WRYLUY3fpBfH5o2IcQEr2wOKuLKTSARbhWaxI+kEw6A3q9y1MViCXSkoxEoI
 RdKe3zyI/3d8b2OqrDq559NjnvB1ZxpThrUL4vPQuQsSJ1JDxY61xF0Zpu7yiuFcQ5Wb
 WlFBvsIxTsu5Fno9R2X50sBU9n8xXCeh2k21waI92RdCJwuIY8EiVTtapfolBFejmCOv
 eRHTucl6CH67t+Ot/8dtU7E7Yd3P80KJuPO+HKaGwOrfe2CeL0tTqnSvNzsBC9yxvzA4
 wkDA==
X-Gm-Message-State: AOJu0Yy1zAIwGy9MRL3vRqJ4NqA/MoRG0npPwKeYvZIc0L/4kgFgJoo4
 O8KXy3eeLzvFdu3CDuFYWz/1cYufDqZrCSYi7ZdlkqOovsjG5tIe+qexn4uUpghFNA==
X-Google-Smtp-Source: AGHT+IHWeVKFFPJ1I98e4sWPQC/ibyQF1vb9MVgoVL+efXw8lKv1v55lJY+x7za+d7oAmJy4712A1g==
X-Received: by 2002:a17:903:2092:b0:1d9:8ac8:d77b with SMTP id
 d18-20020a170903209200b001d98ac8d77bmr1626033plc.17.1706984680016; 
 Sat, 03 Feb 2024 10:24:40 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCVyA3rlykhNGs2+EmYfC2jAcPFRroT7xvdg349JtkDnXfqtFosnLhFQuOrSOo7p9j9lpS1IMFaoh2H6TQEyANPtyTqMXVS6wYXUhEhOehzMnVoWeD8xULi5/4XGHO3Ge9/ygDhSW06RZ9EBowj1i711Na8epXyFMzMUW34zj8jwW0XwH7+83P1lsUEN29CzPh+kAe9IxQv3+m3tCRnY+AeLvETRY3hSH5WXzZiulm3Hn88jaffy
Received: from mail.marliere.net ([24.199.118.162])
 by smtp.gmail.com with ESMTPSA id
 o11-20020a170903008b00b001d94c01ae96sm3549186pld.66.2024.02.03.10.24.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Feb 2024 10:24:39 -0800 (PST)
From: "Ricardo B. Marliere" <ricardo@marliere.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marliere.net;
 s=2023; t=1706984677;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=1tBtDof9oDKavazJV1vIQGt3aWtLYVYOxE0CKitiEaw=;
 b=Q8nZDUpmruOMasFb7BTyiRVYl6dDR/x30idja+v7A5WS+cdShSWMANwOn7hsvlmsdxcvMq
 yUsbnIBSoweQTCD2Utkg6v4uhLSJtucrW1/uLhrgWPsQBJdYmzqOqXAngRnx2bfVOVDSSb
 /GIpjLF/vh7c0jc0U/aqJ2KR4SRvTHUoJ02m3UNnq9zXxgIuZKcKEJPHji0ppwEwKN2LaS
 dMfUD1ezTqRzy+fH99y4JS5w10f06Nr1Ab4kyMN/W9U8YDrmBdNSZRVu5oeCNT8OOk2bUi
 q8l+AiEWJGjFKaXh/XlJv4yDqSwYozYovbOG8rJcPESbEYm1XZXlYhrgTS1vSw==
Authentication-Results: ORIGINATING;
 auth=pass smtp.auth=ricardo@marliere.net smtp.mailfrom=ricardo@marliere.net
Subject: [PATCH 0/2] drivers: drm: struct bus_type cleanup
Date: Sat, 03 Feb 2024 15:25:02 -0300
Message-Id: <20240203-bus_cleanup-gpu-v1-0-1b6ecdb5f941@marliere.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAP6EvmUC/x3MQQqAIBBA0avErBMmM6KuEhFpow2EiWIE0d2Tl
 m/x/wOJIlOCsXog0sWJT1/Q1BWYffWOBG/FIFEqlNgKndNiDlp9DsKFLNAO2PVKG5IKShUiWb7
 /4zS/7wfajb/cYQAAAA==
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Ricardo B. Marliere" <ricardo@marliere.net>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1369; i=ricardo@marliere.net; 
 h=from:subject:message-id;
 bh=EHsop8OSD89DvFIwCtnmWiC8KY/ajnvUqLfFEGNYwCc=; 
 b=owEBbQKS/ZANAwAKAckLinxjhlimAcsmYgBlvoUBZvjjLTROlWBYxpUUj+9QjyBFkHbTHXRD3
 svTQTQ0a7eJAjMEAAEKAB0WIQQDCo6eQk7jwGVXh+HJC4p8Y4ZYpgUCZb6FAQAKCRDJC4p8Y4ZY
 pqjWD/9IpjVqk5r3J+ZuT/if1aJo8N1Sji6/DMWy30pHg6VDHN9LQ/OyyRczPUo6ku/krvQeyE0
 JO2EUme1v5R3otlfkOxXpOu4ZuPEbgOw3dj/y788396vfOOvrDY4KkGBMmC8XrknilgQ//wyz3Z
 5Hbvi+Gd+MsoO4Uqy8NddimzIawaxcy9JcrW82bv4SVNwJFBDdANRjuWGVr12GrVDCRAqTj/aDR
 3p8BWaGw9vIMgwoIOJqIm29XX99fvJjto4ElJ36+Dhn8hNxLUgsgM1AcRkksE0n+ns95v6LznEN
 3c8DbkZzEQrLAoeVZFbdPVZs4ZnaHhIv3B3X0lU88vCmjgNxq5gLV3WXq4XE17b1ZMavXpyYcUd
 vPZ00nO/YzfyMwzmeuOP6SzbEgKGtwMuq5HKWmmrYuMTdtEolRaJdkMs1QK6LxtvDVlwAwXB0h8
 ulKp3u8qKg6D5KQrGpKN5h68Mxj9NJ6gQxDbRit2bdJ2tMcQO5QwAmOhg87M/Y1+UPnqF72gluU
 K8VuT2W5jxcM90YRE4evo1+7RG9HW3WYGc80prBwIwTsueDSI5TxFdl8eNI+baZNHFlNZJxlVre
 w2fasHxlB4sS/O5ay9gN0B5V+hl9hh3OkMiHTne0pxDX9AbGa3jkfLqejyORv04DZjJEemaR3rn
 H+jmCIPradmfTyA==
X-Developer-Key: i=ricardo@marliere.net; a=openpgp;
 fpr=030A8E9E424EE3C0655787E1C90B8A7C638658A6
X-Mailman-Approved-At: Sat, 03 Feb 2024 21:20:22 +0000
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

This series is part of an effort to cleanup the users of the driver
core, as can be seen in many recent patches authored by Greg across the
tree (e.g. [1]). Specifically, this series is part of the task of
splitting one of his TODOs [2].

---
[1]: https://lore.kernel.org/lkml/?q=f%3Agregkh%40linuxfoundation.org+s%3A%22make%22+and+s%3A%22const%22
[2]: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git/commit/?h=bus_cleanup&id=26105f537f0c60eacfeb430abd2e05d7ddcdd8aa

To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
To: David Airlie <airlied@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:  <dri-devel@lists.freedesktop.org>
Cc:  <linux-kernel@vger.kernel.org>
Signed-off-by: Ricardo B. Marliere <ricardo@marliere.net>

---
Ricardo B. Marliere (2):
      drm: display: make dp_aux_bus_type const
      drm: mipi-dsi: make mipi_dsi_bus_type const

 drivers/gpu/drm/display/drm_dp_aux_bus.c | 2 +-
 drivers/gpu/drm/drm_mipi_dsi.c           | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
---
base-commit: 3d94e7584486f7ac4a44fe215330ae6a1094e492
change-id: 20240203-bus_cleanup-gpu-0f90574bce24

Best regards,
-- 
Ricardo B. Marliere <ricardo@marliere.net>

