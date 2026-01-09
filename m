Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 881DDD08D13
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 12:09:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B56E10E89B;
	Fri,  9 Jan 2026 11:09:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DnFa0vAk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53CDB10E02B;
 Fri,  9 Jan 2026 11:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767956949; x=1799492949;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=5G78dm4gRhXtH+Yowd3B99FLK8mpQFDTA9f1dQ5En98=;
 b=DnFa0vAkdZKzzxUeMpmEcEPH+ijH/nZ11dJQ8+A/cwypvJ4tzCOn1zUd
 rUFYyns6KA5wA5LsjIVwaQBUY6z9VMNn6Cn9lodnYq9iKHu+iu48eumDe
 Bo2Y34M1pU4BpXtPw8mZGUhkSL9TUqEHDutFyvUGxB9CnImXFF4VD3QkX
 MWoVU2MlvHmLtHxspRHm4Gtmckt5HNALgPIfM1KeK7OUci8H6WwrJLXRy
 GCo1JwE/ksPYezYFgjGABdaoqZTqEcH9IBw/KXfkyetBTLrcGU+tirc1u
 Xk1PdWfftl2BNHjOm57IOMLP+imXPdFYEY86sIInhuzjiJZfDJ8rG6Mef w==;
X-CSE-ConnectionGUID: UF5P7KMQSGCRemTMh5JPKw==
X-CSE-MsgGUID: f2oKUqmHSmm1kt39CTPtEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="56891607"
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; d="scan'208";a="56891607"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 03:09:08 -0800
X-CSE-ConnectionGUID: c6+jsJDiTI2U6uLLtJ/GEg==
X-CSE-MsgGUID: jN0TaL0uQgWtldFE0SVxVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; d="scan'208";a="203875671"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 03:09:08 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 9 Jan 2026 03:09:07 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 9 Jan 2026 03:09:07 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.58)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 9 Jan 2026 03:09:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nyJgEAAe0cbYk0dN0A+WpMBtFOou5fip5bl/eOH6nPmj6kcdjNdtxgx6bhpdDgwbyZ6q8ZJ19XgCcs1OZFyDL0c3tK5S0eDWkFJe1J5xPSQJ+pRyosQqAd8JiGAnJ1vlkcBiw7kbbEks6OPL2eO0zQAT7kTkcfXPJbzVXa9jPo7gKGEidLHFfgq7hhG7z3UI+sDqv+lSeuATr9cpQtrfDaE5UlddO7QkzViZV2JOK6gGUtP043tD/+mZqaofMeMOSxlI8MqIwTxjV7eM7tb5FEm7UHS1jClnYpVrQju4kXh1uD8i8oNwESMT5A3Xa6wHfPr1zyPZfrL5nlHGK4aQvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5G78dm4gRhXtH+Yowd3B99FLK8mpQFDTA9f1dQ5En98=;
 b=dpWUSvvtQEaL+U5hLud9+km25h+PNlW5KUN4dtwE6c778rWVyNhArjLU2V6K9NBH32D5jk5LoRL3X10oGktIXARni0eUWweV954vDdwCsbm+f7e8yVmIwmjPxP4iS+Qx8oZclqgIxtiZnB2MX6hxmO4Wo/boixoPywZZQlgWTZA/Jpv1OPhzt9fDn9ajGlEGjJdhCQ9yewp7lVkk+QLv7oIlCwVAWwiwSyggwFVOVl6Gsl23dVj4rutogAQE0ZwKWKwa2rxVIGUvFYzP1mINEsoyFPxfbfTrsBP3VdmJ2TKe2E1wd2vZBSVILNKER/Zxo8lHtuHhK/tTq9/nE6KMwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by SJ0PR11MB4782.namprd11.prod.outlook.com (2603:10b6:a03:2df::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.5; Fri, 9 Jan
 2026 11:08:55 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%6]) with mapi id 15.20.9499.003; Fri, 9 Jan 2026
 11:08:55 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: =?utf-8?B?TWljaGVsIETDpG56ZXI=?= <michel.daenzer@mailbox.org>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, "xaver.hugl@kde.org" <xaver.hugl@kde.org>,
 "andrealmeid@igalia.com" <andrealmeid@igalia.com>, "Kumar, Naveen1"
 <naveen1.kumar@intel.com>, "Syrjala, Ville" <ville.syrjala@intel.com>, Dmitry
 Baryshkov <lumag@kernel.org>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH [RFC] v3 5/7] drm/atomic: Allow planes with NULL fb along
 with async flip
