Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C75B2734D
	for <lists+dri-devel@lfdr.de>; Fri, 15 Aug 2025 02:04:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0063710E232;
	Fri, 15 Aug 2025 00:04:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JEqfD0hE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D7B010E232
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Aug 2025 00:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755216254; x=1786752254;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=6bSubiwMMJvaKawPoliDnSQAXcwmN8waFCTOKw8CerE=;
 b=JEqfD0hEUPVzyeaht8PstYWqNK8VLH9NJFLbyNoMy7ibXq6wptucOC0N
 FvQMvbiBGOTxp34qDgdjZ8+LFFp5KukH0EUFVZsPHGBccb/G/TEmhby+M
 Evdbsam6Y0DfqsyzGMWEOVQO5stimxBZVDk+zkYE/Nm5KHc9/CYwiF4D8
 f3idU6CqB3FkJhn/FE3Fs1ZznHrU/aEbSZq0Yy1c4bwHkPzzcIxx9PWv2
 TaOYEhN5XBkh9t9lyGW+A7CVpFCjzKoXa7ObXVEvI8Qrnjnqdk8tG/7Qc
 BpINLyON95s5Uj8CttysmrTq7t4PWBv0ox7Q0WmmyffOR+3Dk8gNDiv6m g==;
X-CSE-ConnectionGUID: JZiqPwzfQ2WeQmBzPlAL6A==
X-CSE-MsgGUID: 4kFaRfP8TSeUOYgTrO4oFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="57497848"
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; d="scan'208";a="57497848"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2025 17:04:12 -0700
X-CSE-ConnectionGUID: 4WArAnPhRl2hV31UcaAUHg==
X-CSE-MsgGUID: dheCAfeqQ2S/va8S2y5oVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; d="scan'208";a="172113635"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2025 17:04:12 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 14 Aug 2025 17:04:11 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 14 Aug 2025 17:04:11 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (40.107.101.59)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 14 Aug 2025 17:04:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OB5KrSrW55x8hspjgIDcuhhAOXjPRys7GfdQbP7bLhAwwJsexX2IZrrcanvjbmJ6q79rEIiFaRxZltDK/C1fJlHu9a0uYzgrlcYtI/BVcSWFC0YjYTnfH68dTIhaaMmsTRmGjuLBqi/NJoVagPRouq3xVEGWq5VeIPX5sTAh3D/XoeFIG1sk7wPWUJT5JHLLuLVmk0ffbgqcqsaCfd1r3Hreg4xl88lYX75IMUwzI/kzanY8FdY4aE2oLsl/jAZZmh8HvbzrZHqft7ej5M9rgZ3YqD0WLvzzyR/XNzPnzIJ3+tr9Rys33pc7Y0/bemPOOcOhNQWyi9lUxbi38PuD3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GdKfTaf/X7Ljp2H/0HvkDQo2uFFL5gO9511LNYbdhlw=;
 b=Ug+/xfB255ueaQF18kV8wcViPL6DJlR5qQ9MbMN0tb17/R+1wNJjAJtYj6k542qiBV62A7YJlhsiK7PABLD4vvgfTylhkSQTF2IWQt8QPaFNsEy6kvfLVKHeSFlY+FmmNWkzOnHqVsV1mwa2HxjQefuUauxTspWHWxe+2xb62wVwBG1J5A1oEbzP6R0s5PlWWQYjWGJeq9czIrGAU4k4+tBBF2KmkAlMZccr2eM27R9/X4Zqn1ZjKeWM9D7J/Uf9BqgEElzOgocqyYXjvQqTLdoS4/43R2q/OaI2k1Vq4nzMZxq+18FJZuamfBx+FZBXEpPCctitogkjZjXM9/kQgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by DM4PR11MB6239.namprd11.prod.outlook.com (2603:10b6:8:a7::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.18; Fri, 15 Aug
 2025 00:04:09 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%4]) with mapi id 15.20.9031.014; Fri, 15 Aug 2025
 00:04:09 +0000
Date: Thu, 14 Aug 2025 17:04:03 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Balbir Singh <balbirs@nvidia.com>
CC: Mika =?iso-8859-1?Q?Penttil=E4?= <mpenttil@redhat.com>,
 <dri-devel@lists.freedesktop.org>, <linux-mm@kvack.org>,
 <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>, Zi Yan <ziy@nvidia.com>, Joshua Hahn
 <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>, Byungchul Park
 <byungchul@sk.com>, Gregory Price <gourry@gourry.net>, Ying Huang
 <ying.huang@linux.alibaba.com>, Alistair Popple <apopple@nvidia.com>, "Oscar
 Salvador" <osalvador@suse.de>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Nico Pache <npache@redhat.com>, Ryan Roberts
 <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song
 <baohua@kernel.org>, Lyude Paul <lyude@redhat.com>, Danilo Krummrich
 <dakr@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Ralph Campbell <rcampbell@nvidia.com>, Francois Dugast
 <francois.dugast@intel.com>
