Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2OiXEArpb2lhUQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 21:43:54 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2A9F4B8A3
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 21:43:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5921510E661;
	Tue, 20 Jan 2026 20:43:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="IiIeYSsE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010028.outbound.protection.outlook.com
 [40.93.198.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8521710E64C;
 Tue, 20 Jan 2026 20:43:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XwxrqWnGM02P4gXmWTLZH1Su62m+JaFkCRQLdJpI4MOeigLkcAWFshd9ZCS9mzPzM2CWVpxsCP/bL6NWiWRhorDmc+yD2F3Y6224FdyntpFxI2zZRdaYleoMZ3swWaK0eG/66EL8hIMJpXAv2uE8wIxPlYMUApDiKOAXbBTTi00gJ4L4Zfz2DEONmw1DOFBSTWsdpzymRRcLykPmEGtwSCoEfGQFRUJBGKt7dbif0HKqfV2rvZN8ba7ux0672BgROnH4MCEz/v+esOE5F7BBuxCB0FXH/J8iA0XghdXhi39jVZWBg+XEkfIgOczeqwzVbQnTS8kMNKVp3CBfFEi7Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6ScqGeltuG1c0AbwJXdXDI8rVe3fvbpxPInfotw6cTc=;
 b=n+0KqJ3VQ0yBlBVZhUAFhc8DHBorVEZv6bZk1Y2mTZsEm7cX4qbR501cUNnJpCOesqFdEKR2OwSw9/5/OjgdWk1AXcmXapco5JulpAdtQgAVTEUfkTvl2hIfhaksVMoPAoqGWqv7z9bGZwhfGaVmH9XitmM+jl/Q7twHuPKCzCKYquvC6S7lbZw+CU/vTf9UmQkgJ0TfbFeG+Nf+F66rXO7SMZumTbqruMKhvzxowW25IlnYq83yt/G+AyOAwO+ssSB69FtuXxRESE6Ou6nkITZQfrg0arFOBCPvLYiv8qC1T93zualElZ56jvHU0oAsfswXT99LyxBNFFL6xjJbKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6ScqGeltuG1c0AbwJXdXDI8rVe3fvbpxPInfotw6cTc=;
 b=IiIeYSsEFTrr7gyuh0g9E4WstWTemK7RQmqdsEReTUK6b5u5o92saReMVcpJDp/3hV6XO9vI0iabr/GIJKA5Y7l5SvwpEvRtaO4nbYeftJUWdKZ/tLhBl2ID0HakYYoEtriNimrm+b3ZTUalrZP+unuSKElhVzxHh9krIdUB/Ls+bQC98weL5dqEz92VOVfY9aBQ1AQ4t7mZ3zA4UXMLtSLqhGmnEwZ+0iweNMUnbgryhkQngZsTV1NMS67LzlbjZK3f5/bQlweLEIt5QNAvzDyVyH1MMNGK2y5oxfgF+r8/kBNqFKngzxNQsgTHfdJEutlmxYKi4HLO3bhqXixu9Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 PH7PR12MB6809.namprd12.prod.outlook.com (2603:10b6:510:1af::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.12; Tue, 20 Jan 2026 20:43:40 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9542.008; Tue, 20 Jan 2026
 20:43:40 +0000
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
Subject: [PATCH RFC v6 05/26] nova-core: mm: Add support to use PRAMIN windows
 to write to VRAM
Date: Tue, 20 Jan 2026 15:42:42 -0500
Message-Id: <20260120204303.3229303-6-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260120204303.3229303-1-joelagnelf@nvidia.com>
References: <20260120204303.3229303-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL0PR0102CA0020.prod.exchangelabs.com
 (2603:10b6:207:18::33) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|PH7PR12MB6809:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e856023-86c1-432a-5200-08de58649787
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?lm4K6DUwAbMvzRumw9gaRmVjOxSC/vvwlafgg3SdY+QQs1Ux8j4KCMz2Y6n0?=
 =?us-ascii?Q?qzBgsl9jm9ji8UZ9U5dy56YFlsr9Kuo4BvE6Ckg7dk13z16D0Qmc83mXzb9W?=
 =?us-ascii?Q?gdiQu2mYvnr3NXCLigjXa/PpJoHbp74KWaIuSgXLwqZitvrYSmIZmDDxlO9l?=
 =?us-ascii?Q?2fHpX9HIKuXG7kC3YkKnNg/gIuC0lAjCU4ZUv7g3WLgy7lQ/rSb5OsOcUOuU?=
 =?us-ascii?Q?XN3H2+BdQxX1lmNdprqxVHO1GwQojRmU/wNbCvCMDZswgrbLWQtck4itIFLD?=
 =?us-ascii?Q?HdSn4fqR/sbhi2FTRGCIS6Wz1QwQfVtqJy9DAX/qGZ6UupKrg3TYqsyPQ3rq?=
 =?us-ascii?Q?/+UwVgnyXVRkS074N0/S9FeQ7reA7ywM0QdRHPQztHTF4+K/AqnDzlrFsF07?=
 =?us-ascii?Q?UoMY+Uf6gW4yPB+GGkP4gp1AHC1uoMMWPUZxYmsR79xJMFdAetYJWxySJQWZ?=
 =?us-ascii?Q?cvDw6iYPABeN2AOg0EBl9YYjL56XjRvo1Rh1BbVvAGog5sXsWxjOfC78s7zI?=
 =?us-ascii?Q?O38c55wlMjJPP8wwA4nu6GZaax7XE5OUEOOQ9KR5I3jgs38OxEsSBmzQuF/J?=
 =?us-ascii?Q?7OOEa5WOujLBP4d5nDwnxXsvZuhN1mFWAxtX0AW5mQygbBD7ll83pFxkohr6?=
 =?us-ascii?Q?0GAaXEaRON1N6QF4kSizGSbWlS0dGRx0hp2qeopICNydlRHghLSywGMARUNP?=
 =?us-ascii?Q?bN3aSJ/dloKQ0hhTN3UhRTDyIy/dwO4BLm2SzVmBrnXOOqP6XgBZnm98BpR0?=
 =?us-ascii?Q?EXBIklmONq48WDra3quCmAG+NcbQTZ9/KoVyrX0aDa7qK40qf6n01p82w8dI?=
 =?us-ascii?Q?AkW/4EZzhmfULQlU+u2YzR4E9E8E0hifihrUfGFw/3UykAEFM/JEk55ol2mD?=
 =?us-ascii?Q?AATv3yN45by6npnJBHrAm+olbCjxX84idpD+hivTEqvzQb95F2E/nrpUhInc?=
 =?us-ascii?Q?3OYkPq3Fcx9sJzZxwQ8K5Qxbp9JzmxUcSwH6GFedias/c1H1+ZtYXE0xVDPh?=
 =?us-ascii?Q?CkmoCIxzz+J39YfIi7PzDMv7QAODZ8or6ZyfNDt84YA+df/nk3EhYT+nXNt2?=
 =?us-ascii?Q?BOvcnhp0hzNWo+Sl2W7FejTOo42OaC/5C4C2Kzg3R7gu7NLuHdLWYKJ1DEmJ?=
 =?us-ascii?Q?jJ/5FxKo4wzmN5KLZ/6lgEin+LsRe6Ax7yUGJhqxXjZDeeddDCSWRJNeGTDA?=
 =?us-ascii?Q?vp2pFgHk9t4lAzExbdib7Umu/7r53N29UVI3Pbv4RrLrhLLKx2ns91KFYAAi?=
 =?us-ascii?Q?xo7X2vCw1mNt5fGQRbS0zpEQ34tz9jtEXegIorfKVGRpFF0FMWBEbqY01cQb?=
 =?us-ascii?Q?dQR/TJMpmtKbi8mGHYF5D7JFUQzLw3PLPZ4hAYsltUebgHxkgQow2DgD1mHg?=
 =?us-ascii?Q?rNUz/gTmquRe5XQ1nvty5UGF7fPWOR1yl0RmwOjuNF/ep3/ZK6NIelncNSFB?=
 =?us-ascii?Q?NfyL6L8aOWrM9Kiuq1dPEf6VK4C7O2588C6Ztpacz0cW1yhnMKD++AKMbBHP?=
 =?us-ascii?Q?yGZYZVj+IuWQFWQVXjijc3jw+llruGb9UYNsv88hgVbiGgPw4XnrMWIQFQib?=
 =?us-ascii?Q?1tlJkk3qUMYjAO8ZswY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8mSDmDOLL9uTHSldXQToVyMdpESTYzyo9Gt7a3ngQgG1uNfq9R+uV8FPeUZS?=
 =?us-ascii?Q?bFvYBFDimxn0Z7caQfb9ZtA2YD7Vv1pUz3rjkSzpT1eGpGsSTqC6QZZTBute?=
 =?us-ascii?Q?d/oMwG+iLI+tJQTFzM6LrlfZ9LT54DSfmgQFBYJmO0sNMIJmMTZFeII/I+ES?=
 =?us-ascii?Q?QiAoUB2W5nb0EnQc/yGmiE4Gs8aPCYvNHulghsx+i9hJfoIaM85hQ48SUPbc?=
 =?us-ascii?Q?n8bWKSsPOXKM6U3jRg6p8MIvONmoRNA42dItWx7zBRaRD5vqW1nFKeT9MwPI?=
 =?us-ascii?Q?esps8cs2hm5bDI2b4jALFhEvW4HDYEkMxtlTsJmKCTUHd2KRZIMySZt6MQFZ?=
 =?us-ascii?Q?N0VDrXNmTNlw00YE6OuL8ys5bNrOxxIeHipou265U6CXFKi496bug2Hu1sjT?=
 =?us-ascii?Q?fDocDOM+1m9DQpFNGMTC7S3lrBuR/39LzXvKQ8tarWPgBm4V7sIco5gV1WgU?=
 =?us-ascii?Q?BUjDn5AUQ3S+yWhxnFx/is0g/asCZOT8aw7yiDh++yAJBsWMX3tF92qcOj1k?=
 =?us-ascii?Q?pk7d5brtN+JsJ4E5I3bDPhOOKXPpvZ+j82ozg7/jhxWAvMmwp5HZAbhggtcp?=
 =?us-ascii?Q?xfNWhba38tH8RyUac6QvZbGhkisDyYMl+HnbzVQBqKYNv+foqMAfjWQXBImu?=
 =?us-ascii?Q?zX9gxm5v00A+oUtMhqxwj0YQbewe2B0TX7KnsIn5mQoc7Pw9NJVekHh4FtJX?=
 =?us-ascii?Q?m4Z7MpXE0sNyCi9AzGV/ax2szfG2gi8DGpRm7Kn20ComJwufyKZX5JjVid8k?=
 =?us-ascii?Q?cQgpgQTASlqWRZklHjSIptyqvpbwD41qJQGrHurz4togBbaBaQNe2s+nfQxI?=
 =?us-ascii?Q?2A+4jW6St3+hfYly03oTSWiHgVYLIVkNXEJyzH9m51JRaihgmMusFfqix59z?=
 =?us-ascii?Q?5jrL4A2qyxkEWnk5wiWqBRUaveHaTfwZwwi9qWcc1QW8kG9KiCmb5zX234co?=
 =?us-ascii?Q?D0UGe1pO8Irs1RoaeBybwHdr83I4FYbmAhV7yw9bwmH0C4QwONpS59vUYsr6?=
 =?us-ascii?Q?3IgEL4d8uT5HSxvIv2ivcQH0qYrIMZugo8RWhSU/9rYLVOXxiooW6x1Xua1D?=
 =?us-ascii?Q?OjwEUjqPl+T3tvBYzRPakgo+QfvAlRUkqVtrREX83bnwUzNKVtV4V3JSgyUk?=
 =?us-ascii?Q?OqwgfvbzccliAy/5x7LLd/WH4XLm5tmwVBoviVllSuBW/zHY56d0DDNvB5pj?=
 =?us-ascii?Q?5hFlDRNri8mxAjb/9XbM+E3vWqum/tbFf8F55QFbPJRBgnFN5UoW7FA5t3qF?=
 =?us-ascii?Q?7jVXhOcDp94PS45TuOB0SejRuPcTvmGzc9nFobELGI2JN8Rl6vQ4zOGvh/nx?=
 =?us-ascii?Q?CxFWs9eTyK/je+8fC2Auf1efiRbczphEIsUKynM4g2GTKtcS9lcBzjPDKf0R?=
 =?us-ascii?Q?JFWcQs3mBnCOzRsjKtW8uUxcz6BM3zIwJrjKOmStKZcrNvqnDaT2RRs6F4vL?=
 =?us-ascii?Q?XTK0NDGfwuOJYo2FjLvBNqSALxxOQPGKUEF1SsXinDDJSdh/08DKvVmYnHSO?=
 =?us-ascii?Q?EyAtnYWz/e0+b8SCEgvK5KGVKxXGUmJYfUpaYJNeuVaPGzQfw8sJpZ8af3pS?=
 =?us-ascii?Q?IBOT4gbvxc0F+tjRw3nXsk3EBPAmHB91fvpFU4HliGcM4Pk8iOMV8PGeyA9S?=
 =?us-ascii?Q?e+l8buwm/Klf0Z/m3u3HTMsJ9GH4ZEY8bhhl+0iAeSKLZr4QWQhP61aasvpM?=
 =?us-ascii?Q?iWSSahZ1L6DHmUKkZDadBDC4y9/e6XHD4Ks7M1FbRQNZfI4a4NPCdDXiuh0N?=
 =?us-ascii?Q?rSsuGiindw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e856023-86c1-432a-5200-08de58649787
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 20:43:39.8648 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HRuW37qBhFI0y/W/F2Zn4Omj33hrsjBoZHAnkBvaJlGoc8Zdmb5h8SG/NeUNF7t6Z8xJMeIeRhElqpQaTCZjtg==
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
X-Rspamd-Queue-Id: E2A9F4B8A3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

PRAMIN apertures are a crucial mechanism to direct read/write to VRAM.
Add support for the same.

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/mm/mod.rs    |   5 +
 drivers/gpu/nova-core/mm/pramin.rs | 244 +++++++++++++++++++++++++++++
 drivers/gpu/nova-core/nova_core.rs |   1 +
 drivers/gpu/nova-core/regs.rs      |   5 +
 4 files changed, 255 insertions(+)
 create mode 100644 drivers/gpu/nova-core/mm/mod.rs
 create mode 100644 drivers/gpu/nova-core/mm/pramin.rs

diff --git a/drivers/gpu/nova-core/mm/mod.rs b/drivers/gpu/nova-core/mm/mod.rs
new file mode 100644
index 000000000000..7a5dd4220c67
--- /dev/null
+++ b/drivers/gpu/nova-core/mm/mod.rs
@@ -0,0 +1,5 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Memory management subsystems for nova-core.
+
+pub(crate) mod pramin;
diff --git a/drivers/gpu/nova-core/mm/pramin.rs b/drivers/gpu/nova-core/mm/pramin.rs
new file mode 100644
index 000000000000..6a7ea2dc7d77
--- /dev/null
+++ b/drivers/gpu/nova-core/mm/pramin.rs
@@ -0,0 +1,244 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Direct VRAM access through the PRAMIN aperture.
+//!
+//! PRAMIN provides a 1MB sliding window into VRAM through BAR0, allowing the CPU to access
+//! video memory directly. The [`Window`] type automatically repositions the window when
+//! accessing different VRAM regions and restores the original position on drop. This allows
+//! to reuse the same window for multiple accesses in the same window.
+//!
+//! The PRAMIN aperture is a 1MB region at BAR0 + 0x700000 for all GPUs. The window base is
+//! controlled by the `NV_PBUS_BAR0_WINDOW` register and must be 64KB aligned.
+//!
+//! # Examples
+//!
+//! ## Basic read/write
+//!
+//! ```no_run
+//! use crate::driver::Bar0;
+//! use crate::mm::pramin;
+//! use kernel::devres::Devres;
+//! use kernel::sync::Arc;
+//!
+//! fn example(devres_bar: Arc<Devres<Bar0>>) -> Result<()> {
+//!     let mut pram_win = pramin::Window::new(devres_bar)?;
+//!
+//!     // Write and read back.
+//!     pram_win.try_write32(0x100, 0xDEADBEEF)?;
+//!     let val = pram_win.try_read32(0x100)?;
+//!     assert_eq!(val, 0xDEADBEEF);
+//!
+//!     Ok(())
+//!     // Original window position restored on drop.
+//! }
+//! ```
+//!
+//! ## Auto-repositioning across VRAM regions
+//!
+//! ```no_run
+//! use crate::driver::Bar0;
+//! use crate::mm::pramin;
+//! use kernel::devres::Devres;
+//! use kernel::sync::Arc;
+//!
+//! fn example(devres_bar: Arc<Devres<Bar0>>) -> Result<()> {
+//!     let mut pram_win = pramin::Window::new(devres_bar)?;
+//!
+//!     // Access first 1MB region.
+//!     pram_win.try_write32(0x100, 0x11111111)?;
+//!
+//!     // Access at 2MB - window auto-repositions.
+//!     pram_win.try_write32(0x200000, 0x22222222)?;
+//!
+//!     // Back to first region - window repositions again.
+//!     let val = pram_win.try_read32(0x100)?;
+//!     assert_eq!(val, 0x11111111);
+//!
+//!     Ok(())
+//! }
+//! ```
+
+#![allow(unused)]
+
+use crate::{
+    driver::Bar0,
+    regs, //
+};
+
+use kernel::bits::genmask_u64;
+use kernel::devres::Devres;
+use kernel::prelude::*;
+use kernel::ptr::{
+    Alignable,
+    Alignment, //
+};
+use kernel::sizes::{
+    SZ_1M,
+    SZ_64K, //
+};
+use kernel::sync::Arc;
+
+/// PRAMIN aperture base offset in BAR0.
+const PRAMIN_BASE: usize = 0x700000;
+
+/// PRAMIN aperture size (1MB).
+const PRAMIN_SIZE: usize = SZ_1M;
+
+/// 64KB alignment for window base.
+const WINDOW_ALIGN: Alignment = Alignment::new::<SZ_64K>();
+
+/// Maximum addressable VRAM offset (40-bit address space).
+///
+/// The `NV_PBUS_BAR0_WINDOW` register has a 24-bit `window_base` field (bits 23:0) that stores
+/// bits [39:16] of the target VRAM address. This limits the addressable space to 2^40 bytes.
+///
+/// CAST: On 64-bit systems, this fits in usize.
+const MAX_VRAM_OFFSET: usize = genmask_u64(0..=39) as usize;
+
+/// Generate a PRAMIN read accessor.
+macro_rules! define_pramin_read {
+    ($name:ident, $ty:ty) => {
+        #[doc = concat!("Read a `", stringify!($ty), "` from VRAM at the given offset.")]
+        pub(crate) fn $name(&mut self, vram_offset: usize) -> Result<$ty> {
+            // Compute window parameters without bar reference.
+            let (bar_offset, new_base) =
+                self.compute_window(vram_offset, ::core::mem::size_of::<$ty>())?;
+
+            // Update window base if needed and perform read.
+            let bar = self.bar.try_access().ok_or(ENODEV)?;
+            if let Some(base) = new_base {
+                Self::write_window_base(&bar, base);
+                self.current_base = base;
+            }
+            bar.$name(bar_offset)
+        }
+    };
+}
+
+/// Generate a PRAMIN write accessor.
+macro_rules! define_pramin_write {
+    ($name:ident, $ty:ty) => {
+        #[doc = concat!("Write a `", stringify!($ty), "` to VRAM at the given offset.")]
+        pub(crate) fn $name(&mut self, vram_offset: usize, value: $ty) -> Result {
+            // Compute window parameters without bar reference.
+            let (bar_offset, new_base) =
+                self.compute_window(vram_offset, ::core::mem::size_of::<$ty>())?;
+
+            // Update window base if needed and perform write.
+            let bar = self.bar.try_access().ok_or(ENODEV)?;
+            if let Some(base) = new_base {
+                Self::write_window_base(&bar, base);
+                self.current_base = base;
+            }
+            bar.$name(value, bar_offset)
+        }
+    };
+}
+
+/// PRAMIN window for direct VRAM access.
+///
+/// The window auto-repositions when accessing VRAM offsets outside the current 1MB range.
+/// Original window position is saved on creation and restored on drop.
+pub(crate) struct Window {
+    bar: Arc<Devres<Bar0>>,
+    saved_base: usize,
+    current_base: usize,
+}
+
+impl Window {
+    /// Create a new PRAMIN window accessor.
+    ///
+    /// Saves the current window position for restoration on drop.
+    pub(crate) fn new(bar: Arc<Devres<Bar0>>) -> Result<Self> {
+        let bar_access = bar.try_access().ok_or(ENODEV)?;
+        let saved_base = Self::try_read_window_base(&bar_access)?;
+
+        Ok(Self {
+            bar,
+            saved_base,
+            current_base: saved_base,
+        })
+    }
+
+    /// Read the current window base from the BAR0_WINDOW register.
+    fn try_read_window_base(bar: &Bar0) -> Result<usize> {
+        let reg = regs::NV_PBUS_BAR0_WINDOW::read(bar);
+        let base = u64::from(reg.window_base());
+        let shifted = base.checked_shl(16).ok_or(EOVERFLOW)?;
+        shifted.try_into().map_err(|_| EOVERFLOW)
+    }
+
+    /// Write a new window base to the BAR0_WINDOW register.
+    fn write_window_base(bar: &Bar0, base: usize) {
+        // CAST:
+        // - We have guaranteed that the base is within the addressable range (40-bits).
+        // - After >> 16, a 40-bit aligned base becomes 24 bits, which fits in u32.
+        regs::NV_PBUS_BAR0_WINDOW::default()
+            .set_window_base((base >> 16) as u32)
+            .write(bar);
+    }
+
+    /// Compute window parameters for a VRAM access.
+    ///
+    /// Returns (bar_offset, new_base) where:
+    /// - bar_offset: The BAR0 offset to use for the access
+    /// - new_base: Some(base) if window needs repositioning, None otherwise
+    fn compute_window(
+        &self,
+        vram_offset: usize,
+        access_size: usize,
+    ) -> Result<(usize, Option<usize>)> {
+        // Validate VRAM offset is within addressable range (40-bit address space).
+        let end_offset = vram_offset.checked_add(access_size).ok_or(EINVAL)?;
+        if end_offset > MAX_VRAM_OFFSET + 1 {
+            return Err(EINVAL);
+        }
+
+        // Calculate which 64KB-aligned base we need.
+        let needed_base = vram_offset.align_down(WINDOW_ALIGN);
+
+        // Calculate offset within the window.
+        let offset_in_window = vram_offset - needed_base;
+
+        // Check if access fits in 1MB window from this base.
+        if offset_in_window + access_size > PRAMIN_SIZE {
+            return Err(EINVAL);
+        }
+
+        // Return bar offset and whether window needs repositioning.
+        let new_base = if self.current_base != needed_base {
+            Some(needed_base)
+        } else {
+            None
+        };
+
+        Ok((PRAMIN_BASE + offset_in_window, new_base))
+    }
+
+    define_pramin_read!(try_read8, u8);
+    define_pramin_read!(try_read16, u16);
+    define_pramin_read!(try_read32, u32);
+    define_pramin_read!(try_read64, u64);
+
+    define_pramin_write!(try_write8, u8);
+    define_pramin_write!(try_write16, u16);
+    define_pramin_write!(try_write32, u32);
+    define_pramin_write!(try_write64, u64);
+}
+
+impl Drop for Window {
+    fn drop(&mut self) {
+        // Restore the original window base if it changed.
+        if self.current_base != self.saved_base {
+            if let Some(bar) = self.bar.try_access() {
+                Self::write_window_base(&bar, self.saved_base);
+            }
+        }
+    }
+}
+
+// SAFETY: `Window` requires `&mut self` for all accessors.
+unsafe impl Send for Window {}
+
+// SAFETY: `Window` requires `&mut self` for all accessors.
+unsafe impl Sync for Window {}
diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index c1121e7c64c5..3de00db3279e 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -13,6 +13,7 @@
 mod gfw;
 mod gpu;
 mod gsp;
+mod mm;
 mod num;
 mod regs;
 mod sbuffer;
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index 82cc6c0790e5..c8b8fbdcf608 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -96,6 +96,11 @@ fn fmt(&self, f: &mut kernel::fmt::Formatter<'_>) -> kernel::fmt::Result {
     31:16   frts_err_code as u16;
 });
 
+register!(NV_PBUS_BAR0_WINDOW @ 0x00001700, "BAR0 window control for PRAMIN access" {
+    25:24   target as u8, "Target memory (0=VRAM, 1=SYS_MEM_COH, 2=SYS_MEM_NONCOH)";
+    23:0    window_base as u32, "Window base address (bits 39:16 of FB addr)";
+});
+
 // PFB
 
 // The following two registers together hold the physical system memory address that is used by the
-- 
2.34.1

