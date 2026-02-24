Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8A9AGt4onmk7TwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 23:40:30 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1903418D82B
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 23:40:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2488A10E64B;
	Tue, 24 Feb 2026 22:40:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="kbE+/ZuA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010036.outbound.protection.outlook.com [52.101.61.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DF0910E638;
 Tue, 24 Feb 2026 22:40:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=av73kToyu84kQm20pbQvE08Rzx1oO0LBeq66hGSJ9F1Ng2ET5zMrmI5FV7Rmw9ylILY5+jDaGCRvATL+UM4Sxca2yobYom+fh3RkMd8Y31h4bwoC7uBy5qPAPJlrNEYX5b7N1bwHJLBvuQSu/oAMUEuRTkOFcM6ZjYB6/67qRav4rdAyzfvNN+sNfTq7AT9hBhg/wEPOyQYbya6FQwE1u5qpKukYC7HCAw8q1+BTzLOO4y4WYXwncPU2G0F7m6X1Z/lUaysl1oGVl0eMRbqUB0m1153pc2z55L0apUYcmcDgAs1dHN2ZJHCMA8TG6td9tdpiX/vnyYC2mkME5p+z4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+R3GxUR30Ce901aqBipSHAbEEdeQtCV+u/rZ5Kf5P0o=;
 b=qbV0/8Q6lE2ddctuG2be8jv1bDlF/n6CGKSkupqn/aE4Ks5YE/7zzrQutRcXv66VFiGd7vXxPlgfSZUQEyiF3F5ITMAxuLcFi2KBCx0XP6ze2TgpSM08qN+wzMeJMYyHl9QHTLyTUGGUiBiW2yA84vRu/cQtxWu1SR4C0TRmpSKvy0Si/e27WWTwWe+G2lxbtmZr2kvAJYm1epyt0nG3DkfQLNL82qqLEUMHBW1/bry73dxgfPV+Hn26hW5GYT+0oF4HolRa/mVXqXkVpBsMBLGGHn0VAbsm5l21mdxDJf18rVWOU7p5NnCcU27yc0r9ZWwpJXJn8TIZB4kXlUjf7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+R3GxUR30Ce901aqBipSHAbEEdeQtCV+u/rZ5Kf5P0o=;
 b=kbE+/ZuAN8mE+DRBeI1EjQSwjB+dI/sx4DlXDVcqkn84Oh0Ng9pSMpQgD4Hm4+mLRzR0+cqbAWA811vgjcXfoa+nDYKY84s61QVI+V5MdlmqtnfTAfybHbZd6zBhF/XyGEqhcAIAxA5Y95PNoVwZxM7aXoaxKonD/GnqiGmtxU17JNOF0acNqDTzSzz/VKDsCe/+x7CQW5BE27XxUsklBrOLfY5Ie5uqHpwtmE7GByw6Php7FErYzzTlehMqWI0/GybNSL85PZzN7gi+cXQYJTE6Eld29dICWl3nhmwBtRrjYQS88zxUVvNyHghtuJTXDp48IrJeEP1OlAAavXOTIg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 PH0PR12MB7816.namprd12.prod.outlook.com (2603:10b6:510:28c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 22:40:17 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 22:40:16 +0000
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
 linux-fbdev@vger.kernel.org, Joel Fernandes <joelagnelf@nvidia.com>,
 Peter Senna Tschudin <peter.senna@linux.intel.com>
Subject: [reference PATCH v11 3/4] gpu: Fix uninitialized buddy for built-in
 drivers
Date: Tue, 24 Feb 2026 17:40:04 -0500
Message-Id: <20260224224005.3232841-4-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260224224005.3232841-1-joelagnelf@nvidia.com>
References: <20260224224005.3232841-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR13CA0005.namprd13.prod.outlook.com
 (2603:10b6:208:160::18) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|PH0PR12MB7816:EE_
X-MS-Office365-Filtering-Correlation-Id: ef25ae00-3dd0-4cad-c2a0-08de73f5ae97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0BWWCafMok3BxXGmM16kBo+ZoS1qdcacIZfuJBEqsnayez9Cz6YhtqBEmnBR?=
 =?us-ascii?Q?Ny9O5ua7Jz1/iQu/zNp9lLlbTBcEaJgY33E/4E7zOR518zW1Dijn0joBOaqP?=
 =?us-ascii?Q?ZQZf4L1pbBSI/ONwZ//2oYBFxhc1hzGJ3H3taDyKoaUTuh9d4n83YIhfE3Dd?=
 =?us-ascii?Q?Dqnv/pU7hBfz0DDJQwf6r0hLzzz76R7iPPKe7AKsR5YHSktppgk+idZl1bjO?=
 =?us-ascii?Q?E3HeJ+gBHg/2n5fCepsKQxhvWucPIdmACLOL7Muq1Po4yIRrC7Y5ftkrlVrx?=
 =?us-ascii?Q?WxJbauvIGpwptZ7Z9+C94Pexws2Pth1ihFmO88FvreWNsqf2gsylNNEKkLq8?=
 =?us-ascii?Q?Jqr8A4BO5oz2lxl/gKusufs4yWwjrLaRGOyBZXi49GgQq6kz9CmEDg4aC5T7?=
 =?us-ascii?Q?eghg1PXX7Pdu2kT4lf1stv04GfBfMwcxsBye2rRDSUghHvmtyO0730b423D4?=
 =?us-ascii?Q?l5IUOmpXbY7CJyoWmG0jj1nsdkkiwepm5SQFXKbKW8LpyGgyhBGrSiIx6Y7C?=
 =?us-ascii?Q?AVOoahhhVa+9SzsI04sj9rAU1lNw5zsL7bUSJXQBXDxcL8ok5KFs1dLnf3wy?=
 =?us-ascii?Q?m6aLikOOJrO7tZN/8zxP6GYZLILM8CL+GA6GqZFtBcbmrZuuh3GRTnrPYxoU?=
 =?us-ascii?Q?EAjGJUBYbuGEgPSxVLwoJq5cSshAmFmMnzdVqB0fZJTty8tZDVPKsBxrTmvY?=
 =?us-ascii?Q?+s1Hx2gkgMv/NP9jnduIXyJTbeuuvTzUYnAdPvb1zFP6iLO374kzSYDL9OAN?=
 =?us-ascii?Q?4EP0GhtcCrI0JlkQCvZTVYplbixdbjaXlVEYfSsoGiHzZTeM16S0XoRWbTjf?=
 =?us-ascii?Q?FxA0cixhJaAH2jgijYS4wCmsHA7Mo+nGfsdUv5mjKCkztOJpNNrStmUMYwCN?=
 =?us-ascii?Q?YDdFyHbTCJOu+di7ePxdaeTT48PMtYVPixoYeuhM3tY0jSBrDLNwrCiX+AJ0?=
 =?us-ascii?Q?xQuc90TLXte0HwJz+X62loguvIbCiyeK2RKiIQt89tpzFQcF2HprIHfhlON0?=
 =?us-ascii?Q?zBP6wAobwx30gcFtecg8pzCcABlWCVh3vD3BdmLbpiYHMblPE/kpxBmq3izB?=
 =?us-ascii?Q?v8dX8oC1SqhaNtE/3Nf1Vt+Y0ilyZlsRk5HUp0dMxH++OwhhTZm8Kiblawt1?=
 =?us-ascii?Q?QBSl0xniNHlIJK6JadjRv+Wc2vAk5cD5w7nwxvbJbkcqF5gvnbphjoxqp+kr?=
 =?us-ascii?Q?aYTzrfYp0bo8W3Twgap6z89u/OCrFS30iPUyksYu4WEWAC5nU7pxdSgwCS/4?=
 =?us-ascii?Q?n4eDO+Sv6fBRYiVmhNrAFb0g9A1fSLdlUCcHBt7lcT1G7CR35LA3h/mySKOb?=
 =?us-ascii?Q?5xAezPEJ9FNhe7d8BTYtxwyk8T+TUhEH0xQZGiFiUr7b5iOtAOfBWqMbSJq4?=
 =?us-ascii?Q?BsF7o4rEXrOoS4pOq47PNZymqfKRxvtAwafp4XRTX5QwMtEFT2aT3s8TNRJT?=
 =?us-ascii?Q?FFK65ayzkQGNaBtqG/oHpz/n5LRSeTtpZ5wP1Lcdu2Pk/ej4ic11a7i//cwW?=
 =?us-ascii?Q?Si5UzJtiobPGksgJhRKkSsqtioCOFyY6yzqvq5/QsbNzYtLbX5W88p80OcNJ?=
 =?us-ascii?Q?YDIJ6wsEHidDkI4T9to=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BZ7CImkMdbC2oH4qBoiMCBeEbmmdYe/VNPGuUSHIFpU+kCP3MWmp0ODMcdit?=
 =?us-ascii?Q?3CooMJwQgPr1Tq/76hSljsv6suw6JDaSEQhuP4KEIRufemRV8a/0x2QBvCs6?=
 =?us-ascii?Q?TR+rBXebZssyLZ1W+ypGlFQAQu5+ub+biQESMVxgjIGvnIIcAmgt/6ebfHL4?=
 =?us-ascii?Q?UKbOtvZ0ZcsH3rbq6Ra7rZmyj08Sf3qaJlrU21HZ7RLqZi00EMLMyvIhuVaa?=
 =?us-ascii?Q?8HIZAU1Gpt4wnTV4yi6syejr33yHm7EOrZUogdqY80H+yCuDe9Nb1Hnmf41d?=
 =?us-ascii?Q?DgSviqP9wjQYNEULLEid8fsBEmlAd9AIAwXSvb+NYnWXFMANWKhP4JI4hB+g?=
 =?us-ascii?Q?sqmIn6b8c9QKDNJtuFgaYRw3aMoYXp35aiT2O3rU/k+8jiDnxk4l8OcI1ylQ?=
 =?us-ascii?Q?cc3GGRgy79Jox3ooMgfsQXCPLka+RWd7fFmbPaj+tj3S8LqliaEGmdbJcEXA?=
 =?us-ascii?Q?Kq1fkxreoIHXsdVxnvSkk6N4JPNuAgzJFD8qoMUVil7rZUUhum64PisguLI1?=
 =?us-ascii?Q?xBsIzuRUwUR7NtmWkgPVcF4daIuSzpRdjKgcmZFXHAwmEjNC/XTouQGhPHLv?=
 =?us-ascii?Q?Gsi1BVxg/YVY0Aac9UhsS2ygFUI6LO/QcdKUdBLoY3nVKQFlCzyvgu0bOtYN?=
 =?us-ascii?Q?ELaQa39frJ6G98ia2q3r9cBQoNAf0pCL3aQ7eVWvgN/gCY7taGLVoDnqWKgd?=
 =?us-ascii?Q?DnjORVzqvEzPFAMxIqVnmyX1Mtsh+wqRm9zqgeLYP9IDJJhysPyHmMx+NOtE?=
 =?us-ascii?Q?36GSASHWP0Co9Ae+zRFqbjpi+5IY9zcwO2GLH5TPex3Qopn4tEJjw8c/bxtG?=
 =?us-ascii?Q?/V4DRkWrHjgF1FDzaAMxIS7R256RIM1eWwb24ckluetKEgcdauCkjEZp++Jy?=
 =?us-ascii?Q?UvQ3U0SIZsZlw3NS/RsUFDQNXQEENj1UFNfuWxaWmiMjxsieKXZVLGb7ErK5?=
 =?us-ascii?Q?MnCvqzEKzeQPGMNUXJaqfhlDPBUKLsB00lEfS7GKtYol32zzQbFrrQG068zY?=
 =?us-ascii?Q?HUDV0oOpSEtM1SVr0PDsBCjeGa6QVhiu9ti/EhMeup/qnbJzbUhFgi0iOFp1?=
 =?us-ascii?Q?UWu0MqU+uv83wesgD3A9lrbCVC/wEvIhF/gzYGfQ6xml8W15290FPFQbf1QK?=
 =?us-ascii?Q?obb7XurwybUAJH1BLbA/uosoHQWwVnaN5xYzAS8fKFmX3EzAfp8fTeQAuAo+?=
 =?us-ascii?Q?nc0ZEFnnyD+4ymMmZ7CPpR8+qRugeppPsL3PtCyd5M7O6Ap4DkHKbrvwIhJL?=
 =?us-ascii?Q?FR3P4j7BSPUUTImeOViWSFXsVe4zsXR8/+bEUuFJZ9TZ0vu68iapeBPKRt9f?=
 =?us-ascii?Q?RFzYxeBGqU3QAsPpC7JWWH+8Q9lkywDWTDXYgdCR2sWjk0/VzxIBLchIf7ZU?=
 =?us-ascii?Q?rLK1X7rRex+MOZMqu/JVqOdh1PF6cr+oB547paxlsBPB6jXc98OPMPlf7bzg?=
 =?us-ascii?Q?wMCpRoeCE4L8CQ32XoP/4wuSQDhzE6jXxYsLsXPZ3aab/+wwSjAFg1+S5fJc?=
 =?us-ascii?Q?qYcY/DwqwAbjAIWh1odMBOh5rOjRickX3yZ6WsDTWboPc2WfHnPkpMnaayq7?=
 =?us-ascii?Q?wmwlN4Uo/6mGAYMdP2V/TdQLv46Ilwn9V12GM8c5MnuCL+XjZHf4okvDL8jk?=
 =?us-ascii?Q?MB64kfM2qVGcSB4ZRGdSRo0J8hRr02LpvHRy2HqLJqbh9FAqEKqJb10b33TT?=
 =?us-ascii?Q?LGWgZggeio1klYS1cQEEjjzel3zUECS7Sk7alSsI5um90OPAj4YfeYs9Hjt+?=
 =?us-ascii?Q?MOotaPyjFQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef25ae00-3dd0-4cad-c2a0-08de73f5ae97
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 22:40:16.8243 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y2jjbDrTm3m3PnWN9A1A0adozSHnb060RN3CnvWu+RePo812+tOUpegxYuM9+hQzV19D9Md0TsQAuHQ8+wxUsQ==
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
	RCPT_COUNT_GT_50(0.00)[58];
	TAGGED_RCPT(0.00)[dri-devel];
	NEURAL_HAM(-0.00)[-0.946];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.freedesktop.org:email,Nvidia.com:dkim,nvidia.com:mid,nvidia.com:email,intel.com:email]
