Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 386EEBD27F7
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 12:16:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFF2D10E423;
	Mon, 13 Oct 2025 10:16:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ebjv6ZLa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0876710E45D;
 Mon, 13 Oct 2025 10:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760350573; x=1791886573;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=syg1j8/mJelQ8QQY2dsJnlCDnlIyXaE+9wLvRKYn3l8=;
 b=Ebjv6ZLaZqw+6XU8AolLzXedIt59UuP9/ZgOYvI3BFyGOXLy0JnBFsSO
 IcbdNmnRuRCxoWuHLta3y2xHuCQ62Bf1STBPfZjTEbRL7Fq85P8bz3cON
 CrcsRwwNKcB1ZEyg1V2gIHWjAuuUwy7SKaDBH/RlqHsZVLwCVu48QfUcn
 m1APZL9iNRFBM43pNo9as0WOdgPZk3Vmbded5HkdXnEz3Mx1itzJdLwxN
 Xlrbof0RYuIclh0TLJzT1JGBaQznWsUR3sl8iKGWMI1jEUFq3ammS3ruW
 kRVhdv9L6RZFY9rrOZpvDlk6g0X7FPk3MJD5jtH3KE61yxRCSlEsm8eM4 w==;
X-CSE-ConnectionGUID: M415fRDKRRuAc+99yFqD8g==
X-CSE-MsgGUID: UnfVq2uKSd2n8sRc7GxH4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11580"; a="73169734"
X-IronPort-AV: E=Sophos;i="6.19,225,1754982000"; d="scan'208";a="73169734"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 03:16:12 -0700
X-CSE-ConnectionGUID: E38CtapcQf+wzvCwn39+ow==
X-CSE-MsgGUID: vO3F8HrfThiYgjICbMNN5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,225,1754982000"; d="scan'208";a="182321593"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 03:16:12 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 13 Oct 2025 03:16:12 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 13 Oct 2025 03:16:12 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.23) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 13 Oct 2025 03:16:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A5dIcYnkceeV0Oef+RxLov53a2erwQpThGhCTCOb/oN8jK18Tm+4bQcQt3+/bMhLKa8zVTDRTvgRPAUKoOZP1CgjgQRK9/+p/JILZxuqindEoZTcXVx79i9xpRiqYA1nQFViCq1BhqyFDycnk4gfepKPN2daPhJR73Wfg0ob6bFmM1PHZM4H788cfEGJ+OblimEKGHAf6fsHmdpFoML6U0nCf/cK253RcDONscjUhbhFTqYN+ZbTuTsBODMoW4KxSuw5yaj2E/NiVRlgDqBxBJfM3yYRF5gCmOxPi8rMg4riQFn8CM/kSI4HTfiG3GQb37LYdPQKQb8RuIJw0lKoJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vAVc0wCEwS+AHurijaMPDAHHeVnCMPkd/1+gZ2gXYRU=;
 b=BwFBRvXbpWOjSZgo8YqAX28G+HPkcUb+B+fIyP6je2tdrHd2KoY/CpNpGlVvUYk9KXFpFoksJN4v6JeKlnG8xzLiYQKOgZRIlF/3fR89fD4pHX4iu4uSbICgcE9spEGupqRkyKqepFpboRDQf9S6JHSpk/rxMq7NqNYKXmrkL9DpTCP3XdvFCatg3tfHYZqztUexsrTuRiZY+Nz/0lkI+YiVf9GY0KF2SfUqfWNPI1B99rXz7GhlgeYu9+m2JGdpdta0PdMrZped1VNGMoeBzpq/ntKXAb3zOKX2T5pLYLd+LGPUxEXkCScWxswb/LZw2oY38OCam6wUTftkikSOnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by CY8PR11MB7034.namprd11.prod.outlook.com (2603:10b6:930:52::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Mon, 13 Oct
 2025 10:16:03 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 10:16:03 +0000
Message-ID: <8ce3bccc-a65a-48bd-b7ad-7f2599f1d3bb@intel.com>
Date: Mon, 13 Oct 2025 12:15:55 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/26] drm/xe/pf: Add helpers for migration data
 allocation / free
