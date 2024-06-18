Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE0D490C51E
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 11:00:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F421510E2D0;
	Tue, 18 Jun 2024 09:00:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="cLTDJsoj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0466710E2D0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 09:00:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id BC55A60F21;
 Tue, 18 Jun 2024 09:00:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E346CC4AF1A;
 Tue, 18 Jun 2024 09:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718701236;
 bh=UP+zPKTWJXEf18ikgSz4JVAIi4HunUZiH8TkyYHpONg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cLTDJsojTqCSSiH8Od+6iE8djCJBBECoHUZgwWuXlJ89vPUUxbifJpaOgfDSZa+4E
 NWD0mKDGywXNwkEVz0yPZNfLGcsGjPBKvAUzdxZVx3BOquQ+CLjtxm2S5pOB0LA3DE
 qvUN981vysMzmyvGhZ4SvsgK6oZ3sbVazr1qjhaLrU1NK3+ZcbqBZiycgv9f+YwGVI
 gfBOpEYY1HdWj3QwICJ+S0P46aTlWNEQ/M3SUZ1Wh4wWIGgsywRtCXYApPWbhDA5Ox
 YKizgNyEbMnxZSq2eNkEpQNx5g8yo0GujwxmZq7qoi/ySjkW5aeQxOxK520Ym3PpU3
 xoMCSlKdIkhig==
Date: Tue, 18 Jun 2024 12:00:31 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Omer Shpigelman <oshpigelman@habana.ai>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "ogabbay@kernel.org" <ogabbay@kernel.org>,
 Zvika Yehudai <zyehudai@habana.ai>
Subject: Re: [PATCH 04/15] net: hbl_cn: QP state machine
Message-ID: <20240618090031.GE4025@unreal>
References: <20240613082208.1439968-1-oshpigelman@habana.ai>
 <20240613082208.1439968-5-oshpigelman@habana.ai>
 <20240617131807.GE6805@unreal>
 <a43d2eaf-e295-4ed4-b66a-3f2e96ea088c@habana.ai>
 <20240618070843.GD4025@unreal>
 <5bac8717-55d8-419d-b7cd-7fcb69fd49fb@habana.ai>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5bac8717-55d8-419d-b7cd-7fcb69fd49fb@habana.ai>
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

