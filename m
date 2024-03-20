Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8AF78808E9
	for <lists+dri-devel@lfdr.de>; Wed, 20 Mar 2024 02:12:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6A6A10E0F2;
	Wed, 20 Mar 2024 01:12:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="uF/ekZzm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3B9610E0F2
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Mar 2024 01:12:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WSBcWzON0QVV2slaJazXuC3r5JYa00/WzP91/PeYQS4ZAXCsOMQJwsXMK8t29UFEUsjXA5ZmHqKjxWk0m3ZQOyHENm3BNFjtdn0glOvLg+XFdy+X3TvIF9sPbEP9PrMOfCkRC1FqqRUO0Dq4BAZ0/P3hMrsltI6HGe3SWsxe74340QfCFV+EyJD9HKlOZxvQJusF5wcsU9OC0VJ+hHayXunc7G8eU+JbtMJsA8DXtnbjmdvRAmWJVPn2ERdbT4RbfA9lB1wWz60Rg6TLuvqW5E0mrwNttXfFk8E0n9y0EIJ5sIYF07JNdH+qp/+IkWoPSA1ULiBAfWyFQy+MTUdhsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3INKwrvqPS5AXE2IkWWhl0NY/yW6FTVgzVyyN7O+nfs=;
 b=clv3ZpXB1/WtP15UmnO5YkQwXms59F1omr4PssThgUs07994r+bBt4S5+6SRGzCOFQ2E8evGf8aioqEH6M7MKpgQ/zCJmJfV/sxAgpdLrq5KNqluXMauf5WVAdZV3ZkmsIPLUVr/4rTU1TrIZoAbGXaHWMHOxPUFB/J3jjJYtkfkWz+Sb4HPFLrvsbWFeFkG+6CzwO77Of5HrRgcN09ZVIbyzThR1OK3bg5ys6Khgdwh37zPFf/D2HmUMXGVvn+Tx5EeZavhvhsF3e2rXExwNn0RrU0YjZhUwNEvhCGVWPUYrKQ6UpkOCzLZ5Cx2Zw/hSv9OdauS68YMviTwIja1Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3INKwrvqPS5AXE2IkWWhl0NY/yW6FTVgzVyyN7O+nfs=;
 b=uF/ekZzmtuIaDO27t2R7AQ/foUdPkpci0Aa8wv27zNpnMyD5PvrJFkPp6JhesaaXvzYEgY5gwT5aVwBO3KzPJf/9TmT8OFXBPVYV153REhTlJeejB+i3125O6igjRR7wZxcOVwueCTSzV4+YE/NtS5ot6BWmh/dW1nutCFpgYoU=
