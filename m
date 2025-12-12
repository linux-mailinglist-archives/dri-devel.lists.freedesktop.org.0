Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13361CB8B37
	for <lists+dri-devel@lfdr.de>; Fri, 12 Dec 2025 12:21:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C84710E11C;
	Fri, 12 Dec 2025 11:21:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Le9ttHMu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FA5710E11C;
 Fri, 12 Dec 2025 11:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765538476; x=1797074476;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/ahVSgabrxjSUqFrdAjRLltO1jUXwFzw4iPt+/SYbug=;
 b=Le9ttHMuomoBLmblJBcOsdeH0tjUIcywfwiIUd3DlOpdByCVVZbTVVKa
 tW1w2kvXSLmfM/dszAIJNbr+sHg+43XLfSa902RT3OO7FERZTqLJ7nG7H
 G1PXBS1UEUGmMt8q07eartbZERpSuGHNZBixWT1t1BvY+ndLbpPpifL8q
 iQy8FstoTUBBHW9uk2ivMOOx+gw0AV5fJmwuMXAvLmLA61yLX99qQuXjt
 F10bG7ibt+sVczbvrffwlVKUCtX3v+Pw4Hd0doUXkch9xVA3FGeuH2OSr
 U+7HvYg7qtWImxXfeVe7rKRFztHeP7gNQnL6J3f55WdO4Tk8mJQU2cukW g==;
X-CSE-ConnectionGUID: Qi3oHmBtRiOtaevMCzvOhQ==
X-CSE-MsgGUID: cLp9SXZRSKuY/utu00syYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="67476007"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; d="scan'208";a="67476007"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 03:21:15 -0800
X-CSE-ConnectionGUID: M16zW6JIQiK1ATg7oVnYhQ==
X-CSE-MsgGUID: gO00tEd0TiCPpUobGk88qQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; d="scan'208";a="197056608"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 03:21:15 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 12 Dec 2025 03:21:13 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 12 Dec 2025 03:21:13 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.47) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 12 Dec 2025 03:21:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kJmkuD6PWoF7U8T4HI2EWsbflFtPGd32pBc0AqPIiNtER8o1T6zz8bjuDgnOjQE+vA7ZiAN6SEFzsIAaGoM+zrGBJj6tkcIIf1IlkCJBZ1/58vq2/7pF/WYemOBGZ19TbH9FeMPZyAMG0EigMzgVU9zE8ZAR+lwM6Qdg5/Hmo/fWvIixPpoCBgAXSK9kzBFuAIxU7mZjGQl2elc24ts0Ht+9XgF8l5C/ed+y4GJvZtOdeAO5UEkUaY8cb26JzT/dy+17HkO644g3F/UKLB7bzlgfLIsui8QVxHugK9z1qG9psU62cphFxNq9WBt7W39ArNi6AQRgyTdClhhfDe5aKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+I7Sg+ZEDYGXeC/FRjqG9Jp1xw9xQLZO7y6eers3Zg0=;
 b=tkjFrOPnpxeal2RSL50KrGOd5ZYfxjxbzUJ+I1V4cnZLO9xzEsELAbSXHp31m5Zy6oi9i+GtV0LjgrMg5BL4OetLqRLooQ2spBRBIrZc/NQbnUIZrXkR0c7F80QBuU72+vGX/vVt4dSDUUdoXugOst5H/dWSvK1jA2cPrPeooK97wvEOzVhUxfrdDAHx390NTVrO5DT2YN3pLG+A90Y5c6TUXECp9hi5S8zCvzowcdPP5SR0hJbpXU/6OINquPn0I9ul+BkxMfT4jwzh8Df6ZCv3mt7l8mGIwVWOjMrYon5kbud4hP6lUjGUy2eNOOfQWICXnoQ0J5Cr2vaPVNGQyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by SA0PR11MB4639.namprd11.prod.outlook.com
 (2603:10b6:806:70::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.11; Fri, 12 Dec
 2025 11:21:11 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::803d:39cb:d276:4ee5]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::803d:39cb:d276:4ee5%8]) with mapi id 15.20.9412.005; Fri, 12 Dec 2025
 11:21:10 +0000
Message-ID: <b70bec9c-da7b-4bff-9a41-b7548ea92518@intel.com>
Date: Fri, 12 Dec 2025 16:51:01 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 19/22] drm/gpusvm: Introduce a function to scan the
 current migration state
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <dri-devel@lists.freedesktop.org>, <apopple@nvidia.com>,
 <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>,
 <felix.kuehling@amd.com>, Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 <dakr@kernel.org>, "Mrozek, Michal" <michal.mrozek@intel.com>, "Joonas
 Lahtinen" <joonas.lahtinen@linux.intel.com>
