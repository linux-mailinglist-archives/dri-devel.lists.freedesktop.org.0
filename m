Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 233F910FE09
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 13:49:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B300D6E4F3;
	Tue,  3 Dec 2019 12:48:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0014ca01.pphosted.com (mx0b-0014ca01.pphosted.com
 [208.86.201.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 728FA6E03E
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2019 10:34:11 +0000 (UTC)
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
 by mx0b-0014ca01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xB3AE61Y026007; Tue, 3 Dec 2019 02:14:14 -0800
Received: from nam04-bn3-obe.outbound.protection.outlook.com
 (mail-bn3nam04lp2059.outbound.protection.outlook.com [104.47.46.59])
 by mx0b-0014ca01.pphosted.com with ESMTP id 2wkmvyurgx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 Dec 2019 02:14:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g7AggO+vbRf2ish0sM3Z4Wy7E33nqL969szJjpKO4gHqupX3MHM3yKZfGh9mWYeAdWxmYH+GzFJVFw2OfLUpmeeRiLxd2vdWy05qfNrtBPOqGtrWvrOclj6w9FQrR7t1ckDwynD0wQsw3O7YNRXfc5Sgwvrmd0UwFQ2GXhAnr2Lr04a8NaBIjm7Hc/5C8Q3d5jHUR9ti0i87ddbD6xBLP9RJTwaMqR+//e/gtStp36osQu+DpKZdml6yXEsoxZTpkR6ot5adcg/PPYzk1d4L8G9tJ7BuoBFqMf6WiDok7j0PP7m3PNhM5TDCuKqBi1QntbUTFDd2zIOpLBDWS9lUtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MviBGKAJ8qooqERb5EqCXDB396qvfGTYb8NoeSVNxTo=;
 b=i77TjryW3XFPM8Z6nGXqXEXgJEIfQ0phxZ7HSSW4aFLMJhYW5RKkGkhpLOy9tRhL6WSAXGGx8KQiVkRVkk4u1r1NSLqmZdHEBWWp6mPu/pE4Gp19PGE7AVm+nRv88db7EZ+D2tl8aMoggpUSeL3+ZOGggK3WqAb7QFVChT6uMdRvxXkEVYy+/57EYHBRket80MxGGDRabfwNDKOaUphVujij7yS+vb3iuKtqivbaeh6Z09uUGDJbcpaqa+Mi0nBOyACFnbsj7JTfdstSswoz0hmtj0xiBMF4dI5GFPT26zMm8r4yrUqqNc9+Y1rumbOuXtBTm4c2W7Cj/HRNKmqRDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 158.140.1.28) smtp.rcpttodomain=ti.com smtp.mailfrom=cadence.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=cadence.com;
 dkim=none (message not signed); arc=none
Received: from CY1PR07CA0013.namprd07.prod.outlook.com
 (2a01:111:e400:c60a::23) by DM6PR07MB4697.namprd07.prod.outlook.com
 (2603:10b6:5:a4::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2495.18; Tue, 3 Dec
 2019 10:14:12 +0000
Received: from DM6NAM12FT038.eop-nam12.prod.protection.outlook.com
 (2a01:111:f400:fe59::202) by CY1PR07CA0013.outlook.office365.com
 (2a01:111:e400:c60a::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2495.17 via Frontend
 Transport; Tue, 3 Dec 2019 10:14:12 +0000
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 cadence.com discourages use of 158.140.1.28 as permitted sender)
Received: from sjmaillnx2.cadence.com (158.140.1.28) by
 DM6NAM12FT038.mail.protection.outlook.com (10.13.178.113) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.18 via Frontend Transport; Tue, 3 Dec 2019 10:14:12 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
 by sjmaillnx2.cadence.com (8.14.4/8.14.4) with ESMTP id
 xB3AE7sp027708
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Tue, 3 Dec 2019 02:14:11 -0800
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Tue, 3 Dec 2019 11:14:07 +0100
Received: from vleu-orange.cadence.com (10.160.88.83) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Tue, 3 Dec 2019 11:14:07 +0100
Received: from vleu-orange.cadence.com (localhost.localdomain [127.0.0.1])
 by vleu-orange.cadence.com (8.14.4/8.14.4) with ESMTP id xB3AE7T7030883;
 Tue, 3 Dec 2019 11:14:07 +0100
Received: (from yamonkar@localhost)
 by vleu-orange.cadence.com (8.14.4/8.14.4/Submit) id xB3AE7ht030882;
 Tue, 3 Dec 2019 11:14:07 +0100
From: Yuti Amonkar <yamonkar@cadence.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v1 02/15] dt-bindings:phy: Convert Cadence MHDP PHY bindings
 to YAML.
Date: Tue, 3 Dec 2019 11:13:12 +0100
Message-ID: <1575368005-29797-3-git-send-email-yamonkar@cadence.com>
X-Mailer: git-send-email 2.4.5
In-Reply-To: <1575368005-29797-1-git-send-email-yamonkar@cadence.com>
References: <1575368005-29797-1-git-send-email-yamonkar@cadence.com>
MIME-Version: 1.0
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:158.140.1.28; IPV:CAL; SCL:-1; CTRY:US;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(376002)(346002)(396003)(199004)(189003)(36092001)(6666004)(14444005)(50466002)(356004)(6916009)(76176011)(426003)(86362001)(87636003)(186003)(48376002)(26005)(51416003)(336012)(305945005)(11346002)(26826003)(446003)(6306002)(7636002)(54906003)(2351001)(76130400001)(478600001)(107886003)(8676002)(8936002)(36756003)(50226002)(246002)(5660300002)(4326008)(2616005)(2906002)(42186006)(16586007)(316002)(70206006)(70586007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR07MB4697; H:sjmaillnx2.cadence.com; FPR:;
 SPF:SoftFail; LANG:en; PTR:corp.cadence.com; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cdd3e705-08fb-4c7e-3d3e-08d777d98b46
X-MS-TrafficTypeDiagnostic: DM6PR07MB4697:
X-Microsoft-Antispam-PRVS: <DM6PR07MB469729E3AA37703214B477EBD2420@DM6PR07MB4697.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-Forefront-PRVS: 02408926C4
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: c3da/MU/cchZyEsMmh3FQf8mnLG9stxj9ZQONjh51js6CLtYTPPSQjJSuzFFLR14vtBSuL1VNLUtxzHzH7o2c7yP8zXeZAo8j7GItEwcltiOsICWkFeX5ude1ESfZMW0wU7PrAuyl6i1EQjZeelAy2KOxgH9xxsDRrMg/ycClRGGpDwJJ3z0xB8VftYM0RBMZeauvBCaU4H6avJqtkQUDyavwjULlfW+n3EggapNZrvcjaDjMOBaCdWFWugZq5ihJZOUQhbogD1tJriji/1uikKdI7OE2s82U8oH2d3Q8o++wR8asaCsV1tQHTQ42bo47aobkU1LajcEIFzdT0Was3Gtj76Ua1iJYHuRuJo1NcUG8JXKNWPTa8vGmdF+1JEwpG3Pc+WmB8jTD5z9j2QWMgiyi2KiDjYBJeWOI8FPpGTpXDXwPg5v/fAOphio2nZwNTzbehHnqqMWiSby/mePEeV/jGl/slvFfe7hdjuuGrc=
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2019 10:14:12.3408 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cdd3e705-08fb-4c7e-3d3e-08d777d98b46
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[158.140.1.28];
 Helo=[sjmaillnx2.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR07MB4697
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
 bh=MviBGKAJ8qooqERb5EqCXDB396qvfGTYb8NoeSVNxTo=;
 b=j4vs6WjZYnhtx18k+oD/bg/30ogBgGOy/EQLAB27zOpxUYCUGE60eTEb0AuIsb6YPSOV
 C6JpDZBaXY6soHcXywvtgkj6+/QsKrUGN/AW+/0p39wpajuVuyRP+7KVWUAynNuUoPEK
 MYhmfHbilzmRCftkQg7c2vQW5E64PW8F49W6EU7pUzkI6/k0pTUMrUNIw0CPU2h9nNNI
 Wdv/MDrCeP4pTPf5S+ZNffP8Rx0FX3cnICYZtBQ0w5jAqWhFnrCtn+yAd/ox6eHrXyeL
 TYxiX6uerPpTh88sb0HOD2LlBs3BgyoTyk5vB4syLeuj3tYzSn5Onp8VhSvcd7y20YrN ig== 
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cadence.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MviBGKAJ8qooqERb5EqCXDB396qvfGTYb8NoeSVNxTo=;
 b=mJSrM4rF1JfxnE7kYesO49ZlfOxrJrtvVn8GLQM5QRpdMiQ/Fl7vhwkMTEwF6pnb/SxYBmq6Iy8dKziJ87qyWSZEBQXkpY1MA/UV+TzIw23Wir53pnymqZ4GbhEcU+mM/XZVPFXywZwyCAi0V+cKmfQfuQT5ktIT+LJK0oGCJfM=
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

LSBDb252ZXJ0IHRoZSBNSERQIFBIWSBkZXZpY2V0cmVlIGJpbmRpbmdzIHRvIHlhbWwgc2NoZW1h
cy4KLSBSZW5hbWUgRFAgUEhZIHRvIGhhdmUgZ2VuZXJpYyBUb3JyZW50IFBIWSBub21ybmNsYXR1
cmUuCi0gUmVuYW1lIGNvbXBhdGlibGUgc3RyaW5nIGZyb20gImNkbnMsZHAtcGh5IiB0byAiY2Ru
cyx0b3JyZW50LXBoeSIuCgpTaWduZWQtb2ZmLWJ5OiBZdXRpIEFtb25rYXIgPHlhbW9ua2FyQGNh
ZGVuY2UuY29tPgotLS0KIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BoeS9waHktY2FkZW5jZS1k
cC50eHQgICAgIHwgMzAgLS0tLS0tLS0tLS0tLQogLi4uL2JpbmRpbmdzL3BoeS9waHktY2FkZW5j
ZS10b3JyZW50LnlhbWwgICAgICAgICAgfCA1MiArKysrKysrKysrKysrKysrKysrKysrCiAyIGZp
bGVzIGNoYW5nZWQsIDUyIGluc2VydGlvbnMoKyksIDMwIGRlbGV0aW9ucygtKQogZGVsZXRlIG1v
ZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9waHkvcGh5LWNhZGVu
Y2UtZHAudHh0CiBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL3BoeS9waHktY2FkZW5jZS10b3JyZW50LnlhbWwKCmRpZmYgLS1naXQgYS9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGh5L3BoeS1jYWRlbmNlLWRwLnR4dCBiL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9waHkvcGh5LWNhZGVuY2UtZHAudHh0CmRlbGV0
ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCA3ZjQ5ZmQ1NGUuLjAwMDAwMDAKLS0tIGEvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BoeS9waHktY2FkZW5jZS1kcC50eHQKKysrIC9k
ZXYvbnVsbApAQCAtMSwzMCArMCwwIEBACi1DYWRlbmNlIE1IRFAgRGlzcGxheVBvcnQgU0QwODAx
IFBIWSBiaW5kaW5nCi09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
Ci0KLVRoaXMgYmluZGluZyBkZXNjcmliZXMgdGhlIENhZGVuY2UgU0QwODAxIFBIWSBoYXJkd2Fy
ZSBpbmNsdWRlZCB3aXRoCi10aGUgQ2FkZW5jZSBNSERQIERpc3BsYXlQb3J0IGNvbnRyb2xsZXIu
Ci0KLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KLVJlcXVpcmVkIHByb3BlcnRpZXMgKGNvbnRyb2xs
ZXIgKHBhcmVudCkgbm9kZSk6Ci0tIGNvbXBhdGlibGUJOiBTaG91bGQgYmUgImNkbnMsZHAtcGh5
IgotLSByZWcJCTogRGVmaW5lcyB0aGUgZm9sbG93aW5nIHNldHMgb2YgcmVnaXN0ZXJzIGluIHRo
ZSBwYXJlbnQKLQkJICBtaGRwIGRldmljZToKLQkJCS0gT2Zmc2V0IG9mIHRoZSBEUFRYIFBIWSBj
b25maWd1cmF0aW9uIHJlZ2lzdGVycwotCQkJLSBPZmZzZXQgb2YgdGhlIFNEMDgwMSBQSFkgY29u
ZmlndXJhdGlvbiByZWdpc3RlcnMKLS0gI3BoeS1jZWxscwk6IGZyb20gdGhlIGdlbmVyaWMgUEhZ
IGJpbmRpbmdzLCBtdXN0IGJlIDAuCi0KLU9wdGlvbmFsIHByb3BlcnRpZXM6Ci0tIG51bV9sYW5l
cwk6IE51bWJlciBvZiBEaXNwbGF5UG9ydCBsYW5lcyB0byB1c2UgKDEsIDIgb3IgNCkKLS0gbWF4
X2JpdF9yYXRlCTogTWF4aW11bSBEaXNwbGF5UG9ydCBsaW5rIGJpdCByYXRlIHRvIHVzZSwgaW4g
TWJwcyAoMjE2MCwKLQkJICAyNDMwLCAyNzAwLCAzMjQwLCA0MzIwLCA1NDAwIG9yIDgxMDApCi0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tCi0KLUV4YW1wbGU6Ci0JZHBfcGh5OiBwaHlAZjBmYjAzMGEw
MCB7Ci0JCWNvbXBhdGlibGUgPSAiY2RucyxkcC1waHkiOwotCQlyZWcgPSA8MHhmMCAweGZiMDMw
YTAwIDB4MCAweDAwMDAwMDQwPiwKLQkJICAgICAgPDB4ZjAgMHhmYjUwMDAwMCAweDAgMHgwMDEw
MDAwMD47Ci0JCW51bV9sYW5lcyA9IDw0PjsKLQkJbWF4X2JpdF9yYXRlID0gPDgxMDA+OwotCQkj
cGh5LWNlbGxzID0gPDA+OwotCX07CmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvcGh5L3BoeS1jYWRlbmNlLXRvcnJlbnQueWFtbCBiL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9waHkvcGh5LWNhZGVuY2UtdG9ycmVudC55YW1sCm5ldyBmaWxl
IG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAuLmQwMDM3YmMKLS0tIC9kZXYvbnVsbAorKysgYi9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGh5L3BoeS1jYWRlbmNlLXRvcnJlbnQu
eWFtbApAQCAtMCwwICsxLDUyIEBACislWUFNTCAxLjIKKy0tLQorJGlkOiAiaHR0cDovL2Rldmlj
ZXRyZWUub3JnL3NjaGVtYXMvcGh5L3BoeS1jYWRlbmNlLXRvcnJlbnQueWFtbCMiCiskc2NoZW1h
OiAiaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjIgorCit0aXRs
ZTogQ2FkZW5jZSBUb3JyZW50IFNEMDgwMSBQSFkgYmluZGluZyBmb3IgRGlzcGxheVBvcnQKKwor
ZGVzY3JpcHRpb246CisgIFRoaXMgYmluZGluZyBkZXNjcmliZXMgdGhlIENhZGVuY2UgU0QwODAx
IFBIWSBoYXJkd2FyZSBpbmNsdWRlZCB3aXRoCisgIHRoZSBDYWRlbmNlIE1IRFAgRGlzcGxheVBv
cnQgY29udHJvbGxlci4KKworbWFpbnRhaW5lcnM6CisgIC0gS2lzaG9uIFZpamF5IEFicmFoYW0g
SSA8a2lzaG9uQHRpLmNvbT4KKworcHJvcGVydGllczoKKyAgY29tcGF0aWJsZToKKyAgICBjb25z
dDogY2Rucyx0b3JyZW50LXBoeQorCisgIHJlZzoKKyAgICBpdGVtczoKKyAgICAgIC0gZGVzY3Jp
cHRpb246IE9mZnNldCBvZiB0aGUgRFBUWCBQSFkgY29uZmlndXJhdGlvbiByZWdpc3RlcnMuCisg
ICAgICAtIGRlc2NyaXB0aW9uOiBPZmZzZXQgb2YgdGhlIFNEMDgwMSBQSFkgY29uZmlndXJhdGlv
biByZWdpc3RlcnMuCisKKyAgIiNwaHktY2VsbHMiOgorICAgIGNvbnN0OiAwCisKKyAgbnVtX2xh
bmVzOgorICAgIG1heEl0ZW1zOiAxCisgICAgZGVzY3JpcHRpb246CisgICAgICBOdW1iZXIgb2Yg
RGlzcGxheVBvcnQgbGFuZXMgdG8gdXNlICgxLCAyIG9yIDQpCisKKyAgbWF4X2JpdF9yYXRlOgor
ICAgIG1heEl0ZW1zOiAxCisgICAgZGVzY3JpcHRpb246CisgICAgICBNYXhpbXVtIERpc3BsYXlQ
b3J0IGxpbmsgYml0IHJhdGUgdG8gdXNlLCBpbiBNYnBzICgyMTYwLCAyNDMwLCAyNzAwLCAzMjQw
LCA0MzIwLCA1NDAwIG9yIDgxMDApCisKK3JlcXVpcmVkOgorICAtIGNvbXBhdGlibGUKKyAgLSBy
ZWcKKyAgLSAiI3BoeS1jZWxscyIKKworZXhhbXBsZXM6CisgIC0gfAorICAgIGRwX3BoeTogcGh5
QGYwZmIwMzBhMDAgeworICAgICAgICAgIGNvbXBhdGlibGUgPSAiY2Rucyx0b3JyZW50LXBoeSI7
CisgICAgICAgICAgcmVnID0gPDB4ZjAgMHhmYjAzMGEwMCAweDAgMHgwMDAwMDA0MD4sCisgICAg
ICAgICAgICAgICAgPDB4ZjAgMHhmYjUwMDAwMCAweDAgMHgwMDEwMDAwMD47CisgICAgICAgICAg
bnVtX2xhbmVzID0gPDQ+OworICAgICAgICAgIG1heF9iaXRfcmF0ZSA9IDw4MTAwPjsKKyAgICAg
ICAgICAjcGh5LWNlbGxzID0gPDA+OworICAgIH07CisuLi4KLS0gCjIuNy40CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
