Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D53AB537CC
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 17:31:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99F8B10EB66;
	Thu, 11 Sep 2025 15:31:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KYQMQCnl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E677A10EB5D;
 Thu, 11 Sep 2025 15:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757604683; x=1789140683;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=bhi4Q7o8vebEgm6hw0hFPXM2SyjgUuSF6cnBeFZdFZE=;
 b=KYQMQCnll2Bx76SllwsLWkAKSZdfHIAQV3ix982VEeG9OAPqQHXB0Vk1
 Qwp0qdZRLUDFnjg+U+L3R1SFmWfVBRbubUCCsTRrrhSzeXz+EC2203p2m
 Vr9sUcYNXm4LbfV+7cHtx06hnO4NiRRMSucn4aYXc6CjcYvupocQX4czG
 O2/Y/rsstsdt8c25+UNfvc1l1JR5S1EgXq+TfM6E/8LbLiyyrgbdGt7OC
 B/WF/li6fsUMFv95pcTyg69kiYFOyv2I2c1NWB8a9i5EWsCWuC/jScnUm
 UuQpFvmi+CfEpBVVFMo9eESAGX9LMwH2glB4Ddpa5dnN4jnHYSPVVgMTO g==;
X-CSE-ConnectionGUID: AyjQUOqpTjiz1FBa4J3Pmg==
X-CSE-MsgGUID: elvMCfYmTPu37sKf0tWSkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11549"; a="60088654"
X-IronPort-AV: E=Sophos;i="6.18,257,1751266800"; d="scan'208";a="60088654"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2025 08:31:22 -0700
X-CSE-ConnectionGUID: r9Suxat+TE+aILInfWLoAg==
X-CSE-MsgGUID: PeCV3HLNTgywVYkp4/o/dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,257,1751266800"; d="scan'208";a="178914611"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2025 08:31:21 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 11 Sep 2025 08:31:20 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 11 Sep 2025 08:31:20 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (40.107.101.40)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 11 Sep 2025 08:31:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FWVY1T5K/09/UexcmU75fYwQZRynMLCCungh3isOYyfJz9dVc7hD07JTQouKBuMg0zEZD5vOTuFOZ77nO4ZSG6qRuTKecRigRvqugr6QnmZjZgUBZ71Ty8hfoAVMpOTdOwFlZtbDBsA0Zl4zMdp9Uj8MQegCgdywPSU7ee7E+oc9w4yuUmi/Xp+5fdHPi8EvcM/apcQcZ8lFvzvj5mBkFUDjuPWDx0r4S/9x9yDzRrcGQZXCKwmJo79gYgbrgHIos5YGy2Gtbvkpn/yWwoLuqIWJ9/dqJAhNXTIykAd1DJ6vA/tgJzpoi0pFWJnADLW5RqDlUUa7ip8UKW6nVAQnUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bhi4Q7o8vebEgm6hw0hFPXM2SyjgUuSF6cnBeFZdFZE=;
 b=OdrAUyerWP+zeX6lbz0O80ePAAz4nQiQLXaSnNKtKFINxHiTEeKfXdS9nKVANV/ovi8m0vW+IgHrWNnTszQG6iBe8xojIhttlnprS/mjFYy9aAIj32tNBdKVn2IAFX6vDOGWeI2QavKffQpsjRFE5iJtGhoyOilFsjuaPLxKOfISJZYO/CwZptzlSKijSesDDpJP/h1ATohLeq3DQS4YcaiOVXAvmasiMK6hQOY70rH8qbE6jW2lMYlOTF6gxLeueARTzoNRSof6NdO7iuriJSxgPamVZrkLe6uvuwVhlWSYf1DrhrmUTFdm4f/M1OGZpIMteeuK0byo3CkoyVG34A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by PH3PPFF1A08ABF9.namprd11.prod.outlook.com (2603:10b6:518:1::d5f)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Thu, 11 Sep
 2025 15:31:12 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9094.021; Thu, 11 Sep 2025
 15:31:11 +0000
From: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
To: "simona.vetter@ffwll.ch" <simona.vetter@ffwll.ch>, "airlied@gmail.com"
 <airlied@gmail.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>, "tursulin@ursulin.net"
 <tursulin@ursulin.net>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "joonas.lahtinen@linux.intel.com"
 <joonas.lahtinen@linux.intel.com>, "ogabbay@kernel.org" <ogabbay@kernel.org>, 
 "thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "dim-tools@lists.freedesktop.org" <dim-tools@lists.freedesktop.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>
Subject: Re: [PULL] drm-xe-fixes
Thread-Topic: [PULL] drm-xe-fixes
Thread-Index: AQHcIzDtKwqJbGyjBkiJUNieGZdUK7SOG8+A
Date: Thu, 11 Sep 2025 15:31:11 +0000
Message-ID: <0be7f32d76d2062ac58697b0ef630fb5aea798b1.camel@intel.com>
References: <aMLq7QlaEPHGKXKX@intel.com>
In-Reply-To: <aMLq7QlaEPHGKXKX@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.56.2 (3.56.2-1.fc42) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CYYPR11MB8430:EE_|PH3PPFF1A08ABF9:EE_
x-ms-office365-filtering-correlation-id: 01940bd7-fd36-4469-b937-08ddf1483cb2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?RmdTWEEyTkNoSjAwM09QZ0J2NWtUdnNHRWRyQU8wZXdVK1BjTG5iWVduUmZn?=
 =?utf-8?B?SFd4ZHRta1RETnEzSVI2T2t4eGxNOHdDWm1ubkF3SEd2MFZzSTlUanRxa3hX?=
 =?utf-8?B?aE1SWngyYm5Ic2p3Y2pka09lRzl4bCs2WFRFVWNpbTJ5RWVBQUo0bkkzZTRq?=
 =?utf-8?B?QWtWY0dwUUJMMXVNTGY1SVRxYnRGaXFzbk1FRWl6VjV3RHkvZ1RIRGs5d2tq?=
 =?utf-8?B?TGIyc1ZyT1lHa0xYRnlJbmwwVmEvZ0N5SmVpdHAwa1FJWHJMa0hpNllIRHht?=
 =?utf-8?B?NFpWVytDSUdneFRiUXBpZ0xWYzl4RjBqdFMrdFhkelloT0xId0dpU0dsNEl6?=
 =?utf-8?B?S2pyVWI1OGlDbmJLZ1lCTTBrQlgyd1hhTkdOSXE1MEtENi9uQVJJSzZMQ3lt?=
 =?utf-8?B?YnZBbWJ0ZklybG5mZ1hESk9ZUHRPVW5KbnBxNlRrVHg3ODFDRWZ4Ykc5ZWN3?=
 =?utf-8?B?Y1F5TFdRTWFXWTV5cTVoeFpCVGozQXdha1lBcUZBNGtORnBvN0xrUFU2L0FN?=
 =?utf-8?B?ak01WlJPZHlrOXVXZEQvYkM4WmFoait4cGNoZDMrUyt1cmh4VWVSR3BRb1BV?=
 =?utf-8?B?djBTZ0Zmd2c2MkM0YXJPWFRHRk1mZXM0VXViMGFmcmhTcEZZNkhBOUtsL1Vq?=
 =?utf-8?B?SEI1bkx4ekdIakRQcy8ySk53aFErSGRHaEZFckowcDlHNTlodi9ZZEJRN2lD?=
 =?utf-8?B?N3dWamFGUVFCYkt0TjErQ0owZ3c5LzRkeCtpUUdOSmlYclZFRlZobWE3dHhY?=
 =?utf-8?B?WnNqbnAvbTlSdFRPR2txVzZiU2s3T21aemJ0bUR3VVVzRnlaQ1RDdlE1UU9r?=
 =?utf-8?B?amUzNlM0Z2ZySzkvZ3dodkpYK1NFUVFpUXBjYmQ2MnJheGxLbU41TkJxOVRV?=
 =?utf-8?B?Ylg2MHU4cGVucDA3TngzU1JianJpNGgwdWJjSStBRlRkSXRORUF1NjRlN0dN?=
 =?utf-8?B?eXUrWlk5aENvQzhCUFpWalVoU1UwckFUdEdnNHdsdG4yc2tBWUIrbXNUQU1t?=
 =?utf-8?B?THlkcFdaWFFucHJYbUlPR3ZEajlZOVVUSWs4d3J3VDVBaFRCSm5QYllXeFVu?=
 =?utf-8?B?OGJwUUFyTTJ0NXl5c2lyZUsranJLZmFHMHpxZFNLWkpUekZRT1BnbHQwajRr?=
 =?utf-8?B?T1VPQ21PcVEyak9xN3h3QlF0QnFCZ2dlZzlqSkFVTGVHZFVYRVNYaWREbEhs?=
 =?utf-8?B?WTJQMUFudzlUWk85NGNVQTNOSStmb25Qck9aN3d3eTdJV3JDMWJSdWpnZ0My?=
 =?utf-8?B?cGdpS0tPSUFHY1hhb3VGYUI5alV5SU5ZUWhHSVRydUlNMkp3NHZiL2ZRK2NG?=
 =?utf-8?B?ZWsvZTNGbXVjSnU4ZVcxYzJHU2VqdXcyMENEUUJrNnhtSkVvR0lDS2F4OHIy?=
 =?utf-8?B?RldTc3ZEcHdQT3hrL0xzU05MWk9ucUkySmpLWlNRSjYvWjFKMXhIbXdiS3Jr?=
 =?utf-8?B?b3pBZ2pUMk81WEVwMGhEUHNTSzFsOExndWRVYjJucDIweDN0YjVkV3BXMFFV?=
 =?utf-8?B?YlpjcSttUkdhVjJObkFBTFpDeXVNSmYwTUZKemI2UWdkTDFwYzArUHRtQlZQ?=
 =?utf-8?B?Ui83L0hEaHU1aHlLZS93SkZSKzArYjllenZWVmthQ3NZV3Q3SmpxYUxMcHJy?=
 =?utf-8?B?RmlBVmNtdHNQdkFlZDZ0cWpyNGVGL0lMbGpzdzZhY21BUkJlWHNWMnhoK21X?=
 =?utf-8?B?RC9XTWU4MzJlNFY5QmVIUlNzVUlwNU81UWxvL2pPZ2NDQVJraDg1SWMreEk2?=
 =?utf-8?B?cmhacTJpczJwOU9CS2JYUGFpeGRyQ3VkMTdBS2VtK0dvdUNyS1lmVUR6aDNt?=
 =?utf-8?B?aUQreXpxWTdsMUtsUGViWEpMa0lRWVZURll0cDdiS1JrQ2RPWWx4Ty82TGFw?=
 =?utf-8?B?aUFLYlZZczd3b0VmK3hKaW1JVjVwSG9vNi90N3dlZzlBOXRKdjFZTkVsNWhl?=
 =?utf-8?Q?/lWTRaSokOc=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QndOQjZPVnJuZmc0RW83NXBQc2JzVkZTL1UrWCtUSUpybk56cDRQNkNHUzNT?=
 =?utf-8?B?aThXSkd2clR2eUMzeGxHSmduVlFlQ3hqVGxOL1YwYkdOUW04ekVuZ1BkRStZ?=
 =?utf-8?B?SHFSNkZJMnFCa3VuU2ZId3NxTHBSUllBM2N5N2ozRG9FWHhHRDQrVVpKZEEr?=
 =?utf-8?B?OXJSalhxQjI5bk9YSkY2V2tDSldPazBHQnhlY2ZCa0NLTG52YTJ4alVJZEVV?=
 =?utf-8?B?S0svb2crUVB5S29ZSGFkU0tzQnN4Zmp2RjhObHgwVUg0Y1ZkcVNFWXNFUUIw?=
 =?utf-8?B?RGpzQjlCWlREbzFjcTBSajRraTVzemlWSjNLcEc3YW5OVVJjT25xa3FKMVVt?=
 =?utf-8?B?SnZtTFNBSVhmLzMrL0VmblRJR2RvV0NnN1pGd0hQRGxFSXUxRWl0dm9Ka01r?=
 =?utf-8?B?WC9SZ2xTTXJRNk9odjVtME5hOFAyN2RZMDFpVmJpaFY0SkpRSElrVEc5UERJ?=
 =?utf-8?B?L3JNNnVzcmpxYlBjM1FzdlpaOUQ1Qmsrd0xvVjNEcEFxZ0cvQ2VkSXJLaW4x?=
 =?utf-8?B?TnNPVDlPTHVBUm1uOXhzU1hUK2xyYzdrblZrRTZQS25HcU9CaHc4bzJjTHpC?=
 =?utf-8?B?SzJNVEMyL3Q3YTBlWjM0QmV2bE1udTRJZWVYeTRHMXBzOEZLcVVHQ0VlWFVH?=
 =?utf-8?B?dXI4VzNHWko2ZElpbHdPcm9VNS9xaExIb290N3dzRTVUQ3dIMnFWVlJtZllS?=
 =?utf-8?B?NmMzMUt2WjhoU2ZSMVdTTlFrdkZWK1lJZUFVNmkzM2d3cm5YdytMWnM3WDNo?=
 =?utf-8?B?c0hTWHRVNlQwSDRidmlQQjFhdXJXQnZZNWdiakk1d1pScGJ0RHJNVHdyb3lZ?=
 =?utf-8?B?NVp2L1lkRUxuWUxKVURVTWh4SklLMUduWDdmbEZkZHZLR2pPL2lwZ0hvUTRk?=
 =?utf-8?B?QUV2eWlhTUg5MGNCZDlvZUl2bXhqMFZ6L1J5N0t5WEVoNHF3YU1nM1VyZU5y?=
 =?utf-8?B?MVpKT1VDY050cEhYSFZOeWdKR0F2ZjdUcHFtcWQ1M0tYOGVBZ1FLd2IxQ3pz?=
 =?utf-8?B?YnVsVnV0MmUwdnhtRlJseFlpN3lxQWoySXZNUFFoWkxEaUEvaFlQM0JKSEZO?=
 =?utf-8?B?ZVdvUmpRODFrWmg1dWJoREhsU0d0NU9iNjZENnlNRVl3YXRsaGpuSUVxeVVE?=
 =?utf-8?B?TS9kZmxiMnBDbEZsRzJVRkpQaUFMc3lJZTRSUmhUcGU3d1owQ1NheWNFN0k1?=
 =?utf-8?B?WWZnVlpyZEZ6VkxJR2JDdktBVWlncEdIVWl5TjUxU0lrQnFNS3N5MmQvaUNM?=
 =?utf-8?B?bTcrb29qc3JxMEZoTnM1aG8zbU4yWDBTcXpFRXV5b3o2NGJDZzdTbmQyeVpL?=
 =?utf-8?B?bTRBOElkMlA5ajlBcTFORmpYR2RIbThDY3d3VWxIdzFuaDVCanh0NUc2SENm?=
 =?utf-8?B?c3hEbklETko1SVFNZVNLOTFGc0xLOWVwdmpFeWRwWkJETVBwNGYycGdWNXFk?=
 =?utf-8?B?d2tYRUNHWWhONGJRcHRFeS9FWWhoQVNiSmVTMmYvL1kvZXpSbkJSaGwvM3B5?=
 =?utf-8?B?M2xpT1paK2NGRVNSTEpjZWlnZjcyMHp6L3lUNnQySzEvR1J0Ny9nQTFiVG5x?=
 =?utf-8?B?MnphcEpEcUUwM0YyakZmQ09HWjUvc29YRmJaYW1sWFY0QXd1aG94czY0T3Jm?=
 =?utf-8?B?MFgrWlFaOWo4TDVhenhxQWMzanR5Qm9ja3NJaEEwdGthY3JQV2MyNk4yRzQw?=
 =?utf-8?B?aHhRQTFmcGdiNXAyaTFoelc4MHBOdll5VnBmSGw3QUVIaWVWN2ZWbitXWmgw?=
 =?utf-8?B?d1I2U3JYR1Zyc0J3dzBrK214STV4K2tXYmxUb0Nkc3JPRW1jeUZmVHNPM21B?=
 =?utf-8?B?OUpmdndUYWpaMzFaS3hRRUU5S1l4MDlvZEpNajQwSlA3Y2VkWmZMNE1MNjhZ?=
 =?utf-8?B?cjIrRmd0YUpjRXZVUU83SThTajJrVDVZRFcrN0lqUkpCeXUrb2FkeUExQjJL?=
 =?utf-8?B?KzJXSnpDZTJuTzFDV0toMW0xTk04ZVFUZWJrUUdsOFhPeGVGSk02clppQ2hk?=
 =?utf-8?B?WTIwNUFqSHp4cVNremkzQkEvTmQvZ2dqam96YmxaZnU3UmxWK3BhUDZLMmhU?=
 =?utf-8?B?bXUzVmJWU2g2dkxQd2JGcXcvL0hpNDJNalhrcFhoL2FVTndpUWEvOXVkWENR?=
 =?utf-8?B?KzVVOUd2TldQeUpQbHZnNEFDTWk1UW5SYzkydlcxUU1ZSWFTdmloWlgxWWJG?=
 =?utf-8?B?bFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <56533CF31768644C9AE64BE800AF95A6@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01940bd7-fd36-4469-b937-08ddf1483cb2
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2025 15:31:11.4390 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: paUY2dQCvtHi4F55H3UCCb4CBm1ygFWOK5moTPJRdvG/SJBSWwiMCKdlkSk+yfpK1SZ7wDlBtN1RM8CgUYofIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFF1A08ABF9
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

T24gVGh1LCAyMDI1LTA5LTExIGF0IDExOjI5IC0wNDAwLCBSb2RyaWdvIFZpdmkgd3JvdGU6DQo+
IEhpIERhdmUgYW5kIFNpbWEsDQo+IA0KPiBIZXJlIGdvZXMgdGhlIHhlIGZpeGVzIGZvciB0aGlz
IHdlZWsuDQoNCkkgZm9yZ290IHRvIHdyaXRlIHRoYXQgdGhlcmUgd2FzIGNvbmZsaWN0cyBpbiBt
YW55IGZpbGVzDQp3aXRoIHRoZSBldmljdGlvbi9zdXNwZW5kIGZpeGVzLCBidXQgdGhleSB3ZXJl
IGVhc3kgdG8gc29sdmUNCmp1c3QgYnkgZ29pbmcgd2l0aCBkcm0teGUtbmV4dCB2ZXJzaW9uIGFu
ZCBkcm0tcmVyZXJlIHNob3VsZA0KdGFrZSBjYXJlLg0KDQo+IA0KPiBUaGFua3MsDQo+IFJvZHJp
Z28uDQo+IA0KPiBkcm0teGUtZml4ZXMtMjAyNS0wOS0xMToNCj4gLSBEb24ndCB0b3VjaCBzdXJ2
aXZhYmlsaXR5X21vZGUgb24gZmluaSAoTWljaGFsKQ0KPiAtIEZpeGVzIGFyb3VuZCBldmljdGlv
biBhbmQgc3VzcGVuZCAoVGhvbWFzKQ0KPiAtIEV4dGVuZCBXYV8xMzAxMTY0NTY1MiB0byBQVEwt
SCwgV0NMIChKdWxpYSkNCj4gVGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdA0KPiA3
NmVlYjliOGRlOTg4MGNhMzg2OTZiMmZiNTZhYzQ1YWMwYTI1YzZjOg0KPiANCj4gwqAgTGludXgg
Ni4xNy1yYzUgKDIwMjUtMDktMDcgMTQ6MjI6NTcgLTA3MDApDQo+IA0KPiBhcmUgYXZhaWxhYmxl
IGluIHRoZSBHaXQgcmVwb3NpdG9yeSBhdDoNCj4gDQo+IMKgIGh0dHBzOi8vZ2l0bGFiLmZyZWVk
ZXNrdG9wLm9yZy9kcm0veGUva2VybmVsLmdpdMKgdGFncy9kcm0teGUtZml4ZXMtDQo+IDIwMjUt
MDktMTENCj4gDQo+IGZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0bw0KPiBmZDk5NDE1ZWM4
YTgwODY2ZTVlMTlmNzgzNTg3NmU3YjRmMjk0OTQ2Og0KPiANCj4gwqAgZHJtL3hlOiBFeHRlbmQg
V2FfMTMwMTE2NDU2NTIgdG8gUFRMLUgsIFdDTCAoMjAyNS0wOS0wOSAxMzoyMDozNiAtDQo+IDA0
MDApDQo+IA0KPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tDQo+IC0gRG9uJ3QgdG91Y2ggc3Vydml2YWJpbGl0eV9tb2RlIG9u
IGZpbmkgKE1pY2hhbCkNCj4gLSBGaXhlcyBhcm91bmQgZXZpY3Rpb24gYW5kIHN1c3BlbmQgKFRo
b21hcykNCj4gLSBFeHRlbmQgV2FfMTMwMTE2NDU2NTIgdG8gUFRMLUgsIFdDTCAoSnVsaWEpDQo+
IA0KPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tDQo+IEp1bGlhIEZpbGlwY2h1ayAoMSk6DQo+IMKgwqDCoMKgwqAgZHJtL3hl
OiBFeHRlbmQgV2FfMTMwMTE2NDU2NTIgdG8gUFRMLUgsIFdDTA0KPiANCj4gTWljaGFsIFdhamRl
Y3prbyAoMSk6DQo+IMKgwqDCoMKgwqAgZHJtL3hlL2NvbmZpZ2ZzOiBEb24ndCB0b3VjaCBzdXJ2
aXZhYmlsaXR5X21vZGUgb24gZmluaQ0KPiANCj4gVGhvbWFzIEhlbGxzdHLDtm0gKDMpOg0KPiDC
oMKgwqDCoMKgIGRybS94ZTogQXR0ZW1wdCB0byBicmluZyBib3MgYmFjayB0byBWUkFNIGFmdGVy
IGV2aWN0aW9uDQo+IMKgwqDCoMKgwqAgZHJtL3hlOiBBbGxvdyB0aGUgcG0gbm90aWZpZXIgdG8g
Y29udGludWUgb24gZmFpbHVyZQ0KPiDCoMKgwqDCoMKgIGRybS94ZTogQmxvY2sgZXhlYyBhbmQg
cmViaW5kIHdvcmtlciB3aGlsZSBldmljdGluZyBmb3Igc3VzcGVuZA0KPiAvIGhpYmVybmF0ZQ0K
PiANCj4gwqBkcml2ZXJzL2dwdS9kcm0veGUvdGVzdHMveGVfYm8uY8KgwqDCoMKgwqDCoMKgwqDC
oMKgIHzCoCAyICstDQo+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3Rlc3RzL3hlX2RtYV9idWYuY8Kg
wqDCoMKgwqAgfCAxMCArLS0tLS0tDQo+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2JvLmPCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDE2ICsrKysrKysrKy0tLQ0KPiDCoGRyaXZl
cnMvZ3B1L2RybS94ZS94ZV9iby5owqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKg
IDIgKy0NCj4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNlX3R5cGVzLmjCoMKgwqDCoMKg
wqAgfMKgIDYgKysrKysNCj4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfZG1hX2J1Zi5jwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCB8wqAgMiArLQ0KPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9leGVj
LmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCA5ICsrKysrKysNCj4gwqBkcml2ZXJz
L2dwdS9kcm0veGUveGVfcG0uY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgNDIN
Cj4gKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tDQo+IMKgZHJpdmVycy9ncHUvZHJtL3hl
L3hlX3N1cnZpdmFiaWxpdHlfbW9kZS5jIHzCoCAzICsrLQ0KPiDCoGRyaXZlcnMvZ3B1L2RybS94
ZS94ZV92bS5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCA0Mg0KPiArKysrKysr
KysrKysrKysrKysrKysrKysrKysrKy0NCj4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfdm0uaMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAyICsrDQo+IMKgZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX3ZtX3R5cGVzLmjCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgNSArKysrDQo+IMKg
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX3dhX29vYi5ydWxlc8KgwqDCoMKgwqDCoMKgwqAgfMKgIDMg
KystDQo+IMKgMTMgZmlsZXMgY2hhbmdlZCwgMTE1IGluc2VydGlvbnMoKyksIDI5IGRlbGV0aW9u
cygtKQ0K
