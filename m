Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30014A56DD1
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 17:34:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7078710EBF5;
	Fri,  7 Mar 2025 16:34:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="m+r8UsZl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 707A410EBF0
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Mar 2025 16:34:18 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-43bd87f7c2eso12091335e9.3
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Mar 2025 08:34:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741365257; x=1741970057; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g2I+AKiUaGilJvwS/f5X1LlsvDutZk3cs9KHKo4vYS0=;
 b=m+r8UsZlkl1Gn+4turYizF4/yCh3lA7o3mFbUsUPpGoJEnHM0S9FbPdS43e9F8RuqD
 tzPtvLO/P41kqwJ8Qh1lcOe3uVEv/yDqp/a8AzQowqHwDdQlLqZsNSepSRyVNmqi08j2
 yjx17x328pfeR74F27vE3vvO2LSSWVl/ezsBhPotwvpWgd2lRlH9hQtnu6aH1zulGrCW
 dd32cFs1DOQwW82XuajkkhkOVKff0VW2XinERzfxQ6efG3vC5okr6XEsUFOkXhzdRTH8
 IlRiUmhSC4EHJmI0JgK+bSkSJWLtWBgCYDV/UzQDV/x7v5UoHE3Kc/YW7ug39S0hbItj
 7tPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741365257; x=1741970057;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=g2I+AKiUaGilJvwS/f5X1LlsvDutZk3cs9KHKo4vYS0=;
 b=Jvg2LlK9miWwkZep3dleCt1D1X03dj8VLYVppss9m6+QxIqyjAYnipThlURK+Sti1I
 mN0xiJ68dCVYFHt7YX6lk2juaMEkaq7HmusJYN2TiYyUvUIiPm0Sq6KNnzWQXz4gg5Il
 O45p+lst4oURhVkjPUiZf7c0wRV1g1d6UdIyMYIQc4mMz/cbXP0Y8NxSKiysnlKmjdTC
 3UXzDMFGHAEoOFIbErpRCFst/B8YADkgJeDoCZBcjNUHdu6jP5vek+RPQUnvE6lOype4
 3Ci0ngLgH7aPLAFvcImoFN8CfyELtUPxD+SSzBtaa1c7uh5oFVCBZxmUyXNKIKrMRhbU
 Q7dA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUjPUth4ZaY64fMzm8dc00VXzLCKhcSW5LCeAY4ynksGHEmGj9LfnkSPBWhwD2K8mnHI4WHrGE2SHw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx8574auke6ZriklR5slOzdFKvtjLyJBoTQaGwPzMYdJ11NMJeg
 /XCQLGPohiEfO2vSZTbJR9fQe5j0w9Y2s5l+MzkEJlQqxNRg1FK4
X-Gm-Gg: ASbGncuhwdJBHmQQfPpMMJyg7SNlvlNjXwaaAoZuO5DcLQ8Amsb00kPDMb+YN7l/4TP
 dkJq4MfN68Jag2moFphzqu4zrEu1e/JgAbWupXdgpH2EykCq27SS/PLOYlNAh3B22TQqXQ8gYLt
 K69LRI34VQ9U81esChX07NvQIoQYBM9RKZ6mEbBaUc8xItVdiKsAefFrFTovx8YJ/sZvTpDgUKC
 xltMHsXX5Vojs10cIdnhXfsTq9nxCH5bNv05UbexcVdXX1bGHil1U3tLHIuF0ku8pTfJ4g9rnxR
 T3EUnBHC/NBzSbjdSnLMblkSEbQKISFOr2bw3t86FkVQbPY=
X-Google-Smtp-Source: AGHT+IE+/rU5pkLDM1WZfm1em60SGqLyoPo8j+dxcpf3SNDsL/ewtlrCgxTKAsjxe6CqNBfr06tkCQ==
X-Received: by 2002:a05:600c:3b92:b0:43b:c7ad:55c2 with SMTP id
 5b1f17b1804b1-43c5a5e9853mr27338655e9.6.1741365256861; 
 Fri, 07 Mar 2025 08:34:16 -0800 (PST)
Received: from fedora.. ([213.94.27.232]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3912c019557sm6031436f8f.50.2025.03.07.08.34.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Mar 2025 08:34:16 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH v3 13/16] drm/vkms: Remove completed task from the TODO list
Date: Fri,  7 Mar 2025 17:33:50 +0100
Message-ID: <20250307163353.5896-14-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250307163353.5896-1-jose.exposito89@gmail.com>
References: <20250307163353.5896-1-jose.exposito89@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Remove the configfs related TODO items from the "Runtime Configuration"
section.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 Documentation/gpu/vkms.rst | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
index 74126d2e32e4..c551241fe873 100644
--- a/Documentation/gpu/vkms.rst
+++ b/Documentation/gpu/vkms.rst
@@ -222,21 +222,14 @@ Runtime Configuration
 ---------------------
 
 We want to be able to reconfigure vkms instance without having to reload the
-module. Use/Test-cases:
+module through configfs. Use/Test-cases:
 
 - Hotplug/hotremove connectors on the fly (to be able to test DP MST handling
   of compositors).
 
-- Configure planes/crtcs/connectors (we'd need some code to have more than 1 of
-  them first).
-
 - Change output configuration: Plug/unplug screens, change EDID, allow changing
   the refresh rate.
 
-The currently proposed solution is to expose vkms configuration through
-configfs. All existing module options should be supported through configfs
-too.
-
 Writeback support
 -----------------
 
-- 
2.48.1

