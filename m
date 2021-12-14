Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BFEEA473F46
	for <lists+dri-devel@lfdr.de>; Tue, 14 Dec 2021 10:23:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7678810EAA8;
	Tue, 14 Dec 2021 09:23:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2074.outbound.protection.outlook.com [40.107.94.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 938EB10EAA5;
 Tue, 14 Dec 2021 09:23:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QA8Kqa0Oa3FL912wSgJS/MB6vzVJWDv/1YVuNvoI1MTWyE49E9KGUyCGCYqLGT+aAU68t6PYqsTBLvhZ4iyFCeMRsjSQeWFZH0nB8RQe2Av5aK6t1u3TpgIWVtXQA5MOI+neOAOUBdeQfOqhGrFFXOkPWAL49wV927eLkoI5l7D4vOEFRWoO0/J1dzCSCRLk56s6dYdA7VHONXeYgQuK9qg6NrNHMhc0scu6DS90OVKGRcoBq+tEYEsDecnZ2gxvehQTw8R8xPlg6yqTSFzG607V780WwkQc73DcATu8pwdxW4cSCHo2qW8DX9sRysdsRqAmrE0pvdsQCFTHfmCf8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JLHy8mUid5JDcc3DsQdfc2Jt5QIDUt8k/NyWzqT669A=;
 b=UQOxHKb35Rpjn4wAP+EtyDOJSZV1CKyBIjMfejnO0iCterZUIaWAZD0bM2x0GDQ57nAl4Fo4oGL5FiVZeOxpsEvd1MDfIjJvEFciMojV3kO2Ax9yT1wKhtIBxES/ymVusYiRkDnZrXMiAbfoHdYNNStpdr+x8Wx4vsa98OnjwM6Jaz2wjlbB0VQhTqhpaB4yzFBf44k9jCT1kst41UyDcwoqu7T3x3vfYOAbUsEmisRLwR8ZOECyW7U00vX1PO2C/W6rZ+R91Nfm9YyqIEYpBJvBhqrmuWB64fgP0Qr7A7WwNjo+tz6SQrkX4reJuKn1itUn85vGk+8pJnogbXblgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JLHy8mUid5JDcc3DsQdfc2Jt5QIDUt8k/NyWzqT669A=;
 b=nmIg35/vsBHQu3g9c+1Wzpi0rEwsgct/dwboIL/uj/LvdOvmQa75KgOROTn/SeleJ6fTiWsJGjoOlteJ+6QLTJ7n25a71WK2CWwBaNueI/8gyb5JTMG8QR52YFjJIkEMWWwvH9ejeQtmoQoTDh4om3ZLhR2ZaxAHpOaEiYoeXOw=
Received: from DM5PR12MB2504.namprd12.prod.outlook.com (2603:10b6:4:b5::19) by
 DM5PR12MB1643.namprd12.prod.outlook.com (2603:10b6:4:11::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4778.17; Tue, 14 Dec 2021 09:23:12 +0000
Received: from DM5PR12MB2504.namprd12.prod.outlook.com
 ([fe80::5d07:e475:316c:d187]) by DM5PR12MB2504.namprd12.prod.outlook.com
 ([fe80::5d07:e475:316c:d187%5]) with mapi id 15.20.4755.027; Tue, 14 Dec 2021
 09:23:12 +0000
From: "Huang, Ray" <Ray.Huang@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Daniel
 Vetter <daniel.vetter@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>
Subject: RE: [PATCH 2/3] drm/amdgpu: fix the fence timeline null pointer
Thread-Topic: [PATCH 2/3] drm/amdgpu: fix the fence timeline null pointer
Thread-Index: AQHX7+uR9Y/+tcADg0CJ1JJm2rgQMKwxob2AgAAV5uA=
Date: Tue, 14 Dec 2021 09:23:12 +0000
Message-ID: <DM5PR12MB2504F8CDBC1758B77386AE3EEC759@DM5PR12MB2504.namprd12.prod.outlook.com>
References: <20211213063422.2232155-1-ray.huang@amd.com>
 <20211213063422.2232155-2-ray.huang@amd.com>
 <1d10af93-37f9-ad82-7498-f32e7963513b@amd.com>
In-Reply-To: <1d10af93-37f9-ad82-7498-f32e7963513b@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Enabled=true;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SetDate=2021-12-14T09:19:47Z; 
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Method=Standard;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Name=AMD Official Use
 Only-AIP 2.0;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ActionId=6102e3ae-a2dc-4ee1-a9bb-57a1d8e864db;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ContentBits=1
msip_label_88914ebd-7e6c-4e12-a031-a9906be2db14_enabled: true
msip_label_88914ebd-7e6c-4e12-a031-a9906be2db14_setdate: 2021-12-14T09:23:09Z
msip_label_88914ebd-7e6c-4e12-a031-a9906be2db14_method: Standard
msip_label_88914ebd-7e6c-4e12-a031-a9906be2db14_name: AMD Official Use
 Only-AIP 2.0
msip_label_88914ebd-7e6c-4e12-a031-a9906be2db14_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_88914ebd-7e6c-4e12-a031-a9906be2db14_actionid: c3ce0de7-19d0-4205-a528-2f8c64546f09
msip_label_88914ebd-7e6c-4e12-a031-a9906be2db14_contentbits: 0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 71f4059a-c0bb-4194-f4f4-08d9bee35a16
x-ms-traffictypediagnostic: DM5PR12MB1643:EE_
x-microsoft-antispam-prvs: <DM5PR12MB1643CC3316F5FB127F01D9C7EC759@DM5PR12MB1643.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2887;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wqCeut9BrsFwM+HWyGKwQRebtJYnIU3a2dKmyJj6gvUbP3q5ug+cQ3UgX++iQdRDLUNKwvvZqxmZuXnN2TOjttquTU0FEUojfGXGHx4eY1/kVWZs84tkMpvtaKTwKXVUAW5gmqMD8C2UBxav4XI5lyDIW7bkUKrmXbSsN4TTG+c+EP0vzkF2xjTjpLB9clPunt3mW7aI+cBjqsN1Atle5hSaec3yylcClUiK4GtZnL79Mcyn9Q4BhsqUrLBZQy7kZQQfqO4bjbx4fdQvIkIG+a3znwZgHMpdwDAtJLhta8e1x+p8eO6LDdaC78zfYiH7Y1CjcN8tiIPGGGSzBJLBa6t4yGvmaTTh+K++AMKJFkDttK6RxWYroF8ufheHntPF1wI7vO5kulILY0MT66A55Yaze4FGzBnEEAZ+am7TdF4iD0YNITuBBt31IY68d4BNXrZBuSIpNKqkSz3OZ3KImv/843VljD/K/QNiaxcoHHQKUPJ5w59rtq6bHZ3KWN8YbVDjFMx3ooCYN+OL0/Vk0msP4fkQG5KH+Hljl1FwY4NUwhToaSAKx5sE7r/JeTOQqFa1LaBbBb1TO5RF77U3kJAAlG2/GZ+hs1DvG50295BryQ59ZMCeQfFZx23Th8E/G+idWsXMs6GcBoyPJM418xPkHmpcNJEnglDImfoPc54DAm/QTI/xmjLFpTtfQmuM44jGVKcXOskyKG0NxYi+XQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB2504.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(9686003)(4326008)(55016003)(7696005)(110136005)(71200400001)(53546011)(6506007)(508600001)(54906003)(66476007)(83380400001)(66446008)(64756008)(66556008)(66946007)(76116006)(38070700005)(33656002)(86362001)(2906002)(8676002)(8936002)(186003)(52536014)(122000001)(38100700002)(26005)(5660300002)(316002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?emxVdkd2TU1iQmZlTlpoWnU4a1JVbnFSejF3REFydk0xeVdjdmVSV1Zid2Zm?=
 =?utf-8?B?M3hra0laOTdZSFdZMFBXTlM3Y1dJazdVeWN5WGFUbE14NzlQN1dzVm1JTmZp?=
 =?utf-8?B?QlJoRWxKZVladWRDK0NTNlpDcHczUGxIdjJRSndzRnNGNEZQWHdLYnRzS3o1?=
 =?utf-8?B?b2VaMDFNMzJGVGhDUnYySzZESVRSTFNNR1dNNzM2L3hlU005ekFNV3ZSUkhS?=
 =?utf-8?B?MHpIeW1tZVl1UVQ5M1gwTWJVWW5zK0dVYWYwN2FCZUoxdUtvVzllSjlNQUVV?=
 =?utf-8?B?UFJ2MWJTK2c0cmpPOTIrMFF0RUZqLzNyWDlETkNMZ0l2bnVBNXEzS0Y3U3BU?=
 =?utf-8?B?dFppRzlCRWhGNFF0QVBjT2VUK09Zc3FoNkJmYnJJbk9BSG8wcGdZeXdVREg1?=
 =?utf-8?B?L3ZsMUZnTTdtOG1SekZFb0NBV3RubVo4Z05uOEk5N25CTUxlTHl5VldMeDM5?=
 =?utf-8?B?YlR4ZnZ0N2lwUzVQUUlxa2MvZFF5NjZISUlyMEZCSDY4Ri9vUkJSbTZFckZQ?=
 =?utf-8?B?bXpId1VlYm5SUWVaWTErV2hSM2JYL0M2TzFjUUNNRzdxenN5alA3MmJKams3?=
 =?utf-8?B?MDl5dnVUZnZwTTI4T21Fb0ttN2R1N2lqV3RwYUo2SGRVQWZ0N2lrTGlKNVdx?=
 =?utf-8?B?VUhGWjQrdnd6TktUbnVISnBCdWNIaTJ5bUE1VHdFZDlwc0lqZ0p6d0FkUURI?=
 =?utf-8?B?QytzZEx6OUJ2ck5SNnhkalV0ZWNkb29JcFdpck9WVk03dmh2VUx2MFhtaHVO?=
 =?utf-8?B?bE4yU1c2T3dNT0FibTh6Z2l2UVNIWGVCVC9xRkorQVlWSUpkZEM0UW5icDM2?=
 =?utf-8?B?SExrcHo4YWNhN1lvMEhCUEU0cERwWk1pYmFWbGVLaUEwZVZITGtNWXExL1Bz?=
 =?utf-8?B?bDJXRkthZmZ0MzRPaUVDK3JBNE56MHlzYWJBTm1Wb0pzMENKRmVrK1NpU3hS?=
 =?utf-8?B?OUMwZFp6UHQ1RlRrTERFRjlsRm05OWNIV1BhZ0twUUQ0NXhLd1dFc0kyVUNt?=
 =?utf-8?B?V25zeHJlc09pZCtRdHhjeWh0aFlsS0VldWhvZnhsNnYwUk9qUlNYUnUwaDF0?=
 =?utf-8?B?Rzg0dko5TW5JK3pwWnN2SG45U0tERndEQXV2MjAzUTNjOVpUczJaZUZWQU5V?=
 =?utf-8?B?Y0c4TDdCUm5vTUdWaXhEWHlJejVpZ3VwWU10THZBamJRanJDVGJxMWYzUkZN?=
 =?utf-8?B?SUNtWlYyL3NuRnJDTUtWMlJFV2cyeUlycXJlZUtEWGk1bm1YbEhrUDJqZC8v?=
 =?utf-8?B?MmRBMmNWWmpTYWVwNzNJeE0xRzVBWUJzOU5aV3ozalJoT0tJOW1PRDVyeGhq?=
 =?utf-8?B?TDkzNkt3QWhjeEZsN1NucjNJS284bk11NnRQazY0d0g5MmdIZ25seTBQWnVq?=
 =?utf-8?B?NEpGNS9iOW0vV2JESDFqYXc1MDZmWHByR042MHVnTVNhZ0hLYVBIcGR1V2tx?=
 =?utf-8?B?cE4yd2tpSHRhcTRkYXhuTEdMbGlCS2JpNS9uQ1Z4cWw1aTRxbHg2bXIzeDRk?=
 =?utf-8?B?Q0N1UkI5WUtxZGpVNGhEWEVKQXBFZVZ0QlAwT1h0SjliTVNqdVRJT3ZQYjVU?=
 =?utf-8?B?MmFhWjlrOU4vbGtsOXBjNXpnVDN3MlVwQ0FQWExIc3RYeG1hdmVmckRua2pI?=
 =?utf-8?B?Y3ZmV09lZlJYWVhiMWJVQUpjZTkzcGpZS3RGVUlDKzZFczN2dVk1aFRmMHBJ?=
 =?utf-8?B?L2kwRy9oSEQza1pwMmdrSm5LdTlkak1OejBncDhSaFBNUSthSnl3ellSaDVF?=
 =?utf-8?B?bDlaM0lCbFhMa0IwU0JqeXVGQlhHc3F2MzFlanBpa2V0b054TmV0dVVUQm9Y?=
 =?utf-8?B?YXB1T3FyQ2NsZjltSzlqdjBqaXdzT1hON01lVGdvTW52c25FaXc3S1phakN2?=
 =?utf-8?B?OTlUMHNJMGt3Zk5WRDZsenBwTVg3TkJ3OGNvYzNmV0t3T3A2Rk90U0RtRXEz?=
 =?utf-8?B?SlVRNUhCSHdRRkxQYWtFeHJUZWFEK3hLRjhIUUMzRlpMQXZvZC9sYzVKQURv?=
 =?utf-8?B?cUl4eFF2QjVtb3BKT1lxMVo1VHlHU0lIc1kyV3I0WHY0Mks5UzFOS1dONnJm?=
 =?utf-8?B?UC9ra2RpQ2FKYzZIVGt3cmd3QVpRSlBRR2R6RmVjM01tcnU5cWxkV1lNbHNF?=
 =?utf-8?B?cGZXcGQwbk1pendzaXhHclppbms4TEkwSFJRdmcyeWhIb2ZOVHFFSklwblJG?=
 =?utf-8?Q?OCC1M/yGEnc/WZmRFxWamqg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB2504.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71f4059a-c0bb-4194-f4f4-08d9bee35a16
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Dec 2021 09:23:12.7318 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ywK7YGMDt3mc6aRKLF/SzEcRculr2HObnjfVHh/ZwB6jSb+RESEwXBJ6PXgeH4iwSBvGSZuLhKL9jZyBu2VEgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1643
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
Cc: "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Liu, Monk" <Monk.Liu@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

W0FNRCBPZmZpY2lhbCBVc2UgT25seV0NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0K
PiBGcm9tOiBLb2VuaWcsIENocmlzdGlhbiA8Q2hyaXN0aWFuLktvZW5pZ0BhbWQuY29tPg0KPiBT
ZW50OiBUdWVzZGF5LCBEZWNlbWJlciAxNCwgMjAyMSA0OjAxIFBNDQo+IFRvOiBIdWFuZywgUmF5
IDxSYXkuSHVhbmdAYW1kLmNvbT47IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7DQo+
IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+OyBTdW1pdCBTZW13YWwNCj4g
PHN1bWl0LnNlbXdhbEBsaW5hcm8ub3JnPg0KPiBDYzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmc7IGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZzsgRGV1Y2hlciwNCj4gQWxleGFuZGVy
IDxBbGV4YW5kZXIuRGV1Y2hlckBhbWQuY29tPjsgTGl1LCBNb25rDQo+IDxNb25rLkxpdUBhbWQu
Y29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDIvM10gZHJtL2FtZGdwdTogZml4IHRoZSBmZW5j
ZSB0aW1lbGluZSBudWxsIHBvaW50ZXINCj4gDQo+IEFtIDEzLjEyLjIxIHVtIDA3OjM0IHNjaHJp
ZWIgSHVhbmcgUnVpOg0KPiA+IEluaXRpYWxpemUgdGhlIGZsYWdzIGZvciBlbWJlZGRlZCBmZW5j
ZSBpbiB0aGUgam9iIGF0IGRtYV9mZW5jZV9pbml0KCkuDQo+ID4gT3RoZXJ3aXNlLCB3ZSB3aWxs
IGdvIGEgd3Jvbmcgd2F5IGluIGFtZGdwdV9mZW5jZV9nZXRfdGltZWxpbmVfbmFtZQ0KPiA+IGNh
bGxiYWNrIGFuZCB0cmlnZ2VyIGEgbnVsbCBwb2ludGVyIHBhbmljIG9uY2Ugd2UgZW5hYmxlZCB0
aGUgdHJhY2UNCj4gPiBldmVudCBoZXJlLg0KPiA+DQo+ID4gWyAgMTU2LjEzMTc5MF0gQlVHOiBr
ZXJuZWwgTlVMTCBwb2ludGVyIGRlcmVmZXJlbmNlLCBhZGRyZXNzOg0KPiA+IDAwMDAwMDAwMDAw
MDAyYTAgWyAgMTU2LjEzMTgwNF0gI1BGOiBzdXBlcnZpc29yIHJlYWQgYWNjZXNzIGluIGtlcm5l
bA0KPiA+IG1vZGUgWyAgMTU2LjEzMTgxMV0gI1BGOiBlcnJvcl9jb2RlKDB4MDAwMCkgLSBub3Qt
cHJlc2VudCBwYWdlIFsNCj4gPiAxNTYuMTMxODE3XSBQR0QgMCBQNEQgMCBbICAxNTYuMTMxODI0
XSBPb3BzOiAwMDAwIFsjMV0gUFJFRU1QVCBTTVAgUFRJDQo+ID4gWyAgMTU2LjEzMTgzMl0gQ1BV
OiA2IFBJRDogMTQwNCBDb21tOiBzZG1hMCBUYWludGVkOiBHICAgICAgICAgICBPRSAgICAgNS4x
Ni4wLQ0KPiByYzEtY3VzdG9tICMxDQo+ID4gWyAgMTU2LjEzMTg0Ml0gSGFyZHdhcmUgbmFtZTog
R2lnYWJ5dGUgVGVjaG5vbG9neSBDby4sIEx0ZC4NCj4gPiBaMTcwWFAtU0xJL1oxNzBYUC1TTEkt
Q0YsIEJJT1MgRjIwIDExLzA0LzIwMTYgWyAgMTU2LjEzMTg0OF0gUklQOg0KPiA+IDAwMTA6c3Ry
bGVuKzB4MC8weDIwIFsgIDE1Ni4xMzE4NTldIENvZGU6IDg5IGMwIGMzIDBmIDFmIDgwIDAwIDAw
IDAwDQo+ID4gMDAgNDggMDEgZmUgZWIgMGYgMGYgYjYgMDcgMzggZDAgNzQgMTAgNDggODMgYzcg
MDEgODQgYzAgNzQgMDUgNDggMzkNCj4gPiBmNyA3NSBlYyAzMSBjMCBjMyA0OCA4OSBmOCBjMyA8
ODA+IDNmIDAwIDc0IDEwIDQ4IDg5IGY4IDQ4IDgzIGMwIDAxIDgwDQo+ID4gMzggMDAgNzUgZjcg
NDggMjkgZjggYzMgMzEgWyAgMTU2LjEzMTg3Ml0gUlNQOiAwMDE4OmZmZmY5YmQwMDE4ZGJjZjgN
Cj4gPiBFRkxBR1M6IDAwMDEwMjA2IFsgIDE1Ni4xMzE4ODBdIFJBWDogMDAwMDAwMDAwMDAwMDJh
MCBSQlg6DQo+ID4gZmZmZjhkMDMwNWVmMDFiMCBSQ1g6IDAwMDAwMDAwMDAwMDAwMGIgWyAgMTU2
LjEzMTg4OF0gUkRYOg0KPiA+IGZmZmY4ZDAzNzcyYWI5MjQgUlNJOiBmZmZmOGQwMzA1ZWYwMWIw
IFJESTogMDAwMDAwMDAwMDAwMDJhMCBbDQo+ID4gMTU2LjEzMTg5NV0gUkJQOiBmZmZmOWJkMDAx
OGRiZDYwIFIwODogZmZmZjhkMDMwMDIwOTRkMCBSMDk6DQo+ID4gMDAwMDAwMDAwMDAwMDAwMCBb
ICAxNTYuMTMxOTAxXSBSMTA6IDAwMDAwMDAwMDAwMDAwNWUgUjExOg0KPiA+IDAwMDAwMDAwMDAw
MDAwNjUgUjEyOiBmZmZmOGQwMzAwMjA5NGQwIFsgIDE1Ni4xMzE5MDddIFIxMzoNCj4gPiAwMDAw
MDAwMDAwMDAwMDFmIFIxNDogMDAwMDAwMDAwMDA3MDAxOCBSMTU6IDAwMDAwMDAwMDAwMDAwMDcg
Ww0KPiA+IDE1Ni4xMzE5MTRdIEZTOiAgMDAwMDAwMDAwMDAwMDAwMCgwMDAwKSBHUzpmZmZmOGQw
NjJlZDgwMDAwKDAwMDApDQo+ID4ga25sR1M6MDAwMDAwMDAwMDAwMDAwMCBbICAxNTYuMTMxOTIz
XSBDUzogIDAwMTAgRFM6IDAwMDAgRVM6IDAwMDAgQ1IwOg0KPiAwMDAwMDAwMDgwMDUwMDMzIFsg
IDE1Ni4xMzE5MjldIENSMjogMDAwMDAwMDAwMDAwMDJhMCBDUjM6DQo+IDAwMDAwMDAwMTEyMGEw
MDUgQ1I0OiAwMDAwMDAwMDAwMzcwNmUwIFsgIDE1Ni4xMzE5MzddIERSMDoNCj4gMDAwMDAwMDAw
MDAwMDAwMCBEUjE6IDAwMDAwMDAwMDAwMDAwMDAgRFIyOiAwMDAwMDAwMDAwMDAwMDAwDQo+IFsg
IDE1Ni4xMzE5NDJdIERSMzogMDAwMDAwMDAwMDAwMDAwMCBEUjY6IDAwMDAwMDAwZmZmZTBmZjAg
RFI3Og0KPiAwMDAwMDAwMDAwMDAwNDAwIFsgIDE1Ni4xMzE5NDldIENhbGwgVHJhY2U6DQo+ID4g
WyAgMTU2LjEzMTk1M10gIDxUQVNLPg0KPiA+IFsgIDE1Ni4xMzE5NTddICA/IHRyYWNlX2V2ZW50
X3Jhd19ldmVudF9kbWFfZmVuY2UrMHhjYy8weDIwMA0KPiA+IFsgIDE1Ni4xMzE5NzNdICA/IHJp
bmdfYnVmZmVyX3VubG9ja19jb21taXQrMHgyMy8weDEzMA0KPiA+IFsgIDE1Ni4xMzE5ODJdICBk
bWFfZmVuY2VfaW5pdCsweDkyLzB4YjAgWyAgMTU2LjEzMTk5M10NCj4gPiBhbWRncHVfZmVuY2Vf
ZW1pdCsweDEwZC8weDJiMCBbYW1kZ3B1XSBbICAxNTYuMTMyMzAyXQ0KPiA+IGFtZGdwdV9pYl9z
Y2hlZHVsZSsweDJmOS8weDU4MCBbYW1kZ3B1XSBbICAxNTYuMTMyNTg2XQ0KPiA+IGFtZGdwdV9q
b2JfcnVuKzB4ZWQvMHgyMjAgW2FtZGdwdV0NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEh1YW5n
IFJ1aSA8cmF5Lmh1YW5nQGFtZC5jb20+DQo+ID4gLS0tDQo+ID4gICBkcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfZmVuY2UuYyB8IDE3ICsrKysrKysrKy0tLS0tLS0tDQo+ID4gICAx
IGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9mZW5jZS5jDQo+
ID4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZmVuY2UuYw0KPiA+IGluZGV4
IDNiN2U4NmVhNzE2Ny4uZTJhYTcxOTA0Mjc4IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9mZW5jZS5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X2ZlbmNlLmMNCj4gPiBAQCAtNzYsNyArNzYsNyBAQCB2b2lkIGFt
ZGdwdV9mZW5jZV9zbGFiX2Zpbmkodm9pZCkNCj4gPiAgIC8qDQo+ID4gICAgKiBDYXN0IGhlbHBl
cg0KPiA+ICAgICovDQo+ID4gLXN0YXRpYyBjb25zdCBzdHJ1Y3QgZG1hX2ZlbmNlX29wcyBhbWRn
cHVfZmVuY2Vfb3BzOw0KPiA+ICtzdGF0aWMgc3RydWN0IGRtYV9mZW5jZV9vcHMgYW1kZ3B1X2Zl
bmNlX29wczsNCj4gPiAgIHN0YXRpYyBpbmxpbmUgc3RydWN0IGFtZGdwdV9mZW5jZSAqdG9fYW1k
Z3B1X2ZlbmNlKHN0cnVjdCBkbWFfZmVuY2UNCj4gKmYpDQo+ID4gICB7DQo+ID4gICAJc3RydWN0
IGFtZGdwdV9mZW5jZSAqX19mID0gY29udGFpbmVyX29mKGYsIHN0cnVjdCBhbWRncHVfZmVuY2Us
DQo+ID4gYmFzZSk7IEBAIC0xNTgsMjEgKzE1OCwyMiBAQCBpbnQgYW1kZ3B1X2ZlbmNlX2VtaXQo
c3RydWN0DQo+IGFtZGdwdV9yaW5nICpyaW5nLCBzdHJ1Y3QgZG1hX2ZlbmNlICoqZiwgc3RydWN0
IGFtZA0KPiA+ICAgCX0NCj4gPg0KPiA+ICAgCXNlcSA9ICsrcmluZy0+ZmVuY2VfZHJ2LnN5bmNf
c2VxOw0KPiA+IC0JaWYgKGpvYiAhPSBOVUxMICYmIGpvYi0+am9iX3J1bl9jb3VudGVyKSB7DQo+
ID4gKwlpZiAoam9iICYmIGpvYi0+am9iX3J1bl9jb3VudGVyKSB7DQo+ID4gICAJCS8qIHJlaW5p
dCBzZXEgZm9yIHJlc3VibWl0dGVkIGpvYnMgKi8NCj4gPiAgIAkJZmVuY2UtPnNlcW5vID0gc2Vx
Ow0KPiA+ICsJCXNldF9iaXQoQU1ER1BVX0ZFTkNFX0ZMQUdfRU1CRURfSU5fSk9CX0JJVCwNCj4g
JmZlbmNlLT5mbGFncyk7DQo+ID4gICAJfSBlbHNlIHsNCj4gPiArCQlhbWRncHVfZmVuY2Vfb3Bz
LmluaXRfZmxhZ3MgPSAwOw0KPiA+ICsJCWlmIChqb2IpDQo+ID4gKwkJCXNldF9iaXQoQU1ER1BV
X0ZFTkNFX0ZMQUdfRU1CRURfSU5fSk9CX0JJVCwNCj4gPiArCQkJCSZhbWRncHVfZmVuY2Vfb3Bz
LmluaXRfZmxhZ3MpOw0KPiANCj4gVGhhdCBpcyB1dHRlcmx5IG5vbnNlbnNlLiBUaGUgYW1kZ3B1
X2ZlbmNlX29wcyBhcmUgZ2xvYmFsIGFuZCBjYW4ndCBiZQ0KPiBtb2RpZmllZCBsaWtlIHRoYXQu
DQo+IA0KDQpQbGVhc2UgY2hlY2sgdGhlIHJlcGx5IGluIHBhdGNoMSwgd2UgbmVlZCBpbml0aWFs
aXplIHRoZSBmZW5jZSBhbmQgYXNzaWduIHRoZSBmbGFncyB0b2dldGhlciwgb3RoZXJ3aXNlIGl0
IHdpbGwgdHJpZ2dlciB0aGUgcGFuaWMgb25jZSB0aGUgdHJhY2UgZXZlbnQgaXMgZW5hYmxlZC4N
Cg0KVGhhbmtzLA0KUmF5DQoNCj4gQ2hyaXN0aWFuLg0KPiANCj4gPiArDQo+ID4gICAJCWRtYV9m
ZW5jZV9pbml0KGZlbmNlLCAmYW1kZ3B1X2ZlbmNlX29wcywNCj4gPiAgIAkJCQkmcmluZy0+ZmVu
Y2VfZHJ2LmxvY2ssDQo+ID4gICAJCQkJYWRldi0+ZmVuY2VfY29udGV4dCArIHJpbmctPmlkeCwN
Cj4gPiAgIAkJCQlzZXEpOw0KPiA+ICAgCX0NCj4gPg0KPiA+IC0JaWYgKGpvYiAhPSBOVUxMKSB7
DQo+ID4gLQkJLyogbWFyayB0aGlzIGZlbmNlIGhhcyBhIHBhcmVudCBqb2IgKi8NCj4gPiAtCQlz
ZXRfYml0KEFNREdQVV9GRU5DRV9GTEFHX0VNQkVEX0lOX0pPQl9CSVQsDQo+ICZmZW5jZS0+Zmxh
Z3MpOw0KPiA+IC0JfQ0KPiA+IC0NCj4gPiAgIAlhbWRncHVfcmluZ19lbWl0X2ZlbmNlKHJpbmcs
IHJpbmctPmZlbmNlX2Rydi5ncHVfYWRkciwNCj4gPiAgIAkJCSAgICAgICBzZXEsIGZsYWdzIHwg
QU1ER1BVX0ZFTkNFX0ZMQUdfSU5UKTsNCj4gPiAgIAlwbV9ydW50aW1lX2dldF9ub3Jlc3VtZShh
ZGV2X3RvX2RybShhZGV2KS0+ZGV2KTsNCj4gPiBAQCAtNzIwLDcgKzcyMSw3IEBAIHN0YXRpYyB2
b2lkIGFtZGdwdV9mZW5jZV9yZWxlYXNlKHN0cnVjdA0KPiBkbWFfZmVuY2UgKmYpDQo+ID4gICAJ
Y2FsbF9yY3UoJmYtPnJjdSwgYW1kZ3B1X2ZlbmNlX2ZyZWUpOw0KPiA+ICAgfQ0KPiA+DQo+ID4g
LXN0YXRpYyBjb25zdCBzdHJ1Y3QgZG1hX2ZlbmNlX29wcyBhbWRncHVfZmVuY2Vfb3BzID0gew0K
PiA+ICtzdGF0aWMgc3RydWN0IGRtYV9mZW5jZV9vcHMgYW1kZ3B1X2ZlbmNlX29wcyA9IHsNCj4g
PiAgIAkuZ2V0X2RyaXZlcl9uYW1lID0gYW1kZ3B1X2ZlbmNlX2dldF9kcml2ZXJfbmFtZSwNCj4g
PiAgIAkuZ2V0X3RpbWVsaW5lX25hbWUgPSBhbWRncHVfZmVuY2VfZ2V0X3RpbWVsaW5lX25hbWUs
DQo+ID4gICAJLmVuYWJsZV9zaWduYWxpbmcgPSBhbWRncHVfZmVuY2VfZW5hYmxlX3NpZ25hbGlu
ZywNCg==
