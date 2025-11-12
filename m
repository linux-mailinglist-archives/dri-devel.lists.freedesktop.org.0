Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D36C3C52717
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 14:23:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13AE410E72B;
	Wed, 12 Nov 2025 13:23:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BUOboHF2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8045210E724;
 Wed, 12 Nov 2025 13:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762953797; x=1794489797;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=pWDawmgY35Z565lVeDw43n17ysuQocn0WP2HKvIo/vA=;
 b=BUOboHF204pMf+0tKlshcSrUp9fCuFkd6sPs/XD2KUp+4621E5z8I0iL
 7ni80+5ZNhKFr/wRv+9OrywtlTpqOE+vqgdkL8j3StaSWgQALAu2wRSNG
 /uLR9MtnekELgXM0iU8C6eng8b7Q/WaQBQEmfFHiB0EfrY+ilYivkq/4M
 nGCTRgF/IWUdLB3s42aBXiiuBzyMRYiVWbCNhWQ3I+l0puhujFAeFFdtI
 g47gRbFwdMdNWIriTZXBsRVi4S84h4YKHhksfGrK7UqWylaZ82+5AwwED
 0ckdCxKtPuaoSaZ2PHdf5PRtMJt8LPBpKjSjyKiAC47IsjdX7OXQya1dl w==;
