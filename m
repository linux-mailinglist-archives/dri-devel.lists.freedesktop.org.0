Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 199D0A99BBB
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 00:55:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08C3810E429;
	Wed, 23 Apr 2025 22:54:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="KdjuRr4N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2084.outbound.protection.outlook.com [40.107.93.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2DAA10E1C1;
 Wed, 23 Apr 2025 22:54:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DBjV5NHE0iymmin/zoID9UviFI4r6D8XYhia6rI1aRpKJcp3gAmxThlWlouN6JMJQ8smuqdPGgoXRac6Ky7aUsoF30SC9jck2iEAvGONUOY4uvfSCTfSURmk/hcInu3lBbgHlVyNJLLYYOdzxs/Q2ccsjUIGubwsjV33TZSPh6hpQbFAF1G6+nAxQUMy3Zir+egRoiS6bFSpZi/UHc8sEK99p2xzb8LeCHiVk3PsaK1Hq+ux56vU8LCoGwxoAOy237xDK3y3ZE7Ip/E2NRJ1v9IxVfedTKpDHGSxjiMO20+yhVXoDUTW9qgvSKTSqM69rldqMtnXfmYtZD5BL2hqsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vn/7xngvD0SWf3nfsQB8a+oAaQsEt0ym3UOnBNLAWfQ=;
 b=qjmTWhAo3AcGSoHoVa/WvFc3l6mg0bqI2hflhisNHhC2lWemkBs1oq/vL4L19/K6thAgTLPC/oBYAkJQlV1/eL6xg3WBuOlaaJE1JM8bAo6A4xtdUtXOYKd7W5aKsm++mWWoYted7+KgRI3l/g5Z15vZ2PnsSu4md9M/fOiWE6kNlxslzjxBhgPvZRE4XlA0eK+Mi4pamjcxBfY4BMxNDyP46maRmhRdDpzyTFG8dHyphKaWM0n/vVcGNPUHUKFQTKlj5Bzuq/yAvMcRmB4ChkP2Fg0bemTg1NEJAx/AR6N0ERPLus8E5xcTFEk3q2WvkYnLKaEifGbm2xXoz1Op2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vn/7xngvD0SWf3nfsQB8a+oAaQsEt0ym3UOnBNLAWfQ=;
 b=KdjuRr4N7CGa1M0dRp/KH75M+jCvN+L1/w9gt+ozmy8RtDqnfn2668QI/7BWZpSNrPKiTdvID8Ry7tsSe3aOzxY12nx+OyR3TZHQ1dAXx4Ni3lF6mL2k4pHfI7MSLZzBxBZqFp+lZ8DG4bqqqJKCtqxt3/60NkhSW0Dj5NL31SxArC/Ccd7l9EHNDccDp1SfJ5dknaaxXrZ0BnkMauyb415hbiwSBlkAN9X4bGSVWs4FAZ/XpmIJMF3q4/LmZdxqrLiajJOTesemPOTnzyyRcDCIuc4cXkK7hJ9gPt4hXWJzhfGDGca9a1cYJQBCbTb1QHpZ8uEH+aPJdKaXdA7oMg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by CY8PR12MB7340.namprd12.prod.outlook.com (2603:10b6:930:50::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Wed, 23 Apr
 2025 22:54:17 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%6]) with mapi id 15.20.8655.033; Wed, 23 Apr 2025
 22:54:17 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: linux-kernel@vger.kernel.org
Cc: Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>,
 Shirish Baskaran <sbaskaran@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Ben Skeggs <bskeggs@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>
Subject: [PATCH 0/6] Additional documentation for nova-core
Date: Wed, 23 Apr 2025 18:53:56 -0400
Message-ID: <20250423225405.139613-1-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN1PR13CA0009.namprd13.prod.outlook.com
 (2603:10b6:408:e2::14) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|CY8PR12MB7340:EE_
