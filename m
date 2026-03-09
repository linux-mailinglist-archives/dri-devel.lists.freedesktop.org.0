Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SPMUAJBGrmluBgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 05:03:28 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5DA62339B1
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 05:03:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D2A710E0DE;
	Mon,  9 Mar 2026 04:03:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SVMBlB9K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A39FA10E0DB;
 Mon,  9 Mar 2026 04:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773029002; x=1804565002;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3F5MPxO1K1hMy7FJsO74byPf0gXCdHLquGlgp9TGvy4=;
 b=SVMBlB9Kk4fpn8iwK0bVWxS5ilhTglzfTWJsiXHLooqcqW5mKovNjX9I
 fNPOJfBEQd7p/H0SSxextSM8gMof5T7Pc2S++Po/gxh6mljzZe5u5ZeUD
 Aky5cjK0U13Zc3dPXLDBB7wh5JbOz2G06JZOM/g4odKWYvDjtC/rsbPqL
 Iap/4UYz6BvUUUKPr95F6iVWfwmJuV1cLFbDzNidF83vWCSGP83aKFLey
 niBwL4dX4STk9ymBMCkzrWsyczT5eQE0EFJdOV/7kX7Y0oTOYDty9XLD6
 yDax7/xg9hi4hu5/4islLsxwTmHS2LK1p2/qcp+REmmOrb0E1tMt96kIC Q==;
