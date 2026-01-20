Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oI8HHgvpb2m+UQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 21:43:55 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D9A64B8AD
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 21:43:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1EEF10E221;
	Tue, 20 Jan 2026 20:43:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="pcjqvZ0m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010026.outbound.protection.outlook.com
 [40.93.198.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DF1210E658;
 Tue, 20 Jan 2026 20:43:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LUc8qOkZEO2aHTb8Xje6xS1n0qrZXlzLybjONTgpYCQXhw8zBZuJCBome9IZaTWOmq7NO4qosojrlgT61bFYKm1H79aLZHNnYxa2BVHdI5V0T0PqiqGa/lqTYUZTXCigNiexIplZZ6qfqFVUAu6qr5v6YmTfmCAeUI5C4DUNPh6w90Yi87qwCt2O1SoD62pVmfgdPN6Hp+OXAO8HHIdjJmEwPQ/3NUx0MjkngpohxAgwp7pBcdyEsT/uirTzDgZjk3kK+u7YygfH8kDTN1Ffq0HIn7azIsOhtfgDOb2yGqXBtHIcYaqQDzCcDhFOKMWy9Z0ukB3Utw6c+novNdo58A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nhJEbm334Y4mYLDLMaEKkpHpnXKWUl+ulNe7MV5HAkk=;
 b=nwoUDggYsnRLYBtiJRPrWrywxq28AaQC5RwOXyY4B6yNMS5SbAB+7SoUB/ZLDRsSV5ldB4imF1fSrkjrem6Hx/P6Scv06O4RcANGS/omDL23oFObxK0n+B6TZlTMWCQ2JefeIvfGdOAD5FX3/rcVnFMbLAuwSTukhkPDorHBySZegl5FnVBGowGg8l2/UYGV+iCT/+GY07ASyqUKDqRAoeD9ku9nXpoKAGMjiFtP8eDa9UrkFPj1vOKBaDlPDJejNndJZRAnVwXIlsVZVtJ9H2JVthR0iOaJbXYtHe3kXpOcls8JVfATBjx+1IZ2/8Vilr0SX/yjIr9GfjVoirOywg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nhJEbm334Y4mYLDLMaEKkpHpnXKWUl+ulNe7MV5HAkk=;
 b=pcjqvZ0mc/YWE+xlCFnH2tMvChftx4xH+oLYEo2hCBi0lVRePix6RE2TqbERl1fZ3WjL35qALytgenHKuB4Ru6eLM+vorL6uv61HGoZUjVkxKsFssFXUMSuUpGy6MqTd8U038gWBc7gKvXrG6EA5nQN8VmrbomGBS00BVDHU/4AonRhb2hf5qmpatNnWAVH1ZbrpPWRi3EpZnmr2etn/DwoEv7Ia3L7bhL28oONMzN/sonspssCyCLOqTXjGxCiVqv82q2S7/hVaonk+djnWnqmNSCgwRZcueAhialHhYO+Orprc0n5cGJxZ5HMmT08/+85/lpvqMNJ/ec4mIL4NXg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 PH7PR12MB6809.namprd12.prod.outlook.com (2603:10b6:510:1af::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.12; Tue, 20 Jan 2026 20:43:36 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9542.008; Tue, 20 Jan 2026
 20:43:36 +0000
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
Subject: [PATCH RFC v6 03/26] rust: gpu: Add GPU buddy allocator bindings
Date: Tue, 20 Jan 2026 15:42:40 -0500
Message-Id: <20260120204303.3229303-4-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260120204303.3229303-1-joelagnelf@nvidia.com>
References: <20260120204303.3229303-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR05CA0058.namprd05.prod.outlook.com
 (2603:10b6:208:236::27) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|PH7PR12MB6809:EE_
X-MS-Office365-Filtering-Correlation-Id: 99bf8f45-c2b3-4d97-57b9-08de58649570
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?muEdQROPK5EArplyVoWiZHTb8TtDET0mRzVd4VqaK/4gdDEm7DqYlLH+iz0f?=
 =?us-ascii?Q?+4Zatp1AfIYXwpBRjSYRUPyxH+Kwdx9VA1yziXYePyj2vRYSQV7VyE/dhbXk?=
 =?us-ascii?Q?kdPyE6JSsnKDaGCP4aIdm5KYY6wA1FF/mJahJcoBQg1+BzC4+1Lfi7JbS4YY?=
 =?us-ascii?Q?VilCV74wECXrK7jfDoKA+YLVE0BaEpfR8nxelzrY3ojFgOm/Swjj+KacRh2+?=
 =?us-ascii?Q?fK+ZH4FeimOYRSOgOzFLH/meDd20nLK5OHVp5B8uWS5Pqd3oLipc4rh2cX7l?=
 =?us-ascii?Q?xwh/KWjKrV03cN3RmWpp0+mklDV68OT5grX1uQm6y1KLOhcOFzM1KSLjk+ZC?=
 =?us-ascii?Q?/9A5lcuiAir+fx8bJ0Pf3jYcTWpiVqRbKx5Lv8MiflbDNjTJpYaAR6H3u9Gf?=
 =?us-ascii?Q?ppuxgjFTLuWyZJiDGHPgTkbL3/gdC6H6U0oSvse4RGcG1fkJZdTjburw3yKS?=
 =?us-ascii?Q?ScdHTck8XGWaJOXkp7V8G3BCUTdUNJKc6Ql/NOOte9y2B6wYUqUWtNUOyBHA?=
 =?us-ascii?Q?SwaWUouZukiNwuEmxuRfoF3CT5Xt/E9S260ohpo6lZcReoKjrOD+u+2slZTU?=
 =?us-ascii?Q?hu3jU+eE8xHlVxnlyFvS4Ok6Mhf/GU0X4vvFRKfpNQF6EssAJlCX1hu/vKHe?=
 =?us-ascii?Q?DlsVjZEDAFXxLaz39hISDw31QpGf1AQxlVH650x6hNkOpmcy87XyDMb8I2PH?=
 =?us-ascii?Q?qSk8auHK+hYYKWhdhmrsWAYfOxQ1NR3Dzh6jFGaAhNScFk9uwr2GWx3chyhC?=
 =?us-ascii?Q?vu0B2DjYKWKKCKSTme9fx38CP41slxOkdr2sKMvfai6hRyTvucMzGtjK+m3O?=
 =?us-ascii?Q?yHDcnfRbWy3IX3/fGjnM799eAxHoJxfo9etgAiYqMxt21d6JCSP3s8GCdmzV?=
 =?us-ascii?Q?u0LpMwG53FkgMyKpJ0dimJI2RUxtQVirOdvZy/KUokmN8H3Yxreo1xO6xrL7?=
 =?us-ascii?Q?t20ZiJHM6B0hf5z8YEVGCQjhGt7bb+NYWnPvDP8NDKiguYRaYA3yqbLA0F39?=
 =?us-ascii?Q?luKWTp12NqZttqYFtfzgR42BkWf+jX2Q7SME31kbFhC6JaWFniuzVtFahPze?=
 =?us-ascii?Q?d4V1tTCeIAwflJvPoct2+7eVYMJtLcl3/eBXGaCwKTC2x/Cvprwtg/pClkL5?=
 =?us-ascii?Q?cJrCDG91cgx+huJD17h6TcqceatkgNAKzq9eJUwyUJibSaBRPM5gVS/b24i4?=
 =?us-ascii?Q?lIhRNYw9g2riWloeT6orBWhDvFtbJUSFU9U0uUQ6sxSScr3IX+UdbNRk+F2m?=
 =?us-ascii?Q?o3MoFBxTBUg2ijjPPc9q+FyGFikvk76W8TAdlAVFUnvo2F8D1NrZPu9uieUX?=
 =?us-ascii?Q?2zptcWFaOpOs4nTjYWGIAdDZviv6v9T3iHDweNAQiZdz1gbDvoquJLcijxju?=
 =?us-ascii?Q?47cwvxXki/N8XiIG26GNl1FzV12PWk/rIcR0lBaLZP/75A1Ipy+rFpoxFx00?=
 =?us-ascii?Q?XSnT1tN8AY2lDs3Bnrq8xRpU68HNsd8zrL4fh6C4YNwaUphvylqi/BD/lTyj?=
 =?us-ascii?Q?t13PYngW8suzEu4csAYsEOivSjP3IDCnLuqDZVr101kfXB7dmPueJoJ524H3?=
 =?us-ascii?Q?ZjEIW8QzIF8endsdUMg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Y6rO84NO4Y+ycmIWLKe8nBV8mUkKUjucgWPZ/0DHbDKMLn6EgFLMkFT9eq6V?=
 =?us-ascii?Q?1OHwLYW19YQN/w/Fz/7hM7HD4ygZjRja9UmtO0gTOqoBTjZn9AVhzmizcJKE?=
 =?us-ascii?Q?2w5kh6ywHNfIzaMp/yuSYVbF43lT9JvWZ12m0KY8+20/18d7sIcGBM3nGocY?=
 =?us-ascii?Q?M2u+LXI51UQwRVbqGJuQCMIDD+mBYrg0AFWg0kVrJwHNCwINmic1hmI9d/RI?=
 =?us-ascii?Q?z+MC/U3AdojlySv/Izr89hAdKC+MlJwuR9Rt0ekhiDlssQOCb+ErvHRAJ0YE?=
 =?us-ascii?Q?ZZ1NpyE1lycUcmecQr2JoO4x5d0MQVSNdOLJqPvw/fxb8JQjz9fR1IfuLCHc?=
 =?us-ascii?Q?pA4IPjBdA3J325/MDApWulH/Eyn3L6KKPYwTCV07SQ2UdwixAI/wrBYcQJXn?=
 =?us-ascii?Q?1SdMGvxtUKnbdH4o2L5OcYR6MjAYatmtihkkZ1h2oYQStRq963PkhtAvLJ0n?=
 =?us-ascii?Q?LXr4WtNa7UtfHOZibOO2ox1mQRwgOtWfwxSUFcGp05qDBRZidj3mUPeMWkLr?=
 =?us-ascii?Q?ssi2kGuCDPlrhOkvgnASbXHn69xvSwrDdrfmXbi8S3H7bDpbjQv1wUvdvvxX?=
 =?us-ascii?Q?l55d69d44F3VqwBodcI9DCfFd19AiOjwTJ9qU6k6edT6LpBwK2zp4KtiONAV?=
 =?us-ascii?Q?sGf1HJD5fUXwzbMruJT+sy2+5Je0AxEOfmQzHjN6jCj8Czuk8PhebI2Tl8TY?=
 =?us-ascii?Q?J4IlnNhB0o2/EheaI3GHtrkpEdZk1K520pdKQAZMH0STfcupr/MxYJp6XT1X?=
 =?us-ascii?Q?922W256pCQJbRHq7e/VuaQInI506O4SfStFIoZsAepW09GCmWJL47dbFxM3h?=
 =?us-ascii?Q?LvyKj+JLdk0QYS4YiGQcW8Kv2zSyEqCVvmpyLqkNwcoK0jptkJIl3pi01l/d?=
 =?us-ascii?Q?Y2VqWv5qyObVZFQS2G6G6h4mhXoX74JfyHlPRCmziMctb0qJyQ9p1HBInk0v?=
 =?us-ascii?Q?4EkoRSqWIeRWz2w8N3vN2ekqsiM+fzShTjZT7j9vsQhHoGvVa/JoA7G8inni?=
 =?us-ascii?Q?unuE1mhkFJ/+uftLZTBv7vNhjuZqf9w+Qir16GaI2t+nbEtl3xoY4tpRcxzo?=
 =?us-ascii?Q?3TAOzzYcjXqDMQuAhUlA1YTyzqLXP14c3LotyLzyAslYTYiLPDi2WTo1j4Ia?=
 =?us-ascii?Q?TgUEFJ10hktceUD32e8TnwFDfuy62S/FhsvS7JSNRE/fvmXIdAQYljCZuKa9?=
 =?us-ascii?Q?wHI1TwiDDH3Q9bHaJsw5gn9xvkZ+UZJxZWpeAN6ypvK/DXDgFsakVPK7oZa5?=
 =?us-ascii?Q?+7/UFsNe/RB6fk71++tC/T3c7OXjQ0oupS8Kd6XFd/vnAeAGoOHHeVkCucWZ?=
 =?us-ascii?Q?5AP/APmo9xT06loeHE108AqQuo+QkGD1mzckOewzE3M2Y2ek1MK/qQ8dKleS?=
 =?us-ascii?Q?5iQ+04d8PoT35jTiswgf8tvhQb0MKvq6fnQHx1usGdegHNMhJKmVBzktTJsU?=
 =?us-ascii?Q?TH3b74gpeTBH2rY2wX94WcwEJp6dTSp2qioHL2Zpa7KDHSmXbAcok8Z/kvUg?=
 =?us-ascii?Q?f9//FT9jA+pScIuOu1bDUgBcuj5oAx0XzWmzy6DrebVcUVDZFy5x4+51Bdgw?=
 =?us-ascii?Q?wnItfbmkLdqQmwoG5r/5ey5yh86NAg/mbH/r4pusVmobu/AdbDQ2C+fwz8Sq?=
 =?us-ascii?Q?pj6mgXcM3k/MN+TUzjyLZiX2lWwWHjpda95x/s7He2m6+dtxWmwmS2m+eNiC?=
 =?us-ascii?Q?bv89cqOUOoGcmCGPn/F36qr0aoiwfUUT0i8NKzRhDMn8V85QiEUlz+VFHdBV?=
 =?us-ascii?Q?FPqhiMsbzg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99bf8f45-c2b3-4d97-57b9-08de58649570
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 20:43:36.5025 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EmGYFkBv7ILBTjFjVnMGEtYlN4KgkwC52DcvC3QhQgF2uhYIjcELjlZFH+snBpi0GBh6sMeCZut77s3xo+HHXw==
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
X-Rspamd-Queue-Id: 0D9A64B8AD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add safe Rust abstractions over the Linux kernel's GPU buddy
allocator for physical memory management. The GPU buddy allocator
implements a binary buddy system useful for GPU physical memory
allocation. nova-core will use it for physical memory allocation.

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 rust/bindings/bindings_helper.h |  11 +
 rust/helpers/gpu.c              |  23 ++
 rust/helpers/helpers.c          |   1 +
 rust/kernel/gpu/buddy.rs        | 538 ++++++++++++++++++++++++++++++++
 rust/kernel/gpu/mod.rs          |   5 +
 rust/kernel/lib.rs              |   2 +
 6 files changed, 580 insertions(+)
 create mode 100644 rust/helpers/gpu.c
 create mode 100644 rust/kernel/gpu/buddy.rs
 create mode 100644 rust/kernel/gpu/mod.rs

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index a067038b4b42..940b854a1f93 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -29,6 +29,7 @@
 #include <linux/hrtimer_types.h>
 
 #include <linux/acpi.h>
+#include <linux/gpu_buddy.h>
 #include <drm/drm_device.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_file.h>
@@ -144,6 +145,16 @@ const vm_flags_t RUST_CONST_HELPER_VM_MIXEDMAP = VM_MIXEDMAP;
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
index 634fa2386bbb..6db7c4c25afa 100644
--- a/rust/helpers/helpers.c
+++ b/rust/helpers/helpers.c
@@ -29,6 +29,7 @@
 #include "err.c"
 #include "irq.c"
 #include "fs.c"
+#include "gpu.c"
 #include "io.c"
 #include "jump_label.c"
 #include "kunit.c"
diff --git a/rust/kernel/gpu/buddy.rs b/rust/kernel/gpu/buddy.rs
new file mode 100644
index 000000000000..7fb8e505ff9f
--- /dev/null
+++ b/rust/kernel/gpu/buddy.rs
@@ -0,0 +1,538 @@
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
+//! let mut buddy = GpuBuddy::new(GpuBuddyParams {
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
+//! // Base allocation params - reused across tests with field overrides.
+//! let params = GpuBuddyAllocParams {
+//!     start_range_address: 0,
+//!     end_range_address: 0,   // Entire range.
+//!     size_bytes: SZ_16M as u64,
+//!     min_block_size_bytes: SZ_16M as u64,
+//!     buddy_flags: BuddyFlags::try_new(BuddyFlags::RANGE_ALLOCATION)?,
+//! };
+//!
+//! // Test top-down allocation (allocates from highest addresses).
+//! let topdown = buddy.alloc_blocks(GpuBuddyAllocParams {
+//!     buddy_flags: BuddyFlags::try_new(BuddyFlags::TOPDOWN_ALLOCATION)?,
+//!     ..params
+//! })?;
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
+//! let allocated = buddy.alloc_blocks(params)?;
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
+//! let params_4m = GpuBuddyAllocParams {
+//!     end_range_address: SZ_4M as u64,
+//!     size_bytes: SZ_4M as u64,
+//!     min_block_size_bytes: SZ_4M as u64,
+//!     ..params
+//! };
+//! let frag1 = buddy.alloc_blocks(params_4m)?;
+//! assert_eq!(buddy.free_memory_bytes(), initial_free - SZ_4M as u64);
+//!
+//! let frag2 = buddy.alloc_blocks(GpuBuddyAllocParams {
+//!     start_range_address: SZ_8M as u64,
+//!     end_range_address: (SZ_8M + SZ_4M) as u64,
+//!     ..params_4m
+//! })?;
+//! assert_eq!(buddy.free_memory_bytes(), initial_free - SZ_8M as u64);
+//!
+//! // Allocate 8MB without CONTIGUOUS - should return 2 blocks from the holes.
+//! let fragmented = buddy.alloc_blocks(GpuBuddyAllocParams {
+//!     end_range_address: SZ_16M as u64,
+//!     size_bytes: SZ_8M as u64,
+//!     min_block_size_bytes: SZ_4M as u64,
+//!     ..params
+//! })?;
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
+//! let mut small = GpuBuddy::new(GpuBuddyParams {
+//!     base_offset_bytes: 0,
+//!     physical_memory_size_bytes: SZ_16M as u64,
+//!     chunk_size_bytes: SZ_4K as u64,
+//! })?;
+//!
+//! // Allocate 4MB blocks at [0,4M) and [8M,12M) to create fragmented memory.
+//! let hole1 = small.alloc_blocks(params_4m)?;
+//! let hole2 = small.alloc_blocks(GpuBuddyAllocParams {
+//!     start_range_address: SZ_8M as u64,
+//!     end_range_address: (SZ_8M + SZ_4M) as u64,
+//!     ..params_4m
+//! })?;
+//!
+//! // 8MB contiguous should fail - only two non-contiguous 4MB holes exist.
+//! let result = small.alloc_blocks(GpuBuddyAllocParams {
+//!     size_bytes: SZ_8M as u64,
+//!     min_block_size_bytes: SZ_4M as u64,
+//!     buddy_flags: BuddyFlags::try_new(BuddyFlags::CONTIGUOUS_ALLOCATION)?,
+//!     ..params
+//! });
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
+#[derive(Clone, Copy)]
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
+#[derive(Clone, Copy)]
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
+    pub fn new(params: GpuBuddyParams) -> Result<Self> {
+        Ok(Self(Arc::pin_init(
+            GpuBuddyInner::new(&params),
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
+    pub fn alloc_blocks(&self, params: GpuBuddyAllocParams) -> Result<Arc<AllocatedBlocks>> {
+        let buddy_arc = Arc::clone(&self.0);
+
+        // Create pin-initializer that initializes list and allocates blocks.
+        let init = try_pin_init!(AllocatedBlocks {
+            list <- CListHead::try_init(|list| {
+                // Lock while allocating to serialize with concurrent frees.
+                let guard = buddy_arc.lock();
+
+                // SAFETY: guard provides exclusive access, list is initialized.
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
+                })
+            }),
+            buddy: Arc::clone(&buddy_arc),
+            flags: params.buddy_flags,
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
index cd7e6a1055b0..d754d777f8ff 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -98,6 +98,8 @@
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

