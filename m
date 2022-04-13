Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A796F4FF946
	for <lists+dri-devel@lfdr.de>; Wed, 13 Apr 2022 16:45:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8BAA10FDC4;
	Wed, 13 Apr 2022 14:45:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2052.outbound.protection.outlook.com [40.107.100.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6CC910FDC4;
 Wed, 13 Apr 2022 14:45:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ELWf9upQE4NXXHNxE5Kkp2lkYQdBB1swNyMv71kESkQZklFbMTMEkO0qYrji4lQC8CdREdLOestO0gKB5QIvykYoQkIJUHkiQFg/Psybd0mowqaX2IvYpOkeU42HC+aU6k3hYT0BT6ppO1w0VKe7FbSvCgJg7WYWtR/nNWE6p+zUUhousu/sez0Ch+Ja7kIKZOKkPLTCMAsRIv+hmjz6KTnlKYW8OLpYhe/69wofK32S9ANmtZHyl5qzjE7KsXGjtqKUAMEmPvPdOXO2w2ebxlM3mmHff1OPMHsT7jwyQQ+RCH64JggNDRrANFHX/1eo5LXvt/1QoN8upByhPgc5eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mN62iiyNElYbW9zBQNYmwUaxi8isWLDHmyVZ4SG+Vak=;
 b=Ueiq9YwlBI3u1T1zO/DMY70MSQwYoYfWMHLDMha2V5riNPnxPLQNdLY5k8xI9v5JEGlnWZ3ZttR/4NXYTG+l16f8cal59I44SEgCf9hFP8xgM3IMiYPNSGhyknIRb99f4Z/uJF2EIBmEf97h6Tu9od7mgLQfrpTqi+SgYTDVEcR72xR/WQKBUivI7a3mEwgYpt1IPYvyyGl4tTq1wjkkSvmomN52vkTamORSIU752Nf1I0+rjnwN077KyHoYZQfEMFUpHC+7ss/MX6M1+dzCcd+FyxqM/wY0D+vuN5ym2VhBGKjrNzee71uzvGpxbLy15G7QZjcrb8+TDHkn6B5bmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mN62iiyNElYbW9zBQNYmwUaxi8isWLDHmyVZ4SG+Vak=;
 b=iS65fxVNksPqMx3ikVjk4ZwXev/AAQw5ZdqjEPywyMTYX+uaVSohikbTmgL1v3tmtnBUx7UNkt0bEg8AacNDVbhZJlQl0DwfsiXimfYzxMoQyoKFnxn9tMMEj+8BiJ8lv4zIgtz53K8e5HJtgO7SAVZRE9ZrTYRe3LihZkl1taQiHn/qjC/Dpk6MjOAXY4fI2C01UhzwG8bYH9dipr67sdAocy0JzlSk8VDC8/W4G1PSwI1ENoZhgTnHmhku4Ex2Xwt8jhY+6CAoOyuYU0biKA8WI/mqRRvnvzLbYw2g2G7fU1y86co08JW2tYDFjDQ0AyMjcAlYaIYbs9hWN5w2Ew==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by DM6PR12MB4987.namprd12.prod.outlook.com (2603:10b6:5:163::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.18; Wed, 13 Apr
 2022 14:45:49 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ec2d:9167:1b47:2db2]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ec2d:9167:1b47:2db2%5]) with mapi id 15.20.5164.018; Wed, 13 Apr 2022
 14:45:49 +0000
Date: Wed, 13 Apr 2022 11:45:48 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: "Wang, Zhi A" <zhi.a.wang@intel.com>
Subject: Re: [PATCH 05/34] drm/i915/gvt: cleanup the Makefile
Message-ID: <20220413144548.GR2120790@nvidia.com>
References: <20220411141403.86980-1-hch@lst.de>
 <20220411141403.86980-6-hch@lst.de>
 <20220411152508.GH2120790@nvidia.com> <87zgkrha7c.fsf@intel.com>
 <20220411165121.GA26801@lst.de> <877d7tgo33.fsf@intel.com>
 <e8cdc103-f683-0b73-70a7-807f6fee0280@intel.com>
 <20220413134307.GC368031@nvidia.com>
 <86ee8fcc-e021-bb9f-fda6-a8e85cb1d9b4@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86ee8fcc-e021-bb9f-fda6-a8e85cb1d9b4@intel.com>
X-ClientProxiedBy: BL1PR13CA0237.namprd13.prod.outlook.com
 (2603:10b6:208:2bf::32) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b97681dc-72e4-4d00-998f-08da1d5c4d2e
