Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0FVLGy/pb2m+UQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 21:44:31 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B2EA4B9D5
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 21:44:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A18F210E225;
	Tue, 20 Jan 2026 20:44:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="sMP6RG6l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010053.outbound.protection.outlook.com [52.101.46.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9BEA10E225;
 Tue, 20 Jan 2026 20:44:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mFP5GRT7jHgFEBtQzFC2RhFWqe8If8PZYMVQFQuyZ8id0QlRy+mY8PKOeRRD4ggG7ednsaF7O6wx9QIICRxHocxV1+cDOOy5IrJMlJduSLNbXVgzykQQkf6afoM9QI9eC8jn3C+tJ6XbBvRUxk1MoPdAXr6UGu084Fin9b+WvDb7DeK3wg0v+CJDBZgzbYu2bRP9pNCpVl8KmLeY6KHHbxOG4uKKioQCwecjUE68hZ9vVRTjjLHQHjAKDgv5nh6iU6RiZpdKUFtmCov32Yhtc1CS658oWzAmFNi4TSiaq+Ivi4tP4510847MpXpF+OHpW3Pw220GMs+iU5wtLjAdOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IdALN0+ugbE7soKMWIcyQimRjhw6yH36lTEVBrFkBGI=;
 b=aF2dmZSZ1Lrkq10dZzoMgIi7uoDgwuG3vekZ+QCoOJOoLS4VeEP1jzT9tZLGSy4Zris6hcHyqOiyzgJ9OMk4ar5mWUZh1G69SfAWC/3JwWHnix9zqlT8QIT4wHoMuoUNCM4B8Bo5o9WTZoJFsHqTUKLMeeTF0Rr7OmEkQk6pI7DJPUHgtFKqD1CGZsD/l6+Xc+tPiDktTegCX4DeVnxaQFsgdXP6dnzWnwQOvIC+GfuoYxLl3fIhw8zCCbAyoOVjLRakos/1LLN3/2gJVIOoyqxG8exbqJefN9ZXRxjA4COq60N/PYovy4IaqRORgGzavbkAf1VJyaLLjho755uqTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IdALN0+ugbE7soKMWIcyQimRjhw6yH36lTEVBrFkBGI=;
 b=sMP6RG6liok1U4yS4ThVRHCKNQhFgsz1DZGh1CHmVd7c/I+vsZdcG9itLcl2eQF2GHUHrhg+bjlFESP+r7c1t1nAA1kINhNwjSa8to/wOk6OZeQ2tKavzxoHT8pwhO9CdbagHMWPjVGLsfFEJYuh9TnrzsOfVJJntSgsFbX5DP+M4BgJDceF+2O8RuusgTFxje8pFf7w8doXrSsVIBaTKDLjT6urz3yKqe4uKEo36wqYczrBWHx/uXgQb5o2f50Ekxe3ojUr6Vpr117NkR82l1VZwWsHh0L0RToCKKLsWagKteNoP28iZbTAPbLhZ4hOnXe6Y6odNfCINXbNTqdGkg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 PH7PR12MB6809.namprd12.prod.outlook.com (2603:10b6:510:1af::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.12; Tue, 20 Jan 2026 20:44:17 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9542.008; Tue, 20 Jan 2026
 20:44:17 +0000
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
Subject: [PATCH RFC v6 16/26] nova-core: mm: Add page table walker for MMU v2
Date: Tue, 20 Jan 2026 15:42:53 -0500
Message-Id: <20260120204303.3229303-17-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260120204303.3229303-1-joelagnelf@nvidia.com>
References: <20260120204303.3229303-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0020.namprd05.prod.outlook.com
 (2603:10b6:208:36e::23) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|PH7PR12MB6809:EE_
X-MS-Office365-Filtering-Correlation-Id: afc0fb6d-94f1-4f0a-1c52-08de5864ae1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?OIELYioqrIeMAAuJDJ9PcviPMa5bDUhs37n4Y+kqS3ivu6wZc+vc5yp3abqu?=
 =?us-ascii?Q?YjyK6JjHD22cESO7eU+kEHBoegLOLCrQoZinbY4t5RZMdtwNBd39TVj/dzY2?=
 =?us-ascii?Q?E5x1ZWDAzStMqaJhbW8dof1dibjDApp236DgQ/BGPPTZOtG2x4ZuqKXYrjPE?=
 =?us-ascii?Q?f5dOBGOECqclTuj05ntKHetrx31c4VdzjpTN4cj9jwGx7dxn0WwCA4SJkt4u?=
 =?us-ascii?Q?UF3Hl1XW4y+kdZImt1J+WX7HHobN0F1EupQz+NrobzUHPlazoOt8MBBGEDnQ?=
 =?us-ascii?Q?oUDhNxSAyJQCZA2ZP2Yf1uKq8jImu6O4izbUtkuwEpAI/muoQUFNreG038Ad?=
 =?us-ascii?Q?gme+LT87ffTwovLYoAepSNCgsWM6kkhBsyqSD42Bpp4qTIvgZ5tWsZLIkwW7?=
 =?us-ascii?Q?ip1E47+GQxOwrniFakXe6P6+Ei+RDUw/LLvM5GymcKQ1v+xm5DswIfaT1OGU?=
 =?us-ascii?Q?b03KC8tefU5cT2TrLZ2ytHxkPZ1tLVnPJxivmAqI9kwHAu3lb7jGOcW67ge3?=
 =?us-ascii?Q?iOZmpPcke0ScpZq0I0rm6haYlnrZxoAerrXDqOf0UgdUvSPAFX6TgPwNaLoC?=
 =?us-ascii?Q?MhYTI5MPrMwt+nkyIbCa4OAWlvYf/NcnAR7G3Hsu0g8/9TjN0ZWxaV8IGgAx?=
 =?us-ascii?Q?bOx54vcWMc4HHIPHWmCw61OxG8LGWvSjrKo1N00Qbw5DBH7yEYrWMaV9ZFR0?=
 =?us-ascii?Q?tQJBfKOZPbk5PW/8tJ1VqeQlE8s+HQUmlnNGqd1vP983m1zo1hat8/8jxcEb?=
 =?us-ascii?Q?gXLysrX2GR93BU0W5bDoRDXSG7YpTd0jLPPcSff2WBT4ye1mQswtx4QxgG/M?=
 =?us-ascii?Q?yIStIyL1C/cA/pRmFUpT+38eljLDcfnoNEGdMKo5KV+WbFHlVGaqm/A8w6No?=
 =?us-ascii?Q?4KFFWJ97Um3uPo1e8jE2XbQAwlhd9NBbC2stpMZMKhmyT+q1x3jL7LI2mXHf?=
 =?us-ascii?Q?TdxulYw+VC71G+H6APusnqtnuBnE7dUmvHDNuDpyxqG/mExxG8NaAYCA7HAf?=
 =?us-ascii?Q?+QM4zoVX23ejCgfZl0oTj1+X+gfyJelXm58TXQr/mQHyR8jYev2xp5IUWXXH?=
 =?us-ascii?Q?OGCzdSo7zpIZQFOP61z2B8AYp1Def8VONktb7LqGCoUNqLj0Iif0K9/nt//H?=
 =?us-ascii?Q?kh9w+GIryjSJnnEoHWTTenKzYhlMSgJNU9faWF/bTIbmjFuHO8iylbmAosdL?=
 =?us-ascii?Q?3nxVU/nk9TpSPBLEzNRaK5tuvE00Pe3WFdbYi6Fo1HqVNu3nlb+hlJzS82mL?=
 =?us-ascii?Q?/B0kd8P59prdvWIX6D1ugfO5pK1JONe/XurGLCUYcJEOVYPCmVGDpJn8rp06?=
 =?us-ascii?Q?I/UldAY3XDwdUAW9/cQ79Uch5xKXzT3QEgztljB9mwJbxpJfzuRHZKfbfOGa?=
 =?us-ascii?Q?oqC6Lpzxg0WN/wxnEeX7FRVsTIRhrXAhMzgPDxB8GhgmVLnhRGm8HzGN6ewB?=
 =?us-ascii?Q?CPii2GLXqvKnhtoF8cWE9UCliV4zSbSAubcaXUk8eOhRAy3db3Bk9ftDBPMx?=
 =?us-ascii?Q?bOhPfFH7mDszP8v7P5vy9JDp601BWDLy1phUTi5O4AUeBBHSffkOF9ouZDsu?=
 =?us-ascii?Q?cxGLzX7xx//gc0Esgyk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3ghF85w9HCeLIleeSomMGDU+ntK3P7pvMVjm/queaIB11JAAJ3hhRqEk9EvN?=
 =?us-ascii?Q?c48/XyojX8Y/oNQuaicqLuhRFfByNh17cT0QdUuerlbqJlEMBs2hmbJStT3M?=
 =?us-ascii?Q?qiNjhrlKfKcPoUHBrLxAhAdoLVd3PvKwO1cV8/9rWnjbZW5OBrUSKCBZg3Ha?=
 =?us-ascii?Q?ukNO1uyLjh0QnyYH65Ueog0o9TImbY15Fv374ri41XHOSQAENQjgqjR5yFb1?=
 =?us-ascii?Q?XPcRblrL+mTTAyTluj79GjXvM8i1PETtDhEwFVFfJf7N+lB1tpp54uAu0SjX?=
 =?us-ascii?Q?NfQnHW33aGEBYXJTxQcBWZsk6tivElKKOpDeIBHrkYo6mBzprDxMpUcQnYgF?=
 =?us-ascii?Q?gFKyjQI8wrTUVJjTp65i0B+r8ZuzQujcG7o/IEi8buswkrxDa+yEhZDF046a?=
 =?us-ascii?Q?HxVzhugLU3FXPFn14wJhstuMdkHhP8tkf1lhhe7C96GJi1Myf0/5hUGmcwBM?=
 =?us-ascii?Q?hm8JA222cOhkqUra81x1h/jAueSqRyJJXO8jM5G9i1D3rX+pYggRl0Ykvd2D?=
 =?us-ascii?Q?vFKAWYgs5athXcDcselJWtEWj0RA1EmimvWlVNQ3OdLG1m2OFwrBlgbysC8y?=
 =?us-ascii?Q?gvuhiifP7O4ZYWcdbU2ejFBOjyzuZe8zbwJM0hHhRNgf1oJTtcni/RUiZPy0?=
 =?us-ascii?Q?ynK700YeYVc2btzBJVvnS7fsErjgpeAp/Xn7U9C4+qXxKQVTMMankPQdlmF3?=
 =?us-ascii?Q?4KNJeyadCNWZroKcgvUE1cfnEfFdlpzQM2wWgAvg16y5kXZtS7i5C1GsgKB4?=
 =?us-ascii?Q?FJrOxIMrDanaaf7R+6zv5+X7WDWhTeosnSa647dT7+GSvsKJEvKkIlYZBwhA?=
 =?us-ascii?Q?7zodLr/3iEvOghxVcobBWiYYbIMX29inKZt3V8H2LOBIbOzwiQryGRhHnHye?=
 =?us-ascii?Q?S/iGaKfKL3/sXmk3FsoWWlG1tzfM2l1X0QaQlaVzrygtASH5Jga6yu9GL5pF?=
 =?us-ascii?Q?/Ftm3YzI9QbmWQF/BpkE2DpaP4VzOsfMDWef0iIexzhNKba6ZLmGWScakRj/?=
 =?us-ascii?Q?zc432uTnyuxGd8AkyvbFaAJJuKkyON06og2ucUWbi9jwE2V3YiUk+7EHdYX5?=
 =?us-ascii?Q?8CmqAbceCzAuFvpnrx4eSwNTPt2CnL4bKDPEeMovnPPL58W5Va2v9JKkyNKV?=
 =?us-ascii?Q?YAk3TmlFt3ktIGyMaNdIh3Pt/9P+lQo3KyGlYXazSU/CfXUBdFP+8URwNECW?=
 =?us-ascii?Q?uD6XfJ2sVgeb3gvwj5G0Hl4Ueh0/NkdKvgle/ByS54/2NiDSsSr7jz448V72?=
 =?us-ascii?Q?3bAKCTzSATvuClCGA2yi3ZaG1PIzPYyM/SAGBGNP6Edkt38B2SJsxSomqekP?=
 =?us-ascii?Q?8YQdRwbMQYvF+xhjRJAchd0dkc1itzAuwOC5FcSgQ/AEIjMIlLa9YAOQqi3k?=
 =?us-ascii?Q?/2cKbVi7z0zj71Ot2oPV+K3t49Dm3NNpvBT2bcGET0jbyfQNdv0PfmSAhVsi?=
 =?us-ascii?Q?G98I2lKy+f5ShZTrSmNh1xiyRA3E9WwnbKjYwFDVWdmB9Zwqyugo2XDqSp0A?=
 =?us-ascii?Q?81TbHhUPOhuaqLvx6Pbk/WqkkttPg3vmtdGbrdnTgeqSp83ZVunLuz6Wu4Fz?=
 =?us-ascii?Q?Ep/QsawyizyrFw4abbgPUZidB7Dln8jzazjW7Lb7YD+NOsHssUOMWi06HeCq?=
 =?us-ascii?Q?UrPTi5ocxVUl2LVNQWIRcd9V309eU29JD1NScnbHncN8icKA4BXHVyXPYcO/?=
 =?us-ascii?Q?108RjqOfgxl30x0vv066PwZbJoCzjQDDwsKUyo+YYSwIJKkPxPpzkg5SFIWl?=
 =?us-ascii?Q?EYzzi9E/cQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: afc0fb6d-94f1-4f0a-1c52-08de5864ae1d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 20:44:17.6162 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I5bx4xCiedV5YDHzVUo5Q+Esl0wfI9qp3jdd+ec1NLiQ6OevaeARg89wrrTFREFzUw/aBb7AgX+WBYsFP++1bA==
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
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[joelagnelf@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_GT_50(0.00)[52];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,nvidia.com:mid,Nvidia.com:dkim,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Queue-Id: 1B2EA4B9D5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add the page table walker implementation that traverses the 5-level
page table hierarchy (PDB -> L1 -> L2 -> L3 -> L4) to resolve virtual
addresses to physical addresses or find PTE locations.

The walker provides:
- walk_to_pte_lookup(): Walk existing page tables (no allocation)
- Helper functions for reading/writing PDEs and PTEs via PRAMIN

Uses GpuMm API for centralized access to PRAMIN window.

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/mm/pagetable/mod.rs  |  13 +
 drivers/gpu/nova-core/mm/pagetable/walk.rs | 285 +++++++++++++++++++++
 2 files changed, 298 insertions(+)
 create mode 100644 drivers/gpu/nova-core/mm/pagetable/walk.rs

diff --git a/drivers/gpu/nova-core/mm/pagetable/mod.rs b/drivers/gpu/nova-core/mm/pagetable/mod.rs
index 72bc7cda8df6..4c77d4953fbd 100644
--- a/drivers/gpu/nova-core/mm/pagetable/mod.rs
+++ b/drivers/gpu/nova-core/mm/pagetable/mod.rs
@@ -9,12 +9,25 @@
 #![expect(dead_code)]
 pub(crate) mod ver2;
 pub(crate) mod ver3;
+pub(crate) mod walk;
 
 use super::{
+    GpuMm,
     Pfn,
     VramAddress, //
 };
 use crate::gpu::Architecture;
+use kernel::prelude::*;
+
+/// Trait for allocating page tables during page table walks.
+///
+/// Implementors must allocate a zeroed 4KB page table in VRAM and
+/// ensure the allocation persists for the lifetime of the address
+/// space and the lifetime of the implementor.
+pub(crate) trait PageTableAllocator {
+    /// Allocate a zeroed page table and return its VRAM address.
+    fn alloc_page_table(&mut self, mm: &mut GpuMm) -> Result<VramAddress>;
+}
 
 /// MMU version enumeration.
 #[derive(Debug, Clone, Copy, PartialEq, Eq)]
diff --git a/drivers/gpu/nova-core/mm/pagetable/walk.rs b/drivers/gpu/nova-core/mm/pagetable/walk.rs
new file mode 100644
index 000000000000..7a2660a30d80
--- /dev/null
+++ b/drivers/gpu/nova-core/mm/pagetable/walk.rs
@@ -0,0 +1,285 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Page table walker implementation for NVIDIA GPUs.
+//!
+//! This module provides page table walking functionality for MMU v2 (Turing/Ampere/Ada).
+//! The walker traverses the 5-level page table hierarchy (PDB -> L1 -> L2 -> L3 -> L4)
+//! to resolve virtual addresses to physical addresses or to find PTE locations.
+//!
+//! # Page Table Hierarchy
+//!
+//! ```text
+//!     +-------+     +-------+     +-------+     +---------+     +-------+
+//!     | PDB   |---->|  L1   |---->|  L2   |---->| L3 Dual |---->|  L4   |
+//!     | (L0)  |     |       |     |       |     | PDE     |     | (PTE) |
+//!     +-------+     +-------+     +-------+     +---------+     +-------+
+//!       64-bit        64-bit        64-bit        128-bit         64-bit
+//!        PDE           PDE           PDE        (big+small)        PTE
+//! ```
+//!
+//! # Result of a page table walk
+//!
+//! The walker returns a [`WalkResult`] indicating the outcome:
+//! - [`WalkResult::PageTableMissing`]: Intermediate page tables don't exist (lookup mode).
+//! - [`WalkResult::Unmapped`]: PTE exists but is invalid (page not mapped).
+//! - [`WalkResult::Mapped`]: PTE exists and is valid (page is mapped).
+//!
+//! # Example
+//!
+//! ```ignore
+//! use crate::mm::pagetable::walk::{PtWalk, WalkResult};
+//! use crate::mm::GpuMm;
+//!
+//! fn walk_example(mm: &mut GpuMm, pdb_addr: VramAddress) -> Result<()> {
+//!     // Create a page table walker.
+//!     let walker = PtWalk::new(pdb_addr, MmuVersion::V2);
+//!
+//!     // Walk to a PTE (lookup mode).
+//!     match walker.walk_to_pte_lookup(mm, Vfn::new(0x1000))? {
+//!         WalkResult::Mapped { pte_addr, pfn } => {
+//!             // Page is mapped to the physical frame number.
+//!         }
+//!         WalkResult::Unmapped { pte_addr } => {
+//!             // PTE exists but the page is not mapped.
+//!         }
+//!         WalkResult::PageTableMissing => {
+//!             // Intermediate page tables are missing.
+//!         }
+//!     }
+//!
+//!     Ok(())
+//! }
+//! ```
+
+#![allow(dead_code)]
+
+use kernel::prelude::*;
+
+use super::{
+    DualPde,
+    MmuVersion,
+    PageTableAllocator,
+    PageTableLevel,
+    Pde,
+    Pte, //
+};
+use crate::mm::{
+    pramin,
+    GpuMm,
+    Pfn,
+    Vfn,
+    VirtualAddress,
+    VramAddress, //
+};
+
+/// Dummy allocator for lookup-only walks.
+enum NoAlloc {}
+
+impl PageTableAllocator for NoAlloc {
+    fn alloc_page_table(&mut self, _mm: &mut GpuMm) -> Result<VramAddress> {
+        unreachable!()
+    }
+}
+
+/// Result of walking to a PTE.
+#[derive(Debug, Clone, Copy)]
+pub(crate) enum WalkResult {
+    /// Intermediate page tables are missing (only returned in lookup mode).
+    PageTableMissing,
+    /// PTE exists but is invalid (page not mapped).
+    Unmapped { pte_addr: VramAddress },
+    /// PTE exists and is valid (page is mapped).
+    Mapped { pte_addr: VramAddress, pfn: Pfn },
+}
+
+/// Page table walker for NVIDIA GPUs.
+///
+/// Walks the 5-level page table hierarchy to find PTE locations or resolve
+/// virtual addresses.
+pub(crate) struct PtWalk {
+    pdb_addr: VramAddress,
+    mmu_version: MmuVersion,
+}
+
+impl PtWalk {
+    /// Create a new page table walker.
+    ///
+    /// Copies `pdb_addr` and `mmu_version` from VMM configuration.
+    pub(crate) fn new(pdb_addr: VramAddress, mmu_version: MmuVersion) -> Self {
+        Self {
+            pdb_addr,
+            mmu_version,
+        }
+    }
+
+    /// Get the MMU version this walker is configured for.
+    pub(crate) fn mmu_version(&self) -> MmuVersion {
+        self.mmu_version
+    }
+
+    /// Get the Page Directory Base address.
+    pub(crate) fn pdb_addr(&self) -> VramAddress {
+        self.pdb_addr
+    }
+
+    /// Walk to PTE for lookup only (no allocation).
+    ///
+    /// Returns `PageTableMissing` if intermediate tables don't exist.
+    pub(crate) fn walk_to_pte_lookup(&self, mm: &mut GpuMm, vfn: Vfn) -> Result<WalkResult> {
+        self.walk_to_pte_inner::<NoAlloc>(mm, None, vfn)
+    }
+
+    /// Walk to PTE with allocation of missing tables.
+    ///
+    /// Uses `PageTableAllocator::alloc_page_table()` when tables are missing.
+    pub(crate) fn walk_to_pte_allocate<A: PageTableAllocator>(
+        &self,
+        mm: &mut GpuMm,
+        allocator: &mut A,
+        vfn: Vfn,
+    ) -> Result<WalkResult> {
+        self.walk_to_pte_inner(mm, Some(allocator), vfn)
+    }
+
+    /// Internal walk implementation.
+    ///
+    /// If `allocator` is `Some`, allocates missing page tables. Otherwise returns
+    /// `PageTableMissing` when intermediate tables don't exist.
+    fn walk_to_pte_inner<A: PageTableAllocator>(
+        &self,
+        mm: &mut GpuMm,
+        mut allocator: Option<&mut A>,
+        vfn: Vfn,
+    ) -> Result<WalkResult> {
+        let va = VirtualAddress::from(vfn);
+        let mut cur_table = self.pdb_addr;
+
+        // Walk through PDE levels (PDB -> L1 -> L2 -> L3).
+        for level in PageTableLevel::pde_levels() {
+            let idx = va.level_index(level.as_index());
+
+            if level.is_dual_pde_level() {
+                // L3: 128-bit dual PDE. This is the final PDE level before PTEs and uses
+                // a special "dual" format that can point to both a Small Page Table (SPT)
+                // for 4KB pages and a Large Page Table (LPT) for 64KB pages, or encode a
+                // 2MB huge page directly via IS_PTE bit.
+                let dpde_addr = entry_addr(cur_table, level, idx);
+                let dual_pde = read_dual_pde(mm.pramin(), dpde_addr, self.mmu_version)?;
+
+                // Check if SPT (Small Page Table) pointer is present. We use the "small"
+                // path for 4KB pages (only page size currently supported). If missing and
+                // allocator is available, create a new page table; otherwise return
+                // `PageTableMissing` for lookup-only walks.
+                if !dual_pde.has_small() {
+                    if let Some(ref mut a) = allocator {
+                        let new_table = a.alloc_page_table(mm)?;
+                        let new_dual_pde =
+                            DualPde::new_small(self.mmu_version, Pfn::from(new_table));
+                        write_dual_pde(mm.pramin(), dpde_addr, &new_dual_pde)?;
+                        cur_table = new_table;
+                    } else {
+                        return Ok(WalkResult::PageTableMissing);
+                    }
+                } else {
+                    cur_table = dual_pde.small_vram_address();
+                }
+            } else {
+                // Regular 64-bit PDE (levels PDB, L1, L2). Each entry points to the next
+                // level page table.
+                let pde_addr = entry_addr(cur_table, level, idx);
+                let pde = read_pde(mm.pramin(), pde_addr, self.mmu_version)?;
+
+                // Allocate new page table if PDE is invalid and allocator provided,
+                // otherwise return PageTableMissing for lookup-only walks.
+                if !pde.is_valid() {
+                    if let Some(ref mut a) = allocator {
+                        let new_table = a.alloc_page_table(mm)?;
+                        let new_pde = Pde::new_vram(self.mmu_version, Pfn::from(new_table));
+                        write_pde(mm.pramin(), pde_addr, new_pde)?;
+                        cur_table = new_table;
+                    } else {
+                        return Ok(WalkResult::PageTableMissing);
+                    }
+                } else {
+                    cur_table = pde.table_vram_address();
+                }
+            }
+        }
+
+        // Now at L4 (PTE level).
+        let pte_idx = va.level_index(PageTableLevel::L4.as_index());
+        let pte_addr = entry_addr(cur_table, PageTableLevel::L4, pte_idx);
+
+        // Read PTE to check if mapped.
+        let pte = read_pte(mm.pramin(), pte_addr, self.mmu_version)?;
+        if pte.is_valid() {
+            Ok(WalkResult::Mapped {
+                pte_addr,
+                pfn: pte.frame_number(),
+            })
+        } else {
+            Ok(WalkResult::Unmapped { pte_addr })
+        }
+    }
+}
+
+// ====================================
+// Helper functions for accessing VRAM
+// ====================================
+
+/// Calculate the address of an entry within a page table.
+fn entry_addr(table: VramAddress, level: PageTableLevel, index: u64) -> VramAddress {
+    let entry_size = level.entry_size() as u64;
+    VramAddress::new(table.raw() as u64 + index * entry_size)
+}
+
+/// Read a PDE from VRAM.
+pub(crate) fn read_pde(
+    pramin: &mut pramin::Window,
+    addr: VramAddress,
+    mmu_version: MmuVersion,
+) -> Result<Pde> {
+    let val = pramin.try_read64(addr.raw())?;
+    Ok(Pde::new(mmu_version, val))
+}
+
+/// Write a PDE to VRAM.
+pub(crate) fn write_pde(pramin: &mut pramin::Window, addr: VramAddress, pde: Pde) -> Result {
+    pramin.try_write64(addr.raw(), pde.raw_u64())
+}
+
+/// Read a dual PDE (128-bit) from VRAM.
+pub(crate) fn read_dual_pde(
+    pramin: &mut pramin::Window,
+    addr: VramAddress,
+    mmu_version: MmuVersion,
+) -> Result<DualPde> {
+    let lo = pramin.try_read64(addr.raw())?;
+    let hi = pramin.try_read64(addr.raw() + 8)?;
+    Ok(DualPde::new(mmu_version, lo, hi))
+}
+
+/// Write a dual PDE (128-bit) to VRAM.
+pub(crate) fn write_dual_pde(
+    pramin: &mut pramin::Window,
+    addr: VramAddress,
+    dual_pde: &DualPde,
+) -> Result {
+    pramin.try_write64(addr.raw(), dual_pde.big_raw_u64())?;
+    pramin.try_write64(addr.raw() + 8, dual_pde.small_raw_u64())
+}
+
+/// Read a PTE from VRAM.
+pub(crate) fn read_pte(
+    pramin: &mut pramin::Window,
+    addr: VramAddress,
+    mmu_version: MmuVersion,
+) -> Result<Pte> {
+    let val = pramin.try_read64(addr.raw())?;
+    Ok(Pte::new(mmu_version, val))
+}
+
+/// Write a PTE to VRAM.
+pub(crate) fn write_pte(pramin: &mut pramin::Window, addr: VramAddress, pte: Pte) -> Result {
+    pramin.try_write64(addr.raw(), pte.raw_u64())
+}
-- 
2.34.1

