Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41A1F93F092
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2024 11:06:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32C8610E338;
	Mon, 29 Jul 2024 09:06:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="HDvYTcjb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazon11010001.outbound.protection.outlook.com [52.101.228.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FA7010E379
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jul 2024 09:06:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jNFtkMr1o/G3ymE+148sW5PuFlteGLUFTnAD5yVhzqgfAhbsTz3DBZBtuyI3aI1RMaoikn+6aDSsZA6o7zlLl8SrPH6ATRM0OypmgdtmBuyk+Y9fYW8ROVxgibHbjjBkFxf8PSymNeMmRHf8JbNWbWJyGh0q+q4wtiTkaa1CBHTikK0JaaHodb3baWhxjnPuG6btgoLLrgHyWt8rjllgvwCqt+a/Ow4HhNTRGc0wasRpLDBiQrGRB0YdJVniY3zzcW9Z2IaxqyXX4D+1285Tli0FDdWMFNGDscrv45JxqQ5YSTo0WaZlXpRaAQjtkUNGgB6TgzsO3yETjUHlmZ4GPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CU9BcvbDxN41Ucd7rAgvZKeNcoY0QyVYDgP4c4/bF40=;
 b=eW9AdCKhFWd/WUgl2tM+9c4vf9srsEe6QXQazzcKNUu+3PrPOn2JtCmRaeIvVu9RbXxJS8VI4tih8UmNo/4+XuwnfgkGlo/Q5kBfBShAonCMpmodPi1YGT1gSxxpd2Q3HLJ/m8KAyeYH4UlzEMXVp2h7HOgQseNYWy2q5cV2cq1eF1utcqzE1RRm4oGWVcEa7ZaCQSktUo1huBisNqR0usLTVhSNsAoXEitOJR2yqBK+rSlGt2VZaASKUKfQ1j/6aAZiyxa9ra40G3MWnV+dydkrszSbkhsT9L7ODsSYFDi7LehW73suI+gEEp+DoTgf3dUPihXzTDr3TqWRnb2B+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CU9BcvbDxN41Ucd7rAgvZKeNcoY0QyVYDgP4c4/bF40=;
 b=HDvYTcjbAmHsR1sw3YqJtiV15tvxu/A6Xm+GmZXZkIUpBGJerENv/VsJhpuKuupEjxrd1d0kH31Fs5oUOpkcMH9SjuSv7A2cLpZhOSdRm+4Dl3J/n2HlqDdJsrjwpyftAjMAPCYomvRc0mHj9CW2FeEuZo9O3gMaGgj6lci29g4=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS9PR01MB12166.jpnprd01.prod.outlook.com (2603:1096:604:2e3::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.23; Mon, 29 Jul
 2024 09:05:59 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%5]) with mapi id 15.20.7807.026; Mon, 29 Jul 2024
 09:05:59 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Magnus
 Damm <magnus.damm@gmail.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-renesas-soc@vger.kernel.org"
 <linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, Prabhakar Mahadev Lad
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
 <biju.das.au@gmail.com>, Conor Dooley <conor.dooley@microchip.com>
Subject: RE: [PATCH v2 3/9] dt-bindings: display: renesas,rzg2l-du: Document
 RZ/G2UL DU bindings
Thread-Topic: [PATCH v2 3/9] dt-bindings: display: renesas, rzg2l-du: Document
 RZ/G2UL DU bindings
Thread-Index: AQHa0gc3Rxf0mOYA4EWS/UT7ybmnsLIJ2cAAgAOqhhA=
Date: Mon, 29 Jul 2024 09:05:59 +0000
Message-ID: <TY3PR01MB11346C37466562CBB2751F3CD86B72@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20240709135152.185042-1-biju.das.jz@bp.renesas.com>
 <20240709135152.185042-4-biju.das.jz@bp.renesas.com>
 <20240727004958.GF300@pendragon.ideasonboard.com>
In-Reply-To: <20240727004958.GF300@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS9PR01MB12166:EE_
x-ms-office365-filtering-correlation-id: 7876d312-aa15-43b5-cc9d-08dcafada9d8
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?ZkdtM3d1VzFEaE5NTTM0YnFLVS95MFh5WERIT3dzWDE1MHYwdlZqMmIvYk9Z?=
 =?utf-8?B?TFRUbUNvZnY2QWlxNXlNd3Y3eUVhQ1FTZENseDFHejAwaW84VHd1NmRJWlNj?=
 =?utf-8?B?cDh5dDRmYW04MkR2UzhPbmJqWEJ0a1FCSGF6bXdiZTlxZDRqRG5MckNjS0ZW?=
 =?utf-8?B?QmZucXlNd1ZuM0FJNllVcG0rYlVnelQ1VVdnZzVHS3dlTmtIakY0Yzdjc0tE?=
 =?utf-8?B?YUhJUG5NRDhOQWU4dGIxcjFRcS9VL1Iwb0NMZjc0N0Q1TkhIK25aMFl3WkpH?=
 =?utf-8?B?a2hsc2ZLeGNzSDQ4MjVFSUF3ZGR2WkFQNzU4ZENPNTR2M1VWUW9iZWdCZ0Zo?=
 =?utf-8?B?VmlnQlJJZloxQmJYSWdtaWFLV1JMbEpIQmRRc0QzWnJtTVpwSExrZEZjTXpm?=
 =?utf-8?B?YTBrRVdDYXVGSm8zakVPTTlKdnNtMlZEN1BDOThrTkFPTUhraHZjcnhxSGIy?=
 =?utf-8?B?U1FQY0NYYk1xN2pGdTJEZ21oZ3RodUdqdVpJaVlUaDUzNmo2VVlsTXh1Y25X?=
 =?utf-8?B?WXUyQkI1VitiUXUwcEFtN3BUeVBKaEhnbTlvTTIvTnpKWUdjOVc2ditPUjFH?=
 =?utf-8?B?cWRLRDRYRTh3WFMvWkJyeUtXUFMrNWM4WDAvb1h4NHZKaEowV2h6R0xIMnZy?=
 =?utf-8?B?OWVxaS9MN1lnNXp0REdObzFkUEUwMnJ0Ym9qWlp3cVNUVVVrclBib05zMUdF?=
 =?utf-8?B?S3JTVFVIRDdNRXFWNGlNZUN5YWo1Tm9IaVdlZEhFckdtMGJMY2RQUzl1VC9k?=
 =?utf-8?B?SW1JMDZUV3lHZlU1NnNJK3NBN0FVS0FTZ3YrTXVHelNiZWttbnNTd1FiTTR6?=
 =?utf-8?B?SVFnNWxKbEN6REt2S1ZpOFhCcjFGa3ZYU1IvcWNiem5ITC9nWEhsZ2FjZ1Y1?=
 =?utf-8?B?ek1xcHl2OFJiWjgxSnVET2g0Rmd1cHkwNWtrcVNJRUZ6TlMrMXdmSmZHaThr?=
 =?utf-8?B?VDRaL1FoenIyeXprTThuWkhsaUpEWGVGZExxVXV0eGEyZVpHd1AxenlRNVZB?=
 =?utf-8?B?L1dxd0hqUXBKbFdTVnh5aTYrSHA0TXMwNzhPTlNCRm91N2JsUDIrWWN0VUVM?=
 =?utf-8?B?U0RTejhrYjlLTW9jb2tMY3NIY25aaGRzUmkzMXZhU2V2cW5xS3dGQjgwRnlE?=
 =?utf-8?B?Nnc1TUhWSTUvdlBobzlGMnRBM2ppVnZTa1U0cTFibzArejRnYnBrdDczdnh1?=
 =?utf-8?B?Y2xqUFZBNmgydE5BSU02UHpVR3crbXh1M3FHaEE5SG96eGlyaWVHSFo1TDRJ?=
 =?utf-8?B?ZEo0eTVmb056SVJKNG5EaXNobEdCa0lMTUMxb3JGV2k5bks0a28vN0o4MERY?=
 =?utf-8?B?ODJxV2ZjakdZTWlJRzBId1E0OXkzaGpDdkhkQlVTK0RtOEN0VnFYZ2FEbzd3?=
 =?utf-8?B?SDdpb3VyR0llR2lLVW93OVRsVkVKVjBXZUhVanBtVkJ2V1crbGdNUXBMTHY4?=
 =?utf-8?B?VmVCWTFuT01YUGlSZ3VwdGV1UThGYy9JZHdCdEVjbVJ0czNjdWVkM1ZDdnla?=
 =?utf-8?B?MDVtSkJhU1Vwa1RJT0VuRUNYL0ozK1pyN0UyUGppNmpGSlpPclZhZzJFbWh5?=
 =?utf-8?B?Snp2RUdQTVZRYko4Zng4VVUwTGNYdGVkSzRodXVDY3lvZysybS9MdHk4cFhL?=
 =?utf-8?B?VkFFelo4VnJCNzhSTTNBdlVORlBHelQwdzNDS0ZzcCtFUWFqaDdnc0tocDhS?=
 =?utf-8?B?T21ObkkzVDN2Z2xSZUp4ZENPRUpyT1JVU0w4cW9ydnhSUXF4bDNUczQreHJV?=
 =?utf-8?B?Z1BUYlpjQWVYb2F1Q3NyNmErMEk1Tlp3a1BNWWl0bGNCOGxtVlh1R1VmQkZ0?=
 =?utf-8?Q?wz0B1sAXLZygD+ui/readSEjgd4HlKOuafXKI=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY3PR01MB11346.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cG00M1JWWVRSeVNYNjlJS0NnMWpmc0RENmJZZzhmOGZrWFQ4Q2tyYy9PQXcw?=
 =?utf-8?B?TFBnanZHYkpHbElTMWwxNEpvS2NYZUFReEgxRTJMSW5JVXVQcEMyTEk3NGk3?=
 =?utf-8?B?WjI0L253VFJadjNaZ2NuY2FMalVhMTc5aFBSbndyQ1V1ZEVmSkxkcHhBd09N?=
 =?utf-8?B?NzBoRXk4ODdkR0ZwanB0VDZ3c2ZIdWpYczk3ZGV3cEFONlV3R2xSd3FHRHl5?=
 =?utf-8?B?bFZWem1FUHFaNDNxeUJsQkFleXVFRTR5ODBXVHM5VStFVnFzNjZxNHdDUEhw?=
 =?utf-8?B?S2ZueXBvT0F0Q201dUNVM1ZZbS9LRUM0RmFxM1BEb21LUitkd3p1eUdPMHFu?=
 =?utf-8?B?YVpCZjl5TE4xZzAza1puR2FITzRCMlhreEt6dkluUU9naHNIb3NkZ01jSHY4?=
 =?utf-8?B?QnN6Z3hvR2ZiVXdvS1F0c2J1Q0dncHF4eDk0ODhvalRhRlNzc0pTRjgzRGJY?=
 =?utf-8?B?bWVWTGN1bnpNa2FSU2czN0E2RkFMYkRrMXdCblluMFVybTRNdGpOdDJpUjlS?=
 =?utf-8?B?WCtjSGR3bU1OYW9xSmdSRXg3VHpVMDFHMDBFV3Z5Tk1wVVpkdmJkR0lrZGJZ?=
 =?utf-8?B?SGJIbjFrT3g2cmxKNEtsYy9SVEJyNTkxSWEvektWdUFmREdnMHNaUEhXaUNw?=
 =?utf-8?B?UkJzcUl4cjBjcDcwYkVxUW45VnBkSkc5NGhBY05QL2M2TEZRL0FNeWgyQ1px?=
 =?utf-8?B?cy9wT0pMc0J3RDVGcnEzTWxhbE5oZ0RJTldXM3Q0anduN2FPdzV5cGtXak55?=
 =?utf-8?B?OHNWbncwcGdRczZiRklrUUJGWEk4Tk5XVXFteEdLenFBdlp0N3h4TVVXVkxn?=
 =?utf-8?B?VTBQeDVGVW9nVmlkVWFhZmdVSFJqbXgzZGNNRExldzdkbFFkUlp4MUk2YWFI?=
 =?utf-8?B?S24zU0tmUDdncGRmZTBhOFNRMm04Slo1cEhVWTBpS1V6T2VQZjFQV0J5b2hT?=
 =?utf-8?B?NnVLN1FJcUQvZmMxRUJ1NGI4VmVtcnFnc2JVd1hYcXV1c3N6SkMvdXZ5MkF2?=
 =?utf-8?B?ZjJvbUZTblk3OTU4dEJ3Uk5DZmdpMDJGOWhwWTdXYmVQdjgwRHpIYlR0OFJj?=
 =?utf-8?B?MTdlNFpOdTROK05WZ05WNGsrZ0thL2xHTFNDUktNUVI4OFRVbEJCcmwyOVIv?=
 =?utf-8?B?djk1N2NORVc4dE5pKytGa0dlajN3aEd2dHJhOUE2WjZKMU1FVXFPcW02NXpk?=
 =?utf-8?B?cVE2dkR6QVRKOVdPbGNNekFhV29hcnJNaXpFcTBjaUlLZGxZeWptNE4yaTJm?=
 =?utf-8?B?QUROM3AvWXJLMm5TYnVhRUdENXdXMm5LTkhaWW9hcGk0QzNCVGl6eDQ3bURB?=
 =?utf-8?B?Q1liWkxPcDBNYktha2FSc3IveFZJb2l1cEdCbThuK29yMHVndHZMQXlJNzBY?=
 =?utf-8?B?T25NWStFUFMzMUFlbkoxODhpK3FsU0kycG1kem9kNnc2dWRhV05sMmxhNXpV?=
 =?utf-8?B?cW5jWENnMHhIdmNRRDBtWGxocWZXSFNVaTJpcnRISmtWZHRORHV5VXNYaVl1?=
 =?utf-8?B?eHlKQVV2aFNhUTlpcjlYMXBZN2ZNendYVzlRdnJNWUE4WXd5UFYwS0V5T0J1?=
 =?utf-8?B?eDgrYmxsUVEzaVhXNTkyNmVYUDN4VjZYZVFHZlRhQ2liZHJCWjZyR2pDRlBa?=
 =?utf-8?B?djFteVh3aTZmdjFuT0RpclZxSzBjOWR1bWRLMXo5ejRpbXJNL3N0UHdJc0NK?=
 =?utf-8?B?b1lyekNhMlc2UlFCKzRjTUdrR2N3aHRaaWtCa0d5ZFJHMFlRTHBtSE9ndWdo?=
 =?utf-8?B?RVFvS0NCYUVKUHBzTnJjV2hlbTluK3BhTHQzUVZZZGd2RnNWUlFkdHBRbU9F?=
 =?utf-8?B?YVc1Z1RKMTdTZlhhSGlhN1prcm1MVmtpV3BJelNLYTVEZ005N2pJbXF4b1pD?=
 =?utf-8?B?cXpSUk1KMC9QeXAvdENhbUhLTVo2Y0VnN250WEhoYkR3Q2o5TE0wV1hIbnNr?=
 =?utf-8?B?aTJNMGN6S2t3Sk9ZYlplR0xMeTlkYTJvOGR3eWxlaisreUpIcEZJWXptY2cy?=
 =?utf-8?B?Z3VZaVpCL3QxczB1cHZkMlN4K0FHeGJINUpTYktzUFV6VzV1dDhyWEgwRk04?=
 =?utf-8?B?Vi9LWkxwNWZiYXRJbkdKWTB4OWc5bzRxa2JMemVjck56NWgyMGp0d3hHYW1Y?=
 =?utf-8?Q?0TD+VWOZsNyssHwAIWj1Wo4DO?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7876d312-aa15-43b5-cc9d-08dcafada9d8
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2024 09:05:59.3161 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RaW1afTEGO55ikPlI+dYWKk4FEqK8g5DU2K+kqRWkZxkf2Kd8oRqlS7/PHheOIT2Bv0+SEkQ/tdXeTBU+ustj5DnwJLaHWSFLz1XgRLvgPg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB12166
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

