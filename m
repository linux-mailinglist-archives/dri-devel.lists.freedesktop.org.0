Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57BD1C0D5F0
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 13:03:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F26E10E449;
	Mon, 27 Oct 2025 12:02:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z7T1lPdf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D430810E442;
 Mon, 27 Oct 2025 12:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761566569; x=1793102569;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=7X/nHmMwCXBtug4ZA313mbFRZkOsE4RPwt6NI13ZHjs=;
 b=Z7T1lPdfMNCHyD54B1bykwXEhinXwWzdnM7tkFLHf7/SqhLjN8KBjLng
 sikyR1yc4zwyiPzTl2FRP1P4l59m29ZSY12GLSsyMpSxqS78ALJgX2uJS
 yif0rqgDgPsXefAdZkwRV7hfJupvb+O+6Rw9oQuLFNeP2TTE7QSXof4lk
 wN/03O4okSnY+CMUqLJMS6BHEfvIV+U3L4h/ai3mVsvm8Z63yJPNvbd0l
 dHp2SUezClQFPOFiOPs8aBSexFTJCjEAoFXwF9w0Kcjoc5G68tQ4Ny0bh
 K6DuAd1xT0myJ6HiEuOIT/Mv7n7LKaq2MatozjUvL6yyBw+fcGtGNjUDp A==;
X-CSE-ConnectionGUID: 5Ibw5XpGRquH29XhdK5DzA==
X-CSE-MsgGUID: yilHbgdTSVq/9wYaCvxT0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62671850"
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; d="scan'208";a="62671850"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 05:02:49 -0700
X-CSE-ConnectionGUID: w75UU3FITReAYZ3VYErDXw==
X-CSE-MsgGUID: dDpFU/o/RxmDIBwoR7WFEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; d="scan'208";a="184647991"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 05:02:49 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 05:02:46 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 27 Oct 2025 05:02:46 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.48) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 05:02:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ffQp9JSSnT3/ZyJYvCw9zV7475ueVgGMKB+zMmcQFcWKkPZK57Y0XdtiTayJAZNkK/OCtVtEVHRL8P9ZhOgBmqfl5OSf7k1vyhZZmGx2vYDq7muaZhnhZgQHMF3HdFyIfXFLnQeh1uqnhcFlFZRdveMejQC8jDQW8vANvSJUl4mmPEpW8iWZsVV3XY2NqEejPXc7tmsESF6ZVxh0p5cKu60pCO1F2QCWgCDc0h1GkXgQsh2v07C6XnelpTw8kxuBb+VQTm8FsZWpUKU1wfbKYSHlgYyGO4t2i6+MdT34HNq7pusVA7lQAkwNyI7fT+xMzPwGmPAKBQegIjo2OktkJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JaWrUHn7HoIMTs3NZ6olqlu3NbJkZvtePbEx9TkjD1M=;
 b=xtSGZdTz+YGChwQxex+L4KHqxrQ/QYUQNzIkqiptNyyTJ+0n6JuyySDpzOR6k79xhFRHSbP/q6DaKPGQ3F7UnjZC/0BACk+4d8zHxAToYi0oGOMvieqtX55WKtKme3aM92oU5Mg4rVqOrAYkhvCQg94MZUSF/n+0gWfk+jAYU/4IVfpDCApQgr2+8Ww5XHAvHvMiXaFeR9lhoZrmzzEgeU59JmdKrJrPtqYwv3fNPC0M5dD5xzfgGr4BF0EvG5KtrznXcPMYUoxcDEeldn1yMILkNQmRpLGqZrpdKe8LHEIjex2Agy4buUnO5UtKwlDdH8okrrYU9N2FdnnOVTS+Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 DM3PPF777B3455C.namprd11.prod.outlook.com (2603:10b6:f:fc00::f2f)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 12:02:33 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 12:02:33 +0000
Date: Mon, 27 Oct 2025 13:02:29 +0100
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: Alex Williamson <alex.williamson@redhat.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, <intel-xe@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <kvm@vger.kernel.org>, Matthew Brost
 <matthew.brost@intel.com>, <dri-devel@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>
Subject: Re: [PATCH v2 03/26] drm/xe/pf: Add save/restore control state stubs
 and connect to debugfs
Message-ID: <mv3vim76p66yp5wj34icrtq5nslupbtwzygjonpkprmi5nddlz@mswwpnqs5m5y>
References: <20251021224133.577765-1-michal.winiarski@intel.com>
 <20251021224133.577765-4-michal.winiarski@intel.com>
 <fdf1ebb7-e8dd-4228-9b13-588e2e617b15@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fdf1ebb7-e8dd-4228-9b13-588e2e617b15@intel.com>
