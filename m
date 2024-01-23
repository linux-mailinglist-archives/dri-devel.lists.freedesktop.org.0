Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8E4883860C
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jan 2024 04:31:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 486FF10E778;
	Tue, 23 Jan 2024 03:31:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 731EA10E51B
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jan 2024 03:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1705980670; x=1737516670;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=dTjozMC8e04PCf5WaJUybAuU1wWsqcxHx7dIKOFSkgk=;
 b=jvO3RrSnR7xt8izVwVLxsuqDcYmCb4fUxZwo2eZKlOEIb3Yi6es+e9f1
 m4nvbOs28DwMCb7anAHkYN6mVz59mQLgYf9gRscsDkTcSW/NWiFo+yg5P
 eWiA43IxmITDc7i389QIGtpcI2G9h/g8Tg6Uhx0k7hqb4F0dKX8oY5PNS
 L/IRMgRVj9Jd3z0klxzgE8/1LeGX/4HDQcUHPXBC5a1Tfk4nbAWWQn7Po
 M4tQKzD4Tr4mCguMdyAQ6nL2GEE0iUPlq68j2S1ol0v2IBWAIjfNfmO9r
 h2sKmzn4uU4cbdVvIonDdTz/8NrSZRRliNdfnxjQnetzQIbCSIQz2mas1 g==;
X-CSE-ConnectionGUID: 5v8yxyvOQtC1wL4G7sIMng==
X-CSE-MsgGUID: 21HryRcDTfWYSS8MUYqJaQ==
X-IronPort-AV: E=Sophos;i="6.05,213,1701154800"; d="scan'208";a="245857843"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 22 Jan 2024 20:31:04 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Jan 2024 20:30:43 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.10.215.250)
 by email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 22 Jan 2024 20:30:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VOHreH65uE8Wu9xtvtNxFNFIXqCguSX+bMBqwIGwiLqAa99+z47MwyOAEgAyVAf1J2ry/P1udYCGp7XPBpfjqihWBRbkX5pi0aM0o+OlVMSWRowE41FxiiSXfobXjy8OcvDAJB9/W3gQVfOxmfFmvO6UFAELpJ0lQg8jNaIYNzx3hp97hooo91DQ/6NB+LBTt8SBe5VUGjhEpQYr2PsXt/PKx+27WXV9aYqeu3T34gjIirI2bYR6d/Kk1T0pA5Wq9Ivi+GeAC55oBtbtnn7JPL9J2FNvEOIHVcBx++M1uSOfEcQRjZAT58tr/Ji16LI8KSB5BDX3MGX6bQbLnAeykA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dTjozMC8e04PCf5WaJUybAuU1wWsqcxHx7dIKOFSkgk=;
 b=jN8PLfHvV8vtwlBV3WVd11nHbSpl+LkJQbVgWsvFa1A3D6IFttQtc9jSQVXuHSQtIDkk651MN5KUavfPUICntQKpVdJWyAVYP4SqojzUqOLZDHsOg54MBOAGBpurn2r9fTVzT94CVHAw/09FvKkif22ctuQnO4j95Yan4LR/pfg6HYT92ybTaFttjw3YeCokbZroykI93XkOs8j57zLlAz7vFOd/UNZi2HncEp7QqSFJmPg7rDNlxVVdLrwELC7dVXpFih+fWO/NCGmQ8ZvvZvabwtkNwvdNLpccE83pXPWG/I01ze4iLPqKxCvU9ARxJCNdPoP9WyPnCFNT7Dmmjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dTjozMC8e04PCf5WaJUybAuU1wWsqcxHx7dIKOFSkgk=;
 b=vvW/qFNBoDKGpKU9ruEfx1Rl1adTLM9TteYpmW14cR/O42SC0DhQWdNQPavm9BQrhVUWPqBYAA9JdRd1pxh79qXeb3sGfQqDds/qgU+1Tf2DrtNEqbRYKeYsk/E0HSMeCaDC4p4CUEvzJlOeEkEcZrV1lFSFHMBfZZYlDKnBhYO7mGABCTttjwkOF9iXs6BgqpzH9RHrRIYf/dFSkM7tfBU7Pj1t0l0/g+QqooTCsnGFxa+TwtQJxFDSI6RxKoO+8Jj9bLeRT4760ucXnRdrFwn+n6yfp77DTkq8bqVv2Lw31/ur1SQiBFxSjUgPfYqB7MZLtF1Ou56Xhkq3W2m06g==
