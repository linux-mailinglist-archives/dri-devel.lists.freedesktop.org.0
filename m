Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E8AFA062BD
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 17:56:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A839010E31C;
	Wed,  8 Jan 2025 16:56:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="e2Wb1pKN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2053.outbound.protection.outlook.com [40.107.96.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C78F910E31C
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2025 16:56:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q2GUQzfpkwYzU5zW6JlX1Ujfs7eicBiSLFLqRbkccndnOrOMBB+OIXrt1jgQpj5dK0DgED16rKKetCUaovCIlLp2EW8Jb2d48XvwDEI5i92MFjJz+2ki4M+iguHcS86MZU7BP7WiNqz/v7JIqikXJ5ajlgt5Km9zBiZu//lQGLqGFWPIse07swcpPcMojXc7cd0Uv3GeybREjeHgHZBpnBnFRq32I0C7ex+R/fErMmAEoiRk62pxKpvNRk3xxwqRD5SiOxIJBiGXmOw1CmZIMNyumX7FcfrrRwJgEL2ZjQR8WTKmNq2r+A+b1jbKLQqZikFPLztqEQLDK1u9taMFAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5GesDgy0BNBWQ2W8iEqHsc7GO71w5C30Qiby8vVgc8Q=;
 b=cCBFelm5hwgD9ck1sRhFdIwHUi8Jk/NGK6J3cbXAouYFr2Jx1oUlxgM89msHTjU087Y2oKEJy5MN8a2CjeFpAxDoba9AerFkM73Ky5iefi3Hzse0EYXDW4NSZoaLIv0jNQYuSRItuyPcnSiu3BIyFzkG2iJdeAi1dk4SsoAlmoVfQNbSBxbRrOUUrb0J8rbaiPDPOLjX1wlMI8KSRAYxIdhzVAByXXcdXtk9kW0RkFK82MFZRgTIpZdUyCj9dsOop22MB8OOIxIVa3XpvZn25IjX2pfpRfIXBRCOtPFMimrDXYsQFDkYAXIVXyXEWjm/CH5r42V5HEn5bExeYw08IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5GesDgy0BNBWQ2W8iEqHsc7GO71w5C30Qiby8vVgc8Q=;
 b=e2Wb1pKNG5ooPa2wli80ohT1VigVzIwQbaht/n/fFWfaSDE40ciW8cDDXa0jqKlH7sD0fUItEyoS23A69yGYXwkq00DH2jfAb5giDlHA3ShBUmJr6r0ZyZpUjNlzcgZwbjptxODOJssqCOAhSULNOwmfZFgDjVWRa+o7gK4QHs5QgAzMh8QeJ0eDsNc1cgVF4+GVO6wJrUpV1nlI03Repb9Q4vWSoXkPLJrmPFGRNZCvYdmLPeCXrtZxRKvjumDef6TO0fumNpeWlHzI7BtGjwRCj2aC6BKRtIKXWgZtgFCnHbtgF6v0dz30m/68YltGyKd++f4YpIF/q6NwitzOsw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by CH3PR12MB8210.namprd12.prod.outlook.com (2603:10b6:610:129::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.10; Wed, 8 Jan
 2025 16:22:29 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.8314.015; Wed, 8 Jan 2025
 16:22:29 +0000
Date: Wed, 8 Jan 2025 12:22:27 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: Christoph Hellwig <hch@lst.de>, Leon Romanovsky <leonro@nvidia.com>,
 Xu Yilun <yilun.xu@linux.intel.com>, kvm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, sumit.semwal@linaro.org,
 pbonzini@redhat.com, seanjc@google.com, alex.williamson@redhat.com,
 vivek.kasireddy@intel.com, dan.j.williams@intel.com, aik@amd.com,
 yilun.xu@intel.com, linux-coco@lists.linux.dev,
 linux-kernel@vger.kernel.org, lukas@wunner.de, yan.y.zhao@intel.com,
 daniel.vetter@ffwll.ch, leon@kernel.org, baolu.lu@linux.intel.com,
 zhenzhong.duan@intel.com, tao1.su@intel.com
Subject: Re: [RFC PATCH 01/12] dma-buf: Introduce dma_buf_get_pfn_unlocked()
 kAPI
Message-ID: <20250108162227.GT5556@nvidia.com>
References: <20250107142719.179636-1-yilun.xu@linux.intel.com>
 <20250107142719.179636-2-yilun.xu@linux.intel.com>
 <b1f3c179-31a9-4592-a35b-b96d2e8e8261@amd.com>
 <20250108132358.GP5556@nvidia.com>
 <f3748173-2bbc-43fa-b62e-72e778999764@amd.com>
 <20250108145843.GR5556@nvidia.com>
 <5a858e00-6fea-4a7a-93be-f23b66e00835@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5a858e00-6fea-4a7a-93be-f23b66e00835@amd.com>
X-ClientProxiedBy: MN2PR14CA0012.namprd14.prod.outlook.com
 (2603:10b6:208:23e::17) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|CH3PR12MB8210:EE_
X-MS-Office365-Filtering-Correlation-Id: 6281252e-5ad8-492f-e7ae-08dd3000a547
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Um1CajQyWmVVYVFGU0srV1VlemFCaEJraWtUdmpvZWQ0Q0cvdzJWNGxlOW1Z?=
 =?utf-8?B?cHVoaFFXRldpM0tKQnZOVE9XRkI2dEdpVzZhM3NNSHN3d0dkU29kOTJVeHU0?=
 =?utf-8?B?aWloYXdQYU5vZm1ZUmFaekNsTDZQOFRGM2hWQ3M5Y0plNTRjQW83YkZWcjJG?=
 =?utf-8?B?SDQ4QkFBNTFRelYvQlEybmZxTmkxUVdla0tTQ2E1dXpvZVk1VytnSTgxUFhC?=
 =?utf-8?B?WnpqVjJ1ODh4K3pjcmtqTTdwQUxtaWNEZGU4TVN2UDRJTnorc1dvWUpJdnFm?=
 =?utf-8?B?RzBzdE1hKzYwRWlZWjF2OTluUVVWd1kzMG51cnI2QXBmeXZGNVdjYTI4R3o3?=
 =?utf-8?B?UEc2ZUMwaXF0SjJTSHJKZzBvY2ZqTUtnV0ZZeUVrL1pJa2lnL3RVR1U3RGNo?=
 =?utf-8?B?KzQ0NmpkVGwvUGZaMklEL3JmMGcxSWlWQzY1azRBZHZFWU1tVHVaVS9pbXVK?=
 =?utf-8?B?R3BJdVVIc3g0T2lRbHpVMGt4SDluem5sWU90RnVMRGFRQ1JXaGJzY3dGSnBj?=
 =?utf-8?B?ZUlWWXludkJuQ2U1L3ZFRGlWbGZqK3JCL21peDJKclFPMDMyRU9tUGUrQlB2?=
 =?utf-8?B?R1VTTXFwQjhxQUhWc2dKSWk5a01mSm4xV1hjV3RFYjZ0eHk2OTlldGRBYXhw?=
 =?utf-8?B?djRtMW9RRkhrWUdndCs1NmVzUURSNU5KU0pkWTlJdVlhR3IyRzF5MEVCcGNJ?=
 =?utf-8?B?ZVVsQzhkNEpJaTdCMGdyN21yZUIvQ0Jxa1ZIL3BmS05CSGN1M2ZsN1l0d252?=
 =?utf-8?B?VXQ3Zk5nN0ltL1FTVVNTeXdsczFvRFZSQ3pycEVIL2x3WlFSOEZnRVl6a0lN?=
 =?utf-8?B?SHBSejlLOXFtblRHUnVSS0JWVkwrVnJCTVIxNHdETyszMkRPbFBhY1FyWXh6?=
 =?utf-8?B?VUxCUnh1bHdCR3NZMnlqRmk2UFpBUHNDN1IzY1RXcjJRbUFwbEc2QVh5SlNW?=
 =?utf-8?B?R1RqVjRHWVFKMDVyK0F3ZFQwYk1HRGpRTFZZMzlrWTh2VzRtamtaMzRGSFdR?=
 =?utf-8?B?SHpFcjRpb2pWWTc0NzRKWFFlRk0waVNZYkRCTy90R1dxQW9GaUlxc0l3Vkt1?=
 =?utf-8?B?Tkc4THovcHFUOW8vTlcxYVpjQnp5OUdWSHpTTEcwR3JBV1d4eEZsS1FqTXZM?=
 =?utf-8?B?OVBMMVJ0TkgrYVRNMlJGMmpLUHNjR1hQS2I3czZXZnV4aUtHUFBJOERvcnZM?=
 =?utf-8?B?RWJSQ2RWSXJ1VzgrQWxkdVJCemI5b25xR2xQT1Nka29xd3NBaWM4cmp1S0Nx?=
 =?utf-8?B?aTVUdTBjc3hGVVQrYUEwa2tzaFRvcnh1eHYvTkpzY21aZU8wdk1NR0pieCtM?=
 =?utf-8?B?YVJzYWRBUmFOZVBMb2kyN0N5anRvYVhzK29jL3ZuUUpnVHFORytMUFhVeHFR?=
 =?utf-8?B?NnN4UVN0UEJlUC9QNVFKT0VUdlBjRkxmZElzMzNGQTV2bU9XdmJjVSs3MFdH?=
 =?utf-8?B?VUNuOEFMbWh2emtjWndhRnNNeFhtTEdqVWN3M0IxeVVWWGxueXh3cS95YjI2?=
 =?utf-8?B?cEY0TXErVm9IMXlOUjROZDBLSVJFVm45RTAzNXpTdnY5eUNWMFVPV3JOQi80?=
 =?utf-8?B?NHZSdnpmWk5vdE03Y2p6OGlpaHZ5SjFLUkloajUxTTU0U2hsdlZ3RnozR1JO?=
 =?utf-8?B?cFIwbDlpM1pqV2FlMWpJTWVWR00rMmQyN0l3N1hBamNudzQrQmpGbmxhTlZW?=
 =?utf-8?B?djlCSUY2UEwyajF1cWMyL2xLWjZrUVV6bWpsRUxGNHJmUk53NUJiZG9obTBT?=
 =?utf-8?B?STdBRE0rK3M4SWNhVGlwb0dpWUhUb0xpaGRydWw5dXY4VDRid080QklZNkRC?=
 =?utf-8?B?bmY2Qzdxc3kzV29TbUQ3WmVJWWw0MEtpNGNlaUwwNitDQU90YjR2K1NTWklI?=
 =?utf-8?Q?30L18OH6k42u1?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR12MB8659.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZTREalNDTVl1T3lybHp5bVRwWnhXSk1HTlJ2OHFMMThKMzNiRmYvcXdrMHln?=
 =?utf-8?B?d1hrNWVKU0ZoUTdwV3phKzNERGpRSi8zR3I3b2FIb2xxTjNxWDYzSFFzQmZ6?=
 =?utf-8?B?WVd0ZFNIUGxFdDJnMjRzNlZpTkZhNDBtZXU3YkZqKzQ2dGluQ0pWdUFvdXJT?=
 =?utf-8?B?M0NQa2w0dTVtNDZhTHJiOEliN25mOFhJc1d6dGdZRHJUU0wrTUx3MUgwSHY2?=
 =?utf-8?B?OHRaUjEva2MyTlIxbGkwR1BJMmRFTjhwdTBseXFQdldnVG5STTdEWDRtU2c0?=
 =?utf-8?B?Qk9ZdGFybzBSZ3NvRENXZWxhS3hvRmQvOXdOZ1hFdDN3R1Z4Ny93RlI5dFVu?=
 =?utf-8?B?YWlZMXZpR0hpMndEeXI3VkZwZUtURXhRcmJGckF2VzQzWGplYVY4QmJZS1pP?=
 =?utf-8?B?OEFoWjdkTG9YUUFjOU4xMHYrdDRtVEZiRHA0TEo5MU4yOEd5VXZNRFRacVc2?=
 =?utf-8?B?WmZzYUlHbW5zMHNmS1g5MjJKNFVHUHlnR2hjVWZsa0UyVHNmWVRzSE9kQmJx?=
 =?utf-8?B?QU5PQXlhZHNHZmkwQXV5L1ZyRmJkYnRIZTV1cmFkN2xIVlBhTjlURzBNMDRa?=
 =?utf-8?B?NTFpRzB6THFvVWJFKzBrZlVVSWVaQ25yQk5oTmZMM1FnbDlpWU03K2E0cW9E?=
 =?utf-8?B?MkFmKzJESlRRWmpudGpKeEkvWTlhaHRSMXFpZjAwcFkwQlRJVlhYUVJQeW0y?=
 =?utf-8?B?eEx1ZWxPMkRaMWtDVGlGaFFxaGZ6Sjh5QUFNclpWYUJTSjJlR01BV04rV0gz?=
 =?utf-8?B?Q3VxRGtHcVR6QUtTZU1rcEdBKzF2a3EzRlRLUkxIRjZ0bkt6dkRVb1gyYks4?=
 =?utf-8?B?Z0trd3VIampBTzJPNHl1NTk2TVI0Ylc3VWRKR25UTlJCbnEwcVBCZU15MitF?=
 =?utf-8?B?aUx0MWRuMU5IbmJzaFlMa0VBNVhBUWFSMDJiS2R5S2gyM0tkWWMvRHVFeUh6?=
 =?utf-8?B?eFgyUFpLOVVISFVBUG5DeGZhbDhtTXVTRWswTERJZGFpeUEyR2pBY0VoVVFP?=
 =?utf-8?B?cDNlcWN4eFZpcnF2N3ZvWnVQUlMvei9zVzgvVkc5cEdhb0ZxcWJLY0xKdXZv?=
 =?utf-8?B?OWxTMHRTYzR5U1k3NUF5NTF3cGtnaGt6Q1ptSngyMzJIUnN5ekNDK1E3YVdy?=
 =?utf-8?B?NmdESWt5V1VaYlB2Q2pQUEdvRG1IazBCVEZNOGppNU9YOFpHWnllZThNSTJr?=
 =?utf-8?B?MWJrL0gzeWZIRnNBVkdES1BUNDBiN2k3S0hLMWpKRjFkaVRKYVNJZU15bUNL?=
 =?utf-8?B?RVhSeDRvUXNwS00xV3FBbERiMzBJOStETHRyREN0RkdpYWNhd1QxR045MXVm?=
 =?utf-8?B?bFU1SzBUbWNraUhtSTVoREJ4YWZYNVpHVzVVeENCQzNjK0hZMngxOWloSHVS?=
 =?utf-8?B?SUFIUEoxazU2dWVxOWc5ZkdyT1ZFYlFqVnZkZWpzRlZPWXRrWXBJNnVScHhG?=
 =?utf-8?B?cG1JWnBhazA0bXMvemJFdWNIa1VZNHpoL1NBRllNK2tJRGlYSXUvYVd2dDNw?=
 =?utf-8?B?b09iU0xvRERYQ3NjMmtvWWVUVG00ZGFDOVk2dzR6QnhRSnVkTzBVdmV1S2tx?=
 =?utf-8?B?VFQ0MkhWUTJvZ0xveGFLbk1oVU9yUkppVW9QZ3hhcVNhdGF0bDJiUVdpOElW?=
 =?utf-8?B?RXlmQkdpU1FoTm1QekxGMnZmVmZRR1VBNlU0ak9rY2EvZE5IcStNbHJOcjhy?=
 =?utf-8?B?ZVNFbjVHdlJIN0J6ZU9yWmt0eXI2U1BLdVdSenpFcVpQK0wzcUo0eml2N0lT?=
 =?utf-8?B?TGZOTTdxWjRFSFZiUGZpdkxZa2xWTXJLR0tZendleCtiV2VPZ0JwYmloM3RF?=
 =?utf-8?B?S2Z6Z0VZcnFFaWU4NXpTRmlXNmtST2x0SS9WRHNtbGVZd0dWdm43aVVqNlh2?=
 =?utf-8?B?eW5XZSt0U3RSQkVuZ0N2ZGsrVnk0TmVqU2tMUHNuSEo5M1htckIraXpBOFlp?=
 =?utf-8?B?TlFTZTZ6SWMweVdiVXZFVjlSa1dsTmdjcnVzYk5PWjhadzNwRU9rYlRRK2gy?=
 =?utf-8?B?ZlZZQzZMT1ZYZElGdGhCTUV1V0VSdGRCVmsrSkR3TTdMTG1zMTVGRmMrZWlq?=
 =?utf-8?B?MDdHOTlVNUJ1UzdOMHBsa1NzUEYzYlNma3BzUUVFMHBvOFVGRTNXUjR3eFJC?=
 =?utf-8?Q?KvBgU8m8DVum26D7+tnYoq8E4?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6281252e-5ad8-492f-e7ae-08dd3000a547
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2025 16:22:29.0180 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YpFogEqzModddpCOR+VwbFCVUvNj/JA9dmKW7VpLzsYeX6uh+wOWwenWRddCNT66
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8210
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

On Wed, Jan 08, 2025 at 04:25:54PM +0100, Christian König wrote:
> Am 08.01.25 um 15:58 schrieb Jason Gunthorpe:
> > On Wed, Jan 08, 2025 at 02:44:26PM +0100, Christian König wrote:
> > 
> > > > Having the importer do the mapping is the correct way to operate the
> > > > DMA API and the new API that Leon has built to fix the scatterlist
> > > > abuse in dmabuf relies on importer mapping as part of it's
> > > > construction.
> > > Exactly on that I strongly disagree on.
> > > 
> > > DMA-buf works by providing DMA addresses the importer can work with and
> > > *NOT* the underlying location of the buffer.
> > The expectation is that the DMA API will be used to DMA map (most)
> > things, and the DMA API always works with a physaddr_t/pfn
> > argument. Basically, everything that is not a private address space
> > should be supported by improving the DMA API. We are on course for
> > finally getting all the common cases like P2P and MMIO solved
> > here. That alone will take care of alot.
> 
> Well, from experience the DMA API has failed more often than it actually
> worked in the way required by drivers.

The DMA API has been static and very hard to change in these ways for
a long time. I think Leon's new API will break through this and we
will be able finally address these issues.

> > For P2P cases we are going toward (PFN + P2P source information) as
> > input to the DMA API. The additional "P2P source information" provides
> > a good way for co-operating drivers to represent private address
> > spaces as well. Both importer and exporter can have full understanding
> > what is being mapped and do the correct things, safely.
> 
> I can say from experience that this is clearly not going to work for all use
> cases.
> 
> It would mean that we have to pull a massive amount of driver specific
> functionality into the DMA API.

That isn't what I mean. There are two distinct parts, the means to
describe the source (PFN + P2P source information) that is compatible
with the DMA API, and the DMA API itself that works with a few general
P2P source information types.

Private source information would be detected by co-operating drivers
and go down driver private paths. It would be rejected by other
drivers. This broadly follows how the new API is working.

So here I mean you can use the same PFN + Source API between importer
and exporter and the importer can simply detect the special source and
do the private stuff. It is not shifting things under the DMA API, it
is building along side it using compatible design approaches. You
would match the source information, cast it to a driver structure, do
whatever driver math is needed to compute the local DMA address and
then write it to the device. Nothing is hard or "not going to work"
here.

> > So, no, we don't loose private address space support when moving to
> > importer mapping, in fact it works better because the importer gets
> > more information about what is going on.
> 
> Well, sounds like I wasn't able to voice my concern. Let me try again:
> 
> We should not give importers information they don't need. Especially not
> information about the backing store of buffers.
> 
> So that importers get more information about what's going on is a bad thing.

I strongly disagree because we are suffering today in mlx5 because of
this viewpoint. You cannot predict in advance what importers are going
to need. I already listed many examples where it does not work today
as is.

> > I have imagined a staged approach were DMABUF gets a new API that
> > works with the new DMA API to do importer mapping with "P2P source
> > information" and a gradual conversion.
> 
> To make it clear as maintainer of that subsystem I would reject such a step
> with all I have.

This is unexpected, so you want to just leave dmabuf broken? Do you
have any plan to fix it, to fix the misuse of the DMA API, and all
the problems I listed below? This is a big deal, it is causing real
problems today.

If it going to be like this I think we will stop trying to use dmabuf
and do something simpler for vfio/kvm/iommufd :(

> We have already gone down that road and it didn't worked at all and
> was a really big pain to pull people back from it.

Nobody has really seriously tried to improve the DMA API before, so I
don't think this is true at all.

> > Exporter mapping falls down in too many cases already:
> > 
> > 1) Private addresses spaces don't work fully well because many devices
> > need some indication what address space is being used and scatter list
> > can't really properly convey that. If the DMABUF has a mixture of CPU
> > and private it becomes a PITA
> 
> Correct, yes. That's why I said that scatterlist was a bad choice for the
> interface.
> 
> But exposing the backing store to importers and then let them do whatever
> they want with it sounds like an even worse idea.

You keep saying this without real justification. To me it is a nanny
style of API design. But also I don't see how you can possibly fix the
above without telling the importer alot more information.

> > 2) Multi-path PCI can require the importer to make mapping decisions
> > unique to the device and program device specific information for the
> > multi-path. We are doing this in mlx5 today and have hacks because
> > DMABUF is destroying the information the importer needs to choose the
> > correct PCI path.
> 
> That's why the exporter gets the struct device of the importer so that it
> can plan how those accesses are made. Where exactly is the problem with
> that?

