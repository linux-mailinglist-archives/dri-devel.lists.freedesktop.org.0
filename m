Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7501A828227
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jan 2024 09:41:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF7CC10E6F7;
	Tue,  9 Jan 2024 08:41:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3073E10E3B5
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jan 2024 08:41:16 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id
 98e67ed59e1d1-28c2b8d6f2aso1674455a91.2
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jan 2024 00:41:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1704789676; x=1705394476;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X8/C+cZAZlDGQnbyhqyYcqig/5vzt/WyH0xZX56gmkE=;
 b=aDCNPBLLyKMxFomuj57zv+gnoH6k4qI/7WvfnuG7hGewNldh+6dgZBuZTsYZw1Obf2
 8qE7FrStie2qUmaFUss9kmhDiJwPIrfSDd0E9uogq+vWnjMZf+mqxAoTmSairzI1LfHR
 uSIhe25GCnEAVaHIF2cBoK2DWHoCvqybSC3Dk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704789676; x=1705394476;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=X8/C+cZAZlDGQnbyhqyYcqig/5vzt/WyH0xZX56gmkE=;
 b=snKshDAwwcRY+MRTD9Af5Sbkk6CCQwajhCZrPnzzxJkffHWk1lTVHWXyAgtzjvibeK
 d8SAvLxXX0F95v0ML2v3LImopKFhdP6JP7aFqQlBCaK6PWZVk3uOUIsDxxPadU3UBDwQ
 y0lQT9lvVWVEAp3pYcnEwqNJ8lS4ix+uoswWmtTqt+/5RcWReKoMY/mPQeqSk29noyy0
 Wqi6oey4qxk1F5/QDoBR5EUQTK/oNnUENEYYMk8JknEydPDxIwjFn7AjXpha9+gLotmD
 TP7kQ58ye1bXEqgkx0/y+bzfZ3QfIu2EJGT8pNkQywNlTPMfU4PLOmXzOl19ou0RlMq7
 in9A==
X-Gm-Message-State: AOJu0YwKosyAScUZpy7O6ryVJ2RP2n1FueeXgrVLv4R+ow41ypyQZqmb
 d34Kh7mtixKF8mGZ5Vq2wNhg+gzQTxJe
X-Google-Smtp-Source: AGHT+IEKSJPQQ5kZXHfegHUZEeEfLJv3dBHvaNcjAImiJtqEMm+GIdULd8bk6lMU/uJqJHQXXQBX1A==
X-Received: by 2002:a17:90a:d50d:b0:28d:1e1b:d73b with SMTP id
 t13-20020a17090ad50d00b0028d1e1bd73bmr1951835pju.19.1704789675730; 
 Tue, 09 Jan 2024 00:41:15 -0800 (PST)
Received: from amakhalov-build-vm.eng.vmware.com ([128.177.82.146])
 by smtp.gmail.com with ESMTPSA id
 sf15-20020a17090b51cf00b0028d435cc2cbsm4772293pjb.15.2024.01.09.00.41.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jan 2024 00:41:15 -0800 (PST)
From: Alexey Makhalov <alexey.makhalov@broadcom.com>
X-Google-Original-From: Alexey Makhalov <amakhalov@vmware.com>
To: linux-kernel@vger.kernel.org, virtualization@lists.linux.dev, bp@alien8.de,
 hpa@zytor.com, dave.hansen@linux.intel.com, mingo@redhat.com,
 tglx@linutronix.de
Subject: [PATCH v6 6/7] x86/vmware: Undefine VMWARE_HYPERCALL
Date: Tue,  9 Jan 2024 00:40:51 -0800
Message-Id: <20240109084052.58661-7-amakhalov@vmware.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20240109084052.58661-1-amakhalov@vmware.com>
References: <20240109084052.58661-1-amakhalov@vmware.com>
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
Cc: dmitry.torokhov@gmail.com, tzimmermann@suse.de, pv-drivers@vmware.com,
 netdev@vger.kernel.org, richardcochran@gmail.com, x86@kernel.org,
 dri-devel@lists.freedesktop.org, horms@kernel.org, akaher@vmware.com,
 timothym@vmware.com, linux-graphics-maintainer@vmware.com, mripard@kernel.org,
 jsipek@vmware.com, linux-input@vger.kernel.org, namit@vmware.com,
 kirill.shutemov@linux.intel.com, zackr@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

No more direct use of VMWARE_HYPERCALL macro should be allowed.

Signed-off-by: Alexey Makhalov <amakhalov@vmware.com>
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

