Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6544888BA9
	for <lists+dri-devel@lfdr.de>; Sat, 10 Aug 2019 15:55:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABB586E42A;
	Sat, 10 Aug 2019 13:55:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com
 [148.163.139.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA9576EE0F
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Aug 2019 14:17:22 +0000 (UTC)
Received: from pps.filterd (m0167090.ppops.net [127.0.0.1])
 by mx0b-00128a01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x79ED7aR015334; Fri, 9 Aug 2019 10:17:08 -0400
Received: from nam05-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam05lp2055.outbound.protection.outlook.com [104.47.49.55])
 by mx0b-00128a01.pphosted.com with ESMTP id 2u9a8wg13g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Fri, 09 Aug 2019 10:17:08 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=muGhaN/UEGwYn9Euae0HT4G+wbbG7sw1zz/G6PDu4W/XtyDZa2w1hzvF7zw7CToRJj3Rkc01kDv2AMFn3+ePt/ZY5eRgf3Rq63xEqXoZtf/AxE8nvVS6YEknmfEdvSJGgs7ClCefdDrroJwR25wytifGALVJiLKqNWFGQWTy+soeZ/G6Y1VAVa/E13pVFAq2Ab/0WaH8L/cp6r5WyeCmZModuURquJ8WOXr6YT1zXyHwkPfOOl6WqKQczddqabPho3TKxVZf+5NjtJszwGi0p/OIcf42ZSaKIvgFd/LnIUTaCwQLfYWt52nCzOQEXRqzqjjIwgCeP9XeMULnYem4jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hk5MOBPzXtAPzDjxEajfGt+rT/TxLRzdbikgJ1pAAr0=;
 b=WNfUiCiCZKxRPKVOGNXAG9JeDqGBgzXBnaNQ/hJxonTPMutjk6zARLyHHdhGqY1f/VTcRRU9QKuYmC17P6QKKSWRQRAe15/TWsg9ySmT8j22cw0Uru7IVx1AR8ZfYqfnPGGhnSbBKFY4eek8heat6czTRAW2aQJDzxB0UmnQEkz0C53cdXv67mPLgu4Gx6rqmb1YUacBdP76GjmhofHSbdaGJBFNCjexQqDlHIpftwY6c8uZNxwbXSP7b6nxnsqqppAgCYJkLa8zGV7sgG79S9WLv/v/4dSSVNvBN7h2z2aVZ30dkt2XVjbHb/CRIK2bTNXrm0aweT3ts2m14fXzRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass (sender ip is
 137.71.25.57) smtp.rcpttodomain=kernel.org
 smtp.mailfrom=analog.com;dmarc=bestguesspass action=none
 header.from=analog.com;dkim=none (message not signed);arc=none
