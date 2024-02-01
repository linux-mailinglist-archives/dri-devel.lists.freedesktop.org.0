Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5796A84533A
	for <lists+dri-devel@lfdr.de>; Thu,  1 Feb 2024 09:57:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DEFA10E8B1;
	Thu,  1 Feb 2024 08:57:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC12110E87E
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Feb 2024 08:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1706777847; x=1738313847;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=FjI2+9/XkFQ8vR7D8kihwOJjSO5VZvOshYNhG4dVZ4I=;
 b=uS1XTJ3RO5eB0GS/dDDbLBdl2hyDtSPjmaV7VkabXZ2YJKiKLIOS9kmk
 84RjMmkImJDSh/xo0o8LVpI2Pxac7pZNbJnqDRKEXHWdO25hSRpwhG5wM
 hsxUuMd89DDBS9V/6YyDS50FtuZnn/qzIHQ+3JSbugSqKjx0e0cCu7VtM
 mWv+wAchwiJct3d6/wFxASYMsOYIgBB8sKbOzYmxW77j1gO55e7g12LO9
 3BMULFbhGstpJp1wzivK0/vF2khy0z2pCwxY72zrw74X+YoTBltDa7gZB
 17pbMK4Tnv/c8W3PuG1DQHh+pGGTwqNfOFh5BzjBDdDbqKwFMTSPQRlvv Q==;
X-CSE-ConnectionGUID: u+tG1vvjTpSfDScglv7UpA==
X-CSE-MsgGUID: LaXAQTBJTEy/Y84MqOQpWQ==
X-IronPort-AV: E=Sophos;i="6.05,234,1701154800"; d="scan'208";a="16940676"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 01 Feb 2024 01:57:19 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 1 Feb 2024 01:56:49 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (10.10.215.250)
 by email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 1 Feb 2024 01:56:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JhBf9v28yPm0Ma1aDns8wjCh5q95mQfUdb8kulMootQmSMB9600bf6MtZfS2qR2Cb31RrKc0WRUD5JHZXysqeT31kVT+c4IWh8h258SxAk/vbPR+ryVcu6P4rAYN/53IWs3TMNK92eABK0/nZk7HReme80lA03RVrn6+9VpTLa8/Qd/sDbg9YI9KhPq2KV68g9LqoKX+tL8Q5MSD9hkMhOeUymJv1l0VLAXxnMdyjAJ4B9dcwSUr+H8nR3S+RphFBXCxGMH08sPXLpm3VuimhCQSzJ0L3s4vLOTewTXJe5sdlrssoQ8Zw+38ekamf+qfB9ZFjidyfdW6PCXMqeFyEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FjI2+9/XkFQ8vR7D8kihwOJjSO5VZvOshYNhG4dVZ4I=;
 b=XmXOJXVj+iD7N6r7CiYPC92xyRges7IKhSeAYTfmSTqtWBDTYDxJrZ4gp4EUpfblmDHREIt6CDuJzVCAYyivfpnFF1u0RYZi6QTT1gtvbZrRhLNyHdUp4jdD5UOxsi54FWvpP2RTVclI7bIPiFBdYeyT88clF2x3Uu/d9yHnOH5s09IJH3P3lKIS6EqYUVnd/IXvYCUdO7oJwEUUgWZN2czs2fbbBC9GYNghU0Bz2K5BzvE1AAZSUYcppEwmArDFnZU5duJI/JJPz0r0xFdpfYkzRy4LEJjKwZMKuvrQHu0UKmgRwhk07kLCgWmD7QHyXmWi4Dq2lQR/e7STFJGg5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FjI2+9/XkFQ8vR7D8kihwOJjSO5VZvOshYNhG4dVZ4I=;
 b=ivy4kov9Wd+Ho5AmhZSvlZAN4nvIV8wJV0Sz4wgMp0CkpYfwDpYyJxjR0hzbf1xDq+y010cd04panE/CM8YLzRXnfiaGpq/xVULcANy/Kfv8B/0tqZbmrdG9bsTqjth5ot3RCQcjmk8c6Z85eY1vfBVQ5Bjt+OfWjVfgz42gsBC5V/MrGCaWIKU9Y0z5OPA2F/ojbOjlYSE+uquJCmN6s400vfK89/R48C7pYJqlQNzeWAEOghv7ZW28hmmprOrRKmfMC6ExUBdj8NMb3fbKWQgsWlwx5+2EQuIXMJgOzVOn9kbVQ+sTB2fthPpQp8FiEVvtGf5/xEsrMiOFZbdL0w==
