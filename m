Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC72CCCDDE
	for <lists+dri-devel@lfdr.de>; Thu, 18 Dec 2025 17:51:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3AB510E139;
	Thu, 18 Dec 2025 16:51:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Ww2a8fBE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0210D10E139
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 16:51:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id A3F4143A4D;
 Thu, 18 Dec 2025 16:51:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7040DC116D0;
 Thu, 18 Dec 2025 16:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1766076708;
 bh=YxHTWrJYc+g6iLoPGlsZLRmW365iCw1itGiu1ndEaZ8=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=Ww2a8fBErtSdtBizbRqB+LuKC5HOn3LkHX4qKZyZH2JqaQgpJD9ypPKyWaqBG9LYj
 ITcU3rKgugE9iP/l9I41hhHongq9aH3FwgybYfLbF56cSJdbm2iEu4B6fW0qifXqMd
 qrK5Ntp1pDGAcW+VyKImzHWI+XGcTkHoQ2NdKQo+nGusj6tcKS8Pvzx4hD94iitNdO
 GpAcMoQmb+Rmdqx+sAfUWbmu3iLREAOK1o0E7IQ1hsqWAkkplTkjqC0PvSdvFVobGk
 1Rs4atKXhngYIWjc2ehm9eqLXPgubcaMnMqZ8l9ExQIV8CIupGUV4kdemIb6yLuuAZ
 rkmgJvFvonJxA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 5EEA7D6E2B2;
 Thu, 18 Dec 2025 16:51:48 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay
 <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>
Date: Thu, 18 Dec 2025 22:21:44 +0530
Subject: [PATCH v2 1/2] net: qrtr: Drop the MHI auto_queue feature for IPCR
 DL channels
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251218-qrtr-fix-v2-1-c7499bfcfbe0@oss.qualcomm.com>
References: <20251218-qrtr-fix-v2-0-c7499bfcfbe0@oss.qualcomm.com>
In-Reply-To: <20251218-qrtr-fix-v2-0-c7499bfcfbe0@oss.qualcomm.com>
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>, 
 Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>, 
 Oded Gabbay <ogabbay@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
 Jeff Johnson <jjohnson@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Maxim Kochetkov <fido_max@inbox.ru>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, mhi@lists.linux.dev, 
 linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, 
 ath12k@lists.infradead.org, netdev@vger.kernel.org, 
 Bjorn Andersson <andersson@kernel.org>, Johan Hovold <johan@kernel.org>, 
 Chris Lew <quic_clew@quicinc.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=20271;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=WL+sdUsNc6R2lsvJYk7eg1/QItYMInVMp9bpp60qYvo=;
 b=owGbwMvMwMUYOl/w2b+J574ynlZLYsh0MVS6H5HkaxJf0a8bvjflmfOBqy6PbsuaR2z77i42e
 8b7JLZNnYzGLAyMXAyyYoos6UudtRo9Tt9YEqE+HWYQKxPIFAYuTgGYSNZD9n92S5wNAsrnm6sc
 fZitvdD2aLxt7+LklMuHd7tKJP1i1u2UYjmdNF9V3SPg41/Lc9vmzZrFu9e/7YJxbJ2GMfvvlG7
 lnyz/vXoM/hUEaE9va/3DMevD6xjBWbsjwq2Xr74j25v38J/7sVO1Zue+dv5PKYsxkNp5zcreZf
 f6O2fDv2eE9zby/cs8fy4mIiQjY6mXok1Q2Jd2qZaUtoP/jgs3F53eOMHRVcfZrk94+cqjPapXl
 NPFts3cEbTrqffeHeoeGfvit4S5mMmG6xd1Sd9Y81EsUvOvw42Vu47/YRA0P5sXW+HGqxf1t5u5
 W6Oxv9CI692phl/6dpoaMf1zp8w3jTDksqpgfHM9NnQ3AA==
X-Developer-Key: i=manivannan.sadhasivam@oss.qualcomm.com; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Endpoint-Received: by B4 Relay for
 manivannan.sadhasivam@oss.qualcomm.com/default with auth_id=461
X-Original-From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
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
Reply-To: manivannan.sadhasivam@oss.qualcomm.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

