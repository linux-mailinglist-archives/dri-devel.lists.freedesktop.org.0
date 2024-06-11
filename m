Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A396E90326F
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2024 08:24:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9859D10E392;
	Tue, 11 Jun 2024 06:24:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Gts7FIWQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D551810E154
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2024 06:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718087069; x=1749623069;
 h=date:from:to:cc:subject:message-id:in-reply-to: mime-version;
 bh=BRi0cbNVyElX20pbrFPWd1fGoV+pLxW98lI1fcLhVg8=;
 b=Gts7FIWQ0yQnqLxrB9FIfevREINDgTzMoi65cdsaUzSib6pI+e2rzn45
 RN+3KxJLMsHJ3g3IijnaxB4IEfVAwsb1wNcY2Oy5vak4lUw8Gr9PJK2KC
 yjuigOh38mgSfEXHgMTFrIUVXDfaG7TcWiiND0dFubgAOBxTdtBTd7g1m
 xM/dGWCAHwO5G2VbidV0Tfjd6q9myJx8biVPRFxvBPdZRERZVC8cktKVQ
 HdrJIxHVzfro+EwMQm+dQ+EG/e6BlC7vsap21S52j6olGmudbmZCLpZQT
 NOU7bTXKXjOeyNQcgxeGQhqOKOeh7R/0lnUb23d3IH/K8re8pwJzA7Fgd Q==;
X-CSE-ConnectionGUID: OgOrzA3GTjaPY6/0cLp60A==
X-CSE-MsgGUID: mBsyQdO0RqeCTQlvStd8Ow==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="25896374"
X-IronPort-AV: E=Sophos;i="6.08,229,1712646000"; d="scan'208";a="25896374"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 23:24:28 -0700
X-CSE-ConnectionGUID: snj8TGhOQjSpxdYstRIZ5w==
X-CSE-MsgGUID: 44zq5w7bTvWk2zcgYPXWCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,229,1712646000"; d="scan'208";a="44267868"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Jun 2024 23:24:28 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 10 Jun 2024 23:24:27 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 10 Jun 2024 23:24:27 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.46) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 10 Jun 2024 23:24:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kl3Xn5quT7obG3xdlomiNNzCvKJzhTRx6jgbM4R4hUHp5kfs6xv/4wTvuEfB/i6aqUELuNprzPDEGkDBxz6D/K/k3endrEmuvc/md4vVsutarV8quORThJBRUkOSO4MjSJ8Dd7CM25fza2EFUaXKL1WF+k3/Wr1dD6ye0DE67UP4eN40NwSUq+jphxq2ovDfwt5G5v7zbCB6jueUis4U03t+IviYPSNT5UxWZw6Fdwt/LmN+fwAY3aS0arLggSnB3WgyRtEKI07f0rZfbkmnHn/g6RXp+WDO1LkYGIs7POoiCvGZe63V1cWsLLcR7Zpq+KbLh7pHOPY6bJFyMIOspA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Paneb9lVFmbhYV9cZdbNfNp0ql3At+3tGoju6aU4ZiY=;
 b=BTVBGGgJhXQ9AZ0QzXvI4SgBoAzI8tRmGRBYy90iwfFEoBtKDzv1VxlRAMxGCq1Rc/BkZgp0Zkq+Lh1MYk7cLLSPQ4hZxDbjmZq0ED3mH2alPgOarFlE4nixJTuh5x5Y1i+uHj2Lrxb67wf+IOG2xly1EeW8fn+iEzdj/aecJswOcZAnte1djEzGpVLGgwkE5G/adVyuvZrJpdXBqJ+urcCMqU8jwDx4Q6pbkvLOIExs0GK/gwinVVMG2Vgnywnsn9qtxRjRetUisol2N1ex6aGHumg6QGwrFCa1kCMhG77HCM8Bpgx14GZlaA5tOlSMEk1gZ1ymjZX/iwB4N8bgKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by SJ0PR11MB4894.namprd11.prod.outlook.com (2603:10b6:a03:2d4::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Tue, 11 Jun
 2024 06:24:25 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%2]) with mapi id 15.20.7633.036; Tue, 11 Jun 2024
 06:24:25 +0000
Date: Tue, 11 Jun 2024 14:24:15 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Andrea Calabrese <andrea.calabrese@amarulasolutions.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-kernel@vger.kernel.org>, 
 <regkh@linuxfoundation.org>, <rafael@kernel.org>,
 <dri-devel@lists.freedesktop.org>, <trivial@kernel.org>,
 <linux-amarula@amarulasolutions.com>,
 <andrea.calabrese@amarulasolutions.com>, <oliver.sang@intel.com>
