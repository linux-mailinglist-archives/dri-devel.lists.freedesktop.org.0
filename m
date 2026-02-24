Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aBp9DwQsnmmkTwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 23:53:56 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0D2218DBFA
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 23:53:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 078FF10E674;
	Tue, 24 Feb 2026 22:53:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="kVzvo9r1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011054.outbound.protection.outlook.com [40.107.208.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6995F10E65C;
 Tue, 24 Feb 2026 22:53:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ogyAHJ4pVHyxBK8Vf+Hy5/vjQliSnVGSR3EbS8dtThovovEIUKK310/UzMasQOnli7KaZVW7Rtxc6sENsONgTxR/nWdUJ2ewCvzScZblJgfyC10QCA+vAIm75qtdBeE/YzeA69/UBmJ9OEkpTBBPsdZUEykpL3E/aLiquNxyAiSbgRagFJRYGPK6WOBrCAApqA/gdPWyZ/rWJFuIHfnvol3fMDJtPw1ekiZeZM7gGXberAZEFqY03HtPQJiDxGLt9PWJ0HB9id2yi/9VMvxOg/Gns+IWrzTLcXkpDyvGzKssJ8qs2rjWKpE7tyEzkNlTBGjgwO3MstcJWAYwAc+N6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nIPO62UBoPZsLYF1jBq+R5jm6AP8aJGKwfopDKgT9mA=;
 b=n/KDOl66wFKsvoc0/nV/NuX4HtMk30CBUg9Cqi+Jvts/25r2on2o/R1YzlMxTDPp8mRpAqKBiHxBRK5qrfbVNtLYr0t05tGVhpGcV8cdiEKcZdLOMgPCNa4d/WEa8M/N0icZWHVLsGmslXoPuRXmmzBhzfntmuXjGMamTEs42UvOyKL1y5HJ9tZq4KcewOV5oAECQI0g4al8ypWdadMNBKri7sh8/Waj8P1RNMJSLVgaC59rcvKWVWAOVWCOZuhlN5VTZyZ6s2ukJnzrYQbzPGTUrDsxXgdFic0Z3yzQSW8y1Y9dIQhRZQk2TaclV6XZTG4ty1qWNJ1mThuxWvXYoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nIPO62UBoPZsLYF1jBq+R5jm6AP8aJGKwfopDKgT9mA=;
 b=kVzvo9r1ZAYk5tD9OrDKN1uL5l1RLzH8QSaOhnPFdnKaIL6EGnAYEu3P+nwHzwfPIsY3LhMlHil3P4NeSUQrhjheyTzxK6mWl4LA+MFFbDjaX48zhkkhl54y9dJMLl+3j5uCtC7Sg7VBHDugbjvS/6KCoV+S2v1GrjWLPD2w3FzFDLSlh2Ox+QrivvDtYlt0mzbb8/FwtEVpWWA8JNQGwoGz7difProYz+pwtE+zV21nWqzL6GQTtcoAOw0aMf3liXWaIp+nNCXptGhYThnKJ6BOeqjhBx7IU4xo5EPUjm1uHf+eSc2k9tAtSTuDtwm/gpbhzC9RMP9f7Pi62f20oA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 SN7PR12MB6885.namprd12.prod.outlook.com (2603:10b6:806:263::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.21; Tue, 24 Feb 2026 22:53:40 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 22:53:40 +0000
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
Subject: [PATCH v8 04/25] gpu: nova-core: gsp: Extract usable FB region from
 GSP
Date: Tue, 24 Feb 2026 17:53:02 -0500
Message-Id: <20260224225323.3312204-5-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260224225323.3312204-1-joelagnelf@nvidia.com>
References: <20260224225323.3312204-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BLAPR03CA0030.namprd03.prod.outlook.com
 (2603:10b6:208:32b::35) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|SN7PR12MB6885:EE_
X-MS-Office365-Filtering-Correlation-Id: aa24b52c-f70c-42e5-d7b7-08de73f78d67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/53F9L56urGmhnp0R9A8y9m+Daq8Jh8rEDU+KS+S2YI7619zbrTp4xnqEs0P?=
 =?us-ascii?Q?uWA38RpAgq69CkYl85a1wLOwR5WaRW2MK6XrAsghoFiKbh++vRL7M5QDEvYR?=
 =?us-ascii?Q?dIUezJGSVYDwQ6kERv0DkOg653fw66ApWNak3K4yTQ3fmRyNjZ1S7iMPsRc2?=
 =?us-ascii?Q?wTjL3w5KT+6qt9DzxrWYw0xwUPFQ3peITncpk1A3ueYNU0AJa8Hp4dkR7JIl?=
 =?us-ascii?Q?vMVInz2J+uy3cg6J2wmlkDJ+0iW9gDK+UTY79N8BeIYtVVo8rYTm9Q/N1ikN?=
 =?us-ascii?Q?bG4cmxFfCYYhpDFEtjh+jWCx8kHE2ltKoMdl97DgBRnoozs8bsmjeMV++ij9?=
 =?us-ascii?Q?qmlMdu1vJQnrfwmgJ6eaEz0P0RTuAW5I7O5MBxW9oYzLf++XaZBXxx7Kp8CD?=
 =?us-ascii?Q?d3DxjYYwrIXoklRQxUXROwyxOqoPVVQka30MB2woX0cAR/TgjctHjK1k6gV3?=
 =?us-ascii?Q?COh0q4Wz0Ac7ZVk2SSKB5m9RjQbxhiDg+zkzk8timljzbgRFIVpFpCQDFF4q?=
 =?us-ascii?Q?2IirpANpE+k6oJaffOt+SScLkGpkyqS2zzeEDNbO2iuZTNkdJl6QwRh3/lu9?=
 =?us-ascii?Q?b+6ujtV2g5Rxh+PDxrsCBVYc5Y2q641JwXoEZZqXD4T0UzcqbBe8KUxulKc3?=
 =?us-ascii?Q?jfXncoGjpDFXGdxs422kMI4T2F2oCmHN1adeppyAQl6QMiGA3Qvql4JeaHqJ?=
 =?us-ascii?Q?YusabN/c/g1Q3i33/g0JcLOxlNoBgvCFf/BPdg1sN4+VMHrJHL0ciNQZ5DYx?=
 =?us-ascii?Q?bYmR5IF6zNhzzZQQjg2nsDY75BINweAdrQmGgau19dj+TPDeUDxbiIm99XPv?=
 =?us-ascii?Q?ZWO8exadcKjj87KaF0ryqT3jgwZeMFwjQp4CvpHxsLrMg4mcHpBg6TsRGiV5?=
 =?us-ascii?Q?bJ9C0zm5UIJJj/zRrV6QaLBvqpSItYEHPBqy73OtKkXBwAxFXNWSgISsE/LL?=
 =?us-ascii?Q?MxIGCv8cgZaxgQCu89gwT2I5aBEmOb/vd8umhX0icQPYrgVC7C3101Y+3+VD?=
 =?us-ascii?Q?BHvjQL9zF0d9z7MjpY5PJCa7eQXGReOUBJr6dc0GrNZ4SanJa2bVWsrnYxFV?=
 =?us-ascii?Q?MrmVw9bMfDEkG1qmWnm8Lqlp3hBvEwTxyOkVBPq9RoQhRVaEznJBqHRgWl6n?=
 =?us-ascii?Q?f2vvdYGoM0MeKhkyCEkokNpasXyj6+bcXz3TmdRBfkvhzkZHUFWN/8bSF9dG?=
 =?us-ascii?Q?pKbgipdNMY/tCmeOy2cJsctydyFu442im8ExIbdYFeiuwNlLK9HLWBqYkF8N?=
 =?us-ascii?Q?drLG6QIxEjPy/2WSVZBP5WHniiPA4vmjmMLEsj4Gqut7QpVbaLfKYS6Nba18?=
 =?us-ascii?Q?eOklNyAgy5ONNxYPtGHPO21GwTsmVgR9rabUqpdNt89x7pbS/wj8ssui5n/s?=
 =?us-ascii?Q?XrszEFV/z9qxcuJNeEJsKT5NGOGooOJRdKqow1YUy+sXb3VK8p51QhQaiSw0?=
 =?us-ascii?Q?nnMh7D/yXO68D84pFC5dCFn9qEQBa8QwfFMzfgtl2CfzxzC4fH3ZN8hK+Ceq?=
 =?us-ascii?Q?OdXJLb9bOu20jKJ1QS+XMwB4WGbMvzuoxSyUWgRGKnh74gZ8pVhqMAdYsemq?=
 =?us-ascii?Q?HglVCyHCfVIPeMoiDIk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?v9LK7eOiIm2Oa0grHmNJxlSw4tjiuzAYsGqBFrvLURl4ryFvp3yHYFTUu4QG?=
 =?us-ascii?Q?IC0oFohzPifzyoetGxZdT6Shbki/uqBBroXwK40pg8ngt89Fddffwrlzyv91?=
 =?us-ascii?Q?mjPGaK6fFjbuIQWP/TBzfzatUb4ZI3epkqxIHX5hYrH3Q1DHy9i4otvTzJIl?=
 =?us-ascii?Q?CmAmTpyu1e8se4XChQgq9rnN5N0fzQm/Oig1WMi4/iIKtzAs5PhkdmPb5ZN0?=
 =?us-ascii?Q?Nj2EDBzVq7aIG1fWa/Ios1udwZeqmuE8r5CM2a6edbnbcHnaatLQgdrkKzxF?=
 =?us-ascii?Q?MqXxGFINb90TFFclNvI1S2K0izjzW1uYKV1p2vgxAzLo+Z1C5onoUjOCUt1B?=
 =?us-ascii?Q?E+2reZxwZUSXNPRaP7zrCW4RlOiO5/NhTWJq8u2bs0WXwShclYVlGPPWjOmQ?=
 =?us-ascii?Q?RijBoynb6hmmxfXXtuj+ushCG5X9JkvelwDEueIu/GXV2Gn+ioEHKK0R8uZV?=
 =?us-ascii?Q?/ee3EW0jrMl/BndpMUoxbk8FhVwPyIw2/1dWrKYcWniv2U1SaMes6TJCItJ+?=
 =?us-ascii?Q?pq7QdCkNXscDoorvIjV0XBKJnwqxJGbg5JMTlJ1s5L/4lm2xgfiqy4WUF6R6?=
 =?us-ascii?Q?B96nmxzBsCu26dS1JSK6o4wfm4cg3yJYn3dF+D4B27NuAXDwCTXls/zXqogI?=
 =?us-ascii?Q?NW2+LSgnLRKqlttESuJuzHrIeMf5D2pIOsV0Ny72/k2zNSnckrAPzIY9WAqr?=
 =?us-ascii?Q?oSKsncRB4uQnipHk8070B765NPGD98CV7mZmOB+zWFIIJBaZgv5q+d3GiSII?=
 =?us-ascii?Q?ASH6SdnSEeMrTfR6X1SKHx4QlSSinDAeN0ncQUH+tZ/ponQFdkIVNLaurfD+?=
 =?us-ascii?Q?vBJiSqRgPQQNeYYrYlLz8InbEFznFjRZevi5JRv85GsqvR8wLPNTly3YgR/i?=
 =?us-ascii?Q?QdM3S8lIGH7FM+/Ugy1FGoDxomWL1KQltjfJhJukoto88m9oNIWJdmzInxtq?=
 =?us-ascii?Q?JHwnXkauv+fflUW47g3vC3VgBw3DeJXEo9rfvfCF6nmI4yfelki/5DLwSvUH?=
 =?us-ascii?Q?oj3D2xff6iO6+U+Qf4BG2HMeB0+bazCQUZaw4bctXRcN9SuXXXl5wa/o+B0N?=
 =?us-ascii?Q?n/YPq83lAx5shicBevGc4FUjpWP0qfZ3rR8y/D4scfJ+98SM/+UA71jj6aRe?=
 =?us-ascii?Q?xlreeeMPyAYIWPsuv4+sR542GMmTmUPVmXLQTTWv8dyKLx0TkvKjPq+MevyB?=
 =?us-ascii?Q?8NQ5AjFiNE+XlAD7qRr7kxg1o9Y1jCR5e29O0Aa11eu80HomX3JYMXUhnbtg?=
 =?us-ascii?Q?Vu9pyQ2y1KIvvAOo2YXuZo8sqS2uu185HC31GDttoLgYzg/djXTxFU4VzCk4?=
 =?us-ascii?Q?eR43Xgc0dNOx/8li1rRtAQ6deF2j55hcIr9UxC58QnVv/JdU3q3HAcEEdq4f?=
 =?us-ascii?Q?PTi0n18xV9+/hogR6LwWlOFEsqmumrfe498HaVuiGhKgSH3cCrcA5KSwmpr8?=
 =?us-ascii?Q?rMe1oyuodeQtfvONPb1oWT8CbW9ldJrKn13+X1VCETHHpZW1dI/WGuD6ve10?=
 =?us-ascii?Q?1cnE6QDaLnKoN5XkvuiRumYqWbR0ELzw3lRxmg9QARKBSisRkyLLTCbG41DL?=
 =?us-ascii?Q?4fQy2sekUIMgQvAFc7yLnPyl8tChLxmaX4F5a5W2iNY/qdWpKu4ubXZ7HW1P?=
 =?us-ascii?Q?UH3nt6BbOj7pDjF5IHtUdMGDF0cEfn5MpM35u4DXRHbMMPo6MwLcpvHPjywF?=
 =?us-ascii?Q?tD0mRk9VLzNoX/Y+OxyHJVOuaV2EF+P5f5tw6x88oz4Rw53EwF30PZAr6Thh?=
 =?us-ascii?Q?RqkQLfxxHg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa24b52c-f70c-42e5-d7b7-08de73f78d67
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 22:53:40.1623 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hz0NY7Kf8993DeleufGM6So8i7S/JWb3d0iUV+/20OKwW6QVw/NYe3vQN0ZqCz9fT+7x9X+unzsT1k2gRmIGpg==
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
	NEURAL_HAM(-0.00)[-0.882];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,reg.base:url,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,nvidia.com:mid,nvidia.com:email,reg.limit:url]
