Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B768C9D120
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 22:23:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B44810E6D3;
	Tue,  2 Dec 2025 21:23:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="l1ppoxtk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CB5910E6D3
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Dec 2025 21:23:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id F1C0F4437B;
 Tue,  2 Dec 2025 21:23:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6513EC113D0;
 Tue,  2 Dec 2025 21:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764710602;
 bh=3H3i5EY0vUpCRBByCy+K0P1cbdkkSno7+PnmdSTaJIo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=l1ppoxtkItiuZr/6lqw+M7aNm5wTd86jaWhsJDU/SN+RZRyM7MZ8fvibjRhL06u32
 qgpFCM2GqrxGy+r9v4veRsSNV1v9mmzyxrLiqNhhyZ98dBst6l7i689AvieEpoPgEd
 IF047R0qiecT85HnvDHRPL2T+wYoT7RMzjgpi/3qN4N2lN/HyWdB5syihuifHnUKVe
 2jTDuJeVoGsphO2aKKWfQp63CaS/3HWRPnJH6m7hLjgh/FZMmeD5bkWZ912QdQWT57
 jMufoUGr5ivuWg2E2THXGXc9BafhL+/WJHTX9kK4gto29jY+S/ivSb65zYTq+3Mv/i
 TGfoXYra/q0BQ==
Date: Tue, 2 Dec 2025 15:29:24 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>, 
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
 Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>, 
 Oded Gabbay <ogabbay@kernel.org>, Jeff Johnson <jjohnson@kernel.org>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, mhi@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-wireless@vger.kernel.org, 
 ath11k@lists.infradead.org, ath12k@lists.infradead.org, netdev@vger.kernel.org,
 mayank.rana@oss.qualcomm.com, quic_vbadigan@quicinc.com,
 vivek.pernamitta@oss.qualcomm.com
Subject: Re: [PATCH 2/4] bus: mhi: Remove runtime PM callback ops from
 controller interface
Message-ID: <pqe2gpbjbqgb42ioebrd6spodovi52x4rkbox5ptavrclwjkf4@rvli6wklilrj>
References: <20251201-mhi_runtimepm-v1-0-fab94399ca75@oss.qualcomm.com>
 <20251201-mhi_runtimepm-v1-2-fab94399ca75@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251201-mhi_runtimepm-v1-2-fab94399ca75@oss.qualcomm.com>
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

On Mon, Dec 01, 2025 at 06:13:18PM +0530, Krishna Chaitanya Chundru wrote:
> Remove the runtime_get and runtime_put function pointers from the
> struct mhi_controller interface and all associated usage across the
> MHI host stack. These callbacks were previously required by MHI drivers
> to abstract runtime PM handling, but are now redundant.
> 
> The MHI core has been updated to directly use standard pm_runtime_*
> APIs, eliminating the need for driver-specific indirection.

Please write your commit messages according to
https://docs.kernel.org/process/submitting-patches.html#describe-your-changes

Start by establishing the purpose of the patch/the problem you're
solving. Then once that's clear you can provide details about the
change.

Regards,
Bjorn

> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
>  drivers/accel/qaic/mhi_controller.c   | 11 -----------
>  drivers/bus/mhi/host/pci_generic.c    | 24 +++---------------------
>  drivers/net/wireless/ath/ath11k/mhi.c | 10 ----------
>  drivers/net/wireless/ath/ath12k/mhi.c | 11 -----------
>  include/linux/mhi.h                   |  4 ----
>  5 files changed, 3 insertions(+), 57 deletions(-)
> 
> diff --git a/drivers/accel/qaic/mhi_controller.c b/drivers/accel/qaic/mhi_controller.c
> index 13a14c6c61689fa4af47dade6d62b3cb1a148354..319344be658b38656f6e85e92be4b5473f43c897 100644
> --- a/drivers/accel/qaic/mhi_controller.c
> +++ b/drivers/accel/qaic/mhi_controller.c
> @@ -820,15 +820,6 @@ static void mhi_write_reg(struct mhi_controller *mhi_cntrl, void __iomem *addr,
>  	writel_relaxed(val, addr);
>  }
>  
> -static int mhi_runtime_get(struct mhi_controller *mhi_cntrl)
> -{
> -	return 0;
> -}
> -
> -static void mhi_runtime_put(struct mhi_controller *mhi_cntrl)
> -{
> -}
> -
>  static void mhi_status_cb(struct mhi_controller *mhi_cntrl, enum mhi_callback reason)
>  {
>  	struct qaic_device *qdev = pci_get_drvdata(to_pci_dev(mhi_cntrl->cntrl_dev));
> @@ -889,8 +880,6 @@ struct mhi_controller *qaic_mhi_register_controller(struct pci_dev *pci_dev, voi
>  	mhi_cntrl->iova_start = 0;
>  	mhi_cntrl->iova_stop = PHYS_ADDR_MAX - 1;
>  	mhi_cntrl->status_cb = mhi_status_cb;
> -	mhi_cntrl->runtime_get = mhi_runtime_get;
> -	mhi_cntrl->runtime_put = mhi_runtime_put;
>  	mhi_cntrl->read_reg = mhi_read_reg;
>  	mhi_cntrl->write_reg = mhi_write_reg;
>  	mhi_cntrl->regs = mhi_bar;
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> index b188bbf7de042d8b9aa0dde1217d2c86558c3caf..7036b1654c550a79e53fb449b944d67b68aad677 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -1173,23 +1173,6 @@ static int mhi_pci_get_irqs(struct mhi_controller *mhi_cntrl,
>  	return 0;
>  }
>  
> -static int mhi_pci_runtime_get(struct mhi_controller *mhi_cntrl)
> -{
> -	/* The runtime_get() MHI callback means:
> -	 *    Do whatever is requested to leave M3.
> -	 */
> -	return pm_runtime_get(mhi_cntrl->cntrl_dev);
> -}
> -
> -static void mhi_pci_runtime_put(struct mhi_controller *mhi_cntrl)
> -{
> -	/* The runtime_put() MHI callback means:
> -	 *    Device can be moved in M3 state.
> -	 */
> -	pm_runtime_mark_last_busy(mhi_cntrl->cntrl_dev);
> -	pm_runtime_put(mhi_cntrl->cntrl_dev);
> -}
> -
>  static void mhi_pci_recovery_work(struct work_struct *work)
>  {
>  	struct mhi_pci_device *mhi_pdev = container_of(work, struct mhi_pci_device,
> @@ -1277,7 +1260,7 @@ static int mhi_pci_generic_edl_trigger(struct mhi_controller *mhi_cntrl)
>  	}
>  
>  	pm_wakeup_event(&mhi_cntrl->mhi_dev->dev, 0);
> -	mhi_cntrl->runtime_get(mhi_cntrl);
> +	pm_runtime_get(mhi_cntrl->cntrl_dev);
>  
>  	ret = mhi_get_channel_doorbell_offset(mhi_cntrl, &val);
>  	if (ret)
> @@ -1291,7 +1274,8 @@ static int mhi_pci_generic_edl_trigger(struct mhi_controller *mhi_cntrl)
>  	mhi_soc_reset(mhi_cntrl);
>  
>  err_get_chdb:
> -	mhi_cntrl->runtime_put(mhi_cntrl);
> +	pm_runtime_mark_last_busy(mhi_cntrl->cntrl_dev);
> +	pm_runtime_put(mhi_cntrl->cntrl_dev);
>  	mhi_device_put(mhi_cntrl->mhi_dev);
>  
>  	return ret;
> @@ -1338,8 +1322,6 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>  	mhi_cntrl->read_reg = mhi_pci_read_reg;
>  	mhi_cntrl->write_reg = mhi_pci_write_reg;
>  	mhi_cntrl->status_cb = mhi_pci_status_cb;
> -	mhi_cntrl->runtime_get = mhi_pci_runtime_get;
> -	mhi_cntrl->runtime_put = mhi_pci_runtime_put;
>  	mhi_cntrl->mru = info->mru_default;
>  	mhi_cntrl->name = info->name;
>  
> diff --git a/drivers/net/wireless/ath/ath11k/mhi.c b/drivers/net/wireless/ath/ath11k/mhi.c
> index acd76e9392d31192aca6776319ef0829a1c69628..18bac9e4bc35bffabef05171b88bd5515e7df925 100644
> --- a/drivers/net/wireless/ath/ath11k/mhi.c
> +++ b/drivers/net/wireless/ath/ath11k/mhi.c
> @@ -230,14 +230,6 @@ static int ath11k_mhi_get_msi(struct ath11k_pci *ab_pci)
>  	return 0;
>  }
>  
> -static int ath11k_mhi_op_runtime_get(struct mhi_controller *mhi_cntrl)
> -{
> -	return 0;
> -}
> -
> -static void ath11k_mhi_op_runtime_put(struct mhi_controller *mhi_cntrl)
> -{
> -}
>  
>  static char *ath11k_mhi_op_callback_to_str(enum mhi_callback reason)
>  {
> @@ -384,8 +376,6 @@ int ath11k_mhi_register(struct ath11k_pci *ab_pci)
>  	mhi_ctrl->sbl_size = SZ_512K;
>  	mhi_ctrl->seg_len = SZ_512K;
>  	mhi_ctrl->fbc_download = true;
> -	mhi_ctrl->runtime_get = ath11k_mhi_op_runtime_get;
> -	mhi_ctrl->runtime_put = ath11k_mhi_op_runtime_put;
>  	mhi_ctrl->status_cb = ath11k_mhi_op_status_cb;
>  	mhi_ctrl->read_reg = ath11k_mhi_op_read_reg;
>  	mhi_ctrl->write_reg = ath11k_mhi_op_write_reg;
> diff --git a/drivers/net/wireless/ath/ath12k/mhi.c b/drivers/net/wireless/ath/ath12k/mhi.c
> index 08f44baf182a5e34651e8c117fe279942f8ad8f4..99d8d9a8944cefa2561cd47d83bbeb53ef13044d 100644
> --- a/drivers/net/wireless/ath/ath12k/mhi.c
> +++ b/drivers/net/wireless/ath/ath12k/mhi.c
> @@ -230,15 +230,6 @@ static int ath12k_mhi_get_msi(struct ath12k_pci *ab_pci)
>  	return 0;
>  }
>  
> -static int ath12k_mhi_op_runtime_get(struct mhi_controller *mhi_cntrl)
> -{
> -	return 0;
> -}
> -
> -static void ath12k_mhi_op_runtime_put(struct mhi_controller *mhi_cntrl)
> -{
> -}
> -
>  static char *ath12k_mhi_op_callback_to_str(enum mhi_callback reason)
>  {
>  	switch (reason) {
> @@ -386,8 +377,6 @@ int ath12k_mhi_register(struct ath12k_pci *ab_pci)
>  	mhi_ctrl->sbl_size = SZ_512K;
>  	mhi_ctrl->seg_len = SZ_512K;
>  	mhi_ctrl->fbc_download = true;
> -	mhi_ctrl->runtime_get = ath12k_mhi_op_runtime_get;
> -	mhi_ctrl->runtime_put = ath12k_mhi_op_runtime_put;
>  	mhi_ctrl->status_cb = ath12k_mhi_op_status_cb;
>  	mhi_ctrl->read_reg = ath12k_mhi_op_read_reg;
>  	mhi_ctrl->write_reg = ath12k_mhi_op_write_reg;
> diff --git a/include/linux/mhi.h b/include/linux/mhi.h
> index dd372b0123a6da5107b807ff8fe940c567eb2030..312e5c4b9cf8a46ffb20e2afc70441a11ecf659c 100644
> --- a/include/linux/mhi.h
> +++ b/include/linux/mhi.h
> @@ -347,8 +347,6 @@ struct mhi_controller_config {
>   * @wake_get: CB function to assert device wake (optional)
>   * @wake_put: CB function to de-assert device wake (optional)
>   * @wake_toggle: CB function to assert and de-assert device wake (optional)
> - * @runtime_get: CB function to controller runtime resume (required)
> - * @runtime_put: CB function to decrement pm usage (required)
>   * @map_single: CB function to create TRE buffer
>   * @unmap_single: CB function to destroy TRE buffer
>   * @read_reg: Read a MHI register via the physical link (required)
> @@ -427,8 +425,6 @@ struct mhi_controller {
>  	void (*wake_get)(struct mhi_controller *mhi_cntrl, bool override);
>  	void (*wake_put)(struct mhi_controller *mhi_cntrl, bool override);
>  	void (*wake_toggle)(struct mhi_controller *mhi_cntrl);
> -	int (*runtime_get)(struct mhi_controller *mhi_cntrl);
> -	void (*runtime_put)(struct mhi_controller *mhi_cntrl);
>  	int (*map_single)(struct mhi_controller *mhi_cntrl,
>  			  struct mhi_buf_info *buf);
>  	void (*unmap_single)(struct mhi_controller *mhi_cntrl,
> 
> -- 
> 2.34.1
> 
> 
