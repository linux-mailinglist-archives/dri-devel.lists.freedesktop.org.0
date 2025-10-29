Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A355C18EF9
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 09:17:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCEA010E72D;
	Wed, 29 Oct 2025 08:17:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="UfmeNnzN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012056.outbound.protection.outlook.com [52.101.43.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CD2D10E72E;
 Wed, 29 Oct 2025 08:17:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lbPZmL3AWiRTh3czHOQohP52tPFfPUCB3PPyLxm8+bXF9h1VwSZXrUdaKcq91DpzEUrXm4JdXFJuIxLWVqqiM2jK13mvoESJ68reFPWisvfsZd+Md60xoOtM5dUf1oCHaividFcFLyL/WqhMYTyZNzsC1gBNfycavl/zBR/pfobt/CIjQ8wfOc2m8XC6JS2S3D72iwh+AZsTBfUikG1AKd0dRD/zW/mnxSisgs2lIN+DEBrD4o8Pp265iEwHs+IsxJUDSQAaw74yuwPhQX9dOxrbPt1D8vAJS1s2iv0stn1Y626EzaFvihvNSt58e7IzF3U0FOs6QNl8myr1JnAQeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XBQ/rit373kWI1zW3+ysYezFzDAPKIgX2kKAe4U2wxc=;
 b=P02nI9YUZ4jUYBb68+9DPktAM//gZwzc3MYAXVO6Ys17E2i+Y4fbvjqsomPXs8CT1KxkN9m8iSo6aTuxXWKgXknEyMrLqwhsCQ9Kfm7knxgiBcyrXBA4GXeCsYfm7UFGMwnk4t4QU1ATjaUu8Jwabo1GhfVnRhHnBdqF/L6YQfDlY3P3iwWkWQKVUT6C9VzKiR7wvlybxlmSN8s8HMIL6ZkbO7et6Pyevz+bupznUGj5IMv96eznmTRoSTsedEX1QEQp0Txsp0dTcPHMWkwFIX8CA4YJlfSZwtdtgLfFMlZTQFu3wUbPvUDO8Mb+b7n7NxaSUtFEKd+yX1Sn28QxkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XBQ/rit373kWI1zW3+ysYezFzDAPKIgX2kKAe4U2wxc=;
 b=UfmeNnzNrvL4t6kHuNSI0rgXhXoK05q35dG0eGO5xPFGbtZTH4bHKErnn+f8Rh+EUCeiQwludKvEvgWxPW1ReJ8hZcKNNTn39Vd4n3lS5cV3/E0V9n+dzcGGIe/8tsvlzN+Q1iDOB8lqjPQoCHRzTpmjHl+3IE81wJgx+8hjssewTg8PYzC9cUyMu/zY4ahkll2DIrvn8KZGJ9rp677ivdkLB2dXEVfSUHx597BtySmy1yGxk8DFidEtpMgu8pIl+MzX9IpTdTaT1oJHDK9Ktdh+Z3DddQ84uZNWzbxMRlTztYmCShZk1cwCiNLCbbE4h6sdOhHkiXkYsowhQHm1Sg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3997.namprd12.prod.outlook.com (2603:10b6:208:161::11)
 by SA3PR12MB8438.namprd12.prod.outlook.com (2603:10b6:806:2f6::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Wed, 29 Oct
 2025 08:17:35 +0000
Received: from MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::d161:329:fdd3:e316]) by MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::d161:329:fdd3:e316%4]) with mapi id 15.20.9275.011; Wed, 29 Oct 2025
 08:17:35 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Wed, 29 Oct 2025 17:16:32 +0900
