Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AB51C3A3A
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2019 18:18:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78CE96E853;
	Tue,  1 Oct 2019 16:17:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680079.outbound.protection.outlook.com [40.107.68.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF1E66E852;
 Tue,  1 Oct 2019 16:17:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SRRhxUiof5MfZd8ERy+sDov9IxAY5vBl/5zJVPFXH15B/JsBm2amD4I2DmxoSAdQleF0YkXXKzW8d+5fUW7PpZXHlzCPtWms89iI5hBfSKMnO3UNMRUDmqa6yXIEwzjOgvh+NaAyTfyKQzGU84XYwcArCGML6sK1pf/rA+ubXyZyqyWsHvFFODesRFf+YNLP9UgBCfEmoJIO7NvhsgPRVehNrPkucGNQcrXqsb7u5kJBwmLpP81UyBvqlRn82IAhPlLEly5FitxOjp4tAZMvwucsNlBPZ+JnyEA3gtcHl15fnI0gerzvASLCaNy2FNQubc8BYD2RAn0XW273IrFY+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PnBHuuiuQ1sajCrfHlq7oqhaie/z4McnjjT9VodgMm4=;
 b=gIOev/cuTfMa7JlXiWuQIVifzp0s6g2Xibgs5j1haeGgiNYmjPNv0G/LDTdU/TvpzG8pyyo9BzG0vHqIO+R8GlIr9lM/c6cnL2zB7D37SBzvsQccpKNTalwjJ7wayZsV62oIdL7sNqXm+imPloanldLX+lE/wqgrUZYkX8LHlp05aMFvVZpK9j9ynXtV1MV6PJRqpFCqG6N+BvcHf3dDogtwQOuD7hWcyMB3xxzfa2L/PuwXQr/jUnohlnAmULIWf1y879jzHOW5t0RNfxPa8Y4f++DRCsCf6e85tpkSI/KSd0b+9X0p/o0f3Joz5oAxrnkHHmZskVOJOAwVrbtryg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from BN8PR12CA0016.namprd12.prod.outlook.com (2603:10b6:408:60::29)
 by DM6PR12MB2635.namprd12.prod.outlook.com (2603:10b6:5:4a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2305.15; Tue, 1 Oct
 2019 16:17:39 +0000
Received: from CO1NAM03FT027.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::205) by BN8PR12CA0016.outlook.office365.com
 (2603:10b6:408:60::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2241.18 via Frontend
 Transport; Tue, 1 Oct 2019 16:17:38 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 CO1NAM03FT027.mail.protection.outlook.com (10.152.80.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Tue, 1 Oct 2019 16:17:37 +0000
Received: from mlipski-pc.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Tue, 1 Oct 2019
 11:17:34 -0500
From: <mikita.lipski@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 08/14] drm/amd/display: Use correct helpers to compute
 timeslots
Date: Tue, 1 Oct 2019 12:17:15 -0400
Message-ID: <20191001161721.13793-9-mikita.lipski@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191001161721.13793-8-mikita.lipski@amd.com>
References: <20191001161721.13793-1-mikita.lipski@amd.com>
 <20191001161721.13793-2-mikita.lipski@amd.com>
 <20191001161721.13793-3-mikita.lipski@amd.com>
 <20191001161721.13793-4-mikita.lipski@amd.com>
 <20191001161721.13793-5-mikita.lipski@amd.com>
 <20191001161721.13793-6-mikita.lipski@amd.com>
 <20191001161721.13793-7-mikita.lipski@amd.com>
 <20191001161721.13793-8-mikita.lipski@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(346002)(376002)(396003)(428003)(189003)(199004)(81156014)(8676002)(1076003)(426003)(186003)(2876002)(356004)(6666004)(336012)(5660300002)(8936002)(47776003)(81166006)(50226002)(48376002)(2351001)(53416004)(50466002)(86362001)(316002)(16586007)(76176011)(305945005)(70206006)(70586007)(478600001)(54906003)(4326008)(486006)(450100002)(11346002)(446003)(476003)(14444005)(126002)(2616005)(6916009)(26005)(2906002)(7696005)(51416003)(36756003)(16060500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2635; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d415ff6c-1a45-4611-2215-08d7468ae03f
X-MS-TrafficTypeDiagnostic: DM6PR12MB2635:
X-Microsoft-Antispam-PRVS: <DM6PR12MB26357676B43B44699B9A30F0E49D0@DM6PR12MB2635.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-Forefront-PRVS: 0177904E6B
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZUexOwgyT6YFZtk7O7mvN3JiNPO8OIGpAjxxr/ywSYlMHkDfCHTKdFd3/GylqxqZRC+/631J3/+kVU9MZj29b7qVXhJ4SDbcbf0BaeYRU8RBBlLvStqWozt7wz72OQtpkxNYwsLjaQJDQDO1NbTtnBe8XWiG0rgIUAdtHwADlk4chevZOxKYZchd4OJCXlZlwXSV7ZoRQGxcjmhvLlJ2Y1JCJqJJJPICkcEzpfI84xxOWql6ZQL07DTOKGQIphUW8HokXK8r7e6Llt7HzBAF4RbqxGxJuheAzX5OsQvvXqZlzoM7DmqRNwsjiEE67GHQFFlVNhbQsiHrUuPiH1c2v0tSQpPOOfn5YOlByPOiym5okTq64wfVEGHMf3RHMqvScPaHU6MdH4RJTdpVpPgP3hrsPy7EZyAmv95VMBBirnE=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2019 16:17:37.5998 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d415ff6c-1a45-4611-2215-08d7468ae03f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2635
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PnBHuuiuQ1sajCrfHlq7oqhaie/z4McnjjT9VodgMm4=;
 b=k6m2Ew77T77qGxotYCY7Pnc5mYkV1mXoeJnGztOdJ5jbHHuszzwBuMSoGoTIf/KzKwiVgMCKfKJrh/Ygch3UWWe+kIXmLXjm0KdrUQDsGQBksVZ+6NRRlOl3KwMDgDh+klj/g4pLloc3n3n3t7ZaZ0mGu4mhEzjwHE3gFC+F+94=
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
Cc: David Francis <David.Francis@amd.com>, Jerry Zuo <Jerry.Zuo@amd.com>,
 dri-devel@lists.freedesktop.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogRGF2aWQgRnJhbmNpcyA8RGF2aWQuRnJhbmNpc0BhbWQuY29tPgoKV2Ugd2VyZSB1c2lu
ZyBkcm0gaGVscGVycyB0byBjb252ZXJ0IGEgdGltaW5nIGludG8gaXRzCmJhbmR3aWR0aCwgaXRz
IGJhbmR3aWR0aCBpbnRvIHBibiwgYW5kIGl0cyBwYm4gaW50byB0aW1lc2xvdHMKClRoZXNlIGhl
bHBlcnMKLURpZCBub3QgdGFrZSBEU0MgdGltaW5ncyBpbnRvIGFjY291bnQKLVVzZWQgdGhlIGxp
bmsgcmF0ZSBhbmQgbGFuZSBjb3VudCBvZiB0aGUgbGluaydzIGF1eCBkZXZpY2UsCndoaWNoIGFy
ZSBub3QgdGhlIHNhbWUgYXMgdGhlIGxpbmsncyBjdXJyZW50IGNhcAotRGlkIG5vdCB0YWtlIEZF
QyBpbnRvIGFjY291bnQgKEZFQyByZWR1Y2VzIHRoZSBQQk4gcGVyIHRpbWVzbG90KQoKRm9yIGNv
bnZlcnRpbmcgdGltaW5nIGludG8gUEJOLCB1c2UgdGhlIG5ldyBmdW5jdGlvbgpkcm1fZHBfY2Fs
Y19wYm5fbW9kZV9kc2MgdGhhdCBoYW5kbGVzIHRoZSBEU0MgY2FzZQoKRm9yIGNvbnZlcnRpbmcg
UEJOIGludG8gdGltZSBzbG90cywgYW1kZ3B1IGRvZXNuJ3QgdXNlIHRoZQonY29ycmVjdCcgYXRv
bWljIG1ldGhvZCAoZHJtX2RwX2F0b21pY19maW5kX3ZjcGlfc2xvdHMpLCBzbwpkb24ndCBhZGQg
YSBuZXcgaGVscGVyIHRvIGNvdmVyIG91ciBhcHByb2FjaC4gVXNlIHRoZSBzYW1lCm1lYW5zIG9m
IGNhbGN1bGF0aW5nIHBibiBwZXIgdGltZSBzbG90IGFzIHRoZSBEU0MgY29kZS4KCkNjOiBKZXJy
eSBadW8gPEplcnJ5Llp1b0BhbWQuY29tPgpDYzogTmljaG9sYXMgS2F6bGF1c2thcyA8bmljaG9s
YXMua2F6bGF1c2thc0BhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBEYXZpZCBGcmFuY2lzIDxEYXZp
ZC5GcmFuY2lzQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdw
dV9kbS9hbWRncHVfZG1faGVscGVycy5jIHwgNiArKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA2IGlu
c2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1k
Z3B1X2RtL2FtZGdwdV9kbV9oZWxwZXJzLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
YW1kZ3B1X2RtL2FtZGdwdV9kbV9oZWxwZXJzLmMKaW5kZXggNTI1NmFiZTMyZTkyLi5mYzUzN2Fl
MjVlZWIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0v
YW1kZ3B1X2RtX2hlbHBlcnMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1k
Z3B1X2RtL2FtZGdwdV9kbV9oZWxwZXJzLmMKQEAgLTE4NSw2ICsxODUsNyBAQCBib29sIGRtX2hl
bHBlcnNfZHBfbXN0X3dyaXRlX3BheWxvYWRfYWxsb2NhdGlvbl90YWJsZSgKIAlzdHJ1Y3QgZHJt
X2RwX21zdF90b3BvbG9neV9tZ3IgKm1zdF9tZ3I7CiAJc3RydWN0IGRybV9kcF9tc3RfcG9ydCAq
bXN0X3BvcnQ7CiAJYm9vbCByZXQ7CisJaW50IHBibl9wZXJfdGltZXNsb3QgPSAwOwogCiAJYWNv
bm5lY3RvciA9IChzdHJ1Y3QgYW1kZ3B1X2RtX2Nvbm5lY3RvciAqKXN0cmVhbS0+ZG1fc3RyZWFt
X2NvbnRleHQ7CiAKQEAgLTIwMCw2ICsyMDEsMTEgQEAgYm9vbCBkbV9oZWxwZXJzX2RwX21zdF93
cml0ZV9wYXlsb2FkX2FsbG9jYXRpb25fdGFibGUoCiAKIAlpZiAoZW5hYmxlKSB7CiAKKwkJLyog
Q29udmVydCBraWxvYml0cyBwZXIgc2Vjb25kIC8gNjQgKGZvciA2NCB0aW1lc2xvdHMpIHRvIHBi
biAoNTQvNjQgbWVnYWJ5dGVzIHBlciBzZWNvbmQpICovCisJCXBibl9wZXJfdGltZXNsb3QgPSBk
Y19saW5rX2JhbmR3aWR0aF9rYnBzKAorCQkJCXN0cmVhbS0+bGluaywgZGNfbGlua19nZXRfbGlu
a19jYXAoc3RyZWFtLT5saW5rKSkgLyAoOCAqIDEwMDAgKiA1NCk7CisJCWFjb25uZWN0b3ItPnZj
cGlfc2xvdHMgPSBESVZfUk9VTkRfVVAoYWNvbm5lY3Rvci0+cGJuLCBwYm5fcGVyX3RpbWVzbG90
KTsKKwogCQlyZXQgPSBkcm1fZHBfbXN0X2FsbG9jYXRlX3ZjcGkobXN0X21nciwgbXN0X3BvcnQs
CiAJCQkJCSAgICAgICBhY29ubmVjdG9yLT5wYm4sCiAJCQkJCSAgICAgICBhY29ubmVjdG9yLT52
Y3BpX3Nsb3RzKTsKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
