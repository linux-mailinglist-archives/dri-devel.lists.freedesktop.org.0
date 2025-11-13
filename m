Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 928B3C5A015
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 21:47:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28B5110E1FE;
	Thu, 13 Nov 2025 20:47:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VhgXy7IX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67A2F10E1FE
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 20:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763066828; x=1794602828;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=dGXQtdp8pPBvx6deDRjB77GOrpM8HI8PZXEQez0yLxg=;
 b=VhgXy7IXR3yz3dpRMHTcGiUPhs/eDvwi1mrSmDWpHvcVClBdB0U+ovC0
 2gRsz/F7msfI8SX0WHR1BmJdXN3+b5DTEEI+2/Q1UVpzT3cVYYZMrMWmo
 xmmUtWGzcG10aS8OtcZQ8AwhMnOjOK442GzM+iiXB0iQPfKzh6wdgPKe2
 HLAS9unCr36pcCOi+QDjpLDQFnCTg5UoPJA8pw3daaTYuc3dqeXRzwE9g
 dcLapLxRtBTTJYVbj0AbWQcGLoB1rBMNettP//9a8AE0cc1UnKk0pw/rH
 tJc+Jm/rVeeMjONkfzQx6aqXQ+gXiv6fEcPNxlR9ieUQUuaFKm2N8hwTF w==;
X-CSE-ConnectionGUID: XErVPjMVS8iK7DoFid9vOw==
X-CSE-MsgGUID: acbR3QqJRJqFboXMCjhk2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="65088273"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="65088273"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 12:47:07 -0800
X-CSE-ConnectionGUID: FeegvYQwSdS2TkHBhiGZww==
X-CSE-MsgGUID: I8vgWgLaTia8ISOdwhGUQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; d="scan'208";a="194739192"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 12:47:06 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 13 Nov 2025 12:47:05 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 13 Nov 2025 12:47:05 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.25) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 13 Nov 2025 12:47:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bQmSzO5FaRzaHc71bESPtUxgsURtvayXmlk+v6Baqr8roxNV24nhHH/K59t+5Zws8zw8cO+54/KqXI//+dgocJxvL371BZVKPnZIBfeV/hSZwrsKiCYpeytqffmIjQMyDEaD5O4tJIIY63Lf9I33r2w1Upe2PR+LEcew59zc4xxc8HmoymPdGRlzjTp94NrJSBstzxFRPvttw2wNPyPrCPV9oHwQt0cOgEx41eGRzd7JPRMwykeeO0UxyaWlqN2yLXGgh1UQSs7E53HqyWphjYK7bxE4VQVgIrqCdOdtLc6/f54v/WXrk+etvgMxMA5R43lJykPN+C4WPtrdMct0aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dGXQtdp8pPBvx6deDRjB77GOrpM8HI8PZXEQez0yLxg=;
 b=cpmKCctBSsZggF7fncc7GIqNMiwCHcWbSwgP7mPa8e5kODhKEjRPIqtG5VD/ayvF4MuUrhUVc8GhB1hfEKP0R5GkOIXjkNo05p+RpTHBqZ+SI08oZouuSZiS1pBSPXV8Gr0RzE4jHk9wIXcBTT7Gx+P2XEjOJN1I9JgTm3vkbPEA0I8/ZUsIfJHYQyZkc+D+eqiqDnFSh4AXxvBAt7KRfS9E0DH4JQAG3LTbERgbR2FifJAy9cZ4zhMTricssEBUX0RAyGPoMvGm45smw6CN2qSqrHxVd/vtdtS63uVU3i0WZ0vhEqPvwk6CCvW8Z8Cf/78mhyy9+XWjjLbzFXx7WA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH0PR11MB5112.namprd11.prod.outlook.com (2603:10b6:510:3b::18)
 by SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Thu, 13 Nov
 2025 20:47:03 +0000
Received: from PH0PR11MB5112.namprd11.prod.outlook.com
 ([fe80::b6b7:41ec:7dc8:773]) by PH0PR11MB5112.namprd11.prod.outlook.com
 ([fe80::b6b7:41ec:7dc8:773%6]) with mapi id 15.20.9298.012; Thu, 13 Nov 2025
 20:47:03 +0000
