Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4NP/BUgtlmmlbwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 22:21:12 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9CA7159D3A
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 22:21:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09B8310E2AC;
	Wed, 18 Feb 2026 21:21:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="qIEyXs+s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011004.outbound.protection.outlook.com [40.107.208.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26FCD10E25F;
 Wed, 18 Feb 2026 21:21:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SNLOJ6NwSzF4LS8dkQv0iS5VGzDAy1yFRQNeb7sGLWceZf+Ww7asugPgAyZ4fvHvehA6UqZ2xkytGj42RW961cE0/12u4+clSdzT32p93NMIp5BX+PUc/tcHphDf3TcNKoNQYENOzuUODzzOV8D8c7YRzi+1yD17Gg/HWO/5rK3OE0RtRf+ciCJQ9w7cEK8OmlDMfQECuP06c7VxOPw2QgKoCz63ftOor2riyxP2JT2+asrwQLn/LI+0n1LwdhH97Gv/SOiVmaKN+PqFau54B6ycYytcG5GCaaIsXkoik71byUxQw/NzFYrMvJTWu21VG8PIPrOSzSdXB6qCcIrT/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9+htc6zTSproVUfOMlzedV76A6QuNQnGjUGGd6VFeSo=;
 b=J4H6/saFETdVBb9748F/YX5mockTo65rHO3UqJuQDGZ5ae+bSABtnJFPqaEBu/Od9A9rOT1r+b8Si/VVc4YYrs7sgn2JenpRmD/6rArmLlq/MPLayYqb1oNVw8kDeBLLTAsnct4N8qikmoBnXWo+fu8x/hIwnR0Ea5SFMIiGGDCXJ5CDVsQgfoTM2XQpd3xXx4MV2mijpZsc5pManmg/rwoFbpCXzLGs06nlJDcfQ3Ag/Uu2DuyoLqMU+oA4sgVAkUAj9HjPUmTlkdWHhQDRITuBzHQIVbtGr9TUlIy0uIbmc1bw8iYg4YNjIpRGT7QiawYc+umPCk2WeaSgmZ410g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9+htc6zTSproVUfOMlzedV76A6QuNQnGjUGGd6VFeSo=;
 b=qIEyXs+sWkXL+gSujjg/VfXaOcwk/Tw6D42vvcM5N8KQ/h3yPDeZAIvYSzDkoKClOI8pBFCwT2zqVcCwC6OwQRGOd7SDtfnoYh8mELOp7SkVSzef8PUBBKDYOAvkjt2nCfcJZ7iO9ZtuyPbhyRDWGX3zB6i88f3SLkoZV4TIxcK0ggwhHhJozGqa3P25yoqKcRMdE7I/3kYOxTPFGS06G8Q6f0LccSURDtaKuiB1gZpt1XHab4p2ShjaPrRG0Jxbbvl72vyLo8ZzOAn82ORkY3eUEoB3b6JEXWqyIApQVYfxMsKgLQ/i4urXecEGGC4TpOZescUwIUsaIbfKR/JYng==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 PH0PR12MB999111.namprd12.prod.outlook.com (2603:10b6:510:38d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Wed, 18 Feb
 2026 21:21:03 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9632.010; Wed, 18 Feb 2026
 21:21:03 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: linux-kernel@vger.kernel.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Huang Rui <ray.huang@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Helge Deller <deller@gmx.de>, Danilo Krummrich <dakr@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, John Hubbard <jhubbard@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Edwin Peer <epeer@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>,
 Andrea Righi <arighi@nvidia.com>, Andy Ritger <aritger@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, Balbir Singh <balbirs@nvidia.com>,
 Philipp Stanner <phasta@kernel.org>,
 Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Eliot Courtney <ecourtney@nvidia.com>, joel@joelfernandes.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 Joel Fernandes <joelagnelf@nvidia.com>
Subject: [PATCH v7 00/23] nova-core: Add memory management support
Date: Wed, 18 Feb 2026 16:19:57 -0500
Message-Id: <20260218212020.800836-1-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0032.namprd05.prod.outlook.com
 (2603:10b6:208:335::13) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|PH0PR12MB999111:EE_
X-MS-Office365-Filtering-Correlation-Id: a82d24e7-5f4f-4905-a0c1-08de6f339e92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?tlt2an0AAUu90NDNMwC/7hTRgfDO2Bc+fce9XL3gsDh/1ulsBB6f+oIWZB2B?=
 =?us-ascii?Q?6O9JpT400DbbVpdXhTJy6ZT9S1YTpKlKAqqvpL66mrIHQbAnTJTPv5vSmsdL?=
 =?us-ascii?Q?Wp9yTxaiPgmcJgQNdGCejQjJ5I15TzCdi5LABf9a2OFyywQ2fBH5zDTNzYNq?=
 =?us-ascii?Q?ht+mtaMcg8rVxOBzbn0mLR3rDjubJzinz7ypEqN9AN6QcHmBNAoRnz2cw9jx?=
 =?us-ascii?Q?jEvhcG/N/12WFclIuhaX1uboGzaKRBSfDPE/mLK1jkiTxyPugYa89vKLnu9i?=
 =?us-ascii?Q?u0SPANAlIynh9QrwkMNFeM1o1eZ93kd9w9YGGzzdFBEKKM0qeLI21NOiB/p3?=
 =?us-ascii?Q?EJcCIJrThGwluEbxIz2qc7vSxKc2Y3CBsr7LzQZDAXl0ehetbgBM0RMoz5Y/?=
 =?us-ascii?Q?I+YBE83x6kka77mM0CLeFU5JUY2lPNU3poqeqz9liJLypfCOt4hhk1Sla00f?=
 =?us-ascii?Q?NTJmLagzgTP6oHphBtGC+A5FWTFqH/wYJAZdOEB5DyZ2N+R1X/4//940fMDb?=
 =?us-ascii?Q?Sl3RDz5NDeRRUMEUcuAo031MerAtRD/7dHCp56R6W6bjBkSOsbMpwswUeAgC?=
 =?us-ascii?Q?pCZj+9G+v7BvreVpcszpwtz4+jJIZp3nCmx1ZSIQQNFqcmjQitcnuEQOUFHT?=
 =?us-ascii?Q?8oaT+Oxv3RJUez8vYZPBC2ERtwco2MMlqdsIIj72rzbAMO6frJ3jI+uJj2vI?=
 =?us-ascii?Q?7A8qJE2LmcpIgaPH7V+qC0yKQz8fHYKMeyaHrJsp36+WbJmNg5q9mMQFKugU?=
 =?us-ascii?Q?cU4lVpBKPHCIhwKdcy5EMopiVs35alJGTWGtxFu0hF7xbcQhlxKIYvFtGWdK?=
 =?us-ascii?Q?JODiQ0bIyMbC0prjQ8TH18QaTrHAZ4O5JH07BOQlOeCDznN0zdJ6hAD4WTP5?=
 =?us-ascii?Q?D/aC/sgJ+l9vHLntZwaQmD10/gtk2XRRosrBzOk00lNAFQqs8/2nSzxMN42s?=
 =?us-ascii?Q?HrQfiAThS01VrhRrTRly4Tqz+cqewuZjOwPrB/rrFwwIFP40PCauGV9Q7TDS?=
 =?us-ascii?Q?aqOFVz7Xvxrqz4HGkZB34udjKSL/W+FR1FD1NKI7dSVlkpRQXcW1l/1PQmwG?=
 =?us-ascii?Q?DMTaSOxnkR3X0WR/ov2p0gv2qgrO4FUDPRrH3Y953xaxRMwBJfhTpIfJQb1K?=
 =?us-ascii?Q?xSCEOmCuyUQcEHVPqSJ2ySblS5YaOeXj4CaGhYoFQWYtI0X3gunA59YsBgca?=
 =?us-ascii?Q?X6tCv5n5s00N/2NVR+bT+lhDbF2Gmuv5vyjdKKx31aGzLJWro6zP44+qoB5U?=
 =?us-ascii?Q?5biFuf0yLvO/GXmiqiAa6foxKczv2LsX/Wx/yZ+qcN3xVW7tzORO03tOlzHM?=
 =?us-ascii?Q?qQbI6r5Ml2SUZAP6XonmbxlyggJNErngESnAUegzFaY8IakTdvPmzWG3CR1t?=
 =?us-ascii?Q?q5/rbmwMwNeCgIVQWINSCDIIaqc7VUI8O1Gpkiqd7iC3Pu/4WqK/Ol3PRTOw?=
 =?us-ascii?Q?yFBcRh3Zvm4353jTvqEUIF7MomX5bdPRlGVUekIvEjxm+kEvcqXcZfgJC541?=
 =?us-ascii?Q?Z16t1DlIswdv9SMLXBTWgmBmkskfyLrJ1pR9tDgCDwtHin+kNDSVEXs6cRJ7?=
 =?us-ascii?Q?kU/4o6CzAXJmBvqot7w=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BLSPyB2pLqorRuzX+uCKW2NDc+FFdfY2+oDKE0o/j5pTwr5gvtwIOGVr9/kI?=
 =?us-ascii?Q?kvyALljPoyNMxdMgjecr/4HEaS4/9Ie1zjcuRHVLyimhuS1+X+CEpk1vRr8L?=
 =?us-ascii?Q?8Mr1STuRZ++aMiJE+013gJdDP+UwFVoE3qLUabr1L3+dMgK+l37gz+A5PIhr?=
 =?us-ascii?Q?qqYOrQJJ6u9/Ytkw9KGqf9gh2ZplvbMbJTGBG0sgHyxweQbpi7wUJKBiXvrb?=
 =?us-ascii?Q?exvFmKytWJSXIVpWEWLiFzxRKX932H2aS6jW3Z/p64p7P4cP1iD2t25OOO7w?=
 =?us-ascii?Q?mXffesEyegCMJ8EVDOz6ADe/YOU/hAPHxpFeAmHCHNMKBU+SY0jtx+9zr/CM?=
 =?us-ascii?Q?5GHgQ/f/GURrCdga13PAY5z23L4uFiXFh/opnOzNKrx7XXg39CwRGqq4IDIK?=
 =?us-ascii?Q?kDilH3QV7NJgFK+By/Zv0w1I4QdOWr5Sl++Vxi6Nw8JRW6XxTYedFciUxrJN?=
 =?us-ascii?Q?US/fX+DoSsHff7M/TmkCZIlteklS4k5MtJGvFGB9Sc87rgHi+7rMNjiq+gum?=
 =?us-ascii?Q?RHV4JYm2Rn9VnIfLTvOjbMsnnJTueQIyAZIZ7+4eAFv56qVGfuIYbss661Iv?=
 =?us-ascii?Q?Hc6iJvJ67ddy+OqziWULUbj7xoWbJMhvF1SrgVNli/TQsSusCB+Ws2hJ8xnK?=
 =?us-ascii?Q?2avqYG8cDjGhswTylrEPZtaLNomGvzMRCpKGiX+sa9JiU4sNFeIoNSIrdl6h?=
 =?us-ascii?Q?5W2NRXfQOHK+3Cv74oJrzSjaf1bVd+UPvj1iUUnqcBSkQ1ObqqNt7vaVTQ7K?=
 =?us-ascii?Q?eTUmid2kupHUNIz7QYIXlVZneDBVcfHsWcBS+0J4vzgljT0xu29G7CxxpZIt?=
 =?us-ascii?Q?KAQzYsXL8r5ibBqOTx4HOaHye/DuyfzdnnrmhsURkun3K8/vcOGGU5zrIjHo?=
 =?us-ascii?Q?eD3UCloqrGkfl7XtSEg34N+JpxC9sxMwvrGrxrjNPDvdhDEjUXfa2tSZH2L/?=
 =?us-ascii?Q?jReP4i/jrCdFpFLpbI5bvapHpQV0E7jCALj7XrM+kL9LhdFy+hhsdQFjURAN?=
 =?us-ascii?Q?DZ06eJH+XMhKL7bHuKiZFYTcsAZ3Hi3AojddWIgg4Yca+XQgFHNeq3ry2Ww3?=
 =?us-ascii?Q?Q+IU8+vRllzp4dr9Z6A0x9u/JGV4HUVA+4kDQ3EQJP7j/7holFvMUz7lIrsr?=
 =?us-ascii?Q?jbCnnVnvUE+5W0LWL+CnMi0ZpFruvf9BrX5+fqdRRU+LNew//8nWC/1urK97?=
 =?us-ascii?Q?gK6Gcyv84TiK5z0gsURMU/79NOO9HgT9vfO9Gx4Gbi7qsci4Ys8fZmjBiuGy?=
 =?us-ascii?Q?dNjHs3MZ5PHNzRZ3GYbAU0X/hZ5Ipr6bxaUMRsnz7MtTxcoS1c5LegDQXMnm?=
 =?us-ascii?Q?TVsrkGfmv+mgLxFe1Jsn+GuVwbAdMdiFuh6tvTe04kuSASUGQOwYrrboWbbv?=
 =?us-ascii?Q?7J0qxav5mp+E/JvtG+QSWQ42wqjGfVGVXabtPhH4xfDZzOl8AXfzdc4D51xv?=
 =?us-ascii?Q?6iGTbcabjkgx46zcJTYEreXCaFklkkdtq6w9FuG9LdQRv50PrwqMs77Qee67?=
 =?us-ascii?Q?nTQG3HfxTF4gM/eZZvcJYrO2FZMmpiG2Ca/YJnULRmrJEiaCxelaa6XMgzsv?=
 =?us-ascii?Q?MZ6UFd+2FSY/2vzx68UsK+czc0Rs5TVKqbAzq7i2J+g/3kBAL6KobPOpLGv7?=
 =?us-ascii?Q?9UXQbZU/9TAi1uQ/RtqPUYoxhOHX7rAPNzf40zqUo9JzBZvgkB9omsrG+8rq?=
 =?us-ascii?Q?5MZwD0uu+tEGS6xt0bn6088mi/OBlk2JtqOPM1kDllAXCR4srzS/n4dM4eKM?=
 =?us-ascii?Q?cCcUGi/alw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a82d24e7-5f4f-4905-a0c1-08de6f339e92
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 21:21:03.0379 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ax+Mn7RSdzablwZEQgDU3OFrzOVJE4ZxkNoNhtp0gB5F+LuD3ipGSmOug6RztinG/nILooBHtk3OKX3zjiL/Dw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB999111
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,lwn.net,amd.com,intel.com,ursulin.net,gmx.de,google.com,garyguo.net,protonmail.com,umich.edu,nvidia.com,weathered-steel.dev,collabora.com,joelfernandes.org,lists.freedesktop.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[joelagnelf@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	RCPT_COUNT_GT_50(0.00)[52];
	TAGGED_RCPT(0.00)[dri-devel];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,Nvidia.com:dkim]
X-Rspamd-Queue-Id: B9CA7159D3A
X-Rspamd-Action: no action

This series adds support for nova-core memory management, including VRAM
allocation, PRAMIN, VMM, page table walking, and BAR 1 read/writes.
These are critical for channel management, vGPU, and all memory
management uses.

These patches depend on the following preparatory patches:
https://lore.kernel.org/all/20260218205507.689429-1-joelagnelf@nvidia.com/T/#t

All patches (including the preparatory patches from the other series) can
be found at:
git://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git (branch nova/mm or tag: nova-mm-v7-20260218)

Earlier series of these patches:
https://lore.kernel.org/linux-fbdev/DG0MRL6T7ACW.25G3GLJMP7PN1@kernel.org/T/#t
https://lore.kernel.org/linux-fbdev/20260210233204.790524-1-joelagnelf@nvidia.com/

Joel Fernandes (23):
  nova-core: mm: Add support to use PRAMIN windows to write to VRAM
  docs: gpu: nova-core: Document the PRAMIN aperture mechanism
  nova-core: Add BAR1 aperture type and size constant
  nova-core: gsp: Add BAR1 PDE base accessors
  nova-core: mm: Add common memory management types
  nova-core: mm: Add common types for all page table formats
  nova-core: mm: Add MMU v2 page table types
  nova-core: mm: Add MMU v3 page table types
  nova-core: mm: Add unified page table entry wrapper enums
  nova-core: mm: Add TLB flush support
  nova-core: mm: Add GpuMm centralized memory manager
  nova-core: mm: Add page table walker for MMU v2/v3
  nova-core: mm: Add Virtual Memory Manager
  nova-core: mm: Add virtual address range tracking to VMM
  nova-core: mm: Add multi-page mapping API to VMM
  nova-core: mm: Add BAR1 user interface
  nova-core: gsp: Return GspStaticInfo and FbLayout from boot()
  nova-core: mm: Add BAR1 memory management self-tests
  nova-core: mm: Add PRAMIN aperture self-tests
  nova-core: gsp: Extract usable FB region from GSP
  nova-core: fb: Add usable_vram field to FbLayout
  nova-core: mm: Use usable VRAM region for buddy allocator
  nova-core: mm: Add BarUser to struct Gpu and create at boot

 Documentation/gpu/nova/core/pramin.rst     | 125 ++++++
 Documentation/gpu/nova/index.rst           |   1 +
 drivers/gpu/nova-core/Kconfig              |  10 +
 drivers/gpu/nova-core/driver.rs            |   9 +-
 drivers/gpu/nova-core/fb.rs                |  23 +-
 drivers/gpu/nova-core/gpu.rs               | 135 +++++-
 drivers/gpu/nova-core/gsp/boot.rs          |  22 +-
 drivers/gpu/nova-core/gsp/commands.rs      |  18 +-
 drivers/gpu/nova-core/gsp/fw/commands.rs   |  38 ++
 drivers/gpu/nova-core/mm/bar_user.rs       | 318 ++++++++++++++
 drivers/gpu/nova-core/mm/mod.rs            | 241 +++++++++++
 drivers/gpu/nova-core/mm/pagetable/mod.rs  | 479 +++++++++++++++++++++
 drivers/gpu/nova-core/mm/pagetable/ver2.rs | 199 +++++++++
 drivers/gpu/nova-core/mm/pagetable/ver3.rs | 302 +++++++++++++
 drivers/gpu/nova-core/mm/pagetable/walk.rs | 213 +++++++++
 drivers/gpu/nova-core/mm/pramin.rs         | 454 +++++++++++++++++++
 drivers/gpu/nova-core/mm/tlb.rs            |  92 ++++
 drivers/gpu/nova-core/mm/vmm.rs            | 473 ++++++++++++++++++++
 drivers/gpu/nova-core/nova_core.rs         |   1 +
 drivers/gpu/nova-core/regs.rs              |  38 ++
 20 files changed, 3182 insertions(+), 9 deletions(-)
 create mode 100644 Documentation/gpu/nova/core/pramin.rst
 create mode 100644 drivers/gpu/nova-core/mm/bar_user.rs
 create mode 100644 drivers/gpu/nova-core/mm/mod.rs
 create mode 100644 drivers/gpu/nova-core/mm/pagetable/mod.rs
 create mode 100644 drivers/gpu/nova-core/mm/pagetable/ver2.rs
 create mode 100644 drivers/gpu/nova-core/mm/pagetable/ver3.rs
 create mode 100644 drivers/gpu/nova-core/mm/pagetable/walk.rs
 create mode 100644 drivers/gpu/nova-core/mm/pramin.rs
 create mode 100644 drivers/gpu/nova-core/mm/tlb.rs
 create mode 100644 drivers/gpu/nova-core/mm/vmm.rs

-- 
2.34.1