Subject: Re: [PATCH] drivers/base/devres.c: refactor using guards
Message-ID: <202406111401.915dd40c-oliver.sang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240606091744.1115656-1-andrea.calabrese@amarulasolutions.com>
X-ClientProxiedBy: SI2PR02CA0001.apcprd02.prod.outlook.com
 (2603:1096:4:194::10) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|SJ0PR11MB4894:EE_
X-MS-Office365-Filtering-Correlation-Id: a78f656d-2264-44ce-49aa-08dc89df23bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?dIGejB+jGSd1e6lHTTszFWvkdfOs6TUvMfSz+s1Vn73Kf4DcAe8a1sT3qrvH?=
 =?us-ascii?Q?BdqDgsHm2SA7cWnGhiRTVNZGjvdejz6fCiAtaWXmE/gAJbzMVtAFT6UZptUv?=
 =?us-ascii?Q?KXWMP6ZPKHNo/w6frlYxanKyOooY3HqPTsUtukPInXTZU5MEafM6M51/hEfQ?=
 =?us-ascii?Q?uRqGL06eralf+edGnJfiMzx7AL71ld/TgtU5hGMFwdaitgTf1+zGY7YXmTtv?=
 =?us-ascii?Q?Pa3mzyeZOvMuYM24viJc/+aQ/JhgsPG0qLwmqDX/5XbW4uR2TW4PSfXwQFyB?=
 =?us-ascii?Q?7RGqwIQTnnhAzyguBTXuz+WzM86cnCgpyyeTAfs8/55P6wzwZsQnMV2rIAM0?=
 =?us-ascii?Q?Minnz1utZNEPw1uT93UjG0QN3pvTzSPHLhEkBcZTItWfjm+oqBeFik/K3T+S?=
 =?us-ascii?Q?3NxUHproj28j6M5FMXiaPzx4XlTepWBTx6AhloujV5OlaVNtLeXQSEnKGo/J?=
 =?us-ascii?Q?jaa9BeOPS0j8hEDgQX3JvRLJ8SZwkaKCxT+P+SVlDQtvsuVdfl3c1ZOtvby9?=
 =?us-ascii?Q?dFHDBQxvGDaA5ioVyxofqJ3GGx0K6hSrE2o/0LvJuot0oDh4vVqXc0k80YPA?=
 =?us-ascii?Q?pyjwKEo3OMOgT5WVgY+XkTV6NMqyOsglUqn2FKHEIkEDGiGc2hrqsszQilNl?=
 =?us-ascii?Q?HkVTGUAMjsQeJ3PmssN3xDMOuatBnUXPvbgqLeRRuBM8IpWYEkmBhJg9buMa?=
 =?us-ascii?Q?M7ZieC53rUpRC+rcf8nH99NM5tw5+GxsJEjcFpnm8Bevp/7Xuq5xltYxrzka?=
 =?us-ascii?Q?DtHQNzccHBoGGEip6mRqWTIb74yrE+xqtFgprfTphSl8cx/ILdEQtwTrPqWp?=
 =?us-ascii?Q?JEuUYFta3CmUiq09/ldOAySfNqp+ByTLJ+czqTxkzmpm25aT6dMX4vkygKju?=
 =?us-ascii?Q?tfaE0/3di9pwhjPtGY8KkpYKGAB6KSmIpnSYw1WoI9OaEdfQ/9mNghXXKG/n?=
 =?us-ascii?Q?BxoybqRDvFw9IjBYXGoaYgNTPHbzvmu2vKNpSHVEiEkk+iqp+YSCMBDJmRXP?=
 =?us-ascii?Q?Hvy2HEqzQdRUgLl5eACGiVzOPrceGgi0vk8Xh9FqFV84eWZGtKbGzM5JElBg?=
 =?us-ascii?Q?7nNQE8LKLePdu6YjBXZVSIuEDZiLsJk1TMLAyIym+C8SOobZ+/nX218REUj9?=
 =?us-ascii?Q?q8USNshhRDw9+5htxlYNue/a5VunSg19psqoCUqo99FE5fX8Rr/XmnJhK2Jn?=
 =?us-ascii?Q?bF69UYferBts1J+q0BXLmSI3nS9k2mW5az6SA8kBLgTv5PvvyG5Ey2QEIEXp?=
 =?us-ascii?Q?NB1DeYQK2zgLg+fm5XruHbM2pzBXaQkdk/VVs892Kw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8603.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KJfiG5C9CFMmlcmt3drGPJvUULftKdtdiOpVQAhv/edWLPEAwj6umEzuYjsb?=
 =?us-ascii?Q?3ctyjcogwVydWh5mg0Y0s9QJv0Sb1Bh0ei2TuwOAGtKQxUod4QNLMHKGH7YE?=
 =?us-ascii?Q?NCCDLXICpBGoMvb9lwkKypIUw++tuuYsWU5zp0vsVr8EYyWzR9Twx4n96L6a?=
 =?us-ascii?Q?yjNSNyFM5+TlcS/ahQ/u/UYxelYMg84f4Hw8mTDHAbGRkU7KnSz6wvV7VoJj?=
 =?us-ascii?Q?MnrLdgJsXz8h7TpU62nvL4sWrOvnic1NR860r/XgibttI9DluH0F8S5pZsCg?=
 =?us-ascii?Q?MIo4Sr9WjTcEdWaAimmWDbSaKyyl4wdzsEux8hMzSveVdmA2VoFQ5bLDyNyj?=
 =?us-ascii?Q?gf2i9Rncdj3XnzNdHGvzVfo/dz7tHptC0k9gwA40GjcY1Nx8BPX6G+Lj+tnz?=
 =?us-ascii?Q?ow+28Vo8wlrUA8OYckPlewAXnOT0+V64gAPLAXdl5F6zRj4WghJvuOj4DClp?=
 =?us-ascii?Q?wYJE1ewyi+CenRd3bmvDrJS1QVaEFsaoZNOcO7QMkDxWMWbY5aVXICzysAYQ?=
 =?us-ascii?Q?GDDR7KrP+Al0MpSkOakEYbqZrcmjVcv9+rhxalKb6X3J5lIT3b1g3tEqFW/T?=
 =?us-ascii?Q?urw4dQ08nE0AHhOemgL3qJQy7F3spbidHQz6i2t5lwOh4QittD/Mtb5P6FhB?=
 =?us-ascii?Q?QzvplvOftbhQ1eYOW/C/HZsKPHLZ2Yb1b2INMWjWrnVDc6UFjnZ85/odURo5?=
 =?us-ascii?Q?6dqPZgDVrwE7p7jYcpnoMfnSuDq0Ij2milT3AcvhpFguEpOtY2ZjaA/AC1ph?=
 =?us-ascii?Q?0feb4+niFUbJp1+VQHNgWikx8c+ivZZM8vE+zYE+e4eHhndKqSIOGQmUGRTH?=
 =?us-ascii?Q?TTKHvLXB+VMS8bL+z04WWzucy7ZRMMdAdWagtS/VN1hjjgHy/JB+mKZOwOft?=
 =?us-ascii?Q?7XXObxClXUwyqu90Mb9lU8qZ7Cq6y+rJ5mly925cdEdDSg3RSu5HTpVuvVEi?=
 =?us-ascii?Q?mP5LW7D5fJ7i30zdl4ac6p8bE+jcg9ylr3nbWqqw/SONCoQFI2ilIvVxdMqU?=
 =?us-ascii?Q?Kf7oAo2iYNcOXkRWgExIdVYvkyhRFq6KfgPVb1IrryRsFRwIqKPQcLXk+S6H?=
 =?us-ascii?Q?HtuWDYjfFcEXP4shen4W6gZ7LbkTgMQe6gw/2yHDXSQkryHSzlRFuI8ihpRb?=
 =?us-ascii?Q?9r53/fldSS/LXDpSPF7Hkk9n2MvfeQnTKV+PzGHCLN53p4pG/Q9mgHvCdI6e?=
 =?us-ascii?Q?Bu8d1CLAzD53x/y5nLPVCAO0/mFayScOwVYK+gGMAD69WSeKAMHSNUg3Xf01?=
 =?us-ascii?Q?GeSwOpYXgHVZXXvSkp4nmuljjT+y5pUFt4JIurRI2T3tZo7SQek8pkXgIJCa?=
 =?us-ascii?Q?8doWHzXcmCu9vLsw2gBv4zJYoiMplscfk/QIrmKIuYFfPcRg320YyH4xAUw4?=
 =?us-ascii?Q?ZEdy58jF0wrGgF6ycAlh1XDp0tVe0E0ybdIdQw3tl/+gGtbe8w14p1WDBCgs?=
 =?us-ascii?Q?acR8T9Ceht50ytsEB6ogn2mgz42+W/NtS8rjbnQJxdLvvqwL1sKXSWm3KAWw?=
 =?us-ascii?Q?dZn4jx/wHPDU7b8YJAVL1Zty5LG+45Hn9CO9oQSeiC177RH0WApsdKDAM9Y/?=
 =?us-ascii?Q?pq5yjCl+IfVcZ1IseS9cm/z+eS5z8T/Ch1gQIN5K/Qf3964jwU6obUhHYks1?=
 =?us-ascii?Q?aw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a78f656d-2264-44ce-49aa-08dc89df23bb
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2024 06:24:25.3340 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h7I0gU3xKnLLl+fNx2+a3kz6C2FYu3wOxOhuBpf0M7Krr7GS7BK8FeiMEyQtJ7WqJY655QxVaPqjrMBT7Wlzzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4894
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



