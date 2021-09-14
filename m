Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A4040B427
	for <lists+dri-devel@lfdr.de>; Tue, 14 Sep 2021 18:06:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9155889E69;
	Tue, 14 Sep 2021 16:05:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from na01-obe.outbound.protection.outlook.com
 (mail-oln040093003012.outbound.protection.outlook.com [40.93.3.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9716089E69
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Sep 2021 16:05:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dvC2+VCe7utZYxVwlLMF8Sf0OtaWsaf7iyIIH2u3G5nMiDEdxLeSuM3/2gr2bB03VO7RwBDkPQ4vteHYpC88v7PMekNZ36o0SHfH5jnTnDQcRiDVNc95Cey7rtrLrxTCqpsGNs/QjQmuHLh1HZ5Jws8rr+kIEU6piWQVcBjXjd3qR2r7erHlDQXAFBVu+bHgR8mhiGw0RhnmxvAq7h66mqFr8mfL5zCO8DPJXPtr8nEoGH9ymaKj/aJrIZHWplNAAoALWGqWX2PVHtUlVImiZ0wcrDOkyuqgA5euiS0BPdA+OZ0JMxq9qUSPsmpSGVdGm35ZKsv2Q7tmohqW1bRtrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=HX84qpqjJs70QdJYp23DbHdrWhPipYDHDjZMvmOwvD4=;
 b=KhM48ujWgvbX+CjyhDrm480LChfZVHbSTQ7LvNiiYum4AgdMTC6KjWhz6FJ69BMZ4cOqziZAXc+uAG+VCDv0FB97sqb6WspyXpP6yTn7lir9FZiAyBxqB3nVARRG4vKIQ3mj5zv2cu0c6aMQ32mrG7C7/oBM67R2I18RW2s/Tdgon//xp0TEB8oaAQ9OqG3fCQ+q1xnB5rynTsc4rZtMTfTCYE4JJNrvNaK6ieaT8RGFv1XTkvL4DW90OXzNRgTvUNCTIx7UxQbnyTnJfTayNYy1SSU3W29NLbUKUFxoCSZ+YlvDTc392YxXHXUkFPcz1kJjm1t4cuhMoDdy2weX4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HX84qpqjJs70QdJYp23DbHdrWhPipYDHDjZMvmOwvD4=;
 b=Hyfl8lYqDzASqlPLIOR8DidogM/5Af3a8XbRJs/atgMTy3Siv+zTp/OmucIY7n/2OqG8KSzE7jSZMb6BYNamTHTxR0t9qbNLgzrjKtD1YEQriTOYI468YuBcEyOq0dPmizPaba3/7pfgOyNCEgZNnQseqYpG7CGTbd4dlBQsoto=
Received: from MN2PR21MB1295.namprd21.prod.outlook.com (2603:10b6:208:3e::25)
 by MN2PR21MB1215.namprd21.prod.outlook.com (2603:10b6:208:3a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.1; Tue, 14 Sep
 2021 16:05:48 +0000
Received: from MN2PR21MB1295.namprd21.prod.outlook.com
 ([fe80::d804:7493:8e3d:68d3]) by MN2PR21MB1295.namprd21.prod.outlook.com
 ([fe80::d804:7493:8e3d:68d3%9]) with mapi id 15.20.4478.015; Tue, 14 Sep 2021
 16:05:48 +0000
From: Haiyang Zhang <haiyangz@microsoft.com>
To: Deepak Rawat <drawat.floss@gmail.com>, Dexuan Cui <decui@microsoft.com>
CC: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Thomas
 Zimmermann <tzimmermann@suse.de>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-hyperv@vger.kernel.org"
 <linux-hyperv@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] drm/hyperv: Fix double mouse pointers
Thread-Topic: [PATCH] drm/hyperv: Fix double mouse pointers
Thread-Index: AQHXqM0C9sVFExQjI06yoxOltM89b6ujsVoAgAAAtJA=
Date: Tue, 14 Sep 2021 16:05:48 +0000
Message-ID: <MN2PR21MB1295FE82BE010DE1AF875B0ECADA9@MN2PR21MB1295.namprd21.prod.outlook.com>
References: <20210913182645.17075-1-decui@microsoft.com>
 <CAHFnvW0iX1FMTcJzQQtjHGosavSJ6-9wkRb7C0Ljv3c+BBUEXQ@mail.gmail.com>
In-Reply-To: <CAHFnvW0iX1FMTcJzQQtjHGosavSJ6-9wkRb7C0Ljv3c+BBUEXQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=50b7c76f-6b6f-4328-a37b-15d2fb918fcd;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ContentBits=0;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=true;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Method=Standard;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=Internal;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2021-09-14T16:01:50Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microsoft.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: de18f1f1-ab32-4643-6faa-08d97799849e
x-ms-traffictypediagnostic: MN2PR21MB1215:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR21MB1215FCB5184D79B451E1DFDCCADA9@MN2PR21MB1215.namprd21.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gPji2XABvRxjZHIevMTAV30mdOQU4EDvwTQ2hveSRKwpAjhsGBCW4L52+FVew4aK1cky/dO8n7EmKc4RUcxexKwyGwEY/9GQ8LRdbFV/mvkCd7i4dTMErL0KqzvsNgxR0U8akUStHQvMDBpi+tcGdrcyNrInkl/WsngDmLJ+ZPJjnbEcFZ+uuf1tubFJ0WAsCRM1DWoERCxJMtE3zmIVBJXatjbsdlvtLlzgK1u1vhNSCW1rSQbMBXP9qou9tZvyVA3yvDZdBFB+osuDDWWAnOV2Q1ug5+nKjJU1nFCKNMMTCAR+Jj9bSQxzG0CwvMKR/gLxlajyKQyKNNkNW4/1RbAH56kbPx1d9zvDFy2wV+yvmO2VvVzaJBFujRqvrvfls1YfMwSTA0uiQ63Z+uQtdZaavXHW+S+kiXw7uE0h+3jgkLrtGUvyBOwTfRLevkbwmtgPu5EBlMyQBPpM2o/pHLoN4WGYGzg7UI8yqRocjFpJB1dlJxQecVpAZ7/I45aryAbduPASL5uV/o3WTKOn4roPIuOpjmm3ZSU6oI2btRbdciqo3C6trm5mJ0sXbMLgn1KdRocTLMNb+nTDj0AO4MSsbHP8QaFLFF+gA8P7bD8GfEhfCU+rdVwz/LIxu9yGXswEUJwuC/ON1dQp1H2zceZzzAdvMGFCZnXLn8p7zHxM6nXSAt+myUdnPwLdV2cRW9unuS+FgNd6QkKmkPHmpg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR21MB1295.namprd21.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8936002)(316002)(54906003)(26005)(110136005)(7696005)(82960400001)(6506007)(83380400001)(5660300002)(4326008)(82950400001)(122000001)(38100700002)(86362001)(2906002)(55016002)(508600001)(53546011)(76116006)(8990500004)(64756008)(66446008)(52536014)(9686003)(66476007)(10290500003)(8676002)(66946007)(6636002)(71200400001)(66556008)(33656002)(186003)(38070700005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RjNmUW80YXhKYUd6OHdKWXVMVURNbm1wVGxoVDk1NzVQYlZnRGxiaVcyMmVT?=
 =?utf-8?B?dnl2ZllsdXpiK2drYjlHUDRWdVl1SnBvTmJpVkMvd1RNa1pCczdlOCt3UHhH?=
 =?utf-8?B?YjVDejM5aGNlb1d2Wm1aSFd1SDBWUEI1WFozbkQzejdhQzJjRDVLZkVPckEw?=
 =?utf-8?B?U0tGT29PY2JXYlYvRWdIU2FGSFcwUExHdlZRTytHVkhLaFU4VGErTFRONzQy?=
 =?utf-8?B?a1grbFovVTJYTmFMMklEMkVLMWpXNkNzeW94Tjg4UkZaT2JYeGk1R2FQOTNa?=
 =?utf-8?B?YXFiTDZLcURzdVh0NkdqcHB4NHBscURDSkdwYnhrZXdBM3Z4R1p1WFJtYXA3?=
 =?utf-8?B?SHNnZktKTGYwR1lWeUJqR2ZFOXZCWFJNeDF6eEZicUNNV0tpVmpVUjFySi9P?=
 =?utf-8?B?UDQvbkJsOHNJdFMvNE1GV2hXZHB0Wm5lL29CUlFjZEtVRlhZcWdLUHMyaVdr?=
 =?utf-8?B?OERXVFoyZTVDdVRLZ1JWODJEdTMzMnRXVW9LOVoxb2RLZFhQT21oeG1aQmVs?=
 =?utf-8?B?RGJIVmxDSW5kUitlS2ZmRG1vdlhqYm01cWNaODBRNDZnTGh5KytScGl1QXBL?=
 =?utf-8?B?M21oM0tvUFJkNjRuVmUyMkthV3JLbG9EVUxwbUtrOHlkQ2VKRVRjV1ZiUm9p?=
 =?utf-8?B?Nm1YQlI5QS9vUUZGZ255VGx1bkVHanh4WHBNN3U3NTFPMGhkY2ZBWHlBZjZk?=
 =?utf-8?B?cUpENUJmSFE3TS9lTjR5SzRJR2lXdEdoRGk2RkdwOWd3T25yRnJIZjN2cVA4?=
 =?utf-8?B?cXNrNnhLYndrL0hmalRhaWtYNkV2em93SDFYK1VsRGx3eDRLVUhGOEdITHNu?=
 =?utf-8?B?UG9vbUo1VW00cXNuMmlqM0twYVFwT1N2WFBaUVIySVgxd0UxZThaU2tnbGNE?=
 =?utf-8?B?Z2lnMjgyR3Jqa3dFVGlCZVZVejI5Zmd5dGpyU2M4VVVtQXdrVGdGc0lPamZm?=
 =?utf-8?B?bnNqdUdlcWF2YjhBMTNxZzkxY01uajJoMFo0TmxoSnp0a0JKSTg3MkdTeXAy?=
 =?utf-8?B?UUpzS2pOUXJmb0w2RU40eXhKU2pHYWN0c3RISE1jNEVlUzhjZDZhM0R6SFo2?=
 =?utf-8?B?eHI4WDRVbEpVRWVXcHVKUlhLUUF1OUhZYXJwQ2VUeXIyMFRSUkdtTWoxdFF6?=
 =?utf-8?B?K2U1NTVKWnR3dXlYSkxhTitTeUFaL1RpSThvYkRrQTVGRUJ0bzhhRkd1Q0xN?=
 =?utf-8?B?UXNNYmFJZWQ4ZG4reVY1SnhLY0ZKNmsxalNlSWJUY042SHJ0VTRxNGc0SHRt?=
 =?utf-8?B?RVcyd3F5TXdWeFFReVpaVW12ak1DV2p3YlF4TThhbkxRK3lCdWF1a3l1V25T?=
 =?utf-8?B?Y2tEdzVGNkIxeERuUWJEcUdFcUFTTHRCblQ2M04ySFo2THU0dFJKM2xPb1lC?=
 =?utf-8?B?dmtpSTdxNkh5cGozTFoxRE5tektzc05UK0RVVnY1cTQzOUNrWW9KVk9TY2xG?=
 =?utf-8?B?Ui9sbzl1VnZoa09ybkxnV1lXZmFQNDNOdE5nZEl6UFV2RzN0ZlVUZVhHUXFr?=
 =?utf-8?B?eEFlZDdFV0VZUzMrRUpFcXZJUmpYckRxUzBrQWsrS0dTZlpCRi8zU1BKcFA5?=
 =?utf-8?B?Ni9kdmdGOHhRV3FnZXlSbHNlMitiY1dxUFZxd0RWS1V2OThUTGowcnpYOGVh?=
 =?utf-8?B?Snc2Q0FLbk1vQmlLNHVxeTIvWERPamZGODNsZHJzZmFQTjlqNkNuTytQUU9j?=
 =?utf-8?B?WWdFZlpPUjFad1AxZXFoUFdaMi9zeFp5WjVoeVZmZ1Y0czc3YzdmcWdsZ0Qv?=
 =?utf-8?Q?kCUP8gMS8FYkczrCX0YWwAn+T88F1XDvDj/HXNu?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR21MB1295.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de18f1f1-ab32-4643-6faa-08d97799849e
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Sep 2021 16:05:48.6674 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Rr4s6RzF2RyKtjke2zY6EhYsaY8P6mx86jpnQwZ6jVPW/cdH9+vP+qFEUBCCqsapqRvvSJsXxjji4s7VLSKazw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR21MB1215
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogRGVlcGFrIFJhd2F0IDxk
cmF3YXQuZmxvc3NAZ21haWwuY29tPg0KPiBTZW50OiBUdWVzZGF5LCBTZXB0ZW1iZXIgMTQsIDIw
MjEgMTE6NTkgQU0NCj4gVG86IERleHVhbiBDdWkgPGRlY3VpQG1pY3Jvc29mdC5jb20+DQo+IENj
OiBIYWl5YW5nIFpoYW5nIDxoYWl5YW5nekBtaWNyb3NvZnQuY29tPjsgRGF2aWQgQWlybGllDQo+
IDxhaXJsaWVkQGxpbnV4LmllPjsgRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPjsgVGhv
bWFzIFppbW1lcm1hbm4NCj4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+OyBkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnOyBsaW51eC0NCj4gaHlwZXJ2QHZnZXIua2VybmVsLm9yZzsgbGludXgt
a2VybmVsQHZnZXIua2VybmVsLm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENIXSBkcm0vaHlwZXJ2
OiBGaXggZG91YmxlIG1vdXNlIHBvaW50ZXJzDQo+IA0KPiBUaGFua3MgRGV4dWFuLCBmb3IgdGhl
IHBhdGNoLiBBIG1pbm9yIGNvbW1lbnQgYmVsb3cuDQo+IA0KPiBPbiBNb24sIFNlcCAxMywgMjAy
MSBhdCAxMToyNyBBTSBEZXh1YW4gQ3VpIDxkZWN1aUBtaWNyb3NvZnQuY29tPiB3cm90ZToNCj4g
Pg0KPiA+IEl0IGxvb2tzIGxpa2UgSHlwZXItViBzdXBwb3J0cyBhIGhhcmR3YXJlIGN1cnNvciBm
ZWF0dXJlLiBJdCBpcyBub3QNCj4gdXNlZA0KPiA+IGJ5IExpbnV4IFZNLCBidXQgdGhlIEh5cGVy
LVYgaG9zdCBzdGlsbCBkcmF3cyBhIHBvaW50IGFzIGFuIGV4dHJhDQo+IG1vdXNlDQo+ID4gcG9p
bnRlciwgd2hpY2ggaXMgdW53YW50ZWQsIGVzcGVjaWFsbHkgd2hlbiBYb3JnIGlzIHJ1bm5pbmcu
DQo+ID4NCj4gPiBUaGUgaHlwZXJ2X2ZiIGRyaXZlciB1c2VzIHN5bnRodmlkX3NlbmRfcHRyKCkg
dG8gaGlkZSB0aGUgdW53YW50ZWQNCj4gcG9pbnRlci4NCj4gPiBXaGVuIHRoZSBoeXBlcnZfZHJt
IGRyaXZlciB3YXMgZGV2ZWxvcGVkLCB0aGUgZnVuY3Rpb24NCj4gc3ludGh2aWRfc2VuZF9wdHIo
KQ0KPiA+IHdhcyBub3QgY29waWVkIGZyb20gdGhlIGh5cGVydl9mYiBkcml2ZXIuIEZpeCB0aGUg
aXNzdWUgYnkgYWRkaW5nIHRoZQ0KPiA+IGZ1bmN0aW9uIGludG8gaHlwZXJ2X2RybS4NCj4gPg0K
PiA+IEZpeGVzOiA3NmM1NmE1YWZmZWIgKCJkcm0vaHlwZXJ2OiBBZGQgRFJNIGRyaXZlciBmb3Ig
aHlwZXJ2IHN5bnRoZXRpYw0KPiB2aWRlbyBkZXZpY2UiKQ0KPiA+IFNpZ25lZC1vZmYtYnk6IERl
eHVhbiBDdWkgPGRlY3VpQG1pY3Jvc29mdC5jb20+DQo+ID4gQ2M6IERlZXBhayBSYXdhdCA8ZHJh
d2F0LmZsb3NzQGdtYWlsLmNvbT4NCj4gPiBDYzogSGFpeWFuZyBaaGFuZyA8aGFpeWFuZ3pAbWlj
cm9zb2Z0LmNvbT4NCj4gPiAtLS0NCj4gPiAgZHJpdmVycy9ncHUvZHJtL2h5cGVydi9oeXBlcnZf
ZHJtLmggICAgICAgICB8ICAxICsNCj4gPiAgZHJpdmVycy9ncHUvZHJtL2h5cGVydi9oeXBlcnZf
ZHJtX21vZGVzZXQuYyB8ICAxICsNCj4gPiAgZHJpdmVycy9ncHUvZHJtL2h5cGVydi9oeXBlcnZf
ZHJtX3Byb3RvLmMgICB8IDM5DQo+ICsrKysrKysrKysrKysrKysrKysrLQ0KPiA+ICAzIGZpbGVz
IGNoYW5nZWQsIDQwIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gPg0KPiA+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaHlwZXJ2L2h5cGVydl9kcm0uaA0KPiBiL2RyaXZlcnMv
Z3B1L2RybS9oeXBlcnYvaHlwZXJ2X2RybS5oDQo+ID4gaW5kZXggODg2YWRkNGY5Y2QwLi4yN2Jm
ZDI3YzA1YmUgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2h5cGVydi9oeXBlcnZf
ZHJtLmgNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaHlwZXJ2L2h5cGVydl9kcm0uaA0KPiA+
IEBAIC00Niw2ICs0Niw3IEBAIGludCBoeXBlcnZfbW9kZV9jb25maWdfaW5pdChzdHJ1Y3QgaHlw
ZXJ2X2RybV9kZXZpY2UNCj4gKmh2KTsNCj4gPiAgaW50IGh5cGVydl91cGRhdGVfdnJhbV9sb2Nh
dGlvbihzdHJ1Y3QgaHZfZGV2aWNlICpoZGV2LCBwaHlzX2FkZHJfdA0KPiB2cmFtX3BwKTsNCj4g
PiAgaW50IGh5cGVydl91cGRhdGVfc2l0dWF0aW9uKHN0cnVjdCBodl9kZXZpY2UgKmhkZXYsIHU4
IGFjdGl2ZSwgdTMyDQo+IGJwcCwNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdTMy
IHcsIHUzMiBoLCB1MzIgcGl0Y2gpOw0KPiA+ICtpbnQgaHlwZXJ2X3NlbmRfcHRyKHN0cnVjdCBo
dl9kZXZpY2UgKmhkZXYpOw0KPiA+ICBpbnQgaHlwZXJ2X3VwZGF0ZV9kaXJ0KHN0cnVjdCBodl9k
ZXZpY2UgKmhkZXYsIHN0cnVjdCBkcm1fcmVjdCAqcmVjdCk7DQo+ID4gIGludCBoeXBlcnZfY29u
bmVjdF92c3Aoc3RydWN0IGh2X2RldmljZSAqaGRldik7DQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2h5cGVydi9oeXBlcnZfZHJtX21vZGVzZXQuYw0KPiBiL2RyaXZlcnMv
Z3B1L2RybS9oeXBlcnYvaHlwZXJ2X2RybV9tb2Rlc2V0LmMNCj4gPiBpbmRleCAzYWFlZTQ3MzBl
YzYuLmUyMWM4MmNmMzMyNiAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaHlwZXJ2
L2h5cGVydl9kcm1fbW9kZXNldC5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2h5cGVydi9o
eXBlcnZfZHJtX21vZGVzZXQuYw0KPiA+IEBAIC0xMDEsNiArMTAxLDcgQEAgc3RhdGljIHZvaWQg
aHlwZXJ2X3BpcGVfZW5hYmxlKHN0cnVjdA0KPiBkcm1fc2ltcGxlX2Rpc3BsYXlfcGlwZSAqcGlw
ZSwNCj4gPiAgICAgICAgIHN0cnVjdCBoeXBlcnZfZHJtX2RldmljZSAqaHYgPSB0b19odihwaXBl
LT5jcnRjLmRldik7DQo+ID4gICAgICAgICBzdHJ1Y3QgZHJtX3NoYWRvd19wbGFuZV9zdGF0ZSAq
c2hhZG93X3BsYW5lX3N0YXRlID0NCj4gdG9fZHJtX3NoYWRvd19wbGFuZV9zdGF0ZShwbGFuZV9z
dGF0ZSk7DQo+ID4NCj4gPiArICAgICAgIGh5cGVydl9zZW5kX3B0cihodi0+aGRldik7DQo+ID4g
ICAgICAgICBoeXBlcnZfdXBkYXRlX3NpdHVhdGlvbihodi0+aGRldiwgMSwgIGh2LT5zY3JlZW5f
ZGVwdGgsDQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjcnRjX3N0YXRlLT5t
b2RlLmhkaXNwbGF5LA0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY3J0Y19z
dGF0ZS0+bW9kZS52ZGlzcGxheSwNCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2h5
cGVydi9oeXBlcnZfZHJtX3Byb3RvLmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0vaHlwZXJ2L2h5cGVy
dl9kcm1fcHJvdG8uYw0KPiA+IGluZGV4IDZkNGJkY2NmYmQxYS4uMWVhN2EwNDMyMzIwIDEwMDY0
NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9oeXBlcnYvaHlwZXJ2X2RybV9wcm90by5jDQo+
ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2h5cGVydi9oeXBlcnZfZHJtX3Byb3RvLmMNCj4gPiBA
QCAtMjk5LDYgKzI5OSw0MCBAQCBpbnQgaHlwZXJ2X3VwZGF0ZV9zaXR1YXRpb24oc3RydWN0IGh2
X2RldmljZQ0KPiAqaGRldiwgdTggYWN0aXZlLCB1MzIgYnBwLA0KPiA+ICAgICAgICAgcmV0dXJu
IDA7DQo+ID4gIH0NCj4gPg0KPiA+ICsvKiBTZW5kIG1vdXNlIHBvaW50ZXIgaW5mbyB0byBob3N0
ICovDQo+ID4gK2ludCBoeXBlcnZfc2VuZF9wdHIoc3RydWN0IGh2X2RldmljZSAqaGRldikNCj4g
PiArew0KPiA+ICsgICAgICAgc3RydWN0IHN5bnRodmlkX21zZyBtc2c7DQo+ID4gKw0KPiA+ICsg
ICAgICAgbWVtc2V0KCZtc2csIDAsIHNpemVvZihzdHJ1Y3Qgc3ludGh2aWRfbXNnKSk7DQo+ID4g
KyAgICAgICBtc2cudmlkX2hkci50eXBlID0gU1lOVEhWSURfUE9JTlRFUl9QT1NJVElPTjsNCj4g
PiArICAgICAgIG1zZy52aWRfaGRyLnNpemUgPSBzaXplb2Yoc3RydWN0IHN5bnRodmlkX21zZ19o
ZHIpICsNCj4gPiArICAgICAgICAgICAgICAgc2l6ZW9mKHN0cnVjdCBzeW50aHZpZF9wb2ludGVy
X3Bvc2l0aW9uKTsNCj4gPiArICAgICAgIG1zZy5wdHJfcG9zLmlzX3Zpc2libGUgPSAxOw0KPiAN
Cj4gImlzX3Zpc2libGUiIHNob3VsZCBiZSAwIHNpbmNlIHlvdSB3YW50IHRvIGhpZGUgdGhlIHBv
aW50ZXIuIE1heWJlDQo+IGJldHRlciwgYWNjZXB0IHRoZXNlIGZyb20gdGhlIGNhbGxlci4NCg0K
SSBiZWxpZXZlIEkgdHJpZWQgaXNfdmlzaWJsZSA9IDAgZHVyaW5nIG15IGltcGxlbWVudGF0aW9u
IG9mIHRoZSBoeXBlcnZfZmIuIEl0IHN0aWxsIGhhdmUgdGhlIGhvc3QgY3Vyc29yIHZpc2libGUu
Li4gU28gSSBoYWQgdG8gc2V0IHRoZSBjdXJzb3IgY29sb3IncyBhbHBoYSB2YWx1ZSA9IDAgdG8g
bWFrZSBpdCB0cmFuc3BhcmVudC4gQnV0IHlvdSBtYXkgdHJ5IGlzX3Zpc2libGUgPSAwIGFnYWlu
Lg0KDQpUaGFua3MsDQotIEhhaXlhbmcNCg==
