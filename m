Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 295234FC3D7
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 20:08:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A9E710E075;
	Mon, 11 Apr 2022 18:08:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2070.outbound.protection.outlook.com [40.107.237.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F66810E060;
 Mon, 11 Apr 2022 18:08:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bMQCiQmJWpr/3ztrGVpPhURI+xaQ/zJ9wfAp58yA1K+dimKiEJIwKF9COexUcyhPylqaKFuDmEyvcHjTPsnHl3u1cHrHbz7XdB5lcogk3/jS9RmzY9sffVShVJuWEkWmCbqAIBZKYEgfhqA+lCQf0ymIsmioMmcRIgkq8XztViwtqZYXI0rvy+bE3Ic7LxYCQzNTkvn/Ds49t/7eOHz16kI84KXjJ06DmevROGCH0FmwDS5JdfsI3bLf9wRVdpDRKu/kc6Rwq+aCdVHuIEMvUYZ4woeDRv/4SEWQZwzP++oWt4bo/7cCDuKwxQn5ICxWwTC3I5HdX9hciJByhip1lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KKbGcqsjqh8XiTDNupvleR9o3irH8CaMhP2uB62ps8U=;
 b=TqnjuF0RfZ3k6aSqr1PBNZnhWjxG9qd5yajekSSQ1WVvPpjIpeTNfs2LDdUABAX+TbzJXEt1fDl1UBxUwZC7qhgX/kkpg+W+34u3M46j6ZFdmI4yqtOSHQsh2FF6XOI/jW6bSNSNk4IlFNKa/DBKb2WScGl8y7VdmXCcHr/zzC5CIlxKbhxtRuwdgAOtkGKfkgd9zoAxB5MFbPdlIufaRVwoBnWsT/YN10cicZbVdu2gmN+fyH/rE9EVX3A+fAsi4iq0Dkjd09rxaBgsPEi7ddPidqui9xKT0alx/LfQhNdnJm12cxxxlLnsrrFfmJBPeuDRd+4TkrHfeYOdnS+OZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KKbGcqsjqh8XiTDNupvleR9o3irH8CaMhP2uB62ps8U=;
 b=qymXr17ihfwZ/8V56C6jESvrBoOhoKMuQYQU8lBKCEPkJdTkm8TrSM4xQUi3YfdJQLREQzcPVx5JCg/fKsRyOkFGIPyyuPWxK++fISlM8aWSbrBpAIeu5We4sQzRhw/yZ9teBH5UzDOP1jq87yq/68fdMMQOLnF2DZFgobeGQaFzHzKodfMVo6oxdjRcR9Oh7mKvnYS7TuLrYsZlxnQumfrrjYhhwX6OCyX1dcK6ELn75BtZLqTqi2mkggxqJDTdc0o1TGxBPXA7Xk7BBQQaH+gu+dnXMIzMdourMQmTMptkvLgcwykpHe7FJleDyEcqU1CJ3mdBAt0FsGIMCqNCLA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by MW2PR12MB2572.namprd12.prod.outlook.com (2603:10b6:907:6::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Mon, 11 Apr
 2022 18:08:44 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::cdfb:f88e:410b:9374]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::cdfb:f88e:410b:9374%6]) with mapi id 15.20.5144.029; Mon, 11 Apr 2022
 18:08:44 +0000
Date: Mon, 11 Apr 2022 15:08:43 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 21/34] drm/i915/gvt: devirtualize ->dma_{,un}map_guest_page
Message-ID: <20220411180843.GW2120790@nvidia.com>
References: <20220411141403.86980-1-hch@lst.de>
 <20220411141403.86980-22-hch@lst.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220411141403.86980-22-hch@lst.de>
X-ClientProxiedBy: MN2PR11CA0024.namprd11.prod.outlook.com
 (2603:10b6:208:23b::29) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5681845a-57eb-407a-7418-08da1be650ec
