Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 819F29CF75F
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2024 22:27:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BAE710E045;
	Fri, 15 Nov 2024 21:26:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="og1s1yT3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6D86710E8ED;
 Fri, 15 Nov 2024 21:26:46 +0000 (UTC)
Received: from eahariha-devbox.internal.cloudapp.net (unknown [40.91.112.99])
 by linux.microsoft.com (Postfix) with ESMTPSA id 499B0206BCFF;
 Fri, 15 Nov 2024 13:26:43 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 499B0206BCFF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1731706003;
 bh=61FzWbZx8SVE6r33ggD3SgPEq3e2wgbU4/WDXmU67Oo=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=og1s1yT3C7qmGwpXC7BTRjelEYUxv+y/wT3aVo0+4J69TYgfP6zEFIO0yD8KBx7t/
 92Gtaxjx6bIrpJr767qFI9u3x1d6CtqjQKQq/ajvUlvLNnm+zvVjUogpR6HNP56Qc4
 chNj7CUafA0bTcDqKth0w7CAJ55sYrNQyLSK+jvY=
From: Easwar Hariharan <eahariha@linux.microsoft.com>
Date: Fri, 15 Nov 2024 21:26:27 +0000
Subject: [PATCH v2 10/21] scsi: lpfc: Convert timeouts to secs_to_jiffies()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241115-converge-secs-to-jiffies-v2-10-911fb7595e79@linux.microsoft.com>
References: <20241115-converge-secs-to-jiffies-v2-0-911fb7595e79@linux.microsoft.com>
In-Reply-To: <20241115-converge-secs-to-jiffies-v2-0-911fb7595e79@linux.microsoft.com>
To: Pablo Neira Ayuso <pablo@netfilter.org>, 
 Jozsef Kadlecsik <kadlec@netfilter.org>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Julia Lawall <Julia.Lawall@inria.fr>, 
 Nicolas Palix <nicolas.palix@imag.fr>, Daniel Mack <daniel@zonque.org>, 
 Haojian Zhuang <haojian.zhuang@gmail.com>, 
 Robert Jarzmik <robert.jarzmik@free.fr>, 
 Russell King <linux@armlinux.org.uk>, Heiko Carstens <hca@linux.ibm.com>, 
 Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, Ofir Bitton <obitton@habana.ai>, 
 Oded Gabbay <ogabbay@kernel.org>, 
 Lucas De Marchi <lucas.demarchi@intel.com>, 
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jeroen de Borst <jeroendb@google.com>, 
 Praveen Kaligineedi <pkaligineedi@google.com>, 
 Shailend Chand <shailend@google.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 James Smart <james.smart@broadcom.com>, 
 Dick Kennedy <dick.kennedy@broadcom.com>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
 Jens Axboe <axboe@kernel.dk>, Kalle Valo <kvalo@kernel.org>, 
 Jeff Johnson <jjohnson@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Jack Wang <jinpu.wang@cloud.ionos.com>, 
 Marcel Holtmann <marcel@holtmann.org>, 
 Johan Hedberg <johan.hedberg@gmail.com>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Xiubo Li <xiubli@redhat.com>, Ilya Dryomov <idryomov@gmail.com>, 
 Josh Poimboeuf <jpoimboe@kernel.org>, Jiri Kosina <jikos@kernel.org>, 
 Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>, 
 Joe Lawrence <joe.lawrence@redhat.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Lucas Stach <l.stach@pengutronix.de>, 
 Russell King <linux+etnaviv@armlinux.org.uk>, 
 Christian Gmeiner <christian.gmeiner@gmail.com>, 
 Louis Peens <louis.peens@corigine.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: netfilter-devel@vger.kernel.org, coreteam@netfilter.org, 
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, cocci@inria.fr, 
 linux-arm-kernel@lists.infradead.org, linux-s390@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 linux-scsi@vger.kernel.org, xen-devel@lists.xenproject.org, 
 linux-block@vger.kernel.org, linux-wireless@vger.kernel.org, 
 ath11k@lists.infradead.org, linux-mm@kvack.org, 
 linux-bluetooth@vger.kernel.org, linux-staging@lists.linux.dev, 
 linux-rpi-kernel@lists.infradead.org, ceph-devel@vger.kernel.org, 
 live-patching@vger.kernel.org, linux-sound@vger.kernel.org, 
 etnaviv@lists.freedesktop.org, oss-drivers@corigine.com, 
 linuxppc-dev@lists.ozlabs.org, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Easwar Hariharan <eahariha@linux.microsoft.com>
