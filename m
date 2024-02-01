Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E76784500D
	for <lists+dri-devel@lfdr.de>; Thu,  1 Feb 2024 05:11:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 669A110E1D8;
	Thu,  1 Feb 2024 04:11:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 828AF10E3A7
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Feb 2024 04:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1706760676; x=1738296676;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=l+AysfRcOvqD7ESAwqdnDH0ZtZ+CGIP/v0OP1tu2D3c=;
 b=kcA6L7Jm+sAkAc7hmt3cfZdpDOgKyRDY9NoeQHgpkpn7qk/CpwZBk72p
 +hopnCiVnt/x9Rtq5iNzzGvebOeza+NRREfEpXLmo2CcJJz+TnzOipovT
 sTKD8UvSC+CVwoKqpqRzpgM9RTq6zUTBO5ODZloRjmtJ7sxJ2z4GkS14y
 Uvw390FZlakeVoVLwN2yC3slRmLVzMfsKezgv2EnMXCPVD7xTF61/cbIi
 WhX8zSs5/wUZJhcsNxbYcoYqJyaif3CvAOJU57vb0ezVY68n8Dck6f0u8
 VcBjKjOCOxkrevmBdouk1OqK6YfxCq9uwwWzDEfF+AQzs5jJn+9GTQmHL w==;
X-CSE-ConnectionGUID: 0BjHau/9RE+Vi8gjX3cVVQ==
X-CSE-MsgGUID: r9mhbEMyTry78j+a21cIjQ==
X-IronPort-AV: E=Sophos;i="6.05,234,1701154800"; d="scan'208";a="246330482"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 31 Jan 2024 21:11:04 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 31 Jan 2024 21:10:43 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (10.10.215.250)
 by email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 31 Jan 2024 21:10:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BnWFGCKasd2kKX6lzYm6dXEgRmG4igrzHlmrdxBwM0J+8UQLV3pdSgF/J6of4PdG+Y8SzjiG2I9JItnnFcFws3yxn8wd0TWXDMkP2P1C62/TBNn5IEKf+uMmAPrYxcZlx1HSi7sbGmaToz547quLkL5MzFukeWt1F+5zgeoha3jbfvoYRW5tyNcQbwV15eJxjmP/4QaIMcPaksLJ39HqQ2C6MtEgnJ0AMfX1wiLOt4A+/+oJO42FbMqqapqtAdqCLBNHUdfBiGL9FonKC3O+YCKOKxPo7VJ+s6BggQY0qC0XLuhJiBf5u0WogX7LjgU83pO9gYDGe8WIWOFoJVfeLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l+AysfRcOvqD7ESAwqdnDH0ZtZ+CGIP/v0OP1tu2D3c=;
 b=BpXcqzu3gD4zGFTexYE8gueKui5VsLoZaWo4+tdme9C6Xg8oSBD9BSfQ8NCSVyPYfXeVKmwOLwQAuoEwGsd5Oy9lL+KEinH3b7nbHTLSveNYooJqE9DVBVBKDcJRVV+VB8JYGCWAAOOXUHWBwlyHId6gXWN1KnIr77bUhbMl35Gi7pvcI9q0uYo5jvEu9ldS2J10vODQ283M1IBChGI+sPF5pg8Btqb2FHBXb8VxS9P400cKCsJMlewAkkedDIFrjYLrfOFydqf2UCC5jI545DmuFOZ9CYCSjyDVdzIEsrn5o0jdha/J1lXTs2/kFaGFkT8+eGyW/mpxPNB76y0OXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l+AysfRcOvqD7ESAwqdnDH0ZtZ+CGIP/v0OP1tu2D3c=;
 b=eiNhUj8fLhrs8qHaVcUIgCrSeKam3u0yJnYS2ZGBNkyQ/m6fWmVIdVSOIrTnWejm33RSO3J3OOM4nkCHhbdRCVEQVn/NZNRNKinUlfhnbB+wxSwk12s4g4UZQ8x9pdaPrrDgyjTWKUcsMc2dA82X4U6xs5gIZmS4WDaCdAFeXe3iM6u5vadCedbbFt/6AfRZqbafZRbXy7H7ZHCVI/KMFiZReCL4FIob6bBNgBTMapdJZkasxYUFpxyfbB+6N4TRqRLuHN/kJRlmAXyIkis8qsiy6ENtfBeUd/FjcmD8i6cZMpZ0UyfwosQaf5M4bLuWq3vWwnpGCfnYyKXSTAmQCA==
