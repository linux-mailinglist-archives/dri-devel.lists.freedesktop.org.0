Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88931D1CF19
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jan 2026 08:49:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 234F110E5D1;
	Wed, 14 Jan 2026 07:49:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dS7CqTNF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4530C10E5D1;
 Wed, 14 Jan 2026 07:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768376964; x=1799912964;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=gl+8reodA0dz9EuFqfHoe03mmUCiyJ6wOZX0pMOeb0E=;
 b=dS7CqTNFzEYhUufGIbGd5kBoAoXRbUFhniorLl4BE2k4Xo2yrr+LhqOl
 2iMAbZvP6UzY8AxTXOvnfxUMV2p1PXCAswPCd+WXcJgqBtydK3LylaPwy
 hYJh5teJv1KK+pAnsds+kxy6D14U+NF9tpMhw1JZO3zhywi/dZ+W4BH1L
 J5foSMwrcxzPtFvLzw2ZrK6NqrjdDWkZ/i0S1mS7/9eZGYAVY79ut9w+s
 Prb0b2YcYSAnRO0v8xGbyXw+uCpLeL4S6pgPo3XhafnZ+stenvDy7oFNL
 VGrPO8jc6vFk2uMVpfhLsYjYJBsf2kd76HUQ5dUzDIDjrINu7A9QnCkQM Q==;
X-CSE-ConnectionGUID: spjxm3rCTduRv9oA1Qf69w==
X-CSE-MsgGUID: RsBY3YkeQ8mBJ5RdiS2UPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="95145114"
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; d="scan'208";a="95145114"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 23:49:23 -0800
X-CSE-ConnectionGUID: aqqlbtMtRaSB0D7LmIaXwA==
X-CSE-MsgGUID: qyjKtamZQrC/bxFvP0PCug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; d="scan'208";a="209656445"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 23:49:24 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 13 Jan 2026 23:49:22 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 13 Jan 2026 23:49:22 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.15) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 13 Jan 2026 23:49:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sZjzOPOjEuIsklXUy9e3bwDLJJPNc5twhDWmsMpL6ooaNMlI1aO1IvxAUEilTdAFxPLBO3dhmMNuIRaZah3RdtRBU3r58L4vLls6WoI3HtBDtwselJvbhFB0PMyWGxdkqcSHTCiXOCgQ112O0HeivO8sqW4kiMeNqOadpsFMDTiPb0K3VD03oKd4M4nV9VfRGU6oQ2zHaKYiKx7EorKgocd3SgT+4kYYlzw9lW03ZLDHQs13CpBoQFC0v5K/Uc7Y/jXFnpnRRdrbQdiW47FUddHU7zlf6wcSjYTgn8mtyNVRdm1dIlcmvQViM432oUe5Zyw7esyczkUU3W+5SEEAQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Up0EIPBuleEByK3ONbYkbz/BjZ6IbT4AaUYyQEupCk=;
 b=a5oi0AiCE5L0j5Aw2vAKlCnyYEmemc75f8/4mWgsY6GtYquFAIwQCb5CQBpCnxXIulS9pHknZuX6sWM2tjW9WlMroBsQ41NtAiACwmeNWVvA5pk7FJ0eRU75jFXMKpvUJecseP2oy2mJiYgLNi7npDvUWl/6cX/fWPZnjP68FypbDeQwtTYS1qRYAuu0itRq4G5Rcm1kERk1iOloffNhAoObGrzufmiCqtTS0Euyp1u6XxLNGhf3MzZnZoJUZHioPsLR6ONFFKfqh7D1sohIp7GMalwUcZrR99geYYkt2zwhDmMT8y6bTy1HtfUItXTjc8TCjoq/dtQNf/trLSMtNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM6PR11MB4756.namprd11.prod.outlook.com (2603:10b6:5:2a7::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Wed, 14 Jan
 2026 07:49:13 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9456.015; Wed, 14 Jan 2026
 07:49:13 +0000
Date: Tue, 13 Jan 2026 23:49:10 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Marco Crivellari <marco.crivellari@suse.com>
CC: <linux-kernel@vger.kernel.org>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, Tejun Heo <tj@kernel.org>, Lai Jiangshan
 <jiangshanlai@gmail.com>, Frederic Weisbecker <frederic@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Michal Hocko
 <mhocko@suse.com>, Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Subject: Re: [PATCH v3] drm/xe: Replace use of system_wq with
 tlb_inval->timeout_wq
Message-ID: <aWdKdllO8ZTRfYgp@lstrano-desk.jf.intel.com>
References: <20260112094406.82641-1-marco.crivellari@suse.com>
 <aWWz9pJ30Hxa0USG@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aWWz9pJ30Hxa0USG@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: BY1P220CA0025.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::12) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM6PR11MB4756:EE_
