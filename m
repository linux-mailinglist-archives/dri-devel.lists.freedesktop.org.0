Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC6DE9D956A
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2024 11:23:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD81510E819;
	Tue, 26 Nov 2024 10:23:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="V6V9czr/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazon11011068.outbound.protection.outlook.com [52.101.125.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B6EC10E819
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2024 10:23:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S1cit3xagZptxEeZAiaqk8Gl+payXxvkfBIwuvkr/ZhwlNfiCP6VGt/jqaRCcaVV4wYLBo+VXWtiUjFoy3wtfIGZzh1jGp46Tyc24+KDzc50q1lTB9nqtOkOUkozdHbbf71iAG3liwoIbce0PZ5p0lFyejUmdcvCCthaiNLjs4FaruxcNy7KT8CrTuJ12QRbKjvVQQtHKgh9de29VkmTtPscXkAohojCj3xG36zfXqqU5hvEjnjL2Q0tna8T0nXedZE7nacJr8Ed3hWjJnVpDRCMBCMntMwExAln1MBsth1+/K43RO+FKTCGQo2u2Q8cNMZBI4PXHjGfJdRYyd5Htg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dE8QcP644uTUsP76Ro6Yl/9c2ACCMXIgyyq/OUoBQ9U=;
 b=nsdSSyefbuXEx4ROZhQWLE2xTW4XmmUG1ZKeJbBp0R1hBVVy96N2Ab/TTefLlDMPGRh/r9Apii9VP22gddWUH4OZlRox6pwx90YMVTUb8ciDT/PrSOxlesGEV9I7mf4rxycaW2pquNxvSb3H/5tu24hBkfO2eQF3Ncrb8SYHDeH4upfJsOc0AKeRkjScCfCD++ePpFFZ7YcOktJa2nrofN5kgkpWSR2LKaGs541JZGo+dx/YHBW9sx5Td1fvH0KcAlWlNLW6kslEja2NxREDMhv47O4DcXxi5tchL39yQBlMdo7p4JNCg2YgDF5t6y1H6jvai5emc7OodF0DraKGWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dE8QcP644uTUsP76Ro6Yl/9c2ACCMXIgyyq/OUoBQ9U=;
 b=V6V9czr/heUcKWMhofTgdwhNdt202v4cTFpXnFE0a9uI/8S7gBrswKoOHi/tXt+COnyWBveiasxdmeGJqX0qHOBGOIAar6/Et92kHo1hIat7lnP0XNICmO/BcZ25BIw8bdVQY1XJ+hsEuS0HWQu62A/gVOVasIZiQyR+Zs/B0pQ=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS3PR01MB10326.jpnprd01.prod.outlook.com (2603:1096:604:1fa::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.20; Tue, 26 Nov
 2024 10:23:17 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%5]) with mapi id 15.20.8182.019; Tue, 26 Nov 2024
 10:23:17 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Tommaso Merciai <tomm.merciai@gmail.com>, laurent.pinchart
 <laurent.pinchart@ideasonboard.com>
