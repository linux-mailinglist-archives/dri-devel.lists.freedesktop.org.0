Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98679BD883E
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 11:44:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C53AB10E597;
	Tue, 14 Oct 2025 09:44:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="H7uSnM3o";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="H7uSnM3o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11012021.outbound.protection.outlook.com [52.101.66.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E249410E593
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 09:44:55 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=SRmiaVCJ2KeBriBkspEbuzwTI6e8XGgRMRqM1MBdJ6yvo9G8z+gUcMPJCSQqoxiSonof3QZ9iGa+4e+omBDcTvjdc3U4C50r5uiy6KWj8P6pV9gPk7vCBGyCd+DaGnni7e1WV2pWuzrgqh3i5jBXTb7GGhMomEF6b0s+EiwFxYtl0bkfxwHxofJQ6ZMOzWFPhLBjHUsIk7EN5IEWb5C/xFSzbCHIC8uLOu9Iaeh48ZijpWP1zaPH9elgYb/Tf2InrJenBl+xNqay29280yYbtIn1cN0Tgap1OS7HnX2rVaGRQSiDCIefhlWkP+Zkd3omm/1TaPoqQKmIzXfVrTf6xQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4qAPgLTxRGvmnXouIeiFxTIYBYO80mLSDXDKLZ/bWe0=;
 b=phVIqMwt6iiz7ENlDuV13UEFyaiPi4bEXUACAKxlXkRg/sTnkR3R4k8JIhrPHpw27giqAhoOWEr9Zkx/NwC8WhlSAfbamlZp83+aMXuofzjCRyuJKQWI+2CP2Lhd8FiO4cUK8hKrtqPrsvqa37a88Gl/+d+6DF9xQSRg30qYWuQTEOoH/3vpGEB4/XSfmvmYk+7LoapHlsiHArKvTnvlgxsGlIlZixEvxoqLlvE75OoY/hKQrrqCpDg3blAorI8zADbT8D5mZlFUgT6BTLMSCbEjO//LQllMsuEFvHifDBKmHHOub34gbxMXwsJPhyqgNcBrFYELzq8yfB1ejmWu9Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4qAPgLTxRGvmnXouIeiFxTIYBYO80mLSDXDKLZ/bWe0=;
 b=H7uSnM3odyAT9jKyWk5l6Qg9FdQHMfb45J2T2rWO9DWcbAPPc9xElpYUrtuCweD2WDK52xim2cWjqpeT/rdTifRHOc7B42oQQwCjHJd0jTDIs4DEkPhwk1pdi3LmDvNXxOjQBJC2YLBqTV+B0GDIbrotzygmGlIWqvVYxXBK/hs=