Subject: [PATCH v7 05/14] gpu: nova-core: gsp: Create wpr metadata
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-gsp_boot-v7-5-34227afad347@nvidia.com>
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
X-ClientProxiedBy: TYCPR01CA0179.jpnprd01.prod.outlook.com
 (2603:1096:400:2b2::14) To MN2PR12MB3997.namprd12.prod.outlook.com
 (2603:10b6:208:161::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3997:EE_|SA3PR12MB8438:EE_
X-MS-Office365-Filtering-Correlation-Id: 2fc5f428-e4ad-4ed7-bc4f-08de16c39dac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|7416014|376014|366016|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VEZZaEZJd2tQcUVONmRXdTF0bW5sOXBLRXNYcHhnZ3l2eUxhRk4wOXhoSVYw?=
 =?utf-8?B?aEFIYXljQ0NmNkZ5NXlyaWk2ZkpZeTF5OEpnbWhrRkY3U1VBZ0dpdGFvc3lO?=
 =?utf-8?B?VVZCUmVUbXNnZWhJRVNIOWU2dS9objlxODA2aDdWdDU3VnRLRGNHYUVSd0Rl?=
 =?utf-8?B?N3UzQ01vUW9JMWFkam9ZSG5kVDRxMzNLTFRnT3NMRjJ2WnpOMFR5NzJNZW9J?=
 =?utf-8?B?ZWRIMWRRS1ZISHljYW5oUkdsSWs4Kzc4NzNmOFMvTC81bityNHdlMEo1b252?=
 =?utf-8?B?U0dYbnY5WStwZG81Uk52T2YwQ1g1cEVnN0NLSE0zRlB1TkpUQk82WmN4U0py?=
 =?utf-8?B?aHNZZWZKL2tMY21LL2l5SXNjZmxDeE1tWVAvbHlQRGhYTWpUTHhNcVpyRjdm?=
 =?utf-8?B?RHpBcnJZbHZmSFFMaU9OcDdXU2d3c2kvenVqOTZCL3V4NDdwTlVrZzE4MlIx?=
 =?utf-8?B?RDdnSTFUVXJ2clFnaWJnVDBNRDVUSEtMbzdlZlcxQkxoVWN3RnJ6S2s4RnVl?=
 =?utf-8?B?d3FSUm43QXdvOWVqZlJacnYvb21hYVF0Y1VkNUloaWNFVUNOQnFEeUJWWWw1?=
 =?utf-8?B?UVZMQk10S3I5S3BaY0ZXY2hFS2RjOHRTaDhkSnZHekNqbG4yNi96bUJUTGhZ?=
 =?utf-8?B?WSt2QVJ1K3J0K2RUdjhIdVhuaDRva0gxbnNZSXcyTHNYV3o2SGNaMmVPd2wz?=
 =?utf-8?B?dzdaNGkwdEJzdUpkdlRZeTl0OUpsaC9Fd2luZ3l5aFE1a0RKWHRIUUcyTk9t?=
 =?utf-8?B?TnIvaDM5V1VodnhVZEV5ZG9Ec3d2K3FUc3dBUHl1QXIyUWRMZ3QxQko5UmZw?=
 =?utf-8?B?eHpsUmttaC9sN0ptckhRcHJWVFFpd1hQdzNnVDQ2M3Z4Y05WSjZ6RTdTa3NE?=
 =?utf-8?B?aVI3MHM4b2w1VGhEOTB6NWRGUTZFTEphbFZGUVNHRXFHTFArL09yYWttRHFl?=
 =?utf-8?B?aFV4TmtNb1lvRkxtL25ZbTMwdlJ6OU5IVUhSbEVLdUt1NFlIZURmbE1aQlQr?=
 =?utf-8?B?YWhHczh4UXNzc2NGU0h0VEs2TmxDMWM4QTNrWnQrVDkwZ0hBUmorbjNiampM?=
 =?utf-8?B?MXZWZ3I0K3ZTUVdHTDgzL1BTRkhadU90eGJscDh5ZzdhbXFRSDlGemFWc2JQ?=
 =?utf-8?B?ZmhEaWk5eHlyQTFrRW96aW44VXI1YXBnRnVxb2RIRzhlRURjb0NMaDJlNVlt?=
 =?utf-8?B?OXI1dkc0MUlvMW9SVjBrdW05MER6U2V2LzM4U1dPNjZCU3MyM1BYOVh3WXIz?=
 =?utf-8?B?VjdhTDNuUllPeURJbFQ0NFZNTGZXQXdmOWF1YngwdnhKK0R0V0VaTUhlRE1i?=
 =?utf-8?B?bmE1MjY3QktHdE1kbXlwY3MrelVrN3JrQStMalRPVXRyb1lkTTNYRGxkS1NB?=
 =?utf-8?B?aTh4c0hydGRrajRPSzRIcVQvOVBmS0VZazNsNDlQYXVWK0xrRStzaHo3enRT?=
 =?utf-8?B?UW9UZmljb0dxOHdqaDBiRWJ1U3ZXb2FqdVlSNW05YjN6Y0JOK2JrR1FZckcv?=
 =?utf-8?B?SmVUMGtMc3BWdGppWjVlbUpVOSt1RDFsM0NEMERjdTd6eWFiRit5R2xUOUlU?=
 =?utf-8?B?K0lMT3h1OW9YM2dJc3BWYUNpNVhxMlNMclBLNmU0QVIwQkFGZnphTiswQVVo?=
 =?utf-8?B?Z2QxRCtCNmh3dW9IYzdLTTRPa0NRcHR3K1pDeDFLTGlsZVBkTFZxV2U3ZU4y?=
 =?utf-8?B?K3dzelV1VW5MK3hFWDZhUDROam9HWURRekNXVWpsdkhnNExKekljUUpQQzNE?=
 =?utf-8?B?ZEEzaFV6NGlIWm9ZMSs5bUxpTFlkTGpkTVBMM1JYaTNFR1ZmUFNHZlhGWHNr?=
 =?utf-8?B?KzJucmNxaVlna0kvQ0tjOSt1ZEhIUCtNNnV3cWQ3c3lhTUgyb05GVHVMVVZC?=
 =?utf-8?B?bXhMZmt6RXZMYnQ2MmdTb1k2V1IxM0VLVlJtMEF4Sm56MUl4cTkyaWpTT0hG?=
 =?utf-8?B?Y1M1SEI1aEhwL1BmcmhkZ2ZQTjBMVlB1U3lzTjZaNWJOR0J0NVdJY1pIN2FR?=
 =?utf-8?Q?2URhL0oNkNwppvf9bQd789WAZYajNY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3997.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(7416014)(376014)(366016)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ek9FQ01wb1NkTW1YV3dBUTJ5SnVaZ1FrQklOVFFEU3NRcXRrZTA1RVVKRTcz?=
 =?utf-8?B?cXNOUU9uNEs2OGFtVVBBSmtSVGlibXU1MmQ2ZjFlTlRMdHF5V2M0VXRmRE4v?=
 =?utf-8?B?dzBhTEErZlErdFEvOXVrQWFXbDVmZ01Sb2laRVNIbkV6QjV5b2IwR3Q5SzBz?=
 =?utf-8?B?cllJbnFtM3Y0WjU4VDlkSFNMUkV2OFdDbEdXNDZoMXVHdVFGaSswa3JLMFV0?=
 =?utf-8?B?TkRyNC95Sy9QK2FHNnhmdE5sR2pjQWNDZjUzQ0RNZXBvK2dFV21UeGJKM2h1?=
 =?utf-8?B?RDV1TUhVYkRrS0t4aVdoUjFrbER3clhyQlR2UzYvcUg3cWJwNUM0SEMxamsy?=
 =?utf-8?B?OXplUCtwaFZ6aFp0TGFXQ3llU0VFMkFuMElxbWZuUWxOWXE3WlhIdGVoOWRY?=
 =?utf-8?B?UFIwSHBZUS8xVTU3ck53cWM2MUFNQ29CSzVYR1JiQWh1WENwNTZvK21kT3VS?=
 =?utf-8?B?VUNEZU5UUHNsWGRNRnZXeEFCT21ETVltZjN0QUEvSzZBTWVnZDhtVFVyMjVH?=
 =?utf-8?B?S1hFcU4yZ01pS241S3VJWFNIa1pCNFBxcCtmaFpCaFhtcU9FS1RyMjh5bXFZ?=
 =?utf-8?B?NVh6cDJzanRSQlg5UE85ZTVwOWVwRUZlVE93aUV0TlFoTS80aHhjWUxFb2x1?=
 =?utf-8?B?YmdtMjFFYVQ4VTRkK2pUVEtOdU0zeklQTzRuL00xVGp4YVNYNE9Lb3AvM2xO?=
 =?utf-8?B?MTBtSkY3cWVrQzdraWVza0k0M2Y5VFlmdjhyTVl2NFhUSnF2eDk0TnVFL0dH?=
 =?utf-8?B?OG5sNURQUzF5TzREbk8rSEFpb3dFZ3g1SERvbG1CV0Z0VXlEaHlwUlJtWU1i?=
 =?utf-8?B?cHgzUVFWREZPU1JjUzB5NCsvdHV5Z2dpUHBQNi8rY1BpbjlpamtHVUU0aWpa?=
 =?utf-8?B?RjZuRWp6TkF5emQ1MWNGL2NjcXB1T0JwdEtleUNGdndNYi9CZnJuRnh4UEsz?=
 =?utf-8?B?OTllRDB3S2RmRXkwQnVoSkhMeC9UcXl0Zzc1aDl6TEhCTzJsMnhBc0FuNWl6?=
 =?utf-8?B?eUxRVW9LWXFoOXV1UXc0SXN4T2NtaXNXUkNLR1J0b2lSMDhMS0hGQk1yQUM2?=
 =?utf-8?B?c2g4WFNBZzAybE4yT2M3aWZhQi81Q2hKOW1CRDZXN2FjdmdjQWtudmU2OVBy?=
 =?utf-8?B?N2UwSlFuYU9QR2lTRkc0dEFSQzZyVytvMXNTSU1kNDZBdWhrb2t3QjlvY1lO?=
 =?utf-8?B?TnhxbXVsc1hlcnlmTHc3ejljckQ0eExQeCtrRE0xWXZ1Nkl2QmN5WWR5NmJi?=
 =?utf-8?B?R09Nc25qaUxGVm50SUpDZUFnY1ZiMnpZbGhEbHZjRlQvWnk0K3NJQTBIVUxn?=
 =?utf-8?B?cjUxRlRtbGVtOGQ3QmNwcXFsRnBkc3JuKzJXM0twUnlaSThOWG1XN1QyaUtk?=
 =?utf-8?B?YVkyUTRINjVlS2tlOENldWJtc3Y1eVJLTU1WMUlWQ3hXMTBoK1kvUmhvQnVl?=
 =?utf-8?B?dzQ0MmgwQjlZTlVrbnF1bndzdjhWWEp0ekJDbERjL2wwZE4rYSsxS1N2SWtZ?=
 =?utf-8?B?KysvSnA4aG9YRGg4Rnl0WDBGQjhQTmRQbG9Kdkc1SVFON3hhRERFZGUxcnpt?=
 =?utf-8?B?VVJTUjNzRmxYSUt5blZPdEY2U1FKVTNqOGI4czUrY29PUjQ1TW5mZDlkZWlX?=
 =?utf-8?B?Q3N2VUJPcGNvd3g0TVNxMjIrTnlYZG1ra2pNK2x1dFlmUlRaUFZDRXVHL0w0?=
 =?utf-8?B?c3pWK1FQZFFMaGpMcDE0bG5jY3FSQWlqY2huNzZ1U1RlV09GOE42ZmhSaDAr?=
 =?utf-8?B?cy9sM3JnRmVGK3lBYzkzR2c0cVVmb0xSaWZ6aEdPVDYxeG9md1RYbHdXbWdJ?=
 =?utf-8?B?NDZscXdqQzBySGpiMUNaa0J4YXBBN2VTTTE1bi9rS2Q2c0JLOFhXUUZoNkkx?=
 =?utf-8?B?dTgzaVRPSEZGYVdONEExT2l2VWZBeFo3amZXYjhGU3RJQ3BqQnJEN0hVcEJY?=
 =?utf-8?B?K1dDN3VnNkwyUjhXa2ZHazFkbzdmdnRzV2lOV3JrL2Q5R2NZVVhwSHZQTzh4?=
 =?utf-8?B?VC9zUjFxdHlDb1NXVWtHUmorbXZaTitZSGYwaXZDZ1hEbUpJK2tUbWVhKzlU?=
 =?utf-8?B?TTdEckNPakRjZ2d6dW80M2VyTG9EZkZ0ZDhGRGtRU3JKR0V3L0NlbnJiQjN6?=
 =?utf-8?B?dUF5OWJsNmFmV0gyVlVESE9tQ3FhMC8xKzN4dGFHc1owNTAzRmk1VWF2Q2o3?=
 =?utf-8?Q?Na4ZTjm8NRsc6EUerlkQ9TgbfCG/DN4i1i2Kj9C/41wK?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fc5f428-e4ad-4ed7-bc4f-08de16c39dac
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3997.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 08:17:35.3860 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e/TcQ+dg6ZmDQoLB0cj/FY1xORx/4gahQyZz+6A4KcYP2Ryr+0fN8ETo96/zbHnjDccQ3F0yKNwRQeH5vLGHdw==
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

The GSP requires some pieces of metadata to boot. These are passed in a
struct which the GSP transfers via DMA. Create this struct and get a
handle to it for future use when booting the GSP.

Co-developed-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Alistair Popple <apopple@nvidia.com>
---
 drivers/gpu/nova-core/fb.rs                       |  1 -
 drivers/gpu/nova-core/firmware/gsp.rs             |  3 +-
 drivers/gpu/nova-core/firmware/riscv.rs           |  6 +--
 drivers/gpu/nova-core/gsp.rs                      |  4 ++
 drivers/gpu/nova-core/gsp/boot.rs                 |  7 +++
 drivers/gpu/nova-core/gsp/fw.rs                   | 56 ++++++++++++++++++++++-
 drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs |  2 +
 7 files changed, 72 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
index 6ad4aca6ab66..10406b6f2e16 100644
--- a/drivers/gpu/nova-core/fb.rs
+++ b/drivers/gpu/nova-core/fb.rs
@@ -88,7 +88,6 @@ pub(crate) fn unregister(&self, bar: &Bar0) {
 ///
 /// Contains ranges of GPU memory reserved for a given purpose during the GSP boot process.
 #[derive(Debug)]
-#[expect(dead_code)]
 pub(crate) struct FbLayout {
     /// Range of the framebuffer. Starts at `0`.
     pub(crate) fb: Range<u64>,
diff --git a/drivers/gpu/nova-core/firmware/gsp.rs b/drivers/gpu/nova-core/firmware/gsp.rs
index 54584692922f..e3d76a300851 100644
--- a/drivers/gpu/nova-core/firmware/gsp.rs
+++ b/drivers/gpu/nova-core/firmware/gsp.rs
@@ -132,7 +132,7 @@ pub(crate) struct GspFirmware {
     /// Size in bytes of the firmware contained in [`Self::fw`].
     pub(crate) size: usize,
     /// Device-mapped GSP signatures matching the GPU's [`Chipset`].
-    signatures: DmaObject,
+    pub(crate) signatures: DmaObject,
     /// GSP bootloader, verifies the GSP firmware before loading and running it.
     pub(crate) bootloader: RiscvFirmware,
 }
@@ -218,7 +218,6 @@ pub(crate) fn new<'a, 'b>(
         }))
     }
 
