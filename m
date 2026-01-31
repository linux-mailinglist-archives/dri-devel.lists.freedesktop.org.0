Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sM1mEUR1fWn+SAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 31 Jan 2026 04:21:40 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD870C07DC
	for <lists+dri-devel@lfdr.de>; Sat, 31 Jan 2026 04:21:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E36610E21B;
	Sat, 31 Jan 2026 03:21:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="hSDNXmCI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011005.outbound.protection.outlook.com [52.101.52.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAC3D10E1D9;
 Sat, 31 Jan 2026 03:21:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e2umqRcvDPQKdBpR4aG3zeMZzR6wKo5h6U+GM0Pjp8Tn9GeJ23cwgfLZcCAKZErPLrDRIf6vhKIjyihZeNWSqStIkQ3eAYxqzXXxwJW29N0c7aQ0XkANp4uSqeO6SKQlkfU4Qxmbo5BBADwAZlWkQCmqtT3jvX34qIOXUALae/xo5RjnlUYyMt7HuGo4cPRb7xzZKxmO9NFRPAMqUUUCDzITLdOasgKi+y9mYdzsf9SiPddQUpiQ0xHuHMHzYLXgrUKTWaZLSuktqZyzsxvw5VLkJ9qFhwiymQAXiiyFBQ0zORA+/NkXQ6LP4lENk5TxRK68BcNPRmS/zFE2Pb9GKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jsKV4Isbdf8T16M6lVROfDtY6/gf+LFsPemTiLuqD3Y=;
 b=eh+Uv61C/BxPK6Cqo2m0oGQARH71ec2iVk/v6RBt9Oft8UJ8xURtfTHATOdLybvwhlJ5soW2FkYkkvYooL6VZjCnKPQyjw+5lNWGcvKspRhC1gEjHsbr3OlcF3Kb3HSqP+UCAT/HI5HeOGt7mRUkqzqsxsmHlWk1P1qzZRa9H+a6gum1SyBR6QUcShnkDHVaRP8ggMiIkHOTrA5c23czbEqUi/kNTxDcLJbEs2g/mfLB+7s9t+uU8pTfZByP4lngs0MwY7E92KbjLmozJrm8NuOePlBd5cvcsllMAeAeiOCcr42P+mQ80pIwUr8KFz8Zxsds2HotOvC6DTGhaSGJNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jsKV4Isbdf8T16M6lVROfDtY6/gf+LFsPemTiLuqD3Y=;
 b=hSDNXmCIb3cw23C/MXvBfEyyuMGys7D/RcGcSHCYBcQstMkzqwBKUZuN92stdPhd/jPZFIENuU5RXWS1OnvdScZf6TnJXkp/F0mureexuCNlPSSF8RVIk1mewphuq+FKGnXRgrhNG4FRcuLNfa47XM9d7QGedecdcx9ebwJkbqhNByPLUj5nLNQYDKvGAmKfoGYEL/ZhudHLOdV2aQRQV254vEmmMRNiRtforBvM6ZjnD12TOXL4ydUZtos0JHHdYlAhRg141HtSpmAkrfFkAkQTSa/sESGIEWC1O4ET5Xqswz0FaNdBa64xDSRFeusdQsMBVNTMddpsK9uIpB7NBQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SA5PPF7F0CA3746.namprd12.prod.outlook.com (2603:10b6:80f:fc04::8d1)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.9; Sat, 31 Jan
 2026 03:21:28 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9564.013; Sat, 31 Jan 2026
 03:21:28 +0000
Message-ID: <cea5ddbf-8a6f-409e-bd15-b838a1dd0f65@nvidia.com>
Date: Fri, 30 Jan 2026 19:21:20 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v6 05/26] nova-core: mm: Add support to use PRAMIN
 windows to write to VRAM
To: Dave Airlie <airlied@gmail.com>, Joel Fernandes <joelagnelf@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Zhi Wang <zhiw@nvidia.com>,
 linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Simona Vetter <simona@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, Rui Huang <ray.huang@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
 Helge Deller <deller@gmx.de>, Alice Ryhl <aliceryhl@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 Bjorn Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin
 <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, Alistair Popple <apopple@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, Edwin Peer <epeer@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>, Andrea Righi <arighi@nvidia.com>,
 Andy Ritger <aritger@nvidia.com>, Alexey Ivanov <alexeyi@nvidia.com>,
 Balbir Singh <balbirs@nvidia.com>, Philipp Stanner <phasta@kernel.org>,
 Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-fbdev@vger.kernel.org
