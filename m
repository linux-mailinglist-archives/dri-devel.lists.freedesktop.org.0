Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F3DC307F0
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 11:26:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 551D610E5B5;
	Tue,  4 Nov 2025 10:26:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="meDcjffY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06A7B10E5B4;
 Tue,  4 Nov 2025 10:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762251965; x=1793787965;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=5IjICDBp7qZ9WMvg7CHPMPD8S8T2O3rKeFAE1avwDQ8=;
 b=meDcjffYMYzjiV3BKmLe19O2QDAjWP/1k1ZSL4aOyO3ibOcNA4U/jKSy
 J1qYHymkhKXXhM3WZGUcltuVjXPIj8DQiXFKWxh/TkFigIES8UfkHjL7o
 pcGhWTKZWOtt1eDoZTSTNag8SduhgHJ8tW6+ggEvayCbR0E6PoGutg5o4
 wL07faTe0lnboUyv7MGxYXiurAovQHDjfx4Pmav4HbbyqwVaeqDPREVfB
 /bsDEh05k+/WuxEjN6QVbXWH5yS8NM3/MuPLMJBU+qCvT892szX2tFCsm
 z6bhW5wa5nMDo5g186emD5y8J9qwbcEUhpTVMdSUxccWd8xRvzSZ1zkcQ g==;
