Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wDGuACQsnmmkTwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 23:54:28 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A629B18DDA3
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 23:54:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8BE010E6E9;
	Tue, 24 Feb 2026 22:54:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="MIoHxg2h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011038.outbound.protection.outlook.com [52.101.62.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4289D10E68F;
 Tue, 24 Feb 2026 22:54:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RAw2JPlY+GkINlThDXW4EtHQoi5P+IRAnrCOz4OTeyFo6NR1t5SRGQXcLl56WptcmwD8A2kBkOiugU4j2ud2OQQC2nF/c18TCAzq5sKJtn9eES2ifqbgW36oNvCsa9rbqakP36sVGGlbVPAjhaqgMtShychdkb0SExv8rRmvIEAnsSvC6cSUFT1s77rMf4ojR7B6zSDtyTAm3Gvzwe+cTsBaDK340BiLotZ6AuooC2m8BQWjW6lrANE/WvLBK0l4TW/oDVcO/8TGDMeGwVPQH/Qgy43F0lRkKOycyk/D14mbJn/Dp6Dr1Ro9CdtcDAmEUJejYk2CSkBKyfQ7uRI+Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KfK/pXk9gj7CZHYPuQ0xEvz+/6jE8AU0gSqiE0ShTwA=;
 b=mEZdsC2a4XKD650RxfwQylG12iwMpOuiAZdxxR+GgM3DtKB8co4KvgtB7EiTQYBo5MPUl1gQHF5kEAOk6MnYl1YWFafxc7kVLY78244wtAYWZDQ4GyditcK+TBVbvdEStu90zMMGyWQYx0mQ0Y3otJAd0JL28CX5pxJrpjFyL3qosm47ot0JzAoht0LcFQ1s9qDTQTjNC06MOwCCROXn6iEI06j4qoQCkLUbaN1Mw05g6fETC1ZI/ClYR8PCb9lbTMzE3gWXQrMS9aeITUtTTIm3YMpBaNXOlpfmHtcK4ZG0onx9F/5g3UeAlYQbzTDa9gexTo6b/s427sfmBv47pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KfK/pXk9gj7CZHYPuQ0xEvz+/6jE8AU0gSqiE0ShTwA=;
 b=MIoHxg2h3+4tWXiRcLN1Ub8ZLsAUO6ZH5EK8rOzsXIJrjagDAOZ2/utRii3O7wR39BXps2Qe7g/CrsT2ZlEoBaRfdvnWbqdQtmjISGqRwHnvrnZCphbkQ6QiSvbKuhnZZLMo+8Jdkof8sXPMnjF9l7DgkT5WYjRYKxroPkEGUvNgzcRsXxSIIVzoxmAriFPlqvXT/4XMnz4sYZZpzAfDuhPHWokW5/YVTyjzZrj7J3CVJwvoJVGRs+RtaRcjLGiGeL8Sg0gqLSrQxvDtcCwwjCt6zKVHVQnWKCc2oYWYJiYAmlWW1JCACXaOtHgR4KXTSps2JLSuQU2Eour0DzFfoA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 SN7PR12MB6885.namprd12.prod.outlook.com (2603:10b6:806:263::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.21; Tue, 24 Feb 2026 22:54:03 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 22:54:03 +0000
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
Subject: [PATCH v8 21/25] gpu: nova-core: gsp: Add BAR1 PDE base accessors
Date: Tue, 24 Feb 2026 17:53:19 -0500
Message-Id: <20260224225323.3312204-22-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260224225323.3312204-1-joelagnelf@nvidia.com>
References: <20260224225323.3312204-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN0PR04CA0026.namprd04.prod.outlook.com
 (2603:10b6:208:52d::17) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|SN7PR12MB6885:EE_
X-MS-Office365-Filtering-Correlation-Id: 14187b71-6664-4d1b-a920-08de73f79b6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?QEx/dwMIwscfeA0HCQ/X3GLOPAaVCm5vtrCvKqWREWlzAhEO3WLhqRS+K6b9?=
 =?us-ascii?Q?UZj7mINM2Po83YV5N1+P+6LNP5NonOc6ZxbfgviP6HS9geOQbA64ZQskXavl?=
 =?us-ascii?Q?hvwFBXTgWWOxMaf7TQ2UB1jgjBhNe1fmJolmpPS5l/0wra7Bt+SPjaTqNMtT?=
 =?us-ascii?Q?195+/2McWMJPo383T4iBoeLd3p/MIiKNxklZX1zf+yZbZzDYFa3c0VkI74xr?=
 =?us-ascii?Q?aquMQ/p3TvLqrQBXaAaYNZB/qWnarICX10UsHtsYiQM0jEgo0yukDB+/ylCc?=
 =?us-ascii?Q?U+U6xz5YH+9GuBpl14PKE/7DkMsjX3YnRPn1dDoRJMDXhpXcekEuMRyR/+Ug?=
 =?us-ascii?Q?iZTEX6fA7kz/Z5uWDIoZzlEVcVdlUCVqs5KfBMmJ7wl6+wpBkf0ZMcnM89Fy?=
 =?us-ascii?Q?MKUzT+HEdq816J3rIcseSR2sZAnHt960bECouxoGMNNkCHtiX/RqNPIjX4uI?=
 =?us-ascii?Q?IvLeURg5A0++gy+t3vKovb9qKWUn/O9jts3QJWEh0ZSfmX/GfREyswq33UI0?=
 =?us-ascii?Q?Hdlgx1K1bRB6e8rQf+aM0NzT7B2BO0qOKfqnM23Gcial+igVNxkBmQ5WVL0E?=
 =?us-ascii?Q?jSe5FWi9zlJh9Qs7WACPomiOh+nV/6uCxl4Uh4RjcpCCp1a6COX5/WkYYcH3?=
 =?us-ascii?Q?LJ7x65cqrKTD7OtKa6ER98sPziq+0/TxUMhu8WP+Lv+ztNo1yGfWFE4gL7VU?=
 =?us-ascii?Q?k4PddGbnK6d0va80f9j/j5deNXvaEKKb4sEQrLGTahFuXS4RSZNDoDx+37/h?=
 =?us-ascii?Q?acoMDSHH1y6pyhDwzLQ5EsBqjjcddp3Lm4NlUC2uK6EXpSqsRJw7P0seUW/u?=
 =?us-ascii?Q?WuYADeOQLZsdMqYfFyKO4spZ2kX1D91xl2dRtfHN1VaycaU+qdmNDcR0lEbq?=
 =?us-ascii?Q?0FGr4X0S5BDIG150ws1W+Puuv7K1CYisbvR86HbvaljnHkqAlq7SE8mSflLj?=
 =?us-ascii?Q?koNcA5VLVLGl+xyfZcsKV0yR5Al1mLz27a0dO5BFrePUHinRdNkTPeaSW+Bt?=
 =?us-ascii?Q?hWR5/R1lwHeDmVOT29yHEpaWjjp2hvDpLC4rdGlEU0B2oecQSMIfn5kgkI+a?=
 =?us-ascii?Q?AuLn2S/ZM2tjXXNruXfgh+UZ4nUZSJVZlYqPqcGj8dRYFIXmDBjMjth9s4lu?=
 =?us-ascii?Q?5V46hcRCNY/2oqq3lOW8RtjyS2RNRgGt2gcURxNYaLCWf45zViE/2DtCoHky?=
 =?us-ascii?Q?DzSdjcsKjntIDVc8/g5/IJ9seG5xMtetHrz9RG1THRGUl/aQOqYRJU86M/zg?=
 =?us-ascii?Q?p4bgkjBuv+/ZojTPJwEsE5dy7uDInPIpUux5igDeVEYePRE1CIZ//jVbXqJc?=
 =?us-ascii?Q?PPvE0T2/X19mFFF4/jvVFDOgUe0CBaKi5NCb+OgNu0HgTbxcQAsgoMhh5jl8?=
 =?us-ascii?Q?tgEeSCmSCWYHWPnAFm4Vv8O1PgClgA02vnS7k5zBZeINoLARFfUiGtx1LKAR?=
 =?us-ascii?Q?6sG+hpUIyAw+Rz4nP5XacScpRt64MVUOJBWh3eXyGyS1B109mUT3nR9Eoox3?=
 =?us-ascii?Q?hmg5Ftreg3DwrZpwNIODP73wlWqiUQhMyD5pzJRfkTy+ur2x1phs0PdeQCcG?=
 =?us-ascii?Q?EhWvTZH/+h8Lc8FmdaQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DsEkvB+38epr1FCf1/1jvoV+A8w7LzQy2iaKzn6/BhnEkPKLJaiRGShr0xUD?=
 =?us-ascii?Q?NLgIvouFuhO2PPgOV7kbo9GmOfFTZFemV2UVSBIohOhxGyyvm9empigdl1B7?=
 =?us-ascii?Q?azcqZqrHaP2UGxxMeTdIrOIkjokgrbO6L0R48xgwINxF2KHL/aUcDXgn8zlb?=
 =?us-ascii?Q?eZdNXumvw/nCTX5mNzCUMks5Wr97NInkdxIXIEQkE64KWAq4SLAcWFHKQLQM?=
 =?us-ascii?Q?ppscY+ybl4EtFAnJjKsEp+nDIiVg0qy8GUloGN7J4OPU24RImVxr3AEmy+ZT?=
 =?us-ascii?Q?oe5fzaPvdAMMId+k9SRwr3xGY51jylASy0DjACWdw1zB1/UO4WbOSDlUv2qK?=
 =?us-ascii?Q?am2+EZnsojCjCbeSqhuMZxzm/iKqDUx0f53ou3f7qcJNyk58svoDq1PCXAyE?=
 =?us-ascii?Q?xfJRfUKTg0kagZ0+4qQXsVmSAtwK3SrA/vKj8Vj0OGqjwY0or70AAm1USJ9r?=
 =?us-ascii?Q?aRSGSLZVqBM0eRBMQKPKElphf/byX+V/UvJQRlulmf2yPOBXtJoQP+jk5Vx9?=
 =?us-ascii?Q?wc8yWyhpkXcYzZVTvUcQfYmnfBeszORbIMXq6gKgUeGaxRIhOjG6Ll6uyIVN?=
 =?us-ascii?Q?YLE40JhxYl+nxWEFBjBkgWCvCn9TpSOKtLj2c7jultjBUguiabEVftQ5d/cz?=
 =?us-ascii?Q?zCKgk13vRT5jOAxzEnOTQBGjjx4GSWcwyuytwEsCLL0d0SOPFXuCYlau7SUm?=
 =?us-ascii?Q?5VqkMxzXE95AlJ3o5RQ3VL3H1TzTeotIDn2Ek2DsCt9gFA6T1FwdOIMRzK82?=
 =?us-ascii?Q?HT7T5M6ci9B4Uq5vLWThnWD2HjD+7zXM2xBb85Y9bw6xajHAsc8t0WGEJJjJ?=
 =?us-ascii?Q?rBIUPfO3K7flFKHiUHfzIzKswtlktAtE/gcvVIC102jG6pH53EXXbkgLjUXc?=
 =?us-ascii?Q?RY/ofUzfYaYLRWHxZfnl/pt4KdtHeaQyQz4I1lGAfOO2/wSLkTU1K1NvtTqh?=
 =?us-ascii?Q?P2Xnf/Qf6YoMVzr0xG9HxF+8f9e8LgKnPZNgcDwmEj3zXeISLPIhvfiU+foh?=
 =?us-ascii?Q?rHFA2uGL88ehOHaFb1ymplftXXDF4rf0IltKIP2a0ywFZDDRf3hPk3O2bjvw?=
 =?us-ascii?Q?SAe0GB2Jgnc7hqP+o/GwpVA8EowNuZfb9vzPudzrOS17Gu3lyPFtSpMfNGjq?=
 =?us-ascii?Q?y49V/OcUGuJCczgspq6wzrksKsC3PCSZoqvQ4IM7cSMzdiUu7IsQkB0dRdQo?=
 =?us-ascii?Q?hoHI+eZ90XMkl166GZNlIpOfYGvSlDHSwL4eASwkmiTbvZD642psf3Uh8F6I?=
 =?us-ascii?Q?tPcsqbuN33p6dJirEPgr14jct+CSRfz3vZtei4mA8AKt4xzK+hOobeIVtMk+?=
 =?us-ascii?Q?a0KvE6OyyAzEv9cxPArE5DucwY2hdgCbDY8ptQkPWDK+tDvSVAnOLy9W4I77?=
 =?us-ascii?Q?GsmbAJsp5kB32AuPO1gjEeb/nEBu0BKaTGNjZHuRQjh4ByZa4RmlltxNhoEX?=
 =?us-ascii?Q?l4QDwgi++hHdISGzfz5cuqk1H4Om7k0xf83eZO3eSXC2KXx35AuYGzgHrGZQ?=
 =?us-ascii?Q?AWCLFug8y53tvOvp3JWk7IBIN8LDGXjaXSEitwXkdT335iG588zwYoFrC7I4?=
 =?us-ascii?Q?RgKcoRzvTPndvuluhps2czc4bnAzG1kKOh0IcUUg/cybP5LlLELTdAqaD+sW?=
 =?us-ascii?Q?OGbaI87wg5NVmIsgNK6/4+H7+etwwcLOFMxn3ZLGVnqwlNLHpnI0ycuBGnJ8?=
 =?us-ascii?Q?IP4ax/8TZB2cXUNeBzNZp8DqT6k+3DQrNXKV2oIG/9a7F4ucH40ToOpfbH5U?=
 =?us-ascii?Q?2DRKOQ7Qlg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14187b71-6664-4d1b-a920-08de73f79b6d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 22:54:03.6113 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: apEPaet67p4PVsev5Di7GJeo5zjf2cCjrExVdPYJQ8/Ix616VoKzBRnZF1vSOe7y01IWWMshSAArLbZTNRK1kw==
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
	NEURAL_HAM(-0.00)[-0.941];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,nvidia.com:mid,nvidia.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: A629B18DDA3
X-Rspamd-Action: no action

Add accessor methods to GspStaticConfigInfo for retrieving the BAR1 Page
Directory Entry base addresses from GSP-RM firmware.

These addresses point to the root page tables for BAR1 virtual memory spaces.
The page tables are set up by GSP-RM during GPU initialization.

Cc: Nikola Djukic <ndjukic@nvidia.com>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/gsp/commands.rs    | 8 ++++++++
 drivers/gpu/nova-core/gsp/fw/commands.rs | 8 ++++++++
 2 files changed, 16 insertions(+)

diff --git a/drivers/gpu/nova-core/gsp/commands.rs b/drivers/gpu/nova-core/gsp/commands.rs
index fc9ba08f9f8d..22bd61e2a67e 100644
--- a/drivers/gpu/nova-core/gsp/commands.rs
+++ b/drivers/gpu/nova-core/gsp/commands.rs
@@ -189,6 +189,7 @@ fn init(&self) -> impl Init<Self::Command, Self::InitError> {
 /// The reply from the GSP to the [`GetGspStaticInfo`] command.
 pub(crate) struct GetGspStaticInfoReply {
     gpu_name: [u8; 64],
+    bar1_pde_base: u64,
     /// First usable FB region `(base, size)` for memory allocation.
     usable_fb_region: Option<(u64, u64)>,
 }
@@ -204,6 +205,7 @@ fn read(
     ) -> Result<Self, Self::InitError> {
         Ok(GetGspStaticInfoReply {
             gpu_name: msg.gpu_name_str(),
+            bar1_pde_base: msg.bar1_pde_base(),
             usable_fb_region: msg.first_usable_fb_region(),
         })
     }
@@ -232,6 +234,12 @@ pub(crate) fn gpu_name(&self) -> core::result::Result<&str, GpuNameError> {
             .map_err(GpuNameError::InvalidUtf8)
     }
 
+    /// Returns the BAR1 Page Directory Entry base address.
+    #[expect(dead_code)]
+    pub(crate) fn bar1_pde_base(&self) -> u64 {
+        self.bar1_pde_base
+    }
+
     /// Returns the usable FB region `(base, size)` for driver allocation which is
     /// already retrieved from the GSP.
     pub(crate) fn usable_fb_region(&self) -> Option<(u64, u64)> {
diff --git a/drivers/gpu/nova-core/gsp/fw/commands.rs b/drivers/gpu/nova-core/gsp/fw/commands.rs
index ff771a4aba4f..307f48670e6d 100644
--- a/drivers/gpu/nova-core/gsp/fw/commands.rs
+++ b/drivers/gpu/nova-core/gsp/fw/commands.rs
@@ -116,6 +116,14 @@ impl GspStaticConfigInfo {
         self.0.gpuNameString
     }
 
+    /// Returns the BAR1 Page Directory Entry base address.
+    ///
+    /// This is the root page table address for BAR1 virtual memory,
+    /// set up by GSP-RM firmware.
+    pub(crate) fn bar1_pde_base(&self) -> u64 {
+        self.0.bar1PdeBase
+    }
+
     /// Extract the first usable FB region from GSP firmware data.
     ///
     /// Returns the first region suitable for driver memory allocation as a `(base, size)` tuple.
-- 
2.34.1

