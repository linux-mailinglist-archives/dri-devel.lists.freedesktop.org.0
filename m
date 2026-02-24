Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YFByFCIsnmn5TgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 23:54:26 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 017FC18DD8D
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 23:54:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D66710E6DC;
	Tue, 24 Feb 2026 22:54:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="TSmEH7QQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011038.outbound.protection.outlook.com [52.101.62.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0186B10E676;
 Tue, 24 Feb 2026 22:54:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TK0RfMqBtUwGL9DmggWr3A6jEWg3ZrCuOcWyhGNriMzBSbD8ZtBEKX1/RUyRuc7liC78EsaIxXvOGqnbbHqvIfDHWCtzRuU146HtwITae4rGqo8Kx8OVeIGOCTcO93xIB0U+HX1Rt2zUiI6KOQ9WkkBHAtRohIdNPRbi1SNJaVIAI4v2ZDkJB/Pb9ZQbxOt43Yvmc4liXY2I5CXgIJMC9TBldDL4bO3PnveCrhjQAzpE5pL0DIKAVSuBZbP9mTG48Y91+p9U6xc2IIrMfpsofNrgUGpZfFrOJy9Sw61Q6JmIe+DPWzMpmSsxU4z/7phSPQB13kwQyeLDAedeakhDtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tvoPuuAk4T08gQqfNr3gEr3D//32V6IP7NsXaKrdloc=;
 b=OnuAbHeYnO7pxPU7d0dTv/sxfZIUndO2EwNIjAtzCU/9FuF3j9eIis6dsHmndwb0RYuU98HYX5AzLRmc0yCTLDsfKIv+XNHXtzupeVp8RYBx4bQs03zh/PKXmB3iapISSVEUUaz654fjEulXFpE5eUnt1zCsD2UwQAoAI8oWt+SVhRzdi0T+X00n2aCNzaJnsL5oRUeO4pyRmO4KOcNZ8b1LqK2Y6xIVAtPrPLEC2DrxdtQKQF7M+kkJiJtkWUnJrqFmznOu4chDt5hReUC4m1fvnhVts/GE3aBmErtOzj0S8ePizXe6nWeidyokkvqksUozNM66TFNaYswaZoTU0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tvoPuuAk4T08gQqfNr3gEr3D//32V6IP7NsXaKrdloc=;
 b=TSmEH7QQfV5SOkMVIdx1uZdlaE2udI0KDxrJ2V3JUeI9k2t7GqEKwsFZqcQbT8dfE5y2v+HyMyN3xSVn9qymuikm6kRT8AnDd9TFPBG/T9as+pdFyHiFbTtEzPA0IikM2CWMW9iyuMo/3a/R47CGDzkPHEk8VbwpUbil7T1Q9P4XENRTNxwpkYfZ6KqVcw4z37rtjyMUzX2HXJK2V1n+XrScf0vbQKdUl9s/32jvDrcLl+SAlX6pus/RSc6eJ4oVIU7tMCSzbqBPiJskzMUqhEzJKX4C9QhrMyj+plMlXdUhRBlqm2B8qZZW42Xh0/TxdoPdukRTiIWiQg1xwyjoMg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 SN7PR12MB6885.namprd12.prod.outlook.com (2603:10b6:806:263::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.21; Tue, 24 Feb 2026 22:54:02 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 22:54:02 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: linux-kernel@vger.kernel.org
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, Dave Airlie <airlied@redhat.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Koen Koning <koen.koning@linux.intel.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 Nikola Djukic <ndjukic@nvidia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
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
 Helge Deller <deller@gmx.de>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, John Hubbard <jhubbard@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Edwin Peer <epeer@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>,
 Andrea Righi <arighi@nvidia.com>, Andy Ritger <aritger@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, Balbir Singh <balbirs@nvidia.com>,
 Philipp Stanner <phasta@kernel.org>,
 Elle Rhumsaa <elle@weathered-steel.dev>, alexeyi@nvidia.com,
 Eliot Courtney <ecourtney@nvidia.com>, joel@joelfernandes.org,
 linux-doc@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, Joel Fernandes <joelagnelf@nvidia.com>
Subject: [PATCH v8 19/25] gpu: nova-core: mm: Add multi-page mapping API to VMM
Date: Tue, 24 Feb 2026 17:53:17 -0500
Message-Id: <20260224225323.3312204-20-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260224225323.3312204-1-joelagnelf@nvidia.com>
References: <20260224225323.3312204-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR03CA0011.namprd03.prod.outlook.com
 (2603:10b6:208:23a::16) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|SN7PR12MB6885:EE_
X-MS-Office365-Filtering-Correlation-Id: 102bc7b0-2c9d-46e3-8d01-08de73f79a05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?z1Ow82I+80kBHSPSmgNMag29BUCHusSzgbhUKjfR9YETUVcXNmAIwDSOvBf6?=
 =?us-ascii?Q?h3FEHAqn8PKRQZ18THsAdHiNbA6MfScoTLufPQNDaYkdysw1IYf+50tQtSsE?=
 =?us-ascii?Q?j2GbguDqlBmaGwZR77mMcLA/s04Rt0v9ncpQZ683JmZZTBCyaHWR/R65Jvph?=
 =?us-ascii?Q?6rPwFRmao78kky9bHR0xNmzRwbWaR2FWKDA88l5QYiyYUAOOBGJRgU8Y6ImW?=
 =?us-ascii?Q?6hXJfb7Wk0sVvcXiaPK0jmc8sqdehrEUpxsb2uSG+vETQ04u9Ap2sKcq9Pvv?=
 =?us-ascii?Q?k87Bl14566xSgGujHVclsQtfkQpjsg/sDa7wsJzF/4z6jqfoX+CMoOyz6XAf?=
 =?us-ascii?Q?XlYOi1A82Je0JQ2Wgq8CHW3O0Nd9XUUVCMqTiWREOc9mjcHXi4V4dUUbWtoP?=
 =?us-ascii?Q?zZkhXzFrqo/GwmT0AwgN2dtLQFLGEUnaYEQFbm4mviDvxzOtIATZoVvMXrbz?=
 =?us-ascii?Q?WX4QjsPjjNlSnepF/l2R8lLnNLWyPsKxRSB0DvYX3dj/SVhWfxcUKVPa5AWL?=
 =?us-ascii?Q?nf2vZ58mHTFM7XqX16fHREYvgTgSqzLke98vKIllzDe6ZZmtFugiVL/kypr/?=
 =?us-ascii?Q?lv+PD+huZuy//ReH/L0xsnYbXj+MENjyfpLVaT7quEvPmeNGXHVKk0wGM8n0?=
 =?us-ascii?Q?+3KLE74RsbqsRecN1MUsymxcjav5hdHbKvbdoVtC+uadBxgaFNLnrBFcid63?=
 =?us-ascii?Q?y+gXDwDFOv1fGhksFQtjGJCdrK7rkM6ZTKfJyd/fXLsv1uezDMTO6sZ4WZIQ?=
 =?us-ascii?Q?uYWUiIXhpTbczqdD3knxyGa0NmQq/g6yWzR0XpP7VzttqFpxeg37PkTgSmlG?=
 =?us-ascii?Q?+4rrIG4edmWhbBp+mWuJWCT6rQqQCkDc9d7D3tCa4LRtJBgsmM+iSKRgrOWf?=
 =?us-ascii?Q?PwSSdE7256PL5rnSXsJde1lnxl3818ju2JFw6V0gUlqfq0QEevEM1k6hQm0t?=
 =?us-ascii?Q?R80EDT4bmZHB8Dl5vOg9AN0CMjUogrEtxY9MWdFPEVre+kqjMQM9VnRgrGnK?=
 =?us-ascii?Q?E7sg+nZtPm8VxoU1r7O6mhuPDP3/64HfhipHnqpohflcsGQeC9l7X+yidad6?=
 =?us-ascii?Q?rTDj3LIYjAXZxr0c0PIYUtOYVU0+2qiUaLZrV8EMNj25gZ5cBSO2XWPY+4iG?=
 =?us-ascii?Q?vcwmTMqJ6Xo5tqMe//ACe9V+R0rtFxZQTX8m3u8NMwGLhKEHbU2gZG+EHx0d?=
 =?us-ascii?Q?PgrSc7qDlt18ibqG1q0bE+gZiRidHYc/Efz41qBUiP8vnZZlLi9yJEuiJNv3?=
 =?us-ascii?Q?UrZ6d5/MhTG6ASaFGSQnb1cuLqnvHRDjp0FcnAbAYWse/BvtS6uRkO3H/GW8?=
 =?us-ascii?Q?ZWkVOLrV7tOxHqAUrKJRDscoQj7lSrEEu0+Lv1hry6X0U8gV8w1lpuuSQsaJ?=
 =?us-ascii?Q?WL2z9MZE/kvZGayLUsagCKx7FiYe7QOeiCTDZF1MLYq4As6cPEk/QHnGL1Na?=
 =?us-ascii?Q?XpfAuwVfCQY7FO4fsakAiSEODTuZA64+Ufj1ywEkHbTwkOQPayvom1QKnNe9?=
 =?us-ascii?Q?tTc4pAO6bS5vtWQP37SaelIZwsyJSUdZgNiU4BC+k05RjErJwdB3dBC53Xgj?=
 =?us-ascii?Q?IQWD3XGksX/FbhKUVTc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Fk9YD8T9G9Xlzsw4iN2S03AQGKMxeurJ0fC8ET7qxafWRMUr7ktaffMd43ce?=
 =?us-ascii?Q?ft2+RqDDItDkssJOeM5REf0IPktjdKAc4egxeqhq6WrunU+4Rojxt9ygxGOw?=
 =?us-ascii?Q?a91VundvM1nwOgggIIfPCxeUNLTJwXKM8tpfgBgdB3QWQoRfUQlFFmKxV71u?=
 =?us-ascii?Q?ip11nxuQCFaqLGRECgk49an9fRaQGPaRw27nNt5S9LO5O0L1+OItbuKHqOsK?=
 =?us-ascii?Q?UKXVPYKWaVWk9Tfe3RFxQwVHu4WU5/FUtRjAd4jWJxjFiPsx05d4DUwSkrba?=
 =?us-ascii?Q?+eZjxFGIiC0QgUWHWl6r1hFsdRXBrHEH5oFwivh9C477Dmk3Ur3W4n7OldgF?=
 =?us-ascii?Q?mK+W0Hzh1OfLlc2rAQ7fK+8FQEO731CGw1PFdY++4y8irZky2KGBo0Quxg9Y?=
 =?us-ascii?Q?5bWSJhNRnQvYiZNqat/FT6u4bz+eVOuLJWA9XUMrBLTL48dPAnLmOspT/Zyd?=
 =?us-ascii?Q?oXpy041iCyenOXeTmZCbX+XdPJdWb0YhRfYAnulO+ZYMKBEdhmgyJy+zs6ND?=
 =?us-ascii?Q?CKfxmu/wW/j5veBAyZtXynSOgn5ZK+TIlGjHCy4/RMEwE9F/PI0xMu+zC0kJ?=
 =?us-ascii?Q?nwdCAF1jh6o3ZmjBcKg/E2XGUwIFAYL+37yKspGa5qU2Qq1zA3FtQ1HdzIqR?=
 =?us-ascii?Q?FRKDNK0uKppp+voWggoGoMDOondqd1uRPY4RMqjU58hQXNBMZKyDXsVXN0jF?=
 =?us-ascii?Q?W+vivT90BTTbzqlNZKN24jcNddTtBTLxBUBtk8la4SmpuIb4ktm4w0srthKP?=
 =?us-ascii?Q?WHyK/rjio9qiDrOs5khMsVyRAYRh3EeFrzcLSOxvJ44Xqn4IYGMKlvAqQnyX?=
 =?us-ascii?Q?pWY9zRxRebkKVzwmtpyXynJaDFv1ejWjLWRV4fvlRmiuzIBAs25wrGO42ay8?=
 =?us-ascii?Q?hLu1e018UmO3sieCobTSYo9OmmbBvizw2XxIMZu17bC5IAIsOXa9i6OcUWVX?=
 =?us-ascii?Q?a5DkXpssTNkgLFwSdth8P5T4AxNfbp5BefGGmBcn+JNK5DuHyiWAz0Y7ZPeS?=
 =?us-ascii?Q?5qKNDPwzWbBwmgn+TIdBczs78vcyK8U9TcNxfumpGpKxE6mIRIjSuuQglzTy?=
 =?us-ascii?Q?OyoMSL2LGSrMUIYQqaWVjOzCRHRay8HT9xwt8y0hXZZ3+d93fIsr9bTa8ck0?=
 =?us-ascii?Q?qj7zBkt++rlHZdv5oyLAfZq/tNsf0lF5B4hkdXemMRkdFNenl62PA4ICmEix?=
 =?us-ascii?Q?R4nYExOYWXkjd99gaQrg8J6d28RwtJISn2/joe6YHx9dxp9P9mSQLRzdQr2y?=
 =?us-ascii?Q?+JpqMJCpKaHOgdavpHeAnGeXBuDzjQCe7BUM+QbhYEBpKAuSAjfAHPFKN8t7?=
 =?us-ascii?Q?y8IYt9ckNkl0sPHzfWBml5oo3xMpLXvOe6X8dyNREWjBA6PBnNug1d/T5eKC?=
 =?us-ascii?Q?Xy3z+/7sbXfZkHx9HSla/dB5xPx6+UUIP5W3c1H4pJT4e2Py15QJMhHSfS/V?=
 =?us-ascii?Q?Nab+TUUcyeCUwr2cuy+3ASWZeUIVbiK+lkO5JHb16O5+7i48JKUCPeyPo1WJ?=
 =?us-ascii?Q?NWPCesPNeK1X9Yahj6wwo1QLMmxprhP4QGpfnEIo4/CXxIcSnAOQIiQmsaFI?=
 =?us-ascii?Q?oBZ20erGPZZbLHo4enA1BZJ9t/bMbnUvJ9HOtnxLLrkbaMf1eQA8LZgnqT0b?=
 =?us-ascii?Q?DUzPcE3TGr/6cdmlTUrtxxyJfFnTiC1kVpT6CSHzNy/DEEVU23A9jCBQvMKy?=
 =?us-ascii?Q?EfIKQ0PId5wElLo4T9nEjZjq4Hgss/sY4/eh5HKWT98I8XVdXM88bysS5S2Q?=
 =?us-ascii?Q?o4Zm0uonUA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 102bc7b0-2c9d-46e3-8d01-08de73f79a05
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 22:54:01.2716 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SEYe+ta6uIcOu5gXmg6F1hI7xE+UQolHaJ+EQ2seq0LetqQAuE6cYaV74IIcNxW7KSNs/pbALHabiT86r8hxBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6885
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
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,redhat.com,collabora.com,linux.intel.com,lists.freedesktop.org,vger.kernel.org,nvidia.com,suse.de,gmail.com,ffwll.ch,lwn.net,amd.com,intel.com,ursulin.net,gmx.de,weathered-steel.dev,joelfernandes.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[joelagnelf@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	RCPT_COUNT_GT_50(0.00)[57];
	TAGGED_RCPT(0.00)[dri-devel];
	NEURAL_HAM(-0.00)[-0.901];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,nvidia.com:mid,nvidia.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 017FC18DD8D
X-Rspamd-Action: no action

Add the page table mapping and unmapping API to the Virtual Memory
Manager, implementing a two-phase prepare/execute model suitable for
use both inside and outside the DMA fence signalling critical path.

Cc: Nikola Djukic <ndjukic@nvidia.com>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/mm/vmm.rs | 359 +++++++++++++++++++++++++++++++-
 1 file changed, 357 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/nova-core/mm/vmm.rs b/drivers/gpu/nova-core/mm/vmm.rs
index d17571db2e2d..c639e06c7d57 100644
--- a/drivers/gpu/nova-core/mm/vmm.rs
+++ b/drivers/gpu/nova-core/mm/vmm.rs
@@ -17,16 +17,26 @@
         GpuBuddyParams, //
     },
     prelude::*,
+    rbtree::{RBTree, RBTreeNode},
     sizes::SZ_4K, //
 };
 
