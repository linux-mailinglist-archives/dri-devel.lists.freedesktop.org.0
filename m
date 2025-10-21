Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C26ABF916F
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 00:43:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72F4910E662;
	Tue, 21 Oct 2025 22:43:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hf4TteQw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 356F510E65D;
 Tue, 21 Oct 2025 22:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761086608; x=1792622608;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=MkJr6PtFJhlNDnTSAPrNAh6gaFgYTYa958tdgCT1BsY=;
 b=hf4TteQwhZMcz6NRNK7gDQ36UlXdZSzOaWUn52KpVA3ghhJ2x/ZDyNMs
 TXugcTsK9mFot1WBM3l+CXKr6FKlGTri0+CX1s4Z5gpDE1242BceSfbJa
 0MrCPQnJMJJpJulE4KwOuGC4N9cON12BM9W8+wN0hoy/0eUzueELNCOBm
 8oznE/U77KGtzZ/geaZZnX2gplXKnK7C5diwgEjLstG/cAkHISZV0ER8O
 rbLMsOr34aDaqMlImBQ1O+m0Ajk0wx1uDZIEuqIkyg9V4Mvnue4h7Y5Lx
 JswsS+FI6Uy3+4yUByuyB7VQXxNpIq7CjxjKF9npXe7DFg3PywmZbc+fZ w==;
