Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20CC6ACCCE5
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jun 2025 20:27:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D4BA10E5FC;
	Tue,  3 Jun 2025 18:27:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n7HPdNKI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D756410E5FC
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Jun 2025 18:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748975223; x=1780511223;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=EH6tXz47n9J7F5s2iJ4oJxmB5i+doXwMCIzGoths/nk=;
 b=n7HPdNKI1/JphpBNbJUju6kE0iEHPjGVa4q3L7G2fIPp+CRWa2YTUWPF
 kKcG6XGsX+N6ttjMpqTv0a+e6EWmUokD6chdY0MViPThYG1//K4Q+NK5m
 mPl7ym0cNtHls19fAuYRDxynIA+EB+x6CcerkQmg6uCmgZQSgJEaxS/3r
 DYcqiTh1N007ZnLbzCrSU8qoPwcGAfoaHAhdiy1Ia71hGqnaby/Ta21fx
 vRYbZftT7U1Lr/s+wnSPQdhQVbTi7eV3gfIWn4bHQzn+TcP5PUygJ7coT
 F0MGEMyn5ZesPCWL9vPpvdSFAtN0Zert73KJzS3y7wSZGTURG8iCAnQhv w==;
X-CSE-ConnectionGUID: ZYPkhUUwSua13Julx+iQrQ==
X-CSE-MsgGUID: TwYrnqQRRhmt6DMv91k7RA==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="50152459"
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="50152459"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 11:27:02 -0700
X-CSE-ConnectionGUID: qa6VZODWQGilPVKyyWqApQ==
X-CSE-MsgGUID: OUmRYuuMRXmZk1iXcrZfIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="148780833"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 11:27:02 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 3 Jun 2025 11:27:01 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 3 Jun 2025 11:27:01 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.78) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Tue, 3 Jun 2025 11:27:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qPCJp/YPuYTg654PlRjK9s2Lq0iDg7Z77wNm18AWvndHXcK0T97PKioBwwEmwQ8cEYkAymxWPWFwlHyJL+5xkki2F+nrI4pxQnb5gtdm7UzHvag9fI07cmJ1EjIQCXft1bb0vZaV9aG0S/3oJSgHk8UAZi46UVpT4sfIW9MCHirpTgI1MgsMuh8b1vJ4vtjh/DB2LzUBe4PXAzw0x9GuLPiL9r1U7PzInOWhmasL4KUorPhsKm/wBgPL2MCuXeaTj1/KMjLMEtfx+OohMKV0Z3s10g3n/JXD4VWzz4H5r3P1QGyZ8zI0sUvo/Hzs4HJkfJCgALBAja4lyOqWzEEAoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k09vNvQ1iWg7qTpEwS0s7gqZ+PNzzRY/vqBUgSfLd2Q=;
 b=ALO8FL8b7eTg6kim57DabfbfdkwTO+Lsq0+VhTlJRivXfLg/a2A8BWVdDM9A/TY4XC7dBZbDn54KDI2QdaX6nqy4t8CxskDvZ01LzcufIRiiAuiB4cJCXfC1gAOQ/TldRVBCNsYQyongMV9hqSX+WHWqgXlk7gwsvuAfe61ClCF1GHhsxPAoWKC2mEPoy3EET3vH/ZMEFOGaQJo7e3EaBd0OV5C8QMK+0+dCHebzoPq7G0w3rZIQmawRqOzs4W5ct8ye9GlLKo9WGwnD92fytcp5c1CDYnM0SnikLhNJCEWJ40XsSpYiv7YVxf4WgQbgptnEYAnoebdd07rp7byD1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB6425.namprd11.prod.outlook.com (2603:10b6:510:1f7::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.31; Tue, 3 Jun
 2025 18:26:59 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8792.034; Tue, 3 Jun 2025
 18:26:59 +0000
Date: Tue, 3 Jun 2025 13:26:54 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Tvrtko Ursulin <tursulin@ursulin.net>
CC: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, Tvrtko Ursulin
 <tvrtko.ursulin@igalia.com>, <dri-devel@lists.freedesktop.org>,
 <kernel-dev@igalia.com>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v2 2/2] drm/ttm: Increase pool shrinker batch target
