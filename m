Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D8B2324A9
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jul 2020 20:31:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 162366E5CF;
	Wed, 29 Jul 2020 18:31:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680042.outbound.protection.outlook.com [40.107.68.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C67366E5CF
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jul 2020 18:31:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GKfO+sCBs9188YCvTE7ueSHYUrEcxsOoJFePg8NFqPugKL33eRUbEfIMIn4VjZBi0uNakjKr32PnZvo/RFHYSnr00VjjaXsbMz+9oeQVVkcHrrTT6GKaKq2Am5Dpda+8gQfCOIonU1cBdHSqjGBJ+1uDiG5fKm0zw89qlKVJ8qUQ+Wc1CU8Vf+EX5Z58bQtMBbrBXl9cI0TjVRYceWhhbJAer8c2P8vz/pFh3U9MmqntlqCh+RVB5jhCqh22sJ6AJWikdk59bT5p3vyDFJVjYYGcem+CyjSuTSOgftbZjCHlUgeXFXH/KnmyjQ+7+00OEIS+PMenAj5RNbDTNsOmwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uLJDomD59gSHa53q5/tU8juk0K1hLg4GyA5BCnn9tnY=;
 b=ldtlD1bddwHme9ioixwusmNT29Yr/AsChL+gU/dpU0BMgaWBlj4ApyhHOJ/xXgxG4R/8EId7OwOoQj6vKwFgwMFSyjNCGnEUxrvJCpVGr3iD/4qHWNA7CzVZxusRPyWcZ0opSnDtQnOv05gGyBJA7clmBCM7z7bxsZgJ0KDloHVDGlEO6zsrLcUwQKUtCNB5WzWzOhHVCcgc2/jly8RuLanroej2wVsQMd671L2P8WXv23YbCn/oPMTEZKH13AvgnmK9ESsq0uLrBYxWvoNFcAzVdPa+Mp54eZa3h/6N3K4xxp5L1BH4+J9gH5/9TIsMzPlnUF2mmoi5JrgLPrxmuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=canonical.com smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uLJDomD59gSHa53q5/tU8juk0K1hLg4GyA5BCnn9tnY=;
 b=p/hh03xuKtZ7zkFfL2l241aVNkEH48Ny577OQNOqhCuWpReVy5MAChamqoIiB6gu/c++398r8HuFq0xJ8SJ48ErHBvXAHAkjelJA9y3zgacyijAV+fxPh7HHKw7Hg277WPTET1sztS3aaN0NjPcnnDzbQoSNWnQvpfYiZYnhzKE=
Received: from CY4PR18CA0042.namprd18.prod.outlook.com (2603:10b6:903:9a::28)
 by BN6PR02MB2276.namprd02.prod.outlook.com (2603:10b6:404:2c::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.20; Wed, 29 Jul
 2020 18:31:51 +0000
Received: from CY1NAM02FT025.eop-nam02.prod.protection.outlook.com
 (2603:10b6:903:9a:cafe::6f) by CY4PR18CA0042.outlook.office365.com
 (2603:10b6:903:9a::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.16 via Frontend
 Transport; Wed, 29 Jul 2020 18:31:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; canonical.com; dkim=none (message not signed)
 header.d=none;canonical.com; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 CY1NAM02FT025.mail.protection.outlook.com (10.152.75.148) with Microsoft SMTP
 Server id 15.20.3216.10 via Frontend Transport; Wed, 29 Jul 2020 18:31:51
 +0000
Received: from [149.199.38.66] (port=53299 helo=smtp.xilinx.com)
 by xsj-pvapsmtpgw01 with esmtp (Exim 4.90)
 (envelope-from <hyun.kwon@xilinx.com>)
 id 1k0qpo-0008L3-3e; Wed, 29 Jul 2020 11:29:48 -0700
Received: from [127.0.0.1] (helo=localhost)
 by xsj-pvapsmtp01 with smtp (Exim 4.63)
 (envelope-from <hyun.kwon@xilinx.com>)
 id 1k0qrm-0003jb-SO; Wed, 29 Jul 2020 11:31:50 -0700
Received: from [172.19.2.244] (helo=xsjhyunkubuntu)
 by xsj-pvapsmtp01 with esmtp (Exim 4.63)
 (envelope-from <hyun.kwon@xilinx.com>)
 id 1k0qrg-0003jK-PP; Wed, 29 Jul 2020 11:31:44 -0700
Received: by xsjhyunkubuntu (Postfix, from userid 13638)
 id 8C13D2C238C; Wed, 29 Jul 2020 11:27:53 -0700 (PDT)
Date: Wed, 29 Jul 2020 11:27:53 -0700
From: Hyun Kwon <hyun.kwon@xilinx.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH][next] drm: xln: fix spelling mistake "failes" -> "failed"
Message-ID: <20200729182753.GA29219@xilinx.com>
References: <20200724111258.14762-1-colin.king@canonical.com>
 <20200728223739.GV13753@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200728223739.GV13753@pendragon.ideasonboard.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 11f68cb8-c621-4cee-cd0c-08d833eda92a
X-MS-TrafficTypeDiagnostic: BN6PR02MB2276:
X-Microsoft-Antispam-PRVS: <BN6PR02MB2276CAE4E26F659FCBCCE3D2D6700@BN6PR02MB2276.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:2043;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bkaVjfSXo5zYT2DGLhWmM/IMlLXTuRbcXWoYzXSJGRIJ0qv9H+wacQcmNY5+dMMQYrVe5Y7ZMMLU+I2dkYKpxsi7daKjQ3ba1+WwICpCVDRpuaMiyprVc2bDfAQGh8PNtqG4fIymcZSNVm8iwrcK8gsN3AUP4VFB5wni5hTLlCWUaSScFfUk/X3zuOtgxEacdevFkGoZDw/sZ5dAs9qKaNTIzcVzWdIE+kLySz22kMLcHxWPPhkJF5KditmN8CXcthQSOZ1udFN687m/5N5+wBnj7siL/P9ARLYo54NL5THhts/c13M+EuzMhrs92R0cpuK0iwCoIpOrvZJd9XNRNfTvfVmZQQ1WymjwMMWXArAKSp3DZHbTqZwdbBUwUShd09dGVxawWYRqjS1/qZ4E6w==
X-Forefront-Antispam-Report: CIP:149.199.60.83; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapsmtpgw01; PTR:unknown-60-83.xilinx.com; CAT:NONE;
 SFTY:;
 SFS:(39860400002)(136003)(396003)(346002)(376002)(46966005)(83380400001)(316002)(81166007)(47076004)(356005)(336012)(82740400003)(42186006)(54906003)(82310400002)(6266002)(2616005)(6916009)(5660300002)(44832011)(4326008)(8936002)(26005)(33656002)(186003)(8676002)(1076003)(70206006)(70586007)(426003)(478600001)(36756003)(2906002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2020 18:31:51.1235 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 11f68cb8-c621-4cee-cd0c-08d833eda92a
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.60.83];
 Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT025.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR02MB2276
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
Cc: David Airlie <airlied@linux.ie>,
 "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Michal Simek <michals@xilinx.com>, Colin King <colin.king@canonical.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Colin,

Thanks for the patch.

On Tue, Jul 28, 2020 at 03:37:39PM -0700, Laurent Pinchart wrote:
> Hi Colin,
> 
> Thank you for the patch.
> 
> On Fri, Jul 24, 2020 at 12:12:58PM +0100, Colin King wrote:
> > From: Colin Ian King <colin.king@canonical.com>
> > 
> > There is a spelling mistake in a dev_dbg messages. Fix it.
> 
> There is a spelling mistake in the commit message, s/xln/xlnx/ ;-)
> 
> > Signed-off-by: Colin Ian King <colin.king@canonical.com>
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 

Reviewed-by: Hyun Kwon <hyun.kwon@xilinx.com>

I'll fix the commit message and commit this change to drm-misc-next-fixes soon.

Thanks,
-hyun

> > ---
> >  drivers/gpu/drm/xlnx/zynqmp_dp.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> > index 821f7a71e182..0e1c818746eb 100644
> > --- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
> > +++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> > @@ -1308,7 +1308,7 @@ zynqmp_dp_connector_detect(struct drm_connector *connector, bool force)
> >  		ret = drm_dp_dpcd_read(&dp->aux, 0x0, dp->dpcd,
> >  				       sizeof(dp->dpcd));
> >  		if (ret < 0) {
> > -			dev_dbg(dp->dev, "DPCD read failes");
> > +			dev_dbg(dp->dev, "DPCD read failed");
> >  			goto disconnected;
> >  		}
> >  
> 
> -- 
> Regards,
> 
> Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