X-Rspamd-Queue-Id: 1903418D82B
X-Rspamd-Action: no action

From: Koen Koning <koen.koning@linux.intel.com>

Use subsys_initcall instead of module_init for the GPU buddy allocator,
so its initialization code runs before any gpu drivers.
Otherwise, a built-in driver that tries to use the buddy allocator will
run into a kernel NULL pointer dereference because slab_blocks is
uninitialized.

Specifically, this fixes drm/xe (as built-in) running into a kernel
panic during boot, because it uses buddy during device probe.

Fixes: ba110db8e1bc ("gpu: Move DRM buddy allocator one level up (part two)")
Cc: Joel Fernandes <joelagnelf@nvidia.com>
Cc: Dave Airlie <airlied@redhat.com>
Cc: intel-xe@lists.freedesktop.org
Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Koen Koning <koen.koning@linux.intel.com>
Reviewed-by: Joel Fernandes <joelagnelf@nvidia.com>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
Please note: Greg and Danilo suggest fixing this in the Makefile like Koen
initially did, so please do so. I am just including this patch here for
reference.

 drivers/gpu/buddy.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/buddy.c b/drivers/gpu/buddy.c
index 603c59a2013a..81f57fdf913b 100644
--- a/drivers/gpu/buddy.c
+++ b/drivers/gpu/buddy.c
@@ -1315,7 +1315,7 @@ static int __init gpu_buddy_module_init(void)
 	return 0;
 }
 
-module_init(gpu_buddy_module_init);
+subsys_initcall(gpu_buddy_module_init);
 module_exit(gpu_buddy_module_exit);
 
 MODULE_DESCRIPTION("GPU Buddy Allocator");
-- 
2.34.1