-    #[expect(unused)]
     /// Returns the DMA handle of the radix3 level 0 page table.
     pub(crate) fn radix3_dma_handle(&self) -> DmaAddress {
         self.level0.dma_handle()
diff --git a/drivers/gpu/nova-core/firmware/riscv.rs b/drivers/gpu/nova-core/firmware/riscv.rs
index c0aa0c7f6eb9..9c15cee3c0a2 100644
--- a/drivers/gpu/nova-core/firmware/riscv.rs
+++ b/drivers/gpu/nova-core/firmware/riscv.rs
@@ -56,11 +56,11 @@ fn new(bin_fw: &BinFirmware<'_>) -> Result<Self> {
 #[expect(unused)]
 pub(crate) struct RiscvFirmware {
     /// Offset at which the code starts in the firmware image.
-    code_offset: u32,
+    pub(crate) code_offset: u32,
     /// Offset at which the data starts in the firmware image.
-    data_offset: u32,
+    pub(crate) data_offset: u32,
     /// Offset at which the manifest starts in the firmware image.
-    manifest_offset: u32,
+    pub(crate) manifest_offset: u32,
     /// Application version.
     app_version: u32,
     /// Device-mapped firmware image.
diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index ac8c2bafe318..fa64884c4768 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -10,6 +10,8 @@
 use kernel::prelude::*;
 use kernel::transmute::AsBytes;
 
+use crate::fb::FbLayout;
+
 mod fw;
 
 use fw::LibosMemoryRegionInitArgument;
@@ -105,8 +107,10 @@ pub(crate) fn new(pdev: &pci::Device<device::Bound>) -> Result<impl PinInit<Self
         // kgspSetupLibosInitArgs_IMPL (creates pLibosInitArgs[] array)
         let loginit = LogBuffer::new(dev)?;
         dma_write!(libos[0] = LibosMemoryRegionInitArgument::new("LOGINIT", &loginit.0))?;
+
         let logintr = LogBuffer::new(dev)?;
         dma_write!(libos[1] = LibosMemoryRegionInitArgument::new("LOGINTR", &logintr.0))?;
+
         let logrm = LogBuffer::new(dev)?;
         dma_write!(libos[2] = LibosMemoryRegionInitArgument::new("LOGRM", &logrm.0))?;
 
diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index fb22508128c4..1d2448331d7a 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -1,6 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0
 
 use kernel::device;
+use kernel::dma::CoherentAllocation;
+use kernel::dma_write;
 use kernel::pci;
 use kernel::prelude::*;
 
@@ -14,6 +16,7 @@
     FIRMWARE_VERSION,
 };
 use crate::gpu::Chipset;
+use crate::gsp::GspFwWprMeta;
 use crate::regs;
 use crate::vbios::Vbios;
 
@@ -132,6 +135,10 @@ pub(crate) fn boot(
             bar,
         )?;
 
+        let wpr_meta =
+            CoherentAllocation::<GspFwWprMeta>::alloc_coherent(dev, 1, GFP_KERNEL | __GFP_ZERO)?;
+        dma_write!(wpr_meta[0] = GspFwWprMeta::new(&gsp_fw, &fb_layout))?;
+
         Ok(())
     }
 }
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index dc54c9faea7d..b5081eedcdfe 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -9,10 +9,12 @@
 
 use kernel::dma::CoherentAllocation;
 use kernel::ptr::{Alignable, Alignment};
