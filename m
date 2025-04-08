Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D453A80D0E
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 15:57:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A931E10E6BB;
	Tue,  8 Apr 2025 13:57:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AYw+6P3N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C9D810E6B6;
 Tue,  8 Apr 2025 13:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744120628; x=1775656628;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 in-reply-to:mime-version;
 bh=gD/KXNwdBCJvz4UYfsaZUEGfzjJJl4HcXdRk6LWwRGc=;
 b=AYw+6P3NLOoxSrTgPpCh0uNHN7jWXr70NcpGzdOtTEfK5InMHYYe9pr4
 wVwdTfOlUw5YojNKRv4c5Sl9gS2kHnIDvcS5yzlwjop68nP4eEREK7rWT
 p9JLju+++PtDxlorSVXy40ALBjbeJNEhF81vY2v1wfCNyaNQSxkFpYgY/
 yFnPDH49Ijhrysuid8CyTsZMaptEfpYHty5C9rd97TQ3LGs1uIwHS5gB1
 tBJ8bOJK487oF0eWA7dXA0KaEIEW4Too25N+Ou69kPOBby9LA4lSXoXnb
 mMzOJxXBJkLrO/vzYtf8bvgL6ddzptq2ZbrK31ZVcKF0NkiUcagzmNCz+ Q==;
X-CSE-ConnectionGUID: WBdeHTgqQ6m31BYXXtAGGw==
X-CSE-MsgGUID: VlhX1aZAQi+NBEw6j8XNWw==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="63094125"
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; d="scan'208";a="63094125"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2025 06:57:02 -0700
X-CSE-ConnectionGUID: 3jb7iF+nSNivqx8TVDIsTg==
X-CSE-MsgGUID: Vbqw0tNWTHCV1gGDNDWNww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; d="scan'208";a="128268831"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2025 06:57:02 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 8 Apr 2025 06:57:01 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 8 Apr 2025 06:57:01 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.46) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 8 Apr 2025 06:57:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PV6jeJY42RYb/5OKZawMw8QckJaJr7yYD9T/3MXSyq4aLfL+C0l/8pwFRqN9iBZVktphT5M+7RUDbGcVHn+1p9ExOFvIFnTH3O9ncfvgrTRBTYXMaAS1BrMQ1mXPlkHFzmru4HCU0VY9VXbF1z7hbmaEbJFPI+qdeqKeQBcxRXZ7c2pUds/DWkcS1zq0/nZc5awJIWfuHZSN/xEfYjichex93M4GwS+E/6igeFn3/Vpr9XhL+8R4HxWeP3+5C6PFm9igrtqW2JUIO7yWwfDTIZhMKovXwXzRhMhjVZhlwR1qJwbMaV1QhyH9VycPZ7PQeYewL7hLgqR3vMog49G6Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=idLrPOtMa2aZBiK0ZUmzuZhpEWockIbynnt3Ogl1FXQ=;
 b=ri1H30D4XjNkbpEGZmJWo9BFmPzdtxIRcHedleqnHJcs9AbDn4sH9jueDJEUNOsEzccS5jhgm73Yqv3pk8WDNdurChwezzg+XYKdKrw03QfNJvweIKRsH+UV+L0J301p0QlWU3YADwQplxvEQEDuG9lhWMT6q/pX+welsqOWSUFl+mIic8UUUrZNPURo/jSrIhLftqdzXFvIpKuosqGWqBvLCGzNUc1ir29/MTeWj9HjPOS744eUnNnhlFosD7aKzNzCNhoUQOQaClNq8pJdWjUO0+9+SB+M38KOT6TewMAdGW28kGPSOg2n4JH8WQpMqLL8JPePHz6ccWan4hnmAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by IA0PR11MB7329.namprd11.prod.outlook.com (2603:10b6:208:437::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.21; Tue, 8 Apr
 2025 13:56:58 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f%6]) with mapi id 15.20.8606.033; Tue, 8 Apr 2025
 13:56:58 +0000
