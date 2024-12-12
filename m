Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 677969EDEF1
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2024 06:32:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3C6210E172;
	Thu, 12 Dec 2024 05:32:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=analogixsemi.com header.i=@analogixsemi.com header.b="GS16cykE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c110::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D79AF10E172
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2024 05:32:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qgv6VoFl1BT0s9z4zbMMiLsRfn5FZPa7xs0enfJon6I6y1Us9Z22VoMu59NrBWhC+hRzJYi7yl2tGGPA6SDvm3w0duAoDC/CiW8/yH4QTofLJtbT6TbQ1xA0361XkKttuyUUw4+nIMys8MRiOcb4TNNBQUrZQ4s+3+L+AFQ9DszNhsqyUWgJUNOKeVrfUHxznJQvUHu6bVk6eDsGzZPrjHoQJq65s/wqQ4EZndNkioODIAB/0SBv+6QHkVYokxvCF9VkTUppfH1augdlDENzWamuyOl1E0zKgR4Hq52Rs74upf/PQYRMnr3yY1maYPk1jZk8uT7dpgi/4ijxDgB8MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VcIwqbVRNPX8esnMmGZcui1NckgP8cWHe1eItHZDlU4=;
 b=Xbq+3SZgdnKfVAn9nm4t6uCien072vc0RQaDiL4e/kjAzRXzN4T7B3ne86mAasNaJUO4WSCbhp9ehsw4x27dPFBoaqO7i4gpGT+5k8cBa9HzEM1XS8AnRgT1p/yAP5ki3WdbC6s7FDJgVs7K8RW3V9biEBc0prjq6glNbUEfSeMaf8xt5pNr7Hd9mPivc4Ib2iC+oEulA7PkKFO03OttSHpiOyt5inlFyTswUr8iZ42x2VUge0ibjoqgffCzj/vWg3ByuShF084yJKyUhKhf992OpUqrSXu9GGpYiZsjICKgFfOUz04VTbVRsmSY4MWjOuYN0tpS+ilq7EZFxGQatQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analogixsemi.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VcIwqbVRNPX8esnMmGZcui1NckgP8cWHe1eItHZDlU4=;
 b=GS16cykEw/aI1vRrL+KpmUDUdZWFtqHDn/A0pbC5vrDrb3T7+yWVkMuMWO+XCCDY2tIUaJGlnsbk9HgRe178jH0bh8ry9oa25+2h+FsF5fYtfAqcweR3tlHprLnf4eCruk08bqy2HG+4130v8fCtTmqN/qHlXYKPOcDkPCyAlTc=
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by CH2PR04MB6507.namprd04.prod.outlook.com (2603:10b6:610:6d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.16; Thu, 12 Dec
 2024 05:31:56 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::5a7e:9e8c:138f:1815]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::5a7e:9e8c:138f:1815%7]) with mapi id 15.20.8251.015; Thu, 12 Dec 2024
 05:31:55 +0000
From: Xin Ji <xji@analogixsemi.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Pin-yen Lin
 <treapking@chromium.org>
CC: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Bernie Liang <bliang@analogixsemi.com>,
 Qilin Wen <qwen@analogixsemi.com>, "treapking@google.com"
 <treapking@google.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2] drm/bridge:anx7625: Update HDCP status at
 atomic_disable()
Thread-Topic: [PATCH v2] drm/bridge:anx7625: Update HDCP status at
 atomic_disable()
Thread-Index: AQHbSgZIlWYtAXCOr0iqdRV8Mp5aAbLeq/CAgAKKDQCAAHx4AIAAZuuQ
Date: Thu, 12 Dec 2024 05:31:55 +0000
Message-ID: <BY5PR04MB6739F18EB960E7606FC1D41DC73F2@BY5PR04MB6739.namprd04.prod.outlook.com>
References: <20241209064632.1705578-1-xji@analogixsemi.com>
 <fy6zvkdidz2srerfq5bshgcshps2wfa4syxwndwesgxcej66ws@nf5svlpkeodh>
 <CAEXTbpeC9DpLxHm2fw7hWKGfpxhUy5ZgHXtGJ0=WSxRrVa845w@mail.gmail.com>
 <dxczrjwzevtqn4jg7iaanui66hxsmx6gr6yvcm3wbztskweqmy@jyqpt2ntd224>
