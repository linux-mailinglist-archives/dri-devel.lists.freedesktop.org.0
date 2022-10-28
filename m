Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD39610824
	for <lists+dri-devel@lfdr.de>; Fri, 28 Oct 2022 04:34:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62F6B10E046;
	Fri, 28 Oct 2022 02:34:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2088.outbound.protection.outlook.com [40.107.21.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3C9510E045
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Oct 2022 02:34:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y70NCaFLPFWl0qH3vlTb3fAHOsanRjSoShg+q0XdJ8e2PRpmbCR62C638Yyc722D0h7kIA9RhwkIWz9gUcmm2lDBigZp57PeEnqerz8thAM+6QJFDs5v57HYzfl8zVjo9pYGH5cbdkkqCA04Jn0EZ7nEFWSA3tGg2RHdnE/ZisAwSikZ91k0mBdPVAjPQYuFLXdGdQqSE1Bl4lGKLG68JYtzYz7/thnov/F2b56phEaIqJOOSqzLtou/dQTcYmgKA3zc2f8u3HlMmJdxrYZ7CnuJ4+vGWcaBELYuAdHpfsoG/vHz5yWeAgjYpWmzs1Bc6AhtPSXyOlFAqk5AN0OAMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a3dfR+Vl34wIOWg6tJYVDZCMqWmRT0+s6W5ryC4z6Fc=;
 b=YBSdNSSVoSV2LOkEd1OuSEctXE3hctnMalUgxx13Kl5uhMNFC9aptb6c6Q6HLg+hncPP5tLBzeJCageocLre/2rw1aoD3qF5/4TU6CgH07v+CwBUhsQVo2oup26AQj64IxfRJQAik1nU2lu9uO+x8vRV7/Z7DqjYlvl8uVh4bkcjNPDs2p4T0Xi8kQOD4bpikubsavPyJd8jvfPKKzsm99IBOw/mkoUtfN2IftLGXGBeKOG3tqOzUsR+WbTJwitmJ6WL8CK9nyOzr85EvwXz/L59B/6c/9tYBpepAUQ3sL8XQhWPEWOV45W+Pqs3HrFI5g41RU1iILw+PV/OrWcK/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a3dfR+Vl34wIOWg6tJYVDZCMqWmRT0+s6W5ryC4z6Fc=;
 b=NOy8NMXpVW+/z9j6ipgvaCl5BG/w7pZxXt7a45LtYFl7d2n1dajb1ERq10BYfOUzw5JLs2+CBvz0lbrtZ0dbgzcZgGd5fDre9Or8/ADzNSvO6W50m7jiMCVn20i0+uBeLemM1jMDH6YLMR922XHfosH4uLlvVxSJHkno9cTTQIA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM7PR04MB7013.eurprd04.prod.outlook.com (2603:10a6:20b:116::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.23; Fri, 28 Oct
 2022 02:34:25 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::dcca:b62f:206b:dcf8]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::dcca:b62f:206b:dcf8%3]) with mapi id 15.20.5746.021; Fri, 28 Oct 2022
 02:34:25 +0000
Message-ID: <57059f620dc6dbd63ef289a82c8dae685d048242.camel@nxp.com>
Subject: Re: [PATCH] drm: lcdif: Set and enable FIFO Panic threshold
From: Liu Ying <victor.liu@nxp.com>
To: Marek Vasut <marex@denx.de>, Marco Felsch <m.felsch@pengutronix.de>
Date: Fri, 28 Oct 2022 10:33:29 +0800
In-Reply-To: <45837065-f231-8c72-4818-d943133d66a5@denx.de>
References: <20221026212002.542375-1-marex@denx.de>
 <2e9368bcc1c354ff01e63b9c451d839aa6a7a36f.camel@nxp.com>
 <9bd9ee85-3a20-f13a-3984-017a439e08cd@denx.de>
 <6398adb972ef8623fd594fd573b5ed6838948516.camel@nxp.com>
 <20221027174748.niz6wi7dqwj3nlyr@pengutronix.de>
 <45837065-f231-8c72-4818-d943133d66a5@denx.de>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2P153CA0001.APCP153.PROD.OUTLOOK.COM (2603:1096:4:140::7)
 To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AM7PR04MB7013:EE_
