Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 18CF46BA13F
	for <lists+dri-devel@lfdr.de>; Tue, 14 Mar 2023 22:13:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3334910E2A5;
	Tue, 14 Mar 2023 21:13:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY4PR02CU008-vft-obe.outbound.protection.outlook.com
 (mail-westcentralusazon11012007.outbound.protection.outlook.com
 [40.93.200.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A64810E2A5
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 21:13:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A+4jjclcWfmx/C1wfsFgrd0Kg4YJ1ct+iYF73o/OnjR92D+LiQvtzsA57FQT/Dc6JzwBBCtcMIV8LPxnhvbmPUhPHrCAoU6w5KdyWRulIVw1OEi+I48BdI6vYHkKeY5s87/UGlOPLDM8nipBq1mC0nIs9VI6aqdPVflluCgLhQ/s89Gg68PcVuIiTi6lLvsFBd8ZNMTG/cjR2OeAhDOpdVWW4x7fpP1DujecFIB2lv3nct2lC/LO58obxSf5McuOXjrk92an8ROQO7P/82g22ATFXVfdeCv4bC29bns7DqfvrfBm/cR7iCkZ3CifmQZ/eIAgIwy0s/emCSBB+07cYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Isn/6K2P2kZQNgFRxp30g63sPWxVy4i/UHx9Z1jO++k=;
 b=nO8Jg68KC3VMaF9ke2UfyGbEA5iyjV/P3W3KQF2UCSO3pDVANKGZKsQWxJgEWeoid2DxoWc7mF5GQ2gsr2JovZ9FuWWUSaL/j/UcDfY1rrcoFAJu3h/3ygzqXo5ZyKxISfp5B872SW9iuTzU3Ocd9aRF1FSibJjPfZQwG6UFisRL09IzXOfl8ta5UmXBIts/Bn3aog/NfmI8lJdaHCtmnfjZdG1z4OIaA/p6RAlV3r+y9v0k/cXuOGQrSoQfNXubbYMggA6LTAvoEp7WVzBzrpg33jr0XbYVzU6rMO+UHoJq2oEnd4SX2VwbJlDGY9xq3xY5YXpRKV0QTi37kkyG1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Isn/6K2P2kZQNgFRxp30g63sPWxVy4i/UHx9Z1jO++k=;
 b=B+UBJOd8iCUrFZtot3wC/PBFPi21CljWR2XTvOMvuNaR0IceDcq46hJEvNgQYcbwGFu4a4KB9fkHhiCpec1Ot5uym1v4lyuh972O4iSNEtzY6H8sH3kGq/eXmUvERswB2ypbvIVSoOse9gEiuZIvtNwPiK8P0ImLN/0DsACmMZ0=
Received: from CH3PR05MB10206.namprd05.prod.outlook.com
 (2603:10b6:610:155::10) by IA0PR05MB10093.namprd05.prod.outlook.com
 (2603:10b6:208:40f::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Tue, 14 Mar
 2023 21:13:24 +0000
Received: from CH3PR05MB10206.namprd05.prod.outlook.com
 ([fe80::ad2d:cb08:253b:26e7]) by CH3PR05MB10206.namprd05.prod.outlook.com
 ([fe80::ad2d:cb08:253b:26e7%8]) with mapi id 15.20.6178.026; Tue, 14 Mar 2023
 21:13:24 +0000
From: Zack Rusin <zackr@vmware.com>
To: "nathan@kernel.org" <nathan@kernel.org>
Subject: Re: [PATCH] drm/vmwgfx: Fix uninitialized use of dst_pitch in
 vmw_stdu_bo_cpu_commit()
Thread-Topic: [PATCH] drm/vmwgfx: Fix uninitialized use of dst_pitch in
 vmw_stdu_bo_cpu_commit()
Thread-Index: AQHZVosInYpUm4TdEU6v0/TVrrI/dq76xoiA
Date: Tue, 14 Mar 2023 21:13:24 +0000
Message-ID: <0d916c098eccdb28db352f7fa01cd401895c734f.camel@vmware.com>
References: <20230314-vmware-wuninitialized-v1-1-1bb4b0989758@kernel.org>
In-Reply-To: <20230314-vmware-wuninitialized-v1-1-1bb4b0989758@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.3-1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vmware.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR05MB10206:EE_|IA0PR05MB10093:EE_
x-ms-office365-filtering-correlation-id: 35eef030-34a5-48ce-2100-08db24d0f26e
x-ld-processed: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4M7kcv+Q3PIZelOLNH3dEwgMmaCdXcXPkqTmusOSSWhI9PdGvO85s9t+7Md195VLFd1S9HNol5msEDd0IvlsTVjAmNRQe/z2DUyCtjRMcSYWf+rl1dHfQfJDjyuJeQp5Kn+If89jgd4z8lX/6SjP21McZbfN8mNaHi/k6s0bKS5jaVEkTBsUgYAqTcukshA7xzOrCi6rJ6z0QXh7Wu1HUpO8DxHTYbxVt4ZljISJcwHwA9ivZ030FxVqf6JyIbpWiIwdFKHD0PV2cqLu1JXZ3Phn3msVs6L3uXRTFawpgngk6WMwZlgy0kzgOk4Dx+mPL9Fz+xfXj5S3c8Pqc2lcnVBCjee1NtU1Y1zashEP1NR5xDit9P3AJKxGS8vX9hZ6rQmIBZA0t2X/nelIDBVUVvR7zh/xQYj59rrmhTt5VHhS26hhrglBwX8A8q2TQkenhFiKkjI9YcXT0XXXvF0uXqwcul3wTOOKOc0GyR4uyFxVERorlrqQ0OuvscQ2dCdmSPG5BSg6khk0/hhuXW/7KbCJWmBULH31iwnnpd80FL7G/XQLDv8sdxr6/7DswGWgSiW12SC3Q0Kf1/TYSU+NyOtjRaEwLYS+tyZmKSuJXU7VFO+X2RpyDpJ6GStpQNuGmaI5M6UZsbkJTBoi8oiOHS60GaQFoHiPcXPk35yykjCfBY/EjltIngxtg8WwWtXzBN8BVBeMf9bW1qgqlTvhMzQqE+dE6DL97coHMaft2jGVj9fC0g+ir57iVQ5+Clgc
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR05MB10206.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(366004)(39860400002)(346002)(396003)(136003)(451199018)(5660300002)(36756003)(83380400001)(41300700001)(186003)(45080400002)(478600001)(71200400001)(26005)(6506007)(6512007)(107886003)(66446008)(2616005)(6486002)(966005)(91956017)(66476007)(8676002)(38070700005)(64756008)(66556008)(6916009)(4326008)(8936002)(76116006)(66946007)(54906003)(86362001)(38100700002)(316002)(122000001)(2906002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Nkc5OTJvZk05dVMxVnFXeU9IL3Z5UEtpd1hhQ05UZmVtbTBuM1RvcEE4Q3ov?=
 =?utf-8?B?aGpHa0d5MDVlUm8yZWtpME9lS1BQaHZGc2Z4TmJZT2ZNZUVCRDlpL0ZHQ0NK?=
 =?utf-8?B?VXA1djg3eEV3MDV2MTMvdTZHZ1p6MkEwNWNFenZPVi9EY0p1V2luVlVUMnlD?=
 =?utf-8?B?em9Xc1FtZmxqMzN5R0tVZmtZblN5MWVoUGNrVkI1clc0Z1orcGpiZlhvNDhZ?=
 =?utf-8?B?cUxYY0VSMU95ZXlUb0ZvV0dWWmRFeTlQZGREZmlscC9TSVdhVHdxZjh1M0Rs?=
 =?utf-8?B?ZlBmdHhsYkxyWUg1eUhRTWpXZlhnYjR4T2lmNHRUZHNZVE1DVDVJbHRsRTBy?=
 =?utf-8?B?V3lteDNpbE8zYWh3ZEN1aFNPcUJMRndQL0lMcDBFZXVyc3JBWWZsQlVLRE1P?=
 =?utf-8?B?NkJocUNqOFE4VXpJQTBpclZGbnRXRHkrZE9tY3JEdlRBUkY2ZGhZS01GMG9r?=
 =?utf-8?B?SFc0OEpRdFJNRDEvUWpzV2xlb2dvQjE2eExHNnJ6OE44VWNFQkg3SUc4MjYx?=
 =?utf-8?B?Ym04ZmVpNTYzMVJUYk1Ydmx2ODNJQlNXYjZjV2QvbTU1alRQVlhtMmNlUUl1?=
 =?utf-8?B?K0g3cEpHY3pacEF5YzkrU0tvdlNUdVRKU050NW80SjJDYnJ1K0xrVzBxLzND?=
 =?utf-8?B?dExjMmJOWDRGTEpyYlNwTVBKODJHVDRjMkFJc3JheWp0akErZTlmTmxCdHdW?=
 =?utf-8?B?TUN4ZnplRkI1MGg0cUtmQmFMWHdGaFNRcFlMWC9rTytYRjhGSjB1ajVDbm0v?=
 =?utf-8?B?NGtnSHBpOFlSRzUzeUtpai9tWnlGMEtzb1hEcFJVWVhYYS9oRnF6MjRpdTMv?=
 =?utf-8?B?QktaUDhlSnU2YjVEc0hPV1VXZ2FhYWNZdTBqSDlPb2k3bHZoOFVYbEN2ZUlv?=
 =?utf-8?B?RFk5NjlHbHJsSVdBQzhCMm4rWS93Skc1YXNsNThqeXVESVNkLzB6d0lmZWVE?=
 =?utf-8?B?VW94WDE5eGRWSTdyK3lCQVBibHd6MWliOVJ3c0JvcFZZZTVDbXRFSGlmMXBH?=
 =?utf-8?B?ZVBtdE5OSWpWOHc1TEdHQTBoZEQ3Y3d5SFBvMU50Z0JhbE5WWVM1N2Fxb3FX?=
 =?utf-8?B?WEY3RU00Znd3Zm5GOE5EeU9OY0x3OWVHbFZHNHlPa1pmbWRlMFFFbHFxT3BW?=
 =?utf-8?B?K0puVmdndkYvN1JrVzAzNHNjL0VXTkdLT01GdVNSdldEb2JaY2NxKyt4MGJX?=
 =?utf-8?B?bThCR2RITTltRmxUUWl3NnFENTVEcFpNNkdWeTZHNWoybDVBeDRvTlhCTUpj?=
 =?utf-8?B?UVlKOC84UXQ5Ny9Tc1d1cXIrOCtNS25sUmtEZXpsMmhhRExGL0JZZmhuMGRy?=
 =?utf-8?B?VDFBdDM2Y0tiQ0VJeGpuK3FEcmUvMU5GeGFKdkRHN3ZKcFZmMzQ0Yy9yZCtY?=
 =?utf-8?B?UC9hTGZTVjhZVnQwTDYxdkhLYlNrcHA0SjBWQVFvTWtWVG9RbWRzUTVYcmdF?=
 =?utf-8?B?V3lJMzBpNmh3eHdPMEhDa0ZHd2c3OVZKN1VFN2U4Unp3SHdzbm5Ebnl6V0ww?=
 =?utf-8?B?dXcyNnNIWElxNlhHY2FVRU5ONUV3VmgvTitDMzFMTWRQaGxVWCtodjhPSmE5?=
 =?utf-8?B?UDNwZll6ZmgwS2Z6b28vL2QzZzZZUnFSSDVMY3M5a0NISmJwV1BTVnlleE9x?=
 =?utf-8?B?SzVEZjVTRyt1cGxmd1NsYThEcERQcDhyN09RUFJGVXl4My8yQWhlTjVsWmNr?=
 =?utf-8?B?UktuR0N1RHB6dHZlbll1S2QzUFFKSy9pOHBzQlNVUlZCWFBwcHhiQ01meXY5?=
 =?utf-8?B?NG1OcWp5aEV2b0F1emV5REJrZTlyZTJLSUVtUk94a1JCWU1MSGo3bklsRWta?=
 =?utf-8?B?MnlSbHBQSTZ1NXdJS1lRR2I2TUdqZnV0UGdNK1pLdDdBRTVIZzllQW9UTVRp?=
 =?utf-8?B?YkIzYXZ5UUxRM3BJMU9lQndUQ1dLU2U5Tjc2cGpUMjQyQStqWWErWTBtTlRa?=
 =?utf-8?B?ODlXL2lWazNKRVhtYk5ORkJHOUlzRVdwcjhOL3ZtWVhha1NjUVBzMGlBOWwx?=
 =?utf-8?B?cmhZT29RRnZEU1BXUkpuWGFvWVIrd0o4c1ViNCs5TUgxd3Bvb2UxaUdHbDZs?=
 =?utf-8?B?dXZ3OFlQYy9ndXdHYTN3WUlxSkRWY0gxQy9YTDMzUEhGcE9nU1FEWnN3bDZ6?=
 =?utf-8?Q?Y4OXD6zE2bpDx53sy7bqjT20O?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DDA82AB1263AF346A5922CA6FC2B723D@namprd05.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR05MB10206.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35eef030-34a5-48ce-2100-08db24d0f26e
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Mar 2023 21:13:24.1845 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PPxyyd1lniTBc/YcEr7tmGDmPy1kboiFksbfA/F1a9dGm9i5d3e0jd/9w9mqD78ARQmN7CCU5l7NKyKxeEqVMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR05MB10093
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
Cc: "trix@redhat.com" <trix@redhat.com>,
 "llvm@lists.linux.dev" <llvm@lists.linux.dev>,
 "ndesaulniers@google.com" <ndesaulniers@google.com>,
 "patches@lists.linux.dev" <patches@lists.linux.dev>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Martin Krastev <krastevm@vmware.com>,
 Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 Maaz Mombasawala <mombasawalam@vmware.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyMDIzLTAzLTE0IGF0IDA4OjM4IC0wNzAwLCBOYXRoYW4gQ2hhbmNlbGxvciB3cm90
ZToNCj4gQ2xhbmcgd2FybnMgKG9yIGVycm9ycyB3aXRoIENPTkZJR19XRVJST1IpOg0KPiANCj4g
wqAgZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfc3RkdS5jOjUwOToyOTogZXJyb3I6IHZh
cmlhYmxlICdkc3RfcGl0Y2gnIGlzDQo+IHVuaW5pdGlhbGl6ZWQgd2hlbiB1c2VkIGhlcmUgWy1X
ZXJyb3IsLVd1bmluaXRpYWxpemVkXQ0KPiDCoMKgwqDCoMKgwqDCoMKgwqAgc3JjX29mZnNldCA9
IGRkaXJ0eS0+dG9wICogZHN0X3BpdGNoICsgZGRpcnR5LT5sZWZ0ICogc3RkdS0+Y3BwOw0KPiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgXn5+fn5+fn5+DQo+IMKgIGRyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13
Z2Z4X3N0ZHUuYzo0OTI6MjY6IG5vdGU6IGluaXRpYWxpemUgdGhlIHZhcmlhYmxlDQo+ICdkc3Rf
cGl0Y2gnIHRvIHNpbGVuY2UgdGhpcyB3YXJuaW5nDQo+IMKgwqDCoMKgwqDCoMKgwqDCoCBzMzIg
c3JjX3BpdGNoLCBkc3RfcGl0Y2g7DQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBeDQo+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgID0gMA0K
PiDCoCAxIGVycm9yIGdlbmVyYXRlZC4NCj4gDQo+IFRoZSBhc3NpZ25tZW50cyB3ZXJlIHN3aXRj
aGVkIGFyb3VuZCBpbiBzdWNoIGEgd2F5IHRoYXQgZHN0X3BpdGNoIHdhcw0KPiB1c2VkIGJlZm9y
ZSBpdCB3YXMgYXNzaWduZWQuIFN3YXAgdGhlIHBpdGNoIGFzc2lnbm1lbnRzIHRvIGZpeCB0aGUg
aXNzdWUNCj4gYW5kIG1ha2UgaXQgY2xlYXIgd2hpY2ggc2VjdGlvbiB0aGV5IGFyZSB1c2VkIGlu
Lg0KPiANCj4gRml4ZXM6IDM5OTg1ZWVhNWE2ZCAoImRybS92bXdnZng6IEFic3RyYWN0IHBsYWNl
bWVudCBzZWxlY3Rpb24iKQ0KPiBMaW5rOg0KPiBodHRwczovL25hbTA0LnNhZmVsaW5rcy5wcm90
ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0cHMlM0ElMkYlMkZnaXRodWIuY29tJTJGQ2xhbmdC
dWlsdExpbnV4JTJGbGludXglMkZpc3N1ZXMlMkYxODExJmRhdGE9MDUlN0MwMSU3Q3phY2tyJTQw
dm13YXJlLmNvbSU3QzM3Mzk4YWM5NzI0NjQzNmMyZWZjMDhkYjI0YTIyNmQ1JTdDYjM5MTM4Y2Ez
Y2VlNGI0YWE0ZDZjZDgzZDlkZDYyZjAlN0MwJTdDMCU3QzYzODE0NDA1MTEyNTkxMDE3MSU3Q1Vu
a25vd24lN0NUV0ZwYkdac2IzZDhleUpXSWpvaU1DNHdMakF3TURBaUxDSlFJam9pVjJsdU16SWlM
Q0pCVGlJNklrMWhhV3dpTENKWFZDSTZNbjAlM0QlN0MzMDAwJTdDJTdDJTdDJnNkYXRhPUh0WlRO
TGRtQ0F6SGZSb0VHNnZzV2NTdWw0WVJTWjU2Qk8yWlVIblVDajQlM0QmcmVzZXJ2ZWQ9MA0KPiBT
aWduZWQtb2ZmLWJ5OiBOYXRoYW4gQ2hhbmNlbGxvciA8bmF0aGFuQGtlcm5lbC5vcmc+DQo+IC0t
LQ0KPiBJIGFtIG5vdCBzdXJlIGlmIHRoaXMgaXMgdGhlIHJpZ2h0IGZpeCwgYXMgaXQgd2FzIG5v
dCBlbnRpcmVseSBjbGVhciB0bw0KPiBtZSB0aGF0IHNyY19waXRjaCBhbmQgZHN0X3BpdGNoIHdl
cmUgYmVpbmcgdXNlZCBpbiB0aGUgcmlnaHQgYXNzaWdubWVudHMNCj4gYnV0IHRoaXMgaXMgdGhl
IG9idmlvdXMgZml4IG90aGVyd2lzZS4gQ29uc2lkZXIgdGhpcyBhIGJ1ZyByZXBvcnQgaWYNCj4g
bm90IDopDQo+IC0tLQ0KPiDCoGRyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X3N0ZHUuYyB8
IDQgKystLQ0KPiDCoDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfc3Rk
dS5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfc3RkdS5jDQo+IGluZGV4IGQ3
OWE2ZWNjZmFhNC4uMDMwZTk3N2M2OGUyIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
dm13Z2Z4L3Ztd2dmeF9zdGR1LmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdn
Znhfc3RkdS5jDQo+IEBAIC01MDQsMTEgKzUwNCwxMSBAQCBzdGF0aWMgdm9pZCB2bXdfc3RkdV9i
b19jcHVfY29tbWl0KHN0cnVjdCB2bXdfa21zX2RpcnR5DQo+ICpkaXJ0eSkNCj4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm47DQo+IMKgDQo+IMKgwqDCoMKgwqDCoMKgwqAv
KiBBc3N1bWUgd2UgYXJlIGJsaXR0aW5nIGZyb20gR3Vlc3QgKGJvKSB0byBIb3N0IChkaXNwbGF5
X3NyZikgKi8NCj4gLcKgwqDCoMKgwqDCoMKgc3JjX3BpdGNoID0gc3RkdS0+ZGlzcGxheV9zcmYt
Pm1ldGFkYXRhLmJhc2Vfc2l6ZS53aWR0aCAqIHN0ZHUtPmNwcDsNCj4gK8KgwqDCoMKgwqDCoMKg
ZHN0X3BpdGNoID0gZGRpcnR5LT5waXRjaDsNCj4gwqDCoMKgwqDCoMKgwqDCoHNyY19ibyA9ICZz
dGR1LT5kaXNwbGF5X3NyZi0+cmVzLmd1ZXN0X21lbW9yeV9iby0+dGJvOw0KPiDCoMKgwqDCoMKg
wqDCoMKgc3JjX29mZnNldCA9IGRkaXJ0eS0+dG9wICogZHN0X3BpdGNoICsgZGRpcnR5LT5sZWZ0
ICogc3RkdS0+Y3BwOw0KPiDCoA0KPiAtwqDCoMKgwqDCoMKgwqBkc3RfcGl0Y2ggPSBkZGlydHkt
PnBpdGNoOw0KPiArwqDCoMKgwqDCoMKgwqBzcmNfcGl0Y2ggPSBzdGR1LT5kaXNwbGF5X3NyZi0+
bWV0YWRhdGEuYmFzZV9zaXplLndpZHRoICogc3RkdS0+Y3BwOw0KPiDCoMKgwqDCoMKgwqDCoMKg
ZHN0X2JvID0gJmRkaXJ0eS0+YnVmLT50Ym87DQo+IMKgwqDCoMKgwqDCoMKgwqBkc3Rfb2Zmc2V0
ID0gZGRpcnR5LT5mYl90b3AgKiBzcmNfcGl0Y2ggKyBkZGlydHktPmZiX2xlZnQgKiBzdGR1LT5j
cHA7DQoNClRoYW5rcyBOYXRoYW4hIEluIHRoaXMgY2FzZSB3ZSBqdXN0IHdhbnQgdG8gc3dpdGNo
IHRoZSB1c2FnZSBpbnN0ZWFkIG9mIHdoYXQgdGhvc2UNCnZhcmlhYmxlcyBhcmUuIEknbGwgc2Vu
ZCBhIHBhdGNoIG91dCBpbiBhIHNlY29uZC4NCg0Keg0KDQo=
