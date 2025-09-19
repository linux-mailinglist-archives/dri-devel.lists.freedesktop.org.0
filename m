Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B3B7B8990E
	for <lists+dri-devel@lfdr.de>; Fri, 19 Sep 2025 15:01:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7A0010E9D7;
	Fri, 19 Sep 2025 13:01:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MKJSCKsy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED66210E9D3;
 Fri, 19 Sep 2025 13:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758286880; x=1789822880;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=pp9up5SVXUJtuXkH2HonhTyRIPwtUniBHJeD/D7+Xb0=;
 b=MKJSCKsylx2HwMc33Cs3lIcPWK3HmKrYfRa9ddpOpVS9RSMIHr8o1RpF
 06IpFgtIcKqUebQJ7jiFnsivFw8K2VHaaoJ75c6bEndxv3xKYM0Sk21uU
 c8VdSzpFoX5QnNIDL2r6Jswc20FJlQgKvUe8vwbBTuhCRrnWrGRRsITrt
 z6talmYeDJv29qgoBmQfPx43R/QLAZZye7/J5J6fJgURP+ZUPskWrsGUW
 1DPo6OpIv7X+vRM/tpZcllGMRtjPz+UKbGTXXrPH2jSq59pPQO+hlf7YY
 BxylgyLoO81Uv/K56EvMEEVbZx4ypJTAaMvqBvXQzmvgBPeY5vv7VHLUO g==;
