Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +FcFMrdQn2n+ZwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 20:42:47 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5095819CD86
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 20:42:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73BF910E371;
	Wed, 25 Feb 2026 19:42:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="etJze8Pl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010010.outbound.protection.outlook.com [52.101.201.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E3F810E371;
 Wed, 25 Feb 2026 19:42:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K1f3DtpLDoYPFJi26foT8cNQsYkfPyrdxlIB0Ld6fsu+lYxf3TEQpka9k6YcZKneF/jKRf10tX8+cDqEDbtiT+HE6JRcl8QW30DJ86FGn5bpziNhZ/B6c1LmBIscNs8+AtWf47nZhRK3uSc2Rx1a1c0RuNK2RYhoj4AYvkDyOWh88UUkLfwXYsSC1ZxfHm7cRVb6fwMawUFSxewW/BVMfA34GpHgo0tGiqVtRlu9FlhG/L7kXHy03jzx+AjbP/1qLeidjJ46Vppwr0Nki66mMCNMuX6z3pMifeQ1LokhgpjbFAhHN8ZXcWGOCt+aOHkI+gF5SFGT/oZeCxY6MH7MiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aWZ8ffIeSvzY6psqr+J5rvIUnijaXGHqpT9MFpm21B4=;
 b=ce+iKSjMF5hcs0BKwmHQlCzWpJj6Mj0xc7Qwfz/zLzFQFUQeZ9z6E/iUJ0ag9idycSgEAB/fiRlfGc6NVcieG3n/U7TMLtAQ2bIv0s9fDcvpTM24EtRA5S8NoB51JRrHT95fOSicd2dPg54IZ9NG5ctOselp851kncJHo1WQ83NR3BBmANXI72tEAsb05jw94dlifFM4aQncsU0nsfZDngXTaSg70zhbqVsPl/lm4SMaD9L9GZZvrZsn8GB8rW2WHji67xEVQ8jKbFapgHOho8Qun2G1ukVsH/oUDkwxv3xJpawt3BoKZif0zpzcPt6U6eBw245VDanU0wWqOl+g5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aWZ8ffIeSvzY6psqr+J5rvIUnijaXGHqpT9MFpm21B4=;
 b=etJze8Pltk0y7hGjAauzQjitfVkRBnjjevQzOQBb/lGQCrGqgUMIr5L4Za44vlqDH52Uetu7CUck93HHrp2zuNqF27s+HKLWPFl4ihP0hl9nNquOkc35OsNtl588ESBCmKryKx8juIZS+2Un50m74mfkxi67Jei9mVOzOCXbR8qrQRstguf2T3VBudubQwR8IvLeAuGfQwY/MBYMO3toj44h0qlr6I+brK9ZDqF0DBMtgfY25C+8iBSlJs0fiM96fEs/gOeububwCCY1PKqfVKy4Y+gHJ7nC5SoNg/vRlVm9GJLn9PwYwAnu7SE4s0SVkHEuKEuZHJ9she/MXn9xEw==
