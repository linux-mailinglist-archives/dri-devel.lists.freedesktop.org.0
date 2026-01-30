Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iKodMt7pfGlTPQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 18:26:54 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E98EBD105
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 18:26:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C64410E369;
	Fri, 30 Jan 2026 17:26:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="rOvtMSko";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU010.outbound.protection.outlook.com
 (mail-japanwestazon11011020.outbound.protection.outlook.com [40.107.74.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EE8710E369
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jan 2026 17:26:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S99XGQD3jTrfUtUaccUn2Xd/uk+HztHqCWB2qFMiRt3FQ/Im/mpBedn0E99B7qb7JW3AaCJ2WPfE7ZC/RuyoRssIEui1eFkLyuqYhWHR1NJo68UgvILigSA5AVjPV0ortuELa+SY3cFFl21QzSrthsTWPOIKBwAXXVhnTZLlv605f89ujfxMyUBPlMOuECiqh+2komz8GQ/d4sHYwtabO0TrTvL3XpMQtWe7SJAxsDYzaB5NDcf4EIzq36ywyUXthJJIKk0oqOEB26xq4BGkrHHQ74cx+o3FnS7kU0dyYPtyzItyBwp98RAEAcaAULFWWxjNUcuuqRLqMwMvpsCXPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bykqjKTbe37RVOwV70a2suSZy6zzwOzNoYuaI0J3isw=;
 b=hKOS+mq8kanRwTNimKSJTDYvVxKbhmqlgBHhJ3DbU9BuzIls1uSkRI3lKRHz0X4BO+/hHXoOxGhMYWKARHzkZq627GJIi/EsdxQDY0vMsd9mmBRNaphemZtJlZThmGhSf7D4y+Duj747S7WeLsiJszGFFpuLPesdFmEvtAgyYKnd/z3qm0g+bDG7fkh3wSdxJHJn/etJa0cJOY49fpN/3TyMisUA9LBR5FuC2H/SmZYRJJ1pU+/tt0QYad3R40g1wQ8ZWx9kcRSBPvy1YAf6Sqmzdw0WakXzcQPLPDvs5OcR6GhXviiiydThmy8mrhdbr1hy8JHecgFqZA1RsjLjTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bykqjKTbe37RVOwV70a2suSZy6zzwOzNoYuaI0J3isw=;
 b=rOvtMSkoiXrKCvKlQKwFSm3usGIjWH3UopaeREwnaIrbsVfsMg9b2upng40QQSmmUD9DUb4Ig7uyvNybZKF8GSUb5RbBNR4xPAwJU5BkKClPnmPSCZdoDEg8XqbdO7hH14n6WCAHcWe2rgdE8GzgT9DMMidbzp3lmC1PjhV3oEs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYCPR01MB10351.jpnprd01.prod.outlook.com (2603:1096:400:226::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.11; Fri, 30 Jan
 2026 17:26:49 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9564.010; Fri, 30 Jan 2026
 17:26:49 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com, geert@linux-m68k.org,
 laurent.pinchart@ideasonboard.com
Cc: linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com,
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v2 06/20] clk: renesas: r9a09g047: Add support for SMUX2_DSI{0, 1}_CLK
Date: Fri, 30 Jan 2026 18:25:03 +0100
Message-ID: <a2c1ffd4b3838e774b8001e83c6c7f82f65987a7.1769789834.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1769789834.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1769789834.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0155.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b3::18) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TYCPR01MB10351:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a1c67fa-642c-4cff-880a-08de6024bfd1
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|7416014|52116014|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?E9D7BBMDsEyfubgPLDYt9Tbq4RrkhDiZNGN6B1BOjSM6aSaU+XoAT+KiosWo?=
 =?us-ascii?Q?DymZ8DdbygPXsnoVhR2UlStccuRhd/+pTDb3H+/IQiTuMStNL2rGn1J7nCnU?=
 =?us-ascii?Q?5Ihxqgp5xv+Z0acKg33Lq72ijBS/+0sS5VyiIBT0/7xIH1BNWeDJBBR/X4PN?=
 =?us-ascii?Q?NSjVveEq6N7PlGsYpJcwxC0LW+gOKEo7CwYNseIEw1bVuqo81iM66q3a+Tjg?=
 =?us-ascii?Q?+8DI2QDYKEzJ6bX3o7OXwsd8Rr5gjL7ZZf57LwvyCggpcJzsxmWFpXZ/p3DP?=
 =?us-ascii?Q?1oWxf54zmEvuWJ6tEnad0RCxGuFz+DGVjORTO/FOlU29bG9m9mclz0zlKMje?=
 =?us-ascii?Q?BGEQFRby9G/uUWpp8pcltG29OEJk4MWQ6mgwkrpxtbPPXqN0UVsZb0SD0ERO?=
 =?us-ascii?Q?wbbGHRIn606HrS0HovS5zHoGeZaDLVs37usueSi9LgaClwAIv3c4Ll77/o81?=
 =?us-ascii?Q?GqZIDoX3/OuRaQguSmmncIfrxK8fqUBZoHkJO1LKXfHt1pBpBBHoZsCVu4/m?=
 =?us-ascii?Q?U0X45ryQO/voo9aPj0ffj1AtmpObzlI8VhFN6iyyQTDDIEC8nVbPp9nCB3kY?=
 =?us-ascii?Q?RS3Qz7nlMOesm8qMn2ODCJJ0TCZ4BSjtsqdkWGCQtHYCYwNbMjzOUX946Ae5?=
 =?us-ascii?Q?ddvS4knSqDj5e6tQjxCLzSX1NkGiCAAK417JX/v2Vpvyx8zYF/Nzw7GJt5H3?=
 =?us-ascii?Q?80euPhhPeSEuYSo6qJceAHXg8VQnVrh5kaFP54hFYmqSJ1SNht7vAUVTSWx6?=
 =?us-ascii?Q?hCLY1eaveO1UT5fzc8zrUvujmp3ixCSsFFDey+b1NS7T5yGFDr245L0xaGOW?=
 =?us-ascii?Q?J7RLJVoiuC+lit3OneL7AMNVoBs0dZfAszWl7RGyl8Jy+zTNTNcL6uKhbKTe?=
 =?us-ascii?Q?1DzX4tUbUSwN/awyZ228BGL2uIHncZjjADIpEdIWiy3DJE5smXfPc7lX8GXP?=
 =?us-ascii?Q?D3c77wae+2WmNTb+RhR7f5mPu2aBwzGLQPcsm0daQShUNQM2jUv4Xe8R9X0b?=
 =?us-ascii?Q?uFdeYkpORH/PlcZfF3sFbO+KMsvzyYfATSICrx93ZBDll9uqRfkyE6WaRzgj?=
 =?us-ascii?Q?dOyFum8oM9bDwmNmV06nu8NUFFFud18N8F2iW/b1rhE/DTnEaihhzGTqX+3f?=
 =?us-ascii?Q?WN/5AIQhBZoDciR21IOYaxdESQv80ZlcttHH/I01ygrMMAZpsaI3h7b3H3vj?=
 =?us-ascii?Q?MYRuo0hV6OsWQ6GBz7tHp5spxaIdpoTtiWHvbvfsii0o2IoAB5H8sE4x1ivO?=
 =?us-ascii?Q?bmOCuBS9rFftmpZmtfnUKVtehLNR9dHTTHbqO1vWwbE3p42vCzyZgYEs02fn?=
 =?us-ascii?Q?uXJZsaFZrjqSvSP6xkRYF+Gkby1tuEmRQI2f72lNy+mFOp1yJLqM3VhBoys3?=
 =?us-ascii?Q?n+w4PU1zIWb1bete6e+p5KlN/AvWL/1B1TNi3/geLz4dfBf2TOsaiQEUxy3L?=
 =?us-ascii?Q?VHfHLkW6dQrGXeZ05lvhaXYGLTtx1W/mUadklRlkelwHtVv5IGHm7RuMtbo1?=
 =?us-ascii?Q?r9vSIByLi24n4bJ9CqrNKIJssFJSlcX4LRz7IQAxkPqCweCRbUn3k2EEz66S?=
 =?us-ascii?Q?9PXaJ/XJMOm2eGXj18j4lQPHSvlQQtr5M10auw9K4WUt0C5TpZr1sUpvJB8x?=
 =?us-ascii?Q?M23c8xx/zG2N1FXu7sTV8Io=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB11947.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(7416014)(52116014)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+K09VtAdmSpLbO+dHtnODV0Jn0Koli2IQnACzmtuEyq2UosT+/uCBmdyGbGl?=
 =?us-ascii?Q?L7h4Sv0uovzH31qnpIxAKcB27Iy3lwhkrnfeQ8fgOKhkMZcVbksG/t0cRMPG?=
 =?us-ascii?Q?pli9mH6lNSYtbVoQyUwWTDPFctrT+ydB8MT1gwEReT2Mqne9NwI2LIqKaBVO?=
 =?us-ascii?Q?aca2tMl5yauTl/p6kbU0GIBhemLdunB99LtWlaEZ3ytvXdqYoBIZrRkyns2c?=
 =?us-ascii?Q?4krE4JoV0LYiOny7YzxCtmu4ILHU4YSksPrr6/BvbsnLqRLtHtlI0fEYTN2b?=
 =?us-ascii?Q?La1SOsAeA4t0clShCOlGLdmboa/6hoNirWxiIF0GwY0dHIv/w+o+vEwGYTYm?=
 =?us-ascii?Q?YGf8xKgoTYrz7+lAURAX3FpqSfOJmod8thoeyR+Pn7FW8A5Tt36+2YdObNoe?=
 =?us-ascii?Q?wUeXUWlSm/n+/nE1V6P5bQ6xKBPUukeEPLhWkeWgKEdjClzedpNTAQPgINr/?=
 =?us-ascii?Q?U4q0qDbiOvI2dSA4vL+HqaAmcaxV1KSe2JccmBB8N9qU2pJisMUL8HbgLJx+?=
 =?us-ascii?Q?VFTWd/rViSXjpyEmQkyZQHmko5RzpGuuJ/4Mr7ViemZwdYedaSH/JvGPOuKt?=
 =?us-ascii?Q?A0QW5h7j0rw6FXMfTShiQBf8dQ7Iu32HG0jEAlHme6yphuLGwxFZd0o914Rp?=
 =?us-ascii?Q?BkhK+Ru0Q37++7TprAm+RbgJE0g/CN9jUXkeSvbMmApLJkWROocaFN48Mbds?=
 =?us-ascii?Q?yjYIK0Zd6dZLKIdpmKJn3xJvNWVmGIq+ncd88VW3CxM+ftbgrG+Uz8yK4c5R?=
 =?us-ascii?Q?buPfv6YLAEAmh9bkSFrlES1MqjmR1rxU0cEkB2pL6VSePD8RdgccUW5eaECn?=
 =?us-ascii?Q?2T5MP3kex9ciDEjG/9PBAB4ZefUk7jvA93bRUlGNTAmhrvzmiabuRY8VP+YQ?=
 =?us-ascii?Q?pEsUjUGVH0PklPbuokKU8FQMTTev5Vm7TRfD51vPmkeDfdT+ZgwcoO20XbP3?=
 =?us-ascii?Q?3BzciLzTJruoOJTagaNtBtFPANq6ZGyAUHBn5fJVxu/4tegc/APFGfFBNRQY?=
 =?us-ascii?Q?xypZFVj5f/vMZ63qoAHlpquLwGSzUMlaZxrrlHL6K4GgyJf31ZtM30IKtROA?=
 =?us-ascii?Q?qA9nWyJx9Y5ndKVYTLnY7u6PDP/rvbF8nVTsDMvF79sbF8ujDslyfwrWeAhi?=
 =?us-ascii?Q?1C/jCbtMJ4t0Hqr7xqYn1NZ1tYh+94Lw4hgCGQo4kUZA4FL2RXKoY60dLjJI?=
 =?us-ascii?Q?QJjkeHrEC03qq+5dn3lVzArf+rgrrfHsh2AL4110JO7b/fmptb+irKyl0w7m?=
 =?us-ascii?Q?OjoaafhvP2aMWUXmQ7kNRcRfWnAWTjB5X9cOwpYhpN6wyxN96fajFaJ4aWPa?=
 =?us-ascii?Q?W9LjXhHWcLx6lveRp9nMywhvf3ARdDv/ymxGeHp6xUMu1E21cy0sw6Hx+2X1?=
 =?us-ascii?Q?bJt17XI+i5PCGRqpTNWcFX9gHJUHcSJN3OIYI6pN2SjOx+SuE1C+OnC8632H?=
 =?us-ascii?Q?4r3IE7zD5U35WzpuP0qVRLZXgb6lPb/83YWSnn3DcdIRz7pKiJtpY4xudzyO?=
 =?us-ascii?Q?iUE0jSDVywlKN3Xgj2JhWihR0TzWwN/SmicYApJHB36Xdlo+v6xGh2/znwLt?=
 =?us-ascii?Q?iWrr9d0ZHv2jmBV2F0vhYbovFMm6H/GxRPvqLqLWbOsXX6q/0cISLlpA5fpQ?=
 =?us-ascii?Q?NjEzxO4fw7fOsDNAPyv5V6Mq/sAWwl86X5PpLyrG2T/H/To54D9Mg1ZuWRHa?=
 =?us-ascii?Q?ddJkMZxGS85i/azXvyudJOAL5PQUkHgdvfvOysCPmtdifmjUJ94oTfpkI2Qi?=
 =?us-ascii?Q?TwKuNO8CJ9YgHjPu/KSkFnOKDQVz4+gTGV/Ehi+8XL4qoGOlpvKz?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a1c67fa-642c-4cff-880a-08de6024bfd1
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 17:26:48.9676 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +hgjyMmFcalJrlCH5Zh7PBODMOYU5WW1VjxAVyU4H0scXaSX3rClzPKATzui5Y3IGEY5FMtEg2hu1h5DMc18le2s5qKCVUq6SASzRutB9NpxjSsE2uhDhXwiAXElr1HH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10351
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
X-Spamd-Result: default: False [4.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[bp.renesas.com:s=selector1];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	DMARC_POLICY_SOFTFAIL(0.10)[renesas.com : SPF not aligned (relaxed),none];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_TO(0.00)[gmail.com,linux-m68k.org,ideasonboard.com];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,glider.be,baylibre.com,ideasonboard.com,lists.freedesktop.org];
	FORGED_SENDER(0.00)[tommaso.merciai.xr@bp.renesas.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:tomm.merciai@gmail.com,m:geert@linux-m68k.org,m:laurent.pinchart@ideasonboard.com,m:linux-renesas-soc@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:tommaso.merciai.xr@bp.renesas.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:magnus.damm@gmail.com,m:laurent.pinchart+renesas@ideasonboard.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-clk@vger.kernel.org,m:tommmerciai@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,dri-devel-bounces@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel,dt,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DKIM_TRACE(0.00)[bp.renesas.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,bp.renesas.com:mid]
X-Rspamd-Queue-Id: 4E98EBD105
X-Rspamd-Action: no action

Add support for the SMUX2_DSI0_CLK and SMUX2_DSI1_CLK clock muxes
present on the r9a09g047 SoC.

These muxes select between CDIV7_DSI{0,1}_CLK and CSDIV_2to16_PLLDSI{0,1}
using the CPG_SSEL3 register (SELCTL0 and SELCTL1 bits).

According to the hardware manual, when LVDS0 or LVDS1 outputs are used,
SELCTL0 or SELCTL1 must be set accordingly.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v1->v2:
 - Moved clk_ids to match enum order.

 drivers/clk/renesas/r9a09g047-cpg.c | 8 ++++++++
 drivers/clk/renesas/rzv2h-cpg.h     | 3 +++
 2 files changed, 11 insertions(+)

diff --git a/drivers/clk/renesas/r9a09g047-cpg.c b/drivers/clk/renesas/r9a09g047-cpg.c
index aa6528b72cef..1e10e6ff52f8 100644
--- a/drivers/clk/renesas/r9a09g047-cpg.c
+++ b/drivers/clk/renesas/r9a09g047-cpg.c
@@ -60,6 +60,8 @@ enum clk_ids {
 	CLK_PLLETH_DIV_125_FIX,
 	CLK_CSDIV_PLLETH_GBE0,
 	CLK_CSDIV_PLLETH_GBE1,
+	CLK_SMUX2_DSI0_CLK,
+	CLK_SMUX2_DSI1_CLK,
 	CLK_SMUX2_GBE0_TXCLK,
 	CLK_SMUX2_GBE0_RXCLK,
 	CLK_SMUX2_GBE1_TXCLK,
@@ -143,6 +145,8 @@ RZG3E_CPG_PLL_DSI1_LIMITS(rzg3e_cpg_pll_dsi1_limits);
 #define PLLDSI1		PLL_PACK_LIMITS(0x160, 1, 1, &rzg3e_cpg_pll_dsi1_limits)
 
 /* Mux clock tables */
+static const char * const smux2_dsi0_clk[] = { ".plldsi0_div7", ".plldsi0_csdiv" };
+static const char * const smux2_dsi1_clk[] = { ".plldsi1_div7", ".plldsi1_csdiv" };
 static const char * const smux2_gbe0_rxclk[] = { ".plleth_gbe0", "et0_rxclk" };
 static const char * const smux2_gbe0_txclk[] = { ".plleth_gbe0", "et0_txclk" };
 static const char * const smux2_gbe1_rxclk[] = { ".plleth_gbe1", "et1_rxclk" };
@@ -218,6 +222,10 @@ static const struct cpg_core_clk r9a09g047_core_clks[] __initconst = {
 		       CSDIV1_DIVCTL3, dtable_2_16_plldsi),
 	DEF_FIXED(".plldsi0_div7", CLK_PLLDSI0_DIV7, CLK_PLLDSI0, 1, 7),
 	DEF_FIXED(".plldsi1_div7", CLK_PLLDSI1_DIV7, CLK_PLLDSI1, 1, 7),
+	DEF_PLLDSI_SMUX(".smux2_dsi0_clk", CLK_SMUX2_DSI0_CLK,
+			SSEL3_SELCTL0, smux2_dsi0_clk),
+	DEF_PLLDSI_SMUX(".smux2_dsi1_clk", CLK_SMUX2_DSI1_CLK,
+			SSEL3_SELCTL1, smux2_dsi1_clk),
 
 	/* Core Clocks */
 	DEF_FIXED("sys_0_pclk", R9A09G047_SYS_0_PCLK, CLK_QEXTAL, 1, 1),
diff --git a/drivers/clk/renesas/rzv2h-cpg.h b/drivers/clk/renesas/rzv2h-cpg.h
index 33bc3c27291c..dec0f7b621d6 100644
--- a/drivers/clk/renesas/rzv2h-cpg.h
+++ b/drivers/clk/renesas/rzv2h-cpg.h
@@ -121,6 +121,7 @@ struct fixed_mod_conf {
 
 #define CPG_SSEL0		(0x300)
 #define CPG_SSEL1		(0x304)
+#define CPG_SSEL3		(0x30C)
 #define CPG_CDDIV0		(0x400)
 #define CPG_CDDIV1		(0x404)
 #define CPG_CDDIV2		(0x408)
@@ -156,6 +157,8 @@ struct fixed_mod_conf {
 #define SSEL1_SELCTL1	SMUX_PACK(CPG_SSEL1, 4, 1)
 #define SSEL1_SELCTL2	SMUX_PACK(CPG_SSEL1, 8, 1)
 #define SSEL1_SELCTL3	SMUX_PACK(CPG_SSEL1, 12, 1)
+#define SSEL3_SELCTL0	SMUX_PACK(CPG_SSEL3, 0, 1)
+#define SSEL3_SELCTL1	SMUX_PACK(CPG_SSEL3, 4, 1)
 
 #define BUS_MSTOP_IDX_MASK	GENMASK(31, 16)
 #define BUS_MSTOP_BITS_MASK	GENMASK(15, 0)
-- 
2.43.0

