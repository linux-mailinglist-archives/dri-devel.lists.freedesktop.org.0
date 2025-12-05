Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37160CA8C70
	for <lists+dri-devel@lfdr.de>; Fri, 05 Dec 2025 19:25:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3EED10EB8B;
	Fri,  5 Dec 2025 18:25:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AjQO9g7Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AA6110EB8B
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Dec 2025 18:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764959121; x=1796495121;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=60RRZZAXAUyFvA/5I4jYImgT8FzKvjUh4lnnIkoElJM=;
 b=AjQO9g7Z4zQEbssWnW6r2IMxueKYsmqn7OFIu49qD8J97aywkKQyzI0U
 C5VCQ9W9/hbPiL8UkJebuzf0KynGMug6ajP6e8LslNKHVJtd9pV8hXIuS
 qcKw8Na2pNf1dNm5ZH50VGQKFrIW1dDNx21tckl9kwKO9yfPjjW2mzZGS
 cWbbktlnHH41ZWZI5ApTppjvZ+ueIfWkpE5pt7lm/850dsRGMr+o6SvYY
 w7NPNYuVizYJq1RfKm41gmF3GdCgAie85ftG9YSgfo4ne7XX7Plr4b2i+
 ULYn3xUJIwkxnvX7C6s7jRIrM0KLOWmnraA91IjvtfUCaCv7IPWQQXe2b Q==;
X-CSE-ConnectionGUID: jOlZQ9dqS1C0TAlIbiTZfw==
X-CSE-MsgGUID: OSljPrTBQSywIIj8NbEdtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="78109286"
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; d="scan'208";a="78109286"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 10:25:20 -0800
X-CSE-ConnectionGUID: DB6XWYoTS8Wl8402VJQA1w==
X-CSE-MsgGUID: uUy8PXVURyGh9KP+6+u9iA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; d="scan'208";a="200499638"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 10:25:20 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 5 Dec 2025 10:25:19 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 5 Dec 2025 10:25:19 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.10)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 5 Dec 2025 10:25:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nu8CYU/TbGfQYi9sp1goDTomABIChFi+HGfqLyH9HEtv9UPnWkxF7LunszdGRRy6Duu3pzCexFA+iAUO3EHzK9XuO9nXHgP41oywp8T0TX7agy2MsYkkKIfSIkpTYUVV4U3owndYWA5zs65jv3tHs88W7isegc7PS2BFhNiC7z0JCtCmaDreCGVW4GunGkMHzCfP0isniMgQvbct04PjUFEwudwtvYKCiQ2xThnUcLvUDNsZ/EnnJFzUolPY3F0dG14mYewXndnVa1BNkOZCUpPimnX+ErBhNytOIDHz5uEpUW10ZQnUmPemBlycvZ/QU979jgbOVX1PJwyQNYa21g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=60RRZZAXAUyFvA/5I4jYImgT8FzKvjUh4lnnIkoElJM=;
 b=T/icx301cy0NucfGxKqTdzi8l6Jfme/SCo7YW5a932cZA6F1ylLGZmQKrMzjdsDVYcq5EZ5lcgQw1XFd4z1rPLBvglqubA520l/V64LLJOkBE4q+K8fC6G6d8IGJ6oc7dMThRR4C1FamiQ8EU38iSEqX9bQbU7pRy8qsIBxLAnhWf006Eq0Dt+kvKsJvtnfLHOyryE0Tl46O0RU50HIArNwzSlD3/0mPaoPuo+34fxF6N1Y6Y8rx1HYCdYNDddfR9KYfDeThf8vpyVBoSH9UgcEB5b55TeMIPcZswIGgfroHQUazkS86Q0ZSO3+IUeeLy5hGTRvfsOnhBW3hhQQecA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6418.namprd11.prod.outlook.com (2603:10b6:208:3aa::18)
 by SJ0PR11MB5790.namprd11.prod.outlook.com (2603:10b6:a03:422::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Fri, 5 Dec
 2025 18:25:14 +0000
Received: from IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::68b8:5391:865e:a83]) by IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::68b8:5391:865e:a83%2]) with mapi id 15.20.9388.011; Fri, 5 Dec 2025
 18:25:14 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: "Ruhl, Michael J" <michael.j.ruhl@intel.com>,
 =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <ckoenig.leichtzumerken@gmail.com>,
 "Auld, Matthew" <matthew.auld@intel.com>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linaro-mm-sig@lists.linaro.org"
 <linaro-mm-sig@lists.linaro.org>, "simona.vetter@ffwll.ch"
 <simona.vetter@ffwll.ch>
