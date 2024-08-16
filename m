Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76EE8954141
	for <lists+dri-devel@lfdr.de>; Fri, 16 Aug 2024 07:41:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C85CD10E58F;
	Fri, 16 Aug 2024 05:41:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YVJ4Yiw+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFCC110E58C;
 Fri, 16 Aug 2024 05:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723786903; x=1755322903;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=WaE1qDGKeo8qBPWGrWdvl01PlyLbRY6HGoHq5NqvFVU=;
 b=YVJ4Yiw+m/FSMx8raSMWSZlr7hzwskximJ8uz2VDLHEQY2tfHkVw8XCs
 4Y45iJETHpJN5LhQL8jDBbiZy2MmTwAWHKiX9gUnUihpTx0l0r0+6e9Yw
 1SQaWN/oUGbe78DiuRP1aPcsXJyoa932uCsdkfGEwT8jThb3iH5QfNyT+
 F8Es4Wp9UM3EyKUjOz/lwMBXTzsxDJqqDIDgQE2Kr7SRKgSbnGkiqh9l1
 ypZmNfaZCkNbxjUr4ps2i8wyqMsg2jvw0NKRoxbTTgXBw7yF+Q5WXyzp0
 kaXt2N0R07MZaBHO0Mko6dudMVhud7FUm3Ojl5Kj29ppokUmSpvchVQXw w==;
