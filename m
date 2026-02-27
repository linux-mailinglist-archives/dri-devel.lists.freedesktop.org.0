Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id jne4Bx3koGmunwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 01:23:57 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6641A1B134E
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 01:23:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B99710E09A;
	Fri, 27 Feb 2026 00:23:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QGQEzRWs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A456F10E09A
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 00:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772151831; x=1803687831;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=ffuBXfD6r1utASZzzWe8fpQAK+atPnaoESx4GBEZKCA=;
 b=QGQEzRWs8/96dsWWNCBBDL4a7WuKK3zRSihgEJUka4Gpnpc9i9y09LtF
 VU8HzP/UeUzPNLuZFuxewc2/R+M3Fz1SHE6dxbJ2xut/utNsYh6wr21es
 kFjNg7HFzUHNqMbGjf83awK7gEkqPCAhmsVs8RauDETWN1szAgOSO/OTG
 ABUcR24Px5Ewqs4AbLTv5MOET4NeoN71kxkPU9gLZvV8NOcGbhPORp7WA
 VwDlDGLYz2cW+JLJijQb7AVEN88PLUW3Owu2eXW7Ko9cWv4cbFNukgCTD
 BtRSsAmGE3MqmfYm+u4jKWp3j9WEshKF/qMmbKXVYT67TJC4y83S/jAsi Q==;
X-CSE-ConnectionGUID: fmvpbtAvRAS3yBwaabsqPw==
X-CSE-MsgGUID: s/0PcWY5TD+U7Kto09mE1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="83939410"
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; d="scan'208";a="83939410"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 16:23:51 -0800
X-CSE-ConnectionGUID: FD+FcQGxT2aBO2tIPpWGhg==
X-CSE-MsgGUID: ts37GOYjSj2AF4YS2Yq+8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; d="scan'208";a="216636160"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 16:23:51 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Feb 2026 16:23:50 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 26 Feb 2026 16:23:50 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.25) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Feb 2026 16:23:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IdoaG5ce6SZeMDSgKcVcB773jAZD5D6WWpmlMRDy1m5M9NG82+oqODiq4ESKxGCEfBdtGc9C1kFdzfKl88no1lbEiQf0qmqi/c6q9h9CHmZ0NR1yqARVXR4gbBNI+MCL3AE/ODPxEPnA655zRI1FjBZDe0SjhqoyZGgKCyp1pFRdNltSoqk8ktozcvwmZXLXMU2E4WSfbLdEu748UYdncn7BKJGYE0bvymA29d8X9GKY+H11feeH5rn5dVLiKm9ntrpW47igQXzWStzxoT6BgiI0O5RfG1jntf5GxNpvb1FfcFu4V179+QIx73sKqjBjMVAJ5jMqyI2K9qqa+bWdCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NDPG4iVw32b1YuE4RMADwHTIVhyIBLXsQC/qo4vO1ao=;
 b=aNTotHGnTSd5tkUtIy4kE6iNA4sB4k5xOVXmDsjkfLN9KPGUw3OTqgAImB4z4f2Q5VahXUoPvVcIdJMx/etjG7kAtbQ/k0MFTt39HeFkCo1oAkcs2KhI/mM/3lnKE2t5bRJknFdIjJNfNB+yl1CSAVwi2XUi6SQpHg8LKVJ2EKAwfBv3QwB+7vqpdNGhKUW69DHNuycrBFnpIgITImKNT8GLJGCNcS5MZg1mrzsLRQIET3XtZYHinAs06FVBVuOR5g/PuWQJlur7VnonPhYMUFr7Xys2QUJQMDV/vQhuH5NCgCFxxrIjvtbX7sn/2VgSZSaMwpD05KQSrX+X8V/Zsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CO1PR11MB4771.namprd11.prod.outlook.com (2603:10b6:303:9f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.20; Fri, 27 Feb
 2026 00:23:48 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%6]) with mapi id 15.20.9654.013; Fri, 27 Feb 2026
 00:23:48 +0000
