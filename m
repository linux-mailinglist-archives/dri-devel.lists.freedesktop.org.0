Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 775FDA7E668
	for <lists+dri-devel@lfdr.de>; Mon,  7 Apr 2025 18:28:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2337010E51A;
	Mon,  7 Apr 2025 16:28:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="solEKgBN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2041.outbound.protection.outlook.com [40.107.223.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBAFC10E1E7;
 Mon,  7 Apr 2025 16:28:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=io56g25oT0dDJpFlPRCZxG+PZteDg8+fwZ7+kpKwTvoDw9C2/+VRXE5raI0ROzwjCemdqTxxWSQD3lCpK+ZEp5DTgI9doZ/Efbox7e6NYNU6eM0HiJuE2nF8wMIxCwnjrCBi6k02RSGLR84Z7MN5bzKEn8xKYEa4El6f9s68LBnIfMZczcMzvP8wVFzvgm0etSwyP1YYcGlBkSSswcPYuY4gaAYqerQQqwJhG7iCJ5Hu8cwP7ymlDkEgs90PRyC5kG6YVCV/SP/YbWn4tQBch9qnSR9YovK+YeMlKW7ZtdSUgN42DW1rqsrIanAO++1WqPq4cEc8sSY52c1mr1+8sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+3k1ykgdcHJa7AmObAm5tNu2DJE9CV3U7P1Hs8fuDI8=;
 b=OSEZ0PV8ryjj3jHv5JrryQjjlzr8vk9cCfVftoJldjSyePNND8Pj7+4qgR/ph87QgwpWQxXAa9w2W4FoP9PhVMAFc5z5oJcz3GgN5yWfdPIDz0pmWoscKThcypEkMV6cZXzm2PkACufTCMmCmZAwWZpCdyfwTKGnsEE0BkYAjnADLhooiRq12/3npTL3MG8GKIY+yHqVCRXvfMfqin7yRpZqxWhsYxqPYZgp7Rpng6DMKO6skQ6A4jk2wHDv7OESIqCEKjzsjmMM6FcGkeZkA3x3GWzeuR2RmJ3+p2ooFyWlvmC0U2azBXeuCYkHq+8MTSNYc9KeRnl9ic2hivHLfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+3k1ykgdcHJa7AmObAm5tNu2DJE9CV3U7P1Hs8fuDI8=;
 b=solEKgBN2g3J/dq9hEtEcpcMjMZPSwK7eV/VfVhRjRt3/7uzyr6sFZ9hrSoivTF2sTcVzrbr31bw4N+VRF2pslLqdiGlKqxUdMjX5KQSHi4KXbjWc3gkYjbnQ94J+a/9/+A6KkulLMNkq+XrLTKwK87kRiTEdhdvVCILlXeoyu/uYwYp9qtVoCSb3et7lZK4V6KjsWQaJUzJttkVvWAR5wD4Tvk5v59kCZa67QuK6OfbS61uguAYZ4AJOP/HZTxcNb57gd3UlYsboTLTPhnR3X6QG1iz6uyg9yYRVa7ybmPQCFPovXJPSnbIRJQlZYcCospTy6J4/ARr9MbKUCgtXg==
Received: from CY5PR12MB6526.namprd12.prod.outlook.com (2603:10b6:930:31::20)
 by PH8PR12MB6866.namprd12.prod.outlook.com (2603:10b6:510:1c9::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.31; Mon, 7 Apr
 2025 16:28:30 +0000
Received: from CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56]) by CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56%5]) with mapi id 15.20.8606.033; Mon, 7 Apr 2025
 16:28:29 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>
CC: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
Subject: Re: [6.13.6 stable regression?] Nouveau reboot failure in
 r535_gsp_msg_recv()
Thread-Topic: [6.13.6 stable regression?] Nouveau reboot failure in
 r535_gsp_msg_recv()
