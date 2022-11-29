Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E69963C31A
	for <lists+dri-devel@lfdr.de>; Tue, 29 Nov 2022 15:48:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3780210E095;
	Tue, 29 Nov 2022 14:48:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM4PR02CU001-vft-obe.outbound.protection.outlook.com
 (mail-centralusazon11012001.outbound.protection.outlook.com [52.101.63.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D85E410E095
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Nov 2022 14:47:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nfpI0+nq0Uhn+PvYdHBEc0AiPDueuLAiE4MLe2GdGKWc/5jLPIIinsyEiURrldfBW8gHZKp6cr38icPP88IG9c8UPNwPvt8dpaoSVZokosBVoRFKrtZtpYP3yJWhtVnbYPsO0WD54Ng/rnE29zrHwFKH1eM0mP71gBb9XlTm42aItBatCHCCqjo1F08mSgWKwbjP8BXyNPCbQRV0koNYJ+z34DH9t3D4aXqXZluTknGg78rg9vAnTAH2BEWhTzp7FCDEL9EfbGiLR7k+0og3joyDF428h170OXvwTW41vwjdCexzTXsnbDu6wB9ZrEIxWiBRTNH16bBVV8RGWSyukQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4yv5jByIFgkrz/Np14JLJawbkF+zXYybcmPYWswvXrc=;
 b=VA35Gptzq9DKpIcElCIYiuXk3FP9hD7YBFyeRAvKu8C5rpae9JWisssRiJavLpn4g8rXkqWuZbvOODqQX1CnoiRlDI7tyJrO4sW1PSy1NdwXI8Memwl9s5HOJ3lHPkkRrCrWY2NKTTbOD/obearMx3PDh01Bt5XS/wWtnuvvZatIJXkRVIv2wNnlQCxXJ40GrbbZKHa8Ot+BqpXaXNj+V4U4RGekE9ZjTaBJTjn79kAv+BSY4jSn5Z2kCyN78qGaSoMpwHUuttf9HI8qeGw4cBdBM3DQD5kQk08uQ9GK+C5IJL1KWnV0XzEbKIX+XbjjeoMrclNH74uVS2BXvEk7Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4yv5jByIFgkrz/Np14JLJawbkF+zXYybcmPYWswvXrc=;
 b=di5+ip2MFmKVmTLNmIJkDBZqfjOBChzJza+dcGGFW3S3vGOALuTR3NJtIaogYGq3rc5dugysxq+3o8SBV892Au1yrUpB+hB4Jl1yMDojQFNoVO6uebP9uveukp2rGlhiPBQ0NG3du43QJ7P9Laf6ek/0/WCFGB4lLzrpKK1PsF4=
Received: from CY4PR05MB3047.namprd05.prod.outlook.com (2603:10b6:903:f4::7)
 by IA1PR05MB9550.namprd05.prod.outlook.com (2603:10b6:208:426::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.22; Tue, 29 Nov
 2022 14:47:56 +0000
Received: from CY4PR05MB3047.namprd05.prod.outlook.com
 ([fe80::857a:20fb:49bf:bc3d]) by CY4PR05MB3047.namprd05.prod.outlook.com
 ([fe80::857a:20fb:49bf:bc3d%6]) with mapi id 15.20.5857.023; Tue, 29 Nov 2022
 14:47:56 +0000
From: Zack Rusin <zackr@vmware.com>
To: "daniel@ffwll.ch" <daniel@ffwll.ch>, "set_pte_at@outlook.com"
 <set_pte_at@outlook.com>, "airlied@gmail.com" <airlied@gmail.com>
Subject: Re: [PATCH v3] drm/vmwgfx: Fix race issue calling pin_user_pages
Thread-Topic: [PATCH v3] drm/vmwgfx: Fix race issue calling pin_user_pages
Thread-Index: AQHY9FFO6vcSxwhExEaE92jx8DfNTa5UimyAgAGQEQA=
Date: Tue, 29 Nov 2022 14:47:56 +0000
Message-ID: <977d872916e5954bf408393c2d818394cfc12bee.camel@vmware.com>
References: <TYWP286MB23193621CB443E1E1959A00BCA3E9@TYWP286MB2319.JPNP286.PROD.OUTLOOK.COM>
 <TYCP286MB23230F5BA9B42D637F302B2DCA139@TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM>
In-Reply-To: <TYCP286MB23230F5BA9B42D637F302B2DCA139@TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.0-2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vmware.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY4PR05MB3047:EE_|IA1PR05MB9550:EE_
x-ms-office365-filtering-correlation-id: 60055cd6-320b-4ee7-b286-08dad218b404
x-ld-processed: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 50CiUkq9hVACmh1XOdrqWs0Iw4hd2PHpcV2WDhDW+/tAc9D0vfCNNjrmifQyB/gHjufCkkxdA0Nd8wOKixwdcnneYn4LhCqhoQoP35Q/WwVm51QuU8JZnSEeORWgTQW7fh9EbDhTEk77eGQpqRB0/iTZbV8JD1s7GEtUUUERP9OPDIlI4DXJA2onlTP9CeEQH3ja3Bw1m2D2EhBbpWriviciDEFXF1y7dpsPGxhy/h3/YO59O1rgPAsPdwmdcDzoJIzqMo/P3Taj5K7UB8YzUtfj4zBb89xtqVlTfXnCSMFScprd/n96TozGUoFwz81zum9O4juPd71O+PtiVSrxq/RkOY7lzrqMDHKuCteCDOvNd0iNUAVjaspTeGtre/vCk683ZKbDOQG23bDyZfXWMdcXwWnUhTi4VNJgF0x5XBX4HSlxqKTEzILBtWWE/5g+WB1wGTFjh19iBZSaRGLURNflYu0Lb7nggBDdhhKueuk7biUF6w5uVbpU6zqqLA+EIWWD4vDEGyythBHjK+6fVlzH0tHO3i5mI06og1YInyrHTekjaNzhZ6R5NRqoOxx4bMBLymZ6Fanxis7aVDGLmU6GlcnLwLaMd9aDmjzVcvQYqpSJ7Ngbm1g/sSMbUr7zxe+XbR6OkFCDeAd0Wdn7adJKagbt7TBLetZYQX7RaxZJw5hpFT0ZIPNHi3VRZaftgBztuFhZoOUyf9hVVTfLNFHtD469xfsPig2dSUrgh97nrLnKyGlG5V08O7dJkITJaP6OBiknPvDZBCU1ZFjpdVgXMQM2OYT2JymSP3p1GUveAzEv5qvot2SnG5z53whXG3VmWdR7y7hzouMuwfcgtA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR05MB3047.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(136003)(366004)(376002)(39860400002)(396003)(451199015)(83380400001)(2906002)(186003)(4001150100001)(38070700005)(6486002)(966005)(478600001)(8936002)(5660300002)(26005)(6506007)(36756003)(316002)(6512007)(41300700001)(38100700002)(71200400001)(2616005)(91956017)(45080400002)(86362001)(54906003)(110136005)(122000001)(4326008)(66446008)(8676002)(66556008)(66476007)(64756008)(76116006)(66946007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bG52bVd5UGc0SnZoV3ZDdkUyelBJR1pHcmZFN2kxRExZZHpISk8ra2hLUDF5?=
 =?utf-8?B?MkhrS3JKNGh0OWx5UGxGYmZBWjBQSEQ0bGF4Zzh0aXVxVVNscVUrZ2dzelFJ?=
 =?utf-8?B?MktwRXJmWUo0RVR0M0pJTlNvMTU4SW9hdmVNRFZvUUhoS2RqZEJyUS9zN0RV?=
 =?utf-8?B?dEY2WkNQQmtmTStma2cxQnA0YzlNSm9RdmRvUC9YWjB3K1YwY1l3bTlKNWRJ?=
 =?utf-8?B?SDFxRkVXS1BhdXVYanBOaCtsTENaaDBta0t1dVE0VGROcEVoWG1UWThhRk5Z?=
 =?utf-8?B?eE9YSWZ4MU1LVjQ0R1lRQ2tyWWxvRTNOZkhBQy9CTThBNmZaOVFUTzlPM3lI?=
 =?utf-8?B?YVNYWFM2bEsweEdWYWc5azRpeVFPTHBwbzFhSFNaNnluMG5jNkZBd1h4cDdR?=
 =?utf-8?B?N3NkQmVMb1Q4dlg3cmd0dUtCMm5EMVk4SU9MMUdwR1lQZTUvYURtaTZ0U2lW?=
 =?utf-8?B?UGZwdVplcVdsclM3U1FBS1pISjFqQkpKOGVJZktJenVqNGZ2Nm15QlN3YjBr?=
 =?utf-8?B?elFxaUZIdVphRzhuQU9Qa0tvZERQWUQrRnVFVkR0Z20rQVVwUU9ZZ3BkNzVC?=
 =?utf-8?B?aVhIZTJVSDc0S1pRRHcyNjRUL2tYRTllWE05bTh2ODd4bWR3LzJwd1NwS0pD?=
 =?utf-8?B?NHovZHdTTzZkOXAvY1ViZVlHM1ZwbE9YMmY5eklCRHRvUCtXa1hNNmJGV2po?=
 =?utf-8?B?dS9DeVVrU2dubmdOckdxSjl1QVl1VU1IYi8yeWZsQVA5R3pNWm1VaEpWZTNJ?=
 =?utf-8?B?d05naUxPMUdqU3FaY1VXNnVTeHg1OUNiR1d0NHQ4SGRrYUE5dTV3VExiMUxU?=
 =?utf-8?B?eGJraU1uVkdLK0NnWXlBQUVzS255Z3RFSmNPY3FYUGYxTGs0Z2FXVGJZKzdQ?=
 =?utf-8?B?RUw4NE5iT3c2b1g1UEN5bHlkTzFSSEw4SmNreDB4NmduV2dqRGtrVUNBOEEr?=
 =?utf-8?B?Qkl2RndueER2RjFjQXNlKzVjZmdMZ200SDk0V1ZoeFF4WmFwTmRTMW4zR05L?=
 =?utf-8?B?T1JHaDFKUjVWZ2ljMVBBdEdtYXlKOS9Yc21LU1FCN1hLMVEvbEJxeVF2L0oy?=
 =?utf-8?B?UW9mWUNQdTJxN21VZ2QwY0V0b3UyZEplV2tQTEEyV1pkT3Z6M3RLL1RrUERS?=
 =?utf-8?B?Y2tIekg1YVBITnc0Y014Nmw5cHU0bENqSWt5Y1BtM2Y4Z0hkdUc2YWc0OXVk?=
 =?utf-8?B?YW9ra1N0dENwSldzTkRzdlowUm1ib2pjVXBvbUFYWW1neUpMUW5oN09UOERm?=
 =?utf-8?B?aEhGL05YVFIxTG45cnhuMkJ4RDB0WFhBeTdFb3h6S1dVdVZ0V0FCMjZ2emlV?=
 =?utf-8?B?Z1d2cVhlL3grZmxHdTB4MTFOc1EzU0dWaFJRMnp1MjJTODgzY2J5TkdCVFFr?=
 =?utf-8?B?QlJ1M2NwZDhHbUZCNTJZdFN5UVVGWDNBQ1BkQUdCVGVIVmxwRjZ5bkJHbTRW?=
 =?utf-8?B?Ym9XdEtibkRIR1lRTkVWOVZYQzNmWFpDUlYvWlR5QU5Wc3cvYXFOZG1XcDNp?=
 =?utf-8?B?b1NMQTNuVkJRemtwZmxCeEc4QjJxYXp0WDlHc1hRNGlDcVowRHM0THFIbmJm?=
 =?utf-8?B?RG9BUzZRemZPZGEveW82clo3eG9aYTJXK0xtRDdEUFJGZ05PcUovVkdrbUY1?=
 =?utf-8?B?bHNIK1ZrT0VTaUhtWXFLTUc2OHROeXdGTG54THVMSE1HZ0lmdllPczkxZnBl?=
 =?utf-8?B?cG02RWYyM3A2YUtkWWxPWkJObDFNb1FtemY2emlKOGlrRUU0bERIdlZkVmdq?=
 =?utf-8?B?MjhnVVZRL2tRb0JHVUE2eUZzdWcra0tQcXc3eHRkVnFlalBoKzJIYk9tV0Fr?=
 =?utf-8?B?ZHF2TURVSTJWeUtldFZlTlBpZXdRUnIzeGtpWTFISk5Dczl4SGRRRTBNMWxz?=
 =?utf-8?B?clZsY0pxUTVwdkQ2ci9ySTdYcEpYSnFTZEJxTjhMeVNhZEV2NEVsRFJybUQ2?=
 =?utf-8?B?TUpzRXZzcW1aM3EzSjQ5U1poaEtqMEVZK1RTRFFLN1hBY1NtR2EzK0VCZGpZ?=
 =?utf-8?B?OSt2d211dzhVOEZHWWZJTGNvM0JTVzA1SjFoNVpyaEVLcXpNN05HOUpPV0d4?=
 =?utf-8?B?cEtiMUhRVHZrbzA1UkVKT0JhaUpiYTlHM3dzeXl6TExjSlZ2WFZqbEpQdUZt?=
 =?utf-8?Q?O2Jh5eYrR5udVoziIYzBntD51?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B1413BFFFE6EFB4FAFA6F862D81A3959@namprd05.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR05MB3047.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60055cd6-320b-4ee7-b286-08dad218b404
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Nov 2022 14:47:56.7132 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kUb+EIXtHqc0pC8i5FmwJ2pCAi/YZOePzT4DT46t+VhbU8J35meEuhrHZWec/bZmy/kxl0K9q3KNZWDVOqiv2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR05MB9550
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
Cc: Martin Krastev <krastevm@vmware.com>,
 Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAyMDIyLTExLTI4IGF0IDIyOjU2ICswODAwLCBEYXdlaSBMaSB3cm90ZToNCj4gT24g
V2VkLCBOb3YgMDksIDIwMjIgYXQgMTE6Mzc6MzRQTSArMDgwMCwgRGF3ZWkgTGkgd3JvdGU6DQo+
ID4gcGluX3VzZXJfcGFnZXMoKSBpcyB1bnNhZmUgd2l0aG91dCBwcm90ZWN0aW9uIG9mIG1tYXBf
bG9jaywNCj4gPiBmaXggaXQgYnkgY2FsbGluZyBwaW5fdXNlcl9wYWdlc19mYXN0KCkuDQo+ID4g
DQo+ID4gRml4ZXM6IDdhN2E5MzNlZGQ2YyAoImRybS92bXdnZng6IEludHJvZHVjZSBWTXdhcmUg
bWtzLWd1ZXN0LXN0YXRzIikNCj4gPiBTaWduZWQtb2ZmLWJ5OiBEYXdlaSBMaSA8c2V0X3B0ZV9h
dEBvdXRsb29rLmNvbT4NCj4gPiAtLS0NCj4gPiB2MToNCj4gPiBodHRwczovL25hbTA0LnNhZmVs
aW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0cHMlM0ElMkYlMkZsb3JlLmtlcm5l
bC5vcmclMkZhbGwlMkZUWUNQMjg2TUIyMzIzNUM5QTlGQ0Y4NUMwNDVGOTVFQTdDQTRGOSU0MFRZ
Q1AyODZNQjIzMjMuSlBOUDI4Ni5QUk9ELk9VVExPT0suQ09NJTJGJmFtcDtkYXRhPTA1JTdDMDEl
N0N6YWNrciU0MHZtd2FyZS5jb20lN0M3OTYwZmIxMGY4YjQ0M2UzM2U0NTA4ZGFkMTUwYWYwNCU3
Q2IzOTEzOGNhM2NlZTRiNGFhNGQ2Y2Q4M2Q5ZGQ2MmYwJTdDMCU3QzElN0M2MzgwNTI0NDE3NTk1
MDc1NDElN0NVbmtub3duJTdDVFdGcGJHWnNiM2Q4ZXlKV0lqb2lNQzR3TGpBd01EQWlMQ0pRSWpv
aVYybHVNeklpTENKQlRpSTZJazFoYVd3aUxDSlhWQ0k2TW4wJTNEJTdDMzAwMCU3QyU3QyU3QyZh
bXA7c2RhdGE9TjlqZG5MZlQwa3A5S2lmc3BGeUgyR2ZtQXduSDdOSmRRRTYyNTVVWTVKRSUzRCZh
bXA7cmVzZXJ2ZWQ9MA0KPiA+IA0KPiA+IHYxLT52MjoNCj4gPiBSZWJhc2VkIHRvIGxhdGVzdCB2
bXdnZngvZHJtLW1pc2MtZml4ZXMuDQo+ID4gDQo+ID4gdjItPnYzDQo+ID4gUmVwbGFjZSBwaW5f
dXNlcl9wYWdlcygpIHdpdGggcGluX3VzZXJfcGFnZXNfZmFzdCgpLg0KPiANCj4gR2VudGxlIHBp
bmcNCg0KVGhhbmsgeW91LiBJJ3ZlIGp1c3QgcHVzaGVkIGl0IHRvIGRybS1taXNjLWZpeGVzOg0K
aHR0cHM6Ly9jZ2l0LmZyZWVkZXNrdG9wLm9yZy9kcm0vZHJtLW1pc2MvY29tbWl0Lz9oPWRybS1t
aXNjLWZpeGVzJmlkPWVkMTRkMjI1Y2M3Yzg0MmY2ZDRkNWEzMDA5ZjcxYTQ0ZjU4NTJkMDkNCnNv
IGl0J3MgZ29pbmcgdG8gZmluZCBpdHMgd2F5IHVwc3RyZWFtIHNvb24uDQoNCnoNCg0K
