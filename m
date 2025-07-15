Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D05ECB066E8
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jul 2025 21:33:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 893A910E10B;
	Tue, 15 Jul 2025 19:33:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AL2YmZ9i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6C2A10E10B;
 Tue, 15 Jul 2025 19:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752608004; x=1784144004;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Vnen89BYivqMYC2lhMNyFK4ysZdSP4tZU41kXPRMcRk=;
 b=AL2YmZ9i0qbvBppC7CRAi8azHspBmT1bMT3E+F+uER13hgn1FaPRl6m8
 eXP5szgJuLi/VznbHaMaZhiGVg+QaHqHvVay72pYx7V0Ce1YV6/DnjdSP
 hdKtM8Q56KwCIg0yzF+X3hv2AkDEXQTCbqp96N+081TxQLl+v5wGJpVFQ
 eq4dBKjgeG4i3onTEI1BQrVKX3jK9Ze9HGnIairR2p5BYfJ8Km1ridxeq
 OVD7ccap6hdVbODgkhBV0HFrb8FYoHztA3QwONimNExESnc8imVOfQe8U
 uDy1pEfFBT1PKh/VLYnIMSZR5LJdbTe6rxrFMSD9xX0juH6ebznbBKm8S g==;
X-CSE-ConnectionGUID: Csb3wpBpRwC7xLwstutp6g==
X-CSE-MsgGUID: SvKk52F0S3mMKgyxlFDA9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="66291375"
X-IronPort-AV: E=Sophos;i="6.16,314,1744095600"; d="scan'208";a="66291375"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 12:33:23 -0700
X-CSE-ConnectionGUID: JAeXKmk5TNGkntvCr422TA==
X-CSE-MsgGUID: MKFrgkr9RZCo6O2xRi21EQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,314,1744095600"; d="scan'208";a="157414363"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 12:33:12 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 15 Jul 2025 12:33:11 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 15 Jul 2025 12:33:11 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.54)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 15 Jul 2025 12:33:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fk6ZYu00BJcfcRMwxjFXo+6WAdM8ymH2lXh+2wSWB9C/F5fNQeahWLrrkwRfOsvy7MDAXWwIqxdyaeoIK4yRt8sXM6QuRfMVYrcLdAP+H/UKgf+sON1EqsDddGNAuXzHfOO8IPDucEVfjPLL7LC3u56AdvaOk8Mk6hHlyneLEK8YDk7SQDDIrowIVbmNx38HKxQH75mK8o2kYMzrxn8C5qfGxuKmItnVB01FlJRLMOJlkUkYxfALvQgPIXSFkQx13+Or0eY+bPDbB845L0vXOhs1sWof1SfyVeoaOP/ZzqmP24ap4uiFw+ET+feq+q7K/3LU/rE4so5iVuAKXEm15g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zkfQZ1O5Xt946unji94dEkamIGQYMkQIbdMo0DlPBWw=;
 b=YyxxZ+xrD7vuDh15aiD4t7wVI8RdVLIg0XxzTSbgoTe8bJJrCXQmxawdaWxYorAX3Ot6d0MuouaO7zpO+sqk0WVIARXIZNLbHobRR7RUtwPyz11xuaKyBlDdqw+34pWTG3PMai1pEkQ8vTZjtBwUbv1rl8kowpudJtj1UkKKRJ4pxvaXK2vrtdhjmsTmBrFM5c45FoB5gsFM9JvqjxGVXl1SMgwTLz7VC7Ox2MLiFbzRWvewmVKjAj/Zh7KEiUyhSbxNTFdjA+3IAYaXEbqMalQSlXKOKz2VPkDFNU8AYYkHpPsJy1mabhh6wGHkXbjZrtES1avcyVZaHlMx8gVvog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by CY8PR11MB7242.namprd11.prod.outlook.com (2603:10b6:930:95::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.27; Tue, 15 Jul
 2025 19:32:40 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%5]) with mapi id 15.20.8922.023; Tue, 15 Jul 2025
 19:32:39 +0000
Date: Tue, 15 Jul 2025 15:32:35 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
CC: <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 13/19] drm/i915: Pass along the format info from
 .fb_create() to drm_helper_mode_fill_fb_struct()
Message-ID: <aHas01eFBQzs4eGE@intel.com>
References: <20250701090722.13645-1-ville.syrjala@linux.intel.com>
 <20250701090722.13645-14-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250701090722.13645-14-ville.syrjala@linux.intel.com>
