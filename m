Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59F6AD2C38E
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jan 2026 06:57:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D18FE10E159;
	Fri, 16 Jan 2026 05:56:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OOPxn2d2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3738810E132;
 Fri, 16 Jan 2026 05:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768543018; x=1800079018;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=wED2euYk4eZgTppAl0zOCsg7LSBPD0XbWQd12mt4OMg=;
 b=OOPxn2d2q4IgszekbLwmwBpCUpx4bJZ7LYF/FvyLNm2wzJuTOO7bd/N/
 l/eo58e8PSjwFXB6JwVTMcjTwunMdqmSaYiaw8zMGZHSspcGQFlyRBznT
 UFBWBykCupbFhHxuPS2jsdHem+fttCmdvR1wt4Es/sEvBsOGhUpjTm/XA
 kKjLAnkSMspZQgrHCRE2VKBqFno4SStH0i0I9DOSAK6LXQDRVi6CP0k2f
 6ZqGnDefryCZkvgW4rEfiPH2UbD5c+C6j7ijW6ZtqDcF0D4APtpXY/BbW
 /7kHaR1KyZOi70nJx+AQmmw6ZvIWtuVZYJG7ifaanvuVxMr4lSg0WzMR+ Q==;
X-CSE-ConnectionGUID: Y4b3NRk2Tm6fa4WHsjPtLA==
X-CSE-MsgGUID: YRn0+YM6Tqiy27rTAfHcaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="87274456"
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; d="scan'208";a="87274456"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2026 21:56:57 -0800
X-CSE-ConnectionGUID: vTuBHDJQSQm2gf6Q0d6z/w==
X-CSE-MsgGUID: SXBeH9eGQCK9/Oh/AiOCqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; d="scan'208";a="209639017"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2026 21:56:56 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 15 Jan 2026 21:56:55 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 15 Jan 2026 21:56:55 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.53) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 15 Jan 2026 21:56:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SKEzVGY4LkQW9XCBHnJBvw/9OGgwj8VZFklEt7eyX9uTbQZjqMk8Yb5eudF6NMUwFBbdwi7AUWDNTUDfJUwqHfDuZN4tgjvXzARObR2OoVCfBYej1utJAj++t4lWwVc94Zr1esvN5sRLzLjf6q6IxDmjP2SpTUhE51paXzeHBQ0LaXztjdIIwqrmOWGvVi/H7naUtLtkl/1focmOOOIqeApx4s7nhHTLe9Cvy18qm8r7fLaBzWuvhOuexTsCI/IRXm++MQMtEuoc2ZD9g36UQgdLR5KLVqCth3QD21tOV1jZORoB3MPfUXHekBGPPmdcdFibd/Cn5ySkLPqRRO/FSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8sa4QyCPK9oeCnagzIQoulc6KAtOakJOfUFRXWoq/yU=;
 b=A1Hr1DZjRm4BKa/dTBuFz+nWNYlzqlFmC2OR6htUz58TSMY7VUVU7+63e6Rdl+hXPGgh7hPy5NB1SvM/RgraYpWV87jTKAkBVGfuIeV63h9Kngx3KVUhLMOyd/9fHqbT3Pw+ww/1dl2Gp1eAlVB38dGjRSWAwNwIEKRPzAx+zFYR+B7df4V15aB+mokJHn0wyRdJWa9JDhZSOENJkUZosACcKDIanZw8Teq21b3VTlxQFwZJveT+oJWu39Vrulh61rwIwRigmitNiIhRC8JWZIPQQlVEnsY2RpD7UWgfFcA1rlVCTiNy8woqMrMZhQ/zMGzlmqqWdoPI5kDPP8dVrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SJ5PPFC4905B1D0.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::855)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Fri, 16 Jan
 2026 05:56:48 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%7]) with mapi id 15.20.9520.003; Fri, 16 Jan 2026
 05:56:48 +0000
Message-ID: <3297a59b-a788-43aa-945d-e89592c9ba8d@intel.com>
Date: Fri, 16 Jan 2026 11:26:36 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] drm/ras: Introduce the DRM RAS infrastructure over
 generic netlink
