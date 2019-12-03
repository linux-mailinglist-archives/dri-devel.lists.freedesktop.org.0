Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A2EC5110061
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 15:36:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B13BE6E7DC;
	Tue,  3 Dec 2019 14:35:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-cys01nam02on061c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe45::61c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D7566E7BC;
 Tue,  3 Dec 2019 14:35:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l7MP7bQiSPQj2EMEb8FgifkwiSME6T5yuylTgUrzW1mYU7gYigl7lB3Xw4qhkbUXmKFBAdVvi5PF1gqnll3a7yXhj2xRubap1UMttfgoSearCZGIwU5F2dHhH/+zRwbdXL18Jj0Z5lSU9ONIQAtIxa/YzUQUPfrMJ3ojpKp/tRoUky5V9k96zH8qDzTf3KPTq+7SXeAd+Rjw6FRw2mF2tqr4k/Vr/3kVWexEhJl4wLgvnRVJj4iQabhC+wxeR3DXIv+bC9LEBtW82MPzEBLyioAE5kTN273s0SdRm7ebakWYLr3kMYD9Gqr5DR3zXnTYgAdACYYa2pwPEI9PlaOBAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wl6ykhaJDUfVw1hyf+NDeDO6IRKdhSE1C9j8JrGDF6M=;
 b=d0+iiIBmwPf7vlMv6yOvpfTvWTfC/a/pYvvhuSjExpz3wl46R9OaDR9XE9c/PEELn5mqCoO71Hs4yqCVHv1Bl9+O22Ski59JDLHTxg5Ovkt5qVVRenTpbsAMXCHjZBtiHvjUujKMGGBh00WAdSLHTeNjotOQtTQMwLKumLzkDieovLtG31OzZqeA2tGKV1yqSFPTfBg0BF8ly2HjsX2O6JsGEexLeeYpJEuIeZDKwD2lnG0ejyo6f9JmPlXNSxc8pKt1YSss8beCAUTSR7wH4c1bpqy86OaS8Nrm5RmsYAZ44t06rwEHvoX7vUM6kQRiM9wT1OD/Rzp/+2/So5y70w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM6PR12CA0027.namprd12.prod.outlook.com (2603:10b6:5:1c0::40)
 by BYAPR12MB3576.namprd12.prod.outlook.com (2603:10b6:a03:d8::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2495.20; Tue, 3 Dec
 2019 14:35:52 +0000
Received: from DM6NAM11FT054.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eaa::202) by DM6PR12CA0027.outlook.office365.com
 (2603:10b6:5:1c0::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2495.18 via Frontend
 Transport; Tue, 3 Dec 2019 14:35:52 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 DM6NAM11FT054.mail.protection.outlook.com (10.13.173.95) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.2451.23 via Frontend Transport; Tue, 3 Dec 2019 14:35:51 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Tue, 3 Dec 2019
 08:35:49 -0600
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Tue, 3 Dec 2019
 08:35:48 -0600
Received: from mlipski-pc.amd.com (10.180.168.240) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Tue, 3 Dec 2019 08:35:48 -0600
From: <mikita.lipski@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v8 17/17] drm/amd/display: Trigger modesets on MST DSC
 connectors
