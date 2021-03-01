Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A6AB328A1B
	for <lists+dri-devel@lfdr.de>; Mon,  1 Mar 2021 19:12:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C26389C08;
	Mon,  1 Mar 2021 18:12:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 300 seconds by postgrey-1.36 at gabe;
 Mon, 01 Mar 2021 18:12:14 UTC
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D08389B69;
 Mon,  1 Mar 2021 18:12:14 +0000 (UTC)
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B603d2d520001>; Mon, 01 Mar 2021 10:07:14 -0800
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 1 Mar
 2021 18:07:13 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.172)
 by HQMAIL111.nvidia.com (172.20.187.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2 via Frontend Transport; Mon, 1 Mar 2021 18:07:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WUQ6bmuhFpCehEpN+X/DZCfnPu6Ew7SiuNMhSpdju5al43LOxzmiqS3XCVSmkccc7zbjlK5idugDKFJgH3OL6JYkKAwfR9EcdFWBOKGKerWRf/PUU0a42vhjB/OCpuw5Vqip/qP34MN/aJiiJXyM97l8ITZpVlFAJUy0CbruD+SZ/r4w6TyCqXHSCotgCI749gI8OOFUl7+EAp0/pXuU2wxTCuw+L5tluat0oAdW3ptmlwiwvWX4Qcm2e+v7VIsyJtanr6Du2VveCBuBjnGVgQiTENEkEBnYMDP7UXUJZNI4EZmnuOKR5cDfpsKAfbTKlLv9CweAxOgl7rMnXi5uzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NQRgGoZ71oEwwDx8h2Uu2ighoTnpNufu8pKuoykWbfA=;
 b=ZpYipf8pSpvPJbhfpqOE3TCldFDv9Y1zZH3EMGBA9hxuPjiU5tEI3WFDrIwdMbix3nBw2ZSYaknQglqCv83+gphNHb8Kyva1EgGGt1hTz8dmcVUbWoTo79b3Tu4A2YhuuIYgP/jxuAVuckCzdj8dgNNORtNbja7Dkmn5ZojEtMuKOgMO1+NuABO8UZcgl47S2CvaHz4ntTe/gEQl58mqDR4fsKDsbibwlbikbKj547ni+y25EVEMtRiTUCyncdJ3gow62JCNCuof+jRsbp9zocjCAv+4YPWQ2TVSHghFLVDn7zbkkyVTkl5B0AE8LVuBZD+VDb/N4MKoE6TWeeLPZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from MN2PR12MB4344.namprd12.prod.outlook.com (2603:10b6:208:26e::11)
 by MN2PR12MB3982.namprd12.prod.outlook.com (2603:10b6:208:16c::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.23; Mon, 1 Mar
 2021 18:07:12 +0000
Received: from MN2PR12MB4344.namprd12.prod.outlook.com
 ([fe80::6412:fe3d:f2:87db]) by MN2PR12MB4344.namprd12.prod.outlook.com
 ([fe80::6412:fe3d:f2:87db%8]) with mapi id 15.20.3890.028; Mon, 1 Mar 2021
 18:07:12 +0000
From: Ralph Campbell <rcampbell@nvidia.com>
To: Jason Gunthorpe <jgg@nvidia.com>, Alistair Popple <apopple@nvidia.com>
Subject: RE: [PATCH v3 6/8] mm: Selftests for exclusive device memory
Thread-Topic: [PATCH v3 6/8] mm: Selftests for exclusive device memory
Thread-Index: AQHXDA+10DMlRgXFfUuy1T9vHkceyqpvcAoAgAACmWA=
Date: Mon, 1 Mar 2021 18:07:12 +0000
Message-ID: <MN2PR12MB43442D3BD56A59D6F27F1EB2C29A9@MN2PR12MB4344.namprd12.prod.outlook.com>
References: <20210226071832.31547-1-apopple@nvidia.com>
 <20210226071832.31547-7-apopple@nvidia.com>
 <20210301175536.GS4247@nvidia.com>
In-Reply-To: <20210301175536.GS4247@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Enabled=True;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_SiteId=43083d15-7273-40c1-b7db-39efd9ccc17a;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Owner=rcampbell@nvidia.com;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_SetDate=2021-03-01T18:07:14.3594341Z;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Name=Unrestricted;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_ActionId=4e17ed93-7aac-44ba-ba80-4deded6a1e34;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Extended_MSFT_Method=Automatic
authentication-results: nvidia.com; dkim=none (message not signed)
 header.d=none;nvidia.com; dmarc=none action=none header.from=nvidia.com;
x-originating-ip: [2601:646:8e80:c510:10c8:3f69:ba2e:72f8]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0c68dff1-7dcc-45db-9a8a-08d8dcdcd675
x-ms-traffictypediagnostic: MN2PR12MB3982:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB398289F4C75DF154A9041CE1C29A9@MN2PR12MB3982.namprd12.prod.outlook.com>
x-header: ProcessedBy-CMR-outbound
x-ms-oob-tlc-oobclassifiers: OLM:3826;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6YbWGjFjneNeGM5WkApFT1hEAfJ+O9okQAnJIYzBdxPeKlfpkSgaVltqCCkP0SEiDt0dvWnpEmKbAT3NfgNZyhUhXTddZ2j+2eUKp1KAvyoCNm6WQUtobdAqDb8jsQz6l+5g3p1+AHn2dmXCwz57KeAumiyDiYYdz/0mHphxL5Pl/tSj9dztGmQL6GhI2Akt8awoVn7xuhpH+0WEiLG7hNAMhTuLzRjlDCpGOGBh1BukJTxL3zX9IAGHc1XKUccD7KTuaodExoOksXZvVyufS/yrv2/PT3iMoi6/W/JaakZFCTdBQ1OJqiKfNjOxH10FUYrCtCwqNakvSLSr7npqoiMvpg+zyuxl6hSaWdCDQ75/03J8TqoSEuUpNqG+hHBNtwq5VckoZ3L9xn2f+UvztqLhgRVTDFL2AHLsLto7Xm+0Rjiy7Y/0WrmoiYhw8TcP5nkfs1l8Zz9ZYgXdl4/DIN7iVBpXyyCcr9Ndekc9UudWy9rEixrclbpMbNma0w/YlChIMRjYz45KU1F5MaDyuA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4344.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(346002)(376002)(39860400002)(136003)(52536014)(7416002)(66946007)(7696005)(6636002)(76116006)(8936002)(66476007)(316002)(64756008)(478600001)(2906002)(6506007)(53546011)(66446008)(5660300002)(86362001)(66556008)(33656002)(9686003)(55016002)(54906003)(4744005)(186003)(71200400001)(4326008)(8676002)(110136005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?Q1VYcDhRRXJvNmdUNFQ4OWFMUzAyUXYwZ2hHZFpESFNFKzdxNnBiZDJidUs4?=
 =?utf-8?B?aFdmYmEveGJRTGZOVWtZUGFLakhkRE5KRFhsaHpJbG1VbzF3SG5ZcStwS21R?=
 =?utf-8?B?Qm1nVXFWd2NaUUljR0NBQ0M4MmlOVkVFS2x5ci9CMGpPblcrZzU5TVJxQk1H?=
 =?utf-8?B?dVg2dFJYVkZhZjc4bUVLMlMyS1BDVHFzTDd3cnNud2ttN3BXaEh4OTk5eHlK?=
 =?utf-8?B?ZlE5OTkxZmlIaG8wby82OWx6dmJTL28wQTdKQ2dsWEFWU1VjZE56cU91RTBv?=
 =?utf-8?B?OW15Ujg3MGJhVWtGQkt1OEtOelRTNGpHa3I1akRVMytNOG80STRCRVRMTGl0?=
 =?utf-8?B?eUF0M3pBaFJJOE9Rd1RYcENUSXA5eXdOSGN6bVo0RG9KV1dza0R2c0FvUE11?=
 =?utf-8?B?V3VTSGtUVmczTDY3TFJWVTJtejk5bUpiSFk4VC9OWUFzdHp3VkVjSVZKcEU2?=
 =?utf-8?B?YVJtY3lLWXhNUDdjM2lCdmIvbWNEZ1JkSzlMRzFkTWF1TW1LZzN3MDhnbG5x?=
 =?utf-8?B?K2pMZTJ1T0o3aGpHM3cvWUxMQXFHN09OV0JKZDRvdnBRU2wvZldBNHJnTHNT?=
 =?utf-8?B?TEpscElMUkdQUForenVaRFJuVElDMU9Ianlhelo0Zm9vU2Z2MUNJRks5SGhG?=
 =?utf-8?B?bk9uek41K2JkYThKMDZEUWtoNnlDZkxxamdwSGVEZ1JySDRQRWVEalhvSzl1?=
 =?utf-8?B?WGM3OStnUkZWZi9TZytWby9ZR2gwcG40QmFUWEhEeTdUY2JkR2hBcWVTUDYv?=
 =?utf-8?B?MWZQT2lBUDM2dXZDM0RlQW1XTWlBR2RkL2U5OXFVb2wwWTdRRnFQRmpWakdO?=
 =?utf-8?B?QTlnam4vdUlTcTY2dVlQeFVVOHg1c0dVNXhUQXhRREc5RExJZzkxVFVIT0NU?=
 =?utf-8?B?VXNlVit1MHM0Q05XYytJK1hNeVdaUVQ3alJac0lJaFp3a3hkYnJCUGZZVnVs?=
 =?utf-8?B?empmVDJmUkhGYUVacXprV2VSNXZ6MzJtV0x0c2p2ZkM2V1hIY2wwRGsxV2kv?=
 =?utf-8?B?U2FySnEzUDBLVGxUL3luNE5mTjZwanZLb1lSckQ1b2luZjhEbFRKM3dlNkZN?=
 =?utf-8?B?dmpDbWFiZEpaWE1ldWNqUXp5M0d5MWxIdlNseUlnNlhKdlcySWRnZnRtZ2hq?=
 =?utf-8?B?MU9GeEZpUno1dS9DNHF0a0t6Ujh4bUduVUpkYmkvRXp1RFgyMVRHVU9vcEVl?=
 =?utf-8?B?N3dod3NHUmczc2VNMURZU25OUHBkK3VWajQ1S3ptYUR4OXc1VVFrNkh6SE1n?=
 =?utf-8?B?N0VHdkxZckZkb1lRS2NwTkxxWGVxbE1yRUxYQkF1TkY4QTlxdXQ5aTJrMlpj?=
 =?utf-8?B?dldFZVBDQ3l2Q2RMSDkvT0JRRGRkSFMwZXEvL29pdUNLQjQrZDJlSmo1Uy9t?=
 =?utf-8?B?ekk2QWhxaVZoY1V6Q0F5Rnh5Zm9wNnBZY2lFV1F4ZjNudytXMWtTN2lJbGZ2?=
 =?utf-8?B?ODBHUXJOa044Y3lSVUc0WElwWkljUnVxc1RqcmhYMTVQNVNPVWlBZVhtVzEx?=
 =?utf-8?B?Y2tONExoM0ora0FqcXhqUlJBS3R6MDN5dlIrWjRvRldkMitOUE5XZVltTVhV?=
 =?utf-8?B?ckx1SmFCQXVsUXBnbnZpdkgzMVFBRy9FMjRuemNDK3BiZjRsV1ZBYVhuSUhR?=
 =?utf-8?B?ZWUvQWZyVmV4YmZlaUYwK2ZOMi9nNmtFUmRnci9VZi90YlZiTWFRWDFKbjUz?=
 =?utf-8?B?WGV5NFREeGQ4bitFZnduMnN1SUJEeHBhZEFMcldBekpEUExORGhyZTVCeVpV?=
 =?utf-8?B?Mk42SzZuSERLajhFSEpCMlpPTHc1a0NwYWhlMXpIbHNoTm95Q0w0Y1BpYmh2?=
 =?utf-8?Q?NDhaFBCNqrfXrRMQXoXB1LBve7EF7V+a2yUtc=3D?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4344.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c68dff1-7dcc-45db-9a8a-08d8dcdcd675
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Mar 2021 18:07:12.0906 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eBn2u0XSNLA31qFL8flMm8e2Phbog2gVC5ThLIULCKywltTDyvon793CuNTFnB73YlwhhQSKWht9oWKlz5QasQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3982
X-OriginatorOrg: Nvidia.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1614622034; bh=NQRgGoZ71oEwwDx8h2Uu2ighoTnpNufu8pKuoykWbfA=;
 h=ARC-Seal:ARC-Message-Signature:ARC-Authentication-Results:From:To:
 CC:Subject:Thread-Topic:Thread-Index:Date:Message-ID:References:
 In-Reply-To:Accept-Language:Content-Language:X-MS-Has-Attach:
 X-MS-TNEF-Correlator:msip_labels:authentication-results:
 x-originating-ip:x-ms-publictraffictype:
 x-ms-office365-filtering-correlation-id:x-ms-traffictypediagnostic:
 x-ms-exchange-transport-forked:x-microsoft-antispam-prvs:x-header:
 x-ms-oob-tlc-oobclassifiers:x-ms-exchange-senderadcheck:
 x-microsoft-antispam:x-microsoft-antispam-message-info:
 x-forefront-antispam-report:x-ms-exchange-antispam-messagedata:
 Content-Type:Content-Transfer-Encoding:MIME-Version:
 X-MS-Exchange-CrossTenant-AuthAs:
 X-MS-Exchange-CrossTenant-AuthSource:
 X-MS-Exchange-CrossTenant-Network-Message-Id:
 X-MS-Exchange-CrossTenant-originalarrivaltime:
 X-MS-Exchange-CrossTenant-fromentityheader:
 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
 X-MS-Exchange-CrossTenant-userprincipalname:
 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
 b=Vech/nBcpBA0ZKQ6k6jqRiK7AOvCxUAffwWc9K8n5U4WV16/NVy+O2zEnQKJ0Yuom
 5r9a/WfUi1arK8qpApQRk8uPHlB7FgH5usfn1Yx9Sas8TR8UWlxrHg9DGE6VKURhf+
 AibCsoHOu/XQJTeaLlBNGxzGdXIm/hvLebND0JSh6PTPN72XRyjbxXoZ4wuHbpcxVy
 P3OJsiP42P5PI7aSmKXpmjayffhh7+CiCDSvDfCU3ps9zr53ZLvYYnRq0ZG2GIGHlb
 /vvGe/s2Qkfjy2JtQrVq0qzFs7NVEqbZXqQx/8NCgmiuYIRog154q1Ed29GX+CDLak
 NlC/beku4fhAw==
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
Cc: "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "hch@infradead.org" <hch@infradead.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "jglisse@redhat.com" <jglisse@redhat.com>,
 "bskeggs@redhat.com" <bskeggs@redhat.com>, John
 Hubbard <jhubbard@nvidia.com>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQo+IEZyb206IEphc29uIEd1bnRob3JwZSA8amdnQG52aWRpYS5jb20+DQo+IFNlbnQ6IE1vbmRh
eSwgTWFyY2ggMSwgMjAyMSA5OjU2IEFNDQo+IFRvOiBBbGlzdGFpciBQb3BwbGUgPGFwb3BwbGVA
bnZpZGlhLmNvbT4NCj4gQ2M6IGxpbnV4LW1tQGt2YWNrLm9yZzsgbm91dmVhdUBsaXN0cy5mcmVl
ZGVza3RvcC5vcmc7DQo+IGJza2VnZ3NAcmVkaGF0LmNvbTsgYWtwbUBsaW51eC1mb3VuZGF0aW9u
Lm9yZzsgbGludXgtZG9jQHZnZXIua2VybmVsLm9yZzsNCj4gbGludXgta2VybmVsQHZnZXIua2Vy
bmVsLm9yZzsgZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgSm9obiBIdWJiYXJkDQo+
IDxqaHViYmFyZEBudmlkaWEuY29tPjsgUmFscGggQ2FtcGJlbGwgPHJjYW1wYmVsbEBudmlkaWEu
Y29tPjsNCj4gamdsaXNzZUByZWRoYXQuY29tOyBoY2hAaW5mcmFkZWFkLm9yZzsgZGFuaWVsQGZm
d2xsLmNoDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjMgNi84XSBtbTogU2VsZnRlc3RzIGZvciBl
eGNsdXNpdmUgZGV2aWNlIG1lbW9yeQ0KPiANCj4gT24gRnJpLCBGZWIgMjYsIDIwMjEgYXQgMDY6
MTg6MzBQTSArMTEwMCwgQWxpc3RhaXIgUG9wcGxlIHdyb3RlOg0KPiA+IEFkZHMgc29tZSBzZWxm
dGVzdHMgZm9yIGV4Y2x1c2l2ZSBkZXZpY2UgbWVtb3J5Lg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1i
eTogQWxpc3RhaXIgUG9wcGxlIDxhcG9wcGxlQG52aWRpYS5jb20+DQo+ID4gLS0tDQo+ID4gIGxp
Yi90ZXN0X2htbS5jICAgICAgICAgICAgICAgICAgICAgICAgIHwgMTI0ICsrKysrKysrKysrKysr
DQo+ID4gIGxpYi90ZXN0X2htbV91YXBpLmggICAgICAgICAgICAgICAgICAgIHwgICAyICsNCj4g
PiAgdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvdm0vaG1tLXRlc3RzLmMgfCAyMTkgKysrKysrKysr
KysrKysrKysrKysrKysrKw0KPiA+ICAzIGZpbGVzIGNoYW5nZWQsIDM0NSBpbnNlcnRpb25zKCsp
DQo+IA0KPiBQbGVhc2UgZ2V0IFJhbHBoIHRvIHJldmlldyB0aGlzLCBvdGhlcndpc2U6DQo+IA0K
PiBBY2tlZC1ieTogSmFzb24gR3VudGhvcnBlIDxqZ2dAbnZpZGlhLmNvbT4NCj4gDQo+IEphc29u
DQoNCkknbSB3b3JraW5nIG9uIGl0LiBUaGFua3MgZm9yIGVuY291cmFnZW1lbnQuIPCfmIoNCg0K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