References: <20251211165909.219710-1-thomas.hellstrom@linux.intel.com>
 <20251211165909.219710-20-thomas.hellstrom@linux.intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20251211165909.219710-20-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0089.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a8::14) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|SA0PR11MB4639:EE_
X-MS-Office365-Filtering-Correlation-Id: 983414bb-9be7-45fd-14d4-08de39708d51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aUM5ZzBnN29RS2lKUDVleldvTHVKL1I0UnR5TW9lSjRQc1lQc2h2ZGp5T2V2?=
 =?utf-8?B?Z3k5cVUxMGFseTZKVFdWbnl5NkZSc0JHU0JpV3dWRlgvck5vY3BMTlNIZTdw?=
 =?utf-8?B?eGNVM2lCZ2pjRERESUprdFJYRVRrRy9OaUEwODlFU2hNQ3NXZ0dzQWt1TWdw?=
 =?utf-8?B?N0pNSncxQWl2UDdOdlpON09zVHd0b3AvWmlZMytqUVc0UTBpbmMvT0QwQUVJ?=
 =?utf-8?B?M3IyYW9VUGQvOTR6Y1J1UUgzZnhFSWwxZzhlZnNKeUtJaGdnd2tCT3ZIUHY0?=
 =?utf-8?B?bnJpZzVONzUzdXpxQkJacVZkV215bEZNc2VodmQrQkNrcG01cWlYdVpucnVY?=
 =?utf-8?B?RHhXZWF0NEd1OWlqRHdkOFY2NE04ZjBLYm5tRmx2ZDlmVXpKMTVpSEFVRFFL?=
 =?utf-8?B?c25nc3BHazVCSnlIajJiK1A2MDJhTGVPTkl5eC9lM1FhaWo2U3MvbWNSWmwr?=
 =?utf-8?B?S3d4L0V3K0MrRmVDY1NHZ3IwaGlBS3NkVVNUaFNpb3k2SDdqZnFEdExqdXZL?=
 =?utf-8?B?dFdUUWtnblEwdC95clpNZ2pWSXU5bk1mTlhBYjNEZUlmd2M4c3IzWW1DVWVS?=
 =?utf-8?B?VEs3azE0T2VkV01JejZHL2UxOWV4SXdTWlFKUGdIakJTbnJWRlYxODFFSmg0?=
 =?utf-8?B?Y2F6eStKajQwMGNmTXpTQ3o5VlZYYldqdm5ud2xDY2NucmhuWXZEalFMQTBZ?=
 =?utf-8?B?Zmg2VXQ2bHJueUQxL0hoK0ZMU2FyWnIxWnpZUzY5UkNmMGRCS3ZMclErck9P?=
 =?utf-8?B?bU5xMjFBL0dZM2lGT2p1K2pCaittZXhHTXdsY2cxOUVLYm01MFc4MVZlSExV?=
 =?utf-8?B?TTJJSkw3RGNsVnFDQm9ibEc4Q2xaUkdxOUxGTVZnOFJldVhMY21WWFBjbGZH?=
 =?utf-8?B?MldJN1pUajJpSGppc0JpamNnR2tac1lrckpCd29UWEpQdHRoYVRnTXo1VTQx?=
 =?utf-8?B?WW44d1l6TWdpWEp6T1pXOHNncUliOEZwL3NCU09tQzJ0ZThYWWxYVkxEeUh4?=
 =?utf-8?B?M29pdFE2cWgrMUxsRXFlWlVOaktUcUFYcWhCdG1VaVlZK050NlRVRjBEQzhv?=
 =?utf-8?B?M0xUZjAwYVBXV2d2NmVBdTdNVVVnMUwxdUxjRHo0Z3l0a3VlR0sxVEJYV2pt?=
 =?utf-8?B?bnl5WnpJTm5NNzN4aFA5dE9ZMzRid3kwMGEwRFZMS1RuTkE2VTdnY0gxdFo2?=
 =?utf-8?B?eW8rSnI5UWY3R1JXY0xta25oNmFIK1RSMzFBOHR1cjEwQjFTRHNOVWNHaENq?=
 =?utf-8?B?MjFsWHhPTncrOGpiRk9lRWhlKzhVQkJ6d1RGamtFYUF2clI5cG81Mmh6aGhr?=
 =?utf-8?B?NzhtUEhuYXpyRFROTTR1cS80UUwwTklGVWJCd1FiUklTMFJWN0ljZUVuTnFh?=
 =?utf-8?B?M1o1NzhDQXlSTmhWRHBhR05lZ0FON0lGMy9tQzYrdmRjbWJlOWdrWVh5dGJu?=
 =?utf-8?B?elk0VkU2ckpPYThROUN6amNZODdmNDdQTFFUanpHVnpkZWRDeG54Mi9MWElz?=
 =?utf-8?B?KzNZdzFRMDZpWHJrb1RqeGF0ZXg5bUJlNzQxSGl2aC9QT2ZRV05pam9CaDdi?=
 =?utf-8?B?aDhMOVUyTGpMS21mU2VQSS92SGRLZlhjOVBtMEZXaFVGWXhrL21HcDRCMWps?=
 =?utf-8?B?UUxDTTZkWlM5dW1oT3pRZmQ1SFRYamVMSjREZ3B0QkNZWG1NSE9ZZWo3T2Vj?=
 =?utf-8?B?MXg3V090b2U4T3kzQlJkcVNOYmw1dU9ZT3hLWDRqb05xUVhtZTJRME15alJG?=
 =?utf-8?B?Y2RHYUswcTQrZDNDSzl1aGNqRzBWeXhUdEFGbDF4Y0hMSC85WkV6TnJsNFRq?=
 =?utf-8?B?YnlIRTNYbWthMTVyZVg0OG1JQWdROU54aHhzbzl6SnkzMDBOZ2IybVZmTVRK?=
 =?utf-8?B?cGVsTGZ0V0tUQ0tlWFoxSDA3eCtBNFhIWG5JbUx1SS9PS1FZNVQ5Q3NEWDFu?=
 =?utf-8?Q?UjFW2W/FjVBBGnWSL30HU0iM3ibc5z8c?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aFc5MXVBYW45UlhpZTZsUHNDNkdIMkV3b2E2YmFudHY3YUxrdE5HR0QydmJ0?=
 =?utf-8?B?SkU5YXRMcS9UcEs5aDFLaUVZSW41ZFY5TExVb3VHRVdMbERCdnExN3pCdlhy?=
 =?utf-8?B?bDFKL1dZYXpYNjY4VTVRM1dsVmxMc0ZxcitGbjVjbXdJSzdXUWFKcEZmNnM0?=
 =?utf-8?B?T2N1M0JyckVjNWhlM3NuNlIwMUE2UFFZYUExVVNYZ2tYQkp4TVdmdDMrL0FX?=
 =?utf-8?B?U2ZCVDU4ejJCOUs2WEpPOUNqcnordDQ2Z0piYWtIbTJpNXQ1L1lOUStoOW1O?=
 =?utf-8?B?TXJLdm1Ub00zWkJITmtxaGpCZXdxbWJ5STIyYmpINEtCWFVUV1QraGVWeXhK?=
 =?utf-8?B?RkN0TlZTcGczaUlXOTZ6aGo0VStENlQ3V0NsWWFQQWJUWkhRWFQrR1hsU0dR?=
 =?utf-8?B?K05XeHQzaEtMYzY2VDR6ejRaNzN4VHFRMU9VVFZLcld3dUNsZkh1U0xMeU5K?=
 =?utf-8?B?R0xjQm54QW0zY29PejVEVnM4Ty9PdDR4Z2tBOFRvbTJlVERZWFJQVWs4ZUxk?=
 =?utf-8?B?czlVWFg0MXp0a1R2ZGdFejdhbGlJMXJLTUdhQ2ZRWEpvWW5Ceit2MjJkaTJl?=
 =?utf-8?B?cHRTUno3THVQR3JtV0Jsd0pyc3hoYUpZazZocUpWWGNKbmJTSlFta2lCbFVt?=
 =?utf-8?B?RjRjMWlyaTd1UElub3pRZFhSSHVBdDJQaVVGdmNTQTJnL0hKWnB6Y21PZngz?=
 =?utf-8?B?RXVja2pmSjZTTm9GMkZMZGhBSm5ISm5LNTI0Vmlma1FBeHNrUnRpQ01Pc2x4?=
 =?utf-8?B?aTZRaXdrR3J2N01TWDJZOStpTVJFblUyMXJwY0h1UC9jcFhCelFEdkdCNXVL?=
 =?utf-8?B?alRWWjRuU0U2VjRCNU9YblY3RlFwRnFaVGluTXVyZWZFYktlSWNVUEVOY3Jv?=
 =?utf-8?B?ZGZqRHd4N3FCVWg3Q2ZMdXBtUkpMQWdTT0Q4UVhzUTFTbC9hNm94Ymdib2Vr?=
 =?utf-8?B?MzVTaURYanpBOE80bEVpSFZrTEN2cExFTlZ3YlZWaU4vU3FzODR2QjN3TERi?=
 =?utf-8?B?VGxXK2szNWZZemF3c0ZCS1lkU2Z5ekJMbzdGMlZjMjhpZWZuamZ2OVh6a1BG?=
 =?utf-8?B?RXFmenRsMXpIVVZnc3gvU3VkcnZRZWk5WGFyVXlFMFZZNlM2N2ZhNFR3ZVZo?=
 =?utf-8?B?bEZuaHlDK2VBaTZQTWFnc09xZW9lZ1A1bnRGMTFDY1gxTnZMQlUyd1BmK3Uz?=
 =?utf-8?B?dWJ5cGI1VDhJaGdSWkxRM2hMbFRDWVlud0I2VTRqaXNjRWZKUVFuOWQ5NkU3?=
 =?utf-8?B?UkNKT01oYUFKY3JLVVJpWm5TcmI0dHB6U2dwUHJ2aVZQUDM2MFlzR2lYZnY4?=
 =?utf-8?B?MGh1VFlpeUd6amdNWS9SNU1pSXRBYmNNcEVrSXBBcVZTNmJIOS85bUM0WFNO?=
 =?utf-8?B?dVRVUG1HRFo2dUlWaTcwSDRNb2V4NWZFeFNpbnBndXkxSDRqc3V0MTFVdWd3?=
 =?utf-8?B?cWNwaThUdDdOdkh1SmtiK08xS3RGNGtOdTVuTlJwOFdoSVQwWmpiWkV2Z3hG?=
 =?utf-8?B?U1J3VDJpTXZMZU1OLzRHYmYwQ0tjWVBvb2dvQm9DcGxIL3FUTmFtaldGTUJ4?=
 =?utf-8?B?cVhoTnE3Ui9xQ0dnclJ5cXEyczVueVJ1QWE0SE1qckgyNEN4Y0ZMcGFCVEpN?=
 =?utf-8?B?eWZFRzFnNk94V0p0a2ZvWElMLzhNeDg3aUZ0VDF1YjJQUUlGVjg1SU9wWU9F?=
 =?utf-8?B?dEFsY2dsdkl0VlF2NkFTVlplNWtFbVBOWDNSdXJ4Q0xiVktjMkJpaTBud1FH?=
 =?utf-8?B?bm5MV0ZWSTMxT0wvbHBkK05uMDdyMmx5Sk4xMzc2eXhxdTdaaDAwSnY5bjd6?=
 =?utf-8?B?UklycmRjY1hHUjYzSTlCWi84ZnBMTWxydFl6dnVmT1Njak13VG93UndrbCts?=
 =?utf-8?B?TVg5NVhiZGg4NGhRL1JVSnNTY3NILzc3bGttOHNreFpHeGsvZTJGdlJ1bFRQ?=
 =?utf-8?B?WTFuSFRRcWF3cW5nZFE2MGFOc2NDNytKVmJnaEFMMTZOYjdBNU1LQTl5L2NP?=
 =?utf-8?B?WnU1ZTdjRTlqRjFsa3dVUnlIVTdySVZSRW9sdlRPbmRtM2VjNHhmSEhEa2JU?=
 =?utf-8?B?Wnhob3RzbFpUTGNXSE5BSXdOaldjc2JRclY3S01ZaXBPY2VEWHVMRW9GNTM2?=
 =?utf-8?B?U1IxN0tDNHZTbzBLWHZ1SWlFazhZejdDQjVRZGNNY3dLTG9xeHVOdTJlMGNG?=
 =?utf-8?B?Z2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 983414bb-9be7-45fd-14d4-08de39708d51
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 11:21:10.7285 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 954QUJkx192oEcsGF7UHtHjyFUhYE5b6C616qk77LeEHYkWmHu7puog2T25Meg7bJDyE+I04LssKKLIP9WwYyCMKIJTKFQJs2XAxcWtYC4A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4639
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



