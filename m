Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3A63F2DA1
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2019 12:42:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD3E76F662;
	Thu,  7 Nov 2019 11:42:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00054.outbound.protection.outlook.com [40.107.0.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A1DD6F662
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Nov 2019 11:42:46 +0000 (UTC)
Received: from VI1PR08CA0122.eurprd08.prod.outlook.com (2603:10a6:800:d4::24)
 by AM0PR08MB3428.eurprd08.prod.outlook.com (2603:10a6:208:de::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2430.20; Thu, 7 Nov
 2019 11:42:44 +0000
Received: from DB5EUR03FT047.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::201) by VI1PR08CA0122.outlook.office365.com
 (2603:10a6:800:d4::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2430.20 via Frontend
 Transport; Thu, 7 Nov 2019 11:42:43 +0000
Received-SPF: Fail (protection.outlook.com: domain of arm.com does not
 designate 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT047.mail.protection.outlook.com (10.152.21.232) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2430.21 via Frontend Transport; Thu, 7 Nov 2019 11:42:43 +0000
Received: ("Tessian outbound 6481c7fa5a3c:v33");
 Thu, 07 Nov 2019 11:42:43 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: ab1cdf98c70ca652
X-CR-MTA-TID: 64aa7808
Received: from a8bf8e949972.2 (cr-mta-lb-1.cr-mta-net [104.47.10.51])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 215E9767-0A9C-4AC4-9364-6F886BCDD82A.1; 
 Thu, 07 Nov 2019 11:42:38 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2051.outbound.protection.outlook.com [104.47.10.51])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a8bf8e949972.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 07 Nov 2019 11:42:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iKxtUfUqjpuChkc7XNwD1LV7QVleleWVeMuU8JZt/1r6HO2QTwVAXo+Z306Z2vZEAlAJC3JeC0SMI5sxiaQ6dV98VteMHJjc0Vjzt8Ok6zalLGy3VVVGDVUKW1zVcYGj7vvWhD9s9WS6CuVe0VqseIS0u58kqJWtYQYkrZ8ivkLlmfsLLc4XU7exjJwh6aP/gKyyiwXbMPBZoZ3xDGuep2/RCMBB6acBcLOsYotSaRMBHdRyHbN+4XGmQCQBw3gqGckLztkkWi6UHXiAFEmrAWBuw33iuXuoGCYGPW0/u343OZEJCFApUoWzEWUQkLl13JbtMnnOCBfyp93sts9Z+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cNd6MJSFo+gICC6cfGG5jN+STD2M9K1MfN8WY7NyFS8=;
 b=Vp37GNBtwbdaVFxhrxgN+lr3kYZAv22SezYCPVI+nyJhiaqwkliYpZuIjJB63rrE7pqduOuFm7j7xdC/Do9g43OzqCz9a43XTuhP9r/fKogCYnM59Wu4bQcnQ1vR9aSFrLLxhCLOsXsX09SHroHymJ8WlCSko3QIUM+iTVjdncAmiElz+EnQFJBec1eO6F5ErxS7a4y9rnIR2nK/FU2YT5Bg8uChzzqIwWbwrSpFyyBvOl3zudg+AhIhqFSrix3UsMbh+gE/3zibOMjvc9IzaVt3poZkv+CYSCMMMbWng9t8kxyD5yqHspDhRbai1J9+0khY7NAvHWnaruLRSQi2XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB4351.eurprd08.prod.outlook.com (20.179.27.81) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.20; Thu, 7 Nov 2019 11:42:36 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d%3]) with mapi id 15.20.2408.028; Thu, 7 Nov 2019
 11:42:36 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 3/5] drm/komeda: Optionally dump DRM state on interrupts
Thread-Topic: [PATCH v2 3/5] drm/komeda: Optionally dump DRM state on
 interrupts
Thread-Index: AQHVlWBzAPfnXaxWaUmc63HFBTtG6g==
Date: Thu, 7 Nov 2019 11:42:36 +0000
Message-ID: <20191107114155.54307-4-mihail.atanassov@arm.com>
References: <20191107114155.54307-1-mihail.atanassov@arm.com>
In-Reply-To: <20191107114155.54307-1-mihail.atanassov@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [217.140.106.55]
x-clientproxiedby: LO2P265CA0146.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9::14) To VI1PR08MB4078.eurprd08.prod.outlook.com
 (2603:10a6:803:e5::28)
