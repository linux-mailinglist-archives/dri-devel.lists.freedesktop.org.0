Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4292890C41F
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 09:08:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1143510E0F1;
	Tue, 18 Jun 2024 07:08:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Z1FxFYrJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1848D10E0F1
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 07:08:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0A0C361484;
 Tue, 18 Jun 2024 07:08:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EA54C3277B;
 Tue, 18 Jun 2024 07:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718694528;
 bh=OQs0ZHAYq+kY+OsBzADzt52NHiH43maiNAIxI+O162A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Z1FxFYrJzlqCmkIEPx5iIrtt1ZKqeBrwJ147/RDW2mcrvLMMcKZAgVBcf1qSB2AHP
 ED5bZHkJzN140OWBDChSgi9D9vhs8sMAijm6CjK7Zxw2MyIFngQC+ZdxBa5ACZ9y5d
 YORPPk1F8xcaxcMBQIbmhyqUipnQz2CT+91w13PQ467C5hXA1btgaARGyJjQwsAtIY
 u90PpjG71SR6AxQLjZ7c+r1bYwEWrXRrihr2SvS1TSAydFyBQCUO64CoLObPMtnOhR
 rvahs/2U4L6yAZioj/6y+T5kCPt2kudlMtbClsIvOMUZ0Xujde8SQLi4j0UQTP6HoM
 rriRs2qYQVZAg==
Date: Tue, 18 Jun 2024 10:08:43 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Omer Shpigelman <oshpigelman@habana.ai>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "ogabbay@kernel.org" <ogabbay@kernel.org>,
 Zvika Yehudai <zyehudai@habana.ai>
Subject: Re: [PATCH 04/15] net: hbl_cn: QP state machine
Message-ID: <20240618070843.GD4025@unreal>
References: <20240613082208.1439968-1-oshpigelman@habana.ai>
 <20240613082208.1439968-5-oshpigelman@habana.ai>
 <20240617131807.GE6805@unreal>
 <a43d2eaf-e295-4ed4-b66a-3f2e96ea088c@habana.ai>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a43d2eaf-e295-4ed4-b66a-3f2e96ea088c@habana.ai>
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

