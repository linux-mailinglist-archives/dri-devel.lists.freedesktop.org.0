Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 45CBB1027B0
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2019 16:09:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E493F6E956;
	Tue, 19 Nov 2019 15:09:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820050.outbound.protection.outlook.com [40.107.82.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 370676E956;
 Tue, 19 Nov 2019 15:09:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GCtBptmKcY/syifJYtp7QvqxbranSVLOYdYYGmky9aMtarzebXiMhVtSiy7EbfL70G2t9aF3/c065kkEQ2bo163hjYuodzwgciEyG6CfjPmvLy61AKvNiyVIrozT9wVabs6mR0hFBBAVRet1VqyyLIwZ1SMIzbZU+M1xb4U/M6MvLRtMBXCAHkln2CVwIQUOvbPEjnEqiqu67xXf+9o6Tci11ckRMS0apWY6vHihh5ym8LIWnlNvpQ3U2zeICaqxCfqxZlcjRy40uWHja1m4qx7UB7AFNtvLXakXN6jJKxhIslFIiobrtCud82sNMQZW4MlVBR5tKWKwQSnTBm+7cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NkKeG4NnehDiMdIP90rbe+JEtDZFvax8ZTPmNw9pF+A=;
 b=VJRzeM4aCfsUnMtQzWE/gcpiTaTd78gf9Lh+Hgbvl4llCLFYqqjuASqDW6TjCRyIf4VCJEiS4R+YCkdGmLHkc7S1FJuFNXLQOpY1NrkVVE1JrkcI/qyHlKhgP9FRMY6K1djaegwx9KCjbDo+4l01wodAuT5B+hOFauUPc/I1lXG0E03RyG1RG/PM9u+DIrpffH+OPfDJ537UqVNmGKcXl81XlKSmXEo7q2Xgexixrn5UYjzqmf3bpIuxwBeIZmRMD2WtPiPL/ZgjccYQp+h9fLFeSxfgck83jua9Yd9kii/47CpVecpBAzBxZA426RiGSuRTUlqKTfjrvZJxKC/Uqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BYAPR12MB3013.namprd12.prod.outlook.com (20.178.55.219) by
 BYAPR12MB2790.namprd12.prod.outlook.com (20.176.255.220) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2451.30; Tue, 19 Nov 2019 15:09:01 +0000
Received: from BYAPR12MB3013.namprd12.prod.outlook.com
 ([fe80::1174:3feb:de01:4fb9]) by BYAPR12MB3013.namprd12.prod.outlook.com
 ([fe80::1174:3feb:de01:4fb9%6]) with mapi id 15.20.2451.031; Tue, 19 Nov 2019
 15:09:01 +0000
Subject: Re: [PATCH] drm/dsc: Return unsigned long on compute offset
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 mikita.lipski@amd.com
References: <20191119144526.31797-1-mikita.lipski@amd.com>
 <20191119145649.GZ1208@intel.com>
From: Mikita Lipski <mlipski@amd.com>
Organization: AMD
Message-ID: <f7b705a8-9d6a-1db3-e261-a80aca57454a@amd.com>
Date: Tue, 19 Nov 2019 10:08:24 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <20191119145649.GZ1208@intel.com>
Content-Language: en-US
X-ClientProxiedBy: YTBPR01CA0005.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::18) To BYAPR12MB3013.namprd12.prod.outlook.com
 (2603:10b6:a03:a9::27)
