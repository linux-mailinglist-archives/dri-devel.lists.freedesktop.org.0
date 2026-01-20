Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aHkjCvXDb2lsMQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 19:05:41 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E56E49161
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 19:05:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B926110E641;
	Tue, 20 Jan 2026 18:05:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="houwN8pT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 081D810E63E;
 Tue, 20 Jan 2026 18:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768932336; x=1800468336;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=wlabJEcWsiOkmnmMqrlWpVvA2BQaashTIZnzLGk5Y0c=;
 b=houwN8pTaDCcK7BWnmYDN8j2Ug4OO+RhXVGDKP3HBJGdVBPDxV+m0MNS
 IIoDjG1e8Kk9hkdzQVqR6IEwCwa4feENfPk3y0y2XErVmD8QFGI2eRxYw
 GcA75ahveHNfwMz5CECeraDoYCyRC1CN3Yo6yRY4x8q6b9nqtlO9WWDQy
 zPrV8pblPVJlFs55zkYdNZqD2SB/AWmmR7ePM+3yQaTZGSYhROdKHEWMn
 vMUdt7rnnkBjoZn3pvdFo3rUGZl0ZgktBg4wb/j/L6vTyYAc7gxdgiVDW
 WsKjU+07AquMezPOasqElacrD+N5KKe1DegOjOAsxBNorzMtNwH2GT9Pi g==;
X-CSE-ConnectionGUID: 1j6ZdUUNTdyV4y8Sner6nw==
X-CSE-MsgGUID: 7PZzBEQJRYCohFSFJiXnZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="87729519"
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; d="scan'208";a="87729519"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 10:05:36 -0800
X-CSE-ConnectionGUID: vhMUXq+AQrC6MFWo/oflQg==
X-CSE-MsgGUID: g0QAfgCPQiiWxogle0/3oA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; d="scan'208";a="206240607"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 10:05:35 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 10:05:34 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 20 Jan 2026 10:05:34 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.49) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 10:05:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KT6rsQqHAMP19cLk49OyfGndahONY5lSSv2w4GLzDx8+TylL3s9qzP+FicYaUR18u9UOFMA29JKTa0wNMTumA4k8T8bvrDs4BLazhDWgBMAg6gdyS8BxGDTPlUKu3wqZDwCZuHfKIVMY71htEm5RYBk98pI/Ta2SLm9q8sUibo6Zq5RlWyhrp4YoLUymtOjesNGznENzYl9w9/PkxzXBwm8VYcugArg1GPz+lrWCcm5p9Hp0Cv2QGs8m302WjwDrTcP8lkVfKPsneKVlmJajhdCjWW3aTf4cF34LPcsB3orG+DFSWuww8LZVaiBPvwTohOqxshYVzK16Xuif8IpUxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tHCxMYU2zO96r3t4M3NUN/FgEO6/3bapsiiA9Dnl/PU=;
 b=Uw5I+RszfN9/ROwoSYmOLzmtyaLHRp8gIMLwMU1XcPt+Z3FsM6ilMOM6sE/4IeqeVD6CQTTJPpTUuA37lvQ7ukzSuFmP6KgQndiCsET5uuLvTD9yPaHtX5CUyaDXi+3Q6Jsrey+y2YmluSklLSVaz00A++3QzuDtBeCXuEmrgaXjXXt9kPWr7/DcX/O24N8bfi867Uqtt75LjHs8LOe6YXYoNALIAbv0F6UQEIGR9Qd5q7pX+bGiOlGiJrP4whQ6lDqik4g9Y5GuA4QTq1Ff7spnqQop5ykpgPNaLnjvZyTVAeVswb4wWU9PVSmWokp3UXOmV49XN/VFYlDD4X6UTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by LV2PR11MB5999.namprd11.prod.outlook.com (2603:10b6:408:17d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Tue, 20 Jan
 2026 18:05:32 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9456.015; Tue, 20 Jan 2026
 18:05:32 +0000
Date: Tue, 20 Jan 2026 10:05:29 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Auld <matthew.auld@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, <dri-devel@lists.freedesktop.org>,
 <stable@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] drm, drm/xe: Fix xe userptr in the absence of
 CONFIG_DEVICE_PRIVATE
Message-ID: <aW/D6ehR6DB2SVlf@lstrano-desk.jf.intel.com>
References: <20260120143459.9485-1-thomas.hellstrom@linux.intel.com>
 <20260120143459.9485-2-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260120143459.9485-2-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: MW4PR03CA0226.namprd03.prod.outlook.com
 (2603:10b6:303:b9::21) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|LV2PR11MB5999:EE_
