Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6IaXOgFRl2nswwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 19:05:53 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42212161754
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 19:05:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEA1910E72E;
	Thu, 19 Feb 2026 18:05:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Kz+CC5db";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01FC710E72C;
 Thu, 19 Feb 2026 18:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771524348; x=1803060348;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=yyvdwTWXm2bcAXw5e5hXQAvVE15Vp4LzObFBYoATh/0=;
 b=Kz+CC5dbFuhqUQxZSKDkQFU+TwYeTJC65G4XaX/aULQlTOVHTfaG9ick
 ugU+HjALVJjCwY/J0GeVfhbDJtgRn3kZ4lwH+sohczSF0G922n+Q4ZXGb
 nN8NIgn/rxoZkyAf35g11jKiXnGcSHgxhJBbc71mximu38M8N3aMtjb7A
 RGvrHfRfokos6dNsg19dN5h4KSf93wDePfIhxSll4zVc6oNz6zLRuTt7W
 55eP83rw5SClP7zCl/G67kwLTcEwiEi9dFHOrcFN3xT9uBFokN1hsOGAt
 1DULtvL1L+9xkxxUh5CM5gaBAgnHQECleNC4LV8SMfVgdgDX7IqxX+gHV w==;
X-CSE-ConnectionGUID: EMpnYYTPTu6tLsRiem1cFA==
X-CSE-MsgGUID: SPZuq6t6S5ebwqQkDuoYpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="83242515"
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; d="scan'208";a="83242515"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 10:05:47 -0800
X-CSE-ConnectionGUID: TQ2Ohp+ER8OmRQjXoRk7Rw==
X-CSE-MsgGUID: gHADxtHMTcmhtmg6bcI6iA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; d="scan'208";a="213693060"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 10:05:47 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 19 Feb 2026 10:05:47 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 19 Feb 2026 10:05:47 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.17)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 19 Feb 2026 10:05:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WtYAPPKGW7X3v3iUipgc0HvQGEpklWeiZq6+bPMFv4ZD1yGHriqMUkWKuMmeLz3S8p8G3IEEnFWQyqTnrlbe+3DYDQUBY9IQ7OgI1P0975KU2lMlAvpXR7nm0s/LWw/rv9/A8zZka/AvtIVxIG/P8TXSS7qmNRqJ4LX2THfXgy8zHKAnfxgGx1FFF7pA+JniMrMk1SC511nveIckbUyJpsvakVZAie4fxZtG1JfcHpxcOETyXKJDUtadXF0hWYvN6Lj/eyJewX6LnSWOmWtjBXbqCWERLb0aLw8KeQwuQoFmC6ncM8EoiC6Yhv5unSimB+hV35h6l+h+ewHRjANwPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y2Vmmr/Zi7rIJZuoDmvKJt2hHeYZLqV/BBgdOW78Cag=;
 b=cpofVCytRnd6o43IjQ5Nf28l5hZQ4QYUL44TozxMFjFF9cHLAvIV9CumgCiAn+JTCb1umGfMqkLGnJt74/T07rucB8toCcwwjfy1Np8BcTZlA0Xav7+nP48ssACspNoORB+dypk2HYMVvt5Yj+Vmoe1TV9GHyQXH0qJJz27L23EohLeMQQgPmM0wgNRPTtiJ05Miq0KjlTkJj/7H22J47g7t48V/tIEt/ZNtFWH9swUZqK3SQe1iI3VUCTrcms/3GzjbwJ7H40YtJEaUyG2ngonhzw8uJ+LmROYUyBpvMmKQLijRyuDJDg0l9/N9N8UF2uyQTTau56H8NPLV+n1hLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH0PR11MB4871.namprd11.prod.outlook.com (2603:10b6:510:30::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 19 Feb
 2026 18:05:39 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%6]) with mapi id 15.20.9632.015; Thu, 19 Feb 2026
 18:05:39 +0000
Date: Thu, 19 Feb 2026 10:05:36 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Matthew Auld <matthew.auld@intel.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 <dri-devel@lists.freedesktop.org>, Maarten Lankhorst <dev@lankhorst.se>
Subject: Re: [PATCH v7 1/3] drm/sa: Split drm_suballoc_new() into SA alloc
 and init helpers
