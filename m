Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30ECAC17C95
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 02:11:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05F3210E6CF;
	Wed, 29 Oct 2025 01:11:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ho9PO/yP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE06110E6CE;
 Wed, 29 Oct 2025 01:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761700302; x=1793236302;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=htTHzekiqMSNwtL/xKBiL3XxL/ZU7YmWL9d+u96qxP0=;
 b=ho9PO/yPropRbokibYjORz9KfvOwjmzqYUnSVfZZiGWXMvIbu1uLYrXl
 Vv2Z83gDSyEomFCDaCZshpkjgXgSgTiwIWE5x2S3d4/SVJD0af+FL3zD/
 D4XtOk5iohC+VPptJWA6ryoYBYBhN9Hy5PIQk6EDZmhDju9RAhFqEcqth
 XsK3k0Y5hCxg7qgcQzyDI7fembj7kkM1Nk96dy6Ni73IC9EihJHOI4wga
 KQhcivoEdbSsgXdHTMKc1niJh4W/w0H21sDQHTfiWTX0DgJvwjvlKZ7dR
 e3oqEwIjCcSIy3hgTLiQ57Sz5D5bDQWU+dgNu1hIrY3PQEhPSoEQ9H442 A==;
X-CSE-ConnectionGUID: 1iGs3zSyQuK0hqtUhMH6hw==
X-CSE-MsgGUID: 9FSYGZoJSD2UXNs3oGiqvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74931239"
X-IronPort-AV: E=Sophos;i="6.19,262,1754982000"; d="scan'208";a="74931239"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 18:11:41 -0700
X-CSE-ConnectionGUID: 7egzY1bNTLOGiVmH7rb5Ow==
X-CSE-MsgGUID: QlnDWtnwSeOo4vwbQW8ZoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,262,1754982000"; d="scan'208";a="190645696"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 18:11:41 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 28 Oct 2025 18:11:40 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 28 Oct 2025 18:11:40 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.34) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 28 Oct 2025 18:11:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MH6sJ0kEb5a5hElhHImSI0LZQc/YvisewdK6xpGvAq+83WYlvRe+z7q4vOilzXnXVJXJGxxPNZ/C/PZQvPDQtjkAaWVJtZnZH4CtBO5rAeQqqPCR0I5Rz5LYWrF9edurxE+gr9sTqNy88sPNvopRzHxiKYRFXrCg11EjAvC+hPTu0jyahWYhHB/dvCnzL58gbIRw3Sj/nT0iWC0luwNQM7m9GTqvcIpCVm9pIPmvyMowzQHc7cW6Q5bqGIEGtL3aPMCQAkVVV8bu4SVToANXzQnLHRHX5IyLkk6rQYLIcy1OpnxkalCBiH2ihDTi9/B21PQYPSwMbNoPLEHYKFeYIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FeBvJuA1bDqK5S2akQRltqUvnYBLMgxUHK0dTvn0vtU=;
 b=cNSLFmKXJEw0aVCQ8buzACDE3NsO3okhbGiOPE8Typ3R+xAqW1qBx8QrBdcSiyaqQ5X8hWS67y1mc1ovZNnEr9rvKs5CrF2oRuOsmQr3WdzDR31BXkdNdKm6kQAQmKmCeNW3ams8mcqUvf3qci/ZzSY+wqEiN3zGbISSdZpVTJXdtRxOaZ5aTGR2kMtv7W/dsx9K8YyWLSCTh1/cIGgIH3DL8UduPU3x+GtgbvNIs0ryHqKe0J9w2IpkChC4lpjR3b+HQ//xZ3j4WF26JZ2NYgvwjgfFPq3HBllb13Vu4jLCtN7Z3ilI7voB3yCdr4pEpnYDQOPf63V8mdf0OAJWww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW5PR11MB5785.namprd11.prod.outlook.com (2603:10b6:303:197::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Wed, 29 Oct
 2025 01:11:31 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9253.017; Wed, 29 Oct 2025
 01:11:31 +0000