Date: Tue, 8 Apr 2025 16:57:00 +0300
From: Imre Deak <imre.deak@intel.com>
To: Arun R Murthy <arun.r.murthy@intel.com>
CC: <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>, <vinod.govindapillai@intel.com>
Subject: Re: [PATCH 0/3] Rework/Correction on minimum hblank calculation
Message-ID: <Z_UrLOGEih6Hnmf5@ideak-desk.fi.intel.com>
References: <20250408-hblank-v1-0-4ba17aebee65@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250408-hblank-v1-0-4ba17aebee65@intel.com>
X-ClientProxiedBy: DUZPR01CA0186.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b3::15) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|IA0PR11MB7329:EE_
X-MS-Office365-Filtering-Correlation-Id: 371cf678-0b6a-4141-988a-08dd76a53add
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?tKHPCM5LiWtYKAnlCchjCgH9qp9xJToxDqPB77OkhMkH/yGdT5KKQuqs2GRk?=
 =?us-ascii?Q?oXq13eTOBCsmP1yMO8G7MoHigO9Ex6TpHwnfngGrBVueu2ACmtO76YpBVIlo?=
 =?us-ascii?Q?gLWqAIFgz7T+3M87INoQNz4WqAl40XCzxnaO1ABW6Yq0p+WysnaS0T1mjGMf?=
 =?us-ascii?Q?3J9LrGzatU1sWDDGkvcgNq+EZ7IsD7B+ZwsH3BC+y6FNjQ8JPHVgDjHrJoZM?=
 =?us-ascii?Q?RHfn/Bylkl278Ym8bbM3hzK06vNopdNya1lGNkLFRm3pQFldTgjvMbJnwzpm?=
 =?us-ascii?Q?zEWj5kuULhoMM/cISzMc8TbEEmjyuxJTadRCSfKzkknTul0czNQPb3fiB2pC?=
 =?us-ascii?Q?LajetXthMtDkDEaN9PsAb3HSIouffA0C4N274gTkQAeibeNukz1Bn/ftCU5b?=
 =?us-ascii?Q?ybRPgleX3K7l0SU+/XBGhAMBtwm03/+xnTHnFeGvOin04/jeLMTP0KMQ3ktu?=
 =?us-ascii?Q?YgoJR7fKeFL9wwk8nMepSCKdz88CSZYzTbNZJ5jCkUQxF8KIG0fe0kiLpORK?=
 =?us-ascii?Q?Nw4rmGXEh1DFr7qsi34psKcXaDT/KOi4WM+mwrODSPjQs852lFfXlPLEIMdi?=
 =?us-ascii?Q?h7fMdMBiDRqROS2m+3EkyIWG9lHHsEXqT10hUza/LGZI5MVuuqwS9wjcm6AT?=
 =?us-ascii?Q?+J2TnTjDdMnKHOjW7Rh2qQKBjyj/z00ZT8ZLfMx3PL+gqI/bV+YWbFs3HCMc?=
 =?us-ascii?Q?tOHft3+X1HujDNHa6kK2wMEhXf/OHcOHPRaW2w5Og4BnC7TTXul7tSQPhSLZ?=
 =?us-ascii?Q?1bW7xi2SMtuolB7Vq/mPbDuCd6Fc1ZHuRmPPMkn/BZMOS/4l4HQVg8YnEyV9?=
 =?us-ascii?Q?YgADarUm1UbOzpuXxW48Lo+0Qmn9+e05GgBMxNmLyLuU0rsG8d4Gt4MerXJt?=
 =?us-ascii?Q?Gb0i4Jgqbi5ua9YfhrOT3jlmn31+9BAOl1E4bs/LMKP/XNv24W06+deRp5/7?=
 =?us-ascii?Q?IunbMKTQWiH00BOGHf5BHaFj0KKoSCAdzxE1+BMbPYtEgFehZUkNCCYnWpCc?=
 =?us-ascii?Q?48bxxr7QLNWC1lbk+9NfPN2UsPUgZNr8b7FyYLETMywE2o+JH7WkeP1D2Fii?=
 =?us-ascii?Q?B3Vdyc68YT8ppJvEmX3fDV7xzfJ4PrcED6X3s38E6U9SDAqrIhF84tGdSOZu?=
 =?us-ascii?Q?a0J+Oqv1g8stleAFrWCZMBJT4vRzorxFlOXFumHujaOb0h4sMKuWk7z0LrBo?=
 =?us-ascii?Q?ubpTROwCQ/oJUv+emf0ztaet5A95w9ImbQUrnTVW4gXYXZ2MUKrRcEIP6Uhr?=
 =?us-ascii?Q?/CsDg79vFpe6KNHasLZYYi8GCvRuLsy7XaE1FMlitnXBAXEQTQRsgiVjPgAp?=
 =?us-ascii?Q?i33mvwyA6plUnEjLGsXCBd1ASSWazpS0H2EyGB8t2eElyw1Ifx84IBJZc4qH?=
 =?us-ascii?Q?156l6Dom1gFBskV/TaOGO5SnBq7S?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oBTJU/imhj8Nd00FWdXFu3NDdo0PJqRGqq+oIALIuvG5MPV4cUVpY1as5LCO?=
 =?us-ascii?Q?uhug5Q2PbQmsCDa8c0OjeSg8tNYOz6k6gCZpLm/4WFzaLDXY8Cdh0xVYEeLz?=
 =?us-ascii?Q?S1xHyjBteBuiVj3mhOoetWc2vGmvDvzAYXB6YWCxQOdh4Ebhl74rilnRpf3D?=
 =?us-ascii?Q?Rat7FV+oy8BC9WEvtYdBvu8RgDda2RUNEUD3UrRREounxdTMqWBjPoNXbGRe?=
 =?us-ascii?Q?qVyL5r5h86t3DOUOLgTw7UQUt0VU5Wtbo28j4gv/KzZGKunHL0OKDmWzjOaP?=
 =?us-ascii?Q?MS8covJQt+WtYcJCIaZ3HK8E/et+TyvOrl0fFUdWgDbby/QY/zzUPwmDrl/u?=
 =?us-ascii?Q?BGIBVN15jll5fb38W+mZ0B7EOymZ91cXOQ6/X1S4AzFlcAbT+VxcKlJfP3Ny?=
 =?us-ascii?Q?dmw4ml1JjNQgmbQJDKz2HclYWWZ5iNWfge5a062U4cZqRA5lB7OVFqqklncM?=
 =?us-ascii?Q?5A0GoXjholAG1f1PU9/dr79qkYALG9GDMJVBiU//IpxiZA4SKRf5N3jk54UM?=
 =?us-ascii?Q?IQmBEVOL27rT7oNf4/IaxfTpt9shxyvRgnfcd+xftjhwnJEZDF7sFzyhyTA/?=
 =?us-ascii?Q?7TxZJC6sS74VTnliNspS7q/5YKcOyiw0U5H7Gld/Cw0qN9z1u3cuo9A0C3Qx?=
 =?us-ascii?Q?9tXi3bYPo7zDNRjrvlm3VByT/BH2Z/TuR8/mDny0oAdiy1N+S71zPBlhzXAI?=
 =?us-ascii?Q?IfztAQmFMQPtbcXefOmk5urK3fYRxbvWgo3AgEJlCPYUPURnH5iQGE2DR+wK?=
 =?us-ascii?Q?ykQE0YxBOx+6fw7WFJH6jIoaLXH9yw0hsbEmnSSPge5DuFDH3N5oPcJt1qY9?=
 =?us-ascii?Q?g96FeW8ofwt5byB/0MUJduA9kRZemIBR4zYbi2PAKO8l91tkYBbDq38QdzBU?=
 =?us-ascii?Q?AIYlXmO3aP361yoGN3/xxT0x8BrfMRWM6HXQnBYgRk+ftmuTX1+/ru6RtXoJ?=
 =?us-ascii?Q?uuG07AJsys+labUBP9YRj5YzHqD/Syh7BiQePoeSl7764xBXAL9alKyIgy/m?=
 =?us-ascii?Q?TWZcsd4gA3m3UDgiNVRVtTCHCMVMRaQdWS5Jrf0CZcXoHfZmWhkXCWJJM2h2?=
 =?us-ascii?Q?QwBt5hMiL3hgQi9936F6+DzuZRmWs1kkHJ9O6qfSTxlTqb3NrGl00oBYeKjZ?=
 =?us-ascii?Q?rBa84jlBsKUKyPjQ2y63j24qpEFvTcvEWEDxNgEIJ9wpt01hMl9PvFELmRMk?=
 =?us-ascii?Q?XvMOp8/YphsPoRXwu3v8Mc18yJi4bTiEEKdtqBTzSavYIia/MnGvAnqyVTJy?=
 =?us-ascii?Q?ARTNbJFvujEKnxV+Su9jljztflHMLvMycRtq4Bi9GFvgh66JT3DH1yDUOpSn?=
 =?us-ascii?Q?RPRYC5F6uQA4t1y+J2xBLV4MIbJ/nbgO4H/93VMpUCCCbaLEmqj/H1achUJm?=
 =?us-ascii?Q?DOmqvJZffTlOsDHSFex/SxWwRHOGYm9X3+9sTwcJVW/H3PXjz0omSDRsh9VH?=
 =?us-ascii?Q?i5UFVDBxm4W/OZ5AZILZsRzKGpN7jW8idcRDJXyCvu/Sa+J22mAE7YaRjrUA?=
 =?us-ascii?Q?gW5hWcQ0Zt945DrmN7SetalGO+JFfzCWz/XDrSZ3as3yxoj57YjE9tBxRH8C?=
 =?us-ascii?Q?MkV9OvttK3Lh/82xdmklx6uWpwJ9ExyLBX1FoQRS?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 371cf678-0b6a-4141-988a-08dd76a53add
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 13:56:58.7604 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uAftKMvMMYVKKJ5vfutiTSy1eOiRYr2/CXCGOlwgdQtU9aqecagFmmcPP0B0Mux2ePULoxw8e/1hqsSsr2Ws1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7329
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

Hi,

thanks for following up on this.

You could've added some detail about what the patchset is doing.

--Imre

On Tue, Apr 08, 2025 at 09:40:33AM +0530, Arun R Murthy wrote:
> Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> ---
> Arun R Murthy (3):
>       drm/drm_dp_helper: export link symbol cycles calculation
>       drm/i915/display: export function to count dsc slices
>       drm/i915/audio: move min_hblank from dp_mst to audio
> 
>  drivers/gpu/drm/display/drm_dp_helper.c     | 10 ++--
>  drivers/gpu/drm/i915/display/intel_audio.c  | 78 +++++++++++++++++++++++++++++
>  drivers/gpu/drm/i915/display/intel_dp_mst.c | 55 ++------------------
>  drivers/gpu/drm/i915/display/intel_dp_mst.h |  3 ++
>  include/drm/display/drm_dp_helper.h         |  5 ++
>  5 files changed, 95 insertions(+), 56 deletions(-)
> ---
> base-commit: c4fc93b0ec49f4b0105c142502b7d1d5de379950
> change-id: 20250407-hblank-49b340aeba31
> 
> Best regards,
> -- 
> Arun R Murthy <arun.r.murthy@intel.com>
> 