Date: Thu, 26 Feb 2026 16:23:45 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Yicong Hui <yiconghui@gmail.com>
CC: <christian.koenig@amd.com>, <michel.daenzer@mailbox.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <skhan@linuxfoundation.org>, <david.hunter.linux@gmail.com>
Subject: Re: [RFC PATCH v3 1/3] drm/syncobj: Add flag
 DRM_SYNCOBJ_QUERY_FLAGS_ERROR to query errors
Message-ID: <aaDkEQcycghQBmD2@lstrano-desk.jf.intel.com>
References: <20260225124609.968505-1-yiconghui@gmail.com>
 <20260225124609.968505-2-yiconghui@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260225124609.968505-2-yiconghui@gmail.com>
X-ClientProxiedBy: SJ0PR05CA0120.namprd05.prod.outlook.com
 (2603:10b6:a03:334::35) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CO1PR11MB4771:EE_
X-MS-Office365-Filtering-Correlation-Id: 52ecf4f0-3496-4abd-6ae9-08de759679ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: E7bQ80ANyNK2mqLKNMg6bWnJij0YZm9kdpJiTtCeeQWsA9A/lQgPXIUMZ0X+zNhQjiYjqT62jstlQLG5+lqqnM34OZB93KB+SFOcqne0HpeOCxs6onc5rMDe1EKnzPcUWPM05DEBHki2xzCMVjLw6i0ewEIsBUsBviXfofIEsdAdg0AI0gZRi1gLD3Tu5HSrF05aiJVHtFZNj3Bw9e53ODFL9EegCpCueNt1dsIPaHVx5CyjT2unsYomL6yqa6yD4pXIWL/NvF+oqxbUhwIsh5zeGt67z+80+tabKWID55NiX+Xyv+Uev4Cu0CW4kDi0fF9dHbN/YzU3DKsJ39YZdssKycq5/84mGzwTC3Ox5FDTNei6GWH4/9v+HtBJkUvJ8GQpwqIZKkXV0Sfu13wOyWVIavGv4pE/5hZ5rUGtp9FoxjfDBpuAfwlCODIYwiPfrkho83FBz+Q5Hd1IvgdWF2DoQgGmuY/n5zzDitr8JoA30zKMyn3MEC6uFXEQIc70SxPCqOoNTzPdEbSobQdkEbhLlIusOINOWhtLNrAlqvjJh/Xb/AiVOE+M+ZmoeKScS8pcnmIBlRmYxRfjjcQAnOAL+N3TMrifDnnI1dhzR26LP5smWicF+Nq7zRrZ/BT6Qr5Gu2+P8eQnY2VLpzrcQEIrXPiO9s+OF9XR8b+XCrFfILFsDFfkGat6crP/rYsVGHo5d49xuEK34Ffc5Z7kgquVBO/l8eAEV4A7SJUxGf4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aGZnQXI5bzZxazU2WEpYUHAzaHlHVTBpRVhUNldHV2ZoRzdZTEdQQlZtN2dS?=
 =?utf-8?B?SDhOYzJpWDNuTHI0R0tmSDFudEs1MVkzcWo4SVJRcmZpS3hIdUdDOWp3dEpD?=
 =?utf-8?B?UDlqcGV1aFdHTThESEpBVG1sRkJRaHAreFJiOUxIYmxyNlZTTHFCTTdUMlc5?=
 =?utf-8?B?dGNQQ2thYnpEVXZ3K0JDQUVOSlorOEZiS2dsTkNiWC9mMUJkdG5YbjdqNHFW?=
 =?utf-8?B?R2d4QTB1NU9BNm1JZEJIVy9PbzgrUkI3ZVVkc0Y2MStpY3JPWkMyZmZ6QkNP?=
 =?utf-8?B?Rm5teVV5NHErZGpDc2FMNDNZY0NDREJqVjQvUWxaeUJxbHdtSVNFSVZHV29T?=
 =?utf-8?B?aEtvUHJQS2tXTTNGVkdTL2cwei9UWkRCZUZhcjFONVU4YTduK2NjRCt1YUV5?=
 =?utf-8?B?aEZkU2xibUMreThkbi96cnBNaVc5OVg1WHZvNk1RUEl4ZDBSV1JwRTBiZ2I1?=
 =?utf-8?B?cXlVc21oM3pwSHVWUmpPOGx3clp5RnBNZ0xub09HZXJ1NjNoNW02UmdzRHF4?=
 =?utf-8?B?d3BnUzJxMVkvZjRaTWVQQVRwcmQ2cDV3VnVlYnBOSUtHTm1BSlg5eFpKbnNj?=
 =?utf-8?B?SzdKMGx0bmFvcEV5RGcrR1QwNmdBaEFIKzdNN1M5MmtFWEkvOTd0eUc5dEZt?=
 =?utf-8?B?WFFVMzg1bmJlM0JnQ2tVM1VrakJTTjNsNTlRK3EvQXpRYS9VdVVTTmlZRnJL?=
 =?utf-8?B?UlJQaVl2LzJxOXE2ZW1kcHFBT09wOGt2ZGErQ2NJS2liL3c2SkExOUEvdUwz?=
 =?utf-8?B?YUpSWWpXTVRheC9OYXJmU0RNTk52QThWLzQ3V3ZEeTV6TUZ2ZXFZcE9PblEz?=
 =?utf-8?B?VXU2NldPSFY5K1g0ZmFmbVR3bmhtS01QNjg3TU1ZVFBHU3dBbDAwcnpGL2NV?=
 =?utf-8?B?TTNnMC83NmVyL1c3QnRpRUR0SDZ4azBqWFMwanY5eFNrYVZjZXluWmU4L09I?=
 =?utf-8?B?R2Y5VG1IaW1qNGlBaTNTNjh3OThJK3AyYUE2cE9FZnZhVW44bTJEMmlZWWxG?=
 =?utf-8?B?YUkwMWg0YkIycUVpUmJxQ0pTRFdDbjR1QW83cTZHbTRKTnhEbURncllxZ2Mx?=
 =?utf-8?B?enR5NHlOaTJ3QzROdkpNeG9ZYW14V1IyNnVldmxIbzFFbFRNakk5MUZJN0lZ?=
 =?utf-8?B?U1lqeVpmSW9NUGdiSVdHMlQ0L1gxWGxkRU80K0tpenYwcVhQVE52N29jbVZ6?=
 =?utf-8?B?V3dURHFOVzIzeDFmeFZVbHdVNUJzR01EZ1VUMjdIa3NTcmI2VmxVNEZidmp1?=
 =?utf-8?B?R2lqZ1c4R1NmRGxtNkNHMDlxdE5tYUZqYjJHNGpHc2hhamNzcWVOMGZWWWps?=
 =?utf-8?B?ZC83aWFYUEk1MnpEenQvS21rRWRnRTBTZGpzVmp0SStOUU8yZGtZQnBJUWk4?=
 =?utf-8?B?aVZuRGtPejFTZUpZU0JQYVNRMjk3RDFkZTZybUhwZFFPdk4zUWpCM2hiaVda?=
 =?utf-8?B?TmRIM3loekVHdHRBSFlqU053bmRMQ0N5dGJOUTc5OGloVXBzbFBTMG11WEto?=
 =?utf-8?B?bUx2dU5qMHlwcE1wcDJ6TC93aUJKM0NMd21PeEVyNmI5aUcxbkNKbER4K3R5?=
 =?utf-8?B?V21kamNOMTBTYkZyZnRPS2tWYnJDSzNZSkdYVFN5OUY4cnpJL0ErVkxseXVP?=
 =?utf-8?B?NnRCOS9rM1BWOUpSZkxiYVpyeU1NeUVPck4wQVRmZjdwK0tDWkgwQlZhSGlt?=
 =?utf-8?B?OVFPbUVxcTJkY2crR3NBZGY5dGQyZ3c3SHMrZFlHek1ST0o1WXpoaDBuNnlm?=
 =?utf-8?B?VlBwOTA4OC92Ynh3akh1ZUhadnl6T0FOMUVVNHlxeUFubmc1VWhMZXBreC9H?=
 =?utf-8?B?c0xJdXczUmVYdERRbTBMOXNJRWcrOEpRSnFsK1ZMN3RjT3RYVEpjS3BWK2VM?=
 =?utf-8?B?MHIzZVJONXBoMFNid3ZmWWR6dVBOYjhLN05kRXUvcUVQMGx4eE80MVZTd0lv?=
 =?utf-8?B?K09RZGd0ZTd4OWJqTlhwRExzNXU4Tkd0ZkN6aDlyUG9tbEFVc0lwTGE1bWtj?=
 =?utf-8?B?MStmQTRnY2ZabmxodVZlaDhSQWFnNWMvNkpuT0ZqdGFlWjYrS3lNUGZnby8y?=
 =?utf-8?B?SkEwbkppSGRRMUNScVQvUkxiQUhGVkVoV2h1N1p3VGxXKzQvNDQ1NEM5bTM1?=
 =?utf-8?B?ZUtBY0dYcXQvazlTaTNtOHIyczY3SUJpRVdFWGlpVzk2R3cxUzZJUklXOC9v?=
 =?utf-8?B?LzBoV3NrZjUwUW5KekJXa2VDMVR4ZU9HM1A2eU1Ienpva2tuS2FHdFNTUG5q?=
 =?utf-8?B?NWliMjNiK0NnMWl0RVkydzllQ0hEOG12dUxGTnVUVVFHMmw4T2dLY0J4MVRG?=
 =?utf-8?B?R0N6UVhLZnJGZXJNaERjTXJhRTFmOG11YTNHU3M0SDlXWjhvOG1sZnplM0Z2?=
 =?utf-8?Q?P1k4TUMU1nK3Nrq8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 52ecf4f0-3496-4abd-6ae9-08de759679ef
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 00:23:48.6331 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HT2VQB2Vk+0odeadJTfDfANEMK/Zm00f1KanjxOQQof9DbgY4ojnnhh8F3fBiYWxuAy/6JJssaQ8mrptNJuFqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4771
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
X-Spamd-Result: default: False [1.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:yiconghui@gmail.com,m:christian.koenig@amd.com,m:michel.daenzer@mailbox.org,m:linux-kernel@vger.kernel.org,m:skhan@linuxfoundation.org,m:david.hunter.linux@gmail.com,m:davidhunterlinux@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[matthew.brost@intel.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[amd.com,mailbox.org,lists.freedesktop.org,vger.kernel.org,linuxfoundation.org,gmail.com];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,lstrano-desk.jf.intel.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.996];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[matthew.brost@intel.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[intel.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 6641A1B134E
X-Rspamd-Action: no action

On Wed, Feb 25, 2026 at 12:46:07PM +0000, Yicong Hui wrote:
> Add flag DRM_SYNCOBJ_QUERY_FLAGS_ERROR to make the
> DRM_IOCTL_SYNCOBJ_QUERY ioctl fill out the handles array with the
> error code of the first fence found per syncobj and 0 if one is not
> found and maintain the normal return value in points.
> 
> Suggested-by: Christian König <christian.koenig@amd.com>
> Suggested-by: Michel Dänzer <michel.daenzer@mailbox.org>
> Signed-off-by: Yicong Hui <yiconghui@gmail.com>
> ---
> Changes in v3:
> * Fixed inline comments by converting to multi-line comments in
> accordance to kernel style guidelines.
> * No longer using a separate superfluous function to walk the fence
> chain, and instead queries the last signaled fence in in the chain for
> its error code
> * Fixed types for error and handles array.
> 
> 
>  drivers/gpu/drm/drm_syncobj.c | 22 ++++++++++++++++++++--
>  include/uapi/drm/drm.h        |  5 +++++
>  2 files changed, 25 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
> index 2d4ab745fdad..b74e491f9d8b 100644
> --- a/drivers/gpu/drm/drm_syncobj.c
> +++ b/drivers/gpu/drm/drm_syncobj.c
> @@ -1654,14 +1654,17 @@ int drm_syncobj_query_ioctl(struct drm_device *dev, void *data,
>  {
>  	struct drm_syncobj_timeline_array *args = data;
>  	struct drm_syncobj **syncobjs;
> +	unsigned int valid_flags = DRM_SYNCOBJ_QUERY_FLAGS_LAST_SUBMITTED |
> +				   DRM_SYNCOBJ_QUERY_FLAGS_ERROR;
>  	uint64_t __user *points = u64_to_user_ptr(args->points);
> +	uint32_t __user *handles = u64_to_user_ptr(args->handles);
>  	uint32_t i;
> -	int ret;
> +	int ret, error;
>  
>  	if (!drm_core_check_feature(dev, DRIVER_SYNCOBJ_TIMELINE))
>  		return -EOPNOTSUPP;
>  
> -	if (args->flags & ~DRM_SYNCOBJ_QUERY_FLAGS_LAST_SUBMITTED)
> +	if (args->flags & ~valid_flags)
>  		return -EINVAL;
>  
>  	if (args->count_handles == 0)
> @@ -1681,6 +1684,7 @@ int drm_syncobj_query_ioctl(struct drm_device *dev, void *data,
>  
>  		fence = drm_syncobj_fence_get(syncobjs[i]);
>  		chain = to_dma_fence_chain(fence);
> +
>  		if (chain) {
>  			struct dma_fence *iter, *last_signaled =
>  				dma_fence_get(fence);
> @@ -1688,6 +1692,8 @@ int drm_syncobj_query_ioctl(struct drm_device *dev, void *data,
>  			if (args->flags &
>  			    DRM_SYNCOBJ_QUERY_FLAGS_LAST_SUBMITTED) {
>  				point = fence->seqno;
> +				error = dma_fence_get_status(fence);
> +
>  			} else {
>  				dma_fence_chain_for_each(iter, fence) {
>  					if (iter->context != fence->context) {
> @@ -1702,16 +1708,28 @@ int drm_syncobj_query_ioctl(struct drm_device *dev, void *data,
>  				point = dma_fence_is_signaled(last_signaled) ?
>  					last_signaled->seqno :
>  					to_dma_fence_chain(last_signaled)->prev_seqno;
> +
> +				error = dma_fence_get_status(last_signaled);
>  			}
>  			dma_fence_put(last_signaled);
>  		} else {
>  			point = 0;
> +			error = fence ? dma_fence_get_status(fence) : 0;

dma_fence_get_status returns 0 (unsignaled), 1 (signaled with no error),
or fence->error (signaled with error != 0).

Is it intentional to return 1 to user space for a signaled fence? What
if a driver sets fence->error to 1?

Side note: the fence error kernel doc says fence->error is only valid if
< 0, but dma_fence_get_status doesn’t enforce that.

Also, returning fence->error directly to user space seems like a massive
problem. Right now, drivers can set fence->error to whatever they want,
but now this gets reported to user space and suddenly has meaning. Does
user space take certain actions based on the specific error code (e.g.,
-ECANCELED, -ETIME, etc.)? It certainly can’t, because we have no
internal kernel standards for what fence->error actually means. Two
different drivers could assign the same error code but mean entirely
different things—or the opposite could be true.

Thus, without some standardization plus fixing every single driver, I
really think the best we can report in a generic mechanism like a
syncobj is simply “error” or “no error."

Matt

>  		}
>  		dma_fence_put(fence);
> +
>  		ret = copy_to_user(&points[i], &point, sizeof(uint64_t));
>  		ret = ret ? -EFAULT : 0;
>  		if (ret)
>  			break;
> +
> +		if (args->flags & DRM_SYNCOBJ_QUERY_FLAGS_ERROR) {
> +			ret = copy_to_user(&handles[i], &error, sizeof(*handles));
> +
> +			ret = ret ? -EFAULT : 0;
> +			if (ret)
> +				break;
> +		}
>  	}
>  	drm_syncobj_array_free(syncobjs, args->count_handles);
>  
> diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
> index 27cc159c1d27..213b4dc9b612 100644
> --- a/include/uapi/drm/drm.h
> +++ b/include/uapi/drm/drm.h
> @@ -1044,6 +1044,11 @@ struct drm_syncobj_array {
>  };
>  
>  #define DRM_SYNCOBJ_QUERY_FLAGS_LAST_SUBMITTED (1 << 0) /* last available point on timeline syncobj */
> +/*
> + * Copy the status of the fence as output into the handles array.
> + * The handles array is overwritten by that.
> + */
> +#define DRM_SYNCOBJ_QUERY_FLAGS_ERROR (1 << 1)
>  struct drm_syncobj_timeline_array {
>  	__u64 handles;
>  	__u64 points;
> -- 
> 2.53.0
> 
