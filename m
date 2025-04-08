Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C158EA81109
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 18:00:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 910D710E259;
	Tue,  8 Apr 2025 16:00:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="J+Y0KkdK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2071.outbound.protection.outlook.com [40.107.223.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECAE410E259;
 Tue,  8 Apr 2025 16:00:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l3kuYE6uKItoc1xiAfBME7QfEG5b08Y57iKf5EZPc5GNB7c0jhRXUUHQo2bZ9NhvzHnH5TS769VkYTYfY75VTsIC/+464p28nSjSloEHlqfI3EVz3PW58dwMIahNO8v/lHSXpda9e4wC2Xyo5/1Z4jJVfVh9EKWhpfZdyy3KMc3WzqxihN0G2zmd1y4cSZeZmKu1X4qG/8UlIph48y/YPZZXj0lrnGCXOz9CEbQLAgRkj107VuTwUbQAgRxF8sJa6Mpa7I0zCff2pe0wj6bk1NNpMk1PE3n7Rcyd/JKl2cAyUHDhOu1lowho4rgWI3gJ1Po7KqaNADehuaFrDwLlHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sCg+mxEejd7TOtYSTzCY8l049JGj9oYN+5IvrKBUnXg=;
 b=tR6eOxkresmsKcHsftKoC8oEWxdlQSVpwX0SUGoR2gng2LmfXHwxJk+ZtU/UKS1C9EDVXQR4QooAUYQmasVnG59c+xM5p9IHjmx/i6CENgVfhBzbuAxO159b7TXomQhxYXZ+gQYtKflNSgBs0sVNa1H4nKekIaPrK/5HkACHN/4S2tgYWliLcE0aJOKbfQ5BqrHD/L3Nn/i17HerP6mgotTwNWUrpJBjHn1bkmDrDtaG8ZvtUSlVpl9JvgYXW7n2M3x/PnBA0XVzdxkE7QaXP6+6pHIFEzU6cU+P1fcS4s6zAyf4tOsktnb3j+V79nr2Jp8VXb1eE60McMvdBcCbmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sCg+mxEejd7TOtYSTzCY8l049JGj9oYN+5IvrKBUnXg=;
 b=J+Y0KkdKYrV/i2HbUehvZw5y9ahvpeUgdeJfaB51OqDzGCRpqiDj2PcEPrpBToHX/cCoyjorJpdyGED0kqQulpudxmElZWiBJKZdTbHsuWc5sAoJ7EfApxbAWsexhKk81BXHP/s4awIkEYr7793qDjmaBmqT6ATIqX0OCNQ7cA6ZeAtUrIiqF673kGC4cE34mQkPq23ArcFlGqaowx2CMBfSyH54S5IAB9pRfpI6vHlu+h1vB9c9QyOI/Dvpvz893nFS+x5W9qccFEH2fp/cdnyqdgDG4I3qacquanwEh+zPVmKcea2PkndLLnUt8chglQ8WzneIIRnxu6w9JKJqZQ==
Received: from CY5PR12MB6526.namprd12.prod.outlook.com (2603:10b6:930:31::20)
 by LV8PR12MB9644.namprd12.prod.outlook.com (2603:10b6:408:296::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Tue, 8 Apr
 2025 15:59:55 +0000
Received: from CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56]) by CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56%5]) with mapi id 15.20.8606.033; Tue, 8 Apr 2025
 15:59:55 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, Ben Skeggs
 <bskeggs@nvidia.com>, "dwmw2@infradead.org" <dwmw2@infradead.org>
Subject: Re: [6.13.6 stable regression?] Nouveau reboot failure in
 r535_gsp_msg_recv()
Thread-Topic: [6.13.6 stable regression?] Nouveau reboot failure in
 r535_gsp_msg_recv()
Thread-Index: AQHbp9G0LmhXfQe7vUujDTTQzzqtibOYZIwAgAAJR4CAAAOaAIAAFVWAgAACUACAAAJUAIAADx4AgAAC2ICAAATUAIABTLUA
Date: Tue, 8 Apr 2025 15:59:55 +0000
Message-ID: <c5bf5cf5a6d0d9020c6f7f0adb1b68c6d9598c23.camel@nvidia.com>
References: <69997152cb8688a63b50fd8d3f189cc0e2668225.camel@infradead.org>
 <71e3db014ae5bf84048313197ec08abb271ce757.camel@nvidia.com>
 <5a0a20cddbc13d3f9eb96067491034a22830620e.camel@infradead.org>
 <9890af80b576c61bd503134c13ee866a105a89fa.camel@nvidia.com>
 <7acb91aac7e7e720e735b5271e4938f866a476ac.camel@nvidia.com>
 <b26d088c043a83aecff243a9d08457f77381b5f0.camel@infradead.org>
 <b3632ad6a6f8f4848ee70583286f72668406e10e.camel@nvidia.com>
 <bf00be734d5311b703a3d9eb491b345f64ea8092.camel@infradead.org>
 <83204f028c1fb0b2e36812b79cedd438966b4c6f.camel@nvidia.com>
 <5B682A0A-C81D-47F4-A0A2-BA81A6281413@infradead.org>
