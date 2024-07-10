Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D353892CA62
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2024 08:08:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5781010E5B4;
	Wed, 10 Jul 2024 06:08:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UORCCyXi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F3EC10E5B1;
 Wed, 10 Jul 2024 06:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720591708; x=1752127708;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=iI8/JhG0A6ZQ3bqrwKGYobHgKc1Lbfe+abMMIpO2fL8=;
 b=UORCCyXiPuU96pKpo8OjE0oUtF9RLamaad8aGumBhsSHOEvoXTxqKAWX
 gJoCSQUTyi21mtOkTE2N8HN0gSYvnM7K8qAg8U6YUBWVlpGD6nYrqyhyw
 8NkWT/uHplMEC5QFUYzaCCbdYv+kQCr4kGkXVttkcL/WtLizTs4P8hGis
 Sx6o5xhTukIaonbwb5HD/ujDbd9wyKcd+aoh4ptjAyzIcxcTP8/+E1Z5D
 2Mib8dLWrLS5UYV2Y++wtf8cYNGc5/8He8N1zd26gQpDb/yvWbhH+MSwa
 hKU69j5ku7OhxA4AUkFcK2R4m/dXr9pVs6jBim/x2bFpaNGR9JY5tGfdP w==;
X-CSE-ConnectionGUID: 8oUPDZ7dR6a46/t5pwb3Aw==
X-CSE-MsgGUID: btKBQ0heQQe2ODZ6xQ1XvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11128"; a="28481847"
X-IronPort-AV: E=Sophos;i="6.09,197,1716274800"; d="scan'208";a="28481847"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2024 23:08:28 -0700
X-CSE-ConnectionGUID: RT6t0iSzRfKnrB+F3IOvJg==
X-CSE-MsgGUID: BTV9vWEiTD6Ykdd27Rx8Dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,197,1716274800"; d="scan'208";a="48763533"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Jul 2024 23:08:28 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 9 Jul 2024 23:08:27 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 9 Jul 2024 23:08:26 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 9 Jul 2024 23:08:26 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 9 Jul 2024 23:08:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UWFMNR53b0en8f3LbGeS15nxSIX/AP85yPOJNIcmYV1Ph2uLO56D1hco0WbzL0ozMqNh595gc8edCSV67nLitVy0yJjGNlehmsSDkBjGRgE16naVMWxu6nVbEJDucIvEG10CasApE87qQPlWpSWANUeDI0l4CFXgrUi0wxIe3JYBUvDBo8gxIetpgXfO4HqybFecpvjVJViehcCOS2ORiV1WRQ7xGfeUasj7PCdIBByeVhWhlVV5YNrlKaDcsNQBgfdGJd+JY7NoO31xdPpbXpeTCvZOVDy3YHNv1cN551Mco3ZnPbDoYZPVH1E08wDkdFQV6BeFGHGwfYzxjkw4+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iI8/JhG0A6ZQ3bqrwKGYobHgKc1Lbfe+abMMIpO2fL8=;
 b=lby2K+iZNu34nU+wjbmbFolMASyE8CMiudJZSFThbTcmE1Rr7Gp7eXwilhZkdwKhS9TJG6dUAv1RH4o1MfrCj0mbEoT11TqMw7Ywv/2YBTf74nHBJUCQsW9EtGqJhvhMYUKEHT5K9g7kII8a1KHfBRbtAusIfWX6+Xsj/SR3oge8ZYOWUZUewKSKbjlcQGI0S0VR0GoirQOjlab8IamGdADovYgTT0ns2g3hRLQPIKnhG2+B9crsjCvYrl8dkR8mExyA3lH7ma/bWISbbueCJbZcLjh+MNGXsFI1GTHJd9816nIZHgMA9qPLC7512Joamlrs0/Allr3PKn97ad0oSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB6353.namprd11.prod.outlook.com (2603:10b6:510:1ff::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Wed, 10 Jul
 2024 06:08:24 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7741.033; Wed, 10 Jul 2024
 06:08:24 +0000
Date: Wed, 10 Jul 2024 01:08:24 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
CC: <thomas.hellstrom@linux.intel.com>, <rodrigo.vivi@intel.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, Abaci Robot <abaci@linux.alibaba.com>
Subject: Re: [PATCH -next] drm/xe: Remove duplicate generated/xe_wa_oob.h
 header
Message-ID: <erm6tkdg5yfozjxnntcyscshh76qiibmbmpldk34ss5an5xxp3@4fkuan4nlj66>
References: <20240710054941.44013-1-jiapeng.chong@linux.alibaba.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240710054941.44013-1-jiapeng.chong@linux.alibaba.com>
X-ClientProxiedBy: MW4P223CA0012.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::17) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB6353:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b11f11e-9a76-4e86-780b-08dca0a6b4f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?h8n00yGKwQefpiWOkD1TOgT2VnJ3sOnC16qeTzEBU6V34dxBu/y4uhIr79fq?=
 =?us-ascii?Q?p5qI+G2FchYCwbrIhX17QuvG3NGdFUSavfI8pCIhYHAVcblQvOKSIjMfRTFd?=
 =?us-ascii?Q?BM46XQFCpGuD6u2RupY4JB1r+iqcLsQJTmLL6ph3GZ0/Ncwj9jNXh+2Mtww1?=
 =?us-ascii?Q?EmTphlA91auL3soIcQoScRJe7wuaB1bQj79GSYa0iEwaMCaB9tULCzFpCKqr?=
 =?us-ascii?Q?V+TRi7X6kLoAsLobDMDihjQUl6nuv8T4g5LFLXYpjgBkdlYjak8vlU6TPeLz?=
 =?us-ascii?Q?nFOgvep5Ms19qNmxaEsfCJuZGAAB8E4GAzIKBe7MNJY20NG80gYfhbGe88+e?=
 =?us-ascii?Q?Rnb1zI+9WDMizfhiM31t4TJ6ge+DVtLlnkveLEK/xG61oHKjYmH3StJcHVZL?=
 =?us-ascii?Q?jh/eBdbBrRC8hX7LkmE0bg6z6HjxbUVEMQlC9R7cs6i36W/OnKTdvtOpAYRm?=
 =?us-ascii?Q?Z6B5QHrCw6raZY2fqE3n9vdIQ7GKRUAXi+u2FYhtXgQxSREhPIyVf+pEqxLZ?=
 =?us-ascii?Q?erslKdb/iVw5uj96tuEK/LVzD1upplrPU5yyf+taZntPzn6qKnk34PLQlIGM?=
 =?us-ascii?Q?p62ouWlHS5auanpjnchJSpKDlpGOg4KyRW1i+RMpCN9OcOSBYcJF+1FVl3Pu?=
 =?us-ascii?Q?WPfJ/DaTzl+zUsLDOLYe0Z9JtXnVn4nq5AZJoi33bwvnrOZMO0Fvp93cbCmo?=
 =?us-ascii?Q?pkR3xdpdICVopTIOfD9xgRZNPjiZyJYlwQ6eRvC7O+/aHxiqPcIpfUVY/28Y?=
 =?us-ascii?Q?65VFjFyHWN4CIVDjjdUeTDY8qTaNR/FKcreH345+A46qIPvo7aHvXG3Bv+eN?=
 =?us-ascii?Q?CXdnqLBvxwpdzmfM/q5GCyakkz7bR0cCmLhO/mVqxFIDHLOkuCD0M2m7JDgJ?=
 =?us-ascii?Q?re8ucAI3WqQ3hJpQt4YW0Ez5e+AruIBWWDYOCaKO9gq8u9MdA4cFMr88CJPB?=
 =?us-ascii?Q?/UVJdsO4kE7gyu55u4+f23duPS/cJv3juzAe72qHvkffephH7xSTsrpgCf3l?=
 =?us-ascii?Q?7iJQNgtEVclLGPZZqx84B/anMqOMtV1hY24k4sqITkijZx9CHdk9VOoJ4u4P?=
 =?us-ascii?Q?HTm64NlTpxDAT4Y4D8bQs06vUdnhWDb9T03Q5nh8G8RKBg1oK+pyvI9UlVgG?=
 =?us-ascii?Q?U4a8kZsGR/h0ljU6XLrjOnSOTI5tpKlAW8OQJYbHRhxHQTXGA4jKwKoK7Sx3?=
 =?us-ascii?Q?xzjxOP8/lbYNm7lDnHC0QmrVrXov6uhd5RDaMdKP7dYeHj8gWzOPbdZl/U/l?=
 =?us-ascii?Q?lde+0ysv0uXcs01GiYMZdk3kLByRKUOINoQ2h2R7x6I14EtsadW7laq5ScNh?=
 =?us-ascii?Q?jag=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wpUuvdAncwjVLtXtv5TcYwcRutOdrpMUYbLLtPvD0siONLNg9CnJLZkSPh95?=
 =?us-ascii?Q?DvXPv6B9hKLZ7dwHVcZBhEh9uevv9ddSkCEVWSpbwjpkiwZSU+FnSnkqB8ez?=
 =?us-ascii?Q?Kg/irq7ILOcLnmUO7H+7fLJrY66p4YCF+ZaNhrzivyZyFuyIoizxg/2Dxb1j?=
 =?us-ascii?Q?0Uc3hCWXkZvb/v1O1HpCOjKC01fI+GINJc95MVgix+foahnLe50bebK0nQwH?=
 =?us-ascii?Q?WLIW5VN6ZNElCje1NZ2cjNCtbxnYQVTdVd5DgtWBBCrWKw0t7gEi3luQH0Hq?=
 =?us-ascii?Q?1NBnwUFj8VsQeRUoNJEYrDqh5DlAwuju3EKQS2kCR3epVhbhSAe6CyM1a9vE?=
 =?us-ascii?Q?quHq/AbrQBjQSOaiy9vl9tFuRclIoZRfTuodYEqizV1doMv7fiT+TQUvt89q?=
 =?us-ascii?Q?tS02BvbEv1Wvttp/v2UChRHkn2n9BWKaejY3iU0SUYfRdCS6FR4DRbP/My1f?=
 =?us-ascii?Q?VmM6zS7h8lXJrBpPCMtAQcOeE5+aMk/4BmRv8r16yNtdj9dabCGVDiSimBFd?=
 =?us-ascii?Q?+nMhqTv2URK3EQ6DnsbU94gTZBgo5u3m94BorXztTi3Uk/+4DfnypBd/8q2f?=
 =?us-ascii?Q?w73do/v8/2j548YDcRic2r/VhLZEfKd5xUb4TJwq34mMbBQmqzQK9x/eJmL9?=
 =?us-ascii?Q?L2I7oobobSy4qpjIut01EHzGUSEDkvwMrtMwlLqG2BHcVt79uRUVmQ9UPTUW?=
 =?us-ascii?Q?btO0CjXNYP/DUSknqbBK3XCScbyL30fM8LUzRlM2IZZ43Bd8j+Gq7qRt+lY1?=
 =?us-ascii?Q?LDTsZBvv3OIAgWvFvNWfgP9oDzjBMGlf4dMindjBwWKNq96GeI3lua6xSXwp?=
 =?us-ascii?Q?k0Tj1V3KZ1yNj4OPq6sR4tRxd7d60dvqhK+Xmol5L/nxbscDDCLIcm3f8+bc?=
 =?us-ascii?Q?0ixi1/vMKdzhA91kYYZaocYPZx+LS4FTcXJTdwnxV5iXidIjlboPTY/9hOay?=
 =?us-ascii?Q?KNfMo9sm7PI+BzqBr5sCtUoJXqkx+8HLWcm9/67NA/3BRlSglLfffPxQaGuZ?=
 =?us-ascii?Q?e/b2yka79B4sP1BtXWPAGCgZBDHFYdZPw8z0foAt+yQdrre2Povhx93yD1HY?=
 =?us-ascii?Q?/ZPrmslWmI2x8MAQTp6/a8WIbgOITkrRdUEpfOj/Cp0WbJrpAnzaKq22bepW?=
 =?us-ascii?Q?y8W9Ecv86wouYF4/egC6o6dm2PGoevikECJAYTdUl0FP5IzeQUT3w3gHigWw?=
 =?us-ascii?Q?9bXHdNkxBLCJuO3Bi7ZEige/H4lyEuyusrY1cg50/XttDtjZNfVPghZrAJfA?=
 =?us-ascii?Q?+3XL2xN9tHt9YTEUs4UHwU1RDHRTYiZXs0qyZ3xWAVZOgwTicMaTA+GIXqHC?=
 =?us-ascii?Q?wV1gCU5+ztw3qekDCr3byX54iJdBWGMH2T4pSWJYCOHyYWHlp16LEMRHsoqA?=
 =?us-ascii?Q?qq+6aZT0orVL79C1eN+5F1fqcXVE2o7lVfZV+T3tjWPj/+ri3KUK/kjLmIYB?=
 =?us-ascii?Q?RXpm1cojriOxudQuQXwRa+4EZLhWfDzLt8yV6XLu8SGpXa7RS9Z1crAfS+Vi?=
 =?us-ascii?Q?52vm2xom8HeEC421pmBVufaYCuQEmIqpX9PDkChciNLhmYGXCcKqASsoSZZa?=
 =?us-ascii?Q?5vcrEOKfl3WVop5d5DAOnkOcdsIFMP8V//OVt2PO3LmiYN9AuK6OWJPrWpuS?=
 =?us-ascii?Q?6w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b11f11e-9a76-4e86-780b-08dca0a6b4f3
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2024 06:08:24.1796 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XHIBlZUe0hVHloyE196XU2kY3IsW6llCK/uUa5C26gc7fLcgBL9CwGwX1bp+fKEGyQozXh6INm1ji0gptB9Pr0eDp4gBTZ0o4ujUDqq2Ouc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6353
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

On Wed, Jul 10, 2024 at 01:49:41PM GMT, Jiapeng Chong wrote:
>./drivers/gpu/drm/xe/xe_gt.c: generated/xe_wa_oob.h is included more than once.
>
>Reported-by: Abaci Robot <abaci@linux.alibaba.com>
>Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=9493
>Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>

thanks, but a similar patch got merged yesterday:
https://lore.kernel.org/intel-xe/20240708173301.1543871-1-lucas.demarchi@intel.com/#r

Lucas De Marchi
