Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A791AD3A22
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 16:00:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C90C410E561;
	Tue, 10 Jun 2025 14:00:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RHBHdcB6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 795A010E278;
 Tue, 10 Jun 2025 14:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749564054; x=1781100054;
 h=content-transfer-encoding:date:message-id:cc:subject:
 from:to:references:in-reply-to:mime-version;
 bh=cKztghepdJAugDHBt0qG86z8ym6q7gHNR7JKXcRCRD4=;
 b=RHBHdcB6zrXOyAzkerCvxZfzpi/IlxK2agejCl+/C07fu3OyQ4ltDDfj
 apYYnt4WIrUqCw6DHwLxItgCnXIjj+1MOQu7bRWd2AuE8aFQZ1Ce0My10
 iP5WFA9QzpY/6E0mE1JLIgivTiioR8/yksoa2xqnu7um4ASSydmuQ5RVr
 Y9hVOekbywzI4AvC18auGfrCiEe8DynZmb9aQm5rfUdrb0B4Dw1nAF/HJ
 yZZU4zTDQHaBE2m+VX70pD59M1+6n2S6P/eWAtAPpd8hko588dPn8Fbsg
 H8/lHTZN2/Y4mbJLJvwWmI2X0n0mv4mvb8d/aBO2RThYVJMScJl7bKCR5 A==;
X-CSE-ConnectionGUID: ZiAsj0LLQYyuN79uH01pew==
X-CSE-MsgGUID: rCQ4yj/tTcKyT5HcxQgnrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="51384206"
X-IronPort-AV: E=Sophos;i="6.16,225,1744095600"; d="scan'208";a="51384206"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2025 07:00:47 -0700
X-CSE-ConnectionGUID: R+dUO5qDQp+iBRhmZDOpSA==
X-CSE-MsgGUID: hA+pJWkrTc6RNTMF91q1KQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,225,1744095600"; d="scan'208";a="177786169"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2025 07:00:43 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 10 Jun 2025 07:00:42 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 10 Jun 2025 07:00:42 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.55) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Tue, 10 Jun 2025 07:00:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cHpPk/DXOKZY8f63Lsj6WJzGFJFM9Edw5+E3h38L83nBNf70J9tWYvY2QVeKMf6n9s2AaTWCUr1XnpS3aReWLPvbQX5xK2sMyloxY6wLHkPVt/mMJXSuIwtz88izzWwuLoMgruRQ12enB4kp2zinmwTtSvkvJyp8Rd19wQefnjYueJ0l9Cf8nSSLG6464JrW16lt4tSY4TZ2RwdcM3peaBgkICx0CeKxMUVyLa1LFa6yRO0AnWaJUxt1X6kICeAmBrw0azEu+qpXpgytSSL1h1M6jDcERA1qSyYqkpqIJMT1Z7ea3dNTIbg6Ktm4lzLVDDo1ObekqnT3HnpkoB3R/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OalCLPGeyDlwWTBvDJDcCMAEg58oVsg1sbFL8tx+SrE=;
 b=jijEdBNn5vjWbD6vWrLtpFjr4XhWsjvmQAJYriHMTzCP5Z9M0wDllFLcZenPbifZBfwYAYR42MB1jQRVbQJ007FhtLZriR5BJRMwDjFCQ9+LqskP3hJLW3JM/zo1c36e5QsrL109KhhQ7loCz5NUybdC1XHfb7lnGeHvxqEuoUK0YHd2n9asLDwVaZlFNSRdowxa4U4LeachtCIA/UnvW/u8cl2OLjXG4klSFnmcASeVgZUnfZQqQtzOj9q9b5/rtYQssV/ypCeMRA56KFpSqPrAGgVsMyYLYiMQ1vTOkj66ixr19mVZcdJsG5VWLXBB4rnJKaM+mNy6ZAu7WZTx1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by IA3PR11MB9111.namprd11.prod.outlook.com (2603:10b6:208:57d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Tue, 10 Jun
 2025 13:59:45 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::28da:9438:a3ef:19c0]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::28da:9438:a3ef:19c0%4]) with mapi id 15.20.8722.031; Tue, 10 Jun 2025
 13:59:45 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 10 Jun 2025 13:59:39 +0000
Message-ID: <DAIWO4MRDNFF.27ZLM2AUTYDNT@intel.com>
CC: <dri-devel@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Andi Shyti
 <andi.shyti@linux.intel.com>, Nitin Gote <nitin.r.gote@intel.com>, "Chris
 Wilson" <chris.p.wilson@linux.intel.com>, Matthew Auld
 <matthew.auld@intel.com>
