Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE67A6ADD1
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 19:54:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31E8810E687;
	Thu, 20 Mar 2025 18:54:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZPwVCjCh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com
 [209.85.166.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A9BD10E6A3;
 Thu, 20 Mar 2025 18:54:05 +0000 (UTC)
Received: by mail-io1-f51.google.com with SMTP id
 ca18e2360f4ac-85de3e8d0adso13786539f.1; 
 Thu, 20 Mar 2025 11:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742496844; x=1743101644; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=phnE7T3rE82X9afYdUepg2ZaVnfZbBYGopazv1dsHzc=;
 b=ZPwVCjChXIGk0D2N8fGdhRP+UJd5ulgsrEUhQUo0cNQzsgdc+kzTLEeOZZ8KdVDIL6
 qZjHypjE6gVXRgGWv3PTzHaTboeNd8lK/M+f+lWsXDamODolEC4bv1V42XFuO7vMwOzl
 nyVJ5rOltF1WEIRjG72QTOxRz7qyh0itBs4nJLpCcHMoF0+sgjQF52n4V9/PvgfZQbc/
 LAqDfO4TktJUU8ymaCpbAg62xAvY5gGIG1/R81hbUQ9vhkZE0pQ9riGYaZOPSKj1NJ9e
 JMKNSIGR65fWlseVbVcnbot8EvJDExl42FFiLMHTyisQE4Lmbjr1y3cvT5nu0uayci7B
 e2FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742496844; x=1743101644;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=phnE7T3rE82X9afYdUepg2ZaVnfZbBYGopazv1dsHzc=;
 b=f5ty9ommHMJmpSYcRpr6AKMwjHEg2kfzprGU+EWeIiUpfAAaAuVGzAxZh5xpsFZat4
 T0dNsGOU4ogz7dPqskLMoN61h5uiGobRBPeOFnHLq0I7RTMF/+T/Y7PaxirzLz1KBGnW
 3Ofn7DAcdoafxogu7QX50LFR6O4gOjGE4h28S5QJ0ykqglR8ccBbb01Fi5A4FlwNTC27
 ZWteaSQ7newAFCysgzFkv9fZABsOUoq/M9VMDaGJZUYObBkvxkYf9ec3zJkTO7CyZ4kM
 lsyUw7gSqMudu1alwSiPJeGs14Rh8ygtT2oazyw1ec3xbwBXk39jY+exwBo2vY8YWp2c
 mweA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZg0VM8dAAjebfP4uf2VqohknurUA1Id9n/vgHXrELxhE9PbTfmzF0xmTYYLsmDsEMbLO8kbbHNhif@lists.freedesktop.org,
 AJvYcCVDqpuD0zgFHYzVM+MJUMaZaYOcokXvtoo/aw3V8cZT0FOjJlp5/pJM5994M13ZlOwDGr9sRm6VZtU/r5RqCRcnDw==@lists.freedesktop.org,
 AJvYcCW6OoqQXjvcItZuPpiNmTmOv4uz6JUbw9F+2j1FxZtQxAUUi9AVOAouZlCZcRXOSQjLNVGk/Q5109GxLFmqZA==@lists.freedesktop.org,
 AJvYcCWdOI9oOg8BwVV3J5pCZsRHQq6ePkK7lnNqLwKX8Rnnagg81h0IFodAqiyXaIHh0CtFZNV9daxr7X2I@lists.freedesktop.org,
 AJvYcCWvtr8latIN9YIKzjnxar8wTxWFjTTPT1LFvJlT6/zXGz87aPLnLn+qW45keXyAhBdOtwQThruo@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz24C7QFe1pzgFBo/1IgnOBgt0A++A6a7EboB4N8zhDZBNXx+T4
 eb4ZwNUqKsEOwvC9Qgz9RZMuRhNsGnIjR4Uh0rsOkCuWTsiXL/iA
X-Gm-Gg: ASbGncu6rFYEpReixpjS1p4kU2p/OQ85SqQ1bQXXxtn7WJ8kyQNK/DHq2eeBy/Yri5w
 l5+0w4GDR5j2U+3Tz9tJxhBizwacw7j2S+6QFLNQbqHP1tVgfM+o6jLCYs85xCKab5Ns3dtgCUv
 yDyfxBQrH2BYv9VwWcExDKVjjOytg+rKPrG2wY76AJjmb5ZM8CUqeEmGTPTqAmbvTGPT/PZChiV
 P2UDGBk5sabOjn5EycnxwCIpx5otOuJkZeW2eyVtWlbr0q9IJL/0geAr2toGW4RY+PUkf4vTDUE
 HK0Orq9GsQQoG5UaRDaJ5ZMqZTw2eaAduJsHHVi7ZClQuwB+5FabH/ce6ULTquaKQJlTn4t/dKY
 +bw==
X-Google-Smtp-Source: AGHT+IEquWBiK+hoBl688ui0TzT9uiALVStKwkK7VjOSDZDveERfz+JuO98cZxCxxin9hgntP4lKOw==
X-Received: by 2002:a05:6602:4013:b0:85b:3827:ed06 with SMTP id
 ca18e2360f4ac-85e2ca33995mr46254839f.4.1742496844632; 
 Thu, 20 Mar 2025 11:54:04 -0700 (PDT)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 ca18e2360f4ac-85e2bc273e7sm7078039f.17.2025.03.20.11.54.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Mar 2025 11:54:04 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-gfx-trybot@lists.freedesktop.org
Cc: jbaron@akamai.com, gregkh@linuxfoundation.org, ukaszb@chromium.org,
 louis.chauvet@bootlin.com, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v2 53/59] drm-dyndbg: add DRM_CLASSMAP_USE to udl driver
Date: Thu, 20 Mar 2025 12:52:31 -0600
Message-ID: <20250320185238.447458-54-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250320185238.447458-1-jim.cromie@gmail.com>
References: <20250320185238.447458-1-jim.cromie@gmail.com>
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
2.49.0

