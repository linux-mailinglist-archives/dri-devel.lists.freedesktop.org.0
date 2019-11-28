Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 59E9C10DDB2
	for <lists+dri-devel@lfdr.de>; Sat, 30 Nov 2019 14:24:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E22836E103;
	Sat, 30 Nov 2019 13:24:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com
 [148.163.139.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DD836E851
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Nov 2019 16:02:41 +0000 (UTC)
Received: from pps.filterd (m0167090.ppops.net [127.0.0.1])
 by mx0b-00128a01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xASFwZug026777; Thu, 28 Nov 2019 11:02:04 -0500
Received: from nam03-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam03lp2054.outbound.protection.outlook.com [104.47.41.54])
 by mx0b-00128a01.pphosted.com with ESMTP id 2whuvq36p5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 Nov 2019 11:02:04 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WNb5UEJQlhugYZoo0Dwlyi9aXbxd3/qUydDqscnNSntvqHJ7V7hsJQ/WKYZCTONNjD71DMXUNZpOdEnjT7tgAPCCMqQfYSkY2QI6apR6AwypnHUNBsb4iNAU+jumVsCcYwcOsPy/+5qdeC5+CWaH5CCKwUhMjWGk1K/093ERNri8o/SYzEQ8EN7Zx5dnrrHoumx2hD90GUSWMI3xPEZBwjYMgB5BSDoAkEWZLbt4jnMO9C8PtkIBrbNoRhxmFghU2zgVCG1wn/Y6Tp1BPOLchWOJd89OFK0bgmHEk21V+uCBSBbTFSK+d8z/9RROTUbluz6m32/XbqWRt/2JTrJoUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PXONAl8khotmNpxZIDY9Jtj9dWE9GvxOwxoDyUMVbHw=;
 b=MiksocdMgVy9u3L03pfRLHOu7gck1mqqJVJwuu22b1GlBfknCq2cgqMAX1UWXZKCmDnTb063vadOeSTVdKIEgq1GGrxlvjRYswebBFK59ygz9dVXU9he0vNnsJi0FutEZ8qCPuF3Zu67+kXqzHUQ9XIsgZHld7NPX0CVrmjF8RgKSqToE7n0W1dQUtarKb1ZqVNqeyHlD2zIGGKUNKhfTPP1Rfqc0b2UfYmvgXLJHHJ9jElfN4cZPNvnJoqAiGU/IhVv5uU/FCCgVDjDd6XbYpOczEsZeTqkPMaQllCsTu+zO2Qbo9Xq6fVA2ZCVJqKqa4cPzBxSS/VhYdt00f1hxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 137.71.25.57) smtp.rcpttodomain=baylibre.com smtp.mailfrom=analog.com;
 dmarc=bestguesspass action=none header.from=analog.com; dkim=none (message
 not signed); arc=none
