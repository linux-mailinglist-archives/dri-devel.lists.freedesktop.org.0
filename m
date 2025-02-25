Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD9EAA44C5D
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 21:17:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6838010E7D9;
	Tue, 25 Feb 2025 20:17:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="r05ca4cL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by gabe.freedesktop.org (Postfix) with ESMTP id 54AEB10E7C9
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 20:17:23 +0000 (UTC)
Received: from eahariha-devbox.internal.cloudapp.net (unknown [40.91.112.99])
 by linux.microsoft.com (Postfix) with ESMTPSA id E9C07203CDFE;
 Tue, 25 Feb 2025 12:17:19 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com E9C07203CDFE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1740514640;
 bh=82bbL98koRjJtuIS1TH+R5Xiyl6+1C/th2kMl65xMM8=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=r05ca4cLifQi9AJpcKwbPKAtGAH4LLN3RKKC/UO02jSsEcA3F49YHSL1tcdeVrcpX
 Xl/GrhrLQaulqN5p+IjcMId3V8cAq29YFvNcsnN3fNWQtUOcBvGau6S0eXWPFSzCIL
 2DWyU92SubkawHOG3U4SXmQg4lK5beWWFTwnPE80=
From: Easwar Hariharan <eahariha@linux.microsoft.com>
Date: Tue, 25 Feb 2025 20:17:16 +0000
Subject: [PATCH v3 02/16] scsi: lpfc: convert timeouts to secs_to_jiffies()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250225-converge-secs-to-jiffies-part-two-v3-2-a43967e36c88@linux.microsoft.com>
References: <20250225-converge-secs-to-jiffies-part-two-v3-0-a43967e36c88@linux.microsoft.com>
In-Reply-To: <20250225-converge-secs-to-jiffies-part-two-v3-0-a43967e36c88@linux.microsoft.com>
To: Andrew Morton <akpm@linux-foundation.org>, 
 Yaron Avizrat <yaron.avizrat@intel.com>, Oded Gabbay <ogabbay@kernel.org>, 
 Julia Lawall <Julia.Lawall@inria.fr>, Nicolas Palix <nicolas.palix@imag.fr>, 
 James Smart <james.smart@broadcom.com>, 
 Dick Kennedy <dick.kennedy@broadcom.com>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Chris Mason <clm@fb.com>, Josef Bacik <josef@toxicpanda.com>, 
 David Sterba <dsterba@suse.com>, Ilya Dryomov <idryomov@gmail.com>, 
 Dongsheng Yang <dongsheng.yang@easystack.cn>, Jens Axboe <axboe@kernel.dk>, 
 Xiubo Li <xiubli@redhat.com>, Damien Le Moal <dlemoal@kernel.org>, 
 Niklas Cassel <cassel@kernel.org>, Carlos Maiolino <cem@kernel.org>, 
 "Darrick J. Wong" <djwong@kernel.org>, Sebastian Reichel <sre@kernel.org>, 
 Keith Busch <kbusch@kernel.org>, Christoph Hellwig <hch@lst.de>, 
 Sagi Grimberg <sagi@grimberg.me>, Frank Li <Frank.Li@nxp.com>, 
 Mark Brown <broonie@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Henrique de Moraes Holschuh <hmh@hmh.eng.br>, 
 Selvin Xavier <selvin.xavier@broadcom.com>, 
 Kalesh AP <kalesh-anakkur.purayil@broadcom.com>, 
 Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>
Cc: cocci@inria.fr, linux-kernel@vger.kernel.org, 
 linux-scsi@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-sound@vger.kernel.org, linux-btrfs@vger.kernel.org, 
 ceph-devel@vger.kernel.org, linux-block@vger.kernel.org, 
 linux-ide@vger.kernel.org, linux-xfs@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-nvme@lists.infradead.org, 
 linux-spi@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, platform-driver-x86@vger.kernel.org, 
 ibm-acpi-devel@lists.sourceforge.net, linux-rdma@vger.kernel.org, 
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

Commit b35108a51cf7 ("jiffies: Define secs_to_jiffies()") introduced
secs_to_jiffies().  As the value here is a multiple of 1000, use
secs_to_jiffies() instead of msecs_to_jiffies() to avoid the multiplication

This is converted using scripts/coccinelle/misc/secs_to_jiffies.cocci with
the following Coccinelle rules:

