Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UKHxOlljl2mnxgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 20:24:09 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB9FB161F0A
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 20:24:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02AC210E331;
	Thu, 19 Feb 2026 19:24:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KwiYV4Sd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2127410E331
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Feb 2026 19:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771529039; x=1803065039;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=C5/9xC9m4fIpjxWzgUcxHoMSyvvJQUm5zfFD/s/j0cQ=;
 b=KwiYV4SdsrNpASGnwv5OVUx8zrLneqrkkXme8MG33wJr7FF/rK3YNmqI
 lTupYyn99OuCyQp76b/N1LoIAKpdZ2gilNqUh3kRmhS4BU9OzKCY6wlZ5
 7Obk49phojfXC7Bv/uu+MxKIU/d2EUcEO+qodwDNJ2QTUmh0YimhGA27x
 4/46m+nSy6b5SguncSMd76U3omyJXx00HRYiuHGSWHULT3YW6xXqWOeY0
 EAOtcHBkTrJDsFjsbAfSmBnVXpcpWR7f7BO8mxMx4Tw7QB/foIAljq1iC
 /dQs8PtwUPtMvlIGGmvPr89bk3//vQlri/pC6JH62gQoAKAQpBM+Qcrmr A==;
X-CSE-ConnectionGUID: WkOlqhBzSOeVvcoYNNn3lg==
X-CSE-MsgGUID: IjhWGHlnTWO7PkQI1IvbNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="72724887"
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; d="scan'208";a="72724887"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 11:23:58 -0800
X-CSE-ConnectionGUID: +19v1MfkTXyVmlhyEvXacA==
X-CSE-MsgGUID: kcZCLixpSvy4Ddc5aK0TJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; d="scan'208";a="213227154"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 11:23:58 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 19 Feb 2026 11:23:58 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 19 Feb 2026 11:23:58 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.45) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 19 Feb 2026 11:23:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y3ll8/xH19W5BshGxg3BXigG7NvuDnqlY7roYsgRyBx13s2Q6s03Iim5ZXGacoKJ1GGZBV5FCKxW4O9gwhvHUiG+vfUffqSMEzq6ZG7voVmRdmcTJwz3u495ELtcr3pOhxdT5Qtl+EouoMyMONkOUDreHttFkvzKgM3bQ45UN0feXUQjxflNeAk+vDB7pdj1jiG2E14XoAShG4Kq7U2Lgi0WDz5Su0YDGNlW9EIRHaeNQN3EZZTs2+vB4ns0CC79xziXwJ1y+mM7ujG/9R8txUA3USLuRAoMe88OydFL0rN9FkGaxYukxObSLG2Is1wuh2DFdiG1jSPqXeEARs8nGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F+CWO8aTfUyV+YsQdO6C2B2mNheLZMOSR7DfQeuGVDI=;
 b=ief7fqNEBm56qudUtTi9M7X7XmZf1yFNhxne83GY9vabUn0hcJ9rYZBlWbu/6064fxyRBmWKntnw2b7EXR20+PyMo98Gu7ykG1JNZvlAqWnDsr+aAfQsn2zfKHBvvnuzE9srbs4GIIV0YE/tlixx5115rB5dM6vf2u/m39UyDY7VxA+04MtXQcS5hiMsTyZ0T9aK6QaZjSO1SE+ISmtnRd9mQepmIjlBtGUp5dxFqVkV0Yeox+OO1aU7EYCcrAQAuPhPffozMYb9FuDfAfcPtnwwZVNP/1/WhxM2K2aMScFMMIVpKbwPDEMo0cOrb5vwQoPv3XD/yxFnBJKtn95uKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by SA1PR11MB6893.namprd11.prod.outlook.com (2603:10b6:806:2b4::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Thu, 19 Feb
 2026 19:23:51 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d%5]) with mapi id 15.20.9632.010; Thu, 19 Feb 2026
 19:23:50 +0000
Date: Thu, 19 Feb 2026 14:23:45 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Chris Mason <clm@meta.com>
CC: Dave Airlie <airlied@gmail.com>, dri-devel
 <dri-devel@lists.freedesktop.org>, Sima Vetter <sima@ffwll.ch>, "Linus
 Torvalds" <torvalds@linux-foundation.org>
