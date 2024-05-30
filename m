Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F0F8D4350
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2024 04:05:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 667D010E0F6;
	Thu, 30 May 2024 02:05:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="DFO1ImVO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2056.outbound.protection.outlook.com [40.107.113.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 878C010E0F6
 for <dri-devel@lists.freedesktop.org>; Thu, 30 May 2024 02:05:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nheeWCPEFKVMC1sFeF8CGvPXokfmqBqQJNW5qksflFdwM5UNbl8z59V9E5S2HpvFQ42AJnjGsPc8J5K9nOeZnH9QPArfpp7W0cEraKRXywF6R0fFk4V0zNqfKtTzqWNDD4/aOcEHeyIjevB/jBYnPaSkQYkD+TQYZRO5mDLDXGGVpjlfNu8x7FTw7Ae0qBLljmbhXOEBJYEllMehGIxShEBouJQ8Y4m6B3vCY8Jp2SCnW6wlatXu3mJwHxyNHeg3OfWYJQ1U06FXVMesCAf63PXMWe0K6NIiCx3p01K8kYmjlsE1y1KzTtKEvcFH0lUpxuHiI37PWY6aJf1cdRZV0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pR3AX50v+bX4RzO44Jahp2cb6FWnWDUwUTgdZFXFZiI=;
 b=bGV9mpJjW7QZ+JkQcEL80QXCnzLeMN0kjp5HJZZ6RkDH+xFOw14RqQ5et58znLXWX+Wx2BwQm3lQL0zcNUl/pupXNYJ6dKgY+KJgp47ZBK8J9Fb5Q0oZK51YGJKMJCQh7yg751hipz46LYEi8QSzkx/Y06ROULA/mAPZTTZidC02nxlUu2lcZ7UcDU6YVDugZNB9gW972EjiizgI54gKEw6bcAL5Rnj8t7nDHQTdZZxgFNrVmFb9XZrfKXUy5zkn/QtOBmQZRxfrYcDJlM/ZfbXNP3ssnYt06u+90Yjfj1L9Bldl3xKle9BBM7DcZu4uOn+KvQUOcQP3zdaJovse0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pR3AX50v+bX4RzO44Jahp2cb6FWnWDUwUTgdZFXFZiI=;
 b=DFO1ImVOAutv81HZcypbmLyoueSlRYPzX/Txxia9kC2T3oP+GrvWiub9MqBDeOj/fe47h33G2cEck/bTRe/e21vzL0w86cWC9LRw+vxTHDDXOtHQo+kY8GMymCLORxmTZlKw/Tw+sK5eKFAjByr7fEhRMTOJY2kWZVlyHewQ6XE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB9900.jpnprd01.prod.outlook.com
 (2603:1096:400:223::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.21; Thu, 30 May
 2024 02:05:12 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.7633.018; Thu, 30 May 2024
 02:05:12 +0000
Date: Thu, 30 May 2024 11:05:11 +0900
Message-ID: <87le3soy08.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: "Lad Prabhakar" <prabhakar.csengg@gmail.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, Eugen Hristev <eugen.hristev@collabora.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Michal Simek <michal.simek@amd.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Rob Herring <robh+dt@kernel.org>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, coresight@lists.linaro.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-fbdev@vger.kernel.org, linux-media@vger.kernel.org, linux-omap
 @vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH v3 0/9] use for_each_endpoint_of_node()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
X-ClientProxiedBy: TYAPR01CA0099.jpnprd01.prod.outlook.com
 (2603:1096:404:2a::15) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY3PR01MB9900:EE_
