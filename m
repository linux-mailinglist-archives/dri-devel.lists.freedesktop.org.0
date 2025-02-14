Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 835C2A365C3
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 19:33:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1F5E10E35D;
	Fri, 14 Feb 2025 18:32:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="du3hFXOH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3229410E042;
 Fri, 14 Feb 2025 18:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739557975; x=1771093975;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=RUc2LOJ72ezOxh55uUVy2lVIbtZ48aETu37hsAP4/T4=;
 b=du3hFXOHcJTCsd4nuG1JNjiMhimxzuDl67ddk0MS7HN4mH+mQtnxPG3J
 jpE7B3U+10QbHhPD4zhlpBAaP/UOp3E6WJVEBjSBlUdawqx8uNXU69lKh
 t74Qa1NAwpCjQzIkjbH6ifdRfMs5PUZQkVBGWfGUMsIQcEXbh7MNm1PoF
 DLvfYIfUH3rUvcWXj11VR/Dh9DP39QbGfc2H044ebcCFifjtjmgwKo6qV
 b4TrAxPuGZKTqCgPqhmXQMpdnO8Joz5hxs9a1LCPrO1AjQI+p+w8zxjWb
 iZFYGSQULxJ74xBPYorp8bxaYux4wQrEHg5Pk0d7o1uD54JWHsRvCANmM Q==;
X-CSE-ConnectionGUID: /Qh0YqqZQoao21Ac5y/QHw==
X-CSE-MsgGUID: wUV62b3nTG+0d2hs+iWo+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11345"; a="39548140"
X-IronPort-AV: E=Sophos;i="6.13,286,1732608000"; d="scan'208";a="39548140"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 10:32:55 -0800
X-CSE-ConnectionGUID: zsosiEiNRKaT/LE9e8jS8Q==
X-CSE-MsgGUID: ktkU4/x/QqWmHshk0fxW3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="144453999"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Feb 2025 10:32:55 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 14 Feb 2025 10:32:54 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 14 Feb 2025 10:32:54 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.174)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 14 Feb 2025 10:32:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QvRe0xhhja2F1lNnvXpxJD3MPSR0sYAm+qhs5qNL/2PVV3keZKDY/ZHd4nRyufdLZ0hfqV2XHmKYqV9tCHIJ/TaRNAsLO1I4bL7LAgLydibhskvhBePg2TLfNpK4+4PsZigUcychlMeMr+P7ndqTKbHHESxRxqeDzLAxdLYOxqNMiXWeV0YVJWePgu0k6NNk8ZBzTQijM5RCvlCliMqZpLZTmcHgQb516Jgz+wl/MY0OEnFP5a40OzCAyA5uEpxYUthWjan9gT72QFDnNsZnd3AOdhdt2HoTpf0QjGIhzxW+RUiCghfmY9VhbehxpnLa5J2jP+DynDhKMQz+uEdhLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RUc2LOJ72ezOxh55uUVy2lVIbtZ48aETu37hsAP4/T4=;
 b=ULwyP1w3kLoXOWjHfJaulr2e0hz7RJNid4DGD18I8HJW7XBTEXbdCCMpvgnXSA1zDDNHAzKx5c8DgVMGn4UKPm4UjbJuIWZg6MBalodpIwwWlh8wsz+cKVZwnknLXvlljBDSrHL5tfaToPqTsWuE7meXItv0E9ODU0br1lR8ZkSDgG+Qx/3hOWLIxDCcC2d4LRa5EE6vOGI2UgZkhlQYpteHa+8fOVKOd7z13G1Mdl487U54enSjURbm4oVyoZUAR7HyOCoUzHRr/QL+7ic8W3v5OPN0NDNqoo35myJUr3iwAqzO6f5+AEAOuajDve+bA9oyexUZtI5ztaJtFLsv4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by CO1PR11MB5201.namprd11.prod.outlook.com (2603:10b6:303:95::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.17; Fri, 14 Feb
 2025 18:32:49 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525%5]) with mapi id 15.20.8445.008; Fri, 14 Feb 2025
 18:32:49 +0000
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
To: "Murthy, Arun R" <arun.r.murthy@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Syrjala, Ville" <ville.syrjala@intel.com>
Subject: RE: [PATCH v5 2/3] drm/plane: modify create_in_formats to accommodate
 async
