Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34AB0AEC1AC
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jun 2025 23:05:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FB3F10E095;
	Fri, 27 Jun 2025 21:04:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F+bzyslC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD8A310E095;
 Fri, 27 Jun 2025 21:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751058288; x=1782594288;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=NJH5/GTk8nQLzL+mhDS8xCwymf0iyFTYzPP0mJqtkbA=;
 b=F+bzyslCuKErYeGNwMUme4Jsg56uSoDwH7h7LN5eg/FiRXHbCbC5moLS
 n97DsfqrS2+eoxGOVh6Uzax0wwQIBsAXP7sfhdy8QCjQTVH23vK05501Z
 fhzAas4vsh0UnwPCtyKEyGMlOUyuZxqH1YyW5A5GAw+KIbYWCFuL8M3uZ
 bw8YqEG18exLlcpsVPfmvahwrKnxT3+t45P1hBGwX3zY2VkQWdnmEjXLE
 WQuIi/ahQijdKgJcUVr/f85MJLb7qZkr7nTNGOvGqdZ/hbwwVVRLryVNI
 BDjeVXJsxDoBCGVGW82y8TYwYUcVq70FwL+EkpyxTMGno4+OtFiwb9lJX A==;
X-CSE-ConnectionGUID: MLM61/cqTpyMOSDl/4rQvg==
X-CSE-MsgGUID: lhF6QDpcQtizLJgWcwiq+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="53320456"
X-IronPort-AV: E=Sophos;i="6.16,271,1744095600"; d="scan'208";a="53320456"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 14:04:47 -0700
X-CSE-ConnectionGUID: R5kAL3bZTB2GOobbziHmwQ==
X-CSE-MsgGUID: SoqWSvhdQfmNeUlgZZNy9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,271,1744095600"; d="scan'208";a="152416267"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 14:04:48 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 27 Jun 2025 14:04:46 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 27 Jun 2025 14:04:46 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.56)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 27 Jun 2025 14:04:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jg98s5QPshJKXv9Y39aq6PhZpWugFQev6xCZ6+t4pRlttfJ5m532GIR8/E7VsPOlEFPSlXg6JBK6BiTH1qkXF9Rn9oLgcXUK3ID5/FbQl4e8VfU+pjCMm9Mpiolwow2ryiVriSTFkpwfXayx/v66Im+45XkyZLntN3REro/dFaUn20JC7kNdT8KCJPcPdaaULIqDgpmNUvSvFLwgBPwqLw7KSQglH91rlOgxMJwZiL0FTdp4fiD/kAe+ssVvbaifGREKuaoh6eQUERIzxWlXfGSvg2HSHGVAt6vF1ncL2dCjanVCtB+swOr8ODwZDOwGmL7ZzujGPO99KJfxGTXdFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yQiwmBpEOTqni3G5On02wZXsmvUiapPHp2Rp9PPIUDk=;
 b=RezGDB+yusLR8+3SFGPh45D4fkc+Umuz//d7whXN1uaueVKhOwEoSA3GKWPyBGEC2TWhUo67X39dhZzKfAnwvwuSvxu6h+oKjGFJJgIxeUoiMN1amr0F9FY6PRD2RKIjAheXPNrkhraQS6l3d3wwvOFYRFovANvd2/YyY0qXR/b/hCYQTN1wUEaHDTxBvVze56wHuI1Zu5chv/qH+sSZiElSV58Z0Lgaqu+7k0goE2I49xnO8/y5r8FGSgpOWmVsOY3tCH/9HsEQIR8zGdq59AATmwURu9w6XT+GjQdoR2f3zqoiDg4KRDTsXog9i/zwzCzd81DvHlp/mLqO38MnTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by DS4PPF814058951.namprd11.prod.outlook.com (2603:10b6:f:fc02::36)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Fri, 27 Jun
 2025 21:04:29 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%5]) with mapi id 15.20.8880.015; Fri, 27 Jun 2025
 21:04:29 +0000
Date: Fri, 27 Jun 2025 17:04:24 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Badal Nilawar <badal.nilawar@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <anshuman.gupta@intel.com>,
 <alexander.usyskin@intel.com>, <gregkh@linuxfoundation.org>,
 <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH v4 03/10] drm/xe/xe_late_bind_fw: Introducing
 xe_late_bind_fw
