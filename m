Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE1EAC9C51C
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 18:00:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C44A110E49C;
	Tue,  2 Dec 2025 17:00:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="OuC1mwpU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 294A410E49C
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Dec 2025 17:00:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 0C4E160153;
 Tue,  2 Dec 2025 17:00:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5EF3C4CEF1;
 Tue,  2 Dec 2025 17:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764694805;
 bh=NZmK0m6VeHHkcQhLrIYGfZjT/W2vDnf+PkagOTF2Jbs=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=OuC1mwpUYMh/jrGU79PyqfYRZZDwzrQOrb1WyGcxsQDX+pN/HyeQ7upqj7NB8s+DZ
 9pNasU/y/O3phJMYGxuAXTQxkUF7TWOQOnG0paXj94iOETQlTeE06nNPBItH2jhgNx
 SgftiWutleEtYj9wVSBsjgCbhMvve9gujKBMxWpw2IuzuVQDDS15Ll3+LMGjaTrb6O
 osNHlqb7rWd95RlWsFvxPc8Wzx73yj8y1AemuULk6FJ6NslF2vA/tyx8ophsaX4vNp
 kpX7yUGbKx7qD8En1Wpzwk/wgxvt/0dp+rZBsmF32MU1U5rYWLA/MSFpZa0udvMScb
 fU3XmajQofjQg==
Message-ID: <62aced1b-c8e9-4418-8ab6-4a9bb4c3e558@kernel.org>
Date: Tue, 2 Dec 2025 11:00:03 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2] accel/amdxdna: Poll MPNPU_PWAITMODE after requesting
 firmware suspend
To: Lizhi Hou <lizhi.hou@amd.com>, ogabbay@kernel.org,
 quic_jhugo@quicinc.com, dri-devel@lists.freedesktop.org,
 maciej.falkowski@linux.intel.com
Cc: linux-kernel@vger.kernel.org, max.zhen@amd.com, sonal.santan@amd.com
References: <20251202165427.507414-1-lizhi.hou@amd.com>
Content-Language: en-US
From: "Mario Limonciello (AMD) (kernel.org)" <superm1@kernel.org>
In-Reply-To: <20251202165427.507414-1-lizhi.hou@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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



On 12/2/2025 10:54 AM, Lizhi Hou wrote:
> After issuing a firmware suspend request, the driver must ensure that the
> suspend operation has completed before proceeding. Add polling of the
> MPNPU_PWAITMODE register to confirm that the firmware has fully entered
> the suspended state. This prevents race conditions where subsequent
> operations assume the firmware is idle before it has actually completed
> its suspend sequence.
> 
> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>

