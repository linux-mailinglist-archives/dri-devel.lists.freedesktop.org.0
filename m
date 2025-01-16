Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F029A13ECF
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2025 17:07:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DAE410E1F9;
	Thu, 16 Jan 2025 16:07:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="osz3GX6z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2077.outbound.protection.outlook.com [40.107.220.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE65010E179
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 16:07:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hX74YJHEqBE7zCF9SKn7j+yTjuzamFqwmtmr7fBrCw53M4MSew8R+bY/STijsNoL+BfP/F2WqbdxD2GG4DLm4n4w7AzhIUWt+99iujis65JEj9eleorb5bjZ9lMhJ9CoFMakR2TivqXoMrhWTbIhJzsG4mQTbYD2IQjO5sDzgxgEagkxqvrU1/lbTK8HW6dPHFDbbd+tgaaE9X9BE45+kwcr6tVq+xebvSKruirClJ0UWs1rrLAKkfsMCAKpL4WO4CR29ZR/+38MnYH6dfzCTkT2iTY2/O2xSm/GgYEdBZqJJ/fxVcCvOxIw640tv6BbgDC2ibCUlS6nhpQJXWG6SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uw5gZebVobFjkxrFoD615J8Bq97IQ5/RaJdKLdAuqTY=;
 b=pAdNLcEDqt41d7MVOFy6im3rsjbI4ywMt2OUAH4Ql7OnU5tNxnJZJ1/mC73VzxPe6P3FTrybt1ziRbIVT7E4cfUfdX4M+79cbGIgUzgmBg7bCMMn0lwnLiXuJperLMfCJ9QKha/KTDOW6k7JTFuhVp/8fC00gjegKN9VfIFOcAPq8ZO0lxyRa63vMBZ0jcZyec2XQm88OC0pZdLOBiXl8UGEeDCU+ThN6+/+edtb4GEfdTVFpgKWffkTuX+8gm2KLvf5uCgSQy+p7HGgLz85U1IXfuBvCtNWuPwM52Iz1pG3NR8Wz32dZMcHq4F2ox2u2A3TehesAsDpg4F4ppjWTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uw5gZebVobFjkxrFoD615J8Bq97IQ5/RaJdKLdAuqTY=;
 b=osz3GX6zmOL4IK1qrmnmAX3RthBmVr3uthaFjS25+tdxMfeS5YG7iOfRFhSJ2xtgEqJXpxOerE06GBH/62ECP/q+mjNI0SI9+byqY1rLS9GBrtFBOzr0X1lIYVRoPO09ifbVL+IrM5BPdY6DL2rZblwMavpmI9eukQGOQ/++SjUgWumIoffC5biBi8zq/SSQe7JdyuOOtqh0AYKbq/nnPUutMVQTdW8ySmS8DIOsTnX9Bsvw794JesK3gRMDyuaOkrNAsjnFBSrFxadwJu1stWDnfcaf0Y1ReJ6ovHQlW9HfrPy1g8TTr9Ej/2KnVS1tymy4AhpR9SHpbP8oLuknEg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by PH7PR12MB6633.namprd12.prod.outlook.com (2603:10b6:510:1ff::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.14; Thu, 16 Jan
 2025 16:07:49 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%5]) with mapi id 15.20.8335.017; Thu, 16 Jan 2025
 16:07:49 +0000
Date: Thu, 16 Jan 2025 12:07:47 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: Xu Yilun <yilun.xu@linux.intel.com>, Christoph Hellwig <hch@lst.de>,
 Leon Romanovsky <leonro@nvidia.com>, kvm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, sumit.semwal@linaro.org,
 pbonzini@redhat.com, seanjc@google.com, alex.williamson@redhat.com,
 vivek.kasireddy@intel.com, dan.j.williams@intel.com, aik@amd.com,
 yilun.xu@intel.com, linux-coco@lists.linux.dev,
 linux-kernel@vger.kernel.org, lukas@wunner.de, yan.y.zhao@intel.com,
 leon@kernel.org, baolu.lu@linux.intel.com, zhenzhong.duan@intel.com,
 tao1.su@intel.com
