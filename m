Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 531F726AC2C
	for <lists+dri-devel@lfdr.de>; Tue, 15 Sep 2020 20:39:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FF786E8DA;
	Tue, 15 Sep 2020 18:39:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2047.outbound.protection.outlook.com [40.107.93.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F1776E8D7;
 Tue, 15 Sep 2020 18:39:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RArpkZ/l/P0gBhyiVnFzlnK1+ltpu4x88FRuCdWtNwWkp98mExU2EARfU6VG5otrPM9YMztHQ/zNIMyLWyYeDSehv+5ddUu5QkXHHrPXqkcHNzmYi/ERU4FdoINvsO0vS4BwlbEdx7+wtX0wfgwsnyORrfNfHGuXiyS1GCBCOdPHP7YfyO9HbWENIeHr4NEhKRcC1qdLa1GgV9F9xiTcV35GTG9B98p17FI7Dcmdoy5O8kN2yk4QEPzW+msX7k0AmzfXVF4ub8AMUSXd/UHcD3pRDMGcul4U5uWl9czAi4Uclw9huD+9RW5oEjZtfYzlCedo3XonK4F5T9S6WNrTwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4nIO+lhNFgioRkRyGhdB1I3Uj8gi/oxj23FCH5WSe8E=;
 b=R8H8SkAXciLhrprBnQK3SHbWsJcLCXqoT+g20E1/ybgGhxqZtPiDOGOmY/LrTSxcpGB73tZW5v1PNPMcgwEzSZMJdunPyGyb+IohPUaPR8BO2oj2GZkHVfq647GrY3z9KniynTif8AVTOztHi1kEtPjQOLSScdWMVRNUP4xQLbCzGB+Kfj9GTwzzxOTbf1K+UAkqii38ibdb+kBBQr49WLJLJh8RjphzYqjDNYKUdZZhOGHIvovYgMzNgpj8qUJI3LwCXulrTIIc9F1n4FS+99hApKJrfmt6b9+AGfaSps5cJLpvUeMu5jyKWPcKjQLuB7YD69qLPjzISQqhD+zOhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4nIO+lhNFgioRkRyGhdB1I3Uj8gi/oxj23FCH5WSe8E=;
 b=Ft9IxLhrSyAZPH7YXskNwwHcjwsioZd1gYOVg7DJ49DbK3VXAIGTwQZq6Glqpt3+ujNcSgKehvmyZBDWmlOiekjX6vYBG7i/63A/aBX5gGzuEwyXfvt9wM1DbWvK0PScJ0JlBQD0msFJtI3bvUvSgDPCXYHOa2r5LaLrKnngICs=
Received: from DM5PR06CA0035.namprd06.prod.outlook.com (2603:10b6:3:5d::21) by
 MN2PR02MB6862.namprd02.prod.outlook.com (2603:10b6:208:1d4::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Tue, 15 Sep
 2020 18:39:12 +0000
Received: from CY1NAM02FT041.eop-nam02.prod.protection.outlook.com
 (2603:10b6:3:5d:cafe::2b) by DM5PR06CA0035.outlook.office365.com
 (2603:10b6:3:5d::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16 via Frontend
 Transport; Tue, 15 Sep 2020 18:39:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 CY1NAM02FT041.mail.protection.outlook.com (10.152.74.156) with Microsoft SMTP
 Server id 15.20.3370.16 via Frontend Transport; Tue, 15 Sep 2020 18:39:12
 +0000
Received: from [149.199.38.66] (port=33482 helo=smtp.xilinx.com)
 by xsj-pvapsmtpgw01 with esmtp (Exim 4.90)
 (envelope-from <hyun.kwon@xilinx.com>)
 id 1kIFr8-00079j-0A; Tue, 15 Sep 2020 11:39:06 -0700
Received: from [127.0.0.1] (helo=xsj-smtp-dlp2.xlnx.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.63)
 (envelope-from <hyun.kwon@xilinx.com>)
 id 1kIFrD-0001kg-Qb; Tue, 15 Sep 2020 11:39:11 -0700
Received: from xsj-pvapsmtp01 (smtp3.xilinx.com [149.199.38.66])
 by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 08FId9Zt008885; 
 Tue, 15 Sep 2020 11:39:09 -0700
Received: from [172.19.75.82] (helo=xsjsycl40.xilinx.com)
 by xsj-pvapsmtp01 with esmtp (Exim 4.63)
 (envelope-from <hyun.kwon@xilinx.com>)
 id 1kIFrB-0001kJ-AL; Tue, 15 Sep 2020 11:39:09 -0700
Received: by xsjsycl40.xilinx.com (Postfix, from userid 13638)
 id 491F2352CB5; Tue, 15 Sep 2020 11:39:09 -0700 (PDT)
Date: Tue, 15 Sep 2020 11:39:09 -0700
From: Hyun Kwon <hyun.kwon@xilinx.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v2 20/21] drm/xlnx: Initialize DRM driver instance with
 CMA helper macro
Message-ID: <20200915183909.GA2471550@xilinx.com>
References: <20200915145958.19993-1-tzimmermann@suse.de>
 <20200915145958.19993-21-tzimmermann@suse.de>
 <20200915155346.GA26029@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200915155346.GA26029@pendragon.ideasonboard.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4c65fab7-7d10-4b9a-748b-08d859a6a3fb
X-MS-TrafficTypeDiagnostic: MN2PR02MB6862:
X-Microsoft-Antispam-PRVS: <MN2PR02MB686297B0A5D949DD63A5E1D5D6200@MN2PR02MB6862.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:157;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: azHD76tuOPuB48RIPJTmGE1GeguOaYooVgA1zfaOFcdq8MvHicW8zvBOOLEI7v5gvGiv/ru7NR+rNkmZPFHOALmKpoRinkan47/aYxnYbvK6VEwY/OAaIqXB9x/lZV06yan8U1lpw5LLFrWxbrNF7RDDiUXWcoZhlDIIqmoXRIxH2kk1gVeGVQxpil9Yqv5px4Xylh/WWh8og85pL+UeJMu8leYXUObrWsn3WgnSoYFYSTSbQFHNMLLNJCFl9A6QJq0jelg6HSpNYrgTXAMJxhf4AeNxHfvpX7fbhsxqChK+Uqg44tLfuYfzGP5FHI2EgX8VmfPRVNe+b1OAxcxv7BJf9nYTCE4oeoVql+sStizjqxSu/OZCr/zt8ApQWS/2m80VUw8QelAhhDh5SWCSKRUKgL4LYo9OHWt/g9Z7hOwMuPzuwZG8AKr0ULbHWlZB
X-Forefront-Antispam-Report: CIP:149.199.60.83; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapsmtpgw01; PTR:unknown-60-83.xilinx.com; CAT:NONE;
 SFS:(346002)(136003)(39860400002)(376002)(396003)(46966005)(478600001)(36756003)(1076003)(6916009)(336012)(4326008)(186003)(26005)(6266002)(426003)(356005)(8936002)(83380400001)(2906002)(82740400003)(8676002)(82310400003)(7406005)(7366002)(7416002)(81166007)(70206006)(47076004)(966005)(70586007)(44832011)(42186006)(33656002)(316002)(2616005)(54906003)(5660300002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2020 18:39:12.2114 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c65fab7-7d10-4b9a-748b-08d859a6a3fb
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.60.83];
 Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT041.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR02MB6862
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
Cc: "hamohammed.sa@gmail.com" <hamohammed.sa@gmail.com>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "chris@chris-wilson.co.uk" <chris@chris-wilson.co.uk>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "sam@ravnborg.org" <sam@ravnborg.org>,
 "emil.velikov@collabora.com" <emil.velikov@collabora.com>,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 "jy0922.shim@samsung.com" <jy0922.shim@samsung.com>,
 "oleksandr_andrushchenko@epam.com" <oleksandr_andrushchenko@epam.com>,
 "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
 "krzk@kernel.org" <krzk@kernel.org>,
 "jonathanh@nvidia.com" <jonathanh@nvidia.com>,
 "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
 "tomi.valkeinen@ti.com" <tomi.valkeinen@ti.com>,
 Michal Simek <michals@xilinx.com>, "bskeggs@redhat.com" <bskeggs@redhat.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "marek.olsak@amd.com" <marek.olsak@amd.com>,
 "matthew.auld@intel.com" <matthew.auld@intel.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "andi.shyti@intel.com" <andi.shyti@intel.com>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "tianci.yin@amd.com" <tianci.yin@amd.com>,
 "nirmoy.das@amd.com" <nirmoy.das@amd.com>,
 "etnaviv@lists.freedesktop.org" <etnaviv@lists.freedesktop.org>,
 "hdegoede@redhat.com" <hdegoede@redhat.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "rodrigo.vivi@intel.com" <rodrigo.vivi@intel.com>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 "evan.quan@amd.com" <evan.quan@amd.com>, "sean@poorly.run" <sean@poorly.run>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "tvrtko.ursulin@linux.intel.com" <tvrtko.ursulin@linux.intel.com>,
 "rodrigosiqueiramelo@gmail.com" <rodrigosiqueiramelo@gmail.com>,
 "aaron.liu@amd.com" <aaron.liu@amd.com>,
 "Felix.Kuehling@amd.com" <Felix.Kuehling@amd.com>,
 "xinhui.pan@amd.com" <xinhui.pan@amd.com>,
 "sw0312.kim@samsung.com" <sw0312.kim@samsung.com>,
 "hjc@rock-chips.com" <hjc@rock-chips.com>,
 "kyungmin.park@samsung.com" <kyungmin.park@samsung.com>,
 "miaoqinglang@huawei.com" <miaoqinglang@huawei.com>,
 "kgene@kernel.org" <kgene@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 "alexander.deucher@amd.com" <alexander.deucher@amd.com>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "Hawking.Zhang@amd.com" <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tomas,

Thanks for the patch.

On Tue, Sep 15, 2020 at 08:53:46AM -0700, Laurent Pinchart wrote:
> Hi Thomas,
> 
> Thank you for the patch.
> 
> On Tue, Sep 15, 2020 at 04:59:57PM +0200, Thomas Zimmermann wrote:
> > The xlnx driver uses CMA helpers with default callback functions.
> > Initialize the driver structure with the rsp CMA helper macro. The
> > driver is being converted to use GEM object functions as part of
> > this change.
> > 
> > Two callbacks, .dumb_destroy and .gem_prime_import, were initialized
> > to their default implementations, so they are just kept empty now.
> > 
> > v2:
> > 	* initialize with DRM_GEM_CMA_DRIVER_OPS_WITH_DUMB_CREATE (Laurent)
> > 
> > Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 

Reviewed-by: Hyun Kwon <hyun.kwon@xilinx.com>

Thanks,
-hyun

> > ---
> >  drivers/gpu/drm/xlnx/zynqmp_dpsub.c | 14 +-------------
> >  1 file changed, 1 insertion(+), 13 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xlnx/zynqmp_dpsub.c b/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
> > index 8e69303aad3f..f3ffc3703a0e 100644
> > --- a/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
> > +++ b/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
> > @@ -80,19 +80,7 @@ static struct drm_driver zynqmp_dpsub_drm_driver = {
> >  	.driver_features		= DRIVER_MODESET | DRIVER_GEM |
> >  					  DRIVER_ATOMIC,
> >  
> > -	.prime_handle_to_fd		= drm_gem_prime_handle_to_fd,
> > -	.prime_fd_to_handle		= drm_gem_prime_fd_to_handle,
> > -	.gem_prime_export		= drm_gem_prime_export,
> > -	.gem_prime_import		= drm_gem_prime_import,
> > -	.gem_prime_get_sg_table		= drm_gem_cma_prime_get_sg_table,
> > -	.gem_prime_import_sg_table	= drm_gem_cma_prime_import_sg_table,
> > -	.gem_prime_vmap			= drm_gem_cma_prime_vmap,
> > -	.gem_prime_vunmap		= drm_gem_cma_prime_vunmap,
> > -	.gem_prime_mmap			= drm_gem_cma_prime_mmap,
> > -	.gem_free_object_unlocked	= drm_gem_cma_free_object,
> > -	.gem_vm_ops			= &drm_gem_cma_vm_ops,
> > -	.dumb_create			= zynqmp_dpsub_dumb_create,
> > -	.dumb_destroy			= drm_gem_dumb_destroy,
> > +	DRM_GEM_CMA_DRIVER_OPS_WITH_DUMB_CREATE(zynqmp_dpsub_dumb_create),
> >  
> >  	.fops				= &zynqmp_dpsub_drm_fops,
> >  
> 
> -- 
> Regards,
> 
> Laurent Pinchart
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
