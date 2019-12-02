Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DE3410EFBE
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2019 20:05:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 063066E2B2;
	Mon,  2 Dec 2019 19:05:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790045.outbound.protection.outlook.com [40.107.79.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F001E6E128;
 Mon,  2 Dec 2019 19:04:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GDwI1um56+TOH47f/zSCtz6uK27YarJ0yxG8er5KDy6iAQG9XLDrtyGzsFV8ITenPXAXqM+XsJ0T2pkz09rFarkkWCwHO1i+6yx2DRIYK01m6X2hdMm4YXxAS2HVCEUJWxBu+gAPD2rqf1I0nKzocsheciwJ/sXeLMqWEJhTyfZDUM5NO+8xbuudBlSO89CZJLkbWsweyzbXecZDtbZSvJai15h9zWfov2FubdkeTH4hYA3L+2t3bd+DKViGteMv850QlOxEWFf5KCPSdW9AxpA0qHvKE4kNV6KdmMzQY3NA91c4LTjR0v733XaF8G9eJ+ouR7qxCUfeV767TbuN3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9busuMIEWEI5rzlGtERXSeosUSePaON0TQ7fghiA8PU=;
 b=fJjOqh6PnANOuNeJXD0J1/tRpuxbu+UVfovkXT+uGv884ZFfdQ7Udebd8nlDxYjwbyTTFzP09BJrnmZ+X2TZnFiHNs2riV56MFW4A3ytlzaLpHcRioKotZQr+Jhk3bqtrvFEHSTADMtZlibFnCM3mv1OlmCyfK8yCCFYO5aYu1fsbVQEgWCb7Q/kzDMyDgUSkpBAedHDB6/ttNQaOYMUQcjMR+iuMIs67uSapktT3MJdwmSEsUIWEx3KBV4UOKsPuQzTC8i0YQpiVnTMZXdpYK8uxCrfjrELjQJ/PNOGMmUvWy+P+fq/ekNtUap69tGGTN6Kj2fODKiSQC1yO4ideg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM3PR12CA0065.namprd12.prod.outlook.com (2603:10b6:0:56::33) by
 DM5PR12MB2389.namprd12.prod.outlook.com (2603:10b6:4:b4::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.18; Mon, 2 Dec 2019 19:04:57 +0000
Received: from DM6NAM11FT035.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eaa::207) by DM3PR12CA0065.outlook.office365.com
 (2603:10b6:0:56::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2495.19 via Frontend
 Transport; Mon, 2 Dec 2019 19:04:57 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 DM6NAM11FT035.mail.protection.outlook.com (10.13.172.100) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.2451.23 via Frontend Transport; Mon, 2 Dec 2019 19:04:56 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Mon, 2 Dec 2019
 13:04:55 -0600
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Mon, 2 Dec 2019
 13:04:55 -0600
Received: from jzuo-linux.amd.com (10.180.168.240) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Mon, 2 Dec 2019 13:04:55 -0600
From: "Jerry (Fangzhi) Zuo" <Jerry.Zuo@amd.com>
To: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <amd-gfx@lists.freedesktop.org>
Subject: [RESEND 0/2] Changes for DP 1.4 Compliance test 4.2.2.6
Date: Mon, 2 Dec 2019 14:04:47 -0500
Message-ID: <20191202190449.2864-1-Jerry.Zuo@amd.com>
X-Mailer: git-send-email 2.14.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(428003)(199004)(189003)(4326008)(48376002)(50466002)(36756003)(50226002)(81166006)(47776003)(8936002)(26005)(186003)(2616005)(51416003)(7696005)(336012)(426003)(6666004)(356004)(70586007)(70206006)(110136005)(4744005)(498600001)(16586007)(86362001)(2201001)(8676002)(81156014)(2906002)(305945005)(53416004)(1076003)(54906003)(5660300002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB2389; H:SATLEXMB01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2d50ea4e-8502-4d1c-565f-08d7775a8599
X-MS-TrafficTypeDiagnostic: DM5PR12MB2389:
X-Microsoft-Antispam-PRVS: <DM5PR12MB23899E55EB12AC5C83EA789EE5430@DM5PR12MB2389.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-Forefront-PRVS: 0239D46DB6
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sPXCWA4e1MnBYahERbopuOjVmSMl76d/LTyhdWX+R+PJsa1vSRqFmc1Zn+jm1hCeNE4PJsIKs29NcDt64+xwDT4GRPBHfFvjLODgxRb3jIe36ARbKseFUEOC/OFch6BlWWnPmGAN7jz87S1vcumNldhYdKx9GlKoC7sIXlHLxSxB1qSg9vTA3dFaBFtHccRTKzO8hONU0F/CT2A8yvSEvsMjFcMYsqHWn3r+X+18dO+zItw03TWVy7VkbTm9w4CVc50zAw5GuFX0MfguHV7WlUqej8R9poskKwJdR9T4B4D/VjnHRNKZqyvkD5TEPEoUj+EK1RDhjc7ovXq6br+AU2hzUOTcai2MCd30qtZCC6E5l+FEllFHNldiTmf3nL9YKzCNidqFGZ70qRPUtrdfeJmVhjaXczBAwKoD25fwrNpyvyyonOxDtprrN+LaWQRW
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2019 19:04:56.6984 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d50ea4e-8502-4d1c-565f-08d7775a8599
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2389
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9busuMIEWEI5rzlGtERXSeosUSePaON0TQ7fghiA8PU=;
 b=nTvZX7XUwq/0SjvNbkhmMpmdQS9cia0HGSauQJw7rv7IuvlCTeCKdE6T9Aq+d1h9oknWFf6vehgz12zL5/2+Ue+VKEw/5jZxT3aLXJZo0Gb1P0Ud5YmzZZUm0OgqktzQcKzvZGJT3mDkzvOu1hTJPDzeyCcTQ5o+GnUeSBOHw0A=
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
Cc: rodrigo.siqueira@amd.com, manasi.d.navare@intel.com, Jerry.Zuo@amd.com,
 Alexander.Deucher@amd.com, nicholas.kazlauskas@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VW5saWtlIERQIDEuMiBDb21wbGlhbmNlIHRlc3QgNC4yLjIuNiwgRFAgMS40IHJlcXVpcmVzIHRv
IGNhbGN1bGF0ZSByZWFsCkNSQyB2YWx1ZSBvZiB0aGUgbGFzdCBlZGlkIGRhdGEgYmxvY2ssIGFu
ZCB3cml0ZSBpdCBiYWNrLgoKQ3VycmVudCBlZGlkIENSQyBjYWxjdWxhdGUgcm91dGluZSBhZGRz
IHRoZSBsYXN0IENSQyBieXRlLCBhbmQgY2hlY2sgaWYKbm9uLXplcm8gb3Igbm90LiBOZWVkIHRv
IHJldHVybiB0aGUgYWN0dWFsIENSQyB2YWx1ZSB3aGVuIGNvcnJ1cHRpb24gaXMKZGV0ZWN0ZWQu
CgpbRm9yIENJXQpSZXNlbmQgdGhpcyBwYXRjaHNldCB0byBpbnRlbCBnZnggQ0kuIAoKSmVycnkg
KEZhbmd6aGkpIFp1byAoMik6CiAgZHJtOiBBZGQgc3VwcG9ydCBmb3IgRFAgMS40IENvbXBsaWFu
Y2UgZWRpZCBjb3JydXB0aW9uIHRlc3QgNC4yLjIuNgogIGRybS9hbWQvZGlzcGxheTogSG9vayB1
cCBkcm0gaW50ZXJmYWNlIGZvciBEUCAxLjQgZWRpZCBjb3JydXB0aW9uIHRlc3QKCiAuLi4vZHJt
L2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1faGVscGVycy5jICB8IDM1ICsrKysrLS0t
LS0tLS0tLS0tLS0tLQogZHJpdmVycy9ncHUvZHJtL2RybV9kcF9oZWxwZXIuYyAgICAgICAgICAg
ICAgICAgICAgfCAzNiArKysrKysrKysrKysrKysrKysrKysrCiBkcml2ZXJzL2dwdS9kcm0vZHJt
X2VkaWQuYyAgICAgICAgICAgICAgICAgICAgICAgICB8IDE4ICsrKysrKysrKy0tCiBpbmNsdWRl
L2RybS9kcm1fY29ubmVjdG9yLmggICAgICAgICAgICAgICAgICAgICAgICB8ICA3ICsrKysrCiBp
bmNsdWRlL2RybS9kcm1fZHBfaGVscGVyLmggICAgICAgICAgICAgICAgICAgICAgICB8ICAzICsr
CiA1IGZpbGVzIGNoYW5nZWQsIDY4IGluc2VydGlvbnMoKyksIDMxIGRlbGV0aW9ucygtKQoKLS0g
CjIuMTQuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
