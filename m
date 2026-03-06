Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 9wBUAUdsqmkfRQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 06:55:19 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64FF421BD96
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 06:55:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6388B10E169;
	Fri,  6 Mar 2026 05:55:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="FbXK62JU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011043.outbound.protection.outlook.com [52.101.62.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2667410E35D
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2026 05:55:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IrmY3Us+bTZ0Img4fZnxCFJWs9zm4a1A3+wBrgaWj3my0ZCWGFuPKObiRjiDzkJX9wqFIda0QfQ/ERkxRXcc/fJyTYoK/2s9UNRJDwpEKvXhicVC5CG02/XIEyYuTahZSvieJ3f/EDW2rRwgiMlQC/IbNuPDdw1Gnz9g1d6+c9ts7d4j7j4Rq8/+zFMVuthDF3syOfpJQ9WMlB2hMHOG2HR0aFXdxolERWiRbww7JsqIub87tWkPCtLNU+kNW9Scqw2u6Ch07d8G2ap3xcMdjReLvAwoWDPubWUxgUlhLEeoCTezYKvSZTYSBUm3xRBhINiwzdtfjAhydoGKIQgePw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8txAz9+QzP2tY8iF8tk0mkjzvpv/jlfk2bqeaKA7k/A=;
 b=FW5aBO+BcEOqlYUx/EX5LyrW5M55lGJnDfng3BeNo4Fzej2WnoPBWDqD7kGwnNuZhfkiOSEU8ofjy+AgYROuhd/5E40FA35pxGcrQsHWTJHFyvl8wpeCqtSDZCgPZv5qkr5OI/+vkh6wrHEkp70w7o+SS7tzqI7B/qDqaEG2WSlVoF2rTUAjACud/MpaDGohICaSC+8F8THlj0AF+4ixOTKpTzWY//pk770aI1yjG07O4+v41e/NU517mj7eLOvPqskn1jBx1dXCMKOvbN9tXYmdF4k55zz2VzPWhL1/LYNz1k0/wVfE/Kx+Ex8q5CEHvSIcDAF+4yq6R3lBk7Vp2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8txAz9+QzP2tY8iF8tk0mkjzvpv/jlfk2bqeaKA7k/A=;
 b=FbXK62JUM3HxfaJFZvhT1Lg7TlBG4K/z+6SaM4ROfqnoTSonrf/c+7LD6yA74rGpFan1aDa7x8McFHnJYB2lWl4Auq4Epxtt97wlSv9Bv9xMTzrUNzHk0imA6+3Glwg/Fb6pRTNQrNbKuWr2NioTmP/mnWA7iFoB/1cuFKSN0Ks=
