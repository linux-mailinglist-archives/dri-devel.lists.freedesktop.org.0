Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05ACBBEF136
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 04:15:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C43F10E238;
	Mon, 20 Oct 2025 02:15:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="al51NX+o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11011069.outbound.protection.outlook.com [52.101.70.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AFF010E238
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 02:15:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wfbSfh/b229C65c1+iQ1JzrMfh7V4Ra1vrGNU0dhyARtDLDAtuaO55MYC1B1HlDcKYhEULgwFjFLA7/QH/608O4FzA6sSIwAJSDajKA4BdGUOVa5jt0Z8VsrojBWtmrwvgJ6uP1Z5BmhPtvjQ5M4nWlvKyFAUAx8W5JTFlb9DfcI5n4BDDmfU2eF8dbn6rW77r435HmDO2KPsMzehxcZ/zUp/2CVd/VZOVv67m/9kb8bN0A39791/kZjG5lFJRUNzn/LfVQnkXqApAiSAg557iRzl0o/7QdgBhUZQOTO4F5hK10to55bDRtsgY8Bo7kdSclgqcqaM1GxPkDTDSX+fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LG805auo6D11ISLy0awJ7UUkErVM0SqaDOx8l4Yl6Zo=;
 b=Yo/rpX+kWOYVBq4ELhRb12BaEpUl0Ud51wlvh5O8S87xb+qV6STSFMIxH5hvhtl9yrrOa1RlyrFYTiq1HN6nh0298pj5OITxfY0uQJkzVZWdRQUQ617yz6TDcG89Dow22KE2nZEwOkP2Hqu3P7OSPKNlvP4LtVOcAGeKlnhbt1C6auboE1s3CMFzh7O4nIvjWD1zARodATFFF2AGVbtcG7T7CYup7DPlOcltccIjT4lYw/Z0SQoHTNrgzzlGSKlJrUSRS0CKwbkBxpajADjND9ayqed0e6XOWt50YwX9lGe8LbHmCa3+2gwyLa8UvmrFmcU28/zl/nOd6y5R3+CTXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LG805auo6D11ISLy0awJ7UUkErVM0SqaDOx8l4Yl6Zo=;
 b=al51NX+oRXnjsFmbEJ3LS1MkLvxJO5XJbo0rZECvHrxCesxiWy3RYYlHCu3h74/6rWb/QfBZRXbqSbGj7B4qqlfQNCKw3qjYsjloZmJNyJwC/mIIvaQ3EUV2FjbmGg84UDWrFcsRKVbLNWK5swQjQBjU8/r7OYuSF1x8s2znVIfTlPIyLTDfncQeGFz4ZKg6dFRdAf0Kkzuv4oEigGUHg+THpEl+wL8pMgGAiZfGhMTWVWZUxtMCdV1PqL6bnTXuKgWoFW/BreoO1/Noa6CmivJfJ8CRi9q1Z6DogJBC3yTRHjDNeaxoGo0ws8AVM5Erb3XONt4PFiK0IhXPgTMH+A==
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by GV1PR04MB10195.eurprd04.prod.outlook.com (2603:10a6:150:1a8::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Mon, 20 Oct
 2025 02:15:38 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%6]) with mapi id 15.20.9228.015; Mon, 20 Oct 2025
 02:15:38 +0000
From: Ying Liu <victor.liu@nxp.com>
To: Marek Vasut <marek.vasut@mailbox.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
CC: Abel Vesa <abelvesa@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Fabio
 Estevam <festevam@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Lucas Stach
 <l.stach@pengutronix.de>, Peng Fan <peng.fan@nxp.com>, Pengutronix Kernel
 Team <kernel@pengutronix.de>, Rob Herring <robh@kernel.org>, Shawn Guo
 <shawnguo@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-clk@vger.kernel.org"
 <linux-clk@vger.kernel.org>
