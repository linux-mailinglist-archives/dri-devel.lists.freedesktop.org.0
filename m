Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA6E8C146BC
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 12:43:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66F3210E39B;
	Tue, 28 Oct 2025 11:43:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="WjV1Gei4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011066.outbound.protection.outlook.com [52.101.52.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB32210E389;
 Tue, 28 Oct 2025 11:42:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YoiZoz1H8wqwAQf+GGKeVXf7F74jWSrLMzMzDdVs39Hlkn3oeWrZzsOEodD7YX0vJGCYHcabuXEp0stA8UHCJ/Guv0LXOmOy6DwyHWzXBIww/t+cc7ewLU4mQs9nLUs3CckGxUlyTQNusLkKfCNSs/oj+VHmMYuZnAKTk8+BjjNs8L8T69+ykXd2+YGVk+4r1g/sxyccaRHr194I+VXQY4KsDqdFX9/HB2++SaOY5swlvdmv8tLdka2f1NfxUeMqoeDD1pMKmZ6uX3DJoMMN1GqzNgoqIBwmnLuW7B0l1yNxYst67NZA5lwkmu82eo0WqpKPD+uoCWjN+snzuIdfZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lmfVI6WQviqUEVaUjE0BplhMv0oWGgUnDWIbzWyp6QM=;
 b=khQ69BXg8GtwL423Vo5A8sjy5c7H0thZ9J0wxNpYO/CisLEn4nY5lDzVAC7yuv3UdMbpEz/NiFNUKVXdps3GZQ0WrqYhutlx2q4W89Zc/K3IFMgRRsHL5AEMhJr4/6/u/mX2vvzme9JZygtXvob3y7+rk562jpiQC4lT4mHK7ZjMfhXBVyNZdzyUXY6ZCeeHeNy9C0L0kWgpzfSzLBSPR1lLAP8P1Of9ckg76/dMAH3Q2tOugo6Kc6Gaqb69IY7/ExKHMtJf9JOSxTVdS6LZX349BoNYOQZHLPiOmLPA4h5zYEYEnnDakBulAb+GuV3D/3F44bH8+xoI/0uY9WRatQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lmfVI6WQviqUEVaUjE0BplhMv0oWGgUnDWIbzWyp6QM=;
 b=WjV1Gei4JtGPMHKn+cmXmYUbpJSyyT3wEf475eckPsDxOH4+ngTf+eX2vHH5t/OQV0i6Fd3+mdZVG/U4mqIbhmp4ZwzZ07fXNT+crtQu8b8nlUVePIdG+IQF9d/tE6+hKCyW4kBXXYNNQoJCsconYygDAOVnf8Wq8QkU/2kBlmAaVVHkRotsbTvoUbKZIMX15/D+ZLWtJnvm90XthvX+Qjn+vG3rgCXb62m0jWBgclZ2dYZ2fPrdzJt1qlvP5XO/Y+K95Th79w4gTyyPfowy3w8VwpQRgfFybR1ARMx4gZxPRXEl3bFNqkfa7+M2yiAD4lnUVWPWR5DO0VecBE4hzQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SJ0PR12MB6925.namprd12.prod.outlook.com (2603:10b6:a03:483::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.19; Tue, 28 Oct
 2025 11:42:55 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9253.017; Tue, 28 Oct 2025
 11:42:55 +0000
Content-Type: text/plain; charset=UTF-8
Date: Tue, 28 Oct 2025 20:42:51 +0900
Message-Id: <DDTXFNNJL8P7.33ROZLOZ1UDVL@nvidia.com>
Cc: <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>, "Nouveau"
 <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] drm: nova: depend on CONFIG_64BIT
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>, <aliceryhl@google.com>,
 <acourbot@nvidia.com>, <jhubbard@nvidia.com>
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251028110058.340320-1-dakr@kernel.org>
In-Reply-To: <20251028110058.340320-1-dakr@kernel.org>
X-ClientProxiedBy: TY4PR01CA0105.jpnprd01.prod.outlook.com
 (2603:1096:405:378::19) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SJ0PR12MB6925:EE_
