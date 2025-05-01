Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B726AA60C0
	for <lists+dri-devel@lfdr.de>; Thu,  1 May 2025 17:31:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B430F10E86C;
	Thu,  1 May 2025 15:31:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ObkohQmd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2059.outbound.protection.outlook.com [40.107.243.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9DFB10E86C;
 Thu,  1 May 2025 15:31:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pnQ0YnQZhyy5Xz++Pla3GrGHrfwHk0NbVOHHHak/ILdEM9Iowa55UITQN1HBJV1grDkPavTiq6raIg0YmDdQ7hrADI488pbgH5LQdfsVQyVGZgOIqcEaVjw9WtPzhkP+fYhFxAwH485D3p0rpqm0mP46FD3N6lCfKEBr7TUMws/CWHHUPFCt36W0+he6JwScRuKaUq1M7CnkvsTfu4ja2IyYb6hfFdpMAnjbOe6jrRWQLbWkP+lIMkhCcJZgtQF+Rp8y4H0p4DePIci1izZxIIzCWewbvIIkO+vo55/+kUNllf73phhAmh4Lk1PcjvarNQSn7Z/CJmYSlnANjcVTjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NZqN7xu09hCjBKdCk0ILDN68tLPp3udHEyv+e1z78b0=;
 b=gUfBLOAnP4cusb0eoOwDsKbgx0nGyCxW7Ia82tzuv+Ex3hB4JicgGdrvDHn5dOR7IcJ+t4LuC0Txi9qoOjg6sLWp7zb0pzAGQotGhlnIlDeg4aXtCNB4RRJ7KQZXU3Dx/fX5m9IQ+eH/arzNOtxkp9+UYwy+k+TFydAs/xtAJI8KXDcZc00Ntwxj1pJ49BMc5OqVqReZBUaL6sXgXKz3w/1R49UdYTA2D2K6xCNGlPU3u6jFeFLCnS1uRuV1cyT/QuQqECAryycy7N6cd3/ZG0H/HPfaqMlEd7bdrOblPNu84ZjomgFP7RJELb6q3RLz+3O7NqEkImOxl5km/gcLxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NZqN7xu09hCjBKdCk0ILDN68tLPp3udHEyv+e1z78b0=;
 b=ObkohQmddxkrmIMRQ0X3NhtiuLATkQUr+dXS4SHnLQXkS+d0fXmhCO5dn1CpIlkyxlx6ePr2inMTbpoIdnJ2PNODMh4Fzx0hGzkhTOVHys8PgLMlGsrVpxmKcM/trqKMfFhlpXmdeaaYQvAMROoY/6uGD7TKnMZGuMYm9x9OXEnSlq8d8bmPW7FFoJfvBhguEm2AGnnPF9sSb4GvElDEM3HoIC9cS7JrMDRK4kVErUJWs7WTUGHlobup4gzfJOL/m5GNBrOI2o0+eI+3kDeCCvOXSYRYspqz8jCVC+kEnZ7sg9TKRApxB78KMqzWCY7p2HSc31+yY/a21xtEPNjMCQ==
Received: from CY5PR12MB6526.namprd12.prod.outlook.com (2603:10b6:930:31::20)
 by LV8PR12MB9133.namprd12.prod.outlook.com (2603:10b6:408:188::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.23; Thu, 1 May
 2025 15:31:12 +0000
Received: from CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56]) by CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56%5]) with mapi id 15.20.8678.028; Thu, 1 May 2025
 15:31:12 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "corbet@lwn.net" <corbet@lwn.net>, "a.hindborg@kernel.org"
 <a.hindborg@kernel.org>, "ojeda@kernel.org" <ojeda@kernel.org>,
 "boqun.feng@gmail.com" <boqun.feng@gmail.com>, "simona@ffwll.ch"
 <simona@ffwll.ch>, "tmgross@umich.edu" <tmgross@umich.edu>,
 "mripard@kernel.org" <mripard@kernel.org>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "benno.lossin@proton.me" <benno.lossin@proton.me>, "gary@garyguo.net"
 <gary@garyguo.net>, "bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, "airlied@gmail.com"
 <airlied@gmail.com>, "aliceryhl@google.com" <aliceryhl@google.com>,
 "dakr@kernel.org" <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Alistair Popple <apopple@nvidia.com>, "nouveau@lists.freedesktop.org"
 <nouveau@lists.freedesktop.org>, Ben Skeggs <bskeggs@nvidia.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, John Hubbard
 <jhubbard@nvidia.com>, "rust-for-linux@vger.kernel.org"
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v2 17/21] rust: num: Add an upward alignment helper for
 usize
