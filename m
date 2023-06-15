Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 65A07730EE9
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jun 2023 07:59:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7023B10E0DE;
	Thu, 15 Jun 2023 05:59:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0150A10E0DE
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 05:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1686808759; x=1718344759;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=qUY2h/iWJkHFxzmUuNMXh76d8Co0Z92htfJuj6XgUBE=;
 b=EOaHq+4gBZE0DE2kXwFnWQMf9nldNlJA1BNyrdB80w7omVAsAQikd5GE
 fRxuzCZTtW9HO9d5sFsexgRsFcu24/RLQc5vRy5/uUs+VxJXoAgtRg7AK
 PSZrGBHsBWin3kdbDA039K7+DKDIKFbcZntgoExL0tG41HAfJ+LNBmVEc
 YjaJg+Cn4HjYYapI6t5tZke4qF7xI/OY8rdSOBvU88uYI2imXLLRyDemp
 pj4DItBmxEADh3zrJ9lEdsKory5LiQvIm10yW5KXPfR1MW/imFwPwBCME
 tJxwu4gwscXC+mZiiGrJWK2oMmT72tIzgvDAw6SWw7XQNzYF4V+ZpZK8D A==;
X-IronPort-AV: E=Sophos;i="6.00,244,1681196400"; d="scan'208";a="218592980"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 14 Jun 2023 22:59:18 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 14 Jun 2023 22:59:17 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Wed, 14 Jun 2023 22:59:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LhasCKjk+XHgz2LAOGR3WQBRhC+Ik+P0lA/boiDqTx4JdtCwlbdErZ0lhKGV5mYNJReX4TTQxmVOcXQssli+tNIb0oR1O30WHzn0tUSn14I+BmIm4Ds2P3tJHc6nDQ04wMLaSJXkpeV6pRiUvH7+l9IBAso1HuEJxoo56lPmWzn7V9IUbkfg+2E9xRDz1/xnvYq30cKO4dgtGXJaho2eobUCb5HPXHM3v15gDbK4ttMVv8qQhnrs3MI2hb8MHYfFQZHEPTXrDpwib4qfV1+ClzfN8XuJmaXX5To4W3GFmaXSUr494G0i61+rt2QJCnOAOcG24uP7wG5JxaN7mcWXtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qUY2h/iWJkHFxzmUuNMXh76d8Co0Z92htfJuj6XgUBE=;
 b=GYEciXT4yo1EkqXGd7dCylS7AbS448s3F0lz22wdgkzIvtSObGqBoY74COpwjHxE6x74Z8cxjeEO/Kj50pQucJfbDApkDqgTAk2SK0JDty/5t8AnmO8378RKphHgIEVBxGKD6/nedk9Q7bqNYzGWbBn1EUGnJxzjchZ5478Ntm6iNzTjefb9v86IKgFvm8UZoar5+dafJ9dmFavKQ7SWVnIbnHLc52laepYchefekqutiWQKtYhSCd9X2SOg85hfXqZWot9YvsmmwYAE8tqhWUtDJoR+3bkNQHjL5Cb20Jzldai5Lpr8XNK2veCU9MZ6hS9AzW7HRwzV3sGUQjRb9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qUY2h/iWJkHFxzmUuNMXh76d8Co0Z92htfJuj6XgUBE=;
 b=uQtR7aXKIhARkIlXQbYO3osXP3ESHvuMIzfG3AJvBul+8OjlB+7B5ZivyrTA9WNybyBqCxCH9fpCqx+xJ5hK/AuevGGyjBcpqd3nwJ2TkKdNrLYuhphF1qFdCrwjWJ8a7yn/Mb5eSWS2nz2dejmlgImxSKm5dDYDxdubM9hP65M=