From: "Kim, Dongwon" <dongwon.kim@intel.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: "airlied@redhat.com" <airlied@redhat.com>, "kraxel@redhat.com"
 <kraxel@redhat.com>, "nirmoyd@nvidia.com" <nirmoyd@nvidia.com>
Subject: RE: [PATCH v6 3/3] drm/virtio: Add PM notifier to restore objects
 after hibernation
Thread-Topic: [PATCH v6 3/3] drm/virtio: Add PM notifier to restore objects
 after hibernation
Thread-Index: AQHcU8OzUktLRH3oA0Sjzb9+ERz0crTu4sCAgAIvo2A=
Date: Thu, 13 Nov 2025 20:47:03 +0000
Message-ID: <PH0PR11MB5112533F30F495410F5E71AEFACDA@PH0PR11MB5112.namprd11.prod.outlook.com>
References: <20251027205323.491349-1-dongwon.kim@intel.com>
 <20251027205323.491349-4-dongwon.kim@intel.com>
 <90f9c416-05d6-45f4-8205-027fc36e88e0@collabora.com>
 <55556365-4c6e-450c-89aa-9c49ede53b00@collabora.com>
In-Reply-To: <55556365-4c6e-450c-89aa-9c49ede53b00@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB5112:EE_|SA1PR11MB6991:EE_
x-ms-office365-filtering-correlation-id: ef316cc4-05ff-44b5-5e8d-08de22f5cd1d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?ckNzYnFob2Z0L3VZOHJDcS9wbTkwWTRzbzFscUkrZTM4V2YrQ3BhbzVQVjFX?=
 =?utf-8?B?b2Z0eWlndVlvbktsNUxKdE5hV0x4c0RBT0o2dTIwWCt3TXRNUjFHSFE5WlJN?=
 =?utf-8?B?Sjk0OUlmb3VScGZuYTArclF3VEhYZnVyeHkzVm5OdUlQOVVXTTBXK1Vid0tu?=
 =?utf-8?B?aGFIcm9UTWZ6STgxWGg2YVdPNVdNS1RDcjJxdU1zcjhMeSs1ZWk2WG1uN05i?=
 =?utf-8?B?MkdLTDdWZE5HeWtEaFFXQmF6cnBXWVBkOTBrdU5SaG54S0poU29xSlRzYXU0?=
 =?utf-8?B?N1E0djJtRnNxYjZTcFBDazdUNktkS2h6eGVwcktpZldvampDL0RkcVZ3N0hs?=
 =?utf-8?B?WDUza2h1VW42U29hOEFWUlEzUlREWUIxUjc2U2NJNGtwaEdVZGpjSGxlZS9x?=
 =?utf-8?B?M2hkdUJISUNQdjFJdTNVWUJWQ2pUM2tZWmpmV0hjNXFybTJMb1Fjb0tQa3Y2?=
 =?utf-8?B?bE5aSFpwUHE5SjFHSHdNekVDR0txdnpWRmRmeWxkR3ZGSWNkczBnNFM2WkRJ?=
 =?utf-8?B?Z29nOEVDVktKcng1QnZOd3BFbE9ZaHBvVlZzVndsUDk3aFZBRzYxWkZvMXVT?=
 =?utf-8?B?UTF1T1dmaDBGWTQybGhpZWc5a0VqK1BPaTVRU0hmbHM3aU9NVm9mUG9lTVRv?=
 =?utf-8?B?VDZwMVVtb1VOb2lZL1ZoV0w5QzBtQUlsV1c2a0Zua1BJMURPcGZtUkwwb0pO?=
 =?utf-8?B?YmRWZ2VYb2l5UXY5QzY0WlRsdk1yK1NzMU1rWElsS2JmLzNlTkNEaEJvanVO?=
 =?utf-8?B?ZzUxb1BBemhKYVNhU2tjYnBnaXF1TTBLQlJrUW1hQUJpWUdlUnpkWlF0TjVv?=
 =?utf-8?B?WEZic2pKM1dRSHlwTFl6bFdUVDc3SjREcDE3WXpIb2pESWk2clBEN3BONkd2?=
 =?utf-8?B?WG9iY1NoT1lJRC9PL29zZVdtVnYrTGxQbmpaSEU4OGRiSjYvOFQrbVdDWDQ3?=
 =?utf-8?B?QWpQRU1iUUMzUFpjWThWWXFCdXA0c3pmOEdNQ3pkQ1FNTHE2T043czNpYVZs?=
 =?utf-8?B?bWNwSlR4M0tvU3MxV0Y2b3VNb09BWGFXMFl3bnlRdnRIVDNnMnpHWXNyKzRj?=
 =?utf-8?B?dXRZRXdRQTFLRVh6UFpsUHFjRHBtcm1Zd2daZHlNRnNYcjhtVjJ1QTMvUEVT?=
 =?utf-8?B?ZHRWRUZnTHV5N29hdW9FYlE4MHBzY2NHOVRUNjVqb0U4V2dPb3BBajVqck1h?=
 =?utf-8?B?N0c5Mjh3WjI5M3c0eEc4WHdJYzlqeU5sek1tYnJtWFdmZ3hNWG5kempIb3M5?=
 =?utf-8?B?d3Qrb3hRVDJwU25SMUw1cXVzaGphZVNkMUx1T3NCR1JWaGpRcUxuS2pFYWpX?=
 =?utf-8?B?cnpaQStlaUhhSkczQVdIWEczMW5FLzhKeXEyT045VUowbDNWMUFxdjJUME1D?=
 =?utf-8?B?ZHo3NGk2TEVBbFJYdklvYlVZcGRVbHNiazlGMUo3Y0RDenVySkpVd3BlOU50?=
 =?utf-8?B?SVZjMzkrQngyemNqY1FldXZ1Z01FbWNjZ254cDc2NkwrRUVMV1JRa05jQVY4?=
 =?utf-8?B?S0x5ZmQ2eTRXa1RHcWY3YTFyY3hRVktqSDZ5NSt5c0NyVUhrNUVJdWVJUEpS?=
 =?utf-8?B?S3ZyWEhRazVRMXlnU1Z4SXhwODUvR1JxY3pIZlYrNjNqUFcrd3AzUkxDeDZz?=
 =?utf-8?B?TU96dDlXM1pHcUcrN1lnb0xuNTdlMVNSdnd3M1NNR0ZESmYvdHVNQTZwZHpy?=
 =?utf-8?B?dklmK2Erb2t1c1VYUmF6elhMMFY2K2hwbFFrbFhCaHcwTVpEWDVxR0NQVkNE?=
 =?utf-8?B?MmJUTlhhU2dvcGF1ZGlBTjBGekhXYmltcDRvalo2QjZ2SzU4SkcxUWJXZi9v?=
 =?utf-8?B?NkxQOVJQN0toRXB3NFRnaHpwd01TL1FWY01kNVFDbzhNNTdaZzMybDV1bHUr?=
 =?utf-8?B?N2Z4blNTVnJWangrWGpGRnJsSDJBdmtXQVIxRGVKQmtMUDBlTlhTQTJqT0V2?=
 =?utf-8?B?UkxTclJDbGxMaXBuVWlHR2pMamlpMVNhS2ZyS01sWm5Jdm9ERHpkRE1lTHcv?=
 =?utf-8?B?UWFidUVEbEZQWDBOL3U5T0puVElNZksrNkdBMG5xcHE5OGV5RGt5OUhOMlV0?=
 =?utf-8?Q?0JGRLz?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5112.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cXR3cFpFNFVGSXFxdEZ2L0FXTzQ5VWd2VEVwbVZZTFRKSTJPakpVQnUyUEY3?=
 =?utf-8?B?N21wQW93Z0p4bG1STVNiN0xEbEVWbGpKRnd6dHVRcWVJRWdwV0JqUVl1b0Jk?=
 =?utf-8?B?aXV6ZXQyRkl4NmdWdkwvTlhvM1BwNDN1SVEyL0d5bnNnWVlzMEVSRENDaC9O?=
 =?utf-8?B?MjRkZ1RXZVVPQnhyMFRRTmZrbnpXeThzVnlGUFhIaGtGdGxVcWV6ZUxsOTJJ?=
 =?utf-8?B?ZExuUEV3WEsxdnh5QWZ1ZXhNSGl3bWd4VmlvVUcwOVBZSFpPV0Y4N2tsTUR2?=
 =?utf-8?B?Y3FFYkQ2Y0FBSzA0VGZsbllNWW0wdlJZdFhGblpGYVFkVVRoQUtwZ1hGcjV4?=
 =?utf-8?B?WHN6Q0lrZXAyd0dHZzNSUkUwaFI4cjV1bUVGYWNoZGxwbHhZM01XNXlMc0I1?=
 =?utf-8?B?U2ZaQjBhSThubUp2VXVJcGFxbHB1b1dRYVdSZDZ1a2drczFCRWRaZXdiRWFm?=
 =?utf-8?B?SGs2QldFbm5WeGFYVVJWcWVjWWhsUFNBVEJKVGZwQjhxTXVXeEhCcTdieHNC?=
 =?utf-8?B?MGNVVGJGQ0xXMHN0dmtxR1RObTdmSFJQNjlOck16Zk9HRDVCV0E2TUd1aWVi?=
 =?utf-8?B?OW55K1Bja3ZidkFPbkVQVS9NemhleEtzNDZiNEFjcSttU3FvK0NLSWJNUG9H?=
 =?utf-8?B?aXhzQmdMZ0RESGhSL1NvTzdYVjZtNStQaUJCVVBBckREL2tNci9MY2FFM3Nt?=
 =?utf-8?B?Ty9vQ0VSbWMzbHY5T1Q4R2U1WWhRNFBqdUllL1FDSkN4YldGVXRiMlIvT3I5?=
 =?utf-8?B?YzVrQzBNZHJ0TTFzTjAwYW1iV1paRW9nOXA1cUF2bFpPdEM3RXJiZnA3Q2Rj?=
 =?utf-8?B?c3hCSldqZU9TazNiTHR3bVZTYmQrTUdabUc4NHFJODVEVEVoa2ZVK2lyU2ZO?=
 =?utf-8?B?VXZLYUxpU05aUG1qYzQwL1Y2ZnVtdXB5VGthcFVoWWtXa1Vha1U0SElPZEhx?=
 =?utf-8?B?dVFubklHRW9yYndjdENmWndLd3lGRms4Ni9Yc0wrOEhPcUxVa1FBZm9lWFVC?=
 =?utf-8?B?WHBxeWMrVXo4OFRaaWVCUkNteTNQRzhsbTFUR2czTStXcU9VTmZhcDMwOHFw?=
 =?utf-8?B?UDVYZjRlSkMyWlhJOTVjV0M4dkVSU1ZYcDRFZHFab2lEK3hkRmp0VXJOb3V0?=
 =?utf-8?B?NjZmNFN1V3B0YUFSd3Eva1VWbTNNWWpDMlg4WGpnZS8yTGpzVDFwc2JyU1R0?=
 =?utf-8?B?UkJtcGFyOGVtU0JXQ1RIVHhhK2xmcDlINW4yWlZNWmsxc1M1NGZEMGpPOGhP?=
 =?utf-8?B?N2M5SUJZSS9jODFneG5Ia3NTTTNTVVlvWTd3anNqaVdPRDcwTHVIQkwzZXF6?=
 =?utf-8?B?N29oaWxzL3A0OFVTaEtJRGNRUlp2N1BVTnkzRmRwRlp2T2prNFA4UElGOGwv?=
 =?utf-8?B?UnZacmJST00zSmNGVitwNlNzdUVLblg3YVdjR0lpVU4wQzVIeTJKYUZIOUhX?=
 =?utf-8?B?QTdjUGxYc29KbE81bXoxOU9DcTJGUXVUb1haKzBFcmR0YVQxd0paMm0rWVZM?=
 =?utf-8?B?a1hLajIwZ3R5RXZacm1tcU5KL2o1dXNRSEFKUEgrYUowN1U4MFJMZ1JSbVZP?=
 =?utf-8?B?dU54NXBiZjN4cXgvUVVRdlN0bzZBSkVZZVpYTVZYRnI2V3E2dFdkTHQ0VnZr?=
 =?utf-8?B?ZHpicnlrR2tFRWN4dy9nRFhqMXc2WStwT0xQZFIwdFZBK1NMUlZ3M1Rqc3NM?=
 =?utf-8?B?ZEI0SjdxNUpHSHRSNE1jY2JTZUwvd2Jrb2RKVm02SXAvWGdvVGR4N3ZnUjJK?=
 =?utf-8?B?OFBkcGxpZDJkTzBRV3JnVVh4VVM4dlpjNDZNdWpKU002Rzd6S2VNYThZZ2lL?=
 =?utf-8?B?Qnk1NGNhcmtEY3JHZjluZGNuSFVCeGZSWXM5T0lDMWZ5S1B5d2FYRWJsNUJq?=
 =?utf-8?B?eEhnTElLcHJ3dnl5Wi9KSXZVMFdNeXdUWDYyeFhwd3VHeTNPYWx4L2phYUI0?=
 =?utf-8?B?Vmw1RExVYThWY0hUcm5RekZrTWE3RHpGK1lXR3ljRGxHZXlTZzBiWmF4dnRo?=
 =?utf-8?B?bVozY2VkQWRLSDFCeUtrT0xzMWVKeUxUNkhYbFpWa3dLa28zNDZFcDNXWm85?=
 =?utf-8?B?SkREaWxPWGFKOFh1Qlo3U2NJYW5DdzIrdVp4cnlDVzVmamk1MXZaaU83K0xI?=
 =?utf-8?Q?xq86rsHw0wBEONhAVYr3GSIy5?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5112.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef316cc4-05ff-44b5-5e8d-08de22f5cd1d
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2025 20:47:03.6244 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SRbWECoufgz6HbGVjTj+fyyxUZo+a73FwQMCLbUKQ/XADxWrFbHy58AuWKsgp7gUWURk4Y0aTf1/hrzKBuKVgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6991
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

