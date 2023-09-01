Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CEBAC78F672
	for <lists+dri-devel@lfdr.de>; Fri,  1 Sep 2023 02:44:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B020E10E46E;
	Fri,  1 Sep 2023 00:44:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2076.outbound.protection.outlook.com [40.107.100.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0704C10E46E
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Sep 2023 00:44:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zqh3zLnry/CcF3Hllt3SMqRDyQBpsbKXK5kM2aH6zwPv4snBzC6P9QzoVDdjPLO94jJBaPLlQx3ueE59N3xxonSMDvyrasrl6+TLqesARJMS7uvyKBGHszfz4Pum1nM8dcJ0/FWoG7hClXfz+TaCt9BwZS7V9v9sIVPK0ZCY1UTMbU9/1J5cofqcMxsyJIJO9mIPlZdu1ppfNvZYwh9KCYKhBtNGaKdpNSIHQblDYsHqCwwHwAywaw9FjbwInEprZtnMicn6d14ZGqPPisZSnUjI7DsvHO1z+9xHVDKVJukfahg1BkdC/tpXEmn0bbySTdgAQkdoS7h9uxiu1lSO8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q26UUkOUc1hFrwUTWomiHGn0+MmPQ2ySsxAnbfkeDHY=;
 b=mYBNim/KfPVf2K5aTOa9JUeoeA4RPZEfJeX79MRZiW1P8vUQ2aJEpRteD2Te32fyMmM54HRb4N9etq/rdOFDXELoKTo6pEQEyGwDtn7rJFfN6xsgurEh5exDd9i86S0rGQvkLA+lZtE37VMPiyAasEZnRUY8ZkbD99Yj4pFQJixc9M0sapTNFitBWznsQTsJMPA0WLHQNlYid3zdtrdWL4ZlTAOZVr/zjZgGQFFcl0hjciwtlrwF2QrEUb197cTIp3h1BOQE8MJ5maRXEO1TWaFGPI/jBOvRMwgITags+IhWhA3mZlF2NXkMLk8EGZnN5Gpw7eE/v5Ba+lbY1C5zhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q26UUkOUc1hFrwUTWomiHGn0+MmPQ2ySsxAnbfkeDHY=;
 b=GVZ2ka65tKu3aWCrWeBKuqOyqoxN78LQqsIKDWd0LaCJA/LHALcjNkHbep8anUEfye/zykysepJerVKnPmDS0lCdbkwrWhlP4Q8HVEKEGsj0TWlFK3HhuJkVtr4HUREzRhUXy2m+wjSTvLULzo5Zw2J21464Dc2SIc8ApGgqO329G2eU23uURzohCaiJOt8H74a0HKhowMHpoaV3IDnwWYsCAUtFPn5GWeAO4fqkFicLWQkPe48gwUnOFIfwdTSJrr/naVFiV03mjdlj2yQ22aeO96FD/muTlWs7p00g0GuY29ND/GvmJH7paqqwrOJ4xNkr2cz9HT8/CYu6Qy7zbw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by PH7PR12MB5999.namprd12.prod.outlook.com (2603:10b6:510:1db::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Fri, 1 Sep
 2023 00:44:16 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1%6]) with mapi id 15.20.6745.020; Fri, 1 Sep 2023
 00:44:16 +0000
Date: Thu, 31 Aug 2023 21:44:13 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [PATCH v7 1/1] vfio/nvgpu: Add vfio pci variant module for grace
 hopper
Message-ID: <ZPEz3fy78wFvRuCB@nvidia.com>
References: <20230822202303.19661-1-ankita@nvidia.com>
 <ZO9JKKurjv4PsmXh@infradead.org> <ZO9imcoN5l28GE9+@nvidia.com>
 <ZPCG9/P0fm88E2Zi@infradead.org>
 <BY5PR12MB37631B2F41DB62CBDD7B1F69B0E5A@BY5PR12MB3763.namprd12.prod.outlook.com>
 <ZPCd2sHXrAZHjsHg@infradead.org>
 <20230831122150.2b97511b.alex.williamson@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230831122150.2b97511b.alex.williamson@redhat.com>
X-ClientProxiedBy: SJ0PR05CA0153.namprd05.prod.outlook.com
 (2603:10b6:a03:339::8) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|PH7PR12MB5999:EE_
