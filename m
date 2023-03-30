Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FC9A6D0953
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 17:21:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DF4010E3AD;
	Thu, 30 Mar 2023 15:21:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D28BF10EEC4
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 15:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680189664;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=PzFkckvDWfLP+fS3N43jVyaoo/K7ZKGXS7ytUztG/V8=;
 b=gd97JBIGQJeaA76jHzjN6s4A+2zjbKbgBbvx1lufEHDe4U9VflkBmt8V3P6VMUePkjqWk/
 umw9GJek8qCBNdCgGqgGLRsCl+QffeSe80S1DUM9uMg3oieEZR4ClXMgP6hJJDA5JmgBw7
 8v3/MDkNesZOH9XX4SPp/Gby2d253pw=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-139-Dzrr-rB1M2ur2BpYt3thpw-1; Thu, 30 Mar 2023 11:21:02 -0400
X-MC-Unique: Dzrr-rB1M2ur2BpYt3thpw-1
Received: by mail-qt1-f198.google.com with SMTP id
 y10-20020a05622a164a00b003e38e0a3cc3so12591464qtj.14
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 08:21:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680189662;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PzFkckvDWfLP+fS3N43jVyaoo/K7ZKGXS7ytUztG/V8=;
 b=tfAihUQAyI2cUMmc5wbeRUTV+QnsasPaNnRIUB4TvwRFVmt7cKI6kd0srWM3ES1iV0
 suGW97ENkaIcmVuigm3NAiRc3ruzCzyVkRtxVtzbYpgM9M1hgKtfgD3AgQ1mxPQhX5Cp
 8B5NgeVBbWHR9nEYmiQWr5JLQk/QMzdeBgpxG1wA/O9XMW4umfko7/CjkjvSZQyxKbyc
 1WqF0P3GeiVjS3oqbpmJ3xot/+xYy+sNsSeIqjyRDN4+QM1noRCINFa1u0dzqvEcf6Po
 P9fQpqx1T4N72b6K84hfGMoQjjsZVMIgqUgtE42ZAT+p8ai4nR3NlWcd/jtLqJumnbbF
 O4+A==
X-Gm-Message-State: AAQBX9fSSI6Oz6iqsEKLkF9E9FyNqfxrA0TlRgBih8tqZsJvPCgXc/Cc
 RMhclvzj0H8GcUCb/0Nwmg5WJ8itGco4biH7Qwuvwwxem1PxMH8UPPUs0/YVrDxOWlRwCdq1xiQ
 rmWM1Ux+qmfoNfDNucPH5BmEPThW4
X-Received: by 2002:a05:6214:1243:b0:56e:b1c8:381b with SMTP id
 r3-20020a056214124300b0056eb1c8381bmr43628874qvv.31.1680189662076; 
 Thu, 30 Mar 2023 08:21:02 -0700 (PDT)
X-Google-Smtp-Source: AKy350bnlSDboIbJVBw8O6nujKKyr0Y08gCZuIWQYE9jVjpUWoFJ1aWyINmV1swnxyoxwYXTAvU/Jw==
X-Received: by 2002:a05:6214:1243:b0:56e:b1c8:381b with SMTP id
 r3-20020a056214124300b0056eb1c8381bmr43628820qvv.31.1680189661785; 
 Thu, 30 Mar 2023 08:21:01 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com
 (nat-pool-bos-t.redhat.com. [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id
 d17-20020a0cc691000000b005dd8b9345absm2264239qvj.67.2023.03.30.08.20.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Mar 2023 08:21:00 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: Felix.Kuehling@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, nathan@kernel.org, ndesaulniers@google.com
Subject: [PATCH] drm/amdkfd: remove unused sq_int_priv variable
Date: Thu, 30 Mar 2023 11:20:40 -0400
Message-Id: <20230330152040.1838353-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
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
Cc: Tom Rix <trix@redhat.com>, llvm@lists.linux.dev,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

clang with W=1 reports
drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_int_process_v11.c:282:38: error: variable
  'sq_int_priv' set but not used [-Werror,-Wunused-but-set-variable]
        uint8_t sq_int_enc, sq_int_errtype, sq_int_priv;
                                            ^
This variable is not used so remove it.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_int_process_v11.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_int_process_v11.c b/drivers/gpu/drm/amd/amdkfd/kfd_int_process_v11.c
index 0d53f6067422..bbd646c0dee7 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_int_process_v11.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_int_process_v11.c
@@ -279,7 +279,7 @@ static void event_interrupt_wq_v11(struct kfd_dev *dev,
 {
 	uint16_t source_id, client_id, ring_id, pasid, vmid;
 	uint32_t context_id0, context_id1;
-	uint8_t sq_int_enc, sq_int_errtype, sq_int_priv;
+	uint8_t sq_int_enc, sq_int_errtype;
 	struct kfd_vm_fault_info info = {0};
 	struct kfd_hsa_memory_exception_data exception_data;
 
@@ -348,13 +348,6 @@ static void event_interrupt_wq_v11(struct kfd_dev *dev,
 				break;
 			case SQ_INTERRUPT_WORD_ENCODING_INST:
 				print_sq_intr_info_inst(context_id0, context_id1);
-				sq_int_priv = REG_GET_FIELD(context_id0,
-						SQ_INTERRUPT_WORD_WAVE_CTXID0, PRIV);
-				/*if (sq_int_priv && (kfd_set_dbg_ev_from_interrupt(dev, pasid,
-						KFD_CTXID0_DOORBELL_ID(context_id0),
-						KFD_CTXID0_TRAP_CODE(context_id0),
-						NULL, 0)))
-					return;*/
 				break;
 			case SQ_INTERRUPT_WORD_ENCODING_ERROR:
 				print_sq_intr_info_error(context_id0, context_id1);
-- 
2.27.0

