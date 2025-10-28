Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4556C16A6D
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 20:44:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 829F310E64C;
	Tue, 28 Oct 2025 19:43:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SgpzUPIm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2620810E64C
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 19:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761680620; x=1793216620;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=LMcFwSst3fZtQqGThFaGvaKG8wlz4J+OgkxXg9oH6V0=;
 b=SgpzUPImAWewqcTOgfK5n2+9nk6GyhNAGJ62iMqxkq1uaNTWWf+7LwQd
 QqeSS5ePffOJyeuVMAlrC/BtjicPPIwJX5eaXiIrzWSWq3V4iSxnubX4P
 25KganrlZ6dWS/XeW4cvR7Vt70yqEQI1q4MtN7EUFK3Zh3PZQTNNte9Se
 VDH+cvmayPBC/EL6qFj+sSQAjYbsbshEjhnAW8T/yETSW94d3bI7lLqoq
 TdmxkYVcrGUB7zT2qa/AknwYTtcydw3+yzV82uknOFD9iOazeuRVBwTKa
 iK6B/CrJGEPUpucxo5Wmsx80HXOqG0l43QyZ3/Cebvlei/ERHnmuPMVlB w==;
X-CSE-ConnectionGUID: d131EQwEQDijHvuR5uBRrA==
X-CSE-MsgGUID: mkU/AE2QScC3s2kQ1IUHrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62822481"
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="62822481"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 12:43:40 -0700
X-CSE-ConnectionGUID: PrDFFY/sTtGtzECx02x5rQ==
X-CSE-MsgGUID: NGRPAk4OR9q7MBsuLlMC+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="189758473"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 12:43:40 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 28 Oct 2025 12:43:38 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 28 Oct 2025 12:43:38 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.22) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 28 Oct 2025 12:43:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H04Lax03VhbLdS6kQu3aAjyxELVGoEALFc/5ZaHalnodcCcq/Ip8ivJePlCTgQ6bnOrb+g9LiZY9bG5uu87ueE+wSRL5WJGrO7zF0CxPC4ipeRCNhaL8lvzD4m9A7eMUNaniTTO/PmwEM6a9d48v+V1gnrg+pWE9SojZ3h/h3T4meTWMoSxwHwLp5i7k8B8XGQEiMt5T8UfegFveo3tq+gRzi+GROYeBi1d5tQmwOMytcLTbf/E1q8LFED5Qy14GNvz3FjuUic998hg39UDPVJeIi7e6jFtEjcIXLn0fY5TKwnVdgJiKRXUxowmso1l0yEoS5LhzlQsVPIKVvgHp3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RpU++PPdInXcVRSrHYj3TWdfKZcIBVP5rXCuxS7z6Fo=;
 b=KJLa/EtVSDjJp3/PpKl/p8PlwH3iITru+/PqenRKKMAugK+Q/k+QLhjJbORCsSTCZ6WZ+oVaXG0QWXCeCsRYW0CgOT3QhjAMq8/QSh2Xj0rCaNvB+utua2iJrqNCEsKzoHc9QYdwDqgAz79QkidX1P622qvknj93b9K25GaEUCJEuvEiq83LbZb4p6HEJYXVmhfIYogw6u1ZSMn4DClN4icdlKwdcuwamf8RnODBYDskPKSmv82Mt2K977FJKZjnLTl82yS+zem0Jv0GvSnBRghPmSxNryvngCAoe4ipcM8XaEma3dHJUQ0ty2TPtRTYWcUaXbNRUhWZzZ3IsYW+gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA1PR11MB7110.namprd11.prod.outlook.com (2603:10b6:806:2b3::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.17; Tue, 28 Oct
 2025 19:43:35 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9253.017; Tue, 28 Oct 2025
 19:43:35 +0000
Date: Tue, 28 Oct 2025 12:43:33 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Philipp Stanner <phasta@kernel.org>
CC: Danilo Krummrich <dakr@kernel.org>, Christian =?iso-8859-1?Q?K=F6nig?=
 <ckoenig.leichtzumerken@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, <tursulin@ursulin.net>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] drm/sched: Add FIXME detailing potential hang
Message-ID: <aQEc5eUR8bq+XNG1@lstrano-desk.jf.intel.com>
References: <20251028134602.94125-2-phasta@kernel.org>
 <20251028134602.94125-4-phasta@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251028134602.94125-4-phasta@kernel.org>
