Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E9DBCFB69
	for <lists+dri-devel@lfdr.de>; Sat, 11 Oct 2025 21:40:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEF7110E101;
	Sat, 11 Oct 2025 19:39:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mfpcPSdz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F39A10E0EF;
 Sat, 11 Oct 2025 19:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760211598; x=1791747598;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=wFl7RuXuWuDizP5OuBF7oN/PTJmlSw7PyuPpC/+1R6k=;
 b=mfpcPSdz2JkQj51mSoG2cG0A9EERFf4YBYqol+pyt/zLT6ptOdL+TgOA
 iT3rVS4SEe0hNya/Pyaw7Q8hp/YGthXcN90P4oUhgDV9he0LcwYb+Jx+q
 yaoOLgARSr0VY4WVDchjRwhAP2Bvt7WCAVOSYp+dOqzq6N8cWdwCDv/x8
 O+4gM0oG43EOliU5FOHDgB3u3jrN++3ciNaIGwKrMUukqD+RuqhO+nWvI
 sMWza5wW75ZdsE81GEo449woMx6FJmr1MyhOL8WtQN4R1U8tZIbbSM4CD
 ipNpnUJVs0yvzZ8Rnd5tL64KGa4DhSOlQSOnicIQZuxmvxUSsDUrTjPRO g==;
X-CSE-ConnectionGUID: OXwuf+hITwqAgwFRXCpIVQ==
X-CSE-MsgGUID: 2CAD4rr4TayxewKQ3ruSAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11579"; a="61607848"
X-IronPort-AV: E=Sophos;i="6.19,221,1754982000"; d="scan'208";a="61607848"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2025 12:39:58 -0700
X-CSE-ConnectionGUID: +YO6mGofSM6BJXMe+bfNPw==
X-CSE-MsgGUID: xd9o+6OrSauMCPg1vvYjzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,221,1754982000"; d="scan'208";a="181661448"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2025 12:39:57 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 11 Oct 2025 12:39:56 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sat, 11 Oct 2025 12:39:56 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.70) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 11 Oct 2025 12:39:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NyX0g//C8qAY3lqRYbWNNgDNurLh4xTQMJ0id3IHDF39/cN97G4rH0NpTwOXTuDNcoZzzovSAaynI6GBOpxLYYMqmNKnQPkw7Tf370EnZdYuJC2y87uFDh0SaDISAxZRKSMVi1c0Tmpeg05LIkStEdWd6FdB1IpAIfa9S8++2x6vCQO324y7LwHZ/YYpz5pWGVHDPnB1efOIEOlePONSGXLlXoMor9YlLisxrCYQ0SlVR5j8UB8NN3tEMcTu1T+Sl7OCYyDs5rJtlAM56VL8vJt8OK9DyFJgT22D6FZe3x5laClxb6Xk6oMLRJLB5UerUT50VkJbWhGhXFeE9y8bUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gZa+qDVBcDgX/0nWXtJnzN1IMvgDNcC2Ehty2jBLM1U=;
 b=OSLNVeHujPwsTw4sz/9+mrMd2VO6DO7miwobbobBYkBrjZ+twyU1FEF/lYGS0n8hVp6nTOyzEL/51ucRd7V+CDksGN3z0QiUShzpAjw6u/UYGH18A8uMlDOYurqPaHMtbwNLmBm61ds8K4PpZySjBhn6AdK+7ISEUJiOj2Ir/nxhsn4ti2A51POQfOrpqYEAEIUhQcfkMgMJk5mhCSDlxdnoIy1k4FGp4yj5J+egqtYLwPIze5gKGpEcIHckkLXIDtzohM+QSe9oFm0aqQvcoD1ZYQj6zh75yG7xW9o5FdvjgHmICg8zmkXO0khw3d9UEXjtophtETkeeUlo8t/awQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 DM3PPFF2E67D388.namprd11.prod.outlook.com (2603:10b6:f:fc00::f60)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Sat, 11 Oct
 2025 19:39:54 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9203.007; Sat, 11 Oct 2025
 19:39:54 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: Alex Williamson <alex.williamson@redhat.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, =?UTF-8?q?Thomas=20Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, Shameer Kolothum
 <shameerali.kolothum.thodi@huawei.com>, <intel-xe@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <kvm@vger.kernel.org>
