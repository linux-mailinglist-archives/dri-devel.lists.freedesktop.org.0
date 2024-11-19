Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB60B9D2172
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2024 09:18:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8075610E5E1;
	Tue, 19 Nov 2024 08:18:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="BSuzbbDy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on2051.outbound.protection.outlook.com [40.107.103.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3BC210E5E1
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2024 08:18:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i2/vqSbFFxajI7rROfmByaR0aa4BudIqcLr7d93uZUpuBqaGzT/STYSRrOLKRKa0h8Fau/qdsISCCAFZQaMf+7gPttFzifunEwGE3uu2/VizDg+94hIXCOhm5V6yb22OoE+t8Tm3PdJsJEDgpbXKsNKvk8nzMymSA1J8AY16faHPSbG0ZGtP7FF6vNanTnZ4baaOZFnBQmXhVx7Zlbv464MX6hXAnR3iPe52Vf4x+uoGftXWusczWVgiK1RyrdFF5WUe/qt275nocStuT+sBLpCqXuW5w9ZCM0OpUrYxjOF25oZY6HMdHuCOZE6xkEPbIA0z1NZmy7DLK4Qd5jeBKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OHPu6WhJT8reDgUx8Y+3eV9S1rs5i+kKUutBUQz0QtI=;
 b=XTXVLMLCTi6Itcv4OcaC7mGtw3nk/G4XQUZ/n+iJhcboG9XHIjKvrYR+SQmjEcmOJcHJ5HQJV/FtOtEVQ6l9JsPsDeXsENq46P2ljIee3z7XGIxeJDuLTjhXzF2OPfR32WiGSf3672Gcgvmg3ZjbkSZNXXHccay7WPKlhJ5VLD58LblcGvpQUfYN6GsKfrz36q+P//4CKFUuIpmjaP0Atoks5mZGdep9wOjk+3lPiThQvjLnHXk6bOKUcXVB73AX9+JJCs/G8ZWzsnP01kBK8AKDorwdqvTXuriN8U59xoIJuqvK/mdcZCOATlbjj4y6v7vpATFfqJBRZumk4VriEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OHPu6WhJT8reDgUx8Y+3eV9S1rs5i+kKUutBUQz0QtI=;
 b=BSuzbbDyNjtjkwbNW8yczPC9qPa4XOYzuJeomC8N8WHANtIgC8XmFk6dwVxA2p1fYOM3jMS7d/qERjDoFW4OYwZFwwj3ojP2VWxnqvizlJbkG85ykiWQI4jQluWUuFto4ccWeYjKwkaiH8Up5C6UQe+APU8/Ak2eUlt44loA/XWdVT2mF4yGLTgWphrlJvCH8ZlEc7iQIBOyzWWdsAusW4XY7vh+wD6QIa1YMpxCBfZAlwKly79LierddAPnu5OQp5N/suFkia4l/vtvL9xSVOhXG3d+C5Eam09uabiSj/0/nCzbWOlUvF3TOZZn2xbKscMiWkfKgoQIEiE9thDIGw==
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by GV1PR04MB10871.eurprd04.prod.outlook.com (2603:10a6:150:205::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.24; Tue, 19 Nov
 2024 08:18:35 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%6]) with mapi id 15.20.8158.017; Tue, 19 Nov 2024
 08:18:35 +0000
From: Ying Liu <victor.liu@nxp.com>
To: Marek Vasut <marex@denx.de>, "imx@lists.linux.dev" <imx@lists.linux.dev>, 
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-clk@vger.kernel.org"
 <linux-clk@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
CC: "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de"
 <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "festevam@gmail.com" <festevam@gmail.com>, "robh@kernel.org"
 <robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>, "catalin.marinas@arm.com"
 <catalin.marinas@arm.com>, "will@kernel.org" <will@kernel.org>,
 "abelvesa@kernel.org" <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
 "mturquette@baylibre.com" <mturquette@baylibre.com>, "sboyd@kernel.org"
 <sboyd@kernel.org>, "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>,
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>, "rfoss@kernel.org"
 <rfoss@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 "jonas@kwiboo.se" <jonas@kwiboo.se>, "jernej.skrabec@gmail.com"
 <jernej.skrabec@gmail.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "mripard@kernel.org"
 <mripard@kernel.org>, "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "airlied@gmail.com" <airlied@gmail.com>, "simona@ffwll.ch" <simona@ffwll.ch>, 
 "quic_bjorande@quicinc.com" <quic_bjorande@quicinc.com>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>,
 "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>, "arnd@arndb.de"
 <arnd@arndb.de>, "nfraprado@collabora.com" <nfraprado@collabora.com>, Luca
 Ceresoli <luca.ceresoli@bootlin.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>
Subject: RE: [PATCH v7 2/7] Revert "clk: imx: clk-imx8mp: Allow media_disp
 pixel clock reconfigure parent rate"
Thread-Topic: [PATCH v7 2/7] Revert "clk: imx: clk-imx8mp: Allow media_disp
 pixel clock reconfigure parent rate"
Thread-Index: AQHbNmKO+PHF1Z/Vm0OxVRcdedNQObK4R9AAgAQX1dCAAXQEAIAAYy+A
Date: Tue, 19 Nov 2024 08:18:35 +0000
Message-ID: <AM7PR04MB7046E282FD702ACE5E288F8998202@AM7PR04MB7046.eurprd04.prod.outlook.com>
References: <20241114065759.3341908-1-victor.liu@nxp.com>
 <20241114065759.3341908-3-victor.liu@nxp.com>
 <df6ebdde-65f8-4aad-93c7-b1df695bd2ef@denx.de>
 <AM7PR04MB7046546A882A8D48E135D84698272@AM7PR04MB7046.eurprd04.prod.outlook.com>
 <8a4fd234-4c7b-4a04-990d-3222aaa5172d@denx.de>
