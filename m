Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 260CFC4200D
	for <lists+dri-devel@lfdr.de>; Sat, 08 Nov 2025 00:43:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 515A510EB96;
	Fri,  7 Nov 2025 23:43:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="fhBBrxkK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012052.outbound.protection.outlook.com
 [40.93.195.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA31210EB93;
 Fri,  7 Nov 2025 23:43:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ha7HH7fRKBLxY031wViOLuSqvhNEDr4QFgaiKxcPZiTBAuN4+R/7AOGodWbJAiJqr9jZDzsUmRFOLHsTkxoFUbuIBPODsBYmMH7+8TYmFKT2nSIW6/nnV+vlI+zI+Hpbc1nHd9Jrfl1WFukfsBZ3Q9dqidmoHBmI0o7XMdM7YnaoaAc259d38Im9L1g/59qLbiF6uTkfrLJ7xIRMsMLpZIwDB+IpSbpfnOLeE0GgF1fHCvx68tC3mY+vOaG7wJa2PrXXUL3cD7LAcyJFERPUWTMrcxmQL7AW4cbtlK8yeM3hLP/QiAWk/1s/v71K7IWaBGZwDYGv4T/6wlSii6HsCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SLEcwgydj6GgZA9SDVG/TGInh483DC25o9/YhHxye9w=;
 b=h2FwUxejYIEwVq+h/G9JdvTwgSByBNgwLKBFLCZjG1X+SamPtS4r2y3E7T3ZUE5BEWlBgzQHEgYBlh3H38mw9agXoEyUmWr09ds45Lthzem67wy/Ie02HNVHGqiYo6rTHwQ8SiBVXUVF51BK5azRnt31ofqg5S4fYKbe1K0OIRDemHBzuKG9DVJVqDuhe5R5CGOULYQ2Mb4PqCX6/dluMo/N+FaZRGUcmM2D5865pZmOQdJ7fndlrJOz+A4BD9GCevSNMBTd917cQgsxalwtn+ou3a1Qk0ntqcu5Blf3uFaW5HvfrlqT5gaBRUPCZsPJyXK2NGJvTv7tYoblv+1sVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SLEcwgydj6GgZA9SDVG/TGInh483DC25o9/YhHxye9w=;
 b=fhBBrxkK/31z/sBAHLKexBL1OYgPrEZHFH++xUaYie8Y0BSffBRCZV2MRp36cEaDDC/1tl33bep9PjW0SDNk9QIlBoWH55G9fo86KzmO+Hlnt3m+zReHi7gCXwo1pbTMzvMygBeNjqpiwlsGO4SA6Wawa7yotS4NtuO3VekJuKXkvLaohwBeDQ40N/ARHpWb8CQWua+/Uf7byx5NvwaiDEayIe1cEP5j8j6bHStr5LxPZ3mHWsTCNpBHCGb90xMHkTZqJhq8gyz88JKyJy3XXr6N8kmyykhPSiSihnheYWMLe3fdcVd8JfGt7lJ/kQnux2OittCHAsl+kyal07KQRA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by BL3PR12MB6642.namprd12.prod.outlook.com (2603:10b6:208:38e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Fri, 7 Nov
 2025 23:43:40 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9298.010; Fri, 7 Nov 2025
 23:43:40 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Sat, 08 Nov 2025 08:43:07 +0900
Subject: [PATCH v8 06/16] gpu: nova-core: Add a slice-buffer (sbuffer)
 datastructure
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251108-gsp_boot-v8-6-70b762eedd50@nvidia.com>
References: <20251108-gsp_boot-v8-0-70b762eedd50@nvidia.com>
In-Reply-To: <20251108-gsp_boot-v8-0-70b762eedd50@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, 
 Lyude Paul <lyude@redhat.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCP286CA0094.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::8) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|BL3PR12MB6642:EE_
X-MS-Office365-Filtering-Correlation-Id: dc37b1cd-600e-4694-c063-08de1e577a71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|10070799003|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RmxIVVppSUtLQzUrd2Q1MFJWL3dmQVR5SUtkSDBUUE1CQm54L2hqdWNhL1N0?=
 =?utf-8?B?aUlrdkVWYXUwOWdlK01hVDVWbncrY0VWbkwrU1VOZ0ZLL21WQWhEanVEWHAx?=
 =?utf-8?B?blp6SEpYNWtZWmRxdytHektKYXV1WG9kRmNoWDNQTVhnQm5ja0dpTkk0aWxT?=
 =?utf-8?B?aFpqMGdhb051N1YySTIxYU1xaVkwWkdGL085eWRRSFlzcW1vVWplRFdzOXR4?=
 =?utf-8?B?a1pPc2hscVhuRDlqeVBXeXVJMVB2cm1vWDliZEt1ZTJmdkhTTloxZE9hK0lX?=
 =?utf-8?B?QXl2UkNHcmR3bnBYZW5qN2FvTHBNZnFPSUpxMDZhdVpUUnBYdGpuNXhFVFhi?=
 =?utf-8?B?MnpxOWFydmNhTm9lUkE0cUVQZ1E0TGZucVpFclpLS1Y1VUZKZS9naGdVSDEv?=
 =?utf-8?B?Y202Ny9wMWRFQmZzTit3b3JsVjVNUzlZL2FuOFRuamJiUGhwQ3J4bnhKY2Fk?=
 =?utf-8?B?Z1dsVFh2WmdOdGlwQWVuT2RNZEtWMzgwZ0ZXZUFwZW5BNk5HUmE1T2N6eEli?=
 =?utf-8?B?R09zNVBUUzZpQmpITFU0cXlwK3JSR1J0Z3Bkcm0rUk14SmxGUWowd2VTZkla?=
 =?utf-8?B?NVlxQjJoVitMcjNFS3dKNXd2MlVhcUFnNnZ6dDBBcEpDc1I0Q25qWmk1THFM?=
 =?utf-8?B?SlJhMGpWbjVHcWswYlM0Q3g0ajVRQnI0WnVxaDdHZjB3V2dCN05qVC9ZeEVZ?=
 =?utf-8?B?d09JWXJ2U1RYZ0hrMWlsTWNjV28vekRnUVoweEIzY2VLdkd5WTVrcDZHbmdU?=
 =?utf-8?B?WmlVVlE2VE96dHpoQUUyVWdLVlBTREhhMW5Ua2ZpVlI2amNNVW5hQTMxMlZq?=
 =?utf-8?B?ZXdiMWNYYmVNbFE0SmNCbjdvSHdBZ0htdm8xT1IxQ3JWNVdlVWNGNXc3eDNH?=
 =?utf-8?B?UHdBelRkbW9iUzJGS21GdWJQaWJxTDFwUWV4Ynd1NDNaQWtCaUNYM0VnN3dM?=
 =?utf-8?B?Vlo2Vk5jdDFXS3FZdmxKdmx3eS80YkdOMHNlVmd1SEJLMXczSDh2RjhaS1Fu?=
 =?utf-8?B?UklmRzdRVHZGd2RqOVJtdzBPTWV2dDJONXNpM3lOc1RML2FvTDVUV1liVmNM?=
 =?utf-8?B?UlYxemhvYXpvOVpDMWZKUVVVT21kVnIyVGlXNlhOTkxPQjBTKzJNRlhDc2Fk?=
 =?utf-8?B?Zk1tcmR4cmtYeGl6ZU9Oc0N3UnlVNS9DL01LYlgyOVpMZUZTYmZucTErL212?=
 =?utf-8?B?ODB1OVdBVXQ0end3Uitac2NFcVNsMmY5dFM2NkUyV3lMNi9tR2JWaWlUUjVi?=
 =?utf-8?B?LzM2aGpZaUxibEluM0U4b3hLV2J1Y1BkczVzZjdMYzFkbXpicXZXOXl5U3hB?=
 =?utf-8?B?QUM1Wm1zU3VkNmhDVWhCZUNTTkN4ekZwdTM3TVViN1JGWWswb3czYkhic1J1?=
 =?utf-8?B?YUV5OHJQaW8yZ1RkTFhlbGtCSlB2ZVhDZkpnYmxqZXBERm50Z1U3clV0b3c3?=
 =?utf-8?B?QjR3d05ZekdNcm1QK2l5bkN2S00wNGlNQy9XNGJULzFxbmNGZkttcmYrc3FN?=
 =?utf-8?B?djZpMUFkaUJZbldKeFpRUkQ2eHdqdUFFNFRCeWlScldzQjFka2R5dU9iaGl4?=
 =?utf-8?B?a1hvc0pZaUNuMjRuQnFnTW9PWGZ5TDBucU4rVk1BL3U4VVlmZFZZNlFDRkNr?=
 =?utf-8?B?OXRQK2YvNFVmOERTeHRITGFrcXZIYWgzc0puQ1NXVmR0ME5BRjZjMUFiM0JX?=
 =?utf-8?B?dXlIQXV2VlJaejFkSTVhUWI1OXFmMnBDRTJiRkxsaU1SRFdLNE5mU211dlhk?=
 =?utf-8?B?VEVzVENZdFpOemFJK2l2UURiUFgyOVFZUWhxRG0vaVhVRCtBT1hCY25TUzFp?=
 =?utf-8?B?dWhKeFhaUnJSc1NYdElVaXRjU1E2Q3p5QUtLQVk4WWVFZ1JZWDJsMDB1UTBF?=
 =?utf-8?B?cjVWSUlOQlQ4ZExjYlFzdzZ3Z3k0L2FMQ04vTllEMkNBU1l4bnlxZXlQdk0x?=
 =?utf-8?B?aTlBL0FwTEVUQjRaZmJRM3FrY1FjYkdmZ3ZEeUhSejU5TG9xR0xPVlJ4Q2l3?=
 =?utf-8?Q?nsxvoSGPdwY74B3v254VXw8iYT4ZaI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(10070799003)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QmY0cGJ1RW1yKzJXSW92eEhCb0hGTUpHN0V4emgyaHBiUU9oeXdwSndUYklC?=
 =?utf-8?B?THZnV1doQkY1djdTUWpvUEYrUVpzVE9LTElqdFRmTWgwNnViaGZHV2xYZmFn?=
 =?utf-8?B?ZEg1ZEgxUUJ0V3E2eFdXelVHbXhtMm84bitlWnpMMVVscUNkbldhWUtRMHZI?=
 =?utf-8?B?cGNHN0xXanhTeTRySnFHUVVTcmtmMDVObXBWVWd2ZldFY0Rxdk1KYTZTNmg2?=
 =?utf-8?B?ZEdPZnQvNlpqY1NTalRvSEE0S2Q1WURxMmZFR01RREVsNmtsMlJ4Vm9wWVM0?=
 =?utf-8?B?OEtDdmpibjVIdmxRQ2U5R2dsS0h1ckZEbVpUd0k0SHRLakp5OUJyZ3Z6Tmdp?=
 =?utf-8?B?dkMxQWNhcEVVNUozUldOdDZwVzlKZ3J3M1kyQXh1UndJU3YyQW5xNldBdHRh?=
 =?utf-8?B?endHQmloTC9xOFRYRXJhSUF2YjFvaFpQT3BoMHo5UU1VUWJLeVp1TE9PbkZD?=
 =?utf-8?B?RVBBWER5ejVwSHZaZm1EaXFTaDR3Vyt6TmdpVjdLU042UU9XaHhIY0NDOUNn?=
 =?utf-8?B?Sk5PZDQ5OEg3UCtuNFlEcExaWVhFeU1HMkRndWNqVTZlZEN2NlYwTDJOdnZX?=
 =?utf-8?B?N0ZwWmdZakMwcmJBbGdYYzJuQ1ZYSDIxOGM3ZEhEM1NQOTJJZDBWWG9uMXVI?=
 =?utf-8?B?U0VVSWlST3JMT21lM1N1UWlqMnM0b2F0MkxIRWxqK01YWnRnVDZPVllaNlYv?=
 =?utf-8?B?TnlwejdRR0Rad2hXcXJ0Y01VdnJqM0JqemJKdkxpSzZGd216Qkp5djNnQ0Vm?=
 =?utf-8?B?d3RwbkdwYW1tN0dnT1gwZ01rVVJPSFRBREdQbktBYWlvRWxOVnpuTkZWT293?=
 =?utf-8?B?NHVqNmVhSkYvbkxSd2dlSFVER2ZZaXlTUW1GSEhrbldMVUZVK2VLdzlIa3JY?=
 =?utf-8?B?SnQ3MStQbXUvMmJmRXRlSVlkSFYrUmUrTytXUzl4Zkc0QmZ5ampwMDNqZDY2?=
 =?utf-8?B?UDFtY2RSVzN5eVl6ak5ITG5vbDNUVmJudXNXYnhBb094c3loMmV6NHhXeC92?=
 =?utf-8?B?T2k1dnJMbHM5V0l1bER4TThrRHZFUzUwS0FCRHpKUFMzYW9odlIzaXRSM3VD?=
 =?utf-8?B?U1RrajNqQU5WM2htVWNBbUkrYUtDT1J4R2xOdldneGJDRmlPQ29nM2dJc2F6?=
 =?utf-8?B?ekxRRGVtcnVweURzWVBLZEJsenNZaTJZcDlzcGg0WTBnR0o4V3lsTTlNY3ZF?=
 =?utf-8?B?ZnpoUVpjQVE3SUprdUtSZ1B6TXZldkQxdTFuZnlDUkt3OEhNK2E1Ukd2cVVn?=
 =?utf-8?B?eTNaRHVRbndpNmFUVVMzL1crQlJ2SmxGL0FKZDQ1OVVSdCtZTE9adEo4VVRD?=
 =?utf-8?B?U0ZvRU9FOHh0OFVBM3pZRHNaUkZBNERvSTJvUWYwZVpBUW50TE5tbzFiRkpU?=
 =?utf-8?B?aHVLelh5UFhHZkRRWGZXMHB2Y2NwUVEwWGJrZGhYaHNOS2FoZkliUjIycEl2?=
 =?utf-8?B?VzlPUFAybTAyWXR0U0Fha3ArUTBhRHV3aWpSSk55RTVhL2laUUxuQk1mY0NY?=
 =?utf-8?B?OWp3eks3bUswRXdCU3BBWE5rSk5BZ0RucDRROGtkdFlCSUMyYnFoZE1aTkND?=
 =?utf-8?B?RGFQVlRGdk5XMmpiUWJ3dXcvMWg3N2FnVnI2TFpTb0JQc2Jpd3Y5bE9FNGlK?=
 =?utf-8?B?Mk1TT05LNUFNOUFLTDduQS8vRFp4bldqN3FlM1FQdWpGZ3hpTUdtZ1FwM3I0?=
 =?utf-8?B?ZHZoN3NJVXlsdG9OajRadzdTd3J3cUhZSE1obTR5NC9iYjFJNUMzTHBHVVdh?=
 =?utf-8?B?VjhiQ2M1RWphV2VIeHhhbnRJeVhtWjJJYlZwOE8xNEN4dE0wQWEwekdzL1ZU?=
 =?utf-8?B?S2xrNSsycU5oby9wbDk4U0tlUlRJRGovZk1VMkR4RjZCRkJXYloyL2hwNlBn?=
 =?utf-8?B?QTNXL1Y0Sm84Zi9YYlVxSzZNWmd3a1IzVkxQSVVDZ0pGVUtPakErN1prUlZ0?=
 =?utf-8?B?NE0yVUxGZUJrVVhFN01iYXZrQSs2aUpQYXVHUHduRDMvRUpIeFNJcWtkTVV4?=
 =?utf-8?B?bkJHT3MwbXgzbzFzZ0Z0V0xZVlZyTGVzWXhYbFkrOTYybjhGZHFvOWZhTVMr?=
 =?utf-8?B?VW94TDRvT2plVk9hdjJMZE95YWV5Y0k5Q1Zhb2NFUHZtcjBDa2F1bXB1OXBt?=
 =?utf-8?B?Zjhaa0VBdXNDbTNQditpcEh1MmF0b2lvcHJJWmIydURzMkh5RXhIYUdxQWF4?=
 =?utf-8?Q?+6GL3+SkyK1tCKeljOnRvhlJyHnRSbeDKI7DMt92AKgI?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc37b1cd-600e-4694-c063-08de1e577a71
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 23:43:40.1161 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RfjgbVPoiFN9WOnzuov/oNwoIq2YJInUw13pazlb+XTv5rdr7dWV2xaGEDetBiElyJstmgIfrLJ/kJn+PpTNmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6642
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

From: Joel Fernandes <joelagnelf@nvidia.com>

A data structure that can be used to write across multiple slices which
may be out of order in memory. This lets SBuffer user correctly and
safely write out of memory order, without error-prone tracking of
pointers/offsets.

    let mut buf1 = [0u8; 3];
    let mut buf2 = [0u8; 5];
    let mut sbuffer = SBuffer::new([&mut buf1[..], &mut buf2[..]]);

    let data = b"hello";
    let result = sbuffer.write(data);

Reviewed-by: Lyude Paul <lyude@redhat.com>
Co-developed-by: Alistair Popple <apopple@nvidia.com>
Signed-off-by: Alistair Popple <apopple@nvidia.com>
Co-developed-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/nova_core.rs |   1 +
 drivers/gpu/nova-core/sbuffer.rs   | 230 +++++++++++++++++++++++++++++++++++++
 2 files changed, 231 insertions(+)

diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index 9180ec9c27ef..c1121e7c64c5 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -15,6 +15,7 @@
 mod gsp;
 mod num;
 mod regs;
+mod sbuffer;
 mod vbios;
 
 pub(crate) const MODULE_NAME: &kernel::str::CStr = <LocalModule as kernel::ModuleMetadata>::NAME;
diff --git a/drivers/gpu/nova-core/sbuffer.rs b/drivers/gpu/nova-core/sbuffer.rs
new file mode 100644
index 000000000000..bfd64fc21bbb
--- /dev/null
+++ b/drivers/gpu/nova-core/sbuffer.rs
@@ -0,0 +1,230 @@
+// SPDX-License-Identifier: GPL-2.0
+
+use core::ops::Deref;
+
+use kernel::alloc::KVec;
+use kernel::error::code::*;
+use kernel::prelude::*;
+
+/// A buffer abstraction for discontiguous byte slices.
+///
+/// This allows you to treat multiple non-contiguous `&mut [u8]` slices
+/// of the same length as a single stream-like read/write buffer.
+///
+/// # Examples
+///
+/// ```
+// let mut buf1 = [0u8; 5];
+/// let mut buf2 = [0u8; 5];
+/// let mut sbuffer = SBufferIter::new_writer([&mut buf1[..], &mut buf2[..]]);
+///
+/// let data = b"hi world!";
+/// sbuffer.write_all(data)?;
+/// drop(sbuffer);
+///
+/// assert_eq!(buf1, *b"hi wo");
+/// assert_eq!(buf2, *b"rld!\0");
+///
+/// # Ok::<(), Error>(())
+/// ```
+pub(crate) struct SBufferIter<I: Iterator> {
+    // [`Some`] if we are not at the end of the data yet.
+    cur_slice: Option<I::Item>,
+    // All the slices remaining after `cur_slice`.
+    slices: I,
+}
+
+impl<'a, I> SBufferIter<I>
+where
+    I: Iterator,
+{
+    /// Creates a reader buffer for a discontiguous set of byte slices.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// let buf1: [u8; 5] = [0, 1, 2, 3, 4];
+    /// let buf2: [u8; 5] = [5, 6, 7, 8, 9];
+    /// let sbuffer = SBufferIter::new_reader([&buf1[..], &buf2[..]]);
+    /// let sum: u8 = sbuffer.sum();
+    /// assert_eq!(sum, 45);
+    /// ```
+    #[expect(unused)]
+    pub(crate) fn new_reader(slices: impl IntoIterator<IntoIter = I>) -> Self
+    where
+        I: Iterator<Item = &'a [u8]>,
+    {
+        Self::new(slices)
+    }
+
+    /// Creates a writeable buffer for a discontiguous set of byte slices.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// let mut buf1 = [0u8; 5];
+    /// let mut buf2 = [0u8; 5];
+    /// let mut sbuffer = SBufferIter::new_writer([&mut buf1[..], &mut buf2[..]]);
+    /// sbuffer.write_all(&[0u8, 1, 2, 3, 4, 5, 6, 7, 8, 9][..])?;
+    /// drop(sbuffer);
+    /// assert_eq!(buf1, [0, 1, 2, 3, 4]);
+    /// assert_eq!(buf2, [5, 6, 7, 8, 9]);
+    ///
+    /// ```
+    #[expect(unused)]
+    pub(crate) fn new_writer(slices: impl IntoIterator<IntoIter = I>) -> Self
+    where
+        I: Iterator<Item = &'a mut [u8]>,
+    {
+        Self::new(slices)
+    }
+
+    fn new(slices: impl IntoIterator<IntoIter = I>) -> Self
+    where
+        I::Item: Deref<Target = [u8]>,
+    {
+        let mut slices = slices.into_iter();
+
+        Self {
+            // Skip empty slices.
+            cur_slice: slices.find(|s| !s.deref().is_empty()),
+            slices,
+        }
+    }
+
+    /// Returns a slice of at most `len` bytes, or [`None`] if we are at the end of the data.
+    ///
+    /// If a slice shorter than `len` bytes has been returned, the caller can call this method
+    /// again until it returns [`None`] to try and obtain the remainder of the data.
+    ///
+    /// The closure `f` should split the slice received in it's first parameter
+    /// at the position given in the second parameter.
+    fn get_slice_internal(
+        &mut self,
+        len: usize,
+        mut f: impl FnMut(I::Item, usize) -> (I::Item, I::Item),
+    ) -> Option<I::Item>
+    where
+        I::Item: Deref<Target = [u8]>,
+    {
+        match self.cur_slice.take() {
+            None => None,
+            Some(cur_slice) => {
+                if len >= cur_slice.len() {
+                    // Caller requested more data than is in the current slice, return it entirely
+                    // and prepare the following slice for being used. Skip empty slices to avoid
+                    // trouble.
+                    self.cur_slice = self.slices.find(|s| !s.is_empty());
+
+                    Some(cur_slice)
+                } else {
+                    // The current slice can satisfy the request, split it and return a slice of
+                    // the requested size.
+                    let (ret, next) = f(cur_slice, len);
+                    self.cur_slice = Some(next);
+
+                    Some(ret)
+                }
+            }
+        }
+    }
+
+    /// Returns whether this buffer still has data available.
+    pub(crate) fn is_empty(&self) -> bool {
+        self.cur_slice.is_none()
+    }
+}
+
+/// Provides a way to get non-mutable slices of data to read from.
+impl<'a, I> SBufferIter<I>
+where
+    I: Iterator<Item = &'a [u8]>,
+{
+    /// Returns a slice of at most `len` bytes, or [`None`] if we are at the end of the data.
+    ///
+    /// If a slice shorter than `len` bytes has been returned, the caller can call this method
+    /// again until it returns [`None`] to try and obtain the remainder of the data.
+    fn get_slice(&mut self, len: usize) -> Option<&'a [u8]> {
+        self.get_slice_internal(len, |s, pos| s.split_at(pos))
+    }
+
+    /// Ideally we would implement `Read`, but it is not available in `core`.
+    /// So mimic `std::io::Read::read_exact`.
+    #[expect(unused)]
+    pub(crate) fn read_exact(&mut self, mut dst: &mut [u8]) -> Result {
+        while !dst.is_empty() {
+            match self.get_slice(dst.len()) {
+                None => return Err(EINVAL),
+                Some(src) => {
+                    let dst_slice;
+                    (dst_slice, dst) = dst.split_at_mut(src.len());
+                    dst_slice.copy_from_slice(src);
+                }
+            }
+        }
+
+        Ok(())
+    }
+
+    /// Read all the remaining data into a [`KVec`].
+    ///
+    /// `self` will be empty after this operation.
+    #[expect(unused)]
+    pub(crate) fn flush_into_kvec(&mut self, flags: kernel::alloc::Flags) -> Result<KVec<u8>> {
+        let mut buf = KVec::<u8>::new();
+
+        if let Some(slice) = core::mem::take(&mut self.cur_slice) {
+            buf.extend_from_slice(slice, flags)?;
+        }
+        for slice in &mut self.slices {
+            buf.extend_from_slice(slice, flags)?;
+        }
+
+        Ok(buf)
+    }
+}
+
+/// Provides a way to get mutable slices of data to write into.
+impl<'a, I> SBufferIter<I>
+where
+    I: Iterator<Item = &'a mut [u8]>,
+{
+    /// Returns a mutable slice of at most `len` bytes, or [`None`] if we are at the end of the
+    /// data.
+    ///
+    /// If a slice shorter than `len` bytes has been returned, the caller can call this method
+    /// again until it returns `None` to try and obtain the remainder of the data.
+    fn get_slice_mut(&mut self, len: usize) -> Option<&'a mut [u8]> {
+        self.get_slice_internal(len, |s, pos| s.split_at_mut(pos))
+    }
+
+    /// Ideally we would implement [`Write`], but it is not available in `core`.
+    /// So mimic `std::io::Write::write_all`.
+    #[expect(unused)]
+    pub(crate) fn write_all(&mut self, mut src: &[u8]) -> Result {
+        while !src.is_empty() {
+            match self.get_slice_mut(src.len()) {
+                None => return Err(ETOOSMALL),
+                Some(dst) => {
+                    let src_slice;
+                    (src_slice, src) = src.split_at(dst.len());
+                    dst.copy_from_slice(src_slice);
+                }
+            }
+        }
+
+        Ok(())
+    }
+}
+
+impl<'a, I> Iterator for SBufferIter<I>
+where
+    I: Iterator<Item = &'a [u8]>,
+{
+    type Item = u8;
+
+    fn next(&mut self) -> Option<Self::Item> {
+        // Returned slices are guaranteed to not be empty so we can safely index the first entry.
+        self.get_slice(1).map(|s| s[0])
+    }
+}

-- 
2.51.2