X-MS-Office365-Filtering-Correlation-Id: 925f9eef-c0bc-4cbe-38eb-08dc804cf0a4
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|7416005|52116005|1800799015|376005|366007|921011|38350700005; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?aXF90MmS46ghDLNWGWSa7jhYBtKUQqMLgaumk23Y/xnQmOvsxDK5w28wdy2G?=
 =?us-ascii?Q?pZs58MZzzVbOPqK5PMpcEweXkk25QW1jIR7PT8kbBMcwzAKVdWqqayS85Nad?=
 =?us-ascii?Q?DZ3n4ktzuABDFJYUGQM5out7TFQkY62oIB+Gh6OfwrdSbWEItq3Yz7oNRd/V?=
 =?us-ascii?Q?mUl70NrC5dLz0EPpNL0EPt8X5nkf7Am3Y63rCnYSYmDvMCQO0CmiOUjxVb83?=
 =?us-ascii?Q?64H1Vh1b4cyvo6vLld4UFLjFmzx1gWmWMpfbxUbFqUR4lhNcxx5e2mZqUQ4V?=
 =?us-ascii?Q?yUbWzpxMWAlWwsr05TdRY4WAGNdmR72DfzWxzOC4O9M17RiJ+PjS1q6+ujAQ?=
 =?us-ascii?Q?Ml4fjw/IGuHzhokzYXvxDbN/QeqgIA7W3evxeThE8J3K2AcSuEnAu2tZxI+r?=
 =?us-ascii?Q?z151Us1x1mMinThMOy2Xa+B9XhBwqUXZvRWtAmONJnkFXIDkmrb8z8wVbB5T?=
 =?us-ascii?Q?E1UanNSienYWUKifpyU2BYGpT/ul1/GIycBtcD3r80piZnuE/LDz9KFr+HFC?=
 =?us-ascii?Q?+HXebaMnTI2f3Q60SySLREN+ClEAr4xC8EcBAyGGciRYTSWWVQayVpJ09hB7?=
 =?us-ascii?Q?DkISFLo0l3+fHGual7NIFvnQ4CTf/Hp+lc6HWXron6wRc9hgK9XLtH/1ZxAP?=
 =?us-ascii?Q?0TmVbGzBKuYL2KJGJzoLDB/tm/u+NQ0BEyW/M2jWb8QgQBvratHtG6EWdgQ2?=
 =?us-ascii?Q?TthFvW/vUF6zZbgLz07oXM/KuOnb8Mf/bZ6/1PJbDsvOm9l0yyk0f/d6zEYK?=
 =?us-ascii?Q?sXF9q8eKfVmxllk9nrhSWdxCewRUh9nDYjz2fG/werE9sCDHDeitrZWpPyYE?=
 =?us-ascii?Q?HLzjkCfOYVxPm+FRjtvC4RE9RnD929HPilF0gcr141TE4GE1xQmTA1HNzRbi?=
 =?us-ascii?Q?x/+WXLe6DlOaT/SNYJdXQNL7sm35duidd5snxy0qbnYAlMDvZDeULpNOfS9k?=
 =?us-ascii?Q?gFt9/dp1chkzJr2G+p2bpq6EtkV/4ZmGXvhXdlKCbvN5OIDyAlZMlgnmP2MM?=
 =?us-ascii?Q?lspA8TT46eAsmYWd/aA9halkHJ0MsHFhZHVanQZQAtPatqAu1HUmnc4c278j?=
 =?us-ascii?Q?uW19ypePvWKwEobVNWflJFOS0d1oEDApAqCszQSMY7y7MWLbDX7QchD6wY2i?=
 =?us-ascii?Q?BmUYonlnsHaWdrVsW353huGpMN5lzH+3r/FjzhC8NPxTzDJgzNGQbsJ1Mw8m?=
 =?us-ascii?Q?ylQwuKEcG8J4awxrLCL4PMalVSM2dlnvFghFQSRirAW172hNrCuqI2qg7QZt?=
 =?us-ascii?Q?nm4SI0HzKgmoNoQwdwVOMg8BizrLMvgF+Sczyvz+r4YcYuwJaTXyQ1tgCw61?=
 =?us-ascii?Q?mACGSio/GqwMYwOPa0bA+dKw?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7416005)(52116005)(1800799015)(376005)(366007)(921011)(38350700005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YWvhuWPV28ve3lYUgCc8a5wwgIcBYP30etFdS6NK/8plJxD8uN7mlXWsMWHp?=
 =?us-ascii?Q?thhGReWMeVJYiZ63PCkiUBisUUjf7mjUO33VwtlluBEce1oBApAqGOkuP34u?=
 =?us-ascii?Q?3hGYGvbITREpk34mRNnuQz/vlvFho7PTu6t4hxVycPIY2GSKOnDRYC5PUIYt?=
 =?us-ascii?Q?NWRVR10cSioXyT3x6EgdjkFkwkE6mfP99C+rDjU/Cla2Wp2Q4RFax4O4S6xH?=
 =?us-ascii?Q?M7w7/H7nYmF0zEfdpv28Yo6j7r814JbLoo3/EvYuZEh26icpMm+e4s9J2z3i?=
 =?us-ascii?Q?panq2h5kyYWJLKuFbUv2Wm/gLRv/7gmttzsLdmwSFGbjVmelgBjgnde2cnDx?=
 =?us-ascii?Q?Zfk+8DZxD3NluqYQiagbe+Oq0He0JXWki9pJLNfaK4e703gcsOCZR8LY6J64?=
 =?us-ascii?Q?lsiLAVlJUkKlGzVwkbllGOUlYd4mAZYbXAp7hH/5IL0xXG7PKJhxU2Q9lAVu?=
 =?us-ascii?Q?U1zOjmuVpcpdV4WPo9D/kDsxlabXZMzBSvtYlaMvPhDvqMvD1AYKKGISSyop?=
 =?us-ascii?Q?LmowE0h6MWREb751Nivxj7MWQyGRPjAdhf7Ad28qVzQUwTk+BTBsmav7xCQM?=
 =?us-ascii?Q?JcAww//+IzTPhxIvFw+qFzU5DkRvaLhpiZqhmA9jK7iW2JR/SMPgXQ2OqTKV?=
 =?us-ascii?Q?keYuqF2tv1JJenQXsNAc8fkjGrDDqkz30AugpDfdF57BxFqIRycsG85F1Dox?=
 =?us-ascii?Q?MtcjTXMUHxsMOyCj1gZY3HMr8f33Lshd082SQz14UD5NgyvaARqvHvt5FMem?=
 =?us-ascii?Q?Dxf5u5VPJkrpmIHFWPTWZC5SJGSeFcd0FQLpMDY41a/pbHdiArUyhgMGI4EH?=
 =?us-ascii?Q?4brpMTlAsHLOFLI5x7phmrFGbBupSZe/T9AzPVuZtLbSWoLJUFLcqiKa0aM3?=
 =?us-ascii?Q?dKWZ+0csadG/F3tazyvoj32N08xZDtVt2IwqiUJ0cfXcFz72u7ZjGM6JKe8x?=
 =?us-ascii?Q?qXJ5LZnFFRKjEH2jWoisPY7Ttm4kEgDyfCYWHvTnwzyRmet53DoGgM0JA08C?=
 =?us-ascii?Q?QI8r05/x0aqytgLY2nQdqla/Kf8QJEabEiLWdw1lEusFrsiLOQNsUfBUrMJC?=
 =?us-ascii?Q?rzbNd4q6M2jygC2Bf4hzKBuARvMwpL68cL/4kup1APsVYUduVIx2JuMkvzWe?=
 =?us-ascii?Q?L1wHTkBjCVVRFp4jTlVF8WJ8cmbO8OKgPhpkDMQFaj3WQnasGw067eDh6zmd?=
 =?us-ascii?Q?7BkSRPQEd03TZ+iYjVBxSXQOXKqSTl2hIii1CnlkWidWB5Tz2Ao9O+1Orcym?=
 =?us-ascii?Q?55YbyyNgFbyo5vkdQKYQVD/5JWaztDGoBVum8yRsllOpVSI5TQRydbOEpJPC?=
 =?us-ascii?Q?zgVK9Dxc6naj9X2AxTEVEwY35sOkxalEvToGPPqixWPKMRY/RKnsDDxdlQgz?=
 =?us-ascii?Q?LHx9mAn9+iwBgjyOmrC4a/YSjp+22lQQlLIBGh+CpgQC6Rz43JYwuUA7p0jk?=
 =?us-ascii?Q?WKUkHQOP68YLdtWG6/Rft8o3ONA2tA3NNHGoLoJwT4xtep8sAWjYp0U2y0AA?=
 =?us-ascii?Q?XES5n5qgID5iYSFsEMeZuAPgrHMfqFrP8oyrSqudypP9/l4RSqEEGAnk+tM+?=
 =?us-ascii?Q?2YFb7IGxSiDcFazKBFJjogpKIMrzSAxqEs8+kAYMmSYaU62vOWTqfAnJWTxI?=
 =?us-ascii?Q?NrT7p7ir1s4dI2nfW2atllg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 925f9eef-c0bc-4cbe-38eb-08dc804cf0a4
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2024 02:05:12.4283 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4xq2yFct6RxW2BNzCSfLiUL8bI5zJMGxDjIrhc3yoM4M4Li1aCKY1G0vg6x6lZF4WgOHml9wKnwDk4WTCt/g/OGV70bnQfEEkOM1AR7zFijsPzV3fC95Ot0eDliLAG4q
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB9900
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


Hi Rob, Helge

This is v3 patch-set

We already have for_each_endpoint_of_node(), but some drivers are
not using it. This patch-set replace it.

This patch-set is related to "OF" (= Rob), but many driveres are for
"MultiMedia" (= Helge). I'm not sure who handle these.

I noticed that my posted 1 patch on (A) was not yet included on
linus/master. I have included it.

[o] done
[*] this patch-set

	[o] tidyup of_graph_get_endpoint_count()
(A)	[o] replace endpoint func - use endpoint_by_regs()
	[*] replace endpoint func - use for_each()
	[ ] add new port function
	[ ] add new endpoint function

v2 -> v3
	- don't initialize pointer.
	- add Reviewed-by / Acked-by
	- include not-yet applied missing patch

v1 -> v2
	- fixup TI patch

Link: https://lore.kernel.org/r/8734sf6mgn.wl-kuninori.morimoto.gx@renesas.com
Link: https://lore.kernel.org/r/87cyrauf0x.wl-kuninori.morimoto.gx@renesas.com

Kuninori Morimoto (9):
  gpu: drm: replace of_graph_get_next_endpoint()
  gpu: drm: use for_each_endpoint_of_node()
  hwtracing: use for_each_endpoint_of_node()
  media: platform: microchip: use for_each_endpoint_of_node()
  media: platform: ti: use for_each_endpoint_of_node()
  media: platform: xilinx: use for_each_endpoint_of_node()
  staging: media: atmel: use for_each_endpoint_of_node()
  video: fbdev: use for_each_endpoint_of_node()
  fbdev: omapfb: use of_graph_get_remote_port()

 drivers/gpu/drm/drm_of.c                      |  4 +++-
 drivers/gpu/drm/omapdrm/dss/base.c            |  3 +--
 .../drm/panel/panel-raspberrypi-touchscreen.c |  2 +-
 drivers/gpu/drm/tiny/arcpgu.c                 |  2 +-
 .../hwtracing/coresight/coresight-platform.c  |  4 ++--
 .../microchip/microchip-sama5d2-isc.c         | 21 +++++++------------
 .../microchip/microchip-sama7g5-isc.c         | 21 +++++++------------
 .../media/platform/ti/am437x/am437x-vpfe.c    | 12 +++++------
 .../media/platform/ti/davinci/vpif_capture.c  | 14 ++++++-------
 drivers/media/platform/xilinx/xilinx-vipp.c   |  9 ++------
 .../deprecated/atmel/atmel-sama5d2-isc.c      |  8 ++-----
 .../deprecated/atmel/atmel-sama7g5-isc.c      |  8 ++-----
 drivers/video/fbdev/omap2/omapfb/dss/dss-of.c | 15 +------------
 .../omap2/omapfb/dss/omapdss-boot-init.c      |  3 +--
 14 files changed, 44 insertions(+), 82 deletions(-)

-- 
2.43.0

