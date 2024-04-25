Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 173558B2A23
	for <lists+dri-devel@lfdr.de>; Thu, 25 Apr 2024 22:51:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9067A11A8CE;
	Thu, 25 Apr 2024 20:51:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lEhjCWg/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DFE711A8CB;
 Thu, 25 Apr 2024 20:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714078266; x=1745614266;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=5Iw7wtfXJzaI9nuTYprbHUjZGP8YgDy7oKZBY+yYT4s=;
 b=lEhjCWg/MAyM1NDD3Jo4qsrc4nNsyR4ivkczKALcgC7BlJuRvjA/v4Pj
 NDufCp37SNGvkvM8YWdh9WpELlnFphLtaaMsgID431Yy3m03S5U2yw9aD
 f5ditWnsP58EHuPoImsm5WNhdzyjQIlAExlUVZuq7RabuJeuddxjsDLhw
 lIATaTjRKj91BcdmdAhdECOn6FCbKCvMLtIVRWYVXvrlt8lemV9wHdUsT
 X0VjqyWVPplpwdYl68QOD9EO+IfDPe7i8XVQHLUgASwvxQC2B0ROXcjjk
 arrzK1nDknBThjKs/iHR8J3pV2FBViOcS9jDVIjsEIDKUHspoAmr7aa3S g==;
X-CSE-ConnectionGUID: Y5rIiFodQYegFlYs7ND2xA==
X-CSE-MsgGUID: P4ok4cNuTDyIfBlMRSSiCw==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="9657597"
X-IronPort-AV: E=Sophos;i="6.07,230,1708416000"; 
   d="scan'208";a="9657597"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 13:51:04 -0700