Received: from PH7PR11MB6451.namprd11.prod.outlook.com (2603:10b6:510:1f4::16)
 by DS0PR11MB7412.namprd11.prod.outlook.com (2603:10b6:8:152::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.37; Tue, 23 Jan
 2024 03:30:38 +0000
Received: from PH7PR11MB6451.namprd11.prod.outlook.com
 ([fe80::80b9:80a3:e88a:57ee]) by PH7PR11MB6451.namprd11.prod.outlook.com
 ([fe80::80b9:80a3:e88a:57ee%3]) with mapi id 15.20.7202.031; Tue, 23 Jan 2024
 03:30:38 +0000
From: <Dharma.B@microchip.com>
To: <krzk@kernel.org>, <Manikandan.M@microchip.com>,
 <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>, <rfoss@kernel.org>,
 <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@gmail.com>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: display: bridge: add sam9x7-lvds
 compatible
Thread-Topic: [PATCH 1/3] dt-bindings: display: bridge: add sam9x7-lvds
 compatible
Thread-Index: AQHaTQ1DHzJ2CWHeI0qiVB4kob88PbDl+48AgADDZoA=
Date: Tue, 23 Jan 2024 03:30:37 +0000
Message-ID: <40094cda-5620-4273-b181-312452e9f6a1@microchip.com>
References: <20240122082947.21645-1-dharma.b@microchip.com>
 <20240122082947.21645-2-dharma.b@microchip.com>
 <10a88fc6-2c4c-4f77-850f-f15b21a8ed49@kernel.org>
In-Reply-To: <10a88fc6-2c4c-4f77-850f-f15b21a8ed49@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6451:EE_|DS0PR11MB7412:EE_
x-ms-office365-filtering-correlation-id: 934ab5ae-e97c-4d46-748b-08dc1bc3aaf0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: i0Orik/2++BmWnRIwJcf2HCOOWWsf/N6gjeIoeiR2d1NDFAYZ1uifShI3ZOtFFr3AGtIYDFl6EcRYLBOjgniH5iSkEo4QLPgjz+3gXx48rYxEeF4pczYwgfxhLBSud9Inrx0+Jnp28WVdyEKbqMC9Np1/scbmzmLsu5POVZXe6N0HButXbEZNjVQrpmzNpGRClCxwr1oIwNEgO3nQpYJ97wGqv/siW84IQsMPhfQ6YGyNK/PWezUU+c5dTn+wGkM0NHPlTqL3mW0C8nzSlOSrFwzqu6EDdFD+IaGijGqTOG5l0CelIoUER/oyNNr6ljxLGCbmi8JkqhJrnYWJqb9HQbbq7OlW5AKZuO6LD4/FtvngaWsemv4q10ixOmY/BZ2+9Zfuwjl+TC3Eud6w8rHVhmed06PvzvabhHgWs9Zym/PFj1FEICvKWdZQIqlNIKp46PBmTe1YJHZ6bNX0swr7ElIk9rXSoQPDc41WO+0PSgEsH6FfZRsQR8anRDFwB4dCO7gzzTy7psNnSPkh3Qnf9pOKjfGnX8YIwGWjQdO/x08Q72HLbX8zeXtMH3fWjsuWJEvuj8tiLMJrrlfIyVyenVXeUq+wuknwpYATBWLiZN1yiIriW0Ygg3Can9aMBFZaeaPJ65/tXLN/ymqxYZveMm+4Zt7jHF+8PBgIoKmsN7Geaoh3bYxxnipSEvSqTllAHEDhwftQRsuMcm/JoVp0CDQhzQPZGMsoDSM1Q5yY8I=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6451.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(346002)(396003)(366004)(39860400002)(136003)(230273577357003)(230922051799003)(230173577357003)(451199024)(64100799003)(186009)(1800799012)(921011)(41300700001)(38070700009)(4326008)(8676002)(110136005)(316002)(8936002)(83380400001)(5660300002)(966005)(478600001)(71200400001)(6512007)(53546011)(6506007)(66556008)(91956017)(66476007)(76116006)(66946007)(66446008)(64756008)(107886003)(6486002)(2616005)(26005)(38100700002)(122000001)(7416002)(2906002)(31696002)(36756003)(86362001)(31686004)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RFl5WXIvaUJpdjM3VkdKb01xSjJTMlJ6cWtValJDRUtTVlY2Q3pOUkprQ3VH?=
 =?utf-8?B?R21ydVMxNWhNVFEyZ1hYeEJjUFcrUDJMUGQrVWxjSzZibHdDNjNFOXhHRkNy?=
 =?utf-8?B?UWtWMStDRis4T0RRd2wvd3BpY1RMb0NIWkNtN1J5bTEwdVpNbzFXZ1BuV1h2?=
 =?utf-8?B?bmtaVU1kQXNtMDRRUEZYYzFMNnVCQmFnZHltOEV1V0ZjcFBVTmpOdUlndUdC?=
 =?utf-8?B?OUppelV5dG4wK2FQOGxrSEFDUFEvbVpycGFNRXRlUHA1YTdyaUoweVE1dGYv?=
 =?utf-8?B?dHhXZm52MnFXUS95WTRIaWdXVk1qamEvWU1MQ3ZITldtaUJQcU1ya1k5OE5Z?=
 =?utf-8?B?NVBFbmJRRmVkeUJNUGN3WloyaEVUNTlmQklwNkJFdmI4OHMyb2IzckhvN1BS?=
 =?utf-8?B?aWswMmtwOUcxWEF5akpic3RncVJFYzUrRHhzamp2QTZyZUp0VCtNWjdNQTdE?=
 =?utf-8?B?Y2JtL3V2U1VBdlhEOHlROTNHREtDN0FZK1BaM09kME5kLzVhcXhGMlQxd2lo?=
 =?utf-8?B?blBFMndTMkZrYlBiaTRiS29XK3BIVWpoVWJGdCtEdmhoWE53NkphUmhQU0kv?=
 =?utf-8?B?TGJYcytEN3JON2FIYTFJVlhCTER4M1ZnS1pZNjFFQ2JBZGEyckFZOUU3TW5T?=
 =?utf-8?B?VmJGMnZLWTltZEJ4OVJhVkt1Zk9jb3d5T0F0VjJJMVB1US9obDNyUkdCcmU1?=
 =?utf-8?B?UkQrdUV6M1p6ZlpRRmZXOElaMkFzV0pPYnpVcXVWN0hta1JoMVJrZENIZEZQ?=
 =?utf-8?B?ZldEaUtLZlhzSnZaMWNDS0ZhMTYwQTBycDVyZGFLNDM1clcvdWNpeEsxQ0Vl?=
 =?utf-8?B?YVNNNFdJN1l4NjNzV0FXcy8vMElYVUNtY3NkS0V1NTFXN1pQWTFmWngyeGFo?=
 =?utf-8?B?VnltK2xtTjlpQW1FUzNRdE02eWQzTWRSRUNWWTNXRFkrellDdzhPeTUzeENM?=
 =?utf-8?B?QVZDVTg5QzJFWDhLZkIwR0ltVUx4eUx4V2NSZHZUNHluNldmWFpXYU8xdDI4?=
 =?utf-8?B?VlJXaTQ1WHlhVkhoZ2UrUWtQZmhtWjRmQnk4U1NDbnhuL3ptMlZ5KzBleTBh?=
 =?utf-8?B?bHRBcDRRWFJVb2xveWlSRXFra3dINjl6WVl2ZW9NbGRneHlGdHF4MTFUSDI2?=
 =?utf-8?B?R3h3RjRENTJPMzQzY2dsMmpLN3VaUmpyWURIRGViOWFHTEN6WDJXOXlSWHJi?=
 =?utf-8?B?OE9Ga29kSlNwQ0hDSGNkeWV6SVRYM2E3R2REKzBmVHlhdlN5MnlUR1hMZEtF?=
 =?utf-8?B?WkxhaS9JSGVQSHBMR3hqejV5UC9IOFBVVnVTNWZuNnN2alJiTFFUSEtMbEZX?=
 =?utf-8?B?UURhTlZ1VHk1Vlk0eU94U0M4ZnJ1OUJRWktYNUhCYzdyUG50N0JQb0R5VFoy?=
 =?utf-8?B?TXE0cmF4aTRuZmhFS3grWUVkNDdzYXUxNkladmNsMCs5WGxRQ3M5VHhaMDBB?=
 =?utf-8?B?SFBjbms3TzFBaHRraHBRVUpNa0RKR1RUQ3Z6blhUQzNKWHRKU0Z5RldaQnJv?=
 =?utf-8?B?UktSU3ErTjE1MmVlQ0x4b29zdnhqanlYQ0NUTnFnZlRGMUtsRWs1WDcrTXI3?=
 =?utf-8?B?WVdmRjZEK2Yrekw1Mk1mL3VSclNwS1l1WnZVMWZXbWswRTBlS2dNRkh3RS9C?=
 =?utf-8?B?RnhhNEJJcndRUm5PRjdhVUdOTkJFaEhoYnZDc2x0WnpmNlVENHg0cWdESHc5?=
 =?utf-8?B?Nnp3QTN4U01GZ1ZtZGt5MkUrcks2QXNCZWQvVVNVaDhRRnhLT1h1RllBWmJQ?=
 =?utf-8?B?UVovZ0U2enFtb0JFRWRBWGF2SjRicWgyVGM3UVBDWWVOaXRsQi8ySW9HRzlK?=
 =?utf-8?B?NWlLNDl6TksydDlEZCtmZGpwWDNNelZJMVAycmtweko3MktBUEVkRk5xR0lt?=
 =?utf-8?B?K1NRZmJUYVhDVnMrV0Z3T3QxNUQ3d1YrVzdpZ1EvdW5ZZXgvTlYvSURJcHNB?=
 =?utf-8?B?VVBwN1ludjN1OEF4MXNOTUxKVXlZa09UV1h4Y0hyY3d5Z3RaMk1VOU42djJX?=
 =?utf-8?B?WWl1T0VjbHFiN0tJRjBxVVdtRnRzSDZKWjUxUmtkMkJLd1lLNjQ5K2I0Wms1?=
 =?utf-8?B?Z3dLYXlBUmFWK0pGRkdiWmJIblBXaWV5alRJQnIxVFZ1blVPaFpiLzNBRktm?=
 =?utf-8?Q?dvOfAL0oQywgsGAph8k8ZA5pX?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <641B0F192902DB4281174A2BD107ED57@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6451.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 934ab5ae-e97c-4d46-748b-08dc1bc3aaf0
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2024 03:30:37.9676 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CutgfQ2fi1WY5epbcKUEto41v0YUgFOmW/TDA2SA1U3OpFHRljPVyM7++NzqXUxDJatJTdl2mcQbdhAU8Wp2DQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7412
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
Cc: Linux4Microchip@microchip.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgS3J6eXN6dG9mLA0KDQpPbiAyMi8wMS8yNCA5OjIxIHBtLCBLcnp5c3p0b2YgS296bG93c2tp
IHdyb3RlOg0KPiBFWFRFUk5BTCBFTUFJTDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0
YWNobWVudHMgdW5sZXNzIHlvdSBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUNCj4gDQo+IE9uIDIy
LzAxLzIwMjQgMDk6MjksIERoYXJtYSBCYWxhc3ViaXJhbWFuaSB3cm90ZToNCj4+IEFkZCB0aGUg
J3NhbTl4Ny1sdmRzJyBjb21wYXRpYmxlIGJpbmRpbmcsIHdoaWNoIGRlc2NyaWJlcyB0aGUNCj4+
IExvdyBWb2x0YWdlIERpZmZlcmVudGlhbCBTaWduYWxpbmcgKExWRFMpIENvbnRyb2xsZXIgZm91
bmQgb24gTWljcm9jaGlwJ3MNCj4+IHNhbTl4NyBzZXJpZXMgU3lzdGVtLW9uLUNoaXAgKFNvQykg
ZGV2aWNlcy4gVGhpcyBiaW5kaW5nIHdpbGwgYmUgdXNlZCB0bw0KPj4gZGVmaW5lIHRoZSBwcm9w
ZXJ0aWVzIGFuZCBjb25maWd1cmF0aW9uIGZvciB0aGUgTFZEUyBDb250cm9sbGVyIGluIERULg0K
Pj4NCj4+IFNpZ25lZC1vZmYtYnk6IERoYXJtYSBCYWxhc3ViaXJhbWFuaSA8ZGhhcm1hLmJAbWlj
cm9jaGlwLmNvbT4NCj4+IC0tLQ0KPj4gICAuLi4vZGlzcGxheS9icmlkZ2UvbWljcm9jaGlwLHNh
bTl4Ny1sdmRzLnlhbWwgfCA1OSArKysrKysrKysrKysrKysrKysrDQo+PiAgIDEgZmlsZSBjaGFu
Z2VkLCA1OSBpbnNlcnRpb25zKCspDQo+PiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvbWljcm9jaGlwLHNhbTl4Ny1s
dmRzLnlhbWwNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2Rpc3BsYXkvYnJpZGdlL21pY3JvY2hpcCxzYW05eDctbHZkcy55YW1sIGIvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL21pY3JvY2hpcCxzYW05
eDctbHZkcy55YW1sDQo+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPj4gaW5kZXggMDAwMDAwMDAw
MDAwLi44YzJjNWI4NThjODUNCj4+IC0tLSAvZGV2L251bGwNCj4+ICsrKyBiL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9taWNyb2NoaXAsc2FtOXg3LWx2
ZHMueWFtbA0KPj4gQEAgLTAsMCArMSw1OSBAQA0KPj4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZp
ZXI6IChHUEwtMi4wLW9ubHkgT1IgQlNELTItQ2xhdXNlKQ0KPj4gKyVZQU1MIDEuMg0KPj4gKy0t
LQ0KPj4gKyRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvZGlzcGxheS9icmlkZ2Uv
bWljcm9jaGlwLHNhbTl4Ny1sdmRzLnlhbWwjDQo+PiArJHNjaGVtYTogaHR0cDovL2RldmljZXRy
ZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjDQo+PiArDQo+PiArdGl0bGU6IE1pY3JvY2hp
cCBTQU05WDcgTFZEUyBDb250cm9sbGVyDQo+IA0KPiBXaGF0IGlzIHRoZSAiWA0KQW5zd2VyZWQg
YmVsb3cNCj4gDQo+PiArDQo+PiArbWFpbnRhaW5lcnM6DQo+PiArICAtIERoYXJtYSBCYWxhc3Vi
aXJhbWFuaSA8ZGhhcm1hLmJAbWljcm9jaGlwLmNvbT4NCj4+ICsNCj4+ICtkZXNjcmlwdGlvbjog
fA0KPiANCj4gRG8gbm90IG5lZWQgJ3wnIHVubGVzcyB5b3UgbmVlZCB0byBwcmVzZXJ2ZSBmb3Jt
YXR0aW5nLg0KU3VyZSwgSSB3aWxsIGRyb3AgaXQuDQo+IA0KPj4gKyAgVGhlIExvdyBWb2x0YWdl
IERpZmZlcmVudGlhbCBTaWduYWxpbmcgQ29udHJvbGxlciAoTFZEU0MpIG1hbmFnZXMgZGF0YQ0K
Pj4gKyAgZm9ybWF0IGNvbnZlcnNpb24gZnJvbSB0aGUgTENEIENvbnRyb2xsZXIgaW50ZXJuYWwg
RFBJIGJ1cyB0byBPcGVuTERJDQo+PiArICBMVkRTIG91dHB1dCBzaWduYWxzLiBMVkRTQyBmdW5j
dGlvbnMgaW5jbHVkZSBiaXQgbWFwcGluZywgYmFsYW5jZWQgbW9kZQ0KPj4gKyAgbWFuYWdlbWVu
dCwgYW5kIHNlcmlhbGl6ZXIuDQo+PiArDQo+PiArcHJvcGVydGllczoNCj4+ICsgIGNvbXBhdGli
bGU6DQo+PiArICAgIGNvbnN0OiBtaWNyb2NoaXAsc2FtOXg3LWx2ZHMNCj4gDQo+IFdoYXQgaXMg
IngiPyBXaWxkY2FyZD8gVGhlbiBubywgZG9uJ3QgdXNlIGl0IGFuZCBpbnN0ZWFkIHVzZSBwcm9w
ZXIgU29DDQo+IHZlcnNpb24gbnVtYmVyLg0KVGhlIHRlcm0gJ1gnIGRvZXNuJ3Qgc2VydmUgYXMg
YSB3aWxkY2FyZDsgcmF0aGVyLCBpdCBkaXJlY3RseSByZXByZXNlbnRzIA0KdGhlIG5hbWUgb2Yg
dGhlIFNvQyBzZXJpZXMsIEkgc2hvdWxkIHVzZSBzYW05eDc1LHNhbTl4NzIgaW5zdGVhZCBvZiBz
YW05eDcuDQo+IA0KPj4gKw0KPj4gKyAgcmVnOg0KPj4gKyAgICBtYXhJdGVtczogMQ0KPj4gKw0K
Pj4gKyAgaW50ZXJydXB0czoNCj4+ICsgICAgbWF4SXRlbXM6IDENCj4+ICsNCj4+ICsgIGNsb2Nr
czoNCj4+ICsgICAgaXRlbXM6DQo+PiArICAgICAgLSBkZXNjcmlwdGlvbjogUGVyaXBoZXJhbCBC
dXMgQ2xvY2sNCj4+ICsNCj4+ICsgIGNsb2NrLW5hbWVzOg0KPj4gKyAgICBpdGVtczoNCj4+ICsg
ICAgICAtIGNvbnN0OiBwY2xrDQo+PiArICAgICAgLSBjb25zdDogZ2Nsaw0KPj4gKyAgICBtaW5J
dGVtczogMQ0KPiANCj4gTm8sIHlvdSBqdXN0IHNhaWQgeW91IGhhdmUgb25lIGNsb2NrLg0KQ2Vy
dGFpbmx5LCBJIG5lZWQgdG8gZXhjbHVkZSB0aGUgZ2Nsay4gVGhhbmtzLg0KPiANCj4+ICsNCj4+
ICtyZXF1aXJlZDoNCj4+ICsgIC0gY29tcGF0aWJsZQ0KPj4gKyAgLSByZWcNCj4+ICsgIC0gaW50
ZXJydXB0cw0KPj4gKyAgLSBjbG9ja3MNCj4+ICsgIC0gY2xvY2stbmFtZXMNCj4+ICsNCj4+ICth
ZGRpdGlvbmFsUHJvcGVydGllczogZmFsc2UNCj4+ICsNCj4+ICtleGFtcGxlczoNCj4+ICsgIC0g
fA0KPj4gKyAgICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvY2xvY2svYXQ5MS5oPg0KPj4gKyAgICAj
aW5jbHVkZSA8ZHQtYmluZGluZ3MvZG1hL2F0OTEuaD4NCj4+ICsgICAgI2luY2x1ZGUgPGR0LWJp
bmRpbmdzL2ludGVycnVwdC1jb250cm9sbGVyL2FybS1naWMuaD4NCj4gDQo+IFRoaXMgaGVhZGVy
IGlzIG5vdCB1c2VkLiBJbmNsdWRlIG9ubHkgdXNlZCBvbmVzIChhbmQgbWlzc2luZyBpbnRlcnJ1
cHQpLg0KPiANCj4+ICsNCj4+ICsgICAgbHZkcy1jb250cm9sbGVyQGY4MDYwMDAwIHsNCj4+ICsg
ICAgICBjb21wYXRpYmxlID0gIm1pY3JvY2hpcCxzYW05eDctbHZkcyI7DQo+PiArICAgICAgcmVn
ID0gPDB4ZjgwNjAwMDAgMHgxMDA+Ow0KPj4gKyAgICAgIGludGVycnVwdHMgPSA8NTYgSVJRX1RZ
UEVfTEVWRUxfSElHSCAwPjsNCj4gDQo+IFdoYXQgaXMgIjAiPw0KDQpQbGVhc2UgcmVmZXIgDQoi
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2ludGVycnVwdC1jb250cm9sbGVyL2F0
bWVsLGFpYy50eHQiDQpUaGUgdGhpcmQgY2VsbCBpcyB1c2VkIHRvIHNwZWNpZnkgdGhlIGlycSBw
cmlvcml0eSBmcm9tIDAgKGxvd2VzdCkgdG8gDQo3KGhpZ2hlc3QpLg0KDQotLSANCldpdGggQmVz
dCBSZWdhcmRzLA0KRGhhcm1hIEIuDQo+IA0KPj4gKyAgICAgIGNsb2NrcyA9IDwmcG1jIFBNQ19U
WVBFX1BFUklQSEVSQUwgNTY+Ow0KPj4gKyAgICAgIGNsb2NrLW5hbWVzID0gInBjbGsiOw0KPj4g
KyAgICB9Ow0KPiANCj4gQmVzdCByZWdhcmRzLA0KPiBLcnp5c3p0b2YNCj4gDQoNCg==
