Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5975F891347
	for <lists+dri-devel@lfdr.de>; Fri, 29 Mar 2024 06:38:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9313D10E841;
	Fri, 29 Mar 2024 05:38:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lRZrAi/O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C921510E841
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Mar 2024 05:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711690709; x=1743226709;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=h/CYT5kWcn+iJRtBYYXcDMeAxSjY7fYJ9mplAZxjaQU=;
 b=lRZrAi/OOIjmmgGccOLP9i4MdacCarfy2LLbSCA+rYafHq/ITDlT62mT
 Nv1RkyF9+6cnVZdFjPaMIKmRfxwgg9mRF5mU/9knfRQ8I6/BiWvTvjvoD
 zkAUrJH2KsmNXZ93ZyRQPbhVL5l/NnM4ZkH26lMSYhrrB0dgNqAcH8zy4
 qJotrRwSTb3mox8ABvVZfWW97kPTJJvBHA+OSE2Gek5t/7NvqXaXkyi1R
 qqd6oYGEZ7rgZ/bTpXdyS/Pssv+oXmxnig0BQAxNNR4AAuZitbxlhg9eV
 eLYs6zMU79+ebnEfP2L+BZ/lpQjxGVnAacmfxcjFHX+en3taWnC/iet77 Q==;
X-CSE-ConnectionGUID: FKBmWRaXSW60wmUDX9sOlw==
X-CSE-MsgGUID: wvkmeunpS8qaa1/eJE2c0Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11027"; a="6738428"
X-IronPort-AV: E=Sophos;i="6.07,164,1708416000"; 
   d="scan'208";a="6738428"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 22:38:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,164,1708416000"; d="scan'208";a="16929230"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Mar 2024 22:38:28 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 28 Mar 2024 22:38:27 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 28 Mar 2024 22:38:26 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 28 Mar 2024 22:38:26 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 28 Mar 2024 22:38:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UP9gtP0/AD5smss7yKBFrxuCB+ySFEHs+QR+2R2jxgEKywLmIDZ2IYPMK5kD2pZBJFzC7e9xAI5YiWQlj5hWAupgp2MMYUqoXSy8y2W4bxRo7pkLWiCzEd4r6KinDHrtSEZAWesmx31iC2V4kvhM+pJ4zBXJl2Pu6124Ajzj7Ip6vrfuqHxUpWacrle2c0Lo4eA9tuIMRtHO/9ekG3nI6K13GrmPV589SRzvdjQHqRZvaObPPK5KYVsJ3qK/hGfu8iFlJ+pJO05nqVQxrUHCNwxtXl27cOOBKbH8eqeP4CVW3eSfPmmwe9iXVzGw3jw0LbbxEvRj0hY6FJoVSF+LmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h/CYT5kWcn+iJRtBYYXcDMeAxSjY7fYJ9mplAZxjaQU=;
 b=YuX/kBGHq97Z0mLb8RUCQPyeZkBfrCjwp1OSuzktOG4cS15NC5jqsccnuetQIaeJkT4K18pWrqat01rs0zaGBGeRThhYO79eyHlf5CjBhyAJmAwDzGhFBd+bmxiZFETMf3nIFa0YTKFJdqMvT2KIEN9uOQZZzN3Qhd1GDRQvh1sN8+GZs/7X85kxv+H4rMgsRYAip1iEcEjyYhL74q9hmq/Mbhb3owlkS3vYsa5hqSUPiQIxjUAESDj4PXiG44L7UOpym2ASgtz27lEV2EC92EHNNzSq/IJP6qW+0wJyu2CVpZD1chthyQptrVKtBSD1aGNdICuM+5d9uB3Vp6deTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by PH7PR11MB8569.namprd11.prod.outlook.com (2603:10b6:510:304::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.32; Fri, 29 Mar
 2024 05:38:25 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::e3f9:2341:bdd4:913d]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::e3f9:2341:bdd4:913d%5]) with mapi id 15.20.7409.031; Fri, 29 Mar 2024
 05:38:24 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: David Hildenbrand <david@redhat.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>
CC: Matthew Wilcox <willy@infradead.org>, Christoph Hellwig
 <hch@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, Daniel Vetter
 <daniel.vetter@ffwll.ch>, Hugh Dickins <hughd@google.com>, Peter Xu
 <peterx@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>, Gerd Hoffmann
 <kraxel@redhat.com>, "Kim, Dongwon" <dongwon.kim@intel.com>, "Chang, Junxiao"
 <junxiao.chang@intel.com>
