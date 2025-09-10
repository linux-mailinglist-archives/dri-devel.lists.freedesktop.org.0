Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18D1CB524A5
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 01:22:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D539910E9EB;
	Wed, 10 Sep 2025 23:22:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="h48NlxF8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2059.outbound.protection.outlook.com [40.107.92.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F041E10E9EB;
 Wed, 10 Sep 2025 23:22:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bjVvdLuQ8NyMMWEJ3vn9Al9YJRoU2NxKrAfoXOGXCRSRpzsaRFJA3hgpqgO3L9WWVZvAiu9pirQzv0agEBlV9ZbLDhUR1ilgt9cvzCsgUZgucp6z8FlWNWpzJzGh4TOdo6HBBlOkKw1CetNO0h2BOc49JzloqUR1q+TDWO7RhYMj5EAS+LeD7MtxjMLEBIAwRCS8zw7KdJgaiFM1SavQj74jEHzqi18dpDNvhYQZi4KHukKhZuhjTausI8ZgtFqofMf/5YT+1vjL4rasNlvpYNppeuPZM4bd+u44EL06YHSWf+3BOO7klOoS1UbT20sQVWtpXr/4vzet40R2JjFx/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6SU/Eghwj+7aUHAhfrC1jqVxE9Ob0ksMLPDcqqm7XKk=;
 b=bmKY/WmCgmz8AhBTHBU3u8L286sP5TZgrkYZjuvihzgEVyJeX92fuXyjn4ysWwGi3GV82DYuLN2G0QjdPBBTUtYE76iExpZe6HpI/mVq0V9/36N0xdmdmC8iuq82IXbXrI3LQBpG9h/vPpZ3Z+1LOW5gGbjkgxStaMn/+IpszDh9g+YBXzXGG8DDJZUAldUdZk0M1haiAMTkmsCI4+PjeDFRYwwNSW0RKKGO964LSDomoSqXRS/uGyaISyuBEtdyySu9TY8v96lOWs7i9cysdTZToJ9jdhbDw/u9r9bPicO861a/opJHKXB4dr6CeGZNRzwKdfIV2qK2RiT+Kmo9nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6SU/Eghwj+7aUHAhfrC1jqVxE9Ob0ksMLPDcqqm7XKk=;
 b=h48NlxF8gGujuD1YCIBZPL909dsqnc4RclJ4SqjmdxRbLydnPQ9H6MQyKrzs4L1F+ASw9OOB4WY6VwjlAsmJAlFr1rVhXwiidrFWpQEsnXDm3EUn+hT5z46Ow5F8Z+qER/5J5yI6mLvu6Ca0aA5MlMTfMuf3YxozOXvJTtX9QV6xZt0XLFiBBC3Hi0GrPGe4ho5zn1cFCTagPoWSigAiLKECrCm4unDCAqhJuRgw/fuXf++BtqCNa7FVUJDV787jXcYfN6tMff24txif9tQiqioB9lLrAy/rNFViGW24ZIujXRU9T9+ug3KUEuzyVod/NedHifmTw4v51Ui8riE+3w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by SA0PR12MB7464.namprd12.prod.outlook.com (2603:10b6:806:24b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 23:22:07 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.9094.021; Wed, 10 Sep 2025
 23:22:07 +0000
Message-ID: <5642a7f2-c18f-46cf-8136-9fccd1c121ae@nvidia.com>
Date: Wed, 10 Sep 2025 19:22:03 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] rust: Add KUNIT tests for bitfield
To: Yury Norov <yury.norov@gmail.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dakr@kernel.org, acourbot@nvidia.com, Alistair Popple <apopple@nvidia.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 bjorn3_gh@protonmail.com, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 joel@joelfernandes.org, Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>, nouveau@lists.freedesktop.org
References: <20250909212039.227221-1-joelagnelf@nvidia.com>
 <20250909212039.227221-6-joelagnelf@nvidia.com> <aMDq2ln1ivFol_Db@yury>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <aMDq2ln1ivFol_Db@yury>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: IA4P220CA0008.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:208:558::6) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|SA0PR12MB7464:EE_
