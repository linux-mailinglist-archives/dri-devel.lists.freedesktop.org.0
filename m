Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D0A2ACAF2C
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jun 2025 15:37:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9152410E074;
	Mon,  2 Jun 2025 13:37:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="IqN3wAdo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2056.outbound.protection.outlook.com [40.107.243.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB6C010E074
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jun 2025 13:37:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i4iNyQrKp6L1yqX2/v19ndhwgbJDjdJjhpY1MdHEY9mfJJTJCL4f47fksaymlfP23tdpTh99c48VQXdrzeSy82eyPNng/rR2qB0bkFfFWPnJf0+LWwgtu4asWV6Ks77Kyh+MSCPPxQUkuTsYCP4cd5eh0X6ARdONpAZED8CPQW88EXmxxe2WS914DVtFyo7HLwE/WuGGTYsPKNbvqIu8TUxJyULg2zYgz4CecTjOyOOWyFV/sWbaj0ZFLT/wP5plLaQReInYX3wGOlG2t4SuzMwzIxuAYRqR2yWuBlMGq9G1KkHcp2qRUhTLQDBFt2/9nazuBBplIKvVpwaEQRmGPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h9VAB4/NzddGRa8m/xw1WcrnSYdfOaaaX8v8/NQQDI0=;
 b=evVEOOCUMM8Fi+kETgH5vLCAfRFbQko1vZbwv0lQJtc+hoZQfthFqDH+8cytDOX6H4dcu7jC3cFeHxGV7QIYz6d3MulMq87DdC/06XJ+NFPcP1zk8/CPvYmXgYRZ2MpWAapfNFakDIoWEfPAihiBO80YmNqVU25aInM0gHs9MFLACKQdnZSVEP1c5+tLGljw8ASRJT5Mu+iH5S6sPQLfAf+h2QrqwICYYKYXF+LhCAI3uUWNc2Rp2eUAVI/zzl0ef8vC4MbW3b624WFMR6QCaoUsK4LJ1eAvP1AfrIJzpA/X33iepBr3m6QltCKq/JDh0jTe1Col8nbd1TRVVaBvRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h9VAB4/NzddGRa8m/xw1WcrnSYdfOaaaX8v8/NQQDI0=;
 b=IqN3wAdopsXvxwZLqROWx8ZcFZR4fiahHko4swyi+OSPLv7HoUWhW+2JUZycn/jhdKeHJu3pCj8B0gl+b98jB3faYINjIxE0nmT0sdTGh1JauiF1FRDYoRIKFUPb6iXwx/L/nP1KX90Nc9He9rDTlIATrjDFyQ8jI06BIad7gBpzkrR22cPShIXMWSy/15RTGPU/8vSLvcBaAZmeIl100JS1ggkivG6BwjIhMOQyZHFPUFLMMU7Zr798v0it+gcSIuKp9yKVOBIC6qtaU2t21HjwYNRWRvjVs3oKo0aBKMB3ccVfGvMY/1Pm8O9O6CkD6lU9azxOhTEkDkiDKsI+bw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW6PR12MB8663.namprd12.prod.outlook.com (2603:10b6:303:240::9)
 by PH8PR12MB8606.namprd12.prod.outlook.com (2603:10b6:510:1ce::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.31; Mon, 2 Jun
 2025 13:37:29 +0000
Received: from MW6PR12MB8663.namprd12.prod.outlook.com
 ([fe80::594:5be3:34d:77f]) by MW6PR12MB8663.namprd12.prod.outlook.com
 ([fe80::594:5be3:34d:77f%7]) with mapi id 15.20.8769.033; Mon, 2 Jun 2025
 13:37:29 +0000
Date: Mon, 2 Jun 2025 10:37:27 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Xu Yilun <yilun.xu@linux.intel.com>
Cc: kvm@vger.kernel.org, sumit.semwal@linaro.org, christian.koenig@amd.com,
 pbonzini@redhat.com, seanjc@google.com, alex.williamson@redhat.com,
 dan.j.williams@intel.com, aik@amd.com, linux-coco@lists.linux.dev,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, vivek.kasireddy@intel.com,
 yilun.xu@intel.com, linux-kernel@vger.kernel.org, lukas@wunner.de,
 yan.y.zhao@intel.com, daniel.vetter@ffwll.ch, leon@kernel.org,
 baolu.lu@linux.intel.com, zhenzhong.duan@intel.com,
 tao1.su@intel.com, linux-pci@vger.kernel.org, zhiw@nvidia.com,
 simona.vetter@ffwll.ch, shameerali.kolothum.thodi@huawei.com,
 aneesh.kumar@kernel.org, iommu@lists.linux.dev, kevin.tian@intel.com
Subject: Re: [RFC PATCH 00/30] Host side (KVM/VFIO/IOMMUFD) support for TDISP
 using TSM
Message-ID: <20250602133727.GD233377@nvidia.com>
References: <20250529053513.1592088-1-yilun.xu@linux.intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250529053513.1592088-1-yilun.xu@linux.intel.com>
X-ClientProxiedBy: BLAPR03CA0111.namprd03.prod.outlook.com
 (2603:10b6:208:32a::26) To MW6PR12MB8663.namprd12.prod.outlook.com
 (2603:10b6:303:240::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW6PR12MB8663:EE_|PH8PR12MB8606:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f05a891-d785-430b-faa4-08dda1da9e9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?iBfdb+PeKZuBXEqkTfkrkRN3OGczj0g/mpSAMeJakRUd8PI9Ib4P3ZMxyODl?=
 =?us-ascii?Q?+f+llrNg8Em8DjCvrUa1Vd839gK2j7GC13CnAwe/rkhLeiNe5bn0tDu/MLj3?=
 =?us-ascii?Q?R2F1PmUZ2dpRcXTieALeXalr79mUbettQ7b1VWtBMK4iGnF2rVHnpAxvesVt?=
 =?us-ascii?Q?ZqzCtCG21WgXzT+yeh6LQFtplT/HeV6Op65HNAoZJi1dzMcIHU1RuIMRQSV1?=
 =?us-ascii?Q?LOxI8nKh8Toz3JUoAjlrnQ1MXazsMKS3Kx9CoPsBwL2VocugThQioIwGWxhu?=
 =?us-ascii?Q?3Fxw0PnCE5RBW+QFYJK3N9vemCJp21EUEWR1s06wyBpbtsS+BKchTzjgcL3D?=
 =?us-ascii?Q?cAN/dNdA2za0/yvrGPg4aaOy+vvRqAUlVsat03uQ8jD8IC4ykyCw5vfoEqBv?=
 =?us-ascii?Q?uwmIPu0T2hQMyOC2r9AiWtz6eZ4DB26foWzRiEWXXvR6UMOa+p6oQTwrx7sc?=
 =?us-ascii?Q?7tSUuQSFOCfkTOfoPuM/7ymjoSubNXy6IXi4hFwKnowrFZy5WPOaA7EE/Zat?=
 =?us-ascii?Q?SPvQ3Vo8/6MTvY7Tg51acjcgBmgxbMYtotj6G928jGSDGpzE/utDUDqbJc4H?=
 =?us-ascii?Q?yaJ9M0oWlPY4V4hnOwAdBVbXwRaEEe9tUbV0JHg5i/nS/0mEPMmhFyRugP1I?=
 =?us-ascii?Q?rWiya9jG+oI2ou0uvUe1za8eJ5sizRttN96AzwgM7SfPj5LhA/jBO3KkI9xC?=
 =?us-ascii?Q?qf8q9PZ5v6QSMzZ2IaG+hk+4nMg/C7UxxTOF4+hx2dw7MHvO8rkCqQhUSRu7?=
 =?us-ascii?Q?wqGtywE4QZjEqt3dmRzASGl0HNnhpvbO6oW5THKSNVA367k2CzEEim0NPLOV?=
 =?us-ascii?Q?dHJvssDQM5N5EbCXwRCGH7zC++mSYgkuyrxJElpjLiuB1D7NRX5YSnifP6OQ?=
 =?us-ascii?Q?3PDhpOf02dD5YG6v3XptTRhzJ5aJfwRtGdV8KiP/CkNZPVzPg8IWRNPDMx3t?=
 =?us-ascii?Q?dmwQ6vXHQH+FaKGqNQwvx4rA2wIz8ZisVR9ueDEJgcT+rRjSyScmHf1CMHl4?=
 =?us-ascii?Q?rItlKbdQ/YddZe1yMu6t0/tvu3BQL5v543jrYr/UGXJusZTfPbWzDYil6o3e?=
 =?us-ascii?Q?znEe9sjmS2kNCdSJzpyfr7jbft7SNN64dspws+HDXT90v+kgefuLA16KaWr1?=
 =?us-ascii?Q?b52grpCKzFQ23gH0GSQ8NH0eZJe3Mi/Sj9iNO05UvDPE5qXg0spVzFCg5dj4?=
 =?us-ascii?Q?5UU1v/8fpshgHjnJbGOTCqBiDBG1VkaEaMd7rM3Lf28mDQj53+gvUN65ybrX?=
 =?us-ascii?Q?dAQ6jxDybbPszWm3pS/T4lb8zujq0f//OyFvTDJP79lQnc8wscTZPzprs3Wq?=
 =?us-ascii?Q?6S/hUV2Dgau1A1tRsMArMIR2+Mar/h+Tcyt9+xv70cRYX3rBXndg2fywpf0n?=
 =?us-ascii?Q?3jM1gchYmHOTZEN+iqPW+R1wG75RSNe7+GFISWjkZ7J4dRBQhlZUgQIcL3qV?=
 =?us-ascii?Q?DwtTi3i8+84=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW6PR12MB8663.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zcu3E2DELorEYTVMSuYUxDdRuhYqHNqOxQ0gtjJ2FgCxvvk3jlQuKAwVkRdn?=
 =?us-ascii?Q?gcYzyfAJnknOSA7SZIDq3V0GzFYb+0qpLCJmv9K8PHon3016lxFbhNdnBNb8?=
 =?us-ascii?Q?nwW0bxwtWjUVFbODONcRB9VDAHnUKNxn/uuJhh4+Nrwv4q6rruu2kF9CF0yq?=
 =?us-ascii?Q?GbDCDbzLIYtpgRxU6cIfWfNcHcDk0wzTqPIWHWf6UcCRW3nZeaUkfLKIjFPm?=
 =?us-ascii?Q?0DVVfg6eB6hxkqO9sXnWeauKCT9rhLheJeCX5UJHTceewCjgnbCJA/z2QvRf?=
 =?us-ascii?Q?tfwbw8HHMaKw+kkl5L4c2TX7J2TfvyN+n6sMReoy+VlUPre0/LDd8KSaMqOY?=
 =?us-ascii?Q?6qsAjAB9dTa80DU8VQ6LVJH4v+zfzDpcDzImYJWxnbvlT44p1MdftS9KBqLc?=
 =?us-ascii?Q?iG9TuRW9J+SzDRwCM4JYt8SnoqwWTmT0BhsXwUPQc3hnS7dDRm0iLFIq9NUl?=
 =?us-ascii?Q?MuXp4iXiCIW9oj280bhgVQEGVyKWaaUIZ/EU/h0jBC182+2nt61UhzAV0WVC?=
 =?us-ascii?Q?FCmMJjSXU2eEiBbrieY6uhJQMWwa3plXAg0kwjODssOBq7n138GvZtZ9Ut2C?=
 =?us-ascii?Q?57FYMvbnFoyOkzXbp5QXnlbS/DTil3lTkbCl31R6jM9dyGYWO12wQfp5D+WJ?=
 =?us-ascii?Q?+xqyKBvExUQzk/dPAh2GOWmvoMsYsSvdsgjVu+mrY+k8s4O5wJIzsCcI/HvM?=
 =?us-ascii?Q?feBqYODdRw2bE+ur4ET+IPLznMmRMtHLyNL1dql4Mm8/kK6pmFwjLE+6/1BJ?=
 =?us-ascii?Q?UPAhn6YpnrvSqVPMxqOKC/FuuP+iM595gt3c4lp7VSs7ht7cZmmLFg+RWlOC?=
 =?us-ascii?Q?/8Oqhim8CTwYVnYbUd/B8T4WIqxc0/VimInwEWT/X+oFOdTi6QoQU3LSL9xT?=
 =?us-ascii?Q?/IHJXRc4x3GalB2TBoBqzHYdBzfOHezk/PdzGoxOzvJNBR9mt44LVdSVxt7M?=
 =?us-ascii?Q?xAh1uv3lOvssuQRUQdGNV93utJqc1lgGyVdcRou12KboTfh7ESemwSkTfTtw?=
 =?us-ascii?Q?4uj3OWKkP1zziwyYmeDgqlXf5SLxU67WEF6080C+MNPzdQY7AUvwYVIKBQeG?=
 =?us-ascii?Q?DWRPhtsAMWCmVwuNEdcyZKiDtBS4bNPiShsXZXtcPIs3UDnDjtjoeayf7qT0?=
 =?us-ascii?Q?xg6mfPl8d/eUaRPwjLLaYFFjz1htmTh1ON/ts0Htl527BJPOL6jvEKq4z/sz?=
 =?us-ascii?Q?k5wmPWaJQ3vEn4j2IfAYRZcBcjusPPytimx3ubiyoT8tXW69OFLdt/rlNiJB?=
 =?us-ascii?Q?x601gc9eDwZ08kyUxzUB4VEDSVWpKLwrh/2j5ujYui+OVOofOi01EvjD6O21?=
 =?us-ascii?Q?qrVIqgkmYD0LwEVf917M+g3YeWNcRmpo+TSB1JBVOF3XB4+lc8SssAso44pf?=
 =?us-ascii?Q?P2rL/qjZfSrIVCgtRxqzzd/XTdh0kl1Pfvfl0SsXq5VU4b4t2H7k4bTX2knb?=
 =?us-ascii?Q?k+k43pvZmoBAe5mNGYq3p6h7l79To94AilfdHOxME4K3YiQB2Bo95M4RA63b?=
 =?us-ascii?Q?IhvNVBFGkgYg11zyMJ0tNCIa62ZMPobAV3ijkPs4p43NeFiwZcMpNe1c10Na?=
 =?us-ascii?Q?2XfBGcJqVHGSiniccTHyzbVyHM/4pWsGu+/TeB6w?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f05a891-d785-430b-faa4-08dda1da9e9c
X-MS-Exchange-CrossTenant-AuthSource: MW6PR12MB8663.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 13:37:29.4987 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EkQqPnTyUvSlpQIhhn22hOF7b+wyWOkOmmu2+SUjgOS0K4ZDHRQE6zMvy6w1g+9E
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB8606
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

On Thu, May 29, 2025 at 01:34:43PM +0800, Xu Yilun wrote:

> This series has 3 sections:

I really think this is too big to try to progress, even in RFC
form.
 
> Patch 1 - 11 deal with the private MMIO mapping in KVM MMU via DMABUF.
> Leverage Jason & Vivek's latest VFIO dmabuf series [3], see Patch 2 - 4.
> The concern for get_pfn() kAPI [4] is not addressed so are marked as
> HACK, will investigate later.

I would probably split this out entirely into its own topic. It
doesn't seem directly related to TSM as KVM can use DMABUF for good
reasons independently .

> Patch 12 - 22 is about TSM Bind/Unbind/Guest request management in VFIO
> & IOMMUFD. Picks some of Shameer's patch in [5], see Patch 12 & 14.

This is some reasonable topic on its own after Dan's series
 
> Patch 23 - 30 is a solution to meet the TDX specific sequence
> enforcement on various device Unbind cases, including converting device
> back to shared, hot unplug, TD destroy. Start with a tdx_tsm driver
> prototype and finally implement the Unbind enforcement inside the
> driver. To be honest it is still awkward to me, but I need help.

Then you have a series or two to implement TDX using the infrastructure.

Jason
