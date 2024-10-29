Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 924699B4423
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2024 09:25:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78C7510E5CE;
	Tue, 29 Oct 2024 08:25:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="aVqhvr4u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2066.outbound.protection.outlook.com [40.107.21.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 902EB10E5CE
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2024 08:25:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pq1bJQTPmjnKpXJnIgmua0+JbikuTxKholpFnRBd5eX6n+8vbqpzJ5JcsHCjxi2bAK1p/YbdF4gCWV9mMLRt1GILGaLLamyys0Djs4ZcWGkkb6mpu5iqizW8VjzPvhSrtsvTBKoOcaQizkCHxfpE9bnczXO0HBHCri+pzAN6yMzkxntSPixQv7VQeyt4rquQSHaZWRIJVQu+gNOK/pJsGhKstsEoSLM6EDbKcIBwNgw+9Ww0iE2x+/BfY3evd+4sN7zBZH6sah7emjq13ZKFIRviV36PThBIFRU1vQx7fNFjmEjJKHC9hBGvJSiEZEqjszYhv1pejDrQsG+Bh93G6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ySx0tizdIbywxNznzIeZfAlU8G3WTn9R1YGguUNax+E=;
 b=BOwwTK9nIk0eF7u9BHRVxfvx0tzSW3zZBqK4+ZhD/ao7FpXlNICLnuokRa+Zu6h5XgKUBIlK0frGGX7lfmv6I5o5l4S/aZWh9V5A962zw05r+jAMnKWtkkJPyjkQ5DxULKGESopKz+/gMroW7LNGrErzD1SIAxDIV4AfrUrAZGXdGQxWeineKi7gCoj1OVBvnoLt4tmPNMcBJfqjX5VGE6DrL3ZIl24Ms85+PEBbhjGrFrP7EQoLSXLuwP10FtC7RXVvRu8jftEUdXyWsWWQBxYRyxMhikcadR7OOJt1HRQIcYCadoq37d/FBtNv8rvblH7eFAo0DneLqsNtQSauvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ySx0tizdIbywxNznzIeZfAlU8G3WTn9R1YGguUNax+E=;
 b=aVqhvr4u6sR9BNxzFWcTgK0+HsVrUgEcuCa6F92tuT920ph6DrRXoGcY5G5f2Dheb7ccnl9gFOea6h3rrAEF2GgOLz6Xpimp2LyNaopIWSJ6LMlrxKann0OEjkYagz8qxmVJ95GQbsCCJf6lstnvJqjA2Q1XSEs+8SuMALnmEymeCeRyqlKBqxLtHY6dYDDyWM5aweH12mrbG3iiRPF5aBOwn2oiF7Z9kVbrwcKTvRo5YzmLvJk+7yJRL+yXfeSh9UcYGufna4l/5Pok+7ZCLQqw5O70QXwMRByFVd6Czc/ActqK0dUqXp0VQf4i7zIxd1T8PUwIKPgbAu4MilrBvQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DU2PR04MB8805.eurprd04.prod.outlook.com (2603:10a6:10:2e0::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.29; Tue, 29 Oct
 2024 08:25:31 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8093.023; Tue, 29 Oct 2024
 08:25:31 +0000
Message-ID: <cb74d47a-6d33-4f67-bf09-83173d49452f@nxp.com>
Date: Tue, 29 Oct 2024 16:25:52 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 08/13] dt-bindings: display: Document dual-link LVDS
 display common properties
To: Biju Das <biju.das.jz@bp.renesas.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Cc: "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>,
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 "rfoss@kernel.org" <rfoss@kernel.org>,
 "laurent.pinchart" <laurent.pinchart@ideasonboard.com>,
 "jonas@kwiboo.se" <jonas@kwiboo.se>,
 "jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "airlied@gmail.com" <airlied@gmail.com>, "simona@ffwll.ch"
 <simona@ffwll.ch>, "robh@kernel.org" <robh@kernel.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "quic_jesszhan@quicinc.com" <quic_jesszhan@quicinc.com>,
 "mchehab@kernel.org" <mchehab@kernel.org>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "festevam@gmail.com" <festevam@gmail.com>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 "will@kernel.org" <will@kernel.org>,
 "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
 "hverkuil@xs4all.nl" <hverkuil@xs4all.nl>,
 "tomi.valkeinen@ideasonboard.com" <tomi.valkeinen@ideasonboard.com>,
 "quic_bjorande@quicinc.com" <quic_bjorande@quicinc.com>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>,
 "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
 "arnd@arndb.de" <arnd@arndb.de>,
 "nfraprado@collabora.com" <nfraprado@collabora.com>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "sam@ravnborg.org" <sam@ravnborg.org>, "marex@denx.de" <marex@denx.de>
