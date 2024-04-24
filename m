Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B0D8B0820
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 13:13:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C13110EF95;
	Wed, 24 Apr 2024 11:13:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g/fSpIj6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B59BF10EF95;
 Wed, 24 Apr 2024 11:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713957181; x=1745493181;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=pCuHaKcL8tjkU/gSrsyP2M72fh5euVqxgy0BBQQVhDM=;
 b=g/fSpIj6KGqnwRaauQEsoQwPi0PVupSVPlzXRGb5Rbw8qrJPnVkVJxNf
 wh0u5q/mgcmC028+mjRoWzrf4RYmbAajgQyXm55eLkigP6CGry21sS1D6
 FH/2fBu6dETiy8fqhFMQonsurhb4+gxcnnNtBARdGHTILieHJ0YiIHqv2
 16CirZAehsiyv/Hc4dHCmVC4W7f4yTdGXmN7O9E8TNJzSldBXBobcc2ui
 gE30c+/zV7G7hKEmJcl0+0EhagGKPLeqj8pGGrLtw6LRq3ARE19s8hmtn
 h5jb4y+a7PcOpUyZfndjAXvSya/bVOkfyOsDctEuHlu5z/8F0uTwTh4FX Q==;
X-CSE-ConnectionGUID: DzTIefHETIWNFMVkmdR2pA==
X-CSE-MsgGUID: HqTOd13tQGyDqtOWtog2SQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="9746986"
X-IronPort-AV: E=Sophos;i="6.07,226,1708416000"; 
   d="scan'208";a="9746986"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2024 04:13:01 -0700
X-CSE-ConnectionGUID: Av9Dbcg0QGCFyF3v1Ft8pQ==
X-CSE-MsgGUID: uh1MDRf3T1SMlMwUVugkzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,226,1708416000"; d="scan'208";a="29161152"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Apr 2024 04:13:00 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 24 Apr 2024 04:13:00 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 24 Apr 2024 04:12:59 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 24 Apr 2024 04:12:59 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 24 Apr 2024 04:12:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XcdMdkhUFyvzpKg/OW0Dfm2+N5AXncFLclRqJugMa3yMr1XtFjml9VmN9tGaok020aXx6x7NkHvoWrIet9acNkqJOumFyjUeeFuIoeX7STyqPLb4bdWqysayzEPW+F3B5SeM2l9lBE9z3OC6VUo1b+2fE8j4FI71u9LjPVvTiGsYa/3zuCoEVS1fUiBCXZb1UhIiZLOeIb6fJNcDxapLAJR+2AT/S0dZrQe4zfXIRE7jWvj9VVY9vrliIbJkkv9lQKOKwJV0rCEVEQKcLtRQw2j0dcCKp1y9U3ks7OInIvq5xzi0nueETjajWCAEdadysR6AvAEGAoYeWInZdkADSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m0tFfKwjGK469SZzl2jPJAM2haomEgdtb3Aly6WF6mE=;
 b=Un6/5fnS/sxq42tp+10p1Oap2ZM/z5y4aEjQ0iIwmKEjZ+8mhXYPTbc+PVicMlYEbEc49Qlp5pFh5xVaOWSRMRb+/CDLq+S1s+43hQ3o091CJA5bwjUA+FHyusP79t9a3zvPaA1tduzzx5/r8NpUmxh5w/Tg7SGLyrdK4WNbWmauYyp8l7vPvRxjlf9P674EYrqosY1eP6F+U6/HJUg0qQswS9lYBzi8nYWrniuVpkRdOSyv+uidINjzHoosDySNJm/pUd5nkqLp+B+onCSA9EvIDXMgFltwRWpIAjLlE0K7YPJnNVTdAjkSw5WOovy0a/52ROiOAxAZBCu4o0GTGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by SA1PR11MB7085.namprd11.prod.outlook.com (2603:10b6:806:2ba::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.22; Wed, 24 Apr
 2024 11:12:52 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::8e17:1f3b:64f:9c67]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::8e17:1f3b:64f:9c67%4]) with mapi id 15.20.7519.021; Wed, 24 Apr 2024
 11:12:52 +0000
