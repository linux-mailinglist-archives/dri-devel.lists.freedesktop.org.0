Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3CD2B41592
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 08:52:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2A1B10E17F;
	Wed,  3 Sep 2025 06:52:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YCuNnA/n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9FCC10E0DD;
 Wed,  3 Sep 2025 06:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756882335; x=1788418335;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=VL5+A49m7FBxFE3yMQFPXtdOA1CjoWoCRMkdZ1PL6WE=;
 b=YCuNnA/nI/faz7VD2wgvVjmsPeL1cvqlGDN34SU3qy+N0Cf97cuI/wzt
 onUxlp/19NbeOtbWxEJkxU52P/WRgZZUta7FYEYpSSb37bIK75dRJZs6J
 GRtZy+6Z4DleLX6vstZKaCNNMuOm+EMVXesEY/VCmiUjaOeEDNrXEuESj
 Riache97V9jHRLzctnU9JC3AyGafZaoikgFllxZyJS+sZiTJRnnCuueTr
 XI0C/za7Bu5u/YGEEZTUXrt1Olq6CIL0ZcGwc584k3DKrEaWIjBHBrSg5
 OuGg5XGCzJgAanGNng3ZQbqkYIBmFZhJzbXLQe+0+aR24Lvmn5RTN9T7D A==;
X-CSE-ConnectionGUID: Wtt0HpTXTb+kV8GzNPYEaA==
X-CSE-MsgGUID: JMQPbkZuTYKfBRU/K9B/VA==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="59251933"
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; d="scan'208";a="59251933"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 23:52:09 -0700
X-CSE-ConnectionGUID: Ap58EHGPTA2nkrVh5sK9vQ==
X-CSE-MsgGUID: 2N2n8M4OS1+2VBgj1/m11A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; d="scan'208";a="171878990"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 23:52:09 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 2 Sep 2025 23:52:08 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 2 Sep 2025 23:52:08 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.80)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 2 Sep 2025 23:52:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RZEhZMnPDO8PDJ/3Kb5owz9RRERbSik+twaf/Fib7zFJcSgm3Y1amYrEU82a+xZ2aTeI9mJLKGnKIk2LHaXRP9HaqtkUjGjgr84IlmYg2e+qEP4OwdPT13+rS6y0TF4LB3AmYI9ZcqyoqinUs53j8pv35bEnoVRDBDAnBKJcn1reL92aDFcfNl1itqQo+Xc393FnxRYyG8s3FBO2S+Abeb2gPYaYQdluDUVao8uOAHpwUtIrrXe0nXgAnR7lWNdsfa1DdLS+zj8MC+hrbptsnHEGzJfwT8D7CF9RYgwimUg0Xn8idrOeBIsjX5zWU8VpOxm9wkMOxk9BbbCRLtb24Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B/cr3OiLB6arJQQwWVC0KNqsIOND3jYaNjMywNywhaE=;
 b=n+Ob0s8RQgwAfCh6tQD4SDF+OG/CkG/gYfKDnweq9o7cp2Zi6vLYzOCjLEFBOhEhPxGacT/FgDtuL3is52lTN6FSvXrKtMyQr8xpH9228JnPydA4aIQV4du40hE3rPQjfQL9338vRY0q2ua7udIxNI8wn4Jy2nMBOcva8OLIsF5/LtC2O3Kc5//xQIhVv8/td2+8npnviQ2RyW2eXqZD5z4ECFXllcHuVg6L5dWzA5uFMNKB1Q/lhL6go8NJxxoMMkqMj9ulDoXjeNzx+ckuqxSl6AjYylRFQSkep3NtaLqQ8IJ9PhbNcdhCMMD30TNvlaFAuDRLkhAcI+BpCp3AAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by DS7PR11MB7888.namprd11.prod.outlook.com (2603:10b6:8:e6::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Wed, 3 Sep
 2025 06:52:06 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%4]) with mapi id 15.20.9073.026; Wed, 3 Sep 2025
 06:52:06 +0000
