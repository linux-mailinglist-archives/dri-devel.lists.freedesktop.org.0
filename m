Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9B47A22D4A
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jan 2025 14:09:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC2E210E95B;
	Thu, 30 Jan 2025 13:09:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="MQdsK9pH";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="MQdsK9pH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2066.outbound.protection.outlook.com [40.107.105.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE3AF10E95B
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jan 2025 13:09:38 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=W/mYHHY8wOtRWTM3bCuAxJzmeSya5bdM9WSRFch8I59TWNr/uRSQ/1tKGax3lyhk+Ab51KYLO01h8KmaY8q3+NI2kX6DnfnWXvSo45x5+2LDsiLKEiqVBAVLpBrvVc52cPyt8QJWRMsPrHTsKd62WIf8SI5lQJIJIuenRxgr4vhle0Wh1w+7lJslD0vGdV3BSt+kOjrZEMn8NNHuKvNtMA77GN1bXxeDfiaW9Lzthk6Lo9oL3h+lBxDjlq1MzEm6T2VNoOnSkFKpu0qMv/gFJwutrFgpK949wkq4Mm6bp9yWppWEIElpfOgcQpXVslEniikSRnLHfAFZTu/fCB3MAg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YItMqBB3AFZY9z+AAWQmS9LrlWXXDu8EElut2eZSjfM=;
 b=VBRuTCEO9qkCAZEBtUy+QVeu2YPxhxA7U65spsCVfGOELLlUb0Jawa8EDmn50/iKAr6ht4Oad23sS/gbJzbGShifpt1LafP6oErS6mDA19SSVarbCIR0M15r3TNsrnREK+6vtL/l88nqjnU5haktFDc7+sqZ++OjIoSOccefsMmMm9MlHwVqk3W1eBXVwzbU6fhNfl+14xENwMuZdScwLpAuqGi8X+KZaSIxg6SBmZnzBGsGGf0bnIhQj13NkCbY1umu5+jxoj03cRL978K4vfdivJbaxv1/opHai1NxU4Ozvqc5Sgn/1rf3woPlHiAetHdyBawpQbAun+Z0TV/5tw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=0
 ltdi=1)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YItMqBB3AFZY9z+AAWQmS9LrlWXXDu8EElut2eZSjfM=;
 b=MQdsK9pH9F24jJwyVELdeH1JPCo5xohATn6LEhLoRMkS+/01lVOWYnRT4fjlfq+Lbp3+F8YK6QNnYm2gZoQAXoDDYACFtsWQVtmck993hAtZo/5d6yqm1Lp3pSiqN3Gn3Np0rRbjsT2UYx30qWRXSx4D61BA350gMM1eBIDRuTg=
Received: from DUZPR01CA0002.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c3::8) by VI0PR08MB10710.eurprd08.prod.outlook.com
 (2603:10a6:800:207::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.18; Thu, 30 Jan
 2025 13:09:29 +0000
Received: from DU2PEPF0001E9C1.eurprd03.prod.outlook.com
 (2603:10a6:10:3c3:cafe::9a) by DUZPR01CA0002.outlook.office365.com
 (2603:10a6:10:3c3::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.17 via Frontend Transport; Thu,
 30 Jan 2025 13:09:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU2PEPF0001E9C1.mail.protection.outlook.com (10.167.8.70) with
 Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.14 via
 Frontend Transport; Thu, 30 Jan 2025 13:09:28 +0000
Received: ("Tessian outbound d1e0abd198b0:v560");
 Thu, 30 Jan 2025 13:09:27 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: ca60226393ebda3c
X-TessianGatewayMetadata: 41C5iM3Q8zvqrV/s0MlO/0wnrlMX+Jatsbrho/D/C2GhtTE3Y+4Chb5pNS5mtMBvvXr+fM0Ibb/jz0djhK8I9YYwm8NBP9opIwyKPGt5YFOpWNp6jSJ1Hr5BckpjU75lsG71j6pmwTzQ9x/XzGrpFqmnnZDPtgdNa5DN/u++sRQ=
X-CR-MTA-TID: 64aa7808
Received: from L5f962119725b.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 731C6107-BEA4-4A6F-B553-063DD10D8C51.1; 
 Thu, 30 Jan 2025 13:09:19 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L5f962119725b.1 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 30 Jan 2025 13:09:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A2F/MXQOBnGUwhfmeXLXObpK9a5AwalCQ5i9Gy+ZhDtwoOcx/PEWwaOg+E1SsHV48iJ1RU5NsB2g6oqE3MUV4js9hDfKkOtOQiO2ecerwRyfE/j8xG5FqOYTh/fVU7ETmce2Hs8GNRAz2URfK1znwckSH5XFpnn6SqlyXL14QJtyjnnDg35BJHs3zT5PbY/2qh2OwoR92zzdKefzyLEFKL5K3JHXUinhuW8RLFrPqo1yFhL1xsHHmVSobGU5rCd4m0NmFO1KENYcl0rstlcbY+8dwb9x3kCYncyatcu9YO97zYCYD68EMk6NJRogJUrnr4KC5u2jPcGztVNtdNinyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YItMqBB3AFZY9z+AAWQmS9LrlWXXDu8EElut2eZSjfM=;
 b=LOQhso0IBUCf8C4lBimp6ffAl50lvlcsPsNS/XKn0WgMNgdveXJeSjmsGiQZ8TUzBxxhLHeFDrhttf2WpPgxEVaC3gHvmVOXWH/5LE0vCCvEZK6LLAe2FUZc/r3mqiVBjpfT94cTVidEpIzqxWNZHGTLI+7bO2zrKlUo/Dwx/EEmkcuSuVWsjAvmo4J6ucKHre17Cl+lnYeS5M4I8xkRY3+aUBkVnjbxFTlDldARk+WllOPtFxRHQuCvS8eZDdsIZveBlXvjquiyJoNpMTyM9+KI93tMEWPShv9ZNS/1Uzm2uvSfz/ZUrZfR+Lth+9ybvtei9B0rGuU+DmjpmcbMYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 172.205.89.229) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YItMqBB3AFZY9z+AAWQmS9LrlWXXDu8EElut2eZSjfM=;
 b=MQdsK9pH9F24jJwyVELdeH1JPCo5xohATn6LEhLoRMkS+/01lVOWYnRT4fjlfq+Lbp3+F8YK6QNnYm2gZoQAXoDDYACFtsWQVtmck993hAtZo/5d6yqm1Lp3pSiqN3Gn3Np0rRbjsT2UYx30qWRXSx4D61BA350gMM1eBIDRuTg=
Received: from DB7PR05CA0044.eurprd05.prod.outlook.com (2603:10a6:10:2e::21)
 by PA6PR08MB10593.eurprd08.prod.outlook.com (2603:10a6:102:3c8::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Thu, 30 Jan
 2025 13:09:13 +0000
Received: from DB5PEPF00014B89.eurprd02.prod.outlook.com
 (2603:10a6:10:2e:cafe::ea) by DB7PR05CA0044.outlook.office365.com
 (2603:10a6:10:2e::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.18 via Frontend Transport; Thu,
 30 Jan 2025 13:09:13 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 172.205.89.229)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=arm.com;
Received-SPF: Fail (protection.outlook.com: domain of arm.com does not
 designate 172.205.89.229 as permitted sender)
 receiver=protection.outlook.com; client-ip=172.205.89.229;
 helo=nebula.arm.com;
Received: from nebula.arm.com (172.205.89.229) by
 DB5PEPF00014B89.mail.protection.outlook.com (10.167.8.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Thu, 30 Jan 2025 13:09:13 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX05.Arm.com
 (10.240.25.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 30 Jan
 2025 13:09:05 +0000
Received: from AZ-NEU-EX06.Arm.com (10.240.25.134) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 30 Jan
 2025 13:09:04 +0000
Received: from e121164.cambridge.arm.com (10.2.10.32) by mail.arm.com
 (10.240.25.134) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 30 Jan 2025 13:09:03 +0000
From: Florent Tomasin <florent.tomasin@arm.com>
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Boris
 Brezillon" <boris.brezillon@collabora.com>, Steven Price
 <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey
 <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, "T . J . Mercier"
 <tjmercier@google.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Yong Wu
 <yong.wu@mediatek.com>
CC: <dmaengine@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-media@vger.kernel.org>, <linaro-mm-sig@lists.linaro.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <nd@arm.com>, Akash Goel <akash.goel@arm.com>, Florent Tomasin
 <florent.tomasin@arm.com>
Subject: [RFC PATCH 0/5] drm/panthor: Protected mode support for Mali CSF GPUs
Date: Thu, 30 Jan 2025 13:08:56 +0000
Message-ID: <cover.1738228114.git.florent.tomasin@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B89:EE_|PA6PR08MB10593:EE_|DU2PEPF0001E9C1:EE_|VI0PR08MB10710:EE_
X-MS-Office365-Filtering-Correlation-Id: df2a0bab-1a09-41c5-5ce8-08dd412f544c
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|1800799024|7416014|36860700013|376014|82310400026|921020|13003099007;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?xgibOeOPOwdEr8QJXRHf78g1HmeBgI0EsC/AzHf3IWY8T+DX1eOgLpyJLet6?=
 =?us-ascii?Q?7PTLSkG7i0QgfGfbtVONuJzG6huoExizKuVt23a7zT0GCwxqP8mg7T5pITVS?=
 =?us-ascii?Q?SJm8vcqNWP1+6bP+j4AQ9ntU9Sh8o55l4H/y/2aQLN/gDwAKu6B3Dk9WXs91?=
 =?us-ascii?Q?2OV8BaCo2Ehpm7Eu9LvSNnRZygJG/BGSRKnjoGdXKQYTDbBoZz9dEDylv+TM?=
 =?us-ascii?Q?7PwVYhC58QdPSWohJROc4/u7flfP1g0jc/jmpAh824VU4m301YYcWD1LG3HA?=
 =?us-ascii?Q?DfsU7GoG3riWMdUFvEh4S0yGB+T4eGS0CVFk31Jn6TQC1mdRmfCmk3onB/Du?=
 =?us-ascii?Q?j9S/OvNcA43DYlE8eG2Qk9pBez8/bOgNv/jaZuHsHv2LZEuxoWHuZamGYm/t?=
 =?us-ascii?Q?W6YxMC/Ib9wdcf9kpINFlvCBqTcW+TlIZ8LeLk9tBCSYfohH1dHsheKkHYPO?=
 =?us-ascii?Q?31ghd7QmpS33dNt7TThSm7SPbdkEWA/0p0MJMWX7ZJkpzm8H4Xk8cDAksgtc?=
 =?us-ascii?Q?MqrEvauaGSCsOi/5UHNzpYfmaNxwPOaG8q2cxZ1txdp1jAnjItGbtHX+PYEF?=
 =?us-ascii?Q?FgYDaODURyiWI+w2+QuVMHi/H2utL4dd5cqG13lXIm7qgCedXv4rQnhQ7pYM?=
 =?us-ascii?Q?bmL0l221QfqT9uKG3yfXRbn/TxA+5V5tuE4gaOgUiFNORd+SQ2YMLXIlEz6q?=
 =?us-ascii?Q?P5z9nU6DjjoZnZMBUyvBYogPxWwAq4j7KMZARikG0+h+Zyn0D+VlzGcgutv6?=
 =?us-ascii?Q?GTq/Pcu7hdxzqZEHXWRSMFLOhi5XOwXj4CRNJXB7qCBUTr3MAAF8dI2tELaz?=
 =?us-ascii?Q?WdJWGoG9DivoqRHqd8278afdVy1LefZnmMHyLPYgVfFcVUfjiILt93D4SxTK?=
 =?us-ascii?Q?TpFtdXlnWC0vV2NqOsow57T8xjWlP4gaTKSnD91oDVF6G9i1ihuOSwdZVtsj?=
 =?us-ascii?Q?LbbyjLjleCCwYx1LM4pYkXeBvxdDDZNIdwf2tSzrcf9qjBSp4iF1/6XuPuKh?=
 =?us-ascii?Q?YV0QNCS8gru75HODY6rFwSWto/vhLLllUVXYZumc0Oo0yArmYTctcCrTEI6B?=
 =?us-ascii?Q?fBsJIhygB7bQkDk+JLHxNpXj8CZWpa/XdWaWSWoTZvC4fvUl57mD1W2W8u5N?=
 =?us-ascii?Q?Rr7JTmU7AE8zC3XfnBLBLku8FL8x/AajuJpANEyTIfD0IOJFYKcrRF4VFq8i?=
 =?us-ascii?Q?HP2op5rUP9D/NoJTL69US7R3zxdVcaPKutW1G+T90SBQXLWJGxvUH+RIPRCj?=
 =?us-ascii?Q?sYCnxQNn9QOVpDfItcZkFQdhp4PXwJPvZVBdN7H5wd+1Ndx9vQUQb9+J+MUa?=
 =?us-ascii?Q?nlawo8QH2vECS23sgfaLGcsk77H/IOnTg0FPGkmsU9AkdEVwE/Gy3OX42zug?=
 =?us-ascii?Q?zfhq4z7tBqt2Et13nNXySYRbrpaYuSTBk66rW2ucwW+NFWPooW/982DWXgGW?=
 =?us-ascii?Q?yO4s9UZwsFFtAfl8wb78MCGfV2PHZvufx2sSbIfVUkwdn0efk8bR6w=3D=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:172.205.89.229; CTRY:IE; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:nebula.arm.com; PTR:InfoDomainNonexistent;
 CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(36860700013)(376014)(82310400026)(921020)(13003099007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR08MB10593
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:10:2e::21];
 domain=DB7PR05CA0044.eurprd05.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU2PEPF0001E9C1.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 90491689-a6d6-4550-a5f4-08dd412f4aca
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|14060799003|82310400026|35042699022|36860700013|921020|13003099007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+7tLdQwF9Dq/cYuhkQcl05VisiaUxpiFO2/z6EIuyFVIndm6pyzJBR+8wkro?=
 =?us-ascii?Q?/eF76BHeRq6/7MiQHx4qGUEupDZFjP0qixsXk3Reg9sCvtxmw1lIqHvn7rNA?=
 =?us-ascii?Q?WUG5TrL1wgxbwDnHa/fsr8nQ7Y20b3tpYNvnWzv/CSG1DyXbO3aHzSg4kTkw?=
 =?us-ascii?Q?Nxvi/71nW0o/UTA3x/LlAs8Fs5ZgxEFN9rGjp/7a56WJtwhY3uSoqRLTqkaA?=
 =?us-ascii?Q?dnXH3v/ik9cnkCnWMAdV9XeMCUh0Q2+4CQyP3rK32UHgljwVMKWIWjWEVO+9?=
 =?us-ascii?Q?9eaO7BDaj/yStdg7g17+kZT0elxO1uVs/N3NAuHX7InB6meeExgtwIeu1vZo?=
 =?us-ascii?Q?0EBKOEU03kjGHREh5vrkeB+9L5rJH0N2wsN1jamegh/XkTdoSzFOsilmL3sm?=
 =?us-ascii?Q?ZDUHbn9AU/mxigU/RfWt4ANN+wPn7zwRCUXHqmJTs3ieFONaHKOpEDdD+3tL?=
 =?us-ascii?Q?X5my/5CgcxLhbyuwvu5JqVoWqcIbyADmLXaw2nW42fZLZw2W4/Q4OnY3JGPd?=
 =?us-ascii?Q?Ag1P7UBXhrHEsqh/GPgnEGqhIUcBnXGgweTgbobGVGEmWAjBK3h2l8pxWOAv?=
 =?us-ascii?Q?FD/rCwFausb6iI/cpKQPjhSPBByv4b1+SwOhuFLNg4Os8hrIky0sHtwwLH0+?=
 =?us-ascii?Q?hc84uSkI/yw/yw0Pm45AE5loSBoYc3cyzYhsUe2zhwBrWWn43aAn1C5ZJtTF?=
 =?us-ascii?Q?pRWhroWut66RprSuNMarOsss7DHuzzT2GnidJv9HZ5cEw1teLEmTrm9h7DkV?=
 =?us-ascii?Q?kMVuhxCdDJOgJhTo/V8h/+EpL/h9jZsOmUrPHzU/MY/3SfT9A/OdxUe8VgtV?=
 =?us-ascii?Q?aC6Hys11aEpiVjDXnaYIxhYqqGYcbhxfb1F/BdcaKlAuqmX4Ixp5fNKggvGa?=
 =?us-ascii?Q?v50A5E+80KFzWdgEs463xKNlLF3iyJaPEshl1HMy1R03E7462ItfGxb9ys/4?=
 =?us-ascii?Q?QBfgj7YHpedafpOTFBdRbmUvSsEFrau5dLKpK9KFz/6f1ojNNUZg8BrlWx8K?=
 =?us-ascii?Q?0zNCQe0T+RpSSU0JZ/djW9/WXS/e2fYTCun5kbBJAvkHewEWjvqk7CFkOX71?=
 =?us-ascii?Q?jxhtMnoCzrc/d60xZn0kWlH7QzKUFeYQ92hVKwhXWZFs61AI8BBsfKqx4PJT?=
 =?us-ascii?Q?juo2bmdC9UerAuc8jExrTvLGAnoQRYbDPWkb4Y73ufDcL+T2VC4P7gyaPBAU?=
 =?us-ascii?Q?MDNJcBQPT5kF3mc8+vJTMeVqqFUuaZAxSj0jd2ZqBR2xTpz++5nzOwLchSJh?=
 =?us-ascii?Q?NgzoSMtBbDGW/sC/kh2dm+B9xI1z7K4k3y7Z4w0we9LBvwZo+b2TYwrAgrvq?=
 =?us-ascii?Q?0Z/+/2Rxc7POIxSVTut28qCZzeTH/En6o1Atbmb43TQdxswTHBs/grZQgeBp?=
 =?us-ascii?Q?R+IQc8GnO536mRevlS2eyYCNf3XTg0sA7HQcndw8nFLx1DFcdRLxjr1SJgd1?=
 =?us-ascii?Q?0mkpDFBHsYmmfcIbubKR6Z7zc6EMGG/TwQ7pK1dfeinYqHGDdQRgIQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:64aa7808-outbound-1.mta.getcheckrecipient.com; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(14060799003)(82310400026)(35042699022)(36860700013)(921020)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2025 13:09:28.6912 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: df2a0bab-1a09-41c5-5ce8-08dd412f544c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF0001E9C1.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB10710
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

Hi,

This is a patch series covering the support for protected mode execution in
Mali Panthor CSF kernel driver.

The Mali CSF GPUs come with the support for protected mode execution at the
HW level. This feature requires two main changes in the kernel driver:

1) Configure the GPU with a protected buffer. The system must provide a DMA
   heap from which the driver can allocate a protected buffer.
   It can be a carved-out memory or dynamically allocated protected memory region.
   Some system includes a trusted FW which is in charge of the protected memory.
   Since this problem is integration specific, the Mali Panthor CSF kernel
   driver must import the protected memory from a device specific exporter.

2) Handle enter and exit of the GPU HW from normal to protected mode of execution.
   FW sends a request for protected mode entry to the kernel driver.
   The acknowledgment of that request is a scheduling decision. Effectively,
   protected mode execution should not overrule normal mode of execution.
   A fair distribution of execution time will guaranty the overall performance
   of the device, including the UI (usually executing in normal mode),
   will not regress when a protected mode job is submitted by an application.


Background
----------

Current Mali Panthor CSF driver does not allow a user space application to
execute protected jobs on the GPU. This use case is quite common on end-user-device.
A user may want to watch a video or render content that is under a "Digital Right
Management" protection, or launch an application with user private data.

1) User-space:

   In order for an application to execute protected jobs on a Mali CSF GPU the
   user space application must submit jobs to the GPU within a "protected regions"
   (range of commands to execute in protected mode).

   Find here an example of a command buffer that contains protected commands:

```
          <--- Normal mode ---><--- Protected mode ---><--- Normal mode --->
   +-------------------------------------------------------------------------+
   | ... | CMD_0 | ... | CMD_N | PROT_REGION | CMD_N+1 | ... | CMD_N+M | ... |
   +-------------------------------------------------------------------------+
```

   The PROT_REGION command acts as a barrier to notify the HW of upcoming
   protected jobs. It also defines the number of commands to execute in protected
   mode.

   The Mesa definition of the opcode can be found here:

     https://gitlab.freedesktop.org/mesa/mesa/-/blob/main/src/panfrost/lib/genxml/v10.xml?ref_type=heads#L763

2) Kernel-space:

   When loading the FW image, the Kernel driver must also load the data section of
   CSF FW that comes from the protected memory, in order to allow FW to execute in
   protected mode.

   Important: this memory is not owned by any process. It is a GPU device level
              protected memory.

   In addition, when a CSG (group) is created, it must have a protected suspend buffer.
   This memory is allocated within the kernel but bound to a specific CSG that belongs
   to a process. The kernel owns this allocation and does not allow user space mapping.
   The format of the data in this buffer is only known by the FW and does not need to
   be shared with other entities. The purpose of this buffer is the same as the normal
   suspend buffer but for protected mode. FW will use it to suspend the execution of
   PROT_REGION before returning to normal mode of execution.


