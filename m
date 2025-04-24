Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43C2FA9B860
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 21:39:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B41710E47B;
	Thu, 24 Apr 2025 19:39:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HGadm6yt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B85E10E096;
 Thu, 24 Apr 2025 19:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745523585; x=1777059585;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=8FeJ/9EdEdTnVTHM9eekIKcXjq+2u3mxGaoLvOqRddw=;
 b=HGadm6ytymJQ2GH++mGPBwRAtfzNV0H0pgYWv2Hv3jQtYp/bKjEZjG7p
 uZwXm6TxHIOhO8KfCoIPVuG4It2Bb8KhgpTphq7/o2zuP0BAKa3+3IfM7
 dQ1Q0Cnnw7pf8x1syO7jfeOV9SMQubm9VcdUeppNDm+y+n3rUNRbJNt29
 RsKtxVM7kkCjFQrvRDJNhmIcsFad7hIcv1/19HhCEG9nyq2GaGW72+GJn
 kBMYjL09raHU2d7O4xQ7ivWvB7pswtwOXzWIwPxuRRRSYGz5JKma9f/jV
 TXmhYycDHNPYwakrLlJafGPwwsqsqgOHDhVO5qm+UJ7V7+3fP2/98QMZ7 Q==;
X-CSE-ConnectionGUID: Yd/3UlNlRoeVXwBu1zSTXg==
X-CSE-MsgGUID: Uu6ruSlxQYyIFUlVlTfDsA==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="57375440"
X-IronPort-AV: E=Sophos;i="6.15,236,1739865600"; d="scan'208";a="57375440"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2025 12:39:44 -0700
X-CSE-ConnectionGUID: L1qMUvDtQeGPppUFyki1wQ==
X-CSE-MsgGUID: NMwW0IeUQVOWhCwmFcv/iQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,236,1739865600"; d="scan'208";a="137700049"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2025 12:39:44 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 24 Apr 2025 12:39:42 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 24 Apr 2025 12:39:42 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.44) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 24 Apr 2025 12:39:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pn5RmM4vH3KTQYWcXR1+aiOcPB15QR8n27Icfd+NUPu9k5aSoBmJTWuu58vgyZI++IuLNkOeOWW3jCudqU6jwyUxYv7AEP2ozSxGZRr7Ln5YmdRR9LhS/iWjgrD67bpzru237aSrcsQjvi6soJ7FQr1cUEO0+cL4G0luX4EoHMiPLEJeuzebwdEABEjBXcHDvdvdjtaZ4gYoUCJDdrJ++t9fT9uCv/sOfEv+3GY2KneuBi9qq+gEvNXTvwXQOdClkOP9xqWSy4ODkhbJfwIVHPLFwni5hjsJkkvsjR8TqjsODZyDzRpJVZW9cmdQBefsx0juJ3137w4kkUqMfeWb+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+a8v8cjc1Zox89RjzlDfSdprSmiDmM8OetvBraCL+fQ=;
 b=wAWNWdq/ZxOpfVBcIIzeg9xeNW2TGa3N0f1huNdronJjBeCMBcWEHbS3IriZSHIQjCbOKOEtEV88SCZkqpbPXBV4IBHYflScsnBussgAaSPPo0s66n7uIWAdzUqR/ggSh1ryx/3rhjsiCSGZrJgxgMhG16aj+BGENQ8b8zKiKSKxjFvkwPuvWQWB9SEX+NsXgPsUyklRvkQlnaiwrYuD6/ATpC+aAR/9SXe14en2FlIxdT49zkrPCbUA1kiGAWql602WfEK4eBf6U37r5+U5Uv8kW5lvYtCF1y4ynId8F+h5KONuKxORESqqhPoU4aiFm/Mkedwk2Exqi89D/jrmcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SN7PR11MB6678.namprd11.prod.outlook.com (2603:10b6:806:26a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.48; Thu, 24 Apr
 2025 19:39:40 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8655.037; Thu, 24 Apr 2025
 19:39:40 +0000
Date: Thu, 24 Apr 2025 12:41:00 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <saurabhg.gupta@intel.com>,
 <alex.zuo@intel.com>, <joonas.lahtinen@linux.intel.com>,
 <jianxun.zhang@intel.com>, <shuicheng.lin@intel.com>,
 <dri-devel@lists.freedesktop.org>, <Michal.Wajdeczko@intel.com>,
 <michal.mrozek@intel.com>, <raag.jadav@intel.com>,
 <john.c.harrison@intel.com>, <ivan.briano@intel.com>,
 <matthew.auld@intel.com>
Subject: Re: [PATCH v22 0/5] drm/xe/xe_vm: Implement xe_vm_get_property_ioctl
Message-ID: <aAqTzMv5iU59hTOB@lstrano-desk.jf.intel.com>
References: <20250424143812.11210-1-jonathan.cavitt@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250424143812.11210-1-jonathan.cavitt@intel.com>
X-ClientProxiedBy: MW4PR03CA0267.namprd03.prod.outlook.com
 (2603:10b6:303:b4::32) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SN7PR11MB6678:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fe8676c-afae-461d-97ae-08dd8367c0bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?FVCpVNEGprDvc7n/AzUe2YTftM1f2LHHtwjOhuuHBZP0qSKgLrA0pCrW28yd?=
 =?us-ascii?Q?hAafyUqveIXeNUfnwmlVlwjhk0pjPgGzEQXH5wodVFaRN+206YmVFmru78b6?=
 =?us-ascii?Q?DQJbuIghwLxRW2mRK9HMDx9PCDAXDHa+6AJ2ibfNF5ArmfYEg5w6W5wnfCk1?=
 =?us-ascii?Q?OL+JYUicsAcauDU5T+ODeRZmu9Zqg8j7z6wKRW8OQKQjn5dQsGjTrGoLLLib?=
 =?us-ascii?Q?EXL3Wb4ewj8UGDv84iTZanAEroct6PH/pfrD8Qpuo4b/mJDqxhYCcs09PVU9?=
 =?us-ascii?Q?snxS5PAgB0tjGOt9d0RcYt2+113od0Azr0K5uf3skdbV28xGvoUAqSflUzDu?=
 =?us-ascii?Q?JAT3SIklo2mEPdNUCe2j8AR+MLnEXeHcN+7bUPwMSzlFK+jcEBXrBTDQh7R0?=
 =?us-ascii?Q?WaxDGnBTJ1GiR0cWXQyZR0SNUcg8FDkfg/0xr/vYUmQWQsvo0nKFovtzcEdn?=
 =?us-ascii?Q?OY8XMq/V7CaH283iUjSlNQtBaNjsieeI2W5kQzlMTwkwMe67rTpwOw0Mq0b3?=
 =?us-ascii?Q?vkAZTA3Kl/PgJ5SnCF1ZGucIKnJefZmFYbvsmbQz2lsAioXI/W4u8CGOMBVm?=
 =?us-ascii?Q?rEhUbtkqtmBVYwY3xmLh1Cze0WJ7RGHeYGG/FfdmXLm58bp6KCvG29ZQdBdB?=
 =?us-ascii?Q?OM1oB5sIyUWOtDSnRaJylUmf6KqILirVct8bkebfi5n4mhujdPQROu1/2ajT?=
 =?us-ascii?Q?ro1ShkbFPpuDb+ndrqRZqb1rahMzigfzk7WRnlyMXzcfo0cpLeQGDAOugPUw?=
 =?us-ascii?Q?RMq/9p1d9j9H2ARzraYd713yK++ooHpeTSAZvbdB40kVwJVtszyCX8leWUmP?=
 =?us-ascii?Q?hL73YAKty+GRhU81hAxnDgkJqJoNjQPd4ftq4PKN7E9naX+E4tgOzR/deb7p?=
 =?us-ascii?Q?GNG7Erw/URXCtCLZnz0w3v4mExk1EJF61sXkkXigTTKUwpkMcuBHld8DpJ4/?=
 =?us-ascii?Q?SsMsd99MBllnl+V8ijuS09SRF1nLhNTEuFhXccRBPI2ElF/msccYx4vfGVTb?=
 =?us-ascii?Q?r5vPbo6sXWQDz9NlKdsKRXIyufdrW4BTDS56ADtCbA5QIz2qUnhuxSrLoOSu?=
 =?us-ascii?Q?zh/LnuoZREU+MuWc+9LTNrlTTpPQUeT3XWoQRDepGcf4BjSCvVu6rcBmxkEV?=
 =?us-ascii?Q?q0U5fdoZvgFfdDngfxQBxlcvsyV5j7kYRDbN0BZZxbcgd6BiQENwnzwVSHR3?=
 =?us-ascii?Q?XBU25VWpyQcedScqdVc1YPQn3gpCpSnmfB8xDVAwxIuXbw7Bv6SFcN+B6DJv?=
 =?us-ascii?Q?Qogmz9MHi77TLe+iJADvYa81OH6oaChqBTKZWiJhJ8pARFZfrTZFLF5E4OFa?=
 =?us-ascii?Q?LBBwC2zx7dAwWHquUow9frTXJ+L8mhQ2+jeguXJH5sHzmOBwITeW5YAxzmhW?=
 =?us-ascii?Q?xViYL7w=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tHyEEIS4+EVJTzaycbBDo254vjb1I+mfYapmC8RCoNc2D3v+Na7MOusqp09P?=
 =?us-ascii?Q?OK/B9AWECnIAtDDfBCcw+JqIKYr0hua02F0Z9/sCRQT3k2Dhg9So5qeTutbJ?=
 =?us-ascii?Q?B1ftMG1ROv0VVgPWApvt4e0RIi33VVXRboJj2et0fIjSR9GzJfl2V8l9A6zp?=
 =?us-ascii?Q?HG6KGvUUaa6oAPfJ5jPCp8B+VdMFnkaUSAXKUqAnFZeXtiv/iP7TmsVh4Kio?=
 =?us-ascii?Q?FCKCxva2Sb4bTbFG32eW9MiMf6z/LhLzQH9/jeSkyFjIVkgLGeu2qHRPfqqo?=
 =?us-ascii?Q?iesOC827tC9qOJunW37TVoHpNaad2ATJubKnw+f/2hFQYg4Je5FTrj6irJP+?=
 =?us-ascii?Q?wPdofBReoqehJOM6WgzC4UX5BvOBDQZh1NO4R56Gm9XZL9hOI/FCUV/LKVxA?=
 =?us-ascii?Q?rspXUgh+8V/KHC3ieb8NIS+Be23q1CzfIEZB19uWO2r+zc4yERKbu7HiHARS?=
 =?us-ascii?Q?9OP2RZHCHQtTrxV7IeKeB0HhOs290wFJm//WQRnkaUQ0lA2U/xh3d3hq0JtS?=
 =?us-ascii?Q?fqDZmS9qV/Zv/yEjphqKqHfcmzVBpD/J19GovhxBDf0HeUizfrUGPmaEMtLa?=
 =?us-ascii?Q?CHJP+Yl038sqE4+bhmUUzvMCeadKBnhgWysIX0+Km8XlPezPvGyhc7Ygw5Sp?=
 =?us-ascii?Q?tOdzXk52pvJWzguwiAoV4LKLAqAr04NjOFEkMMotwDMXsVH0VKKivgjSqirx?=
 =?us-ascii?Q?bsUZjGv8IEmbKtdUaBaIYVi5p//llqh2LUOqE0XQv/3VHieub/5IVuuxOJsB?=
 =?us-ascii?Q?XXCc2/Frkasf+3n4YExvnIeRWKWaqkfClHuPz47SCnGawjEOq321f9ZYkYA7?=
 =?us-ascii?Q?8tVNVWGEUcmr4p3yzTgWhyZfqNQ9yOoxnkIej8DP3NDEmw6knnx0PLYMqjTo?=
 =?us-ascii?Q?KtI8Q67PgRnNnONTzS5GaDuHDoZyyVQ7QKou38Q5pF/g97gJSOCy8ajLBxtL?=
 =?us-ascii?Q?5h9FJYqdFSYEuzfpG1UXiXQ2Z0s/9NqSNWQziIeVo1oa5YQhUucSSE8+ykgJ?=
 =?us-ascii?Q?xX4AOw5ebY2+PVFBk5qtduv+DY8yWp/uEo1PTT2Ih4AlJGQjjjecZv4BrNst?=
 =?us-ascii?Q?YCwuB0kqxiq7AudJAaNgAlNpLOS5av5sVRVWdiuOeBZiUyV13ELjdwFcQYST?=
 =?us-ascii?Q?lYkXaoiTv+lKI0pOfexAahRnkCowt/bcrGY/Ej4K42nfavr0+fwF9P+7GiUl?=
 =?us-ascii?Q?uFNbONme/cGkqcRegEAqUl/ORWHuW2uwJyo6X/6lghb0vK+/9GEsh/JvoRmG?=
 =?us-ascii?Q?9UOUtLisA4UYykkQ7/8cXnqkP+d71ELwupwv8f1mdkG435+J7Myc5T2Qgoll?=
 =?us-ascii?Q?OlKtcIG7oelAJc7E33viVRET9KfbRiOU2HGcrv51Pqey6bGL7VqWQD1UkcUo?=
 =?us-ascii?Q?zpUAUr9tc87SteFZHry+tFC3haQdnf4CtX9NObrDfEy6KRzLNUVueLUSWd3o?=
 =?us-ascii?Q?XwwrOW0YS5lVxXDomYGWXRUzE3idsCOJmixkMSiK6SgvmUGqKLaLN/ly1lJI?=
 =?us-ascii?Q?ZxfQE4iv51No761eOhtVZS+UzsNdWhS/pnnbVnqCHb1hsaVULp1LiSehLtek?=
 =?us-ascii?Q?29oCn2tBfUC+2xGAgb1EIlXQHN1Xd1jarmgYoclKpCJOC1gIF135u73SuY5a?=
 =?us-ascii?Q?Yg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fe8676c-afae-461d-97ae-08dd8367c0bb
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2025 19:39:39.6738 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h6Q+fXV82UmpB7g3Yp4q006TYLhdOMDOk6ndc7CcrMOvWDr9PQwBdppPsdwd1MSjwHIG6yo/VRi/f8EJerjgrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6678
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

On Thu, Apr 24, 2025 at 02:38:05PM +0000, Jonathan Cavitt wrote:
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
> uAPI: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/32987
> Signed-off-by: Jonathan Cavitt <joanthan.cavitt@intel.com>
> Suggested-by: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Suggested-by: Matthew Brost <matthew.brost@intel.com>

Scanned the series, had some nits on the last patch, but overall LGTM.

Consider all patches:
Acked-by: Matthew Brost <matthew.brost@intel.com>

> Cc: Zhang Jianxun <jianxun.zhang@intel.com>
> Cc: Shuicheng Lin <shuicheng.lin@intel.com>
> Cc: Michal Wajdeczko <Michal.Wajdeczko@intel.com>
> Cc: Michal Mrozek <michal.mrozek@intel.com>
> Cc: Raag Jadav <raag.jadav@intel.com>
> Cc: John Harrison <john.c.harrison@intel.com>
> Cc: Ivan Briano <ivan.briano@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> 
> Jonathan Cavitt (5):
>   drm/xe/xe_gt_pagefault: Disallow writes to read-only VMAs
>   drm/xe/xe_gt_pagefault: Move pagefault struct to header
>   drm/xe/uapi: Define drm_xe_vm_get_property
>   drm/xe/xe_vm: Add per VM fault info
>   drm/xe/xe_vm: Implement xe_vm_get_property_ioctl
> 
>  drivers/gpu/drm/xe/regs/xe_pagefault_desc.h |  49 +++++
>  drivers/gpu/drm/xe/xe_device.c              |   3 +
>  drivers/gpu/drm/xe/xe_gt_pagefault.c        |  72 ++++----
>  drivers/gpu/drm/xe/xe_gt_pagefault_types.h  |  42 +++++
>  drivers/gpu/drm/xe/xe_guc_fwif.h            |  28 ---
>  drivers/gpu/drm/xe/xe_vm.c                  | 195 ++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_vm.h                  |  11 ++
>  drivers/gpu/drm/xe/xe_vm_types.h            |  29 +++
>  include/uapi/drm/xe_drm.h                   |  86 +++++++++
>  9 files changed, 454 insertions(+), 61 deletions(-)
>  create mode 100644 drivers/gpu/drm/xe/regs/xe_pagefault_desc.h
>  create mode 100644 drivers/gpu/drm/xe/xe_gt_pagefault_types.h
> 
> -- 
> 2.43.0
> 