X-Rspamd-Queue-Id: E0D2218DBFA
X-Rspamd-Action: no action

Add first_usable_fb_region() to GspStaticConfigInfo to extract the first
usable FB region from GSP's fbRegionInfoParams. Usable regions are those
that are not reserved or protected.

The extracted region is stored in GetGspStaticInfoReply and exposed via
usable_fb_region() API for use by the memory subsystem.

Cc: Nikola Djukic <ndjukic@nvidia.com>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/gsp/commands.rs    | 12 ++++++++-
 drivers/gpu/nova-core/gsp/fw/commands.rs | 32 ++++++++++++++++++++++++
 2 files changed, 43 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/gsp/commands.rs b/drivers/gpu/nova-core/gsp/commands.rs
index 8f270eca33be..c31046df3acf 100644
--- a/drivers/gpu/nova-core/gsp/commands.rs
+++ b/drivers/gpu/nova-core/gsp/commands.rs
@@ -186,9 +186,11 @@ fn init(&self) -> impl Init<Self::Command, Self::InitError> {
     }
 }
 
-/// The reply from the GSP to the [`GetGspInfo`] command.
+/// The reply from the GSP to the [`GetGspStaticInfo`] command.
 pub(crate) struct GetGspStaticInfoReply {
     gpu_name: [u8; 64],
+    /// First usable FB region `(base, size)` for memory allocation.
+    usable_fb_region: Option<(u64, u64)>,
 }
 
 impl MessageFromGsp for GetGspStaticInfoReply {
@@ -202,6 +204,7 @@ fn read(
     ) -> Result<Self, Self::InitError> {
         Ok(GetGspStaticInfoReply {
             gpu_name: msg.gpu_name_str(),
+            usable_fb_region: msg.first_usable_fb_region(),
         })
     }
 }