X-CSE-ConnectionGUID: GvkNz9ZJS8uvEr+gbuRv2A==
X-CSE-MsgGUID: Js6N4TDGRz+lqda4dCPawg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62255835"
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; d="scan'208";a="62255835"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 15:43:28 -0700
X-CSE-ConnectionGUID: tFb0DJESR9KeMjYC3EJBuA==
X-CSE-MsgGUID: +4bVNuHFTZKZCfFMuefCiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; d="scan'208";a="183738728"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 15:43:21 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 21 Oct 2025 15:43:20 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 21 Oct 2025 15:43:20 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.41) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 21 Oct 2025 15:43:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R1LmTtFIS0KTaWmGBRnBcUbgNgN29i8qRj75c0HMr/Q+l7xk0OQis7x7tljVA2+WOGNFUMMWAkoPvRK2sFBwDkYqOSpTlrQOeGPXGbuw63ylXP3wGin2uJvlCtfRK7wPmhn9p8Gmj9+gpZWLv01lzf4g9Tb9cJDdGW4mOfBGhuwK/O6WWI5uSeiGQy3frtHcbdWI8u8xn2H0hDhB+XQUuYyG/cgBpX4diS7790r2FcxmnFC1/VH2ouYQ9R6RagCDRV3d2nzd4suGRR2DdOnNmiLCKY+2UtdyMK5pirw7w20OPqNKXtneuFj7azeiMmyCvY81my5CxbugHrEZVFaQLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P+qJHKqgyIyi2npjxKQTq+CoBvpf0pkV9ekFUbkoUWM=;
 b=U30pyhtDbog71iBtF57TSPXJYkufl4gWlE6Oye2D0l8neDh8hunfeCg/1OCyF7sS2IQUWUvmwSmNjrUtj3n8XFvs2wFa4cWu1BHqVSuoo5sC9PU/bRGfSFgf2vfqNsI70AQyXOrSaX2VXSe56qjt+6G+TWK8zPMNhtwr2HBo0izK+MV0DMMozYy9ZtTuPWbpdfVlK0oHhzQYdWqRuowH303qxCj2SsNQE8dJpHTUvQsayAWhI16KjgLo8eoNEK9lkKRkgafw0hW8vzd8U/k3/RWeP5D69uVjHmq2JM/QZzYxW11p+uodMDk7ndzPha+ULNCmHB6ttsI0Bn5DreAhIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 PH8PR11MB6753.namprd11.prod.outlook.com (2603:10b6:510:1c8::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Tue, 21 Oct
 2025 22:43:16 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9253.011; Tue, 21 Oct 2025
 22:43:16 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: Alex Williamson <alex.williamson@redhat.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, =?UTF-8?q?Thomas=20Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, <intel-xe@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <kvm@vger.kernel.org>, Matthew Brost
 <matthew.brost@intel.com>, Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <dri-devel@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>, =?UTF-8?q?Micha=C5=82=20Winiarski?=
 <michal.winiarski@intel.com>
Subject: [PATCH v2 14/26] drm/xe/pf: Switch VF migration GuC save/restore to
 struct migration data
Date: Wed, 22 Oct 2025 00:41:21 +0200
Message-ID: <20251021224133.577765-15-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251021224133.577765-1-michal.winiarski@intel.com>
References: <20251021224133.577765-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1P189CA0027.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:802:2a::40) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|PH8PR11MB6753:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c5a22aa-f675-4b91-176c-08de10f339b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c1g4Y3hzQlFYaTYwamhhSmMxQzcyTXVPbFRQMDEvSTZURDdvOTdCK3hJQjhv?=
 =?utf-8?B?S1BzUndFVk5zMmRValdoc0dQaXZEZVFmem5RRWMyR1RKamhQUnJ1ZnFVTXI5?=
 =?utf-8?B?d2hrTkVTK0R5UmUzR2Y3a1BPTHQzVjFHeW5TSEZwVVZRWkVuZ002YVdzUlhm?=
 =?utf-8?B?dkdUdFFMZ2UrQnlxMHRVeHhqQWZjWDdrNm1nMmpWOVpkQlpRNUNicS9PeEx3?=
 =?utf-8?B?UlNoU0s5aDRYRGRqM3pvcFlhRW5ZODBJL0hYam9hNlB3TENoTm1HZ2xsQUJi?=
 =?utf-8?B?cGJOczg4VVlIR0g2eFRzOG5NeEVCazBIbnpPTjMyK0wyRmVKbHhoaWFrcEhG?=
 =?utf-8?B?VXdLdmNGc004ZnVjblkxU1VJdHlTdmhObmZ1b2RjTkJLWGtaUGpxbDA1bUJy?=
 =?utf-8?B?M2JFVkVqYmh4dHpseVNHMnlqQzBkbXhvOVJqZC94L1JrWVJZeFdEbVA1Ri9t?=
 =?utf-8?B?Qi9TK0NxWE9ucjQ4QVBmS0hvc3p4MW1lNGdoVjlpalhPUzhGcHpONG4zZ2Q3?=
 =?utf-8?B?MnRaL3FYdlpvME94M3ZGZ0lmd3FCWlJQYnQ3QXdPU0VwbUJPZkJNM3FxSlYy?=
 =?utf-8?B?NGRjbGs2NjVBdWx1Sm4veDkxWHRzV1pFendmVnNMTmhtUnl2VnlEYzJUMzdH?=
 =?utf-8?B?WkJmcW5KSHJEQVRFUVhWM25aMGQybUp0RzdYbmliN3h6Z1B6bmhwVTlNUVJB?=
 =?utf-8?B?Y25pWFh6ZzRzTDNMaG9pQVA4SC9VT05zTWc5eHNTN1o0MnBEQjVhRnMreG9Y?=
 =?utf-8?B?RndVUWorSU5EZ3FYK1NXZy81dU9MTVloREd3Vm5KTFlyaWdZaEdLbk4zSVlh?=
 =?utf-8?B?U2JBR05uZ1ZtWE1OR3VVeVZBMzdnL2J6UE9qWWJMU1VkTGxMaFlVSE9SVlI4?=
 =?utf-8?B?TU5RN25RUnNuOXFLeERkMzFOSHdEUHNhUUZWa2ljZjNhZWZMUnQvSTZTQUFu?=
 =?utf-8?B?cVpIM2FLWkNNaDY0S2xWM3JLeWdkM0RQUzBLS2hFVDZINjYxNVhMb3dPTllq?=
 =?utf-8?B?a1VxNEx1RFZqZ01aSFNhQTBtZkJGR29tMDFzdElUWlVKT2pGbUdHa2I4Zy9S?=
 =?utf-8?B?RXlOSEZ4Mmx5RU5MUjF2dDlNM2xQMGxhTHRIWWpMQmRwZFhIeUYwVDN4dGMy?=
 =?utf-8?B?cE9RVmhOYi9Dd2xDMGxxV1NjcCtCby9pR2NIVEd3K2VPTXBjMWg2TVVKWlpR?=
 =?utf-8?B?cEtYMDNIb01zMHIrUk1PL1lBNjlMZUYreW9Wb2tCU0tZTTNtdXgyUGh0N1FS?=
 =?utf-8?B?bGRIdVFzM2xYTXBUZzg1ZkZPczduZ0I5dlNaOElhOUdaTmkwLzBnVStOUXpB?=
 =?utf-8?B?WGFBYllwOCt4NkZRcTZpcmliYVdaMldqRzFma2JvcmpIL0lNWEJEQVM1VWw5?=
 =?utf-8?B?SGFmc2ZodVJQclBhT01TUm5lMXQyWVovYnM3Q0Jaa3BWOXRRTEtiU21pVk44?=
 =?utf-8?B?QTl2T3NLT2QrWnhOM1NPZmxVNHJuWnc5YUVHVkpvTmN6bWdYNCs5ZjdMUXRC?=
 =?utf-8?B?Sk1vQ090YnRUN1ZDZUtyRkZocDJ0WGYxRnlFNndacHdrOUJXK2Q2NGNqdkJ0?=
 =?utf-8?B?aDk5RngvTmZLS2tKRmJtK3FyOTJKaldsbklZSEdTUllSbG9FQUlwb1JTd1Z2?=
 =?utf-8?B?ejZiNUhqRm9Ud1h3dkpXaGxOM0FQelpNMlR5MXlBb2hSMFRleTN4MDh4eEtv?=
 =?utf-8?B?bkI5Um83LzNlaVNYd1FlR3dQRjZLSkgzZHBkU2x6WU9lU1hrZ1QvTUlQWXlE?=
 =?utf-8?B?QTZPalYzT04zWit3eTIwYnpIZGVROHlhOEdqYVhVUFRBVk9pVEF3WjV4dXNh?=
 =?utf-8?B?WmZNcW9jNVFacnZwMDFLZ3hqRFdHdDRzNThoV09acTRGMW1qUnhyOUdPTUtK?=
 =?utf-8?B?R1VNSHlDZjRINjdXWitjMWQxSXI4Rnpnd2I2bEYra2R4dEZPclpyRjZJclpt?=
 =?utf-8?B?UmFzcVFlNy9DT3VXeHNLUTF2VGFlYUx3V2ovaXJlMDhDRjdhSGlIR21OTCtJ?=
 =?utf-8?Q?KxNtNFWdH4hyjhWFXjPzRQsUgl8qH4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cTJLa24wZnpwZGFNaklFSFl2ZzhFT2t3U0daRVhIOFBuVHI4VFVUczVNMU1o?=
 =?utf-8?B?bWpXWUpjemhDOU9VNjV2WVF0a2xJWE0zbGszdythcU1JNC9aSzBNaUNnYnU4?=
 =?utf-8?B?cjhtSklTUTZ0Z20zTGNxdEZObmdNRE1LUkNyb2JtbEF2YU93MEJoNnJyakJT?=
 =?utf-8?B?aWZ4cjdSbFpIMmZzNkd0dEJpK3BrNG84RHprbDNBTm1tZnZGMTJKWXpJUGRZ?=
 =?utf-8?B?SnFSYXpid216eXlQWFRTQW12NDFnak1ORkNXVjIxRWhEVmNhM3VHMktYZXFa?=
 =?utf-8?B?eG1oWVJZb1VxbFVkWVJnc29uckNIL1NiWXgzZUg4MDZqMkhZN1Y5NVRjL2Rj?=
 =?utf-8?B?a3dZYmN2WjFWd1NERjFmTkVQMnZmL2tjdEE3WEJnWUZrc1Y3Tk1HYW1kbzA2?=
 =?utf-8?B?MVV6dm16RkliKy81OTBXQnhPMmxES2JYNXFyRFc5Vnk4d1VvcStBL0ZnOUVq?=
 =?utf-8?B?alZzRFNEZWJSWFNyejlDL3JhaXByS2pqM2NZOEV0LzhnWS82ellQazMzRThh?=
 =?utf-8?B?T2xWMDUycE1VdnNnd1Z3eHhzaGN4M2Q3SHVsb1ZhUktkcjFoOW4rbSttK085?=
 =?utf-8?B?Z2lmKy8zSnR5V3NmK0VKSUxqUXVZUHA0bDlXYTZBRGZ2YnNNWmJlblNqa0pj?=
 =?utf-8?B?ZmVkUnI3QkdrU2lwTVlVSnd2b2lCUG1kaklNdUF1dTEvc0M1YzRUUzBOYS9o?=
 =?utf-8?B?dDZvWHpPNmVjaWhBa0p2TXhMWUh4MnQ0VjF1aHlleWpwUmh1cjZNZzdMVmZo?=
 =?utf-8?B?WElOd3IyOGhvZlpaVkc1Mzl2MWk3MGY1aUkxTzFyQlZWcC92ZHBMc0syZWV2?=
 =?utf-8?B?WmV2M3VaVTFFOE5OVzBZYUZHbzhTdkhLRUE0UHNuM291MW1XT293TUNLZE9u?=
 =?utf-8?B?SEFKOUxVQllDcjdpanNlclVMNUVOdWUzWWs1S2ZxS1dOZXhFblJ5d1BVNnBa?=
 =?utf-8?B?VXBGZGl2RENTWlh2cjlBRnltWi9yejUydkNGK3FTTmJJVGZDc2hhTElFR0V5?=
 =?utf-8?B?ZVowNGZZL1NuNmRpTVJFQ3JkYWpGdWhqSjkyMSs2SSswOGdiS2E4bUdpN3Iz?=
 =?utf-8?B?ZlZMcmFXSXJFd2x4eVNTamhuK0tTblFjWlVHWUc0TVYvOXhVRFdWMUYyV0hQ?=
 =?utf-8?B?dm1oVVZTUVRNRkIvZmVLVDRTa0htMUorOXUwUFNkSXZpMlpkbGxXRUwyUGZu?=
 =?utf-8?B?bUgvUzM5MmZqMmViSjl0Z0dSdjNlaEUvK0tLOW1laCtDZ284Mm9uUVRVOE5i?=
 =?utf-8?B?NWFISE9tNHVBd05MeERwMG9Xa2t3SmxmTk9XRFpsVVlqc3ZidGtyZHlrVjk5?=
 =?utf-8?B?STNEZ3l1a3hkY2RGRGV3eWpSOWRtZXBZRWRQY2o5YXo5V3UxVHZiZW5nSWY2?=
 =?utf-8?B?QXhLQjJyU0tKaElyaEhQUmx2Ty9kZTdEWm5kQTNwVE05bXlzVGYrV016bmRJ?=
 =?utf-8?B?M0pjSXB3blNUY0toS28xTDkzbTVzdThOTlo3bnNxY0FKL010a3VoVlJES2FC?=
 =?utf-8?B?OSswN0J3bEpqWUFyL0tXaDhtMzRpSUFjWDBuNm5nbVR0Zk93WjVic0pXYkZB?=
 =?utf-8?B?eWpjSUpBKzhUc0lhOE1NemVqbmdGc3d6VDBFSzlrYnowQktISHlOb2ozR2h6?=
 =?utf-8?B?R1ZLTHptOWVkUS9vUXJVT2llTG0vQ3ZaOFUwMUhlOC8xNnpxbEQyVWcyN2hE?=
 =?utf-8?B?ekRXNFJIeCtLZVpMYVhieW5LbUEzTTFXOU5CZGdCNTU3WVhZeWFieWNuMDNi?=
 =?utf-8?B?VFN2VjJWRldpaVNJV3l5ZjdWMzRrZUY3QURuczdHQXRma2dUZ0pwUDRDdGRm?=
 =?utf-8?B?L1RwQnJuNC93czk2ZzQ3dGJZMW5HRDNRbjhqdm13WnhGWVBvT0J3bWdzd1Rj?=
 =?utf-8?B?VnVaOTJzY2NVNnJaNjZiZ0M0TkR1WDZaK1pnUWVTZXJXVElyUGI4R0JpWWUy?=
 =?utf-8?B?ZXZUS3FLSjk1MWNONTM2TVFjLzUzTVBwU3gzbHlKVWoxcFlkVXd4ZTVJUklX?=
 =?utf-8?B?YStHU0xMS1kveWtkUXBKSzR0Z1FFckcxZUp6UmJmUW1HZmdBS0RxQ0M3OVhN?=
 =?utf-8?B?VktuMGtnaHNnbHp5YWdhL2h1VlRVK2dUTk8waFVUendhdkx2TUV6Y3hCYmdh?=
 =?utf-8?B?QmZTVUJLQk9lWXBkdlV2RS9KZVdMdzh2Wmw5WWZGWTN4YU8vRkFZMSs2R0s5?=
 =?utf-8?B?Mmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c5a22aa-f675-4b91-176c-08de10f339b7
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2025 22:43:16.7240 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9yCXj7q0HrOODNYUdiEmfLt4noW9rwWHXYAvSn7LTk1p/YPubGvsBShPLP+WW971Mf5wWdI7BpdM/x1isOxvENGg8B5R847dY98wCg/41w8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6753
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

