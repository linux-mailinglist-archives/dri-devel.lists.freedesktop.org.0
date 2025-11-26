Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5CB4C8B7B0
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 19:50:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C209710E6E4;
	Wed, 26 Nov 2025 18:50:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="t8Q/pacy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011059.outbound.protection.outlook.com [40.107.208.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD58810E677;
 Wed, 26 Nov 2025 18:50:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kfFbwpVD2L1c6XykHPZ6T8C5DdqUN+az9fGjKOkas3RdWPACQgTj1ArMysT0b4eJAvicMvEj7lIZn8jUIXr5IApgbNdydByAPYcBA/UtsqlPA9HHm+1z9gKVUQ9izRhgZt0qivYZo0yF1zBjNGfKgJjrZKTetW/OswwRleyNFl12NnE49+1BMKnse+N15ib+HJnt4AbdRLCAki85tlyARnECS6QwsA1vNLHoL76j+vkHcq27bUR9pQWC6WYJ56hnZId8yc5KuD24VS3Dkqv7W6CyvzJXT95wFPTnN3tsnkvlEeN0mxRvj3RQfhhh+NYKk0GYYG2bDd+uz7vHab47mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zWhrKJmHn6SEnfdAWQ3JlWrazLNYJ0W4lPgr3lM2H6Y=;
 b=PZrgH9t31fzLuE7Mk+imEf9Rd/+ZKW6c9JBEO51/dsP8mstCYc3I3EHqbaxqxJdTNCo2UlHFSFeQEVohO9fwTRBRXDlqp2ZqoRaCctEBltonToaHeZ9Wz6MUizZkt/L+QmxEJ0m7buluWkYUevspl4uhI7odC7m6XzPzhTq56MXgYbro4WOZTt0tdorwimzmIvLigE0tK8Kgz7cAgXZfr5ccur9YaoiBPEb89jconYa6It7IkgWnd2WFBun2eEcU3XwuJCrxtb8/MhwCmf8dHtBGkDB0ezJdGqXUvSNvHqW2vgj81KylvEDwOlzL7O9Io6gaF8BWGi+rALojqxPkZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zWhrKJmHn6SEnfdAWQ3JlWrazLNYJ0W4lPgr3lM2H6Y=;
 b=t8Q/pacyyB+UQ3lE5VmcSXqaD5i784b7glH+Ocd2hFeh2XiHD3yoNgJPJa8hiPJ3NN8nVeKOAvUAwl/OfXLQHuX5r2+BjUxaV9zeK1f8tsvgxvYUBFYb29TzSnVnG14Y1lfC4iIO/ynJ3yUPisg52VabWixKzKqw76U1tw8hnz3+G0RLFSCqqa0sk8Jw8UOnDp4O6Gxus2uYMVFeaz4js0ImOzRD1Q2xGG4+MGzfaABBbLW/ZWcURg+LHir4OisWJrkFnAtvfhOcSWtzoL7mzPGYj9zk7NK3dMaRnq6W86rCDNnhDBBE9jrSV+z3HjEcGbSw8WPnked+k2MjR/OZOA==
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by IA0PPFA19DE7612.namprd12.prod.outlook.com
 (2603:10b6:20f:fc04::bdd) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.13; Wed, 26 Nov
 2025 18:50:34 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9366.009; Wed, 26 Nov 2025
 18:50:34 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "dakr@kernel.org" <dakr@kernel.org>, "airlied@gmail.com" <airlied@gmail.com>, 
 Alistair Popple <apopple@nvidia.com>, "ojeda@kernel.org" <ojeda@kernel.org>,
 "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>, "boqun.feng@gmail.com"
 <boqun.feng@gmail.com>, "gary@garyguo.net" <gary@garyguo.net>,
 "bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>, "lossin@kernel.org"
 <lossin@kernel.org>, "a.hindborg@kernel.org" <a.hindborg@kernel.org>,
 "aliceryhl@google.com" <aliceryhl@google.com>, "tmgross@umich.edu"
 <tmgross@umich.edu>, "simona@ffwll.ch" <simona@ffwll.ch>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, John Hubbard <jhubbard@nvidia.com>, Timur Tabi
 <ttabi@nvidia.com>, "joel@joelfernandes.org" <joel@joelfernandes.org>,
 "elle@weathered-steel.dev" <elle@weathered-steel.dev>,
 "daniel.almeida@collabora.com" <daniel.almeida@collabora.com>, Andrea Righi
 <arighi@nvidia.com>, "phasta@kernel.org" <phasta@kernel.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, Nouveau
 <nouveau-bounces@lists.freedesktop.org>, Alexandre Courbot
 <acourbot@nvidia.com>
