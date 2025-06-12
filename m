Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD121AD7983
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 20:02:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27C5610E0C7;
	Thu, 12 Jun 2025 18:02:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k9HiKdN2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA0A510E0C7;
 Thu, 12 Jun 2025 18:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749751348; x=1781287348;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=C8hrJcL/7VgBjOflEr6o5gn/MzatCrJTjB8M5Pa/4GQ=;
 b=k9HiKdN205OOCVNomqnsEWxsU+m8Qf/7SwOFl6PQ/2fjmUAavFdVPy/H
 ULH9qjwr0ypXg5Cjj7qdXUqFQlSuQgCtcRmx22TEQySySK7kvzAJ4YteH
 FnYswbK5/yNLphH6a/0LIxEnSC73Bd4TqW4him70tSYDtzPreVTtDa6Le
 9Qamd9R9hnecIB9o8hMhzJczPGGH48nDxb2ebqw1GdoNzEOos8oxdMf6S
 Rv/ymLijKRqpbuZCIsBsJatMfF0x6IsmVwqW2eiPIUN1Ql7ZHc421Ofs1
 EedmFDKC8MQUqQSx4TdVx1IG1b6iDb+UJdMrV79dipIDM18fwE3qG9Lm4 g==;
X-CSE-ConnectionGUID: 0J4YN/XSSx6P8GkkAdTJ3g==
X-CSE-MsgGUID: yz4bNGr0Tfyekzv2PkThXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="51665606"
X-IronPort-AV: E=Sophos;i="6.16,231,1744095600"; d="scan'208";a="51665606"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 11:02:28 -0700
X-CSE-ConnectionGUID: Gk9Xb3WFQa2ob+Z/vzv0EQ==
X-CSE-MsgGUID: kKO2qRaqQ/2evT6uOUU3Eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,231,1744095600"; d="scan'208";a="152503858"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 11:02:28 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 12 Jun 2025 11:02:27 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 12 Jun 2025 11:02:27 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.73)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 12 Jun 2025 11:02:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BJxzfX0U9A0NDYxjoYBrCEyc2S85Cca/mrS3wsey19kfWp/iDw/imHyJ+g+SbHC+8QmaHtTrOolPWusa3yY4KrjqIddZCXs6oUfbu5B1G6EYD+ypcAQmR7YjecEhgJS3Jy8hvmGNyZUtAc1p0ppImSst/09yvXRoGivySLPMnbFQrNd2Q0euCDlOtXl4Q98mCpee11P6qVZmdpkC3YdINiMJI3TB2Ik9cFsr+eo0mJ7jk6A2fh7Zckke90kd0Gn5/qAK/SOG5ueI+eYqzd/WX4v5LhsmIXQDt62NcLZPhBMn7tFu7aQlG4NlH3ML5XP8d6K9y639Nl/ae0K09ktVng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j7gxSht8mONJRe7FHtMsr5vq0kxge+9rqddO0tv08vU=;
 b=E4cuNEjiE0/+okjxwsnnoJTwKH9g/bzg+potJmMu4I+UQ75tTx9JmWBjCRjoaLPjeDDWAYMM5/Th7DSAsD0UR+vxFn2zrZ6XrnQK8yPOHI3GxOMWjAadr9UdWu+T/MuIWOC6PuULibP+2QZfeDb1UyaShtF0XhOArJ80N7XFJ/PbO/KZLGgZ9Of4iyfR8IYxMglcpeljmrLW0oAvZoNTN2wdJIp2GO3h1ZGn7aWmL5D8BXhfycqYOegd2MG52Y9Lud5wewa7/B3jbo9B3KX1Cf/LCTYPwDqpmBcX5hshAZ8dZDnYg6Hmm/nkqR9mvAC7eM3PUt69kn8ow2AX/3m5zA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM6PR11MB4724.namprd11.prod.outlook.com (2603:10b6:5:2ad::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.24; Thu, 12 Jun
 2025 18:01:56 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8835.018; Thu, 12 Jun 2025
 18:01:56 +0000
Date: Thu, 12 Jun 2025 13:01:53 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
CC: Juston Li <justonli@chromium.org>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Yiwei Zhang <zzyiwei@google.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v4 2/2] drm/xe/bo: add GPU memory trace points
Message-ID: <p7wq3wrsddp7pk7bk5follhkc4f7ybgmc2o4e652jc2cfuqbhh@tckgwpy3khcn>
References: <20250611225145.1739201-1-justonli@chromium.org>
 <20250611225145.1739201-2-justonli@chromium.org>
 <mrfsys5djmsbotxlaahed5ogmofn4pkmgqfhl47rj3bwxdtlbv@7xbekwpkte57>
 <37a5f250-1c19-4b95-882b-b4ef3e5c6268@igalia.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <37a5f250-1c19-4b95-882b-b4ef3e5c6268@igalia.com>