Message-ID: <aF8HWPn87kiP9-cO@intel.com>
References: <20250625170015.33912-1-badal.nilawar@intel.com>
 <20250625170015.33912-4-badal.nilawar@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250625170015.33912-4-badal.nilawar@intel.com>
X-ClientProxiedBy: SJ0PR03CA0133.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::18) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|DS4PPF814058951:EE_
X-MS-Office365-Filtering-Correlation-Id: e6b6ee0d-4c99-4d9c-7482-08ddb5be34dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?z1+uAI5byaUBMwDqSK31zd/m2J9Xr8hpQA18xKLM97ZHfkUpdA6HcO2+Wn?=
 =?iso-8859-1?Q?g+yZ3jNntvwCF5gxfbfCyVMjYoCIt2QX36HrYbtgPeWwldLyfHXqfTgHZw?=
 =?iso-8859-1?Q?PUR2s7qin/LwCP3tmoDv9ss+AWKc3+qJMH2DS05GZMHKpwVYA6/X9qhk0d?=
 =?iso-8859-1?Q?h2txZIXLuY5hBikjxXnVhFvPhl2gDcs3gkk8+P+tmfhJFJYjEzZB1haBrj?=
 =?iso-8859-1?Q?eVIBlJYLnUg+ONr8bhkoo4I6lJPX6Rxjc+W82hX7wLgWk814MADzF5OQqS?=
 =?iso-8859-1?Q?rq8VQbWtQ4TgQYg6CUcsxuujscEgpTNWctHjRd2pzHpqvavxLAcukUbBeU?=
 =?iso-8859-1?Q?KgG7rShGw0VT5+irwDvqCfHSZN9PjTUMorIdQa0F/fb6Ukz1tq5AcUn9Ja?=
 =?iso-8859-1?Q?GJ4grlU6vSIg1A7FZk0UoAryO3R6qLkxbA8J6PtfczfxhrqBAe/WOS0GC+?=
 =?iso-8859-1?Q?EWGCvhf3f19KGAw5wVp03mlHf1q0fk2QUrFGazTlWRsULH+h3QgbddVo6v?=
 =?iso-8859-1?Q?DHTY2cUeFnplRGfn42mwoyJGSBYy0OFlaoB+VSm80E2hjvnhe/qQz7EPEH?=
 =?iso-8859-1?Q?66zaKkwFb2rwcKmEqDdbBhOzYm/HPWsuHyzsDD4wgwrOItqyTWVv825EJR?=
 =?iso-8859-1?Q?42i41m03o5BJgAUfVAvvGsdaSH3sYvoZ6wK7kyo0n7JrzeBffcOII4DQLv?=
 =?iso-8859-1?Q?xlFnZZIayzWEFB9DLfhc5g6eTkjpwp50iYTA1qg6jT57Q+HRJRlUvyWaBj?=
 =?iso-8859-1?Q?OTw8l7crY9pvRjRWJlims7a7ZjvMbQh8uI79Xhz/QAwPCjP7gf+b/oVshn?=
 =?iso-8859-1?Q?yqnuA5mlDm7pm/GGQfgQ2MA7Y3qzJG2oKJEKWj9nPTv9aVg5fcOGVjVk6n?=
 =?iso-8859-1?Q?h0AP3WkpdGu8+ES2Gc0+jE4/3wr8ZKvWntARXDuvI0PStSpV1YymGgSNmU?=
 =?iso-8859-1?Q?Ez3HimbHxdNYsMjEVST8UYEYEcVU/7zP/L6aLst10s+0oK1eRPHtA3x3zQ?=
 =?iso-8859-1?Q?BmnWCyf49pZS32shNo+2YN/mtPlWJVSzVtKkrIBhew4f78hqMo/Q33gqRM?=
 =?iso-8859-1?Q?+xR8kqH3eStJEf2m7KVSiNMj1GhF8mPaZTLRE+8SYIVGdBgGxGzkI52GYQ?=
 =?iso-8859-1?Q?FQYx/t6AD4+8rg3ipj+p7zRXabC4gsfOwsMZIOV6ZwyM3kn3DSkYZVOujn?=
 =?iso-8859-1?Q?hFSe5Ujs3um5BxV/9lGVaMV+oNB9TEmGQMIl9ggnkteF/1ddhiDm8mkA+/?=
 =?iso-8859-1?Q?b07E5+DTQ7VqjKtOltJWytS522ZEtapipKuWPOFawKiEeve97jO/KnFO+w?=
 =?iso-8859-1?Q?c7Vh+yn3nYgpryNW573PwlxN+J40pTlbEImPJkE4pxvgZ9QGnZ7t4JDQ/3?=
 =?iso-8859-1?Q?JnVZi5CWYQrGCLVAsAgV1dFHsn7NYhz7yi0U7Y3DY0i5iR9pKhcPY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?oXvrG7Pn4lmxE4pyl5yKAgecl9QpU+8WFUaQj2PxR0zl172sDL4pDnax9I?=
 =?iso-8859-1?Q?MOoOSCxppIugTsTMnUFqoEZ3TrGaOgokJGaM1QbXNYYeutUN9da2a1a9R6?=
 =?iso-8859-1?Q?yEUzO3kibnm+CGszSrDjNM/dFSDtcUJR7JjALsMoNvs1I6ApTgw1LuE+Jv?=
 =?iso-8859-1?Q?iVwnlnIW3dw7ygrsqkF32FwVjWTRb5lj/vxObM00ihtyHPVb0cT4Y/eOp2?=
 =?iso-8859-1?Q?/CVzd/447mo648kuhzsLSfZQdooinF5P1sSUX1sejTB+sxaYOzHWHhX6TY?=
 =?iso-8859-1?Q?VHgpG9YuZxI7VJEngC6ls5Lnct2vm0Z0zVsArByUokkeGMGxIlp2ZfjuR2?=
 =?iso-8859-1?Q?5/1GnbE8JTdeL3prcEfzOoRdmnfPWD+Jw6quh2Ll98NtX4T78RhLI1V32y?=
 =?iso-8859-1?Q?Lufwz72fPmzbGcCwdxJzcY+w8lHKz0acx1kGN0z9XDHZhqXmaWGf1Me6yz?=
 =?iso-8859-1?Q?AwtST83bMbiiqXVm5RCPunJQ7NXHiRk0tk2CrIfB3eG7IBAFT5+or11CBC?=
 =?iso-8859-1?Q?5cLEDtC0s17NkctGXcmprQ7kx0yT4CEcWM6MKe+i9EgUlfMcbEOMhN5QsJ?=
 =?iso-8859-1?Q?CQ1QJEYG5dQkBM2vlj/UgheNMpdmSDnh/uuAAnQUc+/IlUwlT4BXDpkoey?=
 =?iso-8859-1?Q?SQcGl/nPxngr7Tpd/BYovISe8f0wLgHNOaUd7AbJ0wAl+4+2jqsF68wr7e?=
 =?iso-8859-1?Q?6EnV8a/nOqI98mp1QfOmDlePxT3lVlhlYAhxjrr8p7CENoefBtbGgnDBdh?=
 =?iso-8859-1?Q?6WlJ4bWiZo+M+qNwvws7F+INILZGZVFlTVVKHCjrneAyFxxCkpBVr2byK1?=
 =?iso-8859-1?Q?V2KmExiIoWfTYlnmjWClWJNYeHmH9DGD6k+1AvaswZdJ8S/R7mW7gSbFpi?=
 =?iso-8859-1?Q?26Zuu/h72ECFzQAkPBHXQ4gBWr29yoH1Ma0g5/zPxokyUVXXmjLKbl5VHD?=
 =?iso-8859-1?Q?tV/VxUVLytMnguiSw/lkEsRJmrb0TyBC+weXzuaBSPrPk1yqK3FTnrmYT3?=
 =?iso-8859-1?Q?oRsQZjA9jU4uQ/CD+g3O4tM3fj1M+l/G9M8XQADFtmyPqfKaMmr5lMCJIU?=
 =?iso-8859-1?Q?Y1R7oOy10j7cAJiCIcNinUaUBXm/2nbMiWJ4u4JEWkrGSRwoyhwXeD+Hyl?=
 =?iso-8859-1?Q?7alMDunYNO22Welqtu8BhuPvOUUxdtWsDWeitDQSv2SyPQHyHORvKkrHIU?=
 =?iso-8859-1?Q?khCeW4np06gyvik3TFYXv283EypkHWX7oSciQedwh5XT6j8/DWk23/AcGA?=
 =?iso-8859-1?Q?zj3YsqsUQeejw2ZjeyiH6THJD8OulEQjH0OtPbTw8uuFrep0R1WNiRqgT5?=
 =?iso-8859-1?Q?QOkbLPZYMj4fKKcBUXW1TXM6UzHQnO71XhyRBQCPYvGT2FKOlSwS75gOHg?=
 =?iso-8859-1?Q?7ZZGqNhU99zUW7MC20MPyju60n4zaaSKVeBYJV5W2qckeFl047+hmdScJd?=
 =?iso-8859-1?Q?BuUR6H2Tr2aKvMgiL3Vqznny7H4oq+8k8qcEqG5fuHrqB63dFCedNSAgMt?=
 =?iso-8859-1?Q?siho3mH+qCYPDn//rTkkIbUUsqiETL8yo+xfmAihgFmm4VV6j2scmm5yuL?=
 =?iso-8859-1?Q?Amis8m9GMLV5bAbK++BPvoJWAak3RoH6IYZq11OPDUAWSWSn3mOWUOhFrG?=
 =?iso-8859-1?Q?IjyPT4BbkGGxHCmA5eIXU2eAU2NkBbAzuy?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e6b6ee0d-4c99-4d9c-7482-08ddb5be34dd
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2025 21:04:29.4031 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wg/Iempm1mN/J0I2kNivjYmTfbc9ecRj44aybHfD/v7p8PJwk0i97hVonGZpdHN82+FNVYAvpUy1uchkhXOoxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF814058951
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