On Tue, Jun 18, 2024 at 07:58:55AM +0000, Omer Shpigelman wrote:
> On 6/18/24 10:08, Leon Romanovsky wrote:
> > On Tue, Jun 18, 2024 at 05:50:15AM +0000, Omer Shpigelman wrote:
> >> On 6/17/24 16:18, Leon Romanovsky wrote:
> >>> [Some people who received this message don't often get email from leon@kernel.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> >>>
> >>> On Thu, Jun 13, 2024 at 11:21:57AM +0300, Omer Shpigelman wrote:
> >>>> Add a common QP state machine which handles the moving for a QP from one
> >>>> state to another including performing necessary checks, draining
> >>>> in-flight transactions, invalidating caches and error reporting.
> >>>>
> >>>> Signed-off-by: Omer Shpigelman <oshpigelman@habana.ai>
> >>>> Co-developed-by: Abhilash K V <kvabhilash@habana.ai>
> >>>> Signed-off-by: Abhilash K V <kvabhilash@habana.ai>
> >>>> Co-developed-by: Andrey Agranovich <aagranovich@habana.ai>
> >>>> Signed-off-by: Andrey Agranovich <aagranovich@habana.ai>
> >>>> Co-developed-by: Bharat Jauhari <bjauhari@habana.ai>
> >>>> Signed-off-by: Bharat Jauhari <bjauhari@habana.ai>
> >>>> Co-developed-by: David Meriin <dmeriin@habana.ai>
> >>>> Signed-off-by: David Meriin <dmeriin@habana.ai>
> >>>> Co-developed-by: Sagiv Ozeri <sozeri@habana.ai>
> >>>> Signed-off-by: Sagiv Ozeri <sozeri@habana.ai>
> >>>> Co-developed-by: Zvika Yehudai <zyehudai@habana.ai>
> >>>> Signed-off-by: Zvika Yehudai <zyehudai@habana.ai>
> >>>> ---
> >>>>  .../ethernet/intel/hbl_cn/common/hbl_cn_qp.c  | 480 +++++++++++++++++-
> >>>>  1 file changed, 479 insertions(+), 1 deletion(-)
> >>>>
> >>>> diff --git a/drivers/net/ethernet/intel/hbl_cn/common/hbl_cn_qp.c b/drivers/net/ethernet/intel/hbl_cn/common/hbl_cn_qp.c
> >>>> index 9ddc23bf8194..26ebdf448193 100644
> >>>> --- a/drivers/net/ethernet/intel/hbl_cn/common/hbl_cn_qp.c
> >>>> +++ b/drivers/net/ethernet/intel/hbl_cn/common/hbl_cn_qp.c
> >>>> @@ -6,8 +6,486 @@
> >>>
> >>> <...>
> >>>
> >>>> +/* The following table represents the (valid) operations that can be performed on
> >>>> + * a QP in order to move it from one state to another
> >>>> + * For example: a QP in RTR state can be moved to RTS state using the CN_QP_OP_RTR_2RTS
> >>>> + * operation.
> >>>> + */
> >>>> +static const enum hbl_cn_qp_state_op qp_valid_state_op[CN_QP_NUM_STATE][CN_QP_NUM_STATE] = {
> >>>> +     [CN_QP_STATE_RESET] = {
> >>>> +             [CN_QP_STATE_RESET]     = CN_QP_OP_2RESET,
> >>>> +             [CN_QP_STATE_INIT]      = CN_QP_OP_RST_2INIT,
> >>>> +             [CN_QP_STATE_SQD]       = CN_QP_OP_NOP,
> >>>> +             [CN_QP_STATE_QPD]       = CN_QP_OP_NOP,
> >>>> +     },
> >>>> +     [CN_QP_STATE_INIT] = {
> >>>> +             [CN_QP_STATE_RESET]     = CN_QP_OP_2RESET,
> >>>> +             [CN_QP_STATE_ERR]       = CN_QP_OP_2ERR,
> >>>> +             [CN_QP_STATE_INIT]      = CN_QP_OP_NOP,
> >>>> +             [CN_QP_STATE_RTR]       = CN_QP_OP_INIT_2RTR,
> >>>> +             [CN_QP_STATE_SQD]       = CN_QP_OP_NOP,
> >>>> +             [CN_QP_STATE_QPD]       = CN_QP_OP_NOP,
> >>>> +     },
> >>>> +     [CN_QP_STATE_RTR] = {
> >>>> +             [CN_QP_STATE_RESET]     = CN_QP_OP_2RESET,
> >>>> +             [CN_QP_STATE_ERR]       = CN_QP_OP_2ERR,
> >>>> +             [CN_QP_STATE_RTR]       = CN_QP_OP_RTR_2RTR,
> >>>> +             [CN_QP_STATE_RTS]       = CN_QP_OP_RTR_2RTS,
> >>>> +             [CN_QP_STATE_SQD]       = CN_QP_OP_NOP,
> >>>> +             [CN_QP_STATE_QPD]       = CN_QP_OP_RTR_2QPD,
> >>>> +     },
> >>>> +     [CN_QP_STATE_RTS] = {
> >>>> +             [CN_QP_STATE_RESET]     = CN_QP_OP_2RESET,
> >>>> +             [CN_QP_STATE_ERR]       = CN_QP_OP_2ERR,
> >>>> +             [CN_QP_STATE_RTS]       = CN_QP_OP_RTS_2RTS,
> >>>> +             [CN_QP_STATE_SQD]       = CN_QP_OP_RTS_2SQD,
> >>>> +             [CN_QP_STATE_QPD]       = CN_QP_OP_RTS_2QPD,
> >>>> +             [CN_QP_STATE_SQERR]     = CN_QP_OP_RTS_2SQERR,
> >>>> +     },
> >>>> +     [CN_QP_STATE_SQD] = {
> >>>> +             [CN_QP_STATE_RESET]     = CN_QP_OP_2RESET,
> >>>> +             [CN_QP_STATE_ERR]       = CN_QP_OP_2ERR,
> >>>> +             [CN_QP_STATE_SQD]       = CN_QP_OP_SQD_2SQD,
> >>>> +             [CN_QP_STATE_RTS]       = CN_QP_OP_SQD_2RTS,
> >>>> +             [CN_QP_STATE_QPD]       = CN_QP_OP_SQD_2QPD,
> >>>> +             [CN_QP_STATE_SQERR]     = CN_QP_OP_SQD_2SQ_ERR,
> >>>> +     },
> >>>> +     [CN_QP_STATE_QPD] = {
> >>>> +             [CN_QP_STATE_RESET]     = CN_QP_OP_2RESET,
> >>>> +             [CN_QP_STATE_ERR]       = CN_QP_OP_2ERR,
> >>>> +             [CN_QP_STATE_SQD]       = CN_QP_OP_NOP,
> >>>> +             [CN_QP_STATE_QPD]       = CN_QP_OP_NOP,
> >>>> +             [CN_QP_STATE_RTR]       = CN_QP_OP_QPD_2RTR,
> >>>> +     },
> >>>> +     [CN_QP_STATE_SQERR] = {
> >>>> +             [CN_QP_STATE_RESET]     = CN_QP_OP_2RESET,
> >>>> +             [CN_QP_STATE_ERR]       = CN_QP_OP_2ERR,
> >>>> +             [CN_QP_STATE_SQD]       = CN_QP_OP_SQ_ERR_2SQD,
> >>>> +             [CN_QP_STATE_SQERR]     = CN_QP_OP_NOP,
> >>>> +     },
> >>>> +     [CN_QP_STATE_ERR] = {
> >>>> +             [CN_QP_STATE_RESET]     = CN_QP_OP_2RESET,
> >>>> +             [CN_QP_STATE_ERR]       = CN_QP_OP_2ERR,
> >>>> +     }
> >>>> +};
> >>>
> >>> I don't understand why IBTA QP state machine is declared in ETH driver
> >>> and not in IB driver.
> >>>
> >>
> >> Implementing the actual transitions between the states requires full
> >> knowledge of the HW e.g. when to flush, cache invalidation, timeouts.
> >> Our IB driver is agnostic to the ASIC type by design. Note that more ASIC
> >> generations are planned to be added and the IB driver should not be aware
> >> of these additional HWs.
> >> Hence we implemeted the QP state machine in the CN driver which is aware
> >> of the actual HW.
> > 
> > Somehow ALL other IB drivers are able to implement this logic in the IB,
> > while supporting multiple ASICs. I don't see a reason why you can't do
> > the same.
> > 
> 
> If we are referring to this actual table, then I can move it to the IB
> driver and the CN driver will fetch the needed opcode via a function
> pointer.
> Is that ok?

This table spotted my attention, but right separation shouldn't be limited
to only this table. The outcome of this conversation should be:
"IB specific logic should be in IB driver, and CN driver should be able to
handle only low-level operations".

Thanks
