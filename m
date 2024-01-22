Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B359B8359CC
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jan 2024 04:40:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AE8910E3B7;
	Mon, 22 Jan 2024 03:39:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFABF10E3B7
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jan 2024 03:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1705894760; x=1737430760;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=6P4lyqvwH9IK+Hf/n+ho682h7RCPlUPkDkvIyKmVRpw=;
 b=NxVV4es4Fh4z9VCm6gDvsxyJfv8IYpd+pIrgpIgSn/2BAhrwvklUJ4EL
 P43JqE7mkafyNUpLtT30hhEMFAu9IUaEHQIjGJR8TLUcXEvxFj10MKuEZ
 aBRuhIkGoKbpfK7qsE9ZR4Bw0Bdk7xjJs9LQPjhu8TevssNMnytP1pKdT
 1RQnYBdZ0ZwOshJSMqGYfV8oST7+Yt8hPkylLwjFY8rBrRw7jpzInJFCs
 R8uaymAk5XJ261AJynFhswIeqd+bEeVxK3ctWcMas8PaKo9W8/9gBQtP2
 eH1tnD7lTbsbR9eT4xcp/w/LV/g/mZDWbQ0aEytfaZv0F3zgAy/KsdRZV Q==;
X-CSE-ConnectionGUID: QVc0DboYQwK2IFM2JgkuMA==
X-CSE-MsgGUID: 7K/lbZYBT1mvQuCbTERZtA==
X-IronPort-AV: E=Sophos;i="6.05,211,1701154800"; d="scan'208";a="15559356"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Jan 2024 20:39:01 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 21 Jan 2024 20:38:45 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.10.215.250)
 by email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sun, 21 Jan 2024 20:38:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S5vz6xxePaThetVCkqg3rLHl4q4dH5XcpKz4koU44oqVg+e8cTGDfZJ8wpLvCYXk9gv34wBJuqFAxPtlUjh70i27892oJYV7z30ikoIoaMBGeW4WxDmQRz9pEiexb2Naw8bpjSkNd0Q6JFGveBDtJtQIaxZNLmuhJ5KWUCOiR/gbngZFcXXEPg6n9F4TD+ZVoh6lKRSqHAsLiOjloNT6gYk9vd7rhQ3MFhOz2CGkY5bgVfVde6bG/YdrzoSflJFSUYrFmYSnH9qZWoO9VUHpKi7AX62/OPFVfx4BCqzOZTK64y/KVVPRlbTRRwUicPzVdaUlToTLh803DFM5dJW9yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6P4lyqvwH9IK+Hf/n+ho682h7RCPlUPkDkvIyKmVRpw=;
 b=K9UdxCJd/tZ5B1JzvxLzozDrPb3foUwo+1UwqHXGxU3LHpg6mTqOHyJvi+ApAVtxxqFc1Au/j0C9S8+GaG7akNc19E0IkeTKdycjcNgZqJZ27stR+5qP9zwpZWOHK6bQ3YI+DDKai8NIndMqSzkkuEvLRV3TjVIUSYijN7y6bScPemFef1+pPWUmrILGY1oEPl3noF1q+MaQvndlloa4kXdT1z3/oUAzUrYP4+5UuYmDOHs5oi70VuWW05r7WKE1Pu/viWDXNpTdYJZW1D/zQEAH+1wIvwfQIxVZyMs3ySDEpVEf5SG+8lIChbM4pQi5Z+h5MjBmwdruxCBXZC8I5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6P4lyqvwH9IK+Hf/n+ho682h7RCPlUPkDkvIyKmVRpw=;
 b=EWu0r069GzjDqPMXa3DwMmONvIeiuovyXZAzXvI4ZkiI6Fz9MXTaU1HdlMTjX2/iBDsjPh2YPwzky6//9DZvJOhdZiDEZ6xv2gs6TnYWTKdXHF3wtybCwZ4UAES/HnCo7UXdQdxp3sxWN+3wwtN9YBI6sFaVgmxAKD+cOLFiNQ0H5UtlMMLJoRQ4GUYlrYxzaRqcEoLwHXTV+4yEXZu+qEbm57T1tDwBMGnWaIbis/dGlTDn7R1WbMKFwJplysCSPZKM27MXkl68liWUHewuBMSOHFKeplCf2Jnz6hDNUzWu4h9xIZ3lbCt26RoDcgdmYDlnvxNQ0Hvf5xojbgv0cw==