Design decisions
----------------

The Mali Panthor CSF kernel driver will allocate protected DMA buffers
using a global protected DMA heap. The name of the heap can vary on
the system and is integration specific. Therefore, the kernel driver
will retrieve it using the DTB entry: "protected-heap-name".

The Mali Panthor CSF kernel driver will handle enter/exit of protected
mode with a fair consideration of the job scheduling.

If the system integrator does not provide a protected DMA heap, the driver
will not allow any protected mode execution.


Patch series
------------

The series is based on:

  https://lore.kernel.org/lkml/20230911023038.30649-1-yong.wu@mediatek.com/#t

[PATCHES 1-2]:
  These patches were used for the development of the feature and are not
  initially thought to land in the Linux kernel. They are mostly relevant
  if someone wants to reproduce the environment of testing.

  Note: Please, raise interest if you think those patches have value in
        the Linux kernel.

  * dt-bindings: dma: Add CMA Heap bindings
  * cma-heap: Allow registration of custom cma heaps

[PATCHES 3-4]:
  These patches introduce the Mali Panthor CSF driver DTB binding to pass
  the protected DMA Heap name and the handling of the protected DMA memory
  allocations in the driver.

  Note: The registration of the protected DMA buffers is done via GEM prime.
  The direct call to the registration function, may seems controversial and
  I would appreciate feedback on that matter.

  * dt-bindings: gpu: Add protected heap name to Mali Valhall CSF binding
  * drm/panthor: Add support for protected memory allocation in panthor

