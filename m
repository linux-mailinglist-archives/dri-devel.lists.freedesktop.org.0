Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OKOlJKBjemmB5gEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 20:29:36 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E94FFA8283
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 20:29:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ECA310E276;
	Wed, 28 Jan 2026 19:29:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GdNjHqkl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6484F10E276;
 Wed, 28 Jan 2026 19:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769628572; x=1801164572;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=LHNP21w4lqh2d4wNEM/X6D4Irptl2INrW4v3Z8CCZuk=;
 b=GdNjHqkltkRcRV8TajYAoRP5iTFwMTBHPf9MxbeWqemz+GVFL2s+b3In
 tmkfWqi6JwCIkwgUkFcOceinT6WrTdaibgvGaJXczgayX92mJxQFPGmWM
 eBmGn5dvUEyf5anEjEYhuOYi5qM3ud2SZCfHTS6LmAkH55h4uoxePtAmo
 3svwPDb9kxtHyBvhH2nLQ1mtMZttFKKJ9ONRxeT5maes4t1NMNFfRqSBL
 EnUKbLRhElxnE9Ez6sc1fTpvtqutwUO83TYSZEwloZLpUEVOAuAUqg2Cn
 PzLincsu1iGme63E9iEeum9nBPEyH6ezx3GgXuSzsF+3xfhYTnmJKY5aN w==;
X-CSE-ConnectionGUID: OWa1iWzWRiWKZ5/FdlpY0Q==
X-CSE-MsgGUID: pHvctI8iSpC4p6HEPmswSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="82280488"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="82280488"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 11:29:31 -0800
X-CSE-ConnectionGUID: 6Z12H226TkqMTw3ZaDDh2g==
X-CSE-MsgGUID: xEbQDZMiS5aJtMNnVXlbuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="208722009"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 11:29:31 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 28 Jan 2026 11:29:30 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 28 Jan 2026 11:29:30 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.38) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 28 Jan 2026 11:29:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ugmfv8CxGclgRpnN6UvNwN/0/Mfw2CWuLpjEC9+F7TKXHJW7Lzi+T9qV2ej9kKXmtcRBsmyhoAkNfLfqIR+2MNws3A8bMvHrxXaopvB76OV7B/14mWKJpNKdGBc4loKIxSLsvk+6/qkLOBs3MJwItc1+BADiYKbYfjJ9PVXq05lJi28KmTMQpBMVyyJY6X8enVqk36pkKrpZLn4h7DchIz0x1mxdCHRLU3en1rS0Isav7w5JrY5Py+AnFeKGNXYhs9rFM+uPPAIMYf9m2ZEAUE9Z7iBYszLROjIIqvoFjBTWmCCZMrfhpJSUt+fzglqh3YKkiGe1o9eeMSILLXYIYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VGaAf1H9vIxt1q5iHqInDe+YCI2V0q7Y+aQIHnxQqyI=;
 b=bqdP9vXC65pQsw/50LJbGKrax5J5HQ3jGATwzGakdUmsBac+R0Q7AWS8MQe5AY9cs9yXEnrd1FNrJkankPEF+I/vXnedg6Z0XmOhn5Y2tKOmmvBhjGeZmDhRgHidfCfepao5wqWcNNA5twJR2R6882Lkyq5OjSYDwc6aCrjNIUryPG3YMW3C7+aFSzIPNQPLO8zFzdbRORALauN7dGDR87VIk1/VLmsDkzwY62/FgDrMo8JuV0O7uJwp+3GaxrYR95Q7eeZYF0OMHQ01HPYj+wNUZRmotPh9XkfNR3nc0SR8C+ne/0474E+qWj0rPtUAs1mdHV3lN7SJDG2WqzIuIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH8PR11MB6928.namprd11.prod.outlook.com (2603:10b6:510:224::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.16; Wed, 28 Jan
 2026 19:29:27 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%6]) with mapi id 15.20.9542.010; Wed, 28 Jan 2026
 19:29:26 +0000
Date: Wed, 28 Jan 2026 11:29:23 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
CC: Leon Romanovsky <leonro@nvidia.com>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <francois.dugast@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <himal.prasad.ghimiray@intel.com>
Subject: Re: [RFC PATCH v3 04/11] drm/pagemap: Use dma-map IOVA alloc, link,
 and sync API for DRM pagemap
