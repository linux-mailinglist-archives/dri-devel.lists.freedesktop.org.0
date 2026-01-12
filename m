Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB359D12A4C
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jan 2026 13:57:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CABB10E3D1;
	Mon, 12 Jan 2026 12:57:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="BHxmYFRb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012037.outbound.protection.outlook.com
 [40.107.200.37])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76A4210E3C9
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 12:57:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vXGIi9h0bWjaH3Qx4FxXpfVZxr2JQEARUES5qhGmheoY7C8e6fCp6fQE3F5pYCVJeP981krYWw64GIKM5wAZEYaXznY3en7m6VdoRDjsQnTrJPSVBZ/15DQ3Ef0byLHtMpKqWq8Wfq+bLciCHq15ynmdQ8/+v2w6GZc2p2MVtvbAZyZdUKokQun3CzPgcmzAwPGuht92MxdRiVh9oDpWtJlLC650YjCcRG+MBtDpdhPD6n6/HhoUJmlORfj138McrH/LvVV9NCpXt2hiDcIiw+CATiD45nz+E5iv7XZGncXNCoWCKyEgfmR6k6V4m7bIqVMcqo38zXhNHiw3YORoyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rLjUNo9dkxzOMTr3V/+okjE/ImbZ3unc7tYC9NfInsg=;
 b=WrrNsV1mWDDI+x0jqFk4mcF+C2DonrfHxbXvkLkwVF/NBu1trrpFhCCyl1wW6aUsHZ6T4Lr81Pq/yeESAQg2eAts0zSmjB+l/2uekIGT9YTYUke/jl4EVt2y25T+Nv1NdsJcmPomGSowPUXRWN/adTY3L9in5/e8OZK6gmEyJ7dY8EqA7KBFC4/a9tVQNQYaa6hlJGz06sU77OdtJmat47uKsVk2YZa2kaVU93EvGo8mcQSulXKVWLxaT8bbkrJ7S8MXVXghlYI7Lz7o45D6zHszfYocFhC6nvuBQnVnsDts+YQaMpLBJhYoHuuwa9to1j8kJ1vVdVWAHSyGAkVQdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rLjUNo9dkxzOMTr3V/+okjE/ImbZ3unc7tYC9NfInsg=;
 b=BHxmYFRbYtd3O6VPH5GFvRHNUIL/dbgQFBvapu5rMTNDo+HDvAsEsICgY41p3gZERRb4m/B7JX7piPczw5sY0A8bzM2MD3fDOEMTtvYgfIWX/S9mBoN8D4eKTmtdBSegEko02zsovWchXM9e8yyXcT4cyc7WGyXBh1iM2P0G9d4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by IA1PR12MB8556.namprd12.prod.outlook.com (2603:10b6:208:452::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 12:57:31 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9499.005; Mon, 12 Jan 2026
 12:57:31 +0000
Message-ID: <2db90323-9ddc-4408-9074-b44d9178bc68@amd.com>
Date: Mon, 12 Jan 2026 13:57:25 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] dma-buf: add revoke mechanism to invalidate shared
 buffers
To: Leon Romanovsky <leon@kernel.org>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, Sumit Semwal <sumit.semwal@linaro.org>,
 Alex Williamson <alex@shazbot.org>, Kevin Tian <kevin.tian@intel.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, linux-rdma@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 kvm@vger.kernel.org, iommu@lists.linux.dev
References: <20260111-dmabuf-revoke-v1-0-fb4bcc8c259b@nvidia.com>
 <eed9fd4c-ca36-4f6a-af10-56d6e0997d8c@amd.com>
 <20260112121956.GE14378@unreal>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260112121956.GE14378@unreal>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN9PR03CA0169.namprd03.prod.outlook.com
 (2603:10b6:408:f4::24) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|IA1PR12MB8556:EE_
