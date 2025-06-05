Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31BCAACF285
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jun 2025 17:09:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E69B10E2D1;
	Thu,  5 Jun 2025 15:09:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="q5QzeIJr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2074.outbound.protection.outlook.com [40.107.244.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23A7810E2D1
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jun 2025 15:09:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pp4qdTmwg6mDEsBPgK7EPygW4OzLmasUMeG84RxjV9mTgHa2iW1IkCh0W2abn1tZ9rNKWw12Z1sh9brJFT8eGEbtHR/bSo8nl8s/SH4tGXv7yNrXQPgeQKukWF0csNM63Xq51DuGx6YqdKXt0TxNE0kB7J9xf1R6Iv79dHusv4f4wFSvOSGH90ZDlPJ4moJ7s4h38HnRppVoIK2DifdYgqVFp+vQha7JlwI9fLvRHaCNffL+hLBMFHJt4eS4gNHUhrVK4eGjutGs0lnwUl1SIIhYgI0MjKQ/1xUnNulRrjVgbJYRXAaTqc2wD2t2RUMMAw+PLAOCl80XB9m78w3vCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K9WafZfPOMuTk9JtExzfcLS+H/l2FXgp1KQLW57ZbnQ=;
 b=FAVxzdYP1pjE5uhwx+I2F7Xw/HbIxz1sSUrNTdkHFsFE+jZLaEYfRpom/gux5WpIYAeMNtQkZWB1GZi2qibp70sosKW6qvq161EQ4Vsni6Ppj54qj9M/IC5F/Xr1NrS0TVgLsFqRoc9+Gpo2E889MbjciEt6Tu3IkasDEXO5LBFAbtGAUIhuMKa/7Hc5wG5zObPj8nCESD43tGAw2FcbnX7R86w9ffMnEwpvAVsm1OZqUogGxLAVC/ZaWAsZM6lsODrPJGFztLA1zhMNrQoBapP/t/CU0yA61V6PN0WPi/vHVGx5SmbKY2LDFT2BFuzNYu/8O7iPx6q8TwO4OJhNIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K9WafZfPOMuTk9JtExzfcLS+H/l2FXgp1KQLW57ZbnQ=;
 b=q5QzeIJrcf2a4hKg429qxtlJ2ZFnzO6QtJcgKe1GbSzl2CLaUqgg24XaSFfT7ZNPdghqE4H/iPwP3W0t7rWQXgNfgDWZQC5kkYvXSakWVPlbnE2Ih7lu8wfhzyskkzG4hEMIz1is+IQ5i6zq2sLoh8pIB/e0Fnn0OhpboLyRd5YnGlsB+VebVDaivIhDjT/o7P4uPxl4Bj8HV8eloWM9MEgGG/1Laz8oM3XyZUPHGf+HyY5YhK4Bx95d9Oz1XJdMm5f809JQVHpiHxWAKq5zIaqSfMLoSUTVbUWUILQU8jWJFdyuW/VuBE2cREdBDFxAiffqAiXxUMGu0IugNA4G1g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by CH3PR12MB7690.namprd12.prod.outlook.com (2603:10b6:610:14e::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Thu, 5 Jun
 2025 15:09:18 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%6]) with mapi id 15.20.8792.034; Thu, 5 Jun 2025
 15:09:18 +0000
Date: Thu, 5 Jun 2025 12:09:16 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Xu Yilun <yilun.xu@linux.intel.com>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, kvm@vger.kernel.org,
 sumit.semwal@linaro.org, christian.koenig@amd.com,
 pbonzini@redhat.com, seanjc@google.com, alex.williamson@redhat.com,
 dan.j.williams@intel.com, aik@amd.com, linux-coco@lists.linux.dev,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, vivek.kasireddy@intel.com,
 yilun.xu@intel.com, linux-kernel@vger.kernel.org, lukas@wunner.de,
 yan.y.zhao@intel.com, daniel.vetter@ffwll.ch, leon@kernel.org,
 baolu.lu@linux.intel.com, zhenzhong.duan@intel.com,
 tao1.su@intel.com, linux-pci@vger.kernel.org, zhiw@nvidia.com,
 simona.vetter@ffwll.ch, shameerali.kolothum.thodi@huawei.com,
 iommu@lists.linux.dev, kevin.tian@intel.com