Message-ID: <aXpjk5sAgOzE3OcR@lstrano-desk.jf.intel.com>
References: <20260128004841.2436896-1-matthew.brost@intel.com>
 <20260128004841.2436896-5-matthew.brost@intel.com>
 <20260128142853.GH40916@unreal>
 <aXpLhN08jVbltQC0@lstrano-desk.jf.intel.com>
 <20260128175531.GR1641016@ziepe.ca>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260128175531.GR1641016@ziepe.ca>
X-ClientProxiedBy: SJ0PR03CA0148.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::33) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH8PR11MB6928:EE_
X-MS-Office365-Filtering-Correlation-Id: ae360af2-954e-42a4-7b30-08de5ea38c2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c1ppcHpNWEwzQnMwU25lQlVkelRiZ09FRHBVWlRRRlFkalVjYVZUajZCWnJT?=
 =?utf-8?B?aDF3c25naSswTm12WjNRYUVDRVcxL1FUeElHUFFYV3RBVDRXUU42SUlxSHp6?=
 =?utf-8?B?aEJ6M2RmNGVaOWpSakN3TDl6Rnh4ZEF6WUxma3RBd1lsbWZHUmdvNFoxeTRl?=
 =?utf-8?B?Y29pN2JLQytkRkhybU9BRThsd1pnL3VrTkVIS3dwRlZjY21DZkZGQUMwaTdG?=
 =?utf-8?B?N0x4cm1RcFNwU21pNDN6UDdTc0tYMHEvNzBVS2RvQUpQdVhqOXRMWFhDOGww?=
 =?utf-8?B?NE1wbE9Mb3lGd0FoQittUVBlMXJna24vS0kvK2VQVnNRNTA1b09GSlZYNzVp?=
 =?utf-8?B?cVlvMkpkS09USFBVaEhrQWMweklnUEcvWmNpY0poenczSE1uenhyeTliRW9w?=
 =?utf-8?B?bkJkY0o3UndwUE9UenNLdW82MHphL2lmRTRsUWhhRjB4d3NORWdocytEdkJY?=
 =?utf-8?B?QXZxVlRSd0dDTXFMTk5pVXFTN2ZSR0RONzZZZEJGZjJENi9CM0hFTDArQTVw?=
 =?utf-8?B?c0NaQnFNbVpFNEpFUWdSUXdmUG5XTFYxZFBjMCtHVElPRUpPMExFSHpiVENs?=
 =?utf-8?B?dGVrRFE2bFM4TFVzNFRTR1pvNE13VHhyaFFXSnYyNzU2Skw4dWtCa0pyeTBV?=
 =?utf-8?B?TUFIZisxUXV2SmdnTm8rbnpKeDN4U1dGRG5BV1FWQ3luSjgvQ0NHdzlyM0NO?=
 =?utf-8?B?T3FhU3lUWk5uMVZSRnhLaDhvOEhkSlh0YUNDV0ZiR1dlVkhkNXNiUTRMZ3RS?=
 =?utf-8?B?aSt1Rzh0VGwvWjk0ajc1SDlOa0RPNXFXbTZkQ0Q1a1ZXNld2T2VXSzlFYWNP?=
 =?utf-8?B?WUVjM2lQVnhJbTZWVnkzSWtWU1NSZkxVdXF0RngwTzRiM0N0TTJwMmd6bHhh?=
 =?utf-8?B?QnpZVDdmRXBoYjVGc1QzU0xUVDRzc3VNaEJ4UUVnSnpKM1RIV2FnWU0wUlBa?=
 =?utf-8?B?ZWt4cTRuV2ZBK2F2bkgySlAwbEoxQUo4VHZYd3F0V0dyeFk1WEp2Z0RHSENX?=
 =?utf-8?B?RTh2V09WYmM2bFh6WjNWYmdqZW45S2hxdDVkek5HK2I2T1ZLV3FuN3pSdjkr?=
 =?utf-8?B?SGVoYmYwQWZvTHZEUjl2Rks2VHo2bzhsM3V4OGYwNFhycGs4R25pY21RWlda?=
 =?utf-8?B?cVRNcGY3NDEyUEhQalFqQnVtRUxuWlV1YXBJSmV4TSt3NmpLWlZ4cHB0Z2FL?=
 =?utf-8?B?QTg1cFNKNm4zeUVCQkoyaWprWXpodFByTFNhMUlxRVgxWHZkRVVvcDhCdFhv?=
 =?utf-8?B?UlpZdzlkTDVkUGRVdkN4eXNQNDB6SVl1bFZodFhnRnpqUE9HY096WGMvdk5v?=
 =?utf-8?B?aHh0R1poMWVJT3FpUndOT01ybkp5YlpHalIvU0piOEJhQlppc3FiMkV5NkQ1?=
 =?utf-8?B?YjRrdHA4dUFGdk1IYXhyS1RQRkZyQnJHNHBrbjQ4K3J3MEJreVZEb1JsVXhp?=
 =?utf-8?B?dGFPSVl0UGtoZDVuMVNKd0lVSXJNTEpkbm5qQ0MvdFpzRFY0Q3VkL1hXK0N5?=
 =?utf-8?B?RkxXVEpsTjJ4STg4ZDFJOWkyYy9GYjcxYUJaUjdIRlYrZ2dpT0twQlN3RWZ5?=
 =?utf-8?B?ckNJcUd1N1ZHUTNaT0dGUmVoZDJCRjFsOW02Zzk3ODNibU8zMWQwRHFURUNh?=
 =?utf-8?B?bVdhdVQ4TFVJL2pPOUxLdmtoRE5CZkdNYXNLVDdxNnRvR0RrMzQvZFdMMnZX?=
 =?utf-8?B?RWJ6YXlWSUppb0lpRDdMbGlXdlJmNXo3eWluRHZNK0M2cnZ4MkR1SzNIVVZI?=
 =?utf-8?B?ZVpHVTdVU0ZrYWZ5RllQQTVjMFNsMnJRL1J2Umo0TDh4bE91bkVVNG5oOVNL?=
 =?utf-8?B?Y2hWejZ5YzVscHBoSkJPa2dBUm1WQTZ4cjhKcE5CNStkUmFXVWpWd2VJMUtZ?=
 =?utf-8?B?WVJKaWNWUzk2cjFUaFVYMmNQQjBwY29iOEVxZmpxNC9FeUJJZzZwRFJxWjZL?=
 =?utf-8?B?eTFBK0M0Rmk5d3kybmJsV1MwSnJKOUowbWhCR2dNZ0dJNWZaamdXNkdmTVVC?=
 =?utf-8?B?WFU4d2xFZHllcXdRN0xyT2hrZ3FTMUZDS2hnd2ljU084aXBEMjhTTStVNjV0?=
 =?utf-8?B?djdXdndHMVN2YWZHcDVnVm4yajNLRFczWDU5TWZrY2ZLNGY3ZUZlbXI1QmtV?=
 =?utf-8?Q?XQkY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cHpnS2E0QWpVcmVQVVZ4U0Y4WW03bHpXdWRFdTlhOGh3dnVrMmdtbngvajVV?=
 =?utf-8?B?dnRVd2NkeE5PYnZsYTlGSjNEV2p1WjFzcEZrTVZBY054ZEt4Y2RjcEc3ajRq?=
 =?utf-8?B?dTFxZ1N1ZHIwNXVLdHZzWnV6NllwTXA5WU85c0d4YWJYK09ZeCtIbWpJSFdj?=
 =?utf-8?B?Mi8wZi9RTFRVTTJpTHhKOFJjMDI5YlEyaGxvNmZRVWJpRDhvMmlpWE0ybHJX?=
 =?utf-8?B?bGEyY0o0UDBXOTBtMU9xU2JpRlF3T1llQ3g5ek5oeUhaM3U1OEFMMFlyV0RI?=
 =?utf-8?B?cHRkZ3llYXFRakRCeUROcXlLb09hc3ZpZ3dUVUQvUXJieGRBTmMvNW1TYUty?=
 =?utf-8?B?VFd5eFpvZGlzZWNCTWtXci91T0kzd0VkYnhYcUtlRXpzTXRnVy9vNkhEZzJN?=
 =?utf-8?B?N2R6YmlTQjNOa3lmcE41ZWRPVTk4N1MzaS9GTWl5S1Q2QlF4TTVzS2w3S0NB?=
 =?utf-8?B?VGdnKzdnM1pndVhHWlJJdjRHSnBNUGdkVitjZEkyYlNUOC9zdzRtcm8zKzVU?=
 =?utf-8?B?S0RwZTlTOTJvTExJMXhhcmt1VTVGMTZrc3pOZjlmQWkxdzFYWkIwUmZUREM0?=
 =?utf-8?B?SUhDM3pLMGJvN240MXU0ME81LzQzNHNIK2FQa3ZMMDljR3VZL01aWlpvdGJL?=
 =?utf-8?B?bDdSZG0vM2NBTEdFV1hxS01BMERscVBnWlFVWGxERUZxYUU0Z2lsWUJkdlhB?=
 =?utf-8?B?UkhCWVJPMEJiT2xPWlM3S01USjZSeEt0QytPL0ZEVnNYV0FEWmNFK2cycFhn?=
 =?utf-8?B?WW9oQitjTEt0REsyaHRYTm1oUHo0MFFmeTZKMEtnWnZUR2tmYWpCSko4Tmlk?=
 =?utf-8?B?Y1k0ZlhuaWZoUlhwVzQ3THFHdm1yNk40YWY3dGI4V2FkMzQ0YVF5RlNNaVFI?=
 =?utf-8?B?SVVWd0VFdUxxcnVjamh2a1dGajNENkVQOGI3clpMYVlZVkgrVEp4NnVDVEpG?=
 =?utf-8?B?UjVhWVk4SjhUbDl0clBSWEgxWWJTYUxBeCtoVEE1QkVibGdMUjRLQzFCNmds?=
 =?utf-8?B?SjZPQytXbCtXYWFiT2RVZy91OGd5MlVMdDhZUHpCVGJjNjZIcWw5MlJrUWEx?=
 =?utf-8?B?Q3ljWTFTcWdiMkJVK2QxRnZhQnZvL3k1WnhzYWlpc1BwL3VMaUFiRTZhdFNB?=
 =?utf-8?B?cXF3bXNYckRRN3lPdVlJTEV3RWNIdkZPK3d0RENEUFdqWkgzUlhzbGpUNmlS?=
 =?utf-8?B?eFpibUI3dUhSSExhWEJ3WW9zTVl1dUtSb2MyVU5MN1RoZ1RoSWxyT2lCbHJh?=
 =?utf-8?B?WkVZSzBNd1grek8xZXpFSTBnU3RYenEvYVFWUFpHdGF3dVJ6OElJenB0QjVx?=
 =?utf-8?B?anRudTBNend5Qyt2MDFSVVRVYW5XM3Rway9nSlVwT0tuTXBQbDNaZE5KTUNt?=
 =?utf-8?B?NkVQNlBUN3ZPVExSUHN2L1lnZG5JYWlVeVFCbXFwUjdjMlNzWHlrVUVzd1pz?=
 =?utf-8?B?bi9YVVN0VWhwSWwwSE9qSHcxUGpiY2wyd3orNk0rRlIvMEJlcHJSQmVzY2Mx?=
 =?utf-8?B?QmRuZzhJWUVMVGdPRWlpMjJ0WjJEVEx5NjFwSTRJQW50OHhQVmxTa0tNWDIy?=
 =?utf-8?B?UzJpM3hGS2tQYzEzaXFXTmhZMHdIYnBhc3FncXB3L3F2YWpKekhpRnVTY1hw?=
 =?utf-8?B?OWtjTFVUbEs5dkk4ZmVqTVhBN3pmbXhpaTRpU21NaEN1bmlEYzIrRzN2NVhj?=
 =?utf-8?B?NWlDR2FSK1F5V1pyMzhXZHFIdTZCV1AvdnNnem5mbnJoSk1Hbjl2WFk2V25R?=
 =?utf-8?B?SytVTmdwdW9Rb0VlclJ0cnRuODMwcEZMb2VzOXlpMHNKZnNXS3VoZzNrZnhF?=
 =?utf-8?B?WFJQOG02bjd3ZXlIZDlZSjFXR0pQbElPZzlaaE5Za1Y1ZnQyS2RZTDFaUkJk?=
 =?utf-8?B?VkRQcVlZTkF6MFEvLzZOQTl5SzliRjdXckNvS3Eva3pGaVA1amdoSjBFZnpN?=
 =?utf-8?B?Z3Q0Um9sSHJDdHFub1Qwb1NUMzg4dkNDRXBzY1lJQzUvYkNVOU1SS3ZtaXlE?=
 =?utf-8?B?NjNCVEtTSUwrbW5wVVF4Z2JZTWxpSTlEdDZ0bnBUWndaWThvTnluN2VmN3lj?=
 =?utf-8?B?L0VlK3RuWmtHUGFBRTBtWkxicE13b2Fwd05TU0QzNk82UC90WUM5aDd6R2py?=
 =?utf-8?B?aFpZYmxaZVg1K1k4U1hydFJscXh2NmhiaXFkNHVoQ0FUcERCMXpITElHOUEw?=
 =?utf-8?B?QzZoOVB4cU9JcmIzOTN5RnRnRWM1Y3BqUzZpMG9RRjNoMnh1eU1VZnI0M1dJ?=
 =?utf-8?B?RTNVSG15eTliU2FQSHZkWGNQMitqUzhCMTdYdk1JQjd1NWdSTC9mbzlpZEFt?=
 =?utf-8?B?SDVMdXdaNW5BTjFNRzJyK2xKVzl3b1RTNVFKTEdpem0xaERWRytVZitKVzBn?=
 =?utf-8?Q?GCTQCpIBcRTjyYt0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ae360af2-954e-42a4-7b30-08de5ea38c2e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 19:29:25.9899 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K5kUS3DDhOVr8rOSL2snmQ6KFuduSMzvJrPvhDZOPax/CrBevi9GSUF3cWFX/qcUtL3+8H0Qm8T+U7jBJB0lRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6928
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,lstrano-desk.jf.intel.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[matthew.brost@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: E94FFA8283
X-Rspamd-Action: no action

On Wed, Jan 28, 2026 at 01:55:31PM -0400, Jason Gunthorpe wrote:
> On Wed, Jan 28, 2026 at 09:46:44AM -0800, Matthew Brost wrote:
> 
> > It is intended to fill holes. The input pages come from the
> > migrate_vma_* functions, which can return a sparsely populated array of
> > pages for a region (e.g., it scans a 2M range but only finds several of
> > the 512 pages eligible for migration). As a result, if (!page) is true
> > for many entries.
> 
> This is migration?? So something is DMA'ing from A -> B - why put
> holes in the first place? Can you tightly pack the pages in the IOVA?
> 

This could probably could be made to work. I think it would be an
initial pass to figure out the IOVA size then tightly pack.

Let me look at this. Probably better too as installing dummy pages is a
non-zero cost as I assume dma_iova_link is a radix tree walk.

> If there is no iommu then the addresses are scattered all over anyhow
> so it can't be relying on some dma_addr_t relationship?

Scattered dma-addresses is already handled in the copy code, likewise
holes so non-issue.

> 
> You don't have to fully populate the allocated iova, you can link from
> A-B and then unlink from A-B even if B is less than the total size
> requested.
> 
> The hmm users have the holes because hmm is dynamically
> adding/removing pages as it runs and it can't do anything to pack the
> mapping.
> 
> > > IOVA space? If so, what necessitates those holes? You can have less mapped
> > > than IOVA and dma_iova_*() API can handle it.
> > 
> > I was actually going to ask you about this, so I’m glad you brought it
> > up here. Again, this is a hack to avoid holes — the holes are never
> > touched by our copy function, but rather skipped, so we just jam in a
> > dummy address so the entire IOVA range has valid IOMMU pages.
> 
> I would say what you are doing is trying to optimize unmap by

Yes and make the code simplish.

> unmapping everything in one shot instead of just the mapped areas, and
> the WARN_ON is telling you that it isn't allowed to unmap across a
> hole.
> 
> > at the moment I’m not sure whether this warning affects actual
> > functionality or if we could just delete it. 
> 
> It means the iommu page table stopped unmapping when it hit a hole and
> there is a bunch of left over maps in the page table that shouldn't be
> there. So yes, it is serious and cannot be deleted.
>

Cool, this explains the warning.
 
> This is a possible option to teach things to detect the holes and
> ignore them..

Another option — and IMO probably the best one — as it makes potential
usages with holes the simplest at the driver level. Let me look at this
too.

Do you think we need flag somewhere for 'ignore holes' or can I just
blindly skip them?

Matt

> 
> Jason
