Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3631BACB0B0
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jun 2025 16:09:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E538010E530;
	Mon,  2 Jun 2025 14:09:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="WfTMYKmP";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="WfTMYKmP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2078.outbound.protection.outlook.com [40.107.20.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C964C10E532
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jun 2025 14:09:16 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=GmSaUJUafsnkhcVRlnftthK4DYcMmbZk2HHa9MEzeQxN7nH7S4xIzAKFswqTmQb8gHHYr+6CSqgWvtm9d39MVZdEtprAqE7UxYl466e2WNDVAoeSXcJe3bp0C42lVPozcuxD7RtCyo89sSBP2P0Vza3CBa7D0SqUW7Cr+YYzS4rZ9ZuFN2ZMXzljbLztpy5ltLghDb5Z2Qc6Y6UileR+IGMzcB1VWHevRUr7LH3aZ4y+0IEiRuUAn+d5jAizCC04zqAGD4AC5XxHEsllC15UItznCowGXqS7zHyhQtVGkfhw5RTxkEbHl/M7o5MLWgkzh50IvfIHobO1GFwgMTwtpg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YYSRkCNnaGAKA+FBxg2i44JxbDRqCedCP8l/aG2+2KU=;
 b=PqlUZOGVHUcESKNnKZ73xEjD/iyi8ERsIZ3ASYf2RK82Crt4CADS94ilecu0OZ6GqEptuPzrumvjYSAPWYK4Eg/Ua66ShK8dOZVMtwuOk1C7f+Desn/lOfyn1JGWQX1zFLzhIBcmSm8MFcjEv9GRVCMwyDM4RqFzuUnNSMEi0HfHf1NYlVOKK3u6weE1kSpzPo1XuLSLsiDqxJrT/Rize5wpRQnH+GTO87WoiN+f3SiQloKYy++6mckN7ea0zIBw5AuTLbzqenCUHTJkyl1G6LCYeyRiHJ78HHYHcWNz1cBlamq/c6VBgyL5bT966SMFI+Z84EoNnKYfRRAfv4DQcw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YYSRkCNnaGAKA+FBxg2i44JxbDRqCedCP8l/aG2+2KU=;
 b=WfTMYKmPMBpJ4TFRo359Ik9Ji5zaWIIYfH50mjIsl08y4flepyJO55zFGwdG/rr2diuWk0UTEVyk2wEQaEV7L6KHtjOyPe9luE8Nv26EnKJ6D07p0STIaE6fGS93GE7QQyfzHVl/gXRl6hRtp4nMcjEf2sABdTp/g9OVp8vfxkY=
