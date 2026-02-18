Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wOV3GVMtlmm5bwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 22:21:23 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18A68159DC8
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 22:21:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7F3F10E317;
	Wed, 18 Feb 2026 21:21:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="VdTyDfEV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011025.outbound.protection.outlook.com
 [40.93.194.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD2BD10E632;
 Wed, 18 Feb 2026 21:21:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UoCQVsKhUVfC4rv5g3YOyoVkQUZbNPWQpukonYSSSujntPF9kybE/1jOa9byS5fcVR3juSnKaew5KUKI+Vus1dcT8umLugaW+tcEvVqR4Q9m5S5ExSaRqpHpTdMBNi2h04KJK2YZFHurDOuX+MxGsoz21Pad6TAOQaL7054faue/1s2CtdmoMsO61TPT7NmSqpUiW6pPpdC2uLPFIi8HbTfc93dAwrJOIDB0Nfl4YGc9fbPfQpgKI3PSfq2hj023DXRrg7inEWXTraA+oHUyiwS0eMbLst2GadQ8xsbcwIGtvyCpYfk5Ac/LVMMqzoCmpLh+p1E4p/0dpokhh6mpig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y8PKs/VTWb4R67ByrAa+G7hk7mxsNxy5JfbbbtaYKUw=;
 b=HXYdc3nzV1YrPCi6c0I1rhQKQWQMnfbP3r4kzDSQy8s2tg3TvZgnPdOH5SkpNS/zXAnT6kYSjkfK34ocEuSFbnsO8zcgieu+B4nSwERC8HlVFnoIGYHQ9ZAvuu7idWlgDkoxJ8IQbSlRJ65bPwR0dS0bknch8Hzh713FMYi/5GYUifFotXBDSaPcuKcNpA8qEm6rjSMTdRk3RHCLL7ADEjdKTmzghqb+lzfoy2t+zXXlZXg0MjoXrtGPyWqJIUzV12qvEATTnpjqmDw9FiWm7H+BeLTbL1511NvluMTJ932YP1mQMfgpDrgdTP7ZyRStTUuRJchSlB0/XJ440OpjAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y8PKs/VTWb4R67ByrAa+G7hk7mxsNxy5JfbbbtaYKUw=;
 b=VdTyDfEVV/C1SJ/YZvJrfhBLTzHkybVQQKkrbdDLxR+zoKEJ8S2A3L4Zzs2ztI0iqH801nhNlj6h6iugWhRX4Bth6PT+S5dRO1Ki4wpIFxzHft/2LDPjzOMjb2WehPoOIJstRE4VXHAfKEmfBgg7+HDzZusxjwP2qrloTFAZlks+k0EodCc5D9ySN4aHXO1bFfnttK4d3yYWpKpJSwgB4WmADCcr61gVQ2UtX+ttnlg73mYM3iU+LgFGdBMwxf3JtoZ4k4470PB/ZLe+XZx4V1ZfOE+9LumlEAIYjBqay1Gjmje+IjjjekR0zFkhUfLEaKw9LD+NlOYC7ZgL2Ovwgw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 PH0PR12MB999111.namprd12.prod.outlook.com (2603:10b6:510:38d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Wed, 18 Feb
 2026 21:21:13 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9632.010; Wed, 18 Feb 2026
 21:21:13 +0000
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
Subject: [PATCH v7 06/23] nova-core: mm: Add common types for all page table
 formats
Date: Wed, 18 Feb 2026 16:20:03 -0500
Message-Id: <20260218212020.800836-7-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260218212020.800836-1-joelagnelf@nvidia.com>
References: <20260218212020.800836-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0403.namprd13.prod.outlook.com
 (2603:10b6:208:2c2::18) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|PH0PR12MB999111:EE_
X-MS-Office365-Filtering-Correlation-Id: 3da3e9eb-e166-4138-213f-08de6f33a50a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?W+VfS8Lf+1dR+lckmjNysKvUlJKZx5nexquhkwHI4JX1TFAonSGPDz6zshMA?=
 =?us-ascii?Q?n/T2WC/vJWEPgrB3udCQL76eRU0jFHE0AoFB2vEDehm94qQgFsljX7VcpbE7?=
 =?us-ascii?Q?0ocr2V874/XSYcSWtqQ8N9PmLmQKTKWA8jhI36o1f49gyEgQngt+usM7QBou?=
 =?us-ascii?Q?OOLB9rLfZA6b+h7mcS4vR+qVAm7JOp9wy7Ex9OwBzI1R3GM+5UPdv5SmTP0+?=
 =?us-ascii?Q?BOuQNIP79/L/XszagpDBzdw970cmA/alcLO+4jUdGJdE9IeDm6sZAe457La6?=
 =?us-ascii?Q?i7yF2AOlkYnqH8oS2CuJnm+g1AivTgfP7N9pFOIkt7qAErS6P4C8OW1ZkYt0?=
 =?us-ascii?Q?58l8H7+aDRev9s5KfOHPMEhM60Pgth8+aFsjkjEz8kaxL6pK0GRt6t+QG+HF?=
 =?us-ascii?Q?UQKhNkAmDpE4IKgGdYxFHMLyhlOJm/zYhKnNXTHejWL/SEyMY8cr8hfZwCo8?=
 =?us-ascii?Q?7HCY0Ojfflr3wka/zP5Cq1WQ/Pjdo+1wrecvruWGQBAdmBQW04dgoPvbpEUh?=
 =?us-ascii?Q?LBVe2vOmULDHSRH1RhQOA2wYo2cz36vt2vZMW1ilcOU0f4fjQjTwosEUyPiX?=
 =?us-ascii?Q?JKFRc5Wn9Nc8XdekfIBYXaaS9hYtBFUGpGolni8QGcIayPn6pdz//1cMIxLa?=
 =?us-ascii?Q?MHcso1TFXmUFfEDR3cIT/6sZXYwFJPevFhwHm+pj/XM2nmDtEAWwTn6zpZsb?=
 =?us-ascii?Q?jaf7da2v4KwxCbAyaxTVlbRziiDnpETP3LetQiNwbcxyBwLKHsnZF0HTGci9?=
 =?us-ascii?Q?0V04qX/SNA4P/8KdHP1uRQ09XJBD3dBgloadjqSDi0t1FjLYwx8bKsaVGEIj?=
 =?us-ascii?Q?8a4Ap6oyFTVeFR1zGOVZrxtNUgCn48JPMoTaTpOwpIfz7e6gjZZsf3+o9rVQ?=
 =?us-ascii?Q?LrpWXHsu6Sw3TFLAgTWIvbkUPcVjkNMAaHFX8QXDsEZANqApzQgJti4I/a9y?=
 =?us-ascii?Q?IHmit11W0V1DxRksMqsxkXVOtseFUwMiDD8k39iAdWrLkMH8S/1qIUyTF55W?=
 =?us-ascii?Q?PCxdV1WOGjw35f1+uV+eFhbP1NQKbyFFWHeodpXP7EKiSVe1auGVna1DcJTg?=
 =?us-ascii?Q?CD3bIXZwW+rNIHF6croGOcdYfrHNNqec8CFwbRejSFmkM5eI+Lxr8rq9d1k/?=
 =?us-ascii?Q?75w3K+0QJ75+lQhDg+AxO1r/hUuyH2pAFjMWkor/6awgrmUu4u+4kjREOXeY?=
 =?us-ascii?Q?VtLtiya7KQg1lZ90msWzt9LHZnyxE9yKA4sr1f++n3yIM6a9EUbL+B+sbEmc?=
 =?us-ascii?Q?fzgoAVZ3JkYyQWC9zs061PbwvmaS+wYFhHf1CSDXlZDWjwLB9xYIxGwYr0tO?=
 =?us-ascii?Q?f63gRzwbbnkgQlkmZd3kZn63z3tlPp7fve9k4CdFkNQ/ecRHXWOqRi7gEsdm?=
 =?us-ascii?Q?Tf6Wpknmq2qsdfmD9jh5cllke8xsauiLX19TPbDD2v6LDSOCUkyLh01SgTFS?=
 =?us-ascii?Q?wmO7axUT+3tCaVZbQzn571bfbU8hVXS2NbvK4XzxQVEl80NxfdolUD66V0Vl?=
 =?us-ascii?Q?tfHrT+KiqLeQNhv7ZuOz3oQh/viPiOLVIl6de0CzzDB2FavGeNOJ9HbPNhKC?=
 =?us-ascii?Q?IMooBJofWqWOQaRj6O8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8D084RshYQ97OFITRefsrJd6QohvOQVdkb7jjnZOdTOareqDUsaJQQ63qEyA?=
 =?us-ascii?Q?dK6p/GcXmM1MdpVUwSyrrT5xvgEAIRuAmO3HsH61+sbx37RS+1+vZY3V0klG?=
 =?us-ascii?Q?PYoC0Ya2Yk5+jr3/N1GuQ2wOgXkMR6Bh5NIqMPe6oSl+FcL0TUve1t9QBBaw?=
 =?us-ascii?Q?UclHYpCpbjPWkc/ehutf2LRHhjnkTr3pOYsudHlwhfTRoKl01+Mkm85n3vMX?=
 =?us-ascii?Q?Kxs5j4MYLc/YpDbkNbhjtXY46S8jmUf8jkGRrjNS5HqAUoizc8WX8+U1tmBZ?=
 =?us-ascii?Q?IuhagFJ30BrnnBnq63dN/44DsuuDccWWUlKVrlAMSZJkMpJraVBuowu8mvqq?=
 =?us-ascii?Q?tdHa+/wymyVgkcLOKXG7nACPfPrMGlVY81ITFpoODKuPTF8zJ4hXrySzVyxh?=
 =?us-ascii?Q?JiJmToTjtqP3jOpCzjLcKA8YPFNtzxuZZcDislp6rEp4bqQlW0qn7DXTXk58?=
 =?us-ascii?Q?AlKIlYVwdQwz1W3AwYjd+QIisdELoyANjrvBGrYowvqeYTIAYvQf4RQ3nK/e?=
 =?us-ascii?Q?ZNWI+noyt243OCC1KGXhO35cR2cl9QpJ7zEnPHJLksDCAdR0xU20itHNtPLR?=
 =?us-ascii?Q?3AKzt7nkepqIlwmctXSDjaxlOUVFnjtY3RrNSP4n7lSTRXHk65ykfRdmqpHU?=
 =?us-ascii?Q?E4LgpQ4OqgUZhh9nT0C4qhUZtvmKT9RTLQDxTOBQMJjCCjdTeN+hd+GgSsKX?=
 =?us-ascii?Q?ZXTmkcib2nIbC82qjw1+IxEdwQJYCAQDiAOpRcrYf3ZvhcH6wCm+6CbPWA0F?=
 =?us-ascii?Q?IrDcpCZ009n7UKzvLnWGFUM1FUUEAtUOvXjZcxmlXd52yb2+vKvar1eXqprD?=
 =?us-ascii?Q?BIaMPZ8IGGvjcUcS+fTDxspfuWgfHF722Z25gRSHwk43foJfeiczSrobWDIq?=
 =?us-ascii?Q?OibM7toI4XpGt5EEgv/ZjUdBb1Wc5ml0e2r3OHKriJeXKHcZebId0c67VfBJ?=
 =?us-ascii?Q?FXNk8fFb95QnS7aypwKvLm1n2I0AYM9qk1lzFf7oBfmhsGGb4DJZIg9Jfyna?=
 =?us-ascii?Q?zWlswy2obx3Rnh8l/0oIS5lNDTKGeKGrxvyHUpfDxQEL24JQqm9yxIGRM0XA?=
 =?us-ascii?Q?HWI7uywFRB2kyP75uZeeCANMpysulls5UEZs+G9gEFpJZnP48JhHZZuTowBT?=
 =?us-ascii?Q?4ARpoSg7cX7U64t3/2CaVbIQukYV+poc9u4i3C7L3dXpFR12YcgsGsIboJ67?=
 =?us-ascii?Q?IBC9BGReYVKviXtOygDbIB8I56E3zpdaLdL2eW1LmV0iBcq5+/izIh5pS/bS?=
 =?us-ascii?Q?VodRTDd/8fsAMz4C6q8qLUcLDYjzuertuvU7EROTzfFtG/ajiFyVic8E9ZqS?=
 =?us-ascii?Q?8q3spxlbTfvWgBfqZyT7XIowvr+tV6G5cLNyDxiS0o8o/eItljkQAzJq1Gyf?=
 =?us-ascii?Q?HzJZ1rBRFK5FpUwVcm5gROBYDFZK646RVx5HFr3cUClEm4I94rI1LxZl7WoF?=
 =?us-ascii?Q?H2M0oWT8FlUCg/j0IGH4KQ4SGtSaPH9aWABVWxu2WZxN8OtHPWQeJ9GARC5k?=
 =?us-ascii?Q?uCDxRp2rKddpF7mEl01+v9PWZHozKb349SWMVxg9RaZMcjyfp6YOweu55NGp?=
 =?us-ascii?Q?D51zkcr3pCl43KROvh41OGauyU2cEx5C5MP9qg8y+tNYt+s66cvKirfWG27N?=
 =?us-ascii?Q?x6dYJ2EuXt9sAjjkn7CrN//YY9R2EPzq0eqTCxDgIk6tIwqEpTeiiALEqHr6?=
 =?us-ascii?Q?aUIdSD8m0upf3Om2oQI5uiJewXnrnM4vFG3hpUmg5Pkvz04amvi3xCGCTTIF?=
 =?us-ascii?Q?FZ56BdOU2Q=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3da3e9eb-e166-4138-213f-08de6f33a50a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 21:21:13.7442 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mrvjgklqYD9/c7zQ4IWhA7M6WsdNn1KWPRVx/LBxplUhXTQTgi4m8JCKLN4SSeCm1NJw35Q4aMKH2WCQxkgIZg==
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
X-Rspamd-Queue-Id: 18A68159DC8
X-Rspamd-Action: no action

Add common page table types shared between MMU v2 and v3. These types
are hardware-agnostic and used by both MMU versions.

Cc: Nikola Djukic <ndjukic@nvidia.com>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/mm/mod.rs           |   1 +
 drivers/gpu/nova-core/mm/pagetable/mod.rs | 149 ++++++++++++++++++++++
 2 files changed, 150 insertions(+)
 create mode 100644 drivers/gpu/nova-core/mm/pagetable/mod.rs

diff --git a/drivers/gpu/nova-core/mm/mod.rs b/drivers/gpu/nova-core/mm/mod.rs
index 04d9baa7220e..c88b7b7b6975 100644
--- a/drivers/gpu/nova-core/mm/mod.rs
+++ b/drivers/gpu/nova-core/mm/mod.rs
@@ -4,6 +4,7 @@
 
 #![expect(dead_code)]
 
+pub(crate) mod pagetable;
 pub(crate) mod pramin;
 
 use kernel::sizes::SZ_4K;
diff --git a/drivers/gpu/nova-core/mm/pagetable/mod.rs b/drivers/gpu/nova-core/mm/pagetable/mod.rs
new file mode 100644
index 000000000000..aea06e5da4ff
--- /dev/null
+++ b/drivers/gpu/nova-core/mm/pagetable/mod.rs
@@ -0,0 +1,149 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Common page table types shared between MMU v2 and v3.
+//!
+//! This module provides foundational types used by both MMU versions:
+//! - Page table level hierarchy
+//! - Memory aperture types for PDEs and PTEs
+
+#![expect(dead_code)]
+
+use crate::gpu::Architecture;
+
+/// MMU version enumeration.
+#[derive(Debug, Clone, Copy, PartialEq, Eq)]
+pub(crate) enum MmuVersion {
+    /// MMU v2 for Turing/Ampere/Ada.
+    V2,
+    /// MMU v3 for Hopper and later.
+    V3,
+}
+
+impl From<Architecture> for MmuVersion {
+    fn from(arch: Architecture) -> Self {
+        match arch {
+            Architecture::Turing | Architecture::Ampere | Architecture::Ada => Self::V2,
+            // In the future, uncomment:
+            // _ => Self::V3,
+        }
+    }
+}
+
+/// Page Table Level hierarchy for MMU v2/v3.
+#[derive(Debug, Clone, Copy, PartialEq, Eq)]
+pub(crate) enum PageTableLevel {
+    /// Level 0 - Page Directory Base (root).
+    Pdb,
+    /// Level 1 - Intermediate page directory.
+    L1,
+    /// Level 2 - Intermediate page directory.
+    L2,
+    /// Level 3 - Intermediate page directory or dual PDE (version-dependent).
+    L3,
+    /// Level 4 - PTE level for v2, intermediate page directory for v3.
+    L4,
+    /// Level 5 - PTE level used for MMU v3 only.
+    L5,
+}
+
+impl PageTableLevel {
+    /// Number of entries per page table (512 for 4KB pages).
+    pub(crate) const ENTRIES_PER_TABLE: usize = 512;
+
+    /// Get the next level in the hierarchy.
+    pub(crate) const fn next(&self) -> Option<PageTableLevel> {
+        match self {
+            Self::Pdb => Some(Self::L1),
+            Self::L1 => Some(Self::L2),
+            Self::L2 => Some(Self::L3),
+            Self::L3 => Some(Self::L4),
+            Self::L4 => Some(Self::L5),
+            Self::L5 => None,
+        }
+    }
+
+    /// Convert level to index.
+    pub(crate) const fn as_index(&self) -> u64 {
+        match self {
+            Self::Pdb => 0,
+            Self::L1 => 1,
+            Self::L2 => 2,
+            Self::L3 => 3,
+            Self::L4 => 4,
+            Self::L5 => 5,
+        }
+    }
+}
+
+/// Memory aperture for Page Table Entries (`PTE`s).
+///
+/// Determines which memory region the `PTE` points to.
+#[repr(u8)]
+#[derive(Debug, Clone, Copy, PartialEq, Eq, Default)]
+pub(crate) enum AperturePte {
+    /// Local video memory (VRAM).
+    #[default]
+    VideoMemory = 0,
+    /// Peer GPU's video memory.
+    PeerMemory = 1,
+    /// System memory with cache coherence.
+    SystemCoherent = 2,
+    /// System memory without cache coherence.
+    SystemNonCoherent = 3,
+}
+
+// TODO[FPRI]: Replace with `#[derive(FromPrimitive)]` when available.
+impl From<u8> for AperturePte {
+    fn from(val: u8) -> Self {
+        match val {
+            0 => Self::VideoMemory,
+            1 => Self::PeerMemory,
+            2 => Self::SystemCoherent,
+            3 => Self::SystemNonCoherent,
+            _ => Self::VideoMemory,
+        }
+    }
+}
+
+// TODO[FPRI]: Replace with `#[derive(ToPrimitive)]` when available.
+impl From<AperturePte> for u8 {
+    fn from(val: AperturePte) -> Self {
+        val as u8
+    }
+}
+
+/// Memory aperture for Page Directory Entries (`PDE`s).
+///
+/// Note: For `PDE`s, `Invalid` (0) means the entry is not valid.
+#[repr(u8)]
+#[derive(Debug, Clone, Copy, PartialEq, Eq, Default)]
+pub(crate) enum AperturePde {
+    /// Invalid/unused entry.
+    #[default]
+    Invalid = 0,
+    /// Page table is in video memory.
+    VideoMemory = 1,
+    /// Page table is in system memory with coherence.
+    SystemCoherent = 2,
+    /// Page table is in system memory without coherence.
+    SystemNonCoherent = 3,
+}
+
+// TODO[FPRI]: Replace with `#[derive(FromPrimitive)]` when available.
+impl From<u8> for AperturePde {
+    fn from(val: u8) -> Self {
+        match val {
+            1 => Self::VideoMemory,
+            2 => Self::SystemCoherent,
+            3 => Self::SystemNonCoherent,
+            _ => Self::Invalid,
+        }
+    }
+}
+
+// TODO[FPRI]: Replace with `#[derive(ToPrimitive)]` when available.
+impl From<AperturePde> for u8 {
+    fn from(val: AperturePde) -> Self {
+        val as u8
+    }
+}
-- 
2.34.1

