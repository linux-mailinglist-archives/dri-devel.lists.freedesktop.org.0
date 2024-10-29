Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 814479B44E5
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2024 09:51:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAA1B10E5D7;
	Tue, 29 Oct 2024 08:51:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="i1wtDLMD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazon11011071.outbound.protection.outlook.com [52.101.125.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAF6410E5DB
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2024 08:51:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UxKaNw7ByCUOdRdmTCFsmv9REBsfKmhKvXMLzxoC/7ycl0Djjx4QNN/4f+CADgF8bAPE+XgZN1JxC8EbB6Qdf58TX6+N9lSc55o9rSWG6zjE/eB9cIOU1rYp9FgjGCX94m/9JBrVprHvttJfiKuswJZ9i9NfgK28m/W5aUPsgyVwO8ybAf1lCo8Sj2LazKvRBm9OCtZiyO5aPg10nBiNDndk2k4owMkCxTEroS+MgKVOdL3TmWTDyQHtUv+uFT3S46qH7C8Sv9d56P5OIBElYNbYJQmdYOEwWtURJ2DbKhPXZNhUwoZk6jPMAvvcSqgie9NU5aqpglhZUs9waugrAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=64keAG72pFrpgpzyc2TF9hwCJoCQRf0G+c8Zljx7z8s=;
 b=bZdwhYHn9EyMyRnA3VAW7fqlZfdB0TsubTG47TNKu9tWqeharqeTr5sOq0/YBAZWk/3jX6Jl1/qHhAjD7cPq1pOOnsg3Oingd+ocQAmwRFe5CZockWksqh02AwL42lqS7u+a6MA2OQEkAT91w/FyM5ukmuKxeTgTCjDubRRmAmuNVEDjcxMBSHhIx1Tv59iLvuWe3u35fjlAR7DBwLwByx0hvnh9dsRV1B93aFARQ1/M0Fli9wqH1PetbiNox0q9LaRH289nZ3M7B3A9PorL43vErna0/V9G0GRXBRX9RDHeqQ+VtjLJbc0TJKjkO9GxuSbUOtyBtgQmdC4XbJLQDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=64keAG72pFrpgpzyc2TF9hwCJoCQRf0G+c8Zljx7z8s=;
 b=i1wtDLMDekazz/AW5FWLhdRPr3VqQpEirZmOG/jKwQq6NQ0j8YPNY9mDYxfsEsaDMlowO7i079Mz9IlA7xlTTertDi8B9fu92k1XM5OLuJXYDPtzYLkww9lrHg/zHQBuJL1osDOL+kdICf/xZoz1FIAjsGmPl+99jqjyMMGRN70=
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com (2603:1096:400:3c0::7)
 by OSRPR01MB11859.jpnprd01.prod.outlook.com (2603:1096:604:235::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.29; Tue, 29 Oct
 2024 08:51:39 +0000
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::7497:30af:3081:1479]) by TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::7497:30af:3081:1479%7]) with mapi id 15.20.8093.024; Tue, 29 Oct 2024
 08:51:38 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Liu Ying <victor.liu@nxp.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
CC: "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>,
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>, "rfoss@kernel.org"
 <rfoss@kernel.org>, laurent.pinchart <laurent.pinchart@ideasonboard.com>,
 "jonas@kwiboo.se" <jonas@kwiboo.se>, "jernej.skrabec@gmail.com"
 <jernej.skrabec@gmail.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "mripard@kernel.org"
 <mripard@kernel.org>, "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "airlied@gmail.com" <airlied@gmail.com>, "simona@ffwll.ch" <simona@ffwll.ch>, 
 "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "quic_jesszhan@quicinc.com" <quic_jesszhan@quicinc.com>, "mchehab@kernel.org"
 <mchehab@kernel.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de"
 <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will@kernel.org"
 <will@kernel.org>, "sakari.ailus@linux.intel.com"
 <sakari.ailus@linux.intel.com>, "hverkuil@xs4all.nl" <hverkuil@xs4all.nl>,
 "tomi.valkeinen@ideasonboard.com" <tomi.valkeinen@ideasonboard.com>,
 "quic_bjorande@quicinc.com" <quic_bjorande@quicinc.com>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>,
 "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>, "arnd@arndb.de"
 <arnd@arndb.de>, "nfraprado@collabora.com" <nfraprado@collabora.com>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>, Prabhakar Mahadev Lad
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, "sam@ravnborg.org"
 <sam@ravnborg.org>, "marex@denx.de" <marex@denx.de>