Subject: Re: [PATCH] drm/i915/ring_submission: Fix timeline left held on VMA
 alloc error
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 <intel-gfx@lists.freedesktop.org>
X-Mailer: aerc 0.18.2-107-g4f7f5d40b602
References: <20250606140753.522927-2-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20250606140753.522927-2-janusz.krzysztofik@linux.intel.com>
X-ClientProxiedBy: DUZPR01CA0053.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:469::11) To MW4PR11MB6909.namprd11.prod.outlook.com
 (2603:10b6:303:224::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|IA3PR11MB9111:EE_
X-MS-Office365-Filtering-Correlation-Id: 23537726-fc7d-49bf-f071-08dda8270e41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Nm82d2FzNzlFbHZPM24vNzVwMnFhMGIwWVlOYVU5Z08zN3UwcFh4SVhxZVlp?=
 =?utf-8?B?R3d4WDhNVFpjNUVQeFJXdkZyRElzRFlOMElxbStNaGtDM01HNHhQSGt4b0dh?=
 =?utf-8?B?ZXNvbkJVUEFuRXhXWEo4VnBKUmhOMGhycGcxR2JCN1ppdEcrVE80TWdOVmZF?=
 =?utf-8?B?QUdRKzNVaTE0TkpjUGhEODEyKzBIOTFNQndCYTNXWUNoOW5mNXBHaTh3TjVS?=
 =?utf-8?B?ZzlYbjFHK29aNnB0T2daaGpxWlp4dlFRVlVRai8vUzgzSHhPWXB6M25mYk5q?=
 =?utf-8?B?Rm1vZnF3V05WejRPeW1XOU8rVXlKS0xDamZZc29UQndwRUg0K2RLMTRwUHY3?=
 =?utf-8?B?TjZMQk1RTThNY294Z3FuMWZxUkFxbTZ6WElUd29iOXlzVWMvMXdNd0pyWTc4?=
 =?utf-8?B?MTZYTGQ1RXBBV25JcDFZNC83STE3Y3JCbXFjdjlvUlZKcldsbTViaTVMTm0y?=
 =?utf-8?B?ZE9HQ2Ywc1U0NEFtZExyQThTOVVsUU8wTHRjYWhuY1JOY01iNzYvYklkVVpz?=
 =?utf-8?B?ZVZZVEdRTWNrQVdPQVpGQzR2V0x6ZGZKTFNwdlpxNWhWRVVTdTlUODBHb1FV?=
 =?utf-8?B?U2Y3djYyditIcWlpbVNuSXVGSWk2aWpVVUlVb3kzYUg4c2hSdG5WbEovSlRx?=
 =?utf-8?B?TEt4RTh6T2dRQnpxNUoyVWZ0ZTV6c2JidEdOdnVxSHpFaDNYWXk0ektvZGxl?=
 =?utf-8?B?T2ZRaVplb21rNzVxcVFMSWlWY1pmM2oxVjNzTWQxemFvckFsaTFVRVh2OUYr?=
 =?utf-8?B?WTFsMWtZMkFDK1BKTFpuRjZuMjcwU2pSZnNYZk1XYUpBSVpRcTdZTHRMc3Zj?=
 =?utf-8?B?QXR5d3RWVVU4cEtIWjBkUnRndWkvKzZiVVFqT3BoY1VmNFU0L1RBemd4dzlL?=
 =?utf-8?B?Zkh0a2Q2dVBJN2laeURXdnRpTElRbXEzdjJoSkpCemlNamlEelcyWGdLZnVw?=
 =?utf-8?B?T3BwZWdzODM5dnBkeHhlQ2JLbWFEMWc1Z2tKT3RQaXJFZUlxeFpLamluTVhq?=
 =?utf-8?B?azFxZ0x0RHdQbCs5TXA3UkNFSzA1NXJzOXRxMENEUEJqRC9IQWpGL0JucnV3?=
 =?utf-8?B?MnRaaFp6MEdxK2RwOU9PZ2ROM0diMUxYWU5FOGdUL0R4MkhkL1pRQ0lOQUs1?=
 =?utf-8?B?cDZHUThSaWZWWExOTGI4RWxWRWZmMGZoNWpMNmNOa01iMkYrTnNZUmJCbWpQ?=
 =?utf-8?B?REhqY25vRlRmN1FLK1FJa1NBNk55Nm9wQXkxOFJjKzV4dUNIdExLa3JudWwz?=
 =?utf-8?B?RzVSUkppT1NYbWYrc2tQV1huTmhaUHhBQTB1cSsxT2tTK1R2QVlHM3hmTGc4?=
 =?utf-8?B?Tnd2dm53dFc5M3p1MDhzZkdTNms5UWp4c2xjZW4wRXNIOUVkdkNZNjFRdlJm?=
 =?utf-8?B?MldxRmJZdm9ZaE54bFErYlNuRzc4WjNFNmp4UkxGU1kvc1VwZk5RcGJrbnVi?=
 =?utf-8?B?Z2czeEsvaXZteWZ5SERPV2xZUUY2MWJETHlCczN6TUlIb3oyWTNyZE9uOXQw?=
 =?utf-8?B?QUFtYlpNWUVFSlpkcFY1MzBua3NSckE3M1JER2NCOUtTRGRIbUw5NisxTmZp?=
 =?utf-8?B?WStmNkVGMFZrMWl0YTFsdDVHZ0JQVEc2d1FVSWlhc24wakYrVzZrRW10V3pC?=
 =?utf-8?B?VVo4MUFWZE8vODAyaXhFVVhjTHdzL3hBeUUxSWdITjhhQ2VWQnlxWXhBc3pV?=
 =?utf-8?B?YkYrNnpEQkt4bmoweFl5S3VqTkhzbWk3d3kvaEhKc1hPdjJwTE12YW83YW84?=
 =?utf-8?B?TE92R2JISGd6VEo1eWlneDJqQzNJeTJ4YlZlTTk2Q1dvWU1TTStSZ1g0eGV5?=
 =?utf-8?Q?y6/SnuFSyg/Kjn7YeiEcbfnjkg6cKw/B4DQ2I=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QVlZSi82L2ErZEQ2eVd3S2ZRaTlCMzc3enUwVVo5dWh3bHNjYmJUNDVRTGI5?=
 =?utf-8?B?ekxoYitYR0d6REhpSjVjTlBLTFRQM3hub0NLd1FoeURtWkk2b2x6ZlZXWE51?=
 =?utf-8?B?KzlON1RUaHFoeGF6Sno0cEkyaSt5ZGg4N2NLdFk3Q002L1pEUVZpbW9oc3gw?=
 =?utf-8?B?VGlhb0FCek9RbXhLeElYT2luS0lJQjQ1RVRQSlFEMXkzd3hzejNUc2I0d1p2?=
 =?utf-8?B?Nng5NzhQNUZ2d1BBZHhKUlJCdDB5bVF4VC9QYS9ZM1dWSXBQNEo1NEdsUGFM?=
 =?utf-8?B?RVhob3R1UXV4RGFPYWZ3UStLd3RSdGZkZ3lTdGRvbnlicmxHR1RyNkdEa2xI?=
 =?utf-8?B?RWhIbTlqd2dZTTNWWmxJL3Bud1M3ZExIQzFENlZwY3ZzZ3E1amxJZ1dMNHlS?=
 =?utf-8?B?L2FYTjhvRlc2MDNnSWFRZzFBQ0xCandUK2s2VmdXUlNya0dtM1YzbWRVYmll?=
 =?utf-8?B?UkNHekZ5L2hqak5uRmtYNjhzNEU0WCtMT3NaRGxnS2hyWUVwK05iUjBEeDlO?=
 =?utf-8?B?WHcvU2hlSE1ydmFHeVJ4MFp2Zy9xcDBMM2NGVFkwalJuQVdod3N2eHVra0ZS?=
 =?utf-8?B?czZ4ZHVWeWhxakRtTE5OSHJGelVwUlRDV0dkV0E2MEErS050Um9jZk5DNjNa?=
 =?utf-8?B?dUFRZDZUMkIzOXV4dU9IT0JMNWJXeSsvOXlRWmZ1YXBqMkFIOUdnMTI4K0FV?=
 =?utf-8?B?dlZ0K2FTR2ZLb1AzYU9YajJvR3dzVXRMMDJ4UXpQeHJ1Z095Tm5OVkR4RndX?=
 =?utf-8?B?dDhNekJiOVY0OUVDYWxKRkQ5TGExWjlqTTdRM2o3OGNmVHNXb2E1TzlhTWJC?=
 =?utf-8?B?MmM0MTlxU0dCNVRVTFVCMkV6NWRSOWhRbUJETGVvR2FtZGxFM3U5bjNHU0ZP?=
 =?utf-8?B?TTlFdWEvbUY1QWhuZGRhZXoxaFNCUnhOd3VhcDZvZFBVUVBiRXFDaDBjK3ZJ?=
 =?utf-8?B?bHkvb0Z2ZlpnM0krSUI0L3huSSs4SHFTTFV1M0xXdkJxQjVtcW1iU3FqZUxr?=
 =?utf-8?B?TXhucVIrbm9BSGJoWTc3azUwZVhPbGRVc1NDNGhvTHA1QWxSb0JvYzRkNWlX?=
 =?utf-8?B?bDA3QkJjV2RhczFMQlFXd1J3RlhuS2UzbGxnU2ppdjlFVEE5cmlmMUp1SG8x?=
 =?utf-8?B?SVBReU8vbEhsbVN3Y2JuMGRPNUdFTnpHN3VXZkxmU1RmbEczdzBJK0x6RWRV?=
 =?utf-8?B?UkV0WDFQT0cydE5kbWpyaGMzUFp1OFJ5Mzc1RVBYaG5Mamh1aGl3cVZ6cjdt?=
 =?utf-8?B?NU0vZlFTNHlMbHJEZlBkYXZmQURBeFhwRUo2NE4zWUUydkEyV1pJWVFXSm5B?=
 =?utf-8?B?SjNOQjJHemlodlNEYXIzYnFEZEJIWjhEVkdHdll6ZWRnOFBEdlRMV3RpNjc5?=
 =?utf-8?B?QWlzTTU5Tzl6RzhYQUtuZk5JOVRaQ2JwT0RybnBMMGxYRWlIbzU0bzlNMUwx?=
 =?utf-8?B?eEdtQUU0SmtIUEVPNFdORlhwZ3RZVUpxME10V1BuaW95K1hBYUoweGZTTkpJ?=
 =?utf-8?B?VGJLWWF4TDhianIxMFdmUDB0L09ldUZ6c2J3czBWdWMxZjFxS2RmcWhZRXYr?=
 =?utf-8?B?Zi9BdFZQZTdyYisyQ3FNb1RqOGNlNDFvSi9haXl2MUhNaDJ0cDIvb1NDbGpQ?=
 =?utf-8?B?c0xVdFI0ZnpFK2U2MlJyMHh1RitwWWpqZms5eUg0S0hxazV1VVg2c1RKbDhi?=
 =?utf-8?B?K2VhQXBFazk1M0thaCt0OW5uY2hvNi9oNzFPdGZ6M0R2ZHFUYmtZd3Npc1JF?=
 =?utf-8?B?a0MzNGFXWWh4NGxpYzQ3YzJKOGVvdG01dFI5Z2NwK2IydnBHVTdVbnJFYnhZ?=
 =?utf-8?B?cEkzN08vUEhzZWhSNEprbUlGUTByd2xOeXd4QmYrTnNIL3hOVnNrMFM1MGxK?=
 =?utf-8?B?ZVRoaWFVWURoOWhzdjIwWjJJRm9FMTNCTWtESXhFYjNsV2NjMlJFMjNvcHN2?=
 =?utf-8?B?ZVJKTGp1MlZDWTRlWVllN3dFWVAwbTRKdlVLMHhaNllWS3diNGpSaHp1TmJ0?=
 =?utf-8?B?TGw1MkZYbExudGJrNnlUa3owWUQ4NE51ZlFrTkhOUFpQOS9qS3RuK2Q1TkJR?=
 =?utf-8?B?a2ZLMGVhb0RUdWJNcGtGWmtubm5DMGQwWXNaMUpDOGcvUUdwbXpkaEhZRjh4?=
 =?utf-8?B?RVYraWpvYURmNGsvZWZ0R3Z6ZitKNmtPV256bS8wZVRiVElrMURneDllTXZp?=
 =?utf-8?B?clE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 23537726-fc7d-49bf-f071-08dda8270e41
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 13:59:45.4721 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F7eBpY4glZE2rQ35ziV2o6J+pPBsowBz1X/k+G9k7Wq//a1QIDApNp77X9+jjwnUj3OtXr1fQvuHqmWsgj/nGUVp6nK9gannjCdujjtuuY4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9111
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

On Fri Jun 6, 2025 at 1:58 PM UTC, Janusz Krzysztofik wrote:
> The following error has been reported sporadically by CI when a test
> unbinds the i915 driver on a ring submission platform:
>
> <4> [239.330153] ------------[ cut here ]------------
> <4> [239.330166] i915 0000:00:02.0: [drm] drm_WARN_ON(dev_priv->mm.shrink=
_count)
> <4> [239.330196] WARNING: CPU: 1 PID: 18570 at drivers/gpu/drm/i915/i915_=
gem.c:1309 i915_gem_cleanup_early+0x13e/0x150 [i915]
> ...
> <4> [239.330640] RIP: 0010:i915_gem_cleanup_early+0x13e/0x150 [i915]
> ...
> <4> [239.330942] Call Trace:
> <4> [239.330944]  <TASK>
> <4> [239.330949]  i915_driver_late_release+0x2b/0xa0 [i915]
> <4> [239.331202]  i915_driver_release+0x86/0xa0 [i915]
> <4> [239.331482]  devm_drm_dev_init_release+0x61/0x90
> <4> [239.331494]  devm_action_release+0x15/0x30
> <4> [239.331504]  release_nodes+0x3d/0x120
> <4> [239.331517]  devres_release_all+0x96/0xd0
> <4> [239.331533]  device_unbind_cleanup+0x12/0x80
> <4> [239.331543]  device_release_driver_internal+0x23a/0x280
> <4> [239.331550]  ? bus_find_device+0xa5/0xe0
> <4> [239.331563]  device_driver_detach+0x14/0x20
> ...
> <4> [357.719679] ---[ end trace 0000000000000000 ]---
>
> If the test also unloads the i915 module then that's followed with:
>
> <3> [357.787478] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
> <3> [357.788006] BUG i915_vma (Tainted: G     U  W        N ): Objects re=
maining on __kmem_cache_shutdown()
> <3> [357.788031] --------------------------------------------------------=
---------------------
> <3> [357.788204] Object 0xffff888109e7f480 @offset=3D29824
> <3> [357.788670] Allocated in i915_vma_instance+0xee/0xc10 [i915] age=3D2=
92729 cpu=3D4 pid=3D2244
> <4> [357.788994]  i915_vma_instance+0xee/0xc10 [i915]
> <4> [357.789290]  init_status_page+0x7b/0x420 [i915]
> <4> [357.789532]  intel_engines_init+0x1d8/0x980 [i915]
> <4> [357.789772]  intel_gt_init+0x175/0x450 [i915]
> <4> [357.790014]  i915_gem_init+0x113/0x340 [i915]
> <4> [357.790281]  i915_driver_probe+0x847/0xed0 [i915]
> <4> [357.790504]  i915_pci_probe+0xe6/0x220 [i915]
> ...
>
> Closer analysis of CI results history has revealed a dependency of the
> error on a few IGT tests, namely:
> - igt@api_intel_allocator@fork-simple-stress-signal,
> - igt@api_intel_allocator@two-level-inception-interruptible,
> - igt@gem_linear_blits@interruptible,
> - igt@prime_mmap_coherency@ioctl-errors,
> which invisibly trigger the issue, then exhibited with first driver unbin=
d
> attempt.
>
> All of the above tests perform actions which are actively interrupted wit=
h
> signals.  Further debugging has allowed to narrow that scope down to
> DRM_IOCTL_I915_GEM_EXECBUFFER2, and ring_context_alloc(), specific to rin=
g
> submission, in particular.
>
> If successful then that function, or its execlists or GuC submission
> equivalent, is supposed to be called only once per GEM context engine,
> followed by raise of a flag that prevents the function from being called
> again.  The function is expected to unwind its internal errors itself, so
> it may be safely called once more after it returns an error.
>
> In case of ring submission, the function first gets a reference to the
> engine's legacy timeline and then allocates a VMA.  If the VMA allocation
> fails, e.g. when i915_vma_instance() called from inside is interrupted
> with a signal, then ring_context_alloc() fails, leaving the timeline held
> referenced.  On next I915_GEM_EXECBUFFER2 IOCTL, another reference to the
> timeline is got, and only that last one is put on successful completion.
> As a consequence, the legacy timeline, with its underlying engine status
> page's VMA object, is still held and not released on driver unbind.
>
> Get the legacy timeline only after successful allocation of the context
> engine's VMA.
>
> Fixes: 75d0a7f31eec ("drm/i915: Lift timeline into intel_context")
> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
> Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Everything looks good to me overall.

Reviewed-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
--=20
Best regards,
Sebastian