In-Reply-To: <dxczrjwzevtqn4jg7iaanui66hxsmx6gr6yvcm3wbztskweqmy@jyqpt2ntd224>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analogixsemi.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR04MB6739:EE_|CH2PR04MB6507:EE_
x-ms-office365-filtering-correlation-id: c43031fa-b51b-4302-595f-08dd1a6e4a7a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?cTBNd0tFbXF2bE5JbjVDblpjWitSNjJJdC9jQ2ZLTFlnS1lQelBmQUN0czh4?=
 =?utf-8?B?UDk1ZkhJWnFlZDd0RkdEMFpqWjN3eFZ1ZDNUUWFtSW1MaVlqclRsall2UWlY?=
 =?utf-8?B?RVlHQVptZEhkcDI2ZlhNc05wQkNkS3RPOTlWcnArMVR3R3FUeUMvMUg4SUxB?=
 =?utf-8?B?NVN6QjVtdDNyTDRPYlZqYlNNYll0Rm85VE5UNDFoZW9zUHlRTzlnMCtMWU93?=
 =?utf-8?B?ZUxRQVRZRlBJZndobzAzWXp6TkFKSnBNRTdscVNYUld4aHNjVDlCa0xGc0ZC?=
 =?utf-8?B?emlMSnRaaVIrUFVwdm1WMFQwdFg1UVk3TVVsaGRsRUVUV0hoSWFEZ1JmOWJZ?=
 =?utf-8?B?MnNHQm51R3ZlazhXMy9VemdaSW5GVlZDbXA4VXB1dVBFcEdlYnNWYittbmNL?=
 =?utf-8?B?MFcybWVUbm5VTEVhdkQ0MURMRWJVZE5tdDNiWjBxTWl6eUg4TFFCODhsZkpy?=
 =?utf-8?B?Y0hzWE9wMXZ2VEtXUHZhYkoyL29oRUIwRzNJYUlVQkY5QWpqZ1NZR3A4YW5K?=
 =?utf-8?B?REdrWjJUN1ozNlJ2Y2VBSElsUEVlYjJOSUVuMlNIMXVidi8vQ1QxbmVjSFM5?=
 =?utf-8?B?SjJ6RTFhMjlEaEpQNDNaZ3I2Ykt2RlA2bkMyc3h1MXFIb2lHS0FXSkxjSmcz?=
 =?utf-8?B?TEhXZ3lPZXgzOXNqRjVMU2FHTlgwY0lta3psUVFRQXZUYTB3K0puWkpiNThL?=
 =?utf-8?B?RXVyZkVybzNPSHlSNjhsNjlPUGtJUGRYM1RkZFdBMk5nYUErMlg1dUhoMXRh?=
 =?utf-8?B?SVhBSWhROUxQRnl0QjR5TVhQcFhmOUdITVNCdXF0c2tEblQrZ21PQS91ZGhW?=
 =?utf-8?B?aFdHRnNlUlJ1Q09CZE8zbDRHMmRhVmt0eFJROVFGeE5ubzFLQjljT0pqeTNH?=
 =?utf-8?B?YllLSlJGeXhteTY1OGM5c3V5UnFyVDRsekxKYjRPU2ZMUHB4SVB1Z0JjQjhl?=
 =?utf-8?B?dk5zTkJHeGMyK3Rma1VsVVJ2OW9aVytDY0RYTkdwUDdTTEVJOWVGZnVWMEpj?=
 =?utf-8?B?YTQzKytSZUM0a3ZzaUMrZ0xvbDF4TXJ1aDJvNnVXVFNOc3lYdG8vd0VXWVd4?=
 =?utf-8?B?cHJYc3pGc1dhbnJzL2NqZGJrL1FCbmo1N0dwV0JiUXd6YWk5QmJxZnh6ZUgz?=
 =?utf-8?B?S0RPTWVjeUswdUpsdzF3enY1UTFWQ3dDeXBUOXJFR25ZYXF2MEVnQWowM3NC?=
 =?utf-8?B?S1FOR2VWcGZaOHFQb0N5SERvaWNtQk5KWDNxeUljcGIyaFI3bDNpdzJoUEha?=
 =?utf-8?B?NTlyQ1RnYzc1TE5JcFB4a1VjbGh5R2NjcXpJRENCbjkyOGoyQTJJWHZST2pP?=
 =?utf-8?B?eGJEYXpNUXBVejRRU1pXSWhUa0x1RExLVVBLOU45OXdURmh5V3Y0NC83QkUx?=
 =?utf-8?B?bVV0UXQ2QUltcG9MaUJRekRKWHpLdjlsUVJzd2k2MWM0c2ViRmVTbmRDak5X?=
 =?utf-8?B?SkhSYWo2QzRyTU83Y00xS2JSdGs0MlNER2RHa3Z3TlJzcFVXRmhDR09kdkEv?=
 =?utf-8?B?TmhOQkJUeDFFOU1OeFh1a2YwR2ExQ2dyRk1xdkRnMGUxRlhJRkQxV0lqaWEz?=
 =?utf-8?B?QkxBNzBYVDcxRWJ0SmsyR2FuSzEzTG1NeWxsYkppS2JGZnRROXFxU2VYbWVs?=
 =?utf-8?B?SlRKZExZR2hEdXJNdjJPR05GUTd0cHF3Q0NhbDVaeTF6L2lqS2c3MVFYNG41?=
 =?utf-8?B?MWFyQUcrNGNsWHRLVGpuSnAwQzg1bzNzeWhXdlNsUDVLUWFIdUtxRlZ0R0lQ?=
 =?utf-8?B?ZTNHL2ZEWThTWU1XZW92QkVUMmJpeFhnSFlQNXFaRHdPa1hZMHJtSFppVFpz?=
 =?utf-8?B?cUVxRG5WS3VtZUFoUjY1d2lOWW9SSTRjUVVKOFNXS3N0aTJYTTFUSU13Sk9n?=
 =?utf-8?B?bWs4a1NHTmZDUzlhem84aXgxR1g1YTNzVkdUU2hJWi9VbUE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700018); DIR:OUT;
 SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bWZabXh3cXA5ZE9rWEY5RUtOUld2bk9nYlNCZGtwei9iRk9YN0hhbmJjVUg4?=
 =?utf-8?B?V3dqd0hkOFdHcmxkNlc2Y3Z0YjJQWXJnZGRVYXVvWllnZXQ5aDlhT0lRRXRt?=
 =?utf-8?B?V3lKRmVjbmhoeGI1MlpEQmJwajkzMnRlSTZOVW5ZS3UxK0haaG5BK21qMWpo?=
 =?utf-8?B?a0xlZ05YQUZ5L0RmTVhzaU00UWRFejVlWFdpeDhvRTZLYU1yVXlZUytYQ3V0?=
 =?utf-8?B?cUNiN205dEQ2SlpDRzlqTSthRGh1ODcyVzVOc3lwcFJRbHliT0sreVVZL2U3?=
 =?utf-8?B?U0QrMkEwWGlQUUxrZzVLcUI4UU9CSUxNSmFqTjN0eUkxZzVkT1hSYUpGZjRN?=
 =?utf-8?B?Q1E2YXBLc0xTTWI5cFVESE00NWVYMWVMcGljb0tiVGlqOGJZV2J1c3dpMFgy?=
 =?utf-8?B?em9VUDYvQ3JQQ3lkN0ZUbkJmWm9hSGs2Z1BxaTZLZDZjTnJ1N1VOcUxvNVJ0?=
 =?utf-8?B?NkIxZUtINzlIbkF1NCt6ZlB3anZScXgyOXNxS1pMYVBiWDRORzl4a0dva2dS?=
 =?utf-8?B?ditWNDY0YzJ6M2tmZVRLc3BmVGU4TWlFRHFuanlrVHVMUldQWDdVc2hWNWRU?=
 =?utf-8?B?Sy9JVUR1MXZZYUlMclI2RThRM3o3UlJmOUFaTmx3VllaVTdBTDBwanR2QTg2?=
 =?utf-8?B?L3lCWFM3OHA1UU5BblhTV3VaL0w2eWp4WnF3VU5LODQ0ZDY1V2NHcVVCWTJR?=
 =?utf-8?B?SlgzT0xldkxvRjJhR2didFJmUm9FZWVKbytKNnJ3RFE1OVo2L01MTWlBWXBL?=
 =?utf-8?B?NE1PanFNWm15TmZFWURkK1BVMlVOcmJDUlZaVWpoNGNMaXNucUx4bmZWZ0pu?=
 =?utf-8?B?Nmt0dlhLUEt4cVBKdXkzaWRYV0U2TXY5UlJIYXBJU3p5TUhReFNYYUhZWFIv?=
 =?utf-8?B?dXloNnV6UFA3NU9KZmVkNjF3S3RENEV4RTRmdnNoUWltYUhFNEdtNExMRVJE?=
 =?utf-8?B?bkRVVTBFOVFzLzBrc0NoTGN1UWRnUUJsK09SZll3aG0rZ3l3cmlVR01tM2FW?=
 =?utf-8?B?TFJvZklZTVlWMjltQTcwdUtzaXh3WDJPQ3pvVXJSdnlMcnhZQVhrdGR3RUNY?=
 =?utf-8?B?UDFNeC9aYnQ4ZEE5L0dLNGZFYXZ1SXhBc0lIY05odUlxMkcwbVNQVUIxMEx4?=
 =?utf-8?B?cjd5THI3bWJpTVpVUUJ4bG85SCtTMFN0Z201eFJJMXFKU3pnWnIxeUJwV3FK?=
 =?utf-8?B?VExQSUF0eERWVFBNZjF2aXgwdDhPR2FOVjFrNVQ4RXY1MDZvRGJ3Snp3VlUx?=
 =?utf-8?B?TXl1bjd2VS9Sd2ZFemFlQm1xbVhqVnJuTFYxamE5blcwZEhLVVdyZHpJNVpH?=
 =?utf-8?B?T1RzSk5taWFRWGRKcHJ1V0RBcThXeHExWlJacWtTWkhRUmxxZlVpbmhZb0Mx?=
 =?utf-8?B?YXQ3UzJ4TEVkTTUyYnBXZGZCWUZqbllEZzVoWmNnakZQeTdCaFpsWnFYZDVD?=
 =?utf-8?B?bUlnRG01SklaZm82OVBXdTNHeVlmcUJWdTFLdFJkNVlXcWJYQ3Q2aCs5ZkFN?=
 =?utf-8?B?NEFlYzZOamlKOGFKZ3hBek54YnFDQU1tQnBKcnRTM0lNaFdpVklIckNTRlJS?=
 =?utf-8?B?RlBrNmlQTktCU2FMU09lN2o3RGhnVVNxRWpsR0dEZE1zSFIvQ1dzekVUZENL?=
 =?utf-8?B?N3V4cmljMExLOUN1dmZTRG9mZHhncU1Kdk9nbHpYMjdZZU1wY081clpUb05L?=
 =?utf-8?B?SzVHRmpWY1ZXZmtVKzg2Uzd1Q3ZUSlVHVCsrbE92SVBwUGNXMU43ckh3eXRS?=
 =?utf-8?B?eE5xVHRRWXNnVVNzMm0vUXRCMTgrRFUvYW83SXR2QjVoVDlXbjBCNXF2T05x?=
 =?utf-8?B?N0l2NUY2ajk2RDNMM1ppWWRxaFBQU1Z5aUs2eXFmb1M2M2xEQXdtRjl0WmM3?=
 =?utf-8?B?aEE0cnY5NXpjZGVyai9MYlgrblV4d3Z3Ty9BWEdXbnMwOEpZaXZibld1ZHlE?=
 =?utf-8?B?bmkwQmlpd285bWhHdjNDRVA0bWZsMEtzREsrOSsvSkFHVVJzSmt3b2JmaFU3?=
 =?utf-8?B?V1M3RWtBTUlndmVhUHRNYWQ3YWVWUXRVK290OURwRWxnWS9YMC9sTXl4UENz?=
 =?utf-8?B?eDFVWVFiNW5yeTB4TDFkcHB2emxWQjVpa0pLNnRXSHNpN0Q2TWtNcnZySWRV?=
 =?utf-8?Q?Xcc/irKrL5y8RGeC0BRE8PQ5r?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c43031fa-b51b-4302-595f-08dd1a6e4a7a
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2024 05:31:55.3958 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WiQ3BECwA1+uIT3Rsko54VNHrN58RYWrnsIAV7AY5Gb4vbJXUl54Wt08SYPP6C6W4f062sqLobbyvGBoJ0fqWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR04MB6507
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