X-ClientProxiedBy: SJ0PR05CA0058.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::33) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|CY8PR11MB7242:EE_
X-MS-Office365-Filtering-Correlation-Id: a0454aad-49bf-42ff-c270-08ddc3d65bee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?/REN1q8c+ijUNsx5IXcLzUaIY0ahhd6VLkXlp9o7MIPaLQCX0zmwcFeIOn?=
 =?iso-8859-1?Q?NM2/nbiuj1i2lOAtRZKquNP/10oZLORdXKYKCYMU7gUYkFdWIiW0uRCGfP?=
 =?iso-8859-1?Q?awINclVnNJsnnm79h0YQelh9v+bfVTXbZGqIZQRCQtOxt25A4GdZoFGErR?=
 =?iso-8859-1?Q?XEW8D61Oi24vmngpIcZP18R019LKSsUg5QWD1NtgdCh0efD+PpyfxfDZNR?=
 =?iso-8859-1?Q?gKhW5fZNJfQgd/VKK9WStWjrfrWjJrXKtnCf5olUOFNy9/a1RyH61Xapbd?=
 =?iso-8859-1?Q?82kN6WKtNFy0Q/jzYWG2EbbjVd9URKsHAZj6o5uoWJIIVS3GIj9VnSeHMx?=
 =?iso-8859-1?Q?XG40rcJvpo5TnpK8wv3kP3swJD+MV5+BJX34XHR79H1R9icoJsm8ARsilt?=
 =?iso-8859-1?Q?/xXxuP0EQx93heIsgcr0rooDv4go8KYU3fPbonPXkbF0N5b1GX+eBI8kHt?=
 =?iso-8859-1?Q?zknaHFeO6om6KWQYUuEstijdJRbZjvxShjKmMyhR+1egCIbAtPGIEXWH+6?=
 =?iso-8859-1?Q?EFS3oeUS2LrExgzsXCACxDq/wTN2aPlw11ZP+84rtrNxcTGI7FRIgT5LmU?=
 =?iso-8859-1?Q?IaLmI/FccXqmvjRhnrcGY3yZdmPHuAXH5l1LLrGl5KdB22WHc2LbjQ4o5b?=
 =?iso-8859-1?Q?Z86sQUFeAFhU1RZCOR6pDFo9buQ0b9UIyD4f6qxcr70bdDz3YX4QtOpjtE?=
 =?iso-8859-1?Q?F9iTMrZxlopatWdBtdOQJ7jIcN1/ACQ/XoH/hE/Gd9KcI2eC2eXsKYed7V?=
 =?iso-8859-1?Q?GukpIDdn3BIoT+4nii19KB5Lpj2ojEsjZg4ECdQihypykc0ydqWORxARns?=
 =?iso-8859-1?Q?yzM1kXs1BfEGTj8OVnq9oLnzxVvF5Qqg9GQNwsJ2nDwqzD39uPzHoj6n6L?=
 =?iso-8859-1?Q?OhXSWovuT8jpeU53MMp+6djUNQBfpygorULl+zHEd7ctt4O+WgTYjn9Mrd?=
 =?iso-8859-1?Q?f7bIyeiKUmGhyetWMZCyzFupQhDGIessPAipVfzzN2mlfSFMtx4P+UBWTa?=
 =?iso-8859-1?Q?+gntyyGQDG13TqeWDGvs8Rzo5+3S1vxd2OfQ1iNumvplo/r1KM/sYpXmmc?=
 =?iso-8859-1?Q?53Mb6/MnvT/4R3jYnj94GoNBxCVUo1RbAOMVnHxRiT4xP5uvbKPQPyoHQ0?=
 =?iso-8859-1?Q?u+5rUoBVeDk9sg2bkCSUyfMrjbPN7xjXvFWS6TFVKhec8tqWGH8XZab9xJ?=
 =?iso-8859-1?Q?oQHrlPj1+6wV9JWGhExoKa66EMVqY06ptReeZVIJ81S+XPQZbvMiSMGMJX?=
 =?iso-8859-1?Q?D0uNkkI5Vj8dcXbTfKrKggkng308VSjaLBCbiKa6Dy9P1WjRnrHQ64mAmK?=
 =?iso-8859-1?Q?4poWiH6YasSmFCVYy2k4ZlA51dJX+6OVc4E6t2eAhwx/3UA18I0+9dmdcp?=
 =?iso-8859-1?Q?Guim00HxAT+szAbLVV2402DF9p/qv/9Y1L2EDKKm8dXNYxrGpvvDpbvt5k?=
 =?iso-8859-1?Q?0/fszeJNkSWg4SzbJZ0R6RrlkxObygAyaLFl2PWdgcSXNis/eRBwTYidYC?=
 =?iso-8859-1?Q?M=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?YxUcigyMOYohpyZdcdeXOzXuNCGtnHcIHthD3L48hzSZIxp+4yEBYX4ARb?=
 =?iso-8859-1?Q?3bGOwMQgCjwRo/p0IHAZQBlHp5o/bX306ZI2QZ5DuY90boDiiE05hrNwSn?=
 =?iso-8859-1?Q?5mNQmBv2psuIQcXu5zCI2JTi2xldqw8KLNxcVpQ+I3PKg2qAsLnueHpA02?=
 =?iso-8859-1?Q?39XSTTmiaZ65HQofDvg8qStKCoISoR24RzZms1+TKVZF3B2aP9KW3kILDb?=
 =?iso-8859-1?Q?rgkEj2vcuxdu/QGGvuJqsqfIqtyHONHgsdZIbCsGOUYFwGOl/BpnT5M/wp?=
 =?iso-8859-1?Q?3EIS+4m+rwRkGhZ6HJ/+zBQt4+2tAz4ZuB2EN8NZtMpzE5ZppucHVplBGh?=
 =?iso-8859-1?Q?SReG7SUo+5kY4o7Ni2icw4BkPEQ83fo01tkaBgPi5J8b0dHjg3KVb6EPbI?=
 =?iso-8859-1?Q?HmfpVty5tLvxrrKAp5PJ7/sd2oSr3cjUeI9bT9fjAw3kby9R77Vxj+lzzg?=
 =?iso-8859-1?Q?TiKHz1MHsE+qzXW62n8Px+7vbCfoR7h8i+s5HkmDhaDKUVUyZJZ8wIv4h4?=
 =?iso-8859-1?Q?Jel5MvwcIA4OjCBwT/GV1kq08lL7h8D6XY/S0c7oKAnLFiVqHHzYVR1U+v?=
 =?iso-8859-1?Q?fkhwXhI5hgkUZQPIzAGSVaD5P9Ths9h6EKQWqAUr8LqzX5CTuJfTmIA+AW?=
 =?iso-8859-1?Q?hPsR4EOFfmX26qwCSIC+l2kyQ0JAcDJyUMLneyB6ZEwjyYYCtrJ5oSIXWl?=
 =?iso-8859-1?Q?LaDzw83w3149CiYEKJ2ZmT2rVWLh/DDQXIG7NR3TB/yaOfV3ArQNNVb6r4?=
 =?iso-8859-1?Q?HopRreC0j804Y2NytATSe+xvrYfMLP3hMvlLGiVuzZyBnHH7gOv9UG60dH?=
 =?iso-8859-1?Q?0n98DKsw0XwT+Komuebup+ecO0RKzC3qfHI4jCir+mjvCpKRX60vtEu9ip?=
 =?iso-8859-1?Q?eKcsJ1LmsYW3Wh8tOWG3B+1VkwxXnQC6Bun7cDnXChki4HtSgOgOcI6USS?=
 =?iso-8859-1?Q?EBWYYaGmqEQDrFxYRdT4aoYdOSsTEVu0M8i2TClxlRqPMcDlXWYRsJVIGt?=
 =?iso-8859-1?Q?5Ry16Xd0+wYhs6Za5Rwt3J4rm+d0t298D4utMkHV9lvhBSS+TBrMqvwuH5?=
 =?iso-8859-1?Q?XRATu2MNdWr2Vd30fN0koqLUQHd03ijvSlua8KjLqY3MJX9c2p5wdvnpm2?=
 =?iso-8859-1?Q?u5zRf+ZnupNqsWf/QntTvpUX2yfVF53TFUP9K2sU9mps58m66hY4sFPrYy?=
 =?iso-8859-1?Q?oDwQ+FSlHRPLDma99Y9DJpBwmx8kninDjGEcsnFQa1Z3wJ6+ILW/jHCCi2?=
 =?iso-8859-1?Q?ZB4oOxZReswE03twQ4mhH69cr9OHtfcbEZr0fRwqj53XX0IMC7C6UKVAc6?=
 =?iso-8859-1?Q?qGGgMICrXdy04WPENiKy7ecsB4MiA3t/VMDuECQYKQJRFNHjxIksNQSdJJ?=
 =?iso-8859-1?Q?jPttibpkt92zofsc+fpAA1i7a4ymABGAlMT71c/DY8fffrKBgjOFfTKFMv?=
 =?iso-8859-1?Q?Efq2IkayPdRM05igF9PtjSX0hYdVM7ByI53CnKWX+6G2RG6k+mZuT8SUSy?=
 =?iso-8859-1?Q?CmArPva+P0faXj2Et8Qb1JE9Gdy0hcl8/cYOZNlUkpXBYjx97v2FSQ8uDN?=
 =?iso-8859-1?Q?nmksQ9yHbJiICiY0P4Vdki/nyYuZcWqsD/956ZxeS0D84UvrcUQzYtGm9g?=
 =?iso-8859-1?Q?6ZbzBSlLH90w9qwF1XcdLBj6Cn+XHsN2P7XDdJL3bU8dVannNu4qxdcQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a0454aad-49bf-42ff-c270-08ddc3d65bee
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2025 19:32:39.1069 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 68V3BScv+VBDVMtc+nYFhZAq9qqBiaWK3MUGsNo4pEHYB2MoJKIkW6HyPDvMl4LZXHnRR1EQJEb7YQd3eFn1wQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7242
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

