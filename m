Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8Ai2CiyijGlhrwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 16:37:16 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 624C8125BD0
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 16:37:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B34B910E616;
	Wed, 11 Feb 2026 15:37:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Nyubs++y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7295810E616;
 Wed, 11 Feb 2026 15:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770824230; x=1802360230;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=4TScG971C5cuTP7xBa4NPkPX69kJjf+4jTR15I0U+zM=;
 b=Nyubs++ypmczVkcDRDLBGkCNN/Km6LaiFp744Rr6Ref6GhghY5qhA5Go
 qCZyQmlqB47trP0OJqhraoXjrhMf2firfg1shrPGW9A0C72/d44abwxIT
 ftzxIoxFy34KjBj/F6zYZ2yCae86LnPLQfUvq9TzgO+q0wZnH3ViI0wIY
 oFXrjEpPtAQTE5q8CkCUv66qGkJZ2jc3WGYFSWhLbMBGL3EVnGilQEYM9
 W3qrXPnzjVO5EO9PL/UEmsFFxfE4QN3I0qQGQrOi3+3fwXd5x42KOniuw
 8+fJx5uMNQcf7BRqrNR/RD/FyxJjBfarjkv2zZCnh4BPH4+0qxpV76bf0 Q==;
X-CSE-ConnectionGUID: y59sSUuRSbmgSKiIrTkLAA==
X-CSE-MsgGUID: eq2U5ZUyQCWKIKynt6sRCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="71179289"
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; d="scan'208";a="71179289"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 07:37:09 -0800
X-CSE-ConnectionGUID: LkPQPPEFQqKvmzG4oiGawQ==
X-CSE-MsgGUID: WEx6IF9OQnW4JSMwz1upAA==
X-Ironport-Invalid-End-Of-Message: True
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; d="scan'208";a="216429421"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 07:37:09 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 11 Feb 2026 07:37:08 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 11 Feb 2026 07:37:08 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.3) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 11 Feb 2026 07:37:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UOqYkQfQfyt7tePkk7s5I+Wj7UUDtfq0fZR9qAssf+umrS8hJ2Fc9EHTjQBhOC+05HLo+rOAkreokv+2eefy/Yvv+AX1S5sg0IbVCnFMpUnaYniILhFujn9QfMQGo7KCt3rFPFIAuDk5M+bv4IW5FU105epumBwiTEhl/Il+wuD3xa/FtRtD+h0EXasKbMFIuQuTj9GkRMWc0uKCuSY5AugXmhkNL1wqsvGlm2YdWGf/2w1YZ9oYCM53fb0TBT4z49GOaatM1R7yPWji/yayXFaiKUFiF5zIB/XK5LZw7huxgeZLDKWWiTMjbrUYn8PW6CxsJOFIs29PcH31Joy9CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nE5OcmCyoq5rS95BlnrHrt0CPnJQEkdxly/1VXZFnH0=;
 b=Z8vP69Jao8gjmVC+loEyR8F1XsyJOHD3MtIvZjx/0nBzUUSTC1dp0rCFVc3PuyNamvP6MjbquuCCT2tGGqtO1NKLINqPEk+6bZI4nwxrgS3r2fjTvifpO61Ec5ryYoxEY7iPVhVc6MLRtW1fBXsa+nSDoXsAghW6y+t/Iu4xrJLixfVNWafExDJGjUf6ul6cdlQJ5gwfcTuQ21fH04kuMhkGQRWoEcrTS0eF68UVI4kCk5eAmUp60BB2ub/tRBwSvub5H6w+wXesFgV8vDtfO9B/aaBy/nHc9CjqYxyf7FtEGEJqPcN8fuERkXppIFschagyYrk7oUL62Yraf2oOLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by BL1PR11MB5287.namprd11.prod.outlook.com (2603:10b6:208:31b::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Wed, 11 Feb
 2026 15:37:04 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%6]) with mapi id 15.20.9587.017; Wed, 11 Feb 2026
 15:37:04 +0000
Date: Wed, 11 Feb 2026 07:37:01 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <leonro@nvidia.com>, <jgg@ziepe.ca>, <francois.dugast@intel.com>,
 <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH v4 4/4] drm/pagemap: Use dma-map IOVA alloc, link, and
 sync API for DRM pagemap