Subject: RE: [PATCH 1/2] dma-buf: improve sg_table debugging hack v3
Thread-Topic: [PATCH 1/2] dma-buf: improve sg_table debugging hack v3
Thread-Index: AQHcZef8cMFbsvg/aE2xRC96RvXeprUTM9KggAApL+A=
Date: Fri, 5 Dec 2025 18:25:14 +0000
Message-ID: <IA1PR11MB641817BDC348839815581744C1A7A@IA1PR11MB6418.namprd11.prod.outlook.com>
References: <20251205130604.1582-1-christian.koenig@amd.com>
 <IA1PR11MB64181483C8F0AF277B2A874AC1A7A@IA1PR11MB6418.namprd11.prod.outlook.com>
In-Reply-To: <IA1PR11MB64181483C8F0AF277B2A874AC1A7A@IA1PR11MB6418.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6418:EE_|SJ0PR11MB5790:EE_
x-ms-office365-filtering-correlation-id: 8a8d81fd-4385-4c95-96a3-08de342ba27e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?ZDZ5dkNvcDN0Y3lzeUJyNWdMNWIxNVJ4RTFQSExWdFFOZUNMNEp4MWc4bmxa?=
 =?utf-8?B?QXRsbGxCZHQ0T29NWkhJVXFkTjgwbHBCMHMySXZxV0c5eXZzbG9TUXV2MlJQ?=
 =?utf-8?B?NmdtNER5U2ZqbW0vbjAvcGxHYW1tanUvaVVvc2xBSmw5VkczbW41Z3lUNTRt?=
 =?utf-8?B?ekEzOG9JWUdGMjJiVXRGL2c5aWZZVlBQN29jekdDZDlGUDZCaEMzVS9adGli?=
 =?utf-8?B?SjhsTEl1QWNmR3B2ME9qekI0UGxsVTVTaEpWc1QvVUNqdmppNm5PclpqSlMr?=
 =?utf-8?B?NlIvYmNxK3RvZ29IK2Z6ZHMrZjVWMys4VjB0RVNUTWVpcFRqL01RZGlEOVRH?=
 =?utf-8?B?TkRZZ04veUNYRy9yTnBWUk52dlkxbDlKekFTS3lBT2prKzh3a0FnYUt2TWVv?=
 =?utf-8?B?WEVlZFFkOUM1M0poUk0wb21BbTRiM01qVjE2ZktXNTBMVFgxc3oyeUxkdVNo?=
 =?utf-8?B?b2ZURjIzbGZwaE5rd1oxQjUvWFBNWWNlczc0eEpqUkd1d2JBbTNLdy9kYVBY?=
 =?utf-8?B?WDVSMVJscWNZYVN3U3FJWHdrbmtWU0R2MkVqaldTZXBqVmUxYXBYWmp6WmRH?=
 =?utf-8?B?VkRERi9HY3c5ZmttbHViVTkzSU1ZdHcwaGMvRnhidmwwWEgrM2V2VFpxNUcw?=
 =?utf-8?B?RUxwU0VldEpETlNjWVE5d0hIREpBTENwZDZUTUd4QzY5Y28rc1pQZWcwbHdq?=
 =?utf-8?B?cWp5UVhxbzNFL1VMOWpoTjZSLzlQdmhtQU5ObVVKU0tiYTBKUmZJeTNiaGNM?=
 =?utf-8?B?clo1QWpOQklGb29OMFJhcTN0T3lsUTVTOWJiZU9mTmVjYlRPZnF3NmU4T3gv?=
 =?utf-8?B?SkZ5dW9OK1hqSnloQU1kQzFpcmdDU0pjZGVUN0FBcnBJY1ZBcTd4b2Yxa2E4?=
 =?utf-8?B?QytoSkxYZzBTaGdGOStLcnNQcWx0QjVKbXZTK0pBK3pWK0pHYkZOajk2ajNX?=
 =?utf-8?B?RHM5VTZBQTJBRi9PWDdXazZTcXdFMXlDbmpzZWtYUjRaQ3VJMUtEOFc1am8x?=
 =?utf-8?B?SWh6SXRXSlU4RHVyb0dRdzJwWE5FMi9CdlJCQlIrR0RjTzNOL2QvWU9HNWRZ?=
 =?utf-8?B?eVYvZmxtaVJmaUN5ZG1yV3Y1ZmNhT0laT2lpK0UxZWk1SkxEcVVRY3ZzdVM3?=
 =?utf-8?B?dXkzamd1R1gyNnk2OFozV0tsU201ZDByTzZ4Ry9pbDV5WGZudk5NeW1VMkFN?=
 =?utf-8?B?dmNmcGFaS0xYdXlwSlY3YVJaMjQ1RDBXOFJrcVZVSFMrbXFFelhxWlFFMHVq?=
 =?utf-8?B?S2w4OVRham85ZnAwQVhMYWpkcXNYbzc4MVdCRUVqdVkybXBEV3o1ZzVkeWo4?=
 =?utf-8?B?Q2gzYVJtWkczSTNhcXdualp3ZFkyM28reHhlN21NQkRTcTZ1dDJ6NUVQOFA0?=
 =?utf-8?B?d2pRTWVzOW9ULzZRVzBzUXB1N2t2S1hySGplVlRIUnRTTWF1OEh6R296ektq?=
 =?utf-8?B?SFcxcXBrazQwMlREVmFidWZaTGtubXNnREVCVW51dmQxaTRoMWpqOUg5TjRa?=
 =?utf-8?B?SitRWThValJ5ejhQK3JjT1BHOGdRMzVZWEIyOE9RY1VIYTR4d1QrdmJ6Y0xk?=
 =?utf-8?B?MkZ1dUJLRHY4VzdlV0U3Y2IralNYMm9yY1J5WlA3cVF0R3p1bzFaU1U0RTVh?=
 =?utf-8?B?Si9qcXRKb3BLY3M1VDF3OVhpc2pTZ2NtWWJYSStZOE1nUUNtNmRITzlBQWFR?=
 =?utf-8?B?Y3ROaDBZbzZhdGRPaVh6UzJDUGtKNkxUOVBQclFaVmJLL05mQkYzcVA0RXFp?=
 =?utf-8?B?bGZLRThteS9TdlB6OGN0ZVh5NkVkWVIrVEw3NWlBOHl4ME5DZ0JtNXhGVDJN?=
 =?utf-8?B?UFhBYTNmWHhjWHQrSGZ3OElrbDdQdmVZREpQUzJ4WUN1VU5TdGY4VmNNRktC?=
 =?utf-8?B?SHlkVDg5engxMVZTcHArV1lnem92TTBxZ0ZiSmVQTTRVb1NDK1ZvaVFmZGwr?=
 =?utf-8?B?Z1lnZHltdDhhSmttTU9YYlRRZkdnWVZFOFMyQ2tJRnlGeG5ISWtoRFhSTFNr?=
 =?utf-8?B?SXNJWG1QZzJVeHZyNEc3cVNUU0w2UVBkcFFYS3pIYnd5VmMyd2JnMjdjd2g1?=
 =?utf-8?Q?UwzjY4?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6418.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Qm1TN1pIdFI2MGpCZmNpSjFnWU5HZWVXN0dPNW9WL0s1RjBTT1NHb0tKNGxl?=
 =?utf-8?B?TVErOXphakwvOElrUis4Zm5MeTBYTHBOZTlTN0FDT3lWRVFvZnJZajBWU3E2?=
 =?utf-8?B?UGZyWW54aG8xK3dmZ1NjVE1xL0ZLbktzeUNmQ2NKbEpLM001LzAvV3lZeXNq?=
 =?utf-8?B?cmFKa09ETytHdE5PSlh0MDlSdFJUYmVVcTRsOXJQOFl1Q3lCNUo2U2UzVDcv?=
 =?utf-8?B?MzlDM3pTRGtiem8wYStwVXJaeEs5cmJqTTdpTFZNd2RQYlBYY09GMXNIUGVM?=
 =?utf-8?B?b2tTTTBJbFZQVXpaTnR4SFZ2ZDBVNVh1S3dVS0xJdFd2ejRmczVzNzNyMURX?=
 =?utf-8?B?Q01wQ1N0cWZGK2t5MEgvVzRFRXlRRkN1LzJpeXlZcTdZV0lZRnF5cmNNOERt?=
 =?utf-8?B?SXRzM3NvYk9lUzhzakNwdjhvNSt5emlkVGVkSWJjbmkvRGNySUpSMzJRNUxv?=
 =?utf-8?B?S1VjYTFqNStDSEhNRUk1UnhrMml5NzN5dGRvc3pBRXJiTlNYNG1wSEUyRnRY?=
 =?utf-8?B?dW11bE9JQWdWODVmQWQxSHpiUGFXZFVHMGdRSWNWUmRSb3diQjBKYWQwOXky?=
 =?utf-8?B?ejFKQXBiSGx6VGhSWWFGallvM2RraFZzSUF2K1k2M05LYStTKyswbCtsTzlX?=
 =?utf-8?B?SEN1UGQ1dGlCZ2VCZDR5TVlHY3U1QURkTGpQTWhudVlaWkVoSXIvckh3bTgw?=
 =?utf-8?B?NVRsVU5TZUxOcDAybUR1WVBSc00wNXdWMXdyYkh3Zk5weFZNL1NMT2hXYXlk?=
 =?utf-8?B?NFBaUmdqTEZIOEt3c0RUK1dHYnpwU3BFQmRsYkh3OTUvTVI4S3UxUnY5YzNJ?=
 =?utf-8?B?cFNNRUxoN0VzRjRNa0JrQUpTckY1WXMwU3c0eWdHV1owYVltUjBoMC91c0JU?=
 =?utf-8?B?dk9CRHlxeG12Y253T1E4WElnRU1ua3B6SW9NdktmeU0rSmF2bVU2UW9WUXcy?=
 =?utf-8?B?aHJpVXRaWHQyRWtnK0RlUDYrT3gvcTNUZUNjTmFndmFIcHZwV04rcXV0VGIw?=
 =?utf-8?B?MWJiSTgvWWZsKzBrdHVZaG9nOHVIcDZ4UEpPT1NPdUtuUmNpc3RtUlRQVHJj?=
 =?utf-8?B?NG4yRGVXaEtnMndkK0pIVUtyWU9BS3d4QzQzZTRLSnhsUG9yMGtud0ZDRnY5?=
 =?utf-8?B?M0xwOEdjdmNsaWRvK1dmbnFOWVRsaitZamJSclVmcXFrUVd2TlhIUzhRaXNj?=
 =?utf-8?B?UFRWalIvejJWcEFYcFBteUhFNG9LU2V3OFVLQlpjbG9Ha3J1dGlwaW9YVjEw?=
 =?utf-8?B?VTlPYytPWnoyMzVoMnlCdU1UaGgyWnlTNURaL0Z3ZkxLa0g4SWdkbml1WUJU?=
 =?utf-8?B?OHU3ZmdJcXdBeFZFajYyQU9WN0hiSWZuMkJtK2ZpTUlSVFZHcDFzNnpEUVY0?=
 =?utf-8?B?a0I5bjNLNWNkZjBLYUROYThyN0pzRzZuaGdSS282UldkT3ppdUhncUNRUURt?=
 =?utf-8?B?cEl6a2o3eHNucFdnZmU5Y1ZLcUhaN1h4cllhNVcvL2Q0eUVQYmxxbzV5MzhS?=
 =?utf-8?B?TFJYK2xyOVh2QnhFb0Zrd0VpVUtHTnMwUkFMY3JYN21FbGZ3ZDVYTnozWVNs?=
 =?utf-8?B?dFlpam1xMm5jYVJSL09XR1psOHFnUFJ4WmJUWUd5Vm1mQ2toU28yNEQxM2U4?=
 =?utf-8?B?VnRWS1pXM3FQOUxFcVFvK2dZTjRhdDZqQm4wWkRDQ1B2VkxXRStzVndTak8y?=
 =?utf-8?B?aFZtbFNIRHFKV1FxbDBtNnZ3ekp3M3lUbHRuQ3FZTTB5MXpBZEJsc3JGNnhZ?=
 =?utf-8?B?Y0xMcEY3THFYZkxubG81MzVWS2ZQZzZXWTAzUmF2SDJCcXRrRjBucUwzbTJR?=
 =?utf-8?B?S3RRWm4zVWlhTjZVdm1wT2JtekMvdmxiZy9VRGJOUXNhanpMYXFWUFpYUmVY?=
 =?utf-8?B?MEhhL0ZZZGpicEd1MFU1M0tKUXFZL29zNXJvMU9odDFiQ2ZUbFZFbE1IODM1?=
 =?utf-8?B?Q29GU1AxblZsSzE0NWxLYUJHZm1EdysyQXJuMG9SL1ZkUEFIa2wwZXlDS1A5?=
 =?utf-8?B?K3BGSFdMSXJmMkdDRWZLRldaLzlvcW9USGIxK0VRemZocktCL2dZbVl5UHRq?=
 =?utf-8?B?aC9yRkhvNUtEeWVPbkhmaXRNRkF4eklZRWpoZEhGallkZG1Ga2RpVThmZldk?=
 =?utf-8?Q?Z1j/MdYz+YT3shRVstSAQLEgp?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6418.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a8d81fd-4385-4c95-96a3-08de342ba27e
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Dec 2025 18:25:14.7382 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bJZ8VBEl8xlt1sj0deNLpbvhnCo5hfVXb63sZhv5mC7G/YijN+Wa9mwED1fYv9np2C3kZS9kKRCNPZd61xCy+Ky0Jkv9PkkWTgLFjilm7l0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5790
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

