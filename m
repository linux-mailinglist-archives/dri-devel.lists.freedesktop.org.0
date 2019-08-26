Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB96E9D280
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2019 17:17:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C0616E1F4;
	Mon, 26 Aug 2019 15:17:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700046.outbound.protection.outlook.com [40.107.70.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4817B6E15F
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2019 15:17:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ErctyarT1VJPZv6wwOSfRA2FsfgZFEtJaCURCPuFbAAq4Tdw3Ln6kUNjmtf7zJDWF/e8kHEm42CAS5iDui1gRcswu1vBlPv6dw3pGhyYkilEZU493fGh8d4pCV/fnUGN/Z/T3DGLCtDZ8YXbkfh3LKChmZCl9zugtHSc4Y1srCsY5347NIhPh1PUcQrpH4LYHV+KNUkuQoIq8mWQJ5p9p6+0cfMik+lE1OkuQtk3skT2BmnxaVJ1H9jiNyMznOm0yY6l++MAPvmI4jNS3+qZhHnPG9JedoczcTUu+Ys5Z1cxA1TlJVr2GtVt4B0pZEChjZJ58dt9RZHP1fy5BmNXqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DUBvAxFlcUBiZYgRnSJN4f+nSnhezLKuJg2FyGpNozc=;
 b=fiY6tJOzT2YtnYmKjaSpediQTD6+QKqd8cX06fMDBmiY8+jEt1FCLdi+/yZoiG3unukvNV2WksmtsONPUyjJIDIbr/nlnaVXHoFaaFKCdYs4zFpKYaDnmoizfQnyoS/rAVLOU//4rf1/KRMxGkOlSBJuTfBMSB+5Rah0u0N7vQWgrpQKWX+hKMXdkrOWNBu6sJJ9W4gxTChvwJ3YWWGGdDime8HylVAWAuOduFG4M83Bz4oBAb9cPxqxoOtJJ11eqrEt7h7AfwyOykshCwocjPRZiZWWQom77oq0seG68cueD0+GSD7iNrOtYr9QXWtfMKdsmrdzwhOd63azlB8F4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from MN2PR12CA0034.namprd12.prod.outlook.com (2603:10b6:208:a8::47)
 by SN6PR12MB2720.namprd12.prod.outlook.com (2603:10b6:805:70::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2199.20; Mon, 26 Aug
 2019 15:17:35 +0000
Received: from DM3NAM03FT045.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::204) by MN2PR12CA0034.outlook.office365.com
 (2603:10b6:208:a8::47) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2199.14 via Frontend
 Transport; Mon, 26 Aug 2019 15:17:35 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 DM3NAM03FT045.mail.protection.outlook.com (10.152.82.208) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Mon, 26 Aug 2019 15:17:35 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Mon, 26 Aug 2019 10:17:31 -0500
From: David Francis <David.Francis@amd.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v7 5/6] drm/dp_mst: Add new quirk for Synaptics MST hubs
Date: Mon, 26 Aug 2019 11:17:27 -0400
Message-ID: <20190826151728.19567-6-David.Francis@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190826151728.19567-1-David.Francis@amd.com>
References: <20190826151728.19567-1-David.Francis@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(136003)(39860400002)(396003)(2980300002)(428003)(199004)(189003)(1076003)(478600001)(14444005)(2351001)(36756003)(16586007)(316002)(53936002)(49486002)(5660300002)(48376002)(6916009)(86362001)(8676002)(76176011)(50226002)(8936002)(81166006)(81156014)(356004)(6666004)(4326008)(50466002)(54906003)(446003)(47776003)(11346002)(2616005)(26005)(426003)(336012)(126002)(51416003)(186003)(2906002)(486006)(476003)(305945005)(70206006)(70586007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN6PR12MB2720; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eafe9fe5-238d-49b7-8d1c-08d72a388622
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:SN6PR12MB2720; 
X-MS-TrafficTypeDiagnostic: SN6PR12MB2720:
X-Microsoft-Antispam-PRVS: <SN6PR12MB2720CBC2F9A921F12028D515EFA10@SN6PR12MB2720.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-Forefront-PRVS: 01415BB535
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: gfh5+5VsD+e5ZfamiC7e6lYZ1izwh5VG5JGZDTxedGJx0OD986J1dheJ4kUKCssdAdF3CXUCc1hu1omoLjs1d+stGR9kzVeHGegFSiy910W/nPx7dptRsgmreXDB+Hv299QTNjBN+k0y0n4bD/EafxkfdxkcIpwsm+A8jLg0VFeD5Dlitt0l5qap3XnhIqc+9AGObrHaLTTuQ3e0B6KC/svCqfufCnp0YKcmm+lJMkXodQgnEE0YzaxzcCUh2J/5oKyBPwRxpomUg9JZ5u8tKXJ1EZLhskVpmtA13R1kbVCt6/EX6MTumVJxE+oye0DYK6sJrPFzP25RL/cNmAspquolSGPDwBQbLk/VttxsstXB+GIXokYzab8u+CVwbPGq1vDuoK6Jy/PH0J1C6VQfuoqLeh7SapcfrJKd5h++f+w=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2019 15:17:35.1539 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eafe9fe5-238d-49b7-8d1c-08d72a388622
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2720
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DUBvAxFlcUBiZYgRnSJN4f+nSnhezLKuJg2FyGpNozc=;
 b=qNAR99cRKkk2upFyeKK5TTz0T/SmEBFp/Kv4Pa4jYrQBu7AgpWdvEEPtZWKV+QdXszGvUaef3BtuiGkkpQ/BXDlipqDopgcROznv4IsbcUhCrfCjX456fjxnh8gfD1ZUa7CYHrbsl558OZFF3YOWEctFW1pmyIQ2tjsuHjgAbHk=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is
 165.204.84.17)
 smtp.mailfrom=amd.com; linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=permerror action=none
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
Cc: David Francis <David.Francis@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U3luYXB0aWNzIERQMS40IGh1YnMgKEJSQU5DSF9JRCAweDkwQ0MyNCkgZG8gbm90CnN1cHBvcnQg
dmlydHVhbCBEUENEIHJlZ2lzdGVycywgYnV0IGRvIHN1cHBvcnQgRFNDLgpUaGUgRFNDIGNhcHMg
Y2FuIGJlIHJlYWQgZnJvbSB0aGUgcGh5c2ljYWwgYXV4LApsaWtlIGluIFNTVCBEU0MuIFRoZXNl
IGh1YnMgaGF2ZSBtYW55IGRpZmZlcmVudApERVZJQ0VfSURzLiAgQWRkIGEgbmV3IHF1aXJrIHRv
IGRldGVjdCB0aGlzIGNhc2UuCgpDYzogTHl1ZGUgUGF1bCA8bHl1ZGVAcmVkaGF0LmNvbT4KQ2M6
IEphbmkgTmlrdWxhIDxqYW5pLm5pa3VsYUBsaW51eC5pbnRlbC5jb20+ClNpZ25lZC1vZmYtYnk6
IERhdmlkIEZyYW5jaXMgPERhdmlkLkZyYW5jaXNAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9k
cm0vZHJtX2RwX2hlbHBlci5jIHwgMiArKwogaW5jbHVkZS9kcm0vZHJtX2RwX2hlbHBlci5oICAg
ICB8IDcgKysrKysrKwogMiBmaWxlcyBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKykKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX2hlbHBlci5jIGIvZHJpdmVycy9ncHUvZHJtL2Ry
bV9kcF9oZWxwZXIuYwppbmRleCAyY2MyMWVmZjRjZjMuLmZjMzkzMjNlN2Q1MiAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9oZWxwZXIuYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
ZHJtX2RwX2hlbHBlci5jCkBAIC0xMjcwLDYgKzEyNzAsOCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0
IGRwY2RfcXVpcmsgZHBjZF9xdWlya19saXN0W10gPSB7CiAJeyBPVUkoMHgwMCwgMHgxMCwgMHhm
YSksIERFVklDRV9JRF9BTlksIGZhbHNlLCBCSVQoRFBfRFBDRF9RVUlSS19OT19QU1IpIH0sCiAJ
LyogQ0g3NTExIHNlZW1zIHRvIGxlYXZlIFNJTktfQ09VTlQgemVyb2VkICovCiAJeyBPVUkoMHgw
MCwgMHgwMCwgMHgwMCksIERFVklDRV9JRCgnQycsICdIJywgJzcnLCAnNScsICcxJywgJzEnKSwg
ZmFsc2UsIEJJVChEUF9EUENEX1FVSVJLX05PX1NJTktfQ09VTlQpIH0sCisJLyogU3luYXB0aWNz
IERQMS40IE1TVCBodWJzIGNhbiBzdXBwb3J0IERTQyB3aXRob3V0IHZpcnR1YWwgRFBDRCAqLwor
CXsgT1VJKDB4OTAsIDB4Q0MsIDB4MjQpLCBERVZJQ0VfSURfQU5ZLCB0cnVlLCBCSVQoRFBfRFBD
RF9RVUlSS19EU0NfV0lUSE9VVF9WSVJUVUFMX0RQQ0QpIH0sCiB9OwogCiAjdW5kZWYgT1VJCmRp
ZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kcm1fZHBfaGVscGVyLmggYi9pbmNsdWRlL2RybS9kcm1f
ZHBfaGVscGVyLmgKaW5kZXggODM2NDUwMmY5MmNmLi5hMTMzMWIwODcwNWYgMTAwNjQ0Ci0tLSBh
L2luY2x1ZGUvZHJtL2RybV9kcF9oZWxwZXIuaAorKysgYi9pbmNsdWRlL2RybS9kcm1fZHBfaGVs
cGVyLmgKQEAgLTE0MzQsNiArMTQzNCwxMyBAQCBlbnVtIGRybV9kcF9xdWlyayB7CiAJICogVGhl
IGRyaXZlciBzaG91bGQgaWdub3JlIFNJTktfQ09VTlQgZHVyaW5nIGRldGVjdGlvbi4KIAkgKi8K
IAlEUF9EUENEX1FVSVJLX05PX1NJTktfQ09VTlQsCisJLyoqCisJICogQERQX0RQQ0RfUVVJUktf
RFNDX1dJVEhPVVRfVklSVFVBTF9EUENEOgorCSAqCisJICogVGhlIGRldmljZSBzdXBwb3J0cyBN
U1QgRFNDIGRlc3BpdGUgbm90IHN1cHBvcnRpbmcgVmlydHVhbCBEUENELgorCSAqIFRoZSBEU0Mg
Y2FwcyBjYW4gYmUgcmVhZCBmcm9tIHRoZSBwaHlzaWNhbCBhdXggaW5zdGVhZC4KKwkgKi8KKwlE
UF9EUENEX1FVSVJLX0RTQ19XSVRIT1VUX1ZJUlRVQUxfRFBDRCwKIH07CiAKIC8qKgotLSAKMi4x
Ny4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
