Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +NzzGA2yqmluVQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 11:53:01 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 037D621F3A0
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 11:53:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0732210ECE1;
	Fri,  6 Mar 2026 10:52:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="T1Coz9c2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C1BB10ECDF;
 Fri,  6 Mar 2026 10:52:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 4B8B4439EA;
 Fri,  6 Mar 2026 10:52:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75451C4CEF7;
 Fri,  6 Mar 2026 10:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772794378;
 bh=VWcRQoEk7f6OfUuHnyK0rLk3wW40uR7aczrF6CG478U=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=T1Coz9c2meVSonV/4+tzW95PjVM5gkY7Ga7MU9dyPSNqWo7BiEuO5yuNFW/D77C5N
 07W/50XBDa/lBLK9HsBMByN6ThjNLIk1gS8wDaqxkG9qoE7x1oRF/cB+ahE6rnCDWA
 ActyZz/xR0DoDXxzkzCR6xM/P6qTTTYU0uCRhOX8PGRU/FTiVpsFBis4u6jh/S/6jU
 owcver8gnHS3AfWyZ724GWfxPWlrAXCnQdApdo8sQoe9BjF80i+fyiwQZoFALN2Y2C
 i8iB17EvZWN5mHIwL/g8udwD4ghde1dM8hyRGbEas3m/IGunPHvSfAwg7iCOAJQzj5
 J7zqT8uaCBrdQ==
From: Sumit Garg <sumit.garg@kernel.org>
To: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-media@vger.kernel.org, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
 linux-remoteproc@vger.kernel.org
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, robin.clark@oss.qualcomm.com,
 sean@poorly.run, akhilpo@oss.qualcomm.com, lumag@kernel.org,
 abhinav.kumar@linux.dev, jesszhan0024@gmail.com,
 marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch,
 vikash.garodia@oss.qualcomm.com, dikshita.agarwal@oss.qualcomm.com,
 bod@kernel.org, mchehab@kernel.org, elder@kernel.org,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, jjohnson@kernel.org,
 mathieu.poirier@linaro.org, trilokkumar.soni@oss.qualcomm.com,
 mukesh.ojha@oss.qualcomm.com, pavan.kondeti@oss.qualcomm.com,
 jorge.ramirez@oss.qualcomm.com, tonyh@qti.qualcomm.com,
 vignesh.viswanathan@oss.qualcomm.com, srinivas.kandagatla@oss.qualcomm.com,
 amirreza.zarrabi@oss.qualcomm.com, jens.wiklander@linaro.org,
 op-tee@lists.trustedfirmware.org, apurupa@qti.qualcomm.com,
 skare@qti.qualcomm.com, Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: [PATCH 08/14] remoteproc: qcom_wcnss: Switch to generic PAS TZ APIs
Date: Fri,  6 Mar 2026 16:20:21 +0530
Message-ID: <20260306105027.290375-9-sumit.garg@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260306105027.290375-1-sumit.garg@kernel.org>
References: <20260306105027.290375-1-sumit.garg@kernel.org>
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
X-Rspamd-Queue-Id: 037D621F3A0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[48];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,poorly.run,linux.dev,gmail.com,somainline.org,ffwll.ch,lunn.ch,davemloft.net,google.com,redhat.com,linaro.org,qti.qualcomm.com,lists.trustedfirmware.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sumit.garg@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt,netdev];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Action: no action

From: Sumit Garg <sumit.garg@oss.qualcomm.com>

Switch qcom_wcnss client driver over to generic PAS TZ APIs. Generic PAS
TZ service allows to support multiple TZ implementation backends like QTEE
based SCM PAS service, OP-TEE based PAS service and any further future TZ
backend service.

Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_wcnss.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/remoteproc/qcom_wcnss.c b/drivers/remoteproc/qcom_wcnss.c
index ee18bf2e8054..1fd9344b0956 100644
--- a/drivers/remoteproc/qcom_wcnss.c
+++ b/drivers/remoteproc/qcom_wcnss.c
@@ -19,7 +19,7 @@
 #include <linux/platform_device.h>
 #include <linux/pm_domain.h>
 #include <linux/pm_runtime.h>
-#include <linux/firmware/qcom/qcom_scm.h>
+#include <linux/firmware/qcom/qcom_pas.h>
 #include <linux/regulator/consumer.h>
 #include <linux/remoteproc.h>
 #include <linux/soc/qcom/mdt_loader.h>
@@ -257,7 +257,7 @@ static int wcnss_start(struct rproc *rproc)
 	wcnss_indicate_nv_download(wcnss);
 	wcnss_configure_iris(wcnss);
 
-	ret = qcom_scm_pas_auth_and_reset(WCNSS_PAS_ID);
+	ret = qcom_pas_auth_and_reset(WCNSS_PAS_ID);
 	if (ret) {
 		dev_err(wcnss->dev,
 			"failed to authenticate image and release reset\n");
@@ -269,7 +269,7 @@ static int wcnss_start(struct rproc *rproc)
 	if (wcnss->ready_irq > 0 && ret == 0) {
 		/* We have a ready_irq, but it didn't fire in time. */
 		dev_err(wcnss->dev, "start timed out\n");
-		qcom_scm_pas_shutdown(WCNSS_PAS_ID);
+		qcom_pas_shutdown(WCNSS_PAS_ID);
 		ret = -ETIMEDOUT;
 		goto disable_iris;
 	}
@@ -311,7 +311,7 @@ static int wcnss_stop(struct rproc *rproc)
 					    0);
 	}
 
-	ret = qcom_scm_pas_shutdown(WCNSS_PAS_ID);
+	ret = qcom_pas_shutdown(WCNSS_PAS_ID);
 	if (ret)
 		dev_err(wcnss->dev, "failed to shutdown: %d\n", ret);
 
@@ -557,10 +557,10 @@ static int wcnss_probe(struct platform_device *pdev)
 
 	data = of_device_get_match_data(&pdev->dev);
 
-	if (!qcom_scm_is_available())
+	if (!qcom_pas_is_available())
 		return -EPROBE_DEFER;
 
-	if (!qcom_scm_pas_supported(WCNSS_PAS_ID)) {
+	if (!qcom_pas_supported(WCNSS_PAS_ID)) {
 		dev_err(&pdev->dev, "PAS is not available for WCNSS\n");
 		return -ENXIO;
 	}
-- 
2.51.0

