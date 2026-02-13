Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SMA8GpJRj2nnPgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 17:30:10 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06A281380DD
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 17:30:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11AC310E82D;
	Fri, 13 Feb 2026 16:30:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="AVEc2w7G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazon11011054.outbound.protection.outlook.com [52.101.125.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61E2710E82D
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Feb 2026 16:30:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=plf6hL11yPfs19rxkCXVJi8aYd82puwG4YuDyeE6WFjbHQyog2DSOrGJ2Z8UZxYsq4v4ScJwMFJ3l87KAJxKinqSr3e3xWKJi1x6SNl0fWrLdQj95APQWmeZTMJTg/fHlJANznszYxphFDoXtV8YdnURW102VXqPKs0YlQdJFsUyOTBGOc3oMfua2KzBHRjssKFkSk/3AINkaSztLyrtJ64H4fAwmcXvaE6prebQTTaOqXjBzfoSQC+f/L6c8yhkxR0vWklm6+9A1AJsA8GZU4UOEqqaNFElLUdJcdfQUzHKPHkl//kYUbmF8VxffNWcrRf7kqVvtmpwS6bk5rZ4ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NjG0amWXgHt0dRq2FFvn2828F7KriynpWx16Pg7yKkk=;
 b=ZxZovCTu+Aagt7wqYO+hE6fo7rSJdmQ0gPdR8iSzmYOTg3YVP6qjoYAHPCiiXge3/g44jDmZuxZCoCCrjbcDoAZSIUs45b5JuSm7u/dXN9Livg5Mbz4ljvgfcZf5N+kx5yi9LbnypGSomGfn7NrXWSLcU5ahs8yO2yGi+3WjjfkDAeIAROju9ZhHJXxdM3FWEET/kxIpVaQC2wprXROfyuRIo5kSYj2uwcOFnZEB5zw7HrMohKw/LviRfv2FPhY4ERomqXRImjkg4FI4VEG3lsd7BRhJHiFXYK7qJb+g95suM9yl1YTNJWPFx38IzoW0bjW7VHzirDeA7zemCM9bqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NjG0amWXgHt0dRq2FFvn2828F7KriynpWx16Pg7yKkk=;
 b=AVEc2w7GAHgLzNJ+Zw5ciAOCuRxIImqxS8E5ak8nE9vuLvWAeY4Na3TA3mmVoFMLBiyEBmusZE3z6YU14YNaz0LWrtGBjRDJKNiiOr2MYBoYla9KNVPJwQvIc6fJaZQlkSFkk6r8huFR3iIS//0ck0JBziB9t9od9RsOwFqn0uA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OSCPR01MB16005.jpnprd01.prod.outlook.com (2603:1096:604:3ec::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.13; Fri, 13 Feb
 2026 16:30:05 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9611.013; Fri, 13 Feb 2026
 16:30:05 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com, geert@linux-m68k.org,
 laurent.pinchart@ideasonboard.com
