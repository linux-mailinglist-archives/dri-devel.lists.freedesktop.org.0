Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8013E92F1C9
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jul 2024 00:17:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5791D10EA98;
	Thu, 11 Jul 2024 22:17:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MT/rLCdx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 862C810E9D1;
 Thu, 11 Jul 2024 22:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720736242; x=1752272242;
 h=date:from:to:cc:subject:message-id:
 content-transfer-encoding:mime-version;
 bh=PN9nfyMd7lbySbcE3MmnRKenJaQuu70M5OZOvrbYgwI=;
 b=MT/rLCdx/WceRmwH4qzyvqeJsj2Sz8VHgjVHWHYymxnNmpX4cUKyBsJ0
 tNJKIUOhzQh54cefAfoLtR0ndnD2rHGYP9GpIftU1U8EphyiNgZnupbw5
 +CaM9yPO+1zITeZOuZe9RTfmiHEhpa0OdpJOKshdaRuFwFRV2lxMyYCbl
 BkSL8G+pFZvP4EQpEPJtR6MLARAccvrbZHml0vQCADLoxQ89Dk6XW3UWQ
 teNvBcGfqv/ipwjLvyijLO1rwFehUkZkzrSJp36kq+rr0D9WAL5gp6Tn+
 /zNe8xgXn8GCeixVlnmommfINGgdj/RT2upw3FBE//cJSf61My9bFn6tg g==;
