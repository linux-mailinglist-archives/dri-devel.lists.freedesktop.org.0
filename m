Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 51DC5AB2E1
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2019 09:01:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D189F6E161;
	Fri,  6 Sep 2019 07:01:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800137.outbound.protection.outlook.com [40.107.80.137])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CD856E0D2
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Sep 2019 14:05:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vq68ixzBsxfm6hf8jSEk3SVAtSePv9NEq6b7glrIO4XOElKcnDYhJYW5P2314x0wY8+rHy6ZShJkLs2xkRS/fFCDjoSH8WC7KxFjFozH3CnQ+6Gh/2nuAZpRC5pU7cDR1Rx9StFdAIGx5E0t6brbZnNv8DCmEDwBjgMfFXQe1HGQwAhQGwpmD/nYyuNO8P/Bv2kDs6o16M9/kOZsMoDgnohOxFc+Lp9YH3EOCYv8LtW/CiT4kXXZ8aXYVG+gIDjsaYQ1cgjHsLJ2glOAOrvmoZ53kggPGIZ2m/JmtlStgQXrsl27VsfEC94vxHhdOcQw1370y15dWJaDjqvbgmwXfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Iavyn5/LeMujLUYzJfuyfS+4LKPlHifEu2K00ZmAld0=;
 b=NLO8hrYT/trBeqndA4ZG55KBCzIvtZswJUj7j3i3E3BfyMOIIS1hOOA07ijkqjAAcZXH9aFsIzAOZ7VOfXd1CQsBrw0eqxIcPj3HDIy5cmzCRRtElKBmfxXAytRxgswOrwj2CrEwjW2awRjZo6XisYPNdkPxfctGjA8SnXwXDoivvGRGc4IPmTP7mSl93PnAwO7plSTG0hseRIdDsusPDNk0iAS+lYBEeClrWGp2ylFfq2Rean7leO6/fUqHvYLYp0BX1G1WjFVsKmaas8N3NIM2NPF0u0i3RHtVMUUMALnixdlc/N72qExcT/BHOp1jFetdpChPHpDhFHPan2d4fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