Received: from DB7PR02CA0025.eurprd02.prod.outlook.com (2603:10a6:10:52::38)
 by DU0PR08MB8977.eurprd08.prod.outlook.com (2603:10a6:10:465::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.34; Mon, 2 Jun
 2025 14:09:10 +0000
Received: from DU6PEPF00009529.eurprd02.prod.outlook.com
 (2603:10a6:10:52:cafe::66) by DB7PR02CA0025.outlook.office365.com
 (2603:10a6:10:52::38) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.25 via Frontend Transport; Mon,
 2 Jun 2025 14:09:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF00009529.mail.protection.outlook.com (10.167.8.10) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.29 via
 Frontend Transport; Mon, 2 Jun 2025 14:09:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E8GFarErGeamH/9UXyt0s3M3iDBLrfCUXGC432ovwAIq/2M6zCOupEjQ/LMtIH47BqWuKH2AMoNNlbVCNLyTKIEPVMN9HtNmwumvh8Va87nrjtPghKki1lkacF/t5xASROtKPHpyZF2m7bHLTjfHxfhhldN5EY3EQGaOUxqT1/xNZ/Co5YH0MuwJzAaYZihilGyOzxSpDqGln/mJc9vsEbR2+GlhHICH7vbUhpcS0IrapFakHx2/PQnN4KDjIClj2hEdDsTU7/i3UCsSZrmaaG3cjGKlRQLXfMXHQ0Cye+a8T5WbsP6IoTRWiaZKABMLUTRWWLotthVB6iig0ETN/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YYSRkCNnaGAKA+FBxg2i44JxbDRqCedCP8l/aG2+2KU=;
 b=CnSZoUW36bpbfizkUGz1pNb5bTXsv5hRr6uUIwPDo0OlgPZrf01N/RWbxU5+4A/I7c+sZOIrV1DReoKyLpYoS7WoPKQ8SPda3JAm4e9OI91/uWkq1YKll+J9YhSe9clu+keEQG2eWoGb1wKXL7x2vg9pA1sLK72WKyvfwPgxEV2omPJygG4pngIpO2g84VXpRiZ/jA5+3wdbc18Tn8qBSXXLOvgWfWbygEIsktstyrxfdcde6zMaxjOK1DAl1fUokiiiI6XzflCUY8x4kibe0cbd9WgSo8VSCkk2fHzhNE+g2wnLnl7Pr1C8wwf0EtuqF03pNxCb05uGUv7K1U8FNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YYSRkCNnaGAKA+FBxg2i44JxbDRqCedCP8l/aG2+2KU=;
 b=WfTMYKmPMBpJ4TFRo359Ik9Ji5zaWIIYfH50mjIsl08y4flepyJO55zFGwdG/rr2diuWk0UTEVyk2wEQaEV7L6KHtjOyPe9luE8Nv26EnKJ6D07p0STIaE6fGS93GE7QQyfzHVl/gXRl6hRtp4nMcjEf2sABdTp/g9OVp8vfxkY=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by AS8PR08MB9018.eurprd08.prod.outlook.com
 (2603:10a6:20b:5b0::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.32; Mon, 2 Jun
 2025 14:08:28 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%7]) with mapi id 15.20.8746.041; Mon, 2 Jun 2025
 14:08:28 +0000
From: Karunika Choo <karunika.choo@arm.com>
To: dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/7] drm/panthor: Make getting GPU model name simple and
 extensible