X-CSE-ConnectionGUID: gR9ewpr4Q6Gvd9SEowXICQ==
X-CSE-MsgGUID: Br1+2nzjTI6vUoRT5y3d3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="73950135"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="73950135"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2026 21:03:21 -0700
X-CSE-ConnectionGUID: GrOtkwgrS++Nq5k+spwR0w==
X-CSE-MsgGUID: ePr79mtyR8ChZxKoQTGQwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="224083412"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2026 21:03:21 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 8 Mar 2026 21:03:20 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sun, 8 Mar 2026 21:03:20 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.11) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 8 Mar 2026 21:03:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QiGwurjfPhLGXwPjBJzogd9hGTjsuHHrEK6bZE3foDUMFk+T8uJjyITDZUviH4h7s7np9IQ3dYr65PX0xx3G20H5pZzq1SsTmboqJ/I8MLNwuwAuWZ/4X5PE/xehtYkqc1ER6QQOvJCgxP47hvCht14XXlbI1wPaaZG/CxCLg/XZkdP6XdharDzN5lHb0cssO8ZT2MUL0bAAUC2f5JhYU30HHgBGpHqhFXtvSXr9l0Q7SMh75FTksT5Xr91ruOtgjCCMk4R2+tuy99Z/bgH6p6PCpJCZSXnfM8Y3ihPlaYHWgiO/5e4WYadzUT4Rs3jLPmbXeHb67J5FRa/6tXopwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ye6TsELjHagfNDKJoaU9gzta6ePg8y523byEpPqK4HE=;
 b=kjqLIYs0YjbenBEKFgjrhy2CLTBERrhVwtkb1dQVoAugSBTruO1YNlU9okxwcBcWI9mLejjQwKUW6An+TPym1okkBFvjKbEUTJaSEXWfr0HXyJ6rNB8KS4TprO+Zm7oZiA36FKfEb5gIBUbVODD8RVE7+3pNNpVvoOZmVzj9RJq4Z+v6vj6m7LDjALWs0sA4tzq409BTzX9krbwK86n9MnsOcCJrWSgDGUxYUNeyRaunUIpExZ5OXerpwBt5lKmL2wC/f5finU+d93kKpUHBoLMpWpzk1sLvGvbpuqVoapYmYui6MX+s7wPL4kxXkaIiz8MhRWSIN5655VxA61WzNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8208.namprd11.prod.outlook.com (2603:10b6:8:165::18)
 by IA1PR11MB8151.namprd11.prod.outlook.com (2603:10b6:208:44d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.10; Mon, 9 Mar
 2026 04:03:18 +0000
Received: from DS0PR11MB8208.namprd11.prod.outlook.com
 ([fe80::ecb0:7475:84de:ca9c]) by DS0PR11MB8208.namprd11.prod.outlook.com
 ([fe80::ecb0:7475:84de:ca9c%5]) with mapi id 15.20.9700.010; Mon, 9 Mar 2026
 04:03:18 +0000
Message-ID: <af7c8131-ca80-45c6-8690-1fca823c6059@intel.com>
Date: Mon, 9 Mar 2026 09:33:11 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpu/tests/gpu_buddy: Add gpu_test_buddy_alloc_range for
 exact-range allocation
To: Matthew Auld <matthew.auld@intel.com>, <dri-devel@lists.freedesktop.org>
CC: <intel-xe@lists.freedesktop.org>, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, Arunpravin Paneer Selvam
 <Arunpravin.PaneerSelvam@amd.com>
References: <20260302150947.47535-2-sanjay.kumar.yadav@intel.com>
 <9f13e0d0-4a4f-43ac-a2f2-72806b91c92a@intel.com>
Content-Language: en-US
From: "Yadav, Sanjay Kumar" <sanjay.kumar.yadav@intel.com>
In-Reply-To: <9f13e0d0-4a4f-43ac-a2f2-72806b91c92a@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0057.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::15) To DS0PR11MB8208.namprd11.prod.outlook.com
 (2603:10b6:8:165::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8208:EE_|IA1PR11MB8151:EE_
X-MS-Office365-Filtering-Correlation-Id: 836d5650-9066-4e86-207f-08de7d90cb8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: USmqZavfuZvrbyP0ezhwvMHcYvV023hqbXyGavgNCmJ4y2OX21YO5INafNCp5B4x3ym6NYvqGaLpFknLGgGd/Ujo7a4vphK0CCqRa7CCcPPXS6IiEqDFraQNA7n7rbZHdKjIsRjNoCF9RFhjo0oAqA9gFOudeeXyVtfqspkmfxR73hpkbhVtkbvFgmA1hUlMimhZCXO8TcepvHlhYxXD8y/GG4P683n+Gxe1BaEkwsZJ78+LJKfwkR5yZWA2yXdPJme02PigtyX71LlsnSs3neN/ABTdkBv6xdVLG+JevHa8yGuMEjN/Ri/h8S/JYzNEMweURifYv34IiZpjGu6IsZVWNtnSwZyD3VRVR9rd/Yg0BW4vN6P6gCG/Us4mQrsdbHoTx08WBGgC+R1dXOMNtu1Nk4c9cpp9+EOD7risAfgHA1JLXWLolvJgl70AedR4hQqA1TXdYjjaFPq7bHXjXRVUWrTmhYioIVqflOeL0ab5blUW66rimk8OxSE9hnnJvKLZHWPyoJV7sHDl2Lv4HGwijTu3c1V5sPwZsdfBIzpeqfxdRQUmdB25gp5VNU+aTKG9H4CDYxA3sc77otJQH9bNFm7xEDZBqrz3BdwLPfTDGWlL+HvXlKSMeBfIua/yPKKQk7WnfJvfg/CYwmM9yTpjEidAgUp9EM/TXwSq8ZQHXiJU5HqXqPPlvOYF6B22rukpIHu95RBY6pfNQD0bdJ4d1vBbLtfhflZh7xDBhPc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8208.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y1FyNUhPRENrbTlBcFJ4Y2RsdWNxdFVtZURIeE5sYkRqQjVtTDU1TXRBbkMz?=
 =?utf-8?B?RGpNQ0JtKytES3dKOXNIQzRlbFRiYzUydDlaYVFKWkZlVnVXWXcrMzFtOWRG?=
 =?utf-8?B?V05jZDBDVGhJeHhGcVgvS29FU2d0UTNIUkpPTzNJbWxUcXVCSEM3aURacDdm?=
 =?utf-8?B?THg5WWUrSVhzMWZtMElldjlSTWxMNGJaREUxcXhkbWJmWHZVa0JnOG5SRjdQ?=
 =?utf-8?B?bS9yQlgxZ0NnMGV1K3h6NTZ2TmtYcUxMdXE5c1FBQTJQbjZZUGNjNHVqdE9E?=
 =?utf-8?B?YUFHbUNWaThJWEZ1TW1jQXYyUFAyck02VThxdTNNOUhIUHNHTThnZTV2d29U?=
 =?utf-8?B?MnhmNHRUNnBrT2tJM3VyZ0dJdmNCZEE0N2VLbUpSb05vL1crWHVmcStJOG01?=
 =?utf-8?B?U3lKZ2FTTzJRcHdweDJCTERQRlU1UkVyL1d6dk5qSFZZa29md3FqejdESjNE?=
 =?utf-8?B?OTVCbTI5VVFSZlFMWTJiS1JuTzBVZ2d1Mk5NcmFZZ2F0OEtTNGFxRXRxRWVD?=
 =?utf-8?B?S3pXUDhNTXplNzAyRGpzdmZtVzhkM1RobURBdzU4Zm05QTVTanVHY0h4cW50?=
 =?utf-8?B?T2dqV25oWk5ZUlRuVlVRL2wxVlZnWWNOUERlbitZOHAweHRiZVFQckhpa2ZM?=
 =?utf-8?B?ZVpSMzFiUXAyVEJMd2Z0S0RmTGgvZXpBcjM5VzVpT2FIVDJwV2FrcDk4RmJm?=
 =?utf-8?B?d1crd2tqSm0xTW9lcncvbHNvMGdDeDZiVDFHQ2JtYTVNdzFGUXpnWVFDenNT?=
 =?utf-8?B?RERURmNaK1o5M096dXpqNmJhQi93aFBLM1ltRlZwYXV6ZEdmMWxBL3JjTDAx?=
 =?utf-8?B?bHRZdm1STFVCd01ORndLQzRhQXNEM1dabWJla0xjUE5IUFhESVZ2TlRFQ0p1?=
 =?utf-8?B?SjBST3FPL201WXhuUktDb0N4UERDTzFxTWYvQ0ZlUi85NmtkWGNrQ2kxT2o2?=
 =?utf-8?B?NlpndUlvdUNuQjZvVm1iQzZKOVZ1MzdoekhnR2RYTzhCanZLV2tYR1g5M3RR?=
 =?utf-8?B?V2tRUGNJWDgrRHpsVGpCcXdsRElnZE1Wa2FmajFvMm5UYTlWV3drUS8zSjVx?=
 =?utf-8?B?VkcyV2dTUldrdzhEejkveG9Sa0Y3UjJWdEdDaWVoa3l1dE5RaWZOanZXN2M0?=
 =?utf-8?B?NktncVRkRkZkY0dDeVZXRTVTTWVCNFQ3d285Y1k3ZkxpVmVacWxqQkV1ZmIv?=
 =?utf-8?B?dnpCZThyRDNzYk5wSlo2dXdBQ1ZzOGc4Z3prYWwzWTF5NUFPRmd3TFFia2dN?=
 =?utf-8?B?STd4T2FwNGF4SjVvT1dhRTYzYndEY0k3MGk2SUd2VmFwTVEybTVnZDB5aGI1?=
 =?utf-8?B?YUhkbDRKbkdOTkpxK1VVS3Fqb2syOHg0aWNlWmJ2d2xwcFlwZkxBTGlXSkhP?=
 =?utf-8?B?NUVxWmEyc1JiWlllOUVLRG1KdVNPVVBHdUw2d2hxRzhCRHRMTGVrU0hkQmw3?=
 =?utf-8?B?M0FhdTltL0o4Vk1tRUExeXplenZDTUE5QUNtUWVDY2IwUDdia0ZVTTNwZ1Bx?=
 =?utf-8?B?MXhCWnBrbCtXZTNtUnZ3SWxsRkZ3YngxOWM5ZCtseE5uRUMyNUwxTVRpTUpr?=
 =?utf-8?B?aDNQMnk5WTZvaHR1NERMOHg2V3IzR0xWOWVRV2JvUG5RcWJrREVxSFNnME9l?=
 =?utf-8?B?SDVnbkJ3YXdaSUFBTHgrZDY1V2VDc2hTZGRaSS9iQWx2Y2lXWVNlTFhKU1dC?=
 =?utf-8?B?TklRVEM5SFVXVWpGY3d0QjFyTDlnN2tSVEVodTBCNEhUN0crTkh6QW1JU2Nw?=
 =?utf-8?B?NjIrTkZRWWM0d0dWNVRMWUZtZWo1VFk0NFA1cWJLZVRibHdLTmMzTEZ3RndW?=
 =?utf-8?B?U2NndTlDcUZDa3JzaW92K1Nidmp5eVE5eHIvanpwNkNlMDZCN05ZUzlQK05Z?=
 =?utf-8?B?cnI2UmJFcjQvQmdVMk9hT0FoY0RtSzNqcXFwcXREYzl1NjJHU2RwbU80SWp1?=
 =?utf-8?B?aTZ6UmdOcTBqTHdNeVdwK0ovdzlaazFWMlVJSGh3QnQ0bmxKRllTV05SMERG?=
 =?utf-8?B?dmd3c3dFL3pBSXpNN1o4RXdXcjBuS1duNnZTTHphRTNtZzBRMEI5TjNpTGx3?=
 =?utf-8?B?SWhTSkdSaStJOWlTQVllRWU2RWZEdVc0THVjaUVFdXUxNFRFak9iamJkSWp3?=
 =?utf-8?B?OWJENkVHYVNuTnZPTk9WQ2JCcGxxUDVReWltL3dxNG5wd0NjRlpJRWlwUVNM?=
 =?utf-8?B?MkdoV2R6b0o1UE5DZUNIRmcrSnJSN0pjQ1pubkNIbVMvQzVEQ0ZZamV0QzMy?=
 =?utf-8?B?bEZhQUlPallmNjBkbDg1MGhIT28zSjN1a1VBdXhjSFRMVmtJc0kvTzkyT0NW?=
 =?utf-8?B?b24rUGQ3L1JOS0dER0VSeHlMNDF6dG9idXlEeTlBdXd6dE96THdOZXVZU1Zz?=
 =?utf-8?Q?M3AFeoq+SAjRsGzc=3D?=
X-Exchange-RoutingPolicyChecked: DqqvbheqDPp2J0vOPIoskifF9m+4UbLJsnYBafQ/2ja4DuCoBNia5uK0ZIvoGvtT9GS929ZdPfirCaGVW/ds6PKfahqqjzrOlm6uyXmWiow6at02Zxtumb4JOz3Uyi596PmVUjyblomZJxXTGfhglfg9zmEBhYgaXb149hhQYWAJnS6JVa2q6qce0lfSkI5C+FTTR8tiDryPzqvWhOSci7ur5fAIq/HMFNk8Q+8f0YrmaPTK43WTH9U1pEnbqJDe5HQYjB+hZCgm+/hLB0L4YHX/zP2+192WX7grd621Xs0XAUkLRVfef5BH2BMB8hs0mJ//8GicOp77EpJHuOc81g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 836d5650-9066-4e86-207f-08de7d90cb8c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8208.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 04:03:18.0757 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oRsqaqag5MDA5svgG8jjOhbHkyfn5yjUooVOFu719h+iV5SKequcFBOtqsS/zpCmYFPNNsyVKpNzfiOlfPY5VzqHX6Tx2cZUZnMpWMge+ls=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8151
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
X-Rspamd-Queue-Id: D5DA62339B1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[sanjay.kumar.yadav@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	NEURAL_HAM(-0.00)[-0.964];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,intel.com:dkim,intel.com:email,intel.com:mid];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Action: no action


On 03-03-2026 16:22, Matthew Auld wrote:
> On 02/03/2026 15:09, Sanjay Yadav wrote:
>> Add a new kunit test gpu_test_buddy_alloc_range() that exercises the
>> __gpu_buddy_alloc_range() exact-range allocation path, triggered when
>> start + size == end with flags=0.
>>
>> The test covers:
>> - Basic exact-range allocation of the full mm
>> - Exact-range allocation of equal sub-ranges (quarters)
>> - Minimum chunk-size exact ranges at start, middle, and end offsets
>> - Non power-of-two mm size with multiple roots, including cross-root
>>    exact-range allocation
>> - Randomized exact-range allocations of N contiguous page-aligned
>>    slices in random order
>> - Negative: partially allocated range must reject overlapping exact
>>    alloc
>> - Negative: checkerboard allocation pattern rejects exact range over
>>    partially occupied pairs
>> - Negative: misaligned start, unaligned size, and out-of-bounds end
>> - Free and re-allocate the same exact range across multiple iterations
>> - Various power-of-two exact ranges at natural alignment
>>
>> Cc: Christian König <christian.koenig@amd.com>
>> Cc: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
>> Suggested-by: Matthew Auld <matthew.auld@intel.com>
>> Signed-off-by: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
>
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Thank you, Matt A., for your prompt review.
Hi Arun,
Kindly request you to review the change, and merge it if everything 
looks good?