On 11-12-2025 22:29, Thomas Hellström wrote:
> With multi-device we are much more likely to have multiple
> drm-gpusvm ranges pointing to the same struct mm range.
> 
> To avoid calling into drm_pagemap_populate_mm(), which is always
> very costly, introduce a much less costly drm_gpusvm function,
> drm_gpusvm_scan_mm() to scan the current migration state.
> The device fault-handler and prefetcher can use this function to
> determine whether migration is really necessary.
> 
> There are a couple of performance improvements that can be done
> for this function if it turns out to be too costly. Those are
> documented in the code.
> 
> v3:
> - New patch.
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>   drivers/gpu/drm/drm_gpusvm.c | 121 +++++++++++++++++++++++++++++++++++
>   include/drm/drm_gpusvm.h     |  29 +++++++++
>   2 files changed, 150 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
> index 4c7474a331bc..aa9a0b60e727 100644
> --- a/drivers/gpu/drm/drm_gpusvm.c
> +++ b/drivers/gpu/drm/drm_gpusvm.c
> @@ -743,6 +743,127 @@ static bool drm_gpusvm_check_pages(struct drm_gpusvm *gpusvm,
>   	return err ? false : true;
>   }
>   
> +/**
> + * drm_gpusvm_scan_mm() - Check the migration state of a drm_gpusvm_range
> + * @range: Pointer to the struct drm_gpusvm_range to check.
> + * @dev_private_owner: The struct dev_private_owner to use to determine
> + * compatible device-private pages.
> + * @pagemap: The struct dev_pagemap pointer to use for pagemap-specific
> + * checks.
> + *
> + * Scan the CPU address space corresponding to @range and return the
> + * current migration state. Note that the result may be invalid as
> + * soon as the function returns. It's an advisory check.
> + *
> + * TODO: Bail early and call hmm_range_fault() for subranges.
> + *
> + * Return: See &enum drm_gpusvm_scan_result.
> + */
> +enum drm_gpusvm_scan_result drm_gpusvm_scan_mm(struct drm_gpusvm_range *range,
> +					       void *dev_private_owner,
> +					       const struct dev_pagemap *pagemap)
> +{
> +	struct mmu_interval_notifier *notifier = &range->notifier->notifier;
> +	unsigned long start = drm_gpusvm_range_start(range);
> +	unsigned long end = drm_gpusvm_range_end(range);
> +	struct hmm_range hmm_range = {
> +		.default_flags = 0,
> +		.notifier = notifier,
> +		.start = start,
> +		.end = end,
> +		.dev_private_owner = dev_private_owner,
> +	};
> +	unsigned long timeout =
> +		jiffies + msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
> +	enum drm_gpusvm_scan_result state = DRM_GPUSVM_SCAN_UNPOPULATED, new_state;
> +	unsigned long *pfns;
> +	unsigned long npages = npages_in_range(start, end);
> +	const struct dev_pagemap *other = NULL;
> +	int err, i;
> +
> +	pfns = kvmalloc_array(npages, sizeof(*pfns), GFP_KERNEL);
> +	if (!pfns)
> +		return DRM_GPUSVM_SCAN_UNPOPULATED;
> +
> +	hmm_range.hmm_pfns = pfns;
> +
> +retry:
> +	hmm_range.notifier_seq = mmu_interval_read_begin(notifier);
> +	mmap_read_lock(range->gpusvm->mm);
> +
> +	while (true) {
> +		err = hmm_range_fault(&hmm_range);
> +		if (err == -EBUSY) {
> +			if (time_after(jiffies, timeout))
> +				break;
> +
> +			hmm_range.notifier_seq =
> +				mmu_interval_read_begin(notifier);
> +			continue;
> +		}
> +		break;
> +	}
> +	mmap_read_unlock(range->gpusvm->mm);
> +	if (err)
> +		goto err_free;
> +
> +	drm_gpusvm_notifier_lock(range->gpusvm);
> +	if (mmu_interval_read_retry(notifier, hmm_range.notifier_seq)) {
> +		drm_gpusvm_notifier_unlock(range->gpusvm);
> +		goto retry;
> +	}
> +
> +	for (i = 0; i < npages;) {
> +		struct page *page;
> +		const struct dev_pagemap *cur = NULL;
> +
> +		if (!(pfns[i] & HMM_PFN_VALID)) {
> +			state = DRM_GPUSVM_SCAN_UNPOPULATED;
> +			goto err_free;
> +		}
> +
> +		page = hmm_pfn_to_page(pfns[i]);
> +		if (is_device_private_page(page) ||
> +		    is_device_coherent_page(page))
> +			cur = page_pgmap(page);
> +
> +		if (cur == pagemap) {
> +			new_state = DRM_GPUSVM_SCAN_EQUAL;
> +		} else if (cur && (cur == other || !other)) {
> +			new_state = DRM_GPUSVM_SCAN_OTHER;
> +			other = cur;
> +		} else if (cur) {
> +			new_state = DRM_GPUSVM_SCAN_MIXED_DEVICE;
> +		} else {
> +			new_state = DRM_GPUSVM_SCAN_SYSTEM;
> +		}
> +
> +		/*
> +		 * TODO: Could use an array for state
> +		 * transitions, and caller might want it
> +		 * to bail early for some results.
> +		 */
> +		if (state == DRM_GPUSVM_SCAN_UNPOPULATED) {
> +			state = new_state;
> +		} else if (state != new_state) {
> +			if (new_state == DRM_GPUSVM_SCAN_SYSTEM ||
> +			    state == DRM_GPUSVM_SCAN_SYSTEM)
> +				state = DRM_GPUSVM_SCAN_MIXED;
> +			else if (state != DRM_GPUSVM_SCAN_MIXED)
> +				state = DRM_GPUSVM_SCAN_MIXED_DEVICE;
> +		}
> +
> +		i += 1ul << drm_gpusvm_hmm_pfn_to_order(pfns[i], i, npages);
> +	}
> +
> +err_free:
> +	drm_gpusvm_notifier_unlock(range->gpusvm);
> +
> +	kvfree(pfns);
> +	return state;
> +}
> +EXPORT_SYMBOL(drm_gpusvm_scan_mm);
> +
>   /**
>    * drm_gpusvm_range_chunk_size() - Determine chunk size for GPU SVM range
>    * @gpusvm: Pointer to the GPU SVM structure
> diff --git a/include/drm/drm_gpusvm.h b/include/drm/drm_gpusvm.h
> index 632e100e6efb..2578ac92a8d4 100644
> --- a/include/drm/drm_gpusvm.h
> +++ b/include/drm/drm_gpusvm.h
> @@ -328,6 +328,35 @@ void drm_gpusvm_free_pages(struct drm_gpusvm *gpusvm,
>   			   struct drm_gpusvm_pages *svm_pages,
>   			   unsigned long npages);
>   
> +/**
> + * enum drm_gpusvm_scan_result - Scan result from the drm_gpusvm_scan_mm() function.
> + * @DRM_GPUSVM_SCAN_UNPOPULATED: At least one page was not present or inaccessible.
> + * @DRM_GPUSVM_SCAN_EQUAL: All pages belong to the struct dev_pagemap indicated as
> + * the @pagemap argument to the drm_gpusvm_scan_mm() function.
> + * @DRM_GPUSVM_SCAN_OTHER: All pages belong to exactly one dev_pagemap, which is
> + * *NOT* the @pagemap argument to the drm_gpusvm_scan_mm(). All pages belong to
> + * the same device private owner.
> + * @DRM_GPUSVM_SCAN_SYSTEM: All pages are present and system pages.
> + * @DRM_GPUSVM_SCAN_MIXED_DEVICE: All pages are device pages and belong to at least
> + * two different struct dev_pagemaps. All pages belong to the same device private
> + * owner.
> + * @DRM_GPUSVM_SCAN_MIXED: Pages are present and are a mix of system pages
> + * and device-private pages. All device-private pages belong to the same device
> + * private owner.
> + */
> +enum drm_gpusvm_scan_result {
> +	DRM_GPUSVM_SCAN_UNPOPULATED,
> +	DRM_GPUSVM_SCAN_EQUAL,
> +	DRM_GPUSVM_SCAN_OTHER,
> +	DRM_GPUSVM_SCAN_SYSTEM,
> +	DRM_GPUSVM_SCAN_MIXED_DEVICE,
> +	DRM_GPUSVM_SCAN_MIXED,
> +};
> +

Do we really need these enums, wont simply returning whether all pages 
in range has same pgmap be sufficient ? Return true or false and use to 
decide range needs migration or not.

If we are expecting some further uses cases for these enums, then this 
looks OK though.

> +enum drm_gpusvm_scan_result drm_gpusvm_scan_mm(struct drm_gpusvm_range *range,
> +					       void *dev_private_owner,
> +					       const struct dev_pagemap *pagemap);
> +
>   #ifdef CONFIG_LOCKDEP
>   /**
>    * drm_gpusvm_driver_set_lock() - Set the lock protecting accesses to GPU SVM