Subject: Re: [PATCH v2 1/3] rust: helpers: Add list helpers for C linked list
 operations
Thread-Topic: [PATCH v2 1/3] rust: helpers: Add list helpers for C linked list
 operations
Thread-Index: AQHcUy58YAKhaa3SYEu72qT54gYYALUDj+0AgAA481eAAHVaAIABJoGj
Date: Wed, 26 Nov 2025 18:50:34 +0000
Message-ID: <F3A7E1BB-883C-4EF4-B245-8E9DD329131F@nvidia.com>
References: <20251111171315.2196103-1-joelagnelf@nvidia.com>
 <DEHV08MPF9CH.1GZAWEGC4AVF3@nvidia.com>
 <095D38BD-A8AA-4BC3-8C24-9454964EB8F8@nvidia.com>
 <DEI89VUEYXAJ.1IQQPC3QRLITP@nvidia.com>
In-Reply-To: <DEI89VUEYXAJ.1IQQPC3QRLITP@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR12MB8059:EE_|IA0PPFA19DE7612:EE_
x-ms-office365-filtering-correlation-id: b2c9b445-de24-4fa1-1aa0-08de2d1caea0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?LzBSL0VGazBWTGNDN1J3TC9aOWpJSkI3Wk1veUJLL0NWM2R4a09GV095RnIr?=
 =?utf-8?B?NmVPT2ZXdlU5cUtZS0VWYlU1TWlzd3duOGxuT0dnZzEvUXFlUU8vaG5lYmhZ?=
 =?utf-8?B?Tkc2WTVoUmJ3bnRacG9DVzZSRTByc0pabVVwSzBhQ0hpbXFUMWxrQlQ0RUtq?=
 =?utf-8?B?Ynphb09BYXRCZmpsdFkyb3Q5aURPYmoxRlBpVVdkWUFOcTJ2ck9Ra3pWRGRk?=
 =?utf-8?B?TzI3TEZDSEYva1FpazF1K1VVTTJTRFlNRTUzdlNOYlY5bEJpbmY5aS84cUVF?=
 =?utf-8?B?Y0h4OURVcTk3REUrU292K2E3TVRPeEZjZjJ0blJLa21xK2ZydlpsdmxsYzdW?=
 =?utf-8?B?NUREVDIvSm5lRjIvSTBhWXlFc0tVQjFaQk9IVFZVZnFKdHMzdXFKWkdSY2FC?=
 =?utf-8?B?Q2xZRzVaQ3N3cmxjQlVUZXNoT1dKNU9FMEFnY1pQUVhqQWp0dmwyemdsbTNR?=
 =?utf-8?B?aDdHSWsrb3BoTkpLcmtGRmV5TkE1M0t3V1BNeHl5dHVQaU5wTWFCWGNuTEZS?=
 =?utf-8?B?bWx3bjdrZDhCZ0YzMnNzeVdiS3E0Q1VxR1l2VFZ4V0dHSGlYNDQ4UDNRTWFo?=
 =?utf-8?B?OFByVkNIbDFKbFE5NlBIR3J3M1JRaCtnQVhkK01aSVFDck5FYWN4NWdqTFA1?=
 =?utf-8?B?bFpjdnJXaVVYdDRNVWcyTUtFZXlBUlBTb25EaDNuMkFQckpUbWR5c3dzdm5u?=
 =?utf-8?B?ZUtOajhSc0ROTXNqWmxYV21QQ3RRVW82cktraFBISGJoNXI2RThrZXhrWExs?=
 =?utf-8?B?M0NQVnBEMmZFQmxYaktwems2UDZMOTZsTGRhbVcwTFdpM2dYU0paQmJyT3Ny?=
 =?utf-8?B?bjdHTmdQdnBIcG5oL1RNMzVVUUJxTW5OLzJTaFdWQWZTOVBCTWVqNXVsUzlK?=
 =?utf-8?B?dUUwZE9QUHZmT0o5ZWhMZU9UYTVlZjhQNW1rcjF4TlpBRHRiMnpDWWJGRTVE?=
 =?utf-8?B?TkorZ29PR1lTUUhjTE83WFBNcFBaYytXSEprb1k0RE9HZDdVWTlsa2xRTDFK?=
 =?utf-8?B?Z3RxcEQxRS81ZFB4RFE3RXNYRU9xMzN4SUJucERCcll0MTkvMFN0VC9wQzVG?=
 =?utf-8?B?WFJWaWU0WkxHbDdvWmloTWJFZmdOWms5N0V1STdVaFl5TEVJazRHMGJZNGtL?=
 =?utf-8?B?eXJNWnJGZWl1aWpoeHZpcTBQQ0FVZkNvczB0ajR3WE5YTm9SaEFLbGZPQUdx?=
 =?utf-8?B?RE1YVEh1ejNjWUFHcVp4R1RURnFVQ0cyY2cyM3ZUQWxZM2dtdUdOQ1dsamdT?=
 =?utf-8?B?U2JDT2tnYjJYV1FVRUNDZXI3clpZY0ZMR1BYZHJsTEZDcFJnd1ZZZGdaSmVx?=
 =?utf-8?B?NDhWVGJVeDc4UUdPeVdCL2dPQWwrQnc0MVZoMlQycDBWekFLeFd0bGgvM2Vh?=
 =?utf-8?B?SGNhQmZlZEx5a3dNam1FQ0VCL2xLMDBUeHNTTGhoTTh6aHdGaEUrWk1MNzdL?=
 =?utf-8?B?QThkaWtIWlg1cHVEK0FWVU9KZmo4K2xvaFVtUGtxdHh2a2FnSnpndGZ5UWha?=
 =?utf-8?B?bmxRU3hYUVBsSE5rVjhWazlvdmxXVlpPMnF4Ujg3VGsvZ1hCZ1M5VDMxS3BJ?=
 =?utf-8?B?L3A4UnI5eUxtK3IyRkhsNDBhN1RPOExtWlM1VE5kM1ptUVFrMHpOa3JlblMw?=
 =?utf-8?B?MVZTSWs0bUFES2owZHVnZkZDUUNTSS8zWFJCd1BmSTEyd0NFcUdwcmdvaURF?=
 =?utf-8?B?MGtSVFovNk04NDhvdXAyUThieHNXRm1jdlRkMjl4bWRCTlZOMWRnNGFId09p?=
 =?utf-8?B?QjQyL1ZVQzdVbUZKMkVlaGJwWEpPSkhQaEI0a0hDNCtrTnJ1YllDTlF3YVZx?=
 =?utf-8?B?RTJJOSswM3h5cXY2SGYrZHF0WUlsMGlXYXcyTS9keVQrNWFrQkZsN2F6bThK?=
 =?utf-8?B?TTR5V0kwbHY0blN4bjNhR3NPMzl1VS8xOXA2aGluUU9GbytBczBWR3JLZDhG?=
 =?utf-8?B?VDhITjBCMHZ3WGN5WlZTdjVoTlQza2tFZzJ4d0p1MmhWR0NXYWdhM3RBWEpZ?=
 =?utf-8?B?T3ZoU1hOVlJncnFuVHlMRmFaaFhJYkJLUEVsREtBempJYURoS00rWjRZOFJi?=
 =?utf-8?Q?hRk8i/?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TG5kRXpNQTU1OXFhTEVLbXJPcFV3QU5lNnZWTWVudVMvZmpzUEk1UDFtbG15?=
 =?utf-8?B?aGY3STBZNlBVRnVaZXBVV2s5bkdmZUR3Sm4ySkdpdkZBakFnb1A1NEh5TG5P?=
 =?utf-8?B?VGJ1Vm9UZGl6elcycFZSOW1GQWp4bC9KeGVhdHprU2VJQ2FFSm9nWUkxUkxR?=
 =?utf-8?B?dVQzUDZTMU40cUs5U2x3cG9wUnNhanhuOEgwcXNCZ29BL3FEYmVYOVhJTElm?=
 =?utf-8?B?QTQxZGxTalY0cGFhQTlGejMwc1FFQ3ZFd0Z1ejh4TSszOWI0a3FJdFlacEJi?=
 =?utf-8?B?UWxsWEtZbk1OaVNMZFlDUnlwV3Bxc0loYXNJaytIYzE0U0l1Y0VZcitEYVVl?=
 =?utf-8?B?OUhsdndYMzRwbDFyZnkxcmZudzRJRjFPY0QxREZoeG5Jb3NsbjJBMVFIaCts?=
 =?utf-8?B?M2NMM0o3RDhjRTlCNXVOYy83VE9nUkZVT1dwY2dra3lmenBRUzFTSTg3N2Yz?=
 =?utf-8?B?T09sNUtOcUliRHhEdmdGZlQzMW1teDRrNnBOK1dqcGwyNlBnMWljK3QraTRt?=
 =?utf-8?B?MXRoZDhYR3RFTGlKTDMrdmpxQWFvU29FbE0rNE90ZXc0N0ZMU3FhYmE0SWFX?=
 =?utf-8?B?SGZWVzBSRHJWSFRkYWxyZXplRFhQaG55azI0dU4vYzlEYU5xRU5hSlNwT3Ay?=
 =?utf-8?B?ZmdLcUlvWGY5alljS2tLVzhyRWZCalQzNlBsUHZOWlpoOC9BV1RzeWxCQWht?=
 =?utf-8?B?clVTNlJHNUtHOVhnRWczUTNmYitKdjYvNzdQWW5QazdIeXRkZHRKWS9CV2lk?=
 =?utf-8?B?MUlQcHFEdGFSWEdTSklwbUszTFlTNTNzNUlYY0NhbFRjRDcwa1ZXLzhoRWZP?=
 =?utf-8?B?TDkvZUUwZlZvVTJRUWI1cEtqVUNQUnlNc0ttOVZOaUdvQzI2RWkzQUtLb3F1?=
 =?utf-8?B?MlM4UDJ5ejk0WldFS04vSlpyZEZoZk5GbE0xcUpmVW1qbWFnK2d4OEZCZVY4?=
 =?utf-8?B?VU1uY0d0RDd5WlFQVXg1QzdRaFlBZ1p0WS9GV1ZsSEdiMEM2czJDclBtOGtv?=
 =?utf-8?B?MlBNaDlRZ1pXeEJqZ1YydWtJNXR6UzlmTHZFQTBxTkdWYld3d2EzSURyU0Zl?=
 =?utf-8?B?WDZ0V1lhSllmWU01ZkgvZGpVeUg1QytiL3JTMVFOR2t5YVlVNFo4M3M2ZDlM?=
 =?utf-8?B?VTcvVXJiR1lUSFdpZW9NTTlob1NKYktKS0ZVdTNtTjRFNTBFWGpVNEF3dkl5?=
 =?utf-8?B?T0F5bWFwN2w1TlljeURNZ2RWc3Zmc3ZYQzVOQUFVb29GVDFUTHJhRjBQVUJJ?=
 =?utf-8?B?enNtU2dPeGR4VHZXQ3dadGNqU05ydzFxcmRWMGZEeERpQU50YThnRXJXenNr?=
 =?utf-8?B?eUFKTng4K2NGVENVWW1LNWl2eDNUcDFKVmJPM0kxN3BFcHAzQkRPeE4zWUJJ?=
 =?utf-8?B?ZzVvcWNhdTlUUVRYUDdBamJtTTIzLzRiWVBOVVlMd3NCOVZTa21zcGJKUFpK?=
 =?utf-8?B?czJzbmVWbkVZRlM2OWVaOVgrT1BISUlTYXZPWGRFOFlzdDdKR3J5OEtKWFh0?=
 =?utf-8?B?bkNsK0xzVmVnVXZoSEhQaDV3TWwrS0tqOFVRVVFPWnZOWVRqRWk1dkxnVldz?=
 =?utf-8?B?OEVURHpRQVJiNGs1UGNoMlgvaitGVGxjZlEzdSsvWXhKVGp6YWhZeFVoaFVV?=
 =?utf-8?B?VUdYS2dRMkppZFVwd3JQRlNKTDdHRFp0MG0yOHZtY0lFK3pmZUw4elNtYjJL?=
 =?utf-8?B?dUpLTWN1TFBkWTlFbCtkdkFUNms0aVNNZGZ5SjRPWGloY0xXaTV4cGZrKzdy?=
 =?utf-8?B?RFJob2F0YlRKUmx6eno3WjhZWFN6bjNkZm0wbWtnaVNvbkxaQTNEUVJteVRY?=
 =?utf-8?B?SzMrSjArSjN4Q2M0enlmSm9MNDlrd1NyZGloMnRHaTdVenV5THpJTGJVaGk4?=
 =?utf-8?B?VFh1aEIrUm1xeDV4RGRqdGg5NklOcTlwU0gwRDQ5amJkR2w4cEozTHpERWUv?=
 =?utf-8?B?ZVcxc3MwdHNiTkhUaEtWQkFCM21zMmh0ZTdMRVJ0OUJWSXlXblBmd1gvSGxh?=
 =?utf-8?B?SGV2MlhIdXVpc3FSaWI3cG5Mb25uOWRBVzZxWE04QXIrMXpCbk1GdFA4dm9M?=
 =?utf-8?B?VXk3VW5Fc0lnMERDWEoyUDVoSkpIOWNpamxCSUJab2loQjJvamZLeVM1SkpB?=
 =?utf-8?Q?OSPxY392fOLJzyfUYzd3JD1T0?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2c9b445-de24-4fa1-1aa0-08de2d1caea0
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2025 18:50:34.4666 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JzRMjrKx7I62wzabH6VMw9UBDtOMHJb1kCCREXm7RSw4S+dcL7wWQeF6JvUtD5pHIXWeuBvCApVuNup7KTaFEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPFA19DE7612
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

