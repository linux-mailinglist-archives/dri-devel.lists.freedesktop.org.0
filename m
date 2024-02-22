Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD08F860085
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 19:12:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECCAC10E9E3;
	Thu, 22 Feb 2024 18:12:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="crlMy4HE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2559110E9E3
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Feb 2024 18:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708625536; x=1740161536;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=iMurjRDwKL2khcJXIv6Hu6VAyUDtt8ajcPCQ/EA99fc=;
 b=crlMy4HEoz+dh/InQPT1pt3iBc+T0j8aygVaXrb78Fn0MJ98xA3tNGsB
 +1R11ASWnPVg0x3gPNE5BSGFj6hMVYrbh6zF7Cr5kYW0WZ/XROdUJNuTa
 KCzICCYuPH0kdOHgV3MsU31mLwL2O2hnIpWNLAhX3+h/ZinjQ9XnkSUFe
 4Un6eYOl9WPQOTz9Xxmc+fexuvDmsA9I7UJucG7iMkZuAo9QAgKdxXdtQ
 KDgvAw6zYz4y7gBiS5MBx3dSlf7fta4OkwUs2Is3IwCat5j5GxDmPXp0U
 OfW6hLOwyK40f87XR10UJhRptm5vVSt3COXyKs/ENuv2+PyXBzNNMCErz A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="2755243"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="2755243"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2024 10:11:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="5968699"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Feb 2024 10:11:41 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 22 Feb 2024 10:11:41 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 22 Feb 2024 10:11:40 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 22 Feb 2024 10:11:40 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 22 Feb 2024 10:11:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HtPCKIVpqs5QtN9tmk6CMgo6o9jPe+XaJ4o/w4IVRBhVewgpWl8JKVjVY6+bJjYiC0xA4YGvkOxmcM1QuErgX6lCrvgYUum1UHAJ675Ye3A20jGJ3hS109aEEbtk3RZHQ+88U4US+NQ82ThR/CTa/8yazuO3m6jyXksJr0qcRc0WKIp3KAhl33DLbDo0K4A0lUoTPx3jlGLze8Zbw1uuGzg9ccdTQrJv1OGatz4Tr7KrhYxpy+hiIkF0QQ8PvgOgd18n6KuOU1+TB7cS8RRO/z2qmXwba3ZKJxhge+yKRIfeZ1iD5SsPCsz3l4bNB76yolJWzq2El7d3Hv7inTT9xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0y0o/7PpYe7LT++swsBHOLYRlS8dTSN1qhxhBYTobD8=;
 b=lB/FiswbECyvvTYqBmgWwGUAZNwPhu1bgo1t2Lg2LloKtBT+Knv4w2q61C201ty/qJcHddnuHVXnvUvC8O73IIhT3BQiKZ4C+ukeJ6UXkIWDP1DSn0qf5vujbtQDhTYUW8OoBwQM0+CSPRVTqzTwxEB0Pmx8CKiW/vasCRuu8ErwcNcuR4jHF1JBnXO6wNdJ29EWxqIBvdWQP5rojphbHlIvk7OiKLnhjczAuKBWAn13io3sltGH0avoW6m5z/UIUit1C+z8sjooFfeHtBXlmC3DSaib5wTJV+17UKCTRzduD7+kPEqQ2lhzOZWY42TkfADeO3iiFw09WU9QlKdeyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by CH3PR11MB8188.namprd11.prod.outlook.com (2603:10b6:610:15e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.10; Thu, 22 Feb
 2024 18:11:37 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::da43:97f6:814c:4dc]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::da43:97f6:814c:4dc%7]) with mapi id 15.20.7316.018; Thu, 22 Feb 2024
 18:11:37 +0000