Subject: RE: [PATCH v12 0/8] mm/gup: Introduce memfd_pin_folios() for pinning
 memfd folios
Thread-Topic: [PATCH v12 0/8] mm/gup: Introduce memfd_pin_folios() for pinning
 memfd folios
Thread-Index: AQHaZ8QF8GidvEpiVUu9Z8Zm2SwyH7FKYVyAgAONYQA=
Date: Fri, 29 Mar 2024 05:38:24 +0000
Message-ID: <IA0PR11MB718598D9C3E7AB0F9B5E21F3F83A2@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20240225080008.1019653-1-vivek.kasireddy@intel.com>
 <205e0755-5dc8-45f7-8d9f-59dde9951307@redhat.com>
In-Reply-To: <205e0755-5dc8-45f7-8d9f-59dde9951307@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|PH7PR11MB8569:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hGtR0uI9v7AGpgNc6Ovf1BehtggvDxxLJ71USYoGTqSGFZNRGlGR781RcUSulQs7JRGoKRajw3nFcG96XWOruLjuAobq2vG9uRo0KUpiuJ4gxhDnwQkTXSHVsf63UMUzxgvXFIT7uyirCAnVBlUZ1SkzCuVWmWAp3+cMuFzNtmA5l3vm7UT4fevw+/xTb05YnGtLD4q+zWT/97WqcLR/AGdlIfLjzjdxyP6c/A7ohbkQcJ+wBxuUJjYc1YRfIe7shhlJs+VdcA5hHwJIDz7NKTJiifzgvdj6KdVvFfGxCuFftMEJByctL50pujmc7EwOJ3N3FsFyAXc+pnAO8N5OEHgSvf3V4ILxG7ddzQQMgOjdKN7pGYNth9FRBaSGo0CAXdw4GKw5ejWiF/A8yyjmayy8V5osHCDcEFYnYeSvdTGGh2r6G+z5qFBQb+9lyTVQKr5ugdbeFfcTVDqRhsDCEUQuGZ1waLZKnruuYwlker9cE0pIyvMoFCx7oR1+FZIdw4tjmleiBrH8R/ncKrkAIoXZUAMpuwU4KNQOW+zYw2b/ctsMyO/aNuFoXMxcMx5f69EWw26m3iuYm0ZHu+IqH2wMfNV3z/yUEM1S4MXzARhvuTuF/mhsRl5gNQZR2XRUyMVRc1EdevTE8x5djpJxy5J3cNXeF2qRSTBx+czGQVc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(7416005)(1800799015)(366007); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?a1JkaHpPZW00alRlejBtYy9KVWJnUm83Ym4vNG1HeER2cmQzbjFyKzUrNDZz?=
 =?utf-8?B?WVNtK0UvVXJDMlhJU0trVGc0MU9LWE8rUDgzcnpScmpQdHB4UDB4M25jMk5D?=
 =?utf-8?B?V1lCdGE2NHY4ZE00UEdvT3hEQ3crVVE3YXArdE50SW00SWJBVUl4NWNtbit0?=
 =?utf-8?B?MTlXSnRTaUIrbTdPZVMxRlM1T2dwdHVHcDlZTVFyd1BHd3hWNnZ3ZzcwWGpJ?=
 =?utf-8?B?RXVYUUJ3cXNIYjRPYmhZQWRObkkzTnRsS1JCZVoyTXYvR2FTZTZnd2ZZSjgx?=
 =?utf-8?B?akxQRkdJMWE2cnUySUxYWmFodFp0MTN2SWsxRGJJa25kaTRXbDBVbkhUSUV1?=
 =?utf-8?B?MUU1RG9BUHJ1UkRpWEpBWXh6aEx6WWc0WXViMHM1ZEFhL1RpNUZhVC80SW5R?=
 =?utf-8?B?TkV5cXAyREF5N1p5aVUrMWE0NE52L1k4eUZwZEFkZktWWmdUdER1dWZ0a1Np?=
 =?utf-8?B?aFI0NkpiQzlodVpaU04yM2hIenZRbVRYcmRDdGw5Nmt0L3Q2aG1JWmNwTnpu?=
 =?utf-8?B?bkJDbzYwUmd1VndHZDRWbEUrYVdvUGVoRzVVMXNwUjRGb3I5eXNwREdoWTBX?=
 =?utf-8?B?K0hDVjJQUWJnUGdORmc3YWZJVzBaNWxPN003aXFlNjdsRlZiMlJxaFZLUnFT?=
 =?utf-8?B?NHJVdHVTZzdZS2dQMVpoUUZXMEloYThOQ3RGeVcxeWFPekY1YU1vSXhGUUc0?=
 =?utf-8?B?QXdEMXBCcVZDanFTeXBBVGxWWGkwV0tBU2pEVWNmWW51SmlENnZwODgzdlVP?=
 =?utf-8?B?U3o3V3VZNndOdUYrTUVtdlg3Wi9STWZIa0VDTXFBeTgySW9wN21wRmFMb1l4?=
 =?utf-8?B?Q2htVThudTIxbVlpM3JPVHl3TXZPSDd1R21VZWxIcUNnaTJaTndnT09NcVZm?=
 =?utf-8?B?TG9QSHNtYmgwT044YTZHd2JybG95clV3WlNVTTJrMWN2ZHFyNkxESlQwVTQr?=
 =?utf-8?B?TENGQXJ0REFBUU03UFQ0bnJWV3lTdmFhYWJ3cnJ0M3pYUHVQcytaNDMvVmxh?=
 =?utf-8?B?ZTFmY3UrQ2hVOEhueTZ1NzJPUmc1ajVQMnZGcmlwWHpPbmxxRDF2bjR2Z2dx?=
 =?utf-8?B?TEptMzdRNVJmRFU2Q3JnOE91OUZjdXZqU0VrTmlseVBSeC9DRVZKbzhXVU02?=
 =?utf-8?B?U2JKamxieXpqV01wcHNDeDBKbHZxRXROQzdyMlZxY3NYQStyV1VtSGdBSEg4?=
 =?utf-8?B?bjI2cTltMllvSnFQeFhEdWxJa3BpMXFGZ2g0dEF0Q0Q0UlVQcHlxMG84Tm5q?=
 =?utf-8?B?dkM2QjkrQnBleWN3dUt2enJPWE9rL3lvWURsTTlFOXNSVDJmZi9CMlR3YVlo?=
 =?utf-8?B?enFIdnhvTHJJT3M4UFZ5WGJqbU54a1UzRTM5K2NDdHVxRkxlRHpPNzUxU202?=
 =?utf-8?B?MzQyMEhUYXIzczZseElicjlBY2dIclh6ZUpSSzhDdW1ZVnU5ZzV4aXlxUXQ4?=
 =?utf-8?B?NS90MFdqSGQyN3hLaUJHS1hUK0RsS21XVDhhOWZiM3F1OGg1VHpjWDJoRk1J?=
 =?utf-8?B?c0E4UVMyL0gyVHJqL3FSeWFaaXVnZE00UkVkanY1MG1aa2NuN21jYTllb1VF?=
 =?utf-8?B?aXd4Y2cvQ2lrN1hvMUl6OWpnVk01L0huT0d4MnMxendoUlFqSWVOZ0dycEhZ?=
 =?utf-8?B?Q2VxRmFTdkp3aDZLVzhTa21BU2pmUUI2alJ5dW5OZ2pUeFlGS0JrUzV5V1VE?=
 =?utf-8?B?R2FoS0liOVRrTWd0dVNEVDlsU0JOTkIzUDBDNURoMjFZaWxTMnpXWSt0bDEy?=
 =?utf-8?B?OGVFM1pDUFBxeXRpeVpLUEFiNXFPRXJVOTFqNUN5VS9BTEh5ZnlRa2pQSXBj?=
 =?utf-8?B?VGpSUTF0cnJwWFozWXNIWDFZQ3JLZHVBK0hyQ08yMHJscUM5WDZ5OUp3N1lz?=
 =?utf-8?B?UnZxYTU0ZVAzMFB6K3QwejRMMnpOSWxnc3lnSk5SWGgyWjFMV0tIUTFPUE9R?=
 =?utf-8?B?TGJ0SkNLNTRVNjRwVERDb2RlNnZpNjlqdGVyNUpWbGx6NDM4RHBKM01pelJv?=
 =?utf-8?B?VDZ1OUoyZEVDSHZOdmlueEJKTzl2dHZ1UXJ3TnE0d2l3c21yVjQzZEhITTJQ?=
 =?utf-8?B?L0kyNkN0emRQYzF6ZENuU2xDdU9WOEFaODFqaXpNWG9OL3NkSUd3V1hnYmxD?=
 =?utf-8?Q?syg1jxNmAfo1LFN8E80syIP5B?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14332c44-ed67-4a38-d150-08dc4fb27407
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Mar 2024 05:38:24.9039 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: odot+qYrGG/wpR85xridj44ZW1d1V1zu8XcsJY8jWlgYuMPzrXRkkuIB3D1vxc3cANep6lrWLxOg/HHXjUEWyQy20jn1bZo1tI89hRzuUys=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8569
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

