Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2HypEMlDpWkg7AUAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 09:01:13 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B50CC1D44C3
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 09:01:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05B6C10E139;
	Mon,  2 Mar 2026 08:01:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="AL6GKTKo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013014.outbound.protection.outlook.com
 [40.107.201.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D614110E139;
 Mon,  2 Mar 2026 08:01:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LzWFQWaxPB0dy+F0uHDr2fo3eA4Uy7av2UOgIFb4Vv5SQmjJFhX+eQKsJRWM0b4FqDId9+HMdt40gXvQX7OsARIc8GSD8xIr33i5qYG1jaCq/x5xeFdhfXaqB8UOBGVAacXC94EKHmm/mw91DtNL8zBD6SjQZYd6VTssXtS8QEiHnqxRH4DGrCb/UIi0cf7hg3ihmCIR29ecHJ1b0pX55zo2l8P4f5s0CzS/sabetQ0XDSFX4kh9nzpamMECpFE2T8zvikkWCURB0ECdk8UDtmh8JWhzKGJpasNg6AgYN4MGV8qi7zK+9tni2EzTvs9cnBXFRtOOhYsn0JQ2YTYm6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xdCA1/ceY72bOPC0AAspQufF5bY+Yw9feN27Qk8WyaE=;
 b=FcRGPf2w5X4EALP9yDbaT9u2CqSZrPYUh9D7gSVCt4F0+i8O0jkX9ovOIbOVo32Ipi2xICm/EGQGwbm9gTZTtJhRml9GumlGkX2zzLnyM0Gl7fp1L2+n+5GU3jv+ZPxtlnN0WaEieWwi/R6ECNjwhb2kwRl13hQ5FcWtNFHDZw4mjEcmArvJIKPcFSlRg6tuHXERAiax3nhsuZ24q9RmwoCvIYbHWvgXHYNggLwkRXg6gcAqR8tb31cVXc+Pt9sE1q6Vt9cgcnFaMkr+qgO0MfVZe3mRKF+1N/xpiXBx382KtkCfGZTwubbX3VlFedDa8SmB4IPSfuM6dc1sa/Kscg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xdCA1/ceY72bOPC0AAspQufF5bY+Yw9feN27Qk8WyaE=;
 b=AL6GKTKonLPUfkWiGANamkteX+Envir/v11qzSM/Mhq8Oz+mTDQd/h7ki5f6ZV0fNZC6iyc6IlSYQYipeODqx/XngsJNoajzhO9njmf97BR8WglS+dCUXWC3nwBTWeOWPPpRypyOAlFpWSGNf1weXiMzx3mvY5Z+d4CyNXMd0prdb8tmho2F168K4JjvjIkb4SIPmBraV+ZH6N32SA/26cUobd6tFPz+pICmTBeIA5c290/C3WVFC8q0bJFq+KslZCEre3CyO2k08FxonqggHzUW3Xix/i5PwuWx0+XuqtPYIIKUgfQDifLbUrOIEbBq5KxI7GY9kMyfYGO5hDo/3A==
Received: from PH8P220CA0047.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:2d9::19)
 by SA1PR12MB7410.namprd12.prod.outlook.com (2603:10b6:806:2b4::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.15; Mon, 2 Mar
 2026 08:01:03 +0000
Received: from CY4PEPF0000FCBE.namprd03.prod.outlook.com
 (2603:10b6:510:2d9:cafe::64) by PH8P220CA0047.outlook.office365.com
 (2603:10b6:510:2d9::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.18 via Frontend Transport; Mon,
 2 Mar 2026 08:01:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CY4PEPF0000FCBE.mail.protection.outlook.com (10.167.242.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Mon, 2 Mar 2026 08:01:03 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 2 Mar
 2026 00:00:32 -0800
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 2 Mar
 2026 00:00:30 -0800
Received: from inno-dell (10.127.8.10) by mail.nvidia.com (10.129.68.8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 2 Mar 2026 00:00:27 -0800
Date: Mon, 2 Mar 2026 10:00:24 +0200
From: Zhi Wang <zhiw@nvidia.com>
To: Eliot Courtney <ecourtney@nvidia.com>
CC: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, <rust-for-linux@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 7/9] gpu: nova-core: gsp: add RM control command
 infrastructure
Message-ID: <20260302100024.71ebe173@inno-dell>
In-Reply-To: <20260227-rmcontrol-v1-7-86648e4869f9@nvidia.com>
References: <20260227-rmcontrol-v1-0-86648e4869f9@nvidia.com>
 <20260227-rmcontrol-v1-7-86648e4869f9@nvidia.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.50; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCBE:EE_|SA1PR12MB7410:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a28834a-f83f-4756-6466-08de7831d994
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: zg0Cxb2ZRg51IHXndAjZIjaWJyPdi+hdsixB+wtQQCgcU4iY7i9ySYzgeiKMGiIHsbshpwh9DQx2fLk6TFIbBiN1D8br1wQpDUniKdUpXRXa5U/jNLalrqkea/3/3SzW3quESA27Q/S5uDG0PWcFjrPrKTd0xQVaeRrXj6vDGr2o3+TzyTDeYWXWwhAXupkFW2TOJT36qRHoIJZmMKATccLCOTeIVYGtd+CI01fOLBM6s2SJQVD0TrRBiumY5bZbhMNTbp3PelzmhXd9uhISPNesLc6olfwBJBSHAaQD7w5h7DLtZ947lmesDZ3g2ERbyQOvS9f3NFmQqiEBodBRC6TwoTbub5LQ0eXvzR4CmZh08my1jAbFckmnfQbbaiQwib+yDIVYv2+3WDXFC8iUv8Soj5axpDWnHpa8jfuzz5p2YTypxC9tmRElF4hVpI/Lyy4VFnpGTznHoxIr0ho1J15lZnG4VHjNjqaZaqncGhoHWMHbsmNezyLS4Vg15hNxQS1iQDOeVsAevemWUHVkpA46jpYlV6I+lVjQYSW6pPBotVgzo3KSB8JS4m9+/H+dv0lmG6mcv7NQeAfln9SCpgPn7GK9FH1jKvVR6yVm5RPYRF4mDPwM3RBtdo9VvZ4PRvCeJ3TPzxSu15qGZrDUIL6uIX4eNZ1e7S5ITwQVfmtP12V5oIor7SGafvOWjE42kRuE528Qt78wYypcl/r2D98mfzxLJ9dMm0a4x4Ht/uq9hYQUlwjow+4LeulZh3ib5bAHe+yO+1qTMl+Z9yrXkz71VJ3+lbT7Q4uGjorWRYBb6Y7GrX6QYMFwEtEXrk8qn/J94YG+0Bp4WJlaslvLNw==
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: vX4/OjjE5xnojNJ+UjwqY+xgKzMMa5xiUblwPvp011iC2istRxSfGUClhGNFPEBg3AQJkr0Clrs/ztwQMudaO3rygj09xymFCuiXE03pvZufgzERfDDxE1qPAc10YRpz1SStfO0U5FM2IUBe+DLolnm9cVcm9L+Cp4H3T833re0YJs+WjPZ+WWGmNXSP4jipCWwCRkkKO6haOVshg4h2xlv+L+9oaUy4gYNdSZ1Le1PvJ2Fr1Pxc/unV+SZIpQHI0Urp6olv36N9O7tKlB26KSZAsVapvKXpDIlvYZktgaV88v+aMF2suVwJAOsRXxLU9VkoAevJg1Gs/CLrGUwykPYKGK2+aFCPy+mSg1rMeY4DwtB7acYm+oMzClb7EQ0W6eOzF7iggH/Yiw5depH/Vs8hiYlJQT5zMcZegRrxKFnfZlh6lBFjBM5H4JHG6IM2
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 08:01:03.1019 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a28834a-f83f-4756-6466-08de7831d994
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000FCBE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7410
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.81 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,google.com,nvidia.com,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,nvidia.com:email,Nvidia.com:dkim];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zhiw@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: B50CC1D44C3
X-Rspamd-Action: no action

On Fri, 27 Feb 2026 21:32:12 +0900
Eliot Courtney <ecourtney@nvidia.com> wrote:

Tested-by: Zhi Wang <zhiw@nvidia.com>

> Add `RmControl` which implements CommandToGsp for sending RM control
> RPCs.
> 
> Add `RmControlReply` which implements MessageFromGsp for getting the
> reply back.
> 
> Add `send_rm_control` which sends an RM control RPC via the command
> queue using the above structures.
> 
> This gives a generic way to send each RM control RPC. Each new RM
> control RPC can be added by extending RmControlMsgFunction and adding
> its bindings wrappers and writing a helper function to send it via
> `send_rm_control`.
> 
> Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
> ---
>  drivers/gpu/nova-core/gsp.rs             |   1 +
>  drivers/gpu/nova-core/gsp/rm.rs          |   3 +
>  drivers/gpu/nova-core/gsp/rm/commands.rs | 111
> +++++++++++++++++++++++++++++++ 3 files changed, 115 insertions(+)
> 
> diff --git a/drivers/gpu/nova-core/gsp.rs
> b/drivers/gpu/nova-core/gsp.rs index a6f3918c20b1..1a1c4e9808ac 100644
> --- a/drivers/gpu/nova-core/gsp.rs
> +++ b/drivers/gpu/nova-core/gsp.rs
> @@ -17,6 +17,7 @@
>  pub(crate) mod cmdq;
>  pub(crate) mod commands;
>  mod fw;
> +pub(crate) mod rm;
>  mod sequencer;
>  
>  pub(crate) use fw::{
> diff --git a/drivers/gpu/nova-core/gsp/rm.rs
> b/drivers/gpu/nova-core/gsp/rm.rs new file mode 100644
> index 000000000000..10e879a3e842
> --- /dev/null
> +++ b/drivers/gpu/nova-core/gsp/rm.rs
> @@ -0,0 +1,3 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +pub(crate) mod commands;
> diff --git a/drivers/gpu/nova-core/gsp/rm/commands.rs
> b/drivers/gpu/nova-core/gsp/rm/commands.rs new file mode 100644
> index 000000000000..16bcf88644db
> --- /dev/null
> +++ b/drivers/gpu/nova-core/gsp/rm/commands.rs
> @@ -0,0 +1,111 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +use core::{
> +    array,
> +    convert::Infallible, //
> +};
> +
> +use kernel::prelude::*;
> +
> +use crate::{
> +    driver::Bar0,
> +    gsp::{
> +        cmdq::{
> +            Cmdq,
> +            CommandToGsp,
> +            MessageFromGsp, //
> +        },
> +        fw::{
> +            rm::*,
> +            MsgFunction,
> +            NvStatus, //
> +        },
> +    },
> +    sbuffer::SBufferIter,
> +};
> +
> +/// Command for sending an RM control message to the GSP.
> +struct RmControl<'a> {
> +    h_client: u32,
> +    h_object: u32,
> +    cmd: RmControlMsgFunction,
> +    params: &'a [u8],
> +}
> +
> +impl<'a> RmControl<'a> {
> +    /// Creates a new RM control command.
> +    fn new(h_client: u32, h_object: u32, cmd: RmControlMsgFunction,
> params: &'a [u8]) -> Self {
> +        Self {
> +            h_client,
> +            h_object,
> +            cmd,
> +            params,
> +        }
> +    }
> +}
> +
> +impl CommandToGsp for RmControl<'_> {
> +    const FUNCTION: MsgFunction = MsgFunction::GspRmControl;
> +    type Command = GspRmControl;
> +    type Reply = RmControlReply;
> +    type InitError = Infallible;
> +
> +    fn init(&self) -> impl Init<Self::Command, Self::InitError> {
> +        GspRmControl::new(
> +            self.h_client,
> +            self.h_object,
> +            self.cmd,
> +            self.params.len() as u32,
> +        )
> +    }
> +
> +    fn variable_payload_len(&self) -> usize {
> +        self.params.len()
> +    }
> +
> +    fn init_variable_payload(
> +        &self,
> +        dst: &mut SBufferIter<array::IntoIter<&mut [u8], 2>>,
> +    ) -> Result {
> +        dst.write_all(self.params)
> +    }
> +}
> +
> +/// Response from an RM control message.
> +pub(crate) struct RmControlReply {
> +    status: NvStatus,
> +    params: KVVec<u8>,
> +}
> +
> +impl MessageFromGsp for RmControlReply {
> +    const FUNCTION: MsgFunction = MsgFunction::GspRmControl;
> +    type Message = GspRmControl;
> +    type InitError = Error;
> +
> +    fn read(
> +        msg: &Self::Message,
> +        sbuffer: &mut SBufferIter<array::IntoIter<&[u8], 2>>,
> +    ) -> Result<Self, Self::InitError> {
> +        Ok(RmControlReply {
> +            status: msg.status(),
> +            params: sbuffer.flush_into_kvvec(GFP_KERNEL)?,
> +        })
> +    }
> +}
> +
> +/// Sends an RM control command, checks the reply status, and
> returns the raw parameter bytes. +#[expect(dead_code)]
> +fn send_rm_control(
> +    cmdq: &Cmdq,
> +    bar: &Bar0,
> +    h_client: u32,
> +    h_object: u32,
> +    cmd: RmControlMsgFunction,
> +    params: &[u8],
> +) -> Result<KVVec<u8>> {
> +    let reply = cmdq.send_sync_command(bar, RmControl::new(h_client,
> h_object, cmd, params))?; +
> +    Result::from(reply.status)?;
> +
> +    Ok(reply.params)
> +}
> 