X-ClientProxiedBy: SJ0PR05CA0141.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::26) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM6PR11MB4724:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f051271-781d-4265-fc4c-08dda9db3816
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?bzmCC6m3YbN6Js5Pcxa3Pszsua6XfO1ecovcQjCue/os7AUJ9SOvhrCGAv?=
 =?iso-8859-1?Q?SnqckSu91h91n+TGiXc5SfB12EE11Y6LMkmPnGfTp3GgG0t35FVNWkgE0z?=
 =?iso-8859-1?Q?8lETl1a3XTVEgL3FUBORqPambXLfq8PfVZioyp29H/UbxEG/AHgQiVXMQV?=
 =?iso-8859-1?Q?DGZfXpGLaCqq1CC3oDRwtSkjTPZNcOGlAfobpXYjxKY6ZVIzIUO9KcN+jK?=
 =?iso-8859-1?Q?+5CzskHXznqrS5gxRYwsa+6B/lNXLAgKL08w+xHvyzI3dUb1xKj2qbhS3b?=
 =?iso-8859-1?Q?I+p5wjJGlaqnhx0qdrP+kanXg4TotBtmiYqi8htNaoL+691pIRzbCXD18M?=
 =?iso-8859-1?Q?ytXPP9UWJncU0ah1MyR/dyLnD3LRBhY9bRbn+bHXiQc7NbVRKphSgQlM+E?=
 =?iso-8859-1?Q?WdG45nSVxPqUI1sF/apdOGJyn4T+SE2w/vxEHXlw4I3z4kVj3b0+PeNxiU?=
 =?iso-8859-1?Q?VQtrp8DChAS/KVPelY/zqKjyVhqhubzM7ECp3dQQXzd/bwH5S/Z9Lc5f8n?=
 =?iso-8859-1?Q?bs0X+y7ZYyxg0qAjGZ9EDf68qSQRxKTsS5mUUWYHDelsTAUyf5piYlHtYH?=
 =?iso-8859-1?Q?xSWtYumQNY0kfXHH7WUFl415CJ68/RmcAl1GfyNkRX1pdgLGLDkcUVYVed?=
 =?iso-8859-1?Q?AG4LLqR+VkcGUoDVSNFV/3yqP8bXKcYy0K8dcCiUIdsVhI6D2QA7/Z4nMB?=
 =?iso-8859-1?Q?K0IabvvABKVOIKN1g3PrE7sQdolKk0serBtzT5+rHC7ybcNcexH0G36TI6?=
 =?iso-8859-1?Q?MIEi0mSp6vfyaJ/uwu0wrPn4Y7lWdTRaDg4xRCNeDyrfk/MGoRIsrGM+xK?=
 =?iso-8859-1?Q?FEWuo8jB+4h4/Yyp6Do/LbOVf+bIOygg7NKwqlUzEtqGYme/1leAdWmBre?=
 =?iso-8859-1?Q?eT5Mp06c24UPpZi3JUnnPOVo+d684ggTWPUnhL1nwGGI2H+e+J84YEz946?=
 =?iso-8859-1?Q?sZBGwYG4b4I35zXAwrTF81pRctEy9KR+X9Uk6+9Dp/wRhEdz0LuERdU7xA?=
 =?iso-8859-1?Q?p8OJ0S8ZcVfDq8OCBDYpvE94IL/yOuJrd9MTiA61VhAY3Z10DL1n+fCrUd?=
 =?iso-8859-1?Q?qrB7S0gN3kGo+EX2pByko8Wsk+1JsYeDU5JBRnfgOZkamvb7S3y04c9CFA?=
 =?iso-8859-1?Q?P5MO1dWxg/UvY9MAWFDO0dXPmhmlMri8fNh+3MCGSP+QIVrETX/s5O7bUP?=
 =?iso-8859-1?Q?YQgv+LJBn237chIBcHvDbpYQDbE+9FnFrA5SgB7zkZq3dIKtR9BYfvlelA?=
 =?iso-8859-1?Q?JswQ8aELZAlulFYpH7g4eu7w1qBBDzbC7ITVYKb1GYFW/L4Gdm0Ixv8O5K?=
 =?iso-8859-1?Q?RLYG92cUotQ1+0Nlc568vhF1hLiz6IUZrxRM9gtOqO2immY1LFFHgn97mm?=
 =?iso-8859-1?Q?aE73BAcBNI8f3OKEr7FsYFxccZMEExZUdypG0lT8IH0qi2CWAVIU+whD1M?=
 =?iso-8859-1?Q?B4UXJ+TG3DK4GtjlGqG9TveeziUAOQpsnaVfGtNB8tsVA9eq/FDjRxMCSa?=
 =?iso-8859-1?Q?Q=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?7/3AnVpkiBPwkec4l+3KidWCQ4UORXIfn4NerS7eeVV9ATs91UtTSjbapJ?=
 =?iso-8859-1?Q?wksYCzBtUWPhhRiUoTrPMaF5L5z9GDtpKF35f8Di467hnOBEGB2qCRLujD?=
 =?iso-8859-1?Q?r9NKYlvc/TexkArg4CwzU0340c431PgOCmuKYauCi0duU/eUX3lA87TfvV?=
 =?iso-8859-1?Q?f0B5VGIDuOxn7qmkL2fKBZA/40AWXrpFIDsy5kiyERUr5z+ZkxFDjnVhkS?=
 =?iso-8859-1?Q?hCUpKignVuEhrkilCTzHBEVMkI4ah1m5a5DM8vvY9iBUENP3cicWC7Qewh?=
 =?iso-8859-1?Q?YcExdxuBlK4AGvlqNSY+C/kCxIJWsqwyaSGzxJ2vkhmdqTyD7NPMPqVx63?=
 =?iso-8859-1?Q?6fdsVwtHyDsgX0gZTBIdPi3wKE7BXvMe2XLq0D1QOZ65SflNBQoFrBxr7R?=
 =?iso-8859-1?Q?TKpJ61+td4GcEtMLkhs0m6CDNXmf1TvxvwHPGNen/x+8uKc3A1y0gm3Q49?=
 =?iso-8859-1?Q?aZmZaRCavIiLGHHb17kMDlOTxSpsgUx8tZqJWacXpV/DYCUClJOvyqYXPP?=
 =?iso-8859-1?Q?0EcjxkJaTAZfci0w6L458I1BYKv3LUoAHMCg3jN82ru/ubLB1oHfxnUZkI?=
 =?iso-8859-1?Q?N0TzDDotEeqy0Tf30sVB53e1JdsRWKS+iqCGctrbv0JNal97tb06eGJvkY?=
 =?iso-8859-1?Q?+dZ3ZR/39GJBXMQa2QfXKbpDE2OGW0wjP7mbladgHWVRgXYUoEwDt/5t9r?=
 =?iso-8859-1?Q?Jx1lGVjlh/pgMjmUAGbAM/EuNrEk1e1v5ep2x53RvQj4idbGOCB4ArMh6+?=
 =?iso-8859-1?Q?/FZjuF+EwEqQjD65DTvwt8+RcQVeUlkML6bPg/PscwS8sWUHePdV1cM0Uc?=
 =?iso-8859-1?Q?gGJ8K/z47+qKiOpNpTput7M7oCzAt0JlSIAmdhRZbUv/MdMU7WjlycbZl0?=
 =?iso-8859-1?Q?EMSFAiNKjcfBsIhCxwrv7iekLIYHUGoZTR21gi7RbtFwO3Kz4PooWWvmjs?=
 =?iso-8859-1?Q?MMZFF+FyL/wYEwAk92zOktPt5VX16buxeuXVqzibH/Ol1eZCAN8lhBAp8Y?=
 =?iso-8859-1?Q?xsCMoCS4/6WwwGtVfyZXDANmd7rWw2Q4XBihfIUd/OUsXJvFrFtqgk+iR2?=
 =?iso-8859-1?Q?y+8VyiTnlGV2A6rX9vQ9GKN9uvdY2QxCFp1xM047972kZ7LqoOjIdrNAYp?=
 =?iso-8859-1?Q?9D6gmIQ1Fv9j9VLaq06yxie0XfFgJUjzKaaVDU9SAfWAj9Ez6T9/YH7Gqx?=
 =?iso-8859-1?Q?9dErqrMN8Hk9maJeYvPjsuidTe7xWgPfbdIlHTHI2iP7KQdQvIH7UC0Dy8?=
 =?iso-8859-1?Q?lLtwt/bUwGzUotQdngfgda96L10IGdbEZUTozQsYgtG2pRKjjnXCB2ofq2?=
 =?iso-8859-1?Q?Kp8/MvctRrVpWqJmgWaU651rUQdOsi3j6sS453TR1fNDiwfsEvOrVA+brP?=
 =?iso-8859-1?Q?m/tbDZlb+/aTwBzLQc2G2+iQDJTvdkUBeXxvgRqcme2LfZDI1gOi8LT7lz?=
 =?iso-8859-1?Q?GMKut5XQ0GL9YgTbIeKrxLuNm0EujbL7CSJscw4tGCAePQX07m7wXPEw2N?=
 =?iso-8859-1?Q?joqdVq2Rpr7pEYFNBOVQE9DBy8hBQ8XjLwSOqE8uYE8kkR5EFFzzGInY9q?=
 =?iso-8859-1?Q?kDHnJQR+KwHDaykWCQw49EbgOg5I0LnTIajHIuiWuDTrCHHaIEkslICCEm?=
 =?iso-8859-1?Q?NES0SLujN5NmPLLpEWbuEywejvLn8zIvZ1dd4XGwEWRgLFRF+4qs9aHA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f051271-781d-4265-fc4c-08dda9db3816
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 18:01:56.2982 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F7oTNbxsCp8OZUeA80ZOUbZXc9BepUZhUpxrOY23xRhoet2fPJfLPzz5yWlxqe0bp+q3E5YbZanQTzhyZxTGvvUYK1Qc1I45D31uERGXRjw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4724
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

