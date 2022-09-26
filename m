Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B08B5EAA76
	for <lists+dri-devel@lfdr.de>; Mon, 26 Sep 2022 17:21:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F22B10E6D7;
	Mon, 26 Sep 2022 15:21:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70080.outbound.protection.outlook.com [40.107.7.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ACF810E6D7
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Sep 2022 15:21:37 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=mf4JsVauKm0HlZtBcV1Fo80IVXQy+dDCLpAWW6FRq1tGL55KRmai4L/gnBWL/KiDAPB/vXtJXQFY8sSzsOEzyOuKasAhjeYf9RoE0nMyCs671HOqWN+Ys1d/QUfF4aHy5l7wvbFy3iEb9ODsm3t+sSUmpLknYmnhE9Ya6wyuNxbTNOQ1nw6cPZqx3oP5SXoH1Hjk2Wh9fE6+XRRTdr87Rsv6m83mxuCvtByZyWTSbOyV4VSkMvFHsit6egMHyz/G4npcTWblnAPnlRnzYYdbSm+czrTUyVlQJf40xqxX51muVldawpkl089pXJNg4yjn/JLCCsRinG31QJkx8zU+6w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LJipSpId6qD6J7NQViFbW/DWH/mY1gK+kBqlRzCr+UU=;
 b=FPkgGMlhC4ueRO4c3OsrpwNRe6jWeHR7GhQTxEEZagGg9sfaqqO0wY4p3OrRmXWG6IIatxY8pq8RFjBenC9lshNjroCexns/f50/W6JIsJDmR5IVTcStLCoylngKLRIk1W6Pv/VBnbYHUEcDvHe3CxijojNJCXqzOcPoZPzgsbhBcGZJC06zqqlKR/dIqXbrSQKmr1AusatyHS0V5XNjLp0JStcsw3cJf2i33n4frM91pXYr9hLAxlSEdl/LjPgeOaJZ2mzp2T6v2XlOk4PqEq/dzYRnD04mfmylXZ91ojMRpc89WZnEJQYF2U/Xfe8wfSa+QuNAq5Yp0WzSNHyHCA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LJipSpId6qD6J7NQViFbW/DWH/mY1gK+kBqlRzCr+UU=;
 b=Uvclu5tL5LX0QjN63d7QYcQ5r+iR1Nu+AzsjNZg7SpfteeCJkkiZrBXdPY0b4HMYnZr8Src+jXPGxQCxPEu0o6yaOMvKA9phlf3KmQ0RoVxqCcMwBDocC5DXiysdI9/utHic3u6AjZIXLQFpkxpcmcEVbkFBZTN4iHQHZLU7CMQ=
Received: from AM6PR08CA0007.eurprd08.prod.outlook.com (2603:10a6:20b:b2::19)
 by AM8PR08MB6451.eurprd08.prod.outlook.com (2603:10a6:20b:315::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Mon, 26 Sep
 2022 15:21:33 +0000
Received: from VE1EUR03FT037.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:b2:cafe::35) by AM6PR08CA0007.outlook.office365.com
 (2603:10a6:20b:b2::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25 via Frontend
 Transport; Mon, 26 Sep 2022 15:21:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT037.mail.protection.outlook.com (10.152.19.70) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5654.14 via Frontend Transport; Mon, 26 Sep 2022 15:21:33 +0000
Received: ("Tessian outbound 9236804a5e9b:v124");
 Mon, 26 Sep 2022 15:21:32 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0cf3769401a44136
X-CR-MTA-TID: 64aa7808
Received: from f74eec0cba87.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 81BE53C7-F90A-497F-9464-C856BAE6B8C4.1; 
 Mon, 26 Sep 2022 15:21:25 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f74eec0cba87.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 26 Sep 2022 15:21:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nulgPK/n2SfBlSpazq0AbDKx0u87NZviYeE++UQfboEoGd7E3W6D9Ch4jpA6bae3Adkany44MBKBzUwA31reiv1db6+1kb60zjIrnBJzrheg17KxgfA99UfE97vYtIDMzHRxWvANIACDtSy3x1os03AhQF/vnQShWrVU85jgB5XCZEVfED7ueREpwnXuHZnEsdrw9OJwtAd4sSiIvnzFUCOSqABl9mwCEZetHZMbGR1Wezf4ZmEzkdHqK+83XWjsbT3mYZAU5+xZQFNxDSsE2ozJuh0I3m06QTc8EkVF6qJ+87gkWGgWpCDQ9bvMwJa6kyL4gnoTnlll90/jsmWWBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LJipSpId6qD6J7NQViFbW/DWH/mY1gK+kBqlRzCr+UU=;
 b=Heb2Wc6IGkutUazbQ6y5F4ElpJqfhxhQEVdvJPo5qOglo3xn76M2/LUixNLZqg/EpE42+ELmtAIwtGiqeRLYTaxl5YH8niX1XOO1h5gBqMaynoJDISujXFbMGrQ2K/qrecp/RqfZyFRY3imc64+X0HSvir3PVg82DFhq4B5KmMZtlBwFwqq3wqYz9ntJgc/eMzLFMMuXL5KFUu1gkVVLMWRSk8HtCzwKmkw1GkahWEtbNN1IXWucG8wG7+Qv/SzOvjsORRl9QaBxkjFx7eWtfspL4gGej6ukWWSRQ+MN6LAmojaLSr9zxiZBT+yoqXENHuuy4vxEIstozuFm/ARDXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LJipSpId6qD6J7NQViFbW/DWH/mY1gK+kBqlRzCr+UU=;
 b=Uvclu5tL5LX0QjN63d7QYcQ5r+iR1Nu+AzsjNZg7SpfteeCJkkiZrBXdPY0b4HMYnZr8Src+jXPGxQCxPEu0o6yaOMvKA9phlf3KmQ0RoVxqCcMwBDocC5DXiysdI9/utHic3u6AjZIXLQFpkxpcmcEVbkFBZTN4iHQHZLU7CMQ=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from DB9PR08MB6812.eurprd08.prod.outlook.com (2603:10a6:10:2a2::15)
 by AS8PR08MB9648.eurprd08.prod.outlook.com (2603:10a6:20b:617::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Mon, 26 Sep
 2022 15:21:23 +0000
Received: from DB9PR08MB6812.eurprd08.prod.outlook.com
 ([fe80::a677:eaef:48c4:9e11]) by DB9PR08MB6812.eurprd08.prod.outlook.com
 ([fe80::a677:eaef:48c4:9e11%2]) with mapi id 15.20.5654.025; Mon, 26 Sep 2022
 15:21:22 +0000
Date: Mon, 26 Sep 2022 16:21:19 +0100
From: Brian Starkey <brian.starkey@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>
Subject: Re: [PATCH] drm/fourcc: Fix vsub/hsub for Q410 and Q401
Message-ID: <20220926152119.aycl2thery6dtwyo@000377403353>
References: <YyA9Y+Cs8ZCYHXAT@intel.com>
 <20220913144306.17279-1-brian.starkey@arm.com>
 <YyCjmQUZGKP6e8H1@e110455-lin.cambridge.arm.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YyCjmQUZGKP6e8H1@e110455-lin.cambridge.arm.com>
X-ClientProxiedBy: LO4P123CA0400.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:189::9) To DB9PR08MB6812.eurprd08.prod.outlook.com
 (2603:10a6:10:2a2::15)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: DB9PR08MB6812:EE_|AS8PR08MB9648:EE_|VE1EUR03FT037:EE_|AM8PR08MB6451:EE_
X-MS-Office365-Filtering-Correlation-Id: 66b050e9-e37e-494e-7b32-08da9fd2cb9e
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: v4URS2sdYqtvcaRXgpndcFboYE3OuMsl3VaspXEN02a89p5pf/b+dWpz0SWcxBUh6ECsvtogu7gXgHp/nUoNPC7gagzr5CgF11lICEetB4T0kb5r5ySzYuxyX3dMQybTDL0ngcfsXTFmicxxAFpf3GPM5X+QUgSyFgA3sQAJTIFqxGF3Fy9l2ZrsIi2e8Dv5r2cB/0xSE7FgqVMfQ1I5FUgsv2R8IlGFWQQo/QvdiQcsU7SKgFlMFH5Y6ODawPfM4kFh459opo8JR5YDiubvfmI9N+MDwPgaVQ2pPpekLqe8CVo1XNJ71XCheS8oBElBgFouR1sgz9V8LFM8efEoenkzpBcc9z8p0jTkUXitnkiwqFby5wcVR9q/9+xlq4XyrJoslsDNAuy3XfvQO1KLrqhmXHzNN06H798PbDCGnPf7NMi1Y1lPeJeLPQyeKmrkjkprYSiItANFKHlBdXgOiw9r15TUUa+0k47eUvmmQj2uQExx7x4m0gqKbGXn7beFJE/ciV3F6muJ02XOq8ZtAGbRSXRHYXTiBzpW/d0FkOEsjBFfk3cW2nXAeO2meqgPGCu4MQUR7PL4n6wYGLa6SZ/tKdXwQTFeMZBb7KOIqKHPrD3NtL7N3mttJFGtSkSS1+Jz72HmwJM9G2e5i2uSP6gzJuJiniAj7tWAvtQLITDo6XRmGvs0P4Nn9uJos0tqpkhVq8q5cTR+bLRhGjN1dKeGixWEXLc1phucVJLyW5276wGlC8yym1LiFY//BpbZ
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB9PR08MB6812.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(7916004)(376002)(366004)(346002)(396003)(39850400004)(136003)(451199015)(478600001)(6636002)(966005)(6486002)(316002)(66476007)(186003)(1076003)(2906002)(4326008)(6666004)(38100700002)(33716001)(66556008)(66946007)(8676002)(41300700001)(26005)(44832011)(6512007)(5660300002)(86362001)(9686003)(83380400001)(6506007)(8936002)(6862004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9648
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 7e6ac526-62ee-4d9e-a6f7-08da9fd2c530
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LSDf23WhXie+DE59Fm7y9K7fgAuz9LrlASbU1lfntYmyJhDgVmvD21h4gEuPSgvYjlVQPNGxM42Dw7Ztw2Ue3kjJBPb5DIUR0NYszkjCuIrMIE4dbdnzRPS1UH7+bJPgloetcA5wN5aZXuLc2tXXDhWwHtXB1m8DXmRpbXkSorZOFapC/uZ0Lv1WjK4mAZoBwBHfOX6q+jPuJ/0ad0+a86gD8nOKPiue0ntQYqn1k4N0YtDB0WHW+nf3Po/JxRhH+5RLscMQoEsdALCaSRZTBdGqiQCokgwmvpD3mLiPc4MKeYwMHst+X6Mp9FBxen6Kq2v6WB2x3dZEq8GD3dmnrCYRkR2Ycljis421IkQhdgdVS9vbsBE6X/XKxcLZ64uMW4kAR8ePSbddCKbVDfgF7GBH3WAhZTtNTmGCsYzR36sIWQbHIHDAsNJ3W3KjmT7s5dAUUQTG6cf9B+a03bkz81Hoimw0sxY9poS8fHlNXJuavlNDfbrzilTTGtc5tF9PL4f5sIrEoY5EzD1jNVhU5kbm/njAjRvuP5LgqOD1kB+WRWbFzp3fx3usr8wQnwLuXbE3UyXdIApZX/+5cK9pAxKmcUZecZ/h3mX1Q3HADmrTeXCkT1BgMl/5SKrySxdknbGaHn5hJMCUbX42/vyDYrAgstCj4I5Bh+pjGFoDZFZHVrg5VU6KeHFQLdHeGv08xwZHm/YF04Zzh5OVUGD12Hy4FQQzKZkMr6AC8VK0znAyCQMX+vwVYwQG4LJMa7juCHm7LmENYmGBd1zMf11/4ufyt43WsDAkDXzEBVSUZq+rnPBc324E4B99HGokpXCU7HFSIeQhoz+rTfPuqiX59QlhnIpfxQR48L4xwt3V6JE=
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(13230022)(4636009)(7916004)(346002)(39850400004)(376002)(136003)(396003)(451199015)(36840700001)(40470700004)(46966006)(40480700001)(6636002)(70586007)(86362001)(6486002)(478600001)(316002)(966005)(70206006)(8676002)(4326008)(6666004)(36860700001)(82740400003)(40460700003)(83380400001)(41300700001)(6506007)(44832011)(9686003)(26005)(5660300002)(6512007)(8936002)(6862004)(81166007)(2906002)(33716001)(356005)(336012)(47076005)(82310400005)(1076003)(186003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2022 15:21:33.3362 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 66b050e9-e37e-494e-7b32-08da9fd2cb9e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6451
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
Cc: jonas@kwiboo.se, airlied@linux.ie, butterflyhuangxx@gmail.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 George Kennedy <george.kennedy@oracle.com>, ben.davis@arm.com,
 tzimmermann@suse.de, nd@arm.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 13, 2022 at 04:36:57PM +0100, Liviu Dudau wrote:
> On Tue, Sep 13, 2022 at 03:43:06PM +0100, Brian Starkey wrote:
> > These formats are not subsampled, but that means hsub and vsub should be
> > 1, not 0.
> > 
> > Fixes: 94b292b27734 ("drm: drm_fourcc: add NV15, Q410, Q401 YUV formats")
> > Reported-by: George Kennedy <george.kennedy@oracle.com>
> > Reported-by: butt3rflyh4ck <butterflyhuangxx@gmail.com>
> > Signed-off-by: Brian Starkey <brian.starkey@arm.com>
> 
> Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
> 
> Should this be backported into stable releases? How far back to we go?

Probably, git says 94b292b27734 is in since 5.10.

Could someone merge this so it doesn't get lost again?

Thanks,
-Brian

> 
> Best regards,
> Liviu
> 
> 
> > ---
> >  drivers/gpu/drm/drm_fourcc.c | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> > 
> > Sorry, I lost track of this - I thought it got fixed after the previous
> > thread[1].
> > 
> > -Brian
> > 
> > [1] https://lore.kernel.org/all/26fdb955-10c8-a5d6-07b6-85a4374e7754@oracle.com/
> > 
> > diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
> > index 07741b678798..6768b7d18b6f 100644
> > --- a/drivers/gpu/drm/drm_fourcc.c
> > +++ b/drivers/gpu/drm/drm_fourcc.c
> > @@ -263,12 +263,12 @@ const struct drm_format_info *__drm_format_info(u32 format)
> >  		  .vsub = 2, .is_yuv = true },
> >  		{ .format = DRM_FORMAT_Q410,		.depth = 0,
> >  		  .num_planes = 3, .char_per_block = { 2, 2, 2 },
> > -		  .block_w = { 1, 1, 1 }, .block_h = { 1, 1, 1 }, .hsub = 0,
> > -		  .vsub = 0, .is_yuv = true },
> > +		  .block_w = { 1, 1, 1 }, .block_h = { 1, 1, 1 }, .hsub = 1,
> > +		  .vsub = 1, .is_yuv = true },
> >  		{ .format = DRM_FORMAT_Q401,		.depth = 0,
> >  		  .num_planes = 3, .char_per_block = { 2, 2, 2 },
> > -		  .block_w = { 1, 1, 1 }, .block_h = { 1, 1, 1 }, .hsub = 0,
> > -		  .vsub = 0, .is_yuv = true },
> > +		  .block_w = { 1, 1, 1 }, .block_h = { 1, 1, 1 }, .hsub = 1,
> > +		  .vsub = 1, .is_yuv = true },
> >  		{ .format = DRM_FORMAT_P030,            .depth = 0,  .num_planes = 2,
> >  		  .char_per_block = { 4, 8, 0 }, .block_w = { 3, 3, 0 }, .block_h = { 1, 1, 0 },
> >  		  .hsub = 2, .vsub = 2, .is_yuv = true},
> > -- 
> > 2.25.1
> > 
> 
> -- 
> ====================
> | I would like to |
> | fix the world,  |
> | but they're not |
> | giving me the   |
>  \ source code!  /
>   ---------------
>     ¯\_(ツ)_/¯