X-MS-Office365-Filtering-Correlation-Id: ce18b488-a063-4f6d-dab7-08de584e809e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?PVr+MUOoZvbqL8VWxWe0bt0yDIHWQTReWzEN2nf4o2YWyrsfRHKprdbu4b?=
 =?iso-8859-1?Q?pcHLzPeIUpc40++YsMXyhu5F/NQpB2jxG1GYNTFd9aYQloQ/EnxgDGsVW8?=
 =?iso-8859-1?Q?sZlVSHK7wW4kGunonlazSwMfTiBvg79XRTS3J42pfF67uUMQIUEvRWgFe9?=
 =?iso-8859-1?Q?WuJVrGDbQxT8EGZMP1xHAO7jOUVnLXeBWf3on9nAMshr//bQ7vJDmjw6m8?=
 =?iso-8859-1?Q?KRJk5hb2Deby18UQQKY21rRDm0Pwi5mcET7CSsuKCpJV4EGf0Hok380UCL?=
 =?iso-8859-1?Q?O2EqZKEiK5wXr3Q3cHdbUN+BVTN1CXzNNnGTw1MDYfUGw2ih2XkRmk1RmZ?=
 =?iso-8859-1?Q?BhE1WoU8fdMFdFd99JqAjkSMBLerj0AWWesoz4kQmvHqGqVMPHNCAUauDs?=
 =?iso-8859-1?Q?jdMxff+ugzT2g2ZL8gCOAfgsNYF7V2jxfrfjfUQNuXAXfHi3bsZnvlge7S?=
 =?iso-8859-1?Q?PDzisknSv3thGVAV6d0flxHfWlXQxwtC7geYL4rLBkgANKz5yB6xn1H6jY?=
 =?iso-8859-1?Q?5eO5k01etIWkNhSyva0OvcjHgnWPmfZ1j1T3apOjZbYkSjJrEPWi0pEfE8?=
 =?iso-8859-1?Q?pBxi2lPjpQGxTW8ixZoL/bvHxovbiCJ2alc/xIqW0C3uFj+YFWs8XWFYR7?=
 =?iso-8859-1?Q?KDcZ6KTn9KN/5DHikytcVDmXRWI19ZxK6hzJsmFCWUFSe8WrwFxiWTM5tc?=
 =?iso-8859-1?Q?6UpycGDi+4SuIEAW77WKNHeOyO3DsyYLzJR0YwkqXcxVSIP/idsVRqNC6g?=
 =?iso-8859-1?Q?T9kPYOp/agIS7Am9cIDzCXm6wuIo5pFJDMprzCm3iSC9GxpoBnWk3GQEc8?=
 =?iso-8859-1?Q?GntcMYYI/+mKjvmdDMxtQgXDSWqPzotSCy3qbf02Qr2v1FhPYD64kgHI//?=
 =?iso-8859-1?Q?8AfqLpeoLtgkG6z9CZ0l7010QigYOlCG4fh7XatMm0YwCuxaUdkUphv35q?=
 =?iso-8859-1?Q?nY0SS05Os471CPfdHsfIsvQXsweWjq4MnpAIZulslDyUusw+iGN4I3cQR6?=
 =?iso-8859-1?Q?swHIat9egUT4AyZflY0kcANpI9NtWxxpiKqmS/gWYz2svV6TIRI9CggvMd?=
 =?iso-8859-1?Q?d8uYzsNoZvvTsQDGAw94/qkoF3UiLsyofPwrD4+mK0pE0RD9su0trFiMVK?=
 =?iso-8859-1?Q?C5rnZg+71QPrafPSwD7Zt+gZY/bjocXResLCvYlctpHjaXDfeSP5IRqoAF?=
 =?iso-8859-1?Q?RTNQ4hQQ8fLcG+drrk4BUBGQay6xw5lGlmL2l0D07tCiRVmHUHT9JCDOud?=
 =?iso-8859-1?Q?lCIqIa8CAbfCjHKmuBuGTb3BY9q+O18vPO2E34NhQDIZqMplZGPey26ngS?=
 =?iso-8859-1?Q?aw8eOTl0clxMJsD49ReVprLMvyDef4eMEkBuY3tRieDPRJIaMwew/ZBGEt?=
 =?iso-8859-1?Q?CQiC48vYfCHj5Bvfb0QQXYx2li1hoY/Trwp4AI6tBuXYpABDTiMQ+Ex7Nq?=
 =?iso-8859-1?Q?D8LM8Sz13N90lY2oBGIhjuxy5QG5km5E9uTbY4XgZ/P5b0FAbtxU41IYk0?=
 =?iso-8859-1?Q?efYe2q9753QGV4NLcnLBXJIFbeNTycT1JrSSiO0teiBeYskBun0bYs2BTY?=
 =?iso-8859-1?Q?sZK370c4k9SQAXYg+g3d/D9rztWmrTkY+09HjgUH6tpTkRSKFhv9+4bvnP?=
 =?iso-8859-1?Q?TW8dd1Bwotv3Y=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?CKWT4uBWcz30GTvFcVFZ659OOs6KFJdknnHj9qd6DfIMe9gUmcbOkbpRc7?=
 =?iso-8859-1?Q?Fdg9NHljKApQVxJyYm39CH81VajqFb+1PrXQYdphOMKRZY7WCk4BFlKbjf?=
 =?iso-8859-1?Q?+qGZQhBWP3Gs6u5u+chagGfOB4yxi9KVb42LHOvcA1JNycaxDWAao8uJds?=
 =?iso-8859-1?Q?KPQqH/+6A1+kNtL9RMt41zSQMUtxUlJzIkcYKGd5MZOBqpSoYI/TtCDJs3?=
 =?iso-8859-1?Q?VvFDSFGwfKLZUth6UdLI1FndB19htdVF0Ij5jId2EdSyCifEdxF1m0bZH3?=
 =?iso-8859-1?Q?24L0lN8q2srPQMoEvLKATnXxJvT/YtbnUzhqCAOMOlo2GcRX1qqNNLjhbw?=
 =?iso-8859-1?Q?V3GwwJ2qVlLuj+qnHNn+fRVcBLZgYCZbLdGiFOiBVnBRKDhQF53YAQDJGM?=
 =?iso-8859-1?Q?lDF4ApgutNGS3OzZsB4Cg3OxzlVfU5YlXblKXPhIKR8xlgiP8TnGpOQ86d?=
 =?iso-8859-1?Q?iY11E6UsfiGHr1Gq+IU0FuMQpWqx3IFKu8XvDROq3inGzxha2M5wQQBPdN?=
 =?iso-8859-1?Q?w5D27xlYt6O25fnP+h9vOW+9w8S2bZNhN3397yMZlfkwlacwYODd6cRJRg?=
 =?iso-8859-1?Q?D8WE/loDg0ZGxfZc3lc8SdTmWo09HwqxvGkeQLN4NmwWC8pOxu8ny7nUlQ?=
 =?iso-8859-1?Q?gp4e06VnVocWRatpoN0eEWeT69FQNql+Yf3QNDWO78RstGpFkWsG03zBpp?=
 =?iso-8859-1?Q?JwL79cDIVBkwzv3GEeoP7uhc2HIjJdYECAVE2G1nMX9AbTRRCTZIOkEH2A?=
 =?iso-8859-1?Q?E6q7QFTbyC0k5GcsCRm8CPzzijnIOG1dvvv5l5txEk+iBJUENqG4hf46CP?=
 =?iso-8859-1?Q?2wLd7FPa06n2UfCpJXWukuFzy4vy//GSlOcYoNLc/Ak+US1HciLgUrpzPQ?=
 =?iso-8859-1?Q?mJAAqZaDzZL/1h9YtRl+u9sy0nu/3vwk6t0Qn5jAJojvE9Wfa9c/RnwQbt?=
 =?iso-8859-1?Q?JNtQaNDVCdmWW8CLuSec+aVglGF9UeP06ahd0kDvgPxXRRs2qDn3lHhBMA?=
 =?iso-8859-1?Q?8DNdicIWQhMdtVsTqw4HEPc1vS1m/A/oCYRcufoRxxtQIJbu8s8vJ4Ve8c?=
 =?iso-8859-1?Q?PHzC4mqHz2wt1n634PqZBdAGnEX9ge8cTIRuHA4XdWV2KSe29U24/JrPTQ?=
 =?iso-8859-1?Q?TLZ+Jp45o988AtJk2x5i7h1br25yAVyAr1/vUoobAbWnS+AMPAdF46tqOQ?=
 =?iso-8859-1?Q?1DheweH2gdbNUsK+1VqMFVtGLdLPE6wvl78GQ3YJPn2V2bKFPNmNcaPufd?=
 =?iso-8859-1?Q?j9AUN6RTyqbEHHZl29133T029b98pRH/wG4neVh5PClJiSoK93HkePu1tw?=
 =?iso-8859-1?Q?vlgmnr7rSdShhsK7Z3+8XBtHSVWk1p4QavKfhZt4QYRNse6l338s/S9DyG?=
 =?iso-8859-1?Q?/YXZ1/Y0NsnBTrkG/qs1fk9bP1fiGVpabIrg7MyI2N/t9oq1Bmg1DyGLR8?=
 =?iso-8859-1?Q?TDi+aBIpbUHabZ9JhtUENtTkis9wsnc5Jewamh6Jy5LcEGXDfzcbss2knO?=
 =?iso-8859-1?Q?50LKgKluyIsh3muwiZPrkJnenJZvs0Iyh9PN65Bc3GkZfthS2lzn9+GX3G?=
 =?iso-8859-1?Q?wvc3LtEmGkmVYeO+r1c6vxSVeiL4flh6GCUf8/NV+TUQhsWI+uDAkKM+kY?=
 =?iso-8859-1?Q?vBgl9NGQD5RfILglDAM3XzSOPjgXw2/Cs0TYl9ibOlOTFxuDtrzKsFGk8l?=
 =?iso-8859-1?Q?e5SyXlw0NrIZatxMGlPEuUPwGBH8MAM1YORqjIE9RrXn6VPiFNRLDMp0w3?=
 =?iso-8859-1?Q?tDbwNV5IRJJVFmpkSrcbtYS4Xh/SCd3ipcSib3usOK3UXoQ2FczSm5Kw2y?=
 =?iso-8859-1?Q?Ju4SaOy4cBFkjBJmdEnZCw9ZL38bF3k=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ce18b488-a063-4f6d-dab7-08de584e809e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 18:05:32.3081 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LkEVLMfKAhDcCZoxnlIPjx+bsWUSuttQl0pfJZMKoYfOuyG+qtn/RCY/lhX1qgdCesLasg+oxLAGAGr7vCPhqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB5999
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo];
	RCVD_COUNT_SEVEN(0.00)[9];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FROM_NEQ_ENVFROM(0.00)[matthew.brost@intel.com,dri-devel-bounces@lists.freedesktop.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+]
