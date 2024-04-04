Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C41899142
	for <lists+dri-devel@lfdr.de>; Fri,  5 Apr 2024 00:25:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F0521135E1;
	Thu,  4 Apr 2024 22:25:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k4s9PInS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A52191135E1;
 Thu,  4 Apr 2024 22:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712269539; x=1743805539;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=jViSS5tEogD1L0DHxeYppKmDoY+O9r1JK9HuNdLkugQ=;
 b=k4s9PInSCaW8S70QfpPQTWRLXG89GoLzu+DA7yQwymDIN1T94ArbVgGg
 Eov6yH65CHQx0kyom2Q8uOocayPKo7LREQld9biBwGmH0LxIAhr0leEJ5
 mPAs3lLWnb61CG6/AfKH06kEW4U8Xu0LhBC9QF7YwVBbLSlmFpbg/kvoK
 lgvwpwwHvWSA1GU3dW2G29AccVv1T+Ku+omF/CIW+hLOaybo5+9E17Pzz
 kK/LgA4Ma9xVpeLGqntId/YVSYa5BZYwp+0t3E77u4rQWNBXI46gpb5/A
 cdZSq4HU8SrhRCTN8WZv8vEhhaK+6CmroADHkIInOaXVsuBwX+h9UWN8H A==;
X-CSE-ConnectionGUID: 6dSuygR8Q1myn5lmu5spkQ==
X-CSE-MsgGUID: sPR3gzbHTnqhmO2sbppiFQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="30055874"
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; d="scan'208";a="30055874"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 15:25:38 -0700
X-CSE-ConnectionGUID: cPdQpZdiS866f9hHuY9S2Q==
X-CSE-MsgGUID: OfwgzzQbQqCco/GNRw6/Sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; d="scan'208";a="19050126"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Apr 2024 15:25:38 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 4 Apr 2024 15:25:37 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 4 Apr 2024 15:25:36 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 4 Apr 2024 15:25:36 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 4 Apr 2024 15:25:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lt7L2uqN8Xpjxbev66gVouskXpI6tcU4fCzVoENj7YszB3FryyyZTo6PDcrSrun005JVzffE7MnZ5nFwtggGsjz9ok6BW0OuUT+Kub3lEON9RuWMrXWWNFQ9s0hPlDNg8F7tfpx2Q5gZdMqN4BtdpPpQJCa9PH540LW5MuQGdNBy58XfURLNjFshY9r2JVGrAiVcfcYUtq8prMRhUYr6/XSKhVom3oCCy5gW5na09MAjdhObVtyloUeepcFLTUKLSGu3ed6fpvqYCaCif/UCEDpyeXGIS235H1nTkSfqvzjQ9I7ZrrCN9Sl/LCsoz654qMQKGq6yrDoWloWXM5d8pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8TwSvUP+FSfWK9sau6ndDNjRa6JXQOzmSiPfPPMwhT8=;
 b=nhgCnJrsnhxVNgPxItJOayQmRSDQ16YDPVo+EDCbJKy9sPeIFQ/mdQKSntx1bpVgwQ4e1ZWnbAifo8cePNCPOwrFWZq/Qdn0OmSr3LQ8iWI8IITwFNVCRQc+nxNW+rxxuFKXL4mCQkGWHZPaeRM3ESRWYZPL4f3mgFZm4B/L6CSZ6HIoAwrqCsgC2Nq77uOsixha6CGm0ZQ13LRULrzDSE7J1oeuwwVuyLlh5OaLPWmgzLyJtLFkT4mjWZ97GEQp+6WB1jKg/yIKXQT+qrk11f/pE7r+WLNBT9SvFqh4yoxHu+eSENv0xFB8QeaS1QlY0Qrk/t9poOBMJAoVM7/ACA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by BN9PR11MB5242.namprd11.prod.outlook.com (2603:10b6:408:133::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.26; Thu, 4 Apr
 2024 22:25:34 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189%4]) with mapi id 15.20.7452.019; Thu, 4 Apr 2024
 22:25:34 +0000