X-MS-Office365-Filtering-Correlation-Id: b0489a07-6a1d-45a1-6748-08de534168bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?v4OOqgCMj36xvGwzJlml4eDmRs1i3mpItrW8QjQuolTz2I3SNS9uUXx8VAd0?=
 =?us-ascii?Q?FLLjxE2CIT8LS+FGo8+Poup3Xo6b0XgbObklxKR59zIgBlKZGjiVMOv6fY1V?=
 =?us-ascii?Q?85D/VkjpX5SJTIaOOTZ5fdqxp58XYk0cvCinhyUjFoQpSuKyo4TgcjM312c6?=
 =?us-ascii?Q?bldHWbWiqduzmMABTcR8vvgohLTfwTiZNrMTh17RJRyWSZkIvIUbmunZ8O21?=
 =?us-ascii?Q?715qZ3AC30VfXIKl0I46f2GMJFbEHu5TJR5pwUSA0jyX5KNrM5FoJY4EXjo0?=
 =?us-ascii?Q?qKTlL4roiZVICm6faBSrL5szAMjVLBkZBa+EZZEYMJRffYboOk052BAbMR1W?=
 =?us-ascii?Q?zpn4RJzkZqL6d39c8E4+a64XMn2P5rVeJ4A44V5DsDzs5WEcB1Az8YVwuxWm?=
 =?us-ascii?Q?tlMCQkrUOvaORKXeJCl7sN26CQ0tA4eAVKRDd0uxTyyv6uMuV8CS6sZD2f1E?=
 =?us-ascii?Q?PFQYZdKo0L+8WOTdeXYHu/HKXlWArV791fdQtLJibtbYycvZSXfJbQKyrYw+?=
 =?us-ascii?Q?KlDwi0Jtv9SSJ946rIo5uUQW1ryDqFSnq+h42pvLp5AQOdUwxZX328XSlaeY?=
 =?us-ascii?Q?e5o6+KTNJaMfMUHWH+A7rfpSA+TBRywY8p3FJlJFwn15AGSbuq8491Z9JJFU?=
 =?us-ascii?Q?JBKmABx3B60MRTTP6Fb/VfqJBlhiE9Dxjrf8FEYuOUuyob1LsKnfVnkc91Q0?=
 =?us-ascii?Q?lsZIUFJbR1M+XtrhFRx81/ETBgocp6LLqcu5dmJPKdlKApEM4ZJ/IvAc3TqC?=
 =?us-ascii?Q?87ZTNLjcNBUaJ/yX752e3FYBR7JIoBaaD5/dVBBzyYWU7qc2WhW0kU8JTbR8?=
 =?us-ascii?Q?NZOVUEdTdsUV2T0oT6OWlAFDJODqikyzV10lE3mdytgFbkChwdALaEguHs0y?=
 =?us-ascii?Q?gZQfNnds2kKVKmfX/EKg4VTYbn0vTNqSkuqz2P4TafvR4Lt3RIiz+B/S6m4F?=
 =?us-ascii?Q?ERIWGUcqNuCo54KQPQrTMUrO8OBOGF4CosmTvJkF1ZJscbD6Iuhwl9HQ8FBl?=
 =?us-ascii?Q?2rnCUmN6vS8/agICuCuOa7GLY7tPAPeTGcgp2myHf0leoXq/9sSWxHIWg6UK?=
 =?us-ascii?Q?nImZjuTyDVGQB+cdEw8LZCPtwOUy+yc9I/4cUTG70FbKqL+oahojCIq8j74W?=
 =?us-ascii?Q?3g+NTVL8ryGozlWNE7+yIK14zzgwAiFbuRs1EqtZ3vhU5ytGYYagTrNpEi52?=
 =?us-ascii?Q?VtUBHZy3GOELjxT88Ovsd40JnDLL7G4432Wl7Lbz/KazhU2rNViKQlyFa6D4?=
 =?us-ascii?Q?lH1FWXcFv1fdSZ9pLZO2NO9ldHjCSrPTBg+bxnvZggHhrxg6r5e2A0a84qCG?=
 =?us-ascii?Q?9HRvmGojQnKmK9wfKMAxi98fLbgvxE8fay9lozHIswlbgzERWfecRm+bBZgn?=
 =?us-ascii?Q?xhSZOymT9jHKlnHbnR/fcj9Ixfw1xwoAFu4jguaEcA2u671MtHR7f3z395FP?=
 =?us-ascii?Q?ubqa95/Ilr2PyQSALxrau8bqQImTMgYfrx0eciC2P6neUeAq5mkZog=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YaDbcP4PtvzfsneJm2l0+2AqGgj43rGX/RQCzstZLE4T7sqB1zFR70dCURFX?=
 =?us-ascii?Q?lxaoX5BzFh1nlrkFaQzAXaLBBE2jD5/bGRMouoh05E3WS9NyofIgis17HWur?=
 =?us-ascii?Q?ylGZeqVDvxzTLkfq3/hiklY9nkZDwPwISVyJI+6uNwvAApjwVPWqhDxhavGK?=
 =?us-ascii?Q?QOgSP2auaBBXonAN76n8ERiU5w4X0xmMa4CKPcxQgM3VAE/TF/jGR0TpW3rI?=
 =?us-ascii?Q?yZSMHhh41DFR/Q5gj7SiBUyKP5mC8AGQJlmq1z/LYHT1RpXAiIa+eXW2Snqu?=
 =?us-ascii?Q?F/deUyVsglbq2Y/wOCssKMWRkWrC6E42wQienF3aCz3iej4NyFaWXnKesc2E?=
 =?us-ascii?Q?W99QY03ugSFGIhKpoFawGse7XsWErKoyPxKEr56WlHXgfkh0wJe0t4YFDfIY?=
 =?us-ascii?Q?mBmgd8ycA3Leg6gTlK0VHDhxE8q5a/Va0TujH2Kh/UMW2dT+I7ccwpYKlDsN?=
 =?us-ascii?Q?sgoBK3PeIpBIxwPBAM0TZfuvsWoSByiptjbme/FeqtOqGT88s7uXhQ7qaijw?=
 =?us-ascii?Q?RvkfqtrNwSXZuvBJZ482ylRFS/JzlSM0+qjZoXQNZ0uYwg/fp6LuqZkR4LE4?=
 =?us-ascii?Q?gfUKrYt6NsL1elhyal+NDrT5xwTkjFr6wjCBetEy2j47vw6TWP9639g4Etir?=
 =?us-ascii?Q?lWbbQ2IOm34GmJ3DaRJjPFvbuLu67IUO46FrTKHb8/TiI/whXOfRouoSvtij?=
 =?us-ascii?Q?ZOsFdISS1aVvpuk5hLNwhs5WfXf8r3mFjZxBlSkxwYhWYmRSNYxuAXk1gEol?=
 =?us-ascii?Q?VccpVti1RmqsXhSumcZe7KT8aFrrOdHnNQN/2hbI8/rwBUbcRnywTCuQHCT1?=
 =?us-ascii?Q?iOKtnOOuQOmdD8YWxx9L9d6T/Bks0S/8hz2rpEGuR+XqgrC6m3gS70mvdvcd?=
 =?us-ascii?Q?0h99a3AjTl2KlVyZYiS9ZbuUxqpfaWst3scilUVXwotXedMyGnUnW3E5dlgU?=
 =?us-ascii?Q?pPUlXAlwtC0SjiPX7DPxt30ZpvHFoOMJ2W5ygGqpgHLLI3CKrBn6GAXObfkE?=
 =?us-ascii?Q?urkJa53zqD76XdfDGCrV1i0hH++QBb9At0EYE5QB+6CGsjbvKTxLsHA5eRff?=
 =?us-ascii?Q?1+CEQIcKZ9ggB5Zqt3lBGL7tHSSd6YNoxcbY+vDt1cCoGgrub3/SEadrT4mi?=
 =?us-ascii?Q?S/8x6KESvoNxP6v3bheBUhrJJW7+JRX/fJ1257vPAIC1SgFNXoypt9RhIMeI?=
 =?us-ascii?Q?7molSEL2rXEMxEgSwXzapKu2EwbkKrWfHDn9j2wad3Gt5dH8GO03jYqjHnXf?=
 =?us-ascii?Q?H25LxlyEA7Q6KlvLu7Kgeea6/s40xPU5Vtlg+dKccjoHWge+/jn2slPtHtXJ?=
 =?us-ascii?Q?6G7SEF56fwkedd9Z0vIaui/ymI1aR6wVx+GbgcH+piDfbfsvQkxBrEH3vi51?=
 =?us-ascii?Q?IWZso3OaZuIugNAozqWafpqvgDsLqahCo1Ug4WAghmk7VpnYN2X0UQ4By7ZG?=
 =?us-ascii?Q?vGpAAJBtHBxF+HcpIgNKHTPONH8bx3kLllONBfi4SGsWTMPggjC1hza1CHUV?=
 =?us-ascii?Q?LBGaTyrm5h9lTRZ5aCKe/jNdtk+L7p02cXrXOQaFnTHcaw+RbwyxwvNO9cHv?=
 =?us-ascii?Q?Bsg5Ny2gH3RGlCYy1JQbShRjQ6gfQD6tei1whIFTZa59tfOCAHpWDueMIuUU?=
 =?us-ascii?Q?ckA3vMIUEJLuCHfcLaxRVV9ElkTOywbpiyLuuVwouRqU3HRapWEso3HN+8Np?=
 =?us-ascii?Q?xGsLHThwL1OcU6DxtA5NJfgmkzRfpfHQN4he3vrB5IlOHL7sNgNXjsiIpe3l?=
 =?us-ascii?Q?3QG9be3lpcaWOWe+33p3/GHdYbO0vVU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b0489a07-6a1d-45a1-6748-08de534168bf
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 07:49:12.9812 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 96M77cb6Agc0XfUeSUGMJJqFPejr1b2hc5IwLrRLWH0G/qu9bsZhVRVl0OsRIJR+G4ixlAHl4HQJtjE7vN66YQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4756
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