@depends on patch@
expression E;
@@

-msecs_to_jiffies(E * 1000)
+secs_to_jiffies(E)

-msecs_to_jiffies(E * MSEC_PER_SEC)
+secs_to_jiffies(E)

While here, convert some timeouts that are denominated in seconds
manually.

Signed-off-by: Easwar Hariharan <eahariha@linux.microsoft.com>
---
 drivers/scsi/lpfc/lpfc.h         |  3 +--
 drivers/scsi/lpfc/lpfc_els.c     | 11 +++++------
 drivers/scsi/lpfc/lpfc_hbadisc.c |  2 +-
 drivers/scsi/lpfc/lpfc_init.c    | 10 +++++-----
 drivers/scsi/lpfc/lpfc_scsi.c    | 12 +++++-------
 drivers/scsi/lpfc/lpfc_sli.c     | 41 ++++++++++++++++------------------------
 drivers/scsi/lpfc/lpfc_vport.c   |  2 +-
 7 files changed, 34 insertions(+), 47 deletions(-)

diff --git a/drivers/scsi/lpfc/lpfc.h b/drivers/scsi/lpfc/lpfc.h
index 62438e84e52a3bf93aff6adf6c6fbbb61e3f1e3f..fe4fb67eb50c9b773d0fc0066b705024513faea4 100644
--- a/drivers/scsi/lpfc/lpfc.h
+++ b/drivers/scsi/lpfc/lpfc.h
@@ -74,8 +74,7 @@ struct lpfc_sli2_slim;
  * queue depths when there are driver resource error or Firmware
  * resource error.
  */
-/* 1 Second */
-#define QUEUE_RAMP_DOWN_INTERVAL	(msecs_to_jiffies(1000 * 1))
+#define QUEUE_RAMP_DOWN_INTERVAL	(secs_to_jiffies(1))
 
 /* Number of exchanges reserved for discovery to complete */
 #define LPFC_DISC_IOCB_BUFF_COUNT 20
diff --git a/drivers/scsi/lpfc/lpfc_els.c b/drivers/scsi/lpfc/lpfc_els.c
index 9ab2e98cf69336c8f6a0ceca3870cbecb6c77ef2..e08b48b1b655c2e145b30261bbdcb9a57d40e19e 100644
--- a/drivers/scsi/lpfc/lpfc_els.c
+++ b/drivers/scsi/lpfc/lpfc_els.c
@@ -8045,8 +8045,7 @@ lpfc_els_rcv_rscn(struct lpfc_vport *vport, struct lpfc_iocbq *cmdiocb,
 			if (test_bit(FC_DISC_TMO, &vport->fc_flag)) {
 				tmo = ((phba->fc_ratov * 3) + 3);
 				mod_timer(&vport->fc_disctmo,
-					  jiffies +
-					  msecs_to_jiffies(1000 * tmo));
+					  jiffies + secs_to_jiffies(tmo));
 			}
 			return 0;
 		}