X-MS-Office365-Filtering-Correlation-Id: fe66e768-90d3-4482-f2af-08de51da25a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M3VpN24vTzBlSHBVNEx1U2FHNjB6UkVRdVEwNHJjd3VHMGw5SDlSTEYrZzY0?=
 =?utf-8?B?ZGJFdElJcTN3cGQrQWpIRTMxbkltYjExL0MzYVhSOGNqTUlHa0gzUjdINGh1?=
 =?utf-8?B?UEVMVUhDaFlpamxyRnhkUTRVT3dFajZ0VTY4L214NFZIRE1rR0MrUkE1Z2N3?=
 =?utf-8?B?U0RHWnZNUG9TZVVCOC9sc0wxcHdRUnF3U0JYRSttQ3BEdHd1a0ltUGRkdVVJ?=
 =?utf-8?B?dU54SC9BNnZEaHhMbDk3VzZBL2ZTRjNOb09admFqb2xhak5pa0N0RGxIQnRl?=
 =?utf-8?B?ZXhpWk1CM21xek53bHhnVTlOcVdZbHkxcXo0MWt2bWtNWXdSczBBazE3VGVS?=
 =?utf-8?B?emx2TWRWUE5FNUYvd2RWMlp5aWIweDE1MHdaOVhPRjFCSnVhZXM4MkhuTVNF?=
 =?utf-8?B?cXpsWGJMY2lGMVRDRkIwN21mVWxtT1IzbnlIeEVFZHVCbURnaldEdllITG1T?=
 =?utf-8?B?SjJvODF0R3R3bm50Q3B6YWhYS0JaMlliT3FOWExlL3ExTGFWQW9MSC9CSVNP?=
 =?utf-8?B?aVpwb1pZRlpNOXJ4STFxRGx6WldFb3FVc3ZFMmRmMkVRRHpleXp2U3hmUTZI?=
 =?utf-8?B?bDh2d3ZFblpmMU0zRG9QSTBsbUpTMEpKR1dVb3I3WE5Rc0I5cjVNbkE4dTd3?=
 =?utf-8?B?R0hvc1FVMVJZM3pYZ3hNaWRBL0xlNmRVdnFuU3pTYnpPTUd4M0ZzM1pMVUZx?=
 =?utf-8?B?b29vRGp5QkowMm1PdW5MaGJLM3dtVjMxdDcyU2NYckZmbHFaSERKZWJjS29J?=
 =?utf-8?B?WThxa2NlaTgzR085bEkxQUxMeForc0YycXRoeFU4aUxlRTIxeXhyQk8rMGxl?=
 =?utf-8?B?d3hEeERxMTVTcHpNUlZZQzBKNE1uQ2dlUzNSN2d3QnIrYVBPZWF6NmcxTHRR?=
 =?utf-8?B?NU9CWDJPWDgrZ053R0J3ckVRb3h1ZUJMTG84MmJMZHk5WEJIRzRycUF5cXhC?=
 =?utf-8?B?dTdDbnBxdlBsR2FTcEpFdkhFTEVpMzlmRXU4cnpKSC9CcFJ1RVF6R3NxZ2Ju?=
 =?utf-8?B?WTNkcms0aHQyaGlrY0VHbEJLclZ2K2xjajFIUFM4TUxZNTNPYlMrRTVEdnJL?=
 =?utf-8?B?ZWRxYmplWkY1cGdlMGRYaGxnb0xlQWNUd0grZ3hNd0RDSUErdFBSSkZWekFI?=
 =?utf-8?B?M0VmMExBSXFndkhNclVlOXJ3VkZUT1oyNDUyVVdIT2IzKzcwSjBWRzV2RTlN?=
 =?utf-8?B?cHY4bzF0cEtubklSY1hndDcrNUcwcFk2TTY5dUF2WjBmb01haDJCV3BaT2Vm?=
 =?utf-8?B?YjBjNWk1RU9UWVdENndEZktSMXd6aXlSeW9QcVJ5TlhjRXA4ZGp1VnU5dnhR?=
 =?utf-8?B?ajFQdHF4SGdYV09WR1hhNTdoU1p5VjB0NTBsR05jcGdGZ3FoM3RKaUlqSFRF?=
 =?utf-8?B?Z3dEc2lnazUxR1J0MVJyY0ZtaEQ3RElrb09kYmYxR3JtL0kyTHVua3NISmMr?=
 =?utf-8?B?a0JYSldoTTBGZ280MFFKblNuTGRmYXB0WVpqUHdBUlRkcUttcERsamNza1VK?=
 =?utf-8?B?V3FyS2hKa2Z1a2lzbVkzOUFaZWdiMEFCa1k0Y0N1Vm95UDBWb0FXTWM0alh6?=
 =?utf-8?B?aHNKZ0txVWc5ZmdCaTZWSlVHVm1TVmI0NmZqbWZMTVMxUmxyejJEbWY4c2VS?=
 =?utf-8?B?SnJ1Y3VkRWIxaWxRWkljbk15eXZLdWZKTmRSL0pMS3Z2SWVZR3czYUJXZ1VV?=
 =?utf-8?B?OXlkYlJrYUd4aXF0enRUU3JHZk4zK2V0RmdDVXhLRm1SSDk3ZjE0R0JoUU1n?=
 =?utf-8?B?STVYRmZlQmJuc3dsSmtHRlBHY2xSZ2JmcHF4TjlIQVRQUGxUQmxjdllaVDFG?=
 =?utf-8?B?dGxIYmpZZEgyQ1BJTUFCbHFQSkhUNDk5d21QcnlZUEg3VlczYVhMVjE3czQ0?=
 =?utf-8?B?TjQ5QXVFOGkxMFBOWWdjUGRmcVRFSHpmUVVOeFRLMkNrc0Q0bVgyTCtNUFVI?=
 =?utf-8?B?QzhnZWhCYmFwTWNHTzZ1UUhycGN5d3o4TjdRNmRZRGdiN0ZrQ0VtdUFVQUNs?=
 =?utf-8?B?dFI4TkZMaUt3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R2UyemtmN3dFZWVtZ0xPMjgxbS9yZXlodmNoTmJib2tjR2oxWjZTQWpEdDk0?=
 =?utf-8?B?UWFBbmpEd1ZwbDl2ZWQzV1dzcnNFQnNka1ZzWjVjTDJmbnpFSk92WkkvUUE3?=
 =?utf-8?B?YlhVT1VSWHlkeFRvclpvMThvb2dudGpJM3g0cXZhNEIvZXZ1TGZGbjNhQXJ0?=
 =?utf-8?B?cU5zaWlyQXQvdytaM3hvaVQzMVZ5cDZvenNvdmJXSkcyOUpTVlNqbzNQQjFZ?=
 =?utf-8?B?azZiYlhqZ0RFZkl5RFFnNThCUkhMbWlBNzJLSjdndmJ4V0RHbFFDQlhNcGY5?=
 =?utf-8?B?VkxWSk5ta0Zzdm5FNE8xZFRDeU1jZ25haTlIL1A3dHhYdG40U1dDZ0Z6L05k?=
 =?utf-8?B?dTd5N1o3Vk5mNmxXRlo4MXVSSHdiSUQxV0pOdlJZc2RrMWNJbUg5Z2VzUnFH?=
 =?utf-8?B?b2tlNkIvb2NTVldWUEN2dU9YbVZJVlQ4aVVuejVxbEVha1JoL0xkQzVhVDVI?=
 =?utf-8?B?YmdWSUpCZVRxTE9NUkhSOU50dDBqbUZXRlk4SmVTS1U4NXlYL1VrYUR1UDJo?=
 =?utf-8?B?d2RUM0JoRkdKeGRwSEJmMnZVSU1IWjNRWTd5dWl3QXJwcWRzUlhPMmVuN1l2?=
 =?utf-8?B?ZktqT1FXZGRhdnovRSt0MU11L09Zc0h1c2dpai9WZkJCaWwvbkVFSXRzZVA1?=
 =?utf-8?B?NC82RnRNcU1MdFVvYnJOZzJRNlJXZVJla3k3Z2MvbGdkckFqM09Hbk1XVXpM?=
 =?utf-8?B?RkpIQVBOeHQycGdPdmFIR1IrUy9WWnBTSHlhTEhUeFVMRGkvcXVXdTdGQnFH?=
 =?utf-8?B?eUNoK2tncDJBN09CcDcvT3BzNTA2ckZCODlOc0JyMWpUNkh2MTE0eXRKeUxS?=
 =?utf-8?B?SGMrcW4rcHBaVnZkalkxR3ZGQ3FBYVEvWURHNDZsM2Mwa0Q5U0phUW5SVmFL?=
 =?utf-8?B?RzhxaThtQ3JhbXpYU2NyQXQzalk5b24rdFJRZ3BsRDJZUDJNcDkrSTgycHVO?=
 =?utf-8?B?d2JkWXRhWkNDK1cxSVJUcms4ZzQydCtSejlaRkJNZklxOUJzZHFXK3FjSVRI?=
 =?utf-8?B?YTRJREtpRXZLUkVJekRqOCtFd2ptVXhlT1o3RVhqOWhSa0JFVGFiT3JUVXB0?=
 =?utf-8?B?Ui80UEdYdnluVjdSQWdITkdPMEZHdU0rcHJySGpHV3JuODBNUGhwOG9KcktV?=
 =?utf-8?B?UHpsalc2NjZBSFJOV09wL3BvMEJlZTErRmF6dEtpMy9tTEhhUXY3aVQyR1ZO?=
 =?utf-8?B?L1JRdlpKOU4rMzhrL2hSYzZVcStUWGNLYkxoS0ZhWWJvRUwwaFQ2M3Z4eDVH?=
 =?utf-8?B?RUxUUUpBNEJvd3FpSkpsOWdwY2JjWVJHaFpYZUpLWFNBZnlHVXBsVWVtZE92?=
 =?utf-8?B?U2xGRzRqRzFndDVUcDcrcElvUmR3OVJ5QlAxcWZjb3lZY09jcWQxVmF0aGFO?=
 =?utf-8?B?UDBQYUM0bk11dFIvSkJCTVpFSm1TZDNJc3JMbEVwanRJTFNsYWRzVGIxeVVj?=
 =?utf-8?B?RGtpb01ZckFFMEV5cVROM3RCcy9FMDRZcEdJQWtUVHE0ZE1YL0tYenN2cTJr?=
 =?utf-8?B?OENWMDRCNzRNV1p0cTFYVEk2L1lSaEhibXByeVdONzRSSmVwVUM1U1dBdnVP?=
 =?utf-8?B?b3J1TWFCRTVPMHg1eVo4eFIycnUxRFI4NGkvV2lkNjYvSjZaQWlHVWYwalVs?=
 =?utf-8?B?bTVFeHFOaTE1TU4wTXI2WG1JOUYvNDI4VW5OZXFCZisvemRuMnBNOUFTU0V3?=
 =?utf-8?B?d2RVK3ZDOW1MY3pvR0J5NWcxTjZHNndiajVLWFNjVWtpT0RPbGV0MmRLMnYr?=
 =?utf-8?B?R0RCRVpzZ1pSNG1yTS9iTzVJWXFvZjdTdGVmRDZWTTR6Ny84OUhpenkwdXlI?=
 =?utf-8?B?QTZUSzQ1ZFlleHpHcHVBQWxsRkwrT0dmTm1hcmRjTE1TbVBRMHhPLy9uZkVT?=
 =?utf-8?B?bGhzUWVyNlRpbWRvczRSTjN2bEhvNEhtME9taC9xUVV5WTBwQkROblc1Mjcr?=
 =?utf-8?B?WkdBamZpZFVrRExPMHBmVUNwUWlONWUvOXYwcVhTb2FobTRWcmUvZWJ6S1Mw?=
 =?utf-8?B?bHZJY0ZpL09BUmRlV0RVR1E0bzJUOFI3a3ZvK1crOXZYWkRub3JETnRkL2NI?=
 =?utf-8?B?S1hHNm1TZE1wZ0ZBd0t1MWlQUDN2bDl6TXlNRjBEbFloc1B4V3AvYWNtZlBl?=
 =?utf-8?B?elVkRVR6MVlxWkI1LzVHN3JuQzRwcSsybXNyNFh5eHIrL0FxOWRib1ZJZTZQ?=
 =?utf-8?B?MmVneGwvMXZzYUdWQkJlV28vNXJEeC8xNE1FOUhsOTdNblVwTjhEanIzUUlq?=
 =?utf-8?B?UU5oZVcrSkJZWGtySzA1RS9LSVRzN1dSaDZWUEVTclVsOWt3OUltc2grM0JZ?=
 =?utf-8?Q?PxyOoxKmUMFRFWdz3t?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe66e768-90d3-4482-f2af-08de51da25a9
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 12:57:31.4820 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t3EuvewG9tqGAwR5tjS5gJsusd9tW4tiIXOmqJY5BqdD+BPcsznqh4JuK/Z862X7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8556
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