Thread-Topic: [PATCH [RFC] v3 5/7] drm/atomic: Allow planes with NULL fb along
 with async flip
Thread-Index: AQHcgIOJEEQcUSpcsk2ybg6l7J5vtLVJl+KAgAAXY5A=
Date: Fri, 9 Jan 2026 11:08:55 +0000
Message-ID: <IA0PR11MB73076D91D60F168B9D112051BA82A@IA0PR11MB7307.namprd11.prod.outlook.com>
References: <20260108-async-v3-0-e7730c3fe9ff@intel.com>
 <20260108-async-v3-5-e7730c3fe9ff@intel.com>
 <6316ba11-0660-419c-afb6-a1588f6efef5@mailbox.org>
In-Reply-To: <6316ba11-0660-419c-afb6-a1588f6efef5@mailbox.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7307:EE_|SJ0PR11MB4782:EE_
x-ms-office365-filtering-correlation-id: 1f7ef6ec-6852-4542-d7a5-08de4f6f7ae1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|10070799003|366016|38070700021|921020; 
x-microsoft-antispam-message-info: =?utf-8?B?SDVhNTBtSXJGclNzekFEaFlEOUlMcHVZeXNOUGtrTXhYb3lIcnh2bDdtN1RB?=
 =?utf-8?B?NHVtY2VvVjh2eXU0MTdLVVkrTDFVVlR4R1h3RTQ3VW1UUDh5SHpib3Y1eTYx?=
 =?utf-8?B?dEcvNlp5MklNN2txUS90RklqTzFqTXZmOHVjZU01bmpKa25Lc0gzSW03V1FJ?=
 =?utf-8?B?ZWg5WmlUaVdsU3UzSnpqY1hSQVhJaUVYeGNxQXMzWWV1bTAxZCtmQVpCK051?=
 =?utf-8?B?QUk2ZWdiSmo2NGhnaVhSZVpXL1BwUXVUbS80RE9DeVZqRnhzTTV3cHJTRmZE?=
 =?utf-8?B?bm56bFRXRU1kd1BDTndpdmgwTnBFeHdicUhmRTh4MkJGWkw2eVhlamZvYmhL?=
 =?utf-8?B?K0RobThGajJhYkN2em5vRkxRc2tjRVJ2ZWk3K1I0TzZGSGNHWjBjbUFMcUY3?=
 =?utf-8?B?S1g4Rk9rb1htam11MGI3TnBNeDg0cWlvODd5YlN3UkVJVmRDaHRSbzM4dksx?=
 =?utf-8?B?MGNSejh6ZlRxWGU4T0M5YjZxcmhKbkREWTBPZ1JYWHBKaUhReElaQjNyK3Jy?=
 =?utf-8?B?R1RVejlBTGtlYkJubDVIVFNxQzEwSUpBRlk5clMzMEdFZkk1RnZnVDhYdmEr?=
 =?utf-8?B?cXlCUStHUnNiM2pnNkNMMzRmUjc2NEh2WkdUN3oxTHZmTDQ5WW0xWVdLNGtT?=
 =?utf-8?B?VTlNZmVwRktsR0lFVExjbVQ1YXA4UXBDaWdJcW9yMllsWXF2NXQ5TlMzMzdY?=
 =?utf-8?B?UFBiUWNvL3h6eTIvK3QrSDRUTGtUYXRJTEQ1QUhFdEZCb20xTUJORHBHTzlS?=
 =?utf-8?B?VjVUb3ZXZ1RlWDVLbWhCazZHT3ZRSmV2aHBrS1hHUHZQcUsxTmlzcEhxN05u?=
 =?utf-8?B?bzdaQ28zQzgvcXYveFdkNW83YzFIeU1ZcU5kSTZTYU1nd0FmQWYyOUNnc3BP?=
 =?utf-8?B?Yk9oZXp5UTRMTUFZN2VwV0RYMXNsU0xSbVVNeDJ2Z2VtTFlvMVY1ODFSdUdk?=
 =?utf-8?B?TCt1ZzZtRlZabk1WR0Q3SFVLVFpJYS9CSndhcFpWZmJZZUlDT1FIUUlUb1k5?=
 =?utf-8?B?TzV6RU9VUktYL0tjZE9zYlhuR2tiRmFmbVNrUS9DVGw4SmxBOGppL1F5S0F2?=
 =?utf-8?B?Ym5ndjJZOUxWSGRPZzg5M3lOYTd6QTdheTJLUHhaZ0UxeGlJR09TQVltdkZ2?=
 =?utf-8?B?MVBpZGVEU080d0xra1EvMVF3TzAyeXZEeXhUckZzL0ZPeVc2b3Y0dXJOdDVE?=
 =?utf-8?B?ZUFOb2dTaG9ZWnA3UXQ5S1JIR1BlSjNld2NSeXpMOGFPRXp1L3V6TkJaU3RJ?=
 =?utf-8?B?dy9ZR1lBU3hKT21nS1EyOG40WEpTWUlsUUZtaEw0dnJWTTRtRmZOY1M0QkRZ?=
 =?utf-8?B?bHhLcEp3d3F0Ujl6a1ZzZUM1R243NVgvTUZ4NDdJK2xVSXVOZWlIdjJNd1dN?=
 =?utf-8?B?L1RpcUpjclpnR0xRdU1XSFRSVllZZlUrSjRrZC9ldXpFNG5ZMzN3aU9MTDI0?=
 =?utf-8?B?bW5CTitwcmltMDRPVkFOTG01d3B5VmJZY1IrQUFNaktMZEhCU2MzMnZub21L?=
 =?utf-8?B?Z09Kc2t2Q3Z2czRkOVVQeHBENkFjLzkrdThJUGgxZ1JBOWora2VUa3pLMFcy?=
 =?utf-8?B?d0hsNFdLSmpJNjJNQ09lNjN3UFpUbmhkTkVHM2pLYmN1VkNyNk4yeC9YMFBu?=
 =?utf-8?B?TUZtVGx4azJrWDhZV25jSWhPOW9GeGhYVDN6WW1FZnZxNWh4RlIwN3VHWVR6?=
 =?utf-8?B?TUdvM3E1YU9VTHhoS3ZNQzA3b2NkV2kxZ0c0NElOT1krUFQ3NkRDRnZDd29o?=
 =?utf-8?B?c0JLK3crSTltV0xFdW5xLzB5Q29zbVhBaEVDSURyb1FteER5T3Z0bTY5L09J?=
 =?utf-8?B?U1MrY0ZPQzNWbStkbGRtdEYyZ1ExY3pVMloyb0J0dmV0NVZLeVNvNTBMalEy?=
 =?utf-8?B?enVjakxLRHAxbmtzMlJrMVAzWTdRblVYZUh5RW9VZVBZY2QzS1Z6cWh5cTJh?=
 =?utf-8?B?MW51aGU4N1ZaejNrWGY1U3JKT212ME1YKy81eHFhS0tLRWlWZCs1ZXV5dnI5?=
 =?utf-8?B?eEh4Wlphcm13PT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(10070799003)(366016)(38070700021)(921020);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cVlJNWZ1eVRXMnFnZVdKRnYvNnFNYVpZQXdydjRPdkVVcHhkK29DTEI2Qm0x?=
 =?utf-8?B?S05McHdZN1JuK1JUaU5nVWtJSFlQUTdqVU9Yc0Q2ZExVQThmWlcvN0lFdDZT?=
 =?utf-8?B?QTNSVXViR0Q0Nm5vL05wVTB5Z1hvcTVUNlpYQzUyMlN4dHV0elhuYUV5MWVh?=
 =?utf-8?B?ajlIUDBqMGYweEpOTHF2SzFhY0xTN0VMSXA2RlRCR2lDamFYNEE5TzlTUE5P?=
 =?utf-8?B?cFZpWkEwK3pyMnJmVkk2SG5oUEFwc0lTeEg0b20ybnYzUjFER3huakRJWFVP?=
 =?utf-8?B?b08rQTJZOHllVnpTdi9KVWVja29DeDkwalVRWUFIcDZxUThSZ2hWTkV1V2VZ?=
 =?utf-8?B?TTBqWExsdWE1KzkzQnlpM0Q5bnBwbVRFdTZ3d1I4YkFLOHFQQUpObDM5dkI4?=
 =?utf-8?B?cVhHcC9rMlF4RUtNRC96R0E1Ui9HSmhlVExubUM1L2g0WmxYMkhENmNZOTBR?=
 =?utf-8?B?QUllR3p4WGI0WXlVd2JrYTJwalZXd2FWUjk0VEJpZEhPMlZSL2VxSnZJa3ZH?=
 =?utf-8?B?U21JenZ4N3c4c090NlZCM2paZmN2QjVIYlNiTTJGOGRlYTF3dk5uNUVaZ3p3?=
 =?utf-8?B?VU1hNkR0WW9XUG1QanpRVjhmOHNYeDZ4VnNYMFVRMndFZnV6cVJ1RGxPK1BC?=
 =?utf-8?B?VjgveENMV2hPeFk0MlIvcjBYZzdqZWlhV1FpdXV6VnFlUkZmRGg5RXRVRVh1?=
 =?utf-8?B?UTBXcGlpZTlFN2g3VlFMK2oybEtZYmVnNEVlS3RFSlNLelY3REQ2WUpBUnFH?=
 =?utf-8?B?TWd2dHRWV0hNaFgvMjNPSlNDOU16cU5XUDVDeDNMV0dxWU55YVBKdVFWYldW?=
 =?utf-8?B?MnNzMzRQQS9JY3VhK2x5cGRQMjVzUW1KaUZvRks0YW9kNk15Y2lCOEd1TXJU?=
 =?utf-8?B?VjdRV0lGUm01STF4eDQ3eEc0ZDJXaHJIajZBOVhxeUtEN2ZhbkE5dENocVpo?=
 =?utf-8?B?Z2RlMWhkK0tHM3FSdHoxaWUzNmlTQkRoTTdob2tKNmVvSmJwZ3kvZDhlMjlu?=
 =?utf-8?B?bFRkRHc3Wm5RWnRwUjlvaUFuMGRzdjJERitkcEk1ait1ejdjU09WTnp1djhY?=
 =?utf-8?B?MC9GUDBsVzhKbDlYK01RWU5rczJXcmJHQnJBa3krbitvRitQbzV1cHllVitG?=
 =?utf-8?B?R1lFbmdNbmQvWC8yNUE5VXRSVVNVVmp6Rm9XL0dNcXdaS3BWSEhrVytaK0RQ?=
 =?utf-8?B?d3FIenFJVk82TTF2dWQ1cGZ4MXB3RUJEcnZjTHdrVkRVNEtmSVh6RGM3bUx0?=
 =?utf-8?B?VjFXN09Kb0NkMUxmZ014ZEp6VkZuY2E1MnQrd3RnMlJpQ2NPM2hpNnU5OHRL?=
 =?utf-8?B?L0JhMndVSks5bUE0L0RMM3FvRXlpQlZOaElHT1F1ZDR1Rzl3VHhQQjVvMDF2?=
 =?utf-8?B?bEpjOXVGL3RIQXJZZVp5SUpHdk5YeHpUS292elgyYVpFVjhuZnRvZi9IbXNT?=
 =?utf-8?B?SXc3dElqMHlBODlvTnlFSFRadDE5YmxRNG9VQWpuUUs5K20xZEdWTWprRW80?=
 =?utf-8?B?N005aDFDWW02QjBDYzA1NWZzdjRQQ05jZnE5NksxUW9DYlZsd2VwNnJiQTBY?=
 =?utf-8?B?TW55Ung4N1ViVERiU0ltL3J2UHY4S1BIQWMzOEs2N0V4NmFxWjFVeGI3R2dV?=
 =?utf-8?B?eGZxb1EyTFV1VHlOSTM4Z3pZNnhzdklsbkpoQk5KRW56NjJzOW9xb00rcXYr?=
 =?utf-8?B?VVNHYzNtNVE3aU9TKzNPNWdidGg5c1NOYkV3dUlFYVI3dHlkZ0xFOUk3aXg5?=
 =?utf-8?B?MmViQ1ZkREw4cE9aVzFnbU9WR2xpTGhWUnhxaXgwYzdVcWFJdy80U0tzU0FZ?=
 =?utf-8?B?RUh4R2VuRkd5NE9CMVE2bldUOUgyMytoNEdQVFVjd0RuaWRyaU9wWFB2YUVy?=
 =?utf-8?B?SkxXM3N3dG1IQzlpNWtIREhsK0R3cXFod0cxUEF5b3Y4MUovVTYwQ3ZNaUxa?=
 =?utf-8?B?ZjZjVDhSaE8zRnNiOTZJRnlrbS93dFJrNEhLYXZ0cjNGdmxSNElRWXh6Yk8x?=
 =?utf-8?B?RlFSVmFPNnlMUjU3M1duRytuclNDdFpseXlPRmE4RkdZZVhDcDJrQnFxa1Bo?=
 =?utf-8?B?MS82UXFFc3YyZTVHN2dZWHYrL1FNMHBJbEp5N2tab21sTnZKeU1CT0tkdmVR?=
 =?utf-8?B?enQrU3dnZDF2NDNyTFRFeU51TEx5dkVnVEkwZElYd1NmNlA0V0JiRHlwQ3hr?=
 =?utf-8?B?UnJCbCthMDYrNnVxNThKR1RPVVVkWEFjSzlBeS9oSmhvZGxnVVdUeDRhblRa?=
 =?utf-8?B?aG5oVlRXdCtKUmd1VjBURWVJZXNsVStVaHZJRzRUa00wd1Zuc3oycVVLNW1L?=
 =?utf-8?B?MUozZ3k5QnMwUjEvVENWcHphSGptbGRXbTdWOS9jUnByTUM5ejdISlR5RDBt?=
 =?utf-8?Q?l6zJVeSvcb2n0PbiWZwsldeGYCcbMx4xkKQ9eHh8/B6hU?=
