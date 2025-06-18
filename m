Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 351D8ADF854
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 23:05:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 946D810E4CC;
	Wed, 18 Jun 2025 21:05:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TxgMQx4l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C18510E4CC;
 Wed, 18 Jun 2025 21:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750280724; x=1781816724;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Xp5MaqtbmQWsCTw6+rJZmPI0T4+mcXXG+8QB+KPyDoI=;
 b=TxgMQx4lyEwPl6SWyFI6jnqAANurNKb7wE0gYZxx0vF4wMGdurLMvZL6
 TsDeAdMOnCx7pO+d36Kiy7JqSahf2/1tKswCYEXK8rUwlA5P5V0jqdlfy
 +iZbwcjC1cU54avY58bBXM7a8bSHJSZ18QO0p13/yYzJr/e0AEqB6osOD
 oYTM9GNul6xj7CxGDDmoUw5A/H8ob6rgSEUe8Qugoqc0yCnD22MrekXGD
 AeVxSU/blk+/pWlEofof73iZMnsxjwqTnY5K/Jz4yslX06ucYk1gfBAeI
 HsiiQxc1p+XQmDjgBDoPo0rwFV12e1x/OyUtm4OFSUbCsb8kkoJ3Uw1if g==;
X-CSE-ConnectionGUID: ei7ZPDsBSIaey83lvRN7GA==
X-CSE-MsgGUID: +moX2rh7QTC7qYJ62EgOtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="52668617"
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; d="scan'208";a="52668617"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2025 14:05:23 -0700
X-CSE-ConnectionGUID: vY2Ej+diQnGYHH8nC5cqUw==
X-CSE-MsgGUID: Lrep3UjcSl20PGlMtZCk0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; d="scan'208";a="154554303"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2025 14:05:23 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 18 Jun 2025 14:05:22 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 18 Jun 2025 14:05:22 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.46) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 18 Jun 2025 14:05:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gR47qFN2fJUN95+h/+nQpePKwpILjFnhRRQcDwBRThCr5ARgXbOrWEvmDaFwFa68KqH6xyTp476oBBiLyFa9107ol0BeZH5vaFvN9D5RKU+KxQmu09QC1sfvTKJuNacHYVxFmDpWaTfENcIDvEMafcFKTX8v+UzTZ2N/7RDzd2HH22EU8RMSto4o9IPAU6wKRV5ql0uitceOFgxH2MBb6vqN5bIA3Y2o5pQ3WkGm/w1dBl18k73sOhIbRxFJzbKtxWsUvTlrkISH1TqOhLY7nyGvNJ3Ta6VIHH0fEsmexqd66+2a9EqhWaQrDu4GdAugA9g8SCkXQeHXbm2SAjHMbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yD+a6b/y7yvwfldGjfZYQGlqwS2bO6BuIaqVmgTkAgw=;
 b=dYETXOD+E0HRXDEN7gYcaQ5NHx9Y1ETlqD0GemnHVF1/ecvSD7DmhpjlOQVfeHkJBlZJAOYVp34/PeUutVkNOhztQWjQec3UhTnrNFmcqkEBvsLtcF/p76Jj8YQUrPOjBnsY2h8/xbwFJ1mOWE17n4RgS/LeZy6nAGmblF+BZyiwhCkLlqmtvAPjCZIzkVGVcC9zvw2kWMZ8RgZ1FmlOtHDQL/BmM/Y1WxK08HVWLNZl27o9yU56PrdXJtMnmK0RtG7rZ/+0Yk+UsDC+BD+6I/T07WdtdqbXS/65wdI8xoYSnGuDBKWpd9wve9+GcZL1PztqYo8Ugr3XcjOVWFvRKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by DS0PR11MB7903.namprd11.prod.outlook.com (2603:10b6:8:f7::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Wed, 18 Jun
 2025 21:05:07 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50%4]) with mapi id 15.20.8835.027; Wed, 18 Jun 2025
 21:05:06 +0000
Message-ID: <2c4f410a-3abd-4abc-84c8-13e7e3b40a73@intel.com>
Date: Wed, 18 Jun 2025 14:05:05 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/10] drm/xe/xe_late_bind_fw: Reload late binding fw
 in rpm resume