In-Reply-To: <5B682A0A-C81D-47F4-A0A2-BA81A6281413@infradead.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR12MB6526:EE_|LV8PR12MB9644:EE_
x-ms-office365-filtering-correlation-id: 2e0a4cd7-5771-4c0b-e94d-08dd76b667a7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?WDZnMStRMFUvRFJibk4rUTNXeFpYWkNnemhiQlcrZ3VVYjk2b1o4L2s1ZGZq?=
 =?utf-8?B?UTI2KzlzamFwaStZSnp0V2VhTXNtQWpBdlRWUGcwOGNaUDJ1UE1iK2FRSytj?=
 =?utf-8?B?U1QzWkoyZEF4Q0c1dDdnTEYxdHZwY0RjRlo5dVFYWnN5eGNJTXlldEpNZFdZ?=
 =?utf-8?B?M3B2a2c1TlhHREtsRi8rRUNldzNWcU9Pbk50dmxJWk9zblNtWHR5UnZJVzkv?=
 =?utf-8?B?ci9hVWRZZzM0ZmdVbnJkYUV5ci9CUXRrcVRaUjluVlR6WVYrZXdHcHlNNlV2?=
 =?utf-8?B?cEY5RzY0b01sdFd2RE1xZXhSVGRqQU4vdHdjMDV1T1VRNXg4Y2ZvRHlCSFkz?=
 =?utf-8?B?MEZIbWUrOHQwbVZ3WGxWczBTbERUZ3BLSUZaSk5LNXRNa2tjbHpwaUhJN0xq?=
 =?utf-8?B?Szd5VGlVNHFkN3BVUUZtYVJLMHZtVkFHNGlVWXE0NndxNzB0TVoyeWNQc2cr?=
 =?utf-8?B?NnMyRGk0WnEvTkxHOWNjN09wbXJiL1E3S1l3bTdDL3l2NGZQYmhQSE42aklI?=
 =?utf-8?B?eVlpRW11R3JjdGN4QnhpUXRpL3VJQnFCVE9vckJ4anJKbGFxazE2WWFiQmZB?=
 =?utf-8?B?aW80OXE2MWw2eWJtWVI5bVlMTTllYzRZaHRJUGRaSGZCOGJXcndDN0ZaRStq?=
 =?utf-8?B?V2VPVUdlWHR2dXdmMFh4NUU2MENVcVhMa2dRNHExVjVQcnRzV0JPNmJvSEJT?=
 =?utf-8?B?ditXQzhxZ3RLU2ZBT001R3EvQnV0RkdVZTVpUWJuNHhZUUhhOEMzZDVwQm5K?=
 =?utf-8?B?TkZUQjBnd0hFTlVpeHNTRC8zRHNjenl1dVNYVkRBU0ZhOEl1Z25leGc0NjZk?=
 =?utf-8?B?QnZaVUJENzdUVmcyeTJLUVd1ekUyZVdJM0ZqTDRUa1I5K2lmSFdiNXNDTjI5?=
 =?utf-8?B?TTRsazBLM25rUE9WK1kvTkdLeFBiOVVQNk1zSWVTc3J0MkRTVTJPM2VCemdQ?=
 =?utf-8?B?L2x4Q0Z0aWJlS3JSNkt1SDBkMG5zTW5ENEVPSG1ObGdmbkhGQkh6N3dGblNF?=
 =?utf-8?B?UHl4SmdsdWhuRjBsWm9MeUh6cUU4czR3aTVLMXJrVFVMZXQyMlBNeUVFcVAr?=
 =?utf-8?B?RzB1RHM2SHRDUmJsT0x5QUJXV1pMdnJXaTM0WVNOWDZWd0pYSU1YTjJydnAy?=
 =?utf-8?B?WW1IbWwzVklSTElFRUx3VUxCVHJJbVpmSVROc1BoTEZENHVGNTA2djVCNlpu?=
 =?utf-8?B?a3NtZUoyNlhpL0tVempDQTFsSWhDU2phYmg5V1ZGSk5yczN4QzZkZFVRazF5?=
 =?utf-8?B?WEJsODJHN25CY0tRZHBCRVY1WmpFa0JJYzNZR3JoUDlwL2tkMUlkMEplZzhL?=
 =?utf-8?B?WkZpeHFYcm9wVlBrRkU1cVJvYWNza3VNNzcxcFJTQ1RHY21HY3piZExIVVJX?=
 =?utf-8?B?SnEvTVRYSW90bFFuTUtyT2JRcTVLT0dNVnd1VFZIYitRdzJtWk9YZVhuNHVP?=
 =?utf-8?B?YVk4MTBwdEtIcTU0YUJ5bzN0cHVtVWh6aXlnQldVbDNweXdYVWdPc1YrRWNh?=
 =?utf-8?B?a1Z6MkVmbjEvcFNsNUlCZlY1WlpMNEpTdlRpOHhHczdrblhEUkNPNWNqS2x5?=
 =?utf-8?B?RTEyS1F5eHdhVFpBM3dueWw0Q0ZSLy9RVm5jRTF3Qkw2VEsvWm44VUNjelRN?=
 =?utf-8?B?Vk5zYXZjY2hORHo2R2h6azN6SldocjQrZVVEUk9ZOWFwbDc4M0JOMzhpUUha?=
 =?utf-8?B?OTJoQUp6MFl4di84QzRwWis0ZmlBNGxhRGlMaHhOTTVNRVZWTThFSnUxb3Vk?=
 =?utf-8?B?R0tkdmlmZyszRm9IRzRwSHEvdFZvbHluWUtCSXE5aWdiTnFCWkdHVkM2RFhP?=
 =?utf-8?B?NTZCaGpjMTZVTXFIclJxYmF1aGlRU216SzY2ckNBbUliWE9GY3RsRkV1OS9k?=
 =?utf-8?B?TFRRRUs0VmVPUnljcG5wSjEweHFpMTYyb3JHbjNwYy9SQmlIY3VXMUNYK0NZ?=
 =?utf-8?Q?8hRXK1m3/nwa72VHVDgoh3gh1tEFZONP?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR12MB6526.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VytHQnRyakc5Nmw0SXBndWhTemd2ODFnQ1ZiclNxQ1E4ZEVJQnN4cHFaQmds?=
 =?utf-8?B?RFIxRWdiVkFPQU50MTgxV2hYRlZNMnRuSjZIY3JBWlc1TTllNm5NT01uSlND?=
 =?utf-8?B?alREazNJR0wwS2wzOGcyZmVlN1IzaFVtQW85SmVjcDJ3Qm1BYjlyRUx2UGxD?=
 =?utf-8?B?c2YxQ2JwWUFYQlAwL21Rb1VNdjFYaXpxMUhzK25BdlpkMFBFM2ZFbVBCeTRv?=
 =?utf-8?B?cDJ6dFVGUHZRZThCWVV0MjFyTElPVlkxc0orSHZsOHlmVm8wUDd3UGg3VFV2?=
 =?utf-8?B?L2hoKzkzRnlIazhWMVcyV3ZINklpcUtnS3FyWVpnV1RLSTAzZkIxL3ZtaE9w?=
 =?utf-8?B?R29jZnFqVTZTNytKanpqbjI0eHMzTktveENvYlUwOElORFZmRGVZS1ROcXBs?=
 =?utf-8?B?Y2ZQZTU1aU1VK1kydjl0Skt6bDlMTWgzZTZVUTBXRWlzNEI2bmxEOWQ0ODd1?=
 =?utf-8?B?TmxSTEtIRVBlTG1MOW1NTzladWt4ODJJUXc3NzRZWlZiYXpzMFF4OEdhS29v?=
 =?utf-8?B?ZmxWcUhaVEpQOEJhbnBIM2hUbWJOT3JvUHFNWkJEVWRIeVE2d0tqeENaZUZU?=
 =?utf-8?B?QnlkVTJJWWtDRWhIZUdRZVNGNit2UW16WTZsejEzbHZtZysrUTZabU5pM2Nv?=
 =?utf-8?B?d0dkK3I4ZTBpZWRwc1dDZFVFZU5HNHFaa1BZVFRQeGFLMTR6RE9Wckhhd0Zz?=
 =?utf-8?B?WFpMM3FsYVFycnZhSGtLUGR1T2JvM1dmcWkrbGRTazcxSWZ0REJ0UHdHTmFo?=
 =?utf-8?B?YmlNYVIxVzVlL2x2VzgyWncvc2FJUm5RWkpNVmVGNjhSdlZFTU9LNVlCbHZa?=
 =?utf-8?B?ZURrZ2VWV054VGpJU2U5NkMwY2JrOVlMYW44cm04eVI1TktGVTRQZ2F5VkpP?=
 =?utf-8?B?STlTUFhGRkljVVVWaXdrb3dicXlOdFQ2STJsS2x4MXRReFkrbDlSYzlwdEdh?=
 =?utf-8?B?d0ZmbEJjclZ5SFUrbHUyenAzcGZ5bklVcjV1NENPZ0wyRHVmOENmcXBmZ3VX?=
 =?utf-8?B?SlFGd2tnOWhyZzdLQ1RERFdvT1c0TFhBMFV5TDQ1dHZZRzFwRkJpdzhUcUxv?=
 =?utf-8?B?bTkwL2Y5QWlkajkyQis2bnpSbm9xaFQ1aU5RTTl4WjdOTmxnUjN5Ky9tWmw0?=
 =?utf-8?B?QTRzQzVxdnhtQXhvSHJJV01YbG9sV2R3K1M2bU5JU1dMeG43eUN3Q2dwY0VE?=
 =?utf-8?B?U0NhL1pyampTaFVueGp5bVZxWVFHdXBxN3YvN3hQTnpuMWtnTXpzb0puMVcx?=
 =?utf-8?B?S0tiaW0zNnRPRDZaRndPUVVTRmJUWWNKVDB4SVZaYkdCd3lBRTd2dzlQM2xa?=
 =?utf-8?B?Q2FhYU9hcy9nK3ZQem15aExCZTRmTGpXUkU0ZUMycXRIMnhXb3hBRW1vNGJR?=
 =?utf-8?B?UmFRcW03NThhUDNqMTRmeVRvQi9ocFpWQlNzdW4xcC9aRHRpVlVEWE5VSlY4?=
 =?utf-8?B?RzRLbVVNS0JPVi9zNjFuaDlNYXRXVFBvVlQzSytybXBRdUh6WVkwbFhtNE9r?=
 =?utf-8?B?bnRuM3RzVStsUFVPSldVbTI3MEJEZ2VmSzJpN3RDcU9XdUdERGwrSEZ4alFv?=
 =?utf-8?B?b3V3Nnc0ZVdGaFUrUFNJWms3cktSd0t5MEVTb2REV2p6blkyUlNVbFFPVmRZ?=
 =?utf-8?B?TlZTYmo2cS9pclFKRjIyZGwyTzgyM3JCMHNXYTNCZ1Naa0VDVUVpV3psbVEx?=
 =?utf-8?B?Mlh0ZnpyRTk4N0RNWHcrVjh4aEhJeE9MM2YycUhKSDMraDBveTRTT2xRaHhi?=
 =?utf-8?B?M2k1SUhFcVFGUk1VRGx6SWdCYjZ1MGlSREJHTVFSWHN2UFd5Y2owYXUvUHJr?=
 =?utf-8?B?dHl6UitQc0didi9hL3ZwM0pnS05xaEt5VFBOU3NGa2pVYm5EcC9JTlhNcS9a?=
 =?utf-8?B?bkRqRmZST0o4QzZLQTNQcTZSUFpCTlFrNklueWY1bnpKdnV2RGFJc25vYllW?=
 =?utf-8?B?bjUzM2VZZG1EL2VwL04wbStybS95QXhVRWtWWUdlMm1DeGQwUGQwV0VuZ1NK?=
 =?utf-8?B?NG9GUDdvU3p0akhORHc2V3NvNEpEeFk1dHRSRmFYVXNZdmk1UXVIRTUvNkFl?=
 =?utf-8?B?eXZxODhSa1hYaTFjMUlKQ3hITW96NE5rRkJtSTkzamEvR3hpUlRaSHVOVDN3?=
 =?utf-8?Q?1e01nuTMxua0NjcA+KDDiPIfA?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E9629A912A23AC45B5D4FB8913E9A4D7@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6526.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e0a4cd7-5771-4c0b-e94d-08dd76b667a7
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Apr 2025 15:59:55.1202 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: s977z4vwQQmBScTbkEGygcBGRZREYRHde6L/2cKpPlGZFM5MCo6bGVcp+0Cr1F4vUjuboyVtIrhBG09Eezx/Ew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9644
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

T24gTW9uLCAyMDI1LTA0LTA3IGF0IDIxOjA5ICswMTAwLCBEYXZpZCBXb29kaG91c2Ugd3JvdGU6
DQo+IEl0ICp3YXMqIHdvcmtpbmcsIGFzIGxvbmcgYXMgSSBjb3VsZCB0b2xlcmF0ZSBpdCBiZWlu
ZyBzY2FsZWQgdG8gMjAwJSBsaWtlDQo+IHRoZSBpbnRlcm5hbCBkaXNwbGF5LiBJdCAqZGlkKiBs
aWdodCB1cCB0aGUgZXh0ZXJuYWwgZGlzcGxheSBqdXN0IGZpbmUuDQoNCk9rLCB0aGUgb25seSB0
aGluZyBJIGNhbiB0aGluayBvZiBpcyB0byBkbyBhIGJpc2VjdCBiZXR3ZWVuIDYuMTMuNCBhbmQN
CjYuMTMuNiB0byBkZXRlcm1pbmUgdGhlIGNvbW1pdCB0aGF0IGJyb2tlIGl0Lg0KDQo=
