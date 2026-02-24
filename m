Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aGIcMuAonmn5TgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 23:40:32 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 757E218D84C
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 23:40:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B18D310E64D;
	Tue, 24 Feb 2026 22:40:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="iwMj0QX6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011054.outbound.protection.outlook.com
 [40.93.194.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D5EC10E64A;
 Tue, 24 Feb 2026 22:40:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EKeQMD7inyEvcT9l1vpABvH7u85bRMvH1da8zNRATyQh574SBDmKtHhqmEO4NIvJq4BdhEtxHTPbZNy17IVrPQyAfys/XObew9bStEg/TyCf0i9U+zK049h1NivNMhdwkjwTBgvb0gU0wuQPt3xWqSM+lSgByqKFXId6eo2x8rAaMqp0fwH2tVoT/pgs2/Q3sLlDQ7TK1VSOp2UNi9rv83VHICW3Qs5vHQV3hOnIVyzY/OUX8AtIAsjHnZwaKHxpf+Cc1h0xr/f+0mKuS2dsNMau0GKtyK64iEB37wXZZ5ZiWymcA97wII6b6D8s+nXgHVUJ66sOZ7n6GzfF0/mhoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cz9q6h4ET6NycbgVaU+e4f2kI294W8WP5YRsCcPOrNY=;
 b=rSlOHAHOy92KVJYomCmcvydoCFR8yr2YTiyAnKgUJfCIGQd9CQ68n67TfgEE9cLomN73vvc/LHDQWKSc3VnN52Q3hHFCUXT1KUfSKNirfi4XTJRf0tJBBF6OBy/OuLKxWO2dHUDx1jj50l9Y97uWxxP5W0VqF6Y1PhzvLIyotwu6212KsTbngI+XbfcRH0iMMHVMbb8Zo6Ki2FFNfdt171D7XeDQC+lJbl95DlDsX5etpk7xtpb0Djzcip8ZJIpZWfmHJtPhpMnTaGAEGIAMJgYKzu7gpGBeso9ewBhHp3QdDhuAdTB0vRAR3aBAwsbiZT2q7rLLd89YbZjbO66MAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cz9q6h4ET6NycbgVaU+e4f2kI294W8WP5YRsCcPOrNY=;
 b=iwMj0QX6idMc29l5RvMIW0QPoEIHxt2Acq5IWj8y4blG5Z0Rt+Nq7O0pOuxlBiXWRG8UMZC7uSs6CNzuTSHEpoWfr3IVypPuxQBgTzNH54qo9rmPbYZDVvDUZJgn6ESqBAkFmKoha72oF6qdWQNKQiehPuN6ptnyPLEJMm8DVbyRW9Ge7z62obmW35TH6qRjR6x5yDdCzH4nSZyOpu6uc1+ZLks38MISgarR0nZGUh20Gs0j1NskKCzDOt7WyFoGH5TbYcPWSVsmCSq6V8W9/XI4SruaMDZAO1ambw3zBFvBN2ybzT+IjabXhYS4sSxCbz2tQ9jWBjFHfyWVUArqlQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 PH0PR12MB7816.namprd12.prod.outlook.com (2603:10b6:510:28c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 22:40:18 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 22:40:18 +0000
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
Subject: [PATCH v11 4/4] rust: gpu: Add GPU buddy allocator bindings
Date: Tue, 24 Feb 2026 17:40:05 -0500
Message-Id: <20260224224005.3232841-5-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260224224005.3232841-1-joelagnelf@nvidia.com>
References: <20260224224005.3232841-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR18CA0027.namprd18.prod.outlook.com
 (2603:10b6:208:23c::32) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|PH0PR12MB7816:EE_
X-MS-Office365-Filtering-Correlation-Id: dab4f29d-723b-4fa5-79d1-08de73f5af52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xhEmCyAs8FDbbB9x7Jg5azK1bfTteZAeduddpb+ixe7+bMZdNTe7TaqC6nX2?=
 =?us-ascii?Q?1wBBihtyY5wjQag09jQr31w3eBVkPVbfhdN6NvnxHMud07GlnH4X2xb4/jqx?=
 =?us-ascii?Q?rw/9YEk9l1BiSIyTPbxC1YY5GJwy3O9p8c1Kl5EFyNynsI8q94PiNFfduXMx?=
 =?us-ascii?Q?M2BMsKS+w/4TCBIKhBo97fovoPaujSrDECizl/0RIxVb/QnWKRP/71QLQNZe?=
 =?us-ascii?Q?fG6TwPKaC2xsvKu6LJ4mZ6F9wADJhOjIMwhi7BIscYYMX4rahI7C0szSP15q?=
 =?us-ascii?Q?2xPNM6UITvT9mSILXwOlNrHAlzfD286DXPZjytLZJKhkMrBTcLu65Otz19jR?=
 =?us-ascii?Q?zSo3Uk/iUts5byK9Fm339/i72ulZaCpkdagTvXknrUaYTw+Xv0DgqjVdRGs+?=
 =?us-ascii?Q?z/r5CsuAUgEhdn07zHDn6azV0vxx1u/kwichqONYXMNt114TZLxWFOAAnMDR?=
 =?us-ascii?Q?8o51ukUxDpd7fcOOoFTTBgn5vR1m7QPuTGz4pcLhdG8p+v8npdcs9EU5nszZ?=
 =?us-ascii?Q?6chtCfoeGLJVBA+0w4aRKvuSn+ywdkEeDv/Ri28yIo/g+KEAGBS5kuAOuE/c?=
 =?us-ascii?Q?Qw3XdWyemGXmPpjfyr4U9eT1MBJxHsFYckPf5ckEM/l80ERMAxieQXrA3oRa?=
 =?us-ascii?Q?JP+Ys7QIpn6rnWkCf2AbKac+ZC86rritFnTIDfwQY8WRZdiPfzqjG2nMhj7/?=
 =?us-ascii?Q?Mive+R5iuIchJi+iE41aThRaLtAqaXftFzk4UAk0dnL1Ks4uEvhtB+HEGTCz?=
 =?us-ascii?Q?s6CHrV+od4IfyvP3jgIra0Xqm/mTGXb/31yPyPv8+fKvMvYkkoCy3+JBZvck?=
 =?us-ascii?Q?9hBad4tcCWYmlZ7/kJ89XJz+1bbv5+Aszcu2kdpYQI5dw4/32/QWb4ZebBhO?=
 =?us-ascii?Q?SBOi+s+51EBccS3bK6NOf126apORavIBjhAvk+m/zpy2OSuAQpfe0I0bAT12?=
 =?us-ascii?Q?v5DX5UrKu6mmdJF+zzkIxXVjEtWF1hK55CwB/0m3d4fkkkdNcrV1kp7tw2Dq?=
 =?us-ascii?Q?d6y8PkRmmBZmGkvp9eMwDUMzt1iTiVTUJIlRvvjoEHw//Ax8O1Ubh69afkCU?=
 =?us-ascii?Q?8OJsLs2XnxrutFh0bSGaQP6mmMFrH5IuxNns4deTcFZStEpFh0kpJGGg/8CG?=
 =?us-ascii?Q?zZckUh69MZ3Rbas0p8zBP67L4mZC77Xc/lO1DMtOvtk/Zkw38Vck2+kBhKqn?=
 =?us-ascii?Q?bCk/TPWk4qavhiq5CpiMCoh9tYUsL9uS3DItG7H2Vf+E14lzDVVaqIN7bDU/?=
 =?us-ascii?Q?4+uuviz0EMUK0xGMWkDX+PV9TsOaEmj2B1izEiNsONBp51F9nC+A6xUZYTKr?=
 =?us-ascii?Q?BL/7dd8BwyCtFarLQ8SQ2NvbJGBP74RLKjZmuO/h5Ar/FK1SPGUPvz2+RTrY?=
 =?us-ascii?Q?vFg5BeeznLFuDmvp4gJzcoaMKuq3HkxovNiSHPYVazgo0L5g36lZ9Fawc1R3?=
 =?us-ascii?Q?Jz5auF4cst6EiNaxpzrDWdpv+wG7An36gRemeUt8V3fY3N1w2AlMWqBAco8B?=
 =?us-ascii?Q?2PIzK4r5+nFEjzjDYbt40QuAfhK3SRN3jf9d+IE65p8KZ6l+td9pJ5o/Iw0+?=
 =?us-ascii?Q?3irdYIMFOXknfy1Hy98=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0pVL4gHuNnDEg6aKkkMfELM74kBmBV0BqsU+OSOvr2cVEzRCXRkuvM6YZ+mt?=
 =?us-ascii?Q?wpxPgdrb/OhXNArKhTTtsyqHeYHtsxOJ98H0AaWen6tgmp/fO1TlX38wajfZ?=
 =?us-ascii?Q?svTi2VzGjCuoLScMv85/bK5rHXognwg/3bjJnARvw4H0jCj2/nIN4PiVSR66?=
 =?us-ascii?Q?/VjrY806A9SO8PlsJvgCkzIA5cMzrjW6+UhRUOnz/SG9KqKMJg6+xjSx8/7c?=
 =?us-ascii?Q?RiTXQoaJAeW3ABIgeq7v9OuoUFlrhwDcvij3W1P7jhXpQ5xP+KfZ8KSusRm0?=
 =?us-ascii?Q?XycQ/12H45gBCFHEdFCuYrTh0OeIhblw4Dd4//i6ByBMZcxUS9Zd17W4PEuy?=
 =?us-ascii?Q?R/66C9rGYVUIWFRE0Lpk5BBrCoAOQ62edEcA+8QcT3a0uEIWsuG5B3NwuHpB?=
 =?us-ascii?Q?+KU35YTfw+DVqOtXMKhHDtaQxvJqoJnmQBpFiNPxAOnJU5XD2KOBPM9q2n+J?=
 =?us-ascii?Q?VCFxSbMSqhqzi31KxB9bNjihTfWuUukVIne3NbOM7twELt37uksT0Yz4aQ97?=
 =?us-ascii?Q?zIRXe3FqL40nZ+EjJDqcjdSGfelSMzHtSCky7X2qkJzB1HdmofMrvWKpkr6v?=
 =?us-ascii?Q?+Lwa/wKbRC6UOEgD6nSMmOI3I83/RuXVlrrR5E4VbXMBBdWG4XUqs+u12ecg?=
 =?us-ascii?Q?7ThkRa04OQg7je4M9vnPonpvEANSDghK9XPLDIJ4MmXPHiyUezM/VEjWbkDQ?=
 =?us-ascii?Q?4PUHsNbO2aB+VBZCEinfGb8X93FpFIhjieALT73TynU/h51dkv3AtT9UKidV?=
 =?us-ascii?Q?/OL+5SV5qRn2/WyF60C3MfbcmJ1ICRL3Xlq3Bja76zQVCbRZv7IpqZ7T7j7l?=
 =?us-ascii?Q?84gHuoe4/ixyc7eeeypUe5PuApsOylfP/fHMysySKFNr1E0SYSk3ialqCrpk?=
 =?us-ascii?Q?ZO72QX7iakSMfDLXI5BbKLN/lud59lYijNrirUHRQ4jp7W8XcbnghnhkdVjP?=
 =?us-ascii?Q?9d4XqBrc91qb4vSlVTIySARzLGja9V9z96LdXh76nX0bWlwa3Viicpj2sFH8?=
 =?us-ascii?Q?KMh53XVyIx7p0g1NsTz17omPtRi8mTwcRbJzypHi7SJzlRkXS8zlsNHfAaF2?=
 =?us-ascii?Q?tZG1A/f2fjOqm7CnkcVTS14eEU7LJRPACRUX6IHb/H73rVqkTNPYzsjwFsN3?=
 =?us-ascii?Q?QPuc+HRC8vlSk2XqhCIesRse0xWeI7KkqCTbo6vjVa2fo8PuRwICIvo0zMaD?=
 =?us-ascii?Q?x8NoO5d15fAcK/8xV3eQULJFBKL2Zk/wdtnjrQ8ITf2zumCAuZXqXVMs0F8v?=
 =?us-ascii?Q?GxK6mAN+OvCfQRCKF/FXAZYc9Fdopy5S5O7Fm4RjJD+jweXOsGBo+XUCuBQ/?=
 =?us-ascii?Q?/6SgkK0LudQYIGT2ufwbqqc0de06DEIf9l6t7ORqu0ls1lGVIc5CkWHl/XSJ?=
 =?us-ascii?Q?GzaqE3cf4k3CRszPs8iubHI0DHl7JBAmXE9GEzNzP6aSkWwT7Di76pNeZeXx?=
 =?us-ascii?Q?+TTsVOMoFmRUduRd6nxldZaEwPsnRrkgBDKd0vqpfz0glgypid4h6C/QSjbN?=
 =?us-ascii?Q?0wLK8aSIKcMvt5cXBeZSmONpD3fuSIujdFeZ5zJHi4iIXYCeC/RleOew/uS3?=
 =?us-ascii?Q?zHAzQHakF1TtluIsT2Vx09ifcus8TL3r1PbfA7MhGOS9CjPwcOItSICjY1sD?=
 =?us-ascii?Q?/QMjtvsjYuyawY590XIKALqkYeohUh+7pMx536NLLmVjRtH2rQvqtv8uDFua?=
 =?us-ascii?Q?AlEULirFtz+vCfMpw2kqTurO+iwaVEtHcNgJ+l60XC4cb0Pkfh1yC5CebJtB?=
 =?us-ascii?Q?9kOmATcDnQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dab4f29d-723b-4fa5-79d1-08de73f5af52
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 22:40:18.0986 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: miqYjiJrdiUqbdowMoUq7XqwRWUOdTW20PoFJYQ0gyicHCfaN9/fAT+Lo/NEL2XHItBMqfolyoxihiuttRIU9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7816
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
	NEURAL_HAM(-0.00)[-0.796];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,nvidia.com:email,Nvidia.com:dkim,lists.freedesktop.org:email]
X-Rspamd-Queue-Id: 757E218D84C
X-Rspamd-Action: no action

Add safe Rust abstractions over the Linux kernel's GPU buddy
allocator for physical memory management. The GPU buddy allocator
implements a binary buddy system useful for GPU physical memory
allocation. nova-core will use it for physical memory allocation.

Cc: Nikola Djukic <ndjukic@nvidia.com>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 MAINTAINERS                     |   8 +
 rust/bindings/bindings_helper.h |  11 +
 rust/helpers/gpu.c              |  23 ++
 rust/helpers/helpers.c          |   1 +
 rust/kernel/gpu/buddy.rs        | 536 ++++++++++++++++++++++++++++++++
 rust/kernel/gpu/mod.rs          |   5 +
 rust/kernel/lib.rs              |   2 +
 7 files changed, 586 insertions(+)
 create mode 100644 rust/helpers/gpu.c
 create mode 100644 rust/kernel/gpu/buddy.rs
 create mode 100644 rust/kernel/gpu/mod.rs

diff --git a/MAINTAINERS b/MAINTAINERS
index f1e5a8011d2f..6befe3890f78 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23191,6 +23191,14 @@ S:	Maintained
 T:	git https://github.com/Rust-for-Linux/linux.git ffi-next
 F:	rust/kernel/ffi/
 
+RUST [GPU BUDDY]
+M:	Joel Fernandes <joelagnelf@nvidia.com>
+L:	dri-devel@lists.freedesktop.org
+L:	rust-for-linux@vger.kernel.org
+S:	Maintained
+F:	rust/helpers/gpu.c
+F:	rust/kernel/gpu/
+
 RUST [NUM]
 M:	Alexandre Courbot <acourbot@nvidia.com>
 R:	Yury Norov <yury.norov@gmail.com>
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
index 000000000000..4383f82c0fc1
--- /dev/null
+++ b/rust/kernel/gpu/buddy.rs
@@ -0,0 +1,536 @@
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
+//! let buddy = GpuBuddy::new(GpuBuddyParams {
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
+//! let topdown = KBox::pin_init(buddy.alloc_blocks(&params), GFP_KERNEL)?;
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
+//! let allocated = KBox::pin_init(buddy.alloc_blocks(&params), GFP_KERNEL)?;
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
+//! let frag1 = KBox::pin_init(buddy.alloc_blocks(&params), GFP_KERNEL)?;
+//! assert_eq!(buddy.free_memory_bytes(), initial_free - SZ_4M as u64);
+//!
+//! params.start_range_address = SZ_8M as u64;
+//! params.end_range_address = (SZ_8M + SZ_4M) as u64;
+//! let frag2 = KBox::pin_init(buddy.alloc_blocks(&params), GFP_KERNEL)?;
+//! assert_eq!(buddy.free_memory_bytes(), initial_free - SZ_8M as u64);
+//!
+//! // Allocate 8MB without CONTIGUOUS - should return 2 blocks from the holes.
+//! params.start_range_address = 0;
+//! params.end_range_address = SZ_16M as u64;
+//! params.size_bytes = SZ_8M as u64;
+//! let fragmented = KBox::pin_init(buddy.alloc_blocks(&params), GFP_KERNEL)?;
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
+//! let small = GpuBuddy::new(GpuBuddyParams {
+//!     base_offset_bytes: 0,
+//!     physical_memory_size_bytes: SZ_16M as u64,
+//!     chunk_size_bytes: SZ_4K as u64,
+//! })?;
+//!
+//! // Allocate 4MB blocks at [0,4M) and [8M,12M) to create fragmented memory.
+//! params.start_range_address = 0;
+//! params.end_range_address = SZ_4M as u64;
+//! params.size_bytes = SZ_4M as u64;
+//! let hole1 = KBox::pin_init(small.alloc_blocks(&params), GFP_KERNEL)?;
+//!
+//! params.start_range_address = SZ_8M as u64;
+//! params.end_range_address = (SZ_8M + SZ_4M) as u64;
+//! let hole2 = KBox::pin_init(small.alloc_blocks(&params), GFP_KERNEL)?;
+//!
+//! // 8MB contiguous should fail - only two non-contiguous 4MB holes exist.
+//! params.start_range_address = 0;
+//! params.end_range_address = 0;
+//! params.size_bytes = SZ_8M as u64;
+//! params.buddy_flags = BuddyFlags::try_new(BuddyFlags::CONTIGUOUS_ALLOCATION)?;
+//! let result = KBox::pin_init(small.alloc_blocks(&params), GFP_KERNEL);
+//! assert!(result.is_err());
+//! drop(hole2);
+//! drop(hole1);
+//!
+//! # Ok::<(), Error>(())
+//! ```
+
+use crate::{
+    bindings,
+    clist_create,
+    error::to_result,
+    ffi::clist::CListHead,
+    new_mutex,
+    prelude::*,
+    sync::{
+        lock::mutex::MutexGuard,
+        Arc,
+        Mutex, //
+    },
+    types::Opaque, //
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
+
+    // TODO: Replace `Mutex<()>` with `Mutex<Opaque<..>>` once `Mutex::new()`
+    // accepts `impl PinInit<T>`.
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
+    fn new(params: GpuBuddyParams) -> impl PinInit<Self, Error> {
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
+// SAFETY: GpuBuddyInner can be sent between threads.
+unsafe impl Send for GpuBuddyInner {}
+
+// SAFETY: GpuBuddyInner is `Sync` because the internal GpuBuddyGuard
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
+    pub fn new(params: GpuBuddyParams) -> Result<Self> {
+        Ok(Self(Arc::pin_init(GpuBuddyInner::new(params), GFP_KERNEL)?))
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
+
+        // SAFETY: guard provides exclusive access to the allocator.
+        unsafe { (*guard.as_raw()).avail }
+    }
+
+    /// Allocate blocks from the buddy allocator.
+    ///
+    /// Returns a pin-initializer for [`AllocatedBlocks`].
+    ///
+    /// Takes `&self` instead of `&mut self` because the internal [`Mutex`] provides
+    /// synchronization - no external `&mut` exclusivity needed.
+    pub fn alloc_blocks(
+        &self,
+        params: &GpuBuddyAllocParams,
+    ) -> impl PinInit<AllocatedBlocks, Error> {
+        let buddy_arc = Arc::clone(&self.0);
+        let start = params.start_range_address;
+        let end = params.end_range_address;
+        let size = params.size_bytes;
+        let min_block_size = params.min_block_size_bytes;
+        let flags = params.buddy_flags;
+
+        // Create pin-initializer that initializes list and allocates blocks.
+        try_pin_init!(AllocatedBlocks {
+            buddy: buddy_arc,
+            list <- CListHead::new(),
+            flags: flags,
+            _: {
+                // Lock while allocating to serialize with concurrent frees.
+                let guard = buddy.lock();
+
+                // SAFETY: `guard` provides exclusive access to the buddy allocator.
+                to_result(unsafe {
+                    bindings::gpu_buddy_alloc_blocks(
+                        guard.as_raw(),
+                        start,
+                        end,
+                        size,
+                        min_block_size,
+                        list.as_raw(),
+                        flags.as_raw(),
+                    )
+                })?
+            }
+        })
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
+    /// Returns an iterator yielding [`AllocatedBlock`] values. Each [`AllocatedBlock`]
+    /// borrows `self` and is only valid for the duration of that borrow.
+    pub fn iter(&self) -> impl Iterator<Item = AllocatedBlock<'_>> + '_ {
+        // SAFETY: list contains gpu_buddy_block items linked via __bindgen_anon_1.link.
+        let clist = clist_create!(unsafe {
+            self.list.as_raw(),
+            Block,
+            bindings::gpu_buddy_block,
+            __bindgen_anon_1.link
+        });
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
+/// as references during iteration over [`AllocatedBlocks`].
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
+// SAFETY: `Block` is not modified after allocation for the lifetime
+// of `AllocatedBlock`.
+unsafe impl Send for Block {}
+
+// SAFETY: `Block` is not modified after allocation for the lifetime
+// of `AllocatedBlock`.
+unsafe impl Sync for Block {}
+
+/// An allocated block with access to the GPU buddy allocator.
+///
+/// It is returned by [`AllocatedBlocks::iter()`] and provides access to the
+/// GPU buddy allocator required for some accessors.
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
index 58dbb02c5197..b8287601f464 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -97,6 +97,8 @@
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