X-CSE-ConnectionGUID: BIQ/7q4gR1imTrUkIO1rTA==
X-CSE-MsgGUID: 8I5atltdQki35kT5G+5nnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="76363893"
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; d="scan'208";a="76363893"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 05:23:17 -0800
X-CSE-ConnectionGUID: cqPCBIQrQCKYxaiHKKPq7w==
X-CSE-MsgGUID: fWKLO25iSgCkBgM/ZBcWKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; d="scan'208";a="189068938"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 05:23:17 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 12 Nov 2025 05:23:16 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 12 Nov 2025 05:23:16 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.15) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 12 Nov 2025 05:23:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fy9HcHen8mCS/Yl7cNb7z13kWcIQJqrTQh/6s2LmgZg8eqRD2gFO863OLpFIUKz9DVr4lYfurY7ZPyQdbRvetgIMxA+InTwvbdcp7LnKGhIphOUC36/DmP4IgGXdzoUTdmbYnM3wIZXijvnLa2hBDPldWGrNyvOZ3gSfENb2WSQXyncPAaouxz7un0A7X4pN85iWrBncnYpqFTM6oflTCUNwY3DRMFMWbsa4fhgzYEgKMHmp1OQJmdANWttNk1Y9lCuLtNsSS+aQBqNXqIdNHzMC0++mGrGLuU+ZB58vdBGqnZurXWnL9h8gJ1lTKk3LHchni4PaA8/9mkw+N2E1UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XllKKkX18EO8qPY8JOjmPOrYQzwJ3b7J1bjlU1EOIdc=;
 b=Y7cFABfd3NyaU+rUJ4Vy9lL4UkfUQE5d9bZDxPsY2HoRHhv0lDfPXjMbJPP+4AjGXBQhJP5j8e64LhZVXCVf2Ybd9yJr8F4LQSdXEhzMKDioX2xGLyUtX3u8jdOY0jhyBlCWTO3bnJqCH0rSWdibTtcLSDfDal3ZYrlvsUPwRDqzFBhJAiDGFV+vg5ozqrKvNhmJzh3uCffbaSDPlvnQ0lQw22OXEYrNYlpbZ6rUB8V90SkzRID9KvZtirr1qCiYVBWMAY30qnB1m+/4xogqsulYWyo8pRHLfj6gk7BHFcHvBURW6k8j8kqas9Mln0nySoSStnrNvufEDEfZ35smUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 PH7PR11MB6929.namprd11.prod.outlook.com (2603:10b6:510:204::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.16; Wed, 12 Nov 2025 13:23:13 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 13:23:13 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, <intel-xe@lists.freedesktop.org>,
 Matthew Brost <matthew.brost@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>
CC: <dri-devel@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>, =?UTF-8?q?Micha=C5=82=20Winiarski?=
 <michal.winiarski@intel.com>
Subject: [PATCH 06/24] drm/xe/pf: Add helpers for migration data packet
 allocation / free
Date: Wed, 12 Nov 2025 14:22:02 +0100
Message-ID: <20251112132220.516975-7-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251112132220.516975-1-michal.winiarski@intel.com>
References: <20251112132220.516975-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0001.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::20) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|PH7PR11MB6929:EE_
X-MS-Office365-Filtering-Correlation-Id: 552c45e6-256f-430b-d42e-08de21eea1d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TFFWdlR1SVBOalFwTUIvSHlOUENLS21YNzkwQ09NSmpDdW5yT1ZpMlJTT0dS?=
 =?utf-8?B?NkVFQ0lQYzdoUjJMSmRuUGVXSlBQM29HeWFvSnJBV0QvME9UdHp2UXNqVzVX?=
 =?utf-8?B?Y1ZSMGhqZmZ2VzB4ZnBRVSs4YnUzeExvcXpONEJCMFJVZ1lrNHBva05Ka0RV?=
 =?utf-8?B?TERoVmlVbml4Z3Z3S2VxdVQ2alZiancxWGlNaDNuYW1YMTNLNHRhL2wrZWxm?=
 =?utf-8?B?a3AwYkhvVlBSV3pYZU9zUHh5RjRjVEc2US9LQU91WWhaaHZMcDkyS0lUZWhn?=
 =?utf-8?B?K3kvTk9LV0hDeWpNUE5LYWMyRXNJazhjNXhHN0crVXg5bzFEdW51SGhPRThZ?=
 =?utf-8?B?Z2tha08yL1JuUDhSdE1lNDlGVWNXdFdURDRibmZoVUpNRU1iRENlK2JKSGRR?=
 =?utf-8?B?RWx1cG9nZ1dPeDh1Kys0K1hma1Z6bjhueGMzRkdtMWlxKzFQUTNVZTVzaEFB?=
 =?utf-8?B?UGd0MTFDSUpsVVdxTUpzWE5jcnVRVGRzb05LcjJ3NFhOQWNHNzIrZXJuVVRO?=
 =?utf-8?B?blhxRmdUQTdsZ3RKQ1Q0MGF4R3FJUnV1cS83cEdHMzBTSjJtSm9nY2hpZ1BF?=
 =?utf-8?B?Q05VMFRtVTlSK2s1QnA4U2RLTEx6QklSL2hNN0xSUWVSU1pQaVBrb091N3B3?=
 =?utf-8?B?Um9oOGF5L0dFc25Gd1ZoRC9ZMEdOWlBVQzJLK2FWSHd5NWt1WlJJbFluY0lP?=
 =?utf-8?B?eGVRQklDVytId0JPRW1KckRScW81MFJxbzR6Ylc5N2I3MEt3bXdOY2cxZW4y?=
 =?utf-8?B?S05ZT2lpa1ZxQzkycGhuc2tNaXFkSHVtL3U4SXgwMkkyekY3bWllaTFILzA1?=
 =?utf-8?B?NnRac0QwUUhOWnVJdFd0aUZzaEJtSkQ4dEVZN3RCK0l2cGhqUnlhU0ZQeGNk?=
 =?utf-8?B?TlJpYzBrTHJpck5TQUJJcXlhQmYrZ1l5WVFmQ3JMVW14N1N4Vm02WmJudmlB?=
 =?utf-8?B?clpSMnVpbzhHd1NncTdPRTV3K2tHaFJzcGtoeVo5RXk4Uk1ROE04Mk5xZTlG?=
 =?utf-8?B?aUtSRm95cE9LazQ4WWxNdkpDaFEyRUgvbVl4MzU4eTNzSHhQTE9nNXdXSUw4?=
 =?utf-8?B?UUwvOFNLVzJGeWRaOVo0MkJheGFlbUtJdmYvVmNyMnQzYzBNeDYrNHVUNGZE?=
 =?utf-8?B?NVQ1MUpSYlpnaUVhMVdnS3Fiejd4V3ZiWjltRVkvZlhlRUd6bTBPSVUvVG1V?=
 =?utf-8?B?UDB3RHBxdXgvc1cvMW9zQU5MSnVFV1hxZEpUbUxBcDgrRHNwYzk2Mk9qNllJ?=
 =?utf-8?B?aFhTR09YMWRsbmIxUzZvLzA5ZFJtbkcrOWY3WGduTjZWSmFEYll6RmVkbWtw?=
 =?utf-8?B?dXpJUmtUQjhZOUdKa1ZvMk9UK0dzWnV0czVSdVdabVJraDJxZHNlZm41T0Uy?=
 =?utf-8?B?SnYzdnJkQTJNUVpUMWlEeXJSeWVTaXF5TkNrb1BmR0xXOUQ2Q2RzTjVRZmdF?=
 =?utf-8?B?MUNBMTJYdEkyam5GV2sxYUw1aDhTT0NWWWlqeXdLWUdIZXVicGtrREczekFW?=
 =?utf-8?B?TWhpcG9Sb1JMOEkxTmdCOXZBYXpCMWhsb2Jma0Uybjh0Y2RWdmdHZzk5L0JF?=
 =?utf-8?B?OXhiU3JSaTVjWFZ0emlGZk1ON0lQUzdla0dPNTVOby84amtWeHVKV3hPdGdk?=
 =?utf-8?B?YnlZUHNKRnVUVEZWUHJEU0JhOW1sUXdXempzOG1VckdDd1l0ZFNpUW1BaG4v?=
 =?utf-8?B?OHJ5V1I5UldTcGNJUnpwclo5SzdnaDd4clJxckUxVHBWWjBYOTB1UksxLzhj?=
 =?utf-8?B?NnAxNjhucDBDZE1rSlA0R3Y4SjBsTWpvQjNpVy82b2l1eDcxVE9ZVHZnU2c4?=
 =?utf-8?B?UmFqa2xxYnRpVzl2TUVwaWxKT01JcEpITk5JU2ExV2daVG9PRFBmTWlML1Qy?=
 =?utf-8?B?RDZ3QWZQTXE4NGdOc2o1YUZSZXREWWdCaVg5bS82a3F4NEloWktnakdlL2JM?=
 =?utf-8?Q?bri81OYDEkBGHYhjKFQtW2xaamrBLrUO?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZWVYQzFHRmRmbGNVVEY0QlZPeVRxRi85TGhiTEsrY0ZUcUhqTWg4WkhVMCtP?=
 =?utf-8?B?ek5HTFVBVDNQRVBkK3hQUVFFaXA1djEvSWJxMlhuSHB0TWI0SXIvSTlVamg2?=
 =?utf-8?B?b2JITU5DM2F4M0owV05WVmRhWUxzVkVUSHdVKy9ubFZkcDhZYkg5K212WlNP?=
 =?utf-8?B?Y1pnTWJ6OVgzNVhOWDc3aURpREtPMFVrV1hpQjJ6UmFKYlVGa0VvalFZTEo3?=
 =?utf-8?B?RlZFeUYzdktZNEVCTnVvVmFSYlpTaGsvY2Q3UG9ILzUxaGJHV05CTFYyaHh6?=
 =?utf-8?B?K2VPVy9iVEpXcmhjWno5eUw3UUU1WmxDb21hRUVGWk8vU0xGVDdYSXV3c1BH?=
 =?utf-8?B?VkRndnFDd1IzVE05RVVtZmhYMkh1a2ZrYVF2aFBoNTBtSXhMUTV6NzRvd2t4?=
 =?utf-8?B?aGdZRXVMT0NaTWFIbHBNU0RHTGU4NWZqUGxpNHlMcFJtZGdCZGJwNlBITU1M?=
 =?utf-8?B?SzJQZzFYbVBpSkt0Z044Y1hUSjA5OUpyb0VkTlJRazF2WXU4bTVQZjVIaFZC?=
 =?utf-8?B?UG5VazBUVzcyNXVXUWdDOGZUYTZHbkhnU1kvdk9uZmg5cG1NMFJ0c1BEeU42?=
 =?utf-8?B?UmxQQUpiS084UlloVUNCK2xsYzQwTFdIa1dpWm1yRGp1MDVrZTRvNEEyUkw2?=
 =?utf-8?B?MG5IdXc0ZndQcHUwNlFyNzJhalN0eTFnaXdra2tndllQTXJqQy8wQVpOaFdQ?=
 =?utf-8?B?RG9lOFVwdE0wdnJxTkw3NDRCQlhyLzNaU1lnNnBYNGs0YTNjWnhFRlNDSERs?=
 =?utf-8?B?Wkh6dEgyMitFRllNOUYwZlZBNFFuMURkQkZkN1pwQzZPOGd2NS9JTnhnbHRa?=
 =?utf-8?B?eTkramQ0T1FiVzUzcXBvVmNMaUxVQklSMXF5ZXNlWVhpTExHSWljNnQyS2xk?=
 =?utf-8?B?dko2UlZWenoxcm1PYkpTTXpDT2lyREJqY2ZzQ1huUk9aTlBjdlpnVEd1SVBn?=
 =?utf-8?B?V2ZVSkNLdlZBWlFUVnpZQjFhbENOWEtwTVQ1czRWdnArbGM3eUo3Z3A0cGlN?=
 =?utf-8?B?RXhxZnkreVJSUEZiYlFDQ01TZDIzZzNjN1lDL083TWd5TzdXNU5GdzhyU3dD?=
 =?utf-8?B?ZkY2WU5NMGVVV3JtOHRMZU1ZRVRLeTU5VWk3eXk5MEl5dUM4d1JycW5vVzh5?=
 =?utf-8?B?alplajZuZTFVOU1hRko4Z3lHUzJJdlRSUGVYK1JFcFhlS1VzN3hNUlNyWEpG?=
 =?utf-8?B?bmhyZlBKYi8xSHFEUDVGbmwzdkhhS2hQQVlDZXNOT1hxUFJmUVcybW40V29q?=
 =?utf-8?B?TUd6OEttZUNhK1FPZU5LY2JkWmt3V1dzYkQ0UjJhVjByUGdzV0xMNVNneVFC?=
 =?utf-8?B?MkpVVGttWkdIOFVDSmszdWlrU3VVeUNIWFdEOVhhWlpSRnRJb3BNT0FQaTMw?=
 =?utf-8?B?aldBQU9nWFgweVpCVkF4VWpyVzBuZnlZdTF4cGxaaTh1RE0rcGhERGhlMlRE?=
 =?utf-8?B?Tm5LQWpQOTk3YjFNYkRCL1duek1EcVBEZXd4bmhRTWtISDdhcFJGSUZPN0ha?=
 =?utf-8?B?a0JySnFFUzhwVXhlV2xHZjVLRzVwMU4xRWI1TGp0c0VMdTg2N2xkdnovUGdw?=
 =?utf-8?B?NmhNMVFtRVl4OUE2RFN2S3NmaC9HZllxYTVqSmFFZnkyZDdTZlNOMXU2SVNx?=
 =?utf-8?B?VElkNzdGN0ZucFBnWmE3NkNNL0VZVXB0emdvYkQvV2ZXRUcydU9VTmxTNTdD?=
 =?utf-8?B?MmZNVTArcmx1cjhyTjRrbFpRUW54dE9VZTNnYmJSVGszc0RkZWZOWG1nVHow?=
 =?utf-8?B?aGdsWlF2eG95LzJOQUxHVVpwMXJFZjRYZW5LaDI0THRWZlkyNDcxOGF6c3gr?=
 =?utf-8?B?eUo3QXlCWWNQRGdrUUhhcW9vUUlSMVArdnBBMCtIS3BXYUdJbVVBRk5LL3RV?=
 =?utf-8?B?Y2k4S2RNTno3dWNsbG5IN0tFeXdQdjBLN0VNOGRtcEpja1BhdU9TclIwaTJZ?=
 =?utf-8?B?ZVV5MGl3YjZMZU1NU0ZXYU9zRmtOcFRaVzB4TFhIL09HSktZNWRrcjhCdHg4?=
 =?utf-8?B?Y2liWGI1cEFCUk5mTHZia2pMT2h6OUw1S1BZRmJsdFVNOGVXY3VvTjZUM3RG?=
 =?utf-8?B?REtEczlUcmU1Q3FrSlU2VDBvS01WWld3SEl2ZWdzMEdwb3c2TUNEb2psVllY?=
 =?utf-8?B?djdPSEpHM0hGOC9HcTl5RVJJR3FtN1p3T3pvSS9oc2xhc0x0VldVRzQvRm9z?=
 =?utf-8?B?ZXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 552c45e6-256f-430b-d42e-08de21eea1d2
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 13:23:13.6453 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wudQCvKWNHgi2mcTmlZPKZNmJsDe6ZSVJ5bFdetAl6VZtoc6a9htRQPunTJetmNmtjEwxH7xtsOb0lS2p5vAVruYFhl09BPNnBZG5yt5JKo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6929
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