Message-ID: <aZdQ8Kd7RqBlXGMF@lstrano-desk.jf.intel.com>
References: <20260219105433.2234194-5-satyanarayana.k.v.p@intel.com>
 <20260219105433.2234194-6-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260219105433.2234194-6-satyanarayana.k.v.p@intel.com>
X-ClientProxiedBy: MW4PR03CA0176.namprd03.prod.outlook.com
 (2603:10b6:303:8d::31) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH0PR11MB4871:EE_
X-MS-Office365-Filtering-Correlation-Id: a5d44293-9594-4392-647e-08de6fe17cfa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?eaPZGbXxbjKkYHqr8t6wFaA+G5ZyJxp7QZjK5eVcEaaifsQzsD69Q8Kc4D?=
 =?iso-8859-1?Q?eJqdpUvRegqwahxLk9Mr6jc3yxLiItc3yjZom90H7jOnWaVL4aFGpGbAcm?=
 =?iso-8859-1?Q?HmzKxfShdREQK8Vf+It+sMeQq8aRlrcUxYN5wQy0CkCxxXiNVUw67S+fLV?=
 =?iso-8859-1?Q?a9blSyHdvYlMMi5Y77h8RqJ2mpxh+L8xbjlNhK0T8qSmXVx9d4rF+ZA011?=
 =?iso-8859-1?Q?bsVYOoBGj4rvO0D72cLTnfXsEvWCqBbYo4Xm+Ou+pFqq7/iVon/2EuyagF?=
 =?iso-8859-1?Q?blT074EE+LV0+Nq+N8VNPAdk/CzcdmnkokVcd99G5QZlWYpTBV92ttfavV?=
 =?iso-8859-1?Q?MbCVsU9OgmPyEJYXqiN74QNc5WrRfCJHCKz1GcKE2uzD/doFkjQCP+KcK6?=
 =?iso-8859-1?Q?mcqjje9aO4GjKRO0cqql7u1bE+mnAO7jdFttKpogRz/zMabV+ZuxjE19Pn?=
 =?iso-8859-1?Q?ZlEwuu2vksxKT3EBioQwoqBZTQq9BYygce5L1Bg+QxEOCQO3VEMO+IwEYU?=
 =?iso-8859-1?Q?/4OSlx9gWURkf7oNqF9fNdE5Koi+FGJCovMTuSNdYeGKAnoH10aSXkNVs2?=
 =?iso-8859-1?Q?gB/PUBcG9eEjo3W+qXbjhMi0qbs6IIMb22CIZf1iugXA8hZQXKVV4fxPYW?=
 =?iso-8859-1?Q?Q8i4BNbgrsNZQ9NEx9nAv7gtETxda38fNrhfWKVHrS3jAZ8GyG8JfeWqCY?=
 =?iso-8859-1?Q?T0v0vewkMauSvcW8dtedSVOFMcjw8Z1qHVO7Id2DbuMg2jD8eoiLepNvfI?=
 =?iso-8859-1?Q?h/hS51XnC5N6GmY+f02xRHYi0/un9x1vK39xmr6op/i0qUJ54xpy8uDd0t?=
 =?iso-8859-1?Q?JsbcguN+isaJDOPZFMe8ADtlxzem0nbVcPTNMFAXuI2DCe5J/hfN5Xq0yp?=
 =?iso-8859-1?Q?gWH+radtsD2n6+MA1SU6x/XlvtYN9Nz79UtmNhaDHv0UKy0ZaWRgoaLOCS?=
 =?iso-8859-1?Q?7s0ereX7DBWn8bG3kVKzHR7wrQodgCCjL+stO+HDSWm7UzmqjwYVvxSVaZ?=
 =?iso-8859-1?Q?6qNiVhqNIktvczkHpkGmGU7RRMEltIVzD4Er2j4OGYJ2fJAgV7jQ1VQbnO?=
 =?iso-8859-1?Q?d5Cq18AwtcvkEQx46So/JsmR/J2EXGQrdPqFhkPWE72wYFIZhqdSR43EEV?=
 =?iso-8859-1?Q?h4Rx5Zs2hWJtDhZ+cQC8fsYiRTjh7d2nA+0fPFHSotBXRN9w5v9DdSoTBj?=
 =?iso-8859-1?Q?EdYOlmvgCqffE5iT8akHWeNGK2rkaSiXuYictP2SKJaOLME3TMMXqcYP0m?=
 =?iso-8859-1?Q?vdNAl71/BVFQukTAuPEcgUpV2rFRfWGeOMtEQwtjBYDimjQQVXqhOuzuc+?=
 =?iso-8859-1?Q?FRxaGf2H5CZ3bHxBAqB48vQO5epOn+SXIOpbACbRZ1QUbMQVNbg4TTrQEb?=
 =?iso-8859-1?Q?rpy3zZHlfb+xUrMXhgv9u3H35Ww5F95i/7V2IQxxXvbHS5ZnvWSYATOIiE?=
 =?iso-8859-1?Q?fidUT37pUZ0Sekzot74Ier/YqBt4pXAlP0/qdEw7HV3dOSLFOCkkaZXvvA?=
 =?iso-8859-1?Q?dxg3V64o1hnC/aAhEz/Wn8ISQ2aOBs4F+psIv+yYh3uH6LmAL7cvtoDJdl?=
 =?iso-8859-1?Q?u2EV8su/8c0pZr/j9NHC5g2I2d6N9ZyNX2GMADwLyw3uP+YTQQsgIx+04I?=
 =?iso-8859-1?Q?9q54Qst2w0VtQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?/aJBULNOv7YZDVx1pJkvBURWCABgXZ9c6K9DMBcHWk9q3M8zV1v8AiG2LP?=
 =?iso-8859-1?Q?P4TSQVcgkfuAQ3RUuimnJFL30kSSSocFBVIJyyp12TkE7iUavgCGY+MDje?=
 =?iso-8859-1?Q?h6O9mJY7qlPfkZpzIkQ1KjmEDi5pkJD9F4//eG7revxALQLRq+PVZdVXGh?=
 =?iso-8859-1?Q?Sinw7CluEQt5dX3WwcCjUem5KK5q6qZ4LUUGF00WrkUoeT4QMZUfgUmiaf?=
 =?iso-8859-1?Q?YVqLTudCSNqkte6JM4B41Ip8bbdkhuXxM1S8bBhYoVOiGnfYap+beYDFAv?=
 =?iso-8859-1?Q?9KTTBiyVo7ZMMJ1uxn3NIqZgvYjbHY3zLpkjWsGMMOiQsMf2B0zyl16fto?=
 =?iso-8859-1?Q?VKD63JXqCsx9WupNPRqAMwv2KopNF2iK+iHyf32cUrmQAMss1gy0zc9ZjE?=
 =?iso-8859-1?Q?mgm/osLhAbGvwpibYWkiCrWMdyjw0NHSlgALh/kv8hbO9UBA/qMkJ4TdQS?=
 =?iso-8859-1?Q?J0HAszhWerm4FJ5careYZgGZ5gsxiF4zie/c/w/uhhghs77Rxv4CGd5IeF?=
 =?iso-8859-1?Q?8qi85Lmxok5d1ksGL6CaclzkXtK6jmnpvxQWOvFmnF1y0h0popc8fjNhHC?=
 =?iso-8859-1?Q?2DF7zfudBkyewmYFRx/U1bLEjfaU4UqxwJmBS9R1NvE0r6MSFcC5/R0vvU?=
 =?iso-8859-1?Q?gFilrmp0JjdOfZDhqbs1k7zBPYKbOS9kdxqo2rqkxvbX5Iq3J/1lJ08NSm?=
 =?iso-8859-1?Q?D8Fu850NnHTwsCCx1hBYGi4c0WNp4PZ2ePtYFLpTdnjF1O1wmwoe4T1Ft/?=
 =?iso-8859-1?Q?wUBBrOU+6WykUyGx0BnDZZ2lN213g7VUwUjMA2vS3aHjVhBbIR1MYQNzHy?=
 =?iso-8859-1?Q?RCSSHIwAAul4dPnLSTt8o+h2fInqXWxgNaQ1gl/EFyXQeT2H0ng5ZQTSGo?=
 =?iso-8859-1?Q?4eaUc2qX1nGKUJA0tTHX4ZNZSkWn6HGuaXS0bCzUNU2s9ZgYrbA4whiDY/?=
 =?iso-8859-1?Q?blB48kRD+UqZQlkGlkeCnypS3LXOxsdPpMCZ0p4T1HE/tQMvACa/AxT5BK?=
 =?iso-8859-1?Q?i2a2MkDDKMNULCbmUNP8K4nSYehBR1h/IXvxFXlKUKvgNoT1teEuOwjet5?=
 =?iso-8859-1?Q?lfPDD9iAG18R/d8WC5l/uHNFdn0a9u1icLnZP8YPI/F0W9UJdKOpP97hYO?=
 =?iso-8859-1?Q?sb9nb+Qr5nhzm/1ci1vDudSs2aJprZyvhSaBl5HM5oK9OJvPIJqf6zewbj?=
 =?iso-8859-1?Q?wfPWnbYKQBSCEZWlaT+neEoENPEdGjD8IdIf/hU9wQa/wXIk+OGWKRI3Dl?=
 =?iso-8859-1?Q?E1ca7RRjN8mE1HoGoFZTrWSDtK0tmBuivDRiX5eM+bAbkeOHEFUm0U9BqV?=
 =?iso-8859-1?Q?dOlKBJudIPAUrIStD2f831NVBnlaK+bOBQK1DMCRf1Hlg2HhWTsoovYaul?=
 =?iso-8859-1?Q?oD0yyhwRgj6WNVjKbJXz2vVgPCwQRJNZtVUCC6qrpUdakvqBWVRT50Gmjh?=
 =?iso-8859-1?Q?GMXyJ1Z2FtEImieugLo7B8tmNE1TiQwftasC0xVy/wkQMHng2aFs2fICwi?=
 =?iso-8859-1?Q?N4ANCZFZSaSZzg1Wfi5L6dM/dtarxe1zMcxnv6T9DbkQd5FUjoCdV9Z8du?=
 =?iso-8859-1?Q?99lD6nhbETmZPMEy8fGFveu0FZ1uYvB8dcOGhZKMAXhMzT/OScXLcW6Wae?=
 =?iso-8859-1?Q?FXIuGz0n9+IPdMsHLa00fHz5F9JDfiXqJyilZBIZQCk7/ZvttkrDaGAd0N?=
 =?iso-8859-1?Q?YC7Ikzoi8GKUO3uw6hnjfHPOMrz/csVMGwLy1l7O7an7F1RZGZinxvTF5K?=
 =?iso-8859-1?Q?3SIN6IC0te0y1aIK0WL1KOS0dLBKxTXJ1mLC18tpVpNC7R9XXan9YkNmit?=
 =?iso-8859-1?Q?MS9UN4JJzk7OgASxN/o/haRCJ4hchPk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a5d44293-9594-4392-647e-08de6fe17cfa
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 18:05:38.9696 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0r15EiqsTx8KUlepPDVltMa4IuOINthvZXY5oJ114dtsPMWzgyT601+5XjX6unUGXEZUZIAFkSUiEBe+/iutqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4871
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
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.freedesktop.org:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[matthew.brost@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 42212161754
X-Rspamd-Action: no action

On Thu, Feb 19, 2026 at 10:54:35AM +0000, Satyanarayana K V P wrote:
> drm_suballoc_new() currently both allocates the SA object using kmalloc()
> and searches for a suitable hole in the sub-allocator for the requested
> size. If SA allocation is done by holding sub-allocator mutex, this design
> can lead to reclaim safety issues.
> 
> By splitting the kmalloc() step outside of the critical section, we allow
> the memory allocation to use GFP_KERNEL (reclaim-safe) while ensuring that
> the initialization step that holds reclaim-tainted locks (sub-allocator
> mutex) operates in a reclaim-unsafe context with pre-allocated memory.
> 
> This separation prevents potential deadlocks where memory reclaim could
> attempt to acquire locks that are already held during the sub-allocator
> operations.
> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Suggested-by: Matthew Brost <matthew.brost@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: Maarten Lankhorst <dev@lankhorst.se>
> 
> ---
> V6 -> V7:
> - Dropped R-B to review again with the new changes.
> - Dropped drm_suballoc_release() which was introduced in this patch.
> (Maarten).
> 
> V5 -> V6:
> - Renamed drm_suballoc_init() to drm_suballoc_insert() (Maarten).
> 
> V4 -> V5:
> - None.
> 
> V3 -> V4:
> - None.
> 
> V2 -> V3:
> - Updated commit message (Matt, Thomas & Christian).
> - Removed timeout logic from drm_suballoc_init(). (Thomas & Christian).
> 
> V1 -> V2:
> - Splitted drm_suballoc_new() into drm_suballoc_alloc() and
> drm_suballoc_init() (Thomas).
> ---
>  drivers/gpu/drm/drm_suballoc.c | 105 ++++++++++++++++++++++++++-------
>  include/drm/drm_suballoc.h     |   6 ++
>  2 files changed, 91 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_suballoc.c b/drivers/gpu/drm/drm_suballoc.c
> index 879ea33dbbc4..1acb5363b65d 100644
> --- a/drivers/gpu/drm/drm_suballoc.c
> +++ b/drivers/gpu/drm/drm_suballoc.c
> @@ -293,45 +293,66 @@ static bool drm_suballoc_next_hole(struct drm_suballoc_manager *sa_manager,
>  }
>  
>  /**
> - * drm_suballoc_new() - Make a suballocation.
> + * drm_suballoc_alloc() - Allocate uninitialized suballoc object.
> + * @gfp: gfp flags used for memory allocation.
> + *
> + * Allocate memory for an uninitialized suballoc object. Intended usage is
> + * allocate memory for suballoc object outside of a reclaim tainted context
> + * and then be initialized at a later time in a reclaim tainted context.
> + *
> + * @drm_suballoc_free() should be used to release the memory if returned
> + * suballoc object is in uninitialized state.
> + *
> + * Return: a new uninitialized suballoc object, or an ERR_PTR(-ENOMEM).
> + */
> +struct drm_suballoc *drm_suballoc_alloc(gfp_t gfp)
> +{
> +	struct drm_suballoc *sa;
> +
> +	sa = kmalloc(sizeof(*sa), gfp);
> +	if (!sa)
> +		return ERR_PTR(-ENOMEM);
> +
> +	sa->manager = NULL;
> +
> +	return sa;
> +}
> +EXPORT_SYMBOL(drm_suballoc_alloc);
> +
> +/**
> + * drm_suballoc_insert() - Initialize a suballocation and insert a hole.
>   * @sa_manager: pointer to the sa_manager
> + * @sa: The struct drm_suballoc.
>   * @size: number of bytes we want to suballocate.
> - * @gfp: gfp flags used for memory allocation. Typically GFP_KERNEL but
> - *       the argument is provided for suballocations from reclaim context or
> - *       where the caller wants to avoid pipelining rather than wait for
> - *       reclaim.
>   * @intr: Whether to perform waits interruptible. This should typically
>   *        always be true, unless the caller needs to propagate a
>   *        non-interruptible context from above layers.
>   * @align: Alignment. Must not exceed the default manager alignment.
>   *         If @align is zero, then the manager alignment is used.
>   *
> - * Try to make a suballocation of size @size, which will be rounded
> - * up to the alignment specified in specified in drm_suballoc_manager_init().
> + * Try to make a suballocation on a pre-allocated suballoc object of size @size,
> + * which will be rounded up to the alignment specified in specified in
> + * drm_suballoc_manager_init().
>   *
> - * Return: a new suballocated bo, or an ERR_PTR.
> + * Return: zero on success, errno on failure.
>   */
> -struct drm_suballoc *
> -drm_suballoc_new(struct drm_suballoc_manager *sa_manager, size_t size,
> -		 gfp_t gfp, bool intr, size_t align)
> +int drm_suballoc_insert(struct drm_suballoc_manager *sa_manager,
> +			struct drm_suballoc *sa, size_t size,
> +			bool intr, size_t align)
>  {
>  	struct dma_fence *fences[DRM_SUBALLOC_MAX_QUEUES];
>  	unsigned int tries[DRM_SUBALLOC_MAX_QUEUES];
>  	unsigned int count;
>  	int i, r;
> -	struct drm_suballoc *sa;
>  
>  	if (WARN_ON_ONCE(align > sa_manager->align))
> -		return ERR_PTR(-EINVAL);
> +		return -EINVAL;
>  	if (WARN_ON_ONCE(size > sa_manager->size || !size))
> -		return ERR_PTR(-EINVAL);
> +		return -EINVAL;
>  
>  	if (!align)
>  		align = sa_manager->align;
>  
> -	sa = kmalloc(sizeof(*sa), gfp);
> -	if (!sa)
> -		return ERR_PTR(-ENOMEM);
>  	sa->manager = sa_manager;
>  	sa->fence = NULL;
>  	INIT_LIST_HEAD(&sa->olist);
> @@ -348,7 +369,7 @@ drm_suballoc_new(struct drm_suballoc_manager *sa_manager, size_t size,
>  			if (drm_suballoc_try_alloc(sa_manager, sa,
>  						   size, align)) {
>  				spin_unlock(&sa_manager->wq.lock);
> -				return sa;
> +				return 0;
>  			}
>  
>  			/* see if we can skip over some allocations */
> @@ -385,8 +406,47 @@ drm_suballoc_new(struct drm_suballoc_manager *sa_manager, size_t size,
>  	} while (!r);
>  
>  	spin_unlock(&sa_manager->wq.lock);

You need to set 'sa->manager = NULL' here for drm_suballoc_free() to
work as expected.

Matt

> -	kfree(sa);
> -	return ERR_PTR(r);
> +	return r;
> +}
> +EXPORT_SYMBOL(drm_suballoc_insert);
> +
> +/**
> + * drm_suballoc_new() - Make a suballocation.
> + * @sa_manager: pointer to the sa_manager
> + * @size: number of bytes we want to suballocate.
> + * @gfp: gfp flags used for memory allocation. Typically GFP_KERNEL but
> + *       the argument is provided for suballocations from reclaim context or
> + *       where the caller wants to avoid pipelining rather than wait for
> + *       reclaim.
> + * @intr: Whether to perform waits interruptible. This should typically
> + *        always be true, unless the caller needs to propagate a
> + *        non-interruptible context from above layers.
> + * @align: Alignment. Must not exceed the default manager alignment.
> + *         If @align is zero, then the manager alignment is used.
> + *
> + * Try to make a suballocation of size @size, which will be rounded
> + * up to the alignment specified in specified in drm_suballoc_manager_init().
> + *
> + * Return: a new suballocated bo, or an ERR_PTR.
> + */
> +struct drm_suballoc *
> +drm_suballoc_new(struct drm_suballoc_manager *sa_manager, size_t size,
> +		 gfp_t gfp, bool intr, size_t align)
> +{
> +	struct drm_suballoc *sa;
> +	int err;
> +
> +	sa = drm_suballoc_alloc(gfp);
> +	if (IS_ERR(sa))
> +		return sa;
> +
> +	err = drm_suballoc_insert(sa_manager, sa, size, intr, align);
> +	if (err) {
> +		drm_suballoc_free(sa, NULL);
> +		return ERR_PTR(err);
> +	}
> +
> +	return sa;
>  }
>  EXPORT_SYMBOL(drm_suballoc_new);
>  
> @@ -405,6 +465,11 @@ void drm_suballoc_free(struct drm_suballoc *suballoc,
>  	if (!suballoc)
>  		return;
>  
> +	if (!suballoc->manager) {
> +		kfree(suballoc);
> +		return;
> +	}
> +
>  	sa_manager = suballoc->manager;
>  
>  	spin_lock(&sa_manager->wq.lock);
> diff --git a/include/drm/drm_suballoc.h b/include/drm/drm_suballoc.h
> index 7ba72a81a808..29befdda35d2 100644
> --- a/include/drm/drm_suballoc.h
> +++ b/include/drm/drm_suballoc.h
> @@ -53,6 +53,12 @@ void drm_suballoc_manager_init(struct drm_suballoc_manager *sa_manager,
>  
>  void drm_suballoc_manager_fini(struct drm_suballoc_manager *sa_manager);
>  
> +struct drm_suballoc *drm_suballoc_alloc(gfp_t gfp);
> +
> +int drm_suballoc_insert(struct drm_suballoc_manager *sa_manager,
> +			struct drm_suballoc *sa, size_t size, bool intr,
> +			size_t align);
> +
>  struct drm_suballoc *
>  drm_suballoc_new(struct drm_suballoc_manager *sa_manager, size_t size,
>  		 gfp_t gfp, bool intr, size_t align);
> -- 
> 2.43.0
> 