Received: from BYAPR03CA0020.namprd03.prod.outlook.com (2603:10b6:a02:a8::33)
 by MN2PR03MB5232.namprd03.prod.outlook.com (2603:10b6:208:1e5::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2495.20; Thu, 28 Nov
 2019 16:02:02 +0000
Received: from BL2NAM02FT021.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e46::209) by BYAPR03CA0020.outlook.office365.com
 (2603:10b6:a02:a8::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2495.18 via Frontend
 Transport; Thu, 28 Nov 2019 16:02:02 +0000
Received-SPF: Pass (protection.outlook.com: domain of analog.com designates
 137.71.25.57 as permitted sender) receiver=protection.outlook.com;
 client-ip=137.71.25.57; helo=nwd2mta2.analog.com;
Received: from nwd2mta2.analog.com (137.71.25.57) by
 BL2NAM02FT021.mail.protection.outlook.com (10.152.77.158) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2474.17
 via Frontend Transport; Thu, 28 Nov 2019 16:02:02 +0000
Received: from NWD2HUBCAS7.ad.analog.com (nwd2hubcas7.ad.analog.com
 [10.64.69.107])
 by nwd2mta2.analog.com (8.13.8/8.13.8) with ESMTP id xASG1ol2004457
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Thu, 28 Nov 2019 08:01:51 -0800
Received: from btogorean-pc.ad.analog.com (10.48.65.146) by
 NWD2HUBCAS7.ad.analog.com (10.64.69.107) with Microsoft SMTP Server id
 14.3.408.0; Thu, 28 Nov 2019 11:01:57 -0500
From: Bogdan Togorean <bogdan.togorean@analog.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v3 0/2] drm: bridge: adv7511: Add support For ADV7535
Date: Thu, 28 Nov 2019 20:00:17 +0200
Message-ID: <20191128180018.12073-1-bogdan.togorean@analog.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-ADIRoutedOnPrem: True
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:137.71.25.57; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(396003)(136003)(346002)(376002)(39860400002)(189003)(199004)(8936002)(44832011)(186003)(6666004)(7636002)(2351001)(106002)(4744005)(86362001)(2870700001)(107886003)(356004)(54906003)(8676002)(305945005)(50466002)(316002)(47776003)(26005)(50226002)(70206006)(246002)(70586007)(2906002)(7416002)(5660300002)(4326008)(6916009)(36756003)(336012)(426003)(7696005)(2616005)(1076003)(48376002)(478600001)(51416003)(16060500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR03MB5232; H:nwd2mta2.analog.com; FPR:;
 SPF:Pass; LANG:en; PTR:nwd2mail11.analog.com; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f463fd5c-ecd2-4ad1-ce26-08d7741c4e98
X-MS-TrafficTypeDiagnostic: MN2PR03MB5232:
X-Microsoft-Antispam-PRVS: <MN2PR03MB5232B601996C94195F302BB49B470@MN2PR03MB5232.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-Forefront-PRVS: 0235CBE7D0
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bwdVYN6gDbz8/38h807ztExhIqE7xq8dBngmwFpzvZ3LjnAZzrSjb0eoJ5n+hnNG6f1IeFlQQAV6JJQ4TSdP17c//hBDplQBmvYvaNNXe9yMmjcPYgf5jvDhsIRDacMg+0nOe5MthIiiE4zuJQ9a/W9kioW6TnHHDMFtAG0sZjp5ugJewwtKTp1iPHsAIA7vQILl+NjTJtA8doHx3Geux8/Yx5JS11peEhy/0+H+22PtAVphlHCoDuKVLgSlzhbZOp7czA2gA9ZBEUgQFELVhKA9fnJyYtVv+cJ2xIhkpT48mGQpO1VycJW9eLaxcRxsEJ8qHHdUdKsSmZGjtTI1fFVV32nJ/0XrYeGgKCA6Qt80QQVba2b3Jzo8Rfqkim/4mdcZeKq6hbtXObYdx4LVx1kBg/GfR6ZiSFAHjWos/mZykmfSg1WvvecU4WlHvJ4f
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2019 16:02:02.2007 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f463fd5c-ecd2-4ad1-ce26-08d7741c4e98
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=eaa689b4-8f87-40e0-9c6f-7228de4d754a; Ip=[137.71.25.57];
 Helo=[nwd2mta2.analog.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5232
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-28_04:2019-11-28,2019-11-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1011
 impostorscore=0 mlxscore=0 suspectscore=1 mlxlogscore=807 bulkscore=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1911280134
X-Mailman-Approved-At: Sat, 30 Nov 2019 13:23:59 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector2-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PXONAl8khotmNpxZIDY9Jtj9dWE9GvxOwxoDyUMVbHw=;
 b=Ag8+VU/5rPHt4gf1bkJUmJvASx4xVkUxuQ1C3eieD+TmTV+CTDRnOk2ImUnpRjoTejq8HmTntrE4aeGg/vV5FUIqsJYt6tG08dy0rrZSRYIoVTNGt/N0Raa9PCsL4eHVGxedLNPTpstL31pOQQlpP+eJeoSyLC4ShzjIzspfpcE=
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
Cc: mark.rutland@arm.com, robdclark@chromium.org, jernej.skrabec@siol.net,
 narmstrong@baylibre.com, airlied@linux.ie, gregkh@linuxfoundation.org,
 jonas@kwiboo.se, wsa+renesas@sang-engineering.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 Laurent.pinchart@ideasonboard.com, alexander.deucher@amd.com,
 tglx@linutronix.de, sam@ravnborg.org, matt.redfearn@thinci.com,
 Bogdan Togorean <bogdan.togorean@analog.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBwYXRjaC1zZXQgYWRkIHN1cHBvcnQgZm9yIEFEVjc1MzUgcGFydCBpbiBBRFY3NTExIGRy
aXZlci4KCkFEVjc1MzUgYW5kIEFEVjc1MzMgYXJlIHBpbiB0byBwaW4gY29tcGF0aWJsZSBwYXJ0
cyBidXQgQURWNzUzNQpzdXBwb3J0IFRNRFMgY2xvY2sgdXB0byAxNDguNU1oeiBhbmQgcmVzb2x1
dGlvbnMgdXAgdG8gMTA4MHBANjBIei4KCi0tLQpDaGFuZ2VzIGluIHYzOgogLSByZW1vdmUgQ09O
RklHX0RSTV9JMkNfQURWNzUzMyBmcm9tIEtjb25maWcuIE5vdyBkcml2ZXIgc3VwcG9ydAphbGwg
Y2hpcCB2ZXJzaW9ucwogLSBjcmVhdGUgbWFjcm9zIGZvciB2MXAyIGNvbmZpZyByZWdpc3RlcnMK
IC0gcmVtb3ZlIGR1bW15IGZ1bmN0aW9ucyBmcm9tIGhlYWRlcgoKQm9nZGFuIFRvZ29yZWFuICgy
KToKICBkdC1iaW5kaW5nczogZHJtOiBicmlkZ2U6IGFkdjc1MTE6IEFkZCBBRFY3NTM1IHN1cHBv
cnQKICBkcm06IGJyaWRnZTogYWR2NzUxMTogQWRkIHN1cHBvcnQgZm9yIEFEVjc1MzUKCiAuLi4v
YmluZGluZ3MvZGlzcGxheS9icmlkZ2UvYWRpLGFkdjc1MTEudHh0ICAgfCAyMyArKysrKy0tLS0t
CiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2Fkdjc1MTEvS2NvbmZpZyAgICAgICAgfCAxMyArKy0t
LS0KIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYWR2NzUxMS9NYWtlZmlsZSAgICAgICB8ICAzICst
CiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2Fkdjc1MTEvYWR2NzUxMS5oICAgICAgfCA0NCArKyst
LS0tLS0tLS0tLS0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2Fkdjc1MTEvYWR2NzUxMV9k
cnYuYyAgfCAzNSArKysrKysrKysrLS0tLS0KIDUgZmlsZXMgY2hhbmdlZCwgNDQgaW5zZXJ0aW9u
cygrKSwgNzQgZGVsZXRpb25zKC0pCgotLSAKMi4yMy4wCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