In upcoming changes, the GuC VF migration data will be handled as part
of separate SAVE/RESTORE states in VF control state machine.
Now that the data is decoupled from both guc_state debugfs and PAUSE
state, we can safely remove the struct xe_gt_sriov_state_snapshot and
modify the GuC save/restore functions to operate on struct
xe_sriov_migration_data.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c | 266 +++++-------------
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h |  13 +-
 .../drm/xe/xe_gt_sriov_pf_migration_types.h   |  27 --
 drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h     |   4 -
 4 files changed, 80 insertions(+), 230 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
index 04fad3126865c..127162e8c66e8 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
@@ -28,6 +28,15 @@ static struct xe_gt_sriov_migration_data *pf_pick_gt_migration(struct xe_gt *gt,
 	return &gt->sriov.pf.vfs[vfid].migration;
 }
 
+static void pf_dump_mig_data(struct xe_gt *gt, unsigned int vfid,
+			     struct xe_sriov_migration_data *data)
+{
+	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG_SRIOV)) {
+		print_hex_dump_bytes("mig_data: ", DUMP_PREFIX_OFFSET,
+				     data->vaddr, min(SZ_64, data->size));
+	}
+}
+
 /* Return: number of dwords saved/restored/required or a negative error code on failure */
 static int guc_action_vf_save_restore(struct xe_guc *guc, u32 vfid, u32 opcode,
 				      u64 addr, u32 ndwords)