Received: from BYAPR03CA0006.namprd03.prod.outlook.com (2603:10b6:a02:a8::19)
 by IA1PR12MB6532.namprd12.prod.outlook.com (2603:10b6:208:3a3::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.5; Fri, 6 Mar
 2026 05:55:09 +0000
Received: from SJ1PEPF000023D7.namprd21.prod.outlook.com
 (2603:10b6:a02:a8:cafe::ad) by BYAPR03CA0006.outlook.office365.com
 (2603:10b6:a02:a8::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.20 via Frontend Transport; Fri,
 6 Mar 2026 05:55:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000023D7.mail.protection.outlook.com (10.167.244.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.0 via Frontend Transport; Fri, 6 Mar 2026 05:55:08 +0000
Received: from dogwood-dvt-marlim.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 5 Mar 2026 23:55:07 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: <dri-devel@lists.freedesktop.org>
CC: Mario Limonciello <mario.limonciello@amd.com>
Subject: [RFC PATCH 0/2] Allow storing TTM page limit in EFI variable
Date: Thu, 5 Mar 2026 23:54:37 -0600
Message-ID: <20260306055439.1822879-1-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D7:EE_|IA1PR12MB6532:EE_
X-MS-Office365-Filtering-Correlation-Id: 215ea493-4f0e-435b-45b9-08de7b44ec66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700016|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: E6JgkgR2dG+xOZ4mjQtkNN6ZllhbZWBUGozC6NtrtEzjZsZZQHOn2BhfA36m+4xIypgdifFnCW5dBwGUyNp05zLW70GVrXFQ3C7rxrF1v/LrBGjxJpOgklXmmZib4MXr+QuD7AS5tK5M5qydgJaxhdCveWx0Aw5sroGganbeM5PoaaMYUdqTFDCxPz8e9uxk3gpTh3893XWH06v18NK7kUFS98KulQETpYMb8DFjU0TUWSMTGxd8Lj9GLSMp4ud4tlwk+W3ffeYTpetagN43MApBx+qoXezAucOG3TC1EV3upMANQQ8yw5dLGzv9D1/KranNs7WCeDY5BPfwNURDhHXe4yrmhztIWuS3fP4UmfSb32LiLZpG+YGh+z3EZYvpF+jNIhX3EeRltunL39fmeZyF1TOKRAd5/+8iSTniJl3l6ORXIDmRAGZ0+uUTiMzTnafl5zE1ZwsIwr+Dy5D9kFYXooDSMoHmt1C1G8x3CUXb5t3kNlmCAJqAkKShK6mdEOzkYPpUkRdsJCy5YiP5f6EJVMVnRb1a/uVQ5M09rrNraKOJL39K13BjHwmaxrTbhEJ69wcqbbi9z15qV5UAiu3GhJ+1w6kljal5cnQHHDmakDAw2UWGHWnLQ/KoqnOTdGHTicn//NStg/1ciO44+hgDzpcDoJKiGna3XXvkaZWXw0Q+YbegrpGGPYxc5kAQHAxd/vFGmhQVVOkA/BIVi6rlrxjDi5O3Z+Qt+p7cwN5cUkLeZqLnM7qXIE6OxjwJ7kgZjCwqmXeXOvN0+KND3w==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700016)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 58i9q2+UxLj3BOjnCwfhlb4XuYULN8Px3AGXd35ZVlVbiyH9NLJmk16QG46tzmmkLRMVY17F5ySurMvRE2Wy4HcpZomN91c5+Pr94onH4Rh5Fs0X5xk732XKjoLMw6cjcCy4iY4ongHWt3SMNaSA9/MO65psedNqCQ25ANZkCOz9tz8fR46o7cPxr2yrEUiSvwLyTnGMI/q1QbQ9rhiPKsEkfx+lDs6U6NEgv7ZcvVtX2/NOXKHo++lIItL1kieUMxU7dYDvDAU/xeyKK/MEqiVWRidw+WQs1D4fHid309rUUin8Gec8vME262T+V7xubgvV+A1648ZVYSIHkL9qChcRsLGG9okD2xGVieofDjMWNdm1p8GJC3UGmURqise/wln/sm88aRxdj/634JLPtqNwW3lhcQyGnO2+wse/NOPt+FTPNdvgRzOgIjWUE7V3
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 05:55:08.6574 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 215ea493-4f0e-435b-45b9-08de7b44ec66
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000023D7.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6532
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
X-Rspamd-Queue-Id: 64FF421BD96
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[mario.limonciello@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	HAS_XOIP(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

The default policy for the TTM page limit is 50%. As AI model usage
increases, users increasingly need to set higher limits for the amount
of memory that TTM can utilize.

This is normally done in one of two ways:
1) Increasing the carve out (VRAM) size on a UMA system.
2) Increasing the TTM pages limit module parameter

Increasing the carve out size has the unfortunate side effect that
the memory can't be reclaimed for other purposes besides the GPU use.

Increasing the TTM page limit works, but can be a bit clunky:
 * If you have a UKI with ttm included that has all the kernel parameters
   wrapped inside it means rebuilding the UKI to be able to change the
   value.
 * If you have ttm compiled into the kernel a modprobe.d file won't work.
 * If you have ttm in the initramfs then the initramfs needs to be
   rebuilt.

I wanted to come up with an alternative method to set this limit that
could potentially be wrapped by tools, or even by a knob/slider in the
system firmware.

My idea was that we could allocate an EFI variable that TTM will look at
to see what value was configured.
* If user configured module parameter, use that.
* If user configured EFI variable and sane; use this value.
* If user configured EFI variable but it's insane, cap it.
* If no EFI variable, stick to 50% policy.

Another potential advantage of this is that a vendor who ships a workstation
"intended" for AI use could potentially ship with this EFI variable
pre-populated so that larger models could be loaded without extra efforts to
the user.

Mario Limonciello (2):
  drm/ttm: Add EFI variable support for page limit configuration
  tools/drm: Add TTM EFI variable configuration utility

 drivers/gpu/drm/ttm/ttm_tt.c |  95 ++++++++++-
 tools/drm/ttm_efi_config.py  | 303 +++++++++++++++++++++++++++++++++++
 2 files changed, 396 insertions(+), 2 deletions(-)
 create mode 100755 tools/drm/ttm_efi_config.py

-- 
2.53.0