References: <20241028023740.19732-1-victor.liu@nxp.com>
 <20241028023740.19732-9-victor.liu@nxp.com>
 <01c1c4f3-1652-4b08-bd35-08b4e1c04c79@nxp.com>
 <TY3PR01MB11346805C5D524D264669D178864B2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <750920ae-36b9-47f5-84e9-779332739f86@nxp.com>
 <TY3PR01MB1134610B42A1D3424D97B04CA864B2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <a166da61-8cd4-44c9-987b-94d8a62faf82@nxp.com>
 <TY3PR01MB113465D2F4C35A0728993D35E864B2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <TY3PR01MB113465D2F4C35A0728993D35E864B2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR01CA0022.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::14) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DU2PR04MB8805:EE_
X-MS-Office365-Filtering-Correlation-Id: 51e46255-7586-46fe-ade7-08dcf7f34052
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ek9XL1VlVGNzd0k1UEFHSWlrdkxWbjFwSmRxQlRoSEFzWEhXUmhNSjFpTGdV?=
 =?utf-8?B?cE01eGEvSms4UUhJL3B1a01pUU84ViswMUN4N1RqcnhEd3MzbkhPS3hjOE9R?=
 =?utf-8?B?cmpteG40Q2tIcTY3UGkrTWhQZ2MrSVNtakN5M2pxcW9SdWoydDhEZy9qbFMr?=
 =?utf-8?B?cGxKZ2VHOVZuUHlpd1VORUV0SVdIeUdOdlU2eHozTkJxVkk2NU1RZUR4NUxL?=
 =?utf-8?B?S3IycHFTcW1xTGRyWjU2eUp0L3cwQ29ObFVVaE8ySHJ3TUlPSm8xYmxRNFp0?=
 =?utf-8?B?MjdFL2FJRDFtRXVXZkdjaWRrOVJHb1p1cGYybXBPTEJ6WHpKZmFFYnRaU2lt?=
 =?utf-8?B?NGF6cFU3cyszbzBFdENDc21GTmkwMHE3eWpKNThienB1RVV0QldPVHgvdjdI?=
 =?utf-8?B?NjVNR0QvdmIvaVNhZVo1dGpuWVRyZ3greUtvNUN1aXVzZzZEb1VOa0NXL1Zu?=
 =?utf-8?B?TjdZRGFQSHBlTSt2a3ZjTHg5RGdtNloyRy9DekpqQ2lla3N1VnR6eFNoTEdi?=
 =?utf-8?B?dnhzRjhvZ29iRnZ5NjJTZnlJbURmQWJHaGlXOUlNZ1JMd2h6YXBncm9nY0xN?=
 =?utf-8?B?aHg4RnIrZC8vbWlqbmozY1pJM2ZWNEl5SUcxelNMNk1RWXZTNCtsNFlWT3BO?=
 =?utf-8?B?TE1xZzhCN2RCMThmTEdlSmE4UzdYMUhXWGNaN1UvcWh2UVBPSDFROG9KTGM1?=
 =?utf-8?B?UC9sWlZ2Z3NvQlppNkFHNmhhSjlUMU4wYnRSSHdXd0VoeWpzK2pMZi9TOElS?=
 =?utf-8?B?MFhHMUxkYmtHMVNER2k2WnBXUXBvWXp1bHFueXVxV3BxTmp3UkNmbzNSZU9j?=
 =?utf-8?B?MWUxVGRBT0Qyd2JHQkxDK3dXRmVyWk5RVDZVb3hYQjhxbnlVNmpPK2ZFa21G?=
 =?utf-8?B?aEtzQmI0c0x0TzRxNFM0M3lPcjF4NWU3MEloS2RiNU5IcGowd1ZqYS90WmVL?=
 =?utf-8?B?eG5yZUgvZ1c1bXI4VVhQbTBSZEZRUWhGZXZJdnRaWXNISXMwQjZKNk5NNUF5?=
 =?utf-8?B?SWc0TE5xSW5oSXpHRGtXV2toektSeGpURzBkVUxjcW9WR1BLOEQwUXJyYlEy?=
 =?utf-8?B?SEZCZ1dOWllwYURGZjRIZ1FmbFBNRkozeW02WFlwNHpaL3ZRTktEM1ZLVk8z?=
 =?utf-8?B?Qm94eU4yY2VzSS92ejk5TXUwMXpyVHNVMmFnMnhkNXFZMWsyRCtKdGFpSmhl?=
 =?utf-8?B?dHROd3d3NWhYMmk0RHFBRjVDUXJobUs3ckF5WkdmNGZpQ0R5NlZxZGJFOVli?=
 =?utf-8?B?b3hNUy9meG5XajB3T0FydGNOeGRUcE1jMmZjUWJlRXEzQ1RXc3BMMUN5OU9F?=
 =?utf-8?B?RUkyeEtsTWVZRkwrWFlrK2dKNmorVU0wZlZXcGpGM29lTEZRbWRxczNxbldO?=
 =?utf-8?B?dFJsTjlIYlZyRTl2a0YrUjRwcUVVV1l0ckJscDU4VVVJZXpZbElFR0tkenpP?=
 =?utf-8?B?VEZLOFprb2lpcnM2NzNEVHVJaUxjK24xYmtEZ1kxK3dTT3VJWWxyMS9IKzU1?=
 =?utf-8?B?bEFneFVsNDZ2VnMwelpNajREN3V0bWlBekNMOC9jN0hYY0lCeDk3d1Q3Qi9t?=
 =?utf-8?B?cGJsRzBFQVIrNEJiTkRxcGZrWjFVZ1ozNkl6WTJLYXF2cTd4R29qTy9uU0M1?=
 =?utf-8?B?RHFpV2pDZ0dZalhqQzhFSk1QY3oxeVVYbi9RY0Mzamp6K1lWZytrY0dPR0Ns?=
 =?utf-8?Q?MPzcW08bXnaF7E4mNNmj?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eEFHekh5SVd1dWFjak1VN0dMWURseittdmRZSFBBVTQyTm4wRXZnQmRpTFEv?=
 =?utf-8?B?RDgyVm5XZ0JWcjFkTGJoNyt2ZjFoNnoyYWczdmd2NEhWcDZsYmh4NWp3V2E5?=
 =?utf-8?B?YlRXbHVNS2t2RWVwaWJWZG41UXA1aVdUemhtdkZRUEtCMjR6NjFsRnJqNURD?=
 =?utf-8?B?SWw1aWh2NTRURlBXVHpQVmJDMjN6NHk2Z3E1YzVQbUNMcFZHSXljYnlzRFpn?=
 =?utf-8?B?WE5IellWL2F3UkIzdTdsT2Q5QmlOSkt3bUxHQ1hCVmJqZ3Nkd3BCcWdSMmx6?=
 =?utf-8?B?emF1YWptcDZHd29PY29uc3JVSXEzL0NjKys5a0FTZ1lkN1ZhdjJhdDVzeE12?=
 =?utf-8?B?dGJYNWlFaFNUcFo5UjVLakNJUk84bHEvV1lRdVJ2cFpybnpqK1BWQ1R5cFpj?=
 =?utf-8?B?Wi9KbjkxazRWTkxEalB0Z1VzT1lrK05BUDhPTHptQzhmbWlzWS9HTndlVGRm?=
 =?utf-8?B?dkM5WW1TNDUrdC9VQW11Y0MwWTZiNFcwbnl3dk5yZngwdnYxdGtmNVYzR3lF?=
 =?utf-8?B?bWs3UTZyMmd1eER0T01rWS9raWVFQVJ1TW1xRnozNVdVNVBTbzhMTzZhUGl4?=
 =?utf-8?B?eFB4bnJZSHV4alFGYWFpTmF1R2J4dHRvRWFmUUZuYTc5a1phV1VUVGFSTjQv?=
 =?utf-8?B?MVB1cVlyN0J6ZGt5WEVJMWdNOUw0RDVzcmdTZXkyMDJWTFlROVF2TytCK1R4?=
 =?utf-8?B?RHpKS3dPOXRoVVY3QW9iTFNMbDVhOTZraWNESE9vQ0Q4VHMra2prb3YxVlpl?=
 =?utf-8?B?N285YXhIWUJiRUFGNCtJQ0dhLzQ4K0sxQ21JUGhJWjlha0lyL3pReDdIaDY3?=
 =?utf-8?B?UnVDellIdmFDS3JJeUhyN0VUVDRDQWo1aVVLT3BGS1dWSlFpQjQ4TGJGK29Y?=
 =?utf-8?B?V2tYTHNXSzBrS1o3TGF0WWRvSHE4Snc0dGNIR09qNXZoS0Y3Slg5Qm9XdGRs?=
 =?utf-8?B?cG9mYmxXUVYrSndMN0lvQS9Zdk55Uk9QQzBUazVwaXhCaFB2eGd0blovSkh4?=
 =?utf-8?B?QmZWWlJiNWx2ZTlqb3c4bG1GVFRKUWNaMTN3azVtTUY2c0VJVDNmQzRRcHgw?=
 =?utf-8?B?TlBvVmh4WVFxV3o5UndpVHlnUVN1NG9LdFRqN0FYQWlONTV6MDY2ZERaVFdu?=
 =?utf-8?B?aWIwVHVOakRuWWMvYnVhRnc5STBRVGFNUWV3OWRtTHdGQVhna3ZtTkR1U1Vi?=
 =?utf-8?B?VnY3bzJlOStDZnhxNFQ0Mll0K2lrQW1tdEx5Yzh6Tkw3czhDMzdqbjl6Wkd4?=
 =?utf-8?B?VGZGTWdaV0g4R0ZmMFAvckd6VzlPaFdiMWkvOWhnRTFTWjZ4a0Z2dW1KZFcw?=
 =?utf-8?B?c1h4RkpPRC9oM2t4eWNnUC9KZU9wVFlIbnVQTzZWWk9mUDQxTWxQdm0wYkNh?=
 =?utf-8?B?bTFLVmFwVXJFQzdUUGRveVRtTWVWYVFGYnNDeklsck9KNG1XMjRUN25CdXJX?=
 =?utf-8?B?N3gwd0k5elF3eDZmSDRQVno2N3pDWGgzam13dmQwc0ErM1J6ZTBVUHJraHNr?=
 =?utf-8?B?bmdGby81SnFDaTIxa3hRN2FVOWhkMFRyaTV4UU8rbjNzZmN1VlQ4SDdXL09Z?=
 =?utf-8?B?elY2TzZYREUwYks4bldNY09QS1MzaGFkK212N0lUQTBDM1poMENNb0RGb0ZT?=
 =?utf-8?B?anlhVlVSM2FwZHY1K0xrK016TG04TGVzNzNDbXRhSWZMaEdXclNaaTloclpt?=
 =?utf-8?B?THFzeDdyM1JCNWVobFhMUDFtb3dtaDlHNnZFUWxGbDNzU1BCUW41VWZYYXRR?=
 =?utf-8?B?TURNRE5tajExc2lHS3dPcGlsMTlSNUNrRU5kdXd3N29oU1dMR3NYdXpzZHVG?=
 =?utf-8?B?MmVNblF3WW9GR3JJa3J1dzVyaFZqaXBoOTRyZ3hramNQMFFDODlRcmNsbHBF?=
 =?utf-8?B?bGdtMDZzU1pTeHdCYmhtcWcxOE1DZGNzOFpINXNQQlNycXNxaTVHWFFFV0ly?=
 =?utf-8?B?cnFHTUpBTmVZa3V2RTRvZWFoZ3BERkxLQjlzdkVZU2lQNmpoTVg1S3NSMFBY?=
 =?utf-8?B?ZDl0OHhadVpYVzV4dEtyTWxVMXRRcUNtNHQzZDk1TmV5NFBLUllzUXU4S1Er?=
 =?utf-8?B?ODdSdmRQeW81RE9IelI1WHB3SG9WeFkvek9CM0dxUDVpWTQvd0NIMzNHUjU1?=
 =?utf-8?Q?jvwTFVBlYYyPkOkjY39RHLAPy?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51e46255-7586-46fe-ade7-08dcf7f34052
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2024 08:25:30.9350 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SWukulLhWp3MvhUyRXIv5EQIgt6YZxHjT/8/jsVXkzKhlo5zPXFANEOTfsyFSBh0yqRbxd7cAuWg3YgeQg5eIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8805
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

