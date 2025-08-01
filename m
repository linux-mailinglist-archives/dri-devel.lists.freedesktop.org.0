Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C06BB1875A
	for <lists+dri-devel@lfdr.de>; Fri,  1 Aug 2025 20:27:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5D7C10E8E8;
	Fri,  1 Aug 2025 18:27:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BWkTsq3A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D7F010E8E7;
 Fri,  1 Aug 2025 18:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754072849; x=1785608849;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Xm9L1vEW8SGqAHlr1SwaK6QtT17Rza0ODzr6d8jDJ5Y=;
 b=BWkTsq3AnbDCyH93yZlAIagV0w7fkPZDZFXDz9FxsiDiFAtY3Tv+sG3t
 sOl9OFXKg3yCsoJaGZkx5jxepfU42kBbMAZsYG44/VQ3mKsAJXheE1qjQ
 PUF14T71neV4O0EOcIz+IPudFrgx0USzCYahrXHfJYbUOH5GWVhIObrNM
 g6c8kaDTO5jlKMMGF9GByxC22kQDUPp6O2n4/4cWgpCW1wyURY+rbL3QE
 xSFfksKGCP82rbV8JYu8Ml0i1wW4OPz29Byvp2Ws70DqRkNgqg1z0eEYo
 kkcv92Oom4ynAZFLp0ByXIVLGS3RsFCLhDCJ0UEzt+MN/wkgXnLRw4rqc A==;
X-CSE-ConnectionGUID: L4E9unX2RqeM7VOZWX1P8A==
X-CSE-MsgGUID: i7StXRjcRBKwQvzYKtsJEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="59049587"
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="59049587"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2025 11:27:28 -0700
X-CSE-ConnectionGUID: Cb25faXETyS5rkwWRmxuDg==
X-CSE-MsgGUID: h39AqeYNTKeu8KwRscfSPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="163555893"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2025 11:27:28 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 1 Aug 2025 11:27:27 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Fri, 1 Aug 2025 11:27:27 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.86) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 1 Aug 2025 11:27:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b7mh7P5XLbY+LR4vtB3KYWljd96DxhiEL8nGyLaUJ2pIlQvpwHA8AJFuI532khDEaIrSNtfG0vU41D2YrmchFJzb8zVjRbbeCAnzSXSogQNDyPlkKPykFVOyvLP4YbapY9DONijENLNy5zDRwBwf2Z8Wl7y4u+pA2HNQBz7Xw0gCZOXccBEykeLIVvA8r+yZYWf3MzhN1anDrmRBfwCT/sL6LQ1Vej3eWPTVTJmsWwl+va0KxSbf/lIlakHY2ITdgKEXX9DdULmcYS8m04bnIS1OEmlhy3moDG4AXH+xBnYpXcus+XaNe4lWOLvkEZKzy9eAG7fv/iH7n+CXs3Jtfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xm9L1vEW8SGqAHlr1SwaK6QtT17Rza0ODzr6d8jDJ5Y=;
 b=DvhbmYebmUufn0qJluexpocAH4V+aQ6nmJNuksNvcW0tr6NTy0UR4gqti7U3fJpBpCPcTFWIKymxufE1jpoqwJb8DuNAaSmQv5vJ4SRhmYvFDbpzBgkySQxw5S4eJbqI9LSl7kDhhmj7yhfo8q6e/jLv38HzRAvxW6cmYJBrMXCQjXMzMI3dDgoV53l5bJE7BqczCmUYq5pYIdakzySijXdzAuK2lZK1tHAYMev+jPKXWXmner2K/O9BZNTWYnQBcnuWtYy4SurfuqefVITiAff4HnKp1wj+HnCTplJgwgHrZFSCMyW/7qGSLJN1bbk2TECBxoNhnVgHskPSlCc49Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by CY8PR11MB7339.namprd11.prod.outlook.com (2603:10b6:930:9f::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.17; Fri, 1 Aug
 2025 18:27:25 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.8989.010; Fri, 1 Aug 2025
 18:27:25 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: Colin Ian King <colin.i.king@gmail.com>, Jani Nikula
 <jani.nikula@linux.intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
CC: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Cavitt,
 Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH][next] drm/i915/bw: Remove space before newline