Message-ID: <aYyiHQ0avcRcti8l@lstrano-desk.jf.intel.com>
References: <20260205041921.3781292-1-matthew.brost@intel.com>
 <20260205041921.3781292-5-matthew.brost@intel.com>
 <6289525edef2a1dca5d9de325ad0efbc1cb79a38.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6289525edef2a1dca5d9de325ad0efbc1cb79a38.camel@linux.intel.com>
X-ClientProxiedBy: MW4PR04CA0235.namprd04.prod.outlook.com
 (2603:10b6:303:87::30) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|BL1PR11MB5287:EE_
X-MS-Office365-Filtering-Correlation-Id: ed7d40c3-c991-4328-154b-08de6983683d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?x0KsP6ZpZAYzGkdS/YLDVxeqW/cdagtdqLoCBev3ELM7Kva/5e6jOO/iEf?=
 =?iso-8859-1?Q?v76lQ2haqUOoAqrWkYio+jivPuEwGhPiTHujwSxwTuMZDV5vDd9/B56u4o?=
 =?iso-8859-1?Q?TXERu5vUT2pLnmNmuU3jgprwEEuJaQVyqhgh8tpupG4SSSYRnasC1xRl+Q?=
 =?iso-8859-1?Q?22Bd4Enpx892WdMQbgFG4imAEqVFZtu4C7QgBqMAvFqfvpwAYJfcXMj100?=
 =?iso-8859-1?Q?7NA8LCh2DWdyj+Ff6WoLrO4FVT1CGdIEYssyl5MC8zilJXG0ALNLVObnAt?=
 =?iso-8859-1?Q?VukCti7Qjgs5qPu/nVypSXWKNns3BU8/WFoqwV0Nmz7Ih++HQmPhDfQN9t?=
 =?iso-8859-1?Q?MHC1gzaSoi19gZ9cicwIByF7FBi4nD4TZg25Z7KhBEzYsDfuZ4MTxaRBv0?=
 =?iso-8859-1?Q?aR7+mZxb3ZWksjzp8vlVQObkAmGPryhnOhpXKXCBDC0p8nGK84/Q4jIIEz?=
 =?iso-8859-1?Q?K5AnNDsQBR+8FEQzjPqBQBp/yeU3bSEp0EIrJRYC/F/9sh3IEWzdNERXuS?=
 =?iso-8859-1?Q?LAfaDd98ZQsr6R0RUMhXh4mIJWi0aMVaUbuOHb8XIyTpUCzN5a+Ba/90gK?=
 =?iso-8859-1?Q?ym+jLa055RStOIZC+vrpZKRbnbsWi/ZuYNBf9mM/Mu/S/bpGiNzRk/D7S+?=
 =?iso-8859-1?Q?VuI6v5+xrpZTazyYmTSkRuuuKbCLGDp9IoIAZmfRdQWZSvYxeyKmw7z4gN?=
 =?iso-8859-1?Q?Jmmtrucnp88wGYOrFZXZlLaEZWIm4lfwREaW5UxLnfhhko9EHPrFBLRNDW?=
 =?iso-8859-1?Q?Ak11ID9y/aD9ml5EM/MyyoS8vac+JqeAogX2xYDo3j0/f6NVWwa4ytVKH3?=
 =?iso-8859-1?Q?nYS8+xnIFb5eyE3C5N6ZdMeGoFpKjuS/Z+TMUsavggjwF/C5VE003YEDYE?=
 =?iso-8859-1?Q?NMS46ptn/BLQobgpX25p19zMKiWIY/RtobHAFLW6QYic4RD77OtrwWMow/?=
 =?iso-8859-1?Q?SXky4w12030fcL4w0p/YWKOFMdmOSctOSVbxcaRZfBlB59YO2evl4cPbdk?=
 =?iso-8859-1?Q?VNCJsdNkrKoRZC7+mvdgDRjfkQ48LfWOPwTfte6HpvfXS/fAGGZ14u1yhG?=
 =?iso-8859-1?Q?M/ojJwS8gFkb0eh3OBOlE8YMLSyEyjyP6N/Qr094TPoTB+7oB/Z+DHhztc?=
 =?iso-8859-1?Q?KY0nc2lQr8V4u3JslH93Zuy9jiZL6Ajiyu2s02HHIs64h/WoCQt27j6qpa?=
 =?iso-8859-1?Q?BRlPjBEiYea7nz5Z4vlsV7749QTlF6wqAYAXrQQsm8ytffaBxIilAf9IQz?=
 =?iso-8859-1?Q?rCi/vJAuHqASLpGjFGB6u25bgbySaEb7RUG3S0vqjGoVkezyP7PTP47x0o?=
 =?iso-8859-1?Q?Qq7YJ3exUmwDllIxRqrAHHvqIi+AYYlyhPOFTM8iEq9gN7bIBihYYshZSL?=
 =?iso-8859-1?Q?p1l+BhLb6dSvqRfmZbii+AaBdNxpSuHhy4eiR0166kAFvaVNyxer5KUvuY?=
 =?iso-8859-1?Q?ydt5RylYQK0P2UpTIZmjfXf0sdA6EQmJQMdLiOsApQodmpGMQc2GDZLgB8?=
 =?iso-8859-1?Q?6wiPeN5bLFtkT0ESk5DT23czdT9digImc6oAw/XtzhcdQ8xrXeU1AYR1Hb?=
 =?iso-8859-1?Q?ClKri4X5/whW+BrdLAcAqnVk8M7Tf+VpJOTC+65HAvhs8LfhGVbH1M/tCD?=
 =?iso-8859-1?Q?G9VJ467aVM5lk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?R3BhYunq4tFwz0NDnWjiw68QpAD/YU6tj5NKKU02H6SH6PFu2aUwBkLQj5?=
 =?iso-8859-1?Q?egAL/k8Wkji24CQ/qGYEX5V4Ejimza+Rq2SyjXQl4hxU/wSN4SLXkuHdi/?=
 =?iso-8859-1?Q?Wfv7cOB4kqUEVfM/FOIYUnfKzGSecwwUO4b++qNgbAzjNdECr45XsKDpAV?=
 =?iso-8859-1?Q?XPKKZRzBYh7OgimH4yKIrIlbxoIk7FFaWN5W/3Icwy8Ma4oKkLi14VlChj?=
 =?iso-8859-1?Q?jQ6s8oXsVAAOnA37Rb8PNwFLqz6nojIjSOxEAHSsiy5IEwOG8gN4dCOz1i?=
 =?iso-8859-1?Q?1wao/RQlyuyYvIOGFMFAfeBYjebnP+T/XBLynSDboJ4fF5mgmY9AQUMDpZ?=
 =?iso-8859-1?Q?mE/kyVFkRT9om0DAK2dxqXefA0uYSoUZsyWkjTfZYRoFCUMowvzqJ3xCEg?=
 =?iso-8859-1?Q?CZqzg4ddoCktU7PmqFPYbI2MbNApOkWoWK27Kl2YWAsjsX5vNjg3jBiJ7h?=
 =?iso-8859-1?Q?9t7sm9PDrvdyl/s+SUnz206qrDuVx9JbDWd+vMSgcGZpKFuvzA+yoLFWvf?=
 =?iso-8859-1?Q?8PYOtPzcnOKDXTfN4XjbkBtcSrmUQOKkAX8Hjv05q9x0Toe1WMfoNZrhf4?=
 =?iso-8859-1?Q?/uTwN4yyvGFNv5avhO7zKHcyy0oIajd+rOVNTkEhQly/HB0BXQv7y6C2Hg?=
 =?iso-8859-1?Q?zR+AEJSLqvQQ4JsN0/pzdNHX1rolh9LVabK7mYlabQ3oleva7h1H8cemWP?=
 =?iso-8859-1?Q?TLtsIfaEyN+naVzTADdnvXvv6SLyPf0UyF8peLq1xRs97QouguW5Xpcz6a?=
 =?iso-8859-1?Q?OV5WCEZAIAojOKiL9fa2Jy9C6y4ZDyLlPpW2Dp2icXTRBCsb+sQzxYM3A0?=
 =?iso-8859-1?Q?oCMkcVjNgTeraDeQvHb3XlFcA05buZb8y8yzROOkIVINWM7vLRo64FjU4e?=
 =?iso-8859-1?Q?/XGD3y25vhqspZle2DFXL7eb44ddeRRtH8CTXs4DbS0SGAECmPtd4uDnzo?=
 =?iso-8859-1?Q?pfg54ZX3rSiDHW80AMJ9dHjMz3dpspUHkLg4JnU+RxkEaUZHhFQpg2zyQs?=
 =?iso-8859-1?Q?ltqAXxgBvFZglVZ+Wc5UNzzPNHnd1TeQOsgMeHcz3+7rOBSK29BjzE/Q4t?=
 =?iso-8859-1?Q?imMllrq71C4Ez6s6ibiCpr+U34lZvkJIxvtBsiBrt8yog0Oqpj9hrWs+Ae?=
 =?iso-8859-1?Q?D/53t8O86OLAYZozck0phIwZzpXck5UswOyqX91qua56Ll9mR+q6Mvyrew?=
 =?iso-8859-1?Q?F4/l93FvHMKWwb8AFu3ky8sPBMtfVzs1H8QmaAMim5BTYEiQIKwDTq2e0D?=
 =?iso-8859-1?Q?qq+2G0xQv09MFsVpKcv2CVfudEe4HalV/rwOhI7EwfFzZJR68kKAuu3tyS?=
 =?iso-8859-1?Q?uSk3oBdl+TnkzvI1godhLIOERxEnCnFS1x/ZT+JKQL0WdowKh5xdlwmWzV?=
 =?iso-8859-1?Q?FU8jQT7zMzE18+g+Ha0OYEQnYpjWKnj/8fukuYwcCQIHVcKNXdyE2kTszG?=
 =?iso-8859-1?Q?X5II5o4kOhiUOb3YHqB6Ib6TAMoDkTu9foKkGzdQbsf6BqxzjnIaj68sWW?=
 =?iso-8859-1?Q?MorrGWBRSz8eXWZTJQ7hDGSbCzt/hKZR7MESYwyAJXvJZjD6c88uXnvjr+?=
 =?iso-8859-1?Q?ZljgC0IPwKhzWLTC7Jv7llGQODiFjkc/jmfsrYAjgdatvrk7LcuC3bH+yP?=
 =?iso-8859-1?Q?bblSqjwiPPckB1xV/Hfd41i6y8hU/WPmA0Zkd0kHPEipDwOl4yWE53otiq?=
 =?iso-8859-1?Q?pAoCcvOYk3afMi3a1kIn+QZroBISaCwb8e50MPQAtHDWxmN6lTUsFZd60o?=
 =?iso-8859-1?Q?rrHUV6CQDZoxHQYd5gXivsbn9KqzLksj6MEyDGaEhYkykcyrYk6tVw+OQV?=
 =?iso-8859-1?Q?AC28lTZdhQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ed7d40c3-c991-4328-154b-08de6983683d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 15:37:04.5595 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mEy1zyighcTHD2oBLT7Akjg9A9NdIHlAR/1kxHjKrMb2PN2dHtvezxuS5TgfGz5WudU+nVkN80x4HNW1bFqgGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5287
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
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim];
	RCVD_COUNT_SEVEN(0.00)[9];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FROM_NEQ_ENVFROM(0.00)[matthew.brost@intel.com,dri-devel-bounces@lists.freedesktop.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+]