Message-ID: <232yojrnpypalgnajli7gfviqgq6vjowaxfsnieaa77akylruz@u4al2d5hsnc5>
References: <20250603112750.34997-1-tvrtko.ursulin@igalia.com>
 <20250603112750.34997-3-tvrtko.ursulin@igalia.com>
 <b5ddbaf7-9f74-49d7-a45f-ed73ed5df0ac@amd.com>
 <4c41a65e-de43-45c9-b672-88a2760a1a75@ursulin.net>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4c41a65e-de43-45c9-b672-88a2760a1a75@ursulin.net>
X-ClientProxiedBy: BY5PR03CA0012.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::22) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB6425:EE_
X-MS-Office365-Filtering-Correlation-Id: c4212062-0151-40a1-646f-08dda2cc3a26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OHd6azdGWnJDdHJ2aUZOVG91RGo4eGxhVkU2STJHWkVVYTl2UU1hZTNJa25p?=
 =?utf-8?B?R256SW5rUzc4ZG1SblM4b3FBbENUOUlTT3FnS05UdzI5ZVRWSk8xUTdWSVBi?=
 =?utf-8?B?MnRFak1oWXRTc04rem4vbzBzTWJDVTJDYW1CM0ZCU1VtbzJRZGVtRXM0aUIv?=
 =?utf-8?B?c2VmT3RaKzN6MitkQWcxSTZkVW1zMW1pRzM5cWZ1cUw2clh2dGsvVXIweXkx?=
 =?utf-8?B?blNJUXhZMjYxaTBRcEZBN05TVlRtaThBc2xEdzlZR1B2RGpVa3loWVpLN1ND?=
 =?utf-8?B?WjdQTDd4bnRsL3RVdFdMYnE4a3V5VGxxRHliYXdQWDlncXRHRk1RZ2FWS25L?=
 =?utf-8?B?aFhsbnl6Tk5wRStMM253bHFrSm5zeGZFUUg0dVpiWDFXYmtEUHl6Y1laY28r?=
 =?utf-8?B?Y0tCeVc5WW4rdUdTQTBZeDgrMDdMSHZBK1llcUF2cUcvMDlEZ2JTTG5QMGJU?=
 =?utf-8?B?d1NqZ2xpOWx5dHZHWm90MkMvb2kxVEI5alZPMkZFeG9uOXZIMVNBYjhQMGRW?=
 =?utf-8?B?M0xnT0NvVGQ2YVhTOGw5NEpEWWFWK2ZrcGJkc2l3QXZJZEtueW9xcWJlM0xm?=
 =?utf-8?B?UzVsb096ZGkzVkhNOVBOZTIwalhGN2lGOHZFNlZQdjI3Z0lONHJUKytZNVZ5?=
 =?utf-8?B?ZktEU2E0a0xiNjBjVTBRSndDbXVZVGxvODQzY0xoMk9EQnBheTZMWGJMZFA4?=
 =?utf-8?B?SGR3SmV1M0tJdnpOWUNFUXdPZTFrWjJEZXBzdzlnNTN2d1BxbEdxYmxTUi9R?=
 =?utf-8?B?a3BEbGVVaWZHOHhGWVI4RnNkdEZWR1dkR0tsRDlnZVQrNXdxSlVYTzc2Z0xO?=
 =?utf-8?B?NjFZTy9mOFdiU3lTM0V2MTlJRCtQODRkT1BDUGRSQllMaEZiWU1aQXRFTUho?=
 =?utf-8?B?Nk5OWTFDMDdTSHJwZCtIYzQ0Ny82RzREaUd6V3RWVmlmY2d4L1hiYzRkYjJk?=
 =?utf-8?B?MnhBbkkzQzJSWGlYK2pIcnRGeS9CQmJhaDczN0l3MVY4bXRtcTkvY3ZUUmYx?=
 =?utf-8?B?UEpxSXYvVW1UTlBMT2ZCM3BVazhka1I2N2llNkQrNGFVaFRTbFRtQnI4dCtB?=
 =?utf-8?B?NXdZWUlENWVySkZsc0RiejlQeGhvNjhUYm1EWmt3QnJZYnRMdmZsNWZaV3Bm?=
 =?utf-8?B?Wk1CaGF5OGhBZTU3TllNdC8xVjQxUDZha21KMFlDY3dIZVBtbEs4dW5hNUUx?=
 =?utf-8?B?YkdSaVZYNlk5ZDZtcWJlbGZTbk8yaGtZYVFsMU8vdmNUQ1ZTZGF1Zm1KaU93?=
 =?utf-8?B?WU5hZ25VRzdqRGFzbHgwa0NPdmdIY2djTHVqaFZEKy9HQ1IzK3ZnenpkTk0v?=
 =?utf-8?B?Zm1pWjBMMElyQ1hRa0VteEJHL0dNSFFKeTRrM0xUNHhwZnFYRUdOWTJCQWdm?=
 =?utf-8?B?RU1lWnNQT1YyVStZQmVOMkhIbGhOeStUV1JnWVozQ3dOWEN2Sis2c0Z4SW9U?=
 =?utf-8?B?WUkyWGlnejhEU3FSTmZJbTMxNmZuVUxQcFE5WDlFVHduS01oc25yeDkzTmtN?=
 =?utf-8?B?Rld4V2tuVWNtL1l5MlpJM1VRWVF2Wk1EczdTWFFoclIwRS9zUlA5am40ZEh2?=
 =?utf-8?B?bUlJMjFjMGlGVEUwMXdLRDdlM3N5ZWpSTnBjdmdNQnJ3eEdva0dRYmNoeUcz?=
 =?utf-8?B?dnVVUS9UcG1uSm44cmNBMmdIUHRXb1U4d2xTOXFkTnhxdEdEUmNnRmJVSEda?=
 =?utf-8?B?Y2lQMDVXT1N6c1JuL2NPRVVOV2xaSEI2NGVjSXlsZ1E5L3VVenNvMzMvWDZH?=
 =?utf-8?B?OU92eUdLUjZPbkI5MWtJNFNib3Exd1lDWSt4Kzc2Wm8xZjRuSWc5RW9PdGlJ?=
 =?utf-8?B?Vlc5OXlOZE9ZVk5XWlFiNWNRaDFOK0RHMDM4UEZrZXRxVXFxaUVmZTViTm12?=
 =?utf-8?B?dDdVWmVEcDUzbktUT2ZUYkh6ZVAwNkU5V3hFUUo0K3ZRYnYvSVlxZVZ4YUky?=
 =?utf-8?Q?E7n+I47NNKI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SzZERU5VVCtjVnk3RWNCU2JCRi94dUx0WlQyQ05jeTZKeWZibmlzcUpiLzg4?=
 =?utf-8?B?eDdUT0RsMlJRSTFGMWF6cndOZndaT2ZJYkwzVmpGSUprK2F4a1dRMTRwWmVS?=
 =?utf-8?B?WjB1NFd5aUhKeUZNa1NkbjZjWjUyYlIrbFExM1kxY0YzempFVTByZ1RTYkxo?=
 =?utf-8?B?d0s2aHhMdmIwWmk0ME9manUva1QyaEJmMXNkQ3B2UHlyMHVDR1hFOCt5a0ZF?=
 =?utf-8?B?eU5Oa3dVMEhIV1ZRa1lub0FIb25jY2swVXQ3alBsUDA3L0VkM1I1d0RudWlJ?=
 =?utf-8?B?THRhSW9UdStXRWs3Z0s1UUpBSkNWZTRYSzUzWm5ZZ0VmdnB5R1FvSkhBMXF5?=
 =?utf-8?B?akU0NW5nNFovM1o0K3BlL0FUY3ZlajJrdXFwYTRaM255UlRKSUVMd2swdEcw?=
 =?utf-8?B?ajluRVdQdGNOck9qU0N0LytsSG9QQ2FqYlViaFcrYTFkd1BOMVJiOTFTL2hl?=
 =?utf-8?B?NE9FNjVBclZFZXo5WTY5NGpMQjNaQk1MUmlQVHFXcmh0emtqVTAzaXFPN09s?=
 =?utf-8?B?M0JWcFRjaTMzRWZxSkorQjFTSk54bng4K3NPMmRHUXhrS01ZM3lZb3hHYXJw?=
 =?utf-8?B?RXFRS0ZsbW0vYTlPOUlaaUZGdmtORU9uMHZEQXhhYmlEbmpXWHMwSkUya1dv?=
 =?utf-8?B?N0F1N3YxNnVZU1I1Y1huc2JaV2U0T0lLSmk0NjlvZUJMT0NwaDNmd1Fla2M5?=
 =?utf-8?B?SmpBdHg1M3V0N2Ivd29Xc1FIU0NxeEcrTmlJNmdVcG15OUJoRStiSFRwMzJH?=
 =?utf-8?B?V3JJZmtKdUI3Y1M5QzZnKzJFSVp2NXg4d0gxWkt1NzJQNjB4cHFGcEtvM0Er?=
 =?utf-8?B?TnAzekxhNHFmUGZZZzMrNVN0UEhpb2FWUTgzTno3YXRkWkZwVURXVXFQWU1m?=
 =?utf-8?B?Ymh2blJnaW4zS2lGQzdkbGo4UFRJUVR4KzVQdGRHUDBjc3dqUCtKZ3hyQUtx?=
 =?utf-8?B?UmVPUFVkTmJCTXZKeHdjRlZQQVgrMHJ5QkNuSzEzTm43eVJlL3ZySG9tbUJr?=
 =?utf-8?B?UWorZmU3S3l5SlJkU3MwRGRwL2ZrR2FhVmR3b3pOSVZQY25wTk9YY2lMZ3BH?=
 =?utf-8?B?MU1zc1JHWThoK1RmNzc3YXdTbVptajZLcFc3Q1NhWmtOM2wvZHRZMkRwNDl6?=
 =?utf-8?B?N2N2NWJ0K05DbGNkRXUwRC8wR055S1g5RDBScG96RkVlbzRvcjNXYzdWQnpJ?=
 =?utf-8?B?NWdBemttb2VEMWFJblprQmNNQnNjb0VHT2dRcFh1UkFxWHJtRnY5b3A3NnZG?=
 =?utf-8?B?UGdaU0N5OGRDd2taT0srTmdmWmpyaFlLMzFLTDZRK1g0aCsvMElWQUNQZWY4?=
 =?utf-8?B?Z292ZFY2RXFqNmttOElsL3pUUHhLc2RzNjVHNkpvSXQramF2cnNyR0Izcnhz?=
 =?utf-8?B?V0tqTERDUlpFU2R2TUZVMmJxenNFZEpVTmtYcWRjaXNRZkpFSURLYUtjWEZX?=
 =?utf-8?B?cHh3Sy9HeGRqK2RqNHZhb0xEM01MRmtDWG1CTE5vSTJkbkFaV0phbCs3UzVp?=
 =?utf-8?B?ODRGdjhodnJxcDZjb2tzL2xGbVlFNHhTU1QzeFU5Q21tZHNxbmxwTVhJRWJq?=
 =?utf-8?B?Qk5ZU0tESlIvYUpGUThUd1ErY1B0YkcvVDZlMDh0MGJ6NkpPdkduSkhRSS9N?=
 =?utf-8?B?UlE0S1ExYmxERHRJWUM5d1lRUmJwUFdsTlRJQkJBV3ErTWh6bWZJcHcybThO?=
 =?utf-8?B?VjZuc0NFUUVXeVJyZlZOTUliOVRpS3hyV0YxVm05MkRKZ0pBVTh6VE9DMlhW?=
 =?utf-8?B?b0NRZkN1MUYxamVMTGYySFlkR0JpVzhpWlhjTEVvNjdYT1VBNlRVUGw5Wm9W?=
 =?utf-8?B?SytnZTY2L3ltSDZLTjdLK3NQL1hSQ1R0cWRtMUpiVlMzU25iejN0cjNrRXpr?=
 =?utf-8?B?aHFmT3lxQlRqQ21lUEpha0Jyam9LM1A1SFVVQUt4QnM4M3VVbGd3aTh5M0dH?=
 =?utf-8?B?VzM2U2RIdUFPRGF5UGsra094SUxNQ0ZWWkhlRnNsYTZjcForNFNQV3JGMzE5?=
 =?utf-8?B?VURNYXVmdzRGTW1DNjB1bkZReENualo5MG8ya25hUmVqTSt6dmtFM3VPbGpF?=
 =?utf-8?B?SUlVbGttdy82VVduSURXci9YdFhKKzNMSDlBTFExWDlZdUYyaXdYbjdNN1Rs?=
 =?utf-8?B?TXNxSkpnd1BNL1ppVnVQK2lTWnRMNGFuM1E1NlA2bjc4S0l5bzltNlFCNWI3?=
 =?utf-8?B?Y0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c4212062-0151-40a1-646f-08dda2cc3a26
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 18:26:59.1079 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +drHHXIV+dw1wZVmwGYViJ1EvaiX3YppeIde1cI1f4GeVvYKHCpPsKmvXEkEW+za49159pNnStTZkEndZhb70nOqniueQiZy2z9SUT8f5hI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6425
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