MHI stack offers the 'auto_queue' feature, which allows the MHI stack to
auto queue the buffers for the RX path (DL channel). Though this feature
simplifies the client driver design, it introduces race between the client
drivers and the MHI stack. For instance, with auto_queue, the 'dl_callback'
for the DL channel may get called before the client driver is fully probed.
This means, by the time the dl_callback gets called, the client driver's
structures might not be initialized, leading to NULL ptr dereference.

Currently, the drivers have to workaround this issue by initializing the
internal structures before calling mhi_prepare_for_transfer_autoqueue().
But even so, there is a chance that the client driver's internal code path
may call the MHI queue APIs before mhi_prepare_for_transfer_autoqueue() is
called, leading to similar NULL ptr dereference. This issue has been
reported on the Qcom X1E80100 CRD machines affecting boot.

So to properly fix all these races, drop the MHI 'auto_queue' feature
altogether and let the client driver (QRTR) manage the RX buffers manually.
In the QRTR driver, queue the RX buffers based on the ring length during
probe and recycle the buffers in 'dl_callback' once they are consumed. This
also warrants removing the setting of 'auto_queue' flag from controller
drivers.

Currently, this 'auto_queue' feature is only enabled for IPCR DL channel.
So only the QRTR client driver requires the modification.

Fixes: 227fee5fc99e ("bus: mhi: core: Add an API for auto queueing buffers for DL channel")
Fixes: 68a838b84eff ("net: qrtr: start MHI channel after endpoit creation")
Reported-by: Johan Hovold <johan@kernel.org>
Closes: https://lore.kernel.org/linux-arm-msm/ZyTtVdkCCES0lkl4@hovoldconsulting.com
Suggested-by: Chris Lew <quic_clew@quicinc.com>
Acked-by: Jeff Johnson <jjohnson@kernel.org> # drivers/net/wireless/ath/...
Cc: stable@vger.kernel.org
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 drivers/accel/qaic/mhi_controller.c   | 44 ----------------------
 drivers/bus/mhi/host/pci_generic.c    | 20 +---------
 drivers/net/wireless/ath/ath11k/mhi.c |  4 --
 drivers/net/wireless/ath/ath12k/mhi.c |  4 --
 net/qrtr/mhi.c                        | 69 +++++++++++++++++++++++++++++------
 5 files changed, 60 insertions(+), 81 deletions(-)

