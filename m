Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FF8078D722
	for <lists+dri-devel@lfdr.de>; Wed, 30 Aug 2023 17:39:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8773F10E53D;
	Wed, 30 Aug 2023 15:39:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2D1B10E53D
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Aug 2023 15:39:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bvtTpP9jn19cj+RRXofx21k0cl+r2o4K2S/rM9+I4RjOvaW5mSM3I8uaG0sb/GcdecbEVm6Yb7t39muLPykVI0YFQCANKTX/ekALJz60BK0/oWPlEPkLrfG849r+F99R/4htIyYDk3dtPMugu8FjXMqzuLU/6EzefJVpQChe92Mer5CCDtLUZNPVa0rfgIiIhTndBfS25QnPkqBSbMlwZiEjo4dQMBw7L+HZuuQhvNLqkD3ZysU3uYtCsJR9M+Jj8J7EZgacz7twkx6m4oBRcMPJP/aHrkFEZkdI/NjxFquScDS4MnLvvNoInLTOUoGEr4Uu2ztA4jcEfBtl2aIkcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f80zHBH33jh0UHWVEcSjDiyba7Okf0sMouXu9LTk5PA=;
 b=kmFOahForVg+08G4aRzhxFE+TnBPCLnni5fcJnbGEULGQW3nsiB+fHWAW4QdHwkKdBsJ8ND/Cq5EcKlTtXDP+pKX99rYaKWXwsfiaxe+M2NLO78hZrNeB+EE8C6DE4HDAyEkEmES9e/rni6SET6MjVlLUfZ6OaEsYNDKVtvUf0tE3y0Uf3vylkOGKkl5yVB2FEvGru9XaF0wbYyucwhkSlq8t7pS6QMZjqoC2FYSX/tYOx/OrJWEmxuA5/L9h7UsJFP+RARFQGMblcAyORNeNnZDsmU0dzp+jNgpuPmuYIPX1pzWlpmc2clP2SUa7PIDKR5laMUNTbgWNqtRx94xZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f80zHBH33jh0UHWVEcSjDiyba7Okf0sMouXu9LTk5PA=;
 b=XZ/cSE/KaOKAnFYdclgqPcIGbFxSdmFztDgY9fKEE3C1Ne8Z7/2bAPBYHAk3wDQfjUJ4lp8iQF8lZ23ZJjW4gdwMpyu6NKhCjjuiu4Oq9sVKC61AMyXaNKFijLwiLSi+fYJ/9SQUJ7bWCmlcnHFq97Zy8WhX9PtOY2536Sl1DFIF0o+4NufFDgzj1PyE92GirTfCUzFaJat5B4mMAWswTSSyqlc/RRGeGOKhdjbrOgcsX5npKZBmdqyRQTm9/JdKMrAOaQ4AVg1Szx475vHcduUJcWV795PJRsQyG3K1Dc+owiLzEfgatms837/F+rvb1+9TQ2w6aDQLL5TgD0PuXQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by SN7PR12MB7882.namprd12.prod.outlook.com (2603:10b6:806:348::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.20; Wed, 30 Aug
 2023 15:39:09 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1%6]) with mapi id 15.20.6745.020; Wed, 30 Aug 2023
 15:39:08 +0000
Date: Wed, 30 Aug 2023 12:39:05 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH v7 1/1] vfio/nvgpu: Add vfio pci variant module for grace
 hopper
Message-ID: <ZO9imcoN5l28GE9+@nvidia.com>
References: <20230822202303.19661-1-ankita@nvidia.com>
 <ZO9JKKurjv4PsmXh@infradead.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZO9JKKurjv4PsmXh@infradead.org>