X-CSE-ConnectionGUID: kNSiAzbET4qyVKJMReEeGQ==
X-CSE-MsgGUID: w5W91EZ1SYiLfcKAgJOhMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="12510375"
X-IronPort-AV: E=Sophos;i="6.09,201,1716274800"; d="scan'208";a="12510375"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 15:17:21 -0700
X-CSE-ConnectionGUID: 3Qgt2GnlTdWpjwNI9GS9Jg==
X-CSE-MsgGUID: 0cOu/ampSQWROHiO1266HA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,201,1716274800"; d="scan'208";a="48597211"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Jul 2024 15:17:20 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 11 Jul 2024 15:17:20 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 11 Jul 2024 15:17:20 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 11 Jul 2024 15:17:19 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 11 Jul 2024 15:17:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zSWkdlC0u6Ohd1xeNlp67ZbFivz5ko1AjoJanCz4FVdsSegDcvfS/IIIc4SUGh0uwQZHURFrnFVHrV0v3jqJhFqkDlCt5jCFDbpBSW8caBjjQLcc6pc6yI3Cx91WMJwE4f4kCzQ8Qh2y3GbhIkKdATuyIOZx2VX/sz4SYvlnd1Bw37KjvbVQNxjHFN7Eal8KPZPTfUdd+9WJM20enSLPA0+BLObGBU4j1Rs3Uavjk1ku3VJDHL9az6YZjkCIcZ2moy2/4eIk38tOLNF/eUGoAN2Z4oQXPn/O5N1PsdepyuMQwZ46ireWz1M/kEdm3o9HNj3/GGOSb4SdeL+JS0G0Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B2dqosbfNTVcTDccSkLQqq0mA7nXP89loWzXPBjoGOM=;
 b=uZQgqmwUmGCXKlDJFt+AxoYB2X0/4yEtBLuyJ2yQsJvazDVNEsEfP5Od1aZvULNCc2vctCaT5kad41k9efQ3O12uJW+DUarXm9MAQNCsrSIDQ4OeDxzDsccCKhIzel/HTWLgFmXSRHRDYbW18/GIqH/kJw141uDnFmgJp0zwmcSf6JzG9/z7BOv9oAV+OCs99OobzfJ+QcDTtKgzPv2TMS+y54CvwXIUetUAkEKRhx7e+GVA4DhrpkVIujHb5d71WbmPoy+r30uvvYPqJmCkGfcWHGYd6LSTTgw2QVt7vC7tTvy9dCh6NY2/mB6bLKP6+jMEmZJViCWUImkq0SeA8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA1PR11MB6345.namprd11.prod.outlook.com (2603:10b6:208:38b::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Thu, 11 Jul
 2024 22:17:15 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.7762.020; Thu, 11 Jul 2024
 22:17:14 +0000
Date: Thu, 11 Jul 2024 17:16:58 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
CC: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Oded Gabbay <ogabbay@kernel.org>, "Lucas
 De Marchi" <lucas.demarchi@intel.com>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <dim-tools@lists.freedesktop.org>
Subject: [PULL] drm-xe-fixes
Message-ID: <vgqz35btnxdddko3byrgww5ii36wig2tvondg2p3j3b3ourj4i@rqgolll3wwkh>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0171.namprd04.prod.outlook.com
 (2603:10b6:303:85::26) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA1PR11MB6345:EE_
X-MS-Office365-Filtering-Correlation-Id: aba59f70-5531-4d90-8399-08dca1f737bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?u1RMY0sKVv3y9s3ZbNpC6voiFkHuer8XdD+/EfoamoYvMy3TazOoZ84KWh?=
 =?iso-8859-1?Q?cdhYrfv85IIApk3fok9yNipDOLy/PJU+Zuq3EGzUlFOwJwMzQQ9M6OHUYj?=
 =?iso-8859-1?Q?k5g3PVoIvmnGpFOzUVQ/4BUkUJ69A7aQHcZtO8nvtTWfulFSDIjdWeOcma?=
 =?iso-8859-1?Q?LPuU2LPGyMHHvV5jo9m9VyY2xixPeg2e7jnITwDtsxWHJZ/l8IWzJVzkuM?=
 =?iso-8859-1?Q?remmLL18yPTLPYb1AumXCd0ByEG+2tZs0MKsfbv7N/Tx+MysHIZWC19DCc?=
 =?iso-8859-1?Q?LSwplDHHEeZv98zHZcbgautung2AoOZJ8jkQbJQzBJKeEhoegJ3YJfp8LH?=
 =?iso-8859-1?Q?029DVmVEZAiiPr620sB7S+BoEkaPhNK+0fBpFmIMjOb1TuLNXKn7+8auhT?=
 =?iso-8859-1?Q?EnV0mVCjOfBLj5Vq7dhY7I82BAVOgdoboQUXRoyhkY/Re+j0RQOXSG/XFJ?=
 =?iso-8859-1?Q?97AE+mWDCvZja8dXo54yrVNl7Maazv20JxFF36qx98mCCWMVTJPIXJelEF?=
 =?iso-8859-1?Q?kykV12izoeWZ3E9XglRp6Dj3ZtAbPc2XHqia8aLejyITLSOnuhMg9zNpzX?=
 =?iso-8859-1?Q?VIwzMHhW+E5D9GlBGzhv/P7xHFKjUNlNI6cvpXB1Cx8qSsF6PutrkR7GC0?=
 =?iso-8859-1?Q?Is1+6hXOB9Pbalq5hstOhpGd9CkCyy8N5+f7okgn+RDSqyHIIByl4SxwRa?=
 =?iso-8859-1?Q?oyQzxMWsPrshGG6O/PLSvW6mCBeGARazhKHmOJBwxd4kgQbfPD/feznmX+?=
 =?iso-8859-1?Q?7F64iUQ8yonreVGjEJEo5voO2BI4BrTDKPKvVCNhUxgKhIy2JNDn/mTq2c?=
 =?iso-8859-1?Q?H0DTusr3UETY7NItmGSRC+csOqxPjSS7RuaVcrWfvM/8JCEayp3a8POjpM?=
 =?iso-8859-1?Q?xvlvIXMO1iRbDy5VnPNLRB3XGPJU1o1RYx/Y4UCpAWhIr5zk7EhdwI5Z3A?=
 =?iso-8859-1?Q?p4mMZVTgYB3Duur5vx9+U3EioggsrE74fQ8CA71l4u57cLt4yDItQUz+/g?=
 =?iso-8859-1?Q?vJgQTiSdy5Zc+CMvHoxG6umXJjl0PwEF0ZpHo8KWEDIuox4MY4tSKH9fiZ?=
 =?iso-8859-1?Q?z0E324p3UgFIxFP3txS0MEyABrQKnJVxEhc4ttFciRsdLbrOrA7anfASQY?=
 =?iso-8859-1?Q?9Jsjislwzfvd6oNnleFwNMozcX2ya9s6/w4cMF2Otmn2Fl7OX7iMgIJ9Cu?=
 =?iso-8859-1?Q?QlJ+/XkXLJrRez8c6/d51okOpfDr2WEkq269h8pdvXPVT5oZ3USE+5tXN0?=
 =?iso-8859-1?Q?pcV24d9KE1s6zU+wrgmVQ/FfDrkoEvn33Fi5oqnE+iCORI6aVS53ndntjX?=
 =?iso-8859-1?Q?MSQ+YlZaMWAQ/6wyY1OAIiGdNeZ0ylfurA/OdQrZaT4XqVw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?ygS4KpjUQ+jpsXcVhP6+ubzmlo4ESXsofU+E6+AzyoVOkF/s7wv3GG1vZW?=
 =?iso-8859-1?Q?RtwIqoFeUpF/FeNcLcLig/VCDSndjLS55BWz9+DgtQrT0cyCIWguSB8lv8?=
 =?iso-8859-1?Q?jGPJr0Dxvrcudh6DqWsx0SKQTfh5c1d5eG9wBJmHgorCNFr7NBPIzkbUak?=
 =?iso-8859-1?Q?4Stb0ytkNRsfQDkmdRSzacVI7WNRq5fyR8szNRBN6PBv9Y7J7Jgo70oxww?=
 =?iso-8859-1?Q?YUEDmNzOiq040gVNiQHs6ibhN+CoeT0vn3kHDEBAg8G5OWBQYQ2zZNqx9h?=
 =?iso-8859-1?Q?psVQ1fM9VFLDnOzMrczvoSeUPpKbsPOQjTAN4gKRM9DvMt4nbWCjgOP/+4?=
 =?iso-8859-1?Q?CPp4faj0IPhYulHvlkRgk+nQ/mUBbwwr1bluFk17yNA+PkQUFR0nkg4iUh?=
 =?iso-8859-1?Q?OE8SPgg9KM2Vtlfe/y8XfNO7ZBvt0Auu3/BuU84PAiYoe4hnJ9etW9us9d?=
 =?iso-8859-1?Q?wDkfsKreioNibaHXZ3chG3GuK5XdSInZt3K7sMOkD6KdjCrw1oVfPF5yTL?=
 =?iso-8859-1?Q?XeqorUsxcjZOwE2soOdZP7Hv/ATlblRlMM3/CIs9xRGGcBbcFqulQtp8Gi?=
 =?iso-8859-1?Q?m6ASYP7JDfbvRSt4z4Aq8UXlTDInIzyPY+RPqt9oMx+zAxhAeueTZ/uIUE?=
 =?iso-8859-1?Q?+d33o9OTRy+JVybSRSgqRqrUQBNJGIlacJ9Ra5lA6IBcSuGVlLmfnFHWui?=
 =?iso-8859-1?Q?p8r4o4UDtIE6LtFpFtU0MoHCh+Jv7OJg/yyD7ODicCmD6ch05ZmoeqbeSg?=
 =?iso-8859-1?Q?7Yl3/2xHUkOTgQszREtvkv/kMsF1nDl7AdVjFHAkAkf36MR3eTLovKQNOe?=
 =?iso-8859-1?Q?EkQk7JJKye577EKamVg4KD+Q2/YqJd4VT8U7Udnj/Hl4NK6tugkhv+d56o?=
 =?iso-8859-1?Q?5GZAg59oKP1inbunkQFZALnLvdRAnaeEd+jlZGZ7uBWNa9XPMDkcxs4IV/?=
 =?iso-8859-1?Q?YoJd0pQg4vlHEOXW64pmtK8AYpEITaVpX1mHlNf91tstNnSLXizJbY6yF3?=
 =?iso-8859-1?Q?+R3R1LvySJhKNXTfiW+9n9qjNR8pU1PdbKiqavvn5vOJ+ijM7viAMv39ik?=
 =?iso-8859-1?Q?K9GDSAyj3XYg29R/D0RBlZoDvL6UZw4dOtAndgahcQxGPZ0vpqDObCEqIY?=
 =?iso-8859-1?Q?cPz+J47Yo/eQlfbNciqHPVZDzzI7b9Q5yVquL2iiMvwKcDZrRlZZyJQk0t?=
 =?iso-8859-1?Q?FW972ZTuczcC3KLcMtkI7dljsBWb8Q+0yozsq2cD+szp6nj4iMCyCZo2o8?=
 =?iso-8859-1?Q?48fnPUArjT3MBqvDWXKdtfLS/mbb2r8y7L3R4Ua9eMKHNh47djvMfrSlpo?=
 =?iso-8859-1?Q?JZBSTQYqlG2WKNhxhk0x8jSpyzfi50Pn9ubEAfAqU8MlXFK0yOGGO1NBk/?=
 =?iso-8859-1?Q?mgMUQT23DMFAueatfDcfHfIs3TwOlJ5IRiqc+iLDKBaDtq1w85YHYA2dyP?=
 =?iso-8859-1?Q?EC/zNQioBtHPRbGi7l6OYoOacWKyIYuWPzJgv3FdN8AXlAcYdW26nnL6yV?=
 =?iso-8859-1?Q?yV32MZESQxtiPQKryxapnw3n2Rd/3cUU7GgbdRt6IweqR38MS3ROYsG1Ay?=
 =?iso-8859-1?Q?HrFsj1Cmj6OjLyY8/NAedOGpIANJvG38ksTJNWI2RER3SkY30AIpWv6HfU?=
 =?iso-8859-1?Q?n5jPEgvY7e5WTgN4AJYHWhelGeEBhhofPBEVCdTgBMbWIB0H94+rXKBw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: aba59f70-5531-4d90-8399-08dca1f737bd
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2024 22:17:14.5218 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GR6IrSB2jBiMCAjOnYzRGsPx8zn/qNMm38LVaLSdh8iuXKzoGCraW+iTFkM6r9I2ICMnD1TFlPQ1lvJYPLYeRJsQn+RAoPyazRjFvpcy0Eo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6345
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

Hi Dave and Sima,

First patch has an important impact to userspace, changing the cahcing
mode to write-back for system memory on DGFX. In this case we introduce
a limitation in the cache selection uapi that is transparent to UMDs. I
mean, no change on their side is needed.  Coherence is maintained, but
with some known possible and acceptable/accepted differences in CPU
access speed.

Second patch fixes a leak when finalizing hdcp gsc.

drm-xe-fixes-2024-07-11:
UAPI Changes:
- Use write-back caching mode for system memory on DGFX (Thomas)

Driver Changes:
- Do not leak object when finalizing hdcp gsc (Nirmoy)
The following changes since commit 256abd8e550ce977b728be79a74e1729438b4948:

   Linux 6.10-rc7 (2024-07-07 14:23:46 -0700)

are available in the Git repository at:

   https://gitlab.freedesktop.org/drm/xe/kernel.git tags/drm-xe-fixes-2024-07-11

for you to fetch changes up to 609458abd5a10180f513ca364d6c0ae30128c821:

   drm/xe/display/xe_hdcp_gsc: Free arbiter on driver removal (2024-07-11 08:25:32 -0700)

----------------------------------------------------------------
UAPI Changes:
- Use write-back caching mode for system memory on DGFX (Thomas)

Driver Changes:
- Do not leak object when finalizing hdcp gsc (Nirmoy)

----------------------------------------------------------------
Nirmoy Das (1):
       drm/xe/display/xe_hdcp_gsc: Free arbiter on driver removal

Thomas Hellström (1):
       drm/xe: Use write-back caching mode for system memory on DGFX

  drivers/gpu/drm/xe/display/xe_hdcp_gsc.c | 12 +++++---
  drivers/gpu/drm/xe/xe_bo.c               | 47 +++++++++++++++++++-------------
  drivers/gpu/drm/xe/xe_bo_types.h         |  3 +-
  include/uapi/drm/xe_drm.h                |  8 +++++-
  4 files changed, 45 insertions(+), 25 deletions(-)