Received: from DUZPR01CA0292.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b7::14) by PA1PR08MB11642.eurprd08.prod.outlook.com
 (2603:10a6:102:558::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Tue, 14 Oct
 2025 09:44:51 +0000
Received: from DB1PEPF000509F1.eurprd03.prod.outlook.com
 (2603:10a6:10:4b7:cafe::83) by DUZPR01CA0292.outlook.office365.com
 (2603:10a6:10:4b7::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.10 via Frontend Transport; Tue,
 14 Oct 2025 09:45:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509F1.mail.protection.outlook.com (10.167.242.75) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.7
 via Frontend Transport; Tue, 14 Oct 2025 09:44:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FATPEPUu98ZqVdskwNqqQMo5yrnHETGfOnYH0TY43J3FBG1T4Z6qaUyN1LwVzW5M7CmnsiuDXVtFYgFhXdqVkXXKxzbHtmk7yzk30PhdLgepnJj+/0H+cG9RV8kKKaHbXnvMpU5J+E9l8hjoSJczTdGcI0BgaWaFvuMWjgKz8fO7QMGBZbXcJEpRLESMy9YI+kur+oZ3Z7DIWNAmAmFBo328yL5JaLYWAVXgFekYg6bOc8pBhRM82o3jTHdAwsszuRpIJD/Spj3HjKXLXkzVxDYef++Ew5R1YF4r8OgxS7FZrkSg3n9L1dnxPCAWeCW+L6hcj0mmA63ZQieywtA9ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4qAPgLTxRGvmnXouIeiFxTIYBYO80mLSDXDKLZ/bWe0=;
 b=RIvWs/kHyzOhAOdZZ+T3C3aT1nAHNQNTN7GUfPS1VpYtZY0O6vl4lHnjICtHKrkZ+FhCoNOJ+VfnsK/yuuVUKThV7p/9ISWJVrlq4BZeg1kpKgGoc79RtQzhs9p121U1V9nXOyytungZ5CPkIYQGl7+Uu7zoo4rw+mGByQY5M50xOPmWUmW62QtfwyvkkYw44Y8HZhXXfN+9jELuW0joP1w1DaStq1TnUgt6KYYHzr5dmYji7oUVt/l9zoHSD9biO/YPCRDej9W7RwIpFXq3TGaU1PjppVc8Y+kAON5LS7fbXHY7hE+KjEq4p08RhEyrD4UCX0ic0aup9c3VpPK1iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4qAPgLTxRGvmnXouIeiFxTIYBYO80mLSDXDKLZ/bWe0=;
 b=H7uSnM3odyAT9jKyWk5l6Qg9FdQHMfb45J2T2rWO9DWcbAPPc9xElpYUrtuCweD2WDK52xim2cWjqpeT/rdTifRHOc7B42oQQwCjHJd0jTDIs4DEkPhwk1pdi3LmDvNXxOjQBJC2YLBqTV+B0GDIbrotzygmGlIWqvVYxXBK/hs=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by VI1PR08MB5517.eurprd08.prod.outlook.com
 (2603:10a6:803:139::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Tue, 14 Oct
 2025 09:44:18 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%7]) with mapi id 15.20.9203.009; Tue, 14 Oct 2025
 09:44:18 +0000
From: Karunika Choo <karunika.choo@arm.com>
To: dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org
Subject: [PATCH v1 08/10] drm/panthor: Support GLB_REQ.STATE field for Mali-G1
 GPUs
Date: Tue, 14 Oct 2025 10:43:35 +0100
Message-ID: <20251014094337.1009601-9-karunika.choo@arm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251014094337.1009601-1-karunika.choo@arm.com>
References: <20251014094337.1009601-1-karunika.choo@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PR1P264CA0050.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:2cb::18) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|VI1PR08MB5517:EE_|DB1PEPF000509F1:EE_|PA1PR08MB11642:EE_
X-MS-Office365-Filtering-Correlation-Id: 26330d3b-e8db-48db-9827-08de0b06522b
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?Ic4Uy4/SY2/DmWSJrHnAwzSoAmQBD12aHaCkta3OAQxBoxVVeMafKdOMA+s+?=
 =?us-ascii?Q?lxedPmHD1So8RtKXapsgeefxYj/FEmPggkBou1iC17MBcRuGST3gHe1ygJl6?=
 =?us-ascii?Q?POzQzhr4I7dCvhfPGwC7PknsiEYiaNU3vOa1jifZvYK8ineFFszD0prBCEFL?=
 =?us-ascii?Q?G874dlyFMUadBxJGyiBuRYeY/o8XaV8lqQQROP0z1VAWv/iAk5cd2Wtk/NSg?=
 =?us-ascii?Q?hlY5bVgwCgm4mR7Xl7PrsWLtk7Uv42Kf28ytjNIN4MFAiYZujEnIkCEoGd6D?=
 =?us-ascii?Q?kWtfu6VwKfaiCT0BWvUIjoYYnJHgkmleeqifIfpm+eP/pXKDjIImQACQqxF1?=
 =?us-ascii?Q?D7pmMkKRGnY/Rqsm3E5AVH8jiXIIFZeWNCeBtjPl5feQvf1jucJEezh0c0vp?=
 =?us-ascii?Q?vdztdUqg3zoXD0D7Hbz/7sjo/y0yBoDVTwZd9ZOoguRqaHi4+su24mrICQr1?=
 =?us-ascii?Q?hyUnbJqLOzUvbaLBGc/5NYQEH2fFrAWGO6fXRdaCiavLd8oPFCBfqXWqX4ol?=
 =?us-ascii?Q?DVQvn0wXaC7BS7Uzj34OIvaAMcbyGS+7UfFThkOr5YmPRRFIs49ya3Gte1z9?=
 =?us-ascii?Q?6Pb52PnzLUkjAKzYtpbCdam4jMmSb6fIKHzMsjmWBDrv5vRZ7pYcZGoP5Tvl?=
 =?us-ascii?Q?5nCW9sp9Q0ExJNNYKucjSTy3hL0NGG/xINng1Q4BqZPD1FC5yYqPb0SrlvPr?=
 =?us-ascii?Q?mmOSujcYygG0ugTOzOeJDlEV8XsnDgnEQwpVppRoBG/uqiIBh+BRPukyeJsY?=
 =?us-ascii?Q?laWCu2QRsEbjr4XSjc2AcmadaIaH3LwvbBRyEUkUBK+9FnddN2ngBCagVg4D?=
 =?us-ascii?Q?EY0ysoN5A6xrxqQhc2Q2ewT5byKYYjn/wfGTP53dxsiY65zbrNfPWyEc2vR5?=
 =?us-ascii?Q?SXiPiWi22dA4XfsMyTXjNWnXI60EpTMzqlSK0+z12aojr3zfn5NzcMm3H2JJ?=
 =?us-ascii?Q?G4fswJqGw2/871SzSGVCiq8/Uz5mQQRqbEPJq5Rr1rm6KgMAXiSrRbE+wMFk?=
 =?us-ascii?Q?J3rzvC+qFOwXgTUEKuRRJ3znZBHoZEkTDcK4z0pU78UoLYViGyBfFo5E7Lwl?=
 =?us-ascii?Q?Vdi1VnxHnQoXiEFXn+5j7Ak4EYEm9l2yaUaLHjzKUqcF90grGuVQPphhf62Z?=
 =?us-ascii?Q?IbeVckW2r7of9SlNBSjPMx9uSoSFRptVgchojVnFwLZPd9nWsumKOCADNwio?=
 =?us-ascii?Q?mqfqPsX9b2qg241BJelu5eIDiDrZ3FiUlL5w+XJLcbM9Z+9SwsLJXNBFFdQ6?=
 =?us-ascii?Q?TT1AEmZn1Ywnda2ImxmQSxq1MAVmnY5LdxlS1AaxZcgbKq3hgNWO7hN9UbR0?=
 =?us-ascii?Q?cuc0W2BZXYhI544ECxWlNh4sLZ8pWnzYjTNgK6FOVU66D0mrIxTxeJXKevyo?=
 =?us-ascii?Q?8jqlq1TBE5W2P2ZGQvzHE9Spzji5MvlgDGOCGDqjjWLFYiG+sdoZnICtwCWb?=
 =?us-ascii?Q?M8OdbKi355NxUirprlXSruotjgVFH7E6?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5517
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB1PEPF000509F1.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: fc0d878f-b3bc-45cb-6241-08de0b063eab
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|14060799003|376014|1800799024|35042699022;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?gl/997FDEw7+BplT0AvPYkQrvVFReEJ7GxEUqlhimiPpp3aYG8ds7RdYQ/Ge?=
 =?us-ascii?Q?vCmObcug0kQdZaMnqFStG4/7SWPEbxST91Uyzpb9snMa9EXobpLVc/SKNEEW?=
 =?us-ascii?Q?AE9tUeaj0YGzvPhj5I97V+EF4RaWzjfa4AWSL4/Nl9suTF4NQUbisFB8QHkH?=
 =?us-ascii?Q?gPNPYfXiiFM/JH2HkBXNLxUi0xrfft6J+mRkFAk8gnmaoez2khXM3YDcAWR7?=
 =?us-ascii?Q?DHLWvVFgtL+1GXY0zxgh4/L3KY989Ip+c/onm926VL2fCSJntoWVLY3ziFzu?=
 =?us-ascii?Q?51AZ9Qg60JmFLwErOaJKUubSDdcDNckPEKMEdUqotMTGBcpDramyLHK/y7r8?=
 =?us-ascii?Q?nqjZ7c2qU/cC5r+a8Tmw/3egz2Bb0kVxPv5Vo4pfhEKbT1C8BzqW/vqXgXNA?=
 =?us-ascii?Q?wje+0uMJZRa2JEQX7EgmRIK0f7VC+IcX7CF5MsMYEIfm/gw660bp0ZFG7oCk?=
 =?us-ascii?Q?iwdaFFbF7qeYuHTkzEULM2FUP/WzZ/2sqpYEo1jcXeX/Id5EfCI9Ds8HDpMP?=
 =?us-ascii?Q?wJGTHClSTmJgyDsKzWO6ylx/H+A4si81Vq2u0b4mcGHkAlU7Rp4QzQg7uOKV?=
 =?us-ascii?Q?ZRKSe75WOC5/G1kkFEGYRzGmh7rY9LlGfbbr74EnwBwXmeutxylp1TrImrRh?=
 =?us-ascii?Q?Uzdt2QcG8BicGp09rUZvPqC8yJqlnjhndItwN7D04OhGOEbQUrCaA3waYkIQ?=
 =?us-ascii?Q?n3nnCgu9EwklMat8Wz1RH5WPPUVhPhZQ6bIgRZIbcExlcIs08GU8kcQE1ykj?=
 =?us-ascii?Q?hbtvVlJFYSM+J+IOQJgzAI8KfjQd/PSpCS6Y5o6EACHd4ykyMhscksCDmn0H?=
 =?us-ascii?Q?4q50mWqNBMvPPTiOQMsNUTJ/9/gYLW7BFmBDnyt5dEMIUbbQyk0Jr8xwsQfv?=
 =?us-ascii?Q?kGHioEPmgue9wa+pNYUhrXIk/Y7FnrQM7CT4DCHlYlfOlJtQXLOQ+BU9vhK2?=
 =?us-ascii?Q?f3yLT8UVH8PN7cMVmz6q4r5QPfBeTiQtZMTh5bkr9waW7UL156URoTqMIa6O?=
 =?us-ascii?Q?pWbIdi6BHrA0e3HeiH9zgIreU+J0H9i/2MSUQESh+v8GWh5p92toHquB3KHd?=
 =?us-ascii?Q?BW6lIhqxzR+8ig258GS4KFvWFvEla3T1UbmbwdyoHnePw88Sgda3VO+M9AX1?=
 =?us-ascii?Q?4x+MUS1St5Xuc0yhk0OBRmZLD1KLvNixxFck8gD4PCPwyb09JfC3EGcuxpHg?=
 =?us-ascii?Q?Ui0YPQZegxC1hm+iH20+TdpER1puKcwFwpxVRj6USx3KJgCWR+rzOpE8+WMS?=
 =?us-ascii?Q?NYsOGgZL9cV1SjPXaDFiPASpljcgF3B073wBTlI4JdLTeqbXrinfLPRUiNol?=
 =?us-ascii?Q?AcXlsXoFc59RmpXFH6D/JmQhDWQfcCdPH6Dc/3tCJi7ur+xBr5c/e3pKgJZI?=
 =?us-ascii?Q?Yh6A0HWePA2wqT/GVk7FNpC8r8HZX1cywNtY3TnFCF66Zk1CQVW/oJ1HF6kl?=
 =?us-ascii?Q?baCVfKKAQRyhtVyH8lr05Gi7WcDmuiYulsWFpco108nZy4FNRpCjQrPzogta?=
 =?us-ascii?Q?+17u65QN5Jae+V1wMkOXNofoB9q7jDc/hfy6hu8DzI0NFIjf8D/lV/LLRP9E?=
 =?us-ascii?Q?IH5AuruuejhnngPwrpc=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(14060799003)(376014)(1800799024)(35042699022);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 09:44:50.8291 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 26330d3b-e8db-48db-9827-08de0b06522b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509F1.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR08MB11642
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

