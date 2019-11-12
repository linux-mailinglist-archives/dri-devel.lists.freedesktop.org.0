Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 472C2FAB65
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2019 08:55:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 435BB6E2F0;
	Wed, 13 Nov 2019 07:55:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com
 [148.163.135.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18E056E480
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 13:36:37 +0000 (UTC)
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
 by mx0a-00128a01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xACDXcEN006948; Tue, 12 Nov 2019 08:36:22 -0500
Received: from nam05-co1-obe.outbound.protection.outlook.com
 (mail-co1nam05lp2058.outbound.protection.outlook.com [104.47.48.58])
 by mx0a-00128a01.pphosted.com with ESMTP id 2w7prk8rv7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Tue, 12 Nov 2019 08:36:22 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kCDYHrXOu4wmgETTCSL2NQD0DJmNkVhBR2LFXSMc0xt8TS8IL4xt0SX0ZjkN/E8HCQfJTtV1gLYg7yKUsBGTmE4Owu8yTlf1Sn7xJku5/SLwD8nCD4jsG0JNr+YkYIVGeidtJiHWAKG2cS6Pe0HdzgEHjqxBCexDBLwtbmUH+UeA83jHGqy0YSQq4MRiFdK962q6XB3h64mHS1sfyj6u6hZjTig8LpZk1bLrZa1Eskf4l1QIqeWmfO+aA/icGFU3NlPkwV6ZZP4YJoLvNen7T87/+l3Tm/5gD2JgjCVgDwTIrMH9tq+0JRWKb2rMkGTb3e3jOhYg6JkWQ0xgewKH6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WmLwiKHjVwAxJ99g5UZRw0G3u42VHrBU/uBc4cd1BB4=;
 b=gxKrqj36UMeYbfRKSeT3SMTI2/mgLQNJz89nl2+dIZ89OTeRfVpfO7iL0Kmc7tmAR0K4ACM5IGMrMKZpKGgBeOCo31EI7Y/XNalRBY5PxCg5/aoTsDGJYjffD5dCTvVC2eeAiLjpLFWr9nMZzq9EWc5oVz5CrQFeNUH322VNJ7Q1VMXb9fd3YySjbWnhZRphQzPdc9wf5YWhpD7yA+0MCKsbKTyFOsHmnmmFjG5gfJk364qXf41YvUFOKpXIeri4qbtSo0CBqDoLxvekB12aM61hIu/+qplWHlTRsxcS6Z94zoYPk012gqa99vw28UidmzGN+ktYxf0YmCzy+HikRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 137.71.25.55) smtp.rcpttodomain=baylibre.com smtp.mailfrom=analog.com;
 dmarc=bestguesspass action=none header.from=analog.com; dkim=none (message
 not signed); arc=none
