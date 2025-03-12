Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E3D0A5D5BC
	for <lists+dri-devel@lfdr.de>; Wed, 12 Mar 2025 06:51:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BEAA10E6D0;
	Wed, 12 Mar 2025 05:51:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U5yoPiwc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66F7110E6D0;
 Wed, 12 Mar 2025 05:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741758687; x=1773294687;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=a3zFamwODUm3VqKdQLxCc1epMmLU0tVvXZwX7AzQV6o=;
 b=U5yoPiwcgeiPxZctk/lYo6I3rNr99bE7AZPjByycCL/ETUg+DDstByyy
 LIe9fJypYlqzPNfuY62PFz9mRcwn8DlKKeZ1TfEZgCwbRfqsR7JRAMxcC
 /aXnxQgGExcnDIXyA1tEjwkiIFmaKkqA43kBklT7YqgP/UciDHVnds5Hz
 VcyGVaq26fYNBkq6kEeBs/IwrqNb8eEtP7+NoGyjP/7S0Zf0lvfPMYU8c
 uokv95SIV9U20zfJ/VJG+q0rplSicpKSpk7N1t4GYJ0/hSL/gP+iT7REc
 56laT4spZgmC/FEKM3kmMldn+y7NFHILhWU6yy6WreTGKC4I5f847pjyb A==;
X-CSE-ConnectionGUID: Stk2dorgRTKaWJrJ/zeBRA==
X-CSE-MsgGUID: +avkq4seToq6bGMC8vmBIw==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="46604840"
X-IronPort-AV: E=Sophos;i="6.14,240,1736841600"; d="scan'208";a="46604840"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 22:51:26 -0700
X-CSE-ConnectionGUID: iHNUnbW8RTeSuGMKKE3SKQ==
X-CSE-MsgGUID: wbZfhWD1Q3uqWaHJBXgO+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,240,1736841600"; d="scan'208";a="120561039"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 22:51:25 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 11 Mar 2025 22:51:24 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 11 Mar 2025 22:51:24 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 11 Mar 2025 22:51:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qb0jdQg9dYoJ1KSk3pXWtvJpolB0NSEna4b9HXzPVXOSybKUcb2o61mdaVTPq/GdqUOM0NuqMYWm043hkrTxTYwzSR4j6G/TNa8Axz006QT7cxl7BchzjsWQq6TglE3gpuAqV09aQORNjQkkJzQO/BIsPV5vSDVIP21OEdzs7UBeKRxBPXp0tswO1TpV6eHiMjGgrLf3mkMK67nBi5MnCFo5STq/ARZJK7+4A2Dtv3gMjNrJQhDyvI/qtBMBa9/Hv8R7bH7SVrtUTKioJJD3lLVwyR0lirUe4xPOSdXLYN/1i3M7We9mM9hGJWrz9wNXOwwOChI5D6pLTaacwPsHMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a3zFamwODUm3VqKdQLxCc1epMmLU0tVvXZwX7AzQV6o=;
 b=riFrOM/PUCScM6Ec9p4bqVjcvKUZKFeo7OWoCjjkD0k9iLX5w/ki4PNSswjdta8kT/BVFS1WG1Jr23CdgTlaJg0g+BnTJPPHgqiIaC5Y2qA28bImXt/Qn2cMQwmSFb+7rcOutj0JPMfwfWkppkVNkufjfKUwDOan++ioOY8E+0sydsgPgJq/+V80rfdJhjBdDj4oSJixJGUB1i/EWN1m/Neqs9Edy22YqXhg9H5RvQNM7XlHHDMNyfxV0YGDOC5qT5971EwUHB3XyKv7yozcfp4gjUuFKn1UhTIyF3n8dGqEoq4zOIJSuLmnstNe0X3I5XQCp6ztyIrAS4wLj9ZR7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by SJ1PR11MB6132.namprd11.prod.outlook.com (2603:10b6:a03:45d::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Wed, 12 Mar
 2025 05:51:22 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525%5]) with mapi id 15.20.8511.026; Wed, 12 Mar 2025
 05:51:22 +0000
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
To: "Murthy, Arun R" <arun.r.murthy@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Kumar, Naveen1" <naveen1.kumar@intel.com>
Subject: RE: [PATCH v6 2/3] drm/plane: modify create_in_formats to accommodate
 async
