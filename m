Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OO7MEXpIqWnw3gAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 10:10:18 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EEBA20E095
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 10:10:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD8F510EBC1;
	Thu,  5 Mar 2026 09:10:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DlVTivM3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83FDF10EBB9;
 Thu,  5 Mar 2026 09:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772701814; x=1804237814;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=NOlx/7SB1h5l3HAAyU0rocMZul9WEwlmsAAVQfyUbmI=;
 b=DlVTivM3TXFbAlB5k1h8yE2yFjOrvyZbAix1i+1qhXGQlzMMIbgcR9NF
 VPEIyYulmFF+2T/r1GkCkw1JXIoaSZTESUGpBqI4TbBYNYgOzLfndi62D
 cKgA4GYYbrb/xXliUz7P3gThnvZiYOUpIdjtemGg9sbTNLrPMArNj7nVi
 IM5dcfwDSBhgD4HhO7snkapYODC03EOyBqc7Sv5rQ9vRdPwuerE2lJ8F7
 H7nWJ1AIZFlWuEMLALXhh37tzj7W7dN5YmJvKRlX66hBKYgbI7/F7PqLU
 Ecl1LWC9bwDdyfTfPjNI6Jzcv/aZXw6AWFSRc93BoO463HU+ZIy4T0V8b g==;
