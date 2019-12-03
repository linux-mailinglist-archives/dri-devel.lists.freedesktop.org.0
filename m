Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE18210FE0B
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 13:49:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 399616E506;
	Tue,  3 Dec 2019 12:48:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0014ca01.pphosted.com (mx0a-0014ca01.pphosted.com
 [208.84.65.235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E363C6E03E
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2019 10:28:44 +0000 (UTC)
Received: from pps.filterd (m0042385.ppops.net [127.0.0.1])
 by mx0a-0014ca01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xB3ACE7i020552; Tue, 3 Dec 2019 02:16:53 -0800
Received: from nam05-co1-obe.outbound.protection.outlook.com
 (mail-co1nam05lp2052.outbound.protection.outlook.com [104.47.48.52])
 by mx0a-0014ca01.pphosted.com with ESMTP id 2wknv0ukgc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 Dec 2019 02:16:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DlQpJPa35yHlRnXfjRPYKS4k+JRKlQq6QiTNJoM1Uo8w1a8NJZDGlUg+WFw/OlZI3awbFNPPRThGimqaEiMzEYgbndZiAlv5KQ6VFeAwEFQXB+6ZcdSZvXXHyJBVLBrupUv0kcL+h3w9+edz8Vb8TrAWTRppxBoSFasSI/S/c56/MTXi8XSXR7vgZBybRV1X2TpsEDo0YQNCuPSXdFulvvAUqU6fH7H3vOblgemvDnMcspEkFuoCnLw4F8txHUxNvyU55kjz6da51qB1ltiGPP5BJEj2vrcOd/V1yzSnmqwaKEvBPUODPekCGE02gUmJCn22lef0qbDytbymWYTs/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O8aFk3wzRAeAbAWm4QDM3FPu3SweaS/RjSoUO6by5N4=;
 b=nKPsBUQ9RrXgKfrV0S7xUZj2pPDguwYEYF8D0t/ZmpeYCn15Nn7tfGnT0uNx2co8BYUVxBtkeqHyzJy6hKuRn9oD5Bx6m5GZZPMTTtJ/H7xD2ObtEIX2bnfWxy8r16eOvzztCard3/EtB73sWx0Xy0uesvucYrj5CvFPZtb91KCUtin5LePWOmWpsUgfGfOedUD6Hk+1CwM3/iy9M7szWagC/63azODMt1WMm4TLRgo9s1kli7U9ZJjdwl4Nps4E1r5+Z9l9HBFtwO5pR9wgAATwNjKE/xgMppnm4aZm8Z6tcUTUPV2otO3lFvLFN5F/FV1U/HnDleHajd+X2B9SfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 199.43.4.28) smtp.rcpttodomain=ti.com smtp.mailfrom=cadence.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=cadence.com;
 dkim=none (message not signed); arc=none
Received: from BYAPR07CA0019.namprd07.prod.outlook.com (2603:10b6:a02:bc::32)
 by BN7PR07MB4290.namprd07.prod.outlook.com (2603:10b6:406:b0::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2495.18; Tue, 3 Dec
 2019 10:16:50 +0000
Received: from MW2NAM12FT048.eop-nam12.prod.protection.outlook.com
 (2a01:111:f400:fe5a::203) by BYAPR07CA0019.outlook.office365.com
 (2603:10b6:a02:bc::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2495.18 via Frontend
 Transport; Tue, 3 Dec 2019 10:16:50 +0000
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 cadence.com discourages use of 199.43.4.28 as permitted sender)
Received: from rmmaillnx1.cadence.com (199.43.4.28) by
 MW2NAM12FT048.mail.protection.outlook.com (10.13.180.215) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.18 via Frontend Transport; Tue, 3 Dec 2019 10:16:49 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
 by rmmaillnx1.cadence.com (8.14.4/8.14.4) with ESMTP id
 xB3AGg8k006738
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Tue, 3 Dec 2019 05:16:47 -0500
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Tue, 3 Dec 2019 11:16:43 +0100
Received: from vleu-orange.cadence.com (10.160.88.83) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Tue, 3 Dec 2019 11:16:43 +0100
Received: from vleu-orange.cadence.com (localhost.localdomain [127.0.0.1])
 by vleu-orange.cadence.com (8.14.4/8.14.4) with ESMTP id xB3AGhGR001558;
 Tue, 3 Dec 2019 11:16:43 +0100
Received: (from yamonkar@localhost)
 by vleu-orange.cadence.com (8.14.4/8.14.4/Submit) id xB3AGhA7001552;
 Tue, 3 Dec 2019 11:16:43 +0100
From: Yuti Amonkar <yamonkar@cadence.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v1 3/3] drm/mhdp: add j721e wrapper
Date: Tue, 3 Dec 2019 11:16:06 +0100
Message-ID: <1575368166-861-4-git-send-email-yamonkar@cadence.com>
X-Mailer: git-send-email 2.4.5
In-Reply-To: <1575368166-861-1-git-send-email-yamonkar@cadence.com>
References: <1575368166-861-1-git-send-email-yamonkar@cadence.com>
MIME-Version: 1.0
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:199.43.4.28; IPV:CAL; SCL:-1; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(376002)(39860400002)(396003)(199004)(189003)(36092001)(8936002)(305945005)(81166006)(316002)(51416003)(16586007)(5660300002)(76176011)(42186006)(2906002)(81156014)(4326008)(356004)(50466002)(54906003)(26005)(8676002)(6666004)(107886003)(478600001)(446003)(2616005)(966005)(87636003)(11346002)(6306002)(70586007)(86362001)(2351001)(336012)(186003)(70206006)(14444005)(50226002)(76130400001)(426003)(48376002)(26826003)(6916009)(36756003)(2004002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN7PR07MB4290; H:rmmaillnx1.cadence.com; FPR:;
 SPF:SoftFail; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 54f3b3ee-510b-4764-464c-08d777d9e8ff
X-MS-TrafficTypeDiagnostic: BN7PR07MB4290:
X-Microsoft-Antispam-PRVS: <BN7PR07MB429019B54DC74D124ED3D12FD2420@BN7PR07MB4290.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:418;
X-Forefront-PRVS: 02408926C4
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cn9S/rTUR0oUKktVbqGm77B1NuAQivdHw8p/7qqmzqS3AXyOEtH9ktwlbdLSyx4gxS0R9vHcuC1KXoP53F31ZYU1feQh2CnowjBeX/bvJ3R8BGWBoI9R/rIJvbvjhvMhvEWh5akdDNppk5tGOpeRPLxocSuGMbNn+MM4+eBSCAFWvH5Qqv6NMBp9eh+5BLutzHuxilg1SYpZoYj8pCHrkNoFTUFw1adc2jpixz8vlCf6zQAow1BfLfa/kWB/JJDmd2fPOAYeggck8aWAaZ+nDjyUPvJdh97GIh3L+VDYT2e9f7cGTgghaiqdYYPpmqnBnvS43yzBy0610E3YYqDzv+i5GX0MGMTb9aU+1uMDk6dtkm5wd3tyiirkLTaXc+klJLKr9K2yRw8jUg7M3fmFnKnSfHCP7DsAJjzdh/HevnH5V4ciRNtPzcD1XBYZF95Hbcl+Us0pnWtqXr8LuEJLAxXUbZp9AXgyXJYvOi3P0TtuhxawL6XhFWGdqkQaq1o3
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2019 10:16:49.5435 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 54f3b3ee-510b-4764-464c-08d777d9e8ff
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[199.43.4.28];
 Helo=[rmmaillnx1.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR07MB4290
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-03_02:2019-11-29,2019-12-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0 adultscore=0
 spamscore=0 suspectscore=1 clxscore=1015 mlxlogscore=999 phishscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-1910280000 definitions=main-1912030082
X-Mailman-Approved-At: Tue, 03 Dec 2019 12:48:27 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cadence.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=proofpoint;
 bh=O8aFk3wzRAeAbAWm4QDM3FPu3SweaS/RjSoUO6by5N4=;
 b=eazh604jTQTuuICe0uP898csWepXDcXRznrMz+ekD2eeXL9ggtZl8iKaX5Lf4UelkOp8
 VumY6wBNffPIaB6vI8uIPMy/lPJPUGmRXcR0imFeQWiLkVFZUfXKO5N0vtwjkEoWvzu7
 UxB7Mo6QbLcpM5wOtqBpvknNPCQ4u9XW+JL25smNgZt2jNXVKBpgr2Dh5A+0sENJP/JZ
 cpu31MuMDyySbvNNsFo6nqxzRpfDCePw4eelOSzHOgdN4f3+ErH4IRsv5NrfG32kLDXW
 WmhJgG3MS1SLId7wJIjKW8ly+L0BkVldYFZUEI/qQKvJDWtXVZAdJh/wVCkCseXx1JJR MA== 
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cadence.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O8aFk3wzRAeAbAWm4QDM3FPu3SweaS/RjSoUO6by5N4=;
 b=FjLaCxN1k6uLYDHXBNePY4fUmjcXCRz/bEH53cR7FYt2u0mo/PJTLs9t2k9l/GLiRHbbU4ST5PvtpQuWnC3btFUDRqYlnfDrR445PHSY+kaVQKsRG0AKLI9AAyFOQjstvkIuAQZ9AcLdTag/5WqFXSA0ShfUVi1dkEg77ZVYMEs=
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
 dkangude@cadence.com, jsarha@ti.com, tomi.valkeinen@ti.com,
 sjakhade@cadence.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIGo3MjFlIHdyYXBwZXIgZm9yIG1oZHAsIHdoaWNoIHNldHMgdXAgdGhlIGNsb2NrIGFuZCBk
YXRhIG11eGVzLgoKU2lnbmVkLW9mZi1ieTogWXV0aSBBbW9ua2FyIDx5YW1vbmthckBjYWRlbmNl
LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL0tjb25maWcgICAgICAgICAgIHwgMTAg
KysrKwogZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9NYWtlZmlsZSAgICAgICAgICB8ICAzICsrCiBk
cml2ZXJzL2dwdS9kcm0vYnJpZGdlL2NkbnMtbWhkcC1qNzIxZS5jIHwgNzkgKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysKIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvY2Rucy1taGRwLWo3
MjFlLmggfCA1NSArKysrKysrKysrKysrKysrKysrKysrCiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdl
L2NkbnMtbWhkcC5jICAgICAgIHwgMTQgKysrKystCiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2Nk
bnMtbWhkcC5oICAgICAgIHwgIDEgKwogNiBmaWxlcyBjaGFuZ2VkLCAxNjEgaW5zZXJ0aW9ucygr
KSwgMSBkZWxldGlvbigtKQogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9icmlk
Z2UvY2Rucy1taGRwLWo3MjFlLmMKIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0v
YnJpZGdlL2NkbnMtbWhkcC1qNzIxZS5oCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Jy
aWRnZS9LY29uZmlnIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9LY29uZmlnCmluZGV4IDYxNmMw
NWYuLjRiNjc5OWIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvS2NvbmZpZwor
KysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL0tjb25maWcKQEAgLTQ4LDYgKzQ4LDE2IEBAIGNv
bmZpZyBEUk1fQ0ROU19NSERQCiAJICBJdCB0YWtlcyBhIERQSSBzdHJlYW0gYXMgaW5wdXQgYW5k
IG91dHB1dCBpdCBlbmNvZGVkCiAJICBpbiBEUCBmb3JtYXQuCiAKK2lmIERSTV9DRE5TX01IRFAK
KworY29uZmlnIERSTV9DRE5TX01IRFBfSjcyMUUKKwlib29sICJKNzIxRSBDYWRlbmNlIERQSS9E
UCB3cmFwcGVyIHN1cHBvcnQiCisJZGVmYXVsdCB5CisJaGVscAorCSAgU3VwcG9ydCBKNzIxRSBD
YWRlbmNlIERQSS9EUCB3cmFwcGVyLkl0IHNldHMgdXAKKwkgIHRoZSBjbG9jayBhbmQgZGF0YSBt
dXhlcy4KK2VuZGlmCisKIGNvbmZpZyBEUk1fRFVNQl9WR0FfREFDCiAJdHJpc3RhdGUgIkR1bWIg
VkdBIERBQyBCcmlkZ2Ugc3VwcG9ydCIKIAlkZXBlbmRzIG9uIE9GCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYnJpZGdlL01ha2VmaWxlIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9NYWtl
ZmlsZQppbmRleCBjMWEwZGE3Li5kMzU4MTg0IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YnJpZGdlL01ha2VmaWxlCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvTWFrZWZpbGUKQEAg
LTIwLDMgKzIwLDYgQEAgb2JqLSQoQ09ORklHX0RSTV9DRE5TX01IRFApICs9IG1oZHA4NTQ2Lm8K
IG9iai15ICs9IHN5bm9wc3lzLwogCiBtaGRwODU0Ni1vYmpzIDo9IGNkbnMtbWhkcC5vCitpZmVx
ICgkKENPTkZJR19EUk1fQ0ROU19NSERQX0o3MjFFKSx5KQorCW1oZHA4NTQ2LW9ianMgKz0gY2Ru
cy1taGRwLWo3MjFlLm8KK2VuZGlmCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdl
L2NkbnMtbWhkcC1qNzIxZS5jIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9jZG5zLW1oZHAtajcy
MWUuYwpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwLi5hODdmYWY1Ci0tLSAvZGV2
L251bGwKKysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9jZG5zLW1oZHAtajcyMWUuYwpAQCAt
MCwwICsxLDc5IEBACisvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMAorLyoKKyAq
IFRJIGo3MjFlIENhZGVuY2UgTUhEUCBEUCB3cmFwcGVyCisgKgorICogQ29weXJpZ2h0IChDKSAy
MDE5IFRleGFzIEluc3RydW1lbnRzIEluY29ycG9yYXRlZCAtIGh0dHA6Ly93d3cudGkuY29tLwor
ICogQXV0aG9yOiBKeXJpIFNhcmhhIDxqc2FyaGFAdGkuY29tCisgKgorICogVGhpcyBwcm9ncmFt
IGlzIGZyZWUgc29mdHdhcmU7IHlvdSBjYW4gcmVkaXN0cmlidXRlIGl0IGFuZC9vciBtb2RpZnkK
KyAqIGl0IHVuZGVyIHRoZSB0ZXJtcyBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2Ug
dmVyc2lvbiAyIGFzCisgKiBwdWJsaXNoZWQgYnkgdGhlIEZyZWUgU29mdHdhcmUgRm91bmRhdGlv
bi4KKyAqLworCisjaW5jbHVkZSA8bGludXgvZGV2aWNlLmg+CisjaW5jbHVkZSA8bGludXgvaW8u
aD4KKworI2luY2x1ZGUgImNkbnMtbWhkcC1qNzIxZS5oIgorCisjZGVmaW5lCVJFVklTSU9OCQkJ
MHgwMAorI2RlZmluZQlEUFRYX0lQQ0ZHCQkJMHgwNAorI2RlZmluZQlFQ0NfTUVNX0NGRwkJCTB4
MDgKKyNkZWZpbmUJRFBUWF9EU0NfQ0ZHCQkJMHgwYworI2RlZmluZQlEUFRYX1NSQ19DRkcJCQkw
eDEwCisjZGVmaW5lCURQVFhfVklGX1NFQ1VSRV9NT0RFX0NGRwkweDE0CisjZGVmaW5lCURQVFhf
VklGX0NPTk5fU1RBVFVTCQkweDE4CisjZGVmaW5lCVBIWV9DTEtfU1RBVFVTCQkJMHgxYworCisj
ZGVmaW5lIERQVFhfU1JDX0FJRl9FTgkJCUJJVCgxNikKKyNkZWZpbmUgRFBUWF9TUkNfVklGXzNf
SU4zMEIJCUJJVCgxMSkKKyNkZWZpbmUgRFBUWF9TUkNfVklGXzJfSU4zMEIJCUJJVCgxMCkKKyNk
ZWZpbmUgRFBUWF9TUkNfVklGXzFfSU4zMEIJCUJJVCg5KQorI2RlZmluZSBEUFRYX1NSQ19WSUZf
MF9JTjMwQgkJQklUKDgpCisjZGVmaW5lIERQVFhfU1JDX1ZJRl8zX1NFTF9EUEk1CQlCSVQoNykK
KyNkZWZpbmUgRFBUWF9TUkNfVklGXzNfU0VMX0RQSTMJCTAKKyNkZWZpbmUgRFBUWF9TUkNfVklG
XzJfU0VMX0RQSTQJCUJJVCg2KQorI2RlZmluZSBEUFRYX1NSQ19WSUZfMl9TRUxfRFBJMgkJMAor
I2RlZmluZSBEUFRYX1NSQ19WSUZfMV9TRUxfRFBJMwkJQklUKDUpCisjZGVmaW5lIERQVFhfU1JD
X1ZJRl8xX1NFTF9EUEkxCQkwCisjZGVmaW5lIERQVFhfU1JDX1ZJRl8wX1NFTF9EUEkyCQlCSVQo
NCkKKyNkZWZpbmUgRFBUWF9TUkNfVklGXzBfU0VMX0RQSTAJCTAKKyNkZWZpbmUgRFBUWF9TUkNf
VklGXzNfRU4JCUJJVCgzKQorI2RlZmluZSBEUFRYX1NSQ19WSUZfMl9FTgkJQklUKDIpCisjZGVm
aW5lIERQVFhfU1JDX1ZJRl8xX0VOCQlCSVQoMSkKKyNkZWZpbmUgRFBUWF9TUkNfVklGXzBfRU4J
CUJJVCgwKQorCisvKiBUT0RPIHR1cm4gRFBUWF9JUENGRyBmd19tZW1fY2xrX2VuIGF0IHBtX3J1
bnRpbWVfc3VzcGVuZC4gKi8KKworaW50IGNkbnNfbWhkcF9qNzIxZV9pbml0KHN0cnVjdCBjZG5z
X21oZHBfZGV2aWNlICptaGRwKQoreworCXN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYgPSB0
b19wbGF0Zm9ybV9kZXZpY2UobWhkcC0+ZGV2KTsKKwlzdHJ1Y3QgcmVzb3VyY2UgKnJlZ3M7CisK
KwlyZWdzID0gcGxhdGZvcm1fZ2V0X3Jlc291cmNlKHBkZXYsIElPUkVTT1VSQ0VfTUVNLCAxKTsK
KwltaGRwLT5qNzIxZV9yZWdzID0gZGV2bV9pb3JlbWFwX3Jlc291cmNlKCZwZGV2LT5kZXYsIHJl
Z3MpOworCWlmIChJU19FUlIobWhkcC0+ajcyMWVfcmVncykpCisJCXJldHVybiBQVFJfRVJSKG1o
ZHAtPmo3MjFlX3JlZ3MpOworCisJcmV0dXJuIDA7Cit9CisKK3ZvaWQgY2Ruc19taGRwX2o3MjFl
X2Zpbmkoc3RydWN0IGNkbnNfbWhkcF9kZXZpY2UgKm1oZHApCit7Cit9CisKK3ZvaWQgY2Ruc19t
aGRwX2o3MjFlX2VuYWJsZShzdHJ1Y3QgY2Ruc19taGRwX2RldmljZSAqbWhkcCkKK3sKKwkvKgor
CSAqIEVuZWJsZSBWSUZfMCBhbmQgc2VsZWN0IERQSTIgYXMgaXRzIGlucHV0LiBEU1MwIERQSTAg
aXMgY29ubmVjdGVkCisJICogdG8gZURQIERQSTIuIFRoaXMgaXMgdGhlIG9ubHkgc3VwcG9ydGVk
IFNTVCBjb25maWd1cmF0aW9uIG9uCisJICogSjcyMUUuCisJICovCisJd3JpdGVsKERQVFhfU1JD
X1ZJRl8wX0VOIHwgRFBUWF9TUkNfVklGXzBfU0VMX0RQSTIsCisJICAgICAgIG1oZHAtPmo3MjFl
X3JlZ3MgKyBEUFRYX1NSQ19DRkcpOworfQorCit2b2lkIGNkbnNfbWhkcF9qNzIxZV9kaXNhYmxl
KHN0cnVjdCBjZG5zX21oZHBfZGV2aWNlICptaGRwKQoreworCS8qIFB1dCBldmVyeXRoaW5nIHRv
IGRlZmF1bHRzICAqLworCXdyaXRlbCgwLCBtaGRwLT5qNzIxZV9yZWdzICsgRFBUWF9EU0NfQ0ZH
KTsKK30KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvY2Rucy1taGRwLWo3MjFl
LmggYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2NkbnMtbWhkcC1qNzIxZS5oCm5ldyBmaWxlIG1v
ZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAuLmJkNTM1MDgKLS0tIC9kZXYvbnVsbAorKysgYi9kcml2
ZXJzL2dwdS9kcm0vYnJpZGdlL2NkbnMtbWhkcC1qNzIxZS5oCkBAIC0wLDAgKzEsNTUgQEAKKy8q
IFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wICovCisvKgorICogVEkgajcyMWUgQ2Fk
ZW5jZSBNSERQIERQIHdyYXBwZXIKKyAqCisgKiBDb3B5cmlnaHQgKEMpIDIwMTkgVGV4YXMgSW5z
dHJ1bWVudHMgSW5jb3Jwb3JhdGVkIC0gaHR0cDovL3d3dy50aS5jb20vCisgKiBBdXRob3I6IEp5
cmkgU2FyaGEgPGpzYXJoYUB0aS5jb20KKyAqCisgKiBUaGlzIHByb2dyYW0gaXMgZnJlZSBzb2Z0
d2FyZTsgeW91IGNhbiByZWRpc3RyaWJ1dGUgaXQgYW5kL29yIG1vZGlmeQorICogaXQgdW5kZXIg
dGhlIHRlcm1zIG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSB2ZXJzaW9uIDIgYXMK
KyAqIHB1Ymxpc2hlZCBieSB0aGUgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uLgorICovCisKKyNp
Zm5kZWYgQ0ROU19NSERQX0o3MjFFX0gKKyNkZWZpbmUgQ0ROU19NSERQX0o3MjFFX0gKKworI2lu
Y2x1ZGUgPGxpbnV4L3BsYXRmb3JtX2RldmljZS5oPgorI2luY2x1ZGUgImNkbnMtbWhkcC5oIgor
CitzdHJ1Y3QgY2Ruc19taGRwX2o3MjFlX3dyYXA7CisKKyNpZmRlZiBDT05GSUdfRFJNX0NETlNf
TUhEUF9KNzIxRQorCitpbnQgY2Ruc19taGRwX2o3MjFlX2luaXQoc3RydWN0IGNkbnNfbWhkcF9k
ZXZpY2UgKm1oZHApOworCit2b2lkIGNkbnNfbWhkcF9qNzIxZV9maW5pKHN0cnVjdCBjZG5zX21o
ZHBfZGV2aWNlICptaGRwKTsKKwordm9pZCBjZG5zX21oZHBfajcyMWVfZW5hYmxlKHN0cnVjdCBj
ZG5zX21oZHBfZGV2aWNlICptaGRwKTsKKwordm9pZCBjZG5zX21oZHBfajcyMWVfZGlzYWJsZShz
dHJ1Y3QgY2Ruc19taGRwX2RldmljZSAqbWhkcCk7CisKKyNlbHNlCisKK3N0YXRpYyBpbmxpbmUK
K2ludCBjZG5zX21oZHBfajcyMWVfaW5pdChzdHJ1Y3QgY2Ruc19taGRwX2RldmljZSAqbWhkcCkK
K3sKKwlyZXR1cm4gMDsKK30KKworc3RhdGljIGlubGluZQordm9pZCBjZG5zX21oZHBfajcyMWVf
ZmluaShzdHJ1Y3QgY2Ruc19taGRwX2RldmljZSAqbWhkcCkKK3sKK30KKworc3RhdGljIGlubGlu
ZQordm9pZCBjZG5zX21oZHBfajcyMWVfc3N0X2VuYWJsZShzdHJ1Y3QgY2Ruc19taGRwX2Rldmlj
ZSAqbWhkcCk7Cit7Cit9CisKK3N0YXRpYyBpbmxpbmUKK3ZvaWQgY2Ruc19taGRwX2o3MjFlX3Nz
dF9kaXNhYmxlKHN0cnVjdCBjZG5zX21oZHBfZGV2aWNlICptaGRwKQoreworfQorI2VuZGlmIC8q
IENPTkZJR19EUk1fQ0ROU19NSERQX0o3MjFFICovCisKKyNlbmRpZiAvKiAhQ0ROU19NSERQX0o3
MjFFX0ggKi8KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvY2Rucy1taGRwLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2NkbnMtbWhkcC5jCmluZGV4IDQyNDY4ZTEuLjE0NmZm
N2EgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvY2Rucy1taGRwLmMKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9jZG5zLW1oZHAuYwpAQCAtMzYsOSArMzYsMjEgQEAKICNp
bmNsdWRlIDxhc20vdW5hbGlnbmVkLmg+CiAKICNpbmNsdWRlICJjZG5zLW1oZHAuaCIKLQorI2lu
Y2x1ZGUgImNkbnMtbWhkcC1qNzIxZS5oIgorCisjaWZkZWYgQ09ORklHX0RSTV9DRE5TX01IRFBf
SjcyMUUKK3N0YXRpYyBjb25zdCBzdHJ1Y3QgbWhkcF9wbGF0Zm9ybV9vcHMgbWhkcF90aV9qNzIx
ZV9vcHMgPSB7CisJLmluaXQgPSBjZG5zX21oZHBfajcyMWVfaW5pdCwKKwkuZXhpdCA9IGNkbnNf
bWhkcF9qNzIxZV9maW5pLAorCS5lbmFibGUgPSBjZG5zX21oZHBfajcyMWVfZW5hYmxlLAorCS5k
aXNhYmxlID0gY2Ruc19taGRwX2o3MjFlX2Rpc2FibGUsCit9OworI2VuZGlmCiBzdGF0aWMgY29u
c3Qgc3RydWN0IG9mX2RldmljZV9pZCBtaGRwX2lkc1tdID0gewogCXsgLmNvbXBhdGlibGUgPSAi
Y2RucyxtaGRwODU0NiIsIH0sCisjaWZkZWYgQ09ORklHX0RSTV9DRE5TX01IRFBfSjcyMUUKKwl7
IC5jb21wYXRpYmxlID0gInRpLGo3MjFlLW1oZHA4NTQ2IiwgLmRhdGEgPSAmbWhkcF90aV9qNzIx
ZV9vcHMgfSwKKyNlbmRpZgogCXsgLyogc2VudGluZWwgKi8gfQogfTsKIE1PRFVMRV9ERVZJQ0Vf
VEFCTEUob2YsIG1oZHBfaWRzKTsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uv
Y2Rucy1taGRwLmggYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2NkbnMtbWhkcC5oCmluZGV4IDlh
Y2I4OWQuLmM5MDEzYmUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvY2Rucy1t
aGRwLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9jZG5zLW1oZHAuaApAQCAtMzM1LDYg
KzMzNSw3IEBAIHN0cnVjdCBtaGRwX3BsYXRmb3JtX29wcyB7CiAKIHN0cnVjdCBjZG5zX21oZHBf
ZGV2aWNlIHsKIAl2b2lkIF9faW9tZW0gKnJlZ3M7CisJdm9pZCBfX2lvbWVtICpqNzIxZV9yZWdz
OwogCiAJc3RydWN0IGRldmljZSAqZGV2OwogCXN0cnVjdCBjbGsgKmNsazsKLS0gCjIuNy40Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
