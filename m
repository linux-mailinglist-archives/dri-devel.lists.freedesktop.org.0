Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QFYvCEHpb2m+UQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 21:44:49 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0E114BAD8
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 21:44:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8384F10E6F9;
	Tue, 20 Jan 2026 20:44:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="NydVoLgG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012043.outbound.protection.outlook.com [52.101.48.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73DD410E6EA;
 Tue, 20 Jan 2026 20:44:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QiXh/hIfuVXjl0/bB3Di49zx2npXJ3f2E9DvG56W5Z0xmdjSr/CvIFoe9AIFBxGZPSL70/vbTIVKRz51RcrC1feiCjNSfXCQixoeL5iE86OfBQbJKfrxMAH0xCdt3IwZF9SSbRycgSbTOm8TxuRwBD5L+WkEYIDCBtge61Sv98h5d6pW7IOZhO35tFPfEjJOEO0Af/wsxUn0Hhw3bxSbSNS52Pv+iXUA2TKwqwkJDeCuONuGFzKUCYMj2Vv8KXnt0zrPBS3VlHq53bCmnK2o9sd5jQRuMr7o62GDN2vUVi1LnalyeBDcySGTxFxOKEyq4CD2mSv8Z+Basr6LjaeRpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nulEOsZpSeXJ7Y5H4Pmyy0krRZ8hN+O1WrImhGyRv9k=;
 b=oZfemtkj6Y8y1pIdRDzYX4mjqvFfeWdpHb5BFpKlALyyTn/d0QbdG1atDgO0ihDrjp4rGaMyS4A2/cQ0PVgV3RAne8GW+pxQkGwPO1a8f8Efh2P/82wAejIBtgHY4oX2yuAR3eReteQxiM/rto0oHM+rkxfpNkvO4GpSJhIxQjMNXO3vE/wYWy9XDhJluAs6DgJ8ycyu7CWZM+WPcvhkGGz81Mhe9fw74TeIYMPhnnNg6BLH9uVSOueM8wwA35da5I+SdmYI0DS/4mieJBW1PT+A820bA9wXNSFZ+YUfqL/xEAVkXodQN3ktugP6f01F+pAT8YBBA13xeLg4//Amlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nulEOsZpSeXJ7Y5H4Pmyy0krRZ8hN+O1WrImhGyRv9k=;
 b=NydVoLgGfZ8oQ7xYLmZvQdNBjKweF6uTnLlyXoIpjuKUUOkX5QKoHReBt2MIPe3mP+72QMuLqGP5uAuCAqtqasVqf4w5yvX2DkW3Rai9Zayw+4Ic4D23aQHPUdnG5GJFjjig6mhOBQemxgfnGCO+SpBJmiJNUJIUUobu8C1AkUBmy9InIOUDI61a8AFhlAk2AWKwS9qSRkBwzwzRARq3gTqswmheQnhCYZcn6w5y4d8Otbu/7rJJGsclpHFZO9nViw+Nz8cb7F9RyTg+xpMrXbOJ+8kTMFBfFtc0r+CKRqdGjpT/YZqdRaNkwwUJ2SXGk7eQqPryqJ855nw7gjIq4A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 CY1PR12MB9651.namprd12.prod.outlook.com (2603:10b6:930:104::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.13; Tue, 20 Jan 2026 20:44:32 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9542.008; Tue, 20 Jan 2026
 20:44:32 +0000
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
Subject: [PATCH RFC v6 24/26] nova-core: fb: Add usable_vram field to FbLayout
Date: Tue, 20 Jan 2026 15:43:01 -0500
Message-Id: <20260120204303.3229303-25-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260120204303.3229303-1-joelagnelf@nvidia.com>
References: <20260120204303.3229303-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0097.namprd13.prod.outlook.com
 (2603:10b6:208:2b9::12) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|CY1PR12MB9651:EE_
X-MS-Office365-Filtering-Correlation-Id: 923f5975-b2f0-4087-889f-08de5864b6e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?MyLVl2DzY00W+YqekWO3Zyh3RWpVxF7y5FcX9zyfHOyB15CCH/M5WVYZIpiP?=
 =?us-ascii?Q?+tL4o8OZpdwIwTtUSaQl1E4gIDwB7Fqs5QgObQ9y7YXJU+D4PBnfSKPO9v/u?=
 =?us-ascii?Q?GFRrirfUJtKQ4lorn82YXq6vKna5QbTOASL/Hvi5sEhVwYynQc4OgzY70vns?=
 =?us-ascii?Q?i3q6xnnDtwwA5Voj+7pzQun22pVOhBKqNYwuAfjVvrBkj/htuNGPTE0USIFB?=
 =?us-ascii?Q?Qe7+2sYLCI0ywMNJR5rpZqvDLAybRmo1KJG/a5ND9MMvBhOfIhTMvg3FQ9Tt?=
 =?us-ascii?Q?r8FxrYhfqJGLT9jnUFX2vdXAt4azfU52/Q2J3Pnlhtrptc9sbZlaRCP7ZoFc?=
 =?us-ascii?Q?cSyYMZqlIEwAC9hANiB7vzCbD9HXLwyWexAlASrwhz9yo1/5jJHbOvpzRJrC?=
 =?us-ascii?Q?FFKadBh7HpHvmtnGhT8qiUHwvgZiaDSxsWS8q99t9u8J4MgRlCIYOazFMjBq?=
 =?us-ascii?Q?kA6j62GN5qI+onLngHDjuVOo4oppzIFXqmBFKoLJg0tpeADaCHx9j58hRQ2a?=
 =?us-ascii?Q?7jqRdZ/p2gTEP2ITb44+xpQ1F9dGzcnYuHCi+cUujg7IVh0JsEgonWMviDmX?=
 =?us-ascii?Q?7moxCHxK1hmcwSDbaSo1AMnW8enIuBvpL3pixhL2MCKDu0KoEYzV+iABHPt/?=
 =?us-ascii?Q?DI7YQ39tdC75aCf9L5y3WyZIRxNZS2oeUMSk34gEIRhdicR9vApuDIkzmbx2?=
 =?us-ascii?Q?/kzZnJ0fXt6OSihh89bx9BxpSN8Q0rXdz2Du9Jx/ChZEKoLE2xyeb19R+hDr?=
 =?us-ascii?Q?u0WFZ57bhaalDMSAD4shydIUio67PEtH5rDQieecE+cxdakhpTXf2IwKfeiP?=
 =?us-ascii?Q?VzrZ/sMjG4DKXH0XPjd6BM2Mdi5JGwuutaVMtGvJU1U0+ENKweK7OX7NMSqb?=
 =?us-ascii?Q?3IfxPus9sX3ZBCcm0W2yERGl22UZcPPL+DGzE7QQUSsLg3qkcs3kwxhJcaT8?=
 =?us-ascii?Q?j1yKG51z6bIuwpufXDLMXxNdC/ft3UxSAfugXtnUvuzTrt9eSyjFAIp0xiV9?=
 =?us-ascii?Q?xksv74FBLmUMgLQvKMCDKtmLwjN2QyGEy7JwPd4w5+GRHfiE4hFkjOsdt68Z?=
 =?us-ascii?Q?SUBvjw3wfBYvLRapmlY2xQKHUah8OtoIl8zfi5ESbfChY0HurXqb05lwgtmp?=
 =?us-ascii?Q?Xl/thFY7yQrBhxULp/Uno6H74bqAxNVSmC9CVQyVXMx1BdRoRFi+NHogESVG?=
 =?us-ascii?Q?opeRFogM/M6noL01yTSsVZFdEdTMZAI9nETGikAJQxHLFSFXMNzxwLmWz9Zp?=
 =?us-ascii?Q?jl6ZCnZ06FqatKpgIinaqeNPYnCshFjGUGb5JcjU5e7oIaFCDudIKycDr1r/?=
 =?us-ascii?Q?67TARJjHrzOSlzCSWLyjzuRJ1GmEQ2hA5yPpRkkQSbvOclOO1aufuKB4UcoZ?=
 =?us-ascii?Q?9aq9MxzHcBv9ARSa7rcKFmPS/F/TzfQ2vNDCM8scYCuLGY2to62+wpyf57Xw?=
 =?us-ascii?Q?WJ5/gQZMUtUhbXEhK1g6frb2wNzjovwt8zd4b0OlIsock83fiytIZIEuzeyJ?=
 =?us-ascii?Q?TyaGGrw/7+9Bnwc4LZkNb9/dUGzHEU/4FtJOlcyu7RiE2BUmKqMZwR5ZM2+5?=
 =?us-ascii?Q?JYYiB9xT8ZWQIqE40yU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dX9lmpa0iuV3uA4IBHFB9Ls1rJR6fpnr+MIWVaGidgfsaoYlA5JfWbiWTLob?=
 =?us-ascii?Q?fRKup65M+Up4p+XRr7zoA8Dtl+NEqM6GCi/oVu4BGczQnDry5yfNtY5cR76M?=
 =?us-ascii?Q?+8PemTPtavonlalXT+p4WBF3yxNcE7rT1Tvhfx7HCr2lf4mNKTcjQMEQpJY9?=
 =?us-ascii?Q?B7setFPU7vbIKidKQQDRq5WsiSdQxpCX352HIn6ojfA1c1szY53SqDiw0IRE?=
 =?us-ascii?Q?TIc7cuCTW6Fvq2ye5i+p891gClsrGFMFFmkqgqxrPJLM6d5fuz/iJZgGQKnP?=
 =?us-ascii?Q?CaCaGd3bPkra5bs8tn+1EXQPQoFM/fIzF8O2RTtar3mcPngYF8aBrTbIIYhC?=
 =?us-ascii?Q?99VrlNvWYIle4qrqYALI9u/FkWauKuOHsKAcl8QiKBf4dqh6S5QmTbj4O/Hs?=
 =?us-ascii?Q?7fYRSTgTkpJ17dERvrkn9zt2hjunpi7fUqEwJSb3yVousi/9fZNgxIdR4Ljn?=
 =?us-ascii?Q?TBe/nECfAIISnJL9j5uSWhrUdvWqBtMj6MT5cICJ0xSOhJnqFeiqhMvHGL6Q?=
 =?us-ascii?Q?8ch7qIN++O+Zo1xqm3nWqexsijrkggYm2dHuLPHoG3AJpQs/yF+72mjtGQKm?=
 =?us-ascii?Q?FQbI0rn6A8L4RbmW990WVxMkvja3fsvwaPb+GhMvhRgxbqR8wAKJ5ln1PV/Y?=
 =?us-ascii?Q?jZSkegjpwcwO0L0xa9ptPWjS/nq/Mje4qB3np4cDaTbShOZWlBqOSSFUNgYM?=
 =?us-ascii?Q?9BB/mK5uqXISThq24RV6b//lg5hbdP6Tb9ORyeMbGWRIDRS465f4QweMOSg4?=
 =?us-ascii?Q?s4lIu8jy4SXdXcytg2O3WalFqxgv3hz9bzWQc/X+gQeCDM5NVaZIncK0y6Wv?=
 =?us-ascii?Q?q56lAq2cgHmK8D/bIBbXPaQk/40G+QENnr43htc/dwazHoDftY8o1Oq5gCXC?=
 =?us-ascii?Q?2cTIXgq/aPXnQSNaTnnKhJfjLjJ7sx2ajQhssAwNgX0Nk8WGU+UBa6jAgKjo?=
 =?us-ascii?Q?ZjGzBnblrhMlh+PdF/JYpmvTMoP8S8pF2M+8jtjOfhLEErM4vOnhQOben2QZ?=
 =?us-ascii?Q?fAMuiJunFrNJPBB9LfxMzxHRBd772WOHSjQ32uL+SbPN0JHWM8zHeAhlVcnq?=
 =?us-ascii?Q?vc3TE3uv26hHK89jOc8r/kLxUMzx+wvwfvVg91CH618Hdg6mDbAI0Y9WJp19?=
 =?us-ascii?Q?NoAybl2nmPGh301zUu9t4L9zIf3u20HhOQE79Zr1ke0BIUF+37/4jzP0z8/3?=
 =?us-ascii?Q?e4dXOJ6sN9vVgGmedwuZC6P4yIFFd7WO1YJdvmzrQ9qYAlQUFBgmla3fHP2X?=
 =?us-ascii?Q?N0CYE6Dy6Fy1Gm8X0r90Em3gbNHN10XdNXtCXBmVylw7JBAyOml5jYbR1Vzq?=
 =?us-ascii?Q?i87bzyMA/a9E11ApAzRNVbkXnSuGVhJcw+TYFuObFJFLnxFbcymz+yemRBZp?=
 =?us-ascii?Q?9F+OdX+Pcd0jCW7kaDO+BZ8aHPuIt2t4abf0wBbcci+viA5V10Q0x8dC7vEl?=
 =?us-ascii?Q?3+J/+c+vSbd0NVIZtbKjM78u8BYPvONI0pSOKgLYVeFuL94tuVfNLVSIF7UR?=
 =?us-ascii?Q?dbfBmrh8jbh405mNBNN2fDqfo8EttDZ6T40wGLIdcPkNgTPtrIpwpXSBPCbF?=
 =?us-ascii?Q?VU7jIKtuRRakcNyO9WSgG2EYoCxmUPuf5/9L2zAxnooYi/KlYUV//ha/+sKg?=
 =?us-ascii?Q?GHbrJqeBmmU8zFXW5n5Wdj+BZbSl3UCmE/ZprMyJShLsMtf040/4Mn1hsJ4q?=
 =?us-ascii?Q?FZCE6XZdbsyfcJ+CqNX/68ijzEcTXgUYvxl51rP2/FRGlLib4hsisw6CReal?=
 =?us-ascii?Q?EMTMHuY4tg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 923f5975-b2f0-4087-889f-08de5864b6e2
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 20:44:32.3394 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2a7NoyYxJw8a5rEhbUmX4+c0dKj+QYWpNOje01600O43glKtA2sTrJiPKdzpGc4WiB/PeFEyYaHA7Sj4N3ix0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9651
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
X-Rspamd-Queue-Id: C0E114BAD8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add usable_vram field to FbLayout to store the usable VRAM region for
driver allocations. This is populated after GSP boot with the region
extracted from GSP's fbRegionInfoParams.

FbLayout is now a two-phase structure:
1. new() computes firmware layout from hardware
2. set_usable_vram() populates usable region from GSP

The new usable_vram field represents the actual usable VRAM region
(~23.7GB on a 24GB GPU GA102 Ampere GPU).

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/fb.rs | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
index c62abcaed547..779447952b19 100644
--- a/drivers/gpu/nova-core/fb.rs
+++ b/drivers/gpu/nova-core/fb.rs
@@ -97,6 +97,10 @@ pub(crate) fn unregister(&self, bar: &Bar0) {
 /// Layout of the GPU framebuffer memory.
 ///
 /// Contains ranges of GPU memory reserved for a given purpose during the GSP boot process.
+///
+/// This structure is populated in 2 steps:
+/// 1. [`FbLayout::new()`] computes firmware layout from hardware.
+/// 2. [`FbLayout::set_usable_vram()`] populates usable region from GSP response.
 #[derive(Debug)]
 pub(crate) struct FbLayout {
     /// Range of the framebuffer. Starts at `0`.
@@ -111,10 +115,14 @@ pub(crate) struct FbLayout {
     pub(crate) elf: Range<u64>,
     /// WPR2 heap.
     pub(crate) wpr2_heap: Range<u64>,
-    /// WPR2 region range, starting with an instance of `GspFwWprMeta`.
+    /// WPR2 region range, starting with an instance of [`GspFwWprMeta`].
     pub(crate) wpr2: Range<u64>,
+    /// Non-WPR heap carved before WPR2, used by GSP firmware.
     pub(crate) heap: Range<u64>,
     pub(crate) vf_partition_count: u8,
+    /// Usable VRAM region for driver allocations (from GSP `fbRegionInfoParams`).
+    /// Initially [`None`], populated after GSP boot with usable region info.
+    pub(crate) usable_vram: Option<Range<u64>>,
 }
 
 impl FbLayout {
@@ -212,6 +220,19 @@ pub(crate) fn new(chipset: Chipset, bar: &Bar0, gsp_fw: &GspFirmware) -> Result<
             wpr2,
             heap,
             vf_partition_count: 0,
+            usable_vram: None,
         })
     }
+
+    /// Set the usable VRAM region from GSP response.
+    ///
+    /// Called after GSP boot with the first usable region extracted from
+    /// GSP's `fbRegionInfoParams`. Usable regions are those that:
+    /// - Are not reserved for firmware internal use.
+    /// - Are not protected (hardware-enforced access restrictions).
+    /// - Support compression (can use GPU memory compression for bandwidth).
+    /// - Support ISO (isochronous memory for display requiring guaranteed bandwidth).
+    pub(crate) fn set_usable_vram(&mut self, base: u64, size: u64) {
+        self.usable_vram = Some(base..base.saturating_add(size));
+    }
 }
-- 
2.34.1