In-Reply-To: <8a4fd234-4c7b-4a04-990d-3222aaa5172d@denx.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM7PR04MB7046:EE_|GV1PR04MB10871:EE_
x-ms-office365-filtering-correlation-id: 6466ab48-68f6-4fe9-ac60-08dd0872c37c
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?MjI1d1YycmxRT0FOVG5NWHpGSnIvY2pGNmFGOStMaTUra2Vpbkl5NzhmQTZS?=
 =?utf-8?B?emE4RFMxbEpuTy9PRnpNditZUDhmTkhuM0tTTDFkeXpJMXIxenhzNk5qNUc0?=
 =?utf-8?B?NkJPQnVjUEp3WXlHTzdWaDN0RllnZno3VjBrb2EyVktSSmdPK1dOczJEakpY?=
 =?utf-8?B?WVJaeGU2OWlJQ1l4RzQ2S3JZOEJRN3BzOThFZWVHNDl2QVZQVVlLNU4rMkp6?=
 =?utf-8?B?bi93NElvMUg0bW9EMkY1SE5BekFUTURxYlJ5M3pMUkx2ZzNIRDlmMzdXZ05M?=
 =?utf-8?B?ajVOMkZIKzFSckQ0RXZlMkEyajdqdm5ETlRBdHk0Sm16WE5zWkJzRi9MOUJD?=
 =?utf-8?B?eG9qT1ZDaG1xTnRxRUREckhGWmZjc1h1ZjBWbktQY1RMNlRlbkhoNVR3NFR5?=
 =?utf-8?B?OEdCbmdXYVF1TFNuZGFhWDBKVjk3bGl1TDZJd1g4ZjBCYnAxeVUxMDZNeFg2?=
 =?utf-8?B?MVBrbEZ0YzJxYzcrUVhtQVdvcmQ2cFU2M3V1L1VnazZyc1Bxd0VvWm1BKzRi?=
 =?utf-8?B?bzFadEpYdzhyaTl4eTJlSVAySXRYOXpvU2p2ampRenp1NTQvSGNjMXBnNTFl?=
 =?utf-8?B?MG00UUZ4RnQrb2hGbEtEY2VaVFFVdG5PWlkwaVZOekJ3Z3I2dlpMajZxdmpw?=
 =?utf-8?B?YmxDMTljNFZtN2lLYkQ4NUJPdUhSMmdnTWJEcVM2Wmh2cDhSTWdLenEvc3du?=
 =?utf-8?B?M2lrNTFhbjJwVExYWjZtdkZJR1NBcTF5Zi84Tm96cU1DS2ErbGJKSlYzc1Zz?=
 =?utf-8?B?R3JqenhvcFM3cko1bjUxZmtSRTZ4VWN0UUlpaXlMcDhseGoycjBOV2kyRXpO?=
 =?utf-8?B?NjVGZ1llRHpoT1R0MDNvaEVXRzVDZlpuKzhWTTRPVUtYdFpPZ3hmbG1ham5X?=
 =?utf-8?B?cjc4VmZRQTl5SXE1a3BxazRCWmFmNmhnN2R3YVNpbHk0TnNRd01aamRFNDhO?=
 =?utf-8?B?dzU5eXg0TjFUMnZtcEQxeEhBamNpQU03cG1DQTFJNkF0Ylh0cmwyaXRGYlJo?=
 =?utf-8?B?QVNFRU95ODl5QmsyVldBL2t4eGpmUHUxMmJQRkFvM3RHeXdacjFYbEU0SDRt?=
 =?utf-8?B?OW84OUJCMUc2VEdGcUlSWjRoUzlwTEJ5SHRhOUdGZ2M1WThBbjdMVVZzdzNu?=
 =?utf-8?B?YjlvYk1iMm9WR2VTVzlRZHRiVGNwRVlwYzZXbXo3VEY1ZW9kOEhlRGFRTTVk?=
 =?utf-8?B?ZmJFM0tNVGl3d2tmcFVFN0ZHR21COE1hZDN3bEVqek1ySDdlY0FHb2xINHJn?=
 =?utf-8?B?Um5FTFJxdEFzQ2hFVVhUODdZak11QlJQblJENWVOWkJobzNVTmdUWTNxVENN?=
 =?utf-8?B?dktzRlFtdkkybW5FT1NCVGZTMlVMWWM1S2pHQTZvSVpQOTFwUVYwcjJoY3c5?=
 =?utf-8?B?dWdzTWlKaVBta3dlZmR1a1phOFRZS1c3b1BrbElvSmgxQ2hUdERkeWNubUVB?=
 =?utf-8?B?aGVOSWRCVWxJbEVQOUhVNW0vMU45Q1poeXh3Zkp1dFpGck1GaEJ0Um9yaTVC?=
 =?utf-8?B?VFdKTnk4NXhzSkJCZ0d6b1pTTW1GT3N6cHR0bkhzWEVkZUlQdWFDLzd4SHRK?=
 =?utf-8?B?bUZmZWoyNlNobVNISnltUzA2N3lWTFkrajNETjRoNEgrcVdrcjk5YktDbjN3?=
 =?utf-8?B?MDBrWHBVY1NyR2tqM09oUWlhR1hpSnFDVzI1a0ptYS9uQUY5U1dxaG8rUlVx?=
 =?utf-8?B?Rm9JTnp4QmZlaTVLSkdpTGxKNC9RaStwdXp5VFo4U2QxTFhYVXNvSzF6Rlgy?=
 =?utf-8?B?dFpDUG4wTzZnWXhvem5BTnhDZ1BVRGVtaVJoRlNYQ0hQVUl5TDMrazlsM3ll?=
 =?utf-8?Q?/TaiGzNchMaQLqgoCltHfykobL9skRiJuqA/A=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?emdrVTUzOVNsRmtRbW9tOWl4cW5DM01XeXZSWld2UG43N1NUZFQ3Wkh4ZjJr?=
 =?utf-8?B?ZlNNb3BhdWgxWk5uaXd5Y3YxdTY1Um52Zld2SG8yV2xlMjAxUHhoNVhXWU1N?=
 =?utf-8?B?STJ4dWRCTXFqSC9PNWx4YXYrdTB4RnZVWUZVOWRvOFZNWjNQcXUrQzhpc1Zl?=
 =?utf-8?B?ZEYvYitaNVZWQTRMaFRUYW9Cdk13SFZSZzZacStZSWQ4ZFcvM0g4UnFUSVVS?=
 =?utf-8?B?MVY2ZkxkV3dmaWp6VTl5YWt5ekNiUmQ2QndYTkFUT2huUGI2R3Q4OTliTGcy?=
 =?utf-8?B?RExnREw3ZVMwUmt4WDhxWlBEZEl3cWJzRDBxalJEOVQ1TzlrSVBOeHliREFQ?=
 =?utf-8?B?VWVkRkdNSGd4ckloMk1vSU1uQ0RsSmJ6cWJ1VGUzK1F4M1FLKzdKTG1nL0Rx?=
 =?utf-8?B?N2hIZG1PaDVldlB1dVdqRS81d3F2WTJkNHFWL1J1UCtadURLY1lVVzJyMXJx?=
 =?utf-8?B?bXAralFNUWcxdldhL1ZSeWxjWmZOeWV6VU53Y05veEh6cjVhUEtYYjJ2Tytx?=
 =?utf-8?B?a2xpTngrV3RScll2SUFaLzlaUUF1VldxM2NaSERFaUZPOUFpRHVoY1Z6VW5l?=
 =?utf-8?B?Nis4VmZ4Q1lPUmM1VFBtN28vZFBuL0k3ZUV3NlhhNDRIV09iS0xLaFg5M05z?=
 =?utf-8?B?NGVVbjAvSFF2OVIxWW9iUVFGN1VDbTcxNS80cnRiMUl3bnFSVWRQNW9JdWxD?=
 =?utf-8?B?eHE5azBIVkNPNXlYZ3VvdGNNK2U4amMvY0tKc2RFbk1IVlozZmNzSkFqMmNw?=
 =?utf-8?B?OEkzR3lXYmw5anhTNVRrZWc1azR0b2pCNkduZFlleitHTkl4NSs2MEJBemtO?=
 =?utf-8?B?KzIrczVQVUhkbUJJenFNZGxIZWUzZzRxMFdtYkt4eldsL3pPMkI2VjAvMzBp?=
 =?utf-8?B?NlcvUGZWLzU4aUlCVEtkdnhlSDY1ZEplNmtPZzY2Vk1JSlRIL0NrSlpQU0lq?=
 =?utf-8?B?NE5WK0NCUWVCdFVWanNtNzUyb0xOQW9JVjlya3Z3RE1qYnkvdDlWU3llK1BU?=
 =?utf-8?B?RjdmL2xPWVJReFZJYjdMbjhGbEMzbmNwNFBUS2lUVEsrZWFoNFNKbFNmSk52?=
 =?utf-8?B?WjdMR3RXdzB1cmpmc2hGNSt6RitkR2tLb0NQaDVOTXlpVUNtSUU2U2h1WUFi?=
 =?utf-8?B?WGV2WDVmZmhUMjZmNFgyYnZ5NlB1aVRLZCtsUzdxWlQ5WHo2bUJJZHUxaWZw?=
 =?utf-8?B?SkRTenpWQ1kvQnVaSDNwb1lGYVhjb1hwd3IzZEloODRLRXFLWlVUREJsanZP?=
 =?utf-8?B?NHJYNyt4a2lqYjVYdGxRNjZQMVZwVjA5M3FwODM0c1lJd0Fjck5aNUtMdVdx?=
 =?utf-8?B?WG1wRXVLLyttaDFBMUxsVXpwYXRZNG56cDZadld1bXdkS3YzcStCOXlIVXpJ?=
 =?utf-8?B?bmJQYWZqN1ZjdCtsdU5pd3ZjaFgrNE1TVDZzMzk1QzVSRFg3L0dhSStPaGJE?=
 =?utf-8?B?Y1cza2hGL1JtMWdWTk1Uc21LNmV3UnFJQkdad3JFWEx5Q2V3V0t3eEFTS2Uw?=
 =?utf-8?B?MW16dHVYMEpMZVpCcVBQNXU4Zk9ybUxUdzhKbXBaS2JRVWZrbnFkOFF2d0lV?=
 =?utf-8?B?Ly8xWjEweXNFdFVvUjlEZUlVN3M1SVJRSHNCMG9YNEtHN0hZRndWZHF3K2Zk?=
 =?utf-8?B?Z3RySGt3djQyZkhLSW5sOVBwL0pPVU8yTmxoR0wwWEpuZEdiYlFPRFpYL01Z?=
 =?utf-8?B?V2l2WkYrR2NFMnF6a2svZERNOXM1blpJaEFpWmpCenQraHIxVTdQc28zbTFw?=
 =?utf-8?B?V0RuQW5HVjY3dFk3UCtLQlZjM3dCOHdJMlhrZStDaE1Dd0lndEovR0R0dGhz?=
 =?utf-8?B?dzlEQ29DdGxBdE84RS9xWTNnanNWRjFDZ25JOTlHRENGcTNyNjdKeWlSYStt?=
 =?utf-8?B?YnNhZ2NSVnpYRC91S0tFb0tvRTNxQlAveW5sWE9GL29PeFRsY0RjRnhIam9K?=
 =?utf-8?B?MFIzVjFwVjhycVc5NEZWMWRRdnNKSWhaK0htK3FpeWtkZUFsWEFZUVl1UWNn?=
 =?utf-8?B?eW80a3RPeWpscHhlbGZsUlQxMG1talBsTXZUUWJEUmZ3RGVpRTY4YnB2ZTZF?=
 =?utf-8?B?TUFCelltTjdJUEoxeXlTQmMzOSt3TlUyd05FNURRU3hQbGUzQkpOQ050SFRO?=
 =?utf-8?Q?w8+Q=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6466ab48-68f6-4fe9-ac60-08dd0872c37c
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2024 08:18:35.5484 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4/bQ8AXrJKWK87QmRECT3Hov5ZSf79Og4ziDrEOSjhlkLG5BvjseqgQ015MJl+Ounz7u+svv2SEHIIyP2f0WoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10871
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

T24gMTEvMTkvMjQsIE1hcmVrIFZhc3V0IHdyb3RlOg0KPiBPbiAxMS8xOC8yNCA0OjU0IEFNLCBZ
aW5nIExpdSB3cm90ZToNCj4gPiBIaSBNYXJlaywNCj4gDQo+IEhpLA0KPiANCj4gPj4+IG1lZGlh
X2Rpc3AxX3BpeCBjbG9jayBpcyB0aGUgcGl4ZWwgY2xvY2sgb2YgdGhlIGZpcnN0IGkuTVg4TVAg
TENESUZ2Mw0KPiA+Pj4gZGlzcGxheSBjb250cm9sbGVyLCB3aGlsZSBtZWRpYV9kaXNwMl9waXgg
Y2xvY2sgaXMgdGhlIHBpeGVsIGNsb2NrIG9mDQo+ID4+PiB0aGUgc2Vjb25kIGkuTVg4TVAgTENE
SUZ2MyBkaXNwbGF5IGNvbnRyb2xsZXIuICBUaGUgdHdvIGRpc3BsYXkNCj4gPj4+IGNvbnRyb2xs
ZXJzIGNvbm5lY3Qgd2l0aCBTYW1zdW5nIE1JUEkgRFNJIGNvbnRyb2xsZXIgYW5kIExWRFMgRGlz
cGxheQ0KPiA+Pj4gQnJpZGdlKExEQikgcmVzcGVjdGl2ZWx5LiAgU2luY2UgdGhlIHR3byBkaXNw
bGF5IGNvbnRyb2xsZXJzIGFyZSBkcml2ZW4NCj4gPj4+IGJ5IHNlcGFyYXRlIERSTSBkcml2ZXIg
aW5zdGFuY2VzIGFuZCB0aGUgdHdvIHBpeGVsIGNsb2NrcyBtYXkgYmUNCj4gZGVyaXZlZA0KPiA+
Pj4gZnJvbSB0aGUgc2FtZSB2aWRlb19wbGwxX291dCBjbG9jayhzeXNfcGxsM19vdXQgY2xvY2sg
Y291bGQgYmUgYWxyZWFkeQ0KPiA+Pj4gdXNlZCB0byBkZXJpdmUgYXVkaW9fYXhpIGNsb2NrKSwg
dGhlcmUgaXMgbm8gd2F5IHRvIG5lZ290aWF0ZSBhDQo+IGR5bmFtaWNhbGx5DQo+ID4+PiBjaGFu
Z2VhYmxlIHZpZGVvX3BsbDFfb3V0IGNsb2NrIHJhdGUgdG8gc2F0aXNmeSBib3RoIG9mIHRoZSB0
d28gZGlzcGxheQ0KPiA+Pj4gY29udHJvbGxlcnMuICBJbiB0aGlzIGNhc2UsIHRoZSBvbmx5IHNv
bHV0aW9uIHRvIGRyaXZlIHRoZW0gd2l0aCB0aGUNCj4gPj4+IHNpbmdsZSB2aWRlb19wbGwxX291
dCBjbG9jayBpcyB0byBhc3NpZ24gYSBzZW5zaWJsZS91bmNoYW5nZWFibGUgY2xvY2sNCj4gPj4+
IHJhdGUgZm9yIHZpZGVvX3BsbDFfb3V0IGNsb2NrLiAgVGh1cywgdGhlcmUgaXMgbm8gbmVlZCB0
byBzZXQgdGhlDQo+ID4+PiBDTEtfU0VUX1JBVEVfUEFSRU5UIGZsYWcgZm9yIG1lZGlhX2Rpc3B7
MSwyfV9waXggY2xvY2tzLCBkcm9wIGl0IHRoZW4uDQo+ID4+Pg0KPiA+Pj4gRml4ZXM6IGZmMDZl
YTA0ZTRjZiAoImNsazogaW14OiBjbGstaW14OG1wOiBBbGxvdyBtZWRpYV9kaXNwIHBpeGVsIGNs
b2NrDQo+ID4+IHJlY29uZmlndXJlIHBhcmVudCByYXRlIikNCj4gPj4+IFNpZ25lZC1vZmYtYnk6
IExpdSBZaW5nIDx2aWN0b3IubGl1QG54cC5jb20+DQo+ID4+IFVoLCBJIGFsbW9zdCBtaXNzZWQg
dGhpcyByZXZlcnQgYmV0d2VlbiBhbGwgdGhlIExEQiBwYXRjaGVzLg0KPiA+Pg0KPiA+PiBUaGlz
IHJldmVydCB3aWxsIGJyZWFrIG15IHVzZWNhc2Ugb24gTVg4TVAgd2hlcmUgSSBuZWVkIHRvIG9w
ZXJhdGUgdHdvDQo+ID4+IGRpc3BhcmF0ZSBwYW5lbHMgYXR0YWNoZWQgdG8gTFZEUyBhbmQgVEMz
NTg3NjcgRFNJLXRvLURQIGJyaWRnZSBhbmQgSQ0KPiA+PiBuZWVkIGFjY3VyYXRlIHBpeGVsIGNs
b2NrIGZvciBib3RoLiBOb3QgYmVpbmcgYWJsZSB0byBjb25maWd1cmUgYWNjdXJhdGUNCj4gPj4g
cGl4ZWwgY2xvY2sgd2lsbCBtYWtlIHRoZSBkaXNwbGF5cyBub3Qgd29yaywgc28gZnJvbSBteSBz
aWRlLCB0aGlzIGlzIGENCj4gPj4gTkFLLCBzb3JyeS4NCj4gPg0KPiA+IElzIHlvdXIgdXNlY2Fz
ZSBpbiB1cHN0cmVhbSBrZXJuZWw/IElmIHllcywgd2hpY2ggRFQgZmlsZSBpbXBsZW1lbnRzIHRo
ZQ0KPiA+IHVzZWNhc2U/ICBJIGd1ZXNzIGl0J3MgaW04bXAtZGhjb20tc29tLmR0c2kgYXV0aG9y
ZWQgYnkgeW91LCBidXQgaXQgb25seQ0KPiA+IGNvbnRhaW5zIHRoZSBEVCBub2RlIGZvciBUQzM1
ODc2NywgYnV0IG5vdCBMVkRTIHBhbmVsLg0KPiA+DQo+ID4gQ2FuIHlvdSBwbGVhc2UgZWxhYm9y
YXRlIGFib3V0IHRoZSBmYWlsdXJlIGNhc2U/DQo+IA0KPiBUaGUgVEM5NTk1IGNhbiBkcml2ZSBh
biBEUCBvdXRwdXQsIGZvciB0aGF0IHRoZSBjbG9jayB3aGljaCBoYXZlIHRvIGJlDQo+IHNldCBv
biB0aGUgTENESUYgY2Fubm90IGJlIHByZWRpY3RlZCwgYXMgdGhhdCBpbmZvcm1hdGlvbiBjb21l
cyBmcm9tIHRoZQ0KPiBtb25pdG9yIEVESUQvRFBDRC4gVGhhdCBpcyB3aHkgdGhlIExDRElGIGhh
cyB0byBiZSBhYmxlIHRvIGNvbmZpZ3VyZSB0aGUNCj4gVmlkZW8gUExMMSBjbG9jayB0byBhY2N1
cmF0ZSBjbG9jayBmcmVxdWVuY3kuDQo+IA0KPiBGb3IgdGhlIExWRFMgTERCLCB0aGUgdXNlIGNh
c2UgaXMgdGhlIG90aGVyIHdheSBhcm91bmQgLS0gdGhlIHBpeGVsDQo+IGNsb2NrIHdoaWNoIHNo
b3VsZCBiZSBnZW5lcmF0ZWQgYnkgTENESUYgYW5kIGZlZCB0byBMREIgYXJlIGtub3duIGZyb20N
Cj4gdGhlIHBhbmVsIHR5cGUgbGlzdGVkIGluIERULCBidXQgdGhleSBzaG91bGQgc3RpbGwgYmUg
YWNjdXJhdGUuDQoNClRoYW5rcyBmb3IgdGhlIGluZm9ybWF0aW9uLiAgSSB0aGluayB0aGUga2V5
IHF1ZXN0aW9uIGlzIHdoZXRoZXIgdGhlDQphbHRlcm5hdGl2ZSBzb2x1dGlvbigqKSB5b3UgbWVu
dGlvbmVkIGJlbG93IHN0YW5kcyBvciBub3QsIGluIG90aGVyIHdvcmRzLA0Kd2hldGhlciBMQ0RJ
RjEvTENESUYyL0xEQiBkcml2ZXJzIGtub3cgdGhhdCB0aGV5IGFyZSBzaGFyaW5nIGEgUExMDQpv
ciBub3QuDQoNCj4gDQo+ID4gWW91IHN0aWxsIG1heSBhc3NpZ24gYW4gYWNjdXJhdGUgUExMIHJh
dGUgaW4gRFQuDQo+ID4gVGhpcyBwYXRjaCBvbmx5IG1ha2VzIHRoZSBQTEwgcmF0ZSBiZSB1bmNo
YW5nZWFibGUgZHluYW1pY2FsbHkgaW4NCj4gPiBydW50aW1lLiAgVGhhdCBtZWFucyB0aGUgZXhp
c3RpbmcgaW14OG0tZGhjb20tc29tLmR0c2kgd291bGQgdXNlDQo+ID4gSU1YOE1QX1ZJREVPX1BM
TDFfT1VUKHJ1bm5pbmcgYXQgMS4wMzk1R0h6KSBhcyB0aGUgcGFyZW50IGNsb2NrDQo+ID4gb2Yg
SU1YOE1QX0NMS19NRURJQV9ESVNQMV9QSVggKGZvciBMQ0RJRjEvRFNJKSwgc2luY2UgaXQgaW5j
bHVkZXMNCj4gPiBpbXg4bXAuZHN0aS4gIEkgYXNzdW1lIGl0IHNob3VsZCBiZSBhYmxlIHRvIHN1
cHBvcnQgdHlwaWNhbCB2aWRlbyBtb2Rlcw0KPiA+IGxpa2UgMTA4MHA2MCB2aWRlbyBtb2RlIHdp
dGggMTQ4LjVNSHogcGl4ZWwgY2xvY2sgYXQgbGVhc3Qgd2l0aCAxLjAzOTVHSHoNCj4gPiBQTEwg
cmF0ZS4NCj4gDQo+IFRoaXMgd2lsbCBicmVhayBtdWx0aXBsZSBEUCBtb25pdG9ycyBJIHRlc3Rl
ZCBzbyBmYXIgSSdtIGFmcmFpZC4gQW5kIEkNCj4gc3BlbnQgYSBMT1Qgb2YgdGltZSB3cmVzdGxp
bmcgd2l0aCB0aGUgVEM5NTk1IGJyaWRnZSB0byBtYWtlIHN1cmUgaXQNCj4gYWN0dWFsbHkgZG9l
cyB3b3JrIHdlbGwuDQoNCklmIHRoZSBEUCBtb25pdG9ycyBzdXBwb3J0IHR5cGljYWwgdmlkZW8g
bW9kZXMgbGlrZSAxMDgwcDYwIHdpdGgNCjE0OC41TUh6IHBpeGVsIGNsb2NrIHJhdGUsIEkgYXNz
dW1lIHRoZXNlIHR5cGljYWwgdmlkZW8gbW9kZXMgd29yaw0Kc3RpbGwgb2sgd2l0aCB0aGlzIHBh
dGNoIGF0IGxlYXN0LiAgUGxlYXNlIGhlbHAgY29uZmlybSB0aGlzLCBzaW5jZSBpZiB0aGUNCmFs
dGVybmF0aXZlIHNvbHV0aW9uKCopIGRvZXNuJ3Qgc3RhbmQsIHdlIHdvdWxkIGtub3cgdGhvc2Ug
dmlkZW8NCm1vZGVzIHN0aWxsIHdvcmsgb2sgd2l0aCBteSBzb2x1dGlvbihmaXhlZCBQTEwgcmF0
ZSkuDQoNCj4gDQo+ID4gR3JhbnRlZCB0aGF0IGxlc3MgdmlkZW8gbW9kZXMgcmVhZCBmcm9tIERQ
IG1vbml0b3Igd291bGQNCj4gPiBiZSBzdXBwb3J0ZWQgd2l0aG91dCBkeW5hbWljYWxseSBjaGFu
Z2VhYmxlIFBMTCByYXRlcywgdGhpcyBpcyBzb21ldGhpbmcNCj4gPiB3ZSBoYXZlIHRvIGFjY2Vw
dCBiZWNhdXNlIHNvbWUgaS5NWDhNUCBwbGF0Zm9ybXMobGlrZSBpLk1YOE1QIEVWSykNCj4gPiBo
YXZlIHRvIHNoYXJlIElNWDhNUF9WSURFT19QTEwxX09VVCBiZXR3ZWVuIExWRFMgYW5kIE1JUEkg
RFNJDQo+ID4gZGlzcGxheSBwaXBlbGluZXMuDQo+IA0KPiBXaGF0IEkgbmVlZCBpcyB0aGUgdXNl
IG9mIHR3byBmdWxsIFBMTDE0NDN4IChsaWtlIFZpZGVvIFBMTCBhbmQgQXVkaW8NCj4gUExMMS8y
KSAsIG9uZSBmb3IgZWFjaCBkaXNwbGF5IG91dHB1dCwgYW5kIHRob3NlIFBMTHMgaGF2ZSB0byBi
ZSBmdWxseQ0KPiBjb25maWd1cmFibGUgdG8gcHJvZHVjZSBhY2N1cmF0ZSBwaXhlbCBjbG9jayBm
b3IgZWFjaCBjb25uZWN0ZWQgcGFuZWwuDQo+IE90aGVyd2lzZSBJIGNhbm5vdCBtYWtlIHByb3Bl
ciB1c2Ugb2YgdGhlIHZpZGVvIG91dHB1dCBjYXBhYmlsaXRpZXMgb2YNCj4gdGhlIE1YOE1QIFNv
Qy4NCg0KWWVhaCwgSSB1bmRlcnN0YW5kIHlvdXIgcmVxdWlyZW1lbnRzLiAgSG93ZXZlciwgaXQg
c3RpbGwgZGVwZW5kcyBvbg0Kd2hldGhlciB0aGUgYWx0ZXJuYXRpdmUgc29sdXRpb24oKikgc3Rh
bmRzIG9yIG5vdC4NCg0KPiANCj4gPiBUaGUgbWlzc2luZyBwYXJ0IGlzIHRoYXQgd2UgbmVlZCB0
byBkbyBtb2RlIHZhbGlkYXRpb24NCj4gPiBmb3IgdGhlIE1JUEkgRFNJIGRpc3BsYXkgcGlwZWxp
bmUgZWl0aGVyIGluIHNhbXN1bmctZHNpbS5jIG9yIGxjZGlmX2ttcy5jDQo+ID4gdG8gZmlsdGVy
IHVuc3VwcG9ydGVkIHZpZGVvIG1vZGUgb3V0LiAgSXMgdGhpcyBtaXNzaW5nIG1vZGUgdmFsaWRh
dGlvbg0KPiA+IHRoZSBjYXVzZSBvZiB5b3VyIGZhaWx1cmUgY2FzZT8NCj4gDQo+IEkgZG8gd2Fu
dCB0byBzdXBwb3J0IHRoZSB2YXJpb3VzIG1vZGVzLCBJIGRvIG5vdCB3YW50IHRvIGZpbHRlciB0
aGVtDQo+IG91dC4gVGhleSBjYW4gYmUgc3VwcG9ydGVkLCB0aGUgb25seSAicHJvYmxlbSIgaXMg
dGhlIHNoYXJlZCBWaWRlbyBQTEwNCj4gd2hpY2ggaXMgbm90IHJlYWxseSBhbiBhY3R1YWwgcHJv
YmxlbSBpbiBteSBjYXNlLCBiZWNhdXNlIEkgZG8gbm90IHVzZQ0KPiBzaGFyZWQgVmlkZW8gUExM
LCBJIHVzZSB0d28gc2VwYXJhdGUgUExMcy4NCj4gDQo+IEkgdGhpbmsgd2hhdCBpcyBuZWVkZWQg
aXMgZm9yIHRoZSBMQ0RJRjEvTENESUYyL0xEQiB0byBmaWd1cmUgb3V0DQo+IHdoZXRoZXIgdGhl
eSBzaGFyZSB0aGUgVmlkZW8gUExMIGF0IGFsbCAoeW91IGFscmVhZHkgc3VnZ2VzdGVkIHRoZSBj
bG9jaw0KPiBzdWJzeXN0ZW0gY2FuIHByb3ZpZGUgdGhhdCBpbmZvcm1hdGlvbiksIGFuZCB0aGVu
IGlmOg0KDQpCdXQsIGhvdyB0byBsZXQgTENESUYxL0xDRElGMi9MREIgZHJpdmVycyB0byBmaWd1
cmUgb3V0IHRoYXQ/DQoNCkkgZGlkbid0IHN1Z2dlc3QgdGhhdCB0aGUgY2xvY2sgc3Vic3lzdGVt
IGNhbiBwcm92aWRlIHRoYXQgaW5mb3JtYXRpb24uDQoNCj4gLSB5ZXMsIGFncmVlIG9uIHNvbWUg
c29ydCBvZiBtaWRkbGUtZ3JvdW5kIGZyZXF1ZW5jeSB0byBjb25maWd1cmUgaW50bw0KPiAgICB0
aGUgVmlkZW8gUExMLCBmcmVxdWVuY3kgd2hpY2ggc29tZWhvdyBmaXRzIGFsbCB0aHJlZSBjb25z
dW1lcnMNCj4gICAgKExDRElGMSxMQ0RJRjIsTERCKQ0KPiAtIG5vLCBjb25maWd1cmUgZWFjaCBj
b25zdW1lciB1cHN0cmVhbSBjbG9jayB0byBnZW5lcmF0ZSBhY2N1cmF0ZSBwaXhlbA0KPiAgICBj
bG9jayBmb3IgdGhhdCBjb25zdW1lcg0KPiANCj4gU29tZXRoaW5nIGxpa2UgXiB3b3VsZCBtYWtl
IE1YOE1QIEVWSyAodGhlICJ5ZXMiIGNhc2UpIHdpdGggc2hhcmVkIFZpZGVvDQo+IFBMTCB3b3Jr
LCB3aXRob3V0IGJyZWFraW5nIG15IHVzZSBjYXNlICh0aGUgIm5vIiBjYXNlKSwgcmlnaHQgPyAo
KikNCg0KSW4gYW4gaWRlYWwgd29ybGQsIHJpZ2h0LiAgQnV0LCBhZ2FpbiBob3cgdG8gbGV0IExD
RElGMS9MQ0RJRjIvTERCIGRyaXZlcnMNCnRvIGZpZ3VyZSBvdXQgdGhhdCB0aGV5IGFyZSBzaGFy
aW5nIGEgUExMPyAgDQoNCj4gDQo+ID4+IFRoZXJlIGhhcyB0byBiZSBzb21lIGJldHRlciBzb2x1
dGlvbiB3aGljaCBzdGlsbCBhbGxvd3MgdGhlIFBMTA0KPiA+PiByZWNvbmZpZ3VyYXRpb24gdG8g
YWNoaWV2ZSBhY2N1cmF0ZSBwaXhlbCBjbG9jay4NCj4gPg0KPiA+IEFzIEkgbWVudGlvbmVkIGlu
IGNvdmVyIGxldHRlciwgdGhlIG9ubHkgc29sdXRpb24gdG8gc3VwcG9ydCBMVkRTIGFuZA0KPiA+
IE1JUEkgRFNJIGRpc3BsYXlzIG9uIGFsbCBpLk1YOE1QIHBsYXRmb3JtcyBpcyB0byBhc3NpZ24g
YSBzZW5zaWJsZSBhbmQNCj4gPiB1bmNoYW5nZWFibGUgUExMIHJhdGUgaW4gRFQuDQo+IA0KPiBJ
IGFtIGN1cnJlbnRseSB1c2luZyBWaWRlbyBQTEwgYW5kIEF1ZGlvIFBMTCB0byBkcml2ZSBEU0kg
YW5kIExWRFMNCj4gb3V0cHV0cyBmcm9tIGVhY2gsIHNvIG5vLCBmaXhlZCBWaWRlbyBQTEwgYXNz
aWdubWVudCBpbiBEVCBpcyBub3QgdGhlDQo+IG9ubHkgc29sdXRpb24uDQo+IA0KPiA+IFNvbWUg
cGxhdGZvcm1zIG1heSB1c2UgdHdvIHNlcGFyYXRlDQo+ID4gUExMcyBmb3IgdGhlIExWRFMgYW5k
IE1JUEkgRFNJIGRpc3BsYXkgcGlwZWxpbmVzLCB3aGlsZSBzb21lIG90aGVycw0KPiA+IGhhdmUg
dG8gdXNlIG9ubHkgdGhlIHNpbmdsZSBJTVg4TVBfVklERU9fUExMMV9PVVQgYmVjYXVzZQ0KPiA+
IGFsbCBvdGhlciBlbGlnaWJsZSBQTExzIGFyZSB1c2VkIHVwLiAgVGhhdCdzIGFsbCBmaW5lLCBq
dXN0IGJlaW5nIHBsYXRmb3Jtcw0KPiA+IGRlcGVuZGVudC4gIFRoZSBvbmx5IGxpbWl0YXRpb24g
b2YgdGhlIHNvbHV0aW9uIGlzIHRoYXQgc29tZSBwbGF0Zm9ybXMNCj4gPiBjb3VsZG4ndCBzdXBw
b3J0IHNvbWUgcGFydGljdWxhciBMVkRTIGFuZCBNSVBJIERTSSBkaXNwbGF5cyBhdCB0aGUNCj4g
PiBzYW1lIHRpbWUgZHVlIHRvIGxhY2sgb2YgUExMcywgYnV0IHRoaXMgaGFzIHRvIGJlIGFjY2Vw
dGVkIHNpbmNlDQo+ID4gdGhlIHNoYXJlZCBJTVg4TVBfVklERU9fUExMMV9PVVQgY2FzZSBuZWVk
cyB0byBiZSBzdXBwb3J0ZWQgYW5kDQo+ID4gdGhlIHR3byBkaXNwbGF5IHBpcGVsaW5lcyBhcmUg
bm90IGF3YXJlIG9mIGVhY2ggb3RoZXIgZnJvbSBrZXJuZWwncw0KPiA+IHBvaW50IG9mIHZpZXcu
DQo+IA0KPiBDYW4gc29tZXRoaW5nIGxpa2UgKCopIGFib3ZlIGJlIGltcGxlbWVudGVkIGluc3Rl
YWQsIHNvIGJvdGggU2hhcmVkIGFuZA0KPiBzZXBhcmF0ZSBQTExzIHdvdWxkIGJlIHN1cHBvcnRl
ZCA/IFRoYXQgc2hvdWxkIHNvbHZlIGJvdGggb2Ygb3VyIHVzZQ0KPiBjYXNlcywgcmlnaHQgPw0K
DQpJIGRvbid0IHNlZSBhbnkgY2xlYXIgd2F5IHRvIGltcGxlbWVudCBzb21ldGhpbmcgbGlrZSgq
KS4NCg0KVGFrZSB0aGUgMyBpLk1YOE1QIExDRElGcyBhcyBvbmUgZ3JhcGhpYyBjYXJkIGRyaXZl
biBieSBvbmUgaW14LWxjZGlmDQpEUk0gaW5zdGFuY2U/ICBXb3VsZCBpdCBiZSB0b28gaW50cnVz
aXZlPw0KDQpVc2UgY2xrX2dldF9wYXJlbnQoKSB0byBkZXRlcm1pbmUgaWYgdGhlIHBpeGVsIGNs
b2NrcyBvZiBMQ0RJRjEmMiBhcmUNCnNoYXJpbmcgUExMKG5vdGUgY2xrX2dldF9wYXJlbnQoKSBp
bXBsZW1lbnRhdGlvbiBjb250YWlucyBhIFRPRE86DQpDcmVhdGUgYSBwZXItdXNlciBjbGsuKT8g
DQoNCkhvdyB0byBkbyBtb2RlIHZhbGlkYXRpb24gZm9yIHRoZSBzaGFyZWQgUExMIGNhc2Uobm90
ZSBtb2RlX3ZhbGlkKCkNCmNhbGxiYWNrIGlzIHN1cHBvc2VkIHRvIGxvb2sgYXQgbm90aGluZyBt
b3JlIHRoYW4gcGFzc2VkLWluIG1vZGUpPw0KVXNlIGNsa19zZXRfcmF0ZV9yYW5nZSgpIHRvIGZp
eCB0aGUgUExMIHJhdGUobWluID09IG1heCk/DQoNCj4gDQo+ID4gSSBob3BlIHRoYXQgd2UgY2Fu
IGFncmVlIG9uIHRoaXMgc29sdXRpb24gZmlyc3QgYmVmb3JlIHNwcmVhZGluZw0KPiA+IGRpc2N1
c3Npb25zIGFjcm9zcyBkaWZmZXJlbnQgdGhyZWFkcyBhbmQgZXZlbnR1YWxseSB0aGUgTkFLIGNh
biBiZQ0KPiA+IHRha2VuIGJhY2suDQo+IA0KPiBJIGNhbm5vdCByZWFsbHkgYWdyZWUgb24gYSBz
b2x1dGlvbiB3aGljaCBicmVha3Mgb25lIG9mIG15IHVzZSBjYXNlcywNCj4gYnV0IG1heWJlIHRo
ZXJlIGlzIGFuIGFsdGVybmF0aXZlIGhvdyB0byBzdXBwb3J0IGJvdGggb3B0aW9ucywgc2VlICgq
KQ0KPiBhYm92ZSA/DQoNCkkgdGVuZCB0byBzYXkgdGhlcmUgaXMgbm8gYW55IGFsdGVybmF0aXZl
IHNvbHV0aW9uIHRvIHNhdGlzZnkgYm90aA0Kc2VwYXJhdGUgUExMcyBhbmQgc2hhcmVkIFBMTCB1
c2UgY2FzZXMsIG9yIGV2ZW4gaWYgdGhlcmUgaXMgb25lLCBpdCB3b24ndA0KYmUgZWFzeSB0byBp
bXBsZW1lbnQuICBJZiB5b3Uga25vdyBvbmUsIHBsZWFzZSBzaG91dCBpdCBvdXQuDQoNClJlZ2Fy
ZHMsDQpMaXUgWWluZw0K
