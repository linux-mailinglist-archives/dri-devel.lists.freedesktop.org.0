Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 115ECA6C8F6
	for <lists+dri-devel@lfdr.de>; Sat, 22 Mar 2025 11:13:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3D7B10E05F;
	Sat, 22 Mar 2025 10:12:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="TLtq42kQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazon11010035.outbound.protection.outlook.com [52.101.229.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6820A10E05F
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Mar 2025 10:12:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w9ylpf539D/vISxtxPbpC3nx6HRG/l8QQIibmXooiyh7LnUQm32FLvwqQFqe7OuRpNhcYpILaU9yXFVvsbcjV/4bn529aMTFW6Syx7bbxKjVstzg+7Tkf1L6hV29r5W1uFp8kw2/JIGQxL4JrM0j0piXjc4XrJo0E25QPIuE9UuCQriSL+H3HMtigaQ/A/U4Yri7UHGn9HODYNk+zD13iIfD2i+DR49toKnxtTmh+xEEzvK2l0bJ8o19w4I6rVAOjpnHL8dZ9xgNhRHRK8VUua8nZJndLp9AVfBUNyLunLMjJqYhIi3iIIFUAg2r81F6NTSXywdB7lP6KVjs5rjI1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T6bJkjJpIrCzUfOhfkOOf0ezb3S4zv3+rjYHK7SfTEk=;
 b=wvlu2DMRB0vt0hypOf/1HUB2ISHGwX1ahrU3As/A5AywlDg0Ur1q+lf7g/hCduO37zW8gJCSfAsgnnA2RQLEc7LOCy5yaFZLzr4U2rFCtRZkAuh8n7MlG/MRORNb+CpTpY216b2v1m3nrzOnKpeT9KiwFTfbcj6hH8wDJnMwiv3gF+WcignnILtyFT71DC+DMAUL7rWu+oTvB8t1TmKLSM5QYwJ2xn+exq3upSxwmYIGy2LUu2eypXiRFLEQMD0WxhWhKrde2kYKCKVqAgYbsRRAO47Rprf+mK3AI0o6ozJRKnb7T2/tFUeA1IrE/8vuASi/dZof8PVSuIhq0576ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T6bJkjJpIrCzUfOhfkOOf0ezb3S4zv3+rjYHK7SfTEk=;
 b=TLtq42kQHgITBLqQ9pmRH4gpl9UCUtBfIuDebrc92XNtz6/Fo6OVa8Mc/AXDv2TiDslEJcc4sFY2IusMizzNF06yNr9YMezZtrwHAa1fzSy8GGzXIupww6JCWagiq9Ina57rjrxqhu6aGUpdEfrQgv+PCMhkyCAOgLvkOKT04Es=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYCPR01MB10294.jpnprd01.prod.outlook.com (2603:1096:400:1d6::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.36; Sat, 22 Mar
 2025 10:12:51 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.8534.036; Sat, 22 Mar 2025
 10:12:51 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>, laurent.pinchart
 <laurent.pinchart@ideasonboard.com>, kieran.bingham
 <kieran.bingham@ideasonboard.com>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Kieran
 Bingham <kieran.bingham+renesas@ideasonboard.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Subject: RE: [PATCH] drm: renesas: Extend RZ/G2L supported KMS formats
Thread-Topic: [PATCH] drm: renesas: Extend RZ/G2L supported KMS formats
Thread-Index: AQHbmoXW/Qd0guXlTECRlfOEZqHWarN+LXIAgACy3dCAABAT8A==
Date: Sat, 22 Mar 2025 10:12:51 +0000
Message-ID: <TY3PR01MB1134694B056667D0B3D18FA2086DA2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250321172220.867165-1-kieran.bingham@ideasonboard.com>
 <20250321223320.GC11255@pendragon.ideasonboard.com>
 <TY3PR01MB113464BBE3B26F4C1489BA36D86DA2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB113464BBE3B26F4C1489BA36D86DA2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYCPR01MB10294:EE_
x-ms-office365-filtering-correlation-id: 768ec7f1-7723-4105-dfb4-08dd692a1acd
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?NG5EUDNxNnRVdEExcm9DcStlQnlHQjFFOERreExmdWw5V1lqMDFsa2NiTTNV?=
 =?utf-8?B?NkcxTmpUNFVOVXlYcnZzSldyUTNEbGRDR1Y3MDNIZWdsMHRxazZ0NmdISkg1?=
 =?utf-8?B?MWI2UE1RTkJrN3RlR3I2WmF2aHoyNmRVZUpyRVdja0NHWEFRL0Jnam83L29U?=
 =?utf-8?B?dnpPQzRYOVRnWVhSTW5DYWNETHlKSVlQWU03QTRMc3hQeGNidm1HTjRTOVpV?=
 =?utf-8?B?bEVGL1MrMVJ5d0VPV1FDZk1aY29aY1YwUU5oOWhkTGpIMlpwVHhNSWxCK29t?=
 =?utf-8?B?OXVqTHZoa2Y5Zm0wdGwyWHZMa0x3YW1vWkhHa01ZemxRb0UwWFRMNkQ3VjRa?=
 =?utf-8?B?NTl5UXR1Y24ycEpRZ2h1WEtzWVd5S2Z6VCtjdGp5dFo0ZDVRK0MyYjVUWm4x?=
 =?utf-8?B?QnM0aGlVL3MvVGY4OGM0bXFqc3pnU09xZUtkbXdaWjhXTXhWQTJBZlJtc3RJ?=
 =?utf-8?B?Q08vNldxTEF2emdRTVoydkF2SnpmNjlveG9TZHJnQ1FJMCtQbGgxQldkQStP?=
 =?utf-8?B?WTdnQk44bEhRSU5MeG5DRW8xVndhMTl0SFhrczZoMUhIT3p6aVNTb0tsT3dh?=
 =?utf-8?B?UDEwOEUxbmx3TXVGUmx5Q1E2ZEp2Q0pvbVEwNlkyamN3WHR0c2t6U3VLNmZH?=
 =?utf-8?B?N1hvN1dFNTFoQ1ROSUtxalJpcS9KVUh5UEM2ek9VVXN6Wk14WGhYZHEzK2hR?=
 =?utf-8?B?RldlTUlLUHh5b3d5bUozdGI2blowUEhLd1ZVaXRvRWFoWUhwRmJiY0wzWEUy?=
 =?utf-8?B?eGhFdEZDcmJKM3ZSQlcyejhRN1I1VmVaTCtkRlZPcEcraElxbDMzNXExSnZX?=
 =?utf-8?B?Ylo2WC9PckR0R3FtZExqYkNodHpucVQ1bGhqbXc2OWsyejV0U3lPVnhMT3Za?=
 =?utf-8?B?Z05oM1oveElpTzJ5eGNyL1hjVFZTWGtORW9Pa3VRcWdMRXBMNUlEdTgycUlP?=
 =?utf-8?B?WjZzamx1RUFLNVBtZVJ6RHNvY2h4cGhQaVI2bWpXdjg0K0VONkZaYytyWFhE?=
 =?utf-8?B?Nk9mWUpDZnJJV3k1M0w1UnFtcTlvZkduUnJrVHVvVVFsU1BjMmdXTjdiOFZG?=
 =?utf-8?B?aDUyUnQramJVT05zZjNhWGU2L2xKT0NTNTZJUkxoNkZrUmx1eXlMZ3NvcDJP?=
 =?utf-8?B?cDJrMXRndlVQeHlVdGVqUngwNzB6UTRXcnVTbU4zM1k1V0F5Z3FyWWdEUXFq?=
 =?utf-8?B?ajl0VGF5Y2lXaTU3Z0l0WmNnTW1WcG9MdVdKcmZTWlY5TnBBNWx2V05ia3Zm?=
 =?utf-8?B?MitGanE4em1qM0FsN2ozTldZUkt6bnIyTm10Q3BGVnQvSmVaRnl2U29PSWpR?=
 =?utf-8?B?WVN6QS9wL3dvWFVzYlBWQ2k0UVBPU2szalFJeHJ1cnFHMlY5WWxCV3dtQTZ2?=
 =?utf-8?B?ekVkM3lQM3dwRmc1dnNmanYxZkpraEtTRS84cTlGRDNnSHB1SEJKZ0w5bG1t?=
 =?utf-8?B?dVJpa3pQeTFQSWFjU09qZURHWDhVZGQ5VVhVRVgyREFkbXJkT2Q4SUc3R3JU?=
 =?utf-8?B?ZmFzazUrU0MxcHNncHhKSWg5WHhDb1VIQUVpZy9mQUNFMEpJYlJWTUp6MDBa?=
 =?utf-8?B?eklGV0VHaTdUeUJub0ZjSFI1Y3VrQnF5cmpXVnV1d09URy9VRnA0ZTFoWHJz?=
 =?utf-8?B?MkVkQVhyNnRkQnRlM21XRnRycEtEWDBCREw5ZjEzMGlRN1JMbk9YMjF3Y2xM?=
 =?utf-8?B?Nk5HOGlSVEc3Q3ZOMjIzQUpVa3JKalc5QXNzd2VJNlphUHhCZlc2Z0dXV1FI?=
 =?utf-8?B?Tk5ITG04aytaSytrR0JPTzFFYTQ2bWludHdKZDlmd2x6aG1MU3plaVBibHps?=
 =?utf-8?B?VWh1ZmRtY0tqSW1CZVdXSm9neUhKeGZIT0hzUDZXeUZRYWFwa2VVbUxDZDdj?=
 =?utf-8?B?eWhWQnpKdUo3RGhndEpvVHBDSGZRWnVjUUVoV0RjcFBpcjUvSnNXYmF3UWN5?=
 =?utf-8?Q?6EiFDNw8v9rUde7o3l8vImzK5fLu2o0U?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY3PR01MB11346.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WkwwWHNXY3F4RzZJWkZWWmo2Q0Npc05ZaUl6SjdqK0YzUFVncWhsek9laWJC?=
 =?utf-8?B?TjJZVmtJY0ZONkt6ZUk5VEhRSmFtQTZsT0g3RnArMmNVWVNMMjg4a3VkZTQ3?=
 =?utf-8?B?ZHhQYkxEVkM4MlVoY2RDd1M2QTFHNkxRWVA3dXd0OEtCbG1FSWpraTMza1Zz?=
 =?utf-8?B?dXNrcHdFQk9OWWtPNzhrM01UcnZETkpLUjlPVkFCU095bE5GNWwxdXllS1Jo?=
 =?utf-8?B?QzAwd1psL2xCUDN3WXZMeXVPRkxoN0ExZmZYT2FUTkZrNGVJOC9nbHMxUGgr?=
 =?utf-8?B?YVBkVlE1OWhSYkFTUVZIdmFIWDg0bnJab2lqK3FzUVd5RTBLa005clB2bW9I?=
 =?utf-8?B?a2V0M3pMMVFvNklybVc5MUw2dlNob1YzcXhFbW84b0E5ZVo0MG1UOXpDWnBI?=
 =?utf-8?B?SUF6WnVLWTdwRnNlMnlPVkRoTnQ5TmxBRGYyRmI5U1JSVmF1S1ZIdUtVSTdn?=
 =?utf-8?B?WEI3eXVNbXpwM3YvMDczc2tGekorcVJpbjRsTVd4UGo4VnZLZkdweGNteFp2?=
 =?utf-8?B?b1AvTHEvSSs5Ni9UcVEzWC9oUjZqRnhtaXc0cXB3SnV2MjV1UVlTUFh6UU5y?=
 =?utf-8?B?aEpwYzQ0dXdITWZ2c3RDVUR0MXpiOXV0NUdxTWRiNndscFRrb3J2eWJKR2tB?=
 =?utf-8?B?bEY4QUhuc3p3cVRtc2xOT2p6dkhoMi82dGFWQWJvUURSbTBHcjJ6T1Q3aGlq?=
 =?utf-8?B?S2pxQTI2V2JUcHVtYkNYcllXeDZSNWwrNlV2aFF0dWxkUlU3K1lYSlh4V1BV?=
 =?utf-8?B?RjFXWU55YjcrU1VKdmU3S21HaXlwbzRwNHFqZEhyYUJGNFAvRVpuZDlST2lD?=
 =?utf-8?B?MVhtSjFVTFRvUkZGa2xaK1VESFp4Rk9Ta1V4S2Rra0lxWmlqZWhpL0JVTEd3?=
 =?utf-8?B?WEV6MTIvR29NM2JmSVV0cVQ4Q0t0cjlTTFB6R3p4MzVNZnBVb2RuUjZzWi80?=
 =?utf-8?B?TURPSDFGZi9aY0xXbW5LTnlrSjNCSndDQTQ4Z3NlVElZblBKTis1bHJpQlFa?=
 =?utf-8?B?cElkeDhJQnhWQUtsZk81MkVxVUNFWXFUVCsvRWc3VG52ZGlETGowbnREMXg5?=
 =?utf-8?B?N01VUXh6d3RST3ptdDdzK0JZRUdrRUZ6cVdxV09mV3M4cGl6TTFHU2kxTVpx?=
 =?utf-8?B?byt1WmdGbzRDMTBkQTJpQ0c1ejhxVVN4ZzRCbjJFREJTM1lOdDQ0ME0zT21x?=
 =?utf-8?B?ajJSWS9Pb1JiTkVkSXdHS3ZkU1A0RzlLTW5pWHlSczlrRWk3eTJORU5xSFdZ?=
 =?utf-8?B?azZPUEhaSmlibzN1ZW5rSU9kckw4akY5SDRYVkZPZjJmRHg0RDNuR05oR1VJ?=
 =?utf-8?B?M1VFRTBqbkQrYmlQY3huU094ODJXTVBXL0NJMnlYTWU4c294Tzg0eGdmT2dX?=
 =?utf-8?B?SnFQM0FGL1l0OEVnSlI2akhDOGFWTEdZVDNiZWlCdDl0M1JQNG8xdGRDMEYr?=
 =?utf-8?B?R0hhblQ0a1JDQkFncTg2Lzc0TkVaRGtqOU9YWHo0YmVTSzVNam5zTC9QTHg2?=
 =?utf-8?B?SmludkoxenBQNTRCL2hHbzdhaFl0Q2laZWZZcWJzem1sZ1pMWXZYb1l2WUx3?=
 =?utf-8?B?RTB5Ynd2UXdtNi9zbkdETFhienJ6emp6ZzJlSGdwU1ZjMytpSldkUjhCQnZi?=
 =?utf-8?B?cms2YytyMTZIZDRkRTdtZFJTSU93eWVsYTVwcXkydHV2M0RtRDVOSWc4UWNV?=
 =?utf-8?B?bHkvTUFPankxTndvRU0yM2pHdU12UjByTDV6djJ2eEJNTWJhWHJTbEFQNjBy?=
 =?utf-8?B?Y2J3TjR5VzlIUzhubXdQWDVGK2pQOEZEYk1yS3JFa0FKZ2U2KzA2RVNCV0Nh?=
 =?utf-8?B?R0pDMldrTTZ6UktESFk4aGdxS3RxeGx1Q08rRWhDM1l3TU84VTg5d1JWdmdS?=
 =?utf-8?B?ZndzdXNpaTBmRXBJdVBGTk5EYVE2bDZjekt6ckZ4M2V6Y0RVZXpBSDBVbW4y?=
 =?utf-8?B?QUxGWDhSNXJkbUhZS1k4cVlBcGdaNmRJZG1JY0lGcUFTUStWQ3J0YmlYVFRX?=
 =?utf-8?B?WkVaNlVmYTBWZElFRFA5RC9UYjdsSnY5TDBWRXBONlprc1J3ZFpSTkhYRkh4?=
 =?utf-8?B?aUpQT1o3SEtSS2hOUVRyUkxpb2ZKbmtoZzIwVWpWVEd0MFo4NVYyRk1ZdVMw?=
 =?utf-8?B?QWt3ZWQ3WjBGNExNeXd6cnZMeDBNNlA3UHBEY3V1a0pxeDFCUkprVmNQMHQx?=
 =?utf-8?B?Vnc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 768ec7f1-7723-4105-dfb4-08dd692a1acd
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Mar 2025 10:12:51.5178 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7XxL/Bhy9o3EjE4rH30HehYYq8X87E/JgxdXrDkmBxnIHV/xFyVQrKXtGX0SAdpI+BgsQgDnNlWMsizN8d1KZnY5rzwxlgUAFyHI7jCD3Ys=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10294
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

SGkgTGF1cmVudCwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBCaWp1
IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+IFNlbnQ6IDIyIE1hcmNoIDIwMjUg
MDk6MjkNCj4gU3ViamVjdDogUkU6IFtQQVRDSF0gZHJtOiByZW5lc2FzOiBFeHRlbmQgUlovRzJM
IHN1cHBvcnRlZCBLTVMgZm9ybWF0cw0KPiANCj4gSGkgTGF1cmVudCwNCj4gDQo+ID4gLS0tLS1P
cmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiBGcm9tOiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50
LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+DQo+ID4gU2VudDogMjEgTWFyY2ggMjAyNSAyMjoz
Mw0KPiA+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIGRybTogcmVuZXNhczogRXh0ZW5kIFJaL0cyTCBz
dXBwb3J0ZWQgS01TIGZvcm1hdHMNCj4gPg0KPiA+IEhpIEtpZXJhbiwNCj4gPg0KPiA+IFRoYW5r
IHlvdSBmb3IgdGhlIHBhdGNoLg0KPiA+DQo+ID4gT24gRnJpLCBNYXIgMjEsIDIwMjUgYXQgMDU6
MjI6MTlQTSArMDAwMCwgS2llcmFuIEJpbmdoYW0gd3JvdGU6DQo+ID4gPiBGcm9tOiBLaWVyYW4g
QmluZ2hhbSA8a2llcmFuLmJpbmdoYW0rcmVuZXNhc0BpZGVhc29uYm9hcmQuY29tPg0KPiA+ID4N
Cj4gPiA+IFRoZSBSWi9HMkwgZHJpdmVyIHV0aWxpc2VzIHRoZSBWU1BEIHRvIHJlYWQgZGF0YSBm
cm9tIGlucHV0IHNvdXJjZXMuDQo+ID4gPg0KPiA+ID4gVGhlIHJ6ZzJsX2R1X2ttcyBjb21wb25l
bnQgbGlzdHMgYSByZXN0cmljdGVkIHN1YnNldCBvZiB0aGUNCj4gPiA+IGNhcGFiaWxpdGllcyBv
ZiB0aGUgVlNQZCB3aGljaCBwcmV2ZW50cyBhZGRpdGlvbmFsIGZvcm1hdHMgZnJvbQ0KPiA+ID4g
YmVpbmcgdXNlZCBmb3INCj4gPg0KPiA+IHMvVlNQZC9WU1BELw0KPiA+DQo+ID4gPiBkaXNwbGF5
IHBsYW5lcy4NCj4gPiA+DQo+ID4gPiBUaGUgc3VwcG9ydGVkIGRpc3BsYXkgcGxhbmUgZm9ybWF0
cyBhcmUgbWFwcGVkIGluIHJ6ZzJsX2R1X3ZzcF9mb3JtYXRzW10uDQo+ID4gPg0KPiA+ID4gRXh0
ZW5kIHRoZSByemcybF9kdV9mb3JtYXRfaW5mb3NbXSB0YWJsZSB3aXRoIHRoZSBjb3JyZXNwb25k
aW5nDQo+ID4gPiBtYXBwaW5ncyBiZXR3ZWVuIHRoZSBzdXBwb3J0ZWQgRFJNIGZvcm1hdHMgYW5k
IHRoZSBmb3JtYXRzIGV4cG9zZWQNCj4gPiA+IGJ5IHRoZSBWU1AgaW4gcnpnMmxfZHVfdnNwX2Zv
cm1hdHMsIG1haW50YWluaW5nIHRoZSBzYW1lIG9yZGVyaW5nIGluIGJvdGggdGFibGVzLg0KPiA+
DQo+ID4gR2l2ZW4gdGhlIG90aGVyIHJlcGxpZXMgdG8gdGhpcyBwYXRjaCwgeW91IG1heSB3YW50
IHRvIGV4dGVuZCB0aGUNCj4gPiBjb21taXQgbWVzc2FnZSB0byBleHBsYWluIHdoeSB0aGlzIGlz
IGZpbmUsIGFuZCBob3cgdGhlIFZTUEQgd2lsbCBjb252ZXJ0IFlVViBmb3JtYXRzIHRvIFJHQi4N
Cj4gPg0KPiA+IE5vdyB0aGlzIG1ha2VzIHJlYWxpemUgd2Ugc2hvdWxkIGltcGxlbWVudCBzdXBw
b3J0IGZvciBjb2xvcnNwYWNlIGluDQo+ID4gdGhlIFZTUEQgZHJpdmVyLi4uIEl0J3MgYSBzZXBh
cmF0ZSBpc3N1ZS4NCj4gPg0KPiA+ID4gU2lnbmVkLW9mZi1ieTogS2llcmFuIEJpbmdoYW0NCj4g
PiA+IDxraWVyYW4uYmluZ2hhbStyZW5lc2FzQGlkZWFzb25ib2FyZC5jb20+DQo+ID4gPiAtLS0N
Cj4gPiA+ICBkcml2ZXJzL2dwdS9kcm0vcmVuZXNhcy9yei1kdS9yemcybF9kdV9rbXMuYyB8IDE0
MQ0KPiA+ID4gKysrKysrKysrKysrKysrKysrLQ0KPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxMzYg
aW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkNCj4gPiA+DQo+ID4gPiBQcmlvciB0byB0aGlz
IHBhdGNoLCBrbXN0ZXN0IHJlcG9ydHMgYWxsIG9mIHRoZXNlIGZvcm1hdHMgYXMNCj4gPiA+IHN1
cHBvcnRlZCBieSB0aGUgUGxhbmVzLCBidXQgdXNpbmcgdGhlbSBmYWlscyBkdXJpbmcNCj4gPiA+
IHJ6ZzJsX2R1X2ZiX2NyZWF0ZSgpIGFzIHRoZSBjb3JyZXNwb25kaW5nIGZvcm1hdCBpc24ndCBm
b3VuZCBpbiByemcybF9kdV9mb3JtYXRfaW5mby4NCj4gPiA+DQo+ID4gPiBUaGlzIHBhdGNoIG5v
dyBsZXRzIG1lIGNhcHR1cmUgYW5kIHJlbmRlciBwaXhlbGZvcm1hdHMgZnJvbSB0aGUNCj4gPiA+
IE1hbGktQzU1IGRpcmVjdCB0byBhbiBhdHRhY2hlZCBEU0kgcGFuZWwgb24gdGhlIEtha2lwIGJv
YXJkLg0KPiA+ID4NCj4gPiA+IFBhdGNoIHRlc3RlZCB3aXRoIGttcy10ZXN0czoNCj4gPiA+DQo+
ID4gPiBQWVRIT05QQVRIPS91c3IvbGliL2FhcmNoNjQtbGludXgtZ251L3B5dGhvbjMuMTEvc2l0
ZS1wYWNrYWdlcw0KPiA+ID4gLi90ZXN0cy9rbXMtdGVzdC1mb3JtYXRzLnB5IFRlc3RpbmcgcGxh
bmUgZm9ybWF0czogU1VDQ0VTUw0KPiA+ID4NCj4gPiA+DQo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL3JlbmVzYXMvcnotZHUvcnpnMmxfZHVfa21zLmMNCj4gPiA+IGIvZHJpdmVy
cy9ncHUvZHJtL3JlbmVzYXMvcnotZHUvcnpnMmxfZHVfa21zLmMNCj4gPiA+IGluZGV4IGIxMjY2
ZmJkOTU5OC4uYTVlOTZmODYzMTcyIDEwMDY0NA0KPiA+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L3JlbmVzYXMvcnotZHUvcnpnMmxfZHVfa21zLmMNCj4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9yZW5lc2FzL3J6LWR1L3J6ZzJsX2R1X2ttcy5jDQo+ID4gPiBAQCAtMzYsOCArMzYsNjEgQEAN
Cj4gPiA+DQo+ID4gPiAgc3RhdGljIGNvbnN0IHN0cnVjdCByemcybF9kdV9mb3JtYXRfaW5mbyBy
emcybF9kdV9mb3JtYXRfaW5mb3NbXSA9IHsNCj4gPiA+ICAJew0KPiA+ID4gLQkJLmZvdXJjYyA9
IERSTV9GT1JNQVRfWFJHQjg4ODgsDQo+ID4gPiAtCQkudjRsMiA9IFY0TDJfUElYX0ZNVF9YQkdS
MzIsDQo+ID4gPiArCQkuZm91cmNjID0gRFJNX0ZPUk1BVF9SR0IzMzIsDQo+ID4gPiArCQkudjRs
MiA9IFY0TDJfUElYX0ZNVF9SR0IzMzIsDQo+ID4gPiArCQkuYnBwID0gOCwNCj4gPiA+ICsJCS5w
bGFuZXMgPSAxLA0KPiA+ID4gKwkJLmhzdWIgPSAxLA0KPiA+DQo+ID4gaHN1YiBpc24ndCB1c2Vk
IGluIHRoZSBkcml2ZXIsIHNob3VsZCBpdCBiZSByZW1vdmVkIChpbiBhIHNlcGFyYXRlDQo+ID4g
cGF0Y2ggb2YgY291cnNlKSA/IE9yIGlzIHRoYXQgYSBzaWduIHRoZXJlJ3MgYSBidWcgc29tZXdo
ZXJlID8NCj4gPg0KPiA+IEFjdHVhbGx5LCBicHAgaXNuJ3QgdXNlZCBlaXRoZXIuIEJpanUsIGNv
dWxkIHlvdSBsb29rIGludG8gdGhpcywgYW5kDQo+ID4gY2hlY2sgaWYgd2Ugc2hvdWxkIHJlbW92
ZSB0aGUgZmllbGRzIG9yIHVzZSB0aGVtID8NCj4gDQo+IEJvdGggYnBwIGFuZCBoc3ViIHVudXNl
ZCBwcmV2aW91c2x5Lg0KPiANCj4gYnBwIHN0aWxsIGNhbiBiZSByZW1vdmVkIGFzIGl0IGlzIHVu
dXNlZCBsaWtlIFItQ2FyIEdlbjMuDQoNCkNvcnJlY3Rpb24sIE9uIFItQ2FyIEdlbjMgaXQgaXMg
dXNlZCBieSBkdV9wbGFuZSB3aGVyZSBhcw0KUlovRzJMIGRvZXMgbm90IHN1cHBvcnQgRFUgaGFy
ZHdhcmUgcGxhbmVzLg0KDQpDaGVlcmUsDQpCaWp1DQo=
