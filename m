Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +CdJKHItlmmlbwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 22:21:54 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 534DC159F5F
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 22:21:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40F9E10E6AC;
	Wed, 18 Feb 2026 21:21:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ghlkt1jp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011057.outbound.protection.outlook.com
 [40.93.194.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D13FA10E699;
 Wed, 18 Feb 2026 21:21:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vMM4bGAFQTsZA8YVrEovUUcufPXYyai2nUmiwHo9421Ch14a0cnhuAqnWc/7p9qu3LeT800bpLWh+nZobfAKlH4pbzqgBKoaLeSc5LY/XpFFMX4a8VY4Ks+7Lv9ihoJvgsC6cS4vY4UNK6FWwuolCh1GydJFE2zNL4DJg6UriZbgx1A8VauAyfWu6QgBBT1dUm8JUjC5FG78hnyqIguYNpe+QYX90B6VSRxuP6PJLSMu07xfU5c6m5M2ubFC3ZeWnOImNWdAmSjfpb4TdnMkbuEZJBKWH/fU5nyknokU6rfFtKXcR/EpxJyVMZoco023mKO8ZE1JAm6hIx5qcpayiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oEFoi0XF3NRMKs/0e55+d2lFKLXGaXv3MzDlki0jRHs=;
 b=THE3HelhnY5mE+tfTLKqYJ13AXfrMtUYUmlURwZzoBPS0x+vj5tHdwyl/jHWIe0QPiKenDvebR3wtQ12o627YVI6PneRu7DAusfVTtJTwvCf2Uke6qDEOedItcSCIP/AGTS6cUjXGGJSbz8kGFfzPH8C4i8TAFfe1VjB9jtMpGn24j0VZ8HCVFY/MM5a+DlnZoPuQeITmWRu4sUJFZbaoR4WZp1VwIwhQJ4f909QTzKBS0+/ROEZfVnpz8WGQ55PpoP7F3ooNk6UqPOwH7f177ObfAcacl59+lOlRbp5xFv3Xo5eOx8FJ6E9hcKpd/OjJ2FweJArPYGJDNnGwKl2AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oEFoi0XF3NRMKs/0e55+d2lFKLXGaXv3MzDlki0jRHs=;
 b=ghlkt1jp0jbYexMnu9gliu9C4+oQUpQA/A4/soLvpUNGffJY2lDDlASFr3jAutw8m9QVvVMRPhyK4Cq2tMrY/s2dxcXic5o5elAM5vW7I4I4K+B1sdSaxg958DYx0pDgndaBzHroD/4nkMuNsaUtJQD7hVzGsF4csh3o82/VCvCMIIf8psvH5mZCJN6gzyZ/QWwSVKaqs3WqX7yLUSUi50Mz15UkgZ7Rno0EofiyCWcvdA1rZao957h3/MLIrgAVaFkYgs2tNn1gmfxHqAeKesTkYrmbFadjYHDMRF5GzGmm8unO/PEWLVzJICLehf/0dssG6YY3xWSruyJlKaoaZQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 PH7PR12MB6636.namprd12.prod.outlook.com (2603:10b6:510:212::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.15; Wed, 18 Feb
 2026 21:21:42 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9632.010; Wed, 18 Feb 2026
 21:21:41 +0000
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
Subject: [PATCH v7 23/23] nova-core: mm: Add BarUser to struct Gpu and create
 at boot
Date: Wed, 18 Feb 2026 16:20:20 -0500
Message-Id: <20260218212020.800836-24-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260218212020.800836-1-joelagnelf@nvidia.com>
References: <20260218212020.800836-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL0PR1501CA0034.namprd15.prod.outlook.com
 (2603:10b6:207:17::47) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|PH7PR12MB6636:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c319d2f-5666-4997-4e32-08de6f33b5a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?CDMJHqlqBAx5rnAfBaQmElB8YOVDKl21ndD8M2QxzbcZ0LWrbXQ9NG9tuWSf?=
 =?us-ascii?Q?Cx5ANKGpO8FU3PLLW4P38omQDBtjYpkTNmxEwKfuohF4Fz155ZvL5ItAuEO2?=
 =?us-ascii?Q?VZALkk2Ov4HOL1s/vrT4iQVO57+edDBpbCAer0MT+fg8zjetLmDgnqi3O6x6?=
 =?us-ascii?Q?GfUHI3E94oorsJNJXmW4VxYf9o4wVufd6TD1LZZufeMiFCLILPCrynvbg7IU?=
 =?us-ascii?Q?GgSbs8scMsNbP5qVyW2DUfFq0Z11iIRlXougYs+zU/vlxMDmOIV7VuhGNYjQ?=
 =?us-ascii?Q?7IKACANL2GYerXrfSy2hKn1/roYCIKS49zfi8kZl0yziejsuZjNPGmWPEOg2?=
 =?us-ascii?Q?4V5EfyE3zoN2B7YyOxbJKUPhX8S8JdN7cXXtnkJBioZiB0aOSRM9YRMYhbI3?=
 =?us-ascii?Q?IaAGivx505JUr82wbzO6XwdoeEvAn4EEKxNJaphkZHMdW0lFEImQq9Vv02n9?=
 =?us-ascii?Q?iCSmNJOPf7gUBHe7ZdpGCH+iPNvSel/gBZ9+heJd1yQt7fVCywdmnajZZQS6?=
 =?us-ascii?Q?qkkkAqYWme4EnFvrSkwkhxDhFAo61EeXhKp0QmGC0ZZSsMrCMR764vrzdy3n?=
 =?us-ascii?Q?qmIrga8zp6aOHiZBEXrokXXTvPe5CeNPgYivl4yzL0Uhg5mpuZMxeWC34HPk?=
 =?us-ascii?Q?IQ05GlmJ2KVzds8emxzuJQtjfony51XJaNvIs78Nf/Ze718oWTZUrHE99RZk?=
 =?us-ascii?Q?coh2xWaSuxTcxoXS237/OMlSWvJgZn0Q5TB3MzQ/oJd+nvFr/aAcHlQ5Rvp2?=
 =?us-ascii?Q?uHQ7MzdUEpG/mpf9UQA2JXQml2MzDNPQvDtHztUzSLLh+TmUeODFxtiLfNFl?=
 =?us-ascii?Q?XYSdc90kzvlI9523/iES56TPJScEb+LQdJ6iAjTHwmgGqnjhW4iGErvLy/+n?=
 =?us-ascii?Q?vJyUSIvJX8HB26rrJDK+Dnizjo7pmw5DIwzoTktUF206bOkJVNBD34mpl1+7?=
 =?us-ascii?Q?+77rXq0OxWXfSZbFO/gOYr5cI7x8k36E9hyu02gqzN1Fh2+0a7LsxUn+K2XH?=
 =?us-ascii?Q?HCzcOzZR+1VYNA3mIbRWe55hzfk1FmjfaYZx1EnaYPqzQbCpmBp2G2tY8M+7?=
 =?us-ascii?Q?Vobr0x6Al5eyWfV77i/Afz+ZksJfYABwb6rTWtk5gEFUOKd5nhycgBKjxPSR?=
 =?us-ascii?Q?eAc9HJAKmx6l4efl9jmuKHxMkOtcDgYzokvIopaNCqS4X4/mMc9821hSWG4x?=
 =?us-ascii?Q?IDcIXbddXSRbigaCV7vXqRS6MyMIKTGSLcyEccy6rhA5KMPP2JpztcvuI+Ip?=
 =?us-ascii?Q?6LwEuAC5zD8q5K+lNFHlOHXKRSg1KO2V9kzaj4NNlkeGES4ei7Q+M3EHFBUK?=
 =?us-ascii?Q?qlkVZbgR3uDcxalDSrUJuvYWbCWNCZOaW11/1v2kkXg75G43n1soEXraPNEF?=
 =?us-ascii?Q?Pgr0YVH839fb0qsggh8V9Ks+B8L2AMYeJdCtD7yRil6DF6+W/6MxAGcOCOhv?=
 =?us-ascii?Q?7SL8kWWWgWyZ+3PPPbfGzZ0k+SPSyBk93eUUqSoDJeou2+Ywrmdydaggm5BI?=
 =?us-ascii?Q?+W0wLaCbl9CFNlzoXzOFITfxHJUubP5rfeRWA3kBJ01s3aurSVuRNWZQbXLx?=
 =?us-ascii?Q?B/+gZ38pYkE55MgBMMw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MD7/HA18MlDKQ7OF31CvU1E17IcM2cU16ejQyBdX2iH81cVYj5plW+vljj+e?=
 =?us-ascii?Q?X8GSC0RMszgzOdVGhi+5dN4rHOcA9WTeLVZHN0yyBV352wEi5w5E0vK59Wl/?=
 =?us-ascii?Q?fmvgbpiwywdXl798A9M7kh7bZ6hIPBxhvf9DAzfu4VQS2Onp9YXK2ubvqq31?=
 =?us-ascii?Q?QX8Kq0HqwBmMFG3rhBCG+A9lBZFsC67krYTwsRlr6Bg3Jl3lY1IfUwDCvAJ+?=
 =?us-ascii?Q?i6Ua6ImX45wp2rp7jXWhUbbrwUBpDa7Dj1brh7X1+jO0kFizNSpNtteDf1ta?=
 =?us-ascii?Q?RBWMGH6ZswOXxCwlamzNNUPmdS0c3DBJkyBwzD3RZe+5yrr5mc5BkFjTWAcs?=
 =?us-ascii?Q?tZahJKbjsGpJnM80Dp79wZ9OCd2/0uh5p59shDk/HZ9scdIwJ495KBDoiWcC?=
 =?us-ascii?Q?KqjEDV07arhnUWcaCeCNaOFw9HucYnqIpYITg8IwIisNEyfSn3Ze5yzUwjDQ?=
 =?us-ascii?Q?JoFW40Jx6d6hXqrB0LwgA/6pSzCxTrn3xY6nevlKFj9A0+UDOs55dE73/Suz?=
 =?us-ascii?Q?rV5uIX5GdfUxoaHM73pVZ39SF15DZmhidEKW0rlSzioYs+BUm6B+3Xsv89tN?=
 =?us-ascii?Q?vMasHhRvtmHFLmIqLI7vy6JoGZ+VBfa3R9yN4Ae+N7+6F0Z6iNIyx96e/sMb?=
 =?us-ascii?Q?9wYfq6yvdJgzx9ZnddZvQcjJ/AixcObE3OBYi5sTbwlYxhm6tJkZF9dVKNNO?=
 =?us-ascii?Q?oHSsWdrUAO8m9BgjXYDF+7ZZKw73SPoshSXmNuiWCqnBw4z+UrtdLPQtBZqr?=
 =?us-ascii?Q?MLt7MVWvNUnhKqTsNQMLgXwyTqGrgx3ISg0AqrFKy2n5zGb4Cwpp5hewmj0U?=
 =?us-ascii?Q?u8opg1Laab0iw4dsSxvbdfAe7b53dh7/hsFKHgIF/yISmC5RFGKBiaHPYI1b?=
 =?us-ascii?Q?Yr04uxNaAhS+COuFBW2QKUsdx1MsEpf4elDo2dTjs6tNxMM38Qh8kiFSkmmN?=
 =?us-ascii?Q?MrvYct6acEO42rrLEzV9UOQdCxH1GvlxrSFJppDfCdRhqeq25I/qMN+mfmKD?=
 =?us-ascii?Q?Ky4ZhVjmL7+akYQtPwGYUjwIqxdLkPkVTB48xq5grXr2QVUDTn3qCPVoJYmx?=
 =?us-ascii?Q?X/QYt/TYiQgHsxuNGQQZfVu668ct92utENOK/EAwVjhC/lllywJfZ67o6cRw?=
 =?us-ascii?Q?9//kbXBYv4V9U0sLL6fp1y0Td08PK/MnLZOz+gk46yfTq7XITWOau9EWPNCS?=
 =?us-ascii?Q?945a5oXcZSOoYCBNItsvsR2orPXTJ+HLZuXe9NUHy9w4LTXtv+QxRbY2CkF/?=
 =?us-ascii?Q?Bxh5w2+bvx+XnR2Az5DYrez0VKNcA4TgKZS3QlxrctL6K7PlWlG7WPxSjtx+?=
 =?us-ascii?Q?Vig9UD4JiTSGp/qzAoq9GrzfkuvvOnjBRKCOdMBVa1dK/BMtS+AaKzP2HmEu?=
 =?us-ascii?Q?lldbC7QmYkTN42pCxL/Sqg3YSjrxGJtXQPu8v4nioK01ZJ3rIRlCxc3NTI3U?=
 =?us-ascii?Q?V5+Oeeb5htjxeenKdq3VJRASnjczNqEwEtbvBC08nCCHstLm39yWR5Qw5JnD?=
 =?us-ascii?Q?MxZbV5LxUGce5b4zNroRKhvkLShdn7uUSo6uroKqVjMSLUhGSdz5Mo5/LXQz?=
 =?us-ascii?Q?9zQozmprF9NCoxWZKPwookuXQkZu5Wd2EAFuSPhLdqxqFdg2+z49WL5HlJH3?=
 =?us-ascii?Q?J634/OvfCUDQM8rGrP+yTQKn2Vfs64kwBhr9cBhVLpT0Irqrl5gU8ALsT2qk?=
 =?us-ascii?Q?eojgIbzl057vn8APPuxMpIgO5nuBBI2bRqGWaplVGS1wDO5uohXIUl44fDV5?=
 =?us-ascii?Q?TYDseo/Ffg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c319d2f-5666-4997-4e32-08de6f33b5a3
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 21:21:41.6863 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GBnH3t+aq3yiWwcPoUzeSVaPIk3L7yExpChp6cJ6jXpaGPmYtzTcl+5E8BYczob0yDCN5yZZGvWoWMhpODYSnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6636
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
X-Rspamd-Queue-Id: 534DC159F5F
X-Rspamd-Action: no action

Add a BarUser field to struct Gpu and eagerly create it during GPU
initialization. The BarUser provides the BAR1 user interface for CPU
access to GPU virtual memory through the GPU's MMU.

The BarUser is initialized using BAR1 PDE base address from GSP static
info, MMU version and BAR1 size obtained from platform device.

Cc: Nikola Djukic <ndjukic@nvidia.com>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/gpu.rs | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 670a2a89c6ec..159ccea8464a 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -26,7 +26,12 @@
         commands::GetGspStaticInfoReply,
         Gsp, //
     },
-    mm::GpuMm,
+    mm::{
+        bar_user::BarUser,
+        pagetable::MmuVersion,
+        GpuMm,
+        VramAddress, //
+    },
     regs,
 };
 