X-Rspamd-Queue-Id: 7E56E49161
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Jan 20, 2026 at 03:34:58PM +0100, Thomas Hellström wrote:
> CONFIG_DEVICE_PRIVATE is not selected by default by some distros,
> for example Fedora, and that leads to a regression in the xe driver
> since userptr support gets compiled out.
> 
> It turns out that DRM_GPUSVM, which is needed for xe userptr support
> compiles also without CONFIG_DEVICE_PRIVATE, but doesn't compile
> without CONFIG_ZONE_DEVICE.
> Exclude the drm_pagemap files from compilation with !CONFIG_ZONE_DEVICE,
> and remove the CONFIG_DEVICE_PRIVATE dependency from CONFIG_DRM_GPUSVM and
> the xe driver's selection of it, re-enabling xe userptr for those configs.
> 
> v2:
> - Don't compile the drm_pagemap files unless CONFIG_ZONE_DEVICE is set.
> - Adjust the drm_pagemap.h header accordingly.
> 
> Fixes: 9e9787414882 ("drm/xe/userptr: replace xe_hmm with gpusvm")
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: <stable@vger.kernel.org> # v6.18+
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/Kconfig    |  2 +-
>  drivers/gpu/drm/Makefile   |  4 +++-
>  drivers/gpu/drm/xe/Kconfig |  2 +-
>  include/drm/drm_pagemap.h  | 18 ++++++++++++++----
>  4 files changed, 19 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index a33b90251530..d3d52310c9cc 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -210,7 +210,7 @@ config DRM_GPUVM
>  
>  config DRM_GPUSVM
>  	tristate
> -	depends on DRM && DEVICE_PRIVATE
> +	depends on DRM
>  	select HMM_MIRROR
>  	select MMU_NOTIFIER
>  	help
> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> index 0deee72ef935..0c21029c446f 100644
> --- a/drivers/gpu/drm/Makefile
> +++ b/drivers/gpu/drm/Makefile
> @@ -108,9 +108,11 @@ obj-$(CONFIG_DRM_EXEC) += drm_exec.o
>  obj-$(CONFIG_DRM_GPUVM) += drm_gpuvm.o
>  
>  drm_gpusvm_helper-y := \
> -	drm_gpusvm.o\
> +	drm_gpusvm.o
> +drm_gpusvm_helper-$(CONFIG_ZONE_DEVICE) += \
>  	drm_pagemap.o\
>  	drm_pagemap_util.o
> +
>  obj-$(CONFIG_DRM_GPUSVM) += drm_gpusvm_helper.o
>  
>  obj-$(CONFIG_DRM_BUDDY) += drm_buddy.o
> diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
> index 4b288eb3f5b0..c34be1be155b 100644
> --- a/drivers/gpu/drm/xe/Kconfig
> +++ b/drivers/gpu/drm/xe/Kconfig
> @@ -39,7 +39,7 @@ config DRM_XE
>  	select DRM_TTM
>  	select DRM_TTM_HELPER
>  	select DRM_EXEC
> -	select DRM_GPUSVM if !UML && DEVICE_PRIVATE
> +	select DRM_GPUSVM if !UML
>  	select DRM_GPUVM
>  	select DRM_SCHED
>  	select MMU_NOTIFIER
> diff --git a/include/drm/drm_pagemap.h b/include/drm/drm_pagemap.h
> index 46e9c58f09e0..2baf0861f78f 100644
> --- a/include/drm/drm_pagemap.h
> +++ b/include/drm/drm_pagemap.h
> @@ -243,6 +243,8 @@ struct drm_pagemap_devmem_ops {
>  			   struct dma_fence *pre_migrate_fence);
>  };
>  
> +#if IS_ENABLED(CONFIG_ZONE_DEVICE)
> +

