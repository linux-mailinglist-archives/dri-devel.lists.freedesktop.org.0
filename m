Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA736AC0F85
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 17:10:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ED3710EAB6;
	Thu, 22 May 2025 15:10:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RDpxWvX0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA11F10ED2A;
 Thu, 22 May 2025 15:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747926626; x=1779462626;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=GfgvBsNBk3nO8NneWgDWxWYGtj/5UgSyebNCYiTvNCA=;
 b=RDpxWvX0JGBby5Odq7+RM/Ri84HOWdXWGYiaoybol6RXNvBhB+G1l50j
 z4G8XXGMcL6ylnwVB+9UbQpNLO07YsNnP6YQNxhpIcpb8PDmupYdKn760
 Uq/u+QltI/c3JXz2dSa0pBdbqbdCg625SJDhYhC/J4p82T0GMd12r1u+O
 WJg+9hiUzjjyaSlogGokD8raT8Yb48UBCb/HQ38E7+XLBQ0BWVhbx52wl
 LbH7xuVDaO73z/Kp6nt/X421FjyU73+6SDXh4ElLBwhA2R+nH2ReMiJBu
 wx9A1R4ATJcFh+4SLAFaPwPB1uVO2qPHPRAfsTdSWbM3I18/fwazKZ+3d w==;