X-CSE-ConnectionGUID: O7hLaBSnTdeh+G7aSRJLag==
X-CSE-MsgGUID: FiBe76GYTyywnBsLo4m+Mg==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="89804671"
X-IronPort-AV: E=Sophos;i="6.19,278,1754982000"; d="scan'208";a="89804671"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 02:26:04 -0800
X-CSE-ConnectionGUID: KIdd4J/lRUySt1b9Tph9QQ==
X-CSE-MsgGUID: 0BcVPo9VRHCS2MkoFOnxPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,278,1754982000"; d="scan'208";a="192210239"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 02:26:04 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 4 Nov 2025 02:26:04 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 4 Nov 2025 02:26:04 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.47)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 4 Nov 2025 02:26:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p7EpwJ6qxE2pyIIaIFzh83hjLpgcCr8Kgs7lKMHVEXKjrwXF2kAHv1YZ8fYtnCCKFgjwAqkUDO1HqxBRGr+UqKaBEtxt6OtPAo8W+MhoFHtK1076S8jGxT+cYoZzxt52SOAMk8xG8s0tWj0DiauXAlcjA6VZigif8//JV84UUhZRLBxpRS+Nsp7ZBUU8NsOLyZWVnaBh3pi0Tu4oGqFwmf+OdGamtjZIEp8tpHXYQnsFe8EZAIeugP64NgSSZvXRg2SmPys92FSWA8ftR+4yXs3Vr2ruLuwoSP3Xh8x+gC0vcppYU+UIqvNTUeHM5yXlKnfYeWwzEnA86YkYv0dJXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TgwQMQJvr/b8s2Ub15RxHzF0C08SM7jRg5IEt1PA7Io=;
 b=poyLHA5liOthPVEA2UIobzoAmAC/OfIxK0KPd1VsosSvkqm49x0SbIJw8jbN/Wzkeb6AgiHGq0uq6dIxCNWogNRGIaISc9ftrTmEpJrC0AEa61wMhEY1cVZ93RDcclAoDgINmQfsyug+3UFZkiP69yxSKRx/z+UcwUAiMaEWMHUqsqf08zOj7z+x7SgnvEOHSWoIznKUUJ2n1JvJEGAxADxoxn7dVZWzQAfMu8x04xqXa/DOEsnhEDMVKBI4bCeLuDGO2uHJkXnCRiBSdoTLvJRXG2ElL9GG6uTnz+B0LGqT/kgAU06CytzvduchTlvYYRtDmJRe32GT7BS+9VkvSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 PH8PR11MB7096.namprd11.prod.outlook.com (2603:10b6:510:214::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Tue, 4 Nov
 2025 10:26:01 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9275.011; Tue, 4 Nov 2025
 10:26:01 +0000
Date: Tue, 4 Nov 2025 11:25:57 +0100
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: Alex Williamson <alex@shazbot.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, Shameer Kolothum <skolothumtho@nvidia.com>,
 <intel-xe@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <kvm@vger.kernel.org>, Matthew Brost <matthew.brost@intel.com>,
 <dri-devel@lists.freedesktop.org>, Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Lukasz Laguna <lukasz.laguna@intel.com>, Christoph Hellwig
 <hch@infradead.org>
Subject: Re: [PATCH v3 05/28] drm/xe/pf: Add data structures and handlers for
 migration rings
Message-ID: <gvjvohwpxfrkamtqjawy3xfonodil4rckwgr44ti5uixofengu@zdeklwxdqegb>
References: <20251030203135.337696-1-michal.winiarski@intel.com>
 <20251030203135.337696-6-michal.winiarski@intel.com>
 <b6ee8ac8-f34a-476e-a62a-4666e590366c@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b6ee8ac8-f34a-476e-a62a-4666e590366c@intel.com>
X-ClientProxiedBy: WA2P291CA0040.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::24) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|PH8PR11MB7096:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c7d0480-dc1e-40c3-cdcc-08de1b8c8cef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|27256017; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YWZCVEpDbWtxNHoxWk5adEorZzQrSDZMODhlOHpKRUpKQjNsWXkxdXpZMmVX?=
 =?utf-8?B?c0ZJSUxrbEc3cjdlUitUMXRlNGFmbTkyQ3kyTXBOQTdtVjB4dFd1RmtGY3lJ?=
 =?utf-8?B?TGJuaEVJVmloaTRia2wwRWlHSlZMN2s5N2FOdHJzbXRBQXdtWWpTditseEJ0?=
 =?utf-8?B?dHJtNU9ZakxyMXA1dmxXNnR1eE5VVGJyNXEvc1JRMldhWTdEdzJPZHBHN2tU?=
 =?utf-8?B?T2JyK0haaDdZN2gzb29jaGpXRHNMVnE3K0wzazFIYTExaDZhOTI4akZET0Vq?=
 =?utf-8?B?UXlKbEdRUmN3NnljWlpFN1l4Y00xV1pmaWhsTXRrZHJyVXlIclplUjFWS1Bo?=
 =?utf-8?B?QmRJeTNPREQybHpEbzNyZ1ZZd2QrV3lkK3MweE5NOGd6TVRMNFV0K0M1WWRq?=
 =?utf-8?B?R3ZLK3llNlR4VDgrbHY3a0NzblBHcndlYmtjeG1rT1U5UnZ5VVFtMHc4TWRH?=
 =?utf-8?B?OHhuZGhwNi9DaGtLNmtzazZ2WDgzV241WGdnZlhHSXdCZHJEUndDb2JPNGJz?=
 =?utf-8?B?Y3pXTnQvVk1qRWpEaFN0WnpXZDQ3WkZMUEtTNEwzbWgxeWJIcGxBWDlIYU53?=
 =?utf-8?B?UEc5dUpCM0diQ3h0Q2NXaDgxRUNpVXBpUXBlTHNNMTVzMmJMYW5ISm82SUdL?=
 =?utf-8?B?Ny9wNzdXMmZqeGhDbjJRME1CWnR3dk80bS9TbmFmVjVjSFZUeUhtQ0dBRklm?=
 =?utf-8?B?M1lreFd1L0lCNjlGU0h5Wk5qZmRla2JTaVh1NHZqQVl3am80a1BsZkg4UDVy?=
 =?utf-8?B?a056MllOQ2pINUw3RXB2Y2oxY2dmYWRyZ0Z4N3o1QU1VNzdleDJaVk9qLzhW?=
 =?utf-8?B?cnZKcVJLL2pkOHBsbEdhdXZPTStjdHJqMUVZbnUyOEVrNit5ekt6aVhTVzQ4?=
 =?utf-8?B?RU9OMGVKRUFUekFLNjd3U1h6TGk3MUxRQkZ1QmR6RFZnekRNR05YWUYvbDdH?=
 =?utf-8?B?VWQwT1pYa3ZPUnlvTUt1QnJHaDlLT2xKMEorWTJYYjJsa2oxQjhKaXY2eG9K?=
 =?utf-8?B?b3pDb3FoZ2RSbkduUk9iblhoOTRGS3F4VFFHbGIzRm8yYWpxQnh3WENib283?=
 =?utf-8?B?QmdwS1NuSDJjaVhSRS9VbEIyZjVtWHY3UTBSV1BqQlhKYVF1MUNPSkwzamlO?=
 =?utf-8?B?dkFETzhodUNMR3h5Skwya2NCL0hiSjZTVktEUDc5MlgxUTNzbWwyZ200M1FU?=
 =?utf-8?B?SUszOWR6bWdwWWNxeVU3d3J3eFJkeDJ4VjNzNk5VSjFiRkNzbW8zWXdYMVhO?=
 =?utf-8?B?RXV1WWxlQ2NNMUh2a2diZzlidnlmcmJCMlB1RzlPbzRGT1RkWk03bksyenFR?=
 =?utf-8?B?dklsckJTQ2dnQXZDTEcyUnhTNTBIeXhxbDRjOUlDVGNnT3JIQ2o4aWNudGtM?=
 =?utf-8?B?UkF6SEZtSGQxcW4xbzUrY2EyMGcyUHYxb3BHYzY5ejFwcFgwNHMwNUxuekI0?=
 =?utf-8?B?ZGFTdTFiSUZDN1pGK0xGVlZXU2lKRE45T2lBU0hhczY2dUlxVm1YTzFnTndi?=
 =?utf-8?B?Z1VHMFpkcmZJb2JjcENmREJCU3dLcG5FMlhIME4vVm40a3pvVVdDdjZ5YjM4?=
 =?utf-8?B?MlJtKzJacGJlRmpYbVBsS0FLU1dZcXRMSWExamhBRnp6RUsweHhiSVNEMFJm?=
 =?utf-8?B?dG1TU3ZUNGRqaVR5bXltblRuVmpQRVRjaURCdFdmZis0Q0QwZGduU05kNXZ1?=
 =?utf-8?B?elRIZ1YyT0lBaXBPdFpYc0hSZUJDVnNSRzFDOFh0bUZMRVZUQzZqU05RNGVX?=
 =?utf-8?B?WmNLR0QzN0dQNDYvTFJ3YTJSNG9uTkZqcjhtY1ZjZlhQNXFMYVFrczV1NWto?=
 =?utf-8?B?a285amlWNVBvcHRlQU5HMUNpcWpJQk1McnBXaVoxaG1WVmRVblhlckpIQnB3?=
 =?utf-8?B?S0x3andLVTlaeE5IQzNjQ3g4VFliQVcrVktLWTAydG1HajZBOEJ6U1A0SkIy?=
 =?utf-8?B?aytsNTc3UW04WElqWVZqaGJ4bnF3WnN0MytFK2VQRXpGUEJGakRMRW9BSXF0?=
 =?utf-8?B?NVJlZmxFSHBlejVxei9XT2gwSWVEQkI5ZzlnV1VtamRMQ3pUWUMwTkRPbytG?=
 =?utf-8?Q?gFiOkD?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(27256017); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U3hJcjNncUtEazNRclJhSnhrL2swbnNTNW56bTJzbGtNUXc5Rm1rTkdBZngv?=
 =?utf-8?B?SXJMd1M1WlhKWUNQdURNdlNQMUJBNEIzV0ROQk9XY1l6aElGbzlDbFMvUWVT?=
 =?utf-8?B?c2J4SkxXaUd4TmN2MnJ2NUVrM0tPaitLckhZZk91SkxhZ0l4VkY2T2xHb0Zu?=
 =?utf-8?B?anhZZjFCVkNKOVd5b0tteWcvOWJ6TzJnNDk4akY0WngzcHNpSlBGNEZuVURJ?=
 =?utf-8?B?d3h2OWVDbThVSEphb2MxVVVBMHcvQnpUNmFoSDFyUGkreXBqTlZwdUZCWjJp?=
 =?utf-8?B?RnNoekdmcDR6VEt0eWhCUVNxbW0xazN3WE1HcGZMWlRCWUhacXJlMmpZWkxp?=
 =?utf-8?B?cWp3UVZ5UmNaRHR0cjFSL3dzcjBFSk9mU2NhQUM4ZFphVkQvTkpUVFN6RENY?=
 =?utf-8?B?R1QzbXAzcTBQQlNjMmJQRFNsRXh2ak1oOHZiUk1hTFVyMTNidkdwNVVNcTdC?=
 =?utf-8?B?WFpNVWxJeHhsVi9MVHpXTUFSZ05DT0xtb2NSWEk1Q2ZqWE52OHNLaXlzOHBP?=
 =?utf-8?B?VkZxaU55YkI3SldKdnVlTDl2NUVBYUdvOXZxMmgxcWFvdHk2WHlDV3hMM0pJ?=
 =?utf-8?B?SlBHOFpnaDkvQ1A5UktaZ3plOVNYaSt5am11bkFqL1FsOFlHc2NkbGQveGQ5?=
 =?utf-8?B?NGp2ME9FRzdCWXJabEY4N1lqSmVINjlPR21pdEtZTktOR2h1TDU0U1dSU1Fo?=
 =?utf-8?B?RStEaGFIWG82UWNLYWF5UkZ1TGJTcGRrUXNQSFV2M1VZeFl6Nnc4aEZNeFNM?=
 =?utf-8?B?WklzdkhDZmtCNnkvczlZK0x5VjJIc3lqS3hnU0F3L2dndkQxem5CVWgwYzJz?=
 =?utf-8?B?aWtsaDR3ZzBoUld0NEZCamZFVXRkMG12TkcwQS9aRnJsLzBwR0Y2bndYY1M3?=
 =?utf-8?B?OWMxRWsxOVFCZ3NEa21NbWJ5VzFFNTJLbGp0WmNrOVVHU052TEh6KzcrRjU1?=
 =?utf-8?B?ZWI5QkJFRWxzcFBJZHc0OHd1dVBWN28zVWluL3Q5eGpKR2dkcGZzcmhrS3Ez?=
 =?utf-8?B?VDdFeTgyM0tucTMxVFBlclMxUXZEYWQyelFOMDJlU3BvK0phN1pwcGtxd3Qw?=
 =?utf-8?B?YzJqYnA3MDBpYklLdnlLVitrMTV0dlBhOFREOXhMRXhVZnlHVHR4YTFhMmxM?=
 =?utf-8?B?ak54ZjhkeDZ6R2Jla1VsTDVZdFhBMjBXbllObmJQNm1wa0VMU1JVUWtzUUJY?=
 =?utf-8?B?dlZ0dUtxdkFBRHpjT0ZORmpiZ1pudzQveDFhLytHYmszMTFzT0tyRTRqOFRa?=
 =?utf-8?B?cTZVZXRxbE9wSnVXYmJLS0VOK0JmS3ZYWTZxTWQxNUlqemFkbzR1emV6K2Fs?=
 =?utf-8?B?cG14cW1KU1UvQ2EzbDZhdWs0QzZLWjdraXF6aTdkQlhYYmloR3NkUUp5SkdX?=
 =?utf-8?B?QzVOUXNUODUzV2NwNlN1SEFIVTZpbytGQ3doN28wOEhKeGJxT3hkSjUybjdM?=
 =?utf-8?B?dXBDUEsxUEphRDdkaWtOK2tPZSs1VDdsNkZyL0tmTVI1eTVBLzBkL08wcmx0?=
 =?utf-8?B?dFlYdDJOTGZhTjBYTlA3Uk9zNGpFSUtoSjNZUWZJeWhsc1ljUXYwZkt0cVls?=
 =?utf-8?B?TWZuRll3ZitmTTZMNGd5dUQwT2orcW5GSUw5NEwveEh4ZXc4ck9IVUNodUdM?=
 =?utf-8?B?LzcxTHJXRTM5SlY1R2lCTXlmeWdzN2RFRXBNb0hEQ1FKZlpaNU5NbzNWb1l2?=
 =?utf-8?B?KzBLb2YvSTlSUnVmMmhRdzgyTXhXZDVJNk5iNFBBQjd2RTBleWZMUzF4Qllr?=
 =?utf-8?B?Nkx5L2J1UWxGQXYzVVVja24zTG9tdGgwVFBHZjhrZTlFWi9jS0xGYkRNamtB?=
 =?utf-8?B?YVIvVytOMTBPUzhibEdkTGozWGNuUS9GVDlNNWs1WnF5ejFhNExxVHJtOWhp?=
 =?utf-8?B?K0ZHY3pmSTVsSUVWQ1pQRmhTR1plRGFEMGZ6SGNMZStId3ZWZkdiUjBSUWtI?=
 =?utf-8?B?VXBBNUJXU1U0L0RZNnQvcTBpUjEvNXVCL0NHRVZDMnZ4M1RlTEhINDdRcWF1?=
 =?utf-8?B?RTJHSDF3aWd0bUJ3ZmpoUVprTzVHSWdLZXU1aDhMdXVxcFF1SmdEbkpnVFpW?=
 =?utf-8?B?Sk1OY0RoR2NvSTBEVExSQmxPS09MWVhWNG9tZTJiR3lXZ3pDdTlpSVYrZUhE?=
 =?utf-8?B?bUZhVzVHdEdrREZqRVpZRDU4b2xaWU1OK3hiaThlYmFTTk5oeHRrakRZY3F4?=
 =?utf-8?B?ZFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c7d0480-dc1e-40c3-cdcc-08de1b8c8cef
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 10:26:01.1191 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dlOwZU7W4LjFVefjGeqcQge0C3L3pGHcQujvnOA/YcXY/ZRUFd/DQRSmIXkRYr4L1q9/a8/568KZwNECUuT+Sy3NjaOrPzAzITwPhOkchVg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7096
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

