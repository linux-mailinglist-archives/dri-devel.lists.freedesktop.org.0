Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E377D8AD82D
	for <lists+dri-devel@lfdr.de>; Tue, 23 Apr 2024 00:57:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C2EC10E9DD;
	Mon, 22 Apr 2024 22:57:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="anydk8sq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com
 [209.85.160.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39EE2112E0E
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 22:57:24 +0000 (UTC)
Received: by mail-oa1-f53.google.com with SMTP id
 586e51a60fabf-234db9dde9bso1816416fac.1
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 15:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1713826643; x=1714431443;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4fIJKpP9PuqIwYQVQAXhh3lvsNULoqRv8W6dHtBpvXk=;
 b=anydk8sqXxqXAYep1zTdc+7/nYOQxoBYsksLuxVQHze2vD1r5eZl6ko5Lv8cSliRF0
 c560x8oxgKf6Xu9CJR9Q9Gfh8XfxrH8is/LJ8N9aSqWNONlb06LSseqARdUK5Jmfu7f3
 M0Ln1JAJIW22wqV+LsllMfVfcMcoc1tb0HxFU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713826643; x=1714431443;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4fIJKpP9PuqIwYQVQAXhh3lvsNULoqRv8W6dHtBpvXk=;
 b=CT8Jxyj0DAf9d6mh9Kw6BMnHYw+S+/j40Df8z1+dUEd1Yhb7mmQbE6XAUw7j02zbs8
 jf3XyUGzBmSviHTj+z1vHwxzAJUpLmZFMyOl6J2dlRDUf1I7gCLDIvWt/wxJBOIWno75
 HdEQRGp5Dzi7QL7NDmGHevxjB4BXQVoNHKd4koJqoiEOHYSUPymnpPnTJxoGUivTETHj
 BchI8an+lXa31GxcKVlnrvVxC3FL2kA/5dEaFRwPVtEtNM/VteNOvFMC8BIBZk4kHvUB
 VKUj/fAt9v94MZ3x9Uh8sux2qLCbXuGOqGtCCNbWVttqXnGlXq9KdpgkciI9C9vRSxN2
 QZFw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXUB+AvcVG0TaixaDQyHrENeFkLCNyO+jJFkkpkXQ7pBjTJUJxFgbWO74Vg75GSXO2x3wq0PJ9Eur4wfS5a0/fn5yvmSlf+UxR/pmT9B6zE
X-Gm-Message-State: AOJu0Yxx5yrxMO2Dhg5uQbgwafcRXUcaxnv+QhofiBKrDhBOYP8ecUrl
 OQd4ooe1dG/TxIfqIGi1tTezPT4v5SHckUFvltozqX7STn+CqPJmAg2lYV7DvA==
X-Google-Smtp-Source: AGHT+IEv2WhbdeTm+ITZUjA7wRjDe33Me8JI8D8cOBtCVuMHtiFWNGlYrKrwKoReJqK7LTHdXsmAJg==
X-Received: by 2002:a05:6870:cb91:b0:22a:9ea4:c18 with SMTP id
 ov17-20020a056870cb9100b0022a9ea40c18mr16126552oab.15.1713826643266; 
 Mon, 22 Apr 2024 15:57:23 -0700 (PDT)
Received: from amakhalov-build-vm.eng.vmware.com ([128.177.82.146])
 by smtp.gmail.com with ESMTPSA id
 e131-20020a636989000000b005e43cce33f8sm8093597pgc.88.2024.04.22.15.57.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Apr 2024 15:57:22 -0700 (PDT)
From: Alexey Makhalov <alexey.makhalov@broadcom.com>
To: linux-kernel@vger.kernel.org, virtualization@lists.linux.dev, bp@alien8.de,
 hpa@zytor.com, dave.hansen@linux.intel.com, mingo@redhat.com,
 tglx@linutronix.de
Cc: x86@kernel.org, netdev@vger.kernel.org, richardcochran@gmail.com,
 linux-input@vger.kernel.org, dmitry.torokhov@gmail.com, zackr@vmware.com,
 linux-graphics-maintainer@vmware.com, pv-drivers@vmware.com,
 timothym@vmware.com, akaher@vmware.com, dri-devel@lists.freedesktop.org,
 daniel@ffwll.ch, airlied@gmail.com, tzimmermann@suse.de,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com, horms@kernel.org,
 kirill.shutemov@linux.intel.com,
 Alexey Makhalov <alexey.makhalov@broadcom.com>
Subject: [PATCH v8 6/7] x86/vmware: Undefine VMWARE_HYPERCALL
Date: Mon, 22 Apr 2024 15:56:55 -0700
Message-Id: <20240422225656.10309-7-alexey.makhalov@broadcom.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20240422225656.10309-1-alexey.makhalov@broadcom.com>
References: <20240422225656.10309-1-alexey.makhalov@broadcom.com>
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

No more direct use of VMWARE_HYPERCALL macro should be allowed.

Signed-off-by: Alexey Makhalov <alexey.makhalov@broadcom.com>
---
 arch/x86/include/asm/vmware.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/x86/include/asm/vmware.h b/arch/x86/include/asm/vmware.h
index 2ac87068184a..84a31f579a30 100644
--- a/arch/x86/include/asm/vmware.h
+++ b/arch/x86/include/asm/vmware.h
@@ -273,5 +273,6 @@ unsigned long vmware_hypercall_hb_in(unsigned long cmd, unsigned long in2,
 }
 #undef VMW_BP_REG
 #undef VMW_BP_CONSTRAINT
+#undef VMWARE_HYPERCALL
 
 #endif
-- 
2.39.0

