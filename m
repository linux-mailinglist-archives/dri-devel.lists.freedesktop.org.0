Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 961A0860126
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 19:25:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FAB210EA16;
	Thu, 22 Feb 2024 18:25:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MAwqtGXb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2368710EA16
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Feb 2024 18:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708626326; x=1740162326;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=8UUIspyAgn5j8fNakp1RxbdKJ5ATqjMjB+ggWGl7vn4=;
 b=MAwqtGXbIOrHiPQ2/Hyjjvbxx9sMH7Qt3snId/PhDqVbJDqjzghFtz1R
 Ly2BHGKPT9EOe2DFNxZhWKmoW43tEHjYQlqEfkK4vVBmib2WXxaCB1/di
 NFjfunrD7nmFFG4R+v7/xEWdMvlFg71YwtXd+hC/GH3brQDnbqrZ6xAv2
 hWTI9mKWAozuPVlm0SV1SK7X8yqnbe/ONVDcF1OOCC+T560xaQfWD9B/j
 oglR5eSvsjDXYXvVxNPa+DkKBPo3nyHK7d4D461njJMlRDIz8eTPPrR7F
 82iKe80zpVj3ZA6w84bnxARj6NRPyb4ZkVcg9EAiNrQykyc7nBnTSw1sC Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="14296749"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; d="scan'208";a="14296749"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2024 10:25:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="936886383"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; d="scan'208";a="936886383"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Feb 2024 10:25:23 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 22 Feb 2024 10:25:23 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 22 Feb 2024 10:25:23 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 22 Feb 2024 10:25:23 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 22 Feb 2024 10:25:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ecNKO6WblxC6ZQ450jjmI9GYqS3x5k71v2qMvswXvRnHBOa+BxG3fcR5WLQmHiQ185VaFWjW+ierELphwyB3yymd3LmeCiibMD6UJ4riJcNY++i+miNTJFLrOFMmSdlBjcrNitisUcVfhUVriTHlMQu7Xt2s9ht9ecu1xR/7fNYVHWIHs0fOP6y6EuWMew3Y9k4cnZ2RFNvgGx7H6/bPXeF2R3Q1dJyoZO/GhVdDCxevXikuT9ttmPRLKsAImOks0qV4rcmaS2RBaisIp8+kfUi5i1t1GhFjs3pacADvup1RJyHMph2w/q/OPny35tWD2v39dcMmaRKYKA94LtxiKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KjjJXsfMIkZY6ac5jHReYiUCFki8bbMyEcX5EkqI/LA=;
 b=aYV+FEtt9qDvrOwxrO1hac6NTuSgSG9gPO0d42Vp9aaJjw/qpeyDF4KzhW92tugsAM9VlRRnVEQV8HSMkq9NJj62CdRzF1QPAbH/mCrA+i6t5Bz15Z9d+uyLFfkFy05V7W+HAGv4D3VD2w+DmKMN6/faNjgUmCF6GPVnuSiNdihyfjx5sos6P9qUvz+SNp8waX//VD/cwXSFERJv3hdZYZbOk30EsX2BM+so8MnNYJc+6Ouaq7YnXmr0xtfXfXC1D53WLuwQPLX8rmxhJqvZ1jAuRPGQ1nMnfysw9XtXXGeP/o4VxNHddF/popDFkOHAwcHV2SE3Vd6Y6fPo+QHeSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by DS7PR11MB6104.namprd11.prod.outlook.com (2603:10b6:8:9f::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7339.10; Thu, 22 Feb 2024 18:25:19 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::da43:97f6:814c:4dc]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::da43:97f6:814c:4dc%7]) with mapi id 15.20.7316.018; Thu, 22 Feb 2024
 18:25:19 +0000
