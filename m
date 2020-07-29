Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA6B32316CE
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jul 2020 02:33:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D19B16E42B;
	Wed, 29 Jul 2020 00:33:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2089.outbound.protection.outlook.com [40.107.92.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78AD36E34E
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jul 2020 00:33:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g+P9LNaSiUm2qdx6IHw75ZEmXUkWjExQmkdxCx6gmvSRCD1wzaR5RPYEK8GP3oFtqV2+jh7U9+KzinM2bj/kfOJhjv68V0uLzhdLLlknago7mJ52JLimDPT289WijPWzWjizHQj1/ZrQWwuq7C2FnQZvHJ7vIIPvJfLeg81RpyqveDapHksLEF5VQJ9RdCUxBpoU+lNvDZRoZ00OOrKyEtD3tG8kBAUi7+qlm4cITNo3jYi0KZmV3mEIM5GzjiTGcU9uh1Fz1pTCOd58dwDool9SMwWDF/kOp757575LnptxE810S0rgwCVMC+O7D9m2IPaWN0p4H1BsuMPIsEQ7RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3eLKcpw2vLcSBKrsZMhCtXo5PLTtN5lUjA8cMU7RVG0=;
 b=koqV7pk+VAJ34AlDgYoGCLUsxuO8NKmQRqA9ujNt+DveqEYNr+682BiUiyKfpiiWiYNyHa1kqDYCvGKF/68vu62J72lumJ5q96LlbUvyaUa8/52gaVSgY3Ndh+48amr8hoIZGptjzzb+UAjYMOieWbfDjg6IKNJZ4b6ZOrc51clN1K1n8i7bpn9tbRB9X+dXiVDh/GZuKM9+1cMtDlJoixF3jNiaA7BLg28yl/MouRoLc4mtnRSBCElD/kvPD/PrJea38nhSsrmPEixnOw6tjjRCwk+ARBZxH42XNjaydJN/wiqIatvrIOSc9o7XT1NCS1bQsDWTQ93zBT8k3sPmuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=ffwll.ch smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3eLKcpw2vLcSBKrsZMhCtXo5PLTtN5lUjA8cMU7RVG0=;
 b=cNt11VwEL5mSt5KKNqINK6PM0zkFZuQZqfHhvXj7oh4wLeSRPZ+UdN37YyXwr2jEM/oF6TibEJa4gFNgGmgzEod8xw3tfz5seBFFxCcltLo/BE4uqn8ocob4T5twcPDcrsRcBXziJj5LGznd10oLaZRA3wky6YDIHILDnX5VNGs=
Received: from CY4PR20CA0015.namprd20.prod.outlook.com (2603:10b6:903:98::25)
 by DM6PR02MB5212.namprd02.prod.outlook.com (2603:10b6:5:4a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.16; Wed, 29 Jul
 2020 00:33:38 +0000
Received: from CY1NAM02FT027.eop-nam02.prod.protection.outlook.com
 (2603:10b6:903:98:cafe::15) by CY4PR20CA0015.outlook.office365.com
 (2603:10b6:903:98::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.21 via Frontend
 Transport; Wed, 29 Jul 2020 00:33:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 CY1NAM02FT027.mail.protection.outlook.com (10.152.75.159) with Microsoft SMTP
 Server id 15.20.3216.10 via Frontend Transport; Wed, 29 Jul 2020 00:33:37
 +0000
Received: from [149.199.38.66] (port=33498 helo=smtp.xilinx.com)
 by xsj-pvapsmtpgw01 with esmtp (Exim 4.90)
 (envelope-from <hyun.kwon@xilinx.com>)
 id 1k0a0N-000481-GF; Tue, 28 Jul 2020 17:31:35 -0700
Received: from [127.0.0.1] (helo=localhost)
 by xsj-pvapsmtp01 with smtp (Exim 4.63)
 (envelope-from <hyun.kwon@xilinx.com>)
 id 1k0a2L-00033q-6y; Tue, 28 Jul 2020 17:33:37 -0700
Received: from [172.19.2.244] (helo=xsjhyunkubuntu)
 by xsj-pvapsmtp01 with esmtp (Exim 4.63)
 (envelope-from <hyun.kwon@xilinx.com>)
 id 1k0a2H-00033H-AR; Tue, 28 Jul 2020 17:33:33 -0700
Received: by xsjhyunkubuntu (Postfix, from userid 13638)
 id 3EB3A2C238C; Tue, 28 Jul 2020 17:29:45 -0700 (PDT)
Date: Tue, 28 Jul 2020 17:29:45 -0700
From: Hyun Kwon <hyun.kwon@xilinx.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH -next] drm: xlnx: Fix typo in parameter description
Message-ID: <20200729002944.GA11598@xilinx.com>
References: <20200725063429.172139-1-weiyongjun1@huawei.com>
 <20200728220205.GJ6419@phenom.ffwll.local>
 <20200728223543.GU13753@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200728223543.GU13753@pendragon.ideasonboard.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a8c9e3d7-04c9-4038-ed04-08d8335708c2
X-MS-TrafficTypeDiagnostic: DM6PR02MB5212:
X-Microsoft-Antispam-PRVS: <DM6PR02MB52126C3242E7BA2EA7F5E340D6700@DM6PR02MB5212.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /FOP7y4M7KlCOi5P7l2E4A60FrDMfoZIpdkWEpGirCMir5z7EmbKl08HwC9r+jthQMPWfw89adRqr5y+6SYLJBD14xKpynw5iR97/j5HeofYjJoE358RBpRlQcEp0ZFKFAKls0Q2kB1Zkwx2EV+Wy72G0EVkhAVwrAwbUVYlRuRNoMGJLvnhVprgSOYw1x6s8QDW/u17W3YxtJvAcE9xVMCo9fwvOdaYNuYrG2IEzRypgra/ghWEX/PQrWLGquzNXlBkqvJm1hQqz5k7X2DAdBIKv8vmzrPXOqqVW/ODBk3kWh9Cn4NG/U2l/n/9kvb+V9ospN0OGBiyQOsSnhdjFTa9OGujOT99ycSRUUpwNoSQ4VyA74u20++Ws4cm6+Bv0QopQk2kXgN1U1H5v0iTcS3uwU3Fq8hkDJRA7SjhlDTt2PxGBd49sB5H6wfXnfCo
X-Forefront-Antispam-Report: CIP:149.199.60.83; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapsmtpgw01; PTR:unknown-60-83.xilinx.com; CAT:NONE;
 SFTY:;
 SFS:(396003)(136003)(376002)(346002)(39850400004)(46966005)(1076003)(5660300002)(6916009)(54906003)(2906002)(70206006)(42186006)(36756003)(83380400001)(966005)(316002)(478600001)(2616005)(33656002)(82310400002)(44832011)(47076004)(4326008)(336012)(82740400003)(6266002)(8936002)(426003)(8676002)(356005)(186003)(70586007)(26005)(81166007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2020 00:33:37.4968 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a8c9e3d7-04c9-4038-ed04-08d8335708c2
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.60.83];
 Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT027.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB5212
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
 Hulk Robot <hulkci@huawei.com>, Michal Simek <michals@xilinx.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

On Tue, Jul 28, 2020 at 03:35:43PM -0700, Laurent Pinchart wrote:
> On Wed, Jul 29, 2020 at 12:02:05AM +0200, daniel@ffwll.ch wrote:
> > Hi Hyun Kwon,
> >
> > Are you all sorted with drm-misc commit rights so you can push the 3
> > (maybe there's more) xlnx fixup patches to drm-misc-next-fixes?
> 
> Thanks Daniel for bringing this up.
> 
> Hyun, would that work for you ?
> 

Should I commit small fixups directly to,
https://cgit.freedesktop.org/drm/drm-misc/log/?h=drm-misc-next-fixes?

I received the account for drm-misc a couple years ago, and was able to access
back then. But now someting has changed, and I can't access at the moment. I'll
need some time to fix my setup. Maybe some help would be appreciated to speed
up. I may ping you offline if you don't mind.

Thanks,
-hyun

> > On Sat, Jul 25, 2020 at 06:34:29AM +0000, Wei Yongjun wrote:
> > > Fix typo in parameter description.
> > >
> > > Fixes: d76271d22694 ("drm: xlnx: DRM/KMS driver for Xilinx ZynqMP DisplayPort Subsystem")
> > > Reported-by: Hulk Robot <hulkci@huawei.com>
> > > Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> > > ---
> > >  drivers/gpu/drm/xlnx/zynqmp_dp.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> > > index 821f7a71e182..3d53638ab15e 100644
> > > --- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
> > > +++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> > > @@ -44,7 +44,7 @@ MODULE_PARM_DESC(aux_timeout_ms, "DP aux timeout value in msec (default: 50)");
> > >   */
> > >  static uint zynqmp_dp_power_on_delay_ms = 4;
> > >  module_param_named(power_on_delay_ms, zynqmp_dp_power_on_delay_ms, uint, 0444);
> > > -MODULE_PARM_DESC(aux_timeout_ms, "DP power on delay in msec (default: 4)");
> > > +MODULE_PARM_DESC(power_on_delay_ms, "DP power on delay in msec (default: 4)");
> > >
> > >  /* Link configuration registers */
> > >  #define ZYNQMP_DP_LINK_BW_SET0x0
> 
> --
> Regards,
> 
> Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
