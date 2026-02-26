Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gCTTI5GVoGllkwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 19:48:49 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA05F1ADFCD
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 19:48:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E86BE10E97D;
	Thu, 26 Feb 2026 18:48:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="FCLoA9KR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010025.outbound.protection.outlook.com
 [40.93.198.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FC4810E97D;
 Thu, 26 Feb 2026 18:48:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=irDFJKelwuVrODY4LIMX7y+as+a7RVajg1XTfZsCfo1MdaASgzJQoQvFnp+NmxoxQZ8whWBMWZU69nVH4htzkemnnEjsm2Aoo7xTF1oMKzexW0U5JUh8Iruj+7tDFB9YhH1eag5b933QUbACO/YmPnBo3YQ+6S7lyLjxNAhsQbCFbSQlPIg0khNCjQTuZ6F56v+u5P3dpZ5yQrPqMHtwnMb28AdUUneINu+DFuF+rurELelLxM/s2QbeSwCaOzuAJTPwCUAIwnPvg0UmDtQZEOKxEXu8//ehL50c7F7YT+WqAKzorigXbBh19HBqfvpQdnBR1sogNJ6HK7kJNl9S1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ytoWtnK8r4htRg1Knyt0A4Jlfb3a5+G7FPcYuPhF+ZM=;
 b=MX2qun3QytfMO9LchhFIz8J8x1zRG5JIFdwdGBZYMd6iPI7XqxbbELAVpiDjG5bQxInmfBtVqpmeTnhRJsNB7uFGVrEzJK7Dx6JFlLv8yE8NyPIEIxjJYcEsX/eacBSXxV5He3jjTQMEzRBxhc8l1HWHc4rynsDb2Efxyt9YjIgEZ1I2NDHA05OlhLW/Ck4HGQtAfZ283ZtOWRe8mbEop+DI8qvdoXE3pkCmjyf0qTxhsBuJ49aUPxB1MhfCnMJZNW48SaNlNaiBB/v5twrkX9hhJBAGL2jUksdR10IBDgjkLJ4VR+ixLi+ghi+6uXO3CANq/CAyAkHzDvUFHB8M2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ytoWtnK8r4htRg1Knyt0A4Jlfb3a5+G7FPcYuPhF+ZM=;
 b=FCLoA9KR716UtwFN/T20TfaQIos3k8aSi88SU/mSNrjyQfFFwfotUCpUXULSnPqkHD7SLKb2Lmgmc3zTzD6+XPvmjA/KJhN3QwVkOO/LwZwP2RjSJKBErAfLWQNj17hIsVBS6/HF9LqwW/POzi4I4m2Vg+RYq5oTiMF/kIAAQ07PJNAqVCyntCsSV55bftQOoSwrgreIVFO6ICTL9KKuoQkWOlV2JGXSY3UrqVOpvp2dleTZmmSor01VPEwgxgKOqS93c7Rb5gVYKZNqXeec1OrZY9juFEf1SwDmJzBk6KhD2gw6CmzKyvG7NCyp6hLFEzPjy079K9rSiFzMd+X0YQ==
Received: from DM6PR06CA0102.namprd06.prod.outlook.com (2603:10b6:5:336::35)
 by SJ2PR12MB9190.namprd12.prod.outlook.com (2603:10b6:a03:554::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Thu, 26 Feb
 2026 18:48:32 +0000
Received: from DS1PEPF00017092.namprd03.prod.outlook.com
 (2603:10b6:5:336:cafe::55) by DM6PR06CA0102.outlook.office365.com
 (2603:10b6:5:336::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.26 via Frontend Transport; Thu,
 26 Feb 2026 18:48:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS1PEPF00017092.mail.protection.outlook.com (10.167.17.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Thu, 26 Feb 2026 18:48:32 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 26 Feb
 2026 10:48:10 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 26 Feb
 2026 10:48:10 -0800
Received: from inno-dell (10.127.8.10) by mail.nvidia.com (10.129.68.7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 26 Feb 2026 10:48:05 -0800
Date: Thu, 26 Feb 2026 20:48:02 +0200
From: Zhi Wang <zhiw@nvidia.com>
To: Eliot Courtney <ecourtney@nvidia.com>
CC: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Benno Lossin <lossin@kernel.org>, Gary Guo
 <gary@garyguo.net>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v2 0/4] gpu: nova-core: gsp: add locking to Cmdq
Message-ID: <20260226204802.22f0e3db@inno-dell>
In-Reply-To: <20260226-cmdq-locking-v2-0-c7e16a6d5885@nvidia.com>
References: <20260226-cmdq-locking-v2-0-c7e16a6d5885@nvidia.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.50; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017092:EE_|SJ2PR12MB9190:EE_
X-MS-Office365-Filtering-Correlation-Id: 77f8b8ad-177c-47f4-0679-08de7567a3bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|82310400026|36860700013|1800799024|13003099007; 
X-Microsoft-Antispam-Message-Info: mjNh3b/CI/BHIOFJZSEFEBHTVm3F4XaPDKiid7+zktkMsnfMVmCc9Cunhh2dhUzYKFyvPEp+9GuY/Bu8ZXz85Vs9sqIEib8QRwbukpgrEN5xAu+vleQOaWxbHh0iWjJ/XIWgyB4ofdqY9xVF7BFvqrG7/WKJl2c6hIZ/GA5SAgobx9/aNqShtiZMukZa6UQWlSeHOjBme4PgAn0jPaZShmF5altBz5teTZPNQ3QbLwtAobNku9lPp+aineeRh+QascvKrX7llyA+OOALrBJlo6kMNDX0lRlkNFbfaJ7HFUSasS8D9qDfBG71hQSfCdcUZEJdzIqDNSsNWQMMD+gXRk2Qe9e1slsjWlXv2WSMn17pCjUNberqACzCH5K+mlsifJK/wNDLRbFN2O9L1h/PgURj4HsZfXWc2nPJXhaUEpmuZxRQzu38zoriwwIiGZIJbzmpNkWU2HNCF3vQ6lcmuCJLki/zqdO3/ciiL34Z1uC0th8mAfyvb5p+uySQ6LWL4yrHGP18uBEukQy+pcJrVkoePA4V/IrS2W2w0L9OkMvbM5Gjcr9xz4sBsHRLxPSMIUln0W0eULF0njrFvjgP4QWDZZtzgcWadU9dTNmPPHRhS8N17ggzqgC+FKGAh2cTbG9jIlnNloZRwFfIXgbYd+OMFrbZ4fkeK+OtHTSrXQbjcm6oBUu41DkkUzBNAt5EmX9sEyb/n2gl160lYDvQfETKkYtLPC67FinUrX79LQx219UwdQ2OQnyatdVpW8xH+WvQTaaVpFbOqDEj5fbHD/JlFWxCXGJWBo0HN2PObWYctBbHnsoWzXBucs8aNka7Ti10p8JVOYZAQ1SX/rd5vA==
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(82310400026)(36860700013)(1800799024)(13003099007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: QRptlkx+VbC+Ip03q+J0A6vcn8AxgibXoKVLL6V8jjSYIw92m2aq3i4FsdtWyPCxRYDOSIBOGbhnVOJGIgLwF3+YA5GgPGZ7dm4lUnXSX0BlEUkQMfLH5D7eyrAPGB31QXKpNVEBRVmiRQxPkt/o5jB69g3sDEBt8ZgN5QrPQdx3FxrxUt99iVbYJ9LoJklcVjpJ4SJmUP+AnexQydkrCzsrxL21QPAceIl7hJid48ZqWJNtg6vIfPtctF0Pikm6PLkWyLMMD9DIusIzBqrC/l95lytO2C8/i3nJB7ShdRhyMuJC770X2dtT8uhyzDCqxMQ6z1dP5MAYkddyQ9pcZgnF/0X4SeY4RJiboXryTgS1R2DshGThkmJpsimLi9HV1DFNcsOhjY68CitrpIND8DzweRqCDvSOluFpXdLL3GYZS86a6cxknuVZs16estcO
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 18:48:32.0628 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 77f8b8ad-177c-47f4-0679-08de7567a3bb
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF00017092.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9190
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,Nvidia.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
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
X-Rspamd-Queue-Id: DA05F1ADFCD
X-Rspamd-Action: no action

On Thu, 26 Feb 2026 23:50:22 +0900
Eliot Courtney <ecourtney@nvidia.com> wrote:

Tested-by: Zhi Wang <zhiw@nvidia.com>

> Add locking to Cmdq. This is required e.g. for unloading the driver,
> which needs to send the UnloadingGuestDriver via the command queue
> on unbind which may be on a different thread.
> 
> We have commands that need a reply ("sync") and commands that don't
> ("async"). For sync commands we want to make sure that they don't get
> the reply of a different command back. The approach this patch series
> takes is by making sync commands block until they get a response. For
> now this should be ok, and we expect GSP to be fast anyway.
> 
> To do this, we need to know which commands expect a reply and which
> don't. John's existing series[1] adds IS_ASYNC which solves part of
> the problem, but we need to know a bit more. So instead, add an
> associated type called Reply which tells us what the reply is.
> 
> An alternative would be to define traits inheriting CommandToGsp, e.g.
> SyncCommand and AsyncCommand, instead of using the associated type. I
> implemented the associated type version because it feels more
> compositional rather than inherity so seemed a bit better to me. But
> both of these approaches work and are fine, IMO.
> 
> In summary, this patch series has three steps:
> 1. Add the type infrastructure to know what replies are expected for a
>    command and update each caller to explicitly send a sync or async
>    command.
> 2. Make Cmdq pinned so we can use Mutex
> 3. Add a Mutex to protect Cmdq by moving the relevant state to an
>    inner struct.
> 
> [1]:
> https://lore.kernel.org/all/20260211000451.192109-1-jhubbard@nvidia.com/
> 
> Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
> ---
> Changes in v2:
> - Rebase on drm-rust-next
> - Link to v1:
> https://lore.kernel.org/r/20260225-cmdq-locking-v1-0-bbf6b4156706@nvidia.com
> 
> ---
> Eliot Courtney (4):
>       gpu: nova-core: gsp: fix stale doc comments on command queue
> methods gpu: nova-core: gsp: add sync and async command queue API to
> `Cmdq` gpu: nova-core: gsp: make `Cmdq` a pinned type
>       gpu: nova-core: gsp: add mutex locking to Cmdq
> 
>  drivers/gpu/nova-core/gsp.rs           |   5 +-
>  drivers/gpu/nova-core/gsp/boot.rs      |  13 +-
>  drivers/gpu/nova-core/gsp/cmdq.rs      | 246
> +++++++++++++++++++++------------
> drivers/gpu/nova-core/gsp/commands.rs  |  23 ++-
> drivers/gpu/nova-core/gsp/sequencer.rs |   2 +- 5 files changed, 183
> insertions(+), 106 deletions(-) ---
> base-commit: 4a49fe23e357b48845e31fe9c28a802c05458198
> change-id: 20260225-cmdq-locking-d32928a2c2cf
> prerequisite-message-id:
> <20260226-cmdq-continuation-v3-0-572ab9916766@nvidia.com>
> prerequisite-patch-id: fd45bc5b8eda5e2b54a052dddb1a1c363107f0a7
> prerequisite-patch-id: d0f59ef489346e978a222755f9fb42dfe7af19e5
> prerequisite-patch-id: 8844970d0e387488c70979a73732579ba174b46c
> prerequisite-patch-id: e138a94ed48fa8d50d5ed1eb36524f98923ed478
> prerequisite-patch-id: 4599a5e90d6665fa3acb7d4045de5d378ac28b4d
> prerequisite-patch-id: 30ed64c398e541d6efbcb2e46ed9a9e6cf953f4f
> prerequisite-patch-id: 9a965e9f29c8680c0b554e656ff8e9a1bfc67280
> prerequisite-patch-id: d8cccc3dfb070f304805fc7e0f24121809b4b300
> prerequisite-patch-id: c0a73dfd1fb630ab02486f0180b90f8fe850b4dc
> 
> Best regards,

