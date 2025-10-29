Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91BAEC18ED5
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 09:17:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D139710E721;
	Wed, 29 Oct 2025 08:17:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="XkaRvJGj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012020.outbound.protection.outlook.com [52.101.48.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 740E610E721;
 Wed, 29 Oct 2025 08:17:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fOCi4VVxIbfZbx+dUHkvfkdin0yTKlx3nQrcG4IKsCYSbDQRcKvUN8z3oK8KPRE3IljUSsxw5n9XI+q4nASZV4wv6zkiEcUd1a2aIjI7SnX3Rmkyh/Z+0ACYJ2jCKfTcBuvPjQUwdX0WCXqhqR36GeU29WdPLOkhfdLd4m2i7WbxDy+7dJa7AtiCoieiSN7T9UU/4PcZDHjtO0szxtSb9uCateAcoZf4ZTVLIKE+HU5J8FzdLdU1TF+OuS3/yYYsl08knRrXvEkoaoYnciz2lNHOl0NttZ5ZU6yqDq9iSACzpLxdAo7AAkHLndzjeSIJSn9Z2uXurIZC0dTlFhrj0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZopU0O47h0OWR5iMf9hlvo/bk3MMSbrpyihPPg+bIn0=;
 b=A1gq1yykuiym4YY59aWm5fXeEhuk0s6d+amuFedjfEHWDAOs5n17OQLqgRFaxjk8j3jK9f9k8oRqtxU1+UcZCwCw2c8Gydj8MFKBOSeG+h1ypmN3bkEQ/3s3scqzQbQMuXeK52saSL9t/xeRGAJTuwdW3nMl8fBUtuVw4jAl8ccf2L8R1hb6Dq1HOz7hxtcHQjKRxULVRvWOCtGt9ZjOIDees1rPrfxh0q5P43+pE8t9vIZp9a23GoyiMdmNe3OG3aWmzehrYCfPn0vlQDzLl5JNJgBP0U31mbxmDxRa2nSPJrOkJt0B98OLv9Umyy8O4MBXo8OzDOsehhYTs2lQsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZopU0O47h0OWR5iMf9hlvo/bk3MMSbrpyihPPg+bIn0=;
 b=XkaRvJGjS99rPs6o9wqoJb5CP3mxgq7OknXtUPkES6Wkvvt9tgw6zTa6o0dtWrN1r2U6I2aW1UvJfU8P+ohbFQKJtV6E9aIdcS7fbKR4PM17gSqoQNQsI6mfLXQQ6yoJYuDRdMr9jAsl0ooizZ8Ajwmb9iOGfYCbRaNSDyV44PPTo4SJGeV+FFQR0FeziUUW3Lzk9wNttegQeGVp9CbJIMWJZIT0/UpCIFRhm+DLsF+RCVbstsOFifz4AoUuePk2JYjqN1Lsa3VjjKhfv3QL0Tt7ocu4hF/cfg4ZSPFhBzN3HOx1ajNyn6PGbBOKVUPi57Yj9G1StegrPa7muWDRzg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3997.namprd12.prod.outlook.com (2603:10b6:208:161::11)
 by SA3PR12MB8438.namprd12.prod.outlook.com (2603:10b6:806:2f6::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Wed, 29 Oct
 2025 08:17:17 +0000
Received: from MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::d161:329:fdd3:e316]) by MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::d161:329:fdd3:e316%4]) with mapi id 15.20.9275.011; Wed, 29 Oct 2025
 08:17:17 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Wed, 29 Oct 2025 17:16:29 +0900