@@ -47,7 +56,7 @@ static int guc_action_vf_save_restore(struct xe_guc *guc, u32 vfid, u32 opcode,
 }
 
 /* Return: size of the state in dwords or a negative error code on failure */
-static int pf_send_guc_query_vf_state_size(struct xe_gt *gt, unsigned int vfid)
+static int pf_send_guc_query_vf_mig_data_size(struct xe_gt *gt, unsigned int vfid)
 {
 	int ret;
 
@@ -56,8 +65,8 @@ static int pf_send_guc_query_vf_state_size(struct xe_gt *gt, unsigned int vfid)
 }
 
 /* Return: number of state dwords saved or a negative error code on failure */
-static int pf_send_guc_save_vf_state(struct xe_gt *gt, unsigned int vfid,
-				     void *dst, size_t size)
+static int pf_send_guc_save_vf_mig_data(struct xe_gt *gt, unsigned int vfid,
+					void *dst, size_t size)
 {
 	const int ndwords = size / sizeof(u32);
 	struct xe_guc *guc = &gt->uc.guc;
@@ -85,8 +94,8 @@ static int pf_send_guc_save_vf_state(struct xe_gt *gt, unsigned int vfid,
 }
 
 /* Return: number of state dwords restored or a negative error code on failure */
-static int pf_send_guc_restore_vf_state(struct xe_gt *gt, unsigned int vfid,
-					const void *src, size_t size)
+static int pf_send_guc_restore_vf_mig_data(struct xe_gt *gt, unsigned int vfid,
+					   const void *src, size_t size)
 {
 	const int ndwords = size / sizeof(u32);
 	struct xe_guc *guc = &gt->uc.guc;
@@ -114,120 +123,68 @@ static bool pf_migration_supported(struct xe_gt *gt)
 	return xe_sriov_pf_migration_supported(gt_to_xe(gt));
 }
 
-static struct mutex *pf_migration_mutex(struct xe_gt *gt)
+static int pf_save_vf_guc_mig_data(struct xe_gt *gt, unsigned int vfid)
 {
-	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
-	return &gt->sriov.pf.migration.snapshot_lock;
-}
-
-static struct xe_gt_sriov_state_snapshot *pf_pick_vf_snapshot(struct xe_gt *gt,
-							      unsigned int vfid)
-{
-	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
-	xe_gt_assert(gt, vfid <= xe_sriov_pf_get_totalvfs(gt_to_xe(gt)));
-	lockdep_assert_held(pf_migration_mutex(gt));
-
-	return &gt->sriov.pf.vfs[vfid].snapshot;
-}
-
-static unsigned int pf_snapshot_index(struct xe_gt *gt, struct xe_gt_sriov_state_snapshot *snapshot)
-{
-	return container_of(snapshot, struct xe_gt_sriov_metadata, snapshot) - gt->sriov.pf.vfs;
-}
-
-static void pf_free_guc_state(struct xe_gt *gt, struct xe_gt_sriov_state_snapshot *snapshot)
-{
-	struct xe_device *xe = gt_to_xe(gt);
-
-	drmm_kfree(&xe->drm, snapshot->guc.buff);
-	snapshot->guc.buff = NULL;
-	snapshot->guc.size = 0;
-}
-
-static int pf_alloc_guc_state(struct xe_gt *gt,
-			      struct xe_gt_sriov_state_snapshot *snapshot,
-			      size_t size)
-{
-	struct xe_device *xe = gt_to_xe(gt);
-	void *p;
-
-	pf_free_guc_state(gt, snapshot);
-
-	if (!size)
-		return -ENODATA;
-
-	if (size % sizeof(u32))
-		return -EINVAL;
-
-	if (size > SZ_2M)
-		return -EFBIG;
-
-	p = drmm_kzalloc(&xe->drm, size, GFP_KERNEL);
-	if (!p)
-		return -ENOMEM;
-
-	snapshot->guc.buff = p;
-	snapshot->guc.size = size;
-	return 0;
-}
-
-static void pf_dump_guc_state(struct xe_gt *gt, struct xe_gt_sriov_state_snapshot *snapshot)
-{
-	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG_SRIOV)) {
-		unsigned int vfid __maybe_unused = pf_snapshot_index(gt, snapshot);
-
-		xe_gt_sriov_dbg_verbose(gt, "VF%u GuC state is %zu dwords:\n",
-					vfid, snapshot->guc.size / sizeof(u32));
-		print_hex_dump_bytes("state: ", DUMP_PREFIX_OFFSET,
-				     snapshot->guc.buff, min(SZ_64, snapshot->guc.size));
-	}
-}
-
-static int pf_save_vf_guc_state(struct xe_gt *gt, unsigned int vfid)
-{
-	struct xe_gt_sriov_state_snapshot *snapshot = pf_pick_vf_snapshot(gt, vfid);
+	struct xe_sriov_migration_data *data;
 	size_t size;
 	int ret;
 
-	ret = pf_send_guc_query_vf_state_size(gt, vfid);
+	ret = pf_send_guc_query_vf_mig_data_size(gt, vfid);
 	if (ret < 0)
 		goto fail;
+
 	size = ret * sizeof(u32);
-	xe_gt_sriov_dbg_verbose(gt, "VF%u state size is %d dwords (%zu bytes)\n", vfid, ret, size);
+	xe_gt_sriov_dbg_verbose(gt, "VF%u GuC data size is %d dwords (%zu bytes)\n",
+				vfid, ret, size);
 
-	ret = pf_alloc_guc_state(gt, snapshot, size);
-	if (ret < 0)
+	data = xe_sriov_migration_data_alloc(gt_to_xe(gt));
+	if (!data) {
+		ret = -ENOMEM;
 		goto fail;
+	}
+
+	ret = xe_sriov_migration_data_init(data, gt->tile->id, gt->info.id,
+					   XE_SRIOV_MIGRATION_DATA_TYPE_GUC, 0, size);
+	if (ret)
+		goto fail_free;
 
-	ret = pf_send_guc_save_vf_state(gt, vfid, snapshot->guc.buff, size);
+	ret = pf_send_guc_save_vf_mig_data(gt, vfid, data->vaddr, size);
 	if (ret < 0)
-		goto fail;
+		goto fail_free;
 	size = ret * sizeof(u32);
 	xe_gt_assert(gt, size);
-	xe_gt_assert(gt, size <= snapshot->guc.size);
-	snapshot->guc.size = size;
+	xe_gt_assert(gt, size <= data->size);
+	data->size = size;
+	data->remaining = size;
+
+	pf_dump_mig_data(gt, vfid, data);
+
+	ret = xe_gt_sriov_pf_migration_save_produce(gt, vfid, data);
+	if (ret)
+		goto fail_free;
 
-	pf_dump_guc_state(gt, snapshot);
 	return 0;
 
+fail_free:
+	xe_sriov_migration_data_free(data);
 fail:
-	xe_gt_sriov_dbg(gt, "Unable to save VF%u state (%pe)\n", vfid, ERR_PTR(ret));
-	pf_free_guc_state(gt, snapshot);
+	xe_gt_sriov_err(gt, "Failed to save VF%u GuC data (%pe)\n",
+			vfid, ERR_PTR(ret));
 	return ret;
 }
 
 /**
- * xe_gt_sriov_pf_migration_save_guc_state() - Take a GuC VF state snapshot.
+ * xe_gt_sriov_pf_migration_guc_size() - Get the size of VF GuC migration data.
  * @gt: the &xe_gt
  * @vfid: the VF identifier
  *
  * This function is for PF only.
  *
- * Return: 0 on success or a negative error code on failure.
+ * Return: size in bytes or a negative error code on failure.
  */