References: <97af2d85-a905-44d4-951f-e56a40f4312e@nvidia.com>
 <20260130015901.GA301119@joelbox2>
 <c064fbdc-9202-437d-80ff-6134d2a33778@nvidia.com>
 <70d88203-2fe1-4bde-b254-51e8107744eb@nvidia.com>
 <CAPM=9twm1x9rH==uoGQLYa8b4feQMz=Ne14WPuhCPy9_H1u5Tw@mail.gmail.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <CAPM=9twm1x9rH==uoGQLYa8b4feQMz=Ne14WPuhCPy9_H1u5Tw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR05CA0049.namprd05.prod.outlook.com
 (2603:10b6:a03:74::26) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SA5PPF7F0CA3746:EE_
X-MS-Office365-Filtering-Correlation-Id: 80712eed-8bed-43d9-f526-08de6077d28f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eHFjNEI0bkVUMHFJVnFiSmVzc1hrdXdWaElSRVdSZTVQMExzZ0pKWGI2VVVB?=
 =?utf-8?B?NzFza3E5ZjljSXp5SnZVYUFDU0lwMEZTWDNRUjJKUmI1WUJ6NEZvWHd4TU80?=
 =?utf-8?B?VllxTmlaeHdQZCtwUSs0TWdkdW5zTFJBc0lIb0dJcnd6Sk13OGlic0ZQV0Jv?=
 =?utf-8?B?MERybEswUXl2ZTdlTlREMDh4QVFrYis4R0YvSU9EY0FLZG9VUDUvZ2pwbU96?=
 =?utf-8?B?dlloQXVlVDk3eWM0S1NHT0NKeDdYTVJCU2k2NjUzOE4zM1pxVUFwemVkRWhJ?=
 =?utf-8?B?MmNBenJvc1VuSnJHM3JVTFdybDNaRlV6OUo4NmhueUpTNmcyV29ud0hkUXEr?=
 =?utf-8?B?LzRWQzlLYU1iVzM1Wi8rZ1gwU3hnYTN2VS9JZENyM0YyNFZ1YjIzdFl4RGI1?=
 =?utf-8?B?Z3YveFdQYjhCcThWVVJ2SlZyY3pwK3Q4NHd6ZG9Xc2xjRHNmSHpHRlNZVVhH?=
 =?utf-8?B?RGVCa24yYkJON1BTbGUwOE9vMU51MUJnaUJWTWhwSUxITld6SmFaTlROblRX?=
 =?utf-8?B?anR3QnpmbzV4RXRKd1VXK2xkOFUwbEUzN2wvZ0xIOGN2Skxpamh1QkpjbFhu?=
 =?utf-8?B?TE56d0JVRVlMMFU3RzN0eU56RVpLQmxFYnlNWXNUdEFWc2NQa0ZTYjdmWFJG?=
 =?utf-8?B?QnZLWEVVK05heEkycXpHNG9GL2U3bXBnWGFNeTZOZnFkOE9TbFR2K1hlcHV1?=
 =?utf-8?B?dG9URFpXRWdVWXY1Qkg3OWZhUmpvWXBLRU1STG03Uzdab01MdE1rQzlrNUd1?=
 =?utf-8?B?bGdzMkJWWVFHYXFacVpmbE5QdDR0K04wc0hoRENMMUNZekN3LzdEWUgvbEdz?=
 =?utf-8?B?dnRHWkhFOWRJTlI0WXJDTVdrV2VqNThOOUJ6eVlSQThMSUliejlGbzZqbGZp?=
 =?utf-8?B?M1RGYnQxQVlMSjJURXhMbVlhL0dVdnIyenNEL0RhbEpRTlJmRnFtUnBZVmRi?=
 =?utf-8?B?NXJDei9SMUJobFcxSUIwYkhwK2hwbHFDb3JhUmdFejZzc0RTS1RNb01DSy8x?=
 =?utf-8?B?dU1ZbFVqQzN6b0o3eTIzSENpVWRBWmlTVFEwSHFpUk1KV0JRaDV4aC9vclhS?=
 =?utf-8?B?NUVSMW54bjJTSXM5bDdCM2RNWThGZml0b0gxUXRIU0t3eGwvaytsUFpKaEx2?=
 =?utf-8?B?Z2ozdW8xYXQ1TFM4RDVHY05COXcrcFFwZ29iaHVuS3lSZ2htaFNwc3Nrd3hI?=
 =?utf-8?B?b3VBOGlNRThDdSsya2wyNjI2MjZPcUtRU2RKZ1k4OGgrWjBONHdqaWltdEdu?=
 =?utf-8?B?cDRONURUT3VOYzlXclptWllZc1ZCT2JSSGg5MC9nWEQzT0Joc0VzNFRMNXI1?=
 =?utf-8?B?TVRWMjYrOFdDa2o1K2NjTnFZOVp3TWpQRlMwV0tFNlIvQjdlb2dKcUxwRENh?=
 =?utf-8?B?dXVsQWRHMFFhVHcrcWZxenNJUXNERmtNNFNybDlkektMLzlORjJySzVRNmE5?=
 =?utf-8?B?cTZ3R3dKdTJkZ1h3cU1TZHFDRUJmOUhRUVBoNEhsZ3h6S0NLZ0lubGU0dHI3?=
 =?utf-8?B?Rlk0a2svbDFkdkxBTFk5a2FtcS9Db2JJRGlIb0FZcEZWK1A0ejhsTy9DWFZM?=
 =?utf-8?B?YS9MUnNub28rb0FmWTNTOGloRVYvVFJDTGJJWjZCbWQ5NVJFMW9neUEzdnFY?=
 =?utf-8?B?VWxRRWtQUmxaYWNBQ3RKUGIxL3pSUTBKSkVydmdUNmxRYlcyMjhhczBFcVU4?=
 =?utf-8?B?MHRSTFNPaXZmZzQrVFY4U0F6ejNHeFpmS0hmZTQySXg3TkZHT3B2VSt1TjAw?=
 =?utf-8?B?czdOWHVJY2MxemhmRUYzeHlKN0ljMGc5RVJrWnNtd1ozN2tmT2NpOHJxM0dL?=
 =?utf-8?B?UkV3a1JwZEpwNzZ0RHhOU25QNVkvR3ZONzIrVm51OTlXdVA4OGg4d0NiZDli?=
 =?utf-8?B?WTZ2Zm5mRDR5d212eC8vRXIxYTZGVmVSS0tsY01pS3YrSmZkdjVKMjNVWktW?=
 =?utf-8?B?alBIU0I4V3hyK090MVVqQ1U2L3o3L1ZFZEFOMkZtV3lqY29zeXBWdWh1ZU1h?=
 =?utf-8?B?WkVGelR3N09rQzFLRVJjb3B6eFdtbkRKRDBMTU56dVJjclRDUkFIeWRnYXp3?=
 =?utf-8?B?b2V5WmlDUkorY0N4N3V3ME4wcklDNGcxN3kzUmdJSW5LMmk5QVFYRjZHRjJ4?=
 =?utf-8?Q?+kcc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PR12MB9416.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WEJ0SW5ZUGczSm1hUUpkdVcxcUIwd2ZKV0ZtVG16bXkvVEJBNmRicjNwYkdK?=
 =?utf-8?B?bTc5Um16dlVaUHJPZzd5dSs4MlcxT0NKNWdlNFNNYXNjQUxpbXU1RUxXb1dO?=
 =?utf-8?B?YW9HUFBWRTZ6L29penVrbyszMG9IdTJ4WUxWZy9NaFNqUi9KRlhWc1l4Sm1Y?=
 =?utf-8?B?cmpaSk1KeHlCdTBpVkloQnk4RVJTRy82MjVPSHM1RlhJcnVpOVRoLysrSUtx?=
 =?utf-8?B?SHlNR1RHczBjdHhvTXhnaDdCNzA5alRUYUdQOEwrZ1ZURzMvUitjWS9OV2wz?=
 =?utf-8?B?Q3ladVhkZExrdm5MVVNMYzJZR0d5YndLT2dFWnR0YU5PRUN1UnNNYnl3Lzdz?=
 =?utf-8?B?dVhCMEd2dXJpNk0xZjRqZUtnOCtOSHhwV1FGSXl2SlNiSGhxVmlaRmxocXhx?=
 =?utf-8?B?UmpaWWdmZFg0NzArOS9jZkJoUzB5WGNUdFYrN1R3RE92RmxvVVlkKzJmRDhZ?=
 =?utf-8?B?NGlUQWgwWm10SEdoQ3hGWWVBY2doQ1JyY25TT3dBMGlHU245LysrYVB1di8y?=
 =?utf-8?B?bU9PZlI3d3A4STNNYUNXWWNBS1FmWkJNZVFlcnBKRHZCZzhLZ09iZ3lxMTNH?=
 =?utf-8?B?ek1reEtJSkZxbEJudFMwSUlXbGloSVhPRG1sWjRXSEYzbkhJdE9JWEVvTFRk?=
 =?utf-8?B?Rmk3RVE2OFlrVFlnc25nckNTbGxpRnZwQjBLV3NsaU1iTTJWMTF3MFJwK0Zx?=
 =?utf-8?B?RlVwcVhTbjdYMENteXlRck1RZktsV0JLQkJWaFlPelNjZEVuVFRqZ0M0YTkx?=
 =?utf-8?B?RVJoS2pCaEpGUm5sTmhFcnVuMjVOcC9QZkMzelM0QTlZR09KL3Y2WEYyTjRp?=
 =?utf-8?B?RUg0UWZpZy9LUm5VOUlvd0piVzd4SThlb2plaDJMZEhkU2s3aWlPRFh3a3U4?=
 =?utf-8?B?cTFIWkh4QXp2NEZYMEpiekpyRC8wQXgwZDZnNlUwYmVKY0RXdE1LM3pYeVI3?=
 =?utf-8?B?RmJ1VGMwS2x5MzN0TTB6bC9Yd25yeUlYbkh0dW9XcXFqNHFIQU92UHV1Y1dE?=
 =?utf-8?B?SFI1b1FmOFZscEQvN1ZGSlJ4U2I1MnRKcDFIaW9uRWZhbmxhS1N5UkJwY0Er?=
 =?utf-8?B?MHZXYXJpYWpVZEIrdVVWMzlRUmpuN28wTkhkOS9TT1h5b3pRa2h4VEVzQUh6?=
 =?utf-8?B?ZWwzeTMwYkoxcDhpZXhkWVhLTVlKVjFvQU13QllweHQwVE1UOEJyL2R4Y3NN?=
 =?utf-8?B?dFBQbjRYSkJlUGx0M0NoRituelUwaDZ5SEk1MEhqWkh2eTdxeWxDMEpmY2Rz?=
 =?utf-8?B?SDBXNXdYaEIxVFpla3JJcTY4RktXYkVlYVlhTXRHSlpjNXJ3blVBZ1Z5VFZX?=
 =?utf-8?B?RWkxdk1CbDZBcllVZHg1TzFON2tjMld2cTRaTWFMQWM1Rjk0Wlp0TjJURktu?=
 =?utf-8?B?K1I0Ly9vb2pONCt3MG9rMWR6TlorUWRJaG9pZWVrMThFc0s4TmRXT1Z0VW00?=
 =?utf-8?B?azNWbmxkVkxyNVd2Yk82VWxaazNhbzR2TjdSOVRwVHBtTCtmcEVjamo0bmp6?=
 =?utf-8?B?MjE1MFRrTE1lQ2JQOU1kSHNXRmdGOThWaTlhcU15UFhYY1lyem1PdlZuaFp0?=
 =?utf-8?B?QVYzQ0cyc1pZN0VjeExrM3pyUmZzd0pBdjlrMnBsaHJXLzB1SDlCN1loZnNr?=
 =?utf-8?B?UlJFczRQRjlGM0F4MXZhdkJLNWltNXFtRHBWWjVNMmllRitVd054OHBzKyt3?=
 =?utf-8?B?L1V3aFpVRGxMcjZ5TVl3NzFWV29vS0FCMXdtK0hpWFFsZ082YlBiR3R2cGcr?=
 =?utf-8?B?bWFwVWVYZTlVc0ZET1hTdDB2MUJPVTdGVGt4bWJKaDNtS2lGb3VLM0pacGZn?=
 =?utf-8?B?bWJqR3QveERRY0UzQ25TNUFWa0ZYajBwRS83M2JLaUZ6RmhRM0JheEpRZVVi?=
 =?utf-8?B?R3RzNGVNdWVXTzg0eWthQUUwL0RzQW0rY1I1am15TUZyM3IyODVxN2RmQWxs?=
 =?utf-8?B?aXZXd1FPVVJUOHZDdUxyYVBvOStWSzhJZWJITjR0VkRnYnNobExnSmpzRE16?=
 =?utf-8?B?UUJZUEh6NzFZb3F4MGFlbFlVSzlOUUQ1MmxHN3VDRXBmVFhXTjlkZ2Y2NmNE?=
 =?utf-8?B?UXFLNTlNblI1RWw2WHAwSDhUVGRhQUxOUER4NEFObGk3WEluRzlZMmRkRWJW?=
 =?utf-8?B?dUt3V21EaWZKclM5Y3FOZWRhcWVNK3c4cnVDWlQ4UDJZcWpyZ0w1WDQxcXli?=
 =?utf-8?B?U1FvaUZQZVRMWVRGbHc3elBodnlRU2xFY0d2TjlqSmtib2U1aXFhNzFkeDBK?=
 =?utf-8?B?ajdLeXYralZkV3BzbUlILzlXdUxsTUd6M2xjVnBEMlVLVkNLTDBmY3A0Q3c4?=
 =?utf-8?B?ZjNiVjFvM3N3R0h1U0dWSmQ1VlV4TU1rWjRmOHp5MVlYYmwrNzBjZz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80712eed-8bed-43d9-f526-08de6077d28f
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2026 03:21:28.5119 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RnqVUFzVkPbZLqBzdyU75dbwZZkLS6HZEvQjhA9TomW5jhPB3Ltu1N3C4oootQuU+ShJBqb0C9ArxiTX7ksUrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPF7F0CA3746
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
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,nvidia.com];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,nvidia.com,vger.kernel.org,linux.intel.com,suse.de,ffwll.ch,lwn.net,amd.com,intel.com,ursulin.net,gmx.de,google.com,gmail.com,garyguo.net,protonmail.com,umich.edu,weathered-steel.dev,collabora.com,lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_GT_50(0.00)[50];
	FROM_NEQ_ENVFROM(0.00)[jhubbard@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,Nvidia.com:dkim,nvidia.com:mid,nvidia.com:email]
