Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qLE/Frk4imkeIgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 20:42:49 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A580F11433C
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 20:42:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A82FC10E479;
	Mon,  9 Feb 2026 19:42:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="L3WKhG0z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010017.outbound.protection.outlook.com [52.101.46.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E09110E479;
 Mon,  9 Feb 2026 19:42:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qz8asb9oit4OvzP/43fppWvzKVeGZYcOs1z3Qmr+BMJnzedUtfJhcvqcfM390G59KdyiTBLKcga2J8PeTdjsK6SeOSituSnk5Izvj+J1cF7aFD0WafMzX/mBSfqUFkSlZNiTdKLSGBjQ44AyUOEjVNpBKGLzY/EwKuiPMgqXRtC/HFdnQNnOGzr6MF6wzDa44Ur3pu76Th3erCyitbCmuG6WVC75afrtaU7Y4064wGSFDpnKofhqGJSH0frzYYfu4nsKV3ZAxJ9bNvZLXCuAx/xUOICRVyDP6WJKuAifUrzvYU06YjUgOHbX8zuTpCvW+oqifZeScIdxgbznMa3oZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e7YrgUBT9vwMkfhq4Jdw9YzLROLTAZ42G0vvKbNJl8I=;
 b=oucUSrZ0CwSvwVJ3nyKbv6ZCPECzj0xAxLWcngoha3g8Nzr1IR2UUXYp+Rk8lYsPG6B1R88Sr4vqgZyNx80gQtd8qKIVBQX27LXUsYkMzyEgDTXZpa0F4EHXv3mDNgbsb46+fnveu6UZp6wqUokk3qiqRMxQS8/dA+VY8EYIX34dJfWAhTmZC3Wy1DxJuRYUz6B7ydVObFxwtmJrXcEI+DVJAx+hv41Zz6hL33ElWQkc8Ko8NC0sfuj+BLCwwApsDwUqdNrj+vKYJa3eQ2RadjmmNKO9Pn2pFUIXSoy8tXdcYlDNoaZI4DwfVXetEXUpOc4ww1afoZfbk7w0FCelRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e7YrgUBT9vwMkfhq4Jdw9YzLROLTAZ42G0vvKbNJl8I=;
 b=L3WKhG0zo8dE+wsKmuQRaUiFFE77k8jf3Nz+KC6xquJP3PkZdC5n8LY4lvQBLEPoU+J57u66Q56cf9yooXzWgSRSH9fGX/zTQklKXvEeY6yncGmRQoM2zBnwfi5s5Az44y16KooFagog73Zftt3+AwFx0rFY5r6C32fmZQzw2/01vczE6PjDqhGW9Bs14BttFZJq0fMFhWrWgbhHHQ0uUS4amxlJ0Gb+Q/rrJZRXOj/8abx/VYCwaI8QoBUcY5tNxy37F4T2dB4vAyKsFx76+gQ9EUwUEGCregOGxZQVOtbBcuSvBBTUvpCJ0Jy4B4AiIvWHbQ2/j+VwqS9M4hQ6NA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 BY5PR12MB4066.namprd12.prod.outlook.com (2603:10b6:a03:207::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Mon, 9 Feb
 2026 19:42:41 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9587.017; Mon, 9 Feb 2026
 19:42:39 +0000
Message-ID: <844443eb-b9d2-417b-a72a-4888d50de1fd@nvidia.com>
Date: Mon, 9 Feb 2026 14:42:36 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -next v7 1/2] rust: clist: Add support to interface with C
 linked lists
To: Daniel Almeida <daniel.almeida@collabora.com>,
 Danilo Krummrich <dakr@kernel.org>
Cc: Gary Guo <gary@garyguo.net>, linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Corbet <corbet@lwn.net>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, Huang Rui <ray.huang@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Helge Deller <deller@gmx.de>, Alice Ryhl <aliceryhl@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, Edwin Peer <epeer@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>, Andrea Righi <arighi@nvidia.com>,
 Andy Ritger <aritger@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
 Balbir Singh <balbirs@nvidia.com>, Philipp Stanner <phasta@kernel.org>,
 Elle Rhumsaa <elle@weathered-steel.dev>, joel@joelfernandes.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-fbdev@vger.kernel.org
