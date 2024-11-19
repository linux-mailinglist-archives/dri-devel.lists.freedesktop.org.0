Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24AAC9D2DCF
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2024 19:22:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 701B510E0B1;
	Tue, 19 Nov 2024 18:22:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="ckRwh7FR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU010.outbound.protection.outlook.com
 (mail-japanwestazon11011057.outbound.protection.outlook.com [40.107.74.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C45DB10E0B1
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2024 18:22:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M73e1oG80ym+h3ibPvEPvV0ub2Wfj9upKzno3RfFUfl2kq5OCVgJVj9kCIo2TsZU4xTMUwcPy8kk9wMClYpJoPisocQnMr6bAU8Kg3Nm5C4vqILBCH3lT84lpGvJUfqWliKEhxk88ulE3aTfjBMG9GWvrtgPlYNla0U/FOdATuOy3RlK4CqlOs4e1iivVUmjAnXS1ccnxHldYEUdyROrqLmMGVWurIbwuCkE5g5xCuxEOeFWrkqcK6hJhldvf725Ep7AV95bjYTIO/l3XgSy0vaZrn7Rmd1j3HooAzssgXZINs27c8DEQPBt3ehsDf38LioW1Y+vhb/IHHbu/Z50Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zW0p4bJZkkSkraD8q5U6l+z31lr+J2bjMeSWdpbMM5w=;
 b=k2+Lgtz+IRt0Bdvb4w/6NYJEwOkjlfGQYWEmDxlVCF91vEADkqIZp/0gvA5chQezRvNBHkVdORKBORafp7wTmSLUHN00bN6vP5HJxLvXuTbn6Xgceo7YxfXbLPAmBsX2JuEnMOJXDxzH6kchLE0IjBYY3X4QKkYTBsJiyAZwunCTkrA4tpruSoy+PqDGEwNaiXXOH/Y8jAcMevfE+GaACGqH9jGvzFgGVhhVUIiBEFmqegVFcMcl2AaHu1Cdj08SwYLL0Kwk9xUsHzzL2osPdma2crck0JK2RtCy1sau1wIzmEsmlD94eU4AQhHclbUqLe2a/03bWV4yqZY4ryroOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zW0p4bJZkkSkraD8q5U6l+z31lr+J2bjMeSWdpbMM5w=;
 b=ckRwh7FRgvYQKAFi7molODgE364VgXWfsFdnPACH5jBO7ASZ7q1CQDlR4BTPO0kMWmaAkmk8rOcm8eBwRFVkvqLMX/h+dFG1SEFWSbiCsVnfT4di/x69wi79ZWrFn3+VYOwQ0yh3a3RTiQGqpdg/ZvdTIEgulNOnn0w5lodKx5Q=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYCPR01MB9602.jpnprd01.prod.outlook.com (2603:1096:400:193::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.22; Tue, 19 Nov
 2024 18:22:43 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%5]) with mapi id 15.20.8182.014; Tue, 19 Nov 2024
 18:22:29 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: laurent.pinchart <laurent.pinchart@ideasonboard.com>
CC: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Prabhakar Mahadev Lad
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
 <biju.das.au@gmail.com>, "linux-renesas-soc@vger.kernel.org"
 <linux-renesas-soc@vger.kernel.org>, "stable@vger.kernel.org"
 <stable@vger.kernel.org>
Subject: RE: [PATCH v5 1/3] drm: adv7511: Fix use-after-free in
 adv7533_attach_dsi()
Thread-Topic: [PATCH v5 1/3] drm: adv7511: Fix use-after-free in
 adv7533_attach_dsi()
Thread-Index: AQHbOoRpxKPToc9GhUy2EOqf5RQET7K+yugAgAAfzcA=
Date: Tue, 19 Nov 2024 18:22:29 +0000
Message-ID: <TY3PR01MB11346560DF8D4B6BD843297ED86202@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20241119131011.105359-1-biju.das.jz@bp.renesas.com>
 <20241119131011.105359-2-biju.das.jz@bp.renesas.com>
 <20241119162748.GQ31681@pendragon.ideasonboard.com>
In-Reply-To: <20241119162748.GQ31681@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYCPR01MB9602:EE_
x-ms-office365-filtering-correlation-id: 896d38f1-d2dc-4e96-f81c-08dd08c720db
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?MHZzVGlzUVRycHJhYm5zV3Fnc3paV3pQdGIzVGxVOG1zTnhvSEhYTWdZL2JM?=
 =?utf-8?B?cVhPUUZvaVBxN0RGNU9vaGhoN0N0TEIrdlRqcHByYkh4Sk52RUx2WW5BdFlv?=
 =?utf-8?B?S1JUc0VjczBRb3I4RkE2dHZhdlNZVk0ybHhJU1A0UHoyRytzZVZURHo2UDlT?=
 =?utf-8?B?dWQrbHZQRlZuRGUxUmh1Zm9ZcVFKRlA0OUFZNFd6dnp6OHM2MS9nRklpVDQ4?=
 =?utf-8?B?UU92QVlieXhnVzd4UGRINFhZVDFDN01ZYzZ2L3ZIazd4cStQUktFZ3dsMXdr?=
 =?utf-8?B?VEE2R2RCOWg4a2hqblBRTnFGWnJNUnFvZ0tDKzZRV3hKOGx0QjJQcWdLQkZz?=
 =?utf-8?B?WFBCZVluRE5pVVNXOG40alB3dWhXZDJjWVg4c1BFK010bm80SlpKLzRNQlE2?=
 =?utf-8?B?MnNRek9PaDFFMXNhYlRhdWtFR3ViVVNxa1B1VXdWQitJM2Z1Qlp0emZYTW1t?=
 =?utf-8?B?R2NuKzY5V3NlTjNQeTZvbmxjS3hMSFBuejVCM0ZjNkh2WmRPcC9sNWFwV1Zk?=
 =?utf-8?B?S3YxeGpsV0xaNTEyeTY3aklXTExndHc5dVJQMnJYaC9Ya3BpTVZLYWRKMm1W?=
 =?utf-8?B?VW92ZDJYV3hWVDQxRlVKT0R5QnR6VnI4dFA1MDNFaFJ0cXVQYk5aU0dwRWZp?=
 =?utf-8?B?RExVa1FJczcwU2xWcUppRzVvY083aisvOUFZdXpyTFFGM0FzSFA1aG5VUEcz?=
 =?utf-8?B?bEpobnA2QysxdytkVk45RGtxamE3VDA1TTM0QlBLYWRQalNrdERrNllrbS9K?=
 =?utf-8?B?aUlnQS9HZXJqU041cDhOWFNkU3NtZDFiaHhoL0RlbUM0Z3kzOEJFbjg3Y05n?=
 =?utf-8?B?ZnJGVTB3SFdDeit3WERwRjNIWjY1OG55WkUwM3NvL2NFQU1acS9LSzV4ZFVQ?=
 =?utf-8?B?RmFwNmVrMGU1cFlkcDVSeGlWRFZqdVdWdDQwdVJVNThLTklUWm94RWVzeERw?=
 =?utf-8?B?czVMdGIyMFJuRXVvWG93RjN3K3R5U1RoYlBkS0YxcEgrSUQwRWI5VHhkeExr?=
 =?utf-8?B?NmpodjlEZ1l4ckpGeVR5MlA4amlhMDNJWlRZcXc4THhoQXF1d1RyUng4V3BB?=
 =?utf-8?B?V1YzMkdCYUFQakZwRldVMjVDcmJZblBIZVRZWDZLaWgrZzVCLzhHUmlHcnds?=
 =?utf-8?B?aUErdmpsYkpwMkxGaUhmd3NzeU9hZ29SNkk5c3J0TFRZaSt6VjdpWjJyd1dq?=
 =?utf-8?B?UnhpSmNId3NXR0gvcEZ6RDFERU9tdk4rZlVZaWJ1eW91V3FUQm9Jb2s5YU13?=
 =?utf-8?B?aERONWlZTDkwR3pjVzRvcUZDZmZLOE8rV014T0V0dXBtZE1BSmFXOHdtZ0cw?=
 =?utf-8?B?eFFqU1lsT3EySjZ2U2d6WWJQRjZaTXk0b1gyT3kxT1ZZVzZBWjg1UlVmS0J4?=
 =?utf-8?B?NTFJVGZ4Nk5nN0lXSGdnckt5UzN4YkU4b0t6azJRalY5YjkrRXY2eFIxandL?=
 =?utf-8?B?cHN2a0FtSkJ4ZWZsSkZHQVhxdmtudlBraFdsZTNVNndIaHVGUUI3SFZzL2xW?=
 =?utf-8?B?L0FnLzRuTExTMzJFKzU4YW5qcXkxcFRrVThJd0VMcDFBVDJ4RUhzZllYUHcz?=
 =?utf-8?B?czZMeGc0aWVHZFFZVytWL2lKZTB3ZS9KZEhoSE1uUllkdFlWeGE2c3E4UEF4?=
 =?utf-8?B?ZXRxNlVMVm8xekU0dGpraWxsT3lKSzdMOS9PdUFyNkRMRWN4WElWRVg5YVlx?=
 =?utf-8?B?eVJmRFF2Nmd3R09sTkRhWmVKWktKZkxYK1llbnBjWEpQbHp1bjM2aDVkYWR1?=
 =?utf-8?B?R0FRZFJ0WHFhcUNBenlEVmxtZS83OUJxQkpZbHdrTEpQNm5HRzNSVlBCY2R1?=
 =?utf-8?Q?gkdAomWpP7ZWm4AOlgnlUrP4KG0LAAXP0slOU=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY3PR01MB11346.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?elVjQkFwaWJTVll3bkdrKy9jbnUzU3F6L2NWOTN0T2wvMy9UM25CNFgxZmx5?=
 =?utf-8?B?UVB2dGQwaVJIcHd2d0dWSThVY1BFY1A4MnhtcXFmZDI4Qko3TGZvSEd3U2VF?=
 =?utf-8?B?THhhYVFudmNtMHJta05JOWNObmM5NW16d2VreXNTZ2xTbWhjQUp5U1hNeVZa?=
 =?utf-8?B?S1lFRXFaV0hGTHB3YnNObGdmZU15a00vRUlsTkRVT2twL3FrRlpjNWRkYVhp?=
 =?utf-8?B?TDJyWFZYMUtsWnFLSjJQbW00dVJYR1Boc1BIOCtBZCsyTUdGelR3OThxWXZE?=
 =?utf-8?B?a0hIMCsyWlR0bUNFQisrSFlpN0hid05JcTZuZkZJRmxwOG1GZ3FCOFNPU2kz?=
 =?utf-8?B?b0YwazFoakxVR1JVTTdtSWw5aGpFdmc1ajZNdlVaQXlsWW1LTnRUSVl3U0JO?=
 =?utf-8?B?VUxDakZyalNYVGloWGNZYmN4WFk4U2M0ZCtsZG82OFN3cENOMmltNXdyczNy?=
 =?utf-8?B?NzRNNUVzMWJQZFVQcmo3UXNNUlZrNUxreWhuRy9EU2N1SUhoZWtDSmt3elh1?=
 =?utf-8?B?RDU3MzlMak44L2lQV1k3YWErazBSOVpjdUJaanEvYWgxRHh5ajR3WnA4eXVm?=
 =?utf-8?B?WDVlTGJ0eFpUY0dNT3pKdU1wSSt3dWNpNERKNFFlTFVzQ0pkT253SStTUHp1?=
 =?utf-8?B?M2FSWDVxSVp2UFBjRS9nckJxc2FIL1hnWWp3UjBUelY3QmgyRFZZMHVoVHkv?=
 =?utf-8?B?dkVjVmJIU0ZYNjlOOG54eC9JNHl1VGlHeWdSemZNSGx0TU1qZE1HbzBIN2NM?=
 =?utf-8?B?YVlTcWJxb3RlaHlRSVZiajRjNmp2RlZDVWtLcEFjdDVabHZuQTZqK21yWjE5?=
 =?utf-8?B?aXpadlJMaWdiOHlFdkZwaURqb2JUdjBsQWtVN1pJWEIzWURQOTBHMEFQSVFw?=
 =?utf-8?B?V0diNnRGakdId25abEIvMXcwak5ySzVXNkU3SkFSSHFXWlp3SnpXdENDRW16?=
 =?utf-8?B?NTlEQjNhQ08zSFU2dUlaNmVLZ0kvV1JmbkUwenFxUklLcUFKYlFwdTBIa0FC?=
 =?utf-8?B?QkcrdGZXL2x3cnJrUFhNZDFidkk1dk5ibjNoK3ltMSs3SlZwU1ZnTnBhclNM?=
 =?utf-8?B?enBENE1TVHlnMUpYVkQxUzB0eEVtbkxLVXF3TThBM3dSVWVxQkpwYTJWZkxk?=
 =?utf-8?B?ZmcxV2VRSzI4bE9JZmU4K2F2ZzJNeHhEbFJMZHBMMGJMT1RIWWlBODhwT2pu?=
 =?utf-8?B?bVJIRllBVkJSZTNCazZpSUVhMmZCZW4zT2UxQUxROXpVVU4zWDlVN3VsWG1O?=
 =?utf-8?B?SDlyckV3Yks4M0tjeWkzbXRUckdMMTBjUFE5aVNjS3dWZHRwR2xMeVlVR3Rw?=
 =?utf-8?B?ZmVRdHc0QVhkY0I1SjBJY21iZDdnV0ozUnhLSjZSM1BMbDJkbDVoalQ0ckh3?=
 =?utf-8?B?bGhTNFdwZEN3a3F3dkFuY0RCdzJ1akpQSGtlSFVndVJaUGhZVEVraWFKTG1W?=
 =?utf-8?B?ZmdEVWl0OEtZOHdnUUxLSDNMelJuZWx1dk5Ia1dLNTFOWGExSFdOYllDaGM1?=
 =?utf-8?B?M09YazVZSVdkZGNlZG1QL3hBeFQ5K1N2Y05LM2NlWmJ6MXMzNGZ6cFFNZC9a?=
 =?utf-8?B?VC9iMmZYNnFJM2xjRDkxbHQydnBWcGJMdmRqdDZwS3piVWV6d2UyOTIycUtS?=
 =?utf-8?B?NE1BN0QrSGNDTVFpSWpmaW9WOFl4TDYzbFYxWHZPcGtWcUdaQkk2a2RyUCtx?=
 =?utf-8?B?VFRSaEgrbWQvNTZpV1dSTkYvVmN6alNXR3JaTTJybndkSTcyM3lFK0kyZXBV?=
 =?utf-8?B?YlhRb3JHYi9YdTN6Q2w0YTIyOUp1b2pLZ0c3QzNhbHNRNUtJLzFqYSt0cHBn?=
 =?utf-8?B?TStsMGl0UU9YUTRzZWc5SUkvVXFuaEpkQjhwZnM0T2EybG85dWxTd2NiQWcy?=
 =?utf-8?B?a3dlUW9UTDhMZld4MHNFN1BEejVFZWJXbXA3ZG9BS1pETmh5dUVUdVJkck92?=
 =?utf-8?B?L2Urd2Fmd3ZWZTV2SVJSOHpwQ0dPVHBwRlpVWmM2WCtSY3Q1SVl5elhvS1R0?=
 =?utf-8?B?RUpjOVJ6MG5BKzBuOHdFN3RFNzVSaVBiSFBGNVlCc21wNEMrV3BCeFUydkZI?=
 =?utf-8?B?eGJpaTFQbGwrSnNhVFVvSE5yaTdxRE8wcjdEeW54YTN0UElWWlFWWmZuUk41?=
 =?utf-8?B?WEVRMTNSdGRnZVQvYXdWMWlwZ2NvaTlLZFpHSVpDVVZCN0RWT3NzbWNteEs2?=
 =?utf-8?B?UEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 896d38f1-d2dc-4e96-f81c-08dd08c720db
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2024 18:22:29.8800 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SDDl1eOlwx4OHQtfMz6cOQj+aigP7Q8BpC53tl+lT+s+ohZyagnRGKWseEzQZtniQLUUMHUHuPrOjaE3WblCw9qvw4l/2obsYn2Iq4RQyVA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9602
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

SGkgTGF1cmVudCwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBMYXVy
ZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+DQo+IFNlbnQ6
IDE5IE5vdmVtYmVyIDIwMjQgMTY6MjgNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NSAxLzNdIGRy
bTogYWR2NzUxMTogRml4IHVzZS1hZnRlci1mcmVlIGluIGFkdjc1MzNfYXR0YWNoX2RzaSgpDQo+
IA0KPiBIaSBCaWp1LA0KPiANCj4gVGhhbmsgeW91IGZvciB0aGUgcGF0Y2guDQo+IA0KPiBPbiBU
dWUsIE5vdiAxOSwgMjAyNCBhdCAwMToxMDowM1BNICswMDAwLCBCaWp1IERhcyB3cm90ZToNCj4g
PiBUaGUgaG9zdF9ub2RlIHBvaW50ZXIgd2FzIGFzc2lnbmVkIGFuZCBmcmVlZCBpbiBhZHY3NTMz
X3BhcnNlX2R0KCksDQo+ID4gYW5kIGxhdGVyLCBhZHY3NTMzX2F0dGFjaF9kc2koKSB1c2VzIHRo
ZSBzYW1lLiBGaXggdGhpcyB1c2UtYWZ0ZXItZnJlZQ0KPiA+IGlzc3VlIGJ5wqBkcm9wcGluZyBv
Zl9ub2RlX3B1dCgpIGluIGFkdjc1MzNfcGFyc2VfZHQoKSBhbmQgY2FsbGluZw0KPiA+IG9mX25v
ZGVfcHV0KCkgaW4gZXJyb3IgcGF0aCBvZiBwcm9iZSgpIGFuZCBhbHNvIGluIHRoZSByZW1vdmUo
KS4NCj4gPg0KPiA+IEZpeGVzOiAxZTRkNThjZDdmODggKCJkcm0vYnJpZGdlOiBhZHY3NTMzOiBD
cmVhdGUgYSBNSVBJIERTSSBkZXZpY2UiKQ0KPiA+IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3Jn
DQo+ID4gU2lnbmVkLW9mZi1ieTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29t
Pg0KPiA+IC0tLQ0KPiA+IENoYW5nZXMgaW4gdjU6DQo+ID4gIC0gVXBkYXRlZCBjb21taXQgZGVz
Y3JpcHRpb24uDQo+ID4gIC0gcmVzdG9yZWQgaG9zdF9ub2RlIGluIHN0cnVjdCBhZHY3NTExLg0K
PiA+ICAtIERyb3BwZWQgb2Zfbm9kZV9wdXQoKSBpbiBhZHY3NTMzX3BhcnNlX2R0KCkgYW5kIGNh
bGxpbmcgb2Zfbm9kZV9wdXQoKQ0KPiA+ICAgIGluIGVycm9yIHBhdGggb2YgcHJvYmUoKSBhbmQg
YWxzbyBpbiB0aGUgcmVtb3ZlKCkuDQo+ID4gQ2hhbmdlcyBpbiB2NDoNCj4gPiAgLSBVcGRhdGVk
IGNvbW1pdCBkZXNjcmlwdGlvbi4NCj4gPiAgLSBEcm9wcGVkIGhvc3Rfbm9kZSBmcm9tIHN0cnVj
dCBhZHY3NTExIGFuZCBpbnN0ZWFkIHVzZWQgYSBsb2NhbCBwb2ludGVyDQo+ID4gICAgaW4gcHJv
YmUoKS4gQWxzbyBmcmVlaW5nIG9mIGhvc3Rfbm9kZSBwb2ludGVyIGFmdGVyIHVzZSBpcyBkb25l
IGluDQo+ID4gICAgcHJvYmUoKS4NCj4gPiBDaGFuZ2VzIGluIHYzOg0KPiA+ICAtIFJlcGxhY2Ug
X19mcmVlIGNvbnN0cnVjdCB3aXRoIHJlYWRhYmxlIG9mX25vZGVfcHV0KCkuDQo+ID4gQ2hhbmdl
cyBpbiB2MjoNCj4gPiAgLSBBZGRlZCB0aGUgdGFnICJDYzogc3RhYmxlQHZnZXIua2VybmVsLm9y
ZyIgaW4gdGhlIHNpZ24tb2ZmIGFyZWEuDQo+ID4gIC0gRHJvcHBlZCBBcmNoaXQgVGFuZWphIGlu
dmFsaWQgTWFpbCBhZGRyZXNzDQo+ID4gLS0tDQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2Uv
YWR2NzUxMS9hZHY3NTExX2Rydi5jIHwgNSArKysrKw0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vYnJp
ZGdlL2Fkdjc1MTEvYWR2NzUzMy5jICAgICB8IDIgLS0NCj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCA1
IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2JyaWRnZS9hZHY3NTExL2Fkdjc1MTFfZHJ2LmMNCj4gPiBiL2RyaXZlcnMv
Z3B1L2RybS9icmlkZ2UvYWR2NzUxMS9hZHY3NTExX2Rydi5jDQo+ID4gaW5kZXggZWI1OTE5YjM4
MjYzLi42Y2ZkZGEwNGY1MmYgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRn
ZS9hZHY3NTExL2Fkdjc1MTFfZHJ2LmMNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdl
L2Fkdjc1MTEvYWR2NzUxMV9kcnYuYw0KPiA+IEBAIC0xMzYzLDYgKzEzNjMsOCBAQCBzdGF0aWMg
aW50IGFkdjc1MTFfcHJvYmUoc3RydWN0IGkyY19jbGllbnQgKmkyYykNCj4gPiAgCWkyY191bnJl
Z2lzdGVyX2RldmljZShhZHY3NTExLT5pMmNfZWRpZCk7DQo+ID4gIHVuaW5pdF9yZWd1bGF0b3Jz
Og0KPiA+ICAJYWR2NzUxMV91bmluaXRfcmVndWxhdG9ycyhhZHY3NTExKTsNCj4gPiArCWlmIChh
ZHY3NTExLT5ob3N0X25vZGUpDQo+ID4gKwkJb2Zfbm9kZV9wdXQoYWR2NzUxMS0+aG9zdF9ub2Rl
KTsNCj4gDQo+IFRoaXMgd29uJ3QgYmUgY2FsbGVkIHdoZW4gYWR2NzUxMV9pbml0X3JlZ3VsYXRv
cnMoKSBmYWlscyBhcyB0aGUgZHJpdmVyIHJldHVybnMgZGlyZWN0bHkgdGhlbiwgbGVha2luZw0K
PiB0aGUgcmVmZXJlbmNlLiBZb3UgbmVlZCBhIG5ldyBlcnJvciBsYWJlbCBhbmQgYSBnb3RvIGZv
ciB0aGF0IGVycm9yIHBhdGguDQoNCk9vcHMgbWlzc2VkIGFnYWluLg0KPiANCj4gSW4gdGhlIGZ1
dHVyZSwgd2hlbiB0b3VjaGluZyBlcnJvciBoYW5kbGluZywgcGxlYXNlIHRyeSB0byBjaGVjayBl
eGlzdGluZyBlcnJvciBwYXRocyBhbmQgdmVyaWZ5DQo+IHRoZXkncmUgc3RpbGwgcmlnaHQuDQoN
Clllcywgd2lsbCB0YWtlIGNhcmUgbmV4dCB0aW1lLg0KDQpDaGVlcnMsDQpCaWp1DQoNCj4gDQo+
ID4NCj4gPiAgCXJldHVybiByZXQ7DQo+ID4gIH0NCj4gPiBAQCAtMTM3MSw2ICsxMzczLDkgQEAg
c3RhdGljIHZvaWQgYWR2NzUxMV9yZW1vdmUoc3RydWN0IGkyY19jbGllbnQNCj4gPiAqaTJjKSAg
ew0KPiA+ICAJc3RydWN0IGFkdjc1MTEgKmFkdjc1MTEgPSBpMmNfZ2V0X2NsaWVudGRhdGEoaTJj
KTsNCj4gPg0KPiA+ICsJaWYgKGFkdjc1MTEtPmhvc3Rfbm9kZSkNCj4gPiArCQlvZl9ub2RlX3B1
dChhZHY3NTExLT5ob3N0X25vZGUpOw0KPiA+ICsNCj4gPiAgCWFkdjc1MTFfdW5pbml0X3JlZ3Vs
YXRvcnMoYWR2NzUxMSk7DQo+ID4NCj4gPiAgCWRybV9icmlkZ2VfcmVtb3ZlKCZhZHY3NTExLT5i
cmlkZ2UpOw0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2Fkdjc1MTEv
YWR2NzUzMy5jDQo+ID4gYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2Fkdjc1MTEvYWR2NzUzMy5j
DQo+ID4gaW5kZXggNDQ4MTQ4OWFhZjVlLi41ZjE5NWU5MWIzZTYgMTAwNjQ0DQo+ID4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hZHY3NTExL2Fkdjc1MzMuYw0KPiA+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9icmlkZ2UvYWR2NzUxMS9hZHY3NTMzLmMNCj4gPiBAQCAtMTgxLDggKzE4MSw2
IEBAIGludCBhZHY3NTMzX3BhcnNlX2R0KHN0cnVjdCBkZXZpY2Vfbm9kZSAqbnAsIHN0cnVjdCBh
ZHY3NTExICphZHYpDQo+ID4gIAlpZiAoIWFkdi0+aG9zdF9ub2RlKQ0KPiA+ICAJCXJldHVybiAt
RU5PREVWOw0KPiA+DQo+ID4gLQlvZl9ub2RlX3B1dChhZHYtPmhvc3Rfbm9kZSk7DQo+ID4gLQ0K
PiA+ICAJYWR2LT51c2VfdGltaW5nX2dlbiA9ICFvZl9wcm9wZXJ0eV9yZWFkX2Jvb2wobnAsDQo+
ID4gIAkJCQkJCSJhZGksZGlzYWJsZS10aW1pbmctZ2VuZXJhdG9yIik7DQo+ID4NCj4gDQo+IC0t
DQo+IFJlZ2FyZHMsDQo+IA0KPiBMYXVyZW50IFBpbmNoYXJ0DQo=
