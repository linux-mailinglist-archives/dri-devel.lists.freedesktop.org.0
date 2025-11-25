Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C89BFC850B0
	for <lists+dri-devel@lfdr.de>; Tue, 25 Nov 2025 13:57:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AF2D10E3D5;
	Tue, 25 Nov 2025 12:57:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="et1yQDr7";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="et1yQDr7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11011033.outbound.protection.outlook.com [52.101.65.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67AD210E3D2
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 12:57:05 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=t5gPvopmEN7mubwt6x6OuTvJA2bE9nwiCvaEDSAie3jfeFkD4wO8BWaEytoO94uxfufgKW29iY2r8zCvDGHrUsRFE5sYqAQLf5dP9HBszpsQkxAhg7zOsgXozO2ByyNAtbkpnbqsapzSgn7cCk90vBcIuvmAnkpI9UggiWKWLDUb98cuseNtaHe/JdaVKDq3naeEYLlRCyDGskpj3+bIbS1HxLQTF46AZYUrupNR7gmcLjThFL84HZlqiKDhGtLN9GNEYswgEba522uLuJXpYjGdW/PLUBV2//U9T9y9ZgGCFh1/hqHKFUgwowoyueomwDD8ftXTVRSvQrMbDpMMZw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bgR0SC+p8wI26428jHeUamdY/MeXuFxxJ2aFgLLwMoo=;
 b=LHOZHxZKGlkf01jSDNigHOORHTbT8J+k+9lxN4izhM8vxupGmGNxtO6aajPues62p9muM7TE3Z+WX2cgbZZdhatE8KU3hLUr63j1CBhZD5fA5IRsAbIY9yfLMgZuugFwKXqsOQibEA8Fn7WiQYUCru9ZnFxdAwWxWBRHNIaaeODd1cCYP+ydcgnE99yvay0/VRXbwxX3QuY8Qw0SuWXNhD5m9fW6MDTQWoh9nKp5Qgz/KU5XubUbxcgPsWMTCCwZkGRXyCcbn2+sSQwN+Ouew2U91pPhIaBwx6XhlIMF7tcqh8+uxf3MxZFZzgRbzbAUubayR5DZmaiYAZ5eccfd6g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bgR0SC+p8wI26428jHeUamdY/MeXuFxxJ2aFgLLwMoo=;
 b=et1yQDr7h+zQvy2ocZxTXKKmrl05d3fiBzkla74jlZaPYRJqEwGoVpeJ4p9JKGMP2N3XhefJkxL7XRMQfjJ+S5cOUG+XVj49TxfAmbquI8AtmOIbvZHZNJ5fGE0YzlsVMQh077YRZgftwtSI0gwKprMlKCDrnBbkFeI5x5UBtD0=
Received: from AM0PR10CA0056.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:150::36)
 by AS1PR08MB7474.eurprd08.prod.outlook.com (2603:10a6:20b:4de::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.18; Tue, 25 Nov
 2025 12:56:58 +0000
Received: from AM3PEPF00009B9F.eurprd04.prod.outlook.com
 (2603:10a6:20b:150:cafe::c1) by AM0PR10CA0056.outlook.office365.com
 (2603:10a6:20b:150::36) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.18 via Frontend Transport; Tue,
 25 Nov 2025 12:56:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF00009B9F.mail.protection.outlook.com (10.167.16.24) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.7
 via Frontend Transport; Tue, 25 Nov 2025 12:56:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H3D2PfK1FghSSCqihvu3JAnhdSCcfz/Q0bsgZNzyjc3celOhFrt08xYCAQkrwmmaD1qEq5SyplDhm0BXptOLGoYO5zmEBqg19AxESohaQVyG7Bi7+3Fln26tMF7sNTZv1Ob5taczhBLot7V9pw0dUWVZ0vW0LSY2WtVDdn4v6Jn33c2qWCQAKnnmHHnVphohLqYoutCSghn0qtyczxqWOAxeDyTosxJcK/U8Kq8WkeJiKc6vPLq9PEE26slDFa7Wm8/m0hPtR2vyCKy2dE3sRcp/8yfB/GP+Gpx1fP7pGeMQmYYLcJJVf00VdlTz8qgU5ZU7QnOAtWon9vSwiPmXWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bgR0SC+p8wI26428jHeUamdY/MeXuFxxJ2aFgLLwMoo=;
 b=Mt3zjrqbpgbVHfxxNIamfoy9j5z/qGsHGgX5tH3co21UlNyOvlJM/fcdTcuf0p0fkQA9I0PSa1C8a+PjaFZFfAQkivBylF4UF1xw/6s6NReSsMu3AyIn/lhHWEeSZghczr+pfZwg14dBBvmQ10p7NB3oGQhzCXsfhh1HLDaTAfh+C/1tyy0GZpC+nr01wAiTleHExtAy39mqsOrWlixVsNtnr/z+XgJ58wn32JsHmUXauLFID6zqgAtcAR5QhPYk8OYSXQ2JZz7cU0wFdGGtmnuwFFqI8vm2h05fZ20DMjESOntWrfnbCI2KNWaOy0NABYgbV5nX8LYNYY4s6J1Ldg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bgR0SC+p8wI26428jHeUamdY/MeXuFxxJ2aFgLLwMoo=;
 b=et1yQDr7h+zQvy2ocZxTXKKmrl05d3fiBzkla74jlZaPYRJqEwGoVpeJ4p9JKGMP2N3XhefJkxL7XRMQfjJ+S5cOUG+XVj49TxfAmbquI8AtmOIbvZHZNJ5fGE0YzlsVMQh077YRZgftwtSI0gwKprMlKCDrnBbkFeI5x5UBtD0=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by DB3PR08MB8937.eurprd08.prod.outlook.com
 (2603:10a6:10:43c::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.18; Tue, 25 Nov
 2025 12:56:25 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%7]) with mapi id 15.20.9343.016; Tue, 25 Nov 2025
 12:56:25 +0000