Date: Thu, 22 Feb 2024 10:11:33 -0800
From: Dan Williams <dan.j.williams@intel.com>
To: Dave Jiang <dave.jiang@intel.com>, Marek =?iso-8859-1?Q?Beh=FAn?=
 <kabel@kernel.org>, <linux-kernel@vger.kernel.org>, Hans de Goede
 <hdegoede@redhat.com>, Matti Vaittinen <mazziesaccount@gmail.com>
CC: Horia =?utf-8?Q?Geant=C4=83?= <horia.geanta@nxp.com>, Pankaj Gupta
 <pankaj.gupta@nxp.com>, Gaurav Jain <gaurav.jain@nxp.com>, Herbert Xu
 <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>,
 Davidlohr Bueso <dave@stgolabs.net>, Jonathan Cameron
 <jonathan.cameron@huawei.com>, Alison Schofield <alison.schofield@intel.com>, 
 Vishal Verma <vishal.l.verma@intel.com>, Ira Weiny <ira.weiny@intel.com>, Dan
 Williams <dan.j.williams@intel.com>, Bamvor Jian Zhang <bamv2005@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, "Bartosz Golaszewski"
 <brgl@bgdev.pl>, Douglas Anderson <dianders@chromium.org>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, Robert
 Foss <rfoss@kernel.org>, "Laurent Pinchart"
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, James Seo <james@equiv.tech>, Jean Delvare
 <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 <linux-crypto@vger.kernel.org>, <linux-cxl@vger.kernel.org>,
 <linux-gpio@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH 2/2] devm-helpers: Add resource managed version of
 debugfs directory create function
Message-ID: <65d78e55844c1_1ee312946a@dwillia2-mobl3.amr.corp.intel.com.notmuch>
References: <20240222145838.12916-1-kabel@kernel.org>
 <20240222145838.12916-2-kabel@kernel.org>
 <23c50406-7ebd-4cc3-a978-1b8a5fc71ff0@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <23c50406-7ebd-4cc3-a978-1b8a5fc71ff0@intel.com>
X-ClientProxiedBy: MW2PR2101CA0029.namprd21.prod.outlook.com
 (2603:10b6:302:1::42) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|CH3PR11MB8188:EE_