x-mailer: git-send-email 2.23.0
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 022ed2e0-77e4-4393-36fd-08d763779a52
X-MS-TrafficTypeDiagnostic: VI1PR08MB4351:|VI1PR08MB4351:|AM0PR08MB3428:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM0PR08MB34287D3081B025EB997F087B8F780@AM0PR08MB3428.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
x-forefront-prvs: 0214EB3F68
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(346002)(396003)(39860400002)(376002)(136003)(189003)(199004)(11346002)(316002)(54906003)(446003)(476003)(50226002)(71200400001)(6512007)(305945005)(6916009)(2906002)(8936002)(2616005)(44832011)(4326008)(6436002)(66066001)(256004)(486006)(86362001)(26005)(71190400001)(36756003)(52116002)(2351001)(14444005)(6506007)(99286004)(6486002)(102836004)(2501003)(76176011)(386003)(186003)(6116002)(14454004)(66946007)(66476007)(66556008)(64756008)(66446008)(25786009)(478600001)(1076003)(3846002)(8676002)(81166006)(81156014)(7736002)(5640700003)(5660300002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB4351;
 H:VI1PR08MB4078.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: Sppi3GhYqwNfLGi3lL4FzrrODmoGBeeZPhG/Rvy9xFsZ7JwMck5Je0cAGpHTOKjmHGooMr5HoqVptTmT/9AaDxqi7WsQeUNFbR8TGD3rllK9MrpBwfbO0ylaADQ60DrdYWjn2iix4pBTRHxMcb4MJ1e0BiPLB30gULt7XfrnDsh5QWz3k30J6q59efawANKe5vlwseK6TVua7T6TgLjamtViFGYHE5sKf0wpxzlz+fL+n2HCyPRndcKitgt6vRNfuq8KW4G45cGPrmcqdQo8efr3PcKS0sfJmnrZ+1ixG177ARdyk8kWi8eHyMTKLAjb66wsMDPYJwIPglRgyPU1L+I8nz2acVjTmuSq4gGOnX6igKZk8zGS9w+VawFugtuwB9TiYGtvh41NPc/y2A/ZL/2FXd4QmdtpTBY+4qBNVSLLidYUHbvYcnTOcXZnoSMb
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4351
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT047.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(39860400002)(346002)(376002)(1110001)(339900001)(199004)(189003)(5660300002)(14454004)(2351001)(5640700003)(23756003)(70206006)(70586007)(14444005)(6486002)(446003)(86362001)(11346002)(54906003)(2501003)(478600001)(36756003)(26826003)(126002)(476003)(105606002)(76130400001)(2906002)(486006)(2616005)(336012)(22756006)(76176011)(66066001)(4326008)(50466002)(50226002)(7736002)(356004)(6916009)(316002)(186003)(47776003)(6506007)(3846002)(386003)(26005)(6116002)(102836004)(99286004)(25786009)(1076003)(107886003)(305945005)(81166006)(6512007)(81156014)(8936002)(8746002)(8676002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR08MB3428;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Fail; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: b3d7cc57-46bc-4c34-000b-08d7637795f4
NoDisclaimer: True
X-Forefront-PRVS: 0214EB3F68
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: b/L4Q0f/AhXLqPCGOrvWmVbJAxf0iI088IRkNw8McQXpLwwTcoUaOwsmCis0FIdEKHVxUrMMa/X9hSe0QSk/T/JbTNELRla3RXKk+WUT8R4nhKKkqSJTQI1MC8uRDL1+Cm2Ert/BYgb6KsRfvx1FtcCoKqiET4YULDYxRAd/wpj2rtsbZx8YQ0O6wcwR7EsXA6SXNGUJ43AQ6DRZZxDZvxUwtoWeJ9gLSRNmvQkMcPU+vf5pK63MKGGC2JIBjYA7Yfoefbhaf3qNd9R1D+NdXZRs6EB33i/ylruxzVVIge3gllilm5AHC2BkKNWXxIs2l0XR0NmJisoQfeHyf2fBvANPT4WzRuW1yW2C7VeF+sIAquwzHnqLrYScFOYEg76binvpitkNf+OXdh4yE1eT6oof9+5cQ4jtihT8GW0zPBnB34mhJsX1fcmXlSYP1q6m
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2019 11:42:43.7021 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 022ed2e0-77e4-4393-36fd-08d763779a52
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3428
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cNd6MJSFo+gICC6cfGG5jN+STD2M9K1MfN8WY7NyFS8=;
 b=UwN/rx3G5TDCIZrNv3nXg3hl/xr1r9Trs7l3CgI3t4TbjuN/y1D9uONSBhyf/svXeFEVmxEaL1YBGoTYjlwNzPpaCIG2Y/699xZHSdmGX9aMf6EEzCbO/TOLIdQgMSuchI4VMoxP6uvsO3vo69drllVkgKS4K8p+lnQetC/V39Q=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cNd6MJSFo+gICC6cfGG5jN+STD2M9K1MfN8WY7NyFS8=;
 b=UwN/rx3G5TDCIZrNv3nXg3hl/xr1r9Trs7l3CgI3t4TbjuN/y1D9uONSBhyf/svXeFEVmxEaL1YBGoTYjlwNzPpaCIG2Y/699xZHSdmGX9aMf6EEzCbO/TOLIdQgMSuchI4VMoxP6uvsO3vo69drllVkgKS4K8p+lnQetC/V39Q=
X-Mailman-Original-Authentication-Results: spf=fail (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org; dmarc=none
 action=none header.from=arm.com;
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
Cc: Mihail Atanassov <Mihail.Atanassov@arm.com>,
 David Airlie <airlied@linux.ie>, Liviu Dudau <Liviu.Dudau@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "james qian wang \(Arm Technology China\)" <james.qian.wang@arm.com>,
 "Lowry Li \(Arm Technology China\)" <Lowry.Li@arm.com>, nd <nd@arm.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SXQncyBwb3RlbnRpYWxseSB1c2VmdWwgaW5mb3JtYXRpb24gd2hlbiBkaWFnbm9zaW5nIGVycm9y
L3dhcm4gSVJRcywgc28KZHVtcCBpdCB0byBkbWVzZyB3aXRoIGEgZHJtX2luZm9fcHJpbnRlci4g
SGlkZSB0aGlzIGV4dHJhIGRlYnVnIGR1bXBpbmcKYmVoaW5kIGFub3RoZXIga29tZWRhX2Rldi0+
ZXJyX3ZlcmJvc2l0eSBiaXQuCgpOb3RlIHRoYXQgdGhlcmUncyBub3QgbXVjaCBzZW5zZSBpbiBk
dW1waW5nIGl0IGZvciBJTkZPIGV2ZW50cywKc2luY2UgdGhlIFZTWU5DIGV2ZW50IHdpbGwgc3dh
bXAgdGhlIGxvZy4KClJldmlld2VkLWJ5OiBKYW1lcyBRaWFuIFdhbmcgKEFybSBUZWNobm9sb2d5
IENoaW5hKSA8amFtZXMucWlhbi53YW5nQGFybS5jb20+ClNpZ25lZC1vZmYtYnk6IE1paGFpbCBB
dGFuYXNzb3YgPG1paGFpbC5hdGFuYXNzb3ZAYXJtLmNvbT4KLS0tCgogdjI6IENsZWFuIHVwIGNv
bnRpbnVhdGlvbiBsaW5lIHdhcm5pbmcgZnJvbSBjaGVja3BhdGNoLgoKIGRyaXZlcnMvZ3B1L2Ry
bS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Rldi5oICAgfCA1ICsrKystCiBkcml2ZXJzL2dw
dS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9ldmVudC5jIHwgOCArKysrKysrLQogMiBm
aWxlcyBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Rldi5oIGIvZHJp
dmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZGV2LmgKaW5kZXggODMxYzM3
NTE4MGY4Li40ODA5MDAwYzFlZmIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlz
cGxheS9rb21lZGEva29tZWRhX2Rldi5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxh
eS9rb21lZGEva29tZWRhX2Rldi5oCkBAIC0yMDUsMTEgKzIwNSwxNCBAQCBzdHJ1Y3Qga29tZWRh
X2RldiB7CiAJLyoqCiAJICogQGVycl92ZXJib3NpdHk6IGJpdG1hc2sgZm9yIGhvdyBtdWNoIGV4
dHJhIGluZm8gdG8gcHJpbnQgb24gZXJyb3IKIAkgKgotCSAqIFNlZSBLT01FREFfREVWXyogbWFj
cm9zIGZvciBkZXRhaWxzLgorCSAqIFNlZSBLT01FREFfREVWXyogbWFjcm9zIGZvciBkZXRhaWxz
LiBMb3cgYnl0ZSBjb250YWlucyB0aGUgZGVidWcKKwkgKiBsZXZlbCBjYXRlZ29yaWVzLCB0aGUg
aGlnaCBieXRlIGNvbnRhaW5zIGV4dHJhIGRlYnVnIG9wdGlvbnMuCiAJICovCiAJdTE2IGVycl92
ZXJib3NpdHk7CiAJLyogUHJpbnQgYSBzaW5nbGUgbGluZSBwZXIgZXJyb3IgcGVyIGZyYW1lIHdp
dGggZXJyb3IgZXZlbnRzLiAqLwogI2RlZmluZSBLT01FREFfREVWX1BSSU5UX0VSUl9FVkVOVFMg
QklUKDApCisJLyogRHVtcCBEUk0gc3RhdGUgb24gYW4gZXJyb3Igb3Igd2FybmluZyBldmVudC4g
Ki8KKyNkZWZpbmUgS09NRURBX0RFVl9QUklOVF9EVU1QX1NUQVRFX09OX0VWRU5UIEJJVCg4KQog
fTsKIAogc3RhdGljIGlubGluZSBib29sCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJt
L2Rpc3BsYXkva29tZWRhL2tvbWVkYV9ldmVudC5jIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNw
bGF5L2tvbWVkYS9rb21lZGFfZXZlbnQuYwppbmRleCA1NzVlZDRkZjc0ZWQuLmRlOTlhNTg4ZWQ3
NSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFf
ZXZlbnQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9l
dmVudC5jCkBAIC00LDYgKzQsNyBAQAogICogQXV0aG9yOiBKYW1lcy5RaWFuLldhbmcgPGphbWVz
LnFpYW4ud2FuZ0Bhcm0uY29tPgogICoKICAqLworI2luY2x1ZGUgPGRybS9kcm1fYXRvbWljLmg+
CiAjaW5jbHVkZSA8ZHJtL2RybV9wcmludC5oPgogCiAjaW5jbHVkZSAia29tZWRhX2Rldi5oIgpA
QCAtMTEzLDYgKzExNCw3IEBAIHZvaWQga29tZWRhX3ByaW50X2V2ZW50cyhzdHJ1Y3Qga29tZWRh
X2V2ZW50cyAqZXZ0cywgc3RydWN0IGRybV9kZXZpY2UgKmRldikKIAlzdGF0aWMgYm9vbCBlbl9w
cmludCA9IHRydWU7CiAJc3RydWN0IGtvbWVkYV9kZXYgKm1kZXYgPSBkZXYtPmRldl9wcml2YXRl
OwogCXUxNiBjb25zdCBlcnJfdmVyYm9zaXR5ID0gbWRldi0+ZXJyX3ZlcmJvc2l0eTsKKwl1NjQg
ZXZ0c19tYXNrID0gZXZ0cy0+Z2xvYmFsIHwgZXZ0cy0+cGlwZXNbMF0gfCBldnRzLT5waXBlc1sx
XTsKIAogCS8qIHJlZHVjZSB0aGUgc2FtZSBtc2cgcHJpbnQsIG9ubHkgcHJpbnQgdGhlIGZpcnN0
IGV2dCBmb3Igb25lIGZyYW1lICovCiAJaWYgKGV2dHMtPmdsb2JhbCB8fCBpc19uZXdfZnJhbWUo
ZXZ0cykpCkBAIC0xMjMsOSArMTI1LDEwIEBAIHZvaWQga29tZWRhX3ByaW50X2V2ZW50cyhzdHJ1
Y3Qga29tZWRhX2V2ZW50cyAqZXZ0cywgc3RydWN0IGRybV9kZXZpY2UgKmRldikKIAlpZiAoZXJy
X3ZlcmJvc2l0eSAmIEtPTUVEQV9ERVZfUFJJTlRfRVJSX0VWRU5UUykKIAkJcHJpbnRfZXZ0cyB8
PSBLT01FREFfRVJSX0VWRU5UUzsKIAotCWlmICgoZXZ0cy0+Z2xvYmFsIHwgZXZ0cy0+cGlwZXNb
MF0gfCBldnRzLT5waXBlc1sxXSkgJiBwcmludF9ldnRzKSB7CisJaWYgKGV2dHNfbWFzayAmIHBy
aW50X2V2dHMpIHsKIAkJY2hhciBtc2dbMjU2XTsKIAkJc3RydWN0IGtvbWVkYV9zdHIgc3RyOwor
CQlzdHJ1Y3QgZHJtX3ByaW50ZXIgcCA9IGRybV9pbmZvX3ByaW50ZXIoZGV2LT5kZXYpOwogCiAJ
CXN0ci5zdHIgPSBtc2c7CiAJCXN0ci5zeiAgPSBzaXplb2YobXNnKTsKQEAgLTEzOSw2ICsxNDIs
OSBAQCB2b2lkIGtvbWVkYV9wcmludF9ldmVudHMoc3RydWN0IGtvbWVkYV9ldmVudHMgKmV2dHMs
IHN0cnVjdCBkcm1fZGV2aWNlICpkZXYpCiAJCWV2dF9zdHIoJnN0ciwgZXZ0cy0+cGlwZXNbMV0p
OwogCiAJCURSTV9FUlJPUigiZXJyIGRldGVjdDogJXNcbiIsIG1zZyk7CisJCWlmICgoZXJyX3Zl
cmJvc2l0eSAmIEtPTUVEQV9ERVZfUFJJTlRfRFVNUF9TVEFURV9PTl9FVkVOVCkgJiYKKwkJICAg
IChldnRzX21hc2sgJiAoS09NRURBX0VSUl9FVkVOVFMgfCBLT01FREFfV0FSTl9FVkVOVFMpKSkK
KwkJCWRybV9zdGF0ZV9kdW1wKGRldiwgJnApOwogCiAJCWVuX3ByaW50ID0gZmFsc2U7CiAJfQot
LSAKMi4yMy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