To: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>, "Alex
 Williamson" <alex.williamson@redhat.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, =?UTF-8?Q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, Shameer Kolothum
 <shameerali.kolothum.thodi@huawei.com>, <intel-xe@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <kvm@vger.kernel.org>
CC: <dri-devel@lists.freedesktop.org>, Matthew Brost
 <matthew.brost@intel.com>, Jani Nikula <jani.nikula@linux.intel.com>, "Joonas
 Lahtinen" <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Lukasz Laguna <lukasz.laguna@intel.com>
References: <20251011193847.1836454-1-michal.winiarski@intel.com>
 <20251011193847.1836454-7-michal.winiarski@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251011193847.1836454-7-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1P190CA0018.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:802:2b::31) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|CY8PR11MB7034:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b3bb163-e29c-41dd-f730-08de0a41837d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|366016|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M2IvUEZwdTl4b1FVZWdZYmNrQXRERFRrU0ZDUGVJc0dLVkpNeFdKV0ZwcFFL?=
 =?utf-8?B?YTF1Qmhob1RQa3IyYmFsSEVHRm9LNXZXay9qdTErYnQ4TnZ0MGVRUFZwa2FX?=
 =?utf-8?B?UnZ2UGprcldGN01qMWoxamhkRG1ZNUp4UHFFWWJ0RnBZSmpOdUJKa3pDVnFB?=
 =?utf-8?B?ekpObHExZzQxWXp0a3ZlR0lYM0ZIUkJpeWR5bE1USWVCUjZEbG1YZlJpU2lH?=
 =?utf-8?B?TGVNbWRpWXBpQjNTQThpME9YQTVBeS80UVR6bzB3NTN1RjZ3OVQ2dXJxN2F4?=
 =?utf-8?B?VzJwWVlGYjZSQjYyMU4zcUlaN0QvSjlJekRJQ0t6TUw3amltVWh3OXFtcDB5?=
 =?utf-8?B?REIzZ0plekh2SlFSUEZIdEU3blI0OFdRMGRodWhQeG1wSFYrUm1VMnVkdGQ2?=
 =?utf-8?B?MGVTT1VwNzJpbEM5SmdGLzVvcDFVVXoxRXFpWmk3Z2VubWh4S0YzNzV0MTNs?=
 =?utf-8?B?dDl1a0Z1WnBkZTdkdDJQOWtFcUE0TmdJTVN0NU9MdUNrUktuMkVXTWFPczYx?=
 =?utf-8?B?OUQwMmxId3pmMkpSZTZGYmpvSExrSGNOL1hHUFovTFljVjZZcG5xNEd3a2to?=
 =?utf-8?B?K1V2ZTFmb2R6U1hQMzBpcy9zOFhXY0t0eitrcWJWREFDRVdhdWw1TU0wdmxn?=
 =?utf-8?B?a0pYajIrd1RHTTV2OEVrazlhNWloSXRPcFpON0s3LzhkUjF6cU8zWmdvTVlz?=
 =?utf-8?B?YS92NE9qQ2NvemNpQkZUU0t2UDB3bE1TWUxuS2ZZbFhjRFJuZmdzUGc4TEdy?=
 =?utf-8?B?cVRZSVBmMWhaRVVGREZpR2J6YjAzVlhvTVgra3pNVWYrdjBYSlNsZjNYVkRa?=
 =?utf-8?B?ZmtCRnZLYlFEVkNTSm56SmkyaW5YeUtzN0x4azhJQ2lIQVRkcVlnVFgybS84?=
 =?utf-8?B?UWhRNWo0Uzc5V01tN2Izcms5aEVVNUs5ektkQ2tPUFp0MWxER0llRHdmL1BL?=
 =?utf-8?B?ejgxYmU5SGthWVlIOWNKejk5c2RwZmwxU3paVThtK080NzM2N1NNTzVBN1k2?=
 =?utf-8?B?c2pHdWIvRVVJT0ozbmZzaGZGU3JPK3kyMGJuaERTemxIeGV3OWRjVWdBSjlj?=
 =?utf-8?B?emhrTWd1MW1maUpsWUNNRUdVWExDc3A1QXJpbGFIU3dyWHcyeVlTNmc5ejBX?=
 =?utf-8?B?KysvclBvc1RCcjZDY2MxUmxvSm83SXdNcFRLN0pzU1ZTMCt3UHNBTERvWDNq?=
 =?utf-8?B?RkwzdDl5S0gyc3F3QjJPcXFKZlJkdTFKZXNVajVzK08xYmR4eitzdDZmTjI0?=
 =?utf-8?B?WXlaeStJNEthcE9QOUhLL3dwclBIYWE0ejNmM0tHQWk0UWFaVmh0RzFBYmlL?=
 =?utf-8?B?ZSt3UHZWTkFlK0JzMUp6RlRCUzZMb3JwMHliVjM5bWRTU05ldjVHQUNsRWxW?=
 =?utf-8?B?U0FWVWcyTEZ0ck5RbHJudjl1bkJBL1JqOXZWZzl6Umk2b0JBWTlubTVRNWxO?=
 =?utf-8?B?Q0ZOM1BvV1l3TU1ZeGZ1N3NmTy9ZWkhrd0MxNjcydzlZTmdjZnVMQllsWkg0?=
 =?utf-8?B?L1IvWEpZdE85TnVoUFpYam9Ob0NQczQrbDFlWW9DeXBScUlyYjg4VWdZRUtl?=
 =?utf-8?B?RUhSaE5oYjhGQ3VnbjlzV2drQjNQNDM1cmpTbEtMYWlZcXF3c0JCSDBnY1Na?=
 =?utf-8?B?aWFweWhPMmFOY2k3VEtUQk5Mby9DdWZSZFhhWW9VREVpZEE2ODgzcDNqRFBL?=
 =?utf-8?B?Q3hWczdmaWwvZ3VFWkJNTHFNYXNueTNRelpCSHNOOGRyMVJ2bW5ZNWJ2TlRs?=
 =?utf-8?B?cG56TkthLzRVcWFreXh6SlNxV1RuSXkyQkRGZld5a3N0ci9NUjBtV2M0L0cy?=
 =?utf-8?B?TStDNXkzL0dkL3BqYWtDeElVVVp1VGUyS1Q3dVdXZjNLL2JsZCs3M2s0WlVa?=
 =?utf-8?B?aWkrYnQ3b1gvRHBKY2lVR0VMWUFVK3VhOXEzVmdoekV1SzlwZ3pMMFpxVmFX?=
 =?utf-8?B?U2YyNXo2TlVTR25pUXloS0diTUJYRDkxMVZtaCsvME5sNk1nSjB6TlZ2TThj?=
 =?utf-8?Q?x27Id4UWYbl7V2knpt1YKfrrky3lzA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(366016)(376014)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cGdvVkJ6enJxc3ZBUnMyb3ZmOHRwS3d1STcrd2dqNGJ6UjZOSjMvYWNJRnJp?=
 =?utf-8?B?REkyeGZvRStVQjlVcWR2YVowd0xNb1NDeGp3cUxtNDk3T3ZkSWlkWGJLTTFI?=
 =?utf-8?B?K0g2RWFFdGdpeDRwbzA1NU1yc2NhQ2dCZkE3MG9WTVI2eE8rNDVxQk41YnhU?=
 =?utf-8?B?Z1VRZUlvTWtCblhLemUvMEhFRk9NTXl6R0RFRjFEbXllSzZBK0F0VGtpT2xE?=
 =?utf-8?B?a0pYK3ZzZEg2RWNHRXhrY2Mvb0ZENElPYUhNV1h4TndIYThYTHF4dUUyQm1x?=
 =?utf-8?B?N09xRHlML3hRZnNaeDFOeCsrNzR2OXFOYmF1NndCSWROL1ZIM0RJaXZXL252?=
 =?utf-8?B?VjF3RWEzZThPZVVRdVBmYUdCTzg3bWx3a05NYkQvaUFQUTREZFlIZnhQcUNR?=
 =?utf-8?B?ckljWElGaU1Vcm51VHBWRTJka2g1em5mV2NXbFl1UG5pZUlCeVk3VjZCK1VG?=
 =?utf-8?B?S2M4Uzl0WGxCQjBycjF5S1FZaURBOEVVVzJwZ0dHU3dyV3dwa2ZDWlM2SFVO?=
 =?utf-8?B?U2RaTDFudm9nTGlJSzFLNk1xL0ZRdGF4L1FmdnhOSkRBWHVOc0ttMFJLYytK?=
 =?utf-8?B?U3Y4T3FkNVhlbUgrV3lKa3VhdUZ6bTJJeGYxYS9QbEJnejF5TDE2NWRGcEtH?=
 =?utf-8?B?VDNBbWdSbHlQOHA5bUVYUks1ZHRmRUpsaXpxOE9UMzlOV0lSVDRrZURnNFZI?=
 =?utf-8?B?bCtCcEIrRFNtQTRTalJMWElXYnpSeU5WT0x2ZGw5SXdGeVJTK1NkWjZ4UE1X?=
 =?utf-8?B?Sm4vOWZaTmR1dkJJcTNTNTF3SWQ4amVFNzNhUHJOc2JST3drSHUyRCt6TUU5?=
 =?utf-8?B?S1pZdFVQQ1VSV1JNKytVbzNjV0JzUHN1eHIzTXplMklpc3JmYXJsUmx6bnhE?=
 =?utf-8?B?ajZBdlZpbUk4ZnFKL2dhaDFBUTU1VVlTV3NOd2creUx5SGVneCtvZGdGWFVy?=
 =?utf-8?B?eUEzaE1rSGszVlYyWno4YTM3MFpUbjZTU3V6eW5DMlpUcHFLRW1wYUVtWTN2?=
 =?utf-8?B?SGdPT2R5VDIrME80ZDR2THdnUDR0WXFHMTVibGpTdk1zUE05RWNIWjBGM2tY?=
 =?utf-8?B?YkpLaDdhcjloaklQSnVIRFQyNGlNUVFybTZYRUVJNUw2S0d4SUNzU3Z6dk9m?=
 =?utf-8?B?d1d4QVdYUWF6L1dWOVdNdWVKNDVubDZxQTQyZ1pXSkFVenkvdFh3Y2s1Ri9J?=
 =?utf-8?B?V0dKOUtFdTlJVzdSUWV0NUkzTndLWWVuZTVpK0ducFhQZE9yQ2RsWWY2YTdW?=
 =?utf-8?B?U0dsbXdZMzY5akdieWpLV3pSM2FYeG4yNEVRQUl3WWd0c1ZSNGFWMDB6bmZS?=
 =?utf-8?B?aVU2d21EOVZvKzl6WGprUTRCNENxSkt6dTN5aW1tWE13Qk5uNy91MTFYTVgy?=
 =?utf-8?B?akJpeTRsWkhCVk9mckFmdTZKSWdtQzRxS2Z2d25oUmhvQ1JhRDNIdzA5ZTU3?=
 =?utf-8?B?SnM5S2hpc3o4dWhpaVRZSCtybXhoT0FYUnhJNjZHZzRGMkk1OTJpWUs3UHUr?=
 =?utf-8?B?RmgwbXRhTG13Tlc2L3YySUp0a0NSUnE3aElzOUVtTlVEUTZ3NmMyUFdNV0Iw?=
 =?utf-8?B?ZHJUQmhlTTRzSGlac2svNXlIeDMrRXZwRnNhampZdmdJTGNxOFZrUmRoUVhK?=
 =?utf-8?B?TEY0U0k0QXlBOUxFUVFxQkJFMjlGa1gwczJNQzJTOGJoNnB3YWFPa3hrMDRR?=
 =?utf-8?B?bkRRYVJTbnBCUUV0bFcxcmRieW1sT0NmNzcrNzNUQ2pxMS9lQlp6VDZiYjNt?=
 =?utf-8?B?Z25ZVXVLNUlYbVZMTzF5ODM5TWwyamhoL1QySEhKOTFLOXY2Yk13YXJ0MEt2?=
 =?utf-8?B?Yk0vcUdSYlNZMXY4YlQrVFhOclVmeWkvK1BGWUZxZUhMZ1duVnppUUR2QkFY?=
 =?utf-8?B?YjRYa1BoWk8yMm05ZXVtbFNEZlI1Q0M5R0xHYmwyYzVoSUk3NWZUMERtNk9p?=
 =?utf-8?B?cHo3aEkycTA2ZFRZQVUyVjF2Y0RiWnRiNlpzcHYzTXlIZ0RCKzNmVlZ0VkxK?=
 =?utf-8?B?Ui9RQTJuekRkNWVxeFQ2YUtUVGpzU1NyM0F5cWZCWmVsbkVPMW5KVEdmVkUw?=
 =?utf-8?B?TExaK3RJVUdxajV0cDc4d09RNTgrUEI5VFBIM1hRV1pRQjR4K2trY3Z3b1Vm?=
 =?utf-8?B?Rm1XV1NIRy9VVjN4d2xnM0VMNll0VFM2L2RwZUFKK3lVVkxvTWhrcGRBMHps?=
 =?utf-8?B?ZlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b3bb163-e29c-41dd-f730-08de0a41837d
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 10:16:02.9765 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f82uZBVyWzOzc2Th+OEAFlCI2nDmr4K3AKc2jIydlyZhpqDTJExjfRHm0p190QBh9y345Gz9czTy8Sx0MTorJ7k7U5yRoT2mDzd2BE6wBEI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7034
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