Date: Tue, 28 Oct 2025 18:11:28 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <himal.prasad.ghimiray@intel.com>, <apopple@nvidia.com>, <airlied@gmail.com>, 
 Simona Vetter <simona.vetter@ffwll.ch>, <felix.kuehling@amd.com>, Christian
 =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, <dakr@kernel.org>,
 "Mrozek, Michal" <michal.mrozek@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>
Subject: Re: [PATCH 01/15] drm/pagemap, drm/xe: Add refcounting to struct
 drm_pagemap
Message-ID: <aQFpwOCqBq+Z21Rg@lstrano-desk.jf.intel.com>
References: <20251025120412.12262-1-thomas.hellstrom@linux.intel.com>
 <20251025120412.12262-2-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251025120412.12262-2-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: BY5PR16CA0013.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::26) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW5PR11MB5785:EE_
X-MS-Office365-Filtering-Correlation-Id: 5cedc16f-d7af-4e81-e3c0-08de1688184a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|1800799024|376014|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dUhkcm9Xbm40eDNWTU0zQXE3bFVxdU90L1dEdkpQRlMrVWliaU9kRFRWVUZz?=
 =?utf-8?B?eFFjM2VuNnlXSGkwZzFtZEVlMWZKamROR0Fxcm1CM0NTZldGNy9GcHF5b0tk?=
 =?utf-8?B?K2lGRlhHWllVVW1GUTB2WVV5ZldxSXV3WS9IRjNCM1FPOFFhZDlHdzhkcjd3?=
 =?utf-8?B?K0RpS0E5MVBYSFhCb1lydVV1Um03WXZCZUhGcDlqbEM0UWhjdlorNmY3Rzg4?=
 =?utf-8?B?NTlyNXliNmFJVkl2M2FIdUVOaW5CVG8xMUNpaEs3UDYxeWNVaHFiblZvLzg1?=
 =?utf-8?B?Ty9CRmR0WmZQUFFEWGRTMEtnanpUcm9tSzYvbHVtRDBUcjhqN3p5SytBN1pY?=
 =?utf-8?B?OC9wMy85NjhkL0ZYYytDNUVOT08xbXd6WlJtNEY2TERxZEtWVDdqdVU2b2tS?=
 =?utf-8?B?UTR3T2hJTnhUM2h2bDBGa1QvSlp4S1RvSkJEYXhTdzFkdWtKYkhscm9kSngv?=
 =?utf-8?B?L1pRamdQUjJsOTcrSWNaSU1EVDRSYmN3WjBRVVN6TFQzQXp6NEcwSWtoMFRM?=
 =?utf-8?B?VGNMNEFrVWNzYUlERUI3ZVp1c29pRzVXdDhnQnptWFIwL3ZnRkJUOHhhV0JN?=
 =?utf-8?B?RTFuWlBrazhuVkRxejMrL21sY1hWQjU0dFl5SkJCUVBFQ1N0RVFLYnNFTWw3?=
 =?utf-8?B?TmI2ZFdYQU8yRTFtQVFTbDIrV0ZlSml0akhWamo4UlpJMlZydEM4bXZyVlJn?=
 =?utf-8?B?Tis0WHZLS2drd0pDQ3JzSXViM095b1ppRHBOSTZwRnlwaDg2TGUwTjc2RzZm?=
 =?utf-8?B?bjN0ektiSnp0bnljZ3NmU29udWFwb0lKNExvdFYvZEE3V2NmS1dxRGlsclk1?=
 =?utf-8?B?Yjk1T251Z05sSXNqTXZkMkFVeE1rY0FlbCtndHROc2pkS3NFYUVrWHNYODFM?=
 =?utf-8?B?WUp6UExvS1JCK0VuVGc4SUY5SS9qOU1oM3dmT0tMdC9YK1hpaHlhcHRuQWpD?=
 =?utf-8?B?aEhlUklCOHpIYTh3QU4weWRFU3V5WVRiRTRDS21vcmZvRC9ZRUROQVpRcjlE?=
 =?utf-8?B?N1JlSlNFRGRhZGVFRW9QREt0MERZcWthamYxWjJGVzI0NmtGaks5SERjZ01t?=
 =?utf-8?B?enBjdkJLS3lvUkVQRzJsbm5DbnJhZmRYWFBhdm9rUXBLWFpZc3ZnSHFHdWh2?=
 =?utf-8?B?ZWdzL2txYlF5WUtqVGpmUjFWSWpCWGpvaWovOUEzRmphV3YzUHFRaWVXTEJw?=
 =?utf-8?B?TGI2YTNkbWpsTU5qaUN3Zkt5TEJ1Q3dqaERma1REb2hrWHBSemE0ZWJHNTRI?=
 =?utf-8?B?S3IzM1dla2RDbGp3RlVkMms2UkJyUURHTnVrUHhFRU9sajhPbFR0UXcvKzNO?=
 =?utf-8?B?bCtMRHcrUzhKT3ovL2JQUkZEcEUxUnlBNEhrczZMdndmUDZTc2xJTWljK3Vh?=
 =?utf-8?B?QzdDRmhESXl0TWF2azhlTG5ESlBYNm5nVTZaL1JQRzJRQmg5U1NGY0hjZzd3?=
 =?utf-8?B?ZGNtSms0UHMvYmFlMk50SjFTK1R0S21lQnN2UVZwU1NwV1NsU0RFalE2Wnpm?=
 =?utf-8?B?aXMxVVF5eDZwRWx5Sm5NS0FZSWsxQ1AyYzNYVDNvejJpUm9PUmQvVTNEdkFZ?=
 =?utf-8?B?dEhENW1ualpGSkgwekV6Vk82NWZ2dkRhREthczE1dExLSVhqVThiWUhQcFBF?=
 =?utf-8?B?ZmpraUhFS01NNXFpUE9WL1ZzT29QeEVEZHVGUVhqWExMOHhLckVaTCtkUm1D?=
 =?utf-8?B?Qm9kQndWWU5nd1ByMmVRWUZJMkZ2cUF2UWYvMlgwY3orMGlZNjJqL2x1aXFW?=
 =?utf-8?B?cjQwWFFYRE0zaElId0tJRHN3UE9nM1hMTUR0Q0pwL0Y0dCtDalNtOHNYSFFF?=
 =?utf-8?B?ZDJoaFlMUmNsaU9TMzRJWTZpNkw2d1M5SG1DazlRQ1RkQU5kYU9QODA1eWND?=
 =?utf-8?B?cnVyOFhhakNXSHZaU1U1ZGhiSjRSZUdMSkNYYzZPS1R2V3NoSXhtVnZhanAy?=
 =?utf-8?Q?k2h/TklynJ0QJp+WjrYntUrO2QKtGDp9?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(376014)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d3NBUVBOVlhJa1lvcXFFSFFxaUNENVkyUWdNZ2k0dmNnRTk2Nk5YK1UxWUJ2?=
 =?utf-8?B?WGtGenJLMjhBcUQxSmlVMG1oTXVJNHJIUENiUU9sS2pqV2grYzNNOXE2Skt6?=
 =?utf-8?B?cFU2YlRFUnEvcXlkcFBVZVBnSkxvL2pjek5pbkswM1owVkxka3ZNbS95OWU0?=
 =?utf-8?B?cHpGdWs1RWRUKzIwZHZYaUxUczlnWWJ3VDFxTHZrWUVMbCtwVmN4eWJjMGdz?=
 =?utf-8?B?Qll6V2M1MFpsZkJsb3N5M2hSSzhSVDB5U1pnS3M1YnRjaWpVbnorSWtYbEhy?=
 =?utf-8?B?cmZyZzNrMk8rS0pYV0JoV0RvQnVqRWc5c2VrWlpBZmthYVVtdlZra2tEZmlE?=
 =?utf-8?B?Z0RLM0pGcEI5SXM2ZktFQS80cVZ5WlFPclNRTnBzQmNVcGNFbzNyQlFrZFVj?=
 =?utf-8?B?U1c5K2hjTGxJNUQ0elRhU1BKMlJtMzVOc1R2dzRoMWRwbXlHUFU4U2JuUC9C?=
 =?utf-8?B?ZmZlM29WcTk0TUwrZVdJUlcraGkwZG05NFczYWcrcEsvT09HWWU2NGgrVGxn?=
 =?utf-8?B?TVdTOWgyQVVDYnFtQmEyMG5FWndZakoxTzgwd1lHU1orSDVOMHdpUGZ1a01q?=
 =?utf-8?B?Ulp6eGx5K2dLSnhYV2RsMFVXUUlxbWRxcGtsUVQvUEdKaXdvTUUyV1JpZmx6?=
 =?utf-8?B?RGNEblczTE9nUm52R2IvaW9JVElXd1FRT0czdFhKQnJ0T21zb1I0eXlQZlEy?=
 =?utf-8?B?SzZyU0d6QnpiWDU2eVljQlVIWUhOcExQMFJvc0VjNEp0b2pjZm9qTjJKZkRk?=
 =?utf-8?B?MzEyUDFGb3dMUHE5WDBzWE9pZlh1b0E4dkpvRkU2WVo4YkJVYzhZUWIrSmN1?=
 =?utf-8?B?WkovOGdsV2Y5R0RQRm5wWUV6djI5Z3pYMzVJK1hGTTBvWXFlZUtKcUwwbURX?=
 =?utf-8?B?c2toVmh1U3VydEVlOFdqT2JDeEhTMVROMVRaMHR1YkgwaXNIMm5pdWR2TGRw?=
 =?utf-8?B?MVVpQTk2azhxNGI3WnBUaUdWNFRCbjgzQ0lLa2pWNHJYOU5HZ2Z3WitVWHhw?=
 =?utf-8?B?Skpsbi9DOWJtQVdwbXUvN1BrS1NmaTlucEJtM3puNktKRXNJVjZPQTdDNTNJ?=
 =?utf-8?B?c0lXWFE4eXdoSjVlajRCOUZmTUNHZFY3Mm41VUh5c2d6VERlK0FxWXZUMmhv?=
 =?utf-8?B?d2dUVjlRKzNqR3FKdUtBallFbHBrQVEydXlGK01IR251WWNvUTUxN3NxcjBS?=
 =?utf-8?B?RTZXNXpBR01TTU9SV2wxYzhvRmFHQ09Nc1pzYkFKa29vTmliMWt4Tkhxb2VK?=
 =?utf-8?B?QnV6SENSb0t3Nm84d0NVTHorbldyQzc3Z0p4VjZ3MGl0eFFoVzhVSHNYRFMz?=
 =?utf-8?B?SC94VURJemRjdHZ2dDVPYlhCSVNoM1pWcnJZbGhVOUUxL01nM3RZYmpVZjFW?=
 =?utf-8?B?UWhraDFwN0N6NXE4UUkvV3ZuVEtWdVUzZitUbEhUNTBxMkRFN3hSeWpjSkhI?=
 =?utf-8?B?OHJlK0NFQSswcUpNanZQM00wQUp6WXFxUTEwTDhHUUkzdlZqN2s0aDZ6YW15?=
 =?utf-8?B?Y2JlVjlzTHEwdmRjVFYreWJCOFlNak1reGhYWmlhQitEdHcxZGlxUE9JYmxx?=
 =?utf-8?B?MC9tRzF0RDJqZGtWSXhxYmZMOHl2bVZTL1c5Ym5NcDJ1czNKS0R3YUJVWUov?=
 =?utf-8?B?TTA4NkVpanNmVkg1bU9rVW1ta0tYYVlxVkxrWW8wQjA1SWVUN3diK0pKSmp6?=
 =?utf-8?B?aWgvZDcxR3ZOYjVuOFhVcytBdHk4a0dDOVVhWlo5QlQ2YU1KelJOc29UTk5k?=
 =?utf-8?B?emEwSHBSY1pyNVZRSWIxSDZ2clJrT3Vsem5yZ0NobFpVRWVWOEFQZWxKeEN1?=
 =?utf-8?B?R3FuSW56dTlDUFBjbGkvY1NUc0VUTnNGd29nRUx5aGhIc09RR0lVcldpOU00?=
 =?utf-8?B?UFJRbFlicGVqWWxNZ0Zoc2R5Umd5YW1ub0c2VE9URWNhTWptTkduVTBWbHho?=
 =?utf-8?B?NW4yUTBnQ2NBV0k5MnIvaFVnQU5tbGgrdkk2Z0FtRVBOQmFWdzZLS2xESG8v?=
 =?utf-8?B?Sk9vSitodUdrb0dCR1BWY3M5RFhxcDRucEpWT0M5ejVkT2hiQmZjeTd5Uko1?=
 =?utf-8?B?SElVbjl3ZjRyOGFRTWVRNGxucHQrNVFrS05GOUZNOXRjWVNRWUlxZ3NBSjBu?=
 =?utf-8?B?bk9TNGMvb3hFdzBPT0hOTEZXNjMxVHFQWFk0aHREeVJJWHovTjVPUDgwaEN6?=
 =?utf-8?B?Tmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cedc16f-d7af-4e81-e3c0-08de1688184a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 01:11:31.3663 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o4J5rcANdn8Ax7ujk4BZtu3vcr6tk1F4sCp5JtdO1dQt8VSf3ODqAYV02QBXfB7xSMl1F57uOGWbwXeiZq2FyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5785
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

