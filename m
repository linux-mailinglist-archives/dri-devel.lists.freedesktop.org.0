Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D8CA95D629
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2024 21:41:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C2FF10E0D1;
	Fri, 23 Aug 2024 19:41:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZsJsgolY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00F8710E0C6;
 Fri, 23 Aug 2024 19:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724442072; x=1755978072;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=m0xpdsJ87nXurJaAMO/S44SFr2oRvy0JLM5JRfjMpTE=;
 b=ZsJsgolYzii5w8lONdI+5agw8cibifRG+gK9bVoqDlfkfywEqC4WDvJ5
 GUnAptiguV2UVjILinFA8nBRn1sWfRE0j/jKOrghf7udZM9AioxiRXGRV
 WY+RjUKahIjh7a6DDdtlW9xPxUVHpiA4mhfyuS9sMg8nmv3soht11LAKl
 ej8sGoMdQYsbo2nhIBpzM6FO/TFB627P8PGFJyqr2QuG3iemlxgaHjcQl
 8SRjn+v6SYOoUx3a2iufbvkje2JYqD666ZSHQFtF3tZy6S0g8AKAtcREb
 UqINjOTl4ZoLMkx+x2A/67HqcSEtFnrtklPzDpLckXDVGThhdwkXHoo/l A==;
X-CSE-ConnectionGUID: 9BYb0Lx8SNOBFycVtYJFjw==
X-CSE-MsgGUID: MiPJvE+cTKuMFL8khPqLDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11173"; a="45446319"
X-IronPort-AV: E=Sophos;i="6.10,171,1719903600"; d="scan'208";a="45446319"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2024 12:41:11 -0700
X-CSE-ConnectionGUID: /yTqANIYRq2itdQM1EIamw==
X-CSE-MsgGUID: 9LO9AeG5TqWdcwsZKDsusw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,171,1719903600"; d="scan'208";a="85076031"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Aug 2024 12:41:11 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 23 Aug 2024 12:41:11 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 23 Aug 2024 12:41:10 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 23 Aug 2024 12:41:10 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.42) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 23 Aug 2024 12:41:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wO0TD1DGcPb0TeEB3WFGMKu1s69s7f42lIA7VuTWMGAxVlvN0+6xdgX6enI+h0AwbhCnnmNVpQyKTwyWYtUkMI0KCDXdheKC+N37MeKBySa81lJgp7x8IIoznQy57s1tDguBNSuJ8NijnIRlYvxnDcwz2UsXWntqghVhOaUgJ2U48925K111AHVvjJJGpPyohVkW2wtBBOhh2KFE0iGQtsUJYbMD9N/eLtjJPx72Z2K5n8NTIKj79Y8NEM923L+b6yjm2fb12PHMZ+Snt2hqZpv8l1+zWBLJ8Dcftk4YcwN7xSMy5APTut1eYool5hbaJ+mZizdQYit3guf9c6/9Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vR4p8olTgYwNSrFd/DVjxNHYYsQuOQBlezkEdDRxEmw=;
 b=TPRxeRF+FqEEN/ejx1aXgjAtvrvcwDHwQDsaQJX+obeeLfQ+FPU1qFEg2Rq4avwYfsp6ZSkiryi2IdayZtn72YbkZ5PplHDEWSF91vxJ4OaLzcP7IcOadp4EZi1e+05G5CPtBhF//POoQtZve8N7PqLLjXBxQHJqc4VL0T0+er1vRakVRwitKE/s8ssoRsRj6h4X2tXjEajSxm/1yWDuzjnam0ymhw3bPKaFC0ZT+YaDeYUL2CSVTtMKRQe/6zDy/XeieC2nV3z7vREZUH1M4KfXGZSu1d304R4L+xsD3/cfsxUcmMD7SyStD5PIP1kLwizGmOWO/HopWiEVWqtpMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by IA0PR11MB7813.namprd11.prod.outlook.com (2603:10b6:208:402::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19; Fri, 23 Aug
 2024 19:41:08 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7897.014; Fri, 23 Aug 2024
 19:41:08 +0000
Date: Fri, 23 Aug 2024 15:41:04 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Hans de Goede <hdegoede@redhat.com>
CC: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>, intel-gfx
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] drm/i915/dsi: Make Lenovo Yoga Tab 3 X90F DMI match less
 strict