X-CSE-ConnectionGUID: 58tGZCB1TRqZd9vV7xiz5A==
X-CSE-MsgGUID: 5wAbQ+6HR8yYqkWg/JnvBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="72808529"
X-IronPort-AV: E=Sophos;i="6.23,325,1770624000"; d="scan'208";a="72808529"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 01:10:13 -0800
X-CSE-ConnectionGUID: PvWy1glDQou0GvzNSzwAfg==
X-CSE-MsgGUID: i3o6W5tyQXyWWo6j21ZYxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,325,1770624000"; d="scan'208";a="221515679"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 01:10:13 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 5 Mar 2026 01:10:12 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 5 Mar 2026 01:10:12 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.32) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 5 Mar 2026 01:10:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YW156j04GyC91XEPzny/ahRiMJYz5bUr8Hc1AG1CnbGU2Z+B8gVS8DsmeO7AM2/lFxwYBMwW8mgnMT8131LoW/LxPUd/sIgmm94WNsDTeCYST1zDpthhXAGT+jmgSZp2sMJAyeuz7TrRmSyFvPB1iz8NMK7/8ffb1ZzUB4bxEiFui0rfS5w+hi1LV+rlxWDf4Mur+DU7+JzAcD2cNrzsivECOz2zYSRLULbWnPqJiea9AulBrDN3kbnClgh9yIgEEmNpDIG9H3iFLCPrVJovA4FuiUzmWVtoeGcXTFw18BFV6g/PK2b+HUDU7WJZaYVP8jYh/3FxIC8jrBuEuP04Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Bt4JS9DSje4hpIYGNQ0Bx7/I6SAzuGtoJ6uQVVTM5s=;
 b=CJGzcb5LnOQS3CHxKH67bkTE7q19ZKGi1NPXAotpqkLKJkJ8d12gzTksNNXyia/eC4x4t3mSMn/W1aTtc68xVwvL7CKDm5lzWC2J8dXK/rze34zAxVqQCYjl0NlvfW80Fj1W8c8uMyWDjO8ceZ4XrKhz7etR3YInZp2WfAKb9pHzXQQvi0J8b5qabQRc43r1Bp+lML8mVBEub5tjNDV6MM7R2TdfID/BhpZ+s7VmZGgNie4NE2PPH+jujxK927sCVMv7wqsVv8Gb2zVvK9J4OqnXzLKgtMmB49nURpNGSzy+Jess9F1xGHb0JkxMjz7WGfR4XKukzMt7sCVsmEzdBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA3PR11MB7979.namprd11.prod.outlook.com (2603:10b6:806:2f9::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Thu, 5 Mar
 2026 09:10:09 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.20.9678.016; Thu, 5 Mar 2026
 09:10:09 +0000
Date: Thu, 5 Mar 2026 01:10:06 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <phasta@kernel.org>
CC: Boris Brezillon <boris.brezillon@collabora.com>, Chia-I Wu
 <olvaffe@gmail.com>, ML dri-devel <dri-devel@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>, Steven Price <steven.price@arm.com>, "Liviu
 Dudau" <liviu.dudau@arm.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Danilo Krummrich <dakr@kernel.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, Thomas
 =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, open list <linux-kernel@vger.kernel.org>,
 <tj@kernel.org>
Subject: Re: drm_sched run_job and scheduling latency
Message-ID: <aalIbgi71svPQs3Z@lstrano-desk.jf.intel.com>
References: <CAPaKu7RbCtkz1BbX57+CebB2uepyCAi-3QzBy8BDGngCJ-Du0w@mail.gmail.com>
 <aajkqXZDGUFPlq1o@lstrano-desk.jf.intel.com>
 <20260305092711.20069ca1@fedora>
 <fa4a9c55792b0e79d94faa82085b693aa7feb989.camel@mailbox.org>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fa4a9c55792b0e79d94faa82085b693aa7feb989.camel@mailbox.org>
X-ClientProxiedBy: SJ0P220CA0014.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::22) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA3PR11MB7979:EE_
X-MS-Office365-Filtering-Correlation-Id: 0df3343b-30e9-4cfe-c6fe-08de7a96fffd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: tDLiUJwsRbHStE91ZrVJgcXbV/Jszomk+/R4kSxbno/vtN0kiSy/mNVgegnml7ptfenF0yjgTniaBw/F36Hy8i0dkEGrUMtSI22C+sRsJk/7W8Nu0G6U9jcm7S9wnlWHoxF4wdFVl6wPEeHdwfXjSbhVG1nayJOCP020jV5R7Iv8vLgdoLvkRRc78oNaq5eO1/5exSsL4jcVTv3GZAlW/e5y+kpwEItCIT+Vj8fJpFBoO0S9BWB4s0nHn6/9OWQRKON621h7qOaPDuDEQWeb19enBAmL0v1g/r6KVDrgwKljRdLL0+fjuipJtNME+3QVOK/pIAPQnxrIHb2DTmtU2UIUIwOyFGIzLEsiTif1lBlNWGj7DT6PTs5tm9sY2yPDLvWUoL9A4C0vtux/nf1zXqTXxQhYBXx9tS5OeI9Pfb1o01UHnUOHkBKTM/j40RlDJavUY5VvJbIuEMgSfgUi49ipc9JMpXoQEHP6NTroO3QHUPNH/uYVw78Wbmn+46UbO6s6Pg/4k77ppGeOcsoFR11wEHD6CqRtNif9Tvq7GRcTaWdfHUwm9mTCpydqwvRIysX0o7Hz9ZkC5kBwKFHV0JxX8pELK1jjn6IyEWJSe4vXV8ni3/EJyMn5LbN2UjjJxB6e4B5lr3G2awtuI7zSMrx9lAeYomCKZedyUWnIgf2/OsJhvuRpqOP24LF7R874
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UE1BODhELytMa2hYbnJOa1JCYTg2WXlBUEpDS01ZeFhCMk5POTUvcUo3dXZp?=
 =?utf-8?B?aDF2cVhxODk2dU1zS3JkamFjYXpEa3FEMDJTOW1wK0cxc0FIaHZpeXVsZUx0?=
 =?utf-8?B?eE42OG5nZjQ5UUhtTFZGOW5xUTVPOE9IL2kyQW15bVNydXNyRXRIdVM3UFA4?=
 =?utf-8?B?MFNPZklKeDE2enN3a2ZsM3BGZ0lReWN3Uk81Q2ZLZUZOVmlmdmpBU1c1WGtX?=
 =?utf-8?B?ZlVwWXY3am9jZE9MZUpmTWo5TUNLZTNjd0Jpd1E1SHZiTUdROWk0cy9SYUdO?=
 =?utf-8?B?YXFBa1hIMEluRzNFYUxWakRsQlJ4Z2FYM3NPSXp3dk1oNG5sbm1rMktCMnVX?=
 =?utf-8?B?bVpZUXVFT1VrUHhyUGxMTVBvd0ZnUGxlbjZWaTZES3B4VmxnbWRRdVMycGNY?=
 =?utf-8?B?aDBjL3diSkFsUmpOek1vdm1LK21jRE85SWF3RzVpenZLb1NBaHI1eVQ0bmxp?=
 =?utf-8?B?My83Z20wOTMxM3IzU3ZzRGF4YVNReU1GQk5qdFdmRm5qL2pMaHpoTGlBb0Y5?=
 =?utf-8?B?bkFZbWkwUklCdHVLeGtLZDF0UGJPMFFuNzR2UWNYK0tsdUZJSkVtRThKaU54?=
 =?utf-8?B?THpOd3d3V3RTd0p3aWVnOUFVNXB6NURFdUFJeTQxNW9sbnJRSUEvamd1R1Vr?=
 =?utf-8?B?dUd5RHdZUHo0ellUSGY2VVNKOER3V2V1ajg1ZFhESW8yTHo2Y1lkb1E0SHNk?=
 =?utf-8?B?QnMvOVQ3RGhEaUxWVHZicE5DcW1Qa2ZrLzFYOUpvK2VjaWwzZXREdTlUR0pv?=
 =?utf-8?B?RzFsTjM3eUxPb2QrTjNCTTN3UzIwVkpJMDRiWnFYRHhYRUFOQnVPbWxGQ25s?=
 =?utf-8?B?b1oxTS90dlhrV3djd3dUZkRQK3pBZjBoTVFTWGpJQ2pnTXN1blk0bnBzMkNC?=
 =?utf-8?B?U1BPcHoyWkhZN3Yvd0NaV0V0UHhIUGZqR0tNZXAzcCtXZWtDeGVsT1FrUmtH?=
 =?utf-8?B?K3czR3M3MnI0VGhRYlE0NzZSclNRRERPNzYvV3ptNSt0YzZveUFvZzJRVVRL?=
 =?utf-8?B?emJLYVI2dVVabGwzeTBhNkFaZ0ljeDU1aU5hNDRNM05yclF4SjJlS1FTdnVE?=
 =?utf-8?B?d1hwUzBmTDh5QzQ0dVpWd09tWk45UWZUTkZ3OHlDVmpyWHBSM1d6bHVIR2sw?=
 =?utf-8?B?VWh5WStuL2JLbmNidlp2QnB1bGUzY1FDb2hGYUE2T3lITDhmdlozTm9YR3Z2?=
 =?utf-8?B?b251NHlDT3N1SjkwR21aMnRsa2JHSWVYeXVRUSsrQUM1aFBQMFZ6dGFtQ3hx?=
 =?utf-8?B?d0JNRUYwZ0I3TG5JbnluNUMwaGhQazlhVXRLeTBtTHhkK1N0RTV2NFNWdG1x?=
 =?utf-8?B?MllJVVRkK2xrOG9aaDJSck1ya28yNG5ZN1dCMjhPR2F4WnVSK3VtZUZpU0RK?=
 =?utf-8?B?N21IV2czL2grVTlsdHVHZGZRZ05jWmN3N3FPamVpSmMyUVdpNk4vM0UzQ1pI?=
 =?utf-8?B?QXgraGx1SHRvbWFKYU1DT0V3YVB5NXZoZ3g3U3FVRGZucW5zbEprL1kwTTFt?=
 =?utf-8?B?ZDNITXA4MkMydUhrbEd2VGRlaHZrQTRQUUJnTi9iOVBINDhlM2JlQXpLYkF3?=
 =?utf-8?B?SzZraGVnbTVZeHFBTHluU1pHWFNzd2VlcnJyWlBvZHk2dU80ZFg3NU9remg4?=
 =?utf-8?B?SUdsZ0xWRHBmbFYrNG15TE4xNGtsUFc4dERJRm1zVFhwSC9BeDB3bHltRnRV?=
 =?utf-8?B?d0haWlZGNVZQNC9VV2dyL2VjakdRbWV4cnQ3KzZscDIxaEpOVWhMWWx3WTFk?=
 =?utf-8?B?NDdCeUMxYUZKVkhqUlZQYWtOVC9DalJkODY2Qjk0TW91VnRTUmRYZUpkeVVi?=
 =?utf-8?B?VHpxSC8wL3FTelN5cDU4a2RwZjlUd2xUNExXdENuQ3FJYzdtd1E4MGhpVGR2?=
 =?utf-8?B?Mjc1blN4Z1FDV2crVmhhU0t3YzIrWXVyRzBBa1FaajZZRnZ5b2E3VURIV0Vz?=
 =?utf-8?B?WUlmZFRaMnkrRVprMWgvOGxZVXJ6WnJEUEtnbXFBc05UQm12ak9nY0poM2Nq?=
 =?utf-8?B?UDBsQlhpMGtZRTZ6Nm5JZVRpc3JYcVBxKzhoTUF0d2pQMzhSWW41TXBjRERH?=
 =?utf-8?B?eHJuRmJnRTVjWHpqcUp4ODBKSEpFTUpCT1hXcG04V3JjdVRGMDBWUHJCekZz?=
 =?utf-8?B?OEJjaTcrZzNiOWhvYURPWGN0eC9ZbE8xTkVxR3NYWjI2OERnV1RJczZvMFR5?=
 =?utf-8?B?MkZaVE1FQXJtbGNyZWszcVhHcHFFZFNWdmhqd3ZqN2wrdDd6L3VTYzEwVTQ3?=
 =?utf-8?B?TUlXNHhyaXpRMUtJcGRwTGZqTk14WkdEZEEvb1FIM3YwZWVqOWhxLzV4K3pa?=
 =?utf-8?B?MHFXbG9yRXppSUJvVmNMR3Z0M2V6TVhuQWpzcmEwSVJMajlGcEsyQT09?=
