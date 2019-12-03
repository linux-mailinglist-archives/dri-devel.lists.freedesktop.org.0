Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 10CF010FDFB
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 13:48:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84C2A6E4C4;
	Tue,  3 Dec 2019 12:48:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0014ca01.pphosted.com (mx0b-0014ca01.pphosted.com
 [208.86.201.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B11896E03E
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2019 10:38:10 +0000 (UTC)
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
 by mx0b-0014ca01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xB3AEB41026031; Tue, 3 Dec 2019 02:14:15 -0800
Received: from nam03-co1-obe.outbound.protection.outlook.com
 (mail-co1nam03lp2054.outbound.protection.outlook.com [104.47.40.54])
 by mx0b-0014ca01.pphosted.com with ESMTP id 2wkmvyurgy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 Dec 2019 02:14:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B61/GP6Tzxoz7CUXsVWqgREJ8tU/ZeuSE17A4IANrp2CyU99BG9ls6v9SXb6ryDvkU86jCOpiEbbt8+Zs/G9VHWZ306ZAoFcvJ1r/PCqSTFqpCzNxt298JtTwX/l8r7JyX0XCCyu5Abrb3wWEY4hEQl+z+IMbsp1fApeZaZjpIoeTjcHNWfx92ouw2/BHy1As2Ln5NNVU8K7f/4I2kFY3ayhR4yf0rxv+bQW53c60jNEPi8nAT6wXFDU3xrbewSAmfNVB6Mz6qQpe1UqNFpt03Nis+uEIlwMNj0bSf1iaLApu7ubLj2h9ip2/OMioTbtiR6KExhZ+Ck/Vo8pNEO0vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0hIEXlYLyrpJmoD8ErXgQvaxF9xleLApjbQtoS/yr3E=;
 b=lucO2W8nuu3bFD6FynFFk2H29r64FG8pjaty7M58Kt471kip7bWjSnh8U3YYnc25Zj4ix+0eDqZmX61X9cB0dJS0biRP2GX1Tv4vZZqwsDsS7rZU2mm6e7aol+750BFVJtcd+ew+r402m1Hdka1dphZkkuz0tQXHpFAXMc84z8NYQj2TCoV1TcCj0S9GQY1GbqQlRSU1MzmP87/ZSnt9IosL/DK3W3joObLvugWTxyL+zrHsST0Py6yAZ8GXw9JHGrDtjcMAX33xi71324GRSO/zn4J0G7mVlsnBThLxNV0bsNco+58yQjrvNiaPvJ/n1wcRE85rp6mw/dmSPSIjiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 158.140.1.28) smtp.rcpttodomain=ti.com smtp.mailfrom=cadence.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=cadence.com;
 dkim=none (message not signed); arc=none
Received: from DM6PR07CA0065.namprd07.prod.outlook.com (2603:10b6:5:74::42) by
 CY4PR07MB2760.namprd07.prod.outlook.com (2603:10b6:903:24::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.18; Tue, 3 Dec 2019 10:14:11 +0000
Received: from BN8NAM12FT034.eop-nam12.prod.protection.outlook.com
 (2a01:111:f400:fe5b::208) by DM6PR07CA0065.outlook.office365.com
 (2603:10b6:5:74::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2495.18 via Frontend
 Transport; Tue, 3 Dec 2019 10:14:11 +0000
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 cadence.com discourages use of 158.140.1.28 as permitted sender)
Received: from sjmaillnx2.cadence.com (158.140.1.28) by
 BN8NAM12FT034.mail.protection.outlook.com (10.13.183.4) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.18 via Frontend Transport; Tue, 3 Dec 2019 10:14:11 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
 by sjmaillnx2.cadence.com (8.14.4/8.14.4) with ESMTP id
 xB3AE7so027708
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Tue, 3 Dec 2019 02:14:10 -0800
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Tue, 3 Dec 2019 11:14:07 +0100
Received: from vleu-orange.cadence.com (10.160.88.83) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Tue, 3 Dec 2019 11:14:07 +0100
Received: from vleu-orange.cadence.com (localhost.localdomain [127.0.0.1])
 by vleu-orange.cadence.com (8.14.4/8.14.4) with ESMTP id xB3AE7rY030879;
 Tue, 3 Dec 2019 11:14:07 +0100
Received: (from yamonkar@localhost)
 by vleu-orange.cadence.com (8.14.4/8.14.4/Submit) id xB3AE6Oa030875;
 Tue, 3 Dec 2019 11:14:06 +0100
From: Yuti Amonkar <yamonkar@cadence.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v1 01/15] phy: Add DisplayPort configuration options
Date: Tue, 3 Dec 2019 11:13:11 +0100
Message-ID: <1575368005-29797-2-git-send-email-yamonkar@cadence.com>
X-Mailer: git-send-email 2.4.5
In-Reply-To: <1575368005-29797-1-git-send-email-yamonkar@cadence.com>
References: <1575368005-29797-1-git-send-email-yamonkar@cadence.com>
MIME-Version: 1.0
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:158.140.1.28; IPV:CAL; SCL:-1; CTRY:US;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(136003)(396003)(39860400002)(36092001)(189003)(199004)(16586007)(42186006)(86362001)(316002)(2351001)(446003)(107886003)(26826003)(2906002)(6916009)(7636002)(246002)(305945005)(8676002)(8936002)(36756003)(4326008)(26005)(50226002)(478600001)(87636003)(76130400001)(5660300002)(54906003)(50466002)(48376002)(70206006)(6666004)(70586007)(356004)(186003)(11346002)(426003)(76176011)(2616005)(336012)(51416003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR07MB2760; H:sjmaillnx2.cadence.com; FPR:;
 SPF:SoftFail; LANG:en; PTR:corp.cadence.com; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 384c7676-0b7f-4c78-173f-08d777d98acb
X-MS-TrafficTypeDiagnostic: CY4PR07MB2760:
X-Microsoft-Antispam-PRVS: <CY4PR07MB2760F0063516ACB43561DE30D2420@CY4PR07MB2760.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1284;
X-Forefront-PRVS: 02408926C4
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wgq47Hd7KHvqF5dkeak043qjgqDYvnQzJTHetfCIHzozeN2X/Sd0JMuayzZ19ZVS5TL74Ei6vY0FIRL2rM+m16kOihN1DEu2ybBuiv/3ur2fdLgUYFMs+ZkaPije92jK4MAEyiEjTWKfXVg9q6ma/Tr06jcxZ9C1Zlw3WbLdYsBzqn+8nh77yB4rwx2GPc0WyUzsfCgq80epo54CrU0dQxdEtIwoSbrf8LPQzhtaadFGjN9XNjmj+ocpSp7oNruT+0BvpbW5wmeF6Ndt3CASav7GlxYCZyk3kSI+tp0ro1qr1h+aZ5LbRNXtKbvSWpgJr4TcFWukRxjYEfkRbbu2P5OaKVKoBeMIoZLaEuXvrPdeHBYb7bYdR7gqlnOUOZLf1lnhua70GtQH0BMMzg8r32RFbQzuiSZQzg32Q/SVYMeDBQImVs/PId6pQ+rPfuFX
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2019 10:14:11.5077 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 384c7676-0b7f-4c78-173f-08d777d98acb
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[158.140.1.28];
 Helo=[sjmaillnx2.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR07MB2760
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-03_02:2019-11-29,2019-12-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0
 priorityscore=1501 suspectscore=1 phishscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 adultscore=0 mlxlogscore=999
 malwarescore=0 mlxscore=0 impostorscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-1910280000
 definitions=main-1912030082
X-Mailman-Approved-At: Tue, 03 Dec 2019 12:48:27 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cadence.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=proofpoint;
 bh=0hIEXlYLyrpJmoD8ErXgQvaxF9xleLApjbQtoS/yr3E=;
 b=f7/xL4wramyEpGpBFdRnF0WCnBOcbUs+Lgim7/wV3lhWTMBswFpyOL9Mq3noXNKwziGt
 JrQ7trr+C0JmlQJy0vE0pbjt8AHQ4XME9vlbKVJ5Z8rUx64Y/e5irYclzA0r7NEJUgrH
 XlzB1B7vo7jRdSZtHZ0BJyNiLFP1iFVTWWPJZWWFJbNbwGKHwTUtKfgLOr56JAi8uHSM
 mrxxGMR9kZc5k+t5N0i/GALZndJyhQZaltbIbVsk6e28HLiGiKHV4LnQOhHTBcHnTgdd
 SBZDFxb4hQCIpMHNlnZqtXvDGDzi1zY/q+kEu2WsuJTYes0nz7BKMgzOPV5Bw4Xa3ZZh pA== 
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cadence.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0hIEXlYLyrpJmoD8ErXgQvaxF9xleLApjbQtoS/yr3E=;
 b=BTX3FxTTdHt8E3TP185JjULipTHFWIuuBGm982wF8KVUaq2k1p8EsVq7Hj+4b1GSa3JplEGO1t/Om3ETgkr4hSjQxbq5R+4YZdR3JMC8zXoxo/hr0LyN1nUwJ+NTBKmYXmXMvQc9hDFgJqhjrn858lJ7H4OqxEcKJhpcCqgVGLM=
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
Cc: mparab@cadence.com, yamonkar@cadence.com, praneeth@ti.com,
 dkangude@cadence.com, jsarha@ti.com, kishon@ti.com, tomi.valkeinen@ti.com,
 sjakhade@cadence.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIGdlbmVyaWMgRFAgQVBJIGZvciBjb25maWd1cmluZyBEaXNwbGF5UG9ydCBQSFlzLiBUaGUg
cGFyYW1ldGVycwp0aGF0IHdpbGwgYmUgY29uZmlndXJlZCBhcmUgbGluayByYXRlLCBudW1iZXIg
b2YgbGFuZXMsIHZvbHRhZ2Ugc3dpbmcKYW5kIHByZS1lbXBoYXNpcy4KClNpZ25lZC1vZmYtYnk6
IFl1dGkgQW1vbmthciA8eWFtb25rYXJAY2FkZW5jZS5jb20+Ci0tLQogaW5jbHVkZS9saW51eC9w
aHkvcGh5LWRwLmggfCA5NSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrCiBpbmNsdWRlL2xpbnV4L3BoeS9waHkuaCAgICB8ICA0ICsrCiAyIGZpbGVzIGNoYW5n
ZWQsIDk5IGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL2xpbnV4L3Bo
eS9waHktZHAuaAoKZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvcGh5L3BoeS1kcC5oIGIvaW5j
bHVkZS9saW51eC9waHkvcGh5LWRwLmgKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAw
MC4uMThjYWQyMwotLS0gL2Rldi9udWxsCisrKyBiL2luY2x1ZGUvbGludXgvcGh5L3BoeS1kcC5o
CkBAIC0wLDAgKzEsOTUgQEAKKy8qIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wICov
CisvKgorICogQ29weXJpZ2h0IChDKSAyMDE5IENhZGVuY2UgRGVzaWduIFN5c3RlbXMgSW5jLgor
ICovCisKKyNpZm5kZWYgX19QSFlfRFBfSF8KKyNkZWZpbmUgX19QSFlfRFBfSF8KKworI2luY2x1
ZGUgPGxpbnV4L3R5cGVzLmg+CisKKy8qKgorICogc3RydWN0IHBoeV9jb25maWd1cmVfb3B0c19k
cCAtIERpc3BsYXlQb3J0IFBIWSBjb25maWd1cmF0aW9uIHNldAorICoKKyAqIFRoaXMgc3RydWN0
dXJlIGlzIHVzZWQgdG8gcmVwcmVzZW50IHRoZSBjb25maWd1cmF0aW9uIHN0YXRlIG9mIGEKKyAq
IERpc3BsYXlQb3J0IHBoeS4KKyAqLworc3RydWN0IHBoeV9jb25maWd1cmVfb3B0c19kcCB7CisJ
LyoqCisJICogQGxpbmtfcmF0ZToKKwkgKgorCSAqIExpbmsgUmF0ZSwgaW4gTWIvcywgb2YgdGhl
IG1haW4gbGluay4KKwkgKgorCSAqIEFsbG93ZWQgdmFsdWVzOiAxNjIwLCAyMTYwLCAyNDMwLCAy
NzAwLCAzMjQwLCA0MzIwLCA1NDAwLCA4MTAwIE1iL3MKKwkgKi8KKwl1bnNpZ25lZCBpbnQgbGlu
a19yYXRlOworCisJLyoqCisJICogQGxhbmVzOgorCSAqCisJICogTnVtYmVyIG9mIGFjdGl2ZSwg
Y29uc2VjdXRpdmUsIGRhdGEgbGFuZXMsIHN0YXJ0aW5nIGZyb20KKwkgKiBsYW5lIDAsIHVzZWQg
Zm9yIHRoZSB0cmFuc21pc3Npb25zIG9uIG1haW4gbGluay4KKwkgKgorCSAqIEFsbG93ZWQgdmFs
dWVzOiAxLCAyLCA0CisJICovCisJdW5zaWduZWQgaW50IGxhbmVzOworCisJLyoqCisJICogQHZv
bHRhZ2U6CisJICoKKwkgKiBWb2x0YWdlIHN3aW5nIGxldmVscywgYXMgc3BlY2lmaWVkIGJ5IERp
c3BsYXlQb3J0IHNwZWNpZmljYXRpb24sCisJICogdG8gYmUgdXNlZCBieSBwYXJ0aWN1bGFyIGxh
bmVzLiBPbmUgdmFsdWUgcGVyIGxhbmUuCisJICogdm9sdGFnZVswXSBpcyBmb3IgbGFuZSAwLCB2
b2x0YWdlWzFdIGlzIGZvciBsYW5lIDEsIGV0Yy4KKwkgKgorCSAqIE1heGltdW0gdmFsdWU6IDMK
KwkgKi8KKwl1bnNpZ25lZCBpbnQgdm9sdGFnZVs0XTsKKworCS8qKgorCSAqIEBwcmU6CisJICoK
KwkgKiBQcmUtZW1waGFzaXMgbGV2ZWxzLCBhcyBzcGVjaWZpZWQgYnkgRGlzcGxheVBvcnQgc3Bl
Y2lmaWNhdGlvbiwgdG8gYmUKKwkgKiB1c2VkIGJ5IHBhcnRpY3VsYXIgbGFuZXMuIE9uZSB2YWx1
ZSBwZXIgbGFuZS4KKwkgKgorCSAqIE1heGltdW0gdmFsdWU6IDMKKwkgKi8KKwl1bnNpZ25lZCBp
bnQgcHJlWzRdOworCisJLyoqCisJICogQHNzYzoKKwkgKgorCSAqIEZsYWcgaW5kaWNhdGluZywg
d2hldGhlciBvciBub3QgdG8gZW5hYmxlIHNwcmVhZC1zcGVjdHJ1bSBjbG9ja2luZy4KKwkgKgor
CSAqLworCXU4IHNzYyA6IDE7CisKKwkvKioKKwkgKiBAc2V0X3JhdGU6CisJICoKKwkgKiBGbGFn
IGluZGljYXRpbmcsIHdoZXRoZXIgb3Igbm90IHJlY29uZmlndXJlIGxpbmsgcmF0ZSBhbmQgU1ND
IHRvCisJICogcmVxdWVzdGVkIHZhbHVlcy4KKwkgKgorCSAqLworCXU4IHNldF9yYXRlIDogMTsK
KworCS8qKgorCSAqIEBzZXRfbGFuZXM6CisJICoKKwkgKiBGbGFnIGluZGljYXRpbmcsIHdoZXRo
ZXIgb3Igbm90IHJlY29uZmlndXJlIGxhbmUgY291bnQgdG8KKwkgKiByZXF1ZXN0ZWQgdmFsdWUu
CisJICoKKwkgKi8KKwl1OCBzZXRfbGFuZXMgOiAxOworCisJLyoqCisJICogQHNldF92b2x0YWdl
czoKKwkgKgorCSAqIEZsYWcgaW5kaWNhdGluZywgd2hldGhlciBvciBub3QgcmVjb25maWd1cmUg
dm9sdGFnZSBzd2luZworCSAqIGFuZCBwcmUtZW1waGFzaXMgdG8gcmVxdWVzdGVkIHZhbHVlcy4g
T25seSBsYW5lcyBzcGVjaWZpZWQKKwkgKiBieSAibGFuZXMiIHBhcmFtZXRlciB3aWxsIGJlIGFm
ZmVjdGVkLgorCSAqCisJICovCisJdTggc2V0X3ZvbHRhZ2VzIDogMTsKK307CisKKyNlbmRpZiAv
KiBfX1BIWV9EUF9IXyAqLwpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9waHkvcGh5LmggYi9p
bmNsdWRlL2xpbnV4L3BoeS9waHkuaAppbmRleCAxNTAzMmYxNC4uYjk4MTM4NCAxMDA2NDQKLS0t
IGEvaW5jbHVkZS9saW51eC9waHkvcGh5LmgKKysrIGIvaW5jbHVkZS9saW51eC9waHkvcGh5LmgK
QEAgLTE3LDYgKzE3LDcgQEAKICNpbmNsdWRlIDxsaW51eC9yZWd1bGF0b3IvY29uc3VtZXIuaD4K
IAogI2luY2x1ZGUgPGxpbnV4L3BoeS9waHktbWlwaS1kcGh5Lmg+CisjaW5jbHVkZSA8bGludXgv
cGh5L3BoeS1kcC5oPgogCiBzdHJ1Y3QgcGh5OwogCkBAIC00Niw5ICs0NywxMiBAQCBlbnVtIHBo
eV9tb2RlIHsKICAqCiAgKiBAbWlwaV9kcGh5OglDb25maWd1cmF0aW9uIHNldCBhcHBsaWNhYmxl
IGZvciBwaHlzIHN1cHBvcnRpbmcKICAqCQl0aGUgTUlQSV9EUEhZIHBoeSBtb2RlLgorICogQGRw
OgkJQ29uZmlndXJhdGlvbiBzZXQgYXBwbGljYWJsZSBmb3IgcGh5cyBzdXBwb3J0aW5nCisgKgkJ
dGhlIERpc3BsYXlQb3J0IHByb3RvY29sLgogICovCiB1bmlvbiBwaHlfY29uZmlndXJlX29wdHMg
ewogCXN0cnVjdCBwaHlfY29uZmlndXJlX29wdHNfbWlwaV9kcGh5CW1pcGlfZHBoeTsKKwlzdHJ1
Y3QgcGh5X2NvbmZpZ3VyZV9vcHRzX2RwCQlkcDsKIH07CiAKIC8qKgotLSAKMi43LjQKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
