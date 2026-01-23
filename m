Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +PocOxf8c2mf0gAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 23:54:15 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ECCA7B488
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 23:54:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADA9E10EBFA;
	Fri, 23 Jan 2026 22:54:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NsxY3Coj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87D8310EBFA;
 Fri, 23 Jan 2026 22:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769208853; x=1800744853;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=dlwKnVA7DHcKBGI3BvvHFTR3vGfebXLTlnJ5GYv2rcA=;
 b=NsxY3CojNhZQeYRTwi0uZ8Jz+9WawZc0Gs4mMA70rHHrh+e+D1WzDcEZ
 0X9/5UanSaqYK5xfBhFsoxBneYPXg469EvmyX6g2DlkQ5PFzgEknrDSFs
 7hDEa8zzpLEyDERDvRQYRkkeFr1DSeGXfPUiwl+yYwkCwrwxK9SZacyAI
 E9S7CqUNMxwe3PodrWyCjsSMxJiJLLV9yRzm0QBWr0eo5VjW+ZWcBlYrQ
 tAN9D8qgPM7IqjDkToIwkQjEakJmf0sDA3r1QjXtQUNkK639qPpxbidxZ
 IPmyOyPYfOa+EVKCVSh6QA5r2AAMmP6RLnzvo0yD/2qawaY9GONK69D4M g==;
