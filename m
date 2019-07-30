Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F2A17BA70
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2019 09:14:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA5FC6E69B;
	Wed, 31 Jul 2019 07:14:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 3916 seconds by postgrey-1.36 at gabe;
 Tue, 30 Jul 2019 15:07:39 UTC
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com
 [148.163.135.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42F216E58F
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2019 15:07:39 +0000 (UTC)
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
 by mx0a-00128a01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6UDHhbi016649; Tue, 30 Jul 2019 09:18:19 -0400
Received: from nam02-cy1-obe.outbound.protection.outlook.com
 (mail-cys01nam02lp2050.outbound.protection.outlook.com [104.47.37.50])
 by mx0a-00128a01.pphosted.com with ESMTP id 2u1nh6wjaw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Tue, 30 Jul 2019 09:18:19 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kVs7w70WrD+xVECEpqRjqUPySL+PABYmSLSwxucVBEjUt5kQRnN+rCpxjs7NdFs+vUrfXFOaKXLFI1BsgMjIzZZumbJqpKDdrufl4yc+Lc7SiE1vLK8vqIMuIGouXDjY2kb7PqnS+A0UjtBVryl0VrEWZVc4MhEXAXjQlk5Kw5CdKapurjaWCXd6b0yFjQkiQo6Werq7MgCeSlXFzQ1gp0VFj2hHqqyO+/3nzt8D5cHFCjXlr87cyYVuy8buP9D7/4y/3tNEXWvokOJrInFf7UFUniTEN+ICtvVXyEQKHossPDYqoDbNLtp0Ii9Zk5ba7xOemampnlrnTXCqDm9UYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hk5MOBPzXtAPzDjxEajfGt+rT/TxLRzdbikgJ1pAAr0=;
 b=BPjECdaT9VoDZA9Mob3Ul1hBFma2uOLkUMI7IkQUOHSg+4jqJnCoPAv0fWM0X8qGKxHjVy8TkYQS080cSThur3nfihPxLO/rfTkc9Q6V9W/ixQ6GlOKCsMH36cBmJuWq+LLRN/qbjSxaJpXpiNaDPntYYRUNfKVlm+Xw7ob19oI03v8qSZ9JYl0zDlfRmI5AfA6pyso1LPuf0t1iDyqJb24ZBgiKLjl4XAXkXp/zjk0NBcyB1ehTWHKxRfL6yRTucW3c4ft4ukoV2zhTmf0wPcAfkLFC4PsVS2ELVUcPVrGAAm6R7nB9R0Kvc/Z1h586bCUig6lf99WsqO+onKA8hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass (sender ip is
 137.71.25.57) smtp.rcpttodomain=kernel.org
 smtp.mailfrom=analog.com;dmarc=bestguesspass action=none
 header.from=analog.com;dkim=none (message not signed);arc=none
Received: from CY4PR03CA0077.namprd03.prod.outlook.com (2603:10b6:910:4d::18)
 by DM5PR03MB2795.namprd03.prod.outlook.com (2603:10b6:3:44::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2115.13; Tue, 30 Jul
 2019 13:18:17 +0000
Received: from BL2NAM02FT041.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e46::205) by CY4PR03CA0077.outlook.office365.com
 (2603:10b6:910:4d::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2115.10 via Frontend
 Transport; Tue, 30 Jul 2019 13:18:17 +0000
Received-SPF: Pass (protection.outlook.com: domain of analog.com designates
 137.71.25.57 as permitted sender) receiver=protection.outlook.com;
 client-ip=137.71.25.57; helo=nwd2mta2.analog.com;
Received: from nwd2mta2.analog.com (137.71.25.57) by
 BL2NAM02FT041.mail.protection.outlook.com (10.152.77.122) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2115.10
 via Frontend Transport; Tue, 30 Jul 2019 13:18:17 +0000
Received: from NWD2HUBCAS7.ad.analog.com (nwd2hubcas7.ad.analog.com
 [10.64.69.107])
 by nwd2mta2.analog.com (8.13.8/8.13.8) with ESMTP id x6UDIH75025903
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Tue, 30 Jul 2019 06:18:17 -0700
Received: from btogorean-pc.ad.analog.com (10.48.65.146) by
 NWD2HUBCAS7.ad.analog.com (10.64.69.107) with Microsoft SMTP Server id
 14.3.408.0; Tue, 30 Jul 2019 09:18:16 -0400
From: Bogdan Togorean <bogdan.togorean@analog.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH 1/2] dt-bindings: drm: bridge: adv7511: Add ADV7535 support
Date: Tue, 30 Jul 2019 16:17:35 +0300
Message-ID: <20190730131736.30187-2-bogdan.togorean@analog.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190730131736.30187-1-bogdan.togorean@analog.com>
References: <20190730131736.30187-1-bogdan.togorean@analog.com>
MIME-Version: 1.0
X-ADIRoutedOnPrem: True
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:137.71.25.57; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(346002)(396003)(39860400002)(376002)(136003)(2980300002)(199004)(189003)(6916009)(36756003)(426003)(126002)(5660300002)(6666004)(51416003)(356004)(76176011)(11346002)(2616005)(86362001)(486006)(44832011)(7696005)(1076003)(7636002)(106002)(54906003)(476003)(26005)(186003)(316002)(305945005)(478600001)(70206006)(336012)(70586007)(8676002)(47776003)(8936002)(50226002)(246002)(2351001)(446003)(7416002)(107886003)(2870700001)(2906002)(50466002)(4326008)(48376002)(16060500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR03MB2795; H:nwd2mta2.analog.com; FPR:;
 SPF:Pass; LANG:en; PTR:nwd2mail11.analog.com; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 16e48b2e-a3c5-4ff6-abef-08d714f06283
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(4709080)(1401327)(2017052603328);
 SRVR:DM5PR03MB2795; 
X-MS-TrafficTypeDiagnostic: DM5PR03MB2795:
X-Microsoft-Antispam-PRVS: <DM5PR03MB279511AFCA9C3BA977EC71D19BDC0@DM5PR03MB2795.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-Forefront-PRVS: 0114FF88F6
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: ELm4YxijhGpdeYXtcAzH/EnMR6ivbMtXIsuM9f0JOUCITHSCWpjZmtvRXDqXzVpkpzDyc93n6Tzvm+AwifQLA6j1ZRd9SSQ8OzCd+Z/u9rQukdDIdCWiHAXFwOCxRb3Fp8K52edr/Uvf+ixnXqje/zllKJhCrUAaYKx9wfGEVG63OawAWQWMtzW5O1rBs+xJeFVeD+yizA7lxZjbmAGYU74Vsr3cnbqBwaYdJR+NiLICK2TlYcQqnekouBbjNDlOnfGpot5eYwci/zZSRkAx59LkzQ3bXpMIUmEY5B32YRnkdQeRm89g5vVJEgjQEn3IUKdvRDXd296Z069ermVWFccJlJYpokhH2T5+O71P3h9g0GjN6Z3Nk33mxcAgVdVlyt59dMdafEjExaAitXqBlsIa03U+wOhl6lThTWHDuTY=
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2019 13:18:17.2716 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 16e48b2e-a3c5-4ff6-abef-08d714f06283
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=eaa689b4-8f87-40e0-9c6f-7228de4d754a; Ip=[137.71.25.57];
 Helo=[nwd2mta2.analog.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2795
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-30_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1907300141
X-Mailman-Approved-At: Wed, 31 Jul 2019 07:13:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector2-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hk5MOBPzXtAPzDjxEajfGt+rT/TxLRzdbikgJ1pAAr0=;
 b=OxTozV6ZViBWD/c3Y2mCPTr8xVnZhySdncnKqUPsmj2bMQP5O1R+zCzPvdtgqLiMHKig9B3QqVprOk4ltXJ0+z3horZkDgzRbI6NvDQVTKGtmsFwouYyAKcz2wdyZKq99Ok5qYpMvWdJLvT4GikaVMhtSK3WrrmwMtNqmWY6Agk=
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

QURWNzUzNSBpcyBhIHBhcnQgY29tcGF0aWJsZSB3aXRoIEFEVjc1MzMgYnV0IGl0IHN1cHBvcnRz
IDEwODBwQDYwaHogYW5kCnYxcDIgc3VwcGx5IGlzIGZpeGVkIHRvIDEuOFYKClNpZ25lZC1vZmYt
Ynk6IEJvZ2RhbiBUb2dvcmVhbiA8Ym9nZGFuLnRvZ29yZWFuQGFuYWxvZy5jb20+Ci0tLQogLi4u
L2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL2FkaSxhZHY3NTExLnR4dCAgIHwgMjMgKysrKysrKysr
Ky0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNw
bGF5L2JyaWRnZS9hZGksYWR2NzUxMS50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvZGlzcGxheS9icmlkZ2UvYWRpLGFkdjc1MTEudHh0CmluZGV4IDJjODg3NTM2MjU4Yy4u
ZThkZGVjNWQ5ZDkxIDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvZGlzcGxheS9icmlkZ2UvYWRpLGFkdjc1MTEudHh0CisrKyBiL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9hZGksYWR2NzUxMS50eHQKQEAgLTEsMTAg
KzEsMTAgQEAKLUFuYWxvZyBEZXZpY2UgQURWNzUxMShXKS8xMy8zMyBIRE1JIEVuY29kZXJzCitB
bmFsb2cgRGV2aWNlIEFEVjc1MTEoVykvMTMvMzMvMzUgSERNSSBFbmNvZGVycwogLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KIAotVGhlIEFEVjc1MTEsIEFEVjc1MTFX
LCBBRFY3NTEzIGFuZCBBRFY3NTMzIGFyZSBIRE1JIGF1ZGlvIGFuZCB2aWRlbyB0cmFuc21pdHRl
cnMKLWNvbXBhdGlibGUgd2l0aCBIRE1JIDEuNCBhbmQgRFZJIDEuMC4gVGhleSBzdXBwb3J0IGNv
bG9yIHNwYWNlIGNvbnZlcnNpb24sCi1TL1BESUYsIENFQyBhbmQgSERDUC4gQURWNzUzMyBzdXBw
b3J0cyB0aGUgRFNJIGludGVyZmFjZSBmb3IgaW5wdXQgcGl4ZWxzLCB3aGlsZQotdGhlIG90aGVy
cyBzdXBwb3J0IFJHQiBpbnRlcmZhY2UuCitUaGUgQURWNzUxMSwgQURWNzUxMVcsIEFEVjc1MTMs
IEFEVjc1MzMgYW5kIEFEVjc1MzUgYXJlIEhETUkgYXVkaW8gYW5kIHZpZGVvCit0cmFuc21pdHRl
cnMgY29tcGF0aWJsZSB3aXRoIEhETUkgMS40IGFuZCBEVkkgMS4wLiBUaGV5IHN1cHBvcnQgY29s
b3Igc3BhY2UKK2NvbnZlcnNpb24sIFMvUERJRiwgQ0VDIGFuZCBIRENQLiBBRFY3NTMzLzUgc3Vw
cG9ydHMgdGhlIERTSSBpbnRlcmZhY2UgZm9yIGlucHV0CitwaXhlbHMsIHdoaWxlIHRoZSBvdGhl
cnMgc3VwcG9ydCBSR0IgaW50ZXJmYWNlLgogCiBSZXF1aXJlZCBwcm9wZXJ0aWVzOgogCkBAIC0x
Myw2ICsxMyw3IEBAIFJlcXVpcmVkIHByb3BlcnRpZXM6CiAJCSJhZGksYWR2NzUxMXciCiAJCSJh
ZGksYWR2NzUxMyIKIAkJImFkaSxhZHY3NTMzIgorCQkiYWRpLGFkdjc1MzUiCiAKIC0gcmVnOiBJ
MkMgc2xhdmUgYWRkcmVzc2VzCiAgIFRoZSBBRFY3NTExIGludGVybmFsIHJlZ2lzdGVycyBhcmUg
c3BsaXQgaW50byBmb3VyIHBhZ2VzIGV4cG9zZWQgdGhyb3VnaApAQCAtNTIsMTQgKzUzLDE0IEBA
IFRoZSBmb2xsb3dpbmcgaW5wdXQgZm9ybWF0IHByb3BlcnRpZXMgYXJlIHJlcXVpcmVkIGV4Y2Vw
dCBpbiAicmdiIDF4IiBhbmQKIC0gYmd2ZGQtc3VwcGx5OiBBIDEuOFYgc3VwcGx5IHRoYXQgcG93
ZXJzIHVwIHRoZSBCR1ZERCBwaW4uIFRoaXMgaXMKICAgbmVlZGVkIG9ubHkgZm9yIEFEVjc1MTEu
CiAKLVRoZSBmb2xsb3dpbmcgcHJvcGVydGllcyBhcmUgcmVxdWlyZWQgZm9yIEFEVjc1MzM6CitU
aGUgZm9sbG93aW5nIHByb3BlcnRpZXMgYXJlIHJlcXVpcmVkIGZvciBBRFY3NTMzIGFuZCBBRFY3
NTM1OgogCiAtIGFkaSxkc2ktbGFuZXM6IE51bWJlciBvZiBEU0kgZGF0YSBsYW5lcyBjb25uZWN0
ZWQgdG8gdGhlIERTSSBob3N0LiBJdCBzaG91bGQKICAgYmUgb25lIG9mIDEsIDIsIDMgb3IgNC4K
IC0gYTJ2ZGQtc3VwcGx5OiAxLjhWIHN1cHBseSB0aGF0IHBvd2VycyB1cCB0aGUgQTJWREQgcGlu
IG9uIHRoZSBjaGlwLgogLSB2M3AzLXN1cHBseTogQSAzLjNWIHN1cHBseSB0aGF0IHBvd2VycyB1
cCB0aGUgVjNQMyBwaW4gb24gdGhlIGNoaXAuCiAtIHYxcDItc3VwcGx5OiBBIHN1cHBseSB0aGF0
IHBvd2VycyB1cCB0aGUgVjFQMiBwaW4gb24gdGhlIGNoaXAuIEl0IGNhbiBiZQotICBlaXRoZXIg
MS4yViBvciAxLjhWLgorICBlaXRoZXIgMS4yViBvciAxLjhWIGZvciBBRFY3NTMzIGJ1dCBvbmx5
IDEuOFYgZm9yIEFEVjc1MzUuCiAKIE9wdGlvbmFsIHByb3BlcnRpZXM6CiAKQEAgLTcxLDkgKzcy
LDkgQEAgT3B0aW9uYWwgcHJvcGVydGllczoKIC0gYWRpLGVtYmVkZGVkLXN5bmM6IFRoZSBpbnB1
dCB1c2VzIHN5bmNocm9uaXphdGlvbiBzaWduYWxzIGVtYmVkZGVkIGluIHRoZQogICBkYXRhIHN0
cmVhbSAoc2ltaWxhciB0byBCVC42NTYpLiBEZWZhdWx0cyB0byBzZXBhcmF0ZSBIL1Ygc3luY2hy
b25pemF0aW9uCiAgIHNpZ25hbHMuCi0tIGFkaSxkaXNhYmxlLXRpbWluZy1nZW5lcmF0b3I6IE9u
bHkgZm9yIEFEVjc1MzMuIERpc2FibGVzIHRoZSBpbnRlcm5hbCB0aW1pbmcKLSAgZ2VuZXJhdG9y
LiBUaGUgY2hpcCB3aWxsIHJlbHkgb24gdGhlIHN5bmMgc2lnbmFscyBpbiB0aGUgRFNJIGRhdGEg
bGFuZXMsCi0gIHJhdGhlciB0aGFuIGdlbmVyYXRlIGl0cyBvd24gdGltaW5ncyBmb3IgSERNSSBv
dXRwdXQuCistIGFkaSxkaXNhYmxlLXRpbWluZy1nZW5lcmF0b3I6IE9ubHkgZm9yIEFEVjc1MzMg
YW5kIEFEVjc1MzUuIERpc2FibGVzIHRoZQorICBpbnRlcm5hbCB0aW1pbmcgZ2VuZXJhdG9yLiBU
aGUgY2hpcCB3aWxsIHJlbHkgb24gdGhlIHN5bmMgc2lnbmFscyBpbiB0aGUKKyAgRFNJIGRhdGEg
bGFuZXMsIHJhdGhlciB0aGFuIGdlbmVyYXRlIGl0cyBvd24gdGltaW5ncyBmb3IgSERNSSBvdXRw
dXQuCiAtIGNsb2NrczogZnJvbSBjb21tb24gY2xvY2sgYmluZGluZzogcmVmZXJlbmNlIHRvIHRo
ZSBDRUMgY2xvY2suCiAtIGNsb2NrLW5hbWVzOiBmcm9tIGNvbW1vbiBjbG9jayBiaW5kaW5nOiBt
dXN0IGJlICJjZWMiLgogLSByZWctbmFtZXMgOiBOYW1lcyBvZiBtYXBzIHdpdGggcHJvZ3JhbW1h
YmxlIGFkZHJlc3Nlcy4KQEAgLTg1LDcgKzg2LDcgQEAgUmVxdWlyZWQgbm9kZXM6CiBUaGUgQURW
NzUxMSBoYXMgdHdvIHZpZGVvIHBvcnRzLiBUaGVpciBjb25uZWN0aW9ucyBhcmUgbW9kZWxsZWQg
dXNpbmcgdGhlIE9GCiBncmFwaCBiaW5kaW5ncyBzcGVjaWZpZWQgaW4gRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2dyYXBoLnR4dC4KIAotLSBWaWRlbyBwb3J0IDAgZm9yIHRoZSBS
R0IsIFlVViBvciBEU0kgaW5wdXQuIEluIHRoZSBjYXNlIG9mIEFEVjc1MzMsIHRoZQorLSBWaWRl
byBwb3J0IDAgZm9yIHRoZSBSR0IsIFlVViBvciBEU0kgaW5wdXQuIEluIHRoZSBjYXNlIG9mIEFE
Vjc1MzMvNSwgdGhlCiAgIHJlbW90ZSBlbmRwb2ludCBwaGFuZGxlIHNob3VsZCBiZSBhIHJlZmVy
ZW5jZSB0byBhIHZhbGlkIG1pcGlfZHNpX2hvc3QgZGV2aWNlCiAgIG5vZGUuCiAtIFZpZGVvIHBv
cnQgMSBmb3IgdGhlIEhETUkgb3V0cHV0Ci0tIAoyLjIyLjAKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