X-MS-Office365-Filtering-Correlation-Id: 29bf8a99-970b-4042-3288-08dc33d1b5e1
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ftz9W3VPdH+jpRS9vYTBUNXGQKNDLOv8KkdeRN1WOuDkX0N7giUXLPVKTKy32AEYRRUlNQ6iklEvsMT/3UUUlAUk2bAMjU395u93+nL1gPK2FBYybxYlc033VH8I7bfcg3T981A3THMaCWj+N4CZeidmlX1l2ohJO+dzIWH+89/luG5HneLxPCRzWf65vTFi+xlMMm6bzpXkh49Q28mB1ffR4BvQ6aITcpeHX3v5msYXv5NV9weq0UWdbeHL2ySFbCYHlglszfm6FJ+TontpUweZ0M+DQGccg2L9rYGd9LIdnQdfrd+apwMmZN/XyWarxV2JJd60CcNDY6jcrDzW8GApB6u9IqjBOi3vd0dLD+7LhbGBddoQcgUfvz86IIx8k/ZCrF4WZonNtO/L0ev5VQjkqL0fUHKsqXDLzcR6IX9nrjMzIGSICwedP5kXktHdbs9MeJqzl8cFeYMWP6NwQ4y13K0ntelWaCVZ2wn+CjY21bnoucujyYVfiwxMzgDqjFtAZMlh5jTd0F7CtANpvtmB8XoOteB9TCXTsCPPir8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8107.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?93818D7gR779UFcAWPmU8kf8/J6D1tPvNyBwSFNgRrvF+rzeSsNfplb+5V?=
 =?iso-8859-1?Q?js8Qai8ixLXQfd4p13d4Lgzlx8h+bVtqbi1AFYHxxJTwp7F1tymUB8FdaC?=
 =?iso-8859-1?Q?jyRO9x9NhpbCD+neRhbwlRFfpkgMA8vsT1pyKpsSRo6zhbBw2XeD/T+6PX?=
 =?iso-8859-1?Q?8bxcJ+wPRNmcHqGh1R75QHkpm0LQDsb3Y84pb4LeSVQ04uU+UqcfJ8FME+?=
 =?iso-8859-1?Q?RnuBhXkwSklFIdt0+SJtzjSTdFbSpPVLu8tZCQyUrUM8rIcBOf+l2GABCy?=
 =?iso-8859-1?Q?PAcDSrlBWsvUGh9RslEyQNRrIpUo4nuD46dzwW3RhVLIvbgrgsQ++d9qqq?=
 =?iso-8859-1?Q?VjCVz0Yj2Qig/fnl7mSaqtpHwydzTI6fBWNljNhMUgRnclgdXLVvbHYdrO?=
 =?iso-8859-1?Q?6DNSswdOL+u8D/6YVpCc1PUPjAnu8s4dQm+D2PTAGT+QE7U8OOaeMBWuyg?=
 =?iso-8859-1?Q?DImfC+ZTZQOuh0L/XTL2+lq9bbz3c7IGJWghzTc4JYZevfxvU8O7I//m0J?=
 =?iso-8859-1?Q?H68UkovCcbVoolfcEfN4ONrk0bMfu/igg9guBwNwEjsjKVJxSXgjd3+xue?=
 =?iso-8859-1?Q?0kwLRCwtHp2tfGjuJNFCIOKdOyTeUzBcOE4jcvXaX1UxPPBniyWz/rjCdS?=
 =?iso-8859-1?Q?VehhrcLVB9vZntKhaHKIWBEeBMPfNGV1sWaplRHz2cFFjnrhEB70r1d4BY?=
 =?iso-8859-1?Q?fjSY6GVpdJnuuyNdTpW70VkzXe0ISxYMGhXDNtSKlpK3YSmMIHS1gZ+In1?=
 =?iso-8859-1?Q?LMVNHTwZ8iu/8IHixBlCN+qdxnXzSuES3yImcSgWkL5ZvY8uSuKLK4Bd48?=
 =?iso-8859-1?Q?g1Y9+6Mi0he2JA9aivDaP7dusrDL4EEiznPy7E3tb4XIXeLFHMilSe0aIZ?=
 =?iso-8859-1?Q?gh0tW3gVBSNTNa2dtH4B3jprynoCHOt2lugQkxr633x5769a1EkKafrDiB?=
 =?iso-8859-1?Q?LjEAV4kIaBI7R0M96VUdhMMQlnzWXc0xjwcRcSgYVqOyfZQdw4Tz1gfP8i?=
 =?iso-8859-1?Q?Xam06F5g9YEGMEj4OeglAnY+UqVnnIQzqIav8GV6bzblQpqAG11kJ0a1E4?=
 =?iso-8859-1?Q?t8wZy0XExf+zUyt2wDsLUyIMfJkcNO1GZSt2ISkPcXzLIXICKBYnQnpuyB?=
 =?iso-8859-1?Q?qvboioiqotiRS6MrVjeOBJNmJBUqwMCyWmB7qbGb1kllIe8+krlq0DfxFJ?=
 =?iso-8859-1?Q?X3OglJ+4W1aEPI7rWzrIIKxfdFZage4mZn+g3YZ0K/4BCywrJJiAyV/mk2?=
 =?iso-8859-1?Q?nwmL1sCn5+4/C3d52sPHW/nYM6f0n7O5DIoCspqPzY2vyTqPAdFsGGYVTs?=
 =?iso-8859-1?Q?j3pGBGDj3kgu44Lmyp+QaAMmoFxkbl7gw1cqD36PtVvkZxUA1UXAXeJcAk?=
 =?iso-8859-1?Q?s8hXrArPPG9bRCA4RPDUbtNZnkisS6KeSmVi+mADxcLgQwmnabsDMqvIYK?=
 =?iso-8859-1?Q?juuGGAA+pdjqBoQnFtKT5dsh0/dKZi8kPWCz7+awH89XODzmILqlo9B0yK?=
 =?iso-8859-1?Q?vEqy8HQRIJ07XvEnhN4KeVn5BxPUF6MJlDfIl96jMs8ubHbfXoDByItftL?=
 =?iso-8859-1?Q?Z0DzRw/EfFt5UvbM+eAMEbzeCFf/zvD+DZ0CLXKuf07cdtdXv0ZvYBil8z?=
 =?iso-8859-1?Q?XTzLiv3WkqvjH5Pvhwo3jpY4Rz5JSo/ZDmzh4IDTC7kDMxnQfteSv2wg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 29bf8a99-970b-4042-3288-08dc33d1b5e1
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2024 18:11:37.4514 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /72adJoSE/fPVL0inLRWeoKDqg2MC3viqjD+5PsHOcrRQuYumCONmsY9XxnTv2d5IHKkdPtpf0a3eVjea1gjTOZ66pVb0n6+2XnJC+5Mm1A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8188
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

