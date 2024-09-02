Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29827968216
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2024 10:35:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AFD810E258;
	Mon,  2 Sep 2024 08:35:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="PwJFxT9y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2041.outbound.protection.outlook.com [40.107.94.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EEAC10E258
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2024 08:35:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hqlu3OrgrJc9sJhmfF0g7zYPFQ5EgL0mB7qIz9sCL9RQOk/3DYbcNTH0KrBnIz9lUOtApGQ8HmJbWzh72Nc2LNQ4uCZaPKUeM5Zjkw8ew3C1Jhvf/5TtmV7DuZkSXm0+aLf2k5R/NLtBiijOH7B/iX6uLDt/0OUfgIx6gLl6BZFetsmpn+oyq3thhqV9/xG/hXQ8Zz2CVnD3ifIrKGIF+x6B6Ftb+zT/kBqZzBTEzh4PZUX1+RN9URm5wjDTlXvzUn9WRKMKqbpFB85UUeBoMZXDdpAXz+jWlhIBgL4Ag/peEADjFKq9fAqRG2rWtDYLllbhz6+V/kuV2E4s+f1L4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZINlj3dCbUmAVRY8E6blvJPlpY6sUmO0ONgzS+MyNeA=;
 b=OBvJhZGpgwKN0kkV6XAv45p/gTf3UAv3pHKbECKqySIbp6KUgNjG2Gma+52kcF6VUrx0w9tlCOnZ3B968daFnmk+bOXA13/G+1Gl8sa2w0e0J9CJ494OtustCyznC9PXMIe7FkKeRUC8PPXBwtcxmIwgGxiE30M7yNb4E3TJHw5mz/vLuH/4/DzEu8M64ubA50ZtTsLuv+HNOQ1swc4eyyLg3lex2zOHHp00V/iKcs0lCBFBt9S0TyGu3FyQjf5LDGKiU6NPUvAM9AV1HXbk34C5k8nX7cXC2VLUDWRBRN7ovOldpz1XpxwAjbVM2c4z1clVMaNfhZgYjhWOJd8nXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZINlj3dCbUmAVRY8E6blvJPlpY6sUmO0ONgzS+MyNeA=;
 b=PwJFxT9ytCGIQBkhn/JwrvQ2WD78s0aDFrZb3/yqZFtp43cTCHcNev/AlLGWzeDX8bfH759zCNIEPndO/41hnOmtsmeSySMd5MAx8CmDcp7Oa4Rzod2fsroy2v8UKC2z3547ahr3F8qPthU/veZmKRL+2Adz1QZJLQshFXCO0Yh5x66ZQ4QyiRF6DjNHeB4VRMGnzTS4jw4S/fTyaOeGhiGg28rfNzmU8eEJClwNSH9fBIw04kNOZOyAW3izE3/U16Ul5zJaDeWcFKAcFmKXmw+oFIJBLyKTpbwJifHZLfgyS+nt3cKLB81tZKHOH2viOAhDM/WE/4KybxHgsPg9bw==
Received: from PH7PR11MB6451.namprd11.prod.outlook.com (2603:10b6:510:1f4::16)
 by LV8PR11MB8485.namprd11.prod.outlook.com (2603:10b6:408:1e6::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.24; Mon, 2 Sep
 2024 08:35:47 +0000
Received: from PH7PR11MB6451.namprd11.prod.outlook.com
 ([fe80::80a8:f388:d92e:41f8]) by PH7PR11MB6451.namprd11.prod.outlook.com
 ([fe80::80a8:f388:d92e:41f8%6]) with mapi id 15.20.7918.020; Mon, 2 Sep 2024
 08:35:47 +0000
From: <Dharma.B@microchip.com>
To: <claudiu.beznea@tuxon.dev>, <Manikandan.M@microchip.com>,
 <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>, <rfoss@kernel.org>,
 <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@gmail.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <Hari.PrasathGE@microchip.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/3] drm/bridge: microchip-lvds: Use
 devm_platform_ioremap_resource()
Thread-Topic: [PATCH 3/3] drm/bridge: microchip-lvds: Use
 devm_platform_ioremap_resource()
