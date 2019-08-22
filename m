Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8BC79959F
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2019 15:58:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2466F6EB41;
	Thu, 22 Aug 2019 13:57:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770053.outbound.protection.outlook.com [40.107.77.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EEE06EB3F
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2019 13:57:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YeMF4QD1k1RpPSkE+quPksWiJ492QLaKBPjntktNvDNJbTRvaZxo0SsbgZpM5s5HOI0DhOh8+PG/T8EEcnBx55lGtjqesxO75l5pbxSOvwu0W6k0Pd34PumDVz4H9PUkSDwGcGtPieC+4cMD1GC+WQ6SvKIsasmxgAr2uKjrsH6X9npjQi0+UCPd1KSluuV2vgRa+3eCQNRVzyLNtcdl21zk7V7avaejbEy/xOP4Nlm1Rfjro4F9tEqWALhAm3hsFZRtGNu9iUWzV6YrDcvGNwLzk5O3b9zRrGBYy2MseP913vMiJFeuclewUFjUmfUtIEmPVH8efhJWEtc7EUMlig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6tghymll+DLkIrA+sT+JSr3VAT/xCTp3q8vQOIIaaWc=;
 b=Md/8xip3E+4WhOwiRaPmZnPsaF+HzQhUBMsa1TR2Eg/fokJsEgf19cs2LX+teccHaRTpLbHqeAsStKfWXL9a+1DNngJBbn436mv+M0z5DMeCXBvnMZM9pEKbslPwbNA7P2J7pDCede8nyTIog7zyxz9bQbwZyvUcIwetn3byc3W4JFRSdPx5+Hi5qQp6iNZPFPFNHHIg7fFQo1DrOVXjOYDrU6DtiJ3b+cADkxViIAz+bX5ezfBpMEPc/U7gnXlQys4/LIgUlsv16JGtnKyoN8reKemGREcmZgu8s4YW3wyJxRf4+Z+R5s4f12wNQhneIzIic0O0J1D+7v2wAMVxRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM3PR12CA0074.namprd12.prod.outlook.com (2603:10b6:0:57::18) by
 BN6PR12MB1266.namprd12.prod.outlook.com (2603:10b6:404:14::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Thu, 22 Aug 2019 13:57:49 +0000
Received: from CO1NAM03FT023.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::203) by DM3PR12CA0074.outlook.office365.com
 (2603:10b6:0:57::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2199.14 via Frontend
 Transport; Thu, 22 Aug 2019 13:57:49 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT023.mail.protection.outlook.com (10.152.80.157) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Thu, 22 Aug 2019 13:57:49 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Thu, 22 Aug 2019 08:57:45 -0500
From: David Francis <David.Francis@amd.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v4 3/5] drm/dp-mst: Add MST support to DP DPCD R/W functions
Date: Thu, 22 Aug 2019 09:57:39 -0400
Message-ID: <20190822135741.12923-4-David.Francis@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190822135741.12923-1-David.Francis@amd.com>
References: <20190822135741.12923-1-David.Francis@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(396003)(136003)(39860400002)(376002)(2980300002)(428003)(189003)(199004)(51416003)(126002)(81166006)(16586007)(50466002)(4326008)(26005)(76176011)(14444005)(86362001)(70586007)(70206006)(8936002)(336012)(426003)(186003)(478600001)(36756003)(6916009)(6666004)(47776003)(356004)(48376002)(49486002)(81156014)(8676002)(50226002)(316002)(2906002)(476003)(305945005)(2351001)(54906003)(446003)(486006)(2616005)(5660300002)(11346002)(1076003)(53936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1266; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9394ad19-9dfa-4f81-eb8d-08d72708b7cb
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600166)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328);
 SRVR:BN6PR12MB1266; 