On Tue, Jun 18, 2024 at 05:50:15AM +0000, Omer Shpigelman wrote:
> On 6/17/24 16:18, Leon Romanovsky wrote:
> > [Some people who received this message don't often get email from leon@kernel.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> > 
> > On Thu, Jun 13, 2024 at 11:21:57AM +0300, Omer Shpigelman wrote:
> >> Add a common QP state machine which handles the moving for a QP from one
> >> state to another including performing necessary checks, draining
> >> in-flight transactions, invalidating caches and error reporting.
> >>
> >> Signed-off-by: Omer Shpigelman <oshpigelman@habana.ai>
> >> Co-developed-by: Abhilash K V <kvabhilash@habana.ai>
> >> Signed-off-by: Abhilash K V <kvabhilash@habana.ai>
> >> Co-developed-by: Andrey Agranovich <aagranovich@habana.ai>
> >> Signed-off-by: Andrey Agranovich <aagranovich@habana.ai>
> >> Co-developed-by: Bharat Jauhari <bjauhari@habana.ai>
> >> Signed-off-by: Bharat Jauhari <bjauhari@habana.ai>
> >> Co-developed-by: David Meriin <dmeriin@habana.ai>
> >> Signed-off-by: David Meriin <dmeriin@habana.ai>
> >> Co-developed-by: Sagiv Ozeri <sozeri@habana.ai>
> >> Signed-off-by: Sagiv Ozeri <sozeri@habana.ai>
> >> Co-developed-by: Zvika Yehudai <zyehudai@habana.ai>
> >> Signed-off-by: Zvika Yehudai <zyehudai@habana.ai>
> >> ---
> >>  .../ethernet/intel/hbl_cn/common/hbl_cn_qp.c  | 480 +++++++++++++++++-
> >>  1 file changed, 479 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/net/ethernet/intel/hbl_cn/common/hbl_cn_qp.c b/drivers/net/ethernet/intel/hbl_cn/common/hbl_cn_qp.c
> >> index 9ddc23bf8194..26ebdf448193 100644
> >> --- a/drivers/net/ethernet/intel/hbl_cn/common/hbl_cn_qp.c
> >> +++ b/drivers/net/ethernet/intel/hbl_cn/common/hbl_cn_qp.c
> >> @@ -6,8 +6,486 @@
> > 
> > <...>
> > 
> >> +/* The following table represents the (valid) operations that can be performed on
> >> + * a QP in order to move it from one state to another
> >> + * For example: a QP in RTR state can be moved to RTS state using the CN_QP_OP_RTR_2RTS
> >> + * operation.
> >> + */
> >> +static const enum hbl_cn_qp_state_op qp_valid_state_op[CN_QP_NUM_STATE][CN_QP_NUM_STATE] = {
> >> +     [CN_QP_STATE_RESET] = {
> >> +             [CN_QP_STATE_RESET]     = CN_QP_OP_2RESET,
> >> +             [CN_QP_STATE_INIT]      = CN_QP_OP_RST_2INIT,
> >> +             [CN_QP_STATE_SQD]       = CN_QP_OP_NOP,
> >> +             [CN_QP_STATE_QPD]       = CN_QP_OP_NOP,
> >> +     },
> >> +     [CN_QP_STATE_INIT] = {
> >> +             [CN_QP_STATE_RESET]     = CN_QP_OP_2RESET,
> >> +             [CN_QP_STATE_ERR]       = CN_QP_OP_2ERR,
> >> +             [CN_QP_STATE_INIT]      = CN_QP_OP_NOP,
> >> +             [CN_QP_STATE_RTR]       = CN_QP_OP_INIT_2RTR,
> >> +             [CN_QP_STATE_SQD]       = CN_QP_OP_NOP,
> >> +             [CN_QP_STATE_QPD]       = CN_QP_OP_NOP,
> >> +     },
> >> +     [CN_QP_STATE_RTR] = {
> >> +             [CN_QP_STATE_RESET]     = CN_QP_OP_2RESET,
> >> +             [CN_QP_STATE_ERR]       = CN_QP_OP_2ERR,
> >> +             [CN_QP_STATE_RTR]       = CN_QP_OP_RTR_2RTR,
> >> +             [CN_QP_STATE_RTS]       = CN_QP_OP_RTR_2RTS,
> >> +             [CN_QP_STATE_SQD]       = CN_QP_OP_NOP,
> >> +             [CN_QP_STATE_QPD]       = CN_QP_OP_RTR_2QPD,
> >> +     },
> >> +     [CN_QP_STATE_RTS] = {
> >> +             [CN_QP_STATE_RESET]     = CN_QP_OP_2RESET,
> >> +             [CN_QP_STATE_ERR]       = CN_QP_OP_2ERR,
> >> +             [CN_QP_STATE_RTS]       = CN_QP_OP_RTS_2RTS,
> >> +             [CN_QP_STATE_SQD]       = CN_QP_OP_RTS_2SQD,
> >> +             [CN_QP_STATE_QPD]       = CN_QP_OP_RTS_2QPD,
> >> +             [CN_QP_STATE_SQERR]     = CN_QP_OP_RTS_2SQERR,
> >> +     },
> >> +     [CN_QP_STATE_SQD] = {
> >> +             [CN_QP_STATE_RESET]     = CN_QP_OP_2RESET,
> >> +             [CN_QP_STATE_ERR]       = CN_QP_OP_2ERR,
> >> +             [CN_QP_STATE_SQD]       = CN_QP_OP_SQD_2SQD,
> >> +             [CN_QP_STATE_RTS]       = CN_QP_OP_SQD_2RTS,
> >> +             [CN_QP_STATE_QPD]       = CN_QP_OP_SQD_2QPD,
> >> +             [CN_QP_STATE_SQERR]     = CN_QP_OP_SQD_2SQ_ERR,
> >> +     },
> >> +     [CN_QP_STATE_QPD] = {
> >> +             [CN_QP_STATE_RESET]     = CN_QP_OP_2RESET,
> >> +             [CN_QP_STATE_ERR]       = CN_QP_OP_2ERR,
> >> +             [CN_QP_STATE_SQD]       = CN_QP_OP_NOP,
> >> +             [CN_QP_STATE_QPD]       = CN_QP_OP_NOP,
> >> +             [CN_QP_STATE_RTR]       = CN_QP_OP_QPD_2RTR,
> >> +     },
> >> +     [CN_QP_STATE_SQERR] = {
> >> +             [CN_QP_STATE_RESET]     = CN_QP_OP_2RESET,
> >> +             [CN_QP_STATE_ERR]       = CN_QP_OP_2ERR,
> >> +             [CN_QP_STATE_SQD]       = CN_QP_OP_SQ_ERR_2SQD,
> >> +             [CN_QP_STATE_SQERR]     = CN_QP_OP_NOP,
> >> +     },
> >> +     [CN_QP_STATE_ERR] = {
> >> +             [CN_QP_STATE_RESET]     = CN_QP_OP_2RESET,
> >> +             [CN_QP_STATE_ERR]       = CN_QP_OP_2ERR,
> >> +     }
> >> +};
> > 
> > I don't understand why IBTA QP state machine is declared in ETH driver
> > and not in IB driver.
> > 
> 
> Implementing the actual transitions between the states requires full
> knowledge of the HW e.g. when to flush, cache invalidation, timeouts.
> Our IB driver is agnostic to the ASIC type by design. Note that more ASIC
> generations are planned to be added and the IB driver should not be aware
> of these additional HWs.
> Hence we implemeted the QP state machine in the CN driver which is aware
> of the actual HW.

Somehow ALL other IB drivers are able to implement this logic in the IB,
while supporting multiple ASICs. I don't see a reason why you can't do
the same.

> 
> >> +
> > 
> > <...>
> > 
> >> +             /* Release lock while we wait before retry.
> >> +              * Note, we can assert that we are already locked.
> >> +              */
> >> +             port_funcs->cfg_unlock(cn_port);
> >> +
> >> +             msleep(20);
> >> +
> >> +             port_funcs->cfg_lock(cn_port);
> > 
> > lock/unlock through ops pointer doesn't look like a good idea.
> > 
> 
> More ASIC generations will be added once we merge the current Gaudi2 code.
> On other ASICs the locking granularity is different because some of the HW
> resources are shared between different logical ports.
> Hence it is was logical for us to implement it with a function pointer so
> each ASIC specific code can implemnet the locking properly.

We are reviewing this code which is for the current ASIC, not for the
unknown future ASICs. Please don't over engineer the first submission.
You will always be able to improve/change the code once you decide to
upstream your future ASICs.

Thanks