SGkgTGF1cmVudCBQaW5jaGFydCwNCg0KVGhhbmtzIGZvciB0aGUgZmVlZGJhY2suDQoNCj4gLS0t
LS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVu
dC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPg0KPiBTZW50OiBTYXR1cmRheSwgSnVseSAyNywg
MjAyNCAxOjUwIEFNDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjIgMy85XSBkdC1iaW5kaW5nczog
ZGlzcGxheTogcmVuZXNhcyxyemcybC1kdTogRG9jdW1lbnQgUlovRzJVTCBEVSBiaW5kaW5ncw0K
PiANCj4gSGkgQmlqdSwNCj4gDQo+IFRoYW5rIHlvdSBmb3IgdGhlIHBhdGNoLg0KPiANCj4gT24g
VHVlLCBKdWwgMDksIDIwMjQgYXQgMDI6NTE6NDFQTSArMDEwMCwgQmlqdSBEYXMgd3JvdGU6DQo+
ID4gRG9jdW1lbnQgRFUgZm91bmQgaW4gUlovRzJVTCBTb0MuIFRoZSBEVSBibG9jayBpcyBpZGVu
dGljYWwgdG8gUlovRzJMDQo+ID4gU29DLCBidXQgaGFzIG9ubHkgRFBJIGludGVyZmFjZS4NCj4g
Pg0KPiA+IFdoaWxlIGF0IGl0LCBhZGQgbWlzc2luZyByZXF1aXJlZCBwcm9wZXJ0eSBwb3J0QDEg
Zm9yIFJaL0cyTCBhbmQNCj4gPiBSWi9WMkwgU29Dcy4gQ3VycmVudGx5IHRoZXJlIGlzIG5vIHVz
ZXIgZm9yIHRoZSBEUEkgaW50ZXJmYWNlIGFuZA0KPiA+IGhlbmNlIHRoZXJlIHdvbid0IGJlIGFu
eSBBQkkgYnJlYWthZ2UgZm9yIGFkZGluZyBwb3J0QDEgYXMgcmVxdWlyZWQNCj4gPiBwcm9wZXJ0
eSBmb3IgUlovRzJMIGFuZCBSWi9WMkwgU29Dcy4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEJp
anUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gPiBBY2tlZC1ieTogQ29ub3Ig
RG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4NCj4gPiAtLS0NCj4gPiB2MS0+djI6
DQo+ID4gICogVXBkYXRlZCBjb21taXQgZGVzY3JpcHRpb24gcmVsYXRlZCB0byBub24gQUJJIGJy
ZWFrYWdlLg0KPiA+ICAqIEFkZGVkIEFjayBmcm9tIENvbm9yLg0KPiA+IC0tLQ0KPiA+ICAuLi4v
YmluZGluZ3MvZGlzcGxheS9yZW5lc2FzLHJ6ZzJsLWR1LnlhbWwgICAgfCAzMiArKysrKysrKysr
KysrKysrKy0tDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAyOSBpbnNlcnRpb25zKCspLCAzIGRlbGV0
aW9ucygtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdA0KPiA+IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcmVuZXNhcyxyemcybC1kdS55YW1sDQo+ID4gYi9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9yZW5lc2FzLHJ6ZzJsLWR1LnlhbWwN
Cj4gPiBpbmRleCAwOGU1Yjk0NzgwNTEuLmMwZmVjMjgyZmE0NSAxMDA2NDQNCj4gPiAtLS0gYS9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9yZW5lc2FzLHJ6ZzJsLWR1
LnlhbWwNCj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxh
eS9yZW5lc2FzLHJ6ZzJsLWR1LnlhbWwNCj4gPiBAQCAtMTgsNiArMTgsNyBAQCBwcm9wZXJ0aWVz
Og0KPiA+ICAgIGNvbXBhdGlibGU6DQo+ID4gICAgICBvbmVPZjoNCj4gPiAgICAgICAgLSBlbnVt
Og0KPiA+ICsgICAgICAgICAgLSByZW5lc2FzLHI5YTA3ZzA0M3UtZHUgIyBSWi9HMlVMDQo+ID4g
ICAgICAgICAgICAtIHJlbmVzYXMscjlhMDdnMDQ0LWR1ICMgUlovRzJ7TCxMQ30NCj4gPiAgICAg
ICAgLSBpdGVtczoNCj4gPiAgICAgICAgICAgIC0gZW51bToNCj4gPiBAQCAtNjAsOSArNjEsNiBA
QCBwcm9wZXJ0aWVzOg0KPiA+ICAgICAgICAgICRyZWY6IC9zY2hlbWFzL2dyYXBoLnlhbWwjL3By
b3BlcnRpZXMvcG9ydA0KPiA+ICAgICAgICAgIHVuZXZhbHVhdGVkUHJvcGVydGllczogZmFsc2UN
Cj4gPg0KPiA+IC0gICAgcmVxdWlyZWQ6DQo+ID4gLSAgICAgIC0gcG9ydEAwDQo+ID4gLQ0KPiA+
ICAgICAgdW5ldmFsdWF0ZWRQcm9wZXJ0aWVzOiBmYWxzZQ0KPiA+DQo+ID4gICAgcmVuZXNhcyx2
c3BzOg0KPiA+IEBAIC04OCw2ICs4NiwzNCBAQCByZXF1aXJlZDoNCj4gPg0KPiA+ICBhZGRpdGlv
bmFsUHJvcGVydGllczogZmFsc2UNCj4gPg0KPiA+ICthbGxPZjoNCj4gPiArICAtIGlmOg0KPiA+
ICsgICAgICBwcm9wZXJ0aWVzOg0KPiA+ICsgICAgICAgIGNvbXBhdGlibGU6DQo+ID4gKyAgICAg
ICAgICBjb250YWluczoNCj4gPiArICAgICAgICAgICAgY29uc3Q6IHJlbmVzYXMscjlhMDdnMDQz
dS1kdQ0KPiA+ICsgICAgdGhlbjoNCj4gPiArICAgICAgcHJvcGVydGllczoNCj4gPiArICAgICAg
ICBwb3J0czoNCj4gPiArICAgICAgICAgIHByb3BlcnRpZXM6DQo+ID4gKyAgICAgICAgICAgIHBv
cnRAMDogZmFsc2UNCj4gPiArICAgICAgICAgICAgcG9ydEAxOg0KPiA+ICsgICAgICAgICAgICAg
IGRlc2NyaXB0aW9uOiBEUEkNCj4gPiArDQo+ID4gKyAgICAgICAgICByZXF1aXJlZDoNCj4gPiAr
ICAgICAgICAgICAgLSBwb3J0QDENCj4gDQo+IFdoeSBkbyB5b3UgdXNlIHBvcnRAMSBmb3IgdGhl
IERQSSBvdXRwdXQgaGVyZSwgYW5kIG5vdCBwb3J0QDAgPw0KDQpDdXJyZW50bHkgdGhlIG91dHB1
dCBpcyBiYXNlZCBvbiBwb3J0IG51bWJlciBhbmQgcG9ydCA9IDEgY29ycmVzcG9uZHMgdG8gRFBJ
LiBTZWUgWzFdLg0KDQpGb3IgY29uc2lzdGVuY3ksIEkgZG9jdW1lbnRlZCBiaW5kaW5ncyBmb3Ig
UlovRzJMIGZhbWlseSBEVSdzIHNpbWlsYXIgdG8gUlovRzJ7SCxNLE4sRX0gRFUgWzJdLg0KDQpT
byBwbGVhc2UgbGV0IG1lIGtub3csIGFyZSB5b3Ugb2sgd2l0aCB0aGlzPw0KDQpbMV0gaHR0cHM6
Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjYuMTAuMi9zb3VyY2UvZHJpdmVycy9ncHUvZHJt
L3JlbmVzYXMvcnotZHUvcnpnMmxfZHVfa21zLmMjTDE4Nw0KDQpbMl0gaHR0cHM6Ly9naXQua2Vy
bmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvbmV4dC9saW51eC1uZXh0LmdpdC90cmVl
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3JlbmVzYXMsZHUueWFt
bD9oPW5leHQtMjAyNDA3MjkjbjU0Ng0KDQo+IA0KPiA+ICsgICAgZWxzZToNCj4gPiArICAgICAg
cHJvcGVydGllczoNCj4gPiArICAgICAgICBwb3J0czoNCj4gPiArICAgICAgICAgIHByb3BlcnRp
ZXM6DQo+ID4gKyAgICAgICAgICAgIHBvcnRAMDoNCj4gPiArICAgICAgICAgICAgICBkZXNjcmlw
dGlvbjogRFNJDQo+ID4gKyAgICAgICAgICAgIHBvcnRAMToNCj4gPiArICAgICAgICAgICAgICBk
ZXNjcmlwdGlvbjogRFBJDQo+ID4gKw0KPiA+ICsgICAgICAgICAgcmVxdWlyZWQ6DQo+ID4gKyAg
ICAgICAgICAgIC0gcG9ydEAwDQo+ID4gKyAgICAgICAgICAgIC0gcG9ydEAxDQo+IA0KPiBZb3Un
cmUgbWlzc2luZyBhIGJsYW5rIGxpbmUgaGVyZS4NCg0KT0ssIHdpbGwgZml4IHRoaXMnDQoNCkNo
ZWVycywNCkJpanUNCg==
