Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9333CBB08F4
	for <lists+dri-devel@lfdr.de>; Wed, 01 Oct 2025 15:48:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C3D210E6BE;
	Wed,  1 Oct 2025 13:48:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RZiBUa6I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F4F710E0AC;
 Wed,  1 Oct 2025 13:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759326492; x=1790862492;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=XwEKs2gbpYcTX018PdD3mDU7jLYARC8eZu2Cd5UuTgM=;
 b=RZiBUa6IxkyA++bF8hMKVzcYKyJsDVoHjkjfUIL3vwT/5efbYUoj4kPi
 bxCBiYgCIu7gPQXS5YX4rpCw9UBq5VD+xOPOesB7E2N071QDLPaYy7vAA
 pl0UUZw/JEslhQ081QSwjibl5BeLf3nYvN+/+MSiJfIiRs8KnegyNiKLB
 fzwQ/EC9NjAKO3n0iYIfh8AHvEQ28fjp1IHCYzFSdKX4EfwNQYuSEJV3m
 Ps/iMWWSJ+MZ/dncuHkbnL/l/oEt26afFhk+B3kCzvjbtNC/5imjXJIJx
 707aToCrh4nP/xhfmbNYP+VXL57xk/5CaUtXtIxXohNJmSv8anC+0WIai Q==;
X-CSE-ConnectionGUID: tem31QwdSKmQcVOGNBKzyw==
X-CSE-MsgGUID: D6o5O+uhQbGb0lKOpX6Hzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="65236270"
X-IronPort-AV: E=Sophos;i="6.18,306,1751266800"; d="scan'208";a="65236270"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 06:48:12 -0700
X-CSE-ConnectionGUID: VAhZGSmESQSBP9kB7Poomw==
X-CSE-MsgGUID: HugjgygmTFCRUYPQQDrzLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,306,1751266800"; d="scan'208";a="179563128"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 06:48:11 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 1 Oct 2025 06:48:10 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 1 Oct 2025 06:48:10 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.42) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 1 Oct 2025 06:48:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O2g6pIJUhVbDybr9WcnI+dy+o4VImkDdPNJXi49BmzMXJBQb0haw9ojLF/6ouGRbUDaMZ6dbhmNkHxPu0/j4s0oVU1F7+fDbJpkfl91fxDnc027TdEtk6RCVJR81s07jQ53bARBxFmIvzYrXRP6NR34dD9447Hdw7KLcaZon/Ag7w81WvhWtvDYOZ+7zOj3Jo8R6zKftDE9eIbg4odng/4QcS8jWT40gR8gjWPdTTexUcHdd6fftjmE2BWk07QfZk/1c0LNFcehdy1EoaUtFjwVMlprRjPlzgp28dupWqoC69zHuUjGEMZBddK3zfnsl14Tz0lqn+bA+KBQe2Y7Z2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YyKk4jveLuAQZ/fIjG4cncK9du9RpB9xiaEVoLg/grI=;
 b=hjXNglOFCBjG5PuZXTtbYMT5eXn6NmhNh2mrB65LKWHiSv9zi6os8hNj5Bbl6SOKuCNi174oT2l8BAXX6CG699cNEvOhewwQBweSvnq120pU+rEfEmXNn8YdIvRohR1Gfvpj+R/+ywiXgBl0PpboFofDrrSqgWt/DioqVwCsNXyO03V5e8yw1Ny9dey6YokNc+wlxSMwFzdO7iKvaU9j+H8p+Z4nayex5pHWijz/C/zcYtzUSHXwIOJDYykTbEISbGcGc57aYNdZGdQJ66+B3gyFVnadybgaIKfP2FzRlCUJl8y6qt33NUYnWmgS3hKr6Y1jiiiCrfwY+NS2UOlQuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by PH8PR11MB6779.namprd11.prod.outlook.com (2603:10b6:510:1ca::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Wed, 1 Oct
 2025 13:48:06 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f%3]) with mapi id 15.20.9160.017; Wed, 1 Oct 2025
 13:48:06 +0000
Date: Wed, 1 Oct 2025 16:47:58 +0300
From: Imre Deak <imre.deak@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>
CC: Vidya Srinivas <vidya.srinivas@intel.com>, Swati Sharma
 <swati2.sharma@intel.com>, Ville =?iso-8859-1?Q?Syrj=E4l=E4?=
 <ville.syrjala@linux.intel.com>, Jani Nikula <jani.nikula@intel.com>,
 <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v6 0/6] drm/i915/dp: Work around a DSC pixel throughput
 issue