X-CSE-ConnectionGUID: BIY1P1H4T8a6z9cS5XSfBQ==
X-CSE-MsgGUID: C7uTMOTHSsW+ng9fgPDdkA==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="72488318"
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; d="scan'208";a="72488318"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2025 08:10:16 -0700
X-CSE-ConnectionGUID: zhgzDPZ7S+WmuxWs5tCndA==
X-CSE-MsgGUID: YGaUD8LkQLKoYS/dgug0Sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; d="scan'208";a="140507956"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2025 08:10:10 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 22 May 2025 08:10:10 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 22 May 2025 08:10:10 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Thu, 22 May 2025 08:10:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e4QXt0/yX77Gb4YbwI3bmu30y6r9UNG4uczhqE0+eBywLDMcIu1TDmr6CjfCm7Dyf7GQzLNx3AGfNM9oIjx+ihupjzZXC/9uMGR+CC68wEhAJBRbgz9ARPbW35o6WnhR4MLCBrCfhGiL0zHV9dSpUwJdMH77t3I1T47peHC5HQf3rYqZx6F1yG5sGtm8P74f4BWrYK0oDU1HbE8YvuMrAHR8yqeV3Mmg9r12eQpQZiVMJTkFOSP3lSuyH/69gpU4i83N2mEp/lRhvdmoCGFtEtXliRHh/uPtDxQLXD6LmmLgkfm/TMebO0oK+5weYxe1t7DZOzeySjzi14guyY+r7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9YVJQa8yVEHCcW16/u/FlpD/45B432D6muEJUsTSDFo=;
 b=NTXWfOeGwhE4CtBQp1tlP806EtepsIDZiF+6bsdmJdoAVXyFh7gCwi2lkPmWd+Vqbx0NcTBGN1jtiFiyXVf2T/FdcNmNmke3LKJXL4gJ/D45C9Z9GR5CezGspz+z+o7CxHv5s/kFaY+lvhW2HDTv3GEb8rUoBsBaIIHjvPGBInslH0WX99YNdcWYk1CVVZx/2BjzfHhAOqyW4fOZ/+oTxgL9q1opFJBwifInVxI9buE0DPIwWklP8FAV+E11Mr/iE5USoEVXsRqOF023Vv9NokLIXi0I6j9PjPc3dj9wmbo8AgYJA+1JS4G/6MI1TxV++fBevN3iKjSCtzbAz0rUng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH8PR11MB6729.namprd11.prod.outlook.com (2603:10b6:510:1c5::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.36; Thu, 22 May
 2025 15:10:01 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8746.029; Thu, 22 May 2025
 15:10:01 +0000
Date: Thu, 22 May 2025 10:09:58 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Dave Airlie <airlied@gmail.com>
CC: <dri-devel@lists.freedesktop.org>, <tzimmermann@suse.de>,
 <intel-xe@lists.freedesktop.org>, <Michal.Wajdeczko@intel.com>
Subject: Re: [PATCH 9/9] iosys_map: embed the is_iomem bit into the pointer.
Message-ID: <wz6cduq6kh2n2pwxm3q75vjmrsht4rvnbjnch5t66kj773t2rj@kfk2bj7pewwm>
References: <20250522065519.318013-1-airlied@gmail.com>
 <20250522065519.318013-10-airlied@gmail.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250522065519.318013-10-airlied@gmail.com>
X-ClientProxiedBy: SJ0PR03CA0294.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::29) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH8PR11MB6729:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e4f0b08-2ffe-4013-9ad0-08dd9942b918
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?mmZMzSXoyFSjtE8tfVB8riLvvgTGXWBuILS05GT9rKteB7nRKOxVCmSBr8GZ?=
 =?us-ascii?Q?ILAfqAyVPctOxGWw60w/BdbE12x0A/T80zEuBKtFlT6F6QHGn42H5VsAQDUu?=
 =?us-ascii?Q?zbhfS6ZC0G1LV2ATcHyyb8oXGZ6k0+tlfijd0tTQs8LyyOycpteAgxx8hL28?=
 =?us-ascii?Q?NRnl65QQ3/FqN36umiplIKcPWbttlc9X3t0l2UThWfgIr9rNkwX+u9cDB+8G?=
 =?us-ascii?Q?Wa3QD3k1Qanou+PgxhGLDr/c94ZNGQln/if7oob0z79m5NTnHwVeMocDkFau?=
 =?us-ascii?Q?VwoZzwfpOP6UP6YBaHumJJMJyvuhY1uxez1/WT1OhDCSjMVE9XrHDF1XZOBY?=
 =?us-ascii?Q?7jNIia/uwdTjDKLKcw0U4MnzTQj2khtBp53UQnGs9xKKu9Tc+qVytSqVfp7t?=
 =?us-ascii?Q?c35YJvcdDO4+KrboTvh8OS6bi3Htqero+iOiAFp/wdFinTv3WSryx2T2XfKq?=
 =?us-ascii?Q?PVDVW5Mgiip/XpmtreqOTSr5LkdEhDfHH1xYJ6j117bOMFJ9rmdYSsWZFsQv?=
 =?us-ascii?Q?6WyZFBzMSGiNmE1l0i6+3gUdL/86+qa1njfYCWX8kk2vnkPI+aECAr3O4bay?=
 =?us-ascii?Q?BnyMZV1OdbSG8SSflk6LE7ORvgpmEUrOkOlsuvM0A0I8jveQQWUsnpV/7oQ+?=
 =?us-ascii?Q?qGNt1vNqWHcqxfBGqlThgig8p+0j/HsIE/D1qHSwkRMdPpMQcBFqeCOZ6MbT?=
 =?us-ascii?Q?FHBQPVAlQDCwMzZLXAA0aE69qzh+d3DAO3Lv8VsRTrzPHumpvppQdmA6/GXn?=
 =?us-ascii?Q?LWbDeKe4VN6cGtRs3SDEWuI6SJ7exZRBl05+uHEcIcNE0LIbFncCqzWm1BzW?=
 =?us-ascii?Q?X+5Nf7OHpGAwoVpgYQWoqF/0BE92Fp2pLT3X3IeKnwFw3s0HwOK/J6he3Q7H?=
 =?us-ascii?Q?9lvmsLHaREiDQMzx07nK+QPBn9d0KBzo0v2u8ZNSfIsruRvaKlP6UsNlND5+?=
 =?us-ascii?Q?THapJK/8UFGi8ap0v7luqel9SwLcLL5PciCl+DVyGSE47kADVjGC7R0iqCIj?=
 =?us-ascii?Q?59qvQSgTNgZ9miGWhJLOLMJXKpm4j/bsA68n9nm9d1lGuLWZvDM0Bsr8WGdQ?=
 =?us-ascii?Q?+ZSB/So5oj/NsBLVWwB3U3yHWgMrNZN9yb0C/966w21kaaIspEiPca/H8XLe?=
 =?us-ascii?Q?rKwAPDNhatKcsOamekdQDLDMAdKuPBIXa/2uvJKPXtI+0q34qX67R3+J8ob5?=
 =?us-ascii?Q?Ec/tVVgzBWq28iNGuM6Tl/9W049mGW7deTXETfr6xD+6mtT91aCVP9z2czFE?=
 =?us-ascii?Q?KUs1IbKK4Mx/eOC2hiDbeFjRBiu00+phPkUoE81fGBBTw23cgCY9fOJ9OLoU?=
 =?us-ascii?Q?4hbisxvds5Uh/3ICwEn4L1dHYpu7sZoGAOWgw27Grz9z3slf4eFShj97D58W?=
 =?us-ascii?Q?TwbR8r8VzYbxcnCa5bCU9y2uGFO1XfvrYo7oUH8Kgj/XRo+N0o9CmG4vDCLz?=
 =?us-ascii?Q?iHPIJf3j7gs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?u/XFDk4+7+/f9/Sc8/qGebpZP6zK6rZqSLIB+HL7WBcfgAxrsBm8DP7b2C2r?=
 =?us-ascii?Q?80UcQil3qPs6OIdhInAGQCFbw8c/3L4D2dnpfsvtiVgdCvoVLSOJbn/XTuUI?=
 =?us-ascii?Q?lXqVDFpgAQ8ND97vg0kERr9JvNG4hLYgrlK5ppTKYNY4eYroszbbYhPoHeDP?=
 =?us-ascii?Q?/07KTXBvZERVwdq4VvSA1mkeKH9nrWAvcwD/OIhDvCO88QYe6q8MDuNI9GhO?=
 =?us-ascii?Q?Mxgq7IMsXPF/xcd6zwwfKV1of0ItxZVs6yvFKLQI9SsEhAbisaXB4tfi+y9b?=
 =?us-ascii?Q?GAIUIIX9WX6mJXOOE6j4l3xVZmXxRLg2a/2y2z1Wg4cWrFcU0KRnzyz2TmIj?=
 =?us-ascii?Q?7Ly6+c9ueGUePSv1ewZjkyYwtN0YzNTnjY3+booGKSgB85+rCp6f44z817s5?=
 =?us-ascii?Q?RZpdxU+baejU+G2s9VabyfmPy1lKr5R8IXfkPQRhyF+hPk0gnLKgjlpuiwfi?=
 =?us-ascii?Q?jM95kDBsLTKetcqRLdkKtBy82XFfJGwVF9n1ZGsdQWtPh2aXpOd38HvEsJbF?=
 =?us-ascii?Q?7mg5mJRWd5dVSB3CWEWcQcW4kTyAeANwTJ8/PX4/E8cKy6APRC5rkqiklM08?=
 =?us-ascii?Q?BhVrDb5oi3DSm8SPpDoC29C9Dx7nH+KBB8T2hAdBQMqPxkocIXqtGnCAR51Q?=
 =?us-ascii?Q?o5AlY4oW5aw0bPJxY4QFgakYgfP2hggZSA9XwLE03fJVnardXYdq53NODpXL?=
 =?us-ascii?Q?HD6g55bwzfz4HRKaj3XiodsWn/Z81m+MU0x4AJc0ey+1tba7zOZZKYvRnKQa?=
 =?us-ascii?Q?pdmUGKLw6wJ/a4fdDGpKxc4Wt3b3CUJSAJdIcQ7Ohyjb6/1AFXuqGl1eW2QH?=
 =?us-ascii?Q?I10Z0z6zpQOPkXXzld+E8u0nCPZaIkQ5HEpWvoBZZNtcGLX9gDWcE/wfwT33?=
 =?us-ascii?Q?ZqlN7xwf2e1j2232sNHAVmzplnii/uTU73If6SIGMoyykiJFYI/4GN21MlLB?=
 =?us-ascii?Q?WC/41tUsTy4IUQg75Mw+CEEdtfv0wn3hQX8iJsdIySHZ674qf0JfPACx+AMF?=
 =?us-ascii?Q?0TkWzS6jAUIVoZH9Jny2zq+LdRvDx78PAmPqm0qyRDdiYSHqk2qL4x4fVJp9?=
 =?us-ascii?Q?9OMA7ThYWtY8OETS38KLqVMwiLJxTULThZtgHKX4sjCo/U3EhfZ25wjZVD1f?=
 =?us-ascii?Q?uGdlTWMAzT57zAH8d/kfUygO8AI3o2M+8N7eKy0eoSLL6BVckHMLLqtjhcUV?=
 =?us-ascii?Q?9X0eKSHb5C6hiCSKc0bMsf8KFuyTcXy8HDuLsRizmoEJRGR1Up5tkFnnTzZc?=
 =?us-ascii?Q?drVnJaVtCOobX2QnVITRHaaWeagMu3p40m16YS8YjyG2OeD+HDN4dJrin4Yu?=
 =?us-ascii?Q?QLplRoQ+zf2l+xCoUiCW8HvXsd7Daq4oZlKVbBITnF/PJLD0nJa9CoTGG/4w?=
 =?us-ascii?Q?L+CiRKRypGLVFfXoGq70yExN7MKzZY1kGGEn4t3G31dtjziQicrSCx/eb5Gl?=
 =?us-ascii?Q?cNARKPCJSYSrTNU7FrYfwywuU7MxgNRxAu9rgkFiv1noun/9SlL/E4t4FIjh?=
 =?us-ascii?Q?mELmCij4JMr0UXDwJG2Yv7JZhqX9uPTP4Y6OL3jxTP8D4puNOA0cbXQmYxU+?=
 =?us-ascii?Q?yjdOEB9V/++ulx6QOXZJYPkY+MrywEqOtfu+A+nMWnkXjNOJxs2RiwPD2i0j?=
 =?us-ascii?Q?Xg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e4f0b08-2ffe-4013-9ad0-08dd9942b918
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 15:10:01.0549 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YzE3e/K+mhHgreVMrlBTUDwAMSwSw383hx4h4ZLjW0HJth9hcajYO1pTO7VXC+CRDjZN+dNg+vaWXma/6WGOWzp7UMWWnLG7QSjWjGy8PTg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6729
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