X-CSE-ConnectionGUID: 4y1F8uJBTQGnxyMYaG09FA==
X-CSE-MsgGUID: WKLyPF6SQ4aBiyRSHdOKKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11557"; a="64271443"
X-IronPort-AV: E=Sophos;i="6.18,278,1751266800"; d="scan'208";a="64271443"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2025 06:01:19 -0700
X-CSE-ConnectionGUID: HBhA1vztRUGkCLiUPMasBg==
X-CSE-MsgGUID: 9RyCM5cnTmCi4AULNmwzWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,278,1751266800"; d="scan'208";a="180081802"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2025 06:01:20 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 19 Sep 2025 06:01:18 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 19 Sep 2025 06:01:18 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.5) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 19 Sep 2025 06:01:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nK0cObrZkOFFJFWDwziHzB7fviNkplJFfTM3tag8ZAlDIzqdGvZ72ABsBTL7Z5ZavS4BhyHZ9cLnJfgOdLz5xpirbDZjO+uSmyQHfHWne8NuIIbnTzcxD4W1IReSv4ejfuodcyKHPbFHudmPx4hUg89o7DwrhYL/8+ScUvkpY6F8T4IbxCDTzAT9Mrwa6XJ8Urqw3wZZB2RyA9tYyHN22YdY17YSc85Bgj1JAy4eahdhe33KA6+/lvDt/aSBKxpajhNFkYL2flXBskYDz8fgAnSS384EXAil2DDnJSdO4pgB1IV1jE3HMfgSbyOHg5z5x+b3T7i67E6iP+zlUK8zJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pp9up5SVXUJtuXkH2HonhTyRIPwtUniBHJeD/D7+Xb0=;
 b=yhhHbC93xl2LLaiNn7VMF4i1s0D5ouFYlGQuvtWUgxmpgOdjDi16wtGzBhZgSIG3Oew8uIMGuxlpGsNBwwGAVYLwLg26sd3mQy3CsVr2xLBnBMytYZU6/tdVDK0wFWTo9yJvdW0DiQWnyXeY5CK71cx9OjNj8uHySUzSkb93WYLsVRkL1dcb5aozcZ4qgyeCSrDij4Fqk2afolypk372IKtVGwVgO+bU8nqVKaYUwL0sQ4awyqLVVJj4XiU/Yefq/QPT472VhohDt1Ewf67LmJj5jujON8myMvYJOHKu3TGpBj4XQvn7BARLPj6l4mlGDT/ke5R7Zjtyl8MRhQx29w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6467.namprd11.prod.outlook.com (2603:10b6:208:3a5::18)
 by PH0PR11MB5032.namprd11.prod.outlook.com (2603:10b6:510:3a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.16; Fri, 19 Sep
 2025 13:01:15 +0000
Received: from IA1PR11MB6467.namprd11.prod.outlook.com
 ([fe80::af0a:68bb:7bbf:5a45]) by IA1PR11MB6467.namprd11.prod.outlook.com
 ([fe80::af0a:68bb:7bbf:5a45%3]) with mapi id 15.20.9115.020; Fri, 19 Sep 2025
 13:01:14 +0000
From: "Garg, Nemesa" <nemesa.garg@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: "Shankar, Uma" <uma.shankar@intel.com>
Subject: RE: [PATCH 00/10]  Introduce drm sharpness property
Thread-Topic: [PATCH 00/10]  Introduce drm sharpness property
Thread-Index: AQHcB35nLPZSU1L//EqLO8dXBFujU7Saqb2AgAAR39A=
Date: Fri, 19 Sep 2025 13:01:14 +0000
Message-ID: <IA1PR11MB6467705DAE93D5F39C4E5BB1E311A@IA1PR11MB6467.namprd11.prod.outlook.com>
References: <20250807092841.3169436-1-nemesa.garg@intel.com>
 <0f35ace53cf269b68fb3adc425680aac8cf10fb6@intel.com>
In-Reply-To: <0f35ace53cf269b68fb3adc425680aac8cf10fb6@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6467:EE_|PH0PR11MB5032:EE_
x-ms-office365-filtering-correlation-id: 80aebcbb-4806-43d8-8e04-08ddf77c9d69
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?eWYwNDFxQjdYdXhibnJ5L3h3NXZ6RXRMRWw1VGkxV21nL3NZb1FHdWpZaVox?=
 =?utf-8?B?cG5jcm9aS2Y1c0ZyNzVULzVwcUVUWDRtdy8yRjEvYjZENWp2SldhQy9tRTht?=
 =?utf-8?B?Njl1Ym92YWVZekJpMkVPMjJ2NXNFU0FyeGVZanNWS1BIZWpVdVJibVhDOEpI?=
 =?utf-8?B?aU9EUlNVWG5xdXMrTVlHRFBER3NjSnBJTHpKR3FKVGtuMWp4L0syWUovdW9s?=
 =?utf-8?B?MnNIUWQyTWZ4QnRudHpPaTNmRWVhaUpER3RpQWREZmdyc0VRS05KYWhqWDBG?=
 =?utf-8?B?OGlSakVmNEljME1LcG5jQkd1UWp6a29EYkV2KzA5dC9HYi9rdXhPWGJVQUN3?=
 =?utf-8?B?T0tqSjM4UHQ4Q0M3VXpMMFNoK3oyY3ZpaVVwWDZmZW1INWlwZjlzem44T2Rn?=
 =?utf-8?B?T2lVQThMMXVhL3dvQk5NdmhlakxZRHVpVjZ6bXpWVzg1NUZhZ29uZkwxVkRw?=
 =?utf-8?B?WVk5ajdYem82aktwMDYrVkVKRlRjaUlhZ2ZlQkFya0F1MW5TUlpnaFUvTjZY?=
 =?utf-8?B?cHd5SkFURmVjVFZ4M1lHak15dk01RENYR25yTVE2MURoMk9JMDFFRjJIMTFI?=
 =?utf-8?B?Y2plS0p0SHpDQWlZaWw5TFp6SVZHRmxteDVTMkVRYUZYOEZMdmcyU3k2ajBo?=
 =?utf-8?B?azNuR3FYOEovNFZVcjN1cGpyVzV0Vm1Gd0Nja3o3Z3Q4Rmt1SGJYa0szdzFQ?=
 =?utf-8?B?Mmc2K1VmZ3AwR3pGZjl6OUxYWDN5aHlQdFRtbktLOFhFdm1wcTFWbUJ4T2V5?=
 =?utf-8?B?WGlObUg0UHNDMUcxYjBaVTl4ajh4TThUMDAwMW5oNURXbDRCN2dsMnRyQUVq?=
 =?utf-8?B?cGtFWklMYU5BZ3o3OStxYmtaUDJvT1Q5ZjBnVkh2UkwxZnZlZElBQkdFSitS?=
 =?utf-8?B?VVF1ZEZ2dndNUXI3MTFQbENkRzJkSmxEQ1pFZTU2QTRYdi91dkhCM1NKUzJk?=
 =?utf-8?B?MmhhVXJ4dGJHNXpHSXR4cVA5Tm5CZkNpcWltV2Q2cWZDVjBaVjRYZFoyRnJV?=
 =?utf-8?B?bnh6Z01OTFJtK0pCSU9CRFpOc0V2dmxPY3psanRBdy9ncjNKZm9lRkVRQmhs?=
 =?utf-8?B?V0pBc000T1I5Um14NSswZE9seEdXdFc1ZnZDWGVKT1F3TzdZUUg3TDk3czVY?=
 =?utf-8?B?VnZwczB0Rzd5RFpzMUxVZSs5bnBscVZPRjF5N3FsYkQ4bWRBSGlDQ2FlVXVR?=
 =?utf-8?B?ZFRpVWxHTFMvMHEyTnN0dWtwaXhEQzVIMHZCakxNQXRFUDVLbExSb25YTFRk?=
 =?utf-8?B?TnkzL1VEY3BYbXlZcmt0N0xnME9xdTZnWTI4bUF6U3Ayc3VSMGRYRDJFVlFo?=
 =?utf-8?B?b2hzSmJCQkl6SDdWcjNTUTNhV1VINURKMWRSSVlHTUREaEpSL3pBS3ZJSHQ2?=
 =?utf-8?B?Y2dxMHpwYzVKTSs3aEhZRDMvRy91aWNibTB6clFQKy9uOVdwcXdCbjFHQjJU?=
 =?utf-8?B?TFJVYnBmM2xqVThzbzM4MjlWeE52KzBXTUloMUVLdVUrdE5rbXdNMXZSaFVC?=
 =?utf-8?B?VHBVa3hQNnZhcjY5ckZ3Witpa2Y2UW03RUJsTDNaV3hGd1I3dHcwMnhVUFY2?=
 =?utf-8?B?ZC8xT2hRMktTeEgrR1FZb3NWYTJmSTN5MXVCN2hOY04vUFQyREtCelNRcFcx?=
 =?utf-8?B?VUZKcTVoVDdsVFhhcVNTREtQZmVNMHBSbEJoblphMm1ia2lWS0pDV0NNOGQx?=
 =?utf-8?B?QTRPVDNRblRXR1FSTnZ1Q0t3Ky92OURMdm5NZFJuYU9hQ3JVMDREcG1TNDdU?=
 =?utf-8?B?QU9WbWJCWi9FSkd2NnRjRTZWalJnWWVUVW5tYitiTGhTcDU5Zm0wWWhwWXRO?=
 =?utf-8?B?RmhCdjhMKzlQL2lta0xpUkk1ZGpqWGtsTTZMdGlvWmhnR0VmR0g1RDdDb1A1?=
 =?utf-8?B?QWNLL0UwbisvVFBoVlZnZEJMcmRHY2ZCcFVWejkzZ09ydnhZU3gwRUlUUHZY?=
 =?utf-8?B?ako4K3AzWGQzU21rQ2RxbGdiaUk2SXB2RCtSc2VmVTNGKzhuWnRYTjZLT3hF?=
 =?utf-8?Q?SEzaTQAApO/59uxA0+r8A8epux9l5c=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6467.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b2tHWDM2NTgybVZsOWVhVitwZ3ZOa0Y4WkVYRXV5eDBoNnMxSmdlS2dWVE5E?=
 =?utf-8?B?b05EYlZiTmRwQnN0Q1JwajVmNnRCTlpPQnFyVU9rekxNb253Y0pkVjNyZmd4?=
 =?utf-8?B?eCtCUUQvT1JFdVgyL2dhUkZtRFUxRDBTSGhRcENxaFVXcThDSG90c1RORUta?=
 =?utf-8?B?eHdpbXdYdE5qS2dlNlN3ZldLKzA5ZEovbXlybnhGOTcveStkcFNlZDJJNEZk?=
 =?utf-8?B?b0ZKNitXT000YjVWUWhRUUZ4M1Ixc0dzTzcrNERzTXRRNFJSQW5penErbTQ4?=
 =?utf-8?B?ZjF3anN2YmFZUjJJYWx0NVF5V3pzNnFLSEJHbmxlbjdzdkRRSUwwb2NpaEtr?=
 =?utf-8?B?Zjh4UFZRUHZuekRxWXNMTFJCVldma3Q0dlNyemNLWUhpWWRBdTU3U2dvSTVF?=
 =?utf-8?B?U1VYaWFVVEE0eEJiYkEvVVZWYStQa2lvMXlVQXlyaDNlQVp6N1ZCeUVwZEl0?=
 =?utf-8?B?R3JwekwvZXJzaExzUGF2Vm9LcGhFdHI0ZVhJeElySlAwMkpEZTNDbE1rMXd5?=
 =?utf-8?B?UXYvRTJ0dU5HR2NRWjg3d3JydWtEaTdsdkVjUEZTOFREbnFEWFJzVmQvUG1M?=
 =?utf-8?B?ZXRXM00vcExuNWZYRWxYeW5XRU9XT2pJVTJqZ2R0dmJKdndWclFtRTF5cVk1?=
 =?utf-8?B?a2Q2eGZNZUFHWTZaSmJUVXU4cEF3WGFuMElpbG4wMnpoRmNnKzRlYVVtQk1s?=
 =?utf-8?B?cFAvRDJuV0FlbkJUaVpxWjk2VUptU2JzVENHRFdxSitBYzhGN3Zpc2liMWwv?=
 =?utf-8?B?UGlib1VXOWJaaStVUU9uRDFuNXNpUVRmaGI4T2phL0tnKzYwSkl3ODN1WUF5?=
 =?utf-8?B?eTdzOEVEUlNRS3QyRjlMSDJlaE9hVmlSbHdBYUwxWllIbnRzR212RXZVTTdn?=
 =?utf-8?B?MXhGbEdudE9zS0NmeHJibWVZZFg2cExuQ2ZOZmNXeDlFdjhibUpYQ3I1ckdH?=
 =?utf-8?B?aUx4UVpzL3V5b05zZSt2TTlraCtlTlZnWXU3V1RHL1FwMExIU3BjYURCdmsv?=
 =?utf-8?B?REhoQ3pJdXYyNlVVTUIyNzRDdVo0T2pzalhMNkFyTmprbmtkMnB6S0NGK2pQ?=
 =?utf-8?B?UTk3ZDc0MVRsU0pGLzdRZzZobUljZ2paTThZUHlMSzh4bjI5ZlhJWkVqSWFs?=
 =?utf-8?B?Umt3dDZaKzhKRnd2Q1ZKSFpndUNuREtFMDdmSEJia2gzcUkyYkpPc1BhZENa?=
 =?utf-8?B?cC9HcithdHpmZjhtcEJDbWxaM1cyQ0thcm9ZRUVLTEVrMlQ5R01xLzV0TDZQ?=
 =?utf-8?B?UEx6dHorU0VucjNjN0dxaU1XTmxkUWdHUWFqcit3MTJwcGVQUGtwOCtMT2xN?=
 =?utf-8?B?RnpDTUljQkFnY3ZSdTlUbHBBVU9ZdVkvVldnSjIwbVhScmFVSDRFQlppL050?=
 =?utf-8?B?cnF5SXRpN25XQTVkTzhIWjB3dlFkL0JkZHF3YTB6c3lCWm5ZSUMrd2FEZWVv?=
 =?utf-8?B?R0lwNDF5UmdCOVVpTU56bm9lUDA3TnZqZmQvSEtvQW1zQnptM2ppaENBRmFw?=
 =?utf-8?B?eU9KcmV6eUZ5Q3VLT0QxVTJzSVNBdmtFaHN4RWp0dHNrQ0ZmL0ZFQ01aQ05T?=
 =?utf-8?B?OEQ5R252eUlLZkxJdmp3d3N6SVpKYTlSZlZBemxpRlZSdVl4bno5czRPVXlS?=
 =?utf-8?B?SWMxVU1OWHBHT1B0VlBFVncvWStCai9jeXdjZ0xQd3VrVUJqSk9wRW93Rjh5?=
 =?utf-8?B?aCsrbGRDRjZJNzFtL1lpNXhibUJVMzZNcS9weEx4TkFGSEl6WnRIMzl0VVpx?=
 =?utf-8?B?VzN4VldFdEVwdy9HcGlzTklTemZxVHBhbWE4VVVuc08wZXhQZWJ3QXVDNDVV?=
 =?utf-8?B?YlZmY2pNbGtjQTFzdGRNRkwreXh3ekEwczJuamdkbHIwd2pGMlJaZmVVNnZ2?=
 =?utf-8?B?MTVvY2tveWVvUkUrczNDQVZQMnROaHozS1NVeGJscTFPL2R1aWdqZWpzSURo?=
 =?utf-8?B?aVVBRWxMa3pPdTV4QXJMRXl0eURDd0xkWHVOa2dpMUh5ak51d2sxTHY4WUhn?=
 =?utf-8?B?c3o5c0hxS1Z6WE5yQ1NmMFE4VGV2KzNFUDNMbHl0aUZKWms1dFZzNmRKZzN5?=
 =?utf-8?B?bS9uYVhZODVXTCtHbFdnUzdKRlVyM2RUYk1LdXdGcGFvcXpnaEtwZEtCVUdy?=
 =?utf-8?Q?p/+I+IzW4W3yQG3tR8jsM44x0?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6467.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80aebcbb-4806-43d8-8e04-08ddf77c9d69
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2025 13:01:14.4820 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oknH4pOhKxzqDkqwRyMlA0JVLqoZ8wV10zh1gRyGX8ZxsQWU8YiMtxpqnwM7Y0GZ60hcpMccB4hf2PYoyYGMWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5032
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSmFuaSBOaWt1bGEgPGph
bmkubmlrdWxhQGxpbnV4LmludGVsLmNvbT4NCj4gU2VudDogRnJpZGF5LCBTZXB0ZW1iZXIgMTks
IDIwMjUgNToyNiBQTQ0KPiBUbzogR2FyZywgTmVtZXNhIDxuZW1lc2EuZ2FyZ0BpbnRlbC5jb20+
OyBpbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOw0KPiBpbnRlbC14ZUBsaXN0cy5mcmVl
ZGVza3RvcC5vcmc7IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IEdhcmcs
IE5lbWVzYSA8bmVtZXNhLmdhcmdAaW50ZWwuY29tPjsgU2hhbmthciwgVW1hDQo+IDx1bWEuc2hh
bmthckBpbnRlbC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMDAvMTBdIEludHJvZHVjZSBk
cm0gc2hhcnBuZXNzIHByb3BlcnR5DQo+IA0KPiBPbiBUaHUsIDA3IEF1ZyAyMDI1LCBOZW1lc2Eg
R2FyZyA8bmVtZXNhLmdhcmdAaW50ZWwuY29tPiB3cm90ZToNCj4gPiAgICAgICBNYW55IGEgdGlt
ZXMgaW1hZ2VzIGFyZSBibHVycmVkIG9yIHVwc2NhbGVkIGNvbnRlbnQgaXMgYWxzbyBub3QNCj4g
PiBhcyBjcmlzcCBhcyBvcmlnaW5hbCByZW5kZXJlZCBpbWFnZS4gVHJhZGl0aW9uYWwgc2hhcnBl
bmluZyB0ZWNobmlxdWVzDQo+ID4gb2Z0ZW4gYXBwbHkgYSB1bmlmb3JtIGxldmVsIG9mIGVuaGFu
Y2VtZW50IGFjcm9zcyBlbnRpcmUgaW1hZ2UsIHdoaWNoDQo+ID4gc29tZXRpbWVzIHJlc3VsdCBp
biBvdmVyLXNoYXJwZW5pbmcgb2Ygc29tZSBhcmVhcyBhbmQgcG90ZW50aWFsIGxvc3Mgb2YNCj4g
bmF0dXJhbCBkZXRhaWxzLg0KPiANCj4gSSB3YXMgcGxhbm5pbmcgb24gbWVyZ2luZyB0aGlzLCBi
dXQgQUZBSUNUIHRoaXMgaXMgdGhlIG5ld2VzdCBzdWJtaXNzaW9uLg0KPiBCYXNpY2FsbHkgdGhl
IENJIHJlc3VsdHMgYXJlIDHCvSBtb250aHMgb2xkLCBhbmQgSSdkIHByZWZlciBuZXdlci4NCj4g
DQo+IEFsc28gbmVlZCB0byBmaWd1cmUgb3V0IHdoaWNoIHJvdXRlIHRvIG1lcmdlLCBkcm0tbWlz
YyBvciBkcm0taW50ZWwuDQo+IA0KPiBCUiwNCj4gSmFuaS4NCj4gDQpJIHdpbGwgc2VudCBhIG5l
dyB2ZXJzaW9uIGFmdGVyIHJlYmFzaW5nLg0KDQpUaGFua3MgYW5kIFJlZ2FyZHMsDQpOZW1lc2EN
Cj4gDQo+IC0tDQo+IEphbmkgTmlrdWxhLCBJbnRlbA0K