Message-ID: <48f22c33-87e5-4dd6-856d-441ebef49341@intel.com>
Date: Wed, 24 Apr 2024 16:42:42 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] drm/xe/FLR: Support PCIe FLR
To: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>, <daniel@ffwll.ch>,
 <maarten.lankhorst@linux.intel.com>, <airlied@gmail.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Michal Wajdeczko <michal.wajdeczko@intel.com>
References: <20240422065756.294679-1-aravind.iddamsetty@linux.intel.com>
 <20240422065756.294679-5-aravind.iddamsetty@linux.intel.com>
 <b3db0863-80b5-421e-b0cb-e2a9e0114206@intel.com>
 <180ea256-fbdb-48fd-aef1-ebb99afb58e0@linux.intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <180ea256-fbdb-48fd-aef1-ebb99afb58e0@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0250.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:21a::15) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|SA1PR11MB7085:EE_
X-MS-Office365-Filtering-Correlation-Id: e4533441-461f-4bcb-7a62-08dc644f7bbe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NVQybFh2c053REJHMDZWbE9qcGJvT1JldGhMNnhEb2pzY0JOYlFSUU1lNHVE?=
 =?utf-8?B?QzBQNzNsdkhPZkptOFVPdTVPNndxb3RLWUJOYlNQS3I0U2tGZUh2SDZVWG5h?=
 =?utf-8?B?ZURrbnRXR2tLaTlsblZZMTJ6TzRBdVlVN2NpcjNHZnQ3bnYyZGpqVHE3V1pw?=
 =?utf-8?B?V1Qrallod09Bc21ndUpoQ0dyYmxNN3F1QU5IQVJkWmdBUkMrTm5kaDdmMmdw?=
 =?utf-8?B?OWZHM0luR0l0ZTNNakZhTkUwNXJxNWk3NEtqMWdkYkFSaXdyQ0xkMjE0aXdw?=
 =?utf-8?B?RjZLM3BEcVBuTDd2TWlBUDhkSVFsRTV0a09OWWN3THRQTXRVOFl2TEdlZjJa?=
 =?utf-8?B?ZWtpV3JTSzdSSERUcWtKSFFocW1ZWHYwTnlkZUVkQW9Qd0svUTRNSnhZWU0r?=
 =?utf-8?B?bW5zUDBxY0dFQmxkVzB4QWlNSkZVOGVyODd4b2tZcHloOVNaSU9Cem4rNDdo?=
 =?utf-8?B?OU5NS2NscnpWY21ReVlSSFBEMW5ocUx5S0lRQWQ5ZHoxc3dVUjdBQjVtWThG?=
 =?utf-8?B?ejY2bTVCV0ZtU0diUE9Ba3dicThFR3VnMjNiUEV3Z29VcVBGcHpTY0JqWktj?=
 =?utf-8?B?bzVTRFdZZWNSOFh1UlljdVBIRGpPeU9IV081RzlWNjhVeEM1TGUvMXpuMGFF?=
 =?utf-8?B?YUZLNU9LUHRWeU1OUGw1bDQ3OUdOZHJLRW96akNhbEVlYmc2QjNLZ3ZqV2xW?=
 =?utf-8?B?TFpKbUc5QVltdTdFMTdoMU0zblNNWkMxbEp2cDdod0lNQTVBb2Mzc1lsOTJO?=
 =?utf-8?B?TzFoTUlyckJ0T0lvMHgxbzRwQ3Y1d2tjWWZPT3ZnNWJmMEtnTVhFRnJnMFFD?=
 =?utf-8?B?OVNBOUxiSEc1WFVDMmhJNGxKeGl0YXAxbVhtUmJ6WjVBZUlHTDNWQ0VPNFRE?=
 =?utf-8?B?TVZ1MFROT0ZsTWdwQzdiYW9wY3g4ZEY5SWJoeXR1VUtvZSsvMVVYcDBzbGRK?=
 =?utf-8?B?VEh0UnJTL096NWZsZmxkTDBmNVIwMjdWczJDQzhiL0VGampCZmtUamlkVWNW?=
 =?utf-8?B?dS9DMTVhUEkwVEYxWlgxaEFPNlBRUk9rWGk0MDA2NXJMZGEwcmdSRTFQbWFp?=
 =?utf-8?B?MVp1Y2wzRSsvaUVRVlNsc01HRmFXdUVoZ0hvbEFmZ1VmVE9JNzVtcHZUU1Js?=
 =?utf-8?B?ejRYTFNseS82OU5RdVlsZnBjQkZKNXlpbVhDaThzWGhsbVMxWWhqVE5SOHpE?=
 =?utf-8?B?TCswOXI0ZGNrR3ZXb3VFTGRseGhSTVhrdG1tWlg5bVoxRWJ3ZzVoVjJ3azJq?=
 =?utf-8?B?NjRkdHRYZVlEa3BQYzVjZDJTMHhpRFJ2Ymp6SkVXbTFjNWR1cGVrMHgvOE9h?=
 =?utf-8?B?eHZQUytWVjV0dnJjRzgxcXNvWWtuRTcvNzlHdEsrZ203UjU0TDZHeTJES1NF?=
 =?utf-8?B?UWFJVHFrdzVESEZ0NktHbWh0Z0FMTTBkdEJ6bkk4WUorQ2liOTJiQ2FBcWRt?=
 =?utf-8?B?dDFJZ0dRMVVCbWNsTW5idjZoaGRNanRSUlFuSVRiWUd2OHpaZS9adDI1bzZ2?=
 =?utf-8?B?aXBMOVVDUHhwaW9sdWNXOFo2dW9jRDduRzIxOXN2ZldJQS9nZXBCOWZHODRT?=
 =?utf-8?B?aGt3VnMveDBrR3JESlhlVXRGOXcrRzNrU05QMGExYUNLUktlaUdobWY1VGNn?=
 =?utf-8?B?bjZLTTVvRTJWTk5ITmRUaTRiY3ZhMXhnVXN6UEhjREpDeDY3ZDFZSERNOGlE?=
 =?utf-8?B?SC9hQUdWS2FLSmU3TDlSWmFlcHh2Nnh5WFhsRks2NWxaNHhHdFozL3hnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q1preW1yY0lXZnZHbWlib3doNTNoMjdlbWZ4ditmczVvMHh4czVFYWh6Sit1?=
 =?utf-8?B?dXNiTTVXbmxCV282RjhXdWU1bDhBZXVCU000TVNpK1NFV1pIU0JUOE1mcHQ3?=
 =?utf-8?B?bVd6aVZxcWRsanVjbDJNSjI2bisraVZTRnpoUUZVY2lsVmxiZWNmQ0Q4SW9y?=
 =?utf-8?B?S082REhLQW9YU2puVTFUZ1hKRitRT0NHWCtsb1NocGthekZzdkkxL1dseTVR?=
 =?utf-8?B?MGpXQXVQbGxhalhrUU5YeHhOWDhYTkRmMFBLRmk4cGEyU0ZKVE15OEFnSzRE?=
 =?utf-8?B?elU5MWRqeW9YemVMVXBzV0JVTVFGVXpTSWw1c3ZwR0VWZGdLUy81MEh6L2xM?=
 =?utf-8?B?OVQ0UTRBak5MY1FWM3VTZ1ZUSUF0OTVxNGVtMHlFbHd1Y1FiT2c2QVdrSHBY?=
 =?utf-8?B?OGtIdHM3K2hzakdnYVQ5VGg2YXVabmNqSmRHODNMWmFwd0xaWDdmeXhPeDY0?=
 =?utf-8?B?SmNBZ3pRb3JSU3E1UlQyb1VZaUtOZk9haEtKRDFlNXRGK3dkeXZVdjFMdEVL?=
 =?utf-8?B?Q3dJaStkMEVta0JsUzZHN3Exb1U4REcwSHZoMSswbXg1WVM4TGxWZXl6QWI4?=
 =?utf-8?B?MUwvZzhmN3FodUdNR3hkL0poZ0lsVG1UNitRM1dLeXdWbDJVbzlYSWFlKzBl?=
 =?utf-8?B?MFEvVzc5WmVBZXNZeDJWQzNzTHYxWkt1NzZvT3VwMld0QnE0WWp0aGkvY1VZ?=
 =?utf-8?B?TjJTMENvemgvdXg4SEVVdDAyaFB4U2lNMzRZS2dtcFd1dVJwZ2k4L0lSUHdG?=
 =?utf-8?B?Q1BzVzJjK0p0Z0lmMXpjTlkyeDVUT2RhUDFtWHVncUdNa3RjT2ZxMklIZnNR?=
 =?utf-8?B?SzNuSXRUYnFZaCtMSDhlbzZLSlVCOFlaSnVrWEUwRFlnS0FCeXd1YUlTSCtS?=
 =?utf-8?B?MUZzVFBXRWJBaU5UL0NKTnZXbHV6STczblRFNzM2VjZ2RzdHTUpMaVVEbjFh?=
 =?utf-8?B?TXN6S3dlZE96Q2h0SjN5VWpSc08vY3BtdXc5WGJKRjRLTjlHTVg3TjErSEQ4?=
 =?utf-8?B?VUIxMW5XbEhoMktVOVVNZ0ZzZFFISGRGbWNxZk04RGhYTnVFSWZ2UGRicktK?=
 =?utf-8?B?elcvckJYSldZcDhaMi9zaElCOTlOdUtBOThLM1ZzeGd1TVJGVnFDUkZud0lR?=
 =?utf-8?B?dG0zOU5xMW0rVDRJS3ZLNUUzdUorb1NRajk0MTcrZ0tjSTJXZWxtU0o2RkRL?=
 =?utf-8?B?OTNSY0tiZDhTQUVHOGpaQ2VUSHBvNnVTUm1aaTMyTnhZREdRS2NQUUJ4Wm5a?=
 =?utf-8?B?a3UxMk9ZNTRWbWlYaldRSEJETGFGazRWamhBZSt5SU10czd1bjE0ZTFOQUpp?=
 =?utf-8?B?SEZKVDMvYkJMNDQ4aWdQOGxnaUw3cEtJYnkzSXZWZ2RGdVJCa2hPRFkrYldj?=
 =?utf-8?B?bGR1ME1xeVVzb01jTnJjUmRBM2xvSUtKN0xDM3hZM3pYRUFvT1hMckhZdHln?=
 =?utf-8?B?cGFMQ2ROeWZsWnlIYlk5U2tpWGVTb2NyanJkTmFwV1AzdzFIbEpnYThvSFVs?=
 =?utf-8?B?Z3Y1WlNTdkVSc2djc01GTjRKSjJkOWNGNkRaT1l3QjhSTG45bEYyQTlNNWJk?=
 =?utf-8?B?UCt3TEJHaTRWbDB2RCtTaWEzUHhuVzFmRGVaRzRJc0NpQkxwZEZGYU1YcUgx?=
 =?utf-8?B?WCtiWFF4NXZPcSt2eXBWdTR6K1JqYXVYb2hkZGZqWlpsS3dZMkZFQzJYbXhm?=
 =?utf-8?B?MkRuTTlQcjZzRGJ5NWVtWmNuMjZwWjlGREpwaTBzYTc3SmdEV0xMSVZYc0dS?=
 =?utf-8?B?TkFTeHlQUVFranlhQ2d6ZUZCR3I2L2FNZUtMZXJ2d1Z5QWNNOVVMTm1HRWhm?=
 =?utf-8?B?ZnNaanN4bDdWT2Q5WXd2Y014TllHOTVQS0xvNEV1WTFYYUdxNk1yRTNkcEJL?=
 =?utf-8?B?N2JoUlBjN1hpM2RXaW9uY3R5RDdLQjMxWktrcm9tSHRiaUEvQ3NtR0s2dElt?=
 =?utf-8?B?bUZBWUxPMWV2THJiUlNuYUF4V21PM1BTbDlYTWlNaUVvNWlCQS9LSTBGR1VU?=
 =?utf-8?B?bUNxOFVxdGF2RjJWZk9vay90d3NReU9oTzdSakJKT2JTOTl0NnVYNkpEalkz?=
 =?utf-8?B?MDBpbVVzb0dPck1XTk0yS0x0b2k2eDZDRFVDT2RtNlo0TitUQXFmSSs3dkxv?=
 =?utf-8?B?T2JnR1d3TFZ4OTVLVktOV1Z2T1FwNjY0SkdGUXpoU21tZitjRzA4cW9lc0Js?=
 =?utf-8?B?U1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e4533441-461f-4bcb-7a62-08dc644f7bbe
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2024 11:12:52.4840 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +j1tsB36wsAd99hHCk1TfRF9lnGrMxh2YVMPUzwtxETDHgGohXrV0mQml2HLIyLEMv+hUdQ+g9v/Aj0Z1WHyyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7085
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



