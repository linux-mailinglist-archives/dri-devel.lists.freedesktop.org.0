Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QKhoGCvpb2m+UQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 21:44:27 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE13C4B9AA
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 21:44:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19CCD10E69C;
	Tue, 20 Jan 2026 20:44:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Zuzkc0lm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011005.outbound.protection.outlook.com [52.101.52.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D516810E68F;
 Tue, 20 Jan 2026 20:44:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SRgf2Aun7vdu1c9ixTfdhiJc9+hsOaeEc2zu+vNJ7tTZuDYX3hYljCNwxYrn4hrlNgatiy4kBZ3njc+McGWJs362KzFAuYhI1WKycmKdHL9BseluTfLVdrhhbBKoIrn2NH/n7vGhjTZdYpLX+nONh/A8YNP+1tKcjRdbtOpePbYqw+CoPGggtmvkPgUO6TQw0CJ6kfVzwD5EuDOxuvI+yPt8n/Gw2G34+0OQgqX4uEPic5qvG8j6AEuEYWfZF1vQTmmYvNXmGjbYieQtj2N29izQ5ICa/1BJuqrHPwSC6Agm3gDa5p6Fej9B4oOypRmowXIgFgVisnY8qXjGQH0XsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Td5seor6YcwL8U3MguhSeXZvuzOQUJHDD3RB5hCjIUs=;
 b=NKxSne5Hql6dPfOmVBLfjL2OXHKfJaRLwuVVKa9CPhlCV14SvQ56k19XRZuq+dN0+67VbEDc6QDhxXq13PSew0YAzWIy+UOx26pR0DNy9gPW7qEDn/ernCUMXDWg/iX+/TPSci2ixC6Iydi1MEK1Z1AJDo6fjik8IG/wCEbAQTjpWr3pnR4ehw1HcJ2a00I7+ZjgUVf+SdVVlBQ+E7QP2xMZdIwYPnB+VOjZ3Px6rsi0KoraL5WdTr8f2D4bfG1UP9xMwfeQmyBt8yVRwzraZWmyNucmXTA1oyLGRqBhMX0hZySjc8zhaI9TA2ji8QToyJ9DQhuhS/YBM+VIgb3xjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Td5seor6YcwL8U3MguhSeXZvuzOQUJHDD3RB5hCjIUs=;
 b=Zuzkc0lm3YJFko7rPbWQsVcerUkYcuQ6vAp5Qh7XrnBgD9l/lzcz3lzC6XhDHtdcHnlMaLQBW2SoZ7TT4AL/omZ+LOZkvQAoXN0a0eOBZ5yti5hdw8hbqggjeouoEzKax/Mmq0kyZ9oohj5Zo11c3g/NZFQiy1XxFzVG4Yfj2t2yfkpy1kRl+hKYQQqVZtc6I/xJXWyindi9Dj6hMrmDXyqOaCqVNkZo01cWBLxKsby5Cw916ih0eAe6N2LGToWBbNAADyThHK9vZhGBPpgVr3xDatIuZr5Z03OG1QuZVVQBa1DrK11Hs98mKfHJyrDN+mV+G0TKO+zhGRvhgHqCtQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 PH7PR12MB6809.namprd12.prod.outlook.com (2603:10b6:510:1af::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.12; Tue, 20 Jan 2026 20:44:14 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9542.008; Tue, 20 Jan 2026
 20:44:14 +0000
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
Subject: [PATCH RFC v6 14/26] nova-core: mm: Add TLB flush support
Date: Tue, 20 Jan 2026 15:42:51 -0500
Message-Id: <20260120204303.3229303-15-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260120204303.3229303-1-joelagnelf@nvidia.com>
References: <20260120204303.3229303-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR01CA0043.prod.exchangelabs.com (2603:10b6:208:23f::12)
 To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|PH7PR12MB6809:EE_
X-MS-Office365-Filtering-Correlation-Id: ab838b71-f9f1-4d4e-09ce-08de5864ac6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?EMm+panFU9btzc+Qx95DPXy/keTnFSOytfvH8JbEkGsky56ZrxQQhuIqwyqK?=
 =?us-ascii?Q?7v7Nhi3xFGxIqlgst0GotDofg9qItjol2z7VXU/Dj5yv7IfXkLF2R7eFi9pf?=
 =?us-ascii?Q?jy5opYCJAkFX7tes9Y8P5es7xGGdeCQbkaWnFqPcY+qGl3ShM7z8G688CW0S?=
 =?us-ascii?Q?sX4SEFb1YNbSaZQjmKXQMT0KCL3OJ9gxBYgHCuzZ3faXEVHZo5HcaZKDdzqm?=
 =?us-ascii?Q?Ad4VAdjUXP2UZlR1mIB7sqNtLZ05EQV3LfkIT/xjVoyedZtgT91zxyFwXUX+?=
 =?us-ascii?Q?PLCU6bEdr8Mjo9dPPNfuVu4AvIWoME3arEycM+y7tlP4dd4Og6ozJud7SZIL?=
 =?us-ascii?Q?gXx9mHeWxFTb9u8qcxnD6Y3dPOSUA/WABsYb0OdTNHBP/Qpmvd3X4tTRzAGE?=
 =?us-ascii?Q?2EQYkH9gpUrMJaiDh97DWR9dz8cnhTadzzQzP/+QNWyo+J7TJvBhA7zSs4DZ?=
 =?us-ascii?Q?S2aHT8yNoZSsC9edoA5ylBIH69l0hZUMQionqUart3nJ956MSoVks4Wg6aZy?=
 =?us-ascii?Q?zTQ0m/QDro+VxIkVijgebWqk2xN3Arw/Cztg5pNbvFAILNMq1tORVjThE9l5?=
 =?us-ascii?Q?OqtN3iGDJZbFWe4QwvNuYGBcyYSmXsKfKNIfLMBxTNvui53oResuA//kX3hM?=
 =?us-ascii?Q?hxr4u6qBPdtbhGD0u2E1p8o++CUHdUWSfg1gRUyPdV1u4M9TTyr2VFST+Vv2?=
 =?us-ascii?Q?0BXH0a4u0MTulybi9xmy7vfA5bjEfZYFji+PLn4btqHT/4+d4vPL5lDO2ONa?=
 =?us-ascii?Q?uyCBww/leHEZfw/uy8oOtJPbFMMHuBNr2rk4NicE91ajoxCdSkIxpm9N86fq?=
 =?us-ascii?Q?Xr7QOVuZ6cFg8uxvN4hk+zZLpFJZyoGnmvMBLmd7UvgnoRH8BVZYRNk2H96C?=
 =?us-ascii?Q?s8D6uYDrGjNnDnGxp0aAosvxEOR9rIAsgEmpwNpgQhTe5Eq7x10MysmOt6zy?=
 =?us-ascii?Q?/Gkkbdtbj6Tbeg1mZaGibdgmaoCdhLLwUW2/0344pHWajvzfmbmlws9Vn8X6?=
 =?us-ascii?Q?tEmk96aMHR3TiDkP4XQpq9unveN31/MrW2eUMu76F94MRa6ZFa93PVsgCXRK?=
 =?us-ascii?Q?VMGAi4H9w4limTh4fX37UwrrZJMTGBKY78vZ1yUiBP7OHZkK7wEncTiUOZv8?=
 =?us-ascii?Q?k9L2wrwcQq5tH2aFAEzOksMfTfy6YnE5mRfMJS+UjGTbfkuziFMRqGikdEk/?=
 =?us-ascii?Q?fFxA7u/UiQhxG1jrREy/DTj7Ltnl8olADSsEpVp9YSKKlI5daPwpeh4nSUoo?=
 =?us-ascii?Q?C3na0FOqptZqkeEVxO+gGwbySHqD6RXrpBRbXGQZfg71RGzHQdiuIV5x5sTP?=
 =?us-ascii?Q?fWuQB45J9b/55CtKgUZ5Tw+5vtvCvp74HL913a+V0uEkAcPSk0Pjrqy00P3L?=
 =?us-ascii?Q?V6jksRAOJi75HNHi/CEiw4X6ekejQ17+4G4CbL07S052BY19DbfYTD94JisG?=
 =?us-ascii?Q?O624UgN4E+EMLlJrZ4sDbnQnsbiWK60dZVRMTWFn68WQ0hM9DEY133Kpb08Q?=
 =?us-ascii?Q?vEneFyeqyQzSYCCBK/AES1t3L2oL0hK6g48ZijFeTzuvfYBRmxCuZGdcRTU6?=
 =?us-ascii?Q?ogfk5dYuv3BR1dOFi+4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+f6AZBAAagst1G2jPm0Q3kDmjbDeHWJTuzXL7RVx9XDofRs4+LGBcKD65D62?=
 =?us-ascii?Q?+gAUtYrdKO0cibQns/UyQqZi2YpR5VxmTgr/cWWkskUNCX12CCebWtKxKvu4?=
 =?us-ascii?Q?HhuR21/cELZuM7miL7o1z3H6g4Gn4S+0XUA8YUx9M9St6JrbZwwirFL1Z80b?=
 =?us-ascii?Q?R0U3nYk7Dul9WxhpuUQFrPFb6LXcrtiq0R4ShOtKwWEuwOybbbaNboO4kqKo?=
 =?us-ascii?Q?w3rcIJnarfHc01zvm2TtFBOMArZ8DkjAJF5C/qcOOd3i22H6ZbtC0ckYPFHd?=
 =?us-ascii?Q?4GJWf0McY6zZHTHtBz3hzE8M8e1RISIlaMDDOd6mn0vK/akLccgzjyhHvUgZ?=
 =?us-ascii?Q?Msthfs2qXHmCICSD/Sh0Cg4bBJMTFXItg+QvuCeNcbsYFW3/SFq1akCZH47r?=
 =?us-ascii?Q?cbrKdldpzo5ZDmo+vp4NjA1AuFVuFGL2fT/M9a0hPUgk6ZFeUp4/PqbbEOy5?=
 =?us-ascii?Q?9TDlHnSVP7GyXiRVRLy3r+vOltR+dY7blOpAhx5VeyHUCS0ysckghGB14Nub?=
 =?us-ascii?Q?+HA78x3/9wcFa2ZIZT/Ok7a9+NO14nBQElvFmwndxjKy4PUJ7MZJcLvQb8PB?=
 =?us-ascii?Q?VQSU+qJywM4Rwcp4Lo5JRHiZEk+LpxP5N28MTpL7BzKozfFmMpMHcJNUJyuK?=
 =?us-ascii?Q?ON7YXPutqFg1lPhNeaAI0UWtZdGGnWwu4Ou0vDQ5sTauyPl7qiGRNUX5Inv1?=
 =?us-ascii?Q?CsUAjQKDaFezqrjm5Y8h+RpLFr+jnunbh+Wpp998PnPe4XkUsjEyugbswWY/?=
 =?us-ascii?Q?bsnoiBbwe1ucJZL63GXKx7/BwtVMQCa5z9JUW5v5F1nqRP1u0ZWkE9Rdm9Cd?=
 =?us-ascii?Q?05vI/R/eLINVn4KZqXqsiypJ9SybCj2DYIrc3YrQhQ052qCNnoB0jl8UQjzb?=
 =?us-ascii?Q?/Ylu1+I52GbfUqN9u3/JkZgyX1OmA/mxf/eDUhlQiljAJvoG82Urpyk+C2rz?=
 =?us-ascii?Q?WTLaQzu+hcTNRxQuZ9Hrxig22H6sziHxJSkF2AgLnDm6VTWjR1+VORPFVnkG?=
 =?us-ascii?Q?jKh//g97GZaUJUyTvMUsWHSKx4IAWkGKSx6PfQadSg002ZKoKuUveqCn0+ge?=
 =?us-ascii?Q?v9PDtH/dei4RApGOy0Fp8Av0cg2iPT0OpmZKmYp5zdgyyN7EPj8pPODWAWNy?=
 =?us-ascii?Q?lX1+gAxKosEadfSZ/mrwg2aURASd7ws6bI9ZNeVHl4cEUPXQR6Vv/LnVXX8O?=
 =?us-ascii?Q?61poJGJfZT2n7kPBuPhIZ6G/BkY3UoBmlkEbNcZhsPmfeECjc4Njtp1VKtfu?=
 =?us-ascii?Q?vgXaKUI5agrEjzy5mS6waA6SPq923NsLGoRfNu5HN6Oku1iloFAkLkK1KIh4?=
 =?us-ascii?Q?gLOGs/fqK4l/XeKvABfsp8dzbCEVZvwLrY1pqes6je5vAc6RmeqKKHUz7rNH?=
 =?us-ascii?Q?uZKv4snLYBm6ISgDovx7c0gedZKWzovkkU4nOmN1i9cmH/AvK2LviOdqhKRl?=
 =?us-ascii?Q?U+63cpNxR/Pwr5KfFj48OzCTewuzgIxeoTjvf9+hEvwcjk6Gu/jtVkdFpFJj?=
 =?us-ascii?Q?1PmpZOI+kiUt7x7EUNlJDFCY0kUD2ujVjMtapiCyeOoXaZMBkeBUpSk6Bz6M?=
 =?us-ascii?Q?kFC6Et7GAf3BzR5/xFe4xRwU/eLXSbNCcMuM7Gnnb93/npSNgqhLTJrKn5mz?=
 =?us-ascii?Q?CDbTZVvAZsYdQv+TiqXZTDktXzyuFEC0i/kOglRjgbKMH9ZRSfTA34owi9t7?=
 =?us-ascii?Q?XIf9KNErLbfGh8Vm8aIKMCa104t1eUvkuN1uvkfHwwTjIxa+Kk+sd1FkFbB8?=
 =?us-ascii?Q?20+Z95YNIw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab838b71-f9f1-4d4e-09ce-08de5864ac6f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 20:44:14.7841 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2lk49y12UumFf7IkwuSFmtddv3YDPa3qBoYPXj6dtzMPBGnxWaMFBtVk666Yi9TcfrqUyEYMIKGQZqcsgBfErg==
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,nvidia.com:mid,Nvidia.com:dkim,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Queue-Id: EE13C4B9AA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add TLB (Translation Lookaside Buffer) flush support for GPU MMU.

After modifying page table entries, the GPU's TLB must be invalidated
to ensure the new mappings take effect. The Tlb struct provides flush
functionality through BAR0 registers.

The flush operation writes the page directory base address and triggers
an invalidation, polling for completion with a 2 second timeout matching
the Nouveau driver.

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/mm/mod.rs |  1 +
 drivers/gpu/nova-core/mm/tlb.rs | 79 +++++++++++++++++++++++++++++++++
 drivers/gpu/nova-core/regs.rs   | 33 ++++++++++++++
 3 files changed, 113 insertions(+)
 create mode 100644 drivers/gpu/nova-core/mm/tlb.rs

diff --git a/drivers/gpu/nova-core/mm/mod.rs b/drivers/gpu/nova-core/mm/mod.rs
index 6015fc8753bc..39635f2d0156 100644
--- a/drivers/gpu/nova-core/mm/mod.rs
+++ b/drivers/gpu/nova-core/mm/mod.rs
@@ -6,6 +6,7 @@
 
 pub(crate) mod pagetable;
 pub(crate) mod pramin;
+pub(crate) mod tlb;
 
 use kernel::sizes::SZ_4K;
 
diff --git a/drivers/gpu/nova-core/mm/tlb.rs b/drivers/gpu/nova-core/mm/tlb.rs
new file mode 100644
index 000000000000..8b2ee620da18
--- /dev/null
+++ b/drivers/gpu/nova-core/mm/tlb.rs
@@ -0,0 +1,79 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! TLB (Translation Lookaside Buffer) flush support for GPU MMU.
+//!
+//! After modifying page table entries, the GPU's TLB must be flushed to
+//! ensure the new mappings take effect. This module provides TLB flush
+//! functionality for virtual memory managers.
+//!
+//! # Example
+//!
+//! ```ignore
+//! use crate::mm::tlb::Tlb;
+//!
+//! fn page_table_update(tlb: &Tlb, pdb_addr: VramAddress) -> Result<()> {
+//!     // ... modify page tables ...
+//!
+//!     // Flush TLB to make changes visible (polls for completion).
+//!     tlb.flush(pdb_addr)?;
+//!
+//!     Ok(())
+//! }
+//! ```
+
+#![allow(dead_code)]
+
+use kernel::{
+    devres::Devres,
+    io::poll::read_poll_timeout,
+    prelude::*,
+    sync::Arc,
+    time::Delta, //
+};
+
+use crate::{
+    driver::Bar0,
+    mm::VramAddress,
+    regs, //
+};
+
+/// TLB manager for GPU translation buffer operations.
+pub(crate) struct Tlb {
+    bar: Arc<Devres<Bar0>>,
+}
+
+impl Tlb {
+    /// Create a new TLB manager.
+    pub(super) fn new(bar: Arc<Devres<Bar0>>) -> Self {
+        Self { bar }
+    }
+
+    /// Flush the GPU TLB for a specific page directory base.
+    ///
+    /// This invalidates all TLB entries associated with the given PDB address.
+    /// Must be called after modifying page table entries to ensure the GPU sees
+    /// the updated mappings.
+    pub(crate) fn flush(&self, pdb_addr: VramAddress) -> Result {
+        let bar = self.bar.try_access().ok_or(ENODEV)?;
+
+        // Write PDB address.
+        regs::NV_TLB_FLUSH_PDB_LO::from_pdb_addr(pdb_addr.raw_u64()).write(&*bar);
+        regs::NV_TLB_FLUSH_PDB_HI::from_pdb_addr(pdb_addr.raw_u64()).write(&*bar);
+
+        // Trigger flush: invalidate all pages and enable.
+        regs::NV_TLB_FLUSH_CTRL::default()
+            .set_page_all(true)
+            .set_enable(true)
+            .write(&*bar);
+
+        // Poll for completion - enable bit clears when flush is done.
+        read_poll_timeout(
+            || Ok(regs::NV_TLB_FLUSH_CTRL::read(&*bar)),
+            |ctrl| !ctrl.enable(),
+            Delta::ZERO,
+            Delta::from_secs(2),
+        )?;
+
+        Ok(())
+    }
+}
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index c8b8fbdcf608..e722ef837e11 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -414,3 +414,36 @@ pub(crate) mod ga100 {
         0:0     display_disabled as bool;
     });
 }
+
+// MMU TLB
+
+register!(NV_TLB_FLUSH_PDB_LO @ 0x00b830a0, "TLB flush register: PDB address bits [39:8]" {
+    31:0    pdb_lo as u32, "PDB address bits [39:8]";
+});
+
+impl NV_TLB_FLUSH_PDB_LO {
+    /// Create a register value from a PDB address.
+    ///
+    /// Extracts bits [39:8] of the address and shifts it right by 8 bits.
+    pub(crate) fn from_pdb_addr(addr: u64) -> Self {
+        Self::default().set_pdb_lo(((addr >> 8) & 0xFFFF_FFFF) as u32)
+    }
+}
+
+register!(NV_TLB_FLUSH_PDB_HI @ 0x00b830a4, "TLB flush register: PDB address bits [47:40]" {
+    7:0     pdb_hi as u8, "PDB address bits [47:40]";
+});
+
+impl NV_TLB_FLUSH_PDB_HI {
+    /// Create a register value from a PDB address.
+    ///
+    /// Extracts bits [47:40] of the address and shifts it right by 40 bits.
+    pub(crate) fn from_pdb_addr(addr: u64) -> Self {
+        Self::default().set_pdb_hi(((addr >> 40) & 0xFF) as u8)
+    }
+}
+
+register!(NV_TLB_FLUSH_CTRL @ 0x00b830b0, "TLB flush control register" {
+    0:0     page_all as bool, "Invalidate all pages";
+    31:31   enable as bool, "Enable/trigger flush (clears when flush completes)";
+});
-- 
2.34.1

