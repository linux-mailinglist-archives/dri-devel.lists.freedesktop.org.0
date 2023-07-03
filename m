Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 974CD745BE0
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jul 2023 14:09:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 953CD10E0E3;
	Mon,  3 Jul 2023 12:09:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2070c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe13::70c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7759810E0E3
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jul 2023 12:09:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RPYFqyj6ONqnbpsgnKF3QAXc56jHSPgSwT4INm9Rlmf/dWUwkfg32TU7WG4kZWrWCmOn66Ml5PpgIsKY7r4fZF0Ze3yQIk2cHso+CcAPy60hfBiuaMDDwKctBpriMCWRcXUsJGUA3Kki3rnYrRaV69AxRGmcPuBThMCrdaoGoHac5qTsYzaGltxYJI4IKayIQdHCDtHhTGf3OvtLyAWU1p3iBcHcBAMwf9oUhxUyrD7zxxKx6c27iesXqsprtznP/1/FiXSBTawvq5n9aXg75hsWDZHTvQm63alwxLU4k25jf5eVrwxLsdPGeUBSplVyMAfZYWrLrSanEyFT84cU3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WGXWRBTpUXMD4gUOtWrjgFYlGg3rwDusCwfZthFRzvA=;
 b=HnCKkOdCGn+eRzzlmLyWvmPTkil/rqQTAq3McU9AbQBJ4IoB2PnlGNvXX97KG4yv6M22PVTYZYhzFJb4XU8HKYyi47cwNqRekR9Uiub3DrW7e/1FfUfaj3jATT//rS6BuN6vQZxOnyGZjXSewWa7Cil6pE53YrDZqMDGy3GSdLQzrEybvqI7p49zuBJrbY/Hr61Df2n58P/I9GwDJIHfR36SDmrzAMCfMregeyXranCdRHQq6RgpVIkns9kCLY9+dsynkBW8CXHJ5Vcv0MjspY8noV+uUK1uq8pMiFnCvtsrPOldPS97b9kCfLNKJd/aGhhq8uigRyLZr7mACTZeZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=habana.ai; dmarc=pass action=none header.from=habana.ai;
 dkim=pass header.d=habana.ai; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=habana.ai; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WGXWRBTpUXMD4gUOtWrjgFYlGg3rwDusCwfZthFRzvA=;
 b=ODE7Y7GjFkxpozkSs5qCIkyia00Mtp0Eg2jnxGawE/StcI1Vj8ChbbmDrKdMJO1j0RTE6efqGFtJvPgkW6raeNLtc8VlUg1xVi0WCNeEMBC3m+yGDPOgirhKk0mwHLFO0qBj6vMRBi4PhcUEbpR+Th6l6Avo+tI9HEfOka1824eFO4x70JDBE93NAc/5Sr0Ztfhy5ZbKTyOoYLV1rWWPelUHd0GjumckZvPdnWXXY9J+/br7DLynqclmxIyz1tleyfi43HlKeeswr5oey/oNQJU3pe90Y+euNwJh5LYj/1Fdz8Na3ALG5NEKVNoyrc3+v5GRDsrXNb1jlHmTmSv4aQ==