To: Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
CC: Jakub Kicinski <kuba@kernel.org>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <aravind.iddamsetty@linux.intel.com>,
 <anshuman.gupta@intel.com>, <joonas.lahtinen@linux.intel.com>,
 <lukas@wunner.de>, <simona.vetter@ffwll.ch>, <airlied@gmail.com>,
 <pratik.bari@intel.com>, <joshua.santosh.ranjan@intel.com>,
 <ashwin.kumar.kulkarni@intel.com>, <shubham.kumar@intel.com>, Lijo Lazar
 <lijo.lazar@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>, "David S.
 Miller" <davem@davemloft.net>, Paolo Abeni <pabeni@redhat.com>, Eric Dumazet
 <edumazet@google.com>, <netdev@vger.kernel.org>, Jeff Hugo
 <jeff.hugo@oss.qualcomm.com>
References: <20251205083934.3602030-6-riana.tauro@intel.com>
 <20251205083934.3602030-7-riana.tauro@intel.com> <aTiWNkGmwFsxY-iO@intel.com>
 <b986eb03-0887-4eb2-a7a7-50ef63e51096@oss.qualcomm.com>
 <aWFruAO06O93ADjU@intel.com> <19fd4d44-b7d6-4bc2-9255-3d5159ec1435@intel.com>
 <919c0b7e-83d7-45e8-ae96-d9fb7a10995c@oss.qualcomm.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <919c0b7e-83d7-45e8-ae96-d9fb7a10995c@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0078.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d8::6) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SJ5PPFC4905B1D0:EE_
