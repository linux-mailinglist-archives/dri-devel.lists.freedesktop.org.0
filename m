Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1CF1C9D1D8
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 22:48:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 342D310E6E3;
	Tue,  2 Dec 2025 21:48:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YGDlfQU+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E90CE10E6E3;
 Tue,  2 Dec 2025 21:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764712105; x=1796248105;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=z3Jd9zHIl9drv1fDJzMXKGaZXj0y0yYwbupDXjanAVE=;
 b=YGDlfQU+97NOBVUw1lFEunOvUjjdD3NZcnmTQvqKRYAhFG947BwKm8SE
 t/zh63AyPr1+xD8N97dfMQN3IsS36AdMC7RBINEz6ost32zrbjLx2dLob
 tZFJEQnkQbPXCf1MoQ4T/vM5/vFr3j0NM2h/voui1R6LVfZGbYAIS0Ia2
 5o0uS2Pc6W4Tcs7NJ2DpJyc6WKDBZgJBTpNbhqNCM3+dcTmotJlmSp9xG
 rLG7MiONzPveb9gdZSIdMN5RoHct/0la5Yqaki4aTkU/b7lnCTGsTYDbd
 udivfh1zfPVRYFWbZ8X63/YK4R6dFSjgw+v0V3qM9Jc5+EMs8BfGFeywp Q==;