X-ClientProxiedBy: BY5PR17CA0022.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::35) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA1PR11MB7110:EE_
X-MS-Office365-Filtering-Correlation-Id: 80863221-3fbe-4aaf-b3d8-08de165a48ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QS9pdktsaTBNVDduUk5BV2s0S3NBZ3ErNHFwR2JvS0tmUCtXT1h4V0tSZUk4?=
 =?utf-8?B?Q1llOG9hdkRPT1JLTDFZMDRpYWErdHFGRzh4ZEhPR05WSGlpY0NRR1ZoYk1x?=
 =?utf-8?B?T1NzZWlKTlVZNGNLZTRTdGhPMmV3VC9VeUovY3Q2VXJUcDFPQkZ5Vzh3N3Fy?=
 =?utf-8?B?VzdWUUJGSWh0VWlnN3ZNTnk4QTlhMTJzWHdhYUNzWkV5RjFJYkswWWVoL0to?=
 =?utf-8?B?YnkrN3UxWDAvb21PTjFlOHhIWWM4WTNHZHEycFJVSitPRC8xWVVOQWtyMjda?=
 =?utf-8?B?eG1LK1hreE8yejJPZFNPVDZOUVU5QTJtbDVwdGVjRXlNSkQzZFdJQlhBNVdO?=
 =?utf-8?B?a3ZzN2JOK25rUDhIQTBQMmhzU1g0RGY2OSt1OXYyUkwrQVdRVTdia0Y3VkFi?=
 =?utf-8?B?c3FzRWQ1TFZSM3FiWUJBQWNwenJLb3oyK1NRVWJ5SVNGdllvM2RLYk5ZaElu?=
 =?utf-8?B?NUQ3NUxUejFGZmt4cjlhZFAvTnlyUGJNbWJOOTB4V2tRMTlrMGtyV21iSTJj?=
 =?utf-8?B?UG55T0liU3YrYzZLQUZUOU1WUzZPMXpvT0xuNU1uTHlSd0NaSEhuVWgrUy9a?=
 =?utf-8?B?OXBYVklEeHZ6aWhyWWJvUlcwLzdQa0lpdVljWWY5Y3AyOUkxWWRoSGN2d1Z4?=
 =?utf-8?B?SEY5aFRJcDBMWGM4aUk4QThtYmJKb2xlYithTGZPanJSOEFiR0dyenAvTmRG?=
 =?utf-8?B?Y1BrUUhuN3VRdUNtRHgwZUpTUnFkNUNMQmFlYkFOdHBMWTBTVmZkQno5RDdr?=
 =?utf-8?B?eXVyc2xSdk00ei9oSHVYWms5YzdvV2V2QWtWV2o3RDQrRGV2czZOUW9HbndP?=
 =?utf-8?B?aFIzeWVjKzNJM2lDSTlHcCsyR3VzVU04L29NVXJZZHJwWlV3MGtzaXNObmE5?=
 =?utf-8?B?MG5JWUR3cEZacHA3dWQzb1Zqdlk2TTBKWSsxTDZHbXR1VlQyanA4NkR1SGhD?=
 =?utf-8?B?R0REMFdNb0FUcFMvUFNlamNXcjRydHlZbTA4enRJWGVzWVEzZ2RpRERSc2dP?=
 =?utf-8?B?Z3JBcndjc3FEQkJBVTNrbWJrYS9nQnhxRGc1ZTZlTFJTUGJ6VTh2MnZiRlJW?=
 =?utf-8?B?UTZWNk9TQjlaUjdzRHJrVVVLbjJjcVdsdzRjZFRKd2pJOEpXcjNHRWlUMzJO?=
 =?utf-8?B?VW5aT1cwTktWWFFNM2xLNFp6bUJjTTF0M3RzTmhXZjN2NGJmWG9ZZk9iT2tP?=
 =?utf-8?B?VENVLzFWU05SOU5hZGxXWnFYME5oWGY1OGFJSEJqUnlEZlJiNXpMam5teWRF?=
 =?utf-8?B?SVAxdXpwZjRNeWJ5dzR1ZWl5dE9MRk00WnZDbVZ2WUJBV05YZ2ZINHY3c05T?=
 =?utf-8?B?aXdTTDNsbi9xZFJTSXpGMXJOaldVeHA0SDRkRVoyWXJqckRhalBFZ0wwa3g4?=
 =?utf-8?B?aWFQZEwyS083eUN5Tm1jUVFHa0tEbndiM1AzdlJKdks5T0JTZ1dNWHVHVkZM?=
 =?utf-8?B?UnMzV3pyZVNKeERnQ3h3Zy9CcmVWTVZsc3ZCUnVMMUJyQWEyQWJpQ3pDRE9N?=
 =?utf-8?B?eFZ6UkhCZW5TcURzb2ZWSEVaWW04d2dsQWpPRlZ2OTJmOVVwTEU2d3lJSG9Z?=
 =?utf-8?B?dEtuU04rNjEzQW5xNy9hV0w4NmxjNjJ0dm5tVFFlU3IxNUJRc3VubVBQdDVk?=
 =?utf-8?B?bnNYUXJMYWRVaFJnQ1NMd29RcE9XOEw2QUZ1eGFGQ3lnMnpQaU1XUHA4VlpZ?=
 =?utf-8?B?WEJ4Z2M2SVBrVzJUM3RYd281MFdvNEMveDBuNW52Zkd2ZTNsakxVRFVia0Fs?=
 =?utf-8?B?MFYwWmZUdnA1NHhKcjhpWDFOM2lKSGVyM016Z3ZwQVlsQkNZSC95WHQzRFhS?=
 =?utf-8?B?RXBqWlU1Rk9Ha3crRGtJQ1QwZWxNc2ttZVVDMzlMaTBPQ2NwT2RFRHZBY2xR?=
 =?utf-8?B?Q0RyTUlqb0ZUNm5EcVVjNnQwNUV4SGcvZWdONUhldEFKTjdsWWZYTkMwMDR4?=
 =?utf-8?Q?fTww67DlKxiD51wxfnyWq87b1K+xRiNZ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N3JNWVNUeWI5dDhzYy9ydjJ6dU1Tb1Q3b1I4TDVick5rYUYyT3FLaHJhUldY?=
 =?utf-8?B?YlUxZ1g4QzQrSk1CSEdPM2tRUkkvQmVvRjRKOFhBT1czZnZMZG55emVqNDNq?=
 =?utf-8?B?YVRnTkRkWmNRdVdQMHF5ZHdHUFUreGV1WjEvcms5WlRiN2d0d0dVVUVjalhI?=
 =?utf-8?B?QUtlQVFucjRncVNCN0gyQ1dQSldnOENhWHBoWjVVQlpWY25qK1Evd0hvUWd2?=
 =?utf-8?B?TXBqbmduUytNaEpVNi94czY3TW5NaTNOcUV4WEdlVjQwZmRaWjFBcGM4aVEr?=
 =?utf-8?B?QytsUkd0T3EyQnhDd3BLOU1Ba2szajhHN3lYUXVkSlhOL2R1WXFuZ1VNcXo5?=
 =?utf-8?B?dWwwa3hSbHJrY0QvbHorSDdIekNBWWs5aTdXUmpuSENiZmx6SEMvZW95MVVl?=
 =?utf-8?B?bjNYb3ZWMVZEVVNTSVVqbTVyVmkvc24wUFlYVkl3c05xblZkTmtLT1F4R2Fv?=
 =?utf-8?B?bC9ZZGZtTmp4SSt4RlFlUmlOamlyRW4xTlBkdXRaNlIvZkRxdzRxdzMxZU13?=
 =?utf-8?B?TUwyUXhndmVZWGRIRW1iV0JZSktQQlhPNmJKME13UzNIRjhEb21nVi8xZmZJ?=
 =?utf-8?B?R1BQOCt0TksxbXhXOXM4YlVxQm9XTjBaSkUxMGRvR2tuVGFIRnN1UmYwWGNm?=
 =?utf-8?B?QS9ld0lWeUE1cm45SnFDVm0xRHBqbXNyQzhGUlBkOFJmcDdkTjBwT3NWRUQ4?=
 =?utf-8?B?Z01MeXRvdy8rSlNqUEM3d1Q2QUtibkNzTk0raHVtSHZhN05Na3NXVFFzUkhQ?=
 =?utf-8?B?V0MxdVFCTndmVDdOSlV3dTdVUmt6bFNJcUVSYjFqQmlkVjQ2RGlJTUcyR2hQ?=
 =?utf-8?B?SmVKY1h4QzIvZnJiQ0MyUVp6U2N1dnJRWUtoanF3d0k5NHVURGZxczl2YXVH?=
 =?utf-8?B?VDF5djhvN0k1SzZKam15elV5RllyeFA5TVJJdmpZV3hQdHdkdGpybXkxRjdP?=
 =?utf-8?B?aHhxenNBUFEwM0YvcytscFowRm5nL2dtV1ZpTnN0WU1MSnJkMjUrUmtaclBa?=
 =?utf-8?B?MS85R2xGVHovTFRqeXJnbVZXWlZSMVRIWXNnR1BqaG9EbEFXSlFEZXFPd1Fw?=
 =?utf-8?B?ZDh2ZnpFUWF1TDRtTEh0VFdWU2J1cGlSMUVtNTdvMHFvQjUwNkRacmN2bmN3?=
 =?utf-8?B?cXpFT3NTazkvb3FwTWNDRVY5SVZGVnpwQm5GeFNrMnNuNkVFU29ZcW1hWFhB?=
 =?utf-8?B?VE56MkxtZVNlSFJtejFSb1dJL0FYMjhuRDVwaGtacU1ieEdaekkxempnRkhI?=
 =?utf-8?B?Qnpsd3QxMEkzWEhhbUc1SDV6TW55RGNVbExQNUMyMDc5cGR1NngvMlp2QzN5?=
 =?utf-8?B?dUVIVnNKZTFwbTBUOUxHdDRoS054dnpyd2UvNE1aSFpHNUM3MW84U25KMEsy?=
 =?utf-8?B?b2htbUxzNmt3ZUZ4dktnTWtRT3NsVm1oTVdmSEJKZGVURmZxeXY2MWFhR0RG?=
 =?utf-8?B?U2JwSHZiV3hVR1hSMzJ2WmNEclpBS2pBdWNIQjk5YWdLRHZVbGFwRUZhcnhF?=
 =?utf-8?B?d3JwYzhvMEpGd2JtT2Z2N05ZWmdtVjNoN1h5OHBzRHJtZXFXRCtHTWVKNXQw?=
 =?utf-8?B?Nzd0MlFXT3YwanpiMWRJcFhKL0VBZ3VUMWFlMG4zVWVkcGlrYTJZdWJwOHVw?=
 =?utf-8?B?bVQycjg4QkgycWlMNVZwcEl5Q0ZDd3JnQzg4VDd4U3llMDZONndnYlg5QTRt?=
 =?utf-8?B?bWgwTTZ6OUs2cDEwcVd4TzhrWS9pSzNleHowdDlyTmUwK3FUQWF3REdqYWRr?=
 =?utf-8?B?akdxQnRmdEFVZVk2S0JUeFRldWsrdEhpclRpblVsekRQbUpnL1doY2lqYVcw?=
 =?utf-8?B?N2xMZk5PRHVQbDZRVEZBRkE5SlQwSExSZUo4QUpUbktmK29TaGpEbmQrVno4?=
 =?utf-8?B?anpGMjNtUTBzUmVOeWVBeWdOcG5yWW54SjBoZjRWM0RUd3VYQ1ZvU0JJQWpE?=
 =?utf-8?B?MXQ1bW4wSzFtc1ZSTXFiNVZtZ0h4SFV6MkE0YTVPV0JHL3hoSlJKWkRIK2tX?=
 =?utf-8?B?NXZDcjN4NHhma01vUWsvT2JkY3VNUnk5UVM1ODFiQmtOYzlzMGU4K2F2bXJp?=
 =?utf-8?B?N2djS3ZlV0RYMU1Xc0s1UU1rZFEwMXFrWG03cEh6K2xpRk5qQzdPTXNRNFhh?=
 =?utf-8?B?bXhCaytoTFVZdkdYZVRkR2FmWm9ud3pxamRtaGJKMWU4MkgzK2FveHRJb2Mr?=
 =?utf-8?B?dkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 80863221-3fbe-4aaf-b3d8-08de165a48ba
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 19:43:35.8030 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +BqO54Cx6NcD5iHNziDJcM7fJ7dAbsV2vi6PmupTq2UfOuxcbfs2pnClOWOSB8dMGYlfdp9UEQ3+y7D2dvxJ8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7110
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