Date: Thu, 4 Apr 2024 18:25:29 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>,
 <lucas.demarchi@intel.com>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v2 0/4] drm/xe: Support PCIe FLR
Message-ID: <Zg8o2W5whJFJzf8-@intel.com>
References: <20240402085859.1591264-1-aravind.iddamsetty@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240402085859.1591264-1-aravind.iddamsetty@linux.intel.com>
X-ClientProxiedBy: MW4PR03CA0152.namprd03.prod.outlook.com
 (2603:10b6:303:8d::7) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|BN9PR11MB5242:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xxKaPLMbYMyYYBsT7zBZEBmtjaLAqc+XZKUMn+tGlCG4ibePTPmpwHbjdb5SBXYtXO502L8Xxs5wzXvxTQXShCFwHmrWibmb8HfnzUVoy3iqfazl6asW1LxlS9olckhvBaDFqw+WZkMjfvosOpaT1qoLEet8Tm0NPM9YhSKnPbf/Sf0EIFiJHbo9DvEHZgT8vtlycNpMn3hUuviBt5c9Xehau2NKimUxj6SeRZ28h1NRbN9rL701XHxurqw7gWB6a1DO847HPsI+5z30uZm2d4yosvu4ThM73tdyxkHjRAGzgff5KbzOzvDmzKyhLrsHPX+S1oOd3X5qCy29OTstyYJ0dqBiA+65A7kOFnNeQyHwTUYCP3swLY2RCIyS0n1DegFeOZkf/JH/sc84tiepdRD9FBvYIb0q5I6KGnEh+NLFUM3b6Aa2Wz3X3Fm3EBDFPivIV6VECwsO2asEvktVBD+FMRpNUCkYTQIVLBWs6V/2x/mQtMxa+zRoAnBPExCDQ1Y/ZGrUPBbqFEeqHXCAy6VFTcDIg+iQ21YEto1RXUEsx4DFa0VHL1A9DHMgzNlXi5YVKZnOJRltjCLdlu6BV8pxNpTLWHHCjyNVxCAxvsg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lgtwRtJ1I8R6q2Gw5ZFwm30eR4ZwBPcoj73gHT6obWNMVPfdgjvT+KGjMqgS?=
 =?us-ascii?Q?42jE0fqFD2QbkcaINR+L9iAC/Y51K559AloGx2IfrkxfJxfJkmUsGl2v3O5+?=
 =?us-ascii?Q?g3UhKL/ra8NrNiU+SAT+3bDi4pROpP1IYkJKFmAjydkDZO2tV9otwgU2hCUS?=
 =?us-ascii?Q?zMV4hMQ4Wo7YmW5iAgn2KdoUew7VsWyM/C61WkwaZGAWTwpWYMp9SXCh0mle?=
 =?us-ascii?Q?81DXBl3a7zMCARTFspE1UnlYAvCW4Njf0QPJWClKmxs2dlTTa6/77XSzpRi8?=
 =?us-ascii?Q?hABf6Ro35CBPbvMwtQ/fV3SXe9bPSmYK8+zsh2EAJsRCjd8EAnpLEQYUtM2x?=
 =?us-ascii?Q?EV/nlvICJqhFhLPR1KuqsxyNowZ+sFscPCOQP0bOGnD+ufnE8Gc3PrVWStj6?=
 =?us-ascii?Q?KrXJlkfhRT/Pcm0Zc5g5U23gJSMhqSJdOYg/A8NZ7//7q799zNbyY/OOE8qP?=
 =?us-ascii?Q?PMMhH0NqMMKU65OPZTMU0H+TWzZmwBJSOvJejLc3z6/T7einWhG4DyUVtsvg?=
 =?us-ascii?Q?zZKi+Nd+XiMSb+tBgl7i13EIOoNfAWMaM5mGFQ1ceD1+nOaNHXWlZc4mxkXi?=
 =?us-ascii?Q?dk5f42i1JOq0q7zMhbFH42iG0vF+gESjYXlZkqEKwFd29agIm4kU9mzOpmaT?=
 =?us-ascii?Q?dmXjBTI7thUPSs7UqXke7SO04pWWlcrmr6QJidU/YPyoGmYFDQ8ufgpUL7VZ?=
 =?us-ascii?Q?hQCcx6k69ReMEUFg5ijH2OiVPwN0WveofJnMXahnBshRZajIgOnDtcyJoQhF?=
 =?us-ascii?Q?3pR2fFqfCpIIBXDwlgnTHT2PSKwSIhnpCtEDFPO6S9BwDHbXpmX6wGiUrb0H?=
 =?us-ascii?Q?6oZzyXwSa51uIz40Li2YVrg7u6JjmwzIaK/f7HmB8Xla6IZiWMTNshItI+4e?=
 =?us-ascii?Q?TtVgmayyZwby0dAoqawZ7mH+jgbrv0MSTX8nQEpiV9Abgd6ujSSB9s1MzV2t?=
 =?us-ascii?Q?pYZErunHBHbUHxv6F5e4m9hD5SIoGzyGq5d8zA3a3LoJbig3LVoWPxY3vUWc?=
 =?us-ascii?Q?hn28Mr/E89S/d2ILK7C63v8yo1qS9DiUABrv8feqbGfohVkha39C2ek8ncCU?=
 =?us-ascii?Q?lmnzK3msRyik6e+JrdEcoLYOobjqkyv+MN50q9gryR0sfUR6zVe4ddFISs1f?=
 =?us-ascii?Q?s/5JySZzb6No+rymnH2B5NmVixP1m/hXSNaDnRkqGbOPe5mYDLtjt+kb6l6l?=
 =?us-ascii?Q?M1ZQuOG9LAlgAx79au8hfTKuke6srPH1+iSi+qQmlOiR/CfT19PppgQeuLRq?=
 =?us-ascii?Q?Ms7ydBwMo+hE20zCWq+fgNYojcsLuY3LBZJPlABdeAltkGBgHk5bVzoAcKb8?=
 =?us-ascii?Q?9cM9drFKe+eURhNhh0cuo+McF3Ik8OE1VFICrUpRQ/wcPIwEYzdMTu6S/yyd?=
 =?us-ascii?Q?Y8kaniaipT2h/bwq68RvBIGAFIMMcpKYXsTt7SB4eUIRiftbKqF+5YTBGQFh?=
 =?us-ascii?Q?fUfwAyfKk57bSb8KlvJl52o8CmbrJm3VWe1Y093dmYdBAG8KTVVGiSHkAiKG?=
 =?us-ascii?Q?/uk64izRlBpPIveV/OfSeCSvgrqewwb+nXceZ30ryCnNMnKPWR0gnQGDvUNO?=
 =?us-ascii?Q?OCf10KBufrEZPGgftSmHhF+RUszokAKDT5eA/TTgMmfLpXQDWvlQScK2hylK?=
 =?us-ascii?Q?zQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dd0e0501-f723-4eab-35f2-08dc54f62528
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2024 22:25:34.4943 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PUiyWhyUtIxcyr5Fv2FbN8wIHWlHjiaMcAlY7HxUuo2KSxJT7THrK0A8g5chNB6OuenglMi5ovMfcg1DBE3iAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5242
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

