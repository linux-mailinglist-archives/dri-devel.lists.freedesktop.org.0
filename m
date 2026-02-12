Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kABzAcyOjWl54QAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 09:26:52 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87DEC12B475
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 09:26:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5F5A10E700;
	Thu, 12 Feb 2026 08:26:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="SzWGd5yQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010049.outbound.protection.outlook.com
 [52.101.193.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7178510E6FC;
 Thu, 12 Feb 2026 08:26:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DyY4CGgJ2h8lm3cADEIWbvu8XoNe3tf3WxPO4x0K25riGcGEtuKiFre39pWmUBnorGPMUp7zIq/NpgXq67LoXNq6gBP0caZdzDa/RA2NeejXuC+M4qRkjdqhjQQVciGEr+JZAYTFeh2NRZ4R4FhQyhXZlEDo+43TM61Cdmx5wp0t71c9hGEKIjIIbYwsdojf9dPcKE1ybGIJ5JVnhOCcslunXQWwewRhLPBsaH7Sm4GX8Vnkj9nYe0xgId3/H75Lt3x6KZm4TKt8AqSY30ZHHOTR3dHYITcL/+xFJIg0jlmBJjrwrBx2auEFpMjKvESgPT+SZtrHcEVgHWqevEwPZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lrs4IATQoFqMA5qaAUq7H8/hL7qRrZ7ztBAi84BLs8A=;
 b=tjK9NeV9Fpji/moHVuobyFqncNomWSMsZfJEcqr0HAOgyVFY6eRPNpb/gIJT2zLlBzFUBTK7XDGI0D2Kj0oLuSQg1AEgDkfHwa+osQjDRmTLtyGJJUnKFN537vYA7X5BORnj1WlAZl7DvdTh2EMhlCmJbFBt8nknvDGDXE+h9bYPRwjjJnYpANNtQzKDCMu/Fm21HzvzAzrL7fSFVwGHHJSrZQ4KIFT948UB+0dFPqSAfVAHVuDw+n0LmJtP+zQWmkMochDWVKMgrBP/96mHZwVg8vrnP+BmHQa9PnJqaW1HXIr5zEjvvZfxsB4I7XP1cKRkmIunFiNaoZQd/QNVfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lrs4IATQoFqMA5qaAUq7H8/hL7qRrZ7ztBAi84BLs8A=;
 b=SzWGd5yQ1oFV4mEYMNZoD9Q5J1SRNdD/52AV9T67kc2PfpoEz+ts0BKepeqGw8Ib2vnEFf2TpJOHv82VILZLcTSCoeUFmElT0f0zTFY5heqpjXGSlgbakphq3QID+Cek0eeBRrcQWMqPFWIlH9n3xTJsCB5ajsKe0EP1P5XK78OLG1Vx10yopuzCjaWzPBunswAZkepm/eA1ZxbTDGvVvLarOrvBJfuKjRVfDVhsLXnEZGw8LJFEZv1nOzt/RDZW9foq5t4Gov+JXTsOnhVBUyg96g+UGaGKQWe922WaWGO3JkWILb/nn7HTSqcPy0gDwcsifK4qkPxhk9LGROjvbA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH0PR12MB8800.namprd12.prod.outlook.com (2603:10b6:510:26f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.20; Thu, 12 Feb
 2026 08:26:43 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%3]) with mapi id 15.20.9611.008; Thu, 12 Feb 2026
 08:26:43 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Thu, 12 Feb 2026 17:26:22 +0900
