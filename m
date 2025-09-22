Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EC45B92C12
	for <lists+dri-devel@lfdr.de>; Mon, 22 Sep 2025 21:17:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5352010E021;
	Mon, 22 Sep 2025 19:17:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="KzXTx0VS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011026.outbound.protection.outlook.com [52.101.62.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D64E310E021;
 Mon, 22 Sep 2025 19:17:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ntuWju+i4bNfPWPum3CKlp6CQaFTPT/l4wr8ju8ssZMqyf1wY3dYnzPnKzEZH/Gzcm7DsVgOvfngfqujl9Yx78X8dpzN/SPx+8eCKl0fLRNnhicvKfHILhPAninFWzu563u8ucnULDwj+vhZuB18ULHvPCIsNgv45ZwttHo47TSAFm4iaxJ2V5x0jedMEbDspAAEmYytPSihtzUc7F4aS5ifG3rUOOx6P2fXTDUxhWnpxQxKj7QOUbvBQyTln8Bprk8dtPNfczabcUHbtkgodLcXR1cRd3E8qWDJOpO+i68/Ih613pmkhakUZ0yF8gnrrKY+9RzjUeuowBWTp6EdPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0im5HqpQqa342Iy505/5i36/y5qNVmx6kX0NQqXrTig=;
 b=eKrLK+mfNqnCg/zDIC5W7LKNkXwVF5Hlx+HRnQuKOMztfjsv9Nev7GKkwfRjqflqhU8ch0VfBBUypMuQHroj+ElRtMHfShxOiv1N2Ici9MNwm6R70IsQkMyYncfWyEsndunGZcuNXWnw8KoHxwyaOxqky4xX7aguPBPl/W+8bDFTjGzxEkGXhVDQcM2F/NCK9peQ3mmY2iRb2fvfaPsF6+YNRKqxUeKXz8yf8g4dbsl9tsbZM5qgrSR1qSDwVYabACEHiUMU8hhANkdsFo9dj6tyoZXiBk7tgFK4fg9xZwZkL0mmdSRvnebcw7RL3JjPBEU7EdHlvUTN0woYWfDJmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0im5HqpQqa342Iy505/5i36/y5qNVmx6kX0NQqXrTig=;
 b=KzXTx0VSw2E6nluty3xxT8L6dt+8HTz8BuNrlUcThkjzYN1UlTl4eb3iyr3Svmu8m+6J65Qq7ZA7vI7HJE1deid0P9oLB090g6UlnMZNYgioq3ZRPGCN1XV1zT+j9qcV5mwspBelawyl52OtqhBH4A9Mfbt2F+QoRroqLu/UOVsxK9vHE51ZSEFB4SIJMCewPeCbJalTlW9t006rCwrCdXniZ0pX0G/Syn4y3cCKAA/ZmoOagGmCaB9Yq2HmUDLcLAWxiGMmlcRd/VLjZFWBsyQLTg3wLOZxCX0bVTI/y4eTL2Lfv5OEB5iL4rPTPiOBhU/bm8VySdwzkO8jLBFymg==
Received: from CY5PR12MB6526.namprd12.prod.outlook.com (2603:10b6:930:31::20)
 by CH2PR12MB4101.namprd12.prod.outlook.com (2603:10b6:610:a8::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Mon, 22 Sep
 2025 19:16:58 +0000
Received: from CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::d620:1806:4b87:6056]) by CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::d620:1806:4b87:6056%3]) with mapi id 15.20.9137.018; Mon, 22 Sep 2025
 19:16:58 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Alistair Popple <apopple@nvidia.com>, Alexandre Courbot
 <acourbot@nvidia.com>, "dakr@kernel.org" <dakr@kernel.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
