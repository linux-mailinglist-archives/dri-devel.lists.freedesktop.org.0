Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B84F1AD7099
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 14:37:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A62310E830;
	Thu, 12 Jun 2025 12:37:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IqW7rjsI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C418610E82B;
 Thu, 12 Jun 2025 12:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749731868; x=1781267868;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=eht4rkVD4p9w5PPFZv3RKSdoIC0y1K96EOqoH8ClKes=;
 b=IqW7rjsI6EGh87BnqMBeN8vEYyye6jvy0q0FAcIk4hFuK/QbU5tfEwgY
 BO3c/BhIC4bd5n5p/3rZa5NrTc7/lzdT40HagABjKfgon9n7S6PL6/RdL
 qZ33Asf6sTIvQtRaTgNJXzTLjeIcq8gvJ8mmTUjZcss0gG3rJn3fgrwYT
 8I/RW+0u7wq9LrtlWGXJMtX0MReDSYshJoE6JX0gNsbGgNbKuNL6r5J4k
 VMghjxKXgslG+YtEfaXIJNw3mPRt4jQwcYp95UhyiYFxr316CZh5HJlxG
 fm2JKp+x8T1DJD+yILN31SzGHUyLn6TwePo7odbUxrxfn7q/9MnLtBb4U g==;
X-CSE-ConnectionGUID: cMl4/XYxR3KA4HZisfMhPQ==
X-CSE-MsgGUID: G7siyWX+S8CONl6R0Pmc3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="51782646"
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; d="scan'208";a="51782646"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 05:37:48 -0700
X-CSE-ConnectionGUID: e2h5NrU0SXWRfiyPUS/bcA==
X-CSE-MsgGUID: kOydk+UjQbK/s6XS0vE+QQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; d="scan'208";a="151329163"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 05:37:46 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 12 Jun 2025 05:37:45 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 12 Jun 2025 05:37:45 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.47) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 12 Jun 2025 05:37:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gjLtsn04ttMWM6SFbOdXZRKTob+pqh7Yv/5r7K/K4Qq9CaiZWsU6mW+9Go1bl9TxUY3IU5p50uK5voA8PkpVt0QBUfYNt6qIAFlow1kd7VaHAsKUPlIWmPTE7YYpQUumF5qcVPfIQjfxPlWTF40ChbDmT3HPunB9KnxikilyWzrZSW7Scti4eCS3VKP1EK8TwpOrCPe9z2rFj+2FOAAt37hD3LcfIx7snfxuDZ+RXQPjXGFTxJeLUcvdDpzxKuo6Xzdmp6ECA/g7IqaCJ8efi2uU/mdMRrx1snKT++u73AE2gtXKOn6EP9Z1QmSSciQPTyTkDhTTkrJcX87JN0awSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eht4rkVD4p9w5PPFZv3RKSdoIC0y1K96EOqoH8ClKes=;
 b=yB3p/FFyaPg0QxeELoN9jyKgvsZOj++1+ekcjUiAwuCC0o7bJWpCEllvLwd+buvpMip/TA4rkeseKqovnd9wTkbSmjJRZnBEDgFNhsGiveRW+OjNVE9oLLF1/zMX1DfiuwPGMqebdV8ECFUygyKBytur8XG8wrC/QB18eNWu2FfDmEW2ESFNPuFedaIQYodzPdW0pRsdENVV+b+tT+CrdKMfV87r2Y0vRPoDKHTRWjj/BEB+qsnnqNFTnY7zSXhYuwU0OT0CxCNmB5Q2kFdHMyJ/NjL+8WJYrmNSpz+4R8mDDUI6Wn/eqD0i1q3jNz6m7QEvfOUqKQcVOwBjoCPU9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6366.namprd11.prod.outlook.com (2603:10b6:930:3a::8)
 by IA1PR11MB6323.namprd11.prod.outlook.com (2603:10b6:208:389::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Thu, 12 Jun
 2025 12:37:36 +0000
Received: from CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778]) by CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778%3]) with mapi id 15.20.8835.019; Thu, 12 Jun 2025
 12:37:36 +0000
From: "Usyskin, Alexander" <alexander.usyskin@intel.com>
To: Richard Weinberger <richard@nod.at>
CC: Miquel Raynal <miquel.raynal@bootlin.com>, Guenter Roeck
 <linux@roeck-us.net>, Vignesh Raghavendra <vigneshr@ti.com>, "De Marchi,
 Lucas" <lucas.demarchi@intel.com>, =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0=?=
 <thomas.hellstrom@linux.intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 "Poosa, Karthik" <karthik.poosa@intel.com>, "Abliyev, Reuven"
 <reuven.abliyev@intel.com>, "Weil, Oren jer" <oren.jer.weil@intel.com>,
 linux-mtd <linux-mtd@lists.infradead.org>, DRI mailing list
 <dri-devel@lists.freedesktop.org>, intel-gfx
 <intel-gfx@lists.freedesktop.org>, linux-kernel
 <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v6 01/11] mtd: core: always create master device
Thread-Topic: [PATCH v6 01/11] mtd: core: always create master device
Thread-Index: AQHbi35N9ptLZMK+/0+KHmcJoUKk0bP5FNKAgABXSdCAANahSoAAWdKAgACSaAOAACUigIAAFAQAgAAhxhCAAAxMAIAAXViAgADet1B87pkdB/wY57yAgAEiYbGAAA56AIAABaLggABFNgOAATvKgCORNoJK/uOiyTA=
Date: Thu, 12 Jun 2025 12:37:36 +0000
Message-ID: <CY5PR11MB6366A8123B5FDA2BA2A2849EED74A@CY5PR11MB6366.namprd11.prod.outlook.com>
References: <20250302140921.504304-1-alexander.usyskin@intel.com>
 <130790886.134361099.1749560056731.JavaMail.zimbra@nod.at>
 <c90c8bad-9c7a-4bf7-8282-ebefebba90a3@roeck-us.net>
 <877c1ivcym.fsf@bootlin.com>
 <1612313571.134371311.1749637592940.JavaMail.zimbra@nod.at>
 <CY5PR11MB636692EFD9BB99B6F2D959BFED75A@CY5PR11MB6366.namprd11.prod.outlook.com>
 <87y0tytjmj.fsf@bootlin.com>
 <CY5PR11MB6366DA38B20B29C1662BDC76ED74A@CY5PR11MB6366.namprd11.prod.outlook.com>
 <1466250376.134375386.1749723930972.JavaMail.zimbra@nod.at>
In-Reply-To: <1466250376.134375386.1749723930972.JavaMail.zimbra@nod.at>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6366:EE_|IA1PR11MB6323:EE_
x-ms-office365-filtering-correlation-id: cb44b5d7-cd82-4bf2-641b-08dda9ade97f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|366016|376014|7416014|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?TlNrcUlYUnVsM01XeVkvV210OXFEQTBkRkZ2VEhZUFRBeG03T0tDRy9rRjN4?=
 =?utf-8?B?ZjM4Z0RYUGNxUzFZZlBQUEg1TGFOcENBT3pFd1BsTENRRmMwRC8xYjR4UFNm?=
 =?utf-8?B?cysyKzFBUTcrUzVaSkNKYW5WRFNjSUVVNEpLTkpYRE9FeGVVWjdLOFM4LzlF?=
 =?utf-8?B?cG56TWNBb0lwRE1tYklIU245V2VlOFVQYXVRRTFvN1V3by93ZnlQRUVHQnM5?=
 =?utf-8?B?WFBQZjhBZ3ZNK291am9NWWEzUFAzeHpYTTdWMlN6VjRwUTAwQTEzZmJlMTNI?=
 =?utf-8?B?TEdNNzllcUd2VzdvRXpWc0pEUW55OXlncUg5MXJDWnJwaWw0TmlmSDFrdGdn?=
 =?utf-8?B?WXJqUVdNenFuWlFxekNoQ0gwb3NQQ3VOci9XaVVjTHJneDFSdmtQcWd6Wi93?=
 =?utf-8?B?c1M2RnR5SFJVY1RmcnFObXN6akpSc1RyWXNzMm9ldW5jTk9uVWVjdStoQ01D?=
 =?utf-8?B?M2NKQ3gvaXNkQVhLY20zMEFLUTMrdFFKUEVoTUJ4eHR2dDM1eDhhVUhGbzJB?=
 =?utf-8?B?dHhRK3FkM0VxeGFuNS9KcWFYdVE4S1pQZDFFQXNBeXhFR1pzeGErWk9iVlFJ?=
 =?utf-8?B?TEhNdE94Y0ZJTkdDNUZ6cFFzNGNJS0lpVUF2Y3R0VWJEZUhnZEJTZ29MWnQ2?=
 =?utf-8?B?NzQ3UXpKRUkvQmYvdzZSeVNJdUJnczFGM2NGTzR3Wkk5TEdGTUx2VzZ5M2dS?=
 =?utf-8?B?MjB2VnRiZGJDSGVzOWhuWlQzUDdocHEwWFNuSjZHRUtocWo3dytSeG9xVGNV?=
 =?utf-8?B?ZDkzb2c1Njl1U0lJc2ZQNXVWZnVjMHpCcVFsVXRMRTc3QU5kekNQUzI4RC8r?=
 =?utf-8?B?Y2hKVFJ5akVickVCQjhyOVA1bUxraCtTVjl5MXo4Y1p6bW0yelYyZzlkUTZz?=
 =?utf-8?B?Z09aU0sxa21pVTZQTUlLTEFXUHNoNFkrSDM4S0lJTWxwNmRWTWc2WVEzdXpI?=
 =?utf-8?B?WXJ5NzF0dWlZTkNmeUNBV09iUmN4RzZHblNnQmhKVDdlVkpHWml1UjdYS1hR?=
 =?utf-8?B?eVF4VHdKZUdqZGI2eS93QVE3UDR6cXRkMzRkNnVsMFQ4cis1NXBSaFVDRjB5?=
 =?utf-8?B?c3VyaElUelRMdHlOS3d5WXR2dkFaQ0RNWjJvc0xhd0xmbWRmUWxPNWlLcnlu?=
 =?utf-8?B?RnB4V01Ea3pYc2p6d2w2Y1B0MUhSSU15VlJuNUQ2eUhlZDhnMk5YS3lXNlBO?=
 =?utf-8?B?M3h4alJ4SnE4THE1WFBlK3l6cVlQa2JVTUU2UUNVUG1aVFk4QlVUaGIvZ0dW?=
 =?utf-8?B?WkJoWDhqd0VQc0hGSVpyYkpSMG9xVmJsVlpVWEV1VDMzamoyL3dPK2E2Vjlq?=
 =?utf-8?B?aEFLNW1iWlB2eFYwbGhPc1E3S3UwSEM5Rnp3N0QxZjZIYWJUaWUraVJvVmR1?=
 =?utf-8?B?WEk0LzJJTHpzSDAzVk1FL3ZJWUM5aTl5UHFMQVQ4eE1vWDY2eVVwVXE3aFha?=
 =?utf-8?B?S3h0bHFJZXBVeEFLNHdIUVZ4MW9LSnB0eHJCMUZaVEhYSmFsbzJIaFVTMVE4?=
 =?utf-8?B?SHV1ZTRHbDROckxYMjlKbUJoanpuS2pTdEhKSkdwY25RQklld0RUK25OKzRa?=
 =?utf-8?B?dEhiK0dDYkZxRncwU0tERlNQMFREWjdzb1BsVk1pQ3NmcDlCVUZkVXZNd2pH?=
 =?utf-8?B?QnJXRHI2VmlvTmxxRm5XQllGSmtFLzRKT2lKQmtvbnlQb2F4djFISzdLZEpr?=
 =?utf-8?B?eHpSNmRRTWtWdmxoQmdVeEhJL1RVMGJaczNpWkZDbStNSWlCTjI5MDBZNWQ0?=
 =?utf-8?B?R0V5aTB2a0tGRU1KU1hQUkdSL2lDd0dvVVZXRDczZWRLZXBrNS9ISVQxVUVr?=
 =?utf-8?B?ZE50MGRORGVPT3c2R1RRNHNNQXR0dWN3anFMS2VPb1p4ZzdGdmtkVlFaMUxD?=
 =?utf-8?B?bFFsd1AvNzNVak95cjFJQnRyTk1JV0lRb2M3N1JVSzI1REZycno3MS9HYWJK?=
 =?utf-8?B?aGplcUtueTNrUW8vakEvcE16WHl3dkNlZ3NIeU02MGJnME5SQzRRenh2S3lu?=
 =?utf-8?Q?v+aCu0eqazpCXMlWjGfC8sjVcmmtlY=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6366.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(7416014)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cHNPOG1GejMrNHdjUnMvUDVxejVaQzg2RFJjVVJNbnBsdTh0ZlU2ZXAyaUZM?=
 =?utf-8?B?a05kWEVlLzJvU09sSytndFNhdmFaMUFVOElxUDVVaTkrQnpSMEVlT3l0aU92?=
 =?utf-8?B?RW01M2FrbHlnTUR2VVRCRDI3Y3Zua2JlZDJ3ZU5oeUJKSEVYdnU5YWtlZm9J?=
 =?utf-8?B?TzlCcmxVSXZCVnJHNUVUb2pBejg5ekEwNUN3STFxSE1xUjVuWW9vQlpJbGUy?=
 =?utf-8?B?U1RtblQ2a0NKcGZTUE5mSk42QmQxVlpLb1dyb20vWHkwc3lmSHlZd0cyOEpo?=
 =?utf-8?B?MkRnK25kbXRFc0p1SHNvcTBWYi93azliUTlWVXlBZXhnK0tLb0dVeTVnUTJU?=
 =?utf-8?B?Ui9RUEZJTy9ocFRUNlpmek5MaDVoNGFXUU12RXJCMlR4YVBNaG5iang1RktR?=
 =?utf-8?B?dS9la3pnUFkyV09iRVgwUDdRdWNTbmc0KzIweWU4TW03WFRtS0QwK092cXND?=
 =?utf-8?B?RHNEc280eWtadVp5TWRWajBDeFEyUWNJK0pNNytLNEs0ekpSV3ZROHZuTk1t?=
 =?utf-8?B?VjFQTnpyakhBNlhKK3VsQ3o2K1pYNm1WYUpRMEZMYU0xdzJldm54ZCt4TkJn?=
 =?utf-8?B?bG1GZ2Fmbm9qQmFGcjdxTE1ZTnBPNnB2MjNTMXIrWWdZUzNYRUYybWVxdThP?=
 =?utf-8?B?dG00eWNrSFFnamREdkUwT05tVUlFNlFydWVzTmZ3dEN6eVRyNnNzM2ZSeit6?=
 =?utf-8?B?aThaRlhPMGh4Q2owQnV4Y0p4S1lXcGVrQnRoZ2EzZXlDajNnNU9qWktRQ0hS?=
 =?utf-8?B?MkFyMUhIUVV3cWEzdk05b2VGZTNIV0tXelhOaUJ5TXRjZzB3THZ0V2s1SEVv?=
 =?utf-8?B?dE9jSHpJTXJsdkJGQ2NpWVc2V3cvV1VIMjlNM0VEeFNIWE13VWhwUDU4QUpy?=
 =?utf-8?B?eHk2Y2FGYlRmT0syQVJvWmNRV2JoQ0FXWXJQTnl5OHlsMy8rWExMamQzYVpy?=
 =?utf-8?B?bzZFSU1xZHpCR3JQQUEvMXlJL09XUHpITmVYTkh3Yjd3V3FYcGdtS3pjR0Q1?=
 =?utf-8?B?Q1pkc2FuVkF5TmRGMVkzOUthMmZjV1M5OG0ybkVyQk95dWx2L0Jpa3ZmOHFI?=
 =?utf-8?B?TVpQSWtrUThvM3VQYTN1azhTZXRHcnVHMWxXbmVhOXp3QkRjczAzaXJBWnlR?=
 =?utf-8?B?VmU4ZXRVUVJsVXZqSXJ2bzNSNExlQWtlbSsyY2RFUHY3SEFrdW5iaDFCcGQz?=
 =?utf-8?B?SGthUERWMWJCR0ZqZmx2L21mYmdmenBRTUQyaU44d2lXQzJIRDRpUG9aclVu?=
 =?utf-8?B?NmFtSkNUYkkrSkZJUG5ucU1TMXh0VlYzMzV4aDFBVWNDbE1hWE5POTlDYlBp?=
 =?utf-8?B?VC8xNnhjRkJpUUFIbzdodkdRT3N6cXlySEV4eGo4SXg0UmFIalVPaXZYTmxN?=
 =?utf-8?B?ZDFiNitDMW1mUGozMVFyNnk3cTg0LzJoQ1FkNitBUmU3MVY3RlNKb2ZpeFFx?=
 =?utf-8?B?QkU1NUlGZURXb1Q2WGZ2eFh4ZVlPcFlHTlJzdUF4c2FNb0R4WllLeGFmaDJB?=
 =?utf-8?B?TG9ycWN2N1pqeW8vSHpMbGhsSDZiWnVGRitsMGxrenh6U2NNZkNOcURMaUVR?=
 =?utf-8?B?eDdoUVQwRmttMkhBbGovT0RHekUxVkkyazZOS3Y5SGJkc2U5Tm1SN0R6QUx4?=
 =?utf-8?B?Um9tdVF3ZlNKdVcwWUtlcHRSTEw1L2tMV3VBbXRsaDlqcEpzMVBrcks3dWNV?=
 =?utf-8?B?cittcFM5RDNHUFJ5V2RXUzJsb2JvMEhkYWp5TnZnRWY5Tmw4Yk1uNUlJQjlK?=
 =?utf-8?B?NkFOZE1UeGtyVlVpSzNnWlpXY1pMTkptcmJkSU0vR1VPSXc3ajQrYVM2SHdl?=
 =?utf-8?B?ZnBSSUJsYlFTdGNDQlQ3ZzdlVllNQnY4bXdSalZsdjJRUlN1WjJubVl3aU9r?=
 =?utf-8?B?VVFMWnE1R3ZDanhxMXVDMVpDNEpDTUowV2NrREtIclFubWZtcXYyOGloanBs?=
 =?utf-8?B?eTdzV2F2dmNtNEt3OU9pZHJnTWJweUF3ZktoMkprVHZJU1kvVXMyb08zNlVh?=
 =?utf-8?B?ckxqQUZIYm42cS92MFVxVlMwT1VQdWZQOXovNzJsOEo3RFV3SDk1WTl1aSsz?=
 =?utf-8?B?M0hUNmdiNHdHRGdjQ0dxK0Y0VUhVeVh5VTZ2cmtLL2xzcEI5SmlsZGdsWldv?=
 =?utf-8?B?aHVXOFpkQ0dLZXhrejhNNE8xZjJPRWNUb2NlTE9Ndm1mSS9Rb3ZNNmpWd3hr?=
 =?utf-8?B?VG9qUDJ6UDI5NFloL3g0YjVPNmRYZHVDQy9GaHVDSVhXN2tQYkJRNzEwbGdU?=
 =?utf-8?B?MmM4MUxtQ1ZlblVkZDdjTkZ6WmNBPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6366.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb44b5d7-cd82-4bf2-641b-08dda9ade97f
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2025 12:37:36.7912 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0euRYzB1cwyPGkx74SVsfW8HDwWS0Zfd0w8PnzsBRT++T0XVJv9O7RTR+TJRz5eP4ECGIwA1NRBT9sbUcmLVzyDi8g5IVdoGPtB/yaBxEgM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6323
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

PiBTdWJqZWN0OiBSZTogW1BBVENIIHY2IDAxLzExXSBtdGQ6IGNvcmU6IGFsd2F5cyBjcmVhdGUg
bWFzdGVyIGRldmljZQ0KPiANCj4gLS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQ0KPiA+
IFZvbjogIkFsZXhhbmRlciBVc3lza2luIiA8YWxleGFuZGVyLnVzeXNraW5AaW50ZWwuY29tPg0K
PiA+IEluIGdlbmVyYWwsIGl0IGlzIGZpbmUgZm9yIG1lIC0gd2UgaGF2ZSBwYXJlbnQgbXRkIGlu
aXRpYWxpemVkIGFuZCBwYXJ0aWNpcGF0aW5nDQo+ID4gaW4gcG93ZXIgbWFuYWdlbWVudC4NCj4g
Pg0KPiA+IEkgY2FuJ3Qgc2VlIGhvdyB0byBiZW5kIGlkcl9hbGxvYyB0byBhbGxvY2F0ZSBmcm9t
IHRoZSBlbmQgYW5kIGNvcm5lciBjYXNlDQo+ID4gb2YgZnVsbCBpZHIgcmFuZ2UgaXMgYWxzbyB3
aWxsIGJlIHByb2JsZW1hdGljLg0KPiANCj4gSSBleHBlY3RlZCBpdCB0byB3b3JrIGJlY2F1c2Ug
d2UgY2FuIHRyYWNrIHRoZSBoaWdoZXN0IG10ZCBJRCBhbmQgcGFzcyBsaW1pdHMNCj4gdG8gaWRy
X2FsbG9jKCksIG5vPw0KPiANCj4gVGhhbmtzLA0KPiAvL3JpY2hhcmQNCg0KVGhpcyB3aWxsIHBy
b2R1Y2UgZGlmZmVyZW50IGlkcyBpZiB0aGVyZSBhcmUgdHdvIG10ZCBjaGlwcy4NCkUuZy46DQpC
ZWZvcmUgcGF0Y2hlczoNCjAgLSBmaXJzdCBjaGlwIHBhcnRpdGlvbiAxIC0gc2Vjb25kIGNoaXAg
cGFydGl0aW9uDQpBZnRlciBwYXRjaGVzOg0KMCAtIGZpcnN0IGNoaXAgcGFydGl0aW9uIDEgLSBm
aXJzdCBjaGlwIG1hc3Rlcg0KMiAtIHNlY29uZCBjaGlwIHBhcnRpdGlvbiAzIC0gc2Vjb25kIGNo
aXAgbWFzdGVyDQoNCk9yIHdlIHNob3VsZCBtYW51YWxseSBnaXZlIHJlZ2lvbiBmb3IgbWFzdGVy
J3MgaWRzIGF0IHRoZSBlbmQNCm9mIGlkciByYW5nZSBuZWFyIFVJTlRfTUFYLg0KQW5kIHRoYXQg
cmVxdWlyZXMgY2FyZWZ1bCBtYW51YWwgaGFuZGxpbmcgb2Ygb3ZlcmZsb3dzLg0KDQpQZXJzb25h
bGx5LCBJIHRoaW5rIGl0IGlzIGJhZCBpZGVhIHRvIHJlbHkgb24gcGFydGl0aW9uIG51bWJlciwN
CmJ1dCBpdCBpcyB0aGUgc3RhdHVzLXF1byBub3cuDQoNCi0gLSANClRoYW5rcywNClNhc2hhDQoN
Cg0K
