Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E2A958FEE
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2024 23:49:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 946DF10E4E5;
	Tue, 20 Aug 2024 21:49:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y5FmP9JQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86CA810E4E5;
 Tue, 20 Aug 2024 21:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724190574; x=1755726574;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=9NR6jls6UcI744v7uwRWR88izwhRvpMZS7yXW0O0AMA=;
 b=Y5FmP9JQicV9pm9OAVKdz8v7JND8w/wfjiAj/55h073KM5q8uokeM6Se
 WcnIs07C1Bb4+nSZCxOJs2YoKhr3ai48AFnJGZOS/E/u3Nc+jiyRS8aFB
 jFuhOKYZ9Ircc4gJfjHtUvhuvXyc7czGIhnyumPc1PWfkeNoVKdoZmDmH
 yLt0XGT/o55qAPfS23y5izQmaSk9wCzDYWD+M4/sytT4XVi9jX0ExbbUV
 3yhea2KBkP95Jt/IDs+HVqL3a2cYIp72dm1IUuyAMqKUel9oRo8qoQ3Yk
 KHo7FroiFZmTYDqa92Te41iEfY/1ZYh8PsLgaN8X12hGrKYf0QGtag7Ww w==;
X-CSE-ConnectionGUID: X6oiYdp+S6ycO/cVwfQRtw==
X-CSE-MsgGUID: 8N2rn3RtSoqe1HAOVR5Fng==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="26322522"
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; d="scan'208";a="26322522"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 14:49:34 -0700
X-CSE-ConnectionGUID: TVCRPFzNTY+KgCTI310KNg==
X-CSE-MsgGUID: OoS3Vu+nTpCr2tOJ5FCF9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; d="scan'208";a="60575002"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Aug 2024 14:49:33 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 20 Aug 2024 14:49:32 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 20 Aug 2024 14:49:32 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 20 Aug 2024 14:49:32 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 20 Aug 2024 14:49:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=enBVk9zYbptuql9W5tsNT2LsZadDb91W72LgUEwdO4xtEdyr6a+02Y0IGF7GZUy1tUburaW8U9GNewB24Mb602VCKFevA4lGtEP6Ua0VDJdqlafe7Nq+zrWwFbskcdAPMvupDhpEYLA1/69k3/r4320JzCH3fcYuCB9Bjw/hnstJSr+ylqlHbrVVGNjMKaBccyUGrxfO/GLOfsifTknsTznFRpzVBrtvV7DkWjuVYGnCIZ2ly48xZrEzhOaacW7YZFGYhcTJ/bAYZhBHfvxMkvExUka7txBJiQF2LkBzUAGNJhsbuEEH/XmUUkHXIs9HM5fRMcbBTn85p7nPDWlr7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jg9/bNMVm2bEQTQgS+eSSzEiBACi1eDmxUc5f7ktVns=;
 b=e0mNbVqd5tBmmdg1k2z+6FkpDiFI1ah68r2si8bwZnI1KYYoQcOBrU0RXHJdrRSI7Xxer/vxc5TZBJu7JdwWMXlw2Be2Yeeyfvh1j+OHOfD2Je/CYT4ql3E/fPWenublpaxoxlxw/EYc7sJeuzFtFzyJDCILXF0JpE0UPn1xV2QF2xwvDqc2wWPeRwuYz0ZdiATXvdV7USN3NEhoIaASji9DB7j5V99QGxdRJZ8OM3Sy9oMRPTDXx4E4fVU47/ytVbeBxTyEO6wk76mr1AUymwSW5nyA1eOkE2aMbKr6ykVYdi3R+r0B42FlvYgxZPe6wBDGTR8hAsSLl9hKBThtAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by MW4PR11MB6668.namprd11.prod.outlook.com (2603:10b6:303:1e9::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.16; Tue, 20 Aug
 2024 21:49:30 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7875.019; Tue, 20 Aug 2024
 21:49:30 +0000
Date: Tue, 20 Aug 2024 17:49:23 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: Andi Shyti <andi.shyti@linux.intel.com>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, <jani.nikula@linux.intel.com>,
 <joonas.lahtinen@linux.intel.com>, <tursulin@ursulin.net>,
 <airlied@gmail.com>, <daniel@ffwll.ch>, <linux@roeck-us.net>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-hwmon@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <riana.tauro@intel.com>, <ashutosh.dixit@intel.com>,
 <karthik.poosa@intel.com>
Subject: Re: [PATCH v4] drm/i915/hwmon: expose fan speed
Message-ID: <ZsUPY4zJwEGAf_t_@intel.com>
References: <20240809061525.1368153-1-raag.jadav@intel.com>
 <ZrYB-GI9L2RSc2bt@smile.fi.intel.com>
 <ZrYEQqs0IwDHWkGx@ashyti-mobl2.lan>
 <ZsRbK8TEk5GZDl0C@black.fi.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZsRbK8TEk5GZDl0C@black.fi.intel.com>
X-ClientProxiedBy: SJ0PR13CA0088.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::33) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|MW4PR11MB6668:EE_
X-MS-Office365-Filtering-Correlation-Id: 76a66afe-ad20-4da0-a8e2-08dcc161f80f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?BCax6f31Y65N+FXGSuL0upSQaJh8LZ7Ae/tLNnhrK1ddjrM/nPtq4hjqZGmF?=
 =?us-ascii?Q?hqRDJEQvrZF9vdu2PeGurRR3m3lTVDc4QUwSgD+jBpT5K7oQBFS++YyVO70l?=
 =?us-ascii?Q?8PSOjNpo/qjgQ2/3vGNJVTYWw11t9PLzzbNNjGHWseAej/KpFvZyNeZyrnL+?=
 =?us-ascii?Q?q3FLm7h81VlFzk+49WPAyLLMRRmcDjOESTKInqEIfdu4JL0zUW2d7ht5ZPGv?=
 =?us-ascii?Q?I7B9rEc92KffbET1+yR91wWqAqmgpwcyu2YShdhrA5OumGwM47D7PNgC9nBE?=
 =?us-ascii?Q?hxiBoUdMSABXKrlwP3fp0va/BZ+bQe4yTCc5A/l8e/iLjIgk5ZEsp149MHr+?=
 =?us-ascii?Q?+rJlXKbn+YgdJ2WoPBx3e2W/cYWgqn2DUHAUvVI/NG4RQfvkHauyEtfOZPpa?=
 =?us-ascii?Q?N9X7gpVUT1cZW8faJ0O79W5mXxZxhUSOAUUj/meqNY1siWTkuDxz8P57+6YH?=
 =?us-ascii?Q?O+jepjEuMe8H2UAFVt0CG03a1TLtnTyapTDNhbKopFkEovzJGQ7spkDunh6K?=
 =?us-ascii?Q?Ajx7/M5De8RxKkjuvV4T7FFYoCtgSOlAnwUMVALM/7FNWGRH8WjVD/DQYWRO?=
 =?us-ascii?Q?cYLVFzDYb/d5sAlyp2EDTdhLccygavvf3SpcwS2lZ5Nqg+MDvQPKdSnLtlTq?=
 =?us-ascii?Q?vLDxp8Efy72k3jXGn5vIhu2cj7b+gXpvRIVkp4ibwDtador+aE2YNNlSXYuM?=
 =?us-ascii?Q?YFP8qtyBZMBuzqTUTLYNFslj7Oj5uARsdkw4D6SgyGJgmFk3z+h8rywQgcJR?=
 =?us-ascii?Q?FkjDpquWyK3XN2R/qws9HI1aSKfo/xiDDoJBRnL0z/OcJNSR1VPKgAI76Nod?=
 =?us-ascii?Q?rlhsx4aZyhOgwnXU6s16hSPatj016T6qmE32sZWFdOoK7ksgdU1Ibv6lSmID?=
 =?us-ascii?Q?DYibx/EhzjB6frN2wA849GJm8G3+E8Wr+XxekpPeoKBdTwuQDBq446I/R7ou?=
 =?us-ascii?Q?LAlFw2Lm85svJVaPlgzZNpVEX8MG3eaopC5l3lMqAv1nk/cH0eXCKJMVlolw?=
 =?us-ascii?Q?t09DNGjh7xCWTHEijA83cngKqgaX1m/V/w28Lc90jUh14fyRnRDX1r9hFPAQ?=
 =?us-ascii?Q?BTGCXnsUqFKZ76zSV0PBbGlJxJSP7MKvSF5+QND62+n1ih5o037kG5V7zLY0?=
 =?us-ascii?Q?q6MLVRKnsGPKS3o/BJIYCvRQVp/dM+WXwV2ZtaYgWUfmrPneVEnKUcPR06zv?=
 =?us-ascii?Q?3MpCk5Rz8ctQVm4sS3UiReUPHwsk7gTOF3K1GCXSOgf+T8raoUIIcQQWXhvv?=
 =?us-ascii?Q?bS3rF0SKMIxTJ7uIJz85hgb/ffes0GpMOmPyK1qm+nngmiqftdIce8N9ote7?=
 =?us-ascii?Q?3+IiWkip4d/BRV6KifgVKxY1ojVFd2M8eusX56YutG1Kbw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Am2ommanRBqjEZbDhK0LUGgxPTcQGWyiZDSJUdNwGrIt/exbNVRGHLPaXmtl?=
 =?us-ascii?Q?HYckP0DKwMn5VvuABMKqmA/B9yo2pyZ6kqXb6ahXfr76OruRQbHopJuGxlLH?=
 =?us-ascii?Q?pmObiuMQMaiGTE1FGAbtF74p8QkcmCdyqoW9IPq5MPzhGLdU7VRqyoWOGUOx?=
 =?us-ascii?Q?vCcRTBOkRM3/dcWunCYA2hE/i3ZSl0YAZDNhxn2IeFCJwJL41MlN3pATsBn7?=
 =?us-ascii?Q?dqdYS+DeVW6hltjT+lB/6yynZhSBlGwI99YVTBjMiQ5m3Lf5ZglIoo3i3m1a?=
 =?us-ascii?Q?tK6HC5GVz/OXu4q+w1Eniv2+puoXSK/L4Y2xHblNaV4DGj4KEZx09w/vCEx9?=
 =?us-ascii?Q?ACAR53xjXvKYeYJGITiGAHB60/VnFiXsZrnHcxAnBAwh7yYwX2TMZz7zqBxb?=
 =?us-ascii?Q?IHXESHpXmIBSM9+SWjgI3oWWcRE8aiNCiv6MQ7Y1aPCT7ifJniJy7N7f/Zh1?=
 =?us-ascii?Q?oLxtCFZjORmT1BWkRNxeDwXneep6CVYjrwVt0Ko/jj86xuUZczoLzKP2dbfh?=
 =?us-ascii?Q?TbuQX2h/924EX8rnpK2iQqnHHdgNOow/nQ6hmaNTEQXGRGd10G4fzFFQrioa?=
 =?us-ascii?Q?YHstYSoCSqi4SShhvwUXT9XuJVRTBdpth46rCyNps+/g/CF2/SR0/WOhY4uO?=
 =?us-ascii?Q?UlHM9Gq4VAF+SCJJ/lIw/uQiSaU9r7YaVqDbvdgYC02es9eJ1X/lsQo10D7c?=
 =?us-ascii?Q?Tm/+9Qco14fRm4GEM7G7LiQO2FBzQZD8YX49Qkqcoe9z89LDJoeASfitK5oD?=
 =?us-ascii?Q?tJvzWu8otD102ZHftsp/ZCFil+jlk74rD0ycDEx0qqBpA7EjUtk8Uk2nSRji?=
 =?us-ascii?Q?YuSfgzAdRO0swqVBR8wRBtheTqVT37yfnmMp7+0tOb/Z0J7CP4Zs3zqRYSx/?=
 =?us-ascii?Q?5m07sBx6QXG7UNMizQK93wnCFTB4LRlYUbkj9IbMCtKN4W22YJX3piq44g0G?=
 =?us-ascii?Q?T+zh9DTiRqajhu7Q/7j3kHCr933N+aTwqiSMm8zEALtjZATyC0vqqdHwpW16?=
 =?us-ascii?Q?GOjcDlOe99jDzmTGruIiTGTdYnjl4eIpWH/MN7pF48cysEZSqwvKjDHhRJOe?=
 =?us-ascii?Q?XITlxhlUZXf9Pj0voq6slWKbQetUk2MmgGYnMD+A5jrYT02nmERBxZBpoUHm?=
 =?us-ascii?Q?lbDn7icDDHTNlRXNuOpHAkPVD0k35pteebtDwiH9NsTZWS875fRAHYI0EcVx?=
 =?us-ascii?Q?5fyiY1xCBwdBBuZpmA+SGHK+zRss/iqzN3KTgoeggeJGzKDX8ONUxiK6lKiH?=
 =?us-ascii?Q?iUQvOxM0JNprAFVFfzKM+r9Vl1UAXFKDbqtFac5k1NBPFnh49NImGwNOasPa?=
 =?us-ascii?Q?SjUyaf7+LjDrfOx+j1zXI4MhepWt6Aqj5Al/kZxe3ckFkYo5Mbn212pATALG?=
 =?us-ascii?Q?Mxr+0aHl15gKxHCwwVF1BRCwhOPFAZirFxyIOF6Ds3syKupw4gVELi7uQyjW?=
 =?us-ascii?Q?FTQvnE/4+nb2m9RipBoeEK1OZTRtzy6CPqtx+qm+H0nci8iq066n1Q3sG6nP?=
 =?us-ascii?Q?cYYgQZStUxkSyNuiTfwXX4ddy49vEsqQiP0UQYl6rjjUKS9cO28wNvAWqYMs?=
 =?us-ascii?Q?QWv+1x3hvOF9TtAJuS4L+OAOoNVWMAqPQ6DpbB15PXF1RZA9zRzHQuj85ATa?=
 =?us-ascii?Q?dA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 76a66afe-ad20-4da0-a8e2-08dcc161f80f
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2024 21:49:30.1591 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SuVSMPmGvn3HQsfLd9ZILFhEhPp607KZb3ONTXknr9DDomf7wJSjtC564BzRfvahVa394BmJEf3xM5hXP9NHoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6668
X-OriginatorOrg: intel.com
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 20, 2024 at 12:00:27PM +0300, Raag Jadav wrote:
> On Fri, Aug 09, 2024 at 12:57:54PM +0100, Andi Shyti wrote:
> > On Fri, Aug 09, 2024 at 02:48:08PM +0300, Andy Shevchenko wrote:
> > > On Fri, Aug 09, 2024 at 11:45:25AM +0530, Raag Jadav wrote:
> > > > Add hwmon support for fan1_input attribute, which will expose fan speed
> > > > in RPM. With this in place we can monitor fan speed using lm-sensors tool.
> > > > 
> > > > $ sensors
> > > > i915-pci-0300
> > > > Adapter: PCI adapter
> > > > in0:         653.00 mV
> > > > fan1:        3833 RPM
> > > > power1:           N/A  (max =  43.00 W)
> > > > energy1:      32.02 kJ
> > > 
> > > > v2:
> > > > - Add mutex protection
> > > > - Handle overflow
> > > > - Add ABI documentation
> > > > - Aesthetic adjustments (Riana)
> > > > 
> > > > v3:
> > > > - Declare rotations as "long" and drop redundant casting
> > > > - Change date and version in ABI documentation
> > > > - Add commenter name in changelog (Riana)
> > > > 
> > > > v4:
> > > > - Fix wakeref leak
> > > > - Drop switch case and simplify hwm_fan_xx() (Andi)
> > > 
> > > I do not understand why we pollute Git history with changelogs, but it's
> > > probably the ugly atavism in DRM workflow.
> > 
> > I never liked it! Besides it should even be against the
> > submitting patches recommendation.
> > 
> > I don't understand what interest might have someone in a couple
> > of years, reading this commit, knowing an unintellegible list of
> > differences between v2 and v3.
> > 
> > I consider it a random pollution of the commit log.

