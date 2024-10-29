Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DF869B432F
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2024 08:34:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF60410E5C1;
	Tue, 29 Oct 2024 07:34:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="FHbl+vgL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2051.outbound.protection.outlook.com [40.107.20.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2134010E5C0
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2024 07:34:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KoHetGYCvWVr/+vfbDYBQ4M/gJPsBjdG0tekFURZo+PoWttgFysBsYyfHIVfJL6/yA6rIw3DGj+7j6BDe7kI2vODgvl7i/9HEzX+ceQVnJcwkn+l3yScZwLr9J2D7zqO+Wq/xasEZkYjZ607lzxctvh0WnDldSLPBk//AB7GXB2F8an++Ro0dvpjdf/KTWYxTb3ORs/r3KhmHEt5NHqPdzybPygRkbP9uI++JD8AfqLMrYJNAMEkSRkhBJmv93NyWkBEL4p4l7/rhLSSRlKcLChPxF4FBTKThljbTboSCf//2iOgsut87jUMNvUBJvqOohmy0qAfEDMlyHce4HArmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5MGaKuyK1ZpV7iNozl/4/eQ0GCLP6uRkc/6h3fKJHaQ=;
 b=tVwRCWDOqBBqLHeHi3lembG2dwR7Xejve5LDL0wP0spSgOXgv7jvB0g3k2c7Ot+OCgP22ep6Kz8S7zZR7IrejFpP19uhW5mWEmhfTRzKN2odwRzS4gOTzpK009Jpoq2Qairyt8nGQFOIAVXCq6xFKmA4zmdZt/IpQz34oUjcszt09l3IvAXavnvJg5+hqCDxS3uvk0yc6JnAXSROnKRt+9x7ylQ3YcO6LgcO5eEpeAzAn6X4UgrhllF1/UrjoXHdLTrtHM4/lZzFuSy97daJnwYjR8Rba/PT5qRp9eyuQkZGDIGE3UcB1eKdLipoh65O9IzcSBilkcPHy6IGIj71EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5MGaKuyK1ZpV7iNozl/4/eQ0GCLP6uRkc/6h3fKJHaQ=;
 b=FHbl+vgLLOTLcBU9jy1tqw3ROsh5rTGQUJlaSBAjxKL+XToE9WJdjexeKx+Pgd+U8jyYRrIPbEX7RqbyNpmgWbmQ3KUEBEacDU+3UvdaekRYNInmGdkeUfIpKoE2+VbqgINi7kPkk17nffDqUZ/w9iwEy3AdbOXUqRiP7D0+jSaIf9sjTGzeaSo2unWZGDKr17ox4820WDMtibMfDWOEqCntdLYNmT+CzkZAb8xXeiQyOZ6j9OJmlHEizFhWLKTAnzUYGXJOZ+nppfjVRptg9g497EWeM3LHl0DEpyMR22xQG+DIVqsVm1GSvuV9P6vo/IQqpLNC4ygB6aKD/Wyzhw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DB8PR04MB7178.eurprd04.prod.outlook.com (2603:10a6:10:12e::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.24; Tue, 29 Oct
 2024 07:34:43 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8093.023; Tue, 29 Oct 2024
 07:34:43 +0000
Message-ID: <a166da61-8cd4-44c9-987b-94d8a62faf82@nxp.com>
Date: Tue, 29 Oct 2024 15:35:05 +0800
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
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <TY3PR01MB1134610B42A1D3424D97B04CA864B2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: SG2P153CA0036.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::23)
 To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DB8PR04MB7178:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c5dc48e-4659-4c41-7077-08dcf7ec27cb
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NHRERlVtSDdCbkJRUkpYak8ySHhRS3QzczBmaHdtNGRiQldublRQWXQwK3ox?=
 =?utf-8?B?MkdNbzdhTy9VbkFyWG9GdWsxS3NNQUxzUWN2SHpvMG5wQ0lwVk1aYzRLb1VO?=
 =?utf-8?B?WHJyVXhiOEcra21kSlMrcUNERDRXSGoxQUd6S2NNdDY5djhvRnVUd0pFcThR?=
 =?utf-8?B?T1NMdXYvZnUyMUhUZVY3amt5SEgwN2VvMERRQS81dXgxN3JEMUlzM3NtS2lL?=
 =?utf-8?B?b1hTM2t2UkZxb1pFQ29YZVJEQ0lxYTBrU3hwQi9PdXg1czA4cXBiMFhkaDE3?=
 =?utf-8?B?bFhTS3ZHTlhYelF3eGlmeWY0SDJHTHM2WW5KdHdoOXNlVHpYbmI5MjJaRkVp?=
 =?utf-8?B?c2VGMVhiaHdIekRremRpR2cwOVE4V0RpVC9qWVNXUzRudHc0S0w4YUNWTksy?=
 =?utf-8?B?d1BoaElDMDA1czVpbmMydVRhQ3B6ZVQrUXJ4YUNQS21EOFRxcFlva05MejVP?=
 =?utf-8?B?N3BYdGQ1V0VKcmcyeVFjdlA4RFVrS3JXN0V1NnNUb29FVXR5eU1kSEF6ZGxM?=
 =?utf-8?B?Y3c2eFY3Q1h5MHpTNVVMR1Q2Z1dhNWYwVTB2cE5sZ2pzQlJMVVJOSFBxQk9z?=
 =?utf-8?B?UVI0TmRXdzNreHY0NmV0MWQxMHNkOUZkWTRzajNNWnRGbWhUWHpNa00xVnF6?=
 =?utf-8?B?cGJXSktKcDZFRW1lcXVveVZmcWZHUEIvNVpzdEhWUUcrK2lXN29aNHg3UEZQ?=
 =?utf-8?B?SC82UGduOHRaUG11c29wYlUzZGphQWdWR2pZK2t0K3RuMlgvUHlJMGtITllv?=
 =?utf-8?B?N2tuNWhydnBFZU1aUk50U3lyKzVEdGp3UVhDQklhdW4vUHRJdkVLeHF3dExN?=
 =?utf-8?B?Y3I2Y09JSzhuOFVRTzNIWC9IUVQ0dkt4UG1CbzVYM2g3bnFZVVdMWkQ1aHdC?=
 =?utf-8?B?eVhvUlBMS1lmRGs2ZTVzUE9jMTVvdzErNUwvU0padlI5cGd1bFNFa0gzdHJD?=
 =?utf-8?B?RnpxKzFVRzIraEhoSWh2bEZnTkZ5U0xNTFRaQVdxTzNFNFdzdkdjOW12WjAw?=
 =?utf-8?B?d1FoU1RPVm5ERjNoV0xoK0xaV1N0Y0NnTGYzdG5KWG9aWGFFOTZMWitENXE3?=
 =?utf-8?B?SEhZU0d0NDFlcTlFbWt0ajhQdTdwT20wWTEzZ3BsaUJzeEgzWkVDbEJmN2gz?=
 =?utf-8?B?aTVtYUp4KzVSK2dEUk9FVVZSYWtsMHpqT3paUEN2dnZ2dXJTVWdqdUt1WnVi?=
 =?utf-8?B?VmpuUmRVVkhIUHZoTk02RjEyUGFOUlh6eU9IRE85MG14dFdYZEpjeVRkdHNn?=
 =?utf-8?B?RVA2Vm9RZlp4ZVNrOUg3S2I0SEdsUjFzbkZZbjBpeXQ5cnRCMUU1d1ZFZTIz?=
 =?utf-8?B?SlJwYlFxY2JwVXg4U01oL0p0TWdMTEVBcnRqSFcrbWcrT25SM01ZS3VDb2Er?=
 =?utf-8?B?b0thcFdTOGRFbElwanhYK2ZEam5SWWJGb3k0Z1FIOWZCZEs4YnBjbUoxd0Nz?=
 =?utf-8?B?dEdmOEJwM1ZrU1VDL1ltSmhybkpRY0N3Z1JKMTZRWFNPM2tUdFd4eUtNV0tU?=
 =?utf-8?B?UlQrU3d3WS8vWjJIM0tBUS9BSDUvRldla04ydk5EaTFhWURCK0UvVEU5WUpn?=
 =?utf-8?B?RnYxL3lOdGw4elZuVTJwRmxaUTJEQlhNRnRIV05PTjhjOEtYWlMyZ1B2VWM5?=
 =?utf-8?B?RW1KamREcE9NYWFhWEUwZVFHVHU5TndraVpFSkJFanVYK2svdkowRnU3NlRE?=
 =?utf-8?Q?7BO4dvYBz8nsUVeseuJD?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QWVycTlrL1NROVFzbFd3ajVWM2RTSEFHUG9YSUR6ZVd3YUJZRUhMNERaekRt?=
 =?utf-8?B?WlVPN0J6a2M1dHFMWlRLTjdVaUJPL0F3S2Z0RnNNNDZnRkx5SWJNS0M1NUxi?=
 =?utf-8?B?VzFzNGVkclRUZFpxb1VOSnNlUlV5VkZUbTRiSFpodGxpaXl5NWtkMUlZdjln?=
 =?utf-8?B?VDQwcXYySmZwelZoSTMxQ0ZuUWRvVWxMNmJ0MnN4dEduWmZFUGF6ZUc1YmJW?=
 =?utf-8?B?T2psWHpuUENQUUlZcldGT2VtcDNTTVNjcGdPT2tyV1d1L1JXQll4ZSs5Qm5n?=
 =?utf-8?B?VEI5Q0ZnZGxPVGJMaWNRRTZheSt1RFloYjJheHFKT05mdFViN3Bhb21MMWFo?=
 =?utf-8?B?amI2OWJVMkNJMnhBVXRhNXUxVldGbHdXczRFdHg4YmpydjZUaDdRQkkwd0xk?=
 =?utf-8?B?ejNwakJJWVU1L1RwWWpJeGxVV1BXdVA5cUhxbkJEa1dwSTU0WXcvSkUrVzdp?=
 =?utf-8?B?MkJnUnJWazBJT2hyNHhBQ0hzMFc3VjlsaGlxQVVRWm5GWEMxZkFEWlNRV01V?=
 =?utf-8?B?ZUgyT2thcHRqVThYSXowSklJVGVsaHdTdG8xMGM0V0x0b0YwMUJCSW5mSHY1?=
 =?utf-8?B?eUt0TDFpUTg1bDI5cWFxbmRDZ1ppM2JXdnlHU3p3K1hsVy83d2FiUjgyditO?=
 =?utf-8?B?TmgrRnAyQmVrMTlFbzhXQzRTUVkybE1wSERSM1lCZTdQU3BBbUlEZExjUGU4?=
 =?utf-8?B?ZmRqemN6QXZjQUo1ekZiVjM1bDJiRWx3RTFDcGp0dnlqR0F3eGYrQmN0VFpu?=
 =?utf-8?B?NXRBb3RsR2trdXloNTJLcFllNjNRSGN2MlhTWkxnL3VjcUxiZW5DbzlwU0FC?=
 =?utf-8?B?Q0hnVHZhR0x0LzlENXc5cWlBc1pHRktPTlVoMnpEdGNLN0phODRQZytQOFY5?=
 =?utf-8?B?Qm5UK3VlM0g5RDhEenUvdyt1YmZnZ0pVdUJ1U2RzR3Z0L3NGTWJrS1RhTHlM?=
 =?utf-8?B?UUUzakgzc0xzNmpJVEFGbGhSb2ZsbHp5a2VSdXovRjNQbE1LTENCK2xic3JG?=
 =?utf-8?B?V2dVbjhRaFQrcnRhclhEL3pCNitDNnhmMHA4NlQ1S25sRmlzRjVaSHkxVWdF?=
 =?utf-8?B?R2ltL0xpUTlBWUlrV2tCLy9sZzh1UUxoUzVZenJrQ3lZS3N5MGJ4dU9HK0Er?=
 =?utf-8?B?UUhRT0t4OUNWc25LbWdKbmRweFVsMGFsSHgvYmY1VFQvandjdFh2aEJDbXpi?=
 =?utf-8?B?S1YxekcyQ2pwMzJ2d0cvN0tOU2JzT3FGeHlZWGNRNUZlWXF1SkVFTjNuWktK?=
 =?utf-8?B?YTJVY1gvWlcxWlJrL1dxcStSUFhPbHhtNDUrbjlJOHFXemdVdFNFcksrbFR4?=
 =?utf-8?B?T08yQmZkempGU1cxeVc1ZnVmU0pmWkdnZE42MUZKTmt1ZGtmUVF3aVYrWFBT?=
 =?utf-8?B?VCt3QTk5Ymp3MEFEMmp3OWl6WFVXZ3lXNStaOGlsaGp4M3JTdmxNM1FRWkxa?=
 =?utf-8?B?Zkk2ak1rWVRuNG56blpUMGwxc05ST3gzK2dzUUJBM0hxMFVOR1hBSnNwOFhq?=
 =?utf-8?B?UnpxeDFFWk5jbUdMVE11QURWR081SXRyRDlUdmtCZ3VuV3hYRkJ5RnpRZlpY?=
 =?utf-8?B?M0daalpDR1o0SEJkN0d5eW5TcldHN3cxWEtMWjNUZTQwY1VxaXhBUklQQ3FF?=
 =?utf-8?B?a2ZMYWkvclFHdXN5bk93OVViRXJha1BvbzNlYkQ4aG5zalZ2Y1hmbUFOdWpM?=
 =?utf-8?B?QXliYnI5ejlHWk83c0J4S0tEMUlJZ1BXUFVKSzY0T3htaVEwSldWWjlzZHdl?=
 =?utf-8?B?MFpuZU81Y1R6eEFwWWZIcmZtL2ZycXRLZXFTMHJNYVJYc09peWZ3dzRWeWdB?=
 =?utf-8?B?b0RUcGp0MFI3aG05aUIwRFhZQXNXUUd1aGpuRWRiMjhKeVUraTd2VkZER3hB?=
 =?utf-8?B?Ujk4U01CUzBsd3duUkJLd2UyZ2pxN2RObFlwOVlKVHY1ZFFDVTJoaUxaNXRp?=
 =?utf-8?B?NXoxSlRkcFNtK2ZRelB6VkRLNUlQTzBaM2loYmV0VGtCOTMyOHoxd1lWSDVy?=
 =?utf-8?B?QlF5S2RZblIzQm5pdnN4bWRBQjlZUnpqWG90QXR3dFlWZVdWRDJnWjdkRDRF?=
 =?utf-8?B?N09Tanp1elhRUEd1NkdXOENvT2t4OUpkK1VvTEdVU1lYSnFKWit2ZG9JbUYz?=
 =?utf-8?Q?ddK9VjE2FQl6zjDp7GvIR/Bly?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c5dc48e-4659-4c41-7077-08dcf7ec27cb
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2024 07:34:43.3135 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HPUg07r1xt5c02LL9ggHvWAk/WFt+Ae10voGrM6Z0SMIWRIiX/C9A/RadFjt6Md+mfsNH0RI2xaQXScoKCz7Yw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7178
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
> Hi Liu Ying,

