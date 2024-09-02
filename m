Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE029681AB
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2024 10:25:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1E0610E150;
	Mon,  2 Sep 2024 08:25:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="J8cTeYXE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2048.outbound.protection.outlook.com [40.107.93.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C5B110E257
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2024 08:25:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n/DIhoi31uhDNYw24bopTNVMYyxhaIu3VASs20mRyQAk5KC95Yd5fbG40dUAicw3iZ73npRLoQFFGo1uGOtkNYlF9DZTzZUuQdVluZjdToteGU+rQtjGeZ6KebEVL+k5jjMZCkSADomaZhgy3DWU/4j7+PLvoKYjf9UQH5/ntBJLvqMscqGX75WN27lEGENO8+odVl0L3Hc8/WKjpKK5rfgANiBwjdtATkXxkmTIzWW6C0NACtrHxAFCY1lD+6zABbUxSPN9waXhHhTvN+qYGjYWk7yq053mXJNDiWcsKiLm/LyRdf/5JL0Qcf4vWHqmEsEVferRpPvgEd88CzpV8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DzkgGJN84n9jeiBKzhMfFTkcejHEUKfe9YUKjUtWX2I=;
 b=P4+HbyBM7AwL9w5906P7RnXOu/YWXlxiPGDGgzVoAZ2BimWgaIVjjm0TqtQnmv4ZHqDc4V5/NXxJTGJ7fWstdNLwhYC1Tbq2M3JTAlh4P5++Yq/4zF/51zkrY4T8xAmIPmMHUlA6JgLMwEOjrZIxMyfPUx35pTbb6nWfldsDoBgFteI7JO5r961/IJcNFyu6jxb2HG+UO2oSH90VvXsk/xiBa7c8rPOmQG4dsO6+xUvC192cxjmQgV7gn7ilUh3+CX8WJPTqVlJOf5oCkOk27B0lLl4GE8PiIJfs0TljXq/mZnhoSfDNrDhrmbPazK4wLv0xn+UsDnuxj0+/DWmzXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DzkgGJN84n9jeiBKzhMfFTkcejHEUKfe9YUKjUtWX2I=;
 b=J8cTeYXEQ5wYfZyOg8uvIKj3wV/kvFExW1PpsbOPt6DFfPdjx7w1e8T9h6PXzWtgXj718FqwQgLztqf9yIT9Vxkjs/XqiCEAhnor9QMdRd/HIWzUnBNroqXKRVlvLdMakFr1AKGrr+knTRuE3at6TcDcwn8h6J5np++pkKgMD3UuXQQaKWaObyleTaNgCctPaqAbn0Cp7QTkPXlIuYTQ0T7copfyRvj47aLdueWwyKKSbJQqY8RHjCoRoFiB/++27qHtdszK3QR//kaBxzIn6UlmS1c3tlkKmcyNaj2KKcODA2Rqi/uXyuxqY4f8dFf9v3yxMfIv9S68kfLUJfz9YA==
Received: from PH7PR11MB6451.namprd11.prod.outlook.com (2603:10b6:510:1f4::16)
 by SJ0PR11MB4832.namprd11.prod.outlook.com (2603:10b6:a03:2dd::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.23; Mon, 2 Sep
 2024 08:25:36 +0000
Received: from PH7PR11MB6451.namprd11.prod.outlook.com
 ([fe80::80a8:f388:d92e:41f8]) by PH7PR11MB6451.namprd11.prod.outlook.com
 ([fe80::80a8:f388:d92e:41f8%6]) with mapi id 15.20.7918.020; Mon, 2 Sep 2024
 08:25:36 +0000
From: <Dharma.B@microchip.com>
To: <claudiu.beznea@tuxon.dev>, <Manikandan.M@microchip.com>,
 <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>, <rfoss@kernel.org>,
 <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@gmail.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <Hari.PrasathGE@microchip.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/3] drm/bridge: microchip-lvds: Revert
 clk_prepare_enable() in case of failure
Thread-Topic: [PATCH 1/3] drm/bridge: microchip-lvds: Revert
 clk_prepare_enable() in case of failure