Thread-Index: AQHbp9G0LmhXfQe7vUujDTTQzzqtibOYZIwA
Date: Mon, 7 Apr 2025 16:28:29 +0000
Message-ID: <71e3db014ae5bf84048313197ec08abb271ce757.camel@nvidia.com>
References: <69997152cb8688a63b50fd8d3f189cc0e2668225.camel@infradead.org>
In-Reply-To: <69997152cb8688a63b50fd8d3f189cc0e2668225.camel@infradead.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR12MB6526:EE_|PH8PR12MB6866:EE_
x-ms-office365-filtering-correlation-id: cc324935-55ca-48cf-db4d-08dd75f13b27
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?R1hlemJlVitFYmhIY0VDWCthb3QvbHpzWnhjY0hETlgrWkZQUE5vU0tBQklm?=
 =?utf-8?B?UUZTbXlLNGdYb2Z6M0Z1bTJqUXdnZ292eDZkMXAvckpXNnhMVFh2K3FVTzcr?=
 =?utf-8?B?Q1J6SGpYK2F0Q1BXWitjT3dSQWRTMTNRQ1J1RGIwNzVMeGxqRU5IVVVFK3pk?=
 =?utf-8?B?U2RLU3B3dHA2cHBxK3NwaFhpYjd0MkZFV01sZDh2V3pXWmNsMGFYd3o4OXE1?=
 =?utf-8?B?WUtHdHNxRXZiQ2JhOGpqZDJ3S0pxbTY5YlcyL3NzMGcwUnIyZms4N2dPNW1n?=
 =?utf-8?B?enVVTDZJeUdqV1FIWGU2YXZUQlRXQW9ISVkwTWZNUVFiWWFlRERJSFVCNGxt?=
 =?utf-8?B?R2ZLWUpNbnJnc3FFQk1EcTRtMEFCaHpaY1VmR0luTDdVU0pmcU5xUzlIczhh?=
 =?utf-8?B?U1MzT2xhdWplamxuclMva05EUG5vNHVlcy9yTm5XeFVqZ2ZZQ0pJSzdDK3ZB?=
 =?utf-8?B?Qm1DTklHVGRPZDJLNDNYZWRVNktZMGZuWERnbXZVVkVXR1E0M29DdC9uUmV5?=
 =?utf-8?B?RUkrTDRnM1p3SnFqa0hPUGxOQmd3NXpWaHplWlpJTVJjZzF1bEJjY3NSYStu?=
 =?utf-8?B?ODMvbldGVEMzbnlVUlE5QnVlZXRUTHlXcEwwM3FpSlNRaFRSMWI2eUpObFRt?=
 =?utf-8?B?OHdJOEpNcVRaTk1vTnk0N1ZWdUJXNjhESy9VVFFod2lwRGdURlZnRjBPWGN2?=
 =?utf-8?B?UWlYdG5NdlNjYjBNMEZkUnRJT1FGVzY1eHUrdG9TU3ZKWk1Ra2ZFeFBSY2lG?=
 =?utf-8?B?cXBFV2NOMjBJYU51N3QvdlR0cDQrekFOMkMrMWg1WmNkbnVlZXd0VCtBQXF3?=
 =?utf-8?B?V1JhcXhST1doZ09HODNGa1I3dzNZMUFXdmRnSkpjMlpGckdWTFovYkEwY3pl?=
 =?utf-8?B?TkZPS3F1bVNiOHJTb1k0OXZ5bUtIZjcrbDNwYUdXQVRvVytTRVh4Y001dDJY?=
 =?utf-8?B?UkVIbVNHK2cvM1M1ZWFDcWVEOHhXczRMOGg0WFlPNnVIQ0dtUUV3QjErT1g4?=
 =?utf-8?B?dUVMbDBaYmMxQUErY3h5SkRFMkJvZDI2c3hLU21qTUJxc0dLZzlEK0xubThS?=
 =?utf-8?B?RzY0ZEVGU21paGlsVGZ3bEZ0ZmVxcXRyd1ZCZWdRVWFQKzU5K0ZXMUxzbStD?=
 =?utf-8?B?UHkzWDg1bTFPUTN4QW0yWm1QWXplR3lsVmxDdERJTFh6NjFVMVcvRWNSNkxE?=
 =?utf-8?B?MDBQS041WlhsczNmN25qL1VDNyswa0VjWWxkTGp1cENTTlk4MDJtK1Vuc1BK?=
 =?utf-8?B?cjJVUjM2MnN1MUpBSmZYYzlyeWxreDl1OHgxN2RBTUs4eEZKeHFwblFsZVho?=
 =?utf-8?B?Y2ptK0dGb3RoY2xSWW5uOHZkVk5jZlYyRTJJdGtqODRmN20vYkl1eE9rd09t?=
 =?utf-8?B?S2l1OWNHODVqb1d2eWZNbVBKbno0d01GYWRZdDFiYmZDZXhCdEhHeGExSmxp?=
 =?utf-8?B?R0xqZmJPc08yMC9CSlFiQTdEVlRPOFZZbEN0R3k1clVlblpQOThBdUJvamZ1?=
 =?utf-8?B?T0xhTEM4SFlUNWhqQ1dqRUhsMUo0V2EyWnhpeEhlUmZMRDJvYmJTWUx1T0pN?=
 =?utf-8?B?NWpTanpBRnpQWHpXQzJCTjlKa0ZLL1BJaVlPL2xjTXB3RXMxVEx2Y1NhRzlZ?=
 =?utf-8?B?UTZmdlE1NDNENmM1RGhGRkkyTG1QcVY0Y3IxNW1hNE5GVkxocjNqWkpRZy82?=
 =?utf-8?B?Rmc3SytTaTBmNHc0YUpCQUoxdGZVd2doSGxURnNmSEJ4WlpjdlZiSGF1OGlC?=
 =?utf-8?B?NFVQQTY1bXJMVCtvVEtMaVlkTDFIeTFnVG51aHMrMTBnUFZNb2h1M0EzMnl0?=
 =?utf-8?B?c3hybVE1Zm5pOXlOeHg5L05INEhMaTREOXJqaElSWGZOVi9aUTdjRVNtTVo5?=
 =?utf-8?B?bXpmYUNmUVBmRUNRaHlnWFcrQzBQejlGYXBSVStHMklubHo3R3FucU5LSm5w?=
 =?utf-8?Q?s2kuA+3bHoYMugtxc26zPXsf8xsvAUgt?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR12MB6526.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?V1ZQS0Z2elN6WjYrQjI2M1RrbDVTTGk1ZXdTc0hsdUhYMkxPZ2gxN1dFQ3J4?=
 =?utf-8?B?VHFGc1NpZ3QvKzVTM1Q4dWlucVh6dUtWZlpValdOU3NBSjVLNnpmcXpXYVNR?=
 =?utf-8?B?dmZuMUpKUW9XTWJxUzdTTmpPM1N4MlZLWktFdkc1cVV5VmFWY2FlVjIxWTZ4?=
 =?utf-8?B?Si9ZREV4blJ3bWg0VTc1RGsrN2t1UU9Bb2RCRlF0citTb3p5YURpTXV3RElw?=
 =?utf-8?B?U080ZW5YZEFwTTRaS1hZcytqdXVuREgwM3dBNGUrTVhBK29naTl1OE9RNHFy?=
 =?utf-8?B?b3MzKzRwUUQ1SFY4cVZ2dTBNek1rRGxNRHRmUVF4RDc4bm5TemQ5NFFic3Nt?=
 =?utf-8?B?QjFyQjBBTG4wRUlFYldaNFZzR1RPM1QrZXNNWlRBZDFvNkErWnlFemQwbjNq?=
 =?utf-8?B?dXkwTmlla21aMFJqa1p4clBPQXVPK0x1Wld3d05iNXRDeXVRWmJZNUZaUFNI?=
 =?utf-8?B?VmpiZllldnZhUnBnZVJXc0RocEk4UU9MQ3NGNG1oS0ZNaHZZQkVCcVl1cWE3?=
 =?utf-8?B?TTBjNm4yRlBwRlF6T1kvczJEbXM0ZFBRV0RXS1EyWk52aFdMbDZkaDJXaW0v?=
 =?utf-8?B?ckVJWmVrdHIrVWxuZ2Y5aXJpcWVjV1dXOHMzTUwyU0d6Yk1nN3B5aFQxcXUz?=
 =?utf-8?B?R3lPYWdQcDBqa1oyemtwOWlTSmc3OFFsVG1BK243SGJ0NlZZMDJJV3pYaHFU?=
 =?utf-8?B?U3Q3WmZ4MHlMa3paNGYxeFRYRmZCSDdsbnhnaGlsaG90bUdlTDJwV3htOUk2?=
 =?utf-8?B?RmJvQnQ4YkdnQy9VYkxxRkJ4UVl5dDZzV28rQkJxR0YwTVBaeUp5NTcxSmJJ?=
 =?utf-8?B?S1grZlJQd25ZWHFhMGtqeUdDc2NrMTRTUnRUQUNaSTNkVitOcUVRNG4vMHJw?=
 =?utf-8?B?b2kwSnByNE82d1NKTHlvUXl5MytjcnhqR2FJSEJaQkVMUXV1cWdSVEVhSDN3?=
 =?utf-8?B?RHk0M2ViK2NBZ0VleU5WMlh5OXlacS9tY0U1bS9VODBySFNTWXlFY2FmcnlW?=
 =?utf-8?B?NjBQMklqSythR2k2dVVlU0IyWmpOUWV5RVlXNG55YUp2VVpac0VtZEtsaW94?=
 =?utf-8?B?d0s5SnpBQ09WVDBzSjkrM3BKWGY0dUt6V1VFcExlVWJPdXI2WVJXWnlyL1ho?=
 =?utf-8?B?bmwrVXQzL0x2MXBZb1B5b2Z4UEd3UGFIbnBBcVJLditLT1N6bWdnMEVkR2Uw?=
 =?utf-8?B?R0ZOb0tjTWEyT0RLSitjQjRvQVN4UHl3c1R6ZUptR0pUUHFKWi9lTHVaamlh?=
 =?utf-8?B?Y2tOeEZzTVQrdWJDZHduRVNBa0h2dDl1YUJzSHdsVmRJR2dnUzlhTzI2b29B?=
 =?utf-8?B?UC8vZllCRzFQNE8wMnZZanR4WlBKSTVBVHRvdDF1dVVFV1NUdkhKL084TW82?=
 =?utf-8?B?T1ZzNkFHdlRWMzRiZGw4Q0xBTmpTK3RqL3diQmdQczB1QlRPOXAvNnBNQVlo?=
 =?utf-8?B?SjdRVXFIYndqUWdjUUFXdmUxc1pPS3dGaDNXbExEeTh5R0ZoZlV2TjNxYktR?=
 =?utf-8?B?bndBaHNpQmthQUR5aVZ2TmtvRzkvR2lpZlppbEpVUXZxUitldERxejZZb0FS?=
 =?utf-8?B?YVVxWEJKQyszS21tK1pNSlIxc0syRXpCNHN2L3NRckJNbHJYRDNVSE9LbFM3?=
 =?utf-8?B?VGFKMUdtTzE1amdYUzdENCs5VUlneThHR2IwZEZHOG5jRWlCN0s0N3BQUndR?=
 =?utf-8?B?QmllYmUvelNSeEp4RUFJRTlHazNpQWV0SWNRMjFXYWlseHBCMWlrZTkxYWI4?=
 =?utf-8?B?aGJMMEtCaFRnUFhPcmc5bFV6MU4rR0ltMU85UVorTCt4bmc1Rnd4U3k1aUo3?=
 =?utf-8?B?QmVabytTUzdkb1RVU2QzMWJEeEZNdlFDK0x0ZkhqKyttYmMreTk4K3FEY2dD?=
 =?utf-8?B?M2hDQzk3ODFiYjQ0eUk0ZWMvQlJlQjNZRVZERVdiV3drMjB5RVRlVEVvb1Ru?=
 =?utf-8?B?cWtzSkNWVm1iakZELzVhek1ocWVLZ3M2dmpVNWQ1ekxsK1dUcEJxZDNlQ2xs?=
 =?utf-8?B?OUgySmwxaE9oMVlYZE1rcUQyREFjS0x1Ynl4TkNKY1JXN2pPbFNkZFM0OFZY?=
 =?utf-8?B?bzN5NjNpSTY1OFA1dWxhY0x4RXRCZ0JLOGVTTlU3YUd4NmdBRWErZENDaGJM?=
 =?utf-8?Q?vuxl2intmziAxGqTSAOlDXeXH?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1A83690E3C7B0A43A1939A21C02C79D7@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6526.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc324935-55ca-48cf-db4d-08dd75f13b27
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Apr 2025 16:28:29.6097 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9mG8LBBN3c9y8MLDuqYL1h/zlfSp8xId5SpDCeYPJ2ITP6TMj85WaMbvfghPQwjGuSEzR4QKwZVI+QrpBP0HLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6866
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