On Fri, Oct 31, 2025 at 05:17:26PM +0100, Michal Wajdeczko wrote:
> 
> 
> On 10/30/2025 9:31 PM, Michał Winiarski wrote:
> > Migration data is queued in a per-GT ptr_ring to decouple the worker
> > responsible for handling the data transfer from the .read() and .write()
> > syscalls.
> > Add the data structures and handlers that will be used in future
> > commits.
> > 
> > Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c   | 271 +++++++++++++++++-
> >  drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h   |   6 +-
> >  .../gpu/drm/xe/xe_gt_sriov_pf_control_types.h |  12 +
> >  drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c | 183 ++++++++++++
> >  drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h |  14 +
> >  .../drm/xe/xe_gt_sriov_pf_migration_types.h   |  11 +
> >  drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h     |   3 +
> >  drivers/gpu/drm/xe/xe_sriov_pf_migration.c    | 142 +++++++++
> >  drivers/gpu/drm/xe/xe_sriov_pf_migration.h    |   7 +
> >  .../gpu/drm/xe/xe_sriov_pf_migration_types.h  |  58 ++++
> >  drivers/gpu/drm/xe/xe_sriov_pf_types.h        |   3 +
> >  11 files changed, 695 insertions(+), 15 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> > index a571e1c02a3b4..ad9dcd3f56453 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> > @@ -19,6 +19,7 @@
> >  #include "xe_guc_ct.h"
> >  #include "xe_sriov.h"
> >  #include "xe_sriov_pf_control.h"
> > +#include "xe_sriov_pf_migration.h"
> >  #include "xe_sriov_pf_service.h"
> >  #include "xe_tile.h"
> >  
> > @@ -185,9 +186,15 @@ static const char *control_bit_to_string(enum xe_gt_sriov_control_bits bit)
> >  	CASE2STR(PAUSE_FAILED);
> >  	CASE2STR(PAUSED);
> >  	CASE2STR(SAVE_WIP);
> > +	CASE2STR(SAVE_PROCESS_DATA);
> > +	CASE2STR(SAVE_WAIT_DATA);
> > +	CASE2STR(SAVE_DATA_DONE);
> >  	CASE2STR(SAVE_FAILED);
> >  	CASE2STR(SAVED);
> >  	CASE2STR(RESTORE_WIP);
> > +	CASE2STR(RESTORE_PROCESS_DATA);
> > +	CASE2STR(RESTORE_WAIT_DATA);
> > +	CASE2STR(RESTORE_DATA_DONE);
> >  	CASE2STR(RESTORE_FAILED);
> >  	CASE2STR(RESTORED);
> >  	CASE2STR(RESUME_WIP);
> > @@ -804,9 +811,50 @@ int xe_gt_sriov_pf_control_resume_vf(struct xe_gt *gt, unsigned int vfid)
> >  	return -ECANCELED;
> >  }
> >  
> > +/**
> > + * DOC: The VF SAVE state machine
> > + *
> > + * SAVE extends the PAUSED state.
> > + *
> > + * The VF SAVE state machine looks like::
> > + *
> > + *  ....PAUSED....................................................
> > + *  :                                                            :
> > + *  :     (O)<---------o                                         :
> > + *  :      |            \                                        :
> > + *  :    save          (SAVED)    (SAVE_FAILED)                  :
> > + *  :      |               ^           ^                         :
> > + *  :      |               |           |                         :
> > + *  :  ....V...............o...........o......SAVE_WIP.........  :
> > + *  :  :   |               |           |                      :  :
> > + *  :  :   |             empty         |                      :  :
> > + *  :  :   |               |           |                      :  :
> > + *  :  :   |               |           |                      :  :
> > + *  :  :   |           DATA_DONE       |                      :  :
> > + *  :  :   |               ^           |                      :  :
> > + *  :  :   |               |        error                     :  :
> > + *  :  :   |            no_data       /                       :  :
> > + *  :  :   |              /          /                        :  :
> > + *  :  :   |             /          /                         :  :
> > + *  :  :   |            /          /                          :  :
> > + *  :  :   o---------->PROCESS_DATA<----consume               :  :
> > + *  :  :                \                      \              :  :
> > + *  :  :                 \                      \             :  :
> > + *  :  :                  \                      \            :  :
> > + *  :  :                   ring_full----->WAIT_DATA           :  :
> > + *  :  :                                                      :  :
> > + *  :  :......................................................:  :
> > + *  :............................................................:
> > + *
> > + * For the full state machine view, see `The VF state machine`_.
> > + */
> 
> nit: since above doc is not strictly for the function below,
> add separation line here

Ok.

> 
> 
> >  static void pf_exit_vf_save_wip(struct xe_gt *gt, unsigned int vfid)
> >  {
> > -	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WIP);
> > +	if (pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WIP)) {
> > +		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_PROCESS_DATA);
> > +		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WAIT_DATA);
> > +		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_DATA_DONE);
> > +	}
> >  }
> >  
> >  static void pf_enter_vf_saved(struct xe_gt *gt, unsigned int vfid)
> > @@ -821,19 +869,54 @@ static void pf_enter_vf_saved(struct xe_gt *gt, unsigned int vfid)
> >  	pf_exit_vf_wip(gt, vfid);
> >  }
> >  
> > +static void pf_enter_vf_save_failed(struct xe_gt *gt, unsigned int vfid)
> > +{
> > +	pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_FAILED);
> 
> nit: is it ok to do not test if we are already in the FAILED state ?

I'll add:
	if (!pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_FAILED))
		pf_enter_vf_state_machine_bug(gt, vfid);

To both save and restore path.

> 
> > +	pf_exit_vf_wip(gt, vfid);
> > +}
> > +
> > +static int pf_handle_vf_save_data(struct xe_gt *gt, unsigned int vfid)
> > +{
> > +	return 0;
> > +}
> > +
> >  static bool pf_handle_vf_save(struct xe_gt *gt, unsigned int vfid)
> >  {
> > -	if (!pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WIP))
> > +	int ret;
> > +
> > +	if (!pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_PROCESS_DATA))
> >  		return false;
> >  
> > -	pf_enter_vf_saved(gt, vfid);
> > +	if (xe_gt_sriov_pf_migration_ring_full(gt, vfid)) {
> > +		pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WAIT_DATA);
> > +
> 
> nit: can remove this sep line

Ok.

