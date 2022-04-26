Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 858E650FC4B
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 13:53:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98C6D10EAE1;
	Tue, 26 Apr 2022 11:53:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2079.outbound.protection.outlook.com [40.107.243.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9065410E713;
 Tue, 26 Apr 2022 11:53:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hJ/qlFiDfvU9lksZlBxgKu2/DX9s9Vv/+NJd3DPWhf2QhrFWO9RRhgpt5w+/X12W3/D6xgpDRS0pOIzpTry2vIpU41swcKM6wVE4qnWnqdVvQWHEPx4tvLKUCLL4h/zLbIb2jrQ3dQwmqZ3pAP8euzSg6Eteu3JU0V0kaFK8fXFyfrRuEK8r+o/zpPtvgJRvBMAYgcP4SXkkJess3Bpu3lHlhqexv7BgLJQJs3LX1uF8Q0HplrfS+4mw6ofu2f6kdxMCMC6l7dOoJke6UCkE40gnybfRomhT/pajZiAVPlr3TwE6Y9nJTIxHFTq0rr57QvcwxxyBaP91ITrM8xRILg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m00F9TH4emmZUqxQZEg/h+xnvliX7d204ozX2pM7BDs=;
 b=a2lRSIZ32q+ikzApAl5jZ1APDkYo9eqxSnVX7RqClfIzAuOtrpSyramPg+yAWDJFN4/XPsVk2QBVsPmsETeQDDjWPRtO11aamgXxdj18NngtXyyVlVqbs/yaWAltSKojFo8Z/yk19AaVqLPZnJjjKNIQk4eFeufFOaOaCbHtmXgE+b+zsxMbKJWZUCkwo0rXqiFJZ7aG3ApLgDfR0nwv250nMelbxwzrk30tubIGWAwQU+ho8/liaARqz4F6pOqxydWS1SmAW+TGO0v+bHgG+YoIUHaZ4G8bBqpfP6g0ckFzmyHftusTcuROYzjWJVDvqEggcnbRx88NQs5zByV8Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m00F9TH4emmZUqxQZEg/h+xnvliX7d204ozX2pM7BDs=;
 b=G0v8Nb588fLkOrQ7jNMX+P2sBB1N7Ay6GN3f6uspu1y/NYVKUi5bV5hWyF46eRJ+MXIbJqChESVLfmo+tghlQ5DalZs+rs8sZ6DfdOXE4idSCl01I0qS9egSBT1OKuNmKODQG8WnBozS0VuPmlEadqewxZzoPrJrOZchpL7TgL/YYRfbXb/ekBYUnyUaSTMUveNhGaaeRx7qeAIz3ni0daggToYi5c1C0P/NECRN5eF5xcKCOmwxpTleZ70JhO1YuAaDfqWa0BRx9fm9WMl5XjhkLLjOxeZEdciuuECecsg+zqcREbu2v6bI8orUL6ShO0IHxcvgDK/vaYiwA9kvkw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by BL0PR12MB5507.namprd12.prod.outlook.com (2603:10b6:208:1c4::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.13; Tue, 26 Apr
 2022 11:52:59 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ec2d:9167:1b47:2db2]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ec2d:9167:1b47:2db2%6]) with mapi id 15.20.5186.021; Tue, 26 Apr 2022
 11:52:59 +0000
Date: Tue, 26 Apr 2022 08:52:58 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: "Wang, Zhi A" <zhi.a.wang@intel.com>,
 Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [PULL] gvt-next
Message-ID: <20220426115258.GJ2125828@nvidia.com>
References: <c5cf6773-e7a2-8ba8-4cde-0bb14007bc6b@intel.com>
 <87zgk8tf3l.fsf@intel.com>
 <a0800c9b-71da-1cad-1dd4-78c0910ac266@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a0800c9b-71da-1cad-1dd4-78c0910ac266@intel.com>
X-ClientProxiedBy: MN2PR19CA0020.namprd19.prod.outlook.com
 (2603:10b6:208:178::33) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a1f4d31c-597d-40e3-dc24-08da277b4f7e