To: Badal Nilawar <badal.nilawar@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <alexander.usyskin@intel.com>, <gregkh@linuxfoundation.org>, <jgg@nvidia.com>
References: <20250618190007.2932322-1-badal.nilawar@intel.com>
 <20250618190007.2932322-7-badal.nilawar@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20250618190007.2932322-7-badal.nilawar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0219.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::14) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|DS0PR11MB7903:EE_
X-MS-Office365-Filtering-Correlation-Id: f63ada2f-b627-4c35-56d2-08ddaeabcd30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TnFQazZGSTBjS1IzTjVWTFVWeHovOGRoUy9wU1Y1eExON0dPNEdUVW94VEVu?=
 =?utf-8?B?d2RETDlUcjRzTjA0Rm5MdUZiTDRqd2ZCYXZmZ1lDYmduZkxsRldNQnZqSHZ5?=
 =?utf-8?B?VW5TS3ExUGNUQURxTzNWS1lmTUJiZmZZSU1nUWVRL2hNZitJZWdubS8zTTVx?=
 =?utf-8?B?REY5bmNaY1ZyNER2SGEwWFJ0b2dNTXg0YlN4a2pHOWhUSU5zckdwbFdZa3Mx?=
 =?utf-8?B?RXFyRTFVMVJXZWt1dGdpVE9MSVpidmV0bU1MZFhONG5MSjdjaVVhZXJ0RHBR?=
 =?utf-8?B?WGxuK01VNmNzd2h3cWhoVzhlaHMwa0E1cW03WUk2SjNIMzlYb1A2WU11OWFO?=
 =?utf-8?B?Y1FtMVl6bU8vODEyTEMzbmM2U2JwbzlmWlgyMFFyR1J6Z1BsTzhBOXZoR2tL?=
 =?utf-8?B?NHNmM2J3ckpwd0d4QTFwcXlwT3UvclJzbjYzYnNGb1ZUV21yWUNBbWFqOXpl?=
 =?utf-8?B?aXhHdTFtUXJvdUE5VUNndGJiTHo3VkxrT3l3Z2RQdUNaNHNVUjdRem5STllC?=
 =?utf-8?B?OHNPR0VwdVNPM0xqK3BCamE4eVRnSVRVNVB0bFgwWDNIZlRyYWpFYkNQUUxh?=
 =?utf-8?B?cEtnZnlRTEh3TUFyN1RBMkdhTnZPZWpCL1lqSWF3bTlWcDNNaFhnTzF2RnAz?=
 =?utf-8?B?bm0zYWxVeG1CZzE4bmVubVhEdVlWZER2MWYrNkVacFBmYkxZWGhGcHFIZk9E?=
 =?utf-8?B?bmhwWWFKNHFrbGpPSWtBT0EwK1F5S1AvWlZicHljZU9CQzFnL2VzN3VOY3lz?=
 =?utf-8?B?L1V0cEVyV0pCN0F3SmRnQ21NSmRjRmprVDhrUnQ3U09Ubk5FeDFHU3cra2Ft?=
 =?utf-8?B?dmVKNHBhNDd0MEtyZHRNelZkRUNnK1QxbW1lRUFwb3NIL2kyUFNBZU1Hdng0?=
 =?utf-8?B?aGpNR0NxNjlKSE1hOStiRTQ1RTB4OGw3NGd3aVkzWVA4bVpwamJGZldUSEQ0?=
 =?utf-8?B?UFVOUEo4d09wam9XaU4wcEtNTzNub2N0MFczLzgxcEVMZHRIc3VHeFhnZGtu?=
 =?utf-8?B?MkdnbzU0ZEFCZEJMU1pkRzZhK3QzOW1aRmhINnhxRFpJeXkwUU00SUwvcEJt?=
 =?utf-8?B?ZWlwSHp0MGhzTFh4TjRlVEJwVGFXYWFwaEJGbjBqQ1FnUWJyeW1qWGYyZkQy?=
 =?utf-8?B?TDFjRGpOOUxpSUJvYk5NWlp2Um9zK0I4bmxyMGdsbEwzUGw0TFhqZG42V2l2?=
 =?utf-8?B?MitZVUhqYXB1WUsraHZzamExZTFrUVBUblJST1E1Zmlha1JISU5obTlJRGIz?=
 =?utf-8?B?M3lqaWkrUTVDcno3NUNpcnhheEVuL1VGakJvQVZXL2k0UER0aDY2Rnp1TmlG?=
 =?utf-8?B?bDRlbG9RbjBoNXI5VFF0MmtvcDRtcktKb3diVEcyeHNkZnd6UFhlK2swMHJl?=
 =?utf-8?B?Rm1PLzB2R1VPWllQYml0YjI4dlp2SUpMazNyekxYT3Mza1ZUaFBMbDZ0bld2?=
 =?utf-8?B?YnVSR1d0akd0dHl0RjBhYTVlQmU2TlBuWnRCd3hDUk1uN0E3RXN1cG5sYnRh?=
 =?utf-8?B?anRjWi9CK3VIZklNZzd3ck5zOFdvU3lMMEgzKzlmUktpSC9wcE10Z2VCYzVJ?=
 =?utf-8?B?bFpsbEFFdVdvS2xpRmZjd1BKL3lXWVFJeUUvMFpGRkpMNmpLamxkN3dBQ0hG?=
 =?utf-8?B?QTZneEp4QW1xclBiUXdyb1lMVEd6TUpQaWNkV2FKTi9Wc1YxK3pBandFNzNY?=
 =?utf-8?B?cmI4K1NQd3BRS3dkVElsTWRMdDRwNGlBalNndkpTelQ5aGtyLzZWdlJXbFZu?=
 =?utf-8?B?U1RieHFOVTlrdjlKZ0hzd25YV3d1TjVhLzA1OFFhNUQ5VUwxeFJ0NEdxbnZG?=
 =?utf-8?B?VUN3TXZ5TGlycnYvNmlxOWU5UWxJY21iRWtKeUJqcmVrNzJ4NVh5eUQ2d3I1?=
 =?utf-8?B?VE94a0dHcXdRSFl2YVE4aFVYbXRSRzg1WitGTEhuVnFLUU8zbUpvdDUxZmo1?=
 =?utf-8?Q?V6LYQImppsA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UFBtUitSbTVZdEE3SW45dXI4UUdJd1ZTRVN6cnZjUzZnWjMvcFFxd09mQkZq?=
 =?utf-8?B?eUdOTlJpMlljVFd0c00xdWhSOWtRN0UxaXlUWVRXcjltUVhEQVZ1Wlo0VHpG?=
 =?utf-8?B?T3RMWGNQditCQ1c4QjJoSGpqVWlNemJ5NHl4WHBNMjgwaUxDZXRieTAzOWx2?=
 =?utf-8?B?b3VSZmo2Vy8welRLRVlNSGRpdE9kZ2V0dFA3aVB1ZzF6bHF2T0xYZktPeUI3?=
 =?utf-8?B?MHp5c2MxcEZZRDFpNlNSRHhjcmVkQUEzb1VkdDMvWXJ3RDd2UCs1czdFdVE5?=
 =?utf-8?B?V05QMWZLdWk0N2RiMms0UW14bDlsMzFSZVFrMjV4OHBHYVdYTXJZVzVKaDl0?=
 =?utf-8?B?V2d5dklvMndlMnpzYzc2NUMvdUlVZ0V2ZnB5U0xDN0ptM0NORGMrQ0pVcWxC?=
 =?utf-8?B?bjVTNWc3RUZBMWs4ZGtwUmdmTE1sdVFQNzJ1TmNRMkd6TEhWdTM2M2ZwelZ2?=
 =?utf-8?B?Ny9mR1d5UFhTMEgybDNweFp4VGNod25DMytmR0pkRkY3Wm53R0J6SGUrQ1R3?=
 =?utf-8?B?eHdPeXE1Tmthb3cxTGtGMFpXRzBvVzZueFF2NG8vaVhZSUttb0E5eG9ZTExP?=
 =?utf-8?B?OG5NcmRZK3hMMGh1YU1ZaVJBS1MzU2xCSzV3V3RpdUppZU1SL0tFeTBIejJI?=
 =?utf-8?B?N2hLOXJYcEdRMnFzdDB1bFRVVXozdHZFVHd0UnRaZEg0L2YxcGVkRmlJaHcy?=
 =?utf-8?B?aktsdW5aVGVrc0QzdlhLbkpjWFYxbmZaMjljaWRPWWF5UGkzc0F1UGNBb2lu?=
 =?utf-8?B?NmYzUjhIVHFxRS91MnNZWEFRR2pUTFBRejNtNVVlMG9GeUlLcENKQ0crNUNB?=
 =?utf-8?B?QmlqNS9pR3JCVHptUHZKaEh6ekM5emlXeEs3bDZTYVZnNkRNZEdHNm5OL3R5?=
 =?utf-8?B?N0xHNy9FQWlMdmdHa01oTnc2dHJsUjFoWWc1Y08vMkRuS0ZwYjRJL2hkQTN2?=
 =?utf-8?B?bFlaaUhtOTJpb0tUei8vZDE2a21CdjlCZjVYRXNrbVFpTU1VVGlEeXlnN3hx?=
 =?utf-8?B?aTArNHVRTlhSR0IrcnJDVThpUmQ5azJkc0FEWTlVajJuUWx0TFFRUXNkQ3Mx?=
 =?utf-8?B?NFdIN2c4YzAzTkYxY1BGRmkxY091Z2xmeEluTmRDVlNFakorQzdPLzFPODFD?=
 =?utf-8?B?OVF5amFjMVZ1WVRPV2NseXU0UVdPd2VobnpEYTAvZk5MeTI2dTFHSGJXQmI4?=
 =?utf-8?B?NU43R2p4M1E2ZDlEK2QyZndOam5HVWxCbXpsSVNwTkYySjQxRTRISjFENVNL?=
 =?utf-8?B?c0R5K0xFQzZWdkNCeWRyMm14cGE1VitOY1JHK2swdUNGRVdEMXlmMm5OVWht?=
 =?utf-8?B?bzlpbDZyYTJqSlZyejhXMzduOWdxeTBqNXBOT0liR0d2Vytra0VFV21tRzN5?=
 =?utf-8?B?QmF1V0M1RjNQbE10VzlES3U1bzB4ZzhZQlFZa2RWbHVsY0hKZ1pjREFDQnRW?=
 =?utf-8?B?OUhBcHNLWGxpVldUdjV1T2IvbEw5aWFQYVROMFNYdnZ3d2k5ZHRkU2h6dmlX?=
 =?utf-8?B?T0F6YkdmRFppNXpjOVl5N2cwcDJWd1JiVmU3ckxMVFU5azNJVncxaURYRFhV?=
 =?utf-8?B?MHdvR2FFYTBJRkFYUktvekk4ZE9rdXUrT2RCdWluVy9CY1RWaEM2ZVVOam1J?=
 =?utf-8?B?ZmZnL0o5QW1mY0wvMG9scnZZTFRuQlJXWGw0WjFFSXNJUWJzeDQ5Q1hHUmVV?=
 =?utf-8?B?c0pwUG9hZ0ZZUERpY2w0dFpCVFFTWVdNVTlKcUppZTl5Vm1GajBoeDAvWWNu?=
 =?utf-8?B?QVJIWnIyRGUwNmh3U2pLOURUUTVTSlJ3aGJuWVlvSktXcS9HNXdFMW5MZjVj?=
 =?utf-8?B?bDNDSDBOaHQrYUlRV21pbUlnZkxNbDl4NzJudHA4TVVtYUtWZjFJdXFUbGNV?=
 =?utf-8?B?dGNPeEdXU0piS2VjTHUvQ2toYmUwT24xWTFZTy9reDZwTHI2dHZ1WkxTdFIv?=
 =?utf-8?B?aFVtQ3ZPd2xtL0M3S2Mrb1NaWThROFlyM1plR1RoNDVnSURJdlowRS9GQmF2?=
 =?utf-8?B?UnVBSW53djVOQmwrZCtvRFJyWm0xU1RwNzdTak1QSlN2T0RraGhTUk9RcG04?=
 =?utf-8?B?TktrVm56YUNPelBGaFdaN3NEWCs1cHlEaUs1Qi9IallGamNGVTErYkljVCtQ?=
 =?utf-8?B?Y1owc2dzMzlTRU9QWDlvS1MrT2pNcHlkRUsxeXN6RjZpcCtMV1UzVEhaeFRM?=
 =?utf-8?Q?wNEGAw2URTe9zHkMXVI+zEU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f63ada2f-b627-4c35-56d2-08ddaeabcd30
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2025 21:05:06.3272 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LGW8hUwUuaCjR6tZE+b7DN12iZMJ+DOmG5za6upLDl5swz+qGjFm3teS9caAofdSD5aBnxckuoKfzhz8yVYyL7PoE/QUguGQelNnYcz5r/A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7903
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