On Tue, Oct 28, 2025 at 02:46:02PM +0100, Philipp Stanner wrote:
> If a job from a ready entity needs more credits than are currently
> available, drm_sched_run_job_work() (a work item) simply returns and
> doesn't reschedule itself. The scheduler is only woken up again when the
> next job gets pushed with drm_sched_entity_push_job().
> 
> If someone submits a job that needs too many credits and doesn't submit
> more jobs afterwards, this would lead to the scheduler never pulling the
> too-expensive job, effectively hanging forever.
> 
> Document this problem as a FIXME.
> 
> Signed-off-by: Philipp Stanner <phasta@kernel.org>
> ---
>  drivers/gpu/drm/scheduler/sched_main.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 492e8af639db..eaf8d17b2a66 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -1237,6 +1237,16 @@ static void drm_sched_run_job_work(struct work_struct *w)
>  
>  	/* Find entity with a ready job */
>  	entity = drm_sched_select_entity(sched);
> +	/*
> +	 * FIXME:
> +	 * The entity can be NULL when the scheduler currently has no capacity
> +	 * (credits) for more jobs. If that happens, the work item terminates
> +	 * itself here, without rescheduling itself.
> +	 *
> +	 * It only gets started again in drm_sched_entity_push_job(). IOW, the
> +	 * scheduler might hang forever if a job that needs too many credits
> +	 * gets submitted to an entity and no other, subsequent jobs are.
> +	 */

drm_sched_job_done frees the credits, which triggers
drm_sched_free_job_work, and that in turn triggers
drm_sched_run_job_work.

This flow could be refined a bit, but I do believe it works—unless I'm
missing something. I'm pretty sure we have tests in Xe that exhaust the
credits, though it might be continuous submissions; I'd have to check.

Matt 

>  	if (!entity) {
>  		/*
>  		 * Either no more work to do, or the next ready job needs more
> -- 
> 2.49.0
> 
