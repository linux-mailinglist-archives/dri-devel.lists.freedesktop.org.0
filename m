Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E391C76259
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2019 11:49:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C3446ECD3;
	Fri, 26 Jul 2019 09:41:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20138.outbound.protection.outlook.com [40.107.2.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05F756E6F6
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2019 11:05:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GjZlEYAwkQuOHpggvgLSPz5qkfEifGxUwD1cpHGPbiy5WtdXQs2dxi2KyVqy9fj01/MgF1wL5Yyd5V873UpF+NIjBYRlVGFH5NEXPpf+QXW3efEZpDodyMj/rZYGJKSzfsq2uLaapfZYQPGGGzjEtIlLjRqD032oR2sPVWjETBDEiSb+SVPZTz9SG5ZJ1g8S3P/x+YJRGdzxMu4C7kPzMkPynJJu+iDPiOB7Bv4+QpaELU8egcbcf7lT+p2fmgSxF6FZIyBFvVpkapGn3ZOP9ExAL6Urc4wuFefxxNItP0/3NHqXo+7Xt36WUYNWzzLdwDWO9KQxkZZXVY8hCPwSmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U/SiP3mH5gYMkwediWUa1vnzvQioFDVFNGJQWCRQGu4=;
 b=mb7bhGqTNFlFuy+K6w+b0nayMBddVjx2RW+rH77Bs60gg8jxk1OjtZcRCFT5d2oQCeOz9KAXADJksVLNtFrtG7ulUR1SvfAinMITRtVArqhR4TLQWlEiarFus7NpAaZCr+rfkLgbuorKAKX/4NMi8NH70N/IAwaPLHMuxW5oMzwFaf7fUsBlYKhs+3F192cVgqjnTcZGMw1nqqoY+RWDU/PmBh6NnIekWM/IoPt+35pTACJNBCvF/m0uFDFYZp11nrRgO0axHw+OPgTUHaoiDJKIXLnSxFgEuBq/ATX3+lfocn/C6AulXI350g8d8suRWAlk9g42qDbVdQMFapUKAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=toradex.com;dmarc=pass action=none
 header.from=toradex.com;dkim=pass header.d=toradex.com;arc=none
Received: from AM6PR05MB6535.eurprd05.prod.outlook.com (20.179.18.16) by
 AM6PR05MB5553.eurprd05.prod.outlook.com (20.177.119.202) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.16; Thu, 25 Jul 2019 11:05:23 +0000
Received: from AM6PR05MB6535.eurprd05.prod.outlook.com
 ([fe80::c860:b386:22a:8ec9]) by AM6PR05MB6535.eurprd05.prod.outlook.com
 ([fe80::c860:b386:22a:8ec9%6]) with mapi id 15.20.2094.017; Thu, 25 Jul 2019
 11:05:23 +0000
From: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
To: Andrzej Hajda <a.hajda@samsung.com>, Neil Armstrong
 <narmstrong@baylibre.com>
Subject: [PATCH 0/1] This patch fixes connection detection for monitors w/o
 DDC.
Thread-Topic: [PATCH 0/1] This patch fixes connection detection for monitors
 w/o DDC.
Thread-Index: AQHVQtjbQmQDpUU8tU2AbrHFyIUWgw==
Date: Thu, 25 Jul 2019 11:05:23 +0000
Message-ID: <20190725110520.26848-1-oleksandr.suvorov@toradex.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM3PR07CA0136.eurprd07.prod.outlook.com
 (2603:10a6:207:8::22) To AM6PR05MB6535.eurprd05.prod.outlook.com
 (2603:10a6:20b:71::16)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-originating-ip: [194.105.145.90]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7cf54cad-5795-4259-90bb-08d710effd82
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM6PR05MB5553; 
x-ms-traffictypediagnostic: AM6PR05MB5553:
x-microsoft-antispam-prvs: <AM6PR05MB55532DB02B97E0C07D0105BCF9C10@AM6PR05MB5553.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2089;
x-forefront-prvs: 0109D382B0
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(396003)(346002)(376002)(366004)(39850400004)(136003)(199004)(189003)(4326008)(44832011)(3846002)(305945005)(14444005)(14454004)(486006)(68736007)(1076003)(256004)(66066001)(5660300002)(6486002)(66446008)(64756008)(66556008)(66476007)(186003)(7416002)(54906003)(50226002)(110136005)(25786009)(26005)(478600001)(316002)(86362001)(6436002)(66946007)(52116002)(99286004)(36756003)(6506007)(386003)(53936002)(2906002)(6116002)(71190400001)(81166006)(81156014)(7736002)(102836004)(476003)(6512007)(8936002)(8676002)(2616005)(71200400001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM6PR05MB5553;
 H:AM6PR05MB6535.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: toradex.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: pCCpK+e3AKs/jz6rRBxi2F+7SZLcaM6kTIKhtrik+KfrdPfi/AUOKurLLiTAI0ce4FXcG6LUeEzl72Hy9mCuCwn84g5o8ScJ3dm8mA18kmpjWrWhKq3wq227Jn3rI2bbGgVCzdE8vBYyUcFnpA2huDd7SCSA2H7BcbkL3R6Eil2sAPo/Ap1jjn+yjXGAaebMNyEVS7IZxhvsUWIrjQ4wRm2p6zmtijIrUBqFsNX0tiJieR/3m6UwQIdpKYpxJPw9DeR7BjMlTcsJNN3AHgw4pwT7yyoNRxwQ2r6zOZGhcEkXMIouPmzYf2j0pYQFBqFhBwPIQnreLbEwaQ4o5UVd2D3TyWKwDUyZdaNEtlR0EuXWeGNvGjmeh3FEPYkGpQQOK3coIysGJPZ0Go85mumpVkEFA3hQo82aaihlAHbBESU=
MIME-Version: 1.0
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cf54cad-5795-4259-90bb-08d710effd82
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2019 11:05:23.4274 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oleksandr.suvorov@toradex.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR05MB5553
X-Mailman-Approved-At: Fri, 26 Jul 2019 09:41:34 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=toradex.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U/SiP3mH5gYMkwediWUa1vnzvQioFDVFNGJQWCRQGu4=;
 b=j/5k05zxNqWcoTXoJr/KHlpKxXTBxFiYGQVtNx3vldqxBV1FrDj58WtcRQ/UUnIOpN8pOa5+PcjQL4d7EJAjVDWL0/aiSYvIqRgMIAmzo6X5GN46Bhe3PQxeh0ljJ1N4XygKD8mNysDy/TpXPb8y130iPMhDhDtyh3ZKpdkUVOQ=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=oleksandr.suvorov@toradex.com; 
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Igor Opaniuk <igor.opaniuk@toradex.com>, Jonas Karlman <jonas@kwiboo.se>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 Oleksandr Suvorov <oleksandr.suvorov@toradex.com>,
 David Airlie <airlied@linux.ie>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "maxime.ripard@free-electrons.com" <maxime.ripard@free-electrons.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CkV2ZW4gaW4gc291cmNlIGNvZGUgb2YgdGhpcyBkcml2ZXIgdGhlcmUgaXMgYW4gYXV0aG9yJ3Mg
ZGVzY3JpcHRpb246CiAgICAvKgogICAgICogRXZlbiBpZiB3ZSBoYXZlIGFuIEkyQyBidXMsIHdl
IGNhbid0IGFzc3VtZSB0aGF0IHRoZSBjYWJsZQogICAgICogaXMgZGlzY29ubmVjdGVkIGlmIGRy
bV9wcm9iZV9kZGMgZmFpbHMuIFNvbWUgY2FibGVzIGRvbid0CiAgICAgKiB3aXJlIHRoZSBEREMg
cGlucywgb3IgdGhlIEkyQyBidXMgbWlnaHQgbm90IGJlIHdvcmtpbmcgYXQKICAgICAqIGFsbC4K
ICAgICAqLwoKVGhhdCdzIHRydWUuIEREQyBhbmQgVkdBIGNoYW5uZWxzIGFyZSBpbmRlcGVuZGVu
dCwgYW5kIHRoZXJlZm9yZQp3ZSBjYW5ub3QgZGVjaWRlIHdoZXRoZXIgdGhlIG1vbml0b3IgaXMg
Y29ubmVjdGVkIG9yIG5vdCwKZGVwZW5kaW5nIG9uIHRoZSBpbmZvcm1hdGlvbiBmcm9tIHRoZSBE
REMuCgpTbyB0aGUgbW9uaXRvciBzaG91bGQgYWx3YXlzIGJlIGNvbnNpZGVyZWQgY29ubmVjdGVk
LgpUaHVzIHRoZXJlIGlzIG5vIHJlYXNvbiB0byB1c2UgY29ubmVjdG9yIGRldGVjdCBjYWxsYmFj
ayBmb3IgdGhpcwpkcml2ZXI6IERSTSBzdWItc3lzdGVtIGNvbnNpZGVycyBtb25pdG9yIGFsd2F5
cyBjb25uZWN0ZWQgaWYgdGhlcmUKaXMgbm8gZGV0ZWN0KCkgY2FsbGJhY2sgcmVnaXN0ZXJlZCB3
aXRoIGRybV9jb25uZWN0b3JfaW5pdCgpLgoKSG93IHRvIHJlcHJvZHVjZSB0aGUgYnVnOgoqIHNl
dHVwOiBpLk1YOFFYUCwgTENESUYgdmlkZW8gbW9kdWxlICsgZ3B1L2RybS9teHNmYiBkcml2ZXIs
CiAgYWR2NzEyeCBWR0EgREFDICsgZHVtYi12Z2EtZGFjIGRyaXZlciwgVkdBLWNvbm5lY3RvciB3
L28gRERDOwoqIHRyeSB0byB1c2UgZHJpdmVycyBjaGFpbiBteHNmYi1kcm0gKyBkdW1iLXZnYS1k
YWM7CiogYW55IERSTSBhcHBsaWNhdGlvbnMgY29uc2lkZXIgdGhlIG1vbml0b3IgaXMgbm90IGNv
bm5lY3RlZDoKICA9PT09PT09PT09PQogICQgd2VzdG9uLXN0YXJ0CiAgJCBjYXQgL3Zhci9sb2cv
d2VzdG9uLmxvZwogICAgICAuLi4KICAgICAgRFJNOiBoZWFkICdWR0EtMScgZm91bmQsIGNvbm5l
Y3RvciAzMiBpcyBkaXNjb25uZWN0ZWQuCiAgICAgIC4uLgogICQgY2F0IC9zeXMvZGV2aWNlcy9w
bGF0Zm9ybS81YTE4MDAwMC5sY2RpZi9kcm0vY2FyZDAvY2FyZDAtVkdBLTEvc3RhdHVzCiAgdW5r
bm93bgogID09PT09PT09PT09CgoKT2xla3NhbmRyIFN1dm9yb3YgKDEpOgogIGRybS9icmlkZ2U6
IHZnYS1kYWM6IEZpeCBkZXRlY3Qgb2YgbW9uaXRvciBjb25uZWN0aW9uCgogZHJpdmVycy9ncHUv
ZHJtL2JyaWRnZS9kdW1iLXZnYS1kYWMuYyB8IDE4IC0tLS0tLS0tLS0tLS0tLS0tLQogMSBmaWxl
IGNoYW5nZWQsIDE4IGRlbGV0aW9ucygtKQoKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
