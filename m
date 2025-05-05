Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB7A5AA8B96
	for <lists+dri-devel@lfdr.de>; Mon,  5 May 2025 07:20:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1612710E280;
	Mon,  5 May 2025 05:20:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="Voh9wS4C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2066.outbound.protection.outlook.com [40.107.237.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 878A110E268;
 Mon,  5 May 2025 05:20:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nd6M1F3tgcfAUsFhs+YRaAabELqsZhHXrKARwb37/a+AzqtoL65Bg1N3/lWGSgbfnrGcnrAT4l+Tr1KNNYG5iqe94wWqpEvm38MdI7RMIt1TH5IeGirUq/MSYOqIFsuIMVpUtjcWJt8ycPOCzZ57TRrYqNITXE5t3ZXNJnECzWrZmna7Z1pc4viYoILXNyKDX1PKwwIL0Zl4P9MuCj0d705UVS+Eahwcjc9cNm7GIx1BR1msOKu1vvFcg2V18uLmgaYc/jBLEsG5oq0rV12lxIncm9HvPW1+IQBvwIUoUZjWBFM7TtAcBq80DRVdsiXrfxWu5gzKTCoxeDZPUX9tjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lFyU5/hbSaPe8e1KyaR6ul1KyL5p7wm/aM1XucXISDI=;
 b=ynzD1DSEAZKN89Ue5wzQOrerbHMk1Axie7hzT770W73zhlEFW55P/ftBKXyHRsCU6KZZ800AvnG/ZE3PHs55o3lhXpGfmsDP49hTs1VjEiB5up5agYLsgpz0vbQytjjVuUHwhRzaimILX0rj3rowokIFne3AC+4fBopZ3mw79iElfV43X2hggd3Yfl4EcTcCaAhYPkxjLL2M3x00OUZ2GIlwxTNCDaE5Ofbbet7WXKPg0MG7idvlegMl+M87YqUpy78shhhrwDv+HqSkjCnAz1h4O1EIUA0jOrzCytUebVf13vRVs+vqmFkqdotD6f/Cgwquc4MmmvFb1xMbbwll8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lFyU5/hbSaPe8e1KyaR6ul1KyL5p7wm/aM1XucXISDI=;
 b=Voh9wS4C7u3zq/8geSu7473Qc5C0UBoRkQmPfon7ydOJOnvH4QQQYeJAUOHCGW6AK7ZkCQ+7fkhcvKyDNClmgDP3wFqEH2bEREsHLLm4lYBOzk38G9iEhNJdgGobvov0XRS/3AN86+HaSZb4T9QOCFSnFh8tKMS69BRfacu/SWGau+NG/iy+DrrB3kT93StZOTFMN7MXHdWl1QeFcCtsMm1WHcrdh2fUyZbNPB6MIAlXAAXErSNSZRfSAr6wLmigWJbIS3sOh0KeLl5EM8rOnW9MRaGH2LW5Q+OVAFTE9QlcGSB9hgLozRtOANT8PhXkUalGRrkK39yen8+Z/heI9Q==
