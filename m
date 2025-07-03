Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBCB5AF8297
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jul 2025 23:26:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4190E10E8F2;
	Thu,  3 Jul 2025 21:26:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Nrgm9vf/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2088.outbound.protection.outlook.com [40.107.100.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4950510E8F2;
 Thu,  3 Jul 2025 21:26:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Phj6zIwrU0jp/ot4dAo4pso0xJlNzRyaaI6zFuw+ZzuEzi5CuggXi5UDjws6Yd2qLp9Jht87jcABWLpo2uzY11O5qIpm2UJzUg0ZbxGc2mO0pR79/JUvU7B1/oJHKdjIDimLaG6OBTyFCVsia6nQNnf/Brcv7nN7+uTJylT1N4cSgWOFQNIs0DMAlKA2CAIho7sWUvt2RsUbGUAMHUjdfG9MV0+9AKO6HKxpbzgvRCNqyd0sn5aaO7bFtZYdpb4hBpLgNOskxxn6L2RB36tt+CafUbsQ03a/RdcvJGK05+G8LFf43KQ6YZVdS0ungIFptuw+uOxoHVB0aU/NeALMWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9XL2dzyOQNE1u4pidVT/VgQAfNVrSuREaj2WR6N2g5g=;
 b=aChoTaVNwnd63DhArv6MEGeqVgGGxpHsWT4XUakj+QQMHjah6skgSi802Hmu/83uVg0xg3MjZR9+d5aZe0kip2uzJJG9ss/eCChgV50uRCcQ6M1NT1QMoadwosaWPQtPo5u6PI2EBqbl3FhmXkXbR3Ru+jVwBLFKvHTgHeKt7Qm9FmgwjSzoP1d5dabSlk1SMoFh/cYV1WJpy+MT987BXcGrLhs8eQUbJZvckCAzm1vB8M5UBVrSsytHJkR6N5G8W9kIrlnOrW+a6D1U+v5XiDCiD6DKXYnHNLQy51COJNcUKMSxhoLDUFW5cEgJDa8BYKBUsIwTkw+lNBf+n06/EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9XL2dzyOQNE1u4pidVT/VgQAfNVrSuREaj2WR6N2g5g=;
 b=Nrgm9vf/ZaMxgXvGaMTgQBjTG+qQ+Yjg5e9rwNpcNZhJKaU3k8SR0lDwTqH4P56KNXcRMNrJualYN8DuZHRl6KhKzIZ3m/HN/iE3Y4Dl3rOiTbcw6m3hPJTez3NDM2GNAz44nRe1USSJ6ZDmNMrLEeRx/zwjAiL6MN70lb+ZluFV124jvC9o58Eacr96AO19bdtB4RbKHeuYe/HfUR35AoP7pwcgIHP+uTjHvg3uDdZn42r1VV8IgDAyXaeS+7TKXxT+KfkVeQdFvbabTzlwneSS3/nHAKhcBRrF4dmnFU4656jtVA+xkSpLpDsQ3acaf2APLjQrNRteZj5T/4Fc4A==
Received: from CY5PR12MB6526.namprd12.prod.outlook.com (2603:10b6:930:31::20)
 by SN7PR12MB7451.namprd12.prod.outlook.com (2603:10b6:806:29b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Thu, 3 Jul
 2025 21:26:07 +0000
Received: from CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56]) by CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56%5]) with mapi id 15.20.8901.018; Thu, 3 Jul 2025
 21:26:07 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "dev@aaront.org" <dev@aaront.org>, "lyude@redhat.com" <lyude@redhat.com>,
 "dakr@kernel.org" <dakr@kernel.org>, "airlied@gmail.com" <airlied@gmail.com>, 
 "simona@ffwll.ch" <simona@ffwll.ch>