On Wed, Jun 25, 2025 at 10:30:08PM +0530, Badal Nilawar wrote:
> Introducing xe_late_bind_fw to enable firmware loading for the devices,
> such as the fan controller, during the driver probe. Typically,
> firmware for such devices are part of IFWI flash image but can be
> replaced at probe after OEM tuning.
> This patch binds mei late binding component to enable firmware loading.
> 
> v2:
>  - Add devm_add_action_or_reset to remove the component (Daniele)
>  - Add INTEL_MEI_GSC check in xe_late_bind_init() (Daniele)
> v3:
>  - Fail driver probe if late bind initialization fails,
>    add has_late_bind flag (Daniele)
> v4:
>  - %S/I915_COMPONENT_LATE_BIND/INTEL_COMPONENT_LATE_BIND/
> 
> Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile                |  1 +
>  drivers/gpu/drm/xe/xe_device.c             |  5 ++
>  drivers/gpu/drm/xe/xe_device_types.h       |  6 ++
>  drivers/gpu/drm/xe/xe_late_bind_fw.c       | 90 ++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_late_bind_fw.h       | 15 ++++
>  drivers/gpu/drm/xe/xe_late_bind_fw_types.h | 37 +++++++++
>  drivers/gpu/drm/xe/xe_pci.c                |  3 +
>  7 files changed, 157 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_late_bind_fw.c
>  create mode 100644 drivers/gpu/drm/xe/xe_late_bind_fw.h
>  create mode 100644 drivers/gpu/drm/xe/xe_late_bind_fw_types.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 7c039caefd00..521547d78fd2 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -76,6 +76,7 @@ xe-y += xe_bb.o \
>  	xe_hw_fence.o \
>  	xe_irq.o \
>  	xe_lrc.o \
> +	xe_late_bind_fw.o \
>  	xe_migrate.o \
>  	xe_mmio.o \
>  	xe_mocs.o \
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index cd17c1354ab3..584acd63b0d9 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -44,6 +44,7 @@
>  #include "xe_hw_engine_group.h"
>  #include "xe_hwmon.h"
>  #include "xe_irq.h"
> +#include "xe_late_bind_fw.h"
>  #include "xe_memirq.h"
>  #include "xe_mmio.h"
>  #include "xe_module.h"
> @@ -889,6 +890,10 @@ int xe_device_probe(struct xe_device *xe)
>  	if (err)
>  		return err;
>  
> +	err = xe_late_bind_init(&xe->late_bind);
> +	if (err && err != -ENODEV)
> +		return err;
> +
>  	err = xe_oa_init(xe);
>  	if (err)
>  		return err;
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 6aca4b1a2824..321f9e9a94f6 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -16,6 +16,7 @@
>  #include "xe_devcoredump_types.h"
>  #include "xe_heci_gsc.h"
>  #include "xe_lmtt_types.h"
> +#include "xe_late_bind_fw_types.h"
>  #include "xe_memirq_types.h"
>  #include "xe_oa_types.h"
>  #include "xe_platform_types.h"
> @@ -323,6 +324,8 @@ struct xe_device {
>  		u8 has_heci_cscfi:1;
>  		/** @info.has_heci_gscfi: device has heci gscfi */
>  		u8 has_heci_gscfi:1;
> +		/** @info.has_late_bind: Device has firmware late binding support */
> +		u8 has_late_bind:1;
>  		/** @info.has_llc: Device has a shared CPU+GPU last level cache */
>  		u8 has_llc:1;
>  		/** @info.has_mbx_power_limits: Device has support to manage power limits using
> @@ -555,6 +558,9 @@ struct xe_device {
>  	/** @nvm: discrete graphics non-volatile memory */
>  	struct intel_dg_nvm_dev *nvm;
>  
> +	/** @late_bind: xe mei late bind interface */
> +	struct xe_late_bind late_bind;
> +
>  	/** @oa: oa observation subsystem */
>  	struct xe_oa oa;
>  
> diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c b/drivers/gpu/drm/xe/xe_late_bind_fw.c
> new file mode 100644
> index 000000000000..eaf12cfec848
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
> @@ -0,0 +1,90 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#include <linux/component.h>
> +#include <linux/delay.h>
> +
> +#include <drm/drm_managed.h>
> +#include <drm/intel/i915_component.h>
> +#include <drm/intel/late_bind_mei_interface.h>
> +#include <drm/drm_print.h>
> +
> +#include "xe_device.h"
> +#include "xe_late_bind_fw.h"
> +
> +static struct xe_device *
> +late_bind_to_xe(struct xe_late_bind *late_bind)
> +{
> +	return container_of(late_bind, struct xe_device, late_bind);
> +}
> +
> +static int xe_late_bind_component_bind(struct device *xe_kdev,
> +				       struct device *mei_kdev, void *data)
> +{
> +	struct xe_device *xe = kdev_to_xe_device(xe_kdev);
> +	struct xe_late_bind *late_bind = &xe->late_bind;
> +
> +	mutex_lock(&late_bind->mutex);
> +	late_bind->component.ops = data;
> +	late_bind->component.mei_dev = mei_kdev;
> +	mutex_unlock(&late_bind->mutex);
> +
> +	return 0;
> +}
> +
> +static void xe_late_bind_component_unbind(struct device *xe_kdev,
> +					  struct device *mei_kdev, void *data)
> +{
> +	struct xe_device *xe = kdev_to_xe_device(xe_kdev);
> +	struct xe_late_bind *late_bind = &xe->late_bind;
> +
> +	mutex_lock(&late_bind->mutex);
> +	late_bind->component.ops = NULL;
> +	mutex_unlock(&late_bind->mutex);
> +}
> +
> +static const struct component_ops xe_late_bind_component_ops = {
> +	.bind   = xe_late_bind_component_bind,
> +	.unbind = xe_late_bind_component_unbind,
> +};
> +
> +static void xe_late_bind_remove(void *arg)
> +{
> +	struct xe_late_bind *late_bind = arg;
> +	struct xe_device *xe = late_bind_to_xe(late_bind);
> +
> +	component_del(xe->drm.dev, &xe_late_bind_component_ops);
> +	mutex_destroy(&late_bind->mutex);
> +}
> +
> +/**
> + * xe_late_bind_init() - add xe mei late binding component
> + *
> + * Return: 0 if the initialization was successful, a negative errno otherwise.
> + */
> +int xe_late_bind_init(struct xe_late_bind *late_bind)
> +{
> +	struct xe_device *xe = late_bind_to_xe(late_bind);
> +	int err;
> +
> +	if (!xe->info.has_late_bind)
> +		return 0;
> +
> +	mutex_init(&late_bind->mutex);
> +
> +	if (!IS_ENABLED(CONFIG_INTEL_MEI_LATE_BIND) || !IS_ENABLED(CONFIG_INTEL_MEI_GSC)) {
> +		drm_info(&xe->drm, "Can't init xe mei late bind missing mei component\n");
> +		return -ENODEV;
> +	}
> +
> +	err = component_add_typed(xe->drm.dev, &xe_late_bind_component_ops,
> +				  INTEL_COMPONENT_LATE_BIND);
> +	if (err < 0) {
> +		drm_info(&xe->drm, "Failed to add mei late bind component (%pe)\n", ERR_PTR(err));
> +		return err;
> +	}
> +
> +	return devm_add_action_or_reset(xe->drm.dev, xe_late_bind_remove, late_bind);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.h b/drivers/gpu/drm/xe/xe_late_bind_fw.h
> new file mode 100644
> index 000000000000..4c73571c3e62
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw.h
> @@ -0,0 +1,15 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef _XE_LATE_BIND_FW_H_
> +#define _XE_LATE_BIND_FW_H_
> +
> +#include <linux/types.h>
> +
> +struct xe_late_bind;
> +
> +int xe_late_bind_init(struct xe_late_bind *late_bind);
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw_types.h b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
> new file mode 100644
> index 000000000000..1156ef94f0d5
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
> @@ -0,0 +1,37 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef _XE_LATE_BIND_TYPES_H_
> +#define _XE_LATE_BIND_TYPES_H_
> +
> +#include <linux/iosys-map.h>
> +#include <linux/mutex.h>
> +#include <linux/types.h>
> +
> +/**
> + * struct xe_late_bind_component - Late Binding services component
> + * @mei_dev: device that provide Late Binding service.
> + * @ops: Ops implemented by Late Binding driver, used by Xe driver.
> + *
> + * Communication between Xe and MEI drivers for Late Binding services
> + */
> +struct xe_late_bind_component {
> +	/** @late_bind_component.mei_dev: mei device */
> +	struct device *mei_dev;
> +	/** @late_bind_component.ops: late binding ops */
> +	const struct late_bind_component_ops *ops;
> +};
> +
> +/**
> + * struct xe_late_bind
> + */
> +struct xe_late_bind {
> +	/** @late_bind.component: struct for communication with mei component */
> +	struct xe_late_bind_component component;
> +	/** @late_bind.mutex: protects the component binding and usage */

Please, before submitting another re-spin of this series, refactor
this mutex. This is absolutely not acceptable.

https://blog.ffwll.ch/2022/07/locking-engineering.html

This is protecting the code and not the data. If binding or usage
happens you need to have other ways of dealing with it.

The lock needs to be reduced to the data you are trying to protect.
Perhaps around the state/status or to certain register, but using
a big mutex like you use in the patch 5 of this series and stating
that it is to protect the code is not the right way.

Sorry for not having looked at this earlier.

> +	struct mutex mutex;
> +};
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 08e21d4099e0..e5018d3ae74f 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -66,6 +66,7 @@ struct xe_device_desc {
>  	u8 has_gsc_nvm:1;
>  	u8 has_heci_gscfi:1;
>  	u8 has_heci_cscfi:1;
> +	u8 has_late_bind:1;
>  	u8 has_llc:1;
>  	u8 has_mbx_power_limits:1;
>  	u8 has_pxp:1;
> @@ -355,6 +356,7 @@ static const struct xe_device_desc bmg_desc = {
>  	.has_mbx_power_limits = true,
>  	.has_gsc_nvm = 1,
>  	.has_heci_cscfi = 1,
> +	.has_late_bind = true,
>  	.needs_scratch = true,
>  };
>  
> @@ -600,6 +602,7 @@ static int xe_info_init_early(struct xe_device *xe,
>  	xe->info.has_gsc_nvm = desc->has_gsc_nvm;
>  	xe->info.has_heci_gscfi = desc->has_heci_gscfi;
>  	xe->info.has_heci_cscfi = desc->has_heci_cscfi;
> +	xe->info.has_late_bind = desc->has_late_bind;
>  	xe->info.has_llc = desc->has_llc;
>  	xe->info.has_pxp = desc->has_pxp;
>  	xe->info.has_sriov = desc->has_sriov;
> -- 
> 2.34.1
> 