-use kernel::sizes::SZ_1M;
+use kernel::sizes::{SZ_128K, SZ_1M};
 use kernel::transmute::{AsBytes, FromBytes};
 
+use crate::firmware::gsp::GspFirmware;
 use crate::gpu::Chipset;
+use crate::gsp::FbLayout;
 use crate::num::{self, FromSafeCast};
 
 /// Dummy type to group methods related to heap parameters for running the GSP firmware.
@@ -109,6 +111,58 @@ pub(crate) fn wpr_heap_size(&self, chipset: Chipset, fb_size: u64) -> u64 {
 #[repr(transparent)]
 pub(crate) struct GspFwWprMeta(bindings::GspFwWprMeta);
 
+// SAFETY: Padding is explicit and will not contain uninitialized data.
+unsafe impl AsBytes for GspFwWprMeta {}
+
+// SAFETY: This struct only contains integer types for which all bit patterns
+// are valid.
+unsafe impl FromBytes for GspFwWprMeta {}
+
+type GspFwWprMetaBootResumeInfo = r570_144::GspFwWprMeta__bindgen_ty_1;
+type GspFwWprMetaBootInfo = r570_144::GspFwWprMeta__bindgen_ty_1__bindgen_ty_1;
+
+impl GspFwWprMeta {
+    pub(crate) fn new(gsp_firmware: &GspFirmware, fb_layout: &FbLayout) -> Self {
+        Self(bindings::GspFwWprMeta {
+            // CAST: we want to store the bits of `GSP_FW_WPR_META_MAGIC` unmodified.
+            magic: r570_144::GSP_FW_WPR_META_MAGIC as u64,
+            revision: u64::from(r570_144::GSP_FW_WPR_META_REVISION),
+            sysmemAddrOfRadix3Elf: gsp_firmware.radix3_dma_handle(),
+            sizeOfRadix3Elf: u64::from_safe_cast(gsp_firmware.size),
+            sysmemAddrOfBootloader: gsp_firmware.bootloader.ucode.dma_handle(),
+            sizeOfBootloader: u64::from_safe_cast(gsp_firmware.bootloader.ucode.size()),
+            bootloaderCodeOffset: u64::from(gsp_firmware.bootloader.code_offset),
+            bootloaderDataOffset: u64::from(gsp_firmware.bootloader.data_offset),
+            bootloaderManifestOffset: u64::from(gsp_firmware.bootloader.manifest_offset),
+            __bindgen_anon_1: GspFwWprMetaBootResumeInfo {
+                __bindgen_anon_1: GspFwWprMetaBootInfo {
+                    sysmemAddrOfSignature: gsp_firmware.signatures.dma_handle(),
+                    sizeOfSignature: u64::from_safe_cast(gsp_firmware.signatures.size()),
+                },
+            },
+            gspFwRsvdStart: fb_layout.heap.start,
+            nonWprHeapOffset: fb_layout.heap.start,
+            nonWprHeapSize: fb_layout.heap.end - fb_layout.heap.start,
+            gspFwWprStart: fb_layout.wpr2.start,
+            gspFwHeapOffset: fb_layout.wpr2_heap.start,
+            gspFwHeapSize: fb_layout.wpr2_heap.end - fb_layout.wpr2_heap.start,
+            gspFwOffset: fb_layout.elf.start,
+            bootBinOffset: fb_layout.boot.start,
+            frtsOffset: fb_layout.frts.start,
+            frtsSize: fb_layout.frts.end - fb_layout.frts.start,
+            gspFwWprEnd: fb_layout
+                .vga_workspace
+                .start
+                .align_down(Alignment::new::<SZ_128K>()),
+            gspFwHeapVfPartitionCount: fb_layout.vf_partition_count,
+            fbSize: fb_layout.fb.end - fb_layout.fb.start,
+            vgaWorkspaceOffset: fb_layout.vga_workspace.start,
+            vgaWorkspaceSize: fb_layout.vga_workspace.end - fb_layout.vga_workspace.start,
+            ..Default::default()
+        })
+    }
+}
+
 /// Struct containing the arguments required to pass a memory buffer to the GSP
 /// for use during initialisation.
 ///
diff --git a/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs b/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
index 6a14cc324391..392b25dc6991 100644
--- a/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
+++ b/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
@@ -9,6 +9,8 @@
 pub const GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS2_MAX_MB: u32 = 256;
 pub const GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS3_BAREMETAL_MIN_MB: u32 = 88;
 pub const GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS3_BAREMETAL_MAX_MB: u32 = 280;
+pub const GSP_FW_WPR_META_REVISION: u32 = 1;
+pub const GSP_FW_WPR_META_MAGIC: i64 = -2577556379034558285;
 pub type __u8 = ffi::c_uchar;
 pub type __u16 = ffi::c_ushort;
 pub type __u32 = ffi::c_uint;

-- 
2.51.0