On Mon, Jan 12, 2026 at 06:54:46PM -0800, Matthew Brost wrote:
> On Mon, Jan 12, 2026 at 10:44:06AM +0100, Marco Crivellari wrote:
> > This patch continues the effort to refactor workqueue APIs, which has begun
> > with the changes introducing new workqueues and a new alloc_workqueue flag:
> > 
> >    commit 128ea9f6ccfb ("workqueue: Add system_percpu_wq and system_dfl_wq")
> >    commit 930c2ea566af ("workqueue: Add new WQ_PERCPU flag")
> > 
> > The point of the refactoring is to eventually alter the default behavior of
> > workqueues to become unbound by default so that their workload placement is
> > optimized by the scheduler.
> > 
> > Before that to happen, workqueue users must be converted to the better named
> > new workqueues with no intended behaviour changes:
> > 
> >    system_wq -> system_percpu_wq
> >    system_unbound_wq -> system_dfl_wq
> > 
> > This way the old obsolete workqueues (system_wq, system_unbound_wq) can be
> > removed in the future.
> > 
> > After a carefully evaluation, because this is the fence signaling path, we
> > changed the code in order to use one of the Xe's workqueue.
> > 
> > So, a new workqueue named 'timeout_wq' has been added to
> > 'struct xe_tlb_inval' and has been initialized with 'gt->ordered_wq'
> > changing the system_wq uses with tlb_inval->timeout_wq.
> > 
> > Link: https://lore.kernel.org/all/20250221112003.1dSuoGyc@linutronix.de/
> > Suggested-by: Tejun Heo <tj@kernel.org>
> > Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
> 
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> 