Thread-Topic: [PATCH][next] drm/i915/bw: Remove space before newline
Thread-Index: AQHcAwQGwKVIPapa+kmUahAPjjoV0bROHaBA
Date: Fri, 1 Aug 2025 18:27:25 +0000
Message-ID: <CH0PR11MB54449F6E173608467F11206CE526A@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250801164658.2438212-1-colin.i.king@gmail.com>
In-Reply-To: <20250801164658.2438212-1-colin.i.king@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|CY8PR11MB7339:EE_
x-ms-office365-filtering-correlation-id: 0ac4b51a-e288-4d12-2ec8-08ddd1291065
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|921020|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?QUhGSEZCdTFKK0dURXF6cTgvQllmaG56RU5oaGR2SjZmN0ZrS1orZktjYzd3?=
 =?utf-8?B?QnQwazBmem1zS2RzYThGck5SbmRUSDBHTUNMY2NLbnRvTjNuOThKVmJzNUlw?=
 =?utf-8?B?Q210QmZoSGQ5bGVUV1RhMlFvZGJjR1VCSjdZOWJ6czhqMHdZbEZCbXdUcGVF?=
 =?utf-8?B?SGlnU0lmUDk5MkNZaWxoNHFkTEdIVHhwQXFQRkVOd0FMVFJ5aytkYWhQNnZC?=
 =?utf-8?B?Zm01VG5ZMVZQMGcwbWxBRkVsanFsdVEyZlZzaFA4cWFZalRObHJNTFU3NC8y?=
 =?utf-8?B?eVJjWmtxbXVONGM5S1g0dzhXZEwrYkRVdm5OdTFMTlFqUWU2ZG84eEhiUU9T?=
 =?utf-8?B?eGxOOUVNSW9SbG5PK1NLYjV2QjVOZitvVnoyUzZSTFFrRkw0QzRXS3ZvNWU4?=
 =?utf-8?B?M0VmUDFRdjZlZjRQYWVudWtiQ0MzOFZzSW40S0pKSys4ODRlYWVGY2xHNVQ3?=
 =?utf-8?B?d1hkK0orM3I1YkZvQklwd1E2M0tvZHk4dHVIQXZEUXlSMzA1KzM5bUNGTlVS?=
 =?utf-8?B?TU9hVXgyWHRKSkIyV25HSWlUcXpSb1Rpekw0SlRMYU5QK01tSUxvZHlkTUZV?=
 =?utf-8?B?WkpKbjRCZkQ3OFdUY2NGWHZjMWR4K3VzRVNJaThZUVZ3OUVTUzBvQ085bVNV?=
 =?utf-8?B?TGhuSm5hMkE0NGRBZVFNSExCRVZVQi9NYktoWVlvT0dwdzB1d01qckNsM2Ev?=
 =?utf-8?B?cmpoWGdCMFphRkJOTm5lV0NCQVVaWjhjRnhpbTVkdjIxYVJXZXdacHhkUHhk?=
 =?utf-8?B?S2g0SlVQcGg5cUlTczEvWjRrMnVQTWdkNnVmZlBhTDdOVTJ5NWtQdEhSQkVN?=
 =?utf-8?B?ZFlJdlBGRlAwNVR5K0JwbmZrWXlXYjd0TmNmeCtSUm1vR3NYWFQ2VDkwSndm?=
 =?utf-8?B?VDlzeDRaanZFb1JlNEhPRWphbUxSbmo5bnlvTjBId3YxWFBWQ1dPWVB0Y3JK?=
 =?utf-8?B?MFhEUFlObXFFcTBxeWI0cWFXc3VIcVg5cTdXM0hFQUF1NHpYN1d2NUp4cmdG?=
 =?utf-8?B?Y3RFM0YwUVh0MkhDQlVIMFIyYnJZMFFqemlFbkxKUVFmVllZdVRNc0g0NGlj?=
 =?utf-8?B?Zm91Nk55aHRYMFFjL2FwUTBjZk9PYUhJYlR3bTRwMnl4bFUra0t0S0l5YkZ1?=
 =?utf-8?B?UmJOMm5LOWtRQzNiVTcwdUdrd1RrcDB6UkxMcUpnRWZiNkhId0ZQMmtzaGVh?=
 =?utf-8?B?MTNTYXBsWjI0UEwwb29lc21iazFKSnBhaS9TSWV5T0VraGV2ZFk1cDFrcC83?=
 =?utf-8?B?WmppVjlBNWZUUHVsTkFkcDdqS2VSNGF4V3FkTXNBT2lnVFlhV1dQK2Nyb0VC?=
 =?utf-8?B?ck56a1lZZjN5QURJVGVZempITlhqc2Q0Zld2ME9VUkFjOUpnaE9OMFVRQ0Zh?=
 =?utf-8?B?Z0E1Z0lla05RcDA3UW1TTlA0eFBqV3Y2YVRIeHVRc0R2RThIQW9EN3pBWDVV?=
 =?utf-8?B?NEZkSVNzai84dk9PMXpNNkw5bHY0bXQ5d0lJTFM1UXVwWi9UeVIxcEtuK3h6?=
 =?utf-8?B?MndaK21hRTFGdzRBTDhGQlpQVTJEWWg1MUhSLzhuYVVUK2tpWmxOZUxqOXkv?=
 =?utf-8?B?bDNJQnpNNjJUbHFBMnBtV3BoTjRGTXJFQmRLU2JWSjBxNnJPMUlVdGJ4ZlVa?=
 =?utf-8?B?SS80NDlsaUY4Tk16RzNiU2hKcyszaWV5T1NlZ3BCQ1dDVnBPbVhTR0ZwMmR1?=
 =?utf-8?B?aWFXdzBMZEtmN3hXQkpQMWF3bnhjVFd3MEorUnVRWlRGUC9XOTFIcitlbVVF?=
 =?utf-8?B?NU4yUTM0bzczZzR0N3ZkOFEwdXp2SmpTWHg4UGtRNjN3YmU0YWI5Uzc4WmNa?=
 =?utf-8?B?aUpKTnZSVkdoU1U1NGIzb1pjaEZCUURmYzI3NkhZL0Z2aGJqK0RwOHRhSS9M?=
 =?utf-8?B?VDlLTEpMUDlyWXpKTXZ1QjhVcnlRNEd1ZmJLTTRCNTJDN2hkcTdMUTE5SFBY?=
 =?utf-8?B?RlZXOGpDL1Z5c2xqU2hDRG1FRkUzU0lCUzNLWEtDZU1ySFhWRk9ER0JYVVhT?=
 =?utf-8?Q?ZaMy4u5tRYEFBO9bSpXZ0ZQz+G3DAw=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(921020)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SUlEcHowRnlJa3BRVHZtcjR5WDd1ZnhZWHFqSFY5bmpVQWNCVUtVaFBoc0Q4?=
 =?utf-8?B?NFRNUUdKZ0orSkpPby8xa1hCeXZaUTlQazdCY0lVdkhNTU94UGsvRGMwOEdS?=
 =?utf-8?B?WkpOeDlQVXJpV1haVWZSSzZrRURTdGFodmFQUVpoc3Y3TS9JZE0xOU55RWRp?=
 =?utf-8?B?OWx2cXFFSWRnMWp1eC9yMEJhalVMQ0kzMkZyUGEvOTNGUVhrM3daY1ZLQ0xB?=
 =?utf-8?B?dW11RGhqUmpFakkrSmNLQjYweDlvaVlhOSt1MiswbS9WdWRoT2Rsc2lhSDJ6?=
 =?utf-8?B?TlFhSzZmMW5wZmZYS0d3SkJxNVUwL29VOWV2LzcwbFJEZ0Z2N29CTlZuTTM0?=
 =?utf-8?B?ZENsT2wza2trTm42ek0yUjNBODcycDdsZFJBcjFTenBQeXZibWtyeHM2czQ1?=
 =?utf-8?B?TVlIQ21wSnAyZXVIRzJ5VVFjMUFSMytSYk41ZDBLcmZYb0g4YWFUTFM2UlUr?=
 =?utf-8?B?TjJwZEdUQjFqM0NtUktoKytqQ2piR3k0dVZjZlR2SDQwRUppemdSNjZtRHBG?=
 =?utf-8?B?OVpKQXhVejQ3c1ZVYUdRWTVrbzh2Smpab01JbjBGaFhNT01yWUI0L3paMDQ3?=
 =?utf-8?B?bVBDbWtkZWtIT1ZMQ1loYkRLRzd2cmtKQmh0N2pZU010VCtnRlRwS0t4NmFh?=
 =?utf-8?B?OGdlSkNrS3ZiNFpHMTk3dTBSYlgyWjJXb0FsbU5tM0Z4RXR3dUVFQ2p4S0pE?=
 =?utf-8?B?ZlFIV29qQkdYTGsvNER0MUlCMWxZM2xsNUZxMklRS050cnJ4RlNsWXpHZW56?=
 =?utf-8?B?THpaNXlSWVBBTFIweGhyMTV5a09qZ1lFZ20xMlpld0FIUFpHaEtCWDM1YUdr?=
 =?utf-8?B?NUFNTUMxVHo5bkxvaTByLzVZM0RTWFNKQ3M0cXEwYy9MRlZDOHZoMjJBVE1F?=
 =?utf-8?B?MGtLcmp4YnpORWpwSnBxY0RkQUFNTDVUSGJOK3dxYWcxUXRFaWZ6RWIwUG5p?=
 =?utf-8?B?Q01qWnBITnhIam5RSEhmbkNoRnZqTUtFRkIyWUVtd3E5YVBiWllXN2JyKzVH?=
 =?utf-8?B?UEdqdW5xUWEvUkNHY0g1VFBHTHVxSitTU0N2d0JFQnRrc1BBeGVVMHZBL2g2?=
 =?utf-8?B?WmNyWnUzekpDYmUvemw2OVVsYjhxamxvZG1SbEZDaFNoUmh0Y1BRM3ZwVGk4?=
 =?utf-8?B?dDhWNWNRYTZiZ05TY0FIZE5JK2J2ZkVnT2Z1SnNIS1VYd1hLTVZnY2h2aHBp?=
 =?utf-8?B?U1hPNkNEZmh3SDJ6dE45cWZFSkZodnduOVFvYU1RQ3h0d2VJSlU1S3F5WVU5?=
 =?utf-8?B?akFRbjNWSjJCa24ySno0ZnNNWHVGZVVKRUUzVkVUa3QveWFXUkV1ZnVIS2hu?=
 =?utf-8?B?RDVtOUlmSHV3dzFsNHFUZlArTjhqSEFXRldvUkV0OFRXK1NtS2hNU2NSeWw2?=
 =?utf-8?B?Uzd2b3NIT29kVStiaGsrSjZXNlNaRkdCa0IrbDVabGF5SG0zMTNXaVVtanpv?=
 =?utf-8?B?aDN6NEhlVm9OanVUZEVJQm85aG5NcFEvZFFoRGl2VHNNaHA2aFNjTmZ5Uit5?=
 =?utf-8?B?YTZTVlVDTHY4WFB5cGM5dVZJMHdjUE1iL0VlM3MxMXNkRWVUL2tLVFQwRXdn?=
 =?utf-8?B?WCtxeTZ5aGcwK3pUMTFJSnVBS0R1VnVUMXo4ZFlBV1F3Vk43RDdCRzV0U1ZO?=
 =?utf-8?B?VW13OSt3dzN6NHdmQlUyL0ZFU05nWmc1RTIzOU1IakdxRUo1R3h6dnpUQmRh?=
 =?utf-8?B?OGZkTDd1QmU4UWxPNzYrYmRmTGMzY1VrWS93N0F2UWV6K1BrNUErMm4rT01D?=
 =?utf-8?B?aTU2bVdJY01xWjRLcmgxN0wreXpsYmNLVXNIWmtPREpRS0NYaXMwb2NzNHJh?=
 =?utf-8?B?YndFWWJUWng1MThyalpJNzhLcmF3bU9WWVNSenlwdEUvY2xvSVg3OGRwSkxD?=
 =?utf-8?B?eUowb0lCWXhlVkpERDg0V21GOTdWQTBQRGN0K0ZOaWJ0cUxjSzFhVXJ1dmNS?=
 =?utf-8?B?Q1NyL05nRi9tTExUVDZwM21nM2wxTEt5cVpSK1dwMkNCcmNzM3dJajAzSkEy?=
 =?utf-8?B?YWJmZzkwdDBRbjdQY0pHTm1qZnhzT0ZTZkQrSitGcUtuOUl5S21yQVVHVUs5?=
 =?utf-8?B?STFkc0VhYm9lZ3UvYzdFc0FNZXd3ZnpBR2tCRXBndUl0VkM2Kzd0Zm1vUFBC?=
 =?utf-8?Q?V9T/DdtIaqVq2WouBWPL6tA0i?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ac4b51a-e288-4d12-2ec8-08ddd1291065
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2025 18:27:25.5104 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JZ9vyAYXRsKkWuudwQ+yVeB/G6o2NtzsiTLOvI3KPPBfIhUIrvX1jcmRmz05EsGT1oJMjXrSCs0/kDciK2xdlqKzQhF7reAxPI3iMR+teyI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7339
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

LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEludGVsLXhlIDxpbnRlbC14ZS1ib3Vu
Y2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mIENvbGluIElhbiBLaW5nDQpT
ZW50OiBGcmlkYXksIEF1Z3VzdCAxLCAyMDI1IDk6NDcgQU0NClRvOiBKYW5pIE5pa3VsYSA8amFu
aS5uaWt1bGFAbGludXguaW50ZWwuY29tPjsgVml2aSwgUm9kcmlnbyA8cm9kcmlnby52aXZpQGlu
dGVsLmNvbT47IEpvb25hcyBMYWh0aW5lbiA8am9vbmFzLmxhaHRpbmVuQGxpbnV4LmludGVsLmNv
bT47IFR2cnRrbyBVcnN1bGluIDx0dXJzdWxpbkB1cnN1bGluLm5ldD47IERhdmlkIEFpcmxpZSA8
YWlybGllZEBnbWFpbC5jb20+OyBTaW1vbmEgVmV0dGVyIDxzaW1vbmFAZmZ3bGwuY2g+OyBpbnRl
bC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBpbnRlbC14ZUBsaXN0cy5mcmVlZGVza3RvcC5v
cmc7IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCkNjOiBrZXJuZWwtamFuaXRvcnNA
dmdlci5rZXJuZWwub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnDQpTdWJqZWN0OiBb
UEFUQ0hdW25leHRdIGRybS9pOTE1L2J3OiBSZW1vdmUgc3BhY2UgYmVmb3JlIG5ld2xpbmUNCj4g
DQo+IFRoZXJlIGlzIGFuIGV4dHJhbmVvdXMgc3BhY2UgYmVmb3JlIGEgbmV3bGluZSBpbiBhIGRy
bV9kYmdfa21zIG1lc3NhZ2UuDQo+IFJlbW92ZSB0aGUgc3BhY2UuDQo+IA0KPiBTaWduZWQtb2Zm
LWJ5OiBDb2xpbiBJYW4gS2luZyA8Y29saW4uaS5raW5nQGdtYWlsLmNvbT4NCg0KUmV2aWV3ZWQt
Ynk6IEpvbmF0aGFuIENhdml0dCA8am9uYXRoYW4uY2F2aXR0QGludGVsLmNvbT4NCi1Kb25hdGhh
biBDYXZpdHQNCg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxf
YncuYyB8IDIgKy0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlv
bigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50
ZWxfYncuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfYncuYw0KPiBpbmRl
eCBkMjlhNzU1NjEyZGUuLmFjNmRhMjBkOTUyOSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9idy5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1
L2Rpc3BsYXkvaW50ZWxfYncuYw0KPiBAQCAtMzU5LDcgKzM1OSw3IEBAIHN0YXRpYyBpbnQgaWNs
X2dldF9xZ3ZfcG9pbnRzKHN0cnVjdCBpbnRlbF9kaXNwbGF5ICpkaXNwbGF5LA0KPiAgDQo+ICAJ
CWZvciAoaSA9IDA7IGkgPCBxaS0+bnVtX3BzZl9wb2ludHM7IGkrKykNCj4gIAkJCWRybV9kYmdf
a21zKGRpc3BsYXktPmRybSwNCj4gLQkJCQkgICAgIlBTRiBHViAlZDogQ0xLPSVkIFxuIiwNCj4g
KwkJCQkgICAgIlBTRiBHViAlZDogQ0xLPSVkXG4iLA0KPiAgCQkJCSAgICBpLCBxaS0+cHNmX3Bv
aW50c1tpXS5jbGspOw0KPiAgCX0NCj4gIA0KPiAtLSANCj4gMi41MC4wDQo+IA0KPiANCg==