CC: Kieram Bingham <kieran.bingham+renesas@ideasonboard.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: RE: hints around rcar_lvds.c :)
Thread-Topic: hints around rcar_lvds.c :)
Thread-Index: AQHbP+wmeo3akYZTEEyehR1OdpPnK7LJWnkw
Date: Tue, 26 Nov 2024 10:23:17 +0000
Message-ID: <TY3PR01MB1134637A719B9278566422667862F2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <Z0WfwMJVCQOEZM3c@tom-desktop>
In-Reply-To: <Z0WfwMJVCQOEZM3c@tom-desktop>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS3PR01MB10326:EE_
x-ms-office365-filtering-correlation-id: a9845fb0-6a51-457f-84a9-08dd0e045808
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?7xYeX8TzhDPEA7YOsDeGkSkCffGO+SSPCD2fX4miUvdKRBz+ju98VFUvsnwR?=
 =?us-ascii?Q?DPfFSDM/qLH65QOXEjbuq4s05PIWKhkUM60NWzpGcQTt6g3BC0GpMVxfJw5W?=
 =?us-ascii?Q?EQeoTXHrp94c0UQv4BGnWImydJzTNLM/VakWOyRilnvS1pjqJlkECbttVH76?=
 =?us-ascii?Q?O4p9cuIOp29QtVRmPLUupnKTVQ6sxm2IIwcA4lIV+Tw4rQONWS7bS6Rl9VD9?=
 =?us-ascii?Q?2q7ggrZJW2Rh7QifvZFDp6ZPqCn6nnmoTyX2EobT8WGdjz/hDwUxIELkOye0?=
 =?us-ascii?Q?VksgkBvvVBpDn1VN0LtNW6vcqse5/4LDoqzv9Ki+Rq/Z6Or5FKPmhYZWqCRu?=
 =?us-ascii?Q?EcaB83nvYrALuYX22Df594RIJW7tSXe2v300FnayghQ6b1Sv3DraepzsI8z7?=
 =?us-ascii?Q?rytW/2X/Wadr9DWO4EnWbRiFBRGiyVOm4lwv7whS6v1iyp0IdW1W2t2zPJks?=
 =?us-ascii?Q?D/Up+0pT5GzTdlNeGJNZkl2W3sLaQocVVEW509UkgsbR61yAS5A4kGZeIxfu?=
 =?us-ascii?Q?XGUKKpvEQcGI6x2SgCfN/PhIWwQ6HzJy4pYYIdRCgrA7D5WfjS7dWwQF/JfP?=
 =?us-ascii?Q?dQ11NSSTu4971cH1J8oo0iFEJJI6G6b1Qz7qn9K0X+Bd2o1E8g+hDqD7oNfb?=
 =?us-ascii?Q?Jh3nVNVyf5lBQSuNfPMuBHJq2onGj6u2HuX5vuuayjeMQT4RddAkWM6mv+73?=
 =?us-ascii?Q?uJWM30AR1OJ1eR/OEgYqGuwkCgBOQ+JzLnPWVUv2Z/7rKys741fnkts+BuJV?=
 =?us-ascii?Q?xb4rgTFKBMgaheDz5053M+DVIGtboHgjzrWH9iMd36hvdXaY560qGb3+I/Jq?=
 =?us-ascii?Q?BirYcOTthMOyj3wCd8xPCSGrYL23r0qfoiGsmfzC+z+plIpkG3AMysV7bz8M?=
 =?us-ascii?Q?cLT7psrf4KsCqtmFp3I/S2FM9EdgjxpH1/g3aVmbkM35b3KgW/ZBhsnSuSx0?=
 =?us-ascii?Q?l+uyjUiQppORxgJ7fK2BH99YxZY9cfjxQGihKzpDO8S98Xk98L2B9Zcyne3U?=
 =?us-ascii?Q?txencqczgOKe22FpFN/Gs1XvSrZpmuPckUD7MJt/EWOipZtJFDA99myqguOt?=
 =?us-ascii?Q?lVkxoEabRwoI7qqUT40asJyk8kmfLISrlU6hbPhUI4iKxPTPN69on7aE4lSV?=
 =?us-ascii?Q?CTVtl/S7l9TFhPMNBiCWxXxAf4XjUZfJAa/8CR9nhCbKEJf8vb0A4UhuBZd2?=
 =?us-ascii?Q?NoZsc5hMZ5Sbc6jqIBHv8CP3dZka7ul7DAS+N9owyNHdep/donO60wCdy7Og?=
 =?us-ascii?Q?mpNg/PdRG4E2XMk2+89O57RnJeYzkI++V+YInPI3apOUZXDcPoV1xki0n+MQ?=
 =?us-ascii?Q?niprgF5FHzRth6yZhuG/m34b83eAkfJ4ZStEjz8XFUvaCu7fTTQ2EjmHU0/A?=
 =?us-ascii?Q?QPKopzTudfBYGVplqxSUBR6ufqT+J4JIg5q0hIB0xskIajmmGQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY3PR01MB11346.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?yXtqTUeq0KOGUETa6ZgJViKulfj6e886tLVpzI8v13rU1pzMO7QrCpz/fsbn?=
 =?us-ascii?Q?9bCtTh6TSaIM3AWhBDfqD8Eb9qdkOo0BXB56eaxgrO4nfGDYNyA6IYgTJikX?=
 =?us-ascii?Q?y6xq9UoRrxmEtHyOGwDuj6XqNy0nXPuAkxfozxglRgYaYsUqz0OC4SgHmt6x?=
 =?us-ascii?Q?hB5u9JjmJjttgXgEuGzmkdtNxt6xJhU3dg2T1/PQM0R276uBsbpcA3sw1Fet?=
 =?us-ascii?Q?ctPUo6nxpTw9mfzscRcwT5bD496X7lnIhFT7FuOl2Nxo9DeaYL00zdRUzgU9?=
 =?us-ascii?Q?+Kw3KnEjsjRfIRe9YVytFonJl3Dt+agpfUUEGMlQQRerY/wUzGNZdUmrdCTF?=
 =?us-ascii?Q?zRigNkp89NEw0EPFF2Ht400lKBrdxBdhMzFxMHhVesRTpGYOhc4yUpmll2bZ?=
 =?us-ascii?Q?EWQb4+jLpbgYk8qtgB24T31R0FhxKeeG1jdpYmjF3M2JXUSYPKCKqAOZd+ai?=
 =?us-ascii?Q?zvnjX5jJ2oo004IcDmSbX5Ujv7QEnZw674XdpnHtPiYpsqy5wJIAwc/0wFEe?=
 =?us-ascii?Q?6ApXjPypAU7+Qxmg7vRJdpcIVYQvY2uy/u6LSxPfQCmVyuuyeNFjBZO8azSF?=
 =?us-ascii?Q?jUZ35pGd+ANDQJKwhlU1TwmCPQLY3LTuO6EgBAtm/uaGSVwiGY0JRZyML0Wi?=
 =?us-ascii?Q?MB8n+zKlWaiDTVvlBuvSIwJp1U0TZ8/H9oCJVTxdPuwydnTxqgqDkmNDNgwr?=
 =?us-ascii?Q?+ftfQwBTT0jwZcoTMzjS85924sc+4uKuK8gtNw+huFMXaY9GSc47MCVJ+b7V?=
 =?us-ascii?Q?kN/BoOdvMDv9TPt1FIjcjOZTuOi2BbpK6Rj5pZvLWFn4DWGBK7FnnZbHoYOb?=
 =?us-ascii?Q?gDlIqF4Hw0EcLnikY98l/E4bP4u7ufqfvU2nye+HjPPjPPsF799WBg+CIZeM?=
 =?us-ascii?Q?qGvP6vQSkuVb6gH7NDcl7exMk5ouP9V8HpqpNimqRcjCdCS7loc/PzFQPqpl?=
 =?us-ascii?Q?E8DQ0yVGNKBm4l5SlVhk/M5J3gxFK62H1O96/qFgHyjsc9HN0a0PXqFewc9u?=
 =?us-ascii?Q?I5gbh6kKbKO84McBgrIY4WMTjXu4fviHF1RNGBSiYjIgXT0NjuTYXD7VIjKJ?=
 =?us-ascii?Q?mkUTAsDRw3e/+9jdYuqkiMGx7CVy6Cu3WPGZpL6F2ZkhEnCI43puWp6Cf/tJ?=
 =?us-ascii?Q?g/1nYW16ngahZG1LyZabx+PTh7km40rmyH8Px2236H7i+/b1pkKLwIZ8zeo2?=
 =?us-ascii?Q?/fAe+0P2u5CEgpiMlkU4j3meljAaKIoqRbWuiIUow8g4qxGOYvz1v7iXjqob?=
 =?us-ascii?Q?010xVyusbFE6Pc+o7vRdCJGkvrjzYNr1zBwYL1ZtL1IUvxfPD1qj+gJDgMiz?=
 =?us-ascii?Q?en9EoSYASPmWYDXCIAfyef5+Pi+ALIMaBzztBDeULTgkcrzVKavi0ASsd8+g?=
 =?us-ascii?Q?+kld0FG88JZpNJ8krGp8I/BMjPeWWqFWEtO17oQDodWlO53M7BbDz4H1PJUD?=
 =?us-ascii?Q?vi1UwwQ8Xtv6qZMoH8LbOUzzdb7Y06dt1MdfAURW7PJxvYFbC6xvi96AWrDE?=
 =?us-ascii?Q?nqTqpmp9imBSLbTRM77ww/5bF14R1vgnS4B7NdlpzNIt40mFKE34B+b13x39?=
 =?us-ascii?Q?LFxRzKqieeQ9mM90+0USA/lH90ZbrVWGKztbroy0u9BV2a28rmxlpyBLX37K?=
 =?us-ascii?Q?AQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9845fb0-6a51-457f-84a9-08dd0e045808
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2024 10:23:17.5955 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FWJgv9N6e+2lPs9SpSnkhs1/NZ+DLktLxlYBHKhvSEaiBrv/mFZLM4tAuQZnRaUXD4ZQ1WVNdbf+ECy5Bw3Dv7fTeC4tflL6DBscMXpbRJ8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB10326
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

