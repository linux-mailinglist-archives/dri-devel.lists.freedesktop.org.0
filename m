Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WDI6DkhSn2k7aAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 20:49:28 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9482519CECA
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 20:49:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7098310E814;
	Wed, 25 Feb 2026 19:49:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="kj79Fu+w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011003.outbound.protection.outlook.com [52.101.62.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F071E10E814;
 Wed, 25 Feb 2026 19:49:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JOwpX23V8STME8G8wqZWS3Y12Nvp1nvudMD62ZjG1YEXIjdb5vjm0fXYABDFr2kTyASYk4GD9cUvmKy7Gu4QAOGMw+EjcvRezdK4jSj67TYH7eM2LjbuG2JR2YUH78oR47CsNVoGZ0/f6qnUxiuyuP+vr4xqYVDIAkSsGjRQ7plMSWTx+0bu4E0g4yLXztX4csfHaMA8vZ0BO54nAUUhE2f7XhnLbWSEHJtvLG7nGHLM2unv2MvAwx5Q3bF8oxyaLVMbL+ttBo+8AX4yQ5VZvp/04Olq9j3tVyd5opK+Zf1rJo4ZtZ3LUkJe9Zf6E1e04Bq03dJ/EjnjKDuTO+p86w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qDmektqFrtbgWztxeR8rv2Jw/KkzWO9YpLHdnNC1HPE=;
 b=E93mtpusLUxygEltjuPpoMX2j7Itq4ypUhPC4u0VhDI7CvF8hgI/b7M/AyVwPUgrPAhUtXudWxEB6cmn/YP1dDj/OTa5KhAlI0cx4dSXGuAizSRGqah3MpherLT6S0ZaAaj3gKK/JHqcTXaOqid4brL9FrXhBJ0ZMx/BA+iU2vm11pQEuLP1nRC3wps/DIp9VSQeZKPBpbgdJZFzvqNMb7wrFWcE19fallfbbrqhkuXAsgZp+8bijaNO3Ccdp8d8S949IahMT3NczU3AQxZuf6H9crhrjd45tPxNj69ZAfAWGMLXOUx+wypUytMDq3m/PD9gGrPMyZW360XeBW7rrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qDmektqFrtbgWztxeR8rv2Jw/KkzWO9YpLHdnNC1HPE=;
 b=kj79Fu+wjpq1+3Qf+TOroXZv20Gvb5wzT/TMkhVDTUnNmgplLPa6VID3+ZE2oi/Up3b2TY/1fq1Fvt+nHzGRFnfcPMRdzBrMLtApFi3GFaxIU+DTO1NyM8g3kLSWQGgnuPdFMfLqlPup6yrVftdBGO7f0HjO0YduyQIAZ3zd7G1jBUSKsR+wnX64Q1OEvzQvwvo9Nhz8LwCv/SqOLyPI566GEeG3N/O3e8a0LuyL2SJaYfYOeeYb3bfAorpQBrXOWgcApRBEdJjKvaSCO/zKzjDbJkqpjthoz+2SpCmDzxaXO8fmNm3gmedm9+s/GvCalZKYmixAO4wUTJqvb2TmIQ==