X-MS-Office365-Filtering-Correlation-Id: 00c8af6f-c383-4d43-be85-08ddf0c0dbfd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UW02SGxtQjd5OWxOSzgzdXV0ZVVYZkp5UVpWMmNQSGNMcHNsUFdSaEZzQnRG?=
 =?utf-8?B?aXJwTnZiblpUY0VZSURycXNobDRhdWhpekdOeDRBVmsrQU5jSG5zdmc1eEJr?=
 =?utf-8?B?WUZLelNSOFg1RDhhM0FpWmZObWI5MCtYTVEwRlhSeFVjZVkxNHZ2bHJTWWZj?=
 =?utf-8?B?RUJpdk9qVEptc09PdVR2NTRsSGNnMk5iNWhVWmIzMG12WlpEcUhzUm8xcnJi?=
 =?utf-8?B?UUsvWmtKUlJVaGFBeVIvdzBjalgyU1ZZUUp3NFFselM3SEtsSUZBVGVIN1Jj?=
 =?utf-8?B?bFRlYlV2cFdSOWFhM0FOcnpMTDNaM0k1eE15bW9xMW9WTU9WWnh3SWNqaFNv?=
 =?utf-8?B?bUl3NWpEZzhZUnlSK25OS0VmSVdHV0Z3UUx1QlNRR0VlKzBaamR6eTkyZita?=
 =?utf-8?B?dTdoSVNtS2srTEh4YmdIV1I4VGFvYVlQUkswcmxBc1dBZGo3UWxjeU1FUEpC?=
 =?utf-8?B?eElWRFNJWHNOZHg1bE1LYU5kUW4zRjVneWZuTU1RaWtjR04rVkxvZ1cvOUx5?=
 =?utf-8?B?d0RadDl0RVBTaEZ4WWhWT3Y3K2dkaHprVkRyL0R1SmY3SmN3NERLVFFrVUpM?=
 =?utf-8?B?c0ZZRHBobUgraEhBcElwbHIvbi90dWhsb3A1bGJ0Uk5aRk1pRTAyMm9wTUlw?=
 =?utf-8?B?aHdETGNIVlF4VU53VXJrQVErV0VCMTNCc2Z6R2RoN0ErcklETWNIRnFzNm9N?=
 =?utf-8?B?SGF2a1psQjVRR1NYdCswZDJyNlpUTHphSkJ0VWxyNWJGMDA5UGxSNkhmYktz?=
 =?utf-8?B?MEcrQmgvSXdlb0t3VTZYMy9Ta2twWjI5RStXRW52TWsyZEwzaTVCUFh2d2Vz?=
 =?utf-8?B?Zk9oK1hRNHFLZU5kS1BqN0M3azFxRnFBYmlyVWdUSFE2Q0R0SHhoVHVxektL?=
 =?utf-8?B?UXpsY3FHMjdRYStwZ0FlWW1HVHFZeHVndU5waG8vOGhXZ2hVVkJGQ3ZDWXR6?=
 =?utf-8?B?NlVGMmNQNFE1ME14dVM5Nk9hMUVxUWRPUVc2OEhlWDg5VTB3OFFGekVNU1dT?=
 =?utf-8?B?eHhYaUF6bEUrVUhEbkdvcEJUQ3Q3UncrYTRKc0Vtd1hxV3JVNkhTWERsMlNK?=
 =?utf-8?B?R1JveEJOVFNwSy95YmVBN3o3QmFuOFBHdWVUYmIrT1NtcTFOWFRxQzYzVit4?=
 =?utf-8?B?eGQvZXNYOWpqSVlQOGNlZThjL29LREdwMzROQW1ZWDlYZE9rVUpzUC95aHRq?=
 =?utf-8?B?aWFhdEdZdHAzT2FOZFlmcWV6RjhmUWJKS2U1blVsazhCcm44a3dNWVRxU2dm?=
 =?utf-8?B?ekFWSjNzS05XWUZ1bGE4WUp0d3JsRVRvdzQ4RDFJQjNGZXZUblMxbXhTcUhW?=
 =?utf-8?B?d0FxL0ZQZ0NqTHViNTdmcjhsdDg3M3g1b29PL1kySlJqWTlBYms1QzJpL0hN?=
 =?utf-8?B?TjcwN0JUcGlyeFB2U3ZmQU9tU1g5S0VlWFhDcG1xQVhsZXFLd282WE52dFIr?=
 =?utf-8?B?TmtZQm01d1JRNGxTQkxCcVdxLzZwWWpQL2J6bDJ0bURLU2YyQzNNUk9ZdlIy?=
 =?utf-8?B?ZTk4RXF1a2dxRlFna2RDQXMrekpwdjQ3SlY4QlRjQ3hVUUV2c1lSU0Y3S3Vw?=
 =?utf-8?B?V25GZXhqQ2piUzNMM2E4ZXhRWURYeEVVTXZFS0JXRURxZFozdXhSYXRpeXNm?=
 =?utf-8?B?SWZRVXh5aEppaXdJdk9SWWhySHA4YVBaTEFBZVBDRlkvMjQ1aGo4ZTJlMFFL?=
 =?utf-8?B?WWVzMVZHVWplM0ExUkZIdmQ1SnkxblRTektUOVlFKzJ1ZVVsOXR4R2VaMXpR?=
 =?utf-8?B?a1M4R0V1cThJa3BablJlNTVrWE1GV1pubG02RjB2K3FSTlRMcjZLR3ByUnZa?=
 =?utf-8?B?cm1YblRRR2NtQ0RCTW1LZVgvYitpV3E3RmpXVUcrdzdEOHZXYUtjek5DZWlB?=
 =?utf-8?B?M2NIUUEvSURsQTNDc2dxSTB4dU9JbmovaXRuaVIvM3g5YnRrblloZzRhZXBm?=
 =?utf-8?Q?8OR35XAfmZ4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MzFiNTBiVEl1d3FncDA0N29ZTy9LRlU2djhickh5Y0JqT0hZZnRSZDJqUnJI?=
 =?utf-8?B?TzNGeEgyNm1EcEszQ3BPcDFZK2FiVGtjcll1M2k5ZzYvcldEU3pJZGVGL0FW?=
 =?utf-8?B?OTNnZkJmWG56Q2dqalZobG95NHVIZ0JwdVkranlIK2xnaDM5RDJtR0lON0lU?=
 =?utf-8?B?MUpON1FWcEcyMzJyRmZQbGEyT0dtWHNwKzVTMWN5UEsyWnhvUUpmOU5hTTY4?=
 =?utf-8?B?WHdhcHFydVJiY3V4dUswUG9oYUNWVS9aZC9KNU9yVllybm9Sdm93dzhMVzdC?=
 =?utf-8?B?d21qRjlKK09uZUV1RXZxKzlrUkVyQ20rd3lNM1lPYm02NzZLUUg2QUdtQ2Ir?=
 =?utf-8?B?MTVGdElSQytsb1NCdGlvVitZVU1JZnJlU2xsaE5zWmhtU0Y1dkx5Rmppb1dK?=
 =?utf-8?B?R0dtK282SkZFY1g1M3pwR1h3VzRMd3VtMWxkeGIzWUtZN1h0bUZLbUMzUGtY?=
 =?utf-8?B?QTN3aW1CUnRCTmhTRDd3NEJ4eGtLNW9MUFBsQTBYTHhDd01LUkhPQzE0VU9u?=
 =?utf-8?B?QTVwV0lEWlVZb3ZMbTFDSlZXNk1QenBBbXN2dndDRTNRMjVKekpLcVpqQzNB?=
 =?utf-8?B?U2F0RWo3aXd1YkU1Z1I2THlIRzZBN0NBZ2xRYk5MUHpwZk1zV2ZGNWdKajhS?=
 =?utf-8?B?RmtxWEJEZUVVd0tYYXpVdkJkWjBaOTB2WlBjSjhYbXJNcnVrTG9FbDVMMHF1?=
 =?utf-8?B?clhxK09aZm85bGtRVjJ2R3hkekpxY3FuY0JKVG5zL2NHK1BxR3lrR01ONFRh?=
 =?utf-8?B?ZzcwajR4UXhsZWhZd3VnRUhHeVJOUzFaS2ViallzclJEOG5LODFGK3BqTGFI?=
 =?utf-8?B?U2h6S09FODVSbVRLZzRGdWI5bkRYZmdJbi9ST2RUUHZiblJOaFc5cHhrTWVl?=
 =?utf-8?B?WjdFVUo4QzlKbVhZMUE3bnJzS1pPd3d2aURCNzBiODk5VThYV3UxZjNiRDFY?=
 =?utf-8?B?S2plU2dBUXNScDV1Kzc1V01GbERSTUxHK1NNZzZxOUxZYWNKc0lCTWpwNFZi?=
 =?utf-8?B?Q25PUERzOWhzb1djVUZSL2MxNlprYXdEVVBWK1NLYkdoalpBZm5wYTlVWmR0?=
 =?utf-8?B?aEtUc3ZjSVo4VTdPeUNKUHZIakdFbzl5RTYzMnp4akNucnR2TklMZXB4cHhP?=
 =?utf-8?B?a3ZZK0QwWDJzSTAreVduQjNhY0oxK25pTHV1Rm90aklwV0pOT2RzWG1YTkdL?=
 =?utf-8?B?UEFIK3drRHZTSFg1UG15OEl1UkQ0eWxTUi9oSDFMaWJCV1A0V1N4clIyeTMx?=
 =?utf-8?B?VTAwU2pWbDkvTTZLMHB2ekZaaGpDWTZ1VCs4Q2lZMVpBTTROSVRUYjVWNzE1?=
 =?utf-8?B?WlRuUlo1VVB1RXg4Y3J4RDlwTGpUdmV1R05UdXQ1UGFOc284cjRndDBVKytV?=
 =?utf-8?B?aWJaajBvcXR6ajJyeTArOTFkNGZ6a1BOMmJNeWc0KzFJV21iaVMrMEUyWjBn?=
 =?utf-8?B?Z01kekdnbUgrdG1oUW91ZTE0Nlg4NTVHNjcvV0l1SUJpdjQvemMwd1UrM0VR?=
 =?utf-8?B?ZGxGSm1nY1hJR0dFWm9HT0N1UitEdkMzK3kwdmtjb0p6T2c0Y0RJNiswend3?=
 =?utf-8?B?VktBOTBKY0VRWlF4NDRVdEFMSEdCMXBnWHJlaFNmZWk1a242Y3psSm9hRU5X?=
 =?utf-8?B?NysyeXlhNnpDSGp3dmo1UVpHY3pvd0FFZ0ltNFdyRmMrYVgwVUd0UDNQMGg0?=
 =?utf-8?B?VDRldnllUWhUNCtoQ0JIQUZ6cGtkSXo5ZTd5ZisxZWsxU0FkSHducHF6dDB3?=
 =?utf-8?B?WW9QWHhYSVVLMVZIdkZlTmM3QjZkbnFRTHM3eHRpTGlpK1BMNGxPc1NtNHdJ?=
 =?utf-8?B?dW40ekc5a2c4TWFzcEt3QXpoRGJTNmNpR1RFMmMzN0twZzdFeDNWMXZWVEVy?=
 =?utf-8?B?d2ozSHR2YUFHTHVRWHo0aVhvNUxzSGFsZ0NOVFNUR2tTTTlQS1dDNXdnR28x?=
 =?utf-8?B?L3pnLzdOL2R0MkY3Tk1rSmJvbXBUeFQ4QnNaZHZJeGJXVmZMajgzUFBOdXQ3?=
 =?utf-8?B?bVNKZmJJaE03NDY1L3A5ODUxWmVRNXZ3eGlqbndmTnJ6TlZQbE9Ic24weGFG?=
 =?utf-8?B?RmR3cVU3Nmp2aVFYOFRSMkZSRmt4aEc5aE85Ym1pL1BVU2FYZVdXNCtESXhk?=
 =?utf-8?B?ZTk2QXBCQlFyNXZ1VElXcGZ4U1VhbGJRUG9OTDZBc2gwc1AxWXAzS2JGN281?=
 =?utf-8?B?WGc9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00c8af6f-c383-4d43-be85-08ddf0c0dbfd
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 23:22:07.3208 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WkQ9GIlrA1NQmrpfXgToAKwok6y46QmerOefpMsrvRXRb1HGeQtha03Iifz6FcjcYf7VMq0ykUmvmj+/LC6ufA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7464
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

