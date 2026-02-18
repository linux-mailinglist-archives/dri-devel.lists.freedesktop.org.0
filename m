Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SD+XBFotlmmlbwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 22:21:30 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5103159E1B
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 22:21:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3CB710E638;
	Wed, 18 Feb 2026 21:21:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="p4oHLtG6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011032.outbound.protection.outlook.com
 [40.93.194.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C71E10E659;
 Wed, 18 Feb 2026 21:21:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gdoUC4WYBq00NFJk+lsSqgDgwTfzd9ZV+9ACTVWyVQcYM1d1uXjeMnhQEGBJDudR2lrOUwoPqPU5duKsMXks+zH+tMuZYb5JE76uNlxT+BKk5nLioFzrNhy4YL1NNPjBhfoFP9Ql0M4ulTK1Zobq/P5MmCzYYd60jo0Tyru/sJOPDIkgDmYKSn7P5VL7Ipx0LpAByVlpH4cB7BWYXfCdGFsROvKONeKfngpOzQ+PTfD7cacd9IywGdTJ0Q2os/AhrSbnx1+lDgdQRKnQxinTElqwzcfhjpmXHQmwko3Xg4uaLu3EgNt9zENQ5AhT3kgyyrK4XjDDJQpDYfmT6QGwBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WVC+3ygdCAkcbtgPbkYFPzRKVDybmbhfDH26d0Te9hA=;
 b=ZiuWKgw3eupcVdmT+WjZnddxB/YguBjv8K0ciz8JUVHZOYNknovi0nLJZoG508d7logIRq4UelZnlAnprG8TXBzXF2lE+wpSfh2a9IsOeGjp98zEldU9zzUUM2pQ7lsHpaHv0NZrBFYn4Iblt5YrZ7OWqb4gvKzv01ep6e2pokLAawabplhFJHhCht8PGcxNIjZaoN0kGMaXDfh9uL7rENKE+PrVNe7HPeC44yBzZKaCb3s24jvrCvCV8vUSeuozpjGr0CfVlvv0Okj8yJzsF3+WzQ/Y9fbMZnibX1zGKbJpW4jxUt01w8gx7V+CnMHdS5XcwDslaLyIZvnUO0H7pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WVC+3ygdCAkcbtgPbkYFPzRKVDybmbhfDH26d0Te9hA=;
 b=p4oHLtG6po/1BA4LULc+NClQA7+1Mu/lYV+foIsgY2B91TaJEHKggMlSYlnOxBbRTPe9RLLniCnEem/ny7nPYqSI0YOFYFFykK/3KPkFTQLKs46wp5J3Hach/sHVahzT2eqd7IUmPKFbmZNjGL6s+0+gqwTNEPHJ3ELxOdXu9gcgkyVlx7CjGTBpSbBdfQ5GU/pxo1aM5bs+YBWoaUTxkLQv7AYjbY1mEwbxAe39AnRfn9tbOXd+4xEp0cPlUGn3lp9wrWQrbJhANHqkVszsAueG6ZgYMx2ZL9Wb0jXcxMICWUYUqvs2AO/gs3YeXL24X+kq5c99R0wXsJ7Bgt+4Jg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 PH0PR12MB999111.namprd12.prod.outlook.com (2603:10b6:510:38d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Wed, 18 Feb
 2026 21:21:19 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9632.010; Wed, 18 Feb 2026
 21:21:19 +0000
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
Subject: [PATCH v7 09/23] nova-core: mm: Add unified page table entry wrapper
 enums
Date: Wed, 18 Feb 2026 16:20:06 -0500
Message-Id: <20260218212020.800836-10-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260218212020.800836-1-joelagnelf@nvidia.com>
References: <20260218212020.800836-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0409.namprd13.prod.outlook.com
 (2603:10b6:208:2c2::24) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|PH0PR12MB999111:EE_
X-MS-Office365-Filtering-Correlation-Id: 1101504a-57dd-4d19-735d-08de6f33a839
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fMcigjS1ZeXyYEWDdsagH9HIsIIiCHnbmoqEJNWbTCNjz8cmO3LB1FoTCzjx?=
 =?us-ascii?Q?cItKrtksRa/2BJwQSE78loW+lIojKAmhxPeGQgFJB2yoHcWfZOMLir6GJvjr?=
 =?us-ascii?Q?UmQWXQSWfgl3y+T+gkjV7JqNjpH47lF70SpFXW1/Sx+tz/XNx055dBkVMtOs?=
 =?us-ascii?Q?bvuIIKbzCZQjA2EXWr0N7Rer0EcubrrOBE+Wl8WCcPS0iIXBPpqFQVVx8yk4?=
 =?us-ascii?Q?7RwjPSdv22iBI1kEpprQ0ZNdx3QUplBXZjnFCfmT5rKIKcnsWoW3SOLq1TyQ?=
 =?us-ascii?Q?ddQWndmC1n7SaEKyynpbtsV8Ul8uuCd2KK9x05bGmgRqQzDew+GR2AMyo+yV?=
 =?us-ascii?Q?JxG4x1Ml865v7zsstniETATCAKJtAxDo3W5F1C5hmonnaPKdzW2uvkvG+h1O?=
 =?us-ascii?Q?VFsdlRl060+NP7wBjJW6q29ye469PhXvrQT5wms/cFWds35h/8ld2Rdiib2a?=
 =?us-ascii?Q?tPQxjNEOSFdHGBMm/uww9c+qF+f4qu+KwRBjsBplE8WNionIVMBbayeSsNKR?=
 =?us-ascii?Q?38n5mVevuFHdBXRuls3eyJ8hsAx6yjh4k02vfETb5RP6jzwEy8FwMYWj1+Am?=
 =?us-ascii?Q?Jzl71yIApBq35JXNcLDr+a6SpnV/NQDPuR47kITqEaKZn/2lxp4s18jS5LHQ?=
 =?us-ascii?Q?AApLT6fYvezxwj3uU46uK36J2HxLQGrl+z02p12H8wS7yNz2i9lYcp9oQhYJ?=
 =?us-ascii?Q?i0QWYpM+9LaPwD2AKUKxXCH8V8je5/+WFD5doCLfuseaxQQi9B8mcbLxKEWV?=
 =?us-ascii?Q?vejc4cSZEDeZ87OirCPXvz+IRWRL/gxEYCBBybNz3okT9tDMJgLiSuyNXdoD?=
 =?us-ascii?Q?FYJjkGqBDr408cK1Bk+zjwpX+FdgmOtqT18bmMvHO6KgvMnC4wqdg2vgaK8J?=
 =?us-ascii?Q?HhvgcAi6NlrB6va+GnThiPM3KjokfM7CDE33XaNpN0ceNkuuAYk1VE4fhMw5?=
 =?us-ascii?Q?3gS8zd2o66cg0gqsWOWRFucsj97Jj8FpV6TzJzD9mjEjwH/q6ZgcfW+a0eUQ?=
 =?us-ascii?Q?E+qfB7MWqalP5wMWSnI4GoFSSg1KxfjdHjr5wEgACKAIjk9r//7DH1TOpSWd?=
 =?us-ascii?Q?UMJIxbZb91YyGpojf9+Fd8b9bZgviquNsPYYalIm6HPZhS5Fzsk+PVU4aFmS?=
 =?us-ascii?Q?gZdkqMnOw0ZtqKU84ZQQWDucjV6l2AcgdX03hHCQ0V2U78fZ5E/HI7lLF06r?=
 =?us-ascii?Q?Vq32dxKsXzivwyNRHdw/mt790VkKZUcVsmo/h9WfvUUIE7f1TuDldSCixJ74?=
 =?us-ascii?Q?AVH+IWV3sEx2RvQIbpUhGA5hD5xiqrgQ7LmsJJQoSeoFk8gKV7HWmcWKK82h?=
 =?us-ascii?Q?dOmiWiIUrqc+Fd4ZO0buVkdbrTBXaU+5nFJlBY9IBlswqtjzB4eYtYMliJ4D?=
 =?us-ascii?Q?TLhKG70dQneBG2YPYtNDb0dqAj9+oB5XPRe23Ol2aDQnx33axorcXUTlWY22?=
 =?us-ascii?Q?u3tX2bLJ3i3Yaj8S2vE5aMlfeNOfm2Fvoe46iO3uS2afiHDJfR8gPOXV3Qyc?=
 =?us-ascii?Q?kUSIKjFwHkrqFw62SQ/W0T0PhFwbKoH+zYgX12r30eTMs7Z/HZSRJR6ClWxV?=
 =?us-ascii?Q?Q+67xaGho14+KIKm8GE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QfyW91IhlzyUXqpVyi3DuAXSq4/2q2KlfbSp3i/yqUoanSCeTDeJaXJ7sj8H?=
 =?us-ascii?Q?LEeD2LTEqTVWcD81txiDenfrxw/JNvHu3MgzyEiGrvhXihpJjuIx4U0lG3VN?=
 =?us-ascii?Q?0wTyPUt07nsQGvWJeD3chnZL4ImA6fDaFCWnpn8DB9H0P64KysHkl/3u4F7c?=
 =?us-ascii?Q?dj9znNQK1bD6eMsF19PUV08BqsYpkGGQ0N6iFKMrn4L9zosVHgrwnjAIjxzF?=
 =?us-ascii?Q?kwObcZuJUoBiPOGG9DV2FLWO7wqHV5IhlstU+Bz36VfSLiP20TUE5uk6F748?=
 =?us-ascii?Q?wL+3XWjQgtN2NQ+36gbPcnnEhTRCqVMSeXomedR4oAmKslLjUtfysID8thHS?=
 =?us-ascii?Q?rA2rk5PkkvWG7AZ1LBbJBW7em2vivLjOELdcnxR4hcyykEy7t9vZt7HkmOas?=
 =?us-ascii?Q?4EreJT1G/OLaJlNbSOYwFm6NdVp1AL90YAWu/kBEmIpcvREJv/1J91qVqMmt?=
 =?us-ascii?Q?1W0Y7hIWANmp88+lpTcfZO1IgseUfWsWJGDATTVsBmOlAJSuaWhnAeSuqjuG?=
 =?us-ascii?Q?Bq3y2IDcpspdfbxf+pFAyKm6vz+6nTlxDFyhudibWwt0o3N8PqnBznPRXAHV?=
 =?us-ascii?Q?GmXfdCcdn+EFOsleXGyzQF+Uf8a8pE+wEvgCMffzG4V4bFaMhZLv2A/UZJ7L?=
 =?us-ascii?Q?QabfwINtWysj/exrh+Sl5e1b6jGs7vegVvZRzzc1vZcrRRl3bfojR0OlmeOr?=
 =?us-ascii?Q?ZIg4dWfpAF6Y29xX8Fo8kt/kSjz79LKIuyNe6waEiYyygBOo4ERMOJzM75aM?=
 =?us-ascii?Q?Rfc9oR6H9Bcpo1gFV6VghJp7MXU7degwtJmpBlRxC6+wwZtdvl4fhg8gVWyy?=
 =?us-ascii?Q?DzNMDPjuM0nZrxBt0c+YFuCqtUBc0KC2ec9MoVBiGlE1x9GXCdZv4+Q/pdHt?=
 =?us-ascii?Q?lL0MFBRcFNBwW3aGc3iQUqHTbmD4woXCV5xLB0bkl/FCiX5htj5Z1LfeJQ2U?=
 =?us-ascii?Q?3riRJ+48kir0TEVSOK8qzPw7yyjpSzIsFVCtVjDz4dDDoxyT5+shuj7e0pVp?=
 =?us-ascii?Q?wFgWzlI6scscdEYMkPXxfMEW157HNWqndHWHTYY5vkxQKgzUfWO7rtlmMOMI?=
 =?us-ascii?Q?EwpRmwPX8MjzM/E2VWULU/mwgt6lzdorjUUOK0CkVNDhnvo4Y0qiPrUi5h7m?=
 =?us-ascii?Q?OnHl7gEE8wFmGgz+ICSWa94BtCRFV3xUyrkgAUpMG3m7F2ER8YL1VxqMvIkO?=
 =?us-ascii?Q?06B7qtrnhdcBrpj/lcH104sexdnjMFAjqghSKMGqs/4bT38m9IRHdmi2IBxj?=
 =?us-ascii?Q?tGdyVEvrGrWBTp3q7R0/3Cjq+/jl1jJTHXCHAwlW0hAypphh53ZFTuaf0LeN?=
 =?us-ascii?Q?eoz+oH4kNSw/89LvANlLsts9dg1QdQZpSm8zmdtZRfsyZMX7sXQU5EnSPjUo?=
 =?us-ascii?Q?bOBmv5UICN8/9uQI0GD+68IA2EL84TZOSVFHPWRnXf4cyLwlMPDZOBqe9wg9?=
 =?us-ascii?Q?WAgCu2iD+9VKFLV8VsetakFMWXJasgJxqkYIlCiN3cka9e/xNjjwN2fa8KXR?=
 =?us-ascii?Q?R4IguO9BJVnVHoNbIo/bQaRrzFdQ3WV4Vi8e3VIq07qMsmW2VEmB2dHr5vs8?=
 =?us-ascii?Q?a8KxNtHsCK/hkFfLGMC10pZ01Zpw94YvuQQmpuiu8izkK6bgRq5wXE6dLjQ9?=
 =?us-ascii?Q?bEbmE8nWPNGI/XL6d15W4jdjx6GKJvkwLV32YjhUQUI8rRdexCy6HmL6Fyht?=
 =?us-ascii?Q?kCvyf1+U033P7XaMfswJrtyygHwPWy3BSd6ApeAP+RITh5iAuZYyeE+crrOE?=
 =?us-ascii?Q?z7N/JqW+NQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1101504a-57dd-4d19-735d-08de6f33a839
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 21:21:19.2659 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fwrWwvNWsDL1aBFFxEJgaj9yBcYSuDdoJHavpqCaHSyY+xho8gjxGTjAUjEwRrRHyMg4KlU0O2HYQx3/x5ROTg==
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
X-Rspamd-Queue-Id: B5103159E1B
X-Rspamd-Action: no action

Add unified Pte, Pde, and DualPde wrapper enums that abstract over
MMU v2 and v3 page table entry formats. These enums allow the page
table walker and VMM to work with both MMU versions.

Each unified type:
- Takes MmuVersion parameter in constructors
- Wraps both ver2 and ver3 variants
- Delegates method calls to the appropriate variant

This enables version-agnostic page table operations while keeping
version-specific implementation details encapsulated in the ver2
and ver3 modules.

Cc: Nikola Djukic <ndjukic@nvidia.com>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/mm/pagetable/mod.rs | 327 ++++++++++++++++++++++
 1 file changed, 327 insertions(+)

diff --git a/drivers/gpu/nova-core/mm/pagetable/mod.rs b/drivers/gpu/nova-core/mm/pagetable/mod.rs
index 5263a8f56529..1f783261a30f 100644
--- a/drivers/gpu/nova-core/mm/pagetable/mod.rs
+++ b/drivers/gpu/nova-core/mm/pagetable/mod.rs
@@ -10,6 +10,14 @@
 pub(crate) mod ver2;
 pub(crate) mod ver3;
 
+use kernel::prelude::*;
+
+use super::{
+    pramin,
+    Pfn,
+    VramAddress,
+    PAGE_SIZE, //
+};
 use crate::gpu::Architecture;
 
 /// MMU version enumeration.
@@ -77,6 +85,76 @@ pub(crate) const fn as_index(&self) -> u64 {
     }
 }
 
+impl MmuVersion {
+    /// Get the `PDE` levels (excluding PTE level) for page table walking.
+    pub(crate) fn pde_levels(&self) -> &'static [PageTableLevel] {
+        match self {
+            Self::V2 => ver2::PDE_LEVELS,
+            Self::V3 => ver3::PDE_LEVELS,
+        }
+    }
+
+    /// Get the PTE level for this MMU version.
+    pub(crate) fn pte_level(&self) -> PageTableLevel {
+        match self {
+            Self::V2 => ver2::PTE_LEVEL,
+            Self::V3 => ver3::PTE_LEVEL,
+        }
+    }
+
+    /// Get the dual PDE level (128-bit entries) for this MMU version.
+    pub(crate) fn dual_pde_level(&self) -> PageTableLevel {
+        match self {
+            Self::V2 => ver2::DUAL_PDE_LEVEL,
+            Self::V3 => ver3::DUAL_PDE_LEVEL,
+        }
+    }
+
+    /// Get the number of PDE levels for this MMU version.
+    pub(crate) fn pde_level_count(&self) -> usize {
+        self.pde_levels().len()
+    }
+
+    /// Get the entry size in bytes for a given level.
+    pub(crate) fn entry_size(&self, level: PageTableLevel) -> usize {
+        if level == self.dual_pde_level() {
+            16 // 128-bit dual PDE
+        } else {
+            8 // 64-bit PDE/PTE
+        }
+    }
+
+    /// Get the number of entries per page table page for a given level.
+    pub(crate) fn entries_per_page(&self, level: PageTableLevel) -> usize {
+        PAGE_SIZE / self.entry_size(level)
+    }
+
+    /// Compute upper bound on page table pages needed for `num_virt_pages`.
+    ///
+    /// Walks from PTE level up through PDE levels, accumulating the tree.
+    pub(crate) fn pt_pages_upper_bound(&self, num_virt_pages: usize) -> usize {
+        let mut total = 0;
+
+        // PTE pages at the leaf level.
+        let pte_epp = self.entries_per_page(self.pte_level());
+        // Ceiling of (num_virt_pages / entries_per_page).
+        let mut pages_at_level = (num_virt_pages + pte_epp - 1) / pte_epp;
+        total += pages_at_level;
+
+        // Walk PDE levels bottom-up (reverse of pde_levels()).
+        for &level in self.pde_levels().iter().rev() {
+            let epp = self.entries_per_page(level);
+            // How many pages at this level do we need to point to
+            // the previous pages_at_level?
+            // Calculated as ceiling of (pages_at_level / entries_per_page).
+            pages_at_level = (pages_at_level + epp - 1) / epp;
+            total += pages_at_level;
+        }
+
+        total
+    }
+}
+
 /// Memory aperture for Page Table Entries (`PTE`s).
 ///
 /// Determines which memory region the `PTE` points to.