X-MS-Office365-Filtering-Correlation-Id: 2103d322-4ef1-465f-cb37-08dd82b9c680
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?tMGFP6Xs10KNywdAsNlBcowV06614sIew6hyJ7h4ieY9oL//VXwrqUgQkoTV?=
 =?us-ascii?Q?G+bvy0gDqL/Ne12bS4aZsFH0vCnLhsntF5TFvG9UeN60Y/3mpotWpQbQFwOa?=
 =?us-ascii?Q?pfflh+PzIu4nqgX+VYucjHZPNMrjU8XGLrxox7QqWxyubwDAFHN+a3hHKkeU?=
 =?us-ascii?Q?Zs30qC1sqYt0JRAtYLklj5krWyODwbtnlUG2+M5oHrOEMIeHfgXiT8EweNna?=
 =?us-ascii?Q?KbaN5Fdckpak1mODBX5b1Uk4CX1CkhmC6YBotzuXHW7SWqExzdR0f3iijkfY?=
 =?us-ascii?Q?lSiXOZlUPKiE6lBw2sJU6Fsa9F3XZI8x6DjSsURt9H8hm7lEvP0mUNEJ1dUv?=
 =?us-ascii?Q?eJNtkVNUU7Ab+sjxqFxX0KwgCvF+UDkropSqyKA7MNIr+rxzK2UnFw31IIEN?=
 =?us-ascii?Q?Ufq9fsrwFopHVD8kbnchEdVyvKgu0D4a/VjSGyResZhhRykqcRvchng2GNeB?=
 =?us-ascii?Q?DfaEypEjIUcf6iEYCkyYnnMezmSde6yQPI1O2/lV4Dn59p0M+/S4c0LG0+Qu?=
 =?us-ascii?Q?o6LbKaCLBo72GzRs4T66NeG7XMIwFcP+IaLa7PBN3olwmgztUr0dBfDhafPx?=
 =?us-ascii?Q?Xj58pkbZh4fs28w/e57WP0BczsGg7QJ5EcOnCiIwT+Uxk29gPuiDTmbmSJ1e?=
 =?us-ascii?Q?+bDonJOntQoBhd/Ir1K9vdmT4rBxRTRwvCyQoicV+QA88x8dWTXPOsB0dvJL?=
 =?us-ascii?Q?WHzUn3XuT+k3VykXge6fOYjvj8CWwF5aTPwnMfH3RcxcOuoFIwmCh9Ul8NB0?=
 =?us-ascii?Q?/bc3kuZ/eaoPoyPEMALMe0hbZa3toTjLMu867dEaKs1CORCOpbhZNrn+P7MX?=
 =?us-ascii?Q?PC2pUZYcybMVERYOJHy4DOeN/LQfbC+nZufz+5JirkMleYpNQpClPM9gvLNL?=
 =?us-ascii?Q?SKBginTNZ+2u96lSuCHQGJQH2FQ+bn4T8aGRcFQJzFlJeS2V8YALtGNnw1D1?=
 =?us-ascii?Q?ZAGotlKKKwzL4RLpst54Oh4hK5c+CS7anvlDSi9uPreF5swi4PVtzSiDF7WZ?=
 =?us-ascii?Q?y0eqMGWEkweI9S+MBtMty4xFucm8AgDb4taPxsmWT3jxSPvEIh918esP9h4n?=
 =?us-ascii?Q?9bWTN1IDNdk+MMRrJEZ7EWISY6qa6i3HBUztD8yxcczlqzzG0p8BFCcN4Mmr?=
 =?us-ascii?Q?gWRGowyVlLl43sBcUHNURo3LohPCbLclwsGCJdZxtlETuL//ieNckjODuXo6?=
 =?us-ascii?Q?jvtzKjQAwyBWPddIN3qUa2hPNy7f/tNCwYE7aAbbt1oqI0Aug84GgUa/juc/?=
 =?us-ascii?Q?yZ0JPK1I/K+rhVhnpKk+/ZTnKrKzhucbjR94q8n4cf0a7k3lUR3k3IKIRRy4?=
 =?us-ascii?Q?XWFM9QQ0Vdn57EO5N2QwRGI7GBsw9ELnyY629E/PEQ9kQ3KvSZYQNdrRrgs7?=
 =?us-ascii?Q?YIm3Lydi76NIPq9ul2293RokzhgdKq4qOniuqyx7/wpdpsCCM3gHqjPbvEwK?=
 =?us-ascii?Q?Lpkt2bOb+uA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sw7inpkdpIxxW+XyV5fc3gH7ZXsvhUnVI4RaGuOeeU8P07GNhaLyIRoX2qpF?=
 =?us-ascii?Q?ouAc2U7/N/rCNSCrNIEDwKQ+yvto3J0Zr8225DOFA8lk0EvyyFyRpfla1eRl?=
 =?us-ascii?Q?pgYaMLh/sYA19eSxwQoSZT/3PPMoQ0aCyR+BOXtMPg1OoOJ68aJy8H6K8+/+?=
 =?us-ascii?Q?h8YkzMF7fVtm+XgSgVMPo3i0Q6xeH5EaWZComD9H1ZnWzr5IFWNpUYe0ffcL?=
 =?us-ascii?Q?Z+2cqcMtv7o0508fr01QAvB99/iW0iAAdy6ICPLr1rXJnSo9nPSaJJxiVYdK?=
 =?us-ascii?Q?gR7q+WAZ8PfIu0uBrtnrzh8yvj2CPi+IXWGX82y/lP3RZIHpe/lmRFAdGzr7?=
 =?us-ascii?Q?OG1vGIMu4ftkYS8wrfLONbRy0fvWD04H9J2PgfdmAhW+xvmMJ4+gP+DtqRnx?=
 =?us-ascii?Q?9Z1bIObmziTfZm3zGP1bLSHBbtVICAdKHxZKoNZdoHeM/UoYAs7DqOfutwQu?=
 =?us-ascii?Q?I5DOL39+S1L2FtVDdMYp89p1nqRqkO0/Hv8CS6pdnibsBkggNsDwAYK4iFdl?=
 =?us-ascii?Q?EFbbrCiHyZVQiSHi5KWd47TlZWuxXhOQW58Ptzny5RjZ9SiM0CciYPm/dmLL?=
 =?us-ascii?Q?bp5qUG+/tCMcKjSmTDy+jXtvfPTIxvSvbG+Sv6qoeQ1p8HHnPXJ33ZmRFtZS?=
 =?us-ascii?Q?AFxqFGXgi+dA0Py1vS33kUKhHCA7Ay/8wax88bsx6tMt5aBjaoAW9tKwNsg0?=
 =?us-ascii?Q?Cw76P2MpN9/AUBwSHcvDl3oXlwaXYu0gqoUMAusYNRWUEick4qfbIpNPTpJP?=
 =?us-ascii?Q?+ERCA9aAdwSf96DfIuDEFGbp+Zg3tYxJgwDzmuiB/52gJEBHLG4ooJxZHhL2?=
 =?us-ascii?Q?CJd05LxL/x2b/9WEloKB9vRLVR3xy5hA24HC/9Rp+wnve3ARV/UPRyVVvh4R?=
 =?us-ascii?Q?A6d8hyevRMggolWNH/HWbemKy92LP/Bq0JHbSEcPnYvwPP7uW/uepfs4Iv+D?=
 =?us-ascii?Q?OyWWUBGJtsE5xsMaej1hlc63d2u6iKHOTQdZrSTWz5OT1KOUCzelCK5YQOna?=
 =?us-ascii?Q?625gexo2J4ELwTa8JmnlNtAI9SKZtNo3+MPmmu1vFYe/JUKK4b7p96na0G2H?=
 =?us-ascii?Q?DVBe7Bagw+NEqik1UU8Lm++z2YX6cvn0k5Hh01cwDpkK0KHCLzWByx6MHpPZ?=
 =?us-ascii?Q?/XVDWGMXYRPXhT4RbC6Cha8cfq0mensUvT83iIoibSVKBd6Tdeb08xSkAPsm?=
 =?us-ascii?Q?P33NP+KeTsHNa8J1NIRDcLd0kVIZT58unBICWptVPmNntggxsi0eTwbOGyPG?=
 =?us-ascii?Q?2Jlkyb9kje+2gE3fQX0JnMl+7ZIAdLFjdTIHzMZIOJes30XvGmFsalpHxz3G?=
 =?us-ascii?Q?lBourpkeMhamee1i/HL7SGzRwgidBtsVTZPZojllbyEPjfAxCyM8rMpm6bYH?=
 =?us-ascii?Q?KDZNuki8BNjNJYbtNEEP20cQB2eV06368Uv2B5Y16lXZg2SaslUdEOr4ZmdW?=
 =?us-ascii?Q?0ZBHGOuF7sBuho8HqP4axha7xOnjpfGsg3KQzqfP8NN/gQHJPFFmanmmuArw?=
 =?us-ascii?Q?CWFVJxyB57cz2su0i9ZNRx0ml1WRl3fm4x1D2QT0qo3x4Bi3N1cImK0hV0iq?=
 =?us-ascii?Q?2mhqGwgL0LHK1wijfBY9976TuOg7zoJGCUpJ85Xl?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2103d322-4ef1-465f-cb37-08dd82b9c680
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2025 22:54:16.8991 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oAvuMJL6b5US+c7NguePPTUgCjJL/tN91FE2jf+L5EnHihx/TJSHmTVZKK8U7CcJ9mBRAss19ViheYG2wZDxxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7340
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