Received: from DS7PR03CA0190.namprd03.prod.outlook.com (2603:10b6:5:3b6::15)
 by PH0PR12MB7488.namprd12.prod.outlook.com (2603:10b6:510:1e9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.13; Wed, 25 Feb
 2026 19:42:38 +0000
Received: from DS2PEPF00003442.namprd04.prod.outlook.com
 (2603:10b6:5:3b6:cafe::3b) by DS7PR03CA0190.outlook.office365.com
 (2603:10b6:5:3b6::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.22 via Frontend Transport; Wed,
 25 Feb 2026 19:42:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS2PEPF00003442.mail.protection.outlook.com (10.167.17.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Wed, 25 Feb 2026 19:42:38 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 25 Feb
 2026 11:42:15 -0800
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 25 Feb
 2026 11:42:15 -0800
Received: from inno-dell (10.127.8.10) by mail.nvidia.com (10.129.68.8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 25 Feb 2026 11:42:10 -0800
Date: Wed, 25 Feb 2026 21:42:07 +0200
From: Zhi Wang <zhiw@nvidia.com>
To: Eliot Courtney <ecourtney@nvidia.com>
CC: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Benno Lossin <lossin@kernel.org>, Gary Guo
 <gary@garyguo.net>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH 2/4] gpu: nova-core: gsp: add sync and async command
 queue API to `Cmdq`
Message-ID: <20260225214207.078e3186@inno-dell>
In-Reply-To: <20260225-cmdq-locking-v1-2-bbf6b4156706@nvidia.com>
References: <20260225-cmdq-locking-v1-0-bbf6b4156706@nvidia.com>
 <20260225-cmdq-locking-v1-2-bbf6b4156706@nvidia.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.50; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003442:EE_|PH0PR12MB7488:EE_
X-MS-Office365-Filtering-Correlation-Id: 98810442-1662-40e5-ef58-08de74a6082b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|7416014|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: ndjtxbdJuyqqTaDeVs66ZdVxhCTCrVGMxF6Ffpi3REZdN4IK94YSpS0wALDuvkYBh6Szd2eEHgZlIpT7JNnuJcXUzTyfukc7WFZpqTPG/pDPEnY1vSIFaA9u8PiKfwdmVLQICr5AyiyO2YMfIYiQAOVpnP3TBsPQPlF1lj+ZWIsfUMhoOsOkUlTKbgwILbORsmPhTiBVKsFIpz3HM29uiOa2xXZNsUkfM8lUTtLpzILmJlxjm48pXkUIuGnK2BJE+l7c9rrXBgfjgaDEXqRyuKCeqyPnCFNpsCGELofbrV4VIYKj+J2f2zG/qYrmMXEyFjRIun21EE+TImECTSiKhFPTdBF+YHFwRfQudipTcVBAGh0SbFI4Jc4L05MBZ43Z4ZtF2CZQYJfmyT1Ja4daWXSPZaN1e84vSIOGnbRVRbh+s6ffCNCS33vkX3Lw4vHYkGiY9zKxoIo9s2vWeTUwI4A5rgnF+XDHQY/yxnVCfjoXI6BqYXepur6YDUHBZug3TH0ACQobpv90FF51P2kz1KYHTwl3rcBja+LrRV77qR2APct/6qep5eUGPcqZXWyTGH6830Voj0DaDwyqEIJnz1o52CiJbZ/8RVJnkg5Q/9HFBt0c28sB6fzGkzlqYglkQ39QPrHh9tsSXUXYbzicLmACpfDX39nSfI1Q0rt2M70cF3zKfIIDC5OYIhueJlxAMge71fqPlKJimz2q+s7FROQiZ6OK/W4Sxxyc56nF7XBSXp214abY8TTlr1qvKHxbZ3s82kz/Kqb++WS11k/V2qmm0mLn5dSw7Vy1e0Sf35hr5tkQccqjp1nFFhUUi+gEuz6DkuQ7B/UxCpzGBEfrPw==
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(7416014)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: SsfXil10nOppsThTyvMG4TdXaOhqi7L7FtRa0r0BoNmclFR0nv+IpuY/mT616vwfFBpOj+xXh67C9216CqkpGXOP/yWymtcvfZSwJHItBqmt1Dpx/FpjJlIu7fAoMvQ6lHAKdcv0mUhhQJgiGzu1vRk0jcg4AIXeu+72Dk5YFbX47n2uvLxJmuv+IZIjFbrpNk5oRENwSRsnExKufWiv4HxvKVcy/UTJ2FcZqHZoaK06Yd/LD0hMN0IQ6wBa1T+ZwzEvV4qUYQezJHpXhAPwyAFcgNCP/lgnWnutT47HQmnyJ769ehU5X34Q6D34XjfsKlPFqu5BM1gdsZdL3bV3Zq+1L2I45wHGfcgFnX8XGxHz7q3Uq9IZLVTonocfaBIJsZS298w+e/EsYK36bjmRguz9bB6mkpOw1zcYjR3evhEZ0fqaNU3m+l3qYedNHGk4
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 19:42:38.2214 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 98810442-1662-40e5-ef58-08de74a6082b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF00003442.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7488
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
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_COUNT_SEVEN(0.00)[8];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	FROM_NEQ_ENVFROM(0.00)[zhiw@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,google.com,nvidia.com,gmail.com,ffwll.ch,garyguo.net,lists.freedesktop.org,vger.kernel.org];
	DKIM_TRACE(0.00)[Nvidia.com:+]
X-Rspamd-Queue-Id: 5095819CD86
X-Rspamd-Action: no action

On Wed, 25 Feb 2026 22:41:49 +0900
Eliot Courtney <ecourtney@nvidia.com> wrote:

> Add sync and async command queue API and the type infrastructure to
> know what reply is expected from each `CommandToGsp`.
> 

snip

> +        loop {
> +            match self.receive_msg::<M::Reply>(Delta::from_secs(10))

It turns out here the timeout is changed to 10s from 5s which was used
in other places. Any problem you encountered during the debugging?

Z.

> {
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
> +    pub(crate) fn send_async_command<M>(&mut self, bar: &Bar0,
> command: M) -> Result
> +    where
> +        M: CommandToGsp<Reply = NoReply>,
> +        Error: From<M::InitError>,
> +    {
> +        self.send_command(bar, command)
> +    }
> +
>      /// Wait for a message to become available on the message queue.
>      ///
>      /// This works purely at the transport layer and does not
> interpret or validate the message diff --git
> a/drivers/gpu/nova-core/gsp/commands.rs
> b/drivers/gpu/nova-core/gsp/commands.rs index
> 1683ebb4c685..b42e32dcc55c 100644 ---
> a/drivers/gpu/nova-core/gsp/commands.rs +++
> b/drivers/gpu/nova-core/gsp/commands.rs @@ -26,7 +26,8 @@
> command_size, Cmdq,
>              CommandToGsp,
> -            MessageFromGsp, //
> +            MessageFromGsp,
> +            NoReply, //
>          },
>          fw::{
>              commands::*,
> @@ -53,6 +54,7 @@ pub(crate) fn new(pdev: &'a
> pci::Device<device::Bound>) -> Self { impl<'a> CommandToGsp for
> SetSystemInfo<'a> { const FUNCTION: MsgFunction =
> MsgFunction::GspSetSystemInfo; type Command = GspSetSystemInfo;
> +    type Reply = NoReply;
>      type InitError = Error;
>  
>      fn init(&self) -> impl Init<Self::Command, Self::InitError> {
> @@ -104,6 +106,7 @@ pub(crate) fn new() -> Self {
>  impl CommandToGsp for SetRegistry {
>      const FUNCTION: MsgFunction = MsgFunction::SetRegistry;
>      type Command = PackedRegistryTable;
> +    type Reply = NoReply;
>      type InitError = Infallible;
>  
>      fn init(&self) -> impl Init<Self::Command, Self::InitError> {
> @@ -183,6 +186,7 @@ pub(crate) fn wait_gsp_init_done(cmdq: &mut Cmdq)
> -> Result { impl CommandToGsp for GetGspStaticInfo {
>      const FUNCTION: MsgFunction = MsgFunction::GetGspStaticInfo;
>      type Command = GspStaticConfigInfo;
> +    type Reply = GetGspStaticInfoReply;
>      type InitError = Infallible;
>  
>      fn init(&self) -> impl Init<Self::Command, Self::InitError> {
> @@ -236,15 +240,7 @@ pub(crate) fn gpu_name(&self) ->
> core::result::Result<&str, GpuNameError> { 
>  /// Send the [`GetGspInfo`] command and awaits for its reply.
>  pub(crate) fn get_gsp_info(cmdq: &mut Cmdq, bar: &Bar0) ->
> Result<GetGspStaticInfoReply> {
> -    cmdq.send_command(bar, GetGspStaticInfo)?;
> -
> -    loop {
> -        match
> cmdq.receive_msg::<GetGspStaticInfoReply>(Delta::from_secs(5)) {
> -            Ok(info) => return Ok(info),
> -            Err(ERANGE) => continue,
> -            Err(e) => return Err(e),
> -        }
> -    }
> +    cmdq.send_sync_command(bar, GetGspStaticInfo)
>  }
>  
>  /// The `ContinuationRecord` command.
> @@ -262,6 +258,7 @@ pub(crate) fn new(data: &'a [u8]) -> Self {
>  impl<'a> CommandToGsp for ContinuationRecord<'a> {
>      const FUNCTION: MsgFunction = MsgFunction::ContinuationRecord;
>      type Command = ();
> +    type Reply = NoReply;
>      type InitError = Infallible;
>  
>      fn init(&self) -> impl Init<Self::Command, Self::InitError> {
> @@ -354,6 +351,7 @@ pub(crate) enum SplitCommand<'a, C: CommandToGsp>
> { impl<'a, C: CommandToGsp> CommandToGsp for SplitCommand<'a, C> {
>      const FUNCTION: MsgFunction = C::FUNCTION;
>      type Command = C::Command;
> +    type Reply = C::Reply;
>      type InitError = C::InitError;
>  
>      fn init(&self) -> impl Init<Self::Command, Self::InitError> {
> @@ -410,6 +408,7 @@ fn new(len: usize) -> Result<Self> {
>      impl CommandToGsp for TestPayload {
>          const FUNCTION: MsgFunction = MsgFunction::Nop;
>          type Command = ();
> +        type Reply = NoReply;
>          type InitError = Infallible;
>  
>          fn init(&self) -> impl Init<Self::Command, Self::InitError> {
> 