Subject: Re: [v3 03/11] mm/migrate_device: THP migration of zone device pages
Message-ID: <aJ55c8yrcAN6upp9@lstrano-desk.jf.intel.com>
References: <20250812024036.690064-1-balbirs@nvidia.com>
 <20250812024036.690064-4-balbirs@nvidia.com>
 <81ca37d5-b1ff-46de-8dcc-b222af350c77@redhat.com>
 <9207451b-ebd1-46d5-b277-2adf3028f361@nvidia.com>
 <23a3e9b9-ad35-4469-884d-279aac0868de@redhat.com>
 <a8732499-161b-47f3-a936-580a43c6f323@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a8732499-161b-47f3-a936-580a43c6f323@nvidia.com>
X-ClientProxiedBy: SJ0PR03CA0237.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::32) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|DM4PR11MB6239:EE_
X-MS-Office365-Filtering-Correlation-Id: 3066a828-6e41-438d-210e-08dddb8f41e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Nm1ZTDR4QW02MjZJU3dkSnVtdFh2djBKRE1WVnZDa1VzV1Y0ejA3eXRLR1V5?=
 =?utf-8?B?MDZXWWRERVozYll1MkkwcDlyRkcyU28vR24ycTB0MkdrTmM2ZXgxZ3N6YWNY?=
 =?utf-8?B?OUxPeGhhTXF5M0tYUGUvcytPUE9xUWkvREVuRHRvZ09abDJlMmE3TjhyWmwz?=
 =?utf-8?B?c1ZQU2pJUkNTU3lGaG9UUlB5Y0pRV2VEcmkwYmZwbkdPRCtYY1VHV2VQL2Ro?=
 =?utf-8?B?cjZ3ZHp4bVVsRmZINE12b0RWb0R1a2ZXMlFLTjNnelBndVZlbk5YRldOd0g3?=
 =?utf-8?B?TEY0VER2RCtYVkRQdjNJSUdvcU9HVC9rZTVIbmE2SDBBUmpaTkpmdld1dEdD?=
 =?utf-8?B?U2dxSkdrejM2K241bVRHN0I2MEFyRjR0SGFpdm94QjFuM1UzY0Uwbnp0QjN1?=
 =?utf-8?B?NGtEMld0OGtVMUpvNkxtS0NWNUNzTFBuLzN4cXM3TDB3S1Z1M3ZyVk5xTGZo?=
 =?utf-8?B?cjBOdndMa1cvODdPVmRNV2pCekwwQW1RUmFqa3ZBVnllOEJobzBLMWdYbm10?=
 =?utf-8?B?dUQ0NFBIaTJVa0F0VGJKQXVETWNNZDR2ZGE0dGgwYWJQbElUaWtrUTQ1Q213?=
 =?utf-8?B?RUxiU0VpRkRZRE13dmhHYWltZnB6ZWErUGdNanBqU0QyaFlsT29tbHdFSFA3?=
 =?utf-8?B?TjMzZ1l0Q252T29CaWJ1NFhtbWdVYzlzUVFIYzI1NTExaC9ZTGlSNWpKdTI4?=
 =?utf-8?B?NXVxWDBkVTNhdW9nLzUrTjVia1NhWHN2QlRUWUFmcFhDRTBBeGhiK0VxSjIx?=
 =?utf-8?B?MDhlL3dTTFB0bThGSllTZFNJOFRBK2RZYnZIb25iR0luaFFnK0tBT0dPQ2hh?=
 =?utf-8?B?Q3U5Zm5YMGFjckZ1UnM0R1VBS0V4MlZxdU9lWGZ5aWFIUXJaSU1iZWRIN2Jv?=
 =?utf-8?B?bTkyU1JkeU95MXJ5cVNId01HeWhkQ2tYNVUwNEZDOEhrR0Y0VW5lK0Q4S0N0?=
 =?utf-8?B?c3lRR2VVWDJudC9FTXArbDRqMVRZYWExcmd3TTdrY0d0bjZLdjBtc25VOUU5?=
 =?utf-8?B?K3l5K3ZGZkFYbm9wVEFMQzhVaGVFeFZwSkVqbHBtMGxTcHowYlRQRnRJT3BY?=
 =?utf-8?B?UUx4a0Zxc1YydkVjaGVsc2hFVE92WWpjUzR1aDhWTzUrTmtUYjRtSEZ1Mzgx?=
 =?utf-8?B?bnB6SlVLa2tMY09ERk12NGlrYWdpVGZaQ2t0eXFsVzluYzNKWXhIY1ZqWDlE?=
 =?utf-8?B?UUo4SW44QmNMWTJpSWhIVlJqWmgyVnMyODFrWjkvaWtsZHZoUFAxY29JdlF5?=
 =?utf-8?B?aE9Zc1ZVeUhRMWZ0M2M5REVTbVkrYU5BcWhDbzVyY2RPZEVFVHdNY0d5YnVD?=
 =?utf-8?B?TUpuTEZMQ09mbDhubTVtM1FSLzVheGhBQm1GTEJRcWRudXhmVTZGa2RVdXNH?=
 =?utf-8?B?SmRwSXJMem1wVExoNXRYY0Z1WGZLcFQrUWpYdGNBTDNNbk02aytHL2dCVDIw?=
 =?utf-8?B?NXNCZjJxdXZYcDR2dmFTUXdENGljTzlueDMxTlVzTmR5K3ZQUXVuT1lDSGI2?=
 =?utf-8?B?L3ZJNDMrMlNhWjU1Tnl2UEhzZGUxc3BHNkxwdVJkTnFSS1ZvS0xuaDBiL1Zu?=
 =?utf-8?B?VVB4c09nN1ZRN0dTcTVuN01qaE1mODVnTkhyeXV6elRxT015RXFsdXpPS000?=
 =?utf-8?B?RklhZHlPZ1p0OUhqRFFMd1l3LzNhcjBSNGlTN0tlTFNTclUwN0x3eDFwaHlY?=
 =?utf-8?B?T0J6QlJXSS94by9XQ2s4MGZKZStUdVVBY2YwdUFWeTZoaHRyaFBzYllQUXBa?=
 =?utf-8?B?bXQ0NUs3RUVtanRkVVlFL3dVckVsaGszM1g4cURJVzNXN1U5dEtYbG1jSnNN?=
 =?utf-8?B?S2REK1lYSnhuanIxN00zaUlQelpXemVuczdvTzFSWHV1L2pOZkxRY1hjTjdL?=
 =?utf-8?B?S3BTY0JkSHdkbmNwbTNDSjFYaGgzSVRMTGhWVk1MazdtaHc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QlNTbVlQUjRRMVRmb2JtMG4za0Vpcm9NQ1FZcnZCckRCQVAxWXEwRXZiUktj?=
 =?utf-8?B?U0VZMGpFeWt6WWloWWdTWWJCZDVEVEVHZ2ZhL1RyNEE1YVJGbFZUbmY1VzVU?=
 =?utf-8?B?K2VXOTNVYytQbTdMOVR3NkgxMFgreEozZUJ6TFVJNzdtNTM5Rm1JSzNuSXdX?=
 =?utf-8?B?VXJURUErNkc2VlhLbnNDU2U5KzBMK2lDUmNLQ2NrZkUrenY5VTBpcnhraEhF?=
 =?utf-8?B?dWxrWnh4MzV1MHRBbC92a3RoQXFYZXJvdVNXUHVSTVBsQUNxUFlqRUJjOHNp?=
 =?utf-8?B?MFJ5NE85SmR2UHlOSmdhMFRxZTNyWWd6SXByUlhrYWJWZnlXYTV0TU9VODZD?=
 =?utf-8?B?bUVENVlsUHhEUGtqcTFrdzFydGZHYmRZdk5jZHpWV0pHVU5ZMFRHeC85Ym5l?=
 =?utf-8?B?eGljUTdYYlE0VnpiSUx5Qm5jNEtKVXVHanpvWFlWNTdjYXFtbWttN3VRS0Jl?=
 =?utf-8?B?UmVOMHJSQ21LL3ZzUTc3UFRoUnlZa1hEVlFURHlvSkJZd2tVQWQ1WkpSdHk0?=
 =?utf-8?B?RSs3UUhNUmI1enVKZEhaaTg3WU9nQnEwRkwzQ05mMlpieW1KT1FrNytEckFS?=
 =?utf-8?B?VkZHaGhQZkJWUlZsUGUvbGR5aCtYQTZiVElJWFNjOXA2TE1iNEtRTTRqUzJG?=
 =?utf-8?B?cEN0YlRJalhKeEVCbDNUeXQxVzZ6R0p5MUR2UUNXUUxBQkZ0b0JRQjIvTHJU?=
 =?utf-8?B?VUxmS3NRdDJ2M3BTeFNqWkE5Si9IdGt3Um1rRUxPSUlhc211dndSVVkxdVRm?=
 =?utf-8?B?L29tb0g3UUNlZ1RBRDFKUGNmMm9pT3dHc29PNFE0VXhqVGwwdEdacVYzbmxT?=
 =?utf-8?B?bk5YSUw0OHViNjhhbjRWYk9SdVZXQjdwVnRoWHQ0a3VYWE52SWJwNE8rTFRn?=
 =?utf-8?B?RUhtSXFZV01EcG02RExiZG8wOXhhd3RHTmZnSzR1YzA1VklOSEx6cVV0dlM1?=
 =?utf-8?B?dXFRYzNCSzIwTWFUMlhCLytkLzFoZWlseEhJa2dJSThxWHo2b3Q2TGsycitC?=
 =?utf-8?B?KzRQc3JtcXpRSCt3TlFwdFVrUFFjT1NiWUtNYU5IendwaVdUVTZiS3FSYW1W?=
 =?utf-8?B?NDZTeDFad25kRjJVelIrdzkvRmVFb1pudXNSOHZOaEhuOUsyYUdzeVdKaVBO?=
 =?utf-8?B?cnRNeGJtQmRxeDluUU5RZnlybG9TK0h6eUR1YytLakxYbk1PVUJCbjRVZkRQ?=
 =?utf-8?B?dTZ5VVE4Zm5OdjMrZlZRWHRQQUNTaDYzUE56aHpUbVBvSnZTMXdOMEF5dG9i?=
 =?utf-8?B?WjF5WUNpQXlzNFlPUnJJTjBjdTNyaDRYSzQwdksxSExFMnVlRTRiaVRzNjFB?=
 =?utf-8?B?eWsvYlBwT1plbEtwZHdQM0QxT09CWkFHVjI0d0tBQnNGbnhlVnVlL0ozQ0FJ?=
 =?utf-8?B?a1h3LzhiZHBoNkNPUGhvV1ZNR3IrbDRucXRsdVV0RnBNNkVwdVlRZWFDenRC?=
 =?utf-8?B?dlFBMjJudzRQM09jVndzWFN1Y3BSeHNleHBwZStrUFJhWWprTXlybnV5SW1q?=
 =?utf-8?B?aVB0cG1NSFRrYlVoQ25pbk1jMW5lYUNHL01DRVo0SFF0R3FpZnlDTllMYk5I?=
 =?utf-8?B?bEFwOCsyUU9aVTF3cUJ4eXFobWhtMTZiSjF2NFNXOGtOVndvZWlnTUpUazJl?=
 =?utf-8?B?eHErZDhUS3p1Wkd3dnQzQkl0UkNwbk5IcXc1SWpYcnJyN1JONXhHVE14bnVp?=
 =?utf-8?B?eVdnQlFIUHYrRWkzbWMya3A4SEh4cnVyTTJVNi94TU04WnlsWEpMaDFDS08x?=
 =?utf-8?B?bDluZ3NueUdQL1RLeVh0MFNWTDN1VXE0Q0JJbTdSMC9FQ2pJblZJUmc1ci8z?=
 =?utf-8?B?Vmc2Yy91a2xpSFROaDZydGZqa1dCTnYxSTM3MXh1Uk04dVVnU2NWeGpCa1V0?=
 =?utf-8?B?R3Z5dDlHRHAyc0ZtM0hsQUI5eHM2STBTUFBqY2E1VktjYjA5NkVDaGNwMGtT?=
 =?utf-8?B?emJ0NloyK2lmYmhpbG1hMEozV0V1N2MrU1NDZFZQRkNDbm13TlhNZlRxajEv?=
 =?utf-8?B?Mm5oYXQvcjhIUm5ZK1JsZ0F1c3J4NTJUSXdLRHV2ZmZTakhidDlEazlic2dv?=
 =?utf-8?B?REgxeTBQVWtXM2daMlJOcUE1dEFIY21FOFd4T2hwWXF3M3NBLzAyTVJiaEZ6?=
 =?utf-8?B?ZWlNOGNmTnhMdStiMkFwUWZ0eHNsSTVSbmZaWUpkSUc0YjRtQVFDMFBySGRZ?=
 =?utf-8?B?VHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3066a828-6e41-438d-210e-08dddb8f41e7
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 00:04:09.1365 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8D1myWSb42g7pGgMJMzJJ8gUwlBBu9/mivxvZRF3VcwSFNBz/sDJLyQdSy2iLpRiwWyhrHoFTGnZDJKyG83eiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6239
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

