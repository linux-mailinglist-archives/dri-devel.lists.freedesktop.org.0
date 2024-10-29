Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 237E59B42A4
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2024 07:58:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 906A910E5AE;
	Tue, 29 Oct 2024 06:58:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="szL7tuPa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU010.outbound.protection.outlook.com
 (mail-japanwestazon11011061.outbound.protection.outlook.com [40.107.74.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82B4B10E5AE
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2024 06:58:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uocjcqennjzzXlxVz+xTpdhSV4RTHG9qojDCcdOPTqu8E7QKn/mzyQ6hTifkEfr7KpaFmkX/4K5eVP0FvqC1SUOLTDekTFRWH0KMFzZgM4r4Y4/kKcZiNamM2J9ak7YXPYx0fX7q+11KcWriiWQaUJMHU2/2tSnRekRU2RvLS7FLJBP/W5Lrq8HXyXTW0HXuC5B3uJeQ2BuPCpqEzGIBnl+mJhOun3KCmMAqdqo/0PaXRTLHzy1NoY1SQVBllg66nEe1+KKXasDy3l1fcoA80RdEsJQ6Nszk1mwM0f7qWXFLw6AwsaY1JPD0Qh7AiSEMnMjIoae85BRUNj1Qf0O7Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=enExbodqo+D2JD/x5HFd+S0p8KTO0nf/2Zy9bLeiZt4=;
 b=XfdGYNvjurECuPXIGY1QqwyRDzS8A73KcTbu/LkMAxHpklGX14cidqO/7R4zUVQsUi7oN19WJDsPNUaUzRoajxbF1gddoXdavfGzHdICHn47aPADO6HzW19LaxdELbBY1NANVpLs8Jkg9ZdG9I7aky9vJXLaGxDBAFsrNANogwDx7aiFBzOU8iNtuQjfeXM+BcjLESPE34gSyu9fVKysQVZK+jzUh+5hjm4eN0I1BoBwxF0POHI5T1eMmjJ1J88Ox1CVYq5pHHo1kynwShbJ6W/IzyZ7P3Fh59nE2s9FW58qOnHZvsBpqoZASKMHew+8Bnp/N07ZVUBHJ6tuACg1pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=enExbodqo+D2JD/x5HFd+S0p8KTO0nf/2Zy9bLeiZt4=;
 b=szL7tuPacRnWkkvVruaSwax4V+trEZeqaMk+zlPZEH5JMSyTuybWWB5QgBE0BXkJtWu3ELKunEZHOeKzfYR8NQOw3eHfqvnD5MFl31k/tf/Pj1cNQhsu9w1WyegxxE9DRGNlN5e2hCUGYstPT26ds8uX2KQoj9DdHhgSqO7RFrI=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYVPR01MB11276.jpnprd01.prod.outlook.com (2603:1096:400:365::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.29; Tue, 29 Oct
 2024 06:58:31 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%3]) with mapi id 15.20.8093.025; Tue, 29 Oct 2024
 06:58:27 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Liu Ying <victor.liu@nxp.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
CC: "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>,
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>, "rfoss@kernel.org"
 <rfoss@kernel.org>, laurent.pinchart <laurent.pinchart@ideasonboard.com>,
 "jonas@kwiboo.se" <jonas@kwiboo.se>, "jernej.skrabec@gmail.com"
 <jernej.skrabec@gmail.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "mripard@kernel.org"
 <mripard@kernel.org>, "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "airlied@gmail.com" <airlied@gmail.com>, "simona@ffwll.ch" <simona@ffwll.ch>, 
 "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "quic_jesszhan@quicinc.com" <quic_jesszhan@quicinc.com>, "mchehab@kernel.org"
 <mchehab@kernel.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de"
 <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will@kernel.org"
 <will@kernel.org>, "sakari.ailus@linux.intel.com"
 <sakari.ailus@linux.intel.com>, "hverkuil@xs4all.nl" <hverkuil@xs4all.nl>,
 "tomi.valkeinen@ideasonboard.com" <tomi.valkeinen@ideasonboard.com>,
 "quic_bjorande@quicinc.com" <quic_bjorande@quicinc.com>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>,
 "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>, "arnd@arndb.de"
 <arnd@arndb.de>, "nfraprado@collabora.com" <nfraprado@collabora.com>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>, Prabhakar Mahadev Lad
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, "sam@ravnborg.org"
 <sam@ravnborg.org>, "marex@denx.de" <marex@denx.de>
Subject: RE: [PATCH v4 08/13] dt-bindings: display: Document dual-link LVDS
 display common properties
Thread-Topic: [PATCH v4 08/13] dt-bindings: display: Document dual-link LVDS
 display common properties
Thread-Index: AQHbKOKZPN4b66+xp0G7h8Y65TjgzbKdQo2AgAAK22A=
Date: Tue, 29 Oct 2024 06:58:27 +0000
Message-ID: <TY3PR01MB11346805C5D524D264669D178864B2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20241028023740.19732-1-victor.liu@nxp.com>
 <20241028023740.19732-9-victor.liu@nxp.com>
 <01c1c4f3-1652-4b08-bd35-08b4e1c04c79@nxp.com>
In-Reply-To: <01c1c4f3-1652-4b08-bd35-08b4e1c04c79@nxp.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYVPR01MB11276:EE_
x-ms-office365-filtering-correlation-id: 0b581972-639c-4040-47ad-08dcf7e716c3
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?QkMwK2l6elh5eGN6TUdhZGc5MHhvWWVKNlFtZ1RHVEhpYlJGelRqYmRzN0RW?=
 =?utf-8?B?VnZYL3NXdEh3OWdOeGxzTXZYQjNMYzdBVFVnZkNoN0NTeThoaEdPbEhwbU9z?=
 =?utf-8?B?U3FFNmV2NlE5MVpYcjVZVWZlQmtJdHFJeXVwTlNPZUlsdzB5YVV3L3dRRVlQ?=
 =?utf-8?B?Y1NLTnlFTXJsVjVyZFVJcWFCTk05eGxwRGZlNUpjZ2VYNlM2eUxIbzVmMlVZ?=
 =?utf-8?B?bi9velFYUStjcWs2U1dCOWQ1a2RndHpPOXYyZnMwWmd1aHd6S3B0cVlUTDQz?=
 =?utf-8?B?ZG1mMDc5WGZRVThvYWljcVZLY2ZLNTlhQzJKYWkzM0hCMXZ4M3NadjRuVkVZ?=
 =?utf-8?B?SUdHUUhsRkxDa1hQZDBoYlBVMzRYTmhpTnFoVUphYnlVK2I0UEoyNDBvRDFV?=
 =?utf-8?B?bUdvRSt3TmVIRFI4cEpmVXl4QmpPMEZWcXg5Szc0VUJ0eXQvVnhsQjVrT0JL?=
 =?utf-8?B?YmdFNkZxVXNKTHIxQkM2bzUzOE5HL0F4bmx6L3cySzVlRUNCd0ZhenliSS9W?=
 =?utf-8?B?em5DKzN2MHVBalJpbkZkMkRFUEdFbkdtREE0SHdhMFEzMDFiUjl4WkRTQ2JG?=
 =?utf-8?B?YzliUjMzOUs3b01ZV2NBaWNWMzRyaUdBMkdtZzdScnFHUzhNUVdzVXhpbTl3?=
 =?utf-8?B?WkZXWWc3QVhpMHp1YTRNRmdLNzhyVkhNZGYrMjJ0WmR0MmVjQ2JibStVdDgr?=
 =?utf-8?B?am1VMEh4SUErOGVvb085cmZpdmh0TnRyRzVxbEN3NjZmblIrdzkzWk5YU1hi?=
 =?utf-8?B?SlRmZ2VKaFg3b1gyUmVhdnNjOWwwZFJRR09XUXJEUXJReXU1R210bWFnd1Ru?=
 =?utf-8?B?Y3A3R25hQjlXU0FuTWhsMFpFdlA3NkVlT2pXU2tncXBwdHFnZitqcHZqNGxn?=
 =?utf-8?B?d3h3YUM5ekNWR3VZeWhFMEw0VHZZWTdBMUxiRThBRjYrWFNuaXVhUjROUlBh?=
 =?utf-8?B?NitpNDdoejl3eXJHRWVId21VOUNDbUFKMThpZHhPMkVrcUlaVGNmVmNCUFdl?=
 =?utf-8?B?Z1Q0eHhTNFVTRVVtK3h0NFJqRjZCTjNtRDVrWWRydVNOcVdxZVhSSzlGTG93?=
 =?utf-8?B?TkRxc3NiQ0pJRW4yODlaS3hITkNaRjRZK3FhOVNlSUJqNmdTQzlmY3FmMlJJ?=
 =?utf-8?B?NEpwd3k2aFIrSHRqYUd5ekZUNUdvNG1NdFJna3pYYnBrNmxQWDdzMmNUaEpi?=
 =?utf-8?B?MzQyTnh1VUV5Rmp3RFh1dXJGVE9Ib0hKN21ROGJOYkNXWFNpeEJ4UnZVT0xZ?=
 =?utf-8?B?OFAyOUwrUFJ1ekxxbHAwYWJpWUZNSFk5MWNEQzlVWUVsM3BvUHEyNFBJQ1hF?=
 =?utf-8?B?VlZ0OW1KV3A1cGYxcHQxcjQ1WVRZWkdxMHJGcDEyVUNsZ0YvdWNHSk9ORVg1?=
 =?utf-8?B?WjhMWjFwSlllRDl2WGRzWmMvQnNSTmx0UGZVM2tmZ3NuZ0VEa28zeE1HQ09C?=
 =?utf-8?B?bWdCdUJzWlJYbG9IeEtnQi9kb2w3OGQwQ3VxUDJCc0JiMUQzckhPV2hVUUlT?=
 =?utf-8?B?QWNvQUVEUGZVNzRVMkI3UldNZVFEQnRDYmJjb2x3MXhRR3Mrem0zTXY3T0hm?=
 =?utf-8?B?Wmg0ZDBOZnozSyt2SHNGSjVTSmY4WFRaRGs3b0VqN0xXZEtjVWRhRzVpNFU5?=
 =?utf-8?B?RTlUNG5Da2ZvcW82L1VFb1prdE9pOEYvYWlWR2tWT2xBb2ZtSXJNMVVjMTVK?=
 =?utf-8?B?dVVUZjB0VGZIRzMyUkVybkZjTmdpeityMm1pSkp3S2ZIcjdKN3V5L0JVeFpE?=
 =?utf-8?Q?fi42nlD1QRVDqsb/UmOM/rb7ABR+AuQ5q5uoWuO?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY3PR01MB11346.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R3NOSmJTQkJCd0dpbmhWMjNVL1FxS0k1S25kTysyOTRUdlQ5ei9rTFEwbTR6?=
 =?utf-8?B?YU85V2dYcHpyMkR1c09KSWprSzU3bnVrTkZuQUdCbjVGVmpoZFV4RTZxNVhR?=
 =?utf-8?B?eCs5ZDhSUDBOWkQxRzQvb3l3RVcrc1M1WldnSGxWaDRwREJick1BaEMrYUIx?=
 =?utf-8?B?TjlyNG5lNWlsaWR6TWNNMTVKSXI4cWs3OUFnaDJwVjVmV2dGY1M5QjlvOG42?=
 =?utf-8?B?dTNWb2lNRHNIWlVqSnlMbHR6ZTFkTnVXQmNPenZsZUNocW10dUN0K1pTZGtW?=
 =?utf-8?B?dFVNMi9EajlOV244RVlIZDFTTUNqaklUSjh5UmQwOFJyU240ZFFZY1g0Ty9p?=
 =?utf-8?B?Z1NMWjVUTnplK0doazZNMWRDNyt2SFJaMjBxRnMzT0xFMW9KQVhNTVJSMDl0?=
 =?utf-8?B?dTY2RExxNzQxaEJwdjdPS1ZXZThnTDZWQjFjMHppVk0zSHdOeVBwZ21wR2FH?=
 =?utf-8?B?R0h4a2Vzc21xY09SSkR0Sk10QXorVVNNQmJWWkJMd0krZk96UlR3NXRoNWRC?=
 =?utf-8?B?bTYyZ0JtS0d3djJpNGVTa0luREo2M2o4T3g5SEZkcmhDUitQYkF0aC8wenRN?=
 =?utf-8?B?YkZ5Z2htYUFFU0Znd3RxUldzZzdtQTNyZVR2YlFQeFptbThwVk54cFhhekpL?=
 =?utf-8?B?cFhKMnduR2VZb1N0NUh1MEQ5TzlzRUkxRFNHTCtLV1E0QWc2UEcxUUwrZmtV?=
 =?utf-8?B?Z1JKZnpsVzlTSUc2SDhqaFpGaWVGU2gyQ01pVEIvTkRrZWoyeUszL0lJVFRk?=
 =?utf-8?B?amoycGxwSDVEVWJwWTFZeGtPUmgzOXhzZ0xRYWZxeSs0L1BvUEFUSXdzRkt6?=
 =?utf-8?B?THJzUkpWSzBJcXlYWDhscW8waXpweHBpVGFxZTh1VlVDNm02alMzYmM1SUk4?=
 =?utf-8?B?ZUpSbVRvcEZkc3VIVkh3UVVTbmxuUThQbWdkWW9KaFQ3Q1JEYUo0R3ljTi83?=
 =?utf-8?B?Zm1oamtEanNWZ2ZFU0hraXZOOURSb3RIUk9SL2lzRWpQRXNJK3Y4VDM0ZlVk?=
 =?utf-8?B?Q245dzRic3FMbkV4V3J2Y2hQT0xrWDBCV0pDMnV3clRkWGpVQ08rWCtOeXBH?=
 =?utf-8?B?Vy92VVZqOHhPQ2x5NUExYi8zeGJic2pQOXppRjJlcjZtQXpxSGY3a0dWbFBa?=
 =?utf-8?B?cHRJY01XNmdXZTJtZ282RVprd3JKaVl3NFdueGlvbVdNTCtPNXI3aGUxQ3NO?=
 =?utf-8?B?RmpJa3VadHFYVkZheUhxYUFMUHptS08zTXE0ei80U2ptVEpSVXZWTkF0d0dI?=
 =?utf-8?B?WUtIckhYNG81aE45d3orVzRIRW9qZ0FBSUxmS1VJaGRrank0bEErdFpFcTZE?=
 =?utf-8?B?dHlsWlltWC9iTW4rS25od2pHdk9pRmFoMHpXZUhBK21NS2JYbHVnWXpubGMx?=
 =?utf-8?B?ZFl5WFJqK05ETkx6KzB1dU9vdll3SGdQaC90NWxTdUNsZnRNREh5aVVBS0JL?=
 =?utf-8?B?SW5EeEdiNXRXdGowUW5OVWcwMDVSbzV0MlRhS0dZTnA0VjI2ay9qNFpYNXFn?=
 =?utf-8?B?SWN0MUtyL09ndklwbmt5bmxKWmFNMnRDQkhkSkdHcHU0K0hRZVNsaVJYQ0dE?=
 =?utf-8?B?Sk8ycTJkR1hVcGZkTFpXNldTcUpxWHNmQUFNSzE3dFVJQ0Z3OGpCc213MCsy?=
 =?utf-8?B?L0txT1F4RVNqY1M1NVd0L294aE9WNGFUeG9ZWCtreldESXFOcFByLzlTRnMx?=
 =?utf-8?B?bkNQN0Q3SDIwKzBneDhYVXZGSkgyVlFNa2RheDg1VWZNRmpmS3NYbkE1bVlW?=
 =?utf-8?B?K29VR3pvNVZXSEx0dElHRFZKUko3Rk1XQ0RBMzZuNDhsMFRZN1Zucnhxdy93?=
 =?utf-8?B?OEJUaHZuUUtLa3IvcThkZHlGZGh6MEVPZEVmWFJBNkc3TW9jT3BNME82UWJq?=
 =?utf-8?B?WHNCTldBOUhnOThIY2UxU01ZMDI3Z1hhVG95dzNhUmc3eFhTWTFLdjN2SVU1?=
 =?utf-8?B?M3N1ZkU2QTdJOEtqUkk5Q2w5SndTLzU2cVYxYkJGNzNlYU1qMktBSEoxaUlm?=
 =?utf-8?B?L2NnNmdubWMvQk1aQjhBTFdGUHA4UFhybGVmUDVlNDJHT3pXZlZFSmVPaCti?=
 =?utf-8?B?TVE3YXMwbStrOWhGY3VmSXJHL1ZNaFB6SXpPOGNpcFdKM01xZXIzSjlXWmYr?=
 =?utf-8?B?RmhIU2VqY1BmRXRJY3FZNmxxaDhqMjlzVHd6K0d1WHc1bDlUQ2xHZU1IZlFC?=
 =?utf-8?B?Wnc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b581972-639c-4040-47ad-08dcf7e716c3
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2024 06:58:27.0582 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0/IF0Xgm6ftbiinscgVDbTiWM1W0CJCjIYahw0PZAjMUYuTeydfk+Sq0A32cJMmfaZ7r7fpHS5rar+ZbKtAzfPGYBuI5lqsiSJhHY73X0EU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYVPR01MB11276
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

SGkgTGl1IFlpbmcsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTGl1
IFlpbmcgPHZpY3Rvci5saXVAbnhwLmNvbT4NCj4gU2VudDogMjkgT2N0b2JlciAyMDI0IDA2OjE3
DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjQgMDgvMTNdIGR0LWJpbmRpbmdzOiBkaXNwbGF5OiBE
b2N1bWVudCBkdWFsLWxpbmsgTFZEUyBkaXNwbGF5IGNvbW1vbiBwcm9wZXJ0aWVzDQo+IA0KPiBP
biAxMC8yOC8yMDI0LCBMaXUgWWluZyB3cm90ZToNCj4gPiBEdWFsLWxpbmsgTFZEUyBkaXNwbGF5
cyByZWNlaXZlIG9kZCBwaXhlbHMgYW5kIGV2ZW4gcGl4ZWxzIHNlcGFyYXRlbHkNCj4gPiBmcm9t
IGR1YWwgTFZEUyBsaW5rcy4gIE9uZSBsaW5rIHJlY2VpdmVzIG9kZCBwaXhlbHMgYW5kIHRoZSBv
dGhlcg0KPiA+IHJlY2VpdmVzIGV2ZW4gcGl4ZWxzLiAgU29tZSBvZiB0aG9zZSBkaXNwbGF5cyBt
YXkgYWxzbyB1c2Ugb25seSBvbmUNCj4gPiBMVkRTIGxpbmsgdG8gcmVjZWl2ZSBhbGwgcGl4ZWxz
LCBiZWluZyBvZGQgYW5kIGV2ZW4gYWdub3N0aWMuDQo+ID4gRG9jdW1lbnQgY29tbW9uIHByb3Bl
cnRpZXMgZm9yIHRob3NlIGRpc3BsYXlzIGJ5IGV4dGVuZGluZyBMVkRTDQo+ID4gZGlzcGxheSBj
b21tb24gcHJvcGVydGllcyBkZWZpbmVkIGluIGx2ZHMueWFtbC4NCj4gPg0KPiA+IFN1Z2dlc3Rl
ZC1ieTogRG1pdHJ5IEJhcnlzaGtvdiA8ZG1pdHJ5LmJhcnlzaGtvdkBsaW5hcm8ub3JnPg0KPiA+
IFNpZ25lZC1vZmYtYnk6IExpdSBZaW5nIDx2aWN0b3IubGl1QG54cC5jb20+DQo+ID4gLS0tDQo+
ID4gdjQ6DQo+ID4gKiBTcXVhc2ggY2hhbmdlIGZvciBhZHZhbnRlY2gsaWRrLTIxMjF3ci55YW1s
IGFuZA0KPiA+ICAgcGFuZWwtc2ltcGxlLWx2ZHMtZHVhbC1wb3J0cy55YW1sIHdpdGggbHZkcy1k
dWFsLXBvcnRzLnlhbWwuICAoUm9iKQ0KPiA+ICogSW1wcm92ZSBkZXNjcmlwdGlvbiBpbiBsdmRz
LWR1YWwtcG9ydHMueWFtbC4gIChLcnp5c3p0b2YpDQo+ID4NCj4gPiB2MzoNCj4gPiAqIE5ldyBw
YXRjaC4gIChEbWl0cnkpDQo+ID4NCj4gPiAgLi4uL2JpbmRpbmdzL2Rpc3BsYXkvbHZkcy1kdWFs
LXBvcnRzLnlhbWwgICAgIHwgNzYgKysrKysrKysrKysrKysrKysrKw0KPiA+ICAuLi4vZGlzcGxh
eS9wYW5lbC9hZHZhbnRlY2gsaWRrLTIxMjF3ci55YW1sICAgfCAxNCArLS0tDQo+ID4gIC4uLi9w
YW5lbC9wYW5lbC1zaW1wbGUtbHZkcy1kdWFsLXBvcnRzLnlhbWwgICB8IDIwICstLS0tDQo+ID4g
IDMgZmlsZXMgY2hhbmdlZCwgNzggaW5zZXJ0aW9ucygrKSwgMzIgZGVsZXRpb25zKC0pICBjcmVh
dGUgbW9kZQ0KPiA+IDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlz
cGxheS9sdmRzLWR1YWwtcG9ydHMueWFtbA0KPiA+DQo+ID4gZGlmZiAtLWdpdA0KPiA+IGEvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbHZkcy1kdWFsLXBvcnRzLnlh
bWwNCj4gPiBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2x2ZHMt
ZHVhbC1wb3J0cy55YW1sDQo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gPiBpbmRleCAwMDAw
MDAwMDAwMDAuLjVmN2EzMDY0MDQwNA0KPiA+IC0tLSAvZGV2L251bGwNCj4gPiArKysgYi9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9sdmRzLWR1YWwtcG9ydHMueWFt
bA0KPiA+IEBAIC0wLDAgKzEsNzYgQEANCj4gPiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjog
KEdQTC0yLjAtb25seSBPUiBCU0QtMi1DbGF1c2UpICVZQU1MIDEuMg0KPiA+ICstLS0NCj4gPiAr
JGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9kaXNwbGF5L2x2ZHMtZHVhbC1wb3J0
cy55YW1sIw0KPiA+ICskc2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFz
L2NvcmUueWFtbCMNCj4gPiArDQo+ID4gK3RpdGxlOiBEdWFsLWxpbmsgTFZEUyBEaXNwbGF5IENv
bW1vbiBQcm9wZXJ0aWVzDQo+ID4gKw0KPiA+ICttYWludGFpbmVyczoNCj4gPiArICAtIExpdSBZ
aW5nIDx2aWN0b3IubGl1QG54cC5jb20+DQo+ID4gKw0KPiA+ICtkZXNjcmlwdGlvbjogfA0KPiA+
ICsgIENvbW1vbiBwcm9wZXJ0aWVzIGZvciBMVkRTIGRpc3BsYXlzIHdpdGggZHVhbCBMVkRTIGxp
bmtzLiBFeHRlbmQNCj4gPiArTFZEUyBkaXNwbGF5DQo+ID4gKyAgY29tbW9uIHByb3BlcnRpZXMg
ZGVmaW5lZCBpbiBsdmRzLnlhbWwuDQo+ID4gKw0KPiA+ICsgIER1YWwtbGluayBMVkRTIGRpc3Bs
YXlzIHJlY2VpdmUgb2RkIHBpeGVscyBhbmQgZXZlbiBwaXhlbHMNCj4gPiArIHNlcGFyYXRlbHkg
ZnJvbSAgdGhlIGR1YWwgTFZEUyBsaW5rcy4gT25lIGxpbmsgcmVjZWl2ZXMgb2RkIHBpeGVscw0K
PiA+ICsgYW5kIHRoZSBvdGhlciByZWNlaXZlcyAgZXZlbiBwaXhlbHMuIFNvbWUgb2YgdGhvc2Ug
ZGlzcGxheXMgbWF5IGFsc28NCj4gPiArIHVzZSBvbmx5IG9uZSBMVkRTIGxpbmsgdG8gIHJlY2Vp
dmUgYWxsIHBpeGVscywgYmVpbmcgb2RkIGFuZCBldmVuIGFnbm9zdGljLg0KPiA+ICsNCj4gPiAr
YWxsT2Y6DQo+ID4gKyAgLSAkcmVmOiBsdmRzLnlhbWwjDQo+ID4gKw0KPiA+ICtwcm9wZXJ0aWVz
Og0KPiA+ICsgIHBvcnRzOg0KPiA+ICsgICAgJHJlZjogL3NjaGVtYXMvZ3JhcGgueWFtbCMvcHJv
cGVydGllcy9wb3J0cw0KPiA+ICsNCj4gPiArICAgIHByb3BlcnRpZXM6DQo+ID4gKyAgICAgIHBv
cnRAMDoNCj4gPiArICAgICAgICAkcmVmOiAvc2NoZW1hcy9ncmFwaC55YW1sIy8kZGVmcy9wb3J0
LWJhc2UNCj4gPiArICAgICAgICB1bmV2YWx1YXRlZFByb3BlcnRpZXM6IGZhbHNlDQo+ID4gKyAg
ICAgICAgZGVzY3JpcHRpb246IHRoZSBmaXJzdCBMVkRTIGlucHV0IGxpbmsNCj4gPiArDQo+ID4g
KyAgICAgICAgcHJvcGVydGllczoNCj4gPiArICAgICAgICAgIGR1YWwtbHZkcy1vZGQtcGl4ZWxz
Og0KPiA+ICsgICAgICAgICAgICB0eXBlOiBib29sZWFuDQo+ID4gKyAgICAgICAgICAgIGRlc2Ny
aXB0aW9uOiB0aGUgZmlyc3QgTFZEUyBpbnB1dCBsaW5rIGZvciBvZGQgcGl4ZWxzDQo+ID4gKw0K
PiA+ICsgICAgICAgICAgZHVhbC1sdmRzLWV2ZW4tcGl4ZWxzOg0KPiA+ICsgICAgICAgICAgICB0
eXBlOiBib29sZWFuDQo+ID4gKyAgICAgICAgICAgIGRlc2NyaXB0aW9uOiB0aGUgZmlyc3QgTFZE
UyBpbnB1dCBsaW5rIGZvciBldmVuIHBpeGVscw0KPiA+ICsNCj4gPiArICAgICAgICBvbmVPZjoN
Cj4gPiArICAgICAgICAgIC0gcmVxdWlyZWQ6IFtkdWFsLWx2ZHMtb2RkLXBpeGVsc10NCj4gPiAr
ICAgICAgICAgIC0gcmVxdWlyZWQ6IFtkdWFsLWx2ZHMtZXZlbi1waXhlbHNdDQo+ID4gKyAgICAg
ICAgICAtIHByb3BlcnRpZXM6DQo+ID4gKyAgICAgICAgICAgICAgZHVhbC1sdmRzLW9kZC1waXhl
bHM6IGZhbHNlDQo+ID4gKyAgICAgICAgICAgICAgZHVhbC1sdmRzLWV2ZW4tcGl4ZWxzOiBmYWxz
ZQ0KPiA+ICsNCj4gPiArICAgICAgcG9ydEAxOg0KPiA+ICsgICAgICAgICRyZWY6IC9zY2hlbWFz
L2dyYXBoLnlhbWwjLyRkZWZzL3BvcnQtYmFzZQ0KPiA+ICsgICAgICAgIHVuZXZhbHVhdGVkUHJv
cGVydGllczogZmFsc2UNCj4gPiArICAgICAgICBkZXNjcmlwdGlvbjogdGhlIHNlY29uZCBMVkRT
IGlucHV0IGxpbmsNCj4gPiArDQo+ID4gKyAgICAgICAgcHJvcGVydGllczoNCj4gPiArICAgICAg
ICAgIGR1YWwtbHZkcy1vZGQtcGl4ZWxzOg0KPiA+ICsgICAgICAgICAgICB0eXBlOiBib29sZWFu
DQo+ID4gKyAgICAgICAgICAgIGRlc2NyaXB0aW9uOiB0aGUgc2Vjb25kIExWRFMgaW5wdXQgbGlu
ayBmb3Igb2RkIHBpeGVscw0KPiA+ICsNCj4gPiArICAgICAgICAgIGR1YWwtbHZkcy1ldmVuLXBp
eGVsczoNCj4gPiArICAgICAgICAgICAgdHlwZTogYm9vbGVhbg0KPiA+ICsgICAgICAgICAgICBk
ZXNjcmlwdGlvbjogdGhlIHNlY29uZCBMVkRTIGlucHV0IGxpbmsgZm9yIGV2ZW4gcGl4ZWxzDQo+
ID4gKw0KPiA+ICsgICAgICAgIG9uZU9mOg0KPiA+ICsgICAgICAgICAgLSByZXF1aXJlZDogW2R1
YWwtbHZkcy1vZGQtcGl4ZWxzXQ0KPiA+ICsgICAgICAgICAgLSByZXF1aXJlZDogW2R1YWwtbHZk
cy1ldmVuLXBpeGVsc10NCj4gPiArICAgICAgICAgIC0gcHJvcGVydGllczoNCj4gPiArICAgICAg
ICAgICAgICBkdWFsLWx2ZHMtb2RkLXBpeGVsczogZmFsc2UNCj4gPiArICAgICAgICAgICAgICBk
dWFsLWx2ZHMtZXZlbi1waXhlbHM6IGZhbHNlDQo+IA0KPiBIbW0sIEkgc2hvdWxkIHJlcXVpcmUg
cG9ydEAwIG9yIHBvcnRAMS4NCg0KRm9yIGR1YWwgTFZEUywgeW91IG5lZWQgMyBwb3J0cyBhcyBj
b21tb24gdXNlIGNhc2UNCg0KMiBpbnB1dCBwb3J0cyBhbmQgMSBvdXRwb3J0IGFuZCBhbGwgYXJl
IHJlcXVpcmVkIHByb3BlcnRpZXMuDQoNCkNoZWVycywNCkJpanUNCg0KPiBXaWxsIHdhaXQgYSB3
aGlsZSBmb3IgY29tbWVudHMgYW5kIGFkZCB0aGlzIGluIG5leHQgdmVyc2lvbi4NCj4gDQo+IC0t
ODwtLQ0KPiAgICAgYW55T2Y6DQo+ICAgICAgIC0gcmVxdWlyZWQ6DQo+ICAgICAgICAgICAtIHBv
cnRAMA0KPiAgICAgICAtIHJlcXVpcmVkOg0KPiAgICAgICAgICAgLSBwb3J0QDENCj4gLS04PC0t
DQo+IA0KPiA+ICsNCj4gPiArcmVxdWlyZWQ6DQo+ID4gKyAgLSBwb3J0cw0KPiA+ICsNCj4gPiAr
YWRkaXRpb25hbFByb3BlcnRpZXM6IHRydWUNCj4gPiArDQo+ID4gKy4uLg0KPiANCj4gWy4uLl0N
Cj4gDQo+IC0tDQo+IFJlZ2FyZHMsDQo+IExpdSBZaW5nDQoNCg==