A single struct device does not convey the multipath options. We have
multiple struct devices (and multiple PCI endpoints) doing DMA
concurrently under one driver.

Multipath always needs additional meta information in the importer
side to tell the device which path to select. A naked dma address is
not sufficient.

Today we guess that DMABUF will be using P2P and hack to choose a P2P
struct device to pass the exporter. We need to know what is in the
dmabuf before we can choose which of the multiple struct devices the
driver has to use for DMA mapping.

But even simple CPU centric cases we will eventually want to select
the proper NUMA local PCI channel matching struct device for CPU only
buffers.

> When you have an use case which is not covered by the existing DMA-buf
> interfaces then please voice that to me and other maintainers instead of
> implementing some hack.

Do you have any suggestion for any of this then? We have a good plan
to fix this stuff and more. Many experts in their fields have agreed
on the different parts now. We haven't got to dmabuf because I had no
idea there would be an objection like this.

> > 3) Importing devices need to know if they are working with PCI P2P
> > addresses during mapping because they need to do things like turn on
> > ATS on their DMA. As for multi-path we have the same hacks inside mlx5
> > today that assume DMABUFs are always P2P because we cannot determine
> > if things are P2P or not after being DMA mapped.
> 
> Why would you need ATS on PCI P2P and not for system memory accesses?

ATS has a significant performance cost. It is mandatory for PCI P2P,
but ideally should be avoided for CPU memory.

> > 4) TPH bits needs to be programmed into the importer device but are
> > derived based on the NUMA topology of the DMA target. The importer has
> > no idea what the DMA target actually was because the exporter mapping
> > destroyed that information.
> 
> Yeah, but again that is completely intentional.
> 
> I assume you mean TLP processing hints when you say TPH and those should be
> part of the DMA addresses provided by the exporter.

Yes, but is not part of the DMA addresses.

> That an importer tries to look behind the curtain and determines the NUMA
> placement and topology themselves is clearly a no-go from the design
> perspective.

I strongly disagree, this is important. Drivers need this information
in a future TPH/UIO/multipath PCI world.

> > 5) iommufd and kvm are both using CPU addresses without DMA. No
> > exporter mapping is possible
> 
> We have customers using both KVM and XEN with DMA-buf, so I can clearly
> confirm that this isn't true.

Today they are mmaping the dma-buf into a VMA and then using KVM's
follow_pfn() flow to extract the CPU pfn from the PTE. Any mmapable
dma-buf must have a CPU PFN.

Here Xu implements basically the same path, except without the VMA
indirection, and it suddenly not OK? Illogical.

Jason
