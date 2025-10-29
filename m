Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F24AC18F05
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 09:17:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 504B110E72E;
	Wed, 29 Oct 2025 08:17:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="lHrbpvgd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010027.outbound.protection.outlook.com [52.101.46.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B1F710E723;
 Wed, 29 Oct 2025 08:17:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oJubIf6h/YPb9CN2wewfIYe9d+WlRmmuodQQkHSdCFMHC3HEj7T5Xq9RD5wscK/mYHMB9GEYtt6K+8zAkDZgNBFGb0+J9UaTTGY6KLHNxOV92++162Ocz2KtfYarCyd+71GGgsDayBZRSgfaXLutOKhVoCitjZYWa5dXU9dB2AfMHrkkQigStLA8hToP6vWLI2umdTkTDVHWtsImMvvmFHADSLSYbOd18Jc7CbZn9OYc/LC5qNJDABYqJJVFZzv3SCy8/3eCfukb4m7ZD8vmw1b+lqCmQKq7VyMMd/zH2FTUBxfL4xU8prbas2IJ4v7T8Ygd6SbXZjENTlsooQXWew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d/Pgy6SytsAqflIxIjcZBIRRgAvomX+6tbxazyIA0ic=;
 b=DH2naWis8kFNAaxWFsn8Lsuh57PLsGDaVpMnfOk9RXPQdpXYX0uayNQmwZcd6PJEyFGyO0gZ94E4cI7K8yPokua6v6YyAlwlDOaUZiuu3hIv+hUAMoDK0Ip/GgsrF7BYW0P1mJGGtGM+Z5lK/2tkT+zLTM7zW9IeYepJKsDwVsY/Is1nm6HoZ7oHsScqZhago97Yb+j5vRP6EKEQlyIE+yGi6R2J3wpxFVLjOnv+seceryqU0cYBYlJ/X1f63dQ6VAep4ljUCW8sJECQuVzN+w/efm86eo7B05NCAs3H8LH/F8vMG3l/jhvzsoUi9KkzUr6bf8mErg90u9YAjVX3dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d/Pgy6SytsAqflIxIjcZBIRRgAvomX+6tbxazyIA0ic=;
 b=lHrbpvgdWseImqZY7thvzNg0mig/sPXiaaj1xb9XFhf9Y+Zpv/AMNnj/zJsRN/w166+PW4oM91I8lsVXnBRt2COtrtLmZpEgfNLxkTY96ROu8mJ7s3zMJCIP3UmvcbDtcCnqCL2vpr3ZnXt+dmYWYmRzYVEvi5E6fX/q4tV8bv6oDeFguSvDCs7ye1K/am9hFwBiYPZy9rNXPjhPVpRRugFPiJYvixefH+4T5vciBo/FfUwW0b+Eyr9Bd9h/IDPMbsNK9uIBDTN0k31OjulzQ42AkdHGkkeZECH0MM8yzmAXEVIJnXokbSDm5+rUcRHRFW9QEEz93B/JH9m02MUXGQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3997.namprd12.prod.outlook.com (2603:10b6:208:161::11)
 by SA3PR12MB8438.namprd12.prod.outlook.com (2603:10b6:806:2f6::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Wed, 29 Oct
 2025 08:17:39 +0000
Received: from MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::d161:329:fdd3:e316]) by MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::d161:329:fdd3:e316%4]) with mapi id 15.20.9275.011; Wed, 29 Oct 2025
 08:17:39 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Wed, 29 Oct 2025 17:16:33 +0900