Thread-Topic: [PATCH v2 17/21] rust: num: Add an upward alignment helper for
 usize
Thread-Index: AQHbupjrBqy/TF3WekeYRCorKuWUh7O947EAgAAAyACAAAJ3gA==
Date: Thu, 1 May 2025 15:31:12 +0000
Message-ID: <86ea2eea2a3671e955b4199dab320a41ec695ebc.camel@nvidia.com>
References: <20250501-nova-frts-v2-0-b4a137175337@nvidia.com>
 <20250501-nova-frts-v2-17-b4a137175337@nvidia.com>
 <eaf5b0cf138c32135781977a7774bfd4572286b5.camel@nvidia.com>
 <7481f03b-3fb0-499e-b200-b3366334adc2@nvidia.com>
In-Reply-To: <7481f03b-3fb0-499e-b200-b3366334adc2@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR12MB6526:EE_|LV8PR12MB9133:EE_
x-ms-office365-filtering-correlation-id: 91595908-e484-441e-6723-08dd88c53482
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|10070799003|366016|1800799024|38070700018|921020; 
x-microsoft-antispam-message-info: =?utf-8?B?RnJxRnhnYzRIc01zSC9iemRKNzNkS0dTSzVnalkzRmMwWFRHcHpqWDB5eWMy?=
 =?utf-8?B?MGRiS05adXNGL3A1M28vSHJRcUxwUXlEMTlqUXB4VXNjdS8wOWp6aVpDQUU4?=
 =?utf-8?B?Q0JrWDhJR1hHeXQ4WTkxckx2SzErK3BSWCs4UHBUZW52TG5aWXZnNkhiOXFx?=
 =?utf-8?B?MFBoQ2hrdjBwcmhqT2FHbitZbGNRcmZNRDNCdytYcGtqdXZuTTNPN05lRFox?=
 =?utf-8?B?WUdIeHNaYktFOVhGQUhpaTRQRmFudEpDMEIrME5qRFBoZnJIRlZXNlhMSTJE?=
 =?utf-8?B?MFFna3drOVZvdFJvTVhmeUVXMERTM3BrUHI4NXZyQ2FaS3RscXIzQ1prYmNw?=
 =?utf-8?B?WjNnVkN3SUdWSml0U1NoRUR4V1BRK2pKUVVGRHNNQTFmWkVJelAvSmlacnE1?=
 =?utf-8?B?ZmdTcjlOb0g3U3U0Ykd0YjN1Q0ZWVlVvR2YrMEFOaVY2QVFldlZPTC9CMUhn?=
 =?utf-8?B?SXd4WDVuUmRNZnFlWS96QmdXWmtEV0luNXE4OVM2YlhSektFNlBWWUh0clpm?=
 =?utf-8?B?MW5sQ3ZDOE8vdFNOb1B1a09SUGY5NlpBVlFpNkhrc0xSVmF6K2lma3d1RjI5?=
 =?utf-8?B?Tk9QQmJiN2w1ckt0aWhpWE81ZkYvbStDWXNoRDFCUW05UFVzZkRzM1NUZHNF?=
 =?utf-8?B?NE1YOVZIRGZxaStKYUlrUW5aRFZtL0U0Q3dVT2VObjBPdTlReWt0QzBBN0R1?=
 =?utf-8?B?Z285R2VpejJIaXZKdmhhNlpNbmowWjdZNTZNbkd1SlJpOTFjdTZQeVlibHBC?=
 =?utf-8?B?bjhIVVRjYXgwK0ExdnFobnArZjdrbHdrUVlXZ1hIeEdidWFIYVZod2kyN2xI?=
 =?utf-8?B?WTRNL2R1ditoYVBMT0FrSGVFYjRiZVZaNzQxT0FPUUF1dXovSjlIL2kvc0xh?=
 =?utf-8?B?S1NoWG1JRHF5ekJTRHBUYmxBTzJYZ25pSkM0aDZTMFFKUThFQlVRSkdCSXRw?=
 =?utf-8?B?NTFqN0M1MVo1YWF3QWNZM1Yvd051VnJiZG5LWlRpTmgyV3JFUm5FVlJjWVNw?=
 =?utf-8?B?QmtEQllBL0tBRnZFazdEYytjK2F6OEZ1bit4L2JlNjZNSTZwSTl2di8rRy9y?=
 =?utf-8?B?SXc5cnBJQnJSWlJiWmhZek5xUC92NDQ5a3ljMFgrMHY4Y3RidlI5dmZpdjd4?=
 =?utf-8?B?MzRQVDliV0NMdThiUDNDdG5GNkJ6dkpuT0ZjaWZCWG5zNUFsNUxkNTV5dkYx?=
 =?utf-8?B?bmtkVGZxQmlvQXV5WEY2UmphaUNWMmpuR0hnS1Uyc0N4OFBnb1oyRDYrUmFr?=
 =?utf-8?B?RGVVbm1SMCtEOGZEUTcwd2M1NGZ4VzlZU29Ed1FKN0Z4ZU54MjlPbE5VaEVB?=
 =?utf-8?B?elcySFFPN0RtbzBBNmZ4RTVhdDA0Tk1qOXhKb2ZUSWduVVhteTY4ZjVCaUhX?=
 =?utf-8?B?Ui9vbmJBVE1ZT1RGNUZ0cGlQSG5UdWdyVE50enJQM2pRWnhESDdPVkN3QW0w?=
 =?utf-8?B?VW5lZUNoN2VDQkt6UXRQdGdLTjgyVE1ic3RmQXNCWFVlSGNkMnNOUmhQU2Mr?=
 =?utf-8?B?bWtHNVBFSWtlSjlVWHE4MDlJd044VUhXUTM2WDhPMktvOXVGSkp5RHd0RVJj?=
 =?utf-8?B?dll0NEtvQzZKUHUrWHJDUzVFa1QzQW9JMGdiUVhSd3Arc2VvcGpBZWxKcWwv?=
 =?utf-8?B?eU0rMzd3V0pKR0JJbTFBQlI0MnVqUjYxQ0x1aGlvZDNqd085NmRTeTIrWHZB?=
 =?utf-8?B?OU5uMENoUVFpY1hUemk1a0M0N01rcG1jam9NRVFDM0pKaHVtbmFlU1phRlM4?=
 =?utf-8?B?cUJ5bG04WHJLdjhENURoMk11MWZEVkVQTzZPV0RZd09hRXZlUDZhYnRINUp0?=
 =?utf-8?B?dmlqQ1R1SjlFUVNuN3luQXJXOUVUTU1EM1FzQUkzMjc1YWhWZjE1cnJubGZG?=
 =?utf-8?B?NTZmcm52VHNGVnc4YW1Gckdsek8weXFodDRERHVoa3lpSGRQYzJUbzNJbjM2?=
 =?utf-8?B?VnIrb3NSOWNxZ3lsU3h6N203cTlHRkJSUXBIUnI3VjNDejNudkI5RWhUUVp5?=
 =?utf-8?Q?SQFNSyoHF1NvGJ0Kwma+dBbj4wFZp4=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR12MB6526.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(10070799003)(366016)(1800799024)(38070700018)(921020);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RWlxc3VaOFFYcldIL3hZR1E2ZkRuTndnK1VrSHpGVnoxR0NDMHh0ZGkyNTRo?=
 =?utf-8?B?RGU0dDNUcG5RSnVaSFM2N1J0dWJoYzZBTnA4NkhPWnp2TnFRQ2FHUTM0ODR4?=
 =?utf-8?B?SlUzcCtFU2FCUzdOY3N4SkVPVHQ1K0V5S0lWTnZDTFZvdkpscDBlQnp6YUtZ?=
 =?utf-8?B?THBaSTIrYnBZM0ZadmJXTW1CZVQyRCtLN1hhTUhpZ0k2ZmxuOGJFdzVxNUNF?=
 =?utf-8?B?TWtMd1FsT050QXg4eFRBUFEyTy9MNFdQdVc1SVBkMERoeFBtVjNVQlhlazVV?=
 =?utf-8?B?bkFwbFA2QU95VU8wSXFhMWt4NWYyeUJHdmlpRUtybW40L0FUVFlKUmE2eWNG?=
 =?utf-8?B?Y0h2R2RhMlR3a3VUSFVVVklzQ1VnZkg0WHU2QnVFM1ROOTlyQ0VUUVU3WFMv?=
 =?utf-8?B?eWNuMWFTNWN2Y3BucmJSL044K1lpZ1pUcTVvU09LZVZBNC9wVzFDNTFsNzBY?=
 =?utf-8?B?UktqaGJJTFVCc2ZyT3NlSjFaNHVYZEIwM3AvMkMxS01rcldxejdBNlU3MHRE?=
 =?utf-8?B?ZERwZWFpcTFZRnI3K2JhckRkNVZKRHhlQ2VIbDRrRU4rMEZNc0t3ZWdhQjlS?=
 =?utf-8?B?eEc3STVYdVErV202UEZSdlloSm5MSjZLb1FBVGN4dHdyaGhGTlc0SmpIR1FG?=
 =?utf-8?B?TTUrVllHY1ZUWFZtcGFxS1RsUm0zNU4xelA5ckI2Qm9YRUhUT0R4b0dWaE53?=
 =?utf-8?B?UmltNS82cWlNeHpqTmlSVXQzSTNOb0g5bUFCMjRTeGYxTW1uaGZIRU1Mb2NI?=
 =?utf-8?B?YjF6dXp3M2s2VUtiRWwvc3d5K0p3d00zTkIrbExZZmJYUi9ZVVozaEJkQ0pm?=
 =?utf-8?B?Y01NaGZ0cHV3OXo3cjZNY3JqUEswR0JiR2IyTUpqcmNNTGd3L0ZSc3ZKZ1lp?=
 =?utf-8?B?d045ODlkY3ZWR2xZY2ozaDdNWVNCRnRza2oxSVc1WkMraW9tNk0wbFhmeW1Q?=
 =?utf-8?B?SHZaNjMxbCttL3FGeWJMdi81THNJT091MEltK3ErLzBUSnRvTmh2emZGMzlB?=
 =?utf-8?B?U1VGeWh0SlgzQ05nMFN0cnl5TkxnZW1KNnJNOHRkUVBTbk14TjRYL2g4Rm1L?=
 =?utf-8?B?YWE1YWZQRkxlS0I2bk11ZXFsQUhYVjJvVkpFSW11aS9nN2NhS0R3ajZONjFt?=
 =?utf-8?B?OFp3RlR6YUZ0UGlycm9ETzA4OFpwMnM0cFBsMThyQlBMRzVveUlFbTdGZlNV?=
 =?utf-8?B?d2pSQ211ZytaaURBYnRISkMxeXNhS001a1gxeW83RGxyRzZTQjk5N3p3TmtO?=
 =?utf-8?B?Ly9ZbHNjczdPU0VxVnlZN3FGZE5CS0JBU3NzWEhLRmdoSUpXVUUzNis2ZWU1?=
 =?utf-8?B?QXFVWXIzK3h3SXVTd1BpYkx5c2t0YWdnWTdRdGEydjRDWXhqcEhnU09VaURU?=
 =?utf-8?B?dzcyQWNlaEVOZ21MWG16RS9QdElMUWFqVWcrekZJN29VWElHRTQ1YVl6dC9v?=
 =?utf-8?B?THJPV0tMenY5KzlXOE15aDVZbWU2aFJtbzNwcmx0dVZJYW9nbHM1Y0EvamlV?=
 =?utf-8?B?VXQ5VHN2RUNDTkhDSStIUGpCTWNPM3EvdTN5NlBtMW50SGhQdXlmWVRrMG03?=
 =?utf-8?B?Q1VCQmU0VG5vZmlqQ0pPWFJFTTlCeHpIU215ajNrcnVtaVdSaDhBL1lRRm5h?=
 =?utf-8?B?L3VDMFFkelpUMTluRDZwSGIrNXF3ZGVtVG5tUW01QnVHVC9xalhaWUg1Q3Bx?=
 =?utf-8?B?bkRPN3RBZmpmZ1NkVWdoUnd2V2JHZ0paSUp1SFIyZDk2c3g3V3RkSXJCdjI3?=
 =?utf-8?B?NjF4UjRVM25wbEk4YWxRMWYyTWtDV1JBRU9RR2pVSWorUE10UjdxUUo5RlVl?=
 =?utf-8?B?a2RPbGh1aE55bzl2dXozdGw1b1ZKNUtpM1B6TVdOZzBIdWd2MENHZE5jWUlh?=
 =?utf-8?B?Nnl4cVU5TGJBV2J6Q2tiWnI2ZTlNa2hGQWlPQzY2cVFQVTdkMXpCUjFrTk82?=
 =?utf-8?B?ZnVSU0hDdE1aaW5oUFhvN3ltMTgvS1hNeXpveGNwbThGYmRPVjB1UTM3OGZP?=
 =?utf-8?B?TzdoanUxeTd3UEQwaG56b0o5d0NDSUl1UzU4MHhIUEFNcnozRzFoUXJnYnph?=
 =?utf-8?B?RXAvNjU4SHlxcGg4b3dhWnRGbGE1ZDdHOVhTbUorZU9leCtScFZSU2YxWnBh?=
 =?utf-8?B?cEswa0JBVmFDczQ0aGdnSm1DOThYUUJES2NVOEtGcFlyYXlnb0M1QTM2Q3J1?=
 =?utf-8?Q?v37JFjoik80vMgz0c+5gQtvHSfMj38eQ65dAZ73Ctq+W?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <575C7BB01910D7429C9543341E9BA79A@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6526.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91595908-e484-441e-6723-08dd88c53482
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 May 2025 15:31:12.7159 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ugW3NNwJILyqabPlEutf7v3G1RzHqAAYSWVsVYq0bZjxUuXSlpfo8LC9OhiTIXuz5b58AtLglU1kgzA/Kt+1Xw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9133
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

T24gVGh1LCAyMDI1LTA1LTAxIGF0IDExOjIyIC0wNDAwLCBKb2VsIEZlcm5hbmRlcyB3cm90ZToN
Cj4gQWxzbyBub3QgbXV0YXRpbmcgaXQgbGlrZSB0aGF0IG1hdGNoZXMgdGhlIHBhdHRlcm4gaW4g
dGhlIHJlc3Qgb2YgdGhpcyBmaWxlDQo+IHNvDQo+IEknZCBsZWF2ZSBpdCBhcy1pcy4NCg0KT2gg
SSBzZWUgbm93LiAgT25lIHZlcnNpb24gY2hhbmdlcyBhIHZhcmlhYmxlLCBhbmQgdGhlIG90aGVy
IHJldHVybnMgYSBuZXcNCnZhbHVlLg0K