Now that it's possible to free the packets - connect the restore
handling logic with the ring.
The helpers will also be used in upcoming changes that will start
producing migration data packets.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/Makefile                   |   1 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c   |  11 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c |  33 ++++-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h |   1 +
 drivers/gpu/drm/xe/xe_sriov_packet.c          | 137 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_sriov_packet.h          |  22 +++
 drivers/gpu/drm/xe/xe_sriov_packet_types.h    |  19 +++
 7 files changed, 221 insertions(+), 3 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_packet.c
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_packet.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index cb6b30fd8c2d8..e4b273b025d2a 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -174,6 +174,7 @@ xe-$(CONFIG_PCI_IOV) += \
 	xe_lmtt_2l.o \
 	xe_lmtt_ml.o \
 	xe_pci_sriov.o \
+	xe_sriov_packet.o \
 	xe_sriov_pf.o \
 	xe_sriov_pf_control.o \
 	xe_sriov_pf_debugfs.o \
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
index bea19e7a4d18e..171b2ba0a97dc 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
@@ -18,6 +18,7 @@
 #include "xe_gt_sriov_printk.h"
 #include "xe_guc_ct.h"
 #include "xe_sriov.h"
+#include "xe_sriov_packet.h"
 #include "xe_sriov_packet_types.h"
 #include "xe_sriov_pf_control.h"
 #include "xe_sriov_pf_migration.h"