Received: from DM6PR03CA0030.namprd03.prod.outlook.com (2603:10b6:5:40::43) by
 CY4PR03MB3048.namprd03.prod.outlook.com (2603:10b6:903:137::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.24; Tue, 12 Nov 2019 13:36:19 +0000
Received: from SN1NAM02FT014.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e44::208) by DM6PR03CA0030.outlook.office365.com
 (2603:10b6:5:40::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2430.22 via Frontend
 Transport; Tue, 12 Nov 2019 13:36:19 +0000
Received-SPF: Pass (protection.outlook.com: domain of analog.com designates
 137.71.25.55 as permitted sender) receiver=protection.outlook.com;
 client-ip=137.71.25.55; helo=nwd2mta1.analog.com;
Received: from nwd2mta1.analog.com (137.71.25.55) by
 SN1NAM02FT014.mail.protection.outlook.com (10.152.72.106) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2430.20
 via Frontend Transport; Tue, 12 Nov 2019 13:36:19 +0000
Received: from NWD2HUBCAS7.ad.analog.com (nwd2hubcas7.ad.analog.com
 [10.64.69.107])
 by nwd2mta1.analog.com (8.13.8/8.13.8) with ESMTP id xACDaH7X021888
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Tue, 12 Nov 2019 05:36:17 -0800
Received: from btogorean-pc.ad.analog.com (10.48.65.146) by
 NWD2HUBCAS7.ad.analog.com (10.64.69.107) with Microsoft SMTP Server id
 14.3.408.0; Tue, 12 Nov 2019 08:36:16 -0500
From: Bogdan Togorean <bogdan.togorean@analog.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [RESEND PATCH 1/2] drm: bridge: adv7511: Enable SPDIF DAI
Date: Tue, 12 Nov 2019 15:34:51 +0200
Message-ID: <20191112133452.8493-1-bogdan.togorean@analog.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-ADIRoutedOnPrem: True
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:137.71.25.55; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(346002)(376002)(39860400002)(136003)(396003)(189003)(199004)(4326008)(47776003)(356004)(6666004)(2351001)(2616005)(6916009)(51416003)(7696005)(478600001)(305945005)(7636002)(486006)(186003)(44832011)(476003)(126002)(336012)(7416002)(2870700001)(26005)(14444005)(36756003)(426003)(86362001)(70586007)(8676002)(106002)(54906003)(50226002)(2906002)(70206006)(316002)(8936002)(50466002)(5660300002)(1076003)(48376002)(246002)(107886003)(16060500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR03MB3048; H:nwd2mta1.analog.com; FPR:;
 SPF:Pass; LANG:en; PTR:nwd2mail10.analog.com; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ad0dca27-db26-49af-657b-08d767754cc0
X-MS-TrafficTypeDiagnostic: CY4PR03MB3048:
X-Microsoft-Antispam-PRVS: <CY4PR03MB3048A514435F35E98A1DF5159B770@CY4PR03MB3048.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:186;
X-Forefront-PRVS: 021975AE46
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Gf6kTt2D327Ob9ae2eWtUtNLXZy+eIID6pDN6ljVM83hslLIvH6YwJREwI8YoWqdIauLAAlG7ZCL+cKV4HKQIy471JKeplDG530dH9VhzkEHKVjtjsDOudia88Kqa3bjPqWBC5M85hcsQjorE366Qp0aXbagz1B3Uj3Pyg1ZZdF+nr8iTf4jEajAZO51eGNcGCShBBFGdPZenkLMUbUOEUnO2qMR9v8OFBbNqkTwMSxC+hIobUqVC/S3XCF7xICnPusYRYanHpIDvFgpQzFJx9+Ch1tm5tL0+0iiorBgRPSQvUe4HGBhk3nuXZEfVA166N6s4wfjjkvc/I0JUavSw2b8P2rif3JUbxacSH17n3wnqQsnwzZKcTMWN1aqkNm7n3q9MjRQ71EdFHNBnfzAzMlayyas5Y8pjCoXjBduyMfWasR+DWeYjSCnHmQ8FylX
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2019 13:36:19.1515 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ad0dca27-db26-49af-657b-08d767754cc0
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=eaa689b4-8f87-40e0-9c6f-7228de4d754a; Ip=[137.71.25.55];
 Helo=[nwd2mta1.analog.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR03MB3048
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-12_04:2019-11-11,2019-11-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0
 adultscore=0 mlxlogscore=999 phishscore=0 lowpriorityscore=0
 impostorscore=0 mlxscore=0 suspectscore=1 malwarescore=0 clxscore=1015
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1911120122
X-Mailman-Approved-At: Wed, 13 Nov 2019 07:55:45 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector2-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WmLwiKHjVwAxJ99g5UZRw0G3u42VHrBU/uBc4cd1BB4=;
 b=cILbNzKaEyvBpNUhu4X0NSqO9jNoBJ8tr72L1cGs3PmyVJN30CIWHSJ/QtZ7TFo3Nu9BM4fXmR0ust4nD1iRJbH+KuFQORKffTqZQlBatS/CFmHnJTwQ9gGsVNoGTu0hDWqH7NwWV41nwlQUHiy06X7H4Kx3M0erUMNRG6kbJy8=
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
Cc: jernej.skrabec@siol.net, jonas@kwiboo.se, airlied@linux.ie,
 narmstrong@baylibre.com, linux-kernel@vger.kernel.org,
 alexios.zavras@intel.com, Laurent.pinchart@ideasonboard.com,
 tglx@linutronix.de, Bogdan Togorean <bogdan.togorean@analog.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QURWNzUxMSBzdXBwb3J0IEkyUyBvciBTUERJRiBhcyBhdWRpbyBpbnB1dCBpbnRlcmZhY2VzLiBU
aGlzIGNvbW1pdAplbmFibGUgc3VwcG9ydCBmb3IgU1BESUYuCgpTaWduZWQtb2ZmLWJ5OiBCb2dk
YW4gVG9nb3JlYW4gPGJvZ2Rhbi50b2dvcmVhbkBhbmFsb2cuY29tPgpSZXZpZXdlZC1ieTogQW5k
cnplaiBIYWpkYSA8YS5oYWpkYUBzYW1zdW5nLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYnJp
ZGdlL2Fkdjc1MTEvYWR2NzUxMV9hdWRpby5jIHwgMTQgKysrKysrKysrKysrKysKIDEgZmlsZSBj
aGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Jy
aWRnZS9hZHY3NTExL2Fkdjc1MTFfYXVkaW8uYyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYWR2
NzUxMS9hZHY3NTExX2F1ZGlvLmMKaW5kZXggYTQyODE4NWJlMmMxLi4xZTliMTI4ZDIyOWIgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYWR2NzUxMS9hZHY3NTExX2F1ZGlvLmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hZHY3NTExL2Fkdjc1MTFfYXVkaW8uYwpAQCAt
MTE5LDYgKzExOSw5IEBAIGludCBhZHY3NTExX2hkbWlfaHdfcGFyYW1zKHN0cnVjdCBkZXZpY2Ug
KmRldiwgdm9pZCAqZGF0YSwKIAkJYXVkaW9fc291cmNlID0gQURWNzUxMV9BVURJT19TT1VSQ0Vf
STJTOwogCQlpMnNfZm9ybWF0ID0gQURWNzUxMV9JMlNfRk9STUFUX0xFRlRfSjsKIAkJYnJlYWs7
CisJY2FzZSBIRE1JX1NQRElGOgorCQlhdWRpb19zb3VyY2UgPSBBRFY3NTExX0FVRElPX1NPVVJD
RV9TUERJRjsKKwkJYnJlYWs7CiAJZGVmYXVsdDoKIAkJcmV0dXJuIC1FSU5WQUw7CiAJfQpAQCAt
MTc1LDExICsxNzgsMjEgQEAgc3RhdGljIGludCBhdWRpb19zdGFydHVwKHN0cnVjdCBkZXZpY2Ug
KmRldiwgdm9pZCAqZGF0YSkKIAkvKiB1c2UgQXVkaW8gaW5mb2ZyYW1lIHVwZGF0ZWQgaW5mbyAq
LwogCXJlZ21hcF91cGRhdGVfYml0cyhhZHY3NTExLT5yZWdtYXAsIEFEVjc1MTFfUkVHX0dDKDEp
LAogCQkJCUJJVCg1KSwgMCk7CisJLyogZW5hYmxlIFNQRElGIHJlY2VpdmVyICovCisJaWYgKGFk
djc1MTEtPmF1ZGlvX3NvdXJjZSA9PSBBRFY3NTExX0FVRElPX1NPVVJDRV9TUERJRikKKwkJcmVn
bWFwX3VwZGF0ZV9iaXRzKGFkdjc1MTEtPnJlZ21hcCwgQURWNzUxMV9SRUdfQVVESU9fQ09ORklH
LAorCQkJCSAgIEJJVCg3KSwgQklUKDcpKTsKKwogCXJldHVybiAwOwogfQogCiBzdGF0aWMgdm9p
ZCBhdWRpb19zaHV0ZG93bihzdHJ1Y3QgZGV2aWNlICpkZXYsIHZvaWQgKmRhdGEpCiB7CisJc3Ry
dWN0IGFkdjc1MTEgKmFkdjc1MTEgPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsKKworCWlmIChhZHY3
NTExLT5hdWRpb19zb3VyY2UgPT0gQURWNzUxMV9BVURJT19TT1VSQ0VfU1BESUYpCisJCXJlZ21h
cF91cGRhdGVfYml0cyhhZHY3NTExLT5yZWdtYXAsIEFEVjc1MTFfUkVHX0FVRElPX0NPTkZJRywK
KwkJCQkgICBCSVQoNyksIDApOwogfQogCiBzdGF0aWMgaW50IGFkdjc1MTFfaGRtaV9pMnNfZ2V0
X2RhaV9pZChzdHJ1Y3Qgc25kX3NvY19jb21wb25lbnQgKmNvbXBvbmVudCwKQEAgLTIxMyw2ICsy
MjYsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGhkbWlfY29kZWNfcGRhdGEgY29kZWNfZGF0YSA9
IHsKIAkub3BzID0gJmFkdjc1MTFfY29kZWNfb3BzLAogCS5tYXhfaTJzX2NoYW5uZWxzID0gMiwK
IAkuaTJzID0gMSwKKwkuc3BkaWYgPSAxLAogfTsKIAogaW50IGFkdjc1MTFfYXVkaW9faW5pdChz
dHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBhZHY3NTExICphZHY3NTExKQotLSAKMi4yMy4wCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