Date: Thu, 22 Feb 2024 10:25:15 -0800
From: Dan Williams <dan.j.williams@intel.com>
To: Dan Williams <dan.j.williams@intel.com>, Dave Jiang
 <dave.jiang@intel.com>, Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
 <linux-kernel@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>, "Matti
 Vaittinen" <mazziesaccount@gmail.com>
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
Message-ID: <65d7918b358a5_1ee3129432@dwillia2-mobl3.amr.corp.intel.com.notmuch>
References: <20240222145838.12916-1-kabel@kernel.org>
 <20240222145838.12916-2-kabel@kernel.org>
 <23c50406-7ebd-4cc3-a978-1b8a5fc71ff0@intel.com>
 <65d78e55844c1_1ee312946a@dwillia2-mobl3.amr.corp.intel.com.notmuch>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <65d78e55844c1_1ee312946a@dwillia2-mobl3.amr.corp.intel.com.notmuch>
X-ClientProxiedBy: MW4PR03CA0182.namprd03.prod.outlook.com
 (2603:10b6:303:b8::7) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|DS7PR11MB6104:EE_
X-MS-Office365-Filtering-Correlation-Id: ebc1b1a1-73a9-4663-5eb9-08dc33d39fdd
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: n9RfIVe3VG4RJrtlpl9uWvnhgxOGzAIDNQvakFnwzHFNoF4/bLBpjjqUUS10Z00bXIslUb2tj394bwbQQcPh9DJ2Cdb1AAF3SuasbJ39zQFOo9eeX8gP6Wb2qAgL9aLq+SZP7O8UKqeyVRwfWY6OHX9sWMmAcKHdcUcz97ICT6WMWz1O/B6Mu2uLpkSMZz2dIgPoj7t9NGKrLsUE2LwptFrQZ6lBGYWLZZqRpzQ8Ry3FxN9U3QbjwYu8Ilbrwj91RjpHRLBZ4vZuV3YneNzjWUl58n5dXqkT1XK3+a6UJulJV+E9qRY1InPvv06jMsHxe6rjx1LqIXv9gk5TWNrI4ai4gysJaDdEWWA0RngL35pkJ9OjFl4aCY61DinnYPovipslgldVB+MIpY9TGsCiTr3vty9j2gT21coawzLhU8lkGLJrmhL8y6+SvgHayYsQM3l4o1KOEuQgzPTaN/9k95kWwRxCC24UcF+nvwsPZ8f2of4terE1nX8uk7Dmo4yB3g5JKr2AbhzrVTto9dReXFtqswMA+/I03ck9bsPMkPI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8107.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?jc0CMwJ+viTns2sPchYhwb5l9f+KZ86qER28p6uC4ri9MI9D5A1f/TJ+hy?=
 =?iso-8859-1?Q?HE+oKNMqqWUVg4ZKjKa4QJY08Nc9xZCzoXcsUV6Vs3bINxO61hR227vMFL?=
 =?iso-8859-1?Q?G75foFHovO5TMcRC1YB+zPolu9f/xjFy087OjjTWG/GRcaEQO+saCZkNgX?=
 =?iso-8859-1?Q?oOcWgSEVWFP9mruRDvx+8jmJ/Vum7rtXX4hQgptNdw9qtxbz3OP+aZf88g?=
 =?iso-8859-1?Q?2Dz/LJ81sz/LtXziAz2iElkSGf9AQ7QkTa20IKvuvCn1ikxtSDrdxUmzj+?=
 =?iso-8859-1?Q?MkXOZIXtSerg/0/RVMCYxY7cHfgn1BQqXdvVZf7GLHFxbYf+69HU2mM2uJ?=
 =?iso-8859-1?Q?6w1bPg46dq3gJhmHyXjZiahEG9wJnLYehkhH7VD6dGtF6WIdJRKbTr0fVD?=
 =?iso-8859-1?Q?MPaC6pezJTuumJd80XKVEUqVarFgQm8D1NFVTXyepteewgHZztqh+QeVJF?=
 =?iso-8859-1?Q?3jPjYVTF59PBDcqNqfvDlMXqDf2hxGhsLs40rgUQ/PuDqF7KTWjASn+BJJ?=
 =?iso-8859-1?Q?qIgpmqDRf/m2f7Egr9zZEi9z6BxWi/fVKBB4BhDr7EzaISrTNyd68uDK8x?=
 =?iso-8859-1?Q?MfG9cSwKF3v9BqiXu0qVjoq6PvbfKUKl8ffLA+s5ss13exPNCuUE2wqUrW?=
 =?iso-8859-1?Q?LZXocgJ6KSKDd9cSJjzDxSXF4AeZulU10JaFnGQHTb9+O+5SlwmqtPzwj1?=
 =?iso-8859-1?Q?BXD44iXqfN0hqDEu6TKiqibaZ1ZUb5YSFmf8CJN1y2zMq92C/KdcjjKC4w?=
 =?iso-8859-1?Q?PNtjRd+XvUUe0r/lYdfILS+lRsnUgGyBNo+XIz4ZmpJvLDHPBtorgC2lFu?=
 =?iso-8859-1?Q?XN8WHv738r8crxxM2Q78x2915CR4oS0Vzxa45CPVUD2HXUl9isk/0hAett?=
 =?iso-8859-1?Q?ZhNotQWg+BQf9ppJuliwckrUnBZfVwlIOkevKIMdb+R+3vRoG1LkJqHLNS?=
 =?iso-8859-1?Q?T2QxZN0Np7cEbt0PYnZqj7Xh/vWxr1FkRfJe1C7El83mZMuVr2k3wZp71Z?=
 =?iso-8859-1?Q?acUJuvo46qKV+D92xmbw6VsXoo7SaFebOkKdmGi+bs+FBy1xVCfB+VL/6R?=
 =?iso-8859-1?Q?UsqdAQDvmXPIHULWObode34RWL0wfNSdoKXthD29hEVms/F/z42+W5UzkK?=
 =?iso-8859-1?Q?ZAioeN6NyHElJS3dBJagWq3KOWOKKCVuJSkZXnBcu6Ahb9cpfUZAyYZytz?=
 =?iso-8859-1?Q?DPpx8xmR2rmJ6sHTMmvDoZduwqeGwyQGmHHk8dollkXC1aPkTI2+3g4kdc?=
 =?iso-8859-1?Q?o00ozapbKZyM61UIN5tbDGhV1BFCLuwICh75nxPWqvpl3J8+FPjHt79I8s?=
 =?iso-8859-1?Q?WQDJvkSflS9HiAZwfQDHHHEOy3ECKRasBowHZMBxTqbrCms4ZoBT7lCrMR?=
 =?iso-8859-1?Q?HJpRONd7ippNFV7l/TFSoEkGbMPlV+fP0IAxsXmpaLGMtYqJ9isudaRd0G?=
 =?iso-8859-1?Q?eI23RFGoqPFxpcXq+86MYYk8ibL8Cr3Lq1miwqWhOOj0RWwRJURh4hPnIL?=
 =?iso-8859-1?Q?BXIBdJSZkfy6hTwpz2kiBzK6EHmsJjs0h8PAFu4u1MEjM/rSTGPcKtAF1r?=
 =?iso-8859-1?Q?Ialx03UgzVhFXp/o15MDue3XB8cgmbPgoxX2XDhVgLDIdvsnVBI7adDNXu?=
 =?iso-8859-1?Q?Kg8D3hyEOO/5eTHlwpT/cc/OBq9dSLGEKHyDTwOOAuAmUEXPOkG5hHWQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ebc1b1a1-73a9-4663-5eb9-08dc33d39fdd
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2024 18:25:19.4517 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uYig7fF1jS41Pb9D8C+d1C0dFe4oyfod4zlkmGHfmSzRd9zod1kX2UECHpt76B4AAPfj0wSjrE8uWxozfB9x+HmnMwDqZo9hlPc/qzuM2vs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6104
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

