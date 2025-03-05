Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63DB5A4F77E
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 07:51:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF16E10E6F2;
	Wed,  5 Mar 2025 06:51:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QWq//MEc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6CAA10E6F1;
 Wed,  5 Mar 2025 06:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741157480; x=1772693480;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=p9erXO8aD1WeEwpmd0CkJmRjP0YsIYEvAnyzGRCDa40=;
 b=QWq//MEccxXOLH8BxSQ7V7Xr3AU0Rm8E9m7NrQ4Q2I4NonmHDLySRHR8
 7GY7NkTuSRvhX2yp5+nLVLl7cqGBHViwkKTSi5tOuojmEltDB6jol0PI0
 Ifm3PZuRpaRlc4XWR+LYWbIExD3sfkujhtf03E6zstzZb/2/qp+VjGkp9
 zw1VTsQ/wAY0j+6r6KWQ2zssbQ0nMmJrU76JOcA0M7wAhOe8Chn6BJqDW
 0aQBL+YTi2c0DpipxbgMqxSbETcxUY/VSkgnSjFLW8Su3w8AAOs6Cgz5A
 HklNH2Brm1JjmFWHghFgcEXjNS++unGg9XjpEQmEDv8A2hBQtt7oWMgsH g==;
X-CSE-ConnectionGUID: 9V2xqu7kTMuKAJ7z5QrzUw==
X-CSE-MsgGUID: u8qzRJU2TbW0lzw1lukKTQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="52743433"
X-IronPort-AV: E=Sophos;i="6.14,222,1736841600"; d="scan'208";a="52743433"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2025 22:51:09 -0800
X-CSE-ConnectionGUID: TvQ8nZUmQFqJ/cJBJKHzQQ==
X-CSE-MsgGUID: kKmKKU3EQ4WGYKbCYs+mZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="119109782"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Mar 2025 22:51:05 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 4 Mar 2025 22:51:05 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 4 Mar 2025 22:51:05 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.175)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 4 Mar 2025 22:51:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t5bCQgFMmv/ATHT1SPn8NOF5oWi2HfFYS4wXI37xbHRqWSaP9Zh7YgUvT0V3RGba9pCY8DhmUFfuAUsYGb6G0mmW9jXmXeBoZ7VONCX8mzOkz85DDD1cGPYX8yjcwmKmygprpOTSDdNxTfRTzPxrSyXc97hADlW4iYmP8i/WwNQIhhnWq/0tZ3IMmcuA5fqUFhdojFsZoWQlrWNEKKrq6BtV/o6C5hsyI0ir9N/CEPp10R8dcQVeER8hN8spC6/2JTflP70gE3QTKfADSvfI2tv8BezedyEaUhzP1PqDl1xjQNbllT7Dh+/3T8FOSH+pL/ZRPsJTX1vg674hGwxGNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p9erXO8aD1WeEwpmd0CkJmRjP0YsIYEvAnyzGRCDa40=;
 b=AxHNnGxvD6lVfB47RrbWbWf5+4ad3sNGMHKaAszzztRSkNzQ9L9wXjUAzzTBQXWEs4xCvx6IsBz5Hj2JUQu8s+CZIqwbvcFuTJORpujt2HeKzYjmELMvaNdvOp97UjSbsgUfvxelcM5Chchb28JE/1rqICX0Jjm4gJ1hNBDptrmhA8i3p8AMkllIJzQx6pqWCGyTsAu6rxXi8sQ1CfzqrectVgOcLKEp7bKCdTsepMYVuHU+QNRJjzbNS4ACDkN31nsb4bMahYvpboll9BKiUfk/TMaO0PDJ6IcGe9rN/cziVmH1v7PcoFB2QPNIyXVzKR+pBdSDqI6EjX84+zi8tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by MN2PR11MB4550.namprd11.prod.outlook.com (2603:10b6:208:267::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.16; Wed, 5 Mar
 2025 06:51:02 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525%5]) with mapi id 15.20.8489.025; Wed, 5 Mar 2025
 06:51:02 +0000
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
To: "Murthy, Arun R" <arun.r.murthy@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>
CC: "Kumar, Naveen1" <naveen1.kumar@intel.com>
Subject: RE: [PATCH v7 1/3] drm/plane: Add new plane property IN_FORMATS_ASYNC
Thread-Topic: [PATCH v7 1/3] drm/plane: Add new plane property IN_FORMATS_ASYNC
Thread-Index: AQHbh1mvOePMT9Y2+UqGebHcYa3oQbNkJsog
Date: Wed, 5 Mar 2025 06:51:02 +0000
Message-ID: <SJ1PR11MB6129E8A4E5D3B2E7B1B18F47B9CB2@SJ1PR11MB6129.namprd11.prod.outlook.com>
References: <20250225-asyn-v7-0-20b81122f4ce@intel.com>
 <20250225-asyn-v7-1-20b81122f4ce@intel.com>