Received: from MW4PR12MB7165.namprd12.prod.outlook.com (2603:10b6:303:21b::14)
 by DM4PR12MB6397.namprd12.prod.outlook.com (2603:10b6:8:b4::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.27; Wed, 20 Mar
 2024 01:12:30 +0000
Received: from MW4PR12MB7165.namprd12.prod.outlook.com
 ([fe80::e039:187d:47be:afb7]) by MW4PR12MB7165.namprd12.prod.outlook.com
 ([fe80::e039:187d:47be:afb7%4]) with mapi id 15.20.7386.025; Wed, 20 Mar 2024
 01:12:30 +0000
From: "Klymenko, Anatoliy" <Anatoliy.Klymenko@amd.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, "Simek, Michal"
 <michal.simek@amd.com>, Andrzej Hajda <andrzej.hajda@intel.com>, Neil
 Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Jonas
 Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>
Subject: RE: [PATCH v2 4/8] drm: xlnx: zynqmp_dpsub: Minimize usage of global
 flag
Thread-Topic: [PATCH v2 4/8] drm: xlnx: zynqmp_dpsub: Minimize usage of global
 flag
Thread-Index: AQHadOEg5WMMnpZ5rUalQ/DFgYK70LE+Op+AgAGe9PA=
Date: Wed, 20 Mar 2024 01:12:30 +0000
Message-ID: <MW4PR12MB716563FD80387F0FDC4F146AE6332@MW4PR12MB7165.namprd12.prod.outlook.com>
References: <20240312-dp-live-fmt-v2-0-a9c35dc5c50d@amd.com>
 <20240312-dp-live-fmt-v2-4-a9c35dc5c50d@amd.com>
 <20240319001255.GV13682@pendragon.ideasonboard.com>
In-Reply-To: <20240319001255.GV13682@pendragon.ideasonboard.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR12MB7165:EE_|DM4PR12MB6397:EE_
x-ms-office365-filtering-correlation-id: 83336f38-eeb7-4f8e-fd10-08dc487ad0f2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 13hD2xZqmKhW9KyCeOiB4WW2ejahKt/jq5DrgqSaIjzipYVk+9d4rtfCC0hS0kWED53kghpehwGR0S1orLIrEJRUr536CVDiDNkXLhrZqLBSCD9miBjTVeexQ1FxSL9JVqXeb64caXxDcVnLdynElamFkPRuggB9siwzRjgDqRQ+eHz8NsJFRQ017K62OHU9anFEB62MJ7JqEDP/dx/JSbdZx3J74XP0zspxU9avWaWNaZEcqbOABAyKhOkop9WPukUb/LKDimQeffUjvMW2aNpm9cI2Y89S4iGM5Xy4rg4VdXYTq3HaPqcvKBlTB8k4nvUov7hUwPYWNwkT5WlkI9SVjVCHXkKQvatVMamPJ5u2a5OHLgYSGr8fHMCKOEBxXd6YiA2yvv3NeVEHmNcGBozoc74fUy2guUNzAZbW850fzzP+lWv/JNVmvTuNaRT0KisKEgDTl5ygYiFGy+xmkUHHJIO5x1cHpRrcz45uF6YnOrJMEn4MqkbvIV+6xbzPtuuVzf2fSVn0BSiHDQEYwvjrPFTXGM3qSyc/McvbATL/YzQ0NvHwYUSuTm5f4l4OstZvYVDsIpDUpfyC4PvAMqFjluheHtRtW/QaHhvgNBwrtXkOGGqK+fEw8IffogR3PQEvRLgZFGMD1u2z44cIESnwlvUa0QCmGjBoKNIRygPYS9v/G0sEQMF/gY9xY2mMi0Z3lakMDHXG5XSpTqkTPw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR12MB7165.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(7416005)(366007)(38070700009); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RXZGd2hnVlhTTUdGd0lFQnR3QW1IcW5XZ0U0VE9tdTJUWTFCUm1DVmgxS0xG?=
 =?utf-8?B?a0tJWGFSV2xtZjZGRkM4RExsTVhZVzN4VjNzV0NRclZ0SGtvN3dqNkovc3Zm?=
 =?utf-8?B?MkVwRDdQUDZPSzJnbXZIRno5aGkzL2MwZWxiUzhNUXIwazZqSVJTL1c0TmM4?=
 =?utf-8?B?bEZuVi9hSkxrY3pUKzZNQStaZk5ZRkEwZ2dSQkg5UlhRZm5Gd3kvbjMrMVpB?=
 =?utf-8?B?VEFxdDFUd3QrQXpoY1ZTYWV4RUNuYUlISHVtQUZ1YlJ0ZFIrd1YwdzAvM0Jq?=
 =?utf-8?B?NnZxQ1lLZXZkc0ZXb3pTblJFdFJzRE9DWGlobWo2emFSWmFlOUpIN0F0dDRt?=
 =?utf-8?B?NmxLeUFiVXFGNjVXM0lTT2k1eUF2elFnNE9mbFM4LytEZzdjY0tFYUltVkVX?=
 =?utf-8?B?ems1SDY0YnZncDRhcmRnS1RzMEhLMW9xY29CUDZFSTFkZE9lWXY3R2pLaGVq?=
 =?utf-8?B?T2w5YnZVVDVqcEpaRnhYUXJtbkx6RVVrd1BET3g0MEkxaXZzRkZQUllSck9p?=
 =?utf-8?B?TW02WDBVcndyODFaRDBwWDB3dWhpc20xbURIVWl5c1VTUWhNZWhweGg2R0ly?=
 =?utf-8?B?RDI3TDQyVlhoQU5NdWpxVDZ1L0lRSWNMT0szS0tHdUhNb0NSZ2NSOUFGZmtZ?=
 =?utf-8?B?S2Y0WGwxcEEyUWQzTVEvYk44bTFrOVRuWHhoTlQ1TTBLcFZRYmJ5NkdQWFRm?=
 =?utf-8?B?dm80M0UxYXBEWlFVbVIrenVmcURMNlNZb2FkL25kTDJoLzlraW85UUdlOURj?=
 =?utf-8?B?ZFB2aFlheERJNXdsQXpTcm9QU3lraFpLbEd6dmgwVXZXVlRobnhSUnZLaEw5?=
 =?utf-8?B?YmFzNWhGTlVVKzFadVpzbndYR2JPZGJMKzhabktzbVFxd0IyVGdNMkREU2lR?=
 =?utf-8?B?bk1mcHVrTnR4RnIxaCsyQVhUc1BNTUE2MUNuczk3clZiYThpenJnZkZMTE40?=
 =?utf-8?B?a3N3aHJnRzNhQzQzQm1WV3NkVUczUmppQTJCTElsT0liaDcvNG9KNmg5TDZV?=
 =?utf-8?B?aWpXUXJqZTcyQTBWVEZUVzczV2kyc1krY011QXRqclVwcUpmR3A1ei9KTW9y?=
 =?utf-8?B?YkFhQkpQc0Y4aDRuUHdmWFRzNEI4SXlTV0dKSWU2emdvY0F1QTY4Z1I2aUhl?=
 =?utf-8?B?alkrOU5YSm4wYmVpM2dCMG1VWHgrNnFJZ0FtZDhsWTBraUpSQ0tia2NiZkdE?=
 =?utf-8?B?VGRDMy9uSTUzcThuODhycW5keTBQYkJNakU1Yitta2F3UlgzUlV4VGxMS3RF?=
 =?utf-8?B?MDlzWmV2NGV3WHlOYnZUeVpvVE5TMEo5WFVuNk5sSHFTLzM2NXZncHduZndx?=
 =?utf-8?B?WWlKOTF6UGlqanhGalMwT1pwNUFVQ0MzejJZcGhOcWFZYmh2RnY4dWN2WWdj?=
 =?utf-8?B?R01yVmtVK21WeGlLM012dlNHV2EybUUvN3lhWWhKbStvNkZUdGUzZnBDZGor?=
 =?utf-8?B?SXNTa3cxK3dRNlBwTTVxS3RhaVNuS2M2M2gwTW1hTlFjU2RTRVVTbTkrRndF?=
 =?utf-8?B?SHdxeDVPSlA4YWRzdzlNRzRLeVBUeXpBTzhrdFlZVDNvcDJhRDhPN2JKbnZR?=
 =?utf-8?B?WXUvNDhLU2xiektza2EzYUtnSmY2dityZW9HRUExckppT1BhazFEMUxOanFX?=
 =?utf-8?B?TGtVaTJvVFhFY2RWbUJtUlRjbzVsMUxUV1J6WnVmVUZQZnJHclVubzJJb0pr?=
 =?utf-8?B?MU42VVlRR2ROaFZ2NjhmYS9MUkRVTDRCZ0ZnOTRLVVBxV3FhdXl0TkUwcVRG?=
 =?utf-8?B?NXdxVEtKV3NSdE5aeXh5QmNSdVRuTlRvck8rRWxFWTN5eGkzSHNrQjhrelhj?=
 =?utf-8?B?RTQ2TEdxTjFITS9pTFJhZ3ZlbVlXVkNOUFpqVU8wNmxYZmdZd0lYYm9oVER2?=
 =?utf-8?B?cTdEdHJpOHpLQ3pUNXppempOQmhaVkdCYkgwbmsvN1FXU1Rwd0d2MHpzYUhx?=
 =?utf-8?B?SUR4Qi8wd1hJY3dNRVVHRTVvT3QwajBqeTA4L1hNV3M3VzdCOXFxblcvMDhM?=
 =?utf-8?B?eWcxWFNJQTZNS0lwakQ1ZENkY2pmVytOMXp2My9iNVljejk0QzBHdkQ1c1lB?=
 =?utf-8?B?WEh3V2d1OEJldmFZbGlwZVE4U3RzQnYvVUErb0Z2b3dQZWtxVjZqRnlvRXBH?=
 =?utf-8?Q?YvLY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB7165.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83336f38-eeb7-4f8e-fd10-08dc487ad0f2
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Mar 2024 01:12:30.8369 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iD67rUwvXEiE3ri0CmOHON4dHblA1+cDi4ufMDvpdprdZAgHUxw/wFYVkBXh/q77ZCXJsPqFbdLaT7ZmIpBtBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6397
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

SGkgTGF1cmVudCwNCg0KVGhhbmsgeW91IGZvciB0aGUgcmV2aWV3Lg0KDQo+IC0tLS0tT3JpZ2lu
YWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hh
cnRAaWRlYXNvbmJvYXJkLmNvbT4NCj4gU2VudDogTW9uZGF5LCBNYXJjaCAxOCwgMjAyNCA1OjEz
IFBNDQo+IFRvOiBLbHltZW5rbywgQW5hdG9saXkgPEFuYXRvbGl5LktseW1lbmtvQGFtZC5jb20+
DQo+IENjOiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwu
Y29tPjsgTWF4aW1lIFJpcGFyZA0KPiA8bXJpcGFyZEBrZXJuZWwub3JnPjsgVGhvbWFzIFppbW1l
cm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+OyBEYXZpZA0KPiBBaXJsaWUgPGFpcmxpZWRAZ21h
aWwuY29tPjsgRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPjsgU2ltZWssIE1pY2hhbA0K
PiA8bWljaGFsLnNpbWVrQGFtZC5jb20+OyBBbmRyemVqIEhhamRhIDxhbmRyemVqLmhhamRhQGlu
dGVsLmNvbT47IE5laWwNCj4gQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPjsg
Um9iZXJ0IEZvc3MgPHJmb3NzQGtlcm5lbC5vcmc+OyBKb25hcw0KPiBLYXJsbWFuIDxqb25hc0Br
d2lib28uc2U+OyBKZXJuZWogU2tyYWJlYyA8amVybmVqLnNrcmFiZWNAZ21haWwuY29tPjsgUm9i
DQo+IEhlcnJpbmcgPHJvYmgrZHRAa2VybmVsLm9yZz47IEtyenlzenRvZiBLb3psb3dza2kNCj4g
PGtyenlzenRvZi5rb3psb3dza2krZHRAbGluYXJvLm9yZz47IENvbm9yIERvb2xleSA8Y29ub3Ir
ZHRAa2VybmVsLm9yZz47DQo+IE1hdXJvIENhcnZhbGhvIENoZWhhYiA8bWNoZWhhYkBrZXJuZWwu
b3JnPjsgZHJpLQ0KPiBkZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGxpbnV4LWFybS1rZXJu
ZWxAbGlzdHMuaW5mcmFkZWFkLm9yZzsgbGludXgtDQo+IGtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7
IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnOyBsaW51eC0NCj4gbWVkaWFAdmdlci5rZXJuZWwu
b3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjIgNC84XSBkcm06IHhsbng6IHp5bnFtcF9kcHN1
YjogTWluaW1pemUgdXNhZ2Ugb2YgZ2xvYmFsDQo+IGZsYWcNCj4gDQo+IENhdXRpb246IFRoaXMg
bWVzc2FnZSBvcmlnaW5hdGVkIGZyb20gYW4gRXh0ZXJuYWwgU291cmNlLiBVc2UgcHJvcGVyIGNh
dXRpb24NCj4gd2hlbiBvcGVuaW5nIGF0dGFjaG1lbnRzLCBjbGlja2luZyBsaW5rcywgb3IgcmVz
cG9uZGluZy4NCj4gDQo+IA0KPiBIaSBBbmF0b2xpeSwNCj4gDQo+IFRoYW5rIHlvdSBmb3IgdGhl
IHBhdGNoLg0KPiANCj4gT24gVHVlLCBNYXIgMTIsIDIwMjQgYXQgMDU6NTU6MDFQTSAtMDcwMCwg
QW5hdG9saXkgS2x5bWVua28gd3JvdGU6DQo+ID4gQXZvaWQgdXNhZ2Ugb2YgZ2xvYmFsIHp5bnFt
cF9kcHN1Yi5kbWFfZW5hYmxlZCBmbGFnIGluIERQU1VCIGxheWVyDQo+ID4gY29udGV4dC4gVGhp
cyBmbGFnIHNpZ25hbHMgd2hldGhlciB0aGUgZHJpdmVyIHJ1bnMgaW4gRFJNIENSVEMgb3IgRFJN
DQo+ID4gYnJpZGdlIG1vZGUsIGFzc3VtaW5nIHRoYXQgYWxsIGRpc3BsYXkgbGF5ZXJzIHNoYXJl
IHRoZSBzYW1lIGxpdmUgb3INCj4gPiBub24tbGl2ZSBtb2RlIG9mIG9wZXJhdGlvbi4gVXNpbmcg
cGVyLWxheWVyIG1vZGUgaW5zdGVhZCBvZiBnbG9iYWwNCj4gPiBmbGFnIHdpbGwgc2lwbGlmeSBm
dXR1cmUgc3VwcG9ydCBvZiB0aGUgaHlicmlkIHNjZW5hcmlvLg0KPiANCj4gcy9zaXBsaWZ5L3Np
bXBsaWZ5Lw0KPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBBbmF0b2xpeSBLbHltZW5rbyA8YW5hdG9s
aXkua2x5bWVua29AYW1kLmNvbT4NCj4gPiAtLS0NCj4gPiAgZHJpdmVycy9ncHUvZHJtL3hsbngv
enlucW1wX2Rpc3AuYyB8IDExICsrKystLS0tLS0tDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA0IGlu
c2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL3hsbngvenlucW1wX2Rpc3AuYw0KPiA+IGIvZHJpdmVycy9ncHUvZHJtL3hsbngv
enlucW1wX2Rpc3AuYw0KPiA+IGluZGV4IGFmODUxMTkwZjQ0Ny4uZGQ0OGZhNjBmYTlhIDEwMDY0
NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94bG54L3p5bnFtcF9kaXNwLmMNCj4gPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0veGxueC96eW5xbXBfZGlzcC5jDQo+ID4gQEAgLTk3NSw3ICs5NzUs
NyBAQCB2b2lkIHp5bnFtcF9kaXNwX2xheWVyX2Rpc2FibGUoc3RydWN0DQo+ID4genlucW1wX2Rp
c3BfbGF5ZXIgKmxheWVyKSAgew0KPiA+ICAgICAgIHVuc2lnbmVkIGludCBpOw0KPiA+DQo+ID4g
LSAgICAgaWYgKGxheWVyLT5kaXNwLT5kcHN1Yi0+ZG1hX2VuYWJsZWQpIHsNCj4gPiArICAgICBp
ZiAobGF5ZXItPm1vZGUgPT0gWllOUU1QX0RQU1VCX0xBWUVSX05PTkxJVkUpIHsNCj4gPiAgICAg
ICAgICAgICAgIGZvciAoaSA9IDA7IGkgPCBsYXllci0+ZHJtX2ZtdC0+bnVtX3BsYW5lczsgaSsr
KQ0KPiA+ICAgICAgICAgICAgICAgICAgICAgICBkbWFlbmdpbmVfdGVybWluYXRlX3N5bmMobGF5
ZXItPmRtYXNbaV0uY2hhbik7DQo+ID4gICAgICAgfQ0KPiA+IEBAIC0xMDAxLDcgKzEwMDEsNyBA
QCB2b2lkIHp5bnFtcF9kaXNwX2xheWVyX3NldF9mb3JtYXQoc3RydWN0DQo+ID4genlucW1wX2Rp
c3BfbGF5ZXIgKmxheWVyLA0KPiA+DQo+ID4gICAgICAgenlucW1wX2Rpc3BfYXZidWZfc2V0X2Zv
cm1hdChsYXllci0+ZGlzcCwgbGF5ZXIsDQo+ID4gbGF5ZXItPmRpc3BfZm10KTsNCj4gPg0KPiA+
IC0gICAgIGlmICghbGF5ZXItPmRpc3AtPmRwc3ViLT5kbWFfZW5hYmxlZCkNCj4gPiArICAgICBp
ZiAobGF5ZXItPm1vZGUgPT0gWllOUU1QX0RQU1VCX0xBWUVSX0xJVkUpDQo+ID4gICAgICAgICAg
ICAgICByZXR1cm47DQo+ID4NCj4gPiAgICAgICAvKg0KPiA+IEBAIC0xMDM5LDcgKzEwMzksNyBA
QCBpbnQgenlucW1wX2Rpc3BfbGF5ZXJfdXBkYXRlKHN0cnVjdA0KPiB6eW5xbXBfZGlzcF9sYXll
ciAqbGF5ZXIsDQo+ID4gICAgICAgY29uc3Qgc3RydWN0IGRybV9mb3JtYXRfaW5mbyAqaW5mbyA9
IGxheWVyLT5kcm1fZm10Ow0KPiA+ICAgICAgIHVuc2lnbmVkIGludCBpOw0KPiA+DQo+ID4gLSAg
ICAgaWYgKCFsYXllci0+ZGlzcC0+ZHBzdWItPmRtYV9lbmFibGVkKQ0KPiA+ICsgICAgIGlmIChs
YXllci0+bW9kZSA9PSBaWU5RTVBfRFBTVUJfTEFZRVJfTElWRSkNCj4gPiAgICAgICAgICAgICAg
IHJldHVybiAwOw0KPiANCj4gVGhlIGFib3ZlIGNoYW5nZXMgbG9vayBuaWNlLg0KPiANCj4gPg0K
PiA+ICAgICAgIGZvciAoaSA9IDA7IGkgPCBpbmZvLT5udW1fcGxhbmVzOyBpKyspIHsgQEAgLTEw
ODksNyArMTA4OSw3IEBADQo+ID4gc3RhdGljIHZvaWQgenlucW1wX2Rpc3BfbGF5ZXJfcmVsZWFz
ZV9kbWEoc3RydWN0IHp5bnFtcF9kaXNwICpkaXNwLCAgew0KPiA+ICAgICAgIHVuc2lnbmVkIGlu
dCBpOw0KPiA+DQo+ID4gLSAgICAgaWYgKCFsYXllci0+aW5mbyB8fCAhZGlzcC0+ZHBzdWItPmRt
YV9lbmFibGVkKQ0KPiA+ICsgICAgIGlmICghbGF5ZXItPmluZm8pDQo+IA0KPiBUaGlzLCBob3dl
dmVyLCBkb2Vzbid0IHNlZW0gcmlnaHQsIGFzIHRoaXMgZnVuY3Rpb24gaXMgY2FsbGVkIHVuY29u
ZGl0aW9uYWxseSBmcm9tDQo+IHRoZSByZW1vdmUgcGF0aC4gVGhlIGNoYW5nZSBiZWxvdyBzZWVt
cyB3ZWlyZCB0b28uDQo+IElmIEknbSBtaXNzaW5nIHNvbWV0aGluZywgaXQgc2hvdWxkIGF0IGxl
YXN0IGJlIGV4cGxhaW5lZCBpbiB0aGUgY29tbWl0IG1lc3NhZ2UuDQo+IA0KDQpBY3R1YWxseSwg
dGhpcyB3aG9sZSBjb25kaXRpb24gc2hvdWxkIGJlIHJlbW92ZWQsIGFzIG5vdyB3ZSdyZSBzZXR0
aW5nIGxheWVyLmluZm8gZm9yIGFsbCB0eXBlcyBvZiBsYXllcnMuIE9uIHRvcCBvZiB0aGF0LCB3
ZSdyZSBzZXR0aW5nIHRoZSBudW1iZXIgb2YgRE1BIGNoYW5uZWxzIHRvIHplcm8gZm9yIHRoZSBs
aXZlIGxheWVycywgd2hpY2ggaW4gdHVybiBwcmV2ZW50cyBhbnkgRE1BIGNoYW5uZWwgaW5pdGlh
bGl6YXRpb24gb3IgcmVsZWFzZS4gWW91IGFyZSByaWdodCAtIHRoYXQgcHJvYmFibHkgc2hvdWxk
IGJlIG1lbnRpb25lZCBleHBsaWNpdGx5IGluIHRoZSBjb21taXQgbWVzc2FnZS4gSSdsbCB1cGRh
dGUgaXQuDQoNCj4gPiAgICAgICAgICAgICAgIHJldHVybjsNCj4gPg0KPiA+ICAgICAgIGZvciAo
aSA9IDA7IGkgPCBsYXllci0+aW5mby0+bnVtX2NoYW5uZWxzOyBpKyspIHsgQEAgLTExMzIsOQ0K
PiA+ICsxMTMyLDYgQEAgc3RhdGljIGludCB6eW5xbXBfZGlzcF9sYXllcl9yZXF1ZXN0X2RtYShz
dHJ1Y3QgenlucW1wX2Rpc3ANCj4gKmRpc3AsDQo+ID4gICAgICAgdW5zaWduZWQgaW50IGk7DQo+
ID4gICAgICAgaW50IHJldDsNCj4gPg0KPiA+IC0gICAgIGlmICghZGlzcC0+ZHBzdWItPmRtYV9l
bmFibGVkKQ0KPiA+IC0gICAgICAgICAgICAgcmV0dXJuIDA7DQo+ID4gLQ0KPiA+ICAgICAgIGZv
ciAoaSA9IDA7IGkgPCBsYXllci0+aW5mby0+bnVtX2NoYW5uZWxzOyBpKyspIHsNCj4gPiAgICAg
ICAgICAgICAgIHN0cnVjdCB6eW5xbXBfZGlzcF9sYXllcl9kbWEgKmRtYSA9ICZsYXllci0+ZG1h
c1tpXTsNCj4gPiAgICAgICAgICAgICAgIGNoYXIgZG1hX2NoYW5uZWxfbmFtZVsxNl07DQo+ID4N
Cj4gDQo+IC0tDQo+IFJlZ2FyZHMsDQo+IA0KPiBMYXVyZW50IFBpbmNoYXJ0DQoNClRoYW5rIHlv
dSwNCkFuYXRvbGl5DQo=
