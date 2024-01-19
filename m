Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C95E83237D
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jan 2024 03:53:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFB4A10E93A;
	Fri, 19 Jan 2024 02:52:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D3AA10E93A
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jan 2024 02:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1705632751; x=1737168751;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=oHg1O+N7oheZkSp65AdQylObSWHULzm4+Qfxl5Tnz0c=;
 b=U40I0fCa56c37vZ2sBrLq5bR/52u3+BzWktluo/O15E8ympgCWctSv0l
 q0cZPOw0PlYF2N+l4Rrgn9PdVHomzg+oIJDXNK6rgQijKI3WPvxShhwul
 TbK5lLtYbO5Xetqj9+P5vepS3tFZpp+gFVz7NgxCRt566BFKUE3jUzMga
 Zzzc8uw5HEyrQn0g7TR+ywaP/veQdxnmYs6AH6F9NhHJbrMEa1toItMmC
 TU9brUQiaxTozlg4o94D0EktifNIzUJ08B67l9YuwNmQVfRV8Pvv5uZB7
 uN9h8SUDkK4SqVoVhk65hC/+jeOQTbmOhZ0Iz+XrjU7/ypLFsqKi/ngMy Q==;
X-CSE-ConnectionGUID: jroz23nJQ5medtwO3IGrmg==
X-CSE-MsgGUID: GAbdGrutQIiyNN5xhijIFw==
X-IronPort-AV: E=Sophos;i="6.05,203,1701154800"; d="scan'208";a="16198958"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Jan 2024 19:52:29 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 18 Jan 2024 19:51:53 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (10.10.215.250)
 by email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 18 Jan 2024 19:51:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WoaoaHReDubJtyFxO1nBB9QSaVuN7J/KKfDiC1GkJbunPHoc+pZMU3BM5W6EmmzaJwbs4ederBtfMP6negCBKJaHgaTwwlRrILJTjSHUP3dM173+kZEN8U/hapINOF7JuaXnxBLjTJ0qDU/9a8YGDjks53QUPQnvPANtLonXFwch4SNGYFpMkJP6mQkxT/nuoxhLSs+z1Vk7VzX3t/wXgKpHOawQDfx8ihhnUPNByN2qMLbDxP5OLKenQBMuYWjJlmHTxn4n1dNEg0CUbfKM4wy1CAd1yH5wL/3XXSLkRzJH1wOgqV9OauKZn+YitThhJIPZLJrPmDrO/v1md4Ih4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oHg1O+N7oheZkSp65AdQylObSWHULzm4+Qfxl5Tnz0c=;
 b=IpUQImzQUyM4GgWivAjPKTt0geUoJdK1YMKEnH4tQ8is7Nn3y54TlwIVjfGFyu5Wh9OkczmuKsRfbqhPswrxcDjcVGFajPBAnwTbvAi+jxR+rpnJ/r2FMHlUv++S+A/htrUeQPNph896OV6v57lVfVdQ07LVCFoYZeVyqRIYQLEZBWLiHQezOi0SFD5hja02HbktSnRqgvyeDkInIDdcNjyVqvUCBk/FwKRVTNPAfrLDHK0DKmS8ZpXYTdqo/KsnpnLUsXgM8bUfG01sANMaF56rzip/09BVTH7ta0av1L5liRzb4f397KhrUZxJAyyZIzx4L1xSWpN3osqDYrWxTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oHg1O+N7oheZkSp65AdQylObSWHULzm4+Qfxl5Tnz0c=;
 b=KEVGYWjspUfsjjwDNEY11wTnm4Fm/5hmdYV/s1GTPtJR6dOoJYVqO3IHAqI0/56y1hbIbgiQX02MX2KwtGWKOiVguQKVfiJHtoJlvNRW+dplnEo5Y3atX2DCU3IaKVdFZ9VWPJQ/eBcYj+us5koy6AfgqhZ3Q+mQpZWTg1ibN3YnWoIZ6gmwiZK/RLTPxXBWOVJHsjG6KCUtHOgyHmka9R48NNN5M9DHCmvPhlSg+9iNACwjfpHLDkGZ8LN4IsWL5mG6J/yb7+QMsYYmgHKCgM6PofE+AmPE950hQKd4rWtjKfe4ZloMCfJSLah0faROjXnfUxxxrzuAI7lLVPrmPA==