On Thu, May 22, 2025 at 04:52:18PM +1000, Dave Airlie wrote:
>From: Dave Airlie <airlied@redhat.com>
>
>This reduces this struct from 16 to 8 bytes, and it gets embedded
>into a lot of things.
>
>Signed-off-by: Dave Airlie <airlied@redhat.com>

Replied too early on cover. Chatting with Michal Wajdeczko today, this
may break things as we then can't byte-address anymore. It seems
particularly dangerous when using the iosys_map_wr/iosys_map_rd as
there's nothing preventing an unaligned address and we increment the map
with the sizeof() of a struct that could be __packed. Example: in
xe_guc_ads.c we use it to write packed structs like guc_gt_system_info.
In this particular case it doesn't give unaligned address, but we should
probably then protect iosys_map from doing the wrong thing.

So, if we are keeping this patch, we should probably protect
initially-unaligned addresses and the iosys_map_incr() call?

thanks
Lucas De Marchi

>---
> include/linux/iosys-map.h | 30 ++++++++----------------------
> 1 file changed, 8 insertions(+), 22 deletions(-)
>
>diff --git a/include/linux/iosys-map.h b/include/linux/iosys-map.h
>index a6c2cc9ca756..44479966ce24 100644
>--- a/include/linux/iosys-map.h
>+++ b/include/linux/iosys-map.h
>@@ -99,29 +99,27 @@
>  *	iosys_map_incr(&map, len); // go to first byte after the memcpy
>  */
>
>+#define _IOSYS_MAP_IS_IOMEM 1
> /**
>  * struct iosys_map - Pointer to IO/system memory
>  * @vaddr_iomem:	The buffer's address if in I/O memory
>  * @vaddr:		The buffer's address if in system memory
>- * @is_iomem:		True if the buffer is located in I/O memory, or false
>- *			otherwise.
>  */
> struct iosys_map {
> 	union {
> 		void __iomem *_vaddr_iomem;
> 		void *_vaddr;
> 	};
>-	bool _is_iomem;
> };
>
> static inline bool iosys_map_is_iomem(const struct iosys_map *map)
> {
>-	return map->_is_iomem;
>+	return ((unsigned long)map->_vaddr) & _IOSYS_MAP_IS_IOMEM;
> }
>
> static inline void __iomem *iosys_map_ioptr(const struct iosys_map *map)
> {
>-	return map->_vaddr_iomem;
>+	return (void __iomem *)((unsigned long)map->_vaddr_iomem & ~_IOSYS_MAP_IS_IOMEM);
> }
>
> static inline void *iosys_map_ptr(const struct iosys_map *map)
>@@ -136,7 +134,6 @@ static inline void *iosys_map_ptr(const struct iosys_map *map)
> #define IOSYS_MAP_INIT_VADDR(vaddr_)	\
> 	{				\
> 		._vaddr = (vaddr_),	\
>-		._is_iomem = false,	\
> 	}
>
> /**
>@@ -145,8 +142,7 @@ static inline void *iosys_map_ptr(const struct iosys_map *map)
>  */
> #define IOSYS_MAP_INIT_VADDR_IOMEM(vaddr_iomem_)	\
> 	{						\
>-		._vaddr_iomem = (vaddr_iomem_),		\
>-		._is_iomem = true,			\
>+		._vaddr_iomem = (void __iomem *)(((unsigned long)(vaddr_iomem_) | _IOSYS_MAP_IS_IOMEM)), \
> 	}
>
> /**
>@@ -198,7 +194,6 @@ static inline void *iosys_map_ptr(const struct iosys_map *map)
> static inline void iosys_map_set_vaddr(struct iosys_map *map, void *vaddr)
> {
> 	map->_vaddr = vaddr;
>-	map->_is_iomem = false;
> }
>
> /**
>@@ -211,8 +206,7 @@ static inline void iosys_map_set_vaddr(struct iosys_map *map, void *vaddr)
> static inline void iosys_map_set_vaddr_iomem(struct iosys_map *map,
> 					     void __iomem *vaddr_iomem)
> {
>-	map->_vaddr_iomem = vaddr_iomem;
>-	map->_is_iomem = true;
>+	map->_vaddr_iomem = (void __iomem *)((unsigned long)vaddr_iomem | _IOSYS_MAP_IS_IOMEM);
> }
>
> /**
>@@ -229,12 +223,9 @@ static inline void iosys_map_set_vaddr_iomem(struct iosys_map *map,
> static inline bool iosys_map_is_equal(const struct iosys_map *lhs,
> 				      const struct iosys_map *rhs)
> {
>-	if (lhs->_is_iomem != rhs->_is_iomem)
>+	if (lhs->_vaddr != rhs->_vaddr)
> 		return false;
>-	else if (lhs->_is_iomem)
>-		return lhs->_vaddr_iomem == rhs->_vaddr_iomem;
>-	else
>-		return lhs->_vaddr == rhs->_vaddr;
>+	return true;
> }
>
> /**
>@@ -279,12 +270,7 @@ static inline bool iosys_map_is_set(const struct iosys_map *map)
>  */
> static inline void iosys_map_clear(struct iosys_map *map)
> {
>-	if (map->_is_iomem) {
>-		map->_vaddr_iomem = NULL;
>-		map->_is_iomem = false;
>-	} else {
>-		map->_vaddr = NULL;
>-	}
>+	map->_vaddr = NULL;
> }
>
> /**
>-- 
>2.49.0
>