Cc: linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com,
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v5 13/20] drm: renesas: rz-du: mipi_dsi: Add support for RZ/G3E
Date: Fri, 13 Feb 2026 17:27:39 +0100
Message-ID: <6f626ada15c58d15daac33a7d111bf06f5ee034e.1770996493.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1770996493.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1770996493.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR2P281CA0153.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::20) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OSCPR01MB16005:EE_
X-MS-Office365-Filtering-Correlation-Id: f325fe8c-53b5-409a-c70d-08de6b1d250c
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|52116014|7416014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/S7OTggRhohwc4ijyrR4Y7KoabTrZ4kyyySmX4qlST0aeLTT96H57LRhbUtA?=
 =?us-ascii?Q?Sk7MBW5VYeQo1OFUqnkNYlKWSduBhbivMimtwa317Ia35RqEG5NmorN0GrZY?=
 =?us-ascii?Q?DrtfxeBFOTECYdApo7JqAZk9/y1bklnRwUJNkLHKoPAKuMbMKeWZEEMC5HV/?=
 =?us-ascii?Q?r+dHmU8isxLFBc7v2Zr4Z0CPHtdlh3XKFInt0Wdnak6JYzusu4LoxCdIAWEK?=
 =?us-ascii?Q?bGc7gLP/3dax8ho+UQ1xHZhR2pPF+taKFxvN07FQuKMQQWCfuqqRuVT+LmyY?=
 =?us-ascii?Q?lHnvDf7Bs7mfEPtXzK051HuqAr+29NF+Iy9zp3R4jUwxrPgEZv5KHe/vBb35?=
 =?us-ascii?Q?4snBddt9yBMOTE5GSYraVxd/0o0Dau0vm68xDEZGv8dlC2Ls3qVjefXlsUTI?=
 =?us-ascii?Q?NrxyShzhL2MMZm2/Sk3DbIfgIu8RAX/Jcxr87mle81nIbqovQvilsTwEWgML?=
 =?us-ascii?Q?op71dGarwkS3GC1XCXv1hfe1aRV4vJStIe60pKqefPLV7bZQdpDwiulLqewR?=
 =?us-ascii?Q?SNQbsfyvNJ1fGP18HFSFFUHq3PTxQeU7D7bV6eckIr3fmj/vCqON3QjeRAN7?=
 =?us-ascii?Q?PAbCXQionm0KbjbnksEnaSWSp2gbxKSZUQ4p0ib+EX+fuz2epsMtGnqT+tLl?=
 =?us-ascii?Q?knvbMtMKqKf4weHPfK3pdlk5yte8hWOvQcqiRrxm6wdz/GAxOjZ9qPNuenPA?=
 =?us-ascii?Q?FSdMOOQIwvCYcdoUzEdFNpFJrgNBm6HmaatJwfKzS4FYRG/rkpi9o/q8yu27?=
 =?us-ascii?Q?d6WtfSS2ouMm0hGTly1lFU1VMxuIFG6til0MajBxHIg/Fyekf3BTrG4II60E?=
 =?us-ascii?Q?6sRj1oLCIB1JlKHDdC17NVc51qlJW/j/ko210BZ+2VA/8olAxVXdvj82H0EZ?=
 =?us-ascii?Q?ZeCcLvG+RSTpLjcWAahwm5KWVXQ6enCg0g8PlgWiJoVPJ4gvr6z96RcTzd42?=
 =?us-ascii?Q?RYnmqCR96Ehl97IqFUBqEErn853mZEPEveHxfj0j20tWf+9ul1eJ/yC/bXyA?=
 =?us-ascii?Q?XzKdJA+uQUAaXsNwRqWNKSaUKhSa6rlmeRzfXYxIzm/jXHRbxJdCkLBGzowy?=
 =?us-ascii?Q?5vVVRUMONBElyKJ9XocK4ipYtmWVpi9ZeKnfPkKi8qVEfIwHWPHPVEwh21/C?=
 =?us-ascii?Q?2uTEt1HaKpUlchv+T7ccr2dXRpx8OP4xLgGvznS7g2uIotOBW7/VyyIznE0S?=
 =?us-ascii?Q?SLKg6l+LKz+OC/3VGMsxTr45ytBQxBlRrpJmEydHSwbYIcM7FBSWuP22MPiE?=
 =?us-ascii?Q?K2lQtXNUyQOmz6MbRtEB4oh8PQHUuijaS0fZpEzZeJ3iYaDMlO1gXdNzBN8B?=
 =?us-ascii?Q?hC+QnOVBA3ri9weHPTZyRtFMyeOJggZmv92a7C0H21gOqWDgZGMYMBM2sVF/?=
 =?us-ascii?Q?3wdyal/63hpMpRVqVQHi9nOxpPWzk+d+fhYWDBi3TrVCoNxZIxwnT2oEfG3W?=
 =?us-ascii?Q?Rzj0icCPvx3h00pjMEeDX9EYqi3Dc+m7HGu2NQYJB1LYjxRDbVmViRXG0sc2?=
 =?us-ascii?Q?BJmi1u8vMMttQNw0aloLT+6YkftRbkyzu5B54G7acd75OXJ06fc3A0SQ7qJb?=
 =?us-ascii?Q?AYqhpQov3rfPqjuv9lNL7KoG3ujyOCSIGyRtY0pXEJs4GQi1LgjCIUou2QEe?=
 =?us-ascii?Q?XZY9euRTJRTRDwvIRPDqsKM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB11947.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(52116014)(7416014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?O5marAk7NvW0PIeoni6a3KUYeCMWCrwW705sKMgb/SSlBw6Do3wh33UQJF5o?=
 =?us-ascii?Q?jVRAwcGnzmv+fuJZZPmAIRxvayCE+RMkbP/s1pXPYsd0P1tvlQRgVsku9YDV?=
 =?us-ascii?Q?SjRpJNud28Fn4nvpHWtRnWaiSeM9MleZ2U14mVmg/iRX8GsJGXQxhZpw6jJL?=
 =?us-ascii?Q?rcaH3V0Smp2EXWlkoz5SNm0/Vv0TUaM+O8KZK3hy3RuBUo07RuhADUkB/Bgs?=
 =?us-ascii?Q?gf88/TOPiYK9eYAyMDEvTdrp9yxzpdPOQ8sSiklE922FvJ9jYgRtDjP2DHen?=
 =?us-ascii?Q?KA7SgL/4+YM9INDsKLpecIXx/ZGHJop+Lsk2mmXeY4aplvu+5uSJDhy+eXg6?=
 =?us-ascii?Q?8ERJfBkyNMJdhIL6sIwWArnniXKcitlro52aLk8o0q8KRjXaq0ff8Uv9t4SW?=
 =?us-ascii?Q?6/xpE8QfKNDEuPLVQTCeism6z2guWcIR7JqcbBFjLuvN6PJC2yrGKzymNKk9?=
 =?us-ascii?Q?N4TBzD/I6yKC4ECSJRFOWbeM55gcifWWOOigT7/JjKr95yb5AsVVmGhP48zb?=
 =?us-ascii?Q?tRNfQW9e8J9rEfFrtemU01/C5XJDq7Jim141hRVFG0nL+AJFre9r7UHV+v3/?=
 =?us-ascii?Q?VQ3tcoVriSYixecPyoNbgxHYY+1zyDfYfI5iENTblLu/vw9WMd513Pgo8xqo?=
 =?us-ascii?Q?0VuJoQjUZhNKLSt9kig940ugjdCq8v5oPd2kMrSp3Q8MX7gvUHjc544UNUJo?=
 =?us-ascii?Q?rogkddMKmA++ELBHtR2qW+Aelva1riV96cw/aA5IoqI72chgu2392RbG4/SD?=
 =?us-ascii?Q?PWdaMNPtD4M7NBT5xZikkC753P0eXTdZTjM0CjfC8rVOaRsvV9RVp8IMmurl?=
 =?us-ascii?Q?jCF7EYCcVDq+z3kbJO/WrTbJQ0FgwbQq2JZqN9/BY+f6gHhQf8HTSDQbeCyw?=
 =?us-ascii?Q?kWJLNpGUtxxwdfYKTSDUDE618hlwQSmfstjeVReZFRxJa1KgH9j/cdRlP6Q9?=
 =?us-ascii?Q?30/sZAs7TVkLg9qQUmA0d75il8ucy3ZON+L1lTUJxU4sQJmvMISu4Y0jD9v7?=
 =?us-ascii?Q?TFwK6yjEkgQJ7Bzf7Ci89GN7/j6BocORhxwZiezFDwDQ7KGsBexauP+uMR8C?=
 =?us-ascii?Q?1jcr8f1c5LzTE/o59Gy3HfH/W0FelY6pZt2ERSS2Uio+V+tCsAUUXGWPSodG?=
 =?us-ascii?Q?o1hAqNbhZ3gFLUWXTu5oaxtHCXg8kBywxX6V4Ase8v1JF41ah/iAa9Gq3zlP?=
 =?us-ascii?Q?JlqUFeuM2W5XyHEzOO80PDwOI1/dTsA0ZHhv0R29X22BVfEoxFwWnUjc6AT2?=
 =?us-ascii?Q?2EcTIPNkM6BHLsyuJPD48VP39EBQQ1a8T5IwaWSwBc0VZXhhuh14pA6z9nPp?=
 =?us-ascii?Q?EoOAvBW5OoG4xaJa6fgBAMv5WAYlSfEf4xKkFoJLpNaKR5QGPesqUNSnbweL?=
 =?us-ascii?Q?txVczjnEZ45r+PQUy26wz5zPhMGm8ioK/+3iqH54mxgh262V3TsW4Uqg8QoG?=
 =?us-ascii?Q?JifF/oq53TMP9LcMhq/ABaQSdAffO9wYhzTl2tdbSdFsBoprI8y67l373Wki?=
 =?us-ascii?Q?cOMsW+5SDdx0PG663cKzLFlTKkctVJHa7Nauz+xZAnPMol4FexvL5dC2jWYe?=
 =?us-ascii?Q?TUjPj5mDSdy4MHFIiBfVTSSsMLDfPRCPMIdr2hIzDKz4wlU+wK2dHdd4+oOE?=
 =?us-ascii?Q?ah5wrOzyPxs5uyCchILmQ72CmzvJx/124lXizcIf7/lDGRxxsw8xPK7aVnB3?=
 =?us-ascii?Q?bNo0g1EIZVxvyrXZ9Bz858O5MMOSibB+/TOgQ+LnV5Z736xxpU/psNWD7JpD?=
 =?us-ascii?Q?uZaHbCoPqo8oiFkwZusgHIEjWFEjYcnvkK9xU2CYNTA8ueamRpXM?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f325fe8c-53b5-409a-c70d-08de6b1d250c
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 16:30:05.3762 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nkCDhGYOEAElh6lAo6xX4Pj0NvsKuQT7mfuVo3j52gv4Q2qjqEDvGe+zsG+7OcAX9NYNbTBiE/nQYw9ApcKzwKepRKSWPukhz+8YUtYff57pH2DhNN46BOxor56ADb/i
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB16005
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
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:tomm.merciai@gmail.com,m:geert@linux-m68k.org,m:laurent.pinchart@ideasonboard.com,m:linux-renesas-soc@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:tommaso.merciai.xr@bp.renesas.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:magnus.damm@gmail.com,m:laurent.pinchart+renesas@ideasonboard.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-clk@vger.kernel.org,m:tommmerciai@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com,linux-m68k.org,ideasonboard.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[tommaso.merciai.xr@bp.renesas.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,glider.be,baylibre.com,ideasonboard.com,lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,bp.renesas.com:mid,bp.renesas.com:dkim,renesas.com:email]
X-Rspamd-Queue-Id: 06A281380DD
X-Rspamd-Action: no action

Add MIPI DSI support for the Renesas RZ/G3E SoC.

RZ/V2H(P) and RZ/G3E share identical PLLDSI divider constraints from the
DSI PHY perspective, so both can reuse the existing
rzv2h_plldsi_div_limits structure. However, at the CPG level the limits
differ:

 - PLLDSI0 limits apply when vclk1 is used.
 - PLLDSI1 limits apply when vclk2 is used.

To support this introduce rzg3e_plldsis_limits for RZ/G3E SoC.

During rzv2h_dphy_mode_clk_check(), the appropriate limits are selected
dynamically based on vclk_idx, which reflects the currently selected
vclk.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v4->v5:
 - No changes.

v3->v4:
 - No changes.

v2->v3:
 - No changes.

v1->v2:
 - No changes.

 .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 33 ++++++++++++++++++-
 1 file changed, 32 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index 35de1a964dc0..27901dafab9a 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -590,7 +590,7 @@ static unsigned int rzv2h_dphy_mode_clk_check(struct rzg2l_mipi_dsi *dsi,
 	mode_freq_hz = mul_u32_u32(mode_freq, KILO);
 	mode_freq_millihz = mode_freq_hz * MILLI;
 	parameters_found =
-		rzv2h_get_pll_divs_pars(dsi->info->cpg_plldsi.limits[0],
+		rzv2h_get_pll_divs_pars(dsi->info->cpg_plldsi.limits[dsi->vclk_idx],
 					&cpg_dsi_parameters,
 					dsi->info->cpg_plldsi.table,
 					dsi->info->cpg_plldsi.table_size,
@@ -1539,6 +1539,36 @@ static void rzg2l_mipi_dsi_remove(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 }
 
+RZG3E_CPG_PLL_DSI0_LIMITS(rzg3e_cpg_pll_dsi0_limits);
+RZG3E_CPG_PLL_DSI1_LIMITS(rzg3e_cpg_pll_dsi1_limits);
+
+static const struct rzv2h_pll_limits *rzg3e_plldsis_limits[] = {
+	&rzg3e_cpg_pll_dsi0_limits,
+	&rzg3e_cpg_pll_dsi1_limits,
+};
+
+static const u8 rzg3e_cpg_div_table[] = {
+	2, 4, 6, 8, 10, 12, 14, 16,
+};
+
+static struct rzg2l_mipi_dsi_hw_info rzg3e_mipi_dsi_info = {
+	.dphy_init = rzv2h_mipi_dsi_dphy_init,
+	.dphy_startup_late_init = rzv2h_mipi_dsi_dphy_startup_late_init,
+	.dphy_exit = rzv2h_mipi_dsi_dphy_exit,
+	.dphy_mode_clk_check = rzv2h_dphy_mode_clk_check,
+	.dphy_conf_clks = rzv2h_dphy_conf_clks,
+	.cpg_plldsi.limits = rzg3e_plldsis_limits,
+	.cpg_plldsi.table = rzg3e_cpg_div_table,
+	.cpg_plldsi.table_size = ARRAY_SIZE(rzg3e_cpg_div_table),
+	.phy_reg_offset = 0x10000,
+	.link_reg_offset = 0,
+	.min_dclk = 5440,
+	.max_dclk = 187500,
+	.out_port = 2,
+	.features = RZ_MIPI_DSI_FEATURE_16BPP |
+		    RZ_MIPI_DSI_FEATURE_GPO0R,
+};
+
 RZV2H_CPG_PLL_DSI_LIMITS(rzv2h_cpg_pll_dsi_limits);
 
 static const struct rzv2h_pll_limits *rzv2h_plldsi_limits[] = {
@@ -1577,6 +1607,7 @@ static const struct rzg2l_mipi_dsi_hw_info rzg2l_mipi_dsi_info = {
 };
 
 static const struct of_device_id rzg2l_mipi_dsi_of_table[] = {
+	{ .compatible = "renesas,r9a09g047-mipi-dsi", .data = &rzg3e_mipi_dsi_info, },
 	{ .compatible = "renesas,r9a09g057-mipi-dsi", .data = &rzv2h_mipi_dsi_info, },
 	{ .compatible = "renesas,rzg2l-mipi-dsi", .data = &rzg2l_mipi_dsi_info, },
 	{ /* sentinel */ }
-- 
2.43.0