I agree it is ugly. But I don't agree it is just a 'random polution'.

I consider a valid and very useful information of the patch history.
Very useful for a later cross check to know what exactly version
of that patch got merged.
Useful for distros on backports as well.

> 
> Isn't it already documented?
> Documentation/process/submitting-patches.rst

I think it is:

"Be sure to tell the reviewers what changes you are making and to thank them
 for their time.  Code review is a tiring and time-consuming process, and
 reviewers sometimes get grumpy.  Even in that case, though, respond
 politely and address the problems they have pointed out.  When sending a next
 version, add a ``patch changelog`` to the cover letter or to individual patches
 explaining difference against previous submission
"

Then:

'''
Example of a patch submitted by the From: author::
'''

defines 'changelog' as the block above the signatures.

And

'The canonical patch format'

also tells that anything after '---' marker line is for
"Any additional comments not suitable for the changelog."

But well, the important part is to have the version information
available for reviewers. Let's try to focus on that instead on
visual preferences.

> 
> Please put this information **after** the ``---`` line which separates
> the changelog from the rest of the patch. The version information is
> not part of the changelog which gets committed to the git tree. It is
> additional information for the reviewers. If it's placed above the
> commit tags, it needs manual interaction to remove it. If it is below
> the separator line, it gets automatically stripped off when applying the
> patch::
> 
>   <commit message>
>   ...
>   Signed-off-by: Author <author@mail>
>   ---
>   V2 -> V3: Removed redundant helper function
>   V1 -> V2: Cleaned up coding style and addressed review comments
> 
>   path/to/file | 5+++--
>   ...
> 
> Raag
> > 
> > Andi
