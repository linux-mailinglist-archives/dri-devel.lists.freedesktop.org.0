Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E86AA7E54
	for <lists+dri-devel@lfdr.de>; Sat,  3 May 2025 06:08:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68B5710E0F5;
	Sat,  3 May 2025 04:08:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="mbyImcmO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2077.outbound.protection.outlook.com [40.107.102.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1553D10E0F5;
 Sat,  3 May 2025 04:08:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y0FO5lt4hWXhq4B89lLll8BPKx0HezEYjHjinvzRkJnZdGVVG741hr/0ujy/xICOgGlt+jBdyKVxG2apxzhC1prLQFWPRjUKanA9Wru3fqbIyP62FV135mxqE7rfxPtJhHTU58GKzZ+CkmYTUZPvz45jsowfeHhmpXtdrhuNZ1hXgxDtOVXtB+yn3aYvb3ePSjYTPHwDPYW4zgA3YtXexXqz4c72nF63BielPbduyjb2YNpOUjDK2gABOT91mQZIcUPv7MmT8jhkrwuSGLOoUTMUfgtFuc5ecZ67XqsKFFDpNLIyUteMhHT8WaQJx2XGbq3m1HR57n3FEOf2nxuULw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zcGMy/sMPi8T8LIj2osWYsLoZ6+N2YDYYLnYjVZb2T4=;
 b=TDLsd0AboEde14fpYkvtlwuJABZ6M2X5Ak/OdIbc05njMCaxO3UV/aeGVIkAldcE6WOdOCY2KA/nHIrr8r0k3Ulih1lA+LAN0ZE2+MKYONxSWorN8RvzbF+zZSM9/BDYIhold8cSBMCX3Y3tLVNuz+3L7efUK7XbLv8vKdTWXAfjnYFVkgHJPtZixar43uSmsIRXy3SqccaW77YuQssPXYngZ6SROd3/PSeBHxQ/BLcdrE5WOmyaUsiloso4avGaaIJHREqgb6D888XUz3k4HGMXdt01DGJqT5DggdK7FerPT60I6dZZWEFO0hjQwPo5Bvlke8x10ipTcvg+mRGwbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zcGMy/sMPi8T8LIj2osWYsLoZ6+N2YDYYLnYjVZb2T4=;
 b=mbyImcmOx2wTQfvEvPJ+6TmgXSfr9o7+iCgShwysQ9vn42FSiaKe6Q+PT7WSc0Zol7F+NFx0NDZUs88i0Ij38Jj5sYU/YtIq2Z27GanH6VcPC6aFf1pOXSA8cXLdCRP9s5tWN6Tp4QK9Nxr+Y/88Am7b9B2E7qofGTaJnccaikQ0ne1nfZ97zigr678qs1cUkpuzNrI6Iuwq66slJLMjWw+Q6CCOJuPVJgDpsPyEAIW4zpnMwJOzuN0C41kko+dxCfgD70Zos3a1f89Kqk6J8cABqki3fRFtFvfYckD3rloNWRu/CTvMo5Yr42TOsnlbif/YLWfThvWHqYDmgUXprA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by CH3PR12MB7713.namprd12.prod.outlook.com (2603:10b6:610:14d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.23; Sat, 3 May
 2025 04:08:08 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.8699.021; Sat, 3 May 2025
 04:08:07 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: linux-kernel@vger.kernel.org
Cc: Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>,
 Shirish Baskaran <sbaskaran@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Ben Skeggs <bskeggs@nvidia.com>, rust-for-linux@vger.kernel.org,
 Joel Fernandes <joelagnelf@nvidia.com>
Subject: [PATCH v2 0/7] Documentation for nova-core
Date: Sat,  3 May 2025 00:07:52 -0400
Message-ID: <20250503040802.1411285-1-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR03CA0020.namprd03.prod.outlook.com
 (2603:10b6:208:23a::25) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|CH3PR12MB7713:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f60b839-793e-4a97-5b1e-08dd89f81c1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/N/uR8o3WhCl2T9RcyLZwFwRD860SjZyJZuZJ0vHFdS7/BC1NeSyjuDsvNow?=
 =?us-ascii?Q?qGnEGlKY1hmbbOnk7Lhc1tn5jR3GxWYJ6qHeh+KpEzQfu7eCsOE2kJsh/7Fw?=
 =?us-ascii?Q?IGqEo4RZqn8Ig2UIuur4o+n+N19ojOG65ZwB7gslKs5pNW5FJ38VZyCeBxHQ?=
 =?us-ascii?Q?4cHJsgmuTUzdqgn2wUAXxIf3d+hU2CXwS4Awgu4UmKgyFQ/OpOsGDRzdOubz?=
 =?us-ascii?Q?BR+hoagmg6jDwvppLgJDTStg0HZ35ugf6dJu8nqH7Rp3YiWsrBwrcR9xPebH?=
 =?us-ascii?Q?FLpHPLymeV5lLnhzMm3xjNC8rlKv2qC02mgRzfPHWCliIp6zYUuTtF3G6buT?=
 =?us-ascii?Q?6fZZSy5fyNVTIdIYtWYjHXipEbTDWNfJhFAbnPajLT/MM9zA5ASF06+aqb3J?=
 =?us-ascii?Q?ZGeXkS+zAHdkHDOSqAqQNl59VjHgNiOhYqND/PIYcBR/box4Dt1/63LWlbP3?=
 =?us-ascii?Q?bQDMQoJLEgEuwwNtBUTELIi1y2WDLrW1oi/o+TI7HHNFsu+5MT/Xz0V6m0bx?=
 =?us-ascii?Q?oF09YMo+fOiXLuE4LrkLOmruiykP6xoifk3McKaOvllmu3tulrdItger6BzV?=
 =?us-ascii?Q?QfAxnZ9+hbuzIsDtoJU1wYAK4CV06CwQw2fLe6PQfFsUXiSBGT74O3SVkevZ?=
 =?us-ascii?Q?IAqoP0fVvKxOPPgL+1UsbMnlQBuQ5foF9CU4ZQkCE+iEbLZOlotXJ5TySxqT?=
 =?us-ascii?Q?0m45M8OQWMn+J9pAEQ4CtY5uyXm0zO1+EjSlzLDJqYtKlyJuc3EfXP/cM8f3?=
 =?us-ascii?Q?WiitK+j+OU1m1uNcafBzHXCMpn3xFxVqUk9L7uhmhajoGdUSITnFg5fXdxgz?=
 =?us-ascii?Q?ypRMQr6vrAvb7N2bDYA/Rz/RZAfamxgY2Z9B1Gv/hLNAq/42hafa22CWrwQi?=
 =?us-ascii?Q?GuUlKhuTNM+L+BLW8azfS4IiXsdeqYOvxHMiFv1svPHQ7WrRJHatsx6/iYFO?=
 =?us-ascii?Q?QlNUXQM5JnALFyfL/5dzZRaUrJX4pqow6Dy0awG7gE2JiUvcncJLb/BluQwc?=
 =?us-ascii?Q?M315WPuMlaAqpFZnTB8uLR9dAdgwrvGJYxrbZtoY2jWby2jvLda0vjuu9eIt?=
 =?us-ascii?Q?plG5J6Rg8nNGqZdnlR6vi+4kVPcEmqlS4GidBjkzlhMrjiBV5akdhvKFr0hB?=
 =?us-ascii?Q?za7VXkbn9ks1a/Z4i45xRtQMC9kRjgv7eNhzfcV3vb/w+FwvVJRRwHTXk1s2?=
 =?us-ascii?Q?UjOzgbiJ0lTAMIMh7Q5bNJScoZwx/AA3x/qNiyWWDkAg8tPDZUNaqKJ5KS82?=
 =?us-ascii?Q?ByUF7/tEZrmbdIyB9SgVduj7M0ptKH3MY198/2uHKVFcWvN1/SE8ue17fwR6?=
 =?us-ascii?Q?wYeQNTuzQuc1nF1wFV562okRjbyns+uJYkI8cfWqHCupnRqJ8JiLVSb30N+W?=
 =?us-ascii?Q?WNYQzbotgfq+UJcmhgAHTEYlvvpgmpqnzASJr1ysIKawyTkaHWCSZ3wDrUaC?=
 =?us-ascii?Q?jXWcWhUarR4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?x0S2uFerjygSNXeRCt2ETgJjizABKhUBa0DZ48C6RTRCtCOGYWS9nNzIbwAy?=
 =?us-ascii?Q?X8mGDyrA85FFNGFaZKGJnn9fot4Fp9vO9ShH8q9s4cOoEiBZSOiv4krli1KB?=
 =?us-ascii?Q?TGOnZYOYqXW/yQtfkQ1Ttd+mMRslP/VeR8OFO+310csKCN8xP2dRhIFBSLDh?=
 =?us-ascii?Q?6ywQ7K9Ebng9fUIrG/hdY3bjkd2qv8zTc44r1ZZdA1usCyk2xgqPcMQaO4oI?=
 =?us-ascii?Q?lCPOKZQ9KSN6GFOU8b6i0AtfovPh1fN8hWgaiOy+uyeKNZfKkblMznOZDPuG?=
 =?us-ascii?Q?vXdoMbQITEMqs1slgngZ8uvaqUS9RfPnrzhW4KGIa7KqQj72gn8VxIzkdrzx?=
 =?us-ascii?Q?b217+iD0JxpyZrBN+AbZqGE/nmEOWJ0b5Dc0b0AkPeJWst28SoyxWaVdLoWd?=
 =?us-ascii?Q?Fevw2mNFslNdikfNgpXIC0U9MRbV/PeWzc4nR0s+vpE+6XBi7x32WfJyO/C/?=
 =?us-ascii?Q?s1OFCkczHiY0hxlBFmHgvPG3AemSTyQWwaADlzPAIiRsjsHXHTwghaRR58Dr?=
 =?us-ascii?Q?25TwxfRbo59P9+gQHFuCz1MkPZPlcXSF7AFgLan6Aqoj00T4geXTLTYw9TpC?=
 =?us-ascii?Q?CCE/F3f/PX4j7zLULe3w+qWmSdwwO37yXJd192N+YzOEbV7WSOd3SOMOKgk/?=
 =?us-ascii?Q?GpbK7x4FWIArKSSrLipwq90wPzeR8GqgbKPk7TBkg2MKV9f3d4C+uSgLk1pW?=
 =?us-ascii?Q?Dbym1jcpsRn+3kyHvWSaTA409ADVtC4ayUeW/Ob83lML9plqwT2Qh+TId6XN?=
 =?us-ascii?Q?9kA6a8Xk7794V9YJs9hGMdheCcGTpjXzXHIV5SDecQFgliGifNGTvGMeN03d?=
 =?us-ascii?Q?xNnBpWPLDwF6rzHrL2CFXXgyG8U5JA2ZU10VX/hMYaQKEGdwy9xwVUAGX1sn?=
 =?us-ascii?Q?ITLQnLLZDYHg/09K8Yd6g0fbWRp0K/4F4xfBNSMvAoPF8TSdzD8IjiFX5L5v?=
 =?us-ascii?Q?YlqhZ+r7HVkvuyRTgnhv/FAqFhX2TsbSjiMsul1YDXhHZCUF1rKHHNN8g8Zk?=
 =?us-ascii?Q?Eo40Lm6uZKv7YEyB0UxbamXXvi98+x/vpv9m9DbBeRlo8I0NfbiFvK/s0AU7?=
 =?us-ascii?Q?0fgYFiA+6020gR6c4zsq+T+IEzB6srRuVWlv8tEgFEgDRQ/si3pNetElYrmk?=
 =?us-ascii?Q?Bn1s9OSNVDaO0iayLxrCnkZZOcvGx5Rdam/il0HSK26rSJ7V35SLkZN1e6E3?=
 =?us-ascii?Q?gfK2oxEkLLWxXKJ6IlSfsmdneBmwsmfZKmyLW8FW/p4tSkiKlGHU5O4aWpYz?=
 =?us-ascii?Q?gihM57MgG18c3lMfd3lubUXrb+CqlOb0WPFEHipWkUxtGlNb2hRWG1SP3psg?=
 =?us-ascii?Q?NWtuKUQ+dmciupBAhFkM9TrSTWGuqp+DMbLqhbCG92MPzMLh3+Wby8SJ1pw1?=
 =?us-ascii?Q?pnBWqRWV5pHHxFePrSMOt+BAZhzdSebZok4umqxvX8D9RfpLP3MfvqX80LzQ?=
 =?us-ascii?Q?jTu0izElrLrk2n4SmGtz7T2gnxxlNbnmn/JxXP97LToZkcfJKwqkWDvrFNgd?=
 =?us-ascii?Q?UIP153Zbx6wgBLVMI8X6l1aj8fjYFX1bgLAvjoNqsIr/QP9QS7hxfhpB51ib?=
 =?us-ascii?Q?jaox7z+4Y2lGV9B3ylKszbGl1IJU/kuQvEmREyLl?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f60b839-793e-4a97-5b1e-08dd89f81c1d
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2025 04:08:07.4117 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wufTYXEbc6dKv6Nyve4J1tCyQmq512lHofi/gg64iwLxrkrbK6v6m+eWfuHZgFMBIApoVcqd/QeHnjfH5EYzCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7713
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

Please find attached initial documentation for nova-core mainly about the vbios
and boot process. It helps build an understanding of the boot code. All the
information is derived from publicly available code and sources.

This series is based on Alex's v2 patches + nova-next:
https://lore.kernel.org/all/20250501-nova-frts-v2-0-b4a137175337@nvidia.com/

Previous posting:
https://lore.kernel.org/all/20250423225405.139613-1-joelagnelf@nvidia.com/

Joel Fernandes (7):
  nova-core: doc: Add code comments related to devinit
  nova-core: doc: Clarify sysmembar operations
  nova-core: docs: Document vbios layout
  nova-core: docs: Document fwsec operation and layout
  docs: nova-core: Document devinit process
  docs: nova-core: Document basics of the Falcon
  gpu: nova-core: Clarify falcon code

 Documentation/gpu/nova/core/devinit.rst |  59 ++++++++
 Documentation/gpu/nova/core/falcon.rst  | 156 ++++++++++++++++++++
 Documentation/gpu/nova/core/fwsec.rst   | 180 ++++++++++++++++++++++++
 Documentation/gpu/nova/core/vbios.rst   | 177 +++++++++++++++++++++++
 Documentation/gpu/nova/index.rst        |   4 +
 drivers/gpu/nova-core/devinit.rs        |  36 ++++-
 drivers/gpu/nova-core/falcon.rs         |  25 +++-
 drivers/gpu/nova-core/gpu.rs            |  12 +-
 drivers/gpu/nova-core/regs.rs           |  18 ++-
 9 files changed, 652 insertions(+), 15 deletions(-)
 create mode 100644 Documentation/gpu/nova/core/devinit.rst
 create mode 100644 Documentation/gpu/nova/core/falcon.rst
 create mode 100644 Documentation/gpu/nova/core/fwsec.rst
 create mode 100644 Documentation/gpu/nova/core/vbios.rst

-- 
2.43.0