Hello,
Please find in this series, several clarifications, diagrams and code comments
for various things in the nova-core driver. These are essential to develop an
understanding how nova-core's boot initialization works and aid in development.

These patches are on top of Alex's last posting for GSP WPR2 [1]

[1] https://lore.kernel.org/all/20250420-nova-frts-v1-0-ecd1cca23963@nvidia.com/

Joel Fernandes (6):
  nova-core: doc: Add code comments related to devinit
  nova-core: doc: Clarify sysmembar operations
  nova-core: docs: Document vbios layout
  nova-core: docs: Document fwsec operation and layout
  gpu: nova-core: Clarify fields in FalconAppifHdrV1
  nova-core: docs: Document devinit process

 Documentation/gpu/nova/core/devinit.rst |  54 ++++++++
 Documentation/gpu/nova/core/fwsec.rst   | 173 ++++++++++++++++++++++++
 Documentation/gpu/nova/core/vbios.rst   | 155 +++++++++++++++++++++
 Documentation/gpu/nova/index.rst        |   2 +
 drivers/gpu/nova-core/devinit.rs        |  36 ++++-
 drivers/gpu/nova-core/firmware/fwsec.rs |  17 ++-
 drivers/gpu/nova-core/gpu.rs            |  11 +-
 drivers/gpu/nova-core/regs.rs           |  17 ++-
 8 files changed, 452 insertions(+), 13 deletions(-)
 create mode 100644 Documentation/gpu/nova/core/devinit.rst
 create mode 100644 Documentation/gpu/nova/core/fwsec.rst
 create mode 100644 Documentation/gpu/nova/core/vbios.rst

-- 
2.43.0