X-MS-Office365-Filtering-Correlation-Id: d28f6028-5669-4a95-14a6-08de54c40938
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S1IybmpZelArUGNPZmN4Z2dGeFVXRExIZXF0M1ZWZFY1a1YxVXMvUjZqTmxl?=
 =?utf-8?B?Z0ZBVnBvZWVlTUIvcXkxbk4zTmh4eHgxS1p0TDUxMXR3dC9uZ1lFdTA1TVIz?=
 =?utf-8?B?NmhIVjhHeGlOaTJDdng1RWt4RGQ1aXpQbWxXZlVOY0xYcVpkV1h1b1RuREVP?=
 =?utf-8?B?TFIwSU5JQTNyY2EzWlR2TjNEZUJURWUxRjUwUmZidVlkZ1dvMktkY01CNVdW?=
 =?utf-8?B?UUV0clZUNUtmbkhVUmxMVXB0cU5maEt0aWN0OWYraDA0T3NkUm5OU1hVWjJD?=
 =?utf-8?B?UXJIbFdtdmxMeFZzVDNwWDdxWkdUamRNc0lQTTVMUnBRQWxaQmx3NXA2TzI2?=
 =?utf-8?B?ZnVuNHp3UWsxbFdkczBwbFZsZU1aUnU1NFI2SThLajV0OWtZR1VZQlRPeXVY?=
 =?utf-8?B?UlJ4TUZ4a3oxUXNxcEN6R3JrTVpPcVNRU1dTRjMwQlBTSVhoMmxDSzBPTm96?=
 =?utf-8?B?UGtEMzBJcFJCR2Iwc3l1MGNzaXRWM2QzQnY1UWpWUy8rMnJ6ZDhmQ0czVjNB?=
 =?utf-8?B?bmdkVzdVeVNkVzFYMldTUzhCUllHeWV3UTBlc3dYeHNLb2tBaUwrc3hZN2t0?=
 =?utf-8?B?VHJoY0NIWDVFRkNHWHBpaUJDK21qbEZQeFlFbmNjbFVaQnlRMjNNTzJBNzFW?=
 =?utf-8?B?VnR2cmgzY0VkVDhGUHRFd0lOVkdpS2pYMFpWK3VGeDA5QXp5SFRnMmE3QTFG?=
 =?utf-8?B?UWxaZDFsK29MOXMvUVNiTTA0OTBMOEhiNW1uZGtlT0EvQlhmWUJkWm5QUUNp?=
 =?utf-8?B?aGJxK0xBMXZ6V2pmdWljSXFyeUMweVZxd2x2Ym9GRmxNa0VURUhXVmJRSDI3?=
 =?utf-8?B?ZHJsT2dzVDFvUm1Lci81SWlqOTNFVUNOZlQyV2hJcE81aG1tWEUvSHEzU3lv?=
 =?utf-8?B?MnFJZTREem1OTUhxQ0t5K08rRGtHb2ZhdnZieHFQT0xkZjNpUmFJbGFsU1pv?=
 =?utf-8?B?OGlmaXJ3SEVxYVpaQ3pOaHU5cjZBTUxZMlg0MzN6Y0NCUE95QzdZK1JTZHNM?=
 =?utf-8?B?b0QwVlVQaHV5ZUtpTld1bkJPc3BzZGRpc2pLd0krK2IwL1pmRjFUQlhnSEgx?=
 =?utf-8?B?M1RuZ1grSmVWazJDQnJMSGozbVc1QSt4NXBuTUlwRVUxSU9adVBoUlZBMlMx?=
 =?utf-8?B?RVUxMlMzcStzWTArYXN4QjlvN1IwTFNoMElUS05ENU4yTmtDVHhvZjNIcjNO?=
 =?utf-8?B?UHlmWFVtTDk0a0h6Q3poNzd3THBtYnQzOWNWT1VPMkk2NE5mOCthbXRFVE9P?=
 =?utf-8?B?OWxyaXUzM29ha0hBSkZqNG1OMEp0MkVxS0I0Q293TFl5QWs5SlYwNEtaMjFs?=
 =?utf-8?B?Y1VkRUhDM1FPMSt0Tk5NN2dFbG8raEJQY0VMNkJNbUZGVnlBZFZQTmFpMFVJ?=
 =?utf-8?B?QitDOEZLeUUyb1kzSmlYM3VoMHhOYjZWUlFQeG1qeGxpRkNNclF1bVA5TWxK?=
 =?utf-8?B?TUdjd0g2cmJKSTNER3ZZUDZsVTZ1Y1hTVngrT1Y5UjEwcnJhaUdOd0t3K0xR?=
 =?utf-8?B?aERWeTF1WVFPTDB4L1ErOFIyRjhZODFKWHVVOUJNYUhtKy84dHU4REdWSEhD?=
 =?utf-8?B?V2NKd3ZUSzhDSmhjZ3JaZWtvanlIbXYxNEZ6TGVEb2JpOEVSczN2cVpUcXZz?=
 =?utf-8?B?dHl4aFpZZnlFWnpNajJsYldRRnlGd20yQTNYYW96NzdESTRmR3FnVlNHNURC?=
 =?utf-8?B?SmtJdXd5ME4wZGduYUVhNlQ3MUlVajlRQ3lZaGNLa2IxZFh2M25lUy9XTGh1?=
 =?utf-8?B?elJjL095dSt6NzMwUlY1K1RJNXZKL01RUnZLTTBaKzdtVlVLZkdWRnV6QUdx?=
 =?utf-8?B?bG0xMSszOGZlZFZBS2Z4OXNtUU1FcnRyNjNKUTRmYVRsK25rMmRkNnBkV0F1?=
 =?utf-8?B?UTRSdzZpUG9FS2VFS0NDdnNpWTQ0WEd4Rkh4WlJ6VDJ2U05ONUpGYTFjVEsr?=
 =?utf-8?B?WFRzQkowKy9SNDhxRU8vSEV1Z2dkSkEzaWNqaWQrcWdpSFdCVnZrc2p0OW5v?=
 =?utf-8?B?a2kwLyt6Tlh1cFBBK2JUUmVrd09IMEpMcEU4em5kYVBpNmtvcys4eUFYcGZ2?=
 =?utf-8?B?Q1AxR0dEeEszbkRHQktTRGo5UmNScEcwSkhFY09YWGF1eThLK0NvZ08wbDRJ?=
 =?utf-8?Q?iKkI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZVB3L1hHQ045TVBKQmJGemN4Q1RQUE9CMy96TUNEWjhZVUt0dnZuSktjd01h?=
 =?utf-8?B?TmM4bGlkNjNjTkNSQ1NoL0xjckZmLzh5LzFuNnJiL0hRaFpoK0NYOU1SN2hy?=
 =?utf-8?B?NlhQQVFtZnYxakVrWDVBeCt6VGw2L1hwcFYrVDI3dG9ON2IzK204STRIeDd5?=
 =?utf-8?B?VmIxS0Z5QnV2c1g2OElPOUN2QnQxZ2JCQXJqQkZuTytpTzAySjVYTVZHTU1R?=
 =?utf-8?B?d0orMDhNVkpWSFVDTXl3amtPVGhUTUF6WVZWVmhya1AvVGI0V2NuQnBiS05F?=
 =?utf-8?B?RlZYWklLR0U3cTFsREZ5VVY2R0JSK2NZZmgrMVRKVTNwV3NERUg5OU1ZcC9l?=
 =?utf-8?B?ZlB5ZW9UaVQrNVFzYWttQ1hkdGdmejZXSGwyY1BhMC83dlRTTDR4bUQvZXI3?=
 =?utf-8?B?TmF5b3lEaDRQLzBjUDdIbU53UTJEL1dnbzJYc21JdWd6dkpsTkxTd3BGMCtG?=
 =?utf-8?B?b1NWeWo1YmdnaThsTlVBeWViRGhUYllxZmxmMU0rbEk3Z1NvQVBRU1kyZTc2?=
 =?utf-8?B?c2Q3VkpJNWVBdlo1ZHpHOXJqNlNZeVFUbnpFTnhuK0dMQ0NtSXJnMElKcUJ3?=
 =?utf-8?B?Zm1IS2hZWHFsQ0p0WG1URGROcUNLVWZjQVhHT3ZYdUNXRzBCT0ZCd3FYakRV?=
 =?utf-8?B?U2hNcmRNaVd3UEthSUxVaDFldjV6bndSK0xyMmxCcnZ3ajM5eGtaQVV6SVoz?=
 =?utf-8?B?Ym95anpibVJndmhNTkxrQkhadTM1cWFXT1pzaEhqQmRPQVBYeWZhSXBTZDFW?=
 =?utf-8?B?VUIwZmZnV2FlQ3R5bjNpV3dFdEtUQmZaMGhWQ1lkS1BpR0M2ZHBhL0lnZEMv?=
 =?utf-8?B?ZjZuM1lmdGtMcmJUM0ZnZVg5VVZWa0dnZ2kxTlZaKzZlbzhaV0ZmbnBPVTl5?=
 =?utf-8?B?Zkx6VlNhUXcvUmFLNTR3MlZ0dkovK1ovZ2RJRTNmcW5pdjh6dEhFVFk5Zko3?=
 =?utf-8?B?cHh1S2l3SENwZ0VNQTZUelVIcWRQczFOUDNEcXYzY05ua2lqUHMwUzRWcnhi?=
 =?utf-8?B?R1paRytwMC9IR0lWUjRUYmVGKzh4T3dONDg0L3hPY0JUbjBBck90d3ErTUpm?=
 =?utf-8?B?OWwwMmsrZHVieU5RWjEwc3lycWpPR1VZSUxaaFJaYXRFNFR3bHNvTzdNVEZu?=
 =?utf-8?B?QXphcUtxQkRpcTZibFpiUkhkL3FrUUJjR2R0ZS9XcVg2SmZoYm0vUExvMUFZ?=
 =?utf-8?B?UG4zYjJHN2tHRkZNQ0o3VkludmtXeUFjRTBPQ1h3eVRqSlFxVThWMjBmckNK?=
 =?utf-8?B?MGFrMmg0Rk5ZeGJVdGIwNW9wSXJwem5GNFY1NGZ3cW9kaXpZMjczZ0pKQlFh?=
 =?utf-8?B?TjJ6Q3ZVM1Jub1RmV1BZWTNrUE05M1c1VS9ITkhKaldPZFhJQ09qK1FwSlBi?=
 =?utf-8?B?V0lwb09zSk53RjZUUUEwSW45Mk0zaVplanY3ak8vY1JpWE5KY3BCMVp5L3Yr?=
 =?utf-8?B?dlZFaUJNR24xRU5uUVpuZXhNZUFkUjZwN05FYzFkVzhjeUk3VFlpRnhpUkd1?=
 =?utf-8?B?KzJ6YkdscUFBSy9uREl5SURzMTZvWG4wS0Q4MGoxTnlJbFB0VmlUNWRjNnlE?=
 =?utf-8?B?blplVDFYNlNBZUx3bU9ET0orUkJkYzhpMUVOV2dxZzVSRExoK2xCWms3VVBR?=
 =?utf-8?B?NXpHNW0wcW03cE56bG90QUdGbEJCL3ZXZ2RLajNWdWJsK1FFdDdQQmdvbTd5?=
 =?utf-8?B?VzBGSUJBUjZpWnc5UHNiKzdoWGFEVDBYSnpBSmo3V2lCLzBwNjE1d01YZUha?=
 =?utf-8?B?dndqUlB6KzdiTjhVYXJDTWZ6WitkbnJFNEJQRGtqZnE3NWpLSDZsbUthTkRL?=
 =?utf-8?B?VE1NeTF6U21TNWNPN3BtWWZGUkgzWlRYSHIrZTVOMktuR21aV3Y4RnFOSXZW?=
 =?utf-8?B?VDhpdXlIeXBJMWYzTCtHV3FmMHFsSHBMelpnVzJWeDkzWTRtM3FmWVV2TVMy?=
 =?utf-8?B?WDF2dU5seEJUMm1uS0I3NWwwRUlhZ1N2YWQrMDA1QU9rcmlVbVFxSHp5c3A3?=
 =?utf-8?B?b1RCeENIeEMwTXNJb1c5V2UwVGVqSkhLS1IrL2NlMStWbEkwdEZGTTI5cW5s?=
 =?utf-8?B?NTBTVVN4NlV2ejB1MmVtNWRYakU2dG82V2lPNzZUNlhXN3VERzBJZmZvQmlo?=
 =?utf-8?B?WCs5Qm4vYkJPZXhveEUzV1RUSTVRdTNyYkN3ZU45TFNkclB6VnBkRXpOM2Nq?=
 =?utf-8?B?R2t1dEdKcFhDaXNhYmVCZW11SWtvRzhaWE14bzcydndac21oMEFHYll4ejRO?=
 =?utf-8?B?OFdZZmZtQjVXVlJmMG11NmRWY2ZsQ0VzSHIwQzNMeEswUXA4VWs4cUwzWjNQ?=
 =?utf-8?B?b1pESG1WUXRVeEQyZmNwLy96TlJiNFhkTGVGYzNFcXh4MENGYy94Zz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d28f6028-5669-4a95-14a6-08de54c40938
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 05:56:48.2204 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 10ncU9H64ozRn5eUHoX3jF2Jpcff70AEI0F/f2MTYJS9kw7qhjDEB2oXlbeEKnuDSFfQS2LIND3H4NmdaaOZzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFC4905B1D0
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