Message-ID: <d8513636-f616-4219-8e46-24376dca7b97@intel.com>
Date: Wed, 3 Sep 2025 12:22:00 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] drm/atomic: Return user readable error in
 atomic_ioctl
To: Jani Nikula <jani.nikula@linux.intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, <xaver.hugl@kde.org>, <harry.wentland@amd.com>,
 <uma.shankar@intel.com>
CC: <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>
References: <20250902-atomic-v4-0-a97b4bed969b@intel.com>
 <20250902-atomic-v4-3-a97b4bed969b@intel.com>
 <b7e82c4736145ccb8d9ba0e1381d7d2f89971563@intel.com>
Content-Language: en-US
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
In-Reply-To: <b7e82c4736145ccb8d9ba0e1381d7d2f89971563@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0027.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:178::15) To IA0PR11MB7307.namprd11.prod.outlook.com
 (2603:10b6:208:437::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7307:EE_|DS7PR11MB7888:EE_
X-MS-Office365-Filtering-Correlation-Id: fb4d6be2-5be4-45ef-61cc-08ddeab6651a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZEE1STkreXFBWkFFZGc3QURvUGlYV0FyQ0JnL1V4bjVaUTRBTFZOMC9WblpH?=
 =?utf-8?B?ZlBxMUlNck9lUG5sQzg0VGVDRUdSSjNZSUxQb3JsSUxPOHlDMUVmWGcvWS9X?=
 =?utf-8?B?Z3djclRSUFptbXhNRUpSV2ZUaGRRNmNsUkJLTy9ReFRsRndtRE5QUUI1d3RE?=
 =?utf-8?B?KzFxN2hkWWRubjlqb0oxd1R1bENMMWNLQnJpbHd0KzRpOXRjdE1hd2RoMWw0?=
 =?utf-8?B?U2ZHdldUcWlTREJVd3c1WUZlWGtQZ2xlODJ4bklUcm45NGVlN3htVU1iYWov?=
 =?utf-8?B?dGNFMUw5SVNybFo4MFBvTElEOVpzbmE5Mkp6eU94Ly9VVmZHczdKMXBzZW9y?=
 =?utf-8?B?R2NHbFBpWStvVjA0cmRtSUZjWFl2dXJWUWdDVnRlZDE1cmMwWHQ5dmhZVDVu?=
 =?utf-8?B?OGhNUmxqYkY0TW1ZcnlOWE9XcnlJNFZsc21PZ0tETit4Tjg1aGZvMHNIbWpU?=
 =?utf-8?B?SkxZZHBoYkV3N1dhVnNPSU5BUENObXdXT1JHaGhOS0lqWHQ5RzNLcVk4U0w1?=
 =?utf-8?B?Ritlc09zRzhrYWV3TVRBZUJhNU9NejhjNTFORjhOT3dwVWMwV3hQZlZRS1lj?=
 =?utf-8?B?SnZSWjFvNm1HNVhYeFU3d0Q2M0tCMVNTeHd6M245RjdwZVBqTG5yQW9JeDNJ?=
 =?utf-8?B?YXNaR2wvTUhKUjEwK21PMng1ZktxOFJ1d1Ixa3RsbTN0STdrS09zL1hUQ0tJ?=
 =?utf-8?B?RGJmTFhQcGgxcG1Odm5UbjdxaEw2VjZiejh6MFRqYUpvL2tSTmxCTUpHM2tK?=
 =?utf-8?B?b1Z0YkFxRlBQWW0reDdMMWF0NlJyL2xlNEo3UmgrTDhDT0s0N284dDNQRGlB?=
 =?utf-8?B?bGkrMUdiRW83R1IvSy9XMGh4REJoOHhxeTF2KzRLZklTTVhFbFQ2a1RFQkJF?=
 =?utf-8?B?NE9GS2xhQ2NBK25OSlZTQzBSTStZaHZLQ0ZZY0Z2cTBJa1lncXFLcmMzdkJR?=
 =?utf-8?B?Znh4UWRxRDRFUm1CZjBRY0JWV3RPTk1XSzZuMzFUSkt1azRNamkyRDF6V1FY?=
 =?utf-8?B?YzVnRWVRbEFWL3Nnc3ZwNmM4Ymp4RkgvTDlISUhhaUNBT2E2NlBmcHJYRnU3?=
 =?utf-8?B?bzc2aDdOdU9YWDdMUEFjdDZUUmVaVCtnbUpLbU1ZNklBZk1LR3Y1QWprTE9x?=
 =?utf-8?B?K3VuakZMZ09ONzZUYlVMejZFcEdTZ3E3UnM0V3J3N0MvTG9Za21rRGlLNE9Z?=
 =?utf-8?B?UEJTVjJUbFdPZGpJTzdyVWRmRlZ1Wk5ZZE9MY2l2ZURuQkJCYzA1UXJCZGpS?=
 =?utf-8?B?Q3JkdjVNQU01WE0zZDlZMUVJWmlGcDJIVi9MakFwT2htTldXdzRHRzB1dEZH?=
 =?utf-8?B?bDIxNHRKR0ltWU1MWjQ4V3BxTVh2MWY5SmZjdmFVOWpnTE5SUkt5THdHZVYz?=
 =?utf-8?B?a29DK1hGZGpQOSttMDhrZDFGV2w4dlNZQzlVcXQ3RnBiM1ZuUGdZalVTaDlO?=
 =?utf-8?B?b3A4NzVyVW01b2tnd2M5NmE5TVE5aENGNGFEelhFa1QycklRRUluMmNyWlMr?=
 =?utf-8?B?cmhkTjVIQjJIOWlEMlUrYWd6a1A5VkNDR2dDRnpScjFacUZYL2FXOWwzdXVW?=
 =?utf-8?B?VjV0MVZ6ZjBWbWJJeWZ3U1RSOWllKzhmV3ZSenVFY0NWTTMzL0p4OVp1SSto?=
 =?utf-8?B?TlgwN013QTZ6b1Z1VmhNRjY1Ly9VeE1RcEdjWWtpMHVrSHFVZkhjZWRYSXB0?=
 =?utf-8?B?RUtibVVmTlorV1NoWTB4QmNFblQ2OXJGbytqLytTZUt2UklKbHRsemh0SXRJ?=
 =?utf-8?B?MWUrN0U5VGVPcVhGazhNMElBYnpxcTVtb0JGRUJuNnBwTVJMdEFaTHdVUGtW?=
 =?utf-8?B?NXZUVFJYT3NTSnR5c0Q2VmhhU2RPOEVuRi9HUE9FSkRoZE5uYnlmeWhQNk9t?=
 =?utf-8?B?aE5Pd2tRVnJMTENMT0hrY1piV2Z4eXFjWmdMVGtIaFRpOFRPUUVuM05KSXBS?=
 =?utf-8?B?WVJjUkRZSXcrWFZzdmwxMTNuUkdTYTRCNnRtTHMybUptL1ZjdHc4eW1qdU5F?=
 =?utf-8?B?STFJcWlnaTJ3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RmpMWGxpNHpjT3FjalRmcFVYNVhpNjZGLy9GMjN2dGJGTWVSS2lJOERxTEpx?=
 =?utf-8?B?Mm0yd1lzMmdtaEVlUnY3QXZ0MmhpcHRORmRxbzNjdUtEUFFRQm82eXptQ0Vs?=
 =?utf-8?B?UWcweThybFJXdGEvd3hvOHR4d05Ka09Pd3I2bUxMTnNIenduM0V2SVdoQzgy?=
 =?utf-8?B?MjJFdTlnY2UwYnJqY2VzT2VWaGtrNXExQy9ORE5DcGswNCs2Qk91SHBDYlp3?=
 =?utf-8?B?Y2FjN3I4bHNXMTBQcTFlT0tmSW1COTJXdVp1cWU2YkxUTUduSXNJNHZzS0cy?=
 =?utf-8?B?RUtIeExJbGJNREZDaG5EakI1UE5XOGpvL2tHTDFTdHlRRDZoYUsrQ1d3MzZr?=
 =?utf-8?B?WERLVVNOUU1OMnlZdHArd0UzRXJPSEtkSXh1aEVxR2VNWUlMaDZ3SUZxb0ZU?=
 =?utf-8?B?b3RCQWxybWtpUmRBS283MEpBb1BLeEh4MTBHWXdsbXZSVnV0TWw1Nkoya3Rp?=
 =?utf-8?B?c0JjenVhUGVPR045Rzc3dWpBR0VFMXRYY2c5bUVBOE5qaUg0dlk3K1JVV0cz?=
 =?utf-8?B?Tm5scHlTTCtndnFndVFuU1JLbzh0T0lnL29PNFhpaFlNNjFmOUZMcmFFVUF4?=
 =?utf-8?B?dDBYMGl6S0puWXJpakNkSVE0NVdTSEU5OTJlaUpnUUtHOWN0cEU0SGRRS0hh?=
 =?utf-8?B?RVZzUjRmc2swYTlFSU9YV1FteW4vM2hLNWJuQS90L1JkMDJpMGwwTUd0TlhR?=
 =?utf-8?B?aDM3cHlLWTg4dWVpTGQyRkE0ZWhyYzNwV3lkMWFZWnRVWHhIc2lCM0tiSGNs?=
 =?utf-8?B?RXc2TmlwRGFtN0grUjF4aEVvSS9oc0tpUkt6ZkI3ZFFxQXJ2eHZrd0F3SUxq?=
 =?utf-8?B?ZHF4SGdjSGxDU1pyMHNQNm0xaVMrZzBwRDV4L3hhMk5mVVhlcGE2MXhMVExL?=
 =?utf-8?B?WGpza043R1U2c2htWTJPNjhPQlFDNS9rVTZzeVlCcVhRQzR4Rkk3dFM4ZC94?=
 =?utf-8?B?UlVlaElCQmRPLzlPWUdFQ2dUZ0lCdndWVStreGVoMlp3LzBuMitURDVqa2p4?=
 =?utf-8?B?Y201KzFKNnNuTGVCUktwOTF5cDRmS2FFWm1LdGxoTU43YnAwRmp2WUxmUEJq?=
 =?utf-8?B?RkJ2VG1FTm9IckpscDR3M1VzdW1WN1ZJTEs3RmxyekJHOTZxWTRVZWcrRVR3?=
 =?utf-8?B?eXcrMmI0MmFiNjBNaGZuWXdRVDU2bFdqeWJZaHU1R1dsdHVGV1pRMG5GZERn?=
 =?utf-8?B?bUx1eHd5a3E3Q25PVzhtbmJtNUNUUkNHcUczNHN6eGJEUnhpRGUySU1PWU9N?=
 =?utf-8?B?eGhmYWFIUU10ZWFPN3VRWEtxY3FMcWdaeG1WK3liT2N3dEc3WFEyUEJHcUlL?=
 =?utf-8?B?eExmeVRTVXpxU3p0SDZYV0lsOUhlNE1pbGlqTXVJY1BhMmpibTc3elQ2MEVJ?=
 =?utf-8?B?aG8vRjl2VE1mblIxMXdRYlFCaWl2dTRVMzJRY1lvQVkvZ1NSY0RYVk9qYUF4?=
 =?utf-8?B?U0VLOFk3Rm15WWU0RmhVTEtGNHlPZzdZNlZuWmZWR0hpYXlubUJoT2VhYzN0?=
 =?utf-8?B?RzZvclhub0ZPb29TMlB3WEdjempDa0pncVB5SVBoQ29Iak44VzVDSDAvazNv?=
 =?utf-8?B?QkR3aGFvQWE2WEpCZXRING9VRlA1TU43QXFPN05kdlUra2xjQjUrUWJCM1cr?=
 =?utf-8?B?SDg5VE1VU3YwN3V6b0lxcjFkc3FuRUw0N3E1UnpCU0lETTV3QkhMd0N2RDRN?=
 =?utf-8?B?dzZOcHRKRWh1c21kRUdFRExhVTAyRGE4Y0tmUnBGcU9MT1FpbTZHbWtEK1Jh?=
 =?utf-8?B?dENiYnlDdjFZWjlpejJabXNjMjBDUTNma0x1NkR5d1N2U3JNVzlrSy9LSWZV?=
 =?utf-8?B?cFhtTUhNUWZqckY3Sm9UcExmc2FISnIrdnN6Uk95Mi9sbmlldDRXUVlUbjBG?=
 =?utf-8?B?bEFTTGxLcFYzMk1SbEFpcml6cDJFQUNya2ZwbDZxRkNmcVlnaWxTeU9tdFFn?=
 =?utf-8?B?ZzRTL0cyLzhKQjlUSEpkclRMV1lmbVRpcmRtTUZzejRRRG1hYmRROG0xREk2?=
 =?utf-8?B?Zjk1YWI5dDRxaVJRSEdrSWV1YVY3dy9FVC9ab2JtNytRMkQzbUQzSnFjWVlp?=
 =?utf-8?B?MzNRZVlla2MwRmZDVjRoVWJnNmVyQUhFK0Qvc3VHaGlQUGZjZjd4d09CNTRB?=
 =?utf-8?Q?XcA1yWwdWDLTrPhakdN7ZolUa?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fb4d6be2-5be4-45ef-61cc-08ddeab6651a
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2025 06:52:05.9259 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NxDVRFBvKvPH6rZtUns/XeFIjR7yZPONIgqau902z8rfL9qPk52MS+7G03rBfcreqjW4Th06jnpVm8UoerseoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7888
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

On 02-09-2025 15:46, Jani Nikula wrote:
> On Tue, 02 Sep 2025, Arun R Murthy <arun.r.murthy@intel.com> wrote:
>> Add user readable error codes for failure cases in drm_atomic_ioctl() so
>> that user can decode the error code and take corrective measurements.
>>
>> Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
>> ---
>>   drivers/gpu/drm/drm_atomic.c      | 23 +++++++----
>>   drivers/gpu/drm/drm_atomic_uapi.c | 83 ++++++++++++++++++++++++++++++---------
>>   include/drm/drm_atomic.h          | 19 +++++++++
>>   3 files changed, 100 insertions(+), 25 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
>> index cd15cf52f0c9144711da5879da57884674aea9e4..4f6c7e659b362f0887ffcc85dade1122fd30df3d 100644
>> --- a/drivers/gpu/drm/drm_atomic.c
>> +++ b/drivers/gpu/drm/drm_atomic.c
>> @@ -1463,6 +1463,7 @@ int drm_atomic_check_only(struct drm_atomic_state *state)
>>   	unsigned int requested_crtc = 0;
>>   	unsigned int affected_crtc = 0;
>>   	int i, ret = 0;
>> +	char *err_string;
>>   
>>   	drm_dbg_atomic(dev, "checking %p\n", state);
>>   
>> @@ -1511,8 +1512,13 @@ int drm_atomic_check_only(struct drm_atomic_state *state)
>>   	if (!state->allow_modeset) {
>>   		for_each_new_crtc_in_state(state, crtc, new_crtc_state, i) {
>>   			if (drm_atomic_crtc_needs_modeset(new_crtc_state)) {
>> -				drm_dbg_atomic(dev, "[CRTC:%d:%s] requires full modeset\n",
>> -					       crtc->base.id, crtc->name);
>> +				err_string = "requires full modeset";
> This points a non-const pointer to const data.
>
> Anyway none of this should require or start a precendent of using local
> variables all over the place for the error strings. It's ugly. Ditto
> below for all the places.
>
> If all the places calling drm_mode_atomic_add_error_msg() do debug
> logging, maybe that's where the debug logging should be?
>
>> +				drm_dbg_atomic(dev, "[CRTC:%d:%s] %s\n",
>> +					       crtc->base.id, crtc->name, err_string);
>> +				drm_mode_atomic_add_error_msg(state->error_code,
>> +							      DRM_MODE_ATOMIC_CRTC_NEED_FULL_MODESET,
>> +							      err_string);
> I guess you didn't want to follow what Maarten suggested.
Yes, felt so, as adding a new function doesnt make much sense just for 
filling the struct drm_mode_atomic_err_code.

Will remove this function and fill the struct drm_mode_atomic_err_code 
in place, thereby the below comment also should be handled.

Thanks and Regards,
Arun R Murthy
-------------------

>
>> +
>>   				return -EINVAL;
> Adding the return is a functional change, and I mentioned it
> earlier. Ignoring review is one of the certain ways to stop receiving
> review in the future.
Will take it out of this series.
>>   			}
>>   		}
>> @@ -1534,11 +1540,14 @@ int drm_atomic_check_only(struct drm_atomic_state *state)
>>   	 * so compositors know what's going on.
>>   	 */
>>   	if (affected_crtc != requested_crtc) {
>> -		drm_dbg_atomic(dev,
>> -			       "driver added CRTC to commit: requested 0x%x, affected 0x%0x\n",
>> -			       requested_crtc, affected_crtc);
>> -		WARN(!state->allow_modeset, "adding CRTC not allowed without modesets: requested 0x%x, affected 0x%0x\n",
>> -		     requested_crtc, affected_crtc);
>> +		err_string = "adding CRTC not allowed without modesets";
>> +		drm_dbg_atomic(dev, "%s: requested 0x%x, affected 0x%0x\n",
>> +			       err_string, requested_crtc, affected_crtc);
>> +		drm_mode_atomic_add_error_msg(state->error_code,
>> +					      DRM_MODE_ATOMIC_NEED_FULL_MODESET,
>> +					      err_string);
>> +
>> +		return -EINVAL;
> Adding the return is a functional change, and I mentioned it earlier.
Will take it out of this series.
>
>>   	}
>>   
>>   	return 0;
>> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
>> index 85dbdaa4a2e25878c953b9b41539c8566d55c6d9..60f1b8baebce0db1ce984c8cda56039261b519e8 100644
>> --- a/drivers/gpu/drm/drm_atomic_uapi.c
>> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
>> @@ -1017,6 +1017,7 @@ int drm_atomic_set_property(struct drm_atomic_state *state,
>>   	struct drm_mode_object *ref;
>>   	u64 old_val;
>>   	int ret;
>> +	char *err_string;
>>   
>>   	if (!drm_property_change_valid_get(prop, prop_value, &ref))
>>   		return -EINVAL;
>> @@ -1058,6 +1059,12 @@ int drm_atomic_set_property(struct drm_atomic_state *state,
>>   			ret = drm_atomic_crtc_get_property(crtc, crtc_state,
>>   							   prop, &old_val);
>>   			ret = drm_atomic_check_prop_changes(ret, old_val, prop_value, prop);
>> +			if (ret) {
>> +				err_string = "property change not allowed in async flip";
>> +				drm_mode_atomic_add_error_msg(state->error_code,
>> +							      DRM_MODE_ATOMIC_ASYNC_PROP_CHANGED,
>> +							      err_string);
>> +			}
>>   			break;
>>   		}
>>   
>> @@ -1096,9 +1103,14 @@ int drm_atomic_set_property(struct drm_atomic_state *state,
>>   					ret = plane_funcs->atomic_async_check(plane, state, true);
>>   
>>   				if (ret) {
>> +					err_string = "plane does not support async flip";
>> +					drm_mode_atomic_add_error_msg(state->error_code,
>> +								      DRM_MODE_ATOMIC_ASYNC_NOT_SUPP_PLANE,
>> +								      err_string);
>>   					drm_dbg_atomic(prop->dev,
>> -						       "[PLANE:%d:%s] does not support async flips\n",
>> -						       obj->id, plane->name);
>> +							"[PLANE:%d:%s] %s\n",
>> +						       obj->id, plane->name,
>> +						       err_string);
>>   					break;
>>   				}
>>   			}
>> @@ -1390,42 +1402,63 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
>>   	uint32_t __user *props_ptr = (uint32_t __user *)(unsigned long)(arg->props_ptr);
>>   	uint64_t __user *prop_values_ptr = (uint64_t __user *)(unsigned long)(arg->prop_values_ptr);
>>   	unsigned int copied_objs, copied_props;
>> -	struct drm_atomic_state *state;
>> +	struct drm_atomic_state *state = NULL;
> Unrelated change.
Noted!
>
>>   	struct drm_modeset_acquire_ctx ctx;
>>   	struct drm_out_fence_state *fence_state;
>> +	struct drm_mode_atomic_err_code error_code;
>> +	struct drm_mode_atomic_err_code __user *error_code_ptr;
>>   	int ret = 0;
>>   	unsigned int i, j, num_fences;
>>   	bool async_flip = false;
>> +	char *err_string;
>>   
>>   	/* disallow for drivers not supporting atomic: */
>>   	if (!drm_core_check_feature(dev, DRIVER_ATOMIC))
>>   		return -EOPNOTSUPP;
>>   
>> +	if (!arg->reserved)
>> +		drm_err(dev, "memory not allocated for drm_atomic error reporting\n");
>> +	else
>> +		/* update the error code if any error to allow user handling it */
>> +		error_code_ptr = (struct drm_mode_atomic_err_code __user *)
>> +				 (unsigned long)arg->reserved;
>> +
>> +	memset(&error_code, 0, sizeof(struct drm_mode_atomic_err_code));
>> +
>>   	/* disallow for userspace that has not enabled atomic cap (even
>>   	 * though this may be a bit overkill, since legacy userspace
>>   	 * wouldn't know how to call this ioctl)
>>   	 */
>>   	if (!file_priv->atomic) {
>> +		err_string = "DRM_ATOMIC capability not enabled";
> Yeah, just repeating, don't start using this err_string local variable
> idea.
>
>>   		drm_dbg_atomic(dev,
>> -			       "commit failed: atomic cap not enabled\n");
>> -		return -EINVAL;
>> +			       "commit failed: %s\n", err_string);
>> +		drm_mode_atomic_add_error_msg(&error_code,
>> +					      DRM_MODE_ATOMIC_INVALID_API_USAGE,
>> +					      err_string);
>> +		ret = -EINVAL;
>> +		goto out;
>>   	}
>>   
>>   	if (arg->flags & ~DRM_MODE_ATOMIC_FLAGS) {
>> -		drm_dbg_atomic(dev, "commit failed: invalid flag\n");
>> -		return -EINVAL;
>> -	}
>> -
>> -	if (arg->reserved) {
>> -		drm_dbg_atomic(dev, "commit failed: reserved field set\n");
>> -		return -EINVAL;
>> +		err_string = "invalid flag";
>> +		drm_dbg_atomic(dev, "commit failed: %s\n", err_string);
>> +		drm_mode_atomic_add_error_msg(&error_code,
>> +					      DRM_MODE_ATOMIC_INVALID_API_USAGE,
>> +					      err_string);
>> +		ret = -EINVAL;
>> +		goto out;
>>   	}
>>   
>>   	if (arg->flags & DRM_MODE_PAGE_FLIP_ASYNC) {
>>   		if (!dev->mode_config.async_page_flip) {
>> -			drm_dbg_atomic(dev,
>> -				       "commit failed: DRM_MODE_PAGE_FLIP_ASYNC not supported\n");
>> -			return -EINVAL;
>> +			err_string = "DRM_MODE_PAGE_FLIP_ASYNC not supported with ATOMIC ioctl";
>> +			drm_dbg_atomic(dev, "commit failed: %s\n", err_string);
>> +			drm_mode_atomic_add_error_msg(&error_code,
>> +						      DRM_MODE_ATOMIC_INVALID_API_USAGE,
>> +						      err_string);
>> +			ret = -EINVAL;
>> +			goto out;
>>   		}
>>   
>>   		async_flip = true;
>> @@ -1434,9 +1467,13 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
>>   	/* can't test and expect an event at the same time. */
>>   	if ((arg->flags & DRM_MODE_ATOMIC_TEST_ONLY) &&
>>   			(arg->flags & DRM_MODE_PAGE_FLIP_EVENT)) {
>> -		drm_dbg_atomic(dev,
>> -			       "commit failed: page-flip event requested with test-only commit\n");
>> -		return -EINVAL;
>> +		err_string = "page-flip event requested with test-only commit";
>> +		drm_dbg_atomic(dev, "commit failed: %s\n", err_string);
>> +		drm_mode_atomic_add_error_msg(&error_code,
>> +					      DRM_MODE_ATOMIC_INVALID_API_USAGE,
>> +					      err_string);
>> +		ret = -EINVAL;
>> +		goto out;
>>   	}
>>   
>>   	state = drm_atomic_state_alloc(dev);
>> @@ -1447,6 +1484,8 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
>>   	state->acquire_ctx = &ctx;
>>   	state->allow_modeset = !!(arg->flags & DRM_MODE_ATOMIC_ALLOW_MODESET);
>>   
>> +	state->error_code = &error_code;
>> +
>>   retry:
>>   	copied_objs = 0;
>>   	copied_props = 0;
>> @@ -1543,6 +1582,14 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
>>   	}
>>   
>>   out:
>> +	/* update the error code if any error to allow user handling it */
>> +	if (ret < 0 && arg->reserved)
>> +		if (copy_to_user(error_code_ptr, &error_code, sizeof(error_code)))
>> +			return -EFAULT;
>> +
>> +	if (!state)
>> +		return ret;
>> +
>>   	complete_signaling(dev, state, fence_state, num_fences, !ret);
>>   
>>   	if (ret == -EDEADLK) {
>> diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
>> index d380001b24b4223baa54dae6c3c43e19dfb1958d..8956b175795128422eefc2bc047b320b80aedc3f 100644
>> --- a/include/drm/drm_atomic.h
>> +++ b/include/drm/drm_atomic.h
>> @@ -1255,4 +1255,23 @@ struct drm_bridge_state *
>>   drm_atomic_get_new_bridge_state(const struct drm_atomic_state *state,
>>   				struct drm_bridge *bridge);
>>   
>> +/**
>> + * drm_mode_atomic_add_error_msg - function to add error code and error string
>> + *
>> + * @err_code: pointer to struct drm_mode_atomic_err_code that stores the failure
>> + *	      reason
>> + * @failure_code: failure code in enum drm_mode_atomic_failure_codes
>> + * @failure_string: failure reason string message
>> + *
>> + * Returns: void
>> + */
>> +static inline void drm_mode_atomic_add_error_msg(struct drm_mode_atomic_err_code *err_code,
>> +						 __u64 failure_code,
>> +						 char *failure_string)
> So this should be "const char *format, ..." with printf format, with
> printf format annotation, to help callers pass in other stuff than just
> fixed strings.
>
> This should be a proper function instead of static inline.
>
>> +{
>> +	err_code->failure_code = failure_code;
>> +	strscpy_pad(err_code->failure_string, failure_string,
>> +		    strlen(err_code->failure_string));
> If the size is fixed, why do we just silently truncate the string? If
> the message is for the user, it'll be ugly to emit truncated strings.
>
>> +}
>> +
>>   #endif /* DRM_ATOMIC_H_ */