@@ -853,6 +854,8 @@ int xe_gt_sriov_pf_control_resume_vf(struct xe_gt *gt, unsigned int vfid)
 static void pf_exit_vf_save_wip(struct xe_gt *gt, unsigned int vfid)
 {
 	if (pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WIP)) {
+		xe_gt_sriov_pf_migration_ring_free(gt, vfid);
+
 		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_PROCESS_DATA);
 		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WAIT_DATA);
 		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_DATA_DONE);
@@ -1075,6 +1078,8 @@ int xe_gt_sriov_pf_control_finish_save_vf(struct xe_gt *gt, unsigned int vfid)
 static void pf_exit_vf_restore_wip(struct xe_gt *gt, unsigned int vfid)
 {
 	if (pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WIP)) {
+		xe_gt_sriov_pf_migration_ring_free(gt, vfid);
+
 		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_PROCESS_DATA);
 		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WAIT_DATA);
 		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_DATA_DONE);
@@ -1109,6 +1114,8 @@ static int pf_handle_vf_restore_data(struct xe_gt *gt, unsigned int vfid)
 
 	xe_gt_sriov_notice(gt, "Skipping VF%u unknown data type: %d\n", vfid, data->hdr.type);
 
+	xe_sriov_packet_free(data);
+
 	return 0;
 }
 
