Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QOZGFSksnmn5TgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 23:54:33 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0525718DDEF
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 23:54:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5464B10E703;
	Tue, 24 Feb 2026 22:54:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="qfDlSIC1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011021.outbound.protection.outlook.com
 [40.93.194.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EE0410E6EB;
 Tue, 24 Feb 2026 22:54:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rkfi/effUxkAAPmYQ6d1jYc0tfF3SoORCUEXxmJuX3QRzBft3gSDJP8Rw4vaimmhBH+JlTHKrkgZlS5+GY8+tC/mkSul+gybDl+dvAfM4f6RjlBP0EmsK8Yhtx2A2bM1ZuVJP9lPbTszKR94JoM3OSS4xKniUhxGUQncaZpwYOYM75KoGphEEVOltU0bFO/6SUKCSzckMIuyhZTfq6S6N/M8m3PYjLNhxJRjvT5P/X6WCTvFJBSoUmsFFnmupbDcJpC3Retd7vo3HVFM/XVIyLMub+R7fd+8SmPN61Dg9GSXmjutVuMcmdw3pDmEBhYPMoQ4G73qsqvg2xo5M7tqMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R43gNWA3PZxF0NM1SiVo+6rrKdl9coWCgbX5uwPfvbY=;
 b=loqcVumJeiyvT99ejY8WrMbItAvl41dFtR5YuRdsk6gxn8zeJ4ci7mfbaVFT0GtKaxuBi8+aMboI3ThzVQyAge9RIrdEuIu3X7UsrouF4xnki458z0I6cBMtyyk304TEsLNH80qV9QYQU/KYwm+XSvdayy6qvSOKg+H4FsfNwz6qImlf4W5QCVUTUQyQYrLnJzFyvvKq8Jea2hxO3UkWSYAn/p4tSfslyOxzWrfeDneHs5zWn88mx+AC0+nbqwSKXNDLgU7rbf076sS5tRt83eSstSfPhSBe/7+tEIxvIqUrq0qZaDhAPO+3MCQTvu1RUms0/PjyAibTUtaz0lH1QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R43gNWA3PZxF0NM1SiVo+6rrKdl9coWCgbX5uwPfvbY=;
 b=qfDlSIC1oqrwrf1JKEGaogx3AW/oafccy2DV6PF4ie1KAv2RhsMYFQ9cYyowdvrRkCYl9GiOyO6wleEG7Yqyp0KThQ4IIy+V4ONSng+CQGe3jYEvyZoHejEE86tX2zML5f0DHrBSrjoOe1lT2GKZW7mj8imCsy0wSALtIlxbLFlTGY+5Lf+K/t38CGQazrnL2AzYPVY8zBClRorza6sQoutGOZy5ALXA7jjFMA8rDHL4gH93bVHVwRcD6i+62iKTrV0hLe4d4cwjLZZSvCTrNaYjJV0+5wmpUoyG5/IpeOOoH1fDACkabcXLN0w8X1M+eSDGlP0OJ3vQP7EG8/5U4Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 SN7PR12MB6885.namprd12.prod.outlook.com (2603:10b6:806:263::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.21; Tue, 24 Feb 2026 22:54:18 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 22:54:18 +0000
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
Subject: [PATCH v8 24/25] gpu: nova-core: mm: Add BAR1 memory management
 self-tests
Date: Tue, 24 Feb 2026 17:53:22 -0500
Message-Id: <20260224225323.3312204-25-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260224225323.3312204-1-joelagnelf@nvidia.com>
References: <20260224225323.3312204-1-joelagnelf@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BLAPR03CA0026.namprd03.prod.outlook.com
 (2603:10b6:208:32b::31) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|SN7PR12MB6885:EE_
X-MS-Office365-Filtering-Correlation-Id: 590d1bb5-6e38-4bc5-74c6-08de73f7a3ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ejA2SjBDM2lydWM0Sjc1SGtRekxxM0VSeFQ2S0dsdVlsVGljcEhIVTZWcFBm?=
 =?utf-8?B?c0tYUWRrRXR0RG9UT04xNG9WTmhOMXlYMDg5b3JjeDEzOE0vYmhRNjVLcDli?=
 =?utf-8?B?ZkZ2T3ZmTmFnenNIaW1HK2tKOFNvaUZqM1Ria1BSMzBZM3RPNXMzQmQzVU9W?=
 =?utf-8?B?bGplTjllQkJyYTR1bDdrUFczbkFVS3Z5S05aTytDWWhmYWRkWWExOXFyN2Vv?=
 =?utf-8?B?RGVueUhtNklNUC81MHBLMEw4aGhuaDJ3alRZM1VMb1l2WkkyRzJQUTgrbmt3?=
 =?utf-8?B?UlhoVEJ1bDhHazdIV2JLOG1tSGw0N3lVOUhvb0p1M3NLbzRrWERCOTR0YkE5?=
 =?utf-8?B?YzVGanFUdzlZdjRLeHZ5MHhRSFdUU0JybDJSQmVaNy9XTzFpQU1NUzJSd3Ez?=
 =?utf-8?B?RTNRV2pzOC94SWxhM0lZenRMVEpuaWgyU3lJQmtzZEJJaEduSDJrTWhubDNX?=
 =?utf-8?B?ZWF6b2YxWlBpeklUcUhGR2NwSVpvUzJxTzhTcnZhS2VNUWprUG1uMnQ4SFhj?=
 =?utf-8?B?ZnRkbUdJUTlwQ3ZqS1J2VEM5QzFDYXFlK2R5RmVOd0VNdDdvV3F3c2p3LzVB?=
 =?utf-8?B?NHkyZXRUdEU1WU5vTHllcUx4aFR4K1ZRVms5djlSaTBUSm45ODNNd05PUnRG?=
 =?utf-8?B?WGhiVW55WS9UaC9McktCQ3AxRDBzWkpVR0tmcVVwaXFtS3hVZ0U5VjZlOXVk?=
 =?utf-8?B?Rm8xQkNMSmRTSFUxTGJjZjJIZWsxWHRJQWtEOHRKamloV2EzL29FUTJpeHpE?=
 =?utf-8?B?UHdTV0huK1hlaFozZHdyZUZaNjM2RGE4RFJJNmNFRUZLV1lBbmFGbEw4WjhI?=
 =?utf-8?B?SGltcDlxK2grdWRJRFVkaVJYdnBYR24wSDVoSmFkTFVGdDdNclNxeHJyRmFp?=
 =?utf-8?B?MGpUVkdJbndCMDdGaVIzazVORzRGdHFMRmFLS1ZhNG1OTVhIOFR0THFnQzhj?=
 =?utf-8?B?cWF5NFhSb3hmM0lZRW5hRWIvT2ZjUVFQaERkTy9aYkk4TWtpeTRCSDFJVHRI?=
 =?utf-8?B?dDNNT0FxQVVLdm1qM2dtbEFTVU5ab0FHWGhOR0xMU3JnQml1aDQ3V2VzdFNC?=
 =?utf-8?B?RFdPYUVkb3o4dkNncUhFRXM2Q05EUEhrNWxmNStSVHowRmlRY29EMXE4Y1RR?=
 =?utf-8?B?VUdvUUNSNnRESlJCWkgrQWx5WHlFYU5iWlRrejA0a0NiY0lLbHFyTW00VWN3?=
 =?utf-8?B?WVBHYjNMNTZhbTh4V3drS1I2My9RQnNJQXZRWGVQZWcxZjN0SmJobDJsMGFL?=
 =?utf-8?B?MVd2dmQ5eGdTbVpydDVjVEVQY2F3TXVEZnhGaVBSS1FoT0l3ckxNZGJNRHpn?=
 =?utf-8?B?dmFVdHFRbzBabVNPaEhDWEZ1ZnVkeVdic2krajdKTW5xNkRoaWJoYVR2Yk5X?=
 =?utf-8?B?cEp6MmphQWgrK0VaRjRDc3ZoV3Q3QlhUNERTWlU3WnY2QzZENHUvcGgyVC9Y?=
 =?utf-8?B?eUlvRXR6TmI3WDAyU3ZSYzF0aGxmZUQwMFhLeEg5dmd5aDJyYjU5NDg3Mm9a?=
 =?utf-8?B?bDMxdlhZQkcwTTdjbTdSYXpOaldNblJFS2N5endqU2ZxRUxBcUh4amtVUjlo?=
 =?utf-8?B?WG51dEhvMWxrYlRscUxPMU9yWUtOY3VKQ0I0cVpQM205R0JWWU1nUXJuQ3RG?=
 =?utf-8?B?bFN0UHVxRnpjMElNOUM1RWZjQWpLYytpOVg1T0xqVklGb1JrY2JybFNhZ1BL?=
 =?utf-8?B?TjNnbm1Ea1ZRNlZGYSsyQnpLbmwxd3JDMndNblMyS0lQUjc4d0tBK1N6OEJO?=
 =?utf-8?B?dTB0bXk5V2pSRjN1eGpjRUVvWkhVTzlvS2d4aU1NM3JpWFY3MlEwMVp2blJw?=
 =?utf-8?B?Ym5WNnV0RTA1U2E4bXI5bTVxYzgzb0VVbmFXRG5JbVFaTStyME5HektOWHRm?=
 =?utf-8?B?RkRNMFc5Rld5QVE4WjE5VmFjOFBUSkY1V1p4WnFJZGszaTlRcWdrZ25zWUtv?=
 =?utf-8?B?RU5xZGJSUEdsZXBrYURmTUNJdTVJcndlQWZHYmsvanN6WE1Gb1RWTGcvNlNQ?=
 =?utf-8?B?NzF6YXE5U2g1SEs4NFlvUEdtZCtPMnVjRTNJb1JocGQ3V2VGeDBYWDFYckZn?=
 =?utf-8?B?dDFzbnMxeWhrMjJVYlhZZlpndEVORFNHcWFrUGwya1lxbG5hZjh2eE9PbUhu?=
 =?utf-8?Q?x90M=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c2VvOXh4MUtoZ3Fhakplcng3aWNjYWxXaGlzMGIwT3pnRXZRMDJQRjBxSW9v?=
 =?utf-8?B?MUNCWFI2NW1jWXJxaGl6WXdnbnVCa1hiZmVwbjVWZlY4SnYrWGVzZFdtRGdt?=
 =?utf-8?B?ZGRuYWEzNElSL1REalNURXF6TmlYV3ZEMnVtYTZ4RWNMVERoOGxHNHRnV0x4?=
 =?utf-8?B?Q2N5NUlERFY0RTlrMXVuWC9VZXgvVlB4S2llaXZ4TkpMcDdqa0QvbjN2aU1T?=
 =?utf-8?B?SlFNS2pBTVpsMU41djBaOHFvbmg0OXlxTk9QaDQ4YXE3cGY5SUMwM2w5WURC?=
 =?utf-8?B?WkozVnkxcjJKcndyNnJYQzdCK0gvakxQSklGOC9yYnltMjRDeHdZOEtLN2FG?=
 =?utf-8?B?T29wenNaV2NYeHZxK3k1ZllJcmZjMVUzRzM5aEpLWk5CMlhPZmdnWXlzUE4r?=
 =?utf-8?B?VGNRdW8zenBKeG9YeEVEZWRuNVpsNFBuVi9XNWF2VjJqYWJVcWVIZEt3aFdP?=
 =?utf-8?B?YVlIZ0ZFcTdjeENjYi9TaE00NldwVkYwYnE5YmpkNWxrNDFxVnJsYndqeHZ5?=
 =?utf-8?B?M0ZFTHc0M3FSQmxGdFQ4VGZvYkJaV2x5a0kxUWJuYlNtZEdPN3doRlgwQ0VV?=
 =?utf-8?B?RUEwS3R6ZEoxczlWcWhWVVc3bGkxUThvMkp2RGpCSTdlVTR6bFpneXphU3p1?=
 =?utf-8?B?bUxZSUV0RXlMcldOdjRocjFRaWRGTGRDVVZEZ2JIRFhEQVJ4ajNXU0tsTmVG?=
 =?utf-8?B?ckdHZWg3bU1MR1UxcXhoSEFmeTBxejFYb1NoQUkzQW10OTNRcmFoOEZSQlVl?=
 =?utf-8?B?Rlp6aldQaUFveDNQeWdUQ2NyS0lyeXFhN3lsOWNQY3dtcjNmQlNBcTNXL0tw?=
 =?utf-8?B?RnN5czgycWVZL3hhcW4vL0FLRjhjU2cvaHhKU3hhMVovZWpXc2FGTVJvNWZ4?=
 =?utf-8?B?VkdIekYwSzFZcVc2R01PbEoyZ3BGeEhJMEdCQ2V2b2UxNjJSc0NnaGFOVWUv?=
 =?utf-8?B?dVRURXRvZUZSTDdkVmxVVCtVYUV3MU9yZXZmZ0h3VW9vRUdES1plcHNJQUlB?=
 =?utf-8?B?NVFweFZKVEJsY3JCZEJOTmg4ZHdqdnlwcE9xVmZpVHFOcHFXMTVBOVhmcTc1?=
 =?utf-8?B?VElvMFlSNnhYN0ZLRkJqcHBhK2hzY2pYSFl4S2pKbHQ5Z1NibC9MMjJNZFYz?=
 =?utf-8?B?VFA3ektzQmRBNlRTWTc0Z1pMZ2RuVXVCeVRYUXVNRlhJaE1WYUJvV1NuVzhH?=
 =?utf-8?B?SnBneDByaUczaEVSWXY2bjlDUTR3Qk85c2cyTWcyaVRUQVlGYXVyODR4ZnFP?=
 =?utf-8?B?N014eDlhR2EyUjk0WWxveGhaMHhHY3ZoWFJzVnI5eXQ4U3h3Z1htV0cyZncx?=
 =?utf-8?B?d2xDaGxPU3lFaC9xdURBRUdLMnVrclI1OVBIZk9RbWtPcEJ2b1doN3M4ZkNR?=
 =?utf-8?B?QkYyd2IvNU0rRkpiZ2RJVTRWY2orbzZ1STBsY0hZQ1lFZWYwZFI4Vk84cWkv?=
 =?utf-8?B?OEpLM1VVc3dxeE84bGJ3Mzd6VWdYOFlMRWRTZDNHZTJiajlzZGs1MUI5S0g5?=
 =?utf-8?B?aVg1bFFXeW1EbXluNStQY0RNbEU5ZG02VkN4R1M0RFlSc2xmWCtNbkp2Rk8x?=
 =?utf-8?B?aFlsMmRLVGNuK2JFMENlWVRSaWZ0OEJ2RWpiRXNUWjR4QkNGeFQ3S1pVbjlu?=
 =?utf-8?B?NllMVnExUldPeXNidC9pZGg3MnZzMHBDRk5NRThaellKT3JyUkp3czFPcHB0?=
 =?utf-8?B?Zk1MY3I3T00raVlIN3lRb284TTFReHJ4Tmtxc04rTHYrUXBPc2V0R0dmL2pN?=
 =?utf-8?B?RjNQSmNIamZvMEpHY2RuQ2VlRDAxbGs2dzZrU3Z6NnlQRkFyclhiS1RCZFhV?=
 =?utf-8?B?YkhXTC93a1VqbjdabTNnRE9kREtzeHJkbjE5REMzMS9BM2w3OW9rQUV6S3ox?=
 =?utf-8?B?NVdhN0paQzVUZ1RRYnZsTGhCRW1wZE5WUDNBQ0J1SnJacVhudTRtbkUxZllX?=
 =?utf-8?B?dlhPQytvME9uaXNXZVY3bVBTdTlsWjIzU0p2ZURjRjJHcVA3NTdMT3FZQWxs?=
 =?utf-8?B?MWQ4YTNYbnphNTNZSVpzMjdFS1M4WnY3dkFwR1ExbTc1a01pcldXQ1IwRVkr?=
 =?utf-8?B?VGtXUCt5Y25WeENJWXJsUTNGRmZVMXU2TFU5M092eDJrVTZTZ3JINENOclNC?=
 =?utf-8?B?d3A4UXM5bDU5WklsN3lxYmxyYnYvVEF2SU1objQ5Q3U5Y0ZJK0d2ZWhoekxM?=
 =?utf-8?B?TmZlYjhpc2VGZjVURzRsZithVm1JOGwwanVLMW9kUW1Pb2QyUDdCVEFVQlFl?=
 =?utf-8?B?bXpiaXFBY2Z4OTcydFYzMEJwVlZCZkpnakg3cENFTTZETTN3ZW5ld3YxL0dZ?=
 =?utf-8?B?cVNXMlZUYk5RUHlReWUyTGFBNnRnM1VEK3dLRVY3VjE1WXVyS2hxQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 590d1bb5-6e38-4bc5-74c6-08de73f7a3ef
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 22:54:17.8853 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dm8Qyzaweu/B3AXD+k0BeQnidF7IwOvdin8G+s2ZyMfj6fX+qUYnkeo15UL2vOG0bULy72L7BM+8ATwvA/82mA==
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
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,redhat.com,collabora.com,linux.intel.com,lists.freedesktop.org,vger.kernel.org,nvidia.com,suse.de,gmail.com,ffwll.ch,lwn.net,amd.com,intel.com,ursulin.net,gmx.de,weathered-steel.dev,joelfernandes.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[57];
	FROM_NEQ_ENVFROM(0.00)[joelagnelf@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.969];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,nvidia.com:mid,nvidia.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 0525718DDEF
X-Rspamd-Action: no action

Add self-tests for BAR1 access during driver probe when
CONFIG_NOVA_MM_SELFTESTS is enabled (default disabled). This results in
testing the Vmm, GPU buddy allocator and BAR1 region all of which should
function correctly for the tests to pass.

Cc: Nikola Djukic <ndjukic@nvidia.com>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/Kconfig        |  10 ++
 drivers/gpu/nova-core/driver.rs      |   2 +
 drivers/gpu/nova-core/gpu.rs         |  42 +++++
 drivers/gpu/nova-core/mm/bar_user.rs | 250 +++++++++++++++++++++++++++
 4 files changed, 304 insertions(+)

diff --git a/drivers/gpu/nova-core/Kconfig b/drivers/gpu/nova-core/Kconfig
index 6513007bf66f..35de55aabcfc 100644
--- a/drivers/gpu/nova-core/Kconfig
+++ b/drivers/gpu/nova-core/Kconfig
@@ -15,3 +15,13 @@ config NOVA_CORE
 	  This driver is work in progress and may not be functional.
 
 	  If M is selected, the module will be called nova_core.
+
+config NOVA_MM_SELFTESTS
+	bool "Memory management self-tests"
+	depends on NOVA_CORE
+	help
+	  Enable self-tests for the memory management subsystem. When enabled,
+	  tests are run during GPU probe to verify PRAMIN aperture access,
+	  page table walking, and BAR1 virtual memory mapping functionality.
+
+	  This is a testing option and is default-disabled.
diff --git a/drivers/gpu/nova-core/driver.rs b/drivers/gpu/nova-core/driver.rs
index d8b2e967ba4c..7d0d09939835 100644
--- a/drivers/gpu/nova-core/driver.rs
+++ b/drivers/gpu/nova-core/driver.rs
@@ -92,6 +92,8 @@ fn probe(pdev: &pci::Device<Core>, _info: &Self::IdInfo) -> impl PinInit<Self, E
 
             Ok(try_pin_init!(Self {
                 gpu <- Gpu::new(pdev, bar.clone(), bar.access(pdev.as_ref())?),
+                // Run optional GPU selftests.
+                _: { gpu.run_selftests(pdev)? },
                 _reg <- auxiliary::Registration::new(
                     pdev.as_ref(),
                     c"nova-drm",
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 4281487ca52e..fba6ddba6a3f 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -380,4 +380,46 @@ pub(crate) fn unbind(&self, dev: &device::Device<device::Core>) {
             .inspect(|bar| self.sysmem_flush.unregister(bar))
             .is_err());
     }
+
+    /// Run selftests on the constructed [`Gpu`].
+    pub(crate) fn run_selftests(
+        mut self: Pin<&mut Self>,
+        pdev: &pci::Device<device::Bound>,
+    ) -> Result {
+        self.as_mut().run_mm_selftests(pdev)?;
+        Ok(())
+    }
+
+    #[cfg(CONFIG_NOVA_MM_SELFTESTS)]
+    fn run_mm_selftests(mut self: Pin<&mut Self>, pdev: &pci::Device<device::Bound>) -> Result {
+        use crate::driver::BAR1_SIZE;
+
+        let mmu_version = MmuVersion::from(self.spec.chipset.arch());
+
+        // BAR1 self-tests.
+        let bar1 = Arc::pin_init(
+            pdev.iomap_region_sized::<BAR1_SIZE>(1, c"nova-core/bar1"),
+            GFP_KERNEL,
+        )?;
+        let bar1_access = bar1.access(pdev.as_ref())?;
+
+        let proj = self.as_mut().project();
+        let bar1_pde_base = proj.gsp_static_info.bar1_pde_base();
+        let mm = proj.mm.as_ref().get_ref();
+
+        crate::mm::bar_user::run_self_test(
+            pdev.as_ref(),
+            mm,
+            bar1_access,
+            bar1_pde_base,
+            mmu_version,
+        )?;
+
+        Ok(())
+    }
+
+    #[cfg(not(CONFIG_NOVA_MM_SELFTESTS))]
+    fn run_mm_selftests(self: Pin<&mut Self>, _pdev: &pci::Device<device::Bound>) -> Result {
+        Ok(())
+    }
 }
diff --git a/drivers/gpu/nova-core/mm/bar_user.rs b/drivers/gpu/nova-core/mm/bar_user.rs
index 4af56ac628b6..28dfb10e7cea 100644
--- a/drivers/gpu/nova-core/mm/bar_user.rs
+++ b/drivers/gpu/nova-core/mm/bar_user.rs
@@ -154,3 +154,253 @@ fn drop(&mut self) {
         }
     }
 }
+
+/// Check if the PDB has valid, VRAM-backed page tables.
+///
+/// Returns `Err(ENOENT)` if page tables are missing or not in VRAM.
+#[cfg(CONFIG_NOVA_MM_SELFTESTS)]
+fn check_valid_page_tables(mm: &GpuMm, pdb_addr: VramAddress) -> Result {
+    use crate::mm::pagetable::{
+        ver2::Pde,
+        AperturePde, //
+    };
+
+    let mut window = mm.pramin().window()?;
+    let pdb_entry_raw = window.try_read64(pdb_addr.raw())?;
+    let pdb_entry = Pde::new(pdb_entry_raw);
+
+    if !pdb_entry.is_valid() {
+        return Err(ENOENT);
+    }
+
+    if pdb_entry.aperture() != AperturePde::VideoMemory {
+        return Err(ENOENT);
+    }
+
+    Ok(())
+}
+
+/// Run MM subsystem self-tests during probe.
+///
+/// Tests page table infrastructure and `BAR1` MMIO access using the `BAR1`
+/// address space. Uses the `GpuMm`'s buddy allocator to allocate page tables
+/// and test pages as needed.
+#[cfg(CONFIG_NOVA_MM_SELFTESTS)]
+pub(crate) fn run_self_test(
+    dev: &kernel::device::Device,
+    mm: &GpuMm,
+    bar1: &crate::driver::Bar1,
+    bar1_pdb: u64,
+    mmu_version: MmuVersion,
+) -> Result {
+    use crate::mm::{
+        vmm::Vmm,
+        PAGE_SIZE, //
+    };
+    use kernel::gpu::buddy::{
+        BuddyFlags,
+        GpuBuddyAllocParams, //
+    };
+    use kernel::sizes::{
+        SZ_4K,
+        SZ_16K,
+        SZ_32K,
+        SZ_64K, //
+    };
+
+    // Self-tests only support MMU v2 for now.
+    if mmu_version != MmuVersion::V2 {
+        dev_info!(
+            dev,
+            "MM: Skipping self-tests for MMU {:?} (only V2 supported)\n",
+            mmu_version
+        );
+        return Ok(());
+    }
+
+    // Test patterns.
+    const PATTERN_PRAMIN: u32 = 0xDEAD_BEEF;
+    const PATTERN_BAR1: u32 = 0xCAFE_BABE;
+
+    dev_info!(dev, "MM: Starting self-test...\n");
+
+    let pdb_addr = VramAddress::new(bar1_pdb);
+
+    // Check if initial page tables are in VRAM.
+    if check_valid_page_tables(mm, pdb_addr).is_err() {
+        dev_info!(dev, "MM: Self-test SKIPPED - no valid VRAM page tables\n");
+        return Ok(());
+    }
+
+    // Set up a test page from the buddy allocator.
+    let alloc_params = GpuBuddyAllocParams {
+        start_range_address: 0,
+        end_range_address: 0,
+        size_bytes: SZ_4K.into_safe_cast(),
+        min_block_size_bytes: SZ_4K.into_safe_cast(),
+        buddy_flags: BuddyFlags::try_new(0)?,
+    };
+
+    let test_page_blocks = KBox::pin_init(mm.buddy().alloc_blocks(&alloc_params), GFP_KERNEL)?;
+    let test_vram_offset = test_page_blocks.iter().next().ok_or(ENOMEM)?.offset();
+    let test_vram = VramAddress::new(test_vram_offset);
+    let test_pfn = Pfn::from(test_vram);
+
+    // Create a VMM of size 64K to track virtual memory mappings.
+    let mut vmm = Vmm::new(pdb_addr, MmuVersion::V2, SZ_64K.into_safe_cast())?;
+
+    // Create a test mapping.
+    let mapped = vmm.map_pages(mm, &[test_pfn], None, true)?;
+    let test_vfn = mapped.vfn_start;
+
+    // Pre-compute test addresses for the PRAMIN to BAR1 read test.
+    let vfn_offset: usize = test_vfn.raw().into_safe_cast();
+    let bar1_base_offset = vfn_offset.checked_mul(PAGE_SIZE).ok_or(EOVERFLOW)?;
+    let bar1_read_offset: usize = bar1_base_offset + 0x100;
+    let vram_read_addr: usize = test_vram.raw() + 0x100;
+
+    // Test 1: Write via PRAMIN, read via BAR1.
+    {
+        let mut window = mm.pramin().window()?;
+        window.try_write32(vram_read_addr, PATTERN_PRAMIN)?;
+    }
+
+    // Read back via BAR1 aperture.
+    let bar1_value = bar1.try_read32(bar1_read_offset)?;
+
+    let test1_passed = if bar1_value == PATTERN_PRAMIN {
+        true
+    } else {
+        dev_err!(
+            dev,
+            "MM: Test 1 FAILED - Expected {:#010x}, got {:#010x}\n",
+            PATTERN_PRAMIN,
+            bar1_value
+        );
+        false
+    };
+
+    // Cleanup - invalidate PTE.
+    vmm.unmap_pages(mm, mapped)?;
+
+    // Test 2: Two-phase prepare/execute API.
+    let prepared = vmm.prepare_map(mm, 1, None)?;
+    let mapped2 = vmm.execute_map(mm, prepared, &[test_pfn], true)?;
+    let readback = vmm.read_mapping(mm, mapped2.vfn_start)?;
+    let test2_passed = if readback == Some(test_pfn) {
+        true
+    } else {
+        dev_err!(dev, "MM: Test 2 FAILED - Two-phase map readback mismatch\n");
+        false
+    };
+    vmm.unmap_pages(mm, mapped2)?;
+
+    // Test 3: Range-constrained allocation with a hole — exercises block.size()-driven
+    // BAR1 mapping. A 4K hole is punched at base+16K, then a single 32K allocation
+    // is requested within [base, base+36K). The buddy allocator must split around the
+    // hole, returning multiple blocks (expected: {16K, 4K, 8K, 4K} = 32K total).
+    // Each block is mapped into BAR1 and verified via PRAMIN read-back.
+    //
+    // Address layout (base = 0x10000):
+    //   [    16K    ] [HOLE 4K] [4K] [ 8K ] [4K]
+    //   0x10000       0x14000  0x15000 0x16000 0x18000 0x19000
+    let range_base: u64 = SZ_64K.into_safe_cast();
+    let range_flag = BuddyFlags::try_new(BuddyFlags::RANGE_ALLOCATION)?;
+    let sz_4k: u64 = SZ_4K.into_safe_cast();
+    let sz_16k: u64 = SZ_16K.into_safe_cast();
+    let sz_32k_4k: u64 = (SZ_32K + SZ_4K).into_safe_cast();
+
+    // Punch a 4K hole at base+16K so the subsequent 32K allocation must split.
+    let _hole = KBox::pin_init(mm.buddy().alloc_blocks(&GpuBuddyAllocParams {
+        start_range_address: range_base + sz_16k,
+        end_range_address: range_base + sz_16k + sz_4k,
+        size_bytes: SZ_4K.into_safe_cast(),
+        min_block_size_bytes: SZ_4K.into_safe_cast(),
+        buddy_flags: range_flag,
+    }), GFP_KERNEL)?;
+
+    // Allocate 32K within [base, base+36K). The hole forces the allocator to return
+    // split blocks whose sizes are determined by buddy alignment.
+    let blocks = KBox::pin_init(mm.buddy().alloc_blocks(&GpuBuddyAllocParams {
+        start_range_address: range_base,
+        end_range_address: range_base + sz_32k_4k,
+        size_bytes: SZ_32K.into_safe_cast(),
+        min_block_size_bytes: SZ_4K.into_safe_cast(),
+        buddy_flags: range_flag,
+    }), GFP_KERNEL)?;
+
+    let mut test3_passed = true;
+    let mut total_size = 0u64;
+
+    for block in blocks.iter() {
+        total_size += block.size();
+
+        // Map all pages of this block.
+        let page_size: u64 = PAGE_SIZE.into_safe_cast();
+        let num_pages: usize = (block.size() / page_size).into_safe_cast();
+
+        let mut pfns = KVec::new();
+        for j in 0..num_pages {
+            let j_u64: u64 = j.into_safe_cast();
+            pfns.push(
+                Pfn::from(VramAddress::new(
+                    block.offset()
+                        + j_u64.checked_mul(page_size)
+                            .ok_or(EOVERFLOW)?,
+                )),
+                GFP_KERNEL,
+            )?;
+        }
+
+        let mapped = vmm.map_pages(mm, &pfns, None, true)?;
+        let bar1_base_vfn: usize = mapped.vfn_start.raw().into_safe_cast();
+        let bar1_base = bar1_base_vfn.checked_mul(PAGE_SIZE).ok_or(EOVERFLOW)?;
+
+        for j in 0..num_pages {
+            let page_bar1_off = bar1_base + j * PAGE_SIZE;
+            let j_u64: u64 = j.into_safe_cast();
+            let page_phys = block.offset()
+                + j_u64.checked_mul(PAGE_SIZE.into_safe_cast())
+                    .ok_or(EOVERFLOW)?;
+
+            bar1.try_write32(PATTERN_BAR1, page_bar1_off)?;
+
+            let pramin_val = {
+                let mut window = mm.pramin().window()?;
+                window.try_read32(page_phys.into_safe_cast())?
+            };
+
+            if pramin_val != PATTERN_BAR1 {
+                dev_err!(
+                    dev,
+                    "MM: Test 3 FAILED block offset {:#x} page {} (val={:#x})\n",
+                    block.offset(),
+                    j,
+                    pramin_val
+                );
+                test3_passed = false;
+            }
+        }
+
+        vmm.unmap_pages(mm, mapped)?;
+    }
+
+    // Verify aggregate: all returned block sizes must sum to allocation size.
+    if total_size != SZ_32K.into_safe_cast() {
+        dev_err!(
+            dev,
+            "MM: Test 3 FAILED - total size {} != expected {}\n",
+            total_size,
+            SZ_32K
+        );
+        test3_passed = false;
+    }
+
+    if test1_passed && test2_passed && test3_passed {
+        dev_info!(dev, "MM: All self-tests PASSED\n");
+        Ok(())
+    } else {
+        dev_err!(dev, "MM: Self-tests FAILED\n");
+        Err(EIO)
+    }
+}
-- 
2.34.1

