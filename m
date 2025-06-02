Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 137C1ACAF05
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jun 2025 15:30:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D063E10E095;
	Mon,  2 Jun 2025 13:30:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Y7N5aaqI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2046.outbound.protection.outlook.com [40.107.223.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E421010E095
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jun 2025 13:30:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UaNy1gAFB6gJ9yjLQ2Ffd64I948wREEOcfn/Y+lMy/t2hmiekSH/TS5DZT8Tj4rG9jYxDI8pIQ3fOQODvVfOIh7mMi8ULU4O+KXhV8Yu/Fkgq27ESTK/xT2dXrT2NG/cach9/M5TvsjMEL+7h6TgZd4EOG8prugvC2x3dL0+q32MjOWgq+YzilLHXDHj0vj23ErnUIkrtshOlUwT6OBB1E312VwgHbxVvNOgg8Lfd0wb+DT/39gn2QitUHgH91T4TcKlmsw62sVY3qP1CNNaIA9PRUeWQXUf46RXYB/7ufOtIOLpb/U5kZdjMAY2e5rXF2q08/u6WrMJ3PhDlBMQ1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kRHrq2t4mM/OkPlSiWYjCEGe9bhzW13lxytzpnMudDg=;
 b=SqO7N5lb+66tEGBKkGAnNBJis7EzS0oV40RMxLwJZ7ouJflAzsQoy+de698prKP34OdPLhN1293JUgbjmhXZczur5qSlg6Oz7AFNjurttn6llbpXhy9RKt6VyWKp3HXqTga4VSBkKr7hM1Ab+4aXIJp4pvH4hKox9Tm7bzpO2+xsFnMTyivMRRQM/ZVnnudIwkKIdMdT905JdWD8EK+pUy3BIXcpHu0woI0pkUTRW0Ir+RWEcULOnqU6h4NNTUznhRgx16IvT8CGG4wi0UtPCGuxNjipnybOiJWoT1+kZUvemxNPeUqS0y5jiDl4yfmCd1TA2gjhd2VZy3DhLDbc/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kRHrq2t4mM/OkPlSiWYjCEGe9bhzW13lxytzpnMudDg=;
 b=Y7N5aaqIyWQI4noEe9LQKVizn+U7lyr/9+bgJ39oSAorXZjQUaRWunFY+pXNcf9v9MPRzB9qv0RMenCam1qJWlWleTSkQCqsA6oqVXml2oBmqmMK0AlzTGj8lDy2oNG81C96E9hKgR/BCm975uOjyVvHY5lSFb2tjeeh5rU8WpHmJ/bD7RcOkdyddxkufvVHmL42Db9wT6nQzOn84zHMvNQM8LcPaYAF69wL+tEX4rZbb5OenbOIHNR1VxffmEH8rbw1rTQH9YnopspSmmIVq5Y+jndUI5BJD/ggSpeXRI85uWCwvFJxuzlruPu8cUXdHVsOnps355fIyvGKIlWrxg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW6PR12MB8663.namprd12.prod.outlook.com (2603:10b6:303:240::9)
 by SJ2PR12MB8782.namprd12.prod.outlook.com (2603:10b6:a03:4d0::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Mon, 2 Jun
 2025 13:30:11 +0000
Received: from MW6PR12MB8663.namprd12.prod.outlook.com
 ([fe80::594:5be3:34d:77f]) by MW6PR12MB8663.namprd12.prod.outlook.com
 ([fe80::594:5be3:34d:77f%7]) with mapi id 15.20.8769.033; Mon, 2 Jun 2025
 13:30:11 +0000
Date: Mon, 2 Jun 2025 10:30:09 -0300
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
Subject: Re: [RFC PATCH 10/30] vfio/pci: Export vfio dma-buf specific info
 for importers
Message-ID: <20250602133009.GC233377@nvidia.com>
References: <20250529053513.1592088-1-yilun.xu@linux.intel.com>
 <20250529053513.1592088-11-yilun.xu@linux.intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250529053513.1592088-11-yilun.xu@linux.intel.com>
X-ClientProxiedBy: BN9PR03CA0538.namprd03.prod.outlook.com
 (2603:10b6:408:131::33) To MW6PR12MB8663.namprd12.prod.outlook.com
 (2603:10b6:303:240::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW6PR12MB8663:EE_|SJ2PR12MB8782:EE_
X-MS-Office365-Filtering-Correlation-Id: 7678dc16-bfd0-4d3c-b4b7-08dda1d99938
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jHqxO4I/G138o6R+ppyCgotBuPIsYc2e16lEvNPHdwQ+j0zR309L5Q8J1yoE?=
 =?us-ascii?Q?CqDw1m8fMTCPz8s3BQ6ooQ3dBOZbnmPgXMYJQ2z6ArXtXm8sxvKuj5JciLvI?=
 =?us-ascii?Q?wwngXq91zXYrc8mVDhzbIXBvVI9jxBobwHcZSCR7qQsBtmZYTNTYk0C2uUqM?=
 =?us-ascii?Q?DJ5PJLNpo9HMN3KzTCodxjHtC8CkU6kk4Il8rxlSIjC9O3BS81D3pur2ED5d?=
 =?us-ascii?Q?HBgTM1lEXmbTjgrd3Vpcy1tkTnyww5hiJXNJ2dLEYHztaulzFn2Fyvgs5V2u?=
 =?us-ascii?Q?hzhCYHOqtZm4B//KUZHnwXkCeooV+4NVPST2HayYyXpVOeHwcJ9i5ziEJ2vS?=
 =?us-ascii?Q?ChrfZUDSAdHyBzGxD43tlDEEYTBPn0tCc6QzU8qU2dDipsT74b+Cm/Iwfbuo?=
 =?us-ascii?Q?0gpfBeKY0XHN3WVCRQksFsmuvQYbt/7gUVgrWBPDoe1WymzNhHovG6/0yfsW?=
 =?us-ascii?Q?qaYsZJbaPd0ZM2VqH4PqjgEa4QBlWnG1qYvxeKMsaqvnwaFlimC3kaoTVpvT?=
 =?us-ascii?Q?e11hRoQnMv5l6MGTqLhjO4SdbaKRYzkHZAuWBRiTk1oHl0wpORa1KfLUNK6a?=
 =?us-ascii?Q?VSdUs4HlhXT7AMJE4OwzsUWUdTH4fvHYCul6A44i7FcVwC4353fEjWuphVN9?=
 =?us-ascii?Q?UAW8ndjHHoq+A0fT+1Cdd8SGUa0wMKKirngD4IaoqlmHefHegHj4tifrbU0L?=
 =?us-ascii?Q?RbNDApEtngogQ/yCQwmx9nUvbHaCjHK8IANKmv5mPx12Z2G+WGYsSj9btEY4?=
 =?us-ascii?Q?A0ao08The9jdfbfEQfWWMkL2sPvxyUFZZBtfr4007Z7tNiXUN0RZvXN86UUU?=
 =?us-ascii?Q?KEF+XKCPk00aq+n92onxWxZYyVFL2osOfT8ajOw4K9mZUrnIcDcB5ltwXBpI?=
 =?us-ascii?Q?gFpyoJgEz7ohApKkdH/EPHZFW69Oz+IPB8gvyv3YEeub94LK/ISnuHRBSTux?=
 =?us-ascii?Q?Skb79S8OQINy204gzV8uuJEDH0YI8rB9NZrn5lp9ZTnd03wi7pENrsEqDdCY?=
 =?us-ascii?Q?8daqUTJvdC7yUYa4PuSiq9UzqyipSiPgUJa84H/fcvv/CvH6UgsE9dIzT/wc?=
 =?us-ascii?Q?1r6cx1YHaEVItfz3Z76vlJhL7aI/OHtA2zUBMcNKyRbtXfkNVTsJgXZyBCjO?=
 =?us-ascii?Q?9ji4/ANmI2fD01XSguT73vSSXhAuIyBy7Icd7VK/UITiujYVUnsRYw59bD36?=
 =?us-ascii?Q?oVY9rdZbDVNUE2TTcvw+/iU9Teb86DMFiaY82rU+3IEhuuQGQmRFvygLKQvD?=
 =?us-ascii?Q?bDA7/viL5yyVOKYW0/wDNwjbUDH+Zir+IO/Uj+iMnz9zwOSE3KDGtvsI0hd4?=
 =?us-ascii?Q?Es3tTZMkTBmI6mSfueilAIBajnftUHoFY3u3nKYLoci/YVl7V1r6LFM5Xuba?=
 =?us-ascii?Q?Z/7iJaa2Zrfz8hQdvJ4f0So/IUahXmE99DP5Uw/gS4+x1FCu5952IQLAxCaQ?=
 =?us-ascii?Q?EaqIWMBNvSY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW6PR12MB8663.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ldX/IEfozltGIWPtAPfM7V5BAUuiF9lAV3n3FWlcW/cdCBrL/d7s3ZiaH4Jd?=
 =?us-ascii?Q?oEuUP8XQea0O//W/3DHRYxa1MpW7yrTwk+gcL0cwxtlyO2xLZ96h6EWkiSpz?=
 =?us-ascii?Q?Tc7CvfgWZYh+SLXb2kRk/HiDaNpQVP0ILNpmVXEgeKIuQE7QMr3Ee64TrsiP?=
 =?us-ascii?Q?YaFLEVllB+nb0cs/GuRbFscim5e4lcVhUBEkchR+MBRC7JnnPCM1vCO3Q233?=
 =?us-ascii?Q?0DfKj6j2539M3vGXAMGRwBYFbRPYNaTSc2H5sT53mon0a1Rjggj/5YZFZPHZ?=
 =?us-ascii?Q?cjb/AfQORn8HeY8M6uEUFlS9jO4VIc8/gK8B8IVw5JG9jSJPSSi8/7ucmeH1?=
 =?us-ascii?Q?zs0OEawXdkXi/bgcckrI7vwWszasjWeSHUyJtRDxWtVzxUmoqwIjqc6yeDvp?=
 =?us-ascii?Q?/q86zGkxaL3UnVRG+CWDkm1lCMGwQClzOUwGVKrTm6XCfz+31ixTPBELF5o+?=
 =?us-ascii?Q?GYwCchIaVV6y31lSZfyTXYWHRoavFMUCTm5VKWeQjrNWCVCElkWGwpON2FhB?=
 =?us-ascii?Q?TOaX36bBiFUfSEporQ5DEgh/J5ZuOTRvsmRHJQ0bqsBYDBheydVjPFF2w0Rx?=
 =?us-ascii?Q?HihQlJlBeVVMHyjs+sR6imHSA2xlqKaBjUc+Vpo/ZUuXE8ilg36ErKpL4G0i?=
 =?us-ascii?Q?REZOCmg0g1Ae1UGiC43qceNHWe4a/MVBZ4owyVvbpmAZO1a0WRqbLXLvgfRb?=
 =?us-ascii?Q?p57SOD4szg83wDN24SUfL0m7aJjhGGdFvNwkP47lgSaoB3qZGwFpIIMD22N7?=
 =?us-ascii?Q?Qzz8n1JiURFE5bkLyv6J+EatWUKFO0e/HBAQFd7kn5sL6KtVpUnc8ucExbQV?=
 =?us-ascii?Q?Q+0EG+BDGprGH4C13SX93iQMBHBr9sRc4KmZ57h5RMFJ385lxGHLoa2qU4hO?=
 =?us-ascii?Q?ZfFcBx70VkeWEmyImgxrfB7qm4lO3YXAO+0gLbyDsH9Je2F5eksHL9Fhp4BS?=
 =?us-ascii?Q?NX+dE65bKVANeOSExEsCWETEMQbM1X1X/Fr7DBdOjHcEJu1KpQFqCBXFetyG?=
 =?us-ascii?Q?mXe+wvGHgqBFPJu56lFparKUrTwT6nhCIaXzZL3AN52wrQwyRcEs9ro7rtF/?=
 =?us-ascii?Q?SXI2w+RHPk3hn75Xk8fI7vMzWGFBK78wdJqt8okniGuOZUAltcY4Rn1JLtdz?=
 =?us-ascii?Q?DjCVMT+rcPw+CjYsgQIHeGmZPawNOWzH8fGoEoTyWzCcbnU9LUff1YGgCFlN?=
 =?us-ascii?Q?VStxTpf1JiVj4JuOJeG9H/7JcNRajzfNEqalbZndZE/169wgM0QqEoZwmcL2?=
 =?us-ascii?Q?kRu7Q+RAqScUbmpz8BgWw+IGUxFHAIPS9Pm8PDh2PfCXKyG5sEfCw5ezV2a0?=
 =?us-ascii?Q?gyBNfXjxLOAFxdwOQskQsJJbCc4L5NDkBq6mumhVOfu/fK+JxYjEACFuv3y+?=
 =?us-ascii?Q?XdF1/u8unYxlZOp0EjRq9zYzVxuhZm77j40OaKb17cwc5Cy5sTl/Kp44QMhD?=
 =?us-ascii?Q?RMHWGw64677pAJbKk0THkt3pc8TSq163DrSEQsiD2q0nc44Ab3bqWTFOI6Wm?=
 =?us-ascii?Q?QPZEfJifJJI4cr3WPKhVSkyDARxW0tKoDLAN9oEJ26jY1p9JiHryNL9dqT46?=
 =?us-ascii?Q?Vo3g0hfBz12eZxVzd0dJqd6fB68+a8ChisYfRqzw?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7678dc16-bfd0-4d3c-b4b7-08dda1d99938
X-MS-Exchange-CrossTenant-AuthSource: MW6PR12MB8663.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 13:30:10.9345 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e/+MfIZlMU7cmurItncCeG7Fi6ydaM64YqlNkbHqupblFZAQOPB12ENxw5Dri0aX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8782
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

On Thu, May 29, 2025 at 01:34:53PM +0800, Xu Yilun wrote:
> Export vfio dma-buf specific info by attaching vfio_dma_buf_data in
> struct dma_buf::priv. Provide a helper vfio_dma_buf_get_data() for
> importers to fetch these data. Exporters identify VFIO dma-buf by
> successfully getting these data.
> 
> VFIO dma-buf supports disabling host access to these exported MMIO
> regions when the device is converted to private. Exporters like KVM
> need to identify this type of dma-buf to decide if it is good to use.
> KVM only allows host unaccessible MMIO regions been mapped in private
> roots.
> 
> Export struct kvm * handler attached to the vfio device. This
> allows KVM to do another sanity check. MMIO should only be assigned to
> a CoCo VM if its owner device is already assigned to the same VM.

This doesn't seem right, it should be encapsulated into the standard
DMABUF API in some way.

Jason