On Tue, Apr 02, 2024 at 02:28:55PM +0530, Aravind Iddamsetty wrote:
> PCI subsystem provides callbacks to inform the driver about a request to
> do function level reset by user, initiated by writing to sysfs entry
> /sys/bus/pci/devices/.../reset. This will allow the driver to handle FLR
> without the need to do unbind and rebind as the driver needs to
> reinitialize the device afresh post FLR.
> 
> v2:

all the patches looks good to me here. feel free to use

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

on them.

but I do have some concerns (below)

> 1. Directly expose the devm_drm_dev_release_action instead of introducing
> a helper (Rodrigo)
> 2. separate out gt idle and pci save/restore to a separate patch (Lucas)
> 3. Fixed the warnings seen around xe_guc_submit_stop, xe_guc_puc_fini

On this I also had to fight to get something working on the wedged_mode=2:
lore.kernel.org/all/20240403150732.102678-4-rodrigo.vivi@intel.com

perhaps we can unify things here.

> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> 
> dmesg snip showing FLR recovery:

things came different at my DG2 here with display working and all:

root@rdvivi-desk:/sys/module/xe/drivers/pci:xe/0000:03:00.0# echo 1 > reset
Segmentation fault

and many kernel warnings
 WARNING: CPU: 8 PID: 2389 at drivers/gpu/drm/i915/display/intel_display_power_well.c:281 hsw_wait_for_power_well_enable+0x3e7/0x570 [xe]
 WARNING: CPU: 9 PID: 1700 at drivers/gpu/drm/drm_mm.c:999 drm_mm_takedown+0x41/0x60