Received: from DU2PR02MB7573.eurprd02.prod.outlook.com (2603:10a6:10:2d8::6)
 by PAWPR02MB9784.eurprd02.prod.outlook.com (2603:10a6:102:2f2::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.13; Mon, 3 Jul
 2023 12:09:16 +0000
Received: from DU2PR02MB7573.eurprd02.prod.outlook.com
 ([fe80::b014:3092:645b:2dc0]) by DU2PR02MB7573.eurprd02.prod.outlook.com
 ([fe80::b014:3092:645b:2dc0%2]) with mapi id 15.20.6565.011; Mon, 3 Jul 2023
 12:09:16 +0000
From: Tomer Tayar <ttayar@habana.ai>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] accel: make accel_class a static const structure
Thread-Topic: [PATCH] accel: make accel_class a static const structure
Thread-Index: AQHZo6Sf77ZacMX1vUWACyClk3t5jq+oBxYA
Date: Mon, 3 Jul 2023 12:09:16 +0000
Message-ID: <1caf16e9-f066-f889-278c-fe1c242930c3@habana.ai>
References: <20230620182528.669526-2-gregkh@linuxfoundation.org>
In-Reply-To: <20230620182528.669526-2-gregkh@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=habana.ai;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU2PR02MB7573:EE_|PAWPR02MB9784:EE_
x-ms-office365-filtering-correlation-id: 7f58d05b-00ac-4f4b-f26e-08db7bbe52dc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Pcg6gTKp3H7e2BgFQR3yqBNvMhIjiby388StvG9x5Klw/XzUHW3C64IxgZYQcaVDY7jZBpQreRTHCfd7ZGqx5OHvadV1vUVimb8hkqFMuygFzdEKTRFcz6UF/odhNvxFl21H8YyUOPbhFg70E1tuImKGpATOzmBOroTdSpyqvbMbn0+iRWLrXOQIiEgzWfEnXQi9GBiWBFg5GouIEkZdtQyIR2hSGFvEs3vGnXWeRZbZ4NmBs5N4RRSl0+48ZBzuJ859JpP90kByxr9kEWc27Ore7HW0IHjj039gpQGnRXpGNOCzm4DvdgjdG+lAMorbF5IxP49WVOCfhboxghZ10/xXP4/dsXcfeyWT9q9hKuYbOjXQaRf4FCPMNLWf8bmDBZAhGxrHczZj6egvug6vEPEZ2FSSk3aPnQjbIAv27j7qaG18uizUoohtFla3ROk/DGzZBskwintLa2ZMGwfuqYrBAydbAH1+/liGRsqs0XnjC/cPAQmS5rCF5b2glVveM/aN9hlFRtQiUkT0fuWNhE/1hajUzWwT1mfMJfa99L0ZFmVTa9xvz69bp8VD49cgWvUIvK5AlCbd81lT7LU41R2E6LYRmflfHWU+LrerDBhviv8qRlON391grr225eTEh/SqeMM7m4PlK4s9xz+r6rXLUpO/8VcgYRntrMny9LjmEp7GUH1QvWsOk3Qa+KbR
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU2PR02MB7573.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39850400004)(366004)(376002)(396003)(136003)(346002)(451199021)(5660300002)(83380400001)(6486002)(38070700005)(122000001)(4326008)(71200400001)(38100700002)(82960400001)(91956017)(41300700001)(64756008)(66446008)(66946007)(66476007)(76116006)(66556008)(316002)(2616005)(8936002)(8676002)(31686004)(53546011)(31696002)(26005)(186003)(6506007)(6512007)(110136005)(54906003)(86362001)(36756003)(478600001)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TlYzRnlOZXRlaDFRNXE1TjJDQW05bFlCbThIdFFDQlU1MUc5NjIydG5MTFlo?=
 =?utf-8?B?anE3Q1ZKZndRUVNKQ2xQWTNra3VhSzRHaVJVWExRNzE1QVZNY3ozSkpmMFg1?=
 =?utf-8?B?eStmMndTT3dkazBiR2EzRXV1RHk3NXBPY29HYmtmNWpZcnR1RkFXSERGbWRu?=
 =?utf-8?B?dVMwTFZXUkNVdnhJbHdRT2VuRGF3SGp6dVpoUlc3T0tIWjV2eUpCMHhGeldK?=
 =?utf-8?B?ZW00ZkpGeHNGMGlGWDU3RkxtNHNWeHJRYkdtTFBkdUJRUzB3M1I1cVhwQW8w?=
 =?utf-8?B?L2FUZnBvWjNTS3BObkd5N1NLRVNhT0k1ZjJ4VnZrYWRMTmMvdHJoZFk5S21E?=
 =?utf-8?B?R2JaS3kwMkpaZFg4ZG94dm5SanVpMFdWUCt6UXczZE00NEFsbGFEL2F6ZVRj?=
 =?utf-8?B?emE0VWJWVmozRVVNM2l5bysyNlliNndGM2ViVW92MkVCQmZKYWl5Rmlzelk0?=
 =?utf-8?B?VWgyd0JZcnVpQWNmWHRNOGtFNTlEVnZMU3RzTUJaYkx1RzROOEUvamQyVkoy?=
 =?utf-8?B?VHd2aWNaWWFZTmtDTklmNUQzSnBHSEFPdFhrd21nQ1hKVk9IZjFiTHJjUkdK?=
 =?utf-8?B?ZkUrVGRML2o5ZkZXOU5TWHFZMHZPNEJzQjYwTTRWN2ZGbC9DWTRCclNBRGtl?=
 =?utf-8?B?VmV4SmllUUlOSW81WE5xenlrdFdDNzg5eHo1RW5xd0ZyTWFCQU0wcXlWbFBB?=
 =?utf-8?B?bDF3cFRGR25uQ2pVY0NQTWd5SmpCRzNoaDMxU1dyRHFhMjBpc2ZQZDcwRjdY?=
 =?utf-8?B?Y0F2aFZmUjArcFV0L2RNMHR5aW1yeEIyd3ExZ2J2V0Y5V2lRSnBhaU5GV0xQ?=
 =?utf-8?B?RkFCemI3TEkzZlQ2MlhUYnhsUFZlYkFuZVNMcDNmc0JTOS9TZG92QW5QU2sv?=
 =?utf-8?B?SWZnMlY3OWtKTkNmMFBIcnZTTEZVZnVDakRxV2lPUFkrYW1qQmNJTHhPdElD?=
 =?utf-8?B?VXNYamFnU3FhejVhSTNTTTBiTmxrSzlXN3ZRNnNOMEhmanRRUG5KakUyZThV?=
 =?utf-8?B?QUJBbGp6eTA5MXBJOUpLUU1QM0svV3dpcjVVb3pKODVjWUREM1F5ZW4rek5J?=
 =?utf-8?B?Slp1bCtZajB4QXNjWmVhelZkMXFrR3kvQzhXdnNKVXBkbDhMUHRVdEsxdEV6?=
 =?utf-8?B?UTl6dG9wWS9jUGpYV1AvM0pPMDVyMmEzN0NZUFJXcjZXL0FKZFJ0aXFRREVO?=
 =?utf-8?B?RmhPdDJkZlhuTHdMSS85ZElLT0JJWFI1WjdNa1pIQkNpdmN1OGtDOW1xSnV3?=
 =?utf-8?B?V2lSK09sc3ZkZGpWeEVvdFlDVVpHcmF2YUdTVkV4MmkrWXJkcHBuUnA0RnFT?=
 =?utf-8?B?SEI3U2phOUJLYWdGQnJFTDFnQVJacmJWTXZuT0hXanFkYmpLaFRlaEJTbUZW?=
 =?utf-8?B?ajQ5OEJ1eER1SnVLSDBNQmx6TUNraUk1R3I4eEpWbkpMbXFaeGtxaUswdG1U?=
 =?utf-8?B?akt6RmVUUnRpL0llZTh4RmFTeGFsOFFKN3ZiRjhTOHhDdG1sVStPZnRoSG9q?=
 =?utf-8?B?d0hiSi9PWDVDRnVOWXZick9qa3owZDhnVC9ydDluYWgxcVlKZlNGdVV6Z2Zn?=
 =?utf-8?B?QWE1TWhOWGlxVFIwc3VDZkNNQVJpM0c4SWxWc3A1eC84ekJ2QytrU1BsSEM2?=
 =?utf-8?B?WmtmRU5XZDg4V0Z4UC9QV1BSQlIwWjBac3A5M3FLNEpBeHVvZGdFeHVXb3Fn?=
 =?utf-8?B?ZnFQS3d0czFYWEZSYS9HajRXdzJPSlZPSVNtdGhnYTRSVkF1aUpMckNXNkxY?=
 =?utf-8?B?Y2d3MitrMituTEhKTld4azhJTjF3QWZnUVRrejU2U0twVnhqZzJsMnppN2NB?=
 =?utf-8?B?VGpHb3E3T1F5TEVlVWRWUE9MMFU3WVc0S3U3ZVdKWC9zaHNzYWlnbWNGa2pG?=
 =?utf-8?B?c3VQdTBua3NFanNac1RXVHBsdFJnSkJzQ2REaEFVdjJwSlRxWFRFT0toTm91?=
 =?utf-8?B?czI0WUVxSmJVYkI0N1lsWDJUTVFJYkJQb0pvZHh5Mm5tcjlFeVo4T0N0SHZn?=
 =?utf-8?B?VFZFaFEwb2hHeDJOOXFzWGt3NERsV24xTVh5MHd6TVovUGxabU1Iak4vbGZr?=
 =?utf-8?B?SHMvNk1icDRXeDNtZlVWSi9uaFVGOXpCMTF4bnRob0FUdVkvd0ozYitpOUh2?=
 =?utf-8?Q?a4lc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D4622DF94B3FC9458F06F8B5F9C1E38F@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: habana.ai
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU2PR02MB7573.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f58d05b-00ac-4f4b-f26e-08db7bbe52dc
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2023 12:09:16.7258 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d4d4539-213c-4ed8-a251-dc9766ba127a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /FtARuJSNP/u5IeSmF5DhXiF5SYwi+xwB59rLDov/Ysrp/wFS3n6mUvLt/GZI2JroTQN9l0oukmHcfmYBzRCHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR02MB9784
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
Cc: Oded Gabbay <ogabbay@kernel.org>, Ivan Orlov <ivan.orlov0322@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAvMDYvMjAyMyAyMToyNSwgR3JlZyBLcm9haC1IYXJ0bWFuIHdyb3RlOg0KPiBGcm9tOiBJ
dmFuIE9ybG92IDxpdmFuLm9ybG92MDMyMkBnbWFpbC5jb20+DQo+DQo+IE5vdyB0aGF0IHRoZSBk
cml2ZXIgY29yZSBhbGxvd3MgZm9yIHN0cnVjdCBjbGFzcyB0byBiZSBpbiByZWFkLW9ubHkNCj4g
bWVtb3J5LCBtb3ZlIHRoZSBhY2NlbF9jbGFzcyBzdHJ1Y3R1cmUgdG8gYmUgZGVjbGFyZWQgYXQg
YnVpbGQgdGltZQ0KPiBwbGFjaW5nIGl0IGludG8gcmVhZC1vbmx5IG1lbW9yeSwgaW5zdGVhZCBv
ZiBoYXZpbmcgdG8gYmUgZHluYW1pY2FsbHkNCj4gYWxsb2NhdGVkIGF0IGJvb3QgdGltZS4NCj4N
Cj4gQ2M6IE9kZWQgR2FiYmF5IDxvZ2FiYmF5QGtlcm5lbC5vcmc+DQo+IENjOiBkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IFN1Z2dlc3RlZC1ieTogR3JlZyBLcm9haC1IYXJ0bWFu
IDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz4NCj4gU2lnbmVkLW9mZi1ieTogSXZhbiBPcmxv
diA8aXZhbi5vcmxvdjAzMjJAZ21haWwuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBHcmVnIEtyb2Fo
LUhhcnRtYW4gPGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPg0KDQpSZXZpZXdlZC1ieTogVG9t
ZXIgVGF5YXIgPHR0YXlhckBoYWJhbmEuYWk+DQoNClRoYW5rcywNClRvbWVyDQoNCj4gLS0tDQo+
ICAgZHJpdmVycy9hY2NlbC9kcm1fYWNjZWwuYyB8IDIxICsrKysrKysrLS0tLS0tLS0tLS0tLQ0K
PiAgIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDEzIGRlbGV0aW9ucygtKQ0KPg0K
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9hY2NlbC9kcm1fYWNjZWwuYyBiL2RyaXZlcnMvYWNjZWwv
ZHJtX2FjY2VsLmMNCj4gaW5kZXggNGE5YmFmMDI0MzllLi4yZGMxODdlMWVlNDEgMTAwNjQ0DQo+
IC0tLSBhL2RyaXZlcnMvYWNjZWwvZHJtX2FjY2VsLmMNCj4gKysrIGIvZHJpdmVycy9hY2NlbC9k
cm1fYWNjZWwuYw0KPiBAQCAtMjEsNyArMjEsNiBAQCBzdGF0aWMgREVGSU5FX1NQSU5MT0NLKGFj
Y2VsX21pbm9yX2xvY2spOw0KPiAgIHN0YXRpYyBzdHJ1Y3QgaWRyIGFjY2VsX21pbm9yc19pZHI7
DQo+ICAgDQo+ICAgc3RhdGljIHN0cnVjdCBkZW50cnkgKmFjY2VsX2RlYnVnZnNfcm9vdDsNCj4g
LXN0YXRpYyBzdHJ1Y3QgY2xhc3MgKmFjY2VsX2NsYXNzOw0KPiAgIA0KPiAgIHN0YXRpYyBzdHJ1
Y3QgZGV2aWNlX3R5cGUgYWNjZWxfc3lzZnNfZGV2aWNlX21pbm9yID0gew0KPiAgIAkubmFtZSA9
ICJhY2NlbF9taW5vciINCj4gQEAgLTMyLDIzICszMSwxOSBAQCBzdGF0aWMgY2hhciAqYWNjZWxf
ZGV2bm9kZShjb25zdCBzdHJ1Y3QgZGV2aWNlICpkZXYsIHVtb2RlX3QgKm1vZGUpDQo+ICAgCXJl
dHVybiBrYXNwcmludGYoR0ZQX0tFUk5FTCwgImFjY2VsLyVzIiwgZGV2X25hbWUoZGV2KSk7DQo+
ICAgfQ0KPiAgIA0KPiArc3RhdGljIGNvbnN0IHN0cnVjdCBjbGFzcyBhY2NlbF9jbGFzcyA9IHsN
Cj4gKwkubmFtZSA9ICJhY2NlbCIsDQo+ICsJLmRldm5vZGUgPSBhY2NlbF9kZXZub2RlLA0KPiAr
fTsNCj4gKw0KPiAgIHN0YXRpYyBpbnQgYWNjZWxfc3lzZnNfaW5pdCh2b2lkKQ0KPiAgIHsNCj4g
LQlhY2NlbF9jbGFzcyA9IGNsYXNzX2NyZWF0ZSgiYWNjZWwiKTsNCj4gLQlpZiAoSVNfRVJSKGFj
Y2VsX2NsYXNzKSkNCj4gLQkJcmV0dXJuIFBUUl9FUlIoYWNjZWxfY2xhc3MpOw0KPiAtDQo+IC0J
YWNjZWxfY2xhc3MtPmRldm5vZGUgPSBhY2NlbF9kZXZub2RlOw0KPiAtDQo+IC0JcmV0dXJuIDA7
DQo+ICsJcmV0dXJuIGNsYXNzX3JlZ2lzdGVyKCZhY2NlbF9jbGFzcyk7DQo+ICAgfQ0KPiAgIA0K
PiAgIHN0YXRpYyB2b2lkIGFjY2VsX3N5c2ZzX2Rlc3Ryb3kodm9pZCkNCj4gICB7DQo+IC0JaWYg
KElTX0VSUl9PUl9OVUxMKGFjY2VsX2NsYXNzKSkNCj4gLQkJcmV0dXJuOw0KPiAtCWNsYXNzX2Rl
c3Ryb3koYWNjZWxfY2xhc3MpOw0KPiAtCWFjY2VsX2NsYXNzID0gTlVMTDsNCj4gKwljbGFzc191
bnJlZ2lzdGVyKCZhY2NlbF9jbGFzcyk7DQo+ICAgfQ0KPiAgIA0KPiAgIHN0YXRpYyBpbnQgYWNj
ZWxfbmFtZV9pbmZvKHN0cnVjdCBzZXFfZmlsZSAqbSwgdm9pZCAqZGF0YSkNCj4gQEAgLTExNiw3
ICsxMTEsNyBAQCB2b2lkIGFjY2VsX2RlYnVnZnNfaW5pdChzdHJ1Y3QgZHJtX21pbm9yICptaW5v
ciwgaW50IG1pbm9yX2lkKQ0KPiAgIHZvaWQgYWNjZWxfc2V0X2RldmljZV9pbnN0YW5jZV9wYXJh
bXMoc3RydWN0IGRldmljZSAqa2RldiwgaW50IGluZGV4KQ0KPiAgIHsNCj4gICAJa2Rldi0+ZGV2
dCA9IE1LREVWKEFDQ0VMX01BSk9SLCBpbmRleCk7DQo+IC0Ja2Rldi0+Y2xhc3MgPSBhY2NlbF9j
bGFzczsNCj4gKwlrZGV2LT5jbGFzcyA9ICZhY2NlbF9jbGFzczsNCj4gICAJa2Rldi0+dHlwZSA9
ICZhY2NlbF9zeXNmc19kZXZpY2VfbWlub3I7DQo+ICAgfQ0KPiAgIA0KDQoNCg==