DQoNCj4gT24gTm92IDI1LCAyMDI1LCBhdCA4OjE24oCvUE0sIEFsZXhhbmRyZSBDb3VyYm90IDxh
Y291cmJvdEBudmlkaWEuY29tPiB3cm90ZToNCj4gDQo+IO+7v09uIFdlZCBOb3YgMjYsIDIwMjUg
YXQgMzoxNiBBTSBKU1QsIEpvZWwgRmVybmFuZGVzIHdyb3RlOg0KPj4gDQo+PiANCj4+Pj4gT24g
Tm92IDI1LCAyMDI1LCBhdCA5OjUy4oCvQU0sIEFsZXhhbmRyZSBDb3VyYm90IDxhY291cmJvdEBu
dmlkaWEuY29tPiB3cm90ZToNCj4+PiANCj4+PiDvu79PbiBXZWQgTm92IDEyLCAyMDI1IGF0IDI6
MTMgQU0gSlNULCBKb2VsIEZlcm5hbmRlcyB3cm90ZToNCj4+Pj4gQWRkIFJ1c3QgaGVscGVyIGZ1
bmN0aW9ucyBmb3IgY29tbW9uIEMgbGlua2VkIGxpc3Qgb3BlcmF0aW9ucw0KPj4+PiB0aGF0IGFy
ZSBpbXBsZW1lbnRlZCBhcyBtYWNyb3Mgb3IgaW5saW5lIGZ1bmN0aW9ucyBhbmQgdGh1cyBub3QN
Cj4+Pj4gZGlyZWN0bHkgYWNjZXNzaWJsZSBmcm9tIFJ1c3QuDQo+Pj4+IA0KPj4+PiBTaWduZWQt
b2ZmLWJ5OiBKb2VsIEZlcm5hbmRlcyA8am9lbGFnbmVsZkBudmlkaWEuY29tPg0KPj4+PiAtLS0N
Cj4+Pj4gcnVzdC9oZWxwZXJzL2hlbHBlcnMuYyB8ICAxICsNCj4+Pj4gcnVzdC9oZWxwZXJzL2xp
c3QuYyAgICB8IDMyICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+Pj4+IDIgZmls
ZXMgY2hhbmdlZCwgMzMgaW5zZXJ0aW9ucygrKQ0KPj4+PiBjcmVhdGUgbW9kZSAxMDA2NDQgcnVz
dC9oZWxwZXJzL2xpc3QuYw0KPj4+PiANCj4+Pj4gZGlmZiAtLWdpdCBhL3J1c3QvaGVscGVycy9o
ZWxwZXJzLmMgYi9ydXN0L2hlbHBlcnMvaGVscGVycy5jDQo+Pj4+IGluZGV4IDc5YzcyNzYyYWQ5
Yy4uNjM0ZmEyMzg2YmJiIDEwMDY0NA0KPj4+PiAtLS0gYS9ydXN0L2hlbHBlcnMvaGVscGVycy5j
DQo+Pj4+ICsrKyBiL3J1c3QvaGVscGVycy9oZWxwZXJzLmMNCj4+Pj4gQEAgLTMyLDYgKzMyLDcg
QEANCj4+Pj4gI2luY2x1ZGUgImlvLmMiDQo+Pj4+ICNpbmNsdWRlICJqdW1wX2xhYmVsLmMiDQo+
Pj4+ICNpbmNsdWRlICJrdW5pdC5jIg0KPj4+PiArI2luY2x1ZGUgImxpc3QuYyINCj4+Pj4gI2lu
Y2x1ZGUgIm1hcGxlX3RyZWUuYyINCj4+Pj4gI2luY2x1ZGUgIm1tLmMiDQo+Pj4+ICNpbmNsdWRl
ICJtdXRleC5jIg0KPj4+PiBkaWZmIC0tZ2l0IGEvcnVzdC9oZWxwZXJzL2xpc3QuYyBiL3J1c3Qv
aGVscGVycy9saXN0LmMNCj4+Pj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4+Pj4gaW5kZXggMDAw
MDAwMDAwMDAwLi5mZWEyYTE4NjIxZGENCj4+Pj4gLS0tIC9kZXYvbnVsbA0KPj4+PiArKysgYi9y
dXN0L2hlbHBlcnMvbGlzdC5jDQo+Pj4+IEBAIC0wLDAgKzEsMzIgQEANCj4+Pj4gKy8vIFNQRFgt
TGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wDQo+Pj4+ICsNCj4+Pj4gKy8qDQo+Pj4+ICsgKiBI
ZWxwZXJzIGZvciBDIENpcmN1bGFyIGRvdWJseSBsaW5rZWQgbGlzdCBpbXBsZW1lbnRhdGlvbi4N
Cj4+Pj4gKyAqLw0KPj4+PiArDQo+Pj4+ICsjaW5jbHVkZSA8bGludXgvbGlzdC5oPg0KPj4+PiAr
DQo+Pj4+ICtib29sIHJ1c3RfaGVscGVyX2xpc3RfZW1wdHkoY29uc3Qgc3RydWN0IGxpc3RfaGVh
ZCAqaGVhZCkNCj4+Pj4gK3sNCj4+Pj4gKyAgICByZXR1cm4gbGlzdF9lbXB0eShoZWFkKTsNCj4+
Pj4gK30NCj4+Pj4gKw0KPj4+PiArdm9pZCBydXN0X2hlbHBlcl9saXN0X2RlbChzdHJ1Y3QgbGlz
dF9oZWFkICplbnRyeSkNCj4+Pj4gK3sNCj4+Pj4gKyAgICBsaXN0X2RlbChlbnRyeSk7DQo+Pj4+
ICt9DQo+Pj4+ICsNCj4+Pj4gK3ZvaWQgcnVzdF9oZWxwZXJfSU5JVF9MSVNUX0hFQUQoc3RydWN0
IGxpc3RfaGVhZCAqbGlzdCkNCj4+Pj4gK3sNCj4+Pj4gKyAgICBJTklUX0xJU1RfSEVBRChsaXN0
KTsNCj4+Pj4gK30NCj4+Pj4gKw0KPj4+PiArdm9pZCBydXN0X2hlbHBlcl9saXN0X2FkZChzdHJ1
Y3QgbGlzdF9oZWFkICpuZXcsIHN0cnVjdCBsaXN0X2hlYWQgKmhlYWQpDQo+Pj4+ICt7DQo+Pj4+
ICsgICAgbGlzdF9hZGQobmV3LCBoZWFkKTsNCj4+Pj4gK30NCj4+Pj4gKw0KPj4+PiArdm9pZCBy
dXN0X2hlbHBlcl9saXN0X2FkZF90YWlsKHN0cnVjdCBsaXN0X2hlYWQgKm5ldywgc3RydWN0IGxp
c3RfaGVhZCAqaGVhZCkNCj4+Pj4gK3sNCj4+Pj4gKyAgICBsaXN0X2FkZF90YWlsKG5ldywgaGVh
ZCk7DQo+Pj4+ICt9DQo+Pj4gDQo+Pj4gSnVzdCBub3RpY2VkLCBidXQgb2YgdGhlc2UgaGVscGVy
cyBvbmx5IGBJTklUX0xJU1RfSEVBRGAgYW5kDQo+Pj4gYGxpc3RfYWRkX3RhaWxgIHNlZW0gdG8g
YmUgdXNlZCAoaW4gZG9jY29tbWVudHMpLg0KPj4gDQo+PiBDb3JyZWN0LCBidXQgaXQgbWFrZXMg
c2Vuc2UgdG8gYWRkIHRoZSBtb3N0IG9idmlvdXMvY29tbW9uIG9uZXMgKGFsc28gdG8gbWFrZSBp
dCBjbGVhciB0aGF0IHVzaW5nIHRoZXNlIGFyZSBzdXBwb3J0ZWQpLg0KPiANCj4gIkl0IG1ha2Vz
IHNlbnNlIiBpcyBzdWJqZWN0aXZlLCBhbmQgaW4gdGhpcyBjYXNlIEkgYW0gY29uZmlkZW50IGl0
IGlzDQo+IG5vdCB0aGUgcmlnaHQgaW50dWl0aW9uIHRvIGFkZCBkZWFkIGNvZGUganVzdCBmb3Ig
dGhlIHNha2Ugb2YgaXQuDQo+IA0KPiBFYWNoIG9mIHRoZXNlIGhlbHBlcnMgYWRkcyBhIHBvdGVu
dGlhbCBicmVha2FnZSBwb2ludCBmcm9tIHRoZSBDIEFQSQ0KPiBzaG91bGQgdGhlIGxhdHRlciBj
aGFuZ2UsIHNvIHdlIHNob3VsZCBvbmx5IGFkZCB0aGVtIGlmIHRoZXkgYXJlIGluZGVlZA0KPiBu
ZWNlc3NhcnkuDQo+IA0KPiBBY3R1YWxseSwgc29tZSBvZiB0aGVzZSBoZWxwZXJzIGFyZSBub3Qg
dXNlZCB3aGVuIHRoZXkgY291bGQgaGF2ZSBiZWVuIC0NCj4geW91IGhhdmUgYSBgaXNfZW1wdHlg
IG1ldGhvZCB0aGF0IHJld3JpdGVzIHRoZSBDIGZ1bmN0aW9uIGluc3RlYWQgb2YNCj4gY2FsbGlu
ZyB0aGUgaGVscGVyLiBUaGUgb25seSBoZWxwZXJzIHRoYXQgYXJlIHVuanVzdGlmaWVkIGFzIG9m
IG5vdyBhcw0KPiBgbGlzdF9hZGRgIGFuZCBgbGlzdF9kZWxgLCBhbmQgdGhlc2UgYXJlIGVhc3kg
dG8gYWRkIHdoZW4gdGhleSBiZWNvbWUNCj4gbmVjZXNzYXJ5Lg0KPiANCj4gQnV0IHRoaXMgcmFp
c2VzIGFuIGludGVyZXN0aW5nIGRpbGVtbWE6IHRoZXNlIGhlbHBlcnMgY2Fubm90IGJlIGlubGlu
ZWQNCj4gYW5kIGFkZCB0aGUgb3ZlcmhlYWQgb2YgYSBmdW5jdGlvbiBjYWxsLiBPbiB0aGUgb3Ro
ZXIgaGFuZCwgdGhlDQo+IGRlZmluaXRpb24gb2YgYGxpc3RfaGVhZGAgaXMgc28gZXhjZXNzaXZl
bHkgc2ltcGxlIHRoYXQgbWFuaXB1bGF0aW5nIGl0DQo+IGRpcmVjdGx5IGlzIHZpcnR1YWxseSBh
cyBpbnR1aXRpdmUgYXMgaW52b2tpbmcgdGhlIGhlbHBlciAtIGFuZCBkb2Vzbid0DQo+IGJlYXIg
dGhlIG92ZXJoZWFkLiBTbyBzaG91bGQgd2UgZG91YmxlLWRvd24gb24gdGhlc2UgaGVscGVycywg
b3IganVzdA0KPiBkcm9wIHRoZW0gY29tcGxldGVseSBhbmQgcmUtaW1wbGVtZW50IHRoZSBsaXN0
IGZ1bmN0aW9uYWxpdHkgd2UgbmVlZCBmb3INCj4gaW5jcmVhc2VkIHBlcmZvcm1hbmNlPw0KDQpZ
b3UgZG8gaGF2ZSBhIHBvaW50IHRoYXQgd2UgaGF2ZSBhbiBhYnN0cmFjdGlvbiBsZWFrIGFueXdh
eSwgc28gdGhlIHF1ZXN0aW9uIGlzIGRvIHdlIG5lZWQgaGVscGVycyBhdCBhbGwuDQoNCkkgYW0g
dG9ybiBvbiB0aGlzLiBPbiB0aGUgb25lIGhhbmQsIGlmIHNvbWVvbmUgY2hhbmdlcyBob3cgbGlz
dF9oZWFkIGFwaSB3b3JrcywgdGhlbiB0aGUgcnVzdCBzaWRlIGJyZWFrcyAodGhvdWdoIHRoYXQg
aXMgZWFzeSB0byBmbGFnIHRob3VnaCB2aWEgZG9jIHRlc3RzKS4gT24gdGhlIG90aGVyIGhhbmQs
IHdlIGhhdmUgdGhlIGZ1bmN0aW9uIGNhbGwgb3ZlcmhlYWQgeW91IHBvaW50ZWQgYW5kIHdlIGFy
ZSBkZWFsaW5nIHdpdGggdGhlIHBvaW50ZXJzIGluIHJ1c3QgZGlyZWN0bHkgYW55d2F5IGluIHNv
bWUgY2FzZXMuDQoNClBsdXMgbW9yZSBvZnRlbiB0aGFuIG5vdCwgbmV3IHNlcGFyYXRlIGxpc3Qg
dmFyaWF0aW9ucyAobGlrZSBobGlzdCkgYXJlIGFkZGVkIGZvciBuZXcgdXNlIGNhc2UgdGhhbiBt
b2RpZnlpbmcgZXhpc3Rpbmcgb25lcywgc28gaXQgaXMganVzdCBhIHNtYWxsIHJpc2sgdG8gZGly
ZWN0bHkgcmVpbXBsZW1lbnQgbGlzdCBoZWxwZXJzIGluIHJ1c3QuDQoNCkkgZG8gbGlrZSB5b3Vy
IGlkZWEgdGhvdWdoIGJlY2F1c2UgaXQgbWFrZXMgaXQgYSBiaXQgZWFzaWVyIHRvIGFkZCBzdXBw
b3J0IGZvciBvdGhlciBsaXN0IHZhcmlhbnRzIGlmIG5lZWRlZCAoaGxpc3QsIGxsaXN0LCBSQ1Ug
bGlzdHMgZXRjKSBzaW5jZSB3ZSBkb27igJl0IG5lZWQgd3JhcHBlcnMgcGVyLXNlLg0KDQpPayBJ
IGd1ZXNzIEkgd2lsbCBkcm9wIGFsbCB0aGUgaGVscGVycyB0aGVuIHVubGVzcyB0aGVyZSBpcyBh
IGdvb2QgcmVhc29uIHRvIHN0aWxsIGtlZXAgdGhlbSBhbmQgc2VlIHdoYXQgaXQgbG9va3MgbGlr
ZS4gU29tZSBvZiB0aGVtIG1pZ2h0IGhhdmUgZGVidWdnaW5nIGNvZGUgdGhhdOKAmXMgb24gdGhl
IHNpZGUgQyB0aGF0IHdlIG1heSBub3Qgd2FudCB0byBza2lwLiBUaGUgUkNVIGxpc3QgYXBpIGNl
cnRhaW5seSBkb2VzLg0KDQpUaGFua3MuDQoNCg0KDQoNCg0K