SGkgRGF2aWQsDQoNCj4gDQo+IE9uIDI1LjAyLjI0IDA4OjU2LCBWaXZlayBLYXNpcmVkZHkgd3Jv
dGU6DQo+ID4gQ3VycmVudGx5LCBzb21lIGRyaXZlcnMgKGUuZywgVWRtYWJ1ZikgdGhhdCB3YW50
IHRvIGxvbmd0ZXJtLXBpbg0KPiA+IHRoZSBwYWdlcy9mb2xpb3MgYXNzb2NpYXRlZCB3aXRoIGEg
bWVtZmQsIGRvIHNvIGJ5IHNpbXBseSB0YWtpbmcgYQ0KPiA+IHJlZmVyZW5jZSBvbiB0aGVtLiBU
aGlzIGlzIG5vdCBkZXNpcmFibGUgYmVjYXVzZSB0aGUgcGFnZXMvZm9saW9zDQo+ID4gbWF5IHJl
c2lkZSBpbiBNb3ZhYmxlIHpvbmUgb3IgQ01BIGJsb2NrLg0KPiA+DQo+ID4gVGhlcmVmb3JlLCBo
YXZpbmcgZHJpdmVycyB1c2UgbWVtZmRfcGluX2ZvbGlvcygpIEFQSSBlbnN1cmVzIHRoYXQNCj4g
PiB0aGUgZm9saW9zIGFyZSBhcHByb3ByaWF0ZWx5IHBpbm5lZCB2aWEgRk9MTF9QSU4gZm9yIGxv
bmd0ZXJtIERNQS4NCj4gPg0KPiA+IFRoaXMgcGF0Y2hzZXQgYWxzbyBpbnRyb2R1Y2VzIGEgZmV3
IGhlbHBlcnMgYW5kIGNvbnZlcnRzIHRoZSBVZG1hYnVmDQo+ID4gZHJpdmVyIHRvIHVzZSBmb2xp
b3MgYW5kIG1lbWZkX3Bpbl9mb2xpb3MoKSBBUEkgdG8gbG9uZ3Rlcm0tcGluDQo+ID4gdGhlIGZv
bGlvcyBmb3IgRE1BLiBUd28gbmV3IFVkbWFidWYgc2VsZnRlc3RzIGFyZSBhbHNvIGluY2x1ZGVk
IHRvDQo+ID4gdGVzdCB0aGUgZHJpdmVyIGFuZCB0aGUgbmV3IEFQSS4NCj4gPg0KPiA+IC0tLQ0K
PiANCj4gU29ycnkgVml2ZWssIEkgZ290IGRpc3RyYWN0ZWQuIFdoYXQncyB0aGUgc3RhdGUgb2Yg
dGhpcz8gSSBhc3N1bWUgaXQncw0KPiBub3QgaW4gYW4gbW0gdHJlZSB5ZXQuDQpObyBwcm9ibGVt
LiBSaWdodCwgdGhleSBhcmUgbm90IGluIGFueSB0cmVlIHlldC4gVGhlIGZpcnN0IHR3byBtbSBw
YXRjaGVzIHRoYXQNCmFkZCB0aGUgdW5waW5fZm9saW9zKCkgYW5kIGNoZWNrX2FuZF9taWdyYXRl
X21vdmFibGVfZm9saW9zKCkgaGVscGVycyBzdGlsbA0KbmVlZCB0byBiZSByZXZpZXdlZC4NCg0K
PiANCj4gSSB0cnkgdG8gZ2V0IHRoaXMgcmV2aWV3ZWQgdGhpcyB3ZWVrLiBJZiBJIGZhaWwgdG8g
ZG8gdGhhdCwgcGxlYXNlIHBpbmcgbWUuDQpPaywgc291bmRzIGdvb2QhDQoNClRoYW5rcywNClZp
dmVrDQo+IA0KPiAtLQ0KPiBDaGVlcnMsDQo+IA0KPiBEYXZpZCAvIGRoaWxkZW5iDQoNCg==