On 1/16/2026 5:09 AM, Zack McKevitt wrote:
> 
> 
> On 1/13/2026 1:20 AM, Riana Tauro wrote:
>>>>>> diff --git a/Documentation/netlink/specs/drm_ras.yaml b/ 
>>>>>> Documentation/netlink/specs/drm_ras.yaml
>>>>>> new file mode 100644
>>>>>> index 000000000000..be0e379c5bc9
>>>>>> --- /dev/null
>>>>>> +++ b/Documentation/netlink/specs/drm_ras.yaml
>>>>>> @@ -0,0 +1,130 @@
>>>>>> +# SPDX-License-Identifier: ((GPL-2.0 WITH Linux-syscall-note) OR 
>>>>>> BSD-3-Clause)
>>>>>> +---
>>>>>> +name: drm-ras
>>>>>> +protocol: genetlink
>>>>>> +uapi-header: drm/drm_ras.h
>>>>>> +
>>>>>> +doc: >-
>>>>>> +  DRM RAS (Reliability, Availability, Serviceability) over 
>>>>>> Generic Netlink.
>>>>>> +  Provides a standardized mechanism for DRM drivers to register 
>>>>>> "nodes"
>>>>>> +  representing hardware/software components capable of reporting 
>>>>>> error counters.
>>>>>> +  Userspace tools can query the list of nodes or individual error 
>>>>>> counters
>>>>>> +  via the Generic Netlink interface.
>>>>>> +
>>>>>> +definitions:
>>>>>> +  -
>>>>>> +    type: enum
>>>>>> +    name: node-type
>>>>>> +    value-start: 1
>>>>>> +    entries: [error-counter]
>>>>>> +    doc: >-
>>>>>> +         Type of the node. Currently, only error-counter nodes are
>>>>>> +         supported, which expose reliability counters for a 
>>>>>> hardware/software
>>>>>> +         component.
>>>>>> +
>>>>>> +attribute-sets:
>>>>>> +  -
>>>>>> +    name: node-attrs
>>>>>> +    attributes:
>>>>>> +      -
>>>>>> +        name: node-id
>>>>>> +        type: u32
>>>>>> +        doc: >-
>>>>>> +             Unique identifier for the node.
>>>>>> +             Assigned dynamically by the DRM RAS core upon 
>>>>>> registration.
>>>>>> +      -
>>>>>> +        name: device-name
>>>>>> +        type: string
>>>>>> +        doc: >-
>>>>>> +             Device name chosen by the driver at registration.
>>>>>> +             Can be a PCI BDF, UUID, or module name if unique.
>>>>>> +      -
>>>>>> +        name: node-name
>>>>>> +        type: string
>>>>>> +        doc: >-
>>>>>> +             Node name chosen by the driver at registration.
>>>>>> +             Can be an IP block name, or any name that identifies 
>>>>>> the
>>>>>> +             RAS node inside the device.
>>>>>> +      -
>>>>>> +        name: node-type
>>>>>> +        type: u32
>>>>>> +        doc: Type of this node, identifying its function.
>>>>>> +        enum: node-type
>>>>>> +  -
>>>>>> +    name: error-counter-attrs
>>>>>> +    attributes:
>>>>>> +      -
>>>>>> +        name: node-id
>>>>>> +        type: u32
>>>>>> +        doc:  Node ID targeted by this error counter operation.
>>>>>> +      -
>>>>>> +        name: error-id
>>>>>> +        type: u32
>>>>>> +        doc: Unique identifier for a specific error counter 
>>>>>> within an node.
>>>>>> +      -
>>>>>> +        name: error-name
>>>>>> +        type: string
>>>>>> +        doc: Name of the error.
>>>>>> +      -
>>>>>> +        name: error-value
>>>>>> +        type: u32
>>>>>> +        doc: Current value of the requested error counter.
>>>>>> +
>>>>>> +operations:
>>>>>> +  list:
>>>>>> +    -
>>>>>> +      name: list-nodes
>>>>>> +      doc: >-
>>>>>> +           Retrieve the full list of currently registered DRM RAS 
>>>>>> nodes.
>>>>>> +           Each node includes its dynamically assigned ID, name, 
>>>>>> and type.
>>>>>> +           **Important:** User space must call this operation 
>>>>>> first to obtain
>>>>>> +           the node IDs. These IDs are required for all subsequent
>>>>>> +           operations on nodes, such as querying error counters.
>>>>
>>>> I am curious about security implications of this design.
>>>
>>> hmm... very good point you are raising here.
>>>
>>> This current design relies entirely in the CAP_NET_ADMIN.
>>> No driver would have the flexibility to choose anything differently.
>>> Please notice that the flag admin-perm is hardcoded in this yaml file.
>>>
>>>> If the complete
>>>> list of RAS nodes is visible for any process on the system (and one 
>>>> wants to
>>>> avoid requiring CAP_NET_ADMIN), there should be some way to enforce
>>>> permission checks when performing these operations if desired.
>>>
>>> Right now, there's no way that the driver would choose not avoid 
>>> requiring
>>> CAP_NET_ADMIN...
>>>
>>> Only way would be the admin to give the cap_net_admin to the tool with:
>>>
>>> $ sudo setcap cap_net_admin+ep /bin/drm_ras_tool
>>>
>>> but not ideal and not granular anyway...
>>>
>>>>
>>>> For example, this might be implemented in the driver's definition of
>>>> callback functions like query_error_counter; some drivers may want 
>>>> to ensure
>>>> that the process can in fact open the file descriptor corresponding 
>>>> to the
>>>> queried device before serving a netlink request. Is it enough for a 
>>>> driver
>>>> to simply return -EPERM in this case? Any driver that doesnt wish to 
>>>> protect
>>>> its RAS nodes need not implement checks in their callbacks.
>>>
>>> Fair enough. If we want to give the option to the drivers, then we need:
>>>
>>> 1. to first remove all the admin-perm flags below and leave the 
>>> driver to
>>> pick up their policy on when to return something or -EPERM.
>>> 2. Document this security responsibility and list a few possibilities.
>>> 3. In our Xe case here I believe the easiest option is to use 
>>> something like:
>>>
>>> struct scm_creds *creds = NETLINK_CREDS(cb->skb);
>>> if (!gid_eq(creds->gid, GLOBAL_ROOT_GID))
>>>      return -EPERM
>>
>> The driver currently does not have access to the callback or the 
>> skbuffer. Sending these details as param to driver won't be right as
>> drm_ras needs to handle all the netlink buffers.
>>
>> How about using pre_doit & start calls? If driver has a pre callback , 
>> it's the responsibility of the driver to check permissions/any-pre 
>> conditions, else the CAP_NET_ADMIN permission will be checked.
>>
>> @Zack / @Rodrigo thoughts?
>> @Zack Will this work for your usecase?
>>
>> yaml
>> +    dump:
>> +        pre: drm-ras-nl-pre-list-nodes
>>
>>
>> drm_ras.c :
>>
>> +       if (node->pre_list_nodes)
>> +                return node->pre_list_nodes(node);
>> +
>> +        return check_permissions(cb->skb);  //Checks creds
>>
>> Thanks
>> Riana
>>
> 
> I agree that a pre_doit is probably the best solution for this.
> 
> Not entirely sure what a driver specific implementation would look like 
> yet, but I think that as long as the driver callback has a way to access 
> the 'current' task_struct pointer corresponding to the user process then 
> this approach seems like the best option from the netlink side.
> 
> Since this is mostly a concern for our specific use case, perhaps we can 
> incorporate this functionality in our change down the road when we 
> expand the interface for telemetry?


Yeah using pre_doit we can allow driver to make decisions based on
the private data or driver specific permissions. However we will need to 
check the CAP_NET_ADMIN when no driver callback is implemented in the 
netlink layer as a default .

Thank you, you can incorporate the changes when you add telemetry nodes.

For now, I will retain the admin-perm in flags.

I will address the rest of the review comments and send out a new 
revision shortly.

Thank you
Riana


> 
> Let me know what you think.
> 
> Zack
> 
>>>
>>> or something like that?!
>>>
>>> perhaps drivers could implement some form of cookie or pre- 
>>> authorization with
>>> ioctls or sysfs, and then store in the priv?
>>>
>>> Thoughts?
>>> Other options?
>>>
>>>>
>>>> I dont see any such permissions checks in your driver implementation 
>>>> which
>>>> is understandable given that it may not be necessary for your use 
>>>> cases.
>>>> However, this would be a concern for our driver if we were to adopt 
>>>> this
>>>> interface.
>>>
>>> yeap, this case was entirely with admin-perm, so not needed at all...
>>> But I see your point and this is really not giving any flexibility to
>>> other drivers.
>>>
> 
>>>>>>
>>>>
>>>> Thanks,
>>>>
>>>> Zack
>>>>
>>
> 