Subject: RE: [PATCH 00/39] Add i.MX95 DPU/DSI/LVDS support
Thread-Topic: [PATCH 00/39] Add i.MX95 DPU/DSI/LVDS support
Thread-Index: AQHcOtDjID2BFXRDAUKEvoJffujwqbTBWeWAgADa2QCAAMq1gIAAaZWAgAQQyAA=
Date: Mon, 20 Oct 2025 02:15:38 +0000
Message-ID: <AM7PR04MB70466BF64A1CD8EB01D2DD9C98F5A@AM7PR04MB7046.eurprd04.prod.outlook.com>
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
 <174ec43e-4cac-4452-a77b-e2e3b8413d05@nxp.com>
 <2c4a42eb-8c49-4ba3-baa3-921ec52f730d@mailbox.org>
 <92d928cc-d9df-4c9c-8571-da39001b91a7@nxp.com>
 <e0507800-7e86-4fbb-95cb-e64d8cca1e49@mailbox.org>
In-Reply-To: <e0507800-7e86-4fbb-95cb-e64d8cca1e49@mailbox.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM7PR04MB7046:EE_|GV1PR04MB10195:EE_
x-ms-office365-filtering-correlation-id: 44a3b171-5e5a-457c-503d-08de0f7e8fb4
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|7416014|1800799024|19092799006|376014|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?MVpWaG9ITVV2bFkxSkNMNzhTcWNINDZjazJkbCtMUlpsTURKdkp4VWhPdlp2?=
 =?utf-8?B?ZXFRNkpxOFFJeENRbmNjUGdrVE8xWlgyK0RRRUdOZEcvaGFDbHVia0VlRmVj?=
 =?utf-8?B?WVN5NGprVjV6S1lTaG9mOTluYUxUdFk3cm9hL0VaVVRZYStpUWJ5MjBYa0lm?=
 =?utf-8?B?aDJDSjF2YUcyeGRQZXIwUHlHTXlpNEp5SkVHNHYxa041eVRHVU1jeVAwRVUz?=
 =?utf-8?B?UkFUU3lTU0RTcHpzTEZXR3hoZys2MEtIVmxYWHBLMDk5UHdNT0Z3cFhJbFcr?=
 =?utf-8?B?MEZOTVVPSlNRWmNIQkdub0NHbnZpdmFiTXdzYmhEZVltY0dNRWc0STlHdWVR?=
 =?utf-8?B?ZFdJKytCWG5TMlZremFXd2VQRjR6MFlHL3Nkd0kwS3ZtMW9qZStKbnUrMnc0?=
 =?utf-8?B?WGpwVkhISUxnZHJRVmd2SEhNTlVoRTVRYjVlT2hrVUs2Ky9BcGUzRVhLcXd3?=
 =?utf-8?B?VUk1SmRBb2N3RVVFWUd5SkZsOEVJZzZwdGpZemg4ZnpBOFZjWGpVVjgza3lq?=
 =?utf-8?B?K2VFVE4zYXllWm8rVGl5cVVFQ3dHNEd5S2RyblNHQmpOSjgrRjk3cTcyeXFt?=
 =?utf-8?B?Y05DMkJLWDFIaVUvYklNZnJIT3VyNndpNkt2Z05XVkNlb2J5M0NNZmlEWnV1?=
 =?utf-8?B?aC9sQ3YrNTJHYzd3T0F3MU1lVzBMTlV2M0VaS254SVlnQUZuU1QvK0ZuUGt3?=
 =?utf-8?B?S2JZdGpGTEF0eGJqYUNJc0hqY2ZCalpMVitoanVSVStkdnhTdlNPOXh0RG5w?=
 =?utf-8?B?RGVRb3BIeENzTzk5bE1yb3N1Y3NqbVJERlVJNUJLaWU1WVpQOGJhd2d2VHpH?=
 =?utf-8?B?aFdPTFBuTnZrL0xMMVFOTDFNQ2lGTWJnUUllWXpLeTRqMjFsaWpDS095WTFR?=
 =?utf-8?B?UW5iaEpMMkRnWE9obDAyc29SMklKdTRYMnVkbmZwNUhrbnNZUWVLZEt2TGVP?=
 =?utf-8?B?dDZCUWtvZ1loQkhQSi9uMnhvZVB3cE1BMXZ3TUF1VmNQcXRyV055cnVHbzJ6?=
 =?utf-8?B?MFJXNHZHWnpRTnVwTDRZQXQ4K0tjS0s1RXBka1NieDZQMjVwNElRbDVEWkls?=
 =?utf-8?B?a2x1RHkxaGtPb2w4NmNlbEl4amtreDlsNW9BLys0ckxka3pYODNtMnl2Q2JL?=
 =?utf-8?B?bEtXSUhTT3Fkbzc4alZCYzMvR0RhOVpscnNqQUViY1RBV3JCTVozWVdqUXBj?=
 =?utf-8?B?b0VoTzFMYVd3WWdGWjkyc3R1bVdNRWdIR3AwdzhYS0srdUFZSndHYVJ5OSta?=
 =?utf-8?B?Zy9DMEdhL0htRWJ6M2N6eUg2S1l2bWpMbjNzUVRzMDg2WndqbElBcStuQ2Mr?=
 =?utf-8?B?eXZUdEJ2eDR1TFZUTGlVYmROL3g5S0dsQng1Vm1rUVNVaWZoWVpucnlGVjdH?=
 =?utf-8?B?N0NMZHZibWNKb2VwMGRPcmlzVVdCN0Eva01udFVwUFdTc0VSS1U0V2Nld3M2?=
 =?utf-8?B?L2FNZllKVzBPVU0xTnVxOWtHNUQxM2t6V3drZ3RTRk1wMEJuMlh4Tk9VMjdr?=
 =?utf-8?B?VnVWejI5SXplSDVXVjZIcXMzSktUK1FJQURVYmc0aFQ3endLY0VFOU10cXY0?=
 =?utf-8?B?Q3l6bnRwY2hTZk42b3ljSWhhODhlUEt6QldRT0hjUGh4TlNzeTlaYlNFOUVM?=
 =?utf-8?B?VG5GMHh1L1FrNUFPSlRMUWtoclExNStYa0R6dTZPR0duMUg5K1lQOEpoaWg1?=
 =?utf-8?B?M0hxaUpFSnFJWFZZcFJ4MFFBZnNUVnhsSSt3Qmp6dG5FY2FUMEMya1BaaDF1?=
 =?utf-8?B?S0JHU0tvbWZFRlNlRDJoVmV3aTJoTkVpSDlac1AzVnhmREUwakh2ZHc4VVNt?=
 =?utf-8?B?QkwrN0NUVzNlZDQxMnJFMVdDSXhzclA1QnNJODFuWHZvUnpuZHJLMDVwOElm?=
 =?utf-8?B?N3NxL2J1UG40dlpGWWJEcFhkTTlpeXo1aitKNkpGMUZEczlNNExmQ2FuU3Ro?=
 =?utf-8?B?U0NWNnQxSmFySGZYQUg3RlNUUGk5OEw0YnZVWGNYQUhDcjgzbWhCS0xEOExC?=
 =?utf-8?B?NEFqM1NaUk9NbkNNam4rK3dHOEJtUmZ1TExxWllqWGZkYTBDVDhDcWljVXhk?=
 =?utf-8?Q?bdfGX8?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(1800799024)(19092799006)(376014)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d3p2ekM1M3FSUFBqVm1YRVlTazN5YWFtM25MZWE3LzV6QXZsNGpsRFRONDNX?=
 =?utf-8?B?a21oWE5UMFphY21XVXhianBSUmV6eVBYTWRZQWtuaHBqSVRScGRPU0pxWXR0?=
 =?utf-8?B?YThnV2RtdUpxUDFqdFozZW5ySUZBRndYZERIVGlhZmZTcy9mN242cy9RM0lp?=
 =?utf-8?B?dHpJK0o1Z2xoRktycWZZdVBiNDRvUlBDZkhJbVErbEg0ZTdlenpLczhWYllq?=
 =?utf-8?B?b3dld1pDMEs4UktnNkJvOEk2blRrWXRmczUwTWRySWYrQ3pXY3U2aHlZUWpE?=
 =?utf-8?B?NDE0OUQ4WkIxVHdmb3RiTlFkbnVsSGM0MDlYZGNna2FPbVZYaExmVklZWU8v?=
 =?utf-8?B?TStUczV0S1JrbG9sSmpZc0hGQVQrMnNvYm5KME9FcXVvWkNDTHViSkFZa2l5?=
 =?utf-8?B?MUZENG1TQUhrQWZ6NjlDSzcrcGxnRDVKOVIxNVJZUUxkZmh5UGwrRVY5ODNP?=
 =?utf-8?B?bXJ3QWVUYnVUNGFIZXlnOHZpUkdrNXJ1YWhUb203NzNOZHRaR2lLU0ZNcWJi?=
 =?utf-8?B?ZWZCTFAxSjJGYjhBUUxLc2k5dGpJQkc0MWJqQ2N0VmJaZzV0YXR6dTRoRzVO?=
 =?utf-8?B?Ung1a3IrZ1lySUV6ZDJpMDU1dFh4elVBaW9MN09oZHNEaHN2eWJjZXZrVzY4?=
 =?utf-8?B?cFdxaW1ISWt6SkltVUU5Y3hyTkM1MnloVTNiMnd6TVgrUUMvdjFKV3FaZ1JD?=
 =?utf-8?B?aHBkd1FiaHBPRXZGM0NGZmlMUmE2SGxSdHpZcmlzbkFSMjhSTHNGem04M09r?=
 =?utf-8?B?UnJxYnFpZkhFc1Z6R0JTdkM0UFAzbVpjaWVuMUlaRDlFamE5cnpVMHBZR3RY?=
 =?utf-8?B?dm5KQjR2YmY0TlBNMGJxZ1c1T2RxT1lTa2dLU1NhbVdSeWErR3NVOVJPWEpz?=
 =?utf-8?B?M2JuU21iZ1plcys3TE04WVpzYkFyR0Uvc28zRmdXdFh2SnIrOU53a1Rwd0lO?=
 =?utf-8?B?czdYbGhGWEZ5b3NIcVU5NHFxZWVZdlBpK1U1azBDRW5XYVNTMngvOExSMTd4?=
 =?utf-8?B?SGxid3RGNHFaR285ck5rcHZCQktjWnh5SkFpdEFtaHVBa1FhUjZ6b2hOSXdv?=
 =?utf-8?B?VlZXZUxObERlYVBoQUpISktxOGFFa1RIc0s2VnhNZWZkOC85S2JOWngvQ1V1?=
 =?utf-8?B?bGt3Z29Ib1Z1eWRidEF2T25TR09LTmlTTEt4Z21nd1BxKzlzTkpXWjhqcGpP?=
 =?utf-8?B?QitGNEhZRG1IdjNPVk5OSzliQ011Y05ZU2VOL0M1b1pWa2VncG1oSURYSmY4?=
 =?utf-8?B?SGk1NnRHeVp1OXo2dGJHTW1aWkZieHdFWTJEdGhPSjlRMTczT0E2bEZmdEcr?=
 =?utf-8?B?b2NMcUVtWjBYWms3QXRiUkowNkNxUWoxcDBjKzV1SGllNTYzdVE1MG9lVnU1?=
 =?utf-8?B?K2xSZU4vWWxEVHFaemhtMXU1SCtiK3g2elZHUXRmRDF4dTF0RCtoZjhsMkR3?=
 =?utf-8?B?aFBBQUNDR2pjcFVoeG5iTEtqNC9UZ0pBQ0RXVGFsSXBYMmdyTUh1bElIb3pS?=
 =?utf-8?B?OXZhR2tSQWcyODdTKzg1M3d4OHRDOHMwV2VTSXB6d2QyTFJFUm5BaUpUTE1G?=
 =?utf-8?B?SU5oQ1NtY3R1UXhKbDRJZ0UyT0NzczZ4L2FUak1YQkJnajVZQXhNZSt5TkxT?=
 =?utf-8?B?c3dKVXowWFFidHNTS3pSVUZ2UXF3dWU1Zzl3Y1FmREYxTnQzR0gyaEYzTmxr?=
 =?utf-8?B?MExMWkhLYU9SNzhrdWgwK2VQeHYvUG1vZjNYY1cyTVA3U3FOVDR3Qml1ZHlv?=
 =?utf-8?B?cURJUWJVZStCZjJRWXZJdTlINGpwdXNielNnNWJ6aUh1ZTRWMjY4WjZMa0N0?=
 =?utf-8?B?VCtTYVQrWTVMNWJnWkRyQzZnYmtFTE9qZ1JGN2Q0NEJQNHA3aGlZaGFyZEpF?=
 =?utf-8?B?NkxHYm8vU3lyOG15ZmhlZ0pWMjBsWjFocEJkZGVDTURZNHNZZzhrdWgrVUlD?=
 =?utf-8?B?REdCTGNWai80bDhyNE80MUc5K2tsN3g1NlA2aS9vOERnc0FnSEVUSG9wTTFl?=
 =?utf-8?B?d1R6cDRhRGNyampjV2JoNFpndlRFaGJvT3NHZFhRY293RXhxcnNNWUl3VnBk?=
 =?utf-8?B?VXdHcCtSQVVjaDgzNURYb3JkNUJ1b2p4aXNMUVFSR2lOR1A5N3ZMdDRMcmhK?=
 =?utf-8?Q?fyZw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44a3b171-5e5a-457c-503d-08de0f7e8fb4
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2025 02:15:38.4002 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cQwvZAgrY2zsI1CCKSHEn7Yk2vuWa+vwIBCZ0flGIHJ/W7yqt4D6pXRYVV5OF78MoJTWCKIIRyJz3iBVeM95fA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10195
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