diff --git a/drivers/accel/qaic/mhi_controller.c b/drivers/accel/qaic/mhi_controller.c
index 13a14c6c6168..4d787f77ce41 100644
--- a/drivers/accel/qaic/mhi_controller.c
+++ b/drivers/accel/qaic/mhi_controller.c
@@ -39,7 +39,6 @@ static const struct mhi_channel_config aic100_channels[] = {
 		.lpm_notify = false,
 		.offload_channel = false,
 		.doorbell_mode_switch = false,
-		.auto_queue = false,
 		.wake_capable = false,
 	},
 	{
@@ -55,7 +54,6 @@ static const struct mhi_channel_config aic100_channels[] = {
 		.lpm_notify = false,
 		.offload_channel = false,
 		.doorbell_mode_switch = false,
-		.auto_queue = false,
 		.wake_capable = false,
 	},
 	{
@@ -71,7 +69,6 @@ static const struct mhi_channel_config aic100_channels[] = {
 		.lpm_notify = false,
 		.offload_channel = false,
 		.doorbell_mode_switch = false,
-		.auto_queue = false,
 		.wake_capable = false,
 	},
 	{
@@ -87,7 +84,6 @@ static const struct mhi_channel_config aic100_channels[] = {
 		.lpm_notify = false,
 		.offload_channel = false,
 		.doorbell_mode_switch = false,
-		.auto_queue = false,
 		.wake_capable = false,
 	},
 	{
@@ -103,7 +99,6 @@ static const struct mhi_channel_config aic100_channels[] = {
 		.lpm_notify = false,
 		.offload_channel = false,
 		.doorbell_mode_switch = false,
-		.auto_queue = false,
 		.wake_capable = false,
 	},
 	{
@@ -119,7 +114,6 @@ static const struct mhi_channel_config aic100_channels[] = {
 		.lpm_notify = false,
 		.offload_channel = false,
 		.doorbell_mode_switch = false,
-		.auto_queue = false,
 		.wake_capable = false,
 	},
 	{
@@ -135,7 +129,6 @@ static const struct mhi_channel_config aic100_channels[] = {
 		.lpm_notify = false,
 		.offload_channel = false,
 		.doorbell_mode_switch = false,
-		.auto_queue = false,
 		.wake_capable = false,
 	},
 	{
@@ -151,7 +144,6 @@ static const struct mhi_channel_config aic100_channels[] = {
 		.lpm_notify = false,
 		.offload_channel = false,
 		.doorbell_mode_switch = false,
-		.auto_queue = false,
 		.wake_capable = false,
 	},
 	{
@@ -167,7 +159,6 @@ static const struct mhi_channel_config aic100_channels[] = {
 		.lpm_notify = false,
 		.offload_channel = false,
 		.doorbell_mode_switch = false,
-		.auto_queue = false,
 		.wake_capable = false,
 	},
 	{
@@ -183,7 +174,6 @@ static const struct mhi_channel_config aic100_channels[] = {
 		.lpm_notify = false,
 		.offload_channel = false,
 		.doorbell_mode_switch = false,
-		.auto_queue = false,
 		.wake_capable = false,
 	},
 	{
@@ -199,7 +189,6 @@ static const struct mhi_channel_config aic100_channels[] = {
 		.lpm_notify = false,
 		.offload_channel = false,
 		.doorbell_mode_switch = false,
-		.auto_queue = false,
 		.wake_capable = false,
 	},
 	{
@@ -215,7 +204,6 @@ static const struct mhi_channel_config aic100_channels[] = {
 		.lpm_notify = false,
 		.offload_channel = false,
 		.doorbell_mode_switch = false,
-		.auto_queue = false,
 		.wake_capable = false,
 	},
 	{
@@ -231,7 +219,6 @@ static const struct mhi_channel_config aic100_channels[] = {
 		.lpm_notify = false,
 		.offload_channel = false,
 		.doorbell_mode_switch = false,
-		.auto_queue = false,
 		.wake_capable = false,
 	},
 	{
@@ -247,7 +234,6 @@ static const struct mhi_channel_config aic100_channels[] = {
 		.lpm_notify = false,
 		.offload_channel = false,
 		.doorbell_mode_switch = false,
-		.auto_queue = false,
 		.wake_capable = false,
 	},
 	{
@@ -263,7 +249,6 @@ static const struct mhi_channel_config aic100_channels[] = {
 		.lpm_notify = false,
 		.offload_channel = false,
 		.doorbell_mode_switch = false,
-		.auto_queue = false,
 		.wake_capable = false,
 	},
 	{
@@ -279,7 +264,6 @@ static const struct mhi_channel_config aic100_channels[] = {
 		.lpm_notify = false,
 		.offload_channel = false,
 		.doorbell_mode_switch = false,
-		.auto_queue = false,
 		.wake_capable = false,
 	},
 	{
@@ -295,7 +279,6 @@ static const struct mhi_channel_config aic100_channels[] = {
 		.lpm_notify = false,
 		.offload_channel = false,
 		.doorbell_mode_switch = false,
-		.auto_queue = false,
 		.wake_capable = false,
 	},
 	{
@@ -311,7 +294,6 @@ static const struct mhi_channel_config aic100_channels[] = {
 		.lpm_notify = false,
 		.offload_channel = false,
 		.doorbell_mode_switch = false,
-		.auto_queue = false,
 		.wake_capable = false,
 	},
 	{
@@ -327,7 +309,6 @@ static const struct mhi_channel_config aic100_channels[] = {
 		.lpm_notify = false,
 		.offload_channel = false,
 		.doorbell_mode_switch = false,
-		.auto_queue = false,
 		.wake_capable = false,
 	},
 	{
@@ -343,7 +324,6 @@ static const struct mhi_channel_config aic100_channels[] = {
 		.lpm_notify = false,
 		.offload_channel = false,
 		.doorbell_mode_switch = false,
-		.auto_queue = false,
 		.wake_capable = false,
 	},
 	{
@@ -359,7 +339,6 @@ static const struct mhi_channel_config aic100_channels[] = {
 		.lpm_notify = false,
 		.offload_channel = false,
 		.doorbell_mode_switch = false,
-		.auto_queue = false,
 		.wake_capable = false,
 	},
 	{
@@ -375,7 +354,6 @@ static const struct mhi_channel_config aic100_channels[] = {
 		.lpm_notify = false,
 		.offload_channel = false,
 		.doorbell_mode_switch = false,
-		.auto_queue = false,
 		.wake_capable = false,
 	},
 	{
@@ -391,7 +369,6 @@ static const struct mhi_channel_config aic100_channels[] = {
 		.lpm_notify = false,
 		.offload_channel = false,
 		.doorbell_mode_switch = false,
-		.auto_queue = false,
 		.wake_capable = false,
 	},
 	{
@@ -407,7 +384,6 @@ static const struct mhi_channel_config aic100_channels[] = {
 		.lpm_notify = false,
 		.offload_channel = false,
 		.doorbell_mode_switch = false,
-		.auto_queue = false,
 		.wake_capable = false,
 	},
 	{
@@ -423,7 +399,6 @@ static const struct mhi_channel_config aic100_channels[] = {
 		.lpm_notify = false,
 		.offload_channel = false,
 		.doorbell_mode_switch = false,
-		.auto_queue = false,
 		.wake_capable = false,
 	},
 	{
@@ -439,7 +414,6 @@ static const struct mhi_channel_config aic100_channels[] = {
 		.lpm_notify = false,
 		.offload_channel = false,
 		.doorbell_mode_switch = false,
-		.auto_queue = true,
 		.wake_capable = false,
 	},
 };
@@ -458,7 +432,6 @@ static const struct mhi_channel_config aic200_channels[] = {
 		.lpm_notify = false,
 		.offload_channel = false,
 		.doorbell_mode_switch = false,
-		.auto_queue = false,
 		.wake_capable = false,
 	},
 	{
@@ -474,7 +447,6 @@ static const struct mhi_channel_config aic200_channels[] = {
 		.lpm_notify = false,
 		.offload_channel = false,
 		.doorbell_mode_switch = false,
-		.auto_queue = false,
 		.wake_capable = false,
 	},
 	{
@@ -490,7 +462,6 @@ static const struct mhi_channel_config aic200_channels[] = {
 		.lpm_notify = false,
 		.offload_channel = false,
 		.doorbell_mode_switch = false,
-		.auto_queue = false,
 		.wake_capable = false,
 	},
 	{
@@ -506,7 +477,6 @@ static const struct mhi_channel_config aic200_channels[] = {
 		.lpm_notify = false,
 		.offload_channel = false,
 		.doorbell_mode_switch = false,
-		.auto_queue = false,
 		.wake_capable = false,
 	},
 	{
@@ -522,7 +492,6 @@ static const struct mhi_channel_config aic200_channels[] = {
 		.lpm_notify = false,
 		.offload_channel = false,
 		.doorbell_mode_switch = false,
-		.auto_queue = false,
 		.wake_capable = false,
 	},
 	{
@@ -538,7 +507,6 @@ static const struct mhi_channel_config aic200_channels[] = {
 		.lpm_notify = false,
 		.offload_channel = false,
 		.doorbell_mode_switch = false,
-		.auto_queue = false,
 		.wake_capable = false,
 	},
 	{
@@ -554,7 +522,6 @@ static const struct mhi_channel_config aic200_channels[] = {
 		.lpm_notify = false,
 		.offload_channel = false,
 		.doorbell_mode_switch = false,
-		.auto_queue = false,
 		.wake_capable = false,
 	},
 	{
@@ -570,7 +537,6 @@ static const struct mhi_channel_config aic200_channels[] = {
 		.lpm_notify = false,
 		.offload_channel = false,
 		.doorbell_mode_switch = false,
-		.auto_queue = false,
 		.wake_capable = false,
 	},
 	{
@@ -586,7 +552,6 @@ static const struct mhi_channel_config aic200_channels[] = {
 		.lpm_notify = false,
 		.offload_channel = false,
 		.doorbell_mode_switch = false,
-		.auto_queue = false,
 		.wake_capable = false,
 	},
 	{
@@ -602,7 +567,6 @@ static const struct mhi_channel_config aic200_channels[] = {
 		.lpm_notify = false,
 		.offload_channel = false,
 		.doorbell_mode_switch = false,
-		.auto_queue = false,
 		.wake_capable = false,
 	},
 	{
@@ -618,7 +582,6 @@ static const struct mhi_channel_config aic200_channels[] = {
 		.lpm_notify = false,
 		.offload_channel = false,
 		.doorbell_mode_switch = false,
-		.auto_queue = false,
 		.wake_capable = false,
 	},
 	{
@@ -634,7 +597,6 @@ static const struct mhi_channel_config aic200_channels[] = {
 		.lpm_notify = false,
 		.offload_channel = false,
 		.doorbell_mode_switch = false,
-		.auto_queue = false,
 		.wake_capable = false,
 	},
 	{
@@ -650,7 +612,6 @@ static const struct mhi_channel_config aic200_channels[] = {
 		.lpm_notify = false,
 		.offload_channel = false,
 		.doorbell_mode_switch = false,
-		.auto_queue = false,
 		.wake_capable = false,
 	},
 	{
@@ -666,7 +627,6 @@ static const struct mhi_channel_config aic200_channels[] = {
 		.lpm_notify = false,
 		.offload_channel = false,
 		.doorbell_mode_switch = false,
-		.auto_queue = false,
 		.wake_capable = false,
 	},
 	{
@@ -682,7 +642,6 @@ static const struct mhi_channel_config aic200_channels[] = {
 		.lpm_notify = false,
 		.offload_channel = false,
 		.doorbell_mode_switch = false,
-		.auto_queue = false,
 		.wake_capable = false,
 	},
 	{
@@ -698,7 +657,6 @@ static const struct mhi_channel_config aic200_channels[] = {
 		.lpm_notify = false,
 		.offload_channel = false,
 		.doorbell_mode_switch = false,
-		.auto_queue = false,
 		.wake_capable = false,
 	},
 	{
@@ -714,7 +672,6 @@ static const struct mhi_channel_config aic200_channels[] = {
 		.lpm_notify = false,
 		.offload_channel = false,
 		.doorbell_mode_switch = false,
-		.auto_queue = false,
 		.wake_capable = false,
 	},
 	{
@@ -730,7 +687,6 @@ static const struct mhi_channel_config aic200_channels[] = {
 		.lpm_notify = false,
 		.offload_channel = false,
 		.doorbell_mode_switch = false,
-		.auto_queue = true,
 		.wake_capable = false,
 	},
 };
diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index e3bc737313a2..0884a384b77f 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -94,22 +94,6 @@ struct mhi_pci_dev_info {
 		.doorbell_mode_switch = false,		\
 	}
 
-#define MHI_CHANNEL_CONFIG_DL_AUTOQUEUE(ch_num, ch_name, el_count, ev_ring) \
-	{						\
-		.num = ch_num,				\
-		.name = ch_name,			\
-		.num_elements = el_count,		\
-		.event_ring = ev_ring,			\
-		.dir = DMA_FROM_DEVICE,			\
-		.ee_mask = BIT(MHI_EE_AMSS),		\
-		.pollcfg = 0,				\
-		.doorbell = MHI_DB_BRST_DISABLE,	\
-		.lpm_notify = false,			\
-		.offload_channel = false,		\
-		.doorbell_mode_switch = false,		\
-		.auto_queue = true,			\
-	}
-
 #define MHI_EVENT_CONFIG_CTRL(ev_ring, el_count) \
 	{					\
 		.num_elements = el_count,	\
@@ -329,7 +313,7 @@ static const struct mhi_channel_config modem_qcom_v1_mhi_channels[] = {
 	MHI_CHANNEL_CONFIG_UL(14, "QMI", 4, 0),
 	MHI_CHANNEL_CONFIG_DL(15, "QMI", 4, 0),
 	MHI_CHANNEL_CONFIG_UL(20, "IPCR", 8, 0),
-	MHI_CHANNEL_CONFIG_DL_AUTOQUEUE(21, "IPCR", 8, 0),
+	MHI_CHANNEL_CONFIG_DL(21, "IPCR", 8, 0),
 	MHI_CHANNEL_CONFIG_UL_FP(34, "FIREHOSE", 32, 0),
 	MHI_CHANNEL_CONFIG_DL_FP(35, "FIREHOSE", 32, 0),
 	MHI_CHANNEL_CONFIG_UL(46, "IP_SW0", 64, 2),
@@ -762,7 +746,7 @@ static const struct mhi_channel_config mhi_telit_fn980_hw_v1_channels[] = {
 	MHI_CHANNEL_CONFIG_UL(14, "QMI", 32, 0),
 	MHI_CHANNEL_CONFIG_DL(15, "QMI", 32, 0),
 	MHI_CHANNEL_CONFIG_UL(20, "IPCR", 16, 0),
-	MHI_CHANNEL_CONFIG_DL_AUTOQUEUE(21, "IPCR", 16, 0),
+	MHI_CHANNEL_CONFIG_DL(21, "IPCR", 16, 0),
 	MHI_CHANNEL_CONFIG_HW_UL(100, "IP_HW0", 128, 1),
 	MHI_CHANNEL_CONFIG_HW_DL(101, "IP_HW0", 128, 2),
 };
diff --git a/drivers/net/wireless/ath/ath11k/mhi.c b/drivers/net/wireless/ath/ath11k/mhi.c
index acd76e9392d3..d2c44f7f9b62 100644
--- a/drivers/net/wireless/ath/ath11k/mhi.c
+++ b/drivers/net/wireless/ath/ath11k/mhi.c
@@ -34,7 +34,6 @@ static const struct mhi_channel_config ath11k_mhi_channels_qca6390[] = {
 		.lpm_notify = false,
 		.offload_channel = false,
 		.doorbell_mode_switch = false,
-		.auto_queue = false,
 	},
 	{
 		.num = 21,
@@ -48,7 +47,6 @@ static const struct mhi_channel_config ath11k_mhi_channels_qca6390[] = {
 		.lpm_notify = false,
 		.offload_channel = false,
 		.doorbell_mode_switch = false,
-		.auto_queue = true,
 	},
 };
 
@@ -99,7 +97,6 @@ static const struct mhi_channel_config ath11k_mhi_channels_qcn9074[] = {
 		.lpm_notify = false,
 		.offload_channel = false,
 		.doorbell_mode_switch = false,
-		.auto_queue = false,
 	},
 	{
 		.num = 21,
@@ -113,7 +110,6 @@ static const struct mhi_channel_config ath11k_mhi_channels_qcn9074[] = {
 		.lpm_notify = false,
 		.offload_channel = false,
 		.doorbell_mode_switch = false,
-		.auto_queue = true,
 	},
 };
 
diff --git a/drivers/net/wireless/ath/ath12k/mhi.c b/drivers/net/wireless/ath/ath12k/mhi.c
index 08f44baf182a..2dbdb95ae7be 100644
--- a/drivers/net/wireless/ath/ath12k/mhi.c
+++ b/drivers/net/wireless/ath/ath12k/mhi.c
@@ -31,7 +31,6 @@ static const struct mhi_channel_config ath12k_mhi_channels_qcn9274[] = {
 		.lpm_notify = false,
 		.offload_channel = false,
 		.doorbell_mode_switch = false,
-		.auto_queue = false,
 	},
 	{
 		.num = 21,
@@ -45,7 +44,6 @@ static const struct mhi_channel_config ath12k_mhi_channels_qcn9274[] = {
 		.lpm_notify = false,
 		.offload_channel = false,
 		.doorbell_mode_switch = false,
-		.auto_queue = true,
 	},
 };
 
@@ -96,7 +94,6 @@ static const struct mhi_channel_config ath12k_mhi_channels_wcn7850[] = {
 		.lpm_notify = false,
 		.offload_channel = false,
 		.doorbell_mode_switch = false,
-		.auto_queue = false,
 	},
 	{
 		.num = 21,
@@ -110,7 +107,6 @@ static const struct mhi_channel_config ath12k_mhi_channels_wcn7850[] = {
 		.lpm_notify = false,
 		.offload_channel = false,
 		.doorbell_mode_switch = false,
-		.auto_queue = true,
 	},
 };
 
diff --git a/net/qrtr/mhi.c b/net/qrtr/mhi.c
index 69f53625a049..80e341d2f8a4 100644
--- a/net/qrtr/mhi.c
+++ b/net/qrtr/mhi.c
@@ -24,13 +24,25 @@ static void qcom_mhi_qrtr_dl_callback(struct mhi_device *mhi_dev,
 	struct qrtr_mhi_dev *qdev = dev_get_drvdata(&mhi_dev->dev);
 	int rc;
 
-	if (!qdev || mhi_res->transaction_status)
+	if (!qdev || (mhi_res->transaction_status && mhi_res->transaction_status != -ENOTCONN))
 		return;
 
+	/* Channel got reset. So just free the buffer */
+	if (mhi_res->transaction_status == -ENOTCONN) {
+		devm_kfree(&mhi_dev->dev, mhi_res->buf_addr);
+		return;
+	}
+
 	rc = qrtr_endpoint_post(&qdev->ep, mhi_res->buf_addr,
 				mhi_res->bytes_xferd);
 	if (rc == -EINVAL)
 		dev_err(qdev->dev, "invalid ipcrouter packet\n");
+
+	/* Done with the buffer, now recycle it for future use */
+	rc = mhi_queue_buf(mhi_dev, DMA_FROM_DEVICE, mhi_res->buf_addr,
+			   mhi_dev->mhi_cntrl->buffer_len, MHI_EOT);
+	if (rc)
+		dev_err(&mhi_dev->dev, "Failed to recycle the buffer: %d\n", rc);
 }
 
 /* From QRTR to MHI */
@@ -72,6 +84,29 @@ static int qcom_mhi_qrtr_send(struct qrtr_endpoint *ep, struct sk_buff *skb)
 	return rc;
 }
 
+static int qcom_mhi_qrtr_queue_dl_buffers(struct mhi_device *mhi_dev)
+{
+	u32 free_desc;
+	void *buf;
+	int ret;
+
+	free_desc = mhi_get_free_desc_count(mhi_dev, DMA_FROM_DEVICE);
+	while (free_desc--) {
+		buf = devm_kmalloc(&mhi_dev->dev, mhi_dev->mhi_cntrl->buffer_len, GFP_KERNEL);
+		if (!buf)
+			return -ENOMEM;
+
+		ret = mhi_queue_buf(mhi_dev, DMA_FROM_DEVICE, buf, mhi_dev->mhi_cntrl->buffer_len,
+				    MHI_EOT);
+		if (ret) {
+			dev_err(&mhi_dev->dev, "Failed to queue buffer: %d\n", ret);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
 static int qcom_mhi_qrtr_probe(struct mhi_device *mhi_dev,
 			       const struct mhi_device_id *id)
 {
@@ -87,20 +122,30 @@ static int qcom_mhi_qrtr_probe(struct mhi_device *mhi_dev,
 	qdev->ep.xmit = qcom_mhi_qrtr_send;
 
 	dev_set_drvdata(&mhi_dev->dev, qdev);
-	rc = qrtr_endpoint_register(&qdev->ep, QRTR_EP_NID_AUTO);
-	if (rc)
-		return rc;
 
 	/* start channels */
-	rc = mhi_prepare_for_transfer_autoqueue(mhi_dev);
-	if (rc) {
-		qrtr_endpoint_unregister(&qdev->ep);
+	rc = mhi_prepare_for_transfer(mhi_dev);
+	if (rc)
 		return rc;
-	}
+
+	rc = qrtr_endpoint_register(&qdev->ep, QRTR_EP_NID_AUTO);
+	if (rc)
+		goto err_unprepare;
+
+	rc = qcom_mhi_qrtr_queue_dl_buffers(mhi_dev);
+	if (rc)
+		goto err_unregister;
 
 	dev_dbg(qdev->dev, "Qualcomm MHI QRTR driver probed\n");
 
 	return 0;
+
+err_unregister:
+	qrtr_endpoint_unregister(&qdev->ep);
+err_unprepare:
+	mhi_unprepare_from_transfer(mhi_dev);
+
+	return rc;
 }
 
 static void qcom_mhi_qrtr_remove(struct mhi_device *mhi_dev)
@@ -151,11 +196,13 @@ static int __maybe_unused qcom_mhi_qrtr_pm_resume_early(struct device *dev)
 	if (state == MHI_STATE_M3)
 		return 0;
 
-	rc = mhi_prepare_for_transfer_autoqueue(mhi_dev);
-	if (rc)
+	rc = mhi_prepare_for_transfer(mhi_dev);
+	if (rc) {
 		dev_err(dev, "failed to prepare for autoqueue transfer %d\n", rc);
+		return rc;
+	}
 
-	return rc;
+	return qcom_mhi_qrtr_queue_dl_buffers(mhi_dev);
 }
 
 static const struct dev_pm_ops qcom_mhi_qrtr_pm_ops = {

-- 
2.48.1


