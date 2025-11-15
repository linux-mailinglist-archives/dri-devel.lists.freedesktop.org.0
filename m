Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE25C5FB3D
	for <lists+dri-devel@lfdr.de>; Sat, 15 Nov 2025 01:12:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B393010EB91;
	Sat, 15 Nov 2025 00:12:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="nfj/3qv4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010050.outbound.protection.outlook.com [52.101.46.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B47510EB6A
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Nov 2025 00:12:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CIzQGm2VW16iJRqGxZj9dT5uUj/bRBPTmZDwbW7Org6okIe0uCwhXyWrrPczLm5RrbqnsEV1IuEbSFrJby0Hupfnif132zMqB188CSS98i8xZtpzDo/KwggzYOMDQjQK1y934yeyn4djyv7bJzNEHQB5nXwqfPS6/Y+EcK7pv82Wk3cCsXXF/d14PKVHT56qJMEtrVjL4j8U6H5kpTaOkGS/kzRYcN6obpGKpk2RJsUMWdo1deGO9hL490an7ZvB8AuUj1iF8DKZ5XIsO/gQVevouoPGR5LovQIo5gKiyqbBMoA6kcrGnNpjpPLbfnqd2SHonxFjZrv8yJq04Yfe3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SvSNDFoSllkMwgou2gJcQ7CxXOX2wqjmvvbAPCXGbPk=;
 b=Qpw8OQlo02vHGW841XqpUkhLmV9TfD58lzdkToiC98teVycx1jdEOXkyEZs3RVkSV+cJvkgw9x6HPu+gdeyoD3IYM9TW2AQNe1MOwLyWWl98cIiz/8Y+d38yxrZA8FP+vLZkw0bgOJUmcGPP6r8oOhctcdpnUL2j5sSnK+jV1W7TMt+dSJebLrS5057C+Ke/6G45zXKyPMZIrCuoGb0bn82uICAv925zPwEAfFHf0+X63xbWUxIdGZmTfqJlzBRRkMQ0Q9ozMfIgtSGnLibDSsU0NZBcQO0lWmhrM9ow6E+YjPzmbUoqPA31VT+zvdVldrffv95ST4QQJ+YAet8EYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SvSNDFoSllkMwgou2gJcQ7CxXOX2wqjmvvbAPCXGbPk=;
 b=nfj/3qv4CJm7MTBlReT5A9N41MjS//WQ6yDnPplyC8FNiVCbAH1ZyGNjRllQQjL2Gn8VQdrXN0jkdcRGLc/KQzf2Fueh6V92KtpYs4T52/hC0DVlr40X7nhjClATZe27PoL3tj1sz1GbZNyifnVwmMYXOkWLHkGKYYLXw7wGGYk=