Dan Williams wrote:
> Dave Jiang wrote:
> > 
> > 
> > On 2/22/24 7:58 AM, Marek Behún wrote:
> > > A few drivers register a devm action to remove a debugfs directory,
> > > implementing a one-liner function that calls debufs_remove_recursive().
> > > Help drivers avoid this repeated implementations by adding managed
> > > version of debugfs directory create function.
> > > 
> > > Use the new function devm_debugfs_create_dir() in the following
> > > drivers:
> > >   drivers/crypto/caam/ctrl.c
> > >   drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > >   drivers/hwmon/hp-wmi-sensors.c
> > >   drivers/hwmon/mr75203.c
> > >   drivers/hwmon/pmbus/pmbus_core.c
> > > 
> > > Also use the action function devm_debugfs_dir_recursive_drop() in
> > > drivers
> > >   drivers/cxl/mem.c
> > >   drivers/gpio/gpio-mockup.c
> > > 
> > > Signed-off-by: Marek Behún <kabel@kernel.org>
> > > ---
> > >  drivers/crypto/caam/ctrl.c            | 16 +++------
> > >  drivers/cxl/mem.c                     |  9 ++---
> > >  drivers/gpio/gpio-mockup.c            | 11 ++----
> > >  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 13 ++------
> > >  drivers/hwmon/hp-wmi-sensors.c        | 15 ++-------
> > >  drivers/hwmon/mr75203.c               | 15 +++------
> > >  drivers/hwmon/pmbus/pmbus_core.c      | 16 +++------
> > >  include/linux/devm-helpers.h          | 48 +++++++++++++++++++++++++++
> > >  8 files changed, 72 insertions(+), 71 deletions(-)
> > > 
[..]
> > diff --git a/drivers/cxl/cxlmem.h b/drivers/cxl/cxlmem.h
> > index 5303d6942b88..b6f13ba87927 100644
> > --- a/drivers/cxl/cxlmem.h
> > +++ b/drivers/cxl/cxlmem.h
> > @@ -859,6 +859,5 @@ struct cxl_hdm {
> >  };
> >  
> >  struct seq_file;
> > -struct dentry *cxl_debugfs_create_dir(const char *dir);
> >  void cxl_dpa_debug(struct seq_file *file, struct cxl_dev_state *cxlds);
> >  #endif /* __CXL_MEM_H__ */
> > diff --git a/drivers/cxl/mem.c b/drivers/cxl/mem.c
> > index c5c9d8e0d88d..494abe7a54c5 100644
> > --- a/drivers/cxl/mem.c
> > +++ b/drivers/cxl/mem.c
> > @@ -4,6 +4,7 @@
> >  #include <linux/device.h>
> >  #include <linux/module.h>
> >  #include <linux/pci.h>
> > +#include <linux/devm-helpers.h>
> >  
> >  #include "cxlmem.h"
> >  #include "cxlpci.h"
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
> > @@ -128,7 +124,10 @@ static int cxl_mem_probe(struct device *dev)
> >  	if (work_pending(&cxlmd->detach_work))
> >  		return -EBUSY;
> >  
> > -	dentry = cxl_debugfs_create_dir(dev_name(dev));
> > +	dentry = devm_debugfs_create_dir(dev, dev_name(dev), NULL);
> > +	if (IS_ERR(dentry))
> > +		return PTR_ERR(dentry);
> > +
> 
> No that loses the "cxl" prefix.

So, to be clear, I do see the benefit of removing the
devm_add_action_or_reset() call altogether, but that work is a bit
deeper and should not be tied with all these other cleanups. So I think
from the CXL perspective, please drop these CXL changes out of this
patch. Follow up with a standalone patch, or leave it to drivers/cxl/
folks to create that deeper cleanup.
