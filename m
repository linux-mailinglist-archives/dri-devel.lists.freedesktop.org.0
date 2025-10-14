Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EB71BD8847
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 11:45:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5142B10E59D;
	Tue, 14 Oct 2025 09:45:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="MwgbOqaz";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="MwgbOqaz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazon11013029.outbound.protection.outlook.com
 [52.101.83.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2662410E593
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 09:45:02 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=FQ5t1hM1v21egRVt38Y1Pcdf6bhZVnKpKzlR0gsrPKiXdOORacsjY5X/GjSv9PIbQj3pRvKWmhUUcqf8u1fD55EUWOT1oQd28fm9/eUp3CKmI4TmonXauQ+cH0OfXazFoPSYI7DBUwq/NXCnP384AYwd72NB986VTEuGVFfB1bCsA1t6/6rNayyKcsokPcZMU4m2MSzIZEmyaE5tT0AuED9mj/IDp/GzqdfeZcRspA79boXuUTZhFVTyyrdn5FvPE/vuAP1ELyT7p54B4H18B+2G5PxagkdYtZfUDKEAjbsqO+ofn8yDNc3RTkTYfPk5du9l8c2Ybe6fih7DdW1vaQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v+WQyoWWdQttPzpCRIvKIQtoSapG/JTyy56WIxHkkJg=;
 b=iRvWb3SF1yj0QK1/qT5BXo9XM5aQSQQP76OnB9XgTBy3fkeMlZe+KrdjCi3yX3JE2dPiFjrDzLtWZrhyBYTa/bh8aWEOxP1C+yOiX1U0IgunuAzvHhiAzUjXo7E6MpbUgLk8bSMYNnXaWX0iV+MJS1xfVYoXf7+kvCaLwLb2rCR+nx3NV7yMZ0V7EN2v5pssUjq5W3X0sZpmDN3cAHBa7qaxrXjheKLQHgeSZb5PwMNN1EcLC04GXyBrRrz2NbfWhYtFrqVA038SyZJsmvBjkyuE0SVcotg6IdvzoAbdgupRcZ0Gg3JCNFMT9j+/jDAGWM6V++o4hyIuu7HJNF3wsA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v+WQyoWWdQttPzpCRIvKIQtoSapG/JTyy56WIxHkkJg=;
 b=MwgbOqazs+xOxPYD1Us0giLa1s/916tCgrWU2UalajYqp4dKQFgetcqwRKyz3rOn8L1G7ebhENj8SV8tDUdYacqHSpvaP+XtIruFZAJ1Pze3qBnA7+1mkOMunojp9I3KKUvgTPIzbjWIj5C3fykMHcesiGuzccP0+3mgd+LrqjU=
Received: from AM0PR02CA0129.eurprd02.prod.outlook.com (2603:10a6:20b:28c::26)
 by DU0PR08MB9677.eurprd08.prod.outlook.com (2603:10a6:10:447::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Tue, 14 Oct
 2025 09:44:56 +0000
Received: from AM4PEPF00027A66.eurprd04.prod.outlook.com
 (2603:10a6:20b:28c:cafe::1e) by AM0PR02CA0129.outlook.office365.com
 (2603:10a6:20b:28c::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.13 via Frontend Transport; Tue,
 14 Oct 2025 09:44:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM4PEPF00027A66.mail.protection.outlook.com (10.167.16.91) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.7
 via Frontend Transport; Tue, 14 Oct 2025 09:44:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FpIxc+6zCS/k4/eKDSke0pgolGMJJefQ9WXW5wmQdUT5VgJ00yCLr074Viavnlrjgu5iUQUzyRutn6A1aWS55HlQxnIGXpv+yXosQFYHtnkXGad/3h1BjWnpXkERgtF7P57cUbhQyNSHW+Ond5HbvkzmeTpgni1S3GRHBQIft9rsaKQcbNBi0F34ICwlOEtMJCSAf7OXJ6nM7MhlAKETJSocywW412J1c5fK9eoO646a/ZZj0VlZWiEDU+4Vs603Lg113jBVZSpdA91ugz/LhwdpFIgKtOc/J1156OFSUZJYJrvgYnPmKCGASgRkGbFM96Row/KXRtdL9dSjXf8xpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v+WQyoWWdQttPzpCRIvKIQtoSapG/JTyy56WIxHkkJg=;
 b=NmXXnvEzTRRVqd++pGjMpICDrPEAIw2/NM7qHx58OKg+JcyBJnZQOIerDiWquxPpAbqYm6G0oL0zp4cMle68QuEWKB0OSyevfGWMIkWm81/umFVmKifo9V0FXa0njKNXilI93py7HGwpjx85CKJwDlECDS+mOol8+9tST2KlhHl4y9xAlJwQLchl9gmlRP9iKJRRcREz+7sSQeVzJS7il+tCabSCgzR8KRChASvWgBw+Vk8ttqvtFxPoIdCNVcl+tMChqchs7ykgbu4IdjDYp3P4Oyiwg1BWhsp4R3qdilzbdjzQgK84Nm7U+vFKhy8X5Ntpac1I5BzVULHU8Ves8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v+WQyoWWdQttPzpCRIvKIQtoSapG/JTyy56WIxHkkJg=;
 b=MwgbOqazs+xOxPYD1Us0giLa1s/916tCgrWU2UalajYqp4dKQFgetcqwRKyz3rOn8L1G7ebhENj8SV8tDUdYacqHSpvaP+XtIruFZAJ1Pze3qBnA7+1mkOMunojp9I3KKUvgTPIzbjWIj5C3fykMHcesiGuzccP0+3mgd+LrqjU=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by AS2PR08MB8286.eurprd08.prod.outlook.com
 (2603:10a6:20b:555::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Tue, 14 Oct
 2025 09:44:23 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%7]) with mapi id 15.20.9203.009; Tue, 14 Oct 2025
 09:44:23 +0000
From: Karunika Choo <karunika.choo@arm.com>
To: dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org
Subject: [PATCH v1 10/10] drm/panthor: Add support for Mali-G1 GPUs
Date: Tue, 14 Oct 2025 10:43:37 +0100
Message-ID: <20251014094337.1009601-11-karunika.choo@arm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251014094337.1009601-1-karunika.choo@arm.com>
References: <20251014094337.1009601-1-karunika.choo@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PR3P189CA0069.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:b4::14) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|AS2PR08MB8286:EE_|AM4PEPF00027A66:EE_|DU0PR08MB9677:EE_
X-MS-Office365-Filtering-Correlation-Id: 226ba0ba-303e-48cd-2ea5-08de0b065530
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?J3dx1CeFvrMZ1UZQK8mHa8y5zWj04JlcLpt6yjUVMm6Chn+H3xDK1et8rtmz?=
 =?us-ascii?Q?/INujQFaaiiY9kGDeIBRboIFcw5GHmIBs/j/4GfORyWaWYcCuSKrTBuildTU?=
 =?us-ascii?Q?KbyjHNZrLTCKVUpSk+k0NYHLh9ZVYUnowRp5GAzXSYVcDeYrG2csMfHn67LU?=
 =?us-ascii?Q?LEmXVzoG0KSqHaDc9vgIeJr7MN0IloVhohezLi/bJrxVlkmaLVTL4jVOJ4NW?=
 =?us-ascii?Q?71iZ2xFBgV+FTY3ZWQh91rBiKUgHq+y94qIjL2AzwRC2h/mN1zqYO2uRRF1L?=
 =?us-ascii?Q?lyeJzGH7lO1HpRToSNS58Niyyj4csyX4LiCRpkQNTDBTjCuD6ohfGxc0UdXQ?=
 =?us-ascii?Q?9orpLE0/zzuDuQy5mgQ5yjvINXaK9a3ZU7ip5GGeHh9sEjAzQ2GX4orJ4zTd?=
 =?us-ascii?Q?ZAJdRo/Od4Ych/d1kS3/I/GLYpxoUOLGfu7QY5GAXnzUWt74gr/DcUeREtCS?=
 =?us-ascii?Q?OrQlZzg/sWq65R/D67GWUUIzRGmvVUcEwjbH0MpkR+FAOc7YcEdsAcEv2GzA?=
 =?us-ascii?Q?mbHZrpWMcbEcs4E0Zyl40aKJsaFWOn0rb5heg3AUrngVTTM2jNfYK2uyTSy5?=
 =?us-ascii?Q?fUbADjmu2YtvwG0nitGs+DF7njA2Fuz8gGnpewaH/Xzpl3xpBANC3mEu46J/?=
 =?us-ascii?Q?2aJ5jUa8caljRpxfph5rABj7mtUHtn66K8BYuYXbBExtNoiU5nFRxou12kk3?=
 =?us-ascii?Q?VZbEjFLL2vFasHZvqwj25TsA+oq4bm9NRFx24cjE61Z+I1whaOasfiz58//V?=
 =?us-ascii?Q?jZBgDiiZrKZfEyNwB/Oqtq5EOD4VTrk3pA3zM4z2r9YC/eV9iPGEFSztDV4S?=
 =?us-ascii?Q?mBV9i7edAyFiWGFso9PjfgVxvZSeLGoNkJIJIfjf6vI/9KWvrn5+Ejj/UtLM?=
 =?us-ascii?Q?0q11e21E+ZHgrudgf53LfvbgoMnvh09OBhiqsympC6YnBJ3CND5xagzpDFh0?=
 =?us-ascii?Q?1DJBOMwX3g8m/6oIMxqyVWkWCvO8X7z/vUrqsrY0Q0pB9Z0IisCAFR15R5Jj?=
 =?us-ascii?Q?iRKN8uolW0z+TMu1bkBc2zgBH3t0vcObPV1/lm7V9EIJfy0QaIvro40Ls5ch?=
 =?us-ascii?Q?SgiRQi/R9ul7JmXXqPRjDN7gQn+B9NSyPgDKhuMukSXk6h6qL61P6wJOJzs9?=
 =?us-ascii?Q?wi/8K50RRs7lAVFbQXc/stTgKdUmJx52D2hM+mpBg0ta4L+rWXF2HtfHnXDS?=
 =?us-ascii?Q?AH2/QdX/Pywks/fHSGonxgMB6TmURLW7Tg4dypdF+M+FIybFRj8/pS+RPjEK?=
 =?us-ascii?Q?sEVS1rttEobkBObb0XlKkZx1K1D/IURpMUMoHK334S2wyRBY7jQnZbb7Ras1?=
 =?us-ascii?Q?X05tGrwt44/RxkNUIYmABgs3KYwjBONuN2W6PZ+Q+hE1n+t3Z1+V/V6Ma/Fv?=
 =?us-ascii?Q?33RKmDtltwbfNRnqdvTimqi/hGeLHwBJqjgo3L2CU/+MZ01QGQpbGGbK4GBT?=
 =?us-ascii?Q?wQ3YBmOD+k7AILkefMy65UKah+D8/+KV?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8286
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM4PEPF00027A66.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 12a874c2-3289-4624-3487-08de0b0641a9
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|35042699022|14060799003|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xvP6NmiwptmF6GVw8XzyW8/3gofTFXodq9R4pXCS4abmTmeI3jYQRd/m/nsZ?=
 =?us-ascii?Q?Van5WJauMiYlBwbeSdOJhEsaGcI0zl0Of7ZK4ZQTIG7zrmSJPIKbzqWH7O25?=
 =?us-ascii?Q?qh3UUUpOUHrp96AFB387gs+orfvNpzKveOyugDc7M9JJ3uiSd0gR5qpuR/4t?=
 =?us-ascii?Q?iZGpJo7yIZdYc5axZ/6k6CFBGTY3biDD38jIifGprhtvXKSvmqEx9P1UnMnq?=
 =?us-ascii?Q?eJPjVm/s7ojX8aY8N1JnoIu0TVW9zo2HtH82T2gHkdOt+CmaN5wKnc13XaHi?=
 =?us-ascii?Q?O2AoY7d3JdUYyedE/ZVqmxbihoevUijVH2wwIt3xvfE38EV6vkTF6hNasXkD?=
 =?us-ascii?Q?eOsUgje74VzFF4qQS189LFSI+P7GbYyX9oMwbsFsx7sjqQk+/E1k638b1uDB?=
 =?us-ascii?Q?pG2eacjGQWbbiLBQqzMVs+XEAzbKwdqUdDFZ9fM+hqDEC5ZH10Hfe+z100TZ?=
 =?us-ascii?Q?RbCi89UJ0UoHGyhSw0uy9MsQRGFuqKfwzsUXWZNFAOGax8ZDSFTi3AZkTssa?=
 =?us-ascii?Q?dJ2Ap8Ldl4LWHaVLFqSyf5gYIPoqfFTKpFk/fnfTNE+XNCPE2cWaNTGbZ3PA?=
 =?us-ascii?Q?/ZlAupLixLUDOuMdbP9iCHIbd3hBWvQoc5paYnqI/l55vNpOwPOw6FQuF3Cd?=
 =?us-ascii?Q?1wixwY0R7PIv5AHj9/IWJ/KpwEk4MlDr38YWYyKuvOdNdf4pbEivbZfju9xj?=
 =?us-ascii?Q?n1hjhpz1AGY5UsBV5tlQGfrdCw5ZWOGj9hV0V+BxOvOBlFNGVnxu6KmzB9te?=
 =?us-ascii?Q?wdyDQ+IBA+4KHYHVaFa5EVZM4yYOKulKlC+VU70OMbkSXLOzxZzrvKhVoIbz?=
 =?us-ascii?Q?qEhiu2DWm9UdxA7QLP4ZvjI1k+kknOYjrqt3GwJXnQ9BBXeHt22L8vB1CPAn?=
 =?us-ascii?Q?45xZ5+MStO+JS708tBfqxd9wwY9l1EKlaYge9tkFSmhaB/WhY+dSHkzyz25f?=
 =?us-ascii?Q?yMp9BHHDBAzMEKfOWg1s1YKMnwnUgIzi8iXh4YPPTsb3G91T37dMZUEBoPjN?=
 =?us-ascii?Q?xYhis8JImwgMhGhnnJRnIEjYToND8Ns4hBxQKiNFySAFm+FiVcoAjUtJkb8l?=
 =?us-ascii?Q?VcHiVuHmz9YKRc63ZKmyOtjW4bIRqsmW7CDWt/bcr+ci/PCMoyCL+Hu8STD5?=
 =?us-ascii?Q?7jQL+GW1GxzZL2wBeM456EKhPPdM7pDv789gdGHvDDWXaGBinJcQu4MX5qPT?=
 =?us-ascii?Q?S/Sbw78x9/sMMn90S3WObFyraKd5Z93U/JS0Qp8gRIWajLV9OMgj4kGSJ+Zc?=
 =?us-ascii?Q?/ewipp9U8jT7/x2RdBTLpNoFXol9cv/TpjoBaYgzX5g/BYsySw/MKfrA9B+p?=
 =?us-ascii?Q?jFd8xe59eAIwYU/oPq5J1m6H2secWb5ecrfC0UD6nhR7xa2neYFiJg87SsF8?=
 =?us-ascii?Q?DfCreMeGEi8dBIhFBfHEcJREiP+Rz4KvkW5NMCEC4xb4nAV4s2LdLg+69d7h?=
 =?us-ascii?Q?GqSudvlotrCm60FYKjL7Tu9Xu9m24n1okbbVRUpbYBxqVgWx2YsQjWy/Dis8?=
 =?us-ascii?Q?igKbjXKCtDFDLOkePPy5bBr5WfqgksVR4p/txUQf/lV7FkPJfpvxsQPMeYi+?=
 =?us-ascii?Q?Za0eWiLlgJERb/rCgzA=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(35042699022)(14060799003)(1800799024)(82310400026)(36860700013);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 09:44:55.9261 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 226ba0ba-303e-48cd-2ea5-08de0b065530
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00027A66.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9677
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

Add support for Mali-G1 GPUs (CSF architecture v14), introducing a new
panthor_hw_arch_v14 entry with reset and L2 power management operations
via the PWR_CONTROL block.

Mali-G1 introduces a dedicated PWR_CONTROL block for managing resets and
power domains. panthor_gpu_info_init() is updated to use this block for
L2, tiler, and shader domain present register reads.

Signed-off-by: Karunika Choo <karunika.choo@arm.com>
---
 drivers/gpu/drm/panthor/panthor_fw.c |  1 +
 drivers/gpu/drm/panthor/panthor_hw.c | 30 ++++++++++++++++++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
index c1b2fba311d8..dd5ffbea8cd8 100644
--- a/drivers/gpu/drm/panthor/panthor_fw.c
+++ b/drivers/gpu/drm/panthor/panthor_fw.c
@@ -1493,3 +1493,4 @@ MODULE_FIRMWARE("arm/mali/arch10.12/mali_csffw.bin");
 MODULE_FIRMWARE("arm/mali/arch11.8/mali_csffw.bin");
 MODULE_FIRMWARE("arm/mali/arch12.8/mali_csffw.bin");
 MODULE_FIRMWARE("arm/mali/arch13.8/mali_csffw.bin");
+MODULE_FIRMWARE("arm/mali/arch14.8/mali_csffw.bin");
diff --git a/drivers/gpu/drm/panthor/panthor_hw.c b/drivers/gpu/drm/panthor/panthor_hw.c
index 77fd2c56e69f..7a47414d246e 100644
--- a/drivers/gpu/drm/panthor/panthor_hw.c
+++ b/drivers/gpu/drm/panthor/panthor_hw.c
@@ -4,6 +4,7 @@
 #include "panthor_device.h"
 #include "panthor_gpu.h"
 #include "panthor_hw.h"
+#include "panthor_pwr.h"
 #include "panthor_regs.h"
 
 #define GPU_PROD_ID_MAKE(arch_major, prod_major) \
@@ -29,12 +30,28 @@ static struct panthor_hw panthor_hw_arch_v10 = {
 	},
 };
 
