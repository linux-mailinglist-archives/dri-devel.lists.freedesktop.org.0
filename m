Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D98104B1C
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2019 08:13:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33E936EAEE;
	Thu, 21 Nov 2019 07:13:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on0609.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe1e::609])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E567F6EAEE
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2019 07:13:01 +0000 (UTC)
Received: from VI1PR08CA0140.eurprd08.prod.outlook.com (2603:10a6:800:d5::18)
 by AM4PR0802MB2257.eurprd08.prod.outlook.com (2603:10a6:200:61::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2451.23; Thu, 21 Nov
 2019 07:12:59 +0000
Received: from VE1EUR03FT015.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::204) by VI1PR08CA0140.outlook.office365.com
 (2603:10a6:800:d5::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2474.16 via Frontend
 Transport; Thu, 21 Nov 2019 07:12:59 +0000
Received-SPF: Fail (protection.outlook.com: domain of arm.com does not
 designate 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT015.mail.protection.outlook.com (10.152.18.176) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.17 via Frontend Transport; Thu, 21 Nov 2019 07:12:59 +0000
Received: ("Tessian outbound f7868d7ede10:v33");
 Thu, 21 Nov 2019 07:12:57 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 42ac78c10f20c637
X-CR-MTA-TID: 64aa7808
Received: from fcc1ffd6d176.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.14.55]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 01C109A0-B95E-456C-88C5-079E43941A38.1; 
 Thu, 21 Nov 2019 07:12:52 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2055.outbound.protection.outlook.com [104.47.14.55])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id fcc1ffd6d176.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 21 Nov 2019 07:12:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W4W7vO2CUU3IwMkxZ/ngLIkrKvIF9EWoWLUV1YhC/uD/zBy+ugru9XDQEVdeHdjW6zWtSJqVGq9eRqusUIUdhJl6TQuvbxWp+ltuVXf5helfMXZxybWbJQ3Ve68qOJvbvtnnlYfszzDywSTWdTPoP2oNWIEj3VLaIaC7KC95ysIRJihcBUuLVU8wUVHeky/W60YZN1f/mbSDKGYahQUQSkEpY/x0LyB1S6gjE6tm1ewL4kTrzCFsdgBlgQCfd3n1Nd70bFHeso63Ti0eh5gSH5+w36Lbjr778a/D+tx4mj9p3uOVd+P93YgbxeqSj+bywCoARMQX9PxEYwfPOJOCMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IIB/8z50vBuASSq6iSuVafx4DPXkwq7T4HlbSTTsATE=;
 b=GtFFxpLTFmNPt5SwTwKq5knXPZa+e7tJeZcjGX02fW5AI67hq/U1vm1WlPjE0FYtLUI0D9oRcfJhB+fwQuOJzo5hCaGWHA6YBVsLUDuTz1SsdOpgUUNwK5vTomnV1VMzIXIikCzl8QTO6SlSyNfNcgtx3TMfSWjzaRO93OVJrTsKrBkMLs324215bXvuHvkqcLXS4yQd5PT1odUhrWXMvf83PXInhZjboCxo0OY0w+ppxeo/4EkugV5SK59SWcquC32XAGio6HjkqbBqFCsNdAbIG+aPpZjCWNm18SFQzlzFD3fFlCIST/3B5B0tHbgaSDRYAub9IAS6RZth5noXaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB5069.eurprd08.prod.outlook.com (20.179.29.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.16; Thu, 21 Nov 2019 07:12:50 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::a809:417a:faf3:61a7]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::a809:417a:faf3:61a7%6]) with mapi id 15.20.2474.019; Thu, 21 Nov 2019
 07:12:50 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>, "airlied@linux.ie" <airlied@linux.ie>, 
 Brian Starkey <Brian.Starkey@arm.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, Mihail Atanassov
 <Mihail.Atanassov@arm.com>