X-CSE-ConnectionGUID: RsVzH3CmSlSVnGmVzfIx0g==
X-CSE-MsgGUID: Jxk2T8NlT+Kt52OrKxzv4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11680"; a="81182977"
X-IronPort-AV: E=Sophos;i="6.21,249,1763452800"; d="scan'208";a="81182977"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2026 14:54:12 -0800
X-CSE-ConnectionGUID: 7/1AkdRuQV+zPciMBMBZtw==
X-CSE-MsgGUID: dNWhBS4fQqWWO+2zudHVpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,249,1763452800"; d="scan'208";a="207050544"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2026 14:54:12 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 23 Jan 2026 14:54:11 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Fri, 23 Jan 2026 14:54:11 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.36) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 23 Jan 2026 14:54:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jsFCqnpMC2fPphXA9+o/b1DnFL1ycwfWDaCb0riiCOqrT8rHlbjo78QLcMsB3iaaak1WQ624zYpM3M1uVgrkRcNAeFS8bhVjG8LRK+8OGpOMpTIDpzgd+k5vml426jm6BYtGIrz4N0sHjgaVwLy+fK2XjyKDqyVGB0xu11gka5o0BZOWfOKEWvjfPNfdfZhu/Pwx9lL/muAECKWYT/bSZuwF38zT9qH43C08BQxzq0hxDzb3IhdjVtN9YPoo5+N1s04sWKKF/BdirAkxpxsbFdGV8av2k4jfZxxCkE12lyRNN6oVC3ZFw0gijwt5cOYijbVEy2kvCc6nqXhaSUENZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L1EjYOxNlQHig9NWmhzltk4e/U52SRpDZYHeZx50jkc=;
 b=WRuSgwb/T4rHM1mxXime2mKSGYQPg2Zj7XmOwidFQ/uJGM45HKn4HrB43a0L3wBxq66fv7TqL5vyZs6yWnJV9sWSE098qY7cnGC7DNXX+aNAIbpIspugN6nARWXf2Z26UDxUfb40GOgGgvGUy9+IK6fcK9nJIxIvBY0VZktqUcjt+ONrFa5qMyxutTCYyAXXZNdBZ5UGrYsAG0etvN3GnMHU/lyRUFgRgfngPoxMaZsn9CrbUNxv3t3o0HO7mHI1jFCm0/CNIBymDutxba90wrn6ClXMSQJqaRIa8OqxILqy7xXot/4CLrg1HW4diPK9wS87W22XPZXSA7F07UvC+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB7254.namprd11.prod.outlook.com (2603:10b6:8:10e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 22:54:02 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9456.015; Fri, 23 Jan 2026
 22:54:02 +0000
Date: Fri, 23 Jan 2026 14:53:59 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <leonro@nvidia.com>, <francois.dugast@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <himal.prasad.ghimiray@intel.com>
Subject: Re: [RFC PATCH v2 0/3] Use new dma-map IOVA alloc, link, and sync
 API in GPU SVM and DRM pagemap
Message-ID: <aXP8B/tAuJO1hfx1@lstrano-desk.jf.intel.com>
References: <20260123215907.1643088-1-matthew.brost@intel.com>
 <20260123224146.GB1641016@ziepe.ca>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260123224146.GB1641016@ziepe.ca>
X-ClientProxiedBy: MW3PR05CA0001.namprd05.prod.outlook.com
 (2603:10b6:303:2b::6) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB7254:EE_
X-MS-Office365-Filtering-Correlation-Id: af15f4f7-ab73-4438-b7e6-08de5ad24d7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Y8LjkgrweX+6qLPwBQMdfUO3qn4DzrzH+w0HwiefWevPC7lmJIHd6g868D/0?=
 =?us-ascii?Q?YLUstdMK5U66t6Vbjf1M1ILNjiPPPNm3XXzAa9RdxLUMowfiFiWpTgUFz311?=
 =?us-ascii?Q?RH7tzLtGuAjimPhZHZUej3QDm7h/9ijM9OSPoQcT3rsWNjd4BFMqUGJYfrZD?=
 =?us-ascii?Q?dLMyt/UQUgjHgXxSo9PwXoyPK77V9g70UVCVkiA6kfWdwfkZq2yx/jwG6af6?=
 =?us-ascii?Q?u7+30NZVW3JlXKTniYVdEye08OO4hrFDEul2Q2mtc2W6pXLqbrsf7RaxFShJ?=
 =?us-ascii?Q?4FWZ8kzJgraIIxIvSbQUJuuiEoISwnVh431NRRtp4XNl8NhAubEi7M3cp9ec?=
 =?us-ascii?Q?8RO8sMQS9yktYZONHuRUWsQD3sTqjKp+osEQbkh4d5sAcD/1Qj7f48bT7zRx?=
 =?us-ascii?Q?FXDQSRsZfVj7OxI7QvUuLs6tGQkwUQPzPpDwX1k82Dwb/U4UW9e0CC9R495b?=
 =?us-ascii?Q?i8wouqxZXgK70B1pAT9hdl9w0D+ePVUagJgMGD8Jehf92wNMRC09yA0wq8wB?=
 =?us-ascii?Q?OhruItghH7EQrLzctzBxzfSXCH9e4zOP2LMY3YgKYtg1pfOgrVIRJF5kAkVa?=
 =?us-ascii?Q?FB56Rwlz89sdhxppfLB+tatlIFhTsiCwIcRHDp8mH/ElyeuYE11QUKqKwLLk?=
 =?us-ascii?Q?WzskXg4O3QoXWJxfoYt/5gpPxVxvbfdIW7Q1AQVpIxgBfYUk4cIvLIGN1KF0?=
 =?us-ascii?Q?kHj8FRx3HbazmHGeiyJII8FfObe2aaAL9CEP79oe6s8xEfqaFlIjrJH1DTU/?=
 =?us-ascii?Q?uPerNT2b+1USjIoAmT70SDMXKQIpGCQy+DIV93/zBJpJSI8zlANVm86EbIgL?=
 =?us-ascii?Q?h08jQskfUgm/W2gGCSqi2SfZxoigRRo4d+0v6D+lDMEX/lW171Ef5sW78Qp1?=
 =?us-ascii?Q?WBXssB73ZuoSx9OKMUrMORIF64riHnzWcLTiwsO26KTlTqL+CAdYnb0kJnDV?=
 =?us-ascii?Q?sIWMzI0ZeKv6JIDMuGfEmzAtYP/CcnXOrLMLEGyUhdXO7YP1J47UlyRe4RYB?=
 =?us-ascii?Q?jXMHnKymQLqUybpIPg8OQ9J1HAAVAgtlZz4V6qpnwIQaq0CenOKeQu71bOb4?=
 =?us-ascii?Q?mZYsITZb1pJ5B4DE7YF8BSkVgalfdlOrB2coMN2sBCBklOFDMkVpnXLoOb8L?=
 =?us-ascii?Q?xeC0JkybI1Xrnoe08dklJt8rIVNiod8mUv3L3CkBQNI2t/m5Oi0S1xLqJKR8?=
 =?us-ascii?Q?Zt2oMr/QsY/n+0ZWVNBOJNaNzGRZwpDPOdKZuDYt3biBIPz/Klhg4CesaLXD?=
 =?us-ascii?Q?UN2yczd1tzM3vuqjkYvhBbHm2OyPTPExbI6ej5L5LzWSfJ/BcRL6fCsqMv5y?=
 =?us-ascii?Q?JsqDktmrxXWLbLC8TXtgq3TEjTG8hdaSZPX3ZHVVxm/AHM2WrABst7SH1M2Y?=
 =?us-ascii?Q?KA7q9epESdrCALdpTwcogGbq7LJQA9iYBHTdomL+74+E8e6yizC8AsbWbaCM?=
 =?us-ascii?Q?b4R8VzTPsJwymkul03dnSdYS1GvoUzk5HP/u8sQa80eSG+dSMom/azXV3BbI?=
 =?us-ascii?Q?RGtmfcRjUsSyMWg90RtZgXniu7f6mlXBGigeSQd+EPbxkclvk2IorwPvYfKS?=
 =?us-ascii?Q?7Aky6Eg/+l6iM/ItsA8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4ghPSScJomC9diy66g9I20ASW/iveXlLNuGDkp/PuOHr3EN/ZZTFeBZiQ3SR?=
 =?us-ascii?Q?1109BH1kcHf6KcDEjPkLZbeP+nmhX/cov+Oyxrm6GZq8hH2SWwZaPiWP2vxw?=
 =?us-ascii?Q?O5eJzHHF/QaTXiRlTY4ogyLR+Z5tgEJxjhmdu0vjgbfBxLYS2/9wzCP/edDW?=
 =?us-ascii?Q?hHBgdeBCMLpJP7PI2EQ40ER7maO6fkl14pRlOjg6hcmqBJa6Qqi47SDlktfA?=
 =?us-ascii?Q?HGSwaGkT88mvI/Phe/eumgTak3vGzpa3o2C5mJ9SbLV1v6AfjgL/obAHS0R/?=
 =?us-ascii?Q?ULQsOjELt6fQVmvrgEMZWyPOyK79e6M3XuLIsVSGPQ1nUvX1HtQw1dYTCGIJ?=
 =?us-ascii?Q?cU/2L0/mHzvPDMqFuKHP/17umEMDJR8QhZ9idTWJNeAqN7190vDVl9fRfGBR?=
 =?us-ascii?Q?BugO9fz9Ke9KlDP5oz66wi/lNLRmF2Lfom9dF4bZ4OJtcCy+/x9cSfW/KuyB?=
 =?us-ascii?Q?IdDY0i2DgdF+c3I/QlsXyFt97bqhnYFV/qP21mK3DhLTl8bQkYDY5EoG+KI0?=
 =?us-ascii?Q?iEdvJE71yadxbgFsTpsMQgpik7cYGPr9tklm8GKY9z77kTiD+jSa79uyxx0w?=
 =?us-ascii?Q?tZSe0amoKbCN/EHeXky6JuVF+lKhEOX9qPCKO1AjFwqpQmuXKbUFvbJORiNU?=
 =?us-ascii?Q?G/Ew/NJKckKvvdFN39ce6doRZ2/kQfAoNQkofnfzbee9F9J1oCiO/j8itf/g?=
 =?us-ascii?Q?TvJFn4j82O75gq2eAh4gWVLhUDWHDrjcqlLb8lZGuQ6TllVKUEZfBaG3Zzu6?=
 =?us-ascii?Q?pnCDRHzRaOGBCoRQNoupFWFZCud7ccqOTfJenw9tu8eXouS0rpdBNQz0zPoQ?=
 =?us-ascii?Q?WLTmot7WNOg0SJJdPn/jx3i2jNocynORfs7xLxO9pf5c+bemzHLVafrXs9eF?=
 =?us-ascii?Q?82vLo4JG+9b6cVBCFTTGwRuVtqJ5c0tUz3p+/0/ioOYlwY/DilPvGWue829T?=
 =?us-ascii?Q?YJKGRUvj+FqKavftgN3H/HyhuA4mGJdHmkDUjlVyebTlHBKVhwZL16f3r2Gn?=
 =?us-ascii?Q?+k32BP6TVCc03Fw1UYQoEcZKuh2fjVSNP/BIT2ZleRBj2t7tMLyQm/UEBw1M?=
 =?us-ascii?Q?D1uyIm4esm28k0sYEtDOH3cY+Drv4iIlilc9S2XUw6B6+b2lw6bO9soW7o7N?=
 =?us-ascii?Q?ooOcwN/vZw6R66arT6qmp0sasZp9roymN/Ev30coRSJCDzLvi7ZrWTmHR+F0?=
 =?us-ascii?Q?yVcrq+wHQMk9qmW+BnatYxsr+yNyahpW06PKj4dGkmxFhZ4+V5/zmHX/Igda?=
 =?us-ascii?Q?vuvx235rYKFxSQ7xwA9mF6zrLydMm3z2qxcTt8i3Mi1S5ITtUE9e3E4R2dDG?=
 =?us-ascii?Q?LbSYDqGXY5llbNu+m/P+APs4FLHm0a2UnU7y2QtubWfqDaH0Lqa03cJs/cka?=
 =?us-ascii?Q?znWBlgxKNdbszbSL66chzOf2oTF5QNDV1Ymvy496hVAEGzgA4oj2SC1CRPZp?=
 =?us-ascii?Q?FUubKXT29ssfGVw4RKPg2AnNMy9IzofsT0fSXFdHQEDmSayl6+aKT3r6pZDU?=
 =?us-ascii?Q?jbuEupbaGWarcUkL1qNcbYTXJU1wvWZS+fx7lTsVOG+9HlyX+J8yWw4RZmWl?=
 =?us-ascii?Q?ypKtz++iLCbo3K8rCUVr26rNMlpCsgYs6xN2/Nto3J8C661kuYHcfY6DtMAG?=
 =?us-ascii?Q?OyOYRKpd+fFOZEf592pcZC1CafLAtWOfPfRmhutVxhpHFBuf1zbpBlxwHXUQ?=
 =?us-ascii?Q?55kBH1MgZtiJWsB92qLUC3/zs8NY1pXwQeE0m8CCdLJAG/wKREFIwDMIS1hh?=
 =?us-ascii?Q?1YwR8OetmkaLe17GWqc89DHSAVZaOck=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: af15f4f7-ab73-4438-b7e6-08de5ad24d7f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 22:54:02.4275 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YXIao1M2hy18CG+rS0J2paOEmbHfxvRAERF84XdcsCoJsMNgF8wKiNmbPYLxWDap4Hj6AvyGgGV1FGF9J0Of/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7254
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,intel.com:dkim];
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
X-Rspamd-Queue-Id: 5ECCA7B488
X-Rspamd-Action: no action

On Fri, Jan 23, 2026 at 06:41:46PM -0400, Jason Gunthorpe wrote:
> On Fri, Jan 23, 2026 at 01:59:04PM -0800, Matthew Brost wrote:
> > The dma-map IOVA alloc, link, and sync APIs perform significantly better
> > than dma-map / dma-unmap, as they avoid costly IOMMU synchronizations.
> > This difference is especially noticeable when mapping a 2MB region in
> > 4KB pages.
> > 
> > Use dma-map IOVA alloc, link, and sync APIs for GPU SVM and DRM page,
> > which mappings between the CPU and GPU.
> > 
> > Initial results are promising.
> > 
> > Baseline CPU time during 2M / 64K fault with a migration:
> > Average migrate 2M cpu time (us, percentage): 552.36049107142857142857, .71943789893868318799
> > Average migrate 64K cpu time (us, percentage): 24.97767857142857142857, .34789908128526791960
> > 
> > After this series CPU time during 2M / 64K fault with a migration:
> > Average migrate 2M cpu time (us, percentage): 224.81808035714285714286, .51412827364772602557
> > Average migrate 64K cpu time (us, percentage): 14.65625000000000000000, .25659463050529524405
> 
> Thats a 2x improvement in overall full operation? Wow!
> 
> Did you look at how non-iommu cases perform too?
> 

Like intel_iommu=off kerenl command line? I haven't checked that but can.

> I think we can do better still for the non-cached platforms as I have
> a way in mind to batch up lines and flush the line instead of flushing
> for every 8 byte IOPTE written. Some ARM folks have been talking about
> this problem too..

Yes, prior to the IOMMU changes I believe the basline was ~330us so
dma-map/unmap are still way slower than before and if this affect
platforms other than Intel x86 there will be complaints everyone until
the entire kernel moves to the IOVA alloc model.

Also another question does IOVA alloc support modes similar to
dma_map_resource between per device? We also do that and I haven't
modified that code or check that for perf regressions.

Matt 

> 
> Jason
