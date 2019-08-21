Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E9A9850D
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2019 22:02:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 699AC6EA02;
	Wed, 21 Aug 2019 20:02:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700045.outbound.protection.outlook.com [40.107.70.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34A726E9F7;
 Wed, 21 Aug 2019 20:02:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kQnp5IGOpUuD9GdTYOCLNSRF9Su5gH6CGzPCSJLdJ0bLBvjEnq7cpk6yoHoKpHxb8oBr7vsx6dTeFWfq3D31Pzl9tZRt7Y3k0Ad88bixTqBRgrHoCcnLfKqikK9mBnZOpewRrUWVtNPva53Xh6PJCGlwN0oWqqV1u9brawcSK4sGa+wopnldd5gLBfSxTv0Sg3380QLFfTUphVnRRjZYfdYK1Z4mOwY03/m9iWj7XIob7T+NvbAALXkXYfFZsKTI8e0Pl2gcOuBB6M41dup5UHss+JZWJgcjMMNy+agKp4JdHg3yq8OxjiXeQa7S8B3CnJpNMzaYapiaG2cVZIi5mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EuD99UH5Pt9SHIeSFXx1uhxmwAxj1QAmAXcL+/E/3aE=;
 b=YbM2tcckOcxdXbBhmxEi+cIdoQdP6o2vtdNKH2To0vkHKtcT1JAYCPQTqxNjvKmes5mWphW9X6fcmdmhNb2QWIFaAlUspm6k86pT+3AlmG6eUBRUAndelAokkVukGD+lqaCop5T5kKj7g7sYJenEECMJ3nJa1nBs9T+UMZzxXf5Mmh6oi113i7AeenMzJ40eHOHXo/10Ad4NEIF9/6ALGFgtrRuGKiqBMoQzH55nO8830Fx/oYOy40xOZ5IvwLcHhkGWIBQSf4ASrzQiGjZNvClPsJiQDhmaPJvlR8OLurdhwflDBRx1+HykgrOiM8Uiexa4l5g21q4ANRa4tdVzcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from BN4PR12CA0009.namprd12.prod.outlook.com (2603:10b6:403:2::19)
 by DM5PR12MB1276.namprd12.prod.outlook.com (2603:10b6:3:79::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2178.16; Wed, 21 Aug
 2019 20:02:09 +0000
Received: from CO1NAM03FT063.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::208) by BN4PR12CA0009.outlook.office365.com
 (2603:10b6:403:2::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2178.16 via Frontend
 Transport; Wed, 21 Aug 2019 20:02:08 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 CO1NAM03FT063.mail.protection.outlook.com (10.152.81.61) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Wed, 21 Aug 2019 20:02:08 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1;
 Wed, 21 Aug 2019 15:01:44 -0500
From: David Francis <David.Francis@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v3 14/16] drm/amd/display: Write DSC enable to MST DPCD
Date: Wed, 21 Aug 2019 16:01:27 -0400
Message-ID: <20190821200129.11575-15-David.Francis@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190821200129.11575-1-David.Francis@amd.com>
References: <20190821200129.11575-1-David.Francis@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(136003)(39860400002)(396003)(2980300002)(428003)(199004)(189003)(476003)(126002)(5660300002)(8676002)(53936002)(110136005)(47776003)(486006)(51416003)(478600001)(14444005)(48376002)(81156014)(50466002)(81166006)(8936002)(49486002)(2906002)(36756003)(70586007)(70206006)(450100002)(76176011)(4326008)(1076003)(336012)(356004)(6666004)(446003)(316002)(54906003)(305945005)(186003)(11346002)(2616005)(26005)(16586007)(50226002)(426003)(86362001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1276; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 585ab15b-2a64-4bcb-0344-08d726727289
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:DM5PR12MB1276; 
X-MS-TrafficTypeDiagnostic: DM5PR12MB1276:
X-Microsoft-Antispam-PRVS: <DM5PR12MB127614BEE7A2F67A8705DA3DEFAA0@DM5PR12MB1276.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1360;
X-Forefront-PRVS: 0136C1DDA4
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 80aMX0Bk1CcGVG2SfnrfNXET5O0cXbgASsYftqe5tlHbHxsFth+aKVQaz1dV84xLJmzyd2YpP16A9J3ed8WgCOS1cJLY/0A6Ol1S/lf2/uLyu2dCD8Y3cPkIF8r5RCRJSdl0WlkP/+KpyFCqJ1GtVX/yum+t6gUwMpXtLyvpQWthGsHkqz/S+jR47ib4r3rbx3leJso07YqYnHoKSmRKpcm4jRBQZEi3/JF6FNhL+QL1WMJhDsF2yvIwYjAVgcLqBs3O5J6w1CNp7DEEKAre1jkk7JVVkmXEn48GFdelzqCuaiLPKaZoyOKy0305ZFbAdKOuA7HvpeJ9E52TeQJ13V5XfXON5beLrg7oX+GGoyzb4S5qE/ogq4EnzmL8yP+6yiR4SEDVz0DvUGFm5s0Dirv+BjhxUAs26z1lGUuJD04=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2019 20:02:08.4012 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 585ab15b-2a64-4bcb-0344-08d726727289
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1276
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EuD99UH5Pt9SHIeSFXx1uhxmwAxj1QAmAXcL+/E/3aE=;
 b=W1lbwDn57E5i9DssCK5ZizX/gO8n4CTBGPoslbg2lrwcz9VL+9hcTUcB8R0H0prbd5BzFr/dwgEaB1Q9aV0qhjIkiFOUigfmq6UjM1Wqm51dmtEgOVxZflvND2jhg/5MCJCkbFfVyqlAJUnz0Ugeh4mzWxi0QdJSeFozZAeDOgU=
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
Cc: David Francis <David.Francis@amd.com>, Wenjing Liu <Wenjing.Liu@amd.com>,
 Nikola Cornij <Nikola.Cornij@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UmV3b3JrIHRoZSBkbV9oZWxwZXJzX3dyaXRlX2RzY19lbmFibGUgY2FsbGJhY2sgdG8KaGFuZGxl
IHRoZSBNU1QgY2FzZS4KClVzZSB0aGUgZHJtX2RwX21zdF9kc2NfZW5hYmxlIGhlbHBlci4KCkNj
OiBXZW5qaW5nIExpdSA8V2VuamluZy5MaXVAYW1kLmNvbT4KQ2M6IE5pa29sYSBDb3JuaWogPE5p
a29sYS5Db3JuaWpAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogRGF2aWQgRnJhbmNpcyA8RGF2aWQu
RnJhbmNpc0BhbWQuY29tPgotLS0KIC4uLi9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2Rt
X2hlbHBlcnMuYyAgICB8IDE2ICsrKysrKysrKysrKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCAxNSBp
bnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1faGVscGVycy5jIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1faGVscGVycy5jCmluZGV4IDcxNmQ2
NTc3Y2RiZC4uNmVmNjgwZmEyODc1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rp
c3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9oZWxwZXJzLmMKKysrIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1faGVscGVycy5jCkBAIC0zOCw2ICszOCw3
IEBACiAjaW5jbHVkZSAiZGMuaCIKICNpbmNsdWRlICJhbWRncHVfZG0uaCIKICNpbmNsdWRlICJh
bWRncHVfZG1faXJxLmgiCisjaW5jbHVkZSAiYW1kZ3B1X2RtX21zdF90eXBlcy5oIgogCiAjaW5j
bHVkZSAiZG1faGVscGVycy5oIgogCkBAIC01NTcsOCArNTU4LDIxIEBAIGJvb2wgZG1faGVscGVy
c19kcF93cml0ZV9kc2NfZW5hYmxlKAogKQogewogCXVpbnQ4X3QgZW5hYmxlX2RzYyA9IGVuYWJs
ZSA/IDEgOiAwOworCXN0cnVjdCBhbWRncHVfZG1fY29ubmVjdG9yICphY29ubmVjdG9yOworCisJ
aWYgKCFzdHJlYW0pCisJCXJldHVybiBmYWxzZTsKKworCWlmIChzdHJlYW0tPnNpZ25hbCA9PSBT
SUdOQUxfVFlQRV9ESVNQTEFZX1BPUlRfTVNUKSB7CisJCWFjb25uZWN0b3IgPSAoc3RydWN0IGFt
ZGdwdV9kbV9jb25uZWN0b3IgKilzdHJlYW0tPmRtX3N0cmVhbV9jb250ZXh0OworCisJCXJldHVy
biAoZHJtX2RwX21zdF9kc2NfZW5hYmxlKGFjb25uZWN0b3ItPnBvcnQsIGVuYWJsZSkgPj0gMCk7
CisJfQorCisJaWYgKHN0cmVhbS0+c2lnbmFsID09IFNJR05BTF9UWVBFX0RJU1BMQVlfUE9SVCkK
KwkJcmV0dXJuIGRtX2hlbHBlcnNfZHBfd3JpdGVfZHBjZChjdHgsIHN0cmVhbS0+bGluaywgRFBf
RFNDX0VOQUJMRSwgJmVuYWJsZV9kc2MsIDEpOwogCi0JcmV0dXJuIGRtX2hlbHBlcnNfZHBfd3Jp
dGVfZHBjZChjdHgsIHN0cmVhbS0+c2luay0+bGluaywgRFBfRFNDX0VOQUJMRSwgJmVuYWJsZV9k
c2MsIDEpOworCXJldHVybiBmYWxzZTsKIH0KICNlbmRpZgogCi0tIAoyLjE3LjEKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
