Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23750AB97D1
	for <lists+dri-devel@lfdr.de>; Fri, 16 May 2025 10:37:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7461D10E9F1;
	Fri, 16 May 2025 08:37:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=hotmail.com header.i=@hotmail.com header.b="VY7xCeWt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazolkn19013078.outbound.protection.outlook.com
 [52.103.46.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8953C10E9F1;
 Fri, 16 May 2025 08:37:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nVL0C0eMxDv0lkwBZ+9uCj6lulLUPMFXy2iW0sgzfZqxu6wtihBWXoJ4nLXFAvHuyctsVhick7B2p25yljLKMxQkftUo7L/nOGnoFkH4pbV87ToY5If2j3jOV9vM4/1FDHkgBKobBp8wH1oMok4P0o7R+7ECg5blIYLQT9mxLwrrmVfMNHjlZQUJ68ZRbbOgOnlMjXbbkJRJFOdDKT660maILEQk3ONNQIAqbF3vEesOEG9EKEDUFIriRhDmc1+RXhnuuBZHA42Bv9UC1HbvuYCnrRH49XuX6CNPHOQt0NxtRMbxBoz9ExIAxgiwQRvPbh5ik8zaCOKNuK7xTHG/+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ynj71Er9/x3Yh3MgSt7E6Yx+m+DhbKnuZ/c6IIv8PPY=;
 b=TH0JosRwhVc9LphNegoqM9XEvgzbyGdOaZwAQSy4qBsDTLkJR4CjqIGY3k8tPmnJ2p7K4//4MG/VVrkpvE+UC2oHzeksBxd/gppRJP96mqlHaj/QbTeRfKsvZj+jtMk7H8C4Alegf071o77S17mu6vVCWkNXv7X4lnXbdtf4WZSenjL4RkRdBGVq6hFeO9MFr2FbH6i+Uo+bmPMb76hNVESbTvegUld530ELbwU37Au7XMkvSp6+TyGSDQfCP8iWlLikeVzysGtkMX9ngWaoUPmSTwjxf4/Wpd0YT5d7gkq2B9pQYiNvkWxjyE7wd4OYuPLUclRbeXxAhWKsQS3jfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ynj71Er9/x3Yh3MgSt7E6Yx+m+DhbKnuZ/c6IIv8PPY=;
 b=VY7xCeWtgcN0wK7F/fjIcQqmVjphJkGblfHjPaFcivnKbFyX+/oxacF40d6ewCFWWScM0rUYve9hJott9wFNG811AzI0Vqh7PRrBFMB+SZbtVcj3oZtTKzPP3ylQ0zBRmPMhVYN/miF9NGigs96VKoLQ4i8TBPOWlD2KLVidqZJbtmM8r0JKiCNp4VajOjDGN7m6pvJAELGHq9KkWuP1AWfcZpV/KvS8Ee6E8rfiPDtJmPo1iOcx2YKX+LQOKKet3epGh3Ag4u+Oy6o+2C9X8JDmIzAbWDjy2CFFcfbPC/MEEpJ8IZ9OqfzcjU1JQZL58RFY9aOKnVpCmEOzzZf0WQ==
Received: from AS8PR02MB10217.eurprd02.prod.outlook.com
 (2603:10a6:20b:63e::17) by PAWPR02MB10022.eurprd02.prod.outlook.com
 (2603:10a6:102:2e2::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.12; Fri, 16 May
 2025 08:21:55 +0000
Received: from AS8PR02MB10217.eurprd02.prod.outlook.com
 ([fe80::58c3:9b65:a6fb:b655]) by AS8PR02MB10217.eurprd02.prod.outlook.com
 ([fe80::58c3:9b65:a6fb:b655%4]) with mapi id 15.20.8722.027; Fri, 16 May 2025
 08:21:54 +0000
From: David Binderman <dcb314@hotmail.com>
To: "austin.zheng@amd.com" <austin.zheng@amd.com>, "jun.lei@amd.com"
 <jun.lei@amd.com>, "harry.wentland@amd.com" <harry.wentland@amd.com>,
 "sunpeng.li@amd.com" <sunpeng.li@amd.com>, "siqueira@igalia.com"
 <siqueira@igalia.com>, "alexander.deucher@amd.com"
 <alexander.deucher@amd.com>, "christian.koenig@amd.com"
 <christian.koenig@amd.com>, "airlied@gmail.com" <airlied@gmail.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>
Subject: linux-6.15-rc6/drivers/gpu/drm/amd/display/dc/dml2/dml2_translation_helper.c:
 possible cut'n'paste error ?
Thread-Topic: linux-6.15-rc6/drivers/gpu/drm/amd/display/dc/dml2/dml2_translation_helper.c:
 possible cut'n'paste error ?
Thread-Index: AQHbxjsXuMbzDLTuHE6KmKItYU3/TA==
Date: Fri, 16 May 2025 08:21:54 +0000
Message-ID: <AS8PR02MB102171DCC74A29A74E28265409C93A@AS8PR02MB10217.eurprd02.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR02MB10217:EE_|PAWPR02MB10022:EE_
x-ms-office365-filtering-correlation-id: de02995a-2f73-4a9a-945c-08dd9452b7ba
x-ms-exchange-slblob-mailprops: AZnQBsB9XmoaApi1aWVt9ILKZbGoHsd6/sx7C8UcDElN0Cdo0bS7UFO3S4Uj4Tt43JpZ1ChiIXnJXxE7qeKCz1sp8KOE47Cl/p16CMgXA7ZKRijJitoqf5w9UiQrMXSDdgpIiKzTs43Q4C8QxtfGrRpyod1RErVv6eurCkwECYWUsA0atqelGYjsFpyHI3BxdHdu7UWI4fSTNmbctPX/PPi3Id5q/1si7kSSYu8FzHGRZB+dD6D+ugdE5RiVuy1awQ6hCZP6cxB7YMGN0UN9UY6/j2g8ebLOC/JrjhF2uGKzXTqqF04jnjiYal/T8bCBnterpDzt04W/W9gqf5u/eQS4ih+V0EGOBcHDR6r8V8mN9Q6ijZqVFuMAKbnzq2eaw2ElW2YV2LeCFEwFva7yKjXBFAxTNIAG7jpYq+Ft2xW+i5NZ1+XuvOfaogNhbLsevobMH7gTydgf94FWkxoUmV3U5D8jynkH70Em24TXlj8nWksA4JL2FZXzm1k9DQV/RVqPSmrn5HYnQjJOt9K3BXo2AO0GbtJ+qEoJWaA/Hsr6EpbqVs7B0S45ioJOChQboyip2roKerdNelTDzsLeLWCzXsATSO1z0cONIM0pHclBO3Q/lV4/3TKOieZHw9YlO+GlQcTLRoipkseU5dlRhhsXxxzNaM3RmWhuamKvqmeQdhlntGV/OfUcQlF2NYHPJTdVGW74z9cUK5eVY/dTJrjSC1jy+kD+DLGBNfeMOHGKX20Zz/VR7W6ptYaxI40wjG4OJzUtdAw=
x-microsoft-antispam: BCL:0;
 ARA:14566002|7071999006|15030799003|15080799009|8060799009|19110799006|8062599006|7092599006|461199028|440099028|3412199025|102099032|21999032;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?4cTOImftktOFEHf5oqEBDeDeR2ux7nxvZSpOIfuZGG3FkyMOVJdzOrhQzH?=
 =?iso-8859-1?Q?YHKLin60nY5zxzxh83+e/bj7X1uBfl+3e8+cQpGE1PtKEPl9uLlP2KusMR?=
 =?iso-8859-1?Q?xWniBFkomTbvE7hIhaC9jc/G2j8gatY1MDUQ/cTVbqG0aqMOWtj5dIQsTC?=
 =?iso-8859-1?Q?wmLWog+4CR1Z/QwoyHEcZH94FsYPj9RgPBPbVEg+xcbCB6m4jITP3x2w4n?=
 =?iso-8859-1?Q?QAIl8cC8DPg+qgNZI5+hvaB8ncndm3LKyXYei3joS0f1XywO0uAb/V1CZG?=
 =?iso-8859-1?Q?W6WI/V9QV8iZdDo0UC+bGPO0yqjEJwxcBFiWISuqYme5VElierbPM6E+Z0?=
 =?iso-8859-1?Q?nsHeEvR8Px/TWXXSPu9J4wFbkMgkkeZcFIcLWs0DljHG+61GVfRs21c2MI?=
 =?iso-8859-1?Q?YuwhSW1t9IF+bw/8x4Y+kuZQsXtmhbNDVXCPKZ1VVNpdWLJj0SerNPlp9M?=
 =?iso-8859-1?Q?bVGLnWdwXOrRpKlNuH1tDTnReasyILqqS/Hw2wOirZWrF0Ne3//yPmi2yv?=
 =?iso-8859-1?Q?eMLi2H9n4CpfoDKZJ6j4U6mSzyAtsObpB6YXYt3riZKjkIbdSdk6Nyi2N7?=
 =?iso-8859-1?Q?DnRBDecAYu4A9u7oJOe8toeVmoaifvU6bd96SgVkLE2cdOZ2gjs57I4E/M?=
 =?iso-8859-1?Q?V1Dh6BsXUuUsszR7eNILhnDb3wgw92stnIGZSqc80Tyv/GuXhls0BCzlcc?=
 =?iso-8859-1?Q?5GPDWcKN801iYt/mciMXvLm8cWQMcL0HKo+Qm8I4jvwMK5SHgTQqPPOq7j?=
 =?iso-8859-1?Q?iU+ME5AeyrAEkYPHW+ESw3HTzzZCOoVo+aylsdXvNI4phUlTggifByqqbg?=
 =?iso-8859-1?Q?cwvymL8Cl23t2lar+z8ELczb3CgDJQn+RZihxAavESEq0Twb8Qk8w3ejeI?=
 =?iso-8859-1?Q?9tqtt+CZTBX/I1lfj30pmnSVXz1Y03apn8CG7JVkihgYrykgetCPnBqQgy?=
 =?iso-8859-1?Q?MvnmN4E9tC4SSQNSYFl0Qk/H+9+gOVOqH6s1ik+B9lga06i97DbgXQ+8PZ?=
 =?iso-8859-1?Q?KXRqvtOBwsyv1GNtQ8deAQWyOi8/plIMC88bcmZivjN7BUOBVBh6DXtB31?=
 =?iso-8859-1?Q?prg2LwyVfiz1a38FF06CyIw/zke52ZqfTTqDgLF3pxpvYFpK10E9YGBRro?=
 =?iso-8859-1?Q?m3XkfYoPF8KAbW5/KFHCF06pZyLvOqRdWQwOQKbFV4noAMAIxVsAmLM7Dv?=
 =?iso-8859-1?Q?33NMuSmlsmMv8JknMJsIWV3dabXgdNquXU0=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?xFnwp4cAXBsI9gQORcUHgYoCnmx33sz1cEXpeWAsDUOZ9hCSzK5ai8DH9I?=
 =?iso-8859-1?Q?AdNNc0uP+qzKkMbgOqV1KkCPrH+TknqkxoFviRZijrFTwakxNJb2ZulFDO?=
 =?iso-8859-1?Q?YEkYyuImJSYVgFU5TTaoVOczpAR6H4UaD9IidZ05f5GXmmSKjgdbtU01nE?=
 =?iso-8859-1?Q?Ei5u53tR/N3NGn9G+04KA9113Uk+hyEGbjh+8VdVv9D9FVfPRYOhRV8Vac?=
 =?iso-8859-1?Q?l490j1c5Nvbmv82LuSw999o28mzRcF16nOX8fwnhOTt5ekAo3w9Pp7NPao?=
 =?iso-8859-1?Q?nYWfxZcpEazD9lFXANSpyMms06j3UsqNG/KMefNnYw9f5bMtfNnfBANWYI?=
 =?iso-8859-1?Q?lrbjc5hYkkMjzo/58aY+d+PejBYaUqRpbyL3CMho80quL57kyG5LTLpO3i?=
 =?iso-8859-1?Q?mV/zM9kOJ7uhyKSJMJ2FBhXeGYhQC3G/2t5wNsJsu5fnUXvnShgA3uI3Ql?=
 =?iso-8859-1?Q?YZVkdDklezouy7TcqqrD3PZlXqLz6Z2aTmn/f1edyGiD6FYUZU9q0W3iJe?=
 =?iso-8859-1?Q?Kn6whEbQCPJg3wj/g2gz1kcHN9R4qg7XrrwMD28HSm3tzZl7W4yK9gWQlG?=
 =?iso-8859-1?Q?2zRNeGz4AKTjpa9qOBtxkYLUIuAXzWeCdbQZAemm+QjCDDMmAt8PHtBqCl?=
 =?iso-8859-1?Q?GdVdD/PRF8V0t1KX6x0s5IynpNHJOM3RPq0zfY54qm84gJKW3sstfbi8Fw?=
 =?iso-8859-1?Q?Yli+WGMKVvEXnLbOEgGckgT2XXppqTh7HC0dOWCvV5kXepUmf2/qxciM75?=
 =?iso-8859-1?Q?uFRyvr+jDjZkFAsaxnRbK+C1wr/pCP400ti33y4uPucyKC00VkYLam39is?=
 =?iso-8859-1?Q?rO751L1rY/PDNL06DPjnQPVWHu7vbrpT251GUaMZz6I/VUm748O6G3geif?=
 =?iso-8859-1?Q?ek5Ji0oPfCbsgHCftKLFm7kBaE3DYaPlX0kgnjvtjUvQGjqqa8wxnv0aF4?=
 =?iso-8859-1?Q?qvzu3//uvc2qmboQBz2Er3uys5Bzm6uWgIQSPFgYmSJQRUh7NUdhzN184G?=
 =?iso-8859-1?Q?zwqDBc2pA2vbV3XoL/CHAC9aRCdqRtfK8Ha0DRUVQ/69amwIyT2y3Q3KCW?=
 =?iso-8859-1?Q?Tciqw1PD2+yVAer//hqv4v66kb/C0HP2L/I3Q+0RZRLTAF/xBRLqYwCe7h?=
 =?iso-8859-1?Q?72+RhJ8nD4IolShpkCi7XdCTndJhEi5HpxCm2zl/3ncTimHlJbZzr75QQI?=
 =?iso-8859-1?Q?1h3z+o3lqclPEYJ/+L5ESKLVltd/WAm6PmiEQ8XnbLw6LnSRwp3PK9JneR?=
 =?iso-8859-1?Q?aNQUpsvzBrgriOeLUlQA=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7828-19-msonline-outlook-12d23.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR02MB10217.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: de02995a-2f73-4a9a-945c-08dd9452b7ba
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 May 2025 08:21:54.6567 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR02MB10022
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

Hello there,=0A=
=0A=
Static analyser cppcheck says:=0A=
=0A=
linux-6.15-rc6/drivers/gpu/drm/amd/display/dc/dml2/dml2_translation_helper.=
c:595:45: style: Variable 'p->out_states->state_array[i].dtbclk_mhz' is rea=
ssigned a value before the old one has been used. [redundantAssignment]=0A=
linux-6.15-rc6/drivers/gpu/drm/amd/display/dc/dml2/dml2_translation_helper.=
c:594:45: style: Variable 'p->out_states->state_array[i].phyclk_mhz' is rea=
ssigned a value before the old one has been used. [redundantAssignment]=0A=
=0A=
Source code is=0A=
=0A=
            p->out_states->state_array[i].dppclk_mhz =3D max_dppclk_mhz;=0A=
            p->out_states->state_array[i].dtbclk_mhz =3D max_dtbclk_mhz;=0A=
            p->out_states->state_array[i].phyclk_mhz =3D max_phyclk_mhz;=0A=
=0A=
            p->out_states->state_array[i].dscclk_mhz =3D max_dispclk_mhz / =
3.0;=0A=
            p->out_states->state_array[i].phyclk_mhz =3D max_phyclk_mhz;=0A=
            p->out_states->state_array[i].dtbclk_mhz =3D max_dtbclk_mhz;=0A=
=0A=
Suggest code rework.=0A=
=0A=
Regards=0A=
=0A=
David Binderman=0A=