Thread-Index: AQHa+Jv3E6nmCX7dPEKp0MFBmfquabJD8tqAgAA9NYCAAAIWgA==
Date: Mon, 2 Sep 2024 08:25:36 +0000
Message-ID: <b1975bac-34ac-4463-a8a6-0b510752bb7d@microchip.com>
References: <20240827161223.4152195-1-claudiu.beznea@tuxon.dev>
 <20240827161223.4152195-2-claudiu.beznea@tuxon.dev>
 <b9b8494e-8606-4f40-87ad-797617b72d18@microchip.com>
 <0dac055e-9d31-43ff-8584-57565f53e761@tuxon.dev>
In-Reply-To: <0dac055e-9d31-43ff-8584-57565f53e761@tuxon.dev>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6451:EE_|SJ0PR11MB4832:EE_
x-ms-office365-filtering-correlation-id: 834af01b-c77e-445d-34b7-08dccb28d229
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6451.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700018)(921020);
 DIR:OUT; SFP:1101; 
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|38070700018|921020; 
x-microsoft-antispam-message-info: =?utf-8?B?dVBCMjdReWVscnpqTnhMUHpCTXlHdmVrM3lrTklRVno2QTF2bkhrTDBMTmFa?=
 =?utf-8?B?elZ3aFdtVWIzQTZRZzBRR0tnSFF6MUQwNWttMGE1Rmh5NmlsdmhuVmJpRXhY?=
 =?utf-8?B?V2JVU2FiSnV2YWNrZjJUR1dJQUFzVFhaNmtaS1BZL2k3TzdIT3JPbVBDWFBp?=
 =?utf-8?B?VHljNjFqVTVyVzVlZEw4SUVUQnB6eWN1Sm14bVo1bWJzTmw0bHBnbGsyNTRH?=
 =?utf-8?B?TE5wMTlKMWUvNWVJZW1sdDBjMlZrRm1TYy9TN3EzOHU2RTNZa29xYjAvOUM1?=
 =?utf-8?B?YmhHVW5JR0ZJZlIzT2V5VUlMNUt6NU1TL2JxVmRQYmEyRjZsQk9NVXhiU21C?=
 =?utf-8?B?MDNyalJVSUNRYWlvYWw0K2l4anJuWmVaVGNpSkgyekFYV0gwTjhVbXBmOUhq?=
 =?utf-8?B?bEgxcEJmeTBJeGxkakRDSGozaHQ0V3Jza21XQUdxcUZPc2o4OEFKMUFXeWxU?=
 =?utf-8?B?WGEzbkFzZlhXVUg4aTJqMmxYNndTOWJabnRBVGUvM0NQZjdhcUVsYytGVk1Z?=
 =?utf-8?B?U1lYWmF5VUpnMVNDR1E2bWhaNnduMGV4SWYyVzE5RDNtSis5Nk4rYzhWSHZK?=
 =?utf-8?B?bkFrNVpjSUNuL3dBVFh4WFBnOVRjWEJzWkJ3aGt0TjBQUmdlYXl6VkJwWW9p?=
 =?utf-8?B?eVZmZk44aHVOQzdCWW5LbUpWRW8vN2JaRGRkSkU4eC9UZUNreWhxenBiVFFZ?=
 =?utf-8?B?MGhYRkQ0aWh2SytVVmNOSzl4aXJnWFRaK2MvcjcrcG5jTjNYUEFlNHFGczBT?=
 =?utf-8?B?bmNmRS9xSFhyeDVHV0xudW5FOE81WlBBa3ZvT2Z5SFJTenFtczZFSmI1L3ZX?=
 =?utf-8?B?T2ZVc1RrUkFnOG4xV3FsaEtqVllFM1N4TTZ4b3Y2SDhyZjVCL3JTRlRxSnd4?=
 =?utf-8?B?NFJCa0NWNENTT29ZdHhDTWJNVUZHWXppT1dCc3BnUTU5cVVLMEJwUktqdW9E?=
 =?utf-8?B?cmc3dVNza2RmSWNrREV6bXRQNlBGVmZ2ZHJETFh6V01sYXJ4ZTdKdXlXMlFX?=
 =?utf-8?B?K1MwZWd2M0MxUjZrZ25FcVVVOFdsUnBDTjNEYllUNnVuUHo3WDBvcUU1Wis4?=
 =?utf-8?B?R2hheGVJWlhYU1hSYUg2bXVFanpyeElHdnJmN2NJeU9zMG5iSlhEMCtadWkz?=
 =?utf-8?B?TXRvYjZ6SndCVnV1VXFDeXV4T3I0Z091UlM0M1FvWFkzRS9WL3hWUmJGUER1?=
 =?utf-8?B?UEtzUGpjUG4zOHc3YVN5bFRQYmFkSmNQME5lNzhkc2lmeFEvaE8zbG9QT2ZX?=
 =?utf-8?B?b3pHRURvbnJFOW10SWtGcWFhOEdBbG80ZE5UeFlmTnppZmw5L1FCeHJ5WWdu?=
 =?utf-8?B?dWZRdk9OTDNlWEF0VC8zTmw5ZlJMYTY1UG9DMGRqRGowNjg2YVZ3M3l4T0x1?=
 =?utf-8?B?QTN6RUF2UGVab1hRd1NCYnh0Um1Jc3d6L2hENXRrSndQdXdVQ2ppM1lIa0hz?=
 =?utf-8?B?eGgxOXJjZm1JNXg3N1MxTGNKRlJMNktvZVQrQ1I2WnFIVnhvelplbDdRNTFY?=
 =?utf-8?B?c2xiOFRpQmxNZWpqVVlGQmtJTS9DQmhhWlhGV1BuRVJkOWQ3TmI1L0hpQlFO?=
 =?utf-8?B?anVyYUNITGZvdEtxOXVRelRiTUU4OVNPdzJNaTIyQ1I5SHg2Q2k5emJrMXdL?=
 =?utf-8?B?YmxkeGxXckFLcm90bmdYUDc1NlRqWlAzMkpVcDJaSVcxRjJ5bTNvemdvK0xE?=
 =?utf-8?B?Y0F3Sk9KdnlneGVhL0lJSVk2UEFNN0hvdE9yQ1dXNHViZHJ5TzNFN3lycnZq?=
 =?utf-8?B?QktsUDRJT1dLR0JmNDZidG14MzdhMnlZaHVWQWdJVVNnc2c3bHlFN0NXUTdm?=
 =?utf-8?B?UmxHdUwwS25iT0JWVXBuQkNPQ3VYanJsbDBseFZNc0FuQmZkc0pJM1ZvakdZ?=
 =?utf-8?B?T1hFZjlIb05zT3NWTkdwalJiNkxRRDZ4Mml1S01PbjIwT3NKMnBvcnJ5ZjZ1?=
 =?utf-8?Q?wy7WpK9F7/M=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cVkrbUxVM1ZhVGtWK08vQVZESXF3WnN2b29URGhYYi91aldiUWwwN1NpV1Zv?=
 =?utf-8?B?RVJFZVdxZjhUYXBIdklScXZZSDZIanI4WTg2UXpBWmM3RWlsaUkyWTIvd3Fa?=
 =?utf-8?B?dU9FeGRBNHlzNWdmdlQ5eGFQd1M2SXdCcnRwTDBwdThQZTN4eDNsOC9FN3Qz?=
 =?utf-8?B?cXo5ZEFnL3cxY2ZjKzhKSGp3b2wxVHhaays5Zkc0dE9xQjYxelhoLzlyTzNw?=
 =?utf-8?B?MlhORDBzUDkvOEYxT3JlNkdmR0tHZkQyaTF1Y2JDUnJab1lzdzhwdGgvN0ZM?=
 =?utf-8?B?VGFVaFo5aGN3T3BuUlQ5WGNjMXA4YWNNUmtiZ1Zqc1Y2Kzh3Q2tEYUlXYmFz?=
 =?utf-8?B?d0E1RExEM3BFWURDbE1WZ2hrbTdOdWh6Y3p1cnlieE51eXZUU053MS9ubUg2?=
 =?utf-8?B?UHVPTXhlcDRuQzhQaUtlclFzOVpYaDlsaEZ3aGhxSHlVbEQvaUFpeW9SM0xN?=
 =?utf-8?B?TUVFZ0lIVXk4c1NiVjZwZnZNZjZIMm54MGlkUWVVM1NpVS85ZDQ0aks2SURE?=
 =?utf-8?B?T28wOW9nTVE3Yy9NRVRKcENXdSsveE5aS0xDVVJBajNvOEhaT08rZ0d5ZzYv?=
 =?utf-8?B?QzlDaUxtMHVyZ0tVSW9EMXRyWWdmbHYvOWx3R29mUHltQkM3WndWTUIydE1w?=
 =?utf-8?B?K0ExZjZNRVBKOHY3K21STnlHNVBTa1laSDhTd21Sd0RUdHJpU0k3ZkVKL0Jt?=
 =?utf-8?B?S2pvc1BTd1JJRk14TFlzMWgzS2d6d2NEUjB5VGJhNEVuZkZ0MG16QVhmU0t1?=
 =?utf-8?B?TGFGdVowVjFEQlhCdmlwVHFYeWNRMnpmK05ra3VtVmppQlF3blNIQTh0UWJW?=
 =?utf-8?B?c1ZKZmFuMzdGaFRtVzRFdDNaTXBQSy93cWlndU02NVNybVFkcWs5bFFkaGZU?=
 =?utf-8?B?YklXN1dvUVloS0ZqbWlwdkd1ZW95eWZIRlpSNWZEZUFHTllUdXhBNUpyZjgx?=
 =?utf-8?B?OGUxTlZEcmF6aWhYZkl5Y2JBWGtXd2hDcDhCUll1TmhGRU9kMjJjVU0wdGdN?=
 =?utf-8?B?MmNIYnN6aGRSb3VtS3VXSVNWYU94SktWMWZ3QUFmTkNWTnlFREFiNDVZajl2?=
 =?utf-8?B?NUpEdHpqM1YvdUpzVUlTQ0MwVk5mMmVrSEpYczBsbGNXZGlBTkRjU2F5VHZ4?=
 =?utf-8?B?TFk2M21sZk9GNkRDVzBQRzRxOGdGSVoxclJEamF6cWUrTGxRMVFiUExreUI3?=
 =?utf-8?B?R2p3S3hWV3l6ck41QUtXdkZUN2orMTZlU0hldHRxQlgrOFZubTBiKzBoTGhj?=
 =?utf-8?B?RFBwWnVRbTBPZkliT3pzS2hJd0FMaStiS3lmQmxXczBaWDFrT2tOTUpYNDNw?=
 =?utf-8?B?NnpwWWIwTW05WHIvVW1uR1MxTU1KYVVld1l2dGMrOEZqL2U3QndhUW1xZm9p?=
 =?utf-8?B?cURYc09QK3RLNUhBL2RnS2tUZmkwRjdGQ2gvWlgxY2l3a0RuWStwSWk2M0Jh?=
 =?utf-8?B?ZzlBTm8yTGhPMDY2OU95YWU5YllidXF0QUFwemk4dVVDQm15YnhzZk9jSjdJ?=
 =?utf-8?B?YTd1UW5UMFZnbXhCYk0zOXFqdHlYcjFzMW9NUXBvWS9aQ1ltRCtORXQrdnhD?=
 =?utf-8?B?VWVzSk9ndFhmRXZCOEdGR3FjajdidkdKaUppbzBTeVl2V00xbWJoei9KNVc4?=
 =?utf-8?B?YWc2MHAzVDdSTitQaEdEeVk0U0VqOFAwaEJqZmhENzJOTEh4Yy93alRIRmdz?=
 =?utf-8?B?RFhYS1FyMUY4bmNYQnlGTXY0VFpXNFE1dWtIK1hBdmw5Z3FwSFZSZkdvaEly?=
 =?utf-8?B?dHVzaGhxYjhpbDV4bEIyRURPRUNBWmxSSTh4VTRlQ3B3NjkzSlZTWDM5bUpa?=
 =?utf-8?B?ZWxTWUdPeGlRM3VYc0JkVGF3S09MbWdqSkRpU21lZVJlbTJpV2FsYzkyaFBv?=
 =?utf-8?B?VE4zVGdQUmFVRjVJRzNES2FQNS9QVFZDNlZWSEQzd3BxcUhVQmRIMENPSDRo?=
 =?utf-8?B?Ym1QbE9JK2tqMCtLWDAwVXUyMWdwMy8vWmh0OEhpNG1mN1I1Z2xWRlNkeGE3?=
 =?utf-8?B?L3VSRmxGQlZTcXM0aFg3MHFBaS94Q0NyQThsa0EvZjlFeTZaSWxiczJmV1Vl?=
 =?utf-8?B?ZnRZTUdQTUp4Qit2T3FyZVVXallZRnE4MVd3T1owOGF6d3ljYW12UFJhY1lr?=
 =?utf-8?Q?Ow3gLI7x2PJEGzZ0m1wEd/VsL?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3B40755C5FB1E040B2904A6C7011FD24@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: microchip.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6451.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 834af01b-c77e-445d-34b7-08dccb28d229
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2024 08:25:36.4656 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VKA6ilQPH10NvwFSP6+shDrK0caUAd6/k8Xkn2YmFQEkiUJZJZpQqI4zFLZr5PeK3SZn/sntDwknHmq+we3qqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4832
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