[PATCH 5]:
  This patch implements the logic to handle enter/exit of the GPU protected
  mode in Panthor CSF driver.

  Note: to prevent scheduler priority inversion, only a single CSG is allowed
        to execute while in protected mode. It must be the top priority one.

  * drm/panthor: Add support for entering and exiting protected mode

Testing
-------

1) Platform and development environment

   Any platform containing a Mali CSF type of GPU and a protected memory allocator
   that is based on DMA Heap can be used. For example, it can be a physical platform
   or a simulator such as Arm Total Compute FVPs platforms. Reference to the latter:

     https://developer.arm.com/Tools%20and%20Software/Fixed%20Virtual%20Platforms/Total%20Compute%20FVPs

   To ease the development of the feature, a carved-out protected memory heap was
   defined and managed using a modified version of the CMA heap driver.

2) Protected job submission:

   A protected mode job can be created in Mesa following this approach:

```
diff --git a/src/gallium/drivers/panfrost/pan_csf.c b/src/gallium/drivers/panfrost/pan_csf.c
index da6ce875f86..13d54abf5a1 100644
--- a/src/gallium/drivers/panfrost/pan_csf.c
+++ b/src/gallium/drivers/panfrost/pan_csf.c
@@ -803,8 +803,25 @@ GENX(csf_emit_fragment_job)(struct panfrost_batch *batch,
       }
    }

+   if (protected_cmd) {
+      /* Number of commands to execute in protected mode in bytes.
+       * The run fragment and wait commands. */
+      unsigned const size = 2 * sizeof(u64);
+
+      /* Wait for all previous commands to complete before evaluating
+       * the protected commands. */
+      cs_wait_slots(b, SB_ALL_MASK, false);
+      cs_prot_region(b, size);
+   }
+
    /* Run the fragment job and wait */
    cs_run_fragment(b, false, MALI_TILE_RENDER_ORDER_Z_ORDER, false);
+
+   /* Wait for all protected commands to complete before evaluating
+    * the normal mode commands. */
+   if (protected_cmd)
+      cs_wait_slots(b, SB_ALL_MASK, false);
+
    cs_wait_slot(b, 2, false);

    /* Gather freed heap chunks and add them to the heap context free list
```


