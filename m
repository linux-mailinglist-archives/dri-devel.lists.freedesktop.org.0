Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E328FBBF1C0
	for <lists+dri-devel@lfdr.de>; Mon, 06 Oct 2025 21:38:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09C6E10E452;
	Mon,  6 Oct 2025 19:38:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Npdx9HxF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012054.outbound.protection.outlook.com [40.107.209.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEB0010E15B;
 Mon,  6 Oct 2025 19:38:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AGSkupLiXrEpWF9n2EBAmp8Q3UW4CsGYJSUVfjHzNwPP1ukZtPev1te6z5lGq9LKrrTg2MsVcrnMOdEVR1P8f4Ctb6Jx53IqbKrDKktfRZi96JjkKLFdKVxmPjusYYMvbYUv5I1d0rYJK1vQnKtXfeTM6+jFSD7nfL13tWOlQandVTZwilx5Tk/ANdm1gxSUT3VT+bWiIJ7YfEeik23NXWhM51Z2OKg42OYxtPBbskWDt75/Y78XfgEAFcEnPfleNYAWuZmyurZvGbeQuHP+ATRATXbpuli4eo0G8KaJt0Ax2I6jITQDxkjlS9irqDOuRo1jdJLGIwN6gpm5Hx8fOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7vyoT3W/Kgf2LE0PK5hz7jXQX8KauiOh7bKtATjWPJE=;
 b=Y4hGAY8XMNnkc8+dphTbOGHqTIhVUPBkSj9R2GKxRSBQxyNOj6IA0/8kySjj16zwXopl382LyywMIGIyHq2DyC6Oe9jCiH72sJyzZaz/GqsRXiazhsS37EctmGG5ff9zJ3PzKji5PdL0diQO7JZksbsiRB7NGrVEZzPW8ygElBtcMMagoTKRI1gtEhjtLecwwnglwuGNpjT/MVSBe4ATBHBPlqIEa/JNEi6I1OyuA0Pnn4IwTdBdPEFVn2LKs2rmqkouWMhKMT0sKEKH3bv5eEfHo/FlpCf0drh2k4/Un5k5U+cmZQjjl/OYpwdWMm3+mYSgX7pCHgztjgfTWEQMEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7vyoT3W/Kgf2LE0PK5hz7jXQX8KauiOh7bKtATjWPJE=;
 b=Npdx9HxFrC1V1TTZsLY41m08/iymJkuKG7bJC3c8ErB4ZpfDI5iSnSQokZuiaOt043ZTLoadfoA6UMEngZd0PG1jnFTnWRZ6fe6j80aGy9pkW7xJu1/l1ST+9RcfbTwvclQdJ2Q7eI8eJvVaJWkskEQ9TWZmeV/OedwQRb8VuaSVMurzxGgfAmq4mLBVAmzfnI4dQwTnOJ7oF3vj1gbE8sIQ3V0cclIfVqMehIZmGj+UvmGYxzUXCv3lpGlgXpSrEw403BeV8am3Fowsk7IXy3y1F1/RWq4MVj3TumfZQ8VXZvC9PO5uoUaB/tE/fURucHBz+nPV0UzkNJcfsyGWTw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by PH7PR12MB7379.namprd12.prod.outlook.com (2603:10b6:510:20e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Mon, 6 Oct
 2025 19:38:09 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9182.017; Mon, 6 Oct 2025
 19:38:09 +0000
Message-ID: <6cc43cd3-5f67-49cf-bafb-67a0a22368cf@nvidia.com>
Date: Mon, 6 Oct 2025 15:38:06 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/5] rust: bitfield: Add KUNIT tests for bitfield
To: Alexandre Courbot <acourbot@nvidia.com>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dakr@kernel.org
Cc: Alistair Popple <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, bjorn3_gh@protonmail.com,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 joel@joelfernandes.org, Elle Rhumsaa <elle@weathered-steel.dev>,
 Yury Norov <yury.norov@gmail.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Andrea Righi <arighi@nvidia.com>, nouveau@lists.freedesktop.org
References: <20251003154748.1687160-1-joelagnelf@nvidia.com>
 <20251003154748.1687160-6-joelagnelf@nvidia.com>
 <DDB69ONCWBEJ.1KGWC6H2VG2CE@nvidia.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <DDB69ONCWBEJ.1KGWC6H2VG2CE@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL6PEPF00016411.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:22e:400:0:1004:0:9) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|PH7PR12MB7379:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d428485-0b4e-4614-7bd5-08de050fe0c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dGhzcUhUM3I2Sk9uSHg3T3ZHcnVsNUVJSDJZclNWd213VlAxWlptaE44MmFD?=
 =?utf-8?B?ZXhLKzdETTFpWEVZclYrQ2VZd3Q1LzRlN2JtL0JMdi9lOW5NcjlKNTNua3RW?=
 =?utf-8?B?ZFc5OGlJWEpLS0ZwYVU5eGZIQkE0TWVDNUtUY05hZ2NORXpsV05JUFRRbjN1?=
 =?utf-8?B?aWZ4a1I1SUVyb2pzWHNKNk9CQktrZ3lOOVV4Z2JEckNzNk5TcU12OHBoUUtV?=
 =?utf-8?B?eXBRTWRURU83bENpc3JqZm16bWdUcXByWExIY0VXQjJqeDRFcVBuUXZ5eThR?=
 =?utf-8?B?TTdiaHpzdXlGU0VYNUh1eGFrSzN4SzVBUnVzMm5RU0hEd0hYSkN2Qk9vOXdQ?=
 =?utf-8?B?VDBoRUpFa3ZTYU10dVJzSUF3YVlNWEd3UldjM05PQVJ4RFZiMnRxRWRzRzlU?=
 =?utf-8?B?L1U2TmxuR1VDTXIzd1QzQXVDSlFGZG5ZQmxlTDE1VjlUYU1jaFBIbnRWZE5D?=
 =?utf-8?B?aXRZSU5PVit1SEgwUzA0ZmZmOWlyYVdwcGwyR2ZmZ01UbzY2c0xBMzdrSU1S?=
 =?utf-8?B?UFJlS1djQ0YvdEc0TTFiZFlSY1A4a2grYTFFZU1VamRGNjNzVHR4SlRWZ3Ju?=
 =?utf-8?B?Y2xQMStzYXFzcVY4dy9ybWwwTGRzeDJzeFVCcWhJZWI1TjArdjROVzEzcFF0?=
 =?utf-8?B?Y1l6b3RidDJOS2VRWnpRaCtqNWdueWdrWWFlc0o2WktWaXpSK2xjM1NDYjZH?=
 =?utf-8?B?NjUyZWV4dExNd1AyOG9MbGx0WjBpd0ZKaElhWDVIRU9rbXBjSjFNaTc4dzhv?=
 =?utf-8?B?QnowdGNBTG9RdFc1aFJXN21rc01lSnNVcVlDaWdzQjQ3UFJ4RTc1V2V1QXha?=
 =?utf-8?B?M2VIVjFlWUZVODNZVzl6NFJGVzFjNWRCRW9pbEQ0QmpZWTN2V1JyZUxKNXVB?=
 =?utf-8?B?UTgvcCtJcDhDODdqNnQreVF0T25KdU96TGZCRGcyZjUza09FRE1CR0dIRTE3?=
 =?utf-8?B?ZTMxUW82bUpTMk03K0M2ajIwVXBUQThDVjlJWUtHa2NZRzFBT2d5Q3h4N0k2?=
 =?utf-8?B?M1h3MGhYM3loNDFRS2VQSFFnQWdMQUlRM3JkcEY3aE9aUWJLODdLREcvaEVt?=
 =?utf-8?B?YlJNd1FjQzNyQ2FLcmlGZGxrb3d2VVZPdmQzejVUSy96cWhxSEdrMjVJdHFn?=
 =?utf-8?B?dTEycEJhZEI0YlJtQkZoMXJOajl3Vnl2RjJtbDdFSjVoZUlNdCtHdnM5UG03?=
 =?utf-8?B?QUt4SjdUdDMwYjVuWEQ2dDFiYUR3ZG5Ja2F4WGNPcmhxRjBKVVZ6UDQ3YkFP?=
 =?utf-8?B?cU9JbGk0MHNKd1FFTDFWUGxSNk5UWXc5eFprSXhUb25HWjRSNm1pL3RIZGZS?=
 =?utf-8?B?enhpcXh1N3dKS1VabktJdHZjSklNL04vR3g0SFhmc3FCRFhnLzd5N3Bzc2dC?=
 =?utf-8?B?UXZ6TjJGMGh4OXp2Q0xGbjhJU3NNU2xzYnVVaTg4aHVJZzBUZVQzcUNReWRN?=
 =?utf-8?B?SVczZE1QWGw3NzArL3kvS0ozZlpNOUpIdTZSTEVRY29BQXIvMjJKVklyN2NK?=
 =?utf-8?B?dU5OV3NTZ1FCcnk1bkdjd0wyTWljVHVnTVZPWEVUQjJ4TzdKVGpMSjArZEtF?=
 =?utf-8?B?QXdMK1c4djlhSFVBUENIK2c4OUlieHU4ejlvUWtNK1ZFSDlRRE1XNkZ1cjNu?=
 =?utf-8?B?SHFOTDdzZFN0K0lkb0RmamN4bVVWMEcvRCtVOHZQcnJMam8rZzZnajVDKzRu?=
 =?utf-8?B?T2NYUkUzdjBVWVFlY3JLTW9VcmNrNGwyK3NabU9wRGI0TXREbjhqK1VmMTYx?=
 =?utf-8?B?KzZpaDk4azlrMWkyS0hvbmtKZ1hnM3p1UG5OTFBEUzRlRTF2blYyYlNROXp3?=
 =?utf-8?B?UHJROFA4OGErVFJoUW5zSWhka3Urakx0NUphaGRDYkFEZVdQcTJiVXl6WUhH?=
 =?utf-8?B?OVhNL0R0TTh3UGpvZWZVaTRMNWwrUVg1ais0TVk1eEM3U1lxTFlmRkdYVzVL?=
 =?utf-8?Q?kifbmfr0jw9NrX6LQ5VuhxN40dePQcqw?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bmFzUnhzalI2TFVSZDVBMkZkYUx1VTk2Z2lEZk1Vc1hQWndOZkZ6Nkhpd2RV?=
 =?utf-8?B?bUFMd1I4ZGtDUU5lQXZ3UkFXamhzWXFDbmtvWEJ5MmRDVkNKL1JZNm1oZmVS?=
 =?utf-8?B?Mm96UlVYUXZFRHNaM1FicHB0MjJlOVhDNUJzZ3J4N0xnVVRTZWd6T2RPZFc1?=
 =?utf-8?B?YmczNjdVaDVLQ3haUTM3YkFiK3loK0xESlYwdlU2TnJ1cGNKVmRyV1FPeXNZ?=
 =?utf-8?B?VEdTYU5vWEVwQ3ZYNjVJOTA5QXJoRHVpQVRkaWlldzJBcTlYWmMza0pjT3ZR?=
 =?utf-8?B?WE45dDlWbDg5c3JiUHdsTmUvd2dJbTQ0K0EzcXdsdmxoOW4wVHFpUWlzMUgx?=
 =?utf-8?B?OGp1UHYvS3F4ZVNUQ0NKRSt6TCt2MjU0YlhUdHFFOVBTRTRDak96Ny9JYUFj?=
 =?utf-8?B?dVhyUUUxVGZkUGk1bjNHbGRxNWJiamtQcFFkb2RrOW5udXlUdU11MHJaM0lJ?=
 =?utf-8?B?dXk1QjI1NmIzUlQ4eXpvQWRjQkN4L0JOU0Q1NkJrOWRMTFFJKzFJRXF3SmJP?=
 =?utf-8?B?OVJOb0djOXJoMnlUVTc2VCt2VDNXUXVQc3hPV1hycGhtUTNBMmtycUpmQ3VQ?=
 =?utf-8?B?ZEZKN1V2Z2FReHRiWmpYMkFNb3cza0l0R2JTZ0VFNjgvVGRkZ1dYMHlWTEtF?=
 =?utf-8?B?ZFVMNDY2aGtORm5JNmw1SXBMS2xZZlhQY1Zqai9remIxOW1DREZKdmJkS09i?=
 =?utf-8?B?akVpang0TXgrdTZXTnlwcS91cWRRdWdMalpnZDVwcmVDQWVROGhHVm5VR3l6?=
 =?utf-8?B?Ri9sMkw4M0JwNk9qUVhaQ0RoNlFCZTRjMTFmK05iTDAyaTB3djVsZ0UxK0dY?=
 =?utf-8?B?a1kxUENxdDFublNCRXRGOHF2dUJDVlo4b0FMd3RLaHhPd3VGUEtVMjFqa3N2?=
 =?utf-8?B?Z2hIQTAySE11UEkrd3B3TUlJdmR6K3BsVTlCWDFrN0VuMnVINThnSHZ4eFRS?=
 =?utf-8?B?bERsU0o4dko2QWZmbVVZa3RTdjdJcDdTTWxNWWYrZGtMQk5WNmNKczNFY2I5?=
 =?utf-8?B?cWJ2YmFoUXhNNUVWT0FOSXVKOVZNLy9LaWVvT1k3TkNzUGV1Ni8xY1ZLbWtC?=
 =?utf-8?B?RnJ2Yk9ZbUVqNlBTdkdIS3hCT0NyK1MwUlF5T1d0M2JMOUhWZGozNEZNd0hE?=
 =?utf-8?B?WThMYXNndW4rUGtWRFJoUWpYNUE0UEk1dUZlL2dRRytoSzFWTXJkUlgzRzZh?=
 =?utf-8?B?SXQrSW1pN0YzOEFCMDF5L1EwT29rTkh3UUZ1VEIzYk03TWpzUzhTSDNpMk8y?=
 =?utf-8?B?cTdvY2tvbEo5UWpNVlVtVDZvcjh3d1BpZ1k1Qnh1NEN3NUZDT3BJb0xJV3lN?=
 =?utf-8?B?Smk5ZmlxYjJkOE5JR2FqWU9vcFhzdzZCbFFmaVkvc1dCTEpJV2JRN0hIWGZU?=
 =?utf-8?B?eUVobHdvWlFaMnRsMGdDSy9DMjhjQTNGTHNURFZtL0VrbU1rTE5ybUFTY1pl?=
 =?utf-8?B?S3ZMdjhPMmlGeDZxY1M1Vmg4WlJodHNIelNKci9rSkFlL2lUZjBLcncwckdZ?=
 =?utf-8?B?amNPVHBrU01LRGFXcWRURzRQZWw1U3pmL0J4SEJPaUpoVTlqc1VqbEJWVkFw?=
 =?utf-8?B?b05vWmxmNHpKaVZXL09OWC9aMnUrRXhKdWZvUGE2VW5JM3VmRUQyNGxyQ3ha?=
 =?utf-8?B?R1gxek81UVlDNGRXcHo3Y2dKZGY5N0xSV0ZzYU51Y3JzY04rQWNIcFRla1RE?=
 =?utf-8?B?VkRtR2JxVUtYT2lrK3ZQVFVjNGFiZFVVaFhpa3dKS2VFV0ZqVFpjcm42T25R?=
 =?utf-8?B?SmNEQjJKTlhxRUpvNktPWDZUdit0djFtWnBQdlpRMFU2MmIyOTNoRlpYalJr?=
 =?utf-8?B?L0pxb0hRMnk2bWxVcWJheFdPY0ZsSE82NEh1UXErL2NweUtocEpiODk0OG1S?=
 =?utf-8?B?WGwwUjkvUEQ2dUdjNVR3WVFiZlgxSDZPZVFNR1lPd1llNmdYRUNtUnZadFB4?=
 =?utf-8?B?dC9rT05xZDZkenBQNXJEUDRweVRRa3hVNXJMK1NHL1I1WUJwUEdpVGhOQVJs?=
 =?utf-8?B?SENJSHFOa0V0N2ZVVWFSbUhtOFVZR01NQXF0cUFBbVp2T0ZpTXVaMUlJdXV2?=
 =?utf-8?B?QjlqUUlzMEd5M2kySlNObmF4emVvUFJCNUt5ZS9sdk9IZk9DbkZldWMzYlZQ?=
 =?utf-8?Q?JWMXEfDIe717yNYLi1OUwnDDT?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d428485-0b4e-4614-7bd5-08de050fe0c8
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2025 19:38:08.9247 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ahr1kUFh8qnXeh9v6+YyhZ1iz4wrtPnuKa+tUEGKAPy8Zg1AtK7YUMkaP/uBzMYgZ5xOoTplOzPrJPUOz1UcVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7379
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