-int xe_gt_sriov_pf_migration_save_guc_state(struct xe_gt *gt, unsigned int vfid)
+ssize_t xe_gt_sriov_pf_migration_guc_size(struct xe_gt *gt, unsigned int vfid)
 {
-	int err;
+	ssize_t size;
 
 	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
 	xe_gt_assert(gt, vfid != PFID);
@@ -236,37 +193,15 @@ int xe_gt_sriov_pf_migration_save_guc_state(struct xe_gt *gt, unsigned int vfid)
 	if (!pf_migration_supported(gt))
 		return -ENOPKG;
 
-	mutex_lock(pf_migration_mutex(gt));
-	err = pf_save_vf_guc_state(gt, vfid);
-	mutex_unlock(pf_migration_mutex(gt));
-
-	return err;
-}
-
-static int pf_restore_vf_guc_state(struct xe_gt *gt, unsigned int vfid)
-{
-	struct xe_gt_sriov_state_snapshot *snapshot = pf_pick_vf_snapshot(gt, vfid);
-	int ret;
-
-	if (!snapshot->guc.size)
-		return -ENODATA;
-
-	xe_gt_sriov_dbg_verbose(gt, "restoring %zu dwords of VF%u GuC state\n",
-				snapshot->guc.size / sizeof(u32), vfid);
-	ret = pf_send_guc_restore_vf_state(gt, vfid, snapshot->guc.buff, snapshot->guc.size);
-	if (ret < 0)
-		goto fail;
-
-	xe_gt_sriov_dbg_verbose(gt, "restored %d dwords of VF%u GuC state\n", ret, vfid);
-	return 0;
+	size = pf_send_guc_query_vf_mig_data_size(gt, vfid);
+	if (size >= 0)
+		size *= sizeof(u32);
 
-fail:
-	xe_gt_sriov_dbg(gt, "Failed to restore VF%u GuC state (%pe)\n", vfid, ERR_PTR(ret));
-	return ret;
+	return size;
 }
 
 /**
- * xe_gt_sriov_pf_migration_restore_guc_state() - Restore a GuC VF state.
+ * xe_gt_sriov_pf_migration_guc_save() - Save VF GuC migration data.
  * @gt: the &xe_gt
  * @vfid: the VF identifier
  *
@@ -274,10 +209,8 @@ static int pf_restore_vf_guc_state(struct xe_gt *gt, unsigned int vfid)
  *
  * Return: 0 on success or a negative error code on failure.
  */