X-CSE-ConnectionGUID: /dZCAjYbSfiBuq0zzoCqeA==
X-CSE-MsgGUID: v19REummQQKkDMxj3LDj8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,230,1708416000"; d="scan'208";a="25251453"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Apr 2024 13:51:04 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 25 Apr 2024 13:51:03 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 25 Apr 2024 13:51:02 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 25 Apr 2024 13:51:02 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 25 Apr 2024 13:51:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZTnjtO5Vp9X8tGPCILFL/ZZW+InYMSLbxS2UWKk7YLMroiUH0YLToC8WafNuE7Dg/eJ9hIudtl4Yao2imw4umw1tlaYFscESN/d6UrICmZfLpR6dT7iPwSHC7uRuMevhY4+B/7AQxfIspaAJLuhzWksoWDO+0/3vtdqmEaUQanLTeT++Wce8bnt4aQcE0t5nxOsBheuC8s9Wpf0LnBaZ3kyP3Ipcjt5GfK859gUDpxrq9UyE/so6dJL9msvBVokXum02YahlbCTWwgDPOe8670CuY7G3MRlIkIHSNw0cqaQNS2zzDstE4ZRJj3c41of1OiGYgseCFXmobpws2zDhpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V8kugowOqkQ31Tlko3e2FxtwHkIZwzNeHJjLAjVOsik=;
 b=mtEx07KKZnnmbaSDx+ES20WtztwBnau6yjMCbleRYw/pU+IOU8/Llh3EHpSDoywoVdMbGQGap5HKOv8AYiFQ1rgKEPxsaXKW2EnWqBG3A7157GhmCLwMDTlZv1tYyUnP1DBEbcvX+/ZWnJYMpkbNsSK0bFPdC3PkpLeMkKFOq4biy78k1fOnweFXWVdv4UG/+9tGCALiCRi6cZk5+28GwaIcLyVo7j4rfURoQiWMQYMsHkPw/B382QvUXXQMAvgGl5iXZRe2sKRJd/b6U4xMbo7YaCUoyuWdIiXu2SBxsF3pki3VIFBGm7oOAbqMbPZMLCwb46o6BJLVAWLpRL612Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA0PR11MB4575.namprd11.prod.outlook.com (2603:10b6:806:9b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.24; Thu, 25 Apr
 2024 20:51:01 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7519.020; Thu, 25 Apr 2024
 20:51:00 +0000
Date: Thu, 25 Apr 2024 15:50:57 -0500
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
Message-ID: <gxaxtvxeoax7mnddxbl3tfn2hfnm5e4ngnl3wpi4p5tvn7il4s@fwsvpntse7bh>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
X-ClientProxiedBy: SJ0P220CA0026.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::30) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA0PR11MB4575:EE_
X-MS-Office365-Filtering-Correlation-Id: cfc2ab65-8c91-48d4-d3c4-08dc656969fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|7416005|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?tMePLE/mTwRqSrBiMcxOOSC2Yb854j5szVokT3O4zF5PIENTKZIIAIsd7LsD?=
 =?us-ascii?Q?LSz5/fgfGIkNToskoMMvhPRD4pDk9VETr8lNgx3xaWwDWb54psvtYZkTH+zO?=
 =?us-ascii?Q?7RdloRkiZk13gSKM9gDhvDch57LvnKoM4QYGZoy9vdBjTh7xZjkQ546uzhn+?=
 =?us-ascii?Q?Be18YQBLdq6vWEAshLDXTlUevV4EQhbxlgDCdFJkevbY8cQIjoYgdDLt/nj5?=
 =?us-ascii?Q?8n7mMkHa5CRP2eVUNHlnd8Z1PfFMqdr+grD/Cqa84hvg9dv/e+e8qQX2nYcP?=
 =?us-ascii?Q?MrbUCuocABeCF5IicPz/8uiZ6JAXiD0So0eBMCt4YKCK/31DcK/5s7h5AqhN?=
 =?us-ascii?Q?ZRjcfzY32sfwLHilD0+0TZjImxAzR9R5o2GXvrHlUa8z806pobvCuWMR4oPm?=
 =?us-ascii?Q?gVAUVzn1VUbATrpuiOeBrJXniKkZqWsWUmsyW/iV8MLsIZ5s9Rcn+cqJGaWL?=
 =?us-ascii?Q?ncIF8/RMR4/QlZozyRZ0AwRwAPK0TArLQvo2Q0pBZisBVgeviRbrxNqDgT2W?=
 =?us-ascii?Q?cuqnbU3Ntz28dyIG0itwgRbu/i7sDSsrLRHJSwSnWeKHOn07fCXN2qo3pJZm?=
 =?us-ascii?Q?CDtynP9yubCkSYVOcI3RIKXQaCm5mykq8R+nO2gR9K8FydAoHXejQj5ztFYh?=
 =?us-ascii?Q?ENRmFxVj5mwQX92Yu9jZRy/Y+eai9a/J5/6YCN6BMm52xudsikNbHQ5C/yiH?=
 =?us-ascii?Q?SjulhFAjLhsC6Q7+zkQTohAHBl6tiX+BWRj2JA55lpr2/xOqYNUF4/cM0IaT?=
 =?us-ascii?Q?p5k1hE2NYvWe/6RpVFKuWYVWSf0rpySBdjt9sKEEcX/HuFnZd29ljgUxvHp5?=
 =?us-ascii?Q?sksqI3zL0OTspxwuHW/7Sc+ueqS5H6VeUH4RAKZ8mQpJEJ/2miOaD2EAGrtX?=
 =?us-ascii?Q?caLsTH5cZjLZCjN0VzWI9YZoMBCZ4lbG376g+S2fAxpRsUHa271SpdkURjGz?=
 =?us-ascii?Q?uyop5VH6LxpvM9DwP1HNrDcuYwsGPKR/8Yy0VgRlKIUGhehsK+qoL7aPMyNs?=
 =?us-ascii?Q?Cqsqu1UdClByTMspHLWAnnYHmT9IA6b7JjFOfp/6QHAEdhM3d71I5BpGdFiX?=
 =?us-ascii?Q?XZGeFke6Y7jNW9HO/Z8+HOq/6XNmA5leDQIIh/lI73a4gGqxgTxeWza18gzM?=
 =?us-ascii?Q?+NJc644rkev/rs4FnVbQav6kN5Ygw4U/4JDjqCYQcT00TqcbxIKPHdk8UEYR?=
 =?us-ascii?Q?cYNJ0datFIRNk/RXlYJQoTHunvoGU9AYf8tN038e8qfPO8yfM78jI5qPfi0?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(7416005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LapRRuw4058T8wLIYrdlnI7pZy1HFV2koYY1IPSy53RrPSGG2cuySAOui8rP?=
 =?us-ascii?Q?P/HrLOwXC9SxuZmdhU6qz+hLOupV08Hfiu76sU9sApHEKKQQinDEOqtogg6Q?=
 =?us-ascii?Q?m53Hjc4Ei88myxr8MFveZ6RAbhbHmG8LNRX8nFRfbxuGG34cUpxDdnZNxowh?=
 =?us-ascii?Q?JI6o7HKSo4zFDoM/a2jt6tZAsEcxeWLbuk8TZLAEHnij4h8V17s3sgczuxQT?=
 =?us-ascii?Q?q4pbMxO7VE0TFXUAw9/8g8/4JSweDAN2iIAnPeJmKJDeCZXuoaAVQ3+CcrnF?=
 =?us-ascii?Q?G07BxW+KdQdXFqc9DlOv6pcTCq3b9cki9T8K1TY/nlXRivid8v4Z/D5vBhDG?=
 =?us-ascii?Q?+gjmiM378DU8MVm/1xD767ZPs3Qw1fzZIUM2ENlK0VQlyXFcy/VovY6ImDgI?=
 =?us-ascii?Q?w+p1PSoGeQPVa3wjPhnjOhLX8qPNEPjsHJbADIHkCPrX/g10oJVxX7cXDkZd?=
 =?us-ascii?Q?ZmGZ43zJG+xcwnV/Cho9tUBEb00r/AXZ5ikwkAtJoSbYO1HCO39D3+5w7tYL?=
 =?us-ascii?Q?82rAdwwLqn5SX7ClOeOsZHqM1ad0XUAeDM0bokOFEDSuZBEDpGb53mpNAUn4?=
 =?us-ascii?Q?PB6tGmQ7DfP1Jl5d++jntps/IvBp1NJztGRhp9VV9jn7QCXQKdFHsm765xYN?=
 =?us-ascii?Q?aKVagJOdg5h8ZI11gbHgUZnxLP0Zc8DuaVBqpTikcaHV6Ju/dX/zpaKBvDVn?=
 =?us-ascii?Q?wM1tIyt0w1Re1UU7gCuBoXsH2H87u457YyrIOVKjBJZHgr6L1sIzE/vRr6cJ?=
 =?us-ascii?Q?Bwf62hq9gPLqD0pgFJZG1G3ga32bWfeznPlYQdwNe6G6fCHkNv9gN6rhIyyb?=
 =?us-ascii?Q?vpEsAiFisZKKdV8oNrcOv81EmJyfwh0u9CggXFEhOz32+Ci6+jNZTkPmqNbV?=
 =?us-ascii?Q?UsRuZ4wv+kNrfvVhpqvQeMTb5S41Bo/bKxZmNWESYcD8rbCWsHCiS2ckqg1C?=
 =?us-ascii?Q?GL62bPDoBJx4WCfGPzg3iimKPsEbK2adD7H61bXE0Qejv2RMUg8Kn+643TB+?=
 =?us-ascii?Q?WU8zcyJCtLDzi7GL0IHWKjiOBqy3egzaGLRTizoP53+kQmFR/+FCTrEuFj8T?=
 =?us-ascii?Q?/jo0xJZ6AoIJ1qhmWVyW/N01BCa1tR9bYykCMsFgLexZY98t3ryhhIymHQxT?=
 =?us-ascii?Q?59aswXt+X+UnJxvdOQF4MVByJcuNigpopYdCJGJ51tFZ18eNvUHBz+L4S+Ec?=
 =?us-ascii?Q?AhiBDOWnII5Z4n0sgaPF/ZNjxI5hdfOLAfWZFWTq9i5SR0CP87Cwufak2iCG?=
 =?us-ascii?Q?UI60FVH2IfSHfgi/Qk1ZMJu6x81grk3LL5Jxf4Oe3KnKXmDyVQjzYCsaAEKp?=
 =?us-ascii?Q?2JvDxCYZjRFtvM0WtlvnIEX3j53D7vyZEboeijqyJRuGqJu/LQSyPTQpLgA2?=
 =?us-ascii?Q?tlsTrCNVHjEgymZlmQbjjm9Q0r3LoShkoMDMADQJAAF1SDHDslSnY/biRLEN?=
 =?us-ascii?Q?4N2qTB5z3OOC5TQm63AZJzddVT4ulSj5wJuJWkLqqskGKxUqD8VEqXtrl3V+?=
 =?us-ascii?Q?Z48BnQfaJ8Zh5MidfTNiqI7Pu9GW0eb8X/drR7Qc+NlidM03S3vzYox6nH2w?=
 =?us-ascii?Q?/93Pcz9EoUEMzc+bsWM9fZqp8K96KXKvuIJzD9np2qE5S6hZ9Bj6vf8Q4Nfa?=
 =?us-ascii?Q?kA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cfc2ab65-8c91-48d4-d3c4-08dc656969fe
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2024 20:51:00.6836 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M5lxQCBQHefzap7MEINqBozprjPYCAQmWTZskx/uZC7XWzdjvQTPlZzn6TJTgbC+ocmIvGZsF2BsCZ3c+sbfRJabwqfsQjlHm44pqiEBfuE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4575
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

Hi Dave and Sima

Please pull the drm-xe-fixes for this week targeting v6.9-rc6.
Simple fixes not really visible to end users: 2 around error paths on
drm managed allocations and 1 on PF/VF relay messages that are not
enabled by default.

thanks
Lucas De Marchi

drm-xe-fixes-2024-04-25:
- Fix error paths on managed allocations
- Fix PF/VF relay messages
The following changes since commit ed30a4a51bb196781c8058073ea720133a65596f:

   Linux 6.9-rc5 (2024-04-21 12:35:54 -0700)

are available in the Git repository at:

   https://gitlab.freedesktop.org/drm/xe/kernel.git tags/drm-xe-fixes-2024-04-25

for you to fetch changes up to e3e989522ac9a6b7960c75b762e1e9568717b31e:

   drm/xe/guc: Fix arguments passed to relay G2H handlers (2024-04-24 10:20:00 -0500)

----------------------------------------------------------------
- Fix error paths on managed allocations
- Fix PF/VF relay messages

----------------------------------------------------------------
Himal Prasad Ghimiray (2):
       drm/xe: Remove sysfs only once on action add failure
       drm/xe: call free_gsc_pkt only once on action add failure

Michal Wajdeczko (1):
       drm/xe/guc: Fix arguments passed to relay G2H handlers

  drivers/gpu/drm/xe/xe_gt.c          |  4 +++-
  drivers/gpu/drm/xe/xe_gt_ccs_mode.c | 19 +++++++------------
  drivers/gpu/drm/xe/xe_gt_ccs_mode.h |  2 +-
  drivers/gpu/drm/xe/xe_guc_ct.c      |  4 ++--
  drivers/gpu/drm/xe/xe_huc.c         |  9 +--------
  5 files changed, 14 insertions(+), 24 deletions(-)