Dave Jiang wrote:
> 
> 
> On 2/22/24 7:58 AM, Marek Behún wrote:
> > A few drivers register a devm action to remove a debugfs directory,
> > implementing a one-liner function that calls debufs_remove_recursive().
> > Help drivers avoid this repeated implementations by adding managed
> > version of debugfs directory create function.
> > 
> > Use the new function devm_debugfs_create_dir() in the following
> > drivers:
> >   drivers/crypto/caam/ctrl.c
> >   drivers/gpu/drm/bridge/ti-sn65dsi86.c
> >   drivers/hwmon/hp-wmi-sensors.c
> >   drivers/hwmon/mr75203.c
> >   drivers/hwmon/pmbus/pmbus_core.c
> > 
> > Also use the action function devm_debugfs_dir_recursive_drop() in
> > drivers
> >   drivers/cxl/mem.c
> >   drivers/gpio/gpio-mockup.c
> > 
> > Signed-off-by: Marek Behún <kabel@kernel.org>
> > ---
> >  drivers/crypto/caam/ctrl.c            | 16 +++------
> >  drivers/cxl/mem.c                     |  9 ++---
> >  drivers/gpio/gpio-mockup.c            | 11 ++----
> >  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 13 ++------
> >  drivers/hwmon/hp-wmi-sensors.c        | 15 ++-------
> >  drivers/hwmon/mr75203.c               | 15 +++------
> >  drivers/hwmon/pmbus/pmbus_core.c      | 16 +++------
> >  include/linux/devm-helpers.h          | 48 +++++++++++++++++++++++++++
> >  8 files changed, 72 insertions(+), 71 deletions(-)
> > 
> > diff --git a/drivers/crypto/caam/ctrl.c b/drivers/crypto/caam/ctrl.c
> > index bdf367f3f679..ea3ed9a17f1a 100644
> > --- a/drivers/crypto/caam/ctrl.c
> > +++ b/drivers/crypto/caam/ctrl.c
> > @@ -7,6 +7,7 @@
> >   */
> >  
> >  #include <linux/device.h>
> > +#include <linux/devm-helpers.h>
> >  #include <linux/of_address.h>
> >  #include <linux/of_irq.h>
> >  #include <linux/platform_device.h>
> > @@ -604,11 +605,6 @@ static int init_clocks(struct device *dev, const struct caam_imx_data *data)
> >  	return devm_add_action_or_reset(dev, disable_clocks, ctrlpriv);
> >  }
> >  
> > -static void caam_remove_debugfs(void *root)
> > -{
> > -	debugfs_remove_recursive(root);
> > -}
> > -
> >  #ifdef CONFIG_FSL_MC_BUS
> >  static bool check_version(struct fsl_mc_version *mc_version, u32 major,
> >  			  u32 minor, u32 revision)
> > @@ -1058,13 +1054,9 @@ static int caam_probe(struct platform_device *pdev)
> >  	ctrlpriv->era = caam_get_era(perfmon);
> >  	ctrlpriv->domain = iommu_get_domain_for_dev(dev);
> >  
> > -	dfs_root = debugfs_create_dir(dev_name(dev), NULL);
> > -	if (IS_ENABLED(CONFIG_DEBUG_FS)) {
> > -		ret = devm_add_action_or_reset(dev, caam_remove_debugfs,
> > -					       dfs_root);
> > -		if (ret)
> > -			return ret;
> > -	}
> > +	dfs_root = devm_debugfs_create_dir(dev, dev_name(dev), NULL);
> > +	if (IS_ERR(dfs_root))
> > +		return PTR_ERR(dfs_root);
> >  
> >  	caam_debugfs_init(ctrlpriv, perfmon, dfs_root);
> >  
> > diff --git a/drivers/cxl/mem.c b/drivers/cxl/mem.c
> > index c5c9d8e0d88d..4b38514887a4 100644
> > --- a/drivers/cxl/mem.c
> > +++ b/drivers/cxl/mem.c
> > @@ -2,6 +2,7 @@
> >  /* Copyright(c) 2022 Intel Corporation. All rights reserved. */
> >  #include <linux/debugfs.h>
> >  #include <linux/device.h>
> > +#include <linux/devm-helpers.h>
> >  #include <linux/module.h>
> >  #include <linux/pci.h>
> >  
> > @@ -30,11 +31,6 @@ static void enable_suspend(void *data)
> >  	cxl_mem_active_dec();
> >  }
> >  
> > -static void remove_debugfs(void *dentry)
> > -{
> > -	debugfs_remove_recursive(dentry);
> > -}
> > -
> >  static int cxl_mem_dpa_show(struct seq_file *file, void *data)
> >  {
> >  	struct device *dev = file->private;
> > @@ -138,7 +134,8 @@ static int cxl_mem_probe(struct device *dev)
> >  		debugfs_create_file("clear_poison", 0200, dentry, cxlmd,
> >  				    &cxl_poison_clear_fops);
> >  
> > -	rc = devm_add_action_or_reset(dev, remove_debugfs, dentry);
> > +	rc = devm_add_action_or_reset(dev, devm_debugfs_dir_recursive_drop,
> > +				      dentry);
> 
> This is probably the better fix for cxl:
> 
> diff --git a/drivers/cxl/core/core.h b/drivers/cxl/core/core.h
> index 3b64fb1b9ed0..3258427af032 100644
> --- a/drivers/cxl/core/core.h
> +++ b/drivers/cxl/core/core.h
> @@ -57,7 +57,6 @@ int cxl_send_cmd(struct cxl_memdev *cxlmd, struct cxl_send_command __user *s);
>  void __iomem *devm_cxl_iomap_block(struct device *dev, resource_size_t addr,
>  				   resource_size_t length);
>  
> -struct dentry *cxl_debugfs_create_dir(const char *dir);
>  int cxl_dpa_set_mode(struct cxl_endpoint_decoder *cxled,
>  		     enum cxl_decoder_mode mode);
>  int cxl_dpa_alloc(struct cxl_endpoint_decoder *cxled, unsigned long long size);
> diff --git a/drivers/cxl/core/mbox.c b/drivers/cxl/core/mbox.c
> index 27166a411705..5c2db4791b8b 100644
> --- a/drivers/cxl/core/mbox.c
> +++ b/drivers/cxl/core/mbox.c
> @@ -1402,7 +1402,7 @@ void __init cxl_mbox_init(void)
>  {
>  	struct dentry *mbox_debugfs;
>  
> -	mbox_debugfs = cxl_debugfs_create_dir("mbox");
> +	mbox_debugfs = debugfs_create_dir("mbox", NULL);
>  	debugfs_create_bool("raw_allow_all", 0600, mbox_debugfs,
>  			    &cxl_raw_allow_all);
>  }
> diff --git a/drivers/cxl/core/port.c b/drivers/cxl/core/port.c
> index e59d9d37aa65..82c6a1c6aff4 100644
> --- a/drivers/cxl/core/port.c
> +++ b/drivers/cxl/core/port.c
> @@ -10,6 +10,7 @@
>  #include <linux/slab.h>
>  #include <linux/idr.h>
>  #include <linux/node.h>
> +#include <linux/devm-helpers.h>
>  #include <cxlmem.h>
>  #include <cxlpci.h>
>  #include <cxl.h>
> @@ -2207,13 +2208,7 @@ struct bus_type cxl_bus_type = {
>  };
>  EXPORT_SYMBOL_NS_GPL(cxl_bus_type, CXL);
>  
> -static struct dentry *cxl_debugfs;
> -
> -struct dentry *cxl_debugfs_create_dir(const char *dir)
> -{
> -	return debugfs_create_dir(dir, cxl_debugfs);
> -}
> -EXPORT_SYMBOL_NS_GPL(cxl_debugfs_create_dir, CXL);
> +struct dentry *cxl_debugfs;
>  
>  static __init int cxl_core_init(void)
>  {
> diff --git a/drivers/cxl/cxl.h b/drivers/cxl/cxl.h
> index b6017c0c57b4..ca8399b24955 100644
> --- a/drivers/cxl/cxl.h
> +++ b/drivers/cxl/cxl.h
> @@ -880,6 +880,8 @@ void cxl_switch_parse_cdat(struct cxl_port *port);
>  int cxl_endpoint_get_perf_coordinates(struct cxl_port *port,
>  				      struct access_coordinate *coord);
>  
> +extern struct dentry *cxl_debugfs;
> +
>  /*
>   * Unit test builds overrides this to __weak, find the 'strong' version
>   * of these symbols in tools/testing/cxl/.
> diff --git a/drivers/cxl/cxlmem.h b/drivers/cxl/cxlmem.h
> index 5303d6942b88..b6f13ba87927 100644
> --- a/drivers/cxl/cxlmem.h
> +++ b/drivers/cxl/cxlmem.h
> @@ -859,6 +859,5 @@ struct cxl_hdm {
>  };
>  
>  struct seq_file;
> -struct dentry *cxl_debugfs_create_dir(const char *dir);
>  void cxl_dpa_debug(struct seq_file *file, struct cxl_dev_state *cxlds);
>  #endif /* __CXL_MEM_H__ */
> diff --git a/drivers/cxl/mem.c b/drivers/cxl/mem.c
> index c5c9d8e0d88d..494abe7a54c5 100644
> --- a/drivers/cxl/mem.c
> +++ b/drivers/cxl/mem.c
> @@ -4,6 +4,7 @@
>  #include <linux/device.h>
>  #include <linux/module.h>
>  #include <linux/pci.h>
> +#include <linux/devm-helpers.h>
>  
>  #include "cxlmem.h"
>  #include "cxlpci.h"
> @@ -30,11 +31,6 @@ static void enable_suspend(void *data)
>  	cxl_mem_active_dec();
>  }
>  
> -static void remove_debugfs(void *dentry)
> -{
> -	debugfs_remove_recursive(dentry);
> -}
> -
>  static int cxl_mem_dpa_show(struct seq_file *file, void *data)
>  {
>  	struct device *dev = file->private;
> @@ -128,7 +124,10 @@ static int cxl_mem_probe(struct device *dev)
>  	if (work_pending(&cxlmd->detach_work))
>  		return -EBUSY;
>  
> -	dentry = cxl_debugfs_create_dir(dev_name(dev));
> +	dentry = devm_debugfs_create_dir(dev, dev_name(dev), NULL);
> +	if (IS_ERR(dentry))
> +		return PTR_ERR(dentry);
> +

No that loses the "cxl" prefix.
