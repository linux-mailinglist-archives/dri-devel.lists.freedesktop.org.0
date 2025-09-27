Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC5B4BA56BF
	for <lists+dri-devel@lfdr.de>; Sat, 27 Sep 2025 02:31:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7ECB710E0B0;
	Sat, 27 Sep 2025 00:31:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Ofdzw2cy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010012.outbound.protection.outlook.com [52.101.56.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E94610E0B0;
 Sat, 27 Sep 2025 00:31:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AsauvG0z4pqW7HUD/91ALPZwkbYpetcdj/hx9/WK9S70SKcCaBglhvQV7WC844L/zAQbV0i9E96Aqd8GKTqhj4pP8V6S3mZLsXlRiLRE8StKwY8zAebh3Tjsk9VJW4TX4D8+iyb5WlGG58RjLThPb+C1zOuD6iMWmh4wr+k1rPjatV2w+sZZ5K2+FehFkKiAGxNjpbz4UhLSrY0QncLJBpcDczYWxgxwjZABtyAE6du9+GsAEx9QWigJNIwZOqpYskELL+ibgA9ElpzUhQEP0/WNWJKX5rcPw73ZgS/K2QXJBp0tmJKYdzeisx/fSCnDi6IKJirSmrmuZj1dfMTEdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dAXbEIr4xoIBrre9x5kBqybP0BchS/JCt6mVegot7ks=;
 b=Anlu+m36vfiiDtVibNW6D/H/pJ3TxiMzEsI5QjVgADTp/dTDnfjFAGgqJKqtQ8UZzhFZthsq65OqmGgYFmS1dZJGjJJzqfi/h3w9hoLHT9NUnHxnj1XBu6ZPVwx1n1kGxY8snSOm9/FwFgw/RXwplMC9yqO39h1Yg7014i5Vwi2gISjM1BLAziB6CvRqQ2V4aYe2UQJOr53vSz1kescJxtiP80dnCsVRwTsV8VdDfSVh/ZSjVGLZ/cHJYitBRvkdYXc1+/X23jaxU74Lma2wWyW3uHt0cbeG6+jOnNz/IfJ4vxW9vYlkfU6RnxhzDGVKgRAyYcAZuRI2atvJDdtBCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dAXbEIr4xoIBrre9x5kBqybP0BchS/JCt6mVegot7ks=;
 b=Ofdzw2cyocl0D7qJvI/8eHKppFu9vQowgRMfnkZ0PNpzt/kclOHf3xiQRoKMc/UreEEzDoLbEk2WQehZne0m4u1zc8JNcEPUjnGEibIV9OJSeFl3YHfLlcp7Roeqn6JZrbVZQt9GS3/vEIPdirKwhyAw6GWQxjgc9l47rJHqIt7uLR/tD6VmmM3E1QRSUU4rPdIuzQ927wyGfBb7TS0MWGBYzagG0a+lZHqGiTSI0WUYPTJ7X4E0yHm7wdrfkeBuGIT/XbmyxDpNUxee6H3SKMVrtUHIa6YdcDf1Pni6HybxdvGZsJeGbqHi+e1U9aa23xWj0+LM5RIYZNuNbU4ebg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4127.namprd12.prod.outlook.com (2603:10b6:208:1d1::24)
 by DM4PR12MB5818.namprd12.prod.outlook.com (2603:10b6:8:62::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.13; Sat, 27 Sep
 2025 00:30:45 +0000
Received: from MN2PR12MB4127.namprd12.prod.outlook.com
 ([fe80::a0ad:4e23:765e:7cb6]) by MN2PR12MB4127.namprd12.prod.outlook.com
 ([fe80::a0ad:4e23:765e:7cb6%4]) with mapi id 15.20.9137.018; Sat, 27 Sep 2025
 00:30:45 +0000
Message-ID: <d2003100-82df-4c72-b6f8-0d995c82a9f0@nvidia.com>
Date: Fri, 26 Sep 2025 17:30:40 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] gpu: nova-core: gsp: remove useless conversion
To: Danilo Krummrich <dakr@kernel.org>, acourbot@nvidia.com,
 ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org,
 a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org
References: <20250926130623.61316-1-dakr@kernel.org>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <20250926130623.61316-1-dakr@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0147.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::32) To MN2PR12MB4127.namprd12.prod.outlook.com
 (2603:10b6:208:1d1::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB4127:EE_|DM4PR12MB5818:EE_
X-MS-Office365-Filtering-Correlation-Id: d524f361-9ba4-4ac2-72f7-08ddfd5d1860
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|921020|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RnNjNGpZR2JKdTRBcnlKbG9aV2VscEJXSEE2ajFDSVlhZ3NjUUZ3OU0vOFpi?=
 =?utf-8?B?M29Obm1JUTcxQWVra3JveW82c2lCcVR4d0RXRmRXdnFzUWFjb0JIbldWeFJT?=
 =?utf-8?B?QVFpNEFmTU5DdWdQU05IQ1pERnkvaGY2M1RkQ01vbW5RT2pUemd2ajZaZ3k5?=
 =?utf-8?B?REVQVEdtbktZRzJoczVneVZBOFhuNXhqbnNPOExkUEdVeks0NVpoMmg0dEcx?=
 =?utf-8?B?ckczemhTZ0JETHlMeGIvYWhsZ2FvSlVsQ2g3VWFKZlFTTU92V3Z2REx3bTFF?=
 =?utf-8?B?QnNRS1Fzd2x2TEx2a2Rid3VFTDBIT3dZOTVYbGtCK2s0a1hpR01zUHFTWTdK?=
 =?utf-8?B?eGMyUldLaVpsWFA4YVhGUXptMGV5bEhLRlp0R2d6NGFHSmtOOUdxWUlBZmxD?=
 =?utf-8?B?TVhjU09NK1BFZVErUUZsUlY4WHB2ay9ud2JpaGNEZmVDS3BacVExcm5BZlFj?=
 =?utf-8?B?Z1F2bUwvUDdTSC9jOS9DSW9FSkVNZ1RBVXhMMkF5YjJLYnVWSk5zYVNEdWRB?=
 =?utf-8?B?NVk0bnlMdWlzbkVjb01rWHhnRG1LR1NTaEFNUEk4SmRpUXdCQytybFFyc2x0?=
 =?utf-8?B?Z1hQUS93VUpGaHd0WDdWNHZ6YVVMRDB4dmFWN3RsTlo0T2FMRXN6bFhiQ1Q0?=
 =?utf-8?B?M1ErN0E2MUcvWWtQR2N5bUhSaEh6SU5MaFM5ODQ5ZjQ1dmNCc0lYRTBwOUNZ?=
 =?utf-8?B?anczMTRpYWpQbWNmUUxwWW92S3V4WGZJcWs3L3JHYloxaU9URGNFVDRQcXNN?=
 =?utf-8?B?SlNHR3lkanhLUGgvMGY5dGVvWDJQS3FybGFldGhyRkwrZW14eEhrZ0IxMmRq?=
 =?utf-8?B?bkdUalZZSENoUTFwUHl6dFdFSmRZcjlyU2o0L2gwYklNZUsxM2VVZllZSk9H?=
 =?utf-8?B?OWJidVdEWE1VMEJ4bWZlU2FJMCtiUXU1OGpRRDVQRXkzQVJaTmJ3ZEZ3Wlpa?=
 =?utf-8?B?cTBuR2x2YlFIRmtZRTZMVHBndksyNDVvUk1EU0RUM052L0l2eVVuK2Y4UEYy?=
 =?utf-8?B?VWVXR3RnSmhzYXdjMDhlbWhSSFlidWU3NkFnY2gzZUwrd2hIcURhRFQ5dnZj?=
 =?utf-8?B?WmhCYU90MzlQUUtDdjRwTDZKNEE3WEVkSXE2SVZnQWtxMUtpT1NZM3FvMjV5?=
 =?utf-8?B?QTZreWZsZFFnSmczdCtQTTFRSFJVMTJLQlJDMDZRWU00N2JvcG5LNXFENkdS?=
 =?utf-8?B?ejY0SFpGVk9tRlV2RVBObk9kUFg1OVp4bWNvRmlsWTFRVVkvU1kwN0RMNmx3?=
 =?utf-8?B?ZEs5OUg3VEgxSXY1b0xqZG5KZjcxYk5pWUhPUXJldzVjRmR0Z3RBV2ZIaTBl?=
 =?utf-8?B?ZlRvcjRPOXJ4NTU0YUo3aTVDaWI5VHpKNlQ4WlUxWklKbmlIUmsrbjg2blVh?=
 =?utf-8?B?K1V4MjdpUWtqMHIrd29ISjFST2N2cGF6Tm0yQWlFMUV6NXFxdTN2YTFlM3Rj?=
 =?utf-8?B?NkdBQmIvR1J3VjVzcllQZWpyRTFWOTRVaS96aVZCa2VZZlY3M3ZxUU8xb0dO?=
 =?utf-8?B?c05IMXVIUGZDd1hENFJCZXZCeTZuUEJaaS9WU1MzRnNXRUNjK1Y0VmpHb0N4?=
 =?utf-8?B?VmxOQWdZSnVXRG9Fc2xkNm92L0Uzd0dnRnJWUDgvM1R6bjFrYzNnUDBOalZi?=
 =?utf-8?B?aXE3dk9UdE5tWXFTaDhrZStZZjlIMXpmR3ZHcERhNnNvZkUxaTdkZ3BjTnlx?=
 =?utf-8?B?MktnOUJSRzBJaVZrZ1cwT1BkY1FNTHNGY29PNXR1Mmh2cDMxaXk1bU9vMFhB?=
 =?utf-8?B?RlhQSkdnZDlVYVlGRFV6TkpZSmgySG1KVnh2ZFhQNXl4TkdBN0Fsc3o1SXlH?=
 =?utf-8?B?WDI4dmpIbE1wTllsOTdGS2NXSEFqZHhLWk5hM2FZOHppbm9GTnY0TnV6OWRS?=
 =?utf-8?B?R0VPR2wvVWNSbGF6WVpjRTBsdXVLQ0lucEFtUG5JY0JXbnNTWVZ5SHBiYUhP?=
 =?utf-8?B?Ry85VmZ2aThkNW1SdWd6bkZGNWFWZkk1WjE5QXlBVDNTYlg2K2dpMVRoQS8w?=
 =?utf-8?Q?8ci66l92U+eJ3df16YjUZHLbxr2ZTM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4127.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(921020)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OUVmTXVNai9EMEhzK3A4NU1ZNXIvMGF1Mm5oRXhpQ0VESldSUEpTU1lDWlRS?=
 =?utf-8?B?OEJKNEtLcm1ZUmIxNGQ0c216ajE1RU45NHVtT2Q4SHpta2o1UHFDbXZEcEY5?=
 =?utf-8?B?WlllcHJGOXN2WjNTY1F6MllDMmh3L05xZ3FWZmdrS0dvbzhJVlZ3RTQwM2Y5?=
 =?utf-8?B?Z2gzeW4wc21NY2drRWFvdmdqZEN6aUhpcHZJN0QxV2ozYjFEMnArUnJOTlp0?=
 =?utf-8?B?MmhqU2NGTnBiSzhwMVNIK2QvVmRibDNET1Yzd21BNkJTd0F5WDdteitWMHJW?=
 =?utf-8?B?NWNRRXY3UHJzVzdlRnlyL05EbEY4dDk1ZkJycFJuUTg3dW5aeTA5UWlDVDJE?=
 =?utf-8?B?SjJIRS9nM3lyL1V2amJRSjMzaDdsQUpZVFp0RVBVNWJPWDUwcmsxK1NtL0FD?=
 =?utf-8?B?NEJDdm5FeUV1M25kOHgweWRVUC80NVlzZFY0b3dNaGNRYk1ZeWVlSGZHYTBR?=
 =?utf-8?B?MTI1UkI1aGxtSE0yeE5Ic3BxSWZoeUd3MGN0RGpDdHBLcWgvTUVhZ0NwU1pX?=
 =?utf-8?B?NXNTTVlJRkk0VDV5aEJzZFdtdGorQVlod3NMRUtpc1M0b3FDR2phbjlPZWVi?=
 =?utf-8?B?T0I0ckkzRkZJblN5TkJWSEREOEVURWJlOFBjVDZ1RGt6VDd0Wlh5YnRJWUpp?=
 =?utf-8?B?eVJCOGVsNzl5VEQ0TlZmam9pTnQ1djVYQW5jcDFYKzZHcXB2V1pwbDZBaFd0?=
 =?utf-8?B?c0RqSVB0cnRNaERUQnVWZEx5cjBNN0pKaXBiSjdOMU1WWWxtTlZrVTZRcTBN?=
 =?utf-8?B?bmE2N00xUlRPNXBxZHBCRk9vbXRMZ2tOcGV6bWF5VjM5WmJZbUVrakxneVVp?=
 =?utf-8?B?dEZON2FCeTZGUTZwOVpocURiZHFYNFFDNEJRRkxGc3ovOWRVZFczeDdiNkl2?=
 =?utf-8?B?eEtzZDllQ2ZjQ0xPbFFueUEzbkthUlNSVjJNNGpEMG95TkFOekZRNC9UWUZr?=
 =?utf-8?B?b096d09zclBwKzYyYXA5V0lmbFVFN1luWjlCV0llSzk0Um5RNi9jUk90UWVi?=
 =?utf-8?B?NzRMRGJmVEo2RGtjbGdJcUw4MEM3UzFzT1RLRERQTmp0dlNjdjMzdFl4dllG?=
 =?utf-8?B?VjV4K0hPR1dERkkxamd2MmVMREI3UzFONFlKQXdBUDBmeE9HazRScklJRW14?=
 =?utf-8?B?d3dUQVExSzZVdTlqZlNQMW85V0d6ZCtvc2RXRUg3NnFtdTg3OEpTenlVTzBh?=
 =?utf-8?B?VnZtQmNWWUdlU0dxdC9xSXNTdEhwL0hGSTdpQTBZMjB1SkVFTUxmZ3A1amJF?=
 =?utf-8?B?eldkdEw5T1dlcExWd3JjbWFxRXh6ZnB4U3FNZGwvVHNQL0QydjJyK1RpZ3F5?=
 =?utf-8?B?aGxFQzFzc05WdlFmdStqTW80czIvd2Y5ZEpWY0NtaDFma252RUlQOTZKNTVC?=
 =?utf-8?B?RDBYRGR6UWF1MW4vdnpRZ2JKZVNiakhxZTU0MjdvZDd2VlR2Q09uMzg4aHVR?=
 =?utf-8?B?WW14d0lyOERzaVpHT2trMFgrUzRPVDVWWlFSWWRjZnI3d0ZyYkdzb1R3akM2?=
 =?utf-8?B?S3h1ejB2U0J3UUtjSmk5V1BBM0NmU3ZHaGU2Q1EvRk9vUFNQc1N4ZVl0TDR4?=
 =?utf-8?B?MkZxWFBpZ2hNcGIvZW1GT2h0RjAwYTVKTHBYRmRpVnNJOTFOMWdsRjQ0K3FZ?=
 =?utf-8?B?Y3FhRTlZQkpUU2xMSXBzc09OOTlkS2RobVJBWU5sdXc4cHhkSHJmTkRnMjVR?=
 =?utf-8?B?QWJTRW1sSFQ2elI0UmVxY1g2UjRQallTSWFuWGNnYmJrYkc5eFU4SWFIRnZY?=
 =?utf-8?B?ZG8wNlJzWGM3QXI2NHFjR3BMQWtFUWZYWHRjbkk1Vnh5cEwydVFSUnJiWmhs?=
 =?utf-8?B?WVBXRWFtaE1hTzBrYzFUNElhbVB6dThOMWhMclA5UVc2R1MwMFVoMWk2ODBF?=
 =?utf-8?B?RnhoUDdJeno2ekhQZG9pV1ZZeEN2OTErdW43Sjg4eFp6b0h6UEcrMHExVmRB?=
 =?utf-8?B?R1NjeWFvS0NlWWcrSVFLZFNMN3Z0YWpubWRvaXN4WVFVL3JoNDdDbFFmdGNn?=
 =?utf-8?B?Q2xZYXFKdTRRcW1JMnh4RTZoendEcW90dnhGUGhxZGVHMVJhd1kyR09aOVhm?=
 =?utf-8?B?ZTlUTHhtWE15SDZqa0hXWEFSUm45aWpqaStwRWdZMU4rRHhlZW85ZHFvUCtD?=
 =?utf-8?Q?pyp/yKLF5RkxoqzNJGqbVolpF?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d524f361-9ba4-4ac2-72f7-08ddfd5d1860
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4127.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2025 00:30:45.2174 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9CK6ophGHtvZxhY4E1hp1ZizwdJb0ohrO6ZWXchrdYCY1LYQ1UK11X326cXIxi1Jc+nkbYIekfUEesFI5Q0CLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5818
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

On 9/26/25 6:05 AM, Danilo Krummrich wrote:
> Meanwhile nova-core depends on CONFIG_64BIT and a raw DmaAddress is
> always a u64, hence remove the now actually useless conversion.
> 

Because I'm already here and have at least mild OCD, I'll suggest
saying it like this:

"Because nova-core depends on CONFIG_64BIT and a raw DmaAddress is
always a u64, we can remove the now actually useless conversion."

> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---
>  drivers/gpu/nova-core/firmware/gsp.rs | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Either way, it's clearly correct, so:

Reviewed-by: John Hubbard <jhubbard@nvidia.com>


thanks,
John Hubbard

> 
> diff --git a/drivers/gpu/nova-core/firmware/gsp.rs b/drivers/gpu/nova-core/firmware/gsp.rs
> index 9b70095434c6..ca785860e1c8 100644
> --- a/drivers/gpu/nova-core/firmware/gsp.rs
> +++ b/drivers/gpu/nova-core/firmware/gsp.rs
> @@ -202,8 +202,7 @@ pub(crate) fn new<'a, 'b>(
>                  let mut level0_data = kvec![0u8; GSP_PAGE_SIZE]?;
>  
>                  // Fill level 1 page entry.
> -                #[allow(clippy::useless_conversion)]
> -                let level1_entry = u64::from(level1.iter().next().unwrap().dma_address());
> +                let level1_entry = level1.iter().next().unwrap().dma_address();
>                  let dst = &mut level0_data[..size_of_val(&level1_entry)];
>                  dst.copy_from_slice(&level1_entry.to_le_bytes());
>  
> 
> base-commit: 299eb32863e584cfff7c6b667c3e92ae7d4d2bf9