X-ClientProxiedBy: VIYP296CA0006.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:29d::11) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|DM3PPF777B3455C:EE_
X-MS-Office365-Filtering-Correlation-Id: ac65c434-75a5-4c61-b93f-08de1550b5e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M29QRDhwMGc4MXNUUFpJRElhclJnTTdCUG45eHRoeVhqaU5YUjlENEQzQnFo?=
 =?utf-8?B?bURibmdQOHJVc2wzejdpNWNuQmp0K2NpQXFGUDFEcGYwRTdvQnJ5Z0hkell3?=
 =?utf-8?B?cHF4MGtRUzdQbTlIZll3cVFOVW9IZVlJWG1VR2poM1pxRDRlNi9OS3RJRitZ?=
 =?utf-8?B?d1VDRHdWRXBzbTBsMWUwejZMc3N4R0wyM1hoOG1LUDVDMW42NmZ4YzFMNGtL?=
 =?utf-8?B?cHljSlRIRSt6NW1qcmtZREhUNnl6c0YxYmIvdW15SFpqQ29kNHZDUzdQWHF4?=
 =?utf-8?B?UnJ4Y3BtTXUyTU5McnF1bDdHMjUyOE5QeUdrZXh0WFZ2enNEeXdWSHJWbTF4?=
 =?utf-8?B?SHF2Q2h6WDRkanZqMjdzYVZIUm92MHV4SU1uTnBmVTV4cjhpVEtwQUw2K2xJ?=
 =?utf-8?B?d3ZvQTNycnMrQlFZS0l4Um9QVm9vMk1lbjF1eFk0MmVjLzBxSlVseGo3QTYz?=
 =?utf-8?B?T2lVd05XTVpvTkNKWkpoSnJtQmY3SWhhWFh1YjdlVTg1Z1UvTzc3RzFBUC9r?=
 =?utf-8?B?djFxdmZ3YnZZSVlPYk11TmRWdndvY3BSQVV0SGZoa3ZlRFUzNjIvN2JjSHlj?=
 =?utf-8?B?aGVhcGFzL2ZUWDFnNHdZdkNZLzU3bW5LMzU1bDVGR211VHBmVUdZZWRIeStj?=
 =?utf-8?B?VWhrdzBtbXUyR1pkZkVrVFFvYysvTVhJV2IySjdzZzJDVTIyU3o0YjhSKys2?=
 =?utf-8?B?dnZ1UHZNVEwyUUNxY045QjhjQytrTTF1emNsTXU0Q1dIWTRLUkt1dk1SWUh6?=
 =?utf-8?B?K0pWS2xUOVdUeSt3R0I3WEJEeGdJVWlZSUl5Z0VGTWFUN2VLa09Vb1VvZG1B?=
 =?utf-8?B?SDZGTWkwSmJEU2pRWm1hVEVWMnZjcG55UElCMW9JelF5azZoaGc1UmNwY09M?=
 =?utf-8?B?SE9xOTNMV0dWSk1UZWhBZWlnbWtUL2xrUkpPb2c0OUs4RTFLT1pLcHlQK2lM?=
 =?utf-8?B?bWhzVVJIQy9ydFRIanBSQzlYNENhN2pIMW5QZEd5QkpMUmxRU3hWM3FHcVlN?=
 =?utf-8?B?VDk5U3dVUkExTXByZXB3UzBBL3NEbWM0dkNZK2xpNDgrUXRvSlU0b3AzRG5N?=
 =?utf-8?B?NG9FYjZzVmI4cGpTTHAwZjlMQ3BJQThGZG9UbzB6NHZiNTFyOEdjWTlHN3Ur?=
 =?utf-8?B?bjRhZVRXc1FGL21iZ0pua0RRcFpGSVVYZm1FbzhockFmR2Zid3I0VUllNUVI?=
 =?utf-8?B?TnlpOGRKMzcwNndrRnZUK2ZXWDcyeTN4NUVuZXFIbWFRK2wvV0FPNzF6UkNI?=
 =?utf-8?B?ckJBTitsWEJzZUlvOWxpRm9PbFRqT2NJWUk0cXNla3JtOFlBRmV1b3Zncm9n?=
 =?utf-8?B?cUgzejhsWTdId2d4dlZlMStCR0gzVllaV3g3T0VnaWJZRHNFaVR2RjZzemYz?=
 =?utf-8?B?Vnd3MjJNY1orYXFxdXo1MklXcjZlNS9sdlZtZDBzaTAwTVlYUWJmT3dMbHov?=
 =?utf-8?B?TlJtVEZYc1RWRlphNmRDakFhY2J6TGdCakU3bVpOeHVWQUd1dkJTL0I5NllU?=
 =?utf-8?B?aFRxRytmL2VLdmc1MTlLZ0JUWEthbTZmdXp1TW10ekhQcGNRR1JxeHBxMlN3?=
 =?utf-8?B?SjNCTTZ5ekdkOFM3YzN1U1pIYlRNZ1VIdmFGR2lUaGNpelg5dGQyVDRZeFhF?=
 =?utf-8?B?L0RmdTBUYzVpY1Z1TG9Ldnh2bCtISk5DbDR0RHU4aUwycy91Qks4bkhObnBM?=
 =?utf-8?B?c01SS3Arb21zaGpKTHNjNi9OWGtDYmJzSjFHaksvRmtZbS9PYjZrQU4wUC9Q?=
 =?utf-8?B?VEhjU1hnc1M3eGtlR0lUNWJQaGJFR1dvMVp6aXlHcGQ3d2tBVFZpV2NwaGI3?=
 =?utf-8?B?citJSmlMdGEvYnN0OUtyUDM3WVhrYmVyaU54bko2Q2JleFU2WDNPTEk2QlIz?=
 =?utf-8?B?Y1dLMWJQa1gxRFRTZmZzbUxWeTEwcjlQU3F1Ty9qK3JUTW5sRFI1MVJrZ29r?=
 =?utf-8?Q?m0jv8lhR3Gq6oPV438KWdXyljm3b6f42?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aDhNMHhjUzV4OWRBRzdxNlJMVmU3eUptWDRtQjB5bzdUa2Zub1FJRXV5K1BL?=
 =?utf-8?B?VUVVUUNXTERpdVZRazFkek1VcGxpMWdPYlJHMVJzYlpBSHcyYmN2UEFWNmVY?=
 =?utf-8?B?RVg3eU1RTkF1ekRVQmJWYlFQRm5meTcxajNUQTZVMkgzekVJQzY1ZnkxaXFQ?=
 =?utf-8?B?RkhoN3IwTUNUOWcvUlF1ZkcrcFg5YW1zK25XbzBSbGd1SUp6ZkI5NlIxTmF4?=
 =?utf-8?B?K28zY091SnJtcHBqa204czk2ZTBJNjJlOGRVSHpFOHY5SnNLYytNZGdYK0U2?=
 =?utf-8?B?VGhYUWY1UERMMmZEaG1DeVJ3NXJ4cWV2RVp6UFE3NVI4bVQyNDRna0loSXJS?=
 =?utf-8?B?UkFuNXJNTXVWamxSQW1VdkZqbCs2NEVMa08wU2pEdDd5KytudFhaaVNyUkpi?=
 =?utf-8?B?ZVZldERvbWRpaGhFbUxTbjNLMXpVUy9JeElONXhHSUMzZTFPRUE1R1gvckhS?=
 =?utf-8?B?UkwzbXFKZ3hhd3RNYlR0ZXpNbjdOK3V5MUNyL0c5Z0F1bHF4UWZHWnU5bXBF?=
 =?utf-8?B?eWgrR3hVZ001Z0tYWnhCSzVoRVlZY2NzSzZMdzlKcFRIbkFmYmkvQUtFZ2Z0?=
 =?utf-8?B?VjJCOVZjK1lFN0Z4VnV0UVloUUFFYUVRa1FXZnZxZ3hVL3E3MXZ2YnE2eE8z?=
 =?utf-8?B?UGEvbkZBS1B5NDY2UlVNT3NXdXB0VTBUTFptOXBsOWFnckV4S1RlTXVQODRE?=
 =?utf-8?B?M0ZXRnZNK1U2NXhNL3NKclZGc0dyU1Z2NnVzQk90NUoyRUt0WjJ4V1liekNB?=
 =?utf-8?B?SFVuNlVmTnRkSGRjZDhxVXJwdU8zeGE2QWVHYlFGclMyT3Z4SmM5Y3l6Y2NT?=
 =?utf-8?B?UGVocXIrZ3Zzc2Q1TkdaZUQzTk9pWUtLQkJkSllMNW5zN01kY2xGVVdoR0R5?=
 =?utf-8?B?K213aHNJc3JGZXM3NTJiVDdIRis1emVYL01VRTBGZWRxaklJMUt2Mml2cXJF?=
 =?utf-8?B?NzZXZHc5SDFubEcxTzREQ0dFU1RzWDRYeGRtd0pvUFFpOHA1dVEwS2l6K2t3?=
 =?utf-8?B?YktuN0J1S2VKKy9BbFVjcGs5eTFybk9lMyttVjU0VW9DSlQ2WkpHa3pad0pz?=
 =?utf-8?B?QVM4aDh6QlFEaGdWbWt0TVN6VHI0Vk1haTRaUkVSNVZzajFRYjVyenp2Sk53?=
 =?utf-8?B?dVRoanFpUC9Dbm8xa1N1MXlQVGdwVytYM2h3VWFMWW9GTk50enV5SUc2Y1Vl?=
 =?utf-8?B?M0lsRHlIckkzU1IyTjh4UGVZVU1oTVRVMkhZOXAzOXRZMEwxL04xdCtzYWND?=
 =?utf-8?B?b1BBK203VzBPSHdQa2U5NFNGazNpa3dzOS85YWZvaFAzY3A3ai9Id3ZSNmdH?=
 =?utf-8?B?SUlnOVdmUGdIR3hFUHlWZjU4Z1hKc0p6OGdzVUFPYUZxUGgwTXNmZmMrZ3BP?=
 =?utf-8?B?V09EOHJ4eHhPVjZodURhcGtJTHBqekROa3hzQ051SE1FK2dielRLRmdHMlA5?=
 =?utf-8?B?QUtHK3RtSWJHUjg1cXZ6QXY2MEYrUU1OR2hzWHhOUnFVa1BraU1NUnZCOFlt?=
 =?utf-8?B?UG9zbUJnUkNIUmZFaE1iM2xNMXU1ak5mYmFjaTAyQi9YRlg3WTgybHlncjlH?=
 =?utf-8?B?R2FDZFI1NGhiUHZHMHBZKytsc1E4Z0Jad3k1VndlczNYWkxXckRFMGZqbDlK?=
 =?utf-8?B?VHNsUzNXNmpZRkVWSkxkTFVTMTlMWTg0OGFiNHYrOWFVam44aG4vTGJGUUZG?=
 =?utf-8?B?czAvZGY0dGoxeDhkUkhKQlZMTnFqSGZZN1RnQUl3RVFQc2hYL0ZUdG04WndR?=
 =?utf-8?B?UzZtclArY1g3enJVL0JXUEowaHFPRHhoam5OZHZzN0hlN1hnSFN4ZFhpUW0z?=
 =?utf-8?B?OG9FMnlNalI2L0R2UkN4WnEzZTIrTnVJTnphK082K3lzdHNGUndUWlZ0dDAr?=
 =?utf-8?B?ektGVGZjUFRTdDI0RHlXMTdoaklvUjkyMjFGVFR0UWh3MEhxcG8zVllwaDQ4?=
 =?utf-8?B?dytTL0dmQVdsMHFnenBNVjlaaFlmOVdtbU40UEp1VVJ0NWFoYlRZTkc5aWYr?=
 =?utf-8?B?ZWdXNlJEYVVrbDJ0elpFYWl2WGtiTXRHamJERjY1MnNTMDF1aCtkTVhoMHJ1?=
 =?utf-8?B?L3ltcVZ5bDgyOFNldjZKV0hWN1B1K0N5YnpRMlZkSTdSd2k1UTJsZUZuQkx6?=
 =?utf-8?B?Vm9mZXJvc0lUaDhMeWRRbStKakhZNEVGRGRVa2pHbFF2dllBMmpibFFLdFhz?=
 =?utf-8?B?Z2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ac65c434-75a5-4c61-b93f-08de1550b5e0
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 12:02:32.9455 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gdo4X7dJqbuJrWzgy6FfiQwQafYYz0RJ20SAhgqL1MNqxhHxwLRxIU6Dz/VrI7gJo8qWLup/zRETsytRpN9kJnPSFx2Jh7uZnnNyqvum75A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF777B3455C
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

