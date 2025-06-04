Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4352ACE2C9
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jun 2025 19:08:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BF3C10E164;
	Wed,  4 Jun 2025 17:08:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fwddauT0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7544F10E146
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Jun 2025 17:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749056932; x=1780592932;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=CJ6zOhMcIt7IAqPH8AK+tLxkIgSk3RkuR7fuDl4SFcA=;
 b=fwddauT0WsRfg8CaOn9o6mjB9MANREqdR3NqU7td2MKINkSivDEkebVE
 SUZxCRM67OJZ0yiEm2oBeMDyL8FRLgviC4Z5SpU1wWLp1NOnHSsiedNfR
 Pp5rswzMvjL8pe+nouVv2rIOYTAJr0b5tHJlNA8JfQoZY5qVwAJKXL8gV
 oMfWiz9TaLNTvdYWym6GEU8VG13XQzu6amZQsmmvsSFVYHu3HOLxX1qlh
 UbId4Uab1uTDGuGXMCf2zA1/YcWFt5wXb8UMd+HDMGP8Wn7hXOO32ru2L
 S/Ff+SHegfRKyUnXLLdLe2YiHC6RPqXfEQ9JPl3asJNLtFqoQeeEee6Ug Q==;
X-CSE-ConnectionGUID: wCtQ/Un1SBqJoH1agTLvcg==
X-CSE-MsgGUID: +0y5E2rGS1ywGlC9jBM67A==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="50392928"
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; d="scan'208";a="50392928"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 10:08:51 -0700
X-CSE-ConnectionGUID: VXZi/FsJSUOvIGGk36B/Wg==
X-CSE-MsgGUID: wISv0FkaR4iBAgA0sDLnIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; d="scan'208";a="145148475"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 10:08:52 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 4 Jun 2025 10:08:50 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 4 Jun 2025 10:08:50 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.51)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 4 Jun 2025 10:08:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t9gLjrKtsnF8kgC8ZX7LcOWH8gKTiduTmfHOChw3wz3aoSK4aXfcbU9xnF01S+MFvwxPbh/K3pgaux8pmyyqzA4efbiqjnqwN6z//DdOkiFh5oUvh+sD8BY4rP3ZiIlEftjlM2VVjO9ZvBjpKzmjyjHJ+25fR+ugiMzuY8ZT3O4jVEUlwRXA8nB+J7UR8P0uOKuxvGJooTyO/ur2GoIN5gkRpAG3QpnnCtoAIGYJM7Ov+IAmTF4NFHspRzb1IUqwHRyMaa19MM/n9AmiFmOWD2DSK+ixOxgsYaQwCwnDo8r0SF6cHDX9G5GXiGve32CrrmxxNAvAyeNwoXuBzQCEEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VbKFrNnRhEyJ7+VNXq0XFEbkg5YbupuotEaEuMyU1pY=;
 b=U4fRBDPFwI8YZL06NEFDFnIldAXTLvGq4lB5xPuqgJcznO9D83sDHVt/189RSakuLAYBv+z/tP6WZGv0xYQBQPn4YnTZVn5h/v0rxYj8Xoqrwf0qYxie7Erni43Egd3HNdcnpbajS8apLcCM8cOo5W/tYXGUUdWduhgKHNrnF8EoZH7Mp3Yux0dQoxfPmxuIUOmeDjA9FjTIcBJm5STNdsg3rz4tkuR7xMyBCjuXLY3cV9IDkX1LHwylUPrC2UZ2N5+28l3OGpYOVMoDxCo7ZwT2dHQ28MB4MHjpq0molafAAUbh/ueW+SVVpb0IMt5z+OgvBoWG0QAbrXcR1k0z2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB6742.namprd11.prod.outlook.com (2603:10b6:a03:47b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.34; Wed, 4 Jun
 2025 17:08:48 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8769.029; Wed, 4 Jun 2025
 17:08:48 +0000
Date: Wed, 4 Jun 2025 10:10:21 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Danilo Krummrich <dakr@kernel.org>
CC: Simona Vetter <simona.vetter@ffwll.ch>, Christian =?iso-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Philipp Stanner <phasta@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/sched: Discourage usage of separate workqueues
Message-ID: <aEB9/VGHJGnY4+fP@lstrano-desk.jf.intel.com>
References: <20250604081657.124453-2-phasta@kernel.org>
 <7a09c357-2d28-4dd6-b637-4387cc430938@amd.com>
 <aEBhIzccXBPyt_58@phenom.ffwll.local>
 <aEB4DFFE2C7gElRL@lstrano-desk.jf.intel.com>
 <aEB6GOTlC_Z_Rq8b@cassiopeiae>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aEB6GOTlC_Z_Rq8b@cassiopeiae>
X-ClientProxiedBy: SJ0PR05CA0058.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::33) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB6742:EE_
X-MS-Office365-Filtering-Correlation-Id: 49787855-1923-4ee9-6abd-08dda38a78e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Ra1TOoOhbX4G3WJTDMAJFkRdZEFNDQVY9eRB4wS4U8YXDce/4c+9InkvaUFj?=
 =?us-ascii?Q?Nre+Uc1W8i5hPH3ZoUL00oUNcXQS9waDZyDQA2pceEC1790oaygXKW2NQljQ?=
 =?us-ascii?Q?TSwOeWenNEBQr5cNYolO/llOx13XA6llQzb7XO0hBHJPgGN8k+guontx4+uo?=
 =?us-ascii?Q?QKeU4seG2ZGNYb2Ur90XbHlUnPXS1DPtZthP0BDdCcUoVGB1Xzfa3nxOTlSd?=
 =?us-ascii?Q?OiMYqZ+6twj2N+ciPoGQZW2dEPO1CyzsGa6r17l2U77YCaFNZ0oD/Uwk3uKB?=
 =?us-ascii?Q?sddRAuspZYwIYLjM4/i7B4bLB8BbiBwnprzv/fsHVsjbHAuqSLBka2x9ZdsL?=
 =?us-ascii?Q?b276q+nyuzNSalMK3nWmUsjyPGXBIPWt81HxGp3ImL01dNCZwr4pQFhObv8N?=
 =?us-ascii?Q?nIKzTZULj3ZZHbA9+pnOudxE4Tm9Fspmz5SR0m3HcT/9hQyM3MuEX+BHHL/x?=
 =?us-ascii?Q?/qhpUgntPrTPHs3J6/3T6CzOsxeKZI8Il79FEAPPk/NklbCnMNhLmdIE/sMW?=
 =?us-ascii?Q?Ggy39nsw0bWue9jzmNBth0L7dTy3N2rv8SfPTZZDdLNRPgoMlh37JYgJTzt9?=
 =?us-ascii?Q?gH4EmAUMMMd/1ZibxTbAicwYarz5iPw05uJD9A2boNHExI8C/xGFnMhKDHQ9?=
 =?us-ascii?Q?HSCfxReye1SAC67k2z74d+FXOou5f5uWMIvRJWAotoFVtwvbzlyWD9BGYWTr?=
 =?us-ascii?Q?MbbYF1VSbtoI8CFJLWHP1gVMsXaoQ7ZxtJoup8ZCJdSXEF2T/ZUQ3tJ+Vtdb?=
 =?us-ascii?Q?QPkn1T96Am13LBYQ8G4/3tCrGNeQEIhJ26XIIvISI39JYR7T2T7Pi1naQkcx?=
 =?us-ascii?Q?RiAD4jiLOHwNvAMAEZUhBs66aBWxIf5EM5EIo4UeKlQ9Asjv+0DOXfnE/1bm?=
 =?us-ascii?Q?HfKK35/Wvdzv3QtUcsmIRIcWCDHm+J2VMoogjy6zgh2QbGHLJs/Sp4MN/tio?=
 =?us-ascii?Q?7e0fikZZZBJKwCUCGot/2J5xrLisJgUEHwjM212+keuNZI5YnFeCG7PqAu8s?=
 =?us-ascii?Q?xFnE4cgEIsGW63pz5AWPk0S9JacdnjH7PTctwzLg1uqyukPpsO4IrtOyJgtO?=
 =?us-ascii?Q?9gu6STYSsCO/zxvDVY+xQbdbwjUjszjFCi+JmyYPQC3juKG2fyzQDPJVd/nt?=
 =?us-ascii?Q?s1ii/y0VpRyj6LQoPE9FW7uDXDeqrafSX+NTBG5rVD53zp6NnfxuiyUfF8KY?=
 =?us-ascii?Q?srhW67Cs2f5dvAZ5i74wiVpAW1zZy9VtrdPHScANb9XNkUJLKbabLEBJzWa3?=
 =?us-ascii?Q?HZB2BP14QGTSpHd7X1Prj3PExuGUj7luSInVhd2BvncdNDV8Ufxy/sJczdbp?=
 =?us-ascii?Q?QOhYb9vXfTftiWiosQmZNybRjJDL+qq0jQ5sh+5lNGOYDX0U1ZnwRJudCPEV?=
 =?us-ascii?Q?EwcoO2beuNMH6qPpfLsPlD6x2Q0cjODS+ejQQN657wprKZMr5/Toc55yGXuv?=
 =?us-ascii?Q?LYH8TYW0Md8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mfDrGyQdHDbBOiyWrLeGrCr4ZaHwud9ElFJfGTc7ovQkUQKN99vJSiXE/AmY?=
 =?us-ascii?Q?KV/LmD9Px2eXEZO4lmwPOFV8ugMe3yWkwkZsR2t1NFLKbmQvuOfFcTEUVpVz?=
 =?us-ascii?Q?4JQsxOl4hljA2Y7c9jp2pavU69w2pa15KCqIUwhuu3RN4Tz1k6Z4J3QcKAm3?=
 =?us-ascii?Q?vEtqUpD0XsU11zoU8nqxYmxBICst5+0PIJmPhpdRit3LXA1L1t25SmjMTdE1?=
 =?us-ascii?Q?NYPgZrneJv1wM4Bca+b6dKqAVmjXensWOLdfo7OVu2KedL9nusWM9RWuJA9f?=
 =?us-ascii?Q?YkhWeszYbANAtk8vf7KJfhJU6k9Va/9dQPFRYt0rfI5JLYm/slEoMgU2tbP2?=
 =?us-ascii?Q?Rq2PFjj7UyXN+8LqXOG4ATK6mj4olLlmun1e4G9pUyrIAvk3SPhEf3EHcACY?=
 =?us-ascii?Q?h8aNtBLN+LFpwNoNJx8A5WIm9TaTJ4BU108mQ7SUPiTYsm8sRaGc7e/Lqcg4?=
 =?us-ascii?Q?uCbqRX/SEiUi3WD6+c0JyFlOmJSB8C2laeZA3l3jJvBG+qw1F9gX6aScdSHN?=
 =?us-ascii?Q?YgEr9MzENfJUWvc1lNA30nsoQ/blf8n3/0QaYsXEFOXi4/e5om4KKlgZA81O?=
 =?us-ascii?Q?mtDu9ZNDNAVOWDOh9gOKzw+5sja34GngWwwwDJf93axujg8ygkWILOmOsG4m?=
 =?us-ascii?Q?K/GoBaCjNGnq7t0eyMZBGo7I6aWiukpSZ99wpJLNxmjqxEFJ3FQSRTD1SMN+?=
 =?us-ascii?Q?nLL6gUH0VU7St8+IOSZFk3AJWoaj35JyfuRJ1Mv5J4RP/sqJOhjCf45uWNDJ?=
 =?us-ascii?Q?smWuOk/WdhS5eo+BVSKu5DeB/oYo1HFxK9UqEXepE728tAE0uU3WHghwec8p?=
 =?us-ascii?Q?JqKAU7s2tZtboKz83/w1qi0zZsWJZL9dny9oY5Cx6qVCpf2wqKZEh4fQWkfO?=
 =?us-ascii?Q?vXm3hC4sFXxsj06kNYQPU1Yzvshtc941SrVkyDYGV/nJHuL1iW3Loj7tmGij?=
 =?us-ascii?Q?lNs+DvmPSKDft6zjAx3k8v2tBmXayUjuZiPUuKf1sQ303AFfGiO8HHqmtNmH?=
 =?us-ascii?Q?euRKLwRh2hZe9TPeK1TiOcZkckegavzlJcrIhYP+mbRIAyOnjd/tjL1mU3An?=
 =?us-ascii?Q?CJsL0adGPRL8FwJllD0DRbW76XKOKP2jOq8pLaZ1vJrYkK0Gjpm2TC9dVBg7?=
 =?us-ascii?Q?0Xn40qCbsY9/3WAe8JN3loqMaaZirm03fgM/j+aOzw8GeQ/giKAaEY5/4Xto?=
 =?us-ascii?Q?F/FQpGCYibmppj8lNca7IlxRC2ZYrrmxiymON7d5yexdJlVaC0lxoQB3V5f+?=
 =?us-ascii?Q?OpFmFVe38gsDkQIkQmiV7RldnX/dhHqY8l5rlvCCAETwpKcjT855IDUX951Y?=
 =?us-ascii?Q?pTCJ6nwPp3YcX0TtRT7Xi30EX7j26esZfFXcPa9GbA9OBzDN8ctzY+Tuy+u2?=
 =?us-ascii?Q?TFfdlCNLNHf0QlnIj0Yx0JjLTfL49regZCHxDpobqlKUlpXo6vvDldyawfDm?=
 =?us-ascii?Q?R95BSpuIABugg2kEOIHR4ZTzz6YxxUnuZHA+6R7f81nK6zukdZEg0RbEH/lW?=
 =?us-ascii?Q?dLF1NxUQzl+Oe31pgrHtsH+9aLmi+/g00GWtrLr4Td9knSEEUnZN4C3YhDpC?=
 =?us-ascii?Q?yg/dj3p+2axG9KuLtASdGXaoIabvXuwlKR2475U9x/V0Uyxk0uyL1uMIKNYN?=
 =?us-ascii?Q?Zw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 49787855-1923-4ee9-6abd-08dda38a78e8
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2025 17:08:48.7114 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F/12nFpGBLMWOiiS2yAnLHXMopBst59/3ZO0Z1hoxVu4EkF3IlwNOvdgWte3edzNLw8vQroBzmRknMUQKd9JkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6742
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