@@ -1202,8 +1209,10 @@ int xe_gt_sriov_pf_control_restore_data_done(struct xe_gt *gt, unsigned int vfid
  */
 int xe_gt_sriov_pf_control_process_restore_data(struct xe_gt *gt, unsigned int vfid)
 {
-	if (!pf_expect_vf_not_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_FAILED))
+	if (!pf_expect_vf_not_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_FAILED)) {
+		xe_gt_sriov_pf_migration_ring_free(gt, vfid);
 		return -EIO;
+	}
 
 	pf_exit_vf_restore_wait_data(gt, vfid);
 
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
index 47f1d85341f7f..4e49022810ea5 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
@@ -14,6 +14,7 @@
 #include "xe_guc.h"
 #include "xe_guc_ct.h"
 #include "xe_sriov.h"
+#include "xe_sriov_packet.h"
 #include "xe_sriov_packet_types.h"
 #include "xe_sriov_pf_migration.h"
 
@@ -419,6 +420,25 @@ bool xe_gt_sriov_pf_migration_ring_full(struct xe_gt *gt, unsigned int vfid)
 	return ptr_ring_full(&pf_pick_gt_migration(gt, vfid)->ring);
 }
 
+/**
+ * xe_gt_sriov_pf_migration_ring_free() - Consume and free all data in migration ring
+ * @gt: the &xe_gt
+ * @vfid: the VF identifier
+ */
+void xe_gt_sriov_pf_migration_ring_free(struct xe_gt *gt, unsigned int vfid)
+{
+	struct xe_gt_sriov_migration_data *migration = pf_pick_gt_migration(gt, vfid);
+	struct xe_sriov_packet *data;
+
+	if (ptr_ring_empty(&migration->ring))
+		return;
+
+	xe_gt_sriov_notice(gt, "VF%u unprocessed migration data left in the ring!\n", vfid);
+
+	while ((data = ptr_ring_consume(&migration->ring)))
+		xe_sriov_packet_free(data);
+}
+
 /**
  * xe_gt_sriov_pf_migration_save_produce() - Add VF save data packet to migration ring.
  * @gt: the &xe_gt
@@ -545,8 +565,10 @@ xe_gt_sriov_pf_migration_save_consume(struct xe_gt *gt, unsigned int vfid)
 	data = ptr_ring_consume(&migration->ring);
 	if (data) {
 		ret = xe_gt_sriov_pf_control_process_save_data(gt, vfid);
-		if (ret)
+		if (ret) {
+			xe_sriov_packet_free(data);
 			return ERR_PTR(ret);
+		}
 
 		return data;
 	}
@@ -560,11 +582,18 @@ xe_gt_sriov_pf_migration_save_consume(struct xe_gt *gt, unsigned int vfid)
 	return ERR_PTR(-EAGAIN);
 }
 
+static void destroy_pf_packet(void *ptr)
+{
+	struct xe_sriov_packet *data = ptr;
+
+	xe_sriov_packet_free(data);
+}
+
 static void action_ring_cleanup(void *arg)
 {
 	struct ptr_ring *r = arg;
 
-	ptr_ring_cleanup(r, NULL);
+	ptr_ring_cleanup(r, destroy_pf_packet);
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
index b29d34a835b71..b4c7b5dc9e914 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
@@ -17,6 +17,7 @@ int xe_gt_sriov_pf_migration_restore_guc_state(struct xe_gt *gt, unsigned int vf
 
 bool xe_gt_sriov_pf_migration_ring_empty(struct xe_gt *gt, unsigned int vfid);
 bool xe_gt_sriov_pf_migration_ring_full(struct xe_gt *gt, unsigned int vfid);
+void xe_gt_sriov_pf_migration_ring_free(struct xe_gt *gt, unsigned int vfid);
 
 int xe_gt_sriov_pf_migration_save_produce(struct xe_gt *gt, unsigned int vfid,
 					  struct xe_sriov_packet *data);
diff --git a/drivers/gpu/drm/xe/xe_sriov_packet.c b/drivers/gpu/drm/xe/xe_sriov_packet.c
new file mode 100644
index 0000000000000..1ac7e025e9fd9
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_sriov_packet.c
@@ -0,0 +1,137 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#include "xe_bo.h"
+#include "xe_device.h"
+#include "xe_printk.h"
+#include "xe_sriov_packet.h"
+#include "xe_sriov_packet_types.h"
+
+static bool pkt_needs_bo(struct xe_sriov_packet *data)
+{
+	return data->hdr.type == XE_SRIOV_PACKET_TYPE_VRAM;
+}
+
+/**
+ * xe_sriov_packet_alloc() - Allocate migration data packet
+ * @xe: the &xe_device
+ *
+ * Only allocates the "outer" structure, without initializing the migration
+ * data backing storage.
+ *
+ * Return: Pointer to &xe_sriov_packet on success,
+ *         NULL in case of error.
+ */
+struct xe_sriov_packet *xe_sriov_packet_alloc(struct xe_device *xe)
+{
+	struct xe_sriov_packet *data;
+
+	data = kzalloc(sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return NULL;
+
+	data->xe = xe;
+	data->hdr_remaining = sizeof(data->hdr);
+
+	return data;
+}
+
+/**
+ * xe_sriov_packet_free() - Free migration data packet.
+ * @data: the &xe_sriov_packet
+ */
+void xe_sriov_packet_free(struct xe_sriov_packet *data)
+{
+	if (IS_ERR_OR_NULL(data))
+		return;
+
+	if (pkt_needs_bo(data))
+		xe_bo_unpin_map_no_vm(data->bo);
+	else
+		kvfree(data->buff);
+
+	kfree(data);
+}
+
+static int pkt_init(struct xe_sriov_packet *data)
+{
+	struct xe_gt *gt = xe_device_get_gt(data->xe, data->hdr.gt_id);
+
+	if (!gt)
+		return -EINVAL;
+
+	if (data->hdr.size == 0)
+		return 0;
+
+	if (pkt_needs_bo(data)) {
+		struct xe_bo *bo;
+
+		bo = xe_bo_create_pin_map_novm(data->xe, gt->tile, PAGE_ALIGN(data->hdr.size),
+					       ttm_bo_type_kernel,
+					       XE_BO_FLAG_SYSTEM | XE_BO_FLAG_PINNED, false);
+		if (IS_ERR(bo))
+			return PTR_ERR(bo);
+
+		data->bo = bo;
+		data->vaddr = bo->vmap.vaddr;
+	} else {
+		void *buff = kvzalloc(data->hdr.size, GFP_KERNEL);
+
+		if (!buff)
+			return -ENOMEM;
+
+		data->buff = buff;
+		data->vaddr = buff;
+	}
+
+	return 0;
+}
+
+#define XE_SRIOV_PACKET_SUPPORTED_VERSION 1
+
+/**
+ * xe_sriov_packet_init() - Initialize migration packet header and backing storage.
+ * @data: the &xe_sriov_packet
+ * @tile_id: tile identifier
+ * @gt_id: GT identifier
+ * @type: &xe_sriov_packet_type
+ * @offset: offset of data packet payload (within wider resource)
+ * @size: size of data packet payload
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_sriov_packet_init(struct xe_sriov_packet *data, u8 tile_id, u8 gt_id,
+			 enum xe_sriov_packet_type type, loff_t offset, size_t size)
+{
+	data->hdr.version = XE_SRIOV_PACKET_SUPPORTED_VERSION;
+	data->hdr.type = type;
+	data->hdr.tile_id = tile_id;
+	data->hdr.gt_id = gt_id;
+	data->hdr.offset = offset;
+	data->hdr.size = size;
+	data->remaining = size;
+
+	return pkt_init(data);
+}
+
+/**
+ * xe_sriov_packet_init_from_hdr() - Initialize migration packet backing storage based on header.
+ * @data: the &xe_sriov_packet
+ *
+ * Header data is expected to be filled prior to calling this function.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_sriov_packet_init_from_hdr(struct xe_sriov_packet *data)
+{
+	xe_assert(data->xe, !data->hdr_remaining);
+
+	if (data->hdr.version != XE_SRIOV_PACKET_SUPPORTED_VERSION)
+		return -EINVAL;
+
+	data->remaining = data->hdr.size;
+
+	return pkt_init(data);
+}
diff --git a/drivers/gpu/drm/xe/xe_sriov_packet.h b/drivers/gpu/drm/xe/xe_sriov_packet.h
new file mode 100644
index 0000000000000..282a35e77fb39
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_sriov_packet.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#ifndef _XE_SRIOV_PACKET_H_
+#define _XE_SRIOV_PACKET_H_
+
+#include <linux/types.h>
+
+struct xe_device;
+struct xe_sriov_packet;
+enum xe_sriov_packet_type;
+
+struct xe_sriov_packet *xe_sriov_packet_alloc(struct xe_device *xe);
+void xe_sriov_packet_free(struct xe_sriov_packet *data);
+
+int xe_sriov_packet_init(struct xe_sriov_packet *data, u8 tile_id, u8 gt_id,
+			 enum xe_sriov_packet_type, loff_t offset, size_t size);
+int xe_sriov_packet_init_from_hdr(struct xe_sriov_packet *data);
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_sriov_packet_types.h b/drivers/gpu/drm/xe/xe_sriov_packet_types.h
index ebcedc8c08fdc..078a1c95e786f 100644
--- a/drivers/gpu/drm/xe/xe_sriov_packet_types.h
+++ b/drivers/gpu/drm/xe/xe_sriov_packet_types.h
@@ -8,6 +8,25 @@
 
 #include <linux/types.h>
 
+/**
+ * enum xe_sriov_packet_type - Xe SR-IOV VF migration data packet type
+ * @XE_SRIOV_PACKET_TYPE_DESCRIPTOR: Descriptor with VF device metadata
+ * @XE_SRIOV_PACKET_TYPE_TRAILER: Trailer indicating end-of-stream
+ * @XE_SRIOV_PACKET_TYPE_GGTT: Global GTT migration data
+ * @XE_SRIOV_PACKET_TYPE_MMIO: MMIO registers migration data
+ * @XE_SRIOV_PACKET_TYPE_GUC: GuC firmware migration data
+ * @XE_SRIOV_PACKET_TYPE_VRAM: VRAM migration data
+ */
+enum xe_sriov_packet_type {
+	/* Skipping 0 to catch uninitialized data */
+	XE_SRIOV_PACKET_TYPE_DESCRIPTOR = 1,
+	XE_SRIOV_PACKET_TYPE_TRAILER,
+	XE_SRIOV_PACKET_TYPE_GGTT,
+	XE_SRIOV_PACKET_TYPE_MMIO,
+	XE_SRIOV_PACKET_TYPE_GUC,
+	XE_SRIOV_PACKET_TYPE_VRAM,
+};
+
 /**
  * struct xe_sriov_packet_hdr - Xe SR-IOV VF migration data packet header
  */
-- 
2.51.2