Thread-Topic: [PATCH v6 2/3] drm/plane: modify create_in_formats to
 accommodate async
Thread-Index: AQHbgrEpTxj+/VYtsUyB9GzSpGmxkrNvH0UQgAAAy6A=
Date: Wed, 12 Mar 2025 05:51:22 +0000
Message-ID: <SJ1PR11MB61297A0A210F04DA8E283E63B9D02@SJ1PR11MB6129.namprd11.prod.outlook.com>
References: <20250219-asyn-v6-0-b959e6becb3c@intel.com>
 <20250219-asyn-v6-2-b959e6becb3c@intel.com>
 <SJ1PR11MB6129B7B03B375B1A9E62455EB9D02@SJ1PR11MB6129.namprd11.prod.outlook.com>
In-Reply-To: <SJ1PR11MB6129B7B03B375B1A9E62455EB9D02@SJ1PR11MB6129.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6129:EE_|SJ1PR11MB6132:EE_
x-ms-office365-filtering-correlation-id: 789a7fc7-a006-4619-09d2-08dd6129eb54
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?utf-8?B?Y1FoTzRuamw3aHdPb3JjZTJ6Y1BCTFRYV1UxRk4zb3lKdVdRNGZxbWs0Q0dv?=
 =?utf-8?B?VC9tL1lMcTQwVFA0ODh2T0pqcSt4UU8yQkhaNkwyemw1Z21sazRyL05Xc05w?=
 =?utf-8?B?TW4wekQxdVdKclBQcEIzN3ltL0drTDJkSlRyZ3h4ZjVneHh3LytxU1J0UGJ1?=
 =?utf-8?B?VGVkZW9zNHJURkc0dUc2bk02NVBJd1lobndkcWpNa0lBcFhYcHk3OEU2bGZ5?=
 =?utf-8?B?c3NCdEtmckZLRHp6SE5LTTBBeUFyOWIwUDNCb3p6TEsrUGVtR21rKzJGLzMr?=
 =?utf-8?B?YjVsZmtKd2xrNzNwSG9XNHh5MzRxUDZ2Q2V5YUFtMk5uSEVLTTRJUmo0WkJw?=
 =?utf-8?B?VUdKMVBJVDhVa3RBMGtVakZHNldqRXZ2d0NrRFUvWWxuZzlUTVdRMkxSdDVD?=
 =?utf-8?B?WTU2WHZQMy9CRVB5bE5zMHFTQ1FuNmJ6T2ptSVB2cG5LK01ZR0cvZDBMR243?=
 =?utf-8?B?Tm0yRlJEa0dnMjZWdkVMTkNNYm90VDRLaVoxdTNLblg5M0VwOGFVWFh4Z1Rm?=
 =?utf-8?B?bnBHNlpZMUVobVVUc2NsN3ozSXJYQ3J1SzlvNzhXS1lLaXcxK1FpVEk2OGxS?=
 =?utf-8?B?cGVPelVwT2E4dTFvYzFWK0JFcFFpaytDS2ppaHRZSzJZNkZrNUJGRnI2SGhE?=
 =?utf-8?B?TExMTkt5dlJuMHF4TmtxcVZBSDVHcEU0Y3VkbzZVSjByMHl6TUQzY1QrdVBK?=
 =?utf-8?B?MVBHNUpPWXl3S2ZqTnFJWHg0MmlLdXdNNHVqTm9ZaEZOVEtkWVVpNUN1Zm5Z?=
 =?utf-8?B?aXRpQTIwcmpmOFMwVm1RL0xhQTcxR1hhSzg5ZnBkdmhiVERiYWZ4UlRtUmh4?=
 =?utf-8?B?b2RLN1RNR0ZhSkRhUWtrbjRVYnNqTXh5YUtGVVJyM1oyOHdpSlFUbTk1MjBp?=
 =?utf-8?B?R2pLYnF2RTd0bS9FNXVHN0hPc0dRWk9jc0VJZmVzS2o0MERqUUd3UmRGVFNN?=
 =?utf-8?B?MGlaZTVEUkZTR3FrZURQbmZWR3FmRkdzQVRrTTdIangrR2t4dmhKUzR2aXhJ?=
 =?utf-8?B?Z0hVWVNlYU04Ly9OMSsxdjJEWktOVEgxNHhIMEo3bkZtRUg2YWVaMWpxM0tW?=
 =?utf-8?B?RzM2eUttSENibE9BQkFuSlZQZm1XZDc2dHlpMGZhdnJwRDdoTXNPUnFuSVZh?=
 =?utf-8?B?dWpaeTg5RVJkd2ZRWUk4eGZvN0ZnS0hVOVlvc0FuckNYaHMxOW5FZlJWSmdM?=
 =?utf-8?B?N3VyejZjNS9QSkwyZmZqMG8zNGpDM2lKdzBPVW04UnFFQXJKeUh4dHRFbWtN?=
 =?utf-8?B?eEpFbkk4RWZOcG43VHJqVGtOUnYyck5vdXFMQjN4Z1JvcjBGMnZuVzRGd01v?=
 =?utf-8?B?NjVERi8veENSNVVkWW4ydFQxTmkvVzVMa0l6VFVNSER4REJxU3FiSFpXZ0xD?=
 =?utf-8?B?UTNmTXB2VGVvWVU3V2RrazhSbWVSVW94Q2N5MERPMTRhQjl2VWJwN1IzZnZE?=
 =?utf-8?B?dVZFNzBXamVZUTR1TUQybUpZaWpvYzIzZlh0NCs2SFRPWjRkOXhCRW1rcTdT?=
 =?utf-8?B?T2g3SzNpMG5uNUFIeC9odVliOFdqV0FEY3VYOVFjSnFETS9KT3RpWEFQUE9w?=
 =?utf-8?B?N0VDQjcxaGR3NUs3VGhMYXNOaUNDR2hKVStnQlpvWi9hajNhQ1lUME12VUx1?=
 =?utf-8?B?c1VONkxzelZtVm9XN2RROTBFZU1ZOFRYbmNZUnI4dFhZMDVEUGxBZDI4TndL?=
 =?utf-8?B?b3lsanFnbEE1VEs4NTlUTE1vUmxGSDF0aVJ2ZHgwblVSaGdDOFQvQWdDQ1A3?=
 =?utf-8?B?NW1HOTVZbUNya0w3RGRrb0tQUVcxRVBER1VBOEp6ZHhvYkhGSzF4MVgrRjBU?=
 =?utf-8?B?MG5VYXB0VVd0cGlCOGZzNDMvQ0RFSERtMVR2YWsra0MyaDhYUTM0UzQxNTh5?=
 =?utf-8?B?L2x0Y0VqV3FXQjBsRGwzdVpUR3ZEcGdmVnZrbnFQMkFVOVBWSzVzOU5EVGw1?=
 =?utf-8?Q?LMAlwi5zoGf+62Kd8NApcRdkH+npjkvi?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6129.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aUVaVS8yd3FteUhYZVl6ODZnbCtEVGVCVlFUNHMxQlFxYTdmVlorVDNzc1N2?=
 =?utf-8?B?OVE2WU54cnIyMnRDYk8yR05PL1FMMUFVMGhxL3ZkUjlhelNDVUJ5LzNsNlFQ?=
 =?utf-8?B?MjN6OGpCWVg0S0FSUWlUWlM3RzQ4bml6TmV5clJYRzdRcnFQYzRLSWVvME9s?=
 =?utf-8?B?MTFBSGJZOFZtZGl1N1Z5RWEvNHdmUGJnMEFnZU5jUUFVQVJZNERoNEVCUVZD?=
 =?utf-8?B?d2JJSXpuV0tySFBRUzR4YUZGOHN6aDR4M1k3N3g3K0g0OHVmbXF3cUZZWkFC?=
 =?utf-8?B?ZHcyaFZ3YlFQVHR0QWwwbWVEQmhQSlhBUHlkbDE4V3E2N0IzSXlSOEdOWk9H?=
 =?utf-8?B?bHVqQ1BrQlZ1Yk9hdklnMnZlZ1grMnhUL2p5bXJqSXlmZVRHN2I5MFB2dWM4?=
 =?utf-8?B?YmRtMW1RU0ViczRzaFFTZEtzSjhtTnZzdW53eVArMEdwQmVFOEJMMFArYkdJ?=
 =?utf-8?B?eXQ5SjE2cmJjTVN4OHc0YTl5dFFUTWI0YTdxSDFEMHJOdyttZk1waEpobFZT?=
 =?utf-8?B?L0dzZk54bERzamZlWGR3YmhIUm04aGRtSXNuWFBsaUZ2eXRnb1ZDWUs1clhB?=
 =?utf-8?B?NUpOcEhTMG9PdGpMVW9HWHdBSUJiZk1vdFR5WGQ0U0VleTR5TSt6c1BBdXUz?=
 =?utf-8?B?UjNscGpoMEZ3Um9NUmQ4eGtwNnpJSm82T0ZFYjZ5TjQvSENvbjlrbDQyVGY4?=
 =?utf-8?B?Vk5ObWRvbU01cDFSQXFZOXpvbXBkWXZ0aHRLVXZLTTQ4L2lFdGlJeGxkSVIy?=
 =?utf-8?B?enJ6dXVOcklYMmJUVE94Sk9JNkJRWjVJQksweHplQzZYd2tlWUZYdUtjREla?=
 =?utf-8?B?TTRSd0pZZExmWmNtalVEL05zMlYwazZ5UUNvR1ZsbU9CYU1vLzZmRU85bEx2?=
 =?utf-8?B?ejU1UDd2N0xhQmE3eW1TR0lUTFZjYk1yODBEVFFKZ0hXWG1QMmxTYzlneUk4?=
 =?utf-8?B?QVNNTEJZdDd3VjkrTktmVWJtYUZzdEQ1TFY0RDY5ZVhpOXBlM3h2RmMwYmgw?=
 =?utf-8?B?KzBOd3p5OXhvL05YRXQzdGNyV3VJS0pFMFFSd2s4b2xBUnhTdndDZFAzM3Fh?=
 =?utf-8?B?b3ZwU0t4NHNreW90cWltYXNoeDVmNzdSdGZaQ1laNlZlei9wdmtDNW1tNFF4?=
 =?utf-8?B?Ni9FdThLeWdydDFPdDJGekM2Y1A1cjcvOS92dFNrdmI1cm9GNWxlMXZTWnph?=
 =?utf-8?B?dXJUUTM3bUZBejNIQXdOcUpiNGliZDZ4TmtSa2ZOTEVwV3NFKzBMY242T0Ur?=
 =?utf-8?B?RGRNOS8zRjNyLzlLVW5PeU1CRXhXTlBLaDNiamEyRDhvempPVWp6OHVSeEpr?=
 =?utf-8?B?QXNTV1RRU1JCcTk5ZjJ5S0w1REdvOTAzeFlaSVdCczZXTSs3bHZoaERnMFMz?=
 =?utf-8?B?R0pWZVNNZjlaaHA5TDJGcEtEd3ljWDhZVEhJaFptelZrK3h4dnlmSkxKeXpE?=
 =?utf-8?B?Q1RyR3RMUmNkaS8zcER5SmFkS2ZreTd5VGtpRkZSOFRrdFZOV0pjYlNxZGZi?=
 =?utf-8?B?T01ia3BPOFlnUmdSSEcwbEFpZGNwdFJHYVdWbThWU04xbncySkcwZWhsbUZy?=
 =?utf-8?B?K0tXVUVpMkZTUWE4SWdwUDFqL2RnNEdwcHRDUGhHdm9KcUJRMVdWNWt1VUJZ?=
 =?utf-8?B?T2xlKzBTQmdjOXV0NDBKTlBOZDloSEtYcVJwM3ZSUEJzQzhkeWtpMzMzZU40?=
 =?utf-8?B?TXhjeitzNzNxZ3Q3TUFjWkZzSEVnaGdkazVhQVlWV2laZ1VUTTVnR1FBQmhW?=
 =?utf-8?B?V1NYamFOR3NpaUMwd1VyTi9QOGJ3RG5VQ2dJSkJvaWJQZnVvWUVIcU5NVjJI?=
 =?utf-8?B?QkVLVENsaFdjL3hvN0NiU010RWc5akF1ZlZNS0tlYnZJSC8yeW1Ibi9vbzVU?=
 =?utf-8?B?UGh2UndZYXFvdnUrQ241WTJ4TmFTQ3RPaGlVdTZQMDZaWEo4dTNvYjV4NHZU?=
 =?utf-8?B?S3hBK1Roam1qSUcrZTFCOFpicFRHUG8wcWhJSTVodk5EME8rcFlLQUdYcGJ3?=
 =?utf-8?B?VGlsd3l2bTJxUW9HZnZ1a0YzUVdMeFM2a0JQUERybGdCcXFnOVk2QXkvbHdh?=
 =?utf-8?B?KzhBTVFlZHFuU245MnBodUtlM0RkY0MvbnN2cGZhbkhBS3VlNDl6QVpSSTMw?=
 =?utf-8?B?dW5qZ29rMkJIejRZSWZBa1JpYnR2c2UyVStJUHlNMmdocENEVGtaV1UyMDdU?=
 =?utf-8?B?V0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 789a7fc7-a006-4619-09d2-08dd6129eb54
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Mar 2025 05:51:22.6104 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: n8uaCiEEeEiAKsfV4nPDyN+/22iUi+ufQcA5bBJ5MAt8g8ETnPWenUCkNyfuAochSGjOSvKV4o8PdAAQWc9hNgr99W71Zx9OaCboRUB2HWw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6132
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQm9yYWgsIENoYWl0YW55
YSBLdW1hcg0KPiBTZW50OiBXZWRuZXNkYXksIE1hcmNoIDEyLCAyMDI1IDExOjE5IEFNDQo+IFRv
OiBNdXJ0aHksIEFydW4gUiA8YXJ1bi5yLm11cnRoeUBpbnRlbC5jb20+OyBkcmktDQo+IGRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgaW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsg
aW50ZWwtDQo+IHhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzogS3VtYXIsIE5hdmVlbjEg
PE5hdmVlbjEuS3VtYXJAaW50ZWwuY29tPg0KPiBTdWJqZWN0OiBSRTogW1BBVENIIHY2IDIvM10g
ZHJtL3BsYW5lOiBtb2RpZnkgY3JlYXRlX2luX2Zvcm1hdHMgdG8NCj4gYWNjb21tb2RhdGUgYXN5
bmMNCj4gDQo+IA0KPiANCj4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+IEZyb206
IE11cnRoeSwgQXJ1biBSIDxhcnVuLnIubXVydGh5QGludGVsLmNvbT4NCj4gPiBTZW50OiBXZWRu
ZXNkYXksIEZlYnJ1YXJ5IDE5LCAyMDI1IDI6NDcgUE0NCj4gPiBUbzogZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZzsgaW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsNCj4gPiBp
bnRlbC0geGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+ID4gQ2M6IEJvcmFoLCBDaGFpdGFueWEg
S3VtYXIgPGNoYWl0YW55YS5rdW1hci5ib3JhaEBpbnRlbC5jb20+OyBNdXJ0aHksDQo+ID4gQXJ1
biBSIDxhcnVuLnIubXVydGh5QGludGVsLmNvbT47IEt1bWFyLCBOYXZlZW4xDQo+ID4gPG5hdmVl
bjEua3VtYXJAaW50ZWwuY29tPg0KPiA+IFN1YmplY3Q6IFtQQVRDSCB2NiAyLzNdIGRybS9wbGFu
ZTogbW9kaWZ5IGNyZWF0ZV9pbl9mb3JtYXRzIHRvDQo+ID4gYWNjb21tb2RhdGUgYXN5bmMNCj4g
Pg0KPiA+IGNyZWF0ZV9pbl9mb3JtYXRzIGNyZWF0ZXMgdGhlIGxpc3Qgb2Ygc3VwcG9ydGVkIGZv
cm1hdC9tb2RpZmllcnMgZm9yDQo+ID4gc3luY2hyb25vdXMgZmxpcHMsIG1vZGlmeSB0aGUgc2Ft
ZSBmdW5jdGlvbiBzbyBhcyB0byB0YWtlIHRoZQ0KPiA+IGZvcm1hdF9tb2Rfc3VwcG9ydGVkIGFz
IGFyZ3VtZW50IGFuZCBjcmVhdGUgbGlzdCBvZiBmb3JtYXQvbW9kaWZpZXINCj4gPiBmb3IgYXN5
bmMgYXMgd2VsbC4NCj4gPg0KPiA+IHY1OiBjcmVhdGVfaW5fZm9ybWF0cyBjYW4gcmV0dXJuIC12
ZSB2YWx1ZSBpbiBmYWlsdXJlIGNhc2UsIGNvcnJlY3QNCj4gPiB0aGUgaWYgY29uZGl0aW9uIHRv
IGNoZWNrIHRoZSBjcmVhdGlvbiBvZiBibG9iIDxDaGFpdGFueWE+IERvbnQgYWRkDQo+ID4gdGhl
IG1vZGlmaWVyIGZvciB3aGljaCBub25lIG9mIHRoZSBmb3JtYXRzIGlzIG5vdCBzdXBwb3J0ZWQu
DQo+ID4gdjY6IFJlbW92ZSB0aGUgY29kZSBmb3IgbWFza2luZyB0aGUgdW5zdXBwb3J0ZWQgbW9k
aWZpZXJzIGFzIFVNRCBjYW4NCj4gPiBsZWF2ZSB3aXRoIGl0LiAoTmF2ZWVuL0NoYWl0YW55YSkN
Cj4gPg0KPiANCj4gTEdUTQ0KPiANCj4gUmV2aWV3ZWQtYnk6IENoYWl0YW55YSBLdW1hciBCb3Jh
aCA8Y2hhaXRhbnlhLmt1bWFyLmJvcmFoQGludGVsLmNvbT4NCg0KUGxlYXNlIGlnbm9yZSB0aGlz
LCBtZWFudCBmb3IgdjcuDQoNClJlZ2FyZHMNCg0KQ2hhaXRhbnlhDQo+IA0KPiA+IFNpZ25lZC1v
ZmYtYnk6IEFydW4gUiBNdXJ0aHkgPGFydW4uci5tdXJ0aHlAaW50ZWwuY29tPg0KPiA+IFRlc3Rl
ZC1ieTogTmF2ZWVuIEt1bWFyIDxuYXZlZW4xLmt1bWFyQGludGVsLmNvbT4NCj4gPiAtLS0NCj4g
PiAgZHJpdmVycy9ncHUvZHJtL2RybV9wbGFuZS5jIHwgNDUNCj4gKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrLS0NCj4gPiAtLS0tLS0tLS0tDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAz
MyBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vZHJtX3BsYW5lLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3BsYW5lLmMN
Cj4gPiBpbmRleA0KPiA+DQo+IGZlMTgxYzEwMDIxNzFhY2M2OGQzMDU0YzJkMTc4ZjliOWY1MDFm
ZTIuLmZjMjZlZjhhNmNhYjM0NmM5NDkxNDk1YjU3DQo+ID4gZjg4ZjFlYjIwNWQyMmMgMTAwNjQ0
DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9wbGFuZS5jDQo+ID4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2RybV9wbGFuZS5jDQo+ID4gQEAgLTE5Myw5ICsxOTMsMTIgQEAgbW9kaWZpZXJz
X3B0cihzdHJ1Y3QgZHJtX2Zvcm1hdF9tb2RpZmllcl9ibG9iDQo+ID4gKmJsb2IpDQo+ID4gIAly
ZXR1cm4gKHN0cnVjdCBkcm1fZm9ybWF0X21vZGlmaWVyICopKCgoY2hhciAqKWJsb2IpICsgYmxv
Yi0NCj4gPiA+bW9kaWZpZXJzX29mZnNldCk7ICB9DQo+ID4NCj4gPiAtc3RhdGljIGludCBjcmVh
dGVfaW5fZm9ybWF0X2Jsb2Ioc3RydWN0IGRybV9kZXZpY2UgKmRldiwgc3RydWN0DQo+ID4gZHJt
X3BsYW5lDQo+ID4gKnBsYW5lKQ0KPiA+ICtzdGF0aWMgaW50IGNyZWF0ZV9pbl9mb3JtYXRfYmxv
YihzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCBzdHJ1Y3QNCj4gPiArZHJtX3BsYW5lDQo+ID4gKnBs
YW5lLA0KPiA+ICsJCQkJIGJvb2wgKCpmb3JtYXRfbW9kX3N1cHBvcnRlZCkNCj4gPiArCQkJCQkJ
KHN0cnVjdCBkcm1fcGxhbmUgKnBsYW5lLA0KPiA+ICsJCQkJCQkgdWludDMyX3QgZm9ybWF0LA0K
PiA+ICsJCQkJCQkgdWludDY0X3QgbW9kaWZpZXIpKQ0KPiA+ICB7DQo+ID4gLQljb25zdCBzdHJ1
Y3QgZHJtX21vZGVfY29uZmlnICpjb25maWcgPSAmZGV2LT5tb2RlX2NvbmZpZzsNCj4gPiAgCXN0
cnVjdCBkcm1fcHJvcGVydHlfYmxvYiAqYmxvYjsNCj4gPiAgCXN0cnVjdCBkcm1fZm9ybWF0X21v
ZGlmaWVyICptb2Q7DQo+ID4gIAlzaXplX3QgYmxvYl9zaXplLCBmb3JtYXRzX3NpemUsIG1vZGlm
aWVyc19zaXplOyBAQCAtMjM3LDEzICsyNDAsMTcNCj4gPiBAQCBzdGF0aWMgaW50IGNyZWF0ZV9p
bl9mb3JtYXRfYmxvYihzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCBzdHJ1Y3QNCj4gPiBkcm1fcGxh
bmUgKnBsYW5lDQo+ID4gIAltb2QgPSBtb2RpZmllcnNfcHRyKGJsb2JfZGF0YSk7DQo+ID4gIAlm
b3IgKGkgPSAwOyBpIDwgcGxhbmUtPm1vZGlmaWVyX2NvdW50OyBpKyspIHsNCj4gPiAgCQlmb3Ig
KGogPSAwOyBqIDwgcGxhbmUtPmZvcm1hdF9jb3VudDsgaisrKSB7DQo+ID4gLQkJCWlmICghcGxh
bmUtPmZ1bmNzLT5mb3JtYXRfbW9kX3N1cHBvcnRlZCB8fA0KPiA+IC0JCQkgICAgcGxhbmUtPmZ1
bmNzLT5mb3JtYXRfbW9kX3N1cHBvcnRlZChwbGFuZSwNCj4gPiAtCQkJCQkJCSAgICAgICBwbGFu
ZS0NCj4gPiA+Zm9ybWF0X3R5cGVzW2pdLA0KPiA+IC0JCQkJCQkJICAgICAgIHBsYW5lLQ0KPiA+
ID5tb2RpZmllcnNbaV0pKSB7DQo+ID4gKwkJCWlmICghZm9ybWF0X21vZF9zdXBwb3J0ZWQgfHwN
Cj4gPiBmb3JtYXRfbW9kX3N1cHBvcnRlZA0KPiA+ICsJCQkJCQkJKHBsYW5lLA0KPiA+ICsJCQkJ
CQkJIHBsYW5lLQ0KPiA+ID5mb3JtYXRfdHlwZXNbal0sDQo+ID4gKwkJCQkJCQkgcGxhbmUtPm1v
ZGlmaWVyc1tpXSkpDQo+ID4gew0KPiA+ICAJCQkJbW9kLT5mb3JtYXRzIHw9IDFVTEwgPDwgajsN
Cj4gPiAgCQkJfQ0KPiA+ICAJCX0NCj4gPiArCQlpZiAoIW1vZC0+Zm9ybWF0cykgew0KPiA+ICsJ
CQlibG9iX2RhdGEtPmNvdW50X21vZGlmaWVycy0tOw0KPiA+ICsJCQljb250aW51ZTsNCj4gPiAr
CQl9DQo+ID4NCj4gPiAgCQltb2QtPm1vZGlmaWVyID0gcGxhbmUtPm1vZGlmaWVyc1tpXTsNCj4g
PiAgCQltb2QtPm9mZnNldCA9IDA7DQo+ID4gQEAgLTI1MSwxMCArMjU4LDcgQEAgc3RhdGljIGlu
dCBjcmVhdGVfaW5fZm9ybWF0X2Jsb2Ioc3RydWN0DQo+ID4gZHJtX2RldmljZSAqZGV2LCBzdHJ1
Y3QgZHJtX3BsYW5lICpwbGFuZQ0KPiA+ICAJCW1vZCsrOw0KPiA+ICAJfQ0KPiA+DQo+ID4gLQlk
cm1fb2JqZWN0X2F0dGFjaF9wcm9wZXJ0eSgmcGxhbmUtPmJhc2UsIGNvbmZpZy0NCj4gPiA+bW9k
aWZpZXJzX3Byb3BlcnR5LA0KPiA+IC0JCQkJICAgYmxvYi0+YmFzZS5pZCk7DQo+ID4gLQ0KPiA+
IC0JcmV0dXJuIDA7DQo+ID4gKwlyZXR1cm4gYmxvYi0+YmFzZS5pZDsNCj4gPiAgfQ0KPiA+DQo+
ID4gIC8qKg0KPiA+IEBAIC0zNzEsNiArMzc1LDcgQEAgc3RhdGljIGludCBfX2RybV91bml2ZXJz
YWxfcGxhbmVfaW5pdChzdHJ1Y3QNCj4gPiBkcm1fZGV2aWNlICpkZXYsDQo+ID4gIAl9Ow0KPiA+
ICAJdW5zaWduZWQgaW50IGZvcm1hdF9tb2RpZmllcl9jb3VudCA9IDA7DQo+ID4gIAlpbnQgcmV0
Ow0KPiA+ICsJaW50IGJsb2JfaWQ7DQo+ID4NCj4gPiAgCS8qIHBsYW5lIGluZGV4IGlzIHVzZWQg
d2l0aCAzMmJpdCBiaXRtYXNrcyAqLw0KPiA+ICAJaWYgKFdBUk5fT04oY29uZmlnLT5udW1fdG90
YWxfcGxhbmUgPj0gMzIpKSBAQCAtNDc3LDggKzQ4MiwyNA0KPiBAQA0KPiA+IHN0YXRpYyBpbnQg
X19kcm1fdW5pdmVyc2FsX3BsYW5lX2luaXQoc3RydWN0IGRybV9kZXZpY2UgKmRldiwNCj4gPiAg
CQlkcm1fcGxhbmVfY3JlYXRlX2hvdHNwb3RfcHJvcGVydGllcyhwbGFuZSk7DQo+ID4gIAl9DQo+
ID4NCj4gPiAtCWlmIChmb3JtYXRfbW9kaWZpZXJfY291bnQpDQo+ID4gLQkJY3JlYXRlX2luX2Zv
cm1hdF9ibG9iKGRldiwgcGxhbmUpOw0KPiA+ICsJaWYgKGZvcm1hdF9tb2RpZmllcl9jb3VudCkg
ew0KPiA+ICsJCWJsb2JfaWQgPSBjcmVhdGVfaW5fZm9ybWF0X2Jsb2IoZGV2LCBwbGFuZSwNCj4g
PiArCQkJCQkJcGxhbmUtPmZ1bmNzLQ0KPiA+ID5mb3JtYXRfbW9kX3N1cHBvcnRlZCk7DQo+ID4g
KwkJaWYgKGJsb2JfaWQgPiAwKQ0KPiA+ICsJCQlkcm1fb2JqZWN0X2F0dGFjaF9wcm9wZXJ0eSgm
cGxhbmUtPmJhc2UsDQo+ID4gKwkJCQkJCSAgIGNvbmZpZy0+bW9kaWZpZXJzX3Byb3BlcnR5LA0K
PiA+ICsJCQkJCQkgICBibG9iX2lkKTsNCj4gPiArCX0NCj4gPiArDQo+ID4gKwlpZiAocGxhbmUt
PmZ1bmNzLT5mb3JtYXRfbW9kX3N1cHBvcnRlZF9hc3luYykgew0KPiA+ICsJCWJsb2JfaWQgPSBj
cmVhdGVfaW5fZm9ybWF0X2Jsb2IoZGV2LCBwbGFuZSwNCj4gPiArCQkJCQkJcGxhbmUtPmZ1bmNz
LQ0KPiA+ID5mb3JtYXRfbW9kX3N1cHBvcnRlZF9hc3luYyk7DQo+ID4gKwkJaWYgKGJsb2JfaWQg
PiAwKQ0KPiA+ICsJCQlkcm1fb2JqZWN0X2F0dGFjaF9wcm9wZXJ0eSgmcGxhbmUtPmJhc2UsDQo+
ID4gKwkJCQkJCSAgIGNvbmZpZy0NCj4gPiA+YXN5bmNfbW9kaWZpZXJzX3Byb3BlcnR5LA0KPiA+
ICsJCQkJCQkgICBibG9iX2lkKTsNCj4gPiArCX0NCj4gPiArDQo+ID4NCj4gPiAgCXJldHVybiAw
Ow0KPiA+ICB9DQo+ID4NCj4gPiAtLQ0KPiA+IDIuMjUuMQ0KDQo=