CC: "stable@vger.kernel.org" <stable@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/nouveau: Do not fail module init on debugfs errors
Thread-Topic: [PATCH] drm/nouveau: Do not fail module init on debugfs errors
Thread-Index: AQHb7GBFJS/Gmv+DQUSsLMK76N/EbrQg6WyA
Date: Thu, 3 Jul 2025 21:26:07 +0000
Message-ID: <d87acf2378c5c983982591ef9b9a3a636d707922.camel@nvidia.com>
References: <20250703211949.9916-1-dev@aaront.org>
In-Reply-To: <20250703211949.9916-1-dev@aaront.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR12MB6526:EE_|SN7PR12MB7451:EE_
x-ms-office365-filtering-correlation-id: 0fbfd325-46d7-47a1-01c7-08ddba783933
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?S2ZZeHo5VldpalpjUUFrVzdVWjhtY0Z4NzRKS21FZ0FzRUowWGl5TE5Ma3px?=
 =?utf-8?B?cjN4QjcrYTcydy9qeUJyK3NWQUVFdkk4aG5KcWRDREdZVEpLWSsvbVB1QTlK?=
 =?utf-8?B?a1ZHanVEbkZVYlV2ZHJBQWdnbWRYdklldnBpdFlKbUhiTWFqeVU1UURrUDNt?=
 =?utf-8?B?TlMvbHNhMFdUU3FmSGc2SmVKSGdkaS9yM3hrUFl2K1RraHhGbDZxY0JQb0hV?=
 =?utf-8?B?bEFzMnpBbnlxTFpxOTBpWUxwY2FJd0NSdnRUaFFvdEtSbmFRR3BFcFVJN2xs?=
 =?utf-8?B?YXVSU1M2V2txQnlLQ3VGbnBEMG9GMGt0SVJyUSt2cTB2R01ZeUswblRuUGdr?=
 =?utf-8?B?cElZMUhiWm9nZlJLTzNPazhBc1RuRzJ0Rld6L0xvbEZnYnhReDRpbG05OGxr?=
 =?utf-8?B?S2dOTmlRMm1xakdrOFVyaXJ1eUpsc2tRR1J0U01QbDlaWjZoMERadmNRTi9C?=
 =?utf-8?B?Nm5HS0p0V0Q5UlcwWWU3YUEwbUsvSXNDa21FTnBrbzhKZWp5djBUUTNvSndy?=
 =?utf-8?B?S2tXamY1VFpSVlJ4Qi9oeWJnczRZV3FNcWRUWFhONmpwRTV5WG9VYTZLYkRW?=
 =?utf-8?B?cUFlRzkxMG8rM1I1VW1QZkhUS0R4SHp2bjlCL2M0T21zLzZjdm5pS1ZvZ0p3?=
 =?utf-8?B?TVhFTGZEZ2w5TkJhbUxoU29aTFcyVE1tQzhvMXE1azZKbHhla2wvU3AxOWFR?=
 =?utf-8?B?T0V2TVRacmYvVjhXS2ErV2QyMlRRYkMxZG1Kc1NVK3dPR0lWTHpnbStoeWh1?=
 =?utf-8?B?ZUEzeVVqRWlyNnFSbW1RaVRBOGgxNEdlSjdsYmhqNGJjbjRKSjNPY2NzaEY2?=
 =?utf-8?B?ZDJ3Rk9KdjFRTHJoNlJ3ZDVPLzJ2c1g4Z0dhQU5lbENWWkVzcWdzY3lweDEw?=
 =?utf-8?B?Mis2NTQrU2lhelU1dm5TUFZjUnVBNTdVTjFLS05ETWg4ZDR0MDI1R0dzWnND?=
 =?utf-8?B?L1BXZlBvS2RweDEvNmJ6VW5DSXc5S2NNWFc2bGpIWVJvKzJEdlA2eStZSzZR?=
 =?utf-8?B?VDJ2WE5ZbHh3cUxjM2FVbE12ZTljM3lCaENnOHVQc3VvUGNwWUYyeTFnTDkv?=
 =?utf-8?B?dEtRNHEzeWE5bUJMaStYTVY5cE5RNkNMRWk5WTBDY0FNL2pzSnppN3Ryamwv?=
 =?utf-8?B?MTR1WlNCaXZjQzJFRStHcUdONzJscXFhWkZ3NVFRUVdSaXRmZmNXSGpRTGVz?=
 =?utf-8?B?dzFwR0FIbXAzUEdzVWdSbEtBelA5NzFtRnp6R05jVExkc29HbWdvN2Y5Mmlp?=
 =?utf-8?B?L1U4SUJZMFV6V1RKSDV2bXl3UnVjakpmc2xKZWlkSEtoNUNCaDhDYTd5TEp3?=
 =?utf-8?B?azRneDl3aERnZWtPWTNCTnlkU2RRRXVFeGhQSXp5VmhPQ3k4RXNFUXZqMm95?=
 =?utf-8?B?SkR4cnBoK3gyM09IdEJUZm9Ea3VlNHZpK1oxNHVkV2kyMDV5YVRDdjBIMVNW?=
 =?utf-8?B?c0pGekhhT1ZYUEwwaDVFZC9GajFnd0dMNFUyNi9RbEY2Rm5BQTJ0eVZxWjgz?=
 =?utf-8?B?QU5XTlE0MEVkejRzZXNNZkhvcVd6VkcremJxVlF1cDYrMkZJaEhqTFM3Yzk5?=
 =?utf-8?B?OW5UcDZPQ2pRWmdKOUpBdmVVcmg2Zk9MZzNRVUc0SkJsaGFURHhwZUNHdDlr?=
 =?utf-8?B?SE92dU0reUE1aFlKclBaZkpna2VJWDMvaTE4QktWQll6RDFLc29ETXlYV2Rw?=
 =?utf-8?B?U1lGV3FmdzUvWHlFWURnckJabFpCb09GRTFtcExqdDRuYlZ5eWhKb0tJbmYy?=
 =?utf-8?B?RzVZWFZKaEhSVmtZT3ViV0dPRUdxWllmOTVqNHdpSUtnbm56bDVQV1JVcDFB?=
 =?utf-8?B?aVZkSlNjMTdwSUFnT3U2dTc5OG8wSHRiTFJQV1ZXMVdMWnp6ZmtQSHloYmhP?=
 =?utf-8?B?VTRudW9wOTJTTHhtbnBLWnBHeW9JeVlCZC9aM3pJTWE0cURiTWxCdVkzc0VI?=
 =?utf-8?B?VUVMOFdxK1lNOTdtcFoweVBhcEZjY3NpeCtXVVR3cDQ5NGExNTh1bUVuMlRk?=
 =?utf-8?B?bFU0NDNvNUNnPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR12MB6526.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Qnl2SUI4KzFQUmNaNmxDYzNnQ1ZrOFk5bDRWV2pzaVBtb01uNkZZbVNxQ3d4?=
 =?utf-8?B?RXZ1U28vMnUwNnA2VTAvRnMxYjlDdHNpN1EzcG5mZEh3dlhIZTkvcjh5YzY1?=
 =?utf-8?B?QUY2YkhOR1dHM2hqVXkyNnIxUU5EbjM4bW9ycW1ndkdvRHhhdU9SSDNSdFVj?=
 =?utf-8?B?YXBCV2ZxYVRlWXJ3U0V2OHIxZDR2aDZKK1JjNFlybTVtVkVtQUhNL01DNHB5?=
 =?utf-8?B?R0pERnpCSXlUdzhhcnFTeE5VZXJjRXdSWjVQbWlNaHQ1N1VKK3BJQ2lLb1Vn?=
 =?utf-8?B?VFl2K1pZOEduY1ViUDllUDBBODZvNkJoTGk5M01KUHlMN1RYWnk4TEdHMGkz?=
 =?utf-8?B?ZGs0UEpqdTZ1ODdocXBaNmpGSTFTd0ZGK3c5UjBRZmw4bk11L0QzTFltOEd0?=
 =?utf-8?B?OXpxYVZTL1B0TnNMd0MrWHJKaVljYkM0YmRpdkN5aW9rNlJoQjF3aXZpYzdV?=
 =?utf-8?B?Ky9IMklxbHg3R0o4S1FoSThwaEQxcnRacWhVTk5lQ3NVK0JMR0tuZnUzRE5L?=
 =?utf-8?B?MEZLaVFzRUFIdWxiYmdPUVdWZlBOV3JIWElneStOS0ZDcEUyUkoveG1uT1pa?=
 =?utf-8?B?RmtBOHo5THIyZ2tnL29waFpQaUk5bDJRWFlNajRBa1FsMFFBOG5BVVlPdnRP?=
 =?utf-8?B?aXBuNXhHVi9zN0xBWnRQbnBYd0NxZFVVbG1GeXVQdUk1N0tzUG5XU1VXYUE2?=
 =?utf-8?B?YTFIbkRHYmVuSU9NaHpPM3NCaDh1dCtSUWZ1bGxQSU0xUW1pd0FVellMS0dz?=
 =?utf-8?B?NDU4ZzlhMGVGR2x0MG94VDJYbGJpdnR1L1FFVlVWd0xhSjFYaGh0V1c1aXJi?=
 =?utf-8?B?SzV1ekU4TjUvUW1BYWlCeUdDem1sbnQycWlVSC9JTGVBWTErckVWZ2ExaDBh?=
 =?utf-8?B?MjVldDFkWnVzbmlpT1FpYjNoMHQzS09OYnc0L0dGbSt6MWtPMytZZmhmbGVN?=
 =?utf-8?B?SG5kcmtjNC9uOElEenlYNmozdFkvMExrd0dWSzNzRkMwb21TK2MxRkRyR2NE?=
 =?utf-8?B?bTN5cm9KSGdhb05jRXRyWEszM3NIZTFzemNacXhES1Y2YTVVT3k0MXhMZ3hv?=
 =?utf-8?B?cldycnJUUzVTVkNCZEdVSW1LcThFYVFwZklNRkpoN1J5Sm9DVlNsditZdUJH?=
 =?utf-8?B?OWRJc04wT0JEcHFlcVBkSGlCeTRqd0dQVFR0OWRGTkRRdXpzV3dQcEM2aGZY?=
 =?utf-8?B?dG5JVHBBb09KbDNoNjlZMTZHaUUyakRSU1M1TmJHbTBCWU1NUTcwUHlYejU1?=
 =?utf-8?B?c0NuTXhqcnNaMldnSjBrSWtsNzM3S1RsRDMvUkt1aU5MUzFXMWpkYmR4OXk0?=
 =?utf-8?B?Zm1QVHBMMmpURENhL2pNOTRNTk5JYUlsYW5JRlUzMTNYak9hMGhXNmtoTnQ2?=
 =?utf-8?B?S2VtY1dQdHBPZ3ZUS1dlaEdhL3htSGcwcDdDcDFlZFRqaVByN3NGdFlXN3ZD?=
 =?utf-8?B?eW1jeUN6T0tvMi94L0hJRjN2enBWNDNxd1NCNFVRTDM2Y1BrajE4dGNQSnRW?=
 =?utf-8?B?R3JMWmwxazArNzRVdUwzaU1yMlBaa3MwUmQ0dkw4R3EyazJVdkhqdzMxTkth?=
 =?utf-8?B?TEtsS3orV0FIc1RVOGdXd2Q0SGNKQ3F5NUZ6TFlsdjVwUGcyTkR2SlBlNmha?=
 =?utf-8?B?TldheTM1aTNJZW5zL1ZQUnNRdnMwSDJPTk5BVkRjclFQYjh0WmZIMkliS1k4?=
 =?utf-8?B?d0RKcWRwNVlYTXl3VzRlUURoUlV2eDV2QzBkNDRFaU5rck9OL0FMYUdBU3F3?=
 =?utf-8?B?NUtpR3pTcVRaL1hYRHNTbjRpQllieUcyTXh3alZBZXRPc3ZaSC9VcUxHdTJx?=
 =?utf-8?B?ZEcvZWU3UUlYKzVKTW5hREtlMHBJNGM2OU1aUDdMUDRKOXVWWUhZcHdEb3pQ?=
 =?utf-8?B?SnBOWWMwNnl6QkRkSTlvSnp2UHRwUXpTYnFnNE9JSnFFWm5nN1JCbkNKbWZ4?=
 =?utf-8?B?NjhOQ1J6MHNvWk5JNTBJSGY2SzVzcnZNdThYWDBTM3psWGFBa08rV2RiZlZt?=
 =?utf-8?B?SDYzUTM2ZzkwK3dyY2ZvMktVTExyVStBQzhpSHMzaUFQU3J2b2w5b2t0OTVa?=
 =?utf-8?B?RGRnY1JHYTkyTTcwY1BHeVlZdkpTSFMyVGpqaVpRN2NrelBVTmNpcmVhY2JT?=
 =?utf-8?Q?XYoYlN5/GV2205ymcq6NiH0dd?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6B23C58FC2FF004B8CE7451EC914B04A@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6526.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fbfd325-46d7-47a1-01c7-08ddba783933
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2025 21:26:07.4740 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gSohZxCF7A1kMK/OUq5LR2GGK22ofNQDeHVA/suvVlt0TIMJaN4XSy1OgMrCu647kyr1mWKo+0l5E+A8/3QNnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7451
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

