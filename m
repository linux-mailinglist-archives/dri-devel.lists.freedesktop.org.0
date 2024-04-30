Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 002188B8125
	for <lists+dri-devel@lfdr.de>; Tue, 30 Apr 2024 22:07:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41C62112ED4;
	Tue, 30 Apr 2024 20:07:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BW/SExVR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AF6D112ED0;
 Tue, 30 Apr 2024 20:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714507644; x=1746043644;
 h=date:from:to:cc:subject:message-id:
 content-transfer-encoding:mime-version;
 bh=lZlj1d0gPmmTCRGDJDjmprC30hlBWfaRnO7Yml16peU=;
 b=BW/SExVRi/7H4ReTwU5707ieFsffrKhlX4LdxTaO0Qr9TKLsKuiMZ9ti
 pUPGoP/aJG3gOdacv3ohVk/aUig8US3/XpdLlps21cDwXiKabY958UrLO
 CGX/7za92shmxC4OJV/mMwXZwHIBkgfAMaDK6cl3Hwwb7qnYHjJbfMRJK
 +ArYpMg4cCEybigeDtegojj8BjT/yFF9Q49ohUlSNLtv1QrdUDJJTBtmd
 zbeSPB9WfcWLiRASx+YUjzz2OYgQYUq9SE3kkotF5JMUV4flRiNM1X8S/
 7zs0GEKKl12bA2oIwhMLqvcPrvfGpUq8h3OIZlsYkC+IzoOo4kFqkX9LA w==;
