Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4BpiDA/pb2lhUQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 21:43:59 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D31F24B8E7
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 21:43:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0DC010E682;
	Tue, 20 Jan 2026 20:43:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="PufFANsg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010026.outbound.protection.outlook.com
 [52.101.193.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDE3E10E64C;
 Tue, 20 Jan 2026 20:43:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MqJPLPOs0nfGD60ZwGgFcZZS4cDQYysVJ6f5DUPsQJPhCiJHAjfPL/ssxUav1rBa3V8DPhG6PXMMWf95V2FlCdE+ghr2tGjf2EkEG2I6iUQ0/T5mk5enyshFata/Z6jZUzXS3DM3u2Og87EZMYVewd2eNF3d8BVhirO85M6OGrNVxUz9t7+ZjqjZI6S+/0lQrnE83oHARSjikJsN2IJyd4DfUU79NqJLYs3dGqGjFGwM0CBo05PKSylKEP8N2FDJW2yJu7dk2CZ6fC3254kkeYVFKPMf4qEfcAMJVNpoZIFnEP0hlQ7NU8ZrDAkpUpcPMqdOl8tPlFbg27tjSf9KjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0lLiZUeYPn/js39AiTKJRSj8gMeB3+hvMowM+2efJOA=;
 b=OPAuVUNbpenPvHKoaCj2hAMNvwegsCpld5eOZ4BgHe6gFOmgQ4G2fgbH18pSs7FiJxS3TszywKS348bR55a0+/fBf0PD074GcGs0w6NnNPX5YQHyVMpcrhpZJHcd/sWbASO8XRBzl7kNQnn35sJIQ6xzKUZKadLGeA1byE8wbQTTwfNStNXH1BrcOJlWgVel6ON/PtWXxe8CfTjiUJObnsgQ8lFJZK5Eu1MumT6IX63rQmei2AZmxofMNI/s8k8uE2Xy4KW5DSW0ELQ/2o4hT7Zbke/w9KCBrtayIgm4oChjfE8oMibgxeQPmdHsgebDd9JheXn/Wzz+esborhnwOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0lLiZUeYPn/js39AiTKJRSj8gMeB3+hvMowM+2efJOA=;
 b=PufFANsg7piKmHFqsdAJRBcjKVUgdxPO//3iCqzm2aOmoSI3O44C+xtYyd+QrjVfszSJCss3donE1d5jRWzVgqZa98Jim7HJxYyq6K6RX7ZzIqedy7rJAmGbBJG0kmpdw1SGccapyspbUinxG8WLtjoIrMa/P2/WV2uLFN6tRNZS5ahaeCMKjDNuB4SkO77tbMzbxQeacuk4VanuOoL3OOt7V/z9x7yzC9rXpdiaaWNrwDnZAf0iNwGKNWSXVQOKxxj/WpWWs1+IbQ1EqDOjMdSNmcE4/XT08J4x3rVsImIOeuvIgp6WXwjL5c+JaiZld60SuABijNX55VP/UjZpKA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 PH7PR12MB6809.namprd12.prod.outlook.com (2603:10b6:510:1af::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.12; Tue, 20 Jan 2026 20:43:42 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9542.008; Tue, 20 Jan 2026
 20:43:42 +0000
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
Subject: [PATCH RFC v6 06/26] docs: gpu: nova-core: Document the PRAMIN
 aperture mechanism
Date: Tue, 20 Jan 2026 15:42:43 -0500
Message-Id: <20260120204303.3229303-7-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260120204303.3229303-1-joelagnelf@nvidia.com>
References: <20260120204303.3229303-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR08CA0011.namprd08.prod.outlook.com
 (2603:10b6:208:239::16) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|PH7PR12MB6809:EE_
X-MS-Office365-Filtering-Correlation-Id: aa3b5eb0-2868-410f-291d-08de586498a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?nNpBb9VP+po/HsvCXt975RayLU4aKnNkHp9Zq1e7d5A0Hl7idvR6SaD3TFpx?=
 =?us-ascii?Q?0YEaAenhj+1b9Te0ERU0opIfYYvSLAqoQiAGYtlcgx4e8IzYvtYpVBEGSmwW?=
 =?us-ascii?Q?/GGwc0tutAYHU5MiEhdvKwnK11/skBHwI27+m3rEdC3pHuE0Q2YxIb8AiVDi?=
 =?us-ascii?Q?+rdh8Lq8qwKun/EgKt/YkblRBxul//XT/6ByUMyais7AGT1eAyXMTaQ3ErgT?=
 =?us-ascii?Q?Q9JteP8it761qGyJOxh7WF/2rsx1jEctdPnX54pY+Ejx/QvTKATo7zzVR5HQ?=
 =?us-ascii?Q?ir3oAdPXVFIWMBCBuqbpidkMVdDDg1bRmhpbNtw1go2NSDP2SQjR+p1ovtaM?=
 =?us-ascii?Q?LWC5Yslpgu1JA1dWGqRFLMJNvEvpf+LKtnEFpFJH/uJpevmFV3+xhN/cCU52?=
 =?us-ascii?Q?czgZ/3c5gYzU+VIOG7HWFlJ1oYPyDPh1yQW3wNUpA6jWPlkjQ141GrUAyj7V?=
 =?us-ascii?Q?8q4bSyujJ4FDckmjbe/X+JuhhuCI8aTKpPA2AlN79dYY5d8cRaJYhKRoSsMO?=
 =?us-ascii?Q?RJ4KBCQm5Naxfx9JoiRqKI/1IkoVze0fDswuRbMpU1Ji8SUNCLbqnmc/ga/0?=
 =?us-ascii?Q?1vCjK27nkfM3WgjpqFm7FBzZJa/gpKXMT6cl3XZRgL7CSV8Q9Nk2JEqkuwcV?=
 =?us-ascii?Q?TtVt4vGVHbJa5n/8FIKr5o6uegTbx+FxkyNJ6P60/UgY/0S0fv66YZNTRZwq?=
 =?us-ascii?Q?7cqhaoyenA6oqHUEDDvVXAHZVuvbb5TP02u5W0drPXp7syvZE01KT5HOhnw2?=
 =?us-ascii?Q?Xcwvv0ATDuciFnVcOr0E8ZLLgRUbDDBcrpU9qtw/q1e71lGHFEIY1u4e7Ywm?=
 =?us-ascii?Q?sIYiFSmycnv7hedLu3SspnHXAys1YiFis6XB3Ss4ne4IDrREpDexaalWLnKB?=
 =?us-ascii?Q?YdPpbXxdLc8zDNv9p5gnrien3t6Z5J+DNW4q6A01hdvRV+SKAK0r/g1JwVH5?=
 =?us-ascii?Q?0yoSlHxnd8rSuLnozAe9h8lLETAmw2UXGWcjeYAF8dyKAKqjhsRy+t6i67xr?=
 =?us-ascii?Q?TQqOx8u/9DwzEX8HrVvn8FvgnW5Z74DdKj+K8ii8r1Q3YFjiY96Xv/P8fvAl?=
 =?us-ascii?Q?j79IWvLbJPTaIv2YIpQwBkJwcUzQ9p7O4hsdsxRq2xyn8OHQPOISI4c46so4?=
 =?us-ascii?Q?PAGLHHzzswbOGGI6OXzx8ho0NCYegv8OsynGBKnTzkvNwrzM+23x1KlpSCCf?=
 =?us-ascii?Q?TjMHc3yVNmf9XyAKTwXQ669fhKPO1BMsPncD8KD49dEItjuEJZwz2OK+ZJn9?=
 =?us-ascii?Q?Y9LnYj17hlqJTzUThD8xlGnOA2Li93x0On3HqsLTDCTOOrrz1j2j536ovUIT?=
 =?us-ascii?Q?EM1M0BKgJ16KqzcRE0j9ycBcAmVLUudBxbssuOc8B/d4ph9jBH7mkqv6E02v?=
 =?us-ascii?Q?TVjxlla7Od835BcCpMfxW1TW16G70eCOS+3yFx+SXj00jEJ4FgHCJ5nofdD8?=
 =?us-ascii?Q?Q6Kw+qLSlPBaqJOrgI1ZzRDRiuAPlQL3XC8FEZcq1XcNlaXWmrvHWI9mvd5T?=
 =?us-ascii?Q?CpLsS291EPacKIEaPELXwZjjhJINb/GU4j6y8Bo6a9t8HhFITIYCvV7aoBus?=
 =?us-ascii?Q?DJAzVR//YN+HI95Uyzg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?U+Z7GRhN2w5lYsW7IbDji+TLj2LujdlAvyCgN/3hPEaiuCU1l3+C5UfCqie0?=
 =?us-ascii?Q?lFpi3TfdLL+uaFmRHdlKzuZ9mcSXIXqW78JAyMVtnln9xnjTvcAxmgHyd5Iv?=
 =?us-ascii?Q?71CK+o24mRT9HZUMVmRVatK2SB1oYSK1BTrMVTpepTfy6ikBjLmtTV9F+gq6?=
 =?us-ascii?Q?Ng+JWymPBtu0L+cmKyAKEl0hE9IylvHp5jXjcAWmuPhnT3G8fe9vYRculqHb?=
 =?us-ascii?Q?zCthqynah7npT1igrzKZk35h4KmxoqLg9UgHreFC0vTZbZX0NsMD8tfZpbBU?=
 =?us-ascii?Q?v6syaLt/qweyxThF8goT4t8KdsIM4oX32cKxSEw0E1+PyDPavejv/CTkt69F?=
 =?us-ascii?Q?80+f5Cv2Jo+0LFPg7wXw6P9WLjDqmiG48nYbGnXIYr+pwWagWL9xKZt0Epxj?=
 =?us-ascii?Q?kKKEqHUpwHXaCCEorKDZAWI/tZuRDkZDKSmV7g124dhASC8yKQfVJHvrCBQv?=
 =?us-ascii?Q?BGb4H3YmlwMWU9e3WwbmgzhNl+4z3G6GfKA85w+oOhNfoG7e2OTxBASiJJY1?=
 =?us-ascii?Q?q69XFpqPYt9p8zI1jot3Fe4EOw1WZqM9pXTLL0BGFEe1wGEIkwLIxanpCo/O?=
 =?us-ascii?Q?gji3qV0rk9D+N14HJiDTEwx/EazK2+XPJcW5KXs7WlGdhe/yN0btXijjJRwF?=
 =?us-ascii?Q?iJPIO8yYFs3lCekvXazbpT7m59mlp50iydC5aLP65RHCTcpB1y4wKXtN+SN5?=
 =?us-ascii?Q?DOXrqBf94DDga0F3zL4HLyIenpaEaRflTmEh+Tdv9o8jOkvuo9N3uoCFlI8y?=
 =?us-ascii?Q?JkGAMsKO36/ntFCyqDTLVk5ovSJJV/bigKN7bwwwUHYYuN4vhaIxMck78gHg?=
 =?us-ascii?Q?ngFri8Tb1P0yojk4HSZwSVTPw/iLdmyzvECtIgaTp4hyXfN+5us+mWSmgzqB?=
 =?us-ascii?Q?StZfKBgGcY4Ic/s/SXufHjbLjS/xrA6D6bwHJJ4VuqfJpxcuutJu9pzH4rgS?=
 =?us-ascii?Q?MY/2v3cnLeHMiVSnaVrbUh5qbo2/0yMPaU8M0nHZKOK5BrZP0rN1GPl3gbb4?=
 =?us-ascii?Q?DY0FW6xuMiNi1gJu1KnBUepdy68onjySP7DiyUo0+5l9SoADs4PyXOaw58a7?=
 =?us-ascii?Q?qQbdtgffZaIB6j8e3xuWWhHpCOY776aQLmLADJVOHjLEmTiDU4RKGRvlIbMp?=
 =?us-ascii?Q?NrN3yGOtYZ9n6AEjm1buCBwSdwwh21EP6gJtbRWAurvcWZ76dbMUjmFgyJaW?=
 =?us-ascii?Q?YigL8cKyFtZ/MG/w6mYDPgJ66eACeNg2ykVf4R/BHApWgBuAg07LVaDhuSBg?=
 =?us-ascii?Q?oH3s5KRfo5pj6Ret5ExLYA0n/Zgpb+0tzh3DLylvJnWDcYTcuwRPCFyzkajX?=
 =?us-ascii?Q?Puy5IRywzqFndrEB3zcj02OOE2EJCIsOL3dTUgCla0J2rYCkKzXW+/BwLLvN?=
 =?us-ascii?Q?ndiQ6KaMlaWZH8U2SFZ00LyNCygEqX608acwejAb16pgU2eK850fsHsi3857?=
 =?us-ascii?Q?DxDtG98pV3ftEgur5gbsLLrMMYn6cQyh7rz1kRoyPZcTNEdqu7R7RvMv3UY7?=
 =?us-ascii?Q?vGC9qwDD/181ZlObW5nh8+5KVuJt3n7x1fBI3foAe+D8OWtKdtM+sdoAYqnk?=
 =?us-ascii?Q?ssxNGg2OrqQGKVsTNtEa0FRAowgjCP1yXqX5mTCSUUtLJajLJO13kQx8RLen?=
 =?us-ascii?Q?Aow2R55LjCD7AK8alLP/4CkerWJhYFpbfQUvacbUpspW73YH+kofYZbqlfWh?=
 =?us-ascii?Q?avAIgmZ8sANNTDa9PwVGwmtO6KqptZkosHNAaNLfhiiTEVV0qDIJ130aJjnD?=
 =?us-ascii?Q?XKEwZl+6jQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa3b5eb0-2868-410f-291d-08de586498a5
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 20:43:41.6569 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4VeJnXxF0Ev8BAY88aiL3NLBXSy0s+7yNbpwAZPXf4UBgaZ7jLs9aj3xtUROlnwkcCY59+3CNjLXud5GyEKsvw==
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,nvidia.com:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,Nvidia.com:dkim]
X-Rspamd-Queue-Id: D31F24B8E7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add documentation for the PRAMIN aperture mechanism used by nova-core
for direct VRAM access.

