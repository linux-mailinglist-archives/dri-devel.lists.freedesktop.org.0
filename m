Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE96E99D55E
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2024 19:14:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF20810E48C;
	Mon, 14 Oct 2024 17:14:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f4n/j6QO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13F1110E493
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 17:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728926083; x=1760462083;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=i2gubvAjGH9YSATYZ/TaoIDYOowGFOuECB29//UAJ2Q=;
 b=f4n/j6QOmH3jVAxU7efUOXr610PvSAcLLG1otPDUzUK4NVsW4wGwWss5
 W21tCTbzk3LcWt/4w3IemKPXu1z4ivHCImRRladQavrPyDK2/RLvOhzkm
 Frqzcf8KWoGYsyYJhmGGm5w6ssBCgLhDUEWIObMjLy8OCxhwcm5iardoO
 V5yVQ3UCTY1sXexti3HUtzAAdFi5I/scP0Rz6VzChlYzbSo7s0p8hjV7t
 QppRtXdtjMWDgwPHxW1daXJJUmNOnf8aO7eA0jmjK69aCQNd++Tf8JhMU
 ydYPepDh6g2Rc+TWv3EDBTssECYCK8KLmxGkUTgrqJ5MTTSyr6r7iz12v Q==;
X-CSE-ConnectionGUID: tkrAjbk+S2ejN3JlQKy8uQ==
X-CSE-MsgGUID: janRnh8HRhmG6Dx73o5PjQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28429649"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="28429649"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2024 10:14:42 -0700
X-CSE-ConnectionGUID: pFS4YLdXSQGGtonYfpEHWw==
X-CSE-MsgGUID: 2SGNLFdhTr6aNjT06bDxmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,203,1725346800"; d="scan'208";a="81616217"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Oct 2024 10:14:42 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 14 Oct 2024 10:14:41 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 14 Oct 2024 10:14:41 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 14 Oct 2024 10:14:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vIwjX7oPJa5mCivVV7Rx1Yci2RynjQTQBEzy2nZQmSuOhWqpg5Agbyn1LTVyw2lq/htfd8tAqKcy7NoXaTLtl1+OxgM69rD7+BnQVnvWg52Arub5q6bGDpHcDMO6bAuqshrCVVBBWcuYHghTXkn8/4U4lNV/wjdtgco8ip9PsH8xwp/mJxLdeOc4wBE3v3Bs20kPAwXCGp0/3tcBaU1qEu0OTmVg6/iUFjyV0b95De6bQwtR/0okg3nKTV3TXzpiSQLjQJRO6DbiSOLNlTdz2Y7KfITPNrOusmATuk69CPjI2vOcbG4VXNe0o7uITLgHXquEwISBUSOSktd8M3vmqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i2gubvAjGH9YSATYZ/TaoIDYOowGFOuECB29//UAJ2Q=;
 b=Av5fdCoHA0LXxVF2q5KAK//BhZK6jHjUjAGdrNzcCdHpO223KZ11woUAUevbQkrjtuU445BPn4L7/h5wfSTa3W9iLFPvWGvZBjut3CKJ29IuhHpgGtqG1NkA697zTXqDEtchRgn+SpXBe1KFfLSiYkmrz9FRfD8xESqHk/MQ6WMm9zjeaOBHC0nvIERLVBqhdhaDk5NLXJEBZlQzU6HlwbFFJ61svQY5YBCoo/UlRPW4zHBipOnqZiCamK7znycglEBqAejuk31cUPMH0mqYxQEXwwrsVCPXz7TqJmJNm/fsu5dDRdfSmGMzfuOCV4yevRzfN6SaYCvLBzSYSaXX+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com (2603:10b6:a03:48a::9)
 by SJ0PR11MB5070.namprd11.prod.outlook.com (2603:10b6:a03:2d5::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.27; Mon, 14 Oct
 2024 17:14:39 +0000
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::acfd:b7e:b73b:9361]) by SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::acfd:b7e:b73b:9361%4]) with mapi id 15.20.8048.020; Mon, 14 Oct 2024
 17:14:39 +0000
From: "Luck, Tony" <tony.luck@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
CC: "jfalempe@redhat.com" <jfalempe@redhat.com>, "airlied@redhat.com"
 <airlied@redhat.com>, "sam@ravnborg.org" <sam@ravnborg.org>,
 "emil.l.velikov@gmail.com" <emil.l.velikov@gmail.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "airlied@gmail.com"
 <airlied@gmail.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH v5 0/7] drm/mgag200: Implement VBLANK support
Thread-Topic: [PATCH v5 0/7] drm/mgag200: Implement VBLANK support
Thread-Index: AQHbFJmT04jrr3jRak+Ttm6l1x35MrJzoo8AgAKwlQCAAIBHEIAI7u2AgABwP+CAACOLgIAA2BKAgACXNxCAAAp9cIAEcwsAgABL7xA=
Date: Mon, 14 Oct 2024 17:14:39 +0000
Message-ID: <SJ1PR11MB608375AE30D1E2188DC6B0D0FC442@SJ1PR11MB6083.namprd11.prod.outlook.com>
References: <20240718104551.575912-1-tzimmermann@suse.de>
 <Zvx6lSi7oq5xvTZb@agluck-desk3.sc.intel.com>
 <49f0ca61-0cf4-4093-b4a7-f49dc46037ab@suse.de>
 <SJ1PR11MB60836E1B04A688CF55506BF4FC702@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <ad02af39-b9b5-4b04-878b-78b3eb7885a5@suse.de>
 <SJ1PR11MB6083AE35E583A3E556B29004FC722@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <4769b892-b2a6-4f8b-a0c6-72fed9eacd31@suse.de>
 <SJ1PR11MB6083AC96151969AD04C4330DFC782@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <SJ1PR11MB6083B44A9FCF128144AEC78DFC782@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <f03a55ee-e355-40dd-94ad-749baeb435c8@suse.de>
 <SJ1PR11MB608330D5E114CAF1408DEC9CFC792@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <SJ1PR11MB6083EEC3C157E3293377C5D0FC792@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <4cac0f96-b984-4846-959b-617a301c7295@suse.de>