+ renesas-soc

> -----Original Message-----
> From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of To=
mmaso Merciai
> Sent: 26 November 2024 10:15
> To: laurent.pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Kieram Bingham <kieran.bingham+renesas@ideasonboard.com>; David Airli=
e <airlied@gmail.com>; Simona
> Vetter <simona@ffwll.ch>; dri-devel@lists.freedesktop.org; linux-kernel@v=
ger.kernel.org
> Subject: hints around rcar_lvds.c :)
>=20
> Hi Laurent, All,
>=20
> Sorry for bothering.
> Looking for some feedback :)
>=20
> I have a similar rcar_lvds.c IP's to handle but in my case:
> I have lvds0 and lvds1 that are sharing some common regs (lvds_cmn).
>=20
>  ----------------------
> |    -------------     |
> |   |lvds_cmn_regs|    |
> |    -------------     |
> |                      |
> |    -----------       |
> |   | lvds0_regs |     |-----> ch0
> |    ------------      |
> |                      |
> |    -----------       |
> |   | lvds1_regs |     |-----> ch1
> |    ------------      |
>  ----------------------
>=20
>=20
> So I'm checking 2 drm dts/driver architecture:
>=20
> 1st architecture:
>  - Using a single lvds driver to handle both lvds0 and lvds1.
>=20
> 		 ----------------------
> 		|                      |
> 		|                      |
> 		|                      |
> du_lvds0 ------>|                      |----> ch0_lvds
> 		|      lvds_bridge     |
> 		|                      |
> 		|                      |
> du_lvds1 ------>|                      |----> ch1_lvds
> 		|                      |
> 		 ----------------------
>=20
>=20
> Issue:
>=20
> Problem here is the 1 single link 2ch mode.
> lvds0 and lvds1 can drive 2 display with 2 differents fb (fb0 and fb1).
>=20
> Having a single drm_bridge to drive both channel give me the following is=
sue:
>=20
> In single link 2ch mode when for the first time the du encoder drm_attach=
() the lvds bridge to the
> encoder(du) all goes fine and fb0 is created correctly.
>=20
> Then again the du encoder is trying again to drm_attach() the lvds bridge=
 but this return -EBUSY
