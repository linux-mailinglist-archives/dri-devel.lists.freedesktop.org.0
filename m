Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D14EF764817
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 09:12:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04FB310E4EE;
	Thu, 27 Jul 2023 07:11:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F019E10E04B
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jul 2023 18:13:33 +0000 (UTC)
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-686efa1804eso94554b3a.3
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jul 2023 11:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690395213; x=1691000013;
 h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vwiSFj0tl/R+2ypAV/GDIAiCwQG00lhPHhABGlY+Hic=;
 b=pvxRPcRPGAfCe4SrvnDaqzurhrKOcVas4Tnt6r7ITP3DnKTAdadQeNOZIYtvxZlyDn
 DozhwK9IGtgCBWi3ffcMC796lhCxm+gzK2j9eyKV95IPGS8xj+8f2FDv/JB5ovIsi5UD
 qt/8yTjnGNgleKv7v8WrBjBeJogMfejzAlE3SL+rMfERO6ucZIKXksiZVZQxIOZq65B5
 Te2OlQwqeJbvNcZwIOAr0gAkZbUPY1eCfToHo7n8vHhiGE46COkFmR7//Wu2tE2h1BSV
 BfhYiR8hECg45x0FqEJYUSKeCgH472DOcTHMgd2T7pCv+vwrYCYh6ITmAN924aXho4lc
 mJbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690395213; x=1691000013;
 h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vwiSFj0tl/R+2ypAV/GDIAiCwQG00lhPHhABGlY+Hic=;
 b=aRN+pQj89/Y912BLAurFQYzVPiK+tA5/N/atZ7IKMRxuoAUDTNuxa/mXJ0ibGLTk+E
 qWoiLNyq0qFj1RR9lLHmQqA4HRfwzVFge/MxNgG8tUtjd3CUAFpbpKX6rPxOHRUgGB8J
 i34uTIx7BGBVDNzkfr/l3gIS8Ev24enEBPJx5NEkxkhw/mu7U3WmJbMNTdodU7e5aGFB
 cXGBHPo4EizkFGqbIjBcTdTz7a+B0BGs8vVAhEyb8Di60AcLMXMfSooovAqVvS5a8QDs
 UFMY1EAk+v1lF/HdYf9iuscjo/6YCAc7JeyZ8Y9Hw+A1bVFRbZh5rjpugPxVW6ubbd5R
 W/dg==
X-Gm-Message-State: ABy/qLZ71vvIrCDiNF2478QCn6AzfV7XDrXJllggj6IifQXMmdcGPiQZ
 MSQy7Zl6K9/5tZy1YIHS1R0=
X-Google-Smtp-Source: APBJJlENsKtAIdpEBIKfw+s/pPsgNv0zC1TAnGLqNZq+eoO8cyf+D7Fq22VDKCbbaFYZ8L+dGs9mQA==
X-Received: by 2002:a17:903:181:b0:1b1:ae33:30de with SMTP id
 z1-20020a170903018100b001b1ae3330demr2839399plg.13.1690395213483; 
 Wed, 26 Jul 2023 11:13:33 -0700 (PDT)
Received: from 377044c6c369.cse.ust.hk (191host097.mobilenet.cse.ust.hk.
 [143.89.191.97]) by smtp.gmail.com with ESMTPSA id
 c9-20020a170902c1c900b001bb8be10a84sm9100254plc.304.2023.07.26.11.13.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jul 2023 11:13:32 -0700 (PDT)
From: Chengfeng Ye <dg573847474@gmail.com>
To: james.smart@broadcom.com, dick.kennedy@broadcom.com, jejb@linux.ibm.com,
 martin.petersen@oracle.com, sumit.semwal@linaro.org,
 christian.koenig@amd.com, justin.tee@broadcom.com
Subject: [PATCH v2] scsi: lpfc: Fix potential deadlock on &ndlp->lock
Date: Wed, 26 Jul 2023 18:13:22 +0000
Message-Id: <20230726181322.26754-1-dg573847474@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Thu, 27 Jul 2023 07:11:21 +0000
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
Cc: Chengfeng Ye <dg573847474@gmail.com>, linux-scsi@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As &ndlp->lock is acquired by timer lpfc_els_retry_delay() under softirq
context, process context code acquiring the lock &ndlp->lock should
disable irq or bh, otherwise deadlock could happen if the timer preempt
the execution while the lock is held in process context on the same CPU.

The two lock acquisition inside lpfc_cleanup_pending_mbox() does not
disable irq or softirq.

[Deadlock Scenario]
lpfc_cmpl_els_fdisc()
    -> lpfc_cleanup_pending_mbox()
    -> spin_lock(&ndlp->lock);
        <irq>
        -> lpfc_els_retry_delay()
        -> lpfc_nlp_get()
        -> spin_lock_irqsave(&ndlp->lock, flags); (deadlock here)

This flaw was found by an experimental static analysis tool I am
developing for irq-related deadlock.

The patch fix the potential deadlock by spin_lock_irq() to disable
irq.

Signed-off-by: Chengfeng Ye <dg573847474@gmail.com>
---
 drivers/scsi/lpfc/lpfc_sli.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/scsi/lpfc/lpfc_sli.c b/drivers/scsi/lpfc/lpfc_sli.c
index 58d10f8f75a7..8555f6bb9742 100644
--- a/drivers/scsi/lpfc/lpfc_sli.c
+++ b/drivers/scsi/lpfc/lpfc_sli.c
@@ -21049,9 +21049,9 @@ lpfc_cleanup_pending_mbox(struct lpfc_vport *vport)
 				mb->mbox_flag |= LPFC_MBX_IMED_UNREG;
 				restart_loop = 1;
 				spin_unlock_irq(&phba->hbalock);
-				spin_lock(&ndlp->lock);
+				spin_lock_irq(&ndlp->lock);
 				ndlp->nlp_flag &= ~NLP_IGNR_REG_CMPL;
-				spin_unlock(&ndlp->lock);
+				spin_unlock_irq(&ndlp->lock);
 				spin_lock_irq(&phba->hbalock);
 				break;
 			}
@@ -21067,9 +21067,9 @@ lpfc_cleanup_pending_mbox(struct lpfc_vport *vport)
 			ndlp = (struct lpfc_nodelist *)mb->ctx_ndlp;
 			mb->ctx_ndlp = NULL;
 			if (ndlp) {
-				spin_lock(&ndlp->lock);
+				spin_lock_irq(&ndlp->lock);
 				ndlp->nlp_flag &= ~NLP_IGNR_REG_CMPL;
-				spin_unlock(&ndlp->lock);
+				spin_unlock_irq(&ndlp->lock);
 				lpfc_nlp_put(ndlp);
 			}
 		}
-- 
2.17.1

