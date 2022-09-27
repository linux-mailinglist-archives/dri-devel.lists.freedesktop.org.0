Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8C7E5EBBDD
	for <lists+dri-devel@lfdr.de>; Tue, 27 Sep 2022 09:47:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47DFB10E04B;
	Tue, 27 Sep 2022 07:47:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130055.outbound.protection.outlook.com [40.107.13.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F7D110E04B
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Sep 2022 07:47:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lBgagl1yfL/ebsz8PhwxbJTrOh3a46IG59LC/+JLTAAzHFs/gAozAvvVjrMldctBCkdyDst2i/is1CrX5sGR/sP5jAEwcvhYfs+3UrCOcc6B+TZ8IvgasG54sxh7Ly9cZmJrzSCcYNSBh9XZMPmcUO9m4YzflkXCIANNfL8VTRzo7MrFIhhxQR9UlxichLQK4j6qve3KRS/+NFbV7rApverUSGxt3vnXZq83cTVhul0GXCGhr0SebAIX6pmMUCb/JNvhNkCYTMaVqF+IgCzWjsouix/lOGuaxgf6zkiqTyM3P/pVC6dJ8Tx5BSeE3C3m0EtjWlI0zeF2ndMIUaCfJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RzIVoQAI0D1VBQSNYitcNhHh7frE80tq6Y5aUl/Ku+o=;
 b=k9VfmWJU9Tq2zvj/HywJQJU7hZi3VBwRAJiQk9glCDsTWT0ALwOBkEPGFg0R2jM8hlKFXyqinqjq7fTtzYX9+ElU4HeNyFpQwEEH1g6tdwM6IT9nnVo0w1kdxF107/rIGYrYcK6SnK0V+5u7Nacgp2FOx62lyAF2QmR6ypLhlkz0lA0bWYWuj2ZEIubblIQLYJJUle3QRcVpatcaLCEgf5vhWgB1VvfCu5wjRsnyO5o8C+ATBQ3I/dqqkS43uxK/VIKFCBRUg2JAAbbzkgLjajq65hQwr6Sa+pby6rddyEneFTSKDTl+jyqfYDEAwDmke9LRpvxh7QVY77vYbXY05A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RzIVoQAI0D1VBQSNYitcNhHh7frE80tq6Y5aUl/Ku+o=;
 b=euH9uREffBYR4mcSf+2Qc+iojiKML4aDL/rcxhDbSTMBVTooXw4yt58eSxhz3YPUEdfHEmDdTD44jmgMjj+H3Jx6m9vuWeoHRimq1b+2hxK+9hG/I1+MdpohRKolFpmefDvQDmf0vb5O4qiwlX4Rv6ghxzSlULfpiHH/0py63vI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DBBPR04MB7883.eurprd04.prod.outlook.com (2603:10a6:10:1e9::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.27; Tue, 27 Sep
 2022 07:47:06 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::181b:75f7:dbc8:b4bc]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::181b:75f7:dbc8:b4bc%6]) with mapi id 15.20.5676.015; Tue, 27 Sep 2022
 07:47:06 +0000
Message-ID: <1b1aa20aa3b8f8255fa05d61c7fa094650dee319.camel@nxp.com>
Subject: Re: [PATCH v2] PM: runtime: Return properly from rpm_resume() if
 dev->power.needs_force_resume flag is set
From: Liu Ying <victor.liu@nxp.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 27 Sep 2022 15:46:21 +0800
In-Reply-To: <CAPDyKFr0XjrU_udKoUKQ_q8RWaUkyqL+8fV-7s1CTMqi7u3-Rg@mail.gmail.com>
References: <20220923124904.1373936-1-victor.liu@nxp.com>
 <CAPDyKFqdHX=o4V4K8GdCr4wQ5sjr=JMG6CFAy1849=CtfoSgRQ@mail.gmail.com>
 <75366bfac9fcd4f8c35309193705f0277a164ae4.camel@nxp.com>
 <CAPDyKFr0XjrU_udKoUKQ_q8RWaUkyqL+8fV-7s1CTMqi7u3-Rg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4-0ubuntu1 
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR02CA0081.apcprd02.prod.outlook.com
 (2603:1096:4:90::21) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DBBPR04MB7883:EE_
