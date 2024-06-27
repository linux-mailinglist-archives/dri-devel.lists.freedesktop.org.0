Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9498091A7CD
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2024 15:27:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 244A810E097;
	Thu, 27 Jun 2024 13:27:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V+AxsEEh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EC2910E097;
 Thu, 27 Jun 2024 13:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719494861; x=1751030861;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=edXXAUuyW2vi5v5+Th0/SBunCdKXls6/MEZOZ14Hpn8=;
 b=V+AxsEEhT10alnDmZOXZhyBS8IDZEITkq31V1+23yoP1ap0Ji9sXX6/T
 sjMnbA9eoiemCQY41s+9yAp6qUGjm53ni5Ug4/MqKSsFHNjgTr/hQkqmy
 0IzEMQubkDn91ilU/0qy8uzPsgtuta+2ygU4GKiUC7bdvnNkYPlewO+Bt
 f+LD1oveQUcGWKg4trd07SskyjBqVg4qtDebgnbPzp2rBA7OexV3Ig9KL
 iIXGukULgw8G0M9u7aJchyRzEeCiEqaCwpOOTMqSwuj5Sc1vrKegF0FB9
 b8y/QRttsrgC9AtbQZx5m7D6DExr79UKexxm+9HoGMktyFhsKjYYjAVuo A==;