Subject: [PATCH v9 5/9] gpu: nova-core: move brom_params and boot_addr to
 FalconFirmware
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260212-turing_prep-v9-5-238520ad8799@nvidia.com>
References: <20260212-turing_prep-v9-0-238520ad8799@nvidia.com>
In-Reply-To: <20260212-turing_prep-v9-0-238520ad8799@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCP286CA0311.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38b::6) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH0PR12MB8800:EE_
X-MS-Office365-Filtering-Correlation-Id: a65b5290-62be-4b52-dc08-08de6a107448
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|376014|10070799003|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bnJEU0I0QXB3eUViUzl2RmVWdndGSUN2aVRaK1NBa0NMR3RrM0Q4YStCWHg5?=
 =?utf-8?B?K0ptVENDNXA3TEdIWHFYOFF2RnJqRUJWK1ZDUHlFMXEvY2hGRWFJOXRIT2tX?=
 =?utf-8?B?SWpobnJ4bVM4MnJSSnpqR3RPeFJVZHFGck1vT2JmaEJpZkFNcHJObDh1Z0dj?=
 =?utf-8?B?SHM5WEFaVDRhWWtpOVB0RVRUbCs0d2FuczlmTnVBcWZXMHJGZUNVYmJSS3Za?=
 =?utf-8?B?VXhvRHVORy9GcUxqclNoNGZpemI3RzkxVVlnR0dxZWhzeHdzRmlVK1BoM045?=
 =?utf-8?B?dVFUck1qM1JKTW8yTStvWkxWV0FuQlcydXUwZVdWcUwrcHZ3RFc5WGJjOGpZ?=
 =?utf-8?B?VzgxUlZLK1lIYWYrcWZGUDhXanJaV3FRSVV6WUs4UEViV29xTFZNblVhZGNX?=
 =?utf-8?B?R3VXdXpRV0JzYnp0N2lndEwyK3pmSW1GM1NPSjZuRVJRSmFLb2ZtWlRncmFJ?=
 =?utf-8?B?REJlTng2UFd5d1NpMmNXVmZMbmVXaUNuc3VCSkJnN1BHZURETW4xQWpDSkFT?=
 =?utf-8?B?L2NmYUxFRStZUnlJRGY3bHU3ZzEzSUhJcU4zVjFBaHNjRnJsSVNOOXI3c1hH?=
 =?utf-8?B?b2plUXZFNVUrTzdJY3FSYVcrejFuNUQyUHpQd085VU9GNHF5RHdtZ3MvYVVv?=
 =?utf-8?B?bEw3bG5DMEo5bllLQjVkemYwR0R4U3JQQUZlVFVoU1hPR0JncmNwNnRRVVNO?=
 =?utf-8?B?VDdIdHl1RjVKWG9IdzF5SXFpT3hZcHArZkU1WklBTDZmZCs1NDRCbVdpUFl1?=
 =?utf-8?B?UytodnJpaThNbHVCOXR6WlF6WGt6UWNXNFRQRjBoanR0R3lKdVJXK1hqU2lE?=
 =?utf-8?B?L0dnYVl0cHZQVDFVOU95S3B2T2t4MC9CbmF4MExvRFM0WWNUcEM3KzdKWnBJ?=
 =?utf-8?B?UmpaY3piTis3UHBVWHVGU1NEbXpKZDBBL3JEMWxhTWl5Z2MrTTF2ajNTcTds?=
 =?utf-8?B?MG1TNmI3aDdiZmFnYjd5MTY2MVlib0VvNDU5RHBsbE02Rnd4RFRYbTNyN25n?=
 =?utf-8?B?aFhvZ1NDVFNpMzBXb2x0aTVIM2VFcjJiOFJDTUVvS0NOVjRNQVk4eXZOMi9Q?=
 =?utf-8?B?MmtydUNwZzRTYVliL1krVHlpNzVDSzJ0eWdmQjVrdDlJUVhxdk51TjNSMGRa?=
 =?utf-8?B?eHZCcnNib2J3YXFQTlpIVVp0MTgxcnBoY21RNUVoZmY3M2Z3VVVmTkVzZWUw?=
 =?utf-8?B?UGpZcjZ1OW5ROVR2L2dseUI2SXFoZTl4eUUxemdraVFGanpTWGFnMjM4MTJH?=
 =?utf-8?B?WGJjbmc5S29JWkFrcTFxZ08rbTZ3NUI0cUJhTXVMRmlOVlZNM1VjWldYbERt?=
 =?utf-8?B?MzlPbDAwMDRGTWlVS3FYNHVjZzQ0RkhaL0FtMy9kYXlHOGlTeks1eVJCb05k?=
 =?utf-8?B?MUZBQlduM2d1Y0pHNDRPUTFFUDdwbkxzb3ZTQ1JOYzc1SVYzTUxtNTZob2NN?=
 =?utf-8?B?ZHdqSzJxSWFraTJaUzVucVBhaHRLYnoxbjIySU52QzE1d015bTEwV1BCVk5y?=
 =?utf-8?B?S3UzQmxFbm9WSEs0WThNOCtvT0VZNHVBUVE1L2I2a3RRekdnSVZ6WE8yeEFJ?=
 =?utf-8?B?SFNsS1h1Ui9SbU1uOE84b0lQRmxIQlJTU0tqMUtIRkZ4SlVqVTNUZElyNHVF?=
 =?utf-8?B?YnlRenJFNlJvdHhGVG4rOWtGTzZaMjlEMjNEQ3N6b0laYVdNaTc4a0paVlU0?=
 =?utf-8?B?RC9PZk8xOXFCbnRiNEpRZjV3aXdoWGdBUXpSaVczNjBUcmlmN1VSR0M1NWlY?=
 =?utf-8?B?Qm40Qm5qQUNCR3RzMWNxcVpwVFpSK1NWVngvaERxNUhrNTNscHdQSi9PckdX?=
 =?utf-8?B?c0hMSHc5NFRCUUE0Y1dXdGZsci9Lc3ZEZkhKNjVxbGdTK2dZRlQ3bjRZSEtY?=
 =?utf-8?B?ZWJneE82TE1DUVBXS3R0M2c4OGZZcVpoVTZTTytjUmNoazlqYVFYUG85NkNJ?=
 =?utf-8?B?RkgyRXdHKyttT0kwL05Pa3IvSklRbjFuOVpYYS9BVnhQVitoVGdIK0IzZ3Nq?=
 =?utf-8?B?T1NmMnJ2Vkc5a3dPdDBLbUlZNXllOWM0NXRDc2FIZk9wK250cG9kckU2UjVz?=
 =?utf-8?B?c2FtMjhJaXpnZHgrVzJTYmVFQ3dBOU5PbVNrRG94UGZzaDlaeGxsRXJxR0tK?=
 =?utf-8?Q?LE4k=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(10070799003)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cTd6ZFVralJYaXMrcHVxRis0dndTWUR3YlhEVHdubTVWS0Zud2liTWJkaXMr?=
 =?utf-8?B?dzZlZDNvbHFpM3hmRVd1OGZ4M2N0YjdYOEpDVHQ1M1haQVFjYkkydFhxVjEr?=
 =?utf-8?B?ZWg2MTZ0V1NndGg2ZEFjWHJTWEx4MUZUcHdxaURteHhzM2NvczYwM1FySjRx?=
 =?utf-8?B?U2RHTUx0TzlCSjNYWVhleENCR3A1RER5aHVsWW95WHNDNXY1MXBFN0FzeHNJ?=
 =?utf-8?B?NjMwMzArQkEzOUdJaXJaVWNkWkw2VmdCSE0vekduaXNOZm5PYnJ0QzRvYUhi?=
 =?utf-8?B?ekxkT0dtQ3lkL05JUW9aUGFQeWpzRHpVbWFGZHk4WWVvNW0wY1ZZQ0x1bE1F?=
 =?utf-8?B?aTNXZTZFVHBWY1NVbEptUTFidUFCclA4Yzl2ckJWY0lXVHBmem9HdWtRMFM0?=
 =?utf-8?B?cm80QTdFdkwrUk9QK21BYjBMeVJpM2JWb1p3bkJEbndKc0ZzSE9SQWFRbnR4?=
 =?utf-8?B?R3ZoYjBXcmJNZE05NHRKMUdyMHIrL0wxNlRjckw0Z2tQOVg2WUp2MTJQZ1dl?=
 =?utf-8?B?d1Vlbk4wR2xjMjBSZCtFMXZUN1cvRkdFa1ZUMldqdWlzWDRFV2MxVzMyVlJG?=
 =?utf-8?B?dnNqWWRLSDU2MHFja3VnUXZZN28ycEJsNHZ1bXF0WEh2aG5VRlZ3bDFIRTk0?=
 =?utf-8?B?QXhOVUdsMzFhS24rc1hyVFpXK00xc3hsNWR6SXE1ZVg1NFVFWkhBT3J6NFZ1?=
 =?utf-8?B?dHczS0FiYWNacDlUZlhsNHUvZkhuSXl4Y3dSb0ZZVG5EajIwcXhOYkN5dnZs?=
 =?utf-8?B?NFV4amZIWngwSW1OQWorcjU5V0ZWUGNFZVVmaXhRd2JmVTM5aDVic28vZFln?=
 =?utf-8?B?UkhvQllCcHdUU1JMMktqY1NScDdCVlNndWRoS0hGVWw4QXl0cXh5bmpocDVF?=
 =?utf-8?B?WjBtQzFnYTZRVDE3RENaSW5oMVZhQ0w2VEticVU3M1RZZGtQdDRaRVpvNzdO?=
 =?utf-8?B?R3Z6TmMxcmdodms2TlVGNE9QTFJLc3lUUzk2ZHdMVTFpRlFrLzBxL1pRYVFa?=
 =?utf-8?B?U0RGMnlqSDVGWldaV092bXIrYTBRazJsQ0N4Sm5GeW1hZG05OVcrMmY0Q1Vu?=
 =?utf-8?B?Lzh4bFdNYVRNcFp2TTMyTVdDQWpFY1RneVVmelJOc1lhZ2djcW43OSs2UStS?=
 =?utf-8?B?QlBZZEVtcjVJZWhUZ2wxRVZCblZyWWFLVHZMaG1JZWFGS2JNMUZJK0FHUTFK?=
 =?utf-8?B?cWZQckszblpQOXRhS0s5QVpBdXF0ZHBxR25BaFBsRGpGNk5hOUtoTjRIRHdB?=
 =?utf-8?B?V2RDS2Y2cFl1SWdsakpYRThOSVNRb0ZVZTE3cVJIbm1zUE5pdTFkd1dpbzcr?=
 =?utf-8?B?L1R3STV4N041aFFPdUx1MFA3cWZueUIvNm5wdG90MVpaMi9tTkQ0R2hiSkRp?=
 =?utf-8?B?eWRiaUJYT2VlOVEwOHlQc1p3ZVUzdkNrZjAwTFpXRTkzaVFqdjkxeDN2TjZJ?=
 =?utf-8?B?SE9oenhLcmd2UDdoamlxQ2dIcHNwQ2hrVWlFaU9HOUY5Z1pOWDZRY0w4VDU3?=
 =?utf-8?B?a1M2QTY2d0lzd3M3VFd0WVp1Q1Zya3U4cVBzVGN6ZDQrQTBCVkFqWTh4ZEVD?=
 =?utf-8?B?YW51eEtzeHZDdTRiOVBmNjJ1bmloazhzaTFyWTVDdzVXMkVDc3dmdXNab1Vs?=
 =?utf-8?B?VjdqbDduMHY2dDJnWUMyYnkxaG1HcXFDb2JtQU1UUXltck5qNlpkYmJkRTVU?=
 =?utf-8?B?bnU0bGhHWmlSbUFWQjdGUGJueFRXMGtyS3dycmRmbWdJZllSQWR3R2dlU251?=
 =?utf-8?B?UVMvQUVpNHpHdjZYblNMQkRIb3VWMzVpUTVMQnFZM2hGQTRSTVZMdHA2TFB3?=
 =?utf-8?B?cjlMUTV1Q3M1YXlPeW9teDl1SWhScXozRHExSkd6TUR3dm1HaWhhVUdpaVlV?=
 =?utf-8?B?YTZiRGl4bXFxYmFQMVNCako2SzlKR0MyUU96bmppYkllU25BcnZqRDFDYXdo?=
 =?utf-8?B?RUxIMENlK01hTnhSV1FRWFh1bVBOZjZxb1Z3ejd1UFVCcXhNWmcybGlMazc5?=
 =?utf-8?B?SzZQd1dzcWFnMTlRYUlsVlpQK2t1L01rUlN3NkFuYTlCL0JtcmdQQVZKN1hV?=
 =?utf-8?B?ZzlXZEt1VnNXdkdYMUl0VVdodXZ2VlZJclduWEQrYU1sdVNNY3pNVnFTWFRk?=
 =?utf-8?B?U1htQXE5MHVBRHhYNGVyOHBZc3VTYmZVTC9BRDdUMEhvSjI4bStlT2VHVWc3?=
 =?utf-8?B?SlQvOFA2NTE1dE8vMFYvT2oyUGNBZVVpekdQaTUvT3Jvd25xTVpDOXE1S1gw?=
 =?utf-8?B?bFg2NGduL1JkMHBxZWE1OGlCd0lxQ29ZdGpUY2RFMWxpWHM2TmUyUXpQa2Fk?=
 =?utf-8?B?TUVReGJHRUgwcXhYemowQ3czNG9OUkFUbEZmVVh6Wmtsd2oweDNaOFVzbnRP?=
 =?utf-8?Q?gEhkZzq6PU+iqwXi2ZOEuOLynw98pBM8TkQHrKjL34Z5V?=
