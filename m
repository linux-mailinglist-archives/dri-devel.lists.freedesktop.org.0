Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1993D9D340D
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2024 08:17:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2856B10E156;
	Wed, 20 Nov 2024 07:17:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H2cx54jQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E88B10E00F;
 Wed, 20 Nov 2024 07:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732087072; x=1763623072;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=CtQIISHQXXnJU/CvWbxwefxqH2/E4/LKbcRUkdR0J0g=;
 b=H2cx54jQq2iXEBoBVV7QWqisrLav1Y2VlFZJAKwgvnCM4rDZsbW6qFpg
 54nhciPBTl0oFCQiE6J8XOF4bNPGMtTZOSwXUDaEVdtX5KM2oeeC0cMgC
 ZP8sfQcD8jzeQ/9rf/aIa8akq6ud5CEgF9lYoKcwhVr6quzLySCLhZ3VO
 s1KpLG/tgM4OLhdxfZO3VZnx+YPFa8EFrzW1EAwyqoya4YC6T4Ox9Qf7o
 fkjNRwUGtZXpmHHIGbNp2Zb38SUyef0mydJX3EgM61rQbZwnFubEstzTu
 GQWltWbQ/YX6b8mqFRPbPIGxeJK7P1tkVBNV5dP3bRXxWHVJb796SGAd1 w==;
X-CSE-ConnectionGUID: uWxoh+BrRfOEVPO2JlCiiQ==
X-CSE-MsgGUID: GIBLc4K8Q1Sk8Ay40C/spQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11261"; a="32264472"
X-IronPort-AV: E=Sophos;i="6.12,169,1728975600"; d="scan'208";a="32264472"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2024 23:17:50 -0800
X-CSE-ConnectionGUID: IlOy+alISeqIsOE7dxYslQ==
X-CSE-MsgGUID: Y615PioCQbatMMVSRWY6Tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,169,1728975600"; d="scan'208";a="93886214"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Nov 2024 23:17:51 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 19 Nov 2024 23:17:50 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 19 Nov 2024 23:17:50 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.43) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 19 Nov 2024 23:17:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uKr7F5NZNQZTeX9rpYCFk0OBlluzclmkjbHwVd2/D5fyXg9rqo4jjpgfotY1Mkl6ufT2ulmgvK4c/mab9MB+OUOHW5wZzQvcbwuNOfK46TgwVppwjgXEHuz/uKgVjp0i8BevA5g60tKbvcDQ4pO/CefYfSsciZlXaGNzhJ82Aj3Np7wZTh/iRyJMHYKYfV/xem/mn1ZjRRO7ISQx7pcvzv2yYvJhxh6DpHLv/COsIAyQflh0QhBs//M1/IrkV78dW3RivqHFnB6PpTtkGVgVCFJFvYMf5DihISFWr3kNTFqAeqFMC9giHkZBpw+YsT881u44Bta2+YyOqj9xOzoagQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CtQIISHQXXnJU/CvWbxwefxqH2/E4/LKbcRUkdR0J0g=;
 b=RhyEnrS2jrq2Ng/kNmIGPg4XpNaOvP1B/JADKF+rIjUfpH6aEtmWjwIgsowSz9gtRpQgm7wYKesrlGu+IPBbXpNWhrW/7o1w7tI3uqzsit95xEu2Ukq07sl2zJEYM5SuEvVlGSHdn8xr3JRVaHHzJtMr7CdZEy6BI72eXC9JYlVMWQ1/vZRWwenyuRSX7BuHTm0NGT88IbmV5mLltXdN/q6TDc1QLWOxLCEJAF06Akzq8TMgq1yhcQjYoPL41gOzbZ5UgfJHgVmRAnR3PWQlOBWiW4DFMdY+jsuzF3ccpMPK+zNzbKsxbt5kqDAve4B1j0lA+F5HXGHUSgr94A1yxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB6750.namprd11.prod.outlook.com (2603:10b6:806:266::21)
 by MW3PR11MB4570.namprd11.prod.outlook.com (2603:10b6:303:5f::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.23; Wed, 20 Nov
 2024 07:17:47 +0000
Received: from SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527]) by SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527%3]) with mapi id 15.20.8158.021; Wed, 20 Nov 2024
 07:17:47 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Murthy, Arun R" <arun.r.murthy@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: "Murthy, Arun R" <arun.r.murthy@intel.com>