On 10/29/2024, Biju Das wrote:
> 
> Hi Liu Ying,

Hi Biju,

> 
>> -----Original Message-----
>> From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of Liu Ying
>> Sent: 29 October 2024 07:35
>> Subject: Re: [PATCH v4 08/13] dt-bindings: display: Document dual-link LVDS display common properties
>>
>> On 10/29/2024, Biju Das wrote:
>>> Hi Liu Ying,
>>
>> Hi Biju,
>>
>>>
>>>> -----Original Message-----
>>>> From: Liu Ying <victor.liu@nxp.com>
>>>> Sent: 29 October 2024 07:13
>>>> Subject: Re: [PATCH v4 08/13] dt-bindings: display: Document
>>>> dual-link LVDS display common properties
>>>>
>>>> On 10/29/2024, Biju Das wrote:
>>>>> Hi Liu Ying,
>>>>
>>>> Hi Biju,
>>>>
>>>>>
>>>>>> -----Original Message-----
>>>>>> From: Liu Ying <victor.liu@nxp.com>
>>>>>> Sent: 29 October 2024 06:17
>>>>>> Subject: Re: [PATCH v4 08/13] dt-bindings: display: Document
>>>>>> dual-link LVDS display common properties
>>>>>>
>>>>>> On 10/28/2024, Liu Ying wrote:
>>>>>>> Dual-link LVDS displays receive odd pixels and even pixels
>>>>>>> separately from dual LVDS links.  One link receives odd pixels and
>>>>>>> the other receives even pixels.  Some of those displays may also
>>>>>>> use only one LVDS link to receive all pixels, being odd and even agnostic.
>>>>>>> Document common properties for those displays by extending LVDS
>>>>>>> display common properties defined in lvds.yaml.
>>>>>>>
>>>>>>> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>>>> Signed-off-by: Liu Ying <victor.liu@nxp.com>
>>>>>>> ---
>>>>>>> v4:
>>>>>>> * Squash change for advantech,idk-2121wr.yaml and
>>>>>>>   panel-simple-lvds-dual-ports.yaml with lvds-dual-ports.yaml.
>>>>>>> (Rob)
>>>>>>> * Improve description in lvds-dual-ports.yaml.  (Krzysztof)
>>>>>>>
>>>>>>> v3:
>>>>>>> * New patch.  (Dmitry)
>>>>>>>
>>>>>>>  .../bindings/display/lvds-dual-ports.yaml     | 76 +++++++++++++++++++
>>>>>>>  .../display/panel/advantech,idk-2121wr.yaml   | 14 +---
>>>>>>>  .../panel/panel-simple-lvds-dual-ports.yaml   | 20 +----
>>>>>>>  3 files changed, 78 insertions(+), 32 deletions(-)  create mode
>>>>>>> 100644
>>>>>>> Documentation/devicetree/bindings/display/lvds-dual-ports.yaml
>>>>>>>
>>>>>>> diff --git
>>>>>>> a/Documentation/devicetree/bindings/display/lvds-dual-ports.yaml
>>>>>>> b/Documentation/devicetree/bindings/display/lvds-dual-ports.yaml
>>>>>>> new file mode 100644
>>>>>>> index 000000000000..5f7a30640404
>>>>>>> --- /dev/null
>>>>>>> +++ b/Documentation/devicetree/bindings/display/lvds-dual-ports.ya
>>>>>>> +++ ml
>>>>>>> @@ -0,0 +1,76 @@
>>>>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML
>>>>>>> +1.2
>>>>>>> +---
>>>>>>> +$id: http://devicetree.org/schemas/display/lvds-dual-ports.yaml#
>>>>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>>>>> +
>>>>>>> +title: Dual-link LVDS Display Common Properties
>>>>>>> +
>>>>>>> +maintainers:
>>>>>>> +  - Liu Ying <victor.liu@nxp.com>
>>>>>>> +
>>>>>>> +description: |
>>>>>>> +  Common properties for LVDS displays with dual LVDS links.
>>>>>>> +Extend LVDS display
>>>>>>> +  common properties defined in lvds.yaml.
>>>>>>> +
>>>>>>> +  Dual-link LVDS displays receive odd pixels and even pixels
>>>>>>> + separately from  the dual LVDS links. One link receives odd
>>>>>>> + pixels and the other receives  even pixels. Some of those
>>>>>>> + displays may also use only one LVDS link to  receive all pixels, being odd and even agnostic.
>>>>>>> +
>>>>>>> +allOf:
>>>>>>> +  - $ref: lvds.yaml#
>>>>>>> +
>>>>>>> +properties:
>>>>>>> +  ports:
>>>>>>> +    $ref: /schemas/graph.yaml#/properties/ports
>>>>>>> +
>>>>>>> +    properties:
>>>>>>> +      port@0:
>>>>>>> +        $ref: /schemas/graph.yaml#/$defs/port-base
>>>>>>> +        unevaluatedProperties: false
>>>>>>> +        description: the first LVDS input link
>>>>>>> +
>>>>>>> +        properties:
>>>>>>> +          dual-lvds-odd-pixels:
>>>>>>> +            type: boolean
>>>>>>> +            description: the first LVDS input link for odd pixels
>>>>>>> +
>>>>>>> +          dual-lvds-even-pixels:
>>>>>>> +            type: boolean
>>>>>>> +            description: the first LVDS input link for even
>>>>>>> + pixels
>>>>>>> +
>>>>>>> +        oneOf:
>>>>>>> +          - required: [dual-lvds-odd-pixels]
>>>>>>> +          - required: [dual-lvds-even-pixels]
>>>>>>> +          - properties:
>>>>>>> +              dual-lvds-odd-pixels: false
>>>>>>> +              dual-lvds-even-pixels: false
>>>>>>> +
>>>>>>> +      port@1:
>>>>>>> +        $ref: /schemas/graph.yaml#/$defs/port-base
>>>>>>> +        unevaluatedProperties: false
>>>>>>> +        description: the second LVDS input link
>>>>>>> +
>>>>>>> +        properties:
>>>>>>> +          dual-lvds-odd-pixels:
>>>>>>> +            type: boolean
>>>>>>> +            description: the second LVDS input link for odd
>>>>>>> + pixels
>>>>>>> +
>>>>>>> +          dual-lvds-even-pixels:
>>>>>>> +            type: boolean
>>>>>>> +            description: the second LVDS input link for even
>>>>>>> + pixels
>>>>>>> +
>>>>>>> +        oneOf:
>>>>>>> +          - required: [dual-lvds-odd-pixels]
>>>>>>> +          - required: [dual-lvds-even-pixels]
>>>>>>> +          - properties:
>>>>>>> +              dual-lvds-odd-pixels: false
>>>>>>> +              dual-lvds-even-pixels: false
>>>>>>
>>>>>> Hmm, I should require port@0 or port@1.
>>>>>
>>>>> For dual LVDS, you need 3 ports as common use case
>>>>
>>>> For LVDS panels, only two ports for LVDS sink are needed.
>>>> For display bridges with LVDS sink, one additional output port is
>>>> needed.  However, I'm not sure if this output port should be
>>>> documented in this binding or not, because it doesn't look common enough considering the LVDS
>> panels.
>>>>
>>>>>
>>>>> 2 input ports and 1 outport and all are required properties.
>>>>
>>>> The output port cannot be required for LVDS panels at least.
>>>
>>> Ack.
>>>
>>>>
>>>> We need to require one or two input ports, because IT6263 may use one LVDS link or two.
>>>
>>> This patch is for generic dual link common cases and is not applicable for IT6263 single link case.
>>
>> Based on previous discussion(especially Dmitry's suggestion), this binding should cover display
>> bridges that can use one LVDS sink port or two LVDS sink ports, like IT6263.  To be clear, those
>> bridges may have two modes(supported by one
>> chip) - single LVDS sink link mode and dual LVDS sink link mode.  Those bridges are considered as
>> common dual-link LVDS displays.  That's why I was asked to extract the common
>> properties to this schema when adding IT6263 DT binding.
> 
> As per [1] and [2] both panels don’t support single LVDS link.
> IT6263 is bridge device that has single and dual link support.
> Not sure the single link case has to be taken care in ITE6263 binding itself,
> Leaving Dual link as it is??

There are a couple of bridges supporting dual-link LVDS like
IT6263, see lontium,lt9211.yaml and thine,thc63lvd1024.yaml.
So, it looks fine for this binding to cover those bridges,
as those LVDS links are sort of common stuff.

> 
> [1]
> https://elixir.bootlin.com/linux/v6.12-rc5/source/Documentation/devicetree/bindings/display/panel/advantech,idk-2121wr.yaml
> [2]
> 
> https://elixir.bootlin.com/linux/v6.12-rc5/source/Documentation/devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml
> 
> 
> Cheers,
> Biju

-- 
Regards,
Liu Ying