From: Karunika Choo <karunika.choo@arm.com>
To: dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org
Subject: [PATCH v5 4/8] drm/panthor: Implement L2 power on/off via PWR_CONTROL
Date: Tue, 25 Nov 2025 12:55:44 +0000
Message-ID: <20251125125548.3282320-5-karunika.choo@arm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251125125548.3282320-1-karunika.choo@arm.com>
References: <20251125125548.3282320-1-karunika.choo@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0634.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:294::9) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|DB3PR08MB8937:EE_|AM3PEPF00009B9F:EE_|AS1PR08MB7474:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c53f8ba-7a3a-48e8-8f2e-08de2c221e39
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?w5zVp9EPTRxEn4R770efBbn0eV7me/PdZFt+av/c0XO+qZIKqfY7PPeA/mis?=
 =?us-ascii?Q?2prbHuvd6znu7ewPRMlFs63WcWg4dpux2Z4SXF4bGumeT5JYAjRDXT9XzfIt?=
 =?us-ascii?Q?d7q9Z5G8O6dbXaSfseCZph6NmNGxqivQsLoT8nRHKrIXS5QqASiGOD3Sw6yT?=
 =?us-ascii?Q?gAqG37+5bimiJIdIUD3R8nXF8xScJquKA6FgklxVJti5ZSb/PhrmfMqEhOiD?=
 =?us-ascii?Q?x6eBR/gubtmq/R4T3ms2NJ09k4jS1rsCqb3+mur9H/qLA1sFWEWWu2C+gkw2?=
 =?us-ascii?Q?k5xnrTH+g+ZRNnJdatCe0qspdyFmyUEsAt2Snywl2sh1wmVUrqfIdWRcjqjs?=
 =?us-ascii?Q?0MbMIUe2KsTKMYLHkzbs0KS9dHi/cLxnhrHdnJbixnzU8bZ78J0Vdf3T6X4M?=
 =?us-ascii?Q?JF+7nITT84RxtCTrnsmVbqmdy8phckaUltBl4Q7gDBo5g9YRXyWn9Xie8lpt?=
 =?us-ascii?Q?Wlis5yHnPyeWxsdEVAigI8doI41h7NKCnvHO0xY4fmF3FsJ/s4Ft/++FeVYt?=
 =?us-ascii?Q?ZoAT2bfwm79UCGRAZrzjslRJGTfqNo6VMPakCzfX3b1nMUEdLwlufGriJRYq?=
 =?us-ascii?Q?ad2Joa3ULF7gsucQFv+1ilxNDazDfhswANeRWR/wzTNpcXmcBmIUVNxdyxrj?=
 =?us-ascii?Q?9NJ4u7rHkNIFcODHfZdbvf2M5zd/J+bg+ZXEA4SGpy1b+mFgvWDD/VEBVUmi?=
 =?us-ascii?Q?p3w6znty8PW4dllJyqgv8FTn+0qac/EvknI60X9ZB6tVzZqPSuxuuIFcgAR9?=
 =?us-ascii?Q?0pkcaP9nLj4iLt8MHWaZLe0FKcKRgWV+t3MlqQzfODTUhqsbGUS4XoXpHGdX?=
 =?us-ascii?Q?meL9tqyncSWqAxu/rscOJUAl5t85trTsSgXOACCOscBoRS1b6mpDYfaT4+sJ?=
 =?us-ascii?Q?wZzNQsNnmE3tQeLYi8f5UzC7/dvd4RLwiJ3KZ+EMqrbRxi5wPXd1j21uH+KX?=
 =?us-ascii?Q?C0Qkf7b0eo/vu0t5sPxPkXLn7BYPo+yOmU87YzCijhGQ10IFpDrHC1yOo3oo?=
 =?us-ascii?Q?DGQQQlAOeKkhJiMJJY/33YNj5OpYH5A3ZrAdVIR5X+3Q1qjmiuyN6Qqvot2N?=
 =?us-ascii?Q?7ydw27wB9m317Pc34TT91pslEcmDzeJJcOyUcAh/nxdJK/dcAGyqa+VDlatf?=
 =?us-ascii?Q?gVf/KdE+RSQMuzMbru7sVkPdETgNuBMHPNxem+xRVnqWQ2HI/b1CqVqHfwWC?=
 =?us-ascii?Q?We4Jh/LG/yd05mJ818mIY3035DWuxj6ZmQXNGgG1X/RNjXcHseDmEdi+GzNg?=
 =?us-ascii?Q?OaGmUOO8kytYA1j9A6CZl78CGv8rzgDYEWQAjfdj7i++mUGV7kH4iKHmhOGE?=
 =?us-ascii?Q?hJsv9tJyEF1AzBWlEEbr1DFc24LxV/982EAym2nDSm8d6xIMg520STaUMgIB?=
 =?us-ascii?Q?wUZnwCS6c3bj/gHFZhFQgRc/pgMlR2ucmWD4k3LEZqFzECmoC3hhz36QeDD3?=
 =?us-ascii?Q?uCEWyz+U0GBuNFYhHyflUhaojxoeuVPP?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR08MB8937
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM3PEPF00009B9F.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 2f593609-53ef-44bf-ec90-08de2c220a4b
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026|35042699022|14060799003;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7Kbzc5oXcZ/gn48y6N37BaFvgqf9o+9qsYTEzVvNxSigKXatXk0jQVzdNSbH?=
 =?us-ascii?Q?fgYhx02ocgkz7Lpbu5Vl3k+GeQQBwi0oSrS0mS8aAlA7ftMOZX3XRAT0ytMo?=
 =?us-ascii?Q?6ObnVhSXpiFwUHsszX8xLyqhHRW9wTIt5V8CJa4+8vtTH2f2ufC4b0KJBP3B?=
 =?us-ascii?Q?3EP4Fn6zCOpAR+SsvR2qLavmlEGm9cgELhW+uoSasXXNSoE+oAkDrCCLGGH+?=
 =?us-ascii?Q?7LIg4dE48bZQ1Ys/bU46suGLhDG/YhQl72wsqXEYlyS//AtcKDEbsaQY8B8r?=
 =?us-ascii?Q?SJdIS6zsEnTk21Y4vSe6ILljav4rU01mpvBSlUe+hCtb/z7UYa3y338wA+Xr?=
 =?us-ascii?Q?/tAHWa9EC0qjMic0H6FIuyGGuuKZEfnfYaWRV4l5fUSUSiphdNUBgVDJ2rts?=
 =?us-ascii?Q?cHuDdHyujhZHAHMMrtVsEuS4qiSO/hsIIuRsgaP7Txqk3rajE1LExFQ182O1?=
 =?us-ascii?Q?tHk3PEjS/5G4OgmVwPdPxLj0UtkWdLgQUiRuTyW0X37wFXYM+0SdEE4kpWFD?=
 =?us-ascii?Q?pFe39MZk9tQhGgZSvLAjMFDvOo2SfhV3LbJ4SzotQpq0/SzUB9SpP5Xy3V0B?=
 =?us-ascii?Q?sWcu5O/SKOOC6e/FJg2oEEpNATgvONRCyY7i0Kx1GJnw4cQAaHHflObcnggc?=
 =?us-ascii?Q?Ui99Jx3Rjjq6yEqTWMoXdLwbzKd1xq2VFd2u6ozC0gnD9KhJTYi/1F8ZKxNe?=
 =?us-ascii?Q?i2VXRxz5ZyRERAJWkBwwSGD3pnsllvXyQevqGuNFJ8Mfhy8HNssj+LPAO3Is?=
 =?us-ascii?Q?C1vSvVj4umQtKx8UVamaZ519qq6XZCDLe/vs5GYYBv1a+yiI21k5wOo2WoVk?=
 =?us-ascii?Q?500Z8uDNa4tMtArwXb+BDTra8aPdL+LeZkbnPjmsOk2nL9luSQpDBew/JbZf?=
 =?us-ascii?Q?zrTQt22VrMQ+R2CJ1BTlZzBiWGq99cyNvxc1bv1Go1lTDIxuWGJnFn0f931E?=
 =?us-ascii?Q?3YlLlIeqDLrDdcCaKjXAPb3IOZpY1N+2BIzkFLub92kRvR/OAGcMshE+ypiB?=
 =?us-ascii?Q?Ms3ABYOxKgjsLNGeLAnckx5CWkGym4lkSsUM/F+MgmKH/eL2f761hyoSbGfG?=
 =?us-ascii?Q?/HOGBW9pqpf0VcwxYoltUqWYHvUVthHHvPA/n1VNRzGkAiAVt7olTZujdhdH?=
 =?us-ascii?Q?XAoC81YuYloCQLzqjvtwXtWM2PvVFy7M9ycKJ93G6tE7Jfow8T06SD60K/J9?=
 =?us-ascii?Q?prFSTt7GxM+CZFH3WoIJSZRip/D2R4rg3ERzlKWkerf73j/ietyF9BUZ5J9L?=
 =?us-ascii?Q?P3SztNm/vvXgCWyT6AHh3C2I/FBgT0/AophshUO8+f/l4bf8Ixh1QTs9qoRr?=
 =?us-ascii?Q?/lqKBdflwxBnb/38a9j0EhTt4SQ3QqCW8A3zSwNsdZJ4af28aYDMbxQUl5ZM?=
 =?us-ascii?Q?hNGnmHVhatylpLxquDZx0KfCks6qWa/O7y4AOFAOOgUT9sxrGvHjZ0V+UbDc?=
 =?us-ascii?Q?xyQ11DikPO5+JuZM3+qG9lD6JGYDDffhfURSOPti1E5zdIs1XYifiztBMrxm?=
 =?us-ascii?Q?k4IQAROYbbizOcnOFqNAxBwggOwyeYs3J73ilCv3aaZ0taqkZLJnNB2LetmL?=
 =?us-ascii?Q?lKtCzZo68ifTQjK1OoI=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026)(35042699022)(14060799003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2025 12:56:57.9848 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c53f8ba-7a3a-48e8-8f2e-08de2c221e39
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF00009B9F.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR08MB7474
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

This patch adds common helpers to issue power commands, poll
transitions, and validate domain state, then wires them into the L2
on/off paths.

The L2 power-on sequence now delegates control of the SHADER and TILER
domains to the MCU when allowed, while the L2 itself is never delegated.
On power-off, dependent domains beneath the L2 are checked, and if
necessary, retracted and powered down to maintain proper domain
ordering.

Reviewed-by: Steven Price <steven.price@arm.com>
Signed-off-by: Karunika Choo <karunika.choo@arm.com>
---
v4:
 * removed extra brackets.
 * Picked up R-b from Steve.
v2:
 * Updated GENMASK to GENMASK_U64 to address kernel test robot warnings
   for 32-bit systems.
 * Removed panthor_pwr_read_status() in favour of a simple gpu_read64()
   operation on the PWR_STATUS register.
 * Renamed panthor_pwr_info_show() to panthor_pwr_debug_info_show() for
   more clarity.
 * Added additional WARN_ON for an invalid domain when requesting power
   domain transition.
 * Made panthor_pwr_domain_transition()'s expected val logic more
   readable and clearer.
 * Wait on domain power transition instead of failing the operation.
 * Fixed inconsistent error return value vs kerneldoc.
 * Removed confusing drm_dbg in delegate_domain() in favor of a comment.
 * Add unwind to panthor_pwr_delegate_domains().
 * Moved child domain handling logic from panthor_pwr_l2_power_off()
   into panthor_pwr_domain_force_off().
 * Added additional clarification regarding delegation and retraction of
   power domains.
 * Minor formatting and readability changes and remove unnecessary
   checks.
---
 drivers/gpu/drm/panthor/panthor_pwr.c  | 378 +++++++++++++++++++++++++
 drivers/gpu/drm/panthor/panthor_pwr.h  |   4 +
 drivers/gpu/drm/panthor/panthor_regs.h |   1 +
 3 files changed, 383 insertions(+)

diff --git a/drivers/gpu/drm/panthor/panthor_pwr.c b/drivers/gpu/drm/panthor/panthor_pwr.c
index 66dc72b29116..6dff5daf77d2 100644
--- a/drivers/gpu/drm/panthor/panthor_pwr.c
+++ b/drivers/gpu/drm/panthor/panthor_pwr.c
@@ -24,6 +24,14 @@
 	 PWR_IRQ_COMMAND_NOT_ALLOWED | \
 	 PWR_IRQ_COMMAND_INVALID)

