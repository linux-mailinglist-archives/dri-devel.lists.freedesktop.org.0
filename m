Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D325ACDAA9
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jun 2025 11:13:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB57010E63B;
	Wed,  4 Jun 2025 09:13:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dW7hpPEz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE5BB10E63B;
 Wed,  4 Jun 2025 09:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749028409; x=1780564409;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=Eog8IyL0nsDPCU9vZ/XLe22mWX8ckJp6NWlCAMmkurw=;
 b=dW7hpPEz7MjZfcMCdarotbyr4G4YwsXhJD8qhnZ0OqElt1bUxEo8kkbu
 udX80OBpWMy+U3ibIGrJCwRCClFDLk//PTOqZcpE3L+gIOjp5FUj7k+2/
 4kr7cnWPOTvRCjwK7Dx+V+iBFUtkY6APGE4V/EsEYt9qe+lrS4RopgM49
 qLlHuKjx6B/8Sn43d+7UwNJlQGWzADuyE6KnPorh3jqsm9En2d/cE0bn8
 uGR/aKWDuwy43TtYAYVPX6OHczfA47lytFd48QdfRdA32Lh2h+uPhYoDz
 w00f/FOgMdIvX9NMK8xq4r+VkDNktMiwK1ze2m97TPyzKzuNrs3ACQ0Re Q==;
X-CSE-ConnectionGUID: I/xqg1EYTn6X2u3zAFgs7A==
X-CSE-MsgGUID: 5Gew7txYSFOA4cjnbc7kYA==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="76485680"
X-IronPort-AV: E=Sophos;i="6.16,208,1744095600"; d="scan'208";a="76485680"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 02:13:25 -0700
X-CSE-ConnectionGUID: s7GcOc4NTeCvzDTIPnk10g==
X-CSE-MsgGUID: QXDd6QRkRBa4uETQEuRg0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,208,1744095600"; d="scan'208";a="145097131"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 02:13:25 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 4 Jun 2025 02:13:24 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 4 Jun 2025 02:13:24 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.81)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 4 Jun 2025 02:13:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j8u82GtztPLqVNJ5Q83mkCd8zApgmWO9EQFD6gleO74jhNFD8yCboAWUZvnI5eTHyLc7qkQuCoqDuBPyQk5388cabhO9m3sAnnsmVtuk0SvidADoPjTtkYvyQRko1hMkBAZiy93Ue6SuxntsJfgk6HXBPL5JqBqZ0/lrjQ3kAwu/HfAJhuzRSwNzwI3DKjtMqyIMODyrg2Cd17AkPBxCWDJ3C/CFF6owBwxlJiKgGcfP6eSmP6fbXTYH6/rt34dxZRDjYSEKEfbQA48LgOUuTfqGS3n5lt4ykQd4CwJZXiHaY3+ssDpKb2eAI+Rg5TF+a6muJGOSboI0Y/FQFPhdrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3FRFLjqOzYeNotAehboulv6c88PSxP2ttJIVGquRWAY=;
 b=ajBnFfNdfJtJ4tkUvgMk8Pe/UUyIEjV+Bg0/QcAqmWyo8UVMueGSPWgwbaKwhTHbXJWbMmok05S/y3Xhywl9nZxYRj9Hwk4a5/SKlI+kJsNSVHugciWteEhDPz0BV39rkzDnP/B29nXFnZ4YQYxkmqHOeBQTfr8+r+cZXig+G8gTw2oWmciBeeWwPhquRc8bFmiMLzKYz8gCDLPDnlef/q/JAdy0Q0StMXrZZyZylTeER1oMislwXMhXExpexs1vL2E54w9+7EpwCxcawmX/+SurfoPmD/mJOVchaNqRagDlIMPmw3MImn4LjPYjf6tmYQyBP7DGKhBIqUfOPkS4mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by SA0PR11MB7157.namprd11.prod.outlook.com (2603:10b6:806:24b::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Wed, 4 Jun
 2025 09:13:22 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f%2]) with mapi id 15.20.8769.037; Wed, 4 Jun 2025
 09:13:22 +0000