X-CSE-ConnectionGUID: UfDost+kSuqip4A07xkT7A==
X-CSE-MsgGUID: tvxqebrLRM2QS27usteTcw==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="42037533"
X-IronPort-AV: E=Sophos;i="6.09,166,1716274800"; d="scan'208";a="42037533"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2024 06:27:40 -0700
X-CSE-ConnectionGUID: KHM0HibgQr+rb3vdfynDIA==
X-CSE-MsgGUID: gsOB4YedR+WWIvx8JcxBYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,166,1716274800"; d="scan'208";a="81931161"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Jun 2024 06:27:39 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 27 Jun 2024 06:27:39 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 27 Jun 2024 06:27:38 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 27 Jun 2024 06:27:38 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.177)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 27 Jun 2024 06:27:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eyH9aSQLazsGhIo56JdxJiH4cOtQewmxNvJ9YTL42aYlm2n2CYJSWlnNysyEY4gjo7UzF/pOQOPGsFsFDewh3WRFSqbCYhldEm/h6V8JPZSJoqEmsGw4I1c544eHXCt3nHfGcHwvmhfWyohrX4SpUeBMYIISlzrVGfkR3QgZxfrf0fqDdny7Ik5jPRDjYywLH6hmzTk306KzxMvIuFEm5csDxYcwWmc9Nn0+nXUXNX8wn020SqpE99m06V1bwPL/BkPP1/+j+ICc3tj8apZ+5Srwgoxees3O87l0M8jZ5t57BU1l+/DBeXLiRiVzUuFv43V+LQ7RDUE6q6vFvHmn6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=edXXAUuyW2vi5v5+Th0/SBunCdKXls6/MEZOZ14Hpn8=;
 b=ija9iHnHMmpaoMi+B0oiQAyjHidG2b3qiRIybvO6SFNDGAIruDfLLaSJg2F+LXHZvQ3i+4hW3iQa2r+425506xqkmmkGOCPKArd87714kYEoVEilMESZpGVrtK8IU++QI+UjUZXTA5KDdMQkOBGVRD9F5iBfDyRdsYFOjDLJ8Xxjq6PxdfKQXsDgd0vIKuLQx9v50JS513wgTJ7xEahJvKRXKP6Ej08OB/mBk3IRazp8JX+xRttm1GlwBluCkO5z2Y5WTbNdje+sTIv2cpU6/kifLcrqNYtNny7O+/9UbRVxVGz1FeeM2N+H6qK82m93+bYZ8ClKG2aGtzsVnW4qrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA1PR11MB7727.namprd11.prod.outlook.com (2603:10b6:208:3f1::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.34; Thu, 27 Jun
 2024 13:27:33 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7698.025; Thu, 27 Jun 2024
 13:27:33 +0000
Date: Thu, 27 Jun 2024 08:27:30 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
CC: intel-gfx <intel-gfx@lists.freedesktop.org>, dri-devel
 <dri-devel@lists.freedesktop.org>, Jonathan Cavitt
 <jonathan.cavitt@intel.com>
Subject: Re: [PATCH v2 2/2] drm/i915/gem: Use the correct format specifier
 for resource_size_t
Message-ID: <s3f54t57t6t3flobqijfzzfhyal7cb27lag6e7bomfjeroxhi4@o4knlwgpzl6u>
References: <20240617184243.330231-1-andi.shyti@linux.intel.com>
 <20240617184243.330231-3-andi.shyti@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240617184243.330231-3-andi.shyti@linux.intel.com>
X-ClientProxiedBy: MW4PR04CA0034.namprd04.prod.outlook.com
 (2603:10b6:303:6a::9) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA1PR11MB7727:EE_
X-MS-Office365-Filtering-Correlation-Id: 806866f6-3f40-43ff-1879-08dc96ace6bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?SksVdCRvDEwKQ76T0ZZOf+sknJDWHUeHrg8GXBxUGgnMk4oDmJJ2fFevkHGM?=
 =?us-ascii?Q?oD9pQU/cMMv8/g93G/hfw0NC6mzIwRj2H3scRjlP/RmoUarf6UztdIb8E//O?=
 =?us-ascii?Q?vhK2dncvlvKCy/TeHDxawJhzY8kDluo5U6FP2vmimX/1dntanh5nhqUnS13W?=
 =?us-ascii?Q?DylTMnL75TrZMhKZ9rMleJ3kMOsDHA77q4Z+PSweke9sC9eGTVA7iV5FlmaR?=
 =?us-ascii?Q?8OjwmE+ts4D1maO4HmEuhBZknRvT5OQxCuVT1UFjjyMMWVKQn9XC0lGXbyJ4?=
 =?us-ascii?Q?bsJ5CHZ6HHsJKqOVSC7CYMRjmDkBpsU+CnUNn3o0zHt2EXe9b/dzvkV7O6dd?=
 =?us-ascii?Q?bCif6KCIV0Lo9ntgthRIJKnXwCkNWUDj13rfAADbVKXETrfyG10pUTHWwau0?=
 =?us-ascii?Q?6XEwKgZNF8Rhdr9PdemMVG/xfhJNTapYF+xn0E7SIZTXZ/3NbcqySkpnCbxX?=
 =?us-ascii?Q?grf8Gd+4kXzfVxpPnsNoMcWYjjGSqjbC0ryu/G8+Z7ts1VVR9ccic1MvIetz?=
 =?us-ascii?Q?Vs7ZkayLqW/7l6eS6dEspHfkM/qYo++bJFqvYnLDa/pZ7hjNodEUPh2TBQWW?=
 =?us-ascii?Q?FvOL/C2KHnVON7FirlrE+P3lWBzhXyaBhS+wb7sx0lydr0xlrqeH+ghCQLHI?=
 =?us-ascii?Q?eIQtgbxlCOv+EnEjEzG76NlbEY6q6lcUX4a/XKBZUTKH8VAnpsVMdFQukFDQ?=
 =?us-ascii?Q?uTLt0ZbTvOrC5QvyBK49edPhAb6t12aOlAh7MlU/XoOdlfX3ZV1sfhA+1R/S?=
 =?us-ascii?Q?Xzk/6HtQLYvMp47Z8MLLzuYoVDco2ZsvCS9HZ+flzIwy7F7gbALGzduAGj6o?=
 =?us-ascii?Q?IUgyLcfVqYKBdPZgsPgjuu981seboq7jOiwS7fW4Lk1nZta+AuOegjV6Nfe1?=
 =?us-ascii?Q?hc2IakJ/xc4eCYaPEhVpaGIeKfuX8Guo6q/08kdQh6g+buVkp8yJPtjri+qG?=
 =?us-ascii?Q?ykL4KInggYisgkcfZvtCBLW3POQa3+g4dlFux3/EZkeyI50KQbRHwNhx7yHt?=
 =?us-ascii?Q?JVvXiIMCfY+ZsGLI1qLgKEtVcD4Uw2s0oIJaOBryhWEvyIIWrr9btXgnMxkI?=
 =?us-ascii?Q?TQcFFFRvlcNUiFPwlnm0LPzCE+RFSUddXo8CfsrgktQYqS72jsSXCA/sLZHG?=
 =?us-ascii?Q?tGIGrxmQhKAuoV8GyIosrNgpmxngJH458Hm8TAEk8wJ5qSoYK/YKtLTM9mVC?=
 =?us-ascii?Q?LzSnXvZmcHJnQHaCnPtFMo5p9yTjkFovvOpbyu0JTB+kB8oTPmqCRf3Fp5YH?=
 =?us-ascii?Q?8PikyL/tLdNlnnIDngXZmUbxzDwZ5wOoCSdisVqI7HyQ9/QyjbrowQ/6lnJu?=
 =?us-ascii?Q?bcWBIr35LBp0BXTyjHCFebGpmIVeYIioZfE6MZb+Ygxq7w=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/USnk9cRjqusXuFbnzFkxzSrC/QxeXtQzLLwjGZmSlX9DpOZRpk3Ktl4l6H1?=
 =?us-ascii?Q?bIZDq/diyLaUEhg8ONrsYMc9WsTcluRblCIJMrcXTQb+vBIlTNCG5Njj4OVF?=
 =?us-ascii?Q?b1qyknTJ9Y63owvzQ7pdU6VucMDxu6J73UZ4denMeQTai2OES1981PQAsvo+?=
 =?us-ascii?Q?W4zHxIzGHoqj4NNRFlQD/wS0y7OmxBRVeXktTFhd1ziNvHuRfYX8knmlbKqu?=
 =?us-ascii?Q?zsVS5SbCbLQd8ORYN/wmTl0bt0Q+NDbEn/AfRCFcBNDl50J2w5EPi3/ISyFz?=
 =?us-ascii?Q?RG6RNjKSX84dCkodm2pPSR4WhHV2a1rQDPfNo6p6zwGDUM/MZdTxXXeyFCmo?=
 =?us-ascii?Q?ohZxuoDNYSE+iwRqdJUbxDt7k1h5DRdvvZfi9gvbdIbX1T+jb6WxXkF6p3oG?=
 =?us-ascii?Q?Fz/Kb0IMvbykPo21XgXSJdYPz30hmVGpNbsVw7/ThxbUnQ7FQppYkuhNbtqX?=
 =?us-ascii?Q?ocajl3dXLD6RNNY6kFbNSWki014TCj3OfrEfa+8D95wUx6nWSIZX3Icu99CP?=
 =?us-ascii?Q?FPrukRYbedbMgLtd864y8LstuJqVHh49B5Be2WYr/TMpcJouRHt4EAv17epg?=
 =?us-ascii?Q?D06LL2pAZHRQCDqX1vyfUAO+r/uITszwzmnStWm96K5/UmCtxeamkNODYbrx?=
 =?us-ascii?Q?M+5KkW4+UZED0TG3tfkb9NVsP6BvieEVPVXCuKGiHPT6qOgtoVIsizCdligg?=
 =?us-ascii?Q?2PZa8tpSk5izahbfHZWn7P3pjrfCAIVcB2UVJ4S7qldotj++z2lpDhnGpWYZ?=
 =?us-ascii?Q?eFzh2bb13k9cEr+JJR/JawO3p+8kNdoHw3cjqg9h2taADPc9wE9FsZ3lmtIX?=
 =?us-ascii?Q?FYAkC1ctyn7fDwA7BrbqBi6hQA7dqihHHaz9GHxLoFUS8fT69LcYDsxlJAmx?=
 =?us-ascii?Q?3+6upA7Vk85tFa2I0nmOs5gu54aMyUW4iiIg/hlaIV2GKQlP1vQr0ZVigiep?=
 =?us-ascii?Q?lOit7WmrvqO/82ki2G6hDYRrKmXX1RKvZFMAP89GJid6/+CFUAIg/KxDpGzv?=
 =?us-ascii?Q?8v1oWg54Xj9txk97m4f4c/ROXukb9202EYG1Mhd63eLnSVIE3nGZM9LYZiib?=
 =?us-ascii?Q?WNqhGp5aAQvlNhybwO8wpztWCTBApi5YcZWwIwk93FVA+11Vcx4pdlKa9YUV?=
 =?us-ascii?Q?0GOfLmvNHH/N2IQs4+Ewlwv9EgHEUqb8QhgMFL2VMyihznB0bnk3SXXiIL2z?=
 =?us-ascii?Q?xNN6qqdykNo4grXPBLpKIO/N07wDpFOcw3UwB52TZA+WeuWuNg0gl7k7W1In?=
 =?us-ascii?Q?hu9Drt5eR1kkUZSB34EvU+tDJz90P0tMwNMtOM2zTMc4yz4Mzbx6wP1e0TIM?=
 =?us-ascii?Q?1dXA0YWITS+GjIvykOlqCD+KrEeYeaKv0NTJW1r0cdPGPor5fUB8cD+PQ0qf?=
 =?us-ascii?Q?dUEt1h37TXnOXn2WiSo6S59eJvbDRcshJH3WI8k40e/t81CjTD/x+Bliu6LP?=
 =?us-ascii?Q?dtUpMHTZBzj4Dp9hI1xtveA+aIeKeNCmBp8hqV+D5b4p/vCig4lAUDXo7e75?=
 =?us-ascii?Q?6DXLRTTzFr77N3DxiXDpqtcw1Vl++yjtf7xchT5NQqgUYxWScpYHqoFLlYe8?=
 =?us-ascii?Q?5nBwr2sT7/mO7+oIvzrwNIL+jjdefu+8TEqqCXhSmxFHy9P3ZUowzZzi8WcN?=
 =?us-ascii?Q?BQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 806866f6-3f40-43ff-1879-08dc96ace6bf
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2024 13:27:33.1464 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XszFDfmeFbm4B98OOaV17H5//GC3d3PB/c5l+UYWqmpDkPh7lpm4WrOQZ301F5PwCFGUnEH+0IcKjknseG4Glns6cuCohCH7DblyQXpMWqU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7727
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

On Mon, Jun 17, 2024 at 08:42:43PM GMT, Andi Shyti wrote:
>Commit 05da7d9f717b ("drm/i915/gem: Downgrade stolen lmem setup
>warning") adds a debug message where the "lmem_size" and
>"dsm_base" variables are printed using the %lli identifier.
>
>However, these variables are defined as resource_size_t, which
>are unsigned long for 32-bit machines and unsigned long long for
>64-bit machines.
>
>The documentation (core-api/printk-formats.rst) recommends using
>the %pa specifier for printing addresses and sizes of resources.
>
>Replace %lli with %pa.
>
>This patch also mutes the following sparse warning when compiling
>with:

s/sparse//

I will do that while applying, thanks.

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi
