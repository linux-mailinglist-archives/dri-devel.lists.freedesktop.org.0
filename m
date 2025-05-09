Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 402BCAB1C89
	for <lists+dri-devel@lfdr.de>; Fri,  9 May 2025 20:43:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B974110E276;
	Fri,  9 May 2025 18:43:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="FfHFvRXp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2074.outbound.protection.outlook.com [40.107.93.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D569F10E276
 for <dri-devel@lists.freedesktop.org>; Fri,  9 May 2025 18:43:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fpistFIixGqz5xOIOlXABMPMnDFB3SV5QYE3q3j9wLcC8j9hz0emhHUMV/ke5vI1PWIM/tnDK29IhcDQmZSQkBSJfdbw/HGvw9tdF8qfx+lL9o2JEHsONRlbObh0ZGwN8+BwcCtZy5n8VPjEgLba4S7TqPMn11RJn1Me7cC+br8/wM+OQjT6LGuRVHey8mqi6/J22l06tjBNiumsKajntTlATqVNwhZls4a6AC+xK9/iSqRCJFEsy12jNIV094zw1dx6GbTg9NKyJTWSa82MR38KlnIp7oZLZ7i7erv1kXK882sttk44plIQWXuKRCoVdMH8w5JjSxMyHI4A9X+K/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YgYyykd9Eta1gZiwzkjMUIz7VlAwyfRFxLTqKe9qIiA=;
 b=JxaK+2CotEChs5Hg7kIBqeBW64CAlWoIZWclZdilpyRcjOApWx/x8eUZz1fGa6q61RmDg5cwAT5ACMZNPUHJ72aGjKt1ex6mXxMSNloinnNAhdAbsIb0iIiFafT8eeV25U3xUdVNM93QthHkzjqofdRakbKoc5kZ6klPxeW93ZWhiNeU3Hl0ng7OVFBLZeFMpmxKopITyRvtFAVonelqWfkhDXHRrfDUvWPQKlEfhpI4GOKcFJUD4WwzCjOtvw4UOT/CKgdXUj/QWECD3Vc1VP9FDObpTdCLNwoxSg2Z322TEbuP7XLUeGvd2jEhvc1pbTyU2s8EaHTmBvSjd1ucsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YgYyykd9Eta1gZiwzkjMUIz7VlAwyfRFxLTqKe9qIiA=;
 b=FfHFvRXp7SfVhYFokOR6Z1D8pm1wxH9xs8cQ01v9JD4lqULMGqOf/zjaO/yzRTvhEcbHpImrvgLHxMyG7EGxHkwYkTLQtQEc/d8iSB01BGzw6MB7NRlKtQlDJaR9tmRnLlhzKLOMUnwWMtCCRc5YhYaWV+3tER7LInrjnZ9VAf3rrVrgPMhPX1z3b8H8soFbhf2xc5LZAiSmGBTe1nvkm2af0aw8UG1/6KajGSbd+Vs7AJ2ejb6f78kXup6CEEQGpmyuFn/Ai592nE92HGwj5wHa9Svzzjb51eSvOLGfNu2oR7I4S7sqQgp0ctCB6WCQXyi9b3VGZkb0YhWPWMoXuQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by SJ0PR12MB7081.namprd12.prod.outlook.com (2603:10b6:a03:4ae::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.23; Fri, 9 May
 2025 18:43:21 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%6]) with mapi id 15.20.8722.021; Fri, 9 May 2025
 18:43:20 +0000
Date: Fri, 9 May 2025 15:43:18 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Xu Yilun <yilun.xu@linux.intel.com>
Cc: Alexey Kardashevskiy <aik@amd.com>, kvm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, sumit.semwal@linaro.org,
 christian.koenig@amd.com, pbonzini@redhat.com, seanjc@google.com,
 alex.williamson@redhat.com, vivek.kasireddy@intel.com,
 dan.j.williams@intel.com, yilun.xu@intel.com,
 linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org,
 lukas@wunner.de, yan.y.zhao@intel.com, daniel.vetter@ffwll.ch,
 leon@kernel.org, baolu.lu@linux.intel.com, zhenzhong.duan@intel.com,
 tao1.su@intel.com
