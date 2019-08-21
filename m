Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F72E984E3
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2019 21:59:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA97589E9B;
	Wed, 21 Aug 2019 19:59:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780074.outbound.protection.outlook.com [40.107.78.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4105789E65;
 Wed, 21 Aug 2019 19:59:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fXU5iuOQaukaWrzP4TBCU4edh46VLnCxyJAaMXJT64gA4YLjuGPUR3HotMMYHGcK14JqY6uITuEoXyxShI8BENUVehCs87L9FUr7zlVLYNIezSE1BPBY8OJbqNZFm3lUdQtRUhLHKsOLa4u2ryYzDgnwNPmUmR6+BKQ0+cfVPETIqZwGp65QgfMo3JSE/Q63u120CLWl7+Pn9bmi7ynHs01LnP/udU3uuBrIhYMDplCzsbgHZTx9MSWoXtDTMYqTHCHLfXMDfSuifM692inPOwjGT29QdbQrRKdA7kJs/kT6NXOqmgN3a6bdrVPSEiC8qTN1H0YbKw2bM3RJ/dIsvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t4hxC9dsoQ6xl1D9lMVwAFotOS+4tPh5CpGkGhL5BgY=;
 b=LcoLh1PMRbdg3xFbEog3fMZFDdzNjwFdBcW8GIL8INyX5nrtOpccGXnbiG4ajYqyufCkSYI3wSjo9/L0/tnmtjoa9H/u63GJEy+OtLgD3Zxyg4E6CabuuIvJOp9c9e+ZyRXR6NjT1j5UoLxOlz1O2RAQY2LriYYOPBprEcZ15zY7p4CXBjAjh30mJY59Gja3LgtOuMklTz51ajgdL3p+YZHGGmzwecSKJTMo9iRs1QBaOVy/B8h1Zj8kbykaTVcen0QC5+tZjVnHdHZx1HEhe/NZxOzW1TuiJgq+mt8RHSJpjBEEwpmUk8cyqDev39NJsrHTSugK3I+4Sldq++P6Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BN6PR12MB1667.namprd12.prod.outlook.com (10.172.18.18) by
 BN6PR12MB1620.namprd12.prod.outlook.com (10.172.24.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.18; Wed, 21 Aug 2019 19:59:35 +0000
Received: from BN6PR12MB1667.namprd12.prod.outlook.com
 ([fe80::b53e:c4ce:6835:505e]) by BN6PR12MB1667.namprd12.prod.outlook.com
 ([fe80::b53e:c4ce:6835:505e%10]) with mapi id 15.20.2178.020; Wed, 21 Aug
 2019 19:59:35 +0000
From: "Liu, Wenjing" <Wenjing.Liu@amd.com>
To: "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>, "Francis, David"
 <David.Francis@amd.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Recall: [PATCH v2 11/14] drm/amd/display: Validate DSC caps on MST
 endpoints
Thread-Topic: [PATCH v2 11/14] drm/amd/display: Validate DSC caps on MST
 endpoints
Thread-Index: AQHVWFr0wRkL7YVLBEu+RwvNxPVu5g==
X-CallingTelephoneNumber: IPM.Note
X-VoiceMessageDuration: 17
X-FaxNumberOfPages: 0
Date: Wed, 21 Aug 2019 19:59:35 +0000
Message-ID: <BN6PR12MB166722C763E17C0835E8847DF5AA0@BN6PR12MB1667.namprd12.prod.outlook.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5eb47654-64ae-4f92-4bb0-08d72672174e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:BN6PR12MB1620; 
x-ms-traffictypediagnostic: BN6PR12MB1620:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN6PR12MB1620A22E8C2AC99F59A52BE5F5AA0@BN6PR12MB1620.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-forefront-prvs: 0136C1DDA4
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(346002)(39850400004)(366004)(136003)(376002)(199004)(189003)(8936002)(2201001)(7696005)(81156014)(81166006)(8676002)(76116006)(2501003)(33656002)(14444005)(66476007)(64756008)(66446008)(66556008)(86362001)(3846002)(486006)(6116002)(71190400001)(71200400001)(2906002)(9686003)(74316002)(476003)(66946007)(66066001)(52536014)(55016002)(450100002)(4326008)(6506007)(558084003)(478600001)(25786009)(5660300002)(6436002)(316002)(102836004)(256004)(7736002)(53936002)(26005)(305945005)(186003)(15650500001)(99286004)(110136005)(14454004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1620;
 H:BN6PR12MB1667.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: XPY9SupPkZABSNt9YgugcPN/z8AANUK4t+jjIKgqvoruAG9rxyHZrZWuu8LO1bH+d7gVNH2zSZ1XqWWFfd+sFcz00e7xBkrb8TdTfEwZSPT3miVhaDMKfq4qnkfY9xGB0ZqXeDAAKeI339lBE2+Z0zlT4WdGAl8Ur2/p3cbmJqjGZGrq2MOLcA/YPFmNqb0Kz6HmW9ZFwOhwSVRNYxrk3hHk53VkZxiwZ6q/ZgSHsgC1eOuFE6iX6CKug8n51ywzMrj8oDatvY9x8nStG7r+EM4tHiv4YNocQOI13msD4ZozAd7e6GcIv/nnOJ/qvWPmXe4gVenaQqeEVWN0v8eBnLR9h2E/9Zxz29rgGP6smdAx6K5Pq+fOLh5GktgoHjpbHoNek8OyA05ciDGYnY2klhk+NlRn3nxUt+fQnI/f6ps=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5eb47654-64ae-4f92-4bb0-08d72672174e
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2019 19:59:35.4189 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 37b6yJ/SoXFdx/Vu68o/hMolRmoZCNC4XRu3OkyUhSgQ0uJqJwrbeAX3aXKPbFDU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1620
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t4hxC9dsoQ6xl1D9lMVwAFotOS+4tPh5CpGkGhL5BgY=;
 b=PEhTfo2raF8Tgjns00FpnSXrecL/U1ie0IoZJK4ydRr+rjxBwpmZ07UVDV+x16tll3bd5A4dsH5XzrRkCHU4qudfvfZvtXbV+SkSOAmU2DgD0kaBw9U0uL2zHjG4gIqm1iv/fg6fwK1rP+IOVCAUGzTVg1PJ7shsRpqz7j6j0m4=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Wenjing.Liu@amd.com; 
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: "Cornij, Nikola" <Nikola.Cornij@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TGl1LCBXZW5qaW5nIHdvdWxkIGxpa2UgdG8gcmVjYWxsIHRoZSBtZXNzYWdlLCAiW1BBVENIIHYy
IDExLzE0XSBkcm0vYW1kL2Rpc3BsYXk6IFZhbGlkYXRlIERTQyBjYXBzIG9uIE1TVCBlbmRwb2lu
dHMiLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
