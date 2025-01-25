Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09322A1C1B4
	for <lists+dri-devel@lfdr.de>; Sat, 25 Jan 2025 07:47:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6568010EAAB;
	Sat, 25 Jan 2025 06:47:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="f2CZRE5P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com
 [209.85.166.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACFC510EA79;
 Sat, 25 Jan 2025 06:47:35 +0000 (UTC)
Received: by mail-il1-f179.google.com with SMTP id
 e9e14a558f8ab-3cf8f2c34a5so22290195ab.0; 
 Fri, 24 Jan 2025 22:47:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737787655; x=1738392455; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mb4Ui0ZOoqST0yf5w9jN+3KbZ6kX8awp7t6bwBFZ2Yw=;
 b=f2CZRE5PEz1XsMmfZbL4f5V8xU6PgtxMyrKqroJB+6WUd2A0qeTq+0f7JqNyMqVlZr
 KvKpnw81b2n+yJPW2Ehl7Sc2sOB1na+i3xEG61H+CNhmPRdjfQWyXxOFAywDYwr6bhNP
 8Q73BphLPepIV8njq/VViKVqpht10/Ymuoly+KExIRTcZqFU4BC7cl2/AkNUb8CuZRri
 Q1U6/TQYk9wF4xBIDzDZWyZ1qJqtVhMcY1jhseXQBflqLXfIlAhoJ9qiZ1ZYyMokfYAr
 bRQIGiLCEYfH+SZx4YnWlgMXSE34c3uFzoWq0cg/auFIgTyysHE5OSVboDP8vwQaKZve
 3mWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737787655; x=1738392455;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mb4Ui0ZOoqST0yf5w9jN+3KbZ6kX8awp7t6bwBFZ2Yw=;
 b=kUnxI7KGreulmPSsTmhI39aUjhaaTJxT3BeAR7qXPaRRubUP+sZuHKwiBRsQr9O6o/
 6dp85k1HG+RZ79h2qEMUFePqEGu2iSxtIviWkvag4VpYKRuEl1oFdQaT4wZ3KgN0wuis
 lUmkFsm2yrShR9xJB7n0F07o2U7lwX0Dl51LX+7/zfuTKh68HE5FBWQXj33vPcW0GwjK
 ZOxaMD7Cj7cvmF1w7n6t/uuAOQXlyLk+ed97aIS2MHGe2QYbeWq5sMnaIZsaHXb2tL9R
 zcalmYJFDA8EFkrB7dg+FoITfV0O6h84f9ecG8jhrAPWii2AUbSgmdlELnZb7TzXi1XC
 6AKw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVH98sp1I6XE3XzPqCQ8nnQb6/zxoJQM5BAREGF+hGs+Iax4h8di2/8TlbM0EbD86aEi9FFyUB+@lists.freedesktop.org,
 AJvYcCVI14psPjRZ2GCH3vSqzcDVHizjukCJnr6aK1fKW0rOIJ+fwVzv0nkcr3oeHN20L6l8b9uG9YZ3rK+a@lists.freedesktop.org,
 AJvYcCVY8shGCKqWWr939oQvY8VxFSzX3w4Cichpbb7Wz6wisWrEROwFszb/cyMitk285GOIRzzvP50Q1tVO@lists.freedesktop.org,
 AJvYcCW7tqEEWzf6g+Ybw41JDYKE1uUSrIjLP2K8RB/BKVZIWfuPs6DhsyS6/5SpZAcX68KOCJq4kSZDPsCWeKRpcw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxV4roItd6WIbdL2ub1kBfO3TgS9WUdd8rcxBnveYCk6mtNsqYZ
 M1eHIi1HzRLeyNolB26tMS3JQHxTQHmRJEoHYl21S5KGEc1iK7M5
X-Gm-Gg: ASbGncsreSy1Ii+grhPVv6TFAkXiZUI5vrEtyKmYW73odZbUDUERAalik0c77dtt8dY
 s7F9BCFNwVGtKaX1ZuIHyVIrCaKF4RTQWq1SHV1B91pxXnO2P1O1L9Nmi/2osEtv9SqyWIB8uDI
 qUepBShlPAmpV48who2y4a6Sg/g6hSeUV65rq5odYM8uZ/WihEMD8KyZ2TGODszgerM+keNjPxG
 qTo+6KjZxpK+gVpmr8bb0P+LJW8z1oW6PkCgKeQEAbev/Sb1ZC3mQHjt8kKX0D2QkJBvlfbNM+7
 DcUT28R+pSmK1CjQv6ZabL81O6WC6Rwf56eSyA==
X-Google-Smtp-Source: AGHT+IGfeKDyplrBtzVGoQ5v51IvfRsTEUeek1sQmLZ+1EABwZiHBKfjiwWPAysM1nJz2q+YUDvJ5Q==
X-Received: by 2002:a05:6e02:1f12:b0:3cf:bb6e:3065 with SMTP id
 e9e14a558f8ab-3cfbb6e3a3fmr100200135ab.0.1737787655039; 
 Fri, 24 Jan 2025 22:47:35 -0800 (PST)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-4ec1da476fesm1174144173.58.2025.01.24.22.47.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 22:47:34 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org
Cc: intel-gfx-trybot@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH 54/63] drm-dyndbg: add DRM_CLASSMAP_USE to gma500 driver
Date: Fri, 24 Jan 2025 23:46:08 -0700
Message-ID: <20250125064619.8305-55-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250125064619.8305-1-jim.cromie@gmail.com>
References: <20250125064619.8305-1-jim.cromie@gmail.com>
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

The gma500 has 126 DRM_UT_* debugs, make them controllable when
CONFIG_DRM_USE_DYNAMIC_DEBUG=y by telling dyndbg that the module has
class'd debugs.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/gma500/psb_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/gma500/psb_drv.c b/drivers/gpu/drm/gma500/psb_drv.c
index c419ebbc49ec..0d53806b6f72 100644
--- a/drivers/gpu/drm/gma500/psb_drv.c
+++ b/drivers/gpu/drm/gma500/psb_drv.c
@@ -40,6 +40,8 @@
 static const struct drm_driver driver;
 static int psb_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent);
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 /*
  * The table below contains a mapping of the PCI vendor ID and the PCI Device ID
  * to the different groups of PowerVR 5-series chip designs
-- 
2.48.1

