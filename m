Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A42EC850BF
	for <lists+dri-devel@lfdr.de>; Tue, 25 Nov 2025 13:57:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAF2310E3D4;
	Tue, 25 Nov 2025 12:57:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="Npi/i4wb";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Npi/i4wb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11012031.outbound.protection.outlook.com [52.101.66.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4850010E3D8
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 12:57:14 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=yh9PQl5BZYdBbeOR18uLZKpcFJVj05LzLprS29w4dRLaJm3Rwody7Rky9DujF2gG251VF7SlRnQjgQZSBuacWWAmq1wWFjhKtmEPWwYdd3778xm+sX2M0xU/uDL8FZDaAn1AjG23Udg/lHYlNmppB8U+2Wx9qNccALfJwpEU4Wszh7tHQ6jjFyDh3pNYMLYZfvzD+KXTRKHc/wRejIBSEw/Clej4xMR5qYew7ZVKKxKhdTOVi1dtjovp00WUXl4UGumns5Hb3RgQCgdfj2PDGd3blK9Bo2csBCBWnPXAptnPkOwln8FcnzxoNF3vhpkVPtLMwWHvWRDEYhT3z9bilw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r/B4pcF678qCCbgB91CdC8x2ZMTKOsMfMm3xNQcpdcc=;
 b=Q9ft8FZJhJ/7Xitg7odRjLOlAW6K1PWBXHnOWcmWkLlXnaqmrhJQepPdOkyfNZqSng+zfMrx3SWQpIzDvBQOqk38TAkwcOTF9cWTaVzoL9iElsdUS+/Ly3H36o2sIezn9zhi1p2srF3ZVtdDW3ZLPVsyQW9hyMwPhFBqIkL7PdIq0p6XG6zkcUMy+vKYA1/WGg+EyYD59cMCwLBJBcOZPU3+TKqpO4BPNpva5oBUxcua9GwMQ0w93L1FKgxcFmDp8S/JfiRtRWGjh6kTC6hvO8cOy1EcpiXPYGNmZNQGxzujhWBY4vY3PbUc0jsKRK0r91CvGzIQkbbwYJ8ZBJUgew==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r/B4pcF678qCCbgB91CdC8x2ZMTKOsMfMm3xNQcpdcc=;
 b=Npi/i4wbinfPCifo5/ytoTS7FwbXqhd2cBlvGIiKtzdneXGaWwgoCIBB/TiMJ73F9/Ovho5DOVA4C8aY+Qi+eC915gSNkmO+otUHgH4N6NyI/bWpWIeG2JLWPXU453VTdRsZu1KR51IRzSybmnbPF9R55LyHJrSUjAxIGG6cX5k=
Received: from AM6P194CA0045.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:84::22)
 by VI0PR08MB10777.eurprd08.prod.outlook.com (2603:10a6:800:201::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.18; Tue, 25 Nov
 2025 12:57:09 +0000
Received: from AMS0EPF0000019B.eurprd05.prod.outlook.com
 (2603:10a6:209:84:cafe::40) by AM6P194CA0045.outlook.office365.com
 (2603:10a6:209:84::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.18 via Frontend Transport; Tue,
 25 Nov 2025 12:57:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF0000019B.mail.protection.outlook.com (10.167.16.247) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.7
 via Frontend Transport; Tue, 25 Nov 2025 12:57:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qdy4Bq9pJSBFEVGlUd9QboDPVVL8liU+dlxLUiGmY0MFvkJLh0Ux6+TyG25lWPhJEBlM4DY6Xf2s781k4T7pO/4eRRdgkwyrqS5aDWW9Z0uVj9Ld9S8SIICHbZCOQ52rDagrjcHXd5Ak+xY1WzpSztY572nMGPcsSjCfPqkgmnVbTcWh8Zno9/uTRKbpUPFe+jl2P0KUGQZe56NTlcUHm5H1gSa5CYr25PEO/VX4RM+6fW+xx9a1n53Y7eV96oXj7K4o0Y90TPVgyz9MbKBHt0FQ0pWsUvniF9DWyRB11ZiDlFS3quJkBQqgx1X/mTDxeOmHr++/OtUfzqr7VQ0Emw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r/B4pcF678qCCbgB91CdC8x2ZMTKOsMfMm3xNQcpdcc=;
 b=xXX1brYyVDvBmCSKHK5sjl8FPZQXO3Ptr65dn0cgjldEemDMmWpg71l12f2hofPlu16qixuaASCWlnyKkobGBXFHUUV9qu62pljphorG/aCd5nazx6FGadDMNidkNuwDZO9Hn01XYywToGQE8M8PI8VBreebc8A8A+WnUQKnr32DKVrrfYSCPaFjr9wp6Rw8qHhfjyOtlvFplJxpqZNxXjQb5Sx9soIMLOoSPFE3u9DOKP/QAhBjrf36Bnfj0s7gdLGKXjlEXMJiYt6a9VicRYGl7nWfREVSHTKesNNW2T4Wxz+nRctOWtcPAlOzGjYF5XEBe8fdq2yf/Sz8GkDUAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r/B4pcF678qCCbgB91CdC8x2ZMTKOsMfMm3xNQcpdcc=;
 b=Npi/i4wbinfPCifo5/ytoTS7FwbXqhd2cBlvGIiKtzdneXGaWwgoCIBB/TiMJ73F9/Ovho5DOVA4C8aY+Qi+eC915gSNkmO+otUHgH4N6NyI/bWpWIeG2JLWPXU453VTdRsZu1KR51IRzSybmnbPF9R55LyHJrSUjAxIGG6cX5k=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by DB3PR08MB8937.eurprd08.prod.outlook.com
 (2603:10a6:10:43c::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.18; Tue, 25 Nov
 2025 12:56:35 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%7]) with mapi id 15.20.9343.016; Tue, 25 Nov 2025
 12:56:35 +0000
From: Karunika Choo <karunika.choo@arm.com>
To: dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org
Subject: [PATCH v5 7/8] drm/panthor: Support 64-bit endpoint_req register for
 Mali-G1
Date: Tue, 25 Nov 2025 12:55:47 +0000
Message-ID: <20251125125548.3282320-8-karunika.choo@arm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251125125548.3282320-1-karunika.choo@arm.com>
References: <20251125125548.3282320-1-karunika.choo@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0236.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a7::7) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|DB3PR08MB8937:EE_|AMS0EPF0000019B:EE_|VI0PR08MB10777:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d1f8df9-bec5-44a8-babf-08de2c22247e
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?oOE7xxvTEPBkIjBUKZ8ofY2h5EP/DDL3vwjGoRlnDtNuOHfjzG5MM2Q5idYc?=
 =?us-ascii?Q?i2OegzW78kL9EoJE/tZE8DRzqYKpQe0UROwPmS6a543df97332dQQ0O26o8F?=
 =?us-ascii?Q?Keyw0K+L9tEapLzxEZSQ0kH9aG3oz8wdULiE3oezzifCibUSyy60b9dJsSE8?=
 =?us-ascii?Q?9bPw5Fa9x0BHlBNnFEGKl07i03Q/O3yLAMhXf6LgnUUyu2EzU+adIorZ+eCG?=
 =?us-ascii?Q?sDFCWO2EdCD2L9Y9iFcZlLK4hHXI63A+DrcYywXdtWH45mkl3LYFd0RKA2eG?=
 =?us-ascii?Q?dsIfLNPsqqp259nIIq6WGrNpXMscWkWi0T7la1/QvS1l0cvQEnccjHO+mjKA?=
 =?us-ascii?Q?NCOt47v2jHDDaLa+mSl2X34oUw+8sSEvcz+5usyrHIw6QfFEgZmblhQ2dlb9?=
 =?us-ascii?Q?XWYjjcDKeZ+X3bMW3XQrWpGtzF62/VZ79XHiUSds8VoxhyQARqfep0WrOots?=
 =?us-ascii?Q?OsG7tABiSHTFdC2FJD5K6ZdGgijxgzzmXh61DOsE4XZV/PtUfX7DjmMEWTVC?=
 =?us-ascii?Q?klZfk5FGhrlBjAGiigV+bIQ81gp86GP33T5T3iDFj1t/c0eONMrfPTfqfzi4?=
 =?us-ascii?Q?fjAUmAavqmHxgHEgb0MMVmta4Xnwa9Wy3uZhcfx5o4QristwR1hPAde2j2jr?=
 =?us-ascii?Q?AFIfNOaNo7VgQ+fz3oi8B20/9z9QvzkSk49DVLa+n9s2ckXpiwotqncx3rD6?=
 =?us-ascii?Q?5ky0YnnRFs4tuA5w+FjD2UELWziijk2l+ntl67S3twYU7VPDE7WXlAFKdHfA?=
 =?us-ascii?Q?TmdxYGmtFe0bfZo56a8vxWCzB8ugEPfkd944mA7IARjLHO/0sMA9xsGLP6MS?=
 =?us-ascii?Q?ktYPv/P/rpHLLRgSqHxWbB/81EvTgDTU4b+/iz7yVz6vB30/xPbqIC44YRV4?=
 =?us-ascii?Q?RgS4EpqokS/iumXGCLRKZy/5ChfQUeoOTqE1gzQ5osHVoQusDULBgcBtFiDB?=
 =?us-ascii?Q?kUAjFLNOVhGJhVWytb6dMUaRerwojmsrGk6S2gmuDEB7nGvW/CLMeDzHZBpj?=
 =?us-ascii?Q?ST/0RniHeRcP5jFQGs5ITg9aCL7LWv3cviVWtFnHPu7Ca0wnRfCG1fgdbvF7?=
 =?us-ascii?Q?hc1M6HNdksyn+6ExF673uZPBjqg4WiIHjw2EAkUPHUST2ATqW6YLC0NTNsE9?=
 =?us-ascii?Q?Ir+oG+I88tVUeeoYhm5QEBKM7IvvsCEWYVlWCLXsXWfPkGApHcfOHtvgIgeD?=
 =?us-ascii?Q?oteWV4WYuHIlaqT7wxFjlJAw26mtii5kxnS0LfI3qNt65aXYBgBfDGdBnudU?=
 =?us-ascii?Q?ah0RHudG3nO9dAS/tbywZPso5+9fGWXu6ALBXTB/MfrG0NjtO2LCKrlytqeL?=
 =?us-ascii?Q?NjB9TVbCijomRNc5ReNpRz1rmRupo/UVtDzSRAiYXOkSS+/ph8SKg2cSaG8k?=
 =?us-ascii?Q?sF9DqnSytLfrdbkNq59uPoG8JYXIZSCtVuFTayL17pfUReLlZTj0DKZzXX50?=
 =?us-ascii?Q?4mPd/nIpONwknlEexfexuyiQ0YPd+mPU?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR08MB8937
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS0EPF0000019B.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 7afc3842-9cd7-4f4d-a686-08de2c22103b
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|14060799003|35042699022|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?C8AIRURGT86NxtHDA8NinTAgW17cP2gE1tdJh4pYE+Md4efl4q5OIROyf6/t?=
 =?us-ascii?Q?KqYAqTXXSfEjUW9ENMBUGpJulmctJzQPxBq/LlWvJAhLKM0wCWAgg3COepaL?=
 =?us-ascii?Q?FpDMmsXhe0zeAzoRpmUxnKkoRs+e8qke99hVKYplgIAR5aVhI5+fOJcWyxAw?=
 =?us-ascii?Q?yRx7Svo5Bm/hFUao5bXqAxy3qmeDjsB0YI2fJCJVfwrckvKLJCRxSgp2ivl4?=
 =?us-ascii?Q?Q6jDm1Flo5Q+rtnnYhnLVFyFaagZrK/1Q3AFKGA9I9lsShb5o+51CKkKb4AU?=
 =?us-ascii?Q?Z5vhjpPPyL3c29cQpTNpr2C+5ymgkes/D1m3RVYO0js4++rDO//drJ7JGB5D?=
 =?us-ascii?Q?1MinAmBP26+/afxkKFI9sdrtzmagxRT0rlE+5m0UJmPteOjl5g/yIAfCFLH2?=
 =?us-ascii?Q?GWvjvXCp8hVi3xjNII5rHYtLJu8PDUWqZjDVagHCWYxLinvpG2gDbrz915Vv?=
 =?us-ascii?Q?iIqZWq2aUc0pzQ6M9id0mZQkUt2KjxnFUOo5IFYKRGLO7UprVkFz77HrTKxt?=
 =?us-ascii?Q?pZQeUY2cx1tGYbW2ZaEsS2/eCGJCN9w6gD4wpKjxZdUP94K8CJuPJxTu8NBM?=
 =?us-ascii?Q?H/BQ6+zysp0FfClT5Q7QiXn4RHbBFlD24pWNIZH403HxJJbwr7IIXNRXSEV2?=
 =?us-ascii?Q?+RWuMR47vtrBdlrdnLUsfUl76Ygdm2e7rx2nTo+Bnq4h8qflb0+htiTPM6Lq?=
 =?us-ascii?Q?9CIbJCdYA6NZzL3d7kfYvs3kQPkPpOFIz7etP+N0O32/ndyMNuH7Et28vGD7?=
 =?us-ascii?Q?9Z5iAgSBmrDOH40FbFeQhpTjHV+5O1ptVO/KXmJFI1Mg/80YYN16Pb+g6j2L?=
 =?us-ascii?Q?opkI+UoUs9Vt6iOGeuMTJrrM1F+kVm1aTv4KCm+/UgRkLSxS+YsYrQrvc2Wy?=
 =?us-ascii?Q?Obaiu7qRBobu88CGmkWmbyB/Qux0NQOzV5M5lzQH6Ic07qVJsSwbLNHiYb/R?=
 =?us-ascii?Q?nQZvhQ1SkYNZV4ShLY17v2cCGmSb7gbMjtwnKOZ5c7QuCt7NDbjyzadpjXXg?=
 =?us-ascii?Q?4O9ebEua0xHYoRN2LTD8zVSYn7NzkfJRsa5Qdgc85ikNoDbDi8PCqj8izNcH?=
 =?us-ascii?Q?V5u/KF09U4x0/4fyRjliRBoYp8dabGk3l7gof0la7zcZqT2NWqTZUcmTgpH8?=
 =?us-ascii?Q?HYQF7bQYhXEMOAAVcCEr2wbSc9sCiVzPuNGPXe36VxBRQhbLDNjMjSbzRfrt?=
 =?us-ascii?Q?wTU7e7JwiWQoz6MaJeiAYLGkRyCrV4K+vVxfARePAV5U+Rp73K4IasVRBC1N?=
 =?us-ascii?Q?jvobPHotQEzzOrVQyHXh/OulnpfnYP9yvQ5oShoTWgQcQ7PYro+1KbvlaSpG?=
 =?us-ascii?Q?J/L5ACEvxujrP44nwcrydTVbXxu9Lz+rygQqTdPxpAfmtmsOhHip6TVJxiK/?=
 =?us-ascii?Q?yRFld1H2dPVTxhuElFTtN1UevtLGRynMBrZ4ToHU26JqFV0047DPv0uSHDbd?=
 =?us-ascii?Q?jyOdiNCFGEQGOwzosEEFXJZ05atsK+/WUhMVicUiDsH/xNY1ZYXlQaAI1LIm?=
 =?us-ascii?Q?YgkmBHlgykO+e5TfXiQtl4LxipFNVmtw6tIotJa59mS4h3mAPDObjkMJIGDr?=
 =?us-ascii?Q?BG/TJJ52rTTSHRAt0ds=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(14060799003)(35042699022)(36860700013)(376014)(1800799024)(82310400026);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2025 12:57:08.4968 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d1f8df9-bec5-44a8-babf-08de2c22247e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF0000019B.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB10777
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