Hi Biju,

> 
>> -----Original Message-----
>> From: Liu Ying <victor.liu@nxp.com>
>> Sent: 29 October 2024 07:13
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
>>>> Sent: 29 October 2024 06:17
>>>> Subject: Re: [PATCH v4 08/13] dt-bindings: display: Document
>>>> dual-link LVDS display common properties
>>>>
>>>> On 10/28/2024, Liu Ying wrote:
>>>>> Dual-link LVDS displays receive odd pixels and even pixels
>>>>> separately from dual LVDS links.  One link receives odd pixels and
>>>>> the other receives even pixels.  Some of those displays may also use
>>>>> only one LVDS link to receive all pixels, being odd and even agnostic.
>>>>> Document common properties for those displays by extending LVDS
>>>>> display common properties defined in lvds.yaml.
>>>>>
>>>>> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>> Signed-off-by: Liu Ying <victor.liu@nxp.com>
>>>>> ---
>>>>> v4:
>>>>> * Squash change for advantech,idk-2121wr.yaml and
>>>>>   panel-simple-lvds-dual-ports.yaml with lvds-dual-ports.yaml.
>>>>> (Rob)
>>>>> * Improve description in lvds-dual-ports.yaml.  (Krzysztof)
>>>>>
>>>>> v3:
>>>>> * New patch.  (Dmitry)
>>>>>
>>>>>  .../bindings/display/lvds-dual-ports.yaml     | 76 +++++++++++++++++++
>>>>>  .../display/panel/advantech,idk-2121wr.yaml   | 14 +---
>>>>>  .../panel/panel-simple-lvds-dual-ports.yaml   | 20 +----
>>>>>  3 files changed, 78 insertions(+), 32 deletions(-)  create mode
>>>>> 100644
>>>>> Documentation/devicetree/bindings/display/lvds-dual-ports.yaml
>>>>>
>>>>> diff --git
>>>>> a/Documentation/devicetree/bindings/display/lvds-dual-ports.yaml
>>>>> b/Documentation/devicetree/bindings/display/lvds-dual-ports.yaml
>>>>> new file mode 100644
>>>>> index 000000000000..5f7a30640404
>>>>> --- /dev/null
>>>>> +++ b/Documentation/devicetree/bindings/display/lvds-dual-ports.yaml
>>>>> @@ -0,0 +1,76 @@
>>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML 1.2
>>>>> +---
>>>>> +$id: http://devicetree.org/schemas/display/lvds-dual-ports.yaml#
>>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>>> +
>>>>> +title: Dual-link LVDS Display Common Properties
>>>>> +
>>>>> +maintainers:
>>>>> +  - Liu Ying <victor.liu@nxp.com>
>>>>> +
>>>>> +description: |
>>>>> +  Common properties for LVDS displays with dual LVDS links. Extend
>>>>> +LVDS display
>>>>> +  common properties defined in lvds.yaml.
>>>>> +
>>>>> +  Dual-link LVDS displays receive odd pixels and even pixels
>>>>> + separately from  the dual LVDS links. One link receives odd pixels
>>>>> + and the other receives  even pixels. Some of those displays may
>>>>> + also use only one LVDS link to  receive all pixels, being odd and even agnostic.
>>>>> +
>>>>> +allOf:
>>>>> +  - $ref: lvds.yaml#
>>>>> +
>>>>> +properties:
>>>>> +  ports:
>>>>> +    $ref: /schemas/graph.yaml#/properties/ports
>>>>> +
>>>>> +    properties:
>>>>> +      port@0:
>>>>> +        $ref: /schemas/graph.yaml#/$defs/port-base
>>>>> +        unevaluatedProperties: false
>>>>> +        description: the first LVDS input link
>>>>> +
>>>>> +        properties:
>>>>> +          dual-lvds-odd-pixels:
>>>>> +            type: boolean
>>>>> +            description: the first LVDS input link for odd pixels
>>>>> +
>>>>> +          dual-lvds-even-pixels:
>>>>> +            type: boolean
>>>>> +            description: the first LVDS input link for even pixels
>>>>> +
>>>>> +        oneOf:
>>>>> +          - required: [dual-lvds-odd-pixels]
>>>>> +          - required: [dual-lvds-even-pixels]
>>>>> +          - properties:
>>>>> +              dual-lvds-odd-pixels: false
>>>>> +              dual-lvds-even-pixels: false
>>>>> +
>>>>> +      port@1:
>>>>> +        $ref: /schemas/graph.yaml#/$defs/port-base
>>>>> +        unevaluatedProperties: false
>>>>> +        description: the second LVDS input link
>>>>> +
>>>>> +        properties:
>>>>> +          dual-lvds-odd-pixels:
>>>>> +            type: boolean
>>>>> +            description: the second LVDS input link for odd pixels
>>>>> +
>>>>> +          dual-lvds-even-pixels:
>>>>> +            type: boolean
>>>>> +            description: the second LVDS input link for even pixels
>>>>> +
>>>>> +        oneOf:
>>>>> +          - required: [dual-lvds-odd-pixels]
>>>>> +          - required: [dual-lvds-even-pixels]
>>>>> +          - properties:
>>>>> +              dual-lvds-odd-pixels: false
>>>>> +              dual-lvds-even-pixels: false
>>>>
>>>> Hmm, I should require port@0 or port@1.
>>>
>>> For dual LVDS, you need 3 ports as common use case
>>
>> For LVDS panels, only two ports for LVDS sink are needed.
>> For display bridges with LVDS sink, one additional output port is needed.  However, I'm not sure if
>> this output port should be documented in this binding or not, because it doesn't look common enough
>> considering the LVDS panels.
>>
>>>
>>> 2 input ports and 1 outport and all are required properties.
>>
>> The output port cannot be required for LVDS panels at least.
> 
> Ack.
> 
>>
>> We need to require one or two input ports, because IT6263 may use one LVDS link or two.
> 
> This patch is for generic dual link common cases and is not applicable for IT6263 single link case.

Based on previous discussion(especially Dmitry's suggestion),
this binding should cover display bridges that can use one
LVDS sink port or two LVDS sink ports, like IT6263.  To be
clear, those bridges may have two modes(supported by one
chip) - single LVDS sink link mode and dual LVDS sink link
mode.  Those bridges are considered as common dual-link
LVDS displays.  That's why I was asked to extract the common
properties to this schema when adding IT6263 DT binding.   

> 
> 
> Cheers,
> Biju
> 
>>
>>>
>>> Cheers,
>>> Biju
>>>
>>>> Will wait a while for comments and add this in next version.
>>>>
>>>> --8<--
>>>>     anyOf:
>>>>       - required:
>>>>           - port@0
>>>>       - required:
>>>>           - port@1
>>>> --8<--
>>>>
>>>>> +
>>>>> +required:
>>>>> +  - ports
>>>>> +
>>>>> +additionalProperties: true
>>>>> +
>>>>> +...
>>>>
>>>> [...]
>>>>
>>>> --
>>>> Regards,
>>>> Liu Ying
>>>
>>
>> --
>> Regards,
>> Liu Ying
> 

-- 
Regards,
Liu Ying