+static struct panthor_hw panthor_hw_arch_v14 = {
+	.features = {
+		BIT(PANTHOR_HW_FEATURE_PWR_CONTROL)
+	},
+	.ops = {
+		.soft_reset = panthor_pwr_reset_soft,
+		.l2_power_off = panthor_pwr_l2_power_off,
+		.l2_power_on = panthor_pwr_l2_power_on,
+	},
+};
+
 static struct panthor_hw_entry panthor_hw_match[] = {
 	{
 		.arch_min = 10,
 		.arch_max = 13,
 		.hwdev = &panthor_hw_arch_v10,
 	},
+	{
+		.arch_min = 14,
+		.arch_max = 14,
+		.hwdev = &panthor_hw_arch_v14,
+	},
 };
 
 static char *get_gpu_model_name(struct panthor_device *ptdev)
@@ -82,6 +99,12 @@ static char *get_gpu_model_name(struct panthor_device *ptdev)
 		fallthrough;
 	case GPU_PROD_ID_MAKE(13, 1):
 		return "Mali-G625";
+	case GPU_PROD_ID_MAKE(14, 0):
+		return "Mali-G1-Ultra";
+	case GPU_PROD_ID_MAKE(14, 1):
+		return "Mali-G1-Premium";
+	case GPU_PROD_ID_MAKE(14, 3):
+		return "Mali-G1-Pro";
 	}
 
 	return "(Unknown Mali GPU)";
@@ -114,6 +137,13 @@ static void panthor_gpu_info_init(struct panthor_device *ptdev)
 
 	/* Introduced in arch 11.x */
 	ptdev->gpu_info.gpu_features = gpu_read64(ptdev, GPU_FEATURES);
+
+	/* Introduced in arch 14.x */
+	if (panthor_hw_has_feature(ptdev, PANTHOR_HW_FEATURE_PWR_CONTROL)) {
+		ptdev->gpu_info.l2_present = gpu_read64(ptdev, PWR_L2_PRESENT);
+		ptdev->gpu_info.tiler_present = gpu_read64(ptdev, PWR_TILER_PRESENT);
+		ptdev->gpu_info.shader_present = gpu_read64(ptdev, PWR_SHADER_PRESENT);
+	}
 }
 
 static void panthor_hw_info_init(struct panthor_device *ptdev)
-- 
2.49.0