Add support for the GLB_REQ.STATE field introduced in CSF v4.1+, which
replaces the HALT bit to provide finer control over the MCU state. This
change implements basic handling for transitioning the MCU between
ACTIVE and HALT states on Mali-G1 GPUs.

The update introduces new helpers to issue the state change requests,
poll for MCU halt completion, and restore the MCU to an active state
after halting.

Signed-off-by: Karunika Choo <karunika.choo@arm.com>
---
 drivers/gpu/drm/panthor/panthor_fw.c | 82 ++++++++++++++++++++++------
 drivers/gpu/drm/panthor/panthor_fw.h |  7 +++
 2 files changed, 73 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
index e6c39c70d348..48bbae8931cb 100644
--- a/drivers/gpu/drm/panthor/panthor_fw.c
+++ b/drivers/gpu/drm/panthor/panthor_fw.c
@@ -33,6 +33,7 @@
 #define PROGRESS_TIMEOUT_SCALE_SHIFT		10
 #define IDLE_HYSTERESIS_US			800
 #define PWROFF_HYSTERESIS_US			10000
+#define MCU_HALT_TIMEOUT_US			(10ULL * 1000 * 1000)
 
 /**
  * struct panthor_fw_binary_hdr - Firmware binary header.
@@ -996,6 +997,9 @@ static void panthor_fw_init_global_iface(struct panthor_device *ptdev)
 					 GLB_IDLE_EN |
 					 GLB_IDLE;
 
+	if (panthor_fw_csf_version(ptdev) >= CSF_IFACE_VERSION(4, 1, 0))
+		glb_iface->input->ack_irq_mask |= GLB_STATE_MASK;
+
 	panthor_fw_update_reqs(glb_iface, req, GLB_IDLE_EN, GLB_IDLE_EN);
 	panthor_fw_toggle_reqs(glb_iface, req, ack,
 			       GLB_CFG_ALLOC_EN |
@@ -1069,6 +1073,54 @@ static void panthor_fw_stop(struct panthor_device *ptdev)
 		drm_err(&ptdev->base, "Failed to stop MCU");
 }
 
+static bool panthor_fw_mcu_halted(struct panthor_device *ptdev)
+{
+	struct panthor_fw_global_iface *glb_iface = panthor_fw_get_glb_iface(ptdev);
+	bool halted;
+
+	halted = gpu_read(ptdev, MCU_STATUS) == MCU_STATUS_HALT;
+
+	if (panthor_fw_csf_version(ptdev) >= CSF_IFACE_VERSION(4, 1, 0))
+		halted &= (GLB_STATE_GET(glb_iface->output->ack) == GLB_STATE_HALT);
+
+	return halted;
+}
+
+static void panthor_fw_halt_mcu(struct panthor_device *ptdev)
+{
+	struct panthor_fw_global_iface *glb_iface = panthor_fw_get_glb_iface(ptdev);
+
+	if (panthor_fw_csf_version(ptdev) >= CSF_IFACE_VERSION(4, 1, 0))
+		panthor_fw_update_reqs(glb_iface, req, GLB_STATE(GLB_STATE_HALT), GLB_STATE_MASK);
+	else
+		panthor_fw_update_reqs(glb_iface, req, GLB_HALT, GLB_HALT);
+
+	gpu_write(ptdev, CSF_DOORBELL(CSF_GLB_DOORBELL_ID), 1);
+}
+
+static bool panthor_fw_wait_mcu_halted(struct panthor_device *ptdev)
+{
+	bool halted = false;
+
+	if (read_poll_timeout_atomic(panthor_fw_mcu_halted, halted, halted, 10,
+				     MCU_HALT_TIMEOUT_US, 0, ptdev)) {
+		drm_warn(&ptdev->base, "Timed out waiting for MCU to halt");
+		return false;
+	}
+
+	return true;
+}
+
+static void panthor_fw_mcu_set_active(struct panthor_device *ptdev)
+{
+	struct panthor_fw_global_iface *glb_iface = panthor_fw_get_glb_iface(ptdev);
+
+	if (panthor_fw_csf_version(ptdev) >= CSF_IFACE_VERSION(4, 1, 0))
+		panthor_fw_update_reqs(glb_iface, req, GLB_STATE(GLB_STATE_ACTIVE), GLB_STATE_MASK);
+	else
+		panthor_fw_update_reqs(glb_iface, req, 0, GLB_HALT);
+}
+
 /**
  * panthor_fw_pre_reset() - Call before a reset.
  * @ptdev: Device.
@@ -1085,19 +1137,13 @@ void panthor_fw_pre_reset(struct panthor_device *ptdev, bool on_hang)
 	ptdev->reset.fast = false;
 
 	if (!on_hang) {
-		struct panthor_fw_global_iface *glb_iface = panthor_fw_get_glb_iface(ptdev);
-		u32 status;
-
-		panthor_fw_update_reqs(glb_iface, req, GLB_HALT, GLB_HALT);
-		gpu_write(ptdev, CSF_DOORBELL(CSF_GLB_DOORBELL_ID), 1);
-		if (!gpu_read_poll_timeout(ptdev, MCU_STATUS, status,
-					   status == MCU_STATUS_HALT, 10,
-					   100000)) {
-			ptdev->reset.fast = true;
-		} else {
+		panthor_fw_halt_mcu(ptdev);
+		if (!panthor_fw_wait_mcu_halted(ptdev))
 			drm_warn(&ptdev->base, "Failed to cleanly suspend MCU");
-		}
+		else
+			ptdev->reset.fast = true;
 	}
+	panthor_fw_stop(ptdev);
 
 	panthor_job_irq_suspend(&ptdev->fw->irq);
 }
@@ -1125,14 +1171,14 @@ int panthor_fw_post_reset(struct panthor_device *ptdev)
 		 */
 		panthor_reload_fw_sections(ptdev, true);
 	} else {
-		/* The FW detects 0 -> 1 transitions. Make sure we reset
-		 * the HALT bit before the FW is rebooted.
+		/*
+		 * If the FW was previously successfully halted in the pre-reset
+		 * operation, we need to transition it to active again before
+		 * the FW is rebooted.
 		 * This is not needed on a slow reset because FW sections are
 		 * re-initialized.
 		 */
-		struct panthor_fw_global_iface *glb_iface = panthor_fw_get_glb_iface(ptdev);
-
-		panthor_fw_update_reqs(glb_iface, req, 0, GLB_HALT);
+		panthor_fw_mcu_set_active(ptdev);
 	}
 
 	ret = panthor_fw_start(ptdev);
@@ -1170,6 +1216,10 @@ void panthor_fw_unplug(struct panthor_device *ptdev)
 		if (ptdev->fw->irq.irq)
 			panthor_job_irq_suspend(&ptdev->fw->irq);
 
+		panthor_fw_halt_mcu(ptdev);
+		if (!panthor_fw_wait_mcu_halted(ptdev))
+			drm_warn(&ptdev->base, "Failed to halt MCU on unplug");
+
 		panthor_fw_stop(ptdev);
 	}
 
diff --git a/drivers/gpu/drm/panthor/panthor_fw.h b/drivers/gpu/drm/panthor/panthor_fw.h
index 6598d96c6d2a..a19ed48b2d0b 100644
--- a/drivers/gpu/drm/panthor/panthor_fw.h
+++ b/drivers/gpu/drm/panthor/panthor_fw.h
@@ -214,6 +214,13 @@ struct panthor_fw_global_input_iface {
 #define GLB_FWCFG_UPDATE			BIT(9)
 #define GLB_IDLE_EN				BIT(10)
 #define GLB_SLEEP				BIT(12)
+#define GLB_STATE_MASK				GENMASK(14, 12)
+#define   GLB_STATE_ACTIVE			0
+#define   GLB_STATE_HALT			1
+#define   GLB_STATE_SLEEP			2
+#define   GLB_STATE_SUSPEND			3
+#define   GLB_STATE(x)				(((x) << 12) & GLB_STATE_MASK)
+#define   GLB_STATE_GET(x)			(((x) & GLB_STATE_MASK) >> 12)
 #define GLB_INACTIVE_COMPUTE			BIT(20)
 #define GLB_INACTIVE_FRAGMENT			BIT(21)
 #define GLB_INACTIVE_TILER			BIT(22)
-- 
2.49.0

