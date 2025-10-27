Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA203C0F327
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 17:14:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9D9A10E4E9;
	Mon, 27 Oct 2025 16:14:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="FcqsxtNH";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="FcqsxtNH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11013063.outbound.protection.outlook.com [40.107.159.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8189710E4E3
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 16:14:19 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=GJZFN2/ru65s3VVw6UxxKUH4joXCHv0vyernTpIHU/LyvwYEjcrLKkjsNjNH1H8E1xjQl/ksupHwm72sQOSAlEsxp9ur2C4SJjj1h6uqY/VG79r51M3lfu20LpDGrfaOjc4fbjw1FNrm1NlWf5ltpoD0njHCXhzXDqlTzczXBrFNDkJsXhSDk3ekDTMuGRK60f/SbiB4Xkidmw4VUf46Myp3m72Nb5PgxCmszF9TfTpRGj7UkP0Or8ANtPlHf57JewkSIhZnycEifqM3qf+TedC6xtIJ51Hx+V26JF46Wi4Yk46D7YfOafU3+EVC5XhYuWzMYuVFeW8ZX7FHFfrZmw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y7evywKhAjsg3ehOIRMx4gV2+v9EZFRrab8BbCfYl3g=;
 b=U13efre6zrA0KsmNk9Y+8uTo7XgqzAn+x/T/tx+qAAbMr6utnVu6JUCTqPZj2zty45VLWnVt3BNm6CqCULf/IE7hfH3z0M6nGWRazFcz70qfaVS2wuFz/20JJpQartek5N1mxHZrYfSPn7wqGQQz9yDKOa820vUg4Ul3iGsGiayN5j+Mp3P+B2sGPPEOixJpc1Jkd9TuClUrDUv2FxZ4d1INMu93E7l3p++CCjDXogOwXMB6IsiNeyTEzWquGyjmOE9QTpXhiANQR2/WnAXx9rHw1CyijN3hIC4qFWU9qQIwRB2fo/ZAfhuNb5HTOW6syhh4HEaqczNnrxagWXdZWg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y7evywKhAjsg3ehOIRMx4gV2+v9EZFRrab8BbCfYl3g=;
 b=FcqsxtNHuH/cUorGPJfQwSSWfJDjYALEV40OAPpwKifOJblgDbhjvGU3/aRuYO7oVEEr2o37Tcoe7QlbT0SWo3CAqRo+t3BJ0bGB7Yg6F9ZB2TxSaIWrib6QopEH4xc3+MmBMOpnPLWyQAs3j4EbKExQ8Q9Ppj16JZKqEvOURG0=
