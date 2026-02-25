Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4OTJEQBLnmnXUQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 02:06:08 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D7AC18E847
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 02:06:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FB9310E653;
	Wed, 25 Feb 2026 01:05:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="oZBBP+kL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazhn15012040.outbound.protection.outlook.com
 [52.102.146.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ADFB10E653
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 01:05:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IxZzcpd13JU5kGPKNh6O4Fp+/184X7LhC0D6Axs6+DHSNc712WkpE01v559JbC2gpnYhlAX/gQB0YXkQiTe4w5izdPYDsE11sbhtX9WhneXJS1yLE3mZcfHZNv1lr6v9Zligf/LztkG+eqvRrz8B0MjCyE4TqZdumgxwyDJUMJY1r24o10jRoUAJOiB0ND07xhSA7Q94Sse5JegbLU+WCtl53jaln+X/Rd1k/5bHuIeHwA79o5h0cclpKviTDq7t3x1l+k0DLgVDbxxap/ctWIsYRUv9fYLbijLiEJ4mZCike27nZEHNOtQy9aeJLIXU9SA4wuMyXCGe19aOi1StFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ASEDpIk9PwestYsXaGClwO0sHBMLU3Jvjl1LBVZf0i4=;
 b=Lvk2WE069InA2bJh7iopXE3nbmt1U0WgS3k+/koiuMb3G/bK0y+f+Xz3pqYzFgBxYnxANislxO51MO1jyoExHipcE1jHG90UWGkl8u7RdE/qgo2Oy3B2LJWn52EEpu2iPsZFP70v4zN23L42mL7zm8aSYO84lxvjeW2W88Cu55S1ixmDh1MY/A068WUtl3NiORW0QPknDlxzkYsc7RYUy4UHCEP+qoY9thpY548fEHwZQopwst4FO1DHQZ5tgslxpJrFM/RI9S7UpY7et3rCUV1pmarlm37k7RXx5qSj/Bjjq6c5VUS/SVddQO4YzVQAkAl5CIcZVGvA4iGfhxVgsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=baylibre.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ASEDpIk9PwestYsXaGClwO0sHBMLU3Jvjl1LBVZf0i4=;
 b=oZBBP+kLqfDzOH8dShNV4Z64Y38K8ibftfiw0uJGf2wAJASjdAZqw26zyECZnCsxXrv/X2Ei7Sc5iA1eZwViLN12aRy33aCf6d+OB19T1DR4fsJAYI+uCNQ5izI98CLq4/L6D/aFO+Bctw42dw4jFNPPzkvCu1jE/37UFEPkJ7E=
Received: from SJ0PR05CA0107.namprd05.prod.outlook.com (2603:10b6:a03:334::22)
 by BN0PR10MB4887.namprd10.prod.outlook.com (2603:10b6:408:124::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Wed, 25 Feb
 2026 01:05:53 +0000
Received: from SJ1PEPF00002314.namprd03.prod.outlook.com
 (2603:10b6:a03:334:cafe::4b) by SJ0PR05CA0107.outlook.office365.com
 (2603:10b6:a03:334::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.21 via Frontend Transport; Wed,
 25 Feb 2026 01:05:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ1PEPF00002314.mail.protection.outlook.com (10.167.242.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Wed, 25 Feb 2026 01:05:52 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 24 Feb
 2026 19:05:08 -0600
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 24 Feb
 2026 19:05:07 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 24 Feb 2026 19:05:07 -0600
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
 by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61P157Oo3214557;
 Tue, 24 Feb 2026 19:05:07 -0600
Date: Tue, 24 Feb 2026 19:05:07 -0600
From: Nishanth Menon <nm@ti.com>
To: Antonios Christidis <a-christidis@ti.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Frank Binns <frank.binns@imgtec.com>,
 Matt Coster <matt.coster@imgtec.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Santosh Shilimkar
 <ssantosh@kernel.org>, Michael Turquette <mturquette@baylibre.com>, "Stephen
 Boyd" <sboyd@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-clk@vger.kernel.org>, Michael Walle
 <mwalle@kernel.org>, Kevin Hilman <khilman@baylibre.com>, Randolph Sapp
 <rs@ti.com>
Subject: Re: [PATCH 0/5] drm/imagination: add support for
 j721e,j784s4,j722s,am62p
Message-ID: <20260225010507.flvt775fs5kfe7ez@unknotted>
References: <20260224-gpu_dts-v1-0-cc5ddffe140c@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260224-gpu_dts-v1-0-cc5ddffe140c@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002314:EE_|BN0PR10MB4887:EE_
X-MS-Office365-Filtering-Correlation-Id: 73139fb6-8809-48a2-c129-08de740a0596
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|82310400026|376014|34070700014|36860700013|1800799024|12100799066;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?BWXkiyHCYvVVmmGwukheJqXYKmy86z5tXdfPt7owS08xgJ70mA3zldseeRTx?=
 =?us-ascii?Q?k+1UPXcQs29AZ9M5WwunkeprumlTDNwsN/5DPXBZUG9ftDQN/k/RvWJlWLEz?=
 =?us-ascii?Q?HTdPeZVtiZXCJwKjOfTUBEeTR+iCzg78NLhRsUNWbrR2FMFEfR3ZouBA7483?=
 =?us-ascii?Q?TV9DYoPE6UaQ8WvoEaKZIbMz/DO5hCar8q37hRwoX0TgN7sNceFdh9VM6Lrh?=
 =?us-ascii?Q?FXVsxlPYgqO89ygOyTNvrl5xlkZ2zExQz241r8GrDYvIslR4blLPJshOYOMa?=
 =?us-ascii?Q?guxaFIIGiIa1HcgYDx7dcRGabfnDwQoj+8GWmXJEwnN1EA8IHSETNEEZ3wWv?=
 =?us-ascii?Q?7Bnx0q+w5Q80F57nj2GifroF5Ckx57kEvPEk1usWV0dRoU6YXJ5fGupd/7Se?=
 =?us-ascii?Q?7i7ErYWG7yGeL+pS1KeRtiaa147x3GetXl5V654Fqwvvlcjwy3J7PiZThotV?=
 =?us-ascii?Q?3sGIt8Y5SyhDqMVqPnTNbnarAp+0veduOxftSDPrHxEOlbGRZNBxYBrziKT+?=
 =?us-ascii?Q?ugQz68jBI/vKsW26nzSb5pGQGl7W80d9Tz0+PCy41Uw8l+WXeykiVYwiQLfW?=
 =?us-ascii?Q?uYjw1x7uaJDBAs2ckh6zYFQ5oaz9E3jjPXlbQyAOdAy8eyedE7+Zj+8OW1F/?=
 =?us-ascii?Q?3WpxjWyhmcLuAa7EIpmiurdd7KPqaxwt3/YibUWqAqtWw7xTQIkoskCdEqlb?=
 =?us-ascii?Q?PIntd0R11EmGVqd+/UV35bpiISrJK9KweF/aNZq2aAiuv/bBGLF5xUTMHYtb?=
 =?us-ascii?Q?sCv6Otke1P+Dq7ypZY4x3lxIonK++Qp8IQIRjZa4ZQCu9moV8R7ihXT3kXf8?=
 =?us-ascii?Q?ARVqrnVzAlbWtX2Eo6Ui4OcghMwWO+Rjm6zq+Oj1TrHyBVM7sHvmE/Wbgt8n?=
 =?us-ascii?Q?XMHZ7fsx/0up7oeh/6LY0XcpkKgBVtXkOFqqeLPWPdsptv7mjiqhwXgh+Hc3?=
 =?us-ascii?Q?02wA4OfMAwzWBSW39aLfgfsu11kttTtFJ5zVfU29reh9l6DDWmxirRnbhQM9?=
 =?us-ascii?Q?GE5fzMupuIPYTxfd7WONLinTflOGXlWNmEKXx5U7z89v/hKU/0lmg7ApP0EB?=
 =?us-ascii?Q?p8LA33+Pu7E8owiEG9yeadzNxMV01pBLOcv9VYNiOdMk7CVxaLtAJGF2uNvt?=
 =?us-ascii?Q?xrXHnClO0Rdyr7sFn+cAnwo9eXayOLgDB6he6TNP9OrFgkHIEZs65lJLvqh5?=
 =?us-ascii?Q?l56sKDeVZ3RYhr/KV+VeAZ/5ZBa8PBwaAMxNNOMhn+0wRQiaNtyU6AdaxSfN?=
 =?us-ascii?Q?1GFi+11HgGKi0A6d9yZfBnWh1QClTPL99clI107IQ00WsGN33u2tGZ9+KkaA?=
 =?us-ascii?Q?LrHg8onk+OoI7UjY3YngXwFyc3wajJhRZu4paK28XyYItHKnv8i2VjC7E7eM?=
 =?us-ascii?Q?gMwqPr8biiyu5CXdZwnDO/cQ6vJCTxFnTasmDnSnFiHqGY3zOk9WgzfOk/9b?=
 =?us-ascii?Q?PHDtkz/xpdc3ZerCEQWPvjCcfXoa3fymF12jR8o2PQQzFRpdwKEJIDIq3+vw?=
 =?us-ascii?Q?9lFkyhfNqrocja6bXX7MVtqrzcpvcweLTUGTjB9NSqgZH5cqEYUVRFnp1k/c?=
 =?us-ascii?Q?2m8vEt4YTBTexH6Dqa0AiKF2Ul8AMBQSPV0uw2r6T1gz35FaRlMNnxpe4B33?=
 =?us-ascii?Q?/z39Xhpd5nJSgsF7UXS7aulae7IAF+tPFM7jl3rs07qdLeD+ZB471Iu2czYp?=
 =?us-ascii?Q?EI8grw=3D=3D?=
X-Forefront-Antispam-Report: CIP:198.47.21.195; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:flwvzet201.ext.ti.com; PTR:ErrorRetry; CAT:NONE;
 SFS:(13230040)(7416014)(82310400026)(376014)(34070700014)(36860700013)(1800799024)(12100799066);
 DIR:OUT; SFP:1501; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: AzPl660nNlPL1lnGhD1mHxbXOesa/IL+89ssDisGIFxis05bFKKPncQ5IJm9j2ZtiMZ8gUxMjobh5Zyf68fRlEmZl/5KRwzsAukSNkBQ20Ul6jx6e/asOSKL/TBMvU4SRhtuwTn6fwfMwgvS55R9xocWFB1jqe/+LRM/K+nIx8nlqw/ozEWki+h8u/i474iiRz96MPzvWzpxEY4BI7hBQUMPFARqlS+X0GE8Kzj+0qMYmeFmFMy/8HpuVZMHSVSVmtFetSYeCfERlf1ylNAXrOD+P0JK7oBL5YldHnIYjOqtvbZu5edGi2SAMVvxY9v907GjPg6nMsiRrUUS7KSxJiXVg1mlO8AX5mcRyn2nApfnk9cgf3KY0d94WsEdgx8STgLnjwK6b3AWSxm2wlssp9bkLR2hLqZD7U+8MUh4sdgLyLR6VvJt6FZiNmSWbivH
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 01:05:52.4081 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 73139fb6-8809-48a2-c129-08de740a0596
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.21.195];
 Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002314.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4887
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
X-Spamd-Result: default: False [-0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ti.com,quarantine];
	R_DKIM_ALLOW(-0.20)[ti.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[nm@ti.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:a-christidis@ti.com,m:vigneshr@ti.com,m:kristo@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:frank.binns@imgtec.com,m:matt.coster@imgtec.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:ssantosh@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-clk@vger.kernel.org,m:mwalle@kernel.org,m:khilman@baylibre.com,m:rs@ti.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,ti.com:dkim,ti.com:url,ti.com:email];
	DKIM_TRACE(0.00)[ti.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[nm@ti.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[ti.com,kernel.org,imgtec.com,gmail.com,ffwll.ch,linux.intel.com,suse.de,baylibre.com,lists.infradead.org,vger.kernel.org,lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.928];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 0D7AC18E847
X-Rspamd-Action: no action

On 12:09-20260224, Antonios Christidis wrote:
> ---
> Antonios Christidis (3):
>       arm64: dts: ti: k3-j721e: Add GPU node
>       dt-bindings: gpu: img: Add J721e SoC specific compatible
>       arm64: dts: ti: k3-j784s4: Add GPU node
> 
> Michael Walle (2):
>       arm64: dts: ti: add GPU node
Now that you are picking this up, please Fix the $subject.
>       clk: keystone: don't cache clock rate


Bunch of interleaved "kind of related" patches in a single series.
please do not do this.

j784s4 can go in on it's own.

j722s/am62p needs to wait for clk-cache patch to go in, but the
clk-cache patch probably needs to be submitted individually to linux-clk
mailing list for Stephen to pick up.

Please provide reference in the patch diffstat as to where the previous
version of the patch is.


Finally: j721e - please get the binding accepted through drm mailing
list, then we can see about the dts.

> 
>  .../devicetree/bindings/gpu/img,powervr-rogue.yaml         |  7 ++++++-
>  arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi     | 11 +++++++++++
>  arch/arm64/boot/dts/ti/k3-j721e-main.dtsi                  | 14 ++++++++++++++
>  arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi                 | 14 ++++++++++++++
>  drivers/clk/keystone/sci-clk.c                             |  8 ++++++++
>  5 files changed, 53 insertions(+), 1 deletion(-)
> ---
> base-commit: 3ef088b0c5772a6f75634e54aa34f5fc0a2c041c
> change-id: 20260224-gpu_dts-ab32c568d756
> 
> Best regards,
> -- 
> Antonios Christidis <a-christidis@ti.com>
> 

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource
