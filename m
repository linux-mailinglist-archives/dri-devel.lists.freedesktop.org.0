Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6638660E547
	for <lists+dri-devel@lfdr.de>; Wed, 26 Oct 2022 18:10:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A432D10E54F;
	Wed, 26 Oct 2022 16:10:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2056.outbound.protection.outlook.com [40.107.92.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EADF810E55C;
 Wed, 26 Oct 2022 16:10:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b+Za421xMygzwxnxnPKfBN+7fXUQXB9Tm0DEGdnzFX3nXaMVVkMQdX2k7Uy1c2Kuyzgb+W8N5ibK0lsWwI7qDHRwWNXAedvjgcyw5ryxuO/bs1GLfa4evlnohvSSIyxLvMIfw6xVrA4cDvN4rPmSgYMfhJTR6RIkXE3SQXIydgulEB4C0ZClC4MoGfykjHjXwSlhdomXF55RHjNzTsMCz0CX/iD1/sG38t9rCU47h2Zfk7ckLFIeua/lwTqFgFPk4g06qffc5UpeyphA9rTHWfW6UDDEJdQ6Gv4u7U7zll/O5hgLA3110uPxVH4TpL/f4PQpCHmd/2rsvQkZrGOryw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ga74NnKaEThMibYQwHuSDOiOdg3dksukgE/dmjn9svY=;
 b=AZKxLIQavz615ofVsQhE0Qpe+RssXKkSnAywCnLVxeb8k0EhxLBfu7W9zyo1OyZlBo9+e++qcTXVIUz4w1cGbZZvSStryUzKMqfQZGsmfgq6/zELhtritKzVHC3gc2YLMa7NmnllE8gslw54NDe6qphgTgZ9hCkNqklfrOgl2T/h950XNeAGuQM+KssskcMUx7l2Mjh+oVAOP2rioBPMLjb3CtKXi5Kco7uZocuEj2kynfOkEZw4vXMUEMsjKZhwdFqryzXEy9gtvMjb+2NRfNOoVDvtBzL9x0ojEylcLPFPGj7uS1f/Bu6YSMC+HlNHkOp/sBHXN3P6lBCVELoOuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ga74NnKaEThMibYQwHuSDOiOdg3dksukgE/dmjn9svY=;
 b=Z/WA+eU5W9Z/6wiPFtBavCTribfo9ptOOZhaoL3v52IihguBbk9AtbdCbig/ShJ6QIC3fC5VOePM2y6aj3BzMX72c8nfWG8MtMOCiwXcy/4m9tI5DOZUeBHrwZPMqg8F5uWGgq7Bppzq92I9bLdpqoVctcVU3K3Lg+hrS9QsyK4=
Received: from CH0PR12MB5372.namprd12.prod.outlook.com (2603:10b6:610:d7::10)
 by DS7PR12MB5981.namprd12.prod.outlook.com (2603:10b6:8:7c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.23; Wed, 26 Oct
 2022 16:10:50 +0000
Received: from CH0PR12MB5372.namprd12.prod.outlook.com
 ([fe80::87ec:c064:1f39:c8ea]) by CH0PR12MB5372.namprd12.prod.outlook.com
 ([fe80::87ec:c064:1f39:c8ea%9]) with mapi id 15.20.5746.028; Wed, 26 Oct 2022
 16:10:50 +0000
From: "Liu, Shaoyun" <Shaoyun.Liu@amd.com>
To: =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <ckoenig.leichtzumerken@gmail.com>,
 "Tuikov, Luben" <Luben.Tuikov@amd.com>, "Prosyak, Vitaly"
 <Vitaly.Prosyak@amd.com>, "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH 2/5] drm/amdgpu: stop resubmitting jobs for bare metal
 reset
Thread-Topic: [PATCH 2/5] drm/amdgpu: stop resubmitting jobs for bare metal
 reset
Thread-Index: AQHY6VDHJzaRt1XClUmFt0meJkeTAa4g1Miw
Date: Wed, 26 Oct 2022 16:10:50 +0000
Message-ID: <CH0PR12MB5372F1A8B89543E067865EC6F4309@CH0PR12MB5372.namprd12.prod.outlook.com>
References: <20221026153557.63541-1-christian.koenig@amd.com>
 <20221026153557.63541-2-christian.koenig@amd.com>
In-Reply-To: <20221026153557.63541-2-christian.koenig@amd.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=f35a6e19-2359-4d91-bbb1-c9cabc60088b;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=0;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2022-10-26T15:57:53Z;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR12MB5372:EE_|DS7PR12MB5981:EE_
x-ms-office365-filtering-correlation-id: 93b9ce17-0de4-4844-1c84-08dab76ca666
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bEva6IsdGB5xw5QOg1pkn+XYiIPqsaMnga7i65EzUFrmqvjngdEhuw68gUig/tinkCCGUD2CNne6o8g8g0znBQqrKLDt/rgb2vslddoRW22qcCNE3V/pqVq4qPrYmuahODKE3WPuGcTLfsP3iVIIfGbcTEERM0tR6AI7hzcU3XWDRuQd5mWfoJ5LR+ClokWbVJYDFYuq7tnRcBMzqcfF7ON/c82VUsAukI68ta+uam774hfPONtsuuhYJwMU3xY2guaLhqu3Gs0vTF/jks3jPJselgMNIaVvSEUerTfn5REvzIFsR+s7mzV+w46U828IcbaKeKwuZivIEv4S6XWb2aw/dDnh+arx4RHdHvepugwnnqT2ArDVzat1Vu6hBpz+UGe5OvqfSPALA6/g4ZdDYVLsGB2WlKzw+r1hmt+FWXqjL2CjnG/SUDAso1kJYnj0drOHfA631DSKgaa8JoPtDkj5V/IexyxS9y9ID7A0lVpg7g9IiLv5lZB7Xsp0fpJfgjtjLXB0O1j+z3ciEvpGBO17RLqh3gIznGoE1TxgA+bI830bpqYGzDK0aewiDpSkt0FLRZlqC4jO6QZyDIYatsNU0b8qtbAZmzAevhcbwjyBm8D/0tQ2NTGoQO9yj/a2m0XRiFr3LlZp2kLXhKu4Co1lqifYmhQJZ/g97LhgtERNimJapt1quKcn8veKUlMvzbNEk5gnJ6MIUeO8kHdDrwjGXCg9JfPWvqdqeX0AwAC5ze7FDvbjKAcdEebiN5uTWoF+F/LAM09J8AZUpxV/SyeuDJIgN0p4udukdYZxMsc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR12MB5372.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(366004)(39860400002)(136003)(346002)(376002)(451199015)(66476007)(64756008)(7696005)(53546011)(66946007)(66556008)(66446008)(4326008)(8676002)(6506007)(26005)(9686003)(8936002)(5660300002)(41300700001)(52536014)(38100700002)(110136005)(316002)(76116006)(55016003)(86362001)(66574015)(83380400001)(921005)(186003)(33656002)(2906002)(122000001)(71200400001)(38070700005)(478600001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RVpOcWZ3ckFNS3NaZTRTYnFxUnVJV1NiMmJCTUo2RndyZmIrL3FxZlJ2ZStO?=
 =?utf-8?B?Nk14T2NUT0UrTDM3c0FOY3dOemZFM3FJZmdmRENjTVVXRmpaT3JSNlhBWWsy?=
 =?utf-8?B?WTdTeW0rckJZYSt3NHdsODJDQmg2RWJjSk5ZMmZ1eFZVdmJFcVdsWVFUK25Q?=
 =?utf-8?B?bVB6VFh0WHZpMmVMNXlMYVNvai9FT1ZCbkVFdDRHOUFPa0xkazN6d2s0UXRx?=
 =?utf-8?B?YXBmU2hCUU41Sng2Q1k5RWdkaytESk1EdWlaOXA4NUdPNU90SDZkdFhxeC93?=
 =?utf-8?B?SzgzbmZvREV5NW91RWNMMHdJd3BpbXF6SFdjc21WblBva0JkQ211RUp5THAy?=
 =?utf-8?B?ajg1bHZIZjZDRW4xZVEyOUZlNkV1U1ZxZ2paYWpyM3JWazZaMVdmOUliUDVj?=
 =?utf-8?B?djYrbEhkZFA3OWJPRUxhVmdhcHoyLzFZMk9XRGZSWGIyaUlXczJjcHdoRGtm?=
 =?utf-8?B?VUNJY1NFOStxWVlhZzJwMmdLTk55ZXVGTG9JbEVockl1VkRkWXBCQlplT0k1?=
 =?utf-8?B?dW1QZ2JmZmdBbjNiMTM5V0tHVUltcTN1alBoRHBtRXNPOTFXa1pUeGlwNEox?=
 =?utf-8?B?bkFUNjFNeXJhREVnL3hwNWUwNVVOOVdHOXBhMHVNSk9lbmNzWHlCV0U0NVpV?=
 =?utf-8?B?UFUrMEdZa1VmTnNKaEF6UjRLek1MOVVxemtMRU44MUl4TE8xNVh5aGNvblBu?=
 =?utf-8?B?bklaTXY2YWlNck55NDl3YzdwOVFmbVNJNUlUblBEaXhsU1kzUlJ2dUN4TlJs?=
 =?utf-8?B?S3ErSm43ejRjeElQcVd5RFpLNG4zMkk3SWs1OUdScjQzOUhYRkpGRlhTU0hs?=
 =?utf-8?B?a2xuelJDbzNMQ1c1cWNKSmp6OFVJaXppRHVoTXpWRmg0d21YUXNDMTR2cXc0?=
 =?utf-8?B?QURhTUM3NUMxT2hvYXVxdGU5cG13UTE2S2FqbmJFMm9CZFNoUkdjS1hCcUo4?=
 =?utf-8?B?VWkrb2hEK0lSRkRSQzMxUXpDTlhwT3didytraXIwNTAvQ0dZT0RCK1dVR3RX?=
 =?utf-8?B?NXdrYU9WUzZleVcweTlmUVgwdHlSdXRrL3U4T1ZBT1lqaVhpZDBZNmc3Z2pw?=
 =?utf-8?B?UTVkb0NkbkFRV2xBZUFURG1vSGtoU1hLK1BCZVdkS1gzY1pwTUNudTlnQWlN?=
 =?utf-8?B?WkpjRnpCRHNKaVNHQXVaK05NWFMyTkFpOUYyTUhEUnRTVTZhaTZkUWpmbWh6?=
 =?utf-8?B?R0UzOVUybXUxbXVtT1o5OVlHNVQ5YkphVDFydjB4OXdqRDlCY0lZWVBDZnhF?=
 =?utf-8?B?cytMZ2hIOWZ5MXRpSlU1dmlpNVNxTVc1WEUzV1dEekUwb3V5cjUwMXFxVkly?=
 =?utf-8?B?anVZbzNkUUVYcHNHUWNnd0NsMDM0REcvN2RYbXFZUFhCRnFXek9kbDk0N3dR?=
 =?utf-8?B?NFJQTDNWUURpWHdzRWdWakdrQ1NDc2h4U2k4c1NkdmtJVi9YQkZ3MERVYWFW?=
 =?utf-8?B?ditBQnRNRHVzVlpneEx3QUxQNVlmWHAvUDdJVVVPekJLV2VpOXY4ZDVPTzEv?=
 =?utf-8?B?OElUNGhwQWxiNkFaUmtGaDhBVW1XUU5rUHlvRU94ajY0VnQzN1hxQmcvRVBs?=
 =?utf-8?B?cU4zdnVxejVzNWpMKys1MUZZSmFWbjNmd1ZmS1lERzlIbjJmVSt2d3VBanlx?=
 =?utf-8?B?R3poUEpQcUFBTW5OV1E0dWovSlVremdQcnlZbEtZRG50VWRxckRnTzNSM2o2?=
 =?utf-8?B?dk0zNXpuSjlCQ28wZ0JIMlQ1WG10UWp4d1hUVk9IM0xuMEFvZHllbGZ5SXJr?=
 =?utf-8?B?MHNMVXJMNDdFczZKWW0yVjZCVUoydXdVaXNraE91WGtvY0FRT1hJRldTdU9i?=
 =?utf-8?B?WFU4RzJ4bEpKNThuNFk5NWZZYWlJVzY0TWF0Q1NDYW13aFFWUU5hMUt6cEE3?=
 =?utf-8?B?L2RzOSsySUoxL1JRS3M5NFdHNlY1QTUwWVQ1dmQ0OHJSdHdrUzZlaS9WbXpX?=
 =?utf-8?B?dmVpOG1JSXZtdE0ra3lsNUIxbENza252bllDZ3JWT2YzR2hSY1R4Q2hMci9v?=
 =?utf-8?B?SFZHaHFHeUpPUlBTTFA1UVE3TG1BSmptMjk3YWlGV042eU1RRVdxbWYxNjJD?=
 =?utf-8?B?OENOSE9uclFxczdIMUFEK2tCcnpoSEQ5dG1pTVV2d0VNMXp0V3BOUUZhdDZr?=
 =?utf-8?Q?AzV0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR12MB5372.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93b9ce17-0de4-4844-1c84-08dab76ca666
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Oct 2022 16:10:50.1782 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iogQy1wZcTOFs9D5TxxpF+4MW8taC9IxOKh6yyIFlOLn6j01nJn2R6D7vDzAvNJNm3H4868036l/hyeyK1gzvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5981
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
Cc: "Koenig, Christian" <Christian.Koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEdlbmVyYWxdDQoNClRoZSAgdXNlciBzcGFjZSAgc2hv
dWxkbid0IGNhcmUgYWJvdXQgIFNSSU9WIG9yIG5vdCAsICBJIGRvbid0IHRoaW5rIHdlIG5lZWQg
dG8ga2VlcCB0aGUgcmUtc3VibWlzc2lvbiBmb3IgU1JJT1YgYXMgd2VsbC4gIFRoZSByZXNldCBm
cm9tIFNSSU9WIGNvdWxkIHRyaWdnZXIgdGhlICBob3N0IGRvIGEgd2hvbGUgR1BVIHJlc2V0IHdo
aWNoIHdpbGwgaGF2ZSB0aGUgc2FtZSBpc3N1ZSBhcyBiYXJlIG1ldGFsLg0KDQpSZWdhcmRzDQpT
aGFveXVuLmxpdQ0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogYW1kLWdmeCA8
YW1kLWdmeC1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mIENocmlz
dGlhbiBLw7ZuaWcNClNlbnQ6IFdlZG5lc2RheSwgT2N0b2JlciAyNiwgMjAyMiAxMTozNiBBTQ0K
VG86IFR1aWtvdiwgTHViZW4gPEx1YmVuLlR1aWtvdkBhbWQuY29tPjsgUHJvc3lhaywgVml0YWx5
IDxWaXRhbHkuUHJvc3lha0BhbWQuY29tPjsgRGV1Y2hlciwgQWxleGFuZGVyIDxBbGV4YW5kZXIu
RGV1Y2hlckBhbWQuY29tPjsgZGFuaWVsLnZldHRlckBmZndsbC5jaDsgYW1kLWdmeEBsaXN0cy5m
cmVlZGVza3RvcC5vcmc7IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCkNjOiBLb2Vu
aWcsIENocmlzdGlhbiA8Q2hyaXN0aWFuLktvZW5pZ0BhbWQuY29tPg0KU3ViamVjdDogW1BBVENI
IDIvNV0gZHJtL2FtZGdwdTogc3RvcCByZXN1Ym1pdHRpbmcgam9icyBmb3IgYmFyZSBtZXRhbCBy
ZXNldA0KDQpSZS1zdWJtaXR0aW5nIElCcyBieSB0aGUga2VybmVsIGhhcyBtYW55IHByb2JsZW1z
IGJlY2F1c2UgcHJlLSByZXF1aXNpdGUgc3RhdGUgaXMgbm90IGF1dG9tYXRpY2FsbHkgcmUtY3Jl
YXRlZCBhcyB3ZWxsLiBJbiBvdGhlciB3b3JkcyBuZWl0aGVyIGJpbmFyeSBzZW1hcGhvcmVzIG5v
ciB0aGluZ3MgbGlrZSByaW5nIGJ1ZmZlciBwb2ludGVycyBhcmUgaW4gdGhlIHN0YXRlIHRoZXkg
c2hvdWxkIGJlIHdoZW4gdGhlIGhhcmR3YXJlIHN0YXJ0cyB0byB3b3JrIG9uIHRoZSBJQnMgYWdh
aW4uDQoNCkFkZGl0aW9uYWwgdG8gdGhhdCBldmVuIGFmdGVyIG1vcmUgdGhhbiA1IHllYXJzIG9m
IGRldmVsb3BpbmcgdGhpcyBmZWF0dXJlIGl0IGlzIHN0aWxsIG5vdCBzdGFibGUgYW5kIHdlIGhh
dmUgbWFzc2l2ZWx5IHByb2JsZW1zIGdldHRpbmcgdGhlIHJlZmVyZW5jZSBjb3VudHMgcmlnaHQu
DQoNCkFzIGRpc2N1c3NlZCB3aXRoIHVzZXIgc3BhY2UgZGV2ZWxvcGVycyB0aGlzIGJlaGF2aW9y
IGlzIG5vdCBoZWxwZnVsIGluIHRoZSBmaXJzdCBwbGFjZS4gRm9yIGdyYXBoaWNzIGFuZCBtdWx0
aW1lZGlhIHdvcmtsb2FkcyBpdCBtYWtlcyBtdWNoIG1vcmUgc2Vuc2UgdG8gZWl0aGVyIGNvbXBs
ZXRlbHkgcmUtY3JlYXRlIHRoZSBjb250ZXh0IG9yIGF0IGxlYXN0IHJlLXN1Ym1pdHRpbmcgdGhl
IElCcyBmcm9tIHVzZXJzcGFjZS4NCg0KRm9yIGNvbXB1dGUgdXNlIGNhc2VzIHJlLXN1Ym1pdHRp
bmcgaXMgYWxzbyBub3QgdmVyeSBoZWxwZnVsIHNpbmNlIHVzZXJzcGFjZSBtdXN0IHJlbHkgb24g
dGhlIGFjY3VyYWN5IG9mIHRoZSByZXN1bHQuDQoNCkJlY2F1c2Ugb2YgdGhpcyB3ZSBzdG9wIHRo
aXMgcHJhY3RpY2UgYW5kIGluc3RlYWQganVzdCBwcm9wZXJseSBub3RlIHRoYXQgdGhlIGZlbmNl
IHN1Ym1pc3Npb24gd2FzIGNhbmNlbGVkLiBUaGUgb25seSB1c2UgY2FzZSB3ZSBrZWVwIHRoZSBy
ZS1zdWJtaXNzaW9uIGZvciBub3cgaXMgU1JJT1YgYW5kIGZ1bmN0aW9uIGxldmVsIHJlc2V0cy4N
Cg0KU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQu
Y29tPg0KLS0tDQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jIHwg
MyArKy0NCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQoN
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMNCmluZGV4IGQ0NTg0
ZTU3N2I1MS4uMzllOTRmZWJhMWFjIDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X2RldmljZS5jDQorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfZGV2aWNlLmMNCkBAIC01Mjg4LDcgKzUyODgsOCBAQCBpbnQgYW1kZ3B1X2RldmljZV9n
cHVfcmVjb3ZlcihzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwNCiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgY29udGludWU7DQoNCiAgICAgICAgICAgICAgICAgICAgICAgIC8qIE5v
IHBvaW50IHRvIHJlc3VibWl0IGpvYnMgaWYgd2UgZGlkbid0IEhXIHJlc2V0Ki8NCi0gICAgICAg
ICAgICAgICAgICAgICAgIGlmICghdG1wX2FkZXYtPmFzaWNfcmVzZXRfcmVzICYmICFqb2Jfc2ln
bmFsZWQpDQorICAgICAgICAgICAgICAgICAgICAgICBpZiAoIXRtcF9hZGV2LT5hc2ljX3Jlc2V0
X3JlcyAmJiAham9iX3NpZ25hbGVkICYmDQorICAgICAgICAgICAgICAgICAgICAgICAgICAgYW1k
Z3B1X3NyaW92X3ZmKHRtcF9hZGV2KSkNCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ZHJtX3NjaGVkX3Jlc3VibWl0X2pvYnMoJnJpbmctPnNjaGVkKTsNCg0KICAgICAgICAgICAgICAg
ICAgICAgICAgZHJtX3NjaGVkX3N0YXJ0KCZyaW5nLT5zY2hlZCwgIXRtcF9hZGV2LT5hc2ljX3Jl
c2V0X3Jlcyk7DQotLQ0KMi4yNS4xDQoNCg==
