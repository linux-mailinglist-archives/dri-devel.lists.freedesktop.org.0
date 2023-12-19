Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 00DF281929F
	for <lists+dri-devel@lfdr.de>; Tue, 19 Dec 2023 22:58:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CC2410E1D3;
	Tue, 19 Dec 2023 21:58:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFD7410E260
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Dec 2023 21:58:10 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-1d3c76ee799so17761545ad.3
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Dec 2023 13:58:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1703023090; x=1703627890;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bdRA67GFcUxloyx4tvXG24BR0us5wKd/dCuK68J3MHc=;
 b=dQAF17L9t0EHJq8hDlUjUjO1SP9VEjfes0zK5GnH4+Kr5iOB7dMFoirCdk4et9RDyn
 nRTldcMnyB9nMr30ODYTpCo4bkI1tXA7x2Y5eYQxS8JKn3iMRoXE7NXTXdi2V0KlMVxv
 MjENaocCcdDoYfXgcVf7z7ysX93slHOu/xS9w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703023090; x=1703627890;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bdRA67GFcUxloyx4tvXG24BR0us5wKd/dCuK68J3MHc=;
 b=GXa3E52Ob3xV9i0k3U2ma620F6dyZ5dNmdDEl1CTXAsqrCwtHbqlm8AtsSVPgbnpkV
 GrNsWwVj6kH9SIWk4Z//6gbMKlQg74dwem7DTPXA9iFmiQovUWxolvfQiBsaBQBbSAsn
 ZstcvVzg9wKzZTrdH29W0obtjFUhjvujBPiLTr8DEshoT96yblgSjISBfGIHGrcoa9Vo
 0wuPWYG9x78///geMD0NXowzOrzxEqysPuzLNzKw2jJNphuLg+f8LFf07a4L/sA/N2SH
 s6n3wW4ra9JjzYBJwVGWoLIH/mNrgdLWYQpLcq6WdM6AfQi7hO+4R+3V8JPBpCjUF/yP
 2mGg==
X-Gm-Message-State: AOJu0YzdEampHknHReJagaBGSerUM1QHikdxeykrrL6hqgKPnO1QMlkK
 b0dXKeHW/Uf8uKLaPtrkVI5Dlw==
X-Google-Smtp-Source: AGHT+IHGD0xZLG33r4K3W27zHJ54xxNx9BXxPN80CB3EUkCBFgov+arX/Surcqdx9o4S55QyyiUwAQ==
X-Received: by 2002:a17:902:7809:b0:1d3:e171:7d0c with SMTP id
 p9-20020a170902780900b001d3e1717d0cmr816076pll.83.1703023090468; 
 Tue, 19 Dec 2023 13:58:10 -0800 (PST)
Received: from amakhalov-build-vm.eng.vmware.com ([128.177.82.146])
 by smtp.gmail.com with ESMTPSA id
 v1-20020a170902e8c100b001d3aa7604c5sm5356476plg.0.2023.12.19.13.58.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Dec 2023 13:58:10 -0800 (PST)
From: Alexey Makhalov <alexey.makhalov@broadcom.com>
To: linux-kernel@vger.kernel.org, virtualization@lists.linux.dev, bp@alien8.de,
 hpa@zytor.com, dave.hansen@linux.intel.com, mingo@redhat.com,
 tglx@linutronix.de
Subject: [PATCH v3 3/6] ptp/vmware: Use vmware_hypercall API
Date: Tue, 19 Dec 2023 13:57:48 -0800
Message-Id: <20231219215751.9445-4-alexey.makhalov@broadcom.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20231219215751.9445-1-alexey.makhalov@broadcom.com>
References: <20231219215751.9445-1-alexey.makhalov@broadcom.com>
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
 kirill.shutemov@linux.intel.com, airlied@gmail.com, zackr@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Alexey Makhalov <amakhalov@vmware.com>

Switch from VMWARE_HYPERCALL macro to vmware_hypercall API.
Eliminate arch specific code. No functional changes intended.

Signed-off-by: Alexey Makhalov <amakhalov@vmware.com>
Reviewed-by: Nadav Amit <namit@vmware.com>
Reviewed-by: Jeff Sipek <jsipek@vmware.com>
---
 drivers/ptp/ptp_vmw.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/ptp/ptp_vmw.c b/drivers/ptp/ptp_vmw.c
index 27c5547aa8a9..e5bb521b9b82 100644
--- a/drivers/ptp/ptp_vmw.c
+++ b/drivers/ptp/ptp_vmw.c
@@ -14,7 +14,6 @@
 #include <asm/hypervisor.h>
 #include <asm/vmware.h>
 
-#define VMWARE_MAGIC 0x564D5868
 #define VMWARE_CMD_PCLK(nr) ((nr << 16) | 97)
 #define VMWARE_CMD_PCLK_GETTIME VMWARE_CMD_PCLK(0)
 
@@ -24,15 +23,10 @@ static struct ptp_clock *ptp_vmw_clock;
 
 static int ptp_vmw_pclk_read(u64 *ns)
 {
-	u32 ret, nsec_hi, nsec_lo, unused1, unused2, unused3;
-
-	asm volatile (VMWARE_HYPERCALL :
-		"=a"(ret), "=b"(nsec_hi), "=c"(nsec_lo), "=d"(unused1),
-		"=S"(unused2), "=D"(unused3) :
-		"a"(VMWARE_MAGIC), "b"(0),
-		"c"(VMWARE_CMD_PCLK_GETTIME), "d"(0) :
-		"memory");
+	u32 ret, nsec_hi, nsec_lo;
 
+	ret = vmware_hypercall3(VMWARE_CMD_PCLK_GETTIME, 0,
+				&nsec_hi, &nsec_lo);
 	if (ret == 0)
 		*ns = ((u64)nsec_hi << 32) | nsec_lo;
 	return ret;
-- 
2.39.0

