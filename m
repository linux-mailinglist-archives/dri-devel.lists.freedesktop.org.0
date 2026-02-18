Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WDrkKXAtlmm5bwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 22:21:52 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B590159F4F
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 22:21:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 047B310E6B1;
	Wed, 18 Feb 2026 21:21:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="SxDxqwhn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010005.outbound.protection.outlook.com
 [52.101.193.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6288210E669;
 Wed, 18 Feb 2026 21:21:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rp2Y+stt3WSxWy7PClrvZU6rQJ/fvMKncocVN1rSJeVO3eDi2rD3XWEtuo1MUTZ0TDHYGXPu9JJCmzOMovW2JpXT7T2WhGZ4y4DSj/hGCv/cAap7xuOPGwP8Bs5Q7lq1e9tya+94sw/g+HUAkYb4JFEW33T7f3T+fp8SpG2KsN4bEQ3hVQ22WM7HqRp/3WA52ov0zSw2y0CZQTnp5Bc79IzNucwCdd9+umgOF6Rh2GlaEFs/tBEcCquFEqqrmyuXKopJPVb98gV9yNoBiUt11zocsBr8Db7ZdNWLv9WVEw7U93+UU2lPXN7GHUB/WPmE9MJW7pj/KcK0gNO/dn8sJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Qp1LCdSFwsty8d96pzqazVljLBZaX85Lut2glWyFgo=;
 b=e52AgmUaX8SZ0Yc/KZEIXnceg10/6en6v+XuM6K9oPJhIdddwmu+xoyEd7B3Qb0kwaHf0mn1zGgf/OxX94/ahRhA1PZFF/HWkAU8uQTHIcrfh5ZsMVM8cBrfLju6zlNwIXjA1wOwxN6Cj7CNxSmgj0mkfCPnz33mFoF+rdUvE86i9o0o8MiSQ4GJLuig8BmpIq+R7jkZny8+X4hXhuSa8KNKa17Omtv3QBRxHEqBXiSqqdhUnmkE+PoXy9aYr0MUt8MUWjishnGA6/Kr9mFbhdysNSLCKO6fnRcxIe5XFKJBqIFkyQ74G+IXQMTCrotPpVRh119Q1bEo+fVgpZr3Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Qp1LCdSFwsty8d96pzqazVljLBZaX85Lut2glWyFgo=;
 b=SxDxqwhnPiRkxrLfMD+AqHdu9XgAaUVbhulPFb6x+s4JlQ//NFBpdAmZOiQYln9rNPloJxUALsNkiX7Kh7x5ufgKWzjmwOVv6/lajwMWDkoIAZiqBXt/D444hxe0eXoA2NawEtdCfkAezMLXw4j8o4DntRL5BjnaIzQ5SFNx9h84wVJ1H9NcycVb+yHCNiDvI44PVwcxzaoddI/ra0AQ9HAdn/aGkpALUcT4QtnX4Ef74+b+Re+tZVsJz3e11sgv0w0RA/igOjJ32ThpesWN69h6EYTqrrcww+U3zgzOdR41pbmsHr6GbLrKgBnR99IS9YAJqJ05rh2U+Cl6Gz1fWg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 SJ0PR12MB6805.namprd12.prod.outlook.com (2603:10b6:a03:44f::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.16; Wed, 18 Feb 2026 21:21:40 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9632.010; Wed, 18 Feb 2026
 21:21:40 +0000
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
Subject: [PATCH v7 22/23] nova-core: mm: Use usable VRAM region for buddy
 allocator
Date: Wed, 18 Feb 2026 16:20:19 -0500
Message-Id: <20260218212020.800836-23-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260218212020.800836-1-joelagnelf@nvidia.com>
References: <20260218212020.800836-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR20CA0048.namprd20.prod.outlook.com
 (2603:10b6:208:235::17) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|SJ0PR12MB6805:EE_
X-MS-Office365-Filtering-Correlation-Id: 60a8a7ec-ac09-434b-274f-08de6f33b4dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Xw6X3pHVE/YhML/SGfObOa1C/EL/RGS5hw7XgkZUz+ZYevtHJCFm8SSY2eit?=
 =?us-ascii?Q?L+YLjJLI3OcR+BnazovlawhByISXY4+F9soZDMuAx6IfQfTD5JaWUfNU6vK6?=
 =?us-ascii?Q?SQEwNa5GBUcRUfUlOYDkllQ/lx6IpWfI5di/qBenJs6FZLL7snjJ/O4uwKxp?=
 =?us-ascii?Q?k/EufdVSlve/5LdvqY4QSstj1gy5LQNnQbPvBHSOqUc0uE1fXJCL7lTchcZj?=
 =?us-ascii?Q?zVRjTcoie+RlDSF9Jx1DQlnlqyg/sTxI+qHP2DOIGXagnwn9KqyMVtp3x2kY?=
 =?us-ascii?Q?Gs9971HotuIZtHO7+ydlLt2277mEkZer9MpID4uRvElp5cX3M4r7plswwNyJ?=
 =?us-ascii?Q?iY+04usDLgtOScS+tRqZKESR6UkcLDd6+HGnh5pP4dTxY3koQlBQQjnSIgMv?=
 =?us-ascii?Q?jKcmQsXcC8cdiFhiSJDS5pwPb29tKfCZhY8tsYKZM5jjuUYMZ4pLdEfJCo+r?=
 =?us-ascii?Q?h5uLL+UXxEZfAddVa8Otf8PfEfRGJsQSL67lKj0T4pt2JySOavaxTFYozarz?=
 =?us-ascii?Q?nyJ9QOWoFS7w7pHh9FLcTNoBylKJ0kCZ9Drf3dJV4r3sX9VMLactTNTmBPfF?=
 =?us-ascii?Q?FjAVAVBlLSM0JjWjDvrw97HjOXhJv7i1lNAzdadvgErOaEz1eWr/jSvzIAm6?=
 =?us-ascii?Q?e0NWYsLmpufEftELauEVMSz6mAdGn0arjdxKngpgdXlMCM4ubKD41UBump2l?=
 =?us-ascii?Q?4ntOwpelzG2dvbdXnadmcI6/4GCmHPFV4bjf+RKvIE3GkD7dit0gbgml6OmX?=
 =?us-ascii?Q?pNYQkAuVIv40oC2zrTgfxoJ9bSls8u+0fBqc1mRHfE0ieFCoIKuZTS6A4UJ0?=
 =?us-ascii?Q?deM9lTsfXzXPGr+ldYCHA0S2WfzPK5NPMvdDLPIm5qzdpj3zKGXs72GnMmsH?=
 =?us-ascii?Q?5fC9orQISO+5ixiz8CBVpPVAoH8G5OXP6PpRfw9NoQ1pCK+bPUJLzqYW1XrF?=
 =?us-ascii?Q?Zu3xLkxrrtlvLXMU8n2OV0EASlIp/raM3K1i9D6cr/LBS+oYQzWVcEdnIxZ2?=
 =?us-ascii?Q?hqc1sKVFzhFUvhiJ7GLemcuzIHfAEdSpI/YZfdg0Hcjy2ml8GQvV8LBuuBL1?=
 =?us-ascii?Q?9XykfXKu8cHiFnTWSDqAvwjjwqF2aMW/aDTpqPDbdAQc7BfXEs9p7cCc1e1v?=
 =?us-ascii?Q?G9lvYmsRi7YFzdfqHwgg5yZMJu/UOSYvwEJ9/U/BUgjYGRCXdMjiXvhsI38R?=
 =?us-ascii?Q?Ezs9GXJduy+3jhLJAFW1KbRlSoEFzCyIMN/zR3eTwSQbbU4xKF71RR7Q48mK?=
 =?us-ascii?Q?NaBjeF36W1AibPQRp2qAWaomJeLgvGy9PBzJjDntrrkHaLJFfarMCwtrYgHn?=
 =?us-ascii?Q?3iN2rA/BsHzIxFpS80jv8rrAXiOsa0Dzq9TlzT8BobnM/hFirrVdPCMF9B/j?=
 =?us-ascii?Q?PHF5YmBOaZCAIdDMBDLq8a6hFpOaUKxCEuchwVo0oKIP1s8jOZXbZo7JhgOD?=
 =?us-ascii?Q?s26yPZMargfql+3U3ZvaSXsSYoSH7e3/xB1AIXL8X7C8wcAn4hW1iMYimbky?=
 =?us-ascii?Q?hmMTTReC4ZKTw69441uXu8DYrce9IprEKTd5ghq/k7eiMcCYyfrXX3StVcYz?=
 =?us-ascii?Q?ffSNiBEKGl+f0ERCHHM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XPV0zbdguj6dCVF26gT2TCah4IxG5vyOaHe7nHjO3Q9aGuTUm/0gSGPV1Coh?=
 =?us-ascii?Q?KV9HbpUGN2mhwi7+D/4UDjTNtnEdSKAqJTGLgaa5PeYjNSx2yIsmvc3VRW85?=
 =?us-ascii?Q?J8zZGyK1v4crSFLnl7qgQFPbzKQU4mKhGrY7zsusMR+jpwsDzmwscEh7kt8L?=
 =?us-ascii?Q?BAFk38rAAFfQTzu/VM5WzS/q4W3mrjt9eqXRqASnxZR5HsLWBOJiZtGYIqa/?=
 =?us-ascii?Q?myYb/riZctob9MtaPixxYbbjja6XZoSADr+AeUBfc4K4YlI9v1ah8BMWNS7r?=
 =?us-ascii?Q?SdIHT8nFSiPrl7dXqa4/GYEn7/Do3RbMeo0yfch1ZzBmIsQIvf6bF3GqBbXj?=
 =?us-ascii?Q?rrmz5RrL0f8cMt4p8DxoB0NmJm9kyaVFpNmG84OLRbQKsAiAoS+kK6hX5dxn?=
 =?us-ascii?Q?KW4c7sFAY7CYVxH3lI6f+9MR9Tc+bfjqjKV2aCldPGEWuMO2PU4jZLrwYMcd?=
 =?us-ascii?Q?+AxJ7yYFv9eyhm3CdbrQ+G2+KGCRwRJM3R76RPH/dog8Tsp84uwo1+gHjAJe?=
 =?us-ascii?Q?gApRDlXD0MsZYgNwhvLMpsgN7jmeDS5gjwnnd0fNyv+VidI/DvGIf8h0auEv?=
 =?us-ascii?Q?D21Erq+No5lEKhb/j46+xSfRJInnwB+hGESxSAhj8v83Q2nD2e5f1ZJrKj9y?=
 =?us-ascii?Q?q0zYPhtL1FIn129HVXtK3Gnu52g7Cg3/plIY5lL8S2ZqvEEJq9R/xrHmbR9y?=
 =?us-ascii?Q?iEccdZoTSwXePAr6I449XuaU6RUotve6wUmTL570U9lqWLJs28+CcZjFNcdb?=
 =?us-ascii?Q?VmTyPOiwy5/iiQ73IEfRxjOtLcVjZU4hTpgd7aaz1wpzgZko44/g7PY7GozM?=
 =?us-ascii?Q?Vn7tI/kBzb/mRIW5S8pYcQMDE2/NITuYtOjWm62DgQlxElbedfYaf5C2LeO2?=
 =?us-ascii?Q?k5AI5Wi5KYIthW4axw55gzVcXlbHQpHESyZH+1aMMGsPzm7yHG9FgZztBXM5?=
 =?us-ascii?Q?4o2kCSJK3Y2k8BVPDT9qG2Y1Ppu1kJnO+g4bVMKH1mNdSKuIcr/cJThtx+Yv?=
 =?us-ascii?Q?FvXzLWnGllxUfOmv/EmfTikM1rCC6duWx7WY0ElwpGO/Ss2R75KpKwdvl/vf?=
 =?us-ascii?Q?xU4/WiyawP5khOBD6KY6VmOe428zeWlHLmunjLt+g8qcA8/IyKkR52zueSkR?=
 =?us-ascii?Q?+/7CQOpjXzOjwRhsz/nIute/iDnqKkq8EMgBcSD90IoTNUMILEVCCizYapfT?=
 =?us-ascii?Q?X1dNh7L8vkxnuc/Zc51gZA/f0mB1QICM2xDNTFLLhj8yKJFCT/gmeQKwEuuk?=
 =?us-ascii?Q?niZruZgCdAFrYrkRVHwJOY9zHNZCAdcGuDqQ17G6aThU1RMYmo4ko9eFw7sR?=
 =?us-ascii?Q?+IRZVndNK4BmZQn8tCLOVvxrTg3ik1aOh+2MHTeFjSO3kk0p8eSgUqt/QHSe?=
 =?us-ascii?Q?DZ/v50Z3Fc+vKu2wqnpXWk+0Y8sVt4r+5kcMskoRsrR1gvZoeOWvrtjIID3y?=
 =?us-ascii?Q?ZUQZbbrbdRtpIf0jgo8IIVBqjUdO4mtYL6G4F8Q4oI5w8SuuU96QfeMgFyQ2?=
 =?us-ascii?Q?CONmZAkFOkt9gbwUBuQo6mvd5rWPQ+i1KtmXBi8wUHmJD+MHDXX1vbWX3fdJ?=
 =?us-ascii?Q?fu5C8WsaROptl0O/bFECjU0AMGBlrFhrQHkY9FcEcgvPVCtcKQHltcciZ0uf?=
 =?us-ascii?Q?lilbFj45TMZ1iV2zmXE0tGMHSoNhM3jo360F0V0e+E6YZlYGFmxTp7yXXdzg?=
 =?us-ascii?Q?1iLrod7+paVV5kV/7yLygJOFsr83g/vmXyYAcX/6zVt8KG+dm/3/4RrIQKow?=
 =?us-ascii?Q?5/Zkoj45dQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60a8a7ec-ac09-434b-274f-08de6f33b4dc
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 21:21:40.2598 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xx/FBiHPjHC1DNlAGFbPIZOnD4tBb5p28pDURFBxkQQl0yctun7liw7swmSndbiwTPGkQfhWFDZNzcvP5REKrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6805
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,Nvidia.com:dkim,nvidia.com:mid,nvidia.com:email]
X-Rspamd-Queue-Id: 5B590159F4F
X-Rspamd-Action: no action

