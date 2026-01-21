Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ECcEKckecWmodQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 19:45:29 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B475B770
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 19:45:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BBF710E0BD;
	Wed, 21 Jan 2026 18:45:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="FaWtVzgt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012032.outbound.protection.outlook.com [40.107.209.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 373C910E0BD;
 Wed, 21 Jan 2026 18:45:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mBT0Ro+Rb9ATuR8Z5aFuQfiZXZOu36qTfHxGTPxsQJmgmUeN/lljb2LDv7B8EYYuonzW/1D9d1EwoeBI1xfW1iGNwHfbDgl1KVaGvttJc5OwAwtyxRb/FYgEN59NJNjPF5LtSWaAZTwi3Bc1EDm7mFxExAI7en/98bBVPcz0lDBdaBqVzmlMpSvwdRXsg5xE1n0TIFg9SKzDL+GBaOCHmIDBRGqUG5OTQ4DcPYmBp5H51gK+ZFOXMUr+FqSPsFDTS4DiaOSDEIgXVQiOc0r9E4O2K/PpJZWFUnKRTTdf8U1RuzmWgZFDbQlG6jKhLTr/ByIl3LWAA708hj8dbtZAmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=axKHjx6cc0DSvmm2uOT58puBMiyX5DM/jFWz/aqEny8=;
 b=PhVtB+uKxHpbPPc2jfgMYH9MFQC8t+mmWJqtnkYqSuUagWMAeDrK734cnu/OYHpjg9w7wer1Yj6Gai6f73awSp+ZgdylW95yiIVOzSz4vmqpIX8AlBCSWh740KAL6V/PCccEjw6ZXUgm52i9Dr7hnTQKcHems9gi0tbho1YMAKH/8xMfihfJEu/mNannh2GgZ4I6VPdk7QzHWozXyxGA2ELRmrgYPi7waFwBQtCmWCNcibMev7Se495VsQkaK6yJ32SvoC3WLxuQzTUnGAG/2V7ydvTK9cITJT2Ikx/nC/iSCzEdL8Fdej+0K4h6KuDmMuKIzTjPrhZXgK1tZil4+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=axKHjx6cc0DSvmm2uOT58puBMiyX5DM/jFWz/aqEny8=;
 b=FaWtVzgtdE1GtsHmHkspeq041QdAvYc0N2gPfCeuHScUVnF5U7Ri9bcfLo6GLtNJE+f5mtVCWXIVJIjbTBS17EWYTv5lY6wTmYGa1zy1vDl8BdYRX3iEG0qK/HueKg9g3/MscxWyBWBmjTz8gJFVrHtnuPbo4KDrPUM79Jk8kLZDy27eSLnsw9/5sD6YwKoLanlZxewrIFcHrc1zRfwjojbvbaDr+I1A3IpwIACCGKJRQ9Knft1g3fq9dWuwJCSWShvmg05aRFgb3ih7TCH1NQtlMWqzXhCYg+eVmkMUl60Ar3SdP/lC4ZKcXL8HXi3X08/piSQu/K0TRgEVH7PseA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 BY5PR12MB4291.namprd12.prod.outlook.com (2603:10b6:a03:20c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 18:45:21 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9542.008; Wed, 21 Jan 2026
 18:45:21 +0000
Message-ID: <57cc5bbc-8f72-4214-acbf-a7c791106dff@nvidia.com>
Date: Wed, 21 Jan 2026 13:45:15 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v6 14/26] nova-core: mm: Add TLB flush support
To: Zhi Wang <zhiw@nvidia.com>
Cc: linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
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
 Helge Deller <deller@gmx.de>, Danilo Krummrich <dakr@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 Alistair Popple <apopple@nvidia.com>, Alexandre Courbot
 <acourbot@nvidia.com>, Andrea Righi <arighi@nvidia.com>,
 Alexey Ivanov <alexeyi@nvidia.com>, Philipp Stanner <phasta@kernel.org>,
 Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>, joel@joelfernandes.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-fbdev@vger.kernel.org
