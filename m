Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC0EC93F0DE
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2024 11:22:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DA1D10E0D9;
	Mon, 29 Jul 2024 09:22:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="njBR7ZkF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazon11011019.outbound.protection.outlook.com [52.101.125.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A35E110E0D9
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jul 2024 09:22:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ApH/RiHNV+pSwSfI4S8Cx2tfWkofkIePGeXzEoO5pwuaq7AuC+jpkmbm2eqh8bomLhlVVnNX/qEizcCQ4EC3KRz9lkSQMRtNB5H8QKX76GHhYatV2YfFtHU0mD6cy4LpKkQxKlqC9eHOiegus2kNmFd3WRyagnA+fYeq6Kf+5BWinTYSlVlCzU7P7v99B0rT6d043qWoWj2Y4G1yQRM+ff+2fHFIi9ouWcEVP1iyY2TRR61+x+xIgs2taGSYsJ3QSi0iJ7oKbS5VSp2CSpFWchbd26FJ4EJgRElkf/tjeNAjCBesC2FegaeiwxHWSxMhxHYOQdf48uJSLukWNtcw3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ywIcvlYaEEhk8n96XWcGvy6iJ3oiEzEx6F2xbK7zV34=;
 b=sSU4V4Zpr3AFfp+7DQ7JodThJP4ObgC9WVDPQgl0uWC+KpNVRduSj8lbXwJ6d3M6d1bDVM/1m9e8F20B8uIcYj6g6UiHUMIzWZpNw7jpJvwGV9p3zqeEjMk9wVoX8Pi/dRfMQiIYiU2vE3PfVyFZAWj6W43DYRnqbdERYeC6APUwIUaLexWww9pS/d/XtAYC3GuMYFCvVsBkVpVwTIkHpBA86aICcispVzSbZf5s+6ngxB7HK2mPXpCsnyRo21aU/avIe3MCZDuh0zgOLlBNUWvHZWniSjvcyT2Z8dduGUdrtuBYo8qb7j0MPWyWz1+GTmzNggKTpxpQ7bIm+mM2ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ywIcvlYaEEhk8n96XWcGvy6iJ3oiEzEx6F2xbK7zV34=;
 b=njBR7ZkF6SFLMS1PLhAwsx0VYtfcpWHisxO0F00xfZYlhctf8DnddKlJkLfifdtZr1YbvO0/6wDx/rjBlVuObLr5KkBRwfWgbinhyfpfGyc+pVAxGUpI6CJpw9YYzchskq/VK3fxpGlb8H85Z1atFVugvdAH27GkneGsn8lSkZ8=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYWPR01MB11233.jpnprd01.prod.outlook.com (2603:1096:400:3f9::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.27; Mon, 29 Jul
 2024 09:22:23 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%5]) with mapi id 15.20.7807.026; Mon, 29 Jul 2024
 09:22:23 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kieran Bingham
 <kieran.bingham+renesas@ideasonboard.com>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Mauro Carvalho
 Chehab <mchehab@kernel.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Prabhakar Mahadev Lad
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
 <biju.das.au@gmail.com>
Subject: RE: [PATCH v2 8/9] arm64: dts: renesas: r9a07g043u: Add DU node
Thread-Topic: [PATCH v2 8/9] arm64: dts: renesas: r9a07g043u: Add DU node
Thread-Index: AQHa0gdK4KO4jliCJECNSU2FwP7Z0rIJ38YAgAOtmFA=
Date: Mon, 29 Jul 2024 09:22:23 +0000
Message-ID: <TY3PR01MB11346EBC20449F0F4FD952B7D86B72@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20240709135152.185042-1-biju.das.jz@bp.renesas.com>
 <20240709135152.185042-9-biju.das.jz@bp.renesas.com>
 <20240727011132.GJ300@pendragon.ideasonboard.com>