In-Reply-To: <20250225-asyn-v7-1-20b81122f4ce@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6129:EE_|MN2PR11MB4550:EE_
x-ms-office365-filtering-correlation-id: 5a003788-4423-4616-a5ea-08dd5bb21810
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?utf-8?B?eHZEOU9YaVRGUDYzQks3Ky83VUlFQnlWWWpKVWdhUWxnNXBNZFpoVkJQNml5?=
 =?utf-8?B?WmFGZHI4Rm9IbURNaG1KNTIrZ3NmYkFXNE9JT1ZYQlJqbXp6TGs2OWNYU2ZL?=
 =?utf-8?B?RVBmVmQ5ZjRCd25WTytQWXBVaklaUERSTlo4RGY4Q0U4S2ZXVXpuckdmSjBu?=
 =?utf-8?B?S0p1R29PeTdvYklySStHd2kvTnRtcnErVVhaSzUyMFdOTjJPL2RoVUpITWZm?=
 =?utf-8?B?eHIzZytJa3gydjgya0s4ai9mRGhiY2NqSzk5VWNNQ1ppcm1CUkNFNzBoWW5X?=
 =?utf-8?B?ZmljN1dyQmNrM09nK1VHUW5BeFR0M3JSc3RhTW1mdDVjTms0aGtOcnpFWUM2?=
 =?utf-8?B?R1dvclcybks4Ni8veVJvUGhVbzNiMXc0ZEJ4b3NPeVlXM0Z2V3RuZSsxNG9J?=
 =?utf-8?B?WnNMd29Qc0Rrdm9BWDFVQjRDV25lZERUWUwvN3dXc3RkYVRRMEIreDRlcGNi?=
 =?utf-8?B?L09vSEVWYkpENHdDKzh3US9kOWZyWGJMd2wxeGUxQ2RsVFpvb21JWDBNdWFT?=
 =?utf-8?B?Z01xRm9VMFZBN3daYkNaaWhUUmI4UlBnMnJXTm4wVWhQanBwN3plSUxrVnZu?=
 =?utf-8?B?bmEwVkRlbjBScEhWcUFxekdhdEpkZGJTWG5odnhSVGNHbFQrblpkOUlrVTFs?=
 =?utf-8?B?c0RseTlobEZOeFR4SktPclpGUnpiV2FpV0tHdE00SGVzanRYQmpiL3hCOGNY?=
 =?utf-8?B?dFVwN2FpQUdmd1IwSTdaR09xaUdDaTNoSzQzRnk5Y3RwWC8wUjlaU0ZoZXlU?=
 =?utf-8?B?NGppUzVNTjBVMzF2Yk5HTzY0TVN4Si9KM0FkZy9aNDRkUElMYytnWjVDbS9K?=
 =?utf-8?B?M3laSVovdklob1BUZ0xYY3c3Z2IzVVR1a2c5OHdYUUtHWjVVVlM2dlVQM3ZO?=
 =?utf-8?B?cXVWVlJtZ09hQ0ZkREd6NmJhQW5kN0JQaFNrOC8rRy9NQkZaZ0tEMEVIeC9U?=
 =?utf-8?B?WHhadm50bVk3aVltZTRnd1NkVGM3YUxnSTFaQm9pTTRjNmlwSzV3aUxqVGR6?=
 =?utf-8?B?dVJYMkRqbE90eW8zOFVNS00wZDgvNGdKNWs1S25YYlgzeGd3ZWJONDdSeXYr?=
 =?utf-8?B?dG9FUWFGUUY3eTFjVUlGSVpOUHBlRVcvNy9LZVdJVERhZ2VnUmpJb1ZzMFAv?=
 =?utf-8?B?QStQUzQvUHpMY2lURVNSaFF6UnZiTytZYitpU0UyREJIZUszbmw3bk5NeFox?=
 =?utf-8?B?TVNwZTBZczRNeTZoNnk5ZG1XcnkzZmlBazNka3VyZVMyYkRGZk1MRi9JL1FX?=
 =?utf-8?B?Qlh3K0liazlEQWhGVS94ZjJOT0hkUnRBVnRnbTRJdWw2TEtHd25BZkpaYzlv?=
 =?utf-8?B?ODN0WUFJcDFvVzQ0ZlI1NDBCMDBETE9PUnZYT1ZLd241bnhTNGZLcEFjeXVz?=
 =?utf-8?B?Y0RNeGFhVGZxaDlxMU1wZkVlVGEzWTZCTHBheXBCNVFOQnlGNHRCWnRmaVk1?=
 =?utf-8?B?U3p4V083SnV3V2ptNUxQWGpyU1dFVFAzMlUxeGRnQ093WHdzd3VXd2VOSW84?=
 =?utf-8?B?UDgyWURLbjBTUm8zMHBXcXc0UkNYamlLSE5LNXp5bWhWQUJubnFieTBnbGV2?=
 =?utf-8?B?TFBHQkFWOGVKRXNrTTdrVGdVSXo5d1VkNG5LMDREZkNuemJWV3MxbHVQS1lq?=
 =?utf-8?B?YWxNbDhKdHFuSHhZa3hSUVk0ZlhNWWc2ZThOREtaUmcvRkZEbkM2OWlOVURs?=
 =?utf-8?B?ekFLMkgvUW1pUnFZNTdISjNVNVdVcVNod01Ca3hoU09USHhjblNmUklHVFhT?=
 =?utf-8?B?em5jbXJWTkU2R1BYNDQzZTBjelkvL2dwWUlMZGFzNzZlZGtnWURESHl1a0po?=
 =?utf-8?B?Qk8rV2FwemdJRHhhK1R5WmJITkxkazVZeDhwODlMU2JtNVhsWjYzQ0RONzhw?=
 =?utf-8?B?bjZBeTU0d2t6b3BnRGN1ZWg1MzBrbCtiS1NOSjg3anY2cmdzWThMSFJsckNE?=
 =?utf-8?Q?7/BE6LT63ZcIhf5DD6MzJJcZ10kU4shW?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6129.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dm5vbGR5bGR1MDNISC83S3EwQjRqNmlpakRBM0lJRDBqZ3lYMjJLMmZMNVVS?=
 =?utf-8?B?S0Jsd2RIR1A0SDVNQm0wc2o5SXVpTWIxUm83OEY5ZmFEUXBERWRXWXpWeWZN?=
 =?utf-8?B?bVZoNmt4VlZ4NkYvUGZoTmV5TVpJeDg4a1RTSVc1bi94VFNXcDYvWk92aTdW?=
 =?utf-8?B?N3lqdXRLdEV3SE9RL2hyc0lQcTQvMCtpanBoV21ENytJcHlhUHNoNnpKWUlx?=
 =?utf-8?B?S05jLzloUHlXY3ZlTU04WTFSTUN4WVJMM0JkdTErelZlYVlUZE5oTmZUZ0Zz?=
 =?utf-8?B?em4yRkNFdFdZMU1sdTA3YzNiK2VKZ2NXNmx6bEZ3a0I1bi9GVm9vL1pqcVBB?=
 =?utf-8?B?OVFRdFRmdm5mY0YvbnZXa2UzZzdqUi91RWZNYVlGbTJSTkhseXRIVXZWV0dU?=
 =?utf-8?B?MVRxR2Jzc0hSN1ducmZvRWd3VFhVVy9xeFlPalNwa1lNclc1YUxpVVA3Nnk1?=
 =?utf-8?B?MC9XV1ZmT3BWYkc3emRnWnFMeFAyNjNpTTA4V2FQZlI2ZngyWXlRWk1adTl3?=
 =?utf-8?B?V2sxbklvL01Rc2J2UlJKVUpvWmhESnZnWUsweEhOQkROWnlxbTBPMGhPcVF5?=
 =?utf-8?B?Q2FKdi9UZnBzTWJyVmthWWxWMHY2Yk0rU3hRVUlUM2d3aU1CSWVyOTNVYlRI?=
 =?utf-8?B?QWF6RERWUUh6c0NENGh0RWJCU2M5cm5TcDNGM3JOZWpiQjM4YjBWS0pVZWlx?=
 =?utf-8?B?WnJYa1o1WWRRUmQ0Tkgvd29wa1lCQm9Sb1hab0NlbE9lU1FQMHA3KzJaR01Q?=
 =?utf-8?B?OTlCa0dVZGM5Z3dUdVRvYjFzc0RXY1dKRlpqNkNFWFFpcEsyWHlEc1VJaEtC?=
 =?utf-8?B?UEEzbU03MkpDbmhaQzh3bEpGdmp4akF6ZnRVeXJVWnFnVWFqS1IvZWJRNytt?=
 =?utf-8?B?UDllNTVXcTkzYWhzNUYxR0pTV2VpeWpuVUlYZGRMRVUrY211ci9BREw5SGdh?=
 =?utf-8?B?TDFYYUxnaHhIUzA4WUlKbkt4K2YxajdaQTdwQUtZSE5teE56SUpFbTJscXU4?=
 =?utf-8?B?SjlMV3o0VW11d3dUa1FiTWtqZ3dubGRFaUV1NndGTFBhc3JQaUVzeSs3blVL?=
 =?utf-8?B?cTlKcGhMcXBqNGJtNlBzT2dEUWpnZVNRSlovSTVRQnFQSmtTVkFqSVlTRU91?=
 =?utf-8?B?OEVpU0g1YXAyeitIdWRaWEZmNWQ2cnlYRGVVS3hJSUFXTGI2YURaa2NIRExB?=
 =?utf-8?B?Rzc5bG1VWVVEbHVmZlFPTDR6VTY3VHcwc0FEZmc0aXVMQU91VTg2QSttdFY2?=
 =?utf-8?B?YWduVERKT05EdEJxMktGMHBJeFBKeDUxM05ZRkhvbitVSWNwR0c0em9BbW9Q?=
 =?utf-8?B?OE8xWFE4OHk2NURHUzkvQnQ5UTBDQWtWaTFVeDROWXRLWStCbGVtMjVYWXBM?=
 =?utf-8?B?UU5iakV3bkZyODQ3ZUtLelEwa25lYzI0UXNUWnRsUHdBL0tOL0w0MjhocHo0?=
 =?utf-8?B?Y25wTHdBY21IeGV6UUVTVFZZaFRzWStFZElBc2wrT3FnZFhjQklmWWZSWFZL?=
 =?utf-8?B?TFcyd012bXgveFBOSkQzalQ5VWF4dWNTa29lMTFRM1I1aURoVDFaM2tPT0Rl?=
 =?utf-8?B?M3Y5TEcyRUN1T0VEenl3VDVxUjJzRXFjcEwrR2FXcWtMblphQ1paclBXREoz?=
 =?utf-8?B?MWtpQ2JBQUhUYjdWMElkUFRxK0hlZzhHeC80YUw0YWdKN1JvY3c0T0ppZldj?=
 =?utf-8?B?VWcrcURjRFJLK1ZBUWVjakd1ZjhqQnpsRWdpbUR6RzhxejRMZGhsUWhIelNU?=
 =?utf-8?B?a0QzdDg5YWI3ZUIvR2N2VUVvT1ZoVWlzMmFTUU1WVzBxQzVLY3hNY2Rmc2Y0?=
 =?utf-8?B?TlFGcVIySm1SQ1R5dXJZSFl4TWVhaVNvV0hDVlNRTUx6eU95RUZiaXpyZEhl?=
 =?utf-8?B?YThPVUZQcmYvV2tJbzk1bG5JWDBsVnE1ZzNYWUd4cGRnbTRYTkNmSWlReEdD?=
 =?utf-8?B?SDhkU0E5TS9mNTBmUUZRTWlsd0htUkJpQS92RFIySHRGd0tNcEdnR2JMZ0Fx?=
 =?utf-8?B?dEVEOWJHSWJDbU5BV0ZHZlkvdnM5K2t2ODN0VEtJc2o2ZE1zcmdRUTBCM1NS?=
 =?utf-8?B?WkVBMnV6RmIyWGk2QVZTMEZLWjJ2ZGlOQW1aMVh2Ny9ZS0VjNFprdkdDcWJG?=
 =?utf-8?B?aVd6bTM0S2hTKy9mazRGYUZiL1E0eWFVKzB1Tm5iUVZHRTYxRnBTMTdwNTVn?=
 =?utf-8?B?d2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a003788-4423-4616-a5ea-08dd5bb21810
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Mar 2025 06:51:02.2328 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8J3V11xt8a2R8cWLhw+Kjhma7jQTxk1BeNGsJIu1ti4Sc0c2i3KWpdDiPOXUEOqpZ0Ke2QTnPGOfAbytjOUaA/SkQfrHpLO3GbTKc6/pm5g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4550
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTXVydGh5LCBBcnVuIFIg
PGFydW4uci5tdXJ0aHlAaW50ZWwuY29tPg0KPiBTZW50OiBUdWVzZGF5LCBGZWJydWFyeSAyNSwg
MjAyNSAxOjA0IFBNDQo+IFRvOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBpbnRl
bC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBpbnRlbC0NCj4geGVAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnOyB2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbQ0KPiBDYzogTXVydGh5LCBBcnVu
IFIgPGFydW4uci5tdXJ0aHlAaW50ZWwuY29tPjsgQm9yYWgsIENoYWl0YW55YSBLdW1hcg0KPiA8
Y2hhaXRhbnlhLmt1bWFyLmJvcmFoQGludGVsLmNvbT47IEt1bWFyLCBOYXZlZW4xDQo+IDxuYXZl
ZW4xLmt1bWFyQGludGVsLmNvbT4NCj4gU3ViamVjdDogW1BBVENIIHY3IDEvM10gZHJtL3BsYW5l
OiBBZGQgbmV3IHBsYW5lIHByb3BlcnR5DQo+IElOX0ZPUk1BVFNfQVNZTkMNCj4gDQo+IFRoZXJl
IGV4aXN0cyBhIHByb3BlcnR5IElOX0ZPUk1BVFMgd2hpY2ggZXhwb3NlcyB0aGUgcGxhbmUgc3Vw
cG9ydGVkDQo+IG1vZGlmaWVycy9mb3JtYXRzIHRvIHRoZSB1c2VyLiBJbiBzb21lIHBsYXRmb3Jt
cyB3aGVuIGFzeW5jaHJvbm91cyBmbGlwIGFyZQ0KPiB1c2VkIGFsbCBvZiBtb2RpZmllcnMvZm9y
bWF0cyBtZW50aW9uZWQgaW4gSU5fRk9STUFUUyBhcmUgbm90IHN1cHBvcnRlZC4NCj4gVGhpcyBw
YXRjaCBhZGRzIGEgbmV3IHBsYW5lIHByb3BlcnR5IElOX0ZPUk1BVFNfQVNZTkMgdG8gZXhwb3Nl
IHRoZQ0KPiBhc3luYyBmbGlwIHN1cHBvcnRlZCBtb2RpZmllcnMvZm9ybWF0cyBzbyB0aGF0IHVz
ZXIgY2FuIHVzZSB0aGlzIGluZm9ybWF0aW9uDQo+IGFoZWFkIGFuZCBkbyBmbGlwIHdpdGggdW5z
dXBwb3J0ZWQgZm9ybWF0cy9tb2RpZmllcnMuIFRoaXMgd2lsbCBzYXZlIGZsaXANCj4gZmFpbHVy
ZXMuDQo+IEFkZCBhIG5ldyBmdW5jdGlvbiBwb2ludGVyIHNpbWlsYXIgdG8gZm9ybWF0X21vZF9z
dXBwb3J0ZWQgc3BlY2lmaWNhbGx5IGZvcg0KPiBhc3luY2hyb25vdXMgZmxpcC4NCj4gDQo+IHYy
OiBSZW1vdmUgYXN5bmMgdmFyaWFibGUgZnJvbSBkcm1fcGxhbmUgKFZpbGxlKQ0KPiB2MzogQWRk
IG5ldyBmdW5jdGlvbiBwb2ludGVyIGZvciBhc3luYyAoVmlsbGUpDQo+IHY1OiBUeXBvIGNvcnJl
Y3RlZCBpbiBjb21taXQgbWVzc2FnZSAmIHNvbWUgY29ycmVjdGlvbiBpbiB0aGUga2VybmVsDQo+
IGRvY3VtZW50YXRpb24uIChDaGFpdGFueWEpDQo+IHY3OiBQbGFjZSBJTl9GT1JNQVRTX0FTWU5D
IG5leHQgdG8gSU5fRk9STUFUUyAoVmlsbGUpDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBBcnVuIFIg
TXVydGh5IDxhcnVuLnIubXVydGh5QGludGVsLmNvbT4NCj4gUmV2aWV3ZWQtYnk6IENoYWl0YW55
YSBLdW1hciBCb3JhaCA8Y2hhaXRhbnlhLmt1bWFyLmJvcmFoQGludGVsLmNvbT4NCj4gVGVzdGVk
LWJ5OiBOYXZlZW4gS3VtYXIgPG5hdmVlbjEua3VtYXJAaW50ZWwuY29tPg0KPiAtLS0NCj4gIGRy
aXZlcnMvZ3B1L2RybS9kcm1fbW9kZV9jb25maWcuYyB8ICA3ICsrKysrKysNCj4gIGRyaXZlcnMv
Z3B1L2RybS9kcm1fcGxhbmUuYyAgICAgICB8ICA4ICsrKysrKysrDQo+ICBpbmNsdWRlL2RybS9k
cm1fbW9kZV9jb25maWcuaCAgICAgfCAgNiArKysrKysNCj4gIGluY2x1ZGUvZHJtL2RybV9wbGFu
ZS5oICAgICAgICAgICB8IDE3ICsrKysrKysrKysrKysrKysrDQo+ICA0IGZpbGVzIGNoYW5nZWQs
IDM4IGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJt
X21vZGVfY29uZmlnLmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0vZHJtX21vZGVfY29uZmlnLmMNCj4g
aW5kZXgNCj4gODY0MmEyZmIyNWE5MDExNmRhYjk3NWFhMGFiNmI1MWRlYWZiNGI5Ni4uYjQyMzlm
ZDA0ZTlkYTRkNGI1Y2ZjY2RlDQo+IGYxZDNkZGU5NTU2ZjMyMmQgMTAwNjQ0DQo+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9kcm1fbW9kZV9jb25maWcuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
ZHJtX21vZGVfY29uZmlnLmMNCj4gQEAgLTM4MSw2ICszODEsMTMgQEAgc3RhdGljIGludA0KPiBk
cm1fbW9kZV9jcmVhdGVfc3RhbmRhcmRfcHJvcGVydGllcyhzdHJ1Y3QgZHJtX2RldmljZSAqZGV2
KQ0KPiAgCQlyZXR1cm4gLUVOT01FTTsNCj4gIAlkZXYtPm1vZGVfY29uZmlnLm1vZGlmaWVyc19w
cm9wZXJ0eSA9IHByb3A7DQo+IA0KPiArCXByb3AgPSBkcm1fcHJvcGVydHlfY3JlYXRlKGRldiwN
Cj4gKwkJCQkgICBEUk1fTU9ERV9QUk9QX0lNTVVUQUJMRSB8DQo+IERSTV9NT0RFX1BST1BfQkxP
QiwNCj4gKwkJCQkgICAiSU5fRk9STUFUU19BU1lOQyIsIDApOw0KPiArCWlmICghcHJvcCkNCj4g
KwkJcmV0dXJuIC1FTk9NRU07DQo+ICsJZGV2LT5tb2RlX2NvbmZpZy5hc3luY19tb2RpZmllcnNf
cHJvcGVydHkgPSBwcm9wOw0KPiArDQo+ICAJcHJvcCA9IGRybV9wcm9wZXJ0eV9jcmVhdGUoZGV2
LA0KPiAgCQkJCSAgIERSTV9NT0RFX1BST1BfSU1NVVRBQkxFIHwNCj4gRFJNX01PREVfUFJPUF9C
TE9CLA0KPiAgCQkJCSAgICJTSVpFX0hJTlRTIiwgMCk7DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vZHJtX3BsYW5lLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3BsYW5lLmMNCj4gaW5k
ZXgNCj4gYTI4YjIyZmRkN2E0MWFjYTgyZDA5N2Q0MjIzNzg1MWRhOWEwYTc5Yi4uZmUxODFjMTAw
MjE3MWFjYzY4ZDMwNTRjDQo+IDJkMTc4ZjliOWY1MDFmZTIgMTAwNjQ0DQo+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9kcm1fcGxhbmUuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3BsYW5l
LmMNCj4gQEAgLTE0MSw2ICsxNDEsMTQgQEANCj4gICAqICAgICB2YXJpb3VzIGJ1Z3MgaW4gdGhp
cyBhcmVhIHdpdGggaW5jb25zaXN0ZW5jaWVzIGJldHdlZW4gdGhlIGNhcGFiaWxpdHkNCj4gICAq
ICAgICBmbGFnIGFuZCBwZXItcGxhbmUgcHJvcGVydGllcy4NCj4gICAqDQo+ICsgKiBJTl9GT1JN
QVRTX0FTWU5DOg0KPiArICogICAgIEJsb2IgcHJvcGVydHkgd2hpY2ggY29udGFpbnMgdGhlIHNl
dCBvZiBidWZmZXIgZm9ybWF0IGFuZCBtb2RpZmllcg0KPiArICogICAgIHBhaXJzIHN1cHBvcnRl
ZCBieSB0aGlzIHBsYW5lIGZvciBhc3luY2hyb25vdXMgZmxpcHMuIFRoZSBibG9iIGlzIGEgc3Ry
dWN0DQo+ICsgKiAgICAgZHJtX2Zvcm1hdF9tb2RpZmllcl9ibG9iLiBVc2Vyc3BhY2UgY2Fubm90
IGNoYW5nZSB0aGlzIHByb3BlcnR5Lg0KPiBUaGlzIGlzIGFuDQo+ICsgKiAgICAgb3B0aW9uYWwg
cHJvcGVydHkgYW5kIGlmIG5vdCBwcmVzZW50IHRoZW4gdXNlciBzaG91bGQgZXhwZWN0IGEgZmFp
bHVyZSBpbg0KPiArICogICAgIGF0b21pYyBpb2N0bCB3aGVuIHRoZSBtb2RpZmllci9mb3JtYXQg
aXMgbm90IHN1cHBvcnRlZCBieSB0aGF0IHBsYW5lDQo+IHVuZGVyDQo+ICsgKiAgICAgYXN5bmNo
cm9ub3VzIGZsaXAuDQo+ICsgKg0KPiAgICogU0laRV9ISU5UUzoNCj4gICAqICAgICBCbG9iIHBy
b3BlcnR5IHdoaWNoIGNvbnRhaW5zIHRoZSBzZXQgb2YgcmVjb21tZW5kZWQgcGxhbmUgc2l6ZQ0K
PiAgICogICAgIHdoaWNoIGNhbiB1c2VkIGZvciBzaW1wbGUgImN1cnNvciBsaWtlIiB1c2UgY2Fz
ZXMgKGVnLiBubyBzY2FsaW5nKS4NCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2RybV9tb2Rl
X2NvbmZpZy5oDQo+IGIvaW5jbHVkZS9kcm0vZHJtX21vZGVfY29uZmlnLmggaW5kZXgNCj4gMjcx
NzY1ZTJlOWYyZGE2MmFhZjBkMjU4ODI4ZWY0MTk2ZTE0ODIyZS4uMGMxMTZkNmRmZDI3NzI2MmIx
YTRjMGYwDQo+IDk3ZmNlMmQ3MTlmNDM4NDQgMTAwNjQ0DQo+IC0tLSBhL2luY2x1ZGUvZHJtL2Ry
bV9tb2RlX2NvbmZpZy5oDQo+ICsrKyBiL2luY2x1ZGUvZHJtL2RybV9tb2RlX2NvbmZpZy5oDQo+
IEBAIC05MzYsNiArOTM2LDEyIEBAIHN0cnVjdCBkcm1fbW9kZV9jb25maWcgew0KPiAgCSAqLw0K
PiAgCXN0cnVjdCBkcm1fcHJvcGVydHkgKm1vZGlmaWVyc19wcm9wZXJ0eTsNCj4gDQo+ICsJLyoq
DQo+ICsJICogQGFzeW5jX21vZGlmaWVyc19wcm9wZXJ0eTogUGxhbmUgcHJvcGVydHkgdG8gbGlz
dCBzdXBwb3J0DQo+IG1vZGlmaWVyL2Zvcm1hdA0KPiArCSAqIGNvbWJpbmF0aW9uIGZvciBhc3lu
Y2hyb25vdXMgZmxpcHMuDQo+ICsJICovDQo+ICsJc3RydWN0IGRybV9wcm9wZXJ0eSAqYXN5bmNf
bW9kaWZpZXJzX3Byb3BlcnR5Ow0KPiArDQo+ICAJLyoqDQo+ICAJICogQHNpemVfaGludHNfcHJv
cGVydHk6IFBsYW5lIFNJWkVfSElOVFMgcHJvcGVydHkuDQo+ICAJICovDQo+IGRpZmYgLS1naXQg
YS9pbmNsdWRlL2RybS9kcm1fcGxhbmUuaCBiL2luY2x1ZGUvZHJtL2RybV9wbGFuZS5oIGluZGV4
DQo+IGRkNzE4YzYyYWMzMWJmMTY2MDZmM2VlOWYwMjVhNWIxNzFjZDFlNjcuLjQzOTNhMGU5ZWRm
OTFjY2ZkNzhlZjYyYjENCj4gNjhiOTMxMzE4N2MxYTgxIDEwMDY0NA0KPiAtLS0gYS9pbmNsdWRl
L2RybS9kcm1fcGxhbmUuaA0KPiArKysgYi9pbmNsdWRlL2RybS9kcm1fcGxhbmUuaA0KPiBAQCAt
NTQ5LDYgKzU0OSwyMyBAQCBzdHJ1Y3QgZHJtX3BsYW5lX2Z1bmNzIHsNCj4gIAkgKi8NCj4gIAli
b29sICgqZm9ybWF0X21vZF9zdXBwb3J0ZWQpKHN0cnVjdCBkcm1fcGxhbmUgKnBsYW5lLCB1aW50
MzJfdA0KPiBmb3JtYXQsDQo+ICAJCQkJICAgICB1aW50NjRfdCBtb2RpZmllcik7DQo+ICsJLyoq
DQo+ICsJICogQGZvcm1hdF9tb2Rfc3VwcG9ydGVkX2FzeW5jOg0KPiArCSAqDQo+ICsJICogVGhp
cyBvcHRpb25hbCBob29rIGlzIHVzZWQgZm9yIHRoZSBEUk0gdG8gZGV0ZXJtaW5lIGlmIGZvcg0K
PiArCSAqIGFzeW5jaHJvbm91cyBmbGlwIHRoZSBnaXZlbiBmb3JtYXQvbW9kaWZpZXIgY29tYmlu
YXRpb24gaXMgdmFsaWQNCj4gZm9yDQo+ICsJICogdGhlIHBsYW5lLiBUaGlzIGFsbG93cyB0aGUg
RFJNIHRvIGdlbmVyYXRlIHRoZSBjb3JyZWN0IGZvcm1hdA0KPiArCSAqIGJpdG1hc2sgKHdoaWNo
IGZvcm1hdHMgYXBwbHkgdG8gd2hpY2ggbW9kaWZpZXIpLCBhbmQgdG8gdmFsaWRhdGUNCj4gKwkg
KiBtb2RpZmllcnMgYXQgYXRvbWljX2NoZWNrIHRpbWUuDQo+ICsJICoNCj4gKwkgKiBSZXR1cm5z
Og0KPiArCSAqDQo+ICsJICogVHJ1ZSBpZiB0aGUgZ2l2ZW4gbW9kaWZpZXIgaXMgdmFsaWQgZm9y
IHRoYXQgZm9ybWF0IG9uIHRoZSBwbGFuZS4NCj4gKwkgKiBGYWxzZSBvdGhlcndpc2UuDQo+ICsJ
ICovDQo+ICsJYm9vbCAoKmZvcm1hdF9tb2Rfc3VwcG9ydGVkX2FzeW5jKShzdHJ1Y3QgZHJtX3Bs
YW5lICpwbGFuZSwNCj4gKwkJCQkJICAgdWludDMyX3QgZm9ybWF0LCB1aW50NjRfdCBtb2RpZmll
cik7DQoNClRoZXNlIGFsc28gbmVlZCB0byBiZSBjaGFuZ2VkIHRvIHUzMiBhbmQgdTY0Lg0KDQpS
ZWdhcmRzDQoNCkNoYWl0YW55YQ0KDQo+ICsNCj4gIH07DQo+IA0KPiAgLyoqDQo+IA0KPiAtLQ0K
PiAyLjI1LjENCg0K