References: <20260120204303.3229303-1-joelagnelf@nvidia.com>
 <20260120204303.3229303-15-joelagnelf@nvidia.com>
 <20260121115917.73cfcc7f.zhiw@nvidia.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <20260121115917.73cfcc7f.zhiw@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL1PR13CA0428.namprd13.prod.outlook.com
 (2603:10b6:208:2c3::13) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|BY5PR12MB4291:EE_
X-MS-Office365-Filtering-Correlation-Id: a94adaad-a542-4636-5595-08de591d3acc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cWQzRzVQV0FoRE50a3BJZEtiY1BxZS94eDZWcVdBemFRWThTTXQ3U04wNTY4?=
 =?utf-8?B?NkQwWGtpVU1sWVdmWVJxb0ErSjd6YUdnNXVBNVlETEk3TmJkeW5hcm9qYnZt?=
 =?utf-8?B?bklKS2FzNk43QWlPYXVTRkRZT0l0RFAyNHlrMm05ek9LNmJpaFJTQ2l0cm9N?=
 =?utf-8?B?VzJEUGtUYmZBM1RrcmNrT01JVmtyZG5ldmlvbThvc3pyWFNGVFUyM05iRTBo?=
 =?utf-8?B?MDBReU5qZ1Z2Vm9wMmNSelVKMGZveUxGUEM5VnpzbEs2RWhwVUVFUkZ3cHZG?=
 =?utf-8?B?akR1cWdPSy9CYWdLMDhva1RtbDZCUS9Vb2xVdnZya2RuZG5zMjUwTmhwd1F5?=
 =?utf-8?B?dDIraE13SjJVeUdQOFNWZWd0WlZ2ZlErY1o0SUo2UDRvWGVYVkNNWWFaYWRP?=
 =?utf-8?B?Sm1PeThXNExYRm5qaTVLODRBZlk3bnVWRUs1SDRIQnJXWWpyYUtydEVoMUp5?=
 =?utf-8?B?N1VUTTNwamlwclFKTjlROWc0MW9BYlBYbVpIMEZnRmkyVWFPamlkdDREZkxi?=
 =?utf-8?B?bTRtd090ZWN0NTUyenU2SjU5N0NkODJKMU13czA4TUtqTVJ2cE5iOWNJSjhK?=
 =?utf-8?B?VmxsWXFBcm1Ldjk5d3pTK25PY2xiL05jblpUVEg5THZTZ2hDYjZjSUY1TENX?=
 =?utf-8?B?QUw2Zy8wbk5tN3lPQS81by9tVjRCaVRWK0hjcWpQbm53N3ZlRDdIcXRNWXM5?=
 =?utf-8?B?alRuYVRGSUcwY2lVOTM2dmpQYUxwdk9jQTFCVDZCa01rODVkRHkrcFE5VzR6?=
 =?utf-8?B?Rnl0MU5zUXM5RVFoVEVsSTBYMDdpbG9TQi9tdjZjMGRObEJjK1RNK1paelBN?=
 =?utf-8?B?NHdUdjI1SkdZU1I2bmd4ZENUNjQ5enFjbE1Nck1adXhFNS9XZlc4TnpvS2Zx?=
 =?utf-8?B?QUFaZXdhMHB0TVN1aXZBdXdKM2YzK0sySFJ1ZFRFaWhLUnQ4OFpqdTRWOEd3?=
 =?utf-8?B?Uit2bFNXSEhzVGk3SFlhcUdSVldyU3MzeHR4bEwyckpkaHo0WHVBV1k1bEVn?=
 =?utf-8?B?bVd3Nk41T0ZXZlVDTlhWQ2xvaFk5RjF5T0d3WXlobkVPUlpsSVQwNVBsbDgy?=
 =?utf-8?B?NTE5alRsdE94TzhoUHU4QTFLTU00cStnU25VZVhjTUFWUHZ3U1pXVzNCYkRQ?=
 =?utf-8?B?ZGxFbmR6OVJ1ZHBXcUtJczdveGRVeWR6Z2V0azlpbVRKaVlxdEZGK2tmMlRU?=
 =?utf-8?B?WnhIU3BaVjBhQTZIZWVQZUNZZ2ZYR3pidVpXZ0FpaUFXeSs5LzFYNjJEWHN4?=
 =?utf-8?B?bUFHOGZadUlENUVtanFEOHB0ay9zTUlsMVpNbzNhYXo2cWVJRUY2SEdIQTFH?=
 =?utf-8?B?Q09CME50c0NsOUF3WDNzQTh6RGJnVmNHZjQxaHlKckN0cGVsREhUcWZJUXRn?=
 =?utf-8?B?TEZLRUJmWkRXU0VnY3l6NjRkM1U4Uy9DckV6YWtjZVpXVWN6WnU3NFdtTE16?=
 =?utf-8?B?cFdFbU9Ya2cvVjliUzkwbXk0cmE5Qk5NdktGNmhQYXJvYVVZdy84c2FUckll?=
 =?utf-8?B?QlJZenRTV3BRcjFBVGpYeVQ4UGo1c0pZcTU2Qzk3bW9mT3RHSEFXcytHSSs5?=
 =?utf-8?B?NUp0Y0UzNW84aFRNTEZMV0RuajZWbXhLODVkeGlhZWRkZTZCZkRuRmswVFlO?=
 =?utf-8?B?UXd2T1hXU2F4QjFBZlRad0NEb2FGWVVwZ1MvbGNpZFpEVG5ZMG90dzFXOHlV?=
 =?utf-8?B?aEtJQlk2WWNTQTl3QzMrdVJoRGRFK0Z4bHJsOWtPSUpTR3ZkMXl6UjlzUzVp?=
 =?utf-8?B?NG5wSGEyWFdEeW5mQjFtMWpleWxkV09xNUc4OENRMWwyL3grcHBtMGZLOEpX?=
 =?utf-8?B?azJMZ0p6OTViYjNiRWR4RG9XaFFuMXNCeWZlNlZ6U0NFODZCc2o4ZXVkdDc2?=
 =?utf-8?B?ZW9PWkJLdWcrVnpURVVZVlRtR2JFUzVlNk52aWhBMnRHVFRmTDdwZSt4VGQ0?=
 =?utf-8?B?MFdOd1NxeVEybGhjaUxyeG1BNisraGZkdzVRZjBaUXQrajFxeTB6VmxsMGRS?=
 =?utf-8?B?NG1yWlkwOWJ2RGFlSlN5MVRjZFUwVjZYUWh3YzBCZ3JHa2Y3M0FFc3pQOW5o?=
 =?utf-8?B?VHY2K0VsOWRLaXpvd3ZIeisyam9sb21iNm1UdFpUMFhpUTE1dXNySmp1R0ZW?=
 =?utf-8?Q?VWz0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QTVVQ050SisxUEJ6cjlnVXpWV05RR0J1ZkN6d3BxT3krVXVkemltTzNUcm9p?=
 =?utf-8?B?WWk2WmQ0UnZkKzVkaklJS1pYZDFzTkY5SlBCQnZsY1RFK09KVEdyNDl5Mngz?=
 =?utf-8?B?Q0NLZVJMeFJPYkZpaW9JS2RIbGc0R244RnpzU3htQ0Q5VzNOSzh5dmlXbjdp?=
 =?utf-8?B?a1NBcGd3VWNxSm5HY3ZIcWUrekF1RWw1S29SUjhvV24yN2xrbFBVYWtyeDlo?=
 =?utf-8?B?VHRxNFdETVdkdnpHaE5uSytUNnJuM05iWDd6a211VkVpbEZCRUVQOEtmdGxT?=
 =?utf-8?B?MUs1d3Q2dnNjS0hHS2tDZGRZS0U4M2lleC9Vc2VUNmRhOVdCcmZzd3pNclh1?=
 =?utf-8?B?U3lCVVhFQ1ViUTNTNm5GTFowYWZCVDZFbW9QdUhyb1QzZzJSdGpYRXVtWjAv?=
 =?utf-8?B?ZC9ZSkVsVXhtT3VLYVI2VjJQZlM5Vi9EREhvbCsxOWNwTjk0bFpUWEVRSVY2?=
 =?utf-8?B?bTdWMUcvcndVTWEwdmVMaWdoa1lHbW1odmNKSTNwcUErYnFqRlh2SmFScHEy?=
 =?utf-8?B?TFRuNDNSRm5BR0ZMYkRjRUg4cHc3QmdUb3ByVHVtTGhLU3BwR2ZuVkQzNmdZ?=
 =?utf-8?B?elA3SVRsdW8yRkcvRkU4UU5ndVliV2ozMFd3L1hkcHNDTzlUbFJqMXRlbmhY?=
 =?utf-8?B?SjRaNmV2U1g4SjMyWVlPTzBET0EvMFFPc2ZqQkd3T3lqWEpuekl3ajR1WkJs?=
 =?utf-8?B?VFhVN1dvTEtSbFVNbG93dzVRTWxWTm1hcnp0TTh2S1NWdW1xSUVBWDBvamZi?=
 =?utf-8?B?ZEdBUVBzbjBXU3Axekxwamp6L0ptalk0MGp3RDkrM0xmZ1FVbENHSmJVQ05H?=
 =?utf-8?B?bUpoZzM1NnNIVTZqLzE0cnlqaWFienVpbHRsOTBKUHZKUmpReTBYV04zc3NI?=
 =?utf-8?B?WHFqWWdpZVdhNmhuNUJKTExJUHF0MnVNWkxJcWQ4SzVROTZhUXNVbUJQZ1gv?=
 =?utf-8?B?YmNHanFLTjlRT0lDd29JMW03NEpIbDh0eGx2TUlVWWQxajNKU3dHbG9IOSs2?=
 =?utf-8?B?WmZlblJBMkZOak9QK0NHREZxK0lUSWRieWFsQndtRHRaZWxaV0hvSTA0V1Z6?=
 =?utf-8?B?eHF5QVREL0Zpb1R6T09oU084NmVxZGsvOFFaVmsrUjd3Y0Z0eHZCZUZiSnZn?=
 =?utf-8?B?U3hlTHJYYmVGMHRKZWp0UCsyZ1M5NjB1VzR3Q3JFMFBRbUNQMFh6SklPSzVD?=
 =?utf-8?B?UkpMWjdaZVNPZFNKdlpzUEZYWUdlR0daZUVFbFlPQ1FDSUZaYVFTNG4wMVZo?=
 =?utf-8?B?YTdNV0E4czI4YVJIUVNkbUlpN0RPUVVsSWljSUFTT2RWZDRiWTV1WjVLdDEv?=
 =?utf-8?B?aGtXMHl5YWZ2bVpiS2tvbXRVbCtvVTVjeFN2YWo2dnpZbWVmK1RZanRvZk9a?=
 =?utf-8?B?bW5xU3NuZGVRLys2NDI5cHhENEVRV0JPUWRoZkRrUGk3c0llWDREc0xkbi9S?=
 =?utf-8?B?U1ZTMWFLUTVad0gxS1lwbC9ZK21GZEdybkFXT09BakZPdjNaUUNvQWxkUEhl?=
 =?utf-8?B?RTZJeldEVGdGeEx5RWgxZGFabzlKR09ZTEJpYUxQMng5a3dVcnZYZnhLQkJN?=
 =?utf-8?B?ckhNRWZ0TnRMMmxSbGRhRG9QUGF5V3lRYVdPNEF4QUx1ZWR2bXJ5ZkR6UUlC?=
 =?utf-8?B?V0ZQQUJQNWVPSDVjcWVVdHJVOEM2eDE1OU1rL0FMbHQ1WkREQUMrNk1DTHRY?=
 =?utf-8?B?SEZRaXcyVTc1QTF1MTBMTEZORkp2VjVKMEs5cm8zck9YMDVLYldQY1V2ZVQ3?=
 =?utf-8?B?YXIrUkFpK20xR09vM2Z0NU8vK2RsSUpsbUpyWXprbS9pbVc3NWNnb0V4ZzZy?=
 =?utf-8?B?TjJoSjVIcnRIR1dXemtFY2FQVWVsMjBlNXMxR2hzSlZhVFMwRWtYVlBRYmNi?=
 =?utf-8?B?em4xb0VnQmZPWEkyT0dpeGVML2JTaFRVallDL2tWSW1HdG1CelZ3RmpmaURJ?=
 =?utf-8?B?Zi8zSzFpMHdGTWNtdzhHcWkvKzZtM0VNbVNveEJpWExnLzNPZDMzY3lFaXVr?=
 =?utf-8?B?Umhhd3YyUCtmcGFsMHRvb3JMVENLQW9VMTQwTmIwRGN2cVBlcG9jMkhBSnNV?=
 =?utf-8?B?REM1MzFRQlk4TzhDaWVSdkVZTENYWTJjNWJjelNGSmF6K2Y3cWxVbDRwaGhs?=
 =?utf-8?B?elBrQkxvMFNEdE8rRVVvUGV3WlBiZDVSWEFwVytzTFN6R3hiUUpiek1kaUkx?=
 =?utf-8?B?RWlocktKUFQ1a0F4V3VJMXVCc2oraHF1Rnk1bXdGemNHNXNRZkRIYlJ6UzhV?=
 =?utf-8?B?YkdnVUNhdWxSYjFiREpmbldLQnhsYVhobjc0ekJNbWFPMXdTSm5JbFFjM0xO?=
 =?utf-8?B?QnNxUThOSiswb3BqQW1MTi95cWNGekozYnl2ZWxGbDlZZmpvbVB3Zz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a94adaad-a542-4636-5595-08de591d3acc
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 18:45:21.0877 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0q41UWN6HB7H0oxkXYGGJ81eTQQS6CkRrJUJLBKxr0fifPnJpZzKIvc857lmlY39to2FaQLurPGpNoPHvKWprw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4291
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,linux.intel.com,kernel.org,ffwll.ch,lwn.net,amd.com,intel.com,ursulin.net,gmx.de,google.com,gmail.com,garyguo.net,protonmail.com,umich.edu,nvidia.com,weathered-steel.dev,collabora.com,joelfernandes.org,lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[44];
	RCVD_COUNT_THREE(0.00)[4];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[joelagnelf@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+]
X-Rspamd-Queue-Id: 10B475B770
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello, Zhi,

On 1/21/2026 4:59 AM, Zhi Wang wrote:
> On Tue, 20 Jan 2026 15:42:51 -0500
> Joel Fernandes <joelagnelf@nvidia.com> wrote:
> 
>> Add TLB (Translation Lookaside Buffer) flush support for GPU MMU.
>>
> The same concern as in PATCH 5, guess we need to think of concurrency for
> TLB flush.


Will change:
    pub(crate) fn flush(&self, pdb_addr: VramAddress)

to:
   pub(crate) fn flush(&mut self, pdb_addr: VramAddress)


and also changing in mm/mod.rs:
    pub(crate) fn tlb(&self) -> &Tlb {
to:
    pub(crate) fn tlb(&mut self) -> &mut Tlb.

Since TLB operations modify registers, that does make sense to me.

For the buddy allocator, however, I am locking internally so I left it as is:
    /// Access the [`GpuBuddy`] allocator.
    pub(crate) fn buddy(&self) -> &GpuBuddy {
        &self.buddy
    }

-- 
Joel Fernandes

