Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD71AA69A0A
	for <lists+dri-devel@lfdr.de>; Wed, 19 Mar 2025 21:14:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F86610E0CE;
	Wed, 19 Mar 2025 20:14:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EKPvqlB3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CDB110E0CE;
 Wed, 19 Mar 2025 20:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742415240; x=1773951240;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=hWS7G405PjZTx3ELRMlCipblSOx5TVmCSlx+X9WG2HM=;
 b=EKPvqlB3SGgT9PfHp8uVyQwEp8xoFJyKBQPfpBJWvkXrvdMXGra5ByH5
 FT8Jrfp3LJ7YmlrwPga0Miup+mz+iuCiJf46gmd5NfOHcQqu3q7Ta/lA1
 x9tLejCKuGGDoGo60vacR9YOKLuXx6nIVGEjogfLDf8r5U5UOQBMWMf80
 1how1ywsQd/PHNLuTTdGKL24ouUAilnF87SThL8tOLIjwJJ42TbTk65cb
 5N4/ZiD+vQ2eb/R9+aGvI7rI9G8YZBPX3zBm+MQsC43yvQXUaafUVBn4b
 OG7LbveKkNPbdwhV6PbX21G2+XX9GNBYJFhVsr0Ei6+6xl93FVe8iernl w==;
X-CSE-ConnectionGUID: lBjvvlcwRJ+eIB2iLQjyoQ==
X-CSE-MsgGUID: 5vYoDJTlSoKlZkCBaXHcAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11378"; a="54617754"
X-IronPort-AV: E=Sophos;i="6.14,259,1736841600"; d="scan'208";a="54617754"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2025 13:13:59 -0700
X-CSE-ConnectionGUID: BOCYAtSvRn6ocflFc3BOqw==
X-CSE-MsgGUID: IrMfbEGpS1eN5nMUYsDCFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,259,1736841600"; d="scan'208";a="127843935"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2025 13:13:59 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 19 Mar 2025 13:13:59 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 19 Mar 2025 13:13:59 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 19 Mar 2025 13:13:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gaL6j8NXBt1fCxLIxpl9FURXFya4yMjLO9s4Yk9mSAp7woadLBS9YMjGlTm5bbZTX5Hp4/G0zQ4knxYZLtF6VqkYjX3KfdtX1OW+b7KE5JgAAlptkdTDsP983jSSNSbBisPsMgg/F8MIOQVq2+R5gRerjTJVEZbulE8Ne2Oz9/a3M0otxN3ZIkGnr37NFOvqdU0IqZsTDV/yFhJwjZTfJTNk0pB9GZT7yVaS3xa3zJlYatdFxKbxGYIIpsrwTbS7b9gLp9ftleiMZCQgthh9PksnWBeRG93cV5ToonguXwZ11jB8hxNZ/oQHcAj4qUjbZEZf0mTXPEdoY9daRbei/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hWS7G405PjZTx3ELRMlCipblSOx5TVmCSlx+X9WG2HM=;
 b=LImBymPcqavpoUIwVFZjDzEgm8kQm29dNZXAHmR351eVA1EBPTA2eEA32khxmwxi5vpJnjyz9WdyoAmJh/NAGqqkpSRoVzIb2CjkVfzMs9kzF/NOmQryZe7YYCieKOyV0jU3gqfJSSoHGqmsio/9p0lcTEosy5C3Q9KqjwoHmKoQwCzDJNcJQZNPkIwhx0xcxSNqPaOUYgoa4iPEgE0qP1YNiBvPbFire/AkbqmNd5+B02krzax0k2ltlTG84NhmqAltO3r6PdHRmbZVthxhIHSZxq7Fy0ojuw3N3bitc8Zv4bQnILd1otLQhr5Xmvnwc7S9HGAmKHbDcNkN7stFBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by IA0PR11MB7741.namprd11.prod.outlook.com (2603:10b6:208:400::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.34; Wed, 19 Mar
 2025 20:13:56 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%3]) with mapi id 15.20.8534.034; Wed, 19 Mar 2025
 20:13:55 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Zhang, Jianxun" <jianxun.zhang@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Gupta, saurabhg" <saurabhg.gupta@intel.com>, "Zuo, Alex"
 <alex.zuo@intel.com>, "joonas.lahtinen@linux.intel.com"
 <joonas.lahtinen@linux.intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>, "Lin, Shuicheng" <shuicheng.lin@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>, "Mrozek, Michal"
 <michal.mrozek@intel.com>, "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v9 3/6] drm/xe/uapi: Define drm_xe_vm_get_property