X-MS-Office365-Filtering-Correlation-Id: 68863643-61a0-4ad5-b8fd-08dbaa849196
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Xl7lOBvymrA7zOiFQdl1hwxWGbLmt9iXDzwF15C2OzWS2uYq8xpo+EvTDugWgHbQCy4jFYUcrzklZEpKhRlRKLUjadHQatDH1UtGKtNe3GoDZ68wFHLSyIatLAecZLjVG4gfm+dvtN+73cddgh/cNh1v5HC61QDCSPltTEGcuhJ8STL8pBUicfDE4JIKukQ7i4zLOiczutzlavrtjRKy3xJcAv97dTHlkZ20fbAhFeBntP5kz/r7z51fPjsh03wl1gprIXuV2WGmntyHKwmczF10D9GKqDxz0VBzNrme2FkrV2JopXFTEkyoqxX7AI9QfVTWJKY6n3/QOrqls6D9rHeN5gPNLxa5DbV9+OQEUgIxSd7RYFfVkdZuPhDc8jtQFC4YDhcBZFemZDz3RhMz6OotNsRfpbHb0XOrfnh2pYFSlIRmJQ40dNcHkfKEN1v4LGLpirqkE04Czj/S64qIF/EJS0fpJkTVEdf3RlmlqWQ35pqgTP5iqXNamJQCSr1jqAxdDgcp9HLhKl8JMcacehf+RiKkgozA6/Xsgm1Cn31ZOBMFw1ps/fATsl/KFAQC
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(396003)(366004)(136003)(346002)(39860400002)(186009)(451199024)(1800799009)(6666004)(6506007)(6486002)(6512007)(478600001)(83380400001)(2906002)(2616005)(26005)(41300700001)(7416002)(54906003)(316002)(66476007)(6916009)(8676002)(66946007)(5660300002)(8936002)(4326008)(66556008)(36756003)(38100700002)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zTVBfVtnvm3sm/mmbM0kJE3WQkTrDoDQX0nQONBBU2VY6Lguniclh8i2HEUh?=
 =?us-ascii?Q?T05V9j5uuS8AnjuUmKoQgA8c+C7n9gOOEz0VTbOwQLUn8CHlCvaHJw+oypgK?=
 =?us-ascii?Q?YESLMVUCfeL1jVukNgCHKSihtk38VXPwb/34pc5j0uV5b9DYrSS2YFiHpSr2?=
 =?us-ascii?Q?BPICwuC9M6UC7mJjLIxvLtl2NjQg0ID500G+Z2GKHuLbNKoYOaQm4iBIDJR+?=
 =?us-ascii?Q?5519Vr9/me6REdS+C4jQqRGO1zTjHX42kVIgq8KBTNjQD25cqHqbfq06pmCm?=
 =?us-ascii?Q?GCN1iz0oyib0a5iYCLi6o11T3W/xtmdaTkOV1uToLCiRyua2AGP2oH3mfsMG?=
 =?us-ascii?Q?9JBZ8xWkR1xhB9H3H/ZNyi1/jyaOgf4Bf+zqtm/7ZqYHTUNsojvtb/MJsUzq?=
 =?us-ascii?Q?rJxLk2nouTYxEhdfKETUOP4jrtngPUwbTfvtCR8LbZmCmYjHRW26HlRzeFcN?=
 =?us-ascii?Q?5tkezb5MzRPA7bRutgk1fvJ+weYgBJbHP8pOUqRuPEuq60uWkTM/OW4awGpM?=
 =?us-ascii?Q?z238393W01K6QgfULp5OHyLBP8GrTT/MrIK+PjExFSZ8wMQBOlVPiXOQiKbV?=
 =?us-ascii?Q?Y1AYUoOta+sM2uWs9G6LcGHz7CiRAZwozqsmGhojQXiCS5nIfV5lA00Ey9uA?=
 =?us-ascii?Q?SgpptftjfODMZQweKtNJXe/QVJpT9V/P/kUvv+9ltc9xtLtY6TYEk0GqcoIN?=
 =?us-ascii?Q?BdFE89ABbgCKiV5sqfN7zMs/SACcOmVmq1xAUfu+ScexIb6a19JXgNHA+obM?=
 =?us-ascii?Q?nHPOInVbiZywozbBCEH+q9pEd4qrVYFGnJwJUekFjQy2thr0bcCJmfQdmKPc?=
 =?us-ascii?Q?E8/ZHbNyzPw/q7yZbOdb7h+lzH12LXCGqxsN7RViRXqlH+PwS+niAm0Pq1jA?=
 =?us-ascii?Q?OkCVi62c5he7bFksLTTulvbz17ujsXzYHBUeoEMLyNVH8xn/EA6kqvd15VHs?=
 =?us-ascii?Q?g4laFag3pnO5qRRsRlfQHzBHaCS4fqvQp/qvwaS6H/z0WY89MMHEkQa7Bq/4?=
 =?us-ascii?Q?wyZTCJOmB+F35BTGFlaHJ/ZZQgfeKbN5GWIrR6wZr3nZFuDk3TJihqLuD6/0?=
 =?us-ascii?Q?uxJ15to7voVbecQBRNG9yt8xduzxqBcIThY7d2WgX9Ob7sqFZxEOIJnbzSfu?=
 =?us-ascii?Q?dGzIcO9Q9z9JLaESkBHIlG0pYmR4Rn7gtHVCfr/zzj4wifCv4P5wssfpSKJq?=
 =?us-ascii?Q?H3PWC4taGQOxXLB+PBCgnFxyB/TnWNUlWCrA3c7fc2ZXBhGgu+VFvF1+Ed+x?=
 =?us-ascii?Q?8oksCMYIunWTvomBR8Kh0L75N/hHg4vnLMK+F/995+EnhMF0Qne4dVsT1uDr?=
 =?us-ascii?Q?UAo9waDXUWgN8mjs4qD1aZ7dQ+URN4GDcUBXX6zVmAUKncGPbCFYNY5zjPSj?=
 =?us-ascii?Q?Haf4wupxdtpn72iPnV37FqHue8VQZzOkPIt4IhzqXHwFENokYUU0vCisQccw?=
 =?us-ascii?Q?qTVvQw7XvblnXCtvOCFlFvGFh31A0JSKgyfCTOo2qQbpgQLAeLGoDW4L3foa?=
 =?us-ascii?Q?bFNaCY2E0xk28Vu24Ua+YX7pFayQ6FQ8TUDCwxX1smTUAPuy2X28Nw2/1Mv7?=
 =?us-ascii?Q?EK0Ho+3WJODh/i2spQQcvIV1w5x3HCa3XFIamwz9?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68863643-61a0-4ad5-b8fd-08dbaa849196
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2023 00:44:16.0566 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7HcfgIO/eMibIuFNca1onhMowP588SETQXtElmkCSEAfNmjg9zNGCKON/G5yjO6V
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5999
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
Cc: Andy Currid <acurrid@nvidia.com>, Vikram Sethi <vsethi@nvidia.com>,
 "kevin.tian@intel.com" <kevin.tian@intel.com>,
 Yishai Hadas <yishaih@nvidia.com>, Neo Jia <cjia@nvidia.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 John Hubbard <jhubbard@nvidia.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Alistair Popple <apopple@nvidia.com>, Ankit Agrawal <ankita@nvidia.com>,
 "shameerali.kolothum.thodi@huawei.com" <shameerali.kolothum.thodi@huawei.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>, Kirti Wankhede <kwankhede@nvidia.com>,
 "Tarun Gupta \(SW-GPU\)" <targupta@nvidia.com>,
 Aniket Agashe <aniketa@nvidia.com>, David Airlie <airlied@redhat.com>,
 Dan Williams <danw@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 31, 2023 at 12:21:50PM -0600, Alex Williamson wrote:

