Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EEC3A3B019
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 04:39:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AD5310E0C5;
	Wed, 19 Feb 2025 03:39:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BqQvilBZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE11810E0C5;
 Wed, 19 Feb 2025 03:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739936379; x=1771472379;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=fFb8/JCuyCOeZBYexI7lAlTZL4go+ym7KKZP3nBEXes=;
 b=BqQvilBZDllCiFYb7PGDXAUWkr/IddOmMoae4rjqof2uuZs3qtxC46FY
 0UPtJTiNgy+jmfzQcZRnGDmGcfQJnRhNfEA1xiujdfDxdP8QlLkLlisBj
 sYHEaX8x7mJLy6QWw/kFejgecstGtwITg6kO0RWNzBljnSsbQl/6/IkNo
 4DFuWz0bW421cW3s8/xJaXdlE//lY+tGhrm4tGqTDXbnwSIuONODPkSAj
 BZvzPvfnhXmHIpOesG0FCo2aPqWaqdIGweBEbPdIfD5rPDmf7KU2evYDk
 4pN11E+sVBNt3ohP9v7+hHJbm2ltywpIL12vZV43rHmCCcGa+rA0ruHqV g==;
X-CSE-ConnectionGUID: NSXjKPqYQm2QDoSSW+Ue4Q==
X-CSE-MsgGUID: jSFxK/2BTaincBdxyyKQ8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="63134541"
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; d="scan'208";a="63134541"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 19:39:39 -0800
X-CSE-ConnectionGUID: w9vNlk33Q3+RCGUxpgr5ZA==
X-CSE-MsgGUID: jOLd02vFQ4iQOlNDk2wtKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="118723977"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 19:39:38 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 18 Feb 2025 19:39:37 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 18 Feb 2025 19:39:37 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.43) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 18 Feb 2025 19:39:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bNVamuzfgNtHLnNwdC/f67j23MwtPU8eEuImOd5r/DAW8DR9Dv+ZZa0jfKPaKlOIX2GEJwTBU2ekMvR3z9yItQ3HIGYAdYZzMLzn8gsePUz146LACf2u/3TcPPlmj4l81IRFjF+VhqeZL1GLxV4FvYk8Zo0euGMotPVtpbRqD6XZJ0wrgfmDoi0dBQ3NLC91rf78+8loPNlsxgFP81ZEhkyBP1zxhcVqjqoOBq8tXbrUbHJ+0Wq1R2g2AhVmzslDkSc/R2cvflVtu7k6FxMBygghLAA0y+gR92vKvwdsJTebcafnpYQyG2Imj+S6KmWLRknDfIKoMiFG4spTFIMVSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r344HJBJ25s/7aMcHU26ridvk5jvYfisqREFtqgilPw=;
 b=n3aPRtpPK/hisjXNPufzA5ciNs9+2nT7DkaOtr2DkAme6sIEreVhO7JpO8mH66SFILn7xFl1E5cDJerwp1WwliJ19oi3xZp9GpK0WiR12bD10N1UcL5d/3TOsDYNhHsSr2G31CeChxgA7WKKPXQMbVHSplMAZqzzlpZUvBYdRqisxlHy9Cqnt08RoufD8UWynz+KdFzNkE0fuN3f+3Lf5JzBc+7u/g7qbReQxNqo/ec1eHyMv+NIms1sLz+rVM+na+Dqs+PdCdjl9Nepd4tRbh1S73wChvyqDhNLA2s3us6++fQon06/WZVG2CM64QM01G6xAtxGyLFTMGWoEZmszg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA1PR11MB6893.namprd11.prod.outlook.com (2603:10b6:806:2b4::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.20; Wed, 19 Feb
 2025 03:39:35 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.8445.017; Wed, 19 Feb 2025
 03:39:35 +0000
Date: Tue, 18 Feb 2025 19:40:37 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
CC: <dri-devel@lists.freedesktop.org>, Tomasz Rusinowicz
 <tomasz.rusinowicz@intel.com>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Matthew Auld <matthew.auld@intel.com>, "Nirmoy
 Das" <nirmoy.das@intel.com>, Jani Nikula <jani.nikula@intel.com>,
 <intel-xe@lists.freedesktop.org>, <stable@vger.kernel.org>
Subject: Re: [PATCH] drm/xe: Fix exporting xe buffers multiple times
Message-ID: <Z7VStWVBzGAY2yAf@lstrano-desk.jf.intel.com>
References: <20250218100353.2137964-1-jacek.lawrynowicz@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250218100353.2137964-1-jacek.lawrynowicz@linux.intel.com>
X-ClientProxiedBy: MW4PR03CA0321.namprd03.prod.outlook.com
 (2603:10b6:303:dd::26) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA1PR11MB6893:EE_
X-MS-Office365-Filtering-Correlation-Id: b079756a-7162-441c-87c8-08dd5097078f
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?krTWkv00F0+6mNwt3iYnzlg3EOittYoWSAdxSGH0m9bd/uMjPhFCzAf33J?=
 =?iso-8859-1?Q?Kf8elFE2xLCv0V2iTPHxBdWlXCjK/LIZ8zDTSdCY7hLd6ceJGgopIzAs+w?=
 =?iso-8859-1?Q?Zd/D+pYNXpMdETIldPVKHQQPLyWM+Pnxn2lU+94NqClWHHMRJhMpe1yc4d?=
 =?iso-8859-1?Q?r+qKS0+7Bk+5t5ryss1T/Ss3bScW47SE/Oeo7cfB1JgX09xNYrWICoCKEH?=
 =?iso-8859-1?Q?5p7e5Z8IR/KgaW8JNdOJTRg25H+eLFmocIGvsJXIvWAdl8ilyj6ePIvRwn?=
 =?iso-8859-1?Q?w7tQG+x+ZI6SvO3EdSB79uUB965jmaSGijZ1F4qBI7w7B8/cza92iaOiF3?=
 =?iso-8859-1?Q?+RBI5aOcVq3e9wxwzTkqICnRdgrqmhQ1SMD/NhDyfxPxXZn8YOPeB+N6Hn?=
 =?iso-8859-1?Q?jzrOleAyLgfVIHDOki+Dexh1AwWSgltfYCLi1X3y2DDFyuiH7B9H5PYl+U?=
 =?iso-8859-1?Q?gNzFyex4H4PVTXg5PPkTHcc+8zcEF5Wv+mlAY2Epg7LdKRv5pahdmhMDi7?=
 =?iso-8859-1?Q?CFWwBniv4jOLORk89GRjhijwzM7EiEV4GZLyMEVXcbJ1+SX3dnNltJOqVr?=
 =?iso-8859-1?Q?skJVElE4HfacahYu4kwP1386Yrg9PQhPegpcj8N1oqc2Wwd3hkPZFArRa7?=
 =?iso-8859-1?Q?iQrF9QCNKSjAq23uv2YuxvX8MwXkpNzcBnJQ485PvtyS8sJw80KKLxWfvo?=
 =?iso-8859-1?Q?d5DFIe8NsA9cw5X6yjqC94aBBYdH0MoImsINE09ImEcXfZE5BX7acz5oTG?=
 =?iso-8859-1?Q?0xomtFJh9NUGHpf3dtCpFSB7J12t8EvI+B8kVqzUJOwPAvYfl11+DRQ32S?=
 =?iso-8859-1?Q?uAVdNjo3v3x3ZgY7QBn04O2wmBZRIKkIsDiyknaOHuRflzr8RQi87GGa/Q?=
 =?iso-8859-1?Q?w9BhoPSbWpmGIjfzjAzjso/8rQR/fdL7iAe1QSB30EV8jphzLGsojkQ/zH?=
 =?iso-8859-1?Q?E+RrxJPRWre6BroF8FXhnFfhajEA5htzRalqov6nRJf0wdHcJLPUNGFS3m?=
 =?iso-8859-1?Q?B/jdsJ+1sM9Uzkva8a9B7y7CZaCmOYRXeLAnPHSUTu6STykeDQi3s69Y1S?=
 =?iso-8859-1?Q?SwSYjansQUgFie6P9FJ5jNAkMCi55z7wBY5/LL1RWYMqyclvrusSQ3xMQb?=
 =?iso-8859-1?Q?Li7u8fPtxtzRpAMTxAJ6ELyXLTk1hrje+StBVrOfQdmKHMyF0cYzQEm1Xj?=
 =?iso-8859-1?Q?CDXf61Husi39F4Q1/nZuaCQyEOeMoVMfW2DUY924mZY3DYP8gFbPV86SQ3?=
 =?iso-8859-1?Q?FK3fR7jqxTq2i6qEjkiOwNz/OQXdMw9upQ2hgY6EJKZm2t1jmJ46P0KK1n?=
 =?iso-8859-1?Q?PO71uIU/nzz1TIpEC4jb9t79jkLCj4Unk/5LIH/jos6bcRmExJnejUQ6Dm?=
 =?iso-8859-1?Q?RvYiqXBxbF1TojcZAj3m/Uq/xVfHGVzCVAhG/i4vKbWQCWHH5rUpOhHVSW?=
 =?iso-8859-1?Q?qeFmDWg9gkJU7dq7?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?gQZtl9+5MP/b56T6r9nKKSJiN/iLg01My/1xt7KxsFgPJv/YC6/NWRwO+Y?=
 =?iso-8859-1?Q?VC0o5ZI5y/Vmmqqm2VOKGh3aZiIT6/z8GCbnKNMTbdp+FXlfgqfu9TbgiA?=
 =?iso-8859-1?Q?0Lc+Thxf7WlsNQrpjo9qeDZFBe6v2n86FsTVhYOpxBRpa7TZaklwk8t1td?=
 =?iso-8859-1?Q?Jqs3B/JQeoKWI9BFvCgvl9I3RPpQyFOOUhccppp442AC182Tc2qT9Bd23B?=
 =?iso-8859-1?Q?cF4r7PgmnU/dejXk9DLyS/um9dg/9ZKB0ExgAUQn57Y7VxzCBCWs59t7s6?=
 =?iso-8859-1?Q?zJC9Q53aeZ39Sh9goVpxEH+tl4f32jETs4OMTUzvMQkfpZ0ggeGkKutJqL?=
 =?iso-8859-1?Q?V/+66rI2umwPNhd0i+1OF5CD4Ecs+khzduA/SBmJ2+6BI1LV7HdjpvQGOZ?=
 =?iso-8859-1?Q?ynT5tzdmv+hmzZYCCbofWjGSNJJijWR+waMZdDlGU0dfvok/m0Qt2Zvg7L?=
 =?iso-8859-1?Q?hTW3cGrQb1RXfnsG/A7WNKeh1RdMQqrylQITq2IfwRfrgBm7yBWcmIC/jG?=
 =?iso-8859-1?Q?gxGnW+YVoGV0cAUuOG0M/O9hkiGPqJc6YJeOLM1aD1UxK+4vVQI44F0jxg?=
 =?iso-8859-1?Q?vVWBYhq+dRr2KYr0yUNB0BKCPSuT9Triy4lz2GZ2wFcQijDpzkoeLum07Q?=
 =?iso-8859-1?Q?7FGo9h8a/kqaf96bXL9pdev1PZQtJ5Fl2khGZCOCLFjqp4rsc1/3JMmPiW?=
 =?iso-8859-1?Q?mfdDbIq4YloUwCix71RFCeW5lhRZokzvRZBE2Bu2Xgp7hUY6pr/CADABbx?=
 =?iso-8859-1?Q?QeQBq2RHFcoTm6CdM7si2Bh+BHLZHgQHtzCbsg4dIw7yeRsOGi9jNIva/h?=
 =?iso-8859-1?Q?FlJ76Jg3he0Dlzn3h0E1+V31C3B7CaDNL3lPEWRNMkP/u0IAEugrTkcil/?=
 =?iso-8859-1?Q?g9+Az/rM5kBG3trNuSAesamovI747TUeEP5Ti56auxn1q0BAy9iZX6kKcT?=
 =?iso-8859-1?Q?6Plr0PJaEP4S02FEoQL3Y6O+3hEm9wXcGeKo75Gv0N45V28BQTzEBpqy76?=
 =?iso-8859-1?Q?q+w22HduHahO+7m35Vk1JxjI/HAzB5D8FjkoU5BHXcYnAhQwSQpERaWB8j?=
 =?iso-8859-1?Q?DcrHSisZAxuPd4+WAFX9yg/12elfWdEbByPxuYwbw/ClRV1ykk1AL0uEMA?=
 =?iso-8859-1?Q?z9V+hFYfZqar8Rd4XwGejMAQbT6wtvPz7kBDoiXiUxJh+bHYcgVrJklSKG?=
 =?iso-8859-1?Q?Fqk2k7SdCH3JHzOwWLo3M6iKIN2T01hXfrGPxGcz4XSmm/lOxGAxtQCdCE?=
 =?iso-8859-1?Q?/c1QANbtlsde5/gQIcGVwjIGaop/qOEzPV6iw1A8lidnnb0/vMlUag3P1l?=
 =?iso-8859-1?Q?Qy9dVpU3ssXLHEYDBIDhBb+Xx1IeUXy0PjCQ0FncbrDfTZn1m2e2+XY2pd?=
 =?iso-8859-1?Q?dJFfrfMfYad/tn4Qg3MxC9kNhxPPlkb09Ik/Dc4w4rU+uRZM6n9R7+oiHP?=
 =?iso-8859-1?Q?GybIIkOosLRZzJVnE/8RvwEEo6/oCIm2dJW/K6eyZWfdDaCJC6uliZ/AMZ?=
 =?iso-8859-1?Q?+riJOpqelqxgY75YPWktIIdxccXLevRFkSqvkuDGKh7lqoVnOnAEYV0ooF?=
 =?iso-8859-1?Q?lm3n/nRUNmeMoHmlpjBdOkMZLNFt5mm8O55B8W51wngOqq3EviW1TZHOIL?=
 =?iso-8859-1?Q?3parNri3kjWE+DRI5qqUIOdvHNTcPnTpA2cgzBb+m8N6apgXkAGEgnpg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b079756a-7162-441c-87c8-08dd5097078f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2025 03:39:35.5197 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5iqBcXleneQO53Sh1paosPe9s42d+wQyWT6AFMI3tU9cUvMrRpn8xl+qRAMSO/XLR19QqXR68UdXAmV9r2PRdg==
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

On Tue, Feb 18, 2025 at 11:03:53AM +0100, Jacek Lawrynowicz wrote:
> From: Tomasz Rusinowicz <tomasz.rusinowicz@intel.com>
> 
> The `struct ttm_resource->placement` contains TTM_PL_FLAG_* flags, but
> it was incorrectly tested for XE_PL_* flags.
> This caused xe_dma_buf_pin() to always fail when invoked for
> the second time. Fix this by checking the `mem_type` field instead.
> 
> Fixes: 7764222d54b7 ("drm/xe: Disallow pinning dma-bufs in VRAM")
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Nirmoy Das <nirmoy.das@intel.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: intel-xe@lists.freedesktop.org
> Cc: <stable@vger.kernel.org> # v6.8+
> Signed-off-by: Tomasz Rusinowicz <tomasz.rusinowicz@intel.com>
> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/xe_bo.h      | 2 --
>  drivers/gpu/drm/xe/xe_dma_buf.c | 2 +-
>  2 files changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index d9386ab031404..43bf6f140d40d 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -341,7 +341,6 @@ static inline unsigned int xe_sg_segment_size(struct device *dev)
>  	return round_down(max / 2, PAGE_SIZE);
>  }
>  
> -#if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
>  /**
>   * xe_bo_is_mem_type - Whether the bo currently resides in the given
>   * TTM memory type
> @@ -356,4 +355,3 @@ static inline bool xe_bo_is_mem_type(struct xe_bo *bo, u32 mem_type)
>  	return bo->ttm.resource->mem_type == mem_type;
>  }
>  #endif
> -#endif
> diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_dma_buf.c
> index c5b95470fa324..f67803e15a0e6 100644
> --- a/drivers/gpu/drm/xe/xe_dma_buf.c
> +++ b/drivers/gpu/drm/xe/xe_dma_buf.c
> @@ -58,7 +58,7 @@ static int xe_dma_buf_pin(struct dma_buf_attachment *attach)
>  	 * 1) Avoid pinning in a placement not accessible to some importers.
>  	 * 2) Pinning in VRAM requires PIN accounting which is a to-do.
>  	 */
> -	if (xe_bo_is_pinned(bo) && bo->ttm.resource->placement != XE_PL_TT) {
> +	if (xe_bo_is_pinned(bo) && !xe_bo_is_mem_type(bo, XE_PL_TT)) {

This fix looks correct. With that:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

But question for Thomas. I'm thinking as a follow up we rename this
variable in TTM to something like placement_flags to avoid confusion
like this. What do you think?

Matt 

>  		drm_dbg(&xe->drm, "Can't migrate pinned bo for dma-buf pin.\n");
>  		return -EINVAL;
>  	}
> -- 
> 2.45.1
> 