CC: "lossin@kernel.org" <lossin@kernel.org>, "ojeda@kernel.org"
 <ojeda@kernel.org>, "boqun.feng@gmail.com" <boqun.feng@gmail.com>,
 "a.hindborg@kernel.org" <a.hindborg@kernel.org>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, "tmgross@umich.edu" <tmgross@umich.edu>,
 "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>, "simona@ffwll.ch"
 <simona@ffwll.ch>, "mripard@kernel.org" <mripard@kernel.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, John Hubbard
 <jhubbard@nvidia.com>, "nouveau@lists.freedesktop.org"
 <nouveau@lists.freedesktop.org>, "bjorn3_gh@protonmail.com"
 <bjorn3_gh@protonmail.com>, "airlied@gmail.com" <airlied@gmail.com>,
 "aliceryhl@google.com" <aliceryhl@google.com>, Joel Fernandes
 <joelagnelf@nvidia.com>, "gary@garyguo.net" <gary@garyguo.net>
Subject: Re: [PATCH v2 05/10] gpu: nova-core: gsp: Add GSP command queue
 handling
Thread-Topic: [PATCH v2 05/10] gpu: nova-core: gsp: Add GSP command queue
 handling
Thread-Index: AQHcK7Rqci8b2/trukCsDwVy4lh33rSfk4SA
Date: Mon, 22 Sep 2025 19:16:58 +0000
Message-ID: <d5695467e3bcc78fbd8e9553e4dde730f3141e5d.camel@nvidia.com>
References: <20250922113026.3083103-1-apopple@nvidia.com>
 <20250922113026.3083103-6-apopple@nvidia.com>
