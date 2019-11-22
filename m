Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B3F42107790
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2019 19:46:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 702D06F553;
	Fri, 22 Nov 2019 18:46:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720057.outbound.protection.outlook.com [40.107.72.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 605016F553;
 Fri, 22 Nov 2019 18:46:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Onk2sZVinHnmjFgyJbSijX52gFfqMBHvHX1nDbVxvpFmKgyrGMGrVDqUeCk9TVRRTnWmK3/p+5AGHZklC/XJWoHJ1Hl3jz1FWwTX1fBkw2qXg9x2N9bJzZ84dPzVKYcGjSRPeLORg6mzJYoh01A30OSjMytGD2e//jOjVcgQugFxDZ149YXUySTgYzCWySKnehG2qUKx9Qrb37WzTujcLjhsXFWWWh/UeelqaYech5zgHoum3+yXa5DiSVGSWRvHkkJEDqsTQ6Dbdp5shMqWZe80GMzHOjtYEDzs0PkU/9U9DFGSN3XfUokOTDBkQGvX660DTRoja7LPV6kO5WNJ+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DypjvU3KV7wqJxAIsWH8LhAgE33OjE8pzJDCJ5qNn7w=;
 b=IJL7LkJ/OAzuMYlkOOtDhCTT+x4/9MHAJhQYh5fS9P78tKm+qavmMiKBqO5a1xe19xt9Lmdz1/mY3MqWdz+MK1wezQgJbDRjcWy/3JS49UI4FVtWiWO02WNRZvvrctFc0A47P8vGj+qk8gZrQZWKJrAroeb1S28IkvU1a7vKJ5x2DZ/LP9pB5sQPzEP/dU0zL88Vshy6xCCcS00aEIm5+9Sj6Ak6rVjHCkVXXmJ3ojC78BRxJp344gfUzBc7TCprnuNh7Bc+N3ZaBquVGaiswgcIBrHs1NFM3I2IYImsGB4dxpEjhWLxykWCbrHAmswipP6zzse0Ajg+ZACKr2Uy4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from BN4PR12CA0009.namprd12.prod.outlook.com (2603:10b6:403:2::19)
 by BL0PR12MB2499.namprd12.prod.outlook.com (2603:10b6:207:43::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2474.17; Fri, 22 Nov
 2019 18:46:36 +0000
Received: from DM6NAM11FT005.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eaa::209) by BN4PR12CA0009.outlook.office365.com
 (2603:10b6:403:2::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2474.17 via Frontend
 Transport; Fri, 22 Nov 2019 18:46:36 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 DM6NAM11FT005.mail.protection.outlook.com (10.13.172.238) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.2451.23 via Frontend Transport; Fri, 22 Nov 2019 18:46:35 +0000
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Fri, 22 Nov
 2019 12:46:35 -0600
Received: from mlipski-pc.amd.com (10.180.168.240) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Fri, 22 Nov 2019 12:46:34 -0600
From: <mikita.lipski@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v2] drm/dsc: Return unsigned long on compute offset
Date: Fri, 22 Nov 2019 13:46:25 -0500
Message-ID: <20191122184625.20151-1-mikita.lipski@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(376002)(346002)(136003)(396003)(428003)(189003)(199004)(305945005)(26005)(8936002)(6666004)(356004)(186003)(2876002)(81156014)(86362001)(426003)(50466002)(53416004)(2616005)(81166006)(50226002)(54906003)(2351001)(8676002)(316002)(336012)(36756003)(70586007)(4326008)(478600001)(2870700001)(70206006)(1076003)(5820100001)(7696005)(6916009)(23676004)(47776003)(2906002)(5660300002)(16060500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BL0PR12MB2499; H:SATLEXMB01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0954f7e0-4303-47c4-ea21-08d76f7c4d36
X-MS-TrafficTypeDiagnostic: BL0PR12MB2499:
X-Microsoft-Antispam-PRVS: <BL0PR12MB2499F374A57F559796EA91DEE4490@BL0PR12MB2499.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-Forefront-PRVS: 02296943FF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dkFWeDVDVkY1RnoxYWVVZjcyR21JYnJ3akRtNVVTYVZ3MTM0M0paSkUxZ3Az?=
 =?utf-8?B?blRubS9RaW56b0xEZFhpc1IwU3hmcWZzM2RyakhCdDZ0R1hvTG5ha3VJS3ky?=
 =?utf-8?B?bVV4WlJuNnBzZHE5eVBNTUFmZTBGSHA1ajJOMXdjT21jZEFKZ002VjdFUVVq?=
 =?utf-8?B?bmt3VHBpeDVUNVVMdU81THhyVnpSc2VQRkdIQzY2dGh3aXhDWkt2Mnc5dmYz?=
 =?utf-8?B?d1BLajBzSHhIQ0V5dG8ySjZpZXB6ejFkR1hJa1dCb2llU1NtMDBVNUdGM0FY?=
 =?utf-8?B?RlM2alhvc0NCQzRLY3hIYmNkc3BFZW1sK0tZU3d6bE44bTlTRnhtTlFEcms5?=
 =?utf-8?B?YVQwZkNFUFdXTFo5ZVVtajY5ZThML3dmdnVlTEFJdTBFY0VtQTNaSTBUeEEz?=
 =?utf-8?B?MjdYZkl3Mlg5eWdqcnlINGI5bHdRbTlJNTg0TmVleHhZUWsydHJTa1dqcnJ3?=
 =?utf-8?B?NHRJREF0YmkzRWxueWY3NWJSTS9LbUt5R2Y4Mmg3U2ZpZFk0RktPVXR2VzU5?=
 =?utf-8?B?YXVpb1lxbmFmYzBIdXpnMXUzdTNFenRZL3pEMVhqcTNobElyaEhMVlVMN2Qy?=
 =?utf-8?B?SzF6NERiV2RBUnYvbm91cC8zZlFoRmI5VEF5blFyWjIxSGRraUN0M3hac0pq?=
 =?utf-8?B?OURQMFd3Y0J6L3J1bTdJM0ZOUTFmeDdoS05Yc2dYQmFnYTV5c01BenFYSGFS?=
 =?utf-8?B?NGJ1Yzh2M0w3UHI5Z2RzcW1DQ0hIcVVkc2kwa3lyektRYnM5blpOZDlsUkha?=
 =?utf-8?B?OEZZcHRHRkdRR0I0eG5tZC9aZE4vMDFqUFVUTEt3c2p6QVZ4d2ZtOTdlR0t4?=
 =?utf-8?B?Z2UxcDQ5aUFpclRNR2xDdDFJdE5ibmM3enEvN0JtS2xBMlMvczhSV3pDK3cz?=
 =?utf-8?B?b2lXYjRkK2thaHdtMy84TU13QmlKQVFRUjVaQm1HQUlsRjF2Z085OGJ4NzVx?=
 =?utf-8?B?VFpFaGk5SDFZT1RRSkFyTHdlOGR2N1FmSCtPOFZsTlFLNzMveUprcG5hdXFo?=
 =?utf-8?B?Ri91TVh6dzdtckU3c1E4YzhxQlNqS0JTcS81QWZwUE4rQ0phUEU2NHdROERZ?=
 =?utf-8?B?bTJ6K2tDeSs2K3dTUGlkdzdmM0JMazZYK0M1dWVka3RKZWN4aFFvSnhzTWh1?=
 =?utf-8?B?R290eVNWek1OWVg5eVN4aWUyMVErY0RRTWdhNmdDeGtTek5DZ3ZhV3E0RHdm?=
 =?utf-8?B?SURWeVpMeWxvcWZjam9xc3JlNGhXMHpxSjFUS0pDU25HWjl4MzJFUjdKQUY3?=
 =?utf-8?B?aEZnMDhBdWZ4KzBrSksxSElCVGlSNHBGSWp6SzF6bXMrbExrVkgzU3lUMlBS?=
 =?utf-8?B?Qk5jVERkY0NZWVN1clVsRUZhZ0hOcHhrcWhQb3c0Si9Rc3J2eURXVG9BSTdQ?=
 =?utf-8?B?QVhXQ1lDaUtKS0FjaW5oTDU4NEVxMTlvcXhaY3NnTG4yQWhQbklXbTZmZG1y?=
 =?utf-8?B?TThxQ1Z0Uk8yL3RrMkx1NkEwbzlXK2xzMmJ0SGk3NXE5TjJxSGdDVUIwYWcy?=
 =?utf-8?B?U1B5RVpYZ0E4R2ppL0RVY0pObm1wTGpJM1NYb1pOWm1yZXZwSnJFUXdXQnFD?=
 =?utf-8?B?YXcxWGUycEhzTXlkTWtPbXg5RmtWb2F4WGxGaCtmdENZWkM5d1ZQZnN5VDVJ?=
 =?utf-8?B?RnFrRDZ1c0JXckR0dHUrcTk0QU5uNzJUNkJhYUlwMGtVNmtDa1k3SEZDWWJl?=
 =?utf-8?B?bS9JN3BYS3ozaW5NMGM3dmx6cHovQWh1QmI2VjAzQkpkamZxckV4bzhEQ3hP?=
 =?utf-8?B?bXJSQ0NxYVdIYzFHeE1GMDRYOHFiN0o5dEt1OHRZOXNybGg2Rm5ycEFSUlkv?=
 =?utf-8?B?R3pjT2NiTHhPcEkzQk92NE5KaElSTmlHY3hXQmxPWENIa0xjR2VWOVY5dHE4?=
 =?utf-8?B?VXJ3RCs5ZU5DTUVSTGluL21mZ0hTQmVLWCtJOU5WZGhRV21MMFEwT0Z5MXpm?=
 =?utf-8?Q?uOBhhlQyDgWyCvpZ/BjlKPJIxbT/WV+j?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2019 18:46:35.7386 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0954f7e0-4303-47c4-ea21-08d76f7c4d36
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2499
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DypjvU3KV7wqJxAIsWH8LhAgE33OjE8pzJDCJ5qNn7w=;
 b=JfKlIHiZavk1cEdMo98DQYCQ4t9R5OthRkHc8f9b2kGH0LX+i6+yZuX0FZKO4l4gFUdtQEuB22hp+WfgUFRHts1chcS2RH10T9YY/VPesQf/agpwBwF/EfsIIgVdfIPlR11HG2Ef23vC1ZvEagnh7CuUcuXOmJobuHDKZVBLEQg=
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
Cc: Mikita Lipski <mikita.lipski@amd.com>, dri-devel@lists.freedesktop.org,
 Nikola Cornij <nikola.cornij@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogTWlraXRhIExpcHNraSA8bWlraXRhLmxpcHNraUBhbWQuY29tPgoKV2Ugc2hvdWxkbid0
IGNvbXBhcmUgaW50IHdpdGggdW5zaWduZWQgbG9uZyB0byBmaW5kIHRoZSBtYXggdmFsdWUKYW5k
IHNpbmNlIHdlIGFyZSBub3QgZXhwZWN0aW5nIG5lZ2F0aXZlIHZhbHVlIHJldHVybmVkIGZyb20K
Y29tcHV0ZV9vZmZzZXQgd2Ugc2hvdWxkIG1ha2UgdGhpcyBmdW5jdGlvbiByZXR1cm4gdW5zaWdu
ZWQgbG9uZwpzbyB3ZSBjYW4gY29tcGFyZSB0aGUgdmFsdWVzIHdoZW4gY29tcHV0aW5nIHJjIHBh
cmFtZXRlcnMuCgp2MjogTW9kaWZpZWQgZnVuY3Rpb24gcGFyYW1ldGVycyB0byB1bnNpZ25lZCB0
eXBlIGZvciB0eXBlCmNvbnNpc3RlbmN5CgpDYzogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJq
YWxhQGxpbnV4LmludGVsLmNvbT4KQ2M6IE5pa29sYSBDb3JuaWogPG5pa29sYS5jb3JuaWpAYW1k
LmNvbT4KQ2M6IEhhcnJ5IFdlbnRsYW5kIDxoYXJyeS53ZW50bGFuZEBhbWQuY29tPgpTaWduZWQt
b2ZmLWJ5OiBNaWtpdGEgTGlwc2tpIDxtaWtpdGEubGlwc2tpQGFtZC5jb20+Ci0tLQogZHJpdmVy
cy9ncHUvZHJtL2RybV9kc2MuYyB8IDggKysrKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2Vy
dGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ry
bV9kc2MuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHNjLmMKaW5kZXggNzRmMzUyN2Y1NjdkLi5j
Y2NlMDI5N2RhNjQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHNjLmMKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2RybV9kc2MuYwpAQCAtMjQ1LDExICsyNDUsMTEgQEAgdm9pZCBkcm1f
ZHNjX3Bwc19wYXlsb2FkX3BhY2soc3RydWN0IGRybV9kc2NfcGljdHVyZV9wYXJhbWV0ZXJfc2V0
ICpwcHNfcGF5bG9hZCwKIH0KIEVYUE9SVF9TWU1CT0woZHJtX2RzY19wcHNfcGF5bG9hZF9wYWNr
KTsKIAotc3RhdGljIGludCBjb21wdXRlX29mZnNldChzdHJ1Y3QgZHJtX2RzY19jb25maWcgKnZk
c2NfY2ZnLCBpbnQgcGl4ZWxzX3Blcl9ncm91cCwKLQkJCQlpbnQgZ3JvdXBzX3Blcl9saW5lLCBp
bnQgZ3JwY250KQorc3RhdGljIHVuc2lnbmVkIGxvbmcgY29tcHV0ZV9vZmZzZXQoc3RydWN0IGRy
bV9kc2NfY29uZmlnICp2ZHNjX2NmZywgdW5zaWduZWQgaW50IHBpeGVsc19wZXJfZ3JvdXAsCisJ
CQkJdW5zaWduZWQgbG9uZyBncm91cHNfcGVyX2xpbmUsIHVuc2lnbmVkIGxvbmcgZ3JwY250KQog
ewotCWludCBvZmZzZXQgPSAwOwotCWludCBncnBjbnRfaWQgPSBESVZfUk9VTkRfVVAodmRzY19j
ZmctPmluaXRpYWxfeG1pdF9kZWxheSwgcGl4ZWxzX3Blcl9ncm91cCk7CisJdW5zaWduZWQgbG9u
ZyBvZmZzZXQgPSAwOworCXVuc2lnbmVkIGxvbmcgZ3JwY250X2lkID0gRElWX1JPVU5EX1VQKHZk
c2NfY2ZnLT5pbml0aWFsX3htaXRfZGVsYXksIHBpeGVsc19wZXJfZ3JvdXApOwogCiAJaWYgKGdy
cGNudCA8PSBncnBjbnRfaWQpCiAJCW9mZnNldCA9IERJVl9ST1VORF9VUChncnBjbnQgKiBwaXhl
bHNfcGVyX2dyb3VwICogdmRzY19jZmctPmJpdHNfcGVyX3BpeGVsLCAxNik7Ci0tIAoyLjE3LjEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