X-MS-TrafficTypeDiagnostic: BL0PR12MB5507:EE_
X-Microsoft-Antispam-PRVS: <BL0PR12MB55076477C278C05FA900B178C2FB9@BL0PR12MB5507.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Q/i46AlRoDNM/aDPLgaPWfzrRYqCYORL8s1XqhxfGh2LUiYyDhjHheuw8tPJaXa5yjUpxayzJ5RFboT/kVH1Hbn26waAEYyM5GYZfD5QPpMjXhCwPIlXV0PPhcKIv4PvB9VKKf0LHD82VVWu1mwIKAehcCI+/PvHDRYlPkpNo5C+hJzoTKRqvO9s71RT1E+xt0CPBs+lRBEZqo2JMsx5cFpx69tRwFD1u7oM6qykukB3N9Ueli60BpZSSZKdKYV6+rzQZlTnNfegQ4WHTi8/KtU9YCa0SnaBhcEAzsRgyu7MvxluUHdyXWpzHhqTFBPzqJUWwZdUD1yaU0k2MlPu+W1pKsAL5eym5yafXK61w/o3eWLdzvfXIFWixLXIpt65/VG0X1UMRPUXfRyUvvKvbr2OTSEgKpSEleBl5XJ5dt5DKke5ZHfJzsXK2zJUeAF4eEwH48BI/fgUdCZW/HeOtPDGeJHjY+dYPlJD4D78wX3L29X8TdYdkw8ZF7+TCsRVHW/NW/4pgduVRPrQvraVBWVPWoNgsWNa9Hd5DchnsSum9LNdhauB1Js7N5jn4BhKJoigdmVX4bsbi1GvCu5d68SVZWzYUCYSUtBpi3N1iymsDK3LBcF2IfPEjEd4CtRYGNt4+epGTmrb6041eowFUA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(36756003)(6486002)(966005)(7416002)(316002)(2616005)(6506007)(1076003)(53546011)(26005)(8676002)(2906002)(508600001)(110136005)(33656002)(54906003)(6512007)(5660300002)(66946007)(4326008)(66476007)(86362001)(66556008)(38100700002)(8936002)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ed0IlamPD2esIEZnMyncHn3ZVkpiwOg4b8UE7PGa09Dp+KB51zycBYm/McQM?=
 =?us-ascii?Q?oYzeFwinUvZBVHJSeNk/n4CblDyHb9YOY/Sj1XOSzwAcOeDYG1ObhjN5Edge?=
 =?us-ascii?Q?nfFrBUSr3Fa4EYJXrR+WEi5o2TCtjSqT5SmPO0FN1xg5+GcxQ0QAmAokqd2S?=
 =?us-ascii?Q?mLboHjyGiH9VrDYs8RzkT9sWG/0AGPUbpyFdOA93ydYDiJbpj/sKhxLZ5PGq?=
 =?us-ascii?Q?BgXkjOdWkt0rDWCau4fWDrhAQ31yjuLH0okN2b4DkOt8gD9lfmWvSW2047XV?=
 =?us-ascii?Q?50CMPWUazCcLtrAQzhbJgR1PaC67HPpkQ7Ai13ztF7xnJOY/0/UmqWDDmGFk?=
 =?us-ascii?Q?LY52iyRYQq8ykZSFq/evTdvCx/U4g8g6oWT+tk8aw0UfqcFPmKGtzJoUG6fm?=
 =?us-ascii?Q?b8aE4OyYp+XqLJqclsZ+KI8LBiOOYSa3wzPHste3ZaOIzu9gDIZjycDkUTOA?=
 =?us-ascii?Q?Tw0ZXecW2iDESmUkbGL5AcDkSNPAkTzoPKuT6lpz4F3uWRVpn+JYDUcmy91C?=
 =?us-ascii?Q?XvqgbfsM0x0v3PlhDlocnx/0mXrHfgXVCPWo63L/zGASvsnWpnDjU5g6NUTc?=
 =?us-ascii?Q?p2cxOOzXUBvItNYiesfzQMgtjoK8iA6Kj+R2UCJlJG+g8R6yj4uS/iyaSFix?=
 =?us-ascii?Q?qI0bBEXwEa0eE+P7aP1inG9H9BzBlgMugXcyBEY4j7hShWezvHFnq8FIyf7Y?=
 =?us-ascii?Q?2dWrVZ0f68hOgcLGVJWRGD8ocmrjo25ifeszcb9uQz/9H8Gg+dWm6zrsa4RZ?=
 =?us-ascii?Q?xrrafnoeGAP4egpQ37uRzTGK1w5BKH6hH1Q9TwNEjtf4mqj6rjOzWxxaqySG?=
 =?us-ascii?Q?z/0iRTjmTyxJxDQHOHk6zdyynT84cjsj2q4QMBx2gljFbhZM4B7KhylPolFJ?=
 =?us-ascii?Q?gszhlu+GITZSzvsNE4cnv1gVUyrkW1HwkO1iLEhLyG08Ke5BQYHM6ic3zyeg?=
 =?us-ascii?Q?bCWSA2FTFCj84gS3Tps9yBjQfR5ZHs28f08hWfhbP4I0S/0yEUoUTLeU3urV?=
 =?us-ascii?Q?CQqvnIf9wo+OYPNm9ksg3YN+JQXhYmvTxt5reNQBTCIpieFErszBGfFJSOip?=
 =?us-ascii?Q?aSgccXTQ+Y/U6PrMvgITp3o7J26TXhNUqxa2gauqpZmz6B6oqhb71tDjvhyt?=
 =?us-ascii?Q?RH/QAjMklXHopjR+3iJorVbcekt4J/9W2GGCiR2RKCt3bvh0TV0zvF2LbW+6?=
 =?us-ascii?Q?LjZhsGFbhyhFfO0qgT66MJ/3mZIOhgZnqgKc4/Z//WOL5pfAwdE+/8ftNsya?=
 =?us-ascii?Q?tgtyPO9JwkPSno95jsFAZZRYorjOzIhjbjxKiWEgsDRxD+4xZLDRcqbbFWKf?=
 =?us-ascii?Q?9L05/x0D4Wx2jTN24ew6c0FeQHz5ugcSXPuXlX/g9fO5dKdonS7Zz/sBpXbE?=
 =?us-ascii?Q?WrXwWFFysJxbpeFAWC5rgXmfnXaSLvtMTX+2sGf4IvplvkMeAa5ZNvmmer2c?=
 =?us-ascii?Q?4nHpmEqZj772k2idVvxXvIB8kFVql+Raim96OvGYffUZg79LIP+4RpPR63vh?=
 =?us-ascii?Q?ciRTXDSCfPHbc4F5DNbUsEDT1IRRsNngFItNNlfZh4cd3CaPBX5VFZK2+qKo?=
 =?us-ascii?Q?8gsqRmRz2mx1esHHMubfsZ30Zsdc55jRhCERuWybl3+AoC1NBcfDogMey19O?=
 =?us-ascii?Q?IVxiJdGHBcce/kq0pOHRSOqhdIzi0FhGmenZKEvQwuOUxS5gy794t+EGB25u?=
 =?us-ascii?Q?d5kV0G/ihDAF9YxK2G2Ogl+QFWJNFhfEiTfsAC2ksw1YAyQY+WAgA0wotNjT?=
 =?us-ascii?Q?5lxZXv4sbA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1f4d31c-597d-40e3-dc24-08da277b4f7e
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2022 11:52:59.6083 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XPPaFMZ21jvWRwBIzCbLfRyjDApyMiqUqG1mIb7HNfBWJmSpZl+Bm5B2jEWmhsq8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB5507
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 26, 2022 at 08:42:25AM +0000, Wang, Zhi A wrote:
> On 4/26/22 8:37 AM, Jani Nikula wrote:
> > On Tue, 26 Apr 2022, "Wang, Zhi A" <zhi.a.wang@intel.com> wrote:
> >> Hi folks:
> >>
> >> Here is the pull of gvt-next which fixs the compilation error when i915 debug
> >> is open after the GVT-g refactor patches.
> >>
> >> Thanks so much for the efforts.
> > 
> > Pulled, thanks.
> > 
> > BR,
> > Jani.
> > 
> Thanks, looks good now. :)

