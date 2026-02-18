Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SB+bIFgtlmm5bwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 22:21:28 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 331AA159E05
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 22:21:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C0E510E64C;
	Wed, 18 Feb 2026 21:21:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="eTHDNTAw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011032.outbound.protection.outlook.com
 [40.93.194.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E399310E627;
 Wed, 18 Feb 2026 21:21:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yIkksasybdR+XM7Zzwr7shZfXPyyT7fq/s98BvC7IKn1kIdIZvdCq+3hSx5z5q5dFUclG7aMLJNjmj0jATKGv49bGIuCU+qOlhkmQWL+DSbdbNvS+hDQLbpyahqFnYzwN+ewUMYOa1m5Lp+tTEeBt8xMDlYtKWQ5H+i/YUkOeL7MsUePlA1rKcyn+WIGATfzwAFlzUZb97FZpI7O+IiSHkhFIlnvLPoIRcgMuBBXk3PJLCxIzJ6akSlIdLxqMDPZSkK7avMH0elWE8wgSg0l6ofqtagEys1qAwUnyFMRW45dU62U0fjUUy3IRtSJ9r4mYvK8jArGMWGJuuz91vusng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5P+LAknwW7UnyrFGO+Z/E38e0HhPyqCHB2kNaBTTJBY=;
 b=tGr5Bz5RK6cXHOGdXcBTQGjveaFzpz5aXAzgPVbu9Iw+S3SQ/mB5AlhuX2umNYdQraUwu4t4PV8tvjHSuneSSP1pSIcb42ljNFWnxmRfUKCW5kD0nsF4dchgzsQYAVfpJ++IPa0F2F3tL0EaAK/VXDbuHQtiU0ax/yPy5oyVa3Q550NzRr3Y+F626C496i/cIhVjeefmBVwzBE8YLlo/VSo4LJNpgD2EXO5kiWOKLmDURCRGUMivkhm0Oz/2TUBFyA3q4aIDoj5U4YgeyO50fhASfJyY7qI+LCGy/l/QMhj4v1FMAFyti8oGbagtyL0aI2nAl/9P4Jr2VI+MqGsorg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5P+LAknwW7UnyrFGO+Z/E38e0HhPyqCHB2kNaBTTJBY=;
 b=eTHDNTAwlAp1hE4840VIXfS2qq7e/yamSDf2LA4Z5DJyKSNu6PeJh+8HFxkFoYSRx0QHcSXZn1xMv0E5Y5BoPfXQ2kMcXoDuA6RcN3Ur4HWbObyu994wJp0Dj9hVyMfPUfu8fHJ2Wkw+P7zBHtEKHFwxppUlMqw4vVJw4wJX6VNZ0x4HmnSZt9mGclRuDIss+dshUIRrFPI7Ix2elbrgMwrQpAyx6nrEJBKMWfGnC2E9qFrF97bPac6rZU2pMR28GoiM6Lgporc2zWwL3JGOjXdUXhpZRdjHDg5VykqrIQcUxRDCnUvk6t2MdOIre+O5uawN2B+7U1Oq6vGE5A9Wig==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 PH0PR12MB999111.namprd12.prod.outlook.com (2603:10b6:510:38d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Wed, 18 Feb
 2026 21:21:18 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9632.010; Wed, 18 Feb 2026
 21:21:17 +0000
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
Subject: [PATCH v7 08/23] nova-core: mm: Add MMU v3 page table types
Date: Wed, 18 Feb 2026 16:20:05 -0500
Message-Id: <20260218212020.800836-9-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260218212020.800836-1-joelagnelf@nvidia.com>
References: <20260218212020.800836-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0397.namprd13.prod.outlook.com
 (2603:10b6:208:2c2::12) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|PH0PR12MB999111:EE_
X-MS-Office365-Filtering-Correlation-Id: 20f4de8e-6aaa-485a-4d07-08de6f33a6f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?RexrAQ8xtdBbzd6/XqDJG13u62RIPMskbEOYH0VWKhgDIN5POww6G4BAo3Xy?=
 =?us-ascii?Q?5xvf1+y2ejnY2CO5X6U7P6cl5XeHYQVxr/R6Clg79k5Lqay+uvl7BtJoZF6Q?=
 =?us-ascii?Q?kSlxfCs0Egt54uhqPaI4OcOkD+j3vWulyJEESigj4N2ZeeEpHI63eyX72/1I?=
 =?us-ascii?Q?KEJpo/PYE57TYAqCv1N5ztQ4uYYofzzoxJKoP5GGVRlLkBrnYaQ4maeCABR9?=
 =?us-ascii?Q?uGaUc5kxosenuxS6Ev7pYAG6YDA0rrM+e7T7aXZC4tIjOdWiNVLrCExj/u0s?=
 =?us-ascii?Q?eKtn1+H3A9QQzP14beb2AB2t7BdZhoQ1N6SoYgbe7OiIovQxt5XOQZacjDov?=
 =?us-ascii?Q?e2l0kw4hUnooEhp/rs5X25Be5BZWZzHQ1u6Khzl2c+PV1B1DUk8bcO/fZ8DX?=
 =?us-ascii?Q?jNLA25CPUcyXKUw4/35dmhtOpJ8xQczX2KpEngqGIeosKEqLRqJ6AMel2VYp?=
 =?us-ascii?Q?lPINTR0u0nvPoFFQ67t+Q1vg4l9f8wSMB+j9iSBFpZbxf7bjj/mNxF1CaTjm?=
 =?us-ascii?Q?k+vJmnlY4rSMFTRG5b6sVwml+UIJIWOyunyh2prCeRlPX4WKCj76yE81G3ED?=
 =?us-ascii?Q?qIMgXs+bl/iukkYYlHofhJKd4FFL6IfD9VuizvwIaOUJt5P2I79+1l7ZlqR3?=
 =?us-ascii?Q?RMsnMFcn6ZYCOrGAFp7geLE3NlCVWsRnm24cn6a8oPXCwBqFZPICg4ku+qpS?=
 =?us-ascii?Q?QItAT01np1OxSHnxIo426wVXYvEfOQ2skWLqB0sA8cq5Z5+sxDZuiubJEcv/?=
 =?us-ascii?Q?QheR1R8B1X0kEskSiUR9RvAmQF+KAmhUkr2D9nJzcupoRxT9s12Us5gFORKc?=
 =?us-ascii?Q?qlqJnBG4ReyzklPOaVak9+lr1970HiBF43YfrDI/VfO6RRQWGp/Mt9jNhyw2?=
 =?us-ascii?Q?02JStX5tGNMUxpk6MLgXi2wYY400f0if9nY4bAppZAXCfJTbLIfkXvLjCaSL?=
 =?us-ascii?Q?UNF0gpFJFQHh+YMhSobemoO75q4x6t6V/47D235K+vNShtOryBusLTp91uJT?=
 =?us-ascii?Q?gR+56wQN4MpPUJzU/t52tMEHWEeVxnU2y/4X0xm/dzkAJN8H0tkRmR5yFlC2?=
 =?us-ascii?Q?7P3uneYLKFlCkZEZC61gkffd/9lFNMf1AHGW4+lO2DbYjnDY5dwTpqyq4G2p?=
 =?us-ascii?Q?271W5Px9K7Eng1e5PH/2wHS1QuCoR7mJ0SKBym7G+w9npHnRcCTWuwey1eaA?=
 =?us-ascii?Q?pZHi/qOjvK1PzMTxXXQDIOzCFhylK+zXljNsEwDCAbw7Blh3lAgOfovSciuU?=
 =?us-ascii?Q?jNzys81zavZQD1hR1bZ1bP/iWVnjo6kSbnpzWEFWQTfjGmPpHmeZYaFjCHSh?=
 =?us-ascii?Q?f7KZwZlQtcArxiMQJbhSbATdoNEUYAtMA/pW1GR1HbLQWJIdQkMl7xZUGsHu?=
 =?us-ascii?Q?1eShePmp8uPSrbnPKS2UhMyBAoKdSCKEC/BJD7MA6CjAfZvTw4UnxkejZYod?=
 =?us-ascii?Q?xh7JVyIbfNUIYAW77DhdX0JD4RSS6OdWIuOfpvgHQ2ii/wFnuQVYeEOF8scq?=
 =?us-ascii?Q?CErp5DF4zN7x7naC/S1YwTEmPNrBjTcJVoRDFFF204eU9ITuDejfaGvXFOp1?=
 =?us-ascii?Q?YVw5ZEu+qnC9nqOZ1Oo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KuUzI+FwHl8TRwApgq5azpuz17Ie+jst9hm99kF4bwqcQnUiwYEpBTZDYpkV?=
 =?us-ascii?Q?jrXWhEGqDnJODVV555jExKf5UetJIUlJKWcWQnCXjj6epqIN3z/RH3TEAu5o?=
 =?us-ascii?Q?slENkiabcHtJayVf59Uv7UZjvJykYzcOHQt5cWuZrUzH4je7aXoQyXt8vwBE?=
 =?us-ascii?Q?zf+mi4AYbVg4elkVM2KALu3WZ9OwNgn6mpL8L+WvK22XxInaGypO7U5eEyCl?=
 =?us-ascii?Q?ZswItsC38xNhgbpABECb4aB3WRImcMEcIHg4ns79+DiAut4FeXTIVPgBKrDv?=
 =?us-ascii?Q?pE9Dgkghf7GZWimtr/WGZ10F0m0dBjmyL+iitpO7iXJdACs165nWkhli6fRd?=
 =?us-ascii?Q?TeOylDzV7zK34fYxNQctLBwKEzqXurNeg2XeZIS1zyQAH/2lXjgnw3KF4+7k?=
 =?us-ascii?Q?7CRtuMCY5FOrFpiS7ElAAQ6t2OQ/fDIg0ZVUgFVDUVoH26MThJror+tJ0fa7?=
 =?us-ascii?Q?0hA+y85WMlLb+CHMcotjUQbLV39J8HK3n6jJnEGc/6ssFT91hjzR0XOrMT7p?=
 =?us-ascii?Q?6Vu7nz6VdIgNe+x/v1wzQzwx9PFFkUIQ/Ra2TdNP+qZRhrvv7mOVFspn+5qq?=
 =?us-ascii?Q?U2FnJ85YQuNjacZm17uRhzxGAP2741GMHwTUk4huKFH4vzDA0ivhtMZaasJI?=
 =?us-ascii?Q?/ItiHKnKcyOs1bJPSL2ud/jv8kk8CbnMwtoIx64pdjNsGFXv7uq20sOkJVt/?=
 =?us-ascii?Q?NYwrFdgRrXC9l0IawHVvdDyddlCBSpIFEAJYNDjRH5IhXracN4PgnSSo53Mu?=
 =?us-ascii?Q?8ILTnyvjOdHCG0RuvshQ8HjJDmBAzJCd4lC/85MNFJ/JLiPgqyUNmoLpEeCJ?=
 =?us-ascii?Q?Tg0wGH/hoWCDgmwvf6PrbPzU72DVfY5zNlBGxDqmzViHS8FEEGImQdLLyfYN?=
 =?us-ascii?Q?aOzsyUox/lyLAacT01SSRJbq/LniTF5EaNb/LK90HUsJW9IkfW3mYdIsSyYz?=
 =?us-ascii?Q?KUrYZUjzqve0rbXLrgGUMgKa5GW3IjNhui8ymH1VPaiiITnJZFshQLCV734t?=
 =?us-ascii?Q?wqA8RTIhQFQj3458Srk/VKdzgoNDCBm2OY7pE4lAX11P89muFUMno6i/Fp+T?=
 =?us-ascii?Q?+v/gxp6uG1u+HTpDLZQJqDdD/CGaVp+xuuFKwKHhMj2yIGX4w/jv1zXiRJgY?=
 =?us-ascii?Q?+ux6kL0iRcr/MWIVnui//KxQjj4HtIt9GUUB/MuFS9DGBITDB18TT7IdjacQ?=
 =?us-ascii?Q?oZJY81aihy0MHAjNDOI69dSyCg1rT6hDHPOd7f2dV3GI6Lcn9J9yIin8HgTg?=
 =?us-ascii?Q?uj7HdgjAf9vGJ5fjB+m+zg5DRKer9NwX8q/acfM7CCtQbQ/+nUg3tElVFySB?=
 =?us-ascii?Q?/zRR0IhKrBUa6qvkqa4jDEosAvJSMMp895Um5BiiAQGypxLOEjc7xPk7fK+d?=
 =?us-ascii?Q?fbG+C5SZR7XcZQM9y6nIRmUOLLJ4RrruLBsQoATB/eXPgw6EYYyRYCIJ0lzX?=
 =?us-ascii?Q?apfd0t91sCxnxmbUWXivmBY8q97U6QkAg56CdkdEffZ1TX5bJXosvm+fFJEV?=
 =?us-ascii?Q?nkeaNW/DNtUDqikKcHQyi68OiXF7nJOa7qnTrkpPf+SkEcAdiJMPTEmARTj+?=
 =?us-ascii?Q?JdwZTJ+g8KUeGVtsR59MsgxIR5/wBP/Xqr0tB0GEek20Z4AfKe0QXlW49Ep/?=
 =?us-ascii?Q?DVw2gKsTIzhW2qNDHdi6ceBHwu5I6HFO9NDAFS2hPHcVXFoyjaGvjHpskXGX?=
 =?us-ascii?Q?38uH6hHR+GZL4djyIOYxAWXdc4aJoawi0Bu90vrL1Ywrpiz47j7ncWF5KEPw?=
 =?us-ascii?Q?fBqmWjzOMA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20f4de8e-6aaa-485a-4d07-08de6f33a6f3
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 21:21:17.0669 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ppVdQ3oOdFtZ80kLRqWKP+wgUbH2Di2yF+Ih7fjEA/t0V5qlBzlygUpqv9c5ntoPxZWWbDUjFiBVhilr+I0ebg==
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
X-Rspamd-Queue-Id: 331AA159E05
X-Rspamd-Action: no action

Add page table entry and directory structures for MMU version 3
used by Hopper and later GPUs.

Cc: Nikola Djukic <ndjukic@nvidia.com>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/mm/pagetable/mod.rs  |   1 +
 drivers/gpu/nova-core/mm/pagetable/ver3.rs | 302 +++++++++++++++++++++
 2 files changed, 303 insertions(+)
 create mode 100644 drivers/gpu/nova-core/mm/pagetable/ver3.rs

diff --git a/drivers/gpu/nova-core/mm/pagetable/mod.rs b/drivers/gpu/nova-core/mm/pagetable/mod.rs
index 925063fde45d..5263a8f56529 100644
--- a/drivers/gpu/nova-core/mm/pagetable/mod.rs
+++ b/drivers/gpu/nova-core/mm/pagetable/mod.rs
@@ -8,6 +8,7 @@
 
 #![expect(dead_code)]
 pub(crate) mod ver2;
+pub(crate) mod ver3;
 
 use crate::gpu::Architecture;
 
diff --git a/drivers/gpu/nova-core/mm/pagetable/ver3.rs b/drivers/gpu/nova-core/mm/pagetable/ver3.rs
new file mode 100644
index 000000000000..e6cab2fe7d33
--- /dev/null
+++ b/drivers/gpu/nova-core/mm/pagetable/ver3.rs
@@ -0,0 +1,302 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! MMU v3 page table types for Hopper and later GPUs.
+//!
+//! This module defines MMU version 3 specific types (Hopper and later GPUs).
+//!
+//! Key differences from MMU v2:
+//! - Unified 40-bit address field for all apertures (v2 had separate sys/vid fields).
+//! - PCF (Page Classification Field) replaces separate privilege/RO/atomic/cache bits.
+//! - KIND field is 4 bits (not 8).
+//! - IS_PTE bit in PDE to support large pages directly.
+//! - No COMPTAGLINE field (compression handled differently in v3).
+//! - No separate ENCRYPTED bit.
+//!
+//! Bit field layouts derived from the NVIDIA OpenRM documentation:
+//! `open-gpu-kernel-modules/src/common/inc/swref/published/hopper/gh100/dev_mmu.h`
+
+#![expect(dead_code)]
+
+use super::{
+    AperturePde,
+    AperturePte,
+    PageTableLevel, //
+};
+use crate::mm::{
+    Pfn,
+    VramAddress, //
+};
+use kernel::prelude::*;
+
+/// PDE levels for MMU v3 (6-level hierarchy).
+pub(crate) const PDE_LEVELS: &[PageTableLevel] = &[
+    PageTableLevel::Pdb,
+    PageTableLevel::L1,
+    PageTableLevel::L2,
+    PageTableLevel::L3,
+    PageTableLevel::L4,
+];
+
+/// PTE level for MMU v3.
+pub(crate) const PTE_LEVEL: PageTableLevel = PageTableLevel::L5;
+
+/// Dual PDE level for MMU v3 (128-bit entries).
+pub(crate) const DUAL_PDE_LEVEL: PageTableLevel = PageTableLevel::L4;
+
+// Page Classification Field (PCF) - 5 bits for PTEs in MMU v3.
+bitfield! {
+    pub(crate) struct PtePcf(u8), "Page Classification Field for PTEs" {
+        0:0     uncached    as bool, "Bypass L2 cache (0=cached, 1=bypass)";
+        1:1     acd         as bool, "Access counting disabled (0=enabled, 1=disabled)";
+        2:2     read_only   as bool, "Read-only access (0=read-write, 1=read-only)";
+        3:3     no_atomic   as bool, "Atomics disabled (0=enabled, 1=disabled)";
+        4:4     privileged  as bool, "Privileged access only (0=regular, 1=privileged)";
+    }
+}
+
+impl PtePcf {
+    /// Create PCF for read-write mapping (cached, no atomics, regular mode).
+    pub(crate) fn rw() -> Self {
+        Self::default().set_no_atomic(true)
+    }
+
+    /// Create PCF for read-only mapping (cached, no atomics, regular mode).
+    pub(crate) fn ro() -> Self {
+        Self::default().set_read_only(true).set_no_atomic(true)
+    }
+
+    /// Get the raw `u8` value.
+    pub(crate) fn raw_u8(&self) -> u8 {
+        self.0
+    }
+}
+
+impl From<u8> for PtePcf {
+    fn from(val: u8) -> Self {
+        Self(val)
+    }
+}
+
+// Page Classification Field (PCF) - 3 bits for PDEs in MMU v3.
+// Controls Address Translation Services (ATS) and caching.
+bitfield! {
+    pub(crate) struct PdePcf(u8), "Page Classification Field for PDEs" {
+        0:0     uncached    as bool, "Bypass L2 cache (0=cached, 1=bypass)";
+        1:1     no_ats      as bool, "Address Translation Services disabled (0=enabled, 1=disabled)";
+    }
+}
+
+impl PdePcf {
+    /// Create PCF for cached mapping with ATS enabled (default).
+    pub(crate) fn cached() -> Self {
+        Self::default()
+    }
+
+    /// Get the raw `u8` value.
+    pub(crate) fn raw_u8(&self) -> u8 {
+        self.0
+    }
+}
+
+impl From<u8> for PdePcf {
+    fn from(val: u8) -> Self {
+        Self(val)
+    }
+}
+
+// Page Table Entry (PTE) for MMU v3.
+bitfield! {
+    pub(crate) struct Pte(u64), "Page Table Entry for MMU v3" {
+        0:0     valid           as bool, "Entry is valid";
+        2:1     aperture        as u8 => AperturePte, "Memory aperture type";
+        7:3     pcf             as u8 => PtePcf, "Page Classification Field";
+        11:8    kind            as u8, "Surface kind (4 bits, 0x0=pitch, 0xF=invalid)";
+        51:12   frame_number    as u64 => Pfn, "Physical frame number (for all apertures)";
+        63:61   peer_id         as u8, "Peer GPU ID for peer memory (0-7)";
+    }
+}
+
+impl Pte {
+    /// Create a PTE from a `u64` value.
+    pub(crate) fn new(val: u64) -> Self {
+        Self(val)
+    }
+
+    /// Create a valid PTE for video memory.
+    pub(crate) fn new_vram(frame: Pfn, writable: bool) -> Self {
+        let pcf = if writable { PtePcf::rw() } else { PtePcf::ro() };
+        Self::default()
+            .set_valid(true)
+            .set_aperture(AperturePte::VideoMemory)
+            .set_pcf(pcf)
+            .set_frame_number(frame)
+    }
+
+    /// Create an invalid PTE.
+    pub(crate) fn invalid() -> Self {
+        Self::default()
+    }
+
+    /// Get the raw `u64` value.
+    pub(crate) fn raw_u64(&self) -> u64 {
+        self.0
+    }
+}
+
+// Page Directory Entry (PDE) for MMU v3.
+//
+// Note: v3 uses a unified 40-bit address field (v2 had separate sys/vid address fields).
+bitfield! {
+    pub(crate) struct Pde(u64), "Page Directory Entry for MMU v3 (Hopper+)" {
+        0:0     is_pte      as bool, "Entry is a PTE (0=PDE, 1=large page PTE)";
+        2:1     aperture    as u8 => AperturePde, "Memory aperture (0=invalid, 1=vidmem, 2=coherent, 3=non-coherent)";
+        5:3     pcf         as u8 => PdePcf, "Page Classification Field (3 bits for PDE)";
+        51:12   table_frame as u64 => Pfn, "Table frame number (40-bit unified address)";
+    }
+}
+
+impl Pde {
+    /// Create a PDE from a `u64` value.
+    pub(crate) fn new(val: u64) -> Self {
+        Self(val)
+    }
+
+    /// Create a valid PDE pointing to a page table in video memory.
+    pub(crate) fn new_vram(table_pfn: Pfn) -> Self {
+        Self::default()
+            .set_is_pte(false)
+            .set_aperture(AperturePde::VideoMemory)
+            .set_table_frame(table_pfn)
+    }
+
+    /// Create an invalid PDE.
+    pub(crate) fn invalid() -> Self {
+        Self::default().set_aperture(AperturePde::Invalid)
+    }
+
+    /// Check if this PDE is valid.
+    pub(crate) fn is_valid(&self) -> bool {
+        self.aperture() != AperturePde::Invalid
+    }
+
+    /// Get the VRAM address of the page table.
+    pub(crate) fn table_vram_address(&self) -> VramAddress {
+        debug_assert!(
+            self.aperture() == AperturePde::VideoMemory,
+            "table_vram_address called on non-VRAM PDE (aperture: {:?})",
+            self.aperture()
+        );
+        VramAddress::from(self.table_frame())
+    }
+
+    /// Get the raw `u64` value.
+    pub(crate) fn raw_u64(&self) -> u64 {
+        self.0
+    }
+}
+
+// Big Page Table pointer for Dual PDE - 64-bit lower word of the 128-bit Dual PDE.
+bitfield! {
+    pub(crate) struct DualPdeBig(u64), "Big Page Table pointer in Dual PDE (MMU v3)" {
+        0:0     is_pte      as bool, "Entry is a PTE (for large pages)";
+        2:1     aperture    as u8 => AperturePde, "Memory aperture type";
+        5:3     pcf         as u8 => PdePcf, "Page Classification Field";
+        51:8    table_frame as u64, "Table frame (table address 256-byte aligned)";
+    }
+}
+
+impl DualPdeBig {
+    /// Create a big page table pointer from a `u64` value.
+    pub(crate) fn new(val: u64) -> Self {
+        Self(val)
+    }
+
+    /// Create an invalid big page table pointer.
+    pub(crate) fn invalid() -> Self {
+        Self::default().set_aperture(AperturePde::Invalid)
+    }
+
+    /// Create a valid big PDE pointing to a page table in video memory.
+    pub(crate) fn new_vram(table_addr: VramAddress) -> Result<Self> {
+        // Big page table addresses must be 256-byte aligned (shift 8).
+        if table_addr.raw_u64() & 0xFF != 0 {
+            return Err(EINVAL);
+        }
+
+        let table_frame = table_addr.raw_u64() >> 8;
+        Ok(Self::default()
+            .set_is_pte(false)
+            .set_aperture(AperturePde::VideoMemory)
+            .set_table_frame(table_frame))
+    }
+
+    /// Check if this big PDE is valid.
+    pub(crate) fn is_valid(&self) -> bool {
+        self.aperture() != AperturePde::Invalid
+    }
+
+    /// Get the VRAM address of the big page table.
+    pub(crate) fn table_vram_address(&self) -> VramAddress {
+        debug_assert!(
+            self.aperture() == AperturePde::VideoMemory,
+            "table_vram_address called on non-VRAM DualPdeBig (aperture: {:?})",
+            self.aperture()
+        );
+        VramAddress::new(self.table_frame() << 8)
+    }
+
+    /// Get the raw `u64` value.
+    pub(crate) fn raw_u64(&self) -> u64 {
+        self.0
+    }
+}
+
+/// Dual PDE at Level 4 for MMU v3 - 128-bit entry.
+///
+/// Contains both big (64KB) and small (4KB) page table pointers:
+/// - Lower 64 bits: Big Page Table pointer.
+/// - Upper 64 bits: Small Page Table pointer.
+///
+/// ## Note
+///
+/// The big and small page table pointers have different address layouts:
+/// - Big address = field value << 8 (256-byte alignment).
+/// - Small address = field value << 12 (4KB alignment).
+///
+/// This is why `DualPdeBig` is a separate type from `Pde`.
+#[repr(C)]
+#[derive(Debug, Clone, Copy, Default)]
+pub(crate) struct DualPde {
+    /// Big Page Table pointer.
+    pub big: DualPdeBig,
+    /// Small Page Table pointer.
+    pub small: Pde,
+}
+
+impl DualPde {
+    /// Create a dual PDE from raw 128-bit value (two `u64`s).
+    pub(crate) fn new(big: u64, small: u64) -> Self {
+        Self {
+            big: DualPdeBig::new(big),
+            small: Pde::new(small),
+        }
+    }
+
+    /// Create a dual PDE with only the small page table pointer set.
+    pub(crate) fn new_small(table_pfn: Pfn) -> Self {
+        Self {
+            big: DualPdeBig::invalid(),
+            small: Pde::new_vram(table_pfn),
+        }
+    }
+
+    /// Check if the small page table pointer is valid.
+    pub(crate) fn has_small(&self) -> bool {
+        self.small.is_valid()
+    }
+
+    /// Check if the big page table pointer is valid.
+    pub(crate) fn has_big(&self) -> bool {
+        self.big.is_valid()
+    }
+}
-- 
2.34.1

