Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C1ABB951E2
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 11:04:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 057DF10E0DD;
	Tue, 23 Sep 2025 09:04:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="uBTOWON0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazon11010056.outbound.protection.outlook.com [52.101.229.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FB0C10E0DD
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 09:04:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GTtOEYIeACNK7b4lpv5K41midC6xDw1Gr3A1kTx1WlJjy83RDY9TUS1EhosqO+FMpF+iTHdw/KdOzYRPYWZu5t7GPhYz6+hzSaqRZoZfyThOgedh7989c1PIIsrvSKtpSsHa/KgaGMVzj8kHNFUuNBONnptHPTtf3BApAGBnYRtCtRlxqUJ23UbbrPWO1YkJm5niFtAdr3/7lzym+LcX19oPZ+Ce5JykyHr7GtBaTZG9EkXEl/qu2ln/bQUbBSBtYYRWV5GomIN2GYctc+eHPJ7vEe539iBYbEqUH7pWtaSK1lKzQLa2i4eUXPm3kxTZkKIZosYiKmz+bpwrrs+7zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lVyilFmCt1sXzrUji15GqFlGF4u4a6PmLygBV2rmqxY=;
 b=C7+xfdM8cqQJwq8g1WxbhA5119k38tvZH/gl1vlTiTmEjWuI7x/pNz4oJwAYpaV1WaJWryso0R9M8R8p8WnM4otdorLbWjoOJeZ+VjNEsRxoEOEC14Xl1bGaAWvB5593Jvy1du9Pdsm4MMJOUUgcIFtT3/wAacigYWs4Eg0AR3dpkTvjuHVtWQRiUV5Rzw9binSzJfE5ErR4cPVpnIz+20y7g1J8M5qkwZCaequHofJ+IJU9KrI1pb7XY91nJqYqHO61hpwndpZB5cXUdom0M1PHQiqNgIdSg03JF/eaXl2iEddYsTOmCvcn9rtt9Kcd3VbuorFoCjQ3JV2S5WU/1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lVyilFmCt1sXzrUji15GqFlGF4u4a6PmLygBV2rmqxY=;
 b=uBTOWON0JIAzuyWQHB5xTgTGbT6x7rkDK6LjAcEKu9IaPXR58WBsHKFwJ1syMPuPooVCVPYGwHJIbrW/iDFfPCmAXLjZETcYT4Vzg0+SfYpKLzmhSdwelptFZe91tYmSefNxa/B90Fq3g4DOnujVNLttLJ0UbKqMRg6485CAGUs=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS3PR01MB10122.jpnprd01.prod.outlook.com (2603:1096:604:1e3::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Tue, 23 Sep
 2025 09:04:41 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.9137.018; Tue, 23 Sep 2025
 09:04:41 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: "marek.vasut@mailbox.org" <marek.vasut@mailbox.org>, Marek Vasut
 <marek.vasut+renesas@mailbox.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
CC: David Airlie <airlied@gmail.com>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Kieran Bingham
 <kieran.bingham+renesas@ideasonboard.com>, Laurent Pinchart
 <laurent.pinchart+renesas@ideasonboard.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, magnus.damm <magnus.damm@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>, Thomas
 Zimmermann <tzimmermann@suse.de>, Tomi Valkeinen
 <tomi.valkeinen+renesas@ideasonboard.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 4/9] drm/rcar-du: dsi: Clean up CLOCKSET1 CLKINSEL macros
Thread-Topic: [PATCH 4/9] drm/rcar-du: dsi: Clean up CLOCKSET1 CLKINSEL macros
Thread-Index: AQHcK/LmTCgzaExxe06X7PfbHDM01rSgQXgggAA3GoCAAAFOcA==
Date: Tue, 23 Sep 2025 09:04:41 +0000
Message-ID: <TY3PR01MB1134662359F7FADC6919AE0B8861DA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250922185740.153759-1-marek.vasut+renesas@mailbox.org>
 <20250922185740.153759-5-marek.vasut+renesas@mailbox.org>
 <TY3PR01MB11346FE123074366946A24C26861DA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <ce2b5734-4a5c-4d63-be62-fc4c4cf7cfea@mailbox.org>