Hi Jury,

Some reason I messed up with my email client while trimming, so I am re-sending.
Sorry :)

On 9/9/2025 11:04 PM, Yury Norov wrote:
[...]
>> +    #[test]
>> +    fn test_range_fields() {
>> +        let mut pte = TestPageTableEntry::default();
>> +
>> +        pte = pte.set_pfn(0x123456);
>> +        assert_eq!(pte.pfn(), 0x123456);
>> +        // Test overlapping field reads same value
>> +        assert_eq!(pte.pfn_overlap(), 0x123456);
>> +
>> +        pte = pte.set_available(0x7);
>> +        assert_eq!(pte.available(), 0x7);
>> +
>> +        pte = pte.set_available2(0x3FF);
>> +        assert_eq!(pte.available2(), 0x3FF);
>> +
>> +        // Test TryFrom with ?=> for MemoryType
>> +        pte = pte.set_mem_type(MemoryType::Device);
>> +        assert_eq!(pte.mem_type(), Ok(MemoryType::Device));
>> +
>> +        pte = pte.set_mem_type(MemoryType::Normal);
>> +        assert_eq!(pte.mem_type(), Ok(MemoryType::Normal));
>> +
>> +        // Test all valid values for mem_type
>> +        pte = pte.set_mem_type(MemoryType::Reserved); // Valid value: 3
>> +        assert_eq!(pte.mem_type(), Ok(MemoryType::Reserved));
>> +
>> +        // Test failure case using extended_type field which has 4 bits (0-15)
>> +        // MemoryType only handles 0-3, so values 4-15 should return Err
>> +        let mut raw = pte.raw();
>> +        raw = (raw & !(0xF << 14)) | (0x7 << 14); // Set bits 17:14 to 7 (invalid for MemoryType)
>> +        let invalid_pte = TestPageTableEntry::from(raw);
>> +        assert_eq!(invalid_pte.extended_type(), Err(0x7)); // Should return Err with the invalid value
> 
> Please make sure your lines don't exceed 100 chars, preferably less
> than 80.

Ok.

>> +
>> +        // Test a valid value after testing invalid to ensure both cases work
>> +        raw = (raw & !(0xF << 14)) | (0x2 << 14); // Set bits 17:14 to 2 (valid: Device)
> 
> Can you use genmask!() here and everywhere else?

Ok.

>> +    #[test]
>> +    fn test_u8_bitfield() {
>> +        let mut status = TestStatusRegister::default();
>> +
>> +        assert!(!status.ready());
>> +        assert!(!status.error());
>> +        assert_eq!(status.state(), 0);
>> +        assert_eq!(status.reserved(), 0);
>> +        assert_eq!(status.full_byte(), 0);
>> +
>> +        status = status.set_ready(true);
>> +        assert!(status.ready());
>> +        assert_eq!(status.full_byte(), 0x01);
>> +
>> +        status = status.set_error(true);
>> +        assert!(status.error());
>> +        assert_eq!(status.full_byte(), 0x03);
>> +
>> +        status = status.set_state(0x3);
>> +        assert_eq!(status.state(), 0x3);
>> +        assert_eq!(status.full_byte(), 0x0F);
>> +
>> +        status = status.set_reserved(0xA);
>> +        assert_eq!(status.reserved(), 0xA);
>> +        assert_eq!(status.full_byte(), 0xAF);
>> +
>> +        // Test overlapping field
>> +        status = status.set_full_byte(0x55);
>> +        assert_eq!(status.full_byte(), 0x55);
>> +        assert!(status.ready());
>> +        assert!(!status.error());
>> +        assert_eq!(status.state(), 0x1);
>> +        assert_eq!(status.reserved(), 0x5);
>> +
>> +        let status2 = TestStatusRegister::default()
>> +            .set_ready(true)
>> +            .set_state(0x2)
>> +            .set_reserved(0x5);
>> +
>> +        assert!(status2.ready());
>> +        assert!(!status2.error());
>> +        assert_eq!(status2.state(), 0x2);
>> +        assert_eq!(status2.reserved(), 0x5);
>> +        assert_eq!(status2.full_byte(), 0x59);
>> +
>> +        let raw_value: u8 = 0x59;
>> +        let status3 = TestStatusRegister::from(raw_value);
>> +        assert_eq!(status3.raw(), raw_value);
>> +        assert!(status3.ready());
>> +        assert!(!status3.error());
>> +        assert_eq!(status3.state(), 0x2);
>> +        assert_eq!(status3.reserved(), 0x5);
>> +        assert_eq!(status3.full_byte(), 0x59);
> 
> You've got only one negative test that covers the .from() method.
> Can you add more?
> 

Sure, by negative you mean the test that returned an error code? If so, just to
note, we can only add negative tests if there is a chance of
runtime failure, which at runtime can mainly happen with the fallible usage (?=>
pattern). Also just to note, we already at ~300 lines of test code now :)

> What if I create a bitfield from a runtime value that exceeds
> the capacity?
> 
>     bitfield! {
>         struct bf: u8 {
>             0:0       ready       as bool;
>             1:1       error       as bool;
>             3:2       state       as u32;

Here you mean 'as u8', otherwise it wont compile.

>        }
>     }
> 
>     let raw_value: u8 = 0xff;
>     let bf = bf::from(raw_value);
> 
> I guess you'd return None or similar.

No, we would ignore the extra bits sent. There is a .raw() method and 'bf' is
8-bits, bf.raw() will return 0xff. So it is perfectly valid to do so. I don't
think we should return None here, this is also valid in C.

> Can you add such a test?

Sure, I added such a test.

> The same question for the setters. What would happen for this:
> 
>     let bf = bf::default()
>              .set_state(0xf)
>              .set_ready(true);
> 
> I think that after the first out-of-boundary in set_state(), you
> should abort the call chain, make sure you're not touching memory
> in set_ready() and returning some type of error.

Here, on out of boundary, we just ignore the extra bits passed to set_state. I
think it would be odd if we errored out honestly. We are using 'as u8' in the
struct so we would accept any u8 as input, but then if we complained that extra
bits were sent, that would be odd. In C also this is valid. If you passed a
higher value than what the bitfield can hold, the compiler will still just use
the bits that it needs and ignore the rest.

Now, I am not opposed to error'ing out on that, but that's not what we currently
do and it is also not easy to do. The setters in the patch return Self, not
Result<Self>, so they are infallible, which is what allows them to be chained as
well (builder pattern).

I added another test here as well, to ensure the behavior is as I describe.

> 
> And for this:
> 
>     let ret: u32 = -EINVAL;
>     bf = bf::default();
>     bf = bf.set_state(ret);
> 
> For compile-time initializes, it should be a compile-time error, right?

Yes, since the struct in this example is u8, this wont compile. Yes, I will add
a comment.

> Can you drop a comment on that?

Yes, I will do so.
> (In C we've got FIELD_{GET,MODIFY,PREP}. They cover all the static
> cases.)
> 
>> +        let status4 = TestStatusRegister::from(0xFF);
>> +        assert!(status4.ready());
>> +        assert!(status4.error());
>> +        assert_eq!(status4.state(), 0x3);
>> +        assert_eq!(status4.reserved(), 0xF);
>> +        assert_eq!(status4.full_byte(), 0xFF);
>> +    }
>> +}
>> -- 
>> 2.34.1
> 
> I tried to apply your series on top of master, but it failed. So
> my apologies for not finding the answers to some questions above
> by myself.

Oh ok, I applied it on top of drm-rust-next. I will rebase on -next for the next
revision, thanks.

> For the next version, can you make sure your series is applicable
> on top of master or -next?
Sure, thanks,

 - Joel

