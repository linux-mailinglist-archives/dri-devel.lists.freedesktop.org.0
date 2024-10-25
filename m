Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A79C99B0B9B
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2024 19:33:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E43BC10E0B5;
	Fri, 25 Oct 2024 17:33:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j+j6FlKJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B6F110E0B5
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2024 17:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729877586; x=1761413586;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=zdIvOH3XFtlC/sAAVxx+DFGLVzCDiAdtCYpHRcm0lOs=;
 b=j+j6FlKJY1pZhZUr0pJCGMCAj5EDje7Y19TkhWRRqx6ctXNT7rXc797d
 nXl51qtdaNk8iGWN9BdHYDS76NWIhvkqsPzeykwfo1tRGMRgt9aeQTxvN
 9B+J8eUZJO4H+xQhvhtLpJsDP+cilbY8odEhHUb+0qzCzkZ5CSRVhLwh4
 hFPqMHtFoxHDS5cfo6Lip3hrNpvixEcX0axnzOW9A2gOakBOrg6rKntoT
 +l3saw5yWzl/oGGin6HNthJ1YJ7OgehpsEanUt32f8vUDkqIZVDI2MESz
 i8VC/7FNgOQ7O7iSb4jyFXSI83PvonfZueo+vjHwfbARlJ247LCBTrdmf A==;
X-CSE-ConnectionGUID: lfrwM7ZgS+6NfBueLFalVw==
X-CSE-MsgGUID: w30sx7dGT42G1rNsdTURPw==
X-IronPort-AV: E=McAfee;i="6700,10204,11236"; a="33464397"
X-IronPort-AV: E=Sophos;i="6.11,232,1725346800"; d="scan'208";a="33464397"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2024 10:33:06 -0700
X-CSE-ConnectionGUID: 0uATAk1fR4GaXleX+H7HXA==
X-CSE-MsgGUID: p8hwKa/VSnaKQ1iOlb2tYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,232,1725346800"; d="scan'208";a="81797969"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Oct 2024 10:33:06 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 25 Oct 2024 10:33:05 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 25 Oct 2024 10:33:05 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.44) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 25 Oct 2024 10:33:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SceRe30Wn0l8iDVSxOWcSl/kpgWe6W7UI9sPGzHPgJlmdcEUqEdqfw6fPxRgkHLrpSp52KIUcvmbo2QVODU0mxDDeC3VdTReuYQAgPcgEZhTrEPjnBXlWAbJsNbB4zNvm0hdYkqDhj/yJtHWddKrNS7pER1gEsJGzpmApndQau2zk+JoX2L2DwB0ItbQNhOT5L2kUsqn/bC5cHIlpwezB2JGgEhAKbTMW/0Ws2p7rYpO+B/LEVN/jo+ZgRhc9RBgnx9q/+ttM7Rz+8OrM3pzhHuscXRqgvQfPX+PRspkIfurwNQCNXg6l5sn9oqkWe3e2GxzGetw3N3yeNxdGHlx8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zdIvOH3XFtlC/sAAVxx+DFGLVzCDiAdtCYpHRcm0lOs=;
 b=OgRGMMUaLOLjkIn9bBVQaW6ZL9Rs7cY1k93wBJS0jbrnIVebUuGMrkyahoOHpSh9fTwkgYzXVt+QwPlpsoZJFzBwNhXdtiOWWrg82foVcrihtXwq6sOm9aNcS0rqwUx3P19+87QVlS+u9jjFyxUFeZY+wGvUvpJnX/hlyGHwSZsm0UjKG4Va1A4rhDbcUMeg6BwK4RkVcvmkf5XFzzhpytfTzAamz8inmCcmZvI90bGag3bKjo2N0NEWjxWkqnmMwKHwp6oT2yBjgqZSRjc/pWzg5cOm7t9jcYt0ahBRdBGBgwFw47tmHDupZrXYqt6HNiSsVIVh3RjOe8oT7pDEWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com (2603:10b6:a03:48a::9)
 by DS7PR11MB6221.namprd11.prod.outlook.com (2603:10b6:8:9a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.21; Fri, 25 Oct
 2024 17:32:55 +0000
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::acfd:b7e:b73b:9361]) by SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::acfd:b7e:b73b:9361%4]) with mapi id 15.20.8093.018; Fri, 25 Oct 2024
 17:32:55 +0000
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
Thread-Index: AQHbFJmT04jrr3jRak+Ttm6l1x35MrJzoo8AgAKwlQCAAIBHEIAI7u2AgABwP+CAACOLgIAA2BKAgACXNxCAAAp9cIAEcwsAgABL7xCAAOtRAIAQYdvA
Date: Fri, 25 Oct 2024 17:32:55 +0000
Message-ID: <SJ1PR11MB6083F49C8A31B444369596EDFC4F2@SJ1PR11MB6083.namprd11.prod.outlook.com>
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
 <SJ1PR11MB608375AE30D1E2188DC6B0D0FC442@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <9be5b869-2af7-4ea6-9231-75a46ab205dd@suse.de>
In-Reply-To: <9be5b869-2af7-4ea6-9231-75a46ab205dd@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6083:EE_|DS7PR11MB6221:EE_
x-ms-office365-filtering-correlation-id: 6f1a090f-a5ee-45af-b83c-08dcf51b0f75
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?SFgyWlhPckEvbWxLY04veFhaUDdhbUE0aXVjRzRlU2FJK0dvVnNuSU95N3Rz?=
 =?utf-8?B?UzZiUU1Md2ZEQzRUMkZ6cVIzWkRMUWsveUtzNm90TnUzTFFYOUlrWlV1eHRa?=
 =?utf-8?B?WEhNK0l0UGVleFF3VnhKblVGVEdTNDBmc1piSXArdHVXcFFVMG9QNWtVMkNl?=
 =?utf-8?B?RksxamMwK0IzSGw3TmowUlFSU2l1dTM5KzQ5U0RVdmYwd21WMDcxZjRVbTdL?=
 =?utf-8?B?RjVzbWRCTE94dnB4MkI2WWRpVTJKKzZHdHViTWlwOEhjaUFibS9LYXpYVDJQ?=
 =?utf-8?B?cXFyR3VUZHU2L3dBZVhIMVFZV0d5UVlYcmNVelBjNk8yazVnZlhxWi9kL21h?=
 =?utf-8?B?VzQvTmtWSThpK21UdERERFZDT1I1SWcwYU9kc1Y4enhHaGU0dllqTTZSNHZO?=
 =?utf-8?B?QUNhQktsbHB4QXFtQVpzWTYrajNiWG1zcitpTTEwOUhzcDlVMWg3eEY4Z3Nx?=
 =?utf-8?B?MmJ1SXlRUGhOdDBpVDFnSncyRVVhV3FqRWdwd0gxNXlPVDNYQ0dXZFBHTDBN?=
 =?utf-8?B?UndHNmJNSy8yWXJMN1BaREwrakFPZ1hVbk8rd0R5enpOYjdQa1FsZHFnZThr?=
 =?utf-8?B?WWNHdUZYMUp0a0VwUjF2ZU9nUUVFL2ZGRFBTdjlmY21uOFZnTTJaaE03bnJQ?=
 =?utf-8?B?dmw2SFN1Ty9DZjN5VHlKMEtYS3hkQU0veXNFMWoxdU0rMVdWRlBDZ1hSazFn?=
 =?utf-8?B?QzRWWWZCTGducnU1RHlMdXhSQURwNDA4SmlNTSs5Y2VCZFFyN1E1akpGbW4y?=
 =?utf-8?B?Vkl2VFVURXdLZ1pkL1N3RjlzZ3BSd0pUWmtKd1N4OXVRVE5pNjJ0R1NCdGZL?=
 =?utf-8?B?aDdObUFoZ2MzYyt3bkNac1RDUUd3WHB0aklGeVNtcUZqU2daSEd5elFvVnI4?=
 =?utf-8?B?bDFIZDhZZ0JjUEg2a2VHM1ZZWWQ3Nk9qcDBZem9SKzdyK3BGdFBEeTVPbW1h?=
 =?utf-8?B?d3FhSWFZamxBaWVodVBvZnRwTlgrRGJWaFFsQzhUcFZ6MFV1YTk5WHBBaU9C?=
 =?utf-8?B?T1MzVW1CUnc3czhYRllPZ0w1eXJuYUdGek8wR3oraVZ2ZGt3N3ROMk4wVGhC?=
 =?utf-8?B?NXg5U1h4bDJiSDFreEkrZVVsZis1UFQxUE1qMDV0LzJlMVpKS3J0M2FMcEkw?=
 =?utf-8?B?eHBXb1VNQ0xwU0ZrandYS0VJUkx0NXNhazZNaGozanVvVkprMjZkZDdmS2xW?=
 =?utf-8?B?VnJGUlA0NVFiVXIxbndTOGp5dUY1Z2haNEJjeVhiRndvL3NKZVdPVHVhWnpx?=
 =?utf-8?B?V2s3YVgvaGQ3UTdFMHQweW9rMTVPVHlZNzF1WmRkUFAzaTJWSElwLzdDQlJu?=
 =?utf-8?B?Y3hNTFI5eFQ0WHVoK0xnc2dhMENDcE5ZeTBKRC9ZOWVUaG9qTmxVSkdaT3hp?=
 =?utf-8?B?OTBpdGlPSWRCdXdYTVpnK25oclM1NjE1dDEzVis4M0VyYjBMblkxRkl6S2pu?=
 =?utf-8?B?a0RjWkRUUXpqUVArK0RSczdqbmE2Y3NqS3NzMVlBOWR2Z3JMYmhPNDRwQXE1?=
 =?utf-8?B?L3FKSGFCeE5meHR3eGxDcUc2MGtwYmtIN2xYRDI3dG5DNHVrd0FVcGQ0ZkRz?=
 =?utf-8?B?d2MwNE1wY3pKaEdlUFp4dFhlWWZKK0xZMjd5MENwTmZvdmlyUktSNGF2Qytr?=
 =?utf-8?B?Q3ZMOGpYdHlndTRyVE9jekovY3ZqUmtjYnlKWUhNS2VxMFVEeXpXQSs0VzVj?=
 =?utf-8?B?ZWdKSWtxWHJqWm42TzlWb21CS0ZMNUErRWhQWndjQUtXMXUrTzFOWjkrQzVO?=
 =?utf-8?Q?nhc935bDDRsTsCvPrpMmHzZ9df/d/SSutcgmCNq?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6083.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eVcybS9jcDBseVdoWFZJYkI0UHpGaWpEK0ZobEYyRGpDTThNalFpd0dpM0ZN?=
 =?utf-8?B?aFNwOVBodDJDWHBKLzlHQS9OYW1JYXk5Q1ZVVWVpN0oraFo5QmFIMnMrM1ln?=
 =?utf-8?B?VUVaZU4zQ2h0b3o0cFlXSkRGUVYxVG9oblBobkdpOXVtaVhTYm1pZm9OUEVO?=
 =?utf-8?B?K2dPdUE2cmJRR1RWeW4zZTkwVGxtTERxV3ZZcjV2QXlmc0dsUCtPdko5K1pP?=
 =?utf-8?B?WlQ0Q3QzOUE5MUp1TGZPWnNQdVROR2diMUlEbHVNKytoVUhobXcyVmMyRFNY?=
 =?utf-8?B?ZE0vdFdLRUFvMkZ5MEVKUFNFMGNvSXRmeVNsSFBrN0E2ZFV2UzlvMmVSZ1lT?=
 =?utf-8?B?S3VFWmkweHVIcWk1WStYWFVDU0NPdUk2QWZNOWMrOWN0Q2poemx0YVZmVmJ2?=
 =?utf-8?B?dDhtSER4SGQ2VTB6eXRwMkdvUU1WdXB3N0RNNXhEWmRLdUZFUlBIR3F1L29w?=
 =?utf-8?B?bVpNbjREdTdBN3JZMnRzOUhISkZFdmlwMGhqb1U3WjFUaWJ5eHZtbDF2aW9O?=
 =?utf-8?B?ZUYwQjRqcUNzTWJqek5iSlphQU5kbm9DQ1p2amdXQkl1TzFqWkI1YllKMmRK?=
 =?utf-8?B?a3kxbG9hTFVlK1VrQzBWcXE1d3JHQSt1TmJ6MlZLeFQ3Z09vQnQyamlQK01M?=
 =?utf-8?B?WjhHL25aWGYxVzBxbndGTlFSNXphWWttYWRUOGVTMmMzZ0FJelFqRVE1djdP?=
 =?utf-8?B?Ukk0UDZKTGgvRWZuNGVVV0dZWDJRajdvblZhemhmRG0zSVVPZXB6bEZIT2ZV?=
 =?utf-8?B?dEZ0cUhXU3l1bFBHQlBENytldTRnMXVWL2R6Q2dDTzQzc09mbWJnYzZqT3dZ?=
 =?utf-8?B?anZWTXpNTTRUYXYyRmpEMWFlNnhRRmE5V2lrb3k1WjlaTUdwQkhjR3ZIN3hl?=
 =?utf-8?B?S000RmkzVVNIT0ZyMytiNnZYakpIQTZqejNTd05SU2puV2hJc1VLRElMK2xr?=
 =?utf-8?B?aXAweFpwdlJNWTNEeUh0RW1JTDQ4SFA4VC9yNnVNRzlneEFianFBQW1QT3RY?=
 =?utf-8?B?NCt0aXVMK3NPcWVEeG1pQjJkQ1EwcFJDbXk1VVN3RGs4bWsxYURhbjFxZE9a?=
 =?utf-8?B?MUdZd0tBMEdGbFVUMkp1bS9kVDducnJNRmlvL2lOWjgxb2s3dTVwUk9yS2Iw?=
 =?utf-8?B?Mmw5Q1Z0eFBzVkVSeFhBWjBLV1ZuODZab25tSGJNY2UwN0xuclFwMjlva1BW?=
 =?utf-8?B?QVQ2TTlKVThMc1Fkam5sV1AxbFdXazB3bkR4N1M4L0huSHBNS0dxVUx1OEw3?=
 =?utf-8?B?OW1lazZnMWtvK3IvUktOMlVIdi9vSS9jbS9xT1lVaXpOM2JtSmRNQ0dBcVQ1?=
 =?utf-8?B?c3VzdW85VWpmZnBuWnR2TDlIQlNGek5Sb0pGeElGOGplVE5DZXp1LzFQZDdF?=
 =?utf-8?B?OCs4MjlFeERkOTl1ZjJ2WkNvOXFKRTJoOXRTc2RFbGo3ZFNOdnVNZThBNEJF?=
 =?utf-8?B?OTc0Ymttb2V2VmQ2QjQzOFJ6YWdlZmdoeXo2eXVrdFplaWQzZUw2aStzRUVk?=
 =?utf-8?B?eTFxdzB5QkdVVnVJa2YvMnB4RXpRR2g5Vk9zcFZpUUJUd0pqN2dtYks4Ym5p?=
 =?utf-8?B?RVpMYmxwdHRjUWtTaDAwMGVmeDVPRDRYUGw4T1JadTU4aXRncjFjRXdRbm1U?=
 =?utf-8?B?ZWVCZE4zWjVFWk5FRVp0YXhSM25KclRYd3d5eVo5VTRNSE4yb2srZW01dWpN?=
 =?utf-8?B?RkozNit3UHluaFVTZk5qMExYWEFPZkFWYmlNM2xFaEdLSERPSVJwd0pCU1VH?=
 =?utf-8?B?c1loNjI2RTNwTnFEQzBGOHIxOC9wOCsrRjlSVU43amRRSUVTemlOMkRBc1d2?=
 =?utf-8?B?enVTcDhVMm9YQ09tVlJBSXJ5R2gxZHZLdlFNeGQ5R1YyazBjNzNGMTh4NjBF?=
 =?utf-8?B?cERrdHlqMUpaR3B0NlpaVEFnNmhkcG5aMXlQaFNYb1ZGNzBUQmVxV3M3NDBh?=
 =?utf-8?B?MzlGWlV3Vk0zTEtpTnJmWk5yLzZsdlNRWUwvRXpPUC96UDdEUXRnRnQ5VmlI?=
 =?utf-8?B?eUk1VnQ0VHpuWDZHd2pJOVAyQWRkalh1dGNFaVp0OG0vTmJXTUc3SDAwV3Bx?=
 =?utf-8?B?QU1GU1lUUWlISlNJY0lSUW0rL0MyN2VFL1RUNjRybTRPem5aT1Z4WXB6NFJm?=
 =?utf-8?Q?sBH0+J51tJEfUteM+zILUsPY+?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6083.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f1a090f-a5ee-45af-b83c-08dcf51b0f75
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2024 17:32:55.1960 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 33hfnRiFZStsG+GZVWoASlj8oym0yhtQdQqQwkPcGCKSJVr27OF+bPF4GqYUb/Qhc84dStz9z/gxrEfVIjY1VQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6221
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

PiBUaGFua3MgYSBsb3QgZm9yIGhlbHBpbmcuIFRoZSByZXZlcnQgaXMgYXQNCj4NCj4gaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvZHJpLWRldmVsLzIwMjQxMDE1MDYzOTMyLjg2MjAtMS10emltbWVy
bWFubkBzdXNlLmRlL1QvI3UNCg0KVGhvbWFzLA0KDQpGaW5hbCBjbG9zdXJlLiBUaGF0IHBhdGNo
IHdhcyBwdWxsZWQgYnkgTGludXMgaW50byB2Ni4xMi1yYzQuICBJIGp1c3QgYnVpbHQgYW5kIGJv
b3RlZCB3aXRoIG5vIHByb2JsZW1zLg0KDQpUaGFua3MNCg0KLVRvbnkNCg0K
