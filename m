Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56E66AA477A
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 11:42:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD05A10E04E;
	Wed, 30 Apr 2025 09:42:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="IWh9pI0c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2079.outbound.protection.outlook.com [40.107.100.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 733E810E04E;
 Wed, 30 Apr 2025 09:42:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q663gqzJocP4dkyLB3sr+H++eT/s+DxAfyJUVMVMJkfvulH02CiMnGvUWJjnuGhevaaFonx3XJZvqtM/WfAI6pP4mNj8/UTV4FnVB/ySo0RwcdzgLgs31xKQ18k4vyoFGmMS5ENkrvHCh7DAnWfXEFHuPniXDU7lIilBfl1oD5cibA4ChYJSrKjdWFF3HTZap2AwbBRHKigQdJiOUFAfwrMcSg2jYv/jBp6wC0DHmVpCG/kHSLxEEu/rs5zLltsgxos1eHa9Br1AoWAOp9ki6GG973WE6p83MXM/hOClc9++88Z3EbwMjOpFT1tQ63WHgthiOHbRbuogncXK8oWLiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hEOxoYLSon1zFiOWIpme6G9Gvg/ptZ4lhg4/ZeW3X68=;
 b=hnewF3rm10IzefAiku7lIPFtf48uWJsvEPdnqlE2FvUQoT0eMOJRS2II7NfsWqIIyvbW76gsXhVTUGhE2nBjHjKwprfczdw1YdzGnZn/0I4/Ohc+1RLhII0XJJuuHmIQz8pNJ3Wi7MutJOpuaSCxH1/seVYI6LTaQRZbZiYtij7FGlvsO7DHYk2CW8w72T4n7DJtcMFeGln6a9UynRKMUjA7LohRAXMPAle/ZxSu3AvMBt7etETnrmeo8vZRsWU/Swu2z/J444jblc6VW/VlI5rG/IH62Ln7BQhsCzC4uDxscu5e4MEHiUeF1NHV6T8s24V+QZyoi0KADf+q/hXEtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hEOxoYLSon1zFiOWIpme6G9Gvg/ptZ4lhg4/ZeW3X68=;
 b=IWh9pI0c0X944tG1Kn7NdX5Ujh+izwRt7Ki+CJQF0ybSeVaniQEFshIDtYwgSw/N7s/86yZDn2tYfJrczd1+luDuHhLZCsuxhbsrX01XLtA0dGpLbqtVfDXMsLZhBt5FR92Ueapqt0Yospx+omhsXE9JIWUEWYYuNibrOus1ZOdaMuDpo/Xu3qDcUD8Chv5l8pSygKZBTlxFa/p+Gg9GZKVJUJ71whcdU4QpCfiq2Tn6JbnkkiNODQCwQbYLajUSlRuQJiLF3vKy6f2e/O5XHRAv3dvJaXUbOW01jT+fAbcgs2v2VvbdzmN3ptOu3mdz/G6YonVt5u92zclKHyTQxQ==