Received: from IA1PR11MB6193.namprd11.prod.outlook.com (2603:10b6:208:3eb::19)
 by DM8PR11MB5686.namprd11.prod.outlook.com (2603:10b6:8:21::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.25; Thu, 15 Jun
 2023 05:59:16 +0000
Received: from IA1PR11MB6193.namprd11.prod.outlook.com
 ([fe80::fae1:9490:ead6:1009]) by IA1PR11MB6193.namprd11.prod.outlook.com
 ([fe80::fae1:9490:ead6:1009%4]) with mapi id 15.20.6477.028; Thu, 15 Jun 2023
 05:59:15 +0000
From: <Manikandan.M@microchip.com>
To: <conor@kernel.org>
Subject: Re: [PATCH 6/9] drm: atmel_hlcdc: Add support for XLCDC in atmel LCD
 driver
Thread-Topic: [PATCH 6/9] drm: atmel_hlcdc: Add support for XLCDC in atmel LCD
 driver
Thread-Index: AQHZncWNOljbIHu8BkqtK5cyDirfCa+JCvcAgAJWhYA=
Date: Thu, 15 Jun 2023 05:59:15 +0000
Message-ID: <ea609d62-0b2e-7b1d-112e-01fafa9d0311@microchip.com>
References: <20230613070426.467389-1-manikandan.m@microchip.com>
 <20230613070426.467389-7-manikandan.m@microchip.com>
 <20230613-recant-citadel-a3d3878ced06@spud>
In-Reply-To: <20230613-recant-citadel-a3d3878ced06@spud>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6193:EE_|DM8PR11MB5686:EE_
x-ms-office365-filtering-correlation-id: f5b9ba9a-6e58-4bda-b330-08db6d65a6ad
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OzNRQLNgMwnwC7LGlxpvnrA0grCAZSEKr6DWD7sStpEi4MPvMVznYDYJ9KoJuIP33iz2LlYV2Wg2TE8VAht9utn7bwORmYdqhy+J9xeMdBBtzEWcmvrboy5L4L+yjzEXoxMluziWI8NFfBpkj+oQMo+nfw3HvlLwjMVUQ+RqHf2OATccszVa53OQT7KeR0GkeG/sBClfsbK2DAydbCmeTJvPlxqkEFzEKx3sBzVqktOLeS2XjFo70OaS5bZw95+tbYSLv26aHTeBE/SDc/jk7G566SO2eFp29QS9mZVRMd6CwoO/9J6IeiKzaWhRp7WqzmnJ0stu4UNngeIigKsUdX88CXhuQGn4o2GVyH0/ZO3NEPG9VmmBAJ/lXavJn1Rvl7HdtDm0mwCvdVQZdUyq3+qnNCC0gkCcduzY9A//4yIegzN5TokOQNnVZEURyyPVAtkLLxPRaHPtHVUdFmyJiW1+Ic/kYWnXE4mcScEzs7DwPoqyw+mxAGifTamYCgYLRJheTgmfMzInGPdKv5nJZ1Ljof5WkKkeh/Lc6P4/vIBtZxETIuGcUZllJOd4O+Cl6ue+l8oioFQ2PcCUvBeba5SiKxsmHyPh7R1T9GBp43b8HGrUBj0L7Bpq65bW8m2+bEU0M8KTaIRWEjWgWQPKJw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6193.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(136003)(39860400002)(376002)(396003)(366004)(451199021)(5660300002)(38100700002)(122000001)(2616005)(53546011)(6506007)(83380400001)(186003)(2906002)(6512007)(26005)(7416002)(107886003)(38070700005)(478600001)(66446008)(64756008)(66556008)(6916009)(66946007)(66476007)(316002)(71200400001)(8936002)(6486002)(8676002)(41300700001)(86362001)(31696002)(36756003)(76116006)(91956017)(4326008)(31686004)(54906003)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c3BucE5PZGVuVFdUVE55bjZNK3RrblRSRWp6amk5VVJjd0x4Y0VBZ3NDTDRE?=
 =?utf-8?B?a3REdUEwaURUR3Rpa2graW9XM3djNCtJMVExY1dJV21CQ1pxeUZLclhFanhq?=
 =?utf-8?B?eFQ4MUJ4b3YzbldxQytqMGhLR0VMaG5jV1NjbGx1dExxa0tleHhtM2tRbytu?=
 =?utf-8?B?azVzajZ6VGlQTkFaQzlRNkVscGtCN0tKMUt4NWFRTW5ubnFST2l1VjNEYVZO?=
 =?utf-8?B?VzU4cDg4K1ZUZDJ5dDZWZ0xmblJwb2xSMUJiVEx0SDB6RDNJcjR5VVJWejRI?=
 =?utf-8?B?RHkzUkM3NHFWTHNVSEVRdGFHckJ0RWphY1N3bGxEY01xU3pka01YQ1pySTl4?=
 =?utf-8?B?aXBZa2x4ZzFlMXV3YUFCRk52ZjZoUHh3OStjSS83bm52M3FocEJZc3Nhblo1?=
 =?utf-8?B?R21MOGw3UUIyeTdSazJ1ZjZJZ2pJZkJzOVh4cDYwSDFqd2FOdTFKYTF6eDhv?=
 =?utf-8?B?Mkphc01kOFhkZ2M2N2hoUkRwOHQ0L2RNbTIybW1ua3hZd1I2UnZmalR2Wk9K?=
 =?utf-8?B?UGhUQ3QyRHJUL2xiTTl5dFJxeWM4WGV6L1BtdnR5T3hhc3dFWlVlemVjd21w?=
 =?utf-8?B?ZCtPVnNWcXFRb0twTHhtekFFZEExcDJyY0ZPM2lhL2wvZHhNMVBEL0cxVzU1?=
 =?utf-8?B?dzA3WFdSekhQbmVLYzFLUzFDeWZ4dy9mNEZmMzVSa29ibTh0T0Y2YURyaVhu?=
 =?utf-8?B?QWFTcUZLRkFkT1JKVnB6WUFIOHpsWXBhVkhnT1crU3IycVJQT3NHTU5JSFRl?=
 =?utf-8?B?WnRCUmNtb09yTjdiZUJQSUJhQUJxdkROVW9CSTRBV0pVU2lUbDZsUXNYYS81?=
 =?utf-8?B?N0RyclN0QTVmUEFtUFJGTzNWL2szc0ZLdDdrRjRyb0pBaGVuMHkzc0tiUWlN?=
 =?utf-8?B?OFRpdjA0SFYycG41UnlscXBOd01Yem90ckV6K2xzQi8zV2dvRDBBUUt4R0J6?=
 =?utf-8?B?bEFpMDZEUWFtS0I5MnFFNXBVWWFldVhoQWJybVpBckpjTXhpRXk1MzcrN2Qw?=
 =?utf-8?B?RmJmV2krWTlDYzRFT2V4aWJWZ3BvU0dheFNGTU52bHJpSGZXeGkvNHR5bEtW?=
 =?utf-8?B?NWI5SCtFTGdRNjNBSG55Z2YvVk5EZ3QybUx4S2YwL0dmdFdXbGZiYktOOTVJ?=
 =?utf-8?B?SkpkVE91Sytzd0I4QmdONHozQ21RQmcraGU0QjZXaXVzRUh5QWpZbE84T1pG?=
 =?utf-8?B?anVxMTdqUmd1c3puQkM1NmUwb1IvOU9PQStFTVM5ZnY5V3dqTmRVNGZtZlI3?=
 =?utf-8?B?NkgvZmZQcDRZWjhla0lRRWtxV0thUjRHUmJQS2JpZS9WekVUVHNvaGhoNDRj?=
 =?utf-8?B?Ny9kZEt6UHUyV0JIY2JPRU53Qk9HWkpJRStkRVpvU1V0V0RNMGVSRnY4SjJR?=
 =?utf-8?B?Z2thZ3B6ZTVyNEhiN21XaHRndzVSc3RUUndkWWxCbHEvY0twQVZsNEVZRXd4?=
 =?utf-8?B?UHQ3dEJGR3RKajhPRnRZK205Sk82WXBQdDJ6ZG9wMDc4YU5qS25qNUxTeXBh?=
 =?utf-8?B?dlRTZHNXdEpNcjFRYlgreGFtZ1FEdm5sNXhobVVTbjBvSS9laEpxR2R0VkZP?=
 =?utf-8?B?SUErSmhGOHVyYkFlcTRTYjVUYXZMdmJ6Z2FPNG5ZZHpwL1puYm9FMFJNcVVm?=
 =?utf-8?B?ZnVGR1c2QnRxM0pOaC9kemhGOEZUOVp0RUNRZ2ZyWXZjMzJyUWJLSllTMVZS?=
 =?utf-8?B?UDhweGhoZ1NGR0R5RisxMDFTUHlHblhOcXN6VHAxdDVhMkE2TkdNZmFJUWZa?=
 =?utf-8?B?eGxxTVFVS1JIYlQ0K3ZFM25mYk5ZWFBteTYyWnhZYk1nWUZWS1BMQlpoVGdD?=
 =?utf-8?B?b2xkVTV1Zk1Edm9vTlUwdllhQmxpbUtwRDlpU05WU01Nbk91NUFtajg0enpY?=
 =?utf-8?B?Sys1azNVeUx5bm5VcmxNVVF6ckJiMm1JU2NtamMrajc1Rmp0QVhsaDRmdjlh?=
 =?utf-8?B?bzhVRFJlbnpuVi9QYU9PdHNxeW4zQUxHN3FZY0pkZ2g2ZURnYktQUWg5VUVW?=
 =?utf-8?B?cjZlZHZVTXNCb2U4bm9laUtTcVFucjh0VmIwZGxsbU4rblFkaU0wWnhhM1FJ?=
 =?utf-8?B?L3I5TnZhdWdIQm8ya1RoNkd4V0xSdzhxZXZjcmYveE5YQzdHZUJ0QmtSekZk?=
 =?utf-8?Q?88Y7MO9D/L0M75Ig+iPzIepRq?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9E03265F7A14D642A5E33EE2916C38E4@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6193.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5b9ba9a-6e58-4bda-b330-08db6d65a6ad
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jun 2023 05:59:15.8403 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OTbtxydWNmlJ0fG/SkB3IZ9+4LmU6E4L8NjPRlix1WScZjZCwCFd2OI3Zq7SFj+mN4t4fivcGRA0jDS9ykA9oiZ+uT7I49s32o4HCaaRI6M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR11MB5686
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
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org,
 alexandre.belloni@bootlin.com, Nayabbasha.Sayed@microchip.com,
 Balamanikandan.Gunasundar@microchip.com, lee@kernel.org,
 Nicolas.Ferre@microchip.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Claudiu.Beznea@microchip.com,
 Varshini.Rajendran@microchip.com, Dharma.B@microchip.com, robh+dt@kernel.org,
 Durai.ManickamKR@microchip.com, krzysztof.kozlowski+dt@linaro.org,
 Hari.PrasathGE@microchip.com, sam@ravnborg.org, Balakrishnan.S@microchip.com,
 linux-arm-kernel@lists.infradead.org, bbrezillon@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTMvMDYvMjMgMjM6NDcsIENvbm9yIERvb2xleSB3cm90ZToNCj4gT24gVHVlLCBKdW4gMTMs
IDIwMjMgYXQgMTI6MzQ6MjNQTSArMDUzMCwgTWFuaWthbmRhbiBNdXJhbGlkaGFyYW4gd3JvdGU6
DQo+PiAtIFhMQ0RDIGluIFNBTTlYNyBoYXMgZGlmZmVyZW50IHNldHMgb2YgcmVnaXN0ZXJzIGFu
ZCBhZGRpdGlvbmFsDQo+PiBjb25maWd1cmF0aW9uIGJpdHMgd2hlbiBjb21wYXJlZCB0byBwcmV2
aW91cyBITENEQyBJUC4gUmVhZC93cml0ZQ0KPj4gb3BlcmF0aW9uIG9uIHRoZSBjb250cm9sbGVy
IHJlZ2lzdGVycyBpcyBub3cgc2VwYXJhdGVkIHVzaW5nIHRoZQ0KPj4gWExDREMgc3RhdHVzIGZs
YWcuDQo+PiAJLSBIRU8gc2NhbGluZywgd2luZG93IHJlc2FtcGxpbmcsIEFscGhhIGJsZW5kaW5n
LCBZVVYtdG8tUkdCDQo+PiBjb252ZXJzaW9uIGluIFhMQ0RDIGlzIGRlcml2ZWQgYW5kIGhhbmRs
ZWQgdXNpbmcgYWRkaXRpb25hbA0KPj4gY29uZmlndXJhdGlvbiBiaXRzIGFuZCByZWdpc3RlcnMu
DQo+PiAJLSBXcml0aW5nIG9uZSB0byB0aGUgRW5hYmxlIGZpZWxkcyBvZiBlYWNoIGxheWVyIGlu
IExDRF9BVFRSRQ0KPj4gaXMgcmVxdWlyZWQgdG8gcmVmbGVjdCB0aGUgdmFsdWVzIHNldCBpbiBD
b25maWd1cmF0aW9uLCBGQkEsIEVuYWJsZQ0KPj4gcmVnaXN0ZXJzIG9mIGVhY2ggbGF5ZXINCj4+
DQo+PiBTaWduZWQtb2ZmLWJ5OiBNYW5pa2FuZGFuIE11cmFsaWRoYXJhbiA8bWFuaWthbmRhbi5t
QG1pY3JvY2hpcC5jb20+DQo+PiBbSGFyaS5QcmFzYXRoR0VAbWljcm9jaGlwLmNvbTogdXBkYXRl
IHRoZSBhdHRyaWJ1dGUgZmllbGQgZm9yIGVhY2ggbGF5ZXJdDQo+PiBTaWduZWQtb2ZmLWJ5OiBI
YXJpIFByYXNhdGggR3VqdWxhbiBFbGFuZ28gPEhhcmkuUHJhc2F0aEdFQG1pY3JvY2hpcC5jb20+
DQo+PiBbZHVyYWkubWFuaWNrYW1rckBtaWNyb2NoaXAuY29tOiBpbXBsZW1lbnQgc3RhdHVzIGZs
YWcgdG8gc2VwcmF0ZSByZWdpc3RlciB1cGRhdGVdDQo+IA0KPiBUaGVzZSB0aGluZ3MgaW5zaWRl
IFtdIGxvb2sgc3VzcGljaW91c2x5IGxpa2UgdGhleSBzaG91bGQgYmUNCj4gY28tZGV2ZWxvcGVk
LWJ5cy4uLg0KT2ssIEkgd2lsbCB1cGRhdGUgYXMgc3VnZ2VzdGVkLg0KPiANCg0KLS0gDQpUaGFu
a3MgYW5kIFJlZ2FyZHMsDQpNYW5pa2FuZGFuIE0uDQoNCg==
