Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D63807BA64
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2019 09:14:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 680396E69D;
	Wed, 31 Jul 2019 07:14:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com
 [148.163.139.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 022806E58F
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2019 15:07:00 +0000 (UTC)
Received: from pps.filterd (m0167090.ppops.net [127.0.0.1])
 by mx0b-00128a01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6UDHdG9009744; Tue, 30 Jul 2019 09:18:17 -0400
Received: from nam05-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam05lp2054.outbound.protection.outlook.com [104.47.49.54])
 by mx0b-00128a01.pphosted.com with ESMTP id 2u2hg2s452-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Jul 2019 09:18:17 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZDQ9W+ChQoSeB6QPdI7mQ8xwNdCH4A+RnmHaqdjU95CzYECq7ov8eCGxOGmdcYfFlXdlh8YGgh9V1A0ORHQvhO1+cSS8Dj9tt4Jvw0iUqCwTSvV3WDo8Nal6Q/fOb0tauGggiXymOepCRiaOLnqfCpOmlnsWPfe06rrBFOBjfXC74LcNAlMXi4iReKpmyQFAMh9tIU5EV6C363TmCDHGf33duIm31SL7AXjkyTJiMmY12Yjiv3OGZHynStxDB/W38uqVNJ4zMHoh+CIMnCpCPyqLiBVXCPXNi32lvtuUjXw6Ate4yZS47UrX7PDwC+FodnbFrZUlYqVW1nwcpds2QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3vhIBzF7o9s9IV+oDAH/51sb9qmmAMyW8WmkcvxdtTQ=;
 b=JebIo0AorH5paxdGA9AcVrfouZfGBdTWoBEUWTUeEl2RUUb1GrfkJf/N216F0wVCp8pEr/ys3xYr7/SeBrfkmE68mBRy4I2r5SJsXPeZhQ5FvLiDqVA49D0c71YfR6zISewr1QCpS2A5uG9NNHt9inYjLSToPF+1fMT7UZr8KRCZ+WNzmBo+vIaw0QSP27Rd6MNNQPQQeQeyOb69n35/DTba8mR3hLlUDW2slrsphydOnnzqQtdkloTher9peO2a39gc0Oo8oerblMBY0CR5xXxQGZJ+g85alOSIEo/hegHPbrlHwEC9aDU27MB8QdlL8KNtvK20WgoARqsofhZXZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass (sender ip is
 137.71.25.57) smtp.rcpttodomain=kernel.org
 smtp.mailfrom=analog.com;dmarc=bestguesspass action=none
 header.from=analog.com;dkim=none (message not signed);arc=none