CC: <dri-devel@lists.freedesktop.org>, Matthew Brost
 <matthew.brost@intel.com>, Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>, =?UTF-8?q?Micha=C5=82=20Winiarski?=
 <michal.winiarski@intel.com>
Subject: [PATCH 00/26] vfio/xe: Add driver variant for Xe VF migration
Date: Sat, 11 Oct 2025 21:38:21 +0200
Message-ID: <20251011193847.1836454-1-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.50.1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA0P291CA0016.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::28) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|DM3PPFF2E67D388:EE_
X-MS-Office365-Filtering-Correlation-Id: 09d0b8a7-9273-4f93-334c-08de08fdf377
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cTBlT00wcUd5Mmxhc2IvWEhseW50MmJxWUxISDZtTlVWTklvMlBiQUVOc2tV?=
 =?utf-8?B?dmVRTmRVQm8wUG5BR0k5Y1Izbks1R1l0YVJUaDJnRkxCbzJWcXpXZVk4TW9V?=
 =?utf-8?B?cE1qYkhTZS94YlVlV0pnbmE4bThYRU03WEtKRE5JUnZWeWphdTlxM3dRcldL?=
 =?utf-8?B?U2VKQ0Q0WXUvZDZTWSt5M2pmYlBlUFRCK1dHMDhZSnVCY3VzcVEyL3B3Q01p?=
 =?utf-8?B?ei9UbmV1TmlicmE1dmRwWmg4SDRQZW9adExWWC8zQVY5U0l6bjlFN25jR2lH?=
 =?utf-8?B?aGZpM0VjdVpRMDFxTFdKK0p5d0lWam9VWkcraExQYmhLNkYrQlh4bm9OQnUz?=
 =?utf-8?B?a2JtYkNaVHFiWjM3UmFscWF5Nkh6WDNJQ0YxQUNOL1EvTk15VXU2cFVKN2VS?=
 =?utf-8?B?Mmp4S05xbUxkN2o3b0ZqNFMwd0prRHJ1c3hRNnQ1dmpVcUN6ZlRhZVVQaFlX?=
 =?utf-8?B?L3lnd3JyeW42VlZ1WmU3TlZWWDlwdmxFdXYzZUFvK09SVlNHazMzZDkyN3R2?=
 =?utf-8?B?aTVjMDQ0MDFIcWtFeTB2WmdkVnRTY2JWMHl0SnhWYitsQ1pQVHJRZEVCcW5V?=
 =?utf-8?B?SUpPUi9hd3JaZWpEZXUzN0cvRE9iVEpuNjN3OUgwcFUvL0REbmNKVUY5S2tT?=
 =?utf-8?B?dmJ6SVV1VENZUnBGdDJDVlFSOGFyeGlBd01xVUVvdW9oQU1HZmUwaHFtT3d1?=
 =?utf-8?B?M2VXS2F1eEwzR25OVys2OFhPR0lBNVZXaGdRQTYxaVZkNm12UnVDSkhnakhP?=
 =?utf-8?B?VTJvc093NHVrMGVnK00rYklWVVZXeXNSM2hpTk5MQVhoZjUwTWhSbEdGL1pJ?=
 =?utf-8?B?T3Z6RUZqVmtiSDN1ZjArWDBoS095cGI3N3lRMUduZnJUUjhHdGlNZXF3cDFT?=
 =?utf-8?B?TDhSTGlGNU1uUGlIOENuR3RzcHV6eURJRWYvdXg3dG1WdnZnMWFvNEhkc0Jh?=
 =?utf-8?B?NkdWQjlYcmpsdTBIeUlQLzlnNi9PRmNVMkMvK3NLNHdTejBoUzJadU9FbmFC?=
 =?utf-8?B?S3BHQStIT2lHUGFDMkNhdTREL3ZLeHpKeXM0WVhNL3ptTS9lUW10STVwSmhU?=
 =?utf-8?B?VlVjK0U1VXd6ek02R1pLUHUxV1hJSllaMkhjYlBJbDlUWHlXMzIwaFRWU1JI?=
 =?utf-8?B?MG1NY1h6S0Y3Qi9mY0hjeU9sSXlWeGpITzFHNllFRTVnc1Fad2NrV1dnL0lC?=
 =?utf-8?B?dDkyM3JxZWRNeFpRc3BweXo3MkVOaHl5NFF4ejlBTU4yck5MeEVUT3c1R2Fk?=
 =?utf-8?B?UG40ck9uM2grNWJIL1RCWXQvd2NlZHI4YnQ5bkthNEx2S1hkc3pBRjUxZWZv?=
 =?utf-8?B?T2dDSXdRNUN3M3czRnNDdVlQKzlRSG4xSC9MSkcvaDh0eW9Xa1MxTTRVOFQ3?=
 =?utf-8?B?SUJhWGY0SVJ5UWZ0TXVPbXN3RENkUHJzUkRoUTlSSFpXckVobFFUV0Ura1pr?=
 =?utf-8?B?Q0grbHdkcTVqa2RBN245Zk50dHp4U05xRWpza2JFdmtkVlk0R1RrcHcveDhn?=
 =?utf-8?B?Z3J2WmhJMTZrN3NnSFVObE01QUxpbTdEV29QQjhaYlUyY3hqd1ZNUC9XVmdx?=
 =?utf-8?B?N1puZVViNVFycytGRXg3dFUxVkhOcysybHlpdjFqUHB5UDA5dVVnVFVSaWxT?=
 =?utf-8?B?Mi9vQ05wTFlFWXNEUjBMOG93b3RDNGg2SGp5d2tPeGZHaStmVFg3VC9DSmJF?=
 =?utf-8?B?SDAwYVIyV3ZDWFh3ekowRWgyTkhhT1dkaWlHaCs2NXh2S0MwTkQxcGljZmZX?=
 =?utf-8?B?ZDEwUExYYmg5UzNnNE02R1VZVWNFenM1TnplSGtteTNTT3E2N0dmSUh6RVIv?=
 =?utf-8?B?eUpVYlliNXBXT1hhVStVTXZRNy9heUdTTWZoRUFYN2RUemxQN00vaEg3SVhU?=
 =?utf-8?B?UThZVmJhN1E1RExjTEpVQUpNOWoxamJocm9uS1BEM1hvclZrQXo0T2Jackd4?=
 =?utf-8?B?NGNHVFdpMFVQNmdzdmNoOUo4UWo1NDJUZ09rZ2l3Z0hpZ21zNEpRdWNpUXFj?=
 =?utf-8?Q?2NxFP52mCN8HoTePaf8Vpsmx4L2baI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a3UzbDRlTHZCRXZHY2Q2VDByaDJsK0RaOXJhU0JwakRqSVF0V2NmUCtYRTIv?=
 =?utf-8?B?SlFHWWtxeDV5ZzhBem9MUzAxYlFjR3c4dFBzc2JvSUdHQ1FsMmFHM0RnL2ow?=
 =?utf-8?B?S2h6MjdMd0ZTOTkyNDc1SW4wZmo0SUczazBjdFVNa2Z5eGJrTXVRYTc3Mllj?=
 =?utf-8?B?N0JCVnJsa2lNVjVQWG1iZWZjWEx6QXpJOUNvWVMyNUlyaUl5ZTZ2a2RkTGpk?=
 =?utf-8?B?QmdHU0lRTmNrN3VoOENxNmpVR0pNUGl2RkFYNlZYWnd4aEpsakpBbFJPSzlJ?=
 =?utf-8?B?UjZ0bnhjVmlTWlhjZ3RIcjk5cXhBVVh1TWNUdmM3UnpNdm5QcWNxZ094alQw?=
 =?utf-8?B?V1hoMTRtUlUyOG11RHFwTWFwUDRRVWtCSCt5ZTliZzVxUUhKTW5ZYWI3cVQx?=
 =?utf-8?B?RDJkWjBrZndTb25wMmhaaHRaa05Xc1ZXb0RBTHVTR1RMM3haOG5xaXREcldu?=
 =?utf-8?B?STdZOE8xY3RiYXFNSGt2OE9BZXpYUktyV2ltSkNCcHlnd0lZS0g0N1FTY0NR?=
 =?utf-8?B?M0lUS0lPQ29Edzc3YzVXRC9OT0lDTU1Rb01zVnQ4TG9aNTVYMzFYVzdxWVNJ?=
 =?utf-8?B?TTJoT1lCdXRFc3paY3l1STFEQnZML1grZWh4eFNTaC9QSW9sTlpVYkN1cjAw?=
 =?utf-8?B?WlhuY3k1bFRZaE5rYlNBcUtNbDI0dW5iMUVzbkhDOEczT0dlUlVPM281b2ZI?=
 =?utf-8?B?ZGluek9ZbVBVZkE1RlpiajNjZVBRRUdUVGdFaE5QWmFnQ0FMSlB0V1ZITzEz?=
 =?utf-8?B?aUdWL2krUFNKRENZQ3BSL0ZPMDRYS0F4ekJkUUZTVHRtb0s1RXEwdjQ0WTZn?=
 =?utf-8?B?bDFtWUZLYkovSUpTN1BSdG5tKzNiZGxGdlNxa1YxUnowNUJCQVpIUFJkM0cr?=
 =?utf-8?B?SG8rVk4xczdGbzFIMTlNSFA3YjQ5YjVUblBDN3UxajNwSkZwUHpwenJCSEVp?=
 =?utf-8?B?c0hPZHJvNXhYd3lzWFZZd3VUN0dpZDFPbEdYM0xUY0w2NG41ZGVzRzZkWjBB?=
 =?utf-8?B?aVJtWklmUEczdkFXeERnOHMwQmxWNG1XbW5IQThCby9sblZXWmNYMVY2ZmVx?=
 =?utf-8?B?RnBHWlJJbVp0Z0dsYmh4N1FGZDZvM1N0Z04xL0MrK0VvRklMN2txSkxEYVlT?=
 =?utf-8?B?U0d6aFd5akFCZlpGdjd1ZGhabUovdHhmKzJQYXdvVjdWYU5QcERTbXBFdGdY?=
 =?utf-8?B?d2I4djJ2cHIwbm5RZ2gySUlMQldOcW41YU5XVkVvNFNyRTBqNlRCekpuZUZo?=
 =?utf-8?B?YVM4SEpNY0V3R3EyOVU1ajdLcGZYdEJYbXBxblVQMmd4SHJjRlNzeHlCWUZ0?=
 =?utf-8?B?d0pNU3VyT1JIVmU1aDdzdW5iRFFKSmhYVStSTXQvV0V1bG9JSFo1Qk8vbEdu?=
 =?utf-8?B?MDJBMXNDNXpTejFnVmQwL1krQ1IrZHo2V2FPRW5JOC9aWUlDckNOT3JtODN4?=
 =?utf-8?B?M3I3Q211WUpWTThGMnFnRzA5RlRKQ1Y4UHRrcjh5VGJUMUNpRGw0TS9RTENX?=
 =?utf-8?B?NVkvVUt5eC8rM3krSEZzOENIaXZEOEM5QVgxQU1vSGszNzJJVHRXWmk5cHM4?=
 =?utf-8?B?WmFQVWlMNlQ0aUpvdWxuQnNBSTBDUkl1Q1FPT2YzSHAvb3RMVzJhQ0g2VGQx?=
 =?utf-8?B?QTdHc2dBdkxMOWpVQ1F6dGxZRm1VNGsrOVJFYWFnQmQ3M1FpdzkyNUVRVS8y?=
 =?utf-8?B?eXpQQUJOZERuUEtNUnU2QlgyR3REc2x2VXJ4RG5qaHJnV0Frakp6eGg1OCtw?=
 =?utf-8?B?UWVybjExbjY0MVVrdG9ZU0dmaHAvdUc1bzVUOEtCZXVBM2I4amkxL3l4YWZU?=
 =?utf-8?B?R1lEdDdjYW1DeEhQYzlQSlhVR0l1NTVyYzd6NFZrd1NHQUxwZWdid3FXaXM4?=
 =?utf-8?B?d0grL0NmdEEycWVQNzg3Y29NL3dvdFZnZGV3bG5zODUyU1NWVDZhWklubURm?=
 =?utf-8?B?NFBkVkF6SFBwclFVTW9zWTN0c3VLK0IrVVd4STg0d2pSLzllV0gvL25pQTBO?=
 =?utf-8?B?N0luRStiZEhmNDR0TnJBdlpSWXhGWFlnSjlONWdvME90QzdKT29HckMzWFRH?=
 =?utf-8?B?SVR4eFV4UUpCam9ibk91NDRaMXM2cXp3cDVIN2hscFQ5bVE3RUxZN1Vsc2ZU?=
 =?utf-8?B?ZWJCanhGSktmc2lCZFFPbXB5QXErTHZmbkdXNHNkQWhJdW9KN0tTMWFzdCs2?=
 =?utf-8?B?c2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 09d0b8a7-9273-4f93-334c-08de08fdf377
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2025 19:39:54.0076 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3qt6Uox9nobxCSpS5Vg/4755nfci4Hrt8xaC1B+9BhuMf4wmjmTMZyupPRotYMeNJr3UvA0edb45D3ippK1Bkrr4Yghsls4BCzeABH0NCKA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFF2E67D388
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