Subject: [PATCH v7 02/14] gpu: nova-core: Set correct DMA mask
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-gsp_boot-v7-2-34227afad347@nvidia.com>
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
 rust-for-linux@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: OS7PR01CA0313.jpnprd01.prod.outlook.com
 (2603:1096:604:26f::16) To BY5PR12MB3986.namprd12.prod.outlook.com
 (2603:10b6:a03:195::27)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3997:EE_|SA3PR12MB8438:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e708f09-b5a4-4d84-642f-08de16c39277
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|7416014|376014|366016|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b05PeXA3K24rcFF1dDIzQjRhYjB1OFU4d1JIRjVMR2NYcUxxVnBsZDJxUWR4?=
 =?utf-8?B?QUVuVnZsamcvMDJVT2JjUTBBdXA0UzJTNmxCVjNnRU1tVXZqdmtReWl4U2hJ?=
 =?utf-8?B?KzRpNkRoQ2lSWXF6cWVRNjd3dGtTclJ6R1ZQaGJMQ1hBNUYwd3ZqbG5ZVkZW?=
 =?utf-8?B?MGpQVTZRanI4ZW8vM0lxT1F1Z1RwNjI0Y0NBYTlPNlJ2SENxY1JNK3RxakN4?=
 =?utf-8?B?ejJxaEJsV29VR251TW42KzJIc2hLZGJla3doei9Gc3VQZkpWZVJwVlFiT0U5?=
 =?utf-8?B?NkNlRU1rbFI5anBrcWVtcitPTGhCZGhOQXNEdk05elVGZEVRbXRmZzgvakRo?=
 =?utf-8?B?d0l5cTJaa1RKTVREdmJKclNXenVYNjlsWU9VbGZMb3A2cnlKbzdjL29SZ21L?=
 =?utf-8?B?SFVDNTgxWFVTZzNoNnJKSXZTanl2STV1bmdvWFd4QlkvWlJ3Nno5OHJia0lU?=
 =?utf-8?B?MzhaV3dJYitwRDFlL0tkSEE4ZFpWb2lvay9pb2J5UmlFZlhVYk5yQWh6VjRn?=
 =?utf-8?B?STJqOW5vTllKNEJzbmx2cytBaWVIUE10R0hqYnBoM3JTWTZiMWlTenlDQWNQ?=
 =?utf-8?B?QWlwcVpJazQ2bTBSaUx2TVlrckxpaWJwZFdqY0ZJYVZzQXZPOTFNSHd2WlJP?=
 =?utf-8?B?SXN3WTRZUndnbm5jUzFrOGZrb3Z2Z1hyTWx3RE02ZnhjV2lQYUtPeGkyOUUy?=
 =?utf-8?B?YnM0V2xaaVBlR2NZUTVKbVNnOThhWFZTdWRzbWtGcDR5dTIrY1hTMjZTb2ty?=
 =?utf-8?B?K1B0SXVuY2R1RysrY0drK0JENWYyd1p5Wlc1VnIydGhaSXVNbnZmS1NRZ3NC?=
 =?utf-8?B?WWJDMjU5aW1valpYT3VjSmlNTk5jekNhS0FQUGFaaUpZRG9wcGwrM3IrMDhG?=
 =?utf-8?B?VlltV3d1cnovcW9uei9EZ1lMU2Z2WGQ5eit2ZUg2VElOK20wcWkwaVJRTm5M?=
 =?utf-8?B?Wi9SNzg0Z2hZdTkxc0FpRERndjRDUVlkL3FzY05mcWJKWkhYRS9Kc1RaOTBt?=
 =?utf-8?B?em5peWNTQWlVRXBBR052ekZRRXhaai92ZzdFWDg5K2V4dXZrWEVaRGlhcS9a?=
 =?utf-8?B?MDFPWS9JcWlQK3VQWStqV21HNzhidGtpdGJxb090UUpHa3dPOWhoQTBmbFNC?=
 =?utf-8?B?dzRFOGFvTm8xM1BNWW1KekUxbDZuKzdFUStQUTFyQjlueng0cHpud3AyOVFJ?=
 =?utf-8?B?Y0R0T0Y1WW0relRETXRtdTJZajQ0TTY4QkhOL0UvSjVLY1pCaVVUMmhSaSt5?=
 =?utf-8?B?SWh1dm5YMURoYkdzdUg0SnkwNTJXUDFoUlJVLzA1NTZmNjdjZEJBOUx2UytM?=
 =?utf-8?B?VzN0dTgybjdiZW5UV2VhVC9ranNZZEMrUWRjektocXJMbHpWNW9FM3B5UVg1?=
 =?utf-8?B?bHNQYVlaclFGbjFnbnU4c2FrZWlWNy92ai9XMHdBUWlpZ1k0WWFLeG1mdzA3?=
 =?utf-8?B?VldWdEhZc3llS1hLeGdjRHRPa2J5NFJ4dGpsSDRzSmE1Y1ZnaTU2WXFCWXly?=
 =?utf-8?B?U0JmcEMwMitDRnliNTBTYmpzYmk1ZGkyZHpVRm42ZzlLdFF0L1FLajArTVdS?=
 =?utf-8?B?eEQrc0lSeGlTY044V1RnYUI0VHNLNnIvekZYODZDM3EwY0J3TXVnRk82Zklk?=
 =?utf-8?B?dWIzVVNrS2JjOEdDODV2NHhnZzRya2lHbFMyUi9Ed3llZm1nU2dmT2ZNZXRH?=
 =?utf-8?B?NlgzanNLQ3pjdTNVTHFFbFNwVmhDZlpQQkptaURuZDZhR05pVWkrR1lianVQ?=
 =?utf-8?B?WkVWemN2SUlmYUhjLzh2bTUxRnpOM1ZUOU8rTHJoWEJadUZDNGgvdDVHQnI5?=
 =?utf-8?B?YWg3cU81Z0cyRU9LWnBhUUE2SlgxT3A1dHZhbnU0RTFMVStlZStvQ0ZrRi90?=
 =?utf-8?B?dE5XRG5RTExUOFdjQkZXZ2JyclZMT3NVYitzNHVOTVRIQ2JLVnRkWUNpanZi?=
 =?utf-8?B?N09XZWtsS0JRM0MrYkRhRGFvM1QyVTdKNHVCNFhkdXl5VytCT2FscFRscWVO?=
 =?utf-8?Q?tIuF8KE72UQC85tIZ6cPW4zVA3+yqM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3997.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(7416014)(376014)(366016)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MFIzank3NTRXMGdkdUhYd2JxK2N2bURLaXZlRFlqVG9pUjRqdlRHd2hxZ0J4?=
 =?utf-8?B?R3g4dE9kdlAyVnFaUDlDTDY1bVk4RTZONE9xT04zVU42UFlYTzhvRFBhaTVa?=
 =?utf-8?B?ZThqN0NidXNucHJpNTVyZFB4MmdOQkQ0UGJFZGJBTkVLZjVnaVNaMHBDNHpW?=
 =?utf-8?B?bGZseHhmNnRCTmtvR1lzRHFZOVMzRVdZTGlIMlhsM3pIRDF6TWZpSWtsdnlN?=
 =?utf-8?B?aFVrcjdaU0ZjSmxDZ21oeHJDdjR5NjhSVzBPYld5d0Q5YjNEM0xQYk1FdGY5?=
 =?utf-8?B?Q2VDcHh5UnNldWYyKzJtamNyaE9jRUVlOHFuSG42aGdzL0UwSEVsb0tuaG9T?=
 =?utf-8?B?dGRKN2hYbmZQak12VytVODRSK25yNGl3SENiWDNqcE5Zc1c5Z3pVQUtPWHJj?=
 =?utf-8?B?TmUzbk01bDArajJIVW0zb2Z1emRtd3Y5VWdaRVR5MUJQVkVBVEhyL0xLL2Qw?=
 =?utf-8?B?bG5WUnZuN2MrZS9SbmFDVzBkaE5DMmJNcVBobHZaWlQ5UDJvb0lBOVdWcS81?=
 =?utf-8?B?SVMydGJGRm1WNGlreFJXOU1jNnVONWZHTTJNN01iRnNSK1g1emhsZU04Vy9l?=
 =?utf-8?B?bzk1ZFpRdU9GaXVSVlhoWHl3RzJRV1pPUnBLOXJab2U2Q0ZpOWtQTWFwU2NP?=
 =?utf-8?B?ZGdBOGIzbGpGdVhQNWlPdjVldDhFUXZLQVZ0SVhlNzNsQWtncmRJd3NBTXox?=
 =?utf-8?B?ZTNnOUxsSE1GQmpxRksrdi95RmNLMTNhVTNTSXJqM3FDWDRKVUNxdTY4Y0hP?=
 =?utf-8?B?a29aRW5kUExTKzMweVU2MWpMUlQ1MmNsSHNlYjR2Nk1qN1lpQnpLUU9tNmVN?=
 =?utf-8?B?aTZXZEErZTNQbGZkZXcxS0FKRWhnaFFZVXE3bUxzNkR2UnYvaGpuVUJ3STEv?=
 =?utf-8?B?N1BKQTJIaU10clUrTmxTbUdnbnBxeXkrT29GVXhiQ2cvZmo3RGhPRy9sSkpp?=
 =?utf-8?B?elVYNXBiMnRPNmtyVzVxeXVpa1pPRXQ1elFQLzN4Z3JCRjg0VjM5SUg2UWxj?=
 =?utf-8?B?bDFlRDJ3OW9JZ2VqVUxpUW5DeTlWTTdTdDVkM1F2anB0Rk1pN2EwKzZTOTEz?=
 =?utf-8?B?RnptWGZBWHRPck8waEtvdmN5QnVUd0RPVlFkOG4zZDdkMlNSL3pDVlZtUEFx?=
 =?utf-8?B?eFF4YmcxZ0g4a0I5M3AvSWovOVNNdWVzVmFaSEh6L2p1bkdIdEFaS29NL3Nr?=
 =?utf-8?B?TXhFanNqNGE1YXJWM2xvcE43amwyazdNTXVwZlFobHdPbGZLV2k0N0VYdFJF?=
 =?utf-8?B?cFVlU1FzK1krY1B3T2FaUGx3c29DUUt0VHNodmYxT0QyYmI0a0U4Vk16Rkly?=
 =?utf-8?B?SzdnUitGRXR3OXF3MTFEZmwySy9qR3poNlRXWno4UHk5OWhFd0FwSXNGbnl0?=
 =?utf-8?B?Mm9XOUNJTWxrNEIzQ2liWXUzbTBrcHUyaVhTNTI3OVo3QlA0WG1HakFVcUF3?=
 =?utf-8?B?YXpmV3VqU1Yzem1TQ0loSEk2bXptNnlBNzdKbEJ5VUVDV0hPR21aT0tMRjJB?=
 =?utf-8?B?NDExMlF3d0F3anpSVDl1cDFMRmdjcEx1aFVKdy83OTJkNkltTmZUYkkxdjNk?=
 =?utf-8?B?U2ZhdlNUOEM5OUZWOGY3VGZaTXhoeGZJNGNzSUEyYW5mQjNlL1o2Zk9GZTZS?=
 =?utf-8?B?RmlJaUxLVU5zQUM3MVFucWNxNjhsYWVmVVhkL29mV3ByemkxZWN1RWdJZnBZ?=
 =?utf-8?B?WWFBSW5acDVEL09SSkE5bHJBUU5jdExyZ2F0d0Y1SytsYUhTUE5zK1ZVbFlY?=
 =?utf-8?B?NGtaam1jOVRWck84ZU4rSStCZFRraVVPY2Z1TjNRRWJpYzFMZCtLR3ZKTTF3?=
 =?utf-8?B?L3owTzl6Q0IwZVNNaTFjMGdjVWRCWVF1azNFMEtlU0gxUjFPdk5MK1pCckhs?=
 =?utf-8?B?YUhhcDlaem9IUU5jZFl2NStETzB4M3lYRG5VWE95Yzh6UlB6NHRabmhuKy9X?=
 =?utf-8?B?VmtIUUxuc00yL085M2pjakdCVm95WVVjUHNtWGwwUVdHbWRFUVlLMFltdVV4?=
 =?utf-8?B?Z3JIVkRuWHpwZjVpRUo4Y20wVS95dysvSE42Z29zalBwdGtwM29mMmV2ZnBj?=
 =?utf-8?B?ZHlvK3VxZlV0N1pSQXN2bTFzU09BeEFRVFZrSldsTVg0bnQ2cnVCRmpqTDNx?=
 =?utf-8?B?VURQWTlpR1hzdHpTT0ZCdFZGelBxRW42WWhrVEI0U0theVQ4ai85RkdVcHM0?=
 =?utf-8?Q?BWVOHNG8pRWTQHQ2CUpkq0MdrqAUn9y8vCtbiIFaMSNy?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e708f09-b5a4-4d84-642f-08de16c39277
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB3986.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 08:17:17.4906 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H/nKKm25chs6cRwbdmEEbMdjf4JMxP1gpgZVpMsL4+PxNLN3ezgfdX+YyWYqgls6G9KIkUsIuZiTrWiLx6W2Gg==
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