+#define PWR_ALL_CORES_MASK		GENMASK_U64(63, 0)
+
+#define PWR_DOMAIN_MAX_BITS		16
+
+#define PWR_TRANSITION_TIMEOUT_US	(2ULL * USEC_PER_SEC)
+
+#define PWR_RETRACT_TIMEOUT_US		(2ULL * USEC_PER_MSEC)
+
 /**
  * struct panthor_pwr - PWR_CONTROL block management data.
  */
@@ -60,6 +68,323 @@ static void panthor_pwr_irq_handler(struct panthor_device *ptdev, u32 status)
 }
 PANTHOR_IRQ_HANDLER(pwr, PWR, panthor_pwr_irq_handler);

+static void panthor_pwr_write_command(struct panthor_device *ptdev, u32 command, u64 args)
+{
+	if (args)
+		gpu_write64(ptdev, PWR_CMDARG, args);
+
+	gpu_write(ptdev, PWR_COMMAND, command);
+}
+
+static const char *get_domain_name(u8 domain)
+{
+	switch (domain) {
+	case PWR_COMMAND_DOMAIN_L2:
+		return "L2";
+	case PWR_COMMAND_DOMAIN_TILER:
+		return "Tiler";
+	case PWR_COMMAND_DOMAIN_SHADER:
+		return "Shader";
+	case PWR_COMMAND_DOMAIN_BASE:
+		return "Base";
+	case PWR_COMMAND_DOMAIN_STACK:
+		return "Stack";
+	}
+	return "Unknown";
+}
+
+static u32 get_domain_base(u8 domain)
+{
+	switch (domain) {
+	case PWR_COMMAND_DOMAIN_L2:
+		return PWR_L2_PRESENT;
+	case PWR_COMMAND_DOMAIN_TILER:
+		return PWR_TILER_PRESENT;
+	case PWR_COMMAND_DOMAIN_SHADER:
+		return PWR_SHADER_PRESENT;
+	case PWR_COMMAND_DOMAIN_BASE:
+		return PWR_BASE_PRESENT;
+	case PWR_COMMAND_DOMAIN_STACK:
+		return PWR_STACK_PRESENT;
+	}
+	return 0;
+}
+
+static u32 get_domain_ready_reg(u32 domain)
+{
+	return get_domain_base(domain) + (PWR_L2_READY - PWR_L2_PRESENT);
+}
+
+static u32 get_domain_pwrtrans_reg(u32 domain)
+{
+	return get_domain_base(domain) + (PWR_L2_PWRTRANS - PWR_L2_PRESENT);
+}
+
+static bool is_valid_domain(u32 domain)
+{
+	return get_domain_base(domain) != 0;
+}
+
+static bool has_rtu(struct panthor_device *ptdev)
+{
+	return ptdev->gpu_info.gpu_features & GPU_FEATURES_RAY_TRAVERSAL;
+}
+
+static u8 get_domain_subdomain(struct panthor_device *ptdev, u32 domain)
+{
+	if (domain == PWR_COMMAND_DOMAIN_SHADER && has_rtu(ptdev))
+		return PWR_COMMAND_SUBDOMAIN_RTU;
+
+	return 0;
+}
+
+static int panthor_pwr_domain_wait_transition(struct panthor_device *ptdev, u32 domain,
+					      u32 timeout_us)
+{
+	u32 pwrtrans_reg = get_domain_pwrtrans_reg(domain);
+	u64 val;
+	int ret = 0;
+
+	ret = gpu_read64_poll_timeout(ptdev, pwrtrans_reg, val, !(PWR_ALL_CORES_MASK & val), 100,
+				      timeout_us);
+	if (ret) {
+		drm_err(&ptdev->base, "%s domain power in transition, pwrtrans(0x%llx)",
+			get_domain_name(domain), val);
+		return ret;
+	}
+
+	return 0;
+}
+
+static void panthor_pwr_debug_info_show(struct panthor_device *ptdev)
+{
+	drm_info(&ptdev->base, "GPU_FEATURES:    0x%016llx", gpu_read64(ptdev, GPU_FEATURES));
+	drm_info(&ptdev->base, "PWR_STATUS:      0x%016llx", gpu_read64(ptdev, PWR_STATUS));
+	drm_info(&ptdev->base, "L2_PRESENT:      0x%016llx", gpu_read64(ptdev, PWR_L2_PRESENT));
+	drm_info(&ptdev->base, "L2_PWRTRANS:     0x%016llx", gpu_read64(ptdev, PWR_L2_PWRTRANS));
+	drm_info(&ptdev->base, "L2_READY:        0x%016llx", gpu_read64(ptdev, PWR_L2_READY));
+	drm_info(&ptdev->base, "TILER_PRESENT:   0x%016llx", gpu_read64(ptdev, PWR_TILER_PRESENT));
+	drm_info(&ptdev->base, "TILER_PWRTRANS:  0x%016llx", gpu_read64(ptdev, PWR_TILER_PWRTRANS));
+	drm_info(&ptdev->base, "TILER_READY:     0x%016llx", gpu_read64(ptdev, PWR_TILER_READY));
+	drm_info(&ptdev->base, "SHADER_PRESENT:  0x%016llx", gpu_read64(ptdev, PWR_SHADER_PRESENT));
+	drm_info(&ptdev->base, "SHADER_PWRTRANS: 0x%016llx", gpu_read64(ptdev, PWR_SHADER_PWRTRANS));
+	drm_info(&ptdev->base, "SHADER_READY:    0x%016llx", gpu_read64(ptdev, PWR_SHADER_READY));
+}
+
+static int panthor_pwr_domain_transition(struct panthor_device *ptdev, u32 cmd, u32 domain,
+					 u64 mask, u32 timeout_us)
+{
+	u32 ready_reg = get_domain_ready_reg(domain);
+	u32 pwr_cmd = PWR_COMMAND_DEF(cmd, domain, get_domain_subdomain(ptdev, domain));
+	u64 expected_val = 0;
+	u64 val;
+	int ret = 0;
+
+	if (drm_WARN_ON(&ptdev->base, !is_valid_domain(domain)))
+		return -EINVAL;
+
+	switch (cmd) {
+	case PWR_COMMAND_POWER_DOWN:
+		expected_val = 0;
+		break;
+	case PWR_COMMAND_POWER_UP:
+		expected_val = mask;
+		break;
+	default:
+		drm_err(&ptdev->base, "Invalid power domain transition command (0x%x)", cmd);
+		return -EINVAL;
+	}
+
+	ret = panthor_pwr_domain_wait_transition(ptdev, domain, timeout_us);
+	if (ret)
+		return ret;
+
+	/* domain already in target state, return early */
+	if ((gpu_read64(ptdev, ready_reg) & mask) == expected_val)
+		return 0;
+
+	panthor_pwr_write_command(ptdev, pwr_cmd, mask);
+
+	ret = gpu_read64_poll_timeout(ptdev, ready_reg, val, (mask & val) == expected_val, 100,
+				      timeout_us);
+	if (ret) {
+		drm_err(&ptdev->base,
+			"timeout waiting on %s power domain transition, cmd(0x%x), arg(0x%llx)",
+			get_domain_name(domain), pwr_cmd, mask);
+		panthor_pwr_debug_info_show(ptdev);
+		return ret;
+	}
+
+	return 0;
+}
+
+#define panthor_pwr_domain_power_off(__ptdev, __domain, __mask, __timeout_us)            \
+	panthor_pwr_domain_transition(__ptdev, PWR_COMMAND_POWER_DOWN, __domain, __mask, \
+				      __timeout_us)
+
+#define panthor_pwr_domain_power_on(__ptdev, __domain, __mask, __timeout_us) \
+	panthor_pwr_domain_transition(__ptdev, PWR_COMMAND_POWER_UP, __domain, __mask, __timeout_us)
+
+/**
+ * retract_domain() - Retract control of a domain from MCU
+ * @ptdev: Device.
+ * @domain: Domain to retract the control
+ *
+ * Retracting L2 domain is not expected since it won't be delegated.
+ *
+ * Return: 0 on success or retracted already.
+ *         -EPERM if domain is L2.
+ *         A negative error code otherwise.
+ */
+static int retract_domain(struct panthor_device *ptdev, u32 domain)
+{
+	const u32 pwr_cmd = PWR_COMMAND_DEF(PWR_COMMAND_RETRACT, domain, 0);
+	const u64 pwr_status = gpu_read64(ptdev, PWR_STATUS);
+	const u64 delegated_mask = PWR_STATUS_DOMAIN_DELEGATED(domain);
+	const u64 allow_mask = PWR_STATUS_DOMAIN_ALLOWED(domain);
+	u64 val;
+	int ret;
+
+	if (drm_WARN_ON(&ptdev->base, domain == PWR_COMMAND_DOMAIN_L2))
+		return -EPERM;
+
+	ret = gpu_read64_poll_timeout(ptdev, PWR_STATUS, val, !(PWR_STATUS_RETRACT_PENDING & val),
+				      0, PWR_RETRACT_TIMEOUT_US);
+	if (ret) {
+		drm_err(&ptdev->base, "%s domain retract pending", get_domain_name(domain));
+		return ret;
+	}
+
+	if (!(pwr_status & delegated_mask)) {
+		drm_dbg(&ptdev->base, "%s domain already retracted", get_domain_name(domain));
+		return 0;
+	}
+
+	panthor_pwr_write_command(ptdev, pwr_cmd, 0);
+
+	/*
+	 * On successful retraction
+	 * allow-flag will be set with delegated-flag being cleared.
+	 */
+	ret = gpu_read64_poll_timeout(ptdev, PWR_STATUS, val,
+				      ((delegated_mask | allow_mask) & val) == allow_mask, 10,
+				      PWR_TRANSITION_TIMEOUT_US);
+	if (ret) {
+		drm_err(&ptdev->base, "Retracting %s domain timeout, cmd(0x%x)",
+			get_domain_name(domain), pwr_cmd);
+		return ret;
+	}
+
+	return 0;
+}
+
+/**
+ * delegate_domain() - Delegate control of a domain to MCU
+ * @ptdev: Device.
+ * @domain: Domain to delegate the control
+ *
+ * Delegating L2 domain is prohibited.
+ *
+ * Return:
+ * *       0 on success or delegated already.
+ * *       -EPERM if domain is L2.
+ * *       A negative error code otherwise.
+ */
+static int delegate_domain(struct panthor_device *ptdev, u32 domain)
+{
+	const u32 pwr_cmd = PWR_COMMAND_DEF(PWR_COMMAND_DELEGATE, domain, 0);
+	const u64 pwr_status = gpu_read64(ptdev, PWR_STATUS);
+	const u64 allow_mask = PWR_STATUS_DOMAIN_ALLOWED(domain);
+	const u64 delegated_mask = PWR_STATUS_DOMAIN_DELEGATED(domain);
+	u64 val;
+	int ret;
+
+	if (drm_WARN_ON(&ptdev->base, domain == PWR_COMMAND_DOMAIN_L2))
+		return -EPERM;
+
+	/* Already delegated, exit early */
+	if (pwr_status & delegated_mask)
+		return 0;
+
+	/* Check if the command is allowed before delegating. */
+	if (!(pwr_status & allow_mask)) {
+		drm_warn(&ptdev->base, "Delegating %s domain not allowed", get_domain_name(domain));
+		return -EPERM;
+	}
+
+	ret = panthor_pwr_domain_wait_transition(ptdev, domain, PWR_TRANSITION_TIMEOUT_US);
+	if (ret)
+		return ret;
+
+	panthor_pwr_write_command(ptdev, pwr_cmd, 0);
+
+	/*
+	 * On successful delegation
+	 * allow-flag will be cleared with delegated-flag being set.
+	 */
+	ret = gpu_read64_poll_timeout(ptdev, PWR_STATUS, val,
+				      ((delegated_mask | allow_mask) & val) == delegated_mask,
+				      10, PWR_TRANSITION_TIMEOUT_US);
+	if (ret) {
+		drm_err(&ptdev->base, "Delegating %s domain timeout, cmd(0x%x)",
+			get_domain_name(domain), pwr_cmd);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int panthor_pwr_delegate_domains(struct panthor_device *ptdev)
+{
+	int ret;
+
+	if (!ptdev->pwr)
+		return 0;
+
+	ret = delegate_domain(ptdev, PWR_COMMAND_DOMAIN_SHADER);
+	if (ret)
+		return ret;
+
+	ret = delegate_domain(ptdev, PWR_COMMAND_DOMAIN_TILER);
+	if (ret)
+		goto err_retract_shader;
+
+	return 0;
+
+err_retract_shader:
+	retract_domain(ptdev, PWR_COMMAND_DOMAIN_SHADER);
+
+	return ret;
+}
+
+/**
+ * panthor_pwr_domain_force_off - Forcefully power down a domain.
+ * @ptdev: Device.
+ * @domain: Domain to forcefully power down.
+ *
+ * This function will attempt to retract and power off the requested power
+ * domain. However, if retraction fails, the operation is aborted. If power off
+ * fails, the domain will remain retracted and under the host control.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+static int panthor_pwr_domain_force_off(struct panthor_device *ptdev, u32 domain)
+{
+	const u64 domain_ready = gpu_read64(ptdev, get_domain_ready_reg(domain));
+	int ret;
+
+	/* Domain already powered down, early exit. */
+	if (!domain_ready)
+		return 0;
+
+	/* Domain has to be in host control to issue power off command. */
+	ret = retract_domain(ptdev, domain);
+	if (ret)
+		return ret;
+
+	return panthor_pwr_domain_power_off(ptdev, domain, domain_ready, PWR_TRANSITION_TIMEOUT_US);
+}
+
 void panthor_pwr_unplug(struct panthor_device *ptdev)
 {
 	unsigned long flags;
@@ -104,6 +429,59 @@ int panthor_pwr_init(struct panthor_device *ptdev)
 	return 0;
 }

+void panthor_pwr_l2_power_off(struct panthor_device *ptdev)
+{
+	const u64 l2_allow_mask = PWR_STATUS_DOMAIN_ALLOWED(PWR_COMMAND_DOMAIN_L2);
+	const u64 pwr_status = gpu_read64(ptdev, PWR_STATUS);
+
+	/* Abort if L2 power off constraints are not satisfied */
+	if (!(pwr_status & l2_allow_mask)) {
+		drm_warn(&ptdev->base, "Power off L2 domain not allowed");
+		return;
+	}
+
+	/* It is expected that when halting the MCU, it would power down its
+	 * delegated domains. However, an unresponsive or hung MCU may not do
+	 * so, which is why we need to check and retract the domains back into
+	 * host control to be powered down in the right order before powering
+	 * down the L2.
+	 */
+	if (panthor_pwr_domain_force_off(ptdev, PWR_COMMAND_DOMAIN_TILER))
+		return;
+
+	if (panthor_pwr_domain_force_off(ptdev, PWR_COMMAND_DOMAIN_SHADER))
+		return;
+
+	panthor_pwr_domain_power_off(ptdev, PWR_COMMAND_DOMAIN_L2, ptdev->gpu_info.l2_present,
+				     PWR_TRANSITION_TIMEOUT_US);
+}
+
+int panthor_pwr_l2_power_on(struct panthor_device *ptdev)
+{
+	const u32 pwr_status = gpu_read64(ptdev, PWR_STATUS);
+	const u32 l2_allow_mask = PWR_STATUS_DOMAIN_ALLOWED(PWR_COMMAND_DOMAIN_L2);
+	int ret;
+
+	if ((pwr_status & l2_allow_mask) == 0) {
+		drm_warn(&ptdev->base, "Power on L2 domain not allowed");
+		return -EPERM;
+	}
+
+	ret = panthor_pwr_domain_power_on(ptdev, PWR_COMMAND_DOMAIN_L2, ptdev->gpu_info.l2_present,
+					  PWR_TRANSITION_TIMEOUT_US);
+	if (ret)
+		return ret;
+
+	/* Delegate control of the shader and tiler power domains to the MCU as
+	 * it can better manage which shader/tiler cores need to be powered up
+	 * or can be powered down based on currently running jobs.
+	 *
+	 * If the shader and tiler domains are already delegated to the MCU,
+	 * this call would just return early.
+	 */
+	return panthor_pwr_delegate_domains(ptdev);
+}
+
 void panthor_pwr_suspend(struct panthor_device *ptdev)
 {
 	if (!ptdev->pwr)
diff --git a/drivers/gpu/drm/panthor/panthor_pwr.h b/drivers/gpu/drm/panthor/panthor_pwr.h
index b325e5b7eba3..3c834059a860 100644
--- a/drivers/gpu/drm/panthor/panthor_pwr.h
+++ b/drivers/gpu/drm/panthor/panthor_pwr.h
@@ -10,6 +10,10 @@ void panthor_pwr_unplug(struct panthor_device *ptdev);

 int panthor_pwr_init(struct panthor_device *ptdev);

+void panthor_pwr_l2_power_off(struct panthor_device *ptdev);
+
+int panthor_pwr_l2_power_on(struct panthor_device *ptdev);
+
 void panthor_pwr_suspend(struct panthor_device *ptdev);

 void panthor_pwr_resume(struct panthor_device *ptdev);
diff --git a/drivers/gpu/drm/panthor/panthor_regs.h b/drivers/gpu/drm/panthor/panthor_regs.h
index e47a89f24900..08bf06c452d6 100644
--- a/drivers/gpu/drm/panthor/panthor_regs.h
+++ b/drivers/gpu/drm/panthor/panthor_regs.h
@@ -74,6 +74,7 @@

 #define GPU_FEATURES					0x60
 #define   GPU_FEATURES_RAY_INTERSECTION			BIT(2)
+#define   GPU_FEATURES_RAY_TRAVERSAL			BIT(5)

 #define GPU_TIMESTAMP_OFFSET				0x88
 #define GPU_CYCLE_COUNT					0x90
--
2.49.0