-int xe_gt_sriov_pf_migration_restore_guc_state(struct xe_gt *gt, unsigned int vfid)
+int xe_gt_sriov_pf_migration_guc_save(struct xe_gt *gt, unsigned int vfid)
 {
-	int ret;
-
 	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
 	xe_gt_assert(gt, vfid != PFID);
 	xe_gt_assert(gt, vfid <= xe_sriov_pf_get_totalvfs(gt_to_xe(gt)));
@@ -285,75 +218,45 @@ int xe_gt_sriov_pf_migration_restore_guc_state(struct xe_gt *gt, unsigned int vf
 	if (!pf_migration_supported(gt))
 		return -ENOPKG;
 
-	mutex_lock(pf_migration_mutex(gt));
-	ret = pf_restore_vf_guc_state(gt, vfid);
-	mutex_unlock(pf_migration_mutex(gt));
-
-	return ret;
+	return pf_save_vf_guc_mig_data(gt, vfid);
 }
 
-#ifdef CONFIG_DEBUG_FS
-/**
- * xe_gt_sriov_pf_migration_read_guc_state() - Read a GuC VF state.
- * @gt: the &xe_gt
- * @vfid: the VF identifier
- * @buf: the user space buffer to read to
- * @count: the maximum number of bytes to read
- * @pos: the current position in the buffer
- *
- * This function is for PF only.
- *
- * This function reads up to @count bytes from the saved VF GuC state buffer
- * at offset @pos into the user space address starting at @buf.
- *
- * Return: the number of bytes read or a negative error code on failure.
- */
-ssize_t xe_gt_sriov_pf_migration_read_guc_state(struct xe_gt *gt, unsigned int vfid,
-						char __user *buf, size_t count, loff_t *pos)
+static int pf_restore_vf_guc_state(struct xe_gt *gt, unsigned int vfid,
+				   struct xe_sriov_migration_data *data)
 {
-	struct xe_gt_sriov_state_snapshot *snapshot;
-	ssize_t ret;
+	int ret;
 
-	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
-	xe_gt_assert(gt, vfid != PFID);
-	xe_gt_assert(gt, vfid <= xe_sriov_pf_get_totalvfs(gt_to_xe(gt)));
+	xe_gt_assert(gt, data->size);
 
-	if (!pf_migration_supported(gt))
-		return -ENOPKG;
+	xe_gt_sriov_dbg_verbose(gt, "restoring %lld dwords of VF%u GuC data\n",
+				data->size / sizeof(u32), vfid);
+	pf_dump_mig_data(gt, vfid, data);
 
-	mutex_lock(pf_migration_mutex(gt));
-	snapshot = pf_pick_vf_snapshot(gt, vfid);
-	if (snapshot->guc.size)
-		ret = simple_read_from_buffer(buf, count, pos, snapshot->guc.buff,
-					      snapshot->guc.size);
-	else
-		ret = -ENODATA;
-	mutex_unlock(pf_migration_mutex(gt));
+	ret = pf_send_guc_restore_vf_mig_data(gt, vfid, data->vaddr, data->size);
+	if (ret < 0)
+		goto fail;
+
+	xe_gt_sriov_dbg_verbose(gt, "restored %d dwords of VF%u GuC data\n", ret, vfid);
+	return 0;
 
+fail:
+	xe_gt_sriov_err(gt, "Failed to restore VF%u GuC data (%pe)\n",
+			vfid, ERR_PTR(ret));
 	return ret;
 }
 
 /**
- * xe_gt_sriov_pf_migration_write_guc_state() - Write a GuC VF state.
+ * xe_gt_sriov_pf_migration_guc_restore() - Restore VF GuC migration data.
  * @gt: the &xe_gt
  * @vfid: the VF identifier
- * @buf: the user space buffer with GuC VF state
- * @size: the size of GuC VF state (in bytes)
  *
  * This function is for PF only.
  *
- * This function reads @size bytes of the VF GuC state stored at user space
- * address @buf and writes it into a internal VF state buffer.
- *
- * Return: the number of bytes used or a negative error code on failure.
+ * Return: 0 on success or a negative error code on failure.
  */
-ssize_t xe_gt_sriov_pf_migration_write_guc_state(struct xe_gt *gt, unsigned int vfid,
-						 const char __user *buf, size_t size)
+int xe_gt_sriov_pf_migration_guc_restore(struct xe_gt *gt, unsigned int vfid,
+					 struct xe_sriov_migration_data *data)
 {
-	struct xe_gt_sriov_state_snapshot *snapshot;
-	loff_t pos = 0;
-	ssize_t ret;
-
 	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
 	xe_gt_assert(gt, vfid != PFID);
 	xe_gt_assert(gt, vfid <= xe_sriov_pf_get_totalvfs(gt_to_xe(gt)));
@@ -361,21 +264,8 @@ ssize_t xe_gt_sriov_pf_migration_write_guc_state(struct xe_gt *gt, unsigned int
 	if (!pf_migration_supported(gt))
 		return -ENOPKG;
 
-	mutex_lock(pf_migration_mutex(gt));
-	snapshot = pf_pick_vf_snapshot(gt, vfid);
-	ret = pf_alloc_guc_state(gt, snapshot, size);
-	if (!ret) {
-		ret = simple_write_to_buffer(snapshot->guc.buff, size, &pos, buf, size);
-		if (ret < 0)
-			pf_free_guc_state(gt, snapshot);
-		else
-			pf_dump_guc_state(gt, snapshot);
-	}
-	mutex_unlock(pf_migration_mutex(gt));
-
-	return ret;
+	return pf_restore_vf_guc_state(gt, vfid, data);
 }
-#endif /* CONFIG_DEBUG_FS */
 
 /**
  * xe_gt_sriov_pf_migration_size() - Total size of migration data from all components within a GT.
@@ -597,10 +487,6 @@ int xe_gt_sriov_pf_migration_init(struct xe_gt *gt)
 	if (!pf_migration_supported(gt))
 		return 0;
 
-	err = drmm_mutex_init(&xe->drm, &gt->sriov.pf.migration.snapshot_lock);
-	if (err)
-		return err;
-
 	totalvfs = xe_sriov_pf_get_totalvfs(xe);
 	for (n = 1; n <= totalvfs; n++) {
 		struct xe_gt_sriov_migration_data *migration = pf_pick_gt_migration(gt, n);
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
index 4f2f2783339c3..b3c18e369df79 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
@@ -15,8 +15,10 @@ struct xe_sriov_migration_data;
 #define XE_GT_SRIOV_PF_MIGRATION_GUC_DATA_MAX_SIZE SZ_8M
 
 int xe_gt_sriov_pf_migration_init(struct xe_gt *gt);
-int xe_gt_sriov_pf_migration_save_guc_state(struct xe_gt *gt, unsigned int vfid);
-int xe_gt_sriov_pf_migration_restore_guc_state(struct xe_gt *gt, unsigned int vfid);
+ssize_t xe_gt_sriov_pf_migration_guc_size(struct xe_gt *gt, unsigned int vfid);
+int xe_gt_sriov_pf_migration_guc_save(struct xe_gt *gt, unsigned int vfid);
+int xe_gt_sriov_pf_migration_guc_restore(struct xe_gt *gt, unsigned int vfid,
+					 struct xe_sriov_migration_data *data);
 
 ssize_t xe_gt_sriov_pf_migration_size(struct xe_gt *gt, unsigned int vfid);
 
@@ -34,11 +36,4 @@ int xe_gt_sriov_pf_migration_restore_produce(struct xe_gt *gt, unsigned int vfid
 struct xe_sriov_migration_data *
 xe_gt_sriov_pf_migration_save_consume(struct xe_gt *gt, unsigned int vfid);
 
-#ifdef CONFIG_DEBUG_FS
-ssize_t xe_gt_sriov_pf_migration_read_guc_state(struct xe_gt *gt, unsigned int vfid,
-						char __user *buf, size_t count, loff_t *pos);
-ssize_t xe_gt_sriov_pf_migration_write_guc_state(struct xe_gt *gt, unsigned int vfid,
-						 const char __user *buf, size_t count);
-#endif
-
 #endif
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h
index 84be6fac16c8b..75d8b94cbbefb 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h
@@ -6,24 +6,7 @@
 #ifndef _XE_GT_SRIOV_PF_MIGRATION_TYPES_H_
 #define _XE_GT_SRIOV_PF_MIGRATION_TYPES_H_
 
-#include <linux/mutex.h>
 #include <linux/ptr_ring.h>
-#include <linux/types.h>
-
-/**
- * struct xe_gt_sriov_state_snapshot - GT-level per-VF state snapshot data.
- *
- * Used by the PF driver to maintain per-VF migration data.
- */
-struct xe_gt_sriov_state_snapshot {
-	/** @guc: GuC VF state snapshot */
-	struct {
-		/** @guc.buff: buffer with the VF state */
-		u32 *buff;
-		/** @guc.size: size of the buffer (must be dwords aligned) */
-		u32 size;
-	} guc;
-};
 
 /**
  * struct xe_gt_sriov_migration_data - GT-level per-VF migration data.
@@ -35,14 +18,4 @@ struct xe_gt_sriov_migration_data {
 	struct ptr_ring ring;
 };
 
-/**
- * struct xe_gt_sriov_pf_migration - GT-level data.
- *
- * Used by the PF driver to maintain non-VF specific per-GT data.
- */
-struct xe_gt_sriov_pf_migration {
-	/** @snapshot_lock: protects all VFs snapshots */
-	struct mutex snapshot_lock;
-};
-
 #endif
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h
index 812e74d3f8f80..667b8310478d4 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h
@@ -31,9 +31,6 @@ struct xe_gt_sriov_metadata {
 	/** @version: negotiated VF/PF ABI version */
 	struct xe_gt_sriov_pf_service_version version;
 
-	/** @snapshot: snapshot of the VF state data */
-	struct xe_gt_sriov_state_snapshot snapshot;
-
 	/** @migration: per-VF migration data. */
 	struct xe_gt_sriov_migration_data migration;
 };
@@ -61,7 +58,6 @@ struct xe_gt_sriov_pf {
 	struct xe_gt_sriov_pf_service service;
 	struct xe_gt_sriov_pf_control control;
 	struct xe_gt_sriov_pf_policy policy;
-	struct xe_gt_sriov_pf_migration migration;
 	struct xe_gt_sriov_spare_config spare;
 	struct xe_gt_sriov_metadata *vfs;
 };
-- 
2.50.1

