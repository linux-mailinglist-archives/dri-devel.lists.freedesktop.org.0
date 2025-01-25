Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2527EA1C1B7
	for <lists+dri-devel@lfdr.de>; Sat, 25 Jan 2025 07:48:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81AAC10EAAD;
	Sat, 25 Jan 2025 06:47:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="YX7Hu6Ib";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com
 [209.85.166.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA5A510EA8E;
 Sat, 25 Jan 2025 06:47:39 +0000 (UTC)
Received: by mail-il1-f181.google.com with SMTP id
 e9e14a558f8ab-3cf8c7b2dd5so8339615ab.0; 
 Fri, 24 Jan 2025 22:47:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737787659; x=1738392459; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VU+OXKhsA8muIGMedhlu9SK76WVthVv8XHWCwBdRt4U=;
 b=YX7Hu6Ibm/RjIwEFJuGZUo4sklr0sKAJ0b5mjzMxiWtbAveRKmoDw1umdS3RKoibFF
 +FiG1oyrYn3lSceHgEpZoBLll81M2hCQYikpfV8MXhmmWoA4cuPMS6krIyy4j1Q2Jld4
 uVleUSMUNG0zG7VL+TCUIZhEV/Z/5dAX1F1v1ZiVKFl6j4Mz9FvmWM/YX7yhJkbVXdR+
 NhpsQ0bqlfwaES2l0cM17OjzI+OZUZ3cMryRMwJiaNMZXZznnwBiCCg9POkTFk3bwCGk
 tyrvvhw/Ux65P04Dgd2b3TlMWACADo1Jna3zhIJDx1movgG1iHE9fciC58tXsfADQC6/
 pt0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737787659; x=1738392459;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VU+OXKhsA8muIGMedhlu9SK76WVthVv8XHWCwBdRt4U=;
 b=nDNq+UzI6BpqF6Zp7j/glLYX2uL0r6yFL4oxZFnfV2z8e90ovR61glwktNE4GRqJn/
 Vmpf74shPWKm4/0l27zGXzlfWchglQze28VloU8Zk+U2Xje9/PVwZ1+W3e9DgYicksaw
 7AA3i3DfgMYilYDZcEJD3WnqG3VTI7Q64OqCKdc44fheYXJZPRfqbc0ZLWwdkCePNLHw
 AxOq38EJlpiSMsSyaRk1i6Pm2popnMwd0C3qpHCUMCa9e9ExNksysOmq/vAHGdoe6+mW
 SC+FYAzuCfSRRJuhNZayx24VBJGIBKXaO/1jqqOQJON/DwCAA+iztou/FPzuIu9ujFL2
 EBaQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCViZqijZeLaYgLWyvfdAvcSf06VVXaWqMC6IFtoW48/8i7vGTQI5EeON2KHy2bETLPBrclYzprC0QxS@lists.freedesktop.org,
 AJvYcCWMFiIC6xPUYMocO97J5wZVrqBDsdcfZOAbztMnYZ66RD31deKEBfl9lyz5m43nYEdJy7/oiYBH@lists.freedesktop.org,
 AJvYcCX2xhfY1qij0feRt1m/FNXjI7/293VEnxm5QjFPbK3ys9rwp7aZwPgIkPpWl3reN33K569bc7U3vAXG04HD2w==@lists.freedesktop.org,
 AJvYcCXoUW2LiXYAHXrYyvjUSQ2qfFIPT/ORbSm9d+XkjPWV4ssuaUEAqVOKZUynCRJ7A+UWjZxlzLdqCjY1@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw7U5GV12uoB3JSRs3le/577d4PqwZo2RR4rkvjQ+ebKpgWj2Go
 L+hIz4RuwC/MmIRa5l/LUxo6LnDPy+VjWdnVanMySHquoyo2wV7H
X-Gm-Gg: ASbGncvJcsRhQaVvj6t7KSDuhbqjlu2Jam6UKbUk14fTj+7ln7s4//ucMNQp4VeDs7/
 ZVzZOlA9BuVVHNWj41yxOjwaep30SgNocoMgdE1L/gLZ+1rhN8BHIVHY+ePL2ExMIttI3e189PP
 NzzO6gwCp8Hpd789MrbTMEs5jQ5w4mhaCZSoX7Vwf6Vix1VP/UJl5pOGDeU7DcPMqmSWd76yFbk
 B5tyDE9Wk9DyLPboxnZ4oHCO0xR4FBFWnMiLAav+PIkSX9eUU+3wtL+RaUsaLksDG5afMFWP7pa
 HzbEoSaEzEeqkWYf6qkPwyZdpNWbGk679Eioiw==
X-Google-Smtp-Source: AGHT+IECxSnSj0BufGaooCZEU7hhYKuc1bJycu0qso/Y9YV8tt4jSwt2j7TpluNjluBnY0rIhk9i8w==
X-Received: by 2002:a05:6602:3e88:b0:84f:41cb:1895 with SMTP id
 ca18e2360f4ac-851b616dc39mr2912118739f.1.1737787659133; 
 Fri, 24 Jan 2025 22:47:39 -0800 (PST)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-4ec1da476fesm1174144173.58.2025.01.24.22.47.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 22:47:38 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org
Cc: intel-gfx-trybot@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH 58/63] drm-dyndbg: add DRM_CLASSMAP_USE to udl driver
Date: Fri, 24 Jan 2025 23:46:12 -0700
Message-ID: <20250125064619.8305-59-jim.cromie@gmail.com>
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

The udl driver has a number of DRM_UT_* debugs, make them
controllable when CONFIG_DRM_USE_DYNAMIC_DEBUG=y by telling dyndbg
that the module uses them.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/udl/udl_main.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/udl/udl_main.c b/drivers/gpu/drm/udl/udl_main.c
index 3ebe2ce55dfd..ba57c14454e5 100644
--- a/drivers/gpu/drm/udl/udl_main.c
+++ b/drivers/gpu/drm/udl/udl_main.c
@@ -19,6 +19,8 @@
 
 #define NR_USB_REQUEST_CHANNEL 0x12
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 #define MAX_TRANSFER (PAGE_SIZE*16 - BULK_SIZE)
 #define WRITES_IN_FLIGHT (20)
 #define MAX_VENDOR_DESCRIPTOR_SIZE 256
-- 
2.48.1