Pi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+RnJvbTogZHJpLWRldmVsIDxkcmktZGV2ZWwt
Ym91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZiBSdWhsLA0KPk1pY2hh
ZWwgSg0KPlNlbnQ6IEZyaWRheSwgRGVjZW1iZXIgNSwgMjAyNSAxMTowMiBBTQ0KPlRvOiBDaHJp
c3RpYW4gS8O2bmlnIDxja29lbmlnLmxlaWNodHp1bWVya2VuQGdtYWlsLmNvbT47IEF1bGQsIE1h
dHRoZXcNCj48bWF0dGhldy5hdWxkQGludGVsLmNvbT47IGxpbnV4LW1lZGlhQHZnZXIua2VybmVs
Lm9yZzsgZHJpLQ0KPmRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgbGluYXJvLW1tLXNpZ0Bs
aXN0cy5saW5hcm8ub3JnOw0KPnNpbW9uYS52ZXR0ZXJAZmZ3bGwuY2gNCj5TdWJqZWN0OiBSRTog
W1BBVENIIDEvMl0gZG1hLWJ1ZjogaW1wcm92ZSBzZ190YWJsZSBkZWJ1Z2dpbmcgaGFjayB2Mw0K
Pg0KPj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPj5Gcm9tOiBkcmktZGV2ZWwgPGRyaS1k
ZXZlbC1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mDQo+PkNocmlz
dGlhbiBLw7ZuaWcNCj4+U2VudDogRnJpZGF5LCBEZWNlbWJlciA1LCAyMDI1IDg6MDYgQU0NCj4+
VG86IEF1bGQsIE1hdHRoZXcgPG1hdHRoZXcuYXVsZEBpbnRlbC5jb20+OyBsaW51eC1tZWRpYUB2
Z2VyLmtlcm5lbC5vcmc7DQo+PmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGxpbmFy
by1tbS1zaWdAbGlzdHMubGluYXJvLm9yZzsNCj4+c2ltb25hLnZldHRlckBmZndsbC5jaDsgUnVo
bCwgTWljaGFlbCBKIDxtaWNoYWVsLmoucnVobEBpbnRlbC5jb20+DQo+PlN1YmplY3Q6IFtQQVRD
SCAxLzJdIGRtYS1idWY6IGltcHJvdmUgc2dfdGFibGUgZGVidWdnaW5nIGhhY2sgdjMNCj4+DQo+
PlRoaXMgZGVidWdnaW5nIGhhY2sgaXMgaW1wb3J0YW50IHRvIGVuZm9yY2UgdGhlIHJ1bGUgdGhh
dCBpbXBvcnRlcnMNCj4+c2hvdWxkICpuZXZlciogdG91Y2ggdGhlIHVuZGVybHlpbmcgc3RydWN0
IHBhZ2Ugb2YgdGhlIGV4cG9ydGVyLg0KPj4NCj4+SW5zdGVhZCBvZiBqdXN0IG1hbmdsaW5nIHRo
ZSBwYWdlIGxpbmsgY3JlYXRlIGEgY29weSBvZiB0aGUgc2dfdGFibGUNCj4+YnV0IG9ubHkgY29w
eSBvdmVyIHRoZSBETUEgYWRkcmVzc2VzIGFuZCBub3QgdGhlIHBhZ2VzLg0KPj4NCj4+VGhpcyB3
aWxsIGNhdXNlIGEgTlVMTCBwb2ludGVyIGRlLXJlZmVyZW5jZSBpZiB0aGUgaW1wb3J0ZXIgdHJp
ZXMgdG8NCj4+dG91Y2ggdGhlIHN0cnVjdCBwYWdlLiBTdGlsbCBxdWl0ZSBhIGhhY2sgYnV0IHRo
aXMgYXQgbGVhc3QgYWxsb3dzIHRoZQ0KPj5leHBvcnRlciB0byBwcm9wZXJseSBrZWVwcyBpdCdz
IHNnX3RhYmxlIGludGFjdCB3aGlsZSBhbGxvd2luZyB0aGUNCj4+RE1BLWJ1ZiBtYWludGFpbmVy
IHRvIGZpbmQgYW5kIGZpeCBtaXNiZWhhdmluZyBpbXBvcnRlcnMgYW5kIGZpbmFsbHkNCj4+c3dp
dGNoIG92ZXIgdG8gdXNpbmcgYSBkaWZmZXJlbnQgZGF0YSBzdHJ1Y3R1cmUgaW4gdGhlIGZ1dHVy
ZS4NCj4+DQo+PnYyOiBpbXByb3ZlIHRoZSBoYWNrIGZ1cnRoZXIgYnkgdXNpbmcgYSB3cmFwcGVy
IHN0cnVjdHVyZSBhbmQgZXhwbGFpbmluZw0KPj50aGUgYmFja2dyb3VuZCBhIGJpdCBtb3JlIGlu
IHRoZSBjb21taXQgbWVzc2FnZS4NCj4+djM6IGZpeCBzb21lIHdoaXRlc3BhY2UgaXNzdWVzLCB1
c2Ugc2dfYXNzaWduX3BhZ2UoKS4NCj4+DQo+PlNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBLw7Zu
aWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4NCj4+UmV2aWV3ZWQtYnk6IE1pY2hhZWwgSi4g
UnVobCA8bWljaGFlbC5qLnJ1aGxAaW50ZWwuY29tPiAodjEpDQo+Pi0tLQ0KPj4gZHJpdmVycy9k
bWEtYnVmL2RtYS1idWYuYyB8IDc0ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0N
Cj4tLQ0KPj4tLS0NCj4+IDEgZmlsZSBjaGFuZ2VkLCA2MCBpbnNlcnRpb25zKCspLCAxNCBkZWxl
dGlvbnMoLSkNCj4+DQo+PmRpZmYgLS1naXQgYS9kcml2ZXJzL2RtYS1idWYvZG1hLWJ1Zi5jIGIv
ZHJpdmVycy9kbWEtYnVmL2RtYS1idWYuYw0KPj5pbmRleCAyMzA1YmIyY2MxZjEuLjk0NGY0MTAz
YjVjYyAxMDA2NDQNCj4+LS0tIGEvZHJpdmVycy9kbWEtYnVmL2RtYS1idWYuYw0KPj4rKysgYi9k
cml2ZXJzL2RtYS1idWYvZG1hLWJ1Zi5jDQo+PkBAIC0zNSw2ICszNSwxMiBAQA0KPj4NCj4+ICNp
bmNsdWRlICJkbWEtYnVmLXN5c2ZzLXN0YXRzLmgiDQo+Pg0KPj4rLyogV3JhcHBlciB0byBoaWRl
IHRoZSBzZ190YWJsZSBwYWdlIGxpbmsgZnJvbSB0aGUgaW1wb3J0ZXIgKi8NCj4+K3N0cnVjdCBk
bWFfYnVmX3NnX3RhYmxlX3dyYXBwZXIgew0KPj4rCXN0cnVjdCBzZ190YWJsZSAqb3JpZ2luYWw7
DQo+PisJc3RydWN0IHNnX3RhYmxlIHdyYXBwZXI7DQo+Pit9Ow0KPj4rDQo+PiBzdGF0aWMgaW5s
aW5lIGludCBpc19kbWFfYnVmX2ZpbGUoc3RydWN0IGZpbGUgKik7DQo+Pg0KPj4gc3RhdGljIERF
RklORV9NVVRFWChkbWFidWZfbGlzdF9tdXRleCk7DQo+PkBAIC04MjgsMjEgKzgzNCw1OSBAQCB2
b2lkIGRtYV9idWZfcHV0KHN0cnVjdCBkbWFfYnVmICpkbWFidWYpDQo+PiB9DQo+PiBFWFBPUlRf
U1lNQk9MX05TX0dQTChkbWFfYnVmX3B1dCwgIkRNQV9CVUYiKTsNCj4+DQo+Pi1zdGF0aWMgdm9p
ZCBtYW5nbGVfc2dfdGFibGUoc3RydWN0IHNnX3RhYmxlICpzZ190YWJsZSkNCj4+K3N0YXRpYyBp
bnQgZG1hX2J1Zl9tYW5nbGVfc2dfdGFibGUoc3RydWN0IHNnX3RhYmxlICoqc2dfdGFibGUpDQo+
DQo+eW91IGFyZSBub3QgcmVhbGx5IG1hbmdsaW5nIHRoaXMgYW55bW9yZS4uLg0KPg0KPmRtYV9i
dWZfY2xvbmVfc2dfdGFibGUoKQ0KPmRtYV9idWZfdW5jbG9uZV9zZ190YWJsZSgpDQo+DQo+bWF5
YmU/DQo+DQo+DQo+PiB7DQo+Pi0jaWZkZWYgQ09ORklHX0RNQUJVRl9ERUJVRw0KPj4tCWludCBp
Ow0KPj4tCXN0cnVjdCBzY2F0dGVybGlzdCAqc2c7DQo+Pi0NCj4+LQkvKiBUbyBjYXRjaCBhYnVz
ZSBvZiB0aGUgdW5kZXJseWluZyBzdHJ1Y3QgcGFnZSBieSBpbXBvcnRlcnMgbWl4DQo+Pi0JICog
dXAgdGhlIGJpdHMsIGJ1dCB0YWtlIGNhcmUgdG8gcHJlc2VydmUgdGhlIGxvdyBTR18gYml0cyB0
bw0KPj4tCSAqIG5vdCBjb3JydXB0IHRoZSBzZ3QuIFRoZSBtaXhpbmcgaXMgdW5kb25lIG9uIHVu
bWFwDQo+Pi0JICogYmVmb3JlIHBhc3NpbmcgdGhlIHNndCBiYWNrIHRvIHRoZSBleHBvcnRlci4N
Cj4+KwlzdHJ1Y3Qgc2NhdHRlcmxpc3QgKnRvX3NnLCAqZnJvbV9zZzsNCj4+KwlzdHJ1Y3Qgc2df
dGFibGUgKmZyb20gPSAqc2dfdGFibGU7DQo+PisJc3RydWN0IGRtYV9idWZfc2dfdGFibGVfd3Jh
cHBlciAqdG87DQo+PisJaW50IGksIHJldDsNCj4+Kw0KPj4rCWlmICghSVNfRU5BQkxFRChDT05G
SUdfRE1BQlVGX0RFQlVHKSkNCj4+KwkJcmV0dXJuIDA7DQo+PisNCj4+KwkvKg0KPj4rCSAqIFRv
IGNhdGNoIGFidXNlIG9mIHRoZSB1bmRlcmx5aW5nIHN0cnVjdCBwYWdlIGJ5IGltcG9ydGVycyBj
b3B5IHRoZQ0KPj4rCSAqIHNnX3RhYmxlIHdpdGhvdXQgY29weWluZyB0aGUgcGFnZV9saW5rIGFu
ZCBnaXZlIG9ubHkgdGhlIGNvcHkgYmFjaw0KPj50bw0KPj4rCSAqIHRoZSBpbXBvcnRlci4NCj4+
IAkgKi8NCj4+LQlmb3JfZWFjaF9zZ3RhYmxlX3NnKHNnX3RhYmxlLCBzZywgaSkNCj4+LQkJc2ct
PnBhZ2VfbGluayBePSB+MHhmZlVMOw0KPj4tI2VuZGlmDQo+PisJdG8gPSBremFsbG9jKHNpemVv
ZigqdG8pLCBHRlBfS0VSTkVMKTsNCj4+KwlpZiAoIXRvKQ0KPj4rCQlyZXR1cm4gLUVOT01FTTsN
Cj4+Kw0KPj4rCXJldCA9IHNnX2FsbG9jX3RhYmxlKCZ0by0+d3JhcHBlciwgZnJvbS0+bmVudHMs
IEdGUF9LRVJORUwpOw0KPj4rCWlmIChyZXQpDQo+PisJCWdvdG8gZnJlZV90bzsNCj4+Kw0KPj4r
CXRvX3NnID0gdG8tPndyYXBwZXIuc2dsOw0KPj4rCWZvcl9lYWNoX3NndGFibGVfZG1hX3NnKGZy
b20sIGZyb21fc2csIGkpIHsNCj4+KwkJdG9fc2ctPm9mZnNldCA9IDA7DQo+PisJCXRvX3NnLT5s
ZW5ndGggPSAwOw0KPj4rCQlzZ19hc3NpZ25fcGFnZSh0b19zZywgTlVMTCk7DQo+DQo+c2dfc2V0
X3BhZ2UodG9fc2csIE5VTEwsIDAsIDApOyA/DQoNCkp1c3Qgd2h5IHlvdSBhcmUgdXNpbmcgdGhp
cyBvbmUuLi4gaWdub3JlIHRoaXMgdGhvdWdodC4uLg0KDQo+SnVzdCB0aG91Z2h0cy4uLiBUaGlz
IGxvb2tzIHJlYXNvbmFibGUgdG8gbWUuDQo+DQo+V2l0aCBvciB3aXRob3V0IHRoZXNlIGNoYW5n
ZXM6DQo+DQo+UmV2aWV3ZWQtYnk6IE1pY2hhZWwgSi4gUnVobCA8bWljaGFlbC5qLnJ1aGxAaW50
ZWwuY29tPg0KPg0KPk0NCj4NCj4+KwkJc2dfZG1hX2FkZHJlc3ModG9fc2cpID0gc2dfZG1hX2Fk
ZHJlc3MoZnJvbV9zZyk7DQo+PisJCXNnX2RtYV9sZW4odG9fc2cpID0gc2dfZG1hX2xlbihmcm9t
X3NnKTsNCj4+KwkJdG9fc2cgPSBzZ19uZXh0KHRvX3NnKTsNCj4+Kwl9DQo+Pg0KPj4rCXRvLT5v
cmlnaW5hbCA9IGZyb207DQo+PisJKnNnX3RhYmxlID0gJnRvLT53cmFwcGVyOw0KPj4rCXJldHVy
biAwOw0KPj4rDQo+PitmcmVlX3RvOg0KPj4rCWtmcmVlKHRvKTsNCj4+KwlyZXR1cm4gcmV0Ow0K
Pj4rfQ0KPj4rDQo+PitzdGF0aWMgdm9pZCBkbWFfYnVmX2RlbWFuZ2xlX3NnX3RhYmxlKHN0cnVj
dCBzZ190YWJsZSAqKnNnX3RhYmxlKQ0KPj4rew0KPj4rCXN0cnVjdCBkbWFfYnVmX3NnX3RhYmxl
X3dyYXBwZXIgKmNvcHk7DQo+PisNCj4+KwlpZiAoIUlTX0VOQUJMRUQoQ09ORklHX0RNQUJVRl9E
RUJVRykpDQo+PisJCXJldHVybjsNCj4+Kw0KPj4rCWNvcHkgPSBjb250YWluZXJfb2YoKnNnX3Rh
YmxlLCB0eXBlb2YoKmNvcHkpLCB3cmFwcGVyKTsNCj4+Kwkqc2dfdGFibGUgPSBjb3B5LT5vcmln
aW5hbDsNCj4+KwlzZ19mcmVlX3RhYmxlKCZjb3B5LT53cmFwcGVyKTsNCj4+KwlrZnJlZShjb3B5
KTsNCj4+IH0NCj4+DQo+PiBzdGF0aWMgaW5saW5lIGJvb2wNCj4+QEAgLTExMzksNyArMTE4Myw5
IEBAIHN0cnVjdCBzZ190YWJsZSAqZG1hX2J1Zl9tYXBfYXR0YWNobWVudChzdHJ1Y3QNCj4+ZG1h
X2J1Zl9hdHRhY2htZW50ICphdHRhY2gsDQo+PiAJCWlmIChyZXQgPCAwKQ0KPj4gCQkJZ290byBl
cnJvcl91bm1hcDsNCj4+IAl9DQo+Pi0JbWFuZ2xlX3NnX3RhYmxlKHNnX3RhYmxlKTsNCj4+Kwly
ZXQgPSBkbWFfYnVmX21hbmdsZV9zZ190YWJsZSgmc2dfdGFibGUpOw0KPj4rCWlmIChyZXQpDQo+
PisJCWdvdG8gZXJyb3JfdW5tYXA7DQo+Pg0KPj4gCWlmIChJU19FTkFCTEVEKENPTkZJR19ETUFf
QVBJX0RFQlVHKSkgew0KPj4gCQlzdHJ1Y3Qgc2NhdHRlcmxpc3QgKnNnOw0KPj5AQCAtMTIyMCw3
ICsxMjY2LDcgQEAgdm9pZCBkbWFfYnVmX3VubWFwX2F0dGFjaG1lbnQoc3RydWN0DQo+PmRtYV9i
dWZfYXR0YWNobWVudCAqYXR0YWNoLA0KPj4NCj4+IAlkbWFfcmVzdl9hc3NlcnRfaGVsZChhdHRh
Y2gtPmRtYWJ1Zi0+cmVzdik7DQo+Pg0KPj4tCW1hbmdsZV9zZ190YWJsZShzZ190YWJsZSk7DQo+
PisJZG1hX2J1Zl9kZW1hbmdsZV9zZ190YWJsZSgmc2dfdGFibGUpOw0KPj4gCWF0dGFjaC0+ZG1h
YnVmLT5vcHMtPnVubWFwX2RtYV9idWYoYXR0YWNoLCBzZ190YWJsZSwgZGlyZWN0aW9uKTsNCj4+
DQo+PiAJaWYgKGRtYV9idWZfcGluX29uX21hcChhdHRhY2gpKQ0KPj4tLQ0KPj4yLjQzLjANCg0K
