Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41862395B17
	for <lists+dri-devel@lfdr.de>; Mon, 31 May 2021 15:08:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F3846E4AF;
	Mon, 31 May 2021 13:08:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2052.outbound.protection.outlook.com [40.107.92.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 691406E934;
 Mon, 31 May 2021 13:08:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lvyRUPVdOhbkfOZnm+evIn6JVMHSdZraKYeLqGhC13TcOcRzbZ5p0ZCZTnNlUNUzjzueUo5wF787o0kYHJJWfcuUsnuiGva9nkla/DnBnxJoYzKB2qAFExFQlp0kTD6JRvZXHdF6sxj261SOIx+peJVh9ogkfDhh2mGD6cgP7kwAYxlLzUEObd4+eTTngoygnutjsYPnWywIDr0zvUcK+G8IYFMOdaIspQ8TJSa01+VnL0xuCVyAUvVDSekczQH3AdLLhkT24fYm01i5BVyUCMqwuUgTQ3N+x+WBf2cSNA5tMCc9WO8eah1jXP+MFnAuibrGzGiHiwHQJbfwsiVT5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BNrTOUDUo4gaMz/Fg8pzmexhB6LbKxeInacBoLuaLSE=;
 b=C5fywWrMlZ6NZdWj2cDD1TjU+JC/Y+G0vQGYNFNhSQWp4PMO6eDpgwx4vssRTXPF5dWbSkSXhrOe87BbnrJTPkDTVdY2URHhfNnElPYzcIMXvy9m/0ZxT2sDgWYrFfsEUWZEZ+Qd8EFiXhTT57Kt27mVHFuY3NjEIFgMsfLo6SHAw62DG+ljOvkFNGZshxYLXLZZ0uYIN76JKLV4IM3P2bAIzZc9Mu2aEP0fdL7yhVdVjC+ko+MxEVkVuhQ1TK7qIMEtBHgfQIN6y0p4SN+mfdDKhoq4TfV92+ZtyrxcgqA9sREbhP7D5BEq81BHkcVV5ajp3f0VHkvykju4xITc/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BNrTOUDUo4gaMz/Fg8pzmexhB6LbKxeInacBoLuaLSE=;
 b=iJ1TorAi9HDsZWIxThpLpsCH5ZTERHcBk+SZN/CrI8RDfuJwbUCUB10QFvV7VtMNWhtWE4J/swGUIpB1txCXQzByvb+rWrXgB69gsj0MlwudGBgXVcOzW0j1JklXtGZ5bu1bzgeWI5pQcz0it49ZhwXG+JTJBCy0rv2hGUM0M2I=
Received: from DM6PR12MB4250.namprd12.prod.outlook.com (2603:10b6:5:21a::9) by
 DM5PR12MB1516.namprd12.prod.outlook.com (2603:10b6:4:5::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.20; Mon, 31 May 2021 13:08:47 +0000
Received: from DM6PR12MB4250.namprd12.prod.outlook.com
 ([fe80::a4b1:38b7:ec94:8003]) by DM6PR12MB4250.namprd12.prod.outlook.com
 ([fe80::a4b1:38b7:ec94:8003%8]) with mapi id 15.20.4173.030; Mon, 31 May 2021
 13:08:47 +0000
From: "Yu, Lang" <Lang.Yu@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH v2 2/2] drm/ttm: check with temporary GTT memory in BO
 validation
Thread-Topic: [PATCH v2 2/2] drm/ttm: check with temporary GTT memory in BO
 validation
Thread-Index: AQHXVhB2iqV3yNChikqGRkip1SBlTKr9e02AgAASLJA=
Date: Mon, 31 May 2021 13:08:47 +0000
Message-ID: <DM6PR12MB4250D88CBA7BFB3427365755FB3F9@DM6PR12MB4250.namprd12.prod.outlook.com>
References: <20210531113054.2477-1-Lang.Yu@amd.com>
 <263e38ea-b7de-5171-56cd-9e8cec337f51@amd.com>
In-Reply-To: <263e38ea-b7de-5171-56cd-9e8cec337f51@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Enabled=true;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SetDate=2021-05-31T13:08:41Z; 
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Method=Standard;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Name=AMD Official Use
 Only-AIP 2.0;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ActionId=a11e609c-2bfb-4055-8f5e-b052d19d9d02;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ContentBits=1
authentication-results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
x-originating-ip: [61.152.201.147]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b4db566a-5116-4bbc-499d-08d9243539e4
x-ms-traffictypediagnostic: DM5PR12MB1516:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB1516D5F8E735B85B1CFF79A6FB3F9@DM5PR12MB1516.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Q/YF/nWRMRBDlaP/yginQ6S5fS9LM1ab+2i3lJ3+qwuBaYEdvACqMEvt+tExWfu3iHLmufB5PsrQrcnOHsTpvgD84Abq/dW35SGZE0/+003rtC/lFpRZG8T7edbqm+p94uL8G34S4MHeRsXrnCU331yAg4sl3Hk7i/J9IQ2yY8wc/nMs6G4RyUfY1xLPWVlC6PI98VVze9mO7Je4oBzB2gbX6i3IrNq3uW4P3toLkPmrksFHZDoEJj+wVm0xdk1sY4ZtFBZns6rVloOlIBfABopGTDOhuiL0EbDIBwuI23AzeaTDk7ftYK2cPj/ONNh82E4o6Ek2T7gIEgXqz1LDt5AfKkCbQaxdNanS0LdESlPnWy9YE6aQUVPQMVZnWe5yERhS9GC6A+u20PuD2IRlnZ4ewRyROP0xsJuO+5ud3VZO780ClmX5e1H5sg8xfwQfFy21f3D3tZUFjmR9Nf7h8Jf8FN5dH7fMIlTTeXvQnoxUEmw4e3mG8/6CuL8v8waMUNklhSgB5m8AM2R9azMSSMFqEcgMCdNBSWwoFdjMdtk3mDl+4lc6mr5Oy6EPt2Iv09fMUGFzt+t9VUduhGlNK6ATDtiPwDMez2sH2hzAS7k=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4250.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39860400002)(376002)(396003)(366004)(136003)(38100700002)(122000001)(83380400001)(86362001)(55016002)(8936002)(8676002)(186003)(71200400001)(478600001)(316002)(5660300002)(7696005)(4326008)(52536014)(26005)(6506007)(76116006)(2906002)(66446008)(64756008)(66476007)(66946007)(33656002)(110136005)(54906003)(66556008)(9686003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?cW5PcExUQm1heDlUdHRXVFVKZm41SGpsY1Z6S1QwVWdIblhQNkxDWVo3K0p2?=
 =?utf-8?B?RXVzQmpQS3RVV1JqeUplRW1TM0h0cUVQVGQwRm5mNFk2ZnVWNXZvTVJibXlH?=
 =?utf-8?B?NGJldEhYd1BUditlMU53ZWJ3ZUdtNkRDWHJ3YzJYbWJVOC9RUUExL0V6bFk3?=
 =?utf-8?B?QUVSQmhoNHZlazZqaTc0R0xjb2RGODFpWFg2U3plc3dhZThndHFoc3Vwb0dU?=
 =?utf-8?B?OW9MQzJCUmxpdlZkQnlpdTgyY3dyU09wNVJyNnJYK05ObmF5a3paZVdFVjZS?=
 =?utf-8?B?R2pURkY3T3F2NHRBQzRSRVprQzJ3eVBWL1RoWEdCS3dRUWxJY0xqMStoYnpQ?=
 =?utf-8?B?T3NkR0RjaStWNjl0dlRWbzU5b0JTZ3FNV0c5WW8xOTJhN21URTk1VDlJTFBx?=
 =?utf-8?B?cy83Z0tkb0t5a3Z4TzFEaTNmNXE1dFVqZUNIbnZuQW45akM4aTJpT2hEb0k0?=
 =?utf-8?B?NEttcytyNVZmYmJYSWhVNkgzK2EyWXVtZXBsVDBEajRlVGp3eU1FRnlaMzFV?=
 =?utf-8?B?Um9iT3hZZ2lNSkdJd0N5RTd1RVRsVkUwOVhlMUtiRXEwUysxQ1FidTR1NExN?=
 =?utf-8?B?ckpYMlFFc0s5WGVLSmRkdkdncWxmczJlVkovR2Y3Vm12c014TEMwKzVXcU5m?=
 =?utf-8?B?dTJRNURWV2ZpQ2dvdVI1TXBXeWFoNDVPVUZ2ajUzaitzeFhMazVKOW9oOVBF?=
 =?utf-8?B?dGJlZjN0YXpRVnJPbU81amg3eURQUXQ0S3N4U3hySmUvK05RbnpGY0hGd005?=
 =?utf-8?B?cHM5RjBZb1BuempmRjB6RnRKS0Vqa2JuUVY1VVc5czFHNkQzcmNrUG1uY3VK?=
 =?utf-8?B?aFY2L2tjanlLZENjTEo5S0JvaU02VEZCZ3FKZ3dlcllVaVY3MnZUQmZwbHFC?=
 =?utf-8?B?SFQvS3ZJK3hWcG8yMENTeWg3bTFoWTJKZjErcFY5MFB1eUoyRFBRbWQ2OFo1?=
 =?utf-8?B?bjdjWW1tWHhqZ3VGRFVjQUQ2QU5JWmw4bEhCNElMWTJya0s3T3hONCtnUklD?=
 =?utf-8?B?aDJwYmt2Vk11Y0owb1dLY3NIQml5cG9hdXBzVmdFRlVHYk1oTjF2Z2hjeGFj?=
 =?utf-8?B?Q2I2WFl0dWRDM0FuZ3NyT1lHSytxOW53c252eFYyYk1pT3hXU2h5cWxQZXlQ?=
 =?utf-8?B?RmdWVVJjNTI0ZVJCT2pPRGhJZ1dMdXR0em1ONnA3K2FmZ3hhRllGUlVvblov?=
 =?utf-8?B?b3Rvc3NEM3dGWGpMZkgzZWRrWjN1WTVJRTBXRXozT09uNVdXeHRjRzIrUGFV?=
 =?utf-8?B?SUhORDF0ZkVnc1hVeUdmSXowaEZ2WHNoSERNOU84ZXdDbGRqdmgxd1pkckR3?=
 =?utf-8?B?VER5dUQ2eWN2UEVqQ1NiVGhCSnNMdmUrS2JlNUxtNjEwVXAvZGIxdVk1MndQ?=
 =?utf-8?B?Q0hzVzU1bHVpckIyUHQ1QUUzWGhEcXFCZEpCY0JLZTFCbW9JSTJEN09xWlBi?=
 =?utf-8?B?TGYyaGtXY0hpRG1LUmtqSmpnUE12eWVUSlBHSW42SlZQTlk5NE9leml5alFN?=
 =?utf-8?B?MEVKYVJxM0RQUnVPOVIwYlZSeTlBaWg4L2tpVUw0SmFFeHVrcyt1OXhrSUcw?=
 =?utf-8?B?V0NHZUVDTWdDZTRaSmNDVy80NG5QZ2V4VlBuQ3ZpT1JDS0N4UUI0ZE9CUTds?=
 =?utf-8?B?M0FkYmZkL24xaEJ4ZXREYitUWU8rU3hpWEtZeHdjeTRyZWpCQmRNUGUrNG40?=
 =?utf-8?B?WERWQ3d1ejVITFk4OHN6ZjB4WDdSUE5FbWRMTUh3bytHTStmemZHRURmOUEv?=
 =?utf-8?Q?C6q+bmkecC8QyZ39MtXOBM6k7KZXN1KvMUUeOyT?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4250.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4db566a-5116-4bbc-499d-08d9243539e4
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 May 2021 13:08:47.2286 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mZEZXutAYT4yW3TlFOuXS5MqRBbyhR159r/0uVWJYXMn6k60ZMc+txJAsqovYhwBQY5bHWuiaZXlKnp9zi5S5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1516
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtg==?= <thomas_os@shipmail.org>, "Huang,
 Ray" <Ray.Huang@amd.com>, "Olsak, Marek" <Marek.Olsak@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

W0FNRCBPZmZpY2lhbCBVc2UgT25seV0NCg0KDQoNCj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0t
LQ0KPkZyb206IEtvZW5pZywgQ2hyaXN0aWFuIDxDaHJpc3RpYW4uS29lbmlnQGFtZC5jb20+DQo+
U2VudDogTW9uZGF5LCBNYXkgMzEsIDIwMjEgNzo1NSBQTQ0KPlRvOiBZdSwgTGFuZyA8TGFuZy5Z
dUBhbWQuY29tPjsgYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGRyaS0NCj5kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcNCj5DYzogVGhvbWFzIEhlbGxzdHLDtiA8dGhvbWFzX29zQHNo
aXBtYWlsLm9yZz47IE9sc2FrLCBNYXJlaw0KPjxNYXJlay5PbHNha0BhbWQuY29tPjsgSHVhbmcs
IFJheSA8UmF5Lkh1YW5nQGFtZC5jb20+OyBEZXVjaGVyLA0KPkFsZXhhbmRlciA8QWxleGFuZGVy
LkRldWNoZXJAYW1kLmNvbT4NCj5TdWJqZWN0OiBSZTogW1BBVENIIHYyIDIvMl0gZHJtL3R0bTog
Y2hlY2sgd2l0aCB0ZW1wb3JhcnkgR1RUIG1lbW9yeSBpbiBCTw0KPnZhbGlkYXRpb24NCj4NCj5B
bSAzMS4wNS4yMSB1bSAxMzozMCBzY2hyaWViIExhbmcgWXU6DQo+PiBJZiBhIEJPJ3MgYmFja2lu
ZyBzdG9yZSBpcyB0ZW1wb3JhcnkgR1RUIG1lbW9yeSwgd2Ugc2hvdWxkIG1vdmUgaXQgaW4NCj4+
IEJPIHZhbGlkYXRpb24uDQo+Pg0KPj4gdjI6IG1vdmUgdGhlIGNoZWNrIG91dHNpZGUgb2YgZm9y
IGxvb3ANCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBMYW5nIFl1IDxMYW5nLll1QGFtZC5jb20+DQo+
DQo+SW4gZ2VuZXJhbCB0aG9zZSBwYXRjaGVzIG5vdyBoYXZlIG15IHJiLCBidXQgbGV0IG1lIGFk
ZCBzb21lIG1vcmUNCj5kb2N1bWVudGF0aW9uIHRvIHRoZW0gdG8gYmV0dGVyIGV4cGxhaW4gd2h5
IHdlIGRvIHRoaXMuDQo+DQpbWXUsIExhbmddIA0KVGhhbmtzIGZvciB5b3VyIHJldmlldyBhbmQg
YWR2aWNlLiBIYXBweSB0byBzZWUgdGhhdCENCg0KUmVnYXJkcywNCkxhbmcNCg0KPlRoYW5rcywN
Cj5DaHJpc3RpYW4uDQo+DQo+PiAtLS0NCj4+ICAgZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8u
YyB8IDMgKysrDQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykNCj4+DQo+PiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYw0KPj4gYi9kcml2ZXJzL2dw
dS9kcm0vdHRtL3R0bV9iby5jIGluZGV4IGMzMmEzN2QwYTQ2MC4uMTgwMmZjNzdjZmNiIDEwMDY0
NA0KPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYw0KPj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL3R0bS90dG1fYm8uYw0KPj4gQEAgLTkzOCw2ICs5MzgsOSBAQCBzdGF0aWMgYm9v
bCB0dG1fYm9fcGxhY2VzX2NvbXBhdChjb25zdCBzdHJ1Y3QNCj50dG1fcGxhY2UgKnBsYWNlcywN
Cj4+ICAgew0KPj4gICAJdW5zaWduZWQgaTsNCj4+DQo+PiArCWlmIChtZW0tPnBsYWNlbWVudCAm
IFRUTV9QTF9GTEFHX1RFTVBPUkFSWSkNCj4+ICsJCXJldHVybiBmYWxzZTsNCj4+ICsNCj4+ICAg
CWZvciAoaSA9IDA7IGkgPCBudW1fcGxhY2VtZW50OyBpKyspIHsNCj4+ICAgCQljb25zdCBzdHJ1
Y3QgdHRtX3BsYWNlICpoZWFwID0gJnBsYWNlc1tpXTsNCj4+DQo=