What happens if we select ZONE_DEVICE but not DEVICE_PRIVATE?

Matt

>  int drm_pagemap_init(struct drm_pagemap *dpagemap,
>  		     struct dev_pagemap *pagemap,
>  		     struct drm_device *drm,
> @@ -252,17 +254,22 @@ struct drm_pagemap *drm_pagemap_create(struct drm_device *drm,
>  				       struct dev_pagemap *pagemap,
>  				       const struct drm_pagemap_ops *ops);
>  
> -#if IS_ENABLED(CONFIG_DRM_GPUSVM)
> +struct drm_pagemap *drm_pagemap_page_to_dpagemap(struct page *page);
>  
>  void drm_pagemap_put(struct drm_pagemap *dpagemap);
>  
>  #else
>  
> +static inline struct drm_pagemap *drm_pagemap_page_to_dpagemap(struct page *page)
> +{
> +	return NULL;
> +}
> +
>  static inline void drm_pagemap_put(struct drm_pagemap *dpagemap)
>  {
>  }
>  
> -#endif /* IS_ENABLED(CONFIG_DRM_GPUSVM) */
> +#endif /* IS_ENABLED(CONFIG_ZONE_DEVICE) */
>  
>  /**
>   * drm_pagemap_get() - Obtain a reference on a struct drm_pagemap
> @@ -334,6 +341,8 @@ struct drm_pagemap_migrate_details {
>  	u32 source_peer_migrates : 1;
>  };
>  
> +#if IS_ENABLED(CONFIG_ZONE_DEVICE)
> +
>  int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
>  				  struct mm_struct *mm,
>  				  unsigned long start, unsigned long end,
> @@ -343,8 +352,6 @@ int drm_pagemap_evict_to_ram(struct drm_pagemap_devmem *devmem_allocation);
>  
>  const struct dev_pagemap_ops *drm_pagemap_pagemap_ops_get(void);
>  
> -struct drm_pagemap *drm_pagemap_page_to_dpagemap(struct page *page);
> -
>  void drm_pagemap_devmem_init(struct drm_pagemap_devmem *devmem_allocation,
>  			     struct device *dev, struct mm_struct *mm,
>  			     const struct drm_pagemap_devmem_ops *ops,
> @@ -359,4 +366,7 @@ int drm_pagemap_populate_mm(struct drm_pagemap *dpagemap,
>  void drm_pagemap_destroy(struct drm_pagemap *dpagemap, bool is_atomic_or_reclaim);
>  
>  int drm_pagemap_reinit(struct drm_pagemap *dpagemap);
> +
> +#endif /* IS_ENABLED(CONFIG_ZONE_DEVICE) */
> +
>  #endif
> -- 
> 2.52.0
> 