+use core::cell::Cell;
 use core::ops::Range;
 
 use crate::{
     mm::{
         pagetable::{
-            walk::{PtWalk, WalkResult},
-            MmuVersion, //
+            walk::{
+                PtWalk,
+                WalkPdeResult,
+                WalkResult, //
+            },
+            DualPde,
+            MmuVersion,
+            PageTableLevel,
+            Pde,
+            Pte, //
         },
         GpuMm,
         Pfn,
@@ -51,6 +61,74 @@ pub(crate) struct Vmm {
     page_table_allocs: KVec<Pin<KBox<AllocatedBlocks>>>,
     /// Buddy allocator for virtual address range tracking.
     virt_buddy: GpuBuddy,
+    /// Prepared PT pages pending PDE installation, keyed by `install_addr`.
+    ///
+    /// Populated by `Vmm` mapping prepare phase and drained in the execute phase.
+    /// Shared by all pending maps in the `Vmm`, thus preventing races where 2
+    /// maps might be trying to install the same page table/directory entry pointer.
+    pt_pages: RBTree<VramAddress, PreparedPtPage>,
+}
+
+/// A pre-allocated and zeroed page table page.
+///
+/// Created during the mapping prepare phase and consumed during the mapping execute phase.
+/// Stored in an [`RBTree`] keyed by the PDE slot address (`install_addr`).
+struct PreparedPtPage {
+    /// The allocated and zeroed page table page.
+    alloc: Pin<KBox<AllocatedBlocks>>,
+    /// Page table level -- needed to determine if this PT page is for a dual PDE.
+    level: PageTableLevel,
+}
+
+/// Multi-page prepared mapping -- VA range allocated, ready for execute.
+///
+/// Produced by [`Vmm::prepare_map()`], consumed by [`Vmm::execute_map()`].
+/// The struct owns the VA space allocation between prepare and execute phases.
+pub(crate) struct PreparedMapping {
+    vfn_start: Vfn,
+    num_pages: usize,
+    vfn_alloc: Pin<KBox<AllocatedBlocks>>,
+}
+
+/// Result of a mapping operation -- tracks the active mapped range.
+///
+/// Returned by [`Vmm::execute_map()`] and [`Vmm::map_pages()`].
+/// Owns the VA allocation; the VA range is freed when this is dropped.
+/// Callers must call [`Vmm::unmap_pages()`] before dropping to invalidate
+/// PTEs (dropping only frees the VA range, not the PTE entries).
+pub(crate) struct MappedRange {
+    pub(crate) vfn_start: Vfn,
+    pub(crate) num_pages: usize,
+    /// VA allocation -- freed when [`MappedRange`] is dropped.
+    _vfn_alloc: Pin<KBox<AllocatedBlocks>>,
+    /// Logs a warning if dropped without unmapping.
+    _drop_guard: MustUnmapGuard,
+}
+
+/// Guard that logs a warning once if a [`MappedRange`] is dropped without
+/// calling [`Vmm::unmap_pages()`].
+struct MustUnmapGuard {
+    armed: Cell<bool>,
+}
+
+impl MustUnmapGuard {
+    const fn new() -> Self {
+        Self {
+            armed: Cell::new(true),
+        }
+    }
+
+    fn disarm(&self) {
+        self.armed.set(false);
+    }
+}
+
+impl Drop for MustUnmapGuard {
+    fn drop(&mut self) {
+        if self.armed.get() {
+            kernel::pr_warn!("MappedRange dropped without calling unmap_pages()\n");
+        }
+    }
 }
 
 impl Vmm {
@@ -78,6 +156,7 @@ pub(crate) fn new(
             mmu_version,
             page_table_allocs: KVec::new(),
             virt_buddy,
+            pt_pages: RBTree::new(),
         })
     }
 
@@ -136,4 +215,280 @@ pub(crate) fn read_mapping(&self, mm: &GpuMm, vfn: Vfn) -> Result<Option<Pfn>> {
             WalkResult::Unmapped { .. } | WalkResult::PageTableMissing => Ok(None),
         }
     }