Subject: RE: [PATCH v4 08/13] dt-bindings: display: Document dual-link LVDS
 display common properties
Thread-Topic: [PATCH v4 08/13] dt-bindings: display: Document dual-link LVDS
 display common properties
Thread-Index: AQHbKOKZPN4b66+xp0G7h8Y65TjgzbKdVYDggAAKTwCAAA0QUA==
Date: Tue, 29 Oct 2024 08:51:38 +0000
Message-ID: <TYCPR01MB11332FF433F4E10E4D0B7FE2B864B2@TYCPR01MB11332.jpnprd01.prod.outlook.com>
References: <20241028023740.19732-1-victor.liu@nxp.com>
 <20241028023740.19732-9-victor.liu@nxp.com>
 <TY3PR01MB11346FDF74840ADF7273A218D864B2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <69cfeb75-696e-43c4-ad27-aaf9ad3c6c78@nxp.com>
In-Reply-To: <69cfeb75-696e-43c4-ad27-aaf9ad3c6c78@nxp.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11332:EE_|OSRPR01MB11859:EE_
x-ms-office365-filtering-correlation-id: 98aca624-1cd5-4b70-1aef-08dcf7f6e6e4
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?aFV1THZWMWxyNVZZNmVYQlB0Nk82ZzhlVzRtejU2SjhQSmRBOXI0M21FcXA0?=
 =?utf-8?B?dzJLeEwxUFVSNSs2SVpBUERvb0pBVWZqaHgxTVBBdHBJS1RrbFVqaWRQQ2ZB?=
 =?utf-8?B?cWRDNTVxd3dkYXpYTXNnc2VBS0R5SG0ycWpkTFFwOU5DbVlXTVJnblVmZ0hn?=
 =?utf-8?B?eU1HcVptei8yOVgwSXUrZXNkamJXY244ZHZzZ2ZGS2hrYWhDOUlIb1hrWmFE?=
 =?utf-8?B?WDIrU2hiY20xTjlidE9ZaE00UXJVTnZLUXVmRU9RS0picjVtb0t2b2k5cUlH?=
 =?utf-8?B?MjV4bFkvUDg4S1hROEhLK2RMQ0pZT0w0c2JSZHUwTTRYajFtMlpYeXNxSnFK?=
 =?utf-8?B?bGJ6eWlzeWdEOHB5cWpsZDB4UHkyaUJNcEg1Ym9jZUhUc1RubWN0dTZ1U3ls?=
 =?utf-8?B?SUwyRk9SZEVtSnRiNFJvb2FraXViYjVZbzd0S01jWXppSm8wY2xEd2NhNWNG?=
 =?utf-8?B?WDFTa05Qb0RaK2xDQTJaaXVvZzc1dlMvRmY0b0tOZWUwc1pwKzZvTWZnNDcr?=
 =?utf-8?B?Q3hxSWYrOGdHQjhoZEtkNHlTNmFIR2N4QW9OU3Y3QmFSdEZCMGttMkVrUnFz?=
 =?utf-8?B?em93dWNITExHRVJlNDQyb1YwK01IRllvTU5DVTJ5ZlZqMksyL1NJbGpRdENW?=
 =?utf-8?B?eUh1QThaTE4xOHdTdnd2TVd3USszQlR1STU1cWNzVkFFaHRTVnRzWStMcU9p?=
 =?utf-8?B?VURNYjdtbkJCdit0THQ4NjVEMjdGMjJ2MnE0WGo2Zkl5ei85WTljUS9ZUU8y?=
 =?utf-8?B?OHVYQ1psSzV5R2RjZy92UWZVKzQ3OGdObTV6cHo3NUlYeU95UlIrbEdWRVFh?=
 =?utf-8?B?SS81cFd3eGpxU2MxL0p0TGVRY3FnUXZWaWpqV00wdDdTWjlVbTVaY01tdlZn?=
 =?utf-8?B?eFo5ajVSaVBEd2JNR0dGMi9vM0hxVTFmMEtmbXJaWGduZ3QybUVzTnowMDU4?=
 =?utf-8?B?NGZuS2gzM2hlWUJnOUJFVkVGRFNqdmZ5b0xyMmFuWGl2Vk1UWklDU3VURnN6?=
 =?utf-8?B?RWdFM05zY29BTDlVRnorcWQ4WTNOR285QnA5RjVKOWRGV0JUUWJDR2l3R0M1?=
 =?utf-8?B?V09reXhlNmRSV2h2Qm1SdEZuZHBQeHA0bHkxNHNqY1M4Mk9YNTNyenNScXh0?=
 =?utf-8?B?aXBKQWZUTjlHeWFucERPNzNESGNad2NXQ012MFJJWE1zWExheVZlaUoreDQ2?=
 =?utf-8?B?WmJpNEtGL3JLaHVFd2lsQmwxS1ovTkdJaittTDZTQk5Db0VobE5sY1JuNVVV?=
 =?utf-8?B?a2ZzZURib2F3WHJ5ZHpqWk5vS29peERBVEkxYmN4SlUwMnNmQmRVbFZPeC9P?=
 =?utf-8?B?NVpVeXJZRXpkTkVPbW9EMXNYRzBmOTZ4L1A0dU42S09ETTlFU24yMkJkZmwv?=
 =?utf-8?B?WjJRUWdNcFk5RUlLVnJNUDlaQytNTlFLZ0pFbXhmd3dZSFU2dmtEdDhHYXF1?=
 =?utf-8?B?bXZ5ZEpkUE8rUWdGRkNEMEJad3l3MWhRR3VzcXRXWHRqQ2hwOGdrSXZNaVRB?=
 =?utf-8?B?cXM2OS9ETDdjWEpkNHFTVEhENHdFTnJhZlh3bHNSMndySXpaWkVJSXRHb2VH?=
 =?utf-8?B?NlBaamQ3Mnp0cGtVYjg5Qys2SUUxb0M4YjBhSnFBRSs3bVVqVWdCR1M2NHNp?=
 =?utf-8?B?bXdEWW1jajR5RFZrTUIzRm1yMzFkL3RWUk1NTW9LWDFBVWh0UlFZMHRLSzFF?=
 =?utf-8?B?R3dvQmRZL1BOMnREMEgzM0xiK1FQK1ZNMXpFbG5rV3ljVTF6SEtzdzVMVXNh?=
 =?utf-8?Q?8WiSuTAuThXVPIW/au4tMRbwwnurM5CgH/pqUC8?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB11332.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NlROVE5KalB4RWVWZkdQaXFmb1NROGZDWi9TZkYzOEpxUjF2OUpqcE1QSmZ6?=
 =?utf-8?B?ZWt1eHgwNXRpZWlFV3B0Zmc3UktaMFlObmR2bGU4L1hZTExmSWJHNEh1VGJu?=
 =?utf-8?B?SDJuNWtsa2pCRGNqeXg5M1FhMmx5MDdqOFA0VDhiTHlWaFlUOW9nOEFzaWRa?=
 =?utf-8?B?bCtUcXhmRUM3YWg0YXoyZ2tvY08vakZaL3Z2OEhUcFp5OGppOTV1aVNaSEt0?=
 =?utf-8?B?QnBCSkZmMWtia0YyQ0J2aHhBSEdVbWlFQmJGU0kyV0xXRVNvaDY0QkREa294?=
 =?utf-8?B?em5GNW1UYkQyVDhQMDlQakxLMVlDb3Q4cHo2TFgzekYwVUVzRVZxOW9uMW93?=
 =?utf-8?B?TWtwRS8yUUNIVE93c1BLV05CWFdWRDlHUjNkenNUbTBCY1ZZOHRCSEdxeUhX?=
 =?utf-8?B?M2ZqZC9wVEQ0U2VSMXord0s5UXJNZVR0NmVNNURrbUQ3UmdRaDN5UU5JR3NQ?=
 =?utf-8?B?QnFOVDBTS1Q5ejlRaGRiOXBCNkR6ZXM2UENEQzVUT1g5cjladEtvdi9ENTNV?=
 =?utf-8?B?VWlidDJOQkwrbENoTFBQeFkvMTRNOC9ac1FzVHdkTFFpRHJweDRJOHcxNHBu?=
 =?utf-8?B?cWtENXhERHpYZGZXYXVLanMwd01PQUlDR3lURFZ1N0RkN3ZiTER5S21jY0xj?=
 =?utf-8?B?MWp4YkQ1VENtZUNJZUNGbndYOUtxTGZhWGFHSDNWRHZQTHhqV0ViNi9BQkdV?=
 =?utf-8?B?WEpsVEpMaXFUamtpclJPYjZ0ZDF6cWhMUjRXc2dyd2R0RkMyR3JmVU9lUFpF?=
 =?utf-8?B?aDF3WHkxZE1XZjN4MUhoOGlDNno4OU9razVNR3g1R0psSkIyTnowNEd0SlhQ?=
 =?utf-8?B?dUdBQlNVYXU1M292V3lXSGpXOHVaWVZwdnpBdmN1QnZXSXYwL3BNTENrRGVD?=
 =?utf-8?B?TWpNM0dyTmg3K1FveFJUekRtWitBVXBtd05iUGhTeWE4Z1dkZ2RYOHozTjVt?=
 =?utf-8?B?eVRsWDhUUnVSMm1FTnpDVkVjTWpUUmZmTTBjMWlFK0RwWmJaQ28rOThwd1RP?=
 =?utf-8?B?NEhzQTdxcW05NUd5T21pVGpRSms2WklZRGpzOVU0ZE5GaDNwZmh1ZHYvSFQx?=
 =?utf-8?B?SndHSXQ3MjY5Y1FiZlRZMXBZMUpvemxLMUp5bFZDY1hVRm9rQ0ZxRkVoV1Nm?=
 =?utf-8?B?WDVMclZNQ3gxN0pxSktBZ1dPYjRSM3NLMTFJL0M5S3MrRmNLMXhsNDhSVHov?=
 =?utf-8?B?cVBIKzc2TVJRWTJ0a3lVSkcyY25wRlFjOEZhQk1DUWIyU1hCdUZKZm42NCs3?=
 =?utf-8?B?N1R3ZjBUeEVmN1JweFdxYmEyZmQ3MGNlN0NIWk9zSmZGd0xybXN5NHg1ZlFi?=
 =?utf-8?B?UkFLd3NTeFowVFVZU2NZTkNjSkdRYnlycnl1cHF0Z0FvNHgxcVZWUFVNbXcw?=
 =?utf-8?B?UXJDdVB1U2xEQTB1NlhGQVVlRkZNSjhiWkNNekZUVnhZMjFLdll4Y3d3M3RF?=
 =?utf-8?B?ZGoyeFU0YU1pSVErZm1Hc3JRREhqaC9ydEtJSElpODhnVW5oRU00eUVaam9p?=
 =?utf-8?B?aHdBUVpBNkRiMzhWd2lEYjNQSjgvRjNhNE5wb1Vockl3YVk2N0FHSXg4Y0FS?=
 =?utf-8?B?Nmx3RTdVRnB1ZXppa0oxTzhKZ3huMXRqbFF2M2xjQmh5ZlViNGxxZ3VUUVRM?=
 =?utf-8?B?TTYxQmtBV3F3Tm8rQ2J1OUF5K3FPd09DUFlhTnh1MVBLZXRCRVM4bkpNTU9E?=
 =?utf-8?B?L1J1WFFaWjlOQndxRXYyRVhBZ1Y3dGhUbmplUktHNEoyUndlRzh0TVkyelFr?=
 =?utf-8?B?N0VtdnljQVlsa1ZSYU5RSUYvejZOZHEyYzR5TlRIU1F2RGNpMEthWEk1UXJ1?=
 =?utf-8?B?NmpCQ0xaZVZPbjlPVXlHMzhDaVh4dmFIZG5FK0gyWUZUNWk2Znl3cFRubXpB?=
 =?utf-8?B?OG9rblUzNzB3Y3R4WE5Mcy8yWXJSVWJGZlMxRkZPSEFSRkJhMzdISitBaUtl?=
 =?utf-8?B?czBsNU1lTUNaUzdZdFZleU12UW8vVXJzSWFqTzZVd1hPYUtlb01GUTIwWkpI?=
 =?utf-8?B?a3haZ2lTeFpxVEtMQkpENXJnaitEZFF5ZjhnRXhGQ0tKTThTZ3IvVHhlTkUy?=
 =?utf-8?B?ZDlpNmx3UmttWnlBNVZVVUhWQ3UySVlaUGkvUThGUVk0MlpnU21FRy95M0h6?=
 =?utf-8?B?clVxVHFHbk9PR2xheVVGQUIxUkdPbGY0ZmFkUUs2eU53RitQLzBqdlhnSWc3?=
 =?utf-8?B?L2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11332.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98aca624-1cd5-4b70-1aef-08dcf7f6e6e4
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2024 08:51:38.7401 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UL3haZHSmaXfU0WRqQNJsKN7MrNkpxyca9vyizOUgIMJIJMvzii1Qfm7sg02HAgU3yiRinZrm6aGFtKyDJQSGVRT7QFfIssdXmhldDrNYkE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSRPR01MB11859
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

