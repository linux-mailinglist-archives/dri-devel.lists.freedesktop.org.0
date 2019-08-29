Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FBD7A115B
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2019 08:05:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91C0789F77;
	Thu, 29 Aug 2019 06:05:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760052.outbound.protection.outlook.com [40.107.76.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C21F189C8D;
 Thu, 29 Aug 2019 06:05:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KJQR3P6n2DB47SQcCQJWKgvD0foToBUrBqol451/uhxWVLBiNvRhTD+cShp469jC+1jJr1quc+a/ujvk+e4nM9WkJxJwKwjW0RK0lMPZ7dNW7i7XLCS4g+aaZkEosFWX7AUoDcRA2i2Sc2Y+fjJO7at3bZiMDKxzLx9xigKMPOn69Q7bQahgdrKM9zUYG2caYVVLIatExMGGaDQaM4u6iQUJKis8LfXo6iwut6cJqVjmAVDHEiQcrPYlXYc7+pFODUeUeIM1cJutCO9PyEmG0Q4MXOwhTLlPPHSDIJes5caKCz4N/kb258Qx57Vj3lLwUSlt2tDngEj1DA8mDyqP7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EDylsBT88o7NNWQhKnnCNGmH7Pj90ESfRt5IG8rGzKs=;
 b=JzSYGib96pScn9ovK0zsD7AuKsMZWNBfG7YvxoSdOhJMyCkqbU414O3oIGjJqRz4RuOQ751MLIe0If05wHFZQ6aHW5D6wiYJO2PaVtew2T9zliWX1T4f95GuShHPhVWWwgcXHGaXCSk2W643uUaDuF74mXc1gPZOZqYIaFLcAQhqGsHnxMG3EdNfaDhRMACoBH+76o7t/yyzySZ02dc65WOrsi3WU9tThoLcfdlEqesN2GhTMqlf1krpOPxtTeXgRPHrod/yll1deo5A4NqKhnnTZMWJWdXD+mIDOFezGbeDt8LFF7fWcS49oQJa/iJu4Tgw7rfH9lpeVONhR39zMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=cray.com smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from CH2PR12CA0005.namprd12.prod.outlook.com (2603:10b6:610:57::15)
 by BN7PR12MB2707.namprd12.prod.outlook.com (2603:10b6:408:2f::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2199.20; Thu, 29 Aug
 2019 06:05:43 +0000
Received: from CO1NAM03FT045.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::200) by CH2PR12CA0005.outlook.office365.com
 (2603:10b6:610:57::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2220.18 via Frontend
 Transport; Thu, 29 Aug 2019 06:05:43 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT045.mail.protection.outlook.com (10.152.81.214) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2220.16 via Frontend Transport; Thu, 29 Aug 2019 06:05:42 +0000
Received: from kho-5039A.amd.com (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Thu, 29 Aug 2019
 01:05:41 -0500
From: Kenny Ho <Kenny.Ho@amd.com>
To: <y2kenny@gmail.com>, <cgroups@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <tj@kernel.org>, <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <felix.kuehling@amd.com>, <joseph.greathouse@amd.com>, <jsparks@cray.com>,
 <lkaplan@cray.com>, <daniel@ffwll.ch>
Subject: [PATCH RFC v4 01/16] drm: Add drm_minor_for_each
Date: Thu, 29 Aug 2019 02:05:18 -0400
Message-ID: <20190829060533.32315-2-Kenny.Ho@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190829060533.32315-1-Kenny.Ho@amd.com>
References: <20190829060533.32315-1-Kenny.Ho@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(376002)(39860400002)(396003)(2980300002)(428003)(189003)(199004)(1076003)(6666004)(356004)(14444005)(50226002)(70586007)(5660300002)(446003)(426003)(76176011)(53416004)(51416003)(7696005)(305945005)(50466002)(478600001)(48376002)(86362001)(81166006)(81156014)(2201001)(8676002)(36756003)(8936002)(2870700001)(47776003)(2906002)(70206006)(336012)(110136005)(26005)(486006)(186003)(126002)(476003)(2616005)(11346002)(53936002)(316002)(4326008)(921003)(83996005)(1121003)(2101003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN7PR12MB2707; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 97bacf29-fa3f-4cd0-e6eb-08d72c46ecee
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:BN7PR12MB2707; 
X-MS-TrafficTypeDiagnostic: BN7PR12MB2707:
X-Microsoft-Antispam-PRVS: <BN7PR12MB27073191400EC7D2A4EEC30083A20@BN7PR12MB2707.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;
X-Forefront-PRVS: 0144B30E41
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: we+OnEohfE4nnBrZKjoZVMhoKQiOwrBfXKbkgRlIVGrNOOCqKr9OUq6IziPEeDea5DI3xZ4AF6fOolyXGGFUSjf73z+TIkQtALl5Zd9vtthEAq9aeVVriSZkQf8vJiQ4H/G/4Gzc9Z4JlvOSVMiswiqpyNcpCnvXqh4v7MTeYkFtvxjrUIMsGH8I10vwiTprr1aMK0EF2OZ6VDdEqX9lGYMOPF1i/wlFavGIsTgORdBr5iKbLAqNA69IXqUzA3xbP2mWmwfTX/yDeKT35xb/2fMbevEtUOZ5j1MYDCT9avDJt4TJ4QCAyr28ptEOWFqZBaan95w3RPOssdpVvJiunkI1J+dwawzK8FgI4XxMZ2NYsN0ncOdXmmexV/Cox+b2GAYTrntt2650GO/CB4ev5gKcPm4hBI1FLmFf0bxNyiM=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2019 06:05:42.7419 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 97bacf29-fa3f-4cd0-e6eb-08d72c46ecee
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR12MB2707
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EDylsBT88o7NNWQhKnnCNGmH7Pj90ESfRt5IG8rGzKs=;
 b=EIS246rBjUHgDzjtmeD3q5CfYwr1c4tbSJ29PYyA9al1OFUnASliG2jy8h/NiPP0dXv3+P0C7GUMqzZgY9yTgd4X/xxFlafBwnNjKoqY4c+RSBNOz6JOjRFwuPiZrAe8+cMzLY+NCYJY7LawZaH3QUe8VvTSD+rsdcv1QkcZb20=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is
 165.204.84.17)
 smtp.mailfrom=amd.com; cray.com; dkim=none (message not signed)
 header.d=none;cray.com; dmarc=permerror action=none header.from=amd.com;
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
Cc: Kenny Ho <Kenny.Ho@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VG8gYWxsb3cgb3RoZXIgc3Vic3lzdGVtcyB0byBpdGVyYXRlIHRocm91Z2ggYWxsIHN0b3JlZCBE
Uk0gbWlub3JzIGFuZAphY3QgdXBvbiB0aGVtLgoKQWxzbyBleHBvc2VzIGRybV9taW5vcl9hY3F1
aXJlIGFuZCBkcm1fbWlub3JfcmVsZWFzZSBmb3Igb3RoZXIgc3Vic3lzdGVtCnRvIGhhbmRsZSBk
cm1fbWlub3IuICBEUk0gY2dyb3VwIGNvbnRyb2xsZXIgaXMgdGhlIGluaXRpYWwgY29uc3VtZXIg
b2YKdGhpcyBuZXcgZmVhdHVyZXMuCgpDaGFuZ2UtSWQ6IEk3YzRiNjdjZTZiMzFmMDZkMTAzN2Iw
MzQzNTM4NmZmNWI4MTQ0Y2E1ClNpZ25lZC1vZmYtYnk6IEtlbm55IEhvIDxLZW5ueS5Ib0BhbWQu
Y29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fZHJ2LmMgICAgICB8IDE5ICsrKysrKysrKysr
KysrKysrKysKIGRyaXZlcnMvZ3B1L2RybS9kcm1faW50ZXJuYWwuaCB8ICA0IC0tLS0KIGluY2x1
ZGUvZHJtL2RybV9kcnYuaCAgICAgICAgICB8ICA0ICsrKysKIDMgZmlsZXMgY2hhbmdlZCwgMjMg
aW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vZHJtX2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9kcnYuYwppbmRleCA4NjI2MjE0OTRh
OTMuLjAwMGNkZGFiZDk3MCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9kcnYuYwor
KysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2Rydi5jCkBAIC0yNTQsMTEgKzI1NCwxMyBAQCBzdHJ1
Y3QgZHJtX21pbm9yICpkcm1fbWlub3JfYWNxdWlyZSh1bnNpZ25lZCBpbnQgbWlub3JfaWQpCiAK
IAlyZXR1cm4gbWlub3I7CiB9CitFWFBPUlRfU1lNQk9MKGRybV9taW5vcl9hY3F1aXJlKTsKIAog
dm9pZCBkcm1fbWlub3JfcmVsZWFzZShzdHJ1Y3QgZHJtX21pbm9yICptaW5vcikKIHsKIAlkcm1f
ZGV2X3B1dChtaW5vci0+ZGV2KTsKIH0KK0VYUE9SVF9TWU1CT0woZHJtX21pbm9yX3JlbGVhc2Up
OwogCiAvKioKICAqIERPQzogZHJpdmVyIGluc3RhbmNlIG92ZXJ2aWV3CkBAIC0xMDc4LDYgKzEw
ODAsMjMgQEAgaW50IGRybV9kZXZfc2V0X3VuaXF1ZShzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCBj
b25zdCBjaGFyICpuYW1lKQogfQogRVhQT1JUX1NZTUJPTChkcm1fZGV2X3NldF91bmlxdWUpOwog
CisvKioKKyAqIGRybV9taW5vcl9mb3JfZWFjaCAtIEl0ZXJhdGUgdGhyb3VnaCBhbGwgc3RvcmVk
IERSTSBtaW5vcnMKKyAqIEBmbjogRnVuY3Rpb24gdG8gYmUgY2FsbGVkIGZvciBlYWNoIHBvaW50
ZXIuCisgKiBAZGF0YTogRGF0YSBwYXNzZWQgdG8gY2FsbGJhY2sgZnVuY3Rpb24uCisgKgorICog
VGhlIGNhbGxiYWNrIGZ1bmN0aW9uIHdpbGwgYmUgY2FsbGVkIGZvciBlYWNoIEBkcm1fbWlub3Ig
ZW50cnksIHBhc3NpbmcKKyAqIHRoZSBtaW5vciwgdGhlIGVudHJ5IGFuZCBAZGF0YS4KKyAqCisg
KiBJZiBAZm4gcmV0dXJucyBhbnl0aGluZyBvdGhlciB0aGFuICUwLCB0aGUgaXRlcmF0aW9uIHN0
b3BzIGFuZCB0aGF0CisgKiB2YWx1ZSBpcyByZXR1cm5lZCBmcm9tIHRoaXMgZnVuY3Rpb24uCisg
Ki8KK2ludCBkcm1fbWlub3JfZm9yX2VhY2goaW50ICgqZm4pKGludCBpZCwgdm9pZCAqcCwgdm9p
ZCAqZGF0YSksIHZvaWQgKmRhdGEpCit7CisJcmV0dXJuIGlkcl9mb3JfZWFjaCgmZHJtX21pbm9y
c19pZHIsIGZuLCBkYXRhKTsKK30KK0VYUE9SVF9TWU1CT0woZHJtX21pbm9yX2Zvcl9lYWNoKTsK
KwogLyoKICAqIERSTSBDb3JlCiAgKiBUaGUgRFJNIGNvcmUgbW9kdWxlIGluaXRpYWxpemVzIGFs
bCBnbG9iYWwgRFJNIG9iamVjdHMgYW5kIG1ha2VzIHRoZW0KZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9kcm1faW50ZXJuYWwuaCBiL2RyaXZlcnMvZ3B1L2RybS9kcm1faW50ZXJuYWwuaApp
bmRleCBlMTlhYzdjYTYwMmQuLjZiZmFkNzZmOGU3OCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2RybV9pbnRlcm5hbC5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1faW50ZXJuYWwuaApA
QCAtNTQsMTAgKzU0LDYgQEAgdm9pZCBkcm1fcHJpbWVfZGVzdHJveV9maWxlX3ByaXZhdGUoc3Ry
dWN0IGRybV9wcmltZV9maWxlX3ByaXZhdGUgKnByaW1lX2Zwcml2KTsKIHZvaWQgZHJtX3ByaW1l
X3JlbW92ZV9idWZfaGFuZGxlX2xvY2tlZChzdHJ1Y3QgZHJtX3ByaW1lX2ZpbGVfcHJpdmF0ZSAq
cHJpbWVfZnByaXYsCiAJCQkJCXN0cnVjdCBkbWFfYnVmICpkbWFfYnVmKTsKIAotLyogZHJtX2Ry
di5jICovCi1zdHJ1Y3QgZHJtX21pbm9yICpkcm1fbWlub3JfYWNxdWlyZSh1bnNpZ25lZCBpbnQg
bWlub3JfaWQpOwotdm9pZCBkcm1fbWlub3JfcmVsZWFzZShzdHJ1Y3QgZHJtX21pbm9yICptaW5v
cik7Ci0KIC8qIGRybV92YmxhbmsuYyAqLwogdm9pZCBkcm1fdmJsYW5rX2Rpc2FibGVfYW5kX3Nh
dmUoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdW5zaWduZWQgaW50IHBpcGUpOwogdm9pZCBkcm1f
dmJsYW5rX2NsZWFudXAoc3RydWN0IGRybV9kZXZpY2UgKmRldik7CmRpZmYgLS1naXQgYS9pbmNs
dWRlL2RybS9kcm1fZHJ2LmggYi9pbmNsdWRlL2RybS9kcm1fZHJ2LmgKaW5kZXggNjhjYTczNmM1
NDhkLi4yNGY4ZDA1NGM1NzAgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvZHJtL2RybV9kcnYuaAorKysg
Yi9pbmNsdWRlL2RybS9kcm1fZHJ2LmgKQEAgLTc5OSw1ICs3OTksOSBAQCBzdGF0aWMgaW5saW5l
IGJvb2wgZHJtX2Rydl91c2VzX2F0b21pY19tb2Rlc2V0KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYp
CiAKIGludCBkcm1fZGV2X3NldF91bmlxdWUoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgY29uc3Qg
Y2hhciAqbmFtZSk7CiAKK2ludCBkcm1fbWlub3JfZm9yX2VhY2goaW50ICgqZm4pKGludCBpZCwg
dm9pZCAqcCwgdm9pZCAqZGF0YSksIHZvaWQgKmRhdGEpOworCitzdHJ1Y3QgZHJtX21pbm9yICpk
cm1fbWlub3JfYWNxdWlyZSh1bnNpZ25lZCBpbnQgbWlub3JfaWQpOwordm9pZCBkcm1fbWlub3Jf
cmVsZWFzZShzdHJ1Y3QgZHJtX21pbm9yICptaW5vcik7CiAKICNlbmRpZgotLSAKMi4yMi4wCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