+
+    /// Allocate and zero a physical page table page for a specific PDE slot.
+    /// Called during the map prepare phase.
+    fn alloc_and_zero_page_table(
+        &mut self,
+        mm: &GpuMm,
+        level: PageTableLevel,
+    ) -> Result<PreparedPtPage> {
+        let params = GpuBuddyAllocParams {
+            start_range_address: 0,
+            end_range_address: 0,
+            size_bytes: SZ_4K.into_safe_cast(),
+            min_block_size_bytes: SZ_4K.into_safe_cast(),
+            buddy_flags: BuddyFlags::try_new(0)?,
+        };
+        let blocks = KBox::pin_init(mm.buddy().alloc_blocks(&params), GFP_KERNEL)?;
+
+        // Get page's VRAM address from the allocation.
+        let page_vram = VramAddress::new(blocks.iter().next().ok_or(ENOMEM)?.offset());
+
+        // Zero via PRAMIN.
+        let mut window = mm.pramin().window()?;
+        let base = page_vram.raw();
+        for off in (0..PAGE_SIZE).step_by(8) {
+            window.try_write64(base + off, 0)?;
+        }
+
+        Ok(PreparedPtPage {
+            alloc: blocks,
+            level,
+        })
+    }
+
+    /// Ensure all intermediate page table pages are prepared for a [`Vfn`]. Just
+    /// finds out which PDE pages are missing, allocates pages for them, and defers
+    /// installation to the execute phase.
+    ///
+    /// PRAMIN is released before each allocation and re-acquired after. Memory
+    /// allocations outside of holding this lock to prevent deadlocks with fence signalling
+    /// critical path.
+    fn ensure_pte_path(&mut self, mm: &GpuMm, vfn: Vfn) -> Result {
+        let walker = PtWalk::new(self.pdb_addr, self.mmu_version);
+        let max_iter = 2 * self.mmu_version.pde_level_count();
+
+        // Keep looping until all PDE levels are resolved.
+        for _ in 0..max_iter {
+            let mut window = mm.pramin().window()?;
+
+            // Walk PDE levels. The closure checks self.pt_pages for prepared-but-uninstalled
+            // pages, letting the walker continue through them as if they were installed in HW.
+            // The walker keeps calling the closure to get these "prepared but not installed" pages.
+            let result = walker.walk_pde_levels(&mut window, vfn, |install_addr| {
+                self.pt_pages
+                    .get(&install_addr)
+                    .and_then(|p| Some(VramAddress::new(p.alloc.iter().next()?.offset())))
+            })?;
+
+            match result {
+                WalkPdeResult::Complete { .. } => {
+                    // All PDE levels resolved.
+                    return Ok(());
+                }
+                WalkPdeResult::Missing {
+                    install_addr,
+                    level,
+                } => {
+                    // Drop PRAMIN before allocation.
+                    drop(window);
+                    let page = self.alloc_and_zero_page_table(mm, level)?;
+                    let node = RBTreeNode::new(install_addr, page, GFP_KERNEL)?;
+                    let old = self.pt_pages.insert(node);
+                    if old.is_some() {
+                        kernel::pr_warn_once!(
+                            "VMM: duplicate install_addr in pt_pages (internal consistency error)\n"
+                        );
+                        return Err(EIO);
+                    }
+                    // Loop: re-acquire PRAMIN and re-walk from root.
+                }
+            }
+        }
+
+        kernel::pr_warn!(
+            "VMM: ensure_pte_path: loop exhausted after {} iters (VFN {:?})\n",
+            max_iter,
+            vfn
+        );
+        Err(EIO)
+    }
+
+    /// Prepare resources for mapping `num_pages` pages.
+    ///
+    /// Allocates a contiguous VA range, then walks the hierarchy per-VFN to prepare pages
+    /// for all missing PDEs. Returns a [`PreparedMapping`] with the VA allocation.
+    ///
+    /// If `va_range` is not `None`, the VA range is constrained to the given range. Safe
+    /// to call outside the fence signalling critical path.
+    pub(crate) fn prepare_map(
+        &mut self,
+        mm: &GpuMm,
+        num_pages: usize,
+        va_range: Option<Range<u64>>,
+    ) -> Result<PreparedMapping> {
+        if num_pages == 0 {
+            return Err(EINVAL);
+        }
+
+        // Pre-reserve so execute_map() can use push_within_capacity (no alloc in
+        // fence signalling critical path).
+        // Upper bound on page table pages needed for the full tree (PTE pages + PDE
+        // pages at all levels).
+        let pt_upper_bound = self.mmu_version.pt_pages_upper_bound(num_pages);
+        self.page_table_allocs.reserve(pt_upper_bound, GFP_KERNEL)?;
+
+        // Allocate contiguous VA range.
+        let (vfn_start, vfn_alloc) = self.alloc_vfn_range(num_pages, va_range)?;
+
+        // Walk the hierarchy per-VFN to prepare pages for all missing PDEs.
+        for i in 0..num_pages {
+            let i_u64: u64 = i.into_safe_cast();
+            let vfn = Vfn::new(vfn_start.raw() + i_u64);
+            self.ensure_pte_path(mm, vfn)?;
+        }
+
+        Ok(PreparedMapping {
+            vfn_start,
+            num_pages,
+            vfn_alloc,
+        })
+    }
+
+    /// Execute a prepared multi-page mapping.
+    ///
+    /// Drain prepared PT pages and install PDEs followed by single TLB flush.
+    pub(crate) fn execute_map(
+        &mut self,
+        mm: &GpuMm,
+        prepared: PreparedMapping,
+        pfns: &[Pfn],
+        writable: bool,
+    ) -> Result<MappedRange> {
+        if pfns.len() != prepared.num_pages {
+            return Err(EINVAL);
+        }
+
+        let PreparedMapping {
+            vfn_start,
+            num_pages,
+            vfn_alloc,
+        } = prepared;
+
+        let walker = PtWalk::new(self.pdb_addr, self.mmu_version);
+        let mut window = mm.pramin().window()?;
+
+        // First, drain self.pt_pages, install all pending PDEs.
+        let mut cursor = self.pt_pages.cursor_front_mut();
+        while let Some(c) = cursor {
+            let (next, node) = c.remove_current();
+            let (install_addr, page) = node.to_key_value();
+            let page_vram = VramAddress::new(page.alloc.iter().next().ok_or(ENOMEM)?.offset());
+
+            if page.level == self.mmu_version.dual_pde_level() {
+                let new_dpde = DualPde::new_small(self.mmu_version, Pfn::from(page_vram));
+                new_dpde.write(&mut window, install_addr)?;
+            } else {
+                let new_pde = Pde::new_vram(self.mmu_version, Pfn::from(page_vram));
+                new_pde.write(&mut window, install_addr)?;
+            }
+
+            // Track the allocated pages in the `Vmm`.
+            self.page_table_allocs
+                .push_within_capacity(page.alloc)
+                .map_err(|_| ENOMEM)?;
+
+            cursor = next;
+        }
+
+        // Next, write PTEs (all PDEs now installed in HW).
+        for (i, &pfn) in pfns.iter().enumerate() {
+            let i_u64: u64 = i.into_safe_cast();
+            let vfn = Vfn::new(vfn_start.raw() + i_u64);
+            let result = walker.walk_to_pte_lookup_with_window(&mut window, vfn)?;
+
+            match result {
+                WalkResult::Unmapped { pte_addr } | WalkResult::Mapped { pte_addr, .. } => {
+                    let pte = Pte::new_vram(self.mmu_version, pfn, writable);
+                    pte.write(&mut window, pte_addr)?;
+                }
+                WalkResult::PageTableMissing => {
+                    kernel::pr_warn_once!("VMM: page table missing for VFN {vfn:?}\n");
+                    return Err(EIO);
+                }
+            }
+        }
+
+        drop(window);
+
+        // Finally, flush the TLB.
+        mm.tlb().flush(self.pdb_addr)?;
+
+        Ok(MappedRange {
+            vfn_start,
+            num_pages,
+            _vfn_alloc: vfn_alloc,
+            _drop_guard: MustUnmapGuard::new(),
+        })
+    }
+
+    /// Map pages doing prepare and execute in the same call.
+    ///
+    /// This is a convenience wrapper for callers outside the fence signalling critical
+    /// path (e.g., BAR mappings). For DRM usecases, [`Vmm::prepare_map()`] and
+    /// [`Vmm::execute_map()`] will be called separately.
+    pub(crate) fn map_pages(
+        &mut self,
+        mm: &GpuMm,
+        pfns: &[Pfn],
+        va_range: Option<Range<u64>>,
+        writable: bool,
+    ) -> Result<MappedRange> {
+        if pfns.is_empty() {
+            return Err(EINVAL);
+        }
+
+        // Check if provided VA range is sufficient (if provided).
+        if let Some(ref range) = va_range {
+            let required: u64 = pfns
+                .len()
+                .checked_mul(PAGE_SIZE)
+                .ok_or(EOVERFLOW)?
+                .into_safe_cast();
+            let available = range.end.checked_sub(range.start).ok_or(EINVAL)?;
+            if available < required {
+                return Err(EINVAL);
+            }
+        }
+
+        let prepared = self.prepare_map(mm, pfns.len(), va_range)?;
+        self.execute_map(mm, prepared, pfns, writable)
+    }
+
+    /// Unmap all pages in a [`MappedRange`] with a single TLB flush.
+    ///
+    /// Takes the range by value (consumes it), then invalidates PTEs for the range,
+    /// flushes the TLB, then drops the range (freeing the VA). PRAMIN lock is held.
+    pub(crate) fn unmap_pages(&mut self, mm: &GpuMm, range: MappedRange) -> Result {
+        let walker = PtWalk::new(self.pdb_addr, self.mmu_version);
+        let invalid_pte = Pte::invalid(self.mmu_version);
+
+        let mut window = mm.pramin().window()?;
+        for i in 0..range.num_pages {
+            let i_u64: u64 = i.into_safe_cast();
+            let vfn = Vfn::new(range.vfn_start.raw() + i_u64);
+            let result = walker.walk_to_pte_lookup_with_window(&mut window, vfn)?;
+
+            match result {
+                WalkResult::Mapped { pte_addr, .. } | WalkResult::Unmapped { pte_addr } => {
+                    invalid_pte.write(&mut window, pte_addr)?;
+                }
+                WalkResult::PageTableMissing => {
+                    continue;
+                }
+            }
+        }
+        drop(window);
+
+        mm.tlb().flush(self.pdb_addr)?;
+
+        // TODO: Internal page table pages (PDE, PTE pages) are still kept around.
+        // This is by design as repeated maps/unmaps will be fast. As a future TODO,
+        // we can add a reclaimer here to reclaim if VRAM is short. For now, the PT
+        // pages are dropped once the `Vmm` is dropped.
+
+        range._drop_guard.disarm(); // Unmap complete, Ok to drop MappedRange.
+        Ok(())
+    }
 }
-- 
2.34.1