X-ClientProxiedBy: BY3PR04CA0028.namprd04.prod.outlook.com
 (2603:10b6:a03:217::33) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|SN7PR12MB7882:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a07154b-6dea-456b-eb07-08dba96f3ffa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Nu1gbJIuX0KO7Ls5WT6hxiBCIApO5yBuOBEi/OMT0hZEuDBULd+WC70GPk59gXFE8gJGFuKR1o50FA1TwpwFYhI9MoIZhS+5a3SaF/lwmal8uYpT8ZnZAN+id4EF2QhcHZ//HAk65o5hClQAOWYtfJxsltc54HrJaoCfLeOapNqE0C71h6PnKCwohMaQf1+3t3s/TXy+JvfVAzqAGyuadHbKFdL5inKKJwUhELq9V1GaY97KpJdpUrYpAcI8tdJsOi4n7l3e+ZJhKwKd4yjl6KEzvtYtEQ0NdsG+qBkHX+pToabt7tC2lY+44evhtg/VH+o2jD0lV4fqoKNb9UM35p2yV6HG8WDsFDOhV40YBKrT2Unhn0EYPeZyYgHbyry4B3CcTMOOLyDmTF5CB67eyEyMZ5bTIouf4HhLEXgjNF2p8gwjMlGv3ORvTH1hk5RaYYrVne/pCPrELFONo35FXhvITMPqcBnvvg2t6jBF3RqRBUc4wmzCdX1VKPGS3bTOFGvV6B+KHROIDc3oP4MN2++Q7S8exe60Zh6i3R0sAk2U05X1GPuOLjyQ2X95y9ap
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(39860400002)(396003)(366004)(136003)(376002)(451199024)(1800799009)(186009)(26005)(6512007)(6666004)(6506007)(6486002)(5660300002)(38100700002)(8676002)(4326008)(8936002)(478600001)(86362001)(2616005)(2906002)(66556008)(36756003)(316002)(54906003)(6916009)(66476007)(7416002)(66946007)(41300700001)(4744005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?px36TNw+FXvNut7l6Y6WPytoON4DuAByp4BjWnyMLQw44DRTjnocwjMfiNPS?=
 =?us-ascii?Q?g2eikeaoBn7Vc+K3P0wrbPynY6V6RAhXVB6tNVEyU4O+KYgpcsw+6ByPaGZo?=
 =?us-ascii?Q?vdvVNUdbq8xVc/wSx29Nj74dkuQ7+U88MsKqa6Y2/uGsNVLMObgi5WA0H2Iq?=
 =?us-ascii?Q?Vefzj5fuT2XEMKgCu+fbLyS2Ghp7CAvmbW6AiGE5qi35GnTS/Ye9YPR7OCva?=
 =?us-ascii?Q?oFRhP9dpbpwX2NN/XHD4jWWFohXavWZb3bUZyk0LEoDMbMmhDXscnQ/mPIA8?=
 =?us-ascii?Q?VFIhPcNUg9psJgqK+MlM8GuJT4AZ1z3TAle+lu7+q4s6nlXeLfN+gY3GcIXB?=
 =?us-ascii?Q?qD//VGulpiI1clZII9fE3rm4TdlBal9BIJTgtDuS8GYkQ8AzgtnVH4jRVXUE?=
 =?us-ascii?Q?8ok0ppSFnD8j2cvgg1gEAL+hCWKVN9HYef5l/p/Xy3wvbqkGFCG0ppN0QPXK?=
 =?us-ascii?Q?JhiuR5LqH2oooXFll31GLrSy5/o17XcaZ91WMdXcsWjbJNUUkp7WU308gQcX?=
 =?us-ascii?Q?g7Ii+NH4gmchmAbXuRFpDG6vD6B63ftex+cJMiGr2EPUewz/3Ouhu0eYl/fA?=
 =?us-ascii?Q?F1qCpAu10Ikkwm8KbN7nggSK7NGNDcpHojUnKJrx6JOwkwuxFGbJFf3Ii+ab?=
 =?us-ascii?Q?yMXEDLG63NSngohY7XisKojx6cmWjSdkQhmJowP+J4fRHim5j14YaDxBo8cE?=
 =?us-ascii?Q?mnQpiFDes8y64wENsivd2du3oRX48yZUV0dsXNiSxnCA//PEvDXO/9hc1it0?=
 =?us-ascii?Q?7uMx4WCxsWw6MNkhJFW+kVupGb82762lWiGMIe0vJb6TqVxd4MY1Nk9mC9bX?=
 =?us-ascii?Q?LTJ6PA9KOdfCD7NxOp3GBNl3/WLgvttZZaEXrXBiGRAoDlPkApsxZ+O0PiOo?=
 =?us-ascii?Q?6v0xLeBM+tdHUnKtEUjeVyh6MmsXW/VqHMs5NdpiJobz5+0VnXlBcXzpoH4N?=
 =?us-ascii?Q?jHwwtX0kCwdKsDr/WTeIFNE5ZLH2Z8mrNveKKs50EqP/uP1SK+GoNc4b5uMU?=
 =?us-ascii?Q?4mdxGcJqpYRyTZSQ8yKFIbvrq0qn3roLP6Y6Wo4mydPQb5NICFue918smK0s?=
 =?us-ascii?Q?/AvM76aDOKcequgyWmZBzjvqF/pgWSxt7gzZviNnE7SDsD6BYdmHTMLI1vKi?=
 =?us-ascii?Q?jCzPcHeKoCt/hGZLnOwJYfhRQJb/7Jid4zZd1hufj/IcRfaisYPw9OJf/3f7?=
 =?us-ascii?Q?K1ZM9LY81oQQZkdvjgMlPi5suXvYBGOdHONiy64zCdxFg2+fjvFFxN9u9sbJ?=
 =?us-ascii?Q?t1zG3Qn0h55G4GK7KDj5FmItOqSZKfc9d+tV5OaBbH6yzupEfldjN+wk2A3Y?=
 =?us-ascii?Q?+/u8gXhMEYFCmDik0bp3WzPCvTTj13rx/Oy3YLAIcWoPLxnQnrq42xz+HWk3?=
 =?us-ascii?Q?hh93GDvq5Hhjv+6QW9x4DV7hPDNfiw5ZwnBoh1KNuCaEOXxsLTA+0i5buaMT?=
 =?us-ascii?Q?juPskl+FwIrJ/S7/q1fAafwruOBx3D2txIPPc0ZFiHBzzgj9nJB+04KhoYpv?=
 =?us-ascii?Q?p9lsJ+aMr55LE9L26qZlHP0vghcRnKrgUyuSDX3PC+9+7Fw8RkY2/SuLKxFe?=
 =?us-ascii?Q?3K8SFILDAjXkbzAqMjwzRf/mcJR7CXYxoyDGbDli?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a07154b-6dea-456b-eb07-08dba96f3ffa
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2023 15:39:08.5252 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YS0qWO5qoQSsvjdaHIT4GBnK5AQoGwzoHx/fc1ahYQDnAM+YIkxZ86h+T3WYz5mX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7882
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
Cc: kwankhede@nvidia.com, acurrid@nvidia.com, kevin.tian@intel.com,
 yishaih@nvidia.com, cjia@nvidia.com, kvm@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, jhubbard@nvidia.com,
 dri-devel@lists.freedesktop.org, apopple@nvidia.com, ankita@nvidia.com,
 shameerali.kolothum.thodi@huawei.com, linux-kernel@vger.kernel.org,
 vsethi@nvidia.com, alex.williamson@redhat.com, targupta@nvidia.com,
 aniketa@nvidia.com, David Airlie <airlied@redhat.com>, danw@nvidia.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 30, 2023 at 06:50:32AM -0700, Christoph Hellwig wrote:
> I know I'm chiming in a bit late, but what ultimate user space is going
> to use this?  We should not add anything to the kernel that can't
> be used without fully open user space.

qemu will get the matching VFIO userspace patches, I think they were
posted someplace already.

> vfio has traditionally been a bit special as it "just" passes devices
> through, so any user space could just be a user space driver for a
> random device on $FOO bus, including an actual Linux driver in a VM,
> but this driver has very specific semantics for a very specific piece
> of hardware, so it really needs to be treated like a generic GPU driver
> or accelerator driver.

This is basically a pre-CXL driver. It takes a PCI device and some
non-standard CXL-ish metadata and adapts it to VFIO.

In a post-CXL world this same functionality of managing the 'cache
coherent BAR' for VFIO would be done generically by some generic
vfio-cxl driver.

Jason
