Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CC21B52470
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 01:08:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7542010E19E;
	Wed, 10 Sep 2025 23:08:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="aan31kPx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2080.outbound.protection.outlook.com [40.107.223.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 637CB10E19E;
 Wed, 10 Sep 2025 23:08:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wv6+D8EsWy14zq9Mwudk7KyjD0CU17htVgysZaz569pVULy4V9k3Vv24llvChz1DUXm1c4h/adOLKh2nmZrdU0ZAkHwAD5QJW4A5D04sUsAxsh8fkV1iaWvaW1op9n7UW/wRjzi8ESW2E5tyxfJSiVSH497v5koMZU02JbKp4kp2vTTacN/oZO9RE25ixGtvmut27ybFwGRbjgUDHAxBfwe8WzcJqinR7tQ0QAsfmTJPMcJGiHqJTaXH6XHr3My5nO3UvS+XKSccsTz5bAE/J2733zzrmnOcfHnI2k9O1PvrJLJ90s30OA6QUmbAWWFfE7rXtuDrValKJyRYL8GxQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5gEGaZP8W9sX+CuC782g5akSE1b+SXTajtT7T2l0K4o=;
 b=OE7wHppNvcMRay8lQKtqnCJyrxm5rlQLMvGQ9TBfKuyowzVWBCKz0agH7DEcjyHmHlfjJ5lObf5fZCPcld5rw8BzQ+0uml/2CnKsRu5e5UB7+swwyfzweEwCycnBp2x3FcZqAxwy8iMbFCniSFlS+V/8TITQx/+Ci+EQBkBFr6kl3s9VULgNs/fRYA9ewGlqW2aZmpZLPdQ+HGkLvYEjSjROOxu9KygUsagseoSoWxk05Q+AqqdVRlsiA9viP3yiByXVUtKTod2pH/ga1uOKXAVXi/7zyDL/YcfpsWv79ZofO4+wfA3ZO5e6O3QqJHDyvUcCyWx52qVyVL7eZfSZOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5gEGaZP8W9sX+CuC782g5akSE1b+SXTajtT7T2l0K4o=;
 b=aan31kPxAp4V8ptKGamT616P9QO38C5LKN0tNchv8CdcfLd/CdBPMgIYFa22yTK4BS8QaxV8GV2NcMQN5IoZQcvO5xL4Z3QrcjxHzXqJwYyMpyTQkogujfi5Cf+iqv2HK9I9Xndgj6++YLOb+lprXMyff0sphxqnT5E1A/hWRv0xxdnWN6HxtSuJArUU5KWGjzv2MecT2a7LbDWHfZvaVb5I0SH6/Sxj+Xs2waoZLYh5TetM/rYDw1/UbRmgwYvfgTKyhFu+IgTHp94fqU/1PfPNnWEZt/X1kvbykz32evz5sQdHlzZ13y0ZmRZwTkWSO/IKlvuZRit1dA/v0nRGzA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by IA1PR12MB9031.namprd12.prod.outlook.com (2603:10b6:208:3f9::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 23:08:47 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.9094.021; Wed, 10 Sep 2025
 23:08:47 +0000
Message-ID: <bbd6c5f8-8ad2-4dac-a3a4-b08de52f187b@nvidia.com>
Date: Wed, 10 Sep 2025 19:08:43 -0400
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
X-ClientProxiedBy: BL1PR13CA0444.namprd13.prod.outlook.com
 (2603:10b6:208:2c3::29) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|IA1PR12MB9031:EE_
X-MS-Office365-Filtering-Correlation-Id: a69bfd1b-d6b7-45b8-1dae-08ddf0beff4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VlplTGpiWWxhWkl4YzByN3RtQXcrdyt3bE5ucEdSc2labDJST0g3NUs0QnFt?=
 =?utf-8?B?K3RVTW5LcU9tQVNtVkpNNUVBd1doUzVGdzNIa3FKS1ZpcWdrNCtySXBtbWVh?=
 =?utf-8?B?dFNtVlR5OFFPYXUveWRCYWhVRTBWMmp2bGF3ZUwwY3BBbGNzeXhlTTU5Q24y?=
 =?utf-8?B?NlhnUjNRU09RSGpoVW53ZHY3UkhmcU5ZUE12cE5yVk0xelQ0QisvTHRuakkr?=
 =?utf-8?B?enFJNmwyTGF2TTBiQzVTOEtmdTE5WVMwNGo5Z1FiSU9KZFp2S1E4TVc0NUlQ?=
 =?utf-8?B?Vkk1eUlaNjNPOTBYZ1dmQ3JhbXlndDhJUFdVZy9jaEVmak5YZ0VWV1g0U0x4?=
 =?utf-8?B?dGl2eHhMZGJndThkczhsM2NEN09nanoyWDFhNFJGQm9jK3FZQW5sY0Y4QWZ2?=
 =?utf-8?B?Ykc5V2hNaldFUmVDNDhaRHB2MTNoeVRDVmMyL0dRT0dWMldKSUFmYVNkMWpN?=
 =?utf-8?B?WUhnYVFMYUZjMmFRUGFYcHR4WjNrKzFITERhM0hXZldxcCswTUtFRHZveS9Q?=
 =?utf-8?B?MDJnT3FORWpXdlR2bWs0blRmeHpPY3JWTzNFaFhMN2crSTVPcDN0MTRYdHlW?=
 =?utf-8?B?Z1U5dzFiYnNCcjIvT2tqeFdMTStWd3NMOG5LQVcraUwrcWpUQ0syOTlGL0Ni?=
 =?utf-8?B?MUc5UTAwUGREd0swQ2xsZkdEOE84eTZvMU1SSDdoNzcrUDdXUDBNWndjc3l1?=
 =?utf-8?B?V3N3Zk5uYy9adDcvMFU1VGIrVzEvUkdIUlpQbWJRaVIyOHBVbU44NEM0Y1ZQ?=
 =?utf-8?B?Wkl5N2RoYmtoanQxdXdoSmZZMGNxT3FmMHFIbjZYckhySGJ3U2Z6dmlaeUo1?=
 =?utf-8?B?SWpmRW5uTCs2UnJxVWpHenl2SlRkVTFtWUJiQVAvYWI3SDdJNmVoemlDZ2U3?=
 =?utf-8?B?bElBZ1VoS1BpQXU1VXlJQmFpVWhNQW5kUlo4SllwL1pqVkxjN01lQjlRMEJS?=
 =?utf-8?B?cTlyNjFnNFY4MVRkSDhiSHcxVE93U3NudUw5STBwVkJpQ2huUUl1N3VSRU1G?=
 =?utf-8?B?bmlOQzFWZ2xqZnhxWTdhK0VzV0t1OTRTMlZwS0QwUTJJczZKSGVqODU5TEx0?=
 =?utf-8?B?Z1RERjJFNWhjS01EUE5pMWNzYUdqaG13bGVMQ01sc21BelBTanB3VTFwUjNo?=
 =?utf-8?B?QzhUSmkvSk1HSW83dUQ2dTFVd1VTRnZCZW1JT01rSGtDZjZsSHZJakpWRllV?=
 =?utf-8?B?MFRCai9FMlNlSXdYSTdwdFQvZ3JUM0gydjBTdDlOa0kwQUJjMVJwSlVvTE1h?=
 =?utf-8?B?clVWbURVSFBNbkpCdjlHSXgweHlKVUxkVGZGVVh5U0RQMng2WmpBYVoxREJz?=
 =?utf-8?B?TWRpRTIya0QwUGhxd2VVajM3RGp6RjRWUHlOQSt0a3VKbCswQ2huNEJaN3pH?=
 =?utf-8?B?TmVtQjV3RWx3ZXAyOHc0a0hNTVdCdDBiVVR2cXNmT092NyttemE2Nzk0Z0tU?=
 =?utf-8?B?QzdjWG9UUlhPT2U0M1VYMnlCWExMUXFWbFJDZjdjRlFqZElyRFM3aFBFOUkw?=
 =?utf-8?B?RFcwVWRtUzJyZTRCMEpmN2x2UmZaOVJPaXFPRXFlTEJXbHJnMWJCWWFYbTdq?=
 =?utf-8?B?QVVmaXpud3lETkI2RlA5SG82S0JMNGpwcVBLY2ZycDhSdEdsZDdhMllKUTkx?=
 =?utf-8?B?bS83a1B5WXJvSUNXc3VlbjBzVjhuU2daWHBidnpOaGtsWkJxUlZZNjZ1T2ha?=
 =?utf-8?B?RG43VGc4N1ZySDFWMlpkNzNOYVEySmNscmVXRUdrMnlFc2NzSSt5UUR1ZU5E?=
 =?utf-8?B?ZDZpWnVLd2FEcXJHSU1pYUhFSUlkeFhKT09Nc1lUUTQrZ1BQaThNOXl0NUVO?=
 =?utf-8?B?Y2MwZDBFN1Jlc1RSV25DWk5lUUxrMzg4U2N1bWQwOWhMcUZDMDRvQ1ZZODZu?=
 =?utf-8?B?Q3RtVTNFbDJqeE9nc3F6dXVYeHRYWnFSU3pvSlY1eUMxdHhUUkxvSFo5ZE1J?=
 =?utf-8?Q?ynI9/gKD9Z0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bEtOMytCdGtkNVRSZUw0T2VVdWRxeGpic0hpaHlLQVFSVHF0ZzlqTHh1VzhB?=
 =?utf-8?B?RWJ3V1A1OWVsUkhSTEFPYm9wZnBjWGM2SmZOYytIQUdiTDFUYzljSDVBUXUv?=
 =?utf-8?B?VDQrU1NoY3JMbVp2MXJ4MU05WDBQK0VBREE3VGU0aXNiTWxaUVFOV0hZUjgz?=
 =?utf-8?B?YzRxRk1nNTB0cDhIajJmejhwM2xaVVFUa2IzSVFHOWVnVHR1RFZnUzR6SVE5?=
 =?utf-8?B?a2ZpTkhmczJBelNsUVVOai8xUjIzY2JDOExOOWFFd3pZR3B1ekwrczc3K1E3?=
 =?utf-8?B?SlQ2YllBYVgzVFhBcTBBeW96TGNTNXBIbXpjUWVXT2NRaUhRS0w4cE15MFA3?=
 =?utf-8?B?aXZyeXdscTI2UzBUdFpnRy9LektOcWVDbHdxVG13aDdQZmk3YkhiU25qdFkv?=
 =?utf-8?B?eGxES2U5WW9sS1g3TmNQdkVZV1lrVFdjL1hTZDdQc1hWb0tEMk5zVlpZdG1T?=
 =?utf-8?B?dHlWOFFCaEUzZGszUDZ5QnZYZE5OZGl2WTcvQy95VktQN2dKVjRmVDJXMUUw?=
 =?utf-8?B?ejlJbHN5T2hIeTRJMVZpamxkWmxFSVBvVDh1QWEyOWltNDkremhmdEIvdVM0?=
 =?utf-8?B?R2UxWHQ3dkNHRTM1Qld5VHNyYkZYdUtXcS9HNzJYSTR3WTdVWW5RL21jTlVF?=
 =?utf-8?B?bjBaNDF4SkhITG5EbENKa0VUVWdlWEVHcHhnY1RNTlBDUk9jK1pPdG9qM29i?=
 =?utf-8?B?VTlsS1l1MHlXVVI4UGFhZGFPZnZqL3RUTzFJY2QvakpmeGNiZU51c3MyUXVT?=
 =?utf-8?B?UkJiNUd6SFBZbDYwS3pzRnljT0VZd256aXdjZ25RZndnTDdJWXFmQzhMNTB1?=
 =?utf-8?B?WDZROHFtSFdFcUQ3RG0xWW11TEhyMlpwMnF2TXI5Q2xVS09maFBCUFkxQ1Jn?=
 =?utf-8?B?NnN5UFA1Ri9vQmtBaFZScm5PVXFkYTh5Q3VvSEZNTldCT2VsaHRyZmpod2RD?=
 =?utf-8?B?dGpJbWZ2WDlnbi9wejQ4TmJJaC83bE5ncXVGWmRpSVcyZ1lDVTV1Qm8vaXlF?=
 =?utf-8?B?SURZTWYwT0Q4RnVORnJUMSthWjZzcExOd1ZMZXVIdldCMm55dGdJakh5V0Uw?=
 =?utf-8?B?SWQxM2c4aTl5N0lZdXlPLzBJa2U1OVFkTE1JYm1QTGMxQmpUb00wZ2JhVVNQ?=
 =?utf-8?B?K05nbFd2RlZ6cGZkcksxNE1MMFdBVyt1aDVINWlJOGs1THVRWUNWVDloQmRB?=
 =?utf-8?B?UkNpLy8vUlB0Snc1bk9aS1VOMUdwUmVQV1J0cXluMHZEMi9hekxrdHlEa3Ro?=
 =?utf-8?B?VTY4ckc5Q2JUV1VKRFRzS2JwS01KRXppM3pLYTRXVk9hZTlWZVlESHBGR01a?=
 =?utf-8?B?V254WFhWSlhoMXVpb0QyTVJ3bnBYV2VSdzExdmlWaEROM3E2cU9TUkVaSXk3?=
 =?utf-8?B?dktGZ2xiSDRoNlZVTEdzR2RXZjczam95OE0xc1F5QlBWRkNoSDlVcnRZS3Uw?=
 =?utf-8?B?QjBPbjJQVnUxWXNwNFZTUllHS0lXa043c0RHTlNrVUZEajRJOERnRTNTeHVy?=
 =?utf-8?B?dmVvanNTaHZpUmVWZzRicSt2VHdGNC91ZGIxZ1ZtRFhvQ1ZzdHNyQ1NYNURB?=
 =?utf-8?B?UlVyaWRkU0dmVVE3dkx6SGlTYzBFZ1pyRTRLc2ExbCtBSVVRSGZqMG5uOXFw?=
 =?utf-8?B?WDdiV0hLTHVnVDNDWVdZQ1hIbTU4S1lKdjBPRlpMRC9IZFFCMWpURWVrejBH?=
 =?utf-8?B?Vko4RlgreUxRYmxoQWhUcURzQ3lVaUt0cjQzSTNySXQ0amdBbVZVdEhNTUFP?=
 =?utf-8?B?dHlNVGUwemYyMGs0M1ArYkNOM3djazNqazg4b2drRzZqbjJjZHp2cXNnMzNS?=
 =?utf-8?B?ayt2T1Q5c0F0SlF5V0hRb3cxZnp5cXU1TTNZd1ZCdE1yOUc0Z0VYblBNN0wv?=
 =?utf-8?B?NHNDUW1LaGZaSGNMT3I1a3BKbytvbFJDeGNNd0NLYUFxMFhBNjQ0UWdKb1Fm?=
 =?utf-8?B?Y2RySVB6OC91WkxLenpBcjEyQUkxdWxKVE1JdHUwQ2tTQ2RLeEgwRkZIL0lQ?=
 =?utf-8?B?THAzbWJUSUpUbkU0Tnp0dUl5WG9EaEthK08vcC9US082WFp3amRRR0hZNEd0?=
 =?utf-8?B?eC83UWQ2OWlmUlVSRWNuUEdiYWVCQ2Y2Nld0RG5PRk5hUEtNNnJTS1JHUFdW?=
 =?utf-8?Q?F/63A7T4qLH516TuAHsiD8m6T?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a69bfd1b-d6b7-45b8-1dae-08ddf0beff4c
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 23:08:47.6079 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WH0QCBhp8DAppv5f8djECnaRONOGepupixftPbILkZNVgB9eM7WY7cwMKJ4p5XPBLxgAJoqlhNGa7BFeNmnarw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9031
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



On 9/9/2025 11:04 PM, Yury Norov wrote:
> On Tue, Sep 09, 2025 at 05:20:39PM -0400, Joel Fernandes wrote:
>> Add KUNIT tests to make sure the macro is working correctly.
>>
>> [Added range overlap tests suggested by Yury].
> 
> Please no brackets and personal references in commit messages.
> If you believe it's worth mentioning my suggestion, then:
> 
> Suggested-by: Yury Norov (NVIDIA) <yury.norov@gmail.com> # For overlapped tests
>  
>> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
> 
> Some comments inline.
> 
> Thanks,
> Yury
> 
>> ---
>>  rust/kernel/bits/bitfield.rs | 320 +++++++++++++++++++++++++++++++++++
>>  1 file changed, 320 insertions(+)
>>
>> diff --git a/rust/kernel/bits/bitfield.rs b/rust/kernel/bits/bitfield.rs
>> index 0837fefc270f..f3134f2ffd08 100644
>> --- a/rust/kernel/bits/bitfield.rs
>> +++ b/rust/kernel/bits/bitfield.rs
>> @@ -339,3 +339,323 @@ fn default() -> Self {
>>          }
>>      };
>>  }
>> +
>> +#[::kernel::macros::kunit_tests(kernel_bitfield)]
>> +mod tests {
>> +    use core::convert::TryFrom;
>> +
>> +    // Enum types for testing => and ?=> conversions
>> +    #[derive(Debug, Clone, Copy, PartialEq)]
>> +    enum MemoryType {
>> +        Unmapped = 0,
>> +        Normal = 1,
>> +        Device = 2,
>> +        Reserved = 3,
>> +    }
>> +
>> +    impl Default for MemoryType {
>> +        fn default() -> Self {
>> +            MemoryType::Unmapped
>> +        }
>> +    }
>> +
>> +    impl TryFrom<u8> for MemoryType {
>> +        type Error = u8;
>> +        fn try_from(value: u8) -> Result<Self, Self::Error> {
>> +            match value {
>> +                0 => Ok(MemoryType::Unmapped),
>> +                1 => Ok(MemoryType::Normal),
>> +                2 => Ok(MemoryType::Device),
>> +                3 => Ok(MemoryType::Reserved),
>> +                _ => Err(value),
>> +            }
>> +        }
>> +    }
>> +
>> +    impl From<MemoryType> for u64 {
>> +        fn from(mt: MemoryType) -> u64 {
>> +            mt as u64
>> +        }
>> +    }
>> +
>> +    #[derive(Debug, Clone, Copy, PartialEq)]
>> +    enum Priority {
>> +        Low = 0,
>> +        Medium = 1,
>> +        High = 2,
>> +        Critical = 3,
>> +    }
>> +
>> +    impl Default for Priority {
>> +        fn default() -> Self {
>> +            Priority::Low
>> +        }
>> +    }
>> +
>> +    impl From<u8> for Priority {
>> +        fn from(value: u8) -> Self {
>> +            match value & 0x3 {
>> +                0 => Priority::Low,
>> +                1 => Priority::Medium,
>> +                2 => Priority::High,
>> +                _ => Priority::Critical,
>> +            }
>> +        }
>> +    }
>> +
>> +    impl From<Priority> for u16 {
>> +        fn from(p: Priority) -> u16 {
>> +            p as u16
>> +        }
>> +    }
>> +
>> +    bitfield! {
>> +        struct TestPageTableEntry: u64 {
>> +            0:0       present     as bool;
>> +            1:1       writable    as bool;
>> +            11:9      available   as u8;
>> +            13:12     mem_type    as u8 ?=> MemoryType;
>> +            17:14     extended_type as u8 ?=> MemoryType;  // 4-bit field for testing failures
>> +            51:12     pfn         as u64;
>> +            51:12     pfn_overlap as u64;  // Overlapping field
>> +            61:52     available2  as u16;
>> +        }
>> +    }
>> +
>> +    bitfield! {
>> +        struct TestControlRegister: u16 {
>> +            0:0       enable      as bool;
>> +            3:1       mode        as u8;
>> +            5:4       priority    as u8 => Priority;
>> +            7:4       priority_nibble as u8;  // Overlapping field
>> +            15:8      channel     as u8;
>> +        }
>> +    }
>> +
>> +    bitfield! {
>> +        struct TestStatusRegister: u8 {
>> +            0:0       ready       as bool;
>> +            1:1       error       as bool;
>> +            3:2       state       as u8;
>> +            7:4       reserved    as u8;
>> +            7:0       full_byte   as u8;  // Overlapping field for entire register
>> +        }
>> +    }
>> +
>> +    #[test]
>> +    fn test_single_bits() {
>> +        let mut pte = TestPageTableEntry::default();
>> +
>> +        // Test bool field
>> +        assert!(!pte.present());
>> +        assert!(!pte.writable());
>> +
>> +        pte = pte.set_present(true);
>> +        assert!(pte.present());
>> +
>> +        pte = pte.set_writable(true);
>> +        assert!(pte.writable());
>> +
>> +        pte = pte.set_writable(false);
>> +        assert!(!pte.writable());
>> +
>> +        assert_eq!(pte.available(), 0);
>> +        pte = pte.set_available(0x5);
>> +        assert_eq!(pte.available(), 0x5);
>> +    }
>> +
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
> 
>> +
>> +        // Test a valid value after testing invalid to ensure both cases work
>> +        raw = (raw & !(0xF << 14)) | (0x2 << 14); // Set bits 17:14 to 2 (valid: Device)
> 
> Can you use genmask!() here and everywhere else?
> 
>> +        let valid_pte = TestPageTableEntry::from(raw);
>> +        assert_eq!(valid_pte.extended_type(), Ok(MemoryType::Device)); // Should return Ok with Device
>> +
>> +        let max_pfn = (1u64 << 40) - 1;
>> +        pte = pte.set_pfn(max_pfn);
>> +        assert_eq!(pte.pfn(), max_pfn);
>> +        assert_eq!(pte.pfn_overlap(), max_pfn);
>> +    }
>> +
>> +    #[test]
>> +    fn test_builder_pattern() {
>> +        let pte = TestPageTableEntry::default()
>> +            .set_present(true)
>> +            .set_writable(true)
>> +            .set_available(0x7)
>> +            .set_pfn(0xABCDEF)
>> +            .set_mem_type(MemoryType::Reserved)
>> +            .set_available2(0x3FF);
>> +
>> +        assert!(pte.present());
>> +        assert!(pte.writable());
>> +        assert_eq!(pte.available(), 0x7);
>> +        assert_eq!(pte.pfn(), 0xABCDEF);
>> +        assert_eq!(pte.pfn_overlap(), 0xABCDEF);
>> +        assert_eq!(pte.mem_type(), Ok(MemoryType::Reserved));
>> +        assert_eq!(pte.available2(), 0x3FF);
>> +    }
>> +
>> +    #[test]
>> +    fn test_raw_operations() {
>> +        let raw_value = 0x3FF0000003123E03u64;
>> +
>> +        // Test using ::from() syntax
>> +        let pte = TestPageTableEntry::from(raw_value);
>> +        assert_eq!(pte.raw(), raw_value);
>> +
>> +        assert!(pte.present());
>> +        assert!(pte.writable());
>> +        assert_eq!(pte.available(), 0x7);
>> +        assert_eq!(pte.pfn(), 0x3123);
>> +        assert_eq!(pte.pfn_overlap(), 0x3123);
>> +        assert_eq!(pte.mem_type(), Ok(MemoryType::Reserved));
>> +        assert_eq!(pte.available2(), 0x3FF);
>> +
>> +        // Test using direct constructor syntax TestStruct(value)
>> +        let pte2 = TestPageTableEntry(raw_value);
>> +        assert_eq!(pte2.raw(), raw_value);
>> +    }
>> +
>> +    #[test]
>> +    fn test_u16_bitfield() {
>> +        let mut ctrl = TestControlRegister::default();
>> +
>> +        assert!(!ctrl.enable());
>> +        assert_eq!(ctrl.mode(), 0);
>> +        assert_eq!(ctrl.priority(), Priority::Low);
>> +        assert_eq!(ctrl.priority_nibble(), 0);
>> +        assert_eq!(ctrl.channel(), 0);
>> +
>> +        ctrl = ctrl.set_enable(true);
>> +        assert!(ctrl.enable());
>> +
>> +        ctrl = ctrl.set_mode(0x5);
>> +        assert_eq!(ctrl.mode(), 0x5);
>> +
>> +        // Test From conversion with =>
>> +        ctrl = ctrl.set_priority(Priority::High);
>> +        assert_eq!(ctrl.priority(), Priority::High);
>> +        assert_eq!(ctrl.priority_nibble(), 0x2); // High = 2 in bits 5:4
>> +
>> +        ctrl = ctrl.set_channel(0xAB);
>> +        assert_eq!(ctrl.channel(), 0xAB);
>> +
>> +        // Test overlapping fields
>> +        ctrl = ctrl.set_priority_nibble(0xF);
>> +        assert_eq!(ctrl.priority_nibble(), 0xF);
>> +        assert_eq!(ctrl.priority(), Priority::Critical); // bits 5:4 = 0x3
>> +
>> +        let ctrl2 = TestControlRegister::default()
>> +            .set_enable(true)
>> +            .set_mode(0x3)
>> +            .set_priority(Priority::Medium)
>> +            .set_channel(0x42);
>> +
>> +        assert!(ctrl2.enable());
>> +        assert_eq!(ctrl2.mode(), 0x3);
>> +        assert_eq!(ctrl2.priority(), Priority::Medium);
>> +        assert_eq!(ctrl2.channel(), 0x42);
>> +
>> +        let raw_value: u16 = 0x4217;
>> +        let ctrl3 = TestControlRegister::from(raw_value);
>> +        assert_eq!(ctrl3.raw(), raw_value);
>> +        assert!(ctrl3.enable());
>> +        assert_eq!(ctrl3.priority(), Priority::Medium);
>> +        assert_eq!(ctrl3.priority_nibble(), 0x1);
>> +        assert_eq!(ctrl3.channel(), 0x42);
>> +    }
>> +
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

Sure, but note that we can only add negative tests if there is a chance of
failure, which at runtime can mainly happen with the fallible usage (?=>
pattern). Also just to note, we already at ~300 lines of test code now :)

> 
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

> 
> I tried to apply your series on top of master, but it failed. So
> my apologies for not finding the answers to some questions above
> by myself.

Oh ok, I applied it on top of drm-rust-next. I will rebase on -next for the next
revision, thanks.

> For the next version, can you make sure your series is applicable
> on top of master or -next?
Sure, thanks.
 - Joel
