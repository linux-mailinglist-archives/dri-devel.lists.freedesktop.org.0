Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AB0D5FD45
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2019 21:06:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A0F26E3C7;
	Thu,  4 Jul 2019 19:06:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740078.outbound.protection.outlook.com [40.107.74.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 831DB6E3CE;
 Thu,  4 Jul 2019 19:06:32 +0000 (UTC)
Received: from BN8PR12CA0009.namprd12.prod.outlook.com (2603:10b6:408:60::22)
 by DM5PR12MB1193.namprd12.prod.outlook.com (2603:10b6:3:70::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.20; Thu, 4 Jul 2019 19:06:30 +0000
Received: from DM3NAM03FT017.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::204) by BN8PR12CA0009.outlook.office365.com
 (2603:10b6:408:60::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2032.17 via Frontend
 Transport; Thu, 4 Jul 2019 19:06:30 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT017.mail.protection.outlook.com (10.152.82.201) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Thu, 4 Jul 2019 19:06:29 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1;
 Thu, 4 Jul 2019 14:06:22 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 06/10] drm/amd/display: Use connector kdev as aux device parent
Date: Thu, 4 Jul 2019 15:05:15 -0400
Message-ID: <20190704190519.29525-7-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190704190519.29525-1-sunpeng.li@amd.com>
References: <20190704190519.29525-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(346002)(39860400002)(136003)(376002)(2980300002)(428003)(189003)(199004)(126002)(70586007)(68736007)(305945005)(5660300002)(47776003)(478600001)(50226002)(2616005)(2906002)(426003)(446003)(2870700001)(2876002)(70206006)(486006)(476003)(36756003)(110136005)(53936002)(77096007)(81166006)(6666004)(356004)(48376002)(186003)(14444005)(54906003)(4326008)(336012)(50466002)(11346002)(316002)(8676002)(49486002)(26005)(1076003)(76176011)(72206003)(51416003)(86362001)(81156014)(8936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1193; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ca282082-25fe-416b-14a2-08d700b2b8c2
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:DM5PR12MB1193; 
X-MS-TrafficTypeDiagnostic: DM5PR12MB1193:
X-Microsoft-Antispam-PRVS: <DM5PR12MB1193BEC3B8A20985EA191DE582FA0@DM5PR12MB1193.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-Forefront-PRVS: 0088C92887
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: UnQzGUSeyEt8BgO7BI6Of5Qs9MoR0V9d1Rw9W6bYOiNcV4GXmqTUpQcMOnKWG7rbrQxq6ga5gZ4Jbc6yHqIZn39C5KLYlEC580G4JaJ3QBMRqdPL5j++BH7pLiwWWHfyKKe3hw1J5C+/va93xQXtAzrCVTuJNZotmI7Mr4zf+vabb+Mgup2Coc7EHEZ2B/7L1NyekFL3DN0flcchV5XXYXxxkYQknZnv35N81Qgy3iA9L7beOTCoxFMBsHbDHGXbQ2NI+1JUbk9kPACvkEW4ybkfY+BYdusTcKgjjpbpLENokXL9RGa6FHhHSe/ncntk27ahbe84wrX0ZnnReXHtpyKYp8NOaG5J4QG9+h6KvepFyJeS2BfSGeKyykgIfWrZwN4vaYjTxHz1D3NtbCG1O0MkEW2J6gnDrivIsY1kdQc=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2019 19:06:29.7138 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ca282082-25fe-416b-14a2-08d700b2b8c2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1193
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ITmCUh6iv5B9UsKOHh6GC4ZjRYk514mEnMGiKRgjcC8=;
 b=CPSTqj5cIzTig0nCLkZ1HXLunght7AWsptwSZ3KNf2BMCWrIous8QmHDMFm4zGVDT8+eWcXtGljr41h2+qrcWUeVMFuhMy91X/WkCpAdjDq0jiX1ImsaP15v+/oAqLt3UlIGmgmUO083+NO50aXe8Gt61QL553EHQgXrdTrVJz0=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is
 165.204.84.17)
 smtp.mailfrom=amd.com; redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=permerror action=none header.from=amd.com;
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
Cc: Leo Li <sunpeng.li@amd.com>, Jerry Zuo <Jerry.Zuo@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogTGVvIExpIDxzdW5wZW5nLmxpQGFtZC5jb20+CgpTZXQgdGhlIGNvbm5lY3RvcidzIGtl
cm5lbCBkZXZpY2UgYXMgdGhlIHBhcmVudCBmb3IgdGhlIGF1eCBrZXJuZWwKZGV2aWNlLiBUaGlz
IGFsbG93cyB1ZGV2IHJ1bGVzIHRvIGFjY2VzcyBjb25uZWN0b3IgYXR0cmlidXRlcyB3aGVuCmNy
ZWF0aW5nIHN5bWxpbmtzIHRvIGF1eCBkZXZpY2VzLgoKRm9yIGV4YW1wbGUsIHRoZSBmb2xsb3dp
bmcgdWRldiBydWxlOgoKU1VCU1lTVEVNPT0iZHJtX2RwX2F1eF9kZXYiLCBTVUJTWVNURU1TPT0i
ZHJtIiwgQVRUUlN7ZWRpZH09PSIqIiwKCVNZTUxJTksrPSJkcm1fZHBfYXV4L2J5LW5hbWUvJGlk
IgoKV2lsbCBjcmVhdGUgdGhlIGZvbGxvd2luZyBzeW1saW5rcyB1c2luZyB0aGUgY29ubmVjdG9y
J3MgbmFtZToKCiQgbHMgL2Rldi9kcm1fZHBfYXV4L2J5LW5hbWUvCmNhcmQwLURQLTEgIGNhcmQw
LURQLTIgIGNhcmQwLURQLTMKCkNjOiBOaWNob2xhcyBLYXpsYXVza2FzIDxuaWNob2xhcy5rYXps
YXVza2FzQGFtZC5jb20+CkNjOiBKZXJyeSAoRmFuZ3poaSkgWnVvIDxKZXJyeS5adW9AYW1kLmNv
bT4KU2lnbmVkLW9mZi1ieTogTGVvIExpIDxzdW5wZW5nLmxpQGFtZC5jb20+Ci0tLQogZHJpdmVy
cy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1fbXN0X3R5cGVzLmMgfCAy
ICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9t
c3RfdHlwZXMuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1
X2RtX21zdF90eXBlcy5jCmluZGV4IDZlMjA1ZWUzNmFjMy4uNTNkMmNmZTYyZTEzIDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9tc3Rf
dHlwZXMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdw
dV9kbV9tc3RfdHlwZXMuYwpAQCAtMzg4LDcgKzM4OCw3IEBAIHZvaWQgYW1kZ3B1X2RtX2luaXRp
YWxpemVfZHBfY29ubmVjdG9yKHN0cnVjdCBhbWRncHVfZGlzcGxheV9tYW5hZ2VyICpkbSwKIAkJ
CQkgICAgICAgc3RydWN0IGFtZGdwdV9kbV9jb25uZWN0b3IgKmFjb25uZWN0b3IpCiB7CiAJYWNv
bm5lY3Rvci0+ZG1fZHBfYXV4LmF1eC5uYW1lID0gImRtZGMiOwotCWFjb25uZWN0b3ItPmRtX2Rw
X2F1eC5hdXguZGV2ID0gZG0tPmFkZXYtPmRldjsKKwlhY29ubmVjdG9yLT5kbV9kcF9hdXguYXV4
LmRldiA9IGFjb25uZWN0b3ItPmJhc2Uua2RldjsKIAlhY29ubmVjdG9yLT5kbV9kcF9hdXguYXV4
LnRyYW5zZmVyID0gZG1fZHBfYXV4X3RyYW5zZmVyOwogCWFjb25uZWN0b3ItPmRtX2RwX2F1eC5k
ZGNfc2VydmljZSA9IGFjb25uZWN0b3ItPmRjX2xpbmstPmRkYzsKIAotLSAKMi4yMi4wCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