From: Imre Deak <imre.deak@intel.com>
To: <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
CC: =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>
Subject: [PATCH v2 2/4] drm/edid: Add support for quirks visible to DRM core
 and drivers
Date: Wed, 4 Jun 2025 12:13:15 +0300
Message-ID: <20250604091315.16703-1-imre.deak@intel.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20250603121543.17842-3-imre.deak@intel.com>
References: <20250603121543.17842-3-imre.deak@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1P191CA0012.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:800:1ba::15) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|SA0PR11MB7157:EE_
X-MS-Office365-Filtering-Correlation-Id: 86bd9eaf-3465-4c8f-9d37-08dda3480dd4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S1JRVXpXQ0QvSDYvUGsvZ2s2cGhlTmhiZGM2ZGVQZ2FZQk1QQ093NjYzejlC?=
 =?utf-8?B?SndOQ2xpUUpNeUg4Vnp2MXVvWnBKc2lFYkdBNytsYW1taUpCZVRBOStGd0lQ?=
 =?utf-8?B?TXhzYXhhZkVQVytIVlhEYVNaaEtkZU1TMmFQcUNaZU9qaktOejNPUnhLWkhR?=
 =?utf-8?B?SUZOYUxYam0vcXJPcVQxYTkwSGplZWhBMHhHN1dCZTNTVlMxTFhRcTRRMTFJ?=
 =?utf-8?B?VnRraERqYTExeXcwSjEvVG1PdVRPNHlBdHdiTytBa1NhOW1kQzlEdWtoeTNa?=
 =?utf-8?B?RmFOTlFWN0NGMHpaZ0h4OGZqVjhyOHFWMXlITnlwaDVUZTZEUWZ3bDFuMTZq?=
 =?utf-8?B?aHhXaWdqR0ppWmxzYjJjT2hackxvd0pjdlZFMWpxUW9JbGJjemJFWmQrY3Qz?=
 =?utf-8?B?NkxMeTBlZzVrbURoUVlQR2taS3YwbGh0LzdlNzdyZyszUWkvWWVmNmhVN2cy?=
 =?utf-8?B?TXA1cTRwU3M3Qm9yZmI2N1NoY21WZkJvakJMcjlpRjZKTkxTd2trc1J1Zm40?=
 =?utf-8?B?cVNHODlxaE02ZWtJOGxGdFJ4L0RtR3ZGMWFEVDl4eU1GN2tLZVpkK1hIZzFJ?=
 =?utf-8?B?ZURUdXQzbzNpTlpEVE1LVG4xd0ZaYzZTWWRLTkdYUmIybkZUblhHLzBVanQv?=
 =?utf-8?B?ZWtWRDdiWWMzV1BqU1F6UWdlSlg5OWJucjE0aTlYcWpsYmRWUUdkeUNQRjdY?=
 =?utf-8?B?MCtTUkFzQ0ZLNVZwellleUNlVk1FdmxMWTJmTkIxMVBaRVdVR2xCSFQ3Smdk?=
 =?utf-8?B?NzlCbitmdkdyUUdhRUxLM3pDVmpZVk1YcXJML2o2YUcraDR0WEFhYVZnRmlC?=
 =?utf-8?B?SjJNODNsbXVVaHF1dzV5MkNjdis5YVlrZjFJRDdOWGFINHN6S2x3MGNYWEVi?=
 =?utf-8?B?T0hFTWExczkxb1BXMWtMTEJBMmdFcTBYdElaS2UySER6a1BLaStoeGFZMk1w?=
 =?utf-8?B?ZnE0eENNZ2t2SGlBNG5QS1lESDNlNkgxNThpa0xveTJsYzVvL1lVLy9UVmVi?=
 =?utf-8?B?c05ySlcwaEljVit2YmRvbXZWdC9NdmNuMjZHQlIwSktSWnV1WGZVWlN6TlFX?=
 =?utf-8?B?Sjd2UmhlQ1VOUHVxb0JSMGtRVy80cWpSQ05oSldtSzhkUHE0T245cERBenpm?=
 =?utf-8?B?eHYwczNISjBnNG1CRU5IS2w4Zi9lbFUwdjdXc2hkSGUyLzl5QUM0RGYvUnFP?=
 =?utf-8?B?TDdWOUZHK04zTUd4aUNOaXJQREhtY053dWlOQ2ZFb293Y3RIQUkzMWxZbU9K?=
 =?utf-8?B?eWZJS2FUM2J5TUdsSTBCSTVRTFdaeDYzUU9IeUIvR1BFQzhvdFYvNnExbGdJ?=
 =?utf-8?B?STZTTG9vcERRUlcxdmp0TjFDOVFuMmk0YTArZ2E1Q0hGR3U0Rml0Ri8yck1F?=
 =?utf-8?B?NEhCd2hpbUN3QjR6VExNMnM1YmRnaHI3cVlPZXFJVXFNVjBrWFQ0dE9Od2Nv?=
 =?utf-8?B?UFpPNXVDbk9FWEhnS0MzZ2h5VmJ2am9ybDdJV1R5Z3JLY253R3hxZ1lteldh?=
 =?utf-8?B?ditMNkVSckxBb3EzL0JteTZ4ZjEzUTBLUk1MZ3ZzaTRRN01uTWpKQUdPRkxT?=
 =?utf-8?B?bldGdS83Y1RoVTlHZUhXOEVGYmxhWHZiMlFpcXBSZUN0U3JaQlNhbE9ySTR1?=
 =?utf-8?B?YUZJclZmWkQ5MHFqMURzSWtINkt1TkkwWXh3U0tIM2VIUmFwN0hHN1NGRjBL?=
 =?utf-8?B?VlJsdTJrOEs3K1kwRXlCcWtyUEJKT2JLVXJqNGZob3ZlbHZHeWozemVaMEg4?=
 =?utf-8?B?ZGJVcngyM3dFU3dMazRReWttOXBqUjdvck5IcTgwS0Q4NkMyZzhYNm5UTnZ1?=
 =?utf-8?B?ZVJ4WlEwQVUxbjF2emxYVnViem42T0o4SDdNTnlLV1RLVTJpT3pPYkUyMzZ5?=
 =?utf-8?B?S0pTYWdDbkV0b1JvWVE3OGlOY2VRcm9iTVk5cjRJaE9qaHN2MVJoaFI4K3RS?=
 =?utf-8?Q?qeTnaxCrtyg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZFhoMld5U1VuclpaYytSOXhuaTgzUUFBMHhvY1BzRXYxQzFId1lHQzVOVjdo?=
 =?utf-8?B?RjNpaE1qdHY5RFNIVngzeUQ5bGlMMVUxeDdtRGlIYUtqKytEbFVac3AySmcv?=
 =?utf-8?B?NHJIK3A1OUFzSDBZMmJna2FpNWwvK1hzNFFldEZzT3NXdnZGZ2xYTzMyeUdh?=
 =?utf-8?B?cGhuT05rUTJHYTZLRjBCWnk4ZkpKbk9XczFqbDFDTkpZTXBySFhyMFNZK2pD?=
 =?utf-8?B?VnlFMmR2MmJIYzVFNzNlb05BWXRPVFlMTmliNzhrYktHVmtLaTFzaitrd0Rw?=
 =?utf-8?B?NFUxamJBc29pNEhzU0JIQW1lTHRianlDRXhzWGxDWlVSUUlvTHNGKzduNEZ1?=
 =?utf-8?B?cGpHdlNkMHY2VXliS0VVR2ZTekpENnZnRFpoSDQrU0J1eE9WU1NqdjhJMHRS?=
 =?utf-8?B?dHo3MlQzZS9wQXZ6b1VsODI5bFM5eUJMaDJjZkE5Unk1Y255TGpNN3BIdDVw?=
 =?utf-8?B?VnA0STFXbCs0SFVKRFVNNnRXRGUyVGl6a282TUxoVzRjS2FtUHNyeWZXcFZy?=
 =?utf-8?B?ZnlXckZ3ckdnV2FBOCszc1lLN1E4Qk4vcDB2TmZrMnUrOW04MEJyYlQvSWZZ?=
 =?utf-8?B?N2F3REhuNndza2lhWS9RMzViRzBiWjBzNmFnQVVRT0VRQ08rTDZ6bGk4ODFa?=
 =?utf-8?B?SHZheUNOL0RnaGR0akY0Q2ZYbmN3bCtuMHJSTTZ1V3Q3NEV1MXJCem44YVIx?=
 =?utf-8?B?a2ZhYUN4V1g1RExtOE9rc0k1Q0JBWFRzYzhVQzNidm1FR2tad3JpUE4yT1BS?=
 =?utf-8?B?VEZVd1lTc2xtdTI0SDNxZEJ2ZEx4Wk1ybXl0M0RybzVPVktwWnV1TDJxS2dZ?=
 =?utf-8?B?cmlpdU1uOVJvMllPRjJBbWYzQ283Q21yU2lnL1NwdnlBcjdMWFNUTzJ3cVZU?=
 =?utf-8?B?azJIL0c5QnhPdE1RNFdOYk9oVXQ2SEcyaUpER3pHQjlTNGNOV3VwZFpGUkFo?=
 =?utf-8?B?U0NWTTFRWG0zWWdPa1VnK2RTNTJYamI2Y2I1VUhGQ2x6cHpSMis0c0ZxR08w?=
 =?utf-8?B?blNxUWZFNkgxelF4cXFYTVNqdHdqZUVWUmNaSnZnQktLcjMrUlEvbmw5RTRq?=
 =?utf-8?B?MXlHNjU3VE1HVWJWOUovMi9aRnFxRlYyNnVqRUtPUnlMS0hSVERpa3JRSEhL?=
 =?utf-8?B?N0JJa2ZBUkZzbVdLdjNNM0lQMmhJMGlpTHcxRmxmcVdEcTJhOG44NDFVQXp4?=
 =?utf-8?B?dzd1ZjV1Z01YaTVnMkFlbmZOQWV1cm5HeFZGUnFHaDRNUkJhYUZqekpMcW51?=
 =?utf-8?B?RDdrbVhIdkp3VUl6UGM2OWN3M1oxcjlraGpMTGRPNG9JMzhNSmhZS21YMTRz?=
 =?utf-8?B?ZFQ1eDhRZ3N0c05WY2dFUEZnclplbGxWZ2d2S2ZSd3dxSUoyMzZnREhSakkx?=
 =?utf-8?B?RUZOYzBvd29XVHNTSzJtUG9DTUhINGhTMldhR2JBUW9rMEJ1Skh6eXdTWDlZ?=
 =?utf-8?B?UURpNUdxKytsaStHUE9CYXk5NmkwNkdxODBheHBhS0hEbGZvclg1a0FXZnRO?=
 =?utf-8?B?R05KS2dBOW1ZVEhPeFRVTVhhYjJOOTNxdXF6NnlWWDlqWHpST05HRG56enUv?=
 =?utf-8?B?VjIyOENBd25VN2dyZTJjS2lKd3ZYTG1mTmdMaU9oREVoWVdXTU9PSlBZcC81?=
 =?utf-8?B?T2ttOXJKOVBlcVRZbkJsTlc1c3pNbnlTRlBHYTI2TVZCaVBKOElrUXp0SWVN?=
 =?utf-8?B?ODFiSHVFTDVHOHZPNFBESXpxYitiRmRZYllyREl5SGxvcWJDRGRBSnkvdzkv?=
 =?utf-8?B?N3RwaEk0dy9FVG9EbklhM2hRKzVQdE5QWVlMcE56WWRwNjBwdzRhRDFpUXBj?=
 =?utf-8?B?K1h0NWp2TW4xTjFtYXpvdlBWQmRGa2hNUk5BZ3cxUkc0Mk5DcDExeVlOWG1u?=
 =?utf-8?B?b3hrV3BKWkZ5cWo2clA2eXBaK0czdEcvNjFhcThyVjhqeHppaC9XWENmbE5I?=
 =?utf-8?B?UjYya3JNWWI2M2ZpM3g0OTRnb0pOTkVYQXVDNTNyRWxsQjFHN1Q4UEFMQk5n?=
 =?utf-8?B?b3RBcWpJMlVwVGlvbHZmMFpoeDJzVDB4bXNNek5jQWNWaWIvOVFyY1NQTkla?=
 =?utf-8?B?bEt0aStZZkhqK3ZjOUxPcVRTWE1qdjlUZXBuS0VyZHlTeFBJRTl0allabmRP?=
 =?utf-8?Q?O1gYbBgGEz1ILnABtmv3M5tmP?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 86bd9eaf-3465-4c8f-9d37-08dda3480dd4
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2025 09:13:22.3486 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F6zcqSgUEBm/NerpIQi0+4rz6aLoFQBGFiTMJAnOEN5lKPvl5lpHgO/Wajm87vx+qgiJSilhpMqr/BGuF2s/0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB7157
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