Subject: RE: [PATCHv2 1/8] drm/i915/histogram: Define registers for histogram
Thread-Topic: [PATCHv2 1/8] drm/i915/histogram: Define registers for histogram
Thread-Index: AQHbOnGFWCWKAhh7kEeZGI+xEcwY0rK/wyTw
Date: Wed, 20 Nov 2024 07:17:47 +0000
Message-ID: <SN7PR11MB675012E008B4FF09E1D2F59BE3212@SN7PR11MB6750.namprd11.prod.outlook.com>
References: <20241119104521.575377-1-arun.r.murthy@intel.com>
 <20241119104521.575377-2-arun.r.murthy@intel.com>
In-Reply-To: <20241119104521.575377-2-arun.r.murthy@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB6750:EE_|MW3PR11MB4570:EE_
x-ms-office365-filtering-correlation-id: d48f4378-edf0-40c9-a4c3-08dd09336f6d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?utf-8?B?VjhURjRneElGRXBMdWlMc0padS94cktoRkpVU1ZtQXlZTTFPcmlLbng5cGtO?=
 =?utf-8?B?eWkwZGZ0SDdJM1crcjVmc1ZYZStWZ3lWaVR2ejFKc2xWVDNvT21DbTlmL215?=
 =?utf-8?B?MVc1Z21Tall4OWtCWUppMVR1Mnk4Q1ZvSXdXNUlUSFVOemlIUGl2aStwM0xu?=
 =?utf-8?B?ejdhcjl0Skl6Q0s2dUV4eEJVdWpWTzNKeTJHcVFFZWlpZkRVUnVZbXNMVTY0?=
 =?utf-8?B?NmdQNnRKR0NuN3NUQ1NBMHpIRG5ieWhCOFhBaUNJeXNqNjdLMU8yRm9QU21E?=
 =?utf-8?B?RWNKdTZ6dDNIM0ZNT0NhdDFaRExZV05Tc1JmVlhLNmtRZlJXSitzaUlCTXVM?=
 =?utf-8?B?QysxMXF2ZmVwZllQb3llK3dqUG82QTU0MTlRV211ZExIQlZaMkZ5SmlrQlRD?=
 =?utf-8?B?K3NrUzdsc2ZaUzRnM2lJVXlLZ2lxS3RlYzBxUWtNcDNuNXoxcGZMZjhRLzN1?=
 =?utf-8?B?Y2pCVWRHNWJ6RjdBTFFDTHI5cEFjNm1ja3B4b1ZHOHN5ZFB2NDFaejBvdyts?=
 =?utf-8?B?d2wvY0YzZmxCVGtsMmhoVzNpdVFRRzZ4STl4QnlKeGh4YlZSVDBsblU3YW1p?=
 =?utf-8?B?eTNpNFN3NjVuZVJ0Vk84bHlVWWtTL2JPZnVING1KcjIwQktkeVJaMDJSNnVj?=
 =?utf-8?B?VnJLS1NpRXVPNTB4RldTeHBjejNwMFQwblhpZittMTFFR0FHMklvdjVKV1Bh?=
 =?utf-8?B?NyswZHRBRFF1c1J4MkQyYXpTNStDbHhia0g3TVJpWFlreERzOFJZbThiNFJv?=
 =?utf-8?B?OUZ6Q3B1Wlc2MkVBNkRsK2d1UjV6L25SYjJPTHgxd1JiUFdpTlZCN2JkaEZy?=
 =?utf-8?B?eHdady9FaTBiZW1DcVV0YzFjRDA2dG1CbDZCOEt6VUgyNmpwVWMxVjk1b1lh?=
 =?utf-8?B?djBtNHgxYSthakJvbDBFaTJ6ejNIVlJmd2s0S3dpTXZsaG1qN2RTRXByWVE0?=
 =?utf-8?B?UXBTRHlPbmxnbU4yam80cDBoN0VFM2xRQnpZNDkyaGtQMGVqY0g2bmlhYUxK?=
 =?utf-8?B?Sm1pMUluWFZDbTZ6TW40cEFvVmFPVzYxcjRNbTBQTndFRnBwZEdWWitnTFUy?=
 =?utf-8?B?U3grWG0wei9QNS9DMXQ5VzcxVUVLeVRSaHlvY1FvNEs3cFU5UFFCcGNZbXZt?=
 =?utf-8?B?RFdYalVOdStWSDZWK0Voa2s2SDNaTk93RTk2VUxJTzVjTC9PaStDOHNHQmhq?=
 =?utf-8?B?TDViNHJSdDdDOStHcTdXdVR6dDUxbnhaRHc1YWJubkpOM2V0NGJGRm1DOHI3?=
 =?utf-8?B?TU8zeGVISnRhTEMwbW5vWEE0TXFTbUl1SlU4cWtvUnM3bUVQUVdiS3puaGUw?=
 =?utf-8?B?UjRyNFNOdFJkOC81anM5OE5LNXZrdXlTNC9hbVdwaWRlZWFhSmo1UnJrbDNC?=
 =?utf-8?B?S3hQRHdiZml1V1N1d2ZDZ0VpU1I3YjJ1MWJoUUtqdDY3bW1VdUlXa2wzWXda?=
 =?utf-8?B?NzVEcVZhN2xJOE16ZFp2emk3N0lFQlJSYTQrSG1UcVlKbWt4RGxGc0hqYTR3?=
 =?utf-8?B?NlBBOTMxNHZQR3hMUEpqWmNwTmMreEx5T2laeVBWeXFRNW9YQ2hKMHNVMm5G?=
 =?utf-8?B?U25mcS92UWppUWRGSFVBSGNQYUl3V29SMU85T3V3MTVMT283N2U5d0JnbWlh?=
 =?utf-8?B?RCtzT0FUYU1Oa2VrKzNOQ3RyT3VVcVlPV1pjZ0FQQll3VmI1MG9uYTFHNWpi?=
 =?utf-8?B?amVKOTl0THVWaitRb2FDNmhRbnI3cjNiUmlnazhrbTlRZ1JzZll1ekxrNlJq?=
 =?utf-8?B?SlJhZkc1T3pUOTZuOFhnVEZQdnJ0VmV0TEVFNHBldk0xTmxUYTBRTlZlWkRY?=
 =?utf-8?Q?fI7yUHqq5SvH1+6MESWMhFenU8rEfsqTPGzto=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB6750.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dlJ4eTdweGl0TjQ2WjU4RHdhTFRjUFFpS3ZuZ0IzODQ1akdCalkrVHJwdFZv?=
 =?utf-8?B?WmJXa2I5Qm5veHdiRlRrRk5GcjBTK3Q0enBaOFZhOVBiT0dIWEZkdmtnWEFI?=
 =?utf-8?B?ak0xRlN5OGxLRk5teTdJd1NCWUxzdzRnTVh5YS9XSzIxbEJZaTIwcjQzS0Fu?=
 =?utf-8?B?bC9sbEhmaWxDc0JDK3hJaG5qbWxpdTJyalFjWnhiUlpVRzIvNDZWdnVqTm5h?=
 =?utf-8?B?OHcyZXNuaVd1SHJZYisrUUZNbjl5U1h4N2IzMjJFK0VtelloNkpialFFSGpK?=
 =?utf-8?B?c2pmR2tLaVlMRlBjMnhLNElOMUNJWkh0OHpJV3NPWVhDZDdoNDdRWlRuZnl2?=
 =?utf-8?B?a1g5cnkyRzgxdjBMZHhiamNheGw0UUc5NVRnLzM5RXg3U2lvVE1WZjREd3dE?=
 =?utf-8?B?M0paV2pja1haMzIvWHhiVE1wMm9tb2piQXdWV2FwWHJxQVNLWFJhbFRGaXRM?=
 =?utf-8?B?WlpHTW5rOWRzSkJMRWFDZzNrZTB1UENuRkNMVGtMSGNOT1NzL21VQURFMUZ4?=
 =?utf-8?B?SFNLNW8yZXhLczViQS9Ncko0V0EvMnRnVW1KYjBzQUdmbXJsZUlQSzU4MXRv?=
 =?utf-8?B?Uy9sUHN3aDUwMm1RUlJKZ2M0THdBWnVSYmR5SEc3RnJtVUsycElibTQrNGdw?=
 =?utf-8?B?K2QySE5FYVN4TW85L21SR1ZTbzIwb04wZVAycXFSUlp5VmVWMEdQbGJjNTdj?=
 =?utf-8?B?OFBVUUpvUWJkdXcyS3BjRjBjZFN1S1BCN1o0ell0MjJMcmRMMFZkVkkvMFJF?=
 =?utf-8?B?N001d3k4c2U2UGVwRmVvVTAwZEhaN3BXMy9XVUV4M1laYnpFYTczQ2FFOTFH?=
 =?utf-8?B?azEzTG9EZ28wWXI5cEpSTlBPWUE0M0d5N0VJM00rNjVmazYva3B5eVQ4cmpt?=
 =?utf-8?B?azhrSTU2eXdIcDdnT2tObjNXTTRoU3RRT21HK2liZjJJMXhRNUhZYit1T0N0?=
 =?utf-8?B?U01JRVphSEViTUxoNFcrcmJRNWFpRG9TTzVXa2ZYZW05bmF2UFB6NG1CZS8z?=
 =?utf-8?B?eWhPd3dlSHVHU1dJRGIvNm5PeFhzazBBMlhWUUtnWlhrWWZabWFCM0dTeU1C?=
 =?utf-8?B?ZmdvREd3QlB4MzhwZHZOSE5uellPQ2N2Sm5Iakh2WlpqdStBSDRIUDhJdis2?=
 =?utf-8?B?QWFOVkd6UC9scGVJN0VQcW4yMmhJVE9qeWp0S2JVVStha2JRTE96eTE0RHc5?=
 =?utf-8?B?SDh3ejhaSkpjNW5QRTNSNkE2OFlHaEpieThpTEtiaXNGRndUQnJFbGQ5RmR5?=
 =?utf-8?B?amFGQzBLcWFTRDEzYTI3R0U5dUlnVC9lazJBRjc3NExrblpWOWJwaHJLS0tj?=
 =?utf-8?B?MWtGdS9ZdVJWK3FaaS8xUFZXN296SVZ1eTBGUENKREd2SldzdnVDdklPK0Z2?=
 =?utf-8?B?dE1mWENtc2RxR3dJVHQ5T3YxbkVIVUc0NHB6UUZWYXY4N0VURlB2US85MjBq?=
 =?utf-8?B?ekZaYmlmMEMwTFNNV3FBVlN6ZDlycFBIUDMxNUxCYnRUUklndXZ3UCt0Vk1F?=
 =?utf-8?B?TXFtOTAyRGFzcU5Bd2duNHBIZ2lHL1hVK1BTSVFGS3RPZThXZnRjQkpQSUtM?=
 =?utf-8?B?c0VKVmV5UHI5WHVFV0QxNGtPUDVKUmFaV3Ywd0pxV1dQWlc1RXBJdmRiZW94?=
 =?utf-8?B?NGZCc2RWazNrb2kzTjZ6Z0VZSDlvTi9XOWU1ek44WGFjT2JJd3ROWVJrbHh5?=
 =?utf-8?B?VnhWbEREVHUrM3hrc1hmOW95MHNORFgxQVRvL3FKYzVubll6a2ErdWhpNks0?=
 =?utf-8?B?ckJkTWlOYlRwQXpLeGI2SHFvaGxSZW4vczFjcjcvVUU5WkkzVjZzU3NJNEtv?=
 =?utf-8?B?UzNMUlAxWHNxRmxYMnNsR1k4M09waHpGRUJiK0swSitqdGFzcmpKOG4rMVVk?=
 =?utf-8?B?YmNmTWRBUGFLM2dLeW1sYUQ3MXVQajF3YTMybTBFVnU3Zkc2VHVLUkVTZG9a?=
 =?utf-8?B?cGd0QjZhaUFPZHlUbmVhV1dNUFpqTUJGYjZGQ1pOWWJNQnJuK3FVNCt1bGxp?=
 =?utf-8?B?ZllrQjZpOEg1THRaQjhuNi9USHdPWnB4UkQyc2Z5UGVQVlIybWwySXlsMHlv?=
 =?utf-8?B?ZDBMbzlqWjB3NlRVUWlwZ3UvMFhoajNCd1lVcmFnOWR1T1NYOFplc0ZkSEla?=
 =?utf-8?Q?YzYHBme6Ksml4NzvMp2RDf6yC?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6750.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d48f4378-edf0-40c9-a4c3-08dd09336f6d
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2024 07:17:47.3656 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g3a+ifHQ74YZ1wgVMwd/3G/vE5HSt16JO+D9yNWTAEBbvNP6DdLJKP3ofQX3DpDwpjUP+jPR5WeF44gP8r4gEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4570
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSW50ZWwteGUgPGludGVs
LXhlLWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgQXJ1biBSDQo+
IE11cnRoeQ0KPiBTZW50OiBUdWVzZGF5LCBOb3ZlbWJlciAxOSwgMjAyNCA0OjE1IFBNDQo+IFRv
OiBpbnRlbC14ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGludGVsLWdmeEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmc7IGRyaS0NCj4gZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBNdXJ0
aHksIEFydW4gUiA8YXJ1bi5yLm11cnRoeUBpbnRlbC5jb20+DQo+IFN1YmplY3Q6IFtQQVRDSHYy
IDEvOF0gZHJtL2k5MTUvaGlzdG9ncmFtOiBEZWZpbmUgcmVnaXN0ZXJzIGZvciBoaXN0b2dyYW0N
Cj4gDQo+IEFkZCB0aGUgcmVnaXN0ZXIvYml0IGRlZmluaXRpb25zIGZvciBnbG9iYWwgaGlzdG9n
cmFtLg0KPiANCj4gdjI6IEludGVuZGVkIHRoZSByZWdpc3RlciBjb250ZW50cywgcmVtb3ZlZCB1
bnVzZWQgcmVncyAoSmFuaSkNCg0KQWRkaW5nIEJwc2VjIHJlZmVyZW5jZXMgZm9yIHJlZ2lzdGVy
IGRlZmluaXRpb25zIHdvdWxkIGhlbHAgDQpPdGhlciB0aGFuIHRoYXQgTEdUTSwNClJldmlld2Vk
LWJ5OiBTdXJhaiBLYW5kcGFsIDxzdXJhai5rYW5kcGFsQGludGVsLmNvbT4NCg0KPiANCj4gU2ln
bmVkLW9mZi1ieTogQXJ1biBSIE11cnRoeSA8YXJ1bi5yLm11cnRoeUBpbnRlbC5jb20+DQo+IC0t
LQ0KPiAgLi4uL2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfaGlzdG9ncmFtX3JlZ3MuaCAgIHwgNDgg
KysrKysrKysrKysrKysrKysrKw0KPiAgMSBmaWxlIGNoYW5nZWQsIDQ4IGluc2VydGlvbnMoKykN
Cj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVs
X2hpc3RvZ3JhbV9yZWdzLmgNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkx
NS9kaXNwbGF5L2ludGVsX2hpc3RvZ3JhbV9yZWdzLmgNCj4gYi9kcml2ZXJzL2dwdS9kcm0vaTkx
NS9kaXNwbGF5L2ludGVsX2hpc3RvZ3JhbV9yZWdzLmgNCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQN
Cj4gaW5kZXggMDAwMDAwMDAwMDAwLi4xMjUyYjRmMzM5YTYNCj4gLS0tIC9kZXYvbnVsbA0KPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2hpc3RvZ3JhbV9yZWdzLmgN
Cj4gQEAgLTAsMCArMSw0OCBAQA0KPiArLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IE1JVA0K
PiArLyoNCj4gKyAqIENvcHlyaWdodCDCqSAyMDI0IEludGVsIENvcnBvcmF0aW9uDQo+ICsgKi8N
Cj4gKw0KPiArI2lmbmRlZiBfX0lOVEVMX0hJU1RPR1JBTV9SRUdTX0hfXw0KPiArI2RlZmluZSBf
X0lOVEVMX0hJU1RPR1JBTV9SRUdTX0hfXw0KPiArDQo+ICsjaW5jbHVkZSAiaW50ZWxfZGlzcGxh
eV9yZWdfZGVmcy5oIg0KPiArDQo+ICsvKiBHTE9CQUxfSElTVCByZWxhdGVkIHJlZ2lzdGVycyAq
Lw0KPiArI2RlZmluZSBfRFBTVF9DVExfQQkJCQkJMHg0OTBDMA0KPiArI2RlZmluZSBfRFBTVF9D
VExfQgkJCQkJMHg0OTFDMA0KPiArI2RlZmluZSBEUFNUX0NUTChwaXBlKQ0KPiAJX01NSU9fUElQ
RShwaXBlLCBfRFBTVF9DVExfQSwgX0RQU1RfQ1RMX0IpDQo+ICsjZGVmaW5lICBEUFNUX0NUTF9J
RV9ISVNUX0VOCQkJCVJFR19CSVQoMzEpDQo+ICsjZGVmaW5lICBEUFNUX0NUTF9SRVNUT1JFCQkJ
CVJFR19CSVQoMjgpDQo+ICsjZGVmaW5lICBEUFNUX0NUTF9JRV9NT0RJX1RBQkxFX0VOCQkJUkVH
X0JJVCgyNykNCj4gKyNkZWZpbmUgIERQU1RfQ1RMX0hJU1RfTU9ERQkJCQlSRUdfQklUKDI0KQ0K
PiArI2RlZmluZSAgRFBTVF9DVExfRU5IQU5DRU1FTlRfTU9ERV9NQVNLDQo+IAlSRUdfR0VOTUFT
SygxNCwgMTMpDQo+ICsjZGVmaW5lICBEUFNUX0NUTF9FTl9NVUxUSVBMSUNBVElWRQ0KPiAJUkVH
X0ZJRUxEX1BSRVAoRFBTVF9DVExfRU5IQU5DRU1FTlRfTU9ERV9NQVNLLCAyKQ0KPiArI2RlZmlu
ZSAgRFBTVF9DVExfSUVfVEFCTEVfVkFMVUVfRk9STUFUCQkJUkVHX0JJVCgxNSkNCj4gKyNkZWZp
bmUgIERQU1RfQ1RMX0JJTl9SRUdfRlVOQ19TRUwJCQlSRUdfQklUKDExKQ0KPiArI2RlZmluZSAg
RFBTVF9DVExfQklOX1JFR19GVU5DX1RDDQo+IAlSRUdfRklFTERfUFJFUChEUFNUX0NUTF9CSU5f
UkVHX0ZVTkNfU0VMLCAwKQ0KPiArI2RlZmluZSAgRFBTVF9DVExfQklOX1JFR19GVU5DX0lFDQo+
IAlSRUdfRklFTERfUFJFUChEUFNUX0NUTF9CSU5fUkVHX0ZVTkNfU0VMLCAxKQ0KPiArI2RlZmlu
ZSAgRFBTVF9DVExfQklOX1JFR19NQVNLDQo+IAlSRUdfR0VOTUFTSyg2LCAwKQ0KPiArI2RlZmlu
ZSAgRFBTVF9DVExfQklOX1JFR19DTEVBUg0KPiAJUkVHX0ZJRUxEX1BSRVAoRFBTVF9DVExfQklO
X1JFR19NQVNLLCAwKQ0KPiArI2RlZmluZSAgRFBTVF9DVExfSUVfVEFCTEVfVkFMVUVfRk9STUFU
XzJJTlRfOEZSQUMNCj4gCVJFR19GSUVMRF9QUkVQKERQU1RfQ1RMX0lFX1RBQkxFX1ZBTFVFX0ZP
Uk1BVCwgMSkNCj4gKyNkZWZpbmUgIERQU1RfQ1RMX0lFX1RBQkxFX1ZBTFVFX0ZPUk1BVF8xSU5U
XzlGUkFDDQo+IAlSRUdfRklFTERfUFJFUChEUFNUX0NUTF9JRV9UQUJMRV9WQUxVRV9GT1JNQVQs
IDApDQo+ICsjZGVmaW5lICBEUFNUX0NUTF9ISVNUX01PREVfWVVWDQo+IAlSRUdfRklFTERfUFJF
UChEUFNUX0NUTF9ISVNUX01PREUsIDApDQo+ICsjZGVmaW5lICBEUFNUX0NUTF9ISVNUX01PREVf
SFNWDQo+IAlSRUdfRklFTERfUFJFUChEUFNUX0NUTF9ISVNUX01PREUsIDEpDQo+ICsNCj4gKyNk
ZWZpbmUgX0RQU1RfR1VBUkRfQQkJCQkJMHg0OTBDOA0KPiArI2RlZmluZSBfRFBTVF9HVUFSRF9C
CQkJCQkweDQ5MUM4DQo+ICsjZGVmaW5lIERQU1RfR1VBUkQocGlwZSkJCQkJX01NSU9fUElQRShw
aXBlLA0KPiBfRFBTVF9HVUFSRF9BLCBfRFBTVF9HVUFSRF9CKQ0KPiArI2RlZmluZSAgRFBTVF9H
VUFSRF9ISVNUX0lOVF9FTgkJCQlSRUdfQklUKDMxKQ0KPiArI2RlZmluZSAgRFBTVF9HVUFSRF9I
SVNUX0VWRU5UX1NUQVRVUwkJCVJFR19CSVQoMzApDQo+ICsjZGVmaW5lICBEUFNUX0dVQVJEX0lO
VEVSUlVQVF9ERUxBWV9NQVNLDQo+IAlSRUdfR0VOTUFTSygyOSwgMjIpDQo+ICsjZGVmaW5lICBE
UFNUX0dVQVJEX0lOVEVSUlVQVF9ERUxBWSh2YWwpDQo+IAlSRUdfRklFTERfUFJFUChEUFNUX0dV
QVJEX0lOVEVSUlVQVF9ERUxBWV9NQVNLLCB2YWwpDQo+ICsjZGVmaW5lICBEUFNUX0dVQVJEX1RI
UkVTSE9MRF9HQl9NQVNLDQo+IAlSRUdfR0VOTUFTSygyMSwgMCkNCj4gKyNkZWZpbmUgIERQU1Rf
R1VBUkRfVEhSRVNIT0xEX0dCKHZhbCkNCj4gCVJFR19GSUVMRF9QUkVQKERQU1RfR1VBUkRfVEhS
RVNIT0xEX0dCX01BU0ssIHZhbCkNCj4gKw0KPiArI2RlZmluZSBfRFBTVF9CSU5fQQkJCQkJMHg0
OTBDNA0KPiArI2RlZmluZSBfRFBTVF9CSU5fQgkJCQkJMHg0OTFDNA0KPiArI2RlZmluZSBEUFNU
X0JJTihwaXBlKQ0KPiAJX01NSU9fUElQRShwaXBlLCBfRFBTVF9CSU5fQSwgX0RQU1RfQklOX0Ip
DQo+ICsjZGVmaW5lICBEUFNUX0JJTl9EQVRBX01BU0sNCj4gCVJFR19HRU5NQVNLKDIzLCAwKQ0K
PiArI2RlZmluZSAgRFBTVF9CSU5fQlVTWQkJCQkJUkVHX0JJVCgzMSkNCj4gKw0KPiArI2VuZGlm
IC8qIF9fSU5URUxfSElTVE9HUkFNX1JFR1NfSF9fICovDQo+IC0tDQo+IDIuMjUuMQ0KDQo=
