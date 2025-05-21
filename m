Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D4DABF72A
	for <lists+dri-devel@lfdr.de>; Wed, 21 May 2025 16:07:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED2C110E7B3;
	Wed, 21 May 2025 14:07:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ovY1S0+z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2042.outbound.protection.outlook.com [40.107.244.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE56110E7B3
 for <dri-devel@lists.freedesktop.org>; Wed, 21 May 2025 14:07:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CU/ZpgDPrRLwwKHbu/5ZkcDdwOq8nB4USUk5gh6SEjThaMQKrmWMOfowPoE3OCPNByuOd1pbEDFWVU2p6chWnYe9wv+lPlfqRGhQGOAqJYISkQd+zSbed5OKdQLu6MdnBTv2WZJJHhdCVBSY+uOmXmtnfmAh292Cr2cR6gy15GTZ2uahDtQfMuKaM6C2RgulcNhw32GvH4cw1N5IGgg2u7VvFVfleWONxjMDVFzWk/CWeeOU5cBEZbBic5SUg2tWW9bqc00U3vRQHF2g141Mh1uxU5vpZQ7EFUBwmYxJEoF62g1xAmNbYjHabOaq12OwXl4LSH7VLXR/UnNJUDMcYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bfYglIx7aN2zR3opEhHypO5gxpNUOoyY3KMqw/Vztxw=;
 b=ZHjR74QI8P+RDDzNAQ2GKkJ/9PCxHGa6dyD+uBAvq/Sz8JnyDs5tEBZQv476y3WSYXSSIBEAfLozYNkffPQe7gqbSOOnZThYy02YBvPol1WPYvKPTXZeq+wWB7rmZMfMUCgMVMWE9qLxvm1A0XLYLflKL8yWH/dt7p3bqZvAAAaaJRjuJ2OGIrakLpyoVO7txeityYOuve3ZrSs2ODfYDMvLb66r4dGb+piKD4/NmX0y8WIyGHFcg6tLGc5qFBdM+G5BzWq8CE37snvypUrlCocbi0KqroGr3n+hputVjkk4iqHtHSf/w3ZM8cyTEwpkVy87tCDfS7iRutaq0Xj8tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bfYglIx7aN2zR3opEhHypO5gxpNUOoyY3KMqw/Vztxw=;
 b=ovY1S0+zyPZtkgGkh6Qh4R5xJ1xuPXz9qNX7jnnif2ZdyFIqyWdWQZ95mhVy3mt0ZyKUro1LLbACvd7UXSSX0mAQus+qtigETFvZCkeK4FixVv5WJXO8HkoagjkQeFpVylUJqByQ1MaAUdwpq2oc4uawyXHkQLcsiSu7k6F+2mI=
Received: from BL1PR13CA0259.namprd13.prod.outlook.com (2603:10b6:208:2ba::24)
 by IA1PR12MB6282.namprd12.prod.outlook.com (2603:10b6:208:3e6::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Wed, 21 May
 2025 14:07:10 +0000
Received: from MN1PEPF0000ECDA.namprd02.prod.outlook.com
 (2603:10b6:208:2ba:cafe::92) by BL1PR13CA0259.outlook.office365.com
 (2603:10b6:208:2ba::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.19 via Frontend Transport; Wed,
 21 May 2025 14:07:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000ECDA.mail.protection.outlook.com (10.167.242.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Wed, 21 May 2025 14:07:10 +0000
Received: from fdavid-dev.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 21 May
 2025 09:07:06 -0500
From: David Francis <David.Francis@amd.com>
To: <dri-devel@lists.freedesktop.org>
CC: <tvrtko.ursulin@igalia.com>, <Felix.Kuehling@amd.com>,
 <David.YatSin@amd.com>, <Chris.Freehill@amd.com>, <Christian.Koenig@amd.com>, 
 <dcostantino@meta.com>, <sruffell@meta.com>, <simona@ffwll.ch>,
 <mripard@kernel.org>, <tzimmermann@suse.de>
Subject: [PATCH v5] Add CRIU support for amdgpu dmabuf
Date: Wed, 21 May 2025 10:06:46 -0400
Message-ID: <20250521140649.4058526-1-David.Francis@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECDA:EE_|IA1PR12MB6282:EE_
X-MS-Office365-Filtering-Correlation-Id: e841a0d4-5f0e-4f83-f7de-08dd9870c774
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?q0P+pvk2DWtxylf0NCJjXmktuTbscj/NepX5Tn3GZS/kisANk9aiSKp6rhhC?=
 =?us-ascii?Q?L7lc5o8roYCF0/It+85ovnSlzfnkdstMgsMo4TV4wllyR3465WODe44pbWfV?=
 =?us-ascii?Q?DM09OS8vIB9cI+Q2ouhFai2t6mLQK8K2RO+CRIeY8vIpbYUeKKn2Iq2PEZtN?=
 =?us-ascii?Q?5xKqOeQNDVd9Zh75L51BWz+hv33h+Sig56LEKyFgyhuYciEkT+m2/CpfVlf2?=
 =?us-ascii?Q?TciFQesGDHUdWKe5OGdI1evxXF4ff0SoAU6BF3M1bgnfQmXewtqBicCH8dwM?=
 =?us-ascii?Q?ZMwZtQ57s1zPXZ0rEcTfKmsdTHhcjrADW2gvF4WeqKPiiPsnbwKUbRza9663?=
 =?us-ascii?Q?iadmQWRuPokQCldyxieYB3EwNQyqhFaEnzqLrOD1UUIpIkYdTYRP5cr/eVSY?=
 =?us-ascii?Q?jlCr1E3bB2mJK269WoQaG9/XcZBcSfPcIyCWFfa6RETs3duCEcOagVVxk8/A?=
 =?us-ascii?Q?WcCnD9t/j1rv6leRuE1pzal4v72DdI7EZPqGjwuU1kYfAUeVctINrZAqQkVh?=
 =?us-ascii?Q?JW18lRIVi8v/eKU7yERpdna88h9um9lC2zlAdela/QkVG50h/KSOBNrQIhFL?=
 =?us-ascii?Q?uNGaN/d4IFaxNbivNf54VmqCNc/V/5OYhJCU9V8STDPuNie5yYYfpOj9VMbI?=
 =?us-ascii?Q?Nhlp6V18iK+d00Gndx/MovZeaIhg7w9fGvHoVqSIPuoHF43XHGcPZV5hkRi6?=
 =?us-ascii?Q?DEeQZk4YQ565Kpv0Gi5kvix7Ink4onT1NDM+zxn/GACakK1ihafq2FHN+ZUl?=
 =?us-ascii?Q?rtT1WNHH7EpFXFdqAC2l6hQBItrtb5yc05ftRSg4w9gzAngO6GD7OGd60GU7?=
 =?us-ascii?Q?zbwv0HQi5c//OHltVszi6QvPhaEDEwtSIhmrRNdqPI0hPtkzaP61+jCJ9WKk?=
 =?us-ascii?Q?CGrpd5OHrhDEn9ttW4IvykLBunByFpaqOq32TBQn/OwKrPwOTfJwJqRdnRCE?=
 =?us-ascii?Q?bwTfuZcL53jCnPMoHzwrsPTUleXDT6NIxr5ttNUykPnuFlETQEXcWfUKEueq?=
 =?us-ascii?Q?vX1EAF7cZRTknMBwqhc93+QEsRCw+7kUx62XAjjDtOhsBh6H+fBHWXR7O4cX?=
 =?us-ascii?Q?U6INHYWHmm+5lOIa1SbIUkPAM23e88ZdJyGlmf5cmmBsyAsXSF+xTfEmTUp5?=
 =?us-ascii?Q?YwQJMP3U3LB+WSlkDO8hxq2VXrZRVqNdBrMZ4/KEa3V2i6ct+XK/5i0Dgh+c?=
 =?us-ascii?Q?UVdVKRwGf9kM1yBTVVBwwvPmlbILxlO0AgwiH6CiNEGKVPVRXuN9Qted633O?=
 =?us-ascii?Q?UL8iUsokwSDQnanhaEaodMhdHt67v0Elva1+M1FV/ss/kNLBI+q0XkE4Z+zR?=
 =?us-ascii?Q?dP1gQoN53xE0jQQvvrp+hEE4R5ij4XYTi2U4DCtrfywOsiDX7Lxl8b8scoy7?=
 =?us-ascii?Q?8569GQRj/l5a3AJa7oc0S+C5w384hl5r8iHPme9j2F9xu8PXd0TVJaUOH58r?=
 =?us-ascii?Q?zbDxJ8AmP1URWaXeuJk3Dj+RmY/Nxwv3U0jpV/UzTQz3tHzh9ZFICtVx5rlL?=
 =?us-ascii?Q?j1fMPjoOcGyoi3LMzc06ljN7g9B1MiB10rZ8?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 14:07:10.6102 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e841a0d4-5f0e-4f83-f7de-08dd9870c774
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000ECDA.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6282
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

(previous patches were incorrectly called v3 but were actually the 4th version)

This patch series adds support for CRIU checkpointing of processes that
share memory with the amdgpu dmabuf interface.

In this v5, the drm interfaces have been changed from creating buffer objects
with specified gem handles to changing the gem handle of an existing buffer
object. This new ioctl (AMDGPU_GEM_CHANGE_HANDLE) is in drm_gem.c

In the accompanying CRIU patch set, the sockets used by CRIU to exchange dmabuf
fds between restoring processes have been refactored to be created within the
amdgpu plugin itself.


