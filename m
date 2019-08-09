Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A605088BAE
	for <lists+dri-devel@lfdr.de>; Sat, 10 Aug 2019 15:55:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3E796E42E;
	Sat, 10 Aug 2019 13:55:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com
 [148.163.135.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 929EB6EE0F
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Aug 2019 14:17:21 +0000 (UTC)
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
 by mx0a-00128a01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x79ED5KD017845; Fri, 9 Aug 2019 10:17:01 -0400
Received: from nam02-bl2-obe.outbound.protection.outlook.com
 (mail-bl2nam02lp2056.outbound.protection.outlook.com [104.47.38.56])
 by mx0a-00128a01.pphosted.com with ESMTP id 2u8tcbtjsj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Aug 2019 10:17:01 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lAYvGUlizQ6guoQIIOtt2lEkXbjkeKxuyeNCs6PDFNqRNJa9CV4y0Gbvkrfi9D+7vGdF0d9NhNO7XMEoz75qF9k2hSqsSDjgsflb0ngV0lnqCxKtMUO+WQB7zJjWlutHPaq2hEBg5vlypjCt8Wi7eeW66z/+jrJ6JanJXOprV3U7iDxIDiUQlg7Z9XgFV445wKxstE7SJ0f73AILnJ0YrcOKcgCrmKJahlbFieLgoVTd8uWXjoaxU6Twci5vB5RQeGBBXrCYAcQ4+PguMuDviTuF2BTPGbE2kGcFHVTtmJd5lDOzjlNzw0+3b1+GijHnL8G6ey9jarNMF5u0EkBD0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GTikt94DOwGNyKIkGfwLkusYctVkgrR20Al+wPLMfbQ=;
 b=WcWWKgbkFSBBazPCqMGCgvjmO+mBf5NyI2ilEGdMWkCreoiRcthIpL386zQoQgvTGSUAnJrOaudgdOyL1058shTi8nrBYN8OBK4pevoVPnyj9kCcyI2nX3lZKST+phUedf2isWegIT0gpVgj0w+nifhQzWC3OF1kOyeKLZsk4Z9KzQeQ7mn+S9WTh6YPG6JBVP0FVVTqdHXKVgaPvJNxSURnxqTEBF9ON2+ea28YGjBy0RGzmagMaPmnUyF7z229Z0mvJ3zPmG7nbFGH+DY+ziUhVNOK9Ly+3+A5KGSPWYAsUfJUGi0HW66RsCPvRXLwWlLHwVVRStl3JaDDNlCeMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass (sender ip is
 137.71.25.57) smtp.rcpttodomain=kernel.org
 smtp.mailfrom=analog.com;dmarc=bestguesspass action=none
 header.from=analog.com;dkim=none (message not signed);arc=none
Received: from DM6PR03CA0018.namprd03.prod.outlook.com (2603:10b6:5:40::31) by
 BYAPR03MB3557.namprd03.prod.outlook.com (2603:10b6:a02:aa::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.20; Fri, 9 Aug 2019 14:16:58 +0000
Received: from SN1NAM02FT018.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e44::205) by DM6PR03CA0018.outlook.office365.com
 (2603:10b6:5:40::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2157.13 via Frontend
 Transport; Fri, 9 Aug 2019 14:16:58 +0000
Received-SPF: Pass (protection.outlook.com: domain of analog.com designates
 137.71.25.57 as permitted sender) receiver=protection.outlook.com;
 client-ip=137.71.25.57; helo=nwd2mta2.analog.com;
Received: from nwd2mta2.analog.com (137.71.25.57) by
 SN1NAM02FT018.mail.protection.outlook.com (10.152.72.122) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2157.15
 via Frontend Transport; Fri, 9 Aug 2019 14:16:57 +0000
Received: from NWD2HUBCAS7.ad.analog.com (nwd2hubcas7.ad.analog.com
 [10.64.69.107])
 by nwd2mta2.analog.com (8.13.8/8.13.8) with ESMTP id x79EGuvf005126
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Fri, 9 Aug 2019 07:16:56 -0700
Received: from btogorean-pc.ad.analog.com (10.48.65.146) by
 NWD2HUBCAS7.ad.analog.com (10.64.69.107) with Microsoft SMTP Server id
 14.3.408.0; Fri, 9 Aug 2019 10:16:56 -0400
From: Bogdan Togorean <bogdan.togorean@analog.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 0/2] drm: bridge: adv7511: Add support For ADV7535
Date: Fri, 9 Aug 2019 17:16:09 +0300
Message-ID: <20190809141611.9927-1-bogdan.togorean@analog.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-ADIRoutedOnPrem: True
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:137.71.25.57; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(346002)(396003)(39850400004)(376002)(136003)(2980300002)(189003)(199004)(8676002)(7696005)(4744005)(1076003)(47776003)(51416003)(2906002)(305945005)(7636002)(5660300002)(86362001)(246002)(54906003)(36756003)(14444005)(356004)(6666004)(316002)(70206006)(70586007)(7416002)(6916009)(106002)(2351001)(126002)(336012)(186003)(107886003)(478600001)(2616005)(2870700001)(50226002)(476003)(50466002)(48376002)(426003)(26005)(8936002)(486006)(44832011)(4326008)(16060500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR03MB3557; H:nwd2mta2.analog.com; FPR:;
 SPF:Pass; LANG:en; PTR:nwd2mail11.analog.com; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a4574784-9f6b-48c1-fdf9-08d71cd43d5a
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(4709080)(1401327)(2017052603328);
 SRVR:BYAPR03MB3557; 
X-MS-TrafficTypeDiagnostic: BYAPR03MB3557:
X-Microsoft-Antispam-PRVS: <BYAPR03MB35571ECC4DC8E71DD8E4A4BE9BD60@BYAPR03MB3557.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-Forefront-PRVS: 01244308DF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 3OIBxzlKtv/mHgzVFI96i4PeSOb3oUEjML60L8V4mgDQCgd3PcC8VkkDbTQ4+bm2+BGuEX8jp8h4wz8VBCDastQmebA2e3H4XajN6xO8X4ygUtS+6TzoM4TRakw5glL3q61ItNiTknR+s9Koq2uahKdZynW0JLDQzZjm5PYLniyR8jBvjT8S+J0umj/eGhg/7tmRXHijPlOadI52D6Qb+baP7JMwe6EzIzdjXVF3zGVB7RVXOyuJIiUWXHlZmW8/baAgwYocwWNm2Aewb8BCAEdFRAw3G2rd/J/zJp42o8D5P4ZkToFk41cc5oX+GKahnLmN6IKYEH2lqB93YymqDX5Wm1HnHZopEfW/mmTOkkk5zBbxsgqwpWFUpH4gpmz+fR4qKVDxjjf9954Qd3X15vhT6PpE+J9Lq2bzAvLBSDc=
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2019 14:16:57.8628 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a4574784-9f6b-48c1-fdf9-08d71cd43d5a
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=eaa689b4-8f87-40e0-9c6f-7228de4d754a; Ip=[137.71.25.57];
 Helo=[nwd2mta2.analog.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3557
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-09_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=994 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908090145
X-Mailman-Approved-At: Sat, 10 Aug 2019 13:55:12 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector2-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GTikt94DOwGNyKIkGfwLkusYctVkgrR20Al+wPLMfbQ=;
 b=aG5h9JIHP7B62/FEDPQGs0W81jKAo3RTdFZgvcTBK+rzVv1Ol26wpiu/lDxbuVhqqJlkDw46A+FT7jn2ebc4pwgG0q9tAC57tn5UjhMiV94SJq2CSnQUzgYktqMS4uDBgkVCTyv7q6wr/9YFzMF7Wu29DY8fmJVB8+cVmlklbMA=
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
dGlvbnMgdXAgdG8gMTA4MHBANjBIei4KCi0tLQpDaGFuZ2VzIGluIHYyOgogLSByZW5hbWUgQ09O
RklHX0RSTV9JMkNfQURWNzUzMyB0byBDT05GSUdfRFJNX0kyQ19BRFY3NTNYIGFuZCAKdXBkYXRl
IGRlY3JpcHRpb24KIC0gcmVtb3ZlZCAidjFwMiIgaW5kZXggc2VhcmNoIGFuZCBoYXJkY29kZWQg
aXQKCkJvZ2RhbiBUb2dvcmVhbiAoMik6CiAgZHQtYmluZGluZ3M6IGRybTogYnJpZGdlOiBhZHY3
NTExOiBBZGQgQURWNzUzNSBzdXBwb3J0CiAgZHJtOiBicmlkZ2U6IGFkdjc1MTE6IEFkZCBzdXBw
b3J0IGZvciBBRFY3NTM1CgogLi4uL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL2FkaSxhZHY3NTEx
LnR4dCAgIHwgMjMgKysrKysrKy0tLS0tLQogZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hZHY3NTEx
L0tjb25maWcgICAgICAgIHwgIDggKystLS0KIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYWR2NzUx
MS9NYWtlZmlsZSAgICAgICB8ICAyICstCiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2Fkdjc1MTEv
YWR2NzUxMS5oICAgICAgfCAgNCArKy0KIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYWR2NzUxMS9h
ZHY3NTExX2Rydi5jICB8IDM0ICsrKysrKysrKysrKystLS0tLS0KIDUgZmlsZXMgY2hhbmdlZCwg
NDQgaW5zZXJ0aW9ucygrKSwgMjcgZGVsZXRpb25zKC0pCgotLSAKMi4yMi4wCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