SGkgRG1pdHJ5LA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IERtaXRy
eSBPc2lwZW5rbyA8ZG1pdHJ5Lm9zaXBlbmtvQGNvbGxhYm9yYS5jb20+DQo+IFNlbnQ6IFdlZG5l
c2RheSwgTm92ZW1iZXIgMTIsIDIwMjUgMzoxMiBBTQ0KPiBUbzogS2ltLCBEb25nd29uIDxkb25n
d29uLmtpbUBpbnRlbC5jb20+OyBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENj
OiBhaXJsaWVkQHJlZGhhdC5jb207IGtyYXhlbEByZWRoYXQuY29tOyBuaXJtb3lkQG52aWRpYS5j
b20NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NiAzLzNdIGRybS92aXJ0aW86IEFkZCBQTSBub3Rp
ZmllciB0byByZXN0b3JlIG9iamVjdHMgYWZ0ZXINCj4gaGliZXJuYXRpb24NCj4gDQo+IE9uIDEx
LzEyLzI1IDE0OjAxLCBEbWl0cnkgT3NpcGVua28gd3JvdGU6DQo+ID4gT24gMTAvMjcvMjUgMjM6
NTMsIGRvbmd3b24ua2ltQGludGVsLmNvbSB3cm90ZToNCj4gPj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9kcnYuYw0KPiA+PiBiL2RyaXZlcnMvZ3B1L2RybS92
aXJ0aW8vdmlydGdwdV9kcnYuYw0KPiA+PiBpbmRleCA2NzY4OTNlOTBhOWYuLjVmZjc5ZTM3NzVl
OCAxMDA2NDQNCj4gPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X2Rydi5j
DQo+ID4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9kcnYuYw0KPiA+PiBA
QCAtMjA3LDYgKzIwNywxNSBAQCBzdGF0aWMgaW50IHZpcnRncHVfcmVzdG9yZShzdHJ1Y3Qgdmly
dGlvX2RldmljZQ0KPiA+PiAqdmRldikNCj4gPj4NCj4gPj4gIAl2aXJ0aW9fZGV2aWNlX3JlYWR5
KHZkZXYpOw0KPiA+Pg0KPiA+PiArCWlmICh2Z2Rldi0+aGliZXJuYXRpb24pIHsNCj4gPj4gKwkJ
dmdkZXYtPmhpYmVybmF0aW9uID0gZmFsc2U7DQo+ID4+ICsJCWVycm9yID0gdmlydGlvX2dwdV9v
YmplY3RfcmVzdG9yZV9hbGwodmdkZXYpOw0KPiA+PiArCQlpZiAoZXJyb3IpIHsNCj4gPj4gKwkJ
CURSTV9FUlJPUigiRmFpbGVkIHRvIHJlY292ZXIgdmlydGlvLWdwdSBvYmplY3RzXG4iKTsNCj4g
Pj4gKwkJCXJldHVybiBlcnJvcjsNCj4gPj4gKwkJfQ0KPiA+PiArCX0NCj4gPg0KPiA+IFdoYXQg
aWYgaGliZXJuYXRpb24gd2FzIGFib3J0ZWQgYW5kIGRpZG4ndCBoYXBwZW4/IEluIHRoYXQgY2Fz
ZQ0KPiA+IHJlc3RvcmluZyBvZiBvYmplY3RzIHdpbGwgZmFpbC4gUGxlYXNlIGludmVzdGlnYXRl
IGhvdyB0byBoYW5kbGUNCj4gPiBhYm9ydGVkIGhpYmVybmF0aW9uIHByb3Blcmx5Lg0KPiANCj4g
T25lIG9wdGlvbiBjb3VsZCBiZSB0byBleHBsaWNpdGx5IGRlc3Ryb3kgYWxsIHN0b3JlZCBvYmpz
IHVwb24gaGliZXJuYXRpb24sIHRoYXQNCj4gd2F5IHRoZSByZXN0b3Jpbmcgd2lsbCBhbHdheXMg
d29yay4NCg0KWWVzLCB3ZSBjYW4gZG8gaXQgdG8gYXZvaWQgdGhhdCBjb3JuZXIgY2FzZS4gT3Ig
bWF5YmUgd2UgY2FuIGp1c3QgbGV0IGl0IGp1c3QgcnVuLg0KSW4gdGhpcyBjYXNlLCB2aXJ0aW9f
Z3B1X29iamVjdF9yZXN0b3JlX2FsbCB3b24ndCBmYWlsIGFzIHNobWVtIGluaXQgd2lsbCBzdGls
bCB3b3JrDQpidXQgUUVNVSB3aWxsIGp1c3RzZW5kIGJhY2sgZXJyb3JlZCByZXBsaWVzIGFzIGFs
bCBvZiB0aG9zZSByZXNvdXJjZXMgZm9yIEJPcyBhcmUNCnN0aWxsIHRoZXJlIGluIFFFTVUgc2lk
ZSBidXQgSSB0aGluayBpdCB3b24ndCBicmVhayBhbnl0aGluZy4gRG8geW91IHNlZSBhbnkgaXNz
dWVzIGluDQpkb2luZyB0aGlzIHRoYXQgSSBtaWdodCBiZSBtaXNzaW5nPz8gTXkgYXNzdW1wdGlv
biBoZXJlIGlzIHRoYXQgdGhlIFFFTVUgaGFzbid0DQpkb25lIGFueSBvZiB2aXJ0aW8tZ3B1IHJl
c2V0cyBoZXJlIGFzIGhpYmVybmF0aW9uIGZhaWxlZC4NCg0KPiANCj4gLS0NCj4gQmVzdCByZWdh
cmRzLA0KPiBEbWl0cnkNCg0KVGhhbmtzIQ0K