Message-ID: <Zsjl0OuA7hzyRbzs@intel.com>
References: <20240823075055.17198-1-hdegoede@redhat.com>
 <87v7zr3ays.fsf@intel.com>
 <a0ca2cb0-2938-41d7-a290-bb331f2d4c35@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <a0ca2cb0-2938-41d7-a290-bb331f2d4c35@redhat.com>
X-ClientProxiedBy: MW4PR04CA0355.namprd04.prod.outlook.com
 (2603:10b6:303:8a::30) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|IA0PR11MB7813:EE_
X-MS-Office365-Filtering-Correlation-Id: c1fefbd1-fb14-4bcc-81dd-08dcc3ab88c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?JudcAGJ/DQTItQJjocitNaaEjuULkY6p4Nv/aZt6YL8UyByxEX32U5rgkZwC?=
 =?us-ascii?Q?4rJw4k6uqfcGAxjA7ZyWD1IOKKMb1/ygszI/eqGYBddVQlcP4MTtQ0tSGtd+?=
 =?us-ascii?Q?NstHz1Q5tTCa9Eq1j0+GlcyYzYXt4qKTIpdNArw3izYhBDIZcxHAH61sYE8l?=
 =?us-ascii?Q?sCfeeZt2306HbTSq9F9Hl67h22PyOB0mTnZ6peFutUqjGP8LmUcXCJ4ZPGw9?=
 =?us-ascii?Q?e+kALC+nqzA0APvv+zjshbuu44/Nc8iUvAzGJAweSxFDzBBMVTatCd9bMPKl?=
 =?us-ascii?Q?ueZc298Gbh/hTYNDI4eBw+Qv25mAkratxtwNioSVr4nhPsJnshGUWteWY6N6?=
 =?us-ascii?Q?dEPElxniwOK+gvOmqxY/m0NJjmg22voPy0CzBHgo0DOSVWPXLcy1X70fmsE+?=
 =?us-ascii?Q?AEqYK7/i6jpkVG+Ud2lHlnlh0E9T5LodCmq3RXYXOcoz4nI3W0oY+ETYmRJ4?=
 =?us-ascii?Q?LddrAS/7sNUBsHh6AkJrtevaHZAX3ByrHV+ksNy1kcL+Me+8On73MIOiAWYw?=
 =?us-ascii?Q?rXpmLXb7lUjL/qdKr7zhjSQxCAWapeGjwMJLvqrlnBtEPUYg6N+CgvdiwptZ?=
 =?us-ascii?Q?iTS2lGzF8fuRUYdflgRrIoyVb58rzrPREocc71zAShH0Oc6hsbNX1ePNDSzu?=
 =?us-ascii?Q?i16ebHXSG5fwu1uirgYdXTyFpwSsCbF3ZSvgqkQKl1ulyRnqnjAxGZ2eJOlE?=
 =?us-ascii?Q?aqR85lDPR9w0sS1ptIOJ6cgj72r18eL5PQVOs/GBq60hlyapDCpuJw+2VBsI?=
 =?us-ascii?Q?0xBTxq/F3Wh/odPSEBj51ihzHWmUY4A9/+xyeABPm8hVjPdYmCO4fgxcV9fz?=
 =?us-ascii?Q?tQEkWoPqCfvq0cHbLuT9WuhPChu99cwC4fZlfdT5kPAWl6VNbEIQBFBx4EwX?=
 =?us-ascii?Q?Dp3fXM/gt9hLAm/IMR11YN+rrjZXdaQFi4kdBEFiwdT4wEQy6xE2LRDZMon4?=
 =?us-ascii?Q?JcicRceV6FZ915J0WdWypkX2Vl9EzBZUgvuT8xPbJclEyaSEfJDT8TsKyi47?=
 =?us-ascii?Q?dC4NKwAaB45qiYzaNc2FeptIEpvf9woWzpcM5CXl7ZQAnjItmO8/32Jh0vl2?=
 =?us-ascii?Q?1nJErfkaVf/EZBJVoHKjM5uHrTu+oA8cXJ1GRo44lMi/RsQD7lGeir6Us7Mw?=
 =?us-ascii?Q?DkLgPDZOeGUbTooeDM+C9p4qfpMtouNmf1iReN1RFkBrs/R7T3jA7zxTdrj0?=
 =?us-ascii?Q?pWygdBRYhKDawCD2JIC1rGtyzOKrG/QLWqkRkJ+6coe1V6NOiNeJI2MHDJzK?=
 =?us-ascii?Q?v4FaOEoV8z88bOJsFEVQKcQlS8dksEMntCvwh26tKG0wiei/NfkxX9sxhD4e?=
 =?us-ascii?Q?MDU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dclZs+cRRC+UzF6bYWlC+GtyGWUaI+ghbnhXk0fhXO437YYRAgwFiUfcsBt8?=
 =?us-ascii?Q?0YpZsRkDVRvtk9rFXi4hLgN8phbhCBogxml+93+PtclPQVAYjoeEvx8FnWOf?=
 =?us-ascii?Q?gcfecYlGUVrv8Ff5m//EBq5XyrxR7qQD8VA6TDK62WiSlvD5ELawiCQf7NdA?=
 =?us-ascii?Q?a+XvwrpxXPrihzjrVyoVpLLZFaXz5/3qqdXqiXVT2uZxdYdWVsZgj2AouH3O?=
 =?us-ascii?Q?J8Q/xBwE/+uZ1KfIyFkKXLmR+c17Mx+sqWAPap7dk8SixPZsJCh7MMWsABrj?=
 =?us-ascii?Q?s4MZ0SxVFX+VBhNJHbnOYwLku09yc5Lg0CfY7EClskyxvVPg0fAZWftnMVZ0?=
 =?us-ascii?Q?Elcp2xTAbRl0lZFgWgotNSbHyJCr+28+o969zwpg0+0+EzJajdGDrEKmZYeM?=
 =?us-ascii?Q?5TvH+vcYSYj6+jyM8bM6dcg+aGy/dfCsMNlSqTremtDC3IlnGK+cCU3OCKu4?=
 =?us-ascii?Q?c2Ti99tyL95uM/lHDKIMhX6tH3Drkr5X7CPaztzn2t0eHQrw+4f9qYkUkqol?=
 =?us-ascii?Q?Y3Cutz+YY9lxZ3K3X8pINfLYCMaQUEfiOB1wp+1fmUaw/yQ9UnLS6jB/I0RD?=
 =?us-ascii?Q?orKqwGdX4m/mzEsBGU7ONuJAN2PssX0JS6rQV+kfufXGIQ1KAJE5X89Oe0wJ?=
 =?us-ascii?Q?cNzq9dBH92tDz+oUQ/YfKvhHiLjafwiuPmx+FnEwiHUuk9lAR7CkW6VvhCum?=
 =?us-ascii?Q?SHJwfYC8c5HSGvrd/gRytCg27L++Vf+mDHKahoLQQDxto44zjIu6cWk1tc1X?=
 =?us-ascii?Q?gRCJPNKtBrKuLklttW35ox1kBTDWcoH4WKx+CIBwU9JmHqYtZ2c+yh0+Zu4d?=
 =?us-ascii?Q?i6LNwg7NXAK6pGVsYuCDj4GHx1ZRBTT0rQ1JuPmjX75Icw5QefdpprQZzclb?=
 =?us-ascii?Q?H/4yTLbfncG586uM8SrvsNutoekivmM8uxOLOaJeVVvPte6oIUdNzCQXTCzm?=
 =?us-ascii?Q?Apm4mYStrFQyGboR4ZHdf4OAf4EInfya5jsIu2UqabuQfDa84uD8V0I3YC+P?=
 =?us-ascii?Q?KwI7SDmcssPykdxM9pkTXqUvysHYdk9IWBp9AXZjmQXvlyEOhLGIs5WXdHNH?=
 =?us-ascii?Q?nYZV2lal3gJPEzishBQzlgLUzKGlUfSyTpIR7vbPGlfDWUPttk7dctlSVtI/?=
 =?us-ascii?Q?J0C+j9tZ7hg8C9s8x5d7C8kFitoULJ+ydiH9v5zH1EthegyMKCqVb9MfzijN?=
 =?us-ascii?Q?36YUtSuwpgXUDm8mmBag2LZlOYrhrDUiEbC/hZnnKankrG4CXLsKZ845XwdI?=
 =?us-ascii?Q?p+YfXJlfLGUx9F+S+H1FqM1oiNI990ksZMFFqAcSk8ZYbjNnGfhp2BDPlUiK?=
 =?us-ascii?Q?YBxLniJAIxM70925lFAvzq4jO4KfopbEdf59PhjUjz91Q4YSmbOOJMVVBm5M?=
 =?us-ascii?Q?xyBYZwX53c6etHRDCyUgS5yj5+uLB6PfFZCAIU3N2r9KZOTAa8BQ8TN6AjC9?=
 =?us-ascii?Q?vtw+g8DMzuNDW9Vtsb5Hqe/zIpmiZ4GvWw0ZZIhvpdhE5K+BT5DFE+2tV8+9?=
 =?us-ascii?Q?WMDuSOzf2nEG1Cg+do2+ZfegTa1Q1qtKMoTGTfCa9O876YLOnF2xKnWAbAdC?=
 =?us-ascii?Q?o0fqWPdxSt+/wu6p45dbf7YBwReZC/WGKQ2CIhrxNOSAa8MC8Uub8p28Qj6E?=
 =?us-ascii?Q?3Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c1fefbd1-fb14-4bcc-81dd-08dcc3ab88c2
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2024 19:41:08.3880 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fbcs2TDlb0RFECp/Pnod6tnWdi6i57GlIcEPXg1gjtGe8DPQZkj0B4ODUAIP0iD/kVn/0zC+wO78UyCCs+0bOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7813
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