[  117.128330] KASAN: null-ptr-deref in range [0x00000000000004e8-0x00000000000004ef]
[  117.128332] CPU: 13 PID: 2389 Comm: bash Tainted: G        W          6.9.0-rc1+ #9
[  117.135501]  ? exc_invalid_op+0x13/0x40
[  117.143626] Hardware name: iBUYPOWER INTEL/B660 DS3H AC DDR4-Y1, BIOS F5 12/17/2021
[  117.143627] RIP: 0010:__mutex_lock+0x124/0x14a0
[  117.143631] Code: d0 7c 08 84 d2 0f 85 62 0f 00 00 8b 0d 85 c8 8f 04 85 c9 75 29 48 b8 00 00 00 00 00 fc ff df 49 8d 7f 68 48 89 fa 48 c1 ea 03 <80> 3c 02 00 0f 85 46 0f 00 00 4d 3b 7f 68 0f 85 aa 0e 00 00 bf 01
[  117.150630]  ? asm_exc_invalid_op+0x16/0x20
[  117.156401] RSP: 0018:ffffc90005a37690 EFLAGS: 00010202
[  117.156403] RAX: dffffc0000000000 RBX: 0000000000000000 RCX: 0000000000000000
[  117.163571]  ? drm_buddy_fini+0x181/0x220


and more issues.

so it looks like we are still missing some parts of the puzzle here...


