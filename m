Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB44840125F
	for <lists+dri-devel@lfdr.de>; Mon,  6 Sep 2021 03:10:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6710189A94;
	Mon,  6 Sep 2021 01:10:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2068.outbound.protection.outlook.com [40.107.92.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F83F89A94;
 Mon,  6 Sep 2021 01:10:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Djnp6t//jBvYMk4nQ6vTKhklbyjDONCe1CYWxXYmrll4iFMlboAPVdbjHUJEfGNf8cfsUO+6+FElnsRlOLJThvrbFXq+Q0vS+slTkadh181tmnTQ3GjoZpNlZ9sPKzs6tOD6RfCna16VD1lkYXYNj//skjceKUoxKXN9jIrp65raoyBd6btwA+56nDWLuxrTbgBhd24VgWrhfELgbUHaF+TOrGosAv4tJb2W2o4LxVxYliK0iJaJNguJwLkMt0fimkWmIU8TKZ1i6FjxXuo9GvbE/CAC0JcagubZCTy/cwX04wWeitbzvdErdGbYJhoyedQBI32ujlafshzTLU75aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=tSvjM3KmLRNzTz3Q5SQSbl7L7iBc1sLA2gNC69OlIZU=;
 b=hkvFMfLw/rdvSgad2kCLN7I4Q/lep4ey1pHfYSfe76jMUxX7qgYV8U00icOV3RmIZlB3DakYWtomaRuDicvRmmRH8bko3Rt4IvhnpXlwaX+nnEJxuWWw3T5pLSMlYqvMWg20SOue+mc73RjbSOshdl7LuxQ0ZN2ZZRviPrbCIQqRaBWD9JpciXenJWyLXC51kIeZ06NXdtRr7zSdf1amHmaTwaFMBnP0OsPXCETZRswPRaHWDMoQpd1Wv6FmSibCt5NxJpBflqOeq4PYJJJAxD6ODYncauAB7D75zkWwkvy71Mtf5znMtGTmT1PKj8ATdCEUtbJzV4kJSAUCGMr/TA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tSvjM3KmLRNzTz3Q5SQSbl7L7iBc1sLA2gNC69OlIZU=;
 b=j6n1wVqcD4B02DK8oPdhAZlgrbPORSnRhYzs1LoNSnJmbXGOwWrhbbHnb1yY7iwCykoF8fiVlb2ogCDzyGalmv72FYOEH4klqAgNL3JLxtlk3ngxQD9cu4I0S5XRyeqWk8YuPiewPHLmIfRlf52+g9bv4y/Nz7VBXY+TitAsbNo=
Received: from DM4PR12MB5165.namprd12.prod.outlook.com (2603:10b6:5:394::9) by
 DM4PR12MB5101.namprd12.prod.outlook.com (2603:10b6:5:390::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.19; Mon, 6 Sep 2021 01:10:02 +0000
Received: from DM4PR12MB5165.namprd12.prod.outlook.com
 ([fe80::79d6:3902:9bcd:37ca]) by DM4PR12MB5165.namprd12.prod.outlook.com
 ([fe80::79d6:3902:9bcd:37ca%9]) with mapi id 15.20.4478.025; Mon, 6 Sep 2021
 01:10:02 +0000
From: "Pan, Xinhui" <Xinhui.Pan@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: "Koenig, Christian" <Christian.Koenig@amd.com>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "chenli@uniontech.com" <chenli@uniontech.com>
Subject: [PATCH v2 2/2] drm/amdpgu: Use VRAM domain in UVD IB test
Thread-Topic: [PATCH v2 2/2] drm/amdpgu: Use VRAM domain in UVD IB test
Thread-Index: AQHXorvQyBdrKYEtM0WaAd5AOAc+zw==
Date: Mon, 6 Sep 2021 01:10:02 +0000
Message-ID: <DM4PR12MB516520B50E5C61FD3C23D9CC87D29@DM4PR12MB5165.namprd12.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Enabled=True;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SetDate=2021-09-06T01:10:02.228Z;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Name=AMD
 Official Use
 Only; MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ContentBits=0;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Method=Standard; 
suggested_attachment_session_id: 3d4d5e2c-cdce-5492-819f-d55a6f6b1743
authentication-results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d8888978-5552-4648-f53c-08d970d30e28
x-ms-traffictypediagnostic: DM4PR12MB5101:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM4PR12MB5101B283E8089E57B37AA7DB87D29@DM4PR12MB5101.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:127;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qhsH8NlPI7T8jgs9zlT/VHHrZKQE1FzVBYEUQ29GjZhWbA1XzISym00P/ZVjpqfZUfaORYc30uNrrVgPK6BF1/KPcZfoo4jCBiVQj9CiZf2HvejVWdcyCKXSSTwAbB2gbIdmo6hjbcijeziT0Woat1dWlUf8ArK31eN+HUxcR2D93FjKK0r0QtpW0dKXBxd6NEp3R9EdhSchZ5Df+NvcXc4wy8GRaYhgxtXiXv+Lfdcqf7xLgL2yHlKkauGCOIp3hSe1ZU40fXb6aljb3Z58VZSGa7qn1rN1nBiCfcFccJkTB68/VIwVStpRS1iOOCaKj2MMkSmLo5ECSqbrsARSnBEUtP5Ok4B7FGXlQrAjOQKrj110WmQ9iUXvTxvedSoBXSVo8tf+HhvOd0JrNjMdXX/br3kRxcFbxjjzAS3f91cjMmADMMzvN+SOvy4jqpgymbVlFG0Omc8bhCZWlyQ218T/CWeXktjaPcLWN02PbYUbMxd/dI/RkCfW+soBg1Fu0pX8HM7BnZe8hXDhHiV4Wg0TkafBe7H3IKxVkCF5UiuXXs0fSQJw4dk4S1J4+nsau+xE3JZon6HaByAQ2gOyGS2XLCKy4YlsISD1C4JWNsASKWrVM4P/BqZzN15DoFQIElCCYboWrRU0vRgpeUvULd8lVe8sUYKXxxAO5l9LDdcCmfytbS+qiVP499fHxZUch1scbH1g+B8aOnyEZoUAzg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5165.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(136003)(376002)(39860400002)(346002)(8936002)(8676002)(91956017)(71200400001)(5660300002)(76116006)(54906003)(38100700002)(55016002)(110136005)(52536014)(26005)(66556008)(64756008)(66476007)(33656002)(66446008)(86362001)(9686003)(122000001)(66946007)(6506007)(186003)(316002)(7696005)(4326008)(38070700005)(2906002)(478600001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?U1pyWHNTUTQxeFVPb3FaK1p2aUJpNER2VlZWUzRLWVV0RG0wc0N2VnB2bUtv?=
 =?gb2312?B?YWR2UEFka0dUQkNMTXlONC9xNnI0eDhuMFczVWgyM1gvUnd5ck4wNjl0eVFU?=
 =?gb2312?B?N3FjRmFDZnd6YUZPY1hiTVIrbzhLTXJCaDRBa0V0QVg2Y21RQVBFNmMvSzZU?=
 =?gb2312?B?VVI5ckZEbHVaMXJ3Y2Rmc1NQVlM4ajB2K01PM25YOTE2TmZYZE5DNDcxakwv?=
 =?gb2312?B?dTVHQUpYcXVvZVpzbGxMSlovdFNUNjc4QitKdFJ0U1lZeFJZWlFjejNPWUdt?=
 =?gb2312?B?RkhOeGJPd1dTV2FoTkw4MkRNNlYxeEI3azA3dW1FVWlIT2tOQ1ZJUEplS0Jp?=
 =?gb2312?B?dHN2eVdkOXhGVlRPMzdDZmE3ZmtQck5ObHMzQ0hVN0xsSHEyWnJlMGVSc1gr?=
 =?gb2312?B?dDhYbHJlTUFPMVhneWRjOGZNbzN0cmw1WEVtTFRSUmMyT0Y1ejRFMUQxMnJS?=
 =?gb2312?B?N09FdWNaZjlWTjF5ZkxRKzBLc3pMT2VJTXNyRkFTSWVxd3ZhWjFndGNqOHA5?=
 =?gb2312?B?aUFSa25jOVRlUzJoUFZXMkFXZU1LVVhBbS9JQXkwKzRSTm5wVlpjQ2VTNjc0?=
 =?gb2312?B?RUc4Vm4yRTRDb2kxbU52QTNadWdTMUpSR1RrQ3JtQ1pTOVVTNE56SkkyWUZE?=
 =?gb2312?B?NEovaXRoWW5OYWdQbXhWUzhIbkJGOEJJZitMREVCS29yQjNDK0JwMzJlQTVs?=
 =?gb2312?B?d2VBbnVpVkg3a0w3S056NE1OM0ZQbkN0OXcrWkFKRWFNU2JqY2JLUCthUEhS?=
 =?gb2312?B?SWxKYXNybWpLSnpIcUJDdFJHMEJJU2ZSTWZHYVc3WFR2bUNUbHYzWmJxSGJ0?=
 =?gb2312?B?WWVYaTZIYUtqTlY0L0IwTEd5TW1EdjRPbndiR016S1U5eGptakJnUjByQ0Fr?=
 =?gb2312?B?UkE0NWF5SzgxN0xaRTFmUnp1VHQ1Y1ZQcUJPdHU0OWZ6OVplbmhoSXhBRS9j?=
 =?gb2312?B?NHk4UGJrbVpPQlRCeDRqSWlMRVYxZVFqa0NVeGNOazM5aVR0S2RBa0JTc2M2?=
 =?gb2312?B?TzJyVjZpa2QzZkZOZmxYWERLYk9CUEFkcnFkaGQwSXh5WTVVQXl2UVNTZEts?=
 =?gb2312?B?MWNZZ3ExUDAwblp6QXZ3UjdPeFVzd3I1eUVmU1cxeXJJZlI1Szl3eXBvbmgz?=
 =?gb2312?B?Z2x4bW5icTE3OU5TT1NsRURsUzU0blZuYmNRcWRZdkRCdExRYnRrQ3pubDBL?=
 =?gb2312?B?RXhVVnBndUkvWEVZYktZWkhid21Mc2dRSkh0OUkvdDZKMTBxTVJOY3M0R0JG?=
 =?gb2312?B?UVNRWTJSYnRPSUNIL3NlaUhXaUhwdmVVOFRhZ1d1Q2J2eVBCWkcwRzVWZmcv?=
 =?gb2312?B?VWlNUGt0MmloVWpvRks4VDgrTFpldHVJUFVMSlhZOXc3akpQd0J0ek9CSlhv?=
 =?gb2312?B?OU9HN2t6REZJcTc0Q1VuQVRZZEg4U2pTdWQxVVNjdHN4WDZGMENhbEkzOUJE?=
 =?gb2312?B?cENJM3o3ZFgySjBaNVJVbE5DSDliSUFKaDR0UlpqNDRjNER6VHN1SW1OdVhH?=
 =?gb2312?B?bStkcXJBOWh4a3pvU0pQem5UTmhrbVJ5dWswR3I0U0Y2Sk5KUHFPbllyOVhh?=
 =?gb2312?B?cjAwVlhTa2xKbnhKbVprOFA5dnc3dWNvSW0vbWR3NzU2bmtlbmZzazVud09v?=
 =?gb2312?B?WjBPdlg3cnkwZ0FIZ201cmRyYVpMcCtBZ2U1QmdoRXY3blpvdW5tZHpmQWtP?=
 =?gb2312?B?czQ2WGRBcXZRdEVzYUF2Y1grUVl1WlJDZHFsMzB3VUQ2RVVQbis5NjBxcmlz?=
 =?gb2312?Q?ZaDG38tbpeQENOIDlWeGfOjYY3SCgRFjNIpLx/4?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5165.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8888978-5552-4648-f53c-08d970d30e28
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Sep 2021 01:10:02.6566 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yCU1QswneBcbTgu+rk6AHgFzNk33Ncpl91FZJ1ePhMg/GERzp2rDCzru6xMQc87N
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5101
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

W0FNRCBPZmZpY2lhbCBVc2UgT25seV0NCg0KTGlrZSB2Y2UvdmNuIGRvZXMsIHZpc2libGUgVlJB
TSBpcyBPSyBmb3IgaWIgdGVzdC4NCldoaWxlIGNvbW1pdCBhMTFkOWZmM2ViZTAgKCJkcm0vYW1k
Z3B1OiB1c2UgR1RUIGZvcg0KdXZkX2dldF9jcmVhdGUvZGVzdG9yeV9tc2ciKSBzYXlzIFZSQU0g
aXMgbm90IG1hcHBlZCBjb3JyZWN0bHkgaW4gaGlzDQpwbGF0Zm9ybSB3aGljaCBpcyBsaWtlbHkg
YW4gYXJtNjQuDQoNClNvIGxldHMgY2hhbmdlIGJhY2sgdG8gdXNlIFZSQU0gb24geDg2XzY0IHBs
YXRmb3JtLg0KDQpTaWduZWQtb2ZmLWJ5OiB4aW5odWkgcGFuIDx4aW5odWkucGFuQGFtZC5jb20+
DQotLS0NCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdXZkLmMgfCA4ICsrKysr
KysrDQogMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKQ0KDQpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3V2ZC5jIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X3V2ZC5jDQppbmRleCBkNDUxYzM1OTYwNmEuLmU0Yjc1ZjMzY2NjOCAx
MDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV91dmQuYw0KKysr
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3V2ZC5jDQpAQCAtMTE3OCw3ICsx
MTc4LDExIEBAIGludCBhbWRncHVfdXZkX2dldF9jcmVhdGVfbXNnKHN0cnVjdCBhbWRncHVfcmlu
ZyAqcmluZywgdWludDMyX3QgaGFuZGxlLA0KICAgICAgICBpbnQgciwgaTsNCg0KICAgICAgICBy
ID0gYW1kZ3B1X2JvX2NyZWF0ZV9yZXNlcnZlZChhZGV2LCAxMDI0LCBQQUdFX1NJWkUsDQorI2lm
ZGVmIENPTkZJR19YODZfNjQNCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
QU1ER1BVX0dFTV9ET01BSU5fVlJBTSwNCisjZWxzZQ0KICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBBTURHUFVfR0VNX0RPTUFJTl9HVFQsDQorI2VuZGlmDQogICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICZibywgTlVMTCwgKHZvaWQgKiopJm1zZyk7DQog
ICAgICAgIGlmIChyKQ0KICAgICAgICAgICAgICAgIHJldHVybiByOw0KQEAgLTEyMTAsNyArMTIx
NCwxMSBAQCBpbnQgYW1kZ3B1X3V2ZF9nZXRfZGVzdHJveV9tc2coc3RydWN0IGFtZGdwdV9yaW5n
ICpyaW5nLCB1aW50MzJfdCBoYW5kbGUsDQogICAgICAgIGludCByLCBpOw0KDQogICAgICAgIHIg
PSBhbWRncHVfYm9fY3JlYXRlX3Jlc2VydmVkKGFkZXYsIDEwMjQsIFBBR0VfU0laRSwNCisjaWZk
ZWYgQ09ORklHX1g4Nl82NA0KKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBB
TURHUFVfR0VNX0RPTUFJTl9WUkFNLA0KKyNlbHNlDQogICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIEFNREdQVV9HRU1fRE9NQUlOX0dUVCwNCisjZW5kaWYNCiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgJmJvLCBOVUxMLCAodm9pZCAqKikmbXNnKTsNCiAg
ICAgICAgaWYgKHIpDQogICAgICAgICAgICAgICAgcmV0dXJuIHI7DQotLQ0KMi4yNS4xDQoNCg==
