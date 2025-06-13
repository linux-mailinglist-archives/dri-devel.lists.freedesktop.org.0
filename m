Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75DE2AD97F7
	for <lists+dri-devel@lfdr.de>; Sat, 14 Jun 2025 00:03:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED44710E936;
	Fri, 13 Jun 2025 22:03:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CHZjhU9H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77F5D10E936;
 Fri, 13 Jun 2025 22:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749852216; x=1781388216;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=l1xKuyuZ7Kv8g/4tI+o6LD/UM1Kl0GEpf2DCGNRVfVI=;
 b=CHZjhU9HSbpLm7kPnW6Uas/DzwAMjdzZWfEM+f7Cwkt9PGhcMf4YU81L
 6yahfZlKWLOqdQMQV8+4OGV+25oT6yt90V27O1l3iVlpqfzY/0/8ff10i
 oF+SMp7TUnJ9/qgSFoJlUKQ56LWRSFm+z67M+NqTU3sRFYxHv010N1itI
 RpY1M7pjUJy32rVSYAeQ1yfyv7+8GuXFv6HRvWy/ZmsBgcIKf2qoH6ryS
 j3n/Y/DwEqOVVwqnoxCjL++PemONZrGwxCPipjjwfzzTDPpR+keYH4s0S
 7kg6crXlbaGYQ+ehRU1JOAJ+m2fT+JVhcW/9zPNZ5VqgYfpR+stGD3mp5 g==;
