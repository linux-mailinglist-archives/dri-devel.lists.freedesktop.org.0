Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 719204AB772
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 10:19:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B42210E3A3;
	Mon,  7 Feb 2022 09:19:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60049.outbound.protection.outlook.com [40.107.6.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43C1810E3A3
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Feb 2022 09:19:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AU/9KE5OWNzcXpSu6fduc1UuBmXcbXP3TJWAJ5+c3Nv+9OaHd0kD3fwggPFu0q08HTDn7NK8sprdgwd2rdvF02q6ugD4+r1wiK9dmLELbmE9Nj9NrPboenh598pTnpTRM+R8+Me6E5beyHVXuRcNEb2MTj9yLwBZn27WIAEioalSp6peWx/zAa8c87yZOQS8p65bNFTgQcveccXoSLUHvLEwFyoEnaWL1wvB/7eQofhqeeyiVmr0lZKNa8B01IriRpuYONFJ2FPnWxDqmM5sJ2gdcEkjOA2TjkodQKmZxMPkzGqLwP1xOAaOztj4xANuUGAxXrwlTc698Q8PmAV4TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qoVIqLSMHGHXa7p4wXiz/jk2AfrVdazypJ/MyGz0O1E=;
 b=KQ3wY9yPEXXU0sKKadUX95k3A25yDWO1L3RdwWkFFN7D7sGzr6w5ZrZmJXmdwxnD590Koh6dHpNhhPp0porTI5Ktqf7tw7CL/EUhy1AOOikE0YL4LTfiOY77g0z1jvDKJ7oQuOwtOgaTrbOjnnhMaqn3ViZyNlCgAeL7zt5O1OJtltW3fZXZNlwxI99AtBRnAT7HMw9ei0pJCkNxbaajJNov76OW0iNFzs24k3CXMzCpjHiKdtnST6wu8cLvYoJPfLgMhf3x8gtuZyM6ObGTtX3JHE9DaQJlh+olKCjTuXuGr7tI7f7TMtMvmBLV6+u0zpgLIOWHcHquDj709M3HwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qoVIqLSMHGHXa7p4wXiz/jk2AfrVdazypJ/MyGz0O1E=;
 b=A0DSGZ/jl1MfHHMfnLUtF32iRw1zDPjVLBMcW95IdDdcnUKzK2O3F6Hv6IB9QRp0kZBcEqfFB8b/gBnvMaQ0tkdMO7424WbJCvu2z9ZulrXwvwpRfCCcxdEZeQjFhSFD6ruxlQpIOnpTpNAN3CaP7OI+8JHMYf/D6oyWYP6YzT0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DB7PR04MB5993.eurprd04.prod.outlook.com (2603:10a6:10:8d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.19; Mon, 7 Feb
 2022 09:19:15 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::ddca:beb1:95b0:1ae1]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::ddca:beb1:95b0:1ae1%4]) with mapi id 15.20.4951.019; Mon, 7 Feb 2022
 09:19:15 +0000
Message-ID: <1020798373f3f54d1dd7df7174afaeb973ec86ff.camel@oss.nxp.com>
Subject: Re: [PATCH] [RFC] drm: mxsfb: Implement LCDIF scanout CRC32 support
From: Liu Ying <victor.liu@oss.nxp.com>
To: Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org
Date: Mon, 07 Feb 2022 17:18:43 +0800
In-Reply-To: <9a2cc781-3277-7e09-530b-05c7361cdaa8@denx.de>
References: <20220206185643.275811-1-marex@denx.de>
 <d5ac849dc8aae325d98f215d4f92d492abd909c4.camel@oss.nxp.com>
 <9a2cc781-3277-7e09-530b-05c7361cdaa8@denx.de>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR06CA0004.apcprd06.prod.outlook.com
 (2603:1096:4:186::20) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 73eb533a-fca1-46e5-1f9a-08d9ea1ae8fe