Xe is a DRM driver supporting Intel GPUs and for SR-IOV capable
devices, it enables the creation of SR-IOV VFs.
This series adds xe-vfio-pci driver variant that interacts with Xe
driver to control VF device state and read/write migration data,
allowing it to extend regular vfio-pci functionality with VFIO migration
capability.
The driver doesn't expose PRE_COPY support, as currently supported
hardware lacks the capability to track dirty pages.

While Xe driver already had the capability to manage VF device state,
management of migration data was something that needed to be implemented
and constitutes the majority of the series.

The migration data is processed asynchronously by the Xe driver, and is
organized into multiple migration data packet types representing the
hardware interfaces of the device (GGTT / MMIO / GuC FW / VRAM).
Since the VRAM can potentially be larger than available system memory,
it is copied in multiple chunks. The metadata needed for migration
compatibility decisions is added as part of descriptor packet (currently
limited to PCI device ID / revision).
Xe driver abstracts away the internals of packet processing and takes
care of tracking the position within individual packets.
The API exported to VFIO is similar to API exported by VFIO to
userspace, a simple .read()/.write().

Note that some of the VF resources are not virtualized (e.g. GGTT - the
GFX device global virtual address space). This means that the VF driver
needs to be aware that migration has occured in order to properly
relocate (patching or reemiting data that contains references to GGTT
addresses) before resuming operation.
The code to handle that is already present in upstream Linux and in
production VF drivers for other OSes.