In-Reply-To: <ce2b5734-4a5c-4d63-be62-fc4c4cf7cfea@mailbox.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS3PR01MB10122:EE_
x-ms-office365-filtering-correlation-id: 236a9bcc-7c08-4609-5f3a-08ddfa803b1b
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?TG13a1FGQzNoZjNleTYvS2FVKzdINW05WUovVFVjQU9ZT3UzQkU0WDRqaVdL?=
 =?utf-8?B?d2xiNlVsWjVhWENKTlY4bjlJWmgzTHlMQWNWV3pyU0VlcEhCaXF4dGhzZTlI?=
 =?utf-8?B?ckNXcnVMK0dUWUNVMnJOTTh2YVlyUXZRY3E0dkl1aE5vVDZDMW1wS1JTN2dq?=
 =?utf-8?B?VGR4MGtmaXR6bS8wWXZOa0RmbGhHeUg0ako4N2hJWWlGQnhvREoxN1Jwc1dW?=
 =?utf-8?B?YmNEYjBxb0FNbGs1OHd6RG11WEdGck0ySGhiNTM1QS9LSkVBSm05ekhXSFZU?=
 =?utf-8?B?WEZoTm4xT09YcUZvQTYzMU5QUmJtRy9zMU8zYVlJTjVXSnRBREZNU3UrZkg0?=
 =?utf-8?B?YjBSVXE4Yyt2S3lRZVd5WkMwa2JCOEpDMjJFRnkyM29JN1FVOWVLcWJrYlZs?=
 =?utf-8?B?SkE0bjF2M2N2MEFCYTdsb21McDZRMUFMbW8yZ1NsclVLcmlSZ3Q1RnM3WGR6?=
 =?utf-8?B?d0RwQzVVMS82VjFkTTZyUE5wc3FIeWxIZjNtM1dHdjdPekxrTkNIWFBUNVg1?=
 =?utf-8?B?eW9aUmRDUHFidnQwQU9hNkt5ZG1RTE81Z2d6RmZzVUpSTnppQm5ET2EzSEJi?=
 =?utf-8?B?R3dFVGlnNWZ3RUdWbVllcXlMU1kwNUZoWFVkZEdTam5UV1F4bTNXLzlVTVJC?=
 =?utf-8?B?c0dTMjdjdEpoV0MvWm9xcUN6Y2Z1YzF5dFF2TjlzeXNUcUNGSnVQWDR5NHZM?=
 =?utf-8?B?VExPM3VzTU1xQklkejM0MFBkSndOeU5XMXRwNWdRZzN0RFp0bE84dG5BRUx6?=
 =?utf-8?B?QnpSNGUzZFdJaitreWdtWmxrYzh5ZEJjcGFHYjlJcTVUN2Z1TEpuamp6VTcz?=
 =?utf-8?B?STFCSHNwUnNlZFZmYitPV2JMQlNuR1F0RGZuQ1lYYldkaXRsSUVtZC9lSlRh?=
 =?utf-8?B?VnNDTUdHZ1pqWFVJVHUxbFpGQTFrZXJycjNucENkWTlQL29nZ3ZwNjF5Tnhm?=
 =?utf-8?B?dUIxbVJFU0RrWlNIU0JoNnNQOWREdUEvVWVvV1M4dnJtaXMyR0NrSmNkbnhD?=
 =?utf-8?B?RzZZTVo0dlFBeVFUYnIrRmdweG9RV09SaXpGd1p1aWJtcng5bFNyYkwyeVJv?=
 =?utf-8?B?cU9BY013bXBHR2dLT2IrcHhOd1E4cklMM0hKMFJ4Rnk3QjlRazhIOTJsQmVs?=
 =?utf-8?B?V2djeGY1d1pCd05TM1R5RzNyK1duclcwenZ0aXMrOFZwQnVoaVU1aFd5Wkto?=
 =?utf-8?B?ZWFJSHhKMHBCU3A2Q0xLTzRLOU1ON1o1ZEUrUHZNcm5XenVXRFdPVmtwWUU2?=
 =?utf-8?B?eTNjMk5OK21wWG83a1ArZUhLaGNMK1kwYTBzSWpXb2R2aythSjI4T0ZrNmhN?=
 =?utf-8?B?S1JVS2lhQXM5TkpaN1JsbXdwcWwyelpWTnNzSi8rd3BwQzdTVVNQTkVmK2JZ?=
 =?utf-8?B?T01XYjZleHdTZ0hQeFZCTzBGZ1ozL2ZnNHFzVGdVNzZSRU5Gak15dG5HT1NX?=
 =?utf-8?B?YUR0WWtrckpFbmpMSlU5RFErQVY3a0wwdlU0SUFyS0Q5SGVoWnFQdEswaCto?=
 =?utf-8?B?bXZONU9iS1lXV0dXWjJzMTdTUEpidjNhdWEwOVV1TENWYnNXeG14dk5pUGRB?=
 =?utf-8?B?MWhNTGJWdVVvNUdjbi9hV1hicDRhTjhhUVQ5VjE4TTdjM2psMHR2SmNJVlNZ?=
 =?utf-8?B?N1NqRWs1RE1Gd2V2aFZuRC90YnZpRHZGY3BnUXV5WnN4UzRnTk1jZ1lnSnhJ?=
 =?utf-8?B?WURjWEF3eFIva1RlelhLWm9nVlBKY3pVK3BkMHJWd2h5Ny85bUFwQStHME1G?=
 =?utf-8?B?MU5nYXpiQzFIcUw1eks5UjIwMVY4NHZVcmgyYTZOTGNzc0lyZ2hLTTV2dE4r?=
 =?utf-8?B?dlpKQmxIYTR3QWJnTkJxOTZDdlA3UUlVUXdBaE15dkNKUzlZMjgrMVlrWis5?=
 =?utf-8?B?cmhhdndaR0JOUFFnZVNrTEVnRWk3ai9BS1FyZVh0Tjc2eW5mcnlDR3dJNjlS?=
 =?utf-8?B?cXNKV2NFeCsrZjFiVHF4V1o0QnZlZGwydTJrc1N2RjhpZ3VMZis5ZkJla3FL?=
 =?utf-8?Q?LttJWwuH1gvEnmhwRaWSRCQIKGnNIs=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY3PR01MB11346.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Rkt3VGlIRmxlU0RwMUIrK0NvZEFGSHhSSmhUaVVXQ1h6OUFhRTNnOGU5dkJF?=
 =?utf-8?B?Q1crNVF3L1I2d08wUnpsRFozY29pM2Fza0U5TVpiVnZXbEc4K3NYM0dzTmlw?=
 =?utf-8?B?eUtjbGNCRUVBWnF3QW9UM2FmNnpRb09EcGtuZmtjTHkybTYwd3diOHc3WXMy?=
 =?utf-8?B?UzVUUDcxQzVaOTdnZGVWSHJ5ZGRyVzUzVEdvbkRoUkx1NUZ2WmxmTDV0ZG9B?=
 =?utf-8?B?UUx2U1BVbEdSMHc2blBUK3lKbGlYMzlYZGRLbnczbnpUeENoL0ZZamJjL1d0?=
 =?utf-8?B?WFI3Qml1cUM1Q0dBUTlUamFxOFpkQ21qdzBNK241RGJyZk5oMUM4cWo2NW5p?=
 =?utf-8?B?YURKMlZJbkNJa1VrTjZmRTNFbWtsaWRTSWEzTGVJQnFhUkJ0VFpLNkZSMzNs?=
 =?utf-8?B?b3kvbUN6R0xUVWNUc2ZXdllMRFNIYWdDY2FqcVU3aDBTSG1uR0dCU01ubDlr?=
 =?utf-8?B?UXMrbHd6ZlV5UUhIOThmSHliQTdMeHRPcG5qQXhGdXk1M2FCTnRLOVorRUxl?=
 =?utf-8?B?VGxGdUNGN3RGTFhWSmJFclh1cmNLbGtMVjhkRmxWQXdtMWY5NnpWMW9HQktQ?=
 =?utf-8?B?MmZNKytVR1ZBR0NnRThBQVNTVFBTcEQ2RFZINWx5NWQ3Z3RhVGl3VHlRVGti?=
 =?utf-8?B?RkZDaUtSbmZySFAzaDJjZW5heXJwTmVZZ0l4S2dNaFNwNzArVGhjWVUrMWU5?=
 =?utf-8?B?M1BWR0JBS0R4cjEvdXh2bnZKSnNvQU1id2d5VlE5TVhCcVNNLyt3ZG1Eemxv?=
 =?utf-8?B?VFhLdjl3QzRLWmFETy9LL2Vsa2FVaFZpTnEweEt5QVR5M3R5UGY3YUI3bjdZ?=
 =?utf-8?B?ZENYOXJ3Qk95RHdrRWxRZk10ZTQ2ZXlmNmd6TnpnM2hlSVdGclllYjExMEJD?=
 =?utf-8?B?d2RPTGtoNWx6QWJzdHRGaHNwbGZwbC9YakhiNVJoTjQ1MVRXZHVVZzd2eUtS?=
 =?utf-8?B?OVp6RnBNbGRQWGpLVzd5OTlEcGsxWXBneTBnL0xmc0pXeHhqYmZUaitaaWJt?=
 =?utf-8?B?U3JyQ1EvUGVEa1RsdUcvSHgwU1ViOWlUM1c4RTRvdUdVejZ4eUhxOE1wUTI0?=
 =?utf-8?B?TU5GTitkM2hQekV3d3cvZ3NGZG92VWZQQXBiWHpVUzE3Zk9VRC9yOGdvOHZj?=
 =?utf-8?B?ZGpwU1BCSTlBdk9RRjgrOEhUWDNObURvcWZkV1JCSHdZRE5UampScHJUb0R3?=
 =?utf-8?B?VzAxV0dvNkdOS3JjUUZFVWFsOHBHbFlQbldBYVhJTGRscWxBVHc2THZRQXJL?=
 =?utf-8?B?MkVHMmttdWlqZU1rbjdBVTg1aFJyMThqMWI4MFd2QVluUzNHd3RQUHNKOUdF?=
 =?utf-8?B?b3hGamJObERDRUdCUEhvWTVZTkFjMElhSzdhVmdSMkZ6U3ZkTHVETGE1T1p3?=
 =?utf-8?B?UEZqK1llNFJvK3lVSHRmTVY4NEhIa1EyNThJdG1CdzJHYXppVkYxcXQza0xo?=
 =?utf-8?B?MUdpVXdxTkV2Qk5uNUVpY0VEakdwWGlrT2FPekdYOG5KMHl6ajRWaWNQWElH?=
 =?utf-8?B?UW4yMm41WnFidnk2cW5GMmhHWlhjWXBqMUw2N1pvY1kvOW5LVnd5NUUrM0U5?=
 =?utf-8?B?L2M3dnhJTzcyWDdXeVY3ZmZNS1pKVFZxWGxWNU5OQ0Y3M3hhWkd2ZlVLbVhO?=
 =?utf-8?B?S21sbG1EZzZhVnp2a09FQmZjaG9IZnhBblpGMllSZ1huWnRsVE1kdnNWdlFB?=
 =?utf-8?B?WVMzRzlhYkpyYUY3OENlVUZZSk1mdzgzMW5GZkFMY0ltZEpibURGQ2dGWHYz?=
 =?utf-8?B?OGxjbytnMmU4K0dsL1B0UnlLeU5XVUkzYXlNSWtmaCt6ejU1d0ZmOFhGQXY0?=
 =?utf-8?B?MDRaK1ZWUkNoRk1iaG1wMVA4UU5uWk56VGl3MDVEdlBqRjdzSUtlTFl3TmVR?=
 =?utf-8?B?L1J6SmFrSXgzN1FENG9hMjFTanhGUEluU3ZZSVg1VGgrODNWM0piSm5kaTM4?=
 =?utf-8?B?eDl6SU1ybThkaDl6RUk5ZkV0NjhuZ20wdG1EaXlBeHdtaC9iV0FObE1CN3Vr?=
 =?utf-8?B?UVpUU0FoV2huL3RGakZCRHJwK0hIZ1pjQTNpNG1UdnhIdG12OC9qZThmaTBz?=
 =?utf-8?B?Z25YVkNYeWVVQ0NEeFU5dmcwZ1h1b1JGV3RveWFqdk1PV3ozNWc5VzlQbktG?=
 =?utf-8?B?aEoreXV5TGpzVytJTmFkSlZUckNmS0REUXV6bzlsMzQ4YzRyUXZPSElnSFJ4?=
 =?utf-8?B?WVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 236a9bcc-7c08-4609-5f3a-08ddfa803b1b
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2025 09:04:41.0677 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SuOle6FZZwHaSaplsOWUfWwiRZvYyUrORB5yfWMTWp9oBzto7pD+IYlmG4+GQHYaDhcqmOrcKZAiZiUo61g/DYYgB8q44D3pjv0v1iqbK7I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB10122
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

SGkgTWFyZWssDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTWFyZWsg
VmFzdXQgPG1hcmVrLnZhc3V0QG1haWxib3gub3JnPg0KPiBTZW50OiAyMyBTZXB0ZW1iZXIgMjAy
NSAwOTo1OQ0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDQvOV0gZHJtL3JjYXItZHU6IGRzaTogQ2xl
YW4gdXAgQ0xPQ0tTRVQxIENMS0lOU0VMIG1hY3Jvcw0KPiANCj4gT24gOS8yMy8yNSA3OjQ1IEFN
LCBCaWp1IERhcyB3cm90ZToNCj4gDQo+IEhlbGxvIEJpanUsDQo+IA0KPiA+PiBJbnRyb2R1Y2Ug
Q0xPQ0tTRVQxX0NMS0lOU0VMX01BU0sgbWFjcm8gYW5kIHJlbW92ZSBiaXRzaGlmdCBmcm9tDQo+
ID4+IHZhbHVlcyB0byBtYWtlIHRoaXMgYml0ZmllbGQgdXNhYmxlIHdpdGggRklFTERfUFJFUCgp
LiBUaGVyZSBhcmUgbm8gdXNlcnMgb2YgdGhpcyBiaXRmaWVsZCwgaGVuY2Ugbm8NCj4gdXBkYXRl
cyB0byB0aGUgRFNJIGRyaXZlci4NCj4gDQo+IC4uLg0KPiANCj4gPj4gLSNkZWZpbmUgQ0xPQ0tT
RVQxX0NMS0lOU0VMX0VYVEFMCSgwIDw8IDIpDQo+ID4NCj4gPiAwDQo+ID4+IC0jZGVmaW5lIENM
T0NLU0VUMV9DTEtJTlNFTF9ESUcJCSgxIDw8IDIpDQo+ID4gNA0KPiA+PiAtI2RlZmluZSBDTE9D
S1NFVDFfQ0xLSU5TRUxfRFUJCSgxIDw8IDMpDQo+ID4gOA0KPiA+PiArI2RlZmluZSBDTE9DS1NF
VDFfQ0xLSU5TRUxfTUFTSwkJKDMgPDwgMikNCj4gPj4gKyNkZWZpbmUgQ0xPQ0tTRVQxX0NMS0lO
U0VMX0VYVEFMCTANCj4gPj4gKyNkZWZpbmUgQ0xPQ0tTRVQxX0NMS0lOU0VMX0RJRwkJMQ0KPiA+
PiArI2RlZmluZSBDTE9DS1NFVDFfQ0xLSU5TRUxfRFUJCTINCj4gPg0KPiA+DQo+ID4gTG9va3Mg
bGlrZSB0aGlzIHBhdGNoIGJyZWFrcyBleGlzdGluZyBmdW5jdGlvbmFsaXR5LA0KPiANCj4gVGhl
cmUgYXJlIG5vIHVzZXJzIG9mIHRoaXMgYml0ZmllbGQsIGhlbmNlIG5vIHVwZGF0ZXMgdG8gdGhl
IERTSSBkcml2ZXIuDQo+IChzZWUgY29tbWl0IG1lc3NhZ2UpLiBUaGVyZWZvcmUgdGhlcmUgaXMg
bm8gYnJlYWthZ2UuDQoNCkNhbiB3ZSByZW1vdmUgaXQsIGlmIHRoZXJlIGFyZSBubyB1c2Vycz8g
T3IgeW91IHN0aWxsIHByZWZlciB0byBrZWVwIGl0Lg0KDQpDaGVlcnMsDQpCaWp1DQoNCg0K