X-MS-TrafficTypeDiagnostic: DB7PR04MB5993:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB59930B9001CBEA7EE2FFB3C7D92C9@DB7PR04MB5993.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FBpu1kNCzZyuNetA7LX6L+abM8SzJn6ZENzgt4BS/RNz8KsXx+gQMCZyh9P3as428YCfpeWBJaEN2VWXkhB+CT8TpG8VrCMuo8l9mwxJ4A1V8AyRZMmgW5kd/X+aRPHbDD39yu2koHJz5umAPtNGhMeY53WOXVTJGEaHm3n9aVrprWuHvt0gJKNREcxQjfxu+neIiHPf22CMX57S87t4BAosM6lCd+vHAwneXVZ1FpX0c6X4URJREEgTHJQZ79T/v7HzKpabo5WbUGdvUeog/J2NikvCf9bTFJnLeJTqGFWxZwUwaqxZbMo/UiXpGrMHO4Y7LkgvL0sAJv/pyTDY5An9ka0dUXXiVLsvbe6VzJcfrx7GqqzabDTxdsjd3C/LM6q7XJf7HlYVyOp3jGfVaII14B+H1aGKp7lqCcO6ypyAGfgzi/jRSFAb1sjgO4VAP+nuUM8UgNm4S14BtIQ5loVODfTOItEDt4x1XdB/21Kq0jXJZBT9H1UUm4WIeDShT+xFrBMz4s/n0hpEj6x6rNgtEUdq27BxG3z3+MLkO4jCQ4rlvzNsiRMDPlNNqDVAgkq02Z0y7qIjQZTVPaVx7DxABFXzKPwRwVhzR3Ix8R4F1mDgklhXcKmZXZRjNGGP3YvJuchpPK1b+5OZCnyMy1txeO8Bev6c5cY1+hMO5H397cvhzavHOmuesRige5/2KFJ3r8vs6ek8cR+1Xf77g9mAN2HIbKJmOVHXE4Du/Ac=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(26005)(186003)(83380400001)(2616005)(52116002)(53546011)(66556008)(6512007)(6506007)(6666004)(4326008)(8936002)(66946007)(38350700002)(38100700002)(66476007)(8676002)(6486002)(54906003)(316002)(2906002)(5660300002)(508600001)(86362001)(99106002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dm1aeWVoZEo2RkxOQ0x0RTZjdHQ2WEZoczZuU0M2UDlTMVBvemxiUlpLU2F4?=
 =?utf-8?B?TnllOGUvUnZJTmQvOGlvZUJ4TE94THZ2TFpvZzFGWk93eHYwWktsdWZMZG1x?=
 =?utf-8?B?TUZEZjl3VW9HNG0zV3JLV3kxWHRIQ0xXTmpoR25iVVdnUk42VTUvY0pNRWdM?=
 =?utf-8?B?N1E4cytjckw0dkVwSjlVSEswcXN5SGRqUnJhWUlpR1RlckhLNGx4UEdqc0F4?=
 =?utf-8?B?MnMveUtKb2tRVUVROVo3V05Vc3UxL1pqUnFRTHN3MWJLTVZQYWV3TWVTV2N5?=
 =?utf-8?B?ZEo2eEZIRUsrdkcycW9vc1p2Rkx4NTNyWG5MSnhkOTJ0bGs3RkptTkJFaGRl?=
 =?utf-8?B?a2gvN0V4Rkw0OWxuNDBGU0JZdzNGTFM3SmhCQ1B4bTVYMDJ4TkcyTHZXSFZv?=
 =?utf-8?B?cDViUVB6NE5VMWg4VGRhQkRUQnE1cm9pdzBvNGEvemxPa0xycmZKSjduM1Qz?=
 =?utf-8?B?ZGoyWGFyd3dpN2FMS3ZZaXFJT3V1NHZlZTFtYWtDWUNTRWVNbmJ0UXRCc003?=
 =?utf-8?B?bHRqOWp4VjlUN0s4d0xiUVN4QjRwR21rNmlCejVhVjB3NG1WbWtOUWt3bEVO?=
 =?utf-8?B?Q2svOURHTHlManpGTnRaczNKOGJ0d2xvZ3Y5bnovQzFnK3o3Qndta1Z3NHEy?=
 =?utf-8?B?RGloWW13NU9rOHJncm10U3dxa3N5ditlUHBlWTFxRTVsQ0MzeTljRVpGUnRi?=
 =?utf-8?B?Y09KUFJETSsxWjk3eTRYZDBzWjBwaHNwemcwdGw5NzVxWEJtSXFIMGNDOGkx?=
 =?utf-8?B?UVdLUmRuUzh2V1VyY0VRcUN2NkE4VmF4MjZLTElFK2lsY2JHQlVid1h1NzZM?=
 =?utf-8?B?WVhaQnpLUm5qbmd2RlBmY0gvbWxRQ3dPY0p6T2FmSkhqbjJsTnArekhVM2FS?=
 =?utf-8?B?dklXOG1UVkkweUxtVVZIenZsVWN3MkJINVp6RzRLTE1wMWZQNVp3NWVaang0?=
 =?utf-8?B?dGt2OHQ0U01GYWlsZklFeDVDWCtuL0xFVVF0NWlvRHpOa1BTUUFRRXJqUHFn?=
 =?utf-8?B?OHdOMmdVMnlGS3FvYi9RTDdhVXdHTGI5N3dDS3FPay9CUnRCZHRLeFd4bWpH?=
 =?utf-8?B?aFZlWWRBRVNuV1ljNUFwdVE3LzVLamplaFg2bWdYdFhwK2drbGxBWC9GU1FD?=
 =?utf-8?B?S3V4R0VibFNUaWRsRVREYWFDVVVkVDBubG53VmpST3hFMU5zZmpGTDhIYkJN?=
 =?utf-8?B?TzFPdzBIRXNZOFJsanR0THd5R0cxM3JuS3Rwdy83b3dTeWxqQnVMUDJRbUYy?=
 =?utf-8?B?aWZEdmxJZ0l6L2pDQjVTWUx6NlQ3Zm1VWG9tNFpRZ0pDZDhmZUNuQUlJcWtX?=
 =?utf-8?B?WTRzYlE5VVQ2TER1VVdEV255QlZVdnFXMTN2aDhNOHVpQWNuWWZGSVJDendD?=
 =?utf-8?B?c0pEMlNSUmpISDNlN0JBaWhUSEF1TG5zbmFjL2h4TVJON1BaMkJ4SlQvQi84?=
 =?utf-8?B?Z25wbUJZd3ZTWGVUT2ljdVdsZEUvcDEwZFl2eUc1M2FhL1ViUEJxQklnamlD?=
 =?utf-8?B?blp3T0FPUk9VYXo1ODJINlpsMWJNTE1ZcWFLZGF6ZFdxaHphSElNWnFiWm5J?=
 =?utf-8?B?MWJGVkJLeXNXNjh2UHlabHk4bWRsQ05VN0NWaGdtbm5JK0lMM3VWM2JKbEJO?=
 =?utf-8?B?VGY5RndKRmJkYUVCZ2hUNWdNWXdLU3dYSkNNS0VaZndDWFBPOUxmSXd1YlVs?=
 =?utf-8?B?M2FKNGlIRlYyNk56Z0l4TFBTQ2NBTWF2ZmQwSU9HUWpkNlBOU2xlRzFIbTc5?=
 =?utf-8?B?WFVyMmNxZmhoYmxzVXNQM1p5b0xqeDd2UG9KRDBMRUh3U2dQWWFpVW1OTkhW?=
 =?utf-8?B?VFM0RVVueE1Pb0JMK0RUaFZSWE1CbjQ2YWFUUEhlU0ZLZlBZYng0S09NMlo3?=
 =?utf-8?B?dXdoUXBBanVJVXRSdnJ0d2xtUm1FREtLclEzT3lBL3lSTzc1RUJxS3B0bHFk?=
 =?utf-8?B?eDZOVXZyVjU4ZDVURUl1UEZTTllub0FTWmdOeVE5OVJrcXlRQTNKS2RvcGN4?=
 =?utf-8?B?aVlGYWdJVWJiUi9DSjdxNzM4NFlJb1BWVkJRSVpRYWZxK3BTWjdhOFRHQ3Br?=
 =?utf-8?B?bEZGN2NPWWN5TEVQSVhsTk54VEVnbDJGOGExNjRzSnhMWVBtVVJEVFNPZ3Ni?=
 =?utf-8?B?c3gyRG9UbDBsblF1bUFoSEMrTVBYRFB4emtqMWVBek42YVROc0t1YWlYYVk5?=
 =?utf-8?Q?sZIkPSfCliyFL125kRlY7HU=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73eb533a-fca1-46e5-1f9a-08d9ea1ae8fe
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2022 09:19:15.3189 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K4FKbZs9XgWurl5R4mqsfcxLN53GE8zwQelBxcxAVQTe91TvUKuTrcAW1dSfsFbq1IpfsZK2EybKsH+L7+aSxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5993
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
Cc: Peng Fan <peng.fan@nxp.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Robby Cai <robby.cai@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 2022-02-07 at 09:14 +0100, Marek Vasut wrote:
> On 2/7/22 06:13, Liu Ying wrote:
> > Hi Marek,
> 
> Hi,
> 
> > On Sun, 2022-02-06 at 19:56 +0100, Marek Vasut wrote:
> > > The LCDIF controller as present in i.MX6SX/i.MX8M Mini/Nano has a
> > > CRC_STAT
> > > register, which contains CRC32 of the frame as it was clocked out
> > > of the
> > > DPI interface of the LCDIF. This is likely meant as a functional
> > > safety
> > > register.
> > > 
> > > Unfortunatelly, there is zero documentation on how the CRC32 is
> > > calculated,
> > > there is no documentation of the polynomial, the init value, nor
> > > on which
> > > data is the checksum applied.
> > > 
> > > By applying brute-force on 8 pixel / 2 line frame, which is the
> > > minimum
> > > size LCDIF would work with, it turns out the polynomial is
> > > CRC32_POLY_LE
> > > 0xedb88320 , init value is 0xffffffff , the input data are
> > > bitrev32()
> > > of the entire frame and the resulting CRC has to be also
> > > bitrev32()ed.
> > 
> > No idea how the HW calculates the CRC value.
> > I didn't hear anyone internal tried this feature.
> 
> It would be nice if the datasheet could be improved.

Agreed.

> 
> There are many blank areas which are undocumented, this LCDIF CRC32 
> feature, i.MX8M Mini Arteris NOC at 0x32700000 , the ARM GPV NIC-301
> at 
> 0x32{0,1,2,3,4,5,6,8}00000 and their master/slave port mapping. The
> NOC 
> and NICs were documented at least up to i.MX6QP and then that 
> information disappeared from NXP datasheets. I think reconfiguring
> the 
> NOC/NIC QoS would help mitigate this shift issue described below (*).

I also think the QoS would help if it is configureable.

> 
> Do you know if there is some additional NOC/NIC documentation for
> i.MX8M 
> Mini available ?

No.

> 
> > > Doing this calculation in software for each frame is unrealistic
> > > due to
> > > the CPU demand, implement at least a sysfs attribute which
> > > permits testing
> > > the current frame on demand.
> > 
> > Why not using the existing debugfs CRC support implemented
> > in drivers/gpu/drm/drm_debugfs_crc.c?
> 
> I wasn't aware of that, thanks.

No problem.

> 
> > > Unfortunatelly, this functionality has another problem. On all of
> > > those SoCs,
> > > it is possible to overload interconnect e.g. by concurrent USB
> > > and uSDHC
> > > transfers, at which point the LCDIF LFIFO suffers an UNDERFLOW
> > > condition,
> > > which results in the image being shifted to the right by exactly
> > > LFIFO size
> > > pixels. On i.MX8M Mini, the LFIFO is 76x256 bits = 2432 Byte ~=
> > > 810 pixel
> > > at 24bpp. In this case, the LCDIF does not assert UNDERFLOW_IRQ
> > > bit, the
> > > frame CRC32 indicated in CRC_STAT register matches the CRC32 of
> > > the frame
> > > in DRAM, the RECOVER_ON_UNDERFLOW bit has no effect, so if this
> > > mode of
> > > failure occurs, the failure gets undetected and uncorrected.
> > 
> > Hmmm, interesting, no UNDERFLOW_IRQ bit asserted when LCDIF suffers
> > an
> > UNDERFLOW condition?
> 
> Yes

Did you ever see UNDERFLOW_IRQ bit asserted in any case?

Liu Ying

