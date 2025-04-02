Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33E21A78A3E
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 10:44:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BDAB10E719;
	Wed,  2 Apr 2025 08:44:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="eNVHPxZu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEF1E10E719
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Apr 2025 08:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1743583455;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=RQ9F23d/E9HJNDDDljLarJECPDlSPcnwq/hZlSgkDp4=;
 b=eNVHPxZury+k7Z9ktVPZIH0Gqtdl4UGu0ZoLKnCGza0BmAhNrVzPQCL6qTlibhGS+mTTWH
 i1h185wWn/Q8XxoOIS/4aPSVHqcgdb2OwDcGkGewojZtXaXZtMfN+kBzgzpyWilrN+2bgX
 tNMzMwf07bKJeuh85Mxg/q18uyha8OY=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-403-i73XnF9FPOyWdgFCpSb3Yg-1; Wed, 02 Apr 2025 04:44:13 -0400
X-MC-Unique: i73XnF9FPOyWdgFCpSb3Yg-1
X-Mimecast-MFC-AGG-ID: i73XnF9FPOyWdgFCpSb3Yg_1743583453
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-2240a960f9cso110562935ad.0
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Apr 2025 01:44:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743583452; x=1744188252;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RQ9F23d/E9HJNDDDljLarJECPDlSPcnwq/hZlSgkDp4=;
 b=fwlV4IfGnC3fm27DVRGVddiP0Ju1QussPQAPnyccX7i1tdr74s1J4q7bHMmCyxEsC2
 qKucPpspSFnPgyUtoDw5SFCkTBEW01yKdIfmHkUWeMnTQzTPBiupxGyT7+q+9/eHfxnY
 UF0FJGo18AMnI++g/wt7TEh+Y+B6av72l2+Sb4G0mA5GeB9Rputj7IlFR+8G+OVUoy/B
 F7XMjcjrYW97xlgQlftg0x5q3TMZezcj36lM0I8ij/ON1rdAj4E/f0Mqv+gea5rWARoX
 smHa99e3MnSCUM4qPTad88TW6TIGHdlf5Ii10UpAUIlyYMud8FJpVWN0Ht4y8DFnx5Wz
 58NQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVuv4iZDxWyzd7tFd9e/skRus2qCYu1ZESAeN82ki8Y8+l7Q3SAkzV6ioECxwwqy0j2Hp5KeRevTrU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzgB2ca+oVnW3mlPdBTChm5DJXNLt/MXaXfHlNo/0HZZY9Rw8Z3
 KyiuEUFfRW52YStwKiWkqhrL+Lf/MXjxzth97vx5odyEUJOhk1CfPxjz9/Ip/nFGi8Z2/lgpUQg
 mxdr4GdDznbpZaqe4GMpVAQESaEGlrKNx4fr2xSqJCFZn0TdbcwPHrHB2HmnueEC50w==
X-Gm-Gg: ASbGncsfqUs7JGBG2L2f4rW/E5kB2hwso76Zp8uR/9qUcaPivERWpYTyrwmBE2NQrWy
 UV9+h3NjUpBcVd0LZN6Q4gJ77AQiTrgvygvx/+deYKyTVFDj1lIc3N1bujC/YZ2DPBzuwBT7mcK
 6+QuoNydW7Rk5xgXTiGpta2XGMfFM/smkVTbITcs+G3hYCM4ixB4kZB4q7ZGUHSg1qwfS6suFG3
 Aye3UGhzNl15mL6Wyta4greSWN5hNYC9LsY9+Clo4DgM8z4s6WUKg3ud2bBY34Dllf7BOJ8Z6GB
 rUNnISJ0Uk9vKUyt
X-Received: by 2002:a17:902:d2cc:b0:21f:2ded:76ea with SMTP id
 d9443c01a7336-2292f9d4e12mr213521395ad.36.1743583452644; 
 Wed, 02 Apr 2025 01:44:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF6cYnX2gSNL4YcbMp3FSSrc8XCOSZrJOBdqY+cHTmSYJDx7efPUiNv5+ClDhwWFeSdIiQTdQ==
X-Received: by 2002:a17:902:d2cc:b0:21f:2ded:76ea with SMTP id
 d9443c01a7336-2292f9d4e12mr213521185ad.36.1743583452281; 
 Wed, 02 Apr 2025 01:44:12 -0700 (PDT)
Received: from zeus.elecom ([240b:10:83a2:bd00:6e35:f2f5:2e21:ae3a])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2291f1f7394sm102202645ad.225.2025.04.02.01.44.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Apr 2025 01:44:11 -0700 (PDT)
From: Ryosuke Yasuoka <ryasuoka@redhat.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, drawat.floss@gmail.com,
 jfalempe@redhat.com
Cc: Ryosuke Yasuoka <ryasuoka@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-hyperv@vger.kernel.org
Subject: [PATCH RFC drm-next 0/1] Add support for drm_panic
Date: Wed,  2 Apr 2025 17:43:48 +0900
Message-ID: <20250402084351.1545536-1-ryasuoka@redhat.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: rhx9GacNd6T0XqNVViD4PQHxyEil2SXwdfpAIjdIaeM_1743583453
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
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

This patch adds drm_panic support for hyperv-drm driver. This function
works but it's still needed to brush up. Let me hear your opinions.

Once kernel panic occurs we expect to see a panic screen. However, to
see the screen, I need to close/re-open the graphic console client
window. As the panic screen shows correctly in the small preview
window in Hyper-V manager and debugfs API for drm_panic works correctly,
I think kernel needs to send signal to Hyper-V host that the console
client refreshes, but I have no idea what kind of signal is needed.

This patch is tested on Hyper-V 2022.

Ryosuke Yasuoka (1):
  drm/hyperv: Add support for drm_panic

 drivers/gpu/drm/drm_simple_kms_helper.c     | 26 +++++++++++++
 drivers/gpu/drm/hyperv/hyperv_drm_modeset.c | 42 +++++++++++++++++++++
 include/drm/drm_simple_kms_helper.h         | 22 +++++++++++
 3 files changed, 90 insertions(+)


base-commit: cf05922d63e2ae6a9b1b52ff5236a44c3b29f78c
-- 
2.48.1