In-Reply-To: <20240727011132.GJ300@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYWPR01MB11233:EE_
x-ms-office365-filtering-correlation-id: 377333af-5c6a-4a78-cbd0-08dcafaff451
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?MWZnTkxUWUZEcHAxNnN5QnR2MVh4SVhJS0lFUDh5dGVMbWhRV0pVNEpzVjVT?=
 =?utf-8?B?aVRkaldMbk9aenpBa2ltS043YysrUFp0Tk15SkRCMWtncGRSbW1lZVpCOUlt?=
 =?utf-8?B?eUhadHoyNnk0cmNLZDRFbnpma2ZSVFU0LzNWZkVwNGk3WDl0YmEzaTFlQUlT?=
 =?utf-8?B?UGZpU0RQczVNZXVKSUNSNDBQNlM0WTNnSzZ2Q2JKUmpMbU9hVENFbzZqMC9u?=
 =?utf-8?B?eW51elZMSVlCaWRGSG5lcTNsTmxUOC9lclBTdXAxaExnWUZPS0FlNkp6OFRX?=
 =?utf-8?B?Mjg5dVFCSlQweUNNYXhOcUN5dWZ5TitpYlZHRmZvcHdDWWNvUHREUlZYS3Qz?=
 =?utf-8?B?aGdqclBrSnY4WnQ5Y1BEZDFmMzFYcmJjTUxHZG0rTkdWTW1ZYzJaUzBRdXNp?=
 =?utf-8?B?YWNBQ2ptUGxNeE5zVWRQK1ZUSnM2RXNwQWZKZVlmemNRaDI3Zms5Yk9naG5u?=
 =?utf-8?B?WDFYeFBKdW5KalYxbTYwV3FuUVcvR000TFduYVpzcURLOVdYWmZmSzV2bkhD?=
 =?utf-8?B?UEVXMklwZHN0WmcwYnQxK1BQbW50OTJGeStJYXBDU1hhNEtwWFMxT2M3dzhw?=
 =?utf-8?B?enFHa1dzTWRTb1N3NHJNTnZBOEYrajU3RlQydVBPS1pIb2pEZWxBRWFuaFZG?=
 =?utf-8?B?d2NFZlFqbVlCTGtQaHEwOXhrWUE0Q2QrYThXUThxcCtyR2RyT0JNU3NkMnhT?=
 =?utf-8?B?dlp1SFFWdlc2UzhUK09rR3U4ZnFJSjBpVHpueHdRR1A4Nlp5b3hPUjZraG5X?=
 =?utf-8?B?WHk5NUJOZ0cyTU84VFNFZmYraWxYenNGNDFpamd2bWVxaVJjMkNhMitBV3dl?=
 =?utf-8?B?dGlTMmRUeW9KWUR5b09xamhOOU5pYUt5WThVYXlCM1p1MUxjOFlxTHU5UWov?=
 =?utf-8?B?YmFYelZJLzEwUUxyNW9lcUlVbktLMGdhSU9vUHlXTnBGOVJxOFl6MVhjdCtC?=
 =?utf-8?B?aXN4RmdWN05PRFpWV2EwcTdHclNlRksrdXlyU29DRGJSMDBBL20xYTU1cVIr?=
 =?utf-8?B?ekxoUWxvem1TelhtNEt3akhsVHNNYVJvOWpqWGh2dy9hSUEwdkoyYVBDT0pH?=
 =?utf-8?B?SHJreFNveTNkUnVqNjNZMVM2dmNhSThQYW04VExJUzBJL1ZzbDl6ZVBMQ3Uw?=
 =?utf-8?B?NlhEdDcvQ0ROaFFWNlFmN2srQk9ydzhBM21QUlc1RjdVeEd1QzIwRGZ2bG9q?=
 =?utf-8?B?OGMvenFqQU50SkorcEliU1llQ2dEY2lXazNSV0grMHl1c29iUlBkYllSWDd6?=
 =?utf-8?B?d0I3TkNRblZoTWxneGFDVWcxNWxTeENHYm1pdjM4RGJwT0NPQmpBYUR1TnhB?=
 =?utf-8?B?S0V1dHNCYjVPWUpPTkJqS0F0RWRXSkxsTFgrT2dWVXFabFV2VnhtZEFUeW53?=
 =?utf-8?B?MGc4dVo5Qm5NZlVnZFBwN3pXV2VrUE4rcEQ3aWVVSlpMd1NhT29UeEhTWDlm?=
 =?utf-8?B?N01BZFlKcCs5K2g0Ujl6YjBRS20xQXVWdlR5YzdzMHFaRlB5R2MyNEcwSFlo?=
 =?utf-8?B?TGF6MzZETE4ySnF5VS9nYTRUTHpyMll2T1o1ZXRqd1RMTFdINTcxNlF1QnJB?=
 =?utf-8?B?M0FlYUdvV3M1QXh0dVdzOGlYcUtJdENPNU9aeU5VQnVNK3NFZGZ4T1FiVGZK?=
 =?utf-8?B?NG9mNzRydHVwdkNleFk0dllGODdLVzlmL0tyeVZ6M3NNTlVaNWpxUTZNcjlo?=
 =?utf-8?B?T01Sd3ZFZDM5MWIwcTU4UE5tMHlYZ2NxaytWV3BSUU9oUGF4SjhTVnA5RFAv?=
 =?utf-8?B?b2JNd0V2ekx5ZHFLQitHelRMN2RXN0Q3b3NyVHVDRWE3QTVRblZiSFR6NFo0?=
 =?utf-8?B?T0dXbStOVU4veVJ1dEVqcEZWckJBSWJYTloraXRNK3hKbG1pNWRvOTJqOUdI?=
 =?utf-8?B?elpmTVVmZU0vRjJtMGlQK1NXS2lsNFg3RWZqZzBoc3BrUWc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY3PR01MB11346.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aW4xOU10WUhtOUowOHQrbjdWUGNVdmpqSmM0TEFMWXlwTE1LZU94Z0ZuRy9E?=
 =?utf-8?B?WHNrS2Y1RG12d2xuRVM3c1FqMXRscENsdlM3Q29VczRrMDZicktEaWRmU091?=
 =?utf-8?B?OENWSHhVL2F6dENDZTFmMGc3ajFBd1RJYnNURDdNMUNUaWl3THdhZ282cGJ3?=
 =?utf-8?B?WFRHd09wRGE3ckVpOGZTdU5RV3B6SEYxdXZFQkRsamlxYWw3Q2VRYVBkY3ZL?=
 =?utf-8?B?cDVkTnRqbCtEbkJNNVpwc3liMC93Zi96K2pHSkUvV1lXZ3NQVnQwNUUwRk9w?=
 =?utf-8?B?S01RbEZtK3V3dEZhTWRrbjI3VzZuSk1QaVVPaGptMXZ3ZG1mZzlpNElScktJ?=
 =?utf-8?B?VGF4anlocC92aGM3Mk9xaXZucllVRkFmcTlySGNNQTVVcWgxaDZHMWh6a29U?=
 =?utf-8?B?T05JM2N6NjFxZ09wRmlZakJLdkt6TDdsNVRPcmhBQlM5c2pScXdRNldaSGRS?=
 =?utf-8?B?RkVsM0hPdlRRTTkvbXg3cUdhQTlnWlJmTWlOa1dTT2g2VDdpTHBNK2RJVFBi?=
 =?utf-8?B?bWd5dExhYzZ3TjVuSzF1TE9tNVpib3VQVitlb1pacUh6VURpcGpWQks3QlhI?=
 =?utf-8?B?YjNzYUIxSVIvVS95RjNlU1U0bTI1QVVDN0NYVU9Gdkg5NXFCQ0lUQ1UyaEF0?=
 =?utf-8?B?UkRXb2hENThiSHczQ2tVbjUxTWErUWx1Z3dNNXRtVW5nUUUweTY4eld2SzF1?=
 =?utf-8?B?OXprSWFsZElMM0ZuK2ozeStKemE0UjB5c0c0L3A1WE4zNWtZb3FQQVliTUk2?=
 =?utf-8?B?SDBwU3hJSE40M1E3TktlSnJiV3V5Ykd6azdkd2M5MFJlZWlnUzJMN3lPQWhL?=
 =?utf-8?B?bFdjeDFIYkJhN25GY0M1bStJRjRrWVJsa1JNcmM0N2h5MFp3N2Zzdy85aUdp?=
 =?utf-8?B?cEZCQVIwVE96S25valI2QlMvR0p2SndqcTFPajRkR2VKZDZLVkZNbDV4ZGpy?=
 =?utf-8?B?c0VqOXYrYjF2RDNPWXRKeDBjNTN3MVYwbVU3VnFhYXkyOE0wdEtyWlZmNXNl?=
 =?utf-8?B?VVIvb292Zm45M3hpV3diQUhVMHJDZ3NJSVI4WVNER3JSc0hVZi9NWTVXengz?=
 =?utf-8?B?aWZFbDcycCtSTEJDT3cwYW53NnBiNk1zYXM5TnNWRVhHOTJaTnRWQXJqQ0xS?=
 =?utf-8?B?SkVCSkJEOTRvTllFc09vbVJ2cmlMT2RNNitITUMxeUxPUjk0NTJCUHQvVG9O?=
 =?utf-8?B?NGhRNlhPYzllK3lPKzJLUDh0ajNGZlZsc0hFNWhMT3pDaU5XdVpHQm5Zb3BC?=
 =?utf-8?B?MjNKeFNlOHJMMk9Ncy92bXhwWXY0M0ROMkNST1hidTRYZGlOUmhBYzg1eVJL?=
 =?utf-8?B?dXpveFZ6VDZ2MlZMV2V6eXBCM0tESzBMMXRXdlFYc1hkc1JMa2tvMm83bW9X?=
 =?utf-8?B?TGhGbnFBMGw1WkhMQmZESEE4UUI5UWtPa25IOWMzd2YwS2tjNURqZmhBWGtm?=
 =?utf-8?B?QUpXbEdSa0M3a0NHSkhxUGFCa05PRDBNU3FNN2tsRHlOSkJFQzJ2UmljOUhn?=
 =?utf-8?B?WUhxNE5CRGhNM21ZZk00V2crTnRmbU0ySGJ0aENwekFmNHh4WTZWKzkvUkp5?=
 =?utf-8?B?RnBoMVl2VWxJL0lKRWlGVldSYm9weXcrM08xMjdSU3hPOUpoZFF3V0JEWDQx?=
 =?utf-8?B?ZFpLVWhBWlUxekRsN2EzdUhxK0VRN2pMcTZrSU5Kc2hiaDJhbnFINHViV1ZF?=
 =?utf-8?B?bzY3bjF4NGRuSTNzTHR4V2E5MDFpTEc4WlVnbVhTQ1BMNFkxVWdqSENNVlpt?=
 =?utf-8?B?a2tIV3Z6R1lQZjR1WTVlSS9iSU4wQnkyd1QvN291UG1YS0hGeUk2OFRWT3Za?=
 =?utf-8?B?UjBibUVHNlZPa1YrNUx5dGdkQkVPU1o4ZW1GQmRqZHlSWTkvaVkrSnVVTVVJ?=
 =?utf-8?B?MG9vaGhuRUkrbUVrOTl4VnprckpBRi9PSjVqVWhlVEhTdmpma3lPL1piWEha?=
 =?utf-8?B?QytvRHBObytVYU03WloyQ1o1aURmS2VjUnJoaXJqUXV4UXJsNGU1TndFdEh6?=
 =?utf-8?B?UzU4RExoMm9Ja3ZDbVZjekwzWFNTcGkzNk5wL3BBOVFvbWlQdSswb2ZtOHRQ?=
 =?utf-8?B?TnRsL3Z1S1Q2c3BFQU5MWWhVUm1uaGh4NGJ5dlI4WjBBRGtZYUhpYjZXNm9h?=
 =?utf-8?Q?BMGTBQYBsTncj96IcM5PbdmG2?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 377333af-5c6a-4a78-cbd0-08dcafaff451
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2024 09:22:23.2825 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: C53O+sLz10+i2SdKDiZu33nJtUXyvU/2Al8JyqRasX7L/H9o0LsMDWxgYTxVHFI4tJ4o2kxcm/XtgdW0vfEQr9CEoF7B7aBANRSpItaOIOI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11233
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

