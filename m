Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B736CBDA49
	for <lists+dri-devel@lfdr.de>; Mon, 15 Dec 2025 12:56:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 918E610E461;
	Mon, 15 Dec 2025 11:56:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="Ig0APbgM";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Ig0APbgM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11011019.outbound.protection.outlook.com [52.101.70.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C153910E460
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 11:56:21 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Uy65okhjinzxsQ4Emsh0ph9cIPZRuU9b3C15XzjVLq5BhkK6jHpojC0cwmMWhS0r7psW9AkskTYH7vzfhOvAoANrHahJPvN1of8KbJEO5//Mq7hmiBSOoHWtZA1UMpESS+qGldoH19lP05jWLj0WL1/dIebkHaK0mrYSQGTBrGdx+cNA3M7/gO/3UFGuqyfWJzy56kWkoYO3LA5I41bOM/1ygYhOLchvzoGqZBsHF91Vxv/2QG+InAUl1NRm16ua0kaynucfK2djw32ZmivPqvgK8Jp76CMWztqWZfwt8JpsY8iTZShHrZ+BFirW/mmhm490ysHVdOIjdsmE0/1mHQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=08e6JFnrRF/yk4FlfXaCh9OKOAvAzjy5mqEPDcsUi60=;
 b=qtlaLiXKotduf9on/AFT6L8ZCiFuKoDZ5P3joR0ovyl6l0Wvb509Kxn0xEK25WOP2zRaWzjNa2zSHunbPSg59V3oR9Rf0U6hy2XbvkNjwguSY2J9GF7R+mAtbO3NEpRxACZT4sy4iP8ILjJXXwA9l6LJJ+Y6fxSNtrXLdogfjQkpqA+SVG6Uyc4JM70+McyZzzYUcu6a7iMeOiiAPnXx/1QXkMpC1xMukRCu9xfM4g7x/QZeL0PqkOwGgzScNnBrZ9Enk87ugJSOEC9cH4Px4rA8t1ppS9fdpkwt134K2AXIdvSGGVl02+8dFu8bNciRpq3qPj035DITyNrqHqH4uQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=collabora.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=08e6JFnrRF/yk4FlfXaCh9OKOAvAzjy5mqEPDcsUi60=;
 b=Ig0APbgMDSDmDGXdx/vY/wt7sGWSgTfNuLgCkev5I/5qx6Qzy+mWW0vZzzWk74iXV36meGzMIp0pxGyO+WNRd/aqOvE3Oi5tEnmCInkIFp9v4fh7Lw00klFhl+LVDsM99nVfNEekavqJWltEHF6/KlRCwKjHq5CRvXlW7gy6xpc=
Received: from CWLP265CA0436.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1d7::6)
 by VI1PR08MB5358.eurprd08.prod.outlook.com (2603:10a6:803:13c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 11:56:17 +0000
Received: from AM3PEPF0000A792.eurprd04.prod.outlook.com
 (2603:10a6:400:1d7:cafe::62) by CWLP265CA0436.outlook.office365.com
 (2603:10a6:400:1d7::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.13 via Frontend Transport; Mon,
 15 Dec 2025 11:55:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF0000A792.mail.protection.outlook.com (10.167.16.121) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.6
 via Frontend Transport; Mon, 15 Dec 2025 11:56:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xp/ld/mOgRv3sf5rKd37UyKARj6o1iP2LKTuVlyfbbjzo/+UJG+5O+MNgPNJ9kr5qSnG3/KNH3qTAp/65DMaXvXoGp3V5d1Rby9tV+h7EKY3E9Ej1eFc12/RCm6NKUeM8hHzahg/edeqmb7L+1ug2DYTg3hdMSciyEh5ifTyNlm63vim2/COJFstKC/Nz11giKgRXuQTeGT/CiVIZyJLI3eCXQBY4aNsr5XwIbPzCJUiDAIvNkbEjxfaptoN1Kb1TYgGguAodpL5vC+FMwCLbOcsW2auk/i367ZhA8B48qDPNOcTemLBo4bIjn6TnvX2cUCFjHptp3NKY35h20G/RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=08e6JFnrRF/yk4FlfXaCh9OKOAvAzjy5mqEPDcsUi60=;
 b=kF/Ii4ucF+3a10xUR6MuS/788iv42NeNlHtcjcK0OXd6Y4PIYbmgl+vuqlEL+x5k1aXX4MNaseuCfNhJUt5egnjStyb3yHhIHAKBujFBxkxIhJ8sSyLTs7/UU9XfdPeORw1DGWEmkNIAtkXSn777icuQyuu+7acES0P+R4xYSKsTTeTCHxdvjBtPo4bnj8BWKGkfqPl2jO0M9Mf7MtNvKBHfud3xC/BL2a518cnlmr6X+IVsPXxYTZG4pLluquxF8F+UNlunrqpXqpHErxldeQEIE8FOeS7+VQLtoMo13wXJjlHlEfKhI1IBiGhWVoZ1djQzgyHYkM4BBbHAEga+zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=08e6JFnrRF/yk4FlfXaCh9OKOAvAzjy5mqEPDcsUi60=;
 b=Ig0APbgMDSDmDGXdx/vY/wt7sGWSgTfNuLgCkev5I/5qx6Qzy+mWW0vZzzWk74iXV36meGzMIp0pxGyO+WNRd/aqOvE3Oi5tEnmCInkIFp9v4fh7Lw00klFhl+LVDsM99nVfNEekavqJWltEHF6/KlRCwKjHq5CRvXlW7gy6xpc=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB6820.eurprd08.prod.outlook.com (2603:10a6:20b:30f::8)
 by VI1PR08MB5312.eurprd08.prod.outlook.com (2603:10a6:803:139::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 11:55:15 +0000
Received: from AM9PR08MB6820.eurprd08.prod.outlook.com
 ([fe80::a89a:b887:8053:a1fb]) by AM9PR08MB6820.eurprd08.prod.outlook.com
 ([fe80::a89a:b887:8053:a1fb%6]) with mapi id 15.20.9412.011; Mon, 15 Dec 2025
 11:55:14 +0000
From: Lukas Zapolskas <lukas.zapolskas@arm.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: nd@arm.com, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Lukas Zapolskas <lukas.zapolskas@arm.com>
Subject: [PATCH v1 4/5] drm/panthor: Propagate VM-level faults to groups
Date: Mon, 15 Dec 2025 11:54:56 +0000
Message-Id: <20251215115457.2137485-5-lukas.zapolskas@arm.com>
X-Mailer: git-send-email 2.33.0.dirty
In-Reply-To: <20251215115457.2137485-1-lukas.zapolskas@arm.com>
References: <20251215115457.2137485-1-lukas.zapolskas@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0323.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:390::11) To AM9PR08MB6820.eurprd08.prod.outlook.com
 (2603:10a6:20b:30f::8)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM9PR08MB6820:EE_|VI1PR08MB5312:EE_|AM3PEPF0000A792:EE_|VI1PR08MB5358:EE_
X-MS-Office365-Filtering-Correlation-Id: 2bc95a08-5374-4c67-243b-08de3bd0f45c
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?jJQOOSOhDj4T+olj2s/Pln5nJM9fBjPOi8HiFGqz4hGpZ46AIzkOPlU9l/Vp?=
 =?us-ascii?Q?H7iMmpeeji2Jt64fhkVHms2c87IxoWVGnD5mBjMuMzc5eHgWOl/hzl+iQI8A?=
 =?us-ascii?Q?E4V6HsKX7Gyh2ch1DS2m2Dq4/sN9SJXbuBZpASHNUOy/i7fgvxV8ixw/12n0?=
 =?us-ascii?Q?ylOjZzMM5L91UCYZxtRRWqSpOFmgoSEZfsfX9k1Yw6Ba9zp+GQLqKHqLKNGK?=
 =?us-ascii?Q?Nx67PBc1CfwjC0Z9ggaBCmVSvPaJ3uGntOTrk/+UPfDQdaBOtUIMBzbcdO1F?=
 =?us-ascii?Q?OS4YxXj5ykAmSW03xve6LBO5552Gr3ydTarZWUvZkSxnFivinNXpI3eMZLGj?=
 =?us-ascii?Q?yCrxiW5tAdA1ic/6+oe4adjpiQgpxFP6FKBuDBtmMxhmcSYfzO2ZsDKMJDB2?=
 =?us-ascii?Q?SMLr64fCm91NcWL++HOyTygY346+31LChIRl1elGfNTd97v7vEJ/Pl80QS62?=
 =?us-ascii?Q?Opz1eEWyMLJz32GixiyW/q+mvvpA2rlhTFkomOfA9U+h4rtx3E6G/NlKRYS2?=
 =?us-ascii?Q?mmzTRNrI2nCqQQ5IcVU+mvMNfIWEdUCdGvtH0kjKvOj0kT85Qd6D6vVJ6m3y?=
 =?us-ascii?Q?CD5IPjRYZW68u5bA3CywTI5vKaxH3++FuKOq7tS+jLX98RsyAsqiz8cwqO15?=
 =?us-ascii?Q?ttcKWUOdFT3JI2JfRkBEG2l+e7ZH1ZgqvZKUydeLvTuJ9sDIuaQywQlT7/B7?=
 =?us-ascii?Q?RypWW76px+ULTHDvrv+qn+7kovA/JEqdZkTSvI3quM0i9OfqxxsBQFz1HRx2?=
 =?us-ascii?Q?gvjYfXfLgHBI8o2m+ta2nFsY5ProASLa5c1LtaDt1c3d5mIuSCrxptTr3IFR?=
 =?us-ascii?Q?2SG9aBYa8FhppiqOHkASKFFPMZPH6b2Qtau9xYowvo3DBF1GdLcOkx9tqYMF?=
 =?us-ascii?Q?b2m3EFzYRFRTo//wd8UPS/dfiBMTwdlZ4vP3MJc36DARy0Pjt+S9pGnNehg4?=
 =?us-ascii?Q?bPCyWMwFLd3+5bb2iQGE2dYlL+fuDK9Gp24QnK/uujbVxlJagdKYuQ5oRX17?=
 =?us-ascii?Q?DCopmx6c1Aus534VbKnsNlpLI7P/O2KIyFmjPxKqzfCIW5h1I+yUAL4ttwzq?=
 =?us-ascii?Q?hWluq2bj1Ef3GUg7RgWqTMBxr14PWguH5prMdV5qiNvOkgl4nsixZl9KgSTz?=
 =?us-ascii?Q?aaNifB1FmrFt65k6OPRnJRr+eX/dHqOamwMHxf+Zsbvd+LheOkeAe+1CXrbd?=
 =?us-ascii?Q?4uH3SjHXbVVNXJmxZ3ytM6YPsXxYJJlzQQQugTuvja+zp202VFdFYveQdy5f?=
 =?us-ascii?Q?RS/bj7hKbN0Vbj2wmCE79Ib6cGzDTbQw49RX/NKFFKKpBiIs0Ur2lvPtNtZF?=
 =?us-ascii?Q?zDloJ4/0Hju982pon7DE825bCWg1MZd61CD1jD7ojURB2nFCyYFzEON1BFiL?=
 =?us-ascii?Q?7zcAuChcVbDMzjdWNRnQuzcYd/NiFNFU3+4G5T6Q6GNbK+msNc/7/tZS0jvv?=
 =?us-ascii?Q?nN+YfUdiV7lwJzCQ5EotmBKXlwPON++y?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM9PR08MB6820.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5312
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM3PEPF0000A792.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: dd668026-0bb2-447c-48a2-08de3bd0cf26
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|14060799003|376014|1800799024|82310400026|35042699022;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Hr1lM3cQmvTg/47SuoVMFsnOiY0vuen5IaiIqR149fIzLmvZhQ/wavjZ/Wrw?=
 =?us-ascii?Q?bzepBriycNvoxQfu6F4xCqi6Y1VcxOExKv1eTwtVxFOebSwCyT41WP8OpI21?=
 =?us-ascii?Q?jQGLLuY+oBWsHEyBX5FiY6PnbGUmFM4kuiPv5/NxXXW0ln2TYRkCq/JL+wlA?=
 =?us-ascii?Q?sH8uYLv+XWcBc3gcqcXUwwWhFWAY+W9h6z98OfD+PbSwLwEo9cp1GXk84gGf?=
 =?us-ascii?Q?VLZCfWttbOhZ1J8jH1rZMuegJ/x5tbZWWmxVXwz1TF8XiEt/vdgOLBWHqxaX?=
 =?us-ascii?Q?udEA+2m3KOn7+RSaltOJeQyMC8w6Ud4WHytMggZM7h0zPC4EsL64wVfdmzUH?=
 =?us-ascii?Q?ovZReoazv/JL1vurpiY5QFeAmuO8zJA0subCM7u+lxbbJkrtQc06ckqMrsdt?=
 =?us-ascii?Q?uPkmmgIgkqvPUXdE7BvLP0qAC7J73o0Rhs01In4fUe3Q8Qevi5IOGGROGQ3U?=
 =?us-ascii?Q?MM7MWTUqQitbwy047zt9bnnBZSQTMZyUuAfjAYVipHn7juOkwcUvm7pgnWfZ?=
 =?us-ascii?Q?ZrfKzDdb9vS+lHpkUWncbzeY9f1MDHYBlV64/YuKj1uRvUTEJSJV54e7Nwll?=
 =?us-ascii?Q?aOQqvlZwGeFA2D1r729BdK/kSLD75bCLVwjV2m/wtXfGpiKlJiyZ2dmgFBIz?=
 =?us-ascii?Q?Itw/7rNL9+57yZbkdebq6Wtl02QBH2KJuCtyp6PfIcMFhW+QyGzHzjyMXjqD?=
 =?us-ascii?Q?fMy4S3u6qMzElSqXpwp0J1IZbp4rgVTx2DR/6xLnb+FOqIWzgdSxPVphTOfK?=
 =?us-ascii?Q?paNpO6JH2+P2bPzZyfmAMclZFfNy6YSeP8tjzKJ/TvuqVfYZWw2iiONYrkmq?=
 =?us-ascii?Q?JGEwxKDQzEf4sip4c759Wsh1K9h4jc9FC83Lq6kLGk9VDFaNhr+n+W7w3wMo?=
 =?us-ascii?Q?Xrk6Vge4jV3OqUpT8nLGmV+UQdTh/TGunBPBf3xJ9ELG0WViYdVdC6UTxRHk?=
 =?us-ascii?Q?LtRiAfSDjpAm0zPTn2ApmMf3meTa4+yk0rGoVgpggBzJU+XvNF9ON5gZJWR6?=
 =?us-ascii?Q?UbuiBtkjP3Iz+PVCVASKZI1GuK35WkT56kR4SgkTgB5N0W8SlpnvqnbvA8Lw?=
 =?us-ascii?Q?yD8zlgDB3qrBp81sHlgjdmKmAr4M9i1kLW6rufjsR5iTyd+/y7AG8Q4Ja3f3?=
 =?us-ascii?Q?5NaHQqyjsBLJrrVW35Zxtwd+XFEXOSUDGSEdxZ4rxi38yiQh6f9pNg0hbUu2?=
 =?us-ascii?Q?JSJtT0EvNNmZ+GXw4/6cFFQix/KHjoZoWoqGfItrLtUDDn8O60Wz8LkVEXdB?=
 =?us-ascii?Q?NvUVA/SU2Js55GgicyzO/ncc+cH9VZb2TJJm0AvtvnBfPWJv9hZfYI1wWHyV?=
 =?us-ascii?Q?RQiB3lWVXxU52nGnC38pV0yJBX3NvXwzYdFDLAfJBs60HncuQanB8dbMLE+E?=
 =?us-ascii?Q?Ieu88nTplWQ+g4/HWcADFJ//cpksejeAdYSFlC8eX7YwLXQyrT/JJTMp3+/U?=
 =?us-ascii?Q?BbCRDDh6rWnUGVeOCEkGkwX9cYrjT/2cYdV00pC6gxLycPlSpWG4LIPE/+5s?=
 =?us-ascii?Q?CsP6UTl0bYGS2++k7SOvaz6cD9lNllqMkOUrG8QYbpIGaIScdPgzI/IuNdPX?=
 =?us-ascii?Q?mvD9xJ/pe6vn58bxeCo=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(14060799003)(376014)(1800799024)(82310400026)(35042699022);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 11:56:17.1119 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bc95a08-5374-4c67-243b-08de3bd0f45c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF0000A792.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5358
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

Receiving an MMU fault currently disables the AS, so each of the groups
is marked with the appropriate faults. Since no further submissions
can occur on a fatal fault for that group, the fault information
does not have to be cleared until the group is terminated.

Signed-off-by: Lukas Zapolskas <lukas.zapolskas@arm.com>
---
 drivers/gpu/drm/panthor/panthor_mmu.c   |  8 ++++++++
 drivers/gpu/drm/panthor/panthor_mmu.h   |  2 ++
 drivers/gpu/drm/panthor/panthor_sched.c | 13 +++++++++++++
 3 files changed, 23 insertions(+)

diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
index 10a7418eecda..9e78b0509f1a 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.c
+++ b/drivers/gpu/drm/panthor/panthor_mmu.c
@@ -2895,3 +2895,11 @@ void panthor_mmu_pt_cache_fini(void)
 {
 	kmem_cache_destroy(pt_cache);
 }
+
+struct panthor_vm_fault *panthor_vm_get_fault(struct panthor_vm *vm)
+{
+	if (!vm)
+		return NULL;
+
+	return &vm->fault;
+}
diff --git a/drivers/gpu/drm/panthor/panthor_mmu.h b/drivers/gpu/drm/panthor/panthor_mmu.h
index 023fdc79c231..d69b4000a39e 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.h
+++ b/drivers/gpu/drm/panthor/panthor_mmu.h
@@ -123,4 +123,6 @@ void panthor_mmu_pt_cache_fini(void);
 void panthor_mmu_debugfs_init(struct drm_minor *minor);
 #endif
 
+struct panthor_vm_fault *panthor_vm_get_fault(struct panthor_vm *vm);
+
 #endif
diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index a77399e95620..9ea0d2b27114 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -722,6 +722,11 @@ struct panthor_group {
 	 * panthor_group::groups::waiting list.
 	 */
 	struct list_head wait_node;
+
+	/**
+	 * @fatal: VM-level fault that caused a fatal error on the group.
+	 */
+	struct panthor_vm_fault fatal;
 };
 
 struct panthor_job_profiling_data {
@@ -1575,6 +1580,14 @@ cs_slot_process_fatal_event_locked(struct panthor_device *ptdev,
 			 group->task_info.pid, group->task_info.comm);
 
 		group->fatal_queues |= BIT(cs_id);
+
+		if (panthor_vm_has_unhandled_faults(group->vm)) {
+			struct panthor_vm_fault *fault;
+
+			fault = panthor_vm_get_fault(group->vm);
+			if (fault)
+				group->fatal = *fault;
+		}
 	}
 
 	if (CS_EXCEPTION_TYPE(fatal) == DRM_PANTHOR_EXCEPTION_CS_UNRECOVERABLE) {
-- 
2.33.0.dirty