On 10/11/2025 9:38 PM, Michał Winiarski wrote:
> Now that it's possible to free the packets - connect the restore
> handling logic with the ring.
> The helpers will also be used in upcoming changes that will start producing
> migration data packets.
> 
> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile                   |   1 +
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c   |  48 ++++++-
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c |  10 +-
>  drivers/gpu/drm/xe/xe_sriov_pf_migration.c    |   1 +
>  .../gpu/drm/xe/xe_sriov_pf_migration_data.c   | 135 ++++++++++++++++++
>  .../gpu/drm/xe/xe_sriov_pf_migration_data.h   |  32 +++++

while this is used by the PF only, maybe those files don't have to include _pf_ tag (like xe_pci_sriov.c or xe_sriov_vfio.c ?)

 .../gpu/drm/xe/xe_sriov_migration_data.c   | 135 ++++++++++++++++++
 .../gpu/drm/xe/xe_sriov_migration_data.h   |  32 +++++

or

 .../gpu/drm/xe/xe_sriov_vfio_data.c   | 135 ++++++++++++++++++
 .../gpu/drm/xe/xe_sriov_vfio_data.h   |  32 +++++

>  6 files changed, 224 insertions(+), 3 deletions(-)
>  create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf_migration_data.c
>  create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf_migration_data.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 71f685a315dca..e253d65366de4 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -177,6 +177,7 @@ xe-$(CONFIG_PCI_IOV) += \
>  	xe_sriov_pf_control.o \
>  	xe_sriov_pf_debugfs.o \
>  	xe_sriov_pf_migration.o \
> +	xe_sriov_pf_migration_data.o \
>  	xe_sriov_pf_service.o \
>  	xe_tile_sriov_pf_debugfs.o
>  
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> index 16a88e7599f6d..04a4e92133c2e 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> @@ -20,6 +20,7 @@
>  #include "xe_sriov.h"
>  #include "xe_sriov_pf_control.h"
>  #include "xe_sriov_pf_migration.h"
> +#include "xe_sriov_pf_migration_data.h"
>  #include "xe_sriov_pf_service.h"
>  #include "xe_tile.h"
>  
> @@ -949,14 +950,57 @@ static void pf_exit_vf_restored(struct xe_gt *gt, unsigned int vfid)
>  	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORED);
>  }
>  
> +static void pf_enter_vf_restore_failed(struct xe_gt *gt, unsigned int vfid)
> +{
> +	pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_FAILED);
> +	pf_exit_vf_wip(gt, vfid);
> +}
> +
> +static int pf_handle_vf_restore_data(struct xe_gt *gt, unsigned int vfid,
> +				     struct xe_sriov_pf_migration_data *data)
> +{
> +	switch (data->type) {
> +	default:
> +		xe_gt_sriov_notice(gt, "Skipping VF%u invalid data type: %d\n", vfid, data->type);
> +		pf_enter_vf_restore_failed(gt, vfid);

shouldn't this be done in pf_handle_vf_restore_wip() where all other state transitions are done?

> +	}
> +
> +	return -EINVAL;
> +}
> +
>  static bool pf_handle_vf_restore_wip(struct xe_gt *gt, unsigned int vfid)
>  {
> +	struct xe_sriov_pf_migration_data *data;
> +	int ret;
> +
>  	if (!pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WIP))