SGkgRG1pdHJ5IGFuZCBQaW4teWVuIExpbiwgdGhhbmtzIGZvciB0aGUgcmV2aWV3Lg0KDQo+IC0t
LS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IERtaXRyeSBCYXJ5c2hrb3YgPGRtaXRy
eS5iYXJ5c2hrb3ZAbGluYXJvLm9yZz4NCj4gU2VudDogVGh1cnNkYXksIERlY2VtYmVyIDEyLCAy
MDI0IDc6MjAgQU0NCj4gVG86IFBpbi15ZW4gTGluIDx0cmVhcGtpbmdAY2hyb21pdW0ub3JnPg0K
PiBDYzogWGluIEppIDx4amlAYW5hbG9naXhzZW1pLmNvbT47IEFuZHJ6ZWogSGFqZGEgPGFuZHJ6
ZWouaGFqZGFAaW50ZWwuY29tPjsNCj4gTmVpbCBBcm1zdHJvbmcgPG5laWwuYXJtc3Ryb25nQGxp
bmFyby5vcmc+OyBSb2JlcnQgRm9zcyA8cmZvc3NAa2VybmVsLm9yZz47DQo+IExhdXJlbnQgUGlu
Y2hhcnQgPExhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT47IEpvbmFzIEthcmxtYW4N
Cj4gPGpvbmFzQGt3aWJvby5zZT47IEplcm5laiBTa3JhYmVjIDxqZXJuZWouc2tyYWJlY0BnbWFp
bC5jb20+OyBNYWFydGVuDQo+IExhbmtob3JzdCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50
ZWwuY29tPjsgTWF4aW1lIFJpcGFyZA0KPiA8bXJpcGFyZEBrZXJuZWwub3JnPjsgVGhvbWFzIFpp
bW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+OyBEYXZpZA0KPiBBaXJsaWUgPGFpcmxpZWRA
Z21haWwuY29tPjsgU2ltb25hIFZldHRlciA8c2ltb25hQGZmd2xsLmNoPjsgQmVybmllIExpYW5n
DQo+IDxibGlhbmdAYW5hbG9naXhzZW1pLmNvbT47IFFpbGluIFdlbiA8cXdlbkBhbmFsb2dpeHNl
bWkuY29tPjsNCj4gdHJlYXBraW5nQGdvb2dsZS5jb207IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmc7IGxpbnV4LQ0KPiBrZXJuZWxAdmdlci5rZXJuZWwub3JnDQo+IFN1YmplY3Q6IFJl
OiBbUEFUQ0ggdjJdIGRybS9icmlkZ2U6YW54NzYyNTogVXBkYXRlIEhEQ1Agc3RhdHVzIGF0DQo+
IGF0b21pY19kaXNhYmxlKCkNCj4gDQo+IENBVVRJT046IFRoaXMgZW1haWwgb3JpZ2luYXRlZCBm
cm9tIG91dHNpZGUgb2YgdGhlIG9yZ2FuaXphdGlvbi4gUGxlYXNlIGRvIG5vdA0KPiBjbGljayBs
aW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3UgcmVjb2duaXplIHRoZSBzZW5kZXIs
IGFuZCBrbm93IHRoZQ0KPiBjb250ZW50IGlzIHNhZmUuDQo+IA0KPiANCj4gT24gV2VkLCBEZWMg
MTEsIDIwMjQgYXQgMTE6NTQ6NTRQTSArMDgwMCwgUGluLXllbiBMaW4gd3JvdGU6DQo+ID4gSGkg
RGltaXRyeSwNCj4gPg0KPiA+IFRoYW5rcyBmb3IgdGhlIHJldmlldy4NCj4gPg0KPiA+IE9uIFdl
ZCwgRGVjIDExLCAyMDI0IGF0IDU6NDTigK9QTSBEbWl0cnkgQmFyeXNoa292DQo+ID4gPGRtaXRy
eS5iYXJ5c2hrb3ZAbGluYXJvLm9yZz4gd3JvdGU6DQo+ID4gPg0KPiA+ID4gT24gTW9uLCBEZWMg
MDksIDIwMjQgYXQgMDI6NDY6MzJQTSArMDgwMCwgWGluIEppIHdyb3RlOg0KPiA+ID4gPiBXaGVu
IHVzZXIgZW5hYmxlZCBIRENQIGZlYXR1cmUsIHVwcGVyIGxheWVyIHdpbGwgc2V0IEhEQ1AgY29u
dGVudA0KPiA+ID4gPiB0byBEUk1fTU9ERV9DT05URU5UX1BST1RFQ1RJT05fREVTSVJFRC4gTmV4
dCwgYW54NzYyNSB3aWxsDQo+IHVwZGF0ZQ0KPiA+ID4gPiBIRENQIGNvbnRlbnQgdG8gRFJNX01P
REVfQ09OVEVOVF9QUk9URUNUSU9OX0VOQUJMRUQgaWYgZG93bg0KPiBzdHJlYW0NCj4gPiA+ID4g
c3VwcG9ydCBIRENQIGZlYXR1cmUuDQo+ID4gPiA+DQo+ID4gPiA+IEhvd2V2ZXIgb25jZSBIRENQ
IGNvbnRlbnQgdHVybiB0bw0KPiA+ID4gPiBEUk1fTU9ERV9DT05URU5UX1BST1RFQ1RJT05fRU5B
QkxFRA0KPiA+ID4gPiB1cHBlciBsYXllciB3aWxsIG5vdCB1cGRhdGUgdGhlIEhEQ1AgY29udGVu
dCB0bw0KPiA+ID4gPiBEUk1fTU9ERV9DT05URU5UX1BST1RFQ1RJT05fVU5ERVNJUkVEIHVudGls
IG1vbml0b3INCj4gZGlzY29ubmVjdC4NCj4gPiA+DQo+ID4gPiBXaGF0IGlzICJ1cHBlciBsYXll
ciI/IElzIGl0IGEga2VybmVsIG9yIGEgdXNlcnNwYWNlPw0KPiA+DQo+ID4gSSB0aGluayBYaW4g
bWVhbnQgdXNlcnNwYWNlLCBidXQgc291bmRzIGxpa2UgdGhlcmUgYXJlIHNvbWUNCj4gPiBtaXN1
bmRlcnN0YW5kaW5nIGFyb3VuZCB0aGUgSERDUCBzdGF0dXMuDQo+ID4gPg0KPiA+ID4gPkZyb20g
ZHJtX2hkY3BfdXBkYXRlX2NvbnRlbnRfcHJvdGVjdGlvbigpIGRvY3VtZW50YXRpb246DQo+ID4g
Pg0KPiA+ID4gTm8gdWV2ZW50IGZvciBERVNJUkVELT5VTkRFU0lSRUQgb3IgRU5BQkxFRC0+VU5E
RVNJUkVELCBhcw0KPiB1c2Vyc3BhY2UNCj4gPiA+IGlzIHRyaWdnZXJpbmcgc3VjaCBzdGF0ZSBj
aGFuZ2UgYW5kIGtlcm5lbCBwZXJmb3JtcyBpdCB3aXRob3V0DQo+ID4gPiBmYWlsLlRoaXMgZnVu
Y3Rpb24gdXBkYXRlIHRoZSBuZXcgc3RhdGUgb2YgdGhlIHByb3BlcnR5IGludG8gdGhlDQo+ID4g
PiBjb25uZWN0b3IncyBzdGF0ZSBhbmQgZ2VuZXJhdGUgYW4gdWV2ZW50IHRvIG5vdGlmeSB0aGUg
dXNlcnNwYWNlLg0KPiA+ID4NCj4gPiA+DQo+ID4gPiA+DQo+ID4gPiA+IFNvIHdoZW4gdXNlciBk
eW5hbWljIGNoYW5nZSB0aGUgZGlzcGxheSByZXNvbHV0aW9uLCBhbng3NjI1IGRyaXZlcg0KPiA+
ID4gPiBtdXN0IGNhbGwgZHJtX2hkY3BfdXBkYXRlX2NvbnRlbnRfcHJvdGVjdGlvbigpIHRvIHVw
ZGF0ZSBIRENQDQo+ID4gPiA+IGNvbnRlbnQgdG8gRFJNX01PREVfQ09OVEVOVF9QUk9URUNUSU9O
X1VOREVTSVJFRCBpbiBicmlkZ2UNCj4gPiA+ID4gaW50ZXJmYWNlIC5hdG9taWNfZGlzYWJsZSgp
Lg0KPiA+ID4NCj4gPiA+IFdoeT8NCj4gPiA+DQo+ID4gPiA+DQo+ID4gPiA+IFNpZ25lZC1vZmYt
Ynk6IFhpbiBKaSA8eGppQGFuYWxvZ2l4c2VtaS5jb20+DQo+ID4gPiA+IC0tLQ0KPiA+ID4gPiAg
ZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hbmFsb2dpeC9hbng3NjI1LmMgfCAyNQ0KPiA+ID4gPiAr
KysrKysrKysrKysrKysrKystLS0tLQ0KPiA+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDIwIGluc2Vy
dGlvbnMoKyksIDUgZGVsZXRpb25zKC0pDQo+ID4gPiA+DQo+ID4gPiA+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYnJpZGdlL2FuYWxvZ2l4L2FueDc2MjUuYw0KPiA+ID4gPiBiL2RyaXZl
cnMvZ3B1L2RybS9icmlkZ2UvYW5hbG9naXgvYW54NzYyNS5jDQo+ID4gPiA+IGluZGV4IGEyNjc1
YjEyMWZlNC4uYTc1ZjUxOWRkY2I4IDEwMDY0NA0KPiA+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYnJpZGdlL2FuYWxvZ2l4L2FueDc2MjUuYw0KPiA+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vYnJpZGdlL2FuYWxvZ2l4L2FueDc2MjUuYw0KPiA+ID4gPiBAQCAtODYxLDYgKzg2MSwyMiBA
QCBzdGF0aWMgaW50IGFueDc2MjVfaGRjcF9kaXNhYmxlKHN0cnVjdA0KPiBhbng3NjI1X2RhdGEg
KmN0eCkNCj4gPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFRYX0hEQ1BfQ1RS
TDAsIH5IQVJEX0FVVEhfRU4gJg0KPiA+ID4gPiAweEZGKTsgIH0NCj4gPiA+ID4NCj4gPiA+ID4g
K3N0YXRpYyB2b2lkIGFueDc2MjVfaGRjcF9kaXNhYmxlX2FuZF91cGRhdGVfY3Aoc3RydWN0DQo+
ID4gPiA+ICthbng3NjI1X2RhdGEgKmN0eCkgew0KPiA+ID4gPiArICAgICBzdHJ1Y3QgZGV2aWNl
ICpkZXYgPSBjdHgtPmRldjsNCj4gPiA+ID4gKw0KPiA+ID4gPiArICAgICBpZiAoIWN0eC0+Y29u
bmVjdG9yKQ0KPiA+ID4gPiArICAgICAgICAgICAgIHJldHVybjsNCj4gPiA+ID4gKw0KPiA+ID4g
PiArICAgICBhbng3NjI1X2hkY3BfZGlzYWJsZShjdHgpOw0KPiA+ID4gPiArDQo+ID4gPiA+ICsg
ICAgIGN0eC0+aGRjcF9jcCA9IERSTV9NT0RFX0NPTlRFTlRfUFJPVEVDVElPTl9VTkRFU0lSRUQ7
DQo+ID4gPiA+ICsgICAgIGRybV9oZGNwX3VwZGF0ZV9jb250ZW50X3Byb3RlY3Rpb24oY3R4LT5j
b25uZWN0b3IsDQo+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgY3R4LT5oZGNwX2NwKTsNCj4gPiA+ID4gKw0KPiA+ID4gPiArICAgICBkZXZfZGJnKGRldiwg
InVwZGF0ZSBDUCB0byBVTkRFU0lSRVxuIik7IH0NCj4gPiA+ID4gKw0KPiA+ID4gPiAgc3RhdGlj
IGludCBhbng3NjI1X2hkY3BfZW5hYmxlKHN0cnVjdCBhbng3NjI1X2RhdGEgKmN0eCkgIHsNCj4g
PiA+ID4gICAgICAgdTggYmNhcDsNCj4gPiA+ID4gQEAgLTIxNjUsMTEgKzIxODEsOCBAQCBzdGF0
aWMgaW50DQo+IGFueDc2MjVfY29ubmVjdG9yX2F0b21pY19jaGVjayhzdHJ1Y3QgYW54NzYyNV9k
YXRhICpjdHgsDQo+ID4gPiA+ICAgICAgICAgICAgICAgICAgICAgICBkZXZfZXJyKGRldiwgImN1
cnJlbnQgQ1AgaXMgbm90IEVOQUJMRURcbiIpOw0KPiA+ID4gPiAgICAgICAgICAgICAgICAgICAg
ICAgcmV0dXJuIC1FSU5WQUw7DQo+ID4gPiA+ICAgICAgICAgICAgICAgfQ0KPiA+ID4gPiAtICAg
ICAgICAgICAgIGFueDc2MjVfaGRjcF9kaXNhYmxlKGN0eCk7DQo+ID4gPiA+IC0gICAgICAgICAg
ICAgY3R4LT5oZGNwX2NwID0gRFJNX01PREVfQ09OVEVOVF9QUk9URUNUSU9OX1VOREVTSVJFRDsN
Cj4gPiA+ID4gLSAgICAgICAgICAgICBkcm1faGRjcF91cGRhdGVfY29udGVudF9wcm90ZWN0aW9u
KGN0eC0+Y29ubmVjdG9yLA0KPiA+ID4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgY3R4LT5oZGNwX2NwKTsNCj4gPiA+ID4gLSAgICAgICAgICAgICBk
ZXZfZGJnKGRldiwgInVwZGF0ZSBDUCB0byBVTkRFU0lSRVxuIik7DQo+ID4gPiA+ICsNCj4gPiA+
ID4gKyAgICAgICAgICAgICBhbng3NjI1X2hkY3BfZGlzYWJsZV9hbmRfdXBkYXRlX2NwKGN0eCk7
DQo+ID4gPg0KPiA+ID4gTm8uIGF0b21pY19jaGVjaygpIE1BWSBOT1QgcGVyZm9ybSBhbnkgY2hh
bmdlcyB0byB0aGUgaGFyZHdhcmUuIEl0DQo+ID4gPiBtaWdodCBiZSBqdXN0IGEgcHJvYmUgZnJv
bSB1c2Vyc3BhY2UgdG8gY2hlY2sgaWYgdGhlIG1vZGUgb3IgYQ0KPiA+ID4gcGFydGljdWxhciBv
cHRpb24gY2FuIGJlIHNldCBpbiBhIHBhcnRpY3VsYXIgd2F5LiBUaGVyZSBpcyBubw0KPiA+ID4g
Z3VhcmFudGVlIHRoYXQgdXNlcnNwYWNlIHdpbGwgZXZlbiB0cnkgdG8gY29tbWl0IGl0Lg0KPiA+
DQo+ID4gU28sIHdlIHNob3VsZCBtb3ZlIHRoZSBoZGNwIHN0YXR1cyB1cGRhdGUgZnJvbSAuYXRv
bWljX2NoZWNrKCkgdG8NCj4gPiAuYXRvbWljX2VuYWJsZSgpIGFuZCAuYXRvbWljX2Rpc2FibGUo
KSwgcmlnaHQ/IFRoYXQgaXMsIGVuYWJsZSBIRENQDQo+ID4gZm9yIHRoZSBjaGlwIGF0IC5hdG9t
aWNfZW5hYmxlKCkgaWYgaXQgaXMgREVTSVJFRCBhbmQgZGlzYWJsZSBpdCBhdA0KPiA+IC5hdG9t
aWNfZGlzYWJsZSgpIGlmIHdlIGVuYWJsZWQgaXQgcHJldmlvdXNseS4NCj4gDQo+IFRoaXMgaXMg
b25lIG9mIHRoZSBvcHRpb25zIChlLmcuIHVzZWQgYnkgY2Rucy1taGRwODU0NikuIEFub3RoZXIg
b3B0aW9uIChpOTE1LA0KPiBhbWQpIGlzIHRvIGVuYWJsZSBhbmQgZGlzYWJsZSBIRENQIGluIGF0
b21pY19lbmFibGUoKSBmb2xsb3dpbmcgc2VsZWN0ZWQgSERDUA0KPiBzdGF0ZS4NCj4gDQo+ID4N
Cj4gPiBNYXliZSB3ZSBjYW4ga2VlcCBzb21lIG9mIHRoZSBjaGVja3MgaW4gLmF0b21pY19jaGVj
aygpLCBidXQgSSBkb3VidA0KPiA+IGlmIHRob3NlIGxvZ2ljcyBhY3R1YWxseSBtYWtlIHNlbnNl
Lg0KPiANCj4gSSB0aGluayB0aGVzZSBjaGVja3MgYXJlIG9rYXksIGp1c3QgbW92ZSB0aGUNCj4g
YW54NzYyNV9oZGNwX2Rpc2FibGVfYW5kX3VwZGF0ZV9jcCgpIHRvIGEgcHJvcGVyIHBsYWNlLg0K
T0ssIEknbGwgbW92ZSB0byB0aGUgYXRvbWljX2VuYWJsZSgpIGFuZCB1cHN0cmVhbSBuZXcgcGF0
Y2gsIHRoYW5rcyENCg0KPiANCj4gPiA+DQo+ID4gPiA+ICAgICAgIH0NCj4gPiA+ID4NCj4gPiA+
ID4gICAgICAgaWYgKGNwID09IERSTV9NT0RFX0NPTlRFTlRfUFJPVEVDVElPTl9FTkFCTEVEKSB7
IEBAIC0NCj4gMjQ0OSw2DQo+ID4gPiA+ICsyNDYyLDggQEAgc3RhdGljIHZvaWQgYW54NzYyNV9i
cmlkZ2VfYXRvbWljX2Rpc2FibGUoc3RydWN0DQo+ID4gPiA+IGRybV9icmlkZ2UgKmJyaWRnZSwN
Cj4gPiA+ID4NCj4gPiA+ID4gICAgICAgZGV2X2RiZyhkZXYsICJkcm0gYXRvbWljIGRpc2FibGVc
biIpOw0KPiA+ID4gPg0KPiA+ID4gPiArICAgICBhbng3NjI1X2hkY3BfZGlzYWJsZV9hbmRfdXBk
YXRlX2NwKGN0eCk7DQo+ID4gPiA+ICsNCj4gPiA+ID4gICAgICAgY3R4LT5jb25uZWN0b3IgPSBO
VUxMOw0KPiA+ID4gPiAgICAgICBhbng3NjI1X2RwX3N0b3AoY3R4KTsNCj4gPiA+ID4NCj4gPiA+
ID4gLS0NCj4gPiA+ID4gMi4yNS4xDQo+ID4gPiA+DQo+ID4gPg0KPiA+ID4gLS0NCj4gPiA+IFdp
dGggYmVzdCB3aXNoZXMNCj4gPiA+IERtaXRyeQ0KPiA+DQo+ID4gUmVnYXJkcywNCj4gPiBQaW4t
eWVuDQo+IA0KPiAtLQ0KPiBXaXRoIGJlc3Qgd2lzaGVzDQo+IERtaXRyeQ0K