SGkgTGl1IFlpbmcsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogZHJp
LWRldmVsIDxkcmktZGV2ZWwtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFs
ZiBPZiBMaXUgWWluZw0KPiBTZW50OiAyOSBPY3RvYmVyIDIwMjQgMDg6MDINCj4gU3ViamVjdDog
UmU6IFtQQVRDSCB2NCAwOC8xM10gZHQtYmluZGluZ3M6IGRpc3BsYXk6IERvY3VtZW50IGR1YWwt
bGluayBMVkRTIGRpc3BsYXkgY29tbW9uIHByb3BlcnRpZXMNCj4gDQo+IE9uIDEwLzI5LzIwMjQs
IEJpanUgRGFzIHdyb3RlOg0KPiA+IEhpIExpdSBZaW5nLA0KPiANCj4gSGkgQmlqdSwNCj4gDQo+
ID4NCj4gPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPj4gRnJvbTogTGl1IFlpbmcg
PHZpY3Rvci5saXVAbnhwLmNvbT4NCj4gPj4gU2VudDogMjggT2N0b2JlciAyMDI0IDAyOjM4DQo+
ID4+IFN1YmplY3Q6IFtQQVRDSCB2NCAwOC8xM10gZHQtYmluZGluZ3M6IGRpc3BsYXk6IERvY3Vt
ZW50IGR1YWwtbGluaw0KPiA+PiBMVkRTIGRpc3BsYXkgY29tbW9uIHByb3BlcnRpZXMNCj4gPj4N
Cj4gPj4gRHVhbC1saW5rIExWRFMgZGlzcGxheXMgcmVjZWl2ZSBvZGQgcGl4ZWxzIGFuZCBldmVu
IHBpeGVscyBzZXBhcmF0ZWx5DQo+ID4+IGZyb20gZHVhbCBMVkRTIGxpbmtzLiAgT25lIGxpbmsg
cmVjZWl2ZXMgb2RkIHBpeGVscyBhbmQgdGhlIG90aGVyDQo+ID4+IHJlY2VpdmVzIGV2ZW4gcGl4
ZWxzLiAgU29tZSBvZiB0aG9zZSBkaXNwbGF5cyBtYXkgYWxzbyB1c2Ugb25seSBvbmUNCj4gPj4g
TFZEUyBsaW5rIHRvIHJlY2VpdmUgYWxsIHBpeGVscywgYmVpbmcgb2RkIGFuZCBldmVuIGFnbm9z
dGljLiAgRG9jdW1lbnQgY29tbW9uIHByb3BlcnRpZXMgZm9yIHRob3NlDQo+IGRpc3BsYXlzIGJ5
IGV4dGVuZGluZyBMVkRTIGRpc3BsYXkgY29tbW9uIHByb3BlcnRpZXMgZGVmaW5lZCBpbiBsdmRz
LnlhbWwuDQo+ID4+DQo+ID4+IFN1Z2dlc3RlZC1ieTogRG1pdHJ5IEJhcnlzaGtvdiA8ZG1pdHJ5
LmJhcnlzaGtvdkBsaW5hcm8ub3JnPg0KPiA+PiBTaWduZWQtb2ZmLWJ5OiBMaXUgWWluZyA8dmlj
dG9yLmxpdUBueHAuY29tPg0KPiA+PiAtLS0NCj4gPj4gdjQ6DQo+ID4+ICogU3F1YXNoIGNoYW5n
ZSBmb3IgYWR2YW50ZWNoLGlkay0yMTIxd3IueWFtbCBhbmQNCj4gPj4gICBwYW5lbC1zaW1wbGUt
bHZkcy1kdWFsLXBvcnRzLnlhbWwgd2l0aCBsdmRzLWR1YWwtcG9ydHMueWFtbC4gIChSb2IpDQo+
ID4+ICogSW1wcm92ZSBkZXNjcmlwdGlvbiBpbiBsdmRzLWR1YWwtcG9ydHMueWFtbC4gIChLcnp5
c3p0b2YpDQo+ID4+DQo+ID4+IHYzOg0KPiA+PiAqIE5ldyBwYXRjaC4gIChEbWl0cnkpDQo+ID4+
DQo+ID4+ICAuLi4vYmluZGluZ3MvZGlzcGxheS9sdmRzLWR1YWwtcG9ydHMueWFtbCAgICAgfCA3
NiArKysrKysrKysrKysrKysrKysrDQo+ID4+ICAuLi4vZGlzcGxheS9wYW5lbC9hZHZhbnRlY2gs
aWRrLTIxMjF3ci55YW1sICAgfCAxNCArLS0tDQo+ID4+ICAuLi4vcGFuZWwvcGFuZWwtc2ltcGxl
LWx2ZHMtZHVhbC1wb3J0cy55YW1sICAgfCAyMCArLS0tLQ0KPiA+PiAgMyBmaWxlcyBjaGFuZ2Vk
LCA3OCBpbnNlcnRpb25zKCspLCAzMiBkZWxldGlvbnMoLSkgIGNyZWF0ZSBtb2RlDQo+ID4+IDEw
MDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9sdmRzLWR1YWwt
cG9ydHMueWFtbA0KPiA+Pg0KPiA+PiBkaWZmIC0tZ2l0DQo+ID4+IGEvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbHZkcy1kdWFsLXBvcnRzLnlhbWwNCj4gPj4gYi9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9sdmRzLWR1YWwtcG9ydHMu
eWFtbA0KPiA+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiA+PiBpbmRleCAwMDAwMDAwMDAwMDAu
LjVmN2EzMDY0MDQwNA0KPiA+PiAtLS0gL2Rldi9udWxsDQo+ID4+ICsrKyBiL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2x2ZHMtZHVhbC1wb3J0cy55YW1sDQo+ID4+
IEBAIC0wLDAgKzEsNzYgQEANCj4gPj4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwt
Mi4wLW9ubHkgT1IgQlNELTItQ2xhdXNlKSAlWUFNTCAxLjINCj4gPj4gKy0tLQ0KPiA+PiArJGlk
OiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9kaXNwbGF5L2x2ZHMtZHVhbC1wb3J0cy55
YW1sIw0KPiA+PiArJHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9j
b3JlLnlhbWwjDQo+ID4+ICsNCj4gPj4gK3RpdGxlOiBEdWFsLWxpbmsgTFZEUyBEaXNwbGF5IENv
bW1vbiBQcm9wZXJ0aWVzDQo+ID4+ICsNCj4gPj4gK21haW50YWluZXJzOg0KPiA+PiArICAtIExp
dSBZaW5nIDx2aWN0b3IubGl1QG54cC5jb20+DQo+ID4+ICsNCj4gPj4gK2Rlc2NyaXB0aW9uOiB8
DQo+ID4+ICsgIENvbW1vbiBwcm9wZXJ0aWVzIGZvciBMVkRTIGRpc3BsYXlzIHdpdGggZHVhbCBM
VkRTIGxpbmtzLiBFeHRlbmQNCj4gPj4gK0xWRFMgZGlzcGxheQ0KPiA+PiArICBjb21tb24gcHJv
cGVydGllcyBkZWZpbmVkIGluIGx2ZHMueWFtbC4NCj4gPj4gKw0KPiA+PiArICBEdWFsLWxpbmsg
TFZEUyBkaXNwbGF5cyByZWNlaXZlIG9kZCBwaXhlbHMgYW5kIGV2ZW4gcGl4ZWxzDQo+ID4+ICsg
c2VwYXJhdGVseSBmcm9tICB0aGUgZHVhbCBMVkRTIGxpbmtzLiBPbmUgbGluayByZWNlaXZlcyBv
ZGQgcGl4ZWxzDQo+ID4+ICsgYW5kIHRoZSBvdGhlciByZWNlaXZlcyAgZXZlbiBwaXhlbHMuIFNv
bWUgb2YgdGhvc2UgZGlzcGxheXMgbWF5DQo+ID4+ICsgYWxzbyB1c2Ugb25seSBvbmUgTFZEUyBs
aW5rIHRvICByZWNlaXZlIGFsbCBwaXhlbHMsIGJlaW5nIG9kZCBhbmQgZXZlbiBhZ25vc3RpYy4N
Cj4gPj4gKw0KPiA+PiArYWxsT2Y6DQo+ID4+ICsgIC0gJHJlZjogbHZkcy55YW1sIw0KPiA+PiAr
DQo+ID4+ICtwcm9wZXJ0aWVzOg0KPiA+PiArICBwb3J0czoNCj4gPj4gKyAgICAkcmVmOiAvc2No
ZW1hcy9ncmFwaC55YW1sIy9wcm9wZXJ0aWVzL3BvcnRzDQo+ID4+ICsNCj4gPj4gKyAgICBwcm9w
ZXJ0aWVzOg0KPiA+PiArICAgICAgcG9ydEAwOg0KPiA+PiArICAgICAgICAkcmVmOiAvc2NoZW1h
cy9ncmFwaC55YW1sIy8kZGVmcy9wb3J0LWJhc2UNCj4gPj4gKyAgICAgICAgdW5ldmFsdWF0ZWRQ
cm9wZXJ0aWVzOiBmYWxzZQ0KPiA+PiArICAgICAgICBkZXNjcmlwdGlvbjogdGhlIGZpcnN0IExW
RFMgaW5wdXQgbGluaw0KPiA+PiArDQo+ID4+ICsgICAgICAgIHByb3BlcnRpZXM6DQo+ID4+ICsg
ICAgICAgICAgZHVhbC1sdmRzLW9kZC1waXhlbHM6DQo+ID4+ICsgICAgICAgICAgICB0eXBlOiBi
b29sZWFuDQo+ID4+ICsgICAgICAgICAgICBkZXNjcmlwdGlvbjogdGhlIGZpcnN0IExWRFMgaW5w
dXQgbGluayBmb3Igb2RkIHBpeGVscw0KPiA+PiArDQo+ID4+ICsgICAgICAgICAgZHVhbC1sdmRz
LWV2ZW4tcGl4ZWxzOg0KPiA+PiArICAgICAgICAgICAgdHlwZTogYm9vbGVhbg0KPiA+PiArICAg
ICAgICAgICAgZGVzY3JpcHRpb246IHRoZSBmaXJzdCBMVkRTIGlucHV0IGxpbmsgZm9yIGV2ZW4g
cGl4ZWxzDQo+ID4NCj4gPg0KPiA+IHBvcnRAMCB3ZSBrbm93IGl0IGlzIGZpcnN0IGxpbmsNCj4g
PiBwb3J0QDEgd2Uga25vdyBpdCBpcyBzZWNvbmQgbGluay4NCj4gPiBkdWFsLWx2ZHMtb2RkLXBp
eGVsczogV2Uga25vdyBpdCBpcyBmb3Igb2RkIHBpeGVscy4NCj4gPiBkdWFsLWx2ZHMtZXZlbi1w
aXhlbHM6IFdlIGtub3cgaXQgaXMgZm9yIG9kZCBwaXhlbHMuDQo+ID4NCj4gPiBOb3Qgc3VyZSwg
d2hldGhlciB3ZSBjYW4gZ2l2ZSBjb21tb24gZGVzY3JpcHRpb24gYW5kIGF2b2lkIHRoZQ0KPiA+
IGR1cGxpY2F0ZSBmcm9tIHBvcnRAMSA/Pw0KPiANCj4gWWVzLCBpdCdkIGJldHRlciB0byB1c2Ug
cGF0dGVyblByb3BlcnRpZXMuIFRoYW5rcy4NCj4gDQo+IC0tODwtLQ0KPiAgICAgcGF0dGVyblBy
b3BlcnRpZXM6DQo+ICAgICAgICdecG9ydEBbMDFdJCc6DQo+ICAgICAgICAgJHJlZjogL3NjaGVt
YXMvZ3JhcGgueWFtbCMvJGRlZnMvcG9ydC1iYXNlDQo+ICAgICAgICAgdW5ldmFsdWF0ZWRQcm9w
ZXJ0aWVzOiBmYWxzZQ0KPiAgICAgICAgIGRlc2NyaXB0aW9uOiB8DQo+ICAgICAgICAgICBwb3J0
QDAgaXMgZm9yIHRoZSBmaXJzdCBMVkRTIGlucHV0IGxpbmsuDQo+ICAgICAgICAgICBwb3J0QDEg
aXMgZm9yIHRoZSBzZWNvbmQgTFZEUyBpbnB1dCBsaW5rLg0KPiANCj4gICAgICAgICBwcm9wZXJ0
aWVzOg0KPiAgICAgICAgICAgZHVhbC1sdmRzLW9kZC1waXhlbHM6DQo+ICAgICAgICAgICAgIHR5
cGU6IGJvb2xlYW4NCj4gICAgICAgICAgICAgZGVzY3JpcHRpb246IExWRFMgaW5wdXQgbGluayBm
b3Igb2RkIHBpeGVscw0KPiANCj4gICAgICAgICAgIGR1YWwtbHZkcy1ldmVuLXBpeGVsczoNCj4g
ICAgICAgICAgICAgdHlwZTogYm9vbGVhbg0KPiAgICAgICAgICAgICBkZXNjcmlwdGlvbjogTFZE
UyBpbnB1dCBsaW5rIGZvciBldmVuIHBpeGVscw0KPiANCj4gICAgICAgICBvbmVPZjoNCj4gICAg
ICAgICAgIC0gcmVxdWlyZWQ6IFtkdWFsLWx2ZHMtb2RkLXBpeGVsc10NCj4gICAgICAgICAgIC0g
cmVxdWlyZWQ6IFtkdWFsLWx2ZHMtZXZlbi1waXhlbHNdDQo+ICAgICAgICAgICAtIHByb3BlcnRp
ZXM6DQo+ICAgICAgICAgICAgICAgZHVhbC1sdmRzLW9kZC1waXhlbHM6IGZhbHNlDQo+ICAgICAg
ICAgICAgICAgZHVhbC1sdmRzLWV2ZW4tcGl4ZWxzOiBmYWxzZQ0KPiANCj4gICAgIGFueU9mOg0K
PiAgICAgICAtIHJlcXVpcmVkOg0KPiAgICAgICAgICAgLSBwb3J0QDANCj4gICAgICAgLSByZXF1
aXJlZDoNCj4gICAgICAgICAgIC0gcG9ydEAxDQo+IC0tODwtLQ0KPiANCj4gPg0KPiA+DQo+ID4+
ICsNCj4gPj4gKyAgICAgICAgb25lT2Y6DQo+ID4+ICsgICAgICAgICAgLSByZXF1aXJlZDogW2R1
YWwtbHZkcy1vZGQtcGl4ZWxzXQ0KPiA+PiArICAgICAgICAgIC0gcmVxdWlyZWQ6IFtkdWFsLWx2
ZHMtZXZlbi1waXhlbHNdDQo+ID4+ICsgICAgICAgICAgLSBwcm9wZXJ0aWVzOg0KPiA+PiArICAg
ICAgICAgICAgICBkdWFsLWx2ZHMtb2RkLXBpeGVsczogZmFsc2UNCj4gPj4gKyAgICAgICAgICAg
ICAgZHVhbC1sdmRzLWV2ZW4tcGl4ZWxzOiBmYWxzZQ0KPiA+DQo+ID4gV2h5IHRoaXMgaXMgZmFs
c2UgaGVyZT8gb25lT2YgaXMgbm90IHN1ZmZpY2llbnQ/DQo+IA0KPiBUaGUgJ2ZhbHNlJyBpcyB1
c2VkIHdoZW4gdGhpcyBMVkRTIGxpbmsgd29ya3MgYWxvbmUgYXMgYSBzaW5nbGUgTFZEUyBsaW5r
LCBiZWluZyBvZGQgYW5kIGV2ZW4NCj4gYWdub3N0aWMuDQo+IA0KPiBUaGUgJ29uZU9mJyBhbGxv
d3MgYSBMVkRTIGxpbmsgdG8gYmUgZGVmaW5lZCBhcyBhIHNpbmdsZSBMVkRTIGxpbmsgb3Igb25l
IGxpbmsgb2YgZHVhbCBMVkRTIGxpbmtzLg0KDQpPaywgaXQgbWFrZXMgc2Vuc2UgZm9yIHNpbmds
ZSBMVkRTIGxpbmsuIE1heWJlIHJlbmFtZSB0aGUgZmlsZSB0byBsdmRzLWR1YWwtcG9ydHMueWFt
bC0+bHZkcy1wb3J0cy55YW1sDQp0byBtYWtlIGl0IGNsZWFyLCBpdCBpcyBmb3IgYWxsIExWRFMg
cG9ydHMsIGlmIGl0IGlzIGdvaW5nIHRvIGFkZHJlc3Mgc2luZ2xlIGxpbmsgY2FzZSBhc3dlbGw/
Pw0KDQpDaGVlcnMsDQpCaWp1DQoNCg==