> I assume the above driver understands how to access and make use of
> this coherent memory whether running bare-metal or virtualized, so
> potentially we have some understanding of how it's used by the driver,
> which can't be said for all devices used with vfio.  I'm therefore not
> sure how we can suddenly decide to impose a mainline driver requirement
> for exposing a device to userspace.  Thanks,

Yeah, I was comfortable with removing the old powernv VFIO stuff based
on the combined logic that the platform was dead, powernv has weird
arch entanglements and there was no open source driver anyhow so
maintaining the mess past the vendor lifetime was looking bad. This
has none of those issues.

I think the threshold here should be the maintainability of the kernel
and its associated open ecosystem. An open source qemu, and a open
source VM kernel driver is a pretty good situation to sustain this
driver. In particular if Alex&co think the qemu side should not
advance then this should not be merged.

For comparison, I'm much more unhappy about VFIO_UPDATE_VADDR from a
maintainability perspective than I am about this. There was a half
hearted effort to get the userspace side in qemu and now we are now
stuck with an ugly kernel side mess with no open source userspace so
we can't even test. :\ Considering the vigorous objections when I
tried to remove it I assume a cloud operator is running it with a
proprietary userspace.

Certainly I would strongly support removing kernel side parts if the
qemu side doesn't get merged within a year or something like that.

Jason