References: <20260206004110.1914814-1-joelagnelf@nvidia.com>
 <20260206004110.1914814-2-joelagnelf@nvidia.com>
 <DG7ZF1UT98RQ.3F42J3ULGV2OC@garyguo.net>
 <DG800TDA6OXQ.275PMMS19F1EX@kernel.org>
 <77ac3274-a962-469d-a2f6-6ccc0670988a@nvidia.com>
 <DG80FV3VTT6P.2ZP18EM8605GT@garyguo.net>
 <DG81PJ9QD8FC.2NF6VEKDD3F2Q@kernel.org>
 <DG81V8NG5RC7.38EYLHQZXKTTO@garyguo.net>
 <DG820GM5YHJS.11E92OR824CWM@kernel.org>
 <31AAAF36-093A-46CF-AEEA-709CB1DE1E81@collabora.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <31AAAF36-093A-46CF-AEEA-709CB1DE1E81@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR07CA0023.namprd07.prod.outlook.com
 (2603:10b6:208:1a0::33) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|BY5PR12MB4066:EE_
X-MS-Office365-Filtering-Correlation-Id: 79d8a644-e3dd-428b-b106-08de6813622d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S3JIa25McDNSb0ZGdng1MnFpelJ0OC9SVUNQYUN0anpZWVRsTWVUVzQ5R3Yv?=
 =?utf-8?B?MVJZVW4zVUdjc2tHVFpNbFhHcmgyRVFLUElNRlNReFBVM0QyVWFDcVJoREEr?=
 =?utf-8?B?UUhGek5adlljbXRWa2k5eXMxbnRMLys0eGEzbWNML1VlWmd6azdJcGJJRkQz?=
 =?utf-8?B?UWpUbFMvR1RQaHdlZHVHaXlFSUF3QkxZbFdDMzU0SWQ1TkpGak5xQmd4djR3?=
 =?utf-8?B?NlFVK1Uzc2dRVGZKK1h2NGdlSEZEMkJaZ2dKRk5KenI5SFFSUWlCL0RTNjhC?=
 =?utf-8?B?MGFqc0I4VTV1UHNXcDB1KzRkS1N3QnlGYnR2Q3FrYTBVaTU1QkdnU29XTzJr?=
 =?utf-8?B?UGtROEVhTnEwNjY2OVYwMk5lUVZmMXc2Yk9QR3dFeE4wR0NXeC8wemtlclpV?=
 =?utf-8?B?emREK3lQQTVwdUUrU1RFRTRmSTk3dk9pNkNUL0JuYWEvTUQyUTVEdGVjdDRJ?=
 =?utf-8?B?YnlBSHJ0VmcvQzJGd21tZU9VUHJaUm9YRDBWWU40TWttRGNsZnNQeXUzMHBY?=
 =?utf-8?B?SGZ4UXdEdzBpckp2RUNUYk1La2g4QjlFOG1DTzVNamg2enFXK2lwWlRFdmcz?=
 =?utf-8?B?UGwyODl0OFBHZHlicUhjM044TnZTc3oxR09WL2kwTkVDMjE1ZFZYWS9teTFw?=
 =?utf-8?B?WGZBSzRZdElkb3oybURnR1FtbVYvS1ZkN21NYkRDbVlnUms0S0tuZGZtYi9D?=
 =?utf-8?B?WEkrbkk1VzhpM3k2U05SU1FsaFdXY2lkMm1XV1pZSFdiZmcwZmNubFdYWFJt?=
 =?utf-8?B?ak1YcmZUS0RUNlNSMS9pSU5VLzlFS2ZoT3lCelgzbDlEYmppbVhHNXdlZ2Rl?=
 =?utf-8?B?WkV0MkdzRUwyZG9lbDYzT2xVOGRYcVJaWGxsV2IyMUkvQytxVEpXYThmTE5v?=
 =?utf-8?B?R0VJa29telVncTlKZGx4bmxpa09wWGVBeFlnWDBoTit1dlhoTGExTzljRVNr?=
 =?utf-8?B?OE5oR1k1dEVqU1prWENmeXpZNmFJS28xb2ZjQ2c5M2pseVhhaU4wM2w5Wlg1?=
 =?utf-8?B?SE1SSmdXQjgwZy9OUVh6UnF1ZUd2QlQ3QmNoWlFuZENYZlNURmlpR08wdVJx?=
 =?utf-8?B?aEswTkQyYW5tcWhFbDM5WWo5OUptU0FaWlJOdkxLV3BjQUtOUEZwTXZIUDUy?=
 =?utf-8?B?NHZYd1lmMVJZWDFwZi9vSW1PZmJxOEpqVmVpYTNBdVViMTNPVUl3ekJid2pM?=
 =?utf-8?B?WWxkK3dvYjR3SkV1M1ArVG51ZGVtL1dCNEdvaFhBcllIYnkwQk1pM3NzQXpN?=
 =?utf-8?B?RW03OGFZTjhFZnJPamt4SnN1MlUwSkgrdWRhVGpuT2NFamxtLzFkb1hUUU9j?=
 =?utf-8?B?aFU4KzJGd09abytXSmd3c09DQmdCUG1jYVNnYWNJU2d4Kzl4T1NJLy9ZZ3FM?=
 =?utf-8?B?cUtNOEdETVNNVlYrVU85aHFFazUxTUZNMVpSdU5ud3hYeFp2WFVsaG41dmdx?=
 =?utf-8?B?dWVkU2JrSmREMjAwbnBnSThnYklkdndUNVVGZDZyNWgwNDh0cFl0WlQzYWhK?=
 =?utf-8?B?elVHL2xzL1REcFRzV3p3dFlPc1JaME5RMDRueitDNWdDejVGY3gvT2lJUEdi?=
 =?utf-8?B?Nk0wRTR1ZUlBWGhsS3laRkRBcW40UGNyaEpKZ1VKcGxHUU1CNDl6OXc4RHBr?=
 =?utf-8?B?Y01uM0QyQWlCcDlPN2FKSHFDNUJpd2RRSjI5Rktjc2dVekJJVjZPcWVIU0FR?=
 =?utf-8?B?aU8wK2dhbCsrZGtSVGcxMDdvNkpQSk9reXJYUElLa0o3Y3VJWkttQU41NWk3?=
 =?utf-8?B?NFBrNklmU0hQR3lpU2hxekxVSUlaN0E0TW5QTlkrYW5Bdjl0TnZ5MjJxYnd1?=
 =?utf-8?B?NFFRanNtTm1vODE2NENzenpEMmE5ck1XSCs0L2dkWlYyK3U0aFNLNGtieFJL?=
 =?utf-8?B?cGU2S0FlUi9xUG9EbUduYk5pd21jTTdZYXFIazR1dkpqeVhtWEJYcnFsSmU4?=
 =?utf-8?B?S0hBT3dyU290aHNKTkpBaEsvSSt2bmJtRjB4dTVxcHZlbG9Hb2FhdC94ZGo3?=
 =?utf-8?B?UmhZK21zeGVRbXdJRHNOVXh4M2FGQWFCYU9tZGlvMWg3NURZMUM3Y2sveE9r?=
 =?utf-8?B?RjdvZ3RoYUR1ei9CZFovelk2NUQ2YklibGhtRVRWMjZXaDJnN2g3Zm4zRldY?=
 =?utf-8?Q?o5vg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dHFyeE83SGJNTlRDcVB1Z2UwSmFuY0xodzVPN0Y4R29pZmRKUkNkdGJQRXBt?=
 =?utf-8?B?ZVNBSHQwZGloeCtMN2pZN3luNFFHYnd3MjcvbC9SWVFDN25GSjV1SGRQRzUv?=
 =?utf-8?B?eS8xakhEYzJvTzcxLzV0ejhqUzI0L1c5d29RM2lxRXdIclNkQTd0YTd4UTJo?=
 =?utf-8?B?MXZhU2FyQU0xM05EUWVENWUyNDk5SEw3eU9kQzZmYjVobDFuNXNwWDBZM1NV?=
 =?utf-8?B?MW10M0FsSXNrNVQ0U3FlVDB5cERzN25kNS8yWXg1RjN2UU45Mm1GaHVDTEN0?=
 =?utf-8?B?Skx1YTJtUG43L0JWcDNGbCs3Skk2aE5kR2lvY2l1dmk2NzUrRjl5RllvWU1T?=
 =?utf-8?B?S0w1NmI3VWhFaWlic0EwaVhKMHdHSVBNM0hUUjduMmtwZklxSFdKTmhKREVu?=
 =?utf-8?B?KytEdXg2OTRQdHJhVG1yZVlNNTFvN1loVXgwa0FoRzRCR0F3ZkNnWDFJWTFM?=
 =?utf-8?B?bkJRRlh3ckp5QzIzUmlzT3VweUJCK1VISWdNY2l3RFNlU0NhUG5mZllJUkQ1?=
 =?utf-8?B?TWRuOCtrTzRWUlg4VlVhTDBvSGN3cTNpSjlDMEJRVnd5VVdKcmczQTY4MDFE?=
 =?utf-8?B?YlNlVHhNNlJwZzJrZFhEdVc3aERKZVgvRHhFWDNlemg1ZU8rR1ludWgyZzBQ?=
 =?utf-8?B?RFEvQVRIUjQ0d1REdUdlTWV5SllrM2wrNjFhR1Y0dGwwY3J6Y0VQS3ZmU2M4?=
 =?utf-8?B?RCt5Q1RueFFMbVhsL25jbTlLUUlJUzk5WmJJTHVOb0dmQjdEcWpkcFpuZTh0?=
 =?utf-8?B?L21ycnJtMml6ekdpZi9yL0NQY1VzUE1Nckh1RVo0aWVEMEk4dzNUNzJibXFx?=
 =?utf-8?B?ZHVGVElpU3lLYWRrQ1ZDeTVhSEZtUmp5eDR1ZHFZWUNBa1BKeDkrcEJEZTRi?=
 =?utf-8?B?cU1uU3hQeE1oZHRZWWh5bWRJVVVsK0NhWkhOSXBSWHRSZG1UdzBjK1FCM2FU?=
 =?utf-8?B?SWloeldDL3JzYldzY0NtQllRMmErWDlDNG9ZcWhNSVA5WEdLa21McHN5T1Zz?=
 =?utf-8?B?MDdSUkhlNUVkZEltS3BRQ0lwc25WSzEyRE9hMjVEdWViSitMQVZHQ2ZyZDF5?=
 =?utf-8?B?MDdIRzN2MjRyL2tIT2lwNElrZ3pkNmhTSmoxcmRKZ2Y3a0ZmclJJaEtFbVpl?=
 =?utf-8?B?REt6dFcwMzRpYlhqZDh1TjBoUnAzVElXTURIc0RZOVRDc2FkaHpJM09TOTdp?=
 =?utf-8?B?cWRwdzU4K3FWeko0S2tpTjFMWnJtNmdnSmFBUXEvSVpFaWxOcCtiYmdOL1Bk?=
 =?utf-8?B?TktQcUJKR0g5YitRRFp1RHBhd0FzblZlNStXaGxIYnlUN0lSUDdxbFJwYUJJ?=
 =?utf-8?B?SVZvM1pERExMUUtIRXdGL1RnQTBmaVV3Q1ZESXpQV0ZzYlluTTZDRTF0YTBX?=
 =?utf-8?B?MFhwd0xYOW5CYUcrS3hGL01mRUFBdzd0T0lVaVNFMnFHa3FpL2tzVll0dmJS?=
 =?utf-8?B?UUVLYUowQXkwRVNzNVY3WmNKRFZvK1crMmZ4bHdscS9IN1VuSUF6NTZKY3kr?=
 =?utf-8?B?THRFUHhUem1QV3U1M0JENGlXWDlDemdJeld1SU55d1Jma3Jpd2RuaXgxR1Y3?=
 =?utf-8?B?WlZnSllBdkdVTFZxWlowWHF4THBrcmNxakczdmd5OGp4SHNwSzA0K09wNUt4?=
 =?utf-8?B?QUFiZDVVS0xRWXMzS0VMQlR1YzZ6aUhrakVnVUc2MnlKQ0RpbzdHTmd6UmJj?=
 =?utf-8?B?UnVabnBxb0luY0F4aEtOdjZZVC9FUTBSU2tiWjFJcVpLZHlUSGtja3Vrb0RM?=
 =?utf-8?B?YURrRWJpYVRUaFllNks0OTVlL2l3U1FWM1NGSGNYSHYyYzlMZm1SK1JJYVhD?=
 =?utf-8?B?REdXUGl3RUxuMkl5MWNIdlkxazVDUEcrNURSZDVCVjJVYUk5RmlvOTZMUmFL?=
 =?utf-8?B?MUNZR25BR2doOFRGZ1k5cjk5d2VQNFhvcXBabmxtWU5qWStUTmxxZi9BcWpC?=
 =?utf-8?B?K2pVUjltdUdYQ2JzdW9xSXA0UlR2bDFRN1dUdk9oM1VnS2VKUDY3c1Zxd04y?=
 =?utf-8?B?dy9KY2gxY0JDTlNOK0hTRDA2TzlldzBUalY1M0NrckQ0MGc2RUxUc0ZSWG1u?=
 =?utf-8?B?UWpjUWlqdmxFa1ZoQk5LNmRQRVVicjBRa0poajltbXB5aW5iNjZXdzcvQThP?=
 =?utf-8?B?akRGZkNuaHFqd1k2dGdtR2xTb09BTWJqY3lHN1VrZTl6NUJEbWQyVDhwUkJV?=
 =?utf-8?B?TVFNVFliSHUyY0wzOWtoa0lFZ3BiZ1QrSC9LcHpjN1hnNEY1L1BndE8yZ25w?=
 =?utf-8?B?Yk1OcmRORnZiTm1uOHNPakxPS0lpNlpvYVk3MEJ4VWk0MWJWUFRPUXJKQS9Z?=
 =?utf-8?B?QXg1ZThoK003aHZSQTBqNERVUS8vM2tXOGVucXI3R2ZoRU5YWndoZz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79d8a644-e3dd-428b-b106-08de6813622d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 19:42:39.5586 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gu6ajq9p4x6t+9Z1VSu9vAvLlTzXnGWKZzSByvkV6AbvCwtZURXId1HzawJPaC4fQ3TVsHrZOUdmE0zhSIbqTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4066
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[garyguo.net,vger.kernel.org,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,lwn.net,amd.com,intel.com,ursulin.net,gmx.de,google.com,protonmail.com,umich.edu,nvidia.com,weathered-steel.dev,joelfernandes.org,lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_GT_50(0.00)[50];
	FROM_NEQ_ENVFROM(0.00)[joelagnelf@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,nvidia.com:mid,Nvidia.com:dkim]
X-Rspamd-Queue-Id: A580F11433C
X-Rspamd-Action: no action



On 2/6/2026 4:30 PM, Daniel Almeida wrote:
> 
> 
>> On 6 Feb 2026, at 14:27, Danilo Krummrich <dakr@kernel.org> wrote:
>>
>> On Fri Feb 6, 2026 at 6:20 PM CET, Gary Guo wrote:
>>> I asked for this to be changed to `pub(crate)` because I think this isn't
>>> something that should be used by drivers.
>>>
>>> As you said, tt might be tricky to enforce that with new build system when
>>> subsystems are inside different crates. But until then I think it's better to
>>> limit visibility.
>>
>> It should *usually* not be used by drivers, but there are exceptions. For
>> instance, it is perfectly valid to be used by Rust drivers that interact with C
>> drivers.
> 
> I agree with what Danilo said here.
> 
> I don’t see a reason to forbid drivers from using this. If the reason is
> the unsafe bits, then isn’t it the same pattern used by impl_has_work!()
> anyways? i.e.: a macro that implements an unsafe trait so long as the driver
> gives it the right Work field. Seems equivalent in spirit to the clist_create macro
> introduced by this patch.
> 

Thank you for this suggestion. As I discussed on the other thread, I think the
consensus is to change the module level to "pub" and all the items in it to
"pub" as well. So I will do so.

-- 
Joel Fernandes

