Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 08EDBE97D6
	for <lists+dri-devel@lfdr.de>; Wed, 30 Oct 2019 09:14:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A6D16ECC1;
	Wed, 30 Oct 2019 08:14:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com
 [148.163.135.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC5E56E10D
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2019 08:31:44 +0000 (UTC)
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
 by mx0a-00128a01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x9T8SM1i029150; Tue, 29 Oct 2019 04:31:29 -0400
Received: from nam04-bn3-obe.outbound.protection.outlook.com
 (mail-bn3nam04lp2053.outbound.protection.outlook.com [104.47.46.53])
 by mx0a-00128a01.pphosted.com with ESMTP id 2vvk26edv8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Tue, 29 Oct 2019 04:31:28 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qpt+t+1xiDcX1C3KUG2MZVia2qcMyHNNB1JtGjJfE9Sy6W0GVpli0J//VpFH9ZiNuzSR2bnSVlHtDIbfqOGfNyzXHhWSrUimkzEn6ONCdWkva5LzymHfDUXAfIU4tySaSEaWKlFEnXFMChqobErahxZ751OLTq9Mgb4LbOtDRBgLUngc/fjHsHShclf5pXVar7X7pKsW8gjzildblOddKSCHR72YF5erNo4I0xbGaSy3MjNYvyLdX+lxR84cjs0VjiK/hwZ8HvdKKPTKOJuKBiz9vTEROcXwa/L7cXeFPCropR0O/g2bH8WFdA9Bq4ib6QojxEhnN71STQHbQ/yydQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WmLwiKHjVwAxJ99g5UZRw0G3u42VHrBU/uBc4cd1BB4=;
 b=THj2WlMCKuv8rXihdOQAbHxkilDuel9RzbbIcv1imAC3MiVBwhSxs2dXIupy2HdoW828fAASBkxkakBhli9ce0GyTtkswuEdT6DxCLjJTOoWpoPZFnuO/tag3U+NU9fUg9Y9itJX3to7K/6/d/dzhKDWide1qi0H0BOFWDfrozTCwa3xVM7RrjwUvjEI+iPMtMK/aoiQBUcfQmSoS/xy6QHYcImADw8wOD+Lxf86xyUzeIAGOpkLk0W7g4APl4Ixmnf4p5ybFAemPp67dMqbX3uz3vRnOmpSMON31PlBWcCB/uqIbUYBGEZW0p5fhwO6Sg4MdNlDTY7gLA3Pjp9DkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 137.71.25.55) smtp.rcpttodomain=baylibre.com smtp.mailfrom=analog.com;
 dmarc=bestguesspass action=none header.from=analog.com; dkim=none (message
 not signed); arc=none