X-MS-Exchange-AntiSpam-MessageData-1: KYwBKq5BDM3f3A==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a65b5290-62be-4b52-dc08-08de6a107448
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 08:26:43.7794 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BH9mDwzYLYrj+kf8Znn/qu2tsokgKqS6IBfvok8vAaOzSdiG9Ka/S18arR46tTvR4XCvR3yqmoCd8b1KDVRvsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8800
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
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,nvidia.com,google.com,gmail.com,ffwll.ch];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,nvidia.com:mid,nvidia.com:email];
	FROM_NEQ_ENVFROM(0.00)[acourbot@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_TLS_LAST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[Nvidia.com:+]
X-Rspamd-Queue-Id: 87DEC12B475
X-Rspamd-Action: no action

These methods are relevant no matter the loading method used, thus move
them to the common `FalconFirmware` trait.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs          | 12 ++++++------
 drivers/gpu/nova-core/firmware/booter.rs | 24 ++++++++++++------------
 drivers/gpu/nova-core/firmware/fwsec.rs  | 24 ++++++++++++------------
 3 files changed, 30 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 5eed48226bd5..7f52b051206a 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -361,12 +361,6 @@ pub(crate) trait FalconDmaLoadable: Deref<Target = DmaObject> {
 
     /// Returns the load parameters for `DMEM`.
     fn dmem_load_params(&self) -> FalconDmaLoadTarget;
-
-    /// Returns the parameters to write into the BROM registers.
-    fn brom_params(&self) -> FalconBromParams;
-
-    /// Returns the start address of the firmware.
-    fn boot_addr(&self) -> u32;
 }
 
 /// Trait for a falcon firmware.
@@ -376,6 +370,12 @@ pub(crate) trait FalconDmaLoadable: Deref<Target = DmaObject> {
 pub(crate) trait FalconFirmware {
     /// Engine on which this firmware is to be loaded.
     type Target: FalconEngine;
+
+    /// Returns the parameters to write into the BROM registers.
+    fn brom_params(&self) -> FalconBromParams;
+
+    /// Returns the start address of the firmware.
+    fn boot_addr(&self) -> u32;
 }
 
 /// Contains the base parameters common to all Falcon instances.
diff --git a/drivers/gpu/nova-core/firmware/booter.rs b/drivers/gpu/nova-core/firmware/booter.rs
index 9e4f90dff8d0..54f67f4cbe87 100644
--- a/drivers/gpu/nova-core/firmware/booter.rs
+++ b/drivers/gpu/nova-core/firmware/booter.rs
@@ -403,6 +403,18 @@ fn imem_ns_load_params(&self) -> Option<FalconDmaLoadTarget> {
     fn dmem_load_params(&self) -> FalconDmaLoadTarget {
         self.dmem_load_target.clone()
     }
+}
+
+impl Deref for BooterFirmware {
+    type Target = DmaObject;
+
+    fn deref(&self) -> &Self::Target {
+        &self.ucode.0
+    }
+}
+
+impl FalconFirmware for BooterFirmware {
+    type Target = Sec2;
 
     fn brom_params(&self) -> FalconBromParams {
         self.brom_params.clone()
@@ -416,15 +428,3 @@ fn boot_addr(&self) -> u32 {
         }
     }
 }
-
-impl Deref for BooterFirmware {
-    type Target = DmaObject;
-
-    fn deref(&self) -> &Self::Target {
-        &self.ucode.0
-    }
-}
-
-impl FalconFirmware for BooterFirmware {
-    type Target = Sec2;
-}
diff --git a/drivers/gpu/nova-core/firmware/fwsec.rs b/drivers/gpu/nova-core/firmware/fwsec.rs
index b98291ec9977..ebea7fed43ba 100644
--- a/drivers/gpu/nova-core/firmware/fwsec.rs
+++ b/drivers/gpu/nova-core/firmware/fwsec.rs
@@ -234,18 +234,6 @@ fn imem_ns_load_params(&self) -> Option<FalconDmaLoadTarget> {
     fn dmem_load_params(&self) -> FalconDmaLoadTarget {
         self.desc.dmem_load_params()
     }
-
-    fn brom_params(&self) -> FalconBromParams {
-        FalconBromParams {
-            pkc_data_offset: self.desc.pkc_data_offset(),
-            engine_id_mask: self.desc.engine_id_mask(),
-            ucode_id: self.desc.ucode_id(),
-        }
-    }
-
-    fn boot_addr(&self) -> u32 {
-        0
-    }
 }
 
 impl Deref for FwsecFirmware {
@@ -258,6 +246,18 @@ fn deref(&self) -> &Self::Target {
 
 impl FalconFirmware for FwsecFirmware {
     type Target = Gsp;
+
+    fn brom_params(&self) -> FalconBromParams {
+        FalconBromParams {
+            pkc_data_offset: self.desc.pkc_data_offset(),
+            engine_id_mask: self.desc.engine_id_mask(),
+            ucode_id: self.desc.ucode_id(),
+        }
+    }
+
+    fn boot_addr(&self) -> u32 {
+        0
+    }
 }
 
 impl FirmwareDmaObject<FwsecFirmware, Unsigned> {

-- 
2.53.0