X-Rspamd-Queue-Id: 624C8125BD0
X-Rspamd-Action: no action

On Wed, Feb 11, 2026 at 12:34:12PM +0100, Thomas Hellström wrote:
> On Wed, 2026-02-04 at 20:19 -0800, Matthew Brost wrote:
> > The dma-map IOVA alloc, link, and sync APIs perform significantly
> > better
> > than dma-map / dma-unmap, as they avoid costly IOMMU
> > synchronizations.
> > This difference is especially noticeable when mapping a 2MB region in
> > 4KB pages.
> > 
> > Use the IOVA alloc, link, and sync APIs for DRM pagemap, which create
> > DMA
> > mappings between the CPU and GPU for copying data.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> > v4:
> >  - Pack IOVA and drop dummy page (Jason)
> > 
> >  drivers/gpu/drm/drm_pagemap.c | 84 +++++++++++++++++++++++++++++----
> > --
> >  1 file changed, 70 insertions(+), 14 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_pagemap.c
> > b/drivers/gpu/drm/drm_pagemap.c
> > index 29677b19bb69..52a196bc8459 100644
> > --- a/drivers/gpu/drm/drm_pagemap.c
> > +++ b/drivers/gpu/drm/drm_pagemap.c
> > @@ -280,6 +280,20 @@ drm_pagemap_migrate_map_device_pages(struct
> > device *dev,
> >  	return 0;
> >  }
> >  
> > +/**
> > + * struct drm_pagemap_iova_state - DRM pagemap IOVA state
> > + *
> 
> No newline 
> 

+1

> > + * @dma_state: DMA IOVA state.
> > + * @offset: Current offset in IOVA.
> > + *
> > + * This structure acts as an iterator for packing all IOVA addresses
> > within a
> > + * contiguous range.
> > + */
> > +struct drm_pagemap_iova_state {
> > +	struct dma_iova_state dma_state;
> > +	unsigned long offset;
> > +};
> > +
> >  /**
> >   * drm_pagemap_migrate_map_system_pages() - Map system migration
> > pages for GPU SVM migration
> >   * @dev: The device performing the migration.
> > @@ -287,6 +301,7 @@ drm_pagemap_migrate_map_device_pages(struct
> > device *dev,
> >   * @migrate_pfn: Array of page frame numbers of system pages or peer
> > pages to map.
> >   * @npages: Number of system pages or peer pages to map.
> >   * @dir: Direction of data transfer (e.g., DMA_BIDIRECTIONAL)
> > + * @state: DMA IOVA state for mapping.
> >   *
> >   * This function maps pages of memory for migration usage in GPU
> > SVM. It
> >   * iterates over each page frame number provided in @migrate_pfn,
> > maps the
> > @@ -300,9 +315,11 @@ drm_pagemap_migrate_map_system_pages(struct
> > device *dev,
> >  				     struct drm_pagemap_addr
> > *pagemap_addr,
> >  				     unsigned long *migrate_pfn,
> >  				     unsigned long npages,
> > -				     enum dma_data_direction dir)
> > +				     enum dma_data_direction dir,
> > +				     struct drm_pagemap_iova_state
> > *state)
> >  {
> >  	unsigned long i;
> > +	bool try_alloc = false;
> >  
> >  	for (i = 0; i < npages;) {
> >  		struct page *page =
> > migrate_pfn_to_page(migrate_pfn[i]);
> > @@ -317,9 +334,31 @@ drm_pagemap_migrate_map_system_pages(struct
> > device *dev,
> >  		folio = page_folio(page);
> >  		order = folio_order(folio);
> >  
> > -		dma_addr = dma_map_page(dev, page, 0,
> > page_size(page), dir);
> > -		if (dma_mapping_error(dev, dma_addr))
> > -			return -EFAULT;
> > +		if (!try_alloc) {
> > +			dma_iova_try_alloc(dev, &state->dma_state,
> > +					   npages * PAGE_SIZE >=
> > +					   HPAGE_PMD_SIZE ?
> > +					   HPAGE_PMD_SIZE : 0,
> > +					   npages * PAGE_SIZE);
> > +			try_alloc = true;
> > +		}
> 
> What happens if dma_iova_try_alloc() fails for all i < some value x and
> then suddenly succeeds for i == x? While the below code looks correct,

We only try to alloc on the first valid page - 'i' may be any value
based on the first page found  or we may never alloc if the number of
pages found == 0 (possible, hence why it is inside the loop). This step
is done at most once. If the allocation fails, we use the map_page path
for the remaining loop iterations.

> I figure we'd allocate a too large IOVA region and possibly get the
> alignment wrong?

The first and only IOVA allocation attempts an aligned allocation. What
can happen is only a subset of the IOVA is used for the copy but we pack
in the pages starting at IOVA[0] and end at IOVA[number valid pages - 1].

Matt

> 
> Otherwise LGTM.
> 
> 
> > +
> > +		if (dma_use_iova(&state->dma_state)) {
> > +			int err = dma_iova_link(dev, &state-
> > >dma_state,
> > +						page_to_phys(page),
> > +						state->offset,
> > page_size(page),
> > +						dir, 0);
> > +			if (err)
> > +				return err;
> > +
> > +			dma_addr = state->dma_state.addr + state-
> > >offset;
> > +			state->offset += page_size(page);
> > +		} else {
> > +			dma_addr = dma_map_page(dev, page, 0,
> > page_size(page),
> > +						dir);
> > +			if (dma_mapping_error(dev, dma_addr))
> > +				return -EFAULT;
> > +		}
> >  
> >  		pagemap_addr[i] =
> >  			drm_pagemap_addr_encode(dma_addr,
> > @@ -330,6 +369,9 @@ drm_pagemap_migrate_map_system_pages(struct
> > device *dev,
> >  		i += NR_PAGES(order);
> >  	}
> >  
> > +	if (dma_use_iova(&state->dma_state))
> > +		return dma_iova_sync(dev, &state->dma_state, 0,
> > state->offset);
> > +
> >  	return 0;
> >  }
> >  
> > @@ -341,6 +383,7 @@ drm_pagemap_migrate_map_system_pages(struct
> > device *dev,
> >   * @pagemap_addr: Array of DMA information corresponding to mapped
> > pages
> >   * @npages: Number of pages to unmap
> >   * @dir: Direction of data transfer (e.g., DMA_BIDIRECTIONAL)
> > + * @state: DMA IOVA state for mapping.
> >   *
> >   * This function unmaps previously mapped pages of memory for GPU
> > Shared Virtual
> >   * Memory (SVM). It iterates over each DMA address provided in
> > @dma_addr, checks
> > @@ -350,10 +393,17 @@ static void
> > drm_pagemap_migrate_unmap_pages(struct device *dev,
> >  					    struct drm_pagemap_addr
> > *pagemap_addr,
> >  					    unsigned long
> > *migrate_pfn,
> >  					    unsigned long npages,
> > -					    enum dma_data_direction
> > dir)
> > +					    enum dma_data_direction
> > dir,
> > +					    struct
> > drm_pagemap_iova_state *state)
> >  {
> >  	unsigned long i;
> >  
> > +	if (state && dma_use_iova(&state->dma_state)) {
> > +		dma_iova_unlink(dev, &state->dma_state, 0, state-
> > >offset, dir, 0);
> > +		dma_iova_free(dev, &state->dma_state);
> > +		return;
> > +	}
> > +
> >  	for (i = 0; i < npages;) {
> >  		struct page *page =
> > migrate_pfn_to_page(migrate_pfn[i]);
> >  
> > @@ -406,7 +456,7 @@ drm_pagemap_migrate_remote_to_local(struct
> > drm_pagemap_devmem *devmem,
> >  			       devmem->pre_migrate_fence);
> >  out:
> >  	drm_pagemap_migrate_unmap_pages(remote_device, pagemap_addr,
> > local_pfns,
> > -					npages, DMA_FROM_DEVICE);
> > +					npages, DMA_FROM_DEVICE,
> > NULL);
> >  	return err;
> >  }
> >  
> > @@ -416,11 +466,13 @@ drm_pagemap_migrate_sys_to_dev(struct
> > drm_pagemap_devmem *devmem,
> >  			       struct page *local_pages[],
> >  			       struct drm_pagemap_addr
> > pagemap_addr[],
> >  			       unsigned long npages,
> > -			       const struct drm_pagemap_devmem_ops
> > *ops)
> > +			       const struct drm_pagemap_devmem_ops
> > *ops,
> > +			       struct drm_pagemap_iova_state *state)
> >  {
> >  	int err = drm_pagemap_migrate_map_system_pages(devmem->dev,
> >  						       pagemap_addr,
> > sys_pfns,
> > -						       npages,
> > DMA_TO_DEVICE);
> > +						       npages,
> > DMA_TO_DEVICE,
> > +						       state);
> >  
> >  	if (err)
> >  		goto out;
> > @@ -429,7 +481,7 @@ drm_pagemap_migrate_sys_to_dev(struct
> > drm_pagemap_devmem *devmem,
> >  				  devmem->pre_migrate_fence);
> >  out:
> >  	drm_pagemap_migrate_unmap_pages(devmem->dev, pagemap_addr,
> > sys_pfns, npages,
> > -					DMA_TO_DEVICE);
> > +					DMA_TO_DEVICE, state);
> >  	return err;
> >  }
> >  
> > @@ -457,6 +509,7 @@ static int drm_pagemap_migrate_range(struct
> > drm_pagemap_devmem *devmem,
> >  				     const struct migrate_range_loc
> > *cur,
> >  				     const struct
> > drm_pagemap_migrate_details *mdetails)
> >  {
> > +	struct drm_pagemap_iova_state state = {};
> >  	int ret = 0;
> >  
> >  	if (cur->start == 0)
> > @@ -484,7 +537,7 @@ static int drm_pagemap_migrate_range(struct
> > drm_pagemap_devmem *devmem,
> >  						     &pages[last-
> > >start],
> >  						    
> > &pagemap_addr[last->start],
> >  						     cur->start -
> > last->start,
> > -						     last->ops);
> > +						     last->ops,
> > &state);
> >  
> >  out:
> >  	*last = *cur;
> > @@ -1001,6 +1054,7 @@ EXPORT_SYMBOL(drm_pagemap_put);
> >  int drm_pagemap_evict_to_ram(struct drm_pagemap_devmem
> > *devmem_allocation)
> >  {
> >  	const struct drm_pagemap_devmem_ops *ops =
> > devmem_allocation->ops;
> > +	struct drm_pagemap_iova_state state = {};
> >  	unsigned long npages, mpages = 0;
> >  	struct page **pages;
> >  	unsigned long *src, *dst;
> > @@ -1042,7 +1096,7 @@ int drm_pagemap_evict_to_ram(struct
> > drm_pagemap_devmem *devmem_allocation)
> >  	err =
> > drm_pagemap_migrate_map_system_pages(devmem_allocation->dev,
> >  						   pagemap_addr,
> >  						   dst, npages,
> > -						   DMA_FROM_DEVICE);
> > +						   DMA_FROM_DEVICE,
> > &state);
> >  	if (err)
> >  		goto err_finalize;
> >  
> > @@ -1059,7 +1113,7 @@ int drm_pagemap_evict_to_ram(struct
> > drm_pagemap_devmem *devmem_allocation)
> >  	migrate_device_pages(src, dst, npages);
> >  	migrate_device_finalize(src, dst, npages);
> >  	drm_pagemap_migrate_unmap_pages(devmem_allocation->dev,
> > pagemap_addr, dst, npages,
> > -					DMA_FROM_DEVICE);
> > +					DMA_FROM_DEVICE, &state);
> >  
> >  err_free:
> >  	kvfree(buf);
> > @@ -1103,6 +1157,7 @@ static int __drm_pagemap_migrate_to_ram(struct
> > vm_area_struct *vas,
> >  		MIGRATE_VMA_SELECT_DEVICE_COHERENT,
> >  		.fault_page	= page,
> >  	};
> > +	struct drm_pagemap_iova_state state = {};
> >  	struct drm_pagemap_zdd *zdd;
> >  	const struct drm_pagemap_devmem_ops *ops;
> >  	struct device *dev = NULL;
> > @@ -1162,7 +1217,7 @@ static int __drm_pagemap_migrate_to_ram(struct
> > vm_area_struct *vas,
> >  
> >  	err = drm_pagemap_migrate_map_system_pages(dev,
> > pagemap_addr,
> >  						   migrate.dst,
> > npages,
> > -						   DMA_FROM_DEVICE);
> > +						   DMA_FROM_DEVICE,
> > &state);
> >  	if (err)
> >  		goto err_finalize;
> >  
> > @@ -1180,7 +1235,8 @@ static int __drm_pagemap_migrate_to_ram(struct
> > vm_area_struct *vas,
> >  	migrate_vma_finalize(&migrate);
> >  	if (dev)
> >  		drm_pagemap_migrate_unmap_pages(dev, pagemap_addr,
> > migrate.dst,
> > -						npages,
> > DMA_FROM_DEVICE);
> > +						npages,
> > DMA_FROM_DEVICE,
> > +						&state);
> >  err_free:
> >  	kvfree(buf);
> >  err_out:
