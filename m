Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45DB683861B
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jan 2024 04:39:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3589610E51B;
	Tue, 23 Jan 2024 03:39:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 233A610E477
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jan 2024 03:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1705981168; x=1737517168;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=E9oYeWr0OBcAR5LNuYKjvTDRCZqAixON9yyNbzCTFjw=;
 b=V5GGivVYpzB9bP5VXTstFokFwdScvk8Cfs0hu1MmWiKY/smq5bDrbVYo
 TfXAcXhlFnk3j6ck+w4LTY7u+QoVbp61p0AqBmrHM8MIHu4+jzsqSjkGj
 nX5R2gFJgcytbguHfEVQ5Cf8g1+1Wcz8MzXkJzdSOoHet/wM9liYWr2pl
 dnEQzPeSGzQpzWQMJdZTekhw5FunzX6RH4SADSgKP9A3zlmgH2SoZrm1Z
 VPTczEjc2ZEsL51oQUa9vxntU1eUQhVvs0C1ExIEpA1uabHqEyiUMxkZe
 UtZJGM1/kxS39mzVrqRBSXB88MX7kgtJIS9WLSOEqQ2+NKVuc4MySzWc8 Q==;
X-CSE-ConnectionGUID: 3rb0q83rQJuITip8kS7vlg==
X-CSE-MsgGUID: yTDmJ15KSWmKaxve3WpiLg==
X-IronPort-AV: E=Sophos;i="6.05,213,1701154800"; d="scan'208";a="16383938"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 22 Jan 2024 20:39:27 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Jan 2024 20:39:15 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.10.215.250)
 by email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 22 Jan 2024 20:39:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OKte6C0kk2YNEOM8KAICkyp4G33BIUWtum60Mgwg20jnBAkpzUpcsz3+o4ysgj5vLlIVlsIvjFf8W/afSuJyAKWla1VMhkd97oAN1xfJ1N6/NElEjsz01tjgIrDeBR4dZZou7gXeOdl+78mhxJfSVKZjs4cDl50ECrfY+Vwe+8sIgkdcvLw/L8QTr+l4b4nADL9HRBnoX9lQMJPo7NM4janPPe6eg5h0apCCxT8dtySVv5y1R++tOflr+EZNMM06LuH64nctt1jhMSXwcT5A7w5JAigxHJ8jA9v+fvLjunBYcbPZg0Wd07cap43oN73y2J3dTcfCDf/utukJcwPwFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E9oYeWr0OBcAR5LNuYKjvTDRCZqAixON9yyNbzCTFjw=;
 b=I7CHim9gBbIr3pyBuxgwdMCmbIOUrbDFyHZQw4RmoUdheuk5mLJO1I9rog+re8knl5E+ujthSrMe+X1lAOAMczYERNarIPSrq7l+BT6noO0eVkTqbZHr0/RUHRnY+wZ+ZDloem/rC6IzkFxhfm/duVt7cd95sLi9Urp/ov/ZxYTtPweR+GmmNG4K4oLmBSpLV7H+LfmOd0NfG7+UbWpRmLaw2sH5L26a9jDWE3SUdWIXDe80hU9Ax9GTYsL83Ro2dCh9FEkhPO+e0MxvFVLb8JuIypKrTO0CmX3SphXgdUGE0ZaqGnbFq3U+GJpH5ckDcHE2528L29PX1CkemEC61g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E9oYeWr0OBcAR5LNuYKjvTDRCZqAixON9yyNbzCTFjw=;
 b=zMInzDkYDODbAO2Gnq3N7gFfxmyvc2DahB+VcsX3vDTMTmU9mZmWObzuU319VS35F6vXw8SRDtw0hItn6NNyU4KM6rGORlC5GaO5qhZ9SHXYG1ckxG9VGBWD6d363/0LqE7CEuusGd/V5oYhgLSfRPH2+PJjis6Do0HvopgbqFe9zX1J16VKZLuslHuK05a8XwheR7KSyvYNqNDzniGj0IDRoR088VFOEheOL/kawZgF8ecGOZH/rF9El0eCeTMiQNhuqSE+ubLjJVMpmgJN7A+AZMQMyYFPCp0qhYDzkWzylwBbwk0kf3UIl5uxjrKaRumSiz/lcZkmlZqr7LU7qg==