@@ -35,6 +40,7 @@
 struct BootParams {
     usable_vram_start: u64,
     usable_vram_size: u64,
+    bar1_pde_base: u64,
 }
 
 macro_rules! define_chipset {
@@ -272,6 +278,8 @@ pub(crate) struct Gpu {
     gsp: Gsp,
     /// Static GPU information from GSP.
     gsp_static_info: GetGspStaticInfoReply,
+    /// BAR1 user interface for CPU access to GPU virtual memory.
+    bar_user: BarUser,
 }
 
 impl Gpu {
@@ -285,6 +293,7 @@ pub(crate) fn new<'a>(
         let boot_params: Cell<BootParams> = Cell::new(BootParams {
             usable_vram_start: 0,
             usable_vram_size: 0,
+            bar1_pde_base: 0,
         });
 
         try_pin_init!(Self {
@@ -329,6 +338,7 @@ pub(crate) fn new<'a>(
                 boot_params.set(BootParams {
                     usable_vram_start: usable_vram.start,
                     usable_vram_size: usable_vram.end - usable_vram.start,
+                    bar1_pde_base: info.bar1_pde_base(),
                 });
 
                 info
@@ -345,6 +355,16 @@ pub(crate) fn new<'a>(
                 })?
             },
 
+            // Create BAR1 user interface for CPU access to GPU virtual memory.
+            // Uses the BAR1 PDE base from GSP and full BAR1 size for VA space.
+            bar_user: {
+                let params = boot_params.get();
+                let pdb_addr = VramAddress::new(params.bar1_pde_base);
+                let mmu_version = MmuVersion::from(spec.chipset.arch());
+                let bar1_size = pdev.resource_len(1)?;
+                BarUser::new(pdb_addr, mmu_version, bar1_size)?
+            },
+
             bar: devres_bar,
         })
     }
-- 
2.34.1

