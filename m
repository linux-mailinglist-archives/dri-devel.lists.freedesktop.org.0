Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E827D87FA47
	for <lists+dri-devel@lfdr.de>; Tue, 19 Mar 2024 10:05:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11F0110F89C;
	Tue, 19 Mar 2024 09:05:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=fujitsu.com header.i=@fujitsu.com header.b="GwYW//kB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa10.fujitsucc.c3s2.iphmx.com (esa10.fujitsucc.c3s2.iphmx.com
 [68.232.159.247])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BB7A10F89C
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Mar 2024 09:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
 t=1710839134; x=1742375134;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=YOsSkF1MQkxMdKMnn6P+zpstGtq16V/9wgQbUTIjRmM=;
 b=GwYW//kBByUKh579RUXSA8JBTzPjDv8rQ3MdvYohugRa7v6bKSVIrO4Q
 M9OaYUXP67UcUfFOYC1tFe9dKLfMI3o3u4K9kGPHillDyxItHdmo7fRCk
 JEAUJx608GLDHZSwbywTOVFc86v6J/vEnhHNVcQgpLy4C9rfLFp8j17D9
 8N6sLQb2RW27DHPCsw/oLx959fy+uvLiCL5kb2uS/MPiPSbDSWVFzqgDk
 hgas/BdO7DlDiPYf6vKqvwVp3S6D7Eup1aEVApw0HG49aET9fCqs1JXfR
 GJpljER2u8RdIyHiaKxGgbSyYNSikXmvlwHaKGD88n3vPS2OX1QkbVpb7 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="114510796"
X-IronPort-AV: E=Sophos;i="6.07,136,1708354800"; d="scan'208";a="114510796"
Received: from mail-os0jpn01lp2104.outbound.protection.outlook.com (HELO
 JPN01-OS0-obe.outbound.protection.outlook.com) ([104.47.23.104])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2024 18:05:27 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fcaltNlLdg/CCXnt/wfuXFF05rNtozBok4d9MGV03KBe0OWw+vikF2WT4Ujt1vPyPwz+nP/b7y0+lf6Rt2ZgcK9PGC650vw7Q0ltLNwzzxhCe7aHOKUIHnRyl5RD7iBxn8wuZB5RvbtLIYpPEecxFnu4H3xo2wasbIQgip8LHmHVlR7BBYduqOgtAa/S025GJItxtfr/nuEFeY+u2TnnZ+avUCJi3EtveI3QF9d1aaVUHqRVk+w3cSviVTaKD9ezs923VigEH6iHO5EdRdWhPO1WeS0gYX597gsTxZzp3+TYtw3XRMD1G19jow7xtbIu7coIsZq5Sw9nimk4m1b4/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YOsSkF1MQkxMdKMnn6P+zpstGtq16V/9wgQbUTIjRmM=;
 b=G6uTbET+NSpclpIuvCPrkexD/xZEEr/e5GRkIn6f0FIE/Oun54GI9x47hNxs8T+OxB7JwI7Rbt6RODdub2qH1sUCEBuxPME5s5qBpkMz4xz5o8aaRZ3lUiLKAApiKhymirO+XkjLw5/4W3joG+XET4OcrQNAelo8I6ThetxiWe1JAAnWojmcd5u5WrXsD2sGUUhDGgWKSg1oWGPPwwojrQruTKeG3odv4yLx4a/aoh7NguvZO4lSZcdp1ZcmV2Ijxtw+TcARFqIjIcrMx01awUBIg2c8SguOII5jskaqRZh3Xk/Nu7li5BfOXqvlLKs8C6LeWMjQpNWFB3r43pPFXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from TYAPR01MB5818.jpnprd01.prod.outlook.com
 (2603:1096:404:8059::10) by TYVPR01MB10893.jpnprd01.prod.outlook.com
 (2603:1096:400:2ab::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.27; Tue, 19 Mar
 2024 09:05:24 +0000
Received: from TYAPR01MB5818.jpnprd01.prod.outlook.com
 ([fe80::c52a:473a:a14f:7f0e]) by TYAPR01MB5818.jpnprd01.prod.outlook.com
 ([fe80::c52a:473a:a14f:7f0e%3]) with mapi id 15.20.7386.025; Tue, 19 Mar 2024
 09:05:24 +0000
From: "Zhijian Li (Fujitsu)" <lizhijian@fujitsu.com>
To: "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC: Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg
 <sam@ravnborg.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Helge
 Deller <deller@gmx.de>, "linux-omap@vger.kernel.org"
 <linux-omap@vger.kernel.org>, "linux-fbdev@vger.kernel.org"
 <linux-fbdev@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v2] drm,fbdev: td043mtea1: Convert sprintf() family to
 sysfs_emit() family
