Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2JikFxwsnmmkTwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 23:54:20 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDD9A18DD58
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 23:54:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 381B410E6D2;
	Tue, 24 Feb 2026 22:54:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="E/rWb8tt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012052.outbound.protection.outlook.com [40.107.209.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B38F10E6A1;
 Tue, 24 Feb 2026 22:54:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PqbDWcpzOGlGaWFvPG36IecYFL/qffRYzHDm0EY57hn7atdgDur2Gy3klVEtwygwhvbW965rkeuCbK4YI6+2RkrtbmT4K6TZdPs5lUFkD11VegoIsO7KoL6m4nznCfSDJqLx0f2vqPKgQD1EsOGL6JhY9y/6Qf9e6an9/EZWOJtsenC59ghx67FQhfOoFk+umQivoUDp8PcsV7y5j23sPyBA4hH7m5F52k9jT99jYhUfEDjLO2dYsvKUUwLcTbRy3SYm3McILeR3agrnUuDHWhq0f/hwk2p+Mnl7553+vZ+Ek2zGfkmVZmHRskUJ3NjrkRgs6zXDWbTp4lrQvyPQaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TrnoAiUIsvm6coLNvVvVHIUvBKqhWKnL7KDqeNGwLvw=;
 b=xyvkeXkWEgj1sMkj6nAomDPS3kZEj5VTo9jsMytuIUHxDiEk1YxR+/I03Wg2oCQyNMAhoSxNxdOvYmFMNXFTxh96xdnTVc+b0Dp7ZayaJSCCWfCb5mHQATq17q1dzpPFybqD2W6tv7RNftQMYzBC553/lqAsAxDBrt8Z4w2WYP2j3j1JBqThs7zMC+84xTjOBNypyrcvP8Xf3ua/obTamzzRJkXvzN35C660AYYDbUnnzBA6YaouCeAMe4jiIp1IepuYR0onDbVjclMgdxhe2CqB4NgrEsuYOLyk/6BHgPsiMFg5UWysfyMtLvk7u3uZaOE6djuKLotuKa9JTIweGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TrnoAiUIsvm6coLNvVvVHIUvBKqhWKnL7KDqeNGwLvw=;
 b=E/rWb8ttIdzGRBtCjwspN0VEeqp6Wkwnblx0pagP0Leh/0LrmaishSOSD4EieIzIuxSTCEKpD1r+z43atT2XPo8PkyrA9Hw8QHCHqldZ6TTRl3i++QwyGkGmuq/vQPwZxiyh++x0Ikuv1xhDsik/3+DBmvM3vwpdo9o0YUHSF3Cjl4ycmjwsmwUXoCK+A31zfozxvj6Lho770ONLp4XFiJ7+LHiLT2k+zUO/6HsRrk3uYcd99ChHhNvdPVSazFg0Bf9vGAbqCgRF/iBGwo8Dsd1fOqyY6sbGRQWpyW53MJ3652AIoiVQnnn5uNGzPHETTirXkqtolkjfbZaUqopyYQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 SN7PR12MB6885.namprd12.prod.outlook.com (2603:10b6:806:263::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.21; Tue, 24 Feb 2026 22:54:05 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 22:54:05 +0000
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
Subject: [PATCH v8 22/25] gpu: nova-core: mm: Add BAR1 user interface
Date: Tue, 24 Feb 2026 17:53:20 -0500
Message-Id: <20260224225323.3312204-23-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260224225323.3312204-1-joelagnelf@nvidia.com>
References: <20260224225323.3312204-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN0PR04CA0012.namprd04.prod.outlook.com
 (2603:10b6:208:52d::31) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|SN7PR12MB6885:EE_
X-MS-Office365-Filtering-Correlation-Id: 16cec9c0-9e1b-4ee7-aaf7-08de73f79c69
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?NC5NpjVnNxDKV8oecfJz3cFrfIg/KD/iZqjny5Se/hHi2a31x+Nu7utqkVHy?=
 =?us-ascii?Q?9yAlJlV6iXo8ltY8IH7GkK3sqwbeM/br+bFQ+ahaJmh/95qdUhYL47dfVdqS?=
 =?us-ascii?Q?WuqbDHtUiq/C3uMpnKtrk4HcMVgHSghXnR7vxTTRLeaUho/ZTSNCvTy4rDOv?=
 =?us-ascii?Q?48MK1qF+V2xlrCjL2oRV9r6xHr5uBP0otbP1yEDbyiOgGifQ+L6pkgEBbLEk?=
 =?us-ascii?Q?tMdQP7W1C+g+cWdu2Mj2Y/Uzgu23vp3TcjHu0qt04w8DebW18B3uTUIyM5J5?=
 =?us-ascii?Q?7o66XSylXgcCoikHOHQ8oxXTVUREAyz7ktsfyomVNEJqeA1dUqFuUOW/fVE5?=
 =?us-ascii?Q?O/xRPdB8lRHdUo+93PK1xYVIZ5Hq5I1DAuQVs1V0Ma9LZC1liGJV80UUXTmG?=
 =?us-ascii?Q?4uDiqdWXndqenAU1iMj5EOPKMCymsaNE97Np9OqWlNTtACdDtO7e/4eVRXha?=
 =?us-ascii?Q?W+llq9Q+WstAIFLtBNhUOVFpuDE3TfI9OTeO/qFC3Kcycc8TtVrL8ZLIGqeI?=
 =?us-ascii?Q?5XBB+sjDhkpXuUEtYDuYgK6KiuHhcB+EgJYElZTHPX6O2uMXm7Vq8T4yMtMP?=
 =?us-ascii?Q?Aps7gcc+4T6aCFVzjDB2Hzvv8ErZYz1HDeMfPg4K1QsYLog5cZAcMsqHVj7Y?=
 =?us-ascii?Q?MbcmtzTcJBDfz4VDAOWHJWhW+vC0+FRHNEDcwb9k9CMt9aKsyFGxtTswngTH?=
 =?us-ascii?Q?6mfW2UouuS6dTl6g7XiBZWNu/OrnMKU0PB0H8JXpTpAxX8xhajkW4cMlArN8?=
 =?us-ascii?Q?2USywgV9R/FOua/tOjHcGI9x3dU0qGM0l8ttYlEZIAxkWIolEzSgR6go0HKD?=
 =?us-ascii?Q?Nycb/pQXfCJxLT6kJf51Hx4T7wf4EXR97g6K6bN+zrWSwSq6MzNTKjsCCHc/?=
 =?us-ascii?Q?FMLTL4PdXX8fgbf8kY1HQmvMPdG/dE5vWT8d+Xlfa9jpX+oSElLHAcVa5GJF?=
 =?us-ascii?Q?D3KxjQm3FZUamVp7HL9sm9yf1f4qd1f5HWRtZBl38u5Nw8rmwrKUsTLhMmz0?=
 =?us-ascii?Q?yoLYZzlDdpWby/wYdLi/LCzYfrHQ1p9g4e40Dha1svQkP3p0KDVXurg0UcoP?=
 =?us-ascii?Q?/ReQYVTGKSByFkMMRCjP9CvjhzcbH2sddidWPlr8i+/yVAgzBVi+cq+oHRRI?=
 =?us-ascii?Q?BFKH6D0qYv1DhPJ/Vjbr/SQMLWzjcYtJ1ul0jjMgYxM9F5HiQ4WPDWd2AcGS?=
 =?us-ascii?Q?k2NNeXMsmq1WICas37BdJ1fSuAiO7AMCRRz2Vts+u0auvzadgvGwXMaAflgj?=
 =?us-ascii?Q?2iml73LhZJ+E08dE1gU0QoS1CtlStajCjR6jHovrB/nNbG8PCJMp0bhChCNx?=
 =?us-ascii?Q?GM4jEzA/wVMb30rIgeBYauRq0WQCu5VLo/hdvSuMW2whYvpMEU5YkK8Yfnko?=
 =?us-ascii?Q?8vUt08+tn0Nx1yhf5d3aRA2aTPgHsNRXAvRgUOZ7vg75T4/KljTzf/x4/1kB?=
 =?us-ascii?Q?nM9vZBfBo3iJ2RfyZa2V90VCX+pxUKGqIj3AhU5o4/7J/nJRee7wxEozQBEv?=
 =?us-ascii?Q?HIBl3uNnniwClY4d1VYJKdX4XV2HSoHqfjQIBPoFPUaw9AkDB9PtiCuUAC5l?=
 =?us-ascii?Q?uRhxCqLd3qzn9VNGGcQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AZ7xGWiLsD3L1POC9+vN3cvvm/O6VhAGzrLyb5Ir6EKjBeIn9Vgn1yVj8tJy?=
 =?us-ascii?Q?yn5oYcB8j8V474AA1saz0KJC6PIoFJeYDxg/GiyOMyjXB1aIb7hwxXQHsudI?=
 =?us-ascii?Q?+JhZEwCxySpQK4Ge9J0qTtWUzigVmvbW6cLcRBmv75eJ5eQ/Lbppva8VziGi?=
 =?us-ascii?Q?IV5qD0dfin4I9lGEAIbDkYNqIUmm7C9Jt6XcG4GpybR9N6g27a99U9xsrXN0?=
 =?us-ascii?Q?xEjNTuV0qbt/XTupGChuWpWX8uhMftDxtbxsBy69dMQAorVrns/jCv0HtDhC?=
 =?us-ascii?Q?tL98WBfsV3M+ne5wms91TNxsrNzNH19Md6mXGPhX8O2/rXQsbKsx+duwHPSf?=
 =?us-ascii?Q?7cwWCnFdIDlAg2Rg2U/hTezS0Jqq4YJtmoBZnvBJU8m/1Z5hJNj6DbdyvIzT?=
 =?us-ascii?Q?47uiV03J90Miwq8ezCM79jjI1siglSb86usjEXUoIUCjgjBC3cK9g+ZqMRyY?=
 =?us-ascii?Q?sHeHhJzE0LyvtEO6/earKpFQ0ETN8dL4uUutulQPt/P/SkrF0y5WGnB+nKR+?=
 =?us-ascii?Q?FJJf62mpzJUcp/s8rZRp9/RVMOIibYgLjVuc32I6stG3bwo2ZnVB7IlCj6FQ?=
 =?us-ascii?Q?sC4H50T+pw9ZH6AH+eMpkOKAm7cgkutSvAqQiALdI1d9PZJ5wFzV8tEI3PHr?=
 =?us-ascii?Q?r9JhjuyOl8V1JVM9cKUGLGeXvjIEw0DyZ9Bs7OSy248a+9P22YgU35uoQqC+?=
 =?us-ascii?Q?v5GEECGIkOTPdUICPnSUNXp3I/iDyIDWw4+EIkxznswpmMGlJNbPK2HEY1v9?=
 =?us-ascii?Q?50KTm3+zN1WX7432n3lGqo81Sqika+tTVnSR5Gysh5uM1ffY/+ZexDXDqlwX?=
 =?us-ascii?Q?nbWfanWGyCZIw8an1vQYv1b4KuP7onmRKx/k4M2SRbBefzFCY4a2p8Ys3Smi?=
 =?us-ascii?Q?XYb+wYtGhuZNio5YCbZJZu2ke2KqkimpVcXz1Rbg5yKYoj5MHCaYXAoOoeSb?=
 =?us-ascii?Q?UvWm7aKLWZglAyy0uJvPe62ZSLoylY72H5NyMupRlhTI93BqEQnyop//QQtI?=
 =?us-ascii?Q?eietT51pEbb+2WAzRB2XoAzuQaJsB56htSVxng4VcvtslVq4tuqKFDGq2Kcy?=
 =?us-ascii?Q?eLtEQm1Tpi+jkVKAOY6Jr5qDIHFk5TJSU+Ud6d+Eh5T+VQRGwilJZk851TkF?=
 =?us-ascii?Q?5qghFecFoI55S/I3JZksYA5hYtgSa8Fnz2Iml4tnJKpk9aCw6KWYfmzLAV0C?=
 =?us-ascii?Q?Kl3RbFM176ahC/hXAa9OKiNblTgpNaBBDFXvPAEdEm0Y6tqHMevc3zK4nSsE?=
 =?us-ascii?Q?lAoToR1lBzpnrfk5kRNWz3WRzgLARuOjPjN45eDjrIlh/dgihmqw7QMZ6t1n?=
 =?us-ascii?Q?xjvQvUhRVzCwrpLh9dNPDfUKSDURku6lw9kXx2z4FFs9gyQ7/YXpcBRW5WlO?=
 =?us-ascii?Q?2mx1MHV7QgHi9rlYmz3eFVUg7pZy914CURfq6J4rSVeSdkKsmeaWwfLTHGlR?=
 =?us-ascii?Q?+rKWK4o1YUVgoJfWwoJXIkkEV7YneYj6w+A1cCh7iN/GLHwae3GlA+q0meVa?=
 =?us-ascii?Q?hG3LpciIZCSnGoyppqx+MdotXizZHyLjrlkT9iE0FON0POi4SYZj9hUUlfXa?=
 =?us-ascii?Q?ysn1TeaeEWurZkOCyQaK8jo8XaiqKn0Atb9IRd27+CpBUv4twpBRzpGvhZmD?=
 =?us-ascii?Q?kaRJevfM+YXBs8t9icyHLpbXge7nYbZXUs5zBFzJAYHGIgwgeOuq8Ei8/mV6?=
 =?us-ascii?Q?Ygfc9MmMWP++zIWI14mm9smgWW7QG9DflX0k3u1twLzrbjJJVza7stwYY5+t?=
 =?us-ascii?Q?AMjTd1/rwg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16cec9c0-9e1b-4ee7-aaf7-08de73f79c69
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 22:54:05.5449 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UXD6fA12qhkbIsTN/XnOnhR/XpXFQclqwZ6gB/2eVQzhUZY0Sk2TpasPlymJrM7kl4xsNjpoJWtcHZF0FlI8uA==
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
	NEURAL_HAM(-0.00)[-0.932];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,nvidia.com:mid,nvidia.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: EDD9A18DD58
X-Rspamd-Action: no action

Add the BAR1 user interface for CPU access to GPU video memory through
the BAR1 aperture.

Cc: Nikola Djukic <ndjukic@nvidia.com>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/driver.rs      |   1 -
 drivers/gpu/nova-core/mm.rs          |   1 +
 drivers/gpu/nova-core/mm/bar_user.rs | 156 +++++++++++++++++++++++++++
 3 files changed, 157 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/nova-core/mm/bar_user.rs

diff --git a/drivers/gpu/nova-core/driver.rs b/drivers/gpu/nova-core/driver.rs
index f30ffa45cf13..d8b2e967ba4c 100644
--- a/drivers/gpu/nova-core/driver.rs
+++ b/drivers/gpu/nova-core/driver.rs
@@ -42,7 +42,6 @@ pub(crate) struct NovaCore {
 const GPU_DMA_BITS: u32 = 47;
 
 pub(crate) type Bar0 = pci::Bar<BAR0_SIZE>;
-#[expect(dead_code)]
 pub(crate) type Bar1 = pci::Bar<BAR1_SIZE>;
 
 kernel::pci_device_table!(
diff --git a/drivers/gpu/nova-core/mm.rs b/drivers/gpu/nova-core/mm.rs
index 594ac93497aa..42529e2339a1 100644
--- a/drivers/gpu/nova-core/mm.rs
+++ b/drivers/gpu/nova-core/mm.rs
@@ -4,6 +4,7 @@
 
 #![expect(dead_code)]
 
+pub(crate) mod bar_user;
 pub(crate) mod pagetable;
 pub(crate) mod pramin;
 pub(crate) mod tlb;
diff --git a/drivers/gpu/nova-core/mm/bar_user.rs b/drivers/gpu/nova-core/mm/bar_user.rs
new file mode 100644
index 000000000000..4af56ac628b6
--- /dev/null
+++ b/drivers/gpu/nova-core/mm/bar_user.rs
@@ -0,0 +1,156 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! BAR1 user interface for CPU access to GPU virtual memory. Used for USERD
+//! for GPU work submission, and applications to access GPU buffers via mmap().
+
+use kernel::io::Io;
+use kernel::prelude::*;
+
+use crate::{
+    driver::Bar1,
+    mm::{
+        pagetable::MmuVersion,
+        vmm::{
+            MappedRange,
+            Vmm, //
+        },
+        GpuMm,
+        Pfn,
+        Vfn,
+        VirtualAddress,
+        VramAddress,
+        PAGE_SIZE, //
+    },
+    num::{
+        IntoSafeCast, //
+    },
+};
+
+/// BAR1 user interface for virtual memory mappings.
+///
+/// Owns a VMM instance with virtual address tracking and provides
+/// BAR1-specific mapping and cleanup operations.
+pub(crate) struct BarUser {
+    vmm: Vmm,
+}
+
+impl BarUser {
+    /// Create a new [`BarUser`] with virtual address tracking.
+    pub(crate) fn new(
+        pdb_addr: VramAddress,
+        mmu_version: MmuVersion,
+        va_size: u64,
+    ) -> Result<Self> {
+        Ok(Self {
+            vmm: Vmm::new(pdb_addr, mmu_version, va_size)?,
+        })
+    }
+
+    /// Map physical pages to a contiguous BAR1 virtual range.
+    pub(crate) fn map<'a>(
+        &'a mut self,
+        mm: &'a GpuMm,
+        bar: &'a Bar1,
+        pfns: &[Pfn],
+        writable: bool,
+    ) -> Result<BarAccess<'a>> {
+        if pfns.is_empty() {
+            return Err(EINVAL);
+        }
+
+        let mapped = self.vmm.map_pages(mm, pfns, None, writable)?;
+
+        Ok(BarAccess {
+            vmm: &mut self.vmm,
+            mm,
+            bar,
+            mapped: Some(mapped),
+        })
+    }
+}
+
+/// Access object for a mapped BAR1 region.
+///
+/// Wraps a [`MappedRange`] and provides BAR1 access. When dropped,
+/// unmaps pages and releases the VA range (by passing the range to
+/// [`Vmm::unmap_pages()`], which consumes it).
+pub(crate) struct BarAccess<'a> {
+    vmm: &'a mut Vmm,
+    mm: &'a GpuMm,
+    bar: &'a Bar1,
+    /// Needs to be an `Option` so that we can `take()` it and call `Drop`
+    /// on it in [`Vmm::unmap_pages()`].
+    mapped: Option<MappedRange>,
+}
+
+impl<'a> BarAccess<'a> {
+    /// Returns the active mapping.
+    fn mapped(&self) -> &MappedRange {
+        // `mapped` is only `None` after `take()` in `Drop`; accessors are
+        // never called from within `Drop`, so unwrap() never panics.
+        self.mapped.as_ref().unwrap()
+    }
+
+    /// Get the base virtual address of this mapping.
+    pub(crate) fn base(&self) -> VirtualAddress {
+        VirtualAddress::from(self.mapped().vfn_start)
+    }
+
+    /// Get the total size of the mapped region in bytes.
+    pub(crate) fn size(&self) -> usize {
+        self.mapped().num_pages * PAGE_SIZE
+    }
+
+    /// Get the starting virtual frame number.
+    pub(crate) fn vfn_start(&self) -> Vfn {
+        self.mapped().vfn_start
+    }
+
+    /// Get the number of pages in this mapping.
+    pub(crate) fn num_pages(&self) -> usize {
+        self.mapped().num_pages
+    }
+
+    /// Translate an offset within this mapping to a BAR1 aperture offset.
+    fn bar_offset(&self, offset: usize) -> Result<usize> {
+        if offset >= self.size() {
+            return Err(EINVAL);
+        }
+
+        let base_vfn: usize = self.mapped().vfn_start.raw().into_safe_cast();
+        let base = base_vfn.checked_mul(PAGE_SIZE).ok_or(EOVERFLOW)?;
+        base.checked_add(offset).ok_or(EOVERFLOW)
+    }
+
+    // Fallible accessors with runtime bounds checking.
+
+    /// Read a 32-bit value at the given offset.
+    pub(crate) fn try_read32(&self, offset: usize) -> Result<u32> {
+        self.bar.try_read32(self.bar_offset(offset)?)
+    }
+
+    /// Write a 32-bit value at the given offset.
+    pub(crate) fn try_write32(&self, value: u32, offset: usize) -> Result {
+        self.bar.try_write32(value, self.bar_offset(offset)?)
+    }
+
+    /// Read a 64-bit value at the given offset.
+    pub(crate) fn try_read64(&self, offset: usize) -> Result<u64> {
+        self.bar.try_read64(self.bar_offset(offset)?)
+    }
+
+    /// Write a 64-bit value at the given offset.
+    pub(crate) fn try_write64(&self, value: u64, offset: usize) -> Result {
+        self.bar.try_write64(value, self.bar_offset(offset)?)
+    }
+}
+
+impl Drop for BarAccess<'_> {
+    fn drop(&mut self) {
+        if let Some(mapped) = self.mapped.take() {
+            if self.vmm.unmap_pages(self.mm, mapped).is_err() {
+                kernel::pr_warn_once!("BarAccess: unmap_pages failed.\n");
+            }
+        }
+    }
+}
-- 
2.34.1