X-MS-TrafficTypeDiagnostic: BN6PR12MB1266:
X-Microsoft-Antispam-PRVS: <BN6PR12MB1266F355D1936842A8EA40D4EFA50@BN6PR12MB1266.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 01371B902F
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: Sl3ukovUJ62uTKEk7oLhif8WXt/+sCgdZOjLGefpYRUeGucTfIpfN3vFZVp+t83WKq6CcID3YefzO+2172mBkOJCFeA0gDz+sZ1/egNpGOkyhHFGkbSmW/BAa4IN4nIzs1thXSWsVkBvWrsnFUh6IrH/YUqrY75MxsXKuGlw7JAlia09jC6A8aOYPAN1fwT1Ka4PRCh0hly3pVPsHpJXlmrNgDcgunmw6ro8S8516vZaXIvm9X+ftJ+c8mFkMpsJVP8rm6LTBaYnn4P+EMYkNtZJZxoCPB78dIWr0/qqkDkjV1lkXKsyjQ/hRXThxpMqU+WtGiLJnpZTkEPhE+Gq1whClL6I2vXnIk4LSyBM5RytWkp/72oBA4SD3D8F2Z3h/jh2BXT/fYEb9ndZg/df5Tz67WAelSrde0vAgqG0efM=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2019 13:57:49.1079 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9394ad19-9dfa-4f81-eb8d-08d72708b7cb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1266
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6tghymll+DLkIrA+sT+JSr3VAT/xCTp3q8vQOIIaaWc=;
 b=yld0Q+c60Df2OAGsR8lJQWnHW3c4tTmZZO3flNlj0N2plftsOOUxHORQ8HYXXb6HxeaH04j0+vbX5R+EDrIMve1Z+ahGyKgSqiNziNK/ryx96TbUgE975UC8QzQV67H3sOH18ZgM9IxJCH0eHK/vYLeYIVUP0J0NygSBjMdJjn0=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is
 165.204.84.17)
 smtp.mailfrom=amd.com; redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=permerror action=none header.from=amd.com;
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
Cc: Leo Li <sunpeng.li@amd.com>, David Francis <David.Francis@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW5zdGVhZCBvZiBoYXZpbmcgZHJtX2RwX2RwY2RfcmVhZC93cml0ZSBhbmQKZHJtX2RwX21zdF9k
cGNkX3JlYWQvd3JpdGUgYXMgZW50cnkgcG9pbnRzIGludG8gdGhlCmF1eCBjb2RlLCBoYXZlIGRy
bV9kcF9kcGNkX3JlYWQvd3JpdGUgaGFuZGxlIGJvdGguCgpUaGlzIG1lYW5zIHRoYXQgRFJNIGRy
aXZlcnMgY2FuIG1ha2UgTVNUIERQQ0QgcmVhZC93cml0ZXMuCgp2MjogRml4IHNwYWNpbmcKCkNj
OiBMZW8gTGkgPHN1bnBlbmcubGlAYW1kLmNvbT4KQ2M6IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhh
dC5jb20+ClNpZ25lZC1vZmYtYnk6IERhdmlkIEZyYW5jaXMgPERhdmlkLkZyYW5jaXNAYW1kLmNv
bT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2RwX2F1eF9kZXYuYyB8IDEyICsrLS0tLS0tLS0t
LQogZHJpdmVycy9ncHUvZHJtL2RybV9kcF9oZWxwZXIuYyAgfCAxMCArKysrKysrKy0tCiAyIGZp
bGVzIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDEyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfYXV4X2Rldi5jIGIvZHJpdmVycy9ncHUvZHJtL2Ry
bV9kcF9hdXhfZGV2LmMKaW5kZXggMGNmYjM4Njc1NGMzLi40MThjYWQ0ZjY0OWEgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfYXV4X2Rldi5jCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9kcm1fZHBfYXV4X2Rldi5jCkBAIC0xNjMsMTEgKzE2Myw3IEBAIHN0YXRpYyBzc2l6ZV90IGF1
eGRldl9yZWFkX2l0ZXIoc3RydWN0IGtpb2NiICppb2NiLCBzdHJ1Y3QgaW92X2l0ZXIgKnRvKQog
CQkJYnJlYWs7CiAJCX0KIAotCQlpZiAoYXV4X2Rldi0+YXV4LT5pc19yZW1vdGUpCi0JCQlyZXMg
PSBkcm1fZHBfbXN0X2RwY2RfcmVhZChhdXhfZGV2LT5hdXgsIHBvcywgYnVmLAotCQkJCQkJICAg
dG9kbyk7Ci0JCWVsc2UKLQkJCXJlcyA9IGRybV9kcF9kcGNkX3JlYWQoYXV4X2Rldi0+YXV4LCBw
b3MsIGJ1ZiwgdG9kbyk7CisJCXJlcyA9IGRybV9kcF9kcGNkX3JlYWQoYXV4X2Rldi0+YXV4LCBw
b3MsIGJ1ZiwgdG9kbyk7CiAKIAkJaWYgKHJlcyA8PSAwKQogCQkJYnJlYWs7CkBAIC0yMTUsMTEg
KzIxMSw3IEBAIHN0YXRpYyBzc2l6ZV90IGF1eGRldl93cml0ZV9pdGVyKHN0cnVjdCBraW9jYiAq
aW9jYiwgc3RydWN0IGlvdl9pdGVyICpmcm9tKQogCQkJYnJlYWs7CiAJCX0KIAotCQlpZiAoYXV4
X2Rldi0+YXV4LT5pc19yZW1vdGUpCi0JCQlyZXMgPSBkcm1fZHBfbXN0X2RwY2Rfd3JpdGUoYXV4
X2Rldi0+YXV4LCBwb3MsIGJ1ZiwKLQkJCQkJCSAgICB0b2RvKTsKLQkJZWxzZQotCQkJcmVzID0g
ZHJtX2RwX2RwY2Rfd3JpdGUoYXV4X2Rldi0+YXV4LCBwb3MsIGJ1ZiwgdG9kbyk7CisJCXJlcyA9
IGRybV9kcF9tc3RfZHBjZF93cml0ZShhdXhfZGV2LT5hdXgsIHBvcywgYnVmLCB0b2RvKTsKIAog
CQlpZiAocmVzIDw9IDApCiAJCQlicmVhazsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9k
cm1fZHBfaGVscGVyLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX2hlbHBlci5jCmluZGV4IGZm
YzY4ZDMwNWFmZS4uYjE1OTk3NjBiNmEzIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJt
X2RwX2hlbHBlci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfaGVscGVyLmMKQEAgLTMw
LDYgKzMwLDcgQEAKICNpbmNsdWRlIDxsaW51eC9zZXFfZmlsZS5oPgogCiAjaW5jbHVkZSA8ZHJt
L2RybV9kcF9oZWxwZXIuaD4KKyNpbmNsdWRlIDxkcm0vZHJtX2RwX21zdF9oZWxwZXIuaD4KICNp
bmNsdWRlIDxkcm0vZHJtX3ByaW50Lmg+CiAjaW5jbHVkZSA8ZHJtL2RybV92YmxhbmsuaD4KIApA
QCAtMjUxLDcgKzI1Miw3IEBAIHN0YXRpYyBpbnQgZHJtX2RwX2RwY2RfYWNjZXNzKHN0cnVjdCBk
cm1fZHBfYXV4ICphdXgsIHU4IHJlcXVlc3QsCiAKIC8qKgogICogZHJtX2RwX2RwY2RfcmVhZCgp
IC0gcmVhZCBhIHNlcmllcyBvZiBieXRlcyBmcm9tIHRoZSBEUENECi0gKiBAYXV4OiBEaXNwbGF5
UG9ydCBBVVggY2hhbm5lbAorICogQGF1eDogRGlzcGxheVBvcnQgQVVYIGNoYW5uZWwgKFNTVCBv
ciBNU1QpCiAgKiBAb2Zmc2V0OiBhZGRyZXNzIG9mIHRoZSAoZmlyc3QpIHJlZ2lzdGVyIHRvIHJl
YWQKICAqIEBidWZmZXI6IGJ1ZmZlciB0byBzdG9yZSB0aGUgcmVnaXN0ZXIgdmFsdWVzCiAgKiBA
c2l6ZTogbnVtYmVyIG9mIGJ5dGVzIGluIEBidWZmZXIKQEAgLTI2OCw2ICsyNjksOCBAQCBzc2l6
ZV90IGRybV9kcF9kcGNkX3JlYWQoc3RydWN0IGRybV9kcF9hdXggKmF1eCwgdW5zaWduZWQgaW50
IG9mZnNldCwKIHsKIAlpbnQgcmV0OwogCisJaWYgKGF1eC0+aXNfcmVtb3RlKQorCQlyZXR1cm4g
ZHJtX2RwX21zdF9kcGNkX3JlYWQoYXV4LCBvZmZzZXQsIGJ1ZmZlciwgc2l6ZSk7CiAJLyoKIAkg
KiBIUCBaUjI0dyBjb3JydXB0cyB0aGUgZmlyc3QgRFBDRCBhY2Nlc3MgYWZ0ZXIgZW50ZXJpbmcg
cG93ZXIgc2F2ZQogCSAqIG1vZGUuIEVnLiBvbiBhIHJlYWQsIHRoZSBlbnRpcmUgYnVmZmVyIHdp
bGwgYmUgZmlsbGVkIHdpdGggdGhlIHNhbWUKQEAgLTI5Niw3ICsyOTksNyBAQCBFWFBPUlRfU1lN
Qk9MKGRybV9kcF9kcGNkX3JlYWQpOwogCiAvKioKICAqIGRybV9kcF9kcGNkX3dyaXRlKCkgLSB3
cml0ZSBhIHNlcmllcyBvZiBieXRlcyB0byB0aGUgRFBDRAotICogQGF1eDogRGlzcGxheVBvcnQg
QVVYIGNoYW5uZWwKKyAqIEBhdXg6IERpc3BsYXlQb3J0IEFVWCBjaGFubmVsIChTU1Qgb3IgTVNU
KQogICogQG9mZnNldDogYWRkcmVzcyBvZiB0aGUgKGZpcnN0KSByZWdpc3RlciB0byB3cml0ZQog
ICogQGJ1ZmZlcjogYnVmZmVyIGNvbnRhaW5pbmcgdGhlIHZhbHVlcyB0byB3cml0ZQogICogQHNp
emU6IG51bWJlciBvZiBieXRlcyBpbiBAYnVmZmVyCkBAIC0zMTMsNiArMzE2LDkgQEAgc3NpemVf
dCBkcm1fZHBfZHBjZF93cml0ZShzdHJ1Y3QgZHJtX2RwX2F1eCAqYXV4LCB1bnNpZ25lZCBpbnQg
b2Zmc2V0LAogewogCWludCByZXQ7CiAKKwlpZiAoYXV4LT5pc19yZW1vdGUpCisJCXJldHVybiBk
cm1fZHBfbXN0X2RwY2Rfd3JpdGUoYXV4LCBvZmZzZXQsIGJ1ZmZlciwgc2l6ZSk7CisKIAlyZXQg
PSBkcm1fZHBfZHBjZF9hY2Nlc3MoYXV4LCBEUF9BVVhfTkFUSVZFX1dSSVRFLCBvZmZzZXQsIGJ1
ZmZlciwKIAkJCQkgc2l6ZSk7CiAJZHJtX2RwX2R1bXBfYWNjZXNzKGF1eCwgRFBfQVVYX05BVElW
RV9XUklURSwgb2Zmc2V0LCBidWZmZXIsIHJldCk7Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