In-Reply-To: <4cac0f96-b984-4846-959b-617a301c7295@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6083:EE_|SJ0PR11MB5070:EE_
x-ms-office365-filtering-correlation-id: 34bb5152-cdea-4cee-b7c9-08dcec73afd0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?T09GNnoxTGgrUXBNdzB3Y0Z3MUd6UWZzL0FCUmdWVFd6YTcyY0J0MnhiLzA3?=
 =?utf-8?B?eTlPTStuQkt2MDlEVVUvVXRjdldTUzlqaVVGSlVESDVvbnAzemhiQkhVbVRp?=
 =?utf-8?B?clVlTy9KczRNRXBEMWZONElJbkRXMDNpQ2hub2xaYVAwRmYyY2Y1UVFobHVC?=
 =?utf-8?B?aGU4MWRDYUVueXFSNTZrNXl2SWZMZEVRc2c0Z3YrM3E1RTBFV2JlVVpUdEJp?=
 =?utf-8?B?eHlwSXY0SHFmVm9vM2VIb0hiRXdlUkJuOUlCWjBmV0xPdlZLUW15U2piWnZE?=
 =?utf-8?B?dkhWTXc5ZzNFdlB6QUQxenlSajFHbjdCZWZBRGVoNVkvaCsxaU9OTFdFVW4w?=
 =?utf-8?B?NnNyTWxVbG5WQWxmb2NaSC9qYzNyNXNXbnVMeHJnQm5HNWg4cGdCWmRCYmRX?=
 =?utf-8?B?SnlOamMvVzc0WUliSlQ3SzFhSzlkL2dsQk1jMExTM0ttY0VadEc0S045TThL?=
 =?utf-8?B?Tjd6dkNTeW5vRzNSV2NBdUJmelNKNEdlNGViSzNiT0FhQ0N1UFVjUURNWnlY?=
 =?utf-8?B?M0tFQlpXamFJeEp0YmdlY29EVTlyZTI3cDczOEtzVmJDRFlKN3Q1RFdtNE01?=
 =?utf-8?B?Y0c2bVJ1ZkQ5eUhrdnpVQUdkKytvUzd1ajhXdTRCL2VkM3h3aThqdkZKZEJU?=
 =?utf-8?B?cVFSSlBUNlJVRWIwOE1NYXFyRUkrc0QrMVlWSmRBVm1vSWxoSVpMcElld25q?=
 =?utf-8?B?NzdwRS9jM3V1ckczb2pING9sWGtENks3UXVQSTB3VUZIZmJ3SEtMRWl5R1Z6?=
 =?utf-8?B?QXlJWkxYbzM1OHBPR0lTWUFiRDFoZlkzRXpqdEVQRWlDMHJSRVhEenZncDBn?=
 =?utf-8?B?RWYyd3J0QWtlVEhFY1RxdVdrNmx4azliTFp2Ti91MzNjakdYdGRvRHFMbXFS?=
 =?utf-8?B?Vzk1TXNmb1puemFNYlpRbEMrZkRMdzlSbVdzQWY1YnhTWU1yeVNtNGNKR3lk?=
 =?utf-8?B?OG5kSlhBVVovcllEZFNINWxjd0h4c3I4VXJpb2I1d2FycXAzSE1RaGdnM1JT?=
 =?utf-8?B?OFdFNjdwM1cxVDRvbWtEaUdLQnB2clZXRUExYTM0ekNqdnp5Mm5leHMxNmdQ?=
 =?utf-8?B?dTEza1dxdG1HbDkrZnJRSjdsM2lzWXNiNG9UTHd4bGRvcU1WbGp1ak5Gekt3?=
 =?utf-8?B?d2hnZWRFMlFkbGFFbG5XNitvS3k5N2dsR0NyTStCbW44RnZJcHplaHN0S1l2?=
 =?utf-8?B?TUJmRnA4M1BhMVI1ODFPb0VtMXkzMUlTRzRpaFpDRUdlaTNPaGpLdDBvNVVM?=
 =?utf-8?B?aUIzKzJwYmdxdlJzTWgzRHhWbFRVSklyS3V1bHZURUpncmpLdEF3TGpwYTI2?=
 =?utf-8?B?dVh3YXZ0SndiQThiV0htc2NlMFVJS2dabEJlWllscWVjdXh6NDVwUkNTekFJ?=
 =?utf-8?B?Y09GN3BFWERwMzh3ZG5XUmxzck1iT1Awc04zWDF1SVdYL3RzczRiY3VsSEhB?=
 =?utf-8?B?ZE5ycnNlZ094bkI5eWdEdXllT1cvTzdnM2NrZUlOMENBbW5kMmIzMW5FbkVG?=
 =?utf-8?B?K09SRGQ0djB0Vk5qY0QrOFAzb2NPM2FmZkgzWERiWEV2WlE2M3VnTEplcHJj?=
 =?utf-8?B?QUh3TzFMWXlqa0U5YzJqYWV2Vy9ORFpkeUJaM1ZPekxOS01hNGZRMGgvYkVM?=
 =?utf-8?B?VE4rNFF2NCtBc1VSTEdwdVd6WE1kS3RNZ00xNzhLY3gwMGpTOGdacG9XckZa?=
 =?utf-8?B?bUxxNlJ5UjZKbjU2Smd1bTh6djB0Q2JOLzlsVXoza0paSU1hSm16TGlIWEVR?=
 =?utf-8?Q?YPNMr538e/8lYt1iyvvW1x+JrpfSyouOI4zjrSA?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6083.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cXJFL2E2c3ZqM2V3NGhPUXpjclMyc0REdzJEWlRhM0hsdzcyWUVwQlh1RGlw?=
 =?utf-8?B?aXNqRmhqT3NzdVRldWZ5S1JBcmtpSXRzVUJPTHdZQjN6SkMrZzhPcUIxNk9h?=
 =?utf-8?B?RnNEVm9mRjRMeUJ4MnVLT2t1R3VLV2VVaHdQMW9EM1I5cVhGdFpmUUNWSkNX?=
 =?utf-8?B?TlN2WG5GYkpiQWhMcEs2NVBmV3JKMG9CcFFnWi9rTVVrbERpbHpmU0tYN1ZO?=
 =?utf-8?B?WHBHQU1FRzA5dFhNUW1MdEQ2MERZbWtaSXFNZ3lYK0pmVXhEd051NVRFai8r?=
 =?utf-8?B?NW1Rdnp3b3dTMWFMeVBzNzRNZEUvUHpxVHVOb2ZaSzI4VEF1WTloL2lIb3ZM?=
 =?utf-8?B?elc5bDFJZE0vaVdPZ1NCc3I5YmhCV0V6N1p0OXdRaVJoS1M2Vk9sU0kxaU45?=
 =?utf-8?B?U1N4L2JrcCtrRUdsWUpYOHhxMXN5eUpWaVRoR1ZaMWFjZG9jUk51THFlR09a?=
 =?utf-8?B?eG5HYVFsVjVLSnJ1VG5iNWZPUzI4L1kwRjJYaEdBRzJPMWhqMEpJZnd0M1hK?=
 =?utf-8?B?ZURONjFtdWNWNnlWWlIzaDNka3hCTEFBOFpWeXViak9qUXZlL2NoNm01dEl4?=
 =?utf-8?B?Yi9CQnBMSkswcll5VWdoclU1Yjg5WWZBckdhNUtYWUFPeEQyb1dnT25WbXdw?=
 =?utf-8?B?MElWZ2ppQ2VhRXJ2enNBL0tuOWdIY3doWVZ6cVg1S05NM255ekpjVkVvS1RE?=
 =?utf-8?B?Z3VaeC9Ba0RxTkFTdENNRVdEU0dXNjdRSUpRZENmbElhMTZnay93cy9RTWlm?=
 =?utf-8?B?R2R1cS95UjlqSWV6THcyK1lKSXBnSDN5OVlkalFZT3VBOGtnVUVwdVJXZWls?=
 =?utf-8?B?czdjemVyNmljTHhqOVBKaTZhUWpneCt0VnNkYmNPQkkrWjJBV3ZuTVZ3S1hw?=
 =?utf-8?B?a2lFdnpSeXVLRUpiRDdjT0FKeGVsZC9aZ3dLQkZwdFJac3VVSGt0US9IM2Q5?=
 =?utf-8?B?VGhTQ1BiQWZJM3BJVlhsMER4MXgrbDRxRzg4aTFVWGtDM3NEZ1lESlBiODRk?=
 =?utf-8?B?VUZadTNkdlBWdVdUVy9MUS82d24zbXYwd29nUEVHc3pIWG9ITGtMZ1pUYStu?=
 =?utf-8?B?dmlBUnRhV2Q0dmpPL0lJR3dVWHVRMDVyQVJkeHJmQlM0QWR0SmovT0pZcUpt?=
 =?utf-8?B?MitUUzl3V1V5MHFIaURTMEVlOHNHazZsTCt1cWVQMnh5aDZ4ck9xNFZZUEhs?=
 =?utf-8?B?L1dxZ1ZkVGMyMXJBTUZmQW1FSjJRYkw0ZFdiQjEvWVZQTnhTNDE4UGtBWFE4?=
 =?utf-8?B?NVkyZkt6UENaRVZ1VEs5MFp6dERkdWZkSkJJTUYwODZRUXYwVGUvV1FkeFRT?=
 =?utf-8?B?eEp5elpuMHJPMGFKdnhsWHhnamIzWXh1aFVzSjVzNHl2aFlZeVBqLzZoTXQ5?=
 =?utf-8?B?bXEvV0s0eUUrbjBuMjRxbS9vS3U4ZktockJkWUtuR2VIZzZxekVDbDZ0S0Z3?=
 =?utf-8?B?dTc2ekliTnIyY0Vpd2I5NjRsTEg4c2hnWGRnaG8wT1MwbG1PYlQ4NElGdTFD?=
 =?utf-8?B?NFVveUdmYThPYWJhdm9uQUJGY3pDREFHZWRCbUoxSTZJWHZrWDlYbTAreHd3?=
 =?utf-8?B?V00raGxaaWdrMldKYUxyY0lzTjlCREo1Sm1HM1hBTnV5eHhkODBDNGNUWFhE?=
 =?utf-8?B?cGJBZjlSK0Zhc09NdzZ1Z25hWk91eTJQd0RKYXgwaXg0dHljL3NDUW1USzcw?=
 =?utf-8?B?K2hEandFYWVRckVjSitRWVNUd1pGRmFyV3JPeTRySGZtbi81cGJyUllOL2Vw?=
 =?utf-8?B?MHJYUHoxRExBMU5tSEQ4SnVMMzg1OHN6ODJtSG5TYy9aTTRpbnRwSTJKUnZR?=
 =?utf-8?B?eGJFbDBpak4zQmxKRnA4enBsbnpkQ04vWUR1cGFMWTdVbFQzWmw0MU5aWXV4?=
 =?utf-8?B?WDdyeEZEMVJrMVc4SGNQOWtRRE5TVTJVL0F1VktWRk85MERtM1dKSk5lcWF1?=
 =?utf-8?B?aHEyRHdJSjB1eDNZUlh5OVphL0dkMHZydys0L3NyZVo4blV6ZjdDb1dqeExm?=
 =?utf-8?B?T1dIa2MwT3cra2JjOUJkeXhZM05GSldTSVNtQm41amRYbUEvOTgwZlVHeVZp?=
 =?utf-8?B?dkFxOTZuMmpmWEl1Sm1ta09DWXoxR0JJOHVLaUZpd0llVG1UVDFBVVRESkhn?=
 =?utf-8?Q?PsCFpZQhDrJond7Uq2UFlPtFi?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6083.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34bb5152-cdea-4cee-b7c9-08dcec73afd0
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2024 17:14:39.4325 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lm2cupppcQ3PVUjoD7rq8swYcdnyYAIZOvEdd1IqAtBKKBxts6rfCqgs4iwYKML9RT6xW1pT3jxWwBo0BkeaSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5070
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

