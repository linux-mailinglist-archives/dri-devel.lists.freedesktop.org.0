Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 91EA5104D11
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2019 09:00:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 998736ED57;
	Thu, 21 Nov 2019 08:00:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-eopbgr1310099.outbound.protection.outlook.com [40.107.131.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4B336EAB7
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2019 02:47:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cR2WqiHncsAYhRXUgl+WNnYzxvu7211H2O8lbaA8j25/+9nI0tewL7GvIWwUevbFOOwMnFuii173YnPrFQJagM2weJCc6B1kNpfVkNDp+JI1ZNkVASUBIgwaHmu0Y8a48J9AFBQDNE8/XEaNDaVuh4nBhrmR9AdZURxiwKnvPLNMes5kGE7xYP7e1Jvr1uFiV2Y8Ccrc9JTRiRWLHxSTEfryqGKQGuDK7lPsDvih2+wLuKW/M/7vzipV3ptmgHkBBFzqNED/8+io8SK6Pr2T5i4ZnPILjnQBQk/+nxmdX3k0DYzciAiwGnX8Vbs6l19Q+FpA13RwM6HrUIiZwomGGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KhG3u5uFIBkgXzhDA6J+f1Lj13g1qlp+EQQY5NgoWv4=;
 b=V8MMnx6/o8l3m514t7U4wVhF5YmMmXHHL5/hMP36crhHtZPgKnsj4h2/QqGLP8QPHD9JZgfBssaLTcH8B8yv8Wo/nC32kwrspNzUVsPMbslvHZU2E/tmrq34ZJHV5A7tc3o2IZVmc6Z/RFWdZJv8m0XhVFmfhP813TpRhLGJkKudoXPrLs/DUvMIhCBl97JRSbFet9AFCaTpqJ3ZDuqXWAaW6Or5OKQFGrAoCWjhyXP75alJ1XXZdiVXg5vgFCqKXHb5H3kGW+A9myzv7rtENLz4JRhc3Dsi4YUlxnL6EQcqcbzAj6/+ySJH7oklc1ZqA27oA/LdOeP6SZpd8dqzzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
Received: from PU1P153MB0169.APCP153.PROD.OUTLOOK.COM (10.170.189.13) by
 PU1P153MB0140.APCP153.PROD.OUTLOOK.COM (10.170.188.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.3; Thu, 21 Nov 2019 02:47:17 +0000
Received: from PU1P153MB0169.APCP153.PROD.OUTLOOK.COM
 ([fe80::704b:f2b6:33d:557a]) by PU1P153MB0169.APCP153.PROD.OUTLOOK.COM
 ([fe80::704b:f2b6:33d:557a%9]) with mapi id 15.20.2495.010; Thu, 21 Nov 2019
 02:47:17 +0000
From: Wei Hu <weh@microsoft.com>
To: Dexuan Cui <decui@microsoft.com>, KY Srinivasan <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, Stephen Hemminger
 <sthemmin@microsoft.com>, "sashal@kernel.org" <sashal@kernel.org>,
 "b.zolnierkie@samsung.com" <b.zolnierkie@samsung.com>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Michael Kelley
 <mikelley@microsoft.com>, Sasha Levin <Alexander.Levin@microsoft.com>
Subject: RE: [PATCH] video: hyperv_fb: Fix hibernation for the deferred IO
 feature
Thread-Topic: [PATCH] video: hyperv_fb: Fix hibernation for the deferred IO
 feature
Thread-Index: AQHVn3IaBpxutL9CjUq7Dxtj1Of6aKeU7Drw
Date: Thu, 21 Nov 2019 02:47:17 +0000
Message-ID: <PU1P153MB01699A8B75901F896F1E4503BB4E0@PU1P153MB0169.APCP153.PROD.OUTLOOK.COM>
References: <1574234028-48574-1-git-send-email-decui@microsoft.com>
In-Reply-To: <1574234028-48574-1-git-send-email-decui@microsoft.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=True;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Owner=weh@microsoft.com;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2019-11-21T02:47:14.6204741Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=General;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=7e51bbfc-6a79-4f24-a8ad-0c7f07e32939;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Extended_MSFT_Method=Automatic
x-originating-ip: [167.220.233.146]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 001c367f-1a7a-4580-27d3-08d76e2d1f83
x-ms-traffictypediagnostic: PU1P153MB0140:|PU1P153MB0140:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <PU1P153MB0140FD7265CA0524D11E5E31BB4E0@PU1P153MB0140.APCP153.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0228DDDDD7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39860400002)(136003)(366004)(396003)(376002)(346002)(199004)(189003)(13464003)(76116006)(66446008)(64756008)(33656002)(7696005)(10090500001)(76176011)(3846002)(6506007)(1511001)(8990500004)(53546011)(71200400001)(6116002)(71190400001)(8676002)(66066001)(6246003)(305945005)(2201001)(6636002)(7736002)(229853002)(99286004)(26005)(74316002)(6436002)(110136005)(52536014)(478600001)(966005)(25786009)(10290500003)(9686003)(14454004)(2906002)(86362001)(186003)(102836004)(55016002)(81166006)(476003)(11346002)(8936002)(2501003)(14444005)(256004)(5660300002)(316002)(81156014)(66476007)(66946007)(446003)(486006)(22452003)(66556008)(6306002)(921003)(1121003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:PU1P153MB0140;
 H:PU1P153MB0169.APCP153.PROD.OUTLOOK.COM; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microsoft.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AMl0iMpsWsM+xYs/hUOBop2wo50ifZYrGPAPFCqZWUdPAbNurvX3b//JL3PFP9Fy9sUSzlC+ZQZ6pEVpp/z0Ca4NdzHBklu0Z3ehC/ziqH+EIhdHegPKmDCuMVPqlQ4dP++YDKOhO2akHsDiqfiBQfpxo3ZYx5tGj8cmTzZdovf3gSMgS/WRH9nbNbPRr3C5T9h7Tq+13nXg8h2rRaAwUV79kRWLxbn/zdBqnSUGG4UpRqb9s4mD8z4pXrJ5rLAKnJUDIMTHB396Jedtm56I0OoixFWxl5QhhBoz3HdDYa7tdhR/m6ePWL+fV94um4WyIQHGqbM19hvfZT+M/mIui5Aaw7FC8J6DwjK+1/7sbRNPZNeacgjcNjx1iQoZIpcf4G2N1iosYcZLxaq23nqb8T5yomfty4RMtR29tRsJZgyoqb4Bkt8oFTKt0jWPNWZ1sAy1t7KDr1OlxJH2Nq8qQPV2C5soJGjSAze//KPfl1A=
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 001c367f-1a7a-4580-27d3-08d76e2d1f83
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2019 02:47:17.1430 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AZfHwwLxt8mwTWUUv2vTAyA5wgyzITXF1ypleNuZNxROYy10E6XLtSRcC2EP37VgezxgZnkXBL4tJFxvflsqXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU1P153MB0140
X-Mailman-Approved-At: Thu, 21 Nov 2019 07:59:20 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microsoft.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KhG3u5uFIBkgXzhDA6J+f1Lj13g1qlp+EQQY5NgoWv4=;
 b=ejsEFJ+Sj+ovMvyDBBKv4ELgxTuaHoJEQ6ljEGQcRyKRhPep//OXJHHXE2jy6DQBcQ+HbPBzX8B9Bz7I8E2Ne0q6Rtq3kGM/0/T8XThX4jY6vJ6ppz5rD9qxOf26LXqIa7Xvyf8Iom63FfaWGahcT0aomI4/BvgtADK4LZ+jQjs=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=weh@microsoft.com; 
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IERleHVhbiBDdWkgPGRlY3VpQG1p
Y3Jvc29mdC5jb20+Cj4gU2VudDogV2VkbmVzZGF5LCBOb3ZlbWJlciAyMCwgMjAxOSAzOjE0IFBN
Cj4gVG86IEtZIFNyaW5pdmFzYW4gPGt5c0BtaWNyb3NvZnQuY29tPjsgSGFpeWFuZyBaaGFuZwo+
IDxoYWl5YW5nekBtaWNyb3NvZnQuY29tPjsgU3RlcGhlbiBIZW1taW5nZXIgPHN0aGVtbWluQG1p
Y3Jvc29mdC5jb20+Owo+IHNhc2hhbEBrZXJuZWwub3JnOyBiLnpvbG5pZXJraWVAc2Ftc3VuZy5j
b207IGxpbnV4LWh5cGVydkB2Z2VyLmtlcm5lbC5vcmc7Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZzsgbGludXgtZmJkZXZAdmdlci5rZXJuZWwub3JnOyBsaW51eC0KPiBrZXJuZWxA
dmdlci5rZXJuZWwub3JnOyBNaWNoYWVsIEtlbGxleSA8bWlrZWxsZXlAbWljcm9zb2Z0LmNvbT47
IFNhc2hhIExldmluCj4gPEFsZXhhbmRlci5MZXZpbkBtaWNyb3NvZnQuY29tPgo+IENjOiBXZWkg
SHUgPHdlaEBtaWNyb3NvZnQuY29tPjsgRGV4dWFuIEN1aSA8ZGVjdWlAbWljcm9zb2Z0LmNvbT4K
PiBTdWJqZWN0OiBbUEFUQ0hdIHZpZGVvOiBoeXBlcnZfZmI6IEZpeCBoaWJlcm5hdGlvbiBmb3Ig
dGhlIGRlZmVycmVkIElPIGZlYXR1cmUKPiAKPiBmYl9kZWZlcnJlZF9pb193b3JrKCkgY2FuIGFj
Y2VzcyB0aGUgdm1idXMgcmluZ2J1ZmZlciBieSBjYWxsaW5nCj4gZmJkZWZpby0+ZGVmZXJyZWRf
aW8oKSAtPiBzeW50aHZpZF9kZWZlcnJlZF9pbygpIC0+IHN5bnRodmlkX3VwZGF0ZSgpLgo+IAo+
IEJlY2F1c2UgdGhlIHZtYnVzIHJpbmdidWZmZXIgaXMgaW5hY2Nlc3NpYmxlIGJldHdlZW4gaHZm
Yl9zdXNwZW5kKCkgYW5kCj4gaHZmYl9yZXN1bWUoKSwgd2UgbXVzdCBjYW5jZWwgaW5mby0+ZGVm
ZXJyZWRfd29yayBiZWZvcmUgY2FsbGluZwo+IHZtYnVzX2Nsb3NlKCkgYW5kIHRoZW4gcmVzY2hl
ZHVsZSBpdCBhZnRlciB3ZSByZW9wZW4gdGhlIGNoYW5uZWwgaW4KPiBodmZiX3Jlc3VtZSgpLgo+
IAo+IEZpeGVzOiBhNGRkYjExZDI5N2UgKCJ2aWRlbzogaHlwZXJ2OiBoeXBlcnZfZmI6IFN1cHBv
cnQgZGVmZXJyZWQgSU8gZm9yCj4gSHlwZXItViBmcmFtZSBidWZmZXIgZHJpdmVyIikKPiBGaXhl
czogODI0OTQ2YThiNmZiICgidmlkZW86IGh5cGVydl9mYjogQWRkIHRoZSBzdXBwb3J0IG9mIGhp
YmVybmF0aW9uIikKPiBTaWduZWQtb2ZmLWJ5OiBEZXh1YW4gQ3VpIDxkZWN1aUBtaWNyb3NvZnQu
Y29tPgo+IC0tLQo+IAo+IFRoaXMgcGF0Y2ggZml4ZXMgdGhlIDIgYWZvcmVtZW50aW9uZWQgcGF0
Y2hlcyBvbiBTYXNoYSBMZXZpbidzIEh5cGVyLVYgdHJlZSdzCj4gaHlwZXJ2LW5leHQgYnJhbmNo
Ogo+IGh0dHBzOi8vbmFtMDYuc2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9vay5jb20vP3VybD1o
dHRwcyUzQSUyRiUyRmdpdC5rZXJuCj4gZWwub3JnJTJGcHViJTJGc2NtJTJGbGludXglMkZrZXJu
ZWwlMkZnaXQlMkZoeXBlcnYlMkZsaW51eC5naXQlMkZsb2cKPiAlMkYlM0ZoJTNEaHlwZXJ2LQo+
IG5leHQmYW1wO2RhdGE9MDIlN0MwMSU3Q3dlaCU0MG1pY3Jvc29mdC5jb20lN0M0NTExNDNmZjc4
ZjA0NDAxZDkKPiA2ZjA4ZDc2ZDg5M2E4NCU3QzcyZjk4OGJmODZmMTQxYWY5MWFiMmQ3Y2QwMTFk
YjQ3JTdDMSU3QzAlN0M2MzcKPiAwOTgzMDg0OTMyMTcxMjEmYW1wO3NkYXRhPVAyZm8lMkYxVEpV
TUlqNUZ0SkNPcDJRd0RyZ2hoVmZQU0NFSjRmMQo+IHZrT1h2SSUzRCZhbXA7cmVzZXJ2ZWQ9MAo+
IAo+IFRoZSAyIGFmb3JlbWVudGlvbmVkIHBhdGNoZXMgaGF2ZSBub3QgYXBwZWFyZWQgaW4gdGhl
IG1haW5saW5lIHlldCwgc28gcGxlYXNlCj4gcGljayB1cCB0aGlzIHBhdGNoIG9udG8gaGUgc2Ft
ZSBoeXBlcnYtbmV4dCBicmFuY2guCj4gCj4gIGRyaXZlcnMvdmlkZW8vZmJkZXYvaHlwZXJ2X2Zi
LmMgfCAyICsrCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy92aWRlby9mYmRldi9oeXBlcnZfZmIuYyBiL2RyaXZlcnMvdmlkZW8vZmJk
ZXYvaHlwZXJ2X2ZiLmMKPiBpbmRleCA0Y2QyN2U1MTcyYTEuLjA4YmMwZGZiNWNlNyAxMDA2NDQK
PiAtLS0gYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2h5cGVydl9mYi5jCj4gKysrIGIvZHJpdmVycy92
aWRlby9mYmRldi9oeXBlcnZfZmIuYwo+IEBAIC0xMTk0LDYgKzExOTQsNyBAQCBzdGF0aWMgaW50
IGh2ZmJfc3VzcGVuZChzdHJ1Y3QgaHZfZGV2aWNlICpoZGV2KQo+ICAJZmJfc2V0X3N1c3BlbmQo
aW5mbywgMSk7Cj4gCj4gIAljYW5jZWxfZGVsYXllZF93b3JrX3N5bmMoJnBhci0+ZHdvcmspOwo+
ICsJY2FuY2VsX2RlbGF5ZWRfd29ya19zeW5jKCZpbmZvLT5kZWZlcnJlZF93b3JrKTsKPiAKPiAg
CXBhci0+dXBkYXRlX3NhdmVkID0gcGFyLT51cGRhdGU7Cj4gIAlwYXItPnVwZGF0ZSA9IGZhbHNl
Owo+IEBAIC0xMjI3LDYgKzEyMjgsNyBAQCBzdGF0aWMgaW50IGh2ZmJfcmVzdW1lKHN0cnVjdCBo
dl9kZXZpY2UgKmhkZXYpCj4gIAlwYXItPmZiX3JlYWR5ID0gdHJ1ZTsKPiAgCXBhci0+dXBkYXRl
ID0gcGFyLT51cGRhdGVfc2F2ZWQ7Cj4gCj4gKwlzY2hlZHVsZV9kZWxheWVkX3dvcmsoJmluZm8t
PmRlZmVycmVkX3dvcmssIGluZm8tPmZiZGVmaW8tPmRlbGF5KTsKPiAgCXNjaGVkdWxlX2RlbGF5
ZWRfd29yaygmcGFyLT5kd29yaywgSFZGQl9VUERBVEVfREVMQVkpOwo+IAo+ICAJLyogMCBtZWFu
cyBkbyByZXN1bWUgKi8KPiAtLQo+IDIuMTkuMQoKU2lnbmVkLW9mZi1ieTogV2VpIEh1IDx3ZWhA
bWljcm9zb2Z0LmNvbT4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