Subject: Re: [RFC PATCH 01/12] dma-buf: Introduce dma_buf_get_pfn_unlocked()
 kAPI
Message-ID: <20250116160747.GV5556@nvidia.com>
References: <20250115133821.GO5556@nvidia.com>
 <f6c2524f-5ef5-4c2c-a464-a7b195e0bf6c@amd.com>
 <1afd5049-d1d4-4fd6-8259-e7a5454e6a1d@amd.com>
 <20250115141458.GP5556@nvidia.com>
 <c86cfee1-063a-4972-a343-ea0eff2141c9@amd.com>
 <86afb69a-79bd-4719-898e-c6c2e62103f7@amd.com>
 <20250115151056.GS5556@nvidia.com>
 <6f7a14aa-f607-45f9-9e15-759e26079dec@amd.com>
 <20250115170942.GT5556@nvidia.com>
 <5f588dac-d3e2-445d-9389-067b875412dc@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5f588dac-d3e2-445d-9389-067b875412dc@amd.com>
X-ClientProxiedBy: BLAP220CA0003.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:208:32c::8) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|PH7PR12MB6633:EE_
X-MS-Office365-Filtering-Correlation-Id: c607b858-bfac-4822-ccb5-08dd3647ec27
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UDQzRWhXVitOdWNsQitVb2lkTzk2alJVT3o1eFZ3QmJBRGIvaGwzZm16NGFI?=
 =?utf-8?B?aDI3aFYvYjRhMURYSjVLY0V6R2dma1VaaTAwQW9jeEgzUmlzMXgwajFxZGxK?=
 =?utf-8?B?VTdpM2g4dkl2RXkvQ3E1cUFtS2hzV3YxZ0lpZkd6cWVLTFFsOFkvdUI0WHFZ?=
 =?utf-8?B?OTM1am5rNC9wVzJTUDVXZ3dmOUdHR0MyZTUzT2R0UEJvK1d4MlFXeVdUaXVV?=
 =?utf-8?B?VTFwQUJvSkdyWHZnRjFGUmkzNjIwOUsrQzNwZng4cjdMQSt4MnRBVXE1MXdL?=
 =?utf-8?B?S1NwRzdmbWNuNjhGckxocDhNZ1VrMGlROUVhWTBBdWpGOUhTRTFPaGdYSFhK?=
 =?utf-8?B?QW05YVpJRUNpVWgrTjRBWllncGtJTk5NTGQzV0o5M0krOGdLVnpaOGh5dmVD?=
 =?utf-8?B?Nk5xZ3RST1lRMXN4Wk83M3d2Z1pVUytIc1R3L2x1ZHhuQ3Nrc0VIc2xRcEZi?=
 =?utf-8?B?dnpKSlJlczRBYktSM0ZDb1dSNTJCeUEyUWhWYWMxN2p3RGt5c1JCRFlmMjU4?=
 =?utf-8?B?cjUrNFFRT1N5byt3UGlRVjcvZUdCY0h4UXhPdldMVGt5dS8ySkRLZURMMFlW?=
 =?utf-8?B?eWJVU296UHN2Q3hmRHViVVVSUW5veGtBSktUKzBrUzFSb29XaCs4bXNVcmwv?=
 =?utf-8?B?VVZOc3l2bVVTS2FSL2ZqYS9yeFZGTFJxWHh0RmtOWmVxNFJvcTEzMHRveEw3?=
 =?utf-8?B?ZCtZR0RacXR2VXZFc2dNRkZRWS9uazhXZmovODQzTFhZWDZuVjV0ejRUUith?=
 =?utf-8?B?V3VQY3FwK3BNMlMxdjgxaS9CdUI1UFVHbmxLR1F1elJRbnJnQVJCVk96d3J4?=
 =?utf-8?B?cU1qV2Mzc2lQU0p6RkVNVEVsdThMQldkd1VJRDN5UHJiT0MvcFhPdTBrdFpq?=
 =?utf-8?B?bDkyZVBpZ3VMUHMvTzF5dUMwZ2NRWldoMjRiMDdwOTVhUkR4YllSdVFiU2Fw?=
 =?utf-8?B?TFZFR09uZGxDNzhGaG9RNEdZa25ZNm95ZkQ4Nk5KYkJlbUlyZjZtaEwybnR2?=
 =?utf-8?B?a0Q2bDY1WmtXWkFpcVJMV1p6dWJlNUIyc0xzeEJDOE14OE9QNEZUNHBKdmZp?=
 =?utf-8?B?aXViQnpEOXhtTHEwQ09wbmdSdmRBZTJkZ1BqNnZ2VmY3SDJCRWR2endZL04z?=
 =?utf-8?B?T2FOdXBsbVBLczg0RERKNk9iaXJzQS9OVGVteDFqRk5udElYVG9BRVdFU0ky?=
 =?utf-8?B?UzU4R0x0TnV2WWR4VjlPVzBGSldqb0M3Zy9FbENKUlA5VjZVcWhnSXcrVDVh?=
 =?utf-8?B?WFBVMm5SVmY1Q3dBM3hCdzM3UngrUE9FcjlSMHJHMGIrY2NYMFVrTnBJK1Nk?=
 =?utf-8?B?K1BFc2EyQ2pPN2lISlI3RUI5bHZLYThUNjRVTFZHQnRhLzlLVS9WelMvV1p6?=
 =?utf-8?B?SEg1ejc2bVI2TGVZclh2aDE4WGJ6RXhsZWpPR2ZJNkNIRFZ0dklyb3JQWUVJ?=
 =?utf-8?B?VTMzSXBUbUozRWJxZkZtSFV2cGdzbHVaSUpQYUFFZ1kya3FpajNZMVVOM0ZE?=
 =?utf-8?B?WjdOaVg3SDE5a2czNjB2WVExeXNsUG9PanJzbHNHbzBiV3FHZjZwYjJ0TWN4?=
 =?utf-8?B?bzlVbC8wcGZ4bEZPYkE3dE80eENTN25BTXRwSmZFN2k5NDl0bm9jSEc4QUE1?=
 =?utf-8?B?cGFTamUvNzVNMTlocHZZTGtLUnlIbmQ1NENnQ1VMRitEVUJLQXc0R0FoNnFP?=
 =?utf-8?B?ajlWNitDMURSWk5nVEl1K1ZHK0hKVWNjcnhVY0RHa2JpS0g3ZFRSN2VyZXFj?=
 =?utf-8?B?eTRyV0hRVlBhSzk5M0pmMy84TjBPV1hybVIxazdualRJTXBZK0ZKMWc3Vkkz?=
 =?utf-8?B?L2tXR3NRMDlSSW1ONit1cmZoVG9iTXMySUNGUWt2djlMeTFyS29ieTRPZlJz?=
 =?utf-8?Q?6IiRs1ugeNtlM?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR12MB8659.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RTZtaGVIMWFWZmd1Zm5ZZG5icnFZbDZjN0Z6V2NwNURnNEdVOTJyRmluRVFv?=
 =?utf-8?B?VWt5TXJPV1FSblZIS0h5ekhoTjBoWm5yVEV2c2ZJWUEzVGJaQkQwNVk3WFkx?=
 =?utf-8?B?Qk5MVGk2RExMRFZRbGhqOSticmo0aENHbldEZjVhOWN5WkIyTitDQzB1QW9k?=
 =?utf-8?B?L05zaEpKRks3My9OOC8wS0N1WTBqOGNTbkVwNUJHemthYVZCOS9YbW5rMzhE?=
 =?utf-8?B?bjVBa2lRcjBXVXowUXZucEoyZU81SW9QcDRxbW0rYkRMblpLcDhjWTkwM0NT?=
 =?utf-8?B?LzFNZDJTbDdpOVFLTXBLL05icHl2Tzh5dVd4QlIveDVOMHRQTFNsdlRaYmxS?=
 =?utf-8?B?KzBpS1ZNM0pZWHgxYkhDbTVxQkhwV1dya2pzdElIRUZRN2pnQ0FUcXNhU1hK?=
 =?utf-8?B?VkJzWG9pT0R3YmRvajQyallWTzcvZ1RDa0VBaWMyRjFwNEl0TWhEeXU5TWRh?=
 =?utf-8?B?bG8zVlVKbE1La0xiM3J6R3FJSFcvcVVVMTd3eEV0YkN6NExBM2h5THFYNUg2?=
 =?utf-8?B?SmtEeHJIN2dWWjRyVGpaWHVXWXBzL1ZxQUQrbUVGS1V2N1A2R3pYMUlSMEtE?=
 =?utf-8?B?MVlhNkJpcU12RjlMVVVKM1dJNGFrb2dibVJxM096V2t2Q3loUjRGNUdLT1RD?=
 =?utf-8?B?ZHc4ZWpET1IwY2RQeURrVDdLNUdNK3BLL1R2QWJmSDRRVjlsRjROMnpJVnYr?=
 =?utf-8?B?OFlaZlkva3pGRVVSUEVJaExUZUZMZnFiVEUzM0FtOXlkakdnSGxnWUhRcG1v?=
 =?utf-8?B?LytQUHdOMThKZHRkWEZZZVlScVRMdUdXdWVCY0xKNFBySDMxcTYxZUtSWUJC?=
 =?utf-8?B?a3I4emVrM005eFR4UDBvb2hiVmZnc2ZPK0x6RGlWUGh6b1phL1oydGc0aU9l?=
 =?utf-8?B?emdReUpzWnBNMEJ2eHljM2ZscXRXakhCWU91c044QnJRTkpiWEVlQjhpc0tm?=
 =?utf-8?B?a1JvcTZSVXdORmNsZ1pMSmc5NUQrV003Zk4wQ2JGSVVMVDNtSHgxVWZZdC9r?=
 =?utf-8?B?MCtsODd1c2xycitqR1R6UlJjcjI5elcwZjAyeXY3ZjIzUFhkWHBrNXorOUNS?=
 =?utf-8?B?ZThIUDJPNGNPRm5kdjBqcnJ6bWo1dkU4ZU5GbTlUdHJNVktrSVBFbzVVdmQr?=
 =?utf-8?B?OFdWUU9IdEwzYjlCTnVRb1Z3bStlLy9RbVlXSnk2Nk9SL0wzUGZMcXRDbDJv?=
 =?utf-8?B?bWEyZk5KNEh4MEJIWEpVNzlHM291dUsyNmlpcjI4NFNMT2lwY1pVZExuUVlu?=
 =?utf-8?B?SlZ1Z3htYVlsWnh4N1BWYkJhTVVZWk5ZaXhNVXNLOE1zNFdvdXVZY1htZTkx?=
 =?utf-8?B?MisxSDYxRmVEeHN0ZlBRR0FkQ1RaWXQ0VmJVMU4yQkFKc1dWSXBZY04vTTB6?=
 =?utf-8?B?WGZCcllGM1l3MVkwY094OWp6K0xnWlk4dTNscktRbXVxKzI2UDVHRHh1WjZE?=
 =?utf-8?B?RDVBb0h4ZXEyNVA3Mks2a2NmUXcxVTQwVkNhT3oxYkdoYy8yWThWdGVObTQ5?=
 =?utf-8?B?QWoxcDlubzZTbjdqWVFlM2VVaVUxajFuSFdQWm9WT1RzYmFyOHpEVzNhUnZN?=
 =?utf-8?B?OGs3QkZibDlYY1VKUnFPS1krMVVId2ZuOTdwYlZ4VGxXcmh5bkhaZW8wTmJj?=
 =?utf-8?B?dko5Um1LTkdEYlIwNTNmVWoxRmtTbzEyVnd6aWtYNjVCeTlXS2t2SUFiTExH?=
 =?utf-8?B?YjRnUGNMUHNibDN1VFZjRnJvOGhmMzlMY2I2TDNQMk1kQmF1N2YrWVU1TjN0?=
 =?utf-8?B?ZU4wODR3aXFvSVoyYU5yc2dkUnVTSEVFUmdNaXBjMmJYRndVam41T1NmcVFL?=
 =?utf-8?B?WjN1R1MwQThXaHp6aE81NWhRcnlITUJEWFJrS2NjOC85QTNuOG1ma01NeW5n?=
 =?utf-8?B?TU04TFlDV2xmanZrUVloUjI0UExwamRzaFc4NVZIbTFVbjUwRForcEZVUWgv?=
 =?utf-8?B?R1lCQkRSSm9OZ3dOcEx0SktRSmVjcTF1SEdlb01wSjI5Mis4d3gxclVsRVhX?=
 =?utf-8?B?V0RqMzhiOS9meDB6dDBheWIwbmdwVTh3TDV1TVJiRlBDNE1KakxjMkRqN1N2?=
 =?utf-8?B?VkpOazZNMVdLVHZMYW43dUY0SUxCaStYbG40TitzeVY2eEQxMlh5cU1HN3Mr?=
 =?utf-8?Q?iSMM=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c607b858-bfac-4822-ccb5-08dd3647ec27
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2025 16:07:49.1447 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xwgrVsKx2+LEIs5Q4lvFQV1Dnp1wJ3tXIEuZN1HAbh0Ses44+6TQsFXxsJkzJiVd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6633
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

