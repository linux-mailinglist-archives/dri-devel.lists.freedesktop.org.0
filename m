Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA4DD9FD16
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2019 10:31:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CF7489B0C;
	Wed, 28 Aug 2019 08:31:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720094.outbound.protection.outlook.com [40.107.72.94])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C060C8996E
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2019 23:56:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MOsBTmpSvehPcWLUpQpUo4M+Ac6/kggdyevHaW5ep+lIEDTM3LWt3YZN0+NErnOLa4lvjpxKaUsOF0G5BXHTx/0M8gH9bjJTtDsDYLmy9XpD6zdkEY/SIuIC0AwkG5QQdMeOy06OXi7tOAa/LxMQm+89vHzRMZaOtoEOEnfgS7VPnsekkECN2f6XRQ5LAP5FsjVyplRS4RIRxJKQ8TFzbzLGUq5ZPgPzYCDZjFhDaMVJVcIOrr6XlnrdKRfvm4CY9fx0OsKvvW/lu2WnZpqgLrNksxACR1QC4nB+G2s0bl6PxnbNwngfWrEXoi+Iqb+EFkJ3NZOF3IZJm7Z45397WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yvzJCJHATgCNAHmlGeR2AdXGvU9geZTTvSE6vCdIWU4=;
 b=WpefTjphmbk2Sg8VGIixolAfmZ2JHnZsXaF1F7wm2LgAMsgUXFst4SZ5wEVY/R1Xo5CbWszG2LS/SGZ7eWVSJm/RipQN8Z3iJgZX0twONC3NEVHa+I8fp3N/n39cGTAPRLvYTmKZnt6bDhCE4ep8tKEvkDI/ekZcjiI0ycgfl+s1aP+HfD/bhlq2f4kL7abdRJZl1ZrClBCflO5VHSG5cuXpvQO1CdEN/lmqcachd7hAoELnJyvAzfCS/t+GPSWcLZnO01zDV/pFtlmnnLRWjgJXGXF4wgTVRGFrMa+I1NM5MmCgrV4bjIwBncPFa4CInrgu8Q/6/TO/VEKxLw5Y1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