On Tue, Jul 01, 2025 at 12:07:16PM +0300, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> Plumb the format info from .fb_create() all the way to
> drm_helper_mode_fill_fb_struct() to avoid the redundant
> lookup.
> 
> For the fbdev case a manual drm_get_format_info() lookup
> is needed.
> 
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

to get this through drm-misc

> ---
>  drivers/gpu/drm/i915/display/intel_fb.c            | 8 +++++---
>  drivers/gpu/drm/i915/display/intel_fb.h            | 2 ++
>  drivers/gpu/drm/i915/display/intel_fbdev_fb.c      | 6 +++++-
>  drivers/gpu/drm/i915/display/intel_plane_initial.c | 3 ++-
>  drivers/gpu/drm/xe/display/intel_fbdev_fb.c        | 6 +++++-
>  drivers/gpu/drm/xe/display/xe_plane_initial.c      | 2 +-
>  6 files changed, 20 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_fb.c b/drivers/gpu/drm/i915/display/intel_fb.c
> index 30fa287ed6b0..1792f138b062 100644
> --- a/drivers/gpu/drm/i915/display/intel_fb.c
> +++ b/drivers/gpu/drm/i915/display/intel_fb.c
> @@ -2207,6 +2207,7 @@ static const struct drm_framebuffer_funcs intel_fb_funcs = {
>  
>  int intel_framebuffer_init(struct intel_framebuffer *intel_fb,
>  			   struct drm_gem_object *obj,
> +			   const struct drm_format_info *info,
>  			   struct drm_mode_fb_cmd2 *mode_cmd)
>  {
>  	struct intel_display *display = to_intel_display(obj->dev);
> @@ -2254,7 +2255,7 @@ int intel_framebuffer_init(struct intel_framebuffer *intel_fb,
>  		goto err_frontbuffer_put;
>  	}
>  
> -	drm_helper_mode_fill_fb_struct(display->drm, fb, NULL, mode_cmd);
> +	drm_helper_mode_fill_fb_struct(display->drm, fb, info, mode_cmd);
>  
>  	for (i = 0; i < fb->format->num_planes; i++) {
>  		unsigned int stride_alignment;
> @@ -2335,7 +2336,7 @@ intel_user_framebuffer_create(struct drm_device *dev,
>  	if (IS_ERR(obj))
>  		return ERR_CAST(obj);
>  
> -	fb = intel_framebuffer_create(obj, &mode_cmd);
> +	fb = intel_framebuffer_create(obj, info, &mode_cmd);
>  	drm_gem_object_put(obj);
>  
>  	return fb;
> @@ -2343,6 +2344,7 @@ intel_user_framebuffer_create(struct drm_device *dev,
>  
>  struct drm_framebuffer *
>  intel_framebuffer_create(struct drm_gem_object *obj,
> +			 const struct drm_format_info *info,
>  			 struct drm_mode_fb_cmd2 *mode_cmd)
>  {
>  	struct intel_framebuffer *intel_fb;
> @@ -2352,7 +2354,7 @@ intel_framebuffer_create(struct drm_gem_object *obj,
>  	if (!intel_fb)
>  		return ERR_PTR(-ENOMEM);
>  
> -	ret = intel_framebuffer_init(intel_fb, obj, mode_cmd);
> +	ret = intel_framebuffer_init(intel_fb, obj, info, mode_cmd);
>  	if (ret)
>  		goto err;
>  
> diff --git a/drivers/gpu/drm/i915/display/intel_fb.h b/drivers/gpu/drm/i915/display/intel_fb.h
> index 00181c4a67dc..403b8b63721a 100644
> --- a/drivers/gpu/drm/i915/display/intel_fb.h
> +++ b/drivers/gpu/drm/i915/display/intel_fb.h
> @@ -102,9 +102,11 @@ void intel_add_fb_offsets(int *x, int *y,
>  
>  int intel_framebuffer_init(struct intel_framebuffer *ifb,
>  			   struct drm_gem_object *obj,
> +			   const struct drm_format_info *info,
>  			   struct drm_mode_fb_cmd2 *mode_cmd);
>  struct drm_framebuffer *
>  intel_framebuffer_create(struct drm_gem_object *obj,
> +			 const struct drm_format_info *info,
>  			 struct drm_mode_fb_cmd2 *mode_cmd);
>  struct drm_framebuffer *
>  intel_user_framebuffer_create(struct drm_device *dev,
> diff --git a/drivers/gpu/drm/i915/display/intel_fbdev_fb.c b/drivers/gpu/drm/i915/display/intel_fbdev_fb.c
> index 8db3af36b2f2..210aee9ae88b 100644
> --- a/drivers/gpu/drm/i915/display/intel_fbdev_fb.c
> +++ b/drivers/gpu/drm/i915/display/intel_fbdev_fb.c
> @@ -62,7 +62,11 @@ struct intel_framebuffer *intel_fbdev_fb_alloc(struct drm_fb_helper *helper,
>  		return ERR_PTR(-ENOMEM);
>  	}
>  
> -	fb = intel_framebuffer_create(intel_bo_to_drm_bo(obj), &mode_cmd);
> +	fb = intel_framebuffer_create(intel_bo_to_drm_bo(obj),
> +				      drm_get_format_info(display->drm,
> +							  mode_cmd.pixel_format,
> +							  mode_cmd.modifier[0]),
> +				      &mode_cmd);
>  	i915_gem_object_put(obj);
>  
>  	return to_intel_framebuffer(fb);
> diff --git a/drivers/gpu/drm/i915/display/intel_plane_initial.c b/drivers/gpu/drm/i915/display/intel_plane_initial.c
> index 2194d39a5c98..4246173ed311 100644
> --- a/drivers/gpu/drm/i915/display/intel_plane_initial.c
> +++ b/drivers/gpu/drm/i915/display/intel_plane_initial.c
> @@ -289,7 +289,8 @@ intel_alloc_initial_plane_obj(struct intel_crtc *crtc,
>  	mode_cmd.flags = DRM_MODE_FB_MODIFIERS;
>  
>  	if (intel_framebuffer_init(to_intel_framebuffer(fb),
> -				   intel_bo_to_drm_bo(vma->obj), &mode_cmd)) {
> +				   intel_bo_to_drm_bo(vma->obj),
> +				   fb->format, &mode_cmd)) {
>  		drm_dbg_kms(display->drm, "intel fb init failed\n");
>  		goto err_vma;
>  	}
> diff --git a/drivers/gpu/drm/xe/display/intel_fbdev_fb.c b/drivers/gpu/drm/xe/display/intel_fbdev_fb.c
> index b28a94df824f..fba9617a75a5 100644
> --- a/drivers/gpu/drm/xe/display/intel_fbdev_fb.c
> +++ b/drivers/gpu/drm/xe/display/intel_fbdev_fb.c
> @@ -66,7 +66,11 @@ struct intel_framebuffer *intel_fbdev_fb_alloc(struct drm_fb_helper *helper,
>  		goto err;
>  	}
>  
> -	fb = intel_framebuffer_create(&obj->ttm.base, &mode_cmd);
> +	fb = intel_framebuffer_create(&obj->ttm.base,
> +				      drm_get_format_info(dev,
> +							  mode_cmd.pixel_format,
> +							  mode_cmd.modifier[0]),
> +				      &mode_cmd);
>  	if (IS_ERR(fb)) {
>  		xe_bo_unpin_map_no_vm(obj);
>  		goto err;
> diff --git a/drivers/gpu/drm/xe/display/xe_plane_initial.c b/drivers/gpu/drm/xe/display/xe_plane_initial.c
> index b2ede3af9345..dcbc4b2d3fd9 100644
> --- a/drivers/gpu/drm/xe/display/xe_plane_initial.c
> +++ b/drivers/gpu/drm/xe/display/xe_plane_initial.c
> @@ -184,7 +184,7 @@ intel_alloc_initial_plane_obj(struct intel_crtc *crtc,
>  		return false;
>  
>  	if (intel_framebuffer_init(to_intel_framebuffer(fb),
> -				   &bo->ttm.base, &mode_cmd)) {
> +				   &bo->ttm.base, fb->format, &mode_cmd)) {
>  		drm_dbg_kms(&xe->drm, "intel fb init failed\n");
>  		goto err_bo;
>  	}
> -- 
> 2.49.0
> 