X-MS-Office365-Filtering-Correlation-Id: 44826253-a215-4d85-f101-08de16172244
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|10070799003|1800799024|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UnJWVlhCemhGTW5xaTdyWlYwZGVDS1BJMk9rVi9WZnI4MlVESnZHSS9JQ1Jl?=
 =?utf-8?B?bEtKeUtvWXFNS0ZOTmJzbCtab0V1ZUdoWE9ZYlEwQkQ4eG9HbWk5MDRFU3Bx?=
 =?utf-8?B?ZUNaRmlnL2JHRXBDSjNwVkdncEZGUHRuTmQ3cjQ4OEEyY2xYQlZMYlNQaWIz?=
 =?utf-8?B?cWNxNVNKNnQ4TWJXUENlMlo2SmpVc1MrL3ZiTXJtKzZnS0h3Z0xZR1oxdlpS?=
 =?utf-8?B?eTdTTC9QakNQZ0hjTVVicnVzZnZiQUNPemRKdU1BbG9LREdRclhrcmw5c0dR?=
 =?utf-8?B?dVMwZmFDUnhGWE5WcUJTMFNUdVRqWHkwUGZmQ3JjUnpLZ2wxaWY1OFlyVDIx?=
 =?utf-8?B?Q2JqU0l4eWdUaUF5cDZFM2VYd0g2ZU1sKzlkK2JGcVAwSXQwckxXTHNsTXMv?=
 =?utf-8?B?T0lqQit1ZFVFNU5NNFVjWTRyak5GbmNKZlZwVVJxVmVlSGNMQjNqVVFkODRW?=
 =?utf-8?B?eGE4WE51aXJYZXVVMGdYSVc2L0Zld1hUbkkzYUIvZ2JWSTBSU3lSbkZFNkFq?=
 =?utf-8?B?MjI0L0pQK0w5eDNPTzY2anRVVmtST2lvNGJ4b1Vtd29KTXloVzFyZVJyUDJK?=
 =?utf-8?B?aFdhTHJqdU16TTYxaXdRM2I0MHJiNmp3alIrMlVLckNhNTVuYWxRK1pjNkln?=
 =?utf-8?B?bVQyN0Rwc3d0dURnZXJ3MzFDRUxOS2xPTkZxYndMWFRPQ1pGUGNrRXFLYUlx?=
 =?utf-8?B?ajl4RldUU2NaSHFTVElyWmV4M0Q3SlJsRkNlOWJXMFBad2VtTGYzZG4vRi80?=
 =?utf-8?B?dGZCSm1iT2ZKY3JUQmFmbmxIZzYrVUtaUkRoS0Q3bGEreDlTcDNxTDNlbDgv?=
 =?utf-8?B?N3J4amdzbXk5elFXS1p4WTQyK1kzN0pKbEhiQk5xRzQrQ2VIaTJxRHF0Ykcv?=
 =?utf-8?B?eDEyMHdFZ3VVdXY3YWJydEl1aU5uVmYyZWt5T2t6WjdkZThHd21iY2ZaN2Vt?=
 =?utf-8?B?Y0QrYkRWNlptSWRRR2hXaU5tMXJ2ZStRQ1VydEVIYUNydWwxWm53RlBtYUVk?=
 =?utf-8?B?dTJKbHIrNklCQnVuSEZrZG1heHg4cmovMVFxTWVKSFcxTkVPYWJxSk1nSjRJ?=
 =?utf-8?B?TlZqd2NTNEtqcHZwbjZOZ3BlV3JhNHBVdG5vcWFXbDZXUzc0ak9zOFN4L1Ft?=
 =?utf-8?B?L0UwelZ0cWErWDQ0SEJ3QjkxOS84ZHB0dnhwY0pTZ25mcjhRbm9rU3Bzc2s1?=
 =?utf-8?B?em92YmRPcnd5OTNJODhwUFluTkFIZFFsUmVCRFp2WVZQZExwM0tHcHRCQzF1?=
 =?utf-8?B?SHFpVzZWTFFMeDlBS2tvaDRaUU5QTTlleHJXMVlBOHlDZ3ZCWDNhYnlvbENw?=
 =?utf-8?B?VFEwZzZyQ245ay81OTZrUTR5Y2dFMVFiQnJwdm8xTGtTNjVVaGNQbzJlVTlr?=
 =?utf-8?B?MEJ2MlRQbU1CMU01QUMzVi9NOXczaklIaFJRaFA4ZVRpRndNOU9RQzVzYUh4?=
 =?utf-8?B?Rzg5THJiaWdUNklCdi9aakNQblpYdzM1UHBabFlWMmJRWWFzSisvWmUxajhN?=
 =?utf-8?B?R3lzSUlJK2lBczVFZm0yMDFTUlV4c2xHL3ZrRlQ1YnNJWUtyNUhHcFJ1Q0tE?=
 =?utf-8?B?cHJQVmZ0aWxrOEpSWERWS2xQSXlPSGh6RE5xSVozSlhEUVFBa3k4V3VOcytp?=
 =?utf-8?B?bkFrOUduT1ZlNFg3cUN0cVh1bGNtL3IzRnM1alRQWXlNQVBzQm9MNjZxT2xS?=
 =?utf-8?B?djR0a3luRTh5dXpKODhxb25DL0lTSk03WTZQcGllbjE2Qzdyc3Y1Rk9DM3BI?=
 =?utf-8?B?Rkt3VkljQkRPUi9GMG5aVWJCQVRnZ3NabS9JZlk3bmIxakNOSm9jR3RZakV6?=
 =?utf-8?B?R0RGZVVpa09uS0ZNQ1NWQ2FRU01sRk1saFB6dnNxYnFXSXcxcEpweU81YkVK?=
 =?utf-8?B?MmZSRXhWbmhiUkpsY3E4YUdSc2FxSEFuQytjbEpTUlhzbzk5Njl0aXdtNGN0?=
 =?utf-8?Q?QCDKnfnk9wWliXDpo5JGjcfT7EKkt8YL?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(10070799003)(1800799024)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OG0rU3k2aStoWTZPVzVNbFVtNExSdGxyYU1UenlEWGY5Z0FmSUNmRmJnTUlE?=
 =?utf-8?B?VDNqTFVsenQrM1Ewdm5JNW1RZG9OQ3BRaVpaRGsrVGQ4eGV0THpNbGVEeHJP?=
 =?utf-8?B?aDdVUC9FeG5hVmVLV3p1NWo5emtqdXhYd1ZwazRBWk9VNVM3akEyeTY4ZTFk?=
 =?utf-8?B?Q3NDVFhxQ1lxQ2pmMGxlOEROZTdPNU1FRk11RGhYTFZ6VGtOQUZmdGRlYTh0?=
 =?utf-8?B?WVM5Y3JRdXp4R01hK3VSR3VzelRoOXIyQm5RN29abi92R2E1REwzWk5DVk1n?=
 =?utf-8?B?L0VQVWtDcTVsUE5XM1QwTGJ1S3o5TEVlbVBaZ2g3SG85OGtzc04vNmJCUWhp?=
 =?utf-8?B?STJoVTdHZzZsMGdJYXQyeEFMRjUzWXNFVVhyQ0wwYmxiUVllSzNlWHNKZFkw?=
 =?utf-8?B?MlhoMUFyMFFpb3h3MjNNaFk0cUwwKzQ3WVJPTFdJTFpLQnNvdVQ2d1VNZTBP?=
 =?utf-8?B?SjdTVDdTcnphWVM0eXhCbTIzL29MUllaelpiemxQL2dmb2k3UmxEK25DZldH?=
 =?utf-8?B?K093R05qdnF1Q3d5akZtMEYrb2lLNWRpR0xPc25pK3lncWN1K0xzWjZSbTYv?=
 =?utf-8?B?ZW5sM2Y5cFROMm9VaWs2YkFKdG5BZDFLZ1Nya2V2RnhnUEczMU05ZHhEUCs1?=
 =?utf-8?B?cDd6UTRkRmlKUDErWTRLQTk5YWllY3dvU0RiT3lKejV5ZEw2QTRpODRWN1Ir?=
 =?utf-8?B?Wlp3RDIrV3VZRnRJNzNkbERINWJCVkQ4M3lHenhZWnRUd2ZwOVQrWUNDa3Yx?=
 =?utf-8?B?SUdqMXpxa3YvRVN5VStLUlREVytTdzZLak5yWkJvc2t0b29XTGVuVVJtbk0y?=
 =?utf-8?B?OGtkNHhDYU1ETkF3Q29zUGNSTWlGUEhHZytrRXhUQWlKL2tPZmxnc1BtWHow?=
 =?utf-8?B?ZmZORTFEaGs2NjF0SWxYMmpjOU1JWWR3aXRKZFpKVDlDWGZSZkE2cmhPUDVK?=
 =?utf-8?B?WU9QcVQ2VVZnOXI2ckIxWUMwM2tERy9ORDFQaVQxVnV6ZWhyMFZYZVdwd3lE?=
 =?utf-8?B?Y1FHbno2ZE5hYXpLaGxzQ3VwNWRRTjhMc2gzR1pJOU5IbGM2TmRjTWpTam5O?=
 =?utf-8?B?S1pHekVJeUFmeDJWN2YxcVdYc3FpYXRxcnVRVXFHSTRYeENacm1SaDB1eVZU?=
 =?utf-8?B?d24rME44MWViSG1xS0NWOW9RcmI4ak5CSlB2cG51WFZndHJXYUs4SnZKUGZT?=
 =?utf-8?B?Wk1SWnF5OXZad1NISk5yUTVIWDJ2amRkcFk3RGoxSERNS29jM0hPMzNnTnJv?=
 =?utf-8?B?M1pOOFdQVHBtUVFhMHVBK0o3ZFYzNzBOU3haY0JsM1RiY2VXNlFDaGcvZVQx?=
 =?utf-8?B?cnZha1NZQk5qUXZUTlVIYUJKQ3RMalFrM2lZeFMrcW5RMWk4bHVXSGk3VGJh?=
 =?utf-8?B?ZXJva0dSMXh1WEhzTXNqeFpPTnVjTnpqWVZnbnJHdG5zMUlJUEtVQmE1bUVi?=
 =?utf-8?B?SUFCQytUeUszYVNZZEhQUlI4TjF0N0tuMWF2TERxKyt2RnhmRitFS3E4eGZh?=
 =?utf-8?B?cmJzbi8rQUZOUkNHUG5LY3NZK3BzZVRHMXk0d295UXRhY0p1alVVRVFqdUVK?=
 =?utf-8?B?akMyaStiUUUva2JTNFo5Z1JTdUhQU2NZZFBOTG5FYUJnLzJPMlg4SCt3cjZF?=
 =?utf-8?B?V1hUZmYzKzFYVFNKeFpLQ3hPYW9Yc2doR01iaVF0T3BLSzRlMi9pR1ZUNUxS?=
 =?utf-8?B?bkhoTFhPeVY1N05qTVZxZTNvTk5Cd2hlNGxsVG5ZTFVhUG96bHJUUXJXMWZ3?=
 =?utf-8?B?c3ZUcDh3a0x4VStESGo2VmJuVzlQSlB4anhsS3ZINmZHUGFlcmdZZFd3b2Zx?=
 =?utf-8?B?ZFBienBXMjJOd0UvQ3ZuV3RGZTZjQnpnR1QyQUhzaEg4UTl1KzBvQmlrVm5S?=
 =?utf-8?B?YUQ3aDU3eHcyQlhUTUFGMTFMR0ZRdmN2dWphN2xRY3orQU9sL2wxR2tRZTFG?=
 =?utf-8?B?ODFCbmw5RWpzZzduQTdkaHhYeTFqaS9VdzgyUG1yS3NiTUpidUZMUWg4S2xv?=
 =?utf-8?B?QWJZdjhhOTRTNnFFRkorL0JycXNmVHNFWks3UEhTMDJpalRiNG0xWmVoeFJl?=
 =?utf-8?B?VU1rbWNSN2lyWmhvRkgrUXpVTWV3dzdIM2dLVXg0UHdGT09iN3BwaitocTI1?=
 =?utf-8?B?U2Nxak5NSElrZHcweWNtZmZGejBrUTc2dUNlMjIvTmI4VDdqMjQ3WXpqVGZk?=
 =?utf-8?Q?OkPLcPRFrWlwSXLukwsktv01dRf4vrjIXKtjPENSp4IE?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44826253-a215-4d85-f101-08de16172244
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 11:42:54.9741 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3f2wV+VsnNnnilOD2x3bZubxcG0e+XXJK5k8YLRI0t1G2dATJnWTyQqnKFxXQUEXJJbkk61NWNU09jqHcasCqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6925
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

On Tue Oct 28, 2025 at 8:00 PM JST, Danilo Krummrich wrote:
> nova-core already depends on CONFIG_64BIT, hence also depend on
> CONFIG_64BIT for nova-drm.
>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
