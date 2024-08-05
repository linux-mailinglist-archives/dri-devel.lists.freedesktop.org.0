Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91B12948207
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2024 21:00:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B93B110E288;
	Mon,  5 Aug 2024 19:00:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="HfOBvHl1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2069.outbound.protection.outlook.com [40.107.223.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FCA110E283;
 Mon,  5 Aug 2024 19:00:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BcNikEuImjaLaSDU86cs0HDaJp9na0QSekQNs32R9oWEqdRZ1CV6hmvJzS+Mwm6OW1okyjU9ICKwC/Q/wqZ4XycOREMXYuKHyc4UON2k7ICLDp/p7zZw91MhqZcobQr5Keo2jX7E1lYxJsxqrzyp9Bwr+PhtaFC61MuURWDYkZZevZ+kMY2PcVHhDi+9HUMB9B0TlJ67+wdUkvoebXZy0PTuUuu2PJNwlEoEgYCu8cTZ+c5QfPdfAFgZvtFw54CyK3mi+R/abCPb+5M58h+0GXVSm8d0PP9ZpnYBU/JPMc9VFKpkHQiwToe2LBYapLbt5XJd3afliYxWJGL0Q+uG7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Njsf7dmTLA7+4P+7JeM7Z/6WZrDZJ2r9Q7LX4GmrCZE=;
 b=VjAcn0R9v706xDkh4CfmsxzxtMsv4XKUPz6xL3cgsJApimrPIxSUNYwO8Xo/ngzO/PxUpcyUxBuriHwVz3R+DdtBHfKnNAcXDXFVAVKU19mZbm4vIFFeQFPxIJVwnJRqxCc8HX3UArhW9tQyQNt/bpLLAGhzdO3ksPa/iNIc12qOZD3juB0Vi1gfdydMYq1ugdadMjI60/CRWlsI2YQXe8n45BPZe17jeuYDCNAVhXbDwMKlI3ZU8mLWPev/Cxga71dyNzwVC7AvPamVbOPbcgocGFnRQii0esUhD5kR9eJa7KvEgRwDmsu58Atp6hO3lQenrubg0HwEm7SIagYlgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Njsf7dmTLA7+4P+7JeM7Z/6WZrDZJ2r9Q7LX4GmrCZE=;
 b=HfOBvHl1ofK5juPzwIEAy+lOyaOBwLyB116prP+B3Ov4EGRSnjFpoBjPmorMjVk2Lo1eFfrsbwftlp9LePKhhu0qQkOt1xK/5mdYBmNU+1DEwUxoLZvUDIKOyiCN5Ol+flwF9czQp2ced4YFCudNelXx1F4Dbcr8MEomPfrIPJw=
Received: from BL1PR12MB5144.namprd12.prod.outlook.com (2603:10b6:208:316::6)
 by MN2PR12MB4271.namprd12.prod.outlook.com (2603:10b6:208:1d7::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.27; Mon, 5 Aug
 2024 19:00:17 +0000
Received: from BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::491a:cce3:e531:3c42]) by BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::491a:cce3:e531:3c42%4]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 19:00:17 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "airlied@gmail.com"
 <airlied@gmail.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>
CC: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Koenig,
 Christian" <Christian.Koenig@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>
Subject: RE: [PATCH 1/9] drm/amdgpu: Use backlight power constants
Thread-Topic: [PATCH 1/9] drm/amdgpu: Use backlight power constants
Thread-Index: AQHa40RwfZVkUp/9skmuOiMGvcdSEbIZDHNQ
Date: Mon, 5 Aug 2024 19:00:17 +0000
Message-ID: <BL1PR12MB514410E846FEB773DC0CAEEFF7BE2@BL1PR12MB5144.namprd12.prod.outlook.com>
References: <20240731122311.1143153-1-tzimmermann@suse.de>
 <20240731122311.1143153-2-tzimmermann@suse.de>
