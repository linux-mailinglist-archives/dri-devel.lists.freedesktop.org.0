Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E73C5A5FD
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 23:46:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31AC110E951;
	Thu, 13 Nov 2025 22:46:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="V/l2yvq5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010058.outbound.protection.outlook.com [52.101.85.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E214310E951
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 22:45:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FRXq9IXLZH348y1nq1xnWhiTVqgI19Wy4ALj3SH+kxrnMVnuaoZY6yP7+6uHEUtMrLgBuAbroFDZ+aMz9FyuJf9VcAbLdyfT3TvQ5Ik5H2GxPF5HFPYKB7GrDAALQJHFcnlUdc0URJHWkNc4imIUxNHKmDinTd78VQVfj8qWfwHMLkRL9hKOV7f1r3tFs2NEYsyhjddWwa+oaS+C9rVqZ3v6p49QcMmXrTtCF+SM7MSw0hN53GJk76w/SY2GBb4IHzny8EFjX0F30zM7TrQxecsOUkD8LT41pRHvGMLj7DkjD1XaFdPGHr/EncQ2NPb/w9F2RWrMPjg0gJKr+FX6Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F6f3/zeu2qwQ8nE+acCB9sZtcR4ZMP7ePZXWRXo0I8U=;
 b=ior3MOF/m5iPr2cw4iekEjmAn8Q3NRs0tPm8Z6WigzmCWdXZjtKVpD6+SlZPy5pSXfLKiYeDRLI9fHEmwxA8yJYdyiE3V0VcVRf4j9DV4Imm59Vo8HvYrDcQwE04vAcFMBJMDPNAsdd8T7GS5RJ/1MHc6DAYceWlPbBJc59f9/1c5L0s0AobOWZQrb3lB92Gi197CSkcHBWS1F1Rb09mwqZ48JouIoQqZzy2Or8hnK7sOtFqOOOcXrgqDOkmLbX2TcQz2pAymP4PFwHyFtPMaTxYVqEiccJBik/F+nvP+kNtWqhvfLQbb3jx68KpoRBikpUx4y4GCrOplK3ho53YmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F6f3/zeu2qwQ8nE+acCB9sZtcR4ZMP7ePZXWRXo0I8U=;
 b=V/l2yvq558YJl8GPY/KKYGVby12IUsqjEmDr5KCZ8qtg4kxfxH1YcPNjcbiMS4n49PhqfuAIH9ZdA/DBR6Dfl+AmsT87UQmmeiFvn28lONoX3EohP7yC9lNSnFczUyLIrovo1N5Kh7nVotJ/9N5aDsW+Co2QetbIwIz9ggqXE4s=