X-MS-TrafficTypeDiagnostic: DM6PR12MB4987:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB49875D7C97B30A2A97F66384C2EC9@DM6PR12MB4987.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iErStcUXEngndTBKXzEIgfY5mte3r8HfgCmbnsadD9eo/pN4+Z78q+yFyK1+bOfn19zMgVbD5hDchcVqDClUrmu1/LTHeocLIx91bSyk6ZfPee4PdnpYdxZK8uHK4AT7YdsHGHbBipbL9Jh0EKlU+t1W+2Bbo68RR5yfunF2AfzgjNmxFGnbzocGRA1e+nC+Ao4NmtexbBpUicl4FVAJnhHgeBcdV365vdJvxngDPavwNnxU90/Pwz75qwdW6dgAZVO8mBn4StbIZTgf9L/q7jiBsY0KKXBhqhYJbSgVw8FwaRKDgaIbNMUR7mzQR53Dn15Gpp+1CVyczGNZKDLdF9QLL5VAb4AEt+nFiqw6muAwRJtdkeTmOSaVOLvxbcC6UXMmgBi9LlOS+LvRypni8TfwCkOnZx92HMx+SlTIvnmCY0ObQX4bIsdprTmfBLwS7mN+OFP/YjiqcpL5bv63lt81OrJ+yHXOFDt92DUunduqm5r96LccFOCBJLk7B77SaOKrHMXZzn3DhW2ffUvG0+/KMCDXGiTa+G9Zh+qPlvgHXbuu2Oh8jb8XS2oI1i+9meW1NLS8hb+s7xLFAk3z8PsSFscAzzcxDg4B/UK6Rc3+dKlh+VN8PP8Oj+UE86EGQMj/MyBm87RYdvqDAGXIEw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(8936002)(83380400001)(7416002)(6506007)(54906003)(508600001)(26005)(6512007)(6486002)(53546011)(1076003)(86362001)(186003)(2616005)(33656002)(36756003)(5660300002)(6916009)(2906002)(8676002)(4326008)(66556008)(38100700002)(66946007)(66476007)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gjiI2qlwiHf+wK0Mtl6SOP2eK5Lo9oye5G18av9cRQPrPXdnPbSr/MeNB7pw?=
 =?us-ascii?Q?T5wT5m5mzYUStMgL/5l0qUBo67WfGbvZYUTS6GwXlc7YDzaMQ+XQRD6sfNuB?=
 =?us-ascii?Q?FOqhb9yZbzqXnDmvjDVRIokRPeQ3AwYMycsx8RlRTZxlUXlYBz7/YQpNhnAq?=
 =?us-ascii?Q?QKiJAA+yU+CSPLtka2n3XyysL2fHy0KfGxWXzohTX+473T2kVopJkugY9Glb?=
 =?us-ascii?Q?z7HZk2RxxcBLFl6CNDFdk6G3DkZkUFwWTYyYQPkQHg7zSbseKzifqY69fVV+?=
 =?us-ascii?Q?Ps0+ISQgnIFeOFNJ8Srd0XFPlbYoiVXVw6kGto9XzP0lWPhEN8sG+sltM4Vk?=
 =?us-ascii?Q?PjQzeVCtzPbPZDA2xB1miT4AFLqNCKYWdbA+Mdjrm+YT9wQ009LAGib0c80c?=
 =?us-ascii?Q?3WCkuRmYBMYpp8gLBQcsU9mmZyNOde8BOkyEBaBnEUVJKz/WFWamGPulvlBR?=
 =?us-ascii?Q?OQ/0xQWGKPXVlGyG2GNC+x/0iip+RDUp8PJASQOpYY7vyy/aW3zSdkq1kE5f?=
 =?us-ascii?Q?OGNJprVh+1kt4M+QPi5rtGQshnxpPD/xT9oN7TZsfZg6tIoKyKnHN00kXaMe?=
 =?us-ascii?Q?3ynML7WqXCfOnQbnq8NTxqhpFEAOPbbrFwuV/bxOEJqVlV/TvBsKpvSpU7fg?=
 =?us-ascii?Q?SCypTPQLLi9SH2IFRHyqzfQPc0i8tepEkwHG5q3U9v5v9LetzmekkXuQmSZ1?=
 =?us-ascii?Q?h1k+1J4sR+tjR7I81V/L44OlAEmAlg6fUbaN4CDVrhfwYryu4J+ittT+qteq?=
 =?us-ascii?Q?0T9XZToCrPeXm6TV3p6Ej/15wgv1Gg5JOVGbyNZObPB84QRypeRvcoA1Z9WX?=
 =?us-ascii?Q?7UV5lfNu/Z0qR7GVNoGDlzlEyt3AjOkDWy/TQqQLmuSaz0d0m9ep6kLeS22i?=
 =?us-ascii?Q?fx9SX7Ss0j1tk8XZZJeMAL0wviiiuehK0yrJo7DRkOX40GQD1G7GIs8l+fVR?=
 =?us-ascii?Q?Gqa32+l1xmFK4K0FX8DTtt1/SXWgxBV0tLtKEclmH6iqUGEke9xJ1/m7NV4g?=
 =?us-ascii?Q?hQQv5VdJHa1Eg3buKEN8ggyn6M9XEiMTHzNVxBWEgctUrhNZVL9A8HAgrf7/?=
 =?us-ascii?Q?i1in5syEhNhOkhKhwN5Z2i6F4PlXwDvV+veXbYHBjPUC34bQHllZ8PIaWU8c?=
 =?us-ascii?Q?9Cythkc+Z7i9YlAR2/DWjcfKZ3GOHFIC6DA3i09BPPqkl9oyfCVZQBkkUdRQ?=
 =?us-ascii?Q?u09fuQUzgtof0fln5HGfURs0dBSazXizUEhr/eqDXDeK8/zBAS4XWwq9Iw4t?=
 =?us-ascii?Q?qVIrHjtDt+P5HO2LhOO5YVNrqIdummV4v9FEAyl/6hYy+TC+aML4YjcHEoga?=
 =?us-ascii?Q?cM/FOzqgCuYvcMIuPxPaBuygLpt1t2aReO10S72dxA3VLuju0z1MgC0sXUst?=
 =?us-ascii?Q?CGbv/hBec1kEPwkBpRC/VAEubRHeM4X8PKBTDjJ8Z6WvyM4oun0+Wg2GoGUb?=
 =?us-ascii?Q?lWb2/AsrfHtUkSehcUX0mC0rPZNDfZj7Si6clwro22ZWV/Imge8VhPw2YHvC?=
 =?us-ascii?Q?k45wG3zD1fgh/IY1xsJkFRx+A+WPJX6D5TVP5Nec/AhXReDQe69TxBcbdnWu?=
 =?us-ascii?Q?dkE0SqKcETMsF0FdUDa038iYtFROknfDGs38IYoAsEy9PERqxD0p6RFoKMBV?=
 =?us-ascii?Q?2L3Xi5mYt3V0Tno2cZ/dnCU7MW9g12Kh+nMZfDNmR8+e9tdcAHfminy/81mr?=
 =?us-ascii?Q?7HZYis86jiYzJeZmsb2/Pwq6fJ9j4ji1IKuQYrpGw5DFJJiojuCSHZ7odwRc?=
 =?us-ascii?Q?ItXCpYd0hw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b97681dc-72e4-4d00-998f-08da1d5c4d2e
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2022 14:45:49.6524 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p8yC+4LWbLv9fLwrtQRxtqMYde5IqRGPvC9hI5K46wqVgiwqgJnP+/uSsx+OqPWG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4987
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 13, 2022 at 02:26:23PM +0000, Wang, Zhi A wrote:
> On 4/13/22 1:43 PM, Jason Gunthorpe wrote:
> > On Wed, Apr 13, 2022 at 01:39:35PM +0000, Wang, Zhi A wrote:
> > 
> >> It seems Jani's makefile clean patch has already included this one, I can
> >> just simply drop this one so that Christoph won't need to re-send everything.
> >>
> >> For the branch to move on, I am merging the patches and will re-generate the
> >> gvt-staging branch, which combines the newest drm-tip vfio-upstream and other
> >> gvt branches.
> >>
> >> If you are in a rush of re-basing the patches of non-GVT-g stuff, you can use
> >> gvt-staging branch until my pull request landed in drm-intel-next.
> >>
> >> Also our QA will test gvt-staging-branch before the pull request. I suppose
> >> it will take one or two days.
> > 
> > When you are wrangling the branches it would be great if Christoph's
> > series and it's minimal dependencies could be on a single branch that
> > could reasonably be pulled to the VFIO tree too, thanks
> > 
> > Jason
> > 
> 
> Hi Jason:
> 
> I am thinking about the process of merging process. Here are the dependence:
> 
> 1) My patches depend on one patch in drm-intel/drm-intel-next. So it has to
> go through drm.
> My patches of GVT-g will go through drm-intel-next -> drm -> upstream. 
> 
> 2) Christoph's patches depends on my patches, but part of them are for VFIO.
> 
> a. If they are fully going through VFIO repo, they might have to wait my
> patches to get landed first.
> 
> b. If only the GVT-g parts goes through GVT repo, and rest of them goes
> through VFIO, the rest part still needs to wait.
> 
> What would be a better process?

You should organize everything onto one simple branch based on a rc to
make this all work.

Make your #1 patch as a single patch PR based on rc to drm-intel so it
gets to the right tree

Make your MMIO series as PR on the branch above that first PR and merge to
the gvt tree

Make Christoph's series as a PR on the branch above the second PR's
MMIO series and merge to the gvt tree

Merge the gvt toward DRM in the normal way - ie the main merge path for
this should be through DRM.

Then ask Alex to merge the 3rd PR as well.

I don't see any intel-next stuff in linux-next yet so hopefully it is
early enough to get #1 OK.

Jason