X-MS-Office365-Filtering-Correlation-Id: 594eda97-8287-4051-df2f-08dab88cee11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: z598hZXqocFgkPbDD2EGDn3c+9fzMtgtjZY72JGiaGAu7IVIT7MYhOcaUflQH0esa03GyOVrUc1RIFLUupor8RNNCZuJkB6fltm4FfcHStgy/WIlCuiwmVvQAo0h3L4i0IN8U8qnzYh2/lTsoKJ1gbJ8DltBWXm88IvZJ0fPbYjq+2wg6MbqI3RiwJNpfEYAeVqRc65PvujuRi/dGypHuqy3aRJ/z7D6Y6MjY9uNudJAC4qEGrSeOmg/zYbW187DZjuU6f/LjXEypG+pyCyLK559Te323BdUAG8ib4CNCiVnqHVvojf77gDm4w9gmOs2hVysBNg3QycBnZFee8bPx+lZlhPA+87vDHdzYhTJ16nSMnyAg7s3RITZaDgkCSr/3KnNk5Pq8kRE6FIARyzR9Pb5CrdZnY+bSsIcwt731QqTIS6V30B1IIj19poTRz8YegpYMsLF11xNJf2+v1D28YpAp42Tym6nKgsTFObTkDPmkLFhSJ91thTGUUpvpgaJOZlOH+f0QIC1rmXUFskTVH9TySnYWIFbMTLrtlbs5ygFZy75aLWS7RhqjySk3NleDBkiYcR2kYRPQ+Azhtsh4rJ154sD0SnqGElNgEuJ4uU52oqVmMoCZnj+gVG+qUsHUjoCQTHaO7nmqaa0pBqvIFlBH9hCMaW1WtagNFz0k+jcPDpW68Xesyx+SuT7esLflPjh5/Am3CF9WQEcOI2S2I3D66HDza8vym5NA1VdWLbhlSg9WA91Bd6YshAOwjhwmwRu9yUCwsItkX8PF8+q6q6kCAT+IbYvRxbWDodozrc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(366004)(346002)(136003)(396003)(39860400002)(451199015)(54906003)(8676002)(316002)(4001150100001)(41300700001)(8936002)(66476007)(66556008)(110136005)(478600001)(6486002)(36756003)(83380400001)(5660300002)(86362001)(6506007)(26005)(38350700002)(52116002)(6512007)(66946007)(2616005)(2906002)(4326008)(38100700002)(53546011)(186003)(99106002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SWl2aURSc3NxNVNlUHQ4Q3hhcElwZVRocFVSaHRFNmVxSlZlWTJrcnc3Rktt?=
 =?utf-8?B?cE5qV0VNa0xIc0x4Y2MyNUNYWVJmMis0dkoxSzJsYzJOOStpbkY4TUY2OVhS?=
 =?utf-8?B?eXFmT3hHd3N1azFJekVYSXdXWW1WcjJjZjNhZjJ5WGY5S0FIV2NVZFgrWVN4?=
 =?utf-8?B?aTVWN1VzWjQ0QlcyL0lKbVJieVBEKzU4VkNFMkFmRGRHd0NmVmZXcGZNclRN?=
 =?utf-8?B?c0drMElMY1g1U2FPRGJWdm1RRjgwOGVmcFFCQ1ZsRVFuSW83Y3BFWkw1Yk0w?=
 =?utf-8?B?QnJCVlBYQkhCNjlJTGhEL3pxdzZEWVIwczZUaDRzMGhHSFZQMzc3VWhrcEFs?=
 =?utf-8?B?T3lMT290dWlUVGU2WGd5THg4SmFFbUw1OTBZa0k3YUxZaVppNlRUb3hwOGZl?=
 =?utf-8?B?NnQrVFRNajJGNUJpT284R0N6N3hHQUd0R3BJSWh0V2Jzcm96d1RZNmxCUXZM?=
 =?utf-8?B?ZTZueFFXZWpTRDBoVGxXNStxL215VytSdWRLYnFuUnBieWp1TGhPSjM1TUlD?=
 =?utf-8?B?QWdDRG53WG83U0szaHNTZytZOGtrNWEwMVVhVVBlYlUwYXdTTmxJY1JPVmVE?=
 =?utf-8?B?RkhZdjF3RjY1STEwOEo3R2N4ZXhUVTExR3JNazVWL0hyRyttV1EyeXJpT1NM?=
 =?utf-8?B?QjcvVHdYSUttTE14MDNvTVdMK0wwU2ZFUHp1d3NPQzFjOGRTQ2xDa29seDZD?=
 =?utf-8?B?T3lEU2VwaWVQMDNNMkM0U0FDdE1OVWJsSFUzTjcyQ2NndmFZNllxeFVzUEJs?=
 =?utf-8?B?bGZrWFlqaVhrUWRPdk13ZFJpQ1JoelRLbUdWVlFEOUFXeDlMeSsySVR6S3NR?=
 =?utf-8?B?TE9VYnE3bVN4V1dUKzFaRklwZjZscS9mODBHN3gzQjRLTzN1ZUFSUGxlWmph?=
 =?utf-8?B?Uk50NTM2RHpZMU1ocWwzYnRsVm5nSjY0aEtoblFTSlpjcWNtbU9VR25SQlFi?=
 =?utf-8?B?S3UrRTVwM2J0WG5Td2F3SFgycjBaM1N3ZnZPdmJGTndiNkEvNWI5VmM3WFdo?=
 =?utf-8?B?V3Azd1MwT0dZZWYyMjBnNEJiV0R3YTNaUE43UHNWMjBYSllJNW81OGpJVkl1?=
 =?utf-8?B?NXBlcER4RHhUUmw3Zm1JUGxUWmtMMzg3cjBQd3pUTUJkbjNhR21ycUF6ZFYw?=
 =?utf-8?B?UnoxeEpsUlhHb0c2NGNSVmVuS3U2M0lCSzMvYjIwNWtzWndxQWp3OWlVYTg0?=
 =?utf-8?B?VFdoNUpyR2RoeVI1QzRyQ2FmK2lDTTVPMFJMRUd4aThtdnlaMTU0TUd6a3hy?=
 =?utf-8?B?bkhwdmxMYS8vY1NGUG5iMzh4OU5vb2tRdDJ4eGpYdjZPZm5pR2QvR3lpMTc2?=
 =?utf-8?B?QzdlMVY2bGw3QVZaOEora01OLzBwb1JXUnF1SXc1Y2RSTEVLS2cwdkw0Rkti?=
 =?utf-8?B?U21mdTVPYXZNZVN4WXdxN0RTY1N1enQ2R1c5RldpM0kwQXIvK2xzRVdmSWVN?=
 =?utf-8?B?UEVmaTVnQVJsMmlWMTZkUndvT1NReWFieGxtazRjQmp2aitMenhSOWh0cDRH?=
 =?utf-8?B?TEc0Unl6SCt2MEUzanR3MEJPQlRDRXpIbWJjeVFXbG9hTVBoVDU1NlhROFdo?=
 =?utf-8?B?VTFMYTFRLytlcHhYbCs3eUcrR3Z5Vm8xRW1QREI0OW5pN2p1UkdQYlBTSjlC?=
 =?utf-8?B?NFBnNjErYVUrcUoxV2F2Y1M3a2hIZ3lTQklCQloybXc1NDJEcFFlb1pPYlgw?=
 =?utf-8?B?ZXAxM2NjSDkvOTdONXZETHk4UmRFTXNQcGsvZC9QR2wyWTB4TzVsZEluK1Vr?=
 =?utf-8?B?V3lIeEhqVWY0N3p6L1IrZk9WUElvdm0rWXYvbDVmdnhlSEJHUmQ0aGMybGlL?=
 =?utf-8?B?WmxvdFQ1RXNyaUI5R3JsZm05VEZrMzVENndQUjlucFhndThIdnNLWEIwQjIr?=
 =?utf-8?B?K2pYWlJxY1U1R1NFb3pxQkxLcFhCcG1GUHF3NmhPejdKM1RvZTJLTEZRWFVS?=
 =?utf-8?B?QkM4aDIvZmpreS96clBsNjRpRlpJcUtTdUxlL3o2ZFVWNnR3TmxmQW9ZSjB4?=
 =?utf-8?B?bVptUjFTbHcxbkNmL0pIN09PM2lBT2g4T29LWTR5Y3JZcGZxQWNiYkFXZXhH?=
 =?utf-8?B?aXAvcUVoRHptZlFVczQ2UWtaUnRCeTdDRXhnamFqOGlxWnNnNlU5MitaWSt4?=
 =?utf-8?Q?Nm+l2q1JGisrURw7/XKX4sWIX?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 594eda97-8287-4051-df2f-08dab88cee11
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2022 02:34:25.7470 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cuNNRqRvPa7N+38cSLt59zFHxZZVZP7I+1CDz8WS0p9HpjLSzw4bSze0L+i6mtfndq6pqRW6sm42XzaZux74Uw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7013
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
Cc: Peng Fan <peng.fan@nxp.com>, Martyn Welch <martyn.welch@collabora.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, "jian.li" <jian.li@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 2022-10-28 at 02:03 +0200, Marek Vasut wrote:
> On 10/27/22 19:47, Marco Felsch wrote:
> > On 22-10-27, Liu Ying wrote:
> > > On Thu, 2022-10-27 at 12:03 +0200, Marek Vasut wrote:
> > > > On 10/27/22 07:45, Liu Ying wrote:
> > > > 
> > > > Hi,
> > > > 
> > > > [...]
> > > > 
> > > > > > diff --git a/drivers/gpu/drm/mxsfb/lcdif_kms.c
> > > > > > b/drivers/gpu/drm/mxsfb/lcdif_kms.c
> > > > > > index a5302006c02cd..aee7babb5fa5c 100644
> > > > > > --- a/drivers/gpu/drm/mxsfb/lcdif_kms.c
> > > > > > +++ b/drivers/gpu/drm/mxsfb/lcdif_kms.c
> > > > > > @@ -341,6 +341,18 @@ static void
> > > > > > lcdif_enable_controller(struct
> > > > > > lcdif_drm_private *lcdif)
> > > > > >    	reg = readl(lcdif->base + LCDC_V8_CTRLDESCL0_5);
> > > > > >    	reg |= CTRLDESCL0_5_EN;
> > > > > >    	writel(reg, lcdif->base + LCDC_V8_CTRLDESCL0_5);
> > > > > > +
> > > > > > +	/* Set FIFO Panic watermarks, low 1/3, high 2/3 . */
> > > > > > +	writel(FIELD_PREP(PANIC0_THRES_LOW_MASK, 1 *
> > > > > > PANIC0_THRES_RANGE
> > > > > > / 3) |
> > > > > > +	       FIELD_PREP(PANIC0_THRES_HIGH_MASK, 2 *
> > > > > > PANIC0_THRES_RANGE / 3),
> > > > > 
> > > > > Better to define PANIC0_THRES_{LOW,HIGH}(n) macros in
> > > > > lcdif_regs.h?
> > > > > 
> > > > > Downstream kernel uses the below threshold values:
> > > > > a) i.MX8mp EVK board with LPDDR4
> > > > > 1/3 and 2/3 for LCDIF{1,2} + DSI/LVDS - default values in
> > > > > driver
> > > > > 1/2 and 3/4 for LCDIF3 + HDMI - set in device tree
> > > > > 
> > > > > b) i.MX8mp EVK board with DDR4
> > > > > 1/3 and 2/3 for LCDIF{1,2} + DSI/LVDS - default values in
> > > > > driver
> > > > > 2/3 and 3/3 for LCDIF3 + HDMI - set in devic tree
> > > > > 
> > > > > Jian told me that LCDIF3 needs different sets of threshold
> > > > > values
> > > > > for
> > > > > different types of DDR to avoid 4k HDMI display issues and
> > > > > the
> > > > > threshold values impact overall DDR/bus utilization(?), so
> > > > > downstream
> > > > > kernel chooses to get optional threshold value properties
> > > > > from
> > > > > LCDIF DT
> > > > > node.
> > > > > 
> > > > > Instead of always using 1/3 and 2/3, maybe there are three
> > > > > options:
> > > > > 1) Same to downstream kernel, take 1/3 and 2/3 as default
> > > > > values
> > > > > and
> > > > > get optional threshold values from DT properties - no
> > > > > additional
> > > > > properties are acceptable in the existing DT binding doc?
> > > > > 2) Check pixel clock rate, and if it is greater than a
> > > > > certain
> > > > > value,
> > > > > use 2/3 and 3/3.  Otherwise, use 1/3 and 2/3.
> > > > > 3) Always use 2/3 and 3/3.
> > > > 
> > > > Why 2/3 and 3/3 instead of 1/3 and 2/3 ?
> > > 
> > > 2/3 and 3/3 trigger panic signal more easily than 1/3 and 2/3.
> > > 
> > > > 
> > > > Seems like 1/3 and 2/3 provides enough FIFO margin for every
> > > > scenario.
> > > 
> > > I didn't tune the threshold values.  What I was told is that some
> > > usecases suffer from the FIFO underflows with 1/3 and 2/3.  And,
> > > it
> > > appears that FIFO doesn't underflow with 1/2 and 3/4 or 2/3 and
> > > 3/3 in
> > > those usecases.  That's why downstream kernel chooses to use 1/2
> > > and
> > > 3/4 or 2/3 and 3/3.
> > 
> > Hi Liu Marek,
> > 
> > I thought that: If the PANIC is enabled and the pre-configured
> > panic-priority is high enough, nothing should interrupt the LCDIF
> > in
> > panic mode since it has the highest prio? So why does it the
> > downstream
> > kernel configure it differently for different use-cases?
> > 
> > Also IMHO the threshold should be taken wisely to not enter panic
> > mode
> > to early to not block others from the bus e.g. the GPU.
> 
> As far as I understand the PANIC0_THRES, both thresholds are really 
> watermarks in the FIFO, 0=EMPTY, 1/3=LOW, 2/3=HIGH, 3/3=FULL. Under 
> normal conditions, the FIFO is filled above 1/3. When the FIFO fill 
> drops below LOW=1/3, the "PANIC" signal is asserted so the FIFO can
> be 
> refilled faster. When the FIFO fill raises above HIGH=2/3, the
> "PANIC" 
> signal is deasserted so the FIFO refills at normal rate again.
> 
> It seems to me the LOW=1/3 and HIGH=2/3 thresholds are the kind of
> good 
> balance. The LOW=2/3 and HIGH=FULL=3/3 seems like it would keep the 
> "PANIC" signal asserted much longer, which could indeed block others 
> from the bus.
> 
> It also seems to me that tuning these thresholds might be related to 
> some special use-case of the SoC, and it is most likely not just the 
> LCDIF thresholds which have been adjusted in such case, I would
> expect 
> the NOC and GPV NIC priorities to be adjusted at that point too. So 
> unless there are further details for that use-case which justify
> making 
> this somehow configurable, then maybe we should just stick to 1/3
> and 
> 2/3 for now. And once there is a valid use-case which does justify 
> making this configurable, then we can add the DT properties and all.
> 
> What do you think ?

No strong opinion from me on using LOW=1/3 and HIGH=2/3 thresholds for
now if they satisfy all current users of the upstream kernel.  Tuning
them in a certain way will be indeed needed once an usecase comes along
and still suffers from the FIFO underflows with those thresholds.

Regards,
Liu Ying

