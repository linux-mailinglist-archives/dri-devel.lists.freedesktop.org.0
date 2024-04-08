Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1428189CB95
	for <lists+dri-devel@lfdr.de>; Mon,  8 Apr 2024 20:18:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2889A10F5E8;
	Mon,  8 Apr 2024 18:18:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="GOtVqapb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2136.outbound.protection.outlook.com [40.107.223.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3372110F5E8
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Apr 2024 18:18:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O8Qz5L/U1Oge/yNuKGofUjlVzPYq7D+1ip4n5EeNtVgHNr8W+BtP5WIc+2WV90wxbPjCP0ngLAv7j/sZn7PyiX3Bq1vQjlcCJ6Dd7hpPSalT45RlCJ4NdRlSKi4rmuvEISey+QG8QWalH2QWeED66vRJzc++p9ClTj2eWQrf//HVCqZGku9j1zvDAw/+neu/ktjJD2aTMIVFa50Ta5mQaX9wHWmq/P+oqFA4SxzHQ/d/6bLEWK+c7zdid39sLqutuIAPKc0EuA0n7BduACgUagTC5d0P6+hujVY1RCHpF1kPjRsDA/6r5MnMEy9XgMGVkLZkRITXS+9/0PpKxbsbcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oh1NLSFBXykVDEfxtMp3ZidvTjvHmcS8fbTWl+Kd7Vs=;
 b=l0bWB/spSCDACUSg7LPvAZcUNXkuAr88Cj/tyDLWBSif+qttgTdTsszT8HAn8qe4pU76FLNaTH+bEmnzOKwdI6VhR53Fu/DDDlh1WRKyjMEkYrj2sNj4NcV4mpa1AjA6aZWTXeAAY7/e4uVVdyblhqzIiZC1bkprKPe4FjUa1SEvDeaQWllZ6zmf8tIVVuONtrRwPhSuTj+ecUnXJaJpqvfmOQ1S5YqVq3ErX1d8DWnkN7zRSzYDeNP64JnWp/fqO/qvvhfSNPlh13lFYetahaNVu+SX82dpejeoE2LCYVsWXB/9wAJVWHM8xAtFO5GuolZ6nLMYqvYfsitbLM2FAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oh1NLSFBXykVDEfxtMp3ZidvTjvHmcS8fbTWl+Kd7Vs=;
 b=GOtVqapbuOR1P4Vg1FjWo5MpFU1fZGbLrzFggS1dXfGliqeKC43UMB6GU4d/jtIlQh4hcW8Mep5HQo8xDeioSFZmrfGBNRkNGy6PoyCjIuuvQkNmIwZgdIjeFBcNIIpb0667q96E3/RtC88ONKawI8lgAR+LjZIGZ3hI3wpe7l4=
