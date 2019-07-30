Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CE737BA4B
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2019 09:14:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6636C6E688;
	Wed, 31 Jul 2019 07:13:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com
 [148.163.139.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAAFA6E584
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2019 14:58:29 +0000 (UTC)
Received: from pps.filterd (m0167090.ppops.net [127.0.0.1])
 by mx0b-00128a01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6UDHcxG009738; Tue, 30 Jul 2019 09:18:23 -0400
Received: from nam05-by2-obe.outbound.protection.outlook.com
 (mail-by2nam05lp2058.outbound.protection.outlook.com [104.47.50.58])
 by mx0b-00128a01.pphosted.com with ESMTP id 2u2hg2s45b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Jul 2019 09:18:23 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WvKNBcuv7aw9xU4GSjWmARVTzqfmMEB7B0gjEL7DhBi41TF7Czf5nc7tzg5+F1MHy3fdAuGgD3jls83uX3hV+eVWr4Bn+2nNVz8882ikgz4vQIOEWH78+E7IVfcfiS72m7jDinfwTcgBow/mCkjFQM7e4V/3b+nYBriYCLGD8P6X8IX8lyUpjGNW5D7Fay49n8v68OluukCX+ziOa/f9gyzmNaE96EscS09Mls4atYG+dLVJuJdTwugjqmlFLk1SzRNmPVYWgoE2kxhAcpvzBZiHJj/LIsdLb/djLQn8qGbUZXQJslbveVOc4qfQ5KdFGA+K6N9cthwmui+ymtpaGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s2SrJ4wk4uUCutofdOpios8mTyEHFTls/g28JLA1fqo=;
 b=D6I4uJZKxdbeY/rvRRDZeyw7iHbnADV4kD9CyNT9HI9DbWRgA2rw+1OcnPHj+bpbwOUt8kwd1XEV+x89fO/kOVL5igHv/A/V3PsjBOflzN6IjZCaaeMXcQgoyu0TBgk/7B+T1vJuzLrZTp0rZ5kZPcLXVgWrHbAAdDL7QamdOw0PEabc96n5HHJgOXyQeNX+igp+Z7TEuk4GfDRUj/5OJDBQirvwG+RNYIpABJLJbI+7lT/gJ0y4m0dJLCxLfnefASvrMCH0FMUZlvaoR2bo37hi4jjj3/xmQ6GCvk2KXTA0cfI7kmjTPHE8GfOH3NbyORYYSwfPVg04pj+j637gqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass (sender ip is
 137.71.25.57) smtp.rcpttodomain=kernel.org
 smtp.mailfrom=analog.com;dmarc=bestguesspass action=none
 header.from=analog.com;dkim=none (message not signed);arc=none
Received: from CY4PR03CA0086.namprd03.prod.outlook.com (2603:10b6:910:4d::27)
 by MWHPR03MB3054.namprd03.prod.outlook.com (2603:10b6:300:127::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2115.15; Tue, 30 Jul
 2019 13:18:21 +0000
Received: from BL2NAM02FT041.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e46::203) by CY4PR03CA0086.outlook.office365.com
 (2603:10b6:910:4d::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2115.13 via Frontend
 Transport; Tue, 30 Jul 2019 13:18:20 +0000
Received-SPF: Pass (protection.outlook.com: domain of analog.com designates
 137.71.25.57 as permitted sender) receiver=protection.outlook.com;
 client-ip=137.71.25.57; helo=nwd2mta2.analog.com;
Received: from nwd2mta2.analog.com (137.71.25.57) by
 BL2NAM02FT041.mail.protection.outlook.com (10.152.77.122) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2115.10
 via Frontend Transport; Tue, 30 Jul 2019 13:18:20 +0000
Received: from NWD2HUBCAS7.ad.analog.com (nwd2hubcas7.ad.analog.com
 [10.64.69.107])
 by nwd2mta2.analog.com (8.13.8/8.13.8) with ESMTP id x6UDIK1H025912
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Tue, 30 Jul 2019 06:18:20 -0700
Received: from btogorean-pc.ad.analog.com (10.48.65.146) by
 NWD2HUBCAS7.ad.analog.com (10.64.69.107) with Microsoft SMTP Server id
 14.3.408.0; Tue, 30 Jul 2019 09:18:19 -0400
From: Bogdan Togorean <bogdan.togorean@analog.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH 2/2] drm: bridge: adv7511: Add support for ADV7535
Date: Tue, 30 Jul 2019 16:17:36 +0300
Message-ID: <20190730131736.30187-3-bogdan.togorean@analog.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190730131736.30187-1-bogdan.togorean@analog.com>
References: <20190730131736.30187-1-bogdan.togorean@analog.com>
MIME-Version: 1.0
X-ADIRoutedOnPrem: True
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:137.71.25.57; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(396003)(376002)(346002)(39860400002)(136003)(2980300002)(199004)(189003)(6666004)(6916009)(76176011)(486006)(7416002)(356004)(7696005)(14444005)(5024004)(107886003)(36756003)(51416003)(446003)(336012)(426003)(5660300002)(126002)(50226002)(2616005)(305945005)(476003)(4326008)(316002)(11346002)(70586007)(2906002)(54906003)(478600001)(50466002)(48376002)(86362001)(70206006)(1076003)(2351001)(186003)(246002)(8676002)(44832011)(26005)(7636002)(8936002)(47776003)(106002)(2870700001)(16060500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR03MB3054; H:nwd2mta2.analog.com; FPR:;
 SPF:Pass; LANG:en; PTR:nwd2mail11.analog.com; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9fd81e4d-547d-4fe1-c777-08d714f0647b
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(4709080)(1401327)(2017052603328);
 SRVR:MWHPR03MB3054; 
X-MS-TrafficTypeDiagnostic: MWHPR03MB3054:
X-Microsoft-Antispam-PRVS: <MWHPR03MB30547B19431DBA8913CD69489BDC0@MWHPR03MB3054.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-Forefront-PRVS: 0114FF88F6
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: y8ZPrH9yWA20OHpiwJEbVcWj4zSaNR3VEvpM4adrFNNKGCKA91WbFRlwASqNjq2owUGw0nGmJ2edww4AoQhKOXXIdrCIAugexoabbreAurGFpenlJpm/Fir+qt/KwgktRu507fbfwfReqjVv5rCa5AabbAaG20JjNTBBFqQTa6lzJLbgU50wgJ8/v41zK08JY7DtE+yTIYRhhrgHKkNkuVZ4gRhSVarNeG04WaOiNc5xzjQwAnMFQK/ing5oZJPzTwDSfFsCinJmqdH+QEMsW3AA2FgNfCN8KvoTUTbyk2CrwyQKrPB6PWA/R4oBM8ktOl9OXK4jLWK4ejfPf5tfaU2Q/MeKqHsOD5m2TxawCYho/H3lXnIwvKiBmThDsp3/Af3AuzC4+ZYuQtKqmOLeI+qK+8qCc8KFSedcNozxB48=
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2019 13:18:20.5663 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fd81e4d-547d-4fe1-c777-08d714f0647b
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=eaa689b4-8f87-40e0-9c6f-7228de4d754a; Ip=[137.71.25.57];
 Helo=[nwd2mta2.analog.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR03MB3054
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-30_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1907300141
X-Mailman-Approved-At: Wed, 31 Jul 2019 07:13:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector2-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s2SrJ4wk4uUCutofdOpios8mTyEHFTls/g28JLA1fqo=;
 b=xd8n5QE6C6Wg9ES+nkSwUsgjQ4qL8oq2LUDfxo8kjTxjd79RMusb1n1AicX3lIb0t2ch7FKVcOIiCirY0/cOi1RLCwtyR2DKp33+L1OTDskN45EsJe2unva3qQZJiQvvYaHIffuf4LHtlYIl7afk7otd9olpFrBTjIJcIMC7apo=
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
Cc: airlied@linux.ie, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, Laurent.pinchart@ideasonboard.com, tglx@linutronix.de,
 sam@ravnborg.org, matt.redfearn@thinci.com, allison@lohutok.net,
 Bogdan Togorean <bogdan.togorean@analog.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QURWNzUzNSBpcyBhIERTSSB0byBIRE1JIGJyaWRnZSBjaGlwIGxpa2UgQURWNzUzMyBidXQgaXQg
YWxsb3dzCjEwODBwQDYwSHouIHYxcDIgaXMgZml4ZWQgdG8gMS44ViBvbiBBRFY3NTM1IGJ1dCBv
biBBRFY3NTMzIGNhbiBiZSAxLjJWCm9yIDEuOFYgYW5kIGlzIGNvbmZpZ3VyYWJsZSBpbiBhIHJl
Z2lzdGVyLgoKU2lnbmVkLW9mZi1ieTogQm9nZGFuIFRvZ29yZWFuIDxib2dkYW4udG9nb3JlYW5A
YW5hbG9nLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2Fkdjc1MTEvYWR2NzUxMS5o
ICAgICB8ICAyICsrCiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2Fkdjc1MTEvYWR2NzUxMV9kcnYu
YyB8IDMxICsrKysrKysrKysrKysrKy0tLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDI1IGluc2VydGlv
bnMoKyksIDggZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRn
ZS9hZHY3NTExL2Fkdjc1MTEuaCBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYWR2NzUxMS9hZHY3
NTExLmgKaW5kZXggNTJiMmFkZmRjODc3Li43MDI0MzI2MTVlYzggMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9icmlkZ2UvYWR2NzUxMS9hZHY3NTExLmgKKysrIGIvZHJpdmVycy9ncHUvZHJt
L2JyaWRnZS9hZHY3NTExL2Fkdjc1MTEuaApAQCAtOTEsNiArOTEsNyBAQAogI2RlZmluZSBBRFY3
NTExX1JFR19BUkNfQ1RSTAkJCTB4ZGYKICNkZWZpbmUgQURWNzUxMV9SRUdfQ0VDX0kyQ19BRERS
CQkweGUxCiAjZGVmaW5lIEFEVjc1MTFfUkVHX0NFQ19DVFJMCQkJMHhlMgorI2RlZmluZSBBRFY3
NTExX1JFR19TVVBQTFlfU0VMRUNUCQkweGU0CiAjZGVmaW5lIEFEVjc1MTFfUkVHX0NISVBfSURf
SElHSAkJMHhmNQogI2RlZmluZSBBRFY3NTExX1JFR19DSElQX0lEX0xPVwkJCTB4ZjYKIApAQCAt
MzIwLDYgKzMyMSw3IEBAIHN0cnVjdCBhZHY3NTExX3ZpZGVvX2NvbmZpZyB7CiBlbnVtIGFkdjc1
MTFfdHlwZSB7CiAJQURWNzUxMSwKIAlBRFY3NTMzLAorCUFEVjc1MzUsCiB9OwogCiAjZGVmaW5l
IEFEVjc1MTFfTUFYX0FERFJTIDMKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uv
YWR2NzUxMS9hZHY3NTExX2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hZHY3NTExL2Fk
djc1MTFfZHJ2LmMKaW5kZXggZjZkMjY4MWY2OTI3Li45NDEwNzJkZWNiNzMgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYWR2NzUxMS9hZHY3NTExX2Rydi5jCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9icmlkZ2UvYWR2NzUxMS9hZHY3NTExX2Rydi5jCkBAIC0zNjcsNyArMzY3LDcg
QEAgc3RhdGljIHZvaWQgYWR2NzUxMV9wb3dlcl9vbihzdHJ1Y3QgYWR2NzUxMSAqYWR2NzUxMSkK
IAkgKi8KIAlyZWdjYWNoZV9zeW5jKGFkdjc1MTEtPnJlZ21hcCk7CiAKLQlpZiAoYWR2NzUxMS0+
dHlwZSA9PSBBRFY3NTMzKQorCWlmIChhZHY3NTExLT50eXBlID09IEFEVjc1MzMgfHwgYWR2NzUx
MS0+dHlwZSA9PSBBRFY3NTM1KQogCQlhZHY3NTMzX2RzaV9wb3dlcl9vbihhZHY3NTExKTsKIAlh
ZHY3NTExLT5wb3dlcmVkID0gdHJ1ZTsKIH0KQEAgLTM4Nyw3ICszODcsNyBAQCBzdGF0aWMgdm9p
ZCBfX2Fkdjc1MTFfcG93ZXJfb2ZmKHN0cnVjdCBhZHY3NTExICphZHY3NTExKQogc3RhdGljIHZv
aWQgYWR2NzUxMV9wb3dlcl9vZmYoc3RydWN0IGFkdjc1MTEgKmFkdjc1MTEpCiB7CiAJX19hZHY3
NTExX3Bvd2VyX29mZihhZHY3NTExKTsKLQlpZiAoYWR2NzUxMS0+dHlwZSA9PSBBRFY3NTMzKQor
CWlmIChhZHY3NTExLT50eXBlID09IEFEVjc1MzMgfHwgYWR2NzUxMS0+dHlwZSA9PSBBRFY3NTM1
KQogCQlhZHY3NTMzX2RzaV9wb3dlcl9vZmYoYWR2NzUxMSk7CiAJYWR2NzUxMS0+cG93ZXJlZCA9
IGZhbHNlOwogfQpAQCAtNzYxLDcgKzc2MSw3IEBAIHN0YXRpYyB2b2lkIGFkdjc1MTFfbW9kZV9z
ZXQoc3RydWN0IGFkdjc1MTEgKmFkdjc1MTEsCiAJcmVnbWFwX3VwZGF0ZV9iaXRzKGFkdjc1MTEt
PnJlZ21hcCwgMHgxNywKIAkJMHg2MCwgKHZzeW5jX3BvbGFyaXR5IDw8IDYpIHwgKGhzeW5jX3Bv
bGFyaXR5IDw8IDUpKTsKIAotCWlmIChhZHY3NTExLT50eXBlID09IEFEVjc1MzMpCisJaWYgKGFk
djc1MTEtPnR5cGUgPT0gQURWNzUzMyB8fCBhZHY3NTExLT50eXBlID09IEFEVjc1MzUpCiAJCWFk
djc1MzNfbW9kZV9zZXQoYWR2NzUxMSwgYWRqX21vZGUpOwogCiAJZHJtX21vZGVfY29weSgmYWR2
NzUxMS0+Y3Vycl9tb2RlLCBhZGpfbW9kZSk7CkBAIC04NzQsNyArODc0LDcgQEAgc3RhdGljIGlu
dCBhZHY3NTExX2JyaWRnZV9hdHRhY2goc3RydWN0IGRybV9icmlkZ2UgKmJyaWRnZSkKIAkJCQkg
JmFkdjc1MTFfY29ubmVjdG9yX2hlbHBlcl9mdW5jcyk7CiAJZHJtX2Nvbm5lY3Rvcl9hdHRhY2hf
ZW5jb2RlcigmYWR2LT5jb25uZWN0b3IsIGJyaWRnZS0+ZW5jb2Rlcik7CiAKLQlpZiAoYWR2LT50
eXBlID09IEFEVjc1MzMpCisJaWYgKGFkdi0+dHlwZSA9PSBBRFY3NTMzIHx8IGFkdi0+dHlwZSA9
PSBBRFY3NTM1KQogCQlyZXQgPSBhZHY3NTMzX2F0dGFjaF9kc2koYWR2KTsKIAogCWlmIChhZHYt
PmkyY19tYWluLT5pcnEpCkBAIC05NTIsNyArOTUyLDcgQEAgc3RhdGljIGJvb2wgYWR2NzUxMV9j
ZWNfcmVnaXN0ZXJfdm9sYXRpbGUoc3RydWN0IGRldmljZSAqZGV2LCB1bnNpZ25lZCBpbnQgcmVn
KQogCXN0cnVjdCBpMmNfY2xpZW50ICppMmMgPSB0b19pMmNfY2xpZW50KGRldik7CiAJc3RydWN0
IGFkdjc1MTEgKmFkdjc1MTEgPSBpMmNfZ2V0X2NsaWVudGRhdGEoaTJjKTsKIAotCWlmIChhZHY3
NTExLT50eXBlID09IEFEVjc1MzMpCisJaWYgKGFkdjc1MTEtPnR5cGUgPT0gQURWNzUzMyB8fCBh
ZHY3NTExLT50eXBlID09IEFEVjc1MzUpCiAJCXJlZyAtPSBBRFY3NTMzX1JFR19DRUNfT0ZGU0VU
OwogCiAJc3dpdGNoIChyZWcpIHsKQEAgLTk5NCw3ICs5OTQsNyBAQCBzdGF0aWMgaW50IGFkdjc1
MTFfaW5pdF9jZWNfcmVnbWFwKHN0cnVjdCBhZHY3NTExICphZHYpCiAJCWdvdG8gZXJyOwogCX0K
IAotCWlmIChhZHYtPnR5cGUgPT0gQURWNzUzMykgeworCWlmIChhZHYtPnR5cGUgPT0gQURWNzUz
MyB8fCBhZHYtPnR5cGUgPT0gQURWNzUzNSkgewogCQlyZXQgPSBhZHY3NTMzX3BhdGNoX2NlY19y
ZWdpc3RlcnMoYWR2KTsKIAkJaWYgKHJldCkKIAkJCWdvdG8gZXJyOwpAQCAtMTA5NCw4ICsxMDk0
LDkgQEAgc3RhdGljIGludCBhZHY3NTExX3Byb2JlKHN0cnVjdCBpMmNfY2xpZW50ICppMmMsIGNv
bnN0IHN0cnVjdCBpMmNfZGV2aWNlX2lkICppZCkKIAlzdHJ1Y3QgYWR2NzUxMV9saW5rX2NvbmZp
ZyBsaW5rX2NvbmZpZzsKIAlzdHJ1Y3QgYWR2NzUxMSAqYWR2NzUxMTsKIAlzdHJ1Y3QgZGV2aWNl
ICpkZXYgPSAmaTJjLT5kZXY7CisJc3RydWN0IHJlZ3VsYXRvciAqcmVnX3YxcDI7CiAJdW5zaWdu
ZWQgaW50IHZhbDsKLQlpbnQgcmV0OworCWludCByZXQsIHJlZ192MXAyX3VWOwogCiAJaWYgKCFk
ZXYtPm9mX25vZGUpCiAJCXJldHVybiAtRUlOVkFMOwpAQCAtMTE2Myw2ICsxMTY0LDE4IEBAIHN0
YXRpYyBpbnQgYWR2NzUxMV9wcm9iZShzdHJ1Y3QgaTJjX2NsaWVudCAqaTJjLCBjb25zdCBzdHJ1
Y3QgaTJjX2RldmljZV9pZCAqaWQpCiAJaWYgKHJldCkKIAkJZ290byB1bmluaXRfcmVndWxhdG9y
czsKIAorCWlmIChhZHY3NTExLT50eXBlID09IEFEVjc1MzMpIHsKKwkJcmV0ID0gbWF0Y2hfc3Ry
aW5nKGFkdjc1MzNfc3VwcGx5X25hbWVzLCBhZHY3NTExLT5udW1fc3VwcGxpZXMsCisJCQkJCQkJ
CQkidjFwMiIpOworCQlyZWdfdjFwMiA9IGFkdjc1MTEtPnN1cHBsaWVzW3JldF0uY29uc3VtZXI7
CisJCXJlZ192MXAyX3VWID0gcmVndWxhdG9yX2dldF92b2x0YWdlKHJlZ192MXAyKTsKKworCQlp
ZiAocmVnX3YxcDJfdVYgPT0gMTIwMDAwMCkgeworCQkJcmVnbWFwX3VwZGF0ZV9iaXRzKGFkdjc1
MTEtPnJlZ21hcCwKKwkJCQlBRFY3NTExX1JFR19TVVBQTFlfU0VMRUNULCAweDgwLCAweDgwKTsK
KwkJfQorCX0KKwogCWFkdjc1MTFfcGFja2V0X2Rpc2FibGUoYWR2NzUxMSwgMHhmZmZmKTsKIAog
CWFkdjc1MTEtPmkyY19lZGlkID0gaTJjX25ld19zZWNvbmRhcnlfZGV2aWNlKGkyYywgImVkaWQi
LApAQCAtMTI0Miw3ICsxMjU1LDcgQEAgc3RhdGljIGludCBhZHY3NTExX3JlbW92ZShzdHJ1Y3Qg
aTJjX2NsaWVudCAqaTJjKQogewogCXN0cnVjdCBhZHY3NTExICphZHY3NTExID0gaTJjX2dldF9j
bGllbnRkYXRhKGkyYyk7CiAKLQlpZiAoYWR2NzUxMS0+dHlwZSA9PSBBRFY3NTMzKQorCWlmIChh
ZHY3NTExLT50eXBlID09IEFEVjc1MzMgfHwgYWR2NzUxMS0+dHlwZSA9PSBBRFY3NTM1KQogCQlh
ZHY3NTMzX2RldGFjaF9kc2koYWR2NzUxMSk7CiAJaTJjX3VucmVnaXN0ZXJfZGV2aWNlKGFkdjc1
MTEtPmkyY19jZWMpOwogCWlmIChhZHY3NTExLT5jZWNfY2xrKQpAQCAtMTI2OCw2ICsxMjgxLDcg
QEAgc3RhdGljIGNvbnN0IHN0cnVjdCBpMmNfZGV2aWNlX2lkIGFkdjc1MTFfaTJjX2lkc1tdID0g
ewogCXsgImFkdjc1MTMiLCBBRFY3NTExIH0sCiAjaWZkZWYgQ09ORklHX0RSTV9JMkNfQURWNzUz
MwogCXsgImFkdjc1MzMiLCBBRFY3NTMzIH0sCisJeyAiYWR2NzUzNSIsIEFEVjc1MzUgfSwKICNl
bmRpZgogCXsgfQogfTsKQEAgLTEyNzksNiArMTI5Myw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qg
b2ZfZGV2aWNlX2lkIGFkdjc1MTFfb2ZfaWRzW10gPSB7CiAJeyAuY29tcGF0aWJsZSA9ICJhZGks
YWR2NzUxMyIsIC5kYXRhID0gKHZvaWQgKilBRFY3NTExIH0sCiAjaWZkZWYgQ09ORklHX0RSTV9J
MkNfQURWNzUzMwogCXsgLmNvbXBhdGlibGUgPSAiYWRpLGFkdjc1MzMiLCAuZGF0YSA9ICh2b2lk
ICopQURWNzUzMyB9LAorCXsgLmNvbXBhdGlibGUgPSAiYWRpLGFkdjc1MzUiLCAuZGF0YSA9ICh2
b2lkICopQURWNzUzNSB9LAogI2VuZGlmCiAJeyB9CiB9OwotLSAKMi4yMi4wCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