Received: from PH8PR11MB6609.namprd11.prod.outlook.com (2603:10b6:510:1cc::16)
 by MN2PR11MB4552.namprd11.prod.outlook.com (2603:10b6:208:263::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Wed, 30 Apr
 2025 09:42:16 +0000
Received: from PH8PR11MB6609.namprd11.prod.outlook.com
 ([fe80::ebc1:5d63:a07c:60d]) by PH8PR11MB6609.namprd11.prod.outlook.com
 ([fe80::ebc1:5d63:a07c:60d%4]) with mapi id 15.20.8699.012; Wed, 30 Apr 2025
 09:42:16 +0000
From: <Manikandan.M@microchip.com>
To: <luca.ceresoli@bootlin.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <simona@ffwll.ch>, <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>,
 <rfoss@kernel.org>, <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@gmail.com>, <jagan@amarulasolutions.com>,
 <shawnguo@kernel.org>, <s.hauer@pengutronix.de>, <kernel@pengutronix.de>,
 <festevam@gmail.com>, <dianders@chromium.org>, <chunkuang.hu@kernel.org>,
 <krzk@kernel.org>
CC: <asrivats@redhat.com>, <paulk@sys-base.io>, <lumag@kernel.org>,
 <Hui.Pu@gehealthcare.com>, <thomas.petazzoni@bootlin.com>,
 <dri-devel@lists.freedesktop.org>, <asahi@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>, <chrome-platform@lists.linux.dev>,
 <imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
 <linux-renesas-soc@vger.kernel.org>, <platform-driver-x86@vger.kernel.org>,
 <linux-samsung-soc@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <freedreno@lists.freedesktop.org>,
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
Thread-Index: AQHbtUsLjdQGawUhkE+yGegcji7RNrO7/beA
Date: Wed, 30 Apr 2025 09:42:16 +0000
Message-ID: <e90b9ef2-ace0-4b98-9d49-5a62e529cf8a@microchip.com>
References: <20250424-drm-bridge-convert-to-alloc-api-v2-0-8f91a404d86b@bootlin.com>
 <20250424-drm-bridge-convert-to-alloc-api-v2-1-8f91a404d86b@bootlin.com>
In-Reply-To: <20250424-drm-bridge-convert-to-alloc-api-v2-1-8f91a404d86b@bootlin.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH8PR11MB6609:EE_|MN2PR11MB4552:EE_
x-ms-office365-filtering-correlation-id: ff71b061-11d5-4bd3-aacb-08dd87cb4b16
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|1800799024|376014|366016|921020|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?Ym14SE9FZ21ocXVYemJYYlh0UW43R2gxWkdMMXNCZGJwWTUzZktVR28yaUJr?=
 =?utf-8?B?SEY3MzN3WDBMeURtN0dFWHNzQ2tlOUpOUGsxNjdFVDNwT1k4OUNZcG1keFpU?=
 =?utf-8?B?azBYQUNBM0t6czY5NXVpZmp5MjErZHBOcTA1MU0xUlZab0RFbGFrTTJWQWdC?=
 =?utf-8?B?bUtkZmlZOVJnYjB1UHJjVDdGR2hIeFgyZ0kwMTk3VnIxendxZUZjbE0zQ2lH?=
 =?utf-8?B?cy9Pa20zOXllZXdaMXlNTjJLQVozNmZWUUFQTG9XL1U5WlV3Q0ppTWpPa3RW?=
 =?utf-8?B?bWNxQjQ5R2RVUGYzekNURlhIZ2xLT05FRVJYRzh0alBzdENQK2tIS1Y1dUVL?=
 =?utf-8?B?M0JIWk84bllkeWJtWkpHcWVvTEcwb3oySmdGRlVaQVhhTDhHRHlscVRDYlZC?=
 =?utf-8?B?dThmV09PT0l2NmdSc1VKanBlcHBEQXg4NGNNNmlNRHdoZ010R2psNm5veFhl?=
 =?utf-8?B?aGpHUXd2cHBqK3NLK0FGMmlWaG5PR1ZvSlNmMXltbXgvWUlQMUNKMnBDUklV?=
 =?utf-8?B?MkNJSmY2cHhEcWhaVVFscXpBWW5STjQ3K1RmbWdXVXh3MnJpWFZpb2hhekI4?=
 =?utf-8?B?a2JTdW5SRmE2U3ZuSEhBZHgxYkZKZ25lbmY4K25xbytSMmFvOE9KRWJKWSt0?=
 =?utf-8?B?QkhndFlwb2s4VDV3WVBVNUNoZ2FRWHZNbm9RZy9VWmVXaUdWY3JyK0Y3SzZD?=
 =?utf-8?B?TnJEUzZWNUlyTVpOYWJ0RnE4NmhGU0xqbzc2YmQrak5UNGJ2NmZMTU9DK1R0?=
 =?utf-8?B?UmlrWTdreHg5OVA3Rkk5alltYWRDVDk3enVieW56TzVGeWJKa29hZ0FsalNT?=
 =?utf-8?B?VHQ4VEtwZmZVaWJuaGtUWDZ1NEJpNm5NVzBsQThSRksxR3JSeXpZbG0rckJE?=
 =?utf-8?B?NzNOaHQzQVZKZlU1V3J2aUhoY2M4dk5QTVdjWStXWnpUa1RjSFFsRk56U29p?=
 =?utf-8?B?SmY0UjFhZjIvY2xrR3NhMkVpUHUvYS9rTVJCd2pXUEdCZVpuc2tXT1orYXBX?=
 =?utf-8?B?dTlrdTc1eGtiNzhGcVBSYUxVNElyZENqekxPVnhDS0FXbjNzc1dUYSt1SWJl?=
 =?utf-8?B?L29pNEtEWGNsQjI2eFIwR0h3Q0M1blBvLzNMTmdSOTFManpwQ3VveExKMHVE?=
 =?utf-8?B?MjBKL0lrdHZKY1VEWERNSlpCcWJXNlpRUThpUFl6YTk0ZzNOZ2ZXOEZybUFK?=
 =?utf-8?B?d3AyWTlZYmhKOGU4VGxlejFOc1RBMHBlZThqd2oyQ09KNC96TldqTHZnVXVO?=
 =?utf-8?B?NjB0V0RjR0FTRkp6bFdydjhQamcydHVhZkJHbnoxRHc4aVY0L0lyeXFkZVJp?=
 =?utf-8?B?VmNGRElncGNKdWQ3NW1QbHlMaFdnSlp0Q0ZRU1BUOExOS0tKSTdPSTltR1Vm?=
 =?utf-8?B?RTROblJCdjBTTmRFWEJrV2Z1My9jQjNZSUhqRDIxU1kvVDJKa2g0V0ExMDhn?=
 =?utf-8?B?MzdVZzBvR0p0N2gwcTRZM21yYTdXa250QjZacVVpeXp5SEc5UW8weEFYS0o5?=
 =?utf-8?B?SFIxeVhNLzE2b05pMzhGTTdNNWJsYzdlOGJxVGFQbktpL0JSTll2Z3A0dDd2?=
 =?utf-8?B?T1F3MTJjbndBZDZNbktYeVIxaU5CQ0QzaDV3Y3NrVHFsbE5yaXRJZkpJcTdN?=
 =?utf-8?B?cWVUUXFTb1ZEM3QydTNwdng5WnFEZU9yYjhQQWNwNmloSUJsazVxdXJFVG04?=
 =?utf-8?B?b3k2QVI1SEVEZkZvU1J2aHdFUlVtRmFYQ0hsb2hjTjlDd2FwNXJ6cFJHbzFE?=
 =?utf-8?B?bUc5b3VSeVluTmhlTExXMDNNNEUxbFplWGRpYmg2SUY3dUU5Z3cwUUVMd2N1?=
 =?utf-8?B?QiswOTk0SE5HUm1JRnVBY01LenFWR1M2ZzR3T0tIWTU0QnNnWjVPODBGYllN?=
 =?utf-8?B?Wk1LMGRDRXBSYlgzU0RvUHBjRk1uTjFwdVZLaTg3dVpsdkNSYitIalJWa3dH?=
 =?utf-8?B?MUF2elhzdzd0cnhvemZPeWszUXRXdk0xcGdEWVhCN28wdDhVTFVKRVljZ1Rs?=
 =?utf-8?Q?WjDNcPAau1/4Wl5MPmzEYfwRHmq5HE=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6609.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(376014)(366016)(921020)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U1FZZFo5YlZKQm96MHZkWTM2S3dsU3p6aEpoaTF3bHBSZDJoN1ErWis2SXBD?=
 =?utf-8?B?ZkVjVE5MSlowREhJNUpRQm9aNEdxSGdNSkJ0RVgvY2RzT2thUUZmY3l6SUFs?=
 =?utf-8?B?elR3OWZFU2VjT09IZzcxa3VmeVZuaXhDR2hySTJpeUJtL0JUWTd4MGhod1pY?=
 =?utf-8?B?MUYyZ3JUNVVzQ05WWkFYM0Q1ZVZUOWRjZUQxbmphVzQwRGtrK1dGV29ILysy?=
 =?utf-8?B?Tk5XckFhcktnT0htT3h6Z05CRVFsVXFBOTZieExkT3FzL2RJY1JyM09hb2RH?=
 =?utf-8?B?V3Zrc0RqbzhSNDdXUU9DUGxXNUo1aytCN3dSOENFZlpVNjhuaUVUWjFsU01m?=
 =?utf-8?B?alNsTHBwb2Q4bFYrVXRVYVM1TnRzaUx2bit6aWwvelZrcEs0K2dtcWZ2K3VH?=
 =?utf-8?B?Rmt3dmtBdGxCcGJLUW4yTUNiWmxTSmpCTXlVbHRsWjNhN3NvV2lTdm1OZUV4?=
 =?utf-8?B?SFlhcTdNMFhhVUZ0aGJmYVNzM1RzT05ncU9CVWtCemR5aGJMN2hTZXRKYlFW?=
 =?utf-8?B?amcwdlFPaHpmWVdsVXhyR2ZzRGJRdDRtS0RrQ2dSVTBzMyt1TUtlcmVyQTF3?=
 =?utf-8?B?cmJXemkvTVpVTkVDRGFvdHdjNDhJanBxVSs5c0JMMDRyNFZYQzd1YytYeHJB?=
 =?utf-8?B?REJ6SG4yM1R0ejZtT3JNZEh6Q0JPdksvMnk0UHFSc3duS0J5WnNXb3Byb09U?=
 =?utf-8?B?MDlLMTJxK1ZpeElhRmdiMEU2MHVOcnlaUWFLdEJON041dmZFR0VDRnArQ0Ur?=
 =?utf-8?B?YmlDd1Z2VDdWSXlGUUlleFdYVW1EdTl4cjNOejFVSzIvUkc4YnBIOUdXdEp4?=
 =?utf-8?B?bHNCRXBSOEtlcnBTZzB3QWR3MWZsT29HSFI0VXdIdVljKys1QjlBRkgxNWZk?=
 =?utf-8?B?R1NIVGtpRklnZFhneWo0TzJuV3diNkhRRkpRVnhzWlBTcWdlb2taVmdLZWtF?=
 =?utf-8?B?Sy95VHBVT3QzYTRZY0hKajh2OVd4Qm1zRTV0dGpEYnVEaVp4M2plN1B0aGZD?=
 =?utf-8?B?bVZaRVpna2tFd1dZTWpaUnFUY2VjN3RCY1VpY3dxRHJ4amhPaVlhZ051bC8w?=
 =?utf-8?B?V2pQODFEY1JnYzZwOUdpVnZ2ODNwU0JtNmg3Zm9HRUFXSzhkSXpVUXNkQ3cv?=
 =?utf-8?B?cHlrVkNvZU1pQnNqdXhWaW55SWVyVlE2eE90L3NxOTZVeGNSNlA2YUw2S2I2?=
 =?utf-8?B?UWFEUkpCU3VudjI0amhOMXpZcXNoR2VYNHFWL3VYVzdDdVVBaXRmbDd0VDB0?=
 =?utf-8?B?bTZldHFnazRiKysvaDdaZWZEek9YeHFmOGNBVmxha1R3YklwZmYwelQ4ZWRq?=
 =?utf-8?B?c094bEw4SUNCZHhPQ010VlBaUHJsb0s4TUliOTJmVFdyeG1LSmNveFNJb2tR?=
 =?utf-8?B?c1B4ZWZ5d0NHSDF5SXRZYXZ1SnowUVdmRVQ1QzlWaVNobElZek92eTVUa2s0?=
 =?utf-8?B?eG1SYVpUeVpyZS96OWUvaEJYZ1dqMjVpT1N3VUYrQ2RNUGdyRXRMakVUQzQv?=
 =?utf-8?B?MjFSb3Y5QjNKMnhJNkZCdVBtdUFrUVhtRnoyZTV4T2xPTGZBc2FzS2VPVHRq?=
 =?utf-8?B?Mk9tNTh5a0FCRjJpbVlMczJIcS92aFkvWVdUSTZyamtnTGUzdStuaS9QbUo0?=
 =?utf-8?B?ZVlhZVB5eU5qZjBqWnhDZFgxR3pOTEpza2VjRkFnejk4cmxRS1VUMk12WnZ6?=
 =?utf-8?B?UFpHZ2ZJam1TejVrUmIxL1Ivak9jd0kyVXA2QmRCV2VIOUVKdEQyeEZra2RQ?=
 =?utf-8?B?eENEZ3FkVWZtQjY3Zm9PeGhWZUJsYUJvbS9POFdSbi9SMTRmT0IvVW1IMmk4?=
 =?utf-8?B?SytZNDB3dUhzWURaNmlYTlhlK0VLWHhvSW9EOTQrYTFXbFlxTU14bWg5LzZB?=
 =?utf-8?B?N0dGd1FMSVNtam1ZVlRuM0U4YkVQODdzMFhtbTQrWm5abEZWbWhDZWJhQ3NF?=
 =?utf-8?B?UHpTMDl3ZnBPM1h4dnpBRVdoSW9wOUg3Y2FFazRJZnd4Q1JrSjR6NElPK2R2?=
 =?utf-8?B?emV4U1dPUWZ1WVYvTEJmbTI3L0JvRmdBL2toNGpDNzhOdko1Zkp0Um1oYWRw?=
 =?utf-8?B?K09Yd05hSkZFUUw3Y1R3d21SdzRQTjN6Sy9jREJOSlhQd0t4aHlFTzNFcjdl?=
 =?utf-8?Q?l8+S1T6zAATaEcXpjzgXokDzT?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <504278A449B43C44BFCC580BE40E39DD@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: microchip.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6609.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff71b061-11d5-4bd3-aacb-08dd87cb4b16
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2025 09:42:16.4161 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IndaBHi/Wa7muY11t4Fp9IKTBmSqxa9wjYTsL0ZWa9hMuEEfCq+ONtwYQVmq980PvvJOxxFRngVrkpwzPWhBvEH7xVrX64CEoPAiu9vkI/g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4552
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

T24gMjUvMDQvMjUgMTI6MjkgYW0sIEx1Y2EgQ2VyZXNvbGkgd3JvdGU6DQo+IEVYVEVSTkFMIEVN
QUlMOiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91IGtu
b3cgdGhlIGNvbnRlbnQgaXMgc2FmZQ0KPiANCj4gZGV2bV9kcm1fYnJpZGdlX2FsbG9jKCkgaXMg
dGhlIG5ldyBBUEkgdG8gYmUgdXNlZCBmb3IgYWxsb2NhdGluZyAoYW5kDQo+IHBhcnRpYWxseSBp
bml0aWFsaXppbmcpIGEgcHJpdmF0ZSBkcml2ZXIgc3RydWN0IGVtYmVkZGluZyBhIHN0cnVjdA0K
PiBkcm1fYnJpZGdlLg0KPiANCj4gRm9yIG1hbnkgZHJpdmVycyBoYXZpbmcgYSBzaW1wbGUgY29k
ZSBmbG93IGluIHRoZSBwcm9iZSBmdW5jdGlvbiwgdGhpcw0KPiBjb21taXQgZG9lcyBhIG1hc3Mg
Y29udmVyc2lvbiBhdXRvbWF0aWNhbGx5IHdpdGggdGhlIGZvbGxvd2luZyBzZW1hbnRpYw0KPiBw
YXRjaC4gVGhlIGNoYW5nZXMgaGF2ZSBiZWVuIHJldmlld2VkIG1hbnVhbGx5IGZvciBjb3JyZWN0
bmVzcyBhcyB3ZWxsIGFzDQo+IHRvIGZpbmQgYW55IGZhbHNlIHBvc2l0aXZlcy4NCj4gDQo+ICAg
IEBADQo+ICAgIHR5cGUgVDsNCj4gICAgaWRlbnRpZmllciBDOw0KPiAgICBpZGVudGlmaWVyIEJS
Ow0KPiAgICBleHByZXNzaW9uIERFVjsNCj4gICAgZXhwcmVzc2lvbiBGVU5DUzsNCj4gICAgQEAN
Cj4gICAgLVQgKkM7DQo+ICAgICtUICpDOw0KPiAgICAgLi4uDQo+ICAgICgNCj4gICAgLUMgPSBk
ZXZtX2t6YWxsb2MoREVWLCAuLi4pOw0KPiAgICAtaWYgKCFDKQ0KPiAgICAtICAgIHJldHVybiAt
RU5PTUVNOw0KPiAgICArQyA9IGRldm1fZHJtX2JyaWRnZV9hbGxvYyhERVYsIFQsIEJSLCBGVU5D
Uyk7DQo+ICAgICtpZiAoSVNfRVJSKEMpKQ0KPiAgICArICAgICByZXR1cm4gUFRSX0VSUihDKTsN
Cj4gICAgfA0KPiAgICAtQyA9IGRldm1fa3phbGxvYyhERVYsIC4uLik7DQo+ICAgIC1pZiAoIUMp
DQo+ICAgIC0gICAgcmV0dXJuIEVSUl9QVFIoLUVOT01FTSk7DQo+ICAgICtDID0gZGV2bV9kcm1f
YnJpZGdlX2FsbG9jKERFViwgVCwgQlIsIEZVTkNTKTsNCj4gICAgK2lmIChJU19FUlIoQykpDQo+
ICAgICsgICAgIHJldHVybiBQVFJfRVJSKEMpOw0KPiAgICApDQo+ICAgICAuLi4NCj4gICAgLUMt
PkJSLmZ1bmNzID0gRlVOQ1M7DQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBMdWNhIENlcmVzb2xpIDxs
dWNhLmNlcmVzb2xpQGJvb3RsaW4uY29tPg0KPiANCj4gLS0tDQo+IA0KPiBDYzogQWRhbSBGb3Jk
IDxhZm9yZDE3M0BnbWFpbC5jb20+DQo+IENjOiBBZHJpZW4gR3Jhc3NlaW4gPGFkcmllbi5ncmFz
c2VpbkBnbWFpbC5jb20+DQo+IENjOiBBbGVrc2FuZHIgTWlzaGluIDxhbWlzaGluQHQtYXJnb3Mu
cnU+DQo+IENjOiBBbmR5IFlhbiA8YW5keS55YW5Acm9jay1jaGlwcy5jb20+DQo+IENjOiBBbmdl
bG9HaW9hY2NoaW5vIERlbCBSZWdubyA8YW5nZWxvZ2lvYWNjaGluby5kZWxyZWdub0Bjb2xsYWJv
cmEuY29tPg0KPiBDYzogQmVuc29uIExldW5nIDxibGV1bmdAY2hyb21pdW0ub3JnPg0KPiBDYzog
QmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiBDYzogQ2hyaXN0b3BoIEZy
aXR6IDxjaGYuZnJpdHpAZ29vZ2xlbWFpbC5jb20+DQo+IENjOiBDcmlzdGlhbiBDaW9jYWx0ZWEg
PGNyaXN0aWFuLmNpb2NhbHRlYUBjb2xsYWJvcmEuY29tPg0KPiBDYzogRGV0bGV2IENhc2Fub3Zh
IDxkZXRsZXYuY2FzYW5vdmFAY29sbGFib3JhLmNvbT4NCj4gQ2M6IERoYXJtYSBCYWxhc3ViaXJh
bWFuaSA8ZGhhcm1hLmJAbWljcm9jaGlwLmNvbT4NCj4gQ2M6IEd1ZW50ZXIgUm9lY2sgPGdyb2Vj
a0BjaHJvbWl1bS5vcmc+DQo+IENjOiBIZWlrbyBTdHVlYm5lciA8aGVpa29Ac250ZWNoLmRlPg0K
PiBDYzogSmFuaSBOaWt1bGEgPGphbmkubmlrdWxhQGludGVsLmNvbT4NCj4gQ2M6IEphbm5lIEdy
dW5hdSA8akBqYW5uYXUubmV0Pg0KPiBDYzogSmVyb21lIEJydW5ldCA8amJydW5ldEBiYXlsaWJy
ZS5jb20+DQo+IENjOiBKZXNzZSBWYW4gR2F2ZXJlIDxqZXNzZWV2Z0BnbWFpbC5jb20+DQo+IENj
OiBLZXZpbiBIaWxtYW4gPGtoaWxtYW5AYmF5bGlicmUuY29tPg0KPiBDYzogS2llcmFuIEJpbmdo
YW0gPGtpZXJhbi5iaW5naGFtK3JlbmVzYXNAaWRlYXNvbmJvYXJkLmNvbT4NCj4gQ2M6IExpdSBZ
aW5nIDx2aWN0b3IubGl1QG54cC5jb20+DQo+IENjOiBNYW5pa2FuZGFuIE11cmFsaWRoYXJhbiA8
bWFuaWthbmRhbi5tQG1pY3JvY2hpcC5jb20+DQo+IENjOiBNYXJ0aW4gQmx1bWVuc3RpbmdsIDxt
YXJ0aW4uYmx1bWVuc3RpbmdsQGdvb2dsZW1haWwuY29tPg0KPiBDYzogTWF0dGhpYXMgQnJ1Z2dl
ciA8bWF0dGhpYXMuYmdnQGdtYWlsLmNvbT4NCj4gQ2M6IFBoaWxpcHAgWmFiZWwgPHAuemFiZWxA
cGVuZ3V0cm9uaXguZGU+DQo+IENjOiBQaG9uZyBMRSA8cGxlQGJheWxpYnJlLmNvbT4NCj4gQ2M6
IFNhc2hhIEZpbmtlbHN0ZWluIDxmbmtsLmtlcm5lbEBnbWFpbC5jb20+DQo+IENjOiBTdWdhciBa
aGFuZyA8c3VnYXIuemhhbmdAcm9jay1jaGlwcy5jb20+DQo+IENjOiBTdWkgSmluZ2ZlbmcgPHN1
aS5qaW5nZmVuZ0BsaW51eC5kZXY+DQo+IENjOiBUb21pIFZhbGtlaW5lbiA8dG9taS52YWxrZWlu
ZW4rcmVuZXNhc0BpZGVhc29uYm9hcmQuY29tPg0KPiBDYzogVml0YWxpaSBNb3JkYW4gPG1vcmRh
bkBpc3ByYXMucnU+DQo+IA0KPiBDaGFuZ2VkIGluIHYyOg0KPiAtIGFkZGVkIG1pc3NpbmcgUFRS
X0VSUigpIGluIHRoZSBzZWNvbmQgc3BhdGNoIGFsdGVybmF0aXZlDQo+IC0tLQ0KPiAgIGRyaXZl
cnMvZ3B1L2RybS9hZHAvYWRwLW1pcGkuYyAgICAgICAgICAgICAgICAgICAgICB8ICA4ICsrKyst
LS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hZHY3NTExL2Fkdjc1MTFfZHJ2LmMgICAg
ICAgIHwgIDkgKysrKy0tLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hbmFsb2dpeC9h
bmFsb2dpeC1hbng3OHh4LmMgIHwgIDkgKysrKy0tLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2Jy
aWRnZS9hdXgtYnJpZGdlLmMgICAgICAgICAgICAgICAgIHwgIDkgKysrKy0tLS0tDQo+ICAgZHJp
dmVycy9ncHUvZHJtL2JyaWRnZS9hdXgtaHBkLWJyaWRnZS5jICAgICAgICAgICAgIHwgIDkgKysr
KystLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9jYWRlbmNlL2NkbnMtbWhkcDg1NDYt
Y29yZS5jIHwgIDggKysrKy0tLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2NoaXBvbmUt
aWNuNjIxMS5jICAgICAgICAgICAgfCAgOSArKysrLS0tLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0v
YnJpZGdlL2Nocm9udGVsLWNoNzAzMy5jICAgICAgICAgICAgfCAgOCArKysrLS0tLQ0KPiAgIGRy
aXZlcnMvZ3B1L2RybS9icmlkZ2UvY3Jvcy1lYy1hbng3Njg4LmMgICAgICAgICAgICB8ICA5ICsr
KystLS0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvZnNsLWxkYi5jICAgICAgICAgICAg
ICAgICAgICB8ICA3ICsrKy0tLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2lteC9pbXgt
bGVnYWN5LWJyaWRnZS5jICAgICAgfCAgOSArKysrLS0tLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0v
YnJpZGdlL2lteC9pbXg4bXAtaGRtaS1wdmkuYyAgICAgICAgfCAxMCArKysrLS0tLS0tDQo+ICAg
ZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9pbXgvaW14OHF4cC1waXhlbC1saW5rLmMgICAgIHwgIDgg
KysrKy0tLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2lteC9pbXg4cXhwLXB4bDJkcGku
YyAgICAgICAgfCAgOCArKysrLS0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvaXRlLWl0
NjI2My5jICAgICAgICAgICAgICAgICB8ICA5ICsrKystLS0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2Ry
bS9icmlkZ2UvaXRlLWl0NjUwNS5jICAgICAgICAgICAgICAgICB8ICA5ICsrKystLS0tLQ0KPiAg
IGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvaXRlLWl0NjYxMjEuYyAgICAgICAgICAgICAgICB8ICA5
ICsrKystLS0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvbG9udGl1bS1sdDg5MTJiLmMg
ICAgICAgICAgICB8ICA5ICsrKystLS0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvbG9u
dGl1bS1sdDkyMTEuYyAgICAgICAgICAgICB8ICA4ICsrKy0tLS0tDQo+ICAgZHJpdmVycy9ncHUv
ZHJtL2JyaWRnZS9sb250aXVtLWx0OTYxMS5jICAgICAgICAgICAgIHwgIDkgKysrKy0tLS0tDQo+
ICAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9sdmRzLWNvZGVjLmMgICAgICAgICAgICAgICAgIHwg
IDkgKysrKy0tLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9taWNyb2NoaXAtbHZkcy5j
ICAgICAgICAgICAgIHwgIDggKysrKy0tLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL253
bC1kc2kuYyAgICAgICAgICAgICAgICAgICAgfCAgOCArKysrLS0tLQ0KPiAgIGRyaXZlcnMvZ3B1
L2RybS9icmlkZ2UvcGFyYWRlLXBzODYyMi5jICAgICAgICAgICAgICB8ICA5ICsrKystLS0tLQ0K
PiAgIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvcGFyYWRlLXBzODY0MC5jICAgICAgICAgICAgICB8
ICA5ICsrKystLS0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc2lpOTIzNC5jICAgICAg
ICAgICAgICAgICAgICB8ICA5ICsrKystLS0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2Uv
c2lsLXNpaTg2MjAuYyAgICAgICAgICAgICAgICB8ICA5ICsrKystLS0tLQ0KPiAgIGRyaXZlcnMv
Z3B1L2RybS9icmlkZ2Uvc2ltcGxlLWJyaWRnZS5jICAgICAgICAgICAgICB8IDEwICsrKystLS0t
LS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWktcXAuYyAgICAg
ICAgfCAgOCArKysrLS0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHct
bWlwaS1kc2kuYyAgICAgICB8ICA4ICsrKystLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2JyaWRn
ZS9zeW5vcHN5cy9kdy1taXBpLWRzaTIuYyAgICAgIHwgIDggKysrKy0tLS0NCj4gICBkcml2ZXJz
L2dwdS9kcm0vYnJpZGdlL3RjMzU4NzYyLmMgICAgICAgICAgICAgICAgICAgfCAgOSArKysrLS0t
LS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RjMzU4NzY0LmMgICAgICAgICAgICAgICAg
ICAgfCAgOSArKysrLS0tLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RjMzU4NzY4LmMg
ICAgICAgICAgICAgICAgICAgfCAgOSArKysrLS0tLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vYnJp
ZGdlL3RjMzU4Nzc1LmMgICAgICAgICAgICAgICAgICAgfCAgOSArKysrLS0tLS0NCj4gICBkcml2
ZXJzL2dwdS9kcm0vYnJpZGdlL3RoYzYzbHZkMTAyNC5jICAgICAgICAgICAgICAgfCAgOCArKysr
LS0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGktZGxwYzM0MzMuYyAgICAgICAgICAg
ICAgICB8ICA5ICsrKystLS0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGktdGRwMTU4
LmMgICAgICAgICAgICAgICAgICB8ICA4ICsrKystLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2Jy
aWRnZS90aS10ZnA0MTAuYyAgICAgICAgICAgICAgICAgIHwgIDkgKysrKy0tLS0tDQo+ICAgZHJp
dmVycy9ncHUvZHJtL2JyaWRnZS90aS10cGQxMnMwMTUuYyAgICAgICAgICAgICAgIHwgIDkgKysr
Ky0tLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcC5jICAgICAgICAgICAg
ICAgICAgIHwgIDkgKysrKy0tLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19k
cGkuYyAgICAgICAgICAgICAgICAgIHwgIDkgKysrKy0tLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJt
L21lZGlhdGVrL210a19kc2kuYyAgICAgICAgICAgICAgICAgIHwgIDkgKysrKy0tLS0tDQo+ICAg
ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1pLmMgICAgICAgICAgICAgICAgIHwgIDkg
KysrKy0tLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX2VuY29kZXJfY3Zicy5j
ICAgICAgICAgIHwgMTIgKysrKysrLS0tLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL21lc29uL21l
c29uX2VuY29kZXJfZHNpLmMgICAgICAgICAgIHwgMTIgKysrKysrLS0tLS0tDQo+ICAgZHJpdmVy
cy9ncHUvZHJtL21lc29uL21lc29uX2VuY29kZXJfaGRtaS5jICAgICAgICAgIHwgMTIgKysrKysr
LS0tLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL3JlbmVzYXMvcmNhci1kdS9yY2FyX2x2ZHMuYyAg
ICAgICAgIHwgIDkgKysrKy0tLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL3JlbmVzYXMvcnotZHUv
cnpnMmxfbWlwaV9kc2kuYyAgICAgIHwgMTAgKysrKy0tLS0tLQ0KPiAgIDQ5IGZpbGVzIGNoYW5n
ZWQsIDIwMSBpbnNlcnRpb25zKCspLCAyMzcgZGVsZXRpb25zKC0pDQo+IA0KDQpbLi4uXQ0KDQo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL21pY3JvY2hpcC1sdmRzLmMgYi9k
cml2ZXJzL2dwdS9kcm0vYnJpZGdlL21pY3JvY2hpcC1sdmRzLmMNCj4gaW5kZXggMWQ0YWUwMDk3
ZGY4NDdkOWY5M2M3OWVlY2ZmMGM0NTg3YWUzMzFiYS4uOWY0ZmY4MmJjNmI0OTAxMGY4NzI3ZGEz
YjM2N2Y1YTc0NGEyOGVkYyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9t
aWNyb2NoaXAtbHZkcy5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvbWljcm9jaGlw
LWx2ZHMuYw0KPiBAQCAtMTU3LDkgKzE1NywxMCBAQCBzdGF0aWMgaW50IG1jaHBfbHZkc19wcm9i
ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiAgICAgICAgICBpZiAoIWRldi0+b2Zf
bm9kZSkNCj4gICAgICAgICAgICAgICAgICByZXR1cm4gLUVOT0RFVjsNCj4gDQo+IC0gICAgICAg
bHZkcyA9IGRldm1fa3phbGxvYygmcGRldi0+ZGV2LCBzaXplb2YoKmx2ZHMpLCBHRlBfS0VSTkVM
KTsNCj4gLSAgICAgICBpZiAoIWx2ZHMpDQo+IC0gICAgICAgICAgICAgICByZXR1cm4gLUVOT01F
TTsNCj4gKyAgICAgICBsdmRzID0gZGV2bV9kcm1fYnJpZGdlX2FsbG9jKCZwZGV2LT5kZXYsIHN0
cnVjdCBtY2hwX2x2ZHMsIGJyaWRnZSwNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICZtY2hwX2x2ZHNfYnJpZGdlX2Z1bmNzKTsNCj4gKyAgICAgICBpZiAoSVNfRVJSKGx2
ZHMpKQ0KPiArICAgICAgICAgICAgICAgcmV0dXJuIFBUUl9FUlIobHZkcyk7DQo+IA0KPiAgICAg
ICAgICBsdmRzLT5kZXYgPSBkZXY7DQo+IA0KPiBAQCAtMTkyLDcgKzE5Myw2IEBAIHN0YXRpYyBp
bnQgbWNocF9sdmRzX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+IA0KPiAg
ICAgICAgICBsdmRzLT5icmlkZ2Uub2Zfbm9kZSA9IGRldi0+b2Zfbm9kZTsNCj4gICAgICAgICAg
bHZkcy0+YnJpZGdlLnR5cGUgPSBEUk1fTU9ERV9DT05ORUNUT1JfTFZEUzsNCj4gLSAgICAgICBs
dmRzLT5icmlkZ2UuZnVuY3MgPSAmbWNocF9sdmRzX2JyaWRnZV9mdW5jczsNCj4gDQo+ICAgICAg
ICAgIGRldl9zZXRfZHJ2ZGF0YShkZXYsIGx2ZHMpOw0KPiAgICAgICAgICByZXQgPSBkZXZtX3Bt
X3J1bnRpbWVfZW5hYmxlKGRldik7DQoNClJldmlld2VkLWJ5OiBNYW5pa2FuZGFuIE11cmFsaWRo
YXJhbiA8bWFuaWthbmRhbi5tQG1pY3JvY2hpcC5jb20+DQoNCi0tIA0KVGhhbmtzIGFuZCBSZWdh
cmRzLA0KTWFuaWthbmRhbiBNLg0KDQo=
