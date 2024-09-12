Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D289976C82
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2024 16:46:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D98C310EBBC;
	Thu, 12 Sep 2024 14:46:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bGpvjjj2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDFAE10EBBA;
 Thu, 12 Sep 2024 14:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726152389; x=1757688389;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=8pe84znT0nb/1q4SV1nqO4B6hlEMbj4BxHaaH/vT5I0=;
 b=bGpvjjj2AAafAch0IS+9PImceBaLRUeLOiyDDAhW4FRaOjX0IISVg+7k
 /xFYfJo7fRu3PXwFFEr/WQU5/m3umm6J2vntWJgsN1LEad1tPHN5SrQrb
 IIzk7+Bni0q9R6qubRCLzAp/Lm9hTGLTShyxExzHXk4JwKmNdtGswJymR
 in7Vf4R8GJMtFR/4Y2tfwgHNTEI+xbP6yvcDYWgFlI8cDT2FxGn8Cch9g
 LnxHpvIAHxMhx2ru7w/cxiyb2eNpFpip3QsdR0nZKnnHJiPBNXq94qmCi
 m/iWdwalDqdO9n15qcqXcCUbfNxS5fSvw+reP1Fg7zYg4/nSg5GWgrqQ3 Q==;
X-CSE-ConnectionGUID: D7q8oS5uRkSn7bKVVh+dWw==
X-CSE-MsgGUID: wUJCBW3DQKCTrWs6j1gixw==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="24833362"
X-IronPort-AV: E=Sophos;i="6.10,223,1719903600"; d="scan'208";a="24833362"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2024 07:46:26 -0700
X-CSE-ConnectionGUID: v95Ig4znQQ2bGlpsGW2lpw==
X-CSE-MsgGUID: MZfqRFfFTuyb+2nd/YgxrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,223,1719903600"; d="scan'208";a="67985973"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Sep 2024 07:46:22 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 12 Sep 2024 07:46:19 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 12 Sep 2024 07:46:18 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 12 Sep 2024 07:46:18 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 12 Sep 2024 07:46:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CF9ohUByu84o+BtxpkWpd4yQL2zb4Rk0qRZwLe3eS9waTkfTSeRKaUVNo3sRDYH95HBtBo4YrZIuH8IKjEE8NJK4GNiEi6lQv68UvNdHZetbgJOBd9jNcTFT+UTdTcoz0FUOG5U0hFSGV+sg7xAKBTlorjV7HiOQP483dWoNMWyf14/CtzpAMFFUaPjaZjPTSbn4YNUS5zEUC+w2JPV9aTnrHKUhLCVQlOO2knxXdjhG3aHYIHnLZq36i5xo84YNeCj7LJKoAhoTa02LTH8jOYmOXFpp8JohHx9spEOn/zK14MbAoe5kAzqrIaTrl1d+SDhlgufNJs23+CG4ftRzTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UAt5wXaNUS+j18k9QIwiVu2kyq/4TP0oMIXQG2EDj60=;
 b=J2d/HozkD7b0TE8GWLL/HtkiFOk/M/jOFizJbt1+vJwPDARnprx7xLfbr+/AyiEKVPM6MBvIYKyOA9oLR6WHvZVOyPIFEVjXBMrArYnmjuJhnSxnTzD1jsM6RwCvjC0Md9cFt+lLTM4rvgoSrq/CtEqWNIpxtUW77eQ/6MXcW5UJq0IYUNeBA74+nq95Olj+PnKSc21xLid4IkW+9NyWWOSYoV+n+CnFSl31xDLYuFIc1nagUaEieQEv/qc1YVEdSOyx8Gl4ZcKvvQqP6WkMHI7qJM0M7NvJPwGTV+PauJR67z/fdhze9wMqoMeTBKbjUcGgQoGmGQSitATs/hY4hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by IA1PR11MB6241.namprd11.prod.outlook.com (2603:10b6:208:3e9::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.32; Thu, 12 Sep
 2024 14:46:15 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7918.024; Thu, 12 Sep 2024
 14:46:14 +0000
Date: Thu, 12 Sep 2024 10:46:08 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>
CC: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Oded Gabbay <ogabbay@kernel.org>, "Lucas
 De Marchi" <lucas.demarchi@intel.com>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <dim-tools@lists.freedesktop.org>
Subject: [PULL] drm-xe-fixes
Message-ID: <ZuL-sORu54zfz1Lf@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: MW4PR04CA0187.namprd04.prod.outlook.com
 (2603:10b6:303:86::12) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|IA1PR11MB6241:EE_
X-MS-Office365-Filtering-Correlation-Id: 889a881d-4bff-49ef-df52-08dcd339a6ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wbZ7WRXzkBgTtZ3QsZ4Tu+RpNaK1eDY6LIGetjJ1vpgYDDjc8ZwyQqvXeq4L?=
 =?us-ascii?Q?JHaOhY6AY1gj0mECX4yzpHK8wOUWRqEsYU732uDn3MqoiwLLe4TifJHdEZLr?=
 =?us-ascii?Q?Q8NB+sw8+S7wZuIlTU8LX4l8xfa4ljLMOS5q0M5jGBMSIIMIm6BzpLQx8fSG?=
 =?us-ascii?Q?/Ee21/phSZUIgKwKZLMcdVm2+XrkeP5P4wje1U8ldXT0+z/7NUjptBO1hbpf?=
 =?us-ascii?Q?HkG2BmI2TMoLIy+kjARhcZAJT6OMDYu/TAgQPcd5SujFkh+nl5pih+EvIXCF?=
 =?us-ascii?Q?FWDQnCa8pK7QOOkWQ9ooh8t4jLoDTWlsd0anGwjWNmUH/6V/6h0hWQbu57ar?=
 =?us-ascii?Q?cLkoSnhVTtmqM+STJ8sgtbC5UOVPzdPq+J5W4JlG0PiaK/lqIOqGS9pqShCF?=
 =?us-ascii?Q?GQ1MNn4cbBXFQE/Tl0rtrAcrVDCG4pmKjChTAYEc82htniWbEc4T7m4x7tiT?=
 =?us-ascii?Q?TplUdLEfJnEd4QpL6knUilDVke3GViY6TZbxFtuNk89q1eWHjJ+T553qvP2j?=
 =?us-ascii?Q?DrBbAs6wBCJxSIcZ9G0UoqPw2COQyUSt1sEQnWsjW5FsZSKvQKlDVerIVVaF?=
 =?us-ascii?Q?ivzBSXkgd7RJcyeCJVYmhNGcH7NjpCjSJ0AJ1Oucasv5VqmM5+f2J+H+Yk74?=
 =?us-ascii?Q?QzY6xhyDp5MzCDMY9FxpwQ4RHmXuU+iZEIaOtcVhEfL1ID9wKc+Zvqmo+Mi4?=
 =?us-ascii?Q?sR27Cnwc3zJ9XCQrUTXLHgxxr6TdwlE/So3xChMZaTAnSILToPlN7ANnV7i0?=
 =?us-ascii?Q?YxYOvxorU8rc5laTZFRaasOcjpy+UiYTOY4UU7VV0344kzPDHDVaPE1G4MpZ?=
 =?us-ascii?Q?dJyb7QVtHmCfZSGZQk5vDOu6V0OVg9IaSuICcYyd7OND8nFkI5V755n+0cIR?=
 =?us-ascii?Q?Pd4U8UDW0Nkh+vGUHYmwQZB3p59V2QEgZZcSpwiyNEdauDU3/YF9ED4AMHUa?=
 =?us-ascii?Q?6V16ivAC5nURV7W4BmRbiMxvAnX1JMN5n7FdaHezOWxsItqOUdSEvs5uh9AB?=
 =?us-ascii?Q?vtIV9R83HJZuc7tTXjxT30TCjgT3zBXNqfqy8ndfJEFOreAE6DFtGHxHtkAJ?=
 =?us-ascii?Q?7bBkntjjZgXpeWDindeA3jg+DPIdocgjuRryOE9sfZ8mGtqnAzi8STiQSyFm?=
 =?us-ascii?Q?sVGSiZdbHlauvw/wWKSTecbbCe18Nn6UQehel8muxY/B0rOSkP5/y5HoMDJM?=
 =?us-ascii?Q?T9I8GngRg7h3S0PUMOGib55pilw0lHhMnYOpzHrB1HvBgnQofVtgchLQJby/?=
 =?us-ascii?Q?Hd0x6o9rMUn3PLr9JXFst/votb1cURQm5vF2O+Mc1HiGvnLGan6TLNyevE6J?=
 =?us-ascii?Q?D08=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fskONG28B5YAT9qOE3dS0WvnOZ6HoZXsk5MRlq+0DkEfzYPSGpzJuOhtVslr?=
 =?us-ascii?Q?x2gh6LOJ4bH7OvFzGYjkc3X61uTjS5Cni9kzpL8teXtLeMwmvhK8Fi/fKySk?=
 =?us-ascii?Q?pQULdbbaOemg/QNUtUWgr4gKDjf8FQXOXy+c8NmXt/Sh/8NhnRE09/bXVUBd?=
 =?us-ascii?Q?dOQzQGZri2XzJoVj4LdSxgs1dxTTHYFjk/ishWi/SCsKHdPbCgXRXAdtpqkt?=
 =?us-ascii?Q?oGmcC7QVRZAQ56pfCFIBnEv+aesZ4/rJJln0EC+OzZx01CbxiW9vj9mNnWZ+?=
 =?us-ascii?Q?a5TEmvAv1AUKHdIjmiOyhNU4soLkWTvHN/MLowERXfbPezynlvD3o6nMG7NF?=
 =?us-ascii?Q?R5fAE+XmSEdsQc5Y3zRs3PsTymsn6IvdXa9+1V41FOAbjf7ic2DjRdiTObw9?=
 =?us-ascii?Q?BL2i404RN4BDxI8vpaJ55xyeYbX0tQO8cA+M9wRGKs3KkVoCNP7wkhRvG6/R?=
 =?us-ascii?Q?wR/qQkEWTiPzSFUYt2DkWKUrK79LcBSVdhSs5UQ8aPqQ1kbPs6/wLzmVcr9z?=
 =?us-ascii?Q?vlhEvv6TE2S1CiQGdx08woJXeICTgGuC4SQlAREs5JSZZ9SWmQeNzFpGH9D7?=
 =?us-ascii?Q?lGUsV53tCR30mabsVsz2bCIjVSbL5Qy/Io5hX8FkWZiGkJeWxj7Ait+Qv6nq?=
 =?us-ascii?Q?z0zZ72TR2LydhnqmeoYHLU8rUCyEkHZA2Y6ZATSdaKSVfHKU/30mjByHFvSX?=
 =?us-ascii?Q?C35fL4xDNbpFSo6UtviIcKL6TyVeVI14ZZvuwsb5pGANIKFexwEwbgR45Qe8?=
 =?us-ascii?Q?6BDokPzvDfSQuxiu9XhTsOnLfBJZqteKiVfm59I3ZwjhphzCgsmWl82Zxc01?=
 =?us-ascii?Q?593P0akV9sVlq3QGwvPH8jDZ8QmCVsKw/OrtTvlEyO5o/WXS+0UknJ3VAJac?=
 =?us-ascii?Q?kDTwttdhE0s+HtfHXl0skdJqASRa++iYOOUQoj2inssMpvl0X8yVeMDBxdyF?=
 =?us-ascii?Q?X0Se5QBbuMi6Jbl98cA/rq5lW/Yf2fGFB3Th5/YyAlz5pA7/wgEJSBHRqSOs?=
 =?us-ascii?Q?C6o3cWJnkN9dp2o9b2iYjhfKB/O9fK8Szsm2FZ3/zEtdRsmn61CvJqKIqNcI?=
 =?us-ascii?Q?LkV0qVJoekUS4fPFYqy8uvfV7I3oOmc/6RJ22xKR+wuppLooq8oFNgNqW7Cz?=
 =?us-ascii?Q?DVDtf8VdqSQw5JpHIQLkXDyZftVgQyv0hpbLoJ2BP3M887TUwn43gFEvftQD?=
 =?us-ascii?Q?WB2rl+eV1k7KlqjL65rV4vmuDFetly46QQp7oZ0WibVAJG40F8jtbCAx0Aic?=
 =?us-ascii?Q?qACmQ96hptd5DX9QwBmEsRzsk0GaoRotvp2sq841ALyT44GJBVEBobLXuVZ3?=
 =?us-ascii?Q?IeRZEOuYmrDikHzw50mU46d80bZpdEVbQpIS3fEzkK3pvfzy2c+FMaDMFsOY?=
 =?us-ascii?Q?/eGqeOP4CIOFro1DqWhxExLo2cxKI3LpqRzc32hwtrSqKqLeSGdQ4swMIQ8r?=
 =?us-ascii?Q?/glFGsm6tdDFtT2HVZsikzDNzGoBoW+chnAURnOC+faJ0YgyIOAl1mxqEVTP?=
 =?us-ascii?Q?fCmEJDmeJdd9YPZ9Tga/ZpjZmDQBVPfSHYloG10S0gRRBVWP32oxfhToR/yn?=
 =?us-ascii?Q?oBvqqUkrXUy8L4FFb7FeH5GaU//r91x8A9InKi1rW8g89+d6ih9ugXNnJsu8?=
 =?us-ascii?Q?4Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 889a881d-4bff-49ef-df52-08dcd339a6ef
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2024 14:46:14.9044 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ROQ8ynl8oXSABCzm5LSbnzwCjhbIxb1idMyYCu8lN9riIQeh/JfwYBF3XP9QRWiaUrv2UXJTSOge/t7ymRK7GQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6241
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

A bit more hetic that I was expecting for this week.
But important fixes.

While picking them up I had some conflicts on drm-tip
that I had to solve. Most of them just going with
entirely with the version in -next side.
Except the one that removes the double include,
which the resolution is to go with the next side,
but remote the duplicated include:

-#include <generated/xe_wa_oob.h>

Thanks,
Rodrigo.

drm-xe-fixes-2024-09-12:
- Remove a double include (Lucas)
- Fix null checks and UAF (Brost)
- Fix access_ok check in user_fence_create (Nirmoy)
- Fix compat IS_DISPLAY_STEP() range (Jani)
- OA fix (Ashutosh)
- Fixes in show_meminfo (Auld)

The following changes since commit da3ea35007d0af457a0afc87e84fddaebc4e0b63:

  Linux 6.11-rc7 (2024-09-08 14:50:28 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/xe/kernel.git tags/drm-xe-fixes-2024-09-12

for you to fetch changes up to 94c4aa266111262c96c98f822d1bccc494786fee:

  drm/xe/client: add missing bo locking in show_meminfo() (2024-09-12 10:07:22 -0400)

----------------------------------------------------------------
- Remove a double include (Lucas)
- Fix null checks and UAF (Brost)
- Fix access_ok check in user_fence_create (Nirmoy)
- Fix compat IS_DISPLAY_STEP() range (Jani)
- OA fix (Ashutosh)
- Fixes in show_meminfo (Auld)

----------------------------------------------------------------
Ashutosh Dixit (1):
      drm/xe/oa: Enable Xe2+ PES disaggregation

Jani Nikula (1):
      drm/xe/display: fix compat IS_DISPLAY_STEP() range end

Lucas De Marchi (1):
      drm/xe/gt: Remove double include

Matthew Auld (2):
      drm/xe/client: fix deadlock in show_meminfo()
      drm/xe/client: add missing bo locking in show_meminfo()

Matthew Brost (2):
      drm/xe: Remove fence check from send_tlb_invalidation
      drm/xe: Fix possible UAF in guc_exec_queue_process_msg

Nirmoy Das (1):
      drm/xe: Fix access_ok check in user_fence_create

 drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h |  2 +-
 drivers/gpu/drm/xe/regs/xe_oa_regs.h              |  1 +
 drivers/gpu/drm/xe/xe_drm_client.c                | 45 +++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_gt.c                        |  1 -
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c       |  4 +-
 drivers/gpu/drm/xe/xe_guc_submit.c                |  4 +-
 drivers/gpu/drm/xe/xe_oa.c                        |  4 ++
 drivers/gpu/drm/xe/xe_sync.c                      |  2 +-
 8 files changed, 53 insertions(+), 10 deletions(-)