T24gTW9uLCAyMDI1LTA0LTA3IGF0IDE2OjI4ICswMTAwLCBEYXZpZCBXb29kaG91c2Ugd3JvdGU6
DQo+IFs2MDg1OTMuNTcyODc0MyBDUFU6IDE1IFVJRDogNjI2NjQwNjE0IFBJRDogMTc1MjkgQ29t
bTogV2ViS2l0V2ViUHJvY2VzDQo+IFRhaW50DQo+IFs2MDg1OTMuNTc2MDYyXSBUYWludGVkOiBb
V109V0FSTg0KDQpXaGF0IGRvZXMgdGhpcyBtZWFuPyAgDQoNCj4gQzYwODU5My41NzkyMzVdIEhh
cmR3YXJlIG5hbWU6IExFTk9WTyAyMUZWUzE2VjA4LzIxRlZTMTZWODAsIEJJT1MgTjNaRVQ0NVcN
Cj4gKDEuDQo+IFs2MDg1OTMuNTgyNDQxXSBSSVA6IDAwMTA6cjUzNV9nc3BfbXNncV93YWl0KzB4
MWM0LzB4MWYwIFtub3V2ZWF1XQ0KDQpDYW4geW91IGFkZCBhIGJ1bmNoIG9mIHByaW50a3MgdG8g
cjUzNV9nc3BfbXNncV93YWl0KCkgdG8gaGVscCBuYXJyb3cgZG93bg0Kd2hpY2ggc3BlY2lmaWMg
V0FSTiB0aGlzIGlzPyAgT3IgbWF5YmUgdXNlIGFkZHIybGluZT8NCg0KDQo=