Received: from CH5P221CA0017.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:1f2::17)
 by MN2PR12MB4207.namprd12.prod.outlook.com (2603:10b6:208:1d9::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Wed, 25 Feb
 2026 19:49:15 +0000
Received: from CH1PEPF0000A348.namprd04.prod.outlook.com
 (2603:10b6:610:1f2:cafe::1b) by CH5P221CA0017.outlook.office365.com
 (2603:10b6:610:1f2::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.23 via Frontend Transport; Wed,
 25 Feb 2026 19:49:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CH1PEPF0000A348.mail.protection.outlook.com (10.167.244.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Wed, 25 Feb 2026 19:49:14 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 25 Feb
 2026 11:48:53 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 25 Feb
 2026 11:48:52 -0800
Received: from inno-dell (10.127.8.10) by mail.nvidia.com (10.129.68.7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 25 Feb 2026 11:48:48 -0800
Date: Wed, 25 Feb 2026 21:48:44 +0200
From: Zhi Wang <zhiw@nvidia.com>
To: Eliot Courtney <ecourtney@nvidia.com>
CC: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Benno Lossin <lossin@kernel.org>, Gary Guo
 <gary@garyguo.net>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH 4/4] gpu: nova-core: gsp: add mutex locking to Cmdq
Message-ID: <20260225214844.6367f660@inno-dell>
In-Reply-To: <20260225-cmdq-locking-v1-4-bbf6b4156706@nvidia.com>
References: <20260225-cmdq-locking-v1-0-bbf6b4156706@nvidia.com>
 <20260225-cmdq-locking-v1-4-bbf6b4156706@nvidia.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.50; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A348:EE_|MN2PR12MB4207:EE_
X-MS-Office365-Filtering-Correlation-Id: 7bbd9e79-a679-478a-3f97-08de74a6f493
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|36860700013|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: AEqCH0lNSr1VQ5CC8eQfrKnuD6HxyOM4sedxhoIVs9ENmQ6benSiCCJKKMDQr6gk7hWHjVyHrOAHyISQuRbfHAfPkgH3FsqIqik4EHZ+nNokRnHSj2ksEdmKC6Qtm9drHFM0tIWpxA6h5MYWv3lr0wJwaa2Dw4PCNOQ2J6EXY+n6F4225hQj8cUiZFofMSawKocaW/Z7AW8qldEE+thDBCrdJIV/nvOwEmNHCqMMjPnD+hkqwde0pHWI1DPHjD79c6qqH1bRx022BUwz1KCcqiv48+Dc2GSj9uHtSWl2UC9KibQMy3uX7MFSschTAE3+D/ZIMT2l9mqFQi3zz580nDfxxrt0CsOCGY6/8bCQExbdNb88ghjpCAKFiOmz3/0H+o4qpB7r4Xh78qlE5ozxef+QGoUas53VngHsK5atcbR5MTFVn/UGOX/27Hqdzy9lYMmw1D1SxV5H5bWNqgZGE2Vl1LE4l65WvqI3W9AcwWtNnbgzPhhJ5vMpZVUr446Ud4JZnZGFK3M7wNDfYafaNukp5QDDbwi8g+YscpA4olN/PyTXLnVpTiximP9PsWxyad1GaB/i/i3pk+lYwmrot6H3dCZicWbNSuUzDifWCIya86k5ahMp9gOb1SQnl67DF13UL9I3jLPVQGZlXd6J86XtKoJnJmH6kyXbMyS1pOahwXmVt+wWW08tNk4mmKK+Q8PpwF1jhGS+UKIB9Tsx+NdV/uT3UzB3qlh0jzs8jcmJ0Q9xT4pwINgN8OQUJajOgjUtjmfiSA8UsynDO7ZdyWzzPvdYZUIsNVVl3s7GUkK9U23LfUnY/KZMxXjBlDqrBjbAPBx8z2z9VKB9R99afw==
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(36860700013)(82310400026)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 0rOWNFhYzseNTKy8+EftPdceJXUUB0DhkZD+tjgv7qUtpcpbUZNm/yQx2kMGByETuKFB6NwiCqqietwklhAfgBqOFwovlqW35pJA0fOBQKXdCZSWVq+RGUUVK6dp37T9azK8NQ7TGkb31K/DnFxxLgnDeVQuE2GLvp/stIo2ArV3lmZLHWT/CCtcx63/qQE2Zo6/gzfws0n0jK1LuXFcuZrH76SOZOXSw1bEK7/fN1AYTaMqZABAvWlEr0ahO65PDHFBEZeyun+BQ1jjg/KUq0CQyTJlmK2F2/zeUF02go4MGPZdh1FrEbd7QUf5jAl5uj6VZAf5uOfMfvDlJpqb+AUyZJHhwzT1u4UR4XwQx+XSWywz/76OwCXcEAP1996qhGsydWYoOJxZzYZDMvvhiZc0dtZTCBV2BCUVDNDylr1RJJ/nWQI6hqxYDyUc71sZ
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 19:49:14.8267 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bbd9e79-a679-478a-3f97-08de74a6f493
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000A348.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4207
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
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,nvidia.com:email,Nvidia.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[kernel.org,google.com,nvidia.com,gmail.com,ffwll.ch,garyguo.net,lists.freedesktop.org,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zhiw@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	NEURAL_HAM(-0.00)[-0.998];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 9482519CECA
X-Rspamd-Action: no action

On Wed, 25 Feb 2026 22:41:51 +0900
Eliot Courtney <ecourtney@nvidia.com> wrote:

Looks good to me.

Reviewed-by: Zhi Wang <zhiw@nvidia.com>

> Wrap `Cmdq`'s mutable state in a new struct `CmdqInner` and wrap that
> in a Mutex. This lets `Cmdq` methods take &self instead of &mut self,
> which lets required commands be sent e.g. while unloading the driver.
> 
> The mutex is held over both send and receive in `send_sync_command` to
> make sure that it doesn't get the reply of some other command that
> could have been sent just beforehand.
> 
> Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
> ---
>  drivers/gpu/nova-core/gsp/boot.rs      |   8 +-
>  drivers/gpu/nova-core/gsp/cmdq.rs      | 260
> ++++++++++++++++++---------------
> drivers/gpu/nova-core/gsp/commands.rs  |   4 +-
> drivers/gpu/nova-core/gsp/sequencer.rs |   2 +- 4 files changed, 152
> insertions(+), 122 deletions(-)
> 
> diff --git a/drivers/gpu/nova-core/gsp/boot.rs
> b/drivers/gpu/nova-core/gsp/boot.rs index 1cb21da855b9..cb583f57666a
> 100644 --- a/drivers/gpu/nova-core/gsp/boot.rs
> +++ b/drivers/gpu/nova-core/gsp/boot.rs
> @@ -128,7 +128,7 @@ fn run_fwsec_frts(
>      ///
>      /// Upon return, the GSP is up and running, and its runtime
> object given as return value. pub(crate) fn boot(
> -        mut self: Pin<&mut Self>,
> +        self: Pin<&mut Self>,
>          pdev: &pci::Device<device::Bound>,
>          bar: &Bar0,
>          chipset: Chipset,
> @@ -232,13 +232,13 @@ pub(crate) fn boot(
>              dev: pdev.as_ref().into(),
>              bar,
>          };
> -        GspSequencer::run(&mut self.cmdq, seq_params)?;
> +        GspSequencer::run(&self.cmdq, seq_params)?;
>  
>          // Wait until GSP is fully initialized.
> -        commands::wait_gsp_init_done(&mut self.cmdq)?;
> +        commands::wait_gsp_init_done(&self.cmdq)?;
>  
>          // Obtain and display basic GPU information.
> -        let info = commands::get_gsp_info(&mut self.cmdq, bar)?;
> +        let info = commands::get_gsp_info(&self.cmdq, bar)?;
>          match info.gpu_name() {
>              Ok(name) => dev_info!(pdev.as_ref(), "GPU name: {}\n",
> name), Err(e) => dev_warn!(pdev.as_ref(), "GPU name unavailable:
> {:?}\n", e), diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs
> b/drivers/gpu/nova-core/gsp/cmdq.rs index 44c3e960c965..faf1e9d5072b
> 100644 --- a/drivers/gpu/nova-core/gsp/cmdq.rs
> +++ b/drivers/gpu/nova-core/gsp/cmdq.rs
> @@ -16,8 +16,12 @@
>      },
>      dma_write,
>      io::poll::read_poll_timeout,
> +    new_mutex,
>      prelude::*,
> -    sync::aref::ARef,
> +    sync::{
> +        aref::ARef,
> +        Mutex, //
> +    },
>      time::Delta,
>      transmute::{
>          AsBytes,
> @@ -54,8 +58,8 @@
>  
>  /// Trait implemented by types representing a command to send to the
> GSP. ///
> -/// The main purpose of this trait is to provide
> [`Cmdq::send_command`] with the information it -/// needs to send a
> given command. +/// The main purpose of this trait is to provide
> [`Cmdq`] with the information it needs to send +/// a given command.
>  ///
>  /// [`CommandToGsp::init`] in particular is responsible for
> initializing the command directly /// into the space reserved for it
> in the command queue buffer. @@ -470,66 +474,15 @@ pub(crate) fn
> command_size<M>(command: &M) -> usize size_of::<M::Command>() +
> command.variable_payload_len() }
>  
> -/// GSP command queue.
> -///
> -/// Provides the ability to send commands and receive messages from
> the GSP using a shared memory -/// area.
> -#[pin_data]
> -pub(crate) struct Cmdq {
> -    /// Device this command queue belongs to.
> -    dev: ARef<device::Device>,
> +/// Inner mutex protected state of [`Cmdq`].
> +struct CmdqInner {
>      /// Current command sequence number.
>      seq: u32,
>      /// Memory area shared with the GSP for communicating commands
> and messages. gsp_mem: DmaGspMem,
>  }
>  
> -impl Cmdq {
> -    /// Offset of the data after the PTEs.
> -    const POST_PTE_OFFSET: usize = core::mem::offset_of!(GspMem,
> cpuq); -
> -    /// Offset of command queue ring buffer.
> -    pub(crate) const CMDQ_OFFSET: usize =
> core::mem::offset_of!(GspMem, cpuq)
> -        + core::mem::offset_of!(Msgq, msgq)
> -        - Self::POST_PTE_OFFSET;
> -
> -    /// Offset of message queue ring buffer.
> -    pub(crate) const STATQ_OFFSET: usize =
> core::mem::offset_of!(GspMem, gspq)
> -        + core::mem::offset_of!(Msgq, msgq)
> -        - Self::POST_PTE_OFFSET;
> -
> -    /// Number of page table entries for the GSP shared region.
> -    pub(crate) const NUM_PTES: usize = size_of::<GspMem>() >>
> GSP_PAGE_SHIFT; -
> -    /// Creates a new command queue for `dev`.
> -    pub(crate) fn new(dev: &device::Device<device::Bound>) -> impl
> PinInit<Self, Error> + '_ {
> -        try_pin_init!(Self {
> -            gsp_mem: DmaGspMem::new(dev)?,
> -            dev: dev.into(),
> -            seq: 0,
> -        })
> -    }
> -
> -    /// Computes the checksum for the message pointed to by `it`.
> -    ///
> -    /// A message is made of several parts, so `it` is an iterator
> over byte slices representing
> -    /// these parts.
> -    fn calculate_checksum<T: Iterator<Item = u8>>(it: T) -> u32 {
> -        let sum64 = it
> -            .enumerate()
> -            .map(|(idx, byte)| (((idx % 8) * 8) as u32, byte))
> -            .fold(0, |acc, (rol, byte)| acc ^
> u64::from(byte).rotate_left(rol)); -
> -        ((sum64 >> 32) as u32) ^ (sum64 as u32)
> -    }
> -
> -    /// Notifies the GSP that we have updated the command queue
> pointers.
> -    fn notify_gsp(bar: &Bar0) {
> -        regs::NV_PGSP_QUEUE_HEAD::default()
> -            .set_address(0)
> -            .write(bar);
> -    }
> -
> +impl CmdqInner {
>      /// Sends `command` to the GSP, without splitting it.
>      ///
>      /// # Errors
> @@ -540,7 +493,7 @@ fn notify_gsp(bar: &Bar0) {
>      ///   written to by its [`CommandToGsp::init_variable_payload`]
> method. ///
>      /// Error codes returned by the command initializers are
> propagated as-is.
> -    fn send_single_command<M>(&mut self, bar: &Bar0, command: M) ->
> Result
> +    fn send_single_command<M>(&mut self, dev: &device::Device, bar:
> &Bar0, command: M) -> Result where
>          M: CommandToGsp,
>          // This allows all error types, including `Infallible`, to
> be used for `M::InitError`. @@ -583,7 +536,7 @@ fn
> send_single_command<M>(&mut self, bar: &Bar0, command: M) -> Result
> ]))); 
>          dev_dbg!(
> -            &self.dev,
> +            dev,
>              "GSP RPC: send: seq# {}, function={}, length=0x{:x}\n",
>              self.seq,
>              M::FUNCTION,
> @@ -610,73 +563,27 @@ fn send_single_command<M>(&mut self, bar:
> &Bar0, command: M) -> Result ///   written to by its
> [`CommandToGsp::init_variable_payload`] method. ///
>      /// Error codes returned by the command initializers are
> propagated as-is.
> -    fn send_command<M>(&mut self, bar: &Bar0, command: M) -> Result
> +    fn send_command<M>(&mut self, dev: &device::Device, bar: &Bar0,
> command: M) -> Result where
>          M: CommandToGsp,
>          Error: From<M::InitError>,
>      {
>          let mut state = SplitState::new(&command)?;
> -
> -        self.send_single_command(bar, state.command(command))?;
> +        self.send_single_command(dev, bar, state.command(command))?;
>  
>          while let Some(continuation) =
> state.next_continuation_record() { dev_dbg!(
> -                &self.dev,
> +                dev,
>                  "GSP RPC: send continuation: size=0x{:x}\n",
>                  command_size(&continuation),
>              );
>              // Turbofish needed because the compiler cannot infer M
> here.
> -            self.send_single_command::<ContinuationRecord<'_>>(bar,
> continuation)?;
> +            self.send_single_command::<ContinuationRecord<'_>>(dev,
> bar, continuation)?; }
>  
>          Ok(())
>      }
>  
> -    /// Sends `command` to the GSP and waits for the reply.
> -    ///
> -    /// # Errors
> -    ///
> -    /// - `ETIMEDOUT` if space does not become available to send the
> command, or if the reply is
> -    ///   not received within the timeout.
> -    /// - `EIO` if the variable payload requested by the command has
> not been entirely
> -    ///   written to by its [`CommandToGsp::init_variable_payload`]
> method.
> -    ///
> -    /// Error codes returned by the command and reply initializers
> are propagated as-is.
> -    pub(crate) fn send_sync_command<M>(&mut self, bar: &Bar0,
> command: M) -> Result<M::Reply>
> -    where
> -        M: CommandToGsp,
> -        M::Reply: MessageFromGsp,
> -        Error: From<M::InitError>,
> -        Error: From<<M::Reply as MessageFromGsp>::InitError>,
> -    {
> -        self.send_command(bar, command)?;
> -
> -        loop {
> -            match self.receive_msg::<M::Reply>(Delta::from_secs(10))
> {
> -                Ok(reply) => break Ok(reply),
> -                Err(ERANGE) => continue,
> -                Err(e) => break Err(e),
> -            }
> -        }
> -    }
> -
> -    /// Sends `command` to the GSP without waiting for a reply.
> -    ///
> -    /// # Errors
> -    ///
> -    /// - `ETIMEDOUT` if space does not become available within the
> timeout.
> -    /// - `EIO` if the variable payload requested by the command has
> not been entirely
> -    ///   written to by its [`CommandToGsp::init_variable_payload`]
> method.
> -    ///
> -    /// Error codes returned by the command initializers are
> propagated as-is.
> -    pub(crate) fn send_async_command<M>(&mut self, bar: &Bar0,
> command: M) -> Result
> -    where
> -        M: CommandToGsp<Reply = NoReply>,
> -        Error: From<M::InitError>,
> -    {
> -        self.send_command(bar, command)
> -    }
> -
>      /// Wait for a message to become available on the message queue.
>      ///
>      /// This works purely at the transport layer and does not
> interpret or validate the message @@ -695,7 +602,7 @@ pub(crate) fn
> send_async_command<M>(&mut self, bar: &Bar0, command: M) -> Result
> ///   message queue. ///
>      /// Error codes returned by the message constructor are
> propagated as-is.
> -    fn wait_for_msg(&self, timeout: Delta) -> Result<GspMessage<'_>>
> {
> +    fn wait_for_msg(&self, dev: &device::Device, timeout: Delta) ->
> Result<GspMessage<'_>> { // Wait for a message to arrive from the GSP.
>          let (slice_1, slice_2) = read_poll_timeout(
>              || Ok(self.gsp_mem.driver_read_area()),
> @@ -712,7 +619,7 @@ fn wait_for_msg(&self, timeout: Delta) ->
> Result<GspMessage<'_>> { let (header, slice_1) =
> GspMsgElement::from_bytes_prefix(slice_1).ok_or(EIO)?; 
>          dev_dbg!(
> -            self.dev,
> +            dev,
>              "GSP RPC: receive: seq# {}, function={:?},
> length=0x{:x}\n", header.sequence(),
>              header.function(),
> @@ -747,7 +654,7 @@ fn wait_for_msg(&self, timeout: Delta) ->
> Result<GspMessage<'_>> { ])) != 0
>          {
>              dev_err!(
> -                self.dev,
> +                dev,
>                  "GSP RPC: receive: Call {} - bad checksum\n",
>                  header.sequence()
>              );
> @@ -776,12 +683,12 @@ fn wait_for_msg(&self, timeout: Delta) ->
> Result<GspMessage<'_>> { /// - `ERANGE` if the message had a
> recognized but non-matching function code. ///
>      /// Error codes returned by [`MessageFromGsp::read`] are
> propagated as-is.
> -    pub(crate) fn receive_msg<M: MessageFromGsp>(&mut self, timeout:
> Delta) -> Result<M>
> +    fn receive_msg<M: MessageFromGsp>(&mut self, dev:
> &device::Device, timeout: Delta) -> Result<M> where
>          // This allows all error types, including `Infallible`, to
> be used for `M::InitError`. Error: From<M::InitError>,
>      {
> -        let message = self.wait_for_msg(timeout)?;
> +        let message = self.wait_for_msg(dev, timeout)?;
>          let function = message.header.function().map_err(|_|
> EINVAL)?; 
>          // Extract the message. Store the result as we want to
> advance the read pointer even in @@ -802,9 +709,132 @@ pub(crate) fn
> receive_msg<M: MessageFromGsp>(&mut self, timeout: Delta) -> Resul 
>          result
>      }
> +}
> +
> +/// GSP command queue.
> +///
> +/// Provides the ability to send commands and receive messages from
> the GSP using a shared memory +/// area.
> +#[pin_data]
> +pub(crate) struct Cmdq {
> +    /// Device this command queue belongs to.
> +    dev: ARef<device::Device>,
> +    /// Inner mutex-protected state.
> +    #[pin]
> +    inner: Mutex<CmdqInner>,
> +}
> +
> +impl Cmdq {
> +    /// Offset of the data after the PTEs.
> +    const POST_PTE_OFFSET: usize = core::mem::offset_of!(GspMem,
> cpuq); +
> +    /// Offset of command queue ring buffer.
> +    pub(crate) const CMDQ_OFFSET: usize =
> core::mem::offset_of!(GspMem, cpuq)
> +        + core::mem::offset_of!(Msgq, msgq)
> +        - Self::POST_PTE_OFFSET;
> +
> +    /// Offset of message queue ring buffer.
> +    pub(crate) const STATQ_OFFSET: usize =
> core::mem::offset_of!(GspMem, gspq)
> +        + core::mem::offset_of!(Msgq, msgq)
> +        - Self::POST_PTE_OFFSET;
> +
> +    /// Number of page table entries for the GSP shared region.
> +    pub(crate) const NUM_PTES: usize = size_of::<GspMem>() >>
> GSP_PAGE_SHIFT; +
> +    /// Creates a new command queue for `dev`.
> +    pub(crate) fn new(dev: &device::Device<device::Bound>) -> impl
> PinInit<Self, Error> + '_ {
> +        try_pin_init!(Self {
> +            inner <- new_mutex!(CmdqInner {
> +                gsp_mem: DmaGspMem::new(dev)?,
> +                seq: 0,
> +                }),
> +            dev: dev.into(),
> +        })
> +    }
> +
> +    /// Computes the checksum for the message pointed to by `it`.
> +    ///
> +    /// A message is made of several parts, so `it` is an iterator
> over byte slices representing
> +    /// these parts.
> +    fn calculate_checksum<T: Iterator<Item = u8>>(it: T) -> u32 {
> +        let sum64 = it
> +            .enumerate()
> +            .map(|(idx, byte)| (((idx % 8) * 8) as u32, byte))
> +            .fold(0, |acc, (rol, byte)| acc ^
> u64::from(byte).rotate_left(rol)); +
> +        ((sum64 >> 32) as u32) ^ (sum64 as u32)
> +    }
> +
> +    /// Notifies the GSP that we have updated the command queue
> pointers.
> +    fn notify_gsp(bar: &Bar0) {
> +        regs::NV_PGSP_QUEUE_HEAD::default()
> +            .set_address(0)
> +            .write(bar);
> +    }
> +
> +    /// Sends `command` to the GSP and waits for the reply.
> +    ///
> +    /// The mutex is held for the entire send+receive cycle to
> ensure that no other command can
> +    /// be interleaved. Messages with non-matching function codes
> are silently consumed until the
> +    /// expected reply arrives.
> +    ///
> +    /// # Errors
> +    ///
> +    /// - `ETIMEDOUT` if space does not become available to send the
> command, or if the reply is
> +    ///   not received within the timeout.
> +    /// - `EIO` if the variable payload requested by the command has
> not been entirely
> +    ///   written to by its [`CommandToGsp::init_variable_payload`]
> method.
> +    ///
> +    /// Error codes returned by the command and reply initializers
> are propagated as-is.
> +    pub(crate) fn send_sync_command<M>(&self, bar: &Bar0, command:
> M) -> Result<M::Reply>
> +    where
> +        M: CommandToGsp,
> +        M::Reply: MessageFromGsp,
> +        Error: From<M::InitError>,
> +        Error: From<<M::Reply as MessageFromGsp>::InitError>,
> +    {
> +        let mut inner = self.inner.lock();
> +        inner.send_command(&self.dev, bar, command)?;
> +
> +        loop {
> +            match inner.receive_msg::<M::Reply>(&self.dev,
> Delta::from_secs(10)) {
> +                Ok(reply) => break Ok(reply),
> +                Err(ERANGE) => continue,
> +                Err(e) => break Err(e),
> +            }
> +        }
> +    }
> +
> +    /// Sends `command` to the GSP without waiting for a reply.
> +    ///
> +    /// # Errors
> +    ///
> +    /// - `ETIMEDOUT` if space does not become available within the
> timeout.
> +    /// - `EIO` if the variable payload requested by the command has
> not been entirely
> +    ///   written to by its [`CommandToGsp::init_variable_payload`]
> method.
> +    ///
> +    /// Error codes returned by the command initializers are
> propagated as-is.
> +    pub(crate) fn send_async_command<M>(&self, bar: &Bar0, command:
> M) -> Result
> +    where
> +        M: CommandToGsp<Reply = NoReply>,
> +        Error: From<M::InitError>,
> +    {
> +        self.inner.lock().send_command(&self.dev, bar, command)
> +    }
> +
> +    /// Receive a message from the GSP.
> +    ///
> +    /// See [`CmdqInner::receive_msg`] for details.
> +    pub(crate) fn receive_msg<M: MessageFromGsp>(&self, timeout:
> Delta) -> Result<M>
> +    where
> +        // This allows all error types, including `Infallible`, to
> be used for `M::InitError`.
> +        Error: From<M::InitError>,
> +    {
> +        self.inner.lock().receive_msg(&self.dev, timeout)
> +    }
>  
>      /// Returns the DMA handle of the command queue's shared memory
> region. pub(crate) fn dma_handle(&self) -> DmaAddress {
> -        self.gsp_mem.0.dma_handle()
> +        self.inner.lock().gsp_mem.0.dma_handle()
>      }
>  }
> diff --git a/drivers/gpu/nova-core/gsp/commands.rs
> b/drivers/gpu/nova-core/gsp/commands.rs index
> b42e32dcc55c..7ceff2e6bd63 100644 ---
> a/drivers/gpu/nova-core/gsp/commands.rs +++
> b/drivers/gpu/nova-core/gsp/commands.rs @@ -170,7 +170,7 @@ fn read(
>  }
>  
>  /// Waits for GSP initialization to complete.
> -pub(crate) fn wait_gsp_init_done(cmdq: &mut Cmdq) -> Result {
> +pub(crate) fn wait_gsp_init_done(cmdq: &Cmdq) -> Result {
>      loop {
>          match cmdq.receive_msg::<GspInitDone>(Delta::from_secs(10)) {
>              Ok(_) => break Ok(()),
> @@ -239,7 +239,7 @@ pub(crate) fn gpu_name(&self) ->
> core::result::Result<&str, GpuNameError> { }
>  
>  /// Send the [`GetGspInfo`] command and awaits for its reply.
> -pub(crate) fn get_gsp_info(cmdq: &mut Cmdq, bar: &Bar0) ->
> Result<GetGspStaticInfoReply> { +pub(crate) fn get_gsp_info(cmdq:
> &Cmdq, bar: &Bar0) -> Result<GetGspStaticInfoReply> {
> cmdq.send_sync_command(bar, GetGspStaticInfo) }
>  
> diff --git a/drivers/gpu/nova-core/gsp/sequencer.rs
> b/drivers/gpu/nova-core/gsp/sequencer.rs index
> 2fa2a0792cec..bc94b8567c6a 100644 ---
> a/drivers/gpu/nova-core/gsp/sequencer.rs +++
> b/drivers/gpu/nova-core/gsp/sequencer.rs @@ -366,7 +366,7 @@
> pub(crate) struct GspSequencerParams<'a> { }
>  
>  impl<'a> GspSequencer<'a> {
> -    pub(crate) fn run(cmdq: &mut Cmdq, params:
> GspSequencerParams<'a>) -> Result {
> +    pub(crate) fn run(cmdq: &Cmdq, params: GspSequencerParams<'a>)
> -> Result { let seq_info = loop {
>              match
> cmdq.receive_msg::<GspSequence>(Delta::from_secs(10)) { Ok(seq_info)
> => break seq_info,
> 