T24gVGh1LCAyMDI1LTA3LTAzIGF0IDIxOjE5ICswMDAwLCBBYXJvbiBUaG9tcHNvbiB3cm90ZToN
Cj4gRnJvbTogQWFyb24gVGhvbXBzb24gPGRldkBhYXJvbnQub3JnPg0KPiANCj4gSWYgQ09ORklH
X0RFQlVHX0ZTIGlzIGVuYWJsZWQsIG5vdXZlYXVfZHJtX2luaXQoKSByZXR1cm5zIGFuIGVycm9y
IGlmIGl0DQo+IGZhaWxzIHRvIGNyZWF0ZSB0aGUgIm5vdXZlYXUiIGRpcmVjdG9yeSBpbiBkZWJ1
Z2ZzLiBPbmUgY2FzZSB3aGVyZSB0aGF0DQo+IHdpbGwgaGFwcGVuIGlzIHdoZW4gZGVidWdmcyBh
Y2Nlc3MgaXMgcmVzdHJpY3RlZCBieQ0KPiBDT05GSUdfREVCVUdfRlNfQUxMT1dfTk9ORSBvciBi
eSB0aGUgYm9vdCBwYXJhbWV0ZXIgZGVidWdmcz1vZmYsIHdoaWNoDQo+IGNhdXNlIHRoZSBkZWJ1
Z2ZzIEFQSXMgdG8gcmV0dXJuIC1FUEVSTS4NCj4gDQo+IFNvIGp1c3QgaWdub3JlIGVycm9ycyBm
cm9tIGRlYnVnZnMuIE5vdGUgdGhhdCBub3V2ZWF1X2RlYnVnZnNfcm9vdCBtYXkNCj4gYmUgYW4g
ZXJyb3Igbm93LCBidXQgdGhhdCBpcyBhIHN0YW5kYXJkIHBhdHRlcm4gZm9yIGRlYnVnZnMuIEZy
b20NCj4gaW5jbHVkZS9saW51eC9kZWJ1Z2ZzLmg6DQo+IA0KPiAiTk9URTogaXQncyBleHBlY3Rl
ZCB0aGF0IG1vc3QgY2FsbGVycyBzaG91bGQgX2lnbm9yZV8gdGhlIGVycm9ycw0KPiByZXR1cm5l
ZCBieSB0aGlzIGZ1bmN0aW9uLiBPdGhlciBkZWJ1Z2ZzIGZ1bmN0aW9ucyBoYW5kbGUgdGhlIGZh
Y3QgdGhhdA0KPiB0aGUgImRlbnRyeSIgcGFzc2VkIHRvIHRoZW0gY291bGQgYmUgYW4gZXJyb3Ig
YW5kIHRoZXkgZG9uJ3QgY3Jhc2ggaW4NCj4gdGhhdCBjYXNlLiBEcml2ZXJzIHNob3VsZCBnZW5l
cmFsbHkgd29yayBmaW5lIGV2ZW4gaWYgZGVidWdmcyBmYWlscyB0bw0KPiBpbml0IGFueXdheS4i
DQo+IA0KPiBGaXhlczogOTcxMThhMTgxNmQyICgiZHJtL25vdXZlYXU6IGNyZWF0ZSBtb2R1bGUg
ZGVidWdmcyByb290IikNCg0KT29mLCBzb3JyeSBhYm91dCB0aGF0LiAgSSBzaG91bGQgaGF2ZSBu
b3RpY2VkIHRoaXMgYmVoYXZpb3Igd2hlbiBJIHJldmlld2VkIHRoaXMgcGF0Y2guDQoNCkFja2Vk
LWJ5OiBUaW11ciBUYWJpIDx0dGFiaUBudmlkaWEuY29tPg0KDQo=
