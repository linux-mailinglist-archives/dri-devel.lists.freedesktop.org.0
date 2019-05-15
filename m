Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DDCC21EB7C
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2019 11:53:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02607897E8;
	Wed, 15 May 2019 09:53:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820070.outbound.protection.outlook.com [40.107.82.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B2AB897E8;
 Wed, 15 May 2019 09:53:36 +0000 (UTC)
Received: from MN2PR12MB3309.namprd12.prod.outlook.com (20.179.83.157) by
 MN2PR12MB3647.namprd12.prod.outlook.com (20.178.241.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.25; Wed, 15 May 2019 09:53:34 +0000
Received: from MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::2918:1f51:2768:efc0]) by MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::2918:1f51:2768:efc0%3]) with mapi id 15.20.1878.024; Wed, 15 May 2019
 09:53:34 +0000
From: "Huang, Ray" <Ray.Huang@amd.com>
To: Dan Carpenter <dan.carpenter@oracle.com>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>
Subject: RE: [PATCH] drm/amd/powerplay: fix locking in
 smu_feature_set_supported()
Thread-Topic: [PATCH] drm/amd/powerplay: fix locking in
 smu_feature_set_supported()
Thread-Index: AQHVCwPOpB/hJLSRrUiLtn9T08l916Zr8bjw
Date: Wed, 15 May 2019 09:53:33 +0000
Message-ID: <MN2PR12MB33099BF7946484E6AE1F75F5EC090@MN2PR12MB3309.namprd12.prod.outlook.com>
References: <20190515095130.GF3409@mwanda>
In-Reply-To: <20190515095130.GF3409@mwanda>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f7dcbf1f-96d1-4da5-9e6a-08d6d91b31b5
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3647; 
x-ms-traffictypediagnostic: MN2PR12MB3647:
x-microsoft-antispam-prvs: <MN2PR12MB364730FBD7903C81C0FF29F6EC090@MN2PR12MB3647.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 0038DE95A2
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(346002)(366004)(396003)(136003)(376002)(189003)(199004)(13464003)(74316002)(25786009)(478600001)(6246003)(68736007)(53936002)(86362001)(99286004)(6636002)(66066001)(71200400001)(71190400001)(54906003)(72206003)(305945005)(110136005)(7736002)(14444005)(76176011)(256004)(7696005)(52536014)(446003)(26005)(186003)(11346002)(14454004)(486006)(476003)(66476007)(66556008)(64756008)(66446008)(66946007)(73956011)(8676002)(55016002)(81156014)(8936002)(316002)(6506007)(102836004)(53546011)(9686003)(81166006)(5660300002)(229853002)(4326008)(6116002)(3846002)(2906002)(76116006)(33656002)(6436002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3647;
 H:MN2PR12MB3309.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: tak69VBt5fKPVC92dIaWuSQRgSJKy8YsWB6/0DRZ6DgBY0ywYlTM0ISM2t5HVHda6wWqId7foMbQPWBQAllHmwk9mUFp5q/XJv4r0By9BJ/ScxUYT6S8p83iSfEh3U9J1IlU0UMJMOzLVMQFCifaOP1ELb1b8Oxwurn4vXEiLWe16S/NOzSLQCckuY2ugnqKpaEfrNus4SHZjaCwWrtqlwcMgoF3daaH1xjoNRy7b8JTlXb8j73K9lClObfpfQYgGhgM4IaWEAUVdGT7pdXq9YS3dMN2Fp7G5Nr2hG2zLvJP1CsCbDMN0mrOpnL89gqKh3NRknixGDYQW2HsgRXpiYYiaSPRV4YXq6p5ujYq9SLow3+OCQppi5+bxNyeSwGIrX1Re+N64CCoeu7HrYZgph6p0qJLk/Eh4Ga5wCMt9lE=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7dcbf1f-96d1-4da5-9e6a-08d6d91b31b5
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2019 09:53:33.9403 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3647
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Or52atg8YJnOTTBGFPQiFNxPXaFfve+O3QanFTK33VE=;
 b=LPGA0H2QgVlutUBy48zTaj3to2bhXS8SoQr3yl9BWkj7wTqZIUt+CTwlUnpqzMK4fiprmSuvXd9895dVavsMEhvVWFaTcYAQtDIut5MaRSMHASHtFzHpGDzdjenyKkhrqa0jpvfBaS/hFsZ6XTx8EFHdBMjs7WAF48qwhfTHL4g=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Ray.Huang@amd.com; 
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
Cc: "Gui, Jack" <Jack.Gui@amd.com>, David Airlie <airlied@linux.ie>,
 "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Gao,
 Likun" <Likun.Gao@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IERhbiBDYXJwZW50ZXIgPGRhbi5j
YXJwZW50ZXJAb3JhY2xlLmNvbT4KPiBTZW50OiBXZWRuZXNkYXksIE1heSAxNSwgMjAxOSA1OjUy
IFBNCj4gVG86IERldWNoZXIsIEFsZXhhbmRlciA8QWxleGFuZGVyLkRldWNoZXJAYW1kLmNvbT47
IFdhbmcsIEtldmluKFlhbmcpCj4gPEtldmluMS5XYW5nQGFtZC5jb20+Cj4gQ2M6IEtvZW5pZywg
Q2hyaXN0aWFuIDxDaHJpc3RpYW4uS29lbmlnQGFtZC5jb20+OyBaaG91LCBEYXZpZChDaHVuTWlu
ZykKPiA8RGF2aWQxLlpob3VAYW1kLmNvbT47IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5p
ZT47IERhbmllbCBWZXR0ZXIKPiA8ZGFuaWVsQGZmd2xsLmNoPjsgSHVhbmcsIFJheSA8UmF5Lkh1
YW5nQGFtZC5jb20+OyBHYW8sIExpa3VuCj4gPExpa3VuLkdhb0BhbWQuY29tPjsgR3VpLCBKYWNr
IDxKYWNrLkd1aUBhbWQuY29tPjsgYW1kLQo+IGdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGxpbnV4LQo+IGtlcm5lbEB2Z2VyLmtlcm5l
bC5vcmc7IGtlcm5lbC1qYW5pdG9yc0B2Z2VyLmtlcm5lbC5vcmcKPiBTdWJqZWN0OiBbUEFUQ0hd
IGRybS9hbWQvcG93ZXJwbGF5OiBmaXggbG9ja2luZyBpbgo+IHNtdV9mZWF0dXJlX3NldF9zdXBw
b3J0ZWQoKQo+IAo+IFRoZXJlIGlzIGEgdHlwbyBzbyB0aGUgY29kZSB1bmxvY2tzIHR3aWNlIGlu
c3RlYWQgb2YgdGFraW5nIHRoZSBsb2NrIGFuZCB0aGVuCj4gcmVsZWFzaW5nIGl0Lgo+IAo+IEZp
eGVzOiBmMTRhMzIzZGI1YjAgKCJkcm0vYW1kL3Bvd2VycGxheTogaW1wbGVtZW50IHVwZGF0ZSBl
bmFibGVkCj4gZmVhdHVyZSBzdGF0ZSB0byBzbWMgZm9yIHNtdTExIikKPiBTaWduZWQtb2ZmLWJ5
OiBEYW4gQ2FycGVudGVyIDxkYW4uY2FycGVudGVyQG9yYWNsZS5jb20+Cj4gCgpUaGFua3MhClJl
dmlld2VkLWJ5OiBIdWFuZyBSdWkgPHJheS5odWFuZ0BhbWQuY29tPgoKV2lsbCBhcHBseSBpdC4K
Ci0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hbWRncHVfc211LmMgfCAyICst
Cj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hbWRncHVfc211LmMKPiBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZGdwdV9zbXUuYwo+IGluZGV4IDUyZDkx
OWE4YjcwYS4uODVhYzI5YWY1MzYzIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
cG93ZXJwbGF5L2FtZGdwdV9zbXUuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJw
bGF5L2FtZGdwdV9zbXUuYwo+IEBAIC0zMTAsNyArMzEwLDcgQEAgaW50IHNtdV9mZWF0dXJlX3Nl
dF9zdXBwb3J0ZWQoc3RydWN0IHNtdV9jb250ZXh0Cj4gKnNtdSwgaW50IGZlYXR1cmVfaWQsCj4g
Cj4gICAgICAgICBXQVJOX09OKGZlYXR1cmVfaWQgPiBmZWF0dXJlLT5mZWF0dXJlX251bSk7Cj4g
Cj4gLSAgICAgICBtdXRleF91bmxvY2soJmZlYXR1cmUtPm11dGV4KTsKPiArICAgICAgIG11dGV4
X2xvY2soJmZlYXR1cmUtPm11dGV4KTsKPiAgICAgICAgIGlmIChlbmFibGUpCj4gICAgICAgICAg
ICAgICAgIHRlc3RfYW5kX3NldF9iaXQoZmVhdHVyZV9pZCwgZmVhdHVyZS0+c3VwcG9ydGVkKTsK
PiAgICAgICAgIGVsc2UKPiAtLQo+IDIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