Hello,

kernel test robot noticed "WARNING:at_drivers/pinctrl/core.c:#devm_pinctrl_put" on:

commit: ce2701911ab8b371b9a93b6f9482f0577729d8aa ("[PATCH] drivers/base/devres.c: refactor using guards")
url: https://github.com/intel-lab-lkp/linux/commits/Andrea-Calabrese/drivers-base-devres-c-refactor-using-guards/20240606-194831
base: https://git.kernel.org/cgit/linux/kernel/git/gregkh/driver-core.git 1968845d358e108cfbfba45538d64b3cbdf04ac2
patch link: https://lore.kernel.org/all/20240606091744.1115656-1-andrea.calabrese@amarulasolutions.com/
patch subject: [PATCH] drivers/base/devres.c: refactor using guards

in testcase: boot

compiler: gcc-13
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)


+-----------------------------------------------------+------------+------------+
|                                                     | 1968845d35 | ce2701911a |
+-----------------------------------------------------+------------+------------+
| WARNING:at_drivers/pinctrl/core.c:#devm_pinctrl_put | 0          | 8          |
| RIP:devm_pinctrl_put                                | 0          | 8          |
| WARNING:at_drivers/base/devres.c:#devm_kfree        | 0          | 8          |
| RIP:devm_kfree                                      | 0          | 8          |
+-----------------------------------------------------+------------+------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202406111401.915dd40c-oliver.sang@intel.com