On Thu, Jun 12, 2025 at 05:46:52PM +0100, Tvrtko Ursulin wrote:
>
>On 12/06/2025 06:40, Lucas De Marchi wrote:
>>On Wed, Jun 11, 2025 at 03:51:24PM -0700, Juston Li wrote:
>>>Add TRACE_GPU_MEM tracepoints for tracking global and per-process GPU
>>>memory usage.
>>>
>>>These are required by VSR on Android 12+ for reporting GPU driver memory
>>>allocations.
>>>
>>>v3:
>>>- Use now configurable CONFIG_TRACE_GPU_MEM instead of adding a
>>>  per-driver Kconfig (Lucas)
>>>
>>>v2:
>>>- Use u64 as preferred by checkpatch (Tvrtko)
>>>- Fix errors in comments/Kconfig description (Tvrtko)
>>>- drop redundant "CONFIG" in Kconfig
>>>
>>>Signed-off-by: Juston Li <justonli@chromium.org>
>>>Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>>---
>>>drivers/gpu/drm/xe/xe_bo.c           | 47 ++++++++++++++++++++++++++++
>>>drivers/gpu/drm/xe/xe_device_types.h | 16 ++++++++++
>>>2 files changed, 63 insertions(+)
>>>
>>>diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>>>index 4e39188a021ab..89a3d23e3b800 100644
>>>--- a/drivers/gpu/drm/xe/xe_bo.c
>>>+++ b/drivers/gpu/drm/xe/xe_bo.c
>>>@@ -19,6 +19,8 @@
>>>
>>>#include <kunit/static_stub.h>
>>>
>>>+#include <trace/events/gpu_mem.h>
>>>+
>>>#include "xe_device.h"
>>>#include "xe_dma_buf.h"
>>>#include "xe_drm_client.h"
>>>@@ -418,6 +420,35 @@ static void xe_ttm_tt_account_subtract(struct 
>>>xe_device *xe, struct ttm_tt *tt)
>>>        xe_shrinker_mod_pages(xe->mem.shrinker, -(long)tt->num_pages, 0);
>>>}
>>>
>>>+#if IS_ENABLED(CONFIG_TRACE_GPU_MEM)
>>>+static void update_global_total_pages(struct ttm_device *ttm_dev, 
>>>long num_pages)
>>>+{
>>>+    struct xe_device *xe = ttm_to_xe_device(ttm_dev);
>>>+    u64 global_total_pages =
>>>+        atomic64_add_return(num_pages, &xe->global_total_pages);
>>>+
>>>+    trace_gpu_mem_total(0, 0, global_total_pages << PAGE_SHIFT);
>>>+}
>>>+
>>>+static void update_process_mem(struct drm_file *file, ssize_t size)
>>>+{
>>>+    struct xe_file *xef = to_xe_file(file);
>>>+    u64 process_mem = atomic64_add_return(size, &xef->process_mem);
>>>+
>>>+    rcu_read_lock(); /* Locks file->pid! */
>>>+    trace_gpu_mem_total(0, pid_nr(rcu_dereference(file->pid)), 
>>>process_mem);
>>
>>Isn't the first arg supposed to be the gpu id? Doesn't this become
>>invalid when I have e.g. LNL + BMG and the trace is enabled?
>
>Good point.
>
>u32 gpu_id does not seem possible to map to anything useful.

maybe minor_id? although I'm not sure if the intention is to share this
outside drm as seems the case.

>
>Shall we replace it with a string obtained from dev_name(struct device 
>*) ? As only Android parses them I think we can get still away with 
>changing the tracepoints ABI.

works for me too. Is Android actually parsing it or just ignoring?
Because afaics it's always 0 in msm.

Lucas De Marchi
