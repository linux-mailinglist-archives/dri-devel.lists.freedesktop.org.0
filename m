Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6423E7218C5
	for <lists+dri-devel@lfdr.de>; Sun,  4 Jun 2023 19:08:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45E1A10E169;
	Sun,  4 Jun 2023 17:08:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2130.outbound.protection.outlook.com [40.107.22.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A12010E165;
 Sun,  4 Jun 2023 17:07:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZTh+SESmyDvqS8JBKcA4/RY+8rA/xDiClhGfWm/lNDqaJmUgqlFj8P5REuh14VR/X2GXPEc/b/dqjBYN9hUBOTFHhItotY5IzgFqAPFR1jEjC7FtTbnRkZxWwlJwdg6TKdGj8QIrieiTmfGPWX0ED4l7LfkmZDr3ZvMBdbBJTwAOR7Fkrzw9itBP4ukgJ3R1/iOpkQKQva5lZZ/zH8j+6SV9MpUo5LvRaCLRvQXRDzTYYHtu5r/+cuJzZq9YiOWR7ebQjP0vB/+fDrsaeeGvGDZi0pESKK602zQOESGSI2VrkydH0Aj/1Nk+X7v3D+K1HkKXvJj6F10cGr+EL4MeRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fDFNygqSbb5H+EwzD7OtxDSumg/GTceJA0gqQfwyvQ4=;
 b=N7sIi3BR+GvU5HSkwq2c82o9RXtSK6m1WOeSAS+MCSS4Xl25wOf92mW/hbd4ESVNJzWcpPbhrlFJez90rbL2yNvhgi2ADrNJHFmUkPaoYOvJ9eRe1O+nap3XQKbffX+pyBF+B5uLVoz89Nds901J8t2v4/auu/YkT1CRlXaMMDmMlpeJkIgGORg66u7gPoLCjtkiPU4KRK8p+LtBx5vZi7L1nZ9h5S/CuB77bkDF+y2LDJQN6Olv8/f8oBTC4WCWsDQbLB6AQU0zluOqPk5CffnODv0FKf4LrcafAoQ/BKsD/UwEM7+V2kpTimyYHaksxskcbnc21JBKvnJfuUfn7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=habana.ai; dmarc=pass action=none header.from=habana.ai;
 dkim=pass header.d=habana.ai; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=habana.ai; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fDFNygqSbb5H+EwzD7OtxDSumg/GTceJA0gqQfwyvQ4=;
 b=ELuf20dXq7cJ9ELovE4ByY47LtcNbXKF8ZaFuI/kDqDXd/uWYhyqK+JezUzINCCB7F/foCcocfuRy7HaOMROq42FXWpmDNQOF/Luu2I3jPJoZ2+hE9tcUZsUyLTfA4PYLQ0AT/3ZQvDk2vGfwjIAhGgcbkqjOH/CIlaFB5pJwbgiXJRhwRvEMjqi1kvs296d4BkG7wG3yYDP4mG7i16S/u6p1CK7dCwDlEmzW9HrF4lqmxvwX+0s48YIlKWOUl4gP7Wioo7Jxu9wUffVvCnpWn8yry+/IFHKUuv3R3Jm3fxRbGuWHrcLN9COh5iXDldpWAhkKHqUPFJoMsA2jLx4RQ==
Received: from DU2PR02MB7573.eurprd02.prod.outlook.com (2603:10a6:10:2d8::6)
 by PAXPR02MB8246.eurprd02.prod.outlook.com (2603:10a6:102:245::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Sun, 4 Jun
 2023 17:07:55 +0000
Received: from DU2PR02MB7573.eurprd02.prod.outlook.com
 ([fe80::f04b:e404:488b:2352]) by DU2PR02MB7573.eurprd02.prod.outlook.com
 ([fe80::f04b:e404:488b:2352%7]) with mapi id 15.20.6455.030; Sun, 4 Jun 2023
 17:07:55 +0000
From: Tomer Tayar <ttayar@habana.ai>
To: Aravind Iddamsetty <aravind.iddamsetty@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [Intel-xe] [RFC 1/5] drm/netlink: Add netlink infrastructure
Thread-Topic: [Intel-xe] [RFC 1/5] drm/netlink: Add netlink infrastructure
Thread-Index: AQHZj+4TUQVrrZD7yUaFLAUxVT2zUa967liA
Date: Sun, 4 Jun 2023 17:07:55 +0000
Message-ID: <98184112-ca7d-65c5-0b98-94abb418a2a5@habana.ai>
References: <20230526162016.428357-1-aravind.iddamsetty@intel.com>
 <20230526162016.428357-2-aravind.iddamsetty@intel.com>
In-Reply-To: <20230526162016.428357-2-aravind.iddamsetty@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=habana.ai;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU2PR02MB7573:EE_|PAXPR02MB8246:EE_
x-ms-office365-filtering-correlation-id: 3c25c67d-4b95-4759-e4fd-08db651e3d45
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eenRVlV7Szti+/aO+eCvRNWtelaALQOb/XpBTQzW8QgFdFlbQXJPLmRsT4ojLrwpdbq01BBMtIV/b8XYQ2z3jAkoR96PUf+SxtsStQS1LiUcVcrfw1nGKHDhsHW1QPO8B3K/9kjAe2VV4gm28RcqdoH5t0LIEQRDM+wmq7hFOkROq1sAvpFsEnQhTS24XNkxktQKkdi10F6ME9Q/PUfPhusPgEBAcYo8NItvjD1tc+uI6A/QrilT+/Opu7LkddP4Va/lRqsKuM53hwEjoURrmoEHr4bJQuKSjDs8rrPPIpjWOQqAJsoot3x9KYRRQHb1H2imUrNgatMdi9nGtE3U+dQMyZxEoPmZcwoCjLyOXu6ljSfJRr/QOSI2ChzipbUJw5EOo2uXGVUkm2ZBioa7reyjCfi/gG4DmyKC4sWynAgMfPEM8D084pmUasVBrJOYSKGLtCxotW/xDiQ0bYkBVKT/zb4u+rgOuKxKxSPWefr8irBAE+LXTg6cB5DwcZzcampECRACQSDZfKN4O5aEB8vfXIu3g0RoVsHJs0ltEX95AJLN0cyuhGrPpm52NSJVTVoF6zTcKQv698sdXTLFy4RocAorKUIPlTMpzoy47WzJrSbfF2RUuyIPH33N7cuYPd2tGUgy0XNmlhLLu7QTAlcQ1CIqWoZCuCa3Zy00TOIT5sGWeveBQ0C18EIjaPDH
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU2PR02MB7573.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39850400004)(366004)(376002)(396003)(346002)(136003)(451199021)(66476007)(66556008)(91956017)(76116006)(66946007)(2906002)(478600001)(66446008)(64756008)(31686004)(316002)(4326008)(8936002)(8676002)(41300700001)(54906003)(110136005)(5660300002)(6486002)(66899021)(71200400001)(6512007)(53546011)(6506007)(26005)(38100700002)(82960400001)(2616005)(186003)(83380400001)(36756003)(38070700005)(86362001)(122000001)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eFFKSHRLbEZWUFhBdjQyeGpBVzl0NExvOWphVmpkUHZ5djB1UHdSRmdJWEQy?=
 =?utf-8?B?aG1xZGZiRFd2M21uTFFyekkvRUIrbUx3bFdrNVZqd2dTQ0FlTktIcnJQR3F4?=
 =?utf-8?B?aEp5NFJteUFoRXhoQTBWVDNKeWh2UFhRWjBnaFRnaTE1aER3aCtkMHY3Ylcv?=
 =?utf-8?B?aDhYdzVhRS9ENk93ZHpNd2tocnBKeHNtRllBZGRINzRLQTd0b1pvR3ErVHlo?=
 =?utf-8?B?NndMZHdnUWlZc3RFZ3FmY2RPMFA3bytjZGU4Rlk3bXl5Zml4M0JxOEh1VzI4?=
 =?utf-8?B?RjdtOU13RHh4NUNJUzBJQlAyTXc0QzFGRnFiRVJvYVIrWmJEWEpaS2xkd2lX?=
 =?utf-8?B?VE4waUROaE1DYmw2ditSeGYrYXR5WGxIMzc5OFJ1UUVaZE1Fd0dNOWpIQWJD?=
 =?utf-8?B?WlQ4bjBhSnU0V3cwVDljK0xLNUpsQ1pvTENRZW90aUJ0QXhVZGtCTWJBeHVF?=
 =?utf-8?B?ZXRidVZQZCtOSUFYZUlkbk9wZjJ1RlE1LzZFZ3ZpRVdyazFlY3RIY28zNUp6?=
 =?utf-8?B?LzY1TnZrOW5GQ3BPUS9xejlrNnRxL1NtR0Y3U3IrSmJ4ekMwbEVvRmpnNHFS?=
 =?utf-8?B?R2NQV0pRUTN3WjlwMDNTMzVFWWxVQkljOEl6WmRzUzZnU1grdGp0K1dPTTZB?=
 =?utf-8?B?MFcwKzhoYkRFUC9mY2NVcHB1bFRDVnBYVFpVMGt5VFR0QVpaNWVjYmx0bUNF?=
 =?utf-8?B?VVd5Uks3dHVIWUNCUG5DWFpkVzdpbnJ4TWcvZGJmc083WjI5RGNOUWtaempR?=
 =?utf-8?B?MFNwRVhvTkF5Mmw1N2xJelV6blJZejZia0doY2dKVEsyRjRSV1JFN2ZZT20w?=
 =?utf-8?B?dW5iTmdwc1NGNXFmbTlUSzlFOVM1aDJjbVZleHRqend0L29RMzNsZndZUzlP?=
 =?utf-8?B?Nk9hMmJTUHp6ZytpZWF6MHdPQ0hFRmZRYktrL0I3MDVmeG41ejYwSWtjUENn?=
 =?utf-8?B?WE1lZTYxL3BwdUZMWjErS2l2UDE0TnNjNHM4LzI3NDlNZnRFd1EvZjBkT2wx?=
 =?utf-8?B?NnQyVlZ3UHJnMjJZUENjOVNQODhpdGV0Y0hiOW9vS3JrUHFOVHJtbVQxbElY?=
 =?utf-8?B?VFRIdkI3WGdDWDhGNm8zUTJRMEE3MytIWFBxQTRCeHBheVA0akFpM1Q2ZXZr?=
 =?utf-8?B?VHRUdGhGTEpIUVJmUWsva0c0NG11T256b2Q2elB3NXd6Q2YrN1VTR3h2bk9t?=
 =?utf-8?B?THVVdTU5VHRKd1orWk1CZUY4cDcxdWgwd2F4cjJ2NEJTTW51eXprd1p1ZUE5?=
 =?utf-8?B?cU0xdEhTcTZFOGppTkZpbmxYampXSmN4S3BNRzJtRmpwZFlyZ0FnbEIxclVw?=
 =?utf-8?B?bmVlamZHTmNyaG1TaU01QlBRa0doQm15Q0pZODBjc3MyMkZucy9zRE9sN1la?=
 =?utf-8?B?RkgrWDZlNFVGK1VjMWpQcUlNbXB6bW1hVngxY2RKcjJ2dVk1aW9aNmlldjM5?=
 =?utf-8?B?UDhBUzRHbnlqNlA2RU5CU2dVYzU1akE4V3ZWb1BNcUR4eUIzbEppd0lOYlVx?=
 =?utf-8?B?M1BRVlNFckovM2JRTGcweE9ybks2UGFONHdmakkyVnV0cVgzR2llV3MwM21r?=
 =?utf-8?B?WFk1b05NUkxzcitUTmRHN1plUkFMTVhucUtGTVhOQ3AwK1c2UUZ6cG1pQmVv?=
 =?utf-8?B?b01QM3B5cERpZjRsTGhKYVAvUmZkdmxyS0FwenZoWWZNTmRjM1BHcVMzT2gr?=
 =?utf-8?B?YmtkdGViQmQ3V3NTTTkzUVFFejJ0blQ4M3BkVzEwdHlNSCtvQXl4dzJLVmJy?=
 =?utf-8?B?QXUxcVp5U0NVQjJCY0ZacUJ3ek5vNGJIemNGOW5pdG1PUmkvQjRjRlczYXl2?=
 =?utf-8?B?Z1FKV3hsOW90Z0pBbzdoTVYrL28yZzBhZnZ2dmNQNXR1c1Q4Q1pUNXE5ODJH?=
 =?utf-8?B?UWgyYk9KY1hhdWtpR3hNWTlPVWdTVmh3RXNBeFZ0OXlLYlR5d0lnTloxR05X?=
 =?utf-8?B?NFpOU0YzekdMaWF0Mm1jNTdjcU5FaUdiUVZaYTV4L3FaQisrdm1abXBGTkV1?=
 =?utf-8?B?SFlTbnRDTCszTHp4Ym9lUzFpbXQ5STNTY1BRT2dTeEJ6czlWSnkwR2IyTXdM?=
 =?utf-8?B?dmdOdlp2Qy9qcmlHR2srQjMwQnU2cEIyeXdySmNQWmc4NjJ2Tk90dEthaEs5?=
 =?utf-8?Q?e+94=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BB2412AB5484E0449757DC5AF7EC8FB6@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: habana.ai
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU2PR02MB7573.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c25c67d-4b95-4759-e4fd-08db651e3d45
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2023 17:07:55.4263 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d4d4539-213c-4ed8-a251-dc9766ba127a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CE637TfmbE143bD9Zb0GTojUTNW/eLaiIMvNmtk/5XFOOpP2jBm5UIdH/JTkFLriaUjdCsRZQyoK0zCWbL7M2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR02MB8246
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
Cc: "alexander.deucher@amd.com" <alexander.deucher@amd.com>,
 Oded Gabbay <ogabbay@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjYvMDUvMjAyMyAxOToyMCwgQXJhdmluZCBJZGRhbXNldHR5IHdyb3RlOg0KPiBEZWZpbmUg
dGhlIG5ldGxpbmsgY29tbWFuZHMgYW5kIGF0dHJpYnV0ZXMgdGhhdCBjYW4gYmUgY29tbW9ubHkg
dXNlZA0KPiBhY3Jvc3MgYnkgZHJtIGRyaXZlcnMuDQo+DQo+IFNpZ25lZC1vZmYtYnk6IEFyYXZp
bmQgSWRkYW1zZXR0eSA8YXJhdmluZC5pZGRhbXNldHR5QGludGVsLmNvbT4NCj4gLS0tDQo+ICAg
aW5jbHVkZS91YXBpL2RybS9kcm1fbmV0bGluay5oIHwgNjggKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKw0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA2OCBpbnNlcnRpb25zKCspDQo+ICAg
Y3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvdWFwaS9kcm0vZHJtX25ldGxpbmsuaA0KPg0KPiBk
aWZmIC0tZ2l0IGEvaW5jbHVkZS91YXBpL2RybS9kcm1fbmV0bGluay5oIGIvaW5jbHVkZS91YXBp
L2RybS9kcm1fbmV0bGluay5oDQo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+IGluZGV4IDAwMDAw
MDAwMDAwMC4uMjhlN2EzMzRkMGM3DQo+IC0tLSAvZGV2L251bGwNCj4gKysrIGIvaW5jbHVkZS91
YXBpL2RybS9kcm1fbmV0bGluay5oDQo+IEBAIC0wLDAgKzEsNjggQEANCj4gKy8qDQo+ICsgKiBD
b3B5cmlnaHQgMjAyMyBJbnRlbCBDb3Jwb3JhdGlvbg0KPiArICoNCj4gKyAqIFBlcm1pc3Npb24g
aXMgaGVyZWJ5IGdyYW50ZWQsIGZyZWUgb2YgY2hhcmdlLCB0byBhbnkgcGVyc29uIG9idGFpbmlu
ZyBhDQo+ICsgKiBjb3B5IG9mIHRoaXMgc29mdHdhcmUgYW5kIGFzc29jaWF0ZWQgZG9jdW1lbnRh
dGlvbiBmaWxlcyAodGhlICJTb2Z0d2FyZSIpLA0KPiArICogdG8gZGVhbCBpbiB0aGUgU29mdHdh
cmUgd2l0aG91dCByZXN0cmljdGlvbiwgaW5jbHVkaW5nIHdpdGhvdXQgbGltaXRhdGlvbg0KPiAr
ICogdGhlIHJpZ2h0cyB0byB1c2UsIGNvcHksIG1vZGlmeSwgbWVyZ2UsIHB1Ymxpc2gsIGRpc3Ry
aWJ1dGUsIHN1YmxpY2Vuc2UsDQo+ICsgKiBhbmQvb3Igc2VsbCBjb3BpZXMgb2YgdGhlIFNvZnR3
YXJlLCBhbmQgdG8gcGVybWl0IHBlcnNvbnMgdG8gd2hvbSB0aGUNCj4gKyAqIFNvZnR3YXJlIGlz
IGZ1cm5pc2hlZCB0byBkbyBzbywgc3ViamVjdCB0byB0aGUgZm9sbG93aW5nIGNvbmRpdGlvbnM6
DQo+ICsgKg0KPiArICogVGhlIGFib3ZlIGNvcHlyaWdodCBub3RpY2UgYW5kIHRoaXMgcGVybWlz
c2lvbiBub3RpY2UgKGluY2x1ZGluZyB0aGUgbmV4dA0KPiArICogcGFyYWdyYXBoKSBzaGFsbCBi
ZSBpbmNsdWRlZCBpbiBhbGwgY29waWVzIG9yIHN1YnN0YW50aWFsIHBvcnRpb25zIG9mIHRoZQ0K
PiArICogU29mdHdhcmUuDQo+ICsgKg0KPiArICogVEhFIFNPRlRXQVJFIElTIFBST1ZJREVEICJB
UyBJUyIsIFdJVEhPVVQgV0FSUkFOVFkgT0YgQU5ZIEtJTkQsIEVYUFJFU1MgT1INCj4gKyAqIElN
UExJRUQsIElOQ0xVRElORyBCVVQgTk9UIExJTUlURUQgVE8gVEhFIFdBUlJBTlRJRVMgT0YgTUVS
Q0hBTlRBQklMSVRZLA0KPiArICogRklUTkVTUyBGT1IgQSBQQVJUSUNVTEFSIFBVUlBPU0UgQU5E
IE5PTklORlJJTkdFTUVOVC4gIElOIE5PIEVWRU5UIFNIQUxMDQo+ICsgKiBWQSBMSU5VWCBTWVNU
RU1TIEFORC9PUiBJVFMgU1VQUExJRVJTIEJFIExJQUJMRSBGT1IgQU5ZIENMQUlNLCBEQU1BR0VT
IE9SDQo+ICsgKiBPVEhFUiBMSUFCSUxJVFksIFdIRVRIRVIgSU4gQU4gQUNUSU9OIE9GIENPTlRS
QUNULCBUT1JUIE9SIE9USEVSV0lTRSwNCj4gKyAqIEFSSVNJTkcgRlJPTSwgT1VUIE9GIE9SIElO
IENPTk5FQ1RJT04gV0lUSCBUSEUgU09GVFdBUkUgT1IgVEhFIFVTRSBPUg0KPiArICogT1RIRVIg
REVBTElOR1MgSU4gVEhFIFNPRlRXQVJFLg0KPiArICovDQo+ICsNCj4gKyNpZm5kZWYgX0RSTV9O
RVRMSU5LX0hfDQo+ICsjZGVmaW5lIF9EUk1fTkVUTElOS19IXw0KPiArDQo+ICsjaW5jbHVkZSA8
bGludXgvbmV0ZGV2aWNlLmg+DQo+ICsjaW5jbHVkZSA8bmV0L2dlbmV0bGluay5oPg0KPiArI2lu
Y2x1ZGUgPG5ldC9zb2NrLmg+DQoNClRoaXMgaXMgYSB1YXBpIGhlYWRlci4NCkFyZSBhbGwgaGVh
ZGVyIGZpbGVzIGhlcmUgYXZhaWxhYmxlIGZvciB1c2VyPw0KQWxzbywgc2hvdWxkIHdlIGFkZCBo
ZXJlICIjaWYgZGVmaW5lZChfX2NwbHVzcGx1cykgZXh0ZXJuICJDIiB7IC4uLiI/DQoNCj4gKw0K
PiArI2RlZmluZSBEUk1fR0VOTF9WRVJTSU9OIDENCj4gKw0KPiArZW51bSBlcnJvcl9jbWRzIHsN
Cj4gKwlEUk1fQ01EX1VOU1BFQywNCj4gKwkvKiBjb21tYW5kIHRvIGxpc3QgYWxsIGVycm9ycyBu
YW1lcyB3aXRoIGNvbmZpZy1pZCAqLw0KPiArCURSTV9DTURfUVVFUlksDQo+ICsJLyogY29tbWFu
ZCB0byBnZXQgYSBjb3VudGVyIGZvciBhIHNwZWNpZmljIGVycm9yICovDQo+ICsJRFJNX0NNRF9S
RUFEX09ORSwNCj4gKwkvKiBjb21tYW5kIHRvIGdldCBjb3VudGVycyBvZiBhbGwgZXJyb3JzICov
DQo+ICsJRFJNX0NNRF9SRUFEX0FMTCwNCj4gKw0KPiArCV9fRFJNX0NNRF9NQVgsDQo+ICsJRFJN
X0NNRF9NQVggPSBfX0RSTV9DTURfTUFYIC0gMSwNCj4gK307DQo+ICsNCj4gK2VudW0gZXJyb3Jf
YXR0ciB7DQo+ICsJRFJNX0FUVFJfVU5TUEVDLA0KPiArCURSTV9BVFRSX1BBRCA9IERSTV9BVFRS
X1VOU1BFQywNCj4gKwlEUk1fQVRUUl9SRVFVRVNULCAvKiBOTEFfVTggKi8NCj4gKwlEUk1fQVRU
Ul9RVUVSWV9SRVBMWSwgLypOTEFfTkVTVEVEKi8NCg0KTWlzc2luZyBzcGFjZXMgaW4gLypOTEFf
TkVTVEVEKi8NCg0KPiArCURSTV9BVFRSX0VSUk9SX05BTUUsIC8qIE5MQV9OVUxfU1RSSU5HICov
DQo+ICsJRFJNX0FUVFJfRVJST1JfSUQsIC8qIE5MQV9VNjQgKi8NCj4gKwlEUk1fQVRUUl9FUlJP
Ul9WQUxVRSwgLyogTkxBX1U2NCAqLw0KPiArDQo+ICsJX19EUk1fQVRUUl9NQVgsDQo+ICsJRFJN
X0FUVFJfTUFYID0gX19EUk1fQVRUUl9NQVggLSAxLA0KPiArfTsNCj4gKw0KPiArLyogYXR0cmli
dXRlIHBvbGljaWVzICovDQo+ICtzdGF0aWMgY29uc3Qgc3RydWN0IG5sYV9wb2xpY3kgZHJtX2F0
dHJfcG9saWN5X3F1ZXJ5W0RSTV9BVFRSX01BWCArIDFdID0gew0KPiArCVtEUk1fQVRUUl9SRVFV
RVNUXSA9IHsgLnR5cGUgPSBOTEFfVTggfSwNCj4gK307DQoNClNob3VsZCB0aGVzZSBwb2xpY2ll
cyBzdHJ1Y3R1cmVzIGJlIGluIHVhcGk/DQoNCj4gKw0KPiArc3RhdGljIGNvbnN0IHN0cnVjdCBu
bGFfcG9saWN5IGRybV9hdHRyX3BvbGljeV9yZWFkX29uZVtEUk1fQVRUUl9NQVggKyAxXSA9IHsN
Cj4gKwlbRFJNX0FUVFJfRVJST1JfSURdID0geyAudHlwZSA9IE5MQV9VNjQgfSwNCj4gK307DQoN
CkkgbWlnaHQgbWlzcyBzb21ldGhpbmcgaGVyZSwgYnV0IHdoeSBpdCBpcyBub3QgYSBzaW5nbGUg
cG9saWN5IHN0cnVjdHVyZSANCndpdGggZW50cmllcyBmb3IgRFJNX0FUVFJfUkVRVUVTVCBhbmQg
RFJNX0FUVFJfRVJST1JfSUQ/DQoNClRoYW5rcywNClRvbWVyDQoNCj4gKw0KPiArI2VuZGlmDQoN
Cg0K