DQoNCk9uIDEwLzE2LzI1LCBNYXJlayBWYXN1dCA8bWFyZWsudmFzdXRAbWFpbGJveC5vcmc+IHdy
b3RlOg0KPiBPbiAxMC8xNS8yNSAxMjowMCBQTSwgTGl1IFlpbmcgd3JvdGU6DQo+DQo+IEhpLA0K
DQpIaSwNCg0KPg0KPiA+PiBJIHdhbnRlZCB0byBwdXQgdGhpcyB3aG9sZSB0aGluZyBvbiB0aGUg
bGlzdCBmaXJzdCwgYmVmb3JlIEkgc3RhcnQgc3BsaXR0aW5nIGl0DQo+IHVwLg0KPiA+Pg0KPiA+
PiBGb3Igc3RhcnRlcnMsIEkgdGhpbmsgSSBjYW4gc2VuZCB0aGVzZSBzZXBhcmF0ZWx5Og0KPiA+
DQo+ID4gQmVmb3JlIGRpc2N1c3NpbmcgaG93IHRvIHNwbGl0LCBhIGJpZ2dlciBxdWVzdGlvbiBp
cyB0aGF0IGlzIGl0IGZpbmUgdG8NCj4gPiBzdXBwb3J0IGJvdGggaS5NWDhxeHAgREMgYW5kIGku
TVg5NSBEQyBpbiB0aGUgc2FtZSBpbXg4X2RjX2RybQ0KPiBtb2R1bGU/DQo+ID4gU2VwYXJhdGUg
bW9kdWxlcyBsb29rIG1vcmUgcmVhc29uYWJsZSB0byBtZSwgY29uc2lkZXJpbmcgdGhlIGZhY3Qg
dGhhdA0KPiA+IHRoZXJlIGFyZSBxdWl0ZSBhIGxvdCBkaWZmZXJlbmNlIGJldHdlZW4gdGhlIHR3
byBEQ3MuDQo+DQo+IChtYXliZSBJIGRvIG5vdCBxdWl0ZSB1bmRlcnN0YW5kIHlvdXIgc3VnZ2Vz
dGlvbiB3aXRoICJzZXBhcmF0ZSBtb2R1bGUiLA0KPiBJIGFzc3VtZSB0aGlzIG1lYW5zIGVudGly
ZWx5IGR1cGxpY2F0ZSBkcml2ZXIsIGlzIHRoYXQgY29ycmVjdD8gSQ0KPiBvcGVyYXRlIHdpdGgg
dGhhdCBhc3N1bXB0aW9uIGluIHRoZSB0ZXh0IGJlbG93LikNCg0KSSdkIGV4cGVjdCBzZXBhcmF0
ZSBtb2R1bGVzOiB0aGUgZXhpc3RpbmcgaW14OF9kY19kcm0od2hpY2ggY2FuIGJlDQptb2Rwcm9i
ZSdkKSBhbmQgc29tZXRoaW5nIGxpa2UgaW14OTVfZGNfZHJtLiAgSSB3b3VsZG4ndCBjYWxsIHRo
ZW0NCiplbnRpcmVseSogZHVwbGljYXRlZCBkcml2ZXJzIHNpbmNlIEkgbWVudGlvbmVkIGNvbW1v
biBwYXJ0IG9mIHRoZSBEQ3MNCmNvdWxkIGJlIHdyYXBwZWQgYXMgaGVscGVycyBpbiBhbiBhZGRp
dGlvbmFsIG1vZHVsZShzb21ldGhpbmcgbGlrZQ0KaW14X2RjX2RybV9jb21tb24pLg0KDQo+DQo+
IFRoaXMgc2VyaWVzIGluZGljYXRlcyB0aGF0IHRoZSBmdW5jdGlvbmFsIHVuaXRzIGluIHRoZSBE
QyBhcmUgYmFzaWNhbGx5DQo+IGlkZW50aWNhbCwgd2l0aCB0aGUgbWFqb3JpdHkgb2YgY2hhbmdl
cyBiZWluZyByZWdpc3RlciBiYXNlIGFkZHJlc3NlcyBvZg0KPiB0aGUgd2hvbGUgREMgYW5kIGFu
IG9kZCBiaXQgb3IgcmVnaXN0ZXIgb2Zmc2V0IGhlcmUgYW5kIHRoZXJlLiBNb3N0IG9mDQo+IHRo
ZSBjb2RlIGNhbiBiZSByZXVzZWQsIGFzIGNhbiBiZSBzZWVuIGluIHRoZSBmaXJzdCBoYWxmIG9m
IHRoZSBzZXJpZXMuDQoNClRoZSBtYWpvciBkaWZmZXJlbmNlcyBiZXR3ZWVuIHRoZSBpLk1YOTUg
YW5kIGkuTVg4cXhwIERDcyBhcmUNCmRpZmZlcmVudCBjb21wb25lbnRzIGluIERpc3BsYXkgRW5n
aW5lcyhlc3BlY2lhbGx5IHRoZSBhZGRpdGlvbmFsDQpEb21haW4gQmxlbmQgVW5pdCBpbiBpLk1Y
OTUgREMpIHBsdXMgaS5NWDhxeHAgREMncyBjYXBhYmlsaXR5DQp0byBjb25uZWN0IHdpdGggdGhl
IHByZWZldGNoIGVuZ2luZXMoRFBSQyAmIFBSRykuIEJvdGggd291bGQNCmhhdmUgc2lnbmlmaWNh
bnQgaW1wYWN0IG9uIGhvdyB3ZSBpbXBsZW1lbnQgdGhlIGRyaXZlcnMuICBXZSdsbA0KY2VydGFp
bmx5IGVuZCB1cCBoYXZpbmcgZGlmZmVyZW50IGltcGxlbWVudGF0aW9ucyBmb3IgY2FsbGJhY2tz
IHRvDQplbmFibGUvZGlzYWJsZSBDUlRDcyBvciB1cGRhdGUvZGlzYWJsZSBwbGFuZXMuDQoNClRo
ZSBzb3J0IG9mIG1pbm9yIGRpZmZlcmVuY2UgaXMgaW4gUGl4ZWwgRW5naW5lKGluY2x1ZGluZyBC
bGl0IEVuZ2luZSkNCndoZXJlIEZldGhVbml0IHR5cGVzIGFuZCBudW1iZXJzIGFyZSBkaWZmZXJl
bnQgcGx1cyBkaWZmZXJlbnQgbnVtYmVycw0Kb2YgU2NhbGVyIEVuZ2luZS4gIEknZCBleHBlY3Qg
bG9naWNzIHRvIGFsbG9jYXRlIEZldGNoVW5pdHMgZm9yIHBsYW5lcyBjYW4gYmUNCmltcGxlbWVu
dGVkIGluIHRoZSBpbXhfZGNfZHJtX2NvbW1vbiBtb2R1bGUNCg0KPg0KPiBUaGUgYWRkaXRpb24g
b2YgaU1YOTUgaW50byB0aGUgaU1YOFFYUCBEQyBhbHNvIGRvZXMgbm90IHNlZW0gdG8gYmUNCj4g
bWFraW5nIHRoZSBkcml2ZXIgaW4gYW55IHdheSBtb3JlIGNvbXBsaWNhdGVkLg0KDQpEaXNhZ3Jl
ZS4gVGhlIGFkZGl0aW9uIHdvdWxkIGludHJvZHVjZSBxdWl0ZSBhIGZldyBpLk1YOTUgb3IgaS5N
WDhxeHANCkRDIHNwZWNpZmljIGNvZGUgYnJhbmNoZXMgZHVlIHRvIHRoZSBkaWZmZXJlbmNlcyBt
ZW50aW9uZWQgYWJvdmUuDQoNCkknZCBzYXkgaS5NWDk1IERDIHN1cHBvcnQgY291bGQgYmUgaW4g
ZHJpdmVycy9ncHUvZHJtL2lteC9kYywgYnV0IGl0DQpuZWVkcyB0byBiZSBpbiBhIHNlcGFyYXRl
IG1vZHVsZSBsaWtlIGFnYWluIGlteDk1X2RjX2RybS4NCg0KVGhpcyBtYWtlcyBmZWVsIHRoYXQg
dGhlIGRlYmF0ZSBoZXJlIGJlY29tZXMga2luZCBvZiBzaW1pbGFyIHRvIHdoYXQNCndlIGRpZCBm
b3Igc2luZ2xlIG14c2ZiIG1vZHVsZSB2cyAgbXhzZmIgKyBpbXhfbGNkaWYgc2VwYXJhdGUgbW9k
dWxlcy4uLg0KDQo+DQo+IFdoYXQgd291bGQgYmUgdGhlIGJlbmVmaXQgb2YgaGF2aW5nIGR1cGxp
Y2F0ZSBkcml2ZXIgZm9yIElQIHRoYXQgaXMNCj4gYmFzaWNhbGx5IGlkZW50aWNhbCwgZm9yIGku
TVg5NSA/DQoNCkNsZWFuZXIgZHJpdmVyIGltcGxlbWVudGF0aW9uIGFuZCBlYXNpZXIgdG8gbWFp
bnRhaW4uICBJIGRvbuKAmXQgd2FudA0KdG8gdGVzdCBib3RoIGkuTVg5NSBhbmQgaS5NWDhxeHAg
cGxhdGZvcm1zIHdoZW4gb25seSBlaXRoZXINCmkuTVg5NSBEQyBzcGVjaWZpYyBvciBpLk1YOHF4
cCBEQyBzcGVjaWZpYyBjb2RlIGlzIGNoYW5nZWQuDQoNCkJ1dCBhZ2FpbiwgdGhleSB3b24ndCBi
ZSBlbnRpcmVseSBkdXBsaWNhdGVkIGRyaXZlcnMuICBDb21tb24NCnBhcnQgY291bGQgYmUgc2hh
cmVkIGJldHdlZW4gdGhlIGRyaXZlcnMgd2l0aCBzb2Z0d2FyZSB0ZWNobmlxdWVzLA0KbGlrZSB0
aGUgaW14X2RjX2RybV9jb21tb24gbW9kdWxlIG1lbnRpb25lZCBhYm92ZS4NCg0KPg0KPiBbLi4u
XQ0KPg0KPiA+PiAtIGRybS9pbXg6IGRjOiBSZW5hbWUgaS5NWDhRWFAgc3BlY2lmaWMgTGluayBJ
RHMNCj4gPg0KPiA+IFRCSCwgSSdtIG5vdCBhIGJpZyBmYW4gb2YgYWRkaW5nIExJTktfSURfeF9N
WHkgdG8gZW51bSBkY19saW5rX2lkLCBzaW5jZQ0KPiA+IHRoZSBtZW1iZXJzIG1heSBoYXZlIHRo
ZSBzYW1lIHZhbHVlIGFuZCBpdCdzIGtpbmQgb2YgYSBtZXNzIGNvbnNpZGVyaW5nDQo+ID4gZnV0
dXJlIFNvQ3MuDQo+DQo+IEkgYW0gb3BlbiB0byBhIGJldHRlciBzdWdnZXN0aW9uIHdoaWNoIGRv
ZXMgbm90IGludm9sdmUgZHVwbGljYXRlIGRyaXZlci4NCj4NCj4gPj4gLSBkcm0vaW14OiBBZGQg
bW9yZSBSR0Igc3dpenpsaW5nIG9wdGlvbnMNCj4gPg0KPiA+IFRoaXMgb25lIHNlZW1zIG9rLg0K
Pg0KPiBJIGNhbiBzZW5kIHRoYXQgb25lIHNlcGFyYXRlbHkuIENhbiB5b3UgdGVzdCB0aGF0IG9u
IE1YOFFYUCA/IEkgZG9uJ3QNCj4gaGF2ZSBhIGJvYXJkIHdpdGggdGhhdCBTb0MsIHNvcnJ5Lg0K
DQpJIGd1ZXNzIEkgY2FuLg0KDQo+DQo+IFsuLi5dDQo+DQo+ID4gSSBraW5kIG9mIG9wdCB0byBz
ZXBhcmF0ZSBtb2R1bGVzLiAgTWF5YmUsIHRvIHNhdmUgc29tZSBjb2RlLCBhbg0KPiBhZGRpdGlv
bmFsDQo+ID4gbW9kdWxlIGNhbiBiZSBpbnRyb2R1Y2VkIHRvIHdyYXAgY29tbW9uIHBhcnQgYXMg
aGVscGVycywgcGx1cyBzb21lDQo+IGNhbGxiYWNrDQo+ID4gbWFnaWNzLCBsaWtlIGZnLT5kY19m
Z19jZmdfdmlkZW9tb2RlKCkuDQo+IExldCBtZSBhc2sgZm9yIGNsYXJpZmljYXRpb24gaGVyZSAt
LSBieSBzZXBhcmF0ZSBtb2R1bGVzLCBkbyB5b3UgbWVhbg0KPiB0d28gdG90YWxseSBzZXBhcmF0
ZSBkcml2ZXJzID8NCg0KU2VlIGFib3ZlIG15IHJlcGx5LiAgSSdkIGV4cGVjdCBzZXBhcmF0ZSBt
b2R1bGVzKGlteDhfZGNfZHJtIGFuZA0Kc29tZXRoaW5nIGxpa2UgaW14OTVfZGNfZHJtKSArIGlt
eF9kY19kcm1fY29tbW9uIG1vZHVsZS4NCg0KTGl1IFlpbmcNCg==
