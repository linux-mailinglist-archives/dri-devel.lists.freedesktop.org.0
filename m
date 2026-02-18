Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yD6SEWMtlmmlbwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 22:21:39 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA56D159E90
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 22:21:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AC3C10E655;
	Wed, 18 Feb 2026 21:21:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="emShInXp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012058.outbound.protection.outlook.com
 [40.107.200.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4832610E64F;
 Wed, 18 Feb 2026 21:21:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n25nI3YZZkBoqnbYFYVsiWejG09yoUo9wMIJA3+IdRZqniKb85e6JUHgz6PRZDGVESKOLvsq8WVIsxb+7rjQzBSJqcgOo97ZeaWd5ar2uJpgozJblGMzYNFovr0Olsd3YPfPycbSzb4U2UwjJ13fo5bh/mbCuLCRMBBg8wEAOAZg+/3Gcyw/n/ToEDGuRE/ZD0DIh5E3NWjXTXanvOM5/iWPF95Cm/EebyqmAu/czA9xrs4RQUwR80b5Dff1zYr7DLIDNPkmDw17VGGYjvv+o5toAWtZvQA0HRTipGMOTUpEeSuVBKRVcOdg1dhtaj6LXQdx2olTaw97tn2hxie8Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sapLVutMzq2SvxQFSNN2weYf8tkRJOJ9CklDtC89Wn0=;
 b=Az9IZwKEuENYWbus8lm09RklvT6Oe1G+ymZcZjdtwv9ueI6uBPsbFLzmsZ4AoNwC+9ip50if2VPsy4pLewaxfMBnmZa/7TgPMxjrFE6UznVjrF6mp35hTebzj8BUkJUL+q3Kjk0BVqn8pXICQb9JnBZs7ziLCVFl6chshCW7pn1wkBagFelap/eRNK3RVztcvgip08I32RRl8BkZmDpCPoHGtYBiDtyuF4s0icuHa/D6TifDAGavGDXp4lrwiDMoCkXTVdBZp9utptajdAQZxhApuLb/qbifgRN0DGNhK+I39m1kOhZuFOzdaqhvyNb6RYCYjLS64hvP79lRj1offw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sapLVutMzq2SvxQFSNN2weYf8tkRJOJ9CklDtC89Wn0=;
 b=emShInXpxcSeWcJ8n0FzoxLd7QmTJuncufwFzQ3qu74BNE7nWYXZKo4LdeDYrMP+pkJ6G2yVLnQ0OF1C5yemCHEiUvvH8JKVZVoFHZBhII91BSBpyWzkFAYKXghmvPWV8mZiRTVqgGNDiIcC1P71uCdxT9vX+JBe/O+lbbJx91viiF28fprM2bWmnaf47AqM341qRLHWBaW6r1Mvv2hulhskJX0tEbp5nTRGM7829BGJEIiczu0/xscwoaKDpqmbAbj1JkEpD8ukbk/lnmG7UX4fB81nTRHGPSSvHLU4Xin/pXri0MN9nuDcpN87bKRpKD/h40urw9K3u9lsNlXuZg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 PH0PR12MB999111.namprd12.prod.outlook.com (2603:10b6:510:38d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Wed, 18 Feb
 2026 21:21:28 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9632.010; Wed, 18 Feb 2026
 21:21:28 +0000
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
 Joel Fernandes <joelagnelf@nvidia.com>, Nikola Djukic <ndjukic@nvidia.com>
Subject: [PATCH v7 14/23] nova-core: mm: Add virtual address range tracking to
 VMM
Date: Wed, 18 Feb 2026 16:20:11 -0500
Message-Id: <20260218212020.800836-15-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260218212020.800836-1-joelagnelf@nvidia.com>
References: <20260218212020.800836-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN1PR10CA0011.namprd10.prod.outlook.com
 (2603:10b6:408:e0::16) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|PH0PR12MB999111:EE_
X-MS-Office365-Filtering-Correlation-Id: ccfbabbb-c335-4627-7236-08de6f33ad9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vHTPOoVgF7GotobW8BpjbX5rI/siCRC4HfAIl6dNrX7aNh/yJr0ZnadeSUMI?=
 =?us-ascii?Q?T6d3pyVSpGZG+brZXH6Jj8nw2/9UB359coeltCv/UKhmGVwetDQd4W48K3+u?=
 =?us-ascii?Q?qJalDkYG/HILjZ3bCHKE0pqRWISKKBQ9f4+z7Y++DvW5tiHqloadLpkFDLEb?=
 =?us-ascii?Q?kOfVAD0vOeyCkwQoLiafvlVhziCSLmc9+yavLf9DS9JA2P2WSLemv31SDP+v?=
 =?us-ascii?Q?HERFYt+Rd1a4/BuLH95T9GVGuNU06RwyDASQehPgIV7kPCGT8zVgXx67nqiQ?=
 =?us-ascii?Q?34uiRqCd46FjkvuJl32V9nPDaC4qdrBJPu7Jut6/ECM/l1UnirVr1j7rpRRI?=
 =?us-ascii?Q?lyOJvunN3Iib40EdcEij5wiiRIJwuJx/O7RgyDv0hMFGH+nyWfZG27rcxlGL?=
 =?us-ascii?Q?k9I6X7sEHdZc5IYtaIU3xqHQoWDst4SPUaY64FXpd7abeJlRnwcFcTAueaNG?=
 =?us-ascii?Q?7RFN7MMqBnAZVsl1+JWsfCDHlQTNpS5zQiDaLbMEhaeSx0/AfTSsnxuXSP49?=
 =?us-ascii?Q?HbyC4/+5XdKKzs0PvjuJWSfE9Mdn5xwblaiRxkkDPwLJeq7xwOLBRzEfZ2FN?=
 =?us-ascii?Q?pHpIuqicLBZy5K/ybWGdfB5jth8sNJeHU1IQNh7m99olfpELDUd4DkEcz/1/?=
 =?us-ascii?Q?oJjlf88yUwo1dNcAHpqJRlstk6RjElWL0rCtks6Sw7m7nM88JCrUaUL1TKSp?=
 =?us-ascii?Q?1Y5shT2FWbRvDz4A/0Rw70AiePLdxLXC8FUJxk+s+c1/wlWLHxv9jQ5UZ7JZ?=
 =?us-ascii?Q?Dejglao1bjnI4c6tyWSrw66wm681HutWw0S2C+FH3+TVB4My0ZKPBH9bYQKU?=
 =?us-ascii?Q?p2P0CuXtK1oQMLRgdMM0IAj5AApEFPYOfnBBcooDym1SCLP86UL3R3nnrdTg?=
 =?us-ascii?Q?QKDWD6zZRyYSKRxHC7Q9uGibpM8/8bfCfO0ClZbJhGz4Kdhz+/QEnNjMBn3T?=
 =?us-ascii?Q?mY2Yi482eQwxZG7fZlHbgqNd3MjJxdsc+tJUXJlb08gvMTyv7cDv8dI0BJkX?=
 =?us-ascii?Q?CNagG9uFzU55+b410qiUeVRnyHS4tJrZKKW2q5zX0YFQn4GKEL11HUW0Lips?=
 =?us-ascii?Q?7LqEDcGlWF1l3bLAI9R7syiu4eyguzFnXgYPaw5tKJR39iHwvy7c4ork/uzw?=
 =?us-ascii?Q?J2iAFj90XgZLHrIh8h8WnUq9ZIv2gv2EIzgLa+cxvTV0bNuAko0Mq+7eDfhL?=
 =?us-ascii?Q?EXfg9eOl8lfcuzpUlwnLJUkxQAgW/r3gogAVF3vYd5Z4ZJ1Ox2aSGZbT5cee?=
 =?us-ascii?Q?IW4FAA79qldlfLlhS8AKwISrBC0qlCsiEi0eD2pmNtOkUcSDgwkZlDzjvC5t?=
 =?us-ascii?Q?tRSiqKqTRitHsJwvX1wzOwxmdrBIt5pnvhZAwceiSIpJ0h9mY0g/gi8ypLXY?=
 =?us-ascii?Q?1esAY10JZ3tTce6QshpVUrFsriePFoQuqXL1YocpX0LRRJJEe7K2sEaHYOYx?=
 =?us-ascii?Q?DWFrBX6NyPq18txzthckrjxjCBrYoc8tn6oQPWx6N6tOEQZQXU54nKKz04i5?=
 =?us-ascii?Q?XR5WlICrnVlg/YLeTMH3tTRTUsuvIWlbAlrsl11dzjBcTwFKzbtau8hM5emb?=
 =?us-ascii?Q?zFjz6L7/TQWRIZzKzHQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sWA7ibZPaCzR9mT+1ls5t1YOWsL7NA4dVHD01oqKi7dyiTnQAJvPQMi41bhM?=
 =?us-ascii?Q?KxE6NQdK6zTsFSbwXfHKv8QHOGjdbmaja97dzeJUfz94DTtfLei5y33v7mEs?=
 =?us-ascii?Q?4GKKEtxbF48q5w7avCEJHB/6L0jVPz6NbRKpwX/7S90jcEYLlTWMdRlLLmdN?=
 =?us-ascii?Q?UWglGmX3/W/w0ZFiKTRGMV7+v9gFH0NPGOgLg2hqx40NUqZv7wTT0TcOA/kn?=
 =?us-ascii?Q?a4ziP6J6tDOdt8IHvXUn0pI2gWmKC5DJWEaLDp++BYJu2TZBfGZ/IB0jLdA2?=
 =?us-ascii?Q?RWOfiTzhC7rAWvmOCOF2/ZnKZSATf/XoAmGMtCIBUp2mcvGOWHSz7SOb3M2K?=
 =?us-ascii?Q?5d4GtcOIUlU/4NqCifD4cGcv+Yqo3kunjydB/ImBzArqHh+i4TI+moSXYnB9?=
 =?us-ascii?Q?x1QyWBpgN1p19lntQN9L7mjr7L1zwo49MoI5qLlh8G9o56ePeJn/DgAB5KjC?=
 =?us-ascii?Q?V7Vr+eBJZ7Ocwj+EzZzExHqaEth2l88yeNNgSEK3o30e7f2NFZD32zzz+o97?=
 =?us-ascii?Q?Q96P2tBDfLAnMoPcMAfuryzjxRLQ1b5mWKyLIugQO99bBr66OekinfKmKqs2?=
 =?us-ascii?Q?hbS8P/nXA6+dUTswvx6N51ia3tXvS+wR6ZZCoKM3ROKjBFPvGiAUxWM5+MpV?=
 =?us-ascii?Q?Gk30XZwLovMurXUBvasR6a2QtSzXVKgJf7QdQfduw5w1JyTtzyvQfcJHjtXA?=
 =?us-ascii?Q?qHcxnkHz6HCwCP0I2UjKXyf/GCroObVaC0eg2CnneeI1lBUaEq+s2jT+CZAA?=
 =?us-ascii?Q?84JEvAjBobiN9m+eW75w5LeG2Ys81EIULkkZhI2QMPIFWJ41tGdrApLl8Pst?=
 =?us-ascii?Q?GKnr8nOEbo4FLFzakMuo7gC6tGDUjG6ig8/Wtt7Hnr2xmJdl67TaisRuz9PT?=
 =?us-ascii?Q?im52/qZN80aVvJLFedml8aJ0DWaCIjhCeQ0vLmAgqhepKTPvrMRZplgCTAkA?=
 =?us-ascii?Q?rjpOnqj1mIHo3JCCUUGQszWydojgI8jwvgK2+Aoxn0OnDykCNp1KOijnA2qF?=
 =?us-ascii?Q?tDoeMMySYS3O67I+85iZcmAWEg5hIH0+1l9bkuMnPkXrSSLCmhMWSBBzgPGK?=
 =?us-ascii?Q?QFvA13bMUV6RlX2YwRf/lIYUPSbKZAFkZCgBMyMQIYiFd2fIB7Y/XtrO9VZd?=
 =?us-ascii?Q?piODli5TLA2v5Q38q0gjs9SS9awD78Ccq/C/dk8cQgNSOBPvYPhF1gmnxP6q?=
 =?us-ascii?Q?etiWa4A0HSIUTfKVwX9lcX9cM0XQlLxeO3F9NRjUrdxGx/kYbPRB+C2jEfA6?=
 =?us-ascii?Q?QuWEVf9p10gDfxpNk1E0CSAaQMGjPGu5Z4zLXtNdBKx0I+Cw0a7zRJNeZgbb?=
 =?us-ascii?Q?ndV7xafoHMWdDVmPpCcsisnaXM4vpocVGWCohEWpcAJcAARHXMn1oO96dl/e?=
 =?us-ascii?Q?Ql1XweMcHhLZLSbp5Q1cp9O38TPr98W71a32ZWS1YsHlEDxzo6MW9jd+ZPwJ?=
 =?us-ascii?Q?zqRSCYf4iKTEngKYA6yUWVxF6S0I3YJg1LdXMwQwD8C6yM3sRn3ZGHUm+6RH?=
 =?us-ascii?Q?gorNmKoATcP2Jdq2srIy1Nu9WSQnHjr2KWuJENi+Mt7UYIeLuDnY5nmgalGp?=
 =?us-ascii?Q?YVnD7A4NlRC7EEIdF67XafqkAKeygtt0eGlxg7uAUyFLYlrEbtOAX4dglnTo?=
 =?us-ascii?Q?rn2yLEZ1ekczmEnVYUroEjqS2LTl1R+odjyO+G8/2hxItkKN8/iIMt65o1S6?=
 =?us-ascii?Q?umAiB4j67016nfU38gVw0CvFHR5vLxwz+c4RHk9CrPiK+EMF3w9iCXcCpolX?=
 =?us-ascii?Q?6nX7TyPqsw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ccfbabbb-c335-4627-7236-08de6f33ad9b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 21:21:28.1519 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3u2KaDmy0uFt/ERv7XBtxgxTmUOJ4X3/yr7ZgXbY+UbWUCMFF16rCNnRI8jazZa0e4nXRBrnXfHAKT+WrxhfKA==
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
	RCPT_COUNT_GT_50(0.00)[53];
	TAGGED_RCPT(0.00)[dri-devel];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,nvidia.com:mid,nvidia.com:email]
X-Rspamd-Queue-Id: EA56D159E90
X-Rspamd-Action: no action

Add virtual address range tracking to the VMM using a buddy allocator.
This enables contiguous virtual address range allocation for mappings.

Cc: Nikola Djukic <ndjukic@nvidia.com>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/mm/vmm.rs | 75 +++++++++++++++++++++++++++++++--
 1 file changed, 71 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/nova-core/mm/vmm.rs b/drivers/gpu/nova-core/mm/vmm.rs
index eaee707181b5..9e57916017ed 100644
--- a/drivers/gpu/nova-core/mm/vmm.rs
+++ b/drivers/gpu/nova-core/mm/vmm.rs
@@ -9,10 +9,19 @@
 #![allow(dead_code)]
 
 use kernel::{
-    gpu::buddy::AllocatedBlocks,
-    prelude::*, //
+    gpu::buddy::{
+        AllocatedBlocks,
+        BuddyFlags,
+        GpuBuddy,
+        GpuBuddyAllocParams,
+        GpuBuddyParams, //
+    },
+    prelude::*,
+    sizes::SZ_4K, //
 };
 
+use core::ops::Range;
+
 use crate::mm::{
     pagetable::{
         walk::{PtWalk, WalkResult},
@@ -21,7 +30,8 @@
     GpuMm,
     Pfn,
     Vfn,
-    VramAddress, //
+    VramAddress,
+    PAGE_SIZE, //
 };
 
 /// Virtual Memory Manager for a GPU address space.
@@ -34,23 +44,80 @@ pub(crate) struct Vmm {
     pub(crate) mmu_version: MmuVersion,
     /// Page table allocations required for mappings.
     page_table_allocs: KVec<Pin<KBox<AllocatedBlocks>>>,
+    /// Buddy allocator for virtual address range tracking.
+    virt_buddy: GpuBuddy,
 }
 
 impl Vmm {
     /// Create a new [`Vmm`] for the given Page Directory Base address.
-    pub(crate) fn new(pdb_addr: VramAddress, mmu_version: MmuVersion) -> Result<Self> {
+    /// The [`Vmm`] will manage a virtual address space of `va_size` bytes.
+    pub(crate) fn new(
+        pdb_addr: VramAddress,
+        mmu_version: MmuVersion,
+        va_size: u64,
+    ) -> Result<Self> {
         // Only MMU v2 is supported for now.
         if mmu_version != MmuVersion::V2 {
             return Err(ENOTSUPP);
         }
 
+        let virt_buddy = GpuBuddy::new(GpuBuddyParams {
+            base_offset_bytes: 0,
+            physical_memory_size_bytes: va_size,
+            chunk_size_bytes: SZ_4K as u64,
+        })?;
+
         Ok(Self {
             pdb_addr,
             mmu_version,
             page_table_allocs: KVec::new(),
+            virt_buddy,
         })
     }
 
+    /// Allocate a contiguous virtual frame number range.
+    ///
+    /// # Arguments
+    /// - `num_pages`: Number of pages to allocate.
+    /// - `va_range`: `None` = allocate anywhere,
+    ///               `Some(range)` = constrain allocation to the given range.
+    pub(crate) fn alloc_vfn_range(
+        &self,
+        num_pages: usize,
+        va_range: Option<Range<u64>>,
+    ) -> Result<(Vfn, Pin<KBox<AllocatedBlocks>>)> {
+        let size_bytes = (num_pages as u64)
+            .checked_mul(PAGE_SIZE as u64)
+            .ok_or(EOVERFLOW)?;
+
+        let (start, end) = match va_range {
+            Some(r) => {
+                let range_size = r.end.checked_sub(r.start).ok_or(EOVERFLOW)?;
+                if range_size != size_bytes {
+                    return Err(EINVAL);
+                }
+                (r.start, r.end)
+            }
+            None => (0, 0),
+        };
+
+        let params = GpuBuddyAllocParams {
+            start_range_address: start,
+            end_range_address: end,
+            size_bytes,
+            min_block_size_bytes: SZ_4K as u64,
+            buddy_flags: BuddyFlags::try_new(BuddyFlags::CONTIGUOUS_ALLOCATION)?,
+        };
+
+        let alloc = KBox::pin_init(self.virt_buddy.alloc_blocks(&params), GFP_KERNEL)?;
+
+        // Get the starting offset of the first block (only block as range is contiguous).
+        let offset = alloc.iter().next().ok_or(ENOMEM)?.offset();
+        let vfn = Vfn::new(offset / PAGE_SIZE as u64);
+
+        Ok((vfn, alloc))
+    }
+
     /// Read the PFN for a mapped VFN if one is mapped.
     pub(crate) fn read_mapping(&self, mm: &GpuMm, vfn: Vfn) -> Result<Option<Pfn>> {
         let walker = PtWalk::new(self.pdb_addr, self.mmu_version);
-- 
2.34.1