From: Alistair Popple <apopple@nvidia.com>

Set the correct DMA mask. Without this DMA will fail on some setups.

Signed-off-by: Alistair Popple <apopple@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/driver.rs | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/gpu/nova-core/driver.rs b/drivers/gpu/nova-core/driver.rs
index edc72052e27a..2407d0ab15e2 100644
--- a/drivers/gpu/nova-core/driver.rs
+++ b/drivers/gpu/nova-core/driver.rs
@@ -3,6 +3,8 @@
 use kernel::{
     auxiliary, c_str,
     device::Core,
+    dma::Device,
+    dma::DmaMask,
     pci,
     pci::{Class, ClassMask, Vendor},
     prelude::*,
@@ -20,6 +22,15 @@ pub(crate) struct NovaCore {
 }
 
 const BAR0_SIZE: usize = SZ_16M;
+
+// For now we only support Ampere which can use up to 47-bit DMA addresses.
+//
+// TODO: Add an abstraction for this to support newer GPUs which may support
+// larger DMA addresses. Limiting these GPUs to smaller address widths won't
+// have any adverse affects, unless installed on systems which require larger
+// DMA addresses. These systems should be quite rare.
+const GPU_DMA_BITS: u32 = 47;
+
 pub(crate) type Bar0 = pci::Bar<BAR0_SIZE>;
 
 kernel::pci_device_table!(
@@ -57,6 +68,11 @@ fn probe(pdev: &pci::Device<Core>, _info: &Self::IdInfo) -> Result<Pin<KBox<Self
         pdev.enable_device_mem()?;
         pdev.set_master();
 
+        // SAFETY: No concurrent DMA allocations or mappings can be made because
+        // the device is still being probed and therefore isn't being used by
+        // other threads of execution.
+        unsafe { pdev.dma_set_mask_and_coherent(DmaMask::new::<GPU_DMA_BITS>())? };
+
         let devres_bar = Arc::pin_init(
             pdev.iomap_region_sized::<BAR0_SIZE>(0, c_str!("nova-core/bar0")),
             GFP_KERNEL,

-- 
2.51.0