> 
> > +		return true;
> > +	}
> > +
> > +	ret = pf_handle_vf_save_data(gt, vfid);
> > +	if (ret == -EAGAIN)
> > +		pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_PROCESS_DATA);
> > +	else if (ret)
> > +		pf_enter_vf_save_failed(gt, vfid);
> > +	else
> > +		pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_DATA_DONE);
> >  
> >  	return true;
> >  }
> >  
> > +static void pf_exit_vf_save_wait_data(struct xe_gt *gt, unsigned int vfid)
> > +{
> > +	if (!pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WAIT_DATA))
> > +		return;
> > +
> > +	pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_PROCESS_DATA);
> > +	pf_queue_vf(gt, vfid);
> > +}
> > +
> >  static bool pf_enter_vf_save_wip(struct xe_gt *gt, unsigned int vfid)
> >  {
> >  	if (pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WIP)) {
> > +		pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_PROCESS_DATA);
> >  		pf_enter_vf_wip(gt, vfid);
> >  		pf_queue_vf(gt, vfid);
> >  		return true;
> > @@ -842,6 +925,32 @@ static bool pf_enter_vf_save_wip(struct xe_gt *gt, unsigned int vfid)
> >  	return false;
> >  }
> >  
> > +/**
> > + * xe_gt_sriov_pf_control_check_save_data_done() - Check if all save migration data was produced.
> > + * @gt: the &xe_gt
> > + * @vfid: the VF identifier
> > + *
> > + * This function is for PF only.
> > + *
> > + * Return: 0 on success or a negative error code on failure.
> 
> but it's defined as a bool below

Ok.

> 
> > + */
> > +bool xe_gt_sriov_pf_control_check_save_data_done(struct xe_gt *gt, unsigned int vfid)
> > +{
> > +	return pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_DATA_DONE);
> > +}
> > +
> > +/**
> > + * xe_gt_sriov_pf_control_process_save_data() - Queue VF save migration data processing.
> > + * @gt: the &xe_gt
> > + * @vfid: the VF identifier
> > + *
> > + * This function is for PF only.
> > + */
> > +void xe_gt_sriov_pf_control_process_save_data(struct xe_gt *gt, unsigned int vfid)
> > +{
> > +	pf_exit_vf_save_wait_data(gt, vfid);
> 
> ok to have no check against unexpected state ?

It is OK, as the worker can go into SAVE_FAILED state at any point in
time, so there's not much we can check here.

However, we're missing FAILURE state checks on data consume (for save)
and produce (for restore) path.
I'll add it here (and in other relevant paths).

> 
> > +}
> > +
> >  /**
> >   * xe_gt_sriov_pf_control_trigger_save_vf() - Start an SR-IOV VF migration data save sequence.
> >   * @gt: the &xe_gt
> > @@ -887,19 +996,62 @@ int xe_gt_sriov_pf_control_trigger_save_vf(struct xe_gt *gt, unsigned int vfid)
> >   */
> >  int xe_gt_sriov_pf_control_finish_save_vf(struct xe_gt *gt, unsigned int vfid)
> >  {
> > -	if (!pf_expect_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVED)) {
> > -		pf_enter_vf_mismatch(gt, vfid);
> > +	if (!pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_DATA_DONE)) {
> > +		xe_gt_sriov_err(gt, "VF%u save is still in progress!\n", vfid);
> >  		return -EIO;
> >  	}
> >  
> >  	pf_expect_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSED);
> > +	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_DATA_DONE);
> > +	pf_enter_vf_saved(gt, vfid);
> >  
> >  	return 0;
> >  }
> >  
> > +/**
> > + * DOC: The VF RESTORE state machine
> > + *
> > + * RESTORE extends the PAUSED state.
> > + *
> > + * The VF RESTORE state machine looks like::
> > + *
> > + *  ....PAUSED....................................................
> > + *  :                                                            :
> > + *  :     (O)<---------o                                         :
> > + *  :      |            \                                        :
> > + *  :    restore      (RESTORED)  (RESTORE_FAILED)               :
> > + *  :      |               ^           ^                         :
> > + *  :      |               |           |                         :
> > + *  :  ....V...............o...........o......RESTORE_WIP......  :
> > + *  :  :   |               |           |                      :  :
> > + *  :  :   |             empty         |                      :  :
> > + *  :  :   |               |           |                      :  :
> > + *  :  :   |               |           |                      :  :
> > + *  :  :   |           DATA_DONE       |                      :  :
> > + *  :  :   |               ^           |                      :  :
> > + *  :  :   |               |        error                     :  :
> > + *  :  :   |           trailer        /                       :  :
> > + *  :  :   |              /          /                        :  :
> > + *  :  :   |             /          /                         :  :
> > + *  :  :   |            /          /                          :  :
> > + *  :  :   o---------->PROCESS_DATA<----produce               :  :
> > + *  :  :                \                      \              :  :
> > + *  :  :                 \                      \             :  :
> > + *  :  :                  \                      \            :  :
> > + *  :  :                   ring_empty---->WAIT_DATA           :  :
> > + *  :  :                                                      :  :
> > + *  :  :......................................................:  :
> > + *  :............................................................:
> > + *
> > + * For the full state machine view, see `The VF state machine`_.
> > + */
> 
> nit: like above, add separation line here

Ok.