Lukasz Laguna (2):
  drm/xe/pf: Add helper to retrieve VF's LMEM object
  drm/xe/migrate: Add function for raw copy of VRAM and CCS

Michał Winiarski (24):
  drm/xe/pf: Remove GuC version check for migration support
  drm/xe: Move migration support to device-level struct
  drm/xe/pf: Add save/restore control state stubs and connect to debugfs
  drm/xe/pf: Extract migration mutex out of its struct
  drm/xe/pf: Add data structures and handlers for migration rings
  drm/xe/pf: Add helpers for migration data allocation / free
  drm/xe/pf: Add support for encap/decap of bitstream to/from packet
  drm/xe/pf: Add minimalistic migration descriptor
  drm/xe/pf: Expose VF migration data size over debugfs
  drm/xe: Add sa/guc_buf_cache sync interface
  drm/xe: Allow the caller to pass guc_buf_cache size
  drm/xe/pf: Increase PF GuC Buffer Cache size and use it for VF
    migration
  drm/xe/pf: Remove GuC migration data save/restore from GT debugfs
  drm/xe/pf: Don't save GuC VF migration data on pause
  drm/xe/pf: Switch VF migration GuC save/restore to struct migration
    data
  drm/xe/pf: Handle GuC migration data as part of PF control
  drm/xe/pf: Add helpers for VF GGTT migration data handling
  drm/xe/pf: Handle GGTT migration data as part of PF control
  drm/xe/pf: Add helpers for VF MMIO migration data handling
  drm/xe/pf: Handle MMIO migration data as part of PF control
  drm/xe/pf: Handle VRAM migration data as part of PF control
  drm/xe/pf: Add wait helper for VF FLR
  drm/xe/pf: Export helpers for VFIO
  vfio/xe: Add vendor-specific vfio_pci driver for Intel graphics

 MAINTAINERS                                   |   7 +
 drivers/gpu/drm/xe/Makefile                   |   4 +
 drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c   |   2 +-
 drivers/gpu/drm/xe/xe_ggtt.c                  |  92 ++
 drivers/gpu/drm/xe/xe_ggtt.h                  |   2 +
 drivers/gpu/drm/xe/xe_ggtt_types.h            |   2 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf.c           |  88 ++
 drivers/gpu/drm/xe/xe_gt_sriov_pf.h           |  19 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    |  94 ++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h    |   6 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c   | 436 ++++++++-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h   |   7 +
 .../gpu/drm/xe/xe_gt_sriov_pf_control_types.h |  23 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c   |  47 -
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c | 901 ++++++++++++++----
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h |  34 +-
 .../drm/xe/xe_gt_sriov_pf_migration_types.h   |  27 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h     |   6 +-
 drivers/gpu/drm/xe/xe_guc.c                   |   4 +-
 drivers/gpu/drm/xe/xe_guc_buf.c               |  15 +-
 drivers/gpu/drm/xe/xe_guc_buf.h               |   3 +-
 drivers/gpu/drm/xe/xe_migrate.c               | 214 ++++-
 drivers/gpu/drm/xe/xe_migrate.h               |   4 +
 drivers/gpu/drm/xe/xe_sa.c                    |  21 +
 drivers/gpu/drm/xe/xe_sa.h                    |   1 +
 drivers/gpu/drm/xe/xe_sriov_pf.c              |   6 +
 drivers/gpu/drm/xe/xe_sriov_pf_control.c      | 125 +++
 drivers/gpu/drm/xe/xe_sriov_pf_control.h      |   5 +
 drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c      | 117 +++
 drivers/gpu/drm/xe/xe_sriov_pf_migration.c    | 281 ++++++
 drivers/gpu/drm/xe/xe_sriov_pf_migration.h    |  48 +
 .../gpu/drm/xe/xe_sriov_pf_migration_data.c   | 566 +++++++++++
 .../gpu/drm/xe/xe_sriov_pf_migration_data.h   |  39 +
 .../gpu/drm/xe/xe_sriov_pf_migration_types.h  |  46 +
 drivers/gpu/drm/xe/xe_sriov_pf_types.h        |   8 +
 drivers/gpu/drm/xe/xe_sriov_vfio.c            | 252 +++++
 drivers/vfio/pci/Kconfig                      |   2 +
 drivers/vfio/pci/Makefile                     |   2 +
 drivers/vfio/pci/xe/Kconfig                   |  12 +
 drivers/vfio/pci/xe/Makefile                  |   3 +
 drivers/vfio/pci/xe/main.c                    | 470 +++++++++
 include/drm/intel/xe_sriov_vfio.h             |  28 +
 42 files changed, 3747 insertions(+), 322 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf_migration.c
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf_migration.h
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf_migration_data.c
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf_migration_data.h
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_vfio.c
 create mode 100644 drivers/vfio/pci/xe/Kconfig
 create mode 100644 drivers/vfio/pci/xe/Makefile
 create mode 100644 drivers/vfio/pci/xe/main.c
 create mode 100644 include/drm/intel/xe_sriov_vfio.h

-- 
2.50.1

