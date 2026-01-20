Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iD3PBjfpb2m+UQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 21:44:39 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC6174BA40
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 21:44:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B79B110E6C7;
	Tue, 20 Jan 2026 20:44:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="pyhUDeQ7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010068.outbound.protection.outlook.com [52.101.56.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F07310E698;
 Tue, 20 Jan 2026 20:44:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LDqd9V9n8uIi4MEehfUfz1SYuJqcEV9EhzJsHOpA0EFh1ZzmK37H64lekdORHoDz3uSgaigBubgRYPydE+sZnipOJ+CmrrhL+PUp11dm5SAS3z8u5gv29Hr+cqp3+6QSRIKsvcr6QODAVxT1hDAa6SGSpK26Q2AwMphAQO7nVlzHbOFidqsmSsOM5PLsBGosOgRVdJBvtRGO2PMYv9cNKncc9weZUa+LewJzR30L9KOshpqv6DyRoxzPj5oUKLb/gSgQPKf8oX27deXeQe6teaVt+caxFit1iVXMMXULzTgN+X+0QlJjxdAtLGmvbe6t3pNyZvfTSVVoHICBAKw0hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lHmcAGEiTYK77mHMYBKw9XFluu3TXACJqJwbH39uDDI=;
 b=A6VLKU41ui6QwwgEciq2A5GApgEEjRXYdMud8jv2VRcXz/r16I8zcUcAvjksIJrqIlcxxlRmTl7mk8wAo20LoicZ3P1l4y+aPN6z6/K3uQ8kye9Q1gJqU41ADIzb1aiHaL9gxzvJTxKLy+xyGD54WVvf7gBCE3Z1ZsjimQUfY2tukGtq1uUAKzuROnOo9lXbAuF1dm0derXYjqtStek+U4bxE3xwTpEC95pLRaFmPL7IociSecmvwCI0j2PNSGCNTB1/sa0GMWY2Md3wztBQSp65dsTzh8Ma4j50TL1o9uyjW1NDLiW/p2klTkR2FkX3QPAYEjJYPMKAotzYPiyaPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lHmcAGEiTYK77mHMYBKw9XFluu3TXACJqJwbH39uDDI=;
 b=pyhUDeQ7uHWixP5l3391WCEbmJOMM0wGfA4/e3egyet5bH7nHT6gmE6Kc7dDTz50g3zzPpzqPTilc4cbqSfETg+8wkRM6fF0ENjgGKGLqonpozpKK/XqyXy+SGoFDDlea8X9O86U6yJksyQGXb8KYfsHQ04C6Xo9vN5XFZEFUDsSjtG1ktos15e28D7zo7dECvsN/pa9f4H5/+gmbS+zOQJdHWeN5IF39H7j97GqFAKnIYXLvyfVgBMBLMFFfdePNTIGOsIjEigAu0UWgzxzU9SJtdlE8lzP/4olLTyu8HdsXVsy2qespkeTDikY/dQQYRuz4gG+x6uov/cIo4pIrw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 PH7PR12MB6809.namprd12.prod.outlook.com (2603:10b6:510:1af::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.12; Tue, 20 Jan 2026 20:44:21 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9542.008; Tue, 20 Jan 2026
 20:44:21 +0000
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
 Zhi Wang <zhiw@nvidia.com>, Alexey Ivanov <alexeyi@nvidia.com>,
 Balbir Singh <balbirs@nvidia.com>, Philipp Stanner <phasta@kernel.org>,
 Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>, joel@joelfernandes.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 Joel Fernandes <joelagnelf@nvidia.com>
Subject: [PATCH RFC v6 18/26] nova-core: mm: Add virtual address range
 tracking to VMM
Date: Tue, 20 Jan 2026 15:42:55 -0500
Message-Id: <20260120204303.3229303-19-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260120204303.3229303-1-joelagnelf@nvidia.com>
References: <20260120204303.3229303-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR03CA0029.namprd03.prod.outlook.com
 (2603:10b6:208:23a::34) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|PH7PR12MB6809:EE_
X-MS-Office365-Filtering-Correlation-Id: 848f9b27-4227-4d0d-ed1e-08de5864b048
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?GPUewjorFqTjGyc+jkG55pMB5NqpxEGexLwAVVeyQOx6kp1LWd2pWPgmA+2L?=
 =?us-ascii?Q?ie30i+KVgVl/m7TaLZmVbDsoJaGGdaBP1DBp9hAAXfTubugDZJ0PWvylSNUl?=
 =?us-ascii?Q?CSFK0iBZoNM0R91+EaJYaR9KH06yHckBHlNv3Y9z/hcj7nqlnA7bYidDmcks?=
 =?us-ascii?Q?HAptkfToevIXsx8VL3wv7BrkLyniXnTjZjA/+ee2P0MzG2zS9bpjhJGOhOmE?=
 =?us-ascii?Q?NUWQkMI9oJhlxjiLB5kfaNuSX12um/TyW+qCBmKsA/fYZb6WpaeJHPFig40F?=
 =?us-ascii?Q?pks+oZDqI/C7O2s1/Lj+wZdQCKwkfcu1oRD+YY6geqgF8R4RPLcMoAfuZht/?=
 =?us-ascii?Q?i5tcpAquC4DY7mJlUXt8wyNjjDTbUwWi/4OYpsEyp+UioNz+JY3T35yZQ59Y?=
 =?us-ascii?Q?tSrBFvK9Z41CPPsRhrj+L0YSTN1Qe3CgYmURbRrfHNx20fnxWhDyJ9h7iFjY?=
 =?us-ascii?Q?n/RURAV+cI3JSXnSCage3HBjrXUIS47guWENlR3o+BFmnq0vv/lx21Cj1lqH?=
 =?us-ascii?Q?mT2mIp3I1L4OYRIybGD1saM/1WxgMpjCq8K4Fpc9KapbZZCqrmnJ4TS393sn?=
 =?us-ascii?Q?VWw3kbX/LYBz12vRcqNeGbAJgZ1cOLo3wl/UNTe/lpWRMkARQdz98EvRAJAk?=
 =?us-ascii?Q?Qvc/Onr23Aw+Jy7sGT1p8qF8CbtUfnMDnMykt+k/JTESePS8Ge8qg0qXmNxw?=
 =?us-ascii?Q?UXcqqesYrTpvHzZmSaaPdSqbqhtduDJnAVOmnKL4tjKtNWX/rOOXUkzWG9be?=
 =?us-ascii?Q?rcTtfkLBqSitU13imUrUbzwe87w5qSrVmqxbpMXR47GOA7b5ED7lEsbxg/Yt?=
 =?us-ascii?Q?9qwOkMsmMan3Fhcpmuk/hBel20qcFtkKpY7R68VO7mivflDbFVo3Xf2+qY6X?=
 =?us-ascii?Q?pa4gD1O9f7Aeg0YWPeV4vSZsehQLv5yCPRFbChOMhvNAdGGotiPUHxcndQnj?=
 =?us-ascii?Q?TMuJvmO+EoKWCvFceVU8dq8vpkzGhEI8/yerKfUzzsQC5Q752UP8KkvISAy4?=
 =?us-ascii?Q?U7ZBX50gsb7y6yOqMg6zh3vfiGumHv1uaVw45Y2IfvBI7mwnzBy5LUaPicPe?=
 =?us-ascii?Q?IgXKMkX4zOA3wRXR16gahhFUJsl/H3XgSC1Aub6ng8eOTDhqMLy1OMlE0toI?=
 =?us-ascii?Q?8ZuYD3Uukwo4MunquxZ2f021b2TiChBT74TGo7UfN4+VBq0PgY59Op88Gx/A?=
 =?us-ascii?Q?OuB2SqMnVyrLTgEF9B1UvezmCZOHgKQdPd4QEUtNVpRf4n/FT47KVApz+e5f?=
 =?us-ascii?Q?0RWbr+J+T9u0MoGiW3ldOvUzIthTRVdKWrz3bwty6JSH+D5mqeyWYpC37OGX?=
 =?us-ascii?Q?dQrI5ss85gqHQvpGErnznjAY0uV4wfw8qsKYvvfNSg3r0hDjbDYJ1B8cSmCe?=
 =?us-ascii?Q?q/UA8wVShcR9foHLsvNlOvVFi/6Y2L+Pxj3X2XJ9fGbE85dl/LajAEt6rd0o?=
 =?us-ascii?Q?e6JXfPoGo+6Xe7xj9WxmsRsoNeqDCkl5CaBnsSutaO+0wl+DbEKyyZLTMEHj?=
 =?us-ascii?Q?rik6iDO/kAX1o5wV52QgAraq2CTJlalUO1Gu8tm+MUy64Am5Jl+hs3DohVbD?=
 =?us-ascii?Q?oc2q3DVBPTZ9pyJO0Eg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7x7Lby0yVaBWCaXHoN3ExBONqwfcIWXZpfgfMOt3kRejVLGrpr4JQWE0WYsh?=
 =?us-ascii?Q?ePFNc8Yd/q99m693zCEWWI2TSeNXC8lhOCtNDiMvN++LhbV2j5mteSeSKa6x?=
 =?us-ascii?Q?ygKQsExkmnKIGial8e5GXuZq7U5H/qEKFGVI91ajprfUunGiTPv0QAWPgktd?=
 =?us-ascii?Q?hUCkaOP80PwUdU9d63LFaVb+wrUUoIVqUYHZZXB//PPlnHAiJrmpIgJF7K+9?=
 =?us-ascii?Q?FxNxYtz3I61dV3QYlA4w6fU3O9gXsWLWsmO3cNAfqfXrRMDFJevsMkWC5Z7z?=
 =?us-ascii?Q?VxiKyQpZDquLX7y9fkUhLFr2gWbR+OTC3cqYI+JpWt1T3g8E9Lrgoy1NUz0v?=
 =?us-ascii?Q?7Ebm1zojG1IIyr3p/Rx2AMQ02N/2Hg6K7U+ZBZXisksbuO6T1azrJFi6LV3/?=
 =?us-ascii?Q?ZQVhKmV2j3klDCLN4swC6PG8xkptW4UKTtpoikmDOW9XGla54gr8L3FWAT4V?=
 =?us-ascii?Q?uI15E0D9qt+jPy7E5Cq5jMOLEZgmRfDiTp2N4t6tLFWkkMeCAOjtCkF0Q8IX?=
 =?us-ascii?Q?iEl4HogM0278p3q96wzb8Iqw5miWZo2jYRPfufZpi437ZQdvkAO14zInl43J?=
 =?us-ascii?Q?eP4JkXYjZQ5ZgOY77VrtJWYF5zY/4wHny8oTrh4ltDhrGh8Bfrz+C/I16NSF?=
 =?us-ascii?Q?42AEGy+pVi/AqsGXaAXWOq/1t9XQLJNtejyezJEyecRt5kpuqdoV0cMio6DA?=
 =?us-ascii?Q?zkiBVkBp6j1rNQuQu8aNm0DN+6pNzienI5SmZUYnNcv3GR48BMQBk7YuX/Wx?=
 =?us-ascii?Q?qtPyrq5hJO1nVYnZG6nNgt4iir3zcXtWLiUMVdJXjaiAk/kdZy6Vlrbk0zGV?=
 =?us-ascii?Q?4rCK/sF2bQBDU33FA6JVwUb1n/JZMaJYIaL8TLldHFaRRdi7FoQ1pUjycld8?=
 =?us-ascii?Q?X5bIAUDk4X5gvYAufVeuBINBQjQbZ6+YsVOJoLlVTW5a7bCA7bn8rxb5qXOW?=
 =?us-ascii?Q?kC3FsE7u1EuHN3vzn1PmVvKstcUp0zGa9rP6RXW+zZ+eeSjL+2cLdMDg1p6s?=
 =?us-ascii?Q?tB1HxfTqfFujecSOeR5LQux9Ohe/aiDMaU+P2eqQyjE83YaPBRCiyCZqXajD?=
 =?us-ascii?Q?Kx3NI4NHHSkgY43xRSWltqfdbROF45YmH92GWiFI8WcMytrCRrb3h4gjCJBJ?=
 =?us-ascii?Q?ho6uJHz3CDgIXsjXvMALvd4by8/W1jBXWTxi+8ZDTjRgCPqM7hVYB4qPCbrJ?=
 =?us-ascii?Q?FQQYrD9RPN23kxeoPxdX4mb3QMKkeSwN2Y+oz+zlUsp52RqwJWDJ63m6ba0u?=
 =?us-ascii?Q?xjq6uxLGGX4+X8J1+irmuN15RJNS1++5HRR5mvthX/ZpR0BV2d1tmYok16JN?=
 =?us-ascii?Q?jH19WO0hNFRP5cxEZNap4PlKQdfNbWDqdj+v2Rd/gNssA4GU5b7QZ/SdY0g0?=
 =?us-ascii?Q?C9mW5gSon45kgFSFdmf0m1AfwQBHXLWmCZ7mKS95+AfTpgKxRupQXetPJTgr?=
 =?us-ascii?Q?Wkk7dScJWPkDt5v4cQJsNCPwIgZgmg7U/VBW4pEenTrfogiMo1hp/Z65OS/C?=
 =?us-ascii?Q?CNHMPUf/kjylRwP+CO2/i9bWVNbTjdbiqPmsINDcAxSGAxL4bvXw4T6pxo4g?=
 =?us-ascii?Q?kBHZW/QfZQpBvWvoFu7xwu9s7Z0m4wA9YaFaOQeeaSIBg5ZO4mhUtn3TObhJ?=
 =?us-ascii?Q?P3cRYesAckVXpDYZoDLlKDUxsURIk0NM6XLsyHgWkITLVkTSX7VXMNCW68DT?=
 =?us-ascii?Q?dn7rR7MdEAVe3cMnqBGhWCgTIybl9ccdkMKWnxYkF3/kQ2FtCbmn2WvnWBD+?=
 =?us-ascii?Q?IiM1+lO1zA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 848f9b27-4227-4d0d-ed1e-08de5864b048
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 20:44:21.5087 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7P/i25fspCUL4RznfxVlLYVSYR94v3X2WYIpZwx3ylG3C+STeuWw+rctqGP1w0vryhSH6GunQYDZWyqSyLpSrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6809
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
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,lwn.net,amd.com,intel.com,ursulin.net,gmx.de,google.com,garyguo.net,protonmail.com,umich.edu,nvidia.com,weathered-steel.dev,collabora.com,joelfernandes.org,lists.freedesktop.org,vger.kernel.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[joelagnelf@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_GT_50(0.00)[52];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,nvidia.com:mid,Nvidia.com:dkim,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Queue-Id: BC6174BA40
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Extend the Virtual Memory Manager with optional virtual address range
tracking using a buddy allocator. This enables BarUser to allocate
contiguous virtual ranges for BAR1 mappings.

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/mm/vmm.rs | 49 +++++++++++++++++++++++++++++++--
 1 file changed, 46 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/nova-core/mm/vmm.rs b/drivers/gpu/nova-core/mm/vmm.rs
index a5b4af9053a0..0ab80b84e55a 100644
--- a/drivers/gpu/nova-core/mm/vmm.rs
+++ b/drivers/gpu/nova-core/mm/vmm.rs
@@ -32,7 +32,9 @@
     gpu::buddy::{
         AllocatedBlocks,
         BuddyFlags,
-        GpuBuddyAllocParams, //
+        GpuBuddy,
+        GpuBuddyAllocParams,
+        GpuBuddyParams, //
     },
     prelude::*,
     sizes::SZ_4K,
@@ -60,29 +62,48 @@
 /// Virtual Memory Manager for a GPU address space.
 ///
 /// Each [`Vmm`] instance manages a single address space identified by its Page
-/// Directory Base (`PDB`) address. The [`Vmm`] is used for BAR1 and BAR2 mappings.
+/// Directory Base (`PDB`) address. The [`Vmm`] is used for Channel, BAR1 and BAR2 mappings.
 ///
 /// The [`Vmm`] tracks all page table allocations made during mapping operations
 /// to ensure they remain valid for the lifetime of the address space.
+///
+/// It tracks virtual address allocations via a buddy allocator.
 pub(crate) struct Vmm {
     pdb_addr: VramAddress,
     mmu_version: MmuVersion,
     /// Page table allocations that must persist for the lifetime of mappings.
     page_table_allocs: KVec<Arc<AllocatedBlocks>>,
+    /// Buddy allocator for virtual address range tracking.
+    virt_buddy: GpuBuddy,
 }
 
 impl Vmm {
     /// Create a new [`Vmm`] for the given Page Directory Base address.
-    pub(crate) fn new(pdb_addr: VramAddress, mmu_version: MmuVersion) -> Result<Self> {
+    ///
+    /// The [`Vmm`] will manage a virtual address space of `va_size` bytes using
+    /// a buddy allocator. This enables [`Vmm::alloc_vfn_range()`] for allocating
+    /// contiguous virtual ranges.
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
 
@@ -96,6 +117,28 @@ pub(crate) fn mmu_version(&self) -> MmuVersion {
         self.mmu_version
     }
 
+    /// Allocate a contiguous virtual frame number range.
+    ///
+    /// Returns an [`Arc<AllocatedBlocks>`] representing the allocated range.
+    /// The allocation is automatically freed when the [`Arc`] is dropped.
+    pub(crate) fn alloc_vfn_range(&self, num_pages: usize) -> Result<(Vfn, Arc<AllocatedBlocks>)> {
+        let params = GpuBuddyAllocParams {
+            start_range_address: 0,
+            end_range_address: 0,
+            size_bytes: num_pages.checked_mul(PAGE_SIZE).ok_or(EOVERFLOW)? as u64,
+            min_block_size_bytes: SZ_4K as u64,
+            buddy_flags: BuddyFlags::try_new(BuddyFlags::CONTIGUOUS_ALLOCATION)?,
+        };
+
+        let alloc = self.virt_buddy.alloc_blocks(params)?;
+
+        // Get the starting offset from the first (and only, due to CONTIGUOUS) block.
+        let offset = alloc.iter().next().ok_or(ENOMEM)?.offset();
+        let vfn = Vfn::new(offset / PAGE_SIZE as u64);
+
+        Ok((vfn, alloc))
+    }
+
     /// Allocate a new page table, zero it, and track the allocation.
     ///
     /// This method ensures page table allocations persist for the lifetime of
-- 
2.34.1

