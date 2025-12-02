Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69263C9D1E7
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 22:52:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C50F210E6E6;
	Tue,  2 Dec 2025 21:52:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b5UkFe+t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8E1010E6E6;
 Tue,  2 Dec 2025 21:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764712369; x=1796248369;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=3Im8Ysso5/BNVf0V/cSEijsKhctaq7nP2m+DMjwe5K8=;
 b=b5UkFe+tXxVseoh2AKf2b9+EiTyjkMmcP2VID2mO5hcSIxYlyasjmWDx
 Vj0DeWy+s//ioclHwgykTOSUAM1T29lAMWSYnWiy/z7uMHAEg0IlEGqXO
 Mu37MmBsL+Krp3seDTjaHwXpAwHOzjziVTF5RJRpRSHpdvLxkENOkliik
 LlldtPnYWb7QN9UnJZYk4fvweBxB+gVgI3HPnQiLKF2H9u8rclyosIAUU
 93QruiinWw30akrLJQvYT1GTKdKGKjtvzzbjSb48b2NiS4u8N7CMfBICP
 DuYdw4U0RmWqBAdVcwCJcuP43e4LjiyBMkUCEGvbDw/Gip6WBSTFQ+i45 w==;
X-CSE-ConnectionGUID: qkQVStXFS564zOcuCPj4dQ==
X-CSE-MsgGUID: Ni7DolAET22/7ZyGk8797A==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="84094072"
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; d="scan'208";a="84094072"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 13:52:49 -0800
X-CSE-ConnectionGUID: 1PjaGzIBScOLskAu4IWsgw==
X-CSE-MsgGUID: QgHiXYxdRk+qsHO6dFPOBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; d="scan'208";a="225179408"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 13:52:49 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 13:52:48 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 2 Dec 2025 13:52:48 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.17) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 13:52:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a6pPNIDC5LBqnzdtymGZOt3qLGwS+a3d7oLmakHvSypWGRuAO8cOBUJEjNv0C4mEqSkDFaJ0hk9eXSAzsLQHNr0quZQjWLbmzwioPQMXqftl0cupQQdM4zOaDw+A9jR2rvgqaJAfQQz7kljnFENhz/WPolNpykCrE8bSiHKlsyaCfXeSDGiKTDyqnC+/2Z9BHs4IO/ADHU/QVUjjZEPCebUP8rTEt66z/AiOrjcQY/YfeEIByOTgIC+axMVvPayhqvcgA7OAkvqd3uXFAUoZA8iNsOa1reGIVMHrqLpDv1qN5XMDH1MezKlk7sc2Uo9u6Fdn9hWFqtVu6G/TmIc1gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wfUHeGrBBoyeKSp7+44IoywXAJDQvR6j4doLPjvQ9Mk=;
 b=Y321m2fRNSKJCCac98ECU36Yr16CqT8UkyjSdqWmvz1tc5bM3vuHr3+L1JTFcM0YPHRbs8ocJywTvjDnTZSUySm1e0ngQCEZzXVgS30RVNxID0A9hjK17I2jPkETomYU4VTGrXXyjoz2hRKEgcKtxDUjM77BvuUXxlxqU5sJD++aFISP/qnNFWpnSMmumpWuzRd8O8hPrXco+/Y6sQoCOKe3zwKcQB8GykU340/LFfkymfzNYZcQosg+grBSJeUTRNiZnaXZm38czUoJOoNI3dhvuCaAJ/Yv+tqU7v6RiQ8lxzILhvh2lRYI1x7N6zzq7JbJM6tBrekIXMOOD78uAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY8PR11MB7290.namprd11.prod.outlook.com (2603:10b6:930:9a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Tue, 2 Dec
 2025 21:52:45 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9388.003; Tue, 2 Dec 2025
 21:52:45 +0000
Date: Tue, 2 Dec 2025 13:52:42 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <saurabhg.gupta@intel.com>,
 <alex.zuo@intel.com>, <joonas.lahtinen@linux.intel.com>,
 <jianxun.zhang@intel.com>, <shuicheng.lin@intel.com>,
 <dri-devel@lists.freedesktop.org>, <Michal.Wajdeczko@intel.com>,
 <michal.mrozek@intel.com>, <raag.jadav@intel.com>, <ivan.briano@intel.com>,
 <matthew.auld@intel.com>, <dafna.hirschfeld@intel.com>
Subject: Re: [PATCH v29 0/5] drm/xe/xe_vm: Implement xe_vm_get_property_ioctl
Message-ID: <aS9fqikvSVFJCkre@lstrano-desk.jf.intel.com>
References: <20251202184636.96142-7-jonathan.cavitt@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251202184636.96142-7-jonathan.cavitt@intel.com>
X-ClientProxiedBy: MW3PR06CA0014.namprd06.prod.outlook.com
 (2603:10b6:303:2a::19) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY8PR11MB7290:EE_
X-MS-Office365-Filtering-Correlation-Id: 313e4023-9932-4e49-852d-08de31ed2034
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0wFK8b0VQiPH1hDnbUQFAEd433niAm0cVXJqqgOmOmP33EXrOdCJBLIjb5JU?=
 =?us-ascii?Q?S6XeF1q7xnXfOEXo70N6HJH329OopQHuRl4KnUggHAysX/YotmwMBJPNVlz6?=
 =?us-ascii?Q?H/ZLxg789rmuIAgEic+G14UCEoSOS7IVQgO7er8owPfFAAzdMaOcCIIxktFX?=
 =?us-ascii?Q?0ClX3gi/Yt29yJkOt/y3Mz0jT5NB8J35wbKlPYwGDg2DDJ5bIN6NslDdbI9o?=
 =?us-ascii?Q?qBNBPNFnAz63lOgfwwsdl6g2kn8+zLGC7oFa/77OMFw4tBFEB1wsXzq4qgxz?=
 =?us-ascii?Q?+ZrUkCAuLcmri7iBurOcucPQmik0aOgGvsM/etAXckOdiV4zJlmfYyDZXx3D?=
 =?us-ascii?Q?zS7X/vEcTl5C4+ddX8e2SH94vHduesTbXm8inYwqHKNDLUmkRTN4WrH1uqeg?=
 =?us-ascii?Q?QQqcomFKgKbrqQiTFM1MDkG/dzUoJQuj1mf7pgq7ZES22kglU79QMUydtbvd?=
 =?us-ascii?Q?BSPYtJSKLZdzNbAtkb/u+dSREH6NricLF4NOTak4ueZd1P3z8zlxQwdGGsCT?=
 =?us-ascii?Q?TpAL3vvLBDUxZ8Kj+32u4C/YgoSxsBOlkNj/TA/ZhmelltJ2LCAwKTq5lYad?=
 =?us-ascii?Q?LilXPlwVb4FES9Rl4Djb9EP8JOSemd9el65q48MEiTsX5WFPmwbV6h7pGN1H?=
 =?us-ascii?Q?ncYoYKAmr6lGNNCTRLstOONtkX8V+okHTJZEV/TbcYhDlEeGB421/hTajW0d?=
 =?us-ascii?Q?q8rWIzDs7z65G7nwYQn56wq/tY5iauOnE/RxclLbPQCH4ICialOvS95B4q3X?=
 =?us-ascii?Q?tp+cJC3ON9JUi+aSkVqYP8RRFxex7rU2zzyOVKt6TAORKIZpgGucRCvreQb1?=
 =?us-ascii?Q?uhTj7wnKuvw+4nGoOtryGxtllGS8EZF0DAtgZTHJJm1Z5rGj/9f1IbzwvPnT?=
 =?us-ascii?Q?1DtjfcPCM9K9dBc63uWjTh9G8hzHcZ5rlXuT7AwVk9kqSCB4vL26fle0WCMI?=
 =?us-ascii?Q?dEy2L56udkntJR31xlRdzWYOJWie18fuSvkkonkoMFPbIOL8Lv0T+kB+Iqdp?=
 =?us-ascii?Q?3V/+TOdJI8PNINXuAYZqMu9YTazp/9+0wfdxRHWhwY3E8r7gGcqHNfzKdg+I?=
 =?us-ascii?Q?AlgkowizbctA0SyfOWnoJdPwwKsculPv+uD92+YkY9Bk8blep5cRGPAVx09F?=
 =?us-ascii?Q?d34IK1y5kYwJfgJ3bfoCY237+/EULQYR33UTuxjzknHSGTb4P9c8MUOnSW37?=
 =?us-ascii?Q?kjTDEIF6D9EJBGh40ETGymeKjQW6akUaA5HDElZggChk1S02HBytziAk1IK7?=
 =?us-ascii?Q?VoS8JJiCc7Bjk4p6EldqmEClqEgKddkD1SHh+4DN7AuOGuO2FPNt2o3yFAPJ?=
 =?us-ascii?Q?mzaVqifI7QihKOn815d8+W5DS7NqqL6cp56pafOytNMFPRmJYnnc8tZUKbLn?=
 =?us-ascii?Q?FPpIOuU0RCdmRxZq2djtE7xnxYCN96pQ2Ut10/r2HEBvET7ma5k7x8XGIq9e?=
 =?us-ascii?Q?6wspDZncicolqcNc0WSeh7OcswoZzvi8?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?emi9vUuOTjMyq+Rs0UujCzApWDx/U8h/w20ekr9Az9AGe0sganizFMnuQlGy?=
 =?us-ascii?Q?D8KrUBj5rtbRHPxVJnVeqMqE1vlnbYC0wrwwLBA8kHfy9nPJKBw1Iqs591yq?=
 =?us-ascii?Q?NbksXjopI9Srwaa/zoJEl3tGl8CRHSxgf231eBpYpr3kQymdju5vHyuFWR8n?=
 =?us-ascii?Q?kUivhs3ManLJX/fqZF/CYbc0y8A5xO+gybV+QWElJ5GsZRYOw76VcZmyqL/J?=
 =?us-ascii?Q?y7uvPBlRDe2o7VinMv7Ocr7+LdjrXfEzjQS9e9oxf2JtWRm7e+UjiLh68qhc?=
 =?us-ascii?Q?sIv+zjdsSpXbIOItyWNIkEnG1pg2/Lqa9mguDkSOVArBrTPnYUaz+TBU/rzx?=
 =?us-ascii?Q?Bb25LGP5yq3c+8evmJKG0pAxXb2Dt8MUBewpUEGQARbZcxTozg5B3eDBIyCy?=
 =?us-ascii?Q?aOpB1aETSr6tsv1yEXuGE5/mbE7KHV+7eGfnyEoIeFZ1/UK1bLWgsSluxDib?=
 =?us-ascii?Q?uln2JRR2uMiVEckgD11OiRBMy4Dmm0L27RcG5xOtxNS2dyk+P3PNVSprbkHI?=
 =?us-ascii?Q?lzqYJD9V9RjAi4zNaVo1/EbJspytC1Y/li0EgtKHJu5xop8HWtnHTUHFev84?=
 =?us-ascii?Q?Dk0LCVaJiSt2pEtovUP5F+l49AT9p7dU2bNBUJiTZwIoUFGp1MoNEjAuebq/?=
 =?us-ascii?Q?cigB9NSBTXaAIZgTWycJphSefalD6BycWv+JxalQ3barq4zvWO8g8ERL6IbW?=
 =?us-ascii?Q?I6JiEmSQyxcbQuQupverZFakqLjuxS61NhEloqkIWB8Ah4twbqDCNIf7H4C2?=
 =?us-ascii?Q?Hkij8NVYJmT/pzVdH81Wi4qiQJACW0vhpdProhaK2st1G2lj7RFFmTmrGrHr?=
 =?us-ascii?Q?V62ODaJOg6u6G3vicbiTKDW1Y2hojeXEJ1FDI9DZyQ0/XnXF1aMnRkFap1Yc?=
 =?us-ascii?Q?l7nYaa/TWEyOpK6b48S7Kh7W1nKMjFlI7G6bvWMrW2CwQHzp+a9OC3bmhhu4?=
 =?us-ascii?Q?1aVkwsLbttQo3a1a7kz4Zm2f/ipkf9BNsTdlpMj38EDjEPxtALXQo4477OBs?=
 =?us-ascii?Q?K4vjbANq+x1nGmQf4I71rjqwx5IMeU5Zax6fMXLw0hpYm0v4igXDdmODfflw?=
 =?us-ascii?Q?L+CUkKvPFn1/G9JygQ1jPo6U4IO7T5vLW23uwEVjZ5PWpudHFRRpRvXFWqaQ?=
 =?us-ascii?Q?Nihd8Dwwiq0HWx3RI1UJW8bqIqOnf1ibBX+NmtSKVQ0Y4wWa1C7RKPRqXEr4?=
 =?us-ascii?Q?BI933GR83fYYfVOMUwo+zJnskEvsLt6wYJpjiiIEd8uG6N07wbm9WoJ5h2rn?=
 =?us-ascii?Q?lS0yZOCDp/9uvnh//MT/bAIrqkTlR8LETnKP/asPwzv2amKehOIGDNSA3S5A?=
 =?us-ascii?Q?WulDom3GCxKx7ovx13uaUKjCG5DVw+odPCH0Un7sm2yztYE737okRzuB27wR?=
 =?us-ascii?Q?cpRzLufV3u82+eohvGGeoryWFGrH8AlzmuNfO6gjeKP9/KvLwTwm88/C+QPO?=
 =?us-ascii?Q?jk5DZy8bIkhlHgKqJ3AxS9C8ilnS5pTxIFEsGNSyvQZXLQCaVqCNlJm1zxM8?=
 =?us-ascii?Q?dMa6+mC8pBFFL203wFNbcIN95NAQfAXKJ6KxmPtnVnGPR2o+zLzZuiDGp0no?=
 =?us-ascii?Q?KX1/aiBp+JWooqRGzfBu7/+1adeO5t12zSFqaAsZ3wvgsvTe8a+gZef9YKgl?=
 =?us-ascii?Q?OA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 313e4023-9932-4e49-852d-08de31ed2034
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 21:52:45.1643 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vel52E221YLtpfqFc/97JzFj7obO6yGDthXhhtoVaUovDvA3f4Rs2phLu6d40IwOGlVrsaYY5U2D3XKpI+W9QQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7290
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

On Tue, Dec 02, 2025 at 06:46:37PM +0000, Jonathan Cavitt wrote:
> Add additional information to each VM so they can report up to the first
> 50 seen faults.  Only pagefaults are saved this way currently, though in
> the future, all faults should be tracked by the VM for future reporting.
> 
> Additionally, of the pagefaults reported, only failed pagefaults are
> saved this way, as successful pagefaults should recover silently and not
> need to be reported to userspace.
> 
> To allow userspace to access these faults, a new ioctl -
> xe_vm_get_property_ioct - was created.
> 

Do we have a Mesa PR for this series? We will need one before merging +
Mesa ack for the uAPI patch. If any other UMD plan on using this, we
will an ack from them too.

Matt

> v2: (Matt Brost)
> - Break full ban list request into a separate property.
> - Reformat drm_xe_vm_get_property struct.
> - Remove need for drm_xe_faults helper struct.
> - Separate data pointer and scalar return value in ioctl.
> - Get address type on pagefault report and save it to the pagefault.
> - Correctly reject writes to read-only VMAs.
> - Miscellaneous formatting fixes.
> 
> v3: (Matt Brost)
> - Only allow querying of failed pagefaults
> 
> v4:
> - Remove unnecessary size parameter from helper function, as it
>   is a property of the arguments. (jcavitt)
> - Remove unnecessary copy_from_user (Jainxun)
> - Set address_precision to 1 (Jainxun)
> - Report max size instead of dynamic size for memory allocation
>   purposes.  Total memory usage is reported separately.
> 
> v5:
> - Return int from xe_vm_get_property_size (Shuicheng)
> - Fix memory leak (Shuicheng)
> - Remove unnecessary size variable (jcavitt)
> 
> v6:
> - Free vm after use (Shuicheng)
> - Compress pf copy logic (Shuicheng)
> - Update fault_unsuccessful before storing (Shuicheng)
> - Fix old struct name in comments (Shuicheng)
> - Keep first 50 pagefaults instead of last 50 (Jianxun)
> - Rename ioctl to xe_vm_get_faults_ioctl (jcavitt)
> 
> v7:
> - Avoid unnecessary execution by checking MAX_PFS earlier (jcavitt)
> - Fix double-locking error (jcavitt)
> - Assert kmemdump is successful (Shuicheng)
> - Repair and move fill_faults break condition (Dan Carpenter)
> - Free vm after use (jcavitt)
> - Combine assertions (jcavitt)
> - Expand size check in xe_vm_get_faults_ioctl (jcavitt)
> - Remove return mask from fill_faults, as return is already -EFAULT or 0
>   (jcavitt)
> 
> v8:
> - Revert back to using drm_xe_vm_get_property_ioctl
> - s/Migrate/Move (Michal)
> - s/xe_pagefault/xe_gt_pagefault (Michal)
> - Create new header file, xe_gt_pagefault_types.h (Michal)
> - Add and fix kernel docs (Michal)
> - Rename xe_vm.pfs to xe_vm.faults (jcavitt)
> - Store fault data and not pagefault in xe_vm faults list (jcavitt)
> - Store address, address type, and address precision per fault (jcavitt)
> - Store engine class and instance data per fault (Jianxun)
> - Properly handle kzalloc error (Michal W)
> - s/MAX_PFS/MAX_FAULTS_SAVED_PER_VM (Michal W)
> - Store fault level per fault (Micahl M)
> - Apply better copy_to_user logic (jcavitt)
> 
> v9:
> - More kernel doc fixes (Michal W, Jianxun)
> - Better error handling (jcavitt)
> 
> v10:
> - Convert enums to defines in regs folder (Michal W)
> - Move xe_guc_pagefault_desc to regs folder (Michal W)
> - Future-proof size logic for zero-size properties (jcavitt)
> - Replace address type extern with access type (Jianxun)
> - Add fault type to xe_drm_fault (Jianxun)
> 
> v11:
> - Remove unnecessary switch case logic (Raag)
> - Compress size get, size validation, and property fill functions into a
>   single helper function (jcavitt)
> - Assert valid size (jcavitt)
> - Store pagefaults in non-fault-mode VMs as well (Jianxun)
> 
> v12:
> - Remove unnecessary else condition
> - Correct backwards helper function size logic (jcavitt)
> - Fix kernel docs and comments (Michal W)
> 
> v13:
> - Move xe and user engine class mapping arrays to header (John H)
> 
> v14:
> - Fix double locking issue (Jianxun)
> - Use size_t instead of int (Raag)
> - Remove unnecessary includes (jcavitt)
> 
> v15:
> - Do not report faults from reserved engines (Jianxun)
> 
> v16:
> - Remove engine class and instance (Ivan)
> 
> v17:
> - Map access type, fault type, and fault level to user macros (Matt
>   Brost, Ivan)
> 
> v18:
> - Add uAPI merge request to this cover letter
> 
> v19:
> - Perform kzalloc outside of lock (Auld)
> 
> v20:
> - Fix inconsistent use of whitespace in defines
> 
> v21:
> - Remove unnecessary size assertion (jcavitt)
> 
> v22:
> - Fix xe_vm_fault_entry kernel docs (Shuicheng)
> 
> v23:
> - Nit fixes (Matt Brost)
> 
> v24:
> - s/xe_pagefault_desc.h/xe_guc_pagefault_desc.h (Dafna)
> - Move PF_MSG_LEN_DW to regs folder (Dafna)
> 
> v25:
> - Revert changes from last revision (John H)
> - Add missing bspec (Michal W)
> 
> v26:
> - Rebase and refactor on top of latest change to xe_pagefault layer
>   (jcavitt)
> 
> v27:
> - Apply max line length (Matt Brost)
> - Correctly ignore fault mode in save_pagefault_to_vm (jcavitt)
> 
> v28:
> - Do not copy_to_user in critical section (Matt Brost)
> - Assert args->size is multiple of sizeof(struct xe_vm_fault) (Matt
>   Brost)
> - s/save_pagefault_to_vm/xe_pagefault_save_to_vm (Matt Brost)
> - Use guard instead of spin_lock/unlock (Matt Brost)
> - GT was added to xe_pagefault struct.  Use xe_gt_hw_engine
>   instead of creating a new helper function (Matt Brost)
> 
> v29:
> - Track address precision separately and report it accurately (Matt
>   Brost)
> - Remove unnecessary memset (Matt Brost)
> 
> uAPI: TBD
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Suggested-by: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Suggested-by: Matthew Brost <matthew.brost@intel.com>
> Cc: Zhang Jianxun <jianxun.zhang@intel.com>
> Cc: Shuicheng Lin <shuicheng.lin@intel.com>
> Cc: Michal Wajdeczko <Michal.Wajdeczko@intel.com>
> Cc: Michal Mrozek <michal.mrozek@intel.com>
> Cc: Raag Jadav <raag.jadav@intel.com>
> Cc: John Harrison <john.c.harrison@intel.com>
> Cc: Ivan Briano <ivan.briano@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Dafna Hirschfeld <dafna.hirschfeld@intel.com>
> 
> Jonathan Cavitt (5):
>   drm/xe/xe_pagefault: Disallow writes to read-only VMAs
>   drm/xe/xe_pagefault: Track address precision per pagefault
>   drm/xe/uapi: Define drm_xe_vm_get_property
>   drm/xe/xe_vm: Add per VM fault info
>   drm/xe/xe_vm: Implement xe_vm_get_property_ioctl
> 
>  drivers/gpu/drm/xe/xe_device.c          |   2 +
>  drivers/gpu/drm/xe/xe_guc_pagefault.c   |   1 +
>  drivers/gpu/drm/xe/xe_pagefault.c       |  34 +++++
>  drivers/gpu/drm/xe/xe_pagefault_types.h |   8 +-
>  drivers/gpu/drm/xe/xe_vm.c              | 184 ++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_vm.h              |  12 ++
>  drivers/gpu/drm/xe/xe_vm_types.h        |  29 ++++
>  include/uapi/drm/xe_drm.h               |  86 +++++++++++
>  8 files changed, 355 insertions(+), 1 deletion(-)
> 
> -- 
> 2.43.0
> 