On 10/6/2025 6:37 AM, Alexandre Courbot wrote:
> On Sat Oct 4, 2025 at 12:47 AM JST, Joel Fernandes wrote:
>> Add KUNIT tests to make sure the macro is working correctly.
>>
>> Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
>> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
>> ---
>>  rust/kernel/bitfield.rs | 323 ++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 323 insertions(+)
>>
>> diff --git a/rust/kernel/bitfield.rs b/rust/kernel/bitfield.rs
>> index 09cd5741598c..f0e341a1a979 100644
>> --- a/rust/kernel/bitfield.rs
>> +++ b/rust/kernel/bitfield.rs
>> @@ -329,3 +329,326 @@ fn default() -> Self {
>>          }
>>      };
>>  }
>> +
>> +#[::kernel::macros::kunit_tests(kernel_bitfield)]
>> +mod tests {
>> +    use core::convert::TryFrom;
>> +
>> +    // Enum types for testing => and ?=> conversions
>> +    #[derive(Debug, Default, Clone, Copy, PartialEq)]
>> +    enum MemoryType {
>> +        #[default]
>> +        Unmapped = 0,
>> +        Normal = 1,
>> +        Device = 2,
>> +        Reserved = 3,
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
>> +    #[derive(Debug, Default, Clone, Copy, PartialEq)]
>> +    enum Priority {
>> +        #[default]
>> +        Low = 0,
>> +        Medium = 1,
>> +        High = 2,
>> +        Critical = 3,
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
>> +        struct TestPageTableEntry(u64) {
>> +            0:0       present     as bool;
>> +            1:1       writable    as bool;
>> +            11:9      available   as u8;
>> +            13:12     mem_type    as u8 ?=> MemoryType;
>> +            17:14     extended_type as u8 ?=> MemoryType;  // For testing failures
>> +            51:12     pfn         as u64;
> 
> Is the overlap with `mem_type` and `extended_type` on purpose? 

Yes, here I was testing the failure mode of ?=> without having to introduce a
new enum type. But I could just do so with mem_type by adding more bits to it,
so I'll do that and remove extended_type.

> It looks strange to me that the PFN also includes the memory type.

I agree with this (even though these structs are just approximately accurate and
for testing purposes). Since we're testing overlap already in later tests, I
will just remove it from this test.

Following is the new struct now, hope it looks ok:

    bitfield! {
        struct TestPageTableEntry(u64) {
            0:0       present     as bool;
            1:1       writable    as bool;
            11:9      available   as u8;
            15:12     mem_type    as u8 ?=> MemoryType;
            51:16     pfn         as u64;
            61:52     available2  as u16;
        }
    }

>> +            51:12     pfn_overlap as u64;
> 
> If `pfn` needs to be adjusted then I guess this one also needs to be.
> 
>> +            61:52     available2  as u16;
>> +        }
>> +    }
>> +
>> +    bitfield! {
>> +        struct TestControlRegister(u16) {
>> +            0:0       enable      as bool;
>> +            3:1       mode        as u8;
>> +            5:4       priority    as u8 => Priority;
>> +            7:4       priority_nibble as u8;
>> +            15:8      channel     as u8;
>> +        }
>> +    }
>> +
>> +    bitfield! {
>> +        struct TestStatusRegister(u8) {
>> +            0:0       ready       as bool;
>> +            1:1       error       as bool;
>> +            3:2       state       as u8;
>> +            7:4       reserved    as u8;
>> +            7:0       full_byte   as u8;  // For entire register
>> +        }
>> +    }
>> +
>> +    #[test]
>> +    fn test_single_bits() {
>> +        let mut pte = TestPageTableEntry::default();
>> +
>> +        assert!(!pte.present());
>> +        assert!(!pte.writable());
>> +        assert_eq!(u64::from(pte), 0x0);
>> +
>> +        pte = pte.set_present(true);
>> +        assert!(pte.present());
>> +        assert_eq!(u64::from(pte), 0x1);
>> +
>> +        pte = pte.set_writable(true);
>> +        assert!(pte.writable());
>> +        assert_eq!(u64::from(pte), 0x3);
>> +
>> +        pte = pte.set_writable(false);
>> +        assert!(!pte.writable());
>> +        assert_eq!(u64::from(pte), 0x1);
>> +
>> +        assert_eq!(pte.available(), 0);
>> +        pte = pte.set_available(0x5);
>> +        assert_eq!(pte.available(), 0x5);
>> +        assert_eq!(u64::from(pte), 0xA01);
>> +    }
>> +
>> +    #[test]
>> +    fn test_range_fields() {
>> +        let mut pte = TestPageTableEntry::default();
>> +        assert_eq!(u64::from(pte), 0x0);
>> +
>> +        pte = pte.set_pfn(0x123456);
>> +        assert_eq!(pte.pfn(), 0x123456);
>> +        // Test overlapping field reads same value
>> +        assert_eq!(pte.pfn_overlap(), 0x123456);
>> +        assert_eq!(u64::from(pte), 0x123456000);
>> +
>> +        pte = pte.set_available(0x7);
>> +        assert_eq!(pte.available(), 0x7);
>> +        assert_eq!(u64::from(pte), 0x123456E00);
>> +
>> +        pte = pte.set_available2(0x3FF);
>> +        assert_eq!(pte.available2(), 0x3FF);
>> +        assert_eq!(u64::from(pte), 0x3FF0000123456E00);
>> +
>> +        // Test TryFrom with ?=> for MemoryType
>> +        pte = pte.set_mem_type(MemoryType::Device);
>> +        assert_eq!(pte.mem_type(), Ok(MemoryType::Device));
>> +        assert_eq!(u64::from(pte), 0x3FF0000123456E00);
>> +
>> +        pte = pte.set_mem_type(MemoryType::Normal);
>> +        assert_eq!(pte.mem_type(), Ok(MemoryType::Normal));
>> +        assert_eq!(u64::from(pte), 0x3FF0000123455E00);
>> +
>> +        // Test all valid values for mem_type
>> +        pte = pte.set_mem_type(MemoryType::Reserved);
>> +        assert_eq!(pte.mem_type(), Ok(MemoryType::Reserved));
>> +        assert_eq!(u64::from(pte), 0x3FF0000123457E00);
>> +
>> +        // Test failure case using extended_type field which has 4 bits (0-15)
>> +        // MemoryType only handles 0-3, so values 4-15 should return Err
>> +        let mut raw = pte.into();
>> +        // Set bits 17:14 to 7 (invalid for MemoryType)
>> +        raw = (raw & !::kernel::bits::genmask_u64(14..=17)) | (0x7 << 14);
>> +        let invalid_pte = TestPageTableEntry(raw);
>> +        // Should return Err with the invalid value
>> +        assert_eq!(invalid_pte.extended_type(), Err(0x7));
>> +
>> +        // Test a valid value after testing invalid to ensure both cases work
>> +        // Set bits 17:14 to 2 (valid: Device)
>> +        raw = (raw & !::kernel::bits::genmask_u64(14..=17)) | (0x2 << 14);
>> +        let valid_pte = TestPageTableEntry(raw);
>> +        assert_eq!(valid_pte.extended_type(), Ok(MemoryType::Device));
>> +
>> +        let max_pfn = ::kernel::bits::genmask_u64(0..=39);
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
> 
> Maybe check the raw value here as well, although I guess the previous
> test already covered this anyway.
> 
> With these points confirmed,
> 
> Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
Thanks! I will resend just this patch as a reply-to this patch (hope that's Ok).

 - Joel