@@ -228,6 +231,13 @@ pub(crate) fn gpu_name(&self) -> core::result::Result<&str, GpuNameError> {
             .to_str()
             .map_err(GpuNameError::InvalidUtf8)
     }
+
+    /// Returns the usable FB region `(base, size)` for driver allocation which is
+    /// already retrieved from the GSP.
+    #[expect(dead_code)]
+    pub(crate) fn usable_fb_region(&self) -> Option<(u64, u64)> {
+        self.usable_fb_region
+    }
 }
 
 /// Send the [`GetGspInfo`] command and awaits for its reply.
diff --git a/drivers/gpu/nova-core/gsp/fw/commands.rs b/drivers/gpu/nova-core/gsp/fw/commands.rs
index 21be44199693..ff771a4aba4f 100644
--- a/drivers/gpu/nova-core/gsp/fw/commands.rs
+++ b/drivers/gpu/nova-core/gsp/fw/commands.rs
@@ -5,6 +5,7 @@
 use kernel::{device, pci};
 
 use crate::gsp::GSP_PAGE_SIZE;
+use crate::num::IntoSafeCast;
 
 use super::bindings;
 
@@ -114,6 +115,37 @@ impl GspStaticConfigInfo {
     pub(crate) fn gpu_name_str(&self) -> [u8; 64] {
         self.0.gpuNameString
     }
+
+    /// Extract the first usable FB region from GSP firmware data.
+    ///
+    /// Returns the first region suitable for driver memory allocation as a `(base, size)` tuple.
+    /// Usable regions are those that:
+    /// - Are not reserved for firmware internal use.
+    /// - Are not protected (hardware-enforced access restrictions).
+    /// - Support compression (can use GPU memory compression for bandwidth).
+    /// - Support ISO (isochronous memory for display requiring guaranteed bandwidth).
+    pub(crate) fn first_usable_fb_region(&self) -> Option<(u64, u64)> {
+        let fb_info = &self.0.fbRegionInfoParams;
+        for i in 0..fb_info.numFBRegions.into_safe_cast() {
+            if let Some(reg) = fb_info.fbRegion.get(i) {
+                // Skip malformed regions where limit < base.
+                if reg.limit < reg.base {
+                    continue;
+                }
+
+                // Filter: not reserved, not protected, supports compression and ISO.
+                if reg.reserved == 0
+                    && reg.bProtected == 0
+                    && reg.supportCompressed != 0
+                    && reg.supportISO != 0
+                {
+                    let size = reg.limit - reg.base + 1;
+                    return Some((reg.base, size));
+                }
+            }
+        }
+        None
+    }
 }
 
 // SAFETY: Padding is explicit and will not contain uninitialized data.
-- 
2.34.1