PiBBdHRhY2hlZCBpcyBhIGZ1bGwgcmV2ZXJ0IG9mIHRoZSB2Ymxhbmsgc3VwcG9ydCBmb3IgeW91
IHRvIHRlc3QuIElmIHRoYXQgDQo+IHVuZG9lcyB0aGUgYnVnLCBJJ2xsIHBvc3QgaXQgZm9yIHJl
dmlldyB0byB0aGUgbGlzdC4NCg0KVGhvbWFzLg0KDQpJIGFwcGxpZWQgdGhhdCB0byB2Ni4xMi1y
YzMuIEJ1aWxkcyBjbGVhbmx5Lg0KDQpTeXN0ZW0gYm9vdHMgd2l0aCBubyB3YXJuaW5ncy4NCg0K
TUdBRyBkZXZpY2UgaXMgcHJlc2VudDoNCg0KJCBkbWVzZyB8IGdyZXAgbWdhZw0KWyAgIDMxLjI3
NzI1OV0gbWdhZzIwMCAwMDAwOjA4OjAwLjA6IHZnYWFyYjogZGVhY3RpdmF0ZSB2Z2EgY29uc29s
ZQ0KWyAgIDMxLjI5ODEzOF0gW2RybV0gSW5pdGlhbGl6ZWQgbWdhZzIwMCAxLjAuMCBmb3IgMDAw
MDowODowMC4wIG9uIG1pbm9yIDANClsgICAzMS4zMjQwODFdIGZiY29uOiBtZ2FnMjAwZHJtZmIg
KGZiMCkgaXMgcHJpbWFyeSBkZXZpY2UNClsgICAzMS40MTQ0OTRdIG1nYWcyMDAgMDAwMDowODow
MC4wOiBbZHJtXSBmYjA6IG1nYWcyMDBkcm1mYiBmcmFtZSBidWZmZXIgZGV2aWNlDQoNClZHQSBj
b25zb2xlIHdvcmtpbmcuDQoNClRoYW5rcy4gUGxlYXNlIGFwcGx5IG15IHRhZ3M6DQoNClJlcG9y
dGVkLWJ5OiBUb255IEx1Y2sgPHRvbnkubHVja0BpbnRlbC5jb20+DQpUZXN0ZWQtYnk6IFRvbnkg
THVjayA8dG9ueS5sdWNrQGludGVsLmNvbT4NCg0KLVRvbnkNCg0K