Thread-Topic: [PATCH v2] drm,fbdev: td043mtea1: Convert sprintf() family to
 sysfs_emit() family
Thread-Index: AQHaebFbptSs79xlgEGWQFm7aau0tLE+tX8AgAAQQwA=
Date: Tue, 19 Mar 2024 09:05:24 +0000
Message-ID: <3b5c7af9-cebf-41e4-a492-15f33738c508@fujitsu.com>
References: <20240319035555.1577734-1-lizhijian@fujitsu.com>
 <9907040c-7e25-4aa5-a4be-6f4820e335f1@linaro.org>
In-Reply-To: <9907040c-7e25-4aa5-a4be-6f4820e335f1@linaro.org>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYAPR01MB5818:EE_|TYVPR01MB10893:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Gq3CIk8kRqaBeoasAW6J1pZebCF69/E6LOLAJbujLMZzv2UbluSwRJBr43op3XErFh7sg50cMHPX/5nFfZUGHojKQ3zLt1h37pVD0Y8sVX9zn3y/fQtHnDvD/jwVcPEIHYm91vesV9YQtLJg4h+EuTctNzP6m/q29yWhN2142oO9xrvmCZZqyrX2tTxe1WP7dahkIH2pQEk6L9B9TA5rhiiqDEzxbq38P/c2P00S5wgjGGmITBNDnC+kOgdxQ+Bs8Wp3R8C3v+EAysw+f93QAfv9KGlfNg6EgFARnkFp7vXFzM58BAEgyC178WvwYN4ol5NA18/BK9r7FH0glhoXI6Vc2rPbseqv+X7qI146dwkKFnaZiIzy0YOcl99xF1O4sHbogbmH0TlXEvpM2z+b7epjUiZBPt98jvGtoDSIJDosrO8InUVhnjlQZkZv8EKkdEvZamwKje+CHgT/Py9+4RrOFS4iLOw5nqkrI66AZ0UwOn5gvHgxHjsaFs6WZTvI6KRvAuhUMnSjUfSuIEsIV5rtJq7vs5/3pS6EHsZ6vf7Zsv0R5I/1BLXHSo8sDYT3WL1Kw+87+gSsogBIdtGL8aBRZP9JhpFFJwxXFdjQjTNXWuCW5w9lR/gSvBnn5CvDZqM/0QMmyHrHylunulcvvefbbqrI0zjvEiZKEByeZk4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYAPR01MB5818.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(7416005)(366007)(376005)(1580799018); DIR:OUT;
 SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NkptWUdjUDd2N0F4ZnBNRUFma2FJK0U2ektjMHFiUTU3RmVvWWllK1BTaDBi?=
 =?utf-8?B?dGs1eTVEQ3ZCa01sNTlWVnpwRnZ4UE4yazU0NmtqdmhMRWtOYkZ1RWF5ZkRi?=
 =?utf-8?B?dXVxNWttOHcrZzBCQ2ViZk5xN1FmZGY3TUxidWh2MjFlbTBHVU44V2R0OCtR?=
 =?utf-8?B?MnNHdnBacWJQR3NOd2xWRG45UTdzVDZjTXVQeXFCMFhPTllTZ0ZybUo5Q0hs?=
 =?utf-8?B?bUYzK014bWpkRHdzQkt5WEZzSmVzUCsyNlpQTmViRFhMaUJIMmM3V0hTNDMw?=
 =?utf-8?B?OGNtZkZqcnB5eEpXZFZyRUh6bzhWRThOdS93dzdjaXdiQWt2NTNrT1lFV1Yz?=
 =?utf-8?B?eWQ5bU50SlI4OEpDQWVhSEZRNlY0RlRDVnVab0dhSDIyNnFSRUdnc0ZpR0Z1?=
 =?utf-8?B?TithQXFyZFRoeEpUUWpOa2pzSmVHQlZmRzd0ZElIdnpmbXc3ekJNTEFpK1pG?=
 =?utf-8?B?YVVFS2dYMVJoTXQ3dm0rSStFT1hmaHFPZ1U5NEVrRjZLbzNKOHpQRk5DMXZD?=
 =?utf-8?B?TStLNkkzWldVWDdWNmcvcTY0OVBlbll1U2lNUnl3VDJ2WldPVUhubDNSTzVQ?=
 =?utf-8?B?bEROZVQ1QWRRRlc3dW1wS1ppeG84cW9xZjJZZ3IyK0JaTmp2Y2hWaWZtbGt4?=
 =?utf-8?B?cm5GRkd6UDBVeGJsQitkd3ZMaGRkTnJoK2NZMEpZKzRoWUpFZUtEaFh3dkdH?=
 =?utf-8?B?SU1JRVlDTFpsUW05V3RRMFhFVUtjMUw5cittUHlSSUFIalVxaGsrWElVYU9w?=
 =?utf-8?B?WUo0dEpjQ2lZTjVRZlpRSHc3TG1BNEJYQlR0cUU4bHhnUWlUY2dKY0ZSRzhv?=
 =?utf-8?B?YWJwUVV6VGc4L0tPVnltSWR4aXZBTEJFN2FRZEpYc2dReXhWTGhiTGRMb2JH?=
 =?utf-8?B?M0dpcHYxT2JLUTJXY0dvV2Z3cGIvemFaaU9qSG5SdGFEdFVrL0IzbmlISW5a?=
 =?utf-8?B?MDZCVzRIV1BxdmJGc2NYcmlZOTFRaG0rSjZIdmRoMjhIWkx0azVvdU52UTJS?=
 =?utf-8?B?d1JrZ2xXKzAxQ3c4aDF2bk80Z28rL3IxcmtTWXdtYWk0b0lyOXFJQ2h3NndG?=
 =?utf-8?B?LzRabURXN0FGMWNneEhZbTV5QzVEd0hCUDFQVExqeW1ISm9XTWtyMGt0cGUx?=
 =?utf-8?B?YVJtSlhqMC9aekFrc0Y5bEZSZFVadWxvZGo2VERXZTVyZEZzdm9pMmV4elNW?=
 =?utf-8?B?QlhXeWJIdmJuMURJUktVbzEvekJkcXMvaWdrMXYwSkdYbC9rVHpZQjd5clpv?=
 =?utf-8?B?OUw2OFR2SHozcFBHVWx2c3BaYTVjK3o2ZU9BWUNCdHBNZnAySjBoRU5seXVu?=
 =?utf-8?B?eGV3a1QydVJxRDd6ampVdytqamN4SzZRMXE1UDBtWk9HY2UvS1ZMY3F5clIy?=
 =?utf-8?B?MWJiNGJ0azRFM0x3eHY4TnVBNWtHWXoyNW5PMFFHeksvUG5OTHFUUHdKZGpU?=
 =?utf-8?B?TXZocHczSGhGTEVsQ0dNY1p2MytaaEVFb0M1WmNVSGpaa203ZDVZaHlvNnRY?=
 =?utf-8?B?dS9tZ2RBQUc5QmJwNVM3Ky9FTkl2eHR0M1dGNXpnaWI3cHZtcnVtRmw0VytE?=
 =?utf-8?B?RSs5T0NWWE02T1QwejlTcDdXVnR5ZTZ1RitPcEE4S1g3VklaWkpFdGIxMU9C?=
 =?utf-8?B?WjM5UkUzSStEdVZkdHFWc0gvQXorT0psc1cvS0dwYTh2dWpnb1BxanZEeFFB?=
 =?utf-8?B?TFZrZlhCR2ZpREU1VE5jYmdhWmxhUHlIdTlveVZyVUJZNXc2VHhCSTNITGxZ?=
 =?utf-8?B?aDJWQ1dJbFoyR0NaeUd6MFM2SVN0cTFEdDI2YTJuR25HTkRZZU15WmlFNGNa?=
 =?utf-8?B?ejdlQTUrcWczVmlNMjlaZ0RxS1VEK3NhTCtCblFYTGN3dkNCWWVCejljZkU0?=
 =?utf-8?B?TWhjRzR6TS9kbjBhVS8zWVBlVDN2UUc0SzdtcXd5VGttS01ENWEycTIwbSta?=
 =?utf-8?B?Um9wOE9GOXVFc1RGYjNsZDRVM3ErVDRNUEJTYzNEemw0WGRWaFUxOVEyYjhp?=
 =?utf-8?B?Q2p3ZUxkWG5WTU1KNHRPK0wxQ2ROV3lSOXpjTTB5NWlXODAySjUwVVdYWVhY?=
 =?utf-8?B?amtBL1hzSlNMb2ZqbTlqS0IveTlPSUpDOVFBVkNCeU9GR1p4QU9tVUNMZ1pX?=
 =?utf-8?B?ZU1JS1M0VVhVTGJiSHRVUDVtUW8vN0NvZXpLNnN3L3ErQS9uTXMzYlZOenBw?=
 =?utf-8?B?TVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C1B7EEA9D2EB4E4F8BB0F6A6289A0B63@jpnprd01.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: xLxA5N4ALqwXIvt+XPnCyS9YdidPm+0pdleapXfvLvpVijUGcY3qlYFkVSZpn3TWWw+gXvIzSX9ouiiaiIx2z4FASWWxiQb7ErniUvNN2XyXYJx+Ehd0QWLpW13VruztYRZiNna1Vk72+14mbFaazFyE0A7+lr2QbXHVXqGQAeb/dwIf2agpQyO1YOgFeb7fKaBZGeX29Hat1/JAr3uBFgP9aqVVkaJ5dd2iXfR1EOVkHw++O0LtlgG60MIpSitALqgwD20mvJYtPOuc+DanU1MQ2fy+QVTRtkSqweD7uNY5SKa/9YQzHEV2NSL0ctFEy0u2POtu70XQrxXEJMxWerxdFzuSJsgALeMFNZy/tC+GP6T/l4QX7dj62bgt/RctqE2hRyUpgdKmKD/xBrjGpCRy9jxUIPskPjD8K5nuzi5+sOBO9qfe8eAHRKMtAlOT12N6KpgNC+nVnoIX1BzXBeXzRnCureEnB/cxDukhVNQdTac+DN9NMg+86Zz2+n6RvZVNZnBFf4wpt17xH7XlFYe4XxWvl5kNnjz2PaS3aW6BvcWmryZ5PU7oFF47JRcL2oF9jIWnE3S3z4FnsZBhuMEJgldU+ttvCAOlNNlwbuNZaUk4McOg1enIJTJpLWZz
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYAPR01MB5818.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a4190a8-ac47-4a05-7d36-08dc47f3b64e
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Mar 2024 09:05:24.0654 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZcKmNIgCYDH/gnrfQKeXJlYNvVKNLMVqX7jfrDboxovld0W02x/p5B8Z5l7U7UGMBuw+fP2lXzrXRF84J0VILQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYVPR01MB10893
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