Thread-Topic: [PATCH v5 2/3] drm/plane: modify create_in_formats to
 accommodate async
Thread-Index: AQHbfWvZsN+QiOEOkEOk1UUNnnpUjrNE/zAAgAIeATA=
Date: Fri, 14 Feb 2025 18:32:49 +0000
Message-ID: <SJ1PR11MB6129BB0D153591FE3CB494FDB9FE2@SJ1PR11MB6129.namprd11.prod.outlook.com>
References: <20250212-asyn-v5-0-dc182281dca3@intel.com>
 <20250212-asyn-v5-2-dc182281dca3@intel.com>
 <SJ1PR11MB61298FCBE2ACEAC1F10C444EB9FF2@SJ1PR11MB6129.namprd11.prod.outlook.com>
In-Reply-To: <SJ1PR11MB61298FCBE2ACEAC1F10C444EB9FF2@SJ1PR11MB6129.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6129:EE_|CO1PR11MB5201:EE_
x-ms-office365-filtering-correlation-id: 9e7f06f6-df6d-49b5-5230-08dd4d25fbf0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?utf-8?B?ZllKaG1XRGZvUHN4ZFFlNXFOYmxyb2cxNWFUdFFaSHdrNWE0U1RRTi83Z2d4?=
 =?utf-8?B?WC9PUFJ2SXg5RW1LdnJKS3lJMlNrSHBEdzFrZXVuYTN1NndNcTBwbC9MdDZM?=
 =?utf-8?B?aGRxYVMrb1Z0TkxxaVROS3pBMVNoYmJaRkx1T0dXTzAzTlFHczBodFBlNnEr?=
 =?utf-8?B?Tm9tQVI4SWNxbVpmdUpMSlpvdGs1V2grdkE4TnVRRnBJQ2N6dXNDakF4RXZ2?=
 =?utf-8?B?dlFHRW0wdzRnTTh3ZGJXdmFIT0czaFdyZ3pPYm95alBSOXNENm1wSCtmREZD?=
 =?utf-8?B?VWdybFYzUUhtbTY2QWFwOU1oanpvelRkTmVISnluQldNTG1xKzk3YzQzNDZk?=
 =?utf-8?B?Sy96clpHRVVYVjhLV0JqWFQzb2JwcExnRDFjVGRPZWxkRnhFUXdoQjJMdnR4?=
 =?utf-8?B?ZmJnZ0MrT0hObXIyWW9xYlVsWkl4UWtMZUYxVmFBcSt6OSsrTHkyZVppZUdE?=
 =?utf-8?B?RUhINUVrZkZieXZZSXpMRTZDR0FjNHFlSllDdnorcCtwVGwxTFRWRkNUeG9j?=
 =?utf-8?B?YkpGbk1MVFRUb1Rta1dtKzI2YkNzWE1Cdk01NkFrQ0NOTnJncjdQaWFMRHFq?=
 =?utf-8?B?ODJnK0RrL1FSdEo3T0RXdnZiTzVjKzl2SGVtQkRyY1ppR3J4ekw4Y1dCZXNX?=
 =?utf-8?B?U1RWWGJ4T0FyNm92VTRFYXpWaWRNQWZCZ1YyVmZDR2lZWGdJcGNSaDZJOHVu?=
 =?utf-8?B?bUJPMnhCTkZOL0dQUUZpMDBITVJ0N0lxRlVMTWV5OGR4QS9mcWFOcW1CTllQ?=
 =?utf-8?B?M1NPaGFkbkhNK0lDYzNtbUN5R3JUb0IySjd3a0psSXd0ME5pV3lPcTBZM3px?=
 =?utf-8?B?UGVlanZmdTBqMkN0bUJieW8vSkZqaHZaNldKTGRGUVhnOXhhbXdLWnV6enAz?=
 =?utf-8?B?c0NvVmRka29ycE9SV0pZUFBGUk5aVDJ4d1VDeWY0SG80TmlzUkNMS3FIZ24w?=
 =?utf-8?B?V2s3eU9EVThFWTduSS82OTlEOFoxalhHS3pRdHFBMHVBb3NVRWtUT05TeWVZ?=
 =?utf-8?B?cjVRUExrMWIwUmhNZnpSMmVJTm1rdzc0RHg3QUEzUi82K3E0VkRMMWtTbXQv?=
 =?utf-8?B?TExkVkRRMVNVU1RCV3dWMzRPYzlQRUJ4VUo3U1hWY2ErV0lhTkpTRjNQd0dk?=
 =?utf-8?B?ZjJaay9FYWdCYWw2K2hrOU5qeXpjVGc5TmZMWXdWS3UzcVN2eUthNEcrVlBp?=
 =?utf-8?B?cUE1MUV0L3dRMllmOVY0N3ZDTmplL3NuOTI3eU5ZSzNRVGtoWUlPSGJBWGhj?=
 =?utf-8?B?cmFxbGlDcEFlbC9NVUVabTdCLzdZQzdIWXZaQ09Ua2srVC9KVGp6dU5acmMz?=
 =?utf-8?B?eTMzRjdEVFVOc3JwS0h4YVdSRFpGNmdaZnN6ZnQrUWYzakNiZ3FXSHpLN1FE?=
 =?utf-8?B?MTlwS3kvb2dBMkdSVWlyanJCcmphZjVoeElFeC90cEpZak0wUHl2NEJHWlRi?=
 =?utf-8?B?VkJRcTUyU3QyZ3lIK25aOXJraVhGQ3FqMTA4cmRNb01mOFMzOGdGV1EwU05H?=
 =?utf-8?B?RS81LzB5K2lkaVRPbU9acUVFckRzblVjdkhTZXVDZTZJdWo1M1I1bXc2aVFL?=
 =?utf-8?B?WXpjUGEyRW9ZWmlhejZ1Q1REMnpFbjZNWkQvM3JwZnFqMFVFTFJVMVdVUXg1?=
 =?utf-8?B?WUhSa2VaR1dpbU5wQjFzSnkvZHd2dk55QkN2TDdYVm44Mk95dFJnSmJRMVc2?=
 =?utf-8?B?M25FbnNHaEVIRmQrVWgwY1ltaXE3Y0lUalpDMUwvMXJxaXhPa1ZSRzFvWHVT?=
 =?utf-8?B?TWFqYWZvL05jSG82ODBEYTQ0aUtXOFVabk55YmJYM3NPOWwxZGVvZU5SSHpT?=
 =?utf-8?B?cEx4UnNEUXJpeDFuTllROHpDQXBKZnB4Wjc4TE9pYnlqcW9DSzJPVDA4aWNk?=
 =?utf-8?B?MmNPRUJ2bmptTUJXRDhJcURDQThPbVJZWERFOGk5Wjllc0RmTm1ubFlUMTVQ?=
 =?utf-8?Q?ARR3DOD2bk2AzDLejI4ZF19qJ1LUihsF?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6129.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MGUxZzQ4dFN1RjQ5cmcxRVdZcmJZN2ZiQnBiY0p0UzMzV2FOQkZnSmdHbUZD?=
 =?utf-8?B?VG9aWEhtZVRiaTM2c2tKamJJeU1jZHRsb3htbEhXZVlyaHkzMVNCamhCUDBD?=
 =?utf-8?B?Wk5VSkc3SzNWRG9sSXlNa3g2ZGwrYWhvMFhzSkJsVFQwQnpNMkdYc2wwR2x6?=
 =?utf-8?B?bmY0L0ZpblRxSm1vdWZyMVU1N04rQVJSVTI4T0R6NjdmOWFoOE45ZDNNSEp6?=
 =?utf-8?B?bytjb0J3aVdhT0JFWG16cVNGYUwzQXdmdWhZNDFMMDJhQkhjVUgrOEtrL0Qr?=
 =?utf-8?B?eEppMUV6WTI2MmwzdGZRM0RTU01pNXZUTUsvTzROTUhmdm9tLzNNaS9SWjhQ?=
 =?utf-8?B?dm44TzBieTM0cjJVa1ZZcXNrN0xUaUZsaHVaT2JUcFh0WkZlUlByTG1uTkRK?=
 =?utf-8?B?TlhTbEh3aHIyakUwMmw1eCtuZlhBS3VqUzNpRGZFcE9CbTZMOGJTeS80UGcx?=
 =?utf-8?B?aXZGMnNhNHR6R1VWYjE4MkdEd3Y5ampkTjRXVVBab3R4V3lodHlYcFFGZGx3?=
 =?utf-8?B?YWdmdVlnc0xiK0trTER1ZndCdHVybVZCd2xMa21TSUlIWDdnSTBudzY0d0Jp?=
 =?utf-8?B?K1htU0lkYUpRR2F1TDNZYTJPb29FYjkwbUtodVZ0Y3liZHVvSGppYTRNK25L?=
 =?utf-8?B?UCtlK295NHUvbzloa1pNbDJIMjJ6Vi9KRGloeEFCUGpaNzA3cjNpR3dqajhW?=
 =?utf-8?B?VFBibitlRmVjUmwyeW5ob1dwL3VVd1JjYXBzTzFMWFFhVFNYR1kwVlJmV1Ji?=
 =?utf-8?B?YmJuZ055M2N2b2IyblFlNlBpbXdnSnhYRE5DVkFnV3JLVTlPNE5KZ2NlYUZh?=
 =?utf-8?B?WVJubncxQ0RsUUM0VVF2QlNiRHVOR1U4Tkp2SjNWUlRlV0wvWGQ3UDNiTVpM?=
 =?utf-8?B?c3gyUmlWcm03RmRBM1dpUENHSVFMZ0FLZDdQRjN0V1RBVGxVRkRKaXpleits?=
 =?utf-8?B?NGxOR2xiTDhGc2J5aUpRdGUwVHVGSERRbTl5TER6QitxcmExVlFhdWxVc2tr?=
 =?utf-8?B?VlR5RUl4SFpjeVYwRjliQXA3cnFwT3Noc1VyK1hxQmZXZ1ZzbFlFa0FESWky?=
 =?utf-8?B?SUFTa1FpK081MW9LTmxCa2JsajNFWEt5QkZiRXE2Zno0VWcwd0tkd0NROFFW?=
 =?utf-8?B?OTltOThVWEZTd0ZMY2VnZDdmOVpUdEpGbmV5QmFHZUZod0hhSTNpVUh1bmlt?=
 =?utf-8?B?NXBqUHFCeGdNZEJCM2ZIbGlWM3VBcTBpSk9lMFJnS1JaQ3MrM0VZcDdXVzgx?=
 =?utf-8?B?cEhQQkg5RVFJbnZ6aHp1UmZJNEM1dXVLUW14amR0WTNwSHloWURyR2ZWNHpU?=
 =?utf-8?B?VjU4QVRvbkJCTzdLWkVaQnh3ekFRekZEWnZZaWhnUy90bVN4YkpIOGJIVlpL?=
 =?utf-8?B?cUc2VzljZkkxaEd6dit2aGEzQnhPMEVZY0habVpYeklsc3BrMkY1TlBlbjRT?=
 =?utf-8?B?L2oxS2lUNldMQ1RpbmdFRWkrMjRqOVlwaFF3WmlKU2tYZlRodTNTRUgvNlli?=
 =?utf-8?B?MVZrVzdyS1R1aHhBcTZnVFJwdjFndmJieVhibFNEUkJsS25tOXNUQXRUZGsx?=
 =?utf-8?B?bEtZL2JzUnBqNTQ0WlY4YXAvRXdIcUV3UDArRzBmOFlZZjJMdzhWMklMaFpL?=
 =?utf-8?B?eVVEV0gxb0NrU29tZy9jdkxjT1p5bjVIL01VS3JnZDA5eTBmcjVvb1piTE1p?=
 =?utf-8?B?Rm5VaU15R0FIOG0wd1o3ZVZZdktrellidENPcVNwYi8vVkwxYXFuQTRLRUdz?=
 =?utf-8?B?NzZ2ZENNQ2JTcnZPR01FQ0hCL1NqWkx4RU1YUU1xQnE1YWkzOS8zUTUxbUVX?=
 =?utf-8?B?aFlaUGVEaElaVTVLRHZMRTA0TEFwSEl1cnkzSEpEeDJEZHVJb2ljYmFnWUZ6?=
 =?utf-8?B?ZURqRmxhWm9kVUlyT3doazhuZzE4NWx4YSszNUVzSVN5R2xOYnZZb0dKTDdl?=
 =?utf-8?B?S3Q1dW9CY3RESnhoZ1l5NEkyUTZKaFNkZVpFQUVVOXVvUG1hK1NTK0M1TFlL?=
 =?utf-8?B?VUo1dnhOdG1jQ2N0U3dhSmh0c1IwRE4xODU1NXBKVlM1Y1FtYXhValhoVWJD?=
 =?utf-8?B?dFBNUUpsOUxuU0dxdjlZZHUyR1R0bUorcmFTcTdWazBSQW41UDVvS1dKOGVV?=
 =?utf-8?B?U2JSaEQ0NG1WZlg4STNDeC9seE9vYUdhY29FdnhnV2I2UXI4S0ZNSVdaZlA3?=
 =?utf-8?B?a0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e7f06f6-df6d-49b5-5230-08dd4d25fbf0
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2025 18:32:49.1962 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nZN97j0Jy/iYIwVJmTMX0siVcceyp287NWxUy2Fcod9mzbtH84WrcJTboK9W/0koVWk5ElAOZobo2P4RQToqyxZs1unt7io1YpSZSr0vR4g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5201
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
YSBLdW1hcg0KPiBTZW50OiBUaHVyc2RheSwgRmVicnVhcnkgMTMsIDIwMjUgMzoyNiBQTQ0KPiBU
bzogTXVydGh5LCBBcnVuIFIgPGFydW4uci5tdXJ0aHlAaW50ZWwuY29tPjsgZHJpLQ0KPiBkZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGludGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7
IGludGVsLQ0KPiB4ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IFN5cmphbGEsIFZpbGxl
IDx2aWxsZS5zeXJqYWxhQGludGVsLmNvbT4NCj4gU3ViamVjdDogUkU6IFtQQVRDSCB2NSAyLzNd
IGRybS9wbGFuZTogbW9kaWZ5IGNyZWF0ZV9pbl9mb3JtYXRzIHRvDQo+IGFjY29tbW9kYXRlIGFz
eW5jDQo+IA0KPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gRnJvbTogTXVydGh5
LCBBcnVuIFIgPGFydW4uci5tdXJ0aHlAaW50ZWwuY29tPg0KPiA+IFNlbnQ6IFdlZG5lc2RheSwg
RmVicnVhcnkgMTIsIDIwMjUgOTo0OCBQTQ0KPiA+IFRvOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnOyBpbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOw0KPiA+IGludGVsLSB4
ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gPiBDYzogQm9yYWgsIENoYWl0YW55YSBLdW1hciA8
Y2hhaXRhbnlhLmt1bWFyLmJvcmFoQGludGVsLmNvbT47IFN5cmphbGEsDQo+ID4gVmlsbGUgPHZp
bGxlLnN5cmphbGFAaW50ZWwuY29tPjsgTXVydGh5LCBBcnVuIFINCj4gPiA8YXJ1bi5yLm11cnRo
eUBpbnRlbC5jb20+DQo+ID4gU3ViamVjdDogW1BBVENIIHY1IDIvM10gZHJtL3BsYW5lOiBtb2Rp
ZnkgY3JlYXRlX2luX2Zvcm1hdHMgdG8NCj4gPiBhY2NvbW1vZGF0ZSBhc3luYw0KPiA+DQo+ID4g
Y3JlYXRlX2luX2Zvcm1hdHMgY3JlYXRlcyB0aGUgbGlzdCBvZiBzdXBwb3J0ZWQgZm9ybWF0L21v
ZGlmaWVycyBmb3INCj4gPiBzeW5jaHJvbm91cyBmbGlwcywgbW9kaWZ5IHRoZSBzYW1lIGZ1bmN0
aW9uIHNvIGFzIHRvIHRha2UgdGhlDQo+ID4gZm9ybWF0X21vZF9zdXBwb3J0ZWQgYXMgYXJndW1l
bnQgYW5kIGNyZWF0ZSBsaXN0IG9mIGZvcm1hdC9tb2RpZmllcg0KPiA+IGZvciBhc3luYyBhcyB3
ZWxsLg0KPiA+DQo+ID4gdjU6IGNyZWF0ZV9pbl9mb3JtYXRzIGNhbiByZXR1cm4gLXZlIHZhbHVl
IGluIGZhaWx1cmUgY2FzZSwgY29ycmVjdA0KPiA+IHRoZSBpZiBjb25kaXRpb24gdG8gY2hlY2sg
dGhlIGNyZWF0aW9uIG9mIGJsb2IgPENoYWl0YW55YT4gRG9udCBhZGQNCj4gPiB0aGUgbW9kaWZp
ZXIgZm9yIHdoaWNoIG5vbmUgb2YgdGhlIGZvcm1hdHMgaXMgbm90IHN1cHBvcnRlZC4NCj4gPg0K
PiA+IFNpZ25lZC1vZmYtYnk6IEFydW4gUiBNdXJ0aHkgPGFydW4uci5tdXJ0aHlAaW50ZWwuY29t
Pg0KPiA+IC0tLQ0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX3BsYW5lLmMgfCA0Ng0KPiArKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKystLQ0KPiA+IC0tLS0tLS0tLS0NCj4gPiAgMSBm
aWxlIGNoYW5nZWQsIDM0IGluc2VydGlvbnMoKyksIDEyIGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fcGxhbmUuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9kcm1fcGxhbmUuYw0KPiA+IGluZGV4DQo+ID4NCj4gYzlkODg3MTQxNzcyMjE4NmQyYjZmODcx
OTdjOWUxNWE3MDkyNGI0Zi4uMDFmNjdmMWY1ZjI5ZTM3YjhkMGUwNzkzYw0KPiA+IDU4YmJlMWJi
YTMzN2ViMiAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3BsYW5lLmMNCj4g
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3BsYW5lLmMNCj4gPiBAQCAtMTkwLDkgKzE5MCwx
MiBAQCBtb2RpZmllcnNfcHRyKHN0cnVjdCBkcm1fZm9ybWF0X21vZGlmaWVyX2Jsb2INCj4gPiAq
YmxvYikNCj4gPiAgCXJldHVybiAoc3RydWN0IGRybV9mb3JtYXRfbW9kaWZpZXIgKikoKChjaGFy
ICopYmxvYikgKyBibG9iLQ0KPiA+ID5tb2RpZmllcnNfb2Zmc2V0KTsgIH0NCj4gPg0KPiA+IC1z
dGF0aWMgaW50IGNyZWF0ZV9pbl9mb3JtYXRfYmxvYihzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCBz
dHJ1Y3QNCj4gPiBkcm1fcGxhbmUNCj4gPiAqcGxhbmUpDQo+ID4gK3N0YXRpYyBpbnQgY3JlYXRl
X2luX2Zvcm1hdF9ibG9iKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHN0cnVjdA0KPiA+ICtkcm1f
cGxhbmUNCj4gPiAqcGxhbmUsDQo+ID4gKwkJCQkgYm9vbCAoKmZvcm1hdF9tb2Rfc3VwcG9ydGVk
KQ0KPiA+ICsJCQkJCQkoc3RydWN0IGRybV9wbGFuZSAqcGxhbmUsDQo+ID4gKwkJCQkJCSB1aW50
MzJfdCBmb3JtYXQsDQo+ID4gKwkJCQkJCSB1aW50NjRfdCBtb2RpZmllcikpDQo+ID4gIHsNCj4g
PiAtCWNvbnN0IHN0cnVjdCBkcm1fbW9kZV9jb25maWcgKmNvbmZpZyA9ICZkZXYtPm1vZGVfY29u
ZmlnOw0KPiA+ICAJc3RydWN0IGRybV9wcm9wZXJ0eV9ibG9iICpibG9iOw0KPiA+ICAJc3RydWN0
IGRybV9mb3JtYXRfbW9kaWZpZXIgKm1vZDsNCj4gPiAgCXNpemVfdCBibG9iX3NpemUsIGZvcm1h
dHNfc2l6ZSwgbW9kaWZpZXJzX3NpemU7IEBAIC0yMzQsMjQgKzIzNywyNg0KPiA+IEBAIHN0YXRp
YyBpbnQgY3JlYXRlX2luX2Zvcm1hdF9ibG9iKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHN0cnVj
dA0KPiA+IGRybV9wbGFuZSAqcGxhbmUNCj4gPiAgCW1vZCA9IG1vZGlmaWVyc19wdHIoYmxvYl9k
YXRhKTsNCj4gPiAgCWZvciAoaSA9IDA7IGkgPCBwbGFuZS0+bW9kaWZpZXJfY291bnQ7IGkrKykg
ew0KPiA+ICAJCWZvciAoaiA9IDA7IGogPCBwbGFuZS0+Zm9ybWF0X2NvdW50OyBqKyspIHsNCj4g
PiAtCQkJaWYgKCFwbGFuZS0+ZnVuY3MtPmZvcm1hdF9tb2Rfc3VwcG9ydGVkIHx8DQo+ID4gLQkJ
CSAgICBwbGFuZS0+ZnVuY3MtPmZvcm1hdF9tb2Rfc3VwcG9ydGVkKHBsYW5lLA0KPiA+IC0JCQkJ
CQkJICAgICAgIHBsYW5lLQ0KPiA+ID5mb3JtYXRfdHlwZXNbal0sDQo+ID4gLQkJCQkJCQkgICAg
ICAgcGxhbmUtDQo+ID4gPm1vZGlmaWVyc1tpXSkpIHsNCj4gPiArCQkJaWYgKCFmb3JtYXRfbW9k
X3N1cHBvcnRlZCB8fA0KPiA+IGZvcm1hdF9tb2Rfc3VwcG9ydGVkDQo+ID4gKwkJCQkJCQkocGxh
bmUsDQo+ID4gKwkJCQkJCQkgcGxhbmUtDQo+ID4gPmZvcm1hdF90eXBlc1tqXSwNCj4gPiArCQkJ
CQkJCSBwbGFuZS0+bW9kaWZpZXJzW2ldKSkNCj4gPiB7DQo+ID4gIAkJCQltb2QtPmZvcm1hdHMg
fD0gMVVMTCA8PCBqOw0KPiA+ICAJCQl9DQo+ID4gIAkJfQ0KPiA+DQo+ID4gKwkJaWYgKCFtb2Qt
PmZvcm1hdHMpIHsNCj4gPiArCQkJbW9kLT5tb2RpZmllciA9IDA7DQo+ID4gKwkJCWJsb2JfZGF0
YS0+Y291bnRfbW9kaWZpZXJzLS07DQo+ID4gKwkJCWNvbnRpbnVlOw0KPiA+ICsJCX0NCj4gDQo+
IEkgZG9uJ3QgdGhpbmsgY2hhbmdlIHdvcmtzLiAwIHJlcHJlc2VudHMgRFJNX0ZPUk1BVF9NT0Rf
TElORUFSLg0KDQpSZWxvb2tlZCBpbnRvIHRoZSBjb2RlLCB0aGlzIGNoYW5nZSB3aWxsIHByZXZl
bnQgIGFkZGluZyBtb2RpZmllcnMgd2hpY2ggZG8gbm90IGhhdmUgYW55IGZvcm1hdHMgc3VwcG9y
dGVkIGludG8gdGhlIG1vZGlmaWVyIGxpc3QuDQpTbyBpdCBpcyBjb3JyZWN0IGluIHRoYXQuIFNt
YXJ0IGlkZWEhDQpIb3dldmVyLCB0aGUgbGluZSBtb2QtPm1vZGlmaWVyID0gMCBpcyByZWR1bmRh
bnQuIEl0IHdpbGwganVzdCBnZXQgb3ZlcndyaXR0ZW4gYnkgdGhlIG5leHQgdmFsaWQgbW9kaWZp
ZXIuDQoNClJlZ2FyZHMNCg0KQ2hhaXRhbnlhDQoNCj4gDQo+ID4gIAkJbW9kLT5tb2RpZmllciA9
IHBsYW5lLT5tb2RpZmllcnNbaV07DQo+ID4gIAkJbW9kLT5vZmZzZXQgPSAwOw0KPiA+ICAJCW1v
ZC0+cGFkID0gMDsNCj4gPiAgCQltb2QrKzsNCj4gPiAgCX0NCj4gPg0KPiA+IC0JZHJtX29iamVj
dF9hdHRhY2hfcHJvcGVydHkoJnBsYW5lLT5iYXNlLCBjb25maWctDQo+ID4gPm1vZGlmaWVyc19w
cm9wZXJ0eSwNCj4gPiAtCQkJCSAgIGJsb2ItPmJhc2UuaWQpOw0KPiA+IC0NCj4gPiAtCXJldHVy
biAwOw0KPiA+ICsJcmV0dXJuIGJsb2ItPmJhc2UuaWQ7DQo+ID4gIH0NCj4gPg0KPiA+ICAvKioN
Cj4gPiBAQCAtMzY4LDYgKzM3Myw3IEBAIHN0YXRpYyBpbnQgX19kcm1fdW5pdmVyc2FsX3BsYW5l
X2luaXQoc3RydWN0DQo+ID4gZHJtX2RldmljZSAqZGV2LA0KPiA+ICAJfTsNCj4gPiAgCXVuc2ln
bmVkIGludCBmb3JtYXRfbW9kaWZpZXJfY291bnQgPSAwOw0KPiA+ICAJaW50IHJldDsNCj4gPiAr
CWludCBibG9iX2lkOw0KPiA+DQo+ID4gIAkvKiBwbGFuZSBpbmRleCBpcyB1c2VkIHdpdGggMzJi
aXQgYml0bWFza3MgKi8NCj4gPiAgCWlmIChXQVJOX09OKGNvbmZpZy0+bnVtX3RvdGFsX3BsYW5l
ID49IDMyKSkgQEAgLTQ3NCw4ICs0ODAsMjQNCj4gQEANCj4gPiBzdGF0aWMgaW50IF9fZHJtX3Vu
aXZlcnNhbF9wbGFuZV9pbml0KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsDQo+ID4gIAkJZHJtX3Bs
YW5lX2NyZWF0ZV9ob3RzcG90X3Byb3BlcnRpZXMocGxhbmUpOw0KPiA+ICAJfQ0KPiA+DQo+ID4g
LQlpZiAoZm9ybWF0X21vZGlmaWVyX2NvdW50KQ0KPiA+IC0JCWNyZWF0ZV9pbl9mb3JtYXRfYmxv
YihkZXYsIHBsYW5lKTsNCj4gPiArCWlmIChmb3JtYXRfbW9kaWZpZXJfY291bnQpIHsNCj4gPiAr
CQlibG9iX2lkID0gY3JlYXRlX2luX2Zvcm1hdF9ibG9iKGRldiwgcGxhbmUsDQo+ID4gKwkJCQkJ
CXBsYW5lLT5mdW5jcy0NCj4gPiA+Zm9ybWF0X21vZF9zdXBwb3J0ZWQpOw0KPiA+ICsJCWlmIChi
bG9iX2lkID4gMCkNCj4gPiArCQkJZHJtX29iamVjdF9hdHRhY2hfcHJvcGVydHkoJnBsYW5lLT5i
YXNlLA0KPiA+ICsJCQkJCQkgICBjb25maWctPm1vZGlmaWVyc19wcm9wZXJ0eSwNCj4gPiArCQkJ
CQkJICAgYmxvYl9pZCk7DQo+ID4gKwl9DQo+ID4gKw0KPiA+ICsJaWYgKHBsYW5lLT5mdW5jcy0+
Zm9ybWF0X21vZF9zdXBwb3J0ZWRfYXN5bmMpIHsNCj4gPiArCQlibG9iX2lkID0gY3JlYXRlX2lu
X2Zvcm1hdF9ibG9iKGRldiwgcGxhbmUsDQo+ID4gKwkJCQkJCXBsYW5lLT5mdW5jcy0NCj4gPiA+
Zm9ybWF0X21vZF9zdXBwb3J0ZWRfYXN5bmMpOw0KPiA+ICsJCWlmIChibG9iX2lkID4gMCkNCj4g
PiArCQkJZHJtX29iamVjdF9hdHRhY2hfcHJvcGVydHkoJnBsYW5lLT5iYXNlLA0KPiA+ICsJCQkJ
CQkgICBjb25maWctDQo+ID4gPmFzeW5jX21vZGlmaWVyc19wcm9wZXJ0eSwNCj4gPiArCQkJCQkJ
ICAgYmxvYl9pZCk7DQo+ID4gKwl9DQo+ID4gKw0KPiA+DQo+ID4gIAlyZXR1cm4gMDsNCj4gPiAg
fQ0KPiA+DQo+ID4gLS0NCj4gPiAyLjI1LjENCg0K