On Wed, Jun 04, 2025 at 06:53:44PM +0200, Danilo Krummrich wrote:
> On Wed, Jun 04, 2025 at 09:45:00AM -0700, Matthew Brost wrote:
> > On Wed, Jun 04, 2025 at 05:07:15PM +0200, Simona Vetter wrote:
> > > We should definitely document this trick better though, I didn't find any
> > > place where that was documented.
> > 
> > This is a good idea.
> 
> I think - and I also mentioned this a few times in the patch series that added
> the workqueue support - we should also really document the pitfalls of this.
> 
> If the scheduler shares a workqueue with the driver, the driver needs to take
> special care when submitting work that it's not possible to prevent run_job and
> free_job work from running by doing this.
> 
> For instance, if it's a single threaded workqueue and the driver submits work
> that allocates with GFP_KERNEL, this is a deadlock condition.
> 
> More generally, if the driver submits N work that, for instance allocates with
> GFP_KERNEL, it's also a deadlock condition if N == max_active.

Can we prime lockdep on scheduler init? e.g.

fs_reclaim_acquire(GFP_KERNEL);
workqueue_lockdep_acquire();
workqueue_lockdep_release();
fs_reclaim_release(GFP_KERNEL);

In addition to documentation, this would prevent workqueues from being
used that allocate with GFP_KERNEL.

Maybe we could use dma_fence_sigaling annotations instead of
fs_reclaim_acquire, but at one point those gave Xe false lockdep
positives so use fs_reclaim_acquire in similar cases. Maybe that has
been fixed though.

Matt