@@ -149,3 +227,252 @@ fn from(val: AperturePde) -> Self {
         val as u8
     }
 }
+
+/// Unified Page Table Entry wrapper for both MMU v2 and v3 `PTE`
+/// types, allowing the walker to work with either format.
+#[derive(Debug, Clone, Copy)]
+pub(crate) enum Pte {
+    /// MMU v2 `PTE` (Turing/Ampere/Ada).
+    V2(ver2::Pte),
+    /// MMU v3 `PTE` (Hopper+).
+    V3(ver3::Pte),
+}
+
+impl Pte {
+    /// Create a `PTE` from a raw `u64` value for the given MMU version.
+    pub(crate) fn new(version: MmuVersion, val: u64) -> Self {
+        match version {
+            MmuVersion::V2 => Self::V2(ver2::Pte::new(val)),
+            MmuVersion::V3 => Self::V3(ver3::Pte::new(val)),
+        }
+    }
+
+    /// Create an invalid `PTE` for the given MMU version.
+    pub(crate) fn invalid(version: MmuVersion) -> Self {
+        match version {
+            MmuVersion::V2 => Self::V2(ver2::Pte::invalid()),
+            MmuVersion::V3 => Self::V3(ver3::Pte::invalid()),
+        }
+    }
+
+    /// Create a valid `PTE` for video memory.
+    pub(crate) fn new_vram(version: MmuVersion, pfn: Pfn, writable: bool) -> Self {
+        match version {
+            MmuVersion::V2 => Self::V2(ver2::Pte::new_vram(pfn, writable)),
+            MmuVersion::V3 => Self::V3(ver3::Pte::new_vram(pfn, writable)),
+        }
+    }
+
+    /// Check if this `PTE` is valid.
+    pub(crate) fn is_valid(&self) -> bool {
+        match self {
+            Self::V2(p) => p.valid(),
+            Self::V3(p) => p.valid(),
+        }
+    }
+
+    /// Get the physical frame number.
+    pub(crate) fn frame_number(&self) -> Pfn {
+        match self {
+            Self::V2(p) => p.frame_number(),
+            Self::V3(p) => p.frame_number(),
+        }
+    }
+
+    /// Get the raw `u64` value.
+    pub(crate) fn raw_u64(&self) -> u64 {
+        match self {
+            Self::V2(p) => p.raw_u64(),
+            Self::V3(p) => p.raw_u64(),
+        }
+    }
+
+    /// Read a `PTE` from VRAM.
+    pub(crate) fn read(
+        window: &mut pramin::PraminWindow<'_>,
+        addr: VramAddress,
+        mmu_version: MmuVersion,
+    ) -> Result<Self> {
+        let val = window.try_read64(addr.raw())?;
+        Ok(Self::new(mmu_version, val))
+    }
+
+    /// Write this `PTE` to VRAM.
+    pub(crate) fn write(
+        &self,
+        window: &mut pramin::PraminWindow<'_>,
+        addr: VramAddress,
+    ) -> Result {
+        window.try_write64(addr.raw(), self.raw_u64())
+    }
+}
+
+impl Default for Pte {
+    fn default() -> Self {
+        Self::V2(ver2::Pte::default())
+    }
+}
+
+/// Unified Page Directory Entry wrapper for both MMU v2 and v3 `PDE`.
+#[derive(Debug, Clone, Copy)]
+pub(crate) enum Pde {
+    /// MMU v2 `PDE` (Turing/Ampere/Ada).
+    V2(ver2::Pde),
+    /// MMU v3 `PDE` (Hopper+).
+    V3(ver3::Pde),
+}
+
+impl Pde {
+    /// Create a `PDE` from a raw `u64` value for the given MMU version.
+    pub(crate) fn new(version: MmuVersion, val: u64) -> Self {
+        match version {
+            MmuVersion::V2 => Self::V2(ver2::Pde::new(val)),
+            MmuVersion::V3 => Self::V3(ver3::Pde::new(val)),
+        }
+    }
+
+    /// Create a valid `PDE` pointing to a page table in video memory.
+    pub(crate) fn new_vram(version: MmuVersion, table_pfn: Pfn) -> Self {
+        match version {
+            MmuVersion::V2 => Self::V2(ver2::Pde::new_vram(table_pfn)),
+            MmuVersion::V3 => Self::V3(ver3::Pde::new_vram(table_pfn)),
+        }
+    }
+
+    /// Create an invalid `PDE` for the given MMU version.
+    pub(crate) fn invalid(version: MmuVersion) -> Self {
+        match version {
+            MmuVersion::V2 => Self::V2(ver2::Pde::invalid()),
+            MmuVersion::V3 => Self::V3(ver3::Pde::invalid()),
+        }
+    }
+
+    /// Check if this `PDE` is valid.
+    pub(crate) fn is_valid(&self) -> bool {
+        match self {
+            Self::V2(p) => p.is_valid(),
+            Self::V3(p) => p.is_valid(),
+        }
+    }
+
+    /// Get the VRAM address of the page table.
+    pub(crate) fn table_vram_address(&self) -> VramAddress {
+        match self {
+            Self::V2(p) => p.table_vram_address(),
+            Self::V3(p) => p.table_vram_address(),
+        }
+    }
+
+    /// Get the raw `u64` value.
+    pub(crate) fn raw_u64(&self) -> u64 {
+        match self {
+            Self::V2(p) => p.raw_u64(),
+            Self::V3(p) => p.raw_u64(),
+        }
+    }
+
+    /// Read a `PDE` from VRAM.
+    pub(crate) fn read(
+        window: &mut pramin::PraminWindow<'_>,
+        addr: VramAddress,
+        mmu_version: MmuVersion,
+    ) -> Result<Self> {
+        let val = window.try_read64(addr.raw())?;
+        Ok(Self::new(mmu_version, val))
+    }
+
+    /// Write this `PDE` to VRAM.
+    pub(crate) fn write(
+        &self,
+        window: &mut pramin::PraminWindow<'_>,
+        addr: VramAddress,
+    ) -> Result {
+        window.try_write64(addr.raw(), self.raw_u64())
+    }
+}
+
+impl Default for Pde {
+    fn default() -> Self {
+        Self::V2(ver2::Pde::default())
+    }
+}
+
+/// Unified Dual Page Directory Entry wrapper for both MMU v2 and v3 [`DualPde`].
+#[derive(Debug, Clone, Copy)]
+pub(crate) enum DualPde {
+    /// MMU v2 [`DualPde`] (Turing/Ampere/Ada).
+    V2(ver2::DualPde),
+    /// MMU v3 [`DualPde`] (Hopper+).
+    V3(ver3::DualPde),
+}
+
+impl DualPde {
+    /// Create a [`DualPde`] from raw 128-bit value (two `u64`s) for the given MMU version.
+    pub(crate) fn new(version: MmuVersion, big: u64, small: u64) -> Self {
+        match version {
+            MmuVersion::V2 => Self::V2(ver2::DualPde::new(big, small)),
+            MmuVersion::V3 => Self::V3(ver3::DualPde::new(big, small)),
+        }
+    }
+
+    /// Create a [`DualPde`] with only the small page table pointer set.
+    pub(crate) fn new_small(version: MmuVersion, table_pfn: Pfn) -> Self {
+        match version {
+            MmuVersion::V2 => Self::V2(ver2::DualPde::new_small(table_pfn)),
+            MmuVersion::V3 => Self::V3(ver3::DualPde::new_small(table_pfn)),
+        }
+    }
+
+    /// Check if the small page table pointer is valid.
+    pub(crate) fn has_small(&self) -> bool {
+        match self {
+            Self::V2(d) => d.has_small(),
+            Self::V3(d) => d.has_small(),
+        }
+    }
+
+    /// Get the small page table VRAM address.
+    pub(crate) fn small_vram_address(&self) -> VramAddress {
+        match self {
+            Self::V2(d) => d.small.table_vram_address(),
+            Self::V3(d) => d.small.table_vram_address(),
+        }
+    }
+
+    /// Get the raw `u64` value of the big PDE.
+    pub(crate) fn big_raw_u64(&self) -> u64 {
+        match self {
+            Self::V2(d) => d.big.raw_u64(),
+            Self::V3(d) => d.big.raw_u64(),
+        }
+    }
+
+    /// Get the raw `u64` value of the small PDE.
+    pub(crate) fn small_raw_u64(&self) -> u64 {
+        match self {
+            Self::V2(d) => d.small.raw_u64(),
+            Self::V3(d) => d.small.raw_u64(),
+        }
+    }
+
+    /// Read a dual PDE (128-bit) from VRAM.
+    pub(crate) fn read(
+        window: &mut pramin::PraminWindow<'_>,
+        addr: VramAddress,
+        mmu_version: MmuVersion,
+    ) -> Result<Self> {
+        let lo = window.try_read64(addr.raw())?;
+        let hi = window.try_read64(addr.raw() + 8)?;
+        Ok(Self::new(mmu_version, lo, hi))
+    }
+
+    /// Write this dual PDE (128-bit) to VRAM.
+    pub(crate) fn write(
+        &self,
+        window: &mut pramin::PraminWindow<'_>,
+        addr: VramAddress,
+    ) -> Result {
+        window.try_write64(addr.raw(), self.big_raw_u64())?;
+        window.try_write64(addr.raw() + 8, self.small_raw_u64())
+    }
+}
-- 
2.34.1

