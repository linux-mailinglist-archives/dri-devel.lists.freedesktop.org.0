Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7934FC12262
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 01:13:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ABF710E1BD;
	Tue, 28 Oct 2025 00:13:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CqzcU9aq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BBF110E1C6;
 Tue, 28 Oct 2025 00:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761610432; x=1793146432;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=JO1NLV9Ulq6FnzF+fTnlMbnIkYaMI8WjFp+F/8f2ghs=;
 b=CqzcU9aqqnc6/1pm3Te+UFbwda1HJEKWvl0UAyTz85BIjmyZZFaLfBtg
 EUVVBC7xLs3VEM7YNWD4LZa7LzM8QTKC7eQzYA6U/f9W9HVzEF3zLvntc
 7uDAcq/O7fiCnqS86DGmLfMyDZ7Kk8yDfu2g5JltfjwaGqVVh661a8772
 pXafrxkw8SSrgGzrb22jqGEsQUpml5hDMnQ9X5UC/MsAm6lNkbUkj74zs
 EG8Ap4LLamx1JmPH3vACLlllxqjZV6bREEGdeiJoM+qp1GGTbvzhpundE
 UItFQg11ZfkUpDdHKXWqxTz7GKFcHB4A48rwzOqCJJhgUv+Euj7Fa84ik w==;
X-CSE-ConnectionGUID: 065f4449QyKvSGLLLK+4CQ==
X-CSE-MsgGUID: kLmc3UjyRcaX6KvDqd0RvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63739725"
X-IronPort-AV: E=Sophos;i="6.19,260,1754982000"; d="scan'208";a="63739725"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 17:13:52 -0700
X-CSE-ConnectionGUID: 2YjBRv1QQdibm6KsdFQ/mQ==
X-CSE-MsgGUID: tr5qi9fRSCuLESRKKRGa6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,260,1754982000"; d="scan'208";a="189556391"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 17:13:52 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 17:13:51 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 27 Oct 2025 17:13:51 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.37) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 17:13:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qlDUvVr6V6lZe3dKvreeNdghZRRzOuRm9zw4oSpc6cBhrpKIxXXm5mlvHCHZQy8SafHeN+BQIMVBPD/vSoyAi+qjQQfyP1fvYVGVgC9or9HZTh7LmCE5SHIJvizDLevrxZ0+TAgoAsFn7xkCBdlIOn2rkf4GaO2KaRrxpSjeCczkefOt/li/5uhfrX1cCvlIHKWRA2FB3oWBzwnWuaiMhome3M0lwN/WKoF7c2iI1iNc8BfRGcAe+zJv6axKPm6eqdygY+bNTPJTEmvHDXdK8VNXaGqEz1oh0xiBKe7CWTx5LWPtvZmcQE5meIi9TMULN3RqtV7FPMPOJWyigS1BJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ojnM1CmJhky35Nj64SvtJqT0Kpf2SrML0mnaQtC6hto=;
 b=qS85nq/bZTrJbtCMpUeegMnGENVOr6sk5lYUUlEI9xjLiKpvVrDujB/nbLKHoxnM0yVxY3tUxrx4OaRLureCXCLnJaNZu9V3c9KBnSTH3VZuuGDaZ24X7GouYsAmGGCHjzcie9A0ue++PuVW8PRUDvLtD7xMtFjtsbXLDV/8uN9MlSvsW9pq9Zv6SL3qsGB2NiYm2dwXr9LoBMohNjrLAEARMHUFCAeNBzYjXtiHYL5MtXaCRoqbp9tuUhsVFdKFUlhiGUnqeOofQ//sBjG295iiBm1WcsfzCu78fnI+HH0UFgcAoAAdiebLJPLXxS2OoI1H2EdHGKIny+W9k47gLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS7PR11MB7888.namprd11.prod.outlook.com (2603:10b6:8:e6::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Tue, 28 Oct
 2025 00:13:42 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9253.017; Tue, 28 Oct 2025
 00:13:42 +0000