Received: from MW4PR12MB7165.namprd12.prod.outlook.com (2603:10b6:303:21b::14)
 by PH7PR12MB9102.namprd12.prod.outlook.com (2603:10b6:510:2f8::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.18; Sat, 15 Nov
 2025 00:12:11 +0000
Received: from MW4PR12MB7165.namprd12.prod.outlook.com
 ([fe80::a32f:9b78:fc2e:6076]) by MW4PR12MB7165.namprd12.prod.outlook.com
 ([fe80::a32f:9b78:fc2e:6076%5]) with mapi id 15.20.9298.010; Sat, 15 Nov 2025
 00:12:11 +0000
From: "Klymenko, Anatoliy" <Anatoliy.Klymenko@amd.com>
To: Sean Anderson <sean.anderson@linux.dev>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Tomi Valkeinen
 <tomi.valkeinen@ideasonboard.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Mike
 Looijmans <mike.looijmans@topic.nl>, David Airlie <airlied@gmail.com>, Thomas
 Zimmermann <tzimmermann@suse.de>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, Simona Vetter <simona@ffwll.ch>,
 "Simek, Michal" <michal.simek@amd.com>
Subject: RE: [PATCH 3/3] drm: zynqmp: Add blend mode property to graphics plane
Thread-Topic: [PATCH 3/3] drm: zynqmp: Add blend mode property to graphics
 plane
Thread-Index: AQHcVN1gVOfL1cVpIU6CqHq/hvIMtrTxNXCggAAFTICAAaNCUA==
Date: Sat, 15 Nov 2025 00:12:11 +0000
Message-ID: <MW4PR12MB7165C437114B30DB21702365E6CBA@MW4PR12MB7165.namprd12.prod.outlook.com>
References: <20251113203715.2768107-1-sean.anderson@linux.dev>
 <20251113203715.2768107-4-sean.anderson@linux.dev>
 <MW4PR12MB716514EB76EE4585605D0E5AE6CDA@MW4PR12MB7165.namprd12.prod.outlook.com>
 <b97065ce-2dc0-453b-ab8e-b2d134fc3467@linux.dev>
In-Reply-To: <b97065ce-2dc0-453b-ab8e-b2d134fc3467@linux.dev>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-11-15T00:07:42.0000000Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only; MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=3;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR12MB7165:EE_|PH7PR12MB9102:EE_
x-ms-office365-filtering-correlation-id: e74a819c-9cf8-4a16-7f52-08de23db9f93
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?K1RzOENvdEhXTyticTdIYm00MG5mZ2Q1V01hdmtMYzVPdjFMTXZQck5WTlNz?=
 =?utf-8?B?cnF6UG5MMUI0RmZrTWRZRERzMCtha2lZK3ViaCtJL0M2cDZNSDFCaHpJTWMr?=
 =?utf-8?B?UFVnVUxUVEVRaDRQdnlITmlWQ2tGbE5iK25NOHBxTmErdGppVEw5SWFTL0xx?=
 =?utf-8?B?NWUvakRGSUJnNWpDU3RoeGNsZE9kUGJkRTRBa1RmQkFmOWdyYndTQldWMFl5?=
 =?utf-8?B?VEZNR2dVR1dhcXFkVS9uODd1N3ZnMkNUeUdzZVFKdlUwUVJwKzJHYVNSaFF6?=
 =?utf-8?B?eWdXb3UxQTBXQmUrajVNZTlOUEFsUmxXenlrY0tjdTlVL2d6K2ZHQWQxYmhp?=
 =?utf-8?B?eFJaeXJ1dnk2L1lXWEovcTZ5UmgzTjlVbjhzdzhjYXRQdFBBeUVtdlhwdEE1?=
 =?utf-8?B?ODFIbkJIeEZWOUVsZHVSRnZ3OTA4eTRLZGMzTUl0Vzg3UThiT2lJcDZqa2xZ?=
 =?utf-8?B?TjNjQUVEMWM4S01FdzJpT21UVi96eWFKRlNjYlFXcDNrVkUvemdTcFJucEpJ?=
 =?utf-8?B?YXV3eGo0VjY5WWE4RFNTcWY4bUJtRGt1ZlJJcU1xZE8xcUt1d0pxQTJyaUFx?=
 =?utf-8?B?WHV0QjNvQnVaY2t1QnU4NWxjdk1GNGNlQVNSa0E3T2VtRVhySG9VaUFsb05E?=
 =?utf-8?B?SnZteE1lS0lab0dLWjFvNFJhd2puNm40RllNNE54dUpla25oYmZ4QUQ0amNi?=
 =?utf-8?B?MUQ3c3BkTURUbkEzMEZDNWdmRVBGSmlSWFE2eFRjUUtkaEhRbTdPM2tnbjI2?=
 =?utf-8?B?NzVNS0JHMUpISUphQmZiaitLVms0QkJLMFFvY3QwVHlIWlRyZ1hhMmVMa1Zw?=
 =?utf-8?B?Lzk0N0Z1M3lmU0U2VkJzakZQTktFT2VUYVdwTFNGN29XVlhxSFVvZEJ6Qm9m?=
 =?utf-8?B?MjJGWXZhSis0b1JhWXBpazAraFJHaitKQnpNRkVFQmZ5czBCTE1NZmhRMnZR?=
 =?utf-8?B?RVNobzNBL2lhNDVKR01aVVhXM2dVdnJFRnlTSVVIN3cwNHA0dlk0REZGMnJu?=
 =?utf-8?B?Z2k3bFYvQ1MxaitPcTZjaFU4VVVmNmlNeFdjVTNHdjhLaHVRYVJpWGs5R0xq?=
 =?utf-8?B?NzNkZU0vaDRuYTNTQTJVK1BNblMxYUJ2YitzUzNsZGlpWUNncVVKT2xCeW5a?=
 =?utf-8?B?UlREdVB5cjRIR2Faejg4eFZ0cTkzS3BObHZuL0JtOVk4SUswRDk0Vk9FV2x4?=
 =?utf-8?B?NXlma1doRkJFK3pmU0pGVnRhSzlOQkFFeGJqcjBKTnhCU1FnSlhoaFJBR0dn?=
 =?utf-8?B?L2oxVVVUZzE3enZkVmlRckNrcGFERi90bnU1d2pxNUpLd2p4aExXdzdRVjdI?=
 =?utf-8?B?YmhqdlBPWTBIVEk2TGFlWFlmRWdJaW93aTFIbHR2RS95RldtUEJXVi9QNlNo?=
 =?utf-8?B?MW4raythWDVQSnVETm1rTTVsU1RaWUVlSVY1eUxnLzhncjJCYy85R0tKdUgr?=
 =?utf-8?B?OU8yY3FtZGd0bGZCNktoL1ZhUi9wZ1JLQStMOCtUV3JmL2NpV2pNb2FjWlRU?=
 =?utf-8?B?MWZwa1hubW9PclBCNjMyT2Z0NVRwd2ZTb2RPZ3pWaWJ3UzBrK2E4djVGZUF5?=
 =?utf-8?B?N2lwTnB1WmRGWndJQi96Ris1THhjMUJjODVIZ0RyK3BPbmtiYW11Yis4Qm5o?=
 =?utf-8?B?UlE2VzY2NGVYWHBTZjlNQUtjQ0xpZFJjdlA5UzFBUVQ3b2RmMlpqVERMZVRy?=
 =?utf-8?B?cmlJYmpEaFZ6RFpib0tNQkhETmc3cit5dzhRMFpHR0lJWkdVYk9rdEZjMDhs?=
 =?utf-8?B?djJYeTVvQzF3OXJrOEtISHd3V2EwaGFMeXZMQmR5NUlZRGdHTGJkRElZeVU2?=
 =?utf-8?B?OFRMRmpzUVRHOFc0VlZUU3JLQXN5THdXRTgyU2FPSTRtS3pXQzFxMmhEQnhG?=
 =?utf-8?B?My92dEJtTFE4QXlRTGlKZkRMdndoQ1hZeDNWMGR3dGtFSHl6eUw1NmNRcFlh?=
 =?utf-8?B?TXNGVHUxd1dIcmovNVdNdDBwSitDOVpya2xFMys0UkM5MEJkSnNEMXorODVM?=
 =?utf-8?B?V3JXV3UvZXMwcWNlSU5pMktFeHZPanBnNFNnWkZBSW9lTGo3OWdBbWY4cVpT?=
 =?utf-8?Q?G4h+qu?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR12MB7165.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?L3ZKZG80Vkc0enpUbFRZTUZGQXhhb0xNV3p4S25HOXZkMWtIbnV0RUdxVEox?=
 =?utf-8?B?U3RIM2pteHQxeVdUTjdsemJUYllTTWxFaW1oSlluK29SUll0U3ZVWElieEhY?=
 =?utf-8?B?cHVCV0I2YVo1aWE3aHp0Q1NnK1Nadm96aXJHM2ozUGxlam5EQkxUQWtMUk1O?=
 =?utf-8?B?M0VCMStURkN2bUFnd1hOYW5YM0QrQkhIUThhQ1JhVVdJMktkb0w0ZnN5K21v?=
 =?utf-8?B?QXppQnkzbGhnZ24yQmlrWVZZd2dPQTkySGNtbCtoTEdJMXN3dlIrdFo4NTNw?=
 =?utf-8?B?Tk0yS0p3Nk42c3dCc295YjdOTFJrcGNIVThJTWdVcnZvTHRkMkRyUHhlMEdR?=
 =?utf-8?B?QzFPQkZ4VmsyVURqWmhPK0MxRitJSWVMYUZaNmM5Y01mbkdVN2RNR0h1Z3Fm?=
 =?utf-8?B?TzRDM05VUWJSYjZ5cGZjWFQ3Qll3RjhJVWNnVkZ6TWNqajhJUmNYWHhaUnRQ?=
 =?utf-8?B?a0JMdlEwTjNxS1ltWTlTN09zRVhHYzYwZVVmeXgvMkhxTDh5MVlQVkpoTlpQ?=
 =?utf-8?B?L0EwQnVsQkgrcHB4TE9mcTRJRWc5aUl4RFdaS3dGWlJzL2E5SnVobjVyTmVN?=
 =?utf-8?B?Rk5hQVV6TmpQYlBJSi9QcTc1dm9yKytUcjBlUFFLM0dJRnFYUVRnc1NDWFkr?=
 =?utf-8?B?Y25wdFRtWjJ5TXR4anYxcEZsZldZOVhHOU5OcHhvbkVKajEwRHhuME1RQi9P?=
 =?utf-8?B?a1V1MW9JbFowOXdKeEJwYlpVeWc5T2dNZGNZUU1yeWVvK1N6T0s0SkNrWWIy?=
 =?utf-8?B?eUtzbXRqcm5sdFUrcWRmSFM2NUo0U0hPWTlnMERqY1JuaGtyeWVrb1BJZHYv?=
 =?utf-8?B?TTBZSWE3YytEV2Vpd3hFZnc1Vmc0ZXRhbHEwYlEzQWVKbmlMWHdzQXB2Smtv?=
 =?utf-8?B?YVl4aExzNFpvUUlFUVVZZ2d1cnVzT2Fpa2xiWjUxVVBtbDhPZTZkQ1BDYWQw?=
 =?utf-8?B?UEwrT3dib2FTN0UveXM5b1pkQjdsTkFBUE9qUVQ1N3VqbHpaaGRiYWxBT0F3?=
 =?utf-8?B?aW9GT0c2d28yOEZmUWJUKytKTHhtN3pZc0pFcEplQjI0UWJjUnhiUGtLYUhh?=
 =?utf-8?B?ZGF6WGxDYXRGUkRTVFlJSWd6YTdzVFFFYlFMOFNnbitGR00yOFN4bTlKWVZK?=
 =?utf-8?B?dDdlM09xdlN2bys0bFVtcklGa1RRWEZtVmh6QUMzQ1FjWVoxVHhNeGVVa2x2?=
 =?utf-8?B?M3IvcFRVTmdzK3VGakRwUDBZdFJlVFZ3Z1h0czBJV093MG0rNWR4Q2xlQm5m?=
 =?utf-8?B?L1JqMnNvb2tzNU5HbWVTUEJqQXNXTHg3djF1eDBIMjhKbDB2Wms0SlVlc1A2?=
 =?utf-8?B?RDBBRWhBcjdCL0ZjSmoray9QNmRSbFhSQ2t2Vk43YVFYejBoSWpRaWxtaHhF?=
 =?utf-8?B?dVYrS1F0WmZVZEZES243V1d2clBEUmRGN0JXVUNGUmM3MjVVb2RIajNWMGIr?=
 =?utf-8?B?ZTBwb25pUXBTS0hmbHNzQWxwazRwZVNPWjMyaHk4dkIzRWZid29aMW9ZYmVr?=
 =?utf-8?B?S0M4eVFmV2Z1YjYzcjZZZmx1dC95VFRaZHJ0MHYxcEZ5YWNBOUN0ZXdpMWk2?=
 =?utf-8?B?Ny9hd1hTR3JwNzF4VHNkY1BzeG5uTTNYN3paeXNLUTdKZ1F3bDJ3RE1oY0pV?=
 =?utf-8?B?Z0l2YkcyeWxzUGFoMHJBZEI3Z05JWmNHdmNYNWFiTUs2b1JPRFBwaGVOS3lL?=
 =?utf-8?B?TS9RYndoWVVuckVqcVZsUDVWMnF5R0tlY1NlWkx3UWxzbE5jOHlNdWdkTkY1?=
 =?utf-8?B?L3UxT3Jobm92TUF4VGxWN1Z1YS9uMjZFZjhvaXJJMUdjdnVJZUFxUnRNNDBr?=
 =?utf-8?B?MGlaT01HWnlsaDltZXVZejkwUndNMG9XUUZGMW9BV0U0eG5iZjBKcnl6Zkdt?=
 =?utf-8?B?bEpqb3lTZ1FCY0xXOTQ2ZlF6RmYwaVVGUzFyZHVZaXdNY1hDdXhiSzA1WXBL?=
 =?utf-8?B?TkVDaHRvbFg1OGtPYTlwVlhJSkxOSHJ2a0lRSFk1UmlOckZzSWlvakNVT3d0?=
 =?utf-8?B?bEdxOFZJMmhyVnVCb2tjTVM4OUs4Tkh1SGppK3pmRjFoVlRpaEdvb1VaQkdl?=
 =?utf-8?B?V21XL0piYlc2andadENETjh5UVpjeTBSUU9oazIyQzN2VnFBS3Ntb2NHTmpL?=
 =?utf-8?Q?8KR4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB7165.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e74a819c-9cf8-4a16-7f52-08de23db9f93
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Nov 2025 00:12:11.5221 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0Y1gYJScej1Uglk+I6UD7An3IKkWTmNj2/knfY0sNJtm/rH0XprO7CkYsVAw+oF7LvI45OQzhI+t01TeGJEeCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9102
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

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEFNRCBJbnRlcm5hbCBEaXN0cmlidXRpb24gT25seV0N
Cg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBkcmktZGV2ZWwgPGRyaS1k
ZXZlbC1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mIFNlYW4NCj4g
QW5kZXJzb24NCj4gU2VudDogVGh1cnNkYXksIE5vdmVtYmVyIDEzLCAyMDI1IDM6MDcgUE0NCj4g
VG86IEtseW1lbmtvLCBBbmF0b2xpeSA8QW5hdG9saXkuS2x5bWVua29AYW1kLmNvbT47IExhdXJl
bnQgUGluY2hhcnQNCj4gPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT47IFRvbWkg
VmFsa2VpbmVuDQo+IDx0b21pLnZhbGtlaW5lbkBpZGVhc29uYm9hcmQuY29tPjsgZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzogbGludXgta2VybmVsQHZnZXIua2VybmVsLm9y
ZzsgTWlrZSBMb29pam1hbnMgPG1pa2UubG9vaWptYW5zQHRvcGljLm5sPjsNCj4gRGF2aWQgQWly
bGllIDxhaXJsaWVkQGdtYWlsLmNvbT47IFRob21hcyBaaW1tZXJtYW5uDQo+IDx0emltbWVybWFu
bkBzdXNlLmRlPjsgTWFhcnRlbiBMYW5raG9yc3QNCj4gPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4
LmludGVsLmNvbT47IE1heGltZSBSaXBhcmQgPG1yaXBhcmRAa2VybmVsLm9yZz47DQo+IGxpbnV4
LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZzsgU2ltb25hIFZldHRlciA8c2ltb25hQGZm
d2xsLmNoPjsgU2ltZWssDQo+IE1pY2hhbCA8bWljaGFsLnNpbWVrQGFtZC5jb20+DQo+IFN1Ympl
Y3Q6IFJlOiBbUEFUQ0ggMy8zXSBkcm06IHp5bnFtcDogQWRkIGJsZW5kIG1vZGUgcHJvcGVydHkg
dG8gZ3JhcGhpY3MNCj4gcGxhbmUNCj4NCj4gQ2F1dGlvbjogVGhpcyBtZXNzYWdlIG9yaWdpbmF0
ZWQgZnJvbSBhbiBFeHRlcm5hbCBTb3VyY2UuIFVzZSBwcm9wZXIgY2F1dGlvbg0KPiB3aGVuIG9w
ZW5pbmcgYXR0YWNobWVudHMsIGNsaWNraW5nIGxpbmtzLCBvciByZXNwb25kaW5nLg0KPg0KPg0K
PiBPbiAxMS8xMy8yNSAxODowMywgS2x5bWVua28sIEFuYXRvbGl5IHdyb3RlOg0KPiA+IFtBTUQg
T2ZmaWNpYWwgVXNlIE9ubHkgLSBBTUQgSW50ZXJuYWwgRGlzdHJpYnV0aW9uIE9ubHldDQo+ID4N
Cj4gPiBIaSBTZWFuLA0KPiA+DQo+ID4gVGhhbmsgeW91IGZvciB0aGUgcGF0Y2guDQo+ID4NCj4g
Pj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPj4gRnJvbTogU2VhbiBBbmRlcnNvbiA8
c2Vhbi5hbmRlcnNvbkBsaW51eC5kZXY+DQo+ID4+IFNlbnQ6IFRodXJzZGF5LCBOb3ZlbWJlciAx
MywgMjAyNSAxMjozNyBQTQ0KPiA+PiBUbzogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5j
aGFydEBpZGVhc29uYm9hcmQuY29tPjsgVG9taSBWYWxrZWluZW4NCj4gPj4gPHRvbWkudmFsa2Vp
bmVuQGlkZWFzb25ib2FyZC5jb20+OyBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+
ID4+IENjOiBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyBNaWtlIExvb2lqbWFucw0KPiA8
bWlrZS5sb29pam1hbnNAdG9waWMubmw+Ow0KPiA+PiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAZ21h
aWwuY29tPjsgVGhvbWFzIFppbW1lcm1hbm4NCj4gPj4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+OyBN
YWFydGVuIExhbmtob3JzdA0KPiA+PiA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29t
PjsgS2x5bWVua28sIEFuYXRvbGl5DQo+ID4+IDxBbmF0b2xpeS5LbHltZW5rb0BhbWQuY29tPjsg
TWF4aW1lIFJpcGFyZCA8bXJpcGFyZEBrZXJuZWwub3JnPjsNCj4gbGludXgtDQo+ID4+IGFybS1r
ZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZzsgU2ltb25hIFZldHRlciA8c2ltb25hQGZmd2xsLmNo
PjsgU2ltZWssDQo+ID4+IE1pY2hhbCA8bWljaGFsLnNpbWVrQGFtZC5jb20+OyBTZWFuIEFuZGVy
c29uDQo+ID4+IDxzZWFuLmFuZGVyc29uQGxpbnV4LmRldj4NCj4gPj4gU3ViamVjdDogW1BBVENI
IDMvM10gZHJtOiB6eW5xbXA6IEFkZCBibGVuZCBtb2RlIHByb3BlcnR5IHRvIGdyYXBoaWNzDQo+
IHBsYW5lDQo+ID4+DQo+ID4+IENhdXRpb246IFRoaXMgbWVzc2FnZSBvcmlnaW5hdGVkIGZyb20g
YW4gRXh0ZXJuYWwgU291cmNlLiBVc2UgcHJvcGVyDQo+IGNhdXRpb24NCj4gPj4gd2hlbiBvcGVu
aW5nIGF0dGFjaG1lbnRzLCBjbGlja2luZyBsaW5rcywgb3IgcmVzcG9uZGluZy4NCj4gPj4NCj4g
Pj4NCj4gPj4gV2hlbiBnbG9iYWwgYWxwaGEgaXMgZW5hYmxlZCwgcGVyLXBpeGVsIGFscGhhIGlz
IGlnbm9yZWQuIEFsbG93DQo+ID4+IHVzZXJzcGFjZSB0byBleHBsaWNpdGx5IHNwZWNpZnkgd2hl
dGhlciB0byB1c2UgcGVyLXBpeGVsIGFscGhhIGJ5DQo+ID4+IGV4cG9zaW5nIGl0IHRocm91Z2gg
dGhlIGJsZW5kIG1vZGUgcHJvcGVydHkuIEknbSBub3Qgc3VyZSB3aGV0aGVyIHRoZQ0KPiA+PiBw
ZXItcGl4ZWwgYWxwaGEgaXMgcHJlLW11bHRpcGxpZWQgb3Igbm90IFsxXSwgYnV0IGFwcGFyZW50
bHkgaXQgKm11c3QqIGJlDQo+ID4+IHByZS1tdWx0aXBsaWVkIHNvIEkgZ3Vlc3Mgd2UgaGF2ZSB0
byBhZHZlcnRpc2UgaXQuDQo+ID4+DQo+ID4+IFsxXSBBbGwgd2UgZ2V0IGlzICJUaGUgYWxwaGEg
dmFsdWUgYXZhaWxhYmxlIHdpdGggdGhlIGdyYXBoaWNzIHN0cmVhbQ0KPiA+PiAgICAgd2lsbCBk
ZWZpbmUgdGhlIHRyYW5zcGFyZW5jeSBvZiB0aGUgZ3JhcGhpY3MuIg0KPiA+Pg0KPiA+PiBTaWdu
ZWQtb2ZmLWJ5OiBTZWFuIEFuZGVyc29uIDxzZWFuLmFuZGVyc29uQGxpbnV4LmRldj4NCj4gPj4g
LS0tDQo+ID4+DQo+ID4+ICBkcml2ZXJzL2dwdS9kcm0veGxueC96eW5xbXBfa21zLmMgfCAyNCAr
KysrKysrKysrKysrKysrKysrKysrLS0NCj4gPj4gIDEgZmlsZSBjaGFuZ2VkLCAyMiBpbnNlcnRp
b25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiA+Pg0KPiA+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL3hsbngvenlucW1wX2ttcy5jDQo+ID4+IGIvZHJpdmVycy9ncHUvZHJtL3hsbngvenlu
cW1wX2ttcy5jDQo+ID4+IGluZGV4IDQ1NmFkYTlhYzAwMy4uZmExY2ZjMTZkYjM2IDEwMDY0NA0K
PiA+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGxueC96eW5xbXBfa21zLmMNCj4gPj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL3hsbngvenlucW1wX2ttcy5jDQo+ID4+IEBAIC02MSw2ICs2MSwxMyBA
QCBzdGF0aWMgaW50IHp5bnFtcF9kcHN1Yl9wbGFuZV9hdG9taWNfY2hlY2soc3RydWN0DQo+ID4+
IGRybV9wbGFuZSAqcGxhbmUsDQo+ID4+ICAgICAgICAgaWYgKCFuZXdfcGxhbmVfc3RhdGUtPmNy
dGMpDQo+ID4+ICAgICAgICAgICAgICAgICByZXR1cm4gMDsNCj4gPj4NCj4gPj4gKyAgICAgICBp
ZiAobmV3X3BsYW5lX3N0YXRlLT5waXhlbF9ibGVuZF9tb2RlICE9DQo+ID4+IERSTV9NT0RFX0JM
RU5EX1BJWEVMX05PTkUgJiYNCj4gPj4gKyAgICAgICAgICAgbmV3X3BsYW5lX3N0YXRlLT5hbHBo
YSA+PiA4ICE9IDB4ZmYpIHsNCj4gPj4gKyAgICAgICAgICAgICAgIGRybV9kYmdfa21zKHBsYW5l
LT5kZXYsDQo+ID4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAiUGxhbmUgYWxwaGEgbXVz
dCBiZSAxLjAgd2hlbiB1c2luZyBwaXhlbCBhbHBoYVxuIik7DQo+ID4+ICsgICAgICAgICAgICAg
ICByZXR1cm4gLUVJTlZBTDsNCj4gPj4gKyAgICAgICB9DQo+ID4+ICsNCj4gPj4gICAgICAgICBj
cnRjX3N0YXRlID0gZHJtX2F0b21pY19nZXRfY3J0Y19zdGF0ZShzdGF0ZSwgbmV3X3BsYW5lX3N0
YXRlLT5jcnRjKTsNCj4gPj4gICAgICAgICBpZiAoSVNfRVJSKGNydGNfc3RhdGUpKQ0KPiA+PiAg
ICAgICAgICAgICAgICAgcmV0dXJuIFBUUl9FUlIoY3J0Y19zdGF0ZSk7DQo+ID4+IEBAIC0xMTcs
OSArMTI0LDEzIEBAIHN0YXRpYyB2b2lkDQo+ID4+IHp5bnFtcF9kcHN1Yl9wbGFuZV9hdG9taWNf
dXBkYXRlKHN0cnVjdCBkcm1fcGxhbmUgKnBsYW5lLA0KPiA+Pg0KPiA+PiAgICAgICAgIHp5bnFt
cF9kaXNwX2xheWVyX3VwZGF0ZShsYXllciwgbmV3X3N0YXRlKTsNCj4gPj4NCj4gPj4gLSAgICAg
ICBpZiAocGxhbmUtPmluZGV4ID09IFpZTlFNUF9EUFNVQl9MQVlFUl9HRlgpDQo+ID4+IC0gICAg
ICAgICAgICAgICB6eW5xbXBfZGlzcF9ibGVuZF9zZXRfZ2xvYmFsX2FscGhhKGRwc3ViLT5kaXNw
LCB0cnVlLA0KPiA+PiArICAgICAgIGlmIChwbGFuZS0+aW5kZXggPT0gWllOUU1QX0RQU1VCX0xB
WUVSX0dGWCkgew0KPiA+PiArICAgICAgICAgICAgICAgYm9vbCBibGVuZCA9IHBsYW5lLT5zdGF0
ZS0+cGl4ZWxfYmxlbmRfbW9kZSA9PQ0KPiA+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
IERSTV9NT0RFX0JMRU5EX1BJWEVMX05PTkU7DQo+ID4+ICsNCj4gPj4gKyAgICAgICAgICAgICAg
IHp5bnFtcF9kaXNwX2JsZW5kX3NldF9nbG9iYWxfYWxwaGEoZHBzdWItPmRpc3AsIGJsZW5kLA0K
PiA+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBw
bGFuZS0+c3RhdGUtPmFscGhhID4+IDgpOw0KPiA+PiArICAgICAgIH0NCj4gPj4NCj4gPj4gICAg
ICAgICAvKg0KPiA+PiAgICAgICAgICAqIFVuY29uZGl0aW9uYWxseSBlbmFibGUgdGhlIGxheWVy
LCBhcyBpdCBtYXkgaGF2ZSBiZWVuIGRpc2FibGVkDQo+ID4+IEBAIC0xNzksOSArMTkwLDE4IEBA
IHN0YXRpYyBpbnQgenlucW1wX2Rwc3ViX2NyZWF0ZV9wbGFuZXMoc3RydWN0DQo+ID4+IHp5bnFt
cF9kcHN1YiAqZHBzdWIpDQo+ID4+ICAgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiByZXQ7
DQo+ID4+DQo+ID4+ICAgICAgICAgICAgICAgICBpZiAoaSA9PSBaWU5RTVBfRFBTVUJfTEFZRVJf
R0ZYKSB7DQo+ID4+ICsgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCBibGVuZF9t
b2RlcyA9DQo+ID4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgQklUKERSTV9NT0RF
X0JMRU5EX1BJWEVMX05PTkUpIHwNCj4gPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBCSVQoRFJNX01PREVfQkxFTkRfUFJFTVVMVEkpOw0KPiA+DQo+ID4gfCBCSVQoRFJNX01PREVf
QkxFTkRfQ09WRVJBR0UpIC0gdGhpcyBpcyB3aGF0IGltcGxlbWVudGVkIGluIHRoZQ0KPiBoYXJk
d2FyZS4NCj4NCj4gRG8geW91IGhhdmUgYSBkYXRhc2hlZXQgKG9yIG90aGVyKSByZWZlcmVuY2U/
DQo+DQoNClllcyBodHRwczovL2RvY3MuYW1kLmNvbS92L3UvZW4tVVMvdWcxMDg1LXp5bnEtdWx0
cmFzY2FsZS10cm0NCg0KDQo+IEJ1dCBpbiBhbnkgY2FzZSwgRFJNX01PREVfQkxFTkRfUFJFTVVM
VEkgaXMgbWFuZGF0b3J5IGV2ZW4gaWYgd2UNCj4gZG9uJ3Qgc3VwcG9ydA0KPiBpdC4gU2VlIGRy
bV9wbGFuZV9jcmVhdGVfYmxlbmRfbW9kZV9wcm9wZXJ0eSBmb3IgZGV0YWlscy4NCj4NCg0KTm8g
ZG91YnRzIGhlcmUNCg0KPiAtLVNlYW4NCg0KVGhhbmsgeW91LA0KQW5hdG9saXkNCg0K