MIME-Version: 1.0
X-Originating-IP: [165.204.55.250]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ab9d5395-bae7-4088-5ca6-08d76d0268db
X-MS-TrafficTypeDiagnostic: BYAPR12MB2790:
X-MS-Exchange-PUrlCount: 1
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR12MB2790599457A05B59260EE0D5E44C0@BYAPR12MB2790.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-Forefront-PRVS: 022649CC2C
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(136003)(346002)(376002)(39860400002)(396003)(189003)(199004)(7736002)(81156014)(11346002)(81166006)(99286004)(8676002)(4326008)(8936002)(446003)(66556008)(50466002)(65806001)(47776003)(65956001)(2870700001)(66066001)(66946007)(36756003)(2616005)(66476007)(476003)(6246003)(486006)(6512007)(6306002)(6666004)(14444005)(31686004)(478600001)(76176011)(316002)(6486002)(186003)(5660300002)(14454004)(6636002)(26005)(386003)(6506007)(53546011)(58126008)(66574012)(966005)(23676004)(2486003)(31696002)(229853002)(6436002)(36916002)(25786009)(3846002)(2906002)(305945005)(52116002)(6116002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB2790;
 H:BYAPR12MB3013.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xRV/oVs8omGhSmIe/0+p/J8G0GPNSsY9eTsFsf7cuONa91Fh+qB2CxNcQpXUw9hDuejYvIJcOwCQfqjw0dpWYGAVft4Nz05ZpRydbwFLgjuxg5/yeNceV6zDupBK+HPKlx+2jXuUA/9y/UjwV6S/S80yHvyvKsmLcVenWDy7AJnGj4P2rcNSjxm2fkAyzghGIPGGQHwr/kfXuoVkRuDvrQSOn/jnMayevaXdzY6XNq/o2Z/t3+HybuTznTaNl54ckKMfWRzfwpPrAjvfIfSDwP0nzGKgjzUXiIVNue0OUTX7PU7JuEZbLqn+EOOiZ0/csBRDTz0HdgXMB8iUuPYdnvYiPPEkTOI48uW8Ydzqqfk2mnxl8lSGME3FfTyl5OA+SUVnRe2Bv2oHWIgvyuJCoUlH/OGHWaHS9EKIilmE94PmHF6mfi2moICZFvVLNiZRkpDP5AJ+WN8d5W4lyrcEebIYvOI2/55o9j3L+Jwz0WI=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab9d5395-bae7-4088-5ca6-08d76d0268db
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2019 15:09:01.5331 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UBL4SSR5Mqvy2DBbdXiTWerlJ9sRs3oA1usBkiJWLbCUJy3Cciv0bI15Q3SGXKG6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2790
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NkKeG4NnehDiMdIP90rbe+JEtDZFvax8ZTPmNw9pF+A=;
 b=ZLnPIDfxhIBjjO/B2lVHdTbiF5jwjpUiW95gdS1JKbQrytTuEXcoRhAb8rBRs6SM7YiR3fZZli41iJUscPT6+1HdFxBZqbiFxrYQ5Aft8l87xkNdYEk1ycbIu6ogvB5li6/HuLZEL0dAEj42Nh6OiJ44S8wnft2LkZw7HW6IE3o=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mikita.Lipski@amd.com; 
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Nikola Cornij <nikola.cornij@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpPbiAxOS8xMS8yMDE5IDA5OjU2LCBWaWxsZSBTeXJqw6Rsw6Qgd3JvdGU6Cj4gT24gVHVlLCBO
b3YgMTksIDIwMTkgYXQgMDk6NDU6MjZBTSAtMDUwMCwgbWlraXRhLmxpcHNraUBhbWQuY29tIHdy
b3RlOgo+PiBGcm9tOiBNaWtpdGEgTGlwc2tpIDxtaWtpdGEubGlwc2tpQGFtZC5jb20+Cj4+Cj4+
IFdlIHNob3VsZG4ndCBjb21wYXJlIGludCB3aXRoIHVuc2lnbmVkIGxvbmcgdG8gZmluZCB0aGUg
bWF4IHZhbHVlCj4+IGFuZCBzaW5jZSB3ZSBhcmUgbm90IGV4cGVjdGluZyBuZWdhdGl2ZSB2YWx1
ZSByZXR1cm5lZCBmcm9tCj4+IGNvbXB1dGVfb2Zmc2V0IHdlIHNob3VsZCBtYWtlIHRoaXMgZnVu
Y3Rpb24gcmV0dXJuIHVuc2lnbmVkIGxvbmcKPj4gc28gd2UgY2FuIGNvbXBhcmUgdGhlIHZhbHVl
cyB3aGVuIGNvbXB1dGluZyByYyBwYXJhbWV0ZXJzLgo+IAo+IFdoeSBhcmUgdGhlcmUgb3RoZXIg
dW5zaWduZWQgbG9uZ3MgaW4gZHNjIHBhcmFtZXRlciBjb21wdXRhdGlvbgo+IGluIHRoZSBmaXJz
dCBwbGFjZT8KCkkgYmVsaWV2ZSBpdCB3YXMgaW5pdGlhbGx5IHNldCB0byBiZSB1bnNpZ25lZCBs
b25nIGZvciB2YXJpYWJsZSAKY29uc2lzdGVuY3ksIHdoZW4gd2UgcG9ydGVkIGludGVsX2NvbXB1
dGVfcmNfcGFyYW1ldGVycyBpbnRvIApkcm1fZHNjX2NvbXB1dGVfcmNfcGFyYW1ldGVycy4gQnV0
IG5vdyB0aGF0IEkgbG9vayBhdCBpdCwgd2UgY2FuIAphY3R1YWxseSBqdXN0IHNldCB0aGVtIHRv
IHUzMiBvciB1NjQsIGFzIG5vdGhpbmcgc2hvdWxkIGV4Y2VlZCB0aGF0Lgo+IAo+Pgo+PiBDYzog
Tmlrb2xhIENvcm5paiA8bmlrb2xhLmNvcm5pakBhbWQuY29tPgo+PiBDYzogSGFycnkgV2VudGxh
bmQgPGhhcnJ5LndlbnRsYW5kQGFtZC5jb20+Cj4+IFNpZ25lZC1vZmYtYnk6IE1pa2l0YSBMaXBz
a2kgPG1pa2l0YS5saXBza2lAYW1kLmNvbT4KPj4gLS0tCj4+ICAgZHJpdmVycy9ncHUvZHJtL2Ry
bV9kc2MuYyB8IDYgKysrLS0tCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwg
MyBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHNj
LmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RzYy5jCj4+IGluZGV4IDc0ZjM1MjdmNTY3ZC4uZWM0
MDYwNGFiNmEyIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RzYy5jCj4+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHNjLmMKPj4gQEAgLTI0NSwxMSArMjQ1LDExIEBAIHZv
aWQgZHJtX2RzY19wcHNfcGF5bG9hZF9wYWNrKHN0cnVjdCBkcm1fZHNjX3BpY3R1cmVfcGFyYW1l
dGVyX3NldCAqcHBzX3BheWxvYWQsCj4+ICAgfQo+PiAgIEVYUE9SVF9TWU1CT0woZHJtX2RzY19w
cHNfcGF5bG9hZF9wYWNrKTsKPj4gICAKPj4gLXN0YXRpYyBpbnQgY29tcHV0ZV9vZmZzZXQoc3Ry
dWN0IGRybV9kc2NfY29uZmlnICp2ZHNjX2NmZywgaW50IHBpeGVsc19wZXJfZ3JvdXAsCj4+ICtz
dGF0aWMgdW5zaWduZWQgbG9uZyBjb21wdXRlX29mZnNldChzdHJ1Y3QgZHJtX2RzY19jb25maWcg
KnZkc2NfY2ZnLCBpbnQgcGl4ZWxzX3Blcl9ncm91cCwKPj4gICAJCQkJaW50IGdyb3Vwc19wZXJf
bGluZSwgaW50IGdycGNudCkKPj4gICB7Cj4+IC0JaW50IG9mZnNldCA9IDA7Cj4+IC0JaW50IGdy
cGNudF9pZCA9IERJVl9ST1VORF9VUCh2ZHNjX2NmZy0+aW5pdGlhbF94bWl0X2RlbGF5LCBwaXhl
bHNfcGVyX2dyb3VwKTsKPj4gKwl1bnNpZ25lZCBsb25nIG9mZnNldCA9IDA7Cj4+ICsJdW5zaWdu
ZWQgbG9uZyBncnBjbnRfaWQgPSBESVZfUk9VTkRfVVAodmRzY19jZmctPmluaXRpYWxfeG1pdF9k
ZWxheSwgcGl4ZWxzX3Blcl9ncm91cCk7Cj4+ICAgCj4+ICAgCWlmIChncnBjbnQgPD0gZ3JwY250
X2lkKQo+PiAgIAkJb2Zmc2V0ID0gRElWX1JPVU5EX1VQKGdycGNudCAqIHBpeGVsc19wZXJfZ3Jv
dXAgKiB2ZHNjX2NmZy0+Yml0c19wZXJfcGl4ZWwsIDE2KTsKPj4gLS0gCj4+IDIuMTcuMQo+Pgo+
PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+PiBkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0Cj4+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPj4g
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
PiAKCi0tIApUaGFua3MsCk1pa2l0YSBMaXBza2kKU29mdHdhcmUgRW5naW5lZXIgMiwgQU1ECm1p
a2l0YS5saXBza2lAYW1kLmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