On Fri, Aug 23, 2024 at 07:34:39PM +0200, Hans de Goede wrote:
> Hi,
> 
> On 8/23/24 10:22 AM, Jani Nikula wrote:
> > On Fri, 23 Aug 2024, Hans de Goede <hdegoede@redhat.com> wrote:
> >> There are 2G and 4G RAM versions of the Lenovo Yoga Tab 3 X90F and it
> >> turns out that the 2G version has a DMI product name of
> >> "CHERRYVIEW D1 PLATFORM" where as the 4G version has
> >> "CHERRYVIEW C0 PLATFORM". The sys-vendor + product-version check are
> >> unique enough that the product-name check is not necessary.
> >>
> >> Drop the product-name check so that the existing DMI match for the 4G
> >> RAM version also matches the 2G RAM version.
> >>
> >> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> > 
> > I'll take your word for it.
> > 
> > Acked-by: Jani Nikula <jani.nikula@intel.com>
> 
> Thank you.
> 
> I was going to push this directly to drm-intel-fixes, but reading:
> 
> https://drm.pages.freedesktop.org/maintainer-tools/repositories/drm-intel.html#repository-and-branches
> 
> It seems that I should push this to drm-intel-next and then cherry-pick
> it into drm-intel-fixes ?

Just push to drm-intel-next and let the fixes tag take care of its magic:

Fixes: f6f4a0862bde ("drm/i915/vlv_dsi: Add DMI quirk for backlight control issues on Lenovo Yoga Tab 3 (v2)")

The cherry-pick to -fixes branches is handled weekly by whoever maintainer
is tacking care of that round. Usually the 'Fixes' tag will be enough to ensure
it gets propagated. But on the lack of the fixes tag of if you noticed something was missed,
then just ping us.

Thanks,
Rodrigo.

> 
> Regards,
> 
> Hans
> 
> 
> 
> 
> > 
> >> ---
> >>  drivers/gpu/drm/i915/display/vlv_dsi.c | 1 -
> >>  1 file changed, 1 deletion(-)
> >>
> >> diff --git a/drivers/gpu/drm/i915/display/vlv_dsi.c b/drivers/gpu/drm/i915/display/vlv_dsi.c
> >> index 40b3ffd534d3..6cebcc87ef14 100644
> >> --- a/drivers/gpu/drm/i915/display/vlv_dsi.c
> >> +++ b/drivers/gpu/drm/i915/display/vlv_dsi.c
> >> @@ -1874,7 +1874,6 @@ static const struct dmi_system_id vlv_dsi_dmi_quirk_table[] = {
> >>  		/* Lenovo Yoga Tab 3 Pro YT3-X90F */
> >>  		.matches = {
> >>  			DMI_MATCH(DMI_SYS_VENDOR, "Intel Corporation"),
> >> -			DMI_MATCH(DMI_PRODUCT_NAME, "CHERRYVIEW D1 PLATFORM"),
> >>  			DMI_MATCH(DMI_PRODUCT_VERSION, "Blade3-10A-001"),
> >>  		},
> >>  		.driver_data = (void *)vlv_dsi_lenovo_yoga_tab3_backlight_fixup,
> > 
> 