On Thu, Jan 16, 2025 at 04:13:13PM +0100, Christian König wrote:
>> But this, fundamentally, is importers creating attachments and then
>> *ignoring the lifetime rules of DMABUF*. If you created an attachment,
>> got a move and *ignored the move* because you put the PFN in your own
>> VMA, then you are not following the attachment lifetime rules!
> 
>    Move notify is solely for informing the importer that they need to
>    re-fresh their DMA mappings and eventually block for ongoing DMA to
>    end.

I feel that it is a bit pedantic to say DMA and CPU are somehow
different. The DMABUF API gives you a scatterlist, it is reasonable to
say that move invalidates the entire scatterlist, CPU and DMA equally.

>    This semantics doesn't work well for CPU mappings because you need to
>    hold the reservation lock to make sure that the information stay valid
>    and you can't hold a lock while returning from a page fault.

Sure, I imagine hooking up a VMA is hard - but that doesn't change my
point. The semantics can be reasonable and well defined.

>    Yeah and exactly that is something we don't want to allow because it
>    means that every importer need to get things right to prevent exporters
>    from running into problems.

You can make the same argument about the DMA address. We should just
get rid of DMABUF entirely because people are going to mis-use it and
wrongly implement the invalidation callback.

I have no idea why GPU drivers want to implement mmap of dmabuf, that
seems to be a uniquely GPU thing. We are not going to be doing stuff
like that in KVM and other places. And we can implement the
invalidation callback with correct locking. Why should we all be
punished because DRM drivers seem to have this weird historical mmap
problem?