In-Reply-To: <20250922113026.3083103-6-apopple@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR12MB6526:EE_|CH2PR12MB4101:EE_
x-ms-office365-filtering-correlation-id: 793f5ae0-1ce5-4d9d-92aa-08ddfa0c99e1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?dDY0c0J0MjQrSmVKb0xkS29BUDlZd1BmekJOcHdkbXNpTEZMblJHaUN4T1BI?=
 =?utf-8?B?Y0xmVDJxUzMrQWJyVi9QYUtXZDZ6Sk5yQTJLVTB5ekJHbGVtL01jRzNCeEFu?=
 =?utf-8?B?M2poYjl3MGVseUw5andJenE0SURiUFAzNnlydy9pNEJSZ0tLOVdISkEyek81?=
 =?utf-8?B?SFhhc0Q1b2VUOHExZVFBaElDdTJnZURiOGtYeEhQYjQ3ZjR0RHBmRTE1T2o0?=
 =?utf-8?B?MW52UDZOcDdKb3pPalB4RVFlMTNzRU9vWElkV204S2hFNkZ4OTY3dThIbXN3?=
 =?utf-8?B?aFJEcmwydmlBZDVscmFHQnliVzNXUi92WEw1QkN4bm9LTGZjb0lVc2d6Z1lT?=
 =?utf-8?B?YXN5NlNod1h3OWNlYk9BeFdSMzhPd1BmaW9jMEZSc0d3R1prLzJJK0wzVm4y?=
 =?utf-8?B?MkY0UGJhekd4YlkzS3oxMWZ0dUF2YXFtYnRvWFRwNExIWlpLRms3cEVIRlZj?=
 =?utf-8?B?UklPbTRUL2dQaUh4UFZqYzYzUjE2VFo5WUtVRTBTSGhiN2RmSDg3WXdubjRB?=
 =?utf-8?B?VW1hbDUzVnlhcjF6ZTNSVU9tQ0Nmbjl5K3ZxSG9lZ0xkNDVBalY3THhoSDdF?=
 =?utf-8?B?QXF4ZHMveUtEZWRRcHRpNHhNODQzRFA5d0hPN3RBbjE4V0FvYW5UV3gwZ2V1?=
 =?utf-8?B?ZnBkUXR6c291S2U3UlVuWXh1Z1ZOTDQwMFBDMkN4Qll2N0NucEtpTzZJZ3Vn?=
 =?utf-8?B?VkI1LzVmSE81MDd5MnRtUSttWDlZSjBtUCtLVW5TWTYzL3hUS09FUkZsallE?=
 =?utf-8?B?WkpINDQxeGg4bzMzY3FyR1pSUDEzeGNROUlja1gvTDZHcTkwRnRPd0V6clFv?=
 =?utf-8?B?ZkxJc1hvcG1uWEUvcHFzUThNYkJtdWdRT3dWWmdPcHMxay9vQ25mL2d1ekt1?=
 =?utf-8?B?TXlsZTVzaEd1c1UxNElCQm5OVGhrb2lNYjRkaGhjQ01RTGd5YStBMkRJdE11?=
 =?utf-8?B?TEFGMFBXVXdZUGUzRlJyN0ZHZHc3M0M3Mkx1Rkx0UUY3Q0pXb0tLTG9kUVF2?=
 =?utf-8?B?b3pyYXJaaWVSUDBrSjFyNHk5MnNQbDU3cFdXY2VHdmZJVWJTQWtsamZHN0Vi?=
 =?utf-8?B?MkptV1dKdVRkSjZ4NlV6U1dPNVRFeDZleWtIQXZQTDl3N2EvUlVXYzFUc2E5?=
 =?utf-8?B?VWlwUVlKV1BFcGZzUFAzRmlmYytoVzhaNXVOWm9PMSs2Y2hHRlFaR3RQOUNr?=
 =?utf-8?B?bG4zT1hOQVZ6NzBLOEhSbk0yUzFuRElhYXpFQXhVc1ZLcHV6QlNwWWJ2SWFh?=
 =?utf-8?B?V3dCclZpWkV1ZXFwdjNxQk1hcVFpc1FRWENKWThvNll5S0tzTGdPWHhodmVK?=
 =?utf-8?B?dVdraFdybk1NNXgzL2JEeW5HQmxmZGpsaERlM3pKYVlZNVNtajJzN1J6dWtH?=
 =?utf-8?B?WDMvWXVZL2FBV08wMlp1QTRVR0ZGYm95MXIrZHU4UnRKcDQ0MzB3cGFzVWlL?=
 =?utf-8?B?cWVPWGp3YXJTRG5RNUxNMjdFZzczczFBTzBtNEMyVXdVL3ZlYXYyK3Vkbkl0?=
 =?utf-8?B?QTFWa2tteHNRc01XaWJlUCtoZFRRSThzeENIaDRNc1g0MjZZK0tmMGIzSllr?=
 =?utf-8?B?elE4TkRsNUVLK3hGbW80ZUZYRHV5OTE2ODE2R05qUzBJeVJhNkhzQ2pBNmxJ?=
 =?utf-8?B?eWpFdHNJbmNSZEQxMDB2VUNVT1dvaGNrak1mUVZIVVAxKyt1YmZESllKK2VK?=
 =?utf-8?B?S2lhSFlrbWE1RDhwamFLbU40OEU1UjFGNUl5UnpudXdzSXVGaDNWRjhwUDFh?=
 =?utf-8?B?Z2pvYlEwa2pwdlpJQ0VNajV6QXg3S2ZqMUs1SExzeTJJdUxzMGc0eUJFSnR6?=
 =?utf-8?B?bjZHOWlMMlZQbTFLY3hjRjNObGJPd1BEMzlLUHprbGFUbkJwTDRKWkwvd0lk?=
 =?utf-8?B?Uzhid2Voc3RKNS9scm9HdjVGdVM4VHRVbFhCMTlSTkVyYVhCRVJHbVZqelhQ?=
 =?utf-8?B?S3pOQXFBMlN1Wk45VGU1L1JSc3AzU0k5Q3ZHSmM0c2pFaFpYQktkZFhjOHpt?=
 =?utf-8?Q?4uxyePkXkcWEnYJ8Q7In5Tm6Hv2sDI=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR12MB6526.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?S1I2QmtSTC9CeEdsb1RwRzVVRHlJQzFDc0k3dkhyMW9mVWk4ZktoSVZ0Y3k4?=
 =?utf-8?B?OHIrY2IxS3ROb0lPeVd1aEVYWG0zZHlyR1NRVGlUVC9UdnBRdjVlWUY2WlU1?=
 =?utf-8?B?UWltSUtzbjd4Qk1rS0hWQXN5clhvQUhubjJnRmlKeFM5ejFjUHBYZGlUczdD?=
 =?utf-8?B?SmtkMk51eFVGSi8zTEp4VUFtUzJkbmVqSFkrZWRucXVHOEFjQ2FUakFpYXNS?=
 =?utf-8?B?NVgyMDArMCtUdTByUjB0NUx1QjJvTkh0V1FLMURoU2tvVnpaS0JEQ003Yk0z?=
 =?utf-8?B?S3pLeG8rSjNTS2JDNDRQcDFtdWxIVDVqZi80MU1IM2dtbG1maytPai9uUXJT?=
 =?utf-8?B?emp1WEdaS29Wc3d3c2xId05GOGg2M1Y2cXFHK3V4ZHZYZ2lON3lPeVZkU3kr?=
 =?utf-8?B?ays3dEZTdUxXZjlGTHozRng2MFRnVHRzUk1JSUU4N0FiUUNibUFKNzh5bG1D?=
 =?utf-8?B?VHIvSG03QjBVcUZOUTBtaE9YY1NCRU9FME9HajZPKzA0YUU3TW1GQ3pSYkdm?=
 =?utf-8?B?NXJuYW9aOVRvNDIxNjNpaGFicUp3N2tzWFNNNGx2WHhWcU85TytGM3hDN2hD?=
 =?utf-8?B?RGltRnlzZVhMaktPaE5CV2UxVGVlMW5venkxbGpYQ0VIVGZDZTN6eDdFYkNO?=
 =?utf-8?B?SUEvUG55bFUwMUdqc290b1ZvN0JVWVhHTGpCRTNXR0JtbG1DUENIaTdQbEN1?=
 =?utf-8?B?cTRucy9jU3haQXI2WmtSK2N1enFleGxsSEQyd1BwT3lNb3MwS0x1OHhWdGlq?=
 =?utf-8?B?MERPRVhlK0I1VlJMUENneUZaY05tTW45dkhBQk5VVWc4ME1ON3lUbGtkTHdR?=
 =?utf-8?B?UWU0WEppeTNJL1BxTjgxdUdDcVQrN2Vjb3paOGY1WEtkSFR4ZmcyN0JhRzFq?=
 =?utf-8?B?NlFGYWtQSmo4RUJYOGRXT01qaVoxd0VLZmpleW10Yzh6UFJhb2loRXJOT2hP?=
 =?utf-8?B?RVFhY3ptZG1aS0ZRNVZ1OUVJcDZjdTFOUnZkNU94b2N2WGR3UzZGdkFuOU5z?=
 =?utf-8?B?V21welpiNmlRYzVPSG5FQ1pQWktiRm00YmxUQk5ydWtRT0VrbnEzNU9EL2J4?=
 =?utf-8?B?STlFekQxWE5XVjdhTTRsbTZmLyttOGFMUHo1eFFqZS91SVQyck5SOXlGNzF1?=
 =?utf-8?B?enhRM0xlV3F6b0FzT0dWMTVVUFlyQ21KSy91V2V0NER1aXhxK2RHRXkrd1Bx?=
 =?utf-8?B?MkdldngxeGZrYjJnNnZ4VFhBRjZsZEU4aWJQTjBLNW1ZUXJHTjRqOTdPeC9m?=
 =?utf-8?B?SldkMHNvb0dneFpXNmREWmh0S0pjdFBlRkQ1RGVjbHh4VEl3SW5BYi96MHpI?=
 =?utf-8?B?NzVFMEZvdDRqYktlTko4QU5tb0krTUVXZnFnOXpuUW9lbWQrbms2RiszSjQ1?=
 =?utf-8?B?RVYzaitsd1NTR0YwNllnci9BaEVNVVloMVRhTmVhVGNteUQ3aUZSRUd2VDBw?=
 =?utf-8?B?UktrbmZzUi84bVJYVjFYYkkzc0s2cWlEQmc4L09zNUMxdGVhNzR2OEwzUkZY?=
 =?utf-8?B?U2VDSmNyWjI4YiszcG1BNFRCMStVNWVJT0NNTm5GN21WOUJsaXczNnRVWjlW?=
 =?utf-8?B?WTlZWHJzRVAvWUl5VENiTHRyMUtpMWt1a2lDY0ZoZFpTQktEcEE4V2ZxYVZO?=
 =?utf-8?B?MUZWd2lXdU1ySjlWdENJL1NJbmVaT2VNR2VCd0lIVHFCVkd2T0NqQU1BcjBZ?=
 =?utf-8?B?MHJSaTdJaHdsbjQ5aUF0bkFKUFo0QURCU3dwcDl0YXJTV0J1NkdCc0lrbDhF?=
 =?utf-8?B?R3R5ajJZajl3RFlObnZVQUVZM0FCbWN5UnFpa0ozb2lkemx5Z1luYzlDZ2xB?=
 =?utf-8?B?cUx3WmUxOERua3FjY1p2TnYzaFIwRVZGNEV2UEgzeXh2ZTJTQVhFUFU0Y1FO?=
 =?utf-8?B?aS9jaFpkOUNsY2xjNEhDS2tYRE1LMWJOZHViZlVBWENQVVhPZ1A3WEZHUTZ4?=
 =?utf-8?B?T1kwMGZITEt0djNDR1FmQU5FVytaajJ6Mm1VZ01jbVhUL0FnbXF1SkVDcWor?=
 =?utf-8?B?VFNZVjM2b2dBbjlGcEVwWmowaWNibGl6dFJxQ24zbEk3K2NLemh4dWhvWDRT?=
 =?utf-8?B?RGVVNnA2Nzk5RDJueDUxNk8vbmRmR1c1VFRpdk9QSXBvMTBrWFY2MnBrQlNu?=
 =?utf-8?Q?miGCTChDXYRhtsvk5gYjRmnTB?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <317C5ACC22CE854B93399BB8F6BF1BAB@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6526.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 793f5ae0-1ce5-4d9d-92aa-08ddfa0c99e1
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2025 19:16:58.4298 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: y0NAHl/Fhe6EAUSESQ9ADKFuaqEDeSPzmkXTCR9ADGecyuvX9XpmuQV2PAx+xhsHBI0K9K0fWXD3hS4YT38Hdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4101
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

T24gTW9uLCAyMDI1LTA5LTIyIGF0IDIxOjMwICsxMDAwLCBBbGlzdGFpciBQb3BwbGUgd3JvdGU6
DQo+IMKgLy8vIENyZWF0ZXMgYSBzZWxmLW1hcHBpbmcgcGFnZSB0YWJsZSBmb3IgYG9iamAgYXQg
aXRzIGJlZ2lubmluZy4NCj4gLWZuIGNyZWF0ZV9wdGVfYXJyYXkob2JqOiAmbXV0IENvaGVyZW50
QWxsb2NhdGlvbjx1OD4pIHsNCj4gK2ZuIGNyZWF0ZV9wdGVfYXJyYXk8VDogQXNCeXRlcyArIEZy
b21CeXRlcz4ob2JqOiAmbXV0IENvaGVyZW50QWxsb2NhdGlvbjxUPiwgc2tpcDogdXNpemUpIHsN
Cg0KUGxlYXNlIGFkZCBkb2N1bWVudGF0aW9uIGZvciB0aGUgJ3NraXAnIHBhcmFtZXRlci4NCg==