> ---
>   drivers/accel/amdxdna/aie2_message.c |  9 ++++++++-
>   drivers/accel/amdxdna/aie2_pci.h     |  2 ++
>   drivers/accel/amdxdna/aie2_psp.c     | 15 +++++++++++++++
>   drivers/accel/amdxdna/npu1_regs.c    |  2 ++
>   drivers/accel/amdxdna/npu2_regs.c    |  2 ++
>   drivers/accel/amdxdna/npu4_regs.c    |  2 ++
>   drivers/accel/amdxdna/npu5_regs.c    |  2 ++
>   drivers/accel/amdxdna/npu6_regs.c    |  2 ++
>   8 files changed, 35 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/accel/amdxdna/aie2_message.c b/drivers/accel/amdxdna/aie2_message.c
> index d493bb1c3360..fee3b0627aba 100644
> --- a/drivers/accel/amdxdna/aie2_message.c
> +++ b/drivers/accel/amdxdna/aie2_message.c
> @@ -59,8 +59,15 @@ static int aie2_send_mgmt_msg_wait(struct amdxdna_dev_hdl *ndev,
>   int aie2_suspend_fw(struct amdxdna_dev_hdl *ndev)
>   {
>   	DECLARE_AIE2_MSG(suspend, MSG_OP_SUSPEND);
> +	int ret;
>   
> -	return aie2_send_mgmt_msg_wait(ndev, &msg);
> +	ret = aie2_send_mgmt_msg_wait(ndev, &msg);
> +	if (ret) {
> +		XDNA_ERR(ndev->xdna, "Failed to suspend fw, ret %d", ret);
> +		return ret;
> +	}
> +
> +	return aie2_psp_waitmode_poll(ndev->psp_hdl);
>   }
>   
>   int aie2_resume_fw(struct amdxdna_dev_hdl *ndev)
> diff --git a/drivers/accel/amdxdna/aie2_pci.h b/drivers/accel/amdxdna/aie2_pci.h
> index a5f9c42155d1..cc9f933f80b2 100644
> --- a/drivers/accel/amdxdna/aie2_pci.h
> +++ b/drivers/accel/amdxdna/aie2_pci.h
> @@ -70,6 +70,7 @@ enum psp_reg_idx {
>   	PSP_INTR_REG = PSP_NUM_IN_REGS,
>   	PSP_STATUS_REG,
>   	PSP_RESP_REG,
> +	PSP_PWAITMODE_REG,
>   	PSP_MAX_REGS /* Keep this at the end */
>   };
>   
> @@ -290,6 +291,7 @@ int aie2_pm_set_mode(struct amdxdna_dev_hdl *ndev, enum amdxdna_power_mode_type
>   struct psp_device *aie2m_psp_create(struct drm_device *ddev, struct psp_config *conf);
>   int aie2_psp_start(struct psp_device *psp);
>   void aie2_psp_stop(struct psp_device *psp);
> +int aie2_psp_waitmode_poll(struct psp_device *psp);
>   
>   /* aie2_error.c */
>   int aie2_error_async_events_alloc(struct amdxdna_dev_hdl *ndev);
> diff --git a/drivers/accel/amdxdna/aie2_psp.c b/drivers/accel/amdxdna/aie2_psp.c
> index f28a060a8810..3a7130577e3e 100644
> --- a/drivers/accel/amdxdna/aie2_psp.c
> +++ b/drivers/accel/amdxdna/aie2_psp.c
> @@ -76,6 +76,21 @@ static int psp_exec(struct psp_device *psp, u32 *reg_vals)
>   	return 0;
>   }
>   
> +int aie2_psp_waitmode_poll(struct psp_device *psp)
> +{
> +	struct amdxdna_dev *xdna = to_xdna_dev(psp->ddev);
> +	u32 mode_reg;
> +	int ret;
> +
> +	ret = readx_poll_timeout(readl, PSP_REG(psp, PSP_PWAITMODE_REG), mode_reg,
> +				 (mode_reg & 0x1) == 1,
> +				 PSP_POLL_INTERVAL, PSP_POLL_TIMEOUT);
> +	if (ret)
> +		XDNA_ERR(xdna, "fw waitmode reg error, ret %d", ret);
> +
> +	return ret;
> +}
> +
>   void aie2_psp_stop(struct psp_device *psp)
>   {
>   	u32 reg_vals[PSP_NUM_IN_REGS] = { PSP_RELEASE_TMR, };
> diff --git a/drivers/accel/amdxdna/npu1_regs.c b/drivers/accel/amdxdna/npu1_regs.c
> index ec407f3b48fc..ebc6e2802297 100644
> --- a/drivers/accel/amdxdna/npu1_regs.c
> +++ b/drivers/accel/amdxdna/npu1_regs.c
> @@ -13,6 +13,7 @@
>   #include "amdxdna_pci_drv.h"
>   
>   /* Address definition from NPU1 docs */
> +#define MPNPU_PWAITMODE			0x3010034
>   #define MPNPU_PUB_SEC_INTR		0x3010090
>   #define MPNPU_PUB_PWRMGMT_INTR		0x3010094
>   #define MPNPU_PUB_SCRATCH2		0x30100A0
> @@ -92,6 +93,7 @@ static const struct amdxdna_dev_priv npu1_dev_priv = {
>   		DEFINE_BAR_OFFSET(PSP_INTR_REG,   NPU1_PSP, MPNPU_PUB_SEC_INTR),
>   		DEFINE_BAR_OFFSET(PSP_STATUS_REG, NPU1_PSP, MPNPU_PUB_SCRATCH2),
>   		DEFINE_BAR_OFFSET(PSP_RESP_REG,   NPU1_PSP, MPNPU_PUB_SCRATCH3),
> +		DEFINE_BAR_OFFSET(PSP_PWAITMODE_REG, NPU1_PSP, MPNPU_PWAITMODE),
>   	},
>   	.smu_regs_off   = {
>   		DEFINE_BAR_OFFSET(SMU_CMD_REG,  NPU1_SMU, MPNPU_PUB_SCRATCH5),
> diff --git a/drivers/accel/amdxdna/npu2_regs.c b/drivers/accel/amdxdna/npu2_regs.c
> index 86f87d0d1354..ad0743fb06d5 100644
> --- a/drivers/accel/amdxdna/npu2_regs.c
> +++ b/drivers/accel/amdxdna/npu2_regs.c
> @@ -13,6 +13,7 @@
>   #include "amdxdna_pci_drv.h"
>   
>   /* NPU Public Registers on MpNPUAxiXbar (refer to Diag npu_registers.h) */
> +#define MPNPU_PWAITMODE                0x301003C
>   #define MPNPU_PUB_SEC_INTR             0x3010060
>   #define MPNPU_PUB_PWRMGMT_INTR         0x3010064
>   #define MPNPU_PUB_SCRATCH0             0x301006C
> @@ -85,6 +86,7 @@ static const struct amdxdna_dev_priv npu2_dev_priv = {
>   		DEFINE_BAR_OFFSET(PSP_INTR_REG,   NPU2_PSP, MP0_C2PMSG_73),
>   		DEFINE_BAR_OFFSET(PSP_STATUS_REG, NPU2_PSP, MP0_C2PMSG_123),
>   		DEFINE_BAR_OFFSET(PSP_RESP_REG,   NPU2_REG, MPNPU_PUB_SCRATCH3),
> +		DEFINE_BAR_OFFSET(PSP_PWAITMODE_REG, NPU2_REG, MPNPU_PWAITMODE),
>   	},
>   	.smu_regs_off   = {
>   		DEFINE_BAR_OFFSET(SMU_CMD_REG,  NPU2_SMU, MP1_C2PMSG_0),
> diff --git a/drivers/accel/amdxdna/npu4_regs.c b/drivers/accel/amdxdna/npu4_regs.c
> index 986a5f28ba24..4ca21db70478 100644
> --- a/drivers/accel/amdxdna/npu4_regs.c
> +++ b/drivers/accel/amdxdna/npu4_regs.c
> @@ -13,6 +13,7 @@
>   #include "amdxdna_pci_drv.h"
>   
>   /* NPU Public Registers on MpNPUAxiXbar (refer to Diag npu_registers.h) */
> +#define MPNPU_PWAITMODE                0x301003C
>   #define MPNPU_PUB_SEC_INTR             0x3010060
>   #define MPNPU_PUB_PWRMGMT_INTR         0x3010064
>   #define MPNPU_PUB_SCRATCH0             0x301006C
> @@ -116,6 +117,7 @@ static const struct amdxdna_dev_priv npu4_dev_priv = {
>   		DEFINE_BAR_OFFSET(PSP_INTR_REG,   NPU4_PSP, MP0_C2PMSG_73),
>   		DEFINE_BAR_OFFSET(PSP_STATUS_REG, NPU4_PSP, MP0_C2PMSG_123),
>   		DEFINE_BAR_OFFSET(PSP_RESP_REG,   NPU4_REG, MPNPU_PUB_SCRATCH3),
> +		DEFINE_BAR_OFFSET(PSP_PWAITMODE_REG, NPU4_REG, MPNPU_PWAITMODE),
>   	},
>   	.smu_regs_off   = {
>   		DEFINE_BAR_OFFSET(SMU_CMD_REG,  NPU4_SMU, MP1_C2PMSG_0),
> diff --git a/drivers/accel/amdxdna/npu5_regs.c b/drivers/accel/amdxdna/npu5_regs.c
> index 75ad97f0b937..131080652ef0 100644
> --- a/drivers/accel/amdxdna/npu5_regs.c
> +++ b/drivers/accel/amdxdna/npu5_regs.c
> @@ -13,6 +13,7 @@
>   #include "amdxdna_pci_drv.h"
>   
>   /* NPU Public Registers on MpNPUAxiXbar (refer to Diag npu_registers.h) */
> +#define MPNPU_PWAITMODE                0x301003C
>   #define MPNPU_PUB_SEC_INTR             0x3010060
>   #define MPNPU_PUB_PWRMGMT_INTR         0x3010064
>   #define MPNPU_PUB_SCRATCH0             0x301006C
> @@ -85,6 +86,7 @@ static const struct amdxdna_dev_priv npu5_dev_priv = {
>   		DEFINE_BAR_OFFSET(PSP_INTR_REG,   NPU5_PSP, MP0_C2PMSG_73),
>   		DEFINE_BAR_OFFSET(PSP_STATUS_REG, NPU5_PSP, MP0_C2PMSG_123),
>   		DEFINE_BAR_OFFSET(PSP_RESP_REG,   NPU5_REG, MPNPU_PUB_SCRATCH3),
> +		DEFINE_BAR_OFFSET(PSP_PWAITMODE_REG, NPU5_REG, MPNPU_PWAITMODE),
>   	},
>   	.smu_regs_off   = {
>   		DEFINE_BAR_OFFSET(SMU_CMD_REG,  NPU5_SMU, MP1_C2PMSG_0),
> diff --git a/drivers/accel/amdxdna/npu6_regs.c b/drivers/accel/amdxdna/npu6_regs.c
> index 758dc013fe13..1f71285655b2 100644
> --- a/drivers/accel/amdxdna/npu6_regs.c
> +++ b/drivers/accel/amdxdna/npu6_regs.c
> @@ -13,6 +13,7 @@
>   #include "amdxdna_pci_drv.h"
>   
>   /* NPU Public Registers on MpNPUAxiXbar (refer to Diag npu_registers.h) */
> +#define MPNPU_PWAITMODE                0x301003C
>   #define MPNPU_PUB_SEC_INTR             0x3010060
>   #define MPNPU_PUB_PWRMGMT_INTR         0x3010064
>   #define MPNPU_PUB_SCRATCH0             0x301006C
> @@ -85,6 +86,7 @@ static const struct amdxdna_dev_priv npu6_dev_priv = {
>   		DEFINE_BAR_OFFSET(PSP_INTR_REG,   NPU6_PSP, MP0_C2PMSG_73),
>   		DEFINE_BAR_OFFSET(PSP_STATUS_REG, NPU6_PSP, MP0_C2PMSG_123),
>   		DEFINE_BAR_OFFSET(PSP_RESP_REG,   NPU6_REG, MPNPU_PUB_SCRATCH3),
> +		DEFINE_BAR_OFFSET(PSP_PWAITMODE_REG, NPU6_REG, MPNPU_PWAITMODE),
>   	},
>   	.smu_regs_off   = {
>   		DEFINE_BAR_OFFSET(SMU_CMD_REG,  NPU6_SMU, MP1_C2PMSG_0),

