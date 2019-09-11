Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4879AFBDB
	for <lists+dri-devel@lfdr.de>; Wed, 11 Sep 2019 13:50:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97DFA6EAA9;
	Wed, 11 Sep 2019 11:50:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780047.outbound.protection.outlook.com [40.107.78.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 192046EAA9;
 Wed, 11 Sep 2019 11:50:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AGBHXOLoDJVsWYQK//gWGEGTBl+Oqtzvud6KCXiqQvuy87D2a965FIFthTOcZPcOyaaHXb5tOk4Drf0tQSXrsYJJTzL7KY4QXA8VCgy7VX3Sq8vPWuDhtM4+Z98l/WmYGdGE+eUCjTZF7X0XgpjwQYAV3Lk2Hs5Ieg2MhtSM8dqxNN45ihkUw/tNyGM5k+RlyM/3SJd9Z/3s+Pv6Od4eD6t8kJRegHQtEEY04eFHJdSSvTVx/qQ6eHueV4yzhzckUew5EkFioZrSP6nboa0Tx6wOgk0VklHZZ1W4N6GoYJ72JOr6Bv6B52dDpfclhIVtgDMp4SZVqCvJQv6AJe372A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=47VkSyv4udZM1gWc9NA+dXSoLthTD9MtSIjHoJQogWI=;
 b=ChFwrC+UQlXGo7GX95e4Z1DjdUPLalcoTsBghqvn4LlAh8ae22UVB3k2vvw9pHlMa450XAZH3UsKSqvp2T5weAsqf4VdFi+l4fyGqXLiDnchh2WzKyLNtANBCcIXezUNy+cRuFbRmEgRYqpvGcDEckYIsiD93P0W7gxeH4Ta/679uCaVbY9SE678XbB/RwnsqJi9Z8V7yg9HLcWQCbN2kw5jRvqPjbHi3C5SQ3GKmN/andzGwDLyhLdvAwC842BsiD/fUOqnvZfkinczP0q5O+zJCecqIUyPkrR11ITOjhlGUXFMtuZC6gF12E9v1EVLPRjeBcs+WAGHCWfxYIFkJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3309.namprd12.prod.outlook.com (20.179.83.157) by
 MN2PR12MB3421.namprd12.prod.outlook.com (20.178.243.88) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.17; Wed, 11 Sep 2019 11:50:25 +0000
Received: from MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::e105:cd24:c71d:c38d]) by MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::e105:cd24:c71d:c38d%4]) with mapi id 15.20.2241.022; Wed, 11 Sep 2019
 11:50:25 +0000
From: "Huang, Ray" <Ray.Huang@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>
Subject: [PATCH 07/14] drm/ttm: add helper to get buffer object with
 ttm_mem_reg
Thread-Topic: [PATCH 07/14] drm/ttm: add helper to get buffer object with
 ttm_mem_reg
