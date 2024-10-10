Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F82998705
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2024 15:02:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E387A10E2CA;
	Thu, 10 Oct 2024 13:02:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aM68kyIQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E1E110E2CA;
 Thu, 10 Oct 2024 13:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728565345; x=1760101345;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=bTjpdXB+Qq5lgbn/f0uigOIn9HFXa7XRMu+lzBK8JpM=;
 b=aM68kyIQzowbzkCMh2+x6YxokDd1Rjl5cCxEuHU5Le1dMDIxGi+Qx3dl
 tlmzupIBgrJq2cHysMWg6dnihT3jNDh34OuEkgW3m9IWRAOfrx6Bm92ri
 urlgGHPYqQe3rgne6r7nkdSxz9eg95KWLtY005jyrHZplQCY4OA5iU+eu
 3APBWw/IOI8rtudgopuJvmDNFoqj1AegVKWpSBMucR31qJf4kkPHp0s8n
 TNMQyNFvheTdZko4OgpW9b7Vw+7V7WJYMO1uRC+btoEjiblXy5EewOZg/
 VoklvMfcxx1oE+1z9MfNoiJdgbF/dKKCWm/riUZYBOVV+WfpONhroDC8g Q==;
X-CSE-ConnectionGUID: X1CPdqyXQqa/lb6TrBlYCA==
X-CSE-MsgGUID: e+BwN6hyTFGW+Jm8z2xcBw==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="38563102"
X-IronPort-AV: E=Sophos;i="6.11,193,1725346800"; d="scan'208";a="38563102"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2024 06:02:24 -0700
X-CSE-ConnectionGUID: RH+ybDXLQF+dSa/btv7p0w==
X-CSE-MsgGUID: R9XY52DMTiugB2ALa0M7cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,193,1725346800"; d="scan'208";a="76496062"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Oct 2024 06:02:24 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 10 Oct 2024 06:02:24 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 10 Oct 2024 06:02:23 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 10 Oct 2024 06:02:23 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.45) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 10 Oct 2024 06:02:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mQw0BcCl7vMQi9SuFwWWeV4BSP2IzS2JB0GYfffY+yUmGdDNBPdVnudQCxE0UGIUsmG4G5UXklw63TjIzNQiXwJ9GFKvzgyxgPC/6aPC6pHbVGRdplxrXNOx5/bVjL6OWbepiK9AEsr6Jb+Zb++wddzA2KaFPjGdVXwV/QL0g5wwOi1ZySFnj3H971UpEQ2zQxu4ufp2747jExNkNcbCRAL5nCf3g9PSxt3hXdGMcdT3FnkITv/ONWCB7HmtSyz+7Z0iTdr6bmiaIbjuG0A1zXZZWZWov2n/WwJVPnB8U4aK3WrOSsjfV9a/LLthxzFHk8x6ynPPLulZyOnRsgJeyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=86muV/MUABfnGPmF2d4XA0CnJHixew1cd2+lW6pymq8=;
 b=gvJkz/XXw+vYwlSFsKXNCxeOSsZbaB1KXhma+UrTaeu845yBOAJ4/66B1oGkUu2s3LwlW1mSoFXTFnefnElNoGcAxL4IS6C7ty+aA8hiWV2Rbuin08gEcJUjVxmaIYHP3kI7/jCc4Q5YCqFU8+bYyF4cHqtTwKcQBNqQFo+gV64vqDDS6MiIVZ5n+Joi8sima4JTPVGYUDqO2t2u+IitzBOMkEs0B6JozAlPI0dZ/3dqRG39wV4mlQAEHxGIvbkkluVsXTb09JPlHIN1d5KXOyeqvKF1ANXqRj7X9W+6rTW4ZNH1SOio95iuYni2eNhC6jdc684C1WT7Qis0GiujHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA0PR11MB4590.namprd11.prod.outlook.com (2603:10b6:806:96::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.18; Thu, 10 Oct
 2024 13:02:16 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8026.020; Thu, 10 Oct 2024
 13:02:16 +0000
Date: Thu, 10 Oct 2024 08:02:10 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: Michal Wajdeczko <michal.wajdeczko@intel.com>, <airlied@gmail.com>,
 <simona@ffwll.ch>, <thomas.hellstrom@linux.intel.com>,
 <rodrigo.vivi@intel.com>, <jani.nikula@linux.intel.com>,
 <andriy.shevchenko@linux.intel.com>, <joonas.lahtinen@linux.intel.com>,
 <tursulin@ursulin.net>, <lina@asahilina.net>,
 <intel-xe@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 <francois.dugast@intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <anshuman.gupta@intel.com>, <andi.shyti@linux.intel.com>,
 <matthew.d.roper@intel.com>
Subject: Re: [PATCH v7 1/5] drm: Introduce device wedged event
Message-ID: <ghawgrgfbochcupnbq52q4ep6l5rfj32i4wcnmykah3zxmehts@r5eaynm4vocf>
References: <20240930073845.347326-1-raag.jadav@intel.com>
 <20240930073845.347326-2-raag.jadav@intel.com>
 <26f90d12-6a04-445e-96ff-aafbe3dc8132@intel.com>
 <Zv6Ms7G4pSLdgUKo@black.fi.intel.com>
 <ZwVJk8ESEyxyemrG@black.fi.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <ZwVJk8ESEyxyemrG@black.fi.intel.com>
X-ClientProxiedBy: MW4PR03CA0255.namprd03.prod.outlook.com
 (2603:10b6:303:b4::20) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA0PR11MB4590:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a8d1d1c-afff-46d1-10eb-08dce92bc43e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?TcZqfwJncQxMEvOzP3Y5TZ+o4tAKpM5LtSPVVrjU1Etjt51v10mL+mFAx/uX?=
 =?us-ascii?Q?uLjAcpyr3vtHrBe3VnEWQ6PiGzW3y0QwqNyDG2p0X2VuFvzHOnoprb6FFTHs?=
 =?us-ascii?Q?aHjWiS5a8F2CNhtsQU3evwYPA0tDebSEilGh2NzO/Tkz9ZWZd+LBxXi2Rby7?=
 =?us-ascii?Q?6jVXQlM7uGp/nb2NOxFN5s1NeVyKUVL7SZAJbWOSS+Ud3PqgLplKTL9HgHfP?=
 =?us-ascii?Q?kB+yGbGIzdbXC97l/Px9wCN81nLLI1ZPqBEHo8K+xs+HUCOhWh9GEJjLR0oA?=
 =?us-ascii?Q?z0GWAAD15YRaWdkXcDMwp9QxCX25LVAik2Eb8++NT+63SZw6ESkmrLD8CJ8H?=
 =?us-ascii?Q?/dIPasUPhre+W9CtWk0Sd/P3F3g579Xu2pcvdrRbKW1Kx6qoq58FvOrIdQKk?=
 =?us-ascii?Q?Tpg2tgTnGs7lCAxnxbUMYLCypwaH+h7q+OfM2irONsF6fKQKz+X6jdev4tHa?=
 =?us-ascii?Q?0JB+yFzj1EpBw8jXDTq6c7v9oJVPhnjsc185Okk3WOAWapaof46PXHZDv0HB?=
 =?us-ascii?Q?lAZhdYATFj3m0Rp+Gx2trmDqDMorjvLkYJmYokyvoeluG/BJ0maCB2QUaX95?=
 =?us-ascii?Q?ewCTXUTcXoyaW+n52THjq2oMxu1nKrrRcUNoZHcReXyqZKkwwgwfho9PX63M?=
 =?us-ascii?Q?8RSKjzTHRcw8+U3h02N1+YOfMniE1R4Y7nazrhkGx0XqzTHYgqY+6227Crat?=
 =?us-ascii?Q?xcDIXVzqVfSZw2e5s7HVRm6JIzzhdS+/XD4amf4OYZ1O+OL8OzfVNZBAZDgz?=
 =?us-ascii?Q?r5EOlf8dTSKjJtVfeAzaY4OSbT8qylj74CCPh+wxtuKri6kF5Dbo61C4Hc+h?=
 =?us-ascii?Q?pL/pB/iIIJ1kMlli0F5cYvTaAuOdDqqtAuRGGS9zSSzl1oy0nPNsiZgOQDoi?=
 =?us-ascii?Q?xeIbiA4eU/xfgxutWianI+KEDtMSMXymI3gMjcujU/OGM6XJC5Crhy0COy/L?=
 =?us-ascii?Q?+LJubzH7LUHQj7yEiD//fmHpi1EYBJaeEEhnesb+5b96yzRj5WBLNIJ5F25u?=
 =?us-ascii?Q?sFBdpFyEr+jXTbZkeKtX0wxaxC4croBZU+QbtlVKjs4jDX72nsHt3bgg51Eu?=
 =?us-ascii?Q?tz/tQbH6lcOskzt901NJOjqKbmVX/2cvCFpzL4G7PUjQxcDSZLeBvCXn45d+?=
 =?us-ascii?Q?prsxlCxVEnOaWHl8BM6TJ+VzmYD5Uck6w9U0VpgiUo1E2Mxf0cg9sZmBp73k?=
 =?us-ascii?Q?u3CAhh1b/wxSMX7xvvAAiwDvoYyhHxWx2VjoN3hn4qRvIY39TThZo6oxy8Mm?=
 =?us-ascii?Q?BcN8gkHTrVTVFJp504xj6uBsAfZMAMM9Yp4AFyhgIw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pFB8+vjgHA/sKHRAgSp43e0LUgZro4o3yTyPJYwkfGbAkel/eYTBqGYqMuSF?=
 =?us-ascii?Q?X3U5zvx2gkCu3kPkpkQxCHkOLdOK03fMA6IYzK/sbLXaqVf4x0vpvqj4aP4/?=
 =?us-ascii?Q?ySoAK2tVly9N7vXTKFY40yDKcZDi07CdW0p3qNvtM7nWEYgwov7TUE4I6uGj?=
 =?us-ascii?Q?ddTho1un5OQ8Mv7kjfvtE9kjkbmd2wXzEpwLfZFaqDl4UQc2sCpies8ycPtY?=
 =?us-ascii?Q?VdZf9d+DXuRICsRD9uXzxyHkHTIUn5xRejpvNiR0GZzPICkpzUwo/7BhMeZV?=
 =?us-ascii?Q?bBSVRSPVrLohd8q0BpIxvkizSJALbMDIPJ5Hc++avHKNqEuk1JlPi8QsmWji?=
 =?us-ascii?Q?5SS8P2NFNZhqiEsBL1sKybW51UU+VoFdF0Z0BG27UtMKEakoWH1txZ0B0tBq?=
 =?us-ascii?Q?kwzYn06w2Jl/qdTPyz4ORKJ/v2bdvyXp19avfThf2uj3V5jI8WL/THQAZUXk?=
 =?us-ascii?Q?goeGUMG/Z+DpVwlLhliQTNERKpRmfvDKz2RNQQWBGw2xJfylTiSiTVHJNi5Z?=
 =?us-ascii?Q?qNtokeRC/qguyScPvA6zLImZD9y8hNxIFLdPekX6xCEUhO2OUmWd9lFaRkyX?=
 =?us-ascii?Q?9aXBUMQZCu1pLsFEmEhU+4l/nf7vVlP6O5E7U6CbDZqXJImRJDqMQ3GMNePX?=
 =?us-ascii?Q?xsSEDGjY1ghp60RLAW+OKEA1pSkCXIwQ3+HuS3gxdUwXJIAGtJUNv50Fy4zJ?=
 =?us-ascii?Q?b+40r4AnzQkOOGwJNRh+OG+muY6LYRLK+j8WvDdGDyv+k+dQyvWsuH6ckLJi?=
 =?us-ascii?Q?ERZfhu/TLYS4lfS3VQmPlg2EUyW12+Wh8Ay51WyB601xIuWi8gogSJD7HdBt?=
 =?us-ascii?Q?uwIR7DxI93dcbrwK4UBb4dC1Dj9c/OHMQpmcoveaDkkcReZrKpM2iVCQWiYp?=
 =?us-ascii?Q?ISEXjO/iow2/YPvZcm26rAMCzYoXnIe6SGD8tiCiXe9TpeIfiXK3o/8EgUsb?=
 =?us-ascii?Q?esABDPsOhx7CGUHdUw27eDCw6DWUcvmVJ88C9C7uMmepE6NYwg0MQTMsd+qP?=
 =?us-ascii?Q?qO4pA68cCHrVAqWImAnuHCpSdXS89eUec7afR1jo+7mC1UYvqho9MD2wzGW4?=
 =?us-ascii?Q?oqw0ISedTmanUpaFipGNJQ18eTaZiXHSZbom/anvxWOFVSHiSCYCPpmfwboy?=
 =?us-ascii?Q?WbhYo/Cn6EXzidmVzsnGD2wEO1EoSset5UEqG4TQ3hNC7ZDJd/fHby+AgXvk?=
 =?us-ascii?Q?dVJiy3mqePwxKM92PAR81eCt6y5hGu/97qgAOje7++fw00H/DYcx/9f0LrWx?=
 =?us-ascii?Q?HIGc+XLiIBR94ZKh6RnsCHBYYkpIGpS5EV3az1RlU9x2jJCUZmYJkBHUHavO?=
 =?us-ascii?Q?g9wuQglA8czy8oMy5SEXvL8p0sShsIaqrvST7k/ALnklg70HjWz29Ql+TtaV?=
 =?us-ascii?Q?hQO/zzNNKMK4/vHE2oO6zpjpWbNMsnVjsTOgl4RE/f/0t0qmgLzMCQdIzBXL?=
 =?us-ascii?Q?t8TWJKViWW1hkdg4kXWUYKzvptJRwLyX/gVLFodMyYUrJwzP2R2nHKwvSSxF?=
 =?us-ascii?Q?f0OHN6vDreBRSmcxrYtC1wfTj4oDV44luU49bT0BIUwSnN0YDj4dOIWF61tg?=
 =?us-ascii?Q?WrpTSc5vcvK7Gg4JIC+qCXYmhah9ca+5G1eJzCrKjlZ16s7JB6O6GJH9LyJC?=
 =?us-ascii?Q?bg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a8d1d1c-afff-46d1-10eb-08dce92bc43e
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2024 13:02:16.7232 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DOkrE7N4PQt8ZwpMjID/7Xbp1xYKhtg+ZyF5Agcq06Z5qZnOoQr30Q5i+uJcNbSJAQ+zp5G9GnjxVMBSbGDgTSOCvXNst0VGgHrC37KOqSY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4590
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

On Tue, Oct 08, 2024 at 06:02:43PM +0300, Raag Jadav wrote:
>On Thu, Oct 03, 2024 at 03:23:22PM +0300, Raag Jadav wrote:
>> On Tue, Oct 01, 2024 at 02:20:29PM +0200, Michal Wajdeczko wrote:
>> > On 30.09.2024 09:38, Raag Jadav wrote:
>> > >
>> > > +/**
>> > > + * enum drm_wedge_recovery - Recovery method for wedged device in order of
>> > > + * severity. To be set as bit fields in drm_device.wedge_recovery variable.
>> > > + * Drivers can choose to support any one or multiple of them depending on
>> > > + * their needs.
>> > > + */
>> > > +enum drm_wedge_recovery {
>> > > +	/** @DRM_WEDGE_RECOVERY_REBIND: unbind + rebind driver */
>> > > +	DRM_WEDGE_RECOVERY_REBIND,
>> > > +
>> > > +	/** @DRM_WEDGE_RECOVERY_BUS_RESET: unbind + reset bus device + rebind */
>> > > +	DRM_WEDGE_RECOVERY_BUS_RESET,
>> > > +
>> > > +	/** @DRM_WEDGE_RECOVERY_REBOOT: reboot system */
>> > > +	DRM_WEDGE_RECOVERY_REBOOT,
>> > > +
>> > > +	/** @DRM_WEDGE_RECOVERY_MAX: for bounds checking, do not use */
>> > > +	DRM_WEDGE_RECOVERY_MAX
>> > > +};
>> > > +
>> > >  /**
>> > >   * struct drm_device - DRM device structure
>> > >   *
>> > > @@ -317,6 +337,9 @@ struct drm_device {
>> > >  	 * Root directory for debugfs files.
>> > >  	 */
>> > >  	struct dentry *debugfs_root;
>> > > +
>> > > +	/** @wedge_recovery: Supported recovery methods for wedged device */
>> > > +	unsigned long wedge_recovery;
>> >
>> > hmm, so before the driver can ask for a reboot as a recovery method from
>> > wedge it has to somehow add 'reboot' as available method? why it that?
>>
>> It's for consumers to use as fallbacks in case the preferred recovery method
>> (sent along with uevent) don't workout. (patch 2/5)
>
>On second thought...
>
>Lucas, do we have a convincing enough usecase for fallback recovery?
>If <method> were to fail, I would expect there to be even bigger problems
>like kernel crash or unrecoverable hardware failure.
>
>At that point is it worth retrying?

when we were talking about this, I brought it up about allowing the
driver to inform what was the supported wedge recovery mechanisms
when the notification is sent. Not to be intended as fallback mechanism.

So if the driver sends a notification with:

	DRM_WEDGE_RECOVERY_REBIND | DRM_WEDGE_RECOVERY_BUS_RESET | DRM_WEDGE_RECOVERY_REBOOT

it means any of these would be suitable, with the first being the option
with less side-effect. I don't think we are advising userspace to use
fallback, just informing what the driver/device supports. Depending on
the error, the driver may leave only

	DRM_WEDGE_RECOVERY_REBOOT

That name could actually be DRM_WEDGE_RECOVERY_NONE. Because at that
state the driver doesn't really know what can be done to recover.
With that we can drop _MAX and use _NONE for bounding check. I think
we can also omit it in the notification as it's clear:

	WEDGED
	DRM_WEDGE_RECOVERY_REBIND | DRM_WEDGE_RECOVERY_BUS_RESET

This means the driver can use any of these options to recover

	WEDGED
	DRM_WEDGE_RECOVERY_BUS_RESET

only bus reset would fix it

	WEDGED
	
driver doesn't know anything that could fix it. It may be a soft-reboot,
hard-reboot, firmware flashing etc... We just don't know.

Lucas De Marchi