Thread-Topic: [PATCH v9 3/6] drm/xe/uapi: Define drm_xe_vm_get_property
Thread-Index: AQHbmCjcA44oxosgcU6Hrsbe0PPJI7N64naAgAADbUA=
Date: Wed, 19 Mar 2025 20:13:55 +0000
Message-ID: <CH0PR11MB5444600AD376DB09737B32B4E5D92@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250318171146.78571-1-jonathan.cavitt@intel.com>
 <20250318171146.78571-4-jonathan.cavitt@intel.com>
 <4f6e669c-5d80-4bf9-a7ab-eac8c0ce8000@intel.com>
In-Reply-To: <4f6e669c-5d80-4bf9-a7ab-eac8c0ce8000@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|IA0PR11MB7741:EE_
x-ms-office365-filtering-correlation-id: ee073762-0256-406f-7961-08dd6722933f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?utf-8?B?Vy9jd0Q1MXBJNUU5aEdWandNRTduSUxVZGlYaTZoR2NTdnJmZVEreXdTNGpD?=
 =?utf-8?B?NU1UdEF3V001VnZFUXNEbWJGbUZQRVdTVUVobWdYVmp1SUxGV09oOXhGTThr?=
 =?utf-8?B?SlJyWXYxbDVlRzJNQllwdlpZUE1EOGNNeUkzaTRiWllGN1p1R2ZuL0VBTkQw?=
 =?utf-8?B?ejlWTmt4c25WMFZxRWMrQWQzaExpYkV3RlZSSHY4U1ZRbmkwdkVMY21KUnNU?=
 =?utf-8?B?SXdvWmF4SGg4MVpxaUd1b0s3VHVOLzFBeTVySkpabm81Y3p3SmlETzUzTlJs?=
 =?utf-8?B?V3F2ZnRCdjRWQklGUm1paE1ISHBKMC8rdkhXanBxbHZNU2JPbTJRQVd6UDZT?=
 =?utf-8?B?NmIwclVjOFNqRUNqTnZ0MEs2NnZlRDBhS0RVZnN1ZlFydm1JNTd6RFd5U0c2?=
 =?utf-8?B?S1g2WFhkeHcvanRiSlI2QzAxUXM4akIzanVZNGRQcGtWVmx0WDdsVUtrVnZI?=
 =?utf-8?B?ODc1eENnYnZ1UG5KYXBkMnJPWGhEUFFZbWJIQm5HU3Q2RTBpc2lQdHhKRWJn?=
 =?utf-8?B?MG5TOHN4USs1N21FTkxEM1RFQWZrWFVjb3RLWE85ZWJxNlZ2cVdySlo2a0Vh?=
 =?utf-8?B?cnpJOWNrTkcweEVGOXN1U2NGc1NsUXg1czhKRW9OVHVFV3hSZE9FME5CQ0s2?=
 =?utf-8?B?WTAydHp1NjdXV0REaSsraCs0T25pd1RtUkxhZFNUK2ZGeURMeUVxZnVPdnVL?=
 =?utf-8?B?NFE4N2F0dTNKYlBzUUYxUksyaHFUOHl6a1F5b0tiNFExaGNnVTQzUmJRcWpQ?=
 =?utf-8?B?aW5pS1ZWa09DUzU3R2pRU2diQjlEVlI4UUF1MFVHUjZySFpnbkoxUmc4VFJV?=
 =?utf-8?B?UkJCQUpDTURFK3gwV0h4Z1NlWDlQZDNmUUZVVWJXczlUbC9TSU5lOU54ak5k?=
 =?utf-8?B?eFo0RmxLS09IeWVtbHJJZ1lVMWFOOVI4OWtVdTR5dkFLTG9LZENUR1R6RGVS?=
 =?utf-8?B?WEhHNmlWb2Zrb0F1WjhDOXlCeHFtMFJYaVphSEFpRkx5T3p1WVZSYkR1KzZB?=
 =?utf-8?B?RG0ybWpTTkszcDlBSWp4TmZRdXpTdGdVM1Rsb1ovV2twKzQ4R3BjWUJnazBz?=
 =?utf-8?B?d1BPQ1M3WkRpRkp2bEhyS3VJSEgyMlEreWRiVjNaMmgwSW5yRjFudVFEVS9J?=
 =?utf-8?B?b3gzRzBCeUFHYTB2Znp0WHBmMEE2YndMWE9SQ0hIRDUxZGd4aDBPMWh0MUla?=
 =?utf-8?B?UTZvUyt6TjN4WGxLWnBqV2EwYnUzV1FaTmh6M0lxTGpGS1IvV3ZIdHpQQUpM?=
 =?utf-8?B?ODRTeDZxdngwQ1dWYlBKTGRSNWtmTSsrUHNwRXZTdU4zVVlybkxqYzVLL1FY?=
 =?utf-8?B?eU9PY25WaGNYaEtYSkN3TGk0LzZDbXZqUHk1bW9qZjJBNk1mcVRNblE4VENo?=
 =?utf-8?B?SGhRSGc0Q1RsWFhIUGYwaW1GbUszZnFxQzBwZGlUaHYrb2hLcWxvT3BURitE?=
 =?utf-8?B?a3lleXJXbnBRekFXSE1neDE0YzJqWDBkdDhKTmgrMmIydThsOTdjQk51Wkly?=
 =?utf-8?B?VzZPZ2k3Zjk0MzNLSnBjTkV0RXRUVFBPK0pIc2NWODUwdmtqNVdnQ0ZoSmpt?=
 =?utf-8?B?TFZSNmIxS1Zqcm8rVDNxQmdFbklwUStEOXA0ZkFGazROYjJxM2lvK1Q4UlhO?=
 =?utf-8?B?cUUxNm5pVzRPc3N6MktwYXZtcnhpZXZGckNsQSswaExJTDVDdDY1YUVobjln?=
 =?utf-8?B?Ky9ROE5LUkM4MzNmRElmejRVZjlEZHZPMUVkUkF4WFp6TnBCeTIrc0xJOXNo?=
 =?utf-8?B?dlZmLzZWajVhekFsMzM5MFM5Z05NNUk0dVh5dDNoQjNKUjhZckJyTHJnbDhy?=
 =?utf-8?B?TEY5NUxlQU11UGlSUzd2cnBTOWpMSDZjM3duMk0wdEtwdzVhUGdoK243RU5x?=
 =?utf-8?B?cm5jdHd1T0xPMFEwRHZxYUE1L0ViU1I0SXJYckhTWDZwR3RWaThjSDRwa0VZ?=
 =?utf-8?Q?6BYRs2pTw5r5lDgIdl28Emo4rrPuVGbZ?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RWxNSmJ1RVFKQ0RJTUFSZUtZS1JDY2xwUDFiQ3ZtQUlLVE02MEJJQzlRNnBW?=
 =?utf-8?B?UkNGYVRMOHFobENWSG5XVmZQek1TT0N4WlBxR2tFcm92UzJmRS83anhGV00v?=
 =?utf-8?B?NkJldVpERldTMFRCQjR4TXYrUjA5dU0wUW1jSzJwb21ralk4QzVISDZzSkdr?=
 =?utf-8?B?Z0VzNXhLZ2pOc1pBa3ZWWFczVCtCZml5TkFyZHNCT0trWk1hT3Fza3lwbXNK?=
 =?utf-8?B?UG5zcjM4eFRDbEYyYjEvaGpETU1xdGNNNGlrUy8raVhFbG9YNW1wSlpJajU1?=
 =?utf-8?B?cktveGxYbVJPUWpPME1qSy9kREQ1cFd0V2FNOXp4dm5oOUdXdm0xalVqcEIv?=
 =?utf-8?B?RmdKT1dIdi93Mm02czBQM01pcEswUUFTYlhiZlQ3V0VjZGY4WWFNRkdmYnNy?=
 =?utf-8?B?OW1QQkh4UlZFNVN3SmJQcmNrQlZoU3lxQlluc1cvME90SVdaY0M0Tk44a051?=
 =?utf-8?B?UWgwZ0xtMVpsN2xvRFRScUFyMHpjRHg1MUY5empMb1k0Mk85K3J1ZnVPclFR?=
 =?utf-8?B?alVReEl6SHpNUURpak95ZGhmdDA0NW5UUG5KUmMrSDZYSDVSSkEvQW5ZSlEy?=
 =?utf-8?B?T1ZuckNmSWhKMDhyL1ExcVRyR1VSd01zY0k3Z092dWdNSHBzK2lCYklnYlJK?=
 =?utf-8?B?WGwrbnZrZG9QTHI0UlRzWlMrb0pEdFh5Q2lBOHdPSHRNbVJpc0JKWUk1YVp6?=
 =?utf-8?B?bmUwWklLbytiOExDQmFlR3o3WUE3N3NaZ0h6b3pVZUVyVldYTlFvRXRIMVRK?=
 =?utf-8?B?aFI5NXFBU2x5S2JvYXBVWHBQWGJKU0R5bkduU1JuY1BiVkZUekUrV2NMdlJ4?=
 =?utf-8?B?ZEU5ZlRwamdWaVFMYWw1eWw0QzJPS0dJVkc0VUdTN2NxY3VlZnpIcFhCdjRl?=
 =?utf-8?B?dDBNbHpkMTBKZmdqZUdtZThwNlFZMGlZZURHbEtMSVYxUFlDK2tIY3BvQmE4?=
 =?utf-8?B?MEZPWXNRYngrVjcxdHUxVFcvTTRaNVcrblFLL3N1K3BpcEp1SjN1SnUraXFn?=
 =?utf-8?B?S0ExUm01NUdGNEdlSVpYUGlpdjVSQ2VXZTBxMjNpUUpHY0hyd1BGWkhkdzNZ?=
 =?utf-8?B?SXNkaU0zVlZPZ3hzZ1RuM2YvWVhmanM1WjZhVVEyVmU4QlZJUlhQQkttSmtL?=
 =?utf-8?B?YjBpaG1xdVdrNE9HSU5JUzdMT2RPNld0MTRHRTFBdXZvb3FhSlFZUnVsY2tn?=
 =?utf-8?B?bmZFQ2RyYUl6RS9QK1pncmNVVTBaNmhNUDRtcks3aFNoZTk2UFZlUDhLZHZ6?=
 =?utf-8?B?dVZpbE9GWVIzdHhNcGgxL1ZlZmRUcWc3ZWZmTUtHcXY5TFduaStHdGZRSUk1?=
 =?utf-8?B?cmR0QkhzODBRdC9NTUlYZGRrVk52eHYrUXpCdy9DK1BCb2wxeXA4N0J1WWo5?=
 =?utf-8?B?UVdJNy9jb25JbjZpVmQwM2pTZWMySjkyRjlWVnRESmliR2RORDd3bjNRRlNk?=
 =?utf-8?B?OXMwbHJacVRVTjhsMGZ1VVNSWm9WNzRMZlErNkRwL05PUENNaVE3bDZkdjlk?=
 =?utf-8?B?ZzY2am8xcUdXK3IvUFBpTkZ0bnArUENvWUZLNzJnUnJMajJwZXByNFNKbFF5?=
 =?utf-8?B?M2tVY2ltbGdaNVBvdFMrbEFwT0hMTUNBMitxK2NRWGNnTnZXbWVvcDVhNC9r?=
 =?utf-8?B?R09NSXRQdUUzanJmTjdZMjB6UHlTNUxXWlhieWxXWGZVazY2dFJkeHF2QWFk?=
 =?utf-8?B?bjVMODVwZ2x2SlVaSHhwNnFkUmVKdE1ka25OOGJteWVWWFM3VUh4YWhZY0Jk?=
 =?utf-8?B?bW1pQVI5TGNBVThEQnQ5OGJYRW9NRlFVWmVyS0d0ODdOVUNQUXlZd3YxM0lE?=
 =?utf-8?B?eE9oTHJ2b0ZIWFd5QzJJeUdRNE85OWoza25ycm1hTkRJV1VSYXRSOWx3bG5X?=
 =?utf-8?B?d29UTkdRb3RmbkJJRUxjbW5UMmJJRjNTRUwxK0NjRnlLNVRITjFHNUM0U1JF?=
 =?utf-8?B?aUFiekdUUERSanR0QTJXSGJXS2s1aGdLbkhVd1VzWmZJbTRmR1A1YzU2UzVj?=
 =?utf-8?B?UWVmblFKWWJrZG5MOFI3NHZzdXN6VW9FUzd5SWR6WXQ1cUI5NzNsQlJTamJU?=
 =?utf-8?B?eHVMcmwwanMrUVlQbWtqQjNBbXBtL3B3N0tKT0tCL3pQbWx5b2U1cyszU096?=
 =?utf-8?Q?9n0QN+D6l0Ke6f5i79qSgWb6A?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee073762-0256-406f-7961-08dd6722933f
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Mar 2025 20:13:55.3092 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WsJvAxLgKQqypzTpg0TlRxx9FS7pYrtmfYWlKa3GYMP2KNiNvB/ByVxLe4IZ/Vng2Esetzq6UfbrKW7RVdsiIJoytx/gvdhjWGBAdz2QW14=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7741
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

LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IFpoYW5nLCBKaWFueHVuIDxqaWFueHVu
LnpoYW5nQGludGVsLmNvbT4gDQpTZW50OiBXZWRuZXNkYXksIE1hcmNoIDE5LCAyMDI1IDEyOjU5
IFBNDQpUbzogQ2F2aXR0LCBKb25hdGhhbiA8am9uYXRoYW4uY2F2aXR0QGludGVsLmNvbT47IGlu
dGVsLXhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KQ2M6IEd1cHRhLCBzYXVyYWJoZyA8c2F1cmFi
aGcuZ3VwdGFAaW50ZWwuY29tPjsgWnVvLCBBbGV4IDxhbGV4Lnp1b0BpbnRlbC5jb20+OyBqb29u
YXMubGFodGluZW5AbGludXguaW50ZWwuY29tOyBCcm9zdCwgTWF0dGhldyA8bWF0dGhldy5icm9z
dEBpbnRlbC5jb20+OyBMaW4sIFNodWljaGVuZyA8c2h1aWNoZW5nLmxpbkBpbnRlbC5jb20+OyBk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBXYWpkZWN6a28sIE1pY2hhbCA8TWljaGFs
LldhamRlY3prb0BpbnRlbC5jb20+OyBNcm96ZWssIE1pY2hhbCA8bWljaGFsLm1yb3pla0BpbnRl
bC5jb20+DQpTdWJqZWN0OiBSZTogW1BBVENIIHY5IDMvNl0gZHJtL3hlL3VhcGk6IERlZmluZSBk
cm1feGVfdm1fZ2V0X3Byb3BlcnR5DQo+IA0KPiBPbiAzLzE4LzI1IDEwOjExLCBKb25hdGhhbiBD
YXZpdHQgd3JvdGU6DQo+ID4gQWRkIGluaXRpYWwgZGVjbGFyYXRpb25zIGZvciB0aGUgZHJtX3hl
X3ZtX2dldF9wcm9wZXJ0eSBpb2N0bC4NCj4gPiANCj4gPiB2MjoNCj4gPiAtIEV4cGFuZCBrZXJu
ZWwgZG9jcyBmb3IgZHJtX3hlX3ZtX2dldF9wcm9wZXJ0eSAoSmlhbnh1bikNCj4gPiANCj4gPiBT
aWduZWQtb2ZmLWJ5OiBKb25hdGhhbiBDYXZpdHQgPGpvbmF0aGFuLmNhdml0dEBpbnRlbC5jb20+
DQo+ID4gQ2M6IFpoYW5nIEppYW54dW4gPGppYW54dW4uemhhbmdAaW50ZWwuY29tPg0KPiA+IC0t
LQ0KPiA+ICAgaW5jbHVkZS91YXBpL2RybS94ZV9kcm0uaCB8IDgwICsrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKw0KPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDgwIGluc2VydGlv
bnMoKykNCj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS91YXBpL2RybS94ZV9kcm0uaCBi
L2luY2x1ZGUvdWFwaS9kcm0veGVfZHJtLmgNCj4gPiBpbmRleCA2MTY5MTY5ODVlM2YuLmVmMzM1
NDcxNjUzZSAxMDA2NDQNCj4gPiAtLS0gYS9pbmNsdWRlL3VhcGkvZHJtL3hlX2RybS5oDQo+ID4g
KysrIGIvaW5jbHVkZS91YXBpL2RybS94ZV9kcm0uaA0KPiA+IEBAIC04MSw2ICs4MSw3IEBAIGV4
dGVybiAiQyIgew0KPiA+ICAgICogIC0gJkRSTV9JT0NUTF9YRV9FWEVDDQo+ID4gICAgKiAgLSAm
RFJNX0lPQ1RMX1hFX1dBSVRfVVNFUl9GRU5DRQ0KPiA+ICAgICogIC0gJkRSTV9JT0NUTF9YRV9P
QlNFUlZBVElPTg0KPiA+ICsgKiAgLSAmRFJNX0lPQ1RMX1hFX1ZNX0dFVF9QUk9QRVJUWQ0KPiA+
ICAgICovDQo+ID4gICANCj4gPiAgIC8qDQo+ID4gQEAgLTEwMiw2ICsxMDMsNyBAQCBleHRlcm4g
IkMiIHsNCj4gPiAgICNkZWZpbmUgRFJNX1hFX0VYRUMJCQkweDA5DQo+ID4gICAjZGVmaW5lIERS
TV9YRV9XQUlUX1VTRVJfRkVOQ0UJCTB4MGENCj4gPiAgICNkZWZpbmUgRFJNX1hFX09CU0VSVkFU
SU9OCQkweDBiDQo+ID4gKyNkZWZpbmUgRFJNX1hFX1ZNX0dFVF9QUk9QRVJUWQkJMHgwYw0KPiA+
ICAgDQo+ID4gICAvKiBNdXN0IGJlIGtlcHQgY29tcGFjdCAtLSBubyBob2xlcyAqLw0KPiA+ICAg
DQo+ID4gQEAgLTExNyw2ICsxMTksNyBAQCBleHRlcm4gIkMiIHsNCj4gPiAgICNkZWZpbmUgRFJN
X0lPQ1RMX1hFX0VYRUMJCQlEUk1fSU9XKERSTV9DT01NQU5EX0JBU0UgKyBEUk1fWEVfRVhFQywg
c3RydWN0IGRybV94ZV9leGVjKQ0KPiA+ICAgI2RlZmluZSBEUk1fSU9DVExfWEVfV0FJVF9VU0VS
X0ZFTkNFCQlEUk1fSU9XUihEUk1fQ09NTUFORF9CQVNFICsgRFJNX1hFX1dBSVRfVVNFUl9GRU5D
RSwgc3RydWN0IGRybV94ZV93YWl0X3VzZXJfZmVuY2UpDQo+ID4gICAjZGVmaW5lIERSTV9JT0NU
TF9YRV9PQlNFUlZBVElPTgkJRFJNX0lPVyhEUk1fQ09NTUFORF9CQVNFICsgRFJNX1hFX09CU0VS
VkFUSU9OLCBzdHJ1Y3QgZHJtX3hlX29ic2VydmF0aW9uX3BhcmFtKQ0KPiA+ICsjZGVmaW5lIERS
TV9JT0NUTF9YRV9WTV9HRVRfUFJPUEVSVFkJRFJNX0lPV1IoRFJNX0NPTU1BTkRfQkFTRSArIERS
TV9YRV9WTV9HRVRfUFJPUEVSVFksIHN0cnVjdCBkcm1feGVfdm1fZ2V0X3Byb3BlcnR5KQ0KPiA+
ICAgDQo+ID4gICAvKioNCj4gPiAgICAqIERPQzogWGUgSU9DVEwgRXh0ZW5zaW9ucw0KPiA+IEBA
IC0xMTg5LDYgKzExOTIsODMgQEAgc3RydWN0IGRybV94ZV92bV9iaW5kIHsNCj4gPiAgIAlfX3U2
NCByZXNlcnZlZFsyXTsNCj4gPiAgIH07DQo+ID4gICANCj4gPiArLyoqIHN0cnVjdCB4ZV92bV9m
YXVsdCAtIERlc2NyaWJlcyBmYXVsdHMgZm9yICVEUk1fWEVfVk1fR0VUX1BST1BFUlRZX0ZBVUxU
UyAqLw0KPiA+ICtzdHJ1Y3QgeGVfdm1fZmF1bHQgew0KPiA+ICsJLyoqIEBhZGRyZXNzOiBBZGRy
ZXNzIG9mIHRoZSBmYXVsdCAqLw0KPiA+ICsJX191NjQgYWRkcmVzczsNCj4gPiArI2RlZmluZSBE
Uk1fWEVfRkFVTFRfQUREUkVTU19UWVBFX05PTkVfRVhUCQkwDQoNCj4gSnVzdCBhIHF1ZXN0aW9u
LCBWS19ERVZJQ0VfRkFVTFRfQUREUkVTU19UWVBFX05PTkVfRVhUIGluIFZ1bGthbiBzcGVjIA0K
PiBzcGVjaWZpZXMgdGhlIGFkZHJlc3Mgb2YgdGhlIGZhdWx0IGRvZXMgbm90IGRlc2NyaWJlIGEg
cGFnZSBmYXVsdCwgb3IgYW4gDQo+IGluc3RydWN0aW9uIGFkZHJlc3MuIERvZXMgdGhpcyBOT05F
IHR5cGUgaW4gS01EIG1lYW4gdGhlIHNhbWUgdGhpbmc/DQoNCkkgdGhpbmsgaXQgbWVhbnMgdGhh
dCB0aGUgcGFnZSB0aGF0IHdhcyBhdHRlbXB0ZWQgdG8gYmUgYWNjZXNzZWQgZGlkIG5vdCBleGlz
dC4NClJlYWQsIGJ5IGNvbXBhcmlzb24sIG1lYW5zIHRoYXQgdGhlIHBhZ2UgZXhpc3RlZCwgYnV0
IHRoYXQgcGVybWlzc2lvbiB3YXMNCm5vdCBncmFudGVkIHRvIHJlYWQgdGhlIGNvbnRlbnRzLiAg
V3JpdGUgbWVhbnMgdGhlIHNhbWUgdGhpbmcgZm9yIHdyaXRlDQpwZXJtaXNzaW9ucy4NCg0KQXQg
bGVhc3QsIHRoYXQgd2FzIG15IHVuZGVyc3RhbmRpbmcuDQoNCi1Kb25hdGhhbiBDYXZpdHQNCg0K
PiA+ICsjZGVmaW5lIERSTV9YRV9GQVVMVF9BRERSRVNTX1RZUEVfUkVBRF9JTlZBTElEX0VYVAkx
DQo+ID4gKyNkZWZpbmUgRFJNX1hFX0ZBVUxUX0FERFJFU1NfVFlQRV9XUklURV9JTlZBTElEX0VY
VAkyDQo+ID4gKwkvKiogQGFkZHJlc3NfdHlwZTogVHlwZSBvZiBhZGRyZXNzIGFjY2VzcyB0aGF0
IHJlc3VsdGVkIGluIGZhdWx0ICovDQo+ID4gKwlfX3UzMiBhZGRyZXNzX3R5cGU7DQo+ID4gKwkv
KiogQGFkZHJlc3NfcHJlY2lzaW9uOiBQcmVjaXNpb24gb2YgZmF1bHRlZCBhZGRyZXNzICovDQo+
ID4gKwlfX3UzMiBhZGRyZXNzX3ByZWNpc2lvbjsNCj4gPiArCS8qKiBAZmF1bHRfbGV2ZWw6IGZh
dWx0IGxldmVsIG9mIHRoZSBmYXVsdCAqLw0KPiA+ICsJX191OCBmYXVsdF9sZXZlbDsNCj4gPiAr
CS8qKiBAZW5naW5lX2NsYXNzOiBjbGFzcyBvZiBlbmdpbmUgZmF1bHQgd2FzIHJlcG9ydGVkIG9u
ICovDQo+ID4gKwlfX3U4IGVuZ2luZV9jbGFzczsNCj4gPiArCS8qKiBAZW5naW5lX2luc3RhbmNl
OiBpbnN0YW5jZSBvZiBlbmdpbmUgZmF1bHQgd2FzIHJlcG9ydGVkIG9uICovDQo+ID4gKwlfX3U4
IGVuZ2luZV9pbnN0YW5jZTsNCj4gPiArCS8qKiBAcGFkOiBNQlogKi8NCj4gPiArCV9fdTggcGFk
WzVdOw0KPiA+ICsJLyoqIEByZXNlcnZlZDogTUJaICovDQo+ID4gKwlfX3U2NCByZXNlcnZlZFsz
XTsNCj4gPiArfTsNCj4gPiArDQo+ID4gKy8qKg0KPiA+ICsgKiBzdHJ1Y3QgZHJtX3hlX3ZtX2dl
dF9wcm9wZXJ0eSAtIElucHV0IG9mICZEUk1fSU9DVExfWEVfVk1fR0VUX1BST1BFUlRZDQo+ID4g
KyAqDQo+ID4gKyAqIFRoZSB1c2VyIHByb3ZpZGVzIGEgVk0gYW5kIGEgcHJvcGVydHkgdG8gcXVl
cnkgYW1vbmcgRFJNX1hFX1ZNX0dFVF9QUk9QRVJUWV8qLA0KPiA+ICsgKiBhbmQgc2V0cyB0aGUg
dmFsdWVzIGluIHRoZSB2bV9pZCBhbmQgcHJvcGVydHkgbWVtYmVycywgcmVzcGVjdGl2ZWx5LiAg
VGhpcw0KPiA+ICsgKiBkZXRlcm1pbmVzIGJvdGggdGhlIFZNIHRvIGdldCB0aGUgcHJvcGVydHkg
b2YsIGFzIHdlbGwgYXMgdGhlIHByb3BlcnR5IHRvDQo+ID4gKyAqIHJlcG9ydC4NCj4gPiArICoN
Cj4gPiArICogSWYgc2l6ZSBpcyBzZXQgdG8gMCwgdGhlIGRyaXZlciBmaWxscyBpdCB3aXRoIHRo
ZSByZXF1aXJlZCBzaXplIGZvciB0aGUNCj4gPiArICogcmVxdWVzdGVkIHByb3BlcnR5LiAgVGhl
IHVzZXIgaXMgZXhwZWN0ZWQgaGVyZSB0byBhbGxvY2F0ZSBtZW1vcnkgZm9yIHRoZQ0KPiA+ICsg
KiBwcm9wZXJ0eSBzdHJ1Y3R1cmUgYW5kIHRvIHByb3ZpZGUgYSBwb2ludGVyIHRvIHRoZSBhbGxv
Y2F0ZWQgbWVtb3J5IHVzaW5nIHRoZQ0KPiA+ICsgKiBkYXRhIG1lbWJlci4gIEZvciBzb21lIHBy
b3BlcnRpZXMsIHRoaXMgbWF5IGJlIHplcm8sIGluIHdoaWNoIGNhc2UsIHRoZQ0KPiA+ICsgKiB2
YWx1ZSBvZiB0aGUgcHJvcGVydHkgd2lsbCBiZSBzYXZlZCB0byB0aGUgdmFsdWUgbWVtYmVyIGFu
ZCBzaXplIHdpbGwgcmVtYWluDQo+ID4gKyAqIHplcm8gb24gcmV0dXJuLg0KPiA+ICsgKg0KPiA+
ICsgKiBJZiBzaXplIGlzIG5vdCB6ZXJvLCB0aGVuIHRoZSBJT0NUTCB3aWxsIGF0dGVtcHQgdG8g
Y29weSB0aGUgcmVxdWVzdGVkDQo+ID4gKyAqIHByb3BlcnR5IGludG8gdGhlIGRhdGEgbWVtYmVy
Lg0KPiA+ICsgKg0KPiA+ICsgKiBUaGUgSU9DVEwgd2lsbCByZXR1cm4gLUVOT0VOVCBpZiB0aGUg
Vk0gY291bGQgbm90IGJlIGlkZW50aWZpZWQgZnJvbSB0aGUNCj4gPiArICogcHJvdmlkZWQgVk0g
SUQsIG9yIC1FSU5WQUwgaWYgdGhlIElPQ1RMIGZhaWxzIGZvciBhbnkgb3RoZXIgcmVhc29uLCBz
dWNoIGFzDQo+ID4gKyAqIHByb3ZpZGluZyBhbiBpbnZhbGlkIHNpemUgZm9yIHRoZSBnaXZlbiBw
cm9wZXJ0eSBvciBpZiB0aGUgcHJvcGVydHkgZGF0YQ0KPiA+ICsgKiBjb3VsZCBub3QgYmUgY29w
aWVkIHRvIHRoZSBtZW1vcnkgYWxsb2NhdGVkIHRvIHRoZSBkYXRhIG1lbWJlci4NCj4gPiArICoN
Cj4gPiArICogVGhlIHByb3BlcnR5IG1lbWJlciBjYW4gYmU6DQo+ID4gKyAqICAtICVEUk1fWEVf
Vk1fR0VUX1BST1BFUlRZX0ZBVUxUUw0KPiA+ICsgKi8NCj4gPiArc3RydWN0IGRybV94ZV92bV9n
ZXRfcHJvcGVydHkgew0KPiA+ICsJLyoqIEBleHRlbnNpb25zOiBQb2ludGVyIHRvIHRoZSBmaXJz
dCBleHRlbnNpb24gc3RydWN0LCBpZiBhbnkgKi8NCj4gPiArCV9fdTY0IGV4dGVuc2lvbnM7DQo+
ID4gKw0KPiA+ICsJLyoqIEB2bV9pZDogVGhlIElEIG9mIHRoZSBWTSB0byBxdWVyeSB0aGUgcHJv
cGVydGllcyBvZiAqLw0KPiA+ICsJX191MzIgdm1faWQ7DQo+ID4gKw0KPiA+ICsjZGVmaW5lIERS
TV9YRV9WTV9HRVRfUFJPUEVSVFlfRkFVTFRTCQkwDQo+ID4gKwkvKiogQHByb3BlcnR5OiBwcm9w
ZXJ0eSB0byBnZXQgKi8NCj4gPiArCV9fdTMyIHByb3BlcnR5Ow0KPiA+ICsNCj4gPiArCS8qKiBA
c2l6ZTogU2l6ZSB0byBhbGxvY2F0ZSBmb3IgQGRhdGEgKi8NCj4gPiArCV9fdTMyIHNpemU7DQo+
ID4gKw0KPiA+ICsJLyoqIEBwYWQ6IE1CWiAqLw0KPiA+ICsJX191MzIgcGFkOw0KPiA+ICsNCj4g
PiArCXVuaW9uIHsNCj4gPiArCQkvKiogQGRhdGE6IFBvaW50ZXIgdG8gdXNlci1kZWZpbmVkIGFy
cmF5IG9mIGZsZXhpYmxlIHNpemUgYW5kIHR5cGUgKi8NCj4gPiArCQlfX3U2NCBkYXRhOw0KPiA+
ICsJCS8qKiBAdmFsdWU6IFJldHVybiB2YWx1ZSBmb3Igc2NhbGFyIHF1ZXJpZXMgKi8NCj4gPiAr
CQlfX3U2NCB2YWx1ZTsNCj4gPiArCX07DQo+ID4gKw0KPiA+ICsJLyoqIEByZXNlcnZlZDogTUJa
ICovDQo+ID4gKwlfX3U2NCByZXNlcnZlZFszXTsNCj4gPiArfTsNCj4gPiArDQo+ID4gICAvKioN
Cj4gPiAgICAqIHN0cnVjdCBkcm1feGVfZXhlY19xdWV1ZV9jcmVhdGUgLSBJbnB1dCBvZiAmRFJN
X0lPQ1RMX1hFX0VYRUNfUVVFVUVfQ1JFQVRFDQo+ID4gICAgKg0KPiANCj4gDQo=