In-Reply-To: <20240731122311.1143153-2-tzimmermann@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ActionId=c51ee36a-65a3-4885-8af0-c5a0ad7d5e24;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=0;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=true;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open Source;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2024-08-05T18:58:53Z;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5144:EE_|MN2PR12MB4271:EE_
x-ms-office365-filtering-correlation-id: 4b32fa59-6cb6-4a04-1cc0-08dcb580d892
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?eFpXSTdyNlZTUHdWRE0vWG5qSUM4T1hjUGRZMjZONVhJWWdjMGZDbzVoU3Bh?=
 =?utf-8?B?Z3FqaDFVK3FiT0FuZDRaTWkyZ2x4MjhReXlKVDcxTHZGNkd3RWl2c1Vsa1Vk?=
 =?utf-8?B?a0tUSU1ETmFlTWcySGYydDdyQWQ1YmZwcncvMk1ubTVKd2JJQ0RtMUFFRlhR?=
 =?utf-8?B?NzZhY1dlR2gxY0pKZFY2d3BNa2FqM0RlQTh5L0loZ0EybDBBSGNibE41djZC?=
 =?utf-8?B?cWEvM0dRdjZpYjFaQTljRTBYVnFERzRjMW0vczV4bTF4MHEyaW5DYjNQWEZj?=
 =?utf-8?B?Q2xYbGMra2E3MzNxdFdKZ0I5VFpkM0Z4L25OTitTaldFRGliRmxwZnNncWdz?=
 =?utf-8?B?eGJxNWt6ajRpSGc5SWR0bDlBdExwU2Y0QUU2K2VzQ3FMdXV4eFlyVlprZ0Yy?=
 =?utf-8?B?ZTRPZmR1VGVUL0ZiS1BYNDA1Z2M1UTdNQTFjc3U2Q0I1R3cwcWoyaytXckVP?=
 =?utf-8?B?LzJ3MTBLa3hGS2ZhR1kzYW84ZUZSRCtKZy9MTzEwb3VXUTRRVEVrWjZhenRz?=
 =?utf-8?B?K3FGWWtxaTF1bTY0SXNEekxlUVVwYWRoeG85VjNTU2hLNHU2Sk41dFJhd0Yz?=
 =?utf-8?B?cE5rNUdEV0hYanhjbHJnOEFRWEk5UlVGbjhMaCsrNUlaOUJXQjVyNkw2L21w?=
 =?utf-8?B?M3ZsMVVSYlRRN0c4VHVYUVNiVDhkNnJwZm16S3d0OGpDWHJCT2JDUDFENFpP?=
 =?utf-8?B?OE1RMjQwZkt5emlDcHhtSEhjbXJaSDZXV0MrTEozU0NyVFhpMXpSL1VrYjZ3?=
 =?utf-8?B?UjJlb2crS1VOZkVXcUMwU2V0MkVoMHFvY2JENm5IOHlVbkZoK1RneENRQ0RI?=
 =?utf-8?B?Umx3M1pIalJBQWdQNDdvOVdzU3Jpd3A1enlmbytyTVpvOTQxYmNVQnY5Sitt?=
 =?utf-8?B?aytYL1dXVFpnVzRVb2NTQkpvVzlyRnlsaXVYYkgxb0xYcyszdTB3b1V3OE1H?=
 =?utf-8?B?UFVJMnl3VHhjVEZYK2NtblZhTlVzVlAraEZxckpmMHYzUEk3V0srVTNSSnNX?=
 =?utf-8?B?VTh1Wk1KOWhwaG1FSXBDS09lcm9DNk5makNRUnVXRVo4OGpQM0kxYlkzWG1N?=
 =?utf-8?B?a3JzSkdxOGpuSTlNYUVqYksvd1lOMjh3dmlvL3Z1SHpsWFk4WFA2NFFjM3lZ?=
 =?utf-8?B?c2dpNGF1b0VNanRRTDhUdjExRnR3dythcCtJNEx2Yjhzekh2b1dOVmxRTlU5?=
 =?utf-8?B?Qk4rNHQ5SkdLYjRCd0xHamkvVWtldE1sL3orSmsvYVRlL2FFTGVBTGRRTFdR?=
 =?utf-8?B?OFc0YVBtN21GRTY2M1pTNlpQMnJUL09uMjJlWXlNZjZ6aUphQ0RkR1Buem4v?=
 =?utf-8?B?OE1yV2FXNmNSRXVmbWN3ekdSWjdPS2QrSTZ3WG9OMm5jbUYxckNvZlFNTTlF?=
 =?utf-8?B?QXhTdllzc0p6ci9QOG9qejFSVjJCV1BVblBza3lQM29SQW1yNnhzSWhneThT?=
 =?utf-8?B?UEJxWTlUMmI4a1NQZGtoS0xpRnUvVTJXVzNVd1krelVTUmNQMnpQdnpPdEZ4?=
 =?utf-8?B?bjlaQ3NYV3RkbDVxR2FpLzRMZ3JwS2N2YTFFUFFlV0o2alJ2WTIxalRYc2VG?=
 =?utf-8?B?ZVU5YURhUUdLZ0hWL3B2V1I5SzdFdGhjcVV2L3pLdjRwc2FiODcxT3NUdk1J?=
 =?utf-8?B?Mm9FbmliOWZNdzR4VTR3NUNKVHhOYjVUQUkrc2lQeVMvTERZbGU0U0NJSFBD?=
 =?utf-8?B?a3crMGNCU1RiZnU4TC9UelJDNmEvT0NPUnMvNEFiTCtBaHFSeG84a3dZUTZL?=
 =?utf-8?B?U25Jd1grUVpiVUp5dHRMSmVVTW96bFp2L01vbksrSU9ndEJhWjhFdlNGN1dF?=
 =?utf-8?B?VGVhYzRQaXJZMEpJN2xRZlV5eDFLRVRlYk9pUEFyd25OVVVscWM1N2E0ek5q?=
 =?utf-8?B?R0F3anFZT3pacnRsaWh6bCs2MjBjaURSUE9na0RxbzdQNVE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5144.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MktuSk9ZMnNlNVYzQ29QRkc3WndkZnhCaGZrSlczbGpzSDFzcEtmQXNZWTBj?=
 =?utf-8?B?NHhXWWhEN01EZFNiZnhMcDYvai9PeWV4dW92RnZUVTdYNThQNlcxTkVudndR?=
 =?utf-8?B?RVUwM3B2Z0I0aDB1N2RkQlh5L2hQS2dvWDFwU01ZbzI1Z0FPbGEvMlNzcS8x?=
 =?utf-8?B?S0k4bFdJQXl4Vm1JUXlxM0NMVjhBeS9aZ09NSngvdkdlVFBWTlg5bVZXelFj?=
 =?utf-8?B?eHVFVVcveGVVazJZZ2pFQTEzRU9WQXNndGhWNVI2MEtaMUxIbmJ2YWdnOUVX?=
 =?utf-8?B?YWtmc2JKYkxSNGo1M1F0cTJCUjFEMDQyNkhsNjF2ZHNpbU1KSVJTdTE5NGNE?=
 =?utf-8?B?TWJhblYvZVdjY2FicFlMeUhYNmJ4SjB3YlpZMXlOVGNLUXFXN09yWnpGMjQ0?=
 =?utf-8?B?dk1ldzBaOWtOS1VJVFlwelJiVWdvbnZXNVlHaHhCSWd4b1AxSkNQMFpocllS?=
 =?utf-8?B?blpKUlpXU3V0cU1kZm0vRGo5NTl5WDNCYmJGc2ZyaUlsYk5iSGVkSHVrVGJO?=
 =?utf-8?B?bm92cXQxRVZXTFhuOTgvaUhjcURDa2F3TjczQmhna1NZd2FsTTNidk1KMk5m?=
 =?utf-8?B?UWRiL3J4Z2xuTG9XTXhpNm9KZHpham94eXI3SDlmb3phL0pwcXkyRnhSanBS?=
 =?utf-8?B?bXhhT0dPTlp1anhSWnR3a2s4TzIwQzIzOG9rdlRKL09UVmRxQ3RjTUVDUnJi?=
 =?utf-8?B?NFdac0JmbUVmVGZWZzgrTVh0RTJUSG0wdnVtN0dLQjU1VW1PK09jM093QUZs?=
 =?utf-8?B?ejkwMmhmOEJnTWhzc1lMejdad0J6YkFHa0NGVzlHUTZ0U2NsL1JqbVg3dVRP?=
 =?utf-8?B?a2RITnNSaW5jOVA1akVqU29zUTd1RlVDam03ZUNSOHlrY053Q0Y5Yk5LQnNh?=
 =?utf-8?B?M05nbjNrZWxKUEUrWGorNi9zT1QrT1AzUVpYOFp6UDVLT09qc3A2amlHanN2?=
 =?utf-8?B?WE5uSGxMbmpFTEdMOGxoNmpGWm9vUi9yQ0JCQ3EyQnkzUWs1RUJ5Y3FLUnM2?=
 =?utf-8?B?SkZxSlBwQ1gzNGhLR1VxTkllQlI2MytZcjNoZUQwWmlrR3Y1c0VpUjZKRUM5?=
 =?utf-8?B?Rkx0UHZUQ1J1S0FTVmNTOUdPbVhTT1Y4NGN0VXRhUDlhMkZyeFNzdGQwbmRT?=
 =?utf-8?B?eC9mUFZaVDl5R0RIdEY2YXZFVEUrc1BHTVRQSW1tVzNGTVQ1eG1qWEZBUXRU?=
 =?utf-8?B?N2dTS2lkOEM0OU0yRW9NNWc1SlNPOGFtTi9kRk5ITEFjSHI1WDFiN3czWHdQ?=
 =?utf-8?B?WkJNdUlHajdqRGZiai9DTmVETlZRTXN0T0k3N1NoWVoxa21wVDBWZWdXL1NF?=
 =?utf-8?B?WEZ4NXd1M3k2RkYwOHpjZ3NaQjhYOUVvUjdQMXVWWDF1QUhvbDFkdmYwM01H?=
 =?utf-8?B?SW8xa05yNWRkNEE2YmVFZUdhVDk2Zlk1bXg1ZEppMXB5Q05ZWDNBTlo3RWpS?=
 =?utf-8?B?MWJJSVVJay9aZ3VZWnVLeCtkdnNZMVpTQlJPaVlMV3I2ZUF6RHNSUnA5Q1dL?=
 =?utf-8?B?TmptY21OSk5McVVkblYrUzhaWEJUY0p1cXRrdEc1VE5xSjF2TGtKV3NBRW1p?=
 =?utf-8?B?bjRpaXdmNkxDbXVxUVZGbG00MUEzK2ZXbm1BVi9RVXEzU0J6aC9va3RtUFcz?=
 =?utf-8?B?d2VHVVFab2l3MzVlMTdSN0V3R1dENndPbVpSSGlWZ2I5ZXdNKzE2dzduR0JJ?=
 =?utf-8?B?SUNzQWVKczNmZEp5aFYxcjhFYk1tU1puYUdpSHJGMXQrbWhtOVJpdTgvL25I?=
 =?utf-8?B?NHcrRXlnODBId1hzS2RLOE9RV0FlM1FzVGdWZjAydkFyZzBMQ0szZWZNdzVQ?=
 =?utf-8?B?Y0dKb0gvRGxpenl2RjhuUXRxTHNGa0diNnY4R21RTDZDUjdCYVZkWC8xRk42?=
 =?utf-8?B?SExKdjgvVUV4cU5La3BTWHMyOG9IN3MzbWVSRzMvaUZKZnZxVytJZEV3SGVa?=
 =?utf-8?B?ZTg2bjNGZFpFSWJXbmJyV3ZEZ3NxZmF1dzBBUkxvWFcyRndpVEhvQnpORVp2?=
 =?utf-8?B?YVY2RDJnZWJuMlF6UFlOZS9lWHlSNDdVSERJTWNLT1ErRFd5QWcrazJVSXN2?=
 =?utf-8?B?Ym12SEVuY0RUaUxEZmNCdXBqVlhGTHh0VEhOZ1dNd3QrSjUrcUVVc2tkVzEr?=
 =?utf-8?Q?6lo8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5144.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b32fa59-6cb6-4a04-1cc0-08dcb580d892
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2024 19:00:17.3598 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4N7fYRUKbCjcDc6YDkh+Y7YY0swXgorDwc5nUf2tUHRln91pa4o2WWfMTvALfpd7RUmrWFq5N8LOsCVt6dKpLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4271
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

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBUaG9tYXMg
WmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4NCj4gU2VudDogV2VkbmVzZGF5LCBKdWx5
IDMxLCAyMDI0IDg6MTcgQU0NCj4gVG86IG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNv
bTsgbXJpcGFyZEBrZXJuZWwub3JnOw0KPiBhaXJsaWVkQGdtYWlsLmNvbTsgZGFuaWVsQGZmd2xs
LmNoDQo+IENjOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZzsgaW50ZWwtDQo+IGdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGlu
dGVsLXhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgVGhvbWFzDQo+IFppbW1lcm1hbm4gPHR6aW1t
ZXJtYW5uQHN1c2UuZGU+OyBEZXVjaGVyLCBBbGV4YW5kZXINCj4gPEFsZXhhbmRlci5EZXVjaGVy
QGFtZC5jb20+OyBLb2VuaWcsIENocmlzdGlhbg0KPiA8Q2hyaXN0aWFuLktvZW5pZ0BhbWQuY29t
PjsgUGFuLCBYaW5odWkgPFhpbmh1aS5QYW5AYW1kLmNvbT4NCj4gU3ViamVjdDogW1BBVENIIDEv
OV0gZHJtL2FtZGdwdTogVXNlIGJhY2tsaWdodCBwb3dlciBjb25zdGFudHMNCj4NCj4gUmVwbGFj
ZSBGQl9CTEFOS18gY29uc3RhbnRzIHdpdGggdGhlaXIgY291bnRlcnBhcnRzIGZyb20gdGhlIGJh
Y2tsaWdodA0KPiBzdWJzeXN0ZW0uIFRoZSB2YWx1ZXMgYXJlIGlkZW50aWNhbCwgc28gdGhlcmUn
cyBubyBjaGFuZ2UgaW4gZnVuY3Rpb25hbGl0eSBvcg0KPiBzZW1hbnRpY3MuDQo+DQo+IFNpZ25l
ZC1vZmYtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPg0KPiBDYzog
QWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPg0KPiBDYzogIkNocmlzdGlh
biBLw7ZuaWciIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+DQo+IENjOiBYaW5odWkgUGFuIDxY
aW5odWkuUGFuQGFtZC5jb20+DQoNClRoaXMgcGF0Y2ggYW5kIHRoZSByYWRlb24gcGF0Y2ggYXJl
Og0KQWNrZWQtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4NCg0K
RmVlbCBmcmVlIHRvIHRha2UgdGhlbSB2aWEgd2hhdGV2ZXIgdHJlZSBtYWtlcyBzZW5zZSBpZiB5
b3UgYXJlIHRyeWluZyB0byBrZWVwIHRoZSBwYXRjaGVzIHRvZ2V0aGVyLCBvciBsZXQgbWUga25v
dyBpZiB5b3Ugd2FudCBtZSB0byBwaWNrIHRoZW0gdXAuDQoNClRoYW5rcywNCg0KQWxleA0KDQo+
IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYXRvbWJpb3NfZW5jb2RlcnMuYyB8
IDIgKy0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0K
Pg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYXRvbWJpb3NfZW5j
b2RlcnMuYw0KPiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2F0b21iaW9zX2VuY29kZXJz
LmMNCj4gaW5kZXggMjVmZWFiMTg4ZGZlLi42NTBlYzk1YmI0MGEgMTAwNjQ0DQo+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2F0b21iaW9zX2VuY29kZXJzLmMNCj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYXRvbWJpb3NfZW5jb2RlcnMuYw0KPiBAQCAtMjE1LDcg
KzIxNSw3IEBAIHZvaWQNCj4gYW1kZ3B1X2F0b21iaW9zX2VuY29kZXJfaW5pdF9iYWNrbGlnaHQo
c3RydWN0IGFtZGdwdV9lbmNvZGVyDQo+ICphbWRncHVfZW5jb2RlDQo+ICAgICAgIGRpZy0+Ymxf
ZGV2ID0gYmQ7DQo+DQo+ICAgICAgIGJkLT5wcm9wcy5icmlnaHRuZXNzID0NCj4gYW1kZ3B1X2F0
b21iaW9zX2VuY29kZXJfZ2V0X2JhY2tsaWdodF9icmlnaHRuZXNzKGJkKTsNCj4gLSAgICAgYmQt
PnByb3BzLnBvd2VyID0gRkJfQkxBTktfVU5CTEFOSzsNCj4gKyAgICAgYmQtPnByb3BzLnBvd2Vy
ID0gQkFDS0xJR0hUX1BPV0VSX09OOw0KPiAgICAgICBiYWNrbGlnaHRfdXBkYXRlX3N0YXR1cyhi
ZCk7DQo+DQo+ICAgICAgIERSTV9JTkZPKCJhbWRncHUgYXRvbSBESUcgYmFja2xpZ2h0IGluaXRp
YWxpemVkXG4iKTsNCj4gLS0NCj4gMi40NS4yDQoNCg==