@@ -8081,7 +8080,7 @@ lpfc_els_rcv_rscn(struct lpfc_vport *vport, struct lpfc_iocbq *cmdiocb,
 		if (test_bit(FC_DISC_TMO, &vport->fc_flag)) {
 			tmo = ((phba->fc_ratov * 3) + 3);
 			mod_timer(&vport->fc_disctmo,
-				  jiffies + msecs_to_jiffies(1000 * tmo));
+				  jiffies + secs_to_jiffies(tmo));
 		}
 		if ((rscn_cnt < FC_MAX_HOLD_RSCN) &&
 		    !test_bit(FC_RSCN_DISCOVERY, &vport->fc_flag)) {
@@ -9511,7 +9510,7 @@ lpfc_els_timeout_handler(struct lpfc_vport *vport)
 	if (!list_empty(&pring->txcmplq))
 		if (!test_bit(FC_UNLOADING, &phba->pport->load_flag))
 			mod_timer(&vport->els_tmofunc,
-				  jiffies + msecs_to_jiffies(1000 * timeout));
+				  jiffies + secs_to_jiffies(timeout));
 }
 
 /**
@@ -10897,7 +10896,7 @@ lpfc_do_scr_ns_plogi(struct lpfc_hba *phba, struct lpfc_vport *vport)
 				 "3334 Delay fc port discovery for %d secs\n",
 				 phba->fc_ratov);
 		mod_timer(&vport->delayed_disc_tmo,
-			jiffies + msecs_to_jiffies(1000 * phba->fc_ratov));
+			jiffies + secs_to_jiffies(phba->fc_ratov));
 		return;
 	}
 
@@ -11154,7 +11153,7 @@ lpfc_retry_pport_discovery(struct lpfc_hba *phba)
 	if (!ndlp)
 		return;
 
-	mod_timer(&ndlp->nlp_delayfunc, jiffies + msecs_to_jiffies(1000));
+	mod_timer(&ndlp->nlp_delayfunc, jiffies + secs_to_jiffies(1));
 	set_bit(NLP_DELAY_TMO, &ndlp->nlp_flag);
 	ndlp->nlp_last_elscmd = ELS_CMD_FLOGI;
 	phba->pport->port_state = LPFC_FLOGI;
diff --git a/drivers/scsi/lpfc/lpfc_hbadisc.c b/drivers/scsi/lpfc/lpfc_hbadisc.c
index a2fd74cf86036ef134ec6959c90aada8a0218294..18c0365ca30563530189ca5eda7b9c8901398c82 100644
--- a/drivers/scsi/lpfc/lpfc_hbadisc.c
+++ b/drivers/scsi/lpfc/lpfc_hbadisc.c
@@ -4979,7 +4979,7 @@ lpfc_set_disctmo(struct lpfc_vport *vport)
 			tmo, vport->port_state, vport->fc_flag);
 	}
 
-	mod_timer(&vport->fc_disctmo, jiffies + msecs_to_jiffies(1000 * tmo));
+	mod_timer(&vport->fc_disctmo, jiffies + secs_to_jiffies(tmo));
 	set_bit(FC_DISC_TMO, &vport->fc_flag);
 
 	/* Start Discovery Timer state <hba_state> */
diff --git a/drivers/scsi/lpfc/lpfc_init.c b/drivers/scsi/lpfc/lpfc_init.c
index e1add109017b95fc87d024beb477ee424ea39df4..7238608ca49f9bcfc4d43acd6f400b12f2865589 100644
--- a/drivers/scsi/lpfc/lpfc_init.c
+++ b/drivers/scsi/lpfc/lpfc_init.c
@@ -595,7 +595,7 @@ lpfc_config_port_post(struct lpfc_hba *phba)
 	/* Set up ring-0 (ELS) timer */
 	timeout = phba->fc_ratov * 2;
 	mod_timer(&vport->els_tmofunc,
-		  jiffies + msecs_to_jiffies(1000 * timeout));
+		  jiffies + secs_to_jiffies(timeout));
 	/* Set up heart beat (HB) timer */
 	mod_timer(&phba->hb_tmofunc,
 		  jiffies + secs_to_jiffies(LPFC_HB_MBOX_INTERVAL));
