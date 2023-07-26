Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C45764825
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 09:12:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A1BC10E4F9;
	Thu, 27 Jul 2023 07:12:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BC2D10E045
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jul 2023 17:14:36 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-666ecf9a081so70609b3a.2
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jul 2023 10:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690391676; x=1690996476;
 h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y8QZa7qTEmGwCyA0yfHV1JjhyFQSM3L1Bj9irGZtMbI=;
 b=V5ourLyDBFitbj6i3NSu7Ce7nyCxoe4wZz6T48QqcrhwAyGppGZo6/+WkRI9pTCQhc
 ZKv2sR5SfQnbXhe8eslmUHoLwz/Dk2cyZSCWcaACOGBdVZueFvu5ixTwrS09deJZEeCl
 ggNyP8W+/4g2znmswMkpzWrVAtkKCAh36eSKLciRAPRvDQhheqyFytgwdBoZG4Ecxs/y
 JTAnoH6VABAO9MSHILqEdWZ1xznhrFaW/CWQxP6nx0FD9x8BsFJjFQ27EzuMopLeSN/E
 vIUvuUTPiuI3TdlPaDwPH2zPABN0ZDf+Y6vAALJ46Eq9cz21qVSeIhwttVhqxNA3p49O
 evtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690391676; x=1690996476;
 h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=y8QZa7qTEmGwCyA0yfHV1JjhyFQSM3L1Bj9irGZtMbI=;
 b=Gsuootb3DxcKyvVdEXeR6JhwGrOriY6jyFmGL+MkQdKPYKKUzt28cmHcpPlU4KL33k
 589BjAcrCgiY3WzOwT0BfpzegAscln9+TGJjlIPgMFXtXEVfyCNqrC6gkffDeK58ehKV
 +h0CY5qfJhLDLkMm63Y+bU1hKRr/gObzZKp+gYC9K4x2O6Yzmp1dpa8PA9YkBNnWXPse
 59bu1PGcwbhOGj3YqIVoOV1dnY3MKhJTHzu+WS8rp7cIiCOcawVzrgzXU1dITtUIuHIS
 V0qf5pm3Mavav/awRUBuBdWMwY9ixo1C+n0J+x9yF9nw4yhhI75RUnmkjFRkB73ZumZW
 X2Rw==
X-Gm-Message-State: ABy/qLYOHq9ARffeCwqWJXlsaqpcyvATGzH4oI3Y72ElhLglreOf3RjP
 AbcKpbEF+msuyriGGrc6St4ZRjRgA3XRWA==
X-Google-Smtp-Source: APBJJlF9uZ/TB0GtcuHXezMc7d0QCA7hQiP905LgZ3w0DZ1XDY4QZ9iUrKmEg++RMxvAb8QwPjMcLA==
X-Received: by 2002:a05:6a00:2d01:b0:686:b662:f303 with SMTP id
 fa1-20020a056a002d0100b00686b662f303mr3540492pfb.0.1690391675815; 
 Wed, 26 Jul 2023 10:14:35 -0700 (PDT)
Received: from 377044c6c369.cse.ust.hk (191host097.mobilenet.cse.ust.hk.
 [143.89.191.97]) by smtp.gmail.com with ESMTPSA id
 k196-20020a633dcd000000b005501b24b1c9sm12688361pga.62.2023.07.26.10.14.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jul 2023 10:14:35 -0700 (PDT)
From: Chengfeng Ye <dg573847474@gmail.com>
To: james.smart@broadcom.com, dick.kennedy@broadcom.com, jejb@linux.ibm.com,
 martin.petersen@oracle.com, sumit.semwal@linaro.org,
 christian.koenig@amd.com, justin.tee@broadcom.com
Subject: [PATCH] scsi: lpfc: Fix potential deadlock on &ndlp->lock
Date: Wed, 26 Jul 2023 17:14:23 +0000
Message-Id: <20230726171423.18692-1-dg573847474@gmail.com>
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
context, process context code acquiring the lock &phba->hbalock should
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