Date: Mon, 27 Oct 2025 17:13:39 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <himal.prasad.ghimiray@intel.com>, <apopple@nvidia.com>, <airlied@gmail.com>, 
 Simona Vetter <simona.vetter@ffwll.ch>, <felix.kuehling@amd.com>, Christian
 =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, <dakr@kernel.org>,
 "Mrozek, Michal" <michal.mrozek@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>
Subject: Re: [PATCH 15/15] drm/xe: Retry migration once
Message-ID: <aQAKsw5nd+WVNLu+@lstrano-desk.jf.intel.com>
References: <20251025120412.12262-1-thomas.hellstrom@linux.intel.com>
 <20251025120412.12262-16-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251025120412.12262-16-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: SJ0PR03CA0265.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::30) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS7PR11MB7888:EE_
X-MS-Office365-Filtering-Correlation-Id: cf0fd01a-7563-4983-2cec-08de15b6da0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cHIwNVI4bytLR0pQOEZRbWxYbnIwb2xSTzY3VzZMUzhiRWdzYzROd2cxMTl0?=
 =?utf-8?B?VDZXWUM5ZktXSjVncjFuWU0vUGtZN20rN3hCUldGcS9IRnZBY3ZJVXRoVmYz?=
 =?utf-8?B?M05qSGxyQ3NrQ05Sckw5eTIyT2QzL05jZldxM0d1OFhHZDlPMUg5bk5PVEpH?=
 =?utf-8?B?TmpmVnM1RGswQWRud1RQM3c3VW1LV0kvamZpcXFPU3p5UlBTeDFkUW5YbUx6?=
 =?utf-8?B?M01wcWhMMjhldXR5SWVDalNTNUEvZ1NaS3pSWjJ6VjhUWTgwdldXenpZT0o2?=
 =?utf-8?B?MCs4SWRteElZc3hjaSt1WHV0SS9RYm82Q0FYUzM3QXFDQjZYYTQ2NW5lOEw0?=
 =?utf-8?B?eXZDbXZMNkF6cHVKTWVXTGVuc0NId3JGc3JnWnJPNldQUUkycmU4cXc5WElV?=
 =?utf-8?B?YzZReEZ4TU1qdXdvNzN2aGtVeWx3YkhtaGRkclBUUThWMkdSL1dhSDltczVt?=
 =?utf-8?B?aWRMZUQyTTk3aFJJOVRBWjVDUTByaG1CcnlpSFUyeWpxKzJLVzQ1K3JRNjIy?=
 =?utf-8?B?WXBHL3N3TUgxeVY0RzZ4NUtBNXV0ZHYwdHFCTGU2ZEhoajFuOVV6cWcrbTU2?=
 =?utf-8?B?dVVvb0MydFJoUSthN2dMZy83RXd4WG1ZUGRoU211aXJPeXRtZEVYSDZRMlNE?=
 =?utf-8?B?VDcxdlRZY2Z4cEIxVG1RVElnb0kvTEdwODJHTmI3d29RUEZ5VHVkZitBQXR6?=
 =?utf-8?B?eWlFNmVWOGxibzdVSGJPRVdhWmNiRjhxOStUQThUdUxyZkJHU0JFOGhSS1py?=
 =?utf-8?B?Q083VFZ3bXZCVUlQcmJxOGRvY0JvQ2VNTDdKZHE5Z2xMWldhNTFNNTJoWmUx?=
 =?utf-8?B?SG54QXhwMEdGZUxJQjBQaXliNEtiOCszZHdIVStMbUp4bHJVdGxhL3d1Mkhk?=
 =?utf-8?B?ZUUzRUJuZWtGOG1NVmV2QkZUR3ZDcTllVGV5Vm80VkszRkpXWGxqcGZEbkxE?=
 =?utf-8?B?VjB1VE1hOUtnUEorZlM2dW1WSjNKUmFPekhhdXN3bGJGVFhlNzljcVNIejIr?=
 =?utf-8?B?QmtRbjJtVkFJTWVYTDRzTDVKYjg5NFNxTUlvVFBTWU5HemVWSVVVQ1lVOGZz?=
 =?utf-8?B?MmFKN0o5VDlJQnJjL2RSTXRaRGFZM05UVkRlZXVhYVpMRXZJdmJWdFFhL3BH?=
 =?utf-8?B?RTJ0YkFlUVA0b2ZvNFlENzVxOEhEVzhMT3g5RUpYOG9SdGtpOWFaWG02MTZG?=
 =?utf-8?B?ZU8wRjRrcFhuNUp4Sk93WFhLcGNqcS9vMmRFQzM4OTUxaE4yK1IzTjJScDJh?=
 =?utf-8?B?QnVxUUtrY05MSXlGdmZwZmxlMHBMQ2FYL3U5RDBpaXE3N2k0akhqZWQvbkJ3?=
 =?utf-8?B?cDVUNlpvaUFyVVYvM0x3Q0lhQ2kya2o2ZkNOOFFJQy9udzdzYW55Z0Z3RHk4?=
 =?utf-8?B?TWtKWDNXZENqTXlORlRUTDZlUXFPRW9IR1JQMEhFeFdCbWlMOUJrVE1VeWVt?=
 =?utf-8?B?MWF2U2ErL29abDZCTHVNdmw1NGJTVUU1aTNlMGZ3YW94dG9CR3ptSU9RcnF6?=
 =?utf-8?B?bHNsaU0xVFh0NHg3V3o3M0FudC9adkEyN1JIYTFOWUMyNTJrNm9HRmxYTGhj?=
 =?utf-8?B?TzU2R1RmT0t3ZDJHcW9iTmNZWVI3bFltNkE3KzhvN1FJWmdob0MwZVRqc2U0?=
 =?utf-8?B?QkE2MGZSYlpqTGxFT1g5OEFOdWVMVXNwRHFKS3JuQmxJOTNkalZudEwrYitk?=
 =?utf-8?B?TXJLOGhnQXFoTlA3Y2kvdS9vK2pXMHNNVjAxVHRDcDl5Sk0zejlxYmdJUzhr?=
 =?utf-8?B?WDZNOWtndFJTamJQTzRsbkhuRE15ZHJHVjFQQ1VuWkExY25GUE1JMDlybkdv?=
 =?utf-8?B?RnN0SUpVWEJFaFpVOEN2ZFc3S3g5ZjArRW15NzNpQ0lVeXprdDRGTFVtNnJC?=
 =?utf-8?B?WE42Q05rWU93YzlIVHNZOXBMdVc3dkI3cmZEUjhZYXRRS3NaNWtFeFlLUUM0?=
 =?utf-8?Q?DMIJ/CYeTgdFiDjhUl+Ppph+cZ+CzEIf?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TjB3OG1lcXhVVE5CVkw4NGQ4cjcwYytqNUtOZFRNWDZGTmp6bmk5U1BLazMy?=
 =?utf-8?B?VmRKbXhEMVFuUktDNTQvZmlacUVCSFJUemNab1hxdjJkdDB1K25KaDBwaUhC?=
 =?utf-8?B?YkMvWGFsZkN2eTRwOGxXZVE3VHNyWkh3d1pkV1hzL2VrSS95YXB5OFVJaFd0?=
 =?utf-8?B?ZUcwSEFUaWhNQ3hHTWtsZnE3b1hpYURMTHlLdTlreUdlanMyNFhBT3JwQWwr?=
 =?utf-8?B?TE16emlFMlVOTWtDNEdGZnBycU9PSkYzOTRoeldkcEoxQlR0bmNLejVGQmFK?=
 =?utf-8?B?dmZuSEsvV3NhckE5NkxndjRKT1ExMnJPWXRNdXdaUStzL3NacVU2ZU8ybGd5?=
 =?utf-8?B?M05VYkMxV3NWMGVKaGlmY3VYcVM3NjBjT0VCUVozQURtazVwOUFxaG9CbzRV?=
 =?utf-8?B?N2t5NG96UG83dTN4TGdCTzNzRHZRVGt2R1NIVVBTNkREZXdEcXlLVjAvQVIv?=
 =?utf-8?B?YXRDSVpPdk9ZWWZ4OTZMS3hIbENUM2lNUDQrdGowZnk0SThkTU1GUVlJdk5p?=
 =?utf-8?B?MjBWaDV6QXNqMTRpZmp3L0RiMStmTzBOSXZHVm0xV2xkV3ZwelJFbTBzcjB4?=
 =?utf-8?B?cDJrYy9sdVZiY0pCdS81aU1Xd3pnQTVaTHlqd01VbVlqUWFyTlREOEw0RUVr?=
 =?utf-8?B?Mml3NjBWSHl2UDQwczBibDNHWXhZVmVQRUxUTE9oR0tZemgraWdUcXVTSkNG?=
 =?utf-8?B?azhtSkFwR0pFWmo2NkprRFNmQWliZmVFekc4TEFwTDdUNGxCRjZlbXhGampa?=
 =?utf-8?B?Q2xoWDNUbDRYQ2dGTmg5R1dtbXhMU2RJTVlXVnlNOGRLMWcwSmt2RnR0alVW?=
 =?utf-8?B?bmtEU0RSanZYNlhuaHdlMUF0d0pwVVFJTTdKRDdPRG0xYzAxdndaakRsdzlG?=
 =?utf-8?B?TS8wVUdjeWFKYjlpem9XRFIwRHlsU1hQRnZHams4bU1JYVdxaFNaSlRNcVhF?=
 =?utf-8?B?ZjBMbmJjSnlvR0tBMWErbC9qa1d5d1ZYbE9wUkxvWTdKNVk4N2xFeDVDS3Vk?=
 =?utf-8?B?YUc0aWFhVW1mamRnVFdPN0RqWUw3dmZLTytQZGxBUVRJdFQ2S2I5eG9JNlcr?=
 =?utf-8?B?djY4aVVpQ1RISTlSYjQ2bzg4dVdvV0xPQnNoTXozemlLL20zaVZpTThaNGVO?=
 =?utf-8?B?RUlSYmJpWjVHU0o2VWVSUzN5MUk4MEVITk1neXp0M3hIUTM1a25GN05qQlBy?=
 =?utf-8?B?eHIxR3dGWmtXM2VpYm01UFpyTXhUNXF6RmVyN2tGTkhDaHA4QW1qUkVwRGl2?=
 =?utf-8?B?T2V3ZWVsMldrbmFhaG1RQ3dtYlFNdE5CNlVOYU9RRXlzZEFwNGlFZGlVdVNK?=
 =?utf-8?B?TFZ6emtKenpFNGJBc2FMak5jc0U2aHpIbnltZHpFdms5amROanlDUERSTG51?=
 =?utf-8?B?VjRVWVZEdklnUmg1TTQvUm4zVllYNzY5N1dqUHFWM0IrWmdYbWVzYlNyT0tN?=
 =?utf-8?B?T1RROVdwaEIyQzhmTzk3WElqT215Y1hITkpQd29kK0xnUFUvZVFYZW9UbFhw?=
 =?utf-8?B?VXZFL0JEUkF4c1dtWGpLK1kwZzRwdXB5bXpKY2MvdFRkZktYZ3I4Tm5OM0Ev?=
 =?utf-8?B?T2tkU3Y4TlJVMmVBSzlUejR1TVFnU1NRL3BLUUIvVjZGQm9wR2t2MERzYUJF?=
 =?utf-8?B?NGs5cVBUdGZ3RlN1akRnVHMreSt2OGZISEVKOE1PUVdkQTdhSFovY0R2b2V2?=
 =?utf-8?B?NXNmb2EwbmFIU3ZMZmhtL3lieW9iNERFMFZFVHhxaWNaWGJHY2haNHg4TUhP?=
 =?utf-8?B?aU9Ha0p2VVZiQnNLbFJzKzFNdGN0L0tIblZadUlPK2NuVnlxOUI0UUhZNU9X?=
 =?utf-8?B?MmhKK1V1am1keVJUL3Mra0ZtSlY0REF3YWQ1S3MwVWdGV3IxdThFVzFteXI5?=
 =?utf-8?B?dUwyT3VQbUpUcytjMzJpR0wxdEc3RTlNSFRlNFhMeDFVVlVaSE8ybmFaTDV6?=
 =?utf-8?B?L3VJZEpmSlRWamNNREp6UWM3ZHNoaFlOL3ZWVlJGN1MvWncza2F0WlZDSU1z?=
 =?utf-8?B?Rk9lRFZrT25wYjRiK28zN0VZSEFlTjk4U1pRdlZNZDJCOTVkc0YwcWlGVFNi?=
 =?utf-8?B?djN6dFZMR2JYd0wzOGk0aHZxb1NlazNWTjdCdEpFaFpGcjBRZEg0MHhKbG55?=
 =?utf-8?B?eXRDMHUwNUo5RkRTdDhkNmpDd3EvYXZwU0NZcG84bkxuYWRDNWpObXFpRlpV?=
 =?utf-8?B?M3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cf0fd01a-7563-4983-2cec-08de15b6da0b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 00:13:42.1728 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3R8FizeffWLMpPRJVqze784OOouO6a1o1AMQsQX5x0ZyjlJz8GKIprlbGFjSwBsUgTza9tNE6jTnkgf0QA1Bow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7888
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

