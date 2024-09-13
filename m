Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E497F978928
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2024 21:54:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F05E10ED4D;
	Fri, 13 Sep 2024 19:54:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nSZWYW+7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C51C10ED4D;
 Fri, 13 Sep 2024 19:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726257295; x=1757793295;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=jakCn51y8k2Msxnjsq+fpKMwK3HgzkHo+Sm8e7Ubg14=;
 b=nSZWYW+7MegstTdtQMmmfFBoprcQtHRDZg2/AzDKgznNL/wHmmr+qdec
 JMeo+0Lij/pnrk3lZI8ezf1qXQexhgKxziMU0yP7f2w39nv0k3ue3CVVO
 zMB1AysTI3mE+FIazvMrhjDAA6ZGa3L4cg2RZDlP5+NjhxfQTMlxPJjZ0
 r9Zum+Jyj1Iu4O/YwLWNa3jTtO7Xnj/A/DCttgBAQfJNbd4plUVlrbI8n
 mypwnaDHP3FsdDLETxiW4zL0fOLki5fKKkK0bDmIhywiIQ6QkTcVMBgnI
 LcQQCjbtF+2TSH4PIaWmVgA8g3kobNJSRdaSEZPVnumXkXke3Sf3svz1K Q==;
X-CSE-ConnectionGUID: ff53eYjhST2K9nSp10fwSw==
X-CSE-MsgGUID: G/J2HioOSXy/NXbRcHmpPA==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="36520175"
X-IronPort-AV: E=Sophos;i="6.10,226,1719903600"; d="scan'208";a="36520175"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2024 12:54:55 -0700
X-CSE-ConnectionGUID: yBj2U+zsQDiM6WiKQLGqVQ==
X-CSE-MsgGUID: 6u6S0N0bQeyVJhKRdSvlyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,226,1719903600"; d="scan'208";a="67882912"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Sep 2024 12:54:55 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 13 Sep 2024 12:54:54 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 13 Sep 2024 12:54:54 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 13 Sep 2024 12:54:54 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.46) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 13 Sep 2024 12:54:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A4LEQR13uxmE8BmfLrInF6fGVon393UywRR7Jdj7A2uM4FhZ0sUe06b+v+GpzlYaZdlW6eJDTrfSIy7QxVh3JgwG0UpmqHE3593RTy+TrjAqCwq3Cc9gfFZyG1GgvHydIfFr8fSlyXqdXOxYZ6nVNccuMVCWOtDD6lWJf+UqVXozSXd0IO5r83iGPBJYTp/kdLu96ddSXKJ3HUXVkzlO8TTU95sWSjrdWT3j4BWmLXpgxAodVanIL8mR7fdX0IR70rI0coVRBiRzajTkMqvk81kDdLBTckAOfV6rFqMcKzTG0N9iC7Rg3SOLcSXI2NB9FEISjTeQgTP1p0+HW5M+FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aXD4wazc+uWn/9ax1RLxOfTZ9XN+uVlxb7hRxgsYg1A=;
 b=NEKhJZnqC1a+Xm6qTEbB/n54Wj4/GUNAYNIwtFyILVRaLporXztrwC+OKF5VGy9ajJVrvF1pVqAy7ZWQwZlq6yCgEHsLN5h1eOrK0BABx8aXcWMjG9VVSFff9lAWsFcnxx3Z7/QXUQTRJPlmW8ZkpSOYhcM0UphOed9y+cMlCEPN4T1iZxznGBDfAZPCbqRejas1RTTX5rG4/NSzTC7XOfKpY3AtW+78N8d3L+rZl3BPU9bzMIrD+9Sf7WQWv8IEXbGpr4YI4bb2afP3xZlL4/NjPgK9f7HX9t+6MtajJHz3IxQy7QQBqj9G2b8IGWFZyy0emra8mKx/4GVVnA1vvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB2859.namprd11.prod.outlook.com (2603:10b6:5:c9::14) by
 CY8PR11MB7848.namprd11.prod.outlook.com (2603:10b6:930:6c::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7962.18; Fri, 13 Sep 2024 19:54:52 +0000
Received: from DM6PR11MB2859.namprd11.prod.outlook.com
 ([fe80::4063:4fec:bf76:f095]) by DM6PR11MB2859.namprd11.prod.outlook.com
 ([fe80::4063:4fec:bf76:f095%7]) with mapi id 15.20.7939.022; Fri, 13 Sep 2024
 19:54:51 +0000
Date: Fri, 13 Sep 2024 15:54:37 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
CC: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 <lucas.demarchi@intel.com>, <thomas.hellstrom@linux.intel.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, Abaci Robot <abaci@linux.alibaba.com>
Subject: Re: [PATCH v3 -next] drm/xe/irq: Remove unneeded semicolon
Message-ID: <ZuSYffyZCKW9YJMp@intel.com>
References: <20240913060254.26678-1-jiapeng.chong@linux.alibaba.com>
 <6bef5f38-5490-4cd0-8e8f-2b2271d20d44@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <6bef5f38-5490-4cd0-8e8f-2b2271d20d44@intel.com>
X-ClientProxiedBy: MW4PR04CA0251.namprd04.prod.outlook.com
 (2603:10b6:303:88::16) To DM6PR11MB2859.namprd11.prod.outlook.com
 (2603:10b6:5:c9::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2859:EE_|CY8PR11MB7848:EE_
X-MS-Office365-Filtering-Correlation-Id: 54f1b278-9e6a-4843-637f-08dcd42de864
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?lGUw3wn4ME4z/Wti8rbNOWP/uPjhKECP33tMu0RLLmcIM/m1ip7twApC0LG5?=
 =?us-ascii?Q?RtN/OVgTSSWzu6zt1MEiD23jSWnZmIQMf/IU6vhCfRGVm6utpym5ATYM2Kbc?=
 =?us-ascii?Q?pOLKBgp9AI4q8KBor5nxBszZf/EZLkjA9L4XwiEbjIT+Yxwbg20bXZROR3jL?=
 =?us-ascii?Q?S851ZsmIexSvxopr8Up4n2Cm4H6qGEAbT8JF8u5MxpLhg/ClQh/l/+HyXKxE?=
 =?us-ascii?Q?WTtHxfu5jbaGy6+v8ONFths5vlPav/8TfY2Pd7373+p45QNdTLogKMdIL98Q?=
 =?us-ascii?Q?CG8LXO/JDMfm/JNPpR+D5Q+LaiV4f0ZXxVGj+LobviUOsWdeKvmvWb/43bvn?=
 =?us-ascii?Q?dT8xY3RWcBgCnapnfep0/wNF8JHE64XvFh69MyKLPREigFyx42nRt/bfbY9i?=
 =?us-ascii?Q?//vQYBAKoncKT56ffGScrkMmcxFSSkCrnFgtsEYwV1d6Ox7yHB2mYRRGKWdI?=
 =?us-ascii?Q?lDjeRbryHaCo7NKWxED1GyZkNSad/QLJy5JIyz3hJxEp37YVjfB/PzDet+A3?=
 =?us-ascii?Q?obQ9Knt6DSN6ss9hJ5HYFnWRBPXTW+Pr74yYgU1kO9pcMQ5zZBjmRP89eQU8?=
 =?us-ascii?Q?Eux/bcuk5JM+/U7sBQ1WDUb4jjKpV1kQJhPcvrvVU0aRramq0wf5lF1Ux8Qr?=
 =?us-ascii?Q?zmM4I+b0dT/cMaHVyS2OVmCt+uJEh2AupUyWZdFyIwzkrJobwmc32PKHfr6V?=
 =?us-ascii?Q?hw3MPDeALqy14oGe0cCoBi0TRlOsJ/9dpc2YVztGhdhEWolfveN9FXTNbqAQ?=
 =?us-ascii?Q?okeiddpwCHRXeTIX4YrkLIZAYqffWBKFFduG3iNwF5iQEIYGR29hYC9xQ8Td?=
 =?us-ascii?Q?WCeL0grOw5nzVzuBLlimhxMa4byFhdOeXw3yzM+YN3p4iOHRAwa9A6qNIEbp?=
 =?us-ascii?Q?08jgiOiKc/dHZj+vAcvkOQbROKnJawKMaisyfX1sO3I0sJmfM4oFilNzbor8?=
 =?us-ascii?Q?sb0nC/Y8cSfIgnEAGBLBi8Up5sgAv8DexXQRUuUsnaHpXRhiyzIXBy5KvYtK?=
 =?us-ascii?Q?4PA4ssSATtCdGJioK9MeXwY4p9zZO3CoLi+5eK/6xRgr5aql/bmUhApKvbMV?=
 =?us-ascii?Q?7J795Eo3lKtKmB2+susHykJ1lqg37XM6xJ5MryJR+wAPeyGDeF5AiqA3D9QL?=
 =?us-ascii?Q?eVW7olNmi+cGmLa4FkLX7hu8JrDVcDflftLDZg8RJkBKHEjtsinkxOkM3WRc?=
 =?us-ascii?Q?mulm5nOAHoyYM9NNvG4HmlHJkQntsQ2uDhhMXZsd4gPLJzOVTfooPmC/YgLI?=
 =?us-ascii?Q?XjREM4yOaCjN/fmX8Ee9XnnQuMo0Q7KbPZHbiV5M6dzjvWpHWxnDJif3ABVv?=
 =?us-ascii?Q?fn4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kh5KcC9O0G4/raOiPlsAGY7O3/rcwbmPw/6ShIHaV9vJbQuO+ofCzeE+Ngp3?=
 =?us-ascii?Q?Rx2Qy7ydKymMgIkdReCxOXyQwxKJtbJghFJTvMrlrazhi9Iz5Nj7viajrF5N?=
 =?us-ascii?Q?hkGlWljHNE6N8pHgbEMPuyP+HAanxs84F5PlCvS/ihbIVDy5TkAQHj8aL0tB?=
 =?us-ascii?Q?05xvnobYu7mUiGjkmxQjEsU9ACU91XwaatZ8TesRMJFhmOPxfA0epjn0boeY?=
 =?us-ascii?Q?TLZzquowQTizkksexGXyWHzqTGe4b/G1IpBsa3INqc7ioAqwAqg+98BNjNsy?=
 =?us-ascii?Q?CPmeiJ94JwgUgEsqZfhdmFLB7yzDz6xtjtFEyCwqEiFlzJQDYj6YLiH49Ss7?=
 =?us-ascii?Q?IIdTzBRf3I0lq/53MSuutVgXx6G78vhbfN/zjw/vVdgP00BftvCjm0GEvysc?=
 =?us-ascii?Q?v2jItXccVMXMS2wyg+61sdKQyJ4cwOYEpste4i/bJTDeCku5LySWRhf+QeML?=
 =?us-ascii?Q?1+A9HWkeX0sCj2LgZ/CC0/XBqBP9SZNJ1IXJLnqSL0Sz5pqzuXuwc2YmCiUr?=
 =?us-ascii?Q?jhT9Wt7zkiYKV3ZYEePKlIIiHnjqQka7fK4rCBl4Mgq4ypd4ORtzMlNbCMF+?=
 =?us-ascii?Q?b/7gxnu5jnTjMRy0pD2Qnmoaj7JOF/9uOfKrYuEP1F7xxzvZEzY2pOxNliHV?=
 =?us-ascii?Q?3f9fAnc0qNPE4Hlr6177wSPIby4F51S19GsQOWQFRSfN2d/u7pvrZ4RdRGm+?=
 =?us-ascii?Q?d1N+OM7XrihZr/jTQB4n0lkbI5fkim1GR3ogcvQwJLvAP5DBMPEJ6Ei3MwZJ?=
 =?us-ascii?Q?rn4DPpCNmWVElEmNF+WBKPckTT4h5q8xDNtMeGEIHWJuZM95cGj3sm1F4Xdo?=
 =?us-ascii?Q?w4ld6w3QHnNCDOjtuC3snjA4296B/O9m7UwjgLqg1LOIok10D/FaUK4VUfVz?=
 =?us-ascii?Q?ReClXgU+sPant9iAxT6f59OThDDuxzlNuG6hXnKXQGk/Vkrz5dxKhx/dY/+/?=
 =?us-ascii?Q?LqT+/VI0V6YjbSAd55pdL5GQN/be97xxQZt8xxGwVqTuZcQUkWrW3IhyQE0S?=
 =?us-ascii?Q?RHfuVA/Ewuhp4YAmG0Sq2eEP614HuFtDhU3NbKvE+aNFAHdu5hKK8li3wwWz?=
 =?us-ascii?Q?t/aEjS2C6BEAqIAqDmxwtj3o1nkTFHApekDxnoJkvZ68cKK5OrRjRx51JxYq?=
 =?us-ascii?Q?4GDpU6RulMZXjH7T8fj5mEpFFH6ZEBOwWud76xaQAe9/fr2bFf5K4yfXQeRc?=
 =?us-ascii?Q?wequkC5COCNigQbP7O7Wx4UPWhiPik/WgxYmMxT+gfFneuCBvoz3t8w/8iOD?=
 =?us-ascii?Q?o0fCUAuRVBaDoLAJfk1gkMv0z0kSGV7Bk9H3BTOJVf43zKmMszLZGohlrerk?=
 =?us-ascii?Q?VchxPox0p4fL5NoKdMEW0a42LhQBMuHn9yclNbqVEkdf/koORY4WSzdNDk69?=
 =?us-ascii?Q?weKfrOs0HfGNKo+l5VGR1s89YMopg16SUGR3J+8g5AgH+i0U2D4QNvrjGmYn?=
 =?us-ascii?Q?zUz6jAD9w+xiL1HkLF3dELkxf9YBAWa1UOLWA+WtVDCJLSKSuqnIOnf4Q24W?=
 =?us-ascii?Q?awkAqAF7wgOxr1sDVPHBIwzRgwVGt8wPIhUayxErDPx0gFB++AhvlWtjOW7j?=
 =?us-ascii?Q?ofH6o1pPlteuGB1icgrTDWJg4dRS0hB5Cwahq5dkuNF3lIvZnvHONX1dOtS+?=
 =?us-ascii?Q?wA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 54f1b278-9e6a-4843-637f-08dcd42de864
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2024 19:54:51.0144 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZR1ZoKnSSA4inIkrD6wWfsJNE7ZR52RVUzLBdNLd9ARc9aJ85xfm5z7xGL7o6YxJo/5yKnxfnyc38CZG6WUzFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7848
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

On Fri, Sep 13, 2024 at 11:53:05AM +0530, Ghimiray, Himal Prasad wrote:
> 
> 
> On 13-09-2024 11:32, Jiapeng Chong wrote:
> > Remove unnecessary semicolon in pick_engine_gt().
> > 
> > Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> > Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=8757
> 
> LGTM
> Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

pushed to drm-xe-next

Thanks,
Rodrigo.

> 
> 
> > Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> > ---
> > Changes in v3:
> >    -Amend the submission information to "Remove unnecessary semicolon in pick_engine_gt()".
> > 
> >   drivers/gpu/drm/xe/xe_irq.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
> > index 07577b418205..e501002e8a04 100644
> > --- a/drivers/gpu/drm/xe/xe_irq.c
> > +++ b/drivers/gpu/drm/xe/xe_irq.c
> > @@ -280,7 +280,7 @@ static struct xe_gt *pick_engine_gt(struct xe_tile *tile,
> >   			return tile->media_gt;
> >   		default:
> >   			break;
> > -		};
> > +		}
> >   		fallthrough;
> >   	default:
> >   		return tile->primary_gt;