Received: from DM5PR21MB0137.namprd21.prod.outlook.com (10.173.173.12) by
 DM5PR21MB0859.namprd21.prod.outlook.com (10.173.172.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.1; Tue, 27 Aug 2019 23:56:43 +0000
Received: from DM5PR21MB0137.namprd21.prod.outlook.com
 ([fe80::c437:6219:efcc:fb8a]) by DM5PR21MB0137.namprd21.prod.outlook.com
 ([fe80::c437:6219:efcc:fb8a%7]) with mapi id 15.20.2241.000; Tue, 27 Aug 2019
 23:56:43 +0000
From: Michael Kelley <mikelley@microsoft.com>
To: Wei Hu <weh@microsoft.com>, "b.zolnierkie@samsung.com"
 <b.zolnierkie@samsung.com>, "linux-hyperv@vger.kernel.org"
 <linux-hyperv@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-fbdev@vger.kernel.org"
 <linux-fbdev@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "sashal@kernel.org" <sashal@kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>, Haiyang Zhang
 <haiyangz@microsoft.com>, KY Srinivasan <kys@microsoft.com>, Dexuan Cui
 <decui@microsoft.com>
Subject: RE: [PATCH v3] video: hyperv: hyperv_fb: Obtain screen resolution
 from Hyper-V host
Thread-Topic: [PATCH v3] video: hyperv: hyperv_fb: Obtain screen resolution
 from Hyper-V host
Thread-Index: AQHVXMfGJ3Qba7Bfm06iN/QPH/c1OqcPqo/w
Date: Tue, 27 Aug 2019 23:56:42 +0000
Message-ID: <DM5PR21MB013709ADC5CB4B48CE752048D7A00@DM5PR21MB0137.namprd21.prod.outlook.com>
References: <20190827110755.2707-1-weh@microsoft.com>
In-Reply-To: <20190827110755.2707-1-weh@microsoft.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=True;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Owner=mikelley@ntdev.microsoft.com;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2019-08-27T23:56:41.1284187Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=General;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=22d3c610-3ee8-44bd-b8c5-5b9a2554642b;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Extended_MSFT_Method=Automatic
x-originating-ip: [2001:4898:80e8:7:d0b9:e2d7:362d:146a]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4e846159-bf66-4493-6276-08d72b4a360a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR21MB0859; 
x-ms-traffictypediagnostic: DM5PR21MB0859:|DM5PR21MB0859:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR21MB08597FE5FB5749135C98A966D7A00@DM5PR21MB0859.namprd21.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 0142F22657
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(366004)(136003)(376002)(346002)(396003)(39860400002)(189003)(199004)(54534003)(256004)(86362001)(2201001)(6636002)(8936002)(8676002)(305945005)(6116002)(8990500004)(74316002)(7736002)(10090500001)(2906002)(229853002)(76176011)(4326008)(7696005)(22452003)(186003)(102836004)(11346002)(476003)(446003)(486006)(71190400001)(46003)(71200400001)(110136005)(316002)(66556008)(14454004)(1511001)(5660300002)(6506007)(478600001)(6246003)(81156014)(9686003)(55016002)(76116006)(66446008)(64756008)(25786009)(52536014)(107886003)(53936002)(66476007)(6436002)(10290500003)(66946007)(2501003)(99286004)(33656002)(81166006)(921003)(1121003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM5PR21MB0859;
 H:DM5PR21MB0137.namprd21.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microsoft.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 2zVW5XWzfEFpYuoaMtpkAVKIUQqHdDwgqLvDb7/5WLackUgu/rvEEBsvtkcMIJ2vcWQ5Og3HGQNDfWEVvtGDcfpgLMhQYM6L1Kg/6snpMu7Vr0PVq5i8PAF0Fvpv808uFx+5r+hzb4Dt7nOuXTN5ty4LI9qK42pJFguZcZPHuoCDr8KKK9qiV8ui7YxT5ra9+O5ImxV6EQp4LTPi3rGai2xPobfLpbJ5cI4ax+xqpVS61YGwnNi/5vwlLOSqn80eXr6ZtRXLxUMmBIf+BvzVnfzsHiYivcx7NSU9GSk5ixxgNk7SIXnsFSDhT1hPhKERLJV7WlaW135iovm3yTPz1n/zoiaceyDuT6P1MhGxv1NkYGjmjOevK920SlAzflNS1MUoQ//ck5pNjUn3RHXPwrM4ZvqK1y3hHhK2LcORqP0=
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e846159-bf66-4493-6276-08d72b4a360a
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2019 23:56:42.9089 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CC6i1Q3hWnbBUoR0IFY4N8UGqp5EqHfn/fWdlmDlG2upq6Olvm5GZBBS7uJCmvsHNfJ/nzA/khnUP/QorO9JqaHczxai92lLL+V5VALVHYg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR21MB0859
X-Mailman-Approved-At: Wed, 28 Aug 2019 08:28:09 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microsoft.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yvzJCJHATgCNAHmlGeR2AdXGvU9geZTTvSE6vCdIWU4=;
 b=oy62PZXrzbFJdoDeSW/jrjxOtaFZ14XSJorz+cnF5x5vo6NyGIfPmLRPSzzGhIwwrGLII81BFLo15jZvCGUezL4bL/W177WRxlJu3h0qLel1A7IT/mS2GMu+XaRnsaHFP14epxiRWi3FpZV6yy7ob3cCVSFNEloZaVFXK0xLkQw=
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

RnJvbTogV2VpIEh1IDx3ZWhAbWljcm9zb2Z0LmNvbT4gU2VudDogVHVlc2RheSwgQXVndXN0IDI3
LCAyMDE5IDQ6MDkgQU0KPiAKPiBCZWdpbm5pbmcgZnJvbSBXaW5kb3dzIDEwIFJTNSssIFZNIHNj
cmVlbiByZXNvbHV0aW9uIGlzIG9idGFpbmVkIGZyb20gaG9zdC4KPiBUaGUgInZpZGVvPWh5cGVy
dl9mYiIgYm9vdCB0aW1lIG9wdGlvbiBpcyBub3QgbmVlZGVkLCBidXQgc3RpbGwgY2FuIGJlCj4g
dXNlZCB0byBvdmVyd3JpdGUgd2hhdCB0aGUgaG9zdCBzcGVjaWZpZXMuIFRoZSBWTSByZXNvbHV0
aW9uIG9uIHRoZSBob3N0Cj4gY291bGQgYmUgc2V0IGJ5IGV4ZWN1dGluZyB0aGUgcG93ZXJzaGVs
bCAic2V0LXZtdmlkZW8iIGNvbW1hbmQuCj4gCj4gdjI6Cj4gLSBJbXBsZW1lbnRlZCBmYWxsYmFj
ayB3aGVuIHZlcnNpb24gbmVnb3RpYXRpb24gZmFpbGVkLgo+IC0gRGVmaW5lZCBmdWxsIHNpemUg
Zm9yIHN1cHBvcnRlZF9yZXNvbHV0aW9uIGFycmF5Lgo+IAo+IHYzOgo+IC0gQ29ycmVjdGVkIHRo
ZSBzeW50aHZpZCBtYWpvciBhbmQgbWlub3IgdmVyc2lvbiBjb21wYXJpc29uIHByb2JsZW0uCgpU
aGUgY2hhbmdlbG9nIGZvciB2MiBhbmQgdjMgc2hvdWxkIGFjdHVhbGx5IGdvIGFmdGVyIHRoZSAi
LS0tIiBiZWxvdyBzbwp0aGF0IHRoZSBjaGFuZ2Vsb2cgZG9lcyBub3QgZW5kIHVwIGFzIHBhcnQg
b2YgdGhlIGNvbW1pdCBtZXNzYWdlLiAgVGFrZQphIGxvb2sgYXQgb3RoZXIgcG9zdGluZ3MgdG8g
TEtNTCBmb3IgYW4gZXhhbXBsZS4KCj4gCj4gU2lnbmVkLW9mZi1ieTogSW91cmkgVGFyYXNzb3Yg
PGlvdXJpdEBtaWNyb3NvZnQuY29tPgo+IFNpZ25lZC1vZmYtYnk6IFdlaSBIdSA8d2VoQG1pY3Jv
c29mdC5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvdmlkZW8vZmJkZXYvaHlwZXJ2X2ZiLmMgfCAxNTkg
KysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDE0NyBp
bnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkKPiAKPiAKPiArLyogQ2hlY2sgaWYgdGhlIHZl
cjEgdmVyc2lvbiBpcyBlcXVhbCBvciBncmVhdGVyIHRoYW4gdmVyMiAqLwo+ICtzdGF0aWMgaW5s
aW5lIGJvb2wgc3ludGh2aWRfdmVyX2VnKHUzMiB2ZXIxLCB1MzIgdmVyMikKCkknbSBiZWluZyBw
aWNreSBoZXJlLCBidXQgSSB3b3VsZCBjYWxsIHRoaXMgc3ludGh2aWRfdmVyX2dlKCkuICAgSW4g
bXkKZXhwZXJpZW5jZSAiZ2UiIGlzIHRoZSBzaG9ydGhhbmQgZm9yICJncmVhdGVyIHRoYW4gb3Ig
ZXF1YWwiLCByYXRoZXIKdGhhbiB0aGUgImVnIiB5b3UgaGF2ZSB1c2VkLgoKTWljaGFlbAoKCj4g
K3sKPiArCWlmIChTWU5USFZJRF9WRVJfR0VUX01BSk9SKHZlcjEpID4gU1lOVEhWSURfVkVSX0dF
VF9NQUpPUih2ZXIyKSB8fAo+ICsJICAgIChTWU5USFZJRF9WRVJfR0VUX01BSk9SKHZlcjEpID09
IFNZTlRIVklEX1ZFUl9HRVRfTUFKT1IodmVyMikgJiYKPiArCSAgICAgU1lOVEhWSURfVkVSX0dF
VF9NSU5PUih2ZXIxKSA+PSBTWU5USFZJRF9WRVJfR0VUX01JTk9SKHZlcjIpKSkKPiArCQlyZXR1
cm4gdHJ1ZTsKPiArCj4gKwlyZXR1cm4gZmFsc2U7Cj4gK30KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
