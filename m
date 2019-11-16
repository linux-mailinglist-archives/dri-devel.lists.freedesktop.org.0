Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0C00FF5F3
	for <lists+dri-devel@lfdr.de>; Sat, 16 Nov 2019 23:02:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D9876E228;
	Sat, 16 Nov 2019 22:01:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730066.outbound.protection.outlook.com [40.107.73.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BBD26E1DE;
 Sat, 16 Nov 2019 22:01:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y+4u/+Hzhmm0d7qBFDA/IPWDeqdnUfPVQLpWXGLxaTKOPr3Yn3DbMhBWRmaO5afpIhvzx3+yZszyLFGai0bVab/w/zTuFxTr4/M9h+DWoOQVE8rLGou35Ad8XEc50qJg0ccz6YIj51EPCMJN7LMRGtQ6+KqW+zI2UVK5GwVWntEInwI58CHq0a31g8o70tPvwxTLWJuaRGKSBT8kYJ5FGZZcKFv+aXhG7pX5wzg6io4K09gz9j6YU5DQXmBNX8EMznbLzf7FgH+/IDie9+b9Q1KPnYHux5dvsmyTTkUV5Nux7aJ0vu1/FkBHy6kx/gx/PFJEtMvQuztT5aGBUWsZOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rGffw++GcIoVH9cDtEblgrFCmSbULbwOTaXVlSsslHA=;
 b=GIOv81XuO/yj7Zkh0MUcLc40rWNrPGRWPaHexR0/xWxrSM/KQ41+EPqPp+UWl036rg3j+bMsHMW5xSRxaD8GwT8qbJ/gTw3XzF003IDY22CeRemkyoCj/2kpBBejBFoJYbv6A6e7DMBg3mThAnD8NRMusYboIefaeLXl+DQKWAFaiRsJS8Wgr3hFsbpVGWmpzkjg7R/R+GYLPlLuN/9EakcZ3Gqe5sKdaIW6EoinwOeazMibzjNKnzQmOXj8OaMWKeaCUARtGjBEIRu++K3ACzYm4mHi89IWe0fV1S3O5RqN6V8XTlPpR8HNdGZuyrkIwMSuDN7HLElXNInpgMWW/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from CY4PR1201CA0017.namprd12.prod.outlook.com
 (2603:10b6:910:16::27) by BYAPR12MB3285.namprd12.prod.outlook.com
 (2603:10b6:a03:134::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2451.30; Sat, 16 Nov
 2019 22:01:38 +0000
Received: from CO1NAM11FT025.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eab::200) by CY4PR1201CA0017.outlook.office365.com
 (2603:10b6:910:16::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2451.23 via Frontend
 Transport; Sat, 16 Nov 2019 22:01:38 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 CO1NAM11FT025.mail.protection.outlook.com (10.13.175.232) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2451.23 via Frontend Transport; Sat, 16 Nov 2019 22:01:38 +0000
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Sat, 16 Nov
 2019 16:01:35 -0600
Received: from mlipski-pc.amd.com (10.180.168.240) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Sat, 16 Nov 2019 16:01:35 -0600
From: <mikita.lipski@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v7 07/17] drm/amd/display: Initialize DSC PPS variables to 0
Date: Sat, 16 Nov 2019 17:01:18 -0500
Message-ID: <20191116220128.16598-8-mikita.lipski@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191116220128.16598-1-mikita.lipski@amd.com>
References: <20191116220128.16598-1-mikita.lipski@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(39860400002)(376002)(346002)(428003)(199004)(189003)(2876002)(305945005)(316002)(2616005)(476003)(1076003)(6916009)(446003)(126002)(7696005)(51416003)(76176011)(11346002)(6666004)(2351001)(486006)(47776003)(356004)(86362001)(4326008)(8936002)(36756003)(478600001)(50466002)(5660300002)(50226002)(53416004)(8676002)(81166006)(81156014)(186003)(2906002)(48376002)(54906003)(336012)(16586007)(426003)(70206006)(26005)(70586007)(16060500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB3285; H:SATLEXMB02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6dd975db-d7eb-4bf4-5775-08d76ae08e2c
X-MS-TrafficTypeDiagnostic: BYAPR12MB3285:
X-Microsoft-Antispam-PRVS: <BYAPR12MB3285605176E65DE42E88DF19E4730@BYAPR12MB3285.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:345;
X-Forefront-PRVS: 02234DBFF6
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: v8ykuuUmVB7BtLpxecMZppWudLvSquezHj+i6Ito1JBPxYlrJ02F6vLDt/AlDPUqopj+7zF2HSpbLIohtLcKGjnxPekTf4CCIIrVtl7QpZLcxpdFlaAqG7yCFDhKY58KdLNg6cdmarEJ/B4CihE0hFVTNXfpyxpuc9F5vo7SR1DGCHeK9xRdrgtwV1vCXAXWYSrkgpOqkdRfZPuNQmjnKtDtA7OCTLkiKEeRNI7EMWOjdKKGLC7sGtFae//KElRif1/0YJv0fh50NhoKTkrOsfkxfWOEKa1wSDYOwrz/c4kxJCJFyE117r4QnjWMl48h62A71dBf4A8puzVSXDnDdSDrp5cU77tYhHdIf9imrI5i0yTgisnfdaGZEa45qmF/OoRVXJ/GyB4ObKKpbI5PT7lKns7xPx3V8PjqgyJ88aG2E+A8ZjZZa73UDGABu+QQ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2019 22:01:38.5118 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dd975db-d7eb-4bf4-5775-08d76ae08e2c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3285
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rGffw++GcIoVH9cDtEblgrFCmSbULbwOTaXVlSsslHA=;
 b=NJxIE6BW+zwUouuq3oHgR4DWLtVpMtwWXMM++YzMOIXseDOyNrVLwZWQtVE7FimeqhufcOgIKvANIgZV9RSd5i59nYpoGYn+tE3U5gCSTTA02lhJ46jTk3lKgz5vYk9m0/hZ1yZazE3iD/2s5uAFYsNjc+tNiGlwfYnwOdM5H1E=
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
Cc: David Francis <David.Francis@amd.com>, Mikita
 Lipski <mikita.lipski@amd.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogRGF2aWQgRnJhbmNpcyA8RGF2aWQuRnJhbmNpc0BhbWQuY29tPgoKRm9yIERTQyBNU1Qs
IHNvbWV0aW1lcyBtb25pdG9ycyB3b3VsZCBicmVhayBvdXQKaW4gZnVsbC1zY3JlZW4gc3RhdGlj
LiBUaGUgaXNzdWUgdHJhY2VkIGJhY2sgdG8gdGhlClBQUyBnZW5lcmF0aW9uIGNvZGUsIHdoZXJl
IHRoZXNlIHZhcmlhYmxlcyB3ZXJlIGJlaW5nIHVzZWQKdW5pbml0aWFsaXplZCBhbmQgd2VyZSBw
aWNraW5nIHVwIGdhcmJhZ2UuCgptZW1zZXQgdG8gMCB0byBhdm9pZCB0aGlzCgpSZXZpZXdlZC1i
eTogTmljaG9sYXMgS2F6bGF1c2thcyA8bmljaG9sYXMua2F6bGF1c2thc0BhbWQuY29tPgpTaWdu
ZWQtb2ZmLWJ5OiBEYXZpZCBGcmFuY2lzIDxEYXZpZC5GcmFuY2lzQGFtZC5jb20+ClNpZ25lZC1v
ZmYtYnk6IE1pa2l0YSBMaXBza2kgPG1pa2l0YS5saXBza2lAYW1kLmNvbT4KLS0tCiBkcml2ZXJz
L2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19saW5rX2h3c3MuYyB8IDMgKysrCiBkcml2
ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfZHNjLmMgICB8IDMgKysrCiAy
IGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX2xpbmtfaHdzcy5jIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfbGlua19od3NzLmMKaW5kZXggYmIxZThlNWI1MjUyLi5h
N2YzYTllY2M2MjYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9j
b3JlL2RjX2xpbmtfaHdzcy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9j
b3JlL2RjX2xpbmtfaHdzcy5jCkBAIC01MjYsNiArNTI2LDkgQEAgYm9vbCBkcF9zZXRfZHNjX3Bw
c19zZHAoc3RydWN0IHBpcGVfY3R4ICpwaXBlX2N0eCwgYm9vbCBlbmFibGUpCiAJCXN0cnVjdCBk
c2NfY29uZmlnIGRzY19jZmc7CiAJCXVpbnQ4X3QgZHNjX3BhY2tlZF9wcHNbMTI4XTsKIAorCQlt
ZW1zZXQoJmRzY19jZmcsIDAsIHNpemVvZihkc2NfY2ZnKSk7CisJCW1lbXNldChkc2NfcGFja2Vk
X3BwcywgMCwgMTI4KTsKKwogCQkvKiBFbmFibGUgRFNDIGh3IGJsb2NrICovCiAJCWRzY19jZmcu
cGljX3dpZHRoID0gc3RyZWFtLT50aW1pbmcuaF9hZGRyZXNzYWJsZSArIHN0cmVhbS0+dGltaW5n
LmhfYm9yZGVyX2xlZnQgKyBzdHJlYW0tPnRpbWluZy5oX2JvcmRlcl9yaWdodDsKIAkJZHNjX2Nm
Zy5waWNfaGVpZ2h0ID0gc3RyZWFtLT50aW1pbmcudl9hZGRyZXNzYWJsZSArIHN0cmVhbS0+dGlt
aW5nLnZfYm9yZGVyX3RvcCArIHN0cmVhbS0+dGltaW5nLnZfYm9yZGVyX2JvdHRvbTsKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9kc2MuYyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9kc2MuYwppbmRleCAw
MTExNTQ1ZGFjNzUuLjZiZGZlZTIwYjZhNyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX2RzYy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
ZGlzcGxheS9kYy9kY24yMC9kY24yMF9kc2MuYwpAQCAtMjA2LDYgKzIwNiw5IEBAIHN0YXRpYyBi
b29sIGRzYzJfZ2V0X3BhY2tlZF9wcHMoc3RydWN0IGRpc3BsYXlfc3RyZWFtX2NvbXByZXNzb3Ig
KmRzYywgY29uc3Qgc3RyCiAJc3RydWN0IGRzY19yZWdfdmFsdWVzIGRzY19yZWdfdmFsczsKIAlz
dHJ1Y3QgZHNjX29wdGNfY29uZmlnIGRzY19vcHRjX2NmZzsKIAorCW1lbXNldCgmZHNjX3JlZ192
YWxzLCAwLCBzaXplb2YoZHNjX3JlZ192YWxzKSk7CisJbWVtc2V0KCZkc2Nfb3B0Y19jZmcsIDAs
IHNpemVvZihkc2Nfb3B0Y19jZmcpKTsKKwogCURDX0xPR19EU0MoIkdldHRpbmcgcGFja2VkIERT
QyBQUFMgZm9yIERTQyBDb25maWc6Iik7CiAJZHNjX2NvbmZpZ19sb2coZHNjLCBkc2NfY2ZnKTsK
IAlEQ19MT0dfRFNDKCJEU0MgUGljdHVyZSBQYXJhbWV0ZXIgU2V0IChQUFMpOiIpOwotLSAKMi4x
Ny4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