x-ms-exchange-antispam-messagedata-1: M8Qqeqz2+vjV/g==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f7ef6ec-6852-4542-d7a5-08de4f6f7ae1
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jan 2026 11:08:55.4501 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JdwWrnQ6+SUnpW1muxp2hhF6Ap6aW14BIWrk/YuhJknoyB2Rz7Xz13jHUdf7UUN/BAyHAQSGkxANrWXuFfFUsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4782
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

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IE1pY2hlbCBEw6RuemVyIDxt
aWNoZWwuZGFlbnplckBtYWlsYm94Lm9yZz4NCj4gU2VudDogRnJpZGF5LCBKYW51YXJ5IDksIDIw
MjYgMzoxNCBQTQ0KPiBUbzogTXVydGh5LCBBcnVuIFIgPGFydW4uci5tdXJ0aHlAaW50ZWwuY29t
PjsgTWFhcnRlbiBMYW5raG9yc3QNCj4gPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNv
bT47IE1heGltZSBSaXBhcmQgPG1yaXBhcmRAa2VybmVsLm9yZz47DQo+IFRob21hcyBaaW1tZXJt
YW5uIDx0emltbWVybWFubkBzdXNlLmRlPjsgRGF2aWQgQWlybGllDQo+IDxhaXJsaWVkQGdtYWls
LmNvbT47IFNpbW9uYSBWZXR0ZXIgPHNpbW9uYUBmZndsbC5jaD47IEphbmkgTmlrdWxhDQo+IDxq
YW5pLm5pa3VsYUBsaW51eC5pbnRlbC5jb20+OyBWaXZpLCBSb2RyaWdvIDxyb2RyaWdvLnZpdmlA
aW50ZWwuY29tPjsgSm9vbmFzDQo+IExhaHRpbmVuIDxqb29uYXMubGFodGluZW5AbGludXguaW50
ZWwuY29tPjsgVHZydGtvIFVyc3VsaW4NCj4gPHR1cnN1bGluQHVyc3VsaW4ubmV0PjsgeGF2ZXIu
aHVnbEBrZGUub3JnOyBhbmRyZWFsbWVpZEBpZ2FsaWEuY29tOyBLdW1hciwNCj4gTmF2ZWVuMSA8
bmF2ZWVuMS5rdW1hckBpbnRlbC5jb20+OyBTeXJqYWxhLCBWaWxsZSA8dmlsbGUuc3lyamFsYUBp
bnRlbC5jb20+Ow0KPiBEbWl0cnkgQmFyeXNoa292IDxsdW1hZ0BrZXJuZWwub3JnPg0KPiBDYzog
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgaW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZzsgaW50ZWwtDQo+IHhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBTdWJqZWN0OiBS
ZTogW1BBVENIIFtSRkNdIHYzIDUvN10gZHJtL2F0b21pYzogQWxsb3cgcGxhbmVzIHdpdGggTlVM
TCBmYiBhbG9uZw0KPiB3aXRoIGFzeW5jIGZsaXANCj4gDQo+IE9uIDEvOC8yNiAxMDo0MywgQXJ1
biBSIE11cnRoeSB3cm90ZToNCj4gPiBBbG9uZyB3aXRoIGFzeW5jIGZsaXAgaWYgdGhlcmUgaXMg
YSByZXF1ZXN0IHRvIGRpc2FibGUgYSBzeW5jIHBsYW5lIGJ5DQo+ID4gcHJvdmlkaW5nIGEgTlVM
TCBmYiBhbGxvdyB0aGVtLg0KPiANCj4gVGhhdCBjb3VsZCByZXN1bHQgaW4gYXN5bmMgY2hhbmdl
cyB0byBvdGhlciBwbGFuZXMgdGFraW5nIGVmZmVjdCBpbiBhbiBlYXJsaWVyDQo+IHJlZnJlc2gg
Y3ljbGUgdGhhbiB0aGUgc3luYyBwbGFuZSBiZWluZyBkaXNhYmxlZCwgY291bGRuJ3QgaXQ/IElu
IHdoaWNoIGNhc2UgdGhlDQo+IGNvbW1pdCBhcmd1YWJseSB3b3VsZG4ndCBhY3R1YWxseSBiZSAi
YXRvbWljIi4NCj4gDQpUaGlzIGlzIHRoZSByZXF1ZXN0IGZyb20gdGhlIGNvbW11bml0eSB0byBh
bGxvdyBkaXNhYmxpbmcgb2YgYSBzeW5jIHBsYW5lIGluIGFuIGFzeW5jIGZsaXAgYXRvbWljIGlv
Y3RsLg0KaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2RybS9pOTE1L2tlcm5lbC8tL2lz
c3Vlcy8xMzgzNA0KDQpUaGFua3MgYW5kIFJlZ2FyZHMsDQpBcnVuIFIgTXVydGh5DQotLS0tLS0t
LS0tLS0tLS0tLS0tDQo=