> obviously because is already attached.
>=20
> Then I think this is not the way to follow because I need 2 drm_bridges f=
rom the same drm drive, and I
> think this is not correct.
> ----------
>=20
> 2nd architecture:
>  - Follow rcar_lvds.c way using 2 nodes for lvds0 and lvds1:
>=20
> 		 ------------
> du_lvds0 -----> |lvds0_bridge|----> ch0_lvds
> 		 ------------
>=20
> 		 ------------
> du_lvds1 -----> |lvds1_bridge|----> ch1_lvds
> 		 ------------
>=20
> Issue:
> I thinks this is an optimal approach but in my case here the problem is t=
hat lvds0 and lvds1 share a
> set of common registers some common clocks and common reset:
>=20
> My plan is to manipulate those common regs (lvds_cmn) using compatible =
=3D "simple-mfd", "syscon"; as
> follow:
>=20
> lvds_cmn: lvds-cmn {
> 	compatible =3D "simple-mfd", "syscon";
> 	reg =3D <common_regs>;
>=20
> 	lvds0: lvds0-encoder {
>=20
> 		ports {
> 			#address-cells =3D <1>;
> 			#size-cells =3D <0>;
> 			clocks =3D <&common_clk>, <&dotclok0>, <&phyclock0>;
> 			resets =3D <&common_rst>;
>=20
> 			port@0 {
> 				reg =3D <0>;
> 				lvds0_in: endpoint {
> 					remote-endpoint =3D <&du_out_lvds0>;
> 				};
> 			};
>=20
> 			port@1 {
> 				reg =3D <1>;
> 				lvds_ch0: endpoint {
> 				};
> 			};
> 		};
> 	};
>=20
> 	lvds1: lvds1-encoder {
>=20
> 		ports {
> 			#address-cells =3D <1>;
> 			#size-cells =3D <0>;
> 			clocks =3D <&common_clk>, <&dotclok1>, <&phyclock1>;
>                         resets =3D <&common_rst>;
>=20
> 			port@0 {
> 				reg =3D <0>;
> 				lvds1_in: endpoint {
> 					remote-endpoint =3D <&du_out_lvds1>;
> 				};
> 			};
>=20
> 			port@1 {
> 				reg =3D <1>;
> 				lvds_ch1: endpoint {
> 				};
> 			};
> 		};
> 	};
> };
> ----------
>=20
> I'm asking to find the best way to represent those IP's.
> What do you think?
> Any hints/tips would be nice.
> Thanks in advance.
>=20
> Thanks & Regards,
> Tommaso