X-MS-Office365-Filtering-Correlation-Id: 441cfa2c-e138-4bd0-e65a-08daa05c7965
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fjFeyAJluujwptFHVFSZhbgYP8ipgZbff7px41dMZTYw4ry4H68IxB4lGAG2v1yPS9qXekC8xQpKZeBxs0nKGar51ehCQocz3bT8aGgM4fg+Agw9fpV5qYaE5yG+YtfvQYIiy2RRnmDMBC/Hxyd5pejjjobxqxdTTUv8vu2ho6oUUiojjmw0p1SwTtsoUpyh0cFKh9HyM2fEZCPAZBuVYZvDsfzQ0dP49r6h+S2pKZL1JG6JKWoZt3igExPcLdluZgNQTzH5K2I3F7wzQiD6ysKYxxoIEWkqlT/R0peWNW50+uB8y26yXpzrxyU+CBIUsRfeUcByVOk3Oh+/zw3SmVaCe0kjc1Nq/FtkltYuaaPHYjvKrFFtNb9ojod8FB6Pv4MQDhwkVrKhfoIvnCKPLCT/HDGVln76e8mvDJzdihONI1jaVZK6GApWp9H+QST7YGB051cNWJqrXJ+1w6La+R1cfvxeznOnZhCG4w7Arh+BGIL2mc3PBNf74TT2Afm2pTTHRRzQePy4l3SzT4/lbtHBKtR1+zfbvqzYg3SJKnPYoe8DgDZZGIXnI59MaBwVB446SqdSt8cH4dDOLDMA34TD5RViWuZizmzWEUWa25aOJbYXVdUsTslTyx4J3+eYOnQCteIp5i+WmeCGCir1ycmycwU1E25mjR+5eHJ3VsptLuZgk3jS8eCqmui2Hqlbs7xD04BNqSNqAshO07m2QtHe3z31ArdBiZRjIgXsk7pWQdHLlHltjjyb/4e9O3UI
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(136003)(366004)(39860400002)(396003)(376002)(451199015)(2906002)(8936002)(66476007)(66946007)(66556008)(36756003)(5660300002)(38100700002)(4326008)(8676002)(41300700001)(54906003)(6916009)(38350700002)(316002)(86362001)(478600001)(6486002)(6506007)(6666004)(52116002)(2616005)(186003)(83380400001)(26005)(6512007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YytERnhKQzJCNzIzbHdMM09JbjNkTHVob05GU3NIemxmQVN3NWplY0ptV3Ay?=
 =?utf-8?B?UmF1bEZDNWJqR2NteTR4R2FwbUlNS3ZGNytpK1BKZWJUWTVGcEdYdkQyWVVR?=
 =?utf-8?B?bzNlREdBbVpSTUVJR3V4dkVPVng0YlhFb2xnZXdGekhrcWRTSGNTMFZSS2Nk?=
 =?utf-8?B?RitraHM1QjFKM1lFbzlDc08vY3lad051YVJCN2s1VzVsTGpuWEtDcHJ0S3VP?=
 =?utf-8?B?QVhyZXZKOTBIaHdHMTg3U3U4WHM0bGZJclNRV01RVXFXZEo5V1l5MElYN1VD?=
 =?utf-8?B?VFR5aGZFZnMyUHpybGZPYjJpOERyTTd2UmtJRmhYajQ5bzFBNEhiVmxMdmFM?=
 =?utf-8?B?UzFDb29WaWd1TVc0UGpxTStJZk5VMFFVNUxqR1JpVXQrR0pJamNQMEwzbkx4?=
 =?utf-8?B?WVF0cnFacUpYbElvTTVxek8wYVBCRERZTVU3R1NWTU1kajJMb0RsdXFsaXdY?=
 =?utf-8?B?SE8zMUg2dmJMRU80QVAxQXZERGZLL3pNMDZydSs5QXYwNXllVHZBYjdyaXlY?=
 =?utf-8?B?R3EyMXFyR0NQaW9HTkVHZnJ2YldrdDRqeFd1T3k4b1UxWlo2NGdOTit5SVU3?=
 =?utf-8?B?OC9GVjlydUQ4Ujl3bG8xVzBCNnRaUFB4eG5GTW5sNzl2MHpwb3dQdy8yMEVj?=
 =?utf-8?B?VGVna2VPdEZjcTVwbWQxazdPTzVseGI2TDFDTkl5NzlrSC9pMytXbkVwUWdI?=
 =?utf-8?B?Smhkd1RKczlBc3Z5ZjFQS05BblBoVi9sMGZBU2RxTTFqY2orNUhCWDgvb0wx?=
 =?utf-8?B?bFEzamQrRTVIdS9PVWxyVFVmMkdxZ0h0Z08zQVFvaDAyTU9JTDgrYUErdTQ3?=
 =?utf-8?B?MGlWUkdZdlY3bTErK0t3enVPMUQ2ZnJ2K3lPcld2UTRXblpGRzdSbU1KSzRC?=
 =?utf-8?B?MGJ1VjhtRnhjWWVCa2tMbXd6dExKeVU2SHZKaG4rcjBVeHpTd3BDV2pvSlNu?=
 =?utf-8?B?dlRjNHlXUjN6R3lRaDNrYnF0UFMrQi9tcVdId2xjd0N5clNFN3hQV2IzN3J5?=
 =?utf-8?B?QW5HcTFJc09qdVBpbjNJLzV4cVlNeFRLb0xZOWk1b2JvRnMwOXNHQmhtaXho?=
 =?utf-8?B?S2xKRTAwdVlUVzljbFpBUkNudmFhcVZ3WTZVb1BmWGRPcy9kWG5ZbzVGL0pk?=
 =?utf-8?B?cnhpZm5Yd2dBL2ErcVE0c3NyanZzcDIxVXBwMjlyMUU3U3JFVEpZM3daSzdt?=
 =?utf-8?B?OVNienoyRHEzNkVxNHJmYlhPMEQ4dG5QNG5YSm51MEl0QjBSTElXZjRwSzFB?=
 =?utf-8?B?RU9ZM3YvOGg5UllMSmVVVXhuRVBvbWJDQSt6TDRqcUlicnNNREVJbCtScnJH?=
 =?utf-8?B?L3hwUHUwQ3pXMU5SaVB0T1FoSjVJOXhjVXJvMmxjcG0zUXAwa1lHeGpuVkYx?=
 =?utf-8?B?dkczc1RRVUx2cERQNU9xYUhuWEpqbW9naU1KSW5WSnYxQTBmRjBDL3dkZ21w?=
 =?utf-8?B?ZDZQaG1SeWNzZVVBWnE5K3VCWEIycS9qdXVTcGZ4OWd5OSt0elNEeWtvUFlk?=
 =?utf-8?B?VEhFak53enVaL0hTeU1remhNWHVMeHdJS0dDMy9Zc3o1TStJWExHZHAzeDI3?=
 =?utf-8?B?RzA4QXkyaWl3RVlCcDFnbTFqMWpKMzh0Z2JGWnAxMDgwMk82OGFuQWd0QkdT?=
 =?utf-8?B?ZjZ2VVZCTE1xZXdqU2UvM1QxTjlzRFhtSmdEMk9UbU44eW15WHN6Y2NiSTB4?=
 =?utf-8?B?R0V2WFVrUTdMZUFWM1Z3WGFnNXUxb0RZd2dab0o5UCt3UDdRSmMzM095dVB4?=
 =?utf-8?B?T3p2dGpTbVNrV3IweU9rdm5EWWJKRndPcVgzcktQUHNaOXQ3bURDRWZrUmZa?=
 =?utf-8?B?SVJYWGxRNkhFdC9OQURSVlJaUVFrQ2xoZE1hMGhyWVRaT0xST01wQlFjd08v?=
 =?utf-8?B?VFJBMUczalZjT1gzYUFOakh6UTdTaGVUUHc2RzhiSVU3eU42cjUwR0h3UVl4?=
 =?utf-8?B?T2JOS2pTWFc5Z0hSblA1c0lYK1dEK3Mzd3FXT0g2Tnh1QUFxUTRRSXZzNnEv?=
 =?utf-8?B?L1N3Q1pPTFN5ckR3bkpZWE16MGs4MkkxQnlWL1hvaWk0WWtWL3lUeSsrczla?=
 =?utf-8?B?ZnliTGFUQThWOFptMVhqWUQzNHRKRnhYaGlzK0pPTDEwT2FnY1FkZWhON29S?=
 =?utf-8?Q?siDlRJo8kX93U/x0iI660e4tD?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 441cfa2c-e138-4bd0-e65a-08daa05c7965
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2022 07:47:06.2846 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MtqGZngmktlGCEB6fii5tTxeim4CCFv9FAbzUFRzZpMYJzfdqyQ2ezpwt2IvmpwNdloAGYPwqBvwQ4d0EwlyoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7883
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
Cc: Len Brown <len.brown@intel.com>, "Rafael J . Wysocki" <rafael@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-imx@nxp.com, Pavel Machek <pavel@ucw.cz>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 2022-09-26 at 11:47 +0200, Ulf Hansson wrote:
> On Fri, 23 Sept 2022 at 17:23, Liu Ying <victor.liu@nxp.com> wrote:
> > On Fri, 2022-09-23 at 15:48 +0200, Ulf Hansson wrote:
> > > On Fri, 23 Sept 2022 at 14:47, Liu Ying <victor.liu@nxp.com> wrote:
> > > > After a device transitions to sleep state through it's system
> > > > suspend
> > > > callback pm_runtime_force_suspend(), the device's driver may still
> > > > try
> > > > to do runtime PM for the device(runtime suspend first and then
> > > > runtime
> > > > resume) although runtime PM is disabled by that callback.  The
> > > > runtime
> > > > PM operations would not touch the device effectively and the device
> > > > is
> > > > assumed to be resumed through it's system resume callback
> > > > pm_runtime_force_resume().
> > > 
> > > This sounds like a fragile use case to me. In principle you want to
> > > allow the device to be runtime resumed/suspended, after the device
> > > has
> > > already been put into a low power state through the regular system
> > > suspend callback. Normally it seems better to prevent this from
> > > happening, completely.
> > 
> > Not sure if we really may prevent this from happening completely.
> > 
> > > That said, in this case, I wonder if a better option would be to
> > > point
> > > ->suspend_late() to pm_runtime_force_suspend() and ->resume_early()
> > > to
> > > pm_runtime_force_resume(), rather than using the regular
> > > ->suspend|resume() callbacks. This should avoid the problem, I think,
> > > no?
> > 
> > I thought about this and it actually works for my particular
> > panel-simple case.  What worries me is that the device(DRM device in my
> > case) which triggers the runtime PM operations may also use
> > ->suspend_late/resume_early() callbacks for whatever reasons, hence no
> > fixed order to suspend/resume the two devices(like panel device and DRM
> > device).
> > 
> > Also, not sure if there is any sequence issue by using the
> > ->suspend_late/resume_early() callbacks in the panel-simple driver,
> > since it's written for quite a few display panels which may work with
> > various DRM devices - don't want to break any of them.
> 
> What you are describing here, is the classical problem we have with
> suspend/resume ordering of devices.
> 
> There are in principle two ways to solve this.
> 1. If it makes sense, the devices might be assigned as parent/child.
> 2. If it's more a consumer/supplier thing, we can add a device-link
> between them.

I thought about the two ways for my particular panel-simple case and
the first impression is that it's not straightforward to use them. For
DSI panels(with DRM_MODE_CONNECTOR_DSI connector type), it looks like
panel device's parent is DSI host device(set in mipi_dsi_device_alloc()
). For other types of panels, like DPI panels, many show up in device
tree as child-node of root node and connect a display controller or a
display bridge through OF graph.  Seems that DRM architecture level
lacks some sort of glue code to use the two ways.

Regards,
Liu Ying 

> 
> In this way, the PM core can guarantee that the order becomes correct.
> 
> Kind regards
> Uffe