[    6.612845][    T1] ------------[ cut here ]------------
[ 6.613979][ T1] WARNING: CPU: 1 PID: 1 at drivers/pinctrl/core.c:1421 devm_pinctrl_put (drivers/pinctrl/core.c:1421 (discriminator 1)) 
[    6.615797][    T1] Modules linked in:
[    6.616639][    T1] CPU: 1 PID: 1 Comm: swapper/0 Not tainted 6.10.0-rc2-00003-gce2701911ab8 #1
[    6.618361][    T1] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[ 6.620369][ T1] RIP: 0010:devm_pinctrl_put (drivers/pinctrl/core.c:1421 (discriminator 1)) 
[ 6.621474][ T1] Code: 1e fa 0f 1f 44 00 00 48 89 f9 48 8b 7f 10 48 c7 c2 10 31 a7 af 48 c7 c6 d0 52 a7 af e8 dd fc 1d 00 85 c0 75 05 c3 cc cc cc cc <0f> 0b c3 cc cc cc cc 66 66 2e 0f 1f 84 00 00 00 00 00 66 66 2e 0f
All code
========
   0:	1e                   	(bad)  
   1:	fa                   	cli    
   2:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
   7:	48 89 f9             	mov    %rdi,%rcx
   a:	48 8b 7f 10          	mov    0x10(%rdi),%rdi
   e:	48 c7 c2 10 31 a7 af 	mov    $0xffffffffafa73110,%rdx
  15:	48 c7 c6 d0 52 a7 af 	mov    $0xffffffffafa752d0,%rsi
  1c:	e8 dd fc 1d 00       	callq  0x1dfcfe
  21:	85 c0                	test   %eax,%eax
  23:	75 05                	jne    0x2a
  25:	c3                   	retq   
  26:	cc                   	int3   
  27:	cc                   	int3   
  28:	cc                   	int3   
  29:	cc                   	int3   
  2a:*	0f 0b                	ud2    		<-- trapping instruction
  2c:	c3                   	retq   
  2d:	cc                   	int3   
  2e:	cc                   	int3   
  2f:	cc                   	int3   
  30:	cc                   	int3   
  31:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  38:	00 00 00 00 
  3c:	66                   	data16
  3d:	66                   	data16
  3e:	2e                   	cs
  3f:	0f                   	.byte 0xf