On 24-04-2024 08:42, Aravind Iddamsetty wrote:
> 
> On 23/04/24 20:34, Nilawar, Badal wrote:
>>
>>
>> On 22-04-2024 12:27, Aravind Iddamsetty wrote:
>>> PCI subsystem provides callbacks to inform the driver about a request to
>>> do function level reset by user, initiated by writing to sysfs entry
>>> /sys/bus/pci/devices/.../reset. This will allow the driver to handle FLR
>>> without the need to do unbind and rebind as the driver needs to
>>> reinitialize the device afresh post FLR.
>>>
>>> v2:
>>> 1. separate out gt idle and pci save/restore to a separate patch (Lucas)
>>> 2. Fixed the warnings seen around xe_guc_submit_stop, xe_guc_puc_fini
>>>
>>> v3: declare xe_pci_err_handlers as static(Michal)
>>>
>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>>
>>> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
>>> ---
>>>    drivers/gpu/drm/xe/Makefile          |  1 +
>>>    drivers/gpu/drm/xe/xe_device_types.h |  3 +
>>>    drivers/gpu/drm/xe/xe_guc_pc.c       |  4 ++
>>>    drivers/gpu/drm/xe/xe_pci.c          |  9 ++-
>>>    drivers/gpu/drm/xe/xe_pci.h          |  2 +
>>>    drivers/gpu/drm/xe/xe_pci_err.c      | 88 ++++++++++++++++++++++++++++
>>>    drivers/gpu/drm/xe/xe_pci_err.h      | 13 ++++
>>>    7 files changed, 119 insertions(+), 1 deletion(-)
>>>    create mode 100644 drivers/gpu/drm/xe/xe_pci_err.c
>>>    create mode 100644 drivers/gpu/drm/xe/xe_pci_err.h
>>>
>>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>>> index 8bc62bfbc679..693971a1fac0 100644
>>> --- a/drivers/gpu/drm/xe/Makefile
>>> +++ b/drivers/gpu/drm/xe/Makefile
>>> @@ -117,6 +117,7 @@ xe-y += xe_bb.o \
>>>        xe_module.o \
>>>        xe_pat.o \
>>>        xe_pci.o \
>>> +    xe_pci_err.o \
>>>        xe_pcode.o \
>>>        xe_pm.o \
>>>        xe_preempt_fence.o \
>>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>>> index 0a66555229e9..8c749b378a92 100644
>>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>>> @@ -465,6 +465,9 @@ struct xe_device {
>>>        /** @pci_state: PCI state of device */
>>>        struct pci_saved_state *pci_state;
>>>    +    /** @pci_device_is_reset: device went through PCIe FLR */
>>> +    bool pci_device_is_reset;
>>> +
>>>        /* private: */
>>>      #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
>>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
>>> index 509649d0e65e..efba0fbe2f5c 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
>>> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
>>> @@ -902,6 +902,10 @@ static void xe_guc_pc_fini(struct drm_device *drm, void *arg)
>>>            return;
>>>        }
>>>    +    /* We already have done this before going through a reset, so skip here */
>>> +    if (xe->pci_device_is_reset)
>>> +        return;
>>> +
>>>        XE_WARN_ON(xe_force_wake_get(gt_to_fw(pc_to_gt(pc)), XE_FORCEWAKE_ALL));
>>>        XE_WARN_ON(xe_guc_pc_gucrc_disable(pc));
>>>        XE_WARN_ON(xe_guc_pc_stop(pc));
>>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>>> index a62300990e19..b5a582afc9e7 100644
>>> --- a/drivers/gpu/drm/xe/xe_pci.c
>>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>>> @@ -23,6 +23,7 @@
>>>    #include "xe_macros.h"
>>>    #include "xe_mmio.h"
>>>    #include "xe_module.h"
>>> +#include "xe_pci_err.h"
>>>    #include "xe_pci_types.h"
>>>    #include "xe_pm.h"
>>>    #include "xe_sriov.h"
>>> @@ -738,7 +739,7 @@ static void xe_pci_remove(struct pci_dev *pdev)
>>>        pci_set_drvdata(pdev, NULL);
>>>    }
>>>    -static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>>> +int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>>>    {
>>>        const struct xe_device_desc *desc = (const void *)ent->driver_data;
>>>        const struct xe_subplatform_desc *subplatform_desc;
>>> @@ -986,6 +987,11 @@ static const struct dev_pm_ops xe_pm_ops = {
>>>    };
>>>    #endif
>>>    +static const struct pci_error_handlers xe_pci_err_handlers = {
>>> +    .reset_prepare = xe_pci_reset_prepare,
>>> +    .reset_done = xe_pci_reset_done,
>>> +};
>>> +
>>>    static struct pci_driver xe_pci_driver = {
>>>        .name = DRIVER_NAME,
>>>        .id_table = pciidlist,
>>> @@ -995,6 +1001,7 @@ static struct pci_driver xe_pci_driver = {
>>>    #ifdef CONFIG_PM_SLEEP
>>>        .driver.pm = &xe_pm_ops,
>>>    #endif
>>> +    .err_handler = &xe_pci_err_handlers,
>>>    };
>>>      int xe_register_pci_driver(void)
>>> diff --git a/drivers/gpu/drm/xe/xe_pci.h b/drivers/gpu/drm/xe/xe_pci.h
>>> index 73b90a430d1f..9faf5380a09e 100644
>>> --- a/drivers/gpu/drm/xe/xe_pci.h
>>> +++ b/drivers/gpu/drm/xe/xe_pci.h
>>> @@ -7,8 +7,10 @@
>>>    #define _XE_PCI_H_
>>>      struct pci_dev;
>>> +struct pci_device_id;
>>>      int xe_register_pci_driver(void);
>>>    void xe_unregister_pci_driver(void);
>>>    void xe_load_pci_state(struct pci_dev *pdev);
>>> +int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent);
>>>    #endif
>>> diff --git a/drivers/gpu/drm/xe/xe_pci_err.c b/drivers/gpu/drm/xe/xe_pci_err.c
>>> new file mode 100644
>>> index 000000000000..5306925ea2fa
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/xe/xe_pci_err.c
>>> @@ -0,0 +1,88 @@
>>> +// SPDX-License-Identifier: MIT
>>> +/*
>>> + * Copyright © 2024 Intel Corporation
>>> + */
>>> +
>>> +#include <linux/pci.h>
>>> +#include <drm/drm_drv.h>
>>> +
>>> +#include "xe_device.h"
>>> +#include "xe_gt.h"
>>> +#include "xe_gt_printk.h"
>>> +#include "xe_pci.h"
>>> +#include "xe_pci_err.h"
>>> +#include "xe_pm.h"
>>> +#include "xe_uc.h"
>>> +
>>> +/**
>>> + * xe_pci_reset_prepare - Called when user issued a PCIe reset
>>> + * via /sys/bus/pci/devices/.../reset.
>>> + * @pdev: PCI device struct
>>> + */
>>> +void xe_pci_reset_prepare(struct pci_dev *pdev)
>>> +{
>>> +    struct xe_device *xe = pci_get_drvdata(pdev);
>>> +    struct xe_gt *gt;
>>> +    int id, err;
>>> +
>>> +    pci_warn(pdev, "preparing for PCIe reset\n");
>>> +
>>> +    drm_warn(&xe->drm, "removing device access to userspace\n");
>>> +    drm_dev_unplug(&xe->drm);
>>> +
>>> +    xe_pm_runtime_get(xe);
>>> +    /* idle the GTs */
>>> +    for_each_gt(gt, xe, id) {
>>> +        err = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>>> +        if (err)
>>> +            goto reset;
>>> +        xe_uc_reset_prepare(&gt->uc);
>>> +        xe_gt_idle(gt);
>>> +        err = xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>>> +        XE_WARN_ON(err);
>>> +    }
>>> +    xe_pm_runtime_put(xe);
>> Is xe_save_pci_state() needed here?
> 
> No, as the state has already been saved post driver probe.

Thanks for clarification. One more doubt I have is in FLR flow what will 
happen to buffer objects especially mmaped BOs. Will all the BOs get 
destroyed? I couldn't figure out it in the code.

Badal
> 
> Regards,
> Aravind.
>>
>> Regards,
>> Badal Nilawar> +
>>> +reset:
>>> +    pci_disable_device(pdev);
>>> +}
>>> +
>>> +/**
>>> + * xe_pci_reset_done - Called when PCIe reset is done.
>>> + * @pdev: PCI device struct
>>> + */
>>> +void xe_pci_reset_done(struct pci_dev *pdev)
>>> +{
>>> +    const struct pci_device_id *ent = pci_match_id(pdev->driver->id_table, pdev);
>>> +    struct xe_device *xe = pci_get_drvdata(pdev);
>>> +
>>> +    dev_info(&pdev->dev,
>>> +         "device went through PCIe reset, reenabling the device\n");
>>> +
>>> +    if (pci_enable_device(pdev)) {
>>> +        dev_err(&pdev->dev,
>>> +            "Cannot re-enable PCI device after reset\n");
>>> +        return;
>>> +    }
>>> +    pci_set_master(pdev);
>>> +    xe_load_pci_state(pdev);
>>> +
>>> +    xe->pci_device_is_reset = true;
>>> +    /*
>>> +     * We want to completely clean the driver and even destroy
>>> +     * the xe private data and reinitialize afresh similar to
>>> +     * probe
>>> +     */
>>> +    pdev->driver->remove(pdev);
>>> +    if (pci_dev_msi_enabled(pdev))
>>> +        pci_free_irq_vectors(pdev);
>>> +
>>> +    devm_drm_dev_release_action(&xe->drm);
>>> +    pci_disable_device(pdev);
>>> +
>>> +    /*
>>> +     * if this fails the driver might be in a stale state, only option is
>>> +     * to unbind and rebind
>>> +     */
>>> +    xe_pci_probe(pdev, ent);
>>> +}
>>> diff --git a/drivers/gpu/drm/xe/xe_pci_err.h b/drivers/gpu/drm/xe/xe_pci_err.h
>>> new file mode 100644
>>> index 000000000000..95a4c8ce9cf1
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/xe/xe_pci_err.h
>>> @@ -0,0 +1,13 @@
>>> +/* SPDX-License-Identifier: MIT */
>>> +/*
>>> + * Copyright © 2024 Intel Corporation
>>> + */
>>> +
>>> +#ifndef _XE_PCI_ERR_H_
>>> +#define _XE_PCI_ERR_H_
>>> +
>>> +struct pci_dev;
>>> +
>>> +void xe_pci_reset_prepare(struct pci_dev *pdev);
>>> +void xe_pci_reset_done(struct pci_dev *pdev);
>>> +#endif