Subject: [PATCH v7 06/14] gpu: nova-core: Add a slice-buffer (sbuffer)
 datastructure
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-gsp_boot-v7-6-34227afad347@nvidia.com>
References: <20251029-gsp_boot-v7-0-34227afad347@nvidia.com>
In-Reply-To: <20251029-gsp_boot-v7-0-34227afad347@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, 
 Lyude Paul <lyude@redhat.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCPR01CA0174.jpnprd01.prod.outlook.com
 (2603:1096:400:2b2::13) To MN2PR12MB3997.namprd12.prod.outlook.com
 (2603:10b6:208:161::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3997:EE_|SA3PR12MB8438:EE_
X-MS-Office365-Filtering-Correlation-Id: 5395cf1d-23cd-4575-be53-08de16c3a02c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|7416014|376014|366016|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SEcwMXo0WTdzUkRQdno0c3F2WllrS0V2dDhJMU9WTmhkMy9Zd3V2c2pDU2FE?=
 =?utf-8?B?YWVnL0FlcDhTTHM5YkZiZFQ5SHp2UndiZkJnU0JpOXFXWS91a01CUEZQd3pV?=
 =?utf-8?B?ajg0Q04vUkZwVzNFVkxMc2xoQUZGNmZxaUJzV3N1N0pXdVFNT1BIaHJpMDls?=
 =?utf-8?B?VDJkdG9VOVZ2VUxUeHV6VU96bnBLcXlCd1BOYXVuRmtRSnFuMkpveUdiNlRS?=
 =?utf-8?B?eklDbUh4aEZQV01WTkRoS1JNTGxxdkozT1hObENlWmRHZ1lVQ1ZVRWFqUU1B?=
 =?utf-8?B?RTFjaHE5VmN3TDJyNmVUWmpNcVp6VytFR3hmS1EvNzVwTTZYd1BVdW5UNFp2?=
 =?utf-8?B?ekdjTGJBVFIvZ0s4anlqV0s0Z1doL2lKdVFoNkVzVXN1K2Y0VlpYa3QvRVEy?=
 =?utf-8?B?L0ZBT3hGWGltMXMzbWo1bkFDaWdmWGMrMXZvVE5DUmlua2xhVGJ4dU5kWTE0?=
 =?utf-8?B?ZndsMitZQTJBeGFLTlpKMkJIWVExNzE0b3UxLzUyYWd0VDkvbGRDUU5GSTVM?=
 =?utf-8?B?SkYrV2Q3UlJCZzF1Z3FaeUpwU1QzaHh0dGwyb29VZlB3VkpKeHFHdmdlclIw?=
 =?utf-8?B?QS9Nb0drTVU1aHdQTGZHWG1xUzF4ZWxjeXlHZDR4Sk5jVjV2ekpBaytGSkIx?=
 =?utf-8?B?Z3lRMzFMallxZ1M1Y0hRRitUVUV5SjVxYWdYdzhla2M2MWVUYk04cnJ1bGNz?=
 =?utf-8?B?dVJXaHRGbVYxOExiZFI1Z1g3T3VTN0dUa21WVHhRRUJEZXRlcDYxcVYvSG11?=
 =?utf-8?B?OFpYUjd3d3pEVnRvWmY4RGE5Y1hnMGZqVWZnRlErVWhFMVhHV1I3RkJRQUlR?=
 =?utf-8?B?aVB5ZWJ0eUxhaUxzbmpHeVc0cjFxQjN5UUhsd2pqTVNKVGp4WUhEdk44bEtT?=
 =?utf-8?B?aVMvV0FENFZsb09kTnJvaEh3Vi9ndjBzTnZEeWRiRFYvUi9uVEpWbEZJN1E3?=
 =?utf-8?B?aTJ4OXFnTlRqMGIza2pFMy9kVHF2TC8vS21WclZGREdNZTl1MThkOTV1UjZx?=
 =?utf-8?B?Y2lrUDMzSFVlNUZHYzU0aDNqNHQ3MW5kekp0RndXUEswQVE4T0xGc25GK1o5?=
 =?utf-8?B?S3FoVDNFUWw4Z0FmQ0JTVThDSm55OFc0UDV4VklGT1pnRXlsMzBjZXp1ZmQx?=
 =?utf-8?B?cERSSjlOTDdjNHZkT3AyaE8xajBHMFJnQ2ZObUFFQ1hmUVYvb2VoOGx2QlVP?=
 =?utf-8?B?K0JkRE04VnNCaUhuek1BRE1BbEFVM3ZMUlRZSmpzbE1BeWVUd0FWNWJvankx?=
 =?utf-8?B?Z0tkTXlIUjdYYktzaHk4c2FWb1VyZHBDb2NVSk5HRzg3UlZTejM3TWNPL2p5?=
 =?utf-8?B?T0xTNnRvZGhTK0lzZE8vTzRZd0R1dFU5NTN1QUcyY0JyYjBxaXF3UGhXN1V3?=
 =?utf-8?B?Snh3dW5ZNm9odXFxQ2Y0VmxPbit0N3dLdDVrTWtiaTNjc1pMcHcyNnNuVjE0?=
 =?utf-8?B?ZS9ZWS9ydVh2Vzc5ZVpmb0pVc3lKVDRVczlkajh5bEw0UmExNVpVS3pWYy9x?=
 =?utf-8?B?YjdodlBTTFFnWXU0ak9Mdmloa2wvQm5JM2lTcGZiNlViZmhodzU5QVVwQVJE?=
 =?utf-8?B?SmcvUzNUaC9aVWR5L2N2SExqd01ucnI1Vk5WT0t2MXJGUklrWXRPU3J1cE5z?=
 =?utf-8?B?ZExCSGhNSFlDeGk1bFNrWDRQZVAyaWs1VDRzbkdkTTBRQmNjcmxVNnlQWWVj?=
 =?utf-8?B?YXpYUmI3TlZ6T2s0VnljYXpsMm5wWndreS94dzdBZmtNTEVWZkZESElWeHJ1?=
 =?utf-8?B?dUhTL3ArUDQrVk56bStmaGczdTA3bGhkNlJ1eVFMdVBTU3ZUWklpbGpOMlRx?=
 =?utf-8?B?dUpGbmVjUytMQzlENlZ0ejlXUnZjSHN4eGdhcFF0dHppN0tYZTZNSk14MjBI?=
 =?utf-8?B?Q0F0SDJtL1cwVGV2blRxT0NvT3RQYWJXbUFPRVFMYWtHZDliZGtwRGFnWVVo?=
 =?utf-8?B?Z244TU5EYTBRcWdyMHIvWUlvSlV2cmZvV0V3emhvQ2FweldWbTc3OENxWUVD?=
 =?utf-8?Q?E9U789qV7zM+vzeo2L+8uEq4bZkYoU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3997.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(7416014)(376014)(366016)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RFN5ZUpBYzBQRFBrRzhPbStnaU9CV09RMHB0VnNJMFJBM2JIN0ZsWExwRWg0?=
 =?utf-8?B?aTVnYUJFdXFVallVMHR6dHpjS1REcDFUNFI2VFF4VHcydEoxQlQ1NmRlYm1r?=
 =?utf-8?B?cjdNdjRwVjBEWXBQL3hCUFpDQVpOcjB0MFlaYmdaeHJtM0VWUy9nazVkYlh0?=
 =?utf-8?B?eUxVRWZCclZtTW1tdnNzSjJKNmQ2Q0QwS3VUSUtQamV5WGhZbWdhV1lKb3Zl?=
 =?utf-8?B?eG5vUFYrY3QwSnNsZldrclF2R3VYY3Nmb0lpQmJBcDVETFdaVjZBL25tV2h1?=
 =?utf-8?B?d0hiak45Tkkzd2NPREZ1QWcxVTh1RXM2TE5ObkNxUy9uTnhWNnZLaTN4ZExM?=
 =?utf-8?B?L3BPOHF4dm1qTnNIeHZqS0IvZ3BVU1UrdDlvSzU1Vkp6UndnYlJySTd3Um9M?=
 =?utf-8?B?dkJmZVRkYkNGWW9RdGdmbTBkMHozSGFsanlTRWE1SUpQVDZsdTJaUGpMR3dk?=
 =?utf-8?B?YzJFMDl3SDhGOGx5aWZLRG1rVS9RZ2hLWnlOSlhhSUJMRE9FR1dXZEhmenlH?=
 =?utf-8?B?blpoVzFMMCtEbDhvbWFqLy9vd0drZGJBUGorTnpZTFNQblI4N3dQZ2svTWV0?=
 =?utf-8?B?Z2lUemJTUnJ1WGtrVW5jdlpiZ3JiZlBFdVcvT2dFcCtaZ3BrcTJiRlFscGQ2?=
 =?utf-8?B?dXlIbDBvRUVxT01qQXJZQTVPM1N2d3o3a1BBV0wzeGhwTjV6TW53ZkhMaitR?=
 =?utf-8?B?dTVoZVIzSFNpbUx5dlZSWWVtVmVYVGZzeTF0WlN6QjE2R3NrcGYwY2JpcnRX?=
 =?utf-8?B?K09XdXo2OGtkZDUyNCswYWZuTTlFdk1scDlRVE5mSVFrRGxRWTB4Tkw3WEJt?=
 =?utf-8?B?Sy93THRPaUMwUlpDN3QwSW9XcmE3V3grVm44YWkzRm84MDZ0Tnd4dVhpckhp?=
 =?utf-8?B?VEFuQWE4OVFCMldoOWk3UGcvU21YYS9neWUxeVkwME8xSkFRODhzV216empo?=
 =?utf-8?B?RnFMVEFyWm9vVnRvRzk5U1M0bnNSNE16dWxkbXVGak1jT0JkOUZCN0VvRURC?=
 =?utf-8?B?alhkd1F3S2krbS9sYXBzY2ZRQWZoYUhsWExPVmpnTjcyNWJBNTBhUnpSUkZJ?=
 =?utf-8?B?MWVMaXYxRThIelVqMUtqd2lvSHROTjhodXdSb3pBbndsZFRHMHdIREFNQ3JT?=
 =?utf-8?B?ZGdZNEx6c2dTeEF1M1MwYkRaN1NLOEVGb3FPQ0YxNi82TWFKNzFzMm5jaDNw?=
 =?utf-8?B?RVZtUGZTeEtSSEswMVRPVnFZZ25mQzVmOUYwZEEvSndYMzhsc0hjdEhONGJV?=
 =?utf-8?B?cldvZ0l0cVlvL0RwL1NmQkUzazVsSnpvNTN5R3JhQWhWWk1LakhSWkZQeTR1?=
 =?utf-8?B?eUxtR2RXUlU5d2RNMloxS2x2Wk5pWGVVU21xb2FwZ1JoWTdTcnBiSlpUeU1C?=
 =?utf-8?B?OFZ3MlZWeWE3c3hvSGd3YUpjZnI5Rk5taklzbVdRWWlCbUZQbG9zQVcxSUY0?=
 =?utf-8?B?aWdVcCswV0x2QWwxeUY0UTFjWDIreUpzdXdEZTZGU01MMVpVSDV5clVTUUc2?=
 =?utf-8?B?YVd5SUZxUmVpN2RjZGlZVnRXQmMyRld2bVBEcHNHSVZGSGtDNitPVDNyRVg0?=
 =?utf-8?B?STJnUWZGYnVQRkZWY2ptaGt5MjBWQlppWFdtbjNTL1A5Q1lvMkhrQ0NrTFp5?=
 =?utf-8?B?TzNPOWhoTUdoWlBhdDdveVlsb2hZZ08xZnRtZkpLL3VpUCszMHF1Unc3OGNn?=
 =?utf-8?B?QWV1OEh3M2xjc3hScWFoaHpJT0J5ZVg5aHpqdkh1TE55NU54SUo5QThUUGMz?=
 =?utf-8?B?a2lFVzd5eTFDZ0FPemhnU1NUR0ZOWG9BVVBla2RELzNneXdVd2JnbGxRMk00?=
 =?utf-8?B?SmpoYlNnTFRpbzVrUGV6OXp0ZVpuMURxcXl5SHNNVHdTOTQ5SUZhU3lZR2FD?=
 =?utf-8?B?VXJLU21Mdy8xM28wTC9uSU1pVld6OHdZazhPQ2FIN3pnVVBUb01HQ00zSTdz?=
 =?utf-8?B?RW42Um1odnhsbTJHRzdaZlhnY2xXUThyWnFIc0ZOdGVGOUFqaGptNXRDL00z?=
 =?utf-8?B?Qmd2MWVjbk85ZWhCQ2RqdWxZejQrMFQwd3RjcjVyT2F1THpheWdWTWtURUVE?=
 =?utf-8?B?bTAybm5hTWlzRlF4VTRxZ3BGdEVVNWEyWmRQb0JoRWMwVEtPaEdGdmtsd0h3?=
 =?utf-8?B?a251VW1SQ3pwSm5penlPd2IvNkI2SXJZRGwrcjVHSllTazFIYW1GWmFYNTlp?=
 =?utf-8?Q?+xoTheRq/ginK+7DzAlxJw0qoL7XkB18++lAEecSPqJL?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5395cf1d-23cd-4575-be53-08de16c3a02c
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3997.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 08:17:39.7668 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dtLfgKDlWJi7Sd59f6BOjD60VyHWQ5yq8BISp5rJ816feFbtV+4dmmZiZtVCDcWyDLxDOfeoJ0OsliDzAtn22w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8438
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

An internal conversion of gsp.rs to use this resulted in a nice -ve delta:
gsp.rs: 37 insertions(+), 99 deletions(-)

Reviewed-by: Lyude Paul <lyude@redhat.com>
Co-developed-by: Alistair Popple <apopple@nvidia.com>
Signed-off-by: Alistair Popple <apopple@nvidia.com>
Co-developed-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/nova_core.rs |   1 +
 drivers/gpu/nova-core/sbuffer.rs   | 225 +++++++++++++++++++++++++++++++++++++
 2 files changed, 226 insertions(+)

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
index 000000000000..39c973ee3e10
--- /dev/null
+++ b/drivers/gpu/nova-core/sbuffer.rs
@@ -0,0 +1,225 @@
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
2.51.0