Received: from DU2PR04CA0059.eurprd04.prod.outlook.com (2603:10a6:10:234::34)
 by AS8PR08MB7792.eurprd08.prod.outlook.com (2603:10a6:20b:52c::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.17; Mon, 27 Oct
 2025 16:14:13 +0000
Received: from DU2PEPF00028CFE.eurprd03.prod.outlook.com
 (2603:10a6:10:234:cafe::b6) by DU2PR04CA0059.outlook.office365.com
 (2603:10a6:10:234::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.18 via Frontend Transport; Mon,
 27 Oct 2025 16:14:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028CFE.mail.protection.outlook.com (10.167.242.182) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.10
 via Frontend Transport; Mon, 27 Oct 2025 16:14:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zO6FmWtIy6M4+FT2cpiM0XwgDvBcQ2kVp/JyCI10+t8rG/vsfy8xtKvYG9hM5+KZF9NSA5gl6KYeV4U85/3wmiJ1k52i6dLx0U8kWUe4Z/n5siK1aSbUDTquPUmhTQZa20h+VVlPG0Uduyq1NQ9IM54BCsPnKZ3DsJiNq/vFCKaYWIye4TRvQpFOiRe490dPA5XOZngu4+P5J+Gw4FT54a40XuC6OLM2Y2Up5AmiVRdpyGa0Bxll6Cl1vA8dDHDTOwPnTeurUFitd4JuPOnyR13kJClPfZ+2nLax4p4dJpY8bNzX5zjB3ocIfEWSP3gJ4zoJ6xNTjUK3IOQ4E1lNFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y7evywKhAjsg3ehOIRMx4gV2+v9EZFRrab8BbCfYl3g=;
 b=jsqKGeldQrbRFxDk0Pp4hI7lf0PlzmHAhKUEXJMOV9Wlz42hQ2wwesyl9ZvrCOfUUFUpc8zSpczHR/rvwpiXxrPmbTLr0qDACckr9HzSRxSh69RLIovYjfyhrLjdjO+Z8PK9tGc16NSX0kSHoNEHR6o9aCrOOkHo593ohCrH/57lM2xYDqI0O7ZtlNqPl7BiRc1RUkKyZDdItmMj0XYV3C7FMVVZfUlT7fPzb8Y7uPlpVFg7QunG52G+c5nlUgY8Uh/V4isifZd4TacbedbMftJ7O3mG7DyW34a8MUnI9DWCRWMO8877/SCyknl0uoA006QuPxEHZgRf8cipkyljxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y7evywKhAjsg3ehOIRMx4gV2+v9EZFRrab8BbCfYl3g=;
 b=FcqsxtNHuH/cUorGPJfQwSSWfJDjYALEV40OAPpwKifOJblgDbhjvGU3/aRuYO7oVEEr2o37Tcoe7QlbT0SWo3CAqRo+t3BJ0bGB7Yg6F9ZB2TxSaIWrib6QopEH4xc3+MmBMOpnPLWyQAs3j4EbKExQ8Q9Ppj16JZKqEvOURG0=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by DB4PR08MB9335.eurprd08.prod.outlook.com
 (2603:10a6:10:3f4::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.17; Mon, 27 Oct
 2025 16:13:38 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%7]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 16:13:38 +0000
From: Karunika Choo <karunika.choo@arm.com>
To: dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/8] drm/panthor: Add support for Mali-G1 GPUs
Date: Mon, 27 Oct 2025 16:13:26 +0000
Message-ID: <20251027161334.854650-1-karunika.choo@arm.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0307.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:197::6) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|DB4PR08MB9335:EE_|DU2PEPF00028CFE:EE_|AS8PR08MB7792:EE_
X-MS-Office365-Filtering-Correlation-Id: f34a8574-51ff-49fd-4b73-08de1573de5d
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?9FaCxuoe3WbcbKidQCfkwogzQb5zJXiKLk2EeKTK0oXAAkwr0K7W4qSg4NQn?=
 =?us-ascii?Q?+S/8Va72AhmrFueMaqWIYC02pjNVUXCg968kxQ26mWElmZlvFBUKwNfuMzaV?=
 =?us-ascii?Q?FD0QodgCuJL46SsOhVzkm461xU+KYqI/VynjO6n01Ryd4VJLALykw/OSdhmG?=
 =?us-ascii?Q?7qskEDRNadxLZLol48YKAQH1a7AMuSXLh3UTuuHLqX2H5DGDw/sUZrmNU/8g?=
 =?us-ascii?Q?yqFv9loX1FXVOfovE9BHiyIZfY5B5W+O2rhiqd/JDYF3/is7Z7owsooAC9K5?=
 =?us-ascii?Q?/IjC+qX8A44PrbP3Dq+JpW5jRF2BAEF1Gesy+JkzIP0GV4MJwagFmovDEn7d?=
 =?us-ascii?Q?rDCgx2H5zIzv89vxmSyUIlz7zQyvGQI6pbDBOD82FxgaCxl/U6FRXGz2wcm7?=
 =?us-ascii?Q?nv4yLjtAfFjH+MpYkQtGWI7lg3Mzy2Lc9QLdDSTlMRFClwRuD8YOI+dtmPOm?=
 =?us-ascii?Q?i34Yxxl5DR8Z21aSmNHE+Tfm9Q6z6R2jsXAcG28GXc9Rl0Id6hEnrUNCB02u?=
 =?us-ascii?Q?85vFvFotXHkVYB1wcd4uv9f/chHwa+lXToO1lewiuyI0APvbL4JXQCLe+EBy?=
 =?us-ascii?Q?ktyf9Nym9Rq7lyBjRrq5Pp31OcRFbwmLSlkCzvf1YP9eaFYXgXSugnXT3YIK?=
 =?us-ascii?Q?ji8Tz+bS+z5Bq46NQRUaqwPy0hNGor8K9vtolae7rpYCHfwULbvvcTjBUpiB?=
 =?us-ascii?Q?sA3qrk2ydZApHM15wcgWgIz2O1CLfeRJ8MVTTeuDcbGPLAk9oPl+YuoZhDWk?=
 =?us-ascii?Q?XU27oPVYRicCF6bIX4S67u+mRQkjZe7DxwuqSCEu/aROEaPPpbySV3k5pxGX?=
 =?us-ascii?Q?1FdwKXBwJI7KyzEO+AVGaARcRdLjR7WWE61Y0x9qrDsgYm04P/aEJV9B4z25?=
 =?us-ascii?Q?uoLTeXrf5gdvyFM57gG/BnNHDAK7TFJWDxDduoWAg7iB1wmLL53tYaz/vwjP?=
 =?us-ascii?Q?pYq6zIG3EucS3UHmIWY/U+Wp1EzSkpWfj+/weEdOshkTNvu5rHUhZBQ5BKkb?=
 =?us-ascii?Q?FRCnd+wV+mjc1T/0ALgfOH8why4idRy9sseXUG+8/M/3LWBohO07EnWbfvt0?=
 =?us-ascii?Q?xfmVZ+keMludVqtX79uUFyLwfJREMqz+nDGv912DVzWfj/GkFJUVKUa11YRt?=
 =?us-ascii?Q?gkg62isYwuJ1kA/tUfRzOnvgTc7fekYOarKikHqPRj2ShVnFepetnCE825LI?=
 =?us-ascii?Q?+AiCXyIH1YI8YsEtej4wD5aOhvdU8DXoQq45D1z0f32Ft91Z1hBXqBtsURh7?=
 =?us-ascii?Q?HoJ0YcPD/eyqhqyBGVebp5mmnpZp4Hv4Z4mlftZxLUiQayztwybK7SQJOnC+?=
 =?us-ascii?Q?pzY2t2LX/uubX/OKuelE5JnGJhhzzBdsygAF++G3SC29X2TTojecxUw44gx9?=
 =?us-ascii?Q?qPdEhnHbm5/KhrxBvJvlBv/StelsOvMgxbki2B0vi6pfypndd0HvDqJytZNW?=
 =?us-ascii?Q?ND6iBy/Kf7YXPlkTLkxEHpEtY1WzWNj2uxSqo95S06r6/O6HQL0s5g=3D=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB9335
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU2PEPF00028CFE.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: deecebaf-2e12-4d04-9667-08de1573c94b
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|35042699022|1800799024|36860700013|14060799003;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?haUCPuhTYRx8djwV+4ti2jT3mLOb17vt+Jz41T3MuReuMbYjg71lHJyUkSr8?=
 =?us-ascii?Q?9K/g6XZ4spE/3mamq8qdbc9MdRKZepDJUowTuDV3ptNerwhJ2cML62SqrFI6?=
 =?us-ascii?Q?pw05FaoBEND6D+Mu13pUE/czLMI76FknAGdlXvWJr73QQfLhj2arFTE63Wjt?=
 =?us-ascii?Q?j5urwkvHQhMO1bB7xSf6laO5aZyjr7Q6FlMIBK3OwH41nl8PsD3LGSqu0W2R?=
 =?us-ascii?Q?apEtdK9SoM2x0W3y+ZnKUlvKdhc7upzdJlfOglZ4v7Ru+OHyLdWiI+XSu3Qn?=
 =?us-ascii?Q?j/zRHwVNunTp2y0DI+J+4HYNbfOeCzvhWmiTcRPZGnIVnd5zW09CIzLWivn6?=
 =?us-ascii?Q?9Hjz8bnptClW3DxUXw38NpPPoqkKvgcrKqXMzlFHrbwzKvRA2IuXgb/ywmD+?=
 =?us-ascii?Q?OFmZOAQlEZX611GiOz3yEa+XWvN2a3gefI6+rLtPedSXSzTY0/kKly9/AlnG?=
 =?us-ascii?Q?83gGc/1+nfNeaVBgefsVV4vTb46yl2jzdcXEpNckCI1287gxniRMKBi+w7UD?=
 =?us-ascii?Q?48qhmNtaIbNJ4bIJasPsIPRbfTTbSrP2VHkfWl5GVaae1VfzjOc4nwKXSPGA?=
 =?us-ascii?Q?HDib6BndM1oxtseOIyucjtWLzhn0HiWbOf01uL5C/OTOWiugWeF/qJVU0mig?=
 =?us-ascii?Q?keg1+4Y0ze+wsxzN3Dg8xEKNIdGEBOSii4zUiKZ/8OQGbRr3NpyzY/D29bER?=
 =?us-ascii?Q?fEznIMPiWT7nzy047NcZYK2w5YtdAkKOD2Am6UWXutgX/we34qUFevIx3YR7?=
 =?us-ascii?Q?Q/C8Tiy/+rOtVAGKc+Jy8Kx2MgAVoHlr4OAw9fKunftWPTu30h9EZZgc73nH?=
 =?us-ascii?Q?b3QGAsGVfYqvqgcK/cfWWHrP+rvjX4oxAabbJiKHR0yYWNSl958l/K+PD95b?=
 =?us-ascii?Q?FcAb9HcQdaoZFaEiQ3P+jSbOchXvqlho++NDIhZgHBpS0vyzIQn8ybQKQ6be?=
 =?us-ascii?Q?JDhD2GjLu0PjSRn6hEZrU43FscAIzVozLp70uPkIp6rw03u15ZMZRzs4SUG+?=
 =?us-ascii?Q?NT2xnNz1LoZtmN2SHjFbJwnyR3LT7SPaqoo5vF3vgnF2GuedIamUfV4GMhhd?=
 =?us-ascii?Q?jPmao+hdkSyuxz2YDb63/vh/JOOu0AXzjytArD/JXgFBWPX0g86qm2JQNqva?=
 =?us-ascii?Q?0uH+CKCEBwWxJLum9yRIhDZpuOYzAZcMH35YWntrP43Ei5BajimKUegBcnjq?=
 =?us-ascii?Q?sxsAvgVfAEYQbxEIUV1F+SIstbZlAqHwAm0QxAZfpCpfrM70nOtIuoRCdoEZ?=
 =?us-ascii?Q?8b4msm4fx+gLUgO5LTXGMimJPszrRycO85oz3jDx5+3rPS91Ij7K4dtNmXo7?=
 =?us-ascii?Q?ufBzXXVM+yMPqc+sUwOkEpVPFxj39VMr3EK5G+dRAie4RgNkDgp1yB4sL7UY?=
 =?us-ascii?Q?EHF/V8PAInMo4wcxF7quKTSsyaqb4K4s4FM1Vo6naXrSS5DQomwi57lXhSnK?=
 =?us-ascii?Q?t1e422PuKF+WDN3Epay/YHjYTWJb0kNm0NJV9XxVpxlgKg28oBRuC7XfsdDW?=
 =?us-ascii?Q?TkgNmoEHsaTlUM+/KEkajeXBZLSYtMEq5rG82iO8wvqwv4rExu2gPaz+kryq?=
 =?us-ascii?Q?IpCOVaY8uBy6CshYbdBwtTMq4JkQHW7fgRq47x+N?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(35042699022)(1800799024)(36860700013)(14060799003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 16:14:12.8273 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f34a8574-51ff-49fd-4b73-08de1573de5d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028CFE.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7792
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

This patch series extends the Panthor driver with basic support for
Mali-G1 GPUs.

The v14 architecture introduces several hardware and register-level
changes compared to prior GPUs. This series adds the necessary
architecture-specific support infrastructure, power control and reset
handling for Mali-G1 GPUs.

Patch Breakdown:
[Patch 1-2]:  Refactor panthor_hw to introduce architecture-specific
              hooks and abstractions to support the v14 architecture.
              These patches introduce architecture-specific HW binding
              for function pointers.
[Patch 3-5]:  Adds basic L2 power on/off and soft reset support for the
              PWR_CONTROL block introduced in v14.
[Patch 6]:    Update MCU halt and warm boot operations to reflect the
              GLB_REQ.STATE changes in v14. This ensures that the MCU is
              properly halted and the correct operations are performed
              on warm boot depending on the FW version.
[Patch 7]:    Align endpoint_req with changes introduced in v14, where
              the register is widened to 64-bit and shifed down by
              4-bytes. This patch adds the necessary infrastructure to
              discern the correct endpoint_req register to use.
[Patch 8]:    Enables Mali-G1 support on Panthor by adding HW bindings
              for v14 architecture, product names and path to FW binary.

v3:
 * Updated include logic to enable static inline functions in
   panthor_hw.h for function pointers and feature checks.
 * Fixed missed replacement of CSF_IFACE_VERSION check with
   panthor_fw_has_glb_state() check.
 * Link to v2: https://lore.kernel.org/all/20251024202117.3241292-1-karunika.choo@arm.com/
v2:
 * Merged GPU_ID refactoring patch with the arch-specific panthor_hw
   binding patch (formerly PATCH 01/10 and PATCH 02/10).
 * Dropped panthor_hw feature bitmap patch in favor of functions that
   performs the relevant architecture version checks.
 * Fixed kernel test bot warnings.
 * Replaced function pointer accessor MACROs with static inline
   functions.
 * Refined power control logic, removed unnecessary checks and redundant
   stubs.
 * Replaced explicit CSG_IFACE_VERSION checks with functions describing
   the feature being checked for.
 * General readability improvements, more consistent error handling,
   behaviour clarifications, and formatting fixes.
 * Link to v1: https://lore.kernel.org/all/20251014094337.1009601-1-karunika.choo@arm.com/

Karunika Choo (8):
  drm/panthor: Add arch-specific panthor_hw binding
  drm/panthor: Add architecture-specific function operations
  drm/panthor: Introduce panthor_pwr API and power control framework
  drm/panthor: Implement L2 power on/off via PWR_CONTROL
  drm/panthor: Implement soft reset via PWR_CONTROL
  drm/panthor: Support GLB_REQ.STATE field for Mali-G1 GPUs
  drm/panthor: Support 64-bit endpoint_req register for Mali-G1
  drm/panthor: Add support for Mali-G1 GPUs

 drivers/gpu/drm/panthor/Makefile         |   1 +
 drivers/gpu/drm/panthor/panthor_device.c |  18 +-
 drivers/gpu/drm/panthor/panthor_device.h |   7 +
 drivers/gpu/drm/panthor/panthor_fw.c     | 131 +++++-
 drivers/gpu/drm/panthor/panthor_fw.h     |  32 +-
 drivers/gpu/drm/panthor/panthor_gpu.c    |  12 +-
 drivers/gpu/drm/panthor/panthor_gpu.h    |   1 +
 drivers/gpu/drm/panthor/panthor_hw.c     | 108 ++++-
 drivers/gpu/drm/panthor/panthor_hw.h     |  47 +-
 drivers/gpu/drm/panthor/panthor_pwr.c    | 548 +++++++++++++++++++++++
 drivers/gpu/drm/panthor/panthor_pwr.h    |  23 +
 drivers/gpu/drm/panthor/panthor_regs.h   |  79 ++++
 drivers/gpu/drm/panthor/panthor_sched.c  |  21 +-
 13 files changed, 987 insertions(+), 41 deletions(-)
 create mode 100644 drivers/gpu/drm/panthor/panthor_pwr.c
 create mode 100644 drivers/gpu/drm/panthor/panthor_pwr.h

--
2.49.0