X-CSE-ConnectionGUID: AZn8ypoNTfS2MDM7pN8Hqg==
X-CSE-MsgGUID: PAi/wsYjR3S9kd1aF90mtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="63430965"
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; d="scan'208";a="63430965"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 15:03:31 -0700
X-CSE-ConnectionGUID: MBQJoofCRXO2XMbFghd9Ng==
X-CSE-MsgGUID: sXBVUoA0Qkyaztl6cu4DMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; d="scan'208";a="152903175"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 15:03:30 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 13 Jun 2025 15:03:29 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 13 Jun 2025 15:03:29 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.57)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 13 Jun 2025 15:03:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vIqY55Rtgjr3KsdFPxSamRzzuN3BV4kcxmEMk88i5ziVNjdppLBHQCXckHaxfFjZx26mSd8zrx1qz7LjXyqf6UQ7jg9fwkwQ6/oUvoYN+XG8z6ZtZTnajLtuj5hr2n/Znebpb8qfjIVI1nmcovU3PaZGf3CeRELubDr1yzTJhK/z+9Jb3eJD+01yMhTZPRdnbrT7H1wAH/rIdYnnujoj8//Aw0qV8iB29ua6UaUp6RNquFulCwA2bi+nRqYAFQtoILFuTr/7ygLIfdsuSiwD0VTZ+WWVBPe1M022Ccg/BEXGpUuyJRfZcEKVJFjJaR5n079Qe5W/d/zo2d512zI5Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l1xKuyuZ7Kv8g/4tI+o6LD/UM1Kl0GEpf2DCGNRVfVI=;
 b=CVWMmPFdDwLhGmm/7a7DmyiDM2/QG+3f9/wPRgArHDFzWHJL206ZQoAm4oD+GWpvCMT1zz7Mlm9/G0iSv97g3mmmX6gxt1GfYQrfJt5AIeFnKJNCeFz8wZgSTmkUWEuBiBOuzOgacSKvC6wWL9h/zMtFW93FizMGlJJF/pIduEHcyvOUD7KgSVyxqbpwBr9HdotKsbd8iDjwtORLlkiqxa7nMqS9XD0ZUThFJowXP7P79ydcp3/wpIvfzsxbBlhKyeFvkQgmbh5l2WxNAFj/0coFiIVQFar91Q9WTjRU6JqCsMwpmGhdib51G5XBbY69X2Cmwhwvv5R8NLATl5N1uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5445.namprd11.prod.outlook.com (2603:10b6:208:30b::7)
 by PH0PR11MB5159.namprd11.prod.outlook.com (2603:10b6:510:3c::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Fri, 13 Jun
 2025 22:03:28 +0000
Received: from BL1PR11MB5445.namprd11.prod.outlook.com
 ([fe80::b1a1:c6a6:403:8161]) by BL1PR11MB5445.namprd11.prod.outlook.com
 ([fe80::b1a1:c6a6:403:8161%5]) with mapi id 15.20.8835.018; Fri, 13 Jun 2025
 22:03:27 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: "dakr@kernel.org" <dakr@kernel.org>, "christian.koenig@amd.com"
 <christian.koenig@amd.com>, "pstanner@redhat.com" <pstanner@redhat.com>,
 "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH] drm/sched: Increment job count before swapping tail spsc
 queue
Thread-Topic: [PATCH] drm/sched: Increment job count before swapping tail spsc
 queue
Thread-Index: AQHb3KjP/9PbXLSj7kWsuEAMhY+I+LQBo24w
Date: Fri, 13 Jun 2025 22:03:27 +0000
Message-ID: <BL1PR11MB54452FA004FA2E4D0194EC0CE577A@BL1PR11MB5445.namprd11.prod.outlook.com>
References: <20250613212013.719312-1-matthew.brost@intel.com>
In-Reply-To: <20250613212013.719312-1-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5445:EE_|PH0PR11MB5159:EE_
x-ms-office365-filtering-correlation-id: 32cec395-6b15-4bde-5eb6-08ddaac6205a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?utf-8?B?amVURWF0dnJQT3lza1RzNk8wL3IrbmcvdXk2SlY4eVVEdy84M3NQcGhWeHB4?=
 =?utf-8?B?ZkpnNWxnalZyZTJjNjFVSGNHdXhpNVdudEY2TEhqYTlSM09SM2ozSEs3Q3pu?=
 =?utf-8?B?UGtQMXFLQlQzekdVU1BLMW1zSkhpME5Ba1lEVHVxbGhKMy9IRHh6NkxUbTNF?=
 =?utf-8?B?Wjkwellsb3F0aFQ5OFhXWFUrZk5MRm1YaGNzZFRoYlVUTWJLRVpncmxRWGQx?=
 =?utf-8?B?YW9nejZuVFJWZDNZdWF5eE80T2VSY3J5NGdqTTJkdHAyZGdXWG1oci9DVXlj?=
 =?utf-8?B?c1AyVEZ2T0crWDhZZVkrdFpqMWFsVGRPN2dLYXZNWVBqaDg1VndlZDg2T1c3?=
 =?utf-8?B?TFQyU2ZTWDg4ZkdGTjE4WGNjZW5Wazdvb2JsaDF0RzJFaWxzQXM1aHFTQStE?=
 =?utf-8?B?NCtyTy9aZk1GRHhoSmkzMldpNkFTY1dvRW1tL0FtSnpuTHp6NE1CQzhPMmNX?=
 =?utf-8?B?akoyb3VHaDVnUG9BVS9ic0J2RTdpa1BWZitsakxId00wNXN4eGxDTVFaOUNr?=
 =?utf-8?B?blgzYXR3VlVQUHJQUkE4TnlFV3UwY214UHBZSUtoQk1scEN2bTZHVFRvdGt6?=
 =?utf-8?B?T0lJcDF1OGhJV29jRUZrS0xLTHFNUEJpeWk5NU42Wkp1L0lLb1J4SHFIZjQ3?=
 =?utf-8?B?VDZ1b2N1Q1ZmU0EvK21VK1BYWEdZR2tWNjFvczd4N2VDall6bE53SmR6RFls?=
 =?utf-8?B?VlBLd1UrVlRZOHErcEpjV2gvVXVJcHJpcHJ0U1NkM2l4UXMwbFFFeElidFBV?=
 =?utf-8?B?cDh4SmhYR3duVXNKb3J1ZjF5QUxQSmx2N1BhNkFUYWwyK0hvb3JHajlVSTVm?=
 =?utf-8?B?V2VKQXduU2lrTWFSWm03YisyWVZhUVprYnBqMnB5WE1YSk9JeU5CcHNsd1Z2?=
 =?utf-8?B?TU04N1RjTUtocjlsREdZTnlqcnNHNUFaQ0FhZUN6MlFUdml6eHdyVTFvMmd3?=
 =?utf-8?B?NnFqWTNST1lyN01JcndCTjhFa2ErOG9RZXVLV2V4cEd4ZlFSSm5qeEdPVXZ0?=
 =?utf-8?B?SVN1SWNPNEdBOGdxKzFndGc3UzM4UTBmbVpTY3Fab1FEUVlTRUdDemFvakwy?=
 =?utf-8?B?SUpiRm9QY3RIRnR1SW9Sa1dtK1dzWjRVclluQlk4SkVrWWtidzN1cXBYZmZ0?=
 =?utf-8?B?Nm1HZUtkYlZocDhRdG1nM0NYZDVFbEhCQXAvSzNlSnNueUFXUHRvREdUcjIv?=
 =?utf-8?B?cWUyeWJ6STkzZWF0TEZSVnhmR2ZjVG9kdysrQ0lzNHkxZ2REelQraTZnV0RF?=
 =?utf-8?B?Wm8rNU01anVFWDE1UE1OOG5rb2JxNzZNOFh3L1F4RG8xMGlIYWwzZDJYQ21C?=
 =?utf-8?B?ZDVQMUtXb05IZzZlQURzYzhuOWtXT0NBV1d6VTd3b3hkUUtFck96TE9JUWhq?=
 =?utf-8?B?SU9TdnJ6ZlNtVHg1TUZ2dDZjd2pRUlpqS2Z5TDdRVGxtZE52enZPWXk2NjRo?=
 =?utf-8?B?UVJxaGxINE01eUt2NHZHQzRtbUsydGNocFFpMnZXbTgyRzBoVVFIQWZ0dGxi?=
 =?utf-8?B?TzhCTWxpY2FwcGhOWkpabEduaGlTZ3hlc2VoNjRGQ09ienBDQkE2ZmI4ajk4?=
 =?utf-8?B?RitlNCtyTis5RkNoc0tleTlQRmN3S2Fid3BkZCtONFo5R3ZZWWJES013Qmd2?=
 =?utf-8?B?WTFremc4Mm1DMElCaUp2a2ZEQXRhenZINmhLK3drQVlOMGRNcGJBelVUbXFo?=
 =?utf-8?B?djJUK3lGTXB2cHd5L3k4UE1ObGdGSC9nKys0UU1ReGNsQ0Q4cHQ4aENXeTFs?=
 =?utf-8?B?YlR1OFdnMCtBNi9naU80UkpRUElhcWp0WjRzU0ZEVzhvOXM5TmRMQ1FTaVV5?=
 =?utf-8?B?TWZsS3JLazlvZ2szM0RLSXk1ei9UUmJXL0ttYVZFOWxtekZjSEw5ajFDTmZ2?=
 =?utf-8?B?OGVFaER5RGRMdStLWWRIN2JPeWNrVWQzdjRUZ052TElQR1R4MnA0cHk0cTdh?=
 =?utf-8?B?YWl0Z3VwZ2VDVkFEaUZhS0JMQklleS9obUtkWUt0Um9yQ2F6NWkzN1l0aXpX?=
 =?utf-8?Q?g4bFRq6ZgoKpAdFwmtJ6RLlfqXvkfs=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5445.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bndRS21yR3lBRHpuVzFlcXUxalYyY3VHNDFLcWNyZTFtM2VzVUc1UUU4Uk4z?=
 =?utf-8?B?alVuRVBkV3RIOXZrTkJkbDJJMXI0WDZuZk1HM2hhZlZnaFJXSXdjTWR0eW50?=
 =?utf-8?B?b0ZZRmhMZ3E3cFA0NjdEQVpmbEZGdDRlK25Vdk96MVJETWswZTg0b2xRU0sx?=
 =?utf-8?B?eTVFWDI3UzZPVHhFdGppNTR1aU1aY3lOa3d3dHZPSk8za1NPUUxGTGUwZ3Mz?=
 =?utf-8?B?a2duMXB3cWltcm1EQys0YmR5WXhySzdTWDVhczhwNnFEVlRpeXlXMTNBT0xV?=
 =?utf-8?B?RTBQMGJvdnhwU3JZVFplWHp3MlJ4VlhUNmRZNXRhMk9aLzJtQzNLTHhQb3pE?=
 =?utf-8?B?Z0JCVHVvOUlDTE80ODVqb3J6OFBGdWdVTnRMMndSZWNFcVJhc0d0Y0pWRFdy?=
 =?utf-8?B?RUYzbHU0Qjk3Q0RTRUFiTVpMaFdKZzU5ZGxvdkZHTWZLZTRRL2t0ZDFKSTNE?=
 =?utf-8?B?cTEyS1BOdWRYZjY4RDN2cmU3YllBRTJUUnNBUVRvWWhrZ0hDZHlHMXFBdnRD?=
 =?utf-8?B?ZnhQSitEQnVsVXJOdk1FSmRMV3R4eXRwekpyVFhOL0xndmFFMFZnWmZpWGx0?=
 =?utf-8?B?L0RQNWFKZ2Q1akhWT3pUb1pqMVdMbm9ob0tTN3Z4bUtRSUxHNWs5dXVucUI5?=
 =?utf-8?B?MUNSMHZrdy8xSThCTExmekt0c0lxcjl0TWl6Z1IxRWtqYkVOY21hU0ZDdTZq?=
 =?utf-8?B?Vi9TVVNGY3Q1MDZWUVFyNis3SU9GLzFzVWJ3M25iU251T3FtcXpCZFZmNGlQ?=
 =?utf-8?B?TkJ4Z2dEbjVmTzZiS2ZhMlE2NjQydzBzaVFVVlY0YnhXTGVxcUFTYWZDT3ZN?=
 =?utf-8?B?bzZtckNYNW5HSXR5b2JRODJvWFh5eklQeUFGY1crZTFwS012ejJzcjVKZ0R1?=
 =?utf-8?B?YlZqclhYRzhQSkplSWlxV2x3SXRqVE5hSEE5VjVrZ21MbXFHWUZiM2x5bWlU?=
 =?utf-8?B?TDAwUGlzdzdUZ0UwWldaLzJ4NnBQUE5hTVp1OVl4U0ZaNFVQVG1ZdGlNc2pk?=
 =?utf-8?B?dkFUNkNNN3E1eUxIOVpqVnFmUExRVzEweStxMmlDTFBPT2FsWUlYQXBvcVdl?=
 =?utf-8?B?Vlp6ajhDM0pxdDJ6WG1nWitJUEQzV1FMMk5sT1B3b2FqMUJKMmV0d0VSV0da?=
 =?utf-8?B?cFkxUW5xd0ZzYnRuTGZHYjZJNlBoVUJESm5LcWtBYzBIMjhicXJmTkU3WlQ0?=
 =?utf-8?B?aWhjL1dWOFNEOGN1NU9hMUVRWTYvY1A4ZWVZM0NFR1FJdFU4alBGTWk3dEJ6?=
 =?utf-8?B?VG9OMWF3N0ZEam5Sb1NnU01HYk5IQXFjRzA1TmdwVk9zRGJBL1NMaGNTM0Jp?=
 =?utf-8?B?c3lNTjBSdXRtNzMxMmZjaTV3eTBQK1N0K2Y2Rzh0QkNiMlBoMk00UDlVbXNu?=
 =?utf-8?B?RFdqc3hKQ3NpdlJVN1BxWEQ4MHJ5TmZYL013M3NXUXg2Q3gzdURuc3lwVk9I?=
 =?utf-8?B?bVgvYU5lRjUvM1g5elFFdEtLWm13aEdHZnpBS29QdTJ3QXRMc2hWcUJPSlV3?=
 =?utf-8?B?Qkw4WjVkT0dqdkszQjRrM2tBMFp3c3pTMnBnUHhpMUNMSEZOQlJPMkl1Y01s?=
 =?utf-8?B?RlNuT1FOOWhoOU5ncHc0QzBqUC9yUFFqVTZaVGI5d1JnMnVick5XMzB3QW5F?=
 =?utf-8?B?V1VNTXZxY1JtWC9pQ254ZDgwNnZ4T2VhUjBFaUw1SUFmdTBOTnEvTkhzTXdC?=
 =?utf-8?B?ZitBUWtpcmVLUm9NYm9mbDQ4dGFyNHVGRGMvY25qWlNOenhiUnZBR3dnb0w5?=
 =?utf-8?B?REtiVXJuNmJaTmtOQ1BoZDg3alFxb0cwKzBHdWRkdTl2bURmWW5LQzc1ZEJN?=
 =?utf-8?B?SWpNaytXRm8yUWRyT0tMaEpBdFdyb2tPWHNRM3U2cXd0a3hSZS9HeU1wNGlB?=
 =?utf-8?B?OWFidlArbklpdmhBaUJzSlNQaWtmamY0UzhSY3RFQ2hQNHRoay9TRmdlRmlI?=
 =?utf-8?B?UDQ1d1h0SVpYOXRFdExFQzN0TE0xanJFaGtsVDRxajZHSi9qb0RoZDFWSG5K?=
 =?utf-8?B?eVpYSTIrN0c3cHRCUTc1MUxEVHlRQksvb05GTWVqNDFCR3V5K2c5WEI4bzUw?=
 =?utf-8?B?d0JoeE5MQXJPZjM5TnlEQlMwL0xWYzJGK2x0ZGxucXNXNmh2ekgrNlVQWDJG?=
 =?utf-8?Q?o4OuC1yddqi39uEUpduE5hM+j?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5445.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32cec395-6b15-4bde-5eb6-08ddaac6205a
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jun 2025 22:03:27.9078 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mPLPOpu473Mq/CDi37BMzg2QstJhl1sgsZ/g8gLC5p5X3akmlKmjS5JudpyIUcZJr84Gwwdg09W/92feObtHJQbsSaAeqFJMMxqIeCVvRu8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5159
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

LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEludGVsLXhlIDxpbnRlbC14ZS1ib3Vu
Y2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mIE1hdHRoZXcgQnJvc3QNClNl
bnQ6IEZyaWRheSwgSnVuZSAxMywgMjAyNSAyOjIwIFBNDQpUbzogaW50ZWwteGVAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnOyBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQpDYzogZGFrckBr
ZXJuZWwub3JnOyBjaHJpc3RpYW4ua29lbmlnQGFtZC5jb207IHBzdGFubmVyQHJlZGhhdC5jb20N
ClN1YmplY3Q6IFtQQVRDSF0gZHJtL3NjaGVkOiBJbmNyZW1lbnQgam9iIGNvdW50IGJlZm9yZSBz
d2FwcGluZyB0YWlsIHNwc2MgcXVldWUNCj4gDQo+IEEgc21hbGwgcmFjZSBleGlzdHMgYmV0d2Vl
biBzcHNjX3F1ZXVlX3B1c2ggYW5kIHRoZSBydW4tam9iIHdvcmtlciwgaW4NCj4gd2hpY2ggc3Bz
Y19xdWV1ZV9wdXNoIG1heSByZXR1cm4gbm90LWZpcnN0IHdoaWxlIHRoZSBydW4tam9iIHdvcmtl
ciBoYXMNCj4gYWxyZWFkeSBpZGxlZCBkdWUgdG8gdGhlIGpvYiBjb3VudCBiZWluZyB6ZXJvLiBJ
ZiB0aGlzIHJhY2Ugb2NjdXJzLCBqb2INCj4gc2NoZWR1bGluZyBzdG9wcywgbGVhZGluZyB0byBo
YW5ncyB3aGlsZSB3YWl0aW5nIG9uIHRoZSBqb2LigJlzIERNQQ0KPiBmZW5jZXMuDQo+IA0KPiBT
ZWFsIHRoaXMgcmFjZSBieSBpbmNyZW1lbnRpbmcgdGhlIGpvYiBjb3VudCBiZWZvcmUgYXBwZW5k
aW5nIHRvIHRoZQ0KPiBTUFNDIHF1ZXVlLg0KPiANCj4gVGhpcyByYWNlIHdhcyBvYnNlcnZlZCBv
biBhIGRybS10aXAgNi4xNi1yYzEgYnVpbGQgd2l0aCB0aGUgWGUgZHJpdmVyIGluDQo+IGFuIFNW
TSB0ZXN0IGNhc2UuDQo+IA0KPiBGaXhlczogMWIxZjQyZDhmZGU0ICgiZHJtOiBtb3ZlIGFtZF9n
cHVfc2NoZWR1bGVyIGludG8gY29tbW9uIGxvY2F0aW9uIikNCj4gRml4ZXM6IDI3MTA1ZGI2YzYz
YSAoImRybS9hbWRncHU6IEFkZCBTUFNDIHF1ZXVlIHRvIHNjaGVkdWxlci4iKQ0KPiBDYzogc3Rh
YmxlQHZnZXIua2VybmVsLm9yZw0KPiBTaWduZWQtb2ZmLWJ5OiBNYXR0aGV3IEJyb3N0IDxtYXR0
aGV3LmJyb3N0QGludGVsLmNvbT4NCg0KTEdUTS4NCg0KTWF5YmUgaW4gdGhlIGZ1dHVyZSwgd2Ug
c2hvdWxkIGNvbnNpZGVyIGdpdmluZyB0aGUgcXVldWUgYSBtdXRleCBvbiB0aGUNCmpvYiBjb3Vu
dCBhbmQgdGFpbCB0byBwcmV2ZW50IHRoZXNlIHJhY2UgY29uZGl0aW9ucywgdGhvdWdoIHRoYXQg
d291bGQNCnJlcXVpcmUgYSBzZXJpb3VzIHJlZmFjdG9yaW5nIG9mIHRoZSBjb2RlIGNvbXBhcmVk
IHRvIHRoaXMgZml4IHdoaWNoIHdvcmtzDQp3aXRoIG1pbmltYWwgY2hhbmdlLg0KDQpSZXZpZXdl
ZC1ieTogSm9uYXRoYW4gQ2F2aXR0IDxqb25hdGhhbi5jYXZpdHRAaW50ZWwuY29tPg0KLUpvbmF0
aGFuIENhdml0dA0KDQo+IC0tLQ0KPiAgaW5jbHVkZS9kcm0vc3BzY19xdWV1ZS5oIHwgNCArKyst
DQo+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0K
PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vc3BzY19xdWV1ZS5oIGIvaW5jbHVkZS9kcm0vc3Bz
Y19xdWV1ZS5oDQo+IGluZGV4IDEyNWYwOTZjODhjYi4uZWU5ZGY4Y2M2N2I3IDEwMDY0NA0KPiAt
LS0gYS9pbmNsdWRlL2RybS9zcHNjX3F1ZXVlLmgNCj4gKysrIGIvaW5jbHVkZS9kcm0vc3BzY19x
dWV1ZS5oDQo+IEBAIC03MCw5ICs3MCwxMSBAQCBzdGF0aWMgaW5saW5lIGJvb2wgc3BzY19xdWV1
ZV9wdXNoKHN0cnVjdCBzcHNjX3F1ZXVlICpxdWV1ZSwgc3RydWN0IHNwc2Nfbm9kZSAqbg0KPiAg
DQo+ICAJcHJlZW1wdF9kaXNhYmxlKCk7DQo+ICANCj4gKwlhdG9taWNfaW5jKCZxdWV1ZS0+am9i
X2NvdW50KTsNCj4gKwlzbXBfbWJfX2FmdGVyX2F0b21pYygpOw0KPiArDQo+ICAJdGFpbCA9IChz
dHJ1Y3Qgc3BzY19ub2RlICoqKWF0b21pY19sb25nX3hjaGcoJnF1ZXVlLT50YWlsLCAobG9uZykm
bm9kZS0+bmV4dCk7DQo+ICAJV1JJVEVfT05DRSgqdGFpbCwgbm9kZSk7DQo+IC0JYXRvbWljX2lu
YygmcXVldWUtPmpvYl9jb3VudCk7DQo+ICANCj4gIAkvKg0KPiAgCSAqIEluIGNhc2Ugb2YgZmly
c3QgZWxlbWVudCB2ZXJpZnkgbmV3IG5vZGUgd2lsbCBiZSB2aXNpYmxlIHRvIHRoZSBjb25zdW1l
cg0KPiAtLSANCj4gMi4zNC4xDQo+IA0KPiANCg==