On Sat, Oct 25, 2025 at 02:04:12PM +0200, Thomas Hellström wrote:
> Data present in foreign device memory may cause migration to fail.
> For now, retry once after first migrating to system.
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/xe_svm.c | 19 +++++++++++++++----
>  1 file changed, 15 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index 9814f95cb212..41e075aa015c 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -1529,13 +1529,24 @@ struct drm_pagemap *xe_vma_resolve_pagemap(struct xe_vma *vma, struct xe_tile *t
>  int xe_svm_alloc_vram(struct xe_svm_range *range, const struct drm_gpusvm_ctx *ctx,
>  		      struct drm_pagemap *dpagemap)
>  {
> +	int err, retries = 1;
> +
>  	xe_assert(range_to_vm(&range->base)->xe, range->base.pages.flags.migrate_devmem);
>  	range_debug(range, "ALLOCATE VRAM");
>  
> -	return drm_pagemap_populate_mm(dpagemap, xe_svm_range_start(range),
> -				       xe_svm_range_end(range),
> -				       range->base.gpusvm->mm,
> -				       ctx->timeslice_ms);
> +retry:
> +	err = drm_pagemap_populate_mm(dpagemap, xe_svm_range_start(range),
> +				      xe_svm_range_end(range),
> +				      range->base.gpusvm->mm,
> +				      ctx->timeslice_ms);
> +	if ((err == -EBUSY || err == -EFAULT) && retries--) {

I don't think this is what we want to do here. -EFAULT indicates that
the pages are entirely present somewhere in device memory. This could be
either on the local device or on a foreign device, but we don’t have
enough information here to determine which case it is.

If this is on our local device, we're always good. This could occur
playing mremap games.

If it's on a foreign device, things get trickier. If our interconnect
supports atomics (e.g., UAL), we're still good. But if the interconnect
doesn't support atomics (e.g., PCIe P2P), this an atomic fault, then we
need to move the memory. Also, if there's no path between device
memories, then of course we need to move the memory.

Again, we don’t have enough information here to make the correct
decision. We really need to call drm_gpusvm_range_get_pages to gather
the CPU pages in order to make this kind of decision. Ideally, the logic
should be built into drm_gpusvm_range_get_pages to understand atomic
migration requirements.

Once drm_gpusvm_range_get_pages returns, we can take appropriate action.
Initially, for simplicity, this might just be a bounce to system memory.
Later, it could evolve into a direct device-to-device move.

The logic inside drm_gpusvm_range_get_pages would likely involve
devmem_only combined with a drm_pagemap passed in, which can detect
connectivity and atomic support between devices—based on the drm_pagemap
extracted from the ZDD.

Let know if thia makes sense, or if you have thought about doing this in
a follow up.

Matt

> +		range_debug(range, "ALLOCATE VRAM - Retry.");
> +
> +		drm_gpusvm_range_evict(range->base.gpusvm, &range->base);
> +		goto retry;
> +	}
> +
> +	return err;
>  }
>  
>  static struct drm_pagemap_addr
> -- 
> 2.51.0
> 
