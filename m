Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDF7355B281
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jun 2022 16:46:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 084B210F6C9;
	Sun, 26 Jun 2022 14:46:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5857410F701
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jun 2022 14:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656254782;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=5EXh2xkTs1zBkhfCl8CTHqf9DxClLVCKfcSwd9L8zzg=;
 b=dig88xFU1ClCwzYRpvLb8OyuSJxm0udlMIpBwiMC1nf1NfjrOZSla+mMAF1+VpLGqNUdg/
 4A4xibGpOHotbEVEy4xYsbHbt2fgCVJ6+Ky1vS3U4gMdIzqsVc78wTP7aAI/MkQZIlsxnz
 b8VJU7km04ya//URl7AthrX+IEfShc0=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-150-qHX_IiLUOSGf-PJg2dGBIw-1; Sun, 26 Jun 2022 10:46:20 -0400
X-MC-Unique: qHX_IiLUOSGf-PJg2dGBIw-1
Received: by mail-qv1-f72.google.com with SMTP id
 s11-20020a0562140cab00b0046e7d2b24b3so7116992qvs.16
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jun 2022 07:46:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5EXh2xkTs1zBkhfCl8CTHqf9DxClLVCKfcSwd9L8zzg=;
 b=aPRQr1lqVInsCY9pLAbwMsgljH8Q005Btxxdzw0rFTp3n23VNsP959Pyl/fAShM0M+
 QkYuel8EzVM7U/9BXtEw/g2klyh7WPmKsJmNAeQOhUbsscIdq8xOM1dfcN399IWDL23n
 NlJQz2o9AnlcvZOdMMu8/eVk4Q2XFd5DmdRRN9JOT9KYwfPKjO8egB3JVJYg+JCvKfuZ
 8PKKtlorco4cnkHko7NU3G4YQZc2Q/ZUkffk/d5PioAeK1FLmuc7JW26qRmIcypkzwi5
 mBtUwwAhexz/rsGT7Ojuaa0gLborcm9dfVXbbUHLcVqF9oQ+DqFdsvwPaBPKtpG6Q57n
 0hDA==
X-Gm-Message-State: AJIora83txyahbtVOVNuQxysfD1JWNX6u5siSBClSOL37swVor7f5yTq
 gxSfKpArZc4PjSFat94xQaD+/q9lVQ3ns3PjZL9oJC+jiOztKyqPajCkIxyktTLFtFwiI03P3f7
 1kZsCbdorHR9n7nf2PMWnFIWvkMII
X-Received: by 2002:a05:6214:1c49:b0:470:5f70:4ab1 with SMTP id
 if9-20020a0562141c4900b004705f704ab1mr6041426qvb.13.1656254780430; 
 Sun, 26 Jun 2022 07:46:20 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vwKpbQh1t2Fwl4Ge8LmFUOf/3X70OZcbrAYYkN7/IZ4bcE826TN7H5F8YkD5GlSQNHaim5WA==
X-Received: by 2002:a05:6214:1c49:b0:470:5f70:4ab1 with SMTP id
 if9-20020a0562141c4900b004705f704ab1mr6041396qvb.13.1656254780138; 
 Sun, 26 Jun 2022 07:46:20 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com
 (nat-pool-bos-t.redhat.com. [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id
 22-20020ac85916000000b00317bcb6ad2csm5343266qty.17.2022.06.26.07.46.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jun 2022 07:46:19 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@linux.ie, daniel@ffwll.ch, Qingqing.Zhuo@amd.com,
 mario.limonciello@amd.com, nicholas.kazlauskas@amd.com,
 aurabindo.pillai@amd.com, maira.canal@usp.br
Subject: [PATCH] drm/amd/display: change to_dal_irq_source_dnc32() storage
 class specifier to static
Date: Sun, 26 Jun 2022 10:46:15 -0400
Message-Id: <20220626144615.2227149-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: Tom Rix <trix@redhat.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

sparse reports
drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dcn32/irq_service_dcn32.c:39:20: warning: symbol 'to_dal_irq_source_dcn32' was not declared. Should it be static?

to_dal_irq_source_dnc32() is only referenced in irq_service_dnc32.c, so change its
storage class specifier to static.

Fixes: 0efd4374f6b4 ("drm/amd/display: add dcn32 IRQ changes")
Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/amd/display/dc/irq/dcn32/irq_service_dcn32.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/irq/dcn32/irq_service_dcn32.c b/drivers/gpu/drm/amd/display/dc/irq/dcn32/irq_service_dcn32.c
index 3a213ca2f077..b1012fa1977b 100644
--- a/drivers/gpu/drm/amd/display/dc/irq/dcn32/irq_service_dcn32.c
+++ b/drivers/gpu/drm/amd/display/dc/irq/dcn32/irq_service_dcn32.c
@@ -36,7 +36,7 @@
 
 #define DCN_BASE__INST0_SEG2                       0x000034C0
 
-enum dc_irq_source to_dal_irq_source_dcn32(
+static enum dc_irq_source to_dal_irq_source_dcn32(
 		struct irq_service *irq_service,
 		uint32_t src_id,
 		uint32_t ext_id)
-- 
2.27.0