Received: from MW4PR12MB7165.namprd12.prod.outlook.com (2603:10b6:303:21b::14)
 by MW6PR12MB8708.namprd12.prod.outlook.com (2603:10b6:303:242::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.54; Mon, 8 Apr
 2024 18:17:57 +0000
Received: from MW4PR12MB7165.namprd12.prod.outlook.com
 ([fe80::e039:187d:47be:afb7]) by MW4PR12MB7165.namprd12.prod.outlook.com
 ([fe80::e039:187d:47be:afb7%4]) with mapi id 15.20.7409.053; Mon, 8 Apr 2024
 18:17:55 +0000
From: "Klymenko, Anatoliy" <Anatoliy.Klymenko@amd.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, "Simek, Michal" <michal.simek@amd.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: RE: [PATCH v3 2/9] drm: xlnx: zynqmp_dpsub: Update live format defines
Thread-Topic: [PATCH v3 2/9] drm: xlnx: zynqmp_dpsub: Update live format
 defines
Thread-Index: AQHae9CJ6zQ5MJ8e8k+X6TIyYLIpurFZrMaAgAUdieA=
Date: Mon, 8 Apr 2024 18:17:55 +0000
Message-ID: <MW4PR12MB716562E3C140C5D6BF0EBFFEE6002@MW4PR12MB7165.namprd12.prod.outlook.com>
References: <20240321-dp-live-fmt-v3-0-d5090d796b7e@amd.com>
 <20240321-dp-live-fmt-v3-2-d5090d796b7e@amd.com>
 <e79ca193-0452-47ab-bbdf-56d7c52130a3@ideasonboard.com>
In-Reply-To: <e79ca193-0452-47ab-bbdf-56d7c52130a3@ideasonboard.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR12MB7165:EE_|MW6PR12MB8708:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: o0G7aX/wycge2fM/7oKykWXmVQxlvIP7wNH0l3mSy385LVze2QezIV2xRgDAM5GKy5yUaAH1FguOsw0jYtpqBPLNAdHcXZ0O4MQRRLYGDr8vYIyDGEwFaNVMGtAtJdSibk8x2Do8yDF7C/A7P9SELE12lK32giexlktldAQrSpaM77u9fX1HkGXbyEgg+VVeLmamgmZpQRvuBGrQT/z49/1geWredxYiXxre28SSaBOIteNV0nREGPrQyXxcBKfzW12x3/AL1AuYLq6Aqq2CkXAUBOTPb6j/DM3IftXOkf8ewRKZdGqYA3i8sTgMI5XywEKMoesgX36EqKUxDUU1jj5snu9KPNrOvckR1BieDu7/JcevYzkOIrwLRveSjJJ3B3fsWZQhisFpikqZJmmnkJRH8nTHByLkeaO0VD2V2TJsgu4x0ds6IGb9xvh1fCYAjBMdc7WCMH00wYUt0x0ZaKyfQEybg17AtaERDcTDx+3iJTiwgF6rGkSiFgYrjSUWLmwcDzg190PQbWZlJEoBs/d1XtJ0GYDmg4qYhXXDtcm8Oo2RIqFoB1oBelIrbjOd3o4bOhSIQIJjaaPFxe+blK9vbkhWzu9HFpTFY7PuZQjQzOuA7WaS4ED7ERQKyOd27+VktkvWlzRtfUEpg35pFKJOkDQ96yPZBz1dOwjrDBw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR12MB7165.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(7416005)(376005); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OFN2OWhjdWdGb1VLK2JSd0UzUDBpNk9oaGlGU3owSXZDMzlWeGxlZWQ5S0Jy?=
 =?utf-8?B?MnpZYlMzYVhYeVFKd1VFOFBaSVNhbUc0MkhLTVRPbUNZZlB0TnN0Uzc4YytK?=
 =?utf-8?B?Z2YxRW9JOUxiaWphbCtTZHlDcG5VQnpKNTFabFlWRFRKN3ZFMVBXcnJkMEVq?=
 =?utf-8?B?b01la3hEaTFZdk51ZmhsOHViOGh5UXQ0Rit2ZE9takUvM0xXTkw4cTJwa0gy?=
 =?utf-8?B?M1haNjVBZDE5ODRsVHE1L0kwSDhUdjJnM2hBRzNSZXR1NTN1R3RtRjMwT3JN?=
 =?utf-8?B?eENtNDhNSzZDd3ZkQmxCMUVoZTA0N0xiN0ZzQkhJR20waGZkVGYzRUNXd0Q2?=
 =?utf-8?B?WGswaXhwcXB2dzBHb0xPcEpmMGN3M1F0WitHemlubGRiYkdEaWhFajIyODkr?=
 =?utf-8?B?M3dONEZVeVZJYlh0RHZkUjhTVEhlRDBVR3cxT2drSWJyZjMvTVVxUE9pT1NJ?=
 =?utf-8?B?bzRhcTUvcmhoMWM5YVA4QjBzY2lJaE95b1BTNzR1RXJZNm1vZmIrTjdBaFFR?=
 =?utf-8?B?UWxuSjBmNUVsMG5IVzNSYmR5YlZrSExESFc1T1lwakJkR3FXVDRnNUFDTmxW?=
 =?utf-8?B?SjhIVGZVOXM0R2dPQUF6SlhaYThsMmVKOGtFTzVKekttTmdMQTRjZE85TU5p?=
 =?utf-8?B?M3VCNmJPQkQ0eHo1SGR2NnNOUXRCd3h0RTFJemxKS3piTU5CQWRXTUN1cjZt?=
 =?utf-8?B?ZG5TRjJHRmZjMkovczJOOGR3RjU2dWhzS1NqbW5qbGtiUlVmWGNIREVTQ3NH?=
 =?utf-8?B?ektNaEZKZERYN3hKeDVFbmNVTStXVElSNjMvTVNLTVZ1SmlIaFdnMVJKUGNa?=
 =?utf-8?B?a241U0lTWTVncGY4Ni9VMGVIbEluanltNWF4SUJtakZMVjhReit5UnRUYStR?=
 =?utf-8?B?OEM2MUNWdWJIRDRWd2dCMWpCanY2cktxa1ZKYzQ0YXlucmhxTnBxbmFFeE5U?=
 =?utf-8?B?eGRLVWFrNThRSm8weWp0ejFET0RnYUYwMWxmYTFtWGpLZkdDSE5Oa2tpeVNx?=
 =?utf-8?B?YTdMZ3BKanJsTlZBWEN5bGJEQmxDaGkyM1dNVmYzdHc1ZG9MZHh1bGl3REp3?=
 =?utf-8?B?VVJnSHBzVUhabXNKRVBkbExoUUhRU3pJRytKLzRObmswZ3Roa1R6ZmhzdkI1?=
 =?utf-8?B?NnpZVUdvS0hDY1AvQmFaNXh0dC9SeHBFNnd0VkRQbU5oazhjOGpSem9kcmc3?=
 =?utf-8?B?eEdDa0NxbVFkRlp4REVXL2w5MmtDK0RqYkU5eG9qeWZyaVdNcCtuVmFUL3hL?=
 =?utf-8?B?TGZCMHBrYWo5T1hMM0ovY1FqeDBaeFQ4dXJjcGEyWVlUU1VydEVKMUVzNEd3?=
 =?utf-8?B?VUJYM3NSR1UrMUVvekUvZWNLaUY1Q2dOWXBJcW8razRzVnVuSDNQMzQxVWZL?=
 =?utf-8?B?cUxYdUxWRmswVlRUeHI4MUFobkJyczdNQTd1d0MxUE5YMUczZ1ZXbWlyNGgx?=
 =?utf-8?B?Q1g3ZlFCSmZQNnk3RktiWmNIeHVXenZMRVd4VzE3bnhCRzl5SUEzVGtWZUhu?=
 =?utf-8?B?TVU3UytOdU8rYm9hL2dZaXpnVmU0OG1ueTBsUUlYcHpxU0I0RzdIL1oyRlMr?=
 =?utf-8?B?dTBiSHlYeTZubUF2Z1k1TGpHRk5uamZTcnRmK1NMdjEvU1ZUeitXREtodXFn?=
 =?utf-8?B?S1AvUTNtOVU2QWVaTExwRE5GWHRic2d3bXcwODFqS3JIWEMwM1NsUnJCVk9U?=
 =?utf-8?B?UStWeDVwa3VvQjZpUEE3SkJjUyttS2czWTNzMDNRZWNiYUhrUUZkaldWM1kv?=
 =?utf-8?B?Zjh5UWwwOEpxMUg2eGZjOVVtMnB2Umt4TWJ6KzgwZnFDMmFtcVpkU1FDeDgr?=
 =?utf-8?B?TzBvbjRmVVdHR2ZpdkxMWGpqVnF4REFVZ3o4NmpockNGK2JRVEpBS0ZXbmVj?=
 =?utf-8?B?ZE5MUTJLaFU0Vnh3WjJsM2hScGJoazJldU5LMzFRa2FSSmJuTG5jTS9rbmkx?=
 =?utf-8?B?OUtUWW9ieFNLb21memYrWjQ3VUE4TXNMdVF1dGk0NGdwWktUejRGY2s5MTdh?=
 =?utf-8?B?MjZHbXYwQmpScGJKQVV1Ujk3UzdkUHNpZHlTOUptUUFzaFc1cjhWOVEzS0o0?=
 =?utf-8?B?RjdSd21DOXc2UjZsNjZPUDBYSGFLdWhPc0ZlVm1sdy9mRjIxS3V4WTl6cndB?=
 =?utf-8?Q?YdWo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB7165.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47f7d85d-8d5f-468d-78b1-08dc57f83644
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Apr 2024 18:17:55.3185 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DTIOxDTYxDgcunOd7MZmGiLoQeh6jJQbu2SvjWgdPOkcMUPYpjvMUwhLu/pKb389yf4P93G9TgJT9g6yA87rsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8708
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogVG9taSBWYWxrZWluZW4g
PHRvbWkudmFsa2VpbmVuQGlkZWFzb25ib2FyZC5jb20+DQo+IFNlbnQ6IEZyaWRheSwgQXByaWwg
NSwgMjAyNCA1OjEwIEFNDQo+IFRvOiBLbHltZW5rbywgQW5hdG9saXkgPEFuYXRvbGl5LktseW1l
bmtvQGFtZC5jb20+DQo+IENjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBsaW51
eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmc7DQo+IGxpbnV4LWtlcm5lbEB2Z2VyLmtl
cm5lbC5vcmc7IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnOyBsaW51eC0NCj4gbWVkaWFAdmdl
ci5rZXJuZWwub3JnOyBMYXVyZW50IFBpbmNoYXJ0DQo+IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFz
b25ib2FyZC5jb20+OyBNYWFydGVuIExhbmtob3JzdA0KPiA8bWFhcnRlbi5sYW5raG9yc3RAbGlu
dXguaW50ZWwuY29tPjsgTWF4aW1lIFJpcGFyZA0KPiA8bXJpcGFyZEBrZXJuZWwub3JnPjsgVGhv
bWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+Ow0KPiBEYXZpZCBBaXJsaWUgPGFp
cmxpZWRAZ21haWwuY29tPjsgRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPjsNCj4gU2lt
ZWssIE1pY2hhbCA8bWljaGFsLnNpbWVrQGFtZC5jb20+OyBBbmRyemVqIEhhamRhDQo+IDxhbmRy
emVqLmhhamRhQGludGVsLmNvbT47IE5laWwgQXJtc3Ryb25nDQo+IDxuZWlsLmFybXN0cm9uZ0Bs
aW5hcm8ub3JnPjsgUm9iZXJ0IEZvc3MgPHJmb3NzQGtlcm5lbC5vcmc+OyBKb25hcw0KPiBLYXJs
bWFuIDxqb25hc0Brd2lib28uc2U+OyBKZXJuZWogU2tyYWJlYw0KPiA8amVybmVqLnNrcmFiZWNA
Z21haWwuY29tPjsgUm9iIEhlcnJpbmcgPHJvYmgrZHRAa2VybmVsLm9yZz47DQo+IEtyenlzenRv
ZiBLb3psb3dza2kgPGtyenlzenRvZi5rb3psb3dza2krZHRAbGluYXJvLm9yZz47IENvbm9yIERv
b2xleQ0KPiA8Y29ub3IrZHRAa2VybmVsLm9yZz47IE1hdXJvIENhcnZhbGhvIENoZWhhYg0KPiA8
bWNoZWhhYkBrZXJuZWwub3JnPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYzIDIvOV0gZHJtOiB4
bG54OiB6eW5xbXBfZHBzdWI6IFVwZGF0ZSBsaXZlIGZvcm1hdA0KPiBkZWZpbmVzDQo+IA0KPiBD
YXV0aW9uOiBUaGlzIG1lc3NhZ2Ugb3JpZ2luYXRlZCBmcm9tIGFuIEV4dGVybmFsIFNvdXJjZS4g
VXNlIHByb3Blcg0KPiBjYXV0aW9uIHdoZW4gb3BlbmluZyBhdHRhY2htZW50cywgY2xpY2tpbmcg
bGlua3MsIG9yIHJlc3BvbmRpbmcuDQo+IA0KPiANCj4gT24gMjEvMDMvMjAyNCAyMjo0MywgQW5h
dG9saXkgS2x5bWVua28gd3JvdGU6DQo+ID4gVXBkYXRlIGxpdmUgZm9ybWF0IGRlZmluZXMgdG8g
bWF0Y2ggRFBTVUIgQVZfQlVGX0xJVkVfVklEX0NPTkZJRw0KPiByZWdpc3Rlcg0KPiA+IGxheW91
dC4NCj4gDQo+IEkgdGhpbmsgdGhpcyBkZXNjcmlwdGlvbiBuZWVkcyBhIGJpdCBtb3JlLiBNZW50
aW9uIHRoYXQgdGhlIGRlZmluZXMgYXJlDQo+IG5vdCBjdXJyZW50bHkgdXNlZCwgIHNvIHdlIGNh
biBjaGFuZ2UgdGhlbSBsaWtlIHRoaXMgd2l0aG91dCBhbnkgb3RoZXINCj4gY2hhbmdlLg0KPiAN
Cg0KTWFrZXMgc2Vuc2UuIEknbGwgdXBkYXRlIHRoaXMuDQoNCj4gICBUb21pDQo+IA0KPiA+IFJl
dmlld2VkLWJ5OiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2Fy
ZC5jb20+DQo+ID4gU2lnbmVkLW9mZi1ieTogQW5hdG9saXkgS2x5bWVua28gPGFuYXRvbGl5Lmts
eW1lbmtvQGFtZC5jb20+DQo+ID4gLS0tDQo+ID4gICBkcml2ZXJzL2dwdS9kcm0veGxueC96eW5x
bXBfZGlzcF9yZWdzLmggfCA4ICsrKystLS0tDQo+ID4gICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNl
cnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS94bG54L3p5bnFtcF9kaXNwX3JlZ3MuaA0KPiBiL2RyaXZlcnMvZ3B1L2RybS94bG54
L3p5bnFtcF9kaXNwX3JlZ3MuaA0KPiA+IGluZGV4IGY5MmEwMDZkNTA3MC4uZmEzOTM1Mzg0ODM0
IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94bG54L3p5bnFtcF9kaXNwX3JlZ3Mu
aA0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94bG54L3p5bnFtcF9kaXNwX3JlZ3MuaA0KPiA+
IEBAIC0xNjUsMTAgKzE2NSwxMCBAQA0KPiA+ICAgI2RlZmluZSBaWU5RTVBfRElTUF9BVl9CVUZf
TElWRV9DT05GSUdfQlBDXzEwICAgICAgICAgICAgICAgMHgyDQo+ID4gICAjZGVmaW5lIFpZTlFN
UF9ESVNQX0FWX0JVRl9MSVZFX0NPTkZJR19CUENfMTIgICAgICAgICAgICAgICAweDMNCj4gPiAg
ICNkZWZpbmUgWllOUU1QX0RJU1BfQVZfQlVGX0xJVkVfQ09ORklHX0JQQ19NQVNLDQo+IEdFTk1B
U0soMiwgMCkNCj4gPiAtI2RlZmluZSBaWU5RTVBfRElTUF9BVl9CVUZfTElWRV9DT05GSUdfRk1U
X1JHQiAgICAgICAgICAgICAgIDB4MA0KPiA+IC0jZGVmaW5lIFpZTlFNUF9ESVNQX0FWX0JVRl9M
SVZFX0NPTkZJR19GTVRfWVVWNDQ0ICAgIDB4MQ0KPiA+IC0jZGVmaW5lIFpZTlFNUF9ESVNQX0FW
X0JVRl9MSVZFX0NPTkZJR19GTVRfWVVWNDIyICAgIDB4Mg0KPiA+IC0jZGVmaW5lIFpZTlFNUF9E
SVNQX0FWX0JVRl9MSVZFX0NPTkZJR19GTVRfWU9OTFkgICAgIDB4Mw0KPiA+ICsjZGVmaW5lIFpZ
TlFNUF9ESVNQX0FWX0JVRl9MSVZFX0NPTkZJR19GTVRfUkdCICAgICAgICAgICAgICAgKDB4MA0K
PiA8PCA0KQ0KPiA+ICsjZGVmaW5lIFpZTlFNUF9ESVNQX0FWX0JVRl9MSVZFX0NPTkZJR19GTVRf
WVVWNDQ0ICAgICgweDEgPDwNCj4gNCkNCj4gPiArI2RlZmluZSBaWU5RTVBfRElTUF9BVl9CVUZf
TElWRV9DT05GSUdfRk1UX1lVVjQyMiAgICAoMHgyIDw8DQo+IDQpDQo+ID4gKyNkZWZpbmUgWllO
UU1QX0RJU1BfQVZfQlVGX0xJVkVfQ09ORklHX0ZNVF9ZT05MWSAgICAgKDB4MyA8PA0KPiA0KQ0K
PiA+ICAgI2RlZmluZSBaWU5RTVBfRElTUF9BVl9CVUZfTElWRV9DT05GSUdfRk1UX01BU0sNCj4g
R0VOTUFTSyg1LCA0KQ0KPiA+ICAgI2RlZmluZSBaWU5RTVBfRElTUF9BVl9CVUZfTElWRV9DT05G
SUdfQ0JfRklSU1QgICAgICAgICAgICAgQklUKDgpDQo+ID4gICAjZGVmaW5lIFpZTlFNUF9ESVNQ
X0FWX0JVRl9QQUxFVFRFX01FTU9SWSAgICAgICAgICAgMHg0MDANCj4gPg0KDQo=