Received: from PH8PR11MB6609.namprd11.prod.outlook.com (2603:10b6:510:1cc::16)
 by PH7PR11MB6881.namprd11.prod.outlook.com (2603:10b6:510:200::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.24; Mon, 5 May
 2025 05:20:26 +0000
Received: from PH8PR11MB6609.namprd11.prod.outlook.com
 ([fe80::ebc1:5d63:a07c:60d]) by PH8PR11MB6609.namprd11.prod.outlook.com
 ([fe80::ebc1:5d63:a07c:60d%4]) with mapi id 15.20.8699.022; Mon, 5 May 2025
 05:20:26 +0000
From: <Manikandan.M@microchip.com>
To: <luca.ceresoli@bootlin.com>
CC: <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>, <rfoss@kernel.org>,
 <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@gmail.com>, <jagan@amarulasolutions.com>,
 <shawnguo@kernel.org>, <s.hauer@pengutronix.de>, <kernel@pengutronix.de>,
 <festevam@gmail.com>, <dianders@chromium.org>, <chunkuang.hu@kernel.org>,
 <krzk@kernel.org>, <asrivats@redhat.com>, <paulk@sys-base.io>,
 <lumag@kernel.org>, <Hui.Pu@gehealthcare.com>,
 <thomas.petazzoni@bootlin.com>, <dri-devel@lists.freedesktop.org>,
 <asahi@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <chrome-platform@lists.linux.dev>, <imx@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-amlogic@lists.infradead.org>, <linux-renesas-soc@vger.kernel.org>,
 <platform-driver-x86@vger.kernel.org>, <linux-samsung-soc@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <freedreno@lists.freedesktop.org>,
 <linux-stm32@st-md-mailman.stormreply.com>, <aford173@gmail.com>,
 <adrien.grassein@gmail.com>, <amishin@t-argos.ru>, <andy.yan@rock-chips.com>, 
 <angelogioacchino.delregno@collabora.com>, <bleung@chromium.org>,
 <biju.das.jz@bp.renesas.com>, <chf.fritz@googlemail.com>,
 <cristian.ciocaltea@collabora.com>, <detlev.casanova@collabora.com>,
 <Dharma.B@microchip.com>, <groeck@chromium.org>, <heiko@sntech.de>,
 <jani.nikula@intel.com>, <j@jannau.net>, <jbrunet@baylibre.com>,
 <jesseevg@gmail.com>, <khilman@baylibre.com>,
 <kieran.bingham+renesas@ideasonboard.com>, <victor.liu@nxp.com>,
 <martin.blumenstingl@googlemail.com>, <matthias.bgg@gmail.com>,
 <p.zabel@pengutronix.de>, <ple@baylibre.com>, <fnkl.kernel@gmail.com>,
 <sugar.zhang@rock-chips.com>, <sui.jingfeng@linux.dev>,
 <tomi.valkeinen+renesas@ideasonboard.com>, <mordan@ispras.ru>
Subject: Re: [PATCH v2 01/34] drm: convert many bridge drivers from
 devm_kzalloc() to devm_drm_bridge_alloc() API
Thread-Topic: [PATCH v2 01/34] drm: convert many bridge drivers from
 devm_kzalloc() to devm_drm_bridge_alloc() API
Thread-Index: AQHbtUsLjdQGawUhkE+yGegcji7RNrO7/beAgAAPQ4CAB4M/gA==
Date: Mon, 5 May 2025 05:20:26 +0000
Message-ID: <2667ea5c-ad57-4c1d-8074-b04677b02cb4@microchip.com>
References: <20250424-drm-bridge-convert-to-alloc-api-v2-0-8f91a404d86b@bootlin.com>
 <20250424-drm-bridge-convert-to-alloc-api-v2-1-8f91a404d86b@bootlin.com>
 <e90b9ef2-ace0-4b98-9d49-5a62e529cf8a@microchip.com>
 <20250430123651.37be3e38@booty>
In-Reply-To: <20250430123651.37be3e38@booty>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH8PR11MB6609:EE_|PH7PR11MB6881:EE_
x-ms-office365-filtering-correlation-id: e5244c6b-b92f-4f4d-22b2-08dd8b948b1e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?Z2RIdjEzL2ZXR00rWUduc2E5Q1lLM1k0bXc5azJQUkFDSkdObEhHSWJmYzdM?=
 =?utf-8?B?Z0p0b0ZGM1crcThNZm5pbjNvdWxVYXVVODcwbmtSYS90VFN0bWpBd2RLK2g0?=
 =?utf-8?B?WGVJcFpCWXcrdGt4Z0hvdndhRXI1d2VpOThmQk9IOStBN2txUEJ3ckNDb0Jk?=
 =?utf-8?B?cDZIdFRCKzF0ZS9wQ1BpWUNWWCtEVzlaVDZHeFdqRGczdkM5aDYrMFF6OEh2?=
 =?utf-8?B?TXVVQW5NWVkyWWxGbEwzMERwL1U2alNwdGY2akwveVJCNEZ0UlM1S0tSWWt5?=
 =?utf-8?B?MDFWYUhMZ1F3NHBPZTRjMVpENDFQbit4YU02L0JJYlhuS1FKN3RjWUtVY0h0?=
 =?utf-8?B?N3dLaXVSMW9TT2hFUFd5ZUtQSTVUUFQzQU5iaDFXVk1KaW1yTjA4ckNQUW0z?=
 =?utf-8?B?dGxGWFMzR1Q3T0NzOHhwQS9rZExMYytJREJTZFgyaTBmZVRKOTg0UGgxSkJv?=
 =?utf-8?B?VHppOVFTdkRmRlplYjlHTVRWdjVvYlpTQmVYZXhTd1RSdElWVlJEb0llc0s1?=
 =?utf-8?B?VFZwYVVGQ0ZPbU5TQUozbk5hdXhnditLVTZnbzQrengza1Z2ZkljZWNmeGdM?=
 =?utf-8?B?Qm5Bcis2Ni82WXYyRkFVcEY4NFhvOE9xZ2phcWI4K05VdHlJS0ZRdnlpSUwy?=
 =?utf-8?B?ZE15bDRLRzNmUVRvTUJuSDFhQTUxOEtGcU1Pc01qVmdQd0VzVWVEdHJNemZ1?=
 =?utf-8?B?ZTF3UWNiQ1pIZk1STGM3R1ptTTN0SExTMWkvVHBqMk9vTXQxdEVhNWhIY0Qr?=
 =?utf-8?B?a3VNWGQ5azJiclhWNkI2UXc2azlQK2hyWmdpTnNTQWcrcEw2OTErWnlBTmpv?=
 =?utf-8?B?cHRra25VMS9GcmZWUUVqYzI5cjU5Tll0b1Zscjh0RERRNEZGRllMekdUM05B?=
 =?utf-8?B?bTFzUjQyaHJzeVVnTVNRRzFGQzhTRkxQeXk0TGQzRUlLZ1dlSXpFYjRodVY3?=
 =?utf-8?B?NkJwZm53RHdJaHVqTHcyUUsvRGw2a045ZzEyTndQaTlsUlN1cklFOEpWNGVw?=
 =?utf-8?B?RTR2RUVyTkwxTC9IRVdETnV4WHk1WVNZSmxiZ3VtdlNEZlhmaEdWeloyUThm?=
 =?utf-8?B?eEI0UE1BNzlRNmVuQkZ2T1Q1bENJdnZ6VG5zR2gzcVQrcjBYc1FHRXV5S3lN?=
 =?utf-8?B?L0RXTkdiY21ZNDI4M0QvTW1BbEdrS1BQVUhiQmRzK2xXMHpqN2Y5cE1zZDlQ?=
 =?utf-8?B?dXZLZi9NTU1GMXdmL2NDREdQK0JodS9IWmlCalVCNjZrTDlFSFZsQ0I4OTY4?=
 =?utf-8?B?L0JXNFFCSlZVd0FNRm5vcElPYTVGeDU2UFhWRzg4ZWd0V3MvS0s5OUk3NVhF?=
 =?utf-8?B?cHdUNm03VEVLdzJPdUZLL240dUlMSFZIN1lzWExDbXFsVW9YUVJPZ2tDZ0ZV?=
 =?utf-8?B?Q0ljbG45RUxZS1dGVnVJT2NDUi8wWHF5TFM5eWsvMjBCNVQzZC9vNys3YzRp?=
 =?utf-8?B?RmVZQWs4cG5RQnRZNjkzZFJDYjZGQ2Zobko5aVkyRVZLLzBPbk9YSkQ1SWg0?=
 =?utf-8?B?UGpLMnZEa3NjU3BEQlU0WEdOa3ExdFRRZW1rODVIei9ObnlUcTAvU2hobVhV?=
 =?utf-8?B?WG1FeE9NZitpQjU4ckNKbHlIQ053WVBIZWlRMVh0OGR5eFFxL3pDYVp1Mmd6?=
 =?utf-8?B?d2lFU3ZpMWRBdE4rZTVneVhQV1Uxckk3Y0NzMXJhVU1DSDY4Y0hlWTR2N1Iy?=
 =?utf-8?B?Q0ZvcDRWeDJpSHlOQk5udlFXWnd1T2NkbHVzY0RhMFcrcnNRQXhyN1A4SVg5?=
 =?utf-8?B?a29BMVF0YUpCTGQ5a2ltMGliczlDT29wRHA2bmlFWVRrVVBHVmE1eDdUblV1?=
 =?utf-8?B?QmV6RWIwcEtoU0NRbHQyOWlHam5OMytTMEl1UEt0VUl3ZXIrNGY1dWVuL1Bm?=
 =?utf-8?B?NFN5dTVKdDRLOENIVXdSdTVnWDIvdUpqbDJNall1QWZ6YVRROFNSdzZSZ3lx?=
 =?utf-8?Q?kY6vXAQiFI8=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6609.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z2FOb2JhNUplRkFqSTNCNXdNZ1NBK1FjOGcxelhzRU84ZTVaaEp0MnhQTUhP?=
 =?utf-8?B?MFF3TTV3Nm5RTWNkUzJSdnJFYXVoeERwRlo1Q3lQNFkzb3hpcUFUVkRZWSt2?=
 =?utf-8?B?TXBXUVRDREVaQkQ0ZlRpZVZ5emVXUEMxcitJVjc4WmRJQnM5SzJtNnRQbGUv?=
 =?utf-8?B?KzY0YXhaSEdSUThnNC9yOGFZQllpOGFERU1UMnlIc1FzRkJsU3gxdkdTZ216?=
 =?utf-8?B?VUtEMGRhTkNxSVpNUEJKR1pHSFA0RlVleHNaVlVkT08zeDkyNTA0amc3dzgw?=
 =?utf-8?B?U1FLUGk3TURhY2lvMkl5NnVvSVkvS1NOL2NFK05PZEt0Nk1hRDRheEh1d2gy?=
 =?utf-8?B?Q0xVMEZLeWEyVFdWQVprcjliakxyNS9VbjZtVXAyaWVDWmRvVjVIUjIvaXkw?=
 =?utf-8?B?b0tRa2lOQi9NVlRCdms5TUNHcWJ0U1c0MnBLeXFMNzhXUmkyUDhzQUpKQUI5?=
 =?utf-8?B?SGJxWGo3LzBDa0owYVh5a2pDM3c5eXJiZ21sTkN2VTlCcW9VZDdYd1djb0Yr?=
 =?utf-8?B?aS9McXN3UTJkUi9SeG8veHZDQngzL05lTTUzYytTR2lMNE1MekUzZUpkc2FV?=
 =?utf-8?B?M0VIdXFNRytEdEFDUU9aOHgxKytWUWtGMG10b0lHbEowUmVvK2dIb0ZlaDFY?=
 =?utf-8?B?aW1CRTVMbit3cXVzZTR5cW12T1hZeDhHMkFTUURiVkFJUnl2OEJWeEJkZU1q?=
 =?utf-8?B?WERCWko2YnhiK2VvZVExWVoyMUFpR200aVR1d090cE9hbTBYTTk5NlVIb2Yx?=
 =?utf-8?B?S3N3VXVuQkNjVnMxdzhvRGgwZ21CZndod1R2MHdpY3M3TzVsYnRmUkZPYWF5?=
 =?utf-8?B?cVZaWGI2U3ZhUFZiOHNOZm5PbGtTbTU2ZkUvTTh5dTdNbWhiTXhMMUFpdWZn?=
 =?utf-8?B?cUNDSzQyT3ZjSGwwNjhEa2RqQzUxM1N6WkE3QW9ZVkY2bjhVVkttNWNtOUt6?=
 =?utf-8?B?TjBQK2xMcGsvTWpNZnVYekpBTjMxVlk4UHFUMExqdW5nekN0ZFduQW9jTHRo?=
 =?utf-8?B?NnV5UjBzR3QxOHBsUnRoTDdhTzdBdTZvNmJlM0drTXdCdm43cVVka0NQbktK?=
 =?utf-8?B?T1JyRmxycEIzOTJWYkNMVFZPYVRja2hOeUNTem5GT0dWN0ZvMUZhL05Jdk9X?=
 =?utf-8?B?c2Z6Wnd2bFgzSllJS2kzZ3cvTUJHSDJaTG5wdHF4ZTZjWFlPOHlhN0Z1ZGNJ?=
 =?utf-8?B?aEdqbUlCYnYxVmgzcEUyOE1zTDUrNHp2OW9uOVdBL3F2UUxZTEQwaXpnbEor?=
 =?utf-8?B?bzVIQ3NIT1pNSzV5QkFIQy9QL2xtMTJDZ05PaHVybzlqdWtPd2dkSTRhZGtX?=
 =?utf-8?B?ZFZ6djNMOTR1Q1hBN0N5MitHbHowMHhpU2NYdlp2VnB4NnBBbXNLSVRSa0FH?=
 =?utf-8?B?TXpGTlhrdVRFd2xqblI2UU9uR3lLUlVHcisxWmJzbWI3MWloc2UweFJGR2ly?=
 =?utf-8?B?ZFdwRWJPRldOWEg5TFpBUkd2TlNEcWNzdE5CWjV4ZG82KzVFU2gwWU02dGdO?=
 =?utf-8?B?ZjNra1NaVzFUR3pGOUdLZWtsZmZkL3RJWHpuNnhZaDg4bDd6UElhTk55Mm9n?=
 =?utf-8?B?Wi9YbDBBeWcxRDRPRlQ5YkFRaEJadnVVUWJSdUhxVXRud3M1TVppSGRKcTdT?=
 =?utf-8?B?RFY5bS9OSVhCZG5IR3F2WW1lTUFDRkRkaVQ0elY5Mk9zR2s0M1JPUC9zeHVG?=
 =?utf-8?B?bmwrWXllaGRTNFFGSXFBZ0xIUUpMenpqMm1YNUFJckZEVmJFeHZnMjBSamJq?=
 =?utf-8?B?TkR2T1hvdVZrbzZSWFpzL1c5L0tMZytoaEJOYUVtSkFDWi9NK1A0S25RcFF3?=
 =?utf-8?B?cnY1MS8veERNN0xUWkEvb0Z6MWhNYjY2dnh0bFk2MDJ0aURuMW5iTjV0ZXB4?=
 =?utf-8?B?WVNlVTJNRTBxTDA2YUxOaVNwc0Mwcy9nZ0o1M0NsZGNtMHFqMng1NVJ2VDRm?=
 =?utf-8?B?czYrV2RONiswczdjRFRiS1dFbmpHNFYzS3F0RkRaN3hlZ2VvUkxTNmc2M2M2?=
 =?utf-8?B?ZGZ6RzhzMGZKYUl3MWJ6Z2g3QncwS2c2c2lMRzFuRDJ2K3VCN3pXcVFxVmZB?=
 =?utf-8?B?MjVrWHQ4TlpEWnBBTHVRZTU2c0haeUh0TXdqWjM1YVBWcVB1bmgzb2daQjFM?=
 =?utf-8?Q?oiF/ndUGHHlvTaopmF17DoQSn?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DD30185DE7A2B042A47036B2FAD84825@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: microchip.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6609.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5244c6b-b92f-4f4d-22b2-08dd8b948b1e
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 May 2025 05:20:26.1836 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nB02kuitZXJDByt8gJuI5ymvR/VUZ/C0leAbZT1r+sycHCr+EHydxXZJ7on/aX0z1OfZ9Mcya7+6+IPxfVBT5kHpfDGZ5rsATWiTn7tARWY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6881
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

T24gMzAvMDQvMjUgNDowNiBwbSwgTHVjYSBDZXJlc29saSB3cm90ZToNCj4gRVhURVJOQUwgRU1B
SUw6IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3Uga25v
dyB0aGUgY29udGVudCBpcyBzYWZlDQo+IA0KPiBIZWxsbyBNYW5pa2FuZGFuLA0KPiANCj4gT24g
V2VkLCAzMCBBcHIgMjAyNSAwOTo0MjoxNiArMDAwMA0KPiA8TWFuaWthbmRhbi5NQG1pY3JvY2hp
cC5jb20+IHdyb3RlOg0KPiANCj4gWy4uLl0NCj4gDQo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9icmlkZ2UvbWljcm9jaGlwLWx2ZHMuYyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uv
bWljcm9jaGlwLWx2ZHMuYw0KPj4+IGluZGV4IDFkNGFlMDA5N2RmODQ3ZDlmOTNjNzllZWNmZjBj
NDU4N2FlMzMxYmEuLjlmNGZmODJiYzZiNDkwMTBmODcyN2RhM2IzNjdmNWE3NDRhMjhlZGMgMTAw
NjQ0DQo+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9taWNyb2NoaXAtbHZkcy5jDQo+
Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9taWNyb2NoaXAtbHZkcy5jDQo+Pj4gQEAg
LTE1Nyw5ICsxNTcsMTAgQEAgc3RhdGljIGludCBtY2hwX2x2ZHNfcHJvYmUoc3RydWN0IHBsYXRm
b3JtX2RldmljZSAqcGRldikNCj4+PiAgICAgICAgICAgaWYgKCFkZXYtPm9mX25vZGUpDQo+Pj4g
ICAgICAgICAgICAgICAgICAgcmV0dXJuIC1FTk9ERVY7DQo+Pj4NCj4+PiAtICAgICAgIGx2ZHMg
PSBkZXZtX2t6YWxsb2MoJnBkZXYtPmRldiwgc2l6ZW9mKCpsdmRzKSwgR0ZQX0tFUk5FTCk7DQo+
Pj4gLSAgICAgICBpZiAoIWx2ZHMpDQo+Pj4gLSAgICAgICAgICAgICAgIHJldHVybiAtRU5PTUVN
Ow0KPj4+ICsgICAgICAgbHZkcyA9IGRldm1fZHJtX2JyaWRnZV9hbGxvYygmcGRldi0+ZGV2LCBz
dHJ1Y3QgbWNocF9sdmRzLCBicmlkZ2UsDQo+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICZtY2hwX2x2ZHNfYnJpZGdlX2Z1bmNzKTsNCj4+PiArICAgICAgIGlmIChJU19F
UlIobHZkcykpDQo+Pj4gKyAgICAgICAgICAgICAgIHJldHVybiBQVFJfRVJSKGx2ZHMpOw0KPj4+
DQo+Pj4gICAgICAgICAgIGx2ZHMtPmRldiA9IGRldjsNCj4+Pg0KPj4+IEBAIC0xOTIsNyArMTkz
LDYgQEAgc3RhdGljIGludCBtY2hwX2x2ZHNfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAq
cGRldikNCj4+Pg0KPj4+ICAgICAgICAgICBsdmRzLT5icmlkZ2Uub2Zfbm9kZSA9IGRldi0+b2Zf
bm9kZTsNCj4+PiAgICAgICAgICAgbHZkcy0+YnJpZGdlLnR5cGUgPSBEUk1fTU9ERV9DT05ORUNU
T1JfTFZEUzsNCj4+PiAtICAgICAgIGx2ZHMtPmJyaWRnZS5mdW5jcyA9ICZtY2hwX2x2ZHNfYnJp
ZGdlX2Z1bmNzOw0KPj4+DQo+Pj4gICAgICAgICAgIGRldl9zZXRfZHJ2ZGF0YShkZXYsIGx2ZHMp
Ow0KPj4+ICAgICAgICAgICByZXQgPSBkZXZtX3BtX3J1bnRpbWVfZW5hYmxlKGRldik7DQo+Pg0K
Pj4gUmV2aWV3ZWQtYnk6IE1hbmlrYW5kYW4gTXVyYWxpZGhhcmFuIDxtYW5pa2FuZGFuLm1AbWlj
cm9jaGlwLmNvbT4NCj4gDQo+IFRoYW5rcyBmb3IgcmV2aWV3aW5nIQ0KPiANCj4gSW4gdjMgdGhp
cyBwYXRjaCB3aWxsIGJlIHNsaWdodGx5IGRpZmZlcmVudCBmcm9tIHYyLiBTZWUgdGhlIHJlcGx5
IEkNCj4ganVzdCBzZW50IHRvIERvdWcgZm9yIHRoZSBkZXRhaWxzLg0KPiANCj4gSWYgeW91ciBS
ZXZpZXdlZC1ieSB0YWcgcmVmZXJzIG9ubHkgdG8gdGhlIG1pY3JvY2hpcC1sdmRzIGRyaXZlciwg
Zm9yDQo+IHdoaWNoIHRoZXJlIHdpbGwgYmUgbm8gY2hhbmdlIGluIHYzLCBJIHRoaW5rIGl0J3Mg
Y29ycmVjdCB0byB0YWtlIHlvdXINCj4gdGFnIGFuZCBhZGQgYSBjb21tZW50IGxpa2U6DQo+IA0K
PiAgIFJldmlld2VkLWJ5OiBNYW5pa2FuZGFuIE11cmFsaWRoYXJhbiA8bWFuaWthbmRhbi5tQG1p
Y3JvY2hpcC5jb20+ICMgbWljcm9jaGlwLWx2ZHMuYw0KPiANCj4gQW55dGhpbmcgYWdhaW5zdCB0
aGlzPw0KPiANCk5vLCBMdWNhLiBQbGVhc2UgcHJvY2VlZCB3aXRoIHRoZSBhYm92ZSBtZW50aW9u
ZWQgdGFnICMgbWljcm9jaGlwLWx2ZHMuYw0KPiBCZXN0IHJlZ2FyZHMsDQo+IEx1Y2ENCj4gDQo+
IC0tDQo+IEx1Y2EgQ2VyZXNvbGksIEJvb3RsaW4NCj4gRW1iZWRkZWQgTGludXggYW5kIEtlcm5l
bCBlbmdpbmVlcmluZw0KPiBodHRwczovL2Jvb3RsaW4uY29tDQoNCi0tIA0KVGhhbmtzIGFuZCBS
ZWdhcmRzLA0KTWFuaWthbmRhbiBNLg0KDQo=