SGkgQ2xhdWRpdSwNCg0KT24gMDIvMDkvMjQgMTo0OCBwbSwgY2xhdWRpdSBiZXpuZWEgd3JvdGU6
DQo+IEVYVEVSTkFMIEVNQUlMOiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50
cyB1bmxlc3MgeW91IGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZQ0KPiANCj4gT24gMDIuMDkuMjAy
NCAwNzozOSwgRGhhcm1hLkJAbWljcm9jaGlwLmNvbSB3cm90ZToNCj4+IE9uIDI3LzA4LzI0IDk6
NDIgcG0sIENsYXVkaXUgQmV6bmVhIHdyb3RlOg0KPj4+IEVYVEVSTkFMIEVNQUlMOiBEbyBub3Qg
Y2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91IGtub3cgdGhlIGNvbnRl
bnQgaXMgc2FmZQ0KPj4+DQo+Pj4gSW4gY2FzZSBwbV9ydW50aW1lX2dldF9zeW5jKCkgZmFpbHMg
dGhlIGNsb2NrIHJlbWFpbnMgZW5hYmxlZC4gRGlzYWJsZQ0KPj4+IGl0IHRvIHNhdmUgcG93ZXIg
b24gdGhpcyBmYWlsdXJlIHNjZW5hcmlvLg0KPj4+DQo+Pj4gRml4ZXM6IDE3OWIwNzY5ZmM1ZiAo
ImRybS9icmlkZ2U6IGFkZCBsdmRzIGNvbnRyb2xsZXIgc3VwcG9ydCBmb3Igc2FtOXg3IikNCj4+
PiBTaWduZWQtb2ZmLWJ5OiBDbGF1ZGl1IEJlem5lYSA8Y2xhdWRpdS5iZXpuZWFAdHV4b24uZGV2
Pg0KPj4gUmV2aWV3ZWQtYW5kLXRlc3RlZC1ieTogRGhhcm1hIEJhbGFzdWJpcmFtYW5pIDxkaGFy
bWEuYkBtaWNyb2NoaXAuY29tPg0KPiANCj4gVGhpcyB0YWcgaXMgbm90IHZhbGlkLCBBRkFJSy4g
WW91IHNob3VsZCB1c2UgMiBkaWZmZXJlbnQgdGFnczogUmV2aWV3ZWQtYnksDQo+IFRlc3RlZC1i
eQ0KT2theSwgSSBkb24ndCBrbm93IGhvdyB0aGVzZSBnb3QgaW4NCg0KbGludXgkIGdpdCBsb2cg
fCBncmVwIFJldmlld2VkLWFuZC10ZXN0ZWQtYnkNCiAgICAgUmV2aWV3ZWQtYW5kLXRlc3RlZC1i
eTogSmlhZG9uZyBaaHUgPEppYWRvbmcuWmh1QGFtZC5jb20+DQogICAgIFJldmlld2VkLWFuZC10
ZXN0ZWQtYnk6IEppYWRvbmcgWmh1IDxKaWFkb25nLlpodUBhbWQuY29tPg0KICAgICBSZXZpZXdl
ZC1hbmQtdGVzdGVkLWJ5OiBSYWdoYXZlbmRyYSBLIFQgPHJhZ2hhdmVuZHJhLmt0QGFtZC5jb20+
DQogICAgIFJldmlld2VkLWFuZC10ZXN0ZWQtYnk6IEsgUHJhdGVlayBOYXlhayA8a3ByYXRlZWsu
bmF5YWtAYW1kLmNvbT4NCiAgICAgUmV2aWV3ZWQtYW5kLXRlc3RlZC1ieTogQXRoaXJhIFJhamVl
diA8YXRyYWplZXZAbGludXgudm5ldC5pYm0uY29tPg0KICAgICBSZXZpZXdlZC1hbmQtdGVzdGVk
LWJ5OiBBdGhpcmEgUmFqZWV2IDxhdHJhamVldkBsaW51eC52bmV0LmlibS5jb20+DQogICAgIFJl
dmlld2VkLWFuZC10ZXN0ZWQtYnk6IEF0aGlyYSBSYWplZXYgPGF0cmFqZWV2QGxpbnV4LnZuZXQu
aWJtLmNvbT4NCiAgICAgUmV2aWV3ZWQtYW5kLXRlc3RlZC1ieTogTWFkYWRpIFZpbmVldGggUmVk
ZHkgPHZpbmVldGhyQGxpbnV4LmlibS5jb20+DQogICAgIFJldmlld2VkLWFuZC10ZXN0ZWQtYnk6
IEphbiBLYXJjaGVyIDxqYWthQGxpbnV4LmlibS5jb20+DQogICAgIFJldmlld2VkLWFuZC10ZXN0
ZWQtYnk6IEphbiBLYXJjaGVyIDxqYWthQGxpbnV4LmlibS5jb20+DQogICAgIFJldmlld2VkLWFu
ZC10ZXN0ZWQtYnk6IEphbiBLYXJjaGVyIDxqYWthQGxpbnV4LmlibS5jb20+DQogICAgIFJldmll
d2VkLWFuZC10ZXN0ZWQtYnk6IEphbiBLYXJjaGVyIDxqYWthQGxpbnV4LmlibS5jb20+DQogICAg
IFJldmlld2VkLWFuZC10ZXN0ZWQtYnk6IEphbiBLYXJjaGVyIDxqYWthQGxpbnV4LmlibS5jb20+
DQogICAgIFJldmlld2VkLWFuZC10ZXN0ZWQtYnk6IEphbiBLYXJjaGVyIDxqYWthQGxpbnV4Lmli
bS5jb20+DQogICAgIFJldmlld2VkLWFuZC10ZXN0ZWQtYnk6IEphbiBLYXJjaGVyIDxqYWthQGxp
bnV4LmlibS5jb20+DQogICAgIFJldmlld2VkLWFuZC10ZXN0ZWQtYnk6IEphbiBLYXJjaGVyIDxq
YWthQGxpbnV4LmlibS5jb20+DQogICAgIFJldmlld2VkLWFuZC10ZXN0ZWQtYnk6IEphbiBLYXJj
aGVyIDxqYWthQGxpbnV4LmlibS5jb20+DQogICAgIFJldmlld2VkLWFuZC10ZXN0ZWQtYnk6IEph
biBLYXJjaGVyIDxqYWthQGxpbnV4LmlibS5jb20+DQogICAgIFJldmlld2VkLWFuZC10ZXN0ZWQt
Ynk6IEphbiBLYXJjaGVyIDxqYWthQGxpbnV4LmlibS5jb20+DQogICAgIFJldmlld2VkLWFuZC10
ZXN0ZWQtYnk6IENoZW4gWXUgPHl1LmMuY2hlbkBpbnRlbC5jb20+DQogICAgIFJldmlld2VkLWFu
ZC10ZXN0ZWQtYnk6IEhhaWJvIENoZW4gPGhhaWJvLmNoZW5AbnhwLmNvbT4NCiAgICAgUmV2aWV3
ZWQtYW5kLXRlc3RlZC1ieTogSmluZ2JvIFh1IDxqZWZmbGV4dUBsaW51eC5hbGliYWJhLmNvbT4N
CiAgICAgUmV2aWV3ZWQtYW5kLXRlc3RlZC1ieTogWGlvbmd3ZWkgU29uZyA8eGlvbmd3ZWkuc29u
Z0B3aW5kcml2ZXIuY29tPg0KICAgICBSZXZpZXdlZC1hbmQtdGVzdGVkLWJ5OiBYaW9uZ3dlaSBT
b25nIDx4aW9uZ3dlaS5zb25nQHdpbmRyaXZlci5jb20+DQogICAgIFJldmlld2VkLWFuZC10ZXN0
ZWQtYnk6IE1hdGhpZXUgRGVzbm95ZXJzIA0KPG1hdGhpZXUuZGVzbm95ZXJzQGVmZmljaW9zLmNv
bT4NCiAgICAgUmV2aWV3ZWQtYW5kLXRlc3RlZC1ieTogR2VsaWFuZyBUYW5nIDxnZWxpYW5nQGtl
cm5lbC5vcmc+DQogICAgIFJldmlld2VkLWFuZC10ZXN0ZWQtYnk6IEdlbGlhbmcgVGFuZyA8Z2Vs
aWFuZ0BrZXJuZWwub3JnPg0KICAgICBSZXZpZXdlZC1hbmQtdGVzdGVkLWJ5OiBEYXZpZGxvaHIg
QnVlc28gPGRhdmVAc3Rnb2xhYnMubmV0Pg0KICAgICBSZXZpZXdlZC1hbmQtdGVzdGVkLWJ5OiBK
aWFkb25nIFpodSA8SmlhZG9uZy5aaHVAYW1kLmNvbT4NCiAgICAgUmV2aWV3ZWQtYW5kLXRlc3Rl
ZC1ieTogV2VuamlhIFpoYW5nIDx3ZW5qaWFAbGludXguaWJtLmNvbT4NCiAgICAgUmV2aWV3ZWQt
YW5kLXRlc3RlZC1ieTogV2VuamlhIFpoYW5nIDx3ZW5qaWFAbGludXguaWJtLmNvbT4NCjoNCjoN
CjoNCj4gDQo+Pj4gLS0tDQo+Pj4gICAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9taWNyb2NoaXAt
bHZkcy5jIHwgMSArDQo+Pj4gICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspDQo+Pj4N
Cj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9taWNyb2NoaXAtbHZkcy5j
IGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9taWNyb2NoaXAtbHZkcy5jDQo+Pj4gaW5kZXggYjgz
MTNkYWQ2MDcyLi4wMjcyOTJhYjAxOTcgMTAwNjQ0DQo+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2JyaWRnZS9taWNyb2NoaXAtbHZkcy5jDQo+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRn
ZS9taWNyb2NoaXAtbHZkcy5jDQo+Pj4gQEAgLTEyNSw2ICsxMjUsNyBAQCBzdGF0aWMgdm9pZCBt
Y2hwX2x2ZHNfZW5hYmxlKHN0cnVjdCBkcm1fYnJpZGdlICpicmlkZ2UpDQo+Pj4NCj4+PiAgICAg
ICAgICAgcmV0ID0gcG1fcnVudGltZV9nZXRfc3luYyhsdmRzLT5kZXYpOw0KPj4+ICAgICAgICAg
ICBpZiAocmV0IDwgMCkgew0KPj4+ICsgICAgICAgICAgICAgICBjbGtfZGlzYWJsZV91bnByZXBh
cmUobHZkcy0+cGNsayk7DQo+Pj4gICAgICAgICAgICAgICAgICAgZGV2X2VycihsdmRzLT5kZXYs
ICJmYWlsZWQgdG8gZ2V0IHBtIHJ1bnRpbWU6ICVkXG4iLCByZXQpOw0KPj4+ICAgICAgICAgICAg
ICAgICAgIHJldHVybjsNCj4+PiAgICAgICAgICAgfQ0KPj4+IC0tDQo+Pj4gMi4zOS4yDQo+Pj4N
Cj4+DQo+Pg0KDQoNCi0tIA0KV2l0aCBCZXN0IFJlZ2FyZHMsDQpEaGFybWEgQi4NCg==
