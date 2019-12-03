Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 55CBB10FDFF
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 13:48:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C534D6E4D2;
	Tue,  3 Dec 2019 12:48:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0014ca01.pphosted.com (mx0a-0014ca01.pphosted.com
 [208.84.65.235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A80986E03F
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2019 10:36:45 +0000 (UTC)
Received: from pps.filterd (m0042385.ppops.net [127.0.0.1])
 by mx0a-0014ca01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xB3ACDbJ020547; Tue, 3 Dec 2019 02:14:14 -0800
Received: from nam04-sn1-obe.outbound.protection.outlook.com
 (mail-sn1nam04lp2058.outbound.protection.outlook.com [104.47.44.58])
 by mx0a-0014ca01.pphosted.com with ESMTP id 2wknv0uk84-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 Dec 2019 02:14:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nIvzBuVbUB1UY102S/VA5dpuXwl++DPg56pZfepkxrvCOqUlZcxp+SCbAkK59baqrMJu+nf6N5l8d4uPHu4f0QXQ5aRhHRE9HQXifK0/Mh9gNnsfm6cjIDugt5v2w4wXIaog/SSV3pUDqgC2WyI4tzHoG5+2oyd21GeBSa/AX9n9NQYwm3DxjHxduPA0VjdLhv2358+Awp7ljZm/WkVXr9yV8xQByXaRpp33BXWZVUbOQeyGLe4gRezvG+pwkJc+9EBLEjrliUiEIk8g97YxhHldt26ntmGShK2G7Jgx1OZ2jVE3IsBESZvWN4fjx52E5q0sca8RFYUgLLj+CHKqjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B5xA/nTwe/jVio7WBGPqz1t6adufCD9Cdvmd8FLl/YI=;
 b=MW56XYeM6bwAhgodJApj4i+cFUMg2KQuvuPSTaBDK/r0hokhqG8wZ0fDxSKnP3vc5aIWjBGz1m4w241XDSFwlbFw/6AnR+fPMAAM1BMMUm2O15xeHC5RMrlFUI/sHiTjJBL7CggsScnHLOZBto4T4zMjvmee8YQotNRXJMrmxSPXsgqXTQLOJW6ONpWv/Y7Oh1vaHCj8Rx4DLSQt+cJSaZ7rNCiTsbyfNxUNj6XcOn2MuXqRx4KdRN8HTiHnPtYQZ1L7738y4nwJMdZhZFYX/+KpnVBXmCzogNpjp44PL7/F//l2Yu3Rq2y3PFTRLMI/b1Yy6R665opBagskr8uiew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 158.140.1.28) smtp.rcpttodomain=ti.com smtp.mailfrom=cadence.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=cadence.com;
 dkim=none (message not signed); arc=none
Received: from DM6PR07CA0060.namprd07.prod.outlook.com (2603:10b6:5:74::37) by
 BYAPR07MB4661.namprd07.prod.outlook.com (2603:10b6:a02:fe::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.20; Tue, 3 Dec 2019 10:14:11 +0000
Received: from DM6NAM12FT055.eop-nam12.prod.protection.outlook.com
 (2a01:111:f400:fe59::200) by DM6PR07CA0060.outlook.office365.com
 (2603:10b6:5:74::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2495.18 via Frontend
 Transport; Tue, 3 Dec 2019 10:14:11 +0000
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 cadence.com discourages use of 158.140.1.28 as permitted sender)
Received: from sjmaillnx2.cadence.com (158.140.1.28) by
 DM6NAM12FT055.mail.protection.outlook.com (10.13.179.38) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.18 via Frontend Transport; Tue, 3 Dec 2019 10:14:11 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
 by sjmaillnx2.cadence.com (8.14.4/8.14.4) with ESMTP id
 xB3AE7sn027708
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Tue, 3 Dec 2019 02:14:09 -0800
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Tue, 3 Dec 2019 11:14:06 +0100
Received: from vleu-orange.cadence.com (10.160.88.83) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Tue, 3 Dec 2019 11:14:06 +0100
Received: from vleu-orange.cadence.com (localhost.localdomain [127.0.0.1])
 by vleu-orange.cadence.com (8.14.4/8.14.4) with ESMTP id xB3AE6rp030871;
 Tue, 3 Dec 2019 11:14:06 +0100
Received: (from yamonkar@localhost)
 by vleu-orange.cadence.com (8.14.4/8.14.4/Submit) id xB3AE5fq030847;
 Tue, 3 Dec 2019 11:14:05 +0100
From: Yuti Amonkar <yamonkar@cadence.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v1 00/15] PHY: Update Cadence Torrent PHY driver with
 reconfiguration 
Date: Tue, 3 Dec 2019 11:13:10 +0100
Message-ID: <1575368005-29797-1-git-send-email-yamonkar@cadence.com>
X-Mailer: git-send-email 2.4.5
MIME-Version: 1.0
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:158.140.1.28; IPV:CAL; SCL:-1; CTRY:US;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(396003)(39860400002)(346002)(376002)(36092001)(189003)(199004)(14444005)(50226002)(8936002)(107886003)(5660300002)(6916009)(8676002)(86362001)(246002)(48376002)(2351001)(336012)(2616005)(4326008)(50466002)(426003)(76130400001)(2906002)(4743002)(54906003)(316002)(26005)(42186006)(51416003)(15650500001)(16586007)(186003)(19627235002)(305945005)(70586007)(70206006)(478600001)(6666004)(356004)(36756003)(26826003)(7636002)(87636003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR07MB4661; H:sjmaillnx2.cadence.com; FPR:;
 SPF:SoftFail; LANG:en; PTR:corp.cadence.com; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 67ef5ec8-4b11-49df-043c-08d777d98ae0
X-MS-TrafficTypeDiagnostic: BYAPR07MB4661:
X-Microsoft-Antispam-PRVS: <BYAPR07MB466179BF9808ED32CA55888ED2420@BYAPR07MB4661.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-Forefront-PRVS: 02408926C4
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: e5HHJy6q/foPRQ++r1DmdAomSr/i2qUHT93JzkAiLtHRNnxBhiTKpCNi3cvWYcdn3NmrBe2HxPQKYcgYnOhmF4TSz5xojVF180CdYWuMYOoR5GL6Bf0e5yjLBRflJlFdWpvXIKhv6fB01eyIsy1OstQi34Q2Gtz7+Zi/dmV7gptHlrph4Lbsfxd7jCrs90d0d33lm8kYS+YhyW/xRqNhE1zTdeig8dAQLcUbImrbnNVOFU5Mp8wNpGs3VukMojlI9mQ6IxY18QhCuWZkS+5kAQafPdW2wMV6ZeN8Ymo7r8aepR+rtvVfTeMLZQeSJ4yeEoy2gJCGhYpavVclyocBnZPb0gOuqcsk2ERf1YSrfBxc6c8V99hAsXFN/Y6K9T6csxGRlr2SfDB5T2jo7oj155sVOrMjhSViTMfTNeq/RMKIcf7d2x3z9a22QTx/Pq7EeHbFs0nMqWpOW0Rv9KPP50oINuL+2SG3c4lNnrIwwotliy2Sml36ywYpE3G+Mpxn
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2019 10:14:11.6699 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 67ef5ec8-4b11-49df-043c-08d777d98ae0
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[158.140.1.28];
 Helo=[sjmaillnx2.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR07MB4661
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-03_02:2019-11-29,2019-12-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0 adultscore=0
 spamscore=0 suspectscore=1 clxscore=1011 mlxlogscore=999 phishscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-1910280000 definitions=main-1912030082
X-Mailman-Approved-At: Tue, 03 Dec 2019 12:48:27 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cadence.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=proofpoint;
 bh=B5xA/nTwe/jVio7WBGPqz1t6adufCD9Cdvmd8FLl/YI=;
 b=d8TqnvpooF0ICtkZltDe6IGzjciOhVOyPJuPLW4n/ozG72l8pbmjw7/JMA3gwyQ7Ku7e
 vmWQtBx5Q266phToukSG5jrpXcFwIDwDm0D9N+dCJRPM7aKJ8pg403LWZa/EEATFFQzc
 IPdoPiCJWnEINteYcgl/h9wa6ifaogRRvHx83JnkTdzb5QdaE0JyQr3h2H/hVBUvrdbu
 3RCGEoG1yLIuOXjfJfCiQ1fRYgmDBXlIvcKCY+qewb/9zgZoD9KlvjQqti9LDWHga2Qw
 5yPNZmioO03YQbIvEgBkcFGAt5XtcNZAvD32H6BQ8J3bhWayxhhUswOQ94GsXYBlLImm Ig== 
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cadence.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B5xA/nTwe/jVio7WBGPqz1t6adufCD9Cdvmd8FLl/YI=;
 b=UvhCzLTjS7jSE4Y5AnFsIBXAQS7k66ZAACc9F6yePbV5Suo+hZEJtIUoY/2+9coC0asL21qhDz7zPrjZIAMq75WoMUUc4op9UZiVFvAH9bEgPDmwv0vV3TImgQ+U3GnNnYyr1nRGjKCbtVafCAgvYNrQW82MMA9h1hpDQVaMSgI=
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

VGhpcyBwYXRjaCBzZXJpZXMgYXBwbGllcyB0byB0aGUgQ2FkZW5jZSBTRDA4MDEgUEhZIGRyaXZl
ci4gQ2FkZW5jZSBTRDA4MDEgUEhZIGRyaXZlcgppcyBUb3JyZW50IFBIWSBkcml2ZXIgZm9yIERp
c3BsYXkgUG9ydC5Ub3JyZW50IFBIWSBpcyBhIG11bHRpcHJvdG9jb2wgUEhZIHN1cHBvcnRpbmcg
UEhZIApjb25maWd1cmF0aW9ucyBpbmNsdWRpbmcgRGlzcGxheSBQb3J0LFVTQiBhbmQgUENJZS4g
ClRoaXMgcGF0Y2ggc2VyaWVzIGZpcnN0IGFkZHMgZGlzcGxheSBwb3J0IGNvbmZpZ3VyYXRpb24g
dGhlbiB1cGRhdGVzIHRoZSBkcml2ZXIgdG8gbWFrZQppdCBhIGdlbmVyaWMgVG9ycmVudCBkcml2
ZXIgYW5kIGZpbmFsbHkgYWRkcyBTb0MgcGxhdGZvcm0gZGVwZW5kZW50IGluaXRpYWxpemF0aW9u
LgoKVGhlIHBhdGNoIHNlcmllcyBoYXMgMTUgcGF0Y2hlcyB3aGljaCBhcHBsaWVzIHRoZSBjaGFu
Z2VzIGluIHRoZSBiZWxvdyBzZXF1ZW5jZSAKMS4gIDAwMS1waHktY2FkYW5jZS1kcC1BZGQtRGlz
cGxheVBvcnQtY29uZmlndXJhdGlvbi1vcHRpb25zClRoaXMgcGF0Y2ggYWRkcyBnZW5lcmljIERp
c3BsYXlQb3J0IEFQSSBmb3IgY29uZmlndXJpbmcgUEhZLlRoZSBwYXJhbWV0ZXJzIGNvbmZpZ3Vy
ZWQgYXJlCmxpbmsgcmF0ZSwgbnVtYmVyIG9mIGxhbmVzLCB2b2x0YWdlIHN3aW5nIGFuZCBwcmUt
ZW1waGFzaXMuCjIuIDAwMi1kdC1iaW5kaW5ncy1waHktQ29udmVydC1DYWRlbmNlLU1IRFAtUEhZ
LWJpbmRpbmdzLXRvLVlBTUwKVGhpcyBwYXRjaCBjb252ZXJ0cyB0aGUgTUhEUCBQSFkgZGV2aWNl
IHRyZWUgYmluZGluZ3MgdG8geWFtbCBzY2hlbWFzIAozLiAwMDMtcGh5LWNhZGVuY2UtZHAtUmVu
YW1lLXRvLXBoeS1DYWRlbmNlLVRvcnJlbnQKUmVuYW1lIENhZGVuY2UgRFAgUEhZIGRyaXZlciBm
cm9tIHBoeS1jYWRlbmNlLWRwIHRvIHBoeS1jYWRlbmNlLXRvcnJlbnQgCjQuIDAwNC1waHktY2Fk
ZW5jZS10b3JyZW50LUFkb3B0LVRvcnJlbnQtbm9tZW5jbGF0dXJlClVwZGF0ZSBwcml2YXRlIGRh
dGEgc3RydWN0dXJlcywgbW9kdWxlIGRlc2NyaXB0aW9ucyBhbmQgZnVuY3Rpb25zIHByZWZpeCB0
byBUb3JyZW50IAo1LiAwMDUtcGh5LWNhZGVuY2UtdG9ycmVudC1BZGQtd3JhcHBlci1mb3ItUEhZ
LXJlZ2lzdGVyLWFjY2VzcwpBZGQgYSB3cmFwcGVyIGZ1bmN0aW9uIHRvIHdyaXRlIFRvcnJlbnQg
UEhZIHJlZ2lzdGVycyB0byBpbXByb3ZlIGNvZGUgcmVhZGFiaWxpdHkuCjYuIDAwNi1waHktY2Fk
ZW5jZS10b3JyZW50LUFkZC13cmFwcGVyLWZvci1EUFRYLXJlZ2lzdGVyLWFjY2VzcwpBZGQgd3Jh
cHBlciBmdW5jdGlvbnMgdG8gcmVhZCwgd3JpdGUgRGlzcGxheVBvcnQgc3BlY2lmaWMgUEhZIHJl
Z2lzdGVycyB0byBpbXByb3ZlIGNvZGUKcmVhZGFiaWxpdHkuCjcuIDAwNy1waHktY2FkZW5jZS10
b3JyZW50LVJlZmFjdG9yLWNvZGUtZm9yLXJldXNhYmlsaXR5CkFkZCBzZXBhcmF0ZSBmdW5jdGlv
biB0byBzZXQgZGlmZmVyZW50IHBvd2VyIHN0YXRlIHZhbHVlcy4KVXNlIG9mIHVuaWZvcm0gcG9s
bGluZyB0aW1lb3V0IHZhbHVlLiBDaGVjayByZXR1cm4gdmFsdWVzIG9mIGZ1bmN0aW9ucyBmb3Ig
ZXJyb3IgaGFuZGxpbmcuCjguIDAwOC1waHktY2FkZW5jZS10b3JyZW50LUFkZCBjbG9jayBiaW5k
aW5ncyAKQWRkIFRvcnJlbnQgUEhZIHJlZmVyZW5jZSBjbG9jayBiaW5kaW5ncy4gCjkuIDAwOS1w
aHktY2FkZW5jZS10b3JyZW50LUFkZC0xOS4yLU1Iei1yZWZlcmVuY2UtY2xvY2stc3VwcG9ydApB
ZGQgY29uZmlndXJhdGlvbiBmdW5jdGlvbnMgZm9yIDE5LjIgTUh6IHJlZmVyZW5jZSBjbG9jayBz
dXBwb3J0LkFkZCByZWdpc3RlciBjb25maWd1cmF0aW9ucwpmb3IgU1NDIHN1cHBvcnQuCjEwLiAw
MTAtcGh5LWNhZGVuY2UtdG9ycmVudC1BZGQtcGh5LWxhbmUtcmVzZXQtc3VwcG9ydApBZGQgcmVz
ZXQgc3VwcG9ydCBmb3IgUEhZIGxhbmUgZ3JvdXAuCjExLiAwMTEtcGh5LWNhZGVuY2UtdG9ycmVu
dC1JbXBsZW1lbnQtcGh5LWNvbmZpZ3VyZS1BUElzCkFkZCBQSFkgY29uZmlndXJhdGlvbiBBUElz
IGZvciBsaW5rIHJhdGUsIG51bWJlciBvZiBsYW5lcywgdm9sdGFnZSBzd2luZyBhbmQgcHJlLWVt
cGhhc2lzIHZhbHVlcy4KMTIuIDAxMi1waHktY2FkZW5jZS10b3JyZW50LVVzZS1yZWdtYXAKVXNl
IHJlZ21hcCBmb3IgYWNjZXNzaW5nIFRvcnJlbnQgUEhZIHJlZ2lzdGVycy4gVXBkYXRlIHJlZ2lz
dGVyIG9mZnNldHMuIEFic3RyYWN0IGFkZHJlc3MgCmNhbGN1bGF0aW9uIHVzaW5nIHJlZ21hcCBB
UElzLgoxMy4gMDEzLXBoeTogY2FkZW5jZS10b3JyZW50LVVzZS1yZWdtYXAtdG8tcmVhZC1hbmQt
d3JpdGUtRFBUWC1QSFktcmVnaXN0ZXJzClVzZSByZWdtYXAgdG8gcmVhZCBhbmQgd3JpdGUgRFBU
WCBzcGVjaWZpYyBQSFkgcmVnaXN0ZXJzLgoxNC4gMDE0LWR0LWJpbmRpbmdzLXBoeS1waHktY2Fk
ZW5jZS10b3JyZW50LUFkZC1wbGF0Zm9ybS1kZXBlbmRlbnQtY29tcGF0aWJsZS1zdHJpbmcKQWRk
IGEgbmV3IGNvbXBhdGlibGUgc3RyaW5nIHVzZWQgZm9yIFRJIFNvQ3MgdXNpbmcgVG9ycmVudCBQ
SFkuCjE1LiAwMTUtcGh5LWNhZGVuY2UtdG9ycmVudC1BZGQtcGxhdGZvcm0tZGVwZW5kZW50LWlu
aXRpYWxpemF0aW9uLXN0cnVjdHVyZQpBZGQgcGxhdGZvcm0gZGVwZW5kZW50IGluaXRpYWxpemF0
aW9uIGRhdGEgZm9yIFRvcnJlbnQgUEhZIHVzZWQgaW4gVEkncyBKNzIxRSBTb0MuCgoKU3dhcG5p
bCBKYWtoYWRlICg4KToKICBwaHk6IGNhZGVuY2UtdG9ycmVudDogQWRvcHQgVG9ycmVudCBub21l
bmNsYXR1cmUKICBwaHk6IGNhZGVuY2UtdG9ycmVudDogQWRkIHdyYXBwZXIgZm9yIFBIWSByZWdp
c3RlciBhY2Nlc3MKICBwaHk6IGNhZGVuY2UtdG9ycmVudDogQWRkIHdyYXBwZXIgZm9yIERQVFgg
cmVnaXN0ZXIgYWNjZXNzCiAgcGh5OiBjYWRlbmNlLXRvcnJlbnQ6IFJlZmFjdG9yIGNvZGUgZm9y
IHJldXNhYmlsaXR5CiAgcGh5OiBjYWRlbmNlLXRvcnJlbnQ6IEFkZCAxOS4yIE1IeiByZWZlcmVu
Y2UgY2xvY2sgc3VwcG9ydAogIHBoeTogY2FkZW5jZS10b3JyZW50OiBBZGQgUEhZIGxhbmUgcmVz
ZXQgc3VwcG9ydAogIHBoeTogY2FkZW5jZS10b3JyZW50OiBJbXBsZW1lbnQgUEhZIGNvbmZpZ3Vy
ZSBBUElzCiAgcGh5OiBjYWRlbmNlLXRvcnJlbnQ6IFVzZSByZWdtYXAgdG8gcmVhZCBhbmQgd3Jp
dGUgRFBUWCBQSFkgcmVnaXN0ZXJzCgpZdXRpIEFtb25rYXIgKDcpOgogIHBoeTogQWRkIERpc3Bs
YXlQb3J0IGNvbmZpZ3VyYXRpb24gb3B0aW9ucwogIGR0LWJpbmRpbmdzOnBoeTogQ29udmVydCBD
YWRlbmNlIE1IRFAgUEhZIGJpbmRpbmdzIHRvIFlBTUwuCiAgcGh5OiBjYWRlbmNlLWRwOiBSZW5h
bWUgdG8gcGh5LWNhZGVuY2UtdG9ycmVudAogIGR0LWJpbmRpbmdzOiBwaHk6IHBoeS1jYWRlbmNl
LXRvcnJlbnQ6IEFkZCBjbG9jayBiaW5kaW5ncwogIHBoeTogY2FkZW5jZS10b3JyZW50OiBVc2Ug
cmVnbWFwIHRvIHJlYWQgYW5kIHdyaXRlIFRvcnJlbnQgUEhZCiAgICByZWdpc3RlcnMKICBkdC1i
aW5kaW5nczogcGh5OiBwaHktY2FkZW5jZS10b3JyZW50OiBBZGQgcGxhdGZvcm0gZGVwZW5kZW50
CiAgICBjb21wYXRpYmxlIHN0cmluZwogIHBoeTogY2FkZW5jZS10b3JyZW50OiBBZGQgcGxhdGZv
cm0gZGVwZW5kZW50IGluaXRpYWxpemF0aW9uIHN0cnVjdHVyZQoKIC4uLi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL3BoeS9waHktY2FkZW5jZS1kcC50eHQgICAgIHwgICAzMCAtCiAuLi4vYmluZGluZ3Mv
cGh5L3BoeS1jYWRlbmNlLXRvcnJlbnQueWFtbCAgICAgICAgICB8ICAgNjYgKwogZHJpdmVycy9w
aHkvY2FkZW5jZS9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgICAgfCAgICA2ICstCiBkcml2
ZXJzL3BoeS9jYWRlbmNlL01ha2VmaWxlICAgICAgICAgICAgICAgICAgICAgICB8ICAgIDIgKy0K
IGRyaXZlcnMvcGh5L2NhZGVuY2UvcGh5LWNhZGVuY2UtZHAuYyAgICAgICAgICAgICAgIHwgIDU0
MSAtLS0tLS0KIGRyaXZlcnMvcGh5L2NhZGVuY2UvcGh5LWNhZGVuY2UtdG9ycmVudC5jICAgICAg
ICAgIHwgMTgyNCArKysrKysrKysrKysrKysrKysrKwogaW5jbHVkZS9saW51eC9waHkvcGh5LWRw
LmggICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDk1ICsKIGluY2x1ZGUvbGludXgvcGh5L3Bo
eS5oICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAgNCArCiA4IGZpbGVzIGNoYW5nZWQs
IDE5OTMgaW5zZXJ0aW9ucygrKSwgNTc1IGRlbGV0aW9ucygtKQogZGVsZXRlIG1vZGUgMTAwNjQ0
IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9waHkvcGh5LWNhZGVuY2UtZHAudHh0
CiBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Bo
eS9waHktY2FkZW5jZS10b3JyZW50LnlhbWwKIGRlbGV0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL3Bo
eS9jYWRlbmNlL3BoeS1jYWRlbmNlLWRwLmMKIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL3Bo
eS9jYWRlbmNlL3BoeS1jYWRlbmNlLXRvcnJlbnQuYwogY3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1
ZGUvbGludXgvcGh5L3BoeS1kcC5oCgotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