Add support for the 64-bit endpoint_req register introduced in CSF v4.0+
GPUs. Unlike a simple register widening, the 64-bit variant occupies the
next 64 bits after the original 32-bit field, requiring
version-dependent access.

This change introduces helper functions to read, write, and update the
endpoint_req register, ensuring correct handling on both pre-v4.0 and
v4.0+ firmwares.

Reviewed-by: Steven Price <steven.price@arm.com>
Signed-off-by: Karunika Choo <karunika.choo@arm.com>
---
v4:
 * Picked up R-b from Steve.
v2:
 * Wrap the CSG_IFACE_VERSION checks for v4.0.0 with
   panthor_fw_has_64bit_ep_req().
 * Removed wrongly included code from previous patch.
 * Reordered CSG_EP_REQ_PRIORITY_GET() and CSG_EP_REQ_PRIORITY() to
   reuse CSG_EP_REQ_PRIORITY_MASK definition.
 * Updated panthor_fw_csg_endpoint_req_*() functions to accept CSG iface
   structure instead of a CSG id.
 * Update endpoint_req variables to u64.
 * Minor readability and code quality fixes.
---
 drivers/gpu/drm/panthor/panthor_fw.c    | 36 +++++++++++++++++++++++++
 drivers/gpu/drm/panthor/panthor_fw.h    | 25 +++++++++++++++--
 drivers/gpu/drm/panthor/panthor_sched.c | 21 +++++++++------
 3 files changed, 72 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