Add support for EDID based quirks which can be queried outside of the
EDID parser iteself by DRM core and drivers. There are at least two such
quirks applicable to all drivers: the DPCD register access probe quirk
and the 128b/132b DPRX Lane Count Conversion quirk (see 3.5.2.16.3 in
the v2.1a DP Standard). The latter quirk applies to panels with specific
EDID panel names, accordingly add support for defining quirks based on
the EDID panel name.

v2: Reset global_quirks in drm_reset_display_info().

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/drm_edid.c  | 34 +++++++++++++++++++++++++++-------
 include/drm/drm_connector.h |  5 +++++
 include/drm/drm_edid.h      |  5 +++++
 3 files changed, 37 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 74e77742b2bd4..5d3a25cbc4d36 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -114,15 +114,21 @@ struct drm_edid_match_closure {
 #define LEVEL_GTF2	2
 #define LEVEL_CVT	3
 
-#define EDID_QUIRK(vend_chr_0, vend_chr_1, vend_chr_2, product_id, _quirks) \
+#define PANEL_NAME_ANY	NULL
+
+#define DRM_EDID_QUIRK(_panel_id, _panel_name, _quirks) \
 { \
 	.ident = { \
-		.panel_id = drm_edid_encode_panel_id(vend_chr_0, vend_chr_1, \
-						     vend_chr_2, product_id), \
+		.panel_id = _panel_id, \
+		.name = _panel_name, \
 	}, \
 	.quirks = _quirks \
 }
 
+#define EDID_QUIRK(vend_chr_0, vend_chr_1, vend_chr_2, product_id, _quirks) \
+	DRM_EDID_QUIRK(drm_edid_encode_panel_id(vend_chr_0, vend_chr_1, vend_chr_2, product_id), \
+		       PANEL_NAME_ANY, _quirks)
+
 static const struct edid_quirk {
 	const struct drm_edid_ident ident;
 	u32 quirks;
@@ -248,6 +254,9 @@ static const struct edid_quirk {
 	EDID_QUIRK('A', 'U', 'O', 0x1111, EDID_QUIRK_NON_DESKTOP),
 };
 
+static const struct edid_quirk global_edid_quirk_list[] = {
+};
+
 /*
  * Autogenerated from the DMT spec.
  * This table is copied from xfree86/modes/xf86EdidModes.c.
@@ -2937,13 +2946,14 @@ EXPORT_SYMBOL(drm_edid_duplicate);
  *
  * Return: A u32 represents the quirks to apply.
  */
-static u32 edid_get_quirks(const struct drm_edid *drm_edid)
+static u32 edid_get_quirks(const struct drm_edid *drm_edid,
+			   const struct edid_quirk *quirk_list, int quirk_list_size)
 {
 	const struct edid_quirk *quirk;
 	int i;
 
-	for (i = 0; i < ARRAY_SIZE(edid_quirk_list); i++) {
-		quirk = &edid_quirk_list[i];
+	for (i = 0; i < quirk_list_size; i++) {
+		quirk = &quirk_list[i];
 		if (drm_edid_match(drm_edid, &quirk->ident))
 			return quirk->quirks;
 	}
@@ -6614,6 +6624,7 @@ static void drm_reset_display_info(struct drm_connector *connector)
 	info->vics_len = 0;
 
 	info->quirks = 0;
+	info->global_quirks = 0;
 
 	info->source_physical_address = CEC_PHYS_ADDR_INVALID;
 }
@@ -6660,7 +6671,10 @@ static void update_display_info(struct drm_connector *connector,
 
 	edid = drm_edid->edid;
 
-	info->quirks = edid_get_quirks(drm_edid);
+	info->quirks = edid_get_quirks(drm_edid, edid_quirk_list,
+				       ARRAY_SIZE(edid_quirk_list));
+	info->global_quirks = edid_get_quirks(drm_edid, global_edid_quirk_list,
+					      ARRAY_SIZE(global_edid_quirk_list));
 
 	info->width_mm = edid->width_cm * 10;
 	info->height_mm = edid->height_cm * 10;
@@ -7566,3 +7580,9 @@ bool drm_edid_is_digital(const struct drm_edid *drm_edid)
 		drm_edid->edid->input & DRM_EDID_INPUT_DIGITAL;
 }
 EXPORT_SYMBOL(drm_edid_is_digital);
+
+bool drm_edid_has_quirk(struct drm_connector *connector, enum drm_edid_quirk quirk)
+{
+	return connector->display_info.global_quirks & BIT(quirk);
+}
+EXPORT_SYMBOL(drm_edid_has_quirk);
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 73903c3c842f3..996ecf229f8c7 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -847,6 +847,11 @@ struct drm_display_info {
 	 */
 	u32 quirks;
 
+	/**
+	 * @global_quirks: EDID based quirks. Can be queried by DRM core and drivers.
+	 */
+	u32 global_quirks;
+
 	/**
 	 * @source_physical_address: Source Physical Address from HDMI
 	 * Vendor-Specific Data Block, for CEC usage.
diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
index b38409670868d..3d8e168521c82 100644
--- a/include/drm/drm_edid.h
+++ b/include/drm/drm_edid.h
@@ -109,6 +109,10 @@ struct detailed_data_string {
 #define DRM_EDID_CVT_FLAGS_STANDARD_BLANKING (1 << 3)
 #define DRM_EDID_CVT_FLAGS_REDUCED_BLANKING  (1 << 4)
 
+enum drm_edid_quirk {
+	DRM_EDID_QUIRK_NONE,
+};
+
 struct detailed_data_monitor_range {
 	u8 min_vfreq;
 	u8 max_vfreq;
@@ -476,5 +480,6 @@ void drm_edid_print_product_id(struct drm_printer *p,
 u32 drm_edid_get_panel_id(const struct drm_edid *drm_edid);
 bool drm_edid_match(const struct drm_edid *drm_edid,
 		    const struct drm_edid_ident *ident);
+bool drm_edid_has_quirk(struct drm_connector *connector, enum drm_edid_quirk quirk);
 
 #endif /* __DRM_EDID_H__ */
-- 
2.44.2