X-Mailer: b4 0.14.2
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

Changes made with the following Coccinelle rules:

@@ constant C; @@

- msecs_to_jiffies(C * 1000)
+ secs_to_jiffies(C)

@@ constant C; @@

- msecs_to_jiffies(C * MSEC_PER_SEC)
+ secs_to_jiffies(C)

Signed-off-by: Easwar Hariharan <eahariha@linux.microsoft.com>
---
 drivers/scsi/lpfc/lpfc_init.c      | 18 +++++++++---------
 drivers/scsi/lpfc/lpfc_nportdisc.c |  8 ++++----
 drivers/scsi/lpfc/lpfc_nvme.c      |  2 +-
 drivers/scsi/lpfc/lpfc_sli.c       |  4 ++--
 drivers/scsi/lpfc/lpfc_vmid.c      |  2 +-
 5 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/scsi/lpfc/lpfc_init.c b/drivers/scsi/lpfc/lpfc_init.c
index 0dd451009b07914450dc70f2c981b690557c1d8c..12666c4c7986ae0bdfaa5c8f040b4ea0be64550d 100644
--- a/drivers/scsi/lpfc/lpfc_init.c
+++ b/drivers/scsi/lpfc/lpfc_init.c
@@ -598,7 +598,7 @@ lpfc_config_port_post(struct lpfc_hba *phba)
 		  jiffies + msecs_to_jiffies(1000 * timeout));
 	/* Set up heart beat (HB) timer */
 	mod_timer(&phba->hb_tmofunc,
-		  jiffies + msecs_to_jiffies(1000 * LPFC_HB_MBOX_INTERVAL));
+		  jiffies + secs_to_jiffies(LPFC_HB_MBOX_INTERVAL));
 	clear_bit(HBA_HBEAT_INP, &phba->hba_flag);
 	clear_bit(HBA_HBEAT_TMO, &phba->hba_flag);
 	phba->last_completion_time = jiffies;
@@ -1267,7 +1267,7 @@ lpfc_hb_mbox_cmpl(struct lpfc_hba * phba, LPFC_MBOXQ_t * pmboxq)
 	    !test_bit(FC_UNLOADING, &phba->pport->load_flag))
 		mod_timer(&phba->hb_tmofunc,
 			  jiffies +
-			  msecs_to_jiffies(1000 * LPFC_HB_MBOX_INTERVAL));
+			  secs_to_jiffies(LPFC_HB_MBOX_INTERVAL));
 	return;
 }
 