Message-ID: <aN0xDp1AN85zzznP@ideak-desk>
References: <20250930182450.563016-1-imre.deak@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250930182450.563016-1-imre.deak@intel.com>
X-ClientProxiedBy: LO2P265CA0228.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:b::24) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|PH8PR11MB6779:EE_
X-MS-Office365-Filtering-Correlation-Id: a2031224-e7fb-43a8-e9e9-08de00f1259d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|376014|10070799003|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?/mvrG0wo/kL+CybybYpPAkmt2Ipsq3j9blJrYqD+s5dZsOynXlz52cl6g9?=
 =?iso-8859-1?Q?tugDWR8Dg5dDoakscYPXg5wBVGl9HPHT9vrlIONBZvMV9b74s0CSIZilJi?=
 =?iso-8859-1?Q?xZKK6t5A8wr4r8uEXKJ9L6O+z/P2WUecrDZ3QNVbQaHaZdMAObcwnfUIz+?=
 =?iso-8859-1?Q?5IsV1sxYqz9IYP9ZAsBqgwIniTFxUCUrGzbwtLFU5E2F5rxdEiiR/nK0wZ?=
 =?iso-8859-1?Q?R6kdUy5FIsSJ3/vQywV+mOohKXZYKsCA8fv8eSki0LJFbm518cCqdCp+LS?=
 =?iso-8859-1?Q?O8ZMuxkeE28o8qcuZJBKK5F0Y8U8nDbR9/NGQZXQFyz8pOEjKrxXGPs6Vd?=
 =?iso-8859-1?Q?4ktBwKkzVFJ95vgIAIjoxUCYgF1ZYoy/a0bMIAjT8Sf5jX7HUuyFjwXyKe?=
 =?iso-8859-1?Q?fIeDFDCGId3lvGDXafKWBdRc+VuHzclquBCVgjWjFJau/DLHkymPRkNKVR?=
 =?iso-8859-1?Q?Z79ibCypTXe+WDt24mTRdFePxfIPH8j5OuF68LQHC8yaGMfTfkB4wp871l?=
 =?iso-8859-1?Q?dT+YBp/ZRfPHTMGMHojItU4SPH2mQbvEQO+j35zhJwWjqd29B/Tvq3Hlv8?=
 =?iso-8859-1?Q?2d9xTZID1H2mOgcqAva3ivcGYh2IJ1Tjf2R0nO2gWO5wBOzVTOJI74A2Fj?=
 =?iso-8859-1?Q?o078yNOkeTrOmmfjl+kpmT/DZ47xd0S0d7eCbfD12Y4CLs9MrEH+52PLRM?=
 =?iso-8859-1?Q?GhUcOJXK7KxCGRrT4LAXpV5kmA9PMstDeqTEVbrzgBbI7c+rr3iCvhg8bU?=
 =?iso-8859-1?Q?gdxhjAwvJ8rI3RYk7KksC3XtxrzAqixbUdr3a9O1ENOnsHd8ypBS68igIX?=
 =?iso-8859-1?Q?HRw3yoFt6zvsMD741mEcKn2Io0Ey3ryJLT/S/VEcbaq9+9Zxg7ZxV0KDrn?=
 =?iso-8859-1?Q?rw1AN9LJqJ9Jay1FQUvZrKsMQKAwxaEU0Mt70af0tXsAh1rr7SvkF91f70?=
 =?iso-8859-1?Q?xm1DrA05Yn9yeA0LHsvLKbqP22iXcGdjNLh3Awb4a8s18Z2Qm1onBi9ajJ?=
 =?iso-8859-1?Q?TPfbQqP9Sfpfcv3WZ37nqkVi4q9Dcq2Mw4ua2Q8/WOFjbU02fdi/jyvkwM?=
 =?iso-8859-1?Q?aDtQuYVO8eGYS3grPB+C/l7qAsjve+29RQ9+e1X3wU/D6EOiXoEx6aMcxf?=
 =?iso-8859-1?Q?oHV40CZek3Rtpdp4ysoWYuOkcicCU//b5HyU0+jVdVoGyRh7KXDydNiZ/L?=
 =?iso-8859-1?Q?bL10f7wtUfYjaBRx4VuUeB+iGvb65+MLPKM0r2iNRWu5Pcpgloe31Jtw7i?=
 =?iso-8859-1?Q?XVNU+OY00O2EWKNO1cNH+XPytZlocUao0qzbbEr92kEsM4qTj0purVksLv?=
 =?iso-8859-1?Q?RFL6bFkBiChm7k0Ve88fVrLYTrGGj3oF05j+iaaZDivFZkgM+1tmEx72tV?=
 =?iso-8859-1?Q?qzdtnP4LsQTJFfokLCJvOFy8GTxSYQ8pxDV+i9CuzQCsJAPGmgIcJrBgw/?=
 =?iso-8859-1?Q?2kBYX8o2WAbp6B6BXhdzjuI/Qis9DAnv4qHSSCrrzVHzxFWUH/dgTa3t7P?=
 =?iso-8859-1?Q?zagJiTDbbXnEASezqA59gT/WIOGdcvbMmesaopA7SFkQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(10070799003)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?CacnszKElg6cgtCughbQQ/+/PWX0JbKsMTFDL4SE3UNSyMQEfYXD4zvjUs?=
 =?iso-8859-1?Q?Y3h5w7TGcE7Cc4fTtK0ODnV9sdp5G6hzYtroN2m+7AtihqbLS60PGvCq10?=
 =?iso-8859-1?Q?Eg0tRYZ88yeuzA/U9MEwPnaeE14anm0wccwpeAsIaPK4cDj4HVLg0yqPfs?=
 =?iso-8859-1?Q?cvgE6v9RokAO3T9RoxJIn1XkC+2FscYGFWq3O2T+2IiqqUIds9KlNyJJaQ?=
 =?iso-8859-1?Q?5hELfBm4L0qDK4uVEYH33FHkX9CO6jynAIL01aU+tgEJ175F7yow0iXx/O?=
 =?iso-8859-1?Q?2pXWbFSC4DdA4+UXntBMulMZxROvEisBzcFP5o/K2n1oGYT7/27n2EfeYU?=
 =?iso-8859-1?Q?8MsMhbqKQP7XlE7y7GouRHq95DaZwP66xVr6QherZOCnFfUArgxZ9md/cd?=
 =?iso-8859-1?Q?zPWNuTPxA5oy2lzUHkQWVH1E00K4Bx+y03TFFwGMoUEag8HYf0URv4e1C5?=
 =?iso-8859-1?Q?x7uKL/IRCyb8PwdRfslvUlnb194iUC4F13U4k95CvICiCfxb+yzJpH4p7A?=
 =?iso-8859-1?Q?jyvYsoNfFVOEhNVK++uvgc7lyitPs36S/+O+U+gdwmxLTg8Q897AR4MgyO?=
 =?iso-8859-1?Q?RfPJqEHCjIBQhUeB5K5l6X8214mw6OirEhd4hW8s3sdIgi69NVdIDrNTHh?=
 =?iso-8859-1?Q?zu4SWFYHaKdh7DePPdaORWayjnTTPdvFRXy+6d8mBNvFcPwT39IB36hoQq?=
 =?iso-8859-1?Q?ruG+BO3kNdSgOWV/v/ZrbZaNBo98RalSTNLmn2V1tTPk/obZM1e3d8HXpK?=
 =?iso-8859-1?Q?wZkwVTfDbo3srk8RrXEWXWJzZrkWb1/yUf3Ms4rn+tchIa/8JNLzkyRvha?=
 =?iso-8859-1?Q?3gfpD4DQaBFjq/1FausZqsrqNgLvLOqVGF2qVlDPJdyLupUwp17nOGjgmo?=
 =?iso-8859-1?Q?8+FdhkDXYYJaiBTg37TjlqWUZ97kY5WGPGdZB20cjqSfyeHbSzxsRHJoDi?=
 =?iso-8859-1?Q?danGboPSyGkj/FJyxNAhxl3JDQPGB612hPd0VAC4KKx9jW+pSnBc8wwO9h?=
 =?iso-8859-1?Q?mhFaHKDeJtDAbTXoVeD0qus1aIXRutdDM5DhOi6jQnyuPlhARF1uXz5wle?=
 =?iso-8859-1?Q?52lQDhtHX5fB83Fh+K1YnSxwdmSjzyFaAAphv0WFFq/LXNw/M65r1H/oLB?=
 =?iso-8859-1?Q?f56rUSCUs6Do8UfHm6lFmz66cFlpPAwTFw2B1QfriVE7of/vyBLeGVg1LH?=
 =?iso-8859-1?Q?Qd/WB4fPAaPyHNTSqMsIEFfedGigOPXqDb+Kf7GqSG9pgoZRJXdzeERsey?=
 =?iso-8859-1?Q?7jIUBMSUhNHKiIeUjbosxwzmYU5bslxa5NBJmXAWwK837MxSs8YYT+eO/y?=
 =?iso-8859-1?Q?i8SENxWaFg0aXXbIyNKCAaGKflEJYLmSswmeZESG8Ct8WsBP01a5Jvwwey?=
 =?iso-8859-1?Q?eyeJKqbnsSH+WUQf43YefWLixMA9TRl7JGUkiWK/TB3VhOeYEKCyo3CfKq?=
 =?iso-8859-1?Q?JrnCT/uaa+Bo+XKfktPQdur+dG0xtJFSheGID4MSX0YU7XGxFStSF/q69a?=
 =?iso-8859-1?Q?AGH5j2BcPHA5l5BZDE0EeuCelQ/6oIj3/LixEzhaRb74kJbdLmMeq4AYwo?=
 =?iso-8859-1?Q?+9udA+1lyGDbvr257GzEYhclFgFHjxSEq6PsfBqHYoX4DEt9cDXMM5kz9f?=
 =?iso-8859-1?Q?tUkOkE1qFwtOdM9h69PcoUMlsd+n5WsUZVWAl4Q1lCVe9IqQ5QNiLD8DRE?=
 =?iso-8859-1?Q?kCe8S0dRnQzltf2/gUlqaQ03OJlFqHDk1Jtu8aKE?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a2031224-e7fb-43a8-e9e9-08de00f1259d
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2025 13:48:06.0278 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MvjnPDGhnpDN6rqCErHUbIiodBbUrmdf3bQ4+ygJhNTucdW47glv3zda8E2XyIvgupv//9/f5LhSZvLwS5jC7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6779
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
Reply-To: imre.deak@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas, Maarten, Maxim,