Great! Thanks everyone!

Alex, can you pull this to VFIO now too? The top commit should be:

commit 5e9ae5c47052e28a31fb4f55a6e735c28d4c3948
Author: Zhi Wang <zhi.wang.linux@gmail.com>
Date:   Mon Apr 25 18:03:31 2022 -0400

    drm/i915/gvt: Add missing symbol export.
    
    When CONFIG_DRM_I915_DEBUG_RUNTIME and CONFIG_DRM_I915_DEBUG_PM
    are enabled, two more extra symols in i915 are required to be
    exported.
    
    Cc: Jani Nikula <jani.nikula@intel.com>
    Signed-off-by: Zhi Wang <zhi.a.wang@intel.com>
    Link: http://patchwork.freedesktop.org/patch/msgid/20220425220331.24865-1-zhi.a.wang@intel.com
    Reviewed-by: Jani Nikula <jani.nikula@intel.com>

Which was picked up here:

https://cgit.freedesktop.org/drm-intel/commit/?h=drm-intel-next&id=f08699ec5bd924be4c9572e21fd0a806d3fb34c2

It will have these commits:

5e9ae5c47052e2 drm/i915/gvt: Add missing symbol export.
2917f53113be3b vfio/mdev: Remove mdev drvdata
2aa72ec97ce9eb vfio/mdev: Use the driver core to create the 'remove' file
6b42f491e17ce1 vfio/mdev: Remove mdev_parent_ops
e6486939d8ea22 vfio/mdev: Remove mdev_parent_ops dev_attr_groups
6c7f98b334a32d vfio/mdev: Remove vfio_mdev.c
cba619cb0d4d66 drm/i915/gvt: merge gvt.c into kvmgvt.c
978cf586ac35f3 drm/i915/gvt: convert to use vfio_register_emulated_iommu_dev
0e09f4066ad11b drm/i915/gvt: remove kvmgt_guest_{init,exit}
7f11e6893ff01b drm/i915/gvt: pass a struct intel_vgpu to the vfio read/write helpers
4456641232e2c1 drm/i915/gvt: streamline intel_vgpu_create
37e4bdbd5bad71 drm/i915/gvt: remove the extra vfio_device refcounting for dmabufs
5f8f3fe67cd908 drm/i915/gvt: remove struct intel_gvt_mpt
91879bbaf8890f drm/i915/gvt: devirtualize dma_pin_guest_page
8398eee85fd009 drm/i915/gvt: devirtualize ->dma_{,un}map_guest_page
4c2baaaf764bfb drm/i915/gvt: devirtualize ->{enable,disable}_page_track
4050dab5981cd4 drm/i915/gvt: devirtualize ->gfn_to_mfn
bd73b4b193d450 drm/i915/gvt: devirtualize ->is_valid_gfn
b3bece34956f86 drm/i915/gvt: devirtualize ->inject_msi
4c705ad0d784fd drm/i915/gvt: devirtualize ->detach_vgpu
f9399b0e4a9555 drm/i915/gvt: devirtualize ->set_edid and ->set_opregion
fe902f0ce686e8 drm/i915/gvt: devirtualize ->{get,put}_vfio_device
e3d7640eeeb306 drm/i915/gvt: devirtualize ->{read,write}_gpa
3c340d05868d98 drm/i915/gvt: remove vgpu->handle
10ddb96295f3bd drm/i915/gvt: merge struct kvmgt_guest_info into strut intel_vgpu
62980cacc37f58 drm/i915/gvt: merge struct kvmgt_vdev into struct intel_vgpu
3cbac24c2cdbfe drm/i915/gvt: remove the unused from_virt_to_mfn op
c977092a997708 drm/i915/gvt: remove the map_gfn_to_mfn and set_trap_area ops
675e5c4a33e20c drm/i915/gvt: remove intel_gvt_ops
8b750bf744181c drm/i915/gvt: move the gvt code into kvmgt.ko
f49fc35799fa63 drm/i915/gvt: rename intel_vgpu_ops to intel_vgpu_mdev_ops
367748066eeb37 drm/i915/gvt: remove enum hypervisor_type
a85749e12d66c2 drm/i915/gvt: remove module refcounting in intel_gvt_{,un}register_hypervisor
7f0cf30187cdb1 drm/i915/gvt: better align the Makefile with i915 Makefile
de5d437ae8696a drm/i915/gvt: fix trace TRACE_INCLUDE_PATH
1672991412dfef i915/gvt: Use the initial HW state snapshot saved in i915
66e7a8063381cb i915/gvt: Save the initial HW state snapshot in i915
e0f74ed4634d6d i915/gvt: Separate the MMIO tracking table from GVT-g

Thanks,
Jason