@@ -604,7 +604,7 @@ lpfc_config_port_post(struct lpfc_hba *phba)
 	phba->last_completion_time = jiffies;
 	/* Set up error attention (ERATT) polling timer */
 	mod_timer(&phba->eratt_poll,
-		  jiffies + msecs_to_jiffies(1000 * phba->eratt_poll_interval));
+		  jiffies + secs_to_jiffies(phba->eratt_poll_interval));
 
 	if (test_bit(LINK_DISABLED, &phba->hba_flag)) {
 		lpfc_printf_log(phba, KERN_ERR, LOG_TRACE_EVENT,
@@ -3361,8 +3361,8 @@ lpfc_block_mgmt_io(struct lpfc_hba *phba, int mbx_action)
 		/* Determine how long we might wait for the active mailbox
 		 * command to be gracefully completed by firmware.
 		 */
-		timeout = msecs_to_jiffies(lpfc_mbox_tmo_val(phba,
-				phba->sli.mbox_active) * 1000) + jiffies;
+		timeout = secs_to_jiffies(lpfc_mbox_tmo_val(phba,
+				phba->sli.mbox_active)) + jiffies;
 	}
 	spin_unlock_irqrestore(&phba->hbalock, iflag);
 
@@ -6909,7 +6909,7 @@ lpfc_sli4_async_fip_evt(struct lpfc_hba *phba,
 			 * re-instantiate the Vlink using FDISC.
 			 */
 			mod_timer(&ndlp->nlp_delayfunc,
-				  jiffies + msecs_to_jiffies(1000));
+				  jiffies + secs_to_jiffies(1));
 			set_bit(NLP_DELAY_TMO, &ndlp->nlp_flag);
 			ndlp->nlp_last_elscmd = ELS_CMD_FDISC;
 			vport->port_state = LPFC_FDISC;
diff --git a/drivers/scsi/lpfc/lpfc_scsi.c b/drivers/scsi/lpfc/lpfc_scsi.c
index 055ed632c14df51376126a285df728269ca1da6c..f0158fc00f783239db615b0978b6785de064535f 100644
--- a/drivers/scsi/lpfc/lpfc_scsi.c
+++ b/drivers/scsi/lpfc/lpfc_scsi.c
@@ -5645,9 +5645,8 @@ lpfc_abort_handler(struct scsi_cmnd *cmnd)
 	 * cmd_flag is set to LPFC_DRIVER_ABORTED before we wait
 	 * for abort to complete.
 	 */
-	wait_event_timeout(waitq,
-			  (lpfc_cmd->pCmd != cmnd),
-			   msecs_to_jiffies(2*vport->cfg_devloss_tmo*1000));
+	wait_event_timeout(waitq, (lpfc_cmd->pCmd != cmnd),
+			   secs_to_jiffies(2*vport->cfg_devloss_tmo));
 
 	spin_lock(&lpfc_cmd->buf_lock);
 
@@ -5911,7 +5910,7 @@ lpfc_chk_tgt_mapped(struct lpfc_vport *vport, struct fc_rport *rport)
 	 * If target is not in a MAPPED state, delay until
 	 * target is rediscovered or devloss timeout expires.
 	 */
-	later = msecs_to_jiffies(2 * vport->cfg_devloss_tmo * 1000) + jiffies;
+	later = secs_to_jiffies(2 * vport->cfg_devloss_tmo) + jiffies;
 	while (time_after(later, jiffies)) {
 		if (!pnode)
 			return FAILED;
@@ -5957,7 +5956,7 @@ lpfc_reset_flush_io_context(struct lpfc_vport *vport, uint16_t tgt_id,
 		lpfc_sli_abort_taskmgmt(vport,
 					&phba->sli.sli3_ring[LPFC_FCP_RING],
 					tgt_id, lun_id, context);
-	later = msecs_to_jiffies(2 * vport->cfg_devloss_tmo * 1000) + jiffies;
+	later = secs_to_jiffies(2 * vport->cfg_devloss_tmo) + jiffies;
 	while (time_after(later, jiffies) && cnt) {
 		schedule_timeout_uninterruptible(msecs_to_jiffies(20));
 		cnt = lpfc_sli_sum_iocb(vport, tgt_id, lun_id, context);
@@ -6137,8 +6136,7 @@ lpfc_target_reset_handler(struct scsi_cmnd *cmnd)
 			wait_event_timeout(waitq,
 					   !test_bit(NLP_WAIT_FOR_LOGO,
 						     &pnode->save_flags),
-					   msecs_to_jiffies(dev_loss_tmo *
-							    1000));
+					   secs_to_jiffies(dev_loss_tmo));
 
 			if (test_and_clear_bit(NLP_WAIT_FOR_LOGO,
 					       &pnode->save_flags))
diff --git a/drivers/scsi/lpfc/lpfc_sli.c b/drivers/scsi/lpfc/lpfc_sli.c
index 3fd9723cd271c8a024b6f34e583668e973404e6f..531fd47cda5ca6985bfb510c44888ed6d7121853 100644
--- a/drivers/scsi/lpfc/lpfc_sli.c
+++ b/drivers/scsi/lpfc/lpfc_sli.c
@@ -1025,7 +1025,7 @@ lpfc_handle_rrq_active(struct lpfc_hba *phba)
 	LIST_HEAD(send_rrq);
 
 	clear_bit(HBA_RRQ_ACTIVE, &phba->hba_flag);
-	next_time = jiffies + msecs_to_jiffies(1000 * (phba->fc_ratov + 1));
+	next_time = jiffies + secs_to_jiffies(phba->fc_ratov + 1);
 	spin_lock_irqsave(&phba->rrq_list_lock, iflags);
 	list_for_each_entry_safe(rrq, nextrrq,
 				 &phba->active_rrq_list, list) {
@@ -1208,8 +1208,7 @@ lpfc_set_rrq_active(struct lpfc_hba *phba, struct lpfc_nodelist *ndlp,
 	else
 		rrq->send_rrq = 0;
 	rrq->xritag = xritag;
-	rrq->rrq_stop_time = jiffies +
-				msecs_to_jiffies(1000 * (phba->fc_ratov + 1));
+	rrq->rrq_stop_time = jiffies + secs_to_jiffies(phba->fc_ratov + 1);
 	rrq->nlp_DID = ndlp->nlp_DID;
 	rrq->vport = ndlp->vport;
 	rrq->rxid = rxid;
@@ -1736,8 +1735,7 @@ lpfc_sli_ringtxcmpl_put(struct lpfc_hba *phba, struct lpfc_sli_ring *pring,
 		BUG_ON(!piocb->vport);
 		if (!test_bit(FC_UNLOADING, &piocb->vport->load_flag))
 			mod_timer(&piocb->vport->els_tmofunc,
-				  jiffies +
-				  msecs_to_jiffies(1000 * (phba->fc_ratov << 1)));
+				  jiffies + secs_to_jiffies(phba->fc_ratov << 1));
 	}
 
 	return 0;
@@ -3956,8 +3954,7 @@ void lpfc_poll_eratt(struct timer_list *t)
 	else
 		/* Restart the timer for next eratt poll */
 		mod_timer(&phba->eratt_poll,
-			  jiffies +
-			  msecs_to_jiffies(1000 * phba->eratt_poll_interval));
+			  jiffies + secs_to_jiffies(phba->eratt_poll_interval);
 	return;
 }
 
@@ -9008,7 +9005,7 @@ lpfc_sli4_hba_setup(struct lpfc_hba *phba)
 
 	/* Start the ELS watchdog timer */
 	mod_timer(&vport->els_tmofunc,
-		  jiffies + msecs_to_jiffies(1000 * (phba->fc_ratov * 2)));
+			jiffies + secs_to_jiffies(phba->fc_ratov * 2));
 
 	/* Start heart beat timer */
 	mod_timer(&phba->hb_tmofunc,
@@ -9027,7 +9024,7 @@ lpfc_sli4_hba_setup(struct lpfc_hba *phba)
 
 	/* Start error attention (ERATT) polling timer */
 	mod_timer(&phba->eratt_poll,
-		  jiffies + msecs_to_jiffies(1000 * phba->eratt_poll_interval));
+		  jiffies + secs_to_jiffies(phba->eratt_poll_interval));
 
 	/*
 	 * The port is ready, set the host's link state to LINK_DOWN
@@ -9504,8 +9501,7 @@ lpfc_sli_issue_mbox_s3(struct lpfc_hba *phba, LPFC_MBOXQ_t *pmbox,
 			goto out_not_finished;
 		}
 		/* timeout active mbox command */
-		timeout = msecs_to_jiffies(lpfc_mbox_tmo_val(phba, pmbox) *
-					   1000);
+		timeout = secs_to_jiffies(lpfc_mbox_tmo_val(phba, pmbox));
 		mod_timer(&psli->mbox_tmo, jiffies + timeout);
 	}
 
@@ -9629,8 +9625,7 @@ lpfc_sli_issue_mbox_s3(struct lpfc_hba *phba, LPFC_MBOXQ_t *pmbox,
 						       drvr_flag);
 			goto out_not_finished;
 		}