On Sat, Oct 25, 2025 at 02:03:58PM +0200, Thomas Hellström wrote:
> With the end goal of being able to free unused pagemaps
> and allocate them on demand, add a refcount to struct drm_pagemap,
> remove the xe embedded drm_pagemap, allocating and freeing it
> explicitly.
> 

General commit for the series — could we add some kernel documentation,
ideally in xe_svm.c, that explains the reference counting scheme used
for drm_pagemap?

For example:

- An SVM VM holds a drm_pagemap reference to local pagemaps.
- madvise VMAs hold a reference to the preferred location pagemap.
- Allocated device pages hold a reference to the pagemap.
- The pagemap itself holds a reference to the device/module.

Reference counting schemes can be difficult to reverse-engineer and easy
to forget, so it would be best to document them clearly.

Matt

> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/drm_pagemap.c      | 51 ++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_svm.c        | 26 ++++++++++-----
>  drivers/gpu/drm/xe/xe_vram_types.h |  2 +-
>  include/drm/drm_pagemap.h          | 36 +++++++++++++++++++++
>  4 files changed, 106 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
> index 22c44807e3fe..4b8692f0b2a2 100644
> --- a/drivers/gpu/drm/drm_pagemap.c
> +++ b/drivers/gpu/drm/drm_pagemap.c
> @@ -538,6 +538,57 @@ static int drm_pagemap_migrate_populate_ram_pfn(struct vm_area_struct *vas,
>  	return -ENOMEM;
>  }
>  
> +static void drm_pagemap_release(struct kref *ref)
> +{
> +	struct drm_pagemap *dpagemap = container_of(ref, typeof(*dpagemap), ref);
> +
> +	kfree(dpagemap);
> +}
> +
> +/**
> + * drm_pagemap_create() - Create a struct drm_pagemap.
> + * @dev: Pointer to a struct device providing the device-private memory.
> + * @pagemap: Pointer to a pre-setup struct dev_pagemap providing the struct pages.
> + * @ops: Pointer to the struct drm_pagemap_ops.
> + *
> + * Allocate and initialize a struct drm_pagemap.
> + *
> + * Return: A refcounted pointer to a struct drm_pagemap on success.
> + * Error pointer on error.
> + */
> +struct drm_pagemap *
> +drm_pagemap_create(struct device *dev,
> +		   struct dev_pagemap *pagemap,
> +		   const struct drm_pagemap_ops *ops)
> +{
> +	struct drm_pagemap *dpagemap = kzalloc(sizeof(*dpagemap), GFP_KERNEL);
> +
> +	if (!dpagemap)
> +		return ERR_PTR(-ENOMEM);
> +
> +	kref_init(&dpagemap->ref);
> +	dpagemap->dev = dev;
> +	dpagemap->ops = ops;
> +	dpagemap->pagemap = pagemap;
> +
> +	return dpagemap;
> +}
> +EXPORT_SYMBOL(drm_pagemap_create);
> +
> +/**
> + * drm_pagemap_put() - Put a struct drm_pagemap reference
> + * @dpagemap: Pointer to a struct drm_pagemap object.
> + *
> + * Puts a struct drm_pagemap reference and frees the drm_pagemap object
> + * if the refount reaches zero.
> + */
> +void drm_pagemap_put(struct drm_pagemap *dpagemap)
> +{
> +	if (likely(dpagemap))
> +		kref_put(&dpagemap->ref, drm_pagemap_release);
> +}
> +EXPORT_SYMBOL(drm_pagemap_put);
> +
>  /**
>   * drm_pagemap_evict_to_ram() - Evict GPU SVM range to RAM
>   * @devmem_allocation: Pointer to the device memory allocation
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index 129e7818565c..6d2c6c144315 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -861,7 +861,7 @@ static int xe_drm_pagemap_populate_mm(struct drm_pagemap *dpagemap,
>  				      struct mm_struct *mm,
>  				      unsigned long timeslice_ms)
>  {
> -	struct xe_vram_region *vr = container_of(dpagemap, typeof(*vr), dpagemap);
> +	struct xe_vram_region *vr = container_of(dpagemap->pagemap, typeof(*vr), pagemap);
>  	struct xe_device *xe = vr->xe;
>  	struct device *dev = xe->drm.dev;
>  	struct drm_buddy_block *block;
> @@ -1372,7 +1372,7 @@ u8 xe_svm_ranges_zap_ptes_in_range(struct xe_vm *vm, u64 start, u64 end)
>  
>  static struct drm_pagemap *tile_local_pagemap(struct xe_tile *tile)
>  {
> -	return &tile->mem.vram->dpagemap;
> +	return tile->mem.vram->dpagemap;
>  }
>  
>  /**
> @@ -1482,6 +1482,15 @@ int xe_devm_add(struct xe_tile *tile, struct xe_vram_region *vr)
>  		return ret;
>  	}
>  
> +	vr->dpagemap = drm_pagemap_create(dev, &vr->pagemap,
> +					  &xe_drm_pagemap_ops);
> +	if (IS_ERR(vr->dpagemap)) {
> +		drm_err(&xe->drm, "Failed to create drm_pagemap tile %d memory: %pe\n",
> +			tile->id, vr->dpagemap);
> +		ret = PTR_ERR(vr->dpagemap);
> +		goto out_no_dpagemap;
> +	}
> +
>  	vr->pagemap.type = MEMORY_DEVICE_PRIVATE;
>  	vr->pagemap.range.start = res->start;
>  	vr->pagemap.range.end = res->end;
> @@ -1489,22 +1498,23 @@ int xe_devm_add(struct xe_tile *tile, struct xe_vram_region *vr)
>  	vr->pagemap.ops = drm_pagemap_pagemap_ops_get();
>  	vr->pagemap.owner = xe_svm_devm_owner(xe);
>  	addr = devm_memremap_pages(dev, &vr->pagemap);
> -
> -	vr->dpagemap.dev = dev;
> -	vr->dpagemap.ops = &xe_drm_pagemap_ops;
> -
>  	if (IS_ERR(addr)) {
> -		devm_release_mem_region(dev, res->start, resource_size(res));
>  		ret = PTR_ERR(addr);
>  		drm_err(&xe->drm, "Failed to remap tile %d memory, errno %pe\n",
>  			tile->id, ERR_PTR(ret));
> -		return ret;
> +		goto out_failed_memremap;
>  	}
>  	vr->hpa_base = res->start;
>  
>  	drm_dbg(&xe->drm, "Added tile %d memory [%llx-%llx] to devm, remapped to %pr\n",
>  		tile->id, vr->io_start, vr->io_start + vr->usable_size, res);
>  	return 0;
> +
> +out_failed_memremap:
> +	drm_pagemap_put(vr->dpagemap);
> +out_no_dpagemap:
> +	devm_release_mem_region(dev, res->start, resource_size(res));
> +	return ret;
>  }
>  #else
>  int xe_svm_alloc_vram(struct xe_tile *tile,
> diff --git a/drivers/gpu/drm/xe/xe_vram_types.h b/drivers/gpu/drm/xe/xe_vram_types.h
> index 83772dcbf1af..c0d2c5ee8c10 100644
> --- a/drivers/gpu/drm/xe/xe_vram_types.h
> +++ b/drivers/gpu/drm/xe/xe_vram_types.h
> @@ -72,7 +72,7 @@ struct xe_vram_region {
>  	 * @dpagemap: The struct drm_pagemap of the ZONE_DEVICE memory
>  	 * pages of this tile.
>  	 */
> -	struct drm_pagemap dpagemap;
> +	struct drm_pagemap *dpagemap;
>  	/**
>  	 * @hpa_base: base host physical address
>  	 *
> diff --git a/include/drm/drm_pagemap.h b/include/drm/drm_pagemap.h
> index f6e7e234c089..2c7de928865b 100644
> --- a/include/drm/drm_pagemap.h
> +++ b/include/drm/drm_pagemap.h
> @@ -129,11 +129,15 @@ struct drm_pagemap_ops {
>   * struct drm_pagemap: Additional information for a struct dev_pagemap
>   * used for device p2p handshaking.
>   * @ops: The struct drm_pagemap_ops.
> + * @ref: Reference count.
>   * @dev: The struct drevice owning the device-private memory.
> + * @pagemap: Pointer to the underlying dev_pagemap.
>   */
>  struct drm_pagemap {
>  	const struct drm_pagemap_ops *ops;
> +	struct kref ref;
>  	struct device *dev;
> +	struct dev_pagemap *pagemap;
>  };
>  
>  struct drm_pagemap_devmem;
> @@ -202,6 +206,37 @@ struct drm_pagemap_devmem_ops {
>  			   unsigned long npages);
>  };
>  
> +struct drm_pagemap *drm_pagemap_create(struct device *dev,
> +				       struct dev_pagemap *pagemap,
> +				       const struct drm_pagemap_ops *ops);
> +
> +#if IS_ENABLED(CONFIG_DRM_GPUSVM)
> +
> +void drm_pagemap_put(struct drm_pagemap *dpagemap);
> +
> +#else
> +
> +static inline void drm_pagemap_put(struct drm_pagemap *dpagemap)
> +{
> +}
> +
> +#endif /* IS_ENABLED(CONFIG_DRM_GPUSVM) */
> +
> +/**
> + * drm_pagemap_get() - Obtain a reference on a struct drm_pagemap
> + * @dpagemap: Pointer to the struct drm_pagemap.
> + *
> + * Return: Pointer to the struct drm_pagemap.
> + */
> +static inline struct drm_pagemap *
> +drm_pagemap_get(struct drm_pagemap *dpagemap)
> +{
> +	if (likely(dpagemap))
> +		kref_get(&dpagemap->ref);
> +
> +	return dpagemap;
> +}
> +
>  /**
>   * struct drm_pagemap_devmem - Structure representing a GPU SVM device memory allocation
>   *
> @@ -246,3 +281,4 @@ int drm_pagemap_populate_mm(struct drm_pagemap *dpagemap,
>  			    unsigned long timeslice_ms);
>  
>  #endif
> +
> -- 
> 2.51.0
> 