Thread-Index: AQHa+Jv6o1VJo8WIvk6M+dMWgRJh+7JENP4A
Date: Mon, 2 Sep 2024 08:35:47 +0000
Message-ID: <3ceb248f-aa3a-4aa7-ac8b-dbfe9527f541@microchip.com>
References: <20240827161223.4152195-1-claudiu.beznea@tuxon.dev>
 <20240827161223.4152195-4-claudiu.beznea@tuxon.dev>
In-Reply-To: <20240827161223.4152195-4-claudiu.beznea@tuxon.dev>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6451:EE_|LV8PR11MB8485:EE_
x-ms-office365-filtering-correlation-id: 3e45d272-b1aa-43c8-d096-08dccb2a3e21
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6451.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700018)(921020);
 DIR:OUT; SFP:1101; 
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|38070700018|921020; 
x-microsoft-antispam-message-info: =?utf-8?B?aW55Ykx3SW5FVlUwdWs1TzlHdlAyWFlOS0ZLaDNCT0YreWpTU1diMGFTYUkw?=
 =?utf-8?B?V0t6N1lFRkl5Ylp6dW1sMGRvYTNKalpsTytXR3g5b21sRVhPck9sZDNwc1JI?=
 =?utf-8?B?R2hDdE1MSDlVdU1lRnZYS0trVy9xVUR6ZllQTUZOMzRJQXVRbnNPb2ljbEov?=
 =?utf-8?B?eEdwWTQ1MCtFRFhEaUZNeWtMbkhNKzZUNzFZS1NOdG5WSVk5ekc0d1BUNmk4?=
 =?utf-8?B?UkVpL1hTVzFGSWxueE5lQ3kxKytmVkdzckVOMDZ0bTdKQ1R6Y1MxQzBWRkk1?=
 =?utf-8?B?THExV000d2Z1UkZzYXJYYUVJYUtSamlvTkxnY1cyeFVwZDVGdUg5YmJ0RFZq?=
 =?utf-8?B?RE1JeE1PNjBTSFIyeGVGbTdqZDdFZmNubEZVQ2M5NWUxQ0EveFpGYnBhZ3d1?=
 =?utf-8?B?bUd2UjRUQkxFYThBOVpna3ZDYjhtRDNXNkkzRnBZU3h4MDZEMDdDNFhWM0pS?=
 =?utf-8?B?Z0duOXM2QWRFcTdGQ3lhWmtQSWVGZzRPRTUwTjhXZWN5RytDeFgyVG9mZWk2?=
 =?utf-8?B?RlZMTEZHZmZzaENTVjVqYWRDSVBib1ZlbzJZL252Nml2a21kSGZhMnJ3ekdE?=
 =?utf-8?B?Mng5bHJ1djdZb0ZyRkFmRVNtdnFUODBTTTYyamtWUmF6Z0JxTmt1TDYwdkVq?=
 =?utf-8?B?OVhGNTI5S056RmQvb2VHbVVkUDVSMW9qa2h4bnN4dllydTkyK2pYbkN6a0xr?=
 =?utf-8?B?NWtEdXpWYSt1c1F6UVBlRVkzWHpoUWVuNXQxWU14cGY3VzhiS3dIZ21zcFFn?=
 =?utf-8?B?YTZYY2lhL3FORkFQdnFXc0xEbFFrZ1pGS2kxbCttcEhuejMxR3BqNHNScFRM?=
 =?utf-8?B?QWZSZ0Z1RHRTbjBmZStCMmxBemhYU2d5YVpDa2RqZVF1NGJWb0JCMmI4RDVm?=
 =?utf-8?B?bVpKbEdxc0RhenBPTVpBRGJUQ3hoS2hka3gzdGZ6M0tSUzZOaEVSdEtrUXhT?=
 =?utf-8?B?WHdXQVZTdndUQUJBTlViNkdBUHFhZW9OZGdITEZJSkJHQ1hQQTMyR1pURTVk?=
 =?utf-8?B?V3FUdXpkMUJPM1ZaVW9kdXFxU2UvSEJiRmxLb1RxN2FHNkNDWlJVNDNoeXda?=
 =?utf-8?B?MGMxcmQ4bVJaYUtJVWM4bFlESWErL3A2ZGRxNjhJUkxiVGxxSGZkNWh5clln?=
 =?utf-8?B?ak1scW1rbW5xL2hFL3lhcmdtbHk0ZGNScHN0YUNDK2tpTm1XMEpMbFltSlQ3?=
 =?utf-8?B?cHg4am9qSlFNTXRpaDJhVWVEa0hEV0F4MTJNOGJCaU9OQjBIZ1dacDA1Y0No?=
 =?utf-8?B?c2VwYmpPbTZwamF6bDBXQ2pTNU1nV3hhZUFqcU1UUVl1QUp3dVFDNnk0NFZ1?=
 =?utf-8?B?OGl1ZVY1Ti9wRk9hUW4xQkl0Qmxkc0hDSVB4Zk5KRDBTS0FXNGoyaGhpLzZh?=
 =?utf-8?B?MFk1SnZVSU5HS1MzZDNvNVlBNitFbVg3bk5tUHVRSUUxblFyTVE1VnI1THB1?=
 =?utf-8?B?QWZSSEd3WkZmUkZJcUtWTlpaK0dsYmFBVmhlTXZCTW40RzRXazFvU29XdDFa?=
 =?utf-8?B?RXpWenNjYldQZlE1b1FxQnZPaWdUQjV2QVdmcEN3ZVp2ZjVkVkZ5eHpLUFpN?=
 =?utf-8?B?cDQxQ3hqRHNTQlV6Z05DN3pXN1NwU09oSjYvNzAwU1daRGZ6MVc3RVJIRnZB?=
 =?utf-8?B?emduaW5jeEFDUFRhZHl0aWlXSFl3VlZHdDUwQnVJSThIdUd6Z1N6emFGYjc1?=
 =?utf-8?B?QXNqVm96azFucFpySENYN3NUS0xERkJQZXh6Q3JIUEpEU3VlQ0swNEdHWFVM?=
 =?utf-8?B?WWtBUHNIUHEvUXNiWkliZk5ZTTNkWUVZdW13Smt0K0tmUXh6ZUltcUlsQS9F?=
 =?utf-8?B?TmR1ZFVlMmdpZjd2aHA5dmpCeGNxV3ptRVQxNGIvS2pxa2l2WXpxU2FzTnlW?=
 =?utf-8?B?akM3azJhRWNuTUNrcUFNM0phbGEzS1lqUmhZamw4Z25XcW5SYVVjU01nUkZ5?=
 =?utf-8?Q?GFq+hRf7YHw=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dk1jdFJmc0ZBNmVTRDVNRVFEN1JuSkpNQk5YVHRzN1B1RTBwMzAyQTE3Qzht?=
 =?utf-8?B?U01VZmQvdVNYV3hOOUdvemNJY0djMU5MYzZ4amI0YXRkNUxrMGliUlNrVFpk?=
 =?utf-8?B?MEo2WXI4OVFMVE1FWXA1N0x5ZVZ3Nyt3aFRRQm5VTTRSVUtDa1RNc1hORG1p?=
 =?utf-8?B?RFpYV3B0c3VEK0k5eFNmbnlVeVM1NVZNY1FjeGpLdHY5NWpaa1hrZzRaRjBk?=
 =?utf-8?B?Q3hyS29nRVZqQlUvR0k5cWp1N010cGdJUzZKVVUwcEJsM1UyUTEyd2xlVnZW?=
 =?utf-8?B?cVBsKytEVXJab29pN0VNdDdLbHlSa2d0aEs0dG5iUFkwNzZaWnp2VXJZeFov?=
 =?utf-8?B?Wmtwd1FLejhDMUlRTC9INnhFeThMMUVNTnY3cUpFcUlVNFlnclRVTTdsN2tK?=
 =?utf-8?B?YUI2Z1FOWEgxVWdUaU4rVzQ5N3A4TWwxM1kwNFRybzY5cGZuQmlPcS93a21H?=
 =?utf-8?B?L1RTWVhKMkxvTE1IclZxY09QWC9WbzJRaXh2NFZTTm1qOFNxYW16WmR1YkhO?=
 =?utf-8?B?M0pqZFRmOFlQNUtOUXpsVzJOTEVtRjFvVlpZbUJmZk5qMEsrWFF4S3ZTK2hN?=
 =?utf-8?B?ckEvbTZIV0J5YmVycjdxSXdCRzc0US90SGhyZXJlOFpab2ZJaHdZRzFyNHZO?=
 =?utf-8?B?MytiUUkrRERUTzZoa1c5cWthMzRRQ3JSRndGaXVHOTJuanVNTFhRdDVpOGkz?=
 =?utf-8?B?eXY4V2dQaUJPcndRQUR1by93WktpbWE0WUZNQUJxSjF4aHRDU2FJNDErcFRY?=
 =?utf-8?B?Ymx2dlBibzJJS3dHbGk0MHlQbjFWU0dFV2U5TytjUVIvYkJ3YnV2TzF5TnNC?=
 =?utf-8?B?S0tLL3Bod250M2JaU0NOUmJwL25zQ2hSRVpsck04RXVuT1J3TmlYKzlmcWIx?=
 =?utf-8?B?ZExRMDVSVHlkZ3BheWdJaUhRSmJZdnhtdWtPeXoreXR0ekE0clMwVktOeFlB?=
 =?utf-8?B?cDEyeTNqWlZ3SlFFYk5QWVZLVE5mVkhCamlnUW14Nm5QbFJja1ZEdXlNWXMw?=
 =?utf-8?B?RzJ2SitsdXJQTU1oRmZKYTNCU25ta0pWMVozZXY0T2VhT2krdElWYjZOMzk2?=
 =?utf-8?B?RWRyaVIrVFB6Z3lzTUJtUTJLMjhrTTRJM3hQa2Fhd0xnUjV4d2hlVUdiQUNY?=
 =?utf-8?B?MmZnbjh6OUo1U0RRRU9xRzF5REtORXoyZzJaTXpvcElkSGlTQURQN2NzTmIz?=
 =?utf-8?B?cS9RVXNNVGw3S3B4L1JMQWdDVktvZ2JWUHduODIwWmZkL3pKWDFuekQzYUR0?=
 =?utf-8?B?YTFIR2FKUUNINEJReUdTWlk5Z25iN2F5SGY2LzB3ZitOUWFhdzdud0luKzc0?=
 =?utf-8?B?RFFwZ2JKODhoTEhHNVRvc3NxdlRFY3YwaGZLR3dzV21Ob0pabXUxMmdlVFpO?=
 =?utf-8?B?SUhsZUVZZGJEV3gwWEFxbEU0bUNaYzR6OWtCb2NHSHl5RnRhZWdHcXRLZE9K?=
 =?utf-8?B?cGk5T3I2NngzYVBjckZCckNVQkVKb0NZejUvYzRSdHp6S3JablhGU1RPbWgv?=
 =?utf-8?B?ZmJaNTVLRHhjd2s3ZzcwYk00OFdNbTlrVytGeWZtZWN2aFcvNU9LcEtPV2VR?=
 =?utf-8?B?STR1TnJsSXN1b1BLWHFwSFFObWhwZTZxNXZCMzRVYmkrdlQ4ZlpCeGJKQUND?=
 =?utf-8?B?cWZ4MXFHeUVqSXpldVU3YlhZdVZ5aldVdHNxR29wVTZneWJBRlc1M0VrZjgw?=
 =?utf-8?B?ZElFWGV3Yk05cjl4Q3NIdmd4U3FHZHdVYkQ1TTdDSnlOTGVvUUcvTXQwRHpR?=
 =?utf-8?B?RmxmNW9LZDdSOUtUb3ZOMHhyb0ZSNWczeEtLanNhVjNUb01OZXdkNUlUbjhW?=
 =?utf-8?B?blZacCtqNk1ESjBuVFM0TlBQbnVaM05MdmR4WGFaa2ZBaVlvbUVtbHJadnV3?=
 =?utf-8?B?dmNCRytabENZYURwUDNsUTYzNWo1NlNKaHp1bHJpczJtVExoZXhyNXhTVkEx?=
 =?utf-8?B?WXl1UWQwYUxESGUvNjJIRXJVVm1yRVE1dGFmSG9GVXRKZ1pwYXp2d243cERp?=
 =?utf-8?B?c1R6aWxBbW90UmFxYmNOVFJTZUJFQTlHMkZrRG9Pc2ViMHo0bmxDTjR0UFAx?=
 =?utf-8?B?dUY2WWxJYnA3RWZ5MlYzRUhzMlduZTNjb1BmNGQrcnpYcCtBOEFsRjZ2b3RW?=
 =?utf-8?Q?5/V1nNNpRc8RaT88dzUKjNjzm?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <09BD2EDE22C1244F9AEB6E2351ADE564@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: microchip.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6451.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e45d272-b1aa-43c8-d096-08dccb2a3e21
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2024 08:35:47.0251 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HOOc1qK5I8MEpE+ejBPLirTzZwCCF+Q/hpTWLFAQ11JFIW2KZsFwunSa8wS2cYnDiJuZYVeEjoqRm2+fqs9cbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8485
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjcvMDgvMjQgOTo0MiBwbSwgQ2xhdWRpdSBCZXpuZWEgd3JvdGU6DQo+IEVYVEVSTkFMIEVN
QUlMOiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91IGtu
b3cgdGhlIGNvbnRlbnQgaXMgc2FmZQ0KPiANCj4gVGhlIGRldm1fcGxhdGZvcm1faW9yZW1hcF9y
ZXNvdWNlKCkgZG9lcyBleGFjdGx5IHdoYXQNCj4gZGV2bV9pb3JlbWFwX3Jlc291cmNlKCkgY29t
YmluZWQgd2l0aCBwbGF0Zm9ybV9nZXRfcmVzb3VjZSgpIGRvZXMuDQo+IFRodXMgdXNlIGl0Lg0K
PiANCj4gU2lnbmVkLW9mZi1ieTogQ2xhdWRpdSBCZXpuZWEgPGNsYXVkaXUuYmV6bmVhQHR1eG9u
LmRldj4NClJldmlld2VkLWJ5OiBEaGFybWEgQmFsYXN1YmlyYW1hbmkgPGRoYXJtYS5iQG1pY3Jv
Y2hpcC5jb20+DQpUZXN0ZWQtYnk6IERoYXJtYSBCYWxhc3ViaXJhbWFuaSA8ZGhhcm1hLmJAbWlj
cm9jaGlwLmNvbT4NCj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9taWNyb2NoaXAt
bHZkcy5jIHwgMyArLS0NCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDIgZGVs
ZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9taWNy
b2NoaXAtbHZkcy5jIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9taWNyb2NoaXAtbHZkcy5jDQo+
IGluZGV4IGYwNDgzMTEwNmVlYS4uODVhZmY4YzVhYWY0IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYnJpZGdlL21pY3JvY2hpcC1sdmRzLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L2JyaWRnZS9taWNyb2NoaXAtbHZkcy5jDQo+IEBAIC0xNTQsOCArMTU0LDcgQEAgc3RhdGljIGlu
dCBtY2hwX2x2ZHNfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gDQo+ICAg
ICAgICAgIGx2ZHMtPmRldiA9IGRldjsNCj4gDQo+IC0gICAgICAgbHZkcy0+cmVncyA9IGRldm1f
aW9yZW1hcF9yZXNvdXJjZShsdmRzLT5kZXYsDQo+IC0gICAgICAgICAgICAgICAgICAgICAgIHBs
YXRmb3JtX2dldF9yZXNvdXJjZShwZGV2LCBJT1JFU09VUkNFX01FTSwgMCkpOw0KPiArICAgICAg
IGx2ZHMtPnJlZ3MgPSBkZXZtX3BsYXRmb3JtX2lvcmVtYXBfcmVzb3VyY2UocGRldiwgMCk7DQo+
ICAgICAgICAgIGlmIChJU19FUlIobHZkcy0+cmVncykpDQo+ICAgICAgICAgICAgICAgICAgcmV0
dXJuIFBUUl9FUlIobHZkcy0+cmVncyk7DQo+IA0KPiAtLQ0KPiAyLjM5LjINCj4gDQoNCg0KLS0g
DQpXaXRoIEJlc3QgUmVnYXJkcywNCkRoYXJtYSBCLg0K