> 
> >  static void pf_exit_vf_restore_wip(struct xe_gt *gt, unsigned int vfid)
> >  {
> > -	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WIP);
> > +	if (pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WIP)) {
> > +		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_PROCESS_DATA);
> > +		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WAIT_DATA);
> > +		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_DATA_DONE);
> > +	}
> >  }
> >  
> >  static void pf_enter_vf_restored(struct xe_gt *gt, unsigned int vfid)
> > @@ -914,19 +1066,61 @@ static void pf_enter_vf_restored(struct xe_gt *gt, unsigned int vfid)
> >  	pf_exit_vf_wip(gt, vfid);
> >  }
> >  
> > +static void pf_enter_vf_restore_failed(struct xe_gt *gt, unsigned int vfid)
> > +{
> > +	pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_FAILED);
> > +	pf_exit_vf_wip(gt, vfid);
> > +}
> > +
> > +static int pf_handle_vf_restore_data(struct xe_gt *gt, unsigned int vfid)
> > +{
> > +	struct xe_sriov_migration_data *data = xe_gt_sriov_pf_migration_restore_consume(gt, vfid);
> > +
> > +	xe_gt_assert(gt, data);
> 
> maybe assert is redundant here, as if data is null, we will get NPD crash call
> stack from the below line anyway?

Ok.

> 
> > +
> > +	xe_gt_sriov_notice(gt, "Skipping VF%u unknown data type: %d\n", vfid, data->type);
> > +
> > +	return 0;
> > +}
> > +
> >  static bool pf_handle_vf_restore(struct xe_gt *gt, unsigned int vfid)
> >  {
> > -	if (!pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WIP))
> > +	int ret;
> > +
> > +	if (!pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_PROCESS_DATA))
> >  		return false;
> >  
> > -	pf_enter_vf_restored(gt, vfid);
> > +	if (xe_gt_sriov_pf_migration_ring_empty(gt, vfid)) {
> > +		if (pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_DATA_DONE))
> > +			pf_enter_vf_restored(gt, vfid);
> > +		else
> > +			pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WAIT_DATA);
> > +
> > +		return true;
> > +	}
> > +
> > +	ret = pf_handle_vf_restore_data(gt, vfid);
> > +	if (ret)
> > +		pf_enter_vf_restore_failed(gt, vfid);
> > +	else
> > +		pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_PROCESS_DATA);
> >  
> >  	return true;
> >  }
> >  
> > +static void pf_exit_vf_restore_wait_data(struct xe_gt *gt, unsigned int vfid)
> > +{
> > +	if (!pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WAIT_DATA))
> > +		return;
> > +
> > +	pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_PROCESS_DATA);
> > +	pf_queue_vf(gt, vfid);
> > +}
> > +
> >  static bool pf_enter_vf_restore_wip(struct xe_gt *gt, unsigned int vfid)
> >  {
> >  	if (pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WIP)) {
> > +		pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_PROCESS_DATA);
> >  		pf_enter_vf_wip(gt, vfid);
> >  		pf_queue_vf(gt, vfid);
> >  		return true;
> > @@ -935,6 +1129,47 @@ static bool pf_enter_vf_restore_wip(struct xe_gt *gt, unsigned int vfid)
> >  	return false;
> >  }
> >  
> > +/**
> > + * xe_gt_sriov_pf_control_restore_data_done() - Indicate the end of VF migration data stream.
> > + * @gt: the &xe_gt
> > + * @vfid: the VF identifier
> > + *
> > + * This function is for PF only.
> > + *
> > + * Return: 0 on success or a negative error code on failure.
> 
> save_data_done() is bool
> and below you return only 0 or -EIO
> maybe it could be bool too?

It's check_save_data_done(), which is why it is bool.
Here we're telling the worker to go into data_done state.

> 
> > + */
> > +int xe_gt_sriov_pf_control_restore_data_done(struct xe_gt *gt, unsigned int vfid)
> > +{
> > +	if (!pf_expect_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WIP)) {
> > +		pf_enter_vf_state_machine_bug(gt, vfid);
> > +		return -EIO;
> > +	}
> > +
> > +	if (!pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_DATA_DONE)) {
> > +		pf_enter_vf_state_machine_bug(gt, vfid);
> > +		return -EIO;
> > +	}
> > +
> > +	xe_gt_sriov_pf_control_process_restore_data(gt, vfid);
> > +
> > +	return 0;
> > +}
> > +
> > +/**
> > + * xe_gt_sriov_pf_control_process_restore_data() - Queue VF restore migration data processing.
> > + * @gt: the &xe_gt
> > + * @vfid: the VF identifier
> > + *
> > + * This function is for PF only.
> > + */
> > +void xe_gt_sriov_pf_control_process_restore_data(struct xe_gt *gt, unsigned int vfid)
> > +{
> > +	if (!pf_expect_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WIP))
> > +		pf_enter_vf_state_machine_bug(gt, vfid);
> > +
> > +	pf_exit_vf_restore_wait_data(gt, vfid);
> > +}
> > +
> >  /**
> >   * xe_gt_sriov_pf_control_trigger restore_vf() - Start an SR-IOV VF migration data restore sequence.
> >   * @gt: the &xe_gt
> > @@ -1000,11 +1235,9 @@ int xe_gt_sriov_pf_control_finish_restore_vf(struct xe_gt *gt, unsigned int vfid
> >  {
> >  	int ret;
> >  
> > -	if (pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WIP)) {
> > -		ret = pf_wait_vf_restore_done(gt, vfid);
> > -		if (ret)
> > -			return ret;
> > -	}
> > +	ret = pf_wait_vf_restore_done(gt, vfid);
> > +	if (ret)
> > +		return ret;
> >  
> >  	if (!pf_expect_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORED)) {
> >  		pf_enter_vf_mismatch(gt, vfid);
> > @@ -1705,9 +1938,21 @@ static bool pf_process_vf_state_machine(struct xe_gt *gt, unsigned int vfid)
> >  	if (pf_exit_vf_pause_save_guc(gt, vfid))
> >  		return true;
> >  
> > +	if (pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WAIT_DATA)) {
> > +		xe_gt_sriov_dbg_verbose(gt, "VF%u in %s\n", vfid,
> > +					control_bit_to_string(XE_GT_SRIOV_STATE_SAVE_WAIT_DATA));
> > +		return false;
> > +	}
> > +
> >  	if (pf_handle_vf_save(gt, vfid))
> >  		return true;
> >  
> > +	if (pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WAIT_DATA)) {
> > +		xe_gt_sriov_dbg_verbose(gt, "VF%u in %s\n", vfid,
> > +					control_bit_to_string(XE_GT_SRIOV_STATE_RESTORE_WAIT_DATA));
> > +		return false;
> > +	}
> > +
> >  	if (pf_handle_vf_restore(gt, vfid))
> >  		return true;
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h
> > index abc233f6302ed..6b1ab339e3b73 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h
> > @@ -14,12 +14,14 @@ struct xe_gt;
> >  int xe_gt_sriov_pf_control_init(struct xe_gt *gt);
> >  void xe_gt_sriov_pf_control_restart(struct xe_gt *gt);
> >  
> > -bool xe_gt_sriov_pf_control_check_vf_data_wip(struct xe_gt *gt, unsigned int vfid);
> > -
> >  int xe_gt_sriov_pf_control_pause_vf(struct xe_gt *gt, unsigned int vfid);
> >  int xe_gt_sriov_pf_control_resume_vf(struct xe_gt *gt, unsigned int vfid);
> > +bool xe_gt_sriov_pf_control_check_save_data_done(struct xe_gt *gt, unsigned int vfid);
> > +void xe_gt_sriov_pf_control_process_save_data(struct xe_gt *gt, unsigned int vfid);
> >  int xe_gt_sriov_pf_control_trigger_save_vf(struct xe_gt *gt, unsigned int vfid);
> >  int xe_gt_sriov_pf_control_finish_save_vf(struct xe_gt *gt, unsigned int vfid);
> > +int xe_gt_sriov_pf_control_restore_data_done(struct xe_gt *gt, unsigned int vfid);
> > +void xe_gt_sriov_pf_control_process_restore_data(struct xe_gt *gt, unsigned int vfid);
> >  int xe_gt_sriov_pf_control_trigger_restore_vf(struct xe_gt *gt, unsigned int vfid);
> >  int xe_gt_sriov_pf_control_finish_restore_vf(struct xe_gt *gt, unsigned int vfid);
> >  int xe_gt_sriov_pf_control_stop_vf(struct xe_gt *gt, unsigned int vfid);
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
> > index ea16ceb39dabb..a14c738581ae2 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
> > @@ -32,9 +32,15 @@
> >   * @XE_GT_SRIOV_STATE_PAUSE_FAILED: indicates that a VF pause operation has failed.
> >   * @XE_GT_SRIOV_STATE_PAUSED: indicates that the VF is paused.
> >   * @XE_GT_SRIOV_STATE_SAVE_WIP: indicates that VF save operation is in progress.
> > + * @XE_GT_SRIOV_STATE_SAVE_PROCESS_DATA: indicates that VF migration data is being produced.
> > + * @XE_GT_SRIOV_STATE_SAVE_WAIT_DATA: indicates that PF awaits for space in migration data ring.
> > + * @XE_GT_SRIOV_STATE_SAVE_DATA_DONE: indicates that all migration data was produced by Xe.
> >   * @XE_GT_SRIOV_STATE_SAVE_FAILED: indicates that VF save operation has failed.
> >   * @XE_GT_SRIOV_STATE_SAVED: indicates that VF data is saved.
> >   * @XE_GT_SRIOV_STATE_RESTORE_WIP: indicates that VF restore operation is in progress.
> > + * @XE_GT_SRIOV_STATE_RESTORE_PROCESS_DATA: indicates that VF migration data is being consumed.
> > + * @XE_GT_SRIOV_STATE_RESTORE_WAIT_DATA: indicates that PF awaits for data in migration data ring.
> > + * @XE_GT_SRIOV_STATE_RESTORE_DATA_DONE: indicates that all migration data was produced by the user.
> >   * @XE_GT_SRIOV_STATE_RESTORE_FAILED: indicates that VF restore operation has failed.
> >   * @XE_GT_SRIOV_STATE_RESTORED: indicates that VF data is restored.
> >   * @XE_GT_SRIOV_STATE_RESUME_WIP: indicates the a VF resume operation is in progress.
> > @@ -70,10 +76,16 @@ enum xe_gt_sriov_control_bits {
> >  	XE_GT_SRIOV_STATE_PAUSED,
> >  
> >  	XE_GT_SRIOV_STATE_SAVE_WIP,
> > +	XE_GT_SRIOV_STATE_SAVE_PROCESS_DATA,
> > +	XE_GT_SRIOV_STATE_SAVE_WAIT_DATA,
> > +	XE_GT_SRIOV_STATE_SAVE_DATA_DONE,
> >  	XE_GT_SRIOV_STATE_SAVE_FAILED,
> >  	XE_GT_SRIOV_STATE_SAVED,
> >  
> >  	XE_GT_SRIOV_STATE_RESTORE_WIP,
> > +	XE_GT_SRIOV_STATE_RESTORE_PROCESS_DATA,
> > +	XE_GT_SRIOV_STATE_RESTORE_WAIT_DATA,
> > +	XE_GT_SRIOV_STATE_RESTORE_DATA_DONE,
> >  	XE_GT_SRIOV_STATE_RESTORE_FAILED,
> >  	XE_GT_SRIOV_STATE_RESTORED,
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> > index ca28f45aaf481..e61e6f4215864 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> > @@ -7,6 +7,7 @@
> >  
> >  #include "abi/guc_actions_sriov_abi.h"
> >  #include "xe_bo.h"
> > +#include "xe_gt_sriov_pf_control.h"
> >  #include "xe_gt_sriov_pf_helpers.h"
> >  #include "xe_gt_sriov_pf_migration.h"
> >  #include "xe_gt_sriov_printk.h"
> > @@ -15,6 +16,17 @@
> >  #include "xe_sriov.h"
> >  #include "xe_sriov_pf_migration.h"
> >  
> > +#define XE_GT_SRIOV_PF_MIGRATION_RING_SIZE 5
> > +
> > +static struct xe_gt_sriov_migration_data *pf_pick_gt_migration(struct xe_gt *gt, unsigned int vfid)
> > +{
> > +	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
> > +	xe_gt_assert(gt, vfid != PFID);
> > +	xe_gt_assert(gt, vfid <= xe_sriov_pf_get_totalvfs(gt_to_xe(gt)));
> > +
> > +	return &gt->sriov.pf.vfs[vfid].migration;
> > +}
> > +
> >  /* Return: number of dwords saved/restored/required or a negative error code on failure */
> >  static int guc_action_vf_save_restore(struct xe_guc *guc, u32 vfid, u32 opcode,
> >  				      u64 addr, u32 ndwords)
> > @@ -382,6 +394,162 @@ ssize_t xe_gt_sriov_pf_migration_write_guc_state(struct xe_gt *gt, unsigned int
> >  }
> >  #endif /* CONFIG_DEBUG_FS */
> >  
> > +/**
> > + * xe_gt_sriov_pf_migration_ring_empty() - Check if a migration ring is empty.
> > + * @gt: the &xe_gt
> > + * @vfid: the VF identifier
> > + *
> > + * Return: true if the ring is empty, otherwise false.
> > + */
> > +bool xe_gt_sriov_pf_migration_ring_empty(struct xe_gt *gt, unsigned int vfid)
> > +{
> > +	return ptr_ring_empty(&pf_pick_gt_migration(gt, vfid)->ring);
> > +}
> > +
> > +/**
> > + * xe_gt_sriov_pf_migration_ring_full() - Check if a migration ring is full.
> > + * @gt: the &xe_gt
> > + * @vfid: the VF identifier
> > + *
> > + * Return: true if the ring is full, otherwise false.
> > + */
> > +bool xe_gt_sriov_pf_migration_ring_full(struct xe_gt *gt, unsigned int vfid)
> > +{
> > +	return ptr_ring_full(&pf_pick_gt_migration(gt, vfid)->ring);
> > +}
> > +
> > +/**
> > + * xe_gt_sriov_pf_migration_save_produce() - Add VF save data packet to migration ring.
> > + * @gt: the &xe_gt
> > + * @vfid: the VF identifier
> > + * @data: &xe_sriov_migration_data packet
> > + *
> > + * Called by the save migration data producer (PF SR-IOV Control worker) when
> > + * processing migration data.
> > + * Wakes up the save migration data consumer (userspace), that is potentially
> > + * waiting for data when the ring is empty.
> 
> ... was empty ?

Ok.

> 
> > + *
> > + * Return: 0 on success or a negative error code on failure.
> > + */
> > +int xe_gt_sriov_pf_migration_save_produce(struct xe_gt *gt, unsigned int vfid,
> > +					  struct xe_sriov_migration_data *data)
> > +{
> > +	int ret;
> > +
> > +	ret = ptr_ring_produce(&pf_pick_gt_migration(gt, vfid)->ring, data);
> > +	if (ret)
> > +		return ret;
> > +
> > +	wake_up_all(xe_sriov_pf_migration_waitqueue(gt_to_xe(gt), vfid));
> > +
> > +	return 0;
> > +}
> > +
> > +/**
> > + * xe_gt_sriov_pf_migration_restore_consume() - Get VF restore data packet from migration ring.
> > + * @gt: the &xe_gt
> > + * @vfid: the VF identifier
> > + *
> > + * Called by the restore migration data consumer (PF SR-IOV Control worker) when
> > + * processing migration data.
> > + * Wakes up the restore migration data producer (userspace), that is
> > + * potentially waiting to add more data when the ring is full.
> > + *
> > + * Return: Pointer to &struct xe_sriov_migration_data on success,
> > + *	   NULL if ring is empty.
> > + */
> > +struct xe_sriov_migration_data *
> > +xe_gt_sriov_pf_migration_restore_consume(struct xe_gt *gt, unsigned int vfid)
> > +{
> > +	struct xe_gt_sriov_migration_data *migration = pf_pick_gt_migration(gt, vfid);
> > +	struct wait_queue_head *wq = xe_sriov_pf_migration_waitqueue(gt_to_xe(gt), vfid);
> > +	struct xe_sriov_migration_data *data;
> > +
> > +	data = ptr_ring_consume(&migration->ring);
> > +	if (data)
> > +		wake_up_all(wq);
> > +
> > +	return data;
> > +}
> > +
> > +/**
> > + * xe_gt_sriov_pf_migration_restore_produce() - Add VF restore data packet to migration ring.
> > + * @gt: the &xe_gt
> > + * @vfid: the VF identifier
> > + * @data: &xe_sriov_migration_data packet
> > + *
> > + * Called by the restore migration data producer (userspace) when processing
> > + * migration data.
> > + * If the ring is full, waits until there is space.
> > + * Queues the restore migration data consumer (PF SR-IOV Control worker), that
> > + * is potentially waiting for data when the ring is empty.
> > + *
> > + * Return: 0 on success or a negative error code on failure.
> > + */
> > +int xe_gt_sriov_pf_migration_restore_produce(struct xe_gt *gt, unsigned int vfid,
> > +					     struct xe_sriov_migration_data *data)
> > +{
> > +	struct wait_queue_head *wq = xe_sriov_pf_migration_waitqueue(gt_to_xe(gt), vfid);
> > +	struct xe_gt_sriov_migration_data *migration = pf_pick_gt_migration(gt, vfid);
> > +	int ret;
> > +
> > +	xe_gt_assert(gt, data->tile == gt->tile->id);
> > +	xe_gt_assert(gt, data->gt == gt->info.id);
> > +
> > +	for (;;) {
> > +		ret = ptr_ring_produce(&migration->ring, data);
> > +		if (!ret)
> > +			break;
> > +
> > +		ret = wait_event_interruptible(*wq, !ptr_ring_full(&migration->ring));
> > +		if (ret)
> > +			return ret;
> > +	}
> > +
> > +	xe_gt_sriov_pf_control_process_restore_data(gt, vfid);
> > +
> > +	return 0;
> > +}
> > +
> > +/**
> > + * xe_gt_sriov_pf_migration_save_consume() - Get VF save data packet from migration ring.
> > + * @gt: the &xe_gt
> > + * @vfid: the VF identifier
> > + *
> > + * Called by the save migration data consumer (userspace) when
> > + * processing migration data.
> > + * Queues the save migration data producer (PF SR-IOV Control worker), that is
> > + * potentially waiting to add more data when the ring is full.
> > + *
> > + * Return: Pointer to &struct xe_sriov_migration_data on success,
> > + *	   NULL if ring is empty and there's no more data available,
> > + *	   ERR_PTR(-EAGAIN) if the ring is empty, but data is still produced.
> > + */
> > +struct xe_sriov_migration_data *
> > +xe_gt_sriov_pf_migration_save_consume(struct xe_gt *gt, unsigned int vfid)
> > +{
> > +	struct xe_gt_sriov_migration_data *migration = pf_pick_gt_migration(gt, vfid);
> > +	struct xe_sriov_migration_data *data;
> > +
> > +	data = ptr_ring_consume(&migration->ring);
> > +	if (data) {
> > +		xe_gt_sriov_pf_control_process_save_data(gt, vfid);
> > +		return data;
> > +	}
> > +
> > +	if (xe_gt_sriov_pf_control_check_save_data_done(gt, vfid))
> > +		return NULL;
> > +
> > +	return ERR_PTR(-EAGAIN);
> > +}
> > +
> > +static void action_ring_cleanup(void *arg)
> > +{
> > +	struct ptr_ring *r = arg;
> > +
> > +	ptr_ring_cleanup(r, NULL);
> > +}
> > +
> >  /**
> >   * xe_gt_sriov_pf_migration_init() - Initialize support for VF migration.
> >   * @gt: the &xe_gt
> > @@ -393,6 +561,7 @@ ssize_t xe_gt_sriov_pf_migration_write_guc_state(struct xe_gt *gt, unsigned int
> >  int xe_gt_sriov_pf_migration_init(struct xe_gt *gt)
> >  {
> >  	struct xe_device *xe = gt_to_xe(gt);
> > +	unsigned int n, totalvfs;
> >  	int err;
> >  
> >  	xe_gt_assert(gt, IS_SRIOV_PF(xe));
> > @@ -404,5 +573,19 @@ int xe_gt_sriov_pf_migration_init(struct xe_gt *gt)
> >  	if (err)
> >  		return err;
> >  
> > +	totalvfs = xe_sriov_pf_get_totalvfs(xe);
> > +	for (n = 1; n <= totalvfs; n++) {
> > +		struct xe_gt_sriov_migration_data *migration = pf_pick_gt_migration(gt, n);
> > +
> > +		err = ptr_ring_init(&migration->ring,
> > +				    XE_GT_SRIOV_PF_MIGRATION_RING_SIZE, GFP_KERNEL);
> > +		if (err)
> > +			return err;
> > +
> > +		err = devm_add_action_or_reset(xe->drm.dev, action_ring_cleanup, &migration->ring);
> > +		if (err)
> > +			return err;
> > +	}
> > +
> >  	return 0;
> >  }
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
> > index 09faeae00ddbb..9e67f18ded205 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
> > @@ -9,11 +9,25 @@
> >  #include <linux/types.h>
> >  
> >  struct xe_gt;
> > +struct xe_sriov_migration_data;
> >  
> >  int xe_gt_sriov_pf_migration_init(struct xe_gt *gt);
> >  int xe_gt_sriov_pf_migration_save_guc_state(struct xe_gt *gt, unsigned int vfid);
> >  int xe_gt_sriov_pf_migration_restore_guc_state(struct xe_gt *gt, unsigned int vfid);
> >  
> > +bool xe_gt_sriov_pf_migration_ring_empty(struct xe_gt *gt, unsigned int vfid);
> > +bool xe_gt_sriov_pf_migration_ring_full(struct xe_gt *gt, unsigned int vfid);
> > +
> > +int xe_gt_sriov_pf_migration_save_produce(struct xe_gt *gt, unsigned int vfid,
> > +					  struct xe_sriov_migration_data *data);
> > +struct xe_sriov_migration_data *
> > +xe_gt_sriov_pf_migration_restore_consume(struct xe_gt *gt, unsigned int vfid);
> > +
> > +int xe_gt_sriov_pf_migration_restore_produce(struct xe_gt *gt, unsigned int vfid,
> > +					     struct xe_sriov_migration_data *data);
> > +struct xe_sriov_migration_data *
> > +xe_gt_sriov_pf_migration_save_consume(struct xe_gt *gt, unsigned int vfid);
> > +
> >  #ifdef CONFIG_DEBUG_FS
> >  ssize_t xe_gt_sriov_pf_migration_read_guc_state(struct xe_gt *gt, unsigned int vfid,
> >  						char __user *buf, size_t count, loff_t *pos);
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h
> > index 9d672feac5f04..84be6fac16c8b 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h
> > @@ -7,6 +7,7 @@
> >  #define _XE_GT_SRIOV_PF_MIGRATION_TYPES_H_
> >  
> >  #include <linux/mutex.h>
> > +#include <linux/ptr_ring.h>
> >  #include <linux/types.h>
> >  
> >  /**
> > @@ -24,6 +25,16 @@ struct xe_gt_sriov_state_snapshot {
> >  	} guc;
> >  };
> >  
> > +/**
> > + * struct xe_gt_sriov_migration_data - GT-level per-VF migration data.
> > + *
> > + * Used by the PF driver to maintain per-VF migration data.
> > + */
> > +struct xe_gt_sriov_migration_data {
> > +	/** @ring: queue containing VF save / restore migration data */
> > +	struct ptr_ring ring;
> > +};
> > +
> >  /**
> >   * struct xe_gt_sriov_pf_migration - GT-level data.
> >   *
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h
> > index a64a6835ad656..812e74d3f8f80 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h
> > @@ -33,6 +33,9 @@ struct xe_gt_sriov_metadata {
> >  
> >  	/** @snapshot: snapshot of the VF state data */
> >  	struct xe_gt_sriov_state_snapshot snapshot;
> > +
> > +	/** @migration: per-VF migration data. */
> > +	struct xe_gt_sriov_migration_data migration;
> >  };
> >  
> >  /**
> > diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
> > index 8c523c392f98b..7be9f026d80e8 100644
> > --- a/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
> > +++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
> > @@ -3,8 +3,36 @@
> >   * Copyright © 2025 Intel Corporation
> >   */
> >  
> > +#include <drm/drm_managed.h>
> > +
> > +#include "xe_device.h"
> > +#include "xe_gt_sriov_pf_control.h"
> > +#include "xe_gt_sriov_pf_migration.h"
> > +#include "xe_pm.h"
> >  #include "xe_sriov.h"
> > +#include "xe_sriov_pf_helpers.h"
> >  #include "xe_sriov_pf_migration.h"
> > +#include "xe_sriov_printk.h"
> > +
> > +static struct xe_sriov_pf_migration *pf_pick_migration(struct xe_device *xe, unsigned int vfid)
> > +{
> > +	xe_assert(xe, IS_SRIOV_PF(xe));
> > +	xe_assert(xe, vfid <= xe_sriov_pf_get_totalvfs(xe));
> > +
> > +	return &xe->sriov.pf.vfs[vfid].migration;
> > +}
> > +
> > +/**
> > + * xe_sriov_pf_migration_waitqueue - Get waitqueue for migration.
> > + * @xe: the &xe_device
> > + * @vfid: the VF identifier
> > + *
> > + * Return: pointer to the migration waitqueue.
> > + */
> > +wait_queue_head_t *xe_sriov_pf_migration_waitqueue(struct xe_device *xe, unsigned int vfid)
> > +{
> > +	return &pf_pick_migration(xe, vfid)->wq;
> > +}
> >  
> >  /**
> >   * xe_sriov_pf_migration_supported() - Check if SR-IOV VF migration is supported by the device
> > @@ -33,9 +61,123 @@ static bool pf_check_migration_support(struct xe_device *xe)
> >   */
> >  int xe_sriov_pf_migration_init(struct xe_device *xe)
> >  {
> > +	unsigned int n, totalvfs;
> > +
> >  	xe_assert(xe, IS_SRIOV_PF(xe));
> >  
> >  	xe->sriov.pf.migration.supported = pf_check_migration_support(xe);
> > +	if (!xe_sriov_pf_migration_supported(xe))
> > +		return 0;
> > +
> > +	totalvfs = xe_sriov_pf_get_totalvfs(xe);
> > +	for (n = 1; n <= totalvfs; n++) {
> > +		struct xe_sriov_pf_migration *migration = pf_pick_migration(xe, n);
> > +
> > +		init_waitqueue_head(&migration->wq);
> > +	}
> >  
> >  	return 0;
> >  }
> > +
> > +static bool pf_migration_data_ready(struct xe_device *xe, unsigned int vfid)
> > +{
> > +	struct xe_gt *gt;
> > +	u8 gt_id;
> > +
> > +	for_each_gt(gt, xe, gt_id) {
> > +		if (!xe_gt_sriov_pf_migration_ring_empty(gt, vfid) ||
> > +		    xe_gt_sriov_pf_control_check_save_data_done(gt, vfid))
> > +			return true;
> > +	}
> > +
> > +	return false;
> > +}
> > +
> > +static struct xe_sriov_migration_data *
> > +pf_migration_consume(struct xe_device *xe, unsigned int vfid)
> > +{
> > +	struct xe_sriov_migration_data *data;
> > +	struct xe_gt *gt;
> > +	u8 gt_id;
> > +	bool more_data = false;
> 
> nit: vars in rev xmas tree order?

Ok.

> 
> > +
> > +	for_each_gt(gt, xe, gt_id) {
> > +		data = xe_gt_sriov_pf_migration_save_consume(gt, vfid);
> > +		if (data && PTR_ERR(data) != EAGAIN)
> > +			return data;
> > +		if (PTR_ERR(data) == -EAGAIN)
> > +			more_data = true;
> > +	}
> > +
> > +	if (!more_data)
> > +		return NULL;
> > +
> > +	return ERR_PTR(-EAGAIN);
> > +}
> > +
> > +/**
> > + * xe_sriov_pf_migration_save_consume() - Consume a VF migration data packet from the device.
> > + * @xe: the &xe_device
> > + * @vfid: the VF identifier
> > + *
> > + * Called by the save migration data consumer (userspace) when
> > + * processing migration data.
> > + * If there is no migration data to process, wait until more data is available.
> > + *
> > + * Return: Pointer to &xe_sriov_migration_data on success,
> > + *	   NULL if ring is empty and no more migration data is expected,
> > + *	   ERR_PTR value in case of error.
> > + *
> > + * Return: 0 on success or a negative error code on failure.
> > + */
> > +struct xe_sriov_migration_data *
> > +xe_sriov_pf_migration_save_consume(struct xe_device *xe, unsigned int vfid)
> > +{
> > +	struct xe_sriov_pf_migration *migration = pf_pick_migration(xe, vfid);
> > +	struct xe_sriov_migration_data *data;
> > +	int ret;
> > +
> > +	xe_assert(xe, IS_SRIOV_PF(xe));
> > +
> > +	for (;;) {
> > +		data = pf_migration_consume(xe, vfid);
> > +		if (PTR_ERR(data) != -EAGAIN)
> > +			break;
> > +
> > +		ret = wait_event_interruptible(migration->wq,
> > +					       pf_migration_data_ready(xe, vfid));
> > +		if (ret)
> > +			return ERR_PTR(ret);
> > +	}
> > +
> > +	return data;
> > +}
> > +
> > +/**
> > + * xe_sriov_pf_migration_restore_produce() - Produce a VF migration data packet to the device.
> > + * @xe: the &xe_device
> > + * @vfid: the VF identifier
> > + * @data: Pointer to &xe_sriov_migration_data
> > + *
> > + * Called by the restore migration data producer (userspace) when processing
> > + * migration data.
> > + * If the underlying data structure is full, wait until there is space.
> > + *
> > + * Return: 0 on success or a negative error code on failure.
> > + */
> > +int xe_sriov_pf_migration_restore_produce(struct xe_device *xe, unsigned int vfid,
> > +					  struct xe_sriov_migration_data *data)
> > +{
> > +	struct xe_gt *gt;
> > +
> > +	xe_assert(xe, IS_SRIOV_PF(xe));
> > +
> > +	gt = xe_device_get_gt(xe, data->gt);
> > +	if (!gt || data->tile != gt->tile->id) {
> > +		xe_sriov_err_ratelimited(xe, "VF%d Invalid GT - tile:%u, GT:%u\n",
> > +					 vfid, data->tile, data->gt);
> > +		return -EINVAL;
> > +	}
> > +
> > +	return xe_gt_sriov_pf_migration_restore_produce(gt, vfid, data);
> > +}
> > diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration.h b/drivers/gpu/drm/xe/xe_sriov_pf_migration.h
> > index d2b4a24165438..df81a540c246a 100644
> > --- a/drivers/gpu/drm/xe/xe_sriov_pf_migration.h
> > +++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration.h
> > @@ -7,10 +7,17 @@
> >  #define _XE_SRIOV_PF_MIGRATION_H_
> >  
> >  #include <linux/types.h>
> > +#include <linux/wait.h>
> >  
> >  struct xe_device;
> > +struct xe_sriov_migration_data;
> >  
> >  int xe_sriov_pf_migration_init(struct xe_device *xe);
> >  bool xe_sriov_pf_migration_supported(struct xe_device *xe);
> > +int xe_sriov_pf_migration_restore_produce(struct xe_device *xe, unsigned int vfid,
> > +					  struct xe_sriov_migration_data *data);
> > +struct xe_sriov_migration_data *
> > +xe_sriov_pf_migration_save_consume(struct xe_device *xe, unsigned int vfid);
> > +wait_queue_head_t *xe_sriov_pf_migration_waitqueue(struct xe_device *xe, unsigned int vfid);
> >  
> >  #endif
> > diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h b/drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h
> > index e69de29bb2d1d..2a45ee4e3ece8 100644
> > --- a/drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h
> > +++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h
> > @@ -0,0 +1,58 @@
> > +/* SPDX-License-Identifier: MIT */
> > +/*
> > + * Copyright © 2025 Intel Corporation
> > + */
> > +
> > +#ifndef _XE_SRIOV_PF_MIGRATION_TYPES_H_
> > +#define _XE_SRIOV_PF_MIGRATION_TYPES_H_
> > +
> > +#include <linux/types.h>
> > +#include <linux/wait.h>
> > +
> > +/**
> > + * struct xe_sriov_migration_data - Xe SR-IOV VF migration data packet
> > + */
> > +struct xe_sriov_migration_data {
> > +	/** @xe: Xe device */
> > +	struct xe_device *xe;
> > +	/** @vaddr: CPU pointer to payload data */
> > +	void *vaddr;
> > +	/** @remaining: payload data remaining */
> > +	size_t remaining;
> > +	/** @hdr_remaining: header data remaining */
> > +	size_t hdr_remaining;
> > +	union {
> > +		/** @bo: Buffer object with migration data */
> > +		struct xe_bo *bo;
> > +		/** @buff: Buffer with migration data */
> > +		void *buff;
> > +	};
> > +	__struct_group(xe_sriov_pf_migration_hdr, hdr, __packed,
> > +		/** @hdr.version: migration data protocol version */
> > +		u8 version;
> > +		/** @hdr.type: migration data type */
> > +		u8 type;
> > +		/** @hdr.tile: migration data tile id */
> > +		u8 tile;
> > +		/** @hdr.gt: migration data gt id */
> > +		u8 gt;
> > +		/** @hdr.flags: migration data flags */
> > +		u32 flags;
> > +		/** @hdr.offset: offset into the resource;
> > +		 * used when multiple packets of given type are used for migration
> > +		 */
> > +		u64 offset;
> > +		/** @hdr.size: migration data size  */
> > +		u64 size;
> > +	);
> > +};
> > +
> > +/**
> > + * struct xe_sriov_pf_migration - Per VF device-level migration related data
> > + */
> > +struct xe_sriov_pf_migration {
> > +	/** @wq: waitqueue used to avoid busy-waiting for snapshot production/consumption */
> > +	wait_queue_head_t wq;
> > +};
> > +
> > +#endif
> > diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_types.h b/drivers/gpu/drm/xe/xe_sriov_pf_types.h
> > index 24d22afeececa..c92baaa1694ca 100644
> > --- a/drivers/gpu/drm/xe/xe_sriov_pf_types.h
> > +++ b/drivers/gpu/drm/xe/xe_sriov_pf_types.h
> > @@ -9,6 +9,7 @@
> >  #include <linux/mutex.h>
> >  #include <linux/types.h>
> >  
> > +#include "xe_sriov_pf_migration_types.h"
> >  #include "xe_sriov_pf_provision_types.h"
> >  #include "xe_sriov_pf_service_types.h"
> >  
> > @@ -18,6 +19,8 @@
> >  struct xe_sriov_metadata {
> >  	/** @version: negotiated VF/PF ABI version */
> >  	struct xe_sriov_pf_service_version version;
> > +	/** @migration: migration data */
> > +	struct xe_sriov_pf_migration migration;
> >  };
> >  
> >  /**
> 
> otherwise LGTM

Thanks,
-Michał

> 
> 