Received: from PH7PR11MB6451.namprd11.prod.outlook.com (2603:10b6:510:1f4::16)
 by SA2PR11MB4908.namprd11.prod.outlook.com (2603:10b6:806:112::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.37; Tue, 23 Jan
 2024 03:39:13 +0000
Received: from PH7PR11MB6451.namprd11.prod.outlook.com
 ([fe80::80b9:80a3:e88a:57ee]) by PH7PR11MB6451.namprd11.prod.outlook.com
 ([fe80::80b9:80a3:e88a:57ee%3]) with mapi id 15.20.7202.031; Tue, 23 Jan 2024
 03:39:13 +0000
From: <Dharma.B@microchip.com>
To: <conor@kernel.org>, <krzk@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: display: bridge: add sam9x7-lvds
 compatible
Thread-Topic: [PATCH 1/3] dt-bindings: display: bridge: add sam9x7-lvds
 compatible
Thread-Index: AQHaTQ1DHzJ2CWHeI0qiVB4kob88PbDl+48AgAAM8gCAALjbgA==
Date: Tue, 23 Jan 2024 03:39:13 +0000
Message-ID: <01c4fc05-9b3f-4007-9216-444a4306efd7@microchip.com>
References: <20240122082947.21645-1-dharma.b@microchip.com>
 <20240122082947.21645-2-dharma.b@microchip.com>
 <10a88fc6-2c4c-4f77-850f-f15b21a8ed49@kernel.org>
 <20240122-privacy-preschool-27dc7dcc5529@spud>
In-Reply-To: <20240122-privacy-preschool-27dc7dcc5529@spud>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6451:EE_|SA2PR11MB4908:EE_
x-ms-office365-filtering-correlation-id: aba9895f-7761-442c-d63e-08dc1bc4ddfb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vtjA1w0fV0ohaoHabJ2bJsp3QoPMjwjBjpsBwkFM3g+DaBlLtzfcFj89gUpTIZOji30VtmkI0gMwjxDL3buKPrDw+bq4j0mSzEfO1NSmjJvzgRSiaHL1WpvM72smd0A+GDnxl5VutgDtWePG+U2BljmVi29iSke/oKv4T4vsuUgFckG27HF/sCB8GxvmNvIuAeut/Xsn0nnA7TQXhfpXtZOCdjo8mJzVg0dBDpepoS8NTIP3LkiYdhHedOXclLS8BMmmOfwEZN9aQkBLwKKWomd+6w7xWw+IEeHYP0WEvEG83JwhAw6WQ+m4ZpdESZ6MLLE+pe63dtsZRIVyevaqltxWm0o1X2iWZB140cahOWws8+3q93HXdKC+YHLVew/fySDamNHwNIjQQUu+MNeiE22b5MmNNERYuNpEzFqtcf2J0U/r1Nz1ZdJRpm6P54/SUeDl5bMbyQOXZjQElqygEhsroDy/ISo5t8l4QrO1Ks5j5k3V2BVg3/gCCZDkcQLdILeqKSurjjIlybRn3amBgk3RreKZDt28CXc8bXjxL3PgPybJHfojS9mExEIMFmh4+7W4KWIk2OsgOtxAu/0gwneqql8RiP99XY0EV8YAWsf/XGz0KGskkWhGQ6OV6J32Xe+R/wyrQm9P/hxzI2BHqybc4pImwKnCVp+nWSmey/1iXCu8DoAVq+4JUTvaQmg6
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6451.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(366004)(39860400002)(396003)(376002)(136003)(230922051799003)(186009)(1800799012)(451199024)(64100799003)(107886003)(2616005)(26005)(71200400001)(53546011)(36756003)(6486002)(478600001)(6512007)(6506007)(41300700001)(66946007)(66476007)(66556008)(38070700009)(66446008)(54906003)(64756008)(110136005)(316002)(91956017)(76116006)(31686004)(86362001)(38100700002)(83380400001)(122000001)(31696002)(8676002)(8936002)(5660300002)(4326008)(2906002)(7416002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZXdKakthclNYVUNrd2tpZnJtaythelB1aFJQT0NVSEFOdTVEUXRwUXF1WUht?=
 =?utf-8?B?WHlyTW1mSHBUU2ZzSW5kdStXemI3SEZxUlRRRWlUa2c1NVZBRlVxT0lYdjd6?=
 =?utf-8?B?YktYR3pFRUFYRXlDWDNiclBwNWcyZnNFbWJhVjR6SWV2Mk9DSWtOZDFvTDNn?=
 =?utf-8?B?aGMwN092eEs3MWE0QU1zWjJMN0EyakV2blBIOS85dWFnanJWMXZ6MytUcFRT?=
 =?utf-8?B?cFdwVmVrMUlCbEhJRkdtTmVIZGgzYzhLeGhQKzhaa1RONDhaY29jdEpGdVoy?=
 =?utf-8?B?QzZ3amxLaG9IOVJxeWp5c0tBSGhKdmJ3UjYxb3BNa2cwa0FmY1BEeUcyR3Ir?=
 =?utf-8?B?YkNjRFI1NUQ0VlJUQVk5V3FDekFvMDVnd0lXK0Yvek56RUc1R3BqZ2RnQWRV?=
 =?utf-8?B?NThlU2hxVXhqRDNqUCtLTCtuRWR4Z240cXE1T2xtSlhmV0F6MlA2WlVrZm45?=
 =?utf-8?B?b1U1QzgvTWV6WTVxYnJiMFJld09UKzBJcEpKUktQUGtjUERORUZLNFZrSkpm?=
 =?utf-8?B?R2hTOE5BTkNWdzhBN01zNGJEWk1zNzVyKzJhRWtNdVVyVDhZZ2RUVjBxbUNt?=
 =?utf-8?B?elNtNnJ6dDlOQUpVcXJ0dmg4c1RuYWM2RzNZSnhQZGxqa3pIRzBYbW1WU2Nm?=
 =?utf-8?B?eEZvNGRiWkt4SE5wVjVTL1VDSStVS29xaGNWb0V1V2U3SlpoN1hyWGlDRUxZ?=
 =?utf-8?B?L0d3dGlVMjZXQ1JMUTZYdjFoTWVVNDlpMjR2K2RNWTZ4NXI2UDk2NVVhRkpn?=
 =?utf-8?B?SmdvYzJYMitHODVHMVJydHZENTVEQUUxL0RNbXkvZUUwbGZoR2FUZnhRRk9R?=
 =?utf-8?B?RXhCNVBHNElEdmRJckROaEN3ZE1wZDdyM3Zhd09jS0FqcUJCTjJCUkY4Smd3?=
 =?utf-8?B?QjBmR0x5a2lZYTAvbExZdUV2RzRqamFzOTUwVW04NlhjT2kvaDVTakU3cEZH?=
 =?utf-8?B?anZ5aG5zQUd5UmZpaERXNHpKOC9hM2RkY0E2dzhGOXZ4cW03aTZIL3MyM2JB?=
 =?utf-8?B?dUNnL1FINWlQZlZjVVBRNjVqa0UvbGF0S0R1cmgrU0pCUVhJMCtLeXA1TjVW?=
 =?utf-8?B?NE5IcnRObUpWMm94LzQzWWxzQStIUTRvZFhlajVBNjA5K2w1eEVlN2hWWlJM?=
 =?utf-8?B?M1N2WE1nd2ZYRGIzeS9HTjF4RXZyaTdDNVdWMTBGZFNYS1JtdUhNMGFsZ1l1?=
 =?utf-8?B?ZWZ4UFJuam1DYzhvbTZyQlZOejhGQmxHakgrb2YzYmVrUlRvNUNGM3YyMXRu?=
 =?utf-8?B?cnhIblJvb3Q3WGgrVUEwNEJjaDZlWTJva0lnbmE0bytDL1ZPZEVoQWlxWFh4?=
 =?utf-8?B?NzFUNG9xWDBkT1hIOStFV2tpVHIzQ3UvSFlTSFpwQXZzNEhVWTNWN1paSzRC?=
 =?utf-8?B?eTU5K2xsZDBMNEJQai9pNU9FaTlpblJRRXVQQTJYK0didTY2M24yR3l2MU01?=
 =?utf-8?B?VWtBVkx6eE5nMkFQRCsxYUs3NVN5ODg0VXhyanI2K3NhektJdCtwK1ZtaS9z?=
 =?utf-8?B?UVlMQXJmVEd4STlsTlFkOVREVXlPWlE4bUlrZTdmRmNKWEYrZ0ZrYlhLTS9P?=
 =?utf-8?B?dlg4MGJiSzJaUE9jOTQ4UDRpUVhNaUZIUlE5THhIZXhweEF3YUxiNWpjZ3g2?=
 =?utf-8?B?cTI3cW94RWZUcVFHc0Y1d2tDMHdHZSs4bTZuU2FELzNoM0NpZ2FySG5VK3I5?=
 =?utf-8?B?aWlYWjA4Q3g3UzN1aVlkd2xobUNBWlpzVXp3MDhmTVhmYTErS2RZT1dxU2lW?=
 =?utf-8?B?bkQvVXlMWkloTjhpd2lBaWhwd3NNcmpaMGpmblhGOFNYQk4xMGVNRHQ5SjFL?=
 =?utf-8?B?VGEyNWo4bDQ1cFJCV1o4dlZMK1dpZXdXcU5tOE9PSkpBVFcwVXNPS052SXIv?=
 =?utf-8?B?d2hVeUhoR2NUbGEwcHFidjJNaE1idEJCSG1rSFY0cDA1N1FvVDNqMnd4VU5y?=
 =?utf-8?B?V1NWZWtHSWcxTitET201ME9sY2Z4NS9pTUxPNGFUZ25CZmg2dGhUS3h5VkxC?=
 =?utf-8?B?UzlOWGtZVTlGQzBXYmhtMFBHaHY1RkZHRVlmMDFvRWRaQ25FMEx5cVRDQ0tp?=
 =?utf-8?B?cUNST1FxaFp3MXRySWpmK3RyaHFaRmhHbVl1VWYyVS9PeVZOTEUrZkpKR1Nj?=
 =?utf-8?Q?Q2Nvj2TvdDj4lPk1FHKICVnYk?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EED389B3D8F8EB4AA1B5CB7CE82A7D5A@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6451.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aba9895f-7761-442c-d63e-08dc1bc4ddfb
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2024 03:39:13.1501 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: x6wXGkDjvNZnarvNUBC5ojEGlC3Rtn9t+Gpqj9mMRnLdMR2tTCxDlc7tNfUxVpt4D/P1C8JYUi5lJkfR3IIYZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4908
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
Cc: Manikandan.M@microchip.com, neil.armstrong@linaro.org, conor+dt@kernel.org,
 rfoss@kernel.org, daniel@ffwll.ch, krzysztof.kozlowski+dt@linaro.org,
 jonas@kwiboo.se, tzimmermann@suse.de, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, jernej.skrabec@gmail.com, mripard@kernel.org,
 devicetree@vger.kernel.org, robh+dt@kernel.org,
 Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com,
 Linux4Microchip@microchip.com, airlied@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQ29ub3IsDQoNCk9uIDIyLzAxLzI0IDEwOjA3IHBtLCBDb25vciBEb29sZXkgd3JvdGU6DQo+
IE9uIE1vbiwgSmFuIDIyLCAyMDI0IGF0IDA0OjUxOjE2UE0gKzAxMDAsIEtyenlzenRvZiBLb3ps
b3dza2kgd3JvdGU6DQo+PiBPbiAyMi8wMS8yMDI0IDA5OjI5LCBEaGFybWEgQmFsYXN1YmlyYW1h
bmkgd3JvdGU6DQo+Pj4gQWRkIHRoZSAnc2FtOXg3LWx2ZHMnIGNvbXBhdGlibGUgYmluZGluZywg
d2hpY2ggZGVzY3JpYmVzIHRoZQ0KPj4+IExvdyBWb2x0YWdlIERpZmZlcmVudGlhbCBTaWduYWxp
bmcgKExWRFMpIENvbnRyb2xsZXIgZm91bmQgb24gTWljcm9jaGlwJ3MNCj4+PiBzYW05eDcgc2Vy
aWVzIFN5c3RlbS1vbi1DaGlwIChTb0MpIGRldmljZXMuIFRoaXMgYmluZGluZyB3aWxsIGJlIHVz
ZWQgdG8NCj4+PiBkZWZpbmUgdGhlIHByb3BlcnRpZXMgYW5kIGNvbmZpZ3VyYXRpb24gZm9yIHRo
ZSBMVkRTIENvbnRyb2xsZXIgaW4gRFQuDQo+Pj4NCj4+PiBTaWduZWQtb2ZmLWJ5OiBEaGFybWEg
QmFsYXN1YmlyYW1hbmk8ZGhhcm1hLmJAbWljcm9jaGlwLmNvbT4NCj4+PiAtLS0NCj4+PiAgIC4u
Li9kaXNwbGF5L2JyaWRnZS9taWNyb2NoaXAsc2FtOXg3LWx2ZHMueWFtbCB8IDU5ICsrKysrKysr
KysrKysrKysrKysNCj4+PiAgIDEgZmlsZSBjaGFuZ2VkLCA1OSBpbnNlcnRpb25zKCspDQo+Pj4g
ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rp
c3BsYXkvYnJpZGdlL21pY3JvY2hpcCxzYW05eDctbHZkcy55YW1sDQo+Pj4NCj4+PiBkaWZmIC0t
Z2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL21p
Y3JvY2hpcCxzYW05eDctbHZkcy55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2Rpc3BsYXkvYnJpZGdlL21pY3JvY2hpcCxzYW05eDctbHZkcy55YW1sDQo+Pj4gbmV3IGZp
bGUgbW9kZSAxMDA2NDQNCj4+PiBpbmRleCAwMDAwMDAwMDAwMDAuLjhjMmM1Yjg1OGM4NQ0KPj4+
IC0tLSAvZGV2L251bGwNCj4+PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvZGlzcGxheS9icmlkZ2UvbWljcm9jaGlwLHNhbTl4Ny1sdmRzLnlhbWwNCj4+PiBAQCAtMCww
ICsxLDU5IEBADQo+Pj4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4wLW9ubHkg
T1IgQlNELTItQ2xhdXNlKQ0KPj4+ICslWUFNTCAxLjINCj4+PiArLS0tDQo+Pj4gKyRpZDpodHRw
Oi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9kaXNwbGF5L2JyaWRnZS9taWNyb2NoaXAsc2FtOXg3
LWx2ZHMueWFtbCMNCj4+PiArJHNjaGVtYTpodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hl
bWFzL2NvcmUueWFtbCMNCj4+PiArDQo+Pj4gK3RpdGxlOiBNaWNyb2NoaXAgU0FNOVg3IExWRFMg
Q29udHJvbGxlcg0KPj4gV2hhdCBpcyB0aGUgIlgiPw0KPj4NCj4+PiArDQo+Pj4gK21haW50YWlu
ZXJzOg0KPj4+ICsgIC0gRGhhcm1hIEJhbGFzdWJpcmFtYW5pPGRoYXJtYS5iQG1pY3JvY2hpcC5j
b20+DQo+Pj4gKw0KPj4+ICtkZXNjcmlwdGlvbjogfA0KPj4gRG8gbm90IG5lZWQgJ3wnIHVubGVz
cyB5b3UgbmVlZCB0byBwcmVzZXJ2ZSBmb3JtYXR0aW5nLg0KPj4NCj4+PiArICBUaGUgTG93IFZv
bHRhZ2UgRGlmZmVyZW50aWFsIFNpZ25hbGluZyBDb250cm9sbGVyIChMVkRTQykgbWFuYWdlcyBk
YXRhDQo+Pj4gKyAgZm9ybWF0IGNvbnZlcnNpb24gZnJvbSB0aGUgTENEIENvbnRyb2xsZXIgaW50
ZXJuYWwgRFBJIGJ1cyB0byBPcGVuTERJDQo+Pj4gKyAgTFZEUyBvdXRwdXQgc2lnbmFscy4gTFZE
U0MgZnVuY3Rpb25zIGluY2x1ZGUgYml0IG1hcHBpbmcsIGJhbGFuY2VkIG1vZGUNCj4+PiArICBt
YW5hZ2VtZW50LCBhbmQgc2VyaWFsaXplci4NCj4+PiArDQo+Pj4gK3Byb3BlcnRpZXM6DQo+Pj4g
KyAgY29tcGF0aWJsZToNCj4+PiArICAgIGNvbnN0OiBtaWNyb2NoaXAsc2FtOXg3LWx2ZHMNCj4+
IFdoYXQgaXMgIngiPyBXaWxkY2FyZD8gVGhlbiBubywgZG9uJ3QgdXNlIGl0IGFuZCBpbnN0ZWFk
IHVzZSBwcm9wZXIgU29DDQo+PiB2ZXJzaW9uIG51bWJlci4NCj4gVGhlc2UgU29DcyBhY3R1YWxs
eSBkbyBoYXZlIGFuIHggaW4gdGhlaXIgbmFtZS4gSG93ZXZlciwgYW5kIEkgZG8gYWx3YXlzDQo+
IGdldCBjb25mdXNlZCBoZXJlLCB0aGUgc2FtOXg3IGlzIGEgc2VyaWVzIG9mIFNvQ3MgKHRoZSBj
b3ZlciBsZXR0ZXIgZG9lcw0KPiBzYXkgdGhpcykgcmF0aGVyIHRoYW4gYSBzcGVjaWZpYyBkZXZp
Y2UuDQo+IEkgdGhpbmsgdGhlIHNlcmllcyBjdXJyZW50IGNvbnNpc3RzIG9mIGEgc2FtOXg3MCBz
YW05eDcyIGFuZCBhIHNhbTl4NzUuDQo+IFRoZSBkZXZpY2VzIGFyZSBsYXJnZWx5IHNpbWlsYXIs
IGJ1dCBJIGFtIG5vdCBzdXJlIGlmIHRoZSBzYW05eDcwDQo+IHN1cHBvcnRzIExWRFMgYXQgYWxs
LiBIYXZpbmcgYSBjb21wYXRpYmxlIGZvciB0aGUgc2VyaWVzIGRvZXMgbm90IHNlZW0NCj4gY29y
cmVjdCB0byBtZS4NClllcywgeW91IGFyZSBjb3JyZWN0LiBPbmx5IHNhbTl4NzIgYW5kIHNhbTl4
NzUgaGF2ZSBMVkRTIHN1cHBvcnQsIHdoaWxlIA0Kc2FtOXg3MCBkb2VzIG5vdC4gSSB3aWxsIHJl
dmlzZSB0aGUgY29tcGF0aWJpbGl0eSB0byBpbmNsdWRlIGJvdGggDQpzYW05eDcyIGFuZCBzYW05
eDc1LCBhcyBvdXRsaW5lZCBiZWxvdzoNCg0KcHJvcGVydGllczoNCiAgIGNvbXBhdGlibGU6DQog
ICAgIGVudW06DQogICAgICAgLSBtaWNyb2NoaXAsc2FtOXg3Mi1sdmRzDQogICAgICAgLSBtaWNy
b2NoaXAsc2FtOXg3NS1sdmRzDQoNCkFkZGl0aW9uYWxseSwgSSB3aWxsIHVwZGF0ZSB0aGUgZHJp
dmVyIGFjY29yZGluZ2x5LiBUaGFuayB5b3UuDQoNCi0tIA0KV2l0aCBCZXN0IFJlZ2FyZHMsDQpE
aGFybWEgQi4NCj4gDQo+IENoZWVycywNCj4gQ29ub3IuDQoNCg0KDQo=