Received: from PH7PR11MB6451.namprd11.prod.outlook.com (2603:10b6:510:1f4::16)
 by IA1PR11MB6324.namprd11.prod.outlook.com (2603:10b6:208:388::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.24; Fri, 19 Jan
 2024 02:51:48 +0000
Received: from PH7PR11MB6451.namprd11.prod.outlook.com
 ([fe80::80b9:80a3:e88a:57ee]) by PH7PR11MB6451.namprd11.prod.outlook.com
 ([fe80::80b9:80a3:e88a:57ee%3]) with mapi id 15.20.7202.020; Fri, 19 Jan 2024
 02:51:48 +0000
From: <Dharma.B@microchip.com>
To: <conor@kernel.org>
Subject: Re: [PATCH v3 1/3] dt-bindings: display: convert Atmel's HLCDC to DT
 schema
Thread-Topic: [PATCH v3 1/3] dt-bindings: display: convert Atmel's HLCDC to DT
 schema
Thread-Index: AQHaSfBxBE7vYyXbakeOwmoCIPKx1bDfsusAgAC+FoA=
Date: Fri, 19 Jan 2024 02:51:48 +0000
Message-ID: <6630655f-282a-4a1e-99fe-46679fcf1e56@microchip.com>
References: <20240118092612.117491-1-dharma.b@microchip.com>
 <20240118092612.117491-2-dharma.b@microchip.com>
 <20240118-unscathed-flail-be2e49abc56d@spud>
In-Reply-To: <20240118-unscathed-flail-be2e49abc56d@spud>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6451:EE_|IA1PR11MB6324:EE_
x-ms-office365-filtering-correlation-id: ed2d1d07-85c3-49eb-c7e7-08dc189994bb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: aX+ib5r05JgICkxfixgEjXq156xGTf+NhyXliU1v4Kog26dPvKWbz0CBnCSGElURAT2cEXltiTeJWVtjrV/WhqWluq+AEqgxjHMxR/0EW8CcUVz5vtvD2z3ZhuQAX+RTB7E++q9B9RGix1Maik7ozsrTB9c0gQDPi+Wzcmx/QlJIBmxUni5KDbJjpgcGvS4A8zTWvU4ZBsZ3/fMv8o5oYbPCDRpV0YSbNaA9zc1DHCMsDhR1EJb34kIhOZXLGccBUclyjSif3QWW7MKFS97AjloP/BYj6LX2c+fQuPJG9O7tJk0aliZCcoDhMiJYCc+3XRV+C+dpV/QjhogUywmj2zPAt4ZXCRNpgvQh3lK3mSkpgXMANtE9jbB/feQo/etT0LnYf/6RmDNPF3VZAQDVby2Cac1OLM5ftGnM1vq3k2CzXoAFbVNvka4xiq8qUNqIFXV7TtxAkHNIzOJ0hRYtFlDVASoa56R2F/9GcsMOUbRpWe/HIwNPG4WzL9SEyp+UTQIpIx3fgItXqxn9fUuEiyq2x1YXY0+pwKcwaxINMCe5dtcaUZK15oR8ty+gxUHcvGcUf6pEzyen1Q1ynfoKbtx3wgXrCjFb5jB+Ezn7E+AUHBcz7jGXxcE2o6CpZFHBOTgfZMAdhUoZJIWD4CvxcQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6451.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(366004)(376002)(136003)(396003)(346002)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(66446008)(478600001)(8676002)(66946007)(122000001)(91956017)(66476007)(31696002)(76116006)(6486002)(54906003)(66556008)(38100700002)(64756008)(2616005)(71200400001)(6506007)(107886003)(86362001)(8936002)(316002)(4326008)(26005)(6916009)(53546011)(6512007)(2906002)(7416002)(38070700009)(5660300002)(4744005)(36756003)(31686004)(41300700001)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b1pZS2F4YUZaMERuZjk1aXdNS3VqMDY3WXJmZ3orWXJ3ajFwanhMUm0rUkFL?=
 =?utf-8?B?YXNXTWhTSnVibVJRZW01VjlGZWZCNGp0eEdyUTBmSjIxNU9ySmJDRXZibllX?=
 =?utf-8?B?QW9reE1OSGk0bUxKZUxmS1cxS2s1aEdYbVlkam8yeHhWWk5zRHRWSTFZZVVZ?=
 =?utf-8?B?UVltcUI1VHAvWjJTVHpoVURudXlTZmVMbzdaR3N5VFJhZ2I1TENoS2I1dE9D?=
 =?utf-8?B?ZmhJRW9Rd2ZSOHlqU0V4SzJzTzRkZjJ5cUIyekN5WTVOcUlCMjluZlQwMlY0?=
 =?utf-8?B?dVFCSmdtenNJVmlOb2tibTFndkR3cVBtL2RRSmQzd3JFaE85bXVacUxTdGQr?=
 =?utf-8?B?NzhzVzhtNmR6MGJWMzFleVZBeXNDU2JsbStzYmZJT0pLV0loTCt1dmtScmd3?=
 =?utf-8?B?T25CSFN2eTgzWFF2Z0cybU15ZWNMLy8yNDNHcTduamN5N2kyRjE4TkE3UUNt?=
 =?utf-8?B?d2tta3dyNWhNSkhOR2dKZ3c1N253MTEvUkh5TmZIU0VDKzgzYjUrVlBOT2hO?=
 =?utf-8?B?aTJGbG9wRlV6bFRuTTg1WkZqajd2OXRzQTc4RWRaMGR6VGNYbit2WTAvZXF6?=
 =?utf-8?B?d3VyWUFHVit5ZkNyVEhQa2dhcDVEcGxLSGR6RmVzbmROV1U1dFB1a1ViZEVm?=
 =?utf-8?B?VFk0VHQrU3ZTL3htakdzT0VEajBQYytMU3p1YkNqZnEzYmFRYWczdnNCOFJj?=
 =?utf-8?B?bVVVdnl0bEYxUVRaSGFhR3A5b1dMZmFYRkpHUS9rbTlyTlJsbTdPc21Kb2tS?=
 =?utf-8?B?QktnQUNpVy9sQXdSQXk0dmlDMVVqN1RpT0RLSGpDWnFFVmJkdlZ2Q0Nqamc0?=
 =?utf-8?B?VlBlL0hFOVI1NFMwenJkaVYrc1lSMys3S3B1NVlUTXdEcmZTbktZKytJZFhW?=
 =?utf-8?B?WTE1bkRZSzlJNjFpTWY4S0lpeUViVXg4TmQvRnpVOGNSRy9mbGloRlNpdXNP?=
 =?utf-8?B?a1owU1BvSUFsOE1rZzRDS0h4R3ZaMzZ6eEhsenN5MS95WmJxWFJWMmtNSmc5?=
 =?utf-8?B?VWY2YW9KTUhZSEVRb2FETkxZMkRnekNnL3hLNm02djYrK0NGRXVUSHZ3SXJl?=
 =?utf-8?B?dHl0WG5DM0I5aGxxeXJkQjJ0N2phY2h6bU5iQUZZYk1rNUowSEl6aXA3WHRi?=
 =?utf-8?B?dnphYnR1MC9yalpOL2h4cmFKeGRWUmtoUUYwbTF1U2pVU0c1NUcyL1QwM1RI?=
 =?utf-8?B?SWJaUER2NXVjTElVdVJYSWpCTnFreXMxcHZLT29LR0pERzhZRmg4YTQvV0kx?=
 =?utf-8?B?QXBDMXo0UGhXbUxPa3FPNnVib1NVM2tYbkFkTDFsa2ZCM0tpMVhFTGFhV1kr?=
 =?utf-8?B?RjJZc2p5U2RGSmxWNC9YWVpGVTdHcEVtcE5ReGZ2MHE4QTF1cXJIbFNMc1pU?=
 =?utf-8?B?R2N5Y21zRFZuM0licm15ZjRvWDg0Skw0QjFDK0ptQU4yQnVaMXNNcmxsQWFU?=
 =?utf-8?B?Q2R1TTFTaGIxYzNwNDZlZHlxS3p0L2JwRVdYcEpWOWFiNUZqOW5QVk1ZdEtK?=
 =?utf-8?B?YlpmSXFocWIwZmVxM0ZTMXB6ekZsM2wvL1hIVDdxOFJNZ1lUVjRnSUMvV1Fw?=
 =?utf-8?B?bitvS1k3Z2hhWkpza3BZcnhadHdTcEg2aUlaZWxYdXBVcEVlSldvTEpFdEVN?=
 =?utf-8?B?K1RKRCtjbHNOTmsxTXVQcjdoU3p5UVBuMk1OcVJNTHh3ZzgzSVBsOURvQ0px?=
 =?utf-8?B?R0R0YWxSVXNERTY3M25DZnV4RlNKZVc3cVgzaHFOcVIza2krRTBFRXNVSnhu?=
 =?utf-8?B?S1lxVGNXRkFnUVQvcW1SRS85RHVZbnRIUG55THdEUisrZEpya1dBTFpPNEpq?=
 =?utf-8?B?RDF6WURoMENmQUo2K05OWEViV3gvRmgraDh1dHNPbU0rSnlnanduSHpMMmMv?=
 =?utf-8?B?aHNoY0R2emdGcTVRZ09IWU9KQ3dHa3NtQTFpV0wzc1V6dElieGtTYmhrZ1VU?=
 =?utf-8?B?bjNmMWw0ZDJwRkRReGt3cXZMSVNLWGRWN05WNEltcSsrOHVPRTVsRS93R2FD?=
 =?utf-8?B?dGJzYmlreWlwS1JDblY2ZWtRUngyTGRDaXpRblVRMlpWT0w3ajU5YzNQTGh1?=
 =?utf-8?B?OGh5TnBHb1ZMNzJmOEdYRnZNNmdFS2krN2pVN05KeGIwU1ZSSVNWVjJYbU11?=
 =?utf-8?Q?iP1lfWyHbwrfd4zOzZUX8i3Zi?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BD3D120DBAAE6646B30D419AA53F859D@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6451.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed2d1d07-85c3-49eb-c7e7-08dc189994bb
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2024 02:51:48.4030 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +FpfvB20SYdCHn5c8iLvmj5UBZpKECsK/WGRO3JneyCMvcbdPK2RQC7Wrv3M1XGonMkSWQFtjKjL9X3byqbLhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6324
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
Cc: alexandre.belloni@bootlin.com, linux-pwm@vger.kernel.org,
 Linux4Microchip@microchip.com, dri-devel@lists.freedesktop.org,
 Nicolas.Ferre@microchip.com, Conor.Dooley@microchip.com,
 thierry.reding@gmail.com, krzysztof.kozlowski+dt@linaro.org,
 claudiu.beznea@tuxon.dev, airlied@gmail.com, sam@ravnborg.org, lee@kernel.org,
 u.kleine-koenig@pengutronix.de, devicetree@vger.kernel.org,
 conor+dt@kernel.org, tzimmermann@suse.de, mripard@kernel.org,
 robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 bbrezillon@kernel.org, linux-kernel@vger.kernel.org, daniel@ffwll.ch
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTgvMDEvMjQgOTowMSBwbSwgQ29ub3IgRG9vbGV5IHdyb3RlOg0KPiBPbiBUaHUsIEphbiAx
OCwgMjAyNCBhdCAwMjo1NjoxMFBNICswNTMwLCBEaGFybWEgQmFsYXN1YmlyYW1hbmkgd3JvdGU6
DQo+PiBDb252ZXJ0IHRoZSBleGlzdGluZyBEVCBiaW5kaW5nIHRvIERUIHNjaGVtYSBvZiB0aGUg
QXRtZWwncyBITENEQyBkaXNwbGF5DQo+PiBjb250cm9sbGVyLg0KPj4NCj4+IFNpZ25lZC1vZmYt
Ynk6IERoYXJtYSBCYWxhc3ViaXJhbWFuaTxkaGFybWEuYkBtaWNyb2NoaXAuY29tPg0KPj4gLS0t
DQo+PiBjaGFuZ2Vsb2cNCj4+IHYyIC0+IHYzDQo+PiAtIFJlbW92ZSAnfCcgaW4gZGVzY3JpcHRp
b24sIGFzIHRoZXJlIGlzIG5vIGZvcm1hdHRpbmcgdG8gcHJlc2VydmUuDQo+PiAtIFJlZiB2aWRl
by1pbnRlcmZhY2VzIGFzIGVuZHBvaW50Lg0KPj4gLSBSZW1vdmUgcmVmIGFuZCBkZXNjcmlwdGlv
biBmb3IgYnVzLXdpZHRoLg0KPj4gLSBBZGQgbmV3IGxpbmUgYmVmb3JlIHRoZSBjaGlsZCBub2Rl
IGluIGV4YW1wbGUuDQo+PiAtIFJlbW92ZSAnZXhhbXBsZSAyJywgYXMgaXQgaXMgbm90IHJlcXVp
cmVkIGZvciBqdXN0IG9uZSBhZGRpdGlvbmFsIHByb3BlcnR5Lg0KPiBSb2IncyBjb21tZW50IG9u
IHRoZSBwcmV2aW91cyB2ZXJzaW9uIHdhczoNCj4gfCBKdXN0IDEgZXh0cmEgcHJvcGVydHkgZG9l
c24ndCBqdXN0aWZ5IDIgZXhhbXBsZXMuDQo+IHwNCj4gfCBJbiBhbnkgY2FzZSwgZHJvcCB0aGUg
cGFydGlhbCBleGFtcGxlcyBhbmQganVzdCBoYXZlIDEgY29tcGxldGUgZXhhbXBsZQ0KPiB8IGlu
IHRoZSBNRkQgYmluZGluZyBzY2hlbWEuDQo+IA0KT2theSB1bmRlcnN0b29kLCBJIHdpbGwgaW5j
bHVkZSB0aGUgJ2J1cy13aWR0aCcgaW4gdGhlIGV4YW1wbGUuDQotLSANCldpdGggQmVzdCBSZWdh
cmRzLA0KRGhhcm1hIEIuDQoNCg==
