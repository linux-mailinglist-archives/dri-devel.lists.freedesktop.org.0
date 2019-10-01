Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E6085C3A48
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2019 18:18:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4EBE6E861;
	Tue,  1 Oct 2019 16:17:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720083.outbound.protection.outlook.com [40.107.72.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE71A6E85C;
 Tue,  1 Oct 2019 16:17:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YYsIJOtwi/7NB1aRoARZxLSqsp+u5Tzl7hTY1dXZ9tlDLRkwRCmZtZI1hp0dxXPhsJN1r/vTf0tGSpplYG24JC72bGpcS0j5AvncZdrfCxcXZncf9/NlbEiLa4MWTaKU4MhET7CGw2dx8+ZZEJbXOQq2DozkeHAZJHr2/pT2m9tKjM5luYVmabf2BRkwe8lHsH4hd814oFNKKnn2CVYKsndhzgi7i54glLA6Tv0HT++N70fNuzUpiZsAckYrG0SIHBXafkvrdRjbLiAnYnU4JVkOxYjxTQAxxQNKwyKkYZwqlncILUk5+H90+vOoPRVNUGypqyJaVMCbIhu3xhxOuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zhgE7SnYNUh+YgxEXWIAEBbXDLkxlHvQje5tJoKA9yQ=;
 b=VYj8sZT9TGXvDfL/C86KVUsb/DlxiQvgPs0Cg8Z12sbTxrxCMwEHeRR9iaPPb9xtrfOCSP3jxZR219ZtPk76pU9HJV0YjQXtg0ndGds2nKg7AZm6L9KWZL4B9pkQSM/fgP7jc8v+oWWoClqmSnjoelrtLoNGhT47vPkjfScSSSlTBasP7wh5+BSQMs9IPn1AY468AP7npG/RyYDTCK4gHqv3Sd3uggVlZy/crVhpgYCux5Bbrya41X40Y/QU2C3MPjxGTZBidq22IJnkOlGB6grlq9UOeVL1FxwHcEXxCpUETVxQDjpuQ28WKCzgZQBBniMfPSXrlvcsZpK4Ew6MBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM3PR12CA0108.namprd12.prod.outlook.com (2603:10b6:0:55::28) by
 DM6PR12MB3212.namprd12.prod.outlook.com (2603:10b6:5:185::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Tue, 1 Oct 2019 16:17:50 +0000
Received: from CO1NAM03FT051.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::202) by DM3PR12CA0108.outlook.office365.com
 (2603:10b6:0:55::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2305.20 via Frontend
 Transport; Tue, 1 Oct 2019 16:17:50 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 CO1NAM03FT051.mail.protection.outlook.com (10.152.80.242) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Tue, 1 Oct 2019 16:17:48 +0000
Received: from mlipski-pc.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Tue, 1 Oct 2019
 11:17:39 -0500
From: <mikita.lipski@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 13/14] drm/amd/display: Recalculate VCPI slots for new DSC
 connectors
Date: Tue, 1 Oct 2019 12:17:20 -0400
Message-ID: <20191001161721.13793-14-mikita.lipski@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191001161721.13793-13-mikita.lipski@amd.com>
References: <20191001161721.13793-1-mikita.lipski@amd.com>
 <20191001161721.13793-2-mikita.lipski@amd.com>
 <20191001161721.13793-3-mikita.lipski@amd.com>
 <20191001161721.13793-4-mikita.lipski@amd.com>
 <20191001161721.13793-5-mikita.lipski@amd.com>
 <20191001161721.13793-6-mikita.lipski@amd.com>
 <20191001161721.13793-7-mikita.lipski@amd.com>
 <20191001161721.13793-8-mikita.lipski@amd.com>
 <20191001161721.13793-9-mikita.lipski@amd.com>
 <20191001161721.13793-10-mikita.lipski@amd.com>
 <20191001161721.13793-11-mikita.lipski@amd.com>
 <20191001161721.13793-12-mikita.lipski@amd.com>
 <20191001161721.13793-13-mikita.lipski@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(39860400002)(396003)(136003)(346002)(428003)(189003)(199004)(50466002)(2876002)(5660300002)(16586007)(50226002)(14444005)(2906002)(8676002)(316002)(1076003)(54906003)(81166006)(8936002)(81156014)(186003)(426003)(336012)(446003)(11346002)(486006)(53416004)(7696005)(6666004)(51416003)(76176011)(2616005)(476003)(126002)(70586007)(356004)(47776003)(2351001)(36756003)(6916009)(305945005)(70206006)(478600001)(48376002)(26005)(86362001)(4326008)(16060500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3212; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 457c4435-fdb9-4aae-8d4c-08d7468ae773
X-MS-TrafficTypeDiagnostic: DM6PR12MB3212:
X-Microsoft-Antispam-PRVS: <DM6PR12MB321296CE48D588AF805A90ACE49D0@DM6PR12MB3212.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-Forefront-PRVS: 0177904E6B
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5xJ13gjURsn/LZBGpDME2LIqiXE4b22Aj7Zw9RbG6aL3OQ123RXQhh1S6hGbUldW+gESjceVGYSFEW+OzvMErRBdr0LyIVmitHbwXSMfHAewL65IRYMAkaZra/jjd79D9xUEs03twrYv/EgDibEXiEXHoM1gjrPourKjpdF5Y0W6/ok9CU3VUANCqqbnVG3PEwtwSekkm/P4bITb0hQb+Hl0eUSR1ZRSzrN27VGwaUBt5bgppoMTO26xLHaAyA2jNDUE1OrcRDw06nU5nNkm/ZVZnn8EVQjgz4eSPHz8hwHXRfkRnI+GjjbEnI9yMrvs/lSE53L4xK6G2cNXOmg7E3z/E/VMDOiepdIf+tzGfyETqWohbuwnHgknJtUaBpS0b2w3+DfuC9Fhc+EzO0eVolp1O0hWRv3Z/XtMWTiVIT8=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2019 16:17:48.7166 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 457c4435-fdb9-4aae-8d4c-08d7468ae773
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3212
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zhgE7SnYNUh+YgxEXWIAEBbXDLkxlHvQje5tJoKA9yQ=;
 b=3N3YCDZLD/6vIzZldHKbQeaRsop47Svb2WhdSNCGDYGambnnWQEG3B16200fbp+4KUqqZGi49zSF5zIS7eok3F2WBHDe5P/fcz/QKGHAjGJ99It3rtYXr86+JGL4e379o2XtnEmrCuCzyzmJ8Kjqao+b9Zt7asE5IB3rMe6lly8=
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
Cc: Jerry Zuo <Jerry.Zuo@amd.com>, Mikita Lipski <mikita.lipski@amd.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogTWlraXRhIExpcHNraSA8bWlraXRhLmxpcHNraUBhbWQuY29tPgoKU2luY2UgZm9yIERT
QyBNU1QgY29ubmVjdG9yJ3MgUEJOIGlzIGNsYWN1bGF0ZWQgZGlmZmVyZW50bHkKZHVlIHRvIGNv
bXByZXNzaW9uLCB3ZSBoYXZlIHRvIHJlY2FsY3VsYXRlIGJvdGggUEJOIGFuZApWQ1BJIHNsb3Rz
IGZvciB0aGF0IGNvbm5lY3Rvci4KClRoaXMgcGF0Y2ggcHJvcG9zZXMgdG8gdXNlIHNpbWlsYWly
IGxvZ2ljIGFzIGluCmRtX2VuY29kZXJfaGVscGVyX2F0b21pY19jaGVrLCBidXQgc2luY2Ugd2Ug
ZG8gbm90IGtub3cgd2hpY2gKY29ubmVjdG9ycyB3aWxsIGhhdmUgRFNDIGVuYWJsZWQgd2UgaGF2
ZSB0byByZWNhbGN1bGF0ZSBQQk4gb25seQphZnRlciB0aGF0J3MgZGV0ZXJtaW5lZCwgd2hpY2gg
aXMgZG9uZSBpbgpjb21wdXRlX21zdF9kc2NfY29uZmlnc19mb3Jfc3RhdGUuCgpDYzogSmVycnkg
WnVvIDxKZXJyeS5adW9AYW1kLmNvbT4KQ2M6IEhhcnJ5IFdlbnRsYW5kIDxoYXJyeS53ZW50bGFu
ZEBhbWQuY29tPgpDYzogTHl1ZGUgUGF1bCA8bHl1ZGVAcmVkaGF0LmNvbT4KU2lnbmVkLW9mZi1i
eTogTWlraXRhIExpcHNraSA8bWlraXRhLmxpcHNraUBhbWQuY29tPgotLS0KIC4uLi9ncHUvZHJt
L2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYyB8IDY0ICsrKysrKysrKysrKysrKysr
LS0KIC4uLi9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX2hlbHBlcnMuYyB8ICA2IC0t
CiAyIGZpbGVzIGNoYW5nZWQsIDU5IGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2Rt
LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jCmlu
ZGV4IDgxZTMwOTE4ZjllYy4uNzUwMWNlMjIzM2VkIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMKQEAgLTQ1NjksNiArNDU2OSwyNyBA
QCBzdGF0aWMgdm9pZCBkbV9lbmNvZGVyX2hlbHBlcl9kaXNhYmxlKHN0cnVjdCBkcm1fZW5jb2Rl
ciAqZW5jb2RlcikKIAogfQogCitzdGF0aWMgaW50IGNvbnZlcnRfZGNfY29sb3JfZGVwdGhfaW50
b19icGMgKGVudW0gZGNfY29sb3JfZGVwdGggZGlzcGxheV9jb2xvcl9kZXB0aCkKK3sKKwlzd2l0
Y2ggKGRpc3BsYXlfY29sb3JfZGVwdGgpIHsKKwkJY2FzZSBDT0xPUl9ERVBUSF82NjY6CisJCQly
ZXR1cm4gNjsKKwkJY2FzZSBDT0xPUl9ERVBUSF84ODg6CisJCQlyZXR1cm4gODsKKwkJY2FzZSBD
T0xPUl9ERVBUSF8xMDEwMTA6CisJCQlyZXR1cm4gMTA7CisJCWNhc2UgQ09MT1JfREVQVEhfMTIx
MjEyOgorCQkJcmV0dXJuIDEyOworCQljYXNlIENPTE9SX0RFUFRIXzE0MTQxNDoKKwkJCXJldHVy
biAxNDsKKwkJY2FzZSBDT0xPUl9ERVBUSF8xNjE2MTY6CisJCQlyZXR1cm4gMTY7CisJCWRlZmF1
bHQ6CisJCQlicmVhazsKKwkJfQorCXJldHVybiAwOworfQorCiBzdGF0aWMgaW50IGRtX2VuY29k
ZXJfaGVscGVyX2F0b21pY19jaGVjayhzdHJ1Y3QgZHJtX2VuY29kZXIgKmVuY29kZXIsCiAJCQkJ
CSAgc3RydWN0IGRybV9jcnRjX3N0YXRlICpjcnRjX3N0YXRlLAogCQkJCQkgIHN0cnVjdCBkcm1f
Y29ubmVjdG9yX3N0YXRlICpjb25uX3N0YXRlKQpAQCAtNDYxNiw2ICs0NjM3LDM2IEBAIGNvbnN0
IHN0cnVjdCBkcm1fZW5jb2Rlcl9oZWxwZXJfZnVuY3MgYW1kZ3B1X2RtX2VuY29kZXJfaGVscGVy
X2Z1bmNzID0gewogCS5hdG9taWNfY2hlY2sgPSBkbV9lbmNvZGVyX2hlbHBlcl9hdG9taWNfY2hl
Y2sKIH07CiAKKyNpZmRlZiBDT05GSUdfRFJNX0FNRF9EQ19EU0NfU1VQUE9SVAorc3RhdGljIGlu
dCBkbV91cGRhdGVfbXN0X3ZjcGlfc2xvdHNfZm9yX2RzYyhzdHJ1Y3QgZHJtX2F0b21pY19zdGF0
ZSAqc3RhdGUsCisJCQkJCSAgICBzdHJ1Y3QgZGNfc3RhdGUgKmRjX3N0YXRlKQoreworCXN0cnVj
dCBkY19zdHJlYW1fc3RhdGUgKnN0cmVhbTsKKwlzdHJ1Y3QgYW1kZ3B1X2RtX2Nvbm5lY3RvciAq
YWNvbm5lY3RvcjsKKwlpbnQgaSwgY2xvY2sgPSAwLCBicHAgPSAwOworCisJZm9yIChpID0gMDsg
aSA8IGRjX3N0YXRlLT5zdHJlYW1fY291bnQ7IGkrKykgeworCQlzdHJlYW0gPSBkY19zdGF0ZS0+
c3RyZWFtc1tpXTsKKwkJYWNvbm5lY3RvciA9IChzdHJ1Y3QgYW1kZ3B1X2RtX2Nvbm5lY3RvciAq
KXN0cmVhbS0+ZG1fc3RyZWFtX2NvbnRleHQ7CisKKwkJaWYgKHN0cmVhbSAmJiBzdHJlYW0tPnRp
bWluZy5mbGFncy5EU0MgPT0gMSkgeworCQkJYnBwID0gY29udmVydF9kY19jb2xvcl9kZXB0aF9p
bnRvX2JwYyhzdHJlYW0tPnRpbWluZy5kaXNwbGF5X2NvbG9yX2RlcHRoKSogMzsKKwkJCWNsb2Nr
ID0gc3RyZWFtLT50aW1pbmcucGl4X2Nsa18xMDBoeiAvIDEwOworCisJCQlhY29ubmVjdG9yLT5w
Ym4gPSBkcm1fZHBfY2FsY19wYm5fbW9kZShjbG9jaywgYnBwLCB0cnVlKTsKKworCQkJYWNvbm5l
Y3Rvci0+dmNwaV9zbG90cyA9IGRybV9kcF9hdG9taWNfZmluZF92Y3BpX3Nsb3RzKHN0YXRlLAor
CQkJCQkJCSAgJmFjb25uZWN0b3ItPm1zdF9wb3J0LT5tc3RfbWdyLAorCQkJCQkJCSAgYWNvbm5l
Y3Rvci0+cG9ydCwKKwkJCQkJCQkgIGFjb25uZWN0b3ItPnBibik7CisJCQlpZiAoYWNvbm5lY3Rv
ci0+dmNwaV9zbG90cyA8IDApCisJCQkJcmV0dXJuIGFjb25uZWN0b3ItPnZjcGlfc2xvdHM7CisJ
CX0KKwl9CisJcmV0dXJuIDA7Cit9CisjZW5kaWYKKwogc3RhdGljIHZvaWQgZG1fZHJtX3BsYW5l
X3Jlc2V0KHN0cnVjdCBkcm1fcGxhbmUgKnBsYW5lKQogewogCXN0cnVjdCBkbV9wbGFuZV9zdGF0
ZSAqYW1kZ3B1X3N0YXRlID0gTlVMTDsKQEAgLTc2MjksMTEgKzc2ODAsNiBAQCBzdGF0aWMgaW50
IGFtZGdwdV9kbV9hdG9taWNfY2hlY2soc3RydWN0IGRybV9kZXZpY2UgKmRldiwKIAlpZiAocmV0
KQogCQlnb3RvIGZhaWw7CiAKLQkvKiBQZXJmb3JtIHZhbGlkYXRpb24gb2YgTVNUIHRvcG9sb2d5
IGluIHRoZSBzdGF0ZSovCi0JcmV0ID0gZHJtX2RwX21zdF9hdG9taWNfY2hlY2soc3RhdGUpOwot
CWlmIChyZXQpCi0JCWdvdG8gZmFpbDsKLQogCWlmIChzdGF0ZS0+bGVnYWN5X2N1cnNvcl91cGRh
dGUpIHsKIAkJLyoKIAkJICogVGhpcyBpcyBhIGZhc3QgY3Vyc29yIHVwZGF0ZSBjb21pbmcgZnJv
bSB0aGUgcGxhbmUgdXBkYXRlCkBAIC03NzA1LDYgKzc3NTEsMTAgQEAgc3RhdGljIGludCBhbWRn
cHVfZG1fYXRvbWljX2NoZWNrKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsCiAjaWZkZWYgQ09ORklH
X0RSTV9BTURfRENfRFNDX1NVUFBPUlQKIAkJaWYgKCFjb21wdXRlX21zdF9kc2NfY29uZmlnc19m
b3Jfc3RhdGUoZG1fc3RhdGUtPmNvbnRleHQpKQogCQkJZ290byBmYWlsOworCisJCXJldCA9IGRt
X3VwZGF0ZV9tc3RfdmNwaV9zbG90c19mb3JfZHNjKHN0YXRlLCBkbV9zdGF0ZS0+Y29udGV4dCk7
CisJCWlmIChyZXQpCisJCQlnb3RvIGZhaWw7CiAjZW5kaWYKIAkJaWYgKGRjX3ZhbGlkYXRlX2ds
b2JhbF9zdGF0ZShkYywgZG1fc3RhdGUtPmNvbnRleHQsIGZhbHNlKSAhPSBEQ19PSykgewogCQkJ
cmV0ID0gLUVJTlZBTDsKQEAgLTc3MzQsNiArNzc4NCwxMCBAQCBzdGF0aWMgaW50IGFtZGdwdV9k
bV9hdG9taWNfY2hlY2soc3RydWN0IGRybV9kZXZpY2UgKmRldiwKIAkJCQlkY19yZXRhaW5fc3Rh
dGUob2xkX2RtX3N0YXRlLT5jb250ZXh0KTsKIAkJfQogCX0KKwkvKiBQZXJmb3JtIHZhbGlkYXRp
b24gb2YgTVNUIHRvcG9sb2d5IGluIHRoZSBzdGF0ZSovCisJcmV0ID0gZHJtX2RwX21zdF9hdG9t
aWNfY2hlY2soc3RhdGUpOworCWlmIChyZXQpCisJCWdvdG8gZmFpbDsKIAogCS8qIFN0b3JlIHRo
ZSBvdmVyYWxsIHVwZGF0ZSB0eXBlIGZvciB1c2UgbGF0ZXIgaW4gYXRvbWljIGNoZWNrLiAqLwog
CWZvcl9lYWNoX25ld19jcnRjX2luX3N0YXRlIChzdGF0ZSwgY3J0YywgbmV3X2NydGNfc3RhdGUs
IGkpIHsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0v
YW1kZ3B1X2RtX2hlbHBlcnMuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVf
ZG0vYW1kZ3B1X2RtX2hlbHBlcnMuYwppbmRleCBiZDY5NDQ5OWUzZGUuLjNlNDRlMmRhMmQwZCAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVf
ZG1faGVscGVycy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0v
YW1kZ3B1X2RtX2hlbHBlcnMuYwpAQCAtMjAxLDEyICsyMDEsNiBAQCBib29sIGRtX2hlbHBlcnNf
ZHBfbXN0X3dyaXRlX3BheWxvYWRfYWxsb2NhdGlvbl90YWJsZSgKIAltc3RfcG9ydCA9IGFjb25u
ZWN0b3ItPnBvcnQ7CiAKIAlpZiAoZW5hYmxlKSB7Ci0KLQkJLyogQ29udmVydCBraWxvYml0cyBw
ZXIgc2Vjb25kIC8gNjQgKGZvciA2NCB0aW1lc2xvdHMpIHRvIHBibiAoNTQvNjQgbWVnYWJ5dGVz
IHBlciBzZWNvbmQpICovCi0JCXBibl9wZXJfdGltZXNsb3QgPSBkY19saW5rX2JhbmR3aWR0aF9r
YnBzKAotCQkJCXN0cmVhbS0+bGluaywgZGNfbGlua19nZXRfbGlua19jYXAoc3RyZWFtLT5saW5r
KSkgLyAoOCAqIDEwMDAgKiA1NCk7Ci0JCWFjb25uZWN0b3ItPnZjcGlfc2xvdHMgPSBESVZfUk9V
TkRfVVAoYWNvbm5lY3Rvci0+cGJuLCBwYm5fcGVyX3RpbWVzbG90KTsKLQogCQlyZXQgPSBkcm1f
ZHBfbXN0X2FsbG9jYXRlX3ZjcGkobXN0X21nciwgbXN0X3BvcnQsCiAJCQkJCSAgICAgICBhY29u
bmVjdG9yLT5wYm4sCiAJCQkJCSAgICAgICBhY29ubmVjdG9yLT52Y3BpX3Nsb3RzKTsKLS0gCjIu
MTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