Subject: Re: [RFC PATCH 19/30] vfio/pci: Add TSM TDI bind/unbind IOCTLs for
 TEE-IO support
Message-ID: <20250605150916.GB19710@nvidia.com>
References: <20250529053513.1592088-1-yilun.xu@linux.intel.com>
 <20250529053513.1592088-20-yilun.xu@linux.intel.com>
 <yq5aplfn210z.fsf@kernel.org>
 <aD24r44v0g1NgeZs@yilunxu-OptiPlex-7050>
 <yq5ajz5r8w6p.fsf@kernel.org>
 <aEFmPaYorqaYCKBY@yilunxu-OptiPlex-7050>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aEFmPaYorqaYCKBY@yilunxu-OptiPlex-7050>
X-ClientProxiedBy: YT4PR01CA0496.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10c::10) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|CH3PR12MB7690:EE_
X-MS-Office365-Filtering-Correlation-Id: 8248854e-4cf3-4b3b-56a1-08dda442f139
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?JK65WbaMWpD+/ntc+0jbhBWOwtYEQyDRrN5T91y0M7ag3mTYE9nLp2K5V/JM?=
 =?us-ascii?Q?jVVkXlowDS6vlVCHqrZ+sP5KZyfbEWvzKuxDbX6DHQ8Vl7El2InEikmShAQV?=
 =?us-ascii?Q?MtccP8O8gud38T6ErUNm4b7XzsY3I6oe0YayLDqXH2SNxRng9iTJYYtG9ONU?=
 =?us-ascii?Q?WU9RAPxV4vKXYAy6zJXPLQOvRdTFDH62JdutF3yh20P+zldwoeqMfCD2qwds?=
 =?us-ascii?Q?1ob1yDXDiHi8JiWNkzD+4GixwuzZvQofQByU9HgdYJgPmU+KKnygOr6FAncg?=
 =?us-ascii?Q?N/5hnsbbMl2pLwV8wiEoAAXX+LXncig7Bfl/bYaaG2mtrWCSQSaN6U0dbHJ7?=
 =?us-ascii?Q?B1GDBftY7YpFjRXaJqOa7ANZBIpP/ucPgMEqqCiZN9cBrclu7DOhjL6PcXVP?=
 =?us-ascii?Q?luBe0EzLdhciDCf8V4XHNsdwvcU0OWgqeWFRMJEMaIBxeCtLRuzI0S1z420U?=
 =?us-ascii?Q?sy2n3xpgoShNmV4iSaSVzMRQFMHp0o7Cj+CD/YomZ5k7zOKRqLGh1UkicNFd?=
 =?us-ascii?Q?EC156WnVgaYFaM0JbMXVd9RNvz8SWyw7MHpXrfZxO6bkSPl0a8L/6X8O/bwo?=
 =?us-ascii?Q?wUnZyR+SpG+dVaPysludeCE/7cFl8UDTcl3Y9kMUBoHuZzSSR2nfOauUaLbm?=
 =?us-ascii?Q?iseDJL4xRm2AdcZxaspYftukILDY4SoltCRo+ALkK8NkAGyfyW26/NNIPan7?=
 =?us-ascii?Q?7IM7z9RR7dZNN2naQeXw3wJwDTt+5CnhuTO4uKyXStl6PkoKhIxN7G2/oz4Q?=
 =?us-ascii?Q?NyOSF5AnEkT2hhndyhadvGLg4Fb15ro0t9Wxc9FSfcrabfPYAA9O9T+Le9tm?=
 =?us-ascii?Q?f3aw2/p6WXEj0GevtJYcmKtNJwmleyrTNPQDM/DhoUILFF3FMFU0FSx+R174?=
 =?us-ascii?Q?zAziYZOpCsCmYzYG+ShNc+lgWXL6fw597zwswxR/F6SYRe4TDHrHVocX0HHs?=
 =?us-ascii?Q?i0LKUQ4cebO5Xpd9qTCw21B4z1DcjStybTgArnClyA6qPGbf5pdgusxxpKXo?=
 =?us-ascii?Q?HHJ3QhU7ZdvzQaeIBuL2vzjdmZLskVrMeZr1xzcYRRBxg+qfbbWqUTnbCfbL?=
 =?us-ascii?Q?+4QcVTvwKKIE5GI8uGl0lh84bvejZiqLXfYxWtDqs2N+0ZB1lpLswrbaSeIo?=
 =?us-ascii?Q?j67WBDTPF4g9KnRknQrb4vyiD8DFVLKb+Hr/lrgXyJor7X1GVZJKAI58TqPf?=
 =?us-ascii?Q?PUO9geMRS3EJbM8Ixmk3Gt2jvMQXYx1EbOWeFjmZb3F9ukqeUI3JNiUbXsc+?=
 =?us-ascii?Q?bBFkSvpYZWuVb6bznWrkZdgKJZVrScpcrDXxPUZes/a5AqcECZPP77xhB/ct?=
 =?us-ascii?Q?NBBPMPNIPu3aSktRz8ppZR0Zjl5BUrrZXZkR7oA6YoObkZf7/wBql9D4PhJh?=
 =?us-ascii?Q?XrLKV8sj0yqSKnqCLJpuevpW8zwIbSlsDbexuwxgjgHdLMSLxK7hx1Z6SGd4?=
 =?us-ascii?Q?xBjJndPtGz0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR12MB8659.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YnJL50NOObalofHyGLcX2sKoki78yzs8ES6ttr1wszqZFBxexjhBT1exyKZp?=
 =?us-ascii?Q?Cw/+JIf7a322WMyqXY7DV0yMANUKxn+/Mfqqh1mCo6xXYB69sv4O9Z0bnrnp?=
 =?us-ascii?Q?sNHAtuae5cfjAkv6eCNnKQ8dyVIJ3vaGhik2Q1EPSDJETlOnjI9Lj95hz8PI?=
 =?us-ascii?Q?P4wBP7ZgfDVE/bbkDlhiBXkFmqENvaJiMyxVcMwLSZV1Nzh6AM7+AAuBxl2w?=
 =?us-ascii?Q?AAgQrG+72rEYYIsiP6URLD7XoU506gVGcmzbeMygN8lIWz3EFTDW5XVaZTr1?=
 =?us-ascii?Q?EUNkSnCPp8lvvwC6Iv4JbqK4ZuOEVXHsOpP4TxagMimhx2WGPy/1VOy+4MOC?=
 =?us-ascii?Q?NrcWTd1jiPgg1VSm/prfIFNps43qH0yxdRV53Em0PE+Uz8CKd6GxBv7S3pV9?=
 =?us-ascii?Q?zjLB383l76ggINSblZ36AqgP6C2Y9j7JBlPtJjW3/kDqA86IfmypI2fzQ8E9?=
 =?us-ascii?Q?+ai1CJui5IIFm68Uqswl49lZVm7OdoGpHoiaqgkebfOeMHDmhYzuIRNEm4wC?=
 =?us-ascii?Q?trhGnmivDAgbN5yjW74Gc2CATFTd5NtQLr6LWjCu2io4W8wpMsfvO97DtFpB?=
 =?us-ascii?Q?qvkJ0sTsFdyhTPNsdakXHHWYpanHPVHXWvrGLXv6i6vbjkLuxklmdUhOs8It?=
 =?us-ascii?Q?H28uq68fT7tc6rAuLdnifJPGPfGnLgTSncPR6/+u4P8KCE0nBpiJDmzerqUw?=
 =?us-ascii?Q?AWKxfT/tqSnjQnWVPJGPoXaTjzvW15NrEolCaubVF+Dja4qJrJuWnqCwdzbQ?=
 =?us-ascii?Q?H/qi4Z1DVM+snH2+tY9+hSsKd/8zhgl57B7uulzxnVPyd9C1ibnV2wcX6iWL?=
 =?us-ascii?Q?dCDEi82D/XukgHn16txR+NKoxQvTY2INJrXd/r7Wgh4nPmZAvZe4PYXDxaw8?=
 =?us-ascii?Q?JysjKNpZjNHCn5117MTYsGSDkNMovWcn/JvGPMv2Asnwp6zumZy1cUsMOXyD?=
 =?us-ascii?Q?usLsjFMFu+SbQ1pbuOvYLZ37o8dn64dqT9zLrYaldl4tAWvDhQbxecCbDJoj?=
 =?us-ascii?Q?7DKXhKKuSBZoQ9MrcCc2e9qgSU5GM9zoyT/3ufKVblfNO7+AUrWPUo90PJes?=
 =?us-ascii?Q?kICL28sncojUZoqzjlYjHVD2EDRmtlUvZWoXLA4CU+e6aRbCJ6ywJ096tkJQ?=
 =?us-ascii?Q?7NdZ7gNey6rchbiP4d+LaMOx9JoKuYiNjBD7clgAqHKgbHczlMNinknxB7v6?=
 =?us-ascii?Q?/GYZEyQmhcq2OcRrn3HcSp136SdOsc7ZJqf01rDKdEFCSPOVQAl29W5tlpRi?=
 =?us-ascii?Q?wX9PAvkmKy1imt0QLh4p5UD77+fl78HIN6T473dLG2m2TbDq1vUd16528xEA?=
 =?us-ascii?Q?Oxj0706PH8mxgRWIAVG6gG3C1CUpfpGlDxcz1x0mQ01Ga0UWIE8MVYqwdZhG?=
 =?us-ascii?Q?WhDJYAWtj1g6wuFdtKSHmM1HMr2zzimZLRaJ4SpZic/hhW32b3YyZI40KJ7A?=
 =?us-ascii?Q?aLCDYXPaFsRa/4w9YVn6COi0W9FNCNSzw7v0mff/H3QtziFQnHbLdPZR+/3R?=
 =?us-ascii?Q?l+2NoWho7HY9aU2MQEG8mD5uTVF3oXGP39fpGrRfyPYHP3EsiAhI7ZvyjDNu?=
 =?us-ascii?Q?lmzZJ4a8QG6PqORRuMwsD1yO/Zl0u/6Uj48Rsst2?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8248854e-4cf3-4b3b-56a1-08dda442f139
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 15:09:17.9962 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UIaSuJJxDn3yncKQocK9PVLmm5OwsS+qgLXtIEsB70uaI8cOKICF+6jFG5osMo2Y
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7690
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

On Thu, Jun 05, 2025 at 05:41:17PM +0800, Xu Yilun wrote:

> No, this is not device side TDISP requirement. It is host side
> requirement to fix DMA silent drop issue. TDX enforces CPU S2 PT share
> with IOMMU S2 PT (does ARM do the same?), so unmap CPU S2 PT in KVM equals
> unmap IOMMU S2 PT.
> 
> If we allow IOMMU S2 PT unmapped when TDI is running, host could fool
> guest by just unmap some PT entry and suppress the fault event. Guest
> thought a DMA writting is successful but it is not and may cause
> data integrity issue.

So, TDX prevents *any* unmap, even of normal memory, from the S2 while
a guest is running?  Seems extreme?

MMIO isn't special, if you have a rule like that for such a security
reason it should cover all of the S2.

> This is not a TDX specific problem, but different vendors has different
> mechanisms for this. For TDX, firmware fails the MMIO unmap for S2. For
> AMD, will trigger some HW protection called "ASID fence" [1]. Not sure
> how ARM handles this?

This seems even more extreme, if the guest gets a bad DMA address into
the device then the entire device gets killed? No chance to debug it?

Jason