Nova only uses TARGET=VID_MEM for VRAM access. The SYS_MEM target values
are documented for completeness but not used by the driver.

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 Documentation/gpu/nova/core/pramin.rst | 125 +++++++++++++++++++++++++
 Documentation/gpu/nova/index.rst       |   1 +
 2 files changed, 126 insertions(+)
 create mode 100644 Documentation/gpu/nova/core/pramin.rst

diff --git a/Documentation/gpu/nova/core/pramin.rst b/Documentation/gpu/nova/core/pramin.rst
new file mode 100644
index 000000000000..55ec9d920629
--- /dev/null
+++ b/Documentation/gpu/nova/core/pramin.rst
@@ -0,0 +1,125 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+=========================
+PRAMIN aperture mechanism
+=========================
+
+.. note::
+   The following description is approximate and current as of the Ampere family.
+   It may change for future generations and is intended to assist in understanding
+   the driver code.
+
+Introduction
+============
+
+PRAMIN is a hardware aperture mechanism that provides CPU access to GPU Video RAM (VRAM) before
+the GPU's Memory Management Unit (MMU) and page tables are initialized. This 1MB sliding window,
+located at a fixed offset within BAR0, is essential for setting up page tables and other critical
+GPU data structures without relying on the GPU's MMU.
+
+Architecture Overview
+=====================
+
+The PRAMIN aperture mechanism is logically implemented by the GPU's PBUS (PCIe Bus Controller Unit)
+and provides a CPU-accessible window into VRAM through the PCIe interface::
+
+    +-----------------+    PCIe     +------------------------------+
+    |      CPU        |<----------->|           GPU                |
+    +-----------------+             |                              |
+                                    |  +----------------------+    |
+                                    |  |       PBUS           |    |
+                                    |  |  (Bus Controller)    |    |
+                                    |  |                      |    |
+                                    |  |  +--------------+<------------ (window starts at
+                                    |  |  |   PRAMIN     |    |    |     BAR0 + 0x700000)
+                                    |  |  |   Window     |    |    |
+                                    |  |  |   (1MB)      |    |    |
+                                    |  |  +--------------+    |    |
+                                    |  |         |            |    |
+                                    |  +---------|------------+    |
+                                    |            |                 |
+                                    |            v                 |
+                                    |  +----------------------+<------------ (Program PRAMIN to any
+                                    |  |       VRAM           |    |    64KB-aligned VRAM boundary)
+                                    |  |    (Several GBs)     |    |
+                                    |  |                      |    |
+                                    |  |  FB[0x000000000000]  |    |
+                                    |  |          ...         |    |
+                                    |  |  FB[0x7FFFFFFFFFF]   |    |
+                                    |  +----------------------+    |
+                                    +------------------------------+
+
+PBUS (PCIe Bus Controller) is responsible for, among other things, handling MMIO
+accesses to the BAR registers.
+
+PRAMIN Window Operation
+=======================
+
+The PRAMIN window provides a 1MB sliding aperture that can be repositioned over
+the entire VRAM address space using the ``NV_PBUS_BAR0_WINDOW`` register.
+
+Window Control Mechanism
+-------------------------
+
+The window position is controlled via the PBUS ``BAR0_WINDOW`` register::
+
+    NV_PBUS_BAR0_WINDOW Register (0x1700):
+    +-------+--------+--------------------------------------+
+    | 31:26 | 25:24  |               23:0                   |
+    | RSVD  | TARGET |            BASE_ADDR                 |
+    |       |        |        (bits 39:16 of VRAM address)  |
+    +-------+--------+--------------------------------------+
+
+    BASE_ADDR field (bits 23:0):
+    - Contains bits [39:16] of the target VRAM address
+    - Provides 40-bit (1TB) address space coverage
+    - Must be programmed with 64KB-aligned addresses
+
+    TARGET field (bits 25:24):
+    - 0x0: VRAM (Video Memory)
+    - 0x1: SYS_MEM_COH (Coherent System Memory)
+    - 0x2: SYS_MEM_NONCOH (Non-coherent System Memory)
+    - 0x3: Reserved
+
+    .. note::
+       Nova only uses TARGET=VRAM (0x0) for video memory access. The SYS_MEM
+       target values are documented here for hardware completeness but are
+       not used by the driver.
+
+64KB Alignment Requirement
+---------------------------
+
+The PRAMIN window must be aligned to 64KB boundaries in VRAM. This is enforced
+by the ``BASE_ADDR`` field representing bits [39:16] of the target address::
+
+    VRAM Address Calculation:
+    actual_vram_addr = (BASE_ADDR << 16) + pramin_offset
+    Where:
+    - BASE_ADDR: 24-bit value from NV_PBUS_BAR0_WINDOW[23:0]
+    - pramin_offset: 20-bit offset within the PRAMIN window [0x00000-0xFFFFF]
+
+    Example Window Positioning:
+    +---------------------------------------------------------+
+    |                    VRAM Space                           |
+    |                                                         |
+    |  0x000000000  +-----------------+ <-- 64KB aligned      |
+    |               | PRAMIN Window   |                       |
+    |               |    (1MB)        |                       |
+    |  0x0000FFFFF  +-----------------+                       |
+    |                                                         |
+    |       |              ^                                  |
+    |       |              | Window can slide                 |
+    |       v              | to any 64KB-aligned boundary     |
+    |                                                         |
+    |  0x123400000  +-----------------+ <-- 64KB aligned      |
+    |               | PRAMIN Window   |                       |
+    |               |    (1MB)        |                       |
+    |  0x1234FFFFF  +-----------------+                       |
+    |                                                         |
+    |                       ...                               |
+    |                                                         |
+    |  0x7FFFF0000  +-----------------+ <-- 64KB aligned      |
+    |               | PRAMIN Window   |                       |
+    |               |    (1MB)        |                       |
+    |  0x7FFFFFFFF  +-----------------+                       |
+    +---------------------------------------------------------+
diff --git a/Documentation/gpu/nova/index.rst b/Documentation/gpu/nova/index.rst
index e39cb3163581..b8254b1ffe2a 100644
--- a/Documentation/gpu/nova/index.rst
+++ b/Documentation/gpu/nova/index.rst
@@ -32,3 +32,4 @@ vGPU manager VFIO driver and the nova-drm driver.
    core/devinit
    core/fwsec
    core/falcon
+   core/pramin
-- 
2.34.1