Code starting with the faulting instruction
===========================================
   0:	0f 0b                	ud2    
   2:	c3                   	retq   
   3:	cc                   	int3   
   4:	cc                   	int3   
   5:	cc                   	int3   
   6:	cc                   	int3   
   7:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
   e:	00 00 00 00 
  12:	66                   	data16
  13:	66                   	data16
  14:	2e                   	cs
  15:	0f                   	.byte 0xf
[    6.625180][    T1] RSP: 0000:ffffa68c80013cc8 EFLAGS: 00010282
[    6.626437][    T1] RAX: 00000000fffffffe RBX: ffff904e3c9df268 RCX: ffff904dc2ff1de0
[    6.628077][    T1] RDX: 0000000000000001 RSI: ffff904dc2cc0da8 RDI: ffff904e3c9df4fc
[    6.629687][    T1] RBP: 0000000000000000 R08: ffffffffb0b25f14 R09: 0000000000000008
[    6.631332][    T1] R10: ffffa68c80013c70 R11: fefefefefefefeff R12: ffff904dc2ff1448
[    6.633008][    T1] R13: ffffffffb12dfea8 R14: ffff904dc316c2a8 R15: 0000000000000000
[    6.634594][    T1] FS:  0000000000000000(0000) GS:ffff9050efd00000(0000) knlGS:0000000000000000
[    6.640486][    T1] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    6.641757][    T1] CR2: 0000000000000000 CR3: 000000017b21c000 CR4: 00000000000406f0
[    6.643386][    T1] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[    6.645004][    T1] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[    6.646657][    T1] Call Trace:
[    6.647410][    T1]  <TASK>
[ 6.648104][ T1] ? __warn (kernel/panic.c:693) 
[ 6.648930][ T1] ? devm_pinctrl_put (drivers/pinctrl/core.c:1421 (discriminator 1)) 
[ 6.649920][ T1] ? report_bug (lib/bug.c:180 lib/bug.c:219) 
[ 6.650828][ T1] ? handle_bug (arch/x86/kernel/traps.c:239) 
[ 6.651843][ T1] ? exc_invalid_op (arch/x86/kernel/traps.c:260 (discriminator 1)) 
[ 6.652811][ T1] ? asm_exc_invalid_op (arch/x86/include/asm/idtentry.h:621) 
[ 6.653845][ T1] ? devm_pinctrl_put (drivers/pinctrl/core.c:1421 (discriminator 1)) 
[ 6.654844][ T1] ? devm_pinctrl_put (drivers/pinctrl/core.c:1421 (discriminator 2)) 
[ 6.655807][ T1] pinctrl_bind_pins (drivers/base/pinctrl.c:93) 
[ 6.656804][ T1] really_probe (drivers/base/dd.c:634) 
[ 6.657723][ T1] ? __pfx___driver_attach (drivers/base/dd.c:1155) 
[ 6.658761][ T1] __driver_probe_device (drivers/base/dd.c:798) 
[ 6.659886][ T1] driver_probe_device (drivers/base/dd.c:828) 
[ 6.660925][ T1] __driver_attach (drivers/base/dd.c:1215) 
[ 6.661869][ T1] bus_for_each_dev (drivers/base/bus.c:368) 
[ 6.662840][ T1] bus_add_driver (drivers/base/bus.c:673) 
[ 6.663820][ T1] driver_register (drivers/base/driver.c:246) 
[ 6.664784][ T1] ? __pfx_acpi_button_driver_init (drivers/acpi/button.c:743) 
[ 6.665950][ T1] do_one_initcall (init/main.c:1267) 
[ 6.666882][ T1] do_initcalls (init/main.c:1328 (discriminator 1) init/main.c:1345 (discriminator 1)) 
[ 6.667815][ T1] kernel_init_freeable (init/main.c:1582) 
[ 6.668909][ T1] ? __pfx_kernel_init (init/main.c:1459) 
[ 6.669973][ T1] kernel_init (init/main.c:1469) 
[ 6.670856][ T1] ret_from_fork (arch/x86/kernel/process.c:153) 
[ 6.671756][ T1] ? __pfx_kernel_init (init/main.c:1459) 
[ 6.672770][ T1] ret_from_fork_asm (arch/x86/entry/entry_64.S:257) 
[    6.673765][    T1]  </TASK>
[    6.674467][    T1] ---[ end trace 0000000000000000 ]---


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20240611/202406111401.915dd40c-oliver.sang@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