Received: from CY4PR03CA0004.namprd03.prod.outlook.com (2603:10b6:903:33::14)
 by CY4PR03MB3141.namprd03.prod.outlook.com (2603:10b6:910:53::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2115.15; Tue, 30 Jul
 2019 13:18:14 +0000
Received: from SN1NAM02FT031.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e44::209) by CY4PR03CA0004.outlook.office365.com
 (2603:10b6:903:33::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2136.12 via Frontend
 Transport; Tue, 30 Jul 2019 13:18:13 +0000
Received-SPF: Pass (protection.outlook.com: domain of analog.com designates
 137.71.25.57 as permitted sender) receiver=protection.outlook.com;
 client-ip=137.71.25.57; helo=nwd2mta2.analog.com;
Received: from nwd2mta2.analog.com (137.71.25.57) by
 SN1NAM02FT031.mail.protection.outlook.com (10.152.72.116) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2115.10
 via Frontend Transport; Tue, 30 Jul 2019 13:18:12 +0000
Received: from NWD2HUBCAS7.ad.analog.com (nwd2hubcas7.ad.analog.com
 [10.64.69.107])
 by nwd2mta2.analog.com (8.13.8/8.13.8) with ESMTP id x6UDIA6b025852
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Tue, 30 Jul 2019 06:18:10 -0700
Received: from btogorean-pc.ad.analog.com (10.48.65.146) by
 NWD2HUBCAS7.ad.analog.com (10.64.69.107) with Microsoft SMTP Server id
 14.3.408.0; Tue, 30 Jul 2019 09:18:09 -0400
From: Bogdan Togorean <bogdan.togorean@analog.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH 0/2] drm: bridge: adv7511: Add support For ADV7535
Date: Tue, 30 Jul 2019 16:17:34 +0300
Message-ID: <20190730131736.30187-1-bogdan.togorean@analog.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-ADIRoutedOnPrem: True
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:137.71.25.57; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(2980300002)(189003)(199004)(6916009)(48376002)(7416002)(36756003)(54906003)(336012)(305945005)(50466002)(356004)(6666004)(86362001)(44832011)(486006)(126002)(2616005)(476003)(2906002)(47776003)(426003)(106002)(8936002)(246002)(8676002)(26005)(498600001)(2351001)(51416003)(1076003)(186003)(4744005)(4326008)(107886003)(50226002)(70206006)(2870700001)(70586007)(7696005)(5660300002)(7636002)(16060500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR03MB3141; H:nwd2mta2.analog.com; FPR:;
 SPF:Pass; LANG:en; PTR:nwd2mail11.analog.com; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 19383bb7-71dd-46e5-7553-08d714f05fe4
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(4709080)(1401327)(2017052603328);
 SRVR:CY4PR03MB3141; 
X-MS-TrafficTypeDiagnostic: CY4PR03MB3141:
X-Microsoft-Antispam-PRVS: <CY4PR03MB314179B8932E47F7E1ECCD089BDC0@CY4PR03MB3141.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2803;
X-Forefront-PRVS: 0114FF88F6
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: zNNra4X1jUJ1sEpOCwNGytJ60YjErlxVDDa5tYd0VGEyb1tcRPWP9U4ODzFh0Ejqjy5vDl966oNxndKJXNejtgv1Bxnuj5w1cN7pAIPWSQ4FZXK9GbvSjpdO7lwzj6ZfySAICbeB80h+aAb99ZA6NSeLohZ8bEesIgrF+KctxmQSWjG6EtpDOAJZYhxf1pqFDX7sFp8v+JvTu16kC5jei/jngQIvjYjfJ5r3000GSKLyP79dsuhS81qjq7fOp4slzo7kAYT663JsFZbChowGg30y+hNmFYpinmhk/10fHdnaWUVPvXy5n3WxXPcvipZsJ1jP2xsdolrKd5/rf+Rx9v/g/bU8M4EgxFV/xEsnNa0PvASz3+Oet9sZRFoVkGCQFRFlCjbZt29EG3yGleSuBLY1Gy76Ct9CIXwOOyQveJc=
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2019 13:18:12.4384 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 19383bb7-71dd-46e5-7553-08d714f05fe4
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=eaa689b4-8f87-40e0-9c6f-7228de4d754a; Ip=[137.71.25.57];
 Helo=[nwd2mta2.analog.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR03MB3141
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-30_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=833 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1907300141
X-Mailman-Approved-At: Wed, 31 Jul 2019 07:13:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector2-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3vhIBzF7o9s9IV+oDAH/51sb9qmmAMyW8WmkcvxdtTQ=;
 b=2UBxR4XUDBV/T9SW1m7cqzphHZ3rIvI4GYegAbNYMjpEPgdthTPJLRW1tLRghdB+/+RG16o8lkDrEOBBhEsRx2zPOgk6ef060MOP/4p6OpzIjBnjlHqa2ntQ0B32pmNRNu6sgv9BisXAnk+b7XAXUdAafUcGWXdUTJC6SCJRVRg=
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

VGhpcyBwYXRjaC1zZXQgYWRkIHN1cHBvcnQgZm9yIEFEVjc1MzUgcGFydCBpbiBBRFY3NTExIGRy
aXZlci4KCkFEVjc1MzUgYW5kIEFEVjc1MzMgYXJlIHBpbiB0byBwaW4gY29tcGF0aWJsZSBwYXJ0
cyBidXQgQURWNzUzNQpzdXBwb3J0IFRNRFMgY2xvY2sgdXB0byAxNDguNU1oeiBhbmQgcmVzb2x1
dGlvbnMgdXAgdG8gMTA4MHBANjBIei4KCkJvZ2RhbiBUb2dvcmVhbiAoMik6CiAgZHQtYmluZGlu
Z3M6IGRybTogYnJpZGdlOiBhZHY3NTExOiBBZGQgQURWNzUzNSBzdXBwb3J0CiAgZHJtOiBicmlk
Z2U6IGFkdjc1MTE6IEFkZCBzdXBwb3J0IGZvciBBRFY3NTM1CgogLi4uL2JpbmRpbmdzL2Rpc3Bs
YXkvYnJpZGdlL2FkaSxhZHY3NTExLnR4dCAgIHwgMjMgKysrKysrKy0tLS0tLS0KIGRyaXZlcnMv
Z3B1L2RybS9icmlkZ2UvYWR2NzUxMS9hZHY3NTExLmggICAgICB8ICAyICsrCiBkcml2ZXJzL2dw
dS9kcm0vYnJpZGdlL2Fkdjc1MTEvYWR2NzUxMV9kcnYuYyAgfCAzMSArKysrKysrKysrKysrKy0t
LS0tCiAzIGZpbGVzIGNoYW5nZWQsIDM3IGluc2VydGlvbnMoKyksIDE5IGRlbGV0aW9ucygtKQoK
LS0gCjIuMjIuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