I don't think that is a reasonable way to approach building a general
purpose linux kernel API.
 
>    Well it's not miss-used, it's just a very bad design decision to let
>    every importer implement functionality which actually belong into a
>    single point in the exporter.

Well, this is the problem. Sure it may be that importers should not
implement mmap - but using the PFN side address is needed for more
than just mmap!

DMA mapping belongs in the importer, and the new DMA API makes this
even more explicit by allowing the importer alot of options to
optimize the process of building the HW datastructures. Scatterlist
and the enforeced represetation of the DMA list is very inefficient
and we are working to get rid of it. It isn't going to be replaced by
any sort of list of DMA addresses though.

If you really disagree you can try to convince the NVMe people to give
up their optimizations the new DMA API allows so DRM can prevent this
code-review problem.

I also want the same optimizations in RDMA, and I am also not
convinced giving them up is a worthwhile tradeoff.

>    Why would you want to do a dmabuf2 here?

Because I need the same kind of common framework. I need to hook VFIO
to RDMA as well. I need to fix RDMA to have working P2P in all
cases. I need to hook KVM virtual device stuff to iommufd. Someone
else need VFIO to hook into DRM.

How many different times do I need to implement a buffer sharing
lifetime model? No, we should not make a VFIO specific thing, we need
a general tool to do this properly and cover all the different use
cases. That's "dmabuf2" or whatever you want to call it. There are
more than enough use cases to justify doing this. I think this is a
bad idea, we do not need two things, we should have dmabuf to handle
all the use cases people have, not just DRMs.