Subject: Re: [RFC PATCH 00/12] Private MMIO support for private assigned dev
Message-ID: <20250509184318.GD5657@nvidia.com>
References: <20250107142719.179636-1-yilun.xu@linux.intel.com>
 <371ab632-d167-4720-8f0d-57be1e3fee84@amd.com>
 <4b6dc759-86fd-47a7-a206-66b25a0ccc6d@amd.com>
 <c10bf9c2-e073-479d-ad1c-6796c592d333@amd.com>
 <aB3jLmlUKKziwdeG@yilunxu-OptiPlex-7050>
 <aB4tQHmHzHooDeTE@yilunxu-OptiPlex-7050>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aB4tQHmHzHooDeTE@yilunxu-OptiPlex-7050>
X-ClientProxiedBy: MN2PR19CA0020.namprd19.prod.outlook.com
 (2603:10b6:208:178::33) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|SJ0PR12MB7081:EE_
X-MS-Office365-Filtering-Correlation-Id: d896753d-bf75-4d5b-9635-08dd8f295e07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?N02mdUojEim80ulLmq14tZp3fzK79ZziyEbeqFApZo0cpKP2jFvdV9/Goj/3?=
 =?us-ascii?Q?iCw1+hrNi7p+VhxG+qqe8IGqy9z8r86bf+AfXuqrE0gTAqX3q1mrPTevGkuy?=
 =?us-ascii?Q?mbWjK9pD84oKVKlymeg2MG2+ruBJgtvLtRLEn/ykHpL+yq3aua+IJVvHloO0?=
 =?us-ascii?Q?mXo6FFrYZMGhxBtoE/v1GJ/TrIijxDXDttoZFjlCCilCDA/aXtpdkjwnpgmn?=
 =?us-ascii?Q?MQJRmZKwK9e9MSYUWwea11BpkUHId+oa5lyxDe0fFAZiNQevf/4kkgNclR7l?=
 =?us-ascii?Q?CVKKGiD662uvAfAHUCyZYttL/TmmFra/6PXBinZo1b9E70/l+v+lfLvd6eu4?=
 =?us-ascii?Q?7+l0uDjPvhihYbr0v1eS5dKnPLDMW+76ulVf2qaoEUQIVsrgtT4iD6uxo4uu?=
 =?us-ascii?Q?yb+RqQ90U86poXw9bbv/DQGkWUo1iqLm08pqa/hyfTtbkrKKsMck0A2aYQBh?=
 =?us-ascii?Q?AT6SMICwNlqfCn0fW9dizLajeNRcZKAGdR+MB26F5ilaHkT8tiSft2kV1l4Q?=
 =?us-ascii?Q?EAr+5c7smpDvbZ8OIwH6xGWNo/dP9aoY3beE4rtrDwdyDzB/Z+4vofazkWDX?=
 =?us-ascii?Q?JNNYJGNRscGgEbyxMSMCEtH5dwXNs3afjzvbqAqLZCYzeQiHroLt782OnZKM?=
 =?us-ascii?Q?n1JQ9sy1/MjtX7XnGn3kWFUM04P9Yyfk0Pvq+Tts5Y78b8FKbXvCD9YT+kFz?=
 =?us-ascii?Q?bFBu+lm4g4KJY67wOndhRDXE5R/hh/TgEJXr3g7BJjn40MJG9sbxpWsme2sH?=
 =?us-ascii?Q?nygszNy+x1xtZaZPJd0Dx9SbSiyvE1AyktfXZyMargjZpARIm+usQmubZXqS?=
 =?us-ascii?Q?aJvGCSP4Ifb+dZ7vAv2C/HoP2vkJz8ZFjWUVRyPs2ctgHT6UCLZE7AShRdnY?=
 =?us-ascii?Q?TB5ePwaWV3kIUqqR6S+F/7ViLbI+NI+mnPQzMZ7k9t4dVpKDAcUrrkZHY3iP?=
 =?us-ascii?Q?ax5k2HGlIwrMBd2epSbjODow9gsiIJeJPNRbZIjXapOIj+7nMMTSo74pKgsN?=
 =?us-ascii?Q?InzjU2GYpqKjP7a/rxXrMIvwAHpG9yqGoeoCMwKakDnFTiPOUfd+Pi5NDOw6?=
 =?us-ascii?Q?dilJYiWIrsQE4xcRKia0Z3jV/4L5sn6tuj0oRB+Y3MOcQrILl2e1Mlg5rWpS?=
 =?us-ascii?Q?bP/u9HHcT7hJ0DhKGdP3h8xCjQ7Cf28jczstuqYukXS78CXKaCzE0p5/QwFW?=
 =?us-ascii?Q?+cUwTLg4ql+KJieOmtCWiAicad90Lx6jiHgpqWX7SsQ8JatybeFR3OkVIOYP?=
 =?us-ascii?Q?hKuyrKquepVFUMmnr+J++dotjQZyY3mt/Kzqx2oABW9pLCNjNhczPdkCNGJS?=
 =?us-ascii?Q?EZv6gYpO873wR0HI9Et/kECHujylOVCYfVxOmZsPd+ruwCY8HeAXUE4lvzbx?=
 =?us-ascii?Q?d/YLFJnfdu8IVrCnq0sBkc9QVsLrB3Sg0P6xT6ETPNehvETdn+ypkDtTMXCz?=
 =?us-ascii?Q?npn/DNkhd6c=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR12MB8659.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QFEDteHDEODmu1Up7VSy+/hA7SvjgTmdcBdLQRnrPefqnbPGLCQZ4v6VMu0e?=
 =?us-ascii?Q?+EAQPfm6qhKwK0h/TsLwNOFmuKzzDYEHpVoagZ1EJEeNcCMPsqoPcmkV+t/G?=
 =?us-ascii?Q?muFcB4XibAxU3qbeweoE4zVMcQfu3aEwtItqZk00k1gOiqZfuUuAVXvCE78s?=
 =?us-ascii?Q?9r89JwSYGQDEjGc9CJehPBbKg8d8zmeCbuDDF843jxyJbUagDBHpLfqQtuNR?=
 =?us-ascii?Q?bXECJkJ1nPwEavBnSG7IMtnyPlYCk+G3dcJqvMFuM08Dwus2spqBDfQV/Vtv?=
 =?us-ascii?Q?wJbqYVeh9fvMvZuY5V53swZp70lKf+SiAkoFJKFC9fH+l1nQ1OrYbWyFmIxC?=
 =?us-ascii?Q?CkNnycNvra0GGvotHXujfvBe7puWA3+YPumsyjA7sryGn9qL7bH38rILxVi2?=
 =?us-ascii?Q?hFfCCjdiVFe+/GJgmtL1kHNRK32DsyIeUKEXga0Z1HgtBXocsuF5GpoFeBFU?=
 =?us-ascii?Q?yQGBa+4SIuz9NLC9cm5eZ8kWqQvLPhD9riB5qjoTk32U2Km/upWgkbkb96Cw?=
 =?us-ascii?Q?UzgJ4H3e5Z4VfyHVMpPDTlObt41/IEDSwNZSE15NixkIQrWxAzd2qrahTVEo?=
 =?us-ascii?Q?EjugWh7b8veuf2PAYY93D3mSc6wRz+GBQMKwgUk19TxxiKW9CS82iBQQ0hey?=
 =?us-ascii?Q?vqLJWplpuBwIijkpmRqbe62j/+4Ge784v3rL0axL8eFYrp6fsGZC3+I3jgTV?=
 =?us-ascii?Q?Lonr+30l46a1rtYXt1sn+KyYmr7gpF6Et8h2Npaym73nxXJppXk/iHiVLR+H?=
 =?us-ascii?Q?wdNWB7E+cAUHInmNhp5tBcROK/LPJ3FDDKqvAJ6Lws5PYXM9ucig+yfXhgTQ?=
 =?us-ascii?Q?KOL87XSCOu4j+m7iUk2LQ0Iyw60E9gH2RlqURI+7Xn5Guvw+6dpwLmxh+cCb?=
 =?us-ascii?Q?THksHTHc+deGhIRPBoNkVe4V0aJjnJQ4N7eGcEKAKoS8vWiKunvjFfUlp6I+?=
 =?us-ascii?Q?VWDt/ktBEafSkYpqEadxHHXD1MgE7vvFJN/qe6CiyfB1bsx5kOxtPgKjlejj?=
 =?us-ascii?Q?8mghe1PfUE+4Ol2zUyeO4K4VOLdBkIJEJlV+hx9CkHvOb2ElGwvDsZdquIik?=
 =?us-ascii?Q?+MLhREVzsFgtwDhjYUZqa0OuArwle/vHbkQlAM5n/JVlRI7k9j/UwCkDgSC2?=
 =?us-ascii?Q?zTNL65kl/CWUd9m6Z98hutprhUN9d1clVko5vQOLHAhaPz69bKkJOvt8Q25W?=
 =?us-ascii?Q?dNoiFbBKbQf1M7cg3uL31erxFwFKHLndeMLoWkVMZzvcv8c7LiyIpRB1ANW3?=
 =?us-ascii?Q?r/B+54w4ZLmSGdNQ9+6cwX4k0F3G08YH9HYvN6P/vTo4+YZ00hcXjHYLuKtg?=
 =?us-ascii?Q?jB+0nC4rfBKo7QtrBCjl3E/93jBp7XUPku5fYyDmyst5Qdmz3gWGqv1Eofs9?=
 =?us-ascii?Q?96RPdgEsvrn657g1CV9AU9ba2fvHJnpq/sN1iJ0lGEv81xczj6k2Kv6w6OiO?=
 =?us-ascii?Q?P86OHxWb/c8W14nhHbW0QAgZVYUIk0bAq7yZkMZJIfRXtFn7C3pp9HqXQnDf?=
 =?us-ascii?Q?HFIKxV2f3ZpEtXO8O0yxIlG0bTDFxXvJ3f5GqYzYBAv2dcL49DagT+buLEsZ?=
 =?us-ascii?Q?PtjfI1T3c5eWVkN0WQI=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d896753d-bf75-4d5b-9635-08dd8f295e07
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 18:43:20.2794 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ENzZCWi/C0C4f2UNP42E7p2osPAMmYNkQ4YgV2Y4qWyqPuO9z64TsIr711i9YWko
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7081
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

