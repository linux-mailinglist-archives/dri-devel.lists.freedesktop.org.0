Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1407610FDFA
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 13:48:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7377D6E4C1;
	Tue,  3 Dec 2019 12:48:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0014ca01.pphosted.com (mx0b-0014ca01.pphosted.com
 [208.86.201.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C9E36E03F
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2019 10:38:15 +0000 (UTC)
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
 by mx0b-0014ca01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xB3AEB42026031; Tue, 3 Dec 2019 02:14:22 -0800
Received: from nam03-co1-obe.outbound.protection.outlook.com
 (mail-co1nam03lp2053.outbound.protection.outlook.com [104.47.40.53])
 by mx0b-0014ca01.pphosted.com with ESMTP id 2wkmvyurhj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 Dec 2019 02:14:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UqBbmEI1GZvhcgywqpbH/ez+HsOEDhVwbvWusu+ePKpEZHCDQDm70VKydVKu/d9Pip3pJBrMa2mN7VE2TZ0pRoUOgqkgxexQUYXx+R+Lp3a4od8QQweQ4NKN1urxsPTbwojRHZhkK51mOPLPU5IzOmwoXTsnI+PBGeRa0wwUdZIziqgLfH9OhMxymrv6UVVj3JDV8cO1wmQZW5WeSyKqjwEO5LL418TbCLpts0jeCk/187VPebcwHnpJ6l78jZKriNGtAMjfYVmi5lp3WuOE1sTSbJbW6OO/fPQr2RbVONhGE32kfnniGNQ3dbICPBts6LLduyveQ0AQGi86FY48jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V+fVl0u+EC0Bjf+ILcORO+T3iqAX3P/If4kJlbUMZA4=;
 b=XIbeliw/dp+UnvHFDJiKWwJdTZmv3DvOyvPb7+qjiy7wEpWsliO0JyesxZlxPjaowWXiLGOJESdyauDzE9oo/4azzxV2brlcDEgVQ7zwCqjqlTh+kMyOGTx0raVlYk7NDph4qUP0EbS/xdcN8HeLTywV9zMOaBF1QA2qmpqxF08+SYHFL/sTD/PAa9fW0bva1iSMQCJnm1qyuA1ivJo3axbqHc6V3mtAZR2EYGkzmFkeg112WjptqC8TXt6LzyohBBRkvEC/9/G7D6rYIvbrw2xx40cMfUXf5n3AMar/LYLlXBkkZb8czqRGVukZQjO0HuBJ3QB1MVrY/j56Jf7OuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 158.140.1.28) smtp.rcpttodomain=ti.com smtp.mailfrom=cadence.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=cadence.com;
 dkim=none (message not signed); arc=none
Received: from BN8PR07CA0009.namprd07.prod.outlook.com (2603:10b6:408:ac::22)
 by BYAPR07MB4616.namprd07.prod.outlook.com (2603:10b6:a02:f1::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2495.17; Tue, 3 Dec
 2019 10:14:19 +0000
Received: from BN8NAM12FT052.eop-nam12.prod.protection.outlook.com
 (2a01:111:f400:fe5b::206) by BN8PR07CA0009.outlook.office365.com
 (2603:10b6:408:ac::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2516.12 via Frontend
 Transport; Tue, 3 Dec 2019 10:14:19 +0000
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 cadence.com discourages use of 158.140.1.28 as permitted sender)
Received: from sjmaillnx2.cadence.com (158.140.1.28) by
 BN8NAM12FT052.mail.protection.outlook.com (10.13.182.236) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.18 via Frontend Transport; Tue, 3 Dec 2019 10:14:18 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
 by sjmaillnx2.cadence.com (8.14.4/8.14.4) with ESMTP id
 xB3AE7t3027708
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Tue, 3 Dec 2019 02:14:17 -0800
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Tue, 3 Dec 2019 11:14:10 +0100
Received: from vleu-orange.cadence.com (10.160.88.83) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Tue, 3 Dec 2019 11:14:10 +0100
Received: from vleu-orange.cadence.com (localhost.localdomain [127.0.0.1])
 by vleu-orange.cadence.com (8.14.4/8.14.4) with ESMTP id xB3AEAb1030992;
 Tue, 3 Dec 2019 11:14:10 +0100
Received: (from yamonkar@localhost)
 by vleu-orange.cadence.com (8.14.4/8.14.4/Submit) id xB3AEAsx030989;
 Tue, 3 Dec 2019 11:14:10 +0100
From: Yuti Amonkar <yamonkar@cadence.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v1 14/15] dt-bindings: phy: phy-cadence-torrent: Add platform
 dependent compatible string
Date: Tue, 3 Dec 2019 11:13:24 +0100
Message-ID: <1575368005-29797-15-git-send-email-yamonkar@cadence.com>
X-Mailer: git-send-email 2.4.5
In-Reply-To: <1575368005-29797-1-git-send-email-yamonkar@cadence.com>
References: <1575368005-29797-1-git-send-email-yamonkar@cadence.com>
MIME-Version: 1.0
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:158.140.1.28; IPV:CAL; SCL:-1; CTRY:US;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(136003)(396003)(39860400002)(36092001)(189003)(199004)(87636003)(2616005)(76176011)(426003)(336012)(51416003)(107886003)(305945005)(5660300002)(7636002)(36756003)(26005)(50226002)(14444005)(16586007)(316002)(186003)(76130400001)(50466002)(54906003)(42186006)(48376002)(2351001)(2906002)(70206006)(246002)(4326008)(4744005)(26826003)(8676002)(356004)(70586007)(6666004)(86362001)(6916009)(8936002)(478600001)(11346002)(446003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR07MB4616; H:sjmaillnx2.cadence.com; FPR:;
 SPF:SoftFail; LANG:en; PTR:corp.Cadence.COM; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ce3a51ac-14fd-40bd-9b37-08d777d98f2c
X-MS-TrafficTypeDiagnostic: BYAPR07MB4616:
X-Microsoft-Antispam-PRVS: <BYAPR07MB46167F2C1756751F590C8738D2420@BYAPR07MB4616.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1079;
X-Forefront-PRVS: 02408926C4
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zhHhMPckHq2BhhccktPi+BrWEn0U90VgVkd/kXiEGRGJHTB+hphgFcYYhF8/i6kQBbfA3VVAnYXHyPxLwS26wP9UvDCSZlCh2EUEtQGVwQqLqlPVedYUsb70SlSQD/sn4jEjABngmClaBGCynutwM3nddoun5N6zC4D5VyfRkaSoPDbKD0DKzFWXEt+AqNpXJ2TzujTMTVebDgezlisBmxeaTsZ5VYBhMyBGF6so6gNopUQAxeXfr6uMBmMWfg3Rmr7aiq7tpu4uBmxsxXBYMUog8AxZxt3BQlpDymNY2QxcH3kd7VZefIKXrJt1WaPmwNeY1JpNr6aP7+cyNyCA4uRQ07JsGPmC9wPzKbBMYLOV+V8DF+L90yuSqCr7uhQkajYc9pT3s6cRtoKkbL5ZytDhLSaOQiN5xVEgQZouIqIVnWYCegEOfUN2O3fukiPNiavhmz7NnGOwO/zOgN3UOA==
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2019 10:14:18.8557 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ce3a51ac-14fd-40bd-9b37-08d777d98f2c
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[158.140.1.28];
 Helo=[sjmaillnx2.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR07MB4616
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-03_02:2019-11-29,2019-12-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0
 priorityscore=1501 suspectscore=1 phishscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 adultscore=0 mlxlogscore=929
 malwarescore=0 mlxscore=0 impostorscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-1910280000
 definitions=main-1912030082
X-Mailman-Approved-At: Tue, 03 Dec 2019 12:48:27 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cadence.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=proofpoint;
 bh=V+fVl0u+EC0Bjf+ILcORO+T3iqAX3P/If4kJlbUMZA4=;
 b=WwCytVIrBs/81lebMgZEm5YP1UGFjjqUN6DnStjuZv7qGDI5mgK1fU7E8LMI14OxRJPH
 ArGpRZIfX+I0rLRGhD7q19nIBoz0AoqG8KPo1Ni7Jko3aXyIykLFfyCvnbpAz1+bCCkC
 q4cv4sS4sTtR6stkpq7+nUOlIhVlOG2VYoop+eyYr3K1O3em+l4FRSVUJ1+pNVMW2+hf
 Lk8rxDP/cYlS5ZnKoqe1SGn8khZmw1UcReVcoD3bLa3QiBzrrFTEtSNSd/ZKG8dK8cWC
 Qim5xTm95LNlwcIZ82VWPzOC8XRyWYIRFmeebxXgezakhy7w9+jlQxqqYlJagARKx7jz Lw== 
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cadence.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V+fVl0u+EC0Bjf+ILcORO+T3iqAX3P/If4kJlbUMZA4=;
 b=ANxcm+iSCnoUaOmXO6UUmQDxL/ZdNpU2GDZ15aEWCRkjM35BOyng28XtTjIahGn4K1bTtRMA+m/oZlXxm12vvpIUzhFSYaxFKSiOxYDhRa6bdXEVYZYGtqaBCYL52+v2llTFqjq606TqQQt0TTfSyUX+u9eRmNIrHKmZq6NgwF4=
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

QWRkIGEgbmV3IGNvbXBhdGlibGUgc3RyaW5nIHVzZWQgZm9yIFRJIFNvQ3MgdXNpbmcgVG9ycmVu
dCBQSFkuCgpTaWduZWQtb2ZmLWJ5OiBZdXRpIEFtb25rYXIgPHlhbW9ua2FyQGNhZGVuY2UuY29t
PgotLS0KIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9waHkvcGh5LWNhZGVuY2Ut
dG9ycmVudC55YW1sIHwgNCArKystCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAx
IGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL3BoeS9waHktY2FkZW5jZS10b3JyZW50LnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvcGh5L3BoeS1jYWRlbmNlLXRvcnJlbnQueWFtbAppbmRleCA2ZTFkNzFlNS4u
ZDVmZGZiNiAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Bo
eS9waHktY2FkZW5jZS10b3JyZW50LnlhbWwKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL3BoeS9waHktY2FkZW5jZS10b3JyZW50LnlhbWwKQEAgLTE0LDcgKzE0LDkgQEAg
bWFpbnRhaW5lcnM6CiAKIHByb3BlcnRpZXM6CiAgIGNvbXBhdGlibGU6Ci0gICAgY29uc3Q6IGNk
bnMsdG9ycmVudC1waHkKKyAgICBhbnlPZjoKKyAgICAgIC0gY29uc3Q6IGNkbnMsdG9ycmVudC1w
aHkKKyAgICAgIC0gY29uc3Q6IHRpLGo3MjFlLXNlcmRlcy0xMGcKIAogICBjbG9ja3M6CiAgICAg
bWF4SXRlbXM6IDEKLS0gCjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