On Thu, Oct 23, 2025 at 12:31:47AM +0200, Michal Wajdeczko wrote:
> 
> 
> On 10/22/2025 12:41 AM, Michał Winiarski wrote:
> > The states will be used by upcoming changes to produce (in case of save)
> > or consume (in case of resume) the VF migration data.
> > 
> > Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c   | 248 ++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h   |   6 +
> >  .../gpu/drm/xe/xe_gt_sriov_pf_control_types.h |  14 +
> >  drivers/gpu/drm/xe/xe_sriov_pf_control.c      |  96 +++++++
> >  drivers/gpu/drm/xe/xe_sriov_pf_control.h      |   4 +
> >  drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c      |  38 +++
> >  6 files changed, 406 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> > index 2e6bd3d1fe1da..b770916e88e53 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> > @@ -184,6 +184,12 @@ static const char *control_bit_to_string(enum xe_gt_sriov_control_bits bit)
> >  	CASE2STR(PAUSE_SAVE_GUC);
> >  	CASE2STR(PAUSE_FAILED);
> >  	CASE2STR(PAUSED);
> > +	CASE2STR(SAVE_WIP);
> > +	CASE2STR(SAVE_FAILED);
> > +	CASE2STR(SAVED);
> > +	CASE2STR(RESTORE_WIP);
> > +	CASE2STR(RESTORE_FAILED);
> > +	CASE2STR(RESTORED);
> >  	CASE2STR(RESUME_WIP);
> >  	CASE2STR(RESUME_SEND_RESUME);
> >  	CASE2STR(RESUME_FAILED);
> > @@ -208,6 +214,8 @@ static unsigned long pf_get_default_timeout(enum xe_gt_sriov_control_bits bit)
> >  	case XE_GT_SRIOV_STATE_FLR_WIP:
> >  	case XE_GT_SRIOV_STATE_FLR_RESET_CONFIG:
> >  		return 5 * HZ;
> > +	case XE_GT_SRIOV_STATE_RESTORE_WIP:
> > +		return 20 * HZ;
> >  	default:
> >  		return HZ;
> >  	}
> > @@ -329,6 +337,8 @@ static void pf_exit_vf_mismatch(struct xe_gt *gt, unsigned int vfid)
> >  	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSE_FAILED);
> >  	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESUME_FAILED);
> >  	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_FLR_FAILED);
> > +	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_FAILED);
> > +	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_FAILED);
> >  }
> >  
> >  #define pf_enter_vf_state_machine_bug(gt, vfid) ({	\
> > @@ -359,6 +369,8 @@ static void pf_queue_vf(struct xe_gt *gt, unsigned int vfid)
> >  
> >  static void pf_exit_vf_flr_wip(struct xe_gt *gt, unsigned int vfid);
> >  static void pf_exit_vf_stop_wip(struct xe_gt *gt, unsigned int vfid);
> > +static void pf_exit_vf_save_wip(struct xe_gt *gt, unsigned int vfid);
> > +static void pf_exit_vf_restore_wip(struct xe_gt *gt, unsigned int vfid);
> >  static void pf_exit_vf_pause_wip(struct xe_gt *gt, unsigned int vfid);
> >  static void pf_exit_vf_resume_wip(struct xe_gt *gt, unsigned int vfid);
> >  
> > @@ -380,6 +392,8 @@ static void pf_exit_vf_wip(struct xe_gt *gt, unsigned int vfid)
> >  
> >  		pf_exit_vf_flr_wip(gt, vfid);
> >  		pf_exit_vf_stop_wip(gt, vfid);
> > +		pf_exit_vf_save_wip(gt, vfid);
> > +		pf_exit_vf_restore_wip(gt, vfid);
> >  		pf_exit_vf_pause_wip(gt, vfid);
> >  		pf_exit_vf_resume_wip(gt, vfid);
> >  
> > @@ -399,6 +413,8 @@ static void pf_enter_vf_ready(struct xe_gt *gt, unsigned int vfid)
> >  	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSED);
> >  	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_STOPPED);
> >  	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESUMED);
> > +	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVED);
> > +	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORED);
> >  	pf_exit_vf_mismatch(gt, vfid);
> >  	pf_exit_vf_wip(gt, vfid);
> >  }
> > @@ -675,6 +691,8 @@ static void pf_enter_vf_resumed(struct xe_gt *gt, unsigned int vfid)
> >  {
> >  	pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESUMED);
> >  	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSED);
> > +	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVED);
> > +	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORED);
> >  	pf_exit_vf_mismatch(gt, vfid);
> >  	pf_exit_vf_wip(gt, vfid);
> >  }
> > @@ -753,6 +771,16 @@ int xe_gt_sriov_pf_control_resume_vf(struct xe_gt *gt, unsigned int vfid)
> >  		return -EPERM;
> >  	}
> >  
> > +	if (pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WIP)) {
> > +		xe_gt_sriov_dbg(gt, "VF%u save is in progress!\n", vfid);
> > +		return -EBUSY;
> > +	}
> > +
> > +	if (pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WIP)) {
> > +		xe_gt_sriov_dbg(gt, "VF%u restore is in progress!\n", vfid);
> > +		return -EBUSY;
> > +	}
> > +
> >  	if (!pf_enter_vf_resume_wip(gt, vfid)) {
> >  		xe_gt_sriov_dbg(gt, "VF%u resume already in progress!\n", vfid);
> >  		return -EALREADY;
> > @@ -776,6 +804,218 @@ int xe_gt_sriov_pf_control_resume_vf(struct xe_gt *gt, unsigned int vfid)
> >  	return -ECANCELED;
> >  }
> >  
> > +static void pf_exit_vf_save_wip(struct xe_gt *gt, unsigned int vfid)
> > +{
> > +	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WIP);
> > +}
> > +
> > +static void pf_enter_vf_saved(struct xe_gt *gt, unsigned int vfid)
> > +{
> > +	if (!pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVED))
> > +		pf_enter_vf_state_machine_bug(gt, vfid);
> > +
> > +	xe_gt_sriov_dbg(gt, "VF%u saved!\n", vfid);
> 
> nit: you can move expect(PAUSED) here