On 1/12/26 13:19, Leon Romanovsky wrote:
> On Mon, Jan 12, 2026 at 11:04:38AM +0100, Christian König wrote:
>> On 1/11/26 11:37, Leon Romanovsky wrote:
>>> This series implements a dma-buf “revoke” mechanism: to allow a dma-buf
>>> exporter to explicitly invalidate (“kill”) a shared buffer after it has
>>> been distributed to importers, so that further CPU and device access is
>>> prevented and importers reliably observe failure.
>>
>> We already have that. This is what the move_notify is all about.
>>
>>> Today, dma-buf effectively provides “if you have the fd, you can keep using
>>> the memory indefinitely.” That assumption breaks down when an exporter must
>>> reclaim, reset, evict, or otherwise retire backing memory after it has been
>>> shared. Concrete cases include GPU reset and recovery where old allocations
>>> become unsafe to access, memory eviction/overcommit where backing storage
>>> must be withdrawn, and security or isolation situations where continued access
>>> must be prevented. While drivers can sometimes approximate this with
>>> exporter-specific fencing and policy, there is no core dma-buf state transition
>>> that communicates “this buffer is no longer valid; fail access” across all
>>> access paths.
>>
>> It's not correct that there is no DMA-buf handling for this use case.
>>
>>> The change in this series is to introduce a core “revoked” state on the dma-buf
>>> object and a corresponding exporter-triggered revoke operation. Once a dma-buf
>>> is revoked, new access paths are blocked so that attempts to DMA-map, vmap, or
>>> mmap the buffer fail in a consistent way.
>>>
>>> In addition, the series aims to invalidate existing access as much as the kernel
>>> allows: device mappings are torn down where possible so devices and IOMMUs cannot
>>> continue DMA.
>>>
>>> The semantics are intentionally simple: revoke is a one-way, permanent transition
>>> for the lifetime of that dma-buf instance.
>>>
>>> From a compatibility perspective, users that never invoke revoke are unaffected,
>>> and exporters that adopt it gain a core-supported enforcement mechanism rather
>>> than relying on ad hoc driver behavior. The intent is to keep the interface
>>> minimal and avoid imposing policy; the series provides the mechanism to terminate
>>> access, with policy remaining in the exporter and higher-level components.
>>
>> As far as I can see that patch set is completely superfluous.
>>
>> The move_notify mechanism has been implemented exactly to cover this use case and is in use for a couple of years now.
>>
>> What exactly is missing?
> 
> From what I can tell, the missing piece is what happens after .move_notify()
> is called. According to the documentation, the exporter remains valid, and
> the importer is expected to recreate all mappings.
> 
> include/linux/dma-buf.h:
>   471          * Mappings stay valid and are not directly affected by this callback.
>   472          * But the DMA-buf can now be in a different physical location, so all
>   473          * mappings should be destroyed and re-created as soon as possible.
>   474          *
>   475          * New mappings can be created after this callback returns, and will
>   476          * point to the new location of the DMA-buf.
> 
> Call to dma_buf_move_notify() does not prevent new attachments to that
> exporter, while "revoke" does. In the current code, the importer is not aware
> that the exporter no longer exists and will continue calling
> dma_buf_map_attachment().