> 
> [  590.486336] xe 0000:4d:00.0: enabling device (0140 -> 0142)
> [  590.506933] xe 0000:4d:00.0: [drm] Using GuC firmware from
> xe/pvc_guc_70.20.0.bin version 70.20.0
> [  590.542355] xe 0000:4d:00.0: [drm] Using GuC firmware from
> xe/pvc_guc_70.20.0.bin version 70.20.0
> [  590.578532] xe 0000:4d:00.0: [drm] VISIBLE VRAM: 0x0000202000000000,
> 0x0000002000000000
> [  590.578556] xe 0000:4d:00.0: [drm] VRAM[0, 0]: Actual physical size
> 0x0000001000000000, usable size exclude stolen 0x0000000fff000000, CPU
> accessible size 0x0000000fff000000
> [  590.578560] xe 0000:4d:00.0: [drm] VRAM[0, 0]: DPA range:
> [0x0000000000000000-1000000000], io range:
> [0x0000202000000000-202fff000000]
> [  590.578585] xe 0000:4d:00.0: [drm] VRAM[1, 1]: Actual physical size
> 0x0000001000000000, usable size exclude stolen 0x0000000fff000000, CPU
> accessible size 0x0000000fff000000
> [  590.578589] xe 0000:4d:00.0: [drm] VRAM[1, 1]: DPA range:
> [0x0000001000000000-2000000000], io range:
> [0x0000203000000000-203fff000000]
> [  590.578592] xe 0000:4d:00.0: [drm] Total VRAM: 0x0000202000000000,
> 0x0000002000000000
> [  590.578594] xe 0000:4d:00.0: [drm] Available VRAM:
> 0x0000202000000000, 0x0000001ffe000000
> [  590.738899] xe 0000:4d:00.0: [drm] GT0: CCS_MODE=0 config:00400000,
> num_engines:1, num_slices:4
> [  590.889991] xe 0000:4d:00.0: [drm] GT1: CCS_MODE=0 config:00400000,
> num_engines:1, num_slices:4
> [  590.892835] [drm] Initialized xe 1.1.0 20201103 for 0000:4d:00.0 on
> minor 1
> [  590.900215] xe 0000:9a:00.0: enabling device (0140 -> 0142)
> [  590.915991] xe 0000:9a:00.0: [drm] Using GuC firmware from
> xe/pvc_guc_70.20.0.bin version 70.20.0
> [  590.957450] xe 0000:9a:00.0: [drm] Using GuC firmware from
> xe/pvc_guc_70.20.0.bin version 70.20.0
> [  590.989863] xe 0000:9a:00.0: [drm] VISIBLE VRAM: 0x000020e000000000,
> 0x0000002000000000
> [  590.989888] xe 0000:9a:00.0: [drm] VRAM[0, 0]: Actual physical size
> 0x0000001000000000, usable size exclude stolen 0x0000000fff000000, CPU
> accessible size 0x0000000fff000000
> [  590.989893] xe 0000:9a:00.0: [drm] VRAM[0, 0]: DPA range:
> [0x0000000000000000-1000000000], io range:
> [0x000020e000000000-20efff000000]
> [  590.989918] xe 0000:9a:00.0: [drm] VRAM[1, 1]: Actual physical size
> 0x0000001000000000, usable size exclude stolen 0x0000000fff000000, CPU
> accessible size 0x0000000fff000000
> [  590.989921] xe 0000:9a:00.0: [drm] VRAM[1, 1]: DPA range:
> [0x0000001000000000-2000000000], io range:
> [0x000020f000000000-20ffff000000]
> [  590.989924] xe 0000:9a:00.0: [drm] Total VRAM: 0x000020e000000000,
> 0x0000002000000000
> [  590.989927] xe 0000:9a:00.0: [drm] Available VRAM:
> 0x000020e000000000, 0x0000001ffe000000
> [  591.142061] xe 0000:9a:00.0: [drm] GT0: CCS_MODE=0 config:00400000,
> num_engines:1, num_slices:4
> [  591.293505] xe 0000:9a:00.0: [drm] GT1: CCS_MODE=0 config:00400000,
> num_engines:1, num_slices:4
> [  591.295487] [drm] Initialized xe 1.1.0 20201103 for 0000:9a:00.0 on
> minor 2
> [  610.685993] Console: switching to colour dummy device 80x25
> [  610.686118] [IGT] xe_exec_basic: executing
> [  610.755398] xe 0000:4d:00.0: [drm] GT0: CCS_MODE=0 config:00400000,
> num_engines:1, num_slices:4
> [  610.771783] xe 0000:4d:00.0: [drm] GT1: CCS_MODE=0 config:00400000,
> num_engines:1, num_slices:4
> [  610.773542] [IGT] xe_exec_basic: starting subtest once-basic
> [  610.960251] [IGT] xe_exec_basic: finished subtest once-basic, SUCCESS
> [  610.962741] [IGT] xe_exec_basic: exiting, ret=0
> [  610.977203] Console: switching to colour frame buffer device 128x48
> [  611.006675] xe_exec_basic (3237) used greatest stack depth: 11128
> bytes left
> [  644.682201] xe 0000:4d:00.0: [drm] GT0: CCS_MODE=0 config:00400000,
> num_engines:1, num_slices:4
> [  644.699060] xe 0000:4d:00.0: [drm] GT1: CCS_MODE=0 config:00400000,
> num_engines:1, num_slices:4
> [  644.699118] xe 0000:4d:00.0: preparing for PCIe FLR reset
> [  644.699149] xe 0000:4d:00.0: [drm] removing device access to
> userspace
> [  644.928577] xe 0000:4d:00.0: PCI device went through FLR, reenabling
> the device
> [  656.104233] xe 0000:4d:00.0: [drm] Using GuC firmware from
> xe/pvc_guc_70.20.0.bin version 70.20.0
> [  656.149525] xe 0000:4d:00.0: [drm] Using GuC firmware from
> xe/pvc_guc_70.20.0.bin version 70.20.0
> [  656.182711] xe 0000:4d:00.0: [drm] VISIBLE VRAM: 0x0000202000000000,
> 0x0000002000000000
> [  656.182737] xe 0000:4d:00.0: [drm] VRAM[0, 0]: Actual physical size
> 0x0000001000000000, usable size exclude stolen 0x0000000fff000000, CPU
> accessible size 0x0000000fff000000
> [  656.182742] xe 0000:4d:00.0: [drm] VRAM[0, 0]: DPA range:
> [0x0000000000000000-1000000000], io range:
> [0x0000202000000000-202fff000000]
> [  656.182768] xe 0000:4d:00.0: [drm] VRAM[1, 1]: Actual physical size
> 0x0000001000000000, usable size exclude stolen 0x0000000fff000000, CPU
> accessible size 0x0000000fff000000
> [  656.182772] xe 0000:4d:00.0: [drm] VRAM[1, 1]: DPA range:
> [0x0000001000000000-2000000000], io range:
> [0x0000203000000000-203fff000000]
> [  656.182775] xe 0000:4d:00.0: [drm] Total VRAM: 0x0000202000000000,
> 0x0000002000000000
> [  656.182778] xe 0000:4d:00.0: [drm] Available VRAM:
> 0x0000202000000000, 0x0000001ffe000000
> [  656.348657] xe 0000:4d:00.0: [drm] GT0: CCS_MODE=0 config:00400000,
> num_engines:1, num_slices:4
> [  656.507619] xe 0000:4d:00.0: [drm] GT1: CCS_MODE=0 config:00400000,
> num_engines:1, num_slices:4
> [  656.510848] [drm] Initialized xe 1.1.0 20201103 for 0000:4d:00.0 on
> minor 1
> [  665.754402] Console: switching to colour dummy device 80x25
> [  665.754484] [IGT] xe_exec_basic: executing
> [  665.805853] xe 0000:4d:00.0: [drm] GT0: CCS_MODE=0 config:00400000,
> num_engines:1, num_slices:4
> [  665.819825] xe 0000:4d:00.0: [drm] GT1: CCS_MODE=0 config:00400000,
> num_engines:1, num_slices:4
> [  665.820359] [IGT] xe_exec_basic: starting subtest once-basic
> [  665.968899] [IGT] xe_exec_basic: finished subtest once-basic, SUCCESS
> [  665.969534] [IGT] xe_exec_basic: exiting, ret=0
> [  665.981027] Console: switching to colour frame buffer device 128x48
> 
> 
> Aravind Iddamsetty (4):
>   drm: add devm release action
>   drm/xe: Save and restore PCI state
>   drm/xe: Extract xe_gt_idle() helper
>   drm/xe/FLR: Support PCIe FLR
> 
>  drivers/gpu/drm/drm_drv.c            |  6 ++
>  drivers/gpu/drm/xe/Makefile          |  1 +
>  drivers/gpu/drm/xe/xe_device_types.h |  6 ++
>  drivers/gpu/drm/xe/xe_gt.c           | 31 +++++++---
>  drivers/gpu/drm/xe/xe_gt.h           |  1 +
>  drivers/gpu/drm/xe/xe_guc_pc.c       |  4 ++
>  drivers/gpu/drm/xe/xe_pci.c          | 57 +++++++++++++++--
>  drivers/gpu/drm/xe/xe_pci.h          |  6 +-
>  drivers/gpu/drm/xe/xe_pci_err.c      | 93 ++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_pci_err.h      | 13 ++++
>  include/drm/drm_drv.h                |  2 +
>  11 files changed, 205 insertions(+), 15 deletions(-)
>  create mode 100644 drivers/gpu/drm/xe/xe_pci_err.c
>  create mode 100644 drivers/gpu/drm/xe/xe_pci_err.h
> 
> -- 
> 2.25.1
> 
