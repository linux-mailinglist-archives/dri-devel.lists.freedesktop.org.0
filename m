Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A5E9875948
	for <lists+dri-devel@lfdr.de>; Thu,  7 Mar 2024 22:30:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A9B710EDA4;
	Thu,  7 Mar 2024 21:30:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="GXGoCYPK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
 [209.85.215.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 551F510F590
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Mar 2024 21:30:13 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id
 41be03b00d2f7-5cddc5455aeso115471a12.1
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Mar 2024 13:30:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1709847013; x=1710451813;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6wTvrBoMRxZCWaEX/3Staq0bbOJFHnuwbRWeayyXP6g=;
 b=GXGoCYPKmej6KYcV0/bXSDuqqwquJE52SOPxMR+uLIgEnUg47sWqiQRujCC+g69NRt
 l4o6LEyI5cPTkty3LkA0mlrghSaACNDx25KvxJjKRL9eSUs34SbO9yQXAEVDJbt/7iTs
 DpLhgRSF1Nz5RO+li5nBFQj4VspAcF197t0NY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709847013; x=1710451813;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6wTvrBoMRxZCWaEX/3Staq0bbOJFHnuwbRWeayyXP6g=;
 b=IEbk1ikcTDk9tLmbkEZxuR404tMZkRfxGOS5SsSrai5zDXbUlyP2H72G2rBnahkTIS
 iU0JsQgs8cYl77mTtTWAvIqfek/t2H7sENNQhK4/cgP/fuO/K5+M9Ab+AZ8BnV6fZcGn
 K1bzOXN0aPzAnOodQTVTarrt0eIvrZZXH8ERRhinQ1pIQvdyL0D2cIm0wcgbpNAJMn9q
 Q1S1OMBFLRpAVgCSRxg7JqsXFhNmWTgNSx9GVJ7HKfNK/vC3tzOH33pbj/awL3Y7pEl7
 MdEcKCQvrGtg0WPPP7F5cqq4HIsvPJIYAvHq66FsH/b6Eo45Sn/cmD35/LIm9IHTLWDg
 q4Pw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUX4Yz8tJQXgtzs9XlC7dNOTSF3MvKdKWpZzeqLA/q0M7BGsRVu2NQZGjiPHxU05wEf0tPG7hwRSU5Ok+uuTHJG7CfFlbuWLbow4ajykbn3
X-Gm-Message-State: AOJu0YycUC+wqFx8x4uBjOqU1zcPam4jfQegRpO40zT8WD8DvQjRRr1L
 /K6GXJakaYEi5KMPLErgLpBWYxhe0fEbczwYVakaiLVkiNIWWv8K0tflVX9dtg==
X-Google-Smtp-Source: AGHT+IFVrVN0tHcOVBFKPEnuhQVuezk1j0U7qfNAEn4QdWC6lbUljz3m5eFH1/rI7jdt8VRUi2xtVw==
X-Received: by 2002:a17:90a:8046:b0:29a:7efc:4720 with SMTP id
 e6-20020a17090a804600b0029a7efc4720mr16660957pjw.31.1709847012662; 
 Thu, 07 Mar 2024 13:30:12 -0800 (PST)
Received: from amakhalov-build-vm.eng.vmware.com ([64.186.27.43])
 by smtp.gmail.com with ESMTPSA id
 y12-20020a17090abd0c00b00299db19a81asm1991021pjr.56.2024.03.07.13.30.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Mar 2024 13:30:12 -0800 (PST)
From: Alexey Makhalov <alexey.makhalov@broadcom.com>
To: linux-kernel@vger.kernel.org, virtualization@lists.linux.dev, bp@alien8.de,
 hpa@zytor.com, dave.hansen@linux.intel.com, mingo@redhat.com,
 tglx@linutronix.de
Cc: x86@kernel.org, netdev@vger.kernel.org, richardcochran@gmail.com,
 linux-input@vger.kernel.org, dmitry.torokhov@gmail.com, zackr@vmware.com,
 linux-graphics-maintainer@vmware.com, pv-drivers@vmware.com,
 namit@vmware.com, timothym@vmware.com, akaher@vmware.com,
 jsipek@vmware.com, dri-devel@lists.freedesktop.org, daniel@ffwll.ch,
 airlied@gmail.com, tzimmermann@suse.de, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, horms@kernel.org,
 kirill.shutemov@linux.intel.com
Subject: [PATCH v7 6/7] x86/vmware: Undefine VMWARE_HYPERCALL
Date: Thu,  7 Mar 2024 13:29:48 -0800
Message-Id: <20240307212949.4166120-7-alexey.makhalov@broadcom.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20240307212949.4166120-1-alexey.makhalov@broadcom.com>
References: <20240307212949.4166120-1-alexey.makhalov@broadcom.com>
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

From: Alexey Makhalov <amakhalov@vmware.com>

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