On Fri, Aug 15, 2025 at 08:51:21AM +1000, Balbir Singh wrote:
> On 8/13/25 10:07, Mika Penttilä wrote:
> > 
> > On 8/13/25 02:36, Balbir Singh wrote:
> > 
> >> On 8/12/25 15:35, Mika Penttilä wrote:
> >>> Hi,
> >>>
> >>> On 8/12/25 05:40, Balbir Singh wrote:
> >>>
> >>>> MIGRATE_VMA_SELECT_COMPOUND will be used to select THP pages during
> >>>> migrate_vma_setup() and MIGRATE_PFN_COMPOUND will make migrating
> >>>> device pages as compound pages during device pfn migration.
> >>>>
> >>>> migrate_device code paths go through the collect, setup
> >>>> and finalize phases of migration.
> >>>>
> >>>> The entries in src and dst arrays passed to these functions still
> >>>> remain at a PAGE_SIZE granularity. When a compound page is passed,
> >>>> the first entry has the PFN along with MIGRATE_PFN_COMPOUND
> >>>> and other flags set (MIGRATE_PFN_MIGRATE, MIGRATE_PFN_VALID), the
> >>>> remaining entries (HPAGE_PMD_NR - 1) are filled with 0's. This
> >>>> representation allows for the compound page to be split into smaller
> >>>> page sizes.
> >>>>
> >>>> migrate_vma_collect_hole(), migrate_vma_collect_pmd() are now THP
> >>>> page aware. Two new helper functions migrate_vma_collect_huge_pmd()
> >>>> and migrate_vma_insert_huge_pmd_page() have been added.
> >>>>
> >>>> migrate_vma_collect_huge_pmd() can collect THP pages, but if for
> >>>> some reason this fails, there is fallback support to split the folio
> >>>> and migrate it.
> >>>>
> >>>> migrate_vma_insert_huge_pmd_page() closely follows the logic of
> >>>> migrate_vma_insert_page()
> >>>>
> >>>> Support for splitting pages as needed for migration will follow in
> >>>> later patches in this series.
> >>>>
> >>>> Cc: Andrew Morton <akpm@linux-foundation.org>
> >>>> Cc: David Hildenbrand <david@redhat.com>
> >>>> Cc: Zi Yan <ziy@nvidia.com>
> >>>> Cc: Joshua Hahn <joshua.hahnjy@gmail.com>
> >>>> Cc: Rakie Kim <rakie.kim@sk.com>
> >>>> Cc: Byungchul Park <byungchul@sk.com>
> >>>> Cc: Gregory Price <gourry@gourry.net>
> >>>> Cc: Ying Huang <ying.huang@linux.alibaba.com>
> >>>> Cc: Alistair Popple <apopple@nvidia.com>
> >>>> Cc: Oscar Salvador <osalvador@suse.de>
> >>>> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> >>>> Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
> >>>> Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
> >>>> Cc: Nico Pache <npache@redhat.com>
> >>>> Cc: Ryan Roberts <ryan.roberts@arm.com>
> >>>> Cc: Dev Jain <dev.jain@arm.com>
> >>>> Cc: Barry Song <baohua@kernel.org>
> >>>> Cc: Lyude Paul <lyude@redhat.com>
> >>>> Cc: Danilo Krummrich <dakr@kernel.org>
> >>>> Cc: David Airlie <airlied@gmail.com>
> >>>> Cc: Simona Vetter <simona@ffwll.ch>
> >>>> Cc: Ralph Campbell <rcampbell@nvidia.com>
> >>>> Cc: Mika Penttilä <mpenttil@redhat.com>
> >>>> Cc: Matthew Brost <matthew.brost@intel.com>
> >>>> Cc: Francois Dugast <francois.dugast@intel.com>
> >>>>
> >>>> Signed-off-by: Balbir Singh <balbirs@nvidia.com>
> >>>> ---
> >>>>  include/linux/migrate.h |   2 +
> >>>>  mm/migrate_device.c     | 457 ++++++++++++++++++++++++++++++++++------
> >>>>  2 files changed, 396 insertions(+), 63 deletions(-)
> >>>>
> >>>> diff --git a/include/linux/migrate.h b/include/linux/migrate.h
> >>>> index acadd41e0b5c..d9cef0819f91 100644
> >>>> --- a/include/linux/migrate.h
> >>>> +++ b/include/linux/migrate.h
> >>>> @@ -129,6 +129,7 @@ static inline int migrate_misplaced_folio(struct folio *folio, int node)
> >>>>  #define MIGRATE_PFN_VALID	(1UL << 0)
> >>>>  #define MIGRATE_PFN_MIGRATE	(1UL << 1)
> >>>>  #define MIGRATE_PFN_WRITE	(1UL << 3)
> >>>> +#define MIGRATE_PFN_COMPOUND	(1UL << 4)
> >>>>  #define MIGRATE_PFN_SHIFT	6
> >>>>  
> >>>>  static inline struct page *migrate_pfn_to_page(unsigned long mpfn)
> >>>> @@ -147,6 +148,7 @@ enum migrate_vma_direction {
> >>>>  	MIGRATE_VMA_SELECT_SYSTEM = 1 << 0,
> >>>>  	MIGRATE_VMA_SELECT_DEVICE_PRIVATE = 1 << 1,
> >>>>  	MIGRATE_VMA_SELECT_DEVICE_COHERENT = 1 << 2,
> >>>> +	MIGRATE_VMA_SELECT_COMPOUND = 1 << 3,
> >>>>  };
> >>>>  
> >>>>  struct migrate_vma {
> >>>> diff --git a/mm/migrate_device.c b/mm/migrate_device.c
> >>>> index 0ed337f94fcd..6621bba62710 100644
> >>>> --- a/mm/migrate_device.c
> >>>> +++ b/mm/migrate_device.c
> >>>> @@ -14,6 +14,7 @@
> >>>>  #include <linux/pagewalk.h>
> >>>>  #include <linux/rmap.h>
> >>>>  #include <linux/swapops.h>
> >>>> +#include <asm/pgalloc.h>
> >>>>  #include <asm/tlbflush.h>
> >>>>  #include "internal.h"
> >>>>  
> >>>> @@ -44,6 +45,23 @@ static int migrate_vma_collect_hole(unsigned long start,
> >>>>  	if (!vma_is_anonymous(walk->vma))
> >>>>  		return migrate_vma_collect_skip(start, end, walk);
> >>>>  
> >>>> +	if (thp_migration_supported() &&
> >>>> +		(migrate->flags & MIGRATE_VMA_SELECT_COMPOUND) &&
> >>>> +		(IS_ALIGNED(start, HPAGE_PMD_SIZE) &&
> >>>> +		 IS_ALIGNED(end, HPAGE_PMD_SIZE))) {
> >>>> +		migrate->src[migrate->npages] = MIGRATE_PFN_MIGRATE |
> >>>> +						MIGRATE_PFN_COMPOUND;
> >>>> +		migrate->dst[migrate->npages] = 0;
> >>>> +		migrate->npages++;
> >>>> +		migrate->cpages++;
> >>>> +
> >>>> +		/*
> >>>> +		 * Collect the remaining entries as holes, in case we
> >>>> +		 * need to split later
> >>>> +		 */
> >>>> +		return migrate_vma_collect_skip(start + PAGE_SIZE, end, walk);
> >>>> +	}
> >>>> +
> >>>>  	for (addr = start; addr < end; addr += PAGE_SIZE) {
> >>>>  		migrate->src[migrate->npages] = MIGRATE_PFN_MIGRATE;
> >>>>  		migrate->dst[migrate->npages] = 0;
> >>>> @@ -54,57 +72,151 @@ static int migrate_vma_collect_hole(unsigned long start,
> >>>>  	return 0;
> >>>>  }
> >>>>  
> >>>> -static int migrate_vma_collect_pmd(pmd_t *pmdp,
> >>>> -				   unsigned long start,
> >>>> -				   unsigned long end,
> >>>> -				   struct mm_walk *walk)
> >>>> +/**
> >>>> + * migrate_vma_collect_huge_pmd - collect THP pages without splitting the
> >>>> + * folio for device private pages.
> >>>> + * @pmdp: pointer to pmd entry
> >>>> + * @start: start address of the range for migration
> >>>> + * @end: end address of the range for migration
> >>>> + * @walk: mm_walk callback structure
> >>>> + *
> >>>> + * Collect the huge pmd entry at @pmdp for migration and set the
> >>>> + * MIGRATE_PFN_COMPOUND flag in the migrate src entry to indicate that
> >>>> + * migration will occur at HPAGE_PMD granularity
> >>>> + */
> >>>> +static int migrate_vma_collect_huge_pmd(pmd_t *pmdp, unsigned long start,
> >>>> +					unsigned long end, struct mm_walk *walk,
> >>>> +					struct folio *fault_folio)
> >>>>  {
> >>>> +	struct mm_struct *mm = walk->mm;
> >>>> +	struct folio *folio;
> >>>>  	struct migrate_vma *migrate = walk->private;
> >>>> -	struct folio *fault_folio = migrate->fault_page ?
> >>>> -		page_folio(migrate->fault_page) : NULL;
> >>>> -	struct vm_area_struct *vma = walk->vma;
> >>>> -	struct mm_struct *mm = vma->vm_mm;
> >>>> -	unsigned long addr = start, unmapped = 0;
> >>>>  	spinlock_t *ptl;
> >>>> -	pte_t *ptep;
> >>>> +	swp_entry_t entry;
> >>>> +	int ret;
> >>>> +	unsigned long write = 0;
> >>>>  
> >>>> -again:
> >>>> -	if (pmd_none(*pmdp))
> >>>> +	ptl = pmd_lock(mm, pmdp);
> >>>> +	if (pmd_none(*pmdp)) {
> >>>> +		spin_unlock(ptl);
> >>>>  		return migrate_vma_collect_hole(start, end, -1, walk);
> >>>> +	}
> >>>>  
> >>>>  	if (pmd_trans_huge(*pmdp)) {
> >>>> -		struct folio *folio;
> >>>> -
> >>>> -		ptl = pmd_lock(mm, pmdp);
> >>>> -		if (unlikely(!pmd_trans_huge(*pmdp))) {
> >>>> +		if (!(migrate->flags & MIGRATE_VMA_SELECT_SYSTEM)) {
> >>>>  			spin_unlock(ptl);
> >>>> -			goto again;
> >>>> +			return migrate_vma_collect_skip(start, end, walk);
> >>>>  		}
> >>>>  
> >>>>  		folio = pmd_folio(*pmdp);
> >>>>  		if (is_huge_zero_folio(folio)) {
> >>>>  			spin_unlock(ptl);
> >>>> -			split_huge_pmd(vma, pmdp, addr);
> >>>> -		} else {
> >>>> -			int ret;
> >>>> +			return migrate_vma_collect_hole(start, end, -1, walk);
> >>>> +		}
> >>>> +		if (pmd_write(*pmdp))
> >>>> +			write = MIGRATE_PFN_WRITE;
> >>>> +	} else if (!pmd_present(*pmdp)) {
> >>>> +		entry = pmd_to_swp_entry(*pmdp);
> >>>> +		folio = pfn_swap_entry_folio(entry);
> >>>> +
> >>>> +		if (!is_device_private_entry(entry) ||
> >>>> +			!(migrate->flags & MIGRATE_VMA_SELECT_DEVICE_PRIVATE) ||
> >>>> +			(folio->pgmap->owner != migrate->pgmap_owner)) {
> >>>> +			spin_unlock(ptl);
> >>>> +			return migrate_vma_collect_skip(start, end, walk);
> >>>> +		}
> >>>>  
> >>>> -			folio_get(folio);
> >>>> +		if (is_migration_entry(entry)) {
> >>>> +			migration_entry_wait_on_locked(entry, ptl);
> >>>>  			spin_unlock(ptl);
> >>>> -			/* FIXME: we don't expect THP for fault_folio */
> >>>> -			if (WARN_ON_ONCE(fault_folio == folio))
> >>>> -				return migrate_vma_collect_skip(start, end,
> >>>> -								walk);
> >>>> -			if (unlikely(!folio_trylock(folio)))
> >>>> -				return migrate_vma_collect_skip(start, end,
> >>>> -								walk);
> >>>> -			ret = split_folio(folio);
> >>>> -			if (fault_folio != folio)
> >>>> -				folio_unlock(folio);
> >>>> -			folio_put(folio);
> >>>> -			if (ret)
> >>>> -				return migrate_vma_collect_skip(start, end,
> >>>> -								walk);
> >>>> +			return -EAGAIN;
> >>>>  		}
> >>>> +
> >>>> +		if (is_writable_device_private_entry(entry))
> >>>> +			write = MIGRATE_PFN_WRITE;
> >>>> +	} else {
> >>>> +		spin_unlock(ptl);
> >>>> +		return -EAGAIN;
> >>>> +	}
> >>>> +
> >>>> +	folio_get(folio);
> >>>> +	if (folio != fault_folio && unlikely(!folio_trylock(folio))) {
> >>>> +		spin_unlock(ptl);
> >>>> +		folio_put(folio);
> >>>> +		return migrate_vma_collect_skip(start, end, walk);
> >>>> +	}
> >>>> +
> >>>> +	if (thp_migration_supported() &&
> >>>> +		(migrate->flags & MIGRATE_VMA_SELECT_COMPOUND) &&
> >>>> +		(IS_ALIGNED(start, HPAGE_PMD_SIZE) &&
> >>>> +		 IS_ALIGNED(end, HPAGE_PMD_SIZE))) {
> >>>> +
> >>>> +		struct page_vma_mapped_walk pvmw = {
> >>>> +			.ptl = ptl,
> >>>> +			.address = start,
> >>>> +			.pmd = pmdp,
> >>>> +			.vma = walk->vma,
> >>>> +		};
> >>>> +
> >>>> +		unsigned long pfn = page_to_pfn(folio_page(folio, 0));
> >>>> +
> >>>> +		migrate->src[migrate->npages] = migrate_pfn(pfn) | write
> >>>> +						| MIGRATE_PFN_MIGRATE
> >>>> +						| MIGRATE_PFN_COMPOUND;
> >>>> +		migrate->dst[migrate->npages++] = 0;
> >>>> +		migrate->cpages++;
> >>>> +		ret = set_pmd_migration_entry(&pvmw, folio_page(folio, 0));
> >>>> +		if (ret) {
> >>>> +			migrate->npages--;
> >>>> +			migrate->cpages--;
> >>>> +			migrate->src[migrate->npages] = 0;
> >>>> +			migrate->dst[migrate->npages] = 0;
> >>>> +			goto fallback;
> >>>> +		}
> >>>> +		migrate_vma_collect_skip(start + PAGE_SIZE, end, walk);
> >>>> +		spin_unlock(ptl);
> >>>> +		return 0;
> >>>> +	}
> >>>> +
> >>>> +fallback:
> >>>> +	spin_unlock(ptl);
> >>>> +	if (!folio_test_large(folio))
> >>>> +		goto done;
> >>>> +	ret = split_folio(folio);
> >>>> +	if (fault_folio != folio)
> >>>> +		folio_unlock(folio);
> >>>> +	folio_put(folio);
> >>>> +	if (ret)
> >>>> +		return migrate_vma_collect_skip(start, end, walk);
> >>>> +	if (pmd_none(pmdp_get_lockless(pmdp)))
> >>>> +		return migrate_vma_collect_hole(start, end, -1, walk);
> >>>> +
> >>>> +done:
> >>>> +	return -ENOENT;
> >>>> +}
> >>>> +
> >>>> +static int migrate_vma_collect_pmd(pmd_t *pmdp,
> >>>> +				   unsigned long start,
> >>>> +				   unsigned long end,
> >>>> +				   struct mm_walk *walk)
> >>>> +{
> >>>> +	struct migrate_vma *migrate = walk->private;
> >>>> +	struct vm_area_struct *vma = walk->vma;
> >>>> +	struct mm_struct *mm = vma->vm_mm;
> >>>> +	unsigned long addr = start, unmapped = 0;
> >>>> +	spinlock_t *ptl;
> >>>> +	struct folio *fault_folio = migrate->fault_page ?
> >>>> +		page_folio(migrate->fault_page) : NULL;
> >>>> +	pte_t *ptep;
> >>>> +
> >>>> +again:
> >>>> +	if (pmd_trans_huge(*pmdp) || !pmd_present(*pmdp)) {
> >>>> +		int ret = migrate_vma_collect_huge_pmd(pmdp, start, end, walk, fault_folio);
> >>>> +
> >>>> +		if (ret == -EAGAIN)
> >>>> +			goto again;
> >>>> +		if (ret == 0)
> >>>> +			return 0;
> >>>>  	}
> >>>>  
> >>>>  	ptep = pte_offset_map_lock(mm, pmdp, addr, &ptl);
> >>>> @@ -222,8 +334,7 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
> >>>>  			mpfn |= pte_write(pte) ? MIGRATE_PFN_WRITE : 0;
> >>>>  		}
> >>>>  
> >>>> -		/* FIXME support THP */
> >>>> -		if (!page || !page->mapping || PageTransCompound(page)) {
> >>>> +		if (!page || !page->mapping) {
> >>>>  			mpfn = 0;
> >>>>  			goto next;
> >>>>  		}
> >>>> @@ -394,14 +505,6 @@ static bool migrate_vma_check_page(struct page *page, struct page *fault_page)
> >>>>  	 */
> >>>>  	int extra = 1 + (page == fault_page);
> >>>>  
> >>>> -	/*
> >>>> -	 * FIXME support THP (transparent huge page), it is bit more complex to
> >>>> -	 * check them than regular pages, because they can be mapped with a pmd
> >>>> -	 * or with a pte (split pte mapping).
> >>>> -	 */
> >>>> -	if (folio_test_large(folio))
> >>>> -		return false;
> >>>> -
> >>> You cannot remove this check unless support normal mTHP folios migrate to device, 
> >>> which I think this series doesn't do, but maybe should?
> >>>
> >> mTHP needs to be a follow up series, there are comments in the cover letter. I had an
> >> assert earlier to prevent other folio sizes, but I've removed it and the interface
> >> to drivers does not allow for mTHP device private folios.
> >>
> >>
> > pte mapped device private THPs with other sizes also can be created as a result of pmd and folio splits. 
> > Your should handle them in one place consistently not by different drivers. 
> > As pointed by Matthew, there's the problem with the fault_page if not split and just ignored.
> > 
> 
> I've not run into this with my testing, let me try with more mTHP sizes enabled. I'll wait on Matthew
> to post his test case or any results, issues seen
> 

I’ve hit this. In the code I shared privately, I split THPs in the
page-collection path. You omitted that in v2 and v3; I believe you’ll
need those changes. The code I'm referring to had the below comment.

 416         /*
 417          * XXX: No clean way to support higher-order folios that don't match PMD
 418          * boundaries for now — split them instead. Once mTHP support lands, add
 419          * proper support for this case.
 420          *
 421          * The test, which exposed this as problematic, remapped (memremap) a
 422          * large folio to an unaligned address, resulting in the folio being
 423          * found in the middle of the PTEs. The requested number of pages was
 424          * less than the folio size. Likely to be handled gracefully by upper
 425          * layers eventually, but not yet.
 426          */

I triggered it by doing some odd mremap operations, which caused the CPU
page-fault handler to spin indefinitely iirc. In that case, a large device
folio had been moved into the middle of a PMD.

Upstream could see the same problem if the device fault handler enforces
a must-migrate-to-device policy and mremap moves a large CPU folio into
the middle of a PMD.

I’m in the middle of other work; when I circle back, I’ll try to create
a selftest to reproduce this. My current test is a fairly convoluted IGT
with a bunch of threads doing remap nonsense, but I’ll try to distill it
into a concise selftest.

Matt

> Balbir Singh
> 