Received: from PH7PR11MB6451.namprd11.prod.outlook.com (2603:10b6:510:1f4::16)
 by SA3PR11MB7415.namprd11.prod.outlook.com (2603:10b6:806:318::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.22; Thu, 1 Feb
 2024 04:10:40 +0000
Received: from PH7PR11MB6451.namprd11.prod.outlook.com
 ([fe80::80b9:80a3:e88a:57ee]) by PH7PR11MB6451.namprd11.prod.outlook.com
 ([fe80::80b9:80a3:e88a:57ee%3]) with mapi id 15.20.7249.024; Thu, 1 Feb 2024
 04:10:39 +0000
From: <Dharma.B@microchip.com>
To: <robh@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: display: bridge: add sam9x7-lvds
 compatible
Thread-Topic: [PATCH 1/3] dt-bindings: display: bridge: add sam9x7-lvds
 compatible
Thread-Index: AQHaTQ1DHzJ2CWHeI0qiVB4kob88PbDl+48AgAAM8gCAALjbgIAMBTGAgAIok4A=
Date: Thu, 1 Feb 2024 04:10:39 +0000
Message-ID: <f980706a-2bc7-46f2-8c3e-1cc62a1e2cb7@microchip.com>
References: <20240122082947.21645-1-dharma.b@microchip.com>
 <20240122082947.21645-2-dharma.b@microchip.com>
 <10a88fc6-2c4c-4f77-850f-f15b21a8ed49@kernel.org>
 <20240122-privacy-preschool-27dc7dcc5529@spud>
 <01c4fc05-9b3f-4007-9216-444a4306efd7@microchip.com>
 <20240130191255.GA2164257-robh@kernel.org>
In-Reply-To: <20240130191255.GA2164257-robh@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6451:EE_|SA3PR11MB7415:EE_
x-ms-office365-filtering-correlation-id: 73f0f881-bb35-4b6d-56a3-08dc22dbc021
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fSsCjyVZMrWGTnASxZcQEklvOHQi40i/HbwSl1SLubWe7RfZC5n/P4tHwu8gGJ1fgmwKgzQP8/zo03AOg7AZDJAlitrZ5dOHiaouV7Qp6L+3QhQoWGC7Rnk8d8e0PJJYEoR5PVuzYi0hz+U/EivxUZ5Lw5TvzHfFxf8ZZSPON1piQaO/bcb6+Zs4bYo1nPIQ40UfZ2NPl7IhJglq3VTikM2mTWxCkByr+RglSweO/yrEvP9w2OYTAU47QbWZiVo3kSzm984C67gHejv8wpYlY6QNgXIgDgHcxsPHiRtyNUtRxajaouY79q6zstHtQo6lm4M12GG4rF9oD7cyivjCHgkCRUkPd+feZqqlejvHgvhJcQZtoSqWybxIdrtyZyfTWQFuFOJEJ+Z6NHzT880SBPO0s8weqA3VkpvFHQmwSXNM0yPOf1uC8FdDEGbMRM0Ef9lnu/SoIe0GRGYxn2F11GA+gOO1TULDM2g+f1fBlAW7bqTcnCL1TOjnp6ahFR4oBWnie6FtKbxY6rTpFIAuMHlOBNuCCDB0gHOr0xu/D64gU5FoqAFsFT7jaT8vF945eEczF90wljnwy4FyMtmk0SR+Y6qIst5R+IPnj3sPAjxEoHQb6RBO7rLs6YPyrOY2PmxEG4/Pz/ThS9igFaC9BHzGIKyP8Gsr4xJWCaR7Y35X/4c807r5heajMFSNt+oNx9BBQM90MmONJ+cnOP0hYDxmFJXNG3bol46U4P5NsaE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6451.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(376002)(366004)(396003)(136003)(230273577357003)(230173577357003)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(31686004)(2616005)(107886003)(41300700001)(26005)(66476007)(38070700009)(316002)(54906003)(66446008)(36756003)(6916009)(478600001)(6506007)(6512007)(6486002)(53546011)(71200400001)(38100700002)(66556008)(122000001)(64756008)(2906002)(8936002)(31696002)(86362001)(5660300002)(66946007)(76116006)(7416002)(8676002)(4326008)(91956017)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Ym4rK1htQnRaUE5QVVJZNXdXWjJHWi96dmZra2xwTXFCRzZxOEVNYkxWNnYy?=
 =?utf-8?B?VHV4WGlEZHhvVjlWNEhOM21KT3hZVmNHNjJzYVh4NlJZZHRIc1k5TjRoV215?=
 =?utf-8?B?Q2RiMU1yT2ZsRCtSQUlFNjJzdktSL2tzVzlDbE0raHNIamhIMUZzOFA0UnFH?=
 =?utf-8?B?S2YxUXpQVU03bVpVWTFTcW1ESlRKQXlwbUNHSE5QUTBJdFk3SG1yRmpLTSto?=
 =?utf-8?B?RDVXdU1Fd2xkeTdRc3BZR01kb1BvME5SYnlweGtWT3pBTGJNNGRyamZmbFVy?=
 =?utf-8?B?UElGVCtKWnFRczA1WFFrdWFpZmszMnVpWmxDRFVNejFaNVlWdzU2Vm9PUS9Y?=
 =?utf-8?B?Y3N1S01TUEJnTkZTaFFCcFF4bjVwU01SRWZzZkNQYk9qam15ckQ2TFJ1OEJr?=
 =?utf-8?B?NElFeXFVRW5YakhLRUtsc1huQ2JrWkVrZFkwRm50RURoMStYNzQvZmsySUVI?=
 =?utf-8?B?Mnp3ZG1rZHV0VW5BQzJkbjc5QXl3ajB0VjhQYXYvMys3VjB1dDl6ZzRkNUNI?=
 =?utf-8?B?TkhEUHRnOWhMNU05VEJvUDU5NmlEdWlXTFNxbWM4dWZXRFdhY1ExQnpyUXAy?=
 =?utf-8?B?SXJzS1NmTk5mbVFyY0QwK3FGSWl0LzJzVVdFSXowMjRnTzRCWlBpL0Via2lB?=
 =?utf-8?B?VFczTFVzZXpXVVVXSVZ4c1ZWN21yTkFyY2NDaDF3TTJoNWRxRW4zNVFodHBp?=
 =?utf-8?B?dzF6T3laNnV4bG1JUU1lZnprTWxXMUUwYXI1NFFJVGc3V1JLdWJPemUyU0hj?=
 =?utf-8?B?dTd2K0NlT2tZK2hoZUxzcnRyTnR2V0tjNHBrWWZER0M3dmhYeGNjWFlQV2lO?=
 =?utf-8?B?RFpWN1JEUFY3d09TR1NIdmQ0ZEtQVTdObStZeGRTWGN6aldiRkNRYldOVGdE?=
 =?utf-8?B?WmxFRFZaMlZuNjRQYTNnWkN0THYzSThLMnJiWURrQkpiQ3ZJVEFEUTAzOFFI?=
 =?utf-8?B?R0p4MEMvWDRnL09XRlovN1Z4QTF2UE1LZ01UMG4xd1A0T2JPbGRzcFVZR3kr?=
 =?utf-8?B?cmRUaDRFTTFmRWhlbTR4M2xWRTVMWXRQMHVxbWV0Q0xyZEh6T29OdGJzOXJS?=
 =?utf-8?B?NlVESFl6RnpIajR6N2I2dDVkZit2SDNERjNobXlHS25MTHcvZHRMR3ZaY0cz?=
 =?utf-8?B?TTc1VFFabkV5VHd0aFcrWkFvQk9oeTducDFtVVE3NnNEYUJvY0R1NHU2YTg2?=
 =?utf-8?B?aFo1dGdORllKN1o1L1M2RkY0Y3N3dHZiVjRqVi9GbityNGs4SVBIOS9vakJR?=
 =?utf-8?B?M2dmMjFWdTNkNUZXTEJ4UlU4Z3dINDhnbUI3amlrcFArcDduV0VVbHpsSkxy?=
 =?utf-8?B?alUweG1NUDkwM2lqK1Q1M2dEakhWZHZFVVJwL0cya1pBNGE5Rzdrc3E0bkJ3?=
 =?utf-8?B?cEt4SVk4MGpFZ2ozK0o3NkEwdFh4L0Jja21MM2dqR1VnUGVJejgzemttTDlj?=
 =?utf-8?B?U3NtQjFHVzJUQ2xaOUtMVjl2QlIyZUVrb3pjdC9uQTRIajNxY05BYWQ1N1NH?=
 =?utf-8?B?ckc5ak5NRmI5b1ZoWWFVNDhVS3pNUVNRQmVocmtTdXlnK1dxSHhBSENrcFNn?=
 =?utf-8?B?UDV5cWV5Q3VhLzU1aFN1bzNNekpNSlhxWDEvMHRqVElYd21qODRBMDZvMEpC?=
 =?utf-8?B?dXhXT0liOFdqMzdIMFVpQjRhaWZkNGY3by9RMXFqRElQYXI0bXFtRkd3NmNR?=
 =?utf-8?B?akFvVTBQUEVSdWlxNWdldjRGbDJaTnVSRmcvdTZRS2Vkbi85TGtSaXNIaFBw?=
 =?utf-8?B?ZHlQWkZrQzV2MXU1Zk1LWjFTcTFNamZGN3I3V0I5aTRsdjZWNDViYk5maWdl?=
 =?utf-8?B?T3EzOW9EYjVoY0tNUFZzNXhOSDVUUHB4NW4zTmQ2L1Z5T1kvNmZhVjBteVla?=
 =?utf-8?B?WXFRMlA5SjUxR1lnVUUybjQxdm5sVWNIdnQ4dExoSjRQMXd2b2ZlWndacjFp?=
 =?utf-8?B?emgrYVg2U051YkZ5bFJPZXR1WUVKZ0RTUUhXVTlBVmRJQUYxaTJ1ejl6T3BB?=
 =?utf-8?B?R1IvRmFiWDRya1RaN1hrTW5TakVoWUQrT1E1VklQcVNMWTRiRnZsMkF2VWo0?=
 =?utf-8?B?NUh5ZjA2ZTU1Nkt1N1E3aUtxK1ErK3lzUFg4bkhiRm4waWd2Vk5PV01FKzJr?=
 =?utf-8?Q?Xr0LwW9+OONZoVB1Ap3Qxj4Sg?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <06A09265F4CD544DAD466F450E28DE3D@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6451.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73f0f881-bb35-4b6d-56a3-08dc22dbc021
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Feb 2024 04:10:39.6212 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9rTBs8R+yUD8V2aEPTMp+IfgpvMQwAkFWy04zlEOGBUbIwrI5NALJwiGut4Ct1VKt5FKA9LC+ZqJ6Px7HMZZDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7415
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

T24gMzEvMDEvMjQgMTI6NDIgYW0sIFJvYiBIZXJyaW5nIHdyb3RlOg0KPiBFWFRFUk5BTCBFTUFJ
TDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBrbm93
IHRoZSBjb250ZW50IGlzIHNhZmUNCj4gDQo+IE9uIFR1ZSwgSmFuIDIzLCAyMDI0IGF0IDAzOjM5
OjEzQU0gKzAwMDAsIERoYXJtYS5CQG1pY3JvY2hpcC5jb20gd3JvdGU6DQo+PiBIaSBDb25vciwN
Cj4+DQo+PiBPbiAyMi8wMS8yNCAxMDowNyBwbSwgQ29ub3IgRG9vbGV5IHdyb3RlOg0KPj4+IE9u
IE1vbiwgSmFuIDIyLCAyMDI0IGF0IDA0OjUxOjE2UE0gKzAxMDAsIEtyenlzenRvZiBLb3psb3dz
a2kgd3JvdGU6DQo+Pj4+IE9uIDIyLzAxLzIwMjQgMDk6MjksIERoYXJtYSBCYWxhc3ViaXJhbWFu
aSB3cm90ZToNCj4+Pj4+IEFkZCB0aGUgJ3NhbTl4Ny1sdmRzJyBjb21wYXRpYmxlIGJpbmRpbmcs
IHdoaWNoIGRlc2NyaWJlcyB0aGUNCj4+Pj4+IExvdyBWb2x0YWdlIERpZmZlcmVudGlhbCBTaWdu
YWxpbmcgKExWRFMpIENvbnRyb2xsZXIgZm91bmQgb24gTWljcm9jaGlwJ3MNCj4+Pj4+IHNhbTl4
NyBzZXJpZXMgU3lzdGVtLW9uLUNoaXAgKFNvQykgZGV2aWNlcy4gVGhpcyBiaW5kaW5nIHdpbGwg
YmUgdXNlZCB0bw0KPj4+Pj4gZGVmaW5lIHRoZSBwcm9wZXJ0aWVzIGFuZCBjb25maWd1cmF0aW9u
IGZvciB0aGUgTFZEUyBDb250cm9sbGVyIGluIERULg0KPj4+Pj4NCj4+Pj4+IFNpZ25lZC1vZmYt
Ynk6IERoYXJtYSBCYWxhc3ViaXJhbWFuaTxkaGFybWEuYkBtaWNyb2NoaXAuY29tPg0KPj4+Pj4g
LS0tDQo+Pj4+PiAgICAuLi4vZGlzcGxheS9icmlkZ2UvbWljcm9jaGlwLHNhbTl4Ny1sdmRzLnlh
bWwgfCA1OSArKysrKysrKysrKysrKysrKysrDQo+Pj4+PiAgICAxIGZpbGUgY2hhbmdlZCwgNTkg
aW5zZXJ0aW9ucygrKQ0KPj4+Pj4gICAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9taWNyb2NoaXAsc2FtOXg3LWx2ZHMu
eWFtbA0KPj4+Pj4NCj4+Pj4+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvZGlzcGxheS9icmlkZ2UvbWljcm9jaGlwLHNhbTl4Ny1sdmRzLnlhbWwgYi9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvbWljcm9jaGlwLHNh
bTl4Ny1sdmRzLnlhbWwNCj4+Pj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+Pj4+PiBpbmRleCAw
MDAwMDAwMDAwMDAuLjhjMmM1Yjg1OGM4NQ0KPj4+Pj4gLS0tIC9kZXYvbnVsbA0KPj4+Pj4gKysr
IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL21pY3Jv
Y2hpcCxzYW05eDctbHZkcy55YW1sDQo+Pj4+PiBAQCAtMCwwICsxLDU5IEBADQo+Pj4+PiArIyBT
UERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAtb25seSBPUiBCU0QtMi1DbGF1c2UpDQo+
Pj4+PiArJVlBTUwgMS4yDQo+Pj4+PiArLS0tDQo+Pj4+PiArJGlkOmh0dHA6Ly9kZXZpY2V0cmVl
Lm9yZy9zY2hlbWFzL2Rpc3BsYXkvYnJpZGdlL21pY3JvY2hpcCxzYW05eDctbHZkcy55YW1sIw0K
Pj4+Pj4gKyRzY2hlbWE6aHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlh
bWwjDQo+Pj4+PiArDQo+Pj4+PiArdGl0bGU6IE1pY3JvY2hpcCBTQU05WDcgTFZEUyBDb250cm9s
bGVyDQo+Pj4+IFdoYXQgaXMgdGhlICJYIj8NCj4+Pj4NCj4+Pj4+ICsNCj4+Pj4+ICttYWludGFp
bmVyczoNCj4+Pj4+ICsgIC0gRGhhcm1hIEJhbGFzdWJpcmFtYW5pPGRoYXJtYS5iQG1pY3JvY2hp
cC5jb20+DQo+Pj4+PiArDQo+Pj4+PiArZGVzY3JpcHRpb246IHwNCj4+Pj4gRG8gbm90IG5lZWQg
J3wnIHVubGVzcyB5b3UgbmVlZCB0byBwcmVzZXJ2ZSBmb3JtYXR0aW5nLg0KPj4+Pg0KPj4+Pj4g
KyAgVGhlIExvdyBWb2x0YWdlIERpZmZlcmVudGlhbCBTaWduYWxpbmcgQ29udHJvbGxlciAoTFZE
U0MpIG1hbmFnZXMgZGF0YQ0KPj4+Pj4gKyAgZm9ybWF0IGNvbnZlcnNpb24gZnJvbSB0aGUgTENE
IENvbnRyb2xsZXIgaW50ZXJuYWwgRFBJIGJ1cyB0byBPcGVuTERJDQo+Pj4+PiArICBMVkRTIG91
dHB1dCBzaWduYWxzLiBMVkRTQyBmdW5jdGlvbnMgaW5jbHVkZSBiaXQgbWFwcGluZywgYmFsYW5j
ZWQgbW9kZQ0KPj4+Pj4gKyAgbWFuYWdlbWVudCwgYW5kIHNlcmlhbGl6ZXIuDQo+Pj4+PiArDQo+
Pj4+PiArcHJvcGVydGllczoNCj4+Pj4+ICsgIGNvbXBhdGlibGU6DQo+Pj4+PiArICAgIGNvbnN0
OiBtaWNyb2NoaXAsc2FtOXg3LWx2ZHMNCj4+Pj4gV2hhdCBpcyAieCI/IFdpbGRjYXJkPyBUaGVu
IG5vLCBkb24ndCB1c2UgaXQgYW5kIGluc3RlYWQgdXNlIHByb3BlciBTb0MNCj4+Pj4gdmVyc2lv
biBudW1iZXIuDQo+Pj4gVGhlc2UgU29DcyBhY3R1YWxseSBkbyBoYXZlIGFuIHggaW4gdGhlaXIg
bmFtZS4gSG93ZXZlciwgYW5kIEkgZG8gYWx3YXlzDQo+Pj4gZ2V0IGNvbmZ1c2VkIGhlcmUsIHRo
ZSBzYW05eDcgaXMgYSBzZXJpZXMgb2YgU29DcyAodGhlIGNvdmVyIGxldHRlciBkb2VzDQo+Pj4g
c2F5IHRoaXMpIHJhdGhlciB0aGFuIGEgc3BlY2lmaWMgZGV2aWNlLg0KPj4+IEkgdGhpbmsgdGhl
IHNlcmllcyBjdXJyZW50IGNvbnNpc3RzIG9mIGEgc2FtOXg3MCBzYW05eDcyIGFuZCBhIHNhbTl4
NzUuDQo+Pj4gVGhlIGRldmljZXMgYXJlIGxhcmdlbHkgc2ltaWxhciwgYnV0IEkgYW0gbm90IHN1
cmUgaWYgdGhlIHNhbTl4NzANCj4+PiBzdXBwb3J0cyBMVkRTIGF0IGFsbC4gSGF2aW5nIGEgY29t
cGF0aWJsZSBmb3IgdGhlIHNlcmllcyBkb2VzIG5vdCBzZWVtDQo+Pj4gY29ycmVjdCB0byBtZS4N
Cj4+IFllcywgeW91IGFyZSBjb3JyZWN0LiBPbmx5IHNhbTl4NzIgYW5kIHNhbTl4NzUgaGF2ZSBM
VkRTIHN1cHBvcnQsIHdoaWxlDQo+PiBzYW05eDcwIGRvZXMgbm90LiBJIHdpbGwgcmV2aXNlIHRo
ZSBjb21wYXRpYmlsaXR5IHRvIGluY2x1ZGUgYm90aA0KPj4gc2FtOXg3MiBhbmQgc2FtOXg3NSwg
YXMgb3V0bGluZWQgYmVsb3c6DQo+Pg0KPj4gcHJvcGVydGllczoNCj4+ICAgICBjb21wYXRpYmxl
Og0KPj4gICAgICAgZW51bToNCj4+ICAgICAgICAgLSBtaWNyb2NoaXAsc2FtOXg3Mi1sdmRzDQo+
PiAgICAgICAgIC0gbWljcm9jaGlwLHNhbTl4NzUtbHZkcw0KPiANCj4gSSB3b3VsZCBwcmVzdW1l
IHRoZXNlIDIgYXJlIHRoZSBzYW1lLCBidXQgdGhlIGFib3ZlIGltcGxpZXMgdGhleQ0KPiBhcmVu
J3QuIEkgdGhpbmsgd2hhdCB5b3UgaGFkIGlzIGZpbmUgYXNzdW1pbmcgdGhlc2UgYXJlIGFsbA0K
PiBmdW5kYW1lbnRhbGx5IHRoZSBzYW1lIHBhcnQgd2l0aCBqdXN0IHBhY2thZ2luZyBvciBmdXNl
ZCBvZmYgaC93DQo+IGRpZmZlcmVuY2VzLg0KDQpZZXMsIHNvIGlzIGl0IG9rYXkgdG8gaGF2ZSBj
b21wYXRpYmxlIGZvciBhIHNlcmllcz8gU2hhbGwgSSBnbyBhaGVhZCB3aXRoDQoiDQogICBjb21w
YXRpYmxlOg0KICAgICBjb25zdDogbWljcm9jaGlwLHNhbTl4Ny1sdmRzDQoiDQppdHNlbGY/DQoN
Ci0tIA0KVGhhbmtzLA0KRGhhcm1hIEIuDQo+IA0KPiBSb2INCg0KDQoNCg==
