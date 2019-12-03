Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E77A7110048
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 15:36:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64E346E794;
	Tue,  3 Dec 2019 14:35:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760071.outbound.protection.outlook.com [40.107.76.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54BF56E794;
 Tue,  3 Dec 2019 14:35:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OeYTHjeEtwmX24R027dm4NzxqlOU6o8ePUTwFsMfnNlaBMVhf8kD17SwSt5MXUSgQc+MTxIBdJp5NuY/6WDimV4/Q1BsedrLaLDtBaaX0y7mvDpnVlo1qQXlx20ABc+oRTP0Vxe1WFebRywUMFiN+Hw4EYYeaqspc41IXB7sWNqappaBkBWGnD/m58hU/TMv3RcWLRAuGvQe6Jg7Ko/ANbVz9L/N+nHZxT/bxwfGV7c7bzzLi6804NC4u1EqLU+KgyEQeeFCvWuuHcw9MoId/vheAs++3GDwIYZrd59omcyV3LPAt2GvSi8jSL7E+r0SCuqQ4PTqll4PSD/Ip5bq+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LkXIeU5cUmVLADhdjOnrIFma4xF0glStBcMFDZqZfY4=;
 b=P8P4/50vD29WCyBpEMKDrO1aYD+F5KqeaxySF9v+l+xUknw/P87bppEVjjl0N1nAzjJpEMCISWzDJ8XS4TnfoRdzr9lQxXHDegSlaqD7Vlj0XMZ6LB8IaYwCenkeDi+qoT3a3FMUI/Dr7p5/+vROsaChB/1nfTQ49OUMEcdhpTDqDcxoQxS8meOqQhRwlFmuJayOH8Iqhgmi66WJvJGmt/pFYlyUOQmiz1mmLYLdzwX6kw7WvVCLwLKSISCo+SZJSKOh+NvRIGvOjb/KQNK5zJRGxNuBIt4Mf28gKp0pDWQtQwHtLks8n+2dFHomYrRPSsujFgwHECmhB3Xmb1hdbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM6PR12CA0027.namprd12.prod.outlook.com (2603:10b6:5:1c0::40)
 by BN8PR12MB3537.namprd12.prod.outlook.com (2603:10b6:408:6d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2495.22; Tue, 3 Dec
 2019 14:35:43 +0000
Received: from DM6NAM11FT054.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eaa::202) by DM6PR12CA0027.outlook.office365.com
 (2603:10b6:5:1c0::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2495.18 via Frontend
 Transport; Tue, 3 Dec 2019 14:35:43 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 DM6NAM11FT054.mail.protection.outlook.com (10.13.173.95) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.2451.23 via Frontend Transport; Tue, 3 Dec 2019 14:35:43 +0000
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Tue, 3 Dec 2019
 08:35:42 -0600
Received: from mlipski-pc.amd.com (10.180.168.240) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Tue, 3 Dec 2019 08:35:41 -0600
From: <mikita.lipski@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v8 03/17] drm/dp_mst: Add MST support to DP DPCD R/W functions
Date: Tue, 3 Dec 2019 09:35:16 -0500
Message-ID: <20191203143530.27262-4-mikita.lipski@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191203143530.27262-1-mikita.lipski@amd.com>
References: <20191203143530.27262-1-mikita.lipski@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(136003)(346002)(39860400002)(428003)(189003)(199004)(336012)(450100002)(305945005)(54906003)(2351001)(81166006)(8676002)(16586007)(5660300002)(70586007)(70206006)(81156014)(426003)(50466002)(446003)(11346002)(36756003)(8936002)(48376002)(316002)(2616005)(50226002)(478600001)(1076003)(6916009)(26005)(86362001)(53416004)(2876002)(2906002)(356004)(51416003)(6666004)(14444005)(4326008)(76176011)(186003)(7696005)(16060500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB3537; H:SATLEXMB02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 12678698-0106-4dfe-4593-08d777fe13bb
X-MS-TrafficTypeDiagnostic: BN8PR12MB3537:
X-Microsoft-Antispam-PRVS: <BN8PR12MB353743542868CF2C2E0B384CE4420@BN8PR12MB3537.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 02408926C4
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uZ9m6boa1kxhEj2h6QG0KpB4TcggCRGKzfu32tRdVgfkUCWVlbve+zWUULv8iAK12qe538GuP4Am4Sto0JGji4/4o28JOfEYTxhrmpErTOE1hCtIMmsHLlm/3dgbkb17InxK03NZLWLoSFw361lxW4S1t3Et9jHx1wm1r2V2l8+tTmS02uaggKvE6NnBZ93QmHR1f+RALI8qX21POvjUhnXVRQORovlN+jdqDKt7iBntfh8hFa+j5rs0j5ESzqzVJ4GvSHSVs/qd2y1FhtfyLWTz+F9eYj6BoPKSP5VdclFauZ0IermbJYLcM7pl9t5yFlL5rx7Ia2+KKQhMiceUwyiL1yiMKa+Y7yO5jaYcY7/onjGF0nNoID4XCsIpJXkM/ngzTV6nDNWJkQQnyuPZGXGcbMnoeLAxT64dhz9mEUML2GkSFuDxyEnn61h0SJ/O
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2019 14:35:43.1812 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 12678698-0106-4dfe-4593-08d777fe13bb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3537
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LkXIeU5cUmVLADhdjOnrIFma4xF0glStBcMFDZqZfY4=;
 b=YBb9dl8AL3B2l2XUBcBDuyeIVGVuN/QsA9g3rkO5gs8id7zqS0sjyPaxoE07hEK8tbUhB8VSABEZDLj7DvINHEw1jIX8JtcXAvKm5difPHmSS4jjuitKrCej1bPv4RNeBw2HJqkMkIfS+rUdTK3oyBnCkAdtE67O+rWCDSEVfMw=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is
 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=permerror action=none
 header.from=amd.com;
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
Cc: David Francis <David.Francis@amd.com>,
 Mikita Lipski <mikita.lipski@amd.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogRGF2aWQgRnJhbmNpcyA8RGF2aWQuRnJhbmNpc0BhbWQuY29tPgoKSW5zdGVhZCBvZiBo
YXZpbmcgZHJtX2RwX2RwY2RfcmVhZC93cml0ZSBhbmQKZHJtX2RwX21zdF9kcGNkX3JlYWQvd3Jp
dGUgYXMgZW50cnkgcG9pbnRzIGludG8gdGhlCmF1eCBjb2RlLCBoYXZlIGRybV9kcF9kcGNkX3Jl
YWQvd3JpdGUgaGFuZGxlIGJvdGguCgpUaGlzIG1lYW5zIHRoYXQgRFJNIGRyaXZlcnMgY2FuIG1h
a2UgTVNUIERQQ0QgcmVhZC93cml0ZXMuCgp2MjogRml4IHNwYWNpbmcKdjM6IER1bXAgZHBjZCBh
Y2Nlc3Mgb24gTVNUIHJlYWQvd3JpdGVzCnY0OiBGaXggY2FsbGluZyB3cm9uZyBmdW5jdGlvbiBv
biBEUENEIHdyaXRlCnY1OiBkZWxldGUgZGVwcmVjYXRlZCBpbmNsdWRlIG9mIGRybVAuaAoKUmV2
aWV3ZWQtYnk6IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5jb20+ClJldmlld2VkLWJ5OiBIYXJy
eSBXZW50bGFuZCA8aGFycnkud2VudGxhbmRAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogRGF2aWQg
RnJhbmNpcyA8RGF2aWQuRnJhbmNpc0BhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBNaWtpdGEgTGlw
c2tpIDxtaWtpdGEubGlwc2tpQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2RybV9kcF9h
dXhfZGV2LmMgfCAxMiArKy0tLS0tLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fZHBfaGVscGVy
LmMgIHwgMzAgKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tCiAyIGZpbGVzIGNoYW5nZWQs
IDIyIGluc2VydGlvbnMoKyksIDIwIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9kcm1fZHBfYXV4X2Rldi5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9hdXhfZGV2
LmMKaW5kZXggMGNmYjM4Njc1NGMzLi4yNTEwNzE3ZDVhMDggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9kcm1fZHBfYXV4X2Rldi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfYXV4
X2Rldi5jCkBAIC0xNjMsMTEgKzE2Myw3IEBAIHN0YXRpYyBzc2l6ZV90IGF1eGRldl9yZWFkX2l0
ZXIoc3RydWN0IGtpb2NiICppb2NiLCBzdHJ1Y3QgaW92X2l0ZXIgKnRvKQogCQkJYnJlYWs7CiAJ
CX0KIAotCQlpZiAoYXV4X2Rldi0+YXV4LT5pc19yZW1vdGUpCi0JCQlyZXMgPSBkcm1fZHBfbXN0
X2RwY2RfcmVhZChhdXhfZGV2LT5hdXgsIHBvcywgYnVmLAotCQkJCQkJICAgdG9kbyk7Ci0JCWVs
c2UKLQkJCXJlcyA9IGRybV9kcF9kcGNkX3JlYWQoYXV4X2Rldi0+YXV4LCBwb3MsIGJ1ZiwgdG9k
byk7CisJCXJlcyA9IGRybV9kcF9kcGNkX3JlYWQoYXV4X2Rldi0+YXV4LCBwb3MsIGJ1ZiwgdG9k
byk7CiAKIAkJaWYgKHJlcyA8PSAwKQogCQkJYnJlYWs7CkBAIC0yMTUsMTEgKzIxMSw3IEBAIHN0
YXRpYyBzc2l6ZV90IGF1eGRldl93cml0ZV9pdGVyKHN0cnVjdCBraW9jYiAqaW9jYiwgc3RydWN0
IGlvdl9pdGVyICpmcm9tKQogCQkJYnJlYWs7CiAJCX0KIAotCQlpZiAoYXV4X2Rldi0+YXV4LT5p
c19yZW1vdGUpCi0JCQlyZXMgPSBkcm1fZHBfbXN0X2RwY2Rfd3JpdGUoYXV4X2Rldi0+YXV4LCBw
b3MsIGJ1ZiwKLQkJCQkJCSAgICB0b2RvKTsKLQkJZWxzZQotCQkJcmVzID0gZHJtX2RwX2RwY2Rf
d3JpdGUoYXV4X2Rldi0+YXV4LCBwb3MsIGJ1ZiwgdG9kbyk7CisJCXJlcyA9IGRybV9kcF9kcGNk
X3dyaXRlKGF1eF9kZXYtPmF1eCwgcG9zLCBidWYsIHRvZG8pOwogCiAJCWlmIChyZXMgPD0gMCkK
IAkJCWJyZWFrOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9oZWxwZXIuYyBi
L2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfaGVscGVyLmMKaW5kZXggMmM3ODcwYWVmNDY5Li4yZmFl
ZjhiZDkxMWYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfaGVscGVyLmMKKysr
IGIvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9oZWxwZXIuYwpAQCAtMzIsNiArMzIsNyBAQAogI2lu
Y2x1ZGUgPGRybS9kcm1fZHBfaGVscGVyLmg+CiAjaW5jbHVkZSA8ZHJtL2RybV9wcmludC5oPgog
I2luY2x1ZGUgPGRybS9kcm1fdmJsYW5rLmg+CisjaW5jbHVkZSA8ZHJtL2RybV9kcF9tc3RfaGVs
cGVyLmg+CiAKICNpbmNsdWRlICJkcm1fY3J0Y19oZWxwZXJfaW50ZXJuYWwuaCIKIApAQCAtMjY2
LDcgKzI2Nyw3IEBAIHN0YXRpYyBpbnQgZHJtX2RwX2RwY2RfYWNjZXNzKHN0cnVjdCBkcm1fZHBf
YXV4ICphdXgsIHU4IHJlcXVlc3QsCiAKIC8qKgogICogZHJtX2RwX2RwY2RfcmVhZCgpIC0gcmVh
ZCBhIHNlcmllcyBvZiBieXRlcyBmcm9tIHRoZSBEUENECi0gKiBAYXV4OiBEaXNwbGF5UG9ydCBB
VVggY2hhbm5lbAorICogQGF1eDogRGlzcGxheVBvcnQgQVVYIGNoYW5uZWwgKFNTVCBvciBNU1Qp
CiAgKiBAb2Zmc2V0OiBhZGRyZXNzIG9mIHRoZSAoZmlyc3QpIHJlZ2lzdGVyIHRvIHJlYWQKICAq
IEBidWZmZXI6IGJ1ZmZlciB0byBzdG9yZSB0aGUgcmVnaXN0ZXIgdmFsdWVzCiAgKiBAc2l6ZTog
bnVtYmVyIG9mIGJ5dGVzIGluIEBidWZmZXIKQEAgLTI5NSwxMyArMjk2LDE4IEBAIHNzaXplX3Qg
ZHJtX2RwX2RwY2RfcmVhZChzdHJ1Y3QgZHJtX2RwX2F1eCAqYXV4LCB1bnNpZ25lZCBpbnQgb2Zm
c2V0LAogCSAqIFdlIGp1c3QgaGF2ZSB0byBkbyBpdCBiZWZvcmUgYW55IERQQ0QgYWNjZXNzIGFu
ZCBob3BlIHRoYXQgdGhlCiAJICogbW9uaXRvciBkb2Vzbid0IHBvd2VyIGRvd24gZXhhY3RseSBh
ZnRlciB0aGUgdGhyb3cgYXdheSByZWFkLgogCSAqLwotCXJldCA9IGRybV9kcF9kcGNkX2FjY2Vz
cyhhdXgsIERQX0FVWF9OQVRJVkVfUkVBRCwgRFBfRFBDRF9SRVYsIGJ1ZmZlciwKLQkJCQkgMSk7
Ci0JaWYgKHJldCAhPSAxKQotCQlnb3RvIG91dDsKKwlpZiAoIWF1eC0+aXNfcmVtb3RlKSB7CisJ
CXJldCA9IGRybV9kcF9kcGNkX2FjY2VzcyhhdXgsIERQX0FVWF9OQVRJVkVfUkVBRCwgRFBfRFBD
RF9SRVYsCisJCQkJCSBidWZmZXIsIDEpOworCQlpZiAocmV0ICE9IDEpCisJCQlnb3RvIG91dDsK
Kwl9CiAKLQlyZXQgPSBkcm1fZHBfZHBjZF9hY2Nlc3MoYXV4LCBEUF9BVVhfTkFUSVZFX1JFQUQs
IG9mZnNldCwgYnVmZmVyLAotCQkJCSBzaXplKTsKKwlpZiAoYXV4LT5pc19yZW1vdGUpCisJCXJl
dCA9IGRybV9kcF9tc3RfZHBjZF9yZWFkKGF1eCwgb2Zmc2V0LCBidWZmZXIsIHNpemUpOworCWVs
c2UKKwkJcmV0ID0gZHJtX2RwX2RwY2RfYWNjZXNzKGF1eCwgRFBfQVVYX05BVElWRV9SRUFELCBv
ZmZzZXQsCisJCQkJCSBidWZmZXIsIHNpemUpOwogCiBvdXQ6CiAJZHJtX2RwX2R1bXBfYWNjZXNz
KGF1eCwgRFBfQVVYX05BVElWRV9SRUFELCBvZmZzZXQsIGJ1ZmZlciwgcmV0KTsKQEAgLTMxMSw3
ICszMTcsNyBAQCBFWFBPUlRfU1lNQk9MKGRybV9kcF9kcGNkX3JlYWQpOwogCiAvKioKICAqIGRy
bV9kcF9kcGNkX3dyaXRlKCkgLSB3cml0ZSBhIHNlcmllcyBvZiBieXRlcyB0byB0aGUgRFBDRAot
ICogQGF1eDogRGlzcGxheVBvcnQgQVVYIGNoYW5uZWwKKyAqIEBhdXg6IERpc3BsYXlQb3J0IEFV
WCBjaGFubmVsIChTU1Qgb3IgTVNUKQogICogQG9mZnNldDogYWRkcmVzcyBvZiB0aGUgKGZpcnN0
KSByZWdpc3RlciB0byB3cml0ZQogICogQGJ1ZmZlcjogYnVmZmVyIGNvbnRhaW5pbmcgdGhlIHZh
bHVlcyB0byB3cml0ZQogICogQHNpemU6IG51bWJlciBvZiBieXRlcyBpbiBAYnVmZmVyCkBAIC0z
MjgsOCArMzM0LDEyIEBAIHNzaXplX3QgZHJtX2RwX2RwY2Rfd3JpdGUoc3RydWN0IGRybV9kcF9h
dXggKmF1eCwgdW5zaWduZWQgaW50IG9mZnNldCwKIHsKIAlpbnQgcmV0OwogCi0JcmV0ID0gZHJt
X2RwX2RwY2RfYWNjZXNzKGF1eCwgRFBfQVVYX05BVElWRV9XUklURSwgb2Zmc2V0LCBidWZmZXIs
Ci0JCQkJIHNpemUpOworCWlmIChhdXgtPmlzX3JlbW90ZSkKKwkJcmV0ID0gZHJtX2RwX21zdF9k
cGNkX3dyaXRlKGF1eCwgb2Zmc2V0LCBidWZmZXIsIHNpemUpOworCWVsc2UKKwkJcmV0ID0gZHJt
X2RwX2RwY2RfYWNjZXNzKGF1eCwgRFBfQVVYX05BVElWRV9XUklURSwgb2Zmc2V0LAorCQkJCQkg
YnVmZmVyLCBzaXplKTsKKwogCWRybV9kcF9kdW1wX2FjY2VzcyhhdXgsIERQX0FVWF9OQVRJVkVf
V1JJVEUsIG9mZnNldCwgYnVmZmVyLCByZXQpOwogCXJldHVybiByZXQ7CiB9Ci0tIAoyLjE3LjEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