-		timeout = msecs_to_jiffies(lpfc_mbox_tmo_val(phba, pmbox) *
-							1000) + jiffies;
+		timeout = secs_to_jiffies(lpfc_mbox_tmo_val(phba, pmbox)) + jiffies;
 		i = 0;
 		/* Wait for command to complete */
 		while (((word0 & OWN_CHIP) == OWN_CHIP) ||
@@ -9756,9 +9751,8 @@ lpfc_sli4_async_mbox_block(struct lpfc_hba *phba)
 	 * command to be gracefully completed by firmware.
 	 */
 	if (phba->sli.mbox_active)
-		timeout = msecs_to_jiffies(lpfc_mbox_tmo_val(phba,
-						phba->sli.mbox_active) *
-						1000) + jiffies;
+		timeout = secs_to_jiffies(lpfc_mbox_tmo_val(phba,
+						phba->sli.mbox_active)) + jiffies;
 	spin_unlock_irq(&phba->hbalock);
 
 	/* Make sure the mailbox is really active */
@@ -9881,8 +9875,7 @@ lpfc_sli4_wait_bmbx_ready(struct lpfc_hba *phba, LPFC_MBOXQ_t *mboxq)
 		}
 	}
 
-	timeout = msecs_to_jiffies(lpfc_mbox_tmo_val(phba, mboxq)
-				   * 1000) + jiffies;
+	timeout = secs_to_jiffies(lpfc_mbox_tmo_val(phba, mboxq)) + jiffies;
 
 	do {
 		bmbx_reg.word0 = readl(phba->sli4_hba.BMBXregaddr);
@@ -10230,7 +10223,7 @@ lpfc_sli4_post_async_mbox(struct lpfc_hba *phba)
 
 	/* Start timer for the mbox_tmo and log some mailbox post messages */
 	mod_timer(&psli->mbox_tmo, (jiffies +
-		  msecs_to_jiffies(1000 * lpfc_mbox_tmo_val(phba, mboxq))));
+		  secs_to_jiffies(lpfc_mbox_tmo_val(phba, mboxq))));
 
 	lpfc_printf_log(phba, KERN_INFO, LOG_MBOX | LOG_SLI,
 			"(%d):0355 Mailbox cmd x%x (x%x/x%x) issue Data: "
@@ -13159,7 +13152,7 @@ lpfc_sli_issue_iocb_wait(struct lpfc_hba *phba,
 	retval = lpfc_sli_issue_iocb(phba, ring_number, piocb,
 				     SLI_IOCB_RET_IOCB);
 	if (retval == IOCB_SUCCESS) {
-		timeout_req = msecs_to_jiffies(timeout * 1000);
+		timeout_req = secs_to_jiffies(timeout);
 		timeleft = wait_event_timeout(done_q,
 				lpfc_chk_iocb_flg(phba, piocb, LPFC_IO_WAKE),
 				timeout_req);
@@ -13275,8 +13268,7 @@ lpfc_sli_issue_mbox_wait(struct lpfc_hba *phba, LPFC_MBOXQ_t *pmboxq,
 	/* now issue the command */
 	retval = lpfc_sli_issue_mbox(phba, pmboxq, MBX_NOWAIT);
 	if (retval == MBX_BUSY || retval == MBX_SUCCESS) {
-		wait_for_completion_timeout(&mbox_done,
-					    msecs_to_jiffies(timeout * 1000));
+		wait_for_completion_timeout(&mbox_done, secs_to_jiffies(timeout));
 
 		spin_lock_irqsave(&phba->hbalock, flag);
 		pmboxq->ctx_u.mbox_wait = NULL;
@@ -13336,9 +13328,8 @@ lpfc_sli_mbox_sys_shutdown(struct lpfc_hba *phba, int mbx_action)
 		 * command to be gracefully completed by firmware.
 		 */
 		if (phba->sli.mbox_active)
-			timeout = msecs_to_jiffies(lpfc_mbox_tmo_val(phba,
-						phba->sli.mbox_active) *
-						1000) + jiffies;
+			timeout = secs_to_jiffies(lpfc_mbox_tmo_val(phba,
+						phba->sli.mbox_active)) + jiffies;
 		spin_unlock_irq(&phba->hbalock);
 
 		/* Enable softirqs again, done with phba->hbalock */
diff --git a/drivers/scsi/lpfc/lpfc_vport.c b/drivers/scsi/lpfc/lpfc_vport.c
index 3d70cc5175730b31eeaf46c89d65c0dc09367d44..cc56a73343195a263c307fab6870a0012899060a 100644
--- a/drivers/scsi/lpfc/lpfc_vport.c
+++ b/drivers/scsi/lpfc/lpfc_vport.c
@@ -246,7 +246,7 @@ static void lpfc_discovery_wait(struct lpfc_vport *vport)
 	 * fabric RA_TOV value and dev_loss tmo.  The driver's
 	 * devloss_tmo is 10 giving this loop a 3x multiplier minimally.
 	 */
-	wait_time_max = msecs_to_jiffies(((phba->fc_ratov * 3) + 3) * 1000);
+	wait_time_max = secs_to_jiffies((phba->fc_ratov * 3) + 3);
 	wait_time_max += jiffies;
 	start_time = jiffies;
 	while (time_before(jiffies, wait_time_max)) {

-- 
2.43.0