Received: from MW4PR12MB7165.namprd12.prod.outlook.com (2603:10b6:303:21b::14)
 by CY5PR12MB6201.namprd12.prod.outlook.com (2603:10b6:930:26::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Thu, 13 Nov
 2025 22:45:57 +0000
Received: from MW4PR12MB7165.namprd12.prod.outlook.com
 ([fe80::a32f:9b78:fc2e:6076]) by MW4PR12MB7165.namprd12.prod.outlook.com
 ([fe80::a32f:9b78:fc2e:6076%5]) with mapi id 15.20.9298.010; Thu, 13 Nov 2025
 22:45:57 +0000
From: "Klymenko, Anatoliy" <Anatoliy.Klymenko@amd.com>
To: Sean Anderson <sean.anderson@linux.dev>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Tomi Valkeinen
 <tomi.valkeinen@ideasonboard.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Mike
 Looijmans <mike.looijmans@topic.nl>, David Airlie <airlied@gmail.com>, Thomas
 Zimmermann <tzimmermann@suse.de>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, Simona Vetter <simona@ffwll.ch>,
 "Simek, Michal" <michal.simek@amd.com>
Subject: RE: [PATCH 2/3] drm: zynqmp: Make the video plane primary
Thread-Topic: [PATCH 2/3] drm: zynqmp: Make the video plane primary
Thread-Index: AQHcVN1fOsfPV96fSkmPQZIoJ3U4R7TxK3pA
Date: Thu, 13 Nov 2025 22:45:57 +0000
Message-ID: <MW4PR12MB71651E0E82AD8E4898DBD017E6CDA@MW4PR12MB7165.namprd12.prod.outlook.com>
References: <20251113203715.2768107-1-sean.anderson@linux.dev>
 <20251113203715.2768107-3-sean.anderson@linux.dev>
In-Reply-To: <20251113203715.2768107-3-sean.anderson@linux.dev>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-11-13T22:12:31.0000000Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only; MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=3;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR12MB7165:EE_|CY5PR12MB6201:EE_
x-ms-office365-filtering-correlation-id: c8e68490-7e8e-4bf9-989b-08de23066928
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?JOOV26RXUPcLxO/UbtIGjSDsgmxS5ZY615YbLz/eGmQCRcwpHmEGKj4u4jSD?=
 =?us-ascii?Q?a+AlO6KXgCuKCTrVEDPK5hhnMoienIajhILXieGI9QmkfHveLeer/Nst+FGV?=
 =?us-ascii?Q?bFV0GGxdrKB8838caoB3nHOXUuAUiw6Vv0t/R7sS1RTdhwrYKIACn59ZE3zz?=
 =?us-ascii?Q?ZacdlW31c2j9jikbOAMNbFQExJk8vLCzXG8M69fbyEMO0JNvpVN+CPJyZ1Xg?=
 =?us-ascii?Q?FaOxBwb5p4+CDViyjzcoptvtDNBnWWhzwIF9QaRevyRTtbS5PxUG9h8PhV2D?=
 =?us-ascii?Q?0B9tlIY5lU8Prr/K1fsd7BPz6cPtJMvPw9mZVR+XhyZYv4Hp01LPOH9seTQ4?=
 =?us-ascii?Q?Pg4182NMS7AgS91yLwchV1l4kFv51dzCp78v7sMlizaa8QGZK3v0xGwRBNe1?=
 =?us-ascii?Q?NiqjGOlYa0GpO0+ap1oZ98v95m+uVXAnHtlfu+VUuOv+axwTUezTAiyy0r79?=
 =?us-ascii?Q?L9wNDFA8V23YANny+oIua7vl15IumSRRfn2LfEiE5BfP6qLbwFS0Oo2wd7v2?=
 =?us-ascii?Q?T8PWXRmGyyTPR1LTsrESimDLpwwUt7HjaAmwKEyJulGFp0YydgcVyZU4JTzA?=
 =?us-ascii?Q?iwxODtAf5aTCLAnryA0revf0ApDXw1RGuIVdtSZU35jD7e0zQlZkMgrhz6RF?=
 =?us-ascii?Q?3ObjlbKmI8sCGWPOGZVReCWGcuaJerE16UznOumAE2vr/DQ6/7eOr8GS64N7?=
 =?us-ascii?Q?z6ck3Hh6OaJKx8HVZI9kcAnQKMRkjKFDjdWogve8psnRrva97LatlbpOjAHp?=
 =?us-ascii?Q?mtmQwTlzUwQ/u4r2X7m7YANbQXrK+YDIAcTE8g4gWcbOOAqB2ZKBqIEibhRa?=
 =?us-ascii?Q?jf3pGarxULm2azyaNYV19kUAq9Xy1W8i/6Ts96dlwcoowjXHahHJDVlRjNNC?=
 =?us-ascii?Q?J6YaRYOhsxYOfT/fHMm+QsJS/P5QHfLIR88hyLYzc9WMGJaibgP10C2W/FGx?=
 =?us-ascii?Q?iW3kjFx7AHS0KEteHoWvplWhsRqAWYHgyH+K1KUpWxXH4DpdbZOj27ZiPN/+?=
 =?us-ascii?Q?dNz73osLUKkMQJqR22SulvvlfhoJcS61Bj04zRPkpXaUQH0JrM6O1Pkhi+sE?=
 =?us-ascii?Q?HkYPWEeizY2pMZPqBl0DyWawdUXjniu3TlMg9MnKN52NsNm1hId8ItWvHzD1?=
 =?us-ascii?Q?8zDUDSK6J230i/8p+7Htwcxiak30+izIyvVV6sdZqyuxzvxcqv6jFVz1WJLn?=
 =?us-ascii?Q?9bIQqetPDtglSqxE+vojb8jhGvjb9pNITatwelfoA+VvFy3r3Eia+nliNe1L?=
 =?us-ascii?Q?Ph2MWxx8drMEomtc/uQ+AXu+BcjcfFsGXP4gN6f/NXKHEfjzSTNMDXFvRToH?=
 =?us-ascii?Q?G49k6uhhQd3qIg1iQo0DFizSAtVftlkw2kogqhhidCOc1zJiFDtJsOQy0ItM?=
 =?us-ascii?Q?zfkRLGd6sCPNm2PLhSnbpucJSnAIAMxOASRMWR3V+HMelR+JkD7FJ5pfVSsb?=
 =?us-ascii?Q?sLzvLH14Al4QHDV0UiXlKohIS8BrEpxN/avVq8KrIv1RpMYU6HJJV1etNet4?=
 =?us-ascii?Q?Y4DcnbXyEaU/vnlPP6zEv9ajfxeCS4wKbPHJ?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR12MB7165.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?yzzS59AiqBJF1kC1GSbDblXwmpNU9aRjwQYqxu7G0vCnlJa5YSrw1/YDHW6+?=
 =?us-ascii?Q?EsXYo1P+kPYFymTGE5Y314mVzjqwQrsierS5U1fjDkHk4fJIeKuEGqoe7QGY?=
 =?us-ascii?Q?+Q44hEvRybeeaSEofOdaGUACztDLLOAqlVkW+c5CJnjntVERnR1Oq/1M+iwT?=
 =?us-ascii?Q?BKnKuvPBxiUVlTRaec7tTg/rZGcsyULSZyijGBgEE3GCtfL1jfk+c0u0rDTu?=
 =?us-ascii?Q?1IvaVlTQqN/KQPkLnBa1C2rFBHT2KPMCx9IoAsSgeFDCqvjQLFf6WiO8E2eu?=
 =?us-ascii?Q?vWovFPrLu7VQd0jd7nLZfJNZauvSol1C1XpyhT/wF5t7LWQy+wgS7h+c7ovX?=
 =?us-ascii?Q?/hLR5sTnKo4am78lCHLyx2spz0ymISy1E67GBjH95ldnPErp/LWtfNytt12J?=
 =?us-ascii?Q?kBGWCm2gK+gvRaFwWbtyNoO5CZi55YICfQp9ebdFQEf/BCQwVzEx+zvJMh9E?=
 =?us-ascii?Q?9CfX1iJ+XJPLNWe1niMKx+ZMOOKefyBLpJomQO1UHSbssmO5+KJl8XsPaa0C?=
 =?us-ascii?Q?qqp9dnZTBaagx3dkVcary/TDCfXMSuQ7jFtTiN8R+MOrosWcCrsJPKfvZY0x?=
 =?us-ascii?Q?/MmxsXVzgB5dx2eNSHt5imdUwJZWSnEMfEgd+331Yt+jY/+DBtId223ZpoD3?=
 =?us-ascii?Q?7Nkd2Y2hfp86+dJf3VW2Dc++k6tv1air1r76xCZR1nxs0cH1AzFkuZIBMXfG?=
 =?us-ascii?Q?rhUMLJSSt2GrJK/YSVI4CLkGCaMYRcp1tEtXSIVb2BHt/rOWQd+7nemI8ePq?=
 =?us-ascii?Q?mmHpMt/249OJ8CfXfk3vH680s0lcDaLT/kenLynzn7iNK9JT+4wIB7tAL4LL?=
 =?us-ascii?Q?pgUy7plAAhXAEkzbbnqZNvfEuqJ/KEZbxFCSGhfE9QNyHM6Tz7sjDud6i0TH?=
 =?us-ascii?Q?vwCRsUY0agAoR5Y0OVWqC/9nJdT8jloyTXYP53izgi10SO8gIG3kbuYisRvb?=
 =?us-ascii?Q?ljVTCLPEX7CuPTeVE+x1yLmN6ZWUt/2aVFpLguuTrKMyNbTVomBHX5Jm2P38?=
 =?us-ascii?Q?ZOFuIMQykc8vpC00FNJb1hCnX340Zj2/KKGt/6Ku3L1GCn2JNnxI+IA2g6UD?=
 =?us-ascii?Q?VriC9CVKIlo6hVioHI2znyZFb6aMiF5lgPHQotHXpuNuH5KBI1RQQBLk4uuF?=
 =?us-ascii?Q?pOHREQvrpFL0O++P71XVI8laprrgHhugKJzbn1OwE9xwGsBoWZQgC4X2Bb5n?=
 =?us-ascii?Q?YBxtlxO0N0YXP+L1nFKqfN4KkmeabWu4tIlCDqzSlCdxc9NMyPE8or+Lleay?=
 =?us-ascii?Q?UXXbQSykZmqfse0YxI3Lb8VOKTiKzp3FkEdGhZtA/X6JWfyOpc2/3GMfW5JD?=
 =?us-ascii?Q?BmtDK91rBBniMLo2uNW/QgATZqG7TT7s0phcmWhH80Sub45N6mhrYHc9QMrp?=
 =?us-ascii?Q?Ri6wlUinBc3n/vuta6GUx7gUegmFDLcZrS2l0dwOw9GzycPdPcGYz1IYHmv0?=
 =?us-ascii?Q?fRdKXM10kLxhyGNVPfhxljvm4RCA8gbczQupvm/URz4iW5u8ViPeYoOrbkGC?=
 =?us-ascii?Q?KMWoebSzI0JYyhUkhCFOPsaCxEWRg/02e/KAp48Wfe3WCUUcRxalTWefJcvg?=
 =?us-ascii?Q?RriDJ+ot7Fvnpa6sJUE=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB7165.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8e68490-7e8e-4bf9-989b-08de23066928
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2025 22:45:57.3690 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: n5XVm/LCMABTRgVh+qbyrtotujT2rIvwvqa8j/GN9K78kc00V6ImlGK4WN4LSlS+RIxFlx24WdJDGlzHly+5Aw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6201
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

[AMD Official Use Only - AMD Internal Distribution Only]

Hi Sean,

Thanks a lot for the patch (and tackling the alpha issue in general)

> -----Original Message-----
> From: Sean Anderson <sean.anderson@linux.dev>
> Sent: Thursday, November 13, 2025 12:37 PM
> To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>; Tomi Valkeinen
> <tomi.valkeinen@ideasonboard.com>; dri-devel@lists.freedesktop.org
> Cc: linux-kernel@vger.kernel.org; Mike Looijmans <mike.looijmans@topic.nl=
>;
> David Airlie <airlied@gmail.com>; Thomas Zimmermann
> <tzimmermann@suse.de>; Maarten Lankhorst
> <maarten.lankhorst@linux.intel.com>; Klymenko, Anatoliy
> <Anatoliy.Klymenko@amd.com>; Maxime Ripard <mripard@kernel.org>; linux-
> arm-kernel@lists.infradead.org; Simona Vetter <simona@ffwll.ch>; Simek,
> Michal <michal.simek@amd.com>; Sean Anderson
> <sean.anderson@linux.dev>
> Subject: [PATCH 2/3] drm: zynqmp: Make the video plane primary
>
> Caution: This message originated from an External Source. Use proper caut=
ion
> when opening attachments, clicking links, or responding.
>
>
> The zynqmp has two planes: "video" and "graphics". The video plane
>
> - Is on the bottom (zpos=3D0) (except when chroma keying as the master pl=
ane)
> - Supports "live" input (e.g. from an external source)
> - Supports RGB, YUV, and YCbCr formats, including XRGB8888
> - Does not support transparency, except via chroma keying (colorkey)
> - Must cover the entire screen (translation/resizing not supported)
>
> The graphics plane
>
> - Is on the top (zpos=3D1)
> - Supports "live" input (e.g. from an external source)
> - Supports RGB and YUV444 formats, but not XRGB8888
> - Supports transparency either via
>   - Global alpha channel, which disables per-pixel alpha when enabled
>   - Per-pixel alpha, which cannot be used with global alpha
>   - Chroma keying (colorkey)
> - Must cover the entire screen (translation/resizing not supported)
>
> Currently the graphics plane is the primary plane. Make the video plane
> the primary plane:
>
> - The video plane supports XRGB8888, which is the default 24-bit
>   colorspace for X. This results in improved performance when compared
>   to RGB565.
> - The graphics plane can be used as an overlay because it has a higher
>   z-pos and supports a per-pixel alpha channel. Unfortunately, clients
>   like weston cannot currently take advantage of this because they
>   expect overlay planes to support translation/resizing.
>
> One downside to this approach could be that the graphics plane has worse
> support for YUV and YCBCr, so it may be more difficult to compose video

Not just more difficult but practically impossible:
1. GFX (in Xilinx terminology) plane doesn't support pixel upscaling, so
no support for NV12, YUY2 and other common video pixel formats.
2. Both planes are unscalable, this means we can only output native
display resolution video on the top plane, or display thick black frame
around the picture. We are losing GFX masking capabilities.
3. We won't be able to render subtitles on top of the video.
Probably the only practical video player option remains here is to render
video to a texture and embed it into graphics composition.

> streams into the window of a media player. However, no existing software
> could rely on this because there is no way to enable the per-pixel alpha
> channel when the graphics plane is enabled. This makes it impossible to

This situation is a driver bug not a fatum. Per pixel alpha blending works
just fine if we disable global alpha. We just need to avoid enabling it whe=
n
we have alpha capable GFX plane format.

> "carve out" an area in the graphics plane where the video plane shows
> through. This limitation is addressed in the next patch, but it means we
> do not need to worry about compatibility in this area.
>
> An alternate approach could be to pretend that the graphics plane
> supports XRGB8888 by using the supported ARGB8888 mode instead and
> enabling the global alpha channel. However, this would rule out ever
> using the per-pixel alpha channel.
>
> Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
> ---
>
>  drivers/gpu/drm/xlnx/zynqmp_kms.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_kms.c
> b/drivers/gpu/drm/xlnx/zynqmp_kms.c
> index c80a2d4034f3..456ada9ac003 100644
> --- a/drivers/gpu/drm/xlnx/zynqmp_kms.c
> +++ b/drivers/gpu/drm/xlnx/zynqmp_kms.c
> @@ -161,8 +161,8 @@ static int zynqmp_dpsub_create_planes(struct
> zynqmp_dpsub *dpsub)
>                 if (!formats)
>                         return -ENOMEM;
>
> -               /* Graphics layer is primary, and video layer is overlay.=
 */
> -               type =3D i =3D=3D ZYNQMP_DPSUB_LAYER_VID
> +               /* Graphics layer is overlay, and video layer is primary.=
 */
> +               type =3D i =3D=3D ZYNQMP_DPSUB_LAYER_GFX
>                      ? DRM_PLANE_TYPE_OVERLAY :
> DRM_PLANE_TYPE_PRIMARY;
>                 ret =3D drm_universal_plane_init(&dpsub->drm->dev, plane,=
 0,
>                                                &zynqmp_dpsub_plane_funcs,
> @@ -322,7 +322,7 @@ static const struct drm_crtc_funcs
> zynqmp_dpsub_crtc_funcs =3D {
>
>  static int zynqmp_dpsub_create_crtc(struct zynqmp_dpsub *dpsub)
>  {
> -       struct drm_plane *plane =3D &dpsub->drm-
> >planes[ZYNQMP_DPSUB_LAYER_GFX];
> +       struct drm_plane *plane =3D &dpsub->drm-
> >planes[ZYNQMP_DPSUB_LAYER_VID];
>         struct drm_crtc *crtc =3D &dpsub->drm->crtc;
>         int ret;
>
> --
> 2.35.1.1320.gc452695387.dirty

Thank you,
Anatoliy