Date: Mon,  2 Jun 2025 15:08:07 +0100
Message-ID: <20250602140814.2559538-4-karunika.choo@arm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250602140814.2559538-1-karunika.choo@arm.com>
References: <20250602140814.2559538-1-karunika.choo@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0184.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:311::10) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|AS8PR08MB9018:EE_|DU6PEPF00009529:EE_|DU0PR08MB8977:EE_
X-MS-Office365-Filtering-Correlation-Id: be6e6f45-0b29-4a3a-b69f-08dda1df0aec
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?sAjh6V1aipKJHrQv0nc2uAP87dZbI3oG9uGtVoxhrEDMcFdzVg5jGGYfnyCO?=
 =?us-ascii?Q?cCoB5r148PfJd33zftVF6ayUl3MaeL9amd7WfK9Tzbhz1MSASoq3z72hdhN8?=
 =?us-ascii?Q?zYaXP/AiE/UdjJLqEmuKaXPv6mlCL946w+W9VwbeB06JbSk5rrBDO8UB/e3u?=
 =?us-ascii?Q?oMHt49DUwIEhlcD9deddRbjsbPbySoFvLWA7Z7SAzKOltrP/NSs+IXHkjjdq?=
 =?us-ascii?Q?yaGOGUKNceeT0lTPth171sc3aqFTa9Amqxz32vlVVTKGlNhHF4coCWvvM9og?=
 =?us-ascii?Q?lvu+oynSGZZYMHY27Wte+b7Ehun83JS/+gpiXMDLi1ERZ8Bdzj3fBAwF3Yu1?=
 =?us-ascii?Q?MlVd5tTxsLH8+oa3aGjPstAXPmtdBfoRlxdUnazz3SUZksprxFL32t+Oldh/?=
 =?us-ascii?Q?P4BNkcC5sXn3Ry2BCVwEgtKyT3cPNaU+sVsiPQjfhHHfpHe18OxqYPR+4mrF?=
 =?us-ascii?Q?PC9SDdEEAedtdXSC8DsQPbYTRqahw4Fl1mQMABnpJYED5u6MI1RKNFYKx3rf?=
 =?us-ascii?Q?HYU9/s913BWhbS97tyviL6acDMGrnCDeLzDgohOC7dM44ZqpEAYaWi1MPrJ5?=
 =?us-ascii?Q?8cRoygNvHV7HqQCnLmk4khC2k+1HjP1WFtK2QQcoh+r+OiICgUhZYF4MWnVc?=
 =?us-ascii?Q?7FMqDK5gPGhSddMaBliHha92hCy7d0Jhi0Dj+rJeCPSqPp1KUhMI+2PtXxvc?=
 =?us-ascii?Q?yKa86/KEgNCVWASyYRzNPVzX68TMlU2XjN3D3cM3+oMNCjGprJhmUy1bZdvp?=
 =?us-ascii?Q?FXBweZu6hXVEfmSp5lisi5x9WDtG+aQfrs3MRywQnHfQsoW2bKeYp9kiovsA?=
 =?us-ascii?Q?dMl1J+3/zZzlr8d83cU3IffLEtrxMZSUYL9bEX1wvkJwG6HtrqmQZ+QUEh+A?=
 =?us-ascii?Q?IpGx83KU8470kpcrlKVMsOw5BQrRi21yzl1SjjEZHmtbS9mheI9jmCo5v4K5?=
 =?us-ascii?Q?WjUYruSVdha+Cs6VVgiZ5Njup+l6vFu9ABxy2bJfiYvn/npXHDz1N9ZsegIE?=
 =?us-ascii?Q?6Btun9C7vbx6P45NBy6qqMfJZywxI5Y2O1k6vuPsSQ8KoyBKTE+r8xY5Vfes?=
 =?us-ascii?Q?dFFm7pMbg91fyrV9c7l7f/vbtRYtGjTYymkaH/42nOzMJkfH7+9RL6kEgkwp?=
 =?us-ascii?Q?ATdPm8/7vy/xEcwJnYk0sfU6x0bOp1VMltjX6JYqdJ9wpsGUNwS0506JZqMZ?=
 =?us-ascii?Q?xyl+PFtpjvqlzQW7Arpe4Ej6/T+bzt8PR14WROuqP8TFxAUxchgC3Fhg1nQY?=
 =?us-ascii?Q?24HDXUXAQYiwMcLx9swA/G0QL+J1A+zDycvGinieGQ=3D=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9018
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU6PEPF00009529.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: cae7ed80-fbc3-4f91-27b6-08dda1def161
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|82310400026|14060799003|1800799024|35042699022;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?NtXJO587gNjJewmEHVBCSzvkN+s6jxCH1d6D6jiKqq/SpkG9BwHTGUXronFb?=
 =?us-ascii?Q?ZS+2L3+onvwgDzZ5NNMFoVSA+himh2t77mMqHsiC+HSVRCIM6itaymh0TNao?=
 =?us-ascii?Q?jFG+IYW2MsdoXu/IXFpU49umSC8OFRB9/UEC+LpehmZqR1D75i6CNeCXn+ow?=
 =?us-ascii?Q?TtPyTwYtjSimKDV4I5tFoyDF+P8BLGeXeMCGpQMzX2fXfffOFcopHURbDbw4?=
 =?us-ascii?Q?tmzqHcz81u6eJMJKRRQywlkjxdH171WMCh/k4mgLusTo7BHKLFIz/FptMkN4?=
 =?us-ascii?Q?LinhOZ3E/lT2vEsJ7kSxAm9/TlCmBCAWRbrrJmWyrDhQozhmWC0G4m/qeFZn?=
 =?us-ascii?Q?tt8bt+vKsxPjCUFBm+tU//FJR7JUnlXT+GVMPgqkRdnaxjNl4LBpU8oy/PSP?=
 =?us-ascii?Q?QD2aFMIZ0liSUtbIB0SppBCng5d5NsR9btC7LH+XOpfkmVNZjONBfk9VC7uo?=
 =?us-ascii?Q?2tK81E29Iu4pTzY7FU5/dh/QB52bREf5EgqO5Ah9S6DKhLQ1/nkFIjqgZ6QX?=
 =?us-ascii?Q?CJNfceRudlowalocrXMDhl6lTHBaqFT2YgMzPlgpRvJjrwfjZkYfkmp52e66?=
 =?us-ascii?Q?fGSX8/21sGYBHvYiTO6+acYEP+yE2S5ofqpArhdHJTllcXcParYtvlC7k1aw?=
 =?us-ascii?Q?vsl0Nl/vNQV4SYB01MB8dBOd6FCKhSBqvIPkLeTGiYcQcgU4u7psMf2zLFKs?=
 =?us-ascii?Q?D0x8EW85skPYl5pSem97LjIiGF1au0VvXe8R5Kzu1ar8Fg7GKKLlo7H5X1iw?=
 =?us-ascii?Q?QeQYqtCBOlvZ2DX55ybm91u477JEKJC6xyNwMwGVUgxI45jnE34141wy4v+I?=
 =?us-ascii?Q?zBTEp2j/f2EFuWD/QV++wlAiwMG9E929k9Iv+kEu9jf+0EnKN0A0hL5ZRBsa?=
 =?us-ascii?Q?lEpEOw1l/qUuuzDWGjOHSK6VqMB7VeSjtkc7SXYiuAOGWwqLpt9dL540BV+3?=
 =?us-ascii?Q?72qdNNW1KVr8QonrHgkO7MWL/z+QsT7nmS+nBTTsScQWnmp2bL1YHBgz/9wn?=
 =?us-ascii?Q?kMb6iqb6ihFGF64YE8qN/ZAuhiIi/YGDqli+AjJm2f88Pw8az9vC0P/i6WKY?=
 =?us-ascii?Q?pUCNS9teBuTjOsaaX77uwtpJVEX1Zcec9uuPG2W5MSZf10jZV5mJ7/7KhUmQ?=
 =?us-ascii?Q?Z3LOoC+761rKm8QOwu+5rUepx+z8KSxkPab4hWBibtXMDuo4/9vd5S665E03?=
 =?us-ascii?Q?QCiPVugsUo+CU88/jy7hIhnV0OUxf6P8XxbH1j19mhI+RBTET83FMCOmrOsI?=
 =?us-ascii?Q?NXXXGJ9MSbuquGS63+2Hs4AMJdNoS1emZr8CUy9S0htWtEzPkpvmfSAr36/9?=
 =?us-ascii?Q?Ik8cH+SvAhqzItvmU0JIUYp4ZRMFmOwk3HT/vwNyxtyafBA59q5rdHo6OqY/?=
 =?us-ascii?Q?KJAP+sCLw8SdjzvuS7tf/ohggmYSGFQCWpZ08DVr5i8+VuBNjZRy83bNxNV+?=
 =?us-ascii?Q?jArpkmHgDAUwAxxSiDeR869yX00LJi9p/4H74wjyH5aX7CP/f8x6h9x+eQtz?=
 =?us-ascii?Q?5JRvadw9oK+VvoxaJfoDPkiDWfHieFioqjYX?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(82310400026)(14060799003)(1800799024)(35042699022);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 14:09:08.8521 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: be6e6f45-0b29-4a3a-b69f-08dda1df0aec
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF00009529.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8977
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