DQoNCk9uIDE5LzAzLzIwMjQgMTY6MDcsIE5laWwgQXJtc3Ryb25nIHdyb3RlOg0KPiBIaSwNCj4g
DQo+IE9uIDE5LzAzLzIwMjQgMDQ6NTUsIExpIFpoaWppYW4gd3JvdGU6DQo+PiBQZXIgZmlsZXN5
c3RlbXMvc3lzZnMucnN0LCBzaG93KCkgc2hvdWxkIG9ubHkgdXNlIHN5c2ZzX2VtaXQoKQ0KPj4g
b3Igc3lzZnNfZW1pdF9hdCgpIHdoZW4gZm9ybWF0dGluZyB0aGUgdmFsdWUgdG8gYmUgcmV0dXJu
ZWQgdG8gdXNlciBzcGFjZS4NCj4+DQo+PiBjb2NjaW5lbGxlIGNvbXBsYWlucyB0aGF0IHRoZXJl
IGFyZSBzdGlsbCBhIGNvdXBsZSBvZiBmdW5jdGlvbnMgdGhhdCB1c2UNCj4+IHNucHJpbnRmKCku
IENvbnZlcnQgdGhlbSB0byBzeXNmc19lbWl0KCkuDQo+Pg0KPj4gc3ByaW50ZigpIGFuZCBzY25w
cmludGYoKSB3aWxsIGJlIGNvbnZlcnRlZCBhcyB3ZWxsIGlmIHRoZXkgaGF2ZS4NCj4+DQo+PiBH
ZW5lcmFsbHksIHRoaXMgcGF0Y2ggaXMgZ2VuZXJhdGVkIGJ5DQo+PiBtYWtlIGNvY2NpY2hlY2sg
TT08cGF0aC90by9maWxlPiBNT0RFPXBhdGNoIFwNCj4+IENPQ0NJPXNjcmlwdHMvY29jY2luZWxs
ZS9hcGkvZGV2aWNlX2F0dHJfc2hvdy5jb2NjaQ0KPj4NCj4+IE5vIGZ1bmN0aW9uYWwgY2hhbmdl
IGludGVuZGVkDQo+IA0KPiBQbGVhc2Ugc3BsaXQgcGF0Y2hlcyBpbiAyLCB3aGlsZSB0aGUgZHJp
dmVyIHRhcmdldHMgdGhlIHNhbWUgaHcsIHRoZXkNCj4gYXJlIG5vdCB1bmRlciB0aGUgc2FtZSBz
dWJzeXN0ZW1zLg0KDQpHb3QgaXQsIGkgd2lsbCBkbyB0aGF0IHNvb24uDQoNClRoYW5rcw0KWmhp
amlhbg0KDQo+IA0KPiBOZWlsDQo+IA0KPj4NCj4+IENDOiBOZWlsIEFybXN0cm9uZyA8bmVpbC5h
cm1zdHJvbmdAbGluYXJvLm9yZz4NCj4+IENDOiBKZXNzaWNhIFpoYW5nIDxxdWljX2plc3N6aGFu
QHF1aWNpbmMuY29tPg0KPj4gQ0M6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4NCj4+
IENDOiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29t
Pg0KPj4gQ0M6IE1heGltZSBSaXBhcmQgPG1yaXBhcmRAa2VybmVsLm9yZz4NCj4+IENDOiBUaG9t
YXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4NCj4+IENDOiBEYXZpZCBBaXJsaWUg
PGFpcmxpZWRAZ21haWwuY29tPg0KPj4gQ0M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5j
aD4NCj4+IENDOiBIZWxnZSBEZWxsZXIgPGRlbGxlckBnbXguZGU+DQo+PiBDQzogbGludXgtb21h
cEB2Z2VyLmtlcm5lbC5vcmcNCj4+IENDOiBsaW51eC1mYmRldkB2Z2VyLmtlcm5lbC5vcmcNCj4+
IENDOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+PiBTaWduZWQtb2ZmLWJ5OiBM
aSBaaGlqaWFuIDxsaXpoaWppYW5AZnVqaXRzdS5jb20+DQo+PiAtLS0NCj4+IFYyOg0KPj4gwqDC
oMKgIEZpeCBtaXNzaW5nICcrJyBiZWZvcmUgJz0nIGluIGRyaXZlcnMvdmlkZW8vZmJkZXYvb21h
cDIvb21hcGZiL2Rpc3BsYXlzL3BhbmVsLXRwby10ZDA0M210ZWExLmMNCj4+DQo+PiBUaGlzIGlz
IGEgcGFydCBvZiB0aGUgd29yayAiRml4IGNvY2NpY2hlY2sgZGV2aWNlX2F0dHJfc2hvdyB3YXJu
aW5ncyJbMV0NCj4+IFNwbGl0IHRoZW0gcGVyIHN1YnN5c3RlbSBzbyB0aGF0IHRoZSBtYWludGFp
bmVyIGNhbiByZXZpZXcgaXQgZWFzaWx5DQo+PiBbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcv
bGttbC8yMDI0MDExNjA0MTEyOS4zOTM3ODAwLTEtbGl6aGlqaWFuQGZ1aml0c3UuY29tLw0KPj4g
LS0tDQo+PiDCoCBkcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtdHBvLXRkMDQzbXRlYTEuY8Kg
wqDCoMKgwqDCoMKgIHwgMTMgKysrKy0tLS0tLS0tLQ0KPj4gwqAgLi4uL29tYXAyL29tYXBmYi9k
aXNwbGF5cy9wYW5lbC10cG8tdGQwNDNtdGVhMS5jwqDCoMKgIHwgMTIgKysrKy0tLS0tLS0tDQo+
PiDCoCAyIGZpbGVzIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgMTcgZGVsZXRpb25zKC0pDQo+
Pg0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC10cG8tdGQwNDNt
dGVhMS5jIGIvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXRwby10ZDA0M210ZWExLmMNCj4+
IGluZGV4IGNmNDYwOWJiOWIxZC4uMDk4M2ZlNDdlYjVhIDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL3BhbmVsL3BhbmVsLXRwby10ZDA0M210ZWExLmMNCj4+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9wYW5lbC9wYW5lbC10cG8tdGQwNDNtdGVhMS5jDQo+PiBAQCAtMjQyLDE2ICsyNDIs
MTEgQEAgc3RhdGljIHNzaXplX3QgZ2FtbWFfc2hvdyhzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVj
dCBkZXZpY2VfYXR0cmlidXRlICphdHRyLA0KPj4gwqDCoMKgwqDCoCBzdHJ1Y3QgdGQwNDNtdGVh
MV9wYW5lbCAqbGNkID0gZGV2X2dldF9kcnZkYXRhKGRldik7DQo+PiDCoMKgwqDCoMKgIHNzaXpl
X3QgbGVuID0gMDsNCj4+IMKgwqDCoMKgwqAgdW5zaWduZWQgaW50IGk7DQo+PiAtwqDCoMKgIGlu
dCByZXQ7DQo+PiAtwqDCoMKgIGZvciAoaSA9IDA7IGkgPCBBUlJBWV9TSVpFKGxjZC0+Z2FtbWEp
OyBpKyspIHsNCj4+IC3CoMKgwqDCoMKgwqDCoCByZXQgPSBzbnByaW50ZihidWYgKyBsZW4sIFBB
R0VfU0laRSAtIGxlbiwgIiV1ICIsDQo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIGxjZC0+Z2FtbWFbaV0pOw0KPj4gLcKgwqDCoMKgwqDCoMKgIGlmIChyZXQgPCAwKQ0K
Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIHJldDsNCj4+IC3CoMKgwqDCoMKgwqDC
oCBsZW4gKz0gcmV0Ow0KPj4gLcKgwqDCoCB9DQo+PiAtwqDCoMKgIGJ1ZltsZW4gLSAxXSA9ICdc
bic7DQo+PiArwqDCoMKgIGZvciAoaSA9IDA7IGkgPCBBUlJBWV9TSVpFKGxjZC0+Z2FtbWEpOyBp
KyspDQo+PiArwqDCoMKgwqDCoMKgwqAgbGVuICs9IHN5c2ZzX2VtaXRfYXQoYnVmLCBsZW4sICIl
dSAiLCBsY2QtPmdhbW1hW2ldKTsNCj4+ICvCoMKgwqAgaWYgKGxlbikNCj4+ICvCoMKgwqDCoMKg
wqDCoCBidWZbbGVuIC0gMV0gPSAnXG4nOw0KPj4gwqDCoMKgwqDCoCByZXR1cm4gbGVuOw0KPj4g
wqAgfQ0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvb21hcDIvb21hcGZiL2Rp
c3BsYXlzL3BhbmVsLXRwby10ZDA0M210ZWExLmMgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L29tYXAy
L29tYXBmYi9kaXNwbGF5cy9wYW5lbC10cG8tdGQwNDNtdGVhMS5jDQo+PiBpbmRleCA0Nzc3ODlj
ZmY4ZTAuLjM2MjQ0NTJlMWRkMCAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvdmlkZW8vZmJkZXYv
b21hcDIvb21hcGZiL2Rpc3BsYXlzL3BhbmVsLXRwby10ZDA0M210ZWExLmMNCj4+ICsrKyBiL2Ry
aXZlcnMvdmlkZW8vZmJkZXYvb21hcDIvb21hcGZiL2Rpc3BsYXlzL3BhbmVsLXRwby10ZDA0M210
ZWExLmMNCj4+IEBAIC0yMjgsMTQgKzIyOCwxMCBAQCBzdGF0aWMgc3NpemVfdCB0cG9fdGQwNDNf
Z2FtbWFfc2hvdyhzdHJ1Y3QgZGV2aWNlICpkZXYsDQo+PiDCoMKgwqDCoMKgIGludCByZXQ7DQo+
PiDCoMKgwqDCoMKgIGludCBpOw0KPj4gLcKgwqDCoCBmb3IgKGkgPSAwOyBpIDwgQVJSQVlfU0la
RShkZGF0YS0+Z2FtbWEpOyBpKyspIHsNCj4+IC3CoMKgwqDCoMKgwqDCoCByZXQgPSBzbnByaW50
ZihidWYgKyBsZW4sIFBBR0VfU0laRSAtIGxlbiwgIiV1ICIsDQo+PiAtwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGRkYXRhLT5nYW1tYVtpXSk7DQo+PiAtwqDCoMKgwqDCoMKgwqAgaWYg
KHJldCA8IDApDQo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gcmV0Ow0KPj4gLcKg
wqDCoMKgwqDCoMKgIGxlbiArPSByZXQ7DQo+PiAtwqDCoMKgIH0NCj4+IC3CoMKgwqAgYnVmW2xl
biAtIDFdID0gJ1xuJzsNCj4+ICvCoMKgwqAgZm9yIChpID0gMDsgaSA8IEFSUkFZX1NJWkUoZGRh
dGEtPmdhbW1hKTsgaSsrKQ0KPj4gK8KgwqDCoMKgwqDCoMKgIGxlbiArPSBzeXNmc19lbWl0X2F0
KGJ1ZiwgbGVuLCAiJXUgIiwgZGRhdGEtPmdhbW1hW2ldKTsNCj4+ICvCoMKgwqAgaWYgKGxlbikN
Cj4+ICvCoMKgwqDCoMKgwqDCoCBidWZbbGVuIC0gMV0gPSAnXG4nOw0KPj4gwqDCoMKgwqDCoCBy
ZXR1cm4gbGVuOw0KPj4gwqAgfQ0KPiA=