X-CSE-ConnectionGUID: bqO4TwywRYSJlGtKt+Ue8Q==
X-CSE-MsgGUID: g9AaCnuUQkOMB1r/8703KQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11060"; a="10064953"
X-IronPort-AV: E=Sophos;i="6.07,243,1708416000"; d="scan'208";a="10064953"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2024 13:07:23 -0700
X-CSE-ConnectionGUID: Hq5fuzQ5Q3uqzgR9kJ8DEg==
X-CSE-MsgGUID: y5ZIOzzuQjC8Ao8Igod3xQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,243,1708416000"; d="scan'208";a="57459901"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Apr 2024 13:07:23 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 30 Apr 2024 13:07:22 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 30 Apr 2024 13:07:22 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 30 Apr 2024 13:07:22 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 30 Apr 2024 13:07:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kWXiI2b8MCpaqNcSz3DiHukDOPd3UKlJTXwmwaT8mmemFUf5q8X+GTnx7k6H0OoQiF0gQDCGI/FbEFqh0+TOMje99xmEDkFpO97UqFIHOn27XS2itsNkRac7WMO9lsDW4emZyA5keHUN/Iu7mjUL8kR17oF7jLyo7/faoWbTb940M8MEjN9sqoH/uwma2iobc3vcWyTPlf1fUGoxAj51BjN8UCnDb7zjoqfgoRcDTNy17qlFfBcGwv9fWFrVuV3Py/K/80VnAORyGWmGxZ6hMCSuegVv5WvudLkYlQq+MuMwWWWZdsEso/k9BNCNE9q7UFu17U9t8exuLrSDGxYOHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eci98TEEYIX2Vfamk1QdmN6g23n0+asWlFtGRCdEVPY=;
 b=nKxS5azKuFfrLMwU/hjYApfRAUtErB3QJRW2z6vlVOBnSrXcBe/ZZG5hv6pqCDx1S7OIp3oKGzzKIk6e4kwH48MixfHlGKzhhTzZThGkjBmGsxkZOgoYjoi1q52yLWn4GUQi/YrkT9kFLLBu8O0v8U5Dp++21jw7rXJW3MgekBW6/Zs3sudZfl6OmCbgrHIav5ij6YOxYSf3J2ILb1gvUMgIucqgelRf7I4PJPHFx6aZAyBQH+szhPQmbMOX/HxUf6kkspUi+re9NBRHbBZyVZraEq1YuZGi25Ra+jdInb/GxGZnqI2uDg5BWPiRa8dCA25Fxq2pmw9HzriCC/dUKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DM4PR11MB5230.namprd11.prod.outlook.com (2603:10b6:5:39a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.36; Tue, 30 Apr
 2024 20:07:19 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7519.031; Tue, 30 Apr 2024
 20:07:18 +0000
Date: Tue, 30 Apr 2024 16:07:13 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
CC: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Oded Gabbay <ogabbay@kernel.org>, "Lucas
 De Marchi" <lucas.demarchi@intel.com>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <dim-tools@lists.freedesktop.org>
Subject: [PULL] drm-intel-next
Message-ID: <ZjFPcSCTd_5c0XU_@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0156.namprd04.prod.outlook.com
 (2603:10b6:303:85::11) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DM4PR11MB5230:EE_
X-MS-Office365-Filtering-Correlation-Id: a9d19e54-17b5-473f-fd6a-08dc69512363
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|7416005|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?yliJUdn5t82UU6UGjyDOi03BCNKvBUFAW2QHClAFcrVCqyvhOqanVXlEP9?=
 =?iso-8859-1?Q?Zwv2gxPF3vlpsWnoBi1pVWRwYhJFB9lTSCga860ze7zuEs7kRWNUQqa92+?=
 =?iso-8859-1?Q?cM7fuzZhBr5zzCEhQcwQOV0ehl9LwWGFJRC+h8DNKViluXNNVMYUMx1/y8?=
 =?iso-8859-1?Q?g9+xXVc8DDa55I2j7uOH6l0GWhqJnyHZfKHiaDxmNFsZE2+nZdMSyJMMpI?=
 =?iso-8859-1?Q?xAOvjHCSPNe8M2fKRMZD//P+p8leyZAlgHX3u8R+xuwxLKMgqRGyIZiR25?=
 =?iso-8859-1?Q?NtJ4xLPHVX4js1qZB8Gct31n1IMDbFe788GtTgUM+NITXvql/gI3o42Dqx?=
 =?iso-8859-1?Q?wBWLuzl7h2/FZcS7irjzFAqb6nKNLD4U2pmoVFgW+3hwzRKW5A+zPnIk0G?=
 =?iso-8859-1?Q?TXrd+TUDL3YH41MaY/NLYu2WngJ6X2sicrwi9kbfGNZTRWOWztlyB8jE4p?=
 =?iso-8859-1?Q?sGwsrNI0XNeG8Yc5lYRNyd5yaR124HPLJVdvk7FTl1lOzZKgyQ4jpsEeYV?=
 =?iso-8859-1?Q?+XIXUN1vh6Gbsk5GqnAIUVImiWonYCap/IBJJNAdDNMHyo0ZRuLLHXsYoe?=
 =?iso-8859-1?Q?5gWMs2CXrT8IsZymYcRFmo3CP4JgpHAXNRduysbEvY3kCVEs3bLGl4smfC?=
 =?iso-8859-1?Q?F3D05v5Pt9/WMoJm3Ixswafg6u5IDCe/Fv5meuFYPSk5vNQN4CY0NpkJoe?=
 =?iso-8859-1?Q?QEgKkJU8GBmjqKg/bnPh3PVL1tf0pj6h88q7hJQiEHL5mtXUkCB4YxLFfm?=
 =?iso-8859-1?Q?V2QaG04aJsGA0SwIkkEPmad3QeIM/SEvA4ZtVBaT3MPKLVplSzcsD9aHio?=
 =?iso-8859-1?Q?Ety99mxovU5dWxyWFAKBfLYgC18jHwtpXtndtw9qwVbK7M+SjxG4bsLReP?=
 =?iso-8859-1?Q?iOARxFuOsLZAo0pRYm4rQ/N2+OQ4JDyEnTI2/lmSyjTyZqKmM74dzirx+r?=
 =?iso-8859-1?Q?/hKyU1eXyz6RC6k810ovnN3HvKfU7HL2FLXAuTEcRPXY0+AVILle4Z8uji?=
 =?iso-8859-1?Q?snPMhn6QLl6LIVa0C48Hm6u9V91GoX4s4Khqijmwpkg8nyBQ4WXueeWw8w?=
 =?iso-8859-1?Q?d5vAIPx3VHRiGuzPo2Pidj5weVrte5hK6q37NRx5WAWmsFUpLa0GMbbtx4?=
 =?iso-8859-1?Q?7gBgwCD2vNrOwyjSJpbVaTgbMP9z4iTF0pGHr3GHQs9FG+6FHCqbK4tl9S?=
 =?iso-8859-1?Q?Iv4fpsLSwBRpmVutt97S9VMLbBxMRt+LYVNQLl5eeoj0vwFHDpQKDT+s51?=
 =?iso-8859-1?Q?qUuKyRL1ZebjKVDNmcdQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(7416005)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?/Sz2uiXRyzUg95/6NA5TY9EXAmghshleRMffCijLsozApThHqaJjB+sRLi?=
 =?iso-8859-1?Q?cqobS49SzqcOkFbRoQt8zJ99hNM9K5G1PxezEcXEuFtJF2j+kmHj+xV9hy?=
 =?iso-8859-1?Q?5mvtSfT22qtgXJHTGFDI4zZmu6FOvvD+eUXhNLpszSRCR3dJE8xov0HpEV?=
 =?iso-8859-1?Q?k4HQH6Dvxkg/ST1aGv9OBFByyyvzBFVDqe/Bm0unZL+eVVPJMyKAy3rdBW?=
 =?iso-8859-1?Q?FzkBrvGtooXJEFq9BnnbPzsmOKXeeCvdjAB/WZ7YNmyDrxqQMyZHWr6fgn?=
 =?iso-8859-1?Q?zfPjYCEd4eetIqU9gIkGX572RauXNVuQlWdJzMjV1iV0wrtUT/Q0/+kSXi?=
 =?iso-8859-1?Q?AMUGfcrV4obMn+GcNGxqt905yJ8rKGrRJmAy/o9mXKxoxp6UBqkk6Vsi/r?=
 =?iso-8859-1?Q?FaXQdrnebzinJzbMrXAjXzHE5S66GOjR1YWbwGFGtZbQQzB/1EdQ02Gqlr?=
 =?iso-8859-1?Q?ABrQxZRp/FoSTkXkECMZ7QcvM1W4HAlB729e1o7nJLBSM6KAJVOqW/UmM8?=
 =?iso-8859-1?Q?g6zv1XGpuK+Ko/qGGca+fbA4A3rnh+KmP4+w4OnmoJzAWQNY+u/9bTiSeh?=
 =?iso-8859-1?Q?QU8XrBCjheRCyvv5xtpHOs2hywb8U+6f4JLG5CHppcDUDHEZ8SXRzahdsH?=
 =?iso-8859-1?Q?hkX+QiJvv4eKsF5dxfNA5WJ6trj1CUd2ct+cHYM/+8ZKzo1A9RImjuNQlx?=
 =?iso-8859-1?Q?wrese4o15u88vT4uAEImqKwtGbEQsC8eI9btmBR/db5bczg0kBI4/jW/0F?=
 =?iso-8859-1?Q?LvREaeC/RkBSoP6mIRNsKFNYf1+ZBT9LDzBtsvdvpIa22FXmnjMlY5ma8d?=
 =?iso-8859-1?Q?GrDxkVhhMDGyfluOJRwEIGpVdfQjbIQ5lbW1+ns2l9d0X1CRdvtOx6SD4u?=
 =?iso-8859-1?Q?gf8G0F2ovUETVhPsrxfHnWQqUC8kBk1fXWySPxM/pLgXnbdvBciJeqPeTT?=
 =?iso-8859-1?Q?6DQtlM4Q/hR+UuteymJq6TrjITed8umCxzwdckBu9ry8Tm8+2zozLIPkRc?=
 =?iso-8859-1?Q?1mmTWP5QJomoHUXYFV7fHVgMziunUGvzq64oxp72S8pIV8BH1SJ2lvFz1k?=
 =?iso-8859-1?Q?N1+dfb6mrJG0lsMg7rrJZL9DI3RxoCMU/MDp9lg6EiLda0DApbANpQDO2y?=
 =?iso-8859-1?Q?QYUn+91TIAqskeRkQmztqu7bHFLCPvdHGaeqSNbMltH+/aXV2EbriOiuzk?=
 =?iso-8859-1?Q?3Dxgi/viweVlxtOiK8AEKh8GLiiU7YoFUxylRBggeuNy6iOgjav+h1zJRi?=
 =?iso-8859-1?Q?7anpRVMc6NLRwCEBJzJopXGMv7vQ+lFAQgq41359Wc3qYcf/cMnjAIgyPs?=
 =?iso-8859-1?Q?4bk9YlTlH9POipkhpNBGJpjwPK2ULeeNaJzLJyaPj25gjmBE/KS804XNDD?=
 =?iso-8859-1?Q?FG/fRGMssUGioL6ZBPla/YvkMLZjPwVempi7x1D9RYq1ujyH+fHVaTQnUG?=
 =?iso-8859-1?Q?f5A6lN4KQNyE1JBkYuslhOl/jjjRTHkKQx0LtF5zj2oexWqnp6VZpU/xDA?=
 =?iso-8859-1?Q?Tj7qn7Aky2doDab7K5vBrqnTpMBV5v3zkV49XdaqKoSFe8BkKzP7ayT2E2?=
 =?iso-8859-1?Q?6sVrSdHzijVEa0TrQ94TrTC4or7dOQJHa2AFGQUobNArm3RhQd6+8e37JT?=
 =?iso-8859-1?Q?CGta79FaPmwOKTADJa6UcgyDAFM6phyqF0?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a9d19e54-17b5-473f-fd6a-08dc69512363
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2024 20:07:18.8780 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rEewJZTRZjeEQTFsLbjQWBQTQTDlYhzWkgL65gcY6SP7qF18FS+pG+FCts1E6IVhCPRmo+lhbF3p0DazYbRE/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5230
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

Here goes one extra, and really the last one targeting 6.10.

We have decided to do this extra one so we could include the
good clean-up on i915/xe's fbdev work done by Thomas Zimmermann.
And it looks like he has more work on top of that, so it would
be good to propagate this initial one sooner and sync our trees.

Thanks,
Rodrigo.

drm-intel-next-2024-04-30:
Core DRM:
- Export drm_client_dev_unregister (Thomas Zimmermann)

Display i915:
- More initial work to make display code more independent from i915 (Jani)
- Convert i915/xe fbdev to DRM client (Thomas Zimmermann)
- VLV/CHV DPIO register cleanup (Ville)
The following changes since commit 6068bc209ac8d07a5d04e93f168465195e22a4cc:

  drm/i915/dsi: pass display to register macros instead of implicit variable (2024-04-23 17:00:14 +0300)

are available in the Git repository at:

  https://anongit.freedesktop.org/git/drm/drm-intel tags/drm-intel-next-2024-04-30

for you to fetch changes up to 6f1923f54d77942376f47d05b08cddca19fc397f:

  drm/i915/dpio: Extract vlv_dpio_phy_regs.h (2024-04-30 21:20:52 +0300)

----------------------------------------------------------------
Core DRM:
- Export drm_client_dev_unregister (Thomas Zimmermann)

Display i915:
- More initial work to make display code more independent from i915 (Jani)
- Convert i915/xe fbdev to DRM client (Thomas Zimmermann)
- VLV/CHV DPIO register cleanup (Ville)

----------------------------------------------------------------
Jani Nikula (13):
      drm/i915: convert _MMIO_PIPE3()/_MMIO_PORT3() to accept base
      drm/i915: pass dev_priv to _MMIO_PIPE2, _MMIO_TRANS2, _MMIO_CURSOR2
      drm/i915/audio: move LPE audio regs to intel_audio_regs.h
      drm/i915/color: move palette registers to intel_color_regs.h
      drm/i915/display: split out intel_fbc_regs.h from i915_reg.h
      drm/i915/display: split out intel_sprite_regs.h from i915_reg.h
      drm/i915: pass dev_priv explicitly to PALETTE
      drm/i915: pass dev_priv explicitly to PIPE_WGC_C01_C00
      drm/i915: pass dev_priv explicitly to PIPE_WGC_C02
      drm/i915: pass dev_priv explicitly to PIPE_WGC_C11_C10
      drm/i915: pass dev_priv explicitly to PIPE_WGC_C12
      drm/i915: pass dev_priv explicitly to PIPE_WGC_C21_C20
      drm/i915: pass dev_priv explicitly to PIPE_WGC_C22

Thomas Zimmermann (6):
      drm/client: Export drm_client_dev_unregister()
      drm/i915: Move fbdev functions
      drm/i915: Initialize fbdev DRM client with callback functions
      drm/{i915,xe}: Unregister in-kernel clients
      drm/{i915,xe}: Implement fbdev client callbacks
      drm/{i915, xe}: Implement fbdev emulation as in-kernel client

Ville Syrjälä (14):
      drm/i915/dpio: Remove pointless VLV_PCS01_DW8 read
      drm/i915/dpio: s/VLV_REF_DW13/VLV_REF_DW11/
      drm/i915/dpio: s/VLV_PLL_DW9_BCAST/VLV_PCS_DW17_BCAST/
      drm/i915/dpio: Fix VLV DPIO PLL register dword numbering
      drm/i915/dpio: Remove pointless variables from vlv/chv DPLL code
      drm/i915/dpio: Rename some variables
      drm/i915/dpio: s/port/ch/
      drm/i915/dpio: s/pipe/ch/
      drm/i915/dpio: Derive the phy from the port rather than pipe in encoder hooks
      drm/i915/dpio: Give VLV DPIO group register a clearer name
      drm/i915/dpio: Rename a few CHV DPIO PHY registers
      drm/i915/dpio: Clean up VLV/CHV DPIO PHY register defines
      drm/i915/dpio: Clean up the vlv/chv PHY register bits
      drm/i915/dpio: Extract vlv_dpio_phy_regs.h

 drivers/gpu/drm/drm_client.c                       |   13 +
 drivers/gpu/drm/i915/display/intel_audio_regs.h    |   16 +
 drivers/gpu/drm/i915/display/intel_color.c         |   53 +-
 drivers/gpu/drm/i915/display/intel_color_regs.h    |   42 +-
 drivers/gpu/drm/i915/display/intel_display.c       |    2 +-
 .../gpu/drm/i915/display/intel_display_driver.c    |   24 +-
 .../drm/i915/display/intel_display_power_well.c    |   16 +-
 .../gpu/drm/i915/display/intel_display_reg_defs.h  |   22 +-
 drivers/gpu/drm/i915/display/intel_dpio_phy.c      |  148 ++-
 drivers/gpu/drm/i915/display/intel_dpll.c          |  262 +++--
 drivers/gpu/drm/i915/display/intel_fbc.c           |    1 +
 drivers/gpu/drm/i915/display/intel_fbc_regs.h      |  120 +++
 drivers/gpu/drm/i915/display/intel_fbdev.c         |  265 ++---
 drivers/gpu/drm/i915/display/intel_fbdev.h         |   29 +-
 drivers/gpu/drm/i915/display/intel_lpe_audio.c     |    2 +-
 drivers/gpu/drm/i915/display/intel_psr_regs.h      |   38 +-
 drivers/gpu/drm/i915/display/intel_sprite.c        |    1 +
 drivers/gpu/drm/i915/display/intel_sprite_regs.h   |  348 ++++++
 drivers/gpu/drm/i915/display/vlv_dpio_phy_regs.h   |  309 ++++++
 drivers/gpu/drm/i915/gt/intel_workarounds.c        |    2 +
 drivers/gpu/drm/i915/gvt/cmd_parser.c              |    1 +
 drivers/gpu/drm/i915/gvt/display.c                 |    1 +
 drivers/gpu/drm/i915/gvt/fb_decoder.c              |    5 +-
 drivers/gpu/drm/i915/gvt/handlers.c                |    1 +
 drivers/gpu/drm/i915/i915_driver.c                 |   22 -
 drivers/gpu/drm/i915/i915_reg.h                    | 1104 +++-----------------
 drivers/gpu/drm/i915/intel_clock_gating.c          |    1 +
 drivers/gpu/drm/i915/intel_gvt_mmio_table.c        |    2 +
 drivers/gpu/drm/i915/vlv_sideband.c                |    1 -
 drivers/gpu/drm/xe/display/xe_display.c            |   11 -
 drivers/gpu/drm/xe/xe_device.c                     |    1 +
 31 files changed, 1406 insertions(+), 1457 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/display/intel_fbc_regs.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_sprite_regs.h
 create mode 100644 drivers/gpu/drm/i915/display/vlv_dpio_phy_regs.h
