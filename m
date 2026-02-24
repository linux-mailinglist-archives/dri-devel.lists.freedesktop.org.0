Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gFTWNhMsnmn5TgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 23:54:11 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E24418DCDB
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 23:54:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2987310E66F;
	Tue, 24 Feb 2026 22:54:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="FqrAzTA7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011036.outbound.protection.outlook.com [52.101.62.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0B2710E653;
 Tue, 24 Feb 2026 22:54:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P1iD2VAqwHUteTZFzvvGp7r3W7PvyLuH2m243dND3VrDhanIF9lAPTM8SWvTYw2kZKfbcZGpuxSOuGZUPv0xQyg8NmZhHHCAxrYbrfeJ5SUPRJmTeFCcYJKkc+/wzYDWpUwGJY7i17kHaJjqAO2Onf3y9fIQ3aMAG2hINvZr2Bt14qGC3e7xGRgW6TktiD/RzhVuOFnS4D+VmH4hBHBxPdAyTDhcqmMk0LfIbhweFjoLZrr3z3dYCex4ABEVjBUHiENsQZyhEhzeNqmMNdxIN+TldsS+nOVxdWBwUlwRZ9s3IJMWaj+5cE9Eepmv2H2bnTCf3tadVwzxTuOA+7UIIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4S57JpeJs65/3H8jlcBj2YaerLEf2e0KiBqH6rwJzhs=;
 b=Z4EQpfjYCnLwIQOz+L9hMtKsW2avdsHUqE2CUhM3kV1W+joMr8fBRAijgeYK2O4GQgh6tnXy+PIOM5HX/IIEn/bRGKDW6m1Utcq9wxirXjTiqmsGhK6WLtLqFPW4vU9m9CNmb6RHNk5KOMCpu3oqgE5U7Y/SWBn42gAxBk1bjTBrbVRRHqPFJdfmLKKd086UHvq5FzRvSqs2VTWy71xV9gPebnFCnjhE2dhU5NbeH0AQByKt2vfOBb7ebTjBxpRjc8rkrUWQ0TGAK9lQLdNLOPfd0VMqPz8dpMzLMrbWxTpJ8bhKyQR8kGkukM4D4dtnpoOU2Yxuojr82LT+0Uigbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4S57JpeJs65/3H8jlcBj2YaerLEf2e0KiBqH6rwJzhs=;
 b=FqrAzTA70PnMshX3nd+1XWSsk+SAY88wPFjpnVsHG5c1J1/dQ3IR8VuEJw2ezGhWGca7BGK2zAGCWNEwx6Ic5Vg/OzXZeBg3En6SMMKMUd8I3mkTfLxzH7VugFiHb6h0Q5X/ifmE7mBy7YHLDsmindP8LmyQiE7ktVwLCHZfvB86Wkxd9jvF+pk7BE178ChwkH5gL1nDoSOkTWHHM+wMjAuPsWFVDsUZBWK0qh4gJbQtv5ygOkHL5AAZAqiyg0OscKBD8BjTuE2qwYXnR5rnOUShk/3apbAN8T2r8Qnr5EcfaT6m2lPkUCyaG6/dcgC7hFoy6l5ubyxZMAN2x74PYw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 SN7PR12MB6885.namprd12.prod.outlook.com (2603:10b6:806:263::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.21; Tue, 24 Feb 2026 22:53:55 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 22:53:55 +0000
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
Subject: [PATCH v8 14/25] gpu: nova-core: mm: Add MMU v3 page table types
Date: Tue, 24 Feb 2026 17:53:12 -0500
Message-Id: <20260224225323.3312204-15-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260224225323.3312204-1-joelagnelf@nvidia.com>
References: <20260224225323.3312204-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL0PR01CA0001.prod.exchangelabs.com (2603:10b6:208:71::14)
 To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|SN7PR12MB6885:EE_
X-MS-Office365-Filtering-Correlation-Id: 962f0cd9-a1de-4b32-38be-08de73f795fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?uIRRznhFVUlnDjlsD3dwMSr5QibDKITAMOa7sYukzwq5ZAR+n0JTeS0YocXw?=
 =?us-ascii?Q?oFyrEYy+x2cYTC46hCQu4xsK3prPbPGVUbWLANCg7+uWKcsEs4lrd/DUkBHV?=
 =?us-ascii?Q?bujzWv95rP78TSd4luxrgwRY3hHB8tq2NJVFFG7SXwxSH2R8RgWLRA3bkLve?=
 =?us-ascii?Q?HH2Gsy8I+s5KianxZ34F0kwD2CgpZlhmdE3viWCqqMTOG5CA/7C4HViXlK0k?=
 =?us-ascii?Q?z4WOQGTAFr/NvCG2Kihvsq1Ui/F/Ks5WSqA8FFDQebc0TMcdwyEOee6ldPa8?=
 =?us-ascii?Q?JIDHGBIcupDeVfNjBmY8MisZnqE4F8xXv3gyiPnZ4FY4Jwtqx5hyOg9qTXwv?=
 =?us-ascii?Q?9bZLutDcm7HL5G39022LW09oqmJi5+E5FxvjL0+KbND4N178onjNHz8ePcbJ?=
 =?us-ascii?Q?UBNpAa6fQCdN4elTt94Zp0lbIub2qQ8IzkRL6phhJy3CKgsm5tk3Bli27ose?=
 =?us-ascii?Q?2tdh6RRGQtRb0J4gMGb1GyieyJ2UguItCeE/K1zLDixvl/Pkp04rN2377S3n?=
 =?us-ascii?Q?KaC1x4I7pjuHVxnHUDbJtOWHkEvdPdIJ7vZbq2p/SXdYUvO7TUKgzGfHnHbK?=
 =?us-ascii?Q?9X52Dg2Fp+lkZCCso1TrrnUt2HrAw2m4Biqnntx19xYBzx9WRQj8wepcbHSy?=
 =?us-ascii?Q?WQym+TGcJvYPK4hW5jA/+jbFMPjCxkJ6sQoLUzb7TLeNndR+VXcvMt0+kjvj?=
 =?us-ascii?Q?G2aq69vc6gvthiU0a5yzeagMMJtiVNNmHhPq8DW19lLCGdz8yaz+kd0Kv5/d?=
 =?us-ascii?Q?Y4DoB09trhKfuzVHRiiix+pH3pYqeaBDm+3SBmmHRv5Ls2N9ZTAj7IacugNX?=
 =?us-ascii?Q?af9BQQRcuazkwdnV9lG/Eo9c60cFPybYvW6fQUDm4WA0X229h3ea30uVoDsf?=
 =?us-ascii?Q?oWMB8bMkofB+gQ4n0hRMQfkS7dyWp2dT5uYuDLwLuPahNV97KUnF1PeZB9n5?=
 =?us-ascii?Q?ZMspqw7tzBfgqqllkFM6FfRCoo6A3NX+cmBEnxAUPkCI2OL0zBECfDzYaLXO?=
 =?us-ascii?Q?t0FpfuP7Nb4g5wVuUodut5ccNQTelgAZiHWGqcIAf5T8rUf383VvGID05ZtN?=
 =?us-ascii?Q?twcQt8PrAx5/iIVbnGrak5ihF7pCLm+YPQG6BCIk2bMbQFqO+KkMn6sw90jb?=
 =?us-ascii?Q?X8PzDbfR/lsUddfm8zXYEqW6jQl/5W9mXzvQYR0Pxn91UWdRMTBEH3cKlOVV?=
 =?us-ascii?Q?D5dJMPgE352F6rIJLvIsQxl/wgcGjjNTlg5lZwjDji/ULuar/yPZsjnz4zyt?=
 =?us-ascii?Q?JczESyyzPRIz8PCSQWRe/Fsu4kSi7PqKqxrZRTziDeEA5hPSQG14xnJ1IzMg?=
 =?us-ascii?Q?wn969PI6UGRsq4jzaw4bRPm1AydMlSwS/AMFWC8sEv//2qVlX4bbRo8EH/eE?=
 =?us-ascii?Q?w8Uvue77SJfaWGzlMDbiHiHbpc/Uxtxwib/J/EGrQ9oRjt/kTszvOVUtX+fS?=
 =?us-ascii?Q?jWzXYj81mWu4aInw0mNdcfTytu/jTm7Q11TmZQ/xxjq+1QGG+xg2FI8pkOQG?=
 =?us-ascii?Q?Rc/v+9cO3JRo+OdEyhNJFZs4Lh0Sb7duRD4Qs4WfjK0ZTQJMQpwJnsl6YRBb?=
 =?us-ascii?Q?muDuY/B9/A167NRXyoM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dhFC2qNd6+n8PDrDMdbTK1+HWOgHGCE8drpCPfrCz02F7E0vNZ604xGOKiwO?=
 =?us-ascii?Q?c8A6JvUP6g50piV9EtWpqW5X8UbViAUJbQhP9rNZGd+nE93pz0+V8eS5e2i8?=
 =?us-ascii?Q?fAJOneBLZ1MzcooO9YnCT4eW22xIRjtlQOJcBnVdnKg8xvuCNQLBYx5uQXoR?=
 =?us-ascii?Q?oFOFZWAVpItgcmeoOC/h8buRsaPXQCWcbS85+WO3LB2REHiTAa+LwdjDuiYO?=
 =?us-ascii?Q?qJYajoSKL1F2oxASvUE+XEfrN9orkfdFENg6hYQ0r6GGWZlDrgybtQZ9rtMQ?=
 =?us-ascii?Q?qQY4fuu5IStaayCLGgTyWKkzM7aqsHVRPILycfN5CneDrbqoooyKKWeg1LN1?=
 =?us-ascii?Q?VA6IrWmVkMu61Pm4PcTFVjDkLwW+FpiK5CAZL6IBO8onV/L73Oj9ARI2pM2e?=
 =?us-ascii?Q?hSMRiEeRoeXY6TyUYtzBOEKhkL892fZPqfqZRUFU6aowvEYgksI1YauHYU8Y?=
 =?us-ascii?Q?lZZbK7VDpSaNsRN4HCtcNsMUHo2Q7UrdKHFWbqAvKSO/C5CqjVrftEqfz4vi?=
 =?us-ascii?Q?xsswHgSjFtmMlzND0PHgpXhZm5e3lPOaP+JXX2FQMxy/PX4NKhuAYOYfiBzV?=
 =?us-ascii?Q?j1ko0w/mM1Aa5A5tOZMHulp9WOfTWlQpJHobB3lKY7gay+UX9E7dJJHB74Aw?=
 =?us-ascii?Q?vc651m7ilwSOqknXTD+z4k+coOiid6ZUNOTVh/5MlZcTc7WrTyKUKoL1YWQk?=
 =?us-ascii?Q?K8H0swD5N1x48nccmUilOO4ECXFMJtZvt8qlFBc8VyEZotrTf88NvsegFs/B?=
 =?us-ascii?Q?T1kpHbtT+0V6zLONPDY1IfnDofIA1yt7V82+YMdCbd7VBX994FTjHpFz2/lc?=
 =?us-ascii?Q?ESsybop49jLOwgQkyOYYFeA/TDFSM1M8EWPQIF3Q3sMvzn8poQDWOe9YdPZf?=
 =?us-ascii?Q?IfvniUN9/+h3RMHkfWxg6/PAZ82RJlR++/rOTvjGlrGdA7sFrVYwbUmfPfbw?=
 =?us-ascii?Q?CgAYmAL8OWF/dn3nsctY6nYBfxMYVonsDzgF7lghSCIwIcEvrT+fglarwDUl?=
 =?us-ascii?Q?z+9CXRbE4ZI0RA4e5WG9RyCiSgAig5aURMU3YPMbJQZo5hGwA9MICY4cddqd?=
 =?us-ascii?Q?V2oIvzMkdVFsthfyr/4XJd696S8eoC72gq1aDL2xmXl5rxt8quO42hFAYl3M?=
 =?us-ascii?Q?cZTXIPcYmMkSx8U4J5/Yz+q/dZ32QSLw76iiiTr8fRc+ss2vexyWui9mD4Cf?=
 =?us-ascii?Q?JmQosMP+QfVCby5jokE8YWYWQlzWfp+xd+HlDi3xhCgGrOk4m1arbLejSBVn?=
 =?us-ascii?Q?q1P2ueRgFBj50MuTCyxLWjJ0EXnXp+huJM9kuL0Kv3PKe4ZQcr/+0hpqxW4/?=
 =?us-ascii?Q?R4ICE+ckkssCSeD6uvq2vvJGTXxKh6RizOCoIbFntOCJbMCGGswsGo9+jToG?=
 =?us-ascii?Q?ReJFfD3uHAYAt+kThxDRR0Ql12laUZ1Fife3YWE1Bpj3KD2vt253CeobmXBN?=
 =?us-ascii?Q?pjcGI16geEW6hqJRsE+ZTDYM3XVtV8McOhqzbZe4XmTKnV18nXnMbDmCT8Qj?=
 =?us-ascii?Q?dNAprJwIoUhSErbc21vjtn2Fq0o4VCToMSTTT67emaWi5gVfaF6WiDvKuLcY?=
 =?us-ascii?Q?WRFj0DIv2O69tC+z0nyPHat7OF3rUa5WoTOzg0QB1LOLULRTg3mQYlz79buu?=
 =?us-ascii?Q?/4z8GfPBNQoRYz46dgc3j2rSb7mMzPMOdftMC2xeFMoPKrVb/tXD/kzHYwp/?=
 =?us-ascii?Q?zwK7JdzkpP6bR7X6gnjkRsZ00QSHtu5t4JGsTxeBYiTqgSTg06zSK6NoGgA7?=
 =?us-ascii?Q?OxguQRImWA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 962f0cd9-a1de-4b32-38be-08de73f795fc
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 22:53:54.4851 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wgbROh65U/FJpVb2vMOj6mRgema/5ZfQSflhZTWStkXAt54nBPicihYIfRZw+zFQDa87DC2TJWM9YhpXDA0NbQ==
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
	NEURAL_HAM(-0.00)[-0.927];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,nvidia.com:email,Nvidia.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 8E24418DCDB
X-Rspamd-Action: no action

Add page table entry and directory structures for MMU version 3
used by Hopper and later GPUs.

Cc: Nikola Djukic <ndjukic@nvidia.com>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/mm/pagetable.rs      |   1 +
 drivers/gpu/nova-core/mm/pagetable/ver3.rs | 302 +++++++++++++++++++++
 2 files changed, 303 insertions(+)
 create mode 100644 drivers/gpu/nova-core/mm/pagetable/ver3.rs

diff --git a/drivers/gpu/nova-core/mm/pagetable.rs b/drivers/gpu/nova-core/mm/pagetable.rs
index 925063fde45d..5263a8f56529 100644
--- a/drivers/gpu/nova-core/mm/pagetable.rs
+++ b/drivers/gpu/nova-core/mm/pagetable.rs
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