Thread-Index: AQHVaJcZrKLpdLxndUqs1bQwaeDG2w==
Date: Wed, 11 Sep 2019 11:50:25 +0000
Message-ID: <1568202584-14471-8-git-send-email-ray.huang@amd.com>
References: <1568202584-14471-1-git-send-email-ray.huang@amd.com>
In-Reply-To: <1568202584-14471-1-git-send-email-ray.huang@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-clientproxiedby: HK2PR04CA0046.apcprd04.prod.outlook.com
 (2603:1096:202:14::14) To MN2PR12MB3309.namprd12.prod.outlook.com
 (2603:10b6:208:106::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.7.4
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 74aca972-746b-492f-2d08-08d736ae3bd8
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3421; 
x-ms-traffictypediagnostic: MN2PR12MB3421:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB3421ABD8F673F7FC948909A9ECB10@MN2PR12MB3421.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1107;
x-forefront-prvs: 0157DEB61B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(396003)(39860400002)(136003)(376002)(366004)(199004)(189003)(6436002)(4326008)(25786009)(450100002)(6486002)(486006)(11346002)(446003)(2616005)(305945005)(7736002)(50226002)(8936002)(316002)(110136005)(54906003)(8676002)(6116002)(3846002)(2906002)(81166006)(81156014)(36756003)(14454004)(71190400001)(71200400001)(86362001)(66446008)(478600001)(66476007)(64756008)(66556008)(66946007)(4744005)(256004)(99286004)(53936002)(5660300002)(76176011)(52116002)(6512007)(6636002)(386003)(6506007)(66066001)(102836004)(26005)(186003)(476003)(2501003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3421;
 H:MN2PR12MB3309.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: yBVxOd67fJJegRv1PsLryD0YhnqahqaT81lJMZoDi77N0sHABrJ9VjkZ0U7TI0qBcil8HZZTElJgQsNazPpim22Bxwg3u9H0axTEQX7AB57mOH2BaF51hbsvu5rvi6q1olLtCLQLBRDgrOAzd/D8xwO1fTiDe8mB6BJ5IWuIoFvi0nrQD22cRDA6UcYpH4zHwwgtQvGY/ahA/vi3PdMcp3UhP5cGi2FbsG/PWr5fKUgdfNzIPA+kiJfcPcn0br2bc/9k0IaDAMHzKZzqjc2DQzqtU6nfdh+Uj4gwuon7jy9T0Kzt3WDDCGlrxElmp3l4Y6lkcU8oDqHzHTsAtiXgMmgzzKVl0JtEEiPER//GqW1E9aolZJknJIzLwy64nRC4l8QVPYfIMDKC7tGotF2DB+ybWvXz5SOHH9tWvuv01Jc=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74aca972-746b-492f-2d08-08d736ae3bd8
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2019 11:50:25.6844 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RHQ15aLFOWa893P4KfOY+XOx4HoseZaRBehU/LnJKav/4tO6lUnnCJAuBq+1KSbkbVavd+4r2Ig35asiBWBTPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3421
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=47VkSyv4udZM1gWc9NA+dXSoLthTD9MtSIjHoJQogWI=;
 b=UpUVHSEdGYHlTcboN6JXxKB2T2kkeDF+ytErIY9rs6QPQ04b+YxKLhnMC8jq0Lz1zNiDUMHv+66OqZ3t5fueOWiZwrDnUz4xwlNod6PvCxtW05GByaUfTKYhVrGZVPuDgbuyIsV+2yMEmibFNSiTGYFxXmeGPA+KUO2PrvhYtZM=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Ray.Huang@amd.com; 
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
Cc: "Tuikov, Luben" <Luben.Tuikov@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>, "Liu,
 Aaron" <Aaron.Liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBwYXRjaCBpcyB0byBhZGQgYSBoZWxwZXIgdG8gZ2V0IGNvcnJlc3BvbmRpbmcgYnVmZmVy
IG9iamVjdCB3aXRoIGEgcG9pbnRlcgp0byBhIHN0cnVjdCB0dG1fbWVtX3JlZy4KClNpZ25lZC1v
ZmYtYnk6IEh1YW5nIFJ1aSA8cmF5Lmh1YW5nQGFtZC5jb20+ClJldmlld2VkLWJ5OiBBbGV4IERl
dWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Ci0tLQogaW5jbHVkZS9kcm0vdHRtL3R0
bV9ib19kcml2ZXIuaCB8IDEzICsrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxMyBpbnNl
cnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vdHRtL3R0bV9ib19kcml2ZXIuaCBi
L2luY2x1ZGUvZHJtL3R0bS90dG1fYm9fZHJpdmVyLmgKaW5kZXggZDY5MTIxYy4uMjY0ZTZjMyAx
MDA2NDQKLS0tIGEvaW5jbHVkZS9kcm0vdHRtL3R0bV9ib19kcml2ZXIuaAorKysgYi9pbmNsdWRl
L2RybS90dG0vdHRtX2JvX2RyaXZlci5oCkBAIC03ODYsNiArNzg2LDE5IEBAIHN0YXRpYyBpbmxp
bmUgdm9pZCB0dG1fYm9fdW5yZXNlcnZlKHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8pCiAJ
cmVzZXJ2YXRpb25fb2JqZWN0X3VubG9jayhiby0+cmVzdik7CiB9CiAKKy8qKgorICogdHRtX21l
bV9yZWdfdG9fYm8KKyAqCisgKiBAbWVtOiBBIHBvaW50ZXIgdG8gYSBzdHJ1Y3QgdHRtX21lbV9y
ZWcuCisgKgorICogUmV0dXJucyBjb3JyZXNwb25kaW5nIGJ1ZmZlciBvYmplY3Qgb2YgdGhlIEBt
ZW0uCisgKi8KK3N0YXRpYyBpbmxpbmUKK3N0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqdHRtX21l
bV9yZWdfdG9fYm8oc3RydWN0IHR0bV9tZW1fcmVnICptZW0pCit7CisJcmV0dXJuIGNvbnRhaW5l
cl9vZihtZW0sIHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCwgbWVtKTsKK30KKwogLyoKICAqIHR0
bV9ib191dGlsLmMKICAqLwotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
