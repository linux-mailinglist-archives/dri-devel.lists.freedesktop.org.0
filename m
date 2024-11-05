Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 354619BD455
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2024 19:14:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81B0410E5F8;
	Tue,  5 Nov 2024 18:14:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="D7hUEptH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2089.outbound.protection.outlook.com [40.107.220.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97ACA10E41D
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2024 18:14:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HmVLiaP0f+B4wSR9gQcNbjbfMFiILIjgN3605gos/66sOHFBqfy1QhR7ACPVNJPoN2Fcx1d5V9MV60RU04XLDw4hJev5g2lL0F19fqIY9UIE1rhptriGDcsiNnna91Uco1IZsJfz93ksiQs79+4ELv2qCVbxw/6xYQocX9Lhm59+K33YQ7M884r+iIFZasAMQAzzv571jEMnE5HBA/kb5Zw8YRJG67PmYRyjigSajvMIFvsiW29A9r1hz4yT8xulc65G//7h3PvnCyHfsjwrFehmnPCi07rZucaGonOSxevwCBsFixVkE+lVWMubxXsiGwfGBXtZFUZrltp+3VRLZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hZRAsBF/hB+2RjZnuVMNjcyzwXmeoBj+JAVBiTJDpvI=;
 b=Wg6GOBHCML6CpSEvXws7osPn13M9jl5FSg8HS31SJQGWqeSBGMwX2XuB43L718Pi5KKjT1GXbXvAt3nNcp/BnaaMyFtDBSk0b9iJA6UfdsJUPt1gTLCMs8jYmZ0oPq1ZXUzMAcYUWRz8nCXNijYRtfCEat7lGixk0TO0lRoykp+cIPv8fhISwJN8tcmZikw3RDoaozIUPE/jmEVAtEJ5R1Awj4axDhhp4kgsyI+IKCGdSLJh4KcOrkQgy8P8VdZKOz7mgm9/5cbrDVAmgQ2bPHY66o+ukKW++hrlPcDQ+5u4/o/ikdKwMeMgd8HFZG6xQxgPyAgm4VYDNAdjI4Z+zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hZRAsBF/hB+2RjZnuVMNjcyzwXmeoBj+JAVBiTJDpvI=;
 b=D7hUEptHCCrBs0SnpuWtf5CquSz9ZUjrenU+t3Uqzwavs7lSpZT0YByJ0f73PQTAFM50iU/t7T1SFtUC4lntkmYX1UuIQRujMI99k9XGu2MNxlOLVFtNreqaRMUoKSEtZF6ig9Uy2JFlAbo1Jru0CL0xfrZkrVsAkHKttAXUMfZbfaik3Ay7Vz9VEpXwJbuynCSHCDwLPNK0eFh6RYW9pGqbiFTlL/CCyS3UsOOcGTtiqNYGjT5NeHd8Kmn6zbLNoNfgFgpAss2trie1OU4JAWoNAJnw4BBr4yme+Xg41MJikXc2G03cCH+T7LCeSJ1Q88HYi1dlxu1mpNkuIH5iKw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by IA0PR12MB7508.namprd12.prod.outlook.com (2603:10b6:208:440::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.18; Tue, 5 Nov
 2024 18:14:27 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.8137.018; Tue, 5 Nov 2024
 18:14:27 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: iommu@lists.linux.dev, Joerg Roedel <joro@8bytes.org>,
 linux-arm-kernel@lists.infradead.org, Robin Murphy <robin.murphy@arm.com>,
 Will Deacon <will@kernel.org>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org, Liviu Dudau <liviu.dudau@arm.com>,
 patches@lists.linux.dev, Steven Price <steven.price@arm.com>
Subject: [PATCH v3 0/3] Remove split on unmap behavior
Date: Tue,  5 Nov 2024 14:14:23 -0400
Message-ID: <0-v3-b3a5b5937f56+7bb-arm_no_split_jgg@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR05CA0064.namprd05.prod.outlook.com
 (2603:10b6:208:236::33) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|IA0PR12MB7508:EE_
X-MS-Office365-Filtering-Correlation-Id: b11e076e-bf83-4800-763e-08dcfdc5af61
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+kxnLPdyS/UNWfkcxBKY9J8CD33zn/tqaOIrvQvndtbluNP65Hd+32813UBN?=
 =?us-ascii?Q?s+jfrFgcznOSAbO9Z0cIx269NFXNW8Wq8fDVlXQbJZWaqztmwXasxc7uaaca?=
 =?us-ascii?Q?PSNhbbh4HZ37RsDwuEI8KQNxR5PqPaflkucYvX4c4jzLiJ5CNwhj8SrcrW39?=
 =?us-ascii?Q?p3a1fYMHAliQZMwvYymXsreNQrayadXqDxc8xXzP2l3vY2mXFjMBQZhSagDj?=
 =?us-ascii?Q?dYk+s22TMlw460pE9xLwf+P9kDXZrU3wTLe/knQdc9IiUf2nctJUSeya8Get?=
 =?us-ascii?Q?MrEl4oAN7/O8SPkrPusNaZGKyBs/n15KXUTCt8i85RY6ddWekAZlKwvJ82Pm?=
 =?us-ascii?Q?6VwVYZQDsuNYz41iW4aLwT1JP1o4aW1fNz8JoEEkdW4dtwIVXS5MXaYwdqsP?=
 =?us-ascii?Q?OnAKvcNjJOcweoBRImoZNUHuxg9nCK9Fg6mn/XnQqpyAP90fjmtt49T8977j?=
 =?us-ascii?Q?s0DVaVdeUC8XO6OUmwqUdUmKvObm1F0K24+X0wcB1r1IT7WF+wwFWHkHcRrH?=
 =?us-ascii?Q?OlLvwAW7f25qypIdVuPGQGE5WkGvxn2ICMRYmjeWX58Rz+GZfqoYbOH1kAwG?=
 =?us-ascii?Q?rYGUZqnNbRk+46KoBSqkS74T8QSh0oL/2Pf/Eg8ZRSpxVz8FRc8QPL9ipBLp?=
 =?us-ascii?Q?CqlGHkgDeLdrBpLunISO/YTUHPKFUxyZ3PefjA27RSRU4CVM1II6/pyLvo7T?=
 =?us-ascii?Q?bJTpYOU1rUZJFnWEM/h3ai/myS6VQrQkfQ3tPx5Px+GPs7NtHlnZ69VaAYTw?=
 =?us-ascii?Q?XZ0jJl/Lmc7Rz0/ou+Btp9I+mT/1O+K0E0+AVjXd/YIiWCerJAPyn0W4FqTV?=
 =?us-ascii?Q?fpAhXYoEVlNk9NtGjR4MeDRkgA3bDGQpUtsMppG4JzrHUYaPHjpcZ7O7yRUo?=
 =?us-ascii?Q?+H2c4JF8+43tdr3oPXYoGMJxNHs/FgmK1ttn2IBues0miYvDshMJ+T0Py1iI?=
 =?us-ascii?Q?BgpBNT3Hl06EMTx+I9shBfirZfozofALMLbhqj94wkZ5ASZejn7iHC5uA7iV?=
 =?us-ascii?Q?n7Jaox2ODU+WiS9I1IIFOxcfUIA0uG368eijg7zhIZZjBS2cfoeN+1vO/7Rd?=
 =?us-ascii?Q?Qe3K7rd+L5XbF4EYhks7c7xUI+jiLU7aWX/EsOrUKhfresSl1mxz5Ll2M+/r?=
 =?us-ascii?Q?UNsIWYMFnBuVU9VmcCrwe8P0yw8bIdJZkJzMP2nCLvQS6ZvX9+LIvpM0SjDs?=
 =?us-ascii?Q?3GZtudsFlfjdB9tGZnHCoEu++KYNCT5XgXn2/3QxqBx5InWylH769EsFHThb?=
 =?us-ascii?Q?NrWzWPxu4nP5Ns01dfQi+UMrYmgnUK/d92Lotne230+kgeoxpQstZMJywAd7?=
 =?us-ascii?Q?tqqsmYjkyR5/7dMnDcQeJJ3v?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR12MB8659.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Sbe9+UQHHj3SzdwluAdkcq4uXz1evx9+ksHgTX15xJWDXPw11P90oD4usnje?=
 =?us-ascii?Q?2RDmnW0ZH7kq74DYfloA5iSXBDW4xMPov8ABOONjYxXH/bJY6zSGOPienJUk?=
 =?us-ascii?Q?Ca4Dk7yGbQS/KF2t5GaFXWUruEFEmZeyMEShXakcASL49XXLrxQ5oN1DBVF5?=
 =?us-ascii?Q?JPlzp5hPM9qtbATAKHecNR8Mwa6cEsh03/0PeYDG0vNtpghaxToWEilm7y0Y?=
 =?us-ascii?Q?Q/bDiiWIGY1R/hSIdp8b1F7tuxRXFGiiX1eFn5Sc0FEzPz624m4wqAtKr4Yq?=
 =?us-ascii?Q?9M49j8rdpzuIgH0u7JSkyygB6GYDHjmF8ugVZipQEA/k3SLeDkbH+6l/xIHX?=
 =?us-ascii?Q?lDJqL9jT5/Rj1ScNfA4WtCoOJ3uVG/9s3eW00vILyrRgXVF6xkdOMfRo46SO?=
 =?us-ascii?Q?p49aRYfYGWibHJNX9oI6o081IKCyByru4oUvBFJBex0P/wy5BNldbMA/LqzN?=
 =?us-ascii?Q?IXRI5kI0i3vyKGTnvT3a+1SbLO4MNLnDR5GOW/u0KTecrH3ooYb9OT9UXX7C?=
 =?us-ascii?Q?d02hlg0Lz74T4JmOQIa81C9/JrRJf1N4eMoMrJZ/NZjU1a2Ep7z8Y8YYMO2K?=
 =?us-ascii?Q?TyytkON2TqM35ZElEtDkW4wlJ/WBtELvsBfFYmYunLwHBMAc4HboNN5cR6RS?=
 =?us-ascii?Q?yhAcF4zBmw3oKIiBJTTEUcl7HOP0QL7g/RzCl4mN1nb+7IU8RhFZ8YTims6R?=
 =?us-ascii?Q?gGVqzZTu/SPrSIv5TlMrdutp4Gqnx3Ik9XnB8jLlaVftnCnsv7n4A8/YQCgO?=
 =?us-ascii?Q?hiMDwANZRvG1ZTYNl8FVH4YW/i8b6jK/SejNJocpMZFvottlXCN1du+cFV7g?=
 =?us-ascii?Q?a2bCye5FkUp4ivOdRAy8CNG5dqzGERM6PVKa/ArhSnT11+xo9OSdgryPfV53?=
 =?us-ascii?Q?n8XGkUa4gVEbl8jkxhLKpuh3+dC7IJzHA8pLJvfuqc6zz6G2nozy+xQj4Zf9?=
 =?us-ascii?Q?770AYaNUnx/pTDCcP7bhFDgbzDeZhenhKiqlELqNbIopYtz4Z53ntb+OnNBw?=
 =?us-ascii?Q?XLwTCUNyg6nS1G8ofxcb5wFh9nYuk2KDKOdbSKwCiBygidk9OdJnDEWPAirc?=
 =?us-ascii?Q?XYQb7LDj9YXbCUNzwrA2xrt7qoa1NWRHpVlYysMD0LlgfSUivgGMZZmtDtJi?=
 =?us-ascii?Q?N+zuYRSeMgL2FX9rQyqdUBh74uuacJddXSttJaFRRT+FxzRJsUocaJZZTon5?=
 =?us-ascii?Q?lTgI7mEUqMS1czNK9Q5IXe9e/wXTxNVSsi3HvA9uXXjgFjZWkivG3ahZ3gFf?=
 =?us-ascii?Q?WsPTa6FtvGWzRZlrVdcHMAhOz1Lzb3kvuaJIAFwTyl/Rw4ALwIIgXscNA0gv?=
 =?us-ascii?Q?jJNkVsqjqYFK0Ravzw5Vt/95nrzUiYlQqH7dgO+TZgxmrRzBKCt3oY96lfdn?=
 =?us-ascii?Q?qD/chDX9rJbslw1eSnxm5vAx0oRRDUaboTJoT1oRkGy61+UGMQPIhtEEbMBi?=
 =?us-ascii?Q?KNVUIFP9XUCfpGDHpf0eV/tbknlmQcSH5N0wOGkSLTV77OR4XZOCYI4+ACLh?=
 =?us-ascii?Q?FYTzbMTS/OnjBrmjfllATVLOFddc4xaUNOfsphuTS6ogMFrD+50C2qOY3a1J?=
 =?us-ascii?Q?w96ywLZkz1XXSxGUm5U1hlECDGAMlI8lWNzbACZd?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b11e076e-bf83-4800-763e-08dcfdc5af61
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2024 18:14:27.4176 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BnG5UM5u+48PL1fQxDFye7o8rO9t25NkMhaE0cTkDYtnB336hnZdCQpvFm24WdeB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7508
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

This is the result of the discussion on removing split. We agreed that
split is not required, and no application should ask for anything that
would not unmap a full large IOPTE.

Instead of split the two ARM drivers will now WARN_ON and return 0. This
is in contrast to what several other drivers do of removing the whole
IOPTE and returning 0.

The kdoc is updated to describe this.

v3:
 - Remove selftest code too
 - Fix copy/paste error in iommu_unmap kdoc
v2: https://patch.msgid.link/r/0-v2-fd55d00a60b2+c69-arm_no_split_jgg@nvidia.com
 - Use WARN_ON instead of duplicating AMD behavior
 - Add arm-v7s patch
 - Write a kdoc for iommu_unmap()
v1: https://patch.msgid.link/r/0-v1-8c5f369ec2e5+75-arm_no_split_jgg@nvidia.com

Jason Gunthorpe (3):
  iommu/io-pgtable-arm: Remove split on unmap behavior
  iommu/io-pgtable-arm-v7s: Remove split on unmap behavior
  iommu: Add a kdoc to iommu_unmap()

 drivers/iommu/io-pgtable-arm-v7s.c | 146 +----------------------------
 drivers/iommu/io-pgtable-arm.c     |  81 +---------------
 drivers/iommu/iommu.c              |  14 +++
 3 files changed, 21 insertions(+), 220 deletions(-)


base-commit: 8e929cb546ee42c9a61d24fae60605e9e3192354
-- 
2.43.0