Merged to drm-xe-next, thanks for the patch.

Matt

> > ---
> > Changes in v3:
> > - refactoring workqueue name from fence_signal_wq to timeout_wq.
> > 
> > - rebased on v6.19-rc5.
> > 
> > Changes in v2:
> > - added 'fence_signal_wq', initialized with 'gt->ordered_wq' in order to use
> >   it in the fence signaling path, instead of system_wq.
> > 
> > - rebased on v6.19-rc4.
> > 
> > 
> >  drivers/gpu/drm/xe/xe_tlb_inval.c       | 10 +++++++---
> >  drivers/gpu/drm/xe/xe_tlb_inval_types.h |  2 ++
> >  2 files changed, 9 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_tlb_inval.c b/drivers/gpu/drm/xe/xe_tlb_inval.c
> > index 918a59e686ea..084d996b818d 100644
> > --- a/drivers/gpu/drm/xe/xe_tlb_inval.c
> > +++ b/drivers/gpu/drm/xe/xe_tlb_inval.c
> > @@ -94,7 +94,7 @@ static void xe_tlb_inval_fence_timeout(struct work_struct *work)
> >  		xe_tlb_inval_fence_signal(fence);
> >  	}
> >  	if (!list_empty(&tlb_inval->pending_fences))
> > -		queue_delayed_work(system_wq, &tlb_inval->fence_tdr,
> > +		queue_delayed_work(tlb_inval->timeout_wq, &tlb_inval->fence_tdr,
> >  				   timeout_delay);
> >  	spin_unlock_irq(&tlb_inval->pending_lock);
> >  }
> > @@ -146,6 +146,10 @@ int xe_gt_tlb_inval_init_early(struct xe_gt *gt)
> >  	if (IS_ERR(tlb_inval->job_wq))
> >  		return PTR_ERR(tlb_inval->job_wq);
> >  
> > +	tlb_inval->timeout_wq = gt->ordered_wq;
> > +	if (IS_ERR(tlb_inval->timeout_wq))
> > +		return PTR_ERR(tlb_inval->timeout_wq);
> > +
> >  	/* XXX: Blindly setting up backend to GuC */
> >  	xe_guc_tlb_inval_init_early(&gt->uc.guc, tlb_inval);
> >  
> > @@ -226,7 +230,7 @@ static void xe_tlb_inval_fence_prep(struct xe_tlb_inval_fence *fence)
> >  	list_add_tail(&fence->link, &tlb_inval->pending_fences);
> >  
> >  	if (list_is_singular(&tlb_inval->pending_fences))
> > -		queue_delayed_work(system_wq, &tlb_inval->fence_tdr,
> > +		queue_delayed_work(tlb_inval->timeout_wq, &tlb_inval->fence_tdr,
> >  				   tlb_inval->ops->timeout_delay(tlb_inval));
> >  	spin_unlock_irq(&tlb_inval->pending_lock);
> >  
> > @@ -378,7 +382,7 @@ void xe_tlb_inval_done_handler(struct xe_tlb_inval *tlb_inval, int seqno)
> >  	}
> >  
> >  	if (!list_empty(&tlb_inval->pending_fences))
> > -		mod_delayed_work(system_wq,
> > +		mod_delayed_work(tlb_inval->timeout_wq,
> >  				 &tlb_inval->fence_tdr,
> >  				 tlb_inval->ops->timeout_delay(tlb_inval));
> >  	else
> > diff --git a/drivers/gpu/drm/xe/xe_tlb_inval_types.h b/drivers/gpu/drm/xe/xe_tlb_inval_types.h
> > index 8f8b060e9005..e5ff35226826 100644
> > --- a/drivers/gpu/drm/xe/xe_tlb_inval_types.h
> > +++ b/drivers/gpu/drm/xe/xe_tlb_inval_types.h
> > @@ -106,6 +106,8 @@ struct xe_tlb_inval {
> >  	struct workqueue_struct *job_wq;
> >  	/** @tlb_inval.lock: protects TLB invalidation fences */
> >  	spinlock_t lock;
> > +	/** @timeout_wq: schedules TLB invalidation fence timeouts */
> > +	struct workqueue_struct *timeout_wq;
> >  };
> >  
> >  /**
> > -- 
> > 2.52.0
> > 
