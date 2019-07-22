Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07CFB6FD72
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2019 12:12:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B54D89BA9;
	Mon, 22 Jul 2019 10:12:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800070.outbound.protection.outlook.com [40.107.80.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C0F489BA9
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 10:12:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TY1JnL3AZYbQNWHv2ohuatBCTcEVj/UXu5ZvW5nczcYuMY/ZbPCqd+1EZdWUUdH2WyOT/xOHH0zogEJVJMzToXaeCSxyZBwdLEuvH5Qf71KrkYQCc21HYIvy4O/MMrPcYEe+uxYLYiv1Mmfx81lhB4W/GkSwVnPqo6FC0jS1wPFXseSaQMZqsPOpscO8BDkDAx4ek+2pb37czJfySVuUimOF57dg7GDBT9tuSuiSzd9bvpMFdF0In99Ms/TItvUCQsrMsgsPkbvl4weHb1eB62LRNnsGN1faT9ettRQ2MwVcmiWvo/O/iu3LiOYF1FRDyb4jXlF8GRhwAGrXcNTUUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rm4UbfVYpQ1pbumDLFlP+cm8jWJ0f9RU2Yw7A1brAFs=;
 b=ftZomYv8VPKohTFe7dh9vOEIx7mmYOX1zIZaN/Wj2ody6pcu0X04hNe0JbEWvN5BaF8bVXKK0F18vDxYIAHKBQb5oTSz89wgLXVLkT/frNncxybR/qs1e5BWeCaN7uWcD1lpdIDJinphOIXNZneX+JXXlJQHidI9yafK4GzxPY+jM/HARPgWwxs+fqiZBAzBFVOwelkIDh/3BujceeWhTMHY2K5/7l9Hgv2ta0Rv025LXqdvQIjy1uk0kkRyym5TXGTsFhAulyDAPfI15qMydWumdsj9tvdrD3pvgy6y2JwCZGpOTSSnhZDQkd/1ewWOqvCg424FKRmQgtjK+LkXQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from DM5PR12CA0066.namprd12.prod.outlook.com (2603:10b6:3:103::28)
 by DM5PR12MB1578.namprd12.prod.outlook.com (2603:10b6:4:e::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.15; Mon, 22 Jul 2019 10:12:31 +0000
Received: from CO1NAM03FT021.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::204) by DM5PR12CA0066.outlook.office365.com
 (2603:10b6:3:103::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2094.15 via Frontend
 Transport; Mon, 22 Jul 2019 10:12:30 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 CO1NAM03FT021.mail.protection.outlook.com (10.152.80.180) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Mon, 22 Jul 2019 10:12:30 +0000
Received: from [10.65.99.155] (10.34.1.3) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server (TLS) id 14.3.389.1; Mon, 22 Jul
 2019 05:12:03 -0500
Subject: Re: [PATCH] drm/syncobj: return meaningful value to user space
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>, Chunming Zhou
 <david1.zhou@amd.com>, <dri-devel@lists.freedesktop.org>
References: <20190718111339.25126-1-david1.zhou@amd.com>
 <79b2a068-412c-55ae-e094-14b9912b3e68@intel.com>
From: zhoucm1 <zhoucm1@amd.com>
Message-ID: <7e31bcb8-ceda-0b71-8b3d-dfb99a9832f2@amd.com>
Date: Mon, 22 Jul 2019 18:11:55 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <79b2a068-412c-55ae-e094-14b9912b3e68@intel.com>
Content-Language: en-US
X-Originating-IP: [10.34.1.3]
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(136003)(39860400002)(396003)(2980300002)(428003)(199004)(189003)(426003)(446003)(8676002)(336012)(6116002)(486006)(3846002)(70586007)(2870700001)(31686004)(70206006)(64126003)(53936002)(2616005)(65826007)(126002)(476003)(6246003)(5660300002)(11346002)(229853002)(68736007)(36756003)(47776003)(110136005)(6666004)(65806001)(65956001)(31696002)(53546011)(7736002)(58126008)(16576012)(356004)(76176011)(2906002)(478600001)(2486003)(23676004)(67846002)(305945005)(26005)(8936002)(50466002)(186003)(16526019)(81166006)(81156014)(316002)(2101003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1578; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6bf9e5e1-f096-4a23-592b-08d70e8d1b31
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM5PR12MB1578; 
X-MS-TrafficTypeDiagnostic: DM5PR12MB1578:
X-Microsoft-Antispam-PRVS: <DM5PR12MB1578A20BE7F4472565032771B4C40@DM5PR12MB1578.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-Forefront-PRVS: 01068D0A20
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 3MUoCxjRt1ZLCVZQX9m8+r1q+nrixUI6m0cITtNlzVmqeaJs9otst3MUSZUjka09kWi5McOLvTH5WxVQRyNzafxM9fzGQdM5lJJpbY37cPNlFM9Yff4tlgpkLdTCnHWa5T49fgO3s4/V+wGJqqIxNyMvvu/5Dq7NhqqKrNs4n27mBywqRRZHuz91w0CzQAEX6gcTAfG0+rRg6edi3Y6EVJoTxkxpU2pU1wVEEayGtYZNL+Nw/u917UuBPe760T/sRVdKofsHFsms9p3YkggbnHb6lbevxv+UwfK+4tnFqOl5Siu25HFlXPJQvQmnTypvAT5ac/nvJIZuuUG9v7ff28cmbLJdS2R5sIlKNTb99DG6zgcApf7K/xe3u6fdra9wdumSlKsKjH6mxk8fkSskoLAoXz0s/1qLe8KdrJ7ylys=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2019 10:12:30.3759 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bf9e5e1-f096-4a23-592b-08d70e8d1b31
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1578
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rm4UbfVYpQ1pbumDLFlP+cm8jWJ0f9RU2Yw7A1brAFs=;
 b=on0I+kOcEimph6tQaiqEHiEZFrUjtjqvCmmxepnOntJgT0PE0jH76rv/17as3XPHShIS36C6IK0ON22gs0FREqhb1qfNEdCflBwbtHAU4TENNXs4lZx9AsOpnpQzc4rA63ghpYJpdA1GGZMCtWiOw2rqNg1O2n3BeH8EK84Xmxg=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is
 165.204.84.17)
 smtp.mailfrom=amd.com; intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=permerror action=none header.from=amd.com;
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpPbiAyMDE55bm0MDfmnIgyMuaXpSAxNjo0NiwgTGlvbmVsIExhbmR3ZXJsaW4gd3JvdGU6Cj4g
T24gMTgvMDcvMjAxOSAxNDoxMywgQ2h1bm1pbmcgWmhvdSB3cm90ZToKPj4gaWYgV0FJVF9GT1Jf
U1VCTUlUIGlzbid0IHNldCBhbmQgaW4gdGhlIG1lYW53aGlsZSBubyB1bmRlcmx5aW5nIGZlbmNl
IAo+PiBvbiBzeW5jb2JqLAo+PiB0aGVuIHJldHVybiBub24tYmxvY2sgZXJyb3IgY29kZSB0byB1
c2VyIHNhcGNlLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBDaHVubWluZyBaaG91IDxkYXZpZDEuemhv
dUBhbWQuY29tPgo+PiAtLS0KPj4gwqAgZHJpdmVycy9ncHUvZHJtL2RybV9zeW5jb2JqLmMgfCA0
ICsrLS0KPj4gwqAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMo
LSkKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fc3luY29iai5jIAo+PiBi
L2RyaXZlcnMvZ3B1L2RybS9kcm1fc3luY29iai5jCj4+IGluZGV4IDM2MWEwMWEwOGMxOC4uOTI5
ZjdjNjRmOWEyIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3N5bmNvYmouYwo+
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3N5bmNvYmouYwo+PiBAQCAtMjUyLDcgKzI1Miw3
IEBAIGludCBkcm1fc3luY29ial9maW5kX2ZlbmNlKHN0cnVjdCBkcm1fZmlsZSAKPj4gKmZpbGVf
cHJpdmF0ZSwKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIDA7Cj4+IMKgwqDC
oMKgwqDCoMKgwqDCoCBkbWFfZmVuY2VfcHV0KCpmZW5jZSk7Cj4+IMKgwqDCoMKgwqAgfSBlbHNl
IHsKPj4gLcKgwqDCoMKgwqDCoMKgIHJldCA9IC1FSU5WQUw7Cj4+ICvCoMKgwqDCoMKgwqDCoCBy
ZXQgPSAtRU5PVEJMSzsKPgo+Cj4gVGhpcyB3aWxsIG9ubHkgcmV0dXJuIHRoZSBuZXcgZXJyb3Ig
d2hlbiB0aGVyZSBpcyBubyBjaGFpbiBmZW5jZSBpbiAKPiB0aGUgc3luY29iaj8KSWYgYWxsIG9m
IHlvdSBhZ3JlZSwgdGhhdCdzIGJlc3QuCkkndmUgY2hlY2tlZCBvcmdpbmFsIEVJTlZBTO+8jHRo
ZXJlIGFyZSAzIHNpdHVhdGlvbnMgd2hpY2ggd291bGQgcmV0dXJuIApFSU5WQUw6CmEuIGludmFs
aWQgZmxhZ3MKYi4gY291bnRfaGFuZGxlcwpjLiBmYWlsZWQgdG8gZmluZCBmZW5jZSBpbiBzeW5j
b2JqLgoKSWYgdXNlciBjYW4gbWFrZSBzdXJlIHNhbml0aXphdGlvbiBmb3IgcGFyYW10ZXJzLCB0
aGVuIEVJTlZBTCBjYW4gYmUgCnVzZWQgdG8gaWRlbnRpZnkgImxhY2sgb2YgZmVuY2UgaW4gc3lu
Y29iaiIsIHdoaWNoIGlzIHdhaXRCZWZvcmVTaWduYWwuIApJIHVzZSBpdCBpbiBteSBjdXJyZW50
IGltcGxlbWVudGF0aW9uLgoKPgo+IERvbid0IHlvdSB3YW50IHRoZSBuZXcgZXJyb3IgY29kZSBh
ZnRlciBkbWFfZmVuY2VfY2hhaW5fZmluZF9zZXFubygpIHRvbz8KTm8sIEkgZG9uJ3Qgd2FudCB0
byB0aGF0LCBJIGp1c3Qgd2FudCB0byBhIG1lYW5pbmdmdWwgYW5kIHVuaXF1ZSBlcnJvciAKY29k
ZSBmb3IgdW1kLgoKPgo+Cj4gV2hpY2ggbWFrZSBtZSByZWFsaXplIHRoZXJlIGlzIHByb2JhYmx5
IGEgYnVnIHdpdGggdGhpcyBjb2RlIDoKPgo+Cj4gcmV0ID0gZG1hX2ZlbmNlX2NoYWluX2ZpbmRf
c2Vxbm8oZmVuY2UsIHBvaW50KTsKPiBpZiAoIXJldCkKPiDCoMKgwqDCoMKgwqDCoCByZXR1cm4g
MDsKPiBkbWFfZmVuY2VfcHV0KCpmZW5jZSk7Cj4KPgo+IFNvdW5kcyBsaWtlIHRoZSBjb25kaXRp
b24gc2hvdWxkIGJlCj4KPiBpZiAocmV0KQo+Cj4gwqDCoMKgIMKgwqDCoCByZXR1cm4gcmV0Owo+
Cj4KPiBJIHJlYWxpemUgd2UgaGF2ZSBpbnRyb2R1Y2VkIGEgYmxvY2tpbmcgYmVoYXZpb3Igb24g
dGhlIHRyYW5zZmVyIGlvY3RsLgo+Cj4gSWYgd2UncmUgZ29pbmcgdG8gY2hhbmdlIHRoaXMgdG8g
cmV0dXJuIEVXT1VMREJMT0NLLCB3ZSBtaWdodCB3YW50IHRvIAo+IGdldCByaWQgb2YgaXQuClNv
dW5kcyByaWdodCwgYnV0IEkgdGhpbmsgY3VycmVudCBpbXBsZW1lbnRhdGlvbiBpcyBhY2NlcHRh
YmxlIGFzIHdlbGwuCgotRGF2aWQKPgo+Cj4gLUxpb25lbAo+Cj4KPj4gwqDCoMKgwqDCoCB9Cj4+
IMKgIMKgwqDCoMKgwqAgaWYgKCEoZmxhZ3MgJiBEUk1fU1lOQ09CSl9XQUlUX0ZMQUdTX1dBSVRf
Rk9SX1NVQk1JVCkpCj4+IEBAIC04MzIsNyArODMyLDcgQEAgc3RhdGljIHNpZ25lZCBsb25nIAo+
PiBkcm1fc3luY29ial9hcnJheV93YWl0X3RpbWVvdXQoc3RydWN0IGRybV9zeW5jb2JqICoqc3lu
Y29ianMsCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChmbGFncyAmIERSTV9TWU5D
T0JKX1dBSVRfRkxBR1NfV0FJVF9GT1JfU1VCTUlUKSB7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgY29udGludWU7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH0g
ZWxzZSB7Cj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdGltZW91dCA9IC1FSU5W
QUw7Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdGltZW91dCA9IC1FTk9UQkxL
Owo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGdvdG8gY2xlYW51cF9lbnRy
aWVzOwo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9Cj4+IMKgwqDCoMKgwqDCoMKgwqDC
oCB9Cj4KPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