Received: from BN6PR03CA0089.namprd03.prod.outlook.com (2603:10b6:405:6f::27)
 by BYAPR03MB4551.namprd03.prod.outlook.com (2603:10b6:a03:cc::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2115.14; Fri, 9 Aug
 2019 14:17:06 +0000
Received: from SN1NAM02FT034.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e44::206) by BN6PR03CA0089.outlook.office365.com
 (2603:10b6:405:6f::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2157.18 via Frontend
 Transport; Fri, 9 Aug 2019 14:17:06 +0000
Received-SPF: Pass (protection.outlook.com: domain of analog.com designates
 137.71.25.57 as permitted sender) receiver=protection.outlook.com;
 client-ip=137.71.25.57; helo=nwd2mta2.analog.com;
Received: from nwd2mta2.analog.com (137.71.25.57) by
 SN1NAM02FT034.mail.protection.outlook.com (10.152.72.141) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2157.15
 via Frontend Transport; Fri, 9 Aug 2019 14:17:05 +0000
Received: from NWD2HUBCAS7.ad.analog.com (nwd2hubcas7.ad.analog.com
 [10.64.69.107])
 by nwd2mta2.analog.com (8.13.8/8.13.8) with ESMTP id x79EH45S005153
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Fri, 9 Aug 2019 07:17:04 -0700
Received: from btogorean-pc.ad.analog.com (10.48.65.146) by
 NWD2HUBCAS7.ad.analog.com (10.64.69.107) with Microsoft SMTP Server id
 14.3.408.0; Fri, 9 Aug 2019 10:17:04 -0400
From: Bogdan Togorean <bogdan.togorean@analog.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 1/2] dt-bindings: drm: bridge: adv7511: Add ADV7535 support
Date: Fri, 9 Aug 2019 17:16:10 +0300
Message-ID: <20190809141611.9927-2-bogdan.togorean@analog.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190809141611.9927-1-bogdan.togorean@analog.com>
References: <20190809141611.9927-1-bogdan.togorean@analog.com>
MIME-Version: 1.0
X-ADIRoutedOnPrem: True
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:137.71.25.57; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(39860400002)(136003)(376002)(396003)(346002)(2980300002)(199004)(189003)(5660300002)(47776003)(48376002)(1076003)(316002)(107886003)(478600001)(2906002)(246002)(356004)(6666004)(36756003)(2870700001)(70206006)(70586007)(50466002)(26005)(4326008)(2351001)(6916009)(86362001)(336012)(54906003)(446003)(44832011)(476003)(106002)(76176011)(126002)(50226002)(7636002)(486006)(305945005)(7416002)(186003)(7696005)(51416003)(426003)(8936002)(8676002)(11346002)(2616005)(16060500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR03MB4551; H:nwd2mta2.analog.com; FPR:;
 SPF:Pass; LANG:en; PTR:nwd2mail11.analog.com; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2025538f-51b2-46e0-2871-08d71cd441c1
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(4709080)(1401327)(2017052603328);
 SRVR:BYAPR03MB4551; 
X-MS-TrafficTypeDiagnostic: BYAPR03MB4551:
X-Microsoft-Antispam-PRVS: <BYAPR03MB4551BB7AD4CCA5E2482007EF9BD60@BYAPR03MB4551.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-Forefront-PRVS: 01244308DF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: DKBfg1E7nOP3I7FoU3FCIJksqm6G3hTNnrlfcb4KCt6oZzJ1/42LWRqBFhVJ1uRHFPKLrWyck76d8WWYcoMq8sjCA19u/xcCQYu/9x5PWVgPZciaQx6pgzOSCVm8B+kpTMrXYcAB7OAGTVntZOPf5rdEN5hDRswXY2ZBgK3M1yWrgzJt92oiPhraR3g6iiMh9no2rvLfJpZJxyWSLtQIbeDEwAOMx5u/53dv/k0jHzM4kpyVs+/QrQlEEpJShaUhhmYO/kITN50vx/Rjxg6r0b4rDhc/z5q3naQkMq+9zfo21k6ty2D8jKuQsRg2IhAyt8YPaaZzmAecl1FfskJEbZQN1r7kFp6quOJWzb08DcHzpO0SAMDD2G8PGf5YxE2SVsxCXmhk9DCzFq4uYvsslzA7nCWs88rGIHTaJ3r9EfU=
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2019 14:17:05.2772 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2025538f-51b2-46e0-2871-08d71cd441c1
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=eaa689b4-8f87-40e0-9c6f-7228de4d754a; Ip=[137.71.25.57];
 Helo=[nwd2mta2.analog.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4551
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-09_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908090145
X-Mailman-Approved-At: Sat, 10 Aug 2019 13:55:12 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector2-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hk5MOBPzXtAPzDjxEajfGt+rT/TxLRzdbikgJ1pAAr0=;
 b=QgIuNipeFmeJh/dlEkGsdiG93lcy4pn2E2SSMSLU1VaB1mFn5A3LVhp6k/drSgbhH30JstuDp+a2wglQI5+3hHXN3Qz4ku6UAz+pGryYgFjsZnG9WjC6nhPJ6ocFZGVWjApNmIChM0UrybAn4HZ9Vb2vSfYaLm5pELTji9TwNd0=
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