@@ -1555,7 +1555,7 @@ lpfc_hb_timeout_handler(struct lpfc_hba *phba)
 		/* If IOs are completing, no need to issue a MBX_HEARTBEAT */
 		spin_lock_irq(&phba->pport->work_port_lock);
 		if (time_after(phba->last_completion_time +
-				msecs_to_jiffies(1000 * LPFC_HB_MBOX_INTERVAL),
+				secs_to_jiffies(LPFC_HB_MBOX_INTERVAL),
 				jiffies)) {
 			spin_unlock_irq(&phba->pport->work_port_lock);
 			if (test_bit(HBA_HBEAT_INP, &phba->hba_flag))
@@ -3352,7 +3352,7 @@ lpfc_block_mgmt_io(struct lpfc_hba *phba, int mbx_action)
 	spin_unlock_irqrestore(&phba->hbalock, iflag);
 	if (mbx_action == LPFC_MBX_NO_WAIT)
 		return;
-	timeout = msecs_to_jiffies(LPFC_MBOX_TMO * 1000) + jiffies;
+	timeout = secs_to_jiffies(LPFC_MBOX_TMO) + jiffies;
 	spin_lock_irqsave(&phba->hbalock, iflag);
 	if (phba->sli.mbox_active) {
 		actcmd = phba->sli.mbox_active->u.mb.mbxCommand;
@@ -4939,14 +4939,14 @@ int lpfc_scan_finished(struct Scsi_Host *shost, unsigned long time)
 		stat = 1;
 		goto finished;
 	}
-	if (time >= msecs_to_jiffies(30 * 1000)) {
+	if (time >= secs_to_jiffies(30)) {
 		lpfc_printf_log(phba, KERN_INFO, LOG_INIT,
 				"0461 Scanning longer than 30 "
 				"seconds.  Continuing initialization\n");
 		stat = 1;
 		goto finished;
 	}
-	if (time >= msecs_to_jiffies(15 * 1000) &&
+	if (time >= secs_to_jiffies(15) &&
 	    phba->link_state <= LPFC_LINK_DOWN) {
 		lpfc_printf_log(phba, KERN_INFO, LOG_INIT,
 				"0465 Link down longer than 15 "
@@ -4960,7 +4960,7 @@ int lpfc_scan_finished(struct Scsi_Host *shost, unsigned long time)
 	if (vport->num_disc_nodes || vport->fc_prli_sent)
 		goto finished;
 	if (!atomic_read(&vport->fc_map_cnt) &&
-	    time < msecs_to_jiffies(2 * 1000))
+	    time < secs_to_jiffies(2))
 		goto finished;
 	if ((phba->sli.sli_flag & LPFC_SLI_MBOX_ACTIVE) != 0)
 		goto finished;
@@ -5194,8 +5194,8 @@ lpfc_vmid_poll(struct timer_list *t)
 		lpfc_worker_wake_up(phba);
 
 	/* restart the timer for the next iteration */
-	mod_timer(&phba->inactive_vmid_poll, jiffies + msecs_to_jiffies(1000 *
-							LPFC_VMID_TIMER));
+	mod_timer(&phba->inactive_vmid_poll,
+		  jiffies + secs_to_jiffies(LPFC_VMID_TIMER));
 }
 
 /**
diff --git a/drivers/scsi/lpfc/lpfc_nportdisc.c b/drivers/scsi/lpfc/lpfc_nportdisc.c
index 4574716c8764fba6d6db103f1f287b7cdb87cebc..4185717f35defbde483b4ff9b1d71c9c3d86a07d 100644
--- a/drivers/scsi/lpfc/lpfc_nportdisc.c
+++ b/drivers/scsi/lpfc/lpfc_nportdisc.c
@@ -914,7 +914,7 @@ lpfc_rcv_logo(struct lpfc_vport *vport, struct lpfc_nodelist *ndlp,
 		    (ndlp->nlp_state >= NLP_STE_ADISC_ISSUE ||
 		     ndlp->nlp_state <= NLP_STE_PRLI_ISSUE)) {
 			mod_timer(&ndlp->nlp_delayfunc,
-				  jiffies + msecs_to_jiffies(1000 * 1));
+				  jiffies + secs_to_jiffies(1));
 			spin_lock_irq(&ndlp->lock);
 			ndlp->nlp_flag |= NLP_DELAY_TMO;
 			spin_unlock_irq(&ndlp->lock);
@@ -1355,7 +1355,7 @@ lpfc_rcv_els_plogi_issue(struct lpfc_vport *vport, struct lpfc_nodelist *ndlp,
 	}
 
 	/* Put ndlp in npr state set plogi timer for 1 sec */
-	mod_timer(&ndlp->nlp_delayfunc, jiffies + msecs_to_jiffies(1000 * 1));
+	mod_timer(&ndlp->nlp_delayfunc, jiffies + secs_to_jiffies(1));
 	spin_lock_irq(&ndlp->lock);
 	ndlp->nlp_flag |= NLP_DELAY_TMO;
 	spin_unlock_irq(&ndlp->lock);
@@ -1975,7 +1975,7 @@ lpfc_cmpl_reglogin_reglogin_issue(struct lpfc_vport *vport,
 
 		/* Put ndlp in npr state set plogi timer for 1 sec */
 		mod_timer(&ndlp->nlp_delayfunc,
-			  jiffies + msecs_to_jiffies(1000 * 1));
+			  jiffies + secs_to_jiffies(1));
 		spin_lock_irq(&ndlp->lock);
 		ndlp->nlp_flag |= NLP_DELAY_TMO;
 		spin_unlock_irq(&ndlp->lock);
@@ -2798,7 +2798,7 @@ lpfc_rcv_prlo_npr_node(struct lpfc_vport *vport, struct lpfc_nodelist *ndlp,
 
 	if ((ndlp->nlp_flag & NLP_DELAY_TMO) == 0) {
 		mod_timer(&ndlp->nlp_delayfunc,
-			  jiffies + msecs_to_jiffies(1000 * 1));
+			  jiffies + secs_to_jiffies(1));
 		spin_lock_irq(&ndlp->lock);
 		ndlp->nlp_flag |= NLP_DELAY_TMO;
 		ndlp->nlp_flag &= ~NLP_NPR_ADISC;
diff --git a/drivers/scsi/lpfc/lpfc_nvme.c b/drivers/scsi/lpfc/lpfc_nvme.c
index fec23c7237304b471e58194726ff7932b0010385..64d7060e0d4cb628c74c0fa22ece2b956155c1ba 100644
--- a/drivers/scsi/lpfc/lpfc_nvme.c
+++ b/drivers/scsi/lpfc/lpfc_nvme.c
@@ -2236,7 +2236,7 @@ lpfc_nvme_lport_unreg_wait(struct lpfc_vport *vport,
 	 * wait. Print a message if a 10 second wait expires and renew the
 	 * wait. This is unexpected.
 	 */
-	wait_tmo = msecs_to_jiffies(LPFC_NVME_WAIT_TMO * 1000);
+	wait_tmo = secs_to_jiffies(LPFC_NVME_WAIT_TMO);
 	while (true) {
 		ret = wait_for_completion_timeout(lport_unreg_cmp, wait_tmo);
 		if (unlikely(!ret)) {
diff --git a/drivers/scsi/lpfc/lpfc_sli.c b/drivers/scsi/lpfc/lpfc_sli.c
index 2ec6e55771b45ab70320a9ad1934d5ead2371d4c..b6f19c123e25a00c0eb4444476a7194d6b045824 100644
--- a/drivers/scsi/lpfc/lpfc_sli.c
+++ b/drivers/scsi/lpfc/lpfc_sli.c
@@ -9024,7 +9024,7 @@ lpfc_sli4_hba_setup(struct lpfc_hba *phba)
 
 	/* Start heart beat timer */
 	mod_timer(&phba->hb_tmofunc,
-		  jiffies + msecs_to_jiffies(1000 * LPFC_HB_MBOX_INTERVAL));
+		  jiffies + secs_to_jiffies(LPFC_HB_MBOX_INTERVAL));
 	clear_bit(HBA_HBEAT_INP, &phba->hba_flag);
 	clear_bit(HBA_HBEAT_TMO, &phba->hba_flag);
 	phba->last_completion_time = jiffies;
@@ -13335,7 +13335,7 @@ lpfc_sli_mbox_sys_shutdown(struct lpfc_hba *phba, int mbx_action)
 		lpfc_sli_mbox_sys_flush(phba);
 		return;
 	}
-	timeout = msecs_to_jiffies(LPFC_MBOX_TMO * 1000) + jiffies;
+	timeout = secs_to_jiffies(LPFC_MBOX_TMO) + jiffies;
 
 	/* Disable softirqs, including timers from obtaining phba->hbalock */
 	local_bh_disable();
diff --git a/drivers/scsi/lpfc/lpfc_vmid.c b/drivers/scsi/lpfc/lpfc_vmid.c
index cc3e4736f2fe29e1fd4afe221c9c7c40ecf382d4..14dbfe954e423acc47d1b1c80160ff193783f500 100644
--- a/drivers/scsi/lpfc/lpfc_vmid.c
+++ b/drivers/scsi/lpfc/lpfc_vmid.c
@@ -278,7 +278,7 @@ int lpfc_vmid_get_appid(struct lpfc_vport *vport, char *uuid,
 		if (!(vport->phba->pport->vmid_flag & LPFC_VMID_TIMER_ENBLD)) {
 			mod_timer(&vport->phba->inactive_vmid_poll,
 				  jiffies +
-				  msecs_to_jiffies(1000 * LPFC_VMID_TIMER));
+				  secs_to_jiffies(LPFC_VMID_TIMER));
 			vport->phba->pport->vmid_flag |= LPFC_VMID_TIMER_ENBLD;
 		}
 	}

-- 
2.34.1