Received: from PH7PR11MB6451.namprd11.prod.outlook.com (2603:10b6:510:1f4::16)
 by CO1PR11MB4978.namprd11.prod.outlook.com (2603:10b6:303:91::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.26; Thu, 1 Feb
 2024 08:56:45 +0000
Received: from PH7PR11MB6451.namprd11.prod.outlook.com
 ([fe80::80b9:80a3:e88a:57ee]) by PH7PR11MB6451.namprd11.prod.outlook.com
 ([fe80::80b9:80a3:e88a:57ee%3]) with mapi id 15.20.7249.024; Thu, 1 Feb 2024
 08:56:45 +0000
From: <Dharma.B@microchip.com>
To: <krzysztof.kozlowski@linaro.org>, <robh@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: display: bridge: add sam9x7-lvds
 compatible
Thread-Topic: [PATCH 1/3] dt-bindings: display: bridge: add sam9x7-lvds
 compatible
Thread-Index: AQHaTQ1DHzJ2CWHeI0qiVB4kob88PbDl+48AgAAM8gCAALjbgIAMBTGAgAIok4CAADpngIAAFYcA
Date: Thu, 1 Feb 2024 08:56:45 +0000
Message-ID: <5047d939-7831-4414-b4f4-94cec78a0446@microchip.com>
References: <20240122082947.21645-1-dharma.b@microchip.com>
 <20240122082947.21645-2-dharma.b@microchip.com>
 <10a88fc6-2c4c-4f77-850f-f15b21a8ed49@kernel.org>
 <20240122-privacy-preschool-27dc7dcc5529@spud>
 <01c4fc05-9b3f-4007-9216-444a4306efd7@microchip.com>
 <20240130191255.GA2164257-robh@kernel.org>
 <f980706a-2bc7-46f2-8c3e-1cc62a1e2cb7@microchip.com>
 <32fd4622-1bc1-48f7-85f0-e04fcb6c0f88@linaro.org>
In-Reply-To: <32fd4622-1bc1-48f7-85f0-e04fcb6c0f88@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6451:EE_|CO1PR11MB4978:EE_
x-ms-office365-filtering-correlation-id: 99cd4fa4-62ab-4265-37a2-08dc2303b792
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MY4x1KVpOlZxrbHKRcMl9ldGQxePjNpa1TTNuPpFtiEUpYdoQR4jWuWFt+9V3Kz2IB5iBqMezKoYRW4OzBzz5yjh86CmutJaFfX2wfmDtvqpVhdwzV74BEoP7RZqBMYp2qxwYgLWVvr4onOF8KTH1OZq1fuI1wTePd35s3f6p3DVeWXU9A5PbqoCH4KWrKEj0mf+OkSLajAnXW/EJmChQGVUlWgdnCY/d5GH54yg3q+byzPmcKNsmB27OfsAUdKwm8qMVgDaKqalRaxExFSEJCSkzYvFB5WU4wM8sPBFai2bds/MMKvtb22OcQD5wmv6jiX6E2OttHNJ2YgNSfGohwV0cggMOgO3P2ld7hfOdqRWtBC763Y7gRRyK7qz7Eyqfh8yS7EqSJqoHiKqqr/yr82mr25VJamPKSpAQ0x9rUAhAsq5j/oPGefR4WHJRbtHjjVU3ESDiL1vB3mAOgApxZZX7MQ6HEuzICJ0aitqKBs/uRZagbOLV/d2RzJgoa/Qa7BADO95YwFS0EmfWfwHAmtVxCniqjj3ROhgF/pj5Wg0b2OsynGM/L/dQlNCw/D6t99k7342p9J9CDMktRZ4EnGaiXxCXMD2Ae82TVs9/VhbIMk8GdZ3eUe/X89LviVeU5usU4OtfT2kEZ9kpDUIwyxcvoCuuijKn8L3MmTuhrP4aKq9nXHT1tVrx8eqLXGE4OLFQJveE/cFuwsBRmpjeaCgVcwWyVZ0QVSE/WcYpis=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6451.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(346002)(376002)(136003)(366004)(39860400002)(230173577357003)(230273577357003)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(31686004)(110136005)(76116006)(64756008)(54906003)(91956017)(66446008)(2906002)(7416002)(5660300002)(316002)(66946007)(66476007)(66556008)(8936002)(4326008)(8676002)(478600001)(38100700002)(31696002)(36756003)(86362001)(6486002)(26005)(6512007)(71200400001)(122000001)(2616005)(38070700009)(107886003)(6506007)(41300700001)(53546011)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bDJWWVdDbitJa24xNzR3YzU5ZFV3dm96eitpTXhWQkZEY0JPYXM0YnhaS281?=
 =?utf-8?B?V2hjazU4a1h5dGpqa0dEaDQ0M0FNNm94TmdxcE1DdGlEYUZRdHovYVdia2FQ?=
 =?utf-8?B?ZUduMzR2MEk4alYzUy9qM2xYWFBjWW01bG1EemsrdXJURkY5OXZOem1OTnRH?=
 =?utf-8?B?N2gwclVia1R2bDlHazdZMXg0MTJleVlHbUlaZGZjNWZQeEJuU3dKbWFVbWJV?=
 =?utf-8?B?VWxldU1MczNmSjZuSkxkWm9EdEltRlBRd3k4N2NMU3RtZEJBSmZ6UEJUNUg4?=
 =?utf-8?B?UnNFVkk2Q0E0NmNPMGg1Yk9DMklPVmxZN2Y5RWhGRERtOWQrY3NRajZPeVE3?=
 =?utf-8?B?MWZIc20xR0kvZURIU0UyU0Nzb3R2dldwZFI3UXE3bng0dFQveGl6SVcvcXdD?=
 =?utf-8?B?OFJSVlFYQkRvaGViYjRBN3E3ZFpPYU5LeXZQeWJQNG1JY29XMmZHQmVRS3Jz?=
 =?utf-8?B?bVUwRjFBa01zbWlaUlJ0bU1XT0VqNXhXQWppNmE3KzA3T2JjYWZRejluR1Vk?=
 =?utf-8?B?VG04OHM2NDI4WGFNOXprZmJHUndqRVF1dDlSK3ZLajROTGViRUpRYzBUV2VZ?=
 =?utf-8?B?SUtBdy9XVXFYMjZoTHBVSExtRnJtQlNURHhBemNiazA4akZ0SlV4S0FKOFBM?=
 =?utf-8?B?TkFuQndmWnN4RUZkeEVDVGE5SjhOQXJOWUdORFQxRWtHVkVPQmpNTXRqaFVN?=
 =?utf-8?B?Vzh1dUhHR1VROWhPcFVFSGRNanp1OTIrSHFqc1JEcFJYU0tRL1UrQkErNWFt?=
 =?utf-8?B?ejZWeXFSanpxZXN2SlJMcjQ4OFF0SmtOYkdQT3R2U01vQi85NFBQdkhWSUZw?=
 =?utf-8?B?Wmc5VXEyUm4vN0g4NThyM1RQNzA2VFlsL0FLNmZJNXgxdzlRV2tZTEM3dXRF?=
 =?utf-8?B?S1hnUC81UHhnckM5YlJFR0MwTWsyb1JhSHN6UDQzV3dvTTVZVTJVaWdPTk5t?=
 =?utf-8?B?K0JDK09DeitEUVd0SVJTelQ1OU1MMndTSXpFR01QK3g4cHBTcE5McWFaUkUr?=
 =?utf-8?B?bzR5THJHdTdKZjlYRUEyejg1aWRIYXBMVXFsTjFHK2hHQ0xnTGphaERpU3ZM?=
 =?utf-8?B?MHI1RmdVOUpTR28yWnJ6RG9OaFBLdGNpY3lGWEFWRDhrMU5NT3NReWUxZGlj?=
 =?utf-8?B?VWN0VldKZis0dlo2eGYyc2hlRHhDcWtGSU9yNHI5OFZ2c211d01qcHB0RmZk?=
 =?utf-8?B?aWtlNVpwZWJzck9XMzdaOThZeVRnRWEzaVFMM25OckVaUERrTTIxbGRiZzRC?=
 =?utf-8?B?dEtKR2U0WTVPWno1K0F4ZTlmQlV6RUZvLysyOTRnWHNHaHhBdTlWSVpyQ3Vt?=
 =?utf-8?B?RzgvaHcwYW9tSXpZdHkzUW5PWE9Oai8yTUkrMzNRTWlRMnNwOWhRa0RJMkhR?=
 =?utf-8?B?Z0Q4TXRmZDJIejlwcHdma0thMEErVjFRb3RyY3VvZk1PWXJrbk1ZbS9ETDBP?=
 =?utf-8?B?V05LTVRBMVdjQ1RhcnprVDFteWRiTjRacHpOMGk1ZXdOZkx1U1dCc2YwNmZM?=
 =?utf-8?B?VFV3SVhDTGswZVp2RVJRRnhhSnhYNVh3SXJVZStjVVU5NWpJbE5WNHVOMFps?=
 =?utf-8?B?cFNaUGZaS2ZlTHJBWjFJbUJ0YUJLOXFrZHBFU3JMcFF2aCtMeGJtWHRzT3F4?=
 =?utf-8?B?bi85RVQrZlQ1UkxHaHZJZFZXMk5BR2EvM1k0QjlSdFQ4amxVNkQ2ZlJVdzJp?=
 =?utf-8?B?NW05QkJyMEQ3TXJlSVZBTTNHak9SUWFlUDN3QmhmRUFHK0pzZ0lVbFFvbVQ3?=
 =?utf-8?B?cTBVNU5yVTRvWEF0bjJyTVN0akVmQWJreSt5Nk9RblF2THdZVDI4ektyWTJC?=
 =?utf-8?B?MEl5YkZDNHcwNWRWV0hLRGNUQkhTS0U4S3dFWnYrcFF4OVZUTjhwVWhoUHAr?=
 =?utf-8?B?UCs4UUZsb1M4NDB3M2Jwc0NlTXB3MHZBa3dLeHlhVElJcnRsamJ1enRqTS9y?=
 =?utf-8?B?aiszV3Y0MGIwWG9PWk1naDRWbGExeVgvRnM1VCtxRlVuL0Nzd2FMaWNyZExH?=
 =?utf-8?B?S3FnbUk3Z3d5WnNWUHJMN1FDWUZXWE4ra3BvYkpCOE5XQkIrUDFjd3ZVUVpQ?=
 =?utf-8?B?czhjYWhmMDdrNnA2eWkyekM1NWlRa01DZWpPTE9NMGdYdkFMSE1Jem5TTnRr?=
 =?utf-8?Q?hE215PoEdZ833in59OHA4zq7w?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A8F5484487D30B4980382625174E1C85@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6451.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99cd4fa4-62ab-4265-37a2-08dc2303b792
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Feb 2024 08:56:45.1393 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: M22RHRAsXxsQTWHopZaxPQPlZch2E+l0vS79Fb5WmVQ4D80y6bmwYbLYB+wx4BPh0qbUk2tHxoMZExVZa+4PoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4978
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
Cc: Manikandan.M@microchip.com, neil.armstrong@linaro.org, conor+dt@kernel.org,
 jernej.skrabec@gmail.com, rfoss@kernel.org, daniel@ffwll.ch,
 krzysztof.kozlowski+dt@linaro.org, jonas@kwiboo.se, tzimmermann@suse.de,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, krzk@kernel.org,
 mripard@kernel.org, devicetree@vger.kernel.org, Linux4Microchip@microchip.com,
 conor@kernel.org, andrzej.hajda@intel.com, Laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDEvMDIvMjQgMTowOSBwbSwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToNCj4gRVhURVJO
QUwgRU1BSUw6IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5
b3Uga25vdyB0aGUgY29udGVudCBpcyBzYWZlDQo+IA0KPiBPbiAwMS8wMi8yMDI0IDA1OjEwLCBE
aGFybWEuQkBtaWNyb2NoaXAuY29tIHdyb3RlOg0KPj4gT24gMzEvMDEvMjQgMTI6NDIgYW0sIFJv
YiBIZXJyaW5nIHdyb3RlOg0KPj4+IEVYVEVSTkFMIEVNQUlMOiBEbyBub3QgY2xpY2sgbGlua3Mg
b3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91IGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZQ0K
Pj4+DQo+Pj4gT24gVHVlLCBKYW4gMjMsIDIwMjQgYXQgMDM6Mzk6MTNBTSArMDAwMCwgRGhhcm1h
LkJAbWljcm9jaGlwLmNvbSB3cm90ZToNCj4+Pj4gSGkgQ29ub3IsDQo+Pj4+DQo+Pj4+IE9uIDIy
LzAxLzI0IDEwOjA3IHBtLCBDb25vciBEb29sZXkgd3JvdGU6DQo+Pj4+PiBPbiBNb24sIEphbiAy
MiwgMjAyNCBhdCAwNDo1MToxNlBNICswMTAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdyb3RlOg0K
Pj4+Pj4+IE9uIDIyLzAxLzIwMjQgMDk6MjksIERoYXJtYSBCYWxhc3ViaXJhbWFuaSB3cm90ZToN
Cj4+Pj4+Pj4gQWRkIHRoZSAnc2FtOXg3LWx2ZHMnIGNvbXBhdGlibGUgYmluZGluZywgd2hpY2gg
ZGVzY3JpYmVzIHRoZQ0KPj4+Pj4+PiBMb3cgVm9sdGFnZSBEaWZmZXJlbnRpYWwgU2lnbmFsaW5n
IChMVkRTKSBDb250cm9sbGVyIGZvdW5kIG9uIE1pY3JvY2hpcCdzDQo+Pj4+Pj4+IHNhbTl4NyBz
ZXJpZXMgU3lzdGVtLW9uLUNoaXAgKFNvQykgZGV2aWNlcy4gVGhpcyBiaW5kaW5nIHdpbGwgYmUg
dXNlZCB0bw0KPj4+Pj4+PiBkZWZpbmUgdGhlIHByb3BlcnRpZXMgYW5kIGNvbmZpZ3VyYXRpb24g
Zm9yIHRoZSBMVkRTIENvbnRyb2xsZXIgaW4gRFQuDQo+Pj4+Pj4+DQo+Pj4+Pj4+IFNpZ25lZC1v
ZmYtYnk6IERoYXJtYSBCYWxhc3ViaXJhbWFuaTxkaGFybWEuYkBtaWNyb2NoaXAuY29tPg0KPj4+
Pj4+PiAtLS0NCj4+Pj4+Pj4gICAgIC4uLi9kaXNwbGF5L2JyaWRnZS9taWNyb2NoaXAsc2FtOXg3
LWx2ZHMueWFtbCB8IDU5ICsrKysrKysrKysrKysrKysrKysNCj4+Pj4+Pj4gICAgIDEgZmlsZSBj
aGFuZ2VkLCA1OSBpbnNlcnRpb25zKCspDQo+Pj4+Pj4+ICAgICBjcmVhdGUgbW9kZSAxMDA2NDQg
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL21pY3JvY2hp
cCxzYW05eDctbHZkcy55YW1sDQo+Pj4+Pj4+DQo+Pj4+Pj4+IGRpZmYgLS1naXQgYS9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvbWljcm9jaGlwLHNhbTl4
Ny1sdmRzLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9i
cmlkZ2UvbWljcm9jaGlwLHNhbTl4Ny1sdmRzLnlhbWwNCj4+Pj4+Pj4gbmV3IGZpbGUgbW9kZSAx
MDA2NDQNCj4+Pj4+Pj4gaW5kZXggMDAwMDAwMDAwMDAwLi44YzJjNWI4NThjODUNCj4+Pj4+Pj4g
LS0tIC9kZXYvbnVsbA0KPj4+Pj4+PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvZGlzcGxheS9icmlkZ2UvbWljcm9jaGlwLHNhbTl4Ny1sdmRzLnlhbWwNCj4+Pj4+Pj4g
QEAgLTAsMCArMSw1OSBAQA0KPj4+Pj4+PiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQ
TC0yLjAtb25seSBPUiBCU0QtMi1DbGF1c2UpDQo+Pj4+Pj4+ICslWUFNTCAxLjINCj4+Pj4+Pj4g
Ky0tLQ0KPj4+Pj4+PiArJGlkOmh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL2Rpc3BsYXkv
YnJpZGdlL21pY3JvY2hpcCxzYW05eDctbHZkcy55YW1sIw0KPj4+Pj4+PiArJHNjaGVtYTpodHRw
Oi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMNCj4+Pj4+Pj4gKw0KPj4+
Pj4+PiArdGl0bGU6IE1pY3JvY2hpcCBTQU05WDcgTFZEUyBDb250cm9sbGVyDQo+Pj4+Pj4gV2hh
dCBpcyB0aGUgIlgiPw0KPj4+Pj4+DQo+Pj4+Pj4+ICsNCj4+Pj4+Pj4gK21haW50YWluZXJzOg0K
Pj4+Pj4+PiArICAtIERoYXJtYSBCYWxhc3ViaXJhbWFuaTxkaGFybWEuYkBtaWNyb2NoaXAuY29t
Pg0KPj4+Pj4+PiArDQo+Pj4+Pj4+ICtkZXNjcmlwdGlvbjogfA0KPj4+Pj4+IERvIG5vdCBuZWVk
ICd8JyB1bmxlc3MgeW91IG5lZWQgdG8gcHJlc2VydmUgZm9ybWF0dGluZy4NCj4+Pj4+Pg0KPj4+
Pj4+PiArICBUaGUgTG93IFZvbHRhZ2UgRGlmZmVyZW50aWFsIFNpZ25hbGluZyBDb250cm9sbGVy
IChMVkRTQykgbWFuYWdlcyBkYXRhDQo+Pj4+Pj4+ICsgIGZvcm1hdCBjb252ZXJzaW9uIGZyb20g
dGhlIExDRCBDb250cm9sbGVyIGludGVybmFsIERQSSBidXMgdG8gT3BlbkxESQ0KPj4+Pj4+PiAr
ICBMVkRTIG91dHB1dCBzaWduYWxzLiBMVkRTQyBmdW5jdGlvbnMgaW5jbHVkZSBiaXQgbWFwcGlu
ZywgYmFsYW5jZWQgbW9kZQ0KPj4+Pj4+PiArICBtYW5hZ2VtZW50LCBhbmQgc2VyaWFsaXplci4N
Cj4+Pj4+Pj4gKw0KPj4+Pj4+PiArcHJvcGVydGllczoNCj4+Pj4+Pj4gKyAgY29tcGF0aWJsZToN
Cj4+Pj4+Pj4gKyAgICBjb25zdDogbWljcm9jaGlwLHNhbTl4Ny1sdmRzDQo+Pj4+Pj4gV2hhdCBp
cyAieCI/IFdpbGRjYXJkPyBUaGVuIG5vLCBkb24ndCB1c2UgaXQgYW5kIGluc3RlYWQgdXNlIHBy
b3BlciBTb0MNCj4+Pj4+PiB2ZXJzaW9uIG51bWJlci4NCj4+Pj4+IFRoZXNlIFNvQ3MgYWN0dWFs
bHkgZG8gaGF2ZSBhbiB4IGluIHRoZWlyIG5hbWUuIEhvd2V2ZXIsIGFuZCBJIGRvIGFsd2F5cw0K
Pj4+Pj4gZ2V0IGNvbmZ1c2VkIGhlcmUsIHRoZSBzYW05eDcgaXMgYSBzZXJpZXMgb2YgU29DcyAo
dGhlIGNvdmVyIGxldHRlciBkb2VzDQo+Pj4+PiBzYXkgdGhpcykgcmF0aGVyIHRoYW4gYSBzcGVj
aWZpYyBkZXZpY2UuDQo+Pj4+PiBJIHRoaW5rIHRoZSBzZXJpZXMgY3VycmVudCBjb25zaXN0cyBv
ZiBhIHNhbTl4NzAgc2FtOXg3MiBhbmQgYSBzYW05eDc1Lg0KPj4+Pj4gVGhlIGRldmljZXMgYXJl
IGxhcmdlbHkgc2ltaWxhciwgYnV0IEkgYW0gbm90IHN1cmUgaWYgdGhlIHNhbTl4NzANCj4+Pj4+
IHN1cHBvcnRzIExWRFMgYXQgYWxsLiBIYXZpbmcgYSBjb21wYXRpYmxlIGZvciB0aGUgc2VyaWVz
IGRvZXMgbm90IHNlZW0NCj4+Pj4+IGNvcnJlY3QgdG8gbWUuDQo+Pj4+IFllcywgeW91IGFyZSBj
b3JyZWN0LiBPbmx5IHNhbTl4NzIgYW5kIHNhbTl4NzUgaGF2ZSBMVkRTIHN1cHBvcnQsIHdoaWxl
DQo+Pj4+IHNhbTl4NzAgZG9lcyBub3QuIEkgd2lsbCByZXZpc2UgdGhlIGNvbXBhdGliaWxpdHkg
dG8gaW5jbHVkZSBib3RoDQo+Pj4+IHNhbTl4NzIgYW5kIHNhbTl4NzUsIGFzIG91dGxpbmVkIGJl
bG93Og0KPj4+Pg0KPj4+PiBwcm9wZXJ0aWVzOg0KPj4+PiAgICAgIGNvbXBhdGlibGU6DQo+Pj4+
ICAgICAgICBlbnVtOg0KPj4+PiAgICAgICAgICAtIG1pY3JvY2hpcCxzYW05eDcyLWx2ZHMNCj4+
Pj4gICAgICAgICAgLSBtaWNyb2NoaXAsc2FtOXg3NS1sdmRzDQo+Pj4NCj4+PiBJIHdvdWxkIHBy
ZXN1bWUgdGhlc2UgMiBhcmUgdGhlIHNhbWUsIGJ1dCB0aGUgYWJvdmUgaW1wbGllcyB0aGV5DQo+
Pj4gYXJlbid0LiBJIHRoaW5rIHdoYXQgeW91IGhhZCBpcyBmaW5lIGFzc3VtaW5nIHRoZXNlIGFy
ZSBhbGwNCj4+PiBmdW5kYW1lbnRhbGx5IHRoZSBzYW1lIHBhcnQgd2l0aCBqdXN0IHBhY2thZ2lu
ZyBvciBmdXNlZCBvZmYgaC93DQo+Pj4gZGlmZmVyZW5jZXMuDQo+Pg0KPj4gWWVzLCBzbyBpcyBp
dCBva2F5IHRvIGhhdmUgY29tcGF0aWJsZSBmb3IgYSBzZXJpZXM/IFNoYWxsIEkgZ28gYWhlYWQg
d2l0aA0KPj4gIg0KPj4gICAgIGNvbXBhdGlibGU6DQo+PiAgICAgICBjb25zdDogbWljcm9jaGlw
LHNhbTl4Ny1sdmRzDQo+IA0KPiBZb3Ugc2FpZCA5eDcwLCB3aGljaCB3b3VsZCBtYXRjaCBzdWNo
IDl4NyAic2VyaWVzIiwgaXMgZGlmZmVyZW50LCBzbyBJDQo+IHN0aWxsIHRoaW5rIHNlcmllcyBz
aG91bGQgbm90IGJlIHVzZWQuIEkgZG9uJ3Qga25vdyBtdWNoIGFib3V0IE1pY3JvY2hpcA0KPiBu
YW1pbmcgc2NoZW1lLCBzbyB0aGlzIHggaXMgYWx3YXlzIGNvbmZ1c2luZy4gSG93ZXZlciBpZiB0
aGVzZSBhcmUgdGhlDQo+IHNhbWUsIG1heWJlIGp1c3QgdXNlIHNhbTl4NzI/DQoNCnNhbTl4NzUg
aXMgdGhlIGZpcnN0IGJvYXJkIHRvIGJlIGF2YWlsYWJsZSBwdWJsaWNseTsgaGVuY2UsIEkgc2hh
bGwgdXNlIA0KdGhlICJtaWNyb2NoaXAsc2FtOXg3NS1sdmRzIiBjb21wYXRpYmxlIGFuZCByZXVz
ZSB0aGUgc2FtZSBpbiBvdGhlciANCmJvYXJkcyB0aGF0IChmZWF0dXJlcyBzYW1lIElQKSB3aWxs
IGNvbWUgbGF0ZXIuDQoNCj4gDQo+IEJlc3QgcmVnYXJkcywNCj4gS3J6eXN6dG9mDQo+IA0KDQot
LSANCldpdGggQmVzdCBSZWdhcmRzLA0KRGhhcm1hIEIuDQoNCg==