X-CSE-ConnectionGUID: lurWuyrNSbOz3vrv7ukaiQ==
X-CSE-MsgGUID: GmHRZfGeQ3mYMO1jDZHvlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="89349319"
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; d="scan'208";a="89349319"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 13:48:24 -0800
X-CSE-ConnectionGUID: vqX0gKn5TgGMDZNY6ZQ+6w==
X-CSE-MsgGUID: xR0NDhXiSTGK5FJoP1QlSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; d="scan'208";a="199617989"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 13:48:21 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 13:48:19 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 2 Dec 2025 13:48:19 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.68) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 13:48:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=teLQ55+ATahfniqS979sTvMbZgVo6xB1N2F0AJl3eiHagYGkye4BoLCW5vEJBDye4q7F21FwOdTR5+m5GzPO9ylkkioi2bHPKk5gCMzvutr6lruAkkZxEHaYb4688D2dZorKG8s/aEzjOY1nIR7WD7WSeipgUqfvQ6KxRhL2GbRgueyGFHdLkHkq1+rMkLe1123fqKJr5NLfrCWVG4WSnZmdDlpydbPxpRhgeTfZf04PGJgAisLVSQigAt2i1/nwwoxPYI+BvJS7O0IThIkx0vWEsuSoJ4ajyKBC89SqwoEU0lHi0Kk5irZidwRKO9jZiJt52ErhCCSQKUTOa2jlLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kcxUNvGSa9jCXXKOHQsrIUCju+WgFU3O+CrjUUREud0=;
 b=chcNoaOh428TDv2yBIqtif3aP8OI38sTGYO2p+/Y6QL7XAOyEmx30/BKjLC1ntk8NPO4HK4QgT0MObAReN7Br/eKQP+z6fkU5DhNXihyKj765iaUoWY+Bkso1XcrNHDa05xG+uQQ+RHmi/eM8WSO7FNWzWkvpoNT6EYV5a3MDoZEDV/xuiGPuoENyDmP5ZLL+nuGYvgvoA30SFAfMH840yCWFHMbOXyeYIAOrmLjSIkZnsZWK5orTBH2yFRiBL9rGsdXEGxWwyCl+lPqJlkRJyyddj5HAdSNcxHts77fbM295tG8epx8Uw/ZqwuezqHa0FBrVAF+LY3AG4AX/BXmYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA2PR11MB4953.namprd11.prod.outlook.com (2603:10b6:806:117::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Tue, 2 Dec
 2025 21:48:17 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9388.003; Tue, 2 Dec 2025
 21:48:17 +0000
Date: Tue, 2 Dec 2025 13:48:14 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <saurabhg.gupta@intel.com>,
 <alex.zuo@intel.com>, <joonas.lahtinen@linux.intel.com>,
 <jianxun.zhang@intel.com>, <shuicheng.lin@intel.com>,
 <dri-devel@lists.freedesktop.org>, <Michal.Wajdeczko@intel.com>,
 <michal.mrozek@intel.com>, <raag.jadav@intel.com>, <ivan.briano@intel.com>,
 <matthew.auld@intel.com>, <dafna.hirschfeld@intel.com>
Subject: Re: [PATCH v29 4/5] drm/xe/xe_vm: Add per VM fault info
Message-ID: <aS9eniiR5KADQSrE@lstrano-desk.jf.intel.com>
References: <20251202184636.96142-7-jonathan.cavitt@intel.com>
 <20251202184636.96142-11-jonathan.cavitt@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251202184636.96142-11-jonathan.cavitt@intel.com>
X-ClientProxiedBy: MW4PR03CA0061.namprd03.prod.outlook.com
 (2603:10b6:303:b6::6) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA2PR11MB4953:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c837774-6caf-488d-04ec-08de31ec80da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Pdn8cibb2Geni+L8LnyfH5kx5htxTD3xfViFKdsR7wpMljNp6NrUsFTTXtv1?=
 =?us-ascii?Q?29A49afemvn5NsbQ9QOxxImGnVBgaD3QMVh7l3ChYRFcc9CezWgAA8/40XD3?=
 =?us-ascii?Q?xQhK1iC7HLJYXKgc5M2ceGeq85n6xxXq0u88ahH9WzZw7biNj5vAijjNsYqX?=
 =?us-ascii?Q?e69111f9qr0nmYwkSvnnztDgfN9i+L53U3RnFcNFqbTBZVp1lGD3eqg9yosF?=
 =?us-ascii?Q?uF5am3hT8EgFxxs9Bzajzo6lOjT/pYKi49r5W8biWKSupL1X0A9lP/p0YYc6?=
 =?us-ascii?Q?qG39svrQt7Wh2mkOKbYrjgPmJSufFKpVLNk/3LdVV2ExzLkZ11OWmi/4H54b?=
 =?us-ascii?Q?okOVEmj5MzyfdBwXz5+RC2fNn6ZnQxe9jJlU7qrwuSu6j3nTRFHZb1WoilNz?=
 =?us-ascii?Q?heoRpwgMabyHt7FCABgxrZFnQjjDkHyESPN/cQoNFrIGNgbthb8kQtFvVTO3?=
 =?us-ascii?Q?B6Mttx2yfbc2J0MQPZGNj+ibKi7MbqMv9e2mxsiNSI48xz6NWzlfyZYmacDs?=
 =?us-ascii?Q?EcPnqjSWQ/WPXoQrYTxp9ZCI0aDZwSJgcveDHe7+ygY/E0mIdPyiPH2xYWgj?=
 =?us-ascii?Q?OgxNk/AuZkbK40mfKTHUgjVw5RW2omu2vdVGT1jquO8hgvsisLEPlMSgS72z?=
 =?us-ascii?Q?mgowYsusPKVoOsR2g74x4jItQgcnU3acSXUUtVcdp/cF8/Yju5n0ZRkBVVbB?=
 =?us-ascii?Q?hPA2JSlmoVvIALz/xu2zVLeaIboQSFSUx7gC1v50jSwRfalM4FEYFhgOfYcO?=
 =?us-ascii?Q?FYMGxzEeeD/Sj1W1GWCWtBL2/R7LxLBQ4KbL+yjYazGCP50a4u41FbpqBHem?=
 =?us-ascii?Q?wsySqirbhAxzjeeiijv+122P+G8pLvzZYs2Bk8CFh5rcczUh7eLlTKmqFiyC?=
 =?us-ascii?Q?jAJEf9P5yscYvkUy7QNjd5AYPDeBGy/BpeEbOcuFOST6Q0m9f0IjhRVvNi/V?=
 =?us-ascii?Q?sjTFm02jCzveSMoTRaG4tDqUMKxsMYa2KUCC2OT1KzRgD1wE3o035pM0T6Dy?=
 =?us-ascii?Q?Btfgua6xf85dfbsNANpGd3zJqY7Xp7QauJiROUEYNhS/6GPwANKga2QYFmPn?=
 =?us-ascii?Q?yq7DGn+9v8cuSBKO1mpZAY8HvCDbycYef//nA3IWXXqMds4Hsur/KESgKySr?=
 =?us-ascii?Q?iJC7IrjFC4QPI/whXEaZ9IDM9YskdzTaAPNffKmw/r8mv0HDvPzq2pU4I/eY?=
 =?us-ascii?Q?yrw9DeONMk1+KzQSlzZaHYAClZWwC90hTHBBCvgrDAoSAn66/SGMe9i28LaI?=
 =?us-ascii?Q?lWblx7fNuD2bdlPH2kVj2O/Jhnzo48wb+b0gaj8f0zoh7e4Es05o8exeesKB?=
 =?us-ascii?Q?u8sfkxU5bR5opGndOyn1wpnVeOZLgbmV3b6Z4wz0oK9kmZnVxgkwAyxDTKlX?=
 =?us-ascii?Q?p5kd5Zt0Aka1lIFOIDxqeH8O4kidmDYZ9SxMYzrdiyGCtFJnqmOM5eSdWHSm?=
 =?us-ascii?Q?RulXiIUEgluKAFpvyK/V7hCNFRCjTUI3?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zq0RHOMVZSzgB0wkSnUfk/IYsLQE46Aa+Qk5MW+uevztjS5KNE1mgnY4PwvX?=
 =?us-ascii?Q?HsDY7Z/DqT8IL3J8jOShRJtZWDheySkWEgQtcdK6sNWVI2QoA03uNsDOkS0U?=
 =?us-ascii?Q?QvQ/W9Gd16B31QMUeR5sSlyfyHRrtJZbNJdWHIF1pdynKRtMENjqMfWbaTjo?=
 =?us-ascii?Q?BodQPYvIYtWOHpVkritNKBMravBy7Qx7dpD093zllSRlHEOPsPPP0hcYSn3P?=
 =?us-ascii?Q?/Wsu8CAWYvyRV9CebZeQhgtAHsd8vfAvJ2L6/7tULkQ+dsonPDd4j0Llpx8L?=
 =?us-ascii?Q?HK8xlcwLwCXB8LWWjljO/hMomH6U73khb7t9N0YqFG3Kc+1MY33/roza2S1A?=
 =?us-ascii?Q?Ff8MKNiff6AYVcxk2aRDZg4IBTNV/7rckodkhDeaUygdGQJFsZkK766SJzDt?=
 =?us-ascii?Q?ogqrWjmex/n0+1sjSSu4Yeyk0eM3U88YccsQsXhUld1sGebimZl8BdkuoHsC?=
 =?us-ascii?Q?5IIWY0W2N/HTB9lTN+zsCmyN70AAzyCa+ox5pNwlTkeD1pEdx+Rv40VSgZy1?=
 =?us-ascii?Q?Ed63JtBnuAapB88mFWoqNO7lPuzKTts2wbYR09FAaEhsqwp8zQSlTIW0zcR5?=
 =?us-ascii?Q?kcmC1HTmRA9evTtI66NbIjWU6nBWVq2M5v2tUNG/td1HZi2tgmFa2wgmSXQk?=
 =?us-ascii?Q?A5ECJU1tE4zKj4aPFFPUR1qyya+8DiCRyWy4miv4RN2tYZqRAgmCXMlkFY4U?=
 =?us-ascii?Q?GI9iJBfvgeBfE6dmSH6RsvueDRoTqIw/qqLzP31Pyu09+uvikJZzbaNT4VPl?=
 =?us-ascii?Q?bzU0G+aGYixX2SQoEK8h7Qcw4/SpgRKeluHD+5q8OuMWns7wegZAasW0Rg5u?=
 =?us-ascii?Q?3q1jQ5Fr/ApcfRyAvml1FKKFckCtHx/06K3YNxRCE2Go5YIzyka9b7xaaVN0?=
 =?us-ascii?Q?NUMaa4NT0tApYbQ+nj36EUczAIUE5i3q1BLSSe1ypJ7YA1QH9LQ6vdk/OOC+?=
 =?us-ascii?Q?7fPaJ7xQld/Z/0LEWb/1VITrmc2jChSBx5RL92R/u/YA2Z06Qw4XD1vFjc6K?=
 =?us-ascii?Q?gOxn9zz5xNYrTNDzmBBkK193pFZq2dg/n+1R5nsny2imeQLHkoo992EUnDx1?=
 =?us-ascii?Q?Aqc56ek+hMT+F3MMh/m2Ii3Gp9fdAH42N2wpQGCuklorjFQ8M8/X1LGakuEc?=
 =?us-ascii?Q?Uzuqs2lua+dj7gwijjbEKO00F/c6TCM2t1LIEM7F19d+445gAwg8XPm4rjNj?=
 =?us-ascii?Q?TSWZyiT1DDJ4QXWSM3XCV/hinkRLYeZIfvPBSM7VOmWwrO/QJRY44X2oLOGL?=
 =?us-ascii?Q?o/LqL84+yuokrNkIrf0G0b7E5sNAHNZCIFFsEHZ/Py0MlYBld1eLy216yj7/?=
 =?us-ascii?Q?7W1tVOlrbPHOX/o4YBsZkDSUIbVS7rDtO+62yIfsYf7xb7ErqLNVNZiXQfUl?=
 =?us-ascii?Q?zNZN1Ij7hCwaIq95qaklOdDRbI+3MF4pVkhXHKGoe9OLjAclgHvaH7abuXwR?=
 =?us-ascii?Q?AFGTqWC5WDm4YkiUmZCbyOEhJwSmcF2a8EsXMjeYUONfHZIkbovMYgwcL/WE?=
 =?us-ascii?Q?qKTfw6RvN6umK4bZKGJ6sKt8MHJ1OXT2mRYCQkblSBVzLRuBmYKxoS4Miyse?=
 =?us-ascii?Q?jN/wBHuUgPdVYfPF5gU/ywD+/Lbt9wkY3cqntxnEvSPzWbNz2Tv6JUgALFYv?=
 =?us-ascii?Q?9g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c837774-6caf-488d-04ec-08de31ec80da
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 21:48:17.8162 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nThdLhZNtuV7om7nk671XQbH++Expeb1yo+E8Dwb0r0JkcG6KZINVQEZ5oS9yXGGZaiPr7nt0pFZm4/JXUm3/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4953
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

On Tue, Dec 02, 2025 at 06:46:41PM +0000, Jonathan Cavitt wrote:
> Add additional information to each VM so they can report up to the first
> 50 seen faults.  Only pagefaults are saved this way currently, though in
> the future, all faults should be tracked by the VM for future reporting.
> 
> Additionally, of the pagefaults reported, only failed pagefaults are
> saved this way, as successful pagefaults should recover silently and not
> need to be reported to userspace.
> 
> v2:
> - Free vm after use (Shuicheng)
> - Compress pf copy logic (Shuicheng)
> - Update fault_unsuccessful before storing (Shuicheng)
> - Fix old struct name in comments (Shuicheng)
> - Keep first 50 pagefaults instead of last 50 (Jianxun)
> 
> v3:
> - Avoid unnecessary execution by checking MAX_PFS earlier (jcavitt)
> - Fix double-locking error (jcavitt)
> - Assert kmemdump is successful (Shuicheng)
> 
> v4:
> - Rename xe_vm.pfs to xe_vm.faults (jcavitt)
> - Store fault data and not pagefault in xe_vm faults list (jcavitt)
> - Store address, address type, and address precision per fault (jcavitt)
> - Store engine class and instance data per fault (Jianxun)
> - Add and fix kernel docs (Michal W)
> - Properly handle kzalloc error (Michal W)
> - s/MAX_PFS/MAX_FAULTS_SAVED_PER_VM (Michal W)
> - Store fault level per fault (Micahl M)
> 
> v5:
> - Store fault and access type instead of address type (Jianxun)
> 
> v6:
> - Store pagefaults in non-fault-mode VMs as well (Jianxun)
> 
> v7:
> - Fix kernel docs and comments (Michal W)
> 
> v8:
> - Fix double-locking issue (Jianxun)
> 
> v9:
> - Do not report faults from reserved engines (Jianxun)
> 
> v10:
> - Remove engine class and instance (Ivan)
> 
> v11:
> - Perform kzalloc outside of lock (Auld)
> 
> v12:
> - Fix xe_vm_fault_entry kernel docs (Shuicheng)
> 
> v13:
> - Rebase and refactor (jcavitt)
> 
> v14:
> - Correctly ignore fault mode in save_pagefault_to_vm (jcavitt)
> 
> v15:
> - s/save_pagefault_to_vm/xe_pagefault_save_to_vm (Matt Brost)
> - Use guard instead of spin_lock/unlock (Matt Brost)
> - GT was added to xe_pagefault struct.  Use xe_gt_hw_engine
>   instead of creating a new helper function (Matt Brost)
> 
> v16:
> - Set address precision programmatically (Matt Brost)
> 
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Suggested-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Cc: Shuicheng Lin <shuicheng.lin@intel.com>
> Cc: Jianxun Zhang <jianxun.zhang@intel.com>
> Cc: Michal Wajdeczko <Michal.Wajdeczko@intel.com>
> Cc: Michal Mzorek <michal.mzorek@intel.com>
> Cc: Ivan Briano <ivan.briano@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pagefault.c | 26 ++++++++++++
>  drivers/gpu/drm/xe/xe_vm.c        | 67 +++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_vm.h        |  9 +++++
>  drivers/gpu/drm/xe/xe_vm_types.h  | 29 +++++++++++++
>  4 files changed, 131 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
> index 47dec46515b5..ee1b788bcfbd 100644
> --- a/drivers/gpu/drm/xe/xe_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_pagefault.c
> @@ -249,6 +249,31 @@ static void xe_pagefault_print(struct xe_pagefault *pf)
>  		  pf->consumer.engine_instance);
>  }
>  
> +static void xe_pagefault_save_to_vm(struct xe_device *xe, struct xe_pagefault *pf)
> +{
> +	struct xe_vm *vm;
> +
> +	/*
> +	 * Pagefault may be asociated to VM that is not in fault mode.
> +	 * Perform asid_to_vm behavior, except if VM is not in fault
> +	 * mode, return VM anyways.
> +	 */
> +	down_read(&xe->usm.lock);
> +	vm = xa_load(&xe->usm.asid_to_vm, pf->consumer.asid);
> +	if (vm)
> +		xe_vm_get(vm);
> +	else
> +		vm = ERR_PTR(-EINVAL);
> +	up_read(&xe->usm.lock);
> +
> +	if (IS_ERR(vm))
> +		return;
> +
> +	xe_vm_add_fault_entry_pf(vm, pf);
> +
> +	xe_vm_put(vm);
> +}
> +
>  static void xe_pagefault_queue_work(struct work_struct *w)
>  {
>  	struct xe_pagefault_queue *pf_queue =
> @@ -268,6 +293,7 @@ static void xe_pagefault_queue_work(struct work_struct *w)
>  		err = xe_pagefault_service(&pf);
>  		if (err) {
>  			xe_pagefault_print(&pf);
> +			xe_pagefault_save_to_vm(gt_to_xe(pf.gt), &pf);
>  			xe_gt_dbg(pf.gt, "Fault response: Unsuccessful %pe\n",
>  				  ERR_PTR(err));
>  		}
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 00ffd3f03983..41fd352dcfb2 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -27,6 +27,7 @@
>  #include "xe_device.h"
>  #include "xe_drm_client.h"
>  #include "xe_exec_queue.h"
> +#include "xe_gt.h"
>  #include "xe_migrate.h"
>  #include "xe_pat.h"
>  #include "xe_pm.h"
> @@ -578,6 +579,67 @@ static void preempt_rebind_work_func(struct work_struct *w)
>  	trace_xe_vm_rebind_worker_exit(vm);
>  }
>  
> +/**
> + * xe_vm_add_fault_entry_pf() - Add pagefault to vm fault list
> + * @vm: The VM.
> + * @pf: The pagefault.
> + *
> + * This function takes the data from the pagefault @pf and saves it to @vm->faults.list.
> + *
> + * The function exits silently if the list is full, and reports a warning if the pagefault
> + * could not be saved to the list.
> + */
> +void xe_vm_add_fault_entry_pf(struct xe_vm *vm, struct xe_pagefault *pf)
> +{
> +	struct xe_vm_fault_entry *e = NULL;
> +	struct xe_hw_engine *hwe;
> +
> +	/* Do not report faults on reserved engines */
> +	hwe = xe_gt_hw_engine(pf->gt, pf->consumer.engine_class,
> +			      pf->consumer.engine_instance, false);
> +	if (!hwe || xe_hw_engine_is_reserved(hwe))
> +		return;
> +
> +	e = kzalloc(sizeof(*e), GFP_KERNEL);
> +	if (!e) {
> +		drm_warn(&vm->xe->drm,
> +			 "Could not allocate memory for fault!\n");
> +		return;
> +	}
> +
> +	guard(spinlock)(&vm->faults.lock);
> +
> +	/*
> +	 * Limit the number of faults in the fault list to prevent
> +	 * memory overuse.
> +	 */
> +	if (vm->faults.len >= MAX_FAULTS_SAVED_PER_VM) {
> +		kfree(e);
> +		return;
> +	}
> +
> +	e->address = pf->consumer.page_addr;
> +	e->address_precision = BIT(pf->consumer.addr_precision);
> +	e->access_type = pf->consumer.access_type;
> +	e->fault_type = pf->consumer.fault_type;
> +	e->fault_level = pf->consumer.fault_level;
> +
> +	list_add_tail(&e->list, &vm->faults.list);
> +	vm->faults.len++;
> +}
> +
> +static void xe_vm_clear_fault_entries(struct xe_vm *vm)
> +{
> +	struct xe_vm_fault_entry *e, *tmp;
> +
> +	guard(spinlock)(&vm->faults.lock);
> +	list_for_each_entry_safe(e, tmp, &vm->faults.list, list) {
> +		list_del(&e->list);
> +		kfree(e);
> +	}
> +	vm->faults.len = 0;
> +}
> +
>  static int xe_vma_ops_alloc(struct xe_vma_ops *vops, bool array_of_binds)
>  {
>  	int i;
> @@ -1503,6 +1565,9 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags, struct xe_file *xef)
>  	INIT_LIST_HEAD(&vm->userptr.invalidated);
>  	spin_lock_init(&vm->userptr.invalidated_lock);
>  
> +	INIT_LIST_HEAD(&vm->faults.list);
> +	spin_lock_init(&vm->faults.lock);
> +
>  	ttm_lru_bulk_move_init(&vm->lru_bulk_move);
>  
>  	INIT_WORK(&vm->destroy_work, vm_destroy_work_func);
> @@ -1808,6 +1873,8 @@ void xe_vm_close_and_put(struct xe_vm *vm)
>  	}
>  	up_write(&xe->usm.lock);
>  
> +	xe_vm_clear_fault_entries(vm);
> +
>  	for_each_tile(tile, xe, id)
>  		xe_range_fence_tree_fini(&vm->rftree[id]);
>  
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> index 361f10b3c453..e9f2de4189e0 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -12,6 +12,12 @@
>  #include "xe_map.h"
>  #include "xe_vm_types.h"
>  
> +/**
> + * MAX_FAULTS_SAVED_PER_VM - Maximum number of faults each vm can store before future
> + * faults are discarded to prevent memory overuse
> + */
> +#define MAX_FAULTS_SAVED_PER_VM	50
> +
>  struct drm_device;
>  struct drm_printer;
>  struct drm_file;
> @@ -22,6 +28,7 @@ struct dma_fence;
>  
>  struct xe_exec_queue;
>  struct xe_file;
> +struct xe_pagefault;
>  struct xe_sync_entry;
>  struct xe_svm_range;
>  struct drm_exec;
> @@ -309,6 +316,8 @@ void xe_vm_snapshot_capture_delayed(struct xe_vm_snapshot *snap);
>  void xe_vm_snapshot_print(struct xe_vm_snapshot *snap, struct drm_printer *p);
>  void xe_vm_snapshot_free(struct xe_vm_snapshot *snap);
>  
> +void xe_vm_add_fault_entry_pf(struct xe_vm *vm, struct xe_pagefault *pf);
> +
>  /**
>   * xe_vm_set_validating() - Register this task as currently making bos resident
>   * @allow_res_evict: Allow eviction of buffer objects bound to @vm when
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> index 3bf912bfbdcc..fff914fb0aa6 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -20,6 +20,7 @@
>  #include "xe_userptr.h"
>  
>  struct xe_bo;
> +struct xe_pagefault;
>  struct xe_svm_range;
>  struct xe_sync_entry;
>  struct xe_user_fence;
> @@ -165,6 +166,24 @@ struct xe_userptr_vma {
>  
>  struct xe_device;
>  
> +/**
> + * struct xe_vm_fault_entry - Elements of vm->faults.list
> + * @list: link into @xe_vm.faults.list
> + * @address: address of the fault
> + * @address_precision: precision of faulted address
> + * @access_type: type of address access that resulted in fault
> + * @fault_type: type of fault reported
> + * @fault_level: fault level of the fault
> + */
> +struct xe_vm_fault_entry {
> +	struct list_head list;
> +	u64 address;
> +	u32 address_precision;
> +	u8 access_type;
> +	u8 fault_type;
> +	u8 fault_level;
> +};
> +
>  struct xe_vm {
>  	/** @gpuvm: base GPUVM used to track VMAs */
>  	struct drm_gpuvm gpuvm;
> @@ -302,6 +321,16 @@ struct xe_vm {
>  		bool capture_once;
>  	} error_capture;
>  
> +	/** @faults: List of all faults associated with this VM */
> +	struct {
> +		/** @faults.lock: lock protecting @faults.list */
> +		spinlock_t lock;
> +		/** @faults.list: list of xe_vm_fault_entry entries */
> +		struct list_head list;
> +		/** @faults.len: length of @faults.list */
> +		unsigned int len;
> +	} faults;
> +
>  	/**
>  	 * @validation: Validation data only valid with the vm resv held.
>  	 * Note: This is really task state of the task holding the vm resv,
> -- 
> 2.43.0
> 