in other places in VF control state machine we use slightly different pattern:

	// can we exit state AAA?
	if (!pf_exit_vf_state(AAA))
		return false;	// no, we are not in this state
				// try to process other state

	// yes, we _were_ in AAA, process this state
	ret = handle_state_aaa();

	// now decide where to go next
	if (ret == -EAGAIN)
		pf_enter_vf_state(AAA);		// back
	else if (ret < 0)
		pf_enter_vf_state(AAA_FAILED)	// failed
	else
		pf_enter_vf_state(AAA_DONE)	// next

	// state was processed, start next iteration
	return true;

>  		return false;
>  
> -	pf_exit_vf_restore_wip(gt, vfid);
> -	pf_enter_vf_restored(gt, vfid);
> +	data = xe_gt_sriov_pf_migration_ring_consume(gt, vfid);
> +	if (IS_ERR(data)) {
> +		if (PTR_ERR(data) == -ENODATA &&
> +		    !xe_gt_sriov_pf_control_check_vf_data_wip(gt, vfid)) {
> +			pf_exit_vf_restore_wip(gt, vfid);
> +			pf_enter_vf_restored(gt, vfid);
> +		} else {
> +			pf_enter_vf_restore_failed(gt, vfid);
> +		}
> +		return false;

this should be 'true' as we completed this state processing
> +	}
> +
> +	xe_gt_assert(gt, gt->info.id == data->gt);
> +	xe_gt_assert(gt, gt->tile->id == data->tile);
> +
> +	ret = pf_handle_vf_restore_data(gt, vfid, data);
> +	if (ret) {
> +		xe_gt_sriov_err(gt, "VF%u failed to restore data type: %d (%d)\n",

use %pe for error

> +				vfid, data->type, ret);

maybe for debug try to dump here more details about failing data packet

> +		xe_sriov_pf_migration_data_free(data);
> +		pf_enter_vf_restore_failed(gt, vfid);
> +		return false;
> +	}
>  
> +	xe_sriov_pf_migration_data_free(data);
>  	return true;
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> index af5952f42fff1..582aaf062cbd4 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> @@ -15,6 +15,7 @@
>  #include "xe_guc_ct.h"
>  #include "xe_sriov.h"
>  #include "xe_sriov_pf_migration.h"
> +#include "xe_sriov_pf_migration_data.h"
>  
>  #define XE_GT_SRIOV_PF_MIGRATION_RING_TIMEOUT (HZ * 20)
>  #define XE_GT_SRIOV_PF_MIGRATION_RING_SIZE 5
> @@ -523,11 +524,18 @@ xe_gt_sriov_pf_migration_ring_consume_nowait(struct xe_gt *gt, unsigned int vfid
>  	return ERR_PTR(-EAGAIN);
>  }
>  
> +static void pf_mig_data_destroy(void *ptr)
> +{
> +	struct xe_sriov_pf_migration_data *data = ptr;
> +
> +	xe_sriov_pf_migration_data_free(data);
> +}
> +
>  static void pf_gt_migration_cleanup(struct drm_device *dev, void *arg)
>  {
>  	struct xe_gt_sriov_pf_migration *migration = arg;
>  
> -	ptr_ring_cleanup(&migration->ring, NULL);
> +	ptr_ring_cleanup(&migration->ring, pf_mig_data_destroy);
>  }
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
> index 347682f29a03c..d39cee66589b5 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
> @@ -12,6 +12,7 @@
>  #include "xe_pm.h"
>  #include "xe_sriov_pf_helpers.h"
>  #include "xe_sriov_pf_migration.h"
> +#include "xe_sriov_pf_migration_data.h"
>  #include "xe_sriov_printk.h"
>  
>  static struct xe_sriov_pf_migration *pf_pick_migration(struct xe_device *xe, unsigned int vfid)
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration_data.c b/drivers/gpu/drm/xe/xe_sriov_pf_migration_data.c
> new file mode 100644
> index 0000000000000..cfc6b512c6674
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration_data.c
> @@ -0,0 +1,135 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#include "xe_bo.h"
> +#include "xe_device.h"
> +#include "xe_sriov_pf_migration_data.h"
> +
> +static bool data_needs_bo(struct xe_sriov_pf_migration_data *data)
> +{
> +	unsigned int type = data->type;
> +
> +	return type == XE_SRIOV_MIG_DATA_CCS ||
> +	       type == XE_SRIOV_MIG_DATA_VRAM;
> +}
> +
> +/**
> + * xe_sriov_pf_migration_data_alloc() - Allocate migration data packet
> + * @xe: the &struct xe_device
> + *
> + * Only allocates the "outer" structure, without initializing the migration
> + * data backing storage.
> + *
> + * Return: Pointer to &struct xe_sriov_pf_migration_data on success,
> + *         NULL in case of error.
> + */
> +struct xe_sriov_pf_migration_data *
> +xe_sriov_pf_migration_data_alloc(struct xe_device *xe)
> +{
> +	struct xe_sriov_pf_migration_data *data;
> +
> +	data = kzalloc(sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return NULL;
> +
> +	data->xe = xe;
> +	data->hdr_remaining = sizeof(data->hdr);
> +
> +	return data;
> +}
> +
> +/**
> + * xe_sriov_pf_migration_data_free() - Free migration data packet
> + * @data: the &struct xe_sriov_pf_migration_data packet
> + */
> +void xe_sriov_pf_migration_data_free(struct xe_sriov_pf_migration_data *data)
> +{
> +	if (data_needs_bo(data)) {
> +		if (data->bo)

not needed, xe_bo_unpin_map_no_vm() checks for NULL

> +			xe_bo_unpin_map_no_vm(data->bo);
> +	} else {
> +		if (data->buff)

not needed, kvfree() also checks for NULL

> +			kvfree(data->buff);
> +	}
> +
> +	kfree(data);
> +}
> +
> +static int mig_data_init(struct xe_sriov_pf_migration_data *data)
> +{
> +	struct xe_gt *gt = xe_device_get_gt(data->xe, data->gt);
> +
> +	if (!gt || data->tile != gt->tile->id)
> +		return -EINVAL;

didn't we check that already in xe_sriov_pf_migration_produce() ?

in other places we call xe_sriov_pf_migration_data_init() using ids from real tile and gt

> +
> +	if (data->size == 0)
> +		return 0;
> +
> +	if (data_needs_bo(data)) {
> +		struct xe_bo *bo = xe_bo_create_pin_map_novm(data->xe, gt->tile,
> +							     PAGE_ALIGN(data->size),
> +							     ttm_bo_type_kernel,
> +							     XE_BO_FLAG_SYSTEM | XE_BO_FLAG_PINNED,
> +							     false);
> +		if (IS_ERR(bo))
> +			return PTR_ERR(bo);
> +
> +		data->bo = bo;
> +		data->vaddr = bo->vmap.vaddr;
> +	} else {
> +		void *buff = kvzalloc(data->size, GFP_KERNEL);
> +		if (!buff)
> +			return -ENOMEM;
> +
> +		data->buff = buff;
> +		data->vaddr = buff;
> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + * xe_sriov_pf_migration_data_init() - Initialize the migration data header and backing storage
> + * @data: the &struct xe_sriov_pf_migration_data packet
> + * @tile_id: tile identifier
> + * @gt_id: GT identifier
> + * @type: &enum xe_sriov_pf_migration_data_type

here type is enum

> + * @offset: offset of data packet payload (within wider resource)
> + * @size: size of data packet payload
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_sriov_pf_migration_data_init(struct xe_sriov_pf_migration_data *data, u8 tile_id, u8 gt_id,
> +				    unsigned int type, loff_t offset, size_t size)

but here is plain int ?

> +{
> +	xe_assert(data->xe, type < XE_SRIOV_MIG_DATA_MAX);

if it's "enum" - no need to check

if it's "int" and type is coming from outside of our code, then assert is not sufficient anyway

nit: if assert stays, add sep line here

> +	data->version = 1;

magic "1" needs its own #define

> +	data->type = type;
> +	data->tile = tile_id;
> +	data->gt = gt_id;
> +	data->offset = offset;
> +	data->size = size;
> +	data->remaining = size;
> +
> +	return mig_data_init(data);
> +}
> +
> +/**
> + * xe_sriov_pf_migration_data_init() - Initialize the migration data backing storage based on header
> + * @data: the &struct xe_sriov_pf_migration_data packet
> + *
> + * Header data is expected to be filled prior to calling this function
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_sriov_pf_migration_data_init_from_hdr(struct xe_sriov_pf_migration_data *data)
> +{
> +	if (WARN_ON(data->hdr_remaining))

better: xe_WARN_ON(xe, ....)

but does it really deserves any WARN here?
we rather know who is the caller 

> +		return -EINVAL;
> +
> +	data->remaining = data->size;
> +
> +	return mig_data_init(data);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration_data.h b/drivers/gpu/drm/xe/xe_sriov_pf_migration_data.h
> new file mode 100644
> index 0000000000000..1dde4cfcdbc47
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration_data.h
> @@ -0,0 +1,32 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef _XE_SRIOV_PF_MIGRATION_DATA_H_
> +#define _XE_SRIOV_PF_MIGRATION_DATA_H_
> +
> +#include <linux/types.h>
> +
> +struct xe_device;
> +
> +enum xe_sriov_pf_migration_data_type {

maybe add a note that default 0 was skipped on purpose to catch uninitialized/invalid data

> +	XE_SRIOV_MIG_DATA_DESCRIPTOR = 1,

shouldn't we try to match enumerator names with enum name?

	XE_SRIOV_PF_MIGRATION_DATA_TYPE_DESCRIPTOR = 1,
	XE_SRIOV_PF_MIGRATION_DATA_TYPE_TRAILER,
	XE_SRIOV_PF_MIGRATION_DATA_TYPE_...,

or change the enum (and file) name:

	xe_sriov_migration_data.c

	XE_SRIOV_MIGRATION_DATA_TYPE_DESCRIPTOR = 1,
	XE_SRIOV_MIGRATION_DATA_TYPE_TRAILER,
	XE_SRIOV_MIGRATION_DATA_TYPE_...,
> +	XE_SRIOV_MIG_DATA_TRAILER,
> +	XE_SRIOV_MIG_DATA_GGTT,
> +	XE_SRIOV_MIG_DATA_MMIO,
> +	XE_SRIOV_MIG_DATA_GUC,
> +	XE_SRIOV_MIG_DATA_CCS,
> +	XE_SRIOV_MIG_DATA_VRAM,
> +	XE_SRIOV_MIG_DATA_MAX,

please drop it
> +};
> +
> +struct xe_sriov_pf_migration_data *
> +xe_sriov_pf_migration_data_alloc(struct xe_device *xe);
> +void xe_sriov_pf_migration_data_free(struct xe_sriov_pf_migration_data *snapshot);
> +
> +int xe_sriov_pf_migration_data_init(struct xe_sriov_pf_migration_data *data, u8 tile_id, u8 gt_id,
> +				    unsigned int type, loff_t offset, size_t size);
> +int xe_sriov_pf_migration_data_init_from_hdr(struct xe_sriov_pf_migration_data *snapshot);
> +
> +#endif