could you ack merging this patchset via intel trees? Patch 1 and 2 has
changes in drm_dp_helper.c, but it would be good to fix the cases on
Intel HW where the affected docking stations are used.

Thanks,
Imre

On Tue, Sep 30, 2025 at 09:24:44PM +0300, Imre Deak wrote:
> This is v6 of [1], removing the unreachable default switch case in
> drm_dp_dsc_sink_max_slice_throughput() and adding the R-b and T-b tags
> from Ville and Swati.
> 
> Reported-by: Vidya Srinivas <vidya.srinivas@intel.com>
> Reported-by: Swati Sharma <swati2.sharma@intel.com>
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Cc: dri-devel@lists.freedesktop.org
> 
> [1] https://lore.kernel.org/all/20250926211236.474043-1-imre.deak@intel.com
> 
> Imre Deak (6):
>   drm/dp: Add quirk for Synaptics DSC throughput link-bpp limit
>   drm/dp: Add helpers to query the branch DSC max throughput/line-width
>   drm/i915/dp: Calculate DSC slice count based on per-slice peak
>     throughput
>   drm/i915/dp: Pass DPCD device descriptor to
>     intel_dp_get_dsc_sink_cap()
>   drm/i915/dp: Verify branch devices' overall pixel throughput/line
>     width
>   drm/i915/dp: Handle Synaptics DSC throughput link-bpp quirk
> 
>  drivers/gpu/drm/display/drm_dp_helper.c       | 156 ++++++++++++++++++
>  .../drm/i915/display/intel_display_types.h    |   9 +
>  drivers/gpu/drm/i915/display/intel_dp.c       | 146 ++++++++++++++--
>  drivers/gpu/drm/i915/display/intel_dp.h       |   5 +-
>  drivers/gpu/drm/i915/display/intel_dp_mst.c   |   9 +-
>  include/drm/display/drm_dp.h                  |   3 +
>  include/drm/display/drm_dp_helper.h           |  14 ++
>  7 files changed, 328 insertions(+), 14 deletions(-)
> 
> -- 
> 2.49.1
> 