X-Exchange-RoutingPolicyChecked: Nv6S/0PJEdb+QRW1vQ2x1qtHtZheZcZbZi0UouAcD52lSFKNiYDkFc+0q+scXZDyHrydOvy1gvDqq5LA0F9tAHNdKTVay1uTS/JcwAaGGejJX1ubz7QoW73oUtSxEi8MIc/ZrpqjU5Vr+wamajE4n2PnpwFSSrX5r/PbwjS0rLVXwym2pCEJMU2EMZDX3FyAREU8AKy5sF14sOYyaFyH8qLJFJJ8WFq8O3mgzZx556zLtSAEWMXrP/OZENg4tTOo7oDz7Di4TJPZ/gMbOfyzXVMZKAEVGmHEC5A/Eu50IT8hePynfU5GlvijKEBcqosNRqj/nupkEmQ/Tt600hqi1w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0df3343b-30e9-4cfe-c6fe-08de7a96fffd
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 09:10:09.3227 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CAanL33vW8JUqC2gQyj2m7IHsiAPiyRlKAqOG9EkfRGvoAedj4aDaiweL75XZpOtu4fKWhnUYkEC6Xn8x1i9hw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7979
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
X-Rspamd-Queue-Id: 9EEBA20E095
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_CC(0.00)[collabora.com,gmail.com,lists.freedesktop.org,arm.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,intel.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[matthew.brost@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Action: no action

On Thu, Mar 05, 2026 at 09:38:16AM +0100, Philipp Stanner wrote:
> On Thu, 2026-03-05 at 09:27 +0100, Boris Brezillon wrote:
> > Hi Matthew,
> > 
> > On Wed, 4 Mar 2026 18:04:25 -0800
> > Matthew Brost <matthew.brost@intel.com> wrote:
> > 
> > > On Wed, Mar 04, 2026 at 02:51:39PM -0800, Chia-I Wu wrote:
> > > > Hi,
> > > > 
> > > > Our system compositor (surfaceflinger on android) submits gpu jobs
> > > > from a SCHED_FIFO thread to an RT gpu queue. However, because
> > > > workqueue threads are SCHED_NORMAL, the scheduling latency from submit
> > > > to run_job can sometimes cause frame misses. We are seeing this on
> > > > panthor and xe, but the issue should be common to all drm_sched users.
> > > >   
> > > 
> > > I'm going to assume that since this is a compositor, you do not pass
> > > input dependencies to the page-flip job. Is that correct?
> > > 
> > > If so, I believe we could fairly easily build an opt-in DRM sched path
> > > that directly calls run_job in the exec IOCTL context (I assume this is
> > > SCHED_FIFO) if the job has no dependencies.
> > 
> > I guess by ::run_job() you mean something slightly more involved that
> > checks if:
> > 
> > - other jobs are pending

Yes.

> > - enough credits (AKA ringbuf space) is available

Yes.

> > - and probably other stuff I forgot about

The scheduler is not stopped; serialize the bypass path with scheduler
stop/start.

> > 
> > > 
> > > This would likely break some of Xe’s submission-backend assumptions
> > > around mutual exclusion and ordering based on the workqueue, but that
> > > seems workable. I don’t know how the Panthor code is structured or
> > > whether they have similar issues.
> > 
> > Honestly, I'm not thrilled by this fast-path/call-run_job-directly idea
> > you're describing. There's just so many things we can forget that would
> > lead to races/ordering issues that will end up being hard to trigger and
> > debug.
> > 
> 
> +1
> 
> I'm not thrilled either. More like the opposite of thrilled actually.
> 
> Even if we could get that to work. This is more of a maintainability
> issue.
> 
> The scheduler is full of insane performance hacks for this or that
> driver. Lockless accesses, a special lockless queue only used by that
> one party in the kernel (a lockless queue which is nowadays, after N
> reworks, being used with a lock. Ah well).
> 

This is not relevant to this discussion—see below. In general, I agree
that the lockless tricks in the scheduler are not great, nor is the fact
that the scheduler became a dumping ground for driver-specific features.
But again, that is not what we’re talking about here—see below.

> In the past discussions Danilo and I made it clear that more major
> features in _new_ patch series aimed at getting merged into drm/sched
> must be preceded by cleanup work to address some of the scheduler's
> major problems.

Ah, we've moved to dictatorship quickly. Noted.

> 

I can't say I agree with either of you here.

In about an hour, I seemingly have a bypass path working in DRM sched +
Xe, and my diff is:

108 insertions(+), 31 deletions(-)

About 40 lines of the insertions are kernel-doc, so I'm not buying that
this is a maintenance issue or a major feature - it is literally a
single new function.

I understand a bypass path can create issues—for example, on certain
queues in Xe I definitely can't use the bypass path, so Xe simply
wouldn’t use it in those cases. This is the driver's choice to use or
not. If a driver doesn't know how to use the scheduler, well, that’s on
the driver. Providing a simple, documented function as a fast path
really isn't some crazy idea.

The alternative—asking for RT workqueues or changing the design to use
kthread_worker—actually is.

> That's especially true if it's features aimed at performance buffs.
> 

With the above mindset, I'm actually very confused why this series [1]
would even be considered as this order of magnitude greater in
complexity than my suggestion here.

Matt

[1] https://patchwork.freedesktop.org/series/159025/ 

> 
> 
> P.