Subject: [PATCH v4 5/6] drm/komeda: Update writeback signal for side_by_side
Thread-Topic: [PATCH v4 5/6] drm/komeda: Update writeback signal for
 side_by_side
Thread-Index: AQHVoDsVP7DZARWDIkCVgBtVHxZ+nw==
Date: Thu, 21 Nov 2019 07:12:50 +0000
Message-ID: <20191121071205.27511-6-james.qian.wang@arm.com>
References: <20191121071205.27511-1-james.qian.wang@arm.com>
In-Reply-To: <20191121071205.27511-1-james.qian.wang@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK2PR03CA0064.apcprd03.prod.outlook.com
 (2603:1096:202:17::34) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 4663def3-0a40-4340-e627-08d76e523d81
X-MS-TrafficTypeDiagnostic: VE1PR08MB5069:|VE1PR08MB5069:|AM4PR0802MB2257:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM4PR0802MB22570A2564676CA5AA2EE319B34E0@AM4PR0802MB2257.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:7219;OLM:7219;
x-forefront-prvs: 0228DDDDD7
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39850400004)(366004)(376002)(346002)(136003)(189003)(199004)(386003)(6636002)(55236004)(102836004)(6506007)(76176011)(256004)(52116002)(2906002)(50226002)(7736002)(305945005)(66446008)(186003)(81166006)(81156014)(8676002)(8936002)(66946007)(6512007)(26005)(2616005)(71200400001)(6486002)(446003)(478600001)(11346002)(71190400001)(6436002)(64756008)(66476007)(66556008)(86362001)(66066001)(4326008)(36756003)(2501003)(6116002)(316002)(3846002)(14454004)(103116003)(99286004)(54906003)(110136005)(25786009)(1076003)(5660300002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB5069;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 25JaAhMhi4pPfQfyhnS467tH9z3KJNSotjXLzoKX5EVMOVFwTEgAIcKeTsOz5cUHpwRm3jzDzo2qDyQKO21NG3iVU4VxygsXlb/WragdzNMKGOwR4KTyukIc8YhWlwUoyECs2AgoOrBbIiU1dPCISjI4FsoUIji6ou5F1pIFFavevf21MwfkY/S1Zo9usmcoE1RFH7TtQBD9ib1T1ejBTWzdTuEZ5qnpaGSuIxZm6AuP/j+6FxrRHF6NMI/AWZkMPuzM1dNnSNbtFDxBsaX65+F9dVgD9xqfTkFng+wr4VXDe6dOUX4xLpKxOZF4JZWga+d/12yc17/hMUFxUZ4ZnqmDWl3y1PW/5Fl2HSeYu3StKPSIxEViRWlDFpO8VfMoFPV84eAjtCHJmPqvymlEYhYtkXGPOpblTTk8T8ns7RFfPxMwKArr2wXJIcTAUX6Z
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5069
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(396003)(39860400002)(376002)(346002)(1110001)(339900001)(189003)(199004)(8746002)(103116003)(50466002)(4326008)(86362001)(6636002)(54906003)(36906005)(7736002)(305945005)(356004)(6116002)(66066001)(3846002)(110136005)(316002)(105606002)(47776003)(22756006)(23756003)(1076003)(446003)(2501003)(336012)(5660300002)(6512007)(2616005)(76176011)(76130400001)(36756003)(70206006)(70586007)(11346002)(6506007)(8676002)(14454004)(50226002)(81156014)(2906002)(99286004)(102836004)(6486002)(81166006)(386003)(8936002)(25786009)(186003)(478600001)(26826003)(26005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM4PR0802MB2257;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Fail; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 6fd09a5e-c187-466d-315a-08d76e52380e
NoDisclaimer: True
X-Forefront-PRVS: 0228DDDDD7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SZ9+nDLGmfDZ7tUVWdTAD/0bAq/0IsgJ1a0jPY1C6ucTWIag/Xh7KaASltyB0euVZsfchrrCsjeh2dXEETvtrsVLlQuzA3MuR1d9mJhdRtBDFtoKWgKCKCCFlY100tVU8mKH5YASeT9QeROkdRii/VFJrPiNdRjZBgCfUSCy8D+YDgSsHbOBik2r8zn5tffv1tOSVJZdX+5kqdcuDRm9Hyi5Y0ScWvmMhbhXe3jacRtaAGTr34n+1Qas2+ZmS1pvwejKC+i053TOe5Vu7PTVKzvBskpgYwhHO7NMYrz3zHzFpWnwF9+HBjxeeOIGWMGyU1sRov1bNfjCimOaWiz+GH0S+ZbeFHNJ74nbbdK0/r/exSzhl6C+DMknMPsRFqQ1kIn3GuKhwz5tMFaNlYYd8IPjFNM1M59jNInm1cMcSZ4/Gc5vB0RPcD3Ae416WNww
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2019 07:12:59.3440 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4663def3-0a40-4340-e627-08d76e523d81
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0802MB2257
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IIB/8z50vBuASSq6iSuVafx4DPXkwq7T4HlbSTTsATE=;
 b=KtJUwB971rsWqetTIZzgt9sSjapcCf6AUMSD9s0a5ThUkvUESvbPFB0m0l/6FswTXHADxlNgdzDxK1BDJf5sQdltxtxErSDEAJKNiQRDP1GM0M+pogheIvnzwqwDjpPxnmu1hBt+rG3JNgcZPiTzY3AvGnSoqzVSvEXM0Gtf7c8=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IIB/8z50vBuASSq6iSuVafx4DPXkwq7T4HlbSTTsATE=;
 b=KtJUwB971rsWqetTIZzgt9sSjapcCf6AUMSD9s0a5ThUkvUESvbPFB0m0l/6FswTXHADxlNgdzDxK1BDJf5sQdltxtxErSDEAJKNiQRDP1GM0M+pogheIvnzwqwDjpPxnmu1hBt+rG3JNgcZPiTzY3AvGnSoqzVSvEXM0Gtf7c8=
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
Cc: nd <nd@arm.com>, "Oscar
 Zhang \(Arm Technology China\)" <Oscar.Zhang@arm.com>,
 "Tiannan Zhu \(Arm Technology China\)" <Tiannan.Zhu@arm.com>,
 "Jonathan Chai \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Julien
 Yin \(Arm Technology China\)" <Julien.Yin@arm.com>, "Channing Chen \(Arm
 Technology China\)" <Channing.Chen@arm.com>, "james qian wang \(Arm Technology
 China\)" <james.qian.wang@arm.com>, "Thomas Sun \(Arm Technology
 China\)" <thomas.Sun@arm.com>,
 "Lowry Li \(Arm Technology China\)" <Lowry.Li@arm.com>,
 Ben Davis <Ben.Davis@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW4gc2lkZSBieSBzaWRlIG1vZGUsIGEgd3JpdGViYWNrIGpvYiBpcyBjb21wbGV0ZWQgYnkgdHdv
IHBpcGVsaW5lczogbGVmdApieSBtYXN0ZXIgYW5kIHJpZ2h0IGJ5IHNsYXZlLCB3ZSBuZWVkIHRv
IHdhaXQgYm90aCBwaXBlbGluZSBmaW5pc2hlZCAoRU9XKSwKdGhlbiBjYW4gc2lnbmFsIHRoZSB3
cml0ZWJhY2sgam9iIGNvbXBsZXRpb24uCgpTaWduZWQtb2ZmLWJ5OiBKYW1lcyBRaWFuIFdhbmcg
KEFybSBUZWNobm9sb2d5IENoaW5hKSA8amFtZXMucWlhbi53YW5nQGFybS5jb20+Ci0tLQogLi4u
L2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9jcnRjLmMgIHwgMjMgKysrKysrKysr
Ky0tLS0tLS0tLQogLi4uL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9rbXMuaCAg
IHwgIDUgKysrKwogLi4uL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfd2JfY29ubmVjdG9yLmMg
IHwgIDMgKysrCiAzIGZpbGVzIGNoYW5nZWQsIDIwIGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29t
ZWRhX2NydGMuYyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Ny
dGMuYwppbmRleCAyNDkyOGI5MjJmYmQuLjc4MzUxYjcxMzVmOCAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfY3J0Yy5jCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2NydGMuYwpAQCAtMTkzLDI3ICsxOTMs
MjggQEAga29tZWRhX2NydGNfdW5wcmVwYXJlKHN0cnVjdCBrb21lZGFfY3J0YyAqa2NydGMpCiAJ
cmV0dXJuIGVycjsKIH0KIAotdm9pZCBrb21lZGFfY3J0Y19oYW5kbGVfZXZlbnQoc3RydWN0IGtv
bWVkYV9jcnRjICAgKmtjcnRjLAordm9pZCBrb21lZGFfY3J0Y19oYW5kbGVfZXZlbnQoc3RydWN0
IGtvbWVkYV9jcnRjICprY3J0YywKIAkJCSAgICAgIHN0cnVjdCBrb21lZGFfZXZlbnRzICpldnRz
KQogewogCXN0cnVjdCBkcm1fY3J0YyAqY3J0YyA9ICZrY3J0Yy0+YmFzZTsKKwlzdHJ1Y3Qga29t
ZWRhX3diX2Nvbm5lY3RvciAqd2JfY29ubiA9IGtjcnRjLT53Yl9jb25uOwogCXUzMiBldmVudHMg
PSBldnRzLT5waXBlc1trY3J0Yy0+bWFzdGVyLT5pZF07CiAKIAlpZiAoZXZlbnRzICYgS09NRURB
X0VWRU5UX1ZTWU5DKQogCQlkcm1fY3J0Y19oYW5kbGVfdmJsYW5rKGNydGMpOwogCi0JaWYgKGV2
ZW50cyAmIEtPTUVEQV9FVkVOVF9FT1cpIHsKLQkJc3RydWN0IGtvbWVkYV93Yl9jb25uZWN0b3Ig
KndiX2Nvbm4gPSBrY3J0Yy0+d2JfY29ubjsKKwkvKiBoYW5kbGVzIHdyaXRlYmFjayBldmVudCAq
LworCWlmIChldmVudHMgJiBLT01FREFfRVZFTlRfRU9XKQorCQl3Yl9jb25uLT5jb21wbGV0ZV9w
aXBlcyB8PSBCSVQoa2NydGMtPm1hc3Rlci0+aWQpOwogCi0JCWlmICh3Yl9jb25uKQotCQkJZHJt
X3dyaXRlYmFja19zaWduYWxfY29tcGxldGlvbigmd2JfY29ubi0+YmFzZSwgMCk7Ci0JCWVsc2UK
LQkJCURSTV9XQVJOKCJDUlRDWyVkXTogRU9XIGhhcHBlbiBidXQgbm8gd2JfY29ubmVjdG9yLlxu
IiwKLQkJCQkgZHJtX2NydGNfaW5kZXgoJmtjcnRjLT5iYXNlKSk7CisJaWYgKGtjcnRjLT5zaWRl
X2J5X3NpZGUgJiYKKwkgICAgKGV2dHMtPnBpcGVzW2tjcnRjLT5zbGF2ZS0+aWRdICYgS09NRURB
X0VWRU5UX0VPVykpCisJCXdiX2Nvbm4tPmNvbXBsZXRlX3BpcGVzIHw9IEJJVChrY3J0Yy0+c2xh
dmUtPmlkKTsKKworCWlmICh3Yl9jb25uLT5leHBlY3RlZF9waXBlcyA9PSB3Yl9jb25uLT5jb21w
bGV0ZV9waXBlcykgeworCQl3Yl9jb25uLT5jb21wbGV0ZV9waXBlcyA9IDA7CisJCWRybV93cml0
ZWJhY2tfc2lnbmFsX2NvbXBsZXRpb24oJndiX2Nvbm4tPmJhc2UsIDApOwogCX0KLQkvKiB3aWxs
IGhhbmRsZSBpdCB0b2dldGhlciB3aXRoIHRoZSB3cml0ZSBiYWNrIHN1cHBvcnQgKi8KLQlpZiAo
ZXZlbnRzICYgS09NRURBX0VWRU5UX0VPVykKLQkJRFJNX0RFQlVHKCJFT1cuXG4iKTsKIAogCWlm
IChldmVudHMgJiBLT01FREFfRVZFTlRfRkxJUCkgewogCQl1bnNpZ25lZCBsb25nIGZsYWdzOwpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfa21z
LmggYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9rbXMuaAppbmRl
eCBhZTY2NTRmZTk1ZTIuLjE3NGZiMGEwYjQ5YiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfa21zLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2Fy
bS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfa21zLmgKQEAgLTU4LDYgKzU4LDExIEBAIHN0cnVjdCBr
b21lZGFfd2JfY29ubmVjdG9yIHsKIAogCS8qKiBAd2JfbGF5ZXI6IHJlcHJlc2VudHMgYXNzb2Np
YXRlZCB3cml0ZWJhY2sgcGlwZWxpbmUgb2Yga29tZWRhICovCiAJc3RydWN0IGtvbWVkYV9sYXll
ciAqd2JfbGF5ZXI7CisKKwkvKiogQGV4cGVjdGVkX3BpcGVzOiBwaXBlbGluZXMgYXJlIHVzZWQg
Zm9yIHRoZSB3cml0ZWJhY2sgam9iICovCisJdTMyIGV4cGVjdGVkX3BpcGVzOworCS8qKiBAY29t
cGxldGVfcGlwZXM6IHBpcGVsaW5lcyB3aGljaCBoYXZlIGZpbmlzaGVkIHdyaXRlYmFjayAqLwor
CXUzMiBjb21wbGV0ZV9waXBlczsKIH07CiAKIC8qKgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfd2JfY29ubmVjdG9yLmMgYi9kcml2ZXJzL2dw
dS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV93Yl9jb25uZWN0b3IuYwppbmRleCA0NGU2
Mjg3NDc2NTQuLmQ2ODMzZWEzYjgyMiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybS9k
aXNwbGF5L2tvbWVkYS9rb21lZGFfd2JfY29ubmVjdG9yLmMKKysrIGIvZHJpdmVycy9ncHUvZHJt
L2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfd2JfY29ubmVjdG9yLmMKQEAgLTE1Nyw2ICsxNTcs
OSBAQCBzdGF0aWMgaW50IGtvbWVkYV93Yl9jb25uZWN0b3JfYWRkKHN0cnVjdCBrb21lZGFfa21z
X2RldiAqa21zLAogCQlyZXR1cm4gLUVOT01FTTsKIAogCWt3Yl9jb25uLT53Yl9sYXllciA9IGtj
cnRjLT5tYXN0ZXItPndiX2xheWVyOworCWt3Yl9jb25uLT5leHBlY3RlZF9waXBlcyA9IEJJVChr
Y3J0Yy0+bWFzdGVyLT5pZCk7CisJaWYgKGtjcnRjLT5zaWRlX2J5X3NpZGUpCisJCWt3Yl9jb25u
LT5leHBlY3RlZF9waXBlcyB8PSBCSVQoa2NydGMtPnNsYXZlLT5pZCk7CiAKIAl3Yl9jb25uID0g
Jmt3Yl9jb25uLT5iYXNlOwogCXdiX2Nvbm4tPmVuY29kZXIucG9zc2libGVfY3J0Y3MgPSBCSVQo
ZHJtX2NydGNfaW5kZXgoJmtjcnRjLT5iYXNlKSk7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