SGkgTGF1cmVudCwNCg0KVGhhbmtzIGZvciB0aGUgZmVlZGJhY2suDQoNCj4gLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFy
dEBpZGVhc29uYm9hcmQuY29tPg0KPiBTZW50OiBTYXR1cmRheSwgSnVseSAyNywgMjAyNCAyOjEy
IEFNDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjIgOC85XSBhcm02NDogZHRzOiByZW5lc2FzOiBy
OWEwN2cwNDN1OiBBZGQgRFUgbm9kZQ0KPiANCj4gSGkgQmlqdSwNCj4gDQo+IFRoYW5rIHlvdSBm
b3IgdGhlIHBhdGNoLg0KPiANCj4gT24gVHVlLCBKdWwgMDksIDIwMjQgYXQgMDI6NTE6NDZQTSAr
MDEwMCwgQmlqdSBEYXMgd3JvdGU6DQo+ID4gQWRkIERVIG5vZGUgdG8gUlovRzJVTCBTb0MgRFRT
SS4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5l
c2FzLmNvbT4NCj4gPiAtLS0NCj4gPiB2MS0+djI6DQo+ID4gICogTm8gY2hhbmdlLg0KPiA+IC0t
LQ0KPiA+ICBhcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjlhMDdnMDQzdS5kdHNpIHwgMjUN
Cj4gPiArKysrKysrKysrKysrKysrKysrKysNCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDI1IGluc2Vy
dGlvbnMoKykNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVz
YXMvcjlhMDdnMDQzdS5kdHNpDQo+ID4gYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjlh
MDdnMDQzdS5kdHNpDQo+ID4gaW5kZXggZDg4YmYyM2IwNzgyLi4wYTRmMjRkODM3OTEgMTAwNjQ0
DQo+ID4gLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I5YTA3ZzA0M3UuZHRzaQ0K
PiA+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOWEwN2cwNDN1LmR0c2kNCj4g
PiBAQCAtMTUzLDYgKzE1MywzMSBAQCBmY3B2ZDogZmNwQDEwODgwMDAwIHsNCj4gPiAgCQlyZXNl
dHMgPSA8JmNwZyBSOUEwN0cwNDNfTENEQ19SRVNFVF9OPjsNCj4gPiAgCX07DQo+ID4NCj4gPiAr
CWR1OiBkaXNwbGF5QDEwODkwMDAwIHsNCj4gPiArCQljb21wYXRpYmxlID0gInJlbmVzYXMscjlh
MDdnMDQzdS1kdSI7DQo+ID4gKwkJcmVnID0gPDAgMHgxMDg5MDAwMCAwIDB4MTAwMDA+Ow0KPiA+
ICsJCWludGVycnVwdHMgPSA8U09DX1BFUklQSEVSQUxfSVJRKDE1MikgSVJRX1RZUEVfTEVWRUxf
SElHSD47DQo+ID4gKwkJY2xvY2tzID0gPCZjcGcgQ1BHX01PRCBSOUEwN0cwNDNfTENEQ19DTEtf
QT4sDQo+ID4gKwkJCSA8JmNwZyBDUEdfTU9EIFI5QTA3RzA0M19MQ0RDX0NMS19QPiwNCj4gPiAr
CQkJIDwmY3BnIENQR19NT0QgUjlBMDdHMDQzX0xDRENfQ0xLX0Q+Ow0KPiA+ICsJCWNsb2NrLW5h
bWVzID0gImFjbGsiLCAicGNsayIsICJ2Y2xrIjsNCj4gPiArCQlwb3dlci1kb21haW5zID0gPCZj
cGc+Ow0KPiA+ICsJCXJlc2V0cyA9IDwmY3BnIFI5QTA3RzA0M19MQ0RDX1JFU0VUX04+Ow0KPiA+
ICsJCXJlbmVzYXMsdnNwcyA9IDwmdnNwZCAwPjsNCj4gPiArCQlzdGF0dXMgPSAiZGlzYWJsZWQi
Ow0KPiA+ICsNCj4gPiArCQlwb3J0cyB7DQo+ID4gKwkJCSNhZGRyZXNzLWNlbGxzID0gPDE+Ow0K
PiA+ICsJCQkjc2l6ZS1jZWxscyA9IDwwPjsNCj4gPiArDQo+ID4gKwkJCXBvcnRAMSB7DQo+ID4g
KwkJCQlyZWcgPSA8MT47DQo+IA0KPiBUaGlzIG1heSBuZWVkIHRvIGNoYW5nZSBkZXBlbmRpbmcg
b24gdGhlIG91dGNvbWUgb2YgdGhlIERUIGJpbmRpbmdzIGRpc2N1c3Npb24uIE90aGVyIHRoYW4g
dGhhdCwNCg0KQWdyZWVkLg0KDQpDaGVlcnMsDQpCaWp1DQoNCj4gDQo+IFJldmlld2VkLWJ5OiBM
YXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0K3JlbmVzYXNAaWRlYXNvbmJvYXJkLmNv
bT4NCj4gDQo+ID4gKwkJCQlkdV9vdXRfcmdiOiBlbmRwb2ludCB7DQo+ID4gKwkJCQl9Ow0KPiA+
ICsJCQl9Ow0KPiA+ICsJCX07DQo+ID4gKwl9Ow0KPiA+ICsNCj4gPiAgCWlycWM6IGludGVycnVw
dC1jb250cm9sbGVyQDExMGEwMDAwIHsNCj4gPiAgCQljb21wYXRpYmxlID0gInJlbmVzYXMscjlh
MDdnMDQzdS1pcnFjIiwNCj4gPiAgCQkJICAgICAicmVuZXNhcyxyemcybC1pcnFjIjsNCj4gDQo+
IC0tDQo+IFJlZ2FyZHMsDQo+IA0KPiBMYXVyZW50IFBpbmNoYXJ0DQo=