Received: from DM5PR21MB0137.namprd21.prod.outlook.com (10.173.173.12) by
 DM5PR21MB0843.namprd21.prod.outlook.com (10.173.172.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.7; Thu, 5 Sep 2019 14:05:49 +0000
Received: from DM5PR21MB0137.namprd21.prod.outlook.com
 ([fe80::c437:6219:efcc:fb8a]) by DM5PR21MB0137.namprd21.prod.outlook.com
 ([fe80::c437:6219:efcc:fb8a%7]) with mapi id 15.20.2263.004; Thu, 5 Sep 2019
 14:05:49 +0000
From: Michael Kelley <mikelley@microsoft.com>
To: Wei Hu <weh@microsoft.com>, "b.zolnierkie@samsung.com"
 <b.zolnierkie@samsung.com>, "linux-hyperv@vger.kernel.org"
 <linux-hyperv@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-fbdev@vger.kernel.org"
 <linux-fbdev@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Stephen Hemminger <sthemmin@microsoft.com>,
 "sashal@kernel.org" <sashal@kernel.org>, Haiyang Zhang
 <haiyangz@microsoft.com>, KY Srinivasan <kys@microsoft.com>, Dexuan Cui
 <decui@microsoft.com>
Subject: RE: [PATCH v4] video: hyperv: hyperv_fb: Obtain screen resolution
 from Hyper-V host
Thread-Topic: [PATCH v4] video: hyperv: hyperv_fb: Obtain screen resolution
 from Hyper-V host
Thread-Index: AQHVY8n1ZHStyEKyQEWtq6qT8x1cIqcdHi/Q
Date: Thu, 5 Sep 2019 14:05:49 +0000
Message-ID: <DM5PR21MB0137D40DF705CDB372497266D7BB0@DM5PR21MB0137.namprd21.prod.outlook.com>
References: <20190905091120.16761-1-weh@microsoft.com>
In-Reply-To: <20190905091120.16761-1-weh@microsoft.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=True;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Owner=mikelley@ntdev.microsoft.com;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2019-09-05T14:05:47.2964572Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=General;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=5fdc59c0-9d8b-4103-9a31-ed8f82961311;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Extended_MSFT_Method=Automatic
x-originating-ip: [24.22.167.197]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e1eebf27-c839-4db0-5391-08d7320a27ae
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR21MB0843; 
x-ms-traffictypediagnostic: DM5PR21MB0843:|DM5PR21MB0843:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR21MB0843C0D93057DFE6CACADD72D7BB0@DM5PR21MB0843.namprd21.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 015114592F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(366004)(136003)(376002)(346002)(396003)(39860400002)(199004)(189003)(2201001)(86362001)(4744005)(478600001)(6636002)(81166006)(10290500003)(6506007)(33656002)(52536014)(229853002)(8676002)(81156014)(8936002)(66066001)(76176011)(14454004)(99286004)(1511001)(5660300002)(186003)(486006)(25786009)(4326008)(476003)(10090500001)(2906002)(6246003)(3846002)(107886003)(53936002)(9686003)(446003)(55016002)(7696005)(256004)(2501003)(11346002)(6436002)(66556008)(26005)(305945005)(71190400001)(71200400001)(6116002)(316002)(7736002)(102836004)(8990500004)(110136005)(22452003)(66476007)(64756008)(66946007)(66446008)(76116006)(74316002)(921003)(1121003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM5PR21MB0843;
 H:DM5PR21MB0137.namprd21.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microsoft.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 62YoNtJ4rqfQGlhygqWLMdIVo1wXXYN0fPuOwwiHuBNm4s8SprVSmiTZjt1iA2sq1NYP1600XBULdzJkvbvtXFjnX/8eKW8e9vOWN8mptx8OWSsjma1zgzae0wCLUPzvuvWQc3oRvODyrgIdvouF4oqAdV6lFMs24CPNME8j6Iu9mQv/uLarojb8PQodn+M6mA+RGmy3ESalnss2W6U0nC3onQTLUSB+nyWdNSoP9Huu+V70m8vXgLOlbBImINffzZKjeAaZ0yBFFDwbCfV8KQh7S793o2uOmkKiIHIZwo1SBEkNobJkPEe55tr7WOO4/hIGBqIcThq+g5if9W2qWB/5JmfXc7vlIPtBPk8lovvT2RcbwX73QVCqfdtT9NqXzETmh4Hy/bmVTBodlO/gPb9SjD1yZs9k+8nCUlB5xXE=
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1eebf27-c839-4db0-5391-08d7320a27ae
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Sep 2019 14:05:49.1083 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xvaKevwvhc5NnMsUW9bAqhbWLA0iGcI4z/0ZN3iHba04kbdFq6RLYAZJcU1299ElHcRrH2TeC0KdvHLhBCxcPc/DnGxc40Ri+ae7AgyX/Ug=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR21MB0843
X-Mailman-Approved-At: Fri, 06 Sep 2019 07:01:00 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microsoft.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Iavyn5/LeMujLUYzJfuyfS+4LKPlHifEu2K00ZmAld0=;
 b=Yzt0MNrMKJh6//1/79waRMybbzkxpgLxkBWtAscpRjBMYJRHTOaewTt84qTPXsja4U5PDd6akIz0bUguUWW9vKQxoP9bVlxvhEEybogd2slRDGmvf+yR1JbfymwAHmTZgjx05vZOC7kMZItJ9zyANND12Hv0zfgOK7fpue+Uy2Q=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=mikelley@microsoft.com; 
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
Cc: Iouri Tarassov <iourit@microsoft.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogV2VpIEh1IDx3ZWhAbWljcm9zb2Z0LmNvbT4gU2VudDogVGh1cnNkYXksIFNlcHRlbWJl
ciA1LCAyMDE5IDI6MTIgQU0KPiAKPiBCZWdpbm5pbmcgZnJvbSBXaW5kb3dzIDEwIFJTNSssIFZN
IHNjcmVlbiByZXNvbHV0aW9uIGlzIG9idGFpbmVkIGZyb20gaG9zdC4KPiBUaGUgInZpZGVvPWh5
cGVydl9mYiIgYm9vdCB0aW1lIG9wdGlvbiBpcyBub3QgbmVlZGVkLCBidXQgc3RpbGwgY2FuIGJl
Cj4gdXNlZCB0byBvdmVyd3JpdGUgd2hhdCB0aGUgaG9zdCBzcGVjaWZpZXMuIFRoZSBWTSByZXNv
bHV0aW9uIG9uIHRoZSBob3N0Cj4gY291bGQgYmUgc2V0IGJ5IGV4ZWN1dGluZyB0aGUgcG93ZXJz
aGVsbCAic2V0LXZtdmlkZW8iIGNvbW1hbmQuCj4gCj4gU2lnbmVkLW9mZi1ieTogSW91cmkgVGFy
YXNzb3YgPGlvdXJpdEBtaWNyb3NvZnQuY29tPgo+IFNpZ25lZC1vZmYtYnk6IFdlaSBIdSA8d2Vo
QG1pY3Jvc29mdC5jb20+Cj4gLS0tCj4gICAgIHYyOgo+ICAgICAtIEltcGxlbWVudGVkIGZhbGxi
YWNrIHdoZW4gdmVyc2lvbiBuZWdvdGlhdGlvbiBmYWlsZWQuCj4gICAgIC0gRGVmaW5lZCBmdWxs
IHNpemUgZm9yIHN1cHBvcnRlZF9yZXNvbHV0aW9uIGFycmF5Lgo+IAo+ICAgICB2MzoKPiAgICAg
LSBDb3JyZWN0ZWQgdGhlIHN5bnRodmlkIG1ham9yIGFuZCBtaW5vciB2ZXJzaW9uIGNvbXBhcmlz
b24gcHJvYmxlbS4KPiAKPiAgICAgdjQ6Cj4gICAgIC0gQ2hhbmdlZCBmdW5jdGlvbiBuYW1lIHRv
IHN5bnRodmlkX3Zlcl9nZSgpLgo+IAo+ICBkcml2ZXJzL3ZpZGVvL2ZiZGV2L2h5cGVydl9mYi5j
IHwgMTU5ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tCj4gIDEgZmlsZSBjaGFuZ2Vk
LCAxNDcgaW5zZXJ0aW9ucygrKSwgMTIgZGVsZXRpb25zKC0pCj4gCgpSZXZpZXdlZC1ieTogTWlj
aGFlbCBLZWxsZXkgPG1pa2VsbGV5QG1pY3Jvc29mdC5jb20+Cl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