On Sat, May 10, 2025 at 12:28:48AM +0800, Xu Yilun wrote:
> On Fri, May 09, 2025 at 07:12:46PM +0800, Xu Yilun wrote:
> > On Fri, May 09, 2025 at 01:04:58PM +1000, Alexey Kardashevskiy wrote:
> > > Ping?
> > 
> > Sorry for late reply from vacation.
> > 
> > > Also, since there is pushback on 01/12 "dma-buf: Introduce dma_buf_get_pfn_unlocked() kAPI", what is the plan now? Thanks,
> > 
> > As disscussed in the thread, this kAPI is not well considered but IIUC
> > the concept of "importer mapping" is still valid. We need more
> > investigation about all the needs - P2P, CC memory, private bus
> > channel, and work out a formal API.
> > 
> > However in last few months I'm focusing on high level TIO flow - TSM
> > framework, IOMMUFD based bind/unbind, so no much progress here and is
> > still using this temporary kAPI. But as long as "importer mapping" is
> > alive, the dmabuf fd for KVM is still valid and we could enable TIO
> > based on that.
> 
> Oh I forgot to mention I moved the dmabuf creation from VFIO to IOMMUFD
> recently, the IOCTL is against iommufd_device.

I'm surprised by this.. iommufd shouldn't be doing PCI stuff, it is
just about managing the translation control of the device.

> According to Jason's
> opinion [1], TSM bind/unbind should be called against iommufd_device,
> then I need to do the same for dmabuf.  This is because Intel TDX
> Connect enforces a specific operation sequence between TSM unbind & MMIO
> unmap:
> 
>   1. STOP TDI via TDISP message STOP_INTERFACE
>   2. Private MMIO unmap from Secure EPT
>   3. Trusted Device Context Table cleanup for the TDI
>   4. TDI ownership reclaim and metadata free

So your issue is you need to shoot down the dmabuf during vPCI device
destruction?

VFIO also needs to shoot down the MMIO during things like FLR

I don't think moving to iommufd really fixes it, it sounds like you
need more coordination between the two parts??

Jason