The buddy allocator manages the actual usable VRAM. On my GA102 Ampere
with 24GB video memory, that is ~23.7GB on a 24GB GPU enabling proper
GPU memory allocation for driver use.

Cc: Nikola Djukic <ndjukic@nvidia.com>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/gpu.rs          | 62 ++++++++++++++++++++++-----
 drivers/gpu/nova-core/gsp/boot.rs     |  7 ++-
 drivers/gpu/nova-core/gsp/commands.rs |  2 -
 3 files changed, 57 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index af5a0ffe78aa..670a2a89c6ec 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -1,5 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 
+use core::cell::Cell;
+
 use kernel::{
     device,
     devres::Devres,
@@ -7,7 +9,7 @@
     gpu::buddy::GpuBuddyParams,
     pci,
     prelude::*,
-    sizes::{SZ_1M, SZ_4K},
+    sizes::SZ_4K,
     sync::Arc, //
 };
 
@@ -28,6 +30,13 @@
     regs,
 };
 
+/// Parameters extracted from GSP boot for initializing memory subsystems.
+#[derive(Clone, Copy)]
+struct BootParams {
+    usable_vram_start: u64,
+    usable_vram_size: u64,
+}
+
 macro_rules! define_chipset {
     ({ $($variant:ident = $value:expr),* $(,)* }) =>
     {
@@ -271,6 +280,13 @@ pub(crate) fn new<'a>(
         devres_bar: Arc<Devres<Bar0>>,
         bar: &'a Bar0,
     ) -> impl PinInit<Self, Error> + 'a {
+        // Cell to share boot parameters between GSP boot and subsequent initializations.
+        // Contains usable VRAM region from FbLayout and BAR1 PDE base from GSP info.
+        let boot_params: Cell<BootParams> = Cell::new(BootParams {
+            usable_vram_start: 0,
+            usable_vram_size: 0,
+        });
+
         try_pin_init!(Self {
             spec: Spec::new(pdev.as_ref(), bar).inspect(|spec| {
                 dev_info!(pdev.as_ref(),"NVIDIA ({})\n", spec);
@@ -292,18 +308,42 @@ pub(crate) fn new<'a>(
 
             sec2_falcon: Falcon::new(pdev.as_ref(), spec.chipset)?,
 
-            // Create GPU memory manager owning memory management resources.
-            // This will be initialized with the usable VRAM region from GSP in a later
-            // patch. For now, we use a placeholder of 1MB.
-            mm <- GpuMm::new(devres_bar.clone(), &GpuBuddyParams {
-                base_offset_bytes: 0,
-                physical_memory_size_bytes: SZ_1M as u64,
-                chunk_size_bytes: SZ_4K as u64,
-            })?,
-
             gsp <- Gsp::new(pdev),
 
-            gsp_static_info: { gsp.boot(pdev, bar, spec.chipset, gsp_falcon, sec2_falcon)?.0 },
+            // Boot GSP and extract usable VRAM region for buddy allocator.
+            gsp_static_info: {
+                let (info, fb_layout) = gsp.boot(pdev, bar, spec.chipset, gsp_falcon, sec2_falcon)?;
+
+                let usable_vram = fb_layout.usable_vram.as_ref().ok_or_else(|| {
+                    dev_err!(pdev.as_ref(), "No usable FB regions found from GSP\n");
+                    ENODEV
+                })?;
+
+                dev_info!(
+                    pdev.as_ref(),
+                    "Using FB region: {:#x}..{:#x}\n",
+                    usable_vram.start,
+                    usable_vram.end
+                );
+
+                boot_params.set(BootParams {
+                    usable_vram_start: usable_vram.start,
+                    usable_vram_size: usable_vram.end - usable_vram.start,
+                });
+
+                info
+            },
+
+            // Create GPU memory manager owning memory management resources.
+            // Uses the usable VRAM region from GSP for buddy allocator.
+            mm <- {
+                let params = boot_params.get();
+                GpuMm::new(devres_bar.clone(), GpuBuddyParams {
+                    base_offset_bytes: params.usable_vram_start,
+                    physical_memory_size_bytes: params.usable_vram_size,
+                    chunk_size_bytes: SZ_4K as u64,
+                })?
+            },
 
             bar: devres_bar,
         })
diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index 7a4a0c759267..bc4446282613 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -150,7 +150,7 @@ pub(crate) fn boot(
 
         let gsp_fw = KBox::pin_init(GspFirmware::new(dev, chipset, FIRMWARE_VERSION), GFP_KERNEL)?;
 
-        let fb_layout = FbLayout::new(chipset, bar, &gsp_fw)?;
+        let mut fb_layout = FbLayout::new(chipset, bar, &gsp_fw)?;
         dev_dbg!(dev, "{:#x?}\n", fb_layout);
 
         Self::run_fwsec_frts(dev, gsp_falcon, bar, &bios, &fb_layout)?;
@@ -252,6 +252,11 @@ pub(crate) fn boot(
             Err(e) => dev_warn!(pdev.as_ref(), "GPU name unavailable: {:?}\n", e),
         }
 
+        // Populate usable VRAM from GSP response.
+        if let Some((base, size)) = info.usable_fb_region() {
+            fb_layout.set_usable_vram(base, size);
+        }
+
         Ok((info, fb_layout))
     }
 }
diff --git a/drivers/gpu/nova-core/gsp/commands.rs b/drivers/gpu/nova-core/gsp/commands.rs
index 44f8b08683f9..8b3fa29c57f1 100644
--- a/drivers/gpu/nova-core/gsp/commands.rs
+++ b/drivers/gpu/nova-core/gsp/commands.rs
@@ -191,7 +191,6 @@ pub(crate) struct GetGspStaticInfoReply {
     gpu_name: [u8; 64],
     bar1_pde_base: u64,
     /// First usable FB region `(base, size)` for memory allocation.
-    #[expect(dead_code)]
     usable_fb_region: Option<(u64, u64)>,
 }
 
@@ -242,7 +241,6 @@ pub(crate) fn bar1_pde_base(&self) -> u64 {
 
     /// Returns the usable FB region `(base, size)` for driver allocation which is
     /// already retrieved from the GSP.
-    #[expect(dead_code)]
     pub(crate) fn usable_fb_region(&self) -> Option<(u64, u64)> {
         self.usable_fb_region
     }
-- 
2.34.1