Constraints
-----------

At the time of developing the feature, Linux kernel does not have a generic
way of implementing protected DMA heaps. The patch series relies on previous
work to expose the DMA heap API to the kernel drivers.

The Mali CSF GPU requires device level allocated protected memory, which do
not belong to a process. The current Linux implementation of DMA heap only
allows a user space program to allocate from such heap. Having the ability
to allocate this memory at the kernel level via the DMA heap API would allow
support for protected mode on Mali CSF GPUs.


Conclusion
----------

This patch series aims to initiate the discussion around handling of protected
mode in Mali CSG GPU and highlights constraints found during the development
of the feature.

Some Mesa changes are required to construct a protected mode job in user space,
which can be submitted to the GPU.

Some of the changes may seems controversial and we would appreciate getting
opinion from the community.


Regards,

Florent Tomasin (5):
  dt-bindings: dma: Add CMA Heap bindings
  cma-heap: Allow registration of custom cma heaps
  dt-bindings: gpu: Add protected heap name to Mali Valhall CSF binding
  drm/panthor: Add support for protected memory allocation in panthor
  drm/panthor: Add support for entering and exiting protected mode

 .../devicetree/bindings/dma/linux,cma.yml     |  43 ++++++
 .../bindings/gpu/arm,mali-valhall-csf.yaml    |   6 +
 drivers/dma-buf/heaps/cma_heap.c              | 120 +++++++++++------
 drivers/gpu/drm/panthor/Kconfig               |   1 +
 drivers/gpu/drm/panthor/panthor_device.c      |  22 +++-
 drivers/gpu/drm/panthor/panthor_device.h      |  10 ++
 drivers/gpu/drm/panthor/panthor_fw.c          |  46 ++++++-
 drivers/gpu/drm/panthor/panthor_fw.h          |   2 +
 drivers/gpu/drm/panthor/panthor_gem.c         |  49 ++++++-
 drivers/gpu/drm/panthor/panthor_gem.h         |  16 ++-
 drivers/gpu/drm/panthor/panthor_heap.c        |   2 +
 drivers/gpu/drm/panthor/panthor_sched.c       | 124 ++++++++++++++++--
 12 files changed, 382 insertions(+), 59 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/dma/linux,cma.yml

--
2.34.1

