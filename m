Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C71CB1351
	for <lists+dri-devel@lfdr.de>; Tue, 09 Dec 2025 22:36:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2926810E21D;
	Tue,  9 Dec 2025 21:36:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="clgnJafl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ADD810E1D0;
 Tue,  9 Dec 2025 21:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765316191; x=1796852191;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=gg/BDTWJrwdB1QkBfL4nnlKB9R4tVv9fo6k0Hii5Lvs=;
 b=clgnJaflrs3/uSFUOjnlK+sYrIHngmPAebnmaFTqWytaJuM8E7jBDuar
 ucwQTYxqZXLOOSS1Yks+g6m/xaBlkvNCw7buku0rDvHMK/LFxVBE/Eac1
 thB2J6492UCWZprr70UmFTBY7o2/siQdtYyJABm/2ot0F65y8UbrctEkJ
 bFuldBl5mjg4uxOZZp53LmCfUZdXwoVSMP48sdbPjo0QZ/coIWtbU50/u
 MzQAk5QVBdjT1VekbeDYSUlL1Sl2vgnFImZMqtcQXJgvh2y54dzubo1+M
 aEGeyImVkklYPuD2p1S4BslJ5bwleK2aH9KRyeJNuG2hDZP789HUVlawj w==;
X-CSE-ConnectionGUID: rKE7GyZKS9aY0ifB3bkMmA==
X-CSE-MsgGUID: jN4JNr9JTbKPuPVwmb1QkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="67359083"
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; d="scan'208";a="67359083"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 13:36:01 -0800
X-CSE-ConnectionGUID: F99RQWP/RMOMpQojXdbVYw==
X-CSE-MsgGUID: eVCy7lnvQ+G/f5EMzWQv/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; d="scan'208";a="196246275"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 13:36:02 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 9 Dec 2025 13:36:01 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 9 Dec 2025 13:36:01 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.67) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 9 Dec 2025 13:36:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zEcVLwoacCp4+y+j4MZ4z9w/g7HGzyFc/DzKCdGtR1MMsVRMVvtOf9nwg8PqHKF3nlBP6SWcz3hfZTdrHbO1mE4Ex0+k72CHDLWkB3MJ8qxT/Y8kCFHIwdT56T7zOa611gy8tT9yWpJ754Icu6rZKqEkJpRR4Jv6+d/9o7mU0Ii22TVlpeHQR4x50sAtNk3M/re87YfteyXPzbCROS04KVmrIUXNsFTIn07vvM9HLMbyrWJPC0tVKNv9w46WUyME0hqHNpoOxmWMvTQjwv1u8g/i3GSLUZDHphtbc8QFO7h2oym0Er0QGF3HaCgF9hv/9FjGwLoFSTAoxo3J4JFYWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NHwvNlV60UpCI6ONXKDa95wDjA+PEbkiyi1MxYv/qi4=;
 b=GSVNZ5FPlcUTxfOuAF9F7AM+6LSe96M8r/Fkv4OtWO7r2RVEZHk45QjMsjfmYcVPkqjP2liqn3aQbOO0eTDgtzGb73jEKVOFYBoR6uqKXdXRqfaMsNfRstoAQHkFzdjj2amoGpskHE7pfBcSgXrmO6UzDl/VLVIHzulhsXoReI/WNw4KqmIjAFaiWMTLZvO88lWLio7x7TTsFjJbG7iguW7lITpfjaYpJuALVSE3Xu/A2vmuXCMkJLZjQDfKdWAHXfOcnUHporolgUiVIJP+O+lc802l0i3F5Ier/hMllthfyCq6iO0S40paL6NgZ81caB8A1ZZOKheC9zCFm+x3kA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by SA2PR11MB5020.namprd11.prod.outlook.com (2603:10b6:806:11f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.7; Tue, 9 Dec
 2025 21:35:57 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9412.005; Tue, 9 Dec 2025
 21:35:57 +0000
Date: Tue, 9 Dec 2025 16:35:50 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Riana Tauro <riana.tauro@intel.com>, Jakub Kicinski <kuba@kernel.org>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <aravind.iddamsetty@linux.intel.com>, <anshuman.gupta@intel.com>,
 <joonas.lahtinen@linux.intel.com>, <lukas@wunner.de>,
 <simona.vetter@ffwll.ch>, <airlied@gmail.com>, <pratik.bari@intel.com>,
 <joshua.santosh.ranjan@intel.com>, <ashwin.kumar.kulkarni@intel.com>,
 <shubham.kumar@intel.com>, Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>, 
 Lijo Lazar <lijo.lazar@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>,
 "Jakub Kicinski" <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 "Paolo Abeni" <pabeni@redhat.com>, Eric Dumazet <edumazet@google.com>,
 <netdev@vger.kernel.org>
Subject: Re: [PATCH v3 1/4] drm/ras: Introduce the DRM RAS infrastructure
 over generic netlink
Message-ID: <aTiWNkGmwFsxY-iO@intel.com>
References: <20251205083934.3602030-6-riana.tauro@intel.com>
 <20251205083934.3602030-7-riana.tauro@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251205083934.3602030-7-riana.tauro@intel.com>
X-ClientProxiedBy: SJ0PR03CA0064.namprd03.prod.outlook.com
 (2603:10b6:a03:331::9) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|SA2PR11MB5020:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d180c6d-52a8-443b-2c6e-08de376af043
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?Bzd95izyJMYkLBtGeWEFNueINzYxeJY/UsHsPLl11b/aCed3dmgcfJBqPm?=
 =?iso-8859-1?Q?UUTvtWwTrtnP0m4bjdIyRwGQh9Kfqzs0xyEcJr6wvGjIRAd3JOTU+uXhNs?=
 =?iso-8859-1?Q?aLfVs08OUC1ex+TffV1mRjvXTeYhXV3MlZxtec3Il1xWLq6sHRCB7lpQE2?=
 =?iso-8859-1?Q?V6xQq0OHQmkuusc8hZ1M6VX7Yr/KqiwhSHrw+HSk+poya7fiP0gsV8/No7?=
 =?iso-8859-1?Q?7EZu2fDSOrKb/uW57I/HwR7C3o+Fc/xfAydX7hStS6neW+XEO6eldzxiTA?=
 =?iso-8859-1?Q?Rl2GF8BhgnawRuA0SlZGVRdZeFDqPR9purbA+pSFPkdeb5E51d6LEAITNh?=
 =?iso-8859-1?Q?IjWV+gA3bHmnS2A/HwTqYmzo9ydAokuG0yDt7VumAgRwIrLS2B/ewLl5oM?=
 =?iso-8859-1?Q?6MACgu5CIG74w50YMvDeWTeYsHfzxe4/F+eGQyx+LF/QdK2QlJxku4K4j8?=
 =?iso-8859-1?Q?ThCEhGTm6FEDKL0Sg5+OhGGQkdOQSSlo8J7cyf6tai7Egg7D54bRQXZ4kV?=
 =?iso-8859-1?Q?29HSWOnH6GP0g8QYxVRqhrDxRl+8f171s55FeEZPjZKpRgsLOMwWKK4nGX?=
 =?iso-8859-1?Q?V6wcj98g/3u/qBM1KQopI8UWbturgrMj8z/QsbdGPkandioRFWfHQ2uXyx?=
 =?iso-8859-1?Q?wAKxUCQlWzpDY7OW3WNmx4L69n7C6TRKg6cFSHMPTN0A5mU+k+WZkUvG+l?=
 =?iso-8859-1?Q?u/swIweAfFMJLKRvwrVpwww8GOFAl2IdC4Cv1GbkcS9H9SrAQT8emIRA8U?=
 =?iso-8859-1?Q?EHAwZumStxQQAqOUKh6cqn4zvhcYGdpi6tkGtRMzqK3a/aCehu66pMqG70?=
 =?iso-8859-1?Q?kkylq8g8feWdmsVsWR7YupvL4j+W3EAEEf3JeXBkJTpQamkXcwnEnZbI7N?=
 =?iso-8859-1?Q?uf9aLB7/Xpg9ab15sLD2n36qmomvjC1b+KIRY7b55ljH5FisW2Cj+IU88K?=
 =?iso-8859-1?Q?z1Wf0m0rELWTT7sHnBfJgRuZu96IzCVQGnXIngoZ57NnvUKjMlc2mfv7Z3?=
 =?iso-8859-1?Q?D7leSal7g+y1BcN49Iv80+ZR8yfE/rYxged8z/lCkW8/cY7NN/OjLCi8D6?=
 =?iso-8859-1?Q?PFX4DelSp2gv4MXc9GiEwWCuPxsjV2abTehPSl/QN5bc/EQvYTk1VYMCl5?=
 =?iso-8859-1?Q?py5ju9a2rM5r2pBX/Hdj3OsyeQGTYwr7quFfT2yruAvFsj3ltkWSDIuXqm?=
 =?iso-8859-1?Q?k7P0v8Nqd0a7xNxb+7Vb9AbprRoTRr+kAOX+0Mf4jaDSKTigVjYXYXup3r?=
 =?iso-8859-1?Q?lxMd/VzfM0cMmHiJWz9BqMQUvYpynosb4qb6hgj4P09fmNTf1Ylp/+bHzj?=
 =?iso-8859-1?Q?KXbUmVT3xbSt+bmkyWLmzOVv7QHYr3lyLDMA5S+i0Io/P/bcjli6klqZMv?=
 =?iso-8859-1?Q?fOTJ9lU38L3awq3YSSBU3oS2o81sBWMnrd628uGqPLZGVrpXrk+ltKlurX?=
 =?iso-8859-1?Q?JzPR0luA9421QjdH89j6HzrwePkt+gkKFmE77hxOkjYG++zKCnz1bZPud0?=
 =?iso-8859-1?Q?dJE9I37gwC+Vo/Ia/TWG8L?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?jO/z3n6fMV59ZzcydZQf3n6xyib5OZ/tI0vvCcSMQVWe80C9Y/uzeSQ8TU?=
 =?iso-8859-1?Q?HL8bxFXQgiWSzN+s/8MNlNcC6QHIOn370DyRjUrYFeWSZkqs2LK8ea3/nN?=
 =?iso-8859-1?Q?srXw9bqMLFAFXSHz1C2JpN3mehk0VzamFqoEdK3aVwRJSoCAe7xjy+aCu4?=
 =?iso-8859-1?Q?/gNZxQDYyqu35iW6l5YuAgx9sSqL00yADHChnMD+JNf+jOrbmf1NjGjx/k?=
 =?iso-8859-1?Q?UdZihpwDTDDFcLOzMfKpZKRMKqFRDWt8PRSPPu0Uqy2KmuyqYRdTLLjKWg?=
 =?iso-8859-1?Q?Ydyy/UR6qyvKsaQ607a3cdxxhtx/JO9VIgUFpLc2IuSSU4T2+9JboBeqvz?=
 =?iso-8859-1?Q?0l9215qEsH8UDdbsbJfqbYhg4r79gJQU7rB0sWedAZZvQrYTZKb+kGc4s7?=
 =?iso-8859-1?Q?BahfbA7wO1qEDyGuV0C0qdraWqamCYRxpyR6Op6Hax7KeFIfMeT7+C7bIj?=
 =?iso-8859-1?Q?tCQFN8fKnlo8KIsnp3qoBZ4LsoYBo6+XK5fJOwrKO0EIAz6QC207TRPqOx?=
 =?iso-8859-1?Q?h3gF59MPClRQmvOLBcFj4xDTyhPDXCcrJ3pyJlroifItn6Ex7P+tutLFkJ?=
 =?iso-8859-1?Q?XgYbMmkiRIafEwJKU2j45yLVxDmYKWU53GWkt7s64rR8eG6+RlDwmwNWth?=
 =?iso-8859-1?Q?v993ChrenA5l8HYJ8xtqbanaAhIE4Z02etNh0vpuEW937rLUt256hQuQS9?=
 =?iso-8859-1?Q?HyHY6WXiLVY42uL1L0s3TkhajJZPsTIj8VmU7UmO9I3b1loi8ZXZWx9iAZ?=
 =?iso-8859-1?Q?YLcaefEZzKrTmxRydTUJWsLOY2b0hN6PYVqPicVzNtxKS2rKSc+PhoOLNn?=
 =?iso-8859-1?Q?9JeKqRQkBR4fWn0ABC3k2Cg0J8ywRJGDuplPmMMsZr+CQafrb+hx1L9tD8?=
 =?iso-8859-1?Q?6PyrreHuTXtzFF/1w7HyUtYCLvZpJqvUVU5DAWRVlRcMTozp2NxsYaVnBJ?=
 =?iso-8859-1?Q?YwyfCn7HGLzwfTOKDzKVqFJUIqXSRPqw31/M80q/o9K1Vd0ZmYiXKy/086?=
 =?iso-8859-1?Q?6EZu8MnjTgYRv536ySZwQv0qKTmjJRHhsyUMMrO+Ini3fJINxXf5oSF3v8?=
 =?iso-8859-1?Q?x68ne5WJY6aQuUoO8KgMe+TN0CylNCf9VmUSx2CK0D9xjmD8B5NdOHlyDa?=
 =?iso-8859-1?Q?CyyyY6M9QsqcPAwmFoq5Top6yLZEkOBTvYB5A+Nf08I7qPCvK5Ytjq4FmZ?=
 =?iso-8859-1?Q?2PtvNXSZcgTMxj5XUDTcqvH32TetfUX2YB89vkHcrfG554ccdCgn3Gs5rI?=
 =?iso-8859-1?Q?LIYg9UgU30XiRu1yPPAbWHwmTc9pZ5K0d2jhDpkB+6wIX9W6B6L9YnWRUI?=
 =?iso-8859-1?Q?9VybK/TciBdhqhZOegnqvpDdK36TsI/s6IyjI+ZLws29dp8oyLJ0apW0fu?=
 =?iso-8859-1?Q?ON8ro0pVMihLhipQgPfo7MhiJyD5LU/6vzi3k1hgbKB+hcpzpPwjEI7VgP?=
 =?iso-8859-1?Q?FWo0aKI3tPtcNKyCBrdDYr3Jgsedu/E73SMjAoOaDYjYzVpkTAgeSfg8Xv?=
 =?iso-8859-1?Q?zKAgUnDsNqk2FznlaqOhUUjreG1S26NUEFCDDqnE3ZFnMbWNBZ43Z6kWMq?=
 =?iso-8859-1?Q?Mg3uhRdvhxbxXk33pUnKbNDPyelcwQRaM06q5d2TabXzbQToKzGkcIjLhp?=
 =?iso-8859-1?Q?jdFAUobi5a82YjXegnjjIn7ymdseA4VLV9?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d180c6d-52a8-443b-2c6e-08de376af043
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2025 21:35:57.4609 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TqSGD6pc5CfHRFI0Vfokp3lQ57HrKv1erdNWQuLsCdJfKlzWK+WHQKLIQRlTV5q9qVsrB1HNuRTWmX2Kzvt0HQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5020
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

On Fri, Dec 05, 2025 at 02:09:33PM +0530, Riana Tauro wrote:
> From: Rodrigo Vivi <rodrigo.vivi@intel.com>
> 
> Introduces the DRM RAS infrastructure over generic netlink.
> 
> The new interface allows drivers to expose RAS nodes and their
> associated error counters to userspace in a structured and extensible
> way. Each drm_ras node can register its own set of error counters, which
> are then discoverable and queryable through netlink operations. This
> lays the groundwork for reporting and managing hardware error states
> in a unified manner across different DRM drivers.
> 
> Currently is only supports error-counter nodes. But it can be
> extended later.
> 
> The registration is also no tied to any drm node, so it can be
> used by accel devices as well.
> 
> It uses the new and mandatory YAML description format stored in
> Documentation/netlink/specs/. This forces a single generic netlink
> family namespace for the entire drm: "drm-ras".
> But multiple-endpoints are supported within the single family.
> 
> Any modification to this API needs to be applied to
> Documentation/netlink/specs/drm_ras.yaml before regenerating the
> code:
> 
> $ tools/net/ynl/pyynl/ynl_gen_c.py --spec \
>  Documentation/netlink/specs/drm_ras.yaml --mode uapi --header \
>  > include/uapi/drm/drm_ras.h
> 
> $ tools/net/ynl/pyynl/ynl_gen_c.py --spec \
>  Documentation/netlink/specs/drm_ras.yaml --mode kernel --header \
>  > include/drm/drm_ras_nl.h
> 
> $ tools/net/ynl/pyynl/ynl_gen_c.py --spec \
>  Documentation/netlink/specs/drm_ras.yaml --mode kernel --source \
>  > drivers/gpu/drm/drm_ras_nl.c
> 
> Cc: Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>
> Cc: Lukas Wunner <lukas@wunner.de>
> Cc: Lijo Lazar <lijo.lazar@amd.com>
> Cc: Hawking Zhang <Hawking.Zhang@amd.com>
> Cc: Jakub Kicinski <kuba@kernel.org>
> Cc: David S. Miller <davem@davemloft.net>
> Cc: Paolo Abeni <pabeni@redhat.com>
> Cc: Eric Dumazet <edumazet@google.com>
> Cc: netdev@vger.kernel.org
> Co-developed-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
> v2: fix doc and memory leak
>     use xe_for_each_start
>     use standard genlmsg_iput (Jakub Kicinski)
> 
> v3: add documentation to index
>     modify documentation to mention uAPI requirements (Rodrigo)
> ---
>  Documentation/gpu/drm-ras.rst            | 109 +++++++
>  Documentation/gpu/index.rst              |   1 +
>  Documentation/netlink/specs/drm_ras.yaml | 130 +++++++++
>  drivers/gpu/drm/Kconfig                  |   9 +
>  drivers/gpu/drm/Makefile                 |   1 +
>  drivers/gpu/drm/drm_drv.c                |   6 +
>  drivers/gpu/drm/drm_ras.c                | 351 +++++++++++++++++++++++
>  drivers/gpu/drm/drm_ras_genl_family.c    |  42 +++
>  drivers/gpu/drm/drm_ras_nl.c             |  54 ++++
>  include/drm/drm_ras.h                    |  76 +++++
>  include/drm/drm_ras_genl_family.h        |  17 ++
>  include/drm/drm_ras_nl.h                 |  24 ++
>  include/uapi/drm/drm_ras.h               |  49 ++++
>  13 files changed, 869 insertions(+)
>  create mode 100644 Documentation/gpu/drm-ras.rst
>  create mode 100644 Documentation/netlink/specs/drm_ras.yaml
>  create mode 100644 drivers/gpu/drm/drm_ras.c
>  create mode 100644 drivers/gpu/drm/drm_ras_genl_family.c
>  create mode 100644 drivers/gpu/drm/drm_ras_nl.c
>  create mode 100644 include/drm/drm_ras.h
>  create mode 100644 include/drm/drm_ras_genl_family.h
>  create mode 100644 include/drm/drm_ras_nl.h
>  create mode 100644 include/uapi/drm/drm_ras.h
> 
> diff --git a/Documentation/gpu/drm-ras.rst b/Documentation/gpu/drm-ras.rst
> new file mode 100644
> index 000000000000..cec60cf5d17d
> --- /dev/null
> +++ b/Documentation/gpu/drm-ras.rst
> @@ -0,0 +1,109 @@
> +.. SPDX-License-Identifier: GPL-2.0+
> +
> +============================
> +DRM RAS over Generic Netlink
> +============================
> +
> +The DRM RAS (Reliability, Availability, Serviceability) interface provides a
> +standardized way for GPU/accelerator drivers to expose error counters and
> +other reliability nodes to user space via Generic Netlink. This allows
> +diagnostic tools, monitoring daemons, or test infrastructure to query hardware
> +health in a uniform way across different DRM drivers.
> +
> +Key Goals:
> +
> +* Provide a standardized RAS solution for GPU and accelerator drivers, enabling
> +  data center monitoring and reliability operations.
> +* Implement a single drm-ras Generic Netlink family to meet modern Netlink YAML
> +  specifications and centralize all RAS-related communication in one namespace.
> +* Support a basic error counter interface, addressing the immediate, essential
> +  monitoring needs.
> +* Offer a flexible, future-proof interface that can be extended to support
> +  additional types of RAS data in the future.
> +* Allow multiple nodes per driver, enabling drivers to register separate
> +  nodes for different IP blocks, sub-blocks, or other logical subdivisions
> +  as applicable.
> +
> +Nodes
> +=====
> +
> +Nodes are logical abstractions representing an error source or block within
> +the device. Currently, only error counter nodes is supported.
> +
> +Drivers are responsible for registering and unregistering nodes via the
> +`drm_ras_node_register()` and `drm_ras_node_unregister()` APIs.
> +
> +Node Management
> +-------------------
> +
> +.. kernel-doc:: drivers/gpu/drm/drm_ras.c
> +   :doc: DRM RAS Node Management
> +.. kernel-doc:: drivers/gpu/drm/drm_ras.c
> +   :internal:
> +
> +Generic Netlink Usage
> +=====================
> +
> +The interface is implemented as a Generic Netlink family named ``drm-ras``.
> +User space tools can:
> +
> +* List registered nodes with the ``get-nodes`` command.
> +* List all error counters in an node with the ``get-error-counters`` command.
> +* Query error counters using the ``query-error-counter`` command.
> +
> +YAML-based Interface
> +--------------------
> +
> +The interface is described in a YAML specification:
> +
> +:ref:`Documentation/netlink/specs/drm_ras.yaml`
> +
> +This YAML is used to auto-generate user space bindings via
> +``tools/net/ynl/pyynl/ynl_gen_c.py``, and drives the structure of netlink
> +attributes and operations.
> +
> +Usage Notes
> +-----------
> +
> +* User space must first enumerate nodes to obtain their IDs.
> +* Node IDs or Node names can be used for all further queries, such as error counters.
> +* Error counters can be queried by either the Error ID or Error name.
> +* Query Parameters should be defined as part of the uAPI to ensure user interface stability.
> +* The interface supports future extension by adding new node types and
> +  additional attributes.
> +
> +Example: List nodes using ynl
> +
> +.. code-block:: bash
> +
> +    sudo ynl --family drm_ras  --dump list-nodes
> +    [{'device-name': '0000:03:00.0',
> +    'node-id': 0,
> +    'node-name': 'correctable-errors',
> +    'node-type': 'error-counter'},
> +    {'device-name': '0000:03:00.0',
> +     'node-id': 1,
> +    'node-name': 'nonfatal-errors',
> +    'node-type': 'error-counter'},
> +    {'device-name': '0000:03:00.0',
> +    'node-id': 2,
> +    'node-name': 'fatal-errors',
> +    'node-type': 'error-counter'}]
> +
> +Example: List all error counters using ynl
> +
> +.. code-block:: bash
> +
> +
> +   sudo ynl --family drm_ras  --dump get-error-counters --json '{"node-id":1}'
> +   [{'error-id': 1, 'error-name': 'error_name_1', 'error-value': 0},
> +   {'error-id': 2, 'error-name': 'error_name_2', 'error-value': 0}]
> +
> +
> +Example: Query an error counter for a given node
> +
> +.. code-block:: bash
> +
> +   sudo ynl --family drm_ras --do query-error-counter  --json '{"node-id":2, "error-id":1}'
> +   {'error-id': 1, 'error-name': 'error_name_1', 'error-value': 0}
> +
> diff --git a/Documentation/gpu/index.rst b/Documentation/gpu/index.rst
> index 7dcb15850afd..60c73fdcfeed 100644
> --- a/Documentation/gpu/index.rst
> +++ b/Documentation/gpu/index.rst
> @@ -9,6 +9,7 @@ GPU Driver Developer's Guide
>     drm-mm
>     drm-kms
>     drm-kms-helpers
> +   drm-ras
>     drm-uapi
>     drm-usage-stats
>     driver-uapi
> diff --git a/Documentation/netlink/specs/drm_ras.yaml b/Documentation/netlink/specs/drm_ras.yaml
> new file mode 100644
> index 000000000000..be0e379c5bc9
> --- /dev/null
> +++ b/Documentation/netlink/specs/drm_ras.yaml
> @@ -0,0 +1,130 @@
> +# SPDX-License-Identifier: ((GPL-2.0 WITH Linux-syscall-note) OR BSD-3-Clause)
> +---
> +name: drm-ras
> +protocol: genetlink
> +uapi-header: drm/drm_ras.h
> +
> +doc: >-
> +  DRM RAS (Reliability, Availability, Serviceability) over Generic Netlink.
> +  Provides a standardized mechanism for DRM drivers to register "nodes"
> +  representing hardware/software components capable of reporting error counters.
> +  Userspace tools can query the list of nodes or individual error counters
> +  via the Generic Netlink interface.
> +
> +definitions:
> +  -
> +    type: enum
> +    name: node-type
> +    value-start: 1
> +    entries: [error-counter]
> +    doc: >-
> +         Type of the node. Currently, only error-counter nodes are
> +         supported, which expose reliability counters for a hardware/software
> +         component.
> +
> +attribute-sets:
> +  -
> +    name: node-attrs
> +    attributes:
> +      -
> +        name: node-id
> +        type: u32
> +        doc: >-
> +             Unique identifier for the node.
> +             Assigned dynamically by the DRM RAS core upon registration.
> +      -
> +        name: device-name
> +        type: string
> +        doc: >-
> +             Device name chosen by the driver at registration.
> +             Can be a PCI BDF, UUID, or module name if unique.
> +      -
> +        name: node-name
> +        type: string
> +        doc: >-
> +             Node name chosen by the driver at registration.
> +             Can be an IP block name, or any name that identifies the
> +             RAS node inside the device.
> +      -
> +        name: node-type
> +        type: u32
> +        doc: Type of this node, identifying its function.
> +        enum: node-type
> +  -
> +    name: error-counter-attrs
> +    attributes:
> +      -
> +        name: node-id
> +        type: u32
> +        doc:  Node ID targeted by this error counter operation.
> +      -
> +        name: error-id
> +        type: u32
> +        doc: Unique identifier for a specific error counter within an node.
> +      -
> +        name: error-name
> +        type: string
> +        doc: Name of the error.
> +      -
> +        name: error-value
> +        type: u32
> +        doc: Current value of the requested error counter.
> +
> +operations:
> +  list:
> +    -
> +      name: list-nodes
> +      doc: >-
> +           Retrieve the full list of currently registered DRM RAS nodes.
> +           Each node includes its dynamically assigned ID, name, and type.
> +           **Important:** User space must call this operation first to obtain
> +           the node IDs. These IDs are required for all subsequent
> +           operations on nodes, such as querying error counters.
> +      attribute-set: node-attrs
> +      flags: [admin-perm]
> +      dump:
> +        reply:
> +          attributes:
> +            - node-id
> +            - device-name
> +            - node-name
> +            - node-type
> +    -
> +      name: get-error-counters
> +      doc: >-
> +           Retrieve the full list of error counters for a given node.
> +           The response include the id, the name, and even the current
> +           value of each counter.
> +      attribute-set: error-counter-attrs
> +      flags: [admin-perm]
> +      dump:
> +        request:
> +          attributes:
> +            - node-id
> +        reply:
> +          attributes:
> +            - error-id
> +            - error-name
> +            - error-value
> +    -
> +      name: query-error-counter
> +      doc: >-
> +           Query the information of a specific error counter for a given node.
> +           Users must provide the node ID and the error counter ID.
> +           The response contains the id, the name, and the current value
> +           of the counter.
> +      attribute-set: error-counter-attrs
> +      flags: [admin-perm]
> +      do:
> +        request:
> +          attributes:
> +            - node-id
> +            - error-id
> +        reply:
> +          attributes:
> +            - error-id
> +            - error-name
> +            - error-value
> +
> +kernel-family:
> +  headers: ["drm/drm_ras_nl.h"]
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index 7e6bc0b3a589..5cfb23b80441 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -130,6 +130,15 @@ config DRM_PANIC_SCREEN_QR_VERSION
>  	  Smaller QR code are easier to read, but will contain less debugging
>  	  data. Default is 40.
>  
> +config DRM_RAS
> +	bool "DRM RAS support"
> +	depends on DRM
> +	help
> +	  Enables the DRM RAS (Reliability, Availability and Serviceability)
> +	  support for DRM drivers. This provides a Generic Netlink interface
> +	  for error reporting and queries.
> +	  If in doubt, say "N".
> +
>  config DRM_DEBUG_DP_MST_TOPOLOGY_REFS
>          bool "Enable refcount backtrace history in the DP MST helpers"
>  	depends on STACKTRACE_SUPPORT
> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> index 4b3f3ad5058a..cd19573b2d9f 100644
> --- a/drivers/gpu/drm/Makefile
> +++ b/drivers/gpu/drm/Makefile
> @@ -95,6 +95,7 @@ drm-$(CONFIG_DRM_ACCEL) += ../../accel/drm_accel.o
>  drm-$(CONFIG_DRM_PANIC) += drm_panic.o
>  drm-$(CONFIG_DRM_DRAW) += drm_draw.o
>  drm-$(CONFIG_DRM_PANIC_SCREEN_QR_CODE) += drm_panic_qr.o
> +drm-$(CONFIG_DRM_RAS) += drm_ras.o drm_ras_nl.o drm_ras_genl_family.o
>  obj-$(CONFIG_DRM)	+= drm.o
>  
>  obj-$(CONFIG_DRM_PANEL_ORIENTATION_QUIRKS) += drm_panel_orientation_quirks.o
> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index 2915118436ce..6b965c3d3307 100644
> --- a/drivers/gpu/drm/drm_drv.c
> +++ b/drivers/gpu/drm/drm_drv.c
> @@ -53,6 +53,7 @@
>  #include <drm/drm_panic.h>
>  #include <drm/drm_print.h>
>  #include <drm/drm_privacy_screen_machine.h>
> +#include <drm/drm_ras_genl_family.h>
>  
>  #include "drm_crtc_internal.h"
>  #include "drm_internal.h"
> @@ -1223,6 +1224,7 @@ static const struct file_operations drm_stub_fops = {
>  
>  static void drm_core_exit(void)
>  {
> +	drm_ras_genl_family_unregister();
>  	drm_privacy_screen_lookup_exit();
>  	drm_panic_exit();
>  	accel_core_exit();
> @@ -1261,6 +1263,10 @@ static int __init drm_core_init(void)
>  
>  	drm_privacy_screen_lookup_init();
>  
> +	ret = drm_ras_genl_family_register();
> +	if (ret < 0)
> +		goto error;
> +
>  	drm_core_init_complete = true;
>  
>  	DRM_DEBUG("Initialized\n");
> diff --git a/drivers/gpu/drm/drm_ras.c b/drivers/gpu/drm/drm_ras.c
> new file mode 100644
> index 000000000000..32f3897ce580
> --- /dev/null
> +++ b/drivers/gpu/drm/drm_ras.c
> @@ -0,0 +1,351 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#include <linux/module.h>
> +#include <linux/kernel.h>
> +#include <linux/netdevice.h>
> +#include <linux/xarray.h>
> +#include <net/genetlink.h>
> +
> +#include <drm/drm_ras.h>
> +
> +/**
> + * DOC: DRM RAS Node Management
> + *
> + * This module provides the infrastructure to manage RAS (Reliability,
> + * Availability, and Serviceability) nodes for DRM drivers. Each
> + * DRM driver may register one or more RAS nodes, which represent
> + * logical components capable of reporting error counters and other
> + * reliability metrics.
> + *
> + * The nodes are stored in a global xarray `drm_ras_xa` to allow
> + * efficient lookup by ID. Nodes can be registered or unregistered
> + * dynamically at runtime.
> + *
> + * A Generic Netlink family `drm_ras` exposes two main operations to
> + * userspace:
> + *
> + * 1. LIST_NODES: Dump all currently registered RAS nodes.
> + *    The user receives an array of node IDs, names, and types.
> + *
> + * 2. GET_ERROR_COUNTERS: Dump all error counters of a given node.
> + *    The user receives an array of error IDs, names, and current value.
> + *
> + * 3. QUERY_ERROR_COUNTER: Query a specific error counter for a given node.
> + *    Userspace must provide the node ID and the counter ID, and
> + *    receives the ID, the error name, and its current value.
> + *
> + * Node registration:
> + * - drm_ras_node_register(): Registers a new node and assigns
> + *   it a unique ID in the xarray.
> + * - drm_ras_node_unregister(): Removes a previously registered
> + *   node from the xarray.
> + *
> + * Node type:
> + * - ERROR_COUNTER:
> + *     + Currently, only error counters are supported.
> + *     + The driver must implement the query_error_counter() callback to provide
> + *       the name and the value of the error counter.
> + *     + The driver must provide a error_counter_range.last value informing the
> + *       last valid error ID.
> + *     + The driver can provide a error_counter_range.first value informing the
> + *       frst valid error ID.
> + *     + The error counters in the driver doesn't need to be contiguous, but the
> + *       driver must return -ENOENT to the query_error_counter as an indication
> + *       that the ID should be skipped and not listed in the netlink API.
> + *
> + * Netlink handlers:
> + * - drm_ras_nl_list_nodes_dumpit(): Implements the LIST_NODES
> + *   operation, iterating over the xarray.
> + * - drm_ras_nl_get_error_counters_dumpit(): Implements the GET_ERROR_COUNTERS
> + *   operation, iterating over the know valid error_counter_range.
> + * - drm_ras_nl_query_error_counter_doit(): Implements the QUERY_ERROR_COUNTER
> + *   operation, fetching a counter value from a specific node.
> + */
> +
> +static DEFINE_XARRAY_ALLOC(drm_ras_xa);
> +
> +/*
> + * The netlink callback context carries dump state across multiple dumpit calls
> + */
> +struct drm_ras_ctx {
> +	/* Which xarray id to restart the dump from */
> +	unsigned long restart;
> +};
> +
> +/**
> + * drm_ras_nl_list_nodes_dumpit() - Dump all registered RAS nodes
> + * @skb: Netlink message buffer
> + * @cb: Callback context for multi-part dumps
> + *
> + * Iterates over all registered RAS nodes in the global xarray and appends
> + * their attributes (ID, name, type) to the given netlink message buffer.
> + * Uses @cb->ctx to track progress in case the message buffer fills up, allowing
> + * multi-part dump support. On buffer overflow, updates the context to resume
> + * from the last node on the next invocation.
> + *
> + * Return: 0 if all nodes fit in @skb, number of bytes added to @skb if
> + *          the buffer filled up (requires multi-part continuation), or
> + *          a negative error code on failure.
> + */
> +int drm_ras_nl_list_nodes_dumpit(struct sk_buff *skb,
> +				 struct netlink_callback *cb)
> +{
> +	const struct genl_info *info = genl_info_dump(cb);
> +	struct drm_ras_ctx *ctx = (void *)cb->ctx;
> +	struct drm_ras_node *node;
> +	struct nlattr *hdr;
> +	unsigned long id;
> +	int ret;
> +
> +	xa_for_each_start(&drm_ras_xa, id, node, ctx->restart) {
> +		hdr = genlmsg_iput(skb, info);
> +		if (!hdr) {
> +			ret = -EMSGSIZE;
> +			break;
> +		}
> +
> +		ret = nla_put_u32(skb, DRM_RAS_A_NODE_ATTRS_NODE_ID, node->id);
> +		if (ret) {
> +			genlmsg_cancel(skb, hdr);
> +			break;
> +		}
> +
> +		ret = nla_put_string(skb, DRM_RAS_A_NODE_ATTRS_DEVICE_NAME,
> +				     node->device_name);
> +		if (ret) {
> +			genlmsg_cancel(skb, hdr);
> +			break;
> +		}
> +
> +		ret = nla_put_string(skb, DRM_RAS_A_NODE_ATTRS_NODE_NAME,
> +				     node->node_name);
> +		if (ret) {
> +			genlmsg_cancel(skb, hdr);
> +			break;
> +		}
> +
> +		ret = nla_put_u32(skb, DRM_RAS_A_NODE_ATTRS_NODE_TYPE,
> +				  node->type);
> +		if (ret) {
> +			genlmsg_cancel(skb, hdr);
> +			break;
> +		}
> +
> +		genlmsg_end(skb, hdr);
> +	}
> +
> +	if (ret == -EMSGSIZE)
> +		ctx->restart = id;

Jakub had mentioned that we don't need this special handling
of the -EMSGSIZE, but then I'm not sure what to use in the
xa_for_each_start, so

Cc: Jakub Kicinski <kuba@kernel.org>

to ensure that we are in the right path here.

Riana, thank you so much for picking up this and addressing all
the comments. Patch looks good to me.

Thanks,
Rodrigo.

> +
> +	return ret;
> +}
> +
> +static int get_node_error_counter(u32 node_id, u32 error_id,
> +				  const char **name, u32 *value)
> +{
> +	struct drm_ras_node *node;
> +
> +	node = xa_load(&drm_ras_xa, node_id);
> +	if (!node || !node->query_error_counter)
> +		return -ENOENT;
> +
> +	if (error_id < node->error_counter_range.first ||
> +	    error_id > node->error_counter_range.last)
> +		return -EINVAL;
> +
> +	return node->query_error_counter(node, error_id, name, value);
> +}
> +
> +static int msg_reply_value(struct sk_buff *msg, u32 error_id,
> +			   const char *error_name, u32 value)
> +{
> +	int ret;
> +
> +	ret = nla_put_u32(msg, DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_ID, error_id);
> +	if (ret)
> +		return ret;
> +
> +	ret = nla_put_string(msg, DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_NAME,
> +			     error_name);
> +	if (ret)
> +		return ret;
> +
> +	return nla_put_u32(msg, DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_VALUE,
> +			   value);
> +}
> +
> +static int doit_reply_value(struct genl_info *info, u32 node_id,
> +			    u32 error_id)
> +{
> +	struct sk_buff *msg;
> +	struct nlattr *hdr;
> +	const char *error_name;
> +	u32 value;
> +	int ret;
> +
> +	msg = genlmsg_new(NLMSG_GOODSIZE, GFP_KERNEL);
> +	if (!msg)
> +		return -ENOMEM;
> +
> +	hdr = genlmsg_iput(msg, info);
> +	if (!hdr) {
> +		nlmsg_free(msg);
> +		return -EMSGSIZE;
> +	}
> +
> +	ret = get_node_error_counter(node_id, error_id,
> +				     &error_name, &value);
> +	if (ret)
> +		return ret;
> +
> +	ret = msg_reply_value(msg, error_id, error_name, value);
> +	if (ret) {
> +		genlmsg_cancel(msg, hdr);
> +		nlmsg_free(msg);
> +		return ret;
> +	}
> +
> +	genlmsg_end(msg, hdr);
> +
> +	return genlmsg_reply(msg, info);
> +}
> +
> +/**
> + * drm_ras_nl_get_error_counters_dumpit() - Dump all Error Counters
> + * @skb: Netlink message buffer
> + * @cb: Callback context for multi-part dumps
> + *
> + * Iterates over all error counters in a given Node and appends
> + * their attributes (ID, name, value) to the given netlink message buffer.
> + * Uses @cb->ctx to track progress in case the message buffer fills up, allowing
> + * multi-part dump support. On buffer overflow, updates the context to resume
> + * from the last node on the next invocation.
> + *
> + * Return: 0 if all errors fit in @skb, number of bytes added to @skb if
> + *          the buffer filled up (requires multi-part continuation), or
> + *          a negative error code on failure.
> + */
> +int drm_ras_nl_get_error_counters_dumpit(struct sk_buff *skb,
> +					 struct netlink_callback *cb)
> +{
> +	const struct genl_info *info = genl_info_dump(cb);
> +	struct drm_ras_ctx *ctx = (void *)cb->ctx;
> +	struct drm_ras_node *node;
> +	struct nlattr *hdr;
> +	const char *error_name;
> +	u32 node_id, error_id, value;
> +	int ret;
> +
> +	if (!info->attrs || !info->attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_NODE_ID])
> +		return -EINVAL;
> +
> +	node_id = nla_get_u32(info->attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_NODE_ID]);
> +
> +	node = xa_load(&drm_ras_xa, node_id);
> +	if (!node)
> +		return -ENOENT;
> +
> +	for (error_id = max(node->error_counter_range.first, ctx->restart);
> +	     error_id <= node->error_counter_range.last;
> +	     error_id++) {
> +		ret = get_node_error_counter(node_id, error_id,
> +					     &error_name, &value);
> +		/*
> +		 * For non-contiguous range, driver return -ENOENT as indication
> +		 * to skip this ID when listing all errors.
> +		 */
> +		if (ret == -ENOENT)
> +			continue;
> +		if (ret)
> +			return ret;
> +
> +		hdr = genlmsg_iput(skb, info);
> +
> +		if (!hdr) {
> +			ret = -EMSGSIZE;
> +			break;
> +		}
> +
> +		ret = msg_reply_value(skb, error_id, error_name, value);
> +		if (ret) {
> +			genlmsg_cancel(skb, hdr);
> +			break;
> +		}
> +
> +		genlmsg_end(skb, hdr);
> +	}
> +
> +	if (ret == -EMSGSIZE)
> +		ctx->restart = error_id;
> +
> +	return ret;
> +}
> +
> +/**
> + * drm_ras_nl_query_error_counter_doit() - Query an error counter of an node
> + * @skb: Netlink message buffer
> + * @info: Generic Netlink info containing attributes of the request
> + *
> + * Extracts the node ID and error ID from the netlink attributes and
> + * retrieves the current value of the corresponding error counter. Sends the
> + * result back to the requesting user via the standard Genl reply.
> + *
> + * Return: 0 on success, or negative errno on failure.
> + */
> +int drm_ras_nl_query_error_counter_doit(struct sk_buff *skb,
> +					struct genl_info *info)
> +{
> +	u32 node_id, error_id;
> +
> +	if (!info->attrs ||
> +	    !info->attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_NODE_ID] ||
> +	    !info->attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_ID])
> +		return -EINVAL;
> +
> +	node_id = nla_get_u32(info->attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_NODE_ID]);
> +	error_id = nla_get_u32(info->attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_ID]);
> +
> +	return doit_reply_value(info, node_id, error_id);
> +}
> +
> +/**
> + * drm_ras_node_register() - Register a new RAS node
> + * @node: Node structure to register
> + *
> + * Adds the given RAS node to the global node xarray and assigns it
> + * a unique ID. Both @node->name and @node->type must be valid.
> + *
> + * Return: 0 on success, or negative errno on failure:
> + */
> +int drm_ras_node_register(struct drm_ras_node *node)
> +{
> +	if (!node->device_name || !node->node_name)
> +		return -EINVAL;
> +
> +	/* Currently, only Error Counter Endpoinnts are supported */
> +	if (node->type != DRM_RAS_NODE_TYPE_ERROR_COUNTER)
> +		return -EINVAL;
> +
> +	/* Mandatorty entries for Error Counter Node */
> +	if (node->type == DRM_RAS_NODE_TYPE_ERROR_COUNTER &&
> +	    (!node->error_counter_range.last || !node->query_error_counter))
> +		return -EINVAL;
> +
> +	return xa_alloc(&drm_ras_xa, &node->id, node, xa_limit_32b, GFP_KERNEL);
> +}
> +EXPORT_SYMBOL(drm_ras_node_register);
> +
> +/**
> + * drm_ras_node_unregister() - Unregister a previously registered node
> + * @node: Node structure to unregister
> + *
> + * Removes the given node from the global node xarray using its ID.
> + */
> +void drm_ras_node_unregister(struct drm_ras_node *node)
> +{
> +	xa_erase(&drm_ras_xa, node->id);
> +}
> +EXPORT_SYMBOL(drm_ras_node_unregister);
> diff --git a/drivers/gpu/drm/drm_ras_genl_family.c b/drivers/gpu/drm/drm_ras_genl_family.c
> new file mode 100644
> index 000000000000..2d818b8c3808
> --- /dev/null
> +++ b/drivers/gpu/drm/drm_ras_genl_family.c
> @@ -0,0 +1,42 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#include <drm/drm_ras_genl_family.h>
> +#include <drm/drm_ras_nl.h>
> +
> +/* Track family registration so the drm_exit can be called at any time */
> +static bool registered;
> +
> +/**
> + * drm_ras_genl_family_register() - Register drm-ras genl family
> + *
> + * Only to be called one at drm_drv_init()
> + */
> +int drm_ras_genl_family_register(void)
> +{
> +	int ret;
> +
> +	registered = false;
> +
> +	ret = genl_register_family(&drm_ras_nl_family);
> +	if (ret)
> +		return ret;
> +
> +	registered = true;
> +	return 0;
> +}
> +
> +/**
> + * drm_ras_genl_family_unregister() - Unregister drm-ras genl family
> + *
> + * To be called one at drm_drv_exit() at any moment, but only once.
> + */
> +void drm_ras_genl_family_unregister(void)
> +{
> +	if (registered) {
> +		genl_unregister_family(&drm_ras_nl_family);
> +		registered = false;
> +	}
> +}
> diff --git a/drivers/gpu/drm/drm_ras_nl.c b/drivers/gpu/drm/drm_ras_nl.c
> new file mode 100644
> index 000000000000..fcd1392410e4
> --- /dev/null
> +++ b/drivers/gpu/drm/drm_ras_nl.c
> @@ -0,0 +1,54 @@
> +// SPDX-License-Identifier: ((GPL-2.0 WITH Linux-syscall-note) OR BSD-3-Clause)
> +/* Do not edit directly, auto-generated from: */
> +/*	Documentation/netlink/specs/drm_ras.yaml */
> +/* YNL-GEN kernel source */
> +
> +#include <net/netlink.h>
> +#include <net/genetlink.h>
> +
> +#include <uapi/drm/drm_ras.h>
> +#include <drm/drm_ras_nl.h>
> +
> +/* DRM_RAS_CMD_GET_ERROR_COUNTERS - dump */
> +static const struct nla_policy drm_ras_get_error_counters_nl_policy[DRM_RAS_A_ERROR_COUNTER_ATTRS_NODE_ID + 1] = {
> +	[DRM_RAS_A_ERROR_COUNTER_ATTRS_NODE_ID] = { .type = NLA_U32, },
> +};
> +
> +/* DRM_RAS_CMD_QUERY_ERROR_COUNTER - do */
> +static const struct nla_policy drm_ras_query_error_counter_nl_policy[DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_ID + 1] = {
> +	[DRM_RAS_A_ERROR_COUNTER_ATTRS_NODE_ID] = { .type = NLA_U32, },
> +	[DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_ID] = { .type = NLA_U32, },
> +};
> +
> +/* Ops table for drm_ras */
> +static const struct genl_split_ops drm_ras_nl_ops[] = {
> +	{
> +		.cmd	= DRM_RAS_CMD_LIST_NODES,
> +		.dumpit	= drm_ras_nl_list_nodes_dumpit,
> +		.flags	= GENL_ADMIN_PERM | GENL_CMD_CAP_DUMP,
> +	},
> +	{
> +		.cmd		= DRM_RAS_CMD_GET_ERROR_COUNTERS,
> +		.dumpit		= drm_ras_nl_get_error_counters_dumpit,
> +		.policy		= drm_ras_get_error_counters_nl_policy,
> +		.maxattr	= DRM_RAS_A_ERROR_COUNTER_ATTRS_NODE_ID,
> +		.flags		= GENL_ADMIN_PERM | GENL_CMD_CAP_DUMP,
> +	},
> +	{
> +		.cmd		= DRM_RAS_CMD_QUERY_ERROR_COUNTER,
> +		.doit		= drm_ras_nl_query_error_counter_doit,
> +		.policy		= drm_ras_query_error_counter_nl_policy,
> +		.maxattr	= DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_ID,
> +		.flags		= GENL_ADMIN_PERM | GENL_CMD_CAP_DO,
> +	},
> +};
> +
> +struct genl_family drm_ras_nl_family __ro_after_init = {
> +	.name		= DRM_RAS_FAMILY_NAME,
> +	.version	= DRM_RAS_FAMILY_VERSION,
> +	.netnsok	= true,
> +	.parallel_ops	= true,
> +	.module		= THIS_MODULE,
> +	.split_ops	= drm_ras_nl_ops,
> +	.n_split_ops	= ARRAY_SIZE(drm_ras_nl_ops),
> +};
> diff --git a/include/drm/drm_ras.h b/include/drm/drm_ras.h
> new file mode 100644
> index 000000000000..bba47a282ef8
> --- /dev/null
> +++ b/include/drm/drm_ras.h
> @@ -0,0 +1,76 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef __DRM_RAS_H__
> +#define __DRM_RAS_H__
> +
> +#include "drm_ras_nl.h"
> +
> +/**
> + * struct drm_ras_node - A DRM RAS Node
> + */
> +struct drm_ras_node {
> +	/** @id: Unique identifier for the node. Dynamically assigned. */
> +	u32 id;
> +	/**
> +	 * @device_name: Human-readable name of the device. Given by the driver.
> +	 */
> +	const char *device_name;
> +	/** @node_name: Human-readable name of the node. Given by the driver. */
> +	const char *node_name;
> +	/** @type: Type of the node (enum drm_ras_node_type). */
> +	enum drm_ras_node_type type;
> +
> +	/* Error-Counter Related Callback and Variables */
> +
> +	/** @error_counter_range: Range of valid Error IDs for this node. */
> +	struct {
> +		/** @first: First valid Error ID. */
> +		u32 first;
> +		/** @last: Last valid Error ID. Mandatory entry. */
> +		u32 last;
> +	} error_counter_range;
> +
> +	/**
> +	 * @query_error_counter:
> +	 *
> +	 * This callback is used by drm-ras to query a specific error counter.
> +	 * counters supported by this node. Used for input check and to
> +	 * iterate in all counters.
> +	 *
> +	 * Driver should expect query_error_counters() to be called with
> +	 * error_id from `error_counter_range.first` to
> +	 * `error_counter_range.last`.
> +	 *
> +	 * The @query_error_counter is a mandatory callback for
> +	 * error_counter_node.
> +	 *
> +	 * Returns: 0 on success,
> +	 *          -ENOENT when error_id is not supported as an indication that
> +	 *                  drm_ras should silently skip this entry. Used for
> +	 *                  supporting non-contiguous error ranges.
> +	 *                  Driver is responsible for maintaining the list of
> +	 *                  supported error IDs in the range of first to last.
> +	 *          Other negative values on errors that should terminate the
> +	 *          netlink query.
> +	 */
> +	int (*query_error_counter)(struct drm_ras_node *ep, u32 error_id,
> +				   const char **name, u32 *val);
> +
> +	/** @priv: Driver private data */
> +	void *priv;
> +};
> +
> +struct drm_device;
> +
> +#if IS_ENABLED(CONFIG_DRM_RAS)
> +int drm_ras_node_register(struct drm_ras_node *ep);
> +void drm_ras_node_unregister(struct drm_ras_node *ep);
> +#else
> +static inline int drm_ras_node_register(struct drm_ras_node *ep) { return 0; }
> +static inline void drm_ras_node_unregister(struct drm_ras_node *ep) { }
> +#endif
> +
> +#endif
> diff --git a/include/drm/drm_ras_genl_family.h b/include/drm/drm_ras_genl_family.h
> new file mode 100644
> index 000000000000..5931b53429f1
> --- /dev/null
> +++ b/include/drm/drm_ras_genl_family.h
> @@ -0,0 +1,17 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef __DRM_RAS_GENL_FAMILY_H__
> +#define __DRM_RAS_GENL_FAMILY_H__
> +
> +#if IS_ENABLED(CONFIG_DRM_RAS)
> +int drm_ras_genl_family_register(void);
> +void drm_ras_genl_family_unregister(void);
> +#else
> +static inline int drm_ras_genl_family_register(void) { return 0; }
> +static inline void drm_ras_genl_family_unregister(void) { }
> +#endif
> +
> +#endif
> diff --git a/include/drm/drm_ras_nl.h b/include/drm/drm_ras_nl.h
> new file mode 100644
> index 000000000000..9613b7d9ffdb
> --- /dev/null
> +++ b/include/drm/drm_ras_nl.h
> @@ -0,0 +1,24 @@
> +/* SPDX-License-Identifier: ((GPL-2.0 WITH Linux-syscall-note) OR BSD-3-Clause) */
> +/* Do not edit directly, auto-generated from: */
> +/*	Documentation/netlink/specs/drm_ras.yaml */
> +/* YNL-GEN kernel header */
> +
> +#ifndef _LINUX_DRM_RAS_GEN_H
> +#define _LINUX_DRM_RAS_GEN_H
> +
> +#include <net/netlink.h>
> +#include <net/genetlink.h>
> +
> +#include <uapi/drm/drm_ras.h>
> +#include <drm/drm_ras_nl.h>
> +
> +int drm_ras_nl_list_nodes_dumpit(struct sk_buff *skb,
> +				 struct netlink_callback *cb);
> +int drm_ras_nl_get_error_counters_dumpit(struct sk_buff *skb,
> +					 struct netlink_callback *cb);
> +int drm_ras_nl_query_error_counter_doit(struct sk_buff *skb,
> +					struct genl_info *info);
> +
> +extern struct genl_family drm_ras_nl_family;
> +
> +#endif /* _LINUX_DRM_RAS_GEN_H */
> diff --git a/include/uapi/drm/drm_ras.h b/include/uapi/drm/drm_ras.h
> new file mode 100644
> index 000000000000..3415ba345ac8
> --- /dev/null
> +++ b/include/uapi/drm/drm_ras.h
> @@ -0,0 +1,49 @@
> +/* SPDX-License-Identifier: ((GPL-2.0 WITH Linux-syscall-note) OR BSD-3-Clause) */
> +/* Do not edit directly, auto-generated from: */
> +/*	Documentation/netlink/specs/drm_ras.yaml */
> +/* YNL-GEN uapi header */
> +
> +#ifndef _UAPI_LINUX_DRM_RAS_H
> +#define _UAPI_LINUX_DRM_RAS_H
> +
> +#define DRM_RAS_FAMILY_NAME	"drm-ras"
> +#define DRM_RAS_FAMILY_VERSION	1
> +
> +/*
> + * Type of the node. Currently, only error-counter nodes are supported, which
> + * expose reliability counters for a hardware/software component.
> + */
> +enum drm_ras_node_type {
> +	DRM_RAS_NODE_TYPE_ERROR_COUNTER = 1,
> +};
> +
> +enum {
> +	DRM_RAS_A_NODE_ATTRS_NODE_ID = 1,
> +	DRM_RAS_A_NODE_ATTRS_DEVICE_NAME,
> +	DRM_RAS_A_NODE_ATTRS_NODE_NAME,
> +	DRM_RAS_A_NODE_ATTRS_NODE_TYPE,
> +
> +	__DRM_RAS_A_NODE_ATTRS_MAX,
> +	DRM_RAS_A_NODE_ATTRS_MAX = (__DRM_RAS_A_NODE_ATTRS_MAX - 1)
> +};
> +
> +enum {
> +	DRM_RAS_A_ERROR_COUNTER_ATTRS_NODE_ID = 1,
> +	DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_ID,
> +	DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_NAME,
> +	DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_VALUE,
> +
> +	__DRM_RAS_A_ERROR_COUNTER_ATTRS_MAX,
> +	DRM_RAS_A_ERROR_COUNTER_ATTRS_MAX = (__DRM_RAS_A_ERROR_COUNTER_ATTRS_MAX - 1)
> +};
> +
> +enum {
> +	DRM_RAS_CMD_LIST_NODES = 1,
> +	DRM_RAS_CMD_GET_ERROR_COUNTERS,
> +	DRM_RAS_CMD_QUERY_ERROR_COUNTER,
> +
> +	__DRM_RAS_CMD_MAX,
> +	DRM_RAS_CMD_MAX = (__DRM_RAS_CMD_MAX - 1)
> +};
> +
> +#endif /* _UAPI_LINUX_DRM_RAS_H */
> -- 
> 2.47.1
> 