>    I don't mind improving the scatterlist approach in any way possible.
>    I'm just rejecting things which we already tried and turned out to be a
>    bad idea.
>    If you make an interface which gives DMA addresses plus additional
>    information like address space, access hints etc.. to importers that
>    would be really welcomed.

This is not welcomed, having lists of DMA addresses is inefficient and
does not match the direction of the DMA API. We are trying very hard
to completely remove the lists of DMA addresses in common fast paths.

>    But exposing PFNs and letting the importers created their DMA mappings
>    themselves and making CPU mappings themselves is an absolutely clear
>    no-go.

Again, this is what we must have to support the new DMA API, the KVM
and IOMMUFD use cases I mentioned.

>> In this case Xu is exporting MMIO from VFIO and importing to KVM and
>> iommufd.
> 
>    So basically a portion of a PCIe BAR is imported into iommufd?

Yeah, and KVM. And RMDA.

>    Then create an interface between VFIO and KVM/iommufd which allows to
>    pass data between these two.
>    We already do this between DMA-buf exporters/importers all the time.
>    Just don't make it general DMA-buf API.

I have no idea what this means. We'd need a new API linked to DMABUF
that would be optional and used by this part of the world. As I said
above we could protect it with some module namespace so you can keep
it out of DRM. If you can agree to that then it seems fine..