This patch replaces the panthor_model structure with a simple switch
case based on the product_id which is in the format of:
        ((arch_major << 24) | product_major)

This simplifies comparison and allows extending of the function to
accommodate naming differences based on supported GPU features.

Signed-off-by: Karunika Choo <karunika.choo@arm.com>
---
 drivers/gpu/drm/panthor/panthor_hw.c   | 63 +++++++-------------------
 drivers/gpu/drm/panthor/panthor_regs.h |  2 +
 2 files changed, 19 insertions(+), 46 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_hw.c b/drivers/gpu/drm/panthor/panthor_hw.c
index 576cda231c1c..421f84fde7d0 100644
--- a/drivers/gpu/drm/panthor/panthor_hw.c
+++ b/drivers/gpu/drm/panthor/panthor_hw.c
@@ -5,40 +5,6 @@
 #include "panthor_hw.h"
 #include "panthor_regs.h"
 
-/**
- * struct panthor_model - GPU model description
- */
-struct panthor_model {
-	/** @name: Model name. */
-	const char *name;
-
-	/** @arch_major: Major version number of architecture. */
-	u8 arch_major;
-
-	/** @product_major: Major version number of product. */
-	u8 product_major;
-};
-
-/**
- * GPU_MODEL() - Define a GPU model. A GPU product can be uniquely identified
- * by a combination of the major architecture version and the major product
- * version.
- * @_name: Name for the GPU model.
- * @_arch_major: Architecture major.
- * @_product_major: Product major.
- */
-#define GPU_MODEL(_name, _arch_major, _product_major) \
-{\
-	.name = __stringify(_name),				\
-	.arch_major = _arch_major,				\
-	.product_major = _product_major,			\
-}
-
-static const struct panthor_model gpu_models[] = {
-	GPU_MODEL(g610, 10, 7),
-	{},
-};
-
 static void panthor_gpu_info_init(struct panthor_device *ptdev)
 {
 	unsigned int i;
@@ -65,29 +31,34 @@ static void panthor_gpu_info_init(struct panthor_device *ptdev)
 	ptdev->gpu_info.l2_present = gpu_read64(ptdev, GPU_L2_PRESENT);
 }
 