Received: from PH7PR11MB6451.namprd11.prod.outlook.com (2603:10b6:510:1f4::16)
 by BL1PR11MB5352.namprd11.prod.outlook.com (2603:10b6:208:311::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.32; Mon, 22 Jan
 2024 03:38:43 +0000
Received: from PH7PR11MB6451.namprd11.prod.outlook.com
 ([fe80::80b9:80a3:e88a:57ee]) by PH7PR11MB6451.namprd11.prod.outlook.com
 ([fe80::80b9:80a3:e88a:57ee%3]) with mapi id 15.20.7202.031; Mon, 22 Jan 2024
 03:38:41 +0000
From: <Dharma.B@microchip.com>
To: <Conor.Dooley@microchip.com>
Subject: Re: [PATCH v3 3/3] dt-bindings: mfd: atmel,hlcdc: Convert to DT
 schema format
Thread-Topic: [PATCH v3 3/3] dt-bindings: mfd: atmel,hlcdc: Convert to DT
 schema format
Thread-Index: AQHaSfB9G+vm5oXSwEmW6mjsJvC8kbDftWKAgADHFQCAAI7AgIAEKeOA
Date: Mon, 22 Jan 2024 03:38:41 +0000
Message-ID: <da60f9f3-f955-4a87-a020-5710185953c0@microchip.com>
References: <20240118092612.117491-1-dharma.b@microchip.com>
 <20240118092612.117491-4-dharma.b@microchip.com>
 <20240118-recent-glorified-fd35d72e006e@spud>
 <c33868c8-dc42-4800-885c-5e5f24c2044e@microchip.com>
 <20240119-character-mardi-43571d7fe7d5@wendy>
In-Reply-To: <20240119-character-mardi-43571d7fe7d5@wendy>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6451:EE_|BL1PR11MB5352:EE_
x-ms-office365-filtering-correlation-id: 13afbc10-466e-42eb-510c-08dc1afba0c3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: q2vYK2OQSty47RKj5mdZP2Zhd7XHmyYtaY/HF/BI2PfurA3yAPZenRFZWM2sNQbWzvXyrbp98S8m99ZQ/JcXXocnXHouwiTsIsBq///UsmR7Ee8QIg5vDnip8AgCF3UvqIWuk+I7b51i71+T1YVhFVF30SHh+FoAUQ1QdK9s2Z0PhV2KquzyQVCDs0BfNMm29rbBW6wb05YvigFkER2TX356Pzr8MVGi5f4arc3s+5SmNQfXHP2cGlmohIz3NImMmxbYgxQ9cL1NytjEHbBZEuQBRogq8woSm8eh54/yIrL0LNfdxmAfw91ceZ4ZPtolxB7InzLrd9HRzRtvvstQp7Wj3djrB7ct3XkJAP9p7BJMmX3ERmYMrev0stZdjxpsNkverwuuanX/+9nErVDSNwzp+c/jJWlUII2YIlwLF4P82ejvSsWBaxyQaOZTikfvheM2dhWuamVMSdCXctZAnsSfyyQNFW/I4aRbR1stxDcdef2Br0uH+4dXAG+nsGIkwjEyba+HvMAyC0VoLL48wzxv2wG9GcbE+pK2B/4zvUNk/wRhDesXqGccRYMCV+WHKsseqjJVKUiGhqsQhxqwsQVTavEpEYmKb31P9KOfgDgtL3I6i76oQcKc2bdMPwQ8p8OPEwI4hQkLqsPnQEbVnoF/bYcHJkoO0gTfKBwcW3cEttdwTA9cBHtnDDrTCZlZ
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6451.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(136003)(396003)(366004)(376002)(230922051799003)(186009)(1800799012)(64100799003)(451199024)(31686004)(38070700009)(66476007)(2906002)(5660300002)(66946007)(6636002)(91956017)(64756008)(66446008)(6486002)(66556008)(37006003)(76116006)(54906003)(7416002)(6512007)(26005)(71200400001)(316002)(478600001)(6506007)(8936002)(4326008)(6862004)(8676002)(53546011)(2616005)(107886003)(122000001)(83380400001)(38100700002)(36756003)(86362001)(31696002)(41300700001)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?V2paUVNLY0QyM2VaN1ducG5nQnRoc3ZUNTNlcjNwenBLQWZ0WU00dlBwMUZq?=
 =?utf-8?B?TC9WNnZOV3lyeXd3Qml0TGgzbFhsZnpHOXg5bEk1eHlRMHBYMkhwdUlOQUFG?=
 =?utf-8?B?RGZFc0pISlRUckhNSlMvYTdlcXd5WTZETlVtUWdGM2Mvd3JCUW92dmltMDlC?=
 =?utf-8?B?aHZodGlpcmJHSllTb1A1a3JDY2Rvcm8wTGUzSlFEUUdBSzRMenZhOUMyRk5j?=
 =?utf-8?B?Z0IyYVA5SEhwcW5YRGlXTy9UTTJLMlJrS1FWazQyY0hpaEZ4UU13RE1kZ0J4?=
 =?utf-8?B?cDdlL1dDQUJsMTczZUVUZ0daZTZXR3RRNnBEMjFZSnpERlVrNUxvT2VhNktT?=
 =?utf-8?B?TTJmRWxRanA5Q0VLVlNpQ0UxclNjNUtncGc1eVFVSExPa0ZtRVJ3dS81aWIy?=
 =?utf-8?B?MVoxMmxNbmlOd0hFOXNNNVowMHNYbzhoc2hmNjNHazVFVDFFQzlIYURRQjI5?=
 =?utf-8?B?eFBaMXRVVExMM21xdXZ3WWxHVi9Hak5ScUE0bjZHdFJETThYTHpndDFvTmtH?=
 =?utf-8?B?NUpHenFVTEVHbzc1MStkb0pOelZaY0dMdzlNZm8xRVBxMStTWmVneVA4OFhp?=
 =?utf-8?B?eWVad3R4SDMzT2M2a0hRZzVPYW5yalE1Z3lPVXZwQU9hNGN0NXgzaUwrSjlZ?=
 =?utf-8?B?MzM4dWtSVTV6UGhUSDRyQ3VCL0lvMW85KzFlTVRqZHd0TWpMaURPVjlLWFdT?=
 =?utf-8?B?b1VpY0NibU5WNS9NNUZJNDBTS2Vidjduc2d6dzIrNWNZdCtHVWVmTlllRW51?=
 =?utf-8?B?RVlYTWoxTm1pNVlXRkIycjZDLzJ5ZzF5SFllTW9MTHBEZDNZeXI3YXpPeVNq?=
 =?utf-8?B?Z1RhbWVDRkNHekFVRGRoZDg1VlY3S3NwUHFnbThvU2hVVkg1ZnZyRUJZbjVH?=
 =?utf-8?B?bDUxZldEL3dFWmZFKzZjZWNUUUtkTlp0V0piUjR1ZENtd2RRbWNFTlB5RG1s?=
 =?utf-8?B?ZUE0RFd2NE1YRDUveDV5TmVEamQ4Q0N4YzQrQVNNdEYvc013Z3A5WjZxWnRp?=
 =?utf-8?B?bjhPMEUxclViWlNoMThUcjVNd2FJMmdIYTAyVE13V29qd3dGTU1FM0o5QUtI?=
 =?utf-8?B?d2pFL3J3MnoxMDlFdi9sZlRRWDBuSkE1czErRU9qRzA2TitHUHpqM3FrcTMx?=
 =?utf-8?B?a2ptbVRqN2tiK3FFQ0VubUJyTzM1ZzJxVUVQZDU2eGtFL0t6ZmhHaS9DTkFw?=
 =?utf-8?B?ejUweTVwNUNHS2FPMndKbkE0bnJTU0RRY25zNERSdDVCYjdtVkxuOE5vR05j?=
 =?utf-8?B?YkxUN015ZWZkNnZybkhIT3Z3MlF3UTF3NkFQZWg2ZEQ2bEZ0UHdqNHdwTi9N?=
 =?utf-8?B?RmRETGQ1SFhWVjhRRytyT29UOGxPNmxlTEM1VmZXb2p4ZzIrdkREVjB3ZjVz?=
 =?utf-8?B?NDAvcDFEZS91QVRoRlltcFZIbUtnYlV4cTd0cHZkeDdRbThUUjV1Tm5yOGdt?=
 =?utf-8?B?TVNrQjlneFgwaU9KNTRIRkNzQmw5cGFVY3I5aTkvK0VYcTN4eFBqa0lzYURU?=
 =?utf-8?B?TXdLOEo4TDlxNmFTcHlXY1J3dVFlOXV4cVBSa3M4aVFKNDduQ25xVGM4WTJ3?=
 =?utf-8?B?eldUQ1VrK3lLUU9LQjBRRXpLcVFadW5qZjhFWnRlSFFsRG1EVFRGY1ZyUHE3?=
 =?utf-8?B?QVNNREx4bkcvcG5PNGlObWtiM0RoTytLWm0wcTlDOExIYXBKanBqREJsY1JC?=
 =?utf-8?B?MWJaeHJTZEE5Yzc3WTZVM24wdWVyZHhxVmUrV3hUVzV6MHIweThSSW9NZkFT?=
 =?utf-8?B?Z1djNEVlOGJsOUxjU0ZPbHlGanYvdzVPZjRlTmxHTFdQRENPTkFJQ0xwUjIr?=
 =?utf-8?B?MS85NzJZdU1Ddm53Vll5M3pqYXRDSWVQSmMvNFVNcHJvZkdaOVA5TmZZd3dB?=
 =?utf-8?B?VjU3SUxMQi9FMDBXelhDclg0UlVTYzdIT2p2SXY4NkpYb09nMkp0V0NHN05N?=
 =?utf-8?B?QzQwRnN0dFRzS2lkelRFNVVYVVAwSTgvdmljVUpRYnd6SktRTzZ5R3FwL2do?=
 =?utf-8?B?TStZdHRXajYxUFZPR0RjUGsxc1lWUGdzK2lpbWp3a3FOOGZ3dGNQT2ttUDlB?=
 =?utf-8?B?U24zYko0U3AwaVBoeHpqTzNXb3hWZ251UDFwU1ovZW9DcVV4cExHNmpQVW4x?=
 =?utf-8?Q?MKPw60hoCMPtLJ0W4o8Th0LNM?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3050872FAB0E8F4DAE4DC0254D833AC8@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6451.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13afbc10-466e-42eb-510c-08dc1afba0c3
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jan 2024 03:38:41.5616 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bEQkULzIcS6E2K8XFycx8keucKMfn6GLGcgS8IgXggCXHVWoa2cV9x7jeungiLEYbdFvqewm7jsU0kSDLCce2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5352
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
 Nicolas.Ferre@microchip.com, thierry.reding@gmail.com,
 krzysztof.kozlowski+dt@linaro.org, claudiu.beznea@tuxon.dev, airlied@gmail.com,
 sam@ravnborg.org, lee@kernel.org, u.kleine-koenig@pengutronix.de,
 devicetree@vger.kernel.org, conor+dt@kernel.org, tzimmermann@suse.de,
 mripard@kernel.org, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 bbrezillon@kernel.org, linux-kernel@vger.kernel.org, conor@kernel.org,
 daniel@ffwll.ch
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQ29ub3IsDQpPbiAxOS8wMS8yNCA1OjMzIHBtLCBDb25vciBEb29sZXkgLSBNNTI2OTEgd3Jv
dGU6DQo+IE9uIEZyaSwgSmFuIDE5LCAyMDI0IGF0IDAzOjMyOjQ5QU0gKzAwMDAsIERoYXJtYS5C
QG1pY3JvY2hpcC5jb20gd3JvdGU6DQo+PiBPbiAxOC8wMS8yNCA5OjEwIHBtLCBDb25vciBEb29s
ZXkgd3JvdGU6DQo+Pj4gT24gVGh1LCBKYW4gMTgsIDIwMjQgYXQgMDI6NTY6MTJQTSArMDUzMCwg
RGhhcm1hIEJhbGFzdWJpcmFtYW5pIHdyb3RlOg0KPj4+PiBDb252ZXJ0IHRoZSBhdG1lbCxobGNk
YyBiaW5kaW5nIHRvIERUIHNjaGVtYSBmb3JtYXQuDQo+Pj4+DQo+Pj4+IEFkanVzdCB0aGUgY2xv
Y2stbmFtZXMgcHJvcGVydHkgdG8gY2xhcmlmeSB0aGF0IHRoZSBMQ0QgY29udHJvbGxlciBleHBl
Y3RzDQo+Pj4+IG9uZSBvZiB0aGVzZSBjbG9ja3MgKGVpdGhlciBzeXNfY2xrIG9yIGx2ZHNfcGxs
X2NsayB0byBiZSBwcmVzZW50IGJ1dCBub3QNCj4+Pj4gYm90aCkgYWxvbmcgd2l0aCB0aGUgc2xv
d19jbGsgYW5kIHBlcmlwaF9jbGsuIFRoaXMgYWxpZ25tZW50IHdpdGggdGhlIGFjdHVhbA0KPj4+
PiBoYXJkd2FyZSByZXF1aXJlbWVudHMgd2lsbCBlbmFibGUgYWNjdXJhdGUgZGV2aWNlIHRyZWUg
Y29uZmlndXJhdGlvbiBmb3INCj4+Pj4gc3lzdGVtcyB1c2luZyB0aGUgSExDREMgSVAuDQo+Pj4+
DQo+Pj4+IFNpZ25lZC1vZmYtYnk6IERoYXJtYSBCYWxhc3ViaXJhbWFuaTxkaGFybWEuYkBtaWNy
b2NoaXAuY29tPg0KPj4+PiAtLS0NCj4+Pj4gY2hhbmdlbG9nDQo+Pj4+IHYyIC0+IHYzDQo+Pj4+
IC0gUmVuYW1lIGhsY2RjLWRpc3BsYXktY29udHJvbGxlciBhbmQgaGxjZGMtcHdtIHRvIGdlbmVy
aWMgbmFtZXMuDQo+Pj4+IC0gTW9kaWZ5IHRoZSBkZXNjcmlwdGlvbiBieSByZW1vdmluZyB0aGUg
dW53YW50ZWQgY29tbWVudHMgYW5kICd8Jy4NCj4+Pj4gLSBNb2RpZnkgY2xvY2stbmFtZXMgc2lt
cGxlci4NCj4+Pj4gdjEgLT4gdjINCj4+Pj4gLSBSZW1vdmUgdGhlIGV4cGxpY2l0IGNvcHlyaWdo
dHMuDQo+Pj4+IC0gTW9kaWZ5IHRpdGxlIChub3QgaW5jbHVkZSB3b3JkcyBsaWtlIGJpbmRpbmcv
ZHJpdmVyKS4NCj4+Pj4gLSBNb2RpZnkgZGVzY3JpcHRpb24gYWN0dWFsbHkgZGVzY3JpYmluZyB0
aGUgaGFyZHdhcmUgYW5kIG5vdCB0aGUgZHJpdmVyLg0KPj4+PiAtIEFkZCBkZXRhaWxzIG9mIGx2
ZHNfcGxsIGFkZGl0aW9uIGluIGNvbW1pdCBtZXNzYWdlLg0KPj4+PiAtIFJlZiBlbmRwb2ludCBh
bmQgbm90IGVuZHBvaW50LWJhc2UuDQo+Pj4+IC0gRml4IGNvZGluZyBzdHlsZS4NCj4+Pj4gLi4u
DQo+Pj4+ICAgIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL21mZC9hdG1lbCxobGNkYy55YW1sICB8
IDk3ICsrKysrKysrKysrKysrKysrKysNCj4+Pj4gICAgLi4uL2RldmljZXRyZWUvYmluZGluZ3Mv
bWZkL2F0bWVsLWhsY2RjLnR4dCAgIHwgNTYgLS0tLS0tLS0tLS0NCj4+Pj4gICAgMiBmaWxlcyBj
aGFuZ2VkLCA5NyBpbnNlcnRpb25zKCspLCA1NiBkZWxldGlvbnMoLSkNCj4+Pj4gICAgY3JlYXRl
IG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZmQvYXRtZWws
aGxjZGMueWFtbA0KPj4+PiAgICBkZWxldGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL21mZC9hdG1lbC1obGNkYy50eHQNCj4+Pj4NCj4+Pj4gZGlmZiAtLWdp
dCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZmQvYXRtZWwsaGxjZGMueWFt
bCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZmQvYXRtZWwsaGxjZGMueWFt
bA0KPj4+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPj4+PiBpbmRleCAwMDAwMDAwMDAwMDAuLmVj
Y2M5OThhYzQyYw0KPj4+PiAtLS0gL2Rldi9udWxsDQo+Pj4+ICsrKyBiL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9tZmQvYXRtZWwsaGxjZGMueWFtbA0KPj4+PiBAQCAtMCwwICsx
LDk3IEBADQo+Pj4+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMCBPUiBCU0Qt
Mi1DbGF1c2UpDQo+Pj4+ICslWUFNTCAxLjINCj4+Pj4gKy0tLQ0KPj4+PiArJGlkOmh0dHA6Ly9k
ZXZpY2V0cmVlLm9yZy9zY2hlbWFzL21mZC9hdG1lbCxobGNkYy55YW1sIw0KPj4+PiArJHNjaGVt
YTpodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMNCj4+Pj4gKw0K
Pj4+PiArdGl0bGU6IEF0bWVsJ3MgSExDRCBDb250cm9sbGVyDQo+Pj4+ICsNCj4+Pj4gK21haW50
YWluZXJzOg0KPj4+PiArICAtIE5pY29sYXMgRmVycmU8bmljb2xhcy5mZXJyZUBtaWNyb2NoaXAu
Y29tPg0KPj4+PiArICAtIEFsZXhhbmRyZSBCZWxsb25pPGFsZXhhbmRyZS5iZWxsb25pQGJvb3Rs
aW4uY29tPg0KPj4+PiArICAtIENsYXVkaXUgQmV6bmVhPGNsYXVkaXUuYmV6bmVhQHR1eG9uLmRl
dj4NCj4+Pj4gKw0KPj4+PiArZGVzY3JpcHRpb246DQo+Pj4+ICsgIFRoZSBBdG1lbCBITENEQyAo
SExDRCBDb250cm9sbGVyKSBJUCBhdmFpbGFibGUgb24gQXRtZWwgU29DcyBleHBvc2VzIHR3bw0K
Pj4+PiArICBzdWJkZXZpY2VzLCBhIFBXTSBjaGlwIGFuZCBhIERpc3BsYXkgQ29udHJvbGxlci4N
Cj4+Pj4gKw0KPj4+PiArcHJvcGVydGllczoNCj4+Pj4gKyAgY29tcGF0aWJsZToNCj4+Pj4gKyAg
ICBlbnVtOg0KPj4+PiArICAgICAgLSBhdG1lbCxhdDkxc2FtOW4xMi1obGNkYw0KPj4+PiArICAg
ICAgLSBhdG1lbCxhdDkxc2FtOXg1LWhsY2RjDQo+Pj4+ICsgICAgICAtIGF0bWVsLHNhbWE1ZDIt
aGxjZGMNCj4+Pj4gKyAgICAgIC0gYXRtZWwsc2FtYTVkMy1obGNkYw0KPj4+PiArICAgICAgLSBh
dG1lbCxzYW1hNWQ0LWhsY2RjDQo+Pj4+ICsgICAgICAtIG1pY3JvY2hpcCxzYW05eDYwLWhsY2Rj
DQo+Pj4+ICsgICAgICAtIG1pY3JvY2hpcCxzYW05eDc1LXhsY2RjDQo+Pj4+ICsNCj4+Pj4gKyAg
cmVnOg0KPj4+PiArICAgIG1heEl0ZW1zOiAxDQo+Pj4+ICsNCj4+Pj4gKyAgaW50ZXJydXB0czoN
Cj4+Pj4gKyAgICBtYXhJdGVtczogMQ0KPj4+PiArDQo+Pj4+ICsgIGNsb2NrczoNCj4+Pj4gKyAg
ICBtYXhJdGVtczogMw0KPj4+IEhtbSwgb25lIHRoaW5nIEkgcHJvYmFibHkgc2hvdWxkIGhhdmUg
c2FpZCBvbiB0aGUgcHJldmlvdXMgdmVyc2lvbiwgYnV0DQo+Pj4gSSBtaXNzZWQgc29tZWhvdzog
SXQgd291bGQgYmUgZ29vZCB0byBhZGQgYW4gaXRlbXMgbGlzdCB0byB0aGUgY2xvY2tzDQo+Pj4g
cHJvcGVydHkgaGVyZSB0byBleHBsYWluIHdoYXQgdGhlIDMgY2xvY2tzIGFyZS9hcmUgdXNlZCBm
b3IgLSBlc3BlY2lhbGx5DQo+Pj4gc2luY2UgdGhlcmUgaXMgYWRkaXRpb25hbCBjb21wbGV4aXR5
IGJlaW5nIGFkZGVkIGhlcmUgdG8gdXNlIGVpdGhlciB0aGUNCj4+PiBzeXMgb3IgbHZkcyBjbG9j
a3MuDQo+PiBNYXkgSSBpbnF1aXJlIGlmIHRoaXMgYXBwcm9hY2ggaXMgbGlrZWx5IHRvIGJlIGVm
ZmVjdGl2ZT8NCj4+DQo+PiAgICAgY2xvY2tzOg0KPj4gICAgICAgaXRlbXM6DQo+PiAgICAgICAg
IC0gZGVzY3JpcHRpb246IHBlcmlwaGVyYWwgY2xvY2sNCj4+ICAgICAgICAgLSBkZXNjcmlwdGlv
bjogZ2VuZXJpYyBjbG9jayBvciBsdmRzIHBsbCBjbG9jaw0KPj4gICAgICAgICAgICAgT25jZSB0
aGUgTFZEUyBQTEwgaXMgZW5hYmxlZCwgdGhlIHBpeGVsIGNsb2NrIGlzIHVzZWQgYXMgdGhlDQo+
PiAgICAgICAgICAgICBjbG9jayBmb3IgTENEQywgc28gaXRzIEdDTEsgaXMgbm8gbG9uZ2VyIG5l
ZWRlZC4NCj4+ICAgICAgICAgLSBkZXNjcmlwdGlvbjogc2xvdyBjbG9jaw0KPj4gICAgICAgbWF4
SXRlbXM6IDMNCj4gDQo+IEhtbSB0aGF0IHNvdW5kcyB2ZXJ5IHN1c3BlY3QgdG8gbWUuICJPbmNl
IHRoZSBsdmRzcGxsIGlzIGVuYWJsZWQgdGhlDQo+IGdlbmVyaWMgY2xvY2sgaXMgbm8gbG9uZ2Vy
IG5lZWRlZCIgc291bmRzIGxpa2UgYm90aCBjbG9ja3MgY2FuIGJlIHByb3ZpZGVkDQo+IHRvIHRo
ZSBJUCBvbiBkaWZmZXJlbnQgcGlucyBhbmQgdGhlaXIgcHJvdmlzaW9uIGlzIG5vdCBtdXR1YWxs
eQ0KPiBleGNsdXNpdmUsIGp1c3QgdGhhdCB0aGUgSVAgd2lsbCBvbmx5IGFjdHVhbGx5IHVzZSBv
bmUgYXQgYSB0aW1lLiBJZg0KPiB0aGF0IGlzIHRoZSBjYXNlLCB0aGVuIHRoaXMgcGF0Y2ggaXMg
bm90dCBjb3JyZWN0IGFuZCB0aGUgYmluZGluZyBzaG91bGQNCj4gYWxsb3cgZm9yIDQgY2xvY2tz
LCB3aXRoIGJvdGggdGhlIGdlbmVyaWMgY2xvY2sgYW5kIHRoZSBsdmRzIHBsbCBiZWluZw0KPiBw
cmVzZW50IGluIHRoZSBEVCBhdCB0aGUgc2FtZSB0aW1lLg0KPiANCj4gSSB2YWd1ZWx5IHJlY2Fs
bCBpbnRlcm5hbCBkaXNjdXNzaW9uIGFib3V0IHRoaXMgcHJvYmxlbSBzb21lIHRpbWUgYmFjaw0K
PiBidXQgdGhlIGRldGFpbHMgYWxsIGVzY2FwZSBtZS4NCg0KTGV0J3MgZGVsdmUgZGVlcGVyIGlu
dG8gdGhlIGNsb2NrIGNvbmZpZ3VyYXRpb24gZm9yIExDRENfUENLLg0KDQpDb25zaWRlcmluZyB0
aGUgZmxleGliaWxpdHkgb2YgdGhlIGRlc2lnbiwgaXQgYXBwZWFycyB0aGF0IGJvdGggY2xvY2tz
LCANCnN5c19jbGsgKGdlbmVyaWMgY2xvY2spIGFuZCBsdmRzX3BsbF9jbGssIGNhbiBpbmRlZWQg
YmUgcHJvdmlkZWQgdG8gdGhlIA0KSVAgc2ltdWx0YW5lb3VzbHkuIFRoZSBjcnVjaWFsIGFzcGVj
dCwgaG93ZXZlciwgaXMgdGhhdCB0aGUgSVAgd2lsbCANCnV0aWxpemUgb25seSBvbmUgb2YgdGhl
c2UgY2xvY2tzIGF0IGFueSBnaXZlbiB0aW1lLiBUaGlzIGFsaWducyB3aXRoIHRoZSANCnNwZWNp
ZmljIHJlcXVpcmVtZW50cyBvZiB0aGUgYXBwbGljYXRpb24sIHdoZXJlIHRoZSBjaG9pY2Ugb2Yg
Y2xvY2sgDQpkZXBlbmRzIG9uIHdoZXRoZXIgdGhlIExWRFMgaW50ZXJmYWNlIG9yIE1JUEkvRFNJ
IGlzIGluIHVzZS4NCg0KVG8gZW5zdXJlIHByb3BlciBjb25maWd1cmF0aW9uIG9mIHRoZSBwaXhl
bCBjbG9jayBwZXJpb2QsIHdlIG5lZWQgdG8gDQpkaXN0aW5jdGx5IGlkZW50aWZ5IHdoaWNoIGNs
b2NrcyBhcmUgYmVpbmcgdXRpbGl6ZWQuIEZvciBpbnN0YW5jZSwgaW4gDQp0aGUgTFZEUyBpbnRl
cmZhY2Ugc2NlbmFyaW8sIHRoZSBsdmRzX3BsbF9jbGsgaXMgZXNzZW50aWFsLCByZXN1bHRpbmcg
aW4gDQpMQ0RDX1BDSyBiZWluZyBzZXQgdG8gdGhlIHNvdXJjZSBjbG9jay4gQ29udmVyc2VseSwg
aW4gdGhlIE1JUEkvRFNJIA0KY2FzZSwgdGhlIExDREMgR0NMSyBpcyByZXF1aXJlZCwgbGVhZGlu
ZyB0byBMQ0RDX1BDSyBiZWluZyBkZWZpbmVkIGFzIA0Kc291cmNlIGNsb2NrL0NMS0RJVisyLg0K
DQpDb25zaWRlcmluZyB0aGUgcG90ZW50aWFsIGNvZXhpc3RlbmNlIG9mIHN5c19jbGsgYW5kIGx2
ZHNfcGxsX2NsayBpbiB0aGUgDQpEZXZpY2UgVHJlZSAoRFQpLCB3ZSBtYXkgbmVlZCB0byBpbnRy
b2R1Y2UgYW4gYWRkaXRpb25hbCBmbGFnIGluIHRoZSBEVC4gDQpUaGlzIGZsYWcgY291bGQgc2Vy
dmUgYXMgYSBjbGVhciBpbmRpY2F0b3Igb2Ygd2hldGhlciB0aGUgTFZEUyBpbnRlcmZhY2UgDQpv
ciBNSVBJL0RTSSBpcyBiZWluZyBlbXBsb3llZC4gQXMgd2UgZGlzY3Vzc2VkIHRvIGRyb3AgdGhp
cyBmbGFnIGFuZCANCmp1c3QgaGF2ZSBhbnkgb25lIG9mIHRoZSBjbG9ja3MgSSBiZWxpZXZlIHRo
YXQgdGhpcyBhcHByb2FjaCBwcm92aWRlcyBhIA0Kc2Vuc2libGUgYW5kIHNjYWxhYmxlIHNvbHV0
aW9uLCBhbGxvd2luZyBmb3IgYSBjb21wcmVoZW5zaXZlIA0KcmVwcmVzZW50YXRpb24gb2YgdGhl
IGNsb2NraW5nIGNvbmZpZ3VyYXRpb24uDQo+IA0KPiBUaGFua3MsDQo+IENvbm9yLg0KDQotLSAN
CldpdGggQmVzdCBSZWdhcmRzLA0KRGhhcm1hIEIuDQoNCg==