> > Someone else had some use case where they wanted to put the VFIO MMIO
> > PCIe BAR into a DMABUF and ship it into a GPU driver for
> > somethingsomething virtualization but I didn't understand it.
> 
>    Yeah, that is already perfectly supported.

No, it isn't. Christoph is blocking DMABUF in VFIO because he does not
want to scatterlist abuses that dmabuf is doing to proliferate.  We
already have some ARM systems where the naive way typical DMABUF
implementations are setting up P2P does not work. Those systems have
PCI offset.

Getting this to be "perfectly supported" is why we are working on all
these aspects to improve the DMA API and remove the scatterlist
abuses.

>> In a certain sense CC is a TEE that is built using KVM instead of the
>> TEE subsystem. Using KVM and integrating with the MM brings a whole
>> set of unique challenges that TEE got to avoid..
> 
>    Please go over those challenges in more detail. I need to get a better
>    understanding of what's going on here.
>    E.g. who manages encryption keys, who raises the machine check on
>    violations etc...

TEE broadly has Linux launch a secure world that does some private
work. The secure worlds tend to be very limited, they are not really
VMs and they don't run full Linux inside

CC broadly has the secure world exist at boot and launch Linux and
provide services to Linux. The secure world enforces memory isolation
on Linux and generates faults on violations. KVM is the gateway to
launch new secure worlds and the secure worlds are full VMs with all
the device emulation and more.

It CC is much more like xen with it's hypervisor and DOM0 concepts.

From this perspective, the only thing that matters is that CC secure
memory is different and special - it is very much like your private
memory concept. Only special places that understand it and have the
right HW capability can use it. All the consumers need a CPU address
to program their HW because of how the secure world security works.

Jason