index 6b89821ff1dd..0fb33489069a 100644
--- a/drivers/gpu/drm/panthor/panthor_fw.c
+++ b/drivers/gpu/drm/panthor/panthor_fw.c
@@ -326,6 +326,42 @@ static bool panthor_fw_has_glb_state(struct panthor_device *ptdev)
 	return glb_iface->control->version >= CSF_IFACE_VERSION(4, 1, 0);
 }

+static bool panthor_fw_has_64bit_ep_req(struct panthor_device *ptdev)
+{
+	struct panthor_fw_global_iface *glb_iface = panthor_fw_get_glb_iface(ptdev);
+
+	return glb_iface->control->version >= CSF_IFACE_VERSION(4, 0, 0);
+}
+
+u64 panthor_fw_csg_endpoint_req_get(struct panthor_device *ptdev,
+				    struct panthor_fw_csg_iface *csg_iface)
+{
+	if (panthor_fw_has_64bit_ep_req(ptdev))
+		return csg_iface->input->endpoint_req2;
+	else
+		return csg_iface->input->endpoint_req;
+}
+
+void panthor_fw_csg_endpoint_req_set(struct panthor_device *ptdev,
+				     struct panthor_fw_csg_iface *csg_iface, u64 value)
+{
+	if (panthor_fw_has_64bit_ep_req(ptdev))
+		csg_iface->input->endpoint_req2 = value;
+	else
+		csg_iface->input->endpoint_req = lower_32_bits(value);
+}
+
+void panthor_fw_csg_endpoint_req_update(struct panthor_device *ptdev,
+					struct panthor_fw_csg_iface *csg_iface, u64 value,
+					u64 mask)
+{
+	if (panthor_fw_has_64bit_ep_req(ptdev))
+		panthor_fw_update_reqs64(csg_iface, endpoint_req2, value, mask);
+	else
+		panthor_fw_update_reqs(csg_iface, endpoint_req, lower_32_bits(value),
+				       lower_32_bits(mask));
+}
+
 /**
  * panthor_fw_conv_timeout() - Convert a timeout into a cycle-count
  * @ptdev: Device.
diff --git a/drivers/gpu/drm/panthor/panthor_fw.h b/drivers/gpu/drm/panthor/panthor_fw.h
index a19ed48b2d0b..fbdc21469ba3 100644
--- a/drivers/gpu/drm/panthor/panthor_fw.h
+++ b/drivers/gpu/drm/panthor/panthor_fw.h
@@ -167,10 +167,11 @@ struct panthor_fw_csg_input_iface {
 #define CSG_EP_REQ_TILER(x)			(((x) << 16) & GENMASK(19, 16))
 #define CSG_EP_REQ_EXCL_COMPUTE			BIT(20)
 #define CSG_EP_REQ_EXCL_FRAGMENT		BIT(21)
-#define CSG_EP_REQ_PRIORITY(x)			(((x) << 28) & GENMASK(31, 28))
 #define CSG_EP_REQ_PRIORITY_MASK		GENMASK(31, 28)
+#define CSG_EP_REQ_PRIORITY(x)			(((x) << 28) & CSG_EP_REQ_PRIORITY_MASK)
+#define CSG_EP_REQ_PRIORITY_GET(x)		(((x) & CSG_EP_REQ_PRIORITY_MASK) >> 28)
 	u32 endpoint_req;
-	u32 reserved2[2];
+	u64 endpoint_req2;
 	u64 suspend_buf;
 	u64 protm_suspend_buf;
 	u32 config;
@@ -464,6 +465,16 @@ struct panthor_fw_global_iface {
 		spin_unlock(&(__iface)->lock); \
 	} while (0)

+#define panthor_fw_update_reqs64(__iface, __in_reg, __val, __mask) \
+	do { \
+		u64 __cur_val, __new_val; \
+		spin_lock(&(__iface)->lock); \
+		__cur_val = READ_ONCE((__iface)->input->__in_reg); \
+		__new_val = (__cur_val & ~(__mask)) | ((__val) & (__mask)); \
+		WRITE_ONCE((__iface)->input->__in_reg, __new_val); \
+		spin_unlock(&(__iface)->lock); \
+	} while (0)
+
 struct panthor_fw_global_iface *
 panthor_fw_get_glb_iface(struct panthor_device *ptdev);

@@ -473,6 +484,16 @@ panthor_fw_get_csg_iface(struct panthor_device *ptdev, u32 csg_slot);
 struct panthor_fw_cs_iface *
 panthor_fw_get_cs_iface(struct panthor_device *ptdev, u32 csg_slot, u32 cs_slot);

+u64 panthor_fw_csg_endpoint_req_get(struct panthor_device *ptdev,
+				    struct panthor_fw_csg_iface *csg_iface);
+
+void panthor_fw_csg_endpoint_req_set(struct panthor_device *ptdev,
+				     struct panthor_fw_csg_iface *csg_iface, u64 value);
+
+void panthor_fw_csg_endpoint_req_update(struct panthor_device *ptdev,
+					struct panthor_fw_csg_iface *csg_iface, u64 value,
+					u64 mask);
+
 int panthor_fw_csg_wait_acks(struct panthor_device *ptdev, u32 csg_id, u32 req_mask,
 			     u32 *acked, u32 timeout_ms);

diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index e74ca071159d..0012e7a1bf59 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -1140,11 +1140,13 @@ csg_slot_sync_priority_locked(struct panthor_device *ptdev, u32 csg_id)
 {
 	struct panthor_csg_slot *csg_slot = &ptdev->scheduler->csg_slots[csg_id];
 	struct panthor_fw_csg_iface *csg_iface;
+	u64 endpoint_req;

 	lockdep_assert_held(&ptdev->scheduler->lock);

 	csg_iface = panthor_fw_get_csg_iface(ptdev, csg_id);
-	csg_slot->priority = (csg_iface->input->endpoint_req & CSG_EP_REQ_PRIORITY_MASK) >> 28;
+	endpoint_req = panthor_fw_csg_endpoint_req_get(ptdev, csg_iface);
+	csg_slot->priority = CSG_EP_REQ_PRIORITY_GET(endpoint_req);
 }

 /**
@@ -1304,6 +1306,7 @@ csg_slot_prog_locked(struct panthor_device *ptdev, u32 csg_id, u32 priority)
 	struct panthor_csg_slot *csg_slot;
 	struct panthor_group *group;
 	u32 queue_mask = 0, i;
+	u64 endpoint_req;

 	lockdep_assert_held(&ptdev->scheduler->lock);

@@ -1330,10 +1333,12 @@ csg_slot_prog_locked(struct panthor_device *ptdev, u32 csg_id, u32 priority)
 	csg_iface->input->allow_compute = group->compute_core_mask;
 	csg_iface->input->allow_fragment = group->fragment_core_mask;
 	csg_iface->input->allow_other = group->tiler_core_mask;
-	csg_iface->input->endpoint_req = CSG_EP_REQ_COMPUTE(group->max_compute_cores) |
-					 CSG_EP_REQ_FRAGMENT(group->max_fragment_cores) |
-					 CSG_EP_REQ_TILER(group->max_tiler_cores) |
-					 CSG_EP_REQ_PRIORITY(priority);
+	endpoint_req = CSG_EP_REQ_COMPUTE(group->max_compute_cores) |
+		       CSG_EP_REQ_FRAGMENT(group->max_fragment_cores) |
+		       CSG_EP_REQ_TILER(group->max_tiler_cores) |
+		       CSG_EP_REQ_PRIORITY(priority);
+	panthor_fw_csg_endpoint_req_set(ptdev, csg_iface, endpoint_req);
+
 	csg_iface->input->config = panthor_vm_as(group->vm);

 	if (group->suspend_buf)
@@ -2231,9 +2236,9 @@ tick_ctx_apply(struct panthor_scheduler *sched, struct panthor_sched_tick_ctx *c
 				continue;
 			}

-			panthor_fw_update_reqs(csg_iface, endpoint_req,
-					       CSG_EP_REQ_PRIORITY(new_csg_prio),
-					       CSG_EP_REQ_PRIORITY_MASK);
+			panthor_fw_csg_endpoint_req_update(ptdev, csg_iface,
+							   CSG_EP_REQ_PRIORITY(new_csg_prio),
+							   CSG_EP_REQ_PRIORITY_MASK);
 			csgs_upd_ctx_queue_reqs(ptdev, &upd_ctx, csg_id,
 						csg_iface->output->ack ^ CSG_ENDPOINT_CONFIG,
 						CSG_ENDPOINT_CONFIG);
--
2.49.0

