Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UHYrNrs4hWlf+QMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 01:41:31 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D06F8B8A
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 01:41:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CCD410E204;
	Fri,  6 Feb 2026 00:41:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="nEYU5RtX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010026.outbound.protection.outlook.com [52.101.61.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A21A10E1DC;
 Fri,  6 Feb 2026 00:41:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vxUr1In1V5ADwv9SD3Zkmmb484M45IvRj6bC5kEQb+rDB7c/ShX5puPhPkkeKyXACec3I9xrbzqSbkrhd0etlH1di5pLUL+lIG1iT5bUbmzNoP34jpSmDXusy/wAjvcFtMBmFZene4OfEkhZV5pzfK9JtpH9LmBbvmAsgKQjF8HnpdryF4DSWoCe4jE4BIf6uYz3Yvbx6cUlJwlm+BTXi1+gc8eWllhPmMSHEvutRhApwIxlnEm8trVMfIaV72EbYyniG/pn65B7Gq2s6t447F6pL+82QIgnQ5hHcmSFaEb/Ke79XY9K/toLICz7QIynZnEBm9plDARW5zaBFvLjBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JlyAgh6H5m9RZ104Q/N+FWxV3aKUa96o6raxAFmubss=;
 b=kiP/bIm398qVPIl0d29WHxpPmgw9llOWoR3Ilti59Wma2WXUIC/TmuAr6kc5oFKKhPPuZUzL5z2MK2wX7uiNinDhVAm4Xt5Mw2H/nQpCUIb/JS7xiCsHcNGNtM9wXNWo/C6Q6po0o3mDdk+2jMNyA/4GJptTUxEXkuj849esbcvqU6RsEqqzkZMrDzIxXPxev99qAwyMs1et97btaAbNIyZts0n8wOd+xV1r9iwOXt+U3XqOxDX3FeaFijfDTvek7hDcSrprLKsGnAUF9W6djqqlbB/71ckJchLolJeg7anUTCvNxuxH7zPgFMfxRFMtk6Q7h05Vm14a82Gsk1Diwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JlyAgh6H5m9RZ104Q/N+FWxV3aKUa96o6raxAFmubss=;
 b=nEYU5RtX8koWBK2ky5zHA6wtxMNB+ciwX3s8n7kVG6EyZnZHFof5lAhlkmzMkw9Ds3iXYOZiD0vgyxm7bLZpUGYpCViWb5DDH8KR/i2MyTfWf+F+uF1RzUm2IdUl67RJQ7Wf8dYD86YyEAkkKwfKZstDgrJxI0IyG+aeMdcOWFCi8PrdsqE/q+AYIOxsb8pu70Zv/bNjHj2oZUegoxvEikJaPYFss1R7vlKkfsITdA/Bzris5czl48BfsisjYVWID3YhMFf19yyt6u3aNo1WNG/deDiRVGrkxV+K3DiRbwNqzYT2sqP4GVtjMvQPkQwr5u2hcO0Zt8P9x7+wRuc5aQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 IA4PR12MB9833.namprd12.prod.outlook.com (2603:10b6:208:55b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Fri, 6 Feb
 2026 00:41:22 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9587.010; Fri, 6 Feb 2026
 00:41:22 +0000
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
 Daniel Almeida <daniel.almeida@collabora.com>, joel@joelfernandes.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 Joel Fernandes <joelagnelf@nvidia.com>
Subject: [PATCH -next v7 2/2] rust: gpu: Add GPU buddy allocator bindings
Date: Thu,  5 Feb 2026 19:41:10 -0500
Message-Id: <20260206004110.1914814-3-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260206004110.1914814-1-joelagnelf@nvidia.com>
References: <20260206004110.1914814-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0432.namprd13.prod.outlook.com
 (2603:10b6:208:2c3::17) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|IA4PR12MB9833:EE_
X-MS-Office365-Filtering-Correlation-Id: ab10493f-4369-40f8-49f4-08de65187330
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?f3PA2ulL+DHlReQgdaqPPSv0Xp9cEpd0yqpB3tqXqE3B8xe5O+AYV7eMtQ+p?=
 =?us-ascii?Q?emLJFBuHoRgfm/ndfg5iWo/oiq0AiP6y7L28ebcMjV9LIRoROkNxOR3ivUmx?=
 =?us-ascii?Q?Y+0KSaEiXJlEIFKKbql+YPbOqc+C509wz8jsSG1ZvaT81xVjoiJM2EVUOxLH?=
 =?us-ascii?Q?yEDYz5hwaeDdsUiuNWMIMOSyO/3Jce1dPG6qauzpmnUbQj7WzAgVWMZxmE2m?=
 =?us-ascii?Q?E4kHkTqs4CJ/vYsqq7j4VZ6Zp7y7Teb4H+XB8L0wkfFm/m2tNN1rRRiE7nhB?=
 =?us-ascii?Q?M5RCXepQ72KiukV0iAdnKKLOq7Blt/zHlS8Ssv3FNw9Tei4GRNF8hRjleXR7?=
 =?us-ascii?Q?omsmKH5IzYr4eBRVzYkMB81vlhtubOvvcBmp2Ijh5qzFkwfBRd94FcE4xYko?=
 =?us-ascii?Q?qGTMbzNQ5WTSTDEa4+w2NpDTXspTPutbP7N8JoU3C17XkOArH4w+S6ow1OIN?=
 =?us-ascii?Q?+vwC3PGQhworhakdHDBq8SKgAXjMu97ACBmACVQZsSdLOj6L4Hxr9xJmbV+u?=
 =?us-ascii?Q?pfCj25E2R4ZnBx18zot1bDC3kk+FfKhpfnYyTTefqS0sTDukwObCTID6Waaq?=
 =?us-ascii?Q?YAO5m/POORIeLS0jO/QDav5CVuB9HP5dFws5eUDFADfdOT28TYi3TgYcONd2?=
 =?us-ascii?Q?o7goFjNQiOlhY//hnWrWckr5dovisgidxsRl9NiSBCUUH0QGCFxsE4Y77Ji/?=
 =?us-ascii?Q?WE8QQNKz88HH2KCOemV7shKyrUEJDlX466YiTvIWB1YXK87mbGw3ahx+CgDJ?=
 =?us-ascii?Q?leiOdYDIfvp9WVCMDzDBm0IBUCMHFGnHLLKt2Y1F5QpVkvINJldy/ktpw8UK?=
 =?us-ascii?Q?ADWZ8DX+5M9aASkdd+FMaTTe3L2yS/SQPkkYEWuuY4DSaVk7H3o7zXOAG9fW?=
 =?us-ascii?Q?mA3hpdEa8ZkvS9Qi44L6Alv7Gw5JyVHJWY+FHfF05Ij28OvlAqK+zTWOHLNy?=
 =?us-ascii?Q?YcNPQ5Qwqbyh/n4QqcUx4JjmGyqs1sGw8XvNnibDXF2P9H4GG55sOuum9NJk?=
 =?us-ascii?Q?+9bzWgWfzCtlKK4vQYuUpXjN3gws1hzmraW6MufCqXB3TjNLbt8SWOYJW6xT?=
 =?us-ascii?Q?DUUPTG1uVvxnrF1GpxO4jJFEjJBPgQE1dBoAK0K7s0/VZ6WyMx5fBuvgEIIW?=
 =?us-ascii?Q?6W/tRLUXnavdQDBfiPNMWySk6vLA8PsxNPy8RBoLBdEBJBQgO/wMyXOU1U8u?=
 =?us-ascii?Q?2nSXklm01IQwcVMZrJo2F6sVSsO4UIIT23TofBM3eNwTw/DEskDNBNFlBu2d?=
 =?us-ascii?Q?KEfRuzfDRh7k8vW14/LlJvekSu9h01UX35RGR+qZW9F1QpZk6uAv0+CjX4N+?=
 =?us-ascii?Q?wRrtQ6yziLNdUttN3Z6bToUO4OjyPGleQlOFnrU72IaBtQwyCoYSFAr0IpWr?=
 =?us-ascii?Q?lNcEH6lJGlqaI7Eh6nTytNxFWP9mZ8+j6surPeqrB0ni/qyqt8tvR+ZoLdN2?=
 =?us-ascii?Q?pHYAb47cga3o4Vl26y9GaTsv5bkULSkN6b8n9dmfUCPXPW+/+LEhihXGtneW?=
 =?us-ascii?Q?z2HnUAjqN6aaw+f3uvc+83MiMs6ms48VOxlwbLJahzZ34lnphrKp45dorj85?=
 =?us-ascii?Q?g9z2HG7NFTPoX8ZpvDo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?o5iL0zdUOGfcNhmXqdrbeEsXaRTisixkPAtPZXQPxP31Xy6lpi9Q4xFOhPkm?=
 =?us-ascii?Q?3HACMzZWCyNncOKtEjylfUgXekxmZdF8w5YytGGJ8JI/OJAY19yC58HytftK?=
 =?us-ascii?Q?5ipWAJV3MdPw/dyqnJ4VzUoKQtd3K591eQ93/4MhSudXPFs+zNatYZuLJYJU?=
 =?us-ascii?Q?vtJkzdSQMXXQ7tG+7xtSUtRTpfZLcSMCi7uzene03EDytJk7ycau5hN3BO6j?=
 =?us-ascii?Q?/zy7SSsK3cymYlp42vcVUZYVcOLzb9eN3zctXL7ujYfXeE37qzeCEN6E3scz?=
 =?us-ascii?Q?Yxh+tP92SwudWReXbEBeivoHjlx1MlB6gGxX35mqA9GcM1lBjbeoNWZu2NLE?=
 =?us-ascii?Q?41m1HGrCla/a3yIZAEINCEL9uz6Q1dccBrQsQ+dzTEXRKyCkrSjCN5cka6Xk?=
 =?us-ascii?Q?tU04sbUtMaXF5esFr6UXZhusxY2s17qm6YMICdNtvKhhq1QKbn8B8c+nx7ep?=
 =?us-ascii?Q?bi9The3Q8bl4Lvd2o0wknKRCw8EqJcsJTOQpSuEtE6k+aNuO53ghVf0UaK9d?=
 =?us-ascii?Q?E/f4aM+sE8omD4Hw//E6umKmi9417J+0d5LbyAtRb85rrXdn3rp/8KjRk8+1?=
 =?us-ascii?Q?ryvZpJHHxZC4YGE5L/9nGPaf01RnBWBpovf2SOneHBkrpkQ84AfBdda54IHq?=
 =?us-ascii?Q?yxFEZEYkJ6rGGCLs81z+Oz/2m8QJfEO5kDRf6XipFBeOc2RK4FCQ/HI8d/rP?=
 =?us-ascii?Q?9G8fZTgYuDFr7e5IFEjtnCitkk5qJH0SALSCzjVzote/v7A9xqKdx1OgrBRg?=
 =?us-ascii?Q?ekwvW4X/BkFSUneIccpZN6CrHXEHh8wbQic5B0RuAPNpap2xiGaER83VbDMc?=
 =?us-ascii?Q?CzOgjciRaiEKxJDNj8gscFzyUk/X+T0C6A6nSl7WDaAHhJ5KzSvPo6ULIjnQ?=
 =?us-ascii?Q?nGZNToZcs7AWbwAfTpFTRnfeS3Mq1YEFF7LuBQyqmtweEuApBLShpZrPX2gn?=
 =?us-ascii?Q?Ej3Y7+bOY4WFRaRBLqBJLQ5eVoaayzZj4nB5vuhRp7ZDUtHFfZmXN6Fo3iTc?=
 =?us-ascii?Q?DrHcNT7e8ISixKbTaMdpoKm2FpHBSBa7PL3mfxGaCppNVmJjIg6NOHXIaBHF?=
 =?us-ascii?Q?f3jmKOkmKGDkXmk1eqxjx6b1ATVOoQUZIvav0ZuABh8sLQg/VnhyvIePRfBy?=
 =?us-ascii?Q?m9fFnjGwLgE5EgGv2L+pwezp4Fosf4gOiZ7n32Iktp9SgOoTZ6rxbCIApNeR?=
 =?us-ascii?Q?/jubj7PkWIaFHPKEnNiacch5WPbV9jwNyAhSV5WWZhdLFCZufDRI8VT1b7uo?=
 =?us-ascii?Q?spfwTUxEg64eKxTHRGRlCpG1vWaYne578QPzyFDavrzbbAm5YYhmYxlFCh9Z?=
 =?us-ascii?Q?PFYM382XBRU4c+HDcEyoIvwuQEVfNJA9uDFkCQtJVsldKF5z6wSgY4mvjDMc?=
 =?us-ascii?Q?bkKPqMqBjrmtsNTlLUZykNKJiVBLkYu/GC3vLE9Covs+hb4zUyxMxPGgMtq3?=
 =?us-ascii?Q?b2QL11ao+5Tb4Uw9dr7DaAr+yOlekpeLtzBDNDrRCmz2Q+pbZtBMUwKNLUha?=
 =?us-ascii?Q?tumx/tcbfVU/TbUkZRApFLCUayIC+DIau3fz1EVU+lzEpTOq/R/Fur614+Do?=
 =?us-ascii?Q?gGKXz9UOFXwACXHhGzsE6L626UAxsUeXrLvrzDHGhWfEXJNH96QSrunTuh4f?=
 =?us-ascii?Q?x8nc2kPm4HJ0D/NiGe/uM43SmfThc7DHrwS3eB9wUG9kw4AWZg6SeWDh08+7?=
 =?us-ascii?Q?GVCdV81hggRCL5Hl23RWNf1slHF9TxvfJOc+3w+A0odbFesgzuCRFcWrcwrf?=
 =?us-ascii?Q?xo8Wq0xWlQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab10493f-4369-40f8-49f4-08de65187330
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 00:41:22.1340 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qzsW5XQemijHdR294IxJf4wNqU6jgWCtl2q/BLXlhKiAocD1YDsvv0O1aXQvJOtItjxYFDyvKc6CgibQBJXBaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR12MB9833
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
	RCPT_COUNT_GT_50(0.00)[51];
	TAGGED_RCPT(0.00)[dri-devel];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,nvidia.com:email,Nvidia.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 88D06F8B8A
X-Rspamd-Action: no action

Add safe Rust abstractions over the Linux kernel's GPU buddy
allocator for physical memory management. The GPU buddy allocator
implements a binary buddy system useful for GPU physical memory
allocation. nova-core will use it for physical memory allocation.

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 rust/bindings/bindings_helper.h |  11 +
 rust/helpers/gpu.c              |  23 ++
 rust/helpers/helpers.c          |   1 +
 rust/kernel/gpu/buddy.rs        | 530 ++++++++++++++++++++++++++++++++
 rust/kernel/gpu/mod.rs          |   5 +
 rust/kernel/lib.rs              |   2 +
 6 files changed, 572 insertions(+)
 create mode 100644 rust/helpers/gpu.c
 create mode 100644 rust/kernel/gpu/buddy.rs
 create mode 100644 rust/kernel/gpu/mod.rs

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index 083cc44aa952..dbb765a9fdbd 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -29,6 +29,7 @@
 #include <linux/hrtimer_types.h>
 
 #include <linux/acpi.h>
+#include <linux/gpu_buddy.h>
 #include <drm/drm_device.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_file.h>
@@ -146,6 +147,16 @@ const vm_flags_t RUST_CONST_HELPER_VM_MIXEDMAP = VM_MIXEDMAP;
 const vm_flags_t RUST_CONST_HELPER_VM_HUGEPAGE = VM_HUGEPAGE;
 const vm_flags_t RUST_CONST_HELPER_VM_NOHUGEPAGE = VM_NOHUGEPAGE;
 
+#if IS_ENABLED(CONFIG_GPU_BUDDY)
+const unsigned long RUST_CONST_HELPER_GPU_BUDDY_RANGE_ALLOCATION = GPU_BUDDY_RANGE_ALLOCATION;
+const unsigned long RUST_CONST_HELPER_GPU_BUDDY_TOPDOWN_ALLOCATION = GPU_BUDDY_TOPDOWN_ALLOCATION;
+const unsigned long RUST_CONST_HELPER_GPU_BUDDY_CONTIGUOUS_ALLOCATION =
+								GPU_BUDDY_CONTIGUOUS_ALLOCATION;
+const unsigned long RUST_CONST_HELPER_GPU_BUDDY_CLEAR_ALLOCATION = GPU_BUDDY_CLEAR_ALLOCATION;
+const unsigned long RUST_CONST_HELPER_GPU_BUDDY_CLEARED = GPU_BUDDY_CLEARED;
+const unsigned long RUST_CONST_HELPER_GPU_BUDDY_TRIM_DISABLE = GPU_BUDDY_TRIM_DISABLE;
+#endif
+
 #if IS_ENABLED(CONFIG_ANDROID_BINDER_IPC_RUST)
 #include "../../drivers/android/binder/rust_binder.h"
 #include "../../drivers/android/binder/rust_binder_events.h"
diff --git a/rust/helpers/gpu.c b/rust/helpers/gpu.c
new file mode 100644
index 000000000000..38b1a4e6bef8
--- /dev/null
+++ b/rust/helpers/gpu.c
@@ -0,0 +1,23 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/gpu_buddy.h>
+
+#ifdef CONFIG_GPU_BUDDY
+
+__rust_helper u64 rust_helper_gpu_buddy_block_offset(const struct gpu_buddy_block *block)
+{
+	return gpu_buddy_block_offset(block);
+}
+
+__rust_helper unsigned int rust_helper_gpu_buddy_block_order(struct gpu_buddy_block *block)
+{
+	return gpu_buddy_block_order(block);
+}
+
+__rust_helper u64 rust_helper_gpu_buddy_block_size(struct gpu_buddy *mm,
+						   struct gpu_buddy_block *block)
+{
+	return gpu_buddy_block_size(mm, block);
+}
+
+#endif /* CONFIG_GPU_BUDDY */
diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
index 724fcb8240ac..a53929ce52a3 100644
--- a/rust/helpers/helpers.c
+++ b/rust/helpers/helpers.c
@@ -32,6 +32,7 @@
 #include "err.c"
 #include "irq.c"
 #include "fs.c"
+#include "gpu.c"
 #include "io.c"
 #include "jump_label.c"
 #include "kunit.c"
diff --git a/rust/kernel/gpu/buddy.rs b/rust/kernel/gpu/buddy.rs
new file mode 100644
index 000000000000..00290ce53aeb
--- /dev/null
+++ b/rust/kernel/gpu/buddy.rs
@@ -0,0 +1,530 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! GPU buddy allocator bindings.
+//!
+//! C header: [`include/linux/gpu_buddy.h`](srctree/include/linux/gpu_buddy.h)
+//!
+//! This module provides Rust abstractions over the Linux kernel's GPU buddy
+//! allocator, which implements a binary buddy memory allocator.
+//!
+//! The buddy allocator manages a contiguous address space and allocates blocks
+//! in power-of-two sizes, useful for GPU physical memory management.
+//!
+//! # Examples
+//!
+//! ```
+//! use kernel::{
+//!     gpu::buddy::{BuddyFlags, GpuBuddy, GpuBuddyAllocParams, GpuBuddyParams},
+//!     prelude::*,
+//!     sizes::*, //
+//! };
+//!
+//! // Create a 1GB buddy allocator with 4KB minimum chunk size.
+//! let buddy = GpuBuddy::new(&GpuBuddyParams {
+//!     base_offset_bytes: 0,
+//!     physical_memory_size_bytes: SZ_1G as u64,
+//!     chunk_size_bytes: SZ_4K as u64,
+//! })?;
+//!
+//! // Verify initial state.
+//! assert_eq!(buddy.size(), SZ_1G as u64);
+//! assert_eq!(buddy.chunk_size(), SZ_4K as u64);
+//! let initial_free = buddy.free_memory_bytes();
+//!
+//! // Base allocation params - mutated between calls for field overrides.
+//! let mut params = GpuBuddyAllocParams {
+//!     start_range_address: 0,
+//!     end_range_address: 0,   // Entire range.
+//!     size_bytes: SZ_16M as u64,
+//!     min_block_size_bytes: SZ_16M as u64,
+//!     buddy_flags: BuddyFlags::try_new(BuddyFlags::RANGE_ALLOCATION)?,
+//! };
+//!
+//! // Test top-down allocation (allocates from highest addresses).
+//! params.buddy_flags = BuddyFlags::try_new(BuddyFlags::TOPDOWN_ALLOCATION)?;
+//! let topdown = buddy.alloc_blocks(&params)?;
+//! assert_eq!(buddy.free_memory_bytes(), initial_free - SZ_16M as u64);
+//!
+//! for block in topdown.iter() {
+//!     assert_eq!(block.offset(), (SZ_1G - SZ_16M) as u64);
+//!     assert_eq!(block.order(), 12); // 2^12 pages
+//!     assert_eq!(block.size(), SZ_16M as u64);
+//! }
+//! drop(topdown);
+//! assert_eq!(buddy.free_memory_bytes(), initial_free);
+//!
+//! // Allocate 16MB - should result in a single 16MB block at offset 0.
+//! params.buddy_flags = BuddyFlags::try_new(BuddyFlags::RANGE_ALLOCATION)?;
+//! let allocated = buddy.alloc_blocks(&params)?;
+//! assert_eq!(buddy.free_memory_bytes(), initial_free - SZ_16M as u64);
+//!
+//! for block in allocated.iter() {
+//!     assert_eq!(block.offset(), 0);
+//!     assert_eq!(block.order(), 12); // 2^12 pages
+//!     assert_eq!(block.size(), SZ_16M as u64);
+//! }
+//! drop(allocated);
+//! assert_eq!(buddy.free_memory_bytes(), initial_free);
+//!
+//! // Test non-contiguous allocation with fragmented memory.
+//! // Create fragmentation by allocating 4MB blocks at [0,4M) and [8M,12M).
+//! params.end_range_address = SZ_4M as u64;
+//! params.size_bytes = SZ_4M as u64;
+//! params.min_block_size_bytes = SZ_4M as u64;
+//! let frag1 = buddy.alloc_blocks(&params)?;
+//! assert_eq!(buddy.free_memory_bytes(), initial_free - SZ_4M as u64);
+//!
+//! params.start_range_address = SZ_8M as u64;
+//! params.end_range_address = (SZ_8M + SZ_4M) as u64;
+//! let frag2 = buddy.alloc_blocks(&params)?;
+//! assert_eq!(buddy.free_memory_bytes(), initial_free - SZ_8M as u64);
+//!
+//! // Allocate 8MB without CONTIGUOUS - should return 2 blocks from the holes.
+//! params.start_range_address = 0;
+//! params.end_range_address = SZ_16M as u64;
+//! params.size_bytes = SZ_8M as u64;
+//! let fragmented = buddy.alloc_blocks(&params)?;
+//! assert_eq!(buddy.free_memory_bytes(), initial_free - (SZ_16M) as u64);
+//!
+//! let (mut count, mut total) = (0u32, 0u64);
+//! for block in fragmented.iter() {
+//!     // The 8MB allocation should return 2 blocks, each 4MB.
+//!     assert_eq!(block.size(), SZ_4M as u64);
+//!     total += block.size();
+//!     count += 1;
+//! }
+//! assert_eq!(total, SZ_8M as u64);
+//! assert_eq!(count, 2);
+//! drop(fragmented);
+//! drop(frag2);
+//! drop(frag1);
+//! assert_eq!(buddy.free_memory_bytes(), initial_free);
+//!
+//! // Test CONTIGUOUS failure when only fragmented space available.
+//! // Create a small buddy allocator with only 16MB of memory.
+//! let small = GpuBuddy::new(&GpuBuddyParams {
+//!     base_offset_bytes: 0,
+//!     physical_memory_size_bytes: SZ_16M as u64,
+//!     chunk_size_bytes: SZ_4K as u64,
+//! })?;
+//!
+//! // Allocate 4MB blocks at [0,4M) and [8M,12M) to create fragmented memory.
+//! params.start_range_address = 0;
+//! params.end_range_address = SZ_4M as u64;
+//! params.size_bytes = SZ_4M as u64;
+//! let hole1 = small.alloc_blocks(&params)?;
+//!
+//! params.start_range_address = SZ_8M as u64;
+//! params.end_range_address = (SZ_8M + SZ_4M) as u64;
+//! let hole2 = small.alloc_blocks(&params)?;
+//!
+//! // 8MB contiguous should fail - only two non-contiguous 4MB holes exist.
+//! params.start_range_address = 0;
+//! params.end_range_address = 0;
+//! params.size_bytes = SZ_8M as u64;
+//! params.buddy_flags = BuddyFlags::try_new(BuddyFlags::CONTIGUOUS_ALLOCATION)?;
+//! let result = small.alloc_blocks(&params);
+//! assert!(result.is_err());
+//! drop(hole2);
+//! drop(hole1);
+//!
+//! # Ok::<(), Error>(())
+//! ```
+
+use crate::{
+    bindings,
+    clist::CListHead,
+    clist_create,
+    error::to_result,
+    new_mutex,
+    prelude::*,
+    sync::{
+        lock::mutex::MutexGuard,
+        Arc,
+        Mutex, //
+    },
+    types::Opaque,
+};
+
+/// Flags for GPU buddy allocator operations.
+///
+/// These flags control the allocation behavior of the buddy allocator.
+#[derive(Clone, Copy, Default, PartialEq, Eq)]
+pub struct BuddyFlags(usize);
+
+impl BuddyFlags {
+    /// Range-based allocation from start to end addresses.
+    pub const RANGE_ALLOCATION: usize = bindings::GPU_BUDDY_RANGE_ALLOCATION;
+
+    /// Allocate from top of address space downward.
+    pub const TOPDOWN_ALLOCATION: usize = bindings::GPU_BUDDY_TOPDOWN_ALLOCATION;
+
+    /// Allocate physically contiguous blocks.
+    pub const CONTIGUOUS_ALLOCATION: usize = bindings::GPU_BUDDY_CONTIGUOUS_ALLOCATION;
+
+    /// Request allocation from the cleared (zeroed) memory. The zero'ing is not
+    /// done by the allocator, but by the caller before freeing old blocks.
+    pub const CLEAR_ALLOCATION: usize = bindings::GPU_BUDDY_CLEAR_ALLOCATION;
+
+    /// Disable trimming of partially used blocks.
+    pub const TRIM_DISABLE: usize = bindings::GPU_BUDDY_TRIM_DISABLE;
+
+    /// Mark blocks as cleared (zeroed) when freeing. When set during free,
+    /// indicates that the caller has already zeroed the memory.
+    pub const CLEARED: usize = bindings::GPU_BUDDY_CLEARED;
+
+    /// Create [`BuddyFlags`] from a raw value with validation.
+    ///
+    /// Use `|` operator to combine flags if needed, before calling this method.
+    pub fn try_new(flags: usize) -> Result<Self> {
+        // Flags must not exceed u32::MAX to satisfy the GPU buddy allocator C API.
+        if flags > u32::MAX as usize {
+            return Err(EINVAL);
+        }
+
+        // `TOPDOWN_ALLOCATION` only works without `RANGE_ALLOCATION`. When both are
+        // set, `TOPDOWN_ALLOCATION` is silently ignored by the allocator. Reject this.
+        if (flags & Self::RANGE_ALLOCATION) != 0 && (flags & Self::TOPDOWN_ALLOCATION) != 0 {
+            return Err(EINVAL);
+        }
+
+        Ok(Self(flags))
+    }
+
+    /// Get raw value of the flags.
+    pub(crate) fn as_raw(self) -> usize {
+        self.0
+    }
+}
+
+/// Parameters for creating a GPU buddy allocator.
+pub struct GpuBuddyParams {
+    /// Base offset in bytes where the managed memory region starts.
+    /// Allocations will be offset by this value.
+    pub base_offset_bytes: u64,
+    /// Total physical memory size managed by the allocator in bytes.
+    pub physical_memory_size_bytes: u64,
+    /// Minimum allocation unit / chunk size in bytes, must be >= 4KB.
+    pub chunk_size_bytes: u64,
+}
+
+/// Parameters for allocating blocks from a GPU buddy allocator.
+pub struct GpuBuddyAllocParams {
+    /// Start of allocation range in bytes. Use 0 for beginning.
+    pub start_range_address: u64,
+    /// End of allocation range in bytes. Use 0 for entire range.
+    pub end_range_address: u64,
+    /// Total size to allocate in bytes.
+    pub size_bytes: u64,
+    /// Minimum block size for fragmented allocations in bytes.
+    pub min_block_size_bytes: u64,
+    /// Buddy allocator behavior flags.
+    pub buddy_flags: BuddyFlags,
+}
+
+/// Inner structure holding the actual buddy allocator.
+///
+/// # Synchronization
+///
+/// The C `gpu_buddy` API requires synchronization (see `include/linux/gpu_buddy.h`).
+/// The internal [`GpuBuddyGuard`] ensures that the lock is held for all
+/// allocator and free operations, preventing races between concurrent allocations
+/// and the freeing that occurs when [`AllocatedBlocks`] is dropped.
+///
+/// # Invariants
+///
+/// The inner [`Opaque`] contains a valid, initialized buddy allocator.
+#[pin_data(PinnedDrop)]
+struct GpuBuddyInner {
+    #[pin]
+    inner: Opaque<bindings::gpu_buddy>,
+    #[pin]
+    lock: Mutex<()>,
+    /// Base offset for all allocations (does not change after init).
+    base_offset: u64,
+    /// Cached chunk size (does not change after init).
+    chunk_size: u64,
+    /// Cached total size (does not change after init).
+    size: u64,
+}
+
+impl GpuBuddyInner {
+    /// Create a pin-initializer for the buddy allocator.
+    fn new(params: &GpuBuddyParams) -> impl PinInit<Self, Error> {
+        let base_offset = params.base_offset_bytes;
+        let size = params.physical_memory_size_bytes;
+        let chunk_size = params.chunk_size_bytes;
+
+        try_pin_init!(Self {
+            inner <- Opaque::try_ffi_init(|ptr| {
+                // SAFETY: ptr points to valid uninitialized memory from the pin-init
+                // infrastructure. gpu_buddy_init will initialize the structure.
+                to_result(unsafe { bindings::gpu_buddy_init(ptr, size, chunk_size) })
+            }),
+            lock <- new_mutex!(()),
+            base_offset: base_offset,
+            chunk_size: chunk_size,
+            size: size,
+        })
+    }
+
+    /// Lock the mutex and return a guard for accessing the allocator.
+    fn lock(&self) -> GpuBuddyGuard<'_> {
+        GpuBuddyGuard {
+            inner: self,
+            _guard: self.lock.lock(),
+        }
+    }
+}
+
+#[pinned_drop]
+impl PinnedDrop for GpuBuddyInner {
+    fn drop(self: Pin<&mut Self>) {
+        let guard = self.lock();
+
+        // SAFETY: guard provides exclusive access to the allocator.
+        unsafe {
+            bindings::gpu_buddy_fini(guard.as_raw());
+        }
+    }
+}
+
+// SAFETY: [`GpuBuddyInner`] can be sent between threads.
+unsafe impl Send for GpuBuddyInner {}
+
+// SAFETY: [`GpuBuddyInner`] is `Sync` because the internal [`GpuBuddyGuard`]
+// serializes all access to the C allocator, preventing data races.
+unsafe impl Sync for GpuBuddyInner {}
+
+/// Guard that proves the lock is held, enabling access to the allocator.
+///
+/// # Invariants
+///
+/// The inner `_guard` holds the lock for the duration of this guard's lifetime.
+pub(crate) struct GpuBuddyGuard<'a> {
+    inner: &'a GpuBuddyInner,
+    _guard: MutexGuard<'a, ()>,
+}
+
+impl GpuBuddyGuard<'_> {
+    /// Get a raw pointer to the underlying C `gpu_buddy` structure.
+    fn as_raw(&self) -> *mut bindings::gpu_buddy {
+        self.inner.inner.get()
+    }
+}
+
+/// GPU buddy allocator instance.
+///
+/// This structure wraps the C `gpu_buddy` allocator using reference counting.
+/// The allocator is automatically cleaned up when all references are dropped.
+///
+/// # Invariants
+///
+/// The inner [`Arc`] points to a valid, initialized GPU buddy allocator.
+pub struct GpuBuddy(Arc<GpuBuddyInner>);
+
+impl GpuBuddy {
+    /// Create a new buddy allocator.
+    ///
+    /// Creates a buddy allocator that manages a contiguous address space of the given
+    /// size, with the specified minimum allocation unit (chunk_size must be at least 4KB).
+    pub fn new(params: &GpuBuddyParams) -> Result<Self> {
+        Ok(Self(Arc::pin_init(
+            GpuBuddyInner::new(params),
+            GFP_KERNEL,
+        )?))
+    }
+
+    /// Get the base offset for allocations.
+    pub fn base_offset(&self) -> u64 {
+        self.0.base_offset
+    }
+
+    /// Get the chunk size (minimum allocation unit).
+    pub fn chunk_size(&self) -> u64 {
+        self.0.chunk_size
+    }
+
+    /// Get the total managed size.
+    pub fn size(&self) -> u64 {
+        self.0.size
+    }
+
+    /// Get the available (free) memory in bytes.
+    pub fn free_memory_bytes(&self) -> u64 {
+        let guard = self.0.lock();
+        // SAFETY: guard provides exclusive access to the allocator.
+        unsafe { (*guard.as_raw()).avail }
+    }
+
+    /// Allocate blocks from the buddy allocator.
+    ///
+    /// Returns an [`Arc<AllocatedBlocks>`] structure that owns the allocated blocks
+    /// and automatically frees them when all references are dropped.
+    ///
+    /// Takes `&self` instead of `&mut self` because the internal [`Mutex`] provides
+    /// synchronization - no external `&mut` exclusivity needed.
+    pub fn alloc_blocks(&self, params: &GpuBuddyAllocParams) -> Result<Arc<AllocatedBlocks>> {
+        let buddy_arc = Arc::clone(&self.0);
+
+        // Create pin-initializer that initializes list and allocates blocks.
+        let init = try_pin_init!(AllocatedBlocks {
+            buddy: Arc::clone(&buddy_arc),
+            list <- CListHead::new(),
+            flags: params.buddy_flags,
+            _: {
+                // Lock while allocating to serialize with concurrent frees.
+                let guard = buddy.lock();
+
+                // SAFETY: `guard` provides exclusive access to the buddy allocator.
+                to_result(unsafe {
+                    bindings::gpu_buddy_alloc_blocks(
+                        guard.as_raw(),
+                        params.start_range_address,
+                        params.end_range_address,
+                        params.size_bytes,
+                        params.min_block_size_bytes,
+                        list.as_raw(),
+                        params.buddy_flags.as_raw(),
+                    )
+                })?
+            }
+        });
+
+        Arc::pin_init(init, GFP_KERNEL)
+    }
+}
+
+/// Allocated blocks from the buddy allocator with automatic cleanup.
+///
+/// This structure owns a list of allocated blocks and ensures they are
+/// automatically freed when dropped. Use `iter()` to iterate over all
+/// allocated [`Block`] structures.
+///
+/// # Invariants
+///
+/// - `list` is an initialized, valid list head containing allocated blocks.
+/// - `buddy` references a valid [`GpuBuddyInner`].
+#[pin_data(PinnedDrop)]
+pub struct AllocatedBlocks {
+    #[pin]
+    list: CListHead,
+    buddy: Arc<GpuBuddyInner>,
+    flags: BuddyFlags,
+}
+
+impl AllocatedBlocks {
+    /// Check if the block list is empty.
+    pub fn is_empty(&self) -> bool {
+        // An empty list head points to itself.
+        !self.list.is_linked()
+    }
+
+    /// Iterate over allocated blocks.
+    ///
+    /// Returns an iterator yielding [`AllocatedBlock`] references. The blocks
+    /// are only valid for the duration of the borrow of `self`.
+    pub fn iter(&self) -> impl Iterator<Item = AllocatedBlock<'_>> + '_ {
+        // SAFETY: list contains gpu_buddy_block items linked via __bindgen_anon_1.link.
+        let clist = unsafe {
+            clist_create!(
+                self.list.as_raw(),
+                Block,
+                bindings::gpu_buddy_block,
+                __bindgen_anon_1.link
+            )
+        };
+
+        clist
+            .iter()
+            .map(|block| AllocatedBlock { block, alloc: self })
+    }
+}
+
+#[pinned_drop]
+impl PinnedDrop for AllocatedBlocks {
+    fn drop(self: Pin<&mut Self>) {
+        let guard = self.buddy.lock();
+
+        // SAFETY:
+        // - list is valid per the type's invariants.
+        // - guard provides exclusive access to the allocator.
+        // CAST: BuddyFlags were validated to fit in u32 at construction.
+        unsafe {
+            bindings::gpu_buddy_free_list(
+                guard.as_raw(),
+                self.list.as_raw(),
+                self.flags.as_raw() as u32,
+            );
+        }
+    }
+}
+
+/// A GPU buddy block.
+///
+/// Transparent wrapper over C `gpu_buddy_block` structure. This type is returned
+/// as references from [`CListIter`] during iteration over [`AllocatedBlocks`].
+///
+/// # Invariants
+///
+/// The inner [`Opaque`] contains a valid, allocated `gpu_buddy_block`.
+#[repr(transparent)]
+pub struct Block(Opaque<bindings::gpu_buddy_block>);
+
+impl Block {
+    /// Get a raw pointer to the underlying C block.
+    fn as_raw(&self) -> *mut bindings::gpu_buddy_block {
+        self.0.get()
+    }
+
+    /// Get the block's offset in the address space.
+    pub(crate) fn offset(&self) -> u64 {
+        // SAFETY: self.as_raw() is valid per the type's invariants.
+        unsafe { bindings::gpu_buddy_block_offset(self.as_raw()) }
+    }
+
+    /// Get the block order.
+    pub(crate) fn order(&self) -> u32 {
+        // SAFETY: self.as_raw() is valid per the type's invariants.
+        unsafe { bindings::gpu_buddy_block_order(self.as_raw()) }
+    }
+}
+
+// SAFETY: `Block` is a transparent wrapper over `gpu_buddy_block` which is not
+// modified after allocation. It can be safely sent between threads.
+unsafe impl Send for Block {}
+
+// SAFETY: `Block` is a transparent wrapper over `gpu_buddy_block` which is not
+// modified after allocation. It can be safely shared among threads.
+unsafe impl Sync for Block {}
+
+/// An allocated block with access to the allocation list.
+///
+/// # Invariants
+///
+/// - `block` is a valid reference to an allocated [`Block`].
+/// - `alloc` is a valid reference to the [`AllocatedBlocks`] that owns this block.
+pub struct AllocatedBlock<'a> {
+    block: &'a Block,
+    alloc: &'a AllocatedBlocks,
+}
+
+impl AllocatedBlock<'_> {
+    /// Get the block's offset in the address space.
+    ///
+    /// Returns the absolute offset including the allocator's base offset.
+    /// This is the actual address to use for accessing the allocated memory.
+    pub fn offset(&self) -> u64 {
+        self.alloc.buddy.base_offset + self.block.offset()
+    }
+
+    /// Get the block order (size = chunk_size << order).
+    pub fn order(&self) -> u32 {
+        self.block.order()
+    }
+
+    /// Get the block's size in bytes.
+    pub fn size(&self) -> u64 {
+        self.alloc.buddy.chunk_size << self.block.order()
+    }
+}
diff --git a/rust/kernel/gpu/mod.rs b/rust/kernel/gpu/mod.rs
new file mode 100644
index 000000000000..8f25e6367edc
--- /dev/null
+++ b/rust/kernel/gpu/mod.rs
@@ -0,0 +1,5 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! GPU subsystem abstractions.
+
+pub mod buddy;
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 8439c30f40b5..e30faa5ca8f4 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -99,6 +99,8 @@
 pub mod firmware;
 pub mod fmt;
 pub mod fs;
+#[cfg(CONFIG_GPU_BUDDY)]
+pub mod gpu;
 #[cfg(CONFIG_I2C = "y")]
 pub mod i2c;
 pub mod id_pool;
-- 
2.34.1

