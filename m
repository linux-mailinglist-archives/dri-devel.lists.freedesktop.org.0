Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C333E1D06F9
	for <lists+dri-devel@lfdr.de>; Wed, 13 May 2020 08:13:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE5316E12F;
	Wed, 13 May 2020 06:13:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2051.outbound.protection.outlook.com [40.107.237.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBABB6E12F;
 Wed, 13 May 2020 06:13:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cJVvH8In/+G9c4tXCGcTQKc/etKi2w2AnIrUDimLivKI7yRNF/n1sObcH50ckIyuMT26oD/TMMQ15c6w1EQWpZy1SPw37fWi5TWjaX3HpJppaEN+rrhYfMdBsT0e5Z3IthKYIgMlywfAqr+UIxDzHSlj2qBwobyoniA3kb3gI+HRmzJEhZtn2Oge+P7JxHwsWC1CnS+GMXYcnV39ti68TsClURKREwdjA4UMih5ululEJRbxTvVRYLF27fI8pOeXuSHLWc1b2GqcBdYqy05dz3oQ5bLd1pvKck+wB9UeHMdb+RaaiolofIMDpfQ7w3prYrm+dpXZMx8tsGC3u8vtpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gBFz5SDhd0eEXJjI9Po5h6KJ0d2ZsCkkqaiTuRGK5n8=;
 b=bDlYJgWkZMU1Mkf93uWeIyxLwBS+U1r65x07iQMrBJN7XBvja/6gCrgyTRFpjpY01qfhNryNGz7l/jfNxJ9ZafpvySrqYkhmHMzpWAHrmFHgoCeErC2iCv5/blpqBsDILWYNczjmYEbEAeb4zjeoXfo0/AiL/RL7LtZ8dZTEytJvPpzB3NzkxCznKzmmYon/n6867UV/vA7lAU8Ew4Ox7l+3m3cIJI+tOaXQCjv2YILGgKzcljd2NaPFWx9d5qGBB9II0EFTnKSZcEvvWiEJJAqdNyhKMsJGORNIhaTSBTMzh2eqNZYbVgfA5uLYlo5wzQa44y/LF5NU/z6elVsinQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gBFz5SDhd0eEXJjI9Po5h6KJ0d2ZsCkkqaiTuRGK5n8=;
 b=2S7urPYtsQSleFVXjy+UQvIv/aOkKG9o2fOm5XKPjWk9doPf/qmCc+8sPcYhD10daYxAZVX2wf3iUB0yvMa3bqUr1vrPRDCI9rNb9nEOsxUFT/9U8TD1DuCy5YhMk/zo5QKrMqDwy7iDHIM8RIRR9Tkas2zMtgImSAhvddG0MzM=
Received: from MN2PR05MB6381.namprd05.prod.outlook.com (2603:10b6:208:d6::24)
 by MN2PR05MB6128.namprd05.prod.outlook.com (2603:10b6:208:d0::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.13; Wed, 13 May
 2020 06:13:17 +0000
Received: from MN2PR05MB6381.namprd05.prod.outlook.com
 ([fe80::7803:13e7:2e4d:58ff]) by MN2PR05MB6381.namprd05.prod.outlook.com
 ([fe80::7803:13e7:2e4d:58ff%3]) with mapi id 15.20.3000.016; Wed, 13 May 2020
 06:13:17 +0000
From: Ashwin H <ashwinh@vmware.com>
To: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v4.19.x] make 'user_access_begin()' do 'access_ok()'
Thread-Topic: [PATCH v4.19.x] make 'user_access_begin()' do 'access_ok()'
Thread-Index: AQHWKIdKPHhk+fo7OUe7+WKkK8SJkqilhT4AgABhFAA=
Date: Wed, 13 May 2020 06:13:17 +0000
Message-ID: <89DE19F6-4CB0-4324-A630-C8574C8D591C@vmware.com>
References: <d29f87f3f3abb4e496866253bd170faad976f687.1589305630.git.ashwinh@vmware.com>
 <20200513055548.GA743118@kroah.com>
In-Reply-To: <20200513055548.GA743118@kroah.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/10.1e.0.191013
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=vmware.com;
x-originating-ip: [49.206.7.228]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 049e9cc0-3f52-4bf3-9bc6-08d7f704ba5b
x-ms-traffictypediagnostic: MN2PR05MB6128:
x-ld-processed: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR05MB61284193AE9538F3AE969D85CDBF0@MN2PR05MB6128.namprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:363;
x-forefront-prvs: 0402872DA1
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tZ1SR9vEYoMmkDMXaHQg58/S1Nk/E+CnDXjfna2ZkScIVlAaYxchGxKUjlh+Hp22R4gUOt6GVww09JGqc1iFI2qQpe/m/XHD+0c9llOc13J06LfHbrkglOwo2PkNih2TK9sOPhSBxHlc0NIKIUg1V/cGbJPS1wzZxMtLGptj00AEfSRE5YKdhbNNRzMT2VqlOssoA0bV0FVhSdzvbk6w1+vZilxVfoJREn77raXH2gS1XsaI8UX82Qsopzp2w0KA8qvJYsz12lEls6Na8IhDLzs/F/Ps2KuJzsgdmECpt4W2pFgVm5nc6lcF3U2fNA06wKKTdhZHxGU2gsKbI1eSejNtgZ4egGjQ4eOscgVRM+PYeg2m99NdIUlF+ERi5LK033AtrZTeqTv7EvmgwTH/Mm/6D2SgBJof/jp8/B0meLK/2MK4SDAqhuKBFlgvFo5FNmh7pRLZrPJCXxCdp7MG9LfB9g03DeBQ28hxA4s4y7rUBjzo7Gm8ehQs0A+yPQiowjr7V2679sEhHsPUo7fsfg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR05MB6381.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(136003)(396003)(39860400002)(376002)(366004)(346002)(33430700001)(316002)(4326008)(5660300002)(54906003)(66946007)(66446008)(6916009)(2616005)(55236004)(86362001)(33656002)(91956017)(76116006)(8676002)(478600001)(36756003)(6506007)(26005)(33440700001)(64756008)(186003)(8936002)(71200400001)(6486002)(66476007)(66556008)(2906002)(6512007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: S1onAZF74xd06+gd1zKKbYhqVZ1Ci+YFKde3u8dr2MsklEaXqcZbxmff2oH1dUGHOCUTo/gjc5sBj7Gfbpb1w52urb9qtMoV3CMb4HNf8hXvlRZAOEOvGl368JPnImwN68RB4AHj7br0itSZKRL6W/kMhsbRVaJnYQsPX4naCzyFwnPVD1IMl4YDlPWbJKcN33xpIYNdqq8CnwlBVrA3uM8kcd7cRwMaHyMnXGQe/VhJ5rWL8IEjKB3Mc2kH4Wl+29+wCD4efXq+zyNXzMpKusKac/DkZ3PWRk9nNRbXkrEMrAzmhvNcNagA4VhD2dTjTv7dyv2XMylztYxhYwJo++HPzSSfzC/WU1FI5jx+GerPd0TiSpd93qDQAqFGzx5g2X8H0KUMEWGXSLdbjxF4jOZtla9gy79OwX6Q2c1rIioYwREHFameKkjDv8pA+TzsidGuE/XdDv2m8qWvH5dwyfSVQqi4E+pKh05gZLnPSAg=
Content-ID: <6BC3DB5552E3ED498BA63811C6FA422C@namprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 049e9cc0-3f52-4bf3-9bc6-08d7f704ba5b
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2020 06:13:17.2961 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eiqiN0qlXXwUXRyHd8wuDt6Glr9TI7nbjZQUaVYq7V60uEog3pArS7A0OaPQcPczZSuEBAulgth20MK/p0pfAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR05MB6128
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "x86@kernel.org" <x86@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "srivatsa@csail.mit.edu" <srivatsa@csail.mit.edu>,
 "rostedt@goodmis.org" <rostedt@goodmis.org>,
 Steven Rostedt <srostedt@vmware.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 "stable@kernel.org" <stable@kernel.org>, Srivatsa Bhat <srivatsab@vmware.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBwYXRjaCBmaXhlcyBDVkUtMjAxOC0yMDY2OSBpbiA0LjE5IHRyZWUuDQoNCu+7v09uIDEz
LzA1LzIwLCAxMTozNiBBTSwgIkdyZWcgS0giIDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz4g
d3JvdGU6DQoNCiAgICBPbiBXZWQsIE1heSAxMywgMjAyMCBhdCAwNzoxOToyMUFNICswNTMwLCBh
c2h3aW4taCB3cm90ZToNCiAgICA+IEZyb206IExpbnVzIFRvcnZhbGRzIDx0b3J2YWxkc0BsaW51
eC1mb3VuZGF0aW9uLm9yZz4NCiAgICA+IA0KICAgID4gY29tbWl0IDU5NGNjMjUxZmRkMGQyMzFk
MzQyZDg4YjJmZGZmNGJjNDJmYjA2OTAgdXBzdHJlYW0uDQogICAgPiANCiAgICA+IE9yaWdpbmFs
bHksIHRoZSBydWxlIHVzZWQgdG8gYmUgdGhhdCB5b3UnZCBoYXZlIHRvIGRvIGFjY2Vzc19vaygp
DQogICAgPiBzZXBhcmF0ZWx5LCBhbmQgdGhlbiB1c2VyX2FjY2Vzc19iZWdpbigpIGJlZm9yZSBh
Y3R1YWxseSBkb2luZyB0aGUNCiAgICA+IGRpcmVjdCAob3B0aW1pemVkKSB1c2VyIGFjY2Vzcy4N
CiAgICA+IA0KICAgID4gQnV0IGV4cGVyaWVuY2UgaGFzIHNob3duIHRoYXQgcGVvcGxlIHRoZW4g
ZGVjaWRlIG5vdCB0byBkbyBhY2Nlc3Nfb2soKQ0KICAgID4gYXQgYWxsLCBhbmQgaW5zdGVhZCBy
ZWx5IG9uIGl0IGJlaW5nIGltcGxpZWQgYnkgb3RoZXIgb3BlcmF0aW9ucyBvcg0KICAgID4gc2lt
aWxhci4gIFdoaWNoIG1ha2VzIGl0IHZlcnkgaGFyZCB0byB2ZXJpZnkgdGhhdCB0aGUgYWNjZXNz
IGhhcw0KICAgID4gYWN0dWFsbHkgYmVlbiByYW5nZS1jaGVja2VkLg0KICAgID4gDQogICAgPiBJ
ZiB5b3UgdXNlIHRoZSB1bnNhZmUgZGlyZWN0IHVzZXIgYWNjZXNzZXMsIGhhcmR3YXJlIGZlYXR1
cmVzIChlaXRoZXINCiAgICA+IFNNQVAgLSBTdXBlcnZpc29yIE1vZGUgQWNjZXNzIFByb3RlY3Rp
b24gLSBvbiB4ODYsIG9yIFBBTiAtIFByaXZpbGVnZWQNCiAgICA+IEFjY2VzcyBOZXZlciAtIG9u
IEFSTSkgZG8gZm9yY2UgeW91IHRvIHVzZSB1c2VyX2FjY2Vzc19iZWdpbigpLiAgQnV0DQogICAg
PiBub3RoaW5nIHJlYWxseSBmb3JjZXMgdGhlIHJhbmdlIGNoZWNrLg0KICAgID4gDQogICAgPiBC
eSBwdXR0aW5nIHRoZSByYW5nZSBjaGVjayBpbnRvIHVzZXJfYWNjZXNzX2JlZ2luKCksIHdlIGFj
dHVhbGx5IGZvcmNlDQogICAgPiBwZW9wbGUgdG8gZG8gdGhlIHJpZ2h0IHRoaW5nICh0bSksIGFu
ZCB0aGUgcmFuZ2UgY2hlY2sgdmlsbCBiZSB2aXNpYmxlDQogICAgPiBuZWFyIHRoZSBhY3R1YWwg
YWNjZXNzZXMuICBXZSBoYXZlIHdheSB0b28gbG9uZyBhIGhpc3Rvcnkgb2YgcGVvcGxlDQogICAg
PiB0cnlpbmcgdG8gYXZvaWQgdGhlbS4NCiAgICA+IA0KICAgID4gU2lnbmVkLW9mZi1ieTogTGlu
dXMgVG9ydmFsZHMgPHRvcnZhbGRzQGxpbnV4LWZvdW5kYXRpb24ub3JnPg0KICAgID4gU2lnbmVk
LW9mZi1ieTogQXNod2luIEggPGFzaHdpbmhAdm13YXJlLmNvbT4NCiAgICA+IC0tLQ0KICAgID4g
IGFyY2gveDg2L2luY2x1ZGUvYXNtL3VhY2Nlc3MuaCAgICAgICAgICAgICB8IDExICsrKysrKysr
KystDQogICAgPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9nZW1fZXhlY2J1ZmZlci5jIHwg
MTUgKysrKysrKysrKysrKy0tDQogICAgPiAgaW5jbHVkZS9saW51eC91YWNjZXNzLmggICAgICAg
ICAgICAgICAgICAgIHwgIDIgKy0NCiAgICA+ICBrZXJuZWwvY29tcGF0LmMgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgfCAgNiArKy0tLS0NCiAgICA+ICBrZXJuZWwvZXhpdC5jICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgfCAgNiArKy0tLS0NCiAgICA+ICBsaWIvc3RybmNweV9mcm9t
X3VzZXIuYyAgICAgICAgICAgICAgICAgICAgfCAgOSArKysrKy0tLS0NCiAgICA+ICBsaWIvc3Ry
bmxlbl91c2VyLmMgICAgICAgICAgICAgICAgICAgICAgICAgfCAgOSArKysrKy0tLS0NCiAgICA+
ICA3IGZpbGVzIGNoYW5nZWQsIDM4IGluc2VydGlvbnMoKyksIDIwIGRlbGV0aW9ucygtKQ0KICAg
IA0KICAgIEFyZSB5b3Ugd2FudGluZyB0aGlzIG1lcmdlZCB0byBhIHNwZWNpZmljIHN0YWJsZSBr
ZXJuZWwgdHJlZT8gIElmIHNvLCB3aHk/DQogICAgDQogICAgdGhhbmtzLA0KICAgIA0KICAgIGdy
ZWcgay1oDQogICAgDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbAo=