X-MS-TrafficTypeDiagnostic: MW2PR12MB2572:EE_
X-Microsoft-Antispam-PRVS: <MW2PR12MB25723964213D9F33969B5358C2EA9@MW2PR12MB2572.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JyccWyTjLIuoa1yGgtSV4aQ72FuwwgAaTJkLBpPNBtx+o8JNZgedS0KFgiZJfUOZqCSJW22yJtW6r1ylL+ZCGqN6z+Fp7OPPh0nsQ8bfOhHXY0xFZcZhc2T7GeOkW4jG5cwL1GniG/cQE5/TgWYH0+S9znu2B3fTP8RYf3GToELjD8RZzigSokmGnDoPLzB+a47JkQGWvyKlf8jC6dm38dr9LR5psEAFTg6yptFYT6lEJ4aoYq6WOaZQQC7oOxKOHuyXE15tsiT7ZY8oy+NPRfwL8laELZXt/UptgW0F0tKhwqjc2U++Sw7Zvyuhenok0KVHDmfqWkStccRHXaaQi3HxxW4HfoaoxXU89zeDB0BIubOX3eMQZAdle7Up4Ku2S346pCYnZL98tiAuAZWInRI2B5g6tQO234JQEbhUc9N4dIf/gYfAA6Gtpw0pYc8Bz75+1HFu/MrhGNviSSpjncxur3QhZlAAWjqKpzHRnh0UeHh4vdgS7BtFsKPH3V313frL/cDXbuCNVcpxIidLIt1JgrlbqacPVJteQM4HbiZzrCkw1xLf/D0b2G9jQwikaoMtJ5iW7s0pe9YgBBoY53Itdom7mgxaBkHa2gQQLvzmyzY9cZZZXfHy51HNmQ9ukKlRySGG+cmMl+HtyNBBHw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(508600001)(316002)(6916009)(54906003)(6486002)(6506007)(83380400001)(33656002)(36756003)(86362001)(38100700002)(2616005)(6512007)(1076003)(2906002)(5660300002)(4744005)(7416002)(26005)(186003)(66476007)(66556008)(4326008)(8676002)(66946007)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NU5pJAZI4pu+/WLB+QYi+5t8Cw4O2ArbM88zvKGKtRUYxzQkSQtVFh9tfBaW?=
 =?us-ascii?Q?Ed8gRxbi+yaw+RBkpAL0nElV1qtK95QGuxPuy/xCSo39z20UpNrtww7Ow8WY?=
 =?us-ascii?Q?PxZRMSgJuy2PtD8EHVEfhbShxpHJInbib7MREuHudRDzIOvG0L4+FnaWse28?=
 =?us-ascii?Q?YeFOApLIy8Sri/yfWFQ64SCMl3GMMTEB/V3wyHT/cQUnco7QN/ZHn8TRGQBe?=
 =?us-ascii?Q?d2ON5t4MvnUjgP0IuNOXAFW9iY6PeTylGpG+NrP4zOWLr2nTL1tQiicuyGW8?=
 =?us-ascii?Q?JZCrFxYuG7v/Y8k6G2pPxouLfB+KtgnLXfaCevhbRWM47nG9Ot0I19L5GZ2j?=
 =?us-ascii?Q?GKEogF69hDss4c7zt9yJtMHTP69wQqvXRfk+lUg+eJOcnVUg69W8K59VxfhZ?=
 =?us-ascii?Q?h2rxussyjFiof906VVgyGq3VT1/IWjXu63zOWBGHBJJHpiGWYhKJtJiXCxkp?=
 =?us-ascii?Q?7e2IGKX0iSeOxj97XOXTVU+5bwbKEORpIAvJTTIU3yuXvl64/lEXvJTH52nz?=
 =?us-ascii?Q?tjFESZvxwE/MZIFj5OCdJIwUaB5gpGLfMY/Z0w3sOf0BUN12WmkOhxclF1+U?=
 =?us-ascii?Q?jMSxRhLokebDwzLAcPwy+W4OIg1ziEDt+hf/HRxsw73j1aKjIrnd8q+GAK46?=
 =?us-ascii?Q?vP4wHsfWcqfPhmNM6EMGOOloGPA5Xoi75B+QIKP4Xyu7XncoNsn5RvK06Sx1?=
 =?us-ascii?Q?ev2dlGwT9/CWn8xQgnGlap2uJmkXvCv/FPK4H0+tobHHupXyzTHVYLIpZ1vC?=
 =?us-ascii?Q?ao4uYsmA519T9aQJH4hxklpG1fXR5Vri5JJB3RkSrwMTWDZqkPwqIoaUJQ90?=
 =?us-ascii?Q?RVNj0LKRRtnfyZhHJYXzjRBS18LXoRA1pgkA4PXWeqwd/1IyRlzd6kcNOM7K?=
 =?us-ascii?Q?YoOffKce7/CY77Oa3/SGhT3DJ1DCM7BX81I482os4nKc54COEecySen1ubNf?=
 =?us-ascii?Q?uv14qUSc5mHF6l5lMUtXyEaDVG4M90Y4seIze0C8q+ccbvxU7JuD19pRVLoD?=
 =?us-ascii?Q?lt2GyHoIhe0hfod087zIJxKyI0l9IClywlRwncJSOjy5BBoUi14fAmBEXYhK?=
 =?us-ascii?Q?i1uCiRFT371szchRJ1RYEq4cOsdNT4trZ0b0q7A7RpQJBj45XFeldRBlp0DT?=
 =?us-ascii?Q?nLNiAucT27DML5sOBZr2FVDgpjNGnN/gKBhHZbT7TjOUJTQl2hQQjLbl6Lm9?=
 =?us-ascii?Q?Qva73nobbQTYcXV/nQnby+pWmLg8MmTF/FMCDje78+Locup8hKb2fD9gYyl+?=
 =?us-ascii?Q?LP3eGP7MKpkON+ASAWAvLj6egDJhLHNkwvdJCsYBRDYExf5wogZe4QDRrXnq?=
 =?us-ascii?Q?nMCi1xPGgSkKKzjR+CHITEFNxdOyOiALEsyCcqb11XeO30INiM/BF8NW0bw6?=
 =?us-ascii?Q?gA5CGhvyxaMl5z9J4xG8pkGEllnb84nGGrqbxDH6KiFLHuDQqbDKj9IulPk6?=
 =?us-ascii?Q?I8EqT0hb0f0iFPFLy+ED876JbfjWeBgtcCbdMgyuxalW0F6bbZ4IAF11XuJS?=
 =?us-ascii?Q?aqYjlmkRN749+jLQqklstKTYG4MFPh0zKZ99z/jC1lHPGYWPR33g02+BJwSr?=
 =?us-ascii?Q?oUWeIefR5U2Ee0dPv/TBOKt2QSK/pbt9zFcOSOQShVnxOUteQdhKH2wyyhiJ?=
 =?us-ascii?Q?EmupdqVsUw9iGoD4m/SiIHKXpgjEoCtvf7Whk4G034TS2kGW2LH3Y6yw2LcV?=
 =?us-ascii?Q?hzY4D2dkfQh1Ia6keDugoHlI/yvDFZcSUX7NjXIJOPSmhoS/Otoyir+cVsOw?=
 =?us-ascii?Q?IM9Jonaptg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5681845a-57eb-407a-7418-08da1be650ec
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2022 18:08:44.1698 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4qEF7eeDHQCqPgqOBeEnqG//8pBA4uU++maW4XWzn5gnY9efISyX3r4rnIHI71/U
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR12MB2572
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
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gvt-dev@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 11, 2022 at 04:13:50PM +0200, Christoph Hellwig wrote:
> Just call the functions directly.  Also remove a pointless wrapper.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/gpu/drm/i915/gvt/dmabuf.c    | 10 ++--------
>  drivers/gpu/drm/i915/gvt/gtt.c       | 20 +++++++++----------
>  drivers/gpu/drm/i915/gvt/gvt.h       |  4 ++++
>  drivers/gpu/drm/i915/gvt/hypercall.h |  5 -----
>  drivers/gpu/drm/i915/gvt/kvmgt.c     |  6 ++----
>  drivers/gpu/drm/i915/gvt/mpt.h       | 29 ----------------------------
>  6 files changed, 17 insertions(+), 57 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