Yeah and that is perfectly intentional.

> In summary, the current implementation allows a single .attach() check but
> permits multiple .map_dma_buf() calls. With "revoke", we gain the ability to
> block any subsequent .map_dma_buf() operations.

Clear NAK to that plan. This is not something DMA-buf should need to deal with and as far as I can see is incompatible with the UAPI.

If a DMA-buf can no longer be attached or mapped then the relevant callbacks just need to return an error code.

Existing mappings can be invalidated with the move_notify callback and that functionality should be sufficient to prevent importers from accessing the backing store.

Existing attachments should stay around until the importer drops their usage.

In other words the exporter can't force an importer to drop their attachments, that would be a violation of the UAPI.

Regards,
Christian.

> 
> Main use case is VFIO as exporter and IOMMUFD as importer.
> 
> Thanks
> 
>>
>> Regards,
>> Christian.
>>
>>>
>>> BTW, see this megathread [1] for additional context.  
>>> Ironically, it was posted exactly one year ago.
>>>
>>> [1] https://lore.kernel.org/all/20250107142719.179636-2-yilun.xu@linux.intel.com/
>>>
>>> Thanks
>>>
>>> Cc: linux-rdma@vger.kernel.org
>>> Cc: linux-kernel@vger.kernel.org
>>> Cc: linux-media@vger.kernel.org
>>> Cc: dri-devel@lists.freedesktop.org
>>> Cc: linaro-mm-sig@lists.linaro.org
>>> Cc: kvm@vger.kernel.org
>>> Cc: iommu@lists.linux.dev
>>> To: Jason Gunthorpe <jgg@ziepe.ca>
>>> To: Leon Romanovsky <leon@kernel.org>
>>> To: Sumit Semwal <sumit.semwal@linaro.org>
>>> To: Christian König <christian.koenig@amd.com>
>>> To: Alex Williamson <alex@shazbot.org>
>>> To: Kevin Tian <kevin.tian@intel.com>
>>> To: Joerg Roedel <joro@8bytes.org>
>>> To: Will Deacon <will@kernel.org>
>>> To: Robin Murphy <robin.murphy@arm.com>
>>>
>>> Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
>>> ---
>>> Leon Romanovsky (4):
>>>       dma-buf: Introduce revoke semantics
>>>       vfio: Use dma-buf revoke semantics
>>>       iommufd: Require DMABUF revoke semantics
>>>       iommufd/selftest: Reuse dma-buf revoke semantics
>>>
>>>  drivers/dma-buf/dma-buf.c          | 36 ++++++++++++++++++++++++++++++++----
>>>  drivers/iommu/iommufd/pages.c      |  2 +-
>>>  drivers/iommu/iommufd/selftest.c   | 12 ++++--------
>>>  drivers/vfio/pci/vfio_pci_dmabuf.c | 27 ++++++---------------------
>>>  include/linux/dma-buf.h            | 31 +++++++++++++++++++++++++++++++
>>>  5 files changed, 74 insertions(+), 34 deletions(-)
>>> ---
>>> base-commit: 9ace4753a5202b02191d54e9fdf7f9e3d02b85eb
>>> change-id: 20251221-dmabuf-revoke-b90ef16e4236
>>>
>>> Best regards,
>>> --  
>>> Leon Romanovsky <leonro@nvidia.com>
>>>
>>
>>

