Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47742C9C7E7
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 18:56:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44C2E10E697;
	Tue,  2 Dec 2025 17:56:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KdTH0vH7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 301B010E17A;
 Tue,  2 Dec 2025 17:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764698207; x=1796234207;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=gEmFTWWOlg5pmDU7x/YfJghks8OPjRp4FVPxh53vULc=;
 b=KdTH0vH7b5W7hrn7+MVjQOi7ZeYseEKHuRCwI8Gc4x7eaOUB6hJnkf/P
 WBkQbIFkUZkRAsc4Js6SII/QkHlMzWYbX5V7QUmDcbX3Uttkmdh/R/efN
 91G1rEFNnIT41wFPwtLgiiQfyMZ4eeIGeu9lSYQg0ziDGh7ccHakHrHV0
 bVW02fHATfKRxsJIUrq2h7aOKHREl7GOho5JlgitAIK1CAA/ZPl/V550/
 IvtPB1dfx7Q1J6VxEAnrOyg5O0SsrxP+8uJ9tAkqJbCHPC8YppRnsbkYs
 T//T7w+avY4nL7F//uwAR06YcJpkQhrYpo7MBYmWlfJs+5pc2w5yeODzD g==;
X-CSE-ConnectionGUID: yseSzKETTMSznhnt3th8Vw==
X-CSE-MsgGUID: AOxhCkC8Rhui6VLITTxa1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="66619865"
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="66619865"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 09:56:47 -0800
X-CSE-ConnectionGUID: LyFM8KO1Q/WGe3NJ5azxaQ==
X-CSE-MsgGUID: 11DIl/kLTyGn0mMM+1T3+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="198858155"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 09:56:46 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 09:56:46 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 2 Dec 2025 09:56:46 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.58)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 09:56:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K9kH9hrhHnjliLUzJN93r67/kCmBoTUTS4haSw9m2H0XFiHt3aM6gsx5aAJlk065EYxRr4XgrCLccZtE7R8/AGmGYmKL3FJ/w+7QK1J5Wxm45h6ctRULsgc+j0AW8asZT68ZvZc7IWQB5TuiT42O2cP8nELumFpcaU9LCxtzgkoI/eoKAedsKDs6aFRoGmg3ZY8qk/c00P3wqHbHGTnptMBEJkXxxnq/2Jigv3WFdKtZPT2ixR1L39RtKU61tqXQl2bUTbbbf5fk5tLfB87NLzvaWrdPK0013hYDOgjJdcp5SMiDOd/1sYE8y8tBUSBNsl4XChCuYoP0kolOu4M/Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FskipzKq4RldOyXv2fCwQegWrthy+TjtNn37pA9adkc=;
 b=oDSziya7I2hW0L7dmjvUqXtPKrVmeHNsC7Y7iYmCDgcjjvmGbrCEQ/i+vZLDQ/yD/bPrlSb9gI4MosYva1rByQXVOW1yvpWyZfeMJAY7PRbYRhP+ZsiK/rcJ18GG21qv4ipuUOgsynYC3Ei1hHZVXwVNwPCjykgohmGjsFTIjdlUzefKsH/h7fHyjYrf9XAsjhErx1H9w0wdQNRmDLa6Mp659fSungiJZM5KpmSrGlVwVrEl1lNV44Lak4Cu/8LX4JRszPluuBoPoH6RMui+Q/Dj10D6bKlPqmsj4xZQ2nZ6FzKdbhQuNCiglKUnqgK9H7ZDGaL37UL5Q+2u0q+LZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB7677.namprd11.prod.outlook.com (2603:10b6:208:3fd::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 17:56:43 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9388.003; Tue, 2 Dec 2025
 17:56:43 +0000
Date: Tue, 2 Dec 2025 09:56:40 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Gupta, 
 saurabhg" <saurabhg.gupta@intel.com>, "Zuo, Alex" <alex.zuo@intel.com>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>, "Zhang,
 Jianxun" <jianxun.zhang@intel.com>, "Lin, Shuicheng"
 <shuicheng.lin@intel.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "Wajdeczko, Michal"
 <Michal.Wajdeczko@intel.com>, "Mrozek, Michal" <michal.mrozek@intel.com>,
 "Jadav, Raag" <raag.jadav@intel.com>, "Briano, Ivan" <ivan.briano@intel.com>, 
 "Auld, Matthew" <matthew.auld@intel.com>, "Hirschfeld, Dafna"
 <dafna.hirschfeld@intel.com>
Subject: Re: [PATCH v28 3/4] drm/xe/xe_vm: Add per VM fault info
Message-ID: <aS8oWAVebZAXNZ9f@lstrano-desk.jf.intel.com>
References: <20251201235539.236686-6-jonathan.cavitt@intel.com>
 <20251201235539.236686-9-jonathan.cavitt@intel.com>
 <aS8hsmKCc18aGtM8@lstrano-desk.jf.intel.com>
 <CH0PR11MB5444CA5E17BC165FD91D7892E5D8A@CH0PR11MB5444.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CH0PR11MB5444CA5E17BC165FD91D7892E5D8A@CH0PR11MB5444.namprd11.prod.outlook.com>
X-ClientProxiedBy: BY3PR10CA0004.namprd10.prod.outlook.com
 (2603:10b6:a03:255::9) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB7677:EE_
X-MS-Office365-Filtering-Correlation-Id: 49736663-4019-42c6-8a66-08de31cc26d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rhTf3I9DM5plZ3iDOrKCoa9TSSD0PobAMhCMFgvN+tlMMQkU5rNgWsw+s7FS?=
 =?us-ascii?Q?CnQz4Yb1gZMgNnRSI0IVenpuN+aN9AqZAME8zKfz7aFhucNwoTEJ5Tmr6jWZ?=
 =?us-ascii?Q?UwKhPe4ETM6eEC42JrwnyZacAcBZg5sR+JadmnG/mD2Kb01NVJZm3JRWFNtw?=
 =?us-ascii?Q?lMS7YvPSDXVa3GeNn7vWYX1yNC2u4DBSOpHlz0gB17P9BtKFqEWp9psupJb4?=
 =?us-ascii?Q?+0J3lIireTsTudtlP9L4YZd5+Usq5WffKgK55dMXlYVUmxNdbcAufsa6jRcO?=
 =?us-ascii?Q?WDBcXyJhvnYGXpWu3w+py68ICa7MSpH6eA5DnXrPXvwxpNbYZfePO8TKOco0?=
 =?us-ascii?Q?oHk8eGH+zWbXSelIrKtQMEXJYRxEldABi8p5Bh65lvb+FkVi0TyDX2R/U5dS?=
 =?us-ascii?Q?4+SFIzgMk4lrmcX9gnXKum3FIUIF4x+c6JcQETmtxhsPau0gW59WCEXZ0/kZ?=
 =?us-ascii?Q?fmdjiCeCqOKCoDYntxr5+EVNN40Yarn2Ls/4YEFvCl7JHN9k6gFINAiAMTYc?=
 =?us-ascii?Q?K05znp47k3uF3SZeykuja81AMFB+29R/Klk6CEJm8fUp5wmukpv0QNwhy/4T?=
 =?us-ascii?Q?UMf1g5k+rB0kXTLPNd1V8i+CA2CK16t4VcyZOISeER1z/SS9pgWF96GUJwbn?=
 =?us-ascii?Q?STfYrRvpHUj1E4NzBdJYTzeFHQh/1Wd8yzdWB9iogXHZ9KDnHAa1TSyPO+nd?=
 =?us-ascii?Q?kSbEmGKKfn5KoKV5xEVgitzmoEpcs3ARItfSA6YqWstCIvHI6K7xU2QL3LIb?=
 =?us-ascii?Q?DREAXAC3HFjvrCLZ52LDBW2VOdH0WRAiBKVw0kQqiipti6uZuJBFSl4UBxu9?=
 =?us-ascii?Q?iwQ2XKduEw/GzWniV6m0yL2oYTYiPfcySRXR8/jPKjRDlu35XDuBcwc6rQOs?=
 =?us-ascii?Q?r96jAomcEoTtXd/TVX/A+/qFScN3hnvO28R9yuG0bx1dxXKPh9JYgR9Vsoh+?=
 =?us-ascii?Q?G2lgxSnwLFW7XES6wcg5dcekuLLfvkDH2kT6HZbUmnrzz6XD/jnpwVyuIU88?=
 =?us-ascii?Q?liloiUqrhwMGSYWQi32TkaXcsOSH80MX28jUHCFdykrSgee5NgkKb9uvu3+T?=
 =?us-ascii?Q?IT8cpQy1EXUlS1c7D/FWKqKC6pXEUDDC7lWUPWZGC9Fjoqp4chcAvhk6ThCJ?=
 =?us-ascii?Q?VldLTRikFBXnAnxMAVrSISp/dlb5lFkdKATPPM1vnbP49gaDocicp4Hi0jJI?=
 =?us-ascii?Q?J3r/czoepLFre9nbMqFmFlvAYDxS2at5h0CTvuWYg/ywhkRriHZnth4m6oID?=
 =?us-ascii?Q?CsKX35CMjc9eyEhzNBLyQPvjfPiyq3VVYwsKToXBOzIIBNUS/0fp9a7yuewF?=
 =?us-ascii?Q?UZ2xaOhjGC/M1aUXfh1Z/UyFYjt7VDO8fDafGbl0EOKGAHaBBCu9vxRrFNJR?=
 =?us-ascii?Q?mTk76pxnhVWJcoOmlwxQdzkFut3keVho/9ccYsN6xY1Ln8FFrLfhKZBnEIN9?=
 =?us-ascii?Q?/v0ZIwIAt4KzVTu5v6cjsbaBcm3R/yXJ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AaaHe/goLylzfOeeB/cOBh3IT2MVQp4WL5zYPxVQ+IPrGqSnsAaZixdJ9qQ9?=
 =?us-ascii?Q?bUZQMRWh+ta8382TWUStlHAw5Yvf1G2uTwhklu6aHAi4YhG4VECSRTj1k6Ry?=
 =?us-ascii?Q?IuLCItAC3YBxNOCMMA+js8yjD8WSocAB1HJk9wrmwiN8jKYA3bOamqz0HzGu?=
 =?us-ascii?Q?vJL9QZpIuU3yuLXbGOAe0gmnADesTP+NVzq7fBOX5PKs96mKfXTBo5ktYWcv?=
 =?us-ascii?Q?l0fnxeJtueG5LOdPXk7VPj4evp+l/Of3BpmISb1WRFsnnA+2M9ZPDnwr5A7X?=
 =?us-ascii?Q?StPruma18YHTzyavQHwkLBHK+LGdg9EiS6m9TMFa9j4D1QQt0wnMAhO+2bsj?=
 =?us-ascii?Q?iTmDkX6xopuojW/N0Pv4u/5eOcKlXG8rY7w2bS6WE5XO6ykFZKgXhZewo+6d?=
 =?us-ascii?Q?20BaQ3egLqYdYXSHVyBoUNYqeck6JaO0fQmRT6c3Xrnmkpkil7KGxKXBZYaQ?=
 =?us-ascii?Q?9Xp+X9BtU1IYfExxckmyHPeWgFIAdWypUUnHqPYx9pmtxvvfZwHJRlC26ZKF?=
 =?us-ascii?Q?v68cgqV0Xe3wGGhbWRy7LbQVW2ZSz29Cez6ShcCScPYB3f1CTE/VsXV0qKPD?=
 =?us-ascii?Q?dKw/A5SGc2HpIsWvdrpT5Mt3BtQv2lqphmw0K41IBCBbcS1KkvLbNx1HdaBO?=
 =?us-ascii?Q?PhrkhrtCHV/Rh75cBMacqpaka2u11Vxbz+zhCL1aKChm31G4AKG3nC+IObW0?=
 =?us-ascii?Q?u6ycHKYpDf5YEqRImRFi1FdpSLbK0oxmnTVXh6k6FAZUrqTYucNWYRi7Nwa3?=
 =?us-ascii?Q?OkkVaMTOGzR+BvheZEvmSTVSRSVkVpUm6S3RyvNaSiVUXUSJFYS3gjiB0aF6?=
 =?us-ascii?Q?V5nxQEAZT1GyII4Z6czvMvXjBzl71EwKRB5GSFytrgGqtRBWYQ2Nt5FRJc0D?=
 =?us-ascii?Q?p8yXUSO1SrVcqYcENfCr6grm5OXlK8vgEWbnVihi8L1ifyxYCtjTvxm0sXNh?=
 =?us-ascii?Q?It2wZ9jh/RQKyGWQkkLN/UwgjG9ELi0JwT8Fj6UNAnt5zBlanHxkX+r9onLs?=
 =?us-ascii?Q?u7FNLHxmxh1H1k2e8LS+0+LNq2gvt8uLOnKpB0OiCg5Ly5lHSmQGzjpQbHlB?=
 =?us-ascii?Q?/Qz9dEclZ9wfvPHJp7nHnMbt7UksRihxmvT7ubC2tMUty825dntd8ZWomEg6?=
 =?us-ascii?Q?9957sY5Ah9L0hS5spe2FZmfXhMNO7+Krynd5OhRiqtYCeGgPBo3P0rmNI+3A?=
 =?us-ascii?Q?Ka08ggJGLshusLDsL/8+8R04Ym8fCvQHFJrARfVPFRuqRc6WVRoeHf1R71z4?=
 =?us-ascii?Q?8Ffk0VeYOVIraQNn4bB4tTXTfTW8r9zVqCbEcjtuHW3V62T7dlUngVo4j5FD?=
 =?us-ascii?Q?fkgeg000yQeYk8gdYwe2olvYA/hmfZtRfgSG+DUQf1GMy35/gVBG4BjwYjQp?=
 =?us-ascii?Q?Sr6pkiC6hZ8smyU47tyXEQEKKqU680N1MByNkAoxGBp1wh/HTENZssxUYkpr?=
 =?us-ascii?Q?35ARVNPc8m2/gyqSlZ3ehwgFd67IjzzSik651EtxeNGfIjA3Ka41LvKk13vP?=
 =?us-ascii?Q?sgkot4rsd2GB48O7cfbxAGZGe8tAniImsFZ4KjS3y1nDY9Oy71zVlPTJRl/H?=
 =?us-ascii?Q?O0YPXM9eF4CK4Eyrst8l3LGDKkmTroe031DCALRyWiylsbgi4SnOYwGsqmwQ?=
 =?us-ascii?Q?JA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 49736663-4019-42c6-8a66-08de31cc26d3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 17:56:42.9961 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NDDNfMgzeILDhyE4Aj2EkNSDs2qt7MwlEJHrqHkKeRgggAWjvQMsNoMOkIT9PdvBE6Wh1UBiS1+/lG0i5B/8gg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7677
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

On Tue, Dec 02, 2025 at 10:47:16AM -0700, Cavitt, Jonathan wrote:
> -----Original Message-----
> From: Brost, Matthew <matthew.brost@intel.com> 
> Sent: Tuesday, December 2, 2025 9:28 AM
> To: Cavitt, Jonathan <jonathan.cavitt@intel.com>
> Cc: intel-xe@lists.freedesktop.org; Gupta, saurabhg <saurabhg.gupta@intel.com>; Zuo, Alex <alex.zuo@intel.com>; joonas.lahtinen@linux.intel.com; Zhang, Jianxun <jianxun.zhang@intel.com>; Lin, Shuicheng <shuicheng.lin@intel.com>; dri-devel@lists.freedesktop.org; Wajdeczko, Michal <Michal.Wajdeczko@intel.com>; Mrozek, Michal <michal.mrozek@intel.com>; Jadav, Raag <raag.jadav@intel.com>; Briano, Ivan <ivan.briano@intel.com>; Auld, Matthew <matthew.auld@intel.com>; Hirschfeld, Dafna <dafna.hirschfeld@intel.com>
> Subject: Re: [PATCH v28 3/4] drm/xe/xe_vm: Add per VM fault info
> > 
> > On Mon, Dec 01, 2025 at 11:55:43PM +0000, Jonathan Cavitt wrote:
> > > Add additional information to each VM so they can report up to the first
> > > 50 seen faults.  Only pagefaults are saved this way currently, though in
> > > the future, all faults should be tracked by the VM for future reporting.
> > > 
> > > Additionally, of the pagefaults reported, only failed pagefaults are
> > > saved this way, as successful pagefaults should recover silently and not
> > > need to be reported to userspace.
> > > 
> > > v2:
> > > - Free vm after use (Shuicheng)
> > > - Compress pf copy logic (Shuicheng)
> > > - Update fault_unsuccessful before storing (Shuicheng)
> > > - Fix old struct name in comments (Shuicheng)
> > > - Keep first 50 pagefaults instead of last 50 (Jianxun)
> > > 
> > > v3:
> > > - Avoid unnecessary execution by checking MAX_PFS earlier (jcavitt)
> > > - Fix double-locking error (jcavitt)
> > > - Assert kmemdump is successful (Shuicheng)
> > > 
> > > v4:
> > > - Rename xe_vm.pfs to xe_vm.faults (jcavitt)
> > > - Store fault data and not pagefault in xe_vm faults list (jcavitt)
> > > - Store address, address type, and address precision per fault (jcavitt)
> > > - Store engine class and instance data per fault (Jianxun)
> > > - Add and fix kernel docs (Michal W)
> > > - Properly handle kzalloc error (Michal W)
> > > - s/MAX_PFS/MAX_FAULTS_SAVED_PER_VM (Michal W)
> > > - Store fault level per fault (Micahl M)
> > > 
> > > v5:
> > > - Store fault and access type instead of address type (Jianxun)
> > > 
> > > v6:
> > > - Store pagefaults in non-fault-mode VMs as well (Jianxun)
> > > 
> > > v7:
> > > - Fix kernel docs and comments (Michal W)
> > > 
> > > v8:
> > > - Fix double-locking issue (Jianxun)
> > > 
> > > v9:
> > > - Do not report faults from reserved engines (Jianxun)
> > > 
> > > v10:
> > > - Remove engine class and instance (Ivan)
> > > 
> > > v11:
> > > - Perform kzalloc outside of lock (Auld)
> > > 
> > > v12:
> > > - Fix xe_vm_fault_entry kernel docs (Shuicheng)
> > > 
> > > v13:
> > > - Rebase and refactor (jcavitt)
> > > 
> > > v14:
> > > - Correctly ignore fault mode in save_pagefault_to_vm (jcavitt)
> > > 
> > > v15:
> > > - s/save_pagefault_to_vm/xe_pagefault_save_to_vm (Matt Brost)
> > > - Use guard instead of spin_lock/unlock (Matt Brost)
> > > - GT was added to xe_pagefault struct.  Use xe_gt_hw_engine
> > >   instead of creating a new helper function (Matt Brost)
> > > 
> > > Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > > Suggested-by: Matthew Brost <matthew.brost@intel.com>
> > > Cc: Shuicheng Lin <shuicheng.lin@intel.com>
> > > Cc: Jianxun Zhang <jianxun.zhang@intel.com>
> > > Cc: Michal Wajdeczko <Michal.Wajdeczko@intel.com>
> > > Cc: Michal Mzorek <michal.mzorek@intel.com>
> > > Cc: Ivan Briano <ivan.briano@intel.com>
> > > Cc: Matthew Auld <matthew.auld@intel.com>
> > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_pagefault.c | 26 ++++++++++++
> > >  drivers/gpu/drm/xe/xe_vm.c        | 67 +++++++++++++++++++++++++++++++
> > >  drivers/gpu/drm/xe/xe_vm.h        |  9 +++++
> > >  drivers/gpu/drm/xe/xe_vm_types.h  | 29 +++++++++++++
> > >  4 files changed, 131 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
> > > index 0b625a52a598..0fe092226d0a 100644
> > > --- a/drivers/gpu/drm/xe/xe_pagefault.c
> > > +++ b/drivers/gpu/drm/xe/xe_pagefault.c
> > > @@ -247,6 +247,31 @@ static void xe_pagefault_print(struct xe_pagefault *pf)
> > >  		  pf->consumer.engine_instance);
> > >  }
> > >  
> > > +static void xe_pagefault_save_to_vm(struct xe_device *xe, struct xe_pagefault *pf)
> > > +{
> > > +	struct xe_vm *vm;
> > > +
> > > +	/*
> > > +	 * Pagefault may be asociated to VM that is not in fault mode.
> > > +	 * Perform asid_to_vm behavior, except if VM is not in fault
> > > +	 * mode, return VM anyways.
> > > +	 */
> > > +	down_read(&xe->usm.lock);
> > > +	vm = xa_load(&xe->usm.asid_to_vm, pf->consumer.asid);
> > > +	if (vm)
> > > +		xe_vm_get(vm);
> > > +	else
> > > +		vm = ERR_PTR(-EINVAL);
> > > +	up_read(&xe->usm.lock);
> > > +
> > > +	if (IS_ERR(vm))
> > > +		return;
> > > +
> > > +	xe_vm_add_fault_entry_pf(vm, pf);
> > > +
> > > +	xe_vm_put(vm);
> > > +}
> > > +
> > >  static void xe_pagefault_queue_work(struct work_struct *w)
> > >  {
> > >  	struct xe_pagefault_queue *pf_queue =
> > > @@ -266,6 +291,7 @@ static void xe_pagefault_queue_work(struct work_struct *w)
> > >  		err = xe_pagefault_service(&pf);
> > >  		if (err) {
> > >  			xe_pagefault_print(&pf);
> > > +			xe_pagefault_save_to_vm(gt_to_xe(pf.gt), &pf);
> > >  			xe_gt_dbg(pf.gt, "Fault response: Unsuccessful %pe\n",
> > >  				  ERR_PTR(err));
> > >  		}
> > > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > > index 8ab726289583..dc6c36191274 100644
> > > --- a/drivers/gpu/drm/xe/xe_vm.c
> > > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > > @@ -27,6 +27,7 @@
> > >  #include "xe_device.h"
> > >  #include "xe_drm_client.h"
> > >  #include "xe_exec_queue.h"
> > > +#include "xe_gt.h"
> > >  #include "xe_migrate.h"
> > >  #include "xe_pat.h"
> > >  #include "xe_pm.h"
> > > @@ -578,6 +579,67 @@ static void preempt_rebind_work_func(struct work_struct *w)
> > >  	trace_xe_vm_rebind_worker_exit(vm);
> > >  }
> > >  
> > > +/**
> > > + * xe_vm_add_fault_entry_pf() - Add pagefault to vm fault list
> > > + * @vm: The VM.
> > > + * @pf: The pagefault.
> > > + *
> > > + * This function takes the data from the pagefault @pf and saves it to @vm->faults.list.
> > > + *
> > > + * The function exits silently if the list is full, and reports a warning if the pagefault
> > > + * could not be saved to the list.
> > > + */
> > > +void xe_vm_add_fault_entry_pf(struct xe_vm *vm, struct xe_pagefault *pf)
> > > +{
> > > +	struct xe_vm_fault_entry *e = NULL;
> > > +	struct xe_hw_engine *hwe;
> > > +
> > > +	/* Do not report faults on reserved engines */
> > > +	hwe = xe_gt_hw_engine(pf->gt, pf->consumer.engine_class,
> > > +			      pf->consumer.engine_instance, false);
> > > +	if (!hwe || xe_hw_engine_is_reserved(hwe))
> > > +		return;
> > > +
> > > +	e = kzalloc(sizeof(*e), GFP_KERNEL);
> > > +	if (!e) {
> > > +		drm_warn(&vm->xe->drm,
> > > +			 "Could not allocate memory for fault!\n");
> > > +		return;
> > > +	}
> > > +
> > > +	guard(spinlock)(&vm->faults.lock);
> > > +
> > > +	/*
> > > +	 * Limit the number of faults in the fault list to prevent
> > > +	 * memory overuse.
> > > +	 */
> > > +	if (vm->faults.len >= MAX_FAULTS_SAVED_PER_VM) {
> > > +		kfree(e);
> > > +		return;
> > > +	}
> > > +
> > > +	e->address = pf->consumer.page_addr;
> > > +	e->address_precision = 1;
> > 
> > Can you explain what address_precision means? It is a little unclear what '1' means here.
> 
> 
> As I understand it, "address_precision" captures the case where the page_addr in the pagefault
> is not precisely the address accessed that caused the fault.
> 
> For example, assume a pagefault occurred due to an access at address 0x7fffce.  Our current
> implementation would report that address as a part of the pagefault structure, so we would
> return an address of 0x7fffce (as that's the reported address from the pagefault), and a precision
> of 1 (to denote the address is exact).
> 
> By comparison, imagine if our pagefault reporting system reported the page the fault occurred on
> instead of the exact address.  Or, in other words, imagine if in response to a fault caused by an
> access to address 0x7fffce, the value of pf->consumer.page_addr = 0x7ff000 (the page the address
> is located on).  In that case, we would return an address of 0x7ff000 (as that's the reported address
> from the pagefault), and a precision of PAGE_SIZE (to denote that the pagefault occurred in the page

s/PAGE_SIZE/SZ_4K - PAGE_SIZE is CPU dependent thing.

We actually report faults on SZ_4K grainularity via the GuC. See
PFD_VIRTUAL_ADDR_LO_SHIFT and how it is used. So what we likely want to
do here is update xe_pagefault.consumer with an address precision field
and have the GuC side populate this with 12 (if we are making this order
based) or SZ_4K is the actual size.

Matt

> and not necessarily at exactly that address).
> 
> TL;DR: 'address' denotes a start position, and 'address_precision' denotes a range.  The reported
> pagefault occurred due to an access somewhere between 'address' and 'address + address_precision - 1'.
> Since the address is exact in our case, the range is 1.
> 
> -Jonathan Cavitt
> 
> > 
> > Everything else LGTM.
> > 
> > Matt
> > 
> > > +	e->access_type = pf->consumer.access_type;
> > > +	e->fault_type = pf->consumer.fault_type;
> > > +	e->fault_level = pf->consumer.fault_level;
> > > +
> > > +	list_add_tail(&e->list, &vm->faults.list);
> > > +	vm->faults.len++;
> > > +}
> > > +
> > > +static void xe_vm_clear_fault_entries(struct xe_vm *vm)
> > > +{
> > > +	struct xe_vm_fault_entry *e, *tmp;
> > > +
> > > +	guard(spinlock)(&vm->faults.lock);
> > > +	list_for_each_entry_safe(e, tmp, &vm->faults.list, list) {
> > > +		list_del(&e->list);
> > > +		kfree(e);
> > > +	}
> > > +	vm->faults.len = 0;
> > > +}
> > > +
> > >  static int xe_vma_ops_alloc(struct xe_vma_ops *vops, bool array_of_binds)
> > >  {
> > >  	int i;
> > > @@ -1503,6 +1565,9 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags, struct xe_file *xef)
> > >  	INIT_LIST_HEAD(&vm->userptr.invalidated);
> > >  	spin_lock_init(&vm->userptr.invalidated_lock);
> > >  
> > > +	INIT_LIST_HEAD(&vm->faults.list);
> > > +	spin_lock_init(&vm->faults.lock);
> > > +
> > >  	ttm_lru_bulk_move_init(&vm->lru_bulk_move);
> > >  
> > >  	INIT_WORK(&vm->destroy_work, vm_destroy_work_func);
> > > @@ -1808,6 +1873,8 @@ void xe_vm_close_and_put(struct xe_vm *vm)
> > >  	}
> > >  	up_write(&xe->usm.lock);
> > >  
> > > +	xe_vm_clear_fault_entries(vm);
> > > +
> > >  	for_each_tile(tile, xe, id)
> > >  		xe_range_fence_tree_fini(&vm->rftree[id]);
> > >  
> > > diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> > > index 361f10b3c453..e9f2de4189e0 100644
> > > --- a/drivers/gpu/drm/xe/xe_vm.h
> > > +++ b/drivers/gpu/drm/xe/xe_vm.h
> > > @@ -12,6 +12,12 @@
> > >  #include "xe_map.h"
> > >  #include "xe_vm_types.h"
> > >  
> > > +/**
> > > + * MAX_FAULTS_SAVED_PER_VM - Maximum number of faults each vm can store before future
> > > + * faults are discarded to prevent memory overuse
> > > + */
> > > +#define MAX_FAULTS_SAVED_PER_VM	50
> > > +
> > >  struct drm_device;
> > >  struct drm_printer;
> > >  struct drm_file;
> > > @@ -22,6 +28,7 @@ struct dma_fence;
> > >  
> > >  struct xe_exec_queue;
> > >  struct xe_file;
> > > +struct xe_pagefault;
> > >  struct xe_sync_entry;
> > >  struct xe_svm_range;
> > >  struct drm_exec;
> > > @@ -309,6 +316,8 @@ void xe_vm_snapshot_capture_delayed(struct xe_vm_snapshot *snap);
> > >  void xe_vm_snapshot_print(struct xe_vm_snapshot *snap, struct drm_printer *p);
> > >  void xe_vm_snapshot_free(struct xe_vm_snapshot *snap);
> > >  
> > > +void xe_vm_add_fault_entry_pf(struct xe_vm *vm, struct xe_pagefault *pf);
> > > +
> > >  /**
> > >   * xe_vm_set_validating() - Register this task as currently making bos resident
> > >   * @allow_res_evict: Allow eviction of buffer objects bound to @vm when
> > > diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> > > index 3bf912bfbdcc..fff914fb0aa6 100644
> > > --- a/drivers/gpu/drm/xe/xe_vm_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> > > @@ -20,6 +20,7 @@
> > >  #include "xe_userptr.h"
> > >  
> > >  struct xe_bo;
> > > +struct xe_pagefault;
> > >  struct xe_svm_range;
> > >  struct xe_sync_entry;
> > >  struct xe_user_fence;
> > > @@ -165,6 +166,24 @@ struct xe_userptr_vma {
> > >  
> > >  struct xe_device;
> > >  
> > > +/**
> > > + * struct xe_vm_fault_entry - Elements of vm->faults.list
> > > + * @list: link into @xe_vm.faults.list
> > > + * @address: address of the fault
> > > + * @address_precision: precision of faulted address
> > > + * @access_type: type of address access that resulted in fault
> > > + * @fault_type: type of fault reported
> > > + * @fault_level: fault level of the fault
> > > + */
> > > +struct xe_vm_fault_entry {
> > > +	struct list_head list;
> > > +	u64 address;
> > > +	u32 address_precision;
> > > +	u8 access_type;
> > > +	u8 fault_type;
> > > +	u8 fault_level;
> > > +};
> > > +
> > >  struct xe_vm {
> > >  	/** @gpuvm: base GPUVM used to track VMAs */
> > >  	struct drm_gpuvm gpuvm;
> > > @@ -302,6 +321,16 @@ struct xe_vm {
> > >  		bool capture_once;
> > >  	} error_capture;
> > >  
> > > +	/** @faults: List of all faults associated with this VM */
> > > +	struct {
> > > +		/** @faults.lock: lock protecting @faults.list */
> > > +		spinlock_t lock;
> > > +		/** @faults.list: list of xe_vm_fault_entry entries */
> > > +		struct list_head list;
> > > +		/** @faults.len: length of @faults.list */
> > > +		unsigned int len;
> > > +	} faults;
> > > +
> > >  	/**
> > >  	 * @validation: Validation data only valid with the vm resv held.
> > >  	 * Note: This is really task state of the task holding the vm resv,
> > > -- 
> > > 2.43.0
> > > 
> > 
