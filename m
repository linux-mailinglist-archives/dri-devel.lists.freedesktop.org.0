Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A4649B5E65
	for <lists+dri-devel@lfdr.de>; Wed, 30 Oct 2024 10:03:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1742010E767;
	Wed, 30 Oct 2024 09:02:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="jTR3We/O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU010.outbound.protection.outlook.com
 (mail-japanwestazon11011051.outbound.protection.outlook.com [40.107.74.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CFA010E767
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Oct 2024 09:02:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FvEE3LFMvF3h1LAamQCTUjrpXh6TW7RZG/i/65bKWnPifvPOnTknR80CaGqt2bKhdbvJnKeshDu41ELp5EqPilIcnjjcOQm7gP20O6s272c6NwS1mwB6lpzIMMnRJRYqL75bYz8uWNi5YbW0SQxpKvgcV0a/DE97j2AT8zPiuC0TU8Rd4mpIc+3+M8TDktVzG39elXbcU12RT0EGKXsIk7La2+nUlVdj8N/gwdAvy2CbAkiDjkK5ik6Co3zUth811Wq0pY4TD3I9eAYt3G2K1TPQtGINE4E0nYn0YNPENSxZx2jOjhODOtPbR87+lIIsPfPyKvJayl6YQE+45+ueTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8ZRlSx8VfTMqOgJHoL79MB1DAAbfJ7DMWs6j5EKq0q4=;
 b=jvVNz9DJDX6KpDKa8zpBJlmPtPNAZL0ytmUXn51iFOIh/RTD+BxbLeD+di5ph/TOI0vR69b1jSyGTF3RzLYv2WHegAlDHmCNvzanDuX4/YcuaqKx1B64EMSYaAEhI5Pff0o2bL4w32lKdQb+KuOyy2KOCGix1GqJnlrhn7saWBVO2GO40kUk3cQNlkdHoi0j/ROc5zfBg0eRC9ClalBvvGbvtVR/wsW22h2JOsnUx+8Skc6ue8rBgmnh9Cp8/tjG2knYQ/dqvLERpnhDeLUQROUNC4plEkzzyRfW7xDMPERX15osn0zfD6Rnm7fcX8z9Bbr0eolwJ6ChgA794hjPlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8ZRlSx8VfTMqOgJHoL79MB1DAAbfJ7DMWs6j5EKq0q4=;
 b=jTR3We/OH7/99eDrFOfEd2+cDpFuhKHaaw6zOq08llm+O/LPwLm+SRbzgTTim5/tKWZAp/fbcpEmWBM/GJal3ktZAEZY8LJpqzD9wo5rWTz826ubrRZl65l2t9CY67KqPOKdbvET8n/lAPkC/cGuO3ZxlhGAjNJEaEKiBwtPd30=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYCPR01MB10461.jpnprd01.prod.outlook.com (2603:1096:400:305::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.29; Wed, 30 Oct
 2024 09:02:50 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%3]) with mapi id 15.20.8114.015; Wed, 30 Oct 2024
 09:02:39 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Liu Ying
 <victor.liu@nxp.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "andrzej.hajda@intel.com"
 <andrzej.hajda@intel.com>, "neil.armstrong@linaro.org"
 <neil.armstrong@linaro.org>, "rfoss@kernel.org" <rfoss@kernel.org>,
 laurent.pinchart <laurent.pinchart@ideasonboard.com>, "jonas@kwiboo.se"
 <jonas@kwiboo.se>, "jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, "airlied@gmail.com" <airlied@gmail.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>, "robh@kernel.org" <robh@kernel.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
 <conor+dt@kernel.org>, "quic_jesszhan@quicinc.com"
 <quic_jesszhan@quicinc.com>, "mchehab@kernel.org" <mchehab@kernel.org>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de"
 <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "festevam@gmail.com" <festevam@gmail.com>, "catalin.marinas@arm.com"
 <catalin.marinas@arm.com>, "will@kernel.org" <will@kernel.org>,
 "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
 "hverkuil@xs4all.nl" <hverkuil@xs4all.nl>, "tomi.valkeinen@ideasonboard.com"
 <tomi.valkeinen@ideasonboard.com>, "quic_bjorande@quicinc.com"
 <quic_bjorande@quicinc.com>, "geert+renesas@glider.be"
 <geert+renesas@glider.be>, "arnd@arndb.de" <arnd@arndb.de>,
 "nfraprado@collabora.com" <nfraprado@collabora.com>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>, Prabhakar Mahadev Lad
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, "sam@ravnborg.org"
 <sam@ravnborg.org>, "marex@denx.de" <marex@denx.de>
Subject: RE: [PATCH v4 00/13] Add ITE IT6263 LVDS to HDMI converter support
Thread-Topic: [PATCH v4 00/13] Add ITE IT6263 LVDS to HDMI converter support
Thread-Index: AQHbKOJkqY05AJR01UOImSMvFhFSS7Kb9BIAgAAMnhCAABTHgIAA8PGAgAGcDQCAAF1swA==
Date: Wed, 30 Oct 2024 09:02:39 +0000
Message-ID: <TY3PR01MB113467D658D6680491662BA3586542@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20241028023740.19732-1-victor.liu@nxp.com>
 <CAA8EJprFBbC_=kBHi86j-nE_K68QeG+c2OBzJCbUyNWs5zQK0Q@mail.gmail.com>
 <TY3PR01MB11346F956733032EC10E997AF864A2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <5ycxltnw3vhik3iype6ncuh4nelwwtom745o5dlf32qyiqh5bv@yjj5l6kb2psm>
 <1e8526e5-d9b7-42ac-9db3-13b42ccc4fbe@nxp.com>
 <CAA8EJppAnfiVqNYN6CxaU1Q5fMwDgWhSsPU9qQz7KHb6px=grA@mail.gmail.com>
In-Reply-To: <CAA8EJppAnfiVqNYN6CxaU1Q5fMwDgWhSsPU9qQz7KHb6px=grA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYCPR01MB10461:EE_
x-ms-office365-filtering-correlation-id: a3298290-a3d6-4518-bdb1-08dcf8c19b43
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?NmdwTlE0NGYvOXpackxBSEo5cDdTMjdFZHRMQWU0eHRFd3dZVnF0alhBSENk?=
 =?utf-8?B?YWR3dTRZQUlqTXNaL0ZaSjh4M21LSklyVDJ1SDFKRUdlK2Y3clN6SVZIb0Nx?=
 =?utf-8?B?dEIwSVQ3MWFWRDJ3bFZiSVVrUmVzQ3dQdGVoWjNTeGZPZGlHMVVwZEJkOG1w?=
 =?utf-8?B?SEhTR2ptYU8rSk53Zi9hQmxzTlJFWDFmdldIRWpmUndFVzA1L2JpRDZ0NTlX?=
 =?utf-8?B?REpLN2xkd3h0RFM0K0V0N1FpV2dGM1NCODkvWjRaL2gyUUJJSzNYbFU4eVFS?=
 =?utf-8?B?R2ttVDlCbGdzS3F5M3M3cXJ4cGVHd2d6cCtyeVZxNnJSUENhRG9ZejJQdzU3?=
 =?utf-8?B?NmJsanV2WUNQRWFmTWFCQkxnVGxuU1hBcTVVMVR2Uk9OL0tTUFB3d2VlcEtO?=
 =?utf-8?B?NytDT0VWK2Ric3BnWUIycmpjSnd6b01WT2tISEd3amZzOE4vV3U2K05YSU45?=
 =?utf-8?B?SGlobEhDR21wdS9ONGMyWmJrOXlsKzBZV0VWdUVMUktGd3M2QytqcTVMWHdi?=
 =?utf-8?B?RzZwNUYxcTJUeHJ5RlNqN1ZtNDdxallPdTIwc2hNZGU0cnhpYUlNNkxWZ1Z6?=
 =?utf-8?B?M0cxZWxEelI0SGp1N2tXdGoyMDdPbFFoMmdoN2daOTJmb24wYkRGRW9TQmZs?=
 =?utf-8?B?bFcrS2c3NnJnN08rQjFtZFVkTkFWTUdxdlNWSitSOGs1RTcrWXpNeE1MVHZM?=
 =?utf-8?B?Z2lKQXNWMDhLTGZHYTFBT090Nk5hdGhsd0JlZkl5Unljb2w1d1B3cCtyQ1Qx?=
 =?utf-8?B?TnNQT1RsSDlJbHpLRDBKVlIvZW9nNVFlSE9hZGF3a05tWk1PUFEvblRHUHZu?=
 =?utf-8?B?aW1XMjNKelRyTUNZTE5HQmw0MUhLYlptRHN5ZU5QVEpqU2pXYTMzckZxdFRK?=
 =?utf-8?B?SWViMkFkUXJHSm03cmJxUCs5NThsZld0R2JXUVpRZ2RMcXFzazlZcGtVbVE3?=
 =?utf-8?B?UWpsdHpZeFdUckxEdE1hVFV5L3FaTUt2OC8rMDlXYTV3OHFXbllLTWxhWlNz?=
 =?utf-8?B?cjhUejYwWEhKdG5GZCtLWFZnY3hiaFhEcUNRbURpYi9wSC9CaitFZU9ETXVI?=
 =?utf-8?B?YXBiM3RYQWVBKyt4VnZFVEYrcDBrcWpiNU9XempVMUk3MWxuTDM3V0NySGlG?=
 =?utf-8?B?TXAzQWJ1RUlPaGxHVVkyOFVUWmpGdkpzVmlCc3lvQ3U5dm8wQnFwbm5ybXk1?=
 =?utf-8?B?VjU0WjNpd2dlYTFocnNtZzMxQ2UzMGlhY2J4cDM0N1BtL1FBUDB3Zmp2SjlJ?=
 =?utf-8?B?Ry9jRGJPYVB3enJTanpvaUJZdnpoUnN0a0c4KzQ5c3lXWWthK1NRN0RTeEh2?=
 =?utf-8?B?SWpXSDkvRS9NcldpKzBNWCthdnF0TmdEbmx3YzB6Nm1zYnRiQ2JodURiODh6?=
 =?utf-8?B?dEtCTkFvQUJuNzJiVUZEZ0t2SE9xL2wwT1BLb2NnenBYdW9lUDEzcGhmZ3hH?=
 =?utf-8?B?TW9HYnZpTjlldnRBU1dFRVhZMGVEMVVQYWRzYVVLd0VZd1BOYWZZeHE0d0pX?=
 =?utf-8?B?Wkd4NzFQcXpkNEM3eGk1MmYzZ2pkRHZFVnN3eXFlWmxTK0FheC9FT1lxeDlt?=
 =?utf-8?B?eEdKQ3VoNXh4ZmM4QVRXVFZLWkFiMUM5Q3oxSmphc0s3N1BJUGNNdlJTcFhF?=
 =?utf-8?B?RHhMb2hvempFQlVERXkxNkp0VDEvMVpOR3hnOTMvK0hwYkJEMDZnUHY3VC9K?=
 =?utf-8?B?T0RlZjhyaWhJSzFlNUNsY0VBTUc0YXdMWmRzS1JPRWtqUjNQWmI1UUovc1ND?=
 =?utf-8?B?WEJzRUhXN0NEWnRmbWtMS09PM21NVnZyR0VMSzlJWHc4eHVkMytYRXdOYWxP?=
 =?utf-8?Q?8c/A29FhemyqUnUDXbKZDpaV9CJqa/A9WRc2Y=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY3PR01MB11346.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MGtLd3MwbjBvR1FIcHJkcGhDMnpDMWZKWjJ1dGxNWWMrKzBVbjlKcFNGMitG?=
 =?utf-8?B?cGxKZUFkcWdoZythKzRyZjJOSklGaFVpdllQQVJtSkNmUk16R2RMSm9hd0xP?=
 =?utf-8?B?VmRoV25JdkEwWEh3Vk5FSWc4bDJOOE1iRUowU2J0Si9NWVNxdFFpNytSQnZu?=
 =?utf-8?B?UnMwTmJxRmdTOThiWG5KSUZnTWJqMlk1L0x6R2NXVlFmbCsybHZ2a21FT0pH?=
 =?utf-8?B?aUZqK0t6bnAvMnd1VnUrRDdSa3BuOGN3M1NZZnZFSTNEYWgveHRFV2NqRGox?=
 =?utf-8?B?N0cwTGVHVDl2WG5pd0IyRVhzSk0yemJsamUrOXlGUmgyR2tyOFJNQWk2R3ZK?=
 =?utf-8?B?aFc2dGM4bjFIOWhvS2RiZ2xYbWtPa1VxclNyWTBQRTkzQjUzbkdFb2h3aTNs?=
 =?utf-8?B?cTZ6NUJpaGl2NU1hdHdVc3FnTCt1Mlk3cWhMRWVnaWVIVytrMEg3RzhUbUlo?=
 =?utf-8?B?akZoL2gzcitpM1R0Zy9TN0FjQ01UdG5SejMyY3liNlNEcE1aOTRidjBOVnY4?=
 =?utf-8?B?VlZkSjVmcHFONU95bnh0Z3JuZDJOYW1YYVc1Q0tzQ1E3Q1Z0Ky9FVGpScUMw?=
 =?utf-8?B?dlVSS3g3d3N2RXFLeDEwWis2ZzFEREpCUUdxUC91WFBtMXlqS1Q3dFBtNC9I?=
 =?utf-8?B?NDc5OGxkaVRkbjNKbDdKQzFiSVVKVVc3dnA1K3hqbVh4ci81dWplVkVQa3hX?=
 =?utf-8?B?NExaOU1MU0h4ZUxZbHZDckYySnl0Y0F3VUJpMm83andUc1kxWmxuSXRsZmdY?=
 =?utf-8?B?WHc5aWN1V1hsVFN0bXRHWFJBcnMyWGZ1VlRuQkgway9Da0ZQNUtqMDBkS0th?=
 =?utf-8?B?bEVNTEFVbjRVTTNXMHB5a0ZDQnkxVlJkQnlZSTd5Q0FqSVRubDFuelRBWkJJ?=
 =?utf-8?B?NUhGTmRibXNvaGt0b1FheHlpczl1REFkcmFEWnNScFdEbjhrMjlGaU1Zci9J?=
 =?utf-8?B?LzVVdXNMc1pTOHdFVXdIME1sckFqWFVaYXd6SElyOXFjRVVadU41SDRXVFNW?=
 =?utf-8?B?UGNMa09iR3N1MTRCQXZsSzMzU2RmV0Z4Y0ZFeFVwN3RCaFpyOGVhdE5DZkJM?=
 =?utf-8?B?cmlzcGJFelphTS80cXhuVGJwZ3JCWFY4SldQSEV4VHVyVGVDcFRoVnJQOWxn?=
 =?utf-8?B?UWh0YXF3MXQyTElXbCsxQ0RQS2dUTXBVWFR6RHNEUzNyOFYyaTRaRlVGSzcx?=
 =?utf-8?B?M1kzR2JaTkl0QW5MdE1pRGxURVUyNzhmcEZ4amRsVnYzcXphVE02NGY5WTM4?=
 =?utf-8?B?RHlyUXdQYnBicXpMcFgwSGpLemRIR2t3MG53WW0rak93VVIxd1pFQjVqZkpB?=
 =?utf-8?B?ZmJVcG1iazJOa3V2aFNyQThDRk5yc1BtcWx0bFA5Zks2Yk9kSnVyRFRhc1Vi?=
 =?utf-8?B?Z3dZaWFjbkcyeFRtVy9SZFlkY3h4Tjg3VUc4cHJNc3BWVFd2UnE1YVF2MzQ5?=
 =?utf-8?B?aW5xOHBUNmdiRzBGY1VQNk11V2RWU2tKMFl4d3NYM1dNMEdwQjdoSWhSWmNz?=
 =?utf-8?B?Z1IwN1RockY2QnoyODdnUHNOUVQyMlVGZHpKWDMvVW0zbno1aHJrNTMza0x3?=
 =?utf-8?B?aUxTRHlNQmdtdFd3bFcyMlVWTEdQZTFsT1R4eHo4SXlLd0gzc3dUT0RzOThQ?=
 =?utf-8?B?SzN0ZjFvNXJCY09HYXZnR0JwZ24vYk5SMmhaSkJDNzFVQ2FMcFJqM1FnQmRm?=
 =?utf-8?B?emZ5RmkvUUdqUjhVdVJBZW9yRDBaVkZRWjhGeHpnY3l2eGhzSmtpSHd1VHJs?=
 =?utf-8?B?bVJHYzFDd3NuMEVyQ1pNRU82dUFMRmJxS1FxUkdvYzhNaW5iSXZuL09VZ3p4?=
 =?utf-8?B?T3NMYlV3dEUwZWpPWVozUHUxSTJtaFdoUXFLK1kwK2MrZytNNHhBRzhmcW43?=
 =?utf-8?B?T2tVVXkxK08vdXR0TGZLb0hSMlp4ZXFBUTcydllXeVd3Vm9BdVVSU3V2U1BE?=
 =?utf-8?B?TStpQmQ0Ry9RUllsRHlGUkp3UGFJZUM5LzM1UUpTUWUrejYwVmNkWGhGUEtp?=
 =?utf-8?B?b1pIQy9KL09INTU0aUVzajNSM0I3Ry9RZjYvdkNnenRwQURqRy9wTGdaNmpa?=
 =?utf-8?B?QjZ3ek5hYy9qZm5hdW8zRFMzQWFvYTJidnowcWdTeGltUDRQajNWVkowL3Fa?=
 =?utf-8?B?dEd4ZGNxYU5IaCszSExVU1YwM081N1M2d1dhUm9uanhNT2d6REVUV0FxWWs2?=
 =?utf-8?B?Rnc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3298290-a3d6-4518-bdb1-08dcf8c19b43
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2024 09:02:39.6688 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kk8OQJpDPbr5jrhlPBptJGNcAIXxdEEFkl/JMm+oORlla5WjOixtdxwKn6PUvwl+2Y8fYWkknuYIH1knOnM0KduzuNFcHb0zDzPBjRQxJqo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10461
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

SGkgRG1pdHJ5IEJhcnlzaGtvdiwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBG
cm9tOiBEbWl0cnkgQmFyeXNoa292IDxkbWl0cnkuYmFyeXNoa292QGxpbmFyby5vcmc+DQo+IFNl
bnQ6IDMwIE9jdG9iZXIgMjAyNCAwMzoxNw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY0IDAwLzEz
XSBBZGQgSVRFIElUNjI2MyBMVkRTIHRvIEhETUkgY29udmVydGVyIHN1cHBvcnQNCj4gDQo+IE9u
IFR1ZSwgMjkgT2N0IDIwMjQgYXQgMDQ6NDEsIExpdSBZaW5nIDx2aWN0b3IubGl1QG54cC5jb20+
IHdyb3RlOg0KPiA+DQo+ID4gT24gMTAvMjgvMjAyNCwgRG1pdHJ5IEJhcnlzaGtvdiB3cm90ZToN
Cj4gPiA+IE9uIE1vbiwgT2N0IDI4LCAyMDI0IGF0IDExOjEyOjAwQU0gKzAwMDAsIEJpanUgRGFz
IHdyb3RlOg0KPiA+ID4+IEhpIERtaXRyeSwgTGl1LA0KPiA+ID4+DQo+ID4gPj4+IC0tLS0tT3Jp
Z2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gPj4+IEZyb206IERtaXRyeSBCYXJ5c2hrb3YgPGRtaXRy
eS5iYXJ5c2hrb3ZAbGluYXJvLm9yZz4NCj4gPiA+Pj4gU2VudDogMjggT2N0b2JlciAyMDI0IDEw
OjIwDQo+ID4gPj4+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjQgMDAvMTNdIEFkZCBJVEUgSVQ2MjYz
IExWRFMgdG8gSERNSQ0KPiA+ID4+PiBjb252ZXJ0ZXIgc3VwcG9ydA0KPiA+ID4+Pg0KPiA+ID4+
PiBIaSwNCj4gPiA+Pj4NCj4gPiA+Pj4gT24gTW9uLCAyOCBPY3QgMjAyNCBhdCAwNDozNywgTGl1
IFlpbmcgPHZpY3Rvci5saXVAbnhwLmNvbT4gd3JvdGU6DQo+ID4gPj4+Pg0KPiA+ID4+Pj4gSGks
DQo+ID4gPj4+Pg0KPiA+ID4+Pj4gVGhpcyBwYXRjaCBzZXJpZXMgYWltcyB0byBhZGQgSVRFIElU
NjI2MyBMVkRTIHRvIEhETUkgY29udmVydGVyDQo+ID4gPj4+PiBvbiBpLk1YOE1QIEVWSy4gIENv
bWJpbmVkIHdpdGggTFZEUyByZWNlaXZlciBhbmQgSERNSSAxLjRhDQo+ID4gPj4+PiB0cmFuc21p
dHRlciwgdGhlIElUNjI2MyBzdXBwb3J0cyBMVkRTIGlucHV0IGFuZCBIRE1JIDEuNCBvdXRwdXQN
Cj4gPiA+Pj4+IGJ5IGNvbnZlcnNpb24gZnVuY3Rpb24uICBJVDYyNjMgcHJvZHVjdCBsaW5rIGNh
biBiZSBmb3VuZCBhdCBbMV0uDQo+ID4gPj4+Pg0KPiA+ID4+Pj4gUGF0Y2ggMSBpcyBhIHByZXBh
cmF0aW9uIHBhdGNoIHRvIGFsbG93IGRpc3BsYXkgbW9kZSBvZiBhbg0KPiA+ID4+Pj4gZXhpc3Rp
bmcgcGFuZWwgdG8gcGFzcyB0aGUgYWRkZWQgbW9kZSB2YWxpZGF0aW9uIGxvZ2ljIGluIHBhdGNo
IDMuDQo+ID4gPj4+Pg0KPiA+ID4+Pj4gUGF0Y2ggMiBhbGxvd3MgaS5NWDhNUCBMVkRTIERpc3Bs
YXkgQnJpZGdlKExEQikgYnJpZGdlIGRyaXZlciB0bw0KPiA+ID4+Pj4gZmluZCB0aGUgbmV4dCBu
b24tcGFuZWwgYnJpZGdlLCB0aGF0IGlzIHRoZSBJVDYyNjMgaW4gdGhpcyBjYXNlLg0KPiA+ID4+
Pj4NCj4gPiA+Pj4+IFBhdGNoIDMgYWRkcyBtb2RlIHZhbGlkYXRpb24gbG9naWMgdG8gaS5NWDhN
UCBMREIgYnJpZGdlIGRyaXZlcg0KPiA+ID4+Pj4gYWdhaW5zdCAibGRiIiBjbG9jayBzbyB0aGF0
IGl0IGNhbiBmaWx0ZXIgb3V0IHVuc3VwcG9ydGVkIGRpc3BsYXkNCj4gPiA+Pj4+IG1vZGVzIHJl
YWQgZnJvbSBFRElELg0KPiA+ID4+Pj4NCj4gPiA+Pj4+IFBhdGNoIDQgYWRkcyBNRURJQV9CVVNf
Rk1UX1JHQjEwMTAxMF8xWDdYNV97U1BXRyxKRUlEQX0gc3VwcG9ydCwNCj4gPiA+Pj4+IGFzIHRo
ZXkgYXJlIHN1cHBvcnRlZCBieSBJVDYyNjMod2l0aCBMVkRTIGRhdGEgYml0IHJldmVyc2VkIG9y
ZGVyKS4NCj4gPiA+Pj4+DQo+ID4gPj4+PiBQYXRjaCA1IG1ha2VzIGRybV9vZi5jIHVzZSBNRURJ
QV9CVVNfRk1UX1JHQjEwMTAxMF8xWDdYNV97SkVJREEsU1BXR30uDQo+ID4gPj4+Pg0KPiA+ID4+
Pj4gUGF0Y2ggNiBzdXBwb3J0cyBnZXR0aW5nIGR1YWwtbGluayBMVkRTIHBpeGVsIG9yZGVyIGZv
ciB0aGUgc2luaw0KPiA+ID4+Pj4gc2lkZSBhcyBuZWVkZWQgYnkgSVQ2MjYzIGRyaXZlci4NCj4g
PiA+Pj4+DQo+ID4gPj4+PiBQYXRjaCA3IGRvY3VtZW50cyBqZWlkYS0zMCBhbmQgdmVzYS0zMCBk
YXRhIG1hcHBpbmdzIGluDQo+ID4gPj4+PiBsdmRzLWRhdGEtbWFwcGluZy55YW1sLCBhcyBuZWVk
ZWQgYnkgSVQ2MjYzIERUIGJpbmRpbmcuDQo+ID4gPj4+Pg0KPiA+ID4+Pj4gUGF0Y2ggOCBleHRy
YWN0cyBjb21tb24gZHVhbC1saW5rIExWRFMgZGlzcGxheSBwcm9wZXJ0aWVzIGludG8NCj4gPiA+
Pj4+IG5ldyBsdmRzLWR1YWwtcG9ydHMueWFtbCBzbyB0aGF0IElUNjI2MyBEVCBiaW5kaW5nIGNh
biByZWZlcmVuY2UgaXQuDQo+ID4gPj4+Pg0KPiA+ID4+Pj4gUGF0Y2ggOSBhZGRzIERUIGJpbmRp
bmcgZm9yIElUNjI2My4NCj4gPiA+Pj4+DQo+ID4gPj4+PiBQYXRjaCAxMCBhZGRzIElUNjI2MyBi
cmlkZ2UgZHJpdmVyLiAgT25seSB2aWRlbyBvdXRwdXQgaXMgc3VwcG9ydGVkLg0KPiA+ID4+Pj4N
Cj4gPiA+Pj4+IFBhdGNoIDExIGFkZHMgRFQgb3ZlcmxheXMgdG8gc3VwcG9ydCBOWFAgYWRhcHRl
ciBjYXJkc1syXVszXSB3aXRoDQo+ID4gPj4+PiBJVDYyNjMgcG9wdWxhdGVkLg0KPiA+ID4+Pj4N
Cj4gPiA+Pj4+IFBhdGNoIDEyIGVuYWJsZXMgdGhlIElUNjI2MyBicmlkZ2UgZHJpdmVyIGluIGRl
ZmNvbmZpZy4NCj4gPiA+Pj4+DQo+ID4gPj4+PiBQYXRjaCAxMyB1cGRhdGVzIE1BSU5UQUlORVJT
IHRvIGFkZCBtYWludGFpbmVyIGZvciBJVDYyNjMgZHJpdmVyLg0KPiA+ID4+Pg0KPiA+ID4+PiBU
aGlzIGhhcyBwcmV0dHkgY29tcGxpY2F0ZWQgc3RydWN0dXJlIGZyb20gdGhlIG1lcmdpbmcgcG9p
bnQgb2Ygdmlldy4NCj4gPiA+Pj4NCj4gPiA+Pj4gSSBwcm9wb3NlIHdlIHRha2UgcGF0Y2hlcyA2
LCA4LCA5ICh3aXRob3V0IDMwLWJpdCBmb3JtYXRzLCB0aGV5DQo+ID4gPj4+IGNhbiBiZSBkcm9w
cGVkIHdoaWxlIGFwcGx5aW5nKSwgMTEsIDEyDQo+ID4gPj4+ICg/KSBhbmQgMTMgdGhyb3VnaCBk
cm0tbWlzYyBpbiBvbmUgYmF0Y2ggKG9uY2UgRFQgbWFpbnRhaW5lcnMNCj4gPiA+Pj4gcmV2aWV3
IHRoZSBiaW5kaW5nIHBhcnRzKS4gVGhpcyBsb29rcyBsaWtlIGEgbWluaW1hbCBzZXQsIGhhdmlu
ZyBubyBleHRyYSBkZXBlbmRlbmNpZXMuDQo+ID4gPj4NCj4gPiA+Pj4NCj4gPiA+Pj4gVGhlIHNl
Y29uZCBzZXQgbWlnaHQgYmUgNCwgNSArIG5ldyBwYXRjaCwgcmUtYWRkaW5nIDMwLWJpdCBmb3Jt
YXRzDQo+ID4gPj4+IHRvDQo+ID4gPj4+IElUNjI2MyBiaW5kaW5nIChubyBkcml2ZXIgY2hhbmdl
cyBhcmUgbmVjZXNzYXJ5KS4gVGhpcyBjYW4gZ28gaW4NCj4gPiA+Pj4gc2VwYXJhdGVseSwgYWZ0
ZXIgYW4gQWNrIGZyb20gbWVkaWEgbWFpbnRhaW5lcnMuDQo+ID4gPj4+DQo+ID4gPj4+IE9mIGNv
dXJzZSBib3RoIHNldHMgY2FuIGdvIHRvZ2V0aGVyIGlmIGxpbnV4LW1lZGlhIG1haW50YWluZXJz
DQo+ID4gPj4+IHJlYWN0cyBxdWlja2x5IGFuZCBhY2sgbWVyZ2luZyBtZWRpYS0gZm9ybWF0cyBw
YXRjaCB0aHJvdWdoIGRybS1taXNjIHRyZWUuDQo+ID4NCj4gPiBJJ20gZmluZSB3aXRoIG1lcmdp
bmcgdGhlIHR3byBzZXRzIHRocm91Z2ggZHJtLW1pc2MgdHJlZSBhcyBsb25nIGFzDQo+ID4gbGlu
dXgtbWVkaWEgYW5kIGRyaS1kZXZlbCBtYWludGFpbmVycyBhY2NlcHQgdGhpcy4gIFVwIHRvIHRo
ZW0uDQo+ID4NCj4gPiA+Pj4NCj4gPiA+Pj4gVGhlIHJlc3Qgb2YgdGhlIHBhdGNoZXMgZG9uJ3Qg
aGF2ZSBzdWNoIHN0cm9uZyBkZXBlbmRlbmNpZXMgYW5kIGdvIGluIG9uY2UgcmVhZHkgLyByZXZp
ZXdlZC4NCj4gPiA+Pj4NCj4gPiA+Pj4gV0RZVD8NCj4gPiA+Pg0KPiA+ID4+IEkgZ3Vlc3MsIDYs
OCw5KHdpdGhvdXQgMzAtYml0IGZvcm1hdHMpLCAxMCwgMTIgYW5kIDEzLg0KPiA+ID4+DQo+ID4g
Pj4gMTEgbWF5IGhhdmUgZGVwZW5kZW5jeSBvbiAxLCAyIGFuZCAzIGFzIGl0IGlzIFNvQyBzcGVj
aWZpYy4NCj4gPiA+DQo+ID4gPiBZZXMsIG9mIGNvdXJzZSwgMTAsIG5vdCAxMS4NCj4gPiA+DQo+
ID4gPj4gVGhlbiA0LCA1ICsgbmV3IHBhdGNoLCByZS1hZGRpbmcgMzAtYml0IGZvcm1hdHMgdG8g
SVQ2MjYzIGJpbmRpbmcuDQo+ID4NCj4gPiBJIHRoaW5rIGl0IHdvdWxkIGJlIGdvb2QgdG8gZGly
ZWN0bHkgc3VwcG9ydCAzMC1iaXQgZm9ybWF0cyBpbg0KPiA+IElUNjI2MyBEVCBiaW5kaW5nLCBu
b3QgcmUtYWRkIHRoZW0gdG8gaXQuICBUaGlzIHdheSwgd2UnbGwgaGF2ZSBvbmUNCj4gPiB2ZXJz
aW9uIG9mIHRoZSBiaW5kaW5nLCBub3QgdHdvLiAgU28sIGEgYmV0dGVyIGZpcnN0IHNldCB3b3Vs
ZCBjb250YWluDQo+ID4gcGF0Y2ggNiwgNyhvbmUgZXhpc3RpbmcgQS1iIGZyb20gS3J6eXN6dG9m
KSwgOCwgOSwgMTAsIDEyIGFuZCAxMy4NCj4gDQo+IEknbSBub3Qgc3VyZSB0aGF0IDcgY2FuIGdv
IHdpdGhvdXQgYW4gYWNrIGZyb20gbGludXgtbWVkaWEgbWFpbnRhaW5lcnMuDQoNCllvdSBtZWFu
IGluIGRlc2NyaWJpbmcgamVpZGEtMzAgYW5kIHZlc2EtMzAgZm9ybWF0IGluDQpwYXRjaCM3LCBp
cyB2YWxpZCBvbmx5IGlmIHBhdGNoIzQgaXMgb2sgd2l0aCBtZWRpYSBwZW9wbGUNCm9yIHRoZXkg
cHJvdmlkZSBhbiBhY2sgZm9yIHBhdGNoIzcgdG8gdGFrZSBpdCB0aHJvdWdoIGRybSB0cmVlPw0K
DQpDaGVlcnMsDQpCaWp1DQo=