On 6/18/2025 12:00 PM, Badal Nilawar wrote:
> Reload late binding fw during runtime resume.
>
> v2: Flush worker during runtime suspend
>
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_late_bind_fw.c | 2 +-
>   drivers/gpu/drm/xe/xe_late_bind_fw.h | 1 +
>   drivers/gpu/drm/xe/xe_pm.c           | 6 ++++++
>   3 files changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c b/drivers/gpu/drm/xe/xe_late_bind_fw.c
> index 54aa08c6bdfd..c0be9611c73b 100644
> --- a/drivers/gpu/drm/xe/xe_late_bind_fw.c
> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
> @@ -58,7 +58,7 @@ static int xe_late_bind_fw_num_fans(struct xe_late_bind *late_bind)
>   		return 0;
>   }
>   
> -static void xe_late_bind_wait_for_worker_completion(struct xe_late_bind *late_bind)
> +void xe_late_bind_wait_for_worker_completion(struct xe_late_bind *late_bind)
>   {
>   	struct xe_device *xe = late_bind_to_xe(late_bind);
>   	struct xe_late_bind_fw *lbfw;
> diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.h b/drivers/gpu/drm/xe/xe_late_bind_fw.h
> index 28d56ed2bfdc..07e437390539 100644
> --- a/drivers/gpu/drm/xe/xe_late_bind_fw.h
> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw.h
> @@ -12,5 +12,6 @@ struct xe_late_bind;
>   
>   int xe_late_bind_init(struct xe_late_bind *late_bind);
>   int xe_late_bind_fw_load(struct xe_late_bind *late_bind);
> +void xe_late_bind_wait_for_worker_completion(struct xe_late_bind *late_bind);
>   
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index ff749edc005b..91923fd4af80 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -20,6 +20,7 @@
>   #include "xe_gt.h"
>   #include "xe_guc.h"
>   #include "xe_irq.h"
> +#include "xe_late_bind_fw.h"
>   #include "xe_pcode.h"
>   #include "xe_pxp.h"
>   #include "xe_trace.h"
> @@ -460,6 +461,8 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
>   	if (err)
>   		goto out;
>   
> +	xe_late_bind_wait_for_worker_completion(&xe->late_bind);

I thing this can deadlock, because you do an rpm_put from within the 
worker and if that's the last put it'll end up here and wait for the 
worker to complete.
We could probably just skip this wait, because the worker can handle rpm 
itself. What we might want to be careful about is to nor re-queue it 
(from xe_late_bind_fw_load below) if it's currently being executed; we 
could also just let the fw be loaded twice if we hit that race 
condition, that shouldn't be an issue apart from doing something not needed.

Daniele

> +
>   	/*
>   	 * Applying lock for entire list op as xe_ttm_bo_destroy and xe_bo_move_notify
>   	 * also checks and deletes bo entry from user fault list.
> @@ -550,6 +553,9 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>   
>   	xe_pxp_pm_resume(xe->pxp);
>   
> +	if (xe->d3cold.allowed)
> +		xe_late_bind_fw_load(&xe->late_bind);
> +
>   out:
>   	xe_rpm_lockmap_release(xe);
>   	xe_pm_write_callback_task(xe, NULL);