+static char *get_gpu_model_name(struct panthor_device *ptdev)
+{
+	const u32 gpu_id = ptdev->gpu_info.gpu_id;
+	const u32 product_id = GPU_PROD_ID_MAKE(GPU_ARCH_MAJOR(gpu_id),
+						GPU_PROD_MAJOR(gpu_id));
+
+	switch (product_id) {
+	case GPU_PROD_ID_MAKE(10, 7):
+		return "Mali-G610";
+	}
+
+	return "(Unknown Mali GPU)";
+}
+
 static void panthor_hw_info_init(struct panthor_device *ptdev)
 {
-	const struct panthor_model *model;
-	u32 arch_major, product_major;
+	const char *gpu_model_name = get_gpu_model_name(ptdev);
 	u32 major, minor, status;
 
 	panthor_gpu_info_init(ptdev);
 
-	arch_major = GPU_ARCH_MAJOR(ptdev->gpu_info.gpu_id);
-	product_major = GPU_PROD_MAJOR(ptdev->gpu_info.gpu_id);
 	major = GPU_VER_MAJOR(ptdev->gpu_info.gpu_id);
 	minor = GPU_VER_MINOR(ptdev->gpu_info.gpu_id);
 	status = GPU_VER_STATUS(ptdev->gpu_info.gpu_id);
 
-	for (model = gpu_models; model->name; model++) {
-		if (model->arch_major == arch_major &&
-		    model->product_major == product_major)
-			break;
-	}
-
 	drm_info(&ptdev->base,
-		 "mali-%s id 0x%x major 0x%x minor 0x%x status 0x%x",
-		 model->name ?: "unknown", ptdev->gpu_info.gpu_id >> 16,
+		 "%s id 0x%x major 0x%x minor 0x%x status 0x%x",
+		 gpu_model_name, ptdev->gpu_info.gpu_id >> 16,
 		 major, minor, status);
 
 	drm_info(&ptdev->base,
diff --git a/drivers/gpu/drm/panthor/panthor_regs.h b/drivers/gpu/drm/panthor/panthor_regs.h
index 48bbfd40138c..e7a81686afdb 100644
--- a/drivers/gpu/drm/panthor/panthor_regs.h
+++ b/drivers/gpu/drm/panthor/panthor_regs.h
@@ -19,6 +19,8 @@
 #define   GPU_VER_MINOR(x)				(((x) & GENMASK(11, 4)) >> 4)
 #define   GPU_VER_STATUS(x)				((x) & GENMASK(3, 0))
 
+#define GPU_PROD_ID_MAKE(arch_major, prod_major)	(((arch_major) << 24) | (prod_major))
+
 #define GPU_L2_FEATURES					0x4
 #define  GPU_L2_FEATURES_LINE_SIZE(x)			(1 << ((x) & GENMASK(7, 0)))
 
-- 
2.49.0

