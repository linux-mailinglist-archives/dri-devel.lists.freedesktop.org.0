Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6810A950744
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2024 16:14:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E7D910E36C;
	Tue, 13 Aug 2024 14:13:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hh7VT9ZK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C583810E36C;
 Tue, 13 Aug 2024 14:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723558437; x=1755094437;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ODbTtIqdfbg7u5AVhXZrkV7e64tpachU1YvgVapZoa8=;
 b=hh7VT9ZK7XLuUEABlHIwE5nia8HPOVqEAMpfCopEmwJijAvEqlcSrfiK
 2FUssRrA0zXHKaTWX3Vr6jzRMAPjn4PCb5qCkfma23HGTBKZodWRMF6fs
 2ijk4BlaODTyn3peFqpaf3ddkoiD9IGyNN4gCobXBPHI7I/VDQy7mQIQF
 C6dwPm2yoCWhEKuK0uKvIcE+JcckFIKWegdpy5KzKyuiTW8j846vRW5XL
 2YFVdQf11tScrQfcinnLGfkTRd7kLlNqTMeW1UPYmaf1nvoEQLcor/tDm
 aPh50gKGx6KmwKrIheOYlN27tyha28hK2HYp4AHDE0uCsii1U7YCMUz6J g==;
X-CSE-ConnectionGUID: FzYMHaOeQHyJmDEQpCK0yA==
X-CSE-MsgGUID: 4p9NxdA7S1S4hzSdK/+JCA==
X-IronPort-AV: E=McAfee;i="6700,10204,11163"; a="33106419"
X-IronPort-AV: E=Sophos;i="6.09,286,1716274800"; d="scan'208";a="33106419"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2024 07:13:56 -0700
X-CSE-ConnectionGUID: WxMvfRAXS++woGreIx4e/Q==
X-CSE-MsgGUID: MATLz37dSkuPdu1+OYdwyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,286,1716274800"; d="scan'208";a="58631408"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Aug 2024 07:13:56 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 13 Aug 2024 07:13:55 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 13 Aug 2024 07:13:55 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 13 Aug 2024 07:13:54 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 13 Aug 2024 07:13:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K5YysuqUfsmhTT/u/PPak2i+U5UpCtVKqT06YH49qGovH9ZKGoW/CIgYftNoCPA3qND6/GRw8mQ589LXrQlMvLCU5fPrfMuG5vLVHv82wyru3dYgR4SUXeTcuPQXmIfCRWjIn+0u0Tseu2z9WGQasm7ntCtYADDZEbCmqIAALLJUcgBF4QRJ2ho7JWNEaSxOSVh+gr5V0RZCR+YAE0Tr1m/uLEmHsQPQTNpLXJbKpDh6VME8jWOIVfakmJXlBQfStllfMCXf0b6HKSMjbtfnVzHH9A+hLvZUMsxhDMFQJCFmjOnEFA5PFR6HLMHRu/o1a4jM3WbvxjOYBGhG8WOeJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+uZ6DmpvDThB6YQE/WBtrkBGkZ5Rs0nZct32EfKTLGQ=;
 b=Me3d9Y6YKBGyV9QfH+YZfywupDYe9RRXfJJYPtRvEWemt4skYz1yFpCkg0wVmfsAX+STiCUqiGRcSDYnvLvr3dZ1ZOa43nykOIiRYLiwnE1qc7ucdOhPbCvt6FaFkl4rZYyLUHktfLIwzRAzzgo3RatZeuXNQKESFmkJ1C7g5+42W3y/5W5mnfNiNbqFvSVWMrqAJGMtHLx13AoSPNA5t1426jTLl9wzxD8vAq/hmrU4bdnPvMVLmvWdKmeBKVKAAdxIYC/ZU/yK3Pm4rx7TrnP0lkYfiUEFSKpKwSRHrPfwgYqFNpSow8Npd4L3Vpc4AP8g3NcunU5RBZC6wZODVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS7PR11MB6223.namprd11.prod.outlook.com (2603:10b6:8:98::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.32; Tue, 13 Aug
 2024 14:13:46 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7828.023; Tue, 13 Aug 2024
 14:13:43 +0000
Date: Tue, 13 Aug 2024 09:13:40 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: <thomas.hellstrom@linux.intel.com>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 <francois.dugast@intel.com>, <rodrigo.vivi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <anshuman.gupta@intel.com>
Subject: Re: [PATCH v2] drm/xe/uapi: Bring back reset uevent
Message-ID: <62prsha57yz2kfc6veaohmxmcjgzibshsgnlr6dceacvachydj@pwuxghuhoyn7>
References: <20240812074812.1457164-1-raag.jadav@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240812074812.1457164-1-raag.jadav@intel.com>
X-ClientProxiedBy: MW4PR03CA0286.namprd03.prod.outlook.com
 (2603:10b6:303:b5::21) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS7PR11MB6223:EE_
X-MS-Office365-Filtering-Correlation-Id: c0e6ae29-303b-439d-2e2c-08dcbba22352
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vVa/HWDHq7JFtUeR15wJl4Iu9abanOVZCq3+N3lRww11aXwbHhdegfleEC7m?=
 =?us-ascii?Q?0wwEFpLZ512kfG344K1cMZDU1UwniC1o5egHOSA8yFB3kZla1QQcGs0ZMK4N?=
 =?us-ascii?Q?M0GlxvSTIFrBsfuy+VD95ml60vjB8Dfr9pjp1voz1zt0HrjxOkiXW+SC5d7G?=
 =?us-ascii?Q?FfgDa3RHV0f/tmcHH3PErt3GQ2N5DSArFdFE8i4R2boyy8KOeAwjWLkPzn3g?=
 =?us-ascii?Q?Viy8eQURAGhcBR8kLShJf9/iL8XwFMGO85SDy9vO93TjkeblOvLgWyGVryBy?=
 =?us-ascii?Q?9Ck2Mm2ffAgmjwOV5ltwBzyvw+FP2wF0qkKLB4ZIw65LB56qjrnx57VHdVvk?=
 =?us-ascii?Q?EGi0d88kfMzae+fWfKZD7MZtHW7F50GDgCsx2dpaoePKy0Av2BqEmbaJr5pY?=
 =?us-ascii?Q?WzK4qWxIZu8f9ECiTVQcC7ejU6phKYrcwlFFRls+Y4gdpAFZshd3SwpN8RTJ?=
 =?us-ascii?Q?WkviBOqzVf9WQbhPVdUN2wpm81DbDPUFFIixfVA+CMiMpupR0WLmZWoAoO71?=
 =?us-ascii?Q?lulVzMOhkqLLYHPNvdaILUCFO6wbFYrlfUs31f7L3ifZ5wCP6Bidhi4xib8M?=
 =?us-ascii?Q?IY1SLtt/rEJGHGyP/DWHB4WoHtyIdjfpGjEn3ozjBE7gcrjlZW9clrqUE1Ao?=
 =?us-ascii?Q?hb4maMvCBK2H+xtpEAekKm5B1Ej4YY/L/CcyAFqAuNagVER6fQpHjUKvrYbf?=
 =?us-ascii?Q?0+inzh/eRV3PC+UmIZjlDRg48Twv2ztksKTtJuXWfJQtlhXyFSiolmkTYhIa?=
 =?us-ascii?Q?DrTD+3iwpb7a+FJ7oVG4KHcSqHqvf5OMWXnnI2APNw16AE6+4CO+7qwIS+6c?=
 =?us-ascii?Q?A4rdmQCLLrAwA3JScjsC1SFO0HoZgTFtuwMKSAqIBmg4bxv9fDvoZjo3JzKY?=
 =?us-ascii?Q?Dab1M0qAaRhlKacTE6b8InV1LGmjnG/+wkwIXvVnSkSBL061ZFY0zJXOLxsL?=
 =?us-ascii?Q?+hZJpJTKanHgTMc3/eqx5MQ0ZzM4eCSIpiA7U6sOUp51uvNZWlt21gfqBVxr?=
 =?us-ascii?Q?0f1L+tlGB3mzJplTZsPhZ0r4SqGU0yN6fPMoyrpcYp9S9AdD0cGEAtzAmuf7?=
 =?us-ascii?Q?1s1pfMo826c372N4YmmVr1YlR0pe+uhFANOqnWzt9w8KON06vZPZQbThgFBp?=
 =?us-ascii?Q?0qR9ur/ws3pvsRo9bZOrQEJQs6g6+1EF6bhhYvX+KNt1LGTUtSmL0lulpfD7?=
 =?us-ascii?Q?oeqyvSIb9IirI8i3cs9mM3mcwWdBF5G2jQZ/w1wo4IHpVdARdaHWfuZBU9YH?=
 =?us-ascii?Q?VETf4wXgxi0FPHwMpUDgz9kF+uJCwlODDuS9xUPDvKhyNk9b3pWprmyYCaQ+?=
 =?us-ascii?Q?RFg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?z5hAsxdaU/+599irP6AmMROFoPCcXpwC/LmJYI+9TYbvI9WvLA7dfyxstyXk?=
 =?us-ascii?Q?Turph+7b7ZvLzXcaX7mVREU0uDUK0ldry3HRjKukCHitvTYOA62O3wq6WEaG?=
 =?us-ascii?Q?vKzS0mjsFubeviMSMeks3FxAqjgaRgyASZRv74sWpddA4RaF6+s1XN7Y7Bft?=
 =?us-ascii?Q?iNwDztvyFrzWizEAqGdqxtXPArrYa4IrDTkDCdL5lROZM/uTb6a/2Vjo4ij5?=
 =?us-ascii?Q?jWxuCUIQvvYmN4L08tfXUhnt3tCAXqAjLDX/v5CxYjJMMGgsdn0lr81UM+Iu?=
 =?us-ascii?Q?ZCMaV9Y1YKiBCEAXXuzeov/faCQEMil56F3lDUjqhjzyxKmVjKFFQKP7iHk+?=
 =?us-ascii?Q?FmqV588iIUsH5x10m+k8cFotnsImf+u6MpYTj3WKTVFdC0kuvsznh1OrUuT6?=
 =?us-ascii?Q?4LUCmcwj7QysY9balQIM7fMKdsZ08HjdV2Iau3PXvlrciwiruy1IPdgnO9Sd?=
 =?us-ascii?Q?4eYwQrITyJNRYv/IKnVmlGl52buyo3boAPfHPd/OGJBF0LDNTHSztsNV40NI?=
 =?us-ascii?Q?orAgWXaWnHUktHGo13r4iMbUUn5q5S4yS1nmHNz0TtS8ntA/AMrtLcVdj9bV?=
 =?us-ascii?Q?Zh3MyME4wSBYhxn2piJok2YPiKvovXzn2JfVT7Iv3UxG+MOZAyo2zPr552x0?=
 =?us-ascii?Q?i0SHkBqzONE34j4jYEXYhNbYzLFe/pPPynfUr9qd7fSr+1UFBMjRWoxcEWVj?=
 =?us-ascii?Q?0WR/kv1ntMds7I2N2ngosPJzjIUX/tBIN58ghJP5nUf7ibyRGdUpUilrv/+A?=
 =?us-ascii?Q?W0feXpkhSfwWdxf29qVWZAEBhzpZZUyFEm2XSMTxQJHYc1Dk3zkEfh/FKevA?=
 =?us-ascii?Q?SOeOcstbTXGpBtOLkE5w7uUCSGWPq9/xzri05fIFDka3p75zo6lVskyDEX0w?=
 =?us-ascii?Q?saNo7NL78ufZbMsgDwu++gPrKbQNTEi8wb5Wj2qsW8nRvcxWI747RmQyj/WI?=
 =?us-ascii?Q?Qrlv5o77vLPGCblBcMgk3Hsm1HcDus0I4S9FEH620gmXKpdiJ4n87RKnOx7C?=
 =?us-ascii?Q?/lvfPknTK8sOh8tlk5CrLonMZuJ9L1++PedIXPbq0IgyJjLSUjoMnR2rSR+E?=
 =?us-ascii?Q?/e5PYclfiBghuqozpN2/cLq1TTSdF74PJfv+a52zxIaCjrI2ctlDkdgA7dH/?=
 =?us-ascii?Q?qPxy6BjsHq+YXp7umug1/HuMUlEsaVPpTRyEZK2On6xw7P5qUN96/O4g3hos?=
 =?us-ascii?Q?VuQH+03UNJictTs9xKXrbydEuMQ1UO2wi4ZjOpwwDCc7QBOx+LDeF2loFinK?=
 =?us-ascii?Q?glGUjvvjqsW3Od6Y06esH5b/3xBoLlHNP++2re+TSiTTcqTydWj5CsLHs+0/?=
 =?us-ascii?Q?PGvnkHWbOSVPs4nJCA+NqMzZ+wcNYoD0w8DMxbhSMWE+fgiIv1LDTv+XNxlI?=
 =?us-ascii?Q?9fQrJ5i7hZ8ftq4n6OCQzwRMdj8yYFoP5AoS6hjbF45FSKwdKg60hMAlj/it?=
 =?us-ascii?Q?E82xS/A0Rx38rFcp+WxFV81sJKkM3+3ff/YWu7Ec0mLrosFNH5IywbF7D0e2?=
 =?us-ascii?Q?UY0t9dJaMzWDcn9eI3tQxAx0ZwqYr7fjzBjoCx5MX72lWqCJtDQeN4jldFok?=
 =?us-ascii?Q?Q0Ir78FNHoohxtQpKcp+zIHbyEJJZqzm2kTK/k9tIvbLumnK0jeR168FAyRB?=
 =?us-ascii?Q?Ww=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c0e6ae29-303b-439d-2e2c-08dcbba22352
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2024 14:13:43.3360 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z5R63upEm/oT6XnquwwpLAjiByZJDDezjShwu2wNjxUUdB4qvqVnHewlOKW/bbjMHVficLWSYNNxZZO5XhuCGqZkNb+raiAu7+ZLGvryV40=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6223
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

On Mon, Aug 12, 2024 at 01:18:12PM GMT, Raag Jadav wrote:
>From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>
>This was dropped in commit 77a0d4d1cea2 ("drm/xe/uapi: Remove reset
>uevent for now") as part of refactoring.
>
>Now that we have better uapi semantics and naming for the uevent,
>bring it back. With this in place, userspace will be notified of
>wedged device along with its reason.

Title of this patch, this paragraph and what's being done in the
implemenation don't match since reset != wedged

>
>$ udevadm monitor --property --kernel
>monitor will print the received events for:
>KERNEL - the kernel uevent
>
>KERNEL[871.188570] change   /devices/pci0000:00/0000:00:01.0/0000:01:00.0/0000:02:01.0/0000:03:00.0 (pci)
>ACTION=change
>DEVPATH=/devices/pci0000:00/0000:00:01.0/0000:01:00.0/0000:02:01.0/0000:03:00.0
>SUBSYSTEM=pci
>DEVICE_STATUS=NEEDS_RESET
>REASON=GT_RESET_FAILED
>TILE_ID=0
>GT_ID=0
>DRIVER=xe
>PCI_CLASS=30000
>PCI_ID=8086:56B1
>PCI_SUBSYS_ID=8086:1210
>PCI_SLOT_NAME=0000:03:00.0
>MODALIAS=pci:v00008086d000056B1sv00008086sd00001210bc03sc00i00
>SEQNUM=6104
>
>v2: Change authorship to Himal (Aravind)
>    Add uevent for all device wedged cases (Aravind)
>
>Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>Signed-off-by: Raag Jadav <raag.jadav@intel.com>
>---
> drivers/gpu/drm/xe/xe_device.c     | 10 +++++++++-
> drivers/gpu/drm/xe/xe_device.h     |  2 +-
> drivers/gpu/drm/xe/xe_gt.c         | 23 +++++++++++++++++++----
> drivers/gpu/drm/xe/xe_guc.c        | 13 ++++++++++++-
> drivers/gpu/drm/xe/xe_guc_submit.c | 13 ++++++++++++-
> include/uapi/drm/xe_drm.h          | 29 +++++++++++++++++++++++++++++
> 6 files changed, 82 insertions(+), 8 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>index 1aba6f9eaa19..d975bdce4a7d 100644
>--- a/drivers/gpu/drm/xe/xe_device.c
>+++ b/drivers/gpu/drm/xe/xe_device.c
>@@ -955,6 +955,7 @@ static void xe_device_wedged_fini(struct drm_device *drm, void *arg)
> /**
>  * xe_device_declare_wedged - Declare device wedged
>  * @xe: xe device instance
>+ * @event_params: parameters to be sent along with uevent
>  *
>  * This is a final state that can only be cleared with a mudule
>  * re-probe (unbind + bind).
>@@ -965,8 +966,10 @@ static void xe_device_wedged_fini(struct drm_device *drm, void *arg)
>  * on every single execution timeout (a.k.a. GPU hang) right after devcoredump
>  * snapshot capture. In this mode, GT reset won't be attempted so the state of
>  * the issue is preserved for further debugging.
>+ * Caller is expected to pass respective parameters to be sent along with
>+ * uevent. Pass NULL in case of no params.
>  */
>-void xe_device_declare_wedged(struct xe_device *xe)
>+void xe_device_declare_wedged(struct xe_device *xe, char **event_params)
> {
> 	struct xe_gt *gt;
> 	u8 id;
>@@ -984,12 +987,17 @@ void xe_device_declare_wedged(struct xe_device *xe)
> 	xe_pm_runtime_get_noresume(xe);
>
> 	if (!atomic_xchg(&xe->wedged.flag, 1)) {
>+		struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>+

Given the names of the uevents, I'm not sure if the intention is to
notify when a gt reset happens or only when it fails
(and wedged.mode != 0)

Lucas De Marchi

> 		xe->needs_flr_on_fini = true;
> 		drm_err(&xe->drm,
> 			"CRITICAL: Xe has declared device %s as wedged.\n"
> 			"IOCTLs and executions are blocked. Only a rebind may clear the failure\n"
> 			"Please file a _new_ bug report at https://gitlab.freedesktop.org/drm/xe/kernel/issues/new\n",
> 			dev_name(xe->drm.dev));
>+
>+		/* Notify userspace about reset required */
>+		kobject_uevent_env(&pdev->dev.kobj, KOBJ_CHANGE, event_params);
> 	}
>
> 	for_each_gt(gt, xe, id)
>diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
>index db6cc8d0d6b8..5d40fc6f0904 100644
>--- a/drivers/gpu/drm/xe/xe_device.h
>+++ b/drivers/gpu/drm/xe/xe_device.h
>@@ -174,7 +174,7 @@ static inline bool xe_device_wedged(struct xe_device *xe)
> 	return atomic_read(&xe->wedged.flag);
> }
>
>-void xe_device_declare_wedged(struct xe_device *xe);
>+void xe_device_declare_wedged(struct xe_device *xe, char **reset_event);
>
> struct xe_file *xe_file_get(struct xe_file *xef);
> void xe_file_put(struct xe_file *xef);
>diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>index 58895ed22f6e..519f3c2cf9e2 100644
>--- a/drivers/gpu/drm/xe/xe_gt.c
>+++ b/drivers/gpu/drm/xe/xe_gt.c
>@@ -741,6 +741,24 @@ static int do_gt_restart(struct xe_gt *gt)
> 	return 0;
> }
>
>+static void xe_gt_reset_failed(struct xe_gt *gt, int err)
>+{
>+	char *event_params[5];
>+
>+	xe_gt_err(gt, "reset failed (%pe)\n", ERR_PTR(err));
>+
>+	event_params[0] = DRM_XE_RESET_REQUIRED_UEVENT;
>+	event_params[1] = DRM_XE_RESET_REQUIRED_UEVENT_REASON_GT;
>+	event_params[2] = kasprintf(GFP_KERNEL, "TILE_ID=%d", gt_to_tile(gt)->id);
>+	event_params[3] = kasprintf(GFP_KERNEL, "GT_ID=%d", gt->info.id);
>+	event_params[4] = NULL;
>+
>+	xe_device_declare_wedged(gt_to_xe(gt), event_params);
>+
>+	kfree(event_params[2]);
>+	kfree(event_params[3]);
>+}
>+
> static int gt_reset(struct xe_gt *gt)
> {
> 	int err;
>@@ -796,10 +814,7 @@ static int gt_reset(struct xe_gt *gt)
> 	XE_WARN_ON(xe_uc_start(&gt->uc));
> 	xe_pm_runtime_put(gt_to_xe(gt));
> err_fail:
>-	xe_gt_err(gt, "reset failed (%pe)\n", ERR_PTR(err));
>-
>-	xe_device_declare_wedged(gt_to_xe(gt));
>-
>+	xe_gt_reset_failed(gt, err);
> 	return err;
> }
>
>diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>index de0fe9e65746..b544012f5b11 100644
>--- a/drivers/gpu/drm/xe/xe_guc.c
>+++ b/drivers/gpu/drm/xe/xe_guc.c
>@@ -560,6 +560,17 @@ static s32 guc_pc_get_cur_freq(struct xe_guc_pc *guc_pc)
> 	return ret ? ret : freq;
> }
>
>+static void xe_guc_load_failed(struct xe_gt *gt)
>+{
>+	char *event_params[3];
>+
>+	event_params[0] = DRM_XE_RESET_REQUIRED_UEVENT;
>+	event_params[1] = DRM_XE_RESET_REQUIRED_UEVENT_REASON_GUC;
>+	event_params[2] = NULL;
>+
>+	xe_device_declare_wedged(gt_to_xe(gt), event_params);
>+}
>+
> /*
>  * Wait for the GuC to start up.
>  *
>@@ -684,7 +695,7 @@ static void guc_wait_ucode(struct xe_guc *guc)
> 			break;
> 		}
>
>-		xe_device_declare_wedged(gt_to_xe(gt));
>+		xe_guc_load_failed(gt);
> 	} else if (delta_ms > GUC_LOAD_TIME_WARN_MS) {
> 		xe_gt_warn(gt, "excessive init time: %lldms! [status = 0x%08X, timeouts = %d]\n",
> 			   delta_ms, status, count);
>diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>index 460808507947..33ed6221f465 100644
>--- a/drivers/gpu/drm/xe/xe_guc_submit.c
>+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>@@ -891,6 +891,17 @@ void xe_guc_submit_wedge(struct xe_guc *guc)
> 	mutex_unlock(&guc->submission_state.lock);
> }
>
>+static void xe_exec_queue_timedout(struct xe_device *xe)
>+{
>+	char *event_params[3];
>+
>+	event_params[0] = DRM_XE_RESET_REQUIRED_UEVENT;
>+	event_params[1] = DRM_XE_RESET_REQUIRED_UEVENT_REASON_TOUT;
>+	event_params[2] = NULL;
>+
>+	xe_device_declare_wedged(xe, event_params);
>+}
>+
> static bool guc_submit_hint_wedged(struct xe_guc *guc)
> {
> 	struct xe_device *xe = guc_to_xe(guc);
>@@ -901,7 +912,7 @@ static bool guc_submit_hint_wedged(struct xe_guc *guc)
> 	if (xe_device_wedged(xe))
> 		return true;
>
>-	xe_device_declare_wedged(xe);
>+	xe_exec_queue_timedout(xe);
>
> 	return true;
> }
>diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>index b6fbe4988f2e..dd2f36710057 100644
>--- a/include/uapi/drm/xe_drm.h
>+++ b/include/uapi/drm/xe_drm.h
>@@ -20,6 +20,7 @@ extern "C" {
>  *   2. Extension definition and helper structs
>  *   3. IOCTL's Query structs in the order of the Query's entries.
>  *   4. The rest of IOCTL structs in the order of IOCTL declaration.
>+ *   5. uEvents
>  */
>
> /**
>@@ -1694,6 +1695,34 @@ struct drm_xe_oa_stream_info {
> 	__u64 reserved[3];
> };
>
>+/**
>+ * DOC: uevent generated by xe on it's pci node.
>+ *
>+ * DRM_XE_RESET_REQUIRED_UEVENT - Event is generated when device needs reset.
>+ * The REASON is provided along with the event for which reset is required.
>+ * On the basis of REASONS, additional information might be supplied.
>+ */
>+#define DRM_XE_RESET_REQUIRED_UEVENT "DEVICE_STATUS=NEEDS_RESET"
>+
>+/**
>+ * DRM_XE_RESET_REQUIRED_UEVENT_REASON_GT - Reason provided to
>+ * DRM_XE_RESET_REQUIRED_UEVENT incase of gt reset failure. The additional
>+ * information supplied is tile id and gt id for which reset has failed.
>+ */
>+#define DRM_XE_RESET_REQUIRED_UEVENT_REASON_GT "REASON=GT_RESET_FAILED"
>+
>+/**
>+ * DRM_XE_RESET_REQUIRED_UEVENT_REASON_GUC - Reason provided to
>+ * DRM_XE_RESET_REQUIRED_UEVENT incase of guc fw load failure.
>+ */
>+#define DRM_XE_RESET_REQUIRED_UEVENT_REASON_GUC "REASON=GUC_LOAD_FAILED"
>+
>+/**
>+ * DRM_XE_RESET_REQUIRED_UEVENT_REASON_TOUT - Reason provided to
>+ * DRM_XE_RESET_REQUIRED_UEVENT incase of exec queue timeout.
>+ */
>+#define DRM_XE_RESET_REQUIRED_UEVENT_REASON_TOUT "REASON=EXEC_QUEUE_TIMEDOUT"


TOUT / TIMEDOUT etc need some love.

DRM_XE_WEDGED_UEVENT, then document in the same place all the additional
params that can be passed to this event.

or DRM_XE_DEVICE_STATUS_UEVENT, or DRM_XE_RESET_UEVENT.

who is the expected consumer of that uevent and what could be done?

Lucas De Marchi


>+
> #if defined(__cplusplus)
> }
> #endif
>-- 
>2.34.1
>