Ok.

> 
> > +
> > +	pf_exit_vf_mismatch(gt, vfid);
> > +	pf_exit_vf_wip(gt, vfid);
> > +	pf_expect_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSED);
> > +}
> > +
> > +static bool pf_handle_vf_save(struct xe_gt *gt, unsigned int vfid)
> > +{
> > +	if (!pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WIP))
> > +		return false;
> > +
> > +	pf_enter_vf_saved(gt, vfid);
> > +
> > +	return true;
> > +}
> > +
> > +static bool pf_enter_vf_save_wip(struct xe_gt *gt, unsigned int vfid)
> > +{
> > +	if (pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WIP)) {
> > +		pf_enter_vf_wip(gt, vfid);
> > +		pf_queue_vf(gt, vfid);
> > +		return true;
> > +	}
> > +
> > +	return false;
> > +}
> > +
> > +/**
> > + * xe_gt_sriov_pf_control_trigger_save_vf() - Start an SR-IOV VF migration data save sequence.
> > + * @gt: the &xe_gt
> > + * @vfid: the VF identifier
> > + *
> > + * This function is for PF only.
> > + *
> > + * Return: 0 on success or a negative error code on failure.
> > + */
> > +int xe_gt_sriov_pf_control_trigger_save_vf(struct xe_gt *gt, unsigned int vfid)
> > +{
> > +	if (pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_STOPPED)) {
> > +		xe_gt_sriov_dbg(gt, "VF%u is stopped!\n", vfid);
> > +		return -EPERM;
> > +	}
> > +
> > +	if (!pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSED)) {
> > +		xe_gt_sriov_dbg(gt, "VF%u is not paused!\n", vfid);
> > +		return -EPERM;
> > +	}
> > +
> > +	if (pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WIP)) {
> > +		xe_gt_sriov_dbg(gt, "VF%u restore is in progress!\n", vfid);
> > +		return -EBUSY;
> > +	}
> > +
> > +	if (!pf_enter_vf_save_wip(gt, vfid)) {
> > +		xe_gt_sriov_dbg(gt, "VF%u save already in progress!\n", vfid);
> > +		return -EALREADY;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +/**
> > + * xe_gt_sriov_pf_control_finish_save_vf() - Complete a VF migration data save sequence.
> > + * @gt: the &xe_gt
> > + * @vfid: the VF identifier
> > + *
> > + * This function is for PF only.
> > + *
> > + * Return: 0 on success or a negative error code on failure.
> > + */
> > +int xe_gt_sriov_pf_control_finish_save_vf(struct xe_gt *gt, unsigned int vfid)
> > +{
> > +	if (!pf_expect_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVED)) {
> > +		pf_enter_vf_mismatch(gt, vfid);
> > +		return -EIO;
> > +	}
> > +
> > +	pf_expect_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSED);
> > +
> > +	return 0;
> > +}
> > +
> > +static void pf_exit_vf_restore_wip(struct xe_gt *gt, unsigned int vfid)
> > +{
> > +	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WIP);
> > +}
> > +
> > +static void pf_enter_vf_restored(struct xe_gt *gt, unsigned int vfid)
> > +{
> > +	if (!pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORED))
> > +		pf_enter_vf_state_machine_bug(gt, vfid);
> > +
> > +	xe_gt_sriov_dbg(gt, "VF%u restored!\n", vfid);
> > +
> > +	pf_exit_vf_mismatch(gt, vfid);
> > +	pf_exit_vf_wip(gt, vfid);
> > +	pf_expect_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSED);
> > +}
> > +
> > +static bool pf_handle_vf_restore(struct xe_gt *gt, unsigned int vfid)
> > +{
> > +	if (!pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WIP))
> > +		return false;
> > +
> > +	pf_enter_vf_restored(gt, vfid);
> > +
> > +	return true;
> > +}
> > +
> > +static bool pf_enter_vf_restore_wip(struct xe_gt *gt, unsigned int vfid)
> > +{
> > +	if (pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WIP)) {
> > +		pf_enter_vf_wip(gt, vfid);
> > +		pf_queue_vf(gt, vfid);
> > +		return true;
> > +	}
> > +
> > +	return false;
> > +}
> > +
> > +/**
> > + * xe_gt_sriov_pf_control_trigger restore_vf() - Start an SR-IOV VF migration data restore sequence.
> > + * @gt: the &xe_gt
> > + * @vfid: the VF identifier
> > + *
> > + * This function is for PF only.
> > + *
> > + * Return: 0 on success or a negative error code on failure.
> > + */
> > +int xe_gt_sriov_pf_control_trigger_restore_vf(struct xe_gt *gt, unsigned int vfid)
> > +{
> > +	if (pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_STOPPED)) {
> > +		xe_gt_sriov_dbg(gt, "VF%u is stopped!\n", vfid);
> > +		return -EPERM;
> > +	}
> > +
> > +	if (!pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSED)) {
> > +		xe_gt_sriov_dbg(gt, "VF%u is not paused!\n", vfid);
> > +		return -EPERM;
> > +	}
> > +
> > +	if (pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WIP)) {
> > +		xe_gt_sriov_dbg(gt, "VF%u save is in progress!\n", vfid);
> > +		return -EBUSY;
> > +	}
> > +
> > +	if (!pf_enter_vf_restore_wip(gt, vfid)) {
> > +		xe_gt_sriov_dbg(gt, "VF%u restore already in progress!\n", vfid);
> > +		return -EALREADY;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static int pf_wait_vf_restore_done(struct xe_gt *gt, unsigned int vfid)
> > +{
> > +	unsigned long timeout = pf_get_default_timeout(XE_GT_SRIOV_STATE_RESTORE_WIP);
> > +	int err;
> > +
> > +	err = pf_wait_vf_wip_done(gt, vfid, timeout);
> > +	if (err) {
> > +		xe_gt_sriov_notice(gt, "VF%u RESTORE didn't finish in %u ms (%pe)\n",
> > +				   vfid, jiffies_to_msecs(timeout), ERR_PTR(err));
> > +		return err;
> > +	}
> > +
> > +	if (!pf_expect_vf_not_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_FAILED))
> > +		return -EIO;
> > +
> > +	return 0;
> > +}
> > +
> > +/**
> > + * xe_gt_sriov_pf_control_finish_restore_vf() - Complete a VF migration data restore sequence.
> > + * @gt: the &xe_gt
> > + * @vfid: the VF identifier
> > + *
> > + * This function is for PF only.
> > + *
> > + * Return: 0 on success or a negative error code on failure.
> > + */
> > +int xe_gt_sriov_pf_control_finish_restore_vf(struct xe_gt *gt, unsigned int vfid)
> > +{
> > +	int ret;
> > +
> > +	if (pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WIP)) {
> > +		ret = pf_wait_vf_restore_done(gt, vfid);
> > +		if (ret)
> > +			return ret;
> > +	}
> > +
> > +	if (!pf_expect_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORED)) {
> > +		pf_enter_vf_mismatch(gt, vfid);
> > +		return -EIO;
> > +	}
> > +
> > +	pf_expect_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSED);
> > +
> > +	return 0;
> > +}
> > +
> >  /**
> >   * DOC: The VF STOP state machine
> >   *
> > @@ -817,6 +1057,8 @@ static void pf_enter_vf_stopped(struct xe_gt *gt, unsigned int vfid)
> >  
> >  	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESUMED);
> >  	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSED);
> > +	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVED);
> > +	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORED);
> >  	pf_exit_vf_mismatch(gt, vfid);
> >  	pf_exit_vf_wip(gt, vfid);
> >  }
> > @@ -1461,6 +1703,12 @@ static bool pf_process_vf_state_machine(struct xe_gt *gt, unsigned int vfid)
> >  	if (pf_exit_vf_pause_save_guc(gt, vfid))
> >  		return true;
> >  
> > +	if (pf_handle_vf_save(gt, vfid))
> > +		return true;
> > +
> > +	if (pf_handle_vf_restore(gt, vfid))
> > +		return true;
> > +
> >  	if (pf_exit_vf_resume_send_resume(gt, vfid))
> >  		return true;
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h
> > index 8a72ef3778d47..abc233f6302ed 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h
> > @@ -14,8 +14,14 @@ struct xe_gt;
> >  int xe_gt_sriov_pf_control_init(struct xe_gt *gt);
> >  void xe_gt_sriov_pf_control_restart(struct xe_gt *gt);
> >  
> > +bool xe_gt_sriov_pf_control_check_vf_data_wip(struct xe_gt *gt, unsigned int vfid);
> > +
> >  int xe_gt_sriov_pf_control_pause_vf(struct xe_gt *gt, unsigned int vfid);
> >  int xe_gt_sriov_pf_control_resume_vf(struct xe_gt *gt, unsigned int vfid);
> > +int xe_gt_sriov_pf_control_trigger_save_vf(struct xe_gt *gt, unsigned int vfid);
> > +int xe_gt_sriov_pf_control_finish_save_vf(struct xe_gt *gt, unsigned int vfid);
> > +int xe_gt_sriov_pf_control_trigger_restore_vf(struct xe_gt *gt, unsigned int vfid);
> > +int xe_gt_sriov_pf_control_finish_restore_vf(struct xe_gt *gt, unsigned int vfid);
> >  int xe_gt_sriov_pf_control_stop_vf(struct xe_gt *gt, unsigned int vfid);
> >  int xe_gt_sriov_pf_control_trigger_flr(struct xe_gt *gt, unsigned int vfid);
> >  int xe_gt_sriov_pf_control_sync_flr(struct xe_gt *gt, unsigned int vfid, bool sync);
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
> > index c80b7e77f1ad2..e113dc98b33ce 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
> > @@ -31,6 +31,12 @@
> >   * @XE_GT_SRIOV_STATE_PAUSE_SAVE_GUC: indicates that the PF needs to save the VF GuC state.
> >   * @XE_GT_SRIOV_STATE_PAUSE_FAILED: indicates that a VF pause operation has failed.
> >   * @XE_GT_SRIOV_STATE_PAUSED: indicates that the VF is paused.
> > + * @XE_GT_SRIOV_STATE_SAVE_WIP: indicates that VF save operation is in progress.
> > + * @XE_GT_SRIOV_STATE_SAVE_FAILED: indicates that VF save operation has failed.
> > + * @XE_GT_SRIOV_STATE_SAVED: indicates that VF data is saved.
> > + * @XE_GT_SRIOV_STATE_RESTORE_WIP: indicates that VF restore operation is in progress.
> > + * @XE_GT_SRIOV_STATE_RESTORE_FAILED: indicates that VF restore operation has failed.
> > + * @XE_GT_SRIOV_STATE_RESTORED: indicates that VF data is restored.
> >   * @XE_GT_SRIOV_STATE_RESUME_WIP: indicates the a VF resume operation is in progress.
> >   * @XE_GT_SRIOV_STATE_RESUME_SEND_RESUME: indicates that the PF is about to send RESUME command.
> >   * @XE_GT_SRIOV_STATE_RESUME_FAILED: indicates that a VF resume operation has failed.
> > @@ -63,6 +69,14 @@ enum xe_gt_sriov_control_bits {
> >  	XE_GT_SRIOV_STATE_PAUSE_FAILED,
> >  	XE_GT_SRIOV_STATE_PAUSED,
> >  
> > +	XE_GT_SRIOV_STATE_SAVE_WIP,
> > +	XE_GT_SRIOV_STATE_SAVE_FAILED,
> > +	XE_GT_SRIOV_STATE_SAVED,
> > +
> > +	XE_GT_SRIOV_STATE_RESTORE_WIP,
> > +	XE_GT_SRIOV_STATE_RESTORE_FAILED,
> > +	XE_GT_SRIOV_STATE_RESTORED,
> > +
> >  	XE_GT_SRIOV_STATE_RESUME_WIP,
> >  	XE_GT_SRIOV_STATE_RESUME_SEND_RESUME,
> >  	XE_GT_SRIOV_STATE_RESUME_FAILED,
> 
> it is easier to understand those states after patch 04/26 with diagrams,
> and while there are small and hard to avoid overlaps between 03/26 and 04/26
> the patch itself LGTM, so
> 
> Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

Thanks,
-Michał