Received: from DM6PR03CA0041.namprd03.prod.outlook.com (2603:10b6:5:100::18)
 by BN6PR03MB2660.namprd03.prod.outlook.com (2603:10b6:404:53::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2387.24; Tue, 29 Oct
 2019 08:31:26 +0000
Received: from SN1NAM02FT015.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e44::209) by DM6PR03CA0041.outlook.office365.com
 (2603:10b6:5:100::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2408.17 via Frontend
 Transport; Tue, 29 Oct 2019 08:31:26 +0000
Received-SPF: Pass (protection.outlook.com: domain of analog.com designates
 137.71.25.55 as permitted sender) receiver=protection.outlook.com;
 client-ip=137.71.25.55; helo=nwd2mta1.analog.com;
Received: from nwd2mta1.analog.com (137.71.25.55) by
 SN1NAM02FT015.mail.protection.outlook.com (10.152.72.109) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2387.20
 via Frontend Transport; Tue, 29 Oct 2019 08:31:26 +0000
Received: from NWD2HUBCAS7.ad.analog.com (nwd2hubcas7.ad.analog.com
 [10.64.69.107])
 by nwd2mta1.analog.com (8.13.8/8.13.8) with ESMTP id x9T8VOkK006186
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Tue, 29 Oct 2019 01:31:24 -0700
Received: from btogorean-pc.ad.analog.com (10.48.65.146) by
 NWD2HUBCAS7.ad.analog.com (10.64.69.107) with Microsoft SMTP Server id
 14.3.408.0; Tue, 29 Oct 2019 04:31:24 -0400
From: Bogdan Togorean <bogdan.togorean@analog.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [RESEND PATCH 1/2] drm: bridge: adv7511: Enable SPDIF DAI
Date: Tue, 29 Oct 2019 10:30:35 +0200
Message-ID: <20191029083035.21310-1-bogdan.togorean@analog.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-ADIRoutedOnPrem: True
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:137.71.25.55; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(39860400002)(396003)(376002)(346002)(136003)(199004)(189003)(2870700001)(2351001)(47776003)(2906002)(336012)(478600001)(70206006)(70586007)(426003)(316002)(44832011)(126002)(476003)(106002)(2616005)(54906003)(5660300002)(486006)(1076003)(36756003)(14444005)(107886003)(4326008)(356004)(6666004)(86362001)(246002)(7416002)(26005)(186003)(8676002)(7636002)(6916009)(50226002)(48376002)(51416003)(8936002)(7696005)(305945005)(50466002)(16060500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR03MB2660; H:nwd2mta1.analog.com; FPR:;
 SPF:Pass; LANG:en; PTR:nwd2mail10.analog.com; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 73667cb2-17cb-47b8-fb58-08d75c4a63a3
X-MS-TrafficTypeDiagnostic: BN6PR03MB2660:
X-Microsoft-Antispam-PRVS: <BN6PR03MB26607D5D15F57943394C975A9B610@BN6PR03MB2660.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:186;
X-Forefront-PRVS: 0205EDCD76
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TxpsmuyPFG5SQpqJNripVDwJn7NLVUPYdjfNcqGe2RVSIZ7ioQeToVqmFgA/4hEonJT0b931nujau0qWCFCy+UFOfw1TiFCRLEYBW0eQXQKKwITTSkTxzDYtRkEOAkmlslqBxI/5ZqUjo5gqM2LB/AmFmbkr/OqbQ7VeJk33mK7juIGccBxsrFqzUEdgZjdFTAp9kTxqBDicKZSORwFo8aybCk3Jtg+HbSJ1R/sxunXCB3SKCxApPRypmfxRw/cLFpT+5TaYm2P2efak6Q0fygSufKpEIIx/nfQ8hYc+a5/+roS2sTMv/EG38shqQy1mWSD1ktsCLTWJ7/I250Sh8BMIp9k7k9sYD0l1QYRl7LXhbl4YnLUICIcZCySK38XEr33i/UIrhThRWvzAKNmRKZEQug+sT7wglvWppQilhrizAVmtHMJM7h7yGflPAVop
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2019 08:31:26.4049 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 73667cb2-17cb-47b8-fb58-08d75c4a63a3
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=eaa689b4-8f87-40e0-9c6f-7228de4d754a; Ip=[137.71.25.55];
 Helo=[nwd2mta1.analog.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR03MB2660
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-29_03:2019-10-28,2019-10-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 phishscore=0
 suspectscore=1 clxscore=1011 mlxlogscore=999 impostorscore=0 bulkscore=0
 spamscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1908290000 definitions=main-1910290089
X-Mailman-Approved-At: Wed, 30 Oct 2019 08:14:00 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector2-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WmLwiKHjVwAxJ99g5UZRw0G3u42VHrBU/uBc4cd1BB4=;
 b=YskH7uIIwRiBD/tD61xJGJ1PxCn6glwOQZKhrpyzwipU7jCQ4hXB0A1kqSE/odst7kvUIxnGpVNkc0Vdk/z6lTCwkdFJMK/PA/mpyGgy8xTbR19e76Su5aKGmwOcog41DPXinQLmaFdRV+5q9mZiSixM3zzXR07UbIyq3Tb1pE0=
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