X-Rspamd-Queue-Id: DD870C07DC
X-Rspamd-Action: no action

On 1/30/26 7:00 PM, Dave Airlie wrote:
> On Sat, 31 Jan 2026 at 07:14, Joel Fernandes <joelagnelf@nvidia.com> wrote:
>> On 1/29/2026 10:38 PM, John Hubbard wrote:
>>> On 1/29/26 5:59 PM, Joel Fernandes wrote:
>>>> On 1/29/26 8:12 PM, John Hubbard wrote:
>>>>> On 1/29/26 4:26 PM, Joel Fernandes wrote:
>>>>>> [...]
>> Will work on these issues for the v7. Thanks,
> 
> The way this works on nouveau at least (and I haven't yet read the
> nova code in depth).
> 
> Is we have 4 stages of vmm page table mgmt.
> 
> ref - locked with a ref lock - can allocate/free memory - just makes
> sure the page tables exist and are reference counted
> map - locked with a map lock - cannot allocate memory - fill in the
> PTEs in the page table
> unmap - locked with a map lock - cannot allocate memory - removes
> entries in PTEs
> unref - locked with a ref lock - can allocate/free memory - just drops
> references and frees (not sure if it ever merges).
> 
> So maps and unmaps can be in fence signalling paths, but unrefs are
> done in free job from a workqueue.
> 

Nice! Thanks Dave, I guess this is one time we really should have
taken a peek at nouveau for inspiration after all. :)

thanks,
-- 
John Hubbard