X-CSE-ConnectionGUID: XX9vlCz3S5KzE1JRNEmDKA==
X-CSE-MsgGUID: dCOuD76/T3Ok5KbiZBfDYg==
X-IronPort-AV: E=McAfee;i="6700,10204,11165"; a="32647546"
X-IronPort-AV: E=Sophos;i="6.10,150,1719903600"; d="scan'208";a="32647546"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2024 22:41:43 -0700
X-CSE-ConnectionGUID: 9SvGoAJ8Sna+jzayvtf/Qg==
X-CSE-MsgGUID: ls3Gov8ER2aE+wigteYN6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,150,1719903600"; d="scan'208";a="64425384"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Aug 2024 22:41:43 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 15 Aug 2024 22:41:42 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 15 Aug 2024 22:41:42 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 15 Aug 2024 22:41:42 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 15 Aug 2024 22:41:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cPSMCq6O6rZ6AG/J1Ze8WPBK5LBlRavsZP07y06I3F9kV1sN5id7Cd0cHPR7iD26Ptg7tdIFGf3UsGW+sQFELBJHGb0pdL5/6xeRCJn69o+R8egSkxdkV5XJV1dBtt4pCt+r1dFxchlpFYGT4imuaxtxDRfxoFo7o6s/hVxbW8G34F8biFaKxmjaVqJRCl7y9gCxJMw1+DMNndxs4BR7qxzBHK1HBtdwLkpKAl6PwInNxAdEBxy+FR4YbEwpWDCV6p8oRBQaHpbK5m2ZhKiFFo4Tcz1Wg0H2URB4A0pegepPbDkpVgzP5ES1rv2ywDjLksm9dXU+BSQ1HhESx28Wfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aoTgegXgcV2R6f1kbIln+Lt1wSbg/wsiHSmLpsEMWBU=;
 b=eNaa/MijuWwlGLgu+YP6rUc3uT7DWj7hqlMZcvmMx7pmv2Pib50JqdJT4ksXSyBTOxTOqZyugJiRuzFKFnyQ57677QFYbBZ/5OFLsn7O6FNWVOh45ZOCIveF64V6FKRjfpq00p1Vpvsf1Kkd1/yHAyr5MCs+Zh8q3VQTzQLEdIKGkUuLwyg52hqdK9X/yuXuurM+I3AGxA8KdKXBYSIw1QrhwQj9HaV+D1GKGZe/TE6DmD4WVbGUP3fcGcVPnzrlVweSKhGzKe5nj/EkjXuOnRJ3dK0VnQGSNhgxS1Bbm+BAIEe7ghbENkGc/hZYdmrZMBbNfeqyyXWs6kWLgmiqOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB7145.namprd11.prod.outlook.com (2603:10b6:510:1ec::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.17; Fri, 16 Aug
 2024 05:41:40 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7875.016; Fri, 16 Aug 2024
 05:41:40 +0000
Date: Fri, 16 Aug 2024 00:41:37 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Raag Jadav <raag.jadav@intel.com>, 
 <thomas.hellstrom@linux.intel.com>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 <francois.dugast@intel.com>, <anshuman.gupta@intel.com>
Subject: Re: [PATCH v2] drm/xe/uapi: Bring back reset uevent
Message-ID: <itzv5nkqirx3xtpwno5rm5ejfqnkhwgqoz6ueb5bf22cuphldx@qkwlzdkef2y3>
References: <20240812074812.1457164-1-raag.jadav@intel.com>
 <801bf720-6131-489c-8440-34d2267fe73b@linux.intel.com>
 <ZrtfgGY1YFr22Pg9@black.fi.intel.com> <ZruPtcniJzXOlumA@intel.com>
 <deb48edf-0a35-49bf-a4b3-b7d60f127b44@linux.intel.com>
 <xcfgszlk4fqraxpzpxhqsaz6zyyi27eojapl6wx4qtbgj2hk4m@6jppy3zg5ea3>
 <bc514b83-69b4-43ea-bda6-2e498ae1e2ee@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bc514b83-69b4-43ea-bda6-2e498ae1e2ee@linux.intel.com>
X-ClientProxiedBy: MW4PR04CA0112.namprd04.prod.outlook.com
 (2603:10b6:303:83::27) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB7145:EE_
X-MS-Office365-Filtering-Correlation-Id: e22e2a7a-0a64-4a11-f58d-08dcbdb61a4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?QPyJ+6m+e/vscFeJ1ivXCDcqEfdqbZUXnRXQXDq0yM2LIDE5MiI1h3+ry6?=
 =?iso-8859-1?Q?fRCgvGrHTBG6Kf4XYzk5RS7gMedp0R12JRtFkDTsBAF+o7SxAjeFqS5VTl?=
 =?iso-8859-1?Q?8qwYZ0OF+Cw4yY/fns2lkO+Sh9jLtnyy/9gF6+vo3y0H3UKZyUpOO+CvHj?=
 =?iso-8859-1?Q?/8IBCyZR5+usu0PQxkyYm8d3GSCcTIHbPd9XCqNItXtOG+o1eeN7ElleHm?=
 =?iso-8859-1?Q?BaD0/a7uXaqkD45FDOYbja3z1tyX+HF4BT7fblbH3YnumDMI5NDK26WVsr?=
 =?iso-8859-1?Q?bDCR10CQJEEkn8ih5lnyR225jXpSUuI+sLp235HgbdPMTkbMa7C9V67bcq?=
 =?iso-8859-1?Q?4OQsm6jaLQMDI/AtpnX9jSb/Z/vTqhiRmzQ5lAWCWfo9g6PeV1z8aC8V5F?=
 =?iso-8859-1?Q?ZnT3wPiRC4zN9u5zKez3YqeaTeP7ffRzQGbfLI9Tgc7YsZ99bMoK5PiNZ+?=
 =?iso-8859-1?Q?rkf6nFZpmYxXAP6IsAsuiYAVYoZJiH2dgy5bt7Zb8vN1TCKyu02nvXQBB6?=
 =?iso-8859-1?Q?dml5kKr2K3dVxsgZ+1zPNYzsYMcZuzJswLL9eWAl8A59LEKtG7fr/liP2E?=
 =?iso-8859-1?Q?9ySiPp4cqxUJgDG5M5ttKwq2KSUyXWX3r7lsmvi3Fy0pGGO4oRLdBFyuK9?=
 =?iso-8859-1?Q?27WTyC+feEeBcEQxJB8JzD+bVUmCIIx0J0KNfrYEFft+XFICXm7O2pPznE?=
 =?iso-8859-1?Q?i4EaG6k82wgCuZxG8qfO2aYVZ1A+KgmoDKLOvxSz1iFoh96gJ1pAFjcYSp?=
 =?iso-8859-1?Q?vQUuFhe1N05Cj1+3YreNZ+rhbCq2BAagJ0Fj1pkpLit6sHA38I5ZM1PlPF?=
 =?iso-8859-1?Q?LqHCpFb2vVBORoNCLJM3WJoe+aFrJZapP72p/Zf+BwEoel55edYT+1nnsj?=
 =?iso-8859-1?Q?4FelYj0EG+Fu/UVxXXm1Dn6eND2EyiLxzZbU0mx01Ege6raKr8+LZmXyOX?=
 =?iso-8859-1?Q?cuQ1CfaqQqxhXtk1kI+Uf8+N1KPLeMb4kxLYTYkrRC+5mzXyDCnAYbfBP5?=
 =?iso-8859-1?Q?N2lYaUBe7atEs1UD5UbqJiTRsP5iq6s99ILW7+4t+FvCzt7kDkz5m+WyWU?=
 =?iso-8859-1?Q?ssoGylxFKOrPvkgWTv3od36kpvmWYSDhUJD/WZv+Kk0mHe4Ii24klZXLEX?=
 =?iso-8859-1?Q?mNH5lORz6jtPpsG4dUH5llKzkZRYoNVt+tsrjIARhLmn8HHiHf5+QwYyh/?=
 =?iso-8859-1?Q?J4uisvW0BmbVn9jAJUqQucMW28bFp6t0XBFGk/k6HK8ibUiP+5XQt6EIMI?=
 =?iso-8859-1?Q?OYD7yfEUtIIfOfrkQHP2ZdH/YrnjZY3ap2yb46RM0BbXks8q6QqNGSnb+o?=
 =?iso-8859-1?Q?EXuoatWBO17gUzWM11kl5rRx5Cq4rvigcRy9UFCN01o/19w=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?N3h+vxLD3LxdBPez2v6G8h98KaJCFsDcNlO3r2npjhiRizEIn6is5ZwEJy?=
 =?iso-8859-1?Q?6GrGjrVAI30J8QY+oFFs4AfndErJFp2qLz+J6EEz+Ijrb1l1FOnULh8RuY?=
 =?iso-8859-1?Q?jojUUQarI6mBVCBI8WQJaMDKQ95a2gxZnbkdCv0wHMDWvZNtcWd38GHWXI?=
 =?iso-8859-1?Q?B8ykIHtCUjS2zJz2cHnGC5LbsigPQxOKHBgy141SSDrJOTi2mWvj42CX0j?=
 =?iso-8859-1?Q?xCFbuzdSbAr/sloo4qIzBM9pfL2T0F0ObSe24ZohSoHFvxBMTv4ZTmRkzA?=
 =?iso-8859-1?Q?jWi67STbvVbHBAbgNSMeuSNKGMeVhxuiO3Y+wIDUlRIDH6YUdedVno1PZ7?=
 =?iso-8859-1?Q?jxUDwdi6AxEWdy7kpom/A+P8LKp3gCHmi1r1N9NLJQWWEZRAhucfLUeQNr?=
 =?iso-8859-1?Q?Ap9a8RD7cF8Qib2Xebd25qhnjWe0YYgf8Q9LJFENloMkohyfNQqbJyR589?=
 =?iso-8859-1?Q?X5Npj/OrAHG6Br3WyHeo2LUsOgr17FrFIG/8FHwEML3M+VuYtYB1iCZ5hJ?=
 =?iso-8859-1?Q?P25iMHAgRIN7UD7GNd+8Vn5tXv8nLkk7IIiKeFwXQPqYXqWyEJt6AV4op+?=
 =?iso-8859-1?Q?WtyZ1/vTPY09MwDLaXLSPAmD7rYfAkiDzLq/TS+tkou/LhCzVP8y/IqqbJ?=
 =?iso-8859-1?Q?QfHtTTzDWn7tLDHkyBvV6LeuiFHHSY0XaBLWHcrPxT6+/LiVEvhff1CRFw?=
 =?iso-8859-1?Q?F0xFEExyB4t+itoJmGcMO5C3N9BIoKAmp9n9JWsyAorbJOBgRaM8DPA0yK?=
 =?iso-8859-1?Q?KlGRAZfeXdpvO2CP/2pg21CGyVpMziokSGgxK/drPzw6EyVARhlqR5ypah?=
 =?iso-8859-1?Q?6Po/3NXiocwx1CcuteDNWa8OFKXS+YFH7Ek0c0EIL6bmVPPT4Uj6DU0gk5?=
 =?iso-8859-1?Q?TZSTjz5u57Na/hfxyK8ICaoyN1qDSxQv5yf2IPj5gaZbtFtTytKyB2m7ve?=
 =?iso-8859-1?Q?8hmDa4HScIk0m/dcwT5VfxXsxpl2oL0bCZlbKz7zmDx8wXQuAGhnTAo6tB?=
 =?iso-8859-1?Q?zE6FUFbaxwO2fU/AhaivKBXTvm7R3jiL+wPQxMdQV+L3bsK6XP/coVmq9r?=
 =?iso-8859-1?Q?qeD/R0gB2ZAhUElWBsy1Ksxc8UPDOy2mfIg1UOUk4De/cDGcHGAjJTUPwT?=
 =?iso-8859-1?Q?rRNTsvDc0m6BnZxGnmqxg/x2Tj4LUIzE3O7bIvb+ZM0gZ/hjcSJ4v9Uz5Z?=
 =?iso-8859-1?Q?MwnzQFnOL7VlR2JQBl6rfu9oYIpsjcaoAyMUCA38Vtgadbg0N246wtS7qz?=
 =?iso-8859-1?Q?AzypbWTQeROtGjmycv4BLROIQGIRlEfkZ6ODjWXZ3e4yTHxD+qIVLxeGVb?=
 =?iso-8859-1?Q?q+Ulu7UHn50u04W0QdiM7YAAnuAf6sYV//InarQq5OiEEltfMuPKgMMJCN?=
 =?iso-8859-1?Q?NdkEpuo+HX/EmS09kzHrDtaV+Qfr2Vm3ac67pqIU8RrOmZ+PCLKv8ThKsv?=
 =?iso-8859-1?Q?INzP1HA9q0SyP6pv244MMkdsdMIt5jjx/LmjqwqKr3dgCX7r+XG39NTkra?=
 =?iso-8859-1?Q?oi1+2m4IjEzTPh32WM7ViB9FbfN65qKNAooB165tRSnpN7uQFIyD4g553s?=
 =?iso-8859-1?Q?uTCTf0+JvxjcGgoMYpxrX9scy1qnLHaw0ftQ8Iykv3grzl3Vf/hgKF50HI?=
 =?iso-8859-1?Q?/pATo6yj4fq+3Tj8pKEZeC/G1PWVfbUTAoC4RARl+h+IfuW3d5Ubjjjg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e22e2a7a-0a64-4a11-f58d-08dcbdb61a4f
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2024 05:41:40.4503 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LwPVg8534IEz7qmfI3a+bXw8FMc46kJSmkLqOwkEx420wKfTzfztIDMLcEQOsDMwyD3bkxWNjOKO8R7u5gfMC/8/IORi6rxhsnCE8PDcFzE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7145
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

On Fri, Aug 16, 2024 at 09:59:31AM GMT, Aravind Iddamsetty wrote:
>
>On 14/08/24 19:54, Lucas De Marchi wrote:
>> On Wed, Aug 14, 2024 at 12:16:41PM GMT, Aravind Iddamsetty wrote:
>>>>>> i see that this is even called from xe_guc_exec_queue_lr_cleanup which is for long running queue
>>>>>> from various call paths need to check in what scenarios those happen.
>>>>> Should we add a reason for long running queue?
>>>> Both of your questions would probably be answered if this was getting developed
>>>> at the same time of the user space usage of these uevents.
>>>
>>> Can't we consider the generic Linux user as a consumer, via udevadm.
>>
>> No, udevadm just confirms that there is an event being sent. Main thing
>> to understand here is "what is this event useful for? what can be done
>> as outcome of receiving this event?". From your other reply it seems
>> this is about "device is wedged/toast, and driver can't recover without
>> userspace intervention since userspace may have different policies"
>>
>> What would be some examples of actions for userspace to take?
>>
>>     - Unbind driver, kill clients, rebind?
>>     - FLR?
>>     - Something else?
>
>The expectation from userspace on receiving this event is to do a reset
>most probably SBR(unbind->sbr->rebind).
>
>The other requirement of this event is for L0 Sysman
>
>https://spec.oneapi.io/level-zero/latest/sysman/api.html#_CPPv4N21zes_event_type_flag_t41ZES_EVENT_TYPE_FLAG_DEVICE_RESET_REQUIREDE
>
>https://spec.oneapi.io/level-zero/latest/sysman/api.html#_CPPv4N18zes_device_state_t5resetE
>
>So we expect the admin do the above actions

so these things should be in the commit message. 

where's the pending implementation of this spec?  I imagine somewhere
we'd see something on top of libudev generating these L0 events. The
events themselves are not much more than confirming via udevadm, but
then at least we know the implementation covers the expectations from
the the spec without having to come back later fixing up stuff.

>
>>
>> Is this currently implemented somewhere?
>Do you mean by some other driver or subsystem?
>>
>> Also, is it possible to make is a generic drm event handling so distros
>> don't have to setup udev rules for each vendor?
>
>I think doing via drm event mandates the observability applications(L0)
>to have open connection to the device to process these which is not desired.

I'm not talking about keeping the device open. Here you are defining
xe-specific uevents. Could this be drm-specific so someone implementing
that specification you mentioned doesn't have to implement N different
uevents for N different vendors?  And a distro defining a policy via
udev rules doesn't have to do the same thing slightly differently N times?

Lucas De Marchi

>
>Thanks,
>Aravind.
>>
>>
>>
>> Lucas De Marchi
>>
>>>
>>> Thanks,
>>> Aravind.
>>>>
>>>>> Raag