On Tue, Jun 03, 2025 at 03:47:20PM +0100, Tvrtko Ursulin wrote:
>>>diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
>>>index c060c90b89c0..e671812789ea 100644
>>>--- a/drivers/gpu/drm/ttm/ttm_pool.c
>>>+++ b/drivers/gpu/drm/ttm/ttm_pool.c
>>>@@ -1265,10 +1265,16 @@ int ttm_pool_debugfs(struct ttm_pool *pool, struct seq_file *m)
>>>  }
>>>  EXPORT_SYMBOL(ttm_pool_debugfs);
>>>+/* Free average pool number of pages.  */
>>>+#define TTM_SHRINKER_BATCH ((1 << (MAX_PAGE_ORDER / 2)) * NR_PAGE_ORDERS)
>>
>>To be honest this feels random. But I can't come up with a better idea either and it still looks better than the default as far as I can see.
>>
>>So feel free to add Reviewed-by: Christian König <christian.koenig@amd.com> to the series.
>
>Thanks!
>
>>Should I push it to drm-misc-next or do you now have commit rights?
>
>I should be able to, think I've tested it already once.

this is defined inside an ifdef so now our kunit tests are failing with:

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/ttm/tests/.kunitconfig
ERROR:root:../drivers/gpu/drm/ttm/ttm_pool.c: In function ‘ttm_pool_mgr_init’:
../drivers/gpu/drm/ttm/ttm_pool.c:1335:30: error: ‘TTM_SHRINKER_BATCH’ undeclared (first use in this function)
  1335 |         mm_shrinker->batch = TTM_SHRINKER_BATCH;
       |                              ^~~~~~~~~~~~~~~~~~

Maybe move it to the top of the file or before the ifdef... ?

Lucas De Marchi