Date: Tue, 3 Dec 2019 09:35:30 -0500
Message-ID: <20191203143530.27262-18-mikita.lipski@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191203143530.27262-1-mikita.lipski@amd.com>
References: <20191203143530.27262-1-mikita.lipski@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(39860400002)(136003)(396003)(428003)(199004)(189003)(86362001)(2906002)(2351001)(5660300002)(478600001)(8676002)(1076003)(81166006)(186003)(336012)(70586007)(6916009)(26005)(53416004)(11346002)(2616005)(446003)(70206006)(2876002)(4326008)(426003)(81156014)(51416003)(7696005)(76176011)(305945005)(50226002)(50466002)(356004)(6666004)(16586007)(8936002)(54906003)(316002)(5024004)(14444005)(48376002)(36756003)(16060500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB3576; H:SATLEXMB02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ad29ecdf-ca9b-4992-6220-08d777fe18f6
X-MS-TrafficTypeDiagnostic: BYAPR12MB3576:
X-Microsoft-Antispam-PRVS: <BYAPR12MB3576508AF76A9D97310B025FE4420@BYAPR12MB3576.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1247;
X-Forefront-PRVS: 02408926C4
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yYsjkATDyBJ03PEaxOihLCyIoGw76f5tjrX8ou2R0yIeAiFzo5kZARj3Ryi7D8X8euN+ysDWerpj1lgvDmtSFO9gY7wTr3PL/PCOlfPvDsvPHlj2Cs6ekm5FJaD19z1UoyZMO1eQtujzMnqPJbBfRfvl6gwnOpwmwvjfd3z8xQwomn+r4vJdrApxfvrb49Oyhcfi9T/BJNF4e/T7IQMCeSOq6g69qX3hmmNbPZPJiynZGxIaNprhIoa5gebamufGOAAE8Cr19VdGTXVNSXQQY7X2RPmEM0ZTnlaqI2myhswb786bEr7qO/zt1x7NqCCqZ8Em904hGC49JvZQahSAl98LbGtnDbvkYUstGG5Avp1pvF3EhC4YK5BGMCAuqCfCRzjP41Ly1VtuuL+a0b+p3GTpPx/tEicGW2pEIrXQk8JziSGXNi/qKtBcMguP0Zid
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2019 14:35:51.9552 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ad29ecdf-ca9b-4992-6220-08d777fe18f6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3576
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wl6ykhaJDUfVw1hyf+NDeDO6IRKdhSE1C9j8JrGDF6M=;
 b=AffPYhMESfg5maMuq+/NjI2vmTYDLXb2+6SBXJNrLBKp9b9e49CXvCHXmgaNGbXQalinM0c3oJMWeBImSdw6IkwZSxCyFWACH7E2J7GYza1yGe6jhxCTCcD8RaADqikJlHoDWeaqXYdPsGdK2OasDIrMbi50b+kRgbNQPtPb6J0=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is
 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=permerror action=none
 header.from=amd.com;
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
Cc: Leo Li <sunpeng.li@amd.com>, David Francis <David.Francis@amd.com>,
 dri-devel@lists.freedesktop.org, Mikita Lipski <mikita.lipski@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogTWlraXRhIExpcHNraSA8bWlraXRhLmxpcHNraUBhbWQuY29tPgoKV2hlbmV2ZXIgYSBj
b25uZWN0b3Igb24gYW4gTVNUIG5ldHdvcmsgaXMgYXR0YWNoZWQsIGRldGFjaGVkLCBvcgp1bmRl
cmdvZXMgYSBtb2Rlc2V0LCB0aGUgRFNDIGNvbmZpZ3MgZm9yIGVhY2ggc3RyZWFtIG9uIHRoYXQK
dG9wb2xvZ3kgd2lsbCBiZSByZWNhbGN1bGF0ZWQuIFRoaXMgY2FuIGNoYW5nZSB0aGVpciByZXF1
aXJlZApiYW5kd2lkdGgsIHJlcXVpcmluZyBhIGZ1bGwgcmVwcm9ncmFtbWluZywgYXMgdGhvdWdo
IGEgbW9kZXNldAp3YXMgcGVyZm9ybWVkLCBldmVuIGlmIHRoYXQgc3RyZWFtIGRpZCBub3QgY2hh
bmdlIHRpbWluZy4KClRoZXJlZm9yZSwgd2hlbmV2ZXIgYSBjcnRjIGhhcyBkcm1fYXRvbWljX2Ny
dGNfbmVlZHNfbW9kZXNldCwKZm9yIGVhY2ggY3J0YyB0aGF0IHNoYXJlcyBhIE1TVCB0b3BvbG9n
eSB3aXRoIHRoYXQgc3RyZWFtIGFuZApzdXBwb3J0cyBEU0MsIGFkZCB0aGF0IGNydGMgKGFuZCBh
bGwgYWZmZWN0ZWQgY29ubmVjdG9ycyBhbmQKcGxhbmVzKSB0byB0aGUgYXRvbWljIHN0YXRlIGFu
ZCBzZXQgbW9kZV9jaGFuZ2VkIG9uIGl0cyBzdGF0ZQoKdjI6IERvIHRoaXMgY2hlY2sgb25seSBv
biBOYXZpIGFuZCBiZWZvcmUgYWRkaW5nIGNvbm5lY3RvcnMKYW5kIHBsYW5lcyBvbiBtb2Rlc2V0
dGluZyBjcnRjcwoKQ2M6IExlbyBMaSA8c3VucGVuZy5saUBhbWQuY29tPgpDYzogTmljaG9sYXMg
S2F6bGF1c2thcyA8bmljaG9sYXMua2F6bGF1c2thc0BhbWQuY29tPgpDYzogTHl1ZGUgUGF1bCA8
bHl1ZGVAcmVkaGF0LmNvbT4KU2lnbmVkLW9mZi1ieTogRGF2aWQgRnJhbmNpcyA8RGF2aWQuRnJh
bmNpc0BhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBNaWtpdGEgTGlwc2tpIDxtaWtpdGEubGlwc2tp
QGFtZC5jb20+Ci0tLQogLi4uL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9k
bS5jIHwgMzMgKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDMzIGluc2VydGlv
bnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2Rt
L2FtZGdwdV9kbS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRn
cHVfZG0uYwppbmRleCAyYWMzYTJmMGI0NTIuLjkwOTY2NTQyNzExMCAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYworKysgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jCkBAIC03OTMwLDYg
Kzc5MzAsMjkgQEAgZG1fZGV0ZXJtaW5lX3VwZGF0ZV90eXBlX2Zvcl9jb21taXQoc3RydWN0IGFt
ZGdwdV9kaXNwbGF5X21hbmFnZXIgKmRtLAogCXJldHVybiByZXQ7CiB9CiAKK3N0YXRpYyBpbnQg
YWRkX2FmZmVjdGVkX21zdF9kc2NfY3J0Y3Moc3RydWN0IGRybV9hdG9taWNfc3RhdGUgKnN0YXRl
LCBzdHJ1Y3QgZHJtX2NydGMgKmNydGMpCit7CisJc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5l
Y3RvcjsKKwlzdHJ1Y3QgZHJtX2Nvbm5lY3Rvcl9zdGF0ZSAqY29ubl9zdGF0ZTsKKwlzdHJ1Y3Qg
YW1kZ3B1X2RtX2Nvbm5lY3RvciAqYWNvbm5lY3RvciA9IE5VTEw7CisJaW50IGk7CisJZm9yX2Vh
Y2hfbmV3X2Nvbm5lY3Rvcl9pbl9zdGF0ZShzdGF0ZSwgY29ubmVjdG9yLCBjb25uX3N0YXRlLCBp
KSB7CisJCWlmIChjb25uX3N0YXRlLT5jcnRjICE9IGNydGMpCisJCQljb250aW51ZTsKKworCQlh
Y29ubmVjdG9yID0gdG9fYW1kZ3B1X2RtX2Nvbm5lY3Rvcihjb25uZWN0b3IpOworCQlpZiAoIWFj
b25uZWN0b3ItPnBvcnQpCisJCQlhY29ubmVjdG9yID0gTlVMTDsKKwkJZWxzZQorCQkJYnJlYWs7
CisJfQorCisJaWYgKCFhY29ubmVjdG9yKQorCQlyZXR1cm4gMDsKKworCXJldHVybiBkcm1fZHBf
bXN0X2FkZF9hZmZlY3RlZF9kc2NfY3J0Y3Moc3RhdGUsICZhY29ubmVjdG9yLT5tc3RfbWdyKTsK
K30KKwogLyoqCiAgKiBhbWRncHVfZG1fYXRvbWljX2NoZWNrKCkgLSBBdG9taWMgY2hlY2sgaW1w
bGVtZW50YXRpb24gZm9yIEFNRGdwdSBETS4KICAqIEBkZXY6IFRoZSBEUk0gZGV2aWNlCkBAIC03
OTgyLDYgKzgwMDUsMTYgQEAgc3RhdGljIGludCBhbWRncHVfZG1fYXRvbWljX2NoZWNrKHN0cnVj
dCBkcm1fZGV2aWNlICpkZXYsCiAJaWYgKHJldCkKIAkJZ290byBmYWlsOwogCisJaWYgKGFkZXYt
PmFzaWNfdHlwZSA+PSBDSElQX05BVkkxMCkgeworCQlmb3JfZWFjaF9vbGRuZXdfY3J0Y19pbl9z
dGF0ZShzdGF0ZSwgY3J0Yywgb2xkX2NydGNfc3RhdGUsIG5ld19jcnRjX3N0YXRlLCBpKSB7CisJ
CQlpZiAoZHJtX2F0b21pY19jcnRjX25lZWRzX21vZGVzZXQobmV3X2NydGNfc3RhdGUpKSB7CisJ
CQkJcmV0ID0gYWRkX2FmZmVjdGVkX21zdF9kc2NfY3J0Y3Moc3RhdGUsIGNydGMpOworCQkJCWlm
IChyZXQpCisJCQkJCWdvdG8gZmFpbDsKKwkJCX0KKwkJfQorCX0KKwogCWZvcl9lYWNoX29sZG5l
d19jcnRjX2luX3N0YXRlKHN0YXRlLCBjcnRjLCBvbGRfY3J0Y19zdGF0ZSwgbmV3X2NydGNfc3Rh
dGUsIGkpIHsKIAkJaWYgKCFkcm1fYXRvbWljX2NydGNfbmVlZHNfbW9kZXNldChuZXdfY3J0Y19z
dGF0ZSkgJiYKIAkJICAgICFuZXdfY3J0Y19zdGF0ZS0+Y29sb3JfbWdtdF9jaGFuZ2VkICYmCi0t
IAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
