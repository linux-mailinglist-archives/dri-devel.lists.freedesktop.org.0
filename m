Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D58D450BCB1
	for <lists+dri-devel@lfdr.de>; Fri, 22 Apr 2022 18:13:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACC5210E38F;
	Fri, 22 Apr 2022 16:13:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2069.outbound.protection.outlook.com [40.107.223.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E4BC10E38F
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Apr 2022 16:13:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q4EaB38PobADvIfAovhwhnPM6NUUYPYFhhjhM3sFA6fD64Y1GOlqt+2UgGoYzgg3L9IGyGklopZX67HYw3NKQ00wWMuW2BaU6nF/R+rZyAmCRzyf6IV4BOIrFvVZ6jqfjTK6VnQxllWPP0GWNhqOjZay2d1Wk9BIP4H+Lzy3UGGpd+JcxO5JGxF9hDv6tgHEzlaZ5imXb3zy3mQZgqj9NCVm8kqQTqB0UMKLaQJaXN+BTqxEedZOxvxJ6V+no9uDUNFvPXU204HgZMb0rleeozKmi5ujw2SlXEEBgWwQVK/k1EWEDOqz6YQWl3ArkARYujnl0id7DteIBYTnjxtqcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rDUhXGCPU7gEX+8mWpGv3mflHna5UfYaZuqVh8uYTps=;
 b=VAktTaUBB9vcOc2dRSlw0mzGuVPCqj9+KKMfz4gIGROA9vkdg2wN/BVBe1BnyZjycLY5THxeYtFiwjXUp0vByQwE3qyM7JmwYcW/LCGkRfDaKouc4URJcHHObC+IW9sGsfB9T0eexBaMLckrA/68/eb13VKqMS14p/m9Sa9EKXTxoddO3FkIRUm6V8Y/sWScz+S1/xzjgVNkTRjYZnx0Z9wfzKFanPGY+c0JF6SAMa3tiH6fmXiz+qR10UHoA+YNsPEc95JB08TDXvf/Vq1BrXH70M3vOfLpcba6r2/nAgdjv/MejdLMXS8HemtOkTSvCAxpo795ToXS0hI+5nXrYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rDUhXGCPU7gEX+8mWpGv3mflHna5UfYaZuqVh8uYTps=;
 b=qAsgCuY8GPLPLC6WS/9UMhvkW1UiyzL4foJ2GZmcLZ/HdYjrPFr5R5LM1cE86euyfHEpZK8mwTpul+PBQdP2yG/YeCLqVUPEgKjoKbqK7+0MN5VHejpdcgOWHzB3OQfAa5ktmG9319OOLpQS4vNF4wtmJSyQWQuKHOjWODRQT4c=
Received: from BN8PR05MB6611.namprd05.prod.outlook.com (2603:10b6:408:57::15)
 by MN2PR05MB6990.namprd05.prod.outlook.com (2603:10b6:208:193::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.6; Fri, 22 Apr
 2022 16:13:12 +0000
Received: from BN8PR05MB6611.namprd05.prod.outlook.com
 ([fe80::2cee:3759:958:cf21]) by BN8PR05MB6611.namprd05.prod.outlook.com
 ([fe80::2cee:3759:958:cf21%7]) with mapi id 15.20.5206.006; Fri, 22 Apr 2022
 16:13:12 +0000
From: Zack Rusin <zackr@vmware.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>,
 "ckoenig.leichtzumerken@gmail.com" <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH] drm/vmwgfx: reserve fence slots on new resources
Thread-Topic: [PATCH] drm/vmwgfx: reserve fence slots on new resources
Thread-Index: AQHYViopoJI3pYtvgUm0cEioAfgLOKz7qGCAgABzBIA=
Date: Fri, 22 Apr 2022 16:13:11 +0000
Message-ID: <701da185ea77cd84fed44b49d60f30a7750f955e.camel@vmware.com>
References: <20220422092002.32427-1-christian.koenig@amd.com>
 <2dda3fcb-6edf-3f9e-bfd7-34272eec55e1@amd.com>
In-Reply-To: <2dda3fcb-6edf-3f9e-bfd7-34272eec55e1@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.4-1ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vmware.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 464f208c-c2f3-4c90-f79d-08da247affb3
x-ms-traffictypediagnostic: MN2PR05MB6990:EE_
x-ld-processed: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0,ExtAddr
x-ms-exchange-atpmessageproperties: SA|SL
x-microsoft-antispam-prvs: <MN2PR05MB699024772A35CC5B90C96B6DCEF79@MN2PR05MB6990.namprd05.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HPGei+ajFML8Uzu8A3Ky1mEnXRssA7ZDSQrBN9roq9Qw2TGfg17/1D3IVdR1Mi2ly6S/BPTISZy+6f7Gviq4wj9ElWRf5KtpzBTXb28+MxuDtg0P8oVHN1G6P9OTKB7+Qq6Sx6s3E6s7f1iEc3khtSnzBbdhoUSt5BM7tUpihw2TOX7GpXVCSX11r/SIPoYADquANF+QFyib0WPZCEXU3PpvXXT+Vg2DfqyX0tpGnz1aV7+rUTCvol9KkLY8Gwb9uBaHStaA7kFahdyuXJYIF6oMiYVfVs+633nOgV6VuyN7hi4wfkGVd50RAKgBxgSwjoBJDBXMwS9/46oyE28MlO3ItlrQQJkCLYIzfkA2BTCF+mYiXvX/zYdjAKK4H7Iq9Ka8pDbgGEazrOZSvb2TtqGZcxCpEgzFRGx8k2xnXBL2fnKUclpJhhbTuDruiRg1KmKZ2pJQkNNfOMx8++IzXqCWtNB5EPHEHMABho+dX3QZzibH77cEueNvuFmiB1XTC0dO/k9fTeQqljHuFzwUivhKCYxo9yBoRjk4FbRSVFnJ/7UvY8/2+4sw93nhOIvKAWicfBmVT1LvOCUDIze10WmrlXIqrR4a+1K7u35KTNNOijonmCFQ4TPEtJBw2QbWZJuSQ9t6PoBGo67R7FF74CvEBJUDUMvQ1vsuiEWXTMSvSp+oCAXKgomLgeHkvmbMAED+Y3aenY1euHNsU3HnIk3xX3TbVk1fDfM5wK7eTgIMxy/HT3PyJNoY1y6MgwY5
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR05MB6611.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(86362001)(122000001)(110136005)(8676002)(2616005)(186003)(316002)(38100700002)(38070700005)(8936002)(6486002)(64756008)(66446008)(66476007)(76116006)(36756003)(66556008)(66946007)(4744005)(508600001)(66574015)(5660300002)(6512007)(2906002)(6506007)(91956017)(26005)(71200400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UEZlNnZYUnU2NHJCL1hHSzhMZGdYS01EcWluWXo3NnY3VXRwbXgza3VBQUYr?=
 =?utf-8?B?OStxZElSeUNsSTFhTFErRTA0Y3l1emdEVTJCMkl4QVMwdHZqbExsb2JWNmZX?=
 =?utf-8?B?K1hJbDJEdlVLOFpPTXoxVDY2ZGJMM3piZk1md2lyQmFNOHNpRnJpVjRiRTQy?=
 =?utf-8?B?KytwZU9YVjYveUVoM1dabUN6dnp5T0tubzAvMUJzUjdpTm5SVVU0bXIzMmtP?=
 =?utf-8?B?MjZXQ0VhODk1TlIvOXM5TCtIWTk0K2J3R2poa0tPc0kxTG9xRVpxczRxb2Zz?=
 =?utf-8?B?VVhEdGZyRWlKeHlvN2lza21oWFF3MmlEYWFCOE1tVm9WQk90SzZwT2w1aUY3?=
 =?utf-8?B?bEFFY0FwQndyQTRNUUZBTDB5N2MySW5vMDVGWkhBVXZTUVBiMjJRcEFrRGJO?=
 =?utf-8?B?eGxLRnFRYjJvM1hCTnZWbnRlV1JFWXFSZ1R4aGJ6VFRHeGZMeTF0YXFjOTZk?=
 =?utf-8?B?Q2I3TU9jdW5YekJrY2MzTVI2emhIUFFoTzIyeWZaQVp0OTYxeHM4WnJneUFZ?=
 =?utf-8?B?RFZ5OHFOMC9QNkNrcnpyOFJjbkt5SXZHb1VFTDQ2ZXlNZDFHT1VMYXkrTFlZ?=
 =?utf-8?B?K2ppSmJqV0l1elpoWHMvRWNKbG1jdnl3N2tOaVQ5S3ZUUENzZEN4ZWIxQU53?=
 =?utf-8?B?Y3RxalRWUk9RVVFDbXlpS0R1SExNYkI5dG5EUlQ0SUF6MmtSd0tmM2lJYVNZ?=
 =?utf-8?B?dUZuTW8rNGFVWjAxcjR6MVEwT2FjQnFuc3hyUk4zck1BeXpEQW9rdnJ1UkQ0?=
 =?utf-8?B?MzhUdS9icjhTdmhVR1h0aEdUVjdqaGFLeFc2anlZbitPajZMRVdsaWtFNmFx?=
 =?utf-8?B?eFU5VGRHTW01dXV5Q2IvN0xJVEczaTEyYmVuaDMxZmdsdy9ydWJZOXZXV09H?=
 =?utf-8?B?UEJ5TlFZMGQwbkdEYmJZVUNxU2JjdkRNbUdPR3dzb0gzMkFXcHNXMVRCa0RL?=
 =?utf-8?B?WDNKeUtQQzVXb0JuQW1zdHdwYzJSTjZpalhydDBPSjBmQjBQNm1DZzFvMjFn?=
 =?utf-8?B?aW95Zi8raVhuSWw1Q3JkSzAyR2NJdHRrR3ZFajdUZkd0U1BGSi9FQUJ4Wnph?=
 =?utf-8?B?RHlRZVpDeUhCZ1N2V2JiNCtuUzdpcDFoRVZnejgvVW9PY2YrdWEwd1pCWVdX?=
 =?utf-8?B?TkdTRGpESXVJaEwrNlBhcGd1TWRWOWpIbEtrRFBrVVErSzVtU0NBdkRsUWgx?=
 =?utf-8?B?cUQ0RVcxZFdoTkxFWW9nY3JXZy9ta0NMcWtvb2RWaFNiM3dwdzd1dG1mM280?=
 =?utf-8?B?RHlMREo3b1VZY0VqcWpRRmt6UDh2aUxWSEFiQVpFSzlqNGNCenNSdTFSQnhU?=
 =?utf-8?B?aXdDaTFpbzlrcWtON2dlYXkvNFZxMUtaKzJhS3podUd6RndkTWJacHZCWllN?=
 =?utf-8?B?WEhyU0tPY1hMUjN1aWwxayt0cFdac3BFMlF2eXNsMituSTMzRWljTmRPTEJ6?=
 =?utf-8?B?dkx0eStyRkZ5bjFkYkpnNWRiYnNoakxpQlU0ZzlOdTJuSzd3OFJmRENqdE5N?=
 =?utf-8?B?eFZNRHQwVWdFZUpWRFFFYUtLWDRVZmdWaUh5dndaVUh4UDVVbjBMT1I3Szgz?=
 =?utf-8?B?TDV1UlFTaGcyZDNKYndrbjhrdU5GWCt2d1I1cXM3eG1udG1MeWJqeVpVVVJM?=
 =?utf-8?B?anRtR3ZUbzdsQ3pkb0gzbG95MlZRTUtLS2VNOVVhem5JNEpPeTlxVjUva1dE?=
 =?utf-8?B?dDBEOFQ0TC83VDB4R1RKWnJKWXJRSFk0Ukpsb2w4MVYyQVVzbk5QOEdTSUpk?=
 =?utf-8?B?cFZRUG02QU5oWU1hMTJ6MldZczZ3S0kxZ2VhZWpsZWNjeDVIdmhNREpmUFRZ?=
 =?utf-8?B?R0JDNDdHbk9jV0Z0SWFGM1R3S0xIalI2MU44WU1VVGdpTW96ckFYeTdQbWV5?=
 =?utf-8?B?VHE5cTBGaklkTGdhNXZOUFQzclRQak9DR1JJVHFTYnNCdmcrM04rVVBWa1l4?=
 =?utf-8?B?YWgyYjloZG5Td2FZeENHbVRDZ0VDNEx2QmZ0ZFhLQmdsVndlWGFUV1AvZGYy?=
 =?utf-8?B?S21wcEs4a3BTS0VQbGFqUDBhSzFYcCswMG12VlBhVDdDQzc4bkJsYzc5Znkz?=
 =?utf-8?B?Nlo4TDRBSjgyRzVLSGZPMWdrRlJUQjY3TzBwUXR0Ky9XWU5Qb0JnYVlIN205?=
 =?utf-8?B?eGJBWkJjM1MvT0RYeklyZFhCRC9iUEk5dVQycVo5N0o0bXg0LzdvZENKaitL?=
 =?utf-8?B?bWFnQlplRmRrRzFsc1JEb2hWcCtaejJRbHRnQVZlM3diZTVNbkxJSUxkTVg4?=
 =?utf-8?B?VjJBMDNENDRkMnZhODFRcklydjBNdWs0bVAzcWlTSWQ1VFVaRHJuNkYyd0xD?=
 =?utf-8?B?NEZUc0RoN0U1ZFEvOVE1bk5yU1JPZE5OMnhxeDNJNGtZQzI4RlNPdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E4AC114916A2D9489C0E525019C8B746@namprd05.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN8PR05MB6611.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 464f208c-c2f3-4c90-f79d-08da247affb3
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Apr 2022 16:13:12.0628 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: he0odofbC3pV321RAQOO71fy0niB14rsV3ajF3REPz38oYSv/g/nj0+YoszfRGldb8ZYpF/1Q2gavZv60iT8Aw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR05MB6990
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

T24gRnJpLCAyMDIyLTA0LTIyIGF0IDExOjIxICswMjAwLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3Rl
Og0KPiBBbSAyMi4wNC4yMiB1bSAxMToyMCBzY2hyaWViIENocmlzdGlhbiBLw7ZuaWc6DQo+ID4g
V2hlbiByZXNvdXJjZXMgYXJlIGFsbG9jYXRlZCBkeW5hbWljYWxseSBkdXJpbmcgYW4gSU9DVEwg
d2UgbmVlZCB0bw0KPiA+IG1ha2Ugc3VyZQ0KPiA+IHRoYXQgYSBmZW5jZSBzbG90IGlzIHJlc2Vy
dmVkIHNvIHRoYXQgdGhlIHJlc3VsdGluZyBmZW5jZSBjYW4gYmUNCj4gPiBhZGRlZCBpbiB0aGUN
Cj4gPiBlbmQuDQo+IA0KPiBJIHNob3VsZCBwcm9iYWJseSBhZGQgdGhhdCB0aGlzIGlzIG9ubHkg
Y29tcGlsZSB0ZXN0ZWQuDQo+IA0KPiBaYWNrIHlvdSBzaG91bGQgcHJvYmFibHkgZ2l2ZSBpdCBh
IHRyeSBmb3IgeW91ciBpc3N1ZS4NCg0KSSB0aGluayB3ZSdyZSBvbiB0aGUgcmlnaHQgdHJhY2sg
YnV0IGNvdGFibGVzIGFyZSB0aGUgb25seSBvYmplY3RzIHRoYXQNCmNyZWF0ZSBhIGJvIGluIHRo
ZSBjcmVhdGUgY2FsbGJhY2sgc28gd2UgZW5kdXAgZG91YmxlIHJlc2VydmluZyBhbGwgdGhlDQpv
dGhlciBiYWNrdXAgb2JqZWN0cy4gSWYgeW91IGRvbid0IG1pbmQgSSdkIHByZWZlciB0byBtb3Zl
IHRoZSBjb2RlIHRvDQpsb2NhbGl6ZSB0aGUgcmVzZXJ2YXRpb24gdG8gdGhlIHByb2JsZW1hdGlj
IHNwb3QuIEknbGwgc2VuZCBpdCBpbiBhIHNlYw0KKDZkMGZkZjI3ZTk4YSAoImRybS92bXdnZng6
IFJlc2VydmUgZmVuY2Ugc2xvdHMgb24gYnVmZmVyIG9iamVjdHMgaW4NCmNvdGFibGVzIikgbGV0
IG1lIGtub3cgaWYgSSBjYW4gYWRkIGEgQ28tZGV2ZWxvcGVkLWJ5OsKgQ2hyaXN0aWFuIEvDtm5p
Zw0KPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4gdGFnIHRvIGl0Lg0KDQp6DQo=