Subject: Re: drm AI patch review hacks
Message-ID: <aZdjQb7JFa5HGYFq@intel.com>
References: <CAPM=9twmmLhc-DJV2hFKJ1kahzxRUY5j1cLH9JjZ33LEjjBNbQ@mail.gmail.com>
 <7de4b6c4-f230-4c66-87d8-7766a95cd10b@meta.com>
 <CAPM=9tyPS=B9WEwn8BydwfpY1qLY+umUQxsJBbXT13nqxK1aTA@mail.gmail.com>
 <d1603a67-8956-4d01-97bb-e9b6f17a76b0@meta.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <d1603a67-8956-4d01-97bb-e9b6f17a76b0@meta.com>
X-ClientProxiedBy: SJ0PR03CA0021.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::26) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|SA1PR11MB6893:EE_
X-MS-Office365-Filtering-Correlation-Id: 209b3b7d-a901-4dda-3a5d-08de6fec6976
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?MSivrszy891cs2Cz2cCSiq4aFcfdaCvNov25a41Egdte8w2m63aR4LvNeYR2?=
 =?us-ascii?Q?+k/P/iGAM5nQoVBaRfeUb827bY6qks27DyCEd2Mp/0vUwrAfhfbolZZVbpHf?=
 =?us-ascii?Q?Wg6QDgeKL3KmG9mwPrI8daw/hm4ynMjaVLPEcGklmJ90u9AkglYFIVFhZtHr?=
 =?us-ascii?Q?L+QP8BSX0Urlnplt0JHKsTtcCmHMfR4kzsSDWZRjfijTDBd/TuaEfTx+O6Y3?=
 =?us-ascii?Q?Hk47MfF4e8/NVJH11B8XYULWcxVs2GdjO9SYSJsC2CEElFu68wLqvcOXPuZH?=
 =?us-ascii?Q?V8RSPIN0I2pX5weiqe80kyljXeYGRdZVW/tSajrtbsON56LhsdX+xzmbY2J4?=
 =?us-ascii?Q?RUmeppVxrIAttBeLpAU46IDWeHZz4Zhr9aOzICLcq1/jf1aqDTbR3gBH9OkC?=
 =?us-ascii?Q?8tBK86MsTGZHo/wo5aF9rPPHv8YIfOfiS/fl9+d/9YVbSCkuQWM4+FvMx6vt?=
 =?us-ascii?Q?uUWGDnB9a6GAG3a/f2j3UnYCsx2wTS7IGwLBiZeM26p1acnNJr/tN+5+v12C?=
 =?us-ascii?Q?l8sB13WEHfe6ZOFERlRsQWM9szY/i9M/xxjq7TaioI8orm7FNZ0tUjE6xJ57?=
 =?us-ascii?Q?+m0C2v7ImzgbNIV/ne6UF+9g2iJFnbSggbjS/sb7JAK9vgnNFzmZUbZa9DbX?=
 =?us-ascii?Q?fnrw/aXnXLO1kmHgz21JKr+4UnTNxdldUvwM90ZoFfR3aNu9yKbN+BXfkGwU?=
 =?us-ascii?Q?elAjLwrg2HnXhKdBD/Fa/edM+zP70IgmsdMCfe9AIY9CrflrJkPLlsUc/+X7?=
 =?us-ascii?Q?358yDNfCX/0B6onzTqM5tiU5zLzY9jDSb/kX7Jl5mcINK3RvDOl9ahvZ4k/U?=
 =?us-ascii?Q?tQOoNco8qfAHYA8Hg+GEAr+68/L3wofXi/p5PDsWUkfcILV/UN+ejBT29aM0?=
 =?us-ascii?Q?RoPfmgw7q14R70TdcoyD8lrp2D7JYWSfsvckDOohTMfj/qpbRrQmf163bENY?=
 =?us-ascii?Q?EFoq7qUuzXHuTo9zUDgxc4pVoYIWN0+g/vTUPH8437G237utuXxcpJVpPedR?=
 =?us-ascii?Q?5n0/JhNIqLWM9x6ZCEC4Znqm4nHr8qqbZst8YzgLOOrEjEG0rs2nOAX+SMB2?=
 =?us-ascii?Q?mptb+yaOpi9f2VC18c31x6qgrMBIgmwIuaBSFu6h8yKwZcGSKN69/MxS9bcs?=
 =?us-ascii?Q?lvfvruGHiKtBEKzbKjLeZHUFIsx4sa9Pmqs3HkBGc/onOBgPF+t1Xjl21Gms?=
 =?us-ascii?Q?9BdpebytSdxIXJis5KOhgyMzuUgBQGJ6aNzsrdEW8EoVJhkpAeOoDWxKl4VI?=
 =?us-ascii?Q?3DHRGwt5wx+0zfoAXg6FFYP9THE9diQkdU56rU73pp08KXSjRoFUKeT+aC0F?=
 =?us-ascii?Q?83FpdsHTtLJD8Y79XlbIl+2GVDQB4zQk+Fv/hxp0HFSGoZeydvh7oRh5RKYG?=
 =?us-ascii?Q?tp75rUA5nLX5NHTv3OJUDJLiovZHpb0uHuXQ9ruI7UltISQo6OGO2S3aGmIG?=
 =?us-ascii?Q?SIA0MYKsKoLziKzyeHxKtmf0BrtxE57NEep8m7sopxqYOmRDBGFVOjx1GjmA?=
 =?us-ascii?Q?qlVZhpgTiaDEoAmObaE3Jl0Xfx4d85Xhu+fK8abkfUwbel3MvskzqbH4O0eB?=
 =?us-ascii?Q?XuF7pGFFC0+hIR1vxhI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PXz+k/xwIooK43k0QhM9e5Au5f8GVnOjbDvX0mzGV9kbBGvO9dgEDBCFU47Q?=
 =?us-ascii?Q?H3ZtZPnGALVEdyXLS2xB+gvSeWgtcBEmm955Zc+TkjEAVi6cHqHcWt2vhVRS?=
 =?us-ascii?Q?Bkd35+kUYfipz7UXIEMAZwm3A6qTzQwH1ruRPejFzbhcmthH9ey2e0qoeibq?=
 =?us-ascii?Q?jFBLZTsWwoAcQTnvNLPJrrsaaSiyJoU0Ba6xG2WxOUWxPEXCIN4Y8752zyEp?=
 =?us-ascii?Q?2nHW5O1ot/qu4qTUwIhItShGrHRYsERvpELBfSh6qZ6ko6zIaeDldYc+b6ig?=
 =?us-ascii?Q?K7ZD7FvRt7unYxGo5ULt+3HEarIGE9IOxZNzUuAcr5oimFvU1tkcUqMKvIUS?=
 =?us-ascii?Q?Taa3zzLUQcCkAwkQIETXua0pCjmOkMHjB/PE/31E3/0UehS5N4bEzYRXqphH?=
 =?us-ascii?Q?LYv0FWu41G4FV0DlpouXI6CJFhvfH47y72VcTg8cWqBNtLa4qKEnK/tkXBua?=
 =?us-ascii?Q?2X3ZmA1e6uB/6ObECwVAuWkpee1aWKsDDzNzx/7aI8DOF5axTW95KPPLxwyN?=
 =?us-ascii?Q?6w5ajZkaxy4N/XEnXF1B6tOfwzlqV+YSmW+8l+vzqHuhFPGNlbKLj3AOXOzy?=
 =?us-ascii?Q?DNPdCfFclpyOEv10wfKvbXoDXPz+UN9SM+t2Xr9t/jz+M9COCbfmiTJO0U7f?=
 =?us-ascii?Q?cPhLB7DH1DmYXAMD5i/4GAdWhzdrjtreZdgIvVq5001ACT56igDp6smREgdd?=
 =?us-ascii?Q?6VGjfi/htOwXThZJyhR6D8wOYhKYhE2RaMVgAd0gPyqfy6rvGLNQFbZPiSlp?=
 =?us-ascii?Q?W2iYvUd6MuDYqO5gRs4ZjlEVtoo69oBRTNOoSqAEdqlhrBiR7YB8WTqubjqk?=
 =?us-ascii?Q?FCnsR13RXBwyGNt/lnGdvfAa4EzvJFj8PvVzM23vldqlYliPPNiRFWxAbzNt?=
 =?us-ascii?Q?Z2lfWVLcGVcDzwo92+B3Q3CweuzMon19iIw74YMs7Z9JNfbPaSTzBlYYCcNs?=
 =?us-ascii?Q?CS+E1PWoFkMVSOa6+r+dqPtFAx6LOwptPWYiHrwwaiiferrkEw5n0ZJx/JIC?=
 =?us-ascii?Q?FHHPthn962v1YUZLaHyxsdp8j2rALdSBm9VH4MFMQVWCaBpTUmJ9YO1Ug8Fu?=
 =?us-ascii?Q?gQqHmnd/ixfDCsIC40Xsvub7rjydwkf5m7PRbvp3MPGEMdiLXCrLLMtWIfNS?=
 =?us-ascii?Q?u5zYfiekjlhKzvFexMGmHPVjcoo7gzpxRIVnu8A3Us7Mp/6wiROsdPjzO0po?=
 =?us-ascii?Q?BZOma43haf8g8rllK/haMw54iBeHt09Mefp5TwxCH6HdZgK0PvBEeLAWwuMH?=
 =?us-ascii?Q?xdTF1Vj3DAw8bUkAbpgqEVBS/qkjf8OcIjccGL8BQQghys5evrsVtcn9ACCA?=
 =?us-ascii?Q?OjhfbHUar0GjMqvbWHD+t4qwdYs7qhmRofgTbwqBXv2xcc7bscbPjZq41XG9?=
 =?us-ascii?Q?l/NnD6knMkKWOCgFX0BYDjCYRjWfX8Y1YbaJFhAO4QS7OV4je5mcNlijXPJs?=
 =?us-ascii?Q?1qkjbMjqeVY1uVtbOYUobZv2URtzJpjXal+OQuI6QVeg7v3KMRxgFNAaGfHv?=
 =?us-ascii?Q?8j/VWKseeXJ6/+PLH6tuvXhXa4yHfOJVfyzT1NaD5wtANWBA/CrOelWezI54?=
 =?us-ascii?Q?So/DSEnKU44OIpOWLgMqv5BWaais7tJz14MwzSbMSoJk1Q+i10vZCulpfEPK?=
 =?us-ascii?Q?1UTQ2m0VaZwxyG7nsMbJoVQNYP+E4GosieM/VWypmG1k2LsfVxR2WKukMW6I?=
 =?us-ascii?Q?+9b1jGmsotFUiThkkODTJJb3oJp2BVQw9/ivUr7HSwjb3KtDk64SsxYSusBO?=
 =?us-ascii?Q?EAPRJnZEKQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 209b3b7d-a901-4dda-3a5d-08de6fec6976
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 19:23:50.8216 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vc96rkyXUfpziLBdVNDDHAGKRPsphlwr3fhuslkCzX5yNCybsNqskwfuvB5MuufhuDm708wD3vKpXW1zFnu8JQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6893
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	TO_DN_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[rodrigo.vivi@intel.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:clm@meta.com,m:airlied@gmail.com,m:sima@ffwll.ch,m:torvalds@linux-foundation.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,lists.freedesktop.org,ffwll.ch,linux-foundation.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:mid,intel.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,meta.com:email,false-positive-guide.md:url];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[rodrigo.vivi@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: AB9FB161F0A
X-Rspamd-Action: no action

On Wed, Feb 11, 2026 at 03:24:49PM -0500, Chris Mason wrote:
> 
> 
> On 2/11/26 3:05 PM, Dave Airlie wrote:
> > On Thu, 12 Feb 2026 at 06:02, Chris Mason <clm@meta.com> wrote:
> >>
> 
> [ ... ]
> 
> >>> This is also just an experiment to see what might stick, it might
> >>> disappear at any time, and it probably needs a lot of tuning.
> >>
> >> The output is pretty different from netdev/bpf:
> >>
> >> https://lore.kernel.org/bpf/?q=AI+reviewed+your+patch 
> >>
> >> Which might be what you want so it's fine of course.  But it looks like
> >> it didn't actually go through the report generation from the review
> >> prompts, so I'm worried it didn't use the rest of the prompts either.
> >>
> >> My stuff should be creating a review-inline.txt which is the lkml
> >> formatted review.
> >>
> >> I'm happy to try things out here if it'll help.
> > 
> > My plan over the next few days is to refine the code to make sure it's
> > doing this, my prompt asks it to load the patch and the kernel
> > prompts, then do a review across the series and individual patches,
> > 
> > I'm guessing some of the results aren't making it back out the other side.
> 
> I had to change the prompts a bit, I think my original instructions were:
> 
> "read prompt xyz and patch abc, review the patch"
> 
> But sometimes claude would read the prompt and the patch and then follow
> it's own review protocol instead of mine.  The current /kreview slash
> command is a lot more reliable:
> 
> Read the prompt <path to prompts dir>/kernel/review-core.md
> 
> If a git range is provided, it's meant for the false-positive-guide.md
> section
> 
> Using the prompt, do a deep dive regression analysis of the top commit,
> or the provided patch/commit

Chris, first of all congrats on this work. I definitely loved the results
I've seen so far.

I hope my question doesn't bring here the old LLM discussions. But based
on the old discussions and people afraid of AI slops in the Linux Kernel
and the potential increase of noise in the review processes, I got myself
wondering if it would be possible to add in your tool some prompt to flag
if the patch/series is a potential AI Slop.

Something like using the AI to detect AI generated code that was not
complying with our good-players guidelines.

Have you considered something like that?

Thanks,
Rodrigo.

> 
> -chris
> 
