Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 269FC4F6CA
	for <lists+dri-devel@lfdr.de>; Sat, 22 Jun 2019 18:16:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1517E6E3EF;
	Sat, 22 Jun 2019 16:16:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk
 [IPv6:2001:4d48:ad52:3201:214:fdff:fe10:1be6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D596B6E3EF
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Jun 2019 16:16:30 +0000 (UTC)
Received: from shell.armlinux.org.uk
 ([2002:4e20:1eda:1:5054:ff:fe00:4ec]:58982)
 by pandora.armlinux.org.uk with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <linux@armlinux.org.uk>)
 id 1heigk-0004cE-CV; Sat, 22 Jun 2019 17:16:26 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.89)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1heigh-0004Ia-JX; Sat, 22 Jun 2019 17:16:23 +0100
Date: Sat, 22 Jun 2019 17:16:23 +0100
From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
To: Fabio Estevam <festevam@gmail.com>, l.stach@pengutronix.de,
 christian.gmeiner@gmail.com
Subject: [REGRESSION] drm/etnaviv: command buffer outside valid memory window
Message-ID: <20190622161623.eiameq5dmcysbqor@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: NeoMutt/20170113 (1.7.2)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
 Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/ya/gKAE8QE5wWxSDWBTaqF3JvyoF5itHFXrMVxk6xo=; b=DimnR8VPdOI0GU9nebJBFYkAX
 jvszuMtjcXF8yK8QgRmysAzexWMlyOmSYR/32v8tzojcD4HOWXrbDBvMD5h3Fq32bnuTYFXk9qh63
 KmET5u9Xv298SYMena4zMR7bxLq2mTMU4Y/s1AJ18xkBURFLP4ytUPxQu/nIXpGvyCj5kbAG4Z/+V
 ZozZdkz0evKKRsv+ez9IlaGQyQtFsx8D9LVyZPo5Rw243BBpfbBFEG2HfxEAQbW+BuDoEPK+UX/xX
 +dZJN/pvqXe8iQVy+ak7TlxVBSUCwfnX0a68XT0QCY6fJGFsnGZ6degWwbsDl/FuhDOhy12xzkfzV
 LDgZh9SSw==;
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
Cc: etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2hpbGUgdXBkYXRpbmcgbXkgdmFyaW91cyBzeXN0ZW1zIGZvciB0aGUgVENQIFNBQ0sgaXNzdWUs
IEkgbm90aWNlCnRoYXQgd2hpbGUgbW9zdCBwbGF0Zm9ybXMgYXJlIGhhcHB5LCB0aGUgQ3Vib3gt
aTQgaXMgbm90LiAgRHVyaW5nCmJvb3QsIHdlIGdldDoKClsgICAgMC4wMDAwMDBdIGNtYTogUmVz
ZXJ2ZWQgMjU2IE1pQiBhdCAweDMwMDAwMDAwCi4uLgpbICAgIDAuMDAwMDAwXSBLZXJuZWwgY29t
bWFuZCBsaW5lOiBjb25zb2xlPXR0eW14YzAsMTE1MjAwbjggY29uc29sZT10dHkxIHZpZGVvPW14
Y2ZiMDpkZXY9aGRtaSByb290PS9kZXYvbmZzIHJ3IGNtYT0yNTZNIGFoY2lfaW14LmhvdHBsdWc9
MSBzcGxhc2ggcmVzdW1lPS9kZXYvc2RhMQpbICAgIDAuMDAwMDAwXSBEZW50cnkgY2FjaGUgaGFz
aCB0YWJsZSBlbnRyaWVzOiAxMzEwNzIgKG9yZGVyOiA3LCA1MjQyODggYnl0ZXMpClsgICAgMC4w
MDAwMDBdIElub2RlLWNhY2hlIGhhc2ggdGFibGUgZW50cmllczogNjU1MzYgKG9yZGVyOiA2LCAy
NjIxNDQgYnl0ZXMpClsgICAgMC4wMDAwMDBdIE1lbW9yeTogMTc5MDk3MksvMjA5NzE1MksgYXZh
aWxhYmxlICg4NDcxSyBrZXJuZWwgY29kZSwgNjkzSyByd2RhdGEsIDI4NDRLIHJvZGF0YSwgNTAw
SyBpbml0LCA4MDYySyBic3MsIDQ0MDM2SyByZXNlcnZlZCwgMjYyMTQ0SyBjbWEtcmVzZXJ2ZWQs
IDEzMTA3MjBLIGhpZ2htZW0pCi4uLgpbICAgMTMuMTAxMDk4XSBldG5hdml2LWdwdSAxMzAwMDAu
Z3B1OiBjb21tYW5kIGJ1ZmZlciBvdXRzaWRlIHZhbGlkIG1lbW9yeSB3aW5kb3cKWyAgIDEzLjE3
MTk2M10gZXRuYXZpdi1ncHUgMTM0MDAwLmdwdTogY29tbWFuZCBidWZmZXIgb3V0c2lkZSB2YWxp
ZCBtZW1vcnkgd2luZG93CgphbmQgc2hvcnRseSBhZnRlciB0aGUgbG9naW4gcHJvbXB0IGFwcGVh
cnMsIHRoZSBlbnRpcmUgU29DIGFwcGVhcnMgdG8KbG9jayB1cCAtIGl0IGJlY29tZXMgdW5yZXNw
b25zaXZlIG9uIHRoZSBuZXR3b3JrLCBvciB2aWEgc2VyaWFsIGNvbnNvbGUKdG8gc3lzcnEgcmVx
dWVzdHMuCgpJIHN1c3BlY3QgdGhlIEdQVSBlbmRzIHVwIHNjcmliYmxpbmcgb3ZlciB0aGUgQ1BV
J3MgdmVjdG9yIHBhZ2Uva2VybmVsCmFzIGEgcmVzdWx0IG9mIHRoZSBhYm92ZSB0d28gZXRuYXZp
diBlcnJvcnMgd2hlbiBYb3JnIGF0dGVtcHRzIHRvIHN0YXJ0CnVzaW5nIHRoZSBHUFUuCgpUaGlz
IHVzZWQgdG8gd29yaywgc28gaXRzIGEgcmVncmVzc2lvbi4KCi0tIApSTUsncyBQYXRjaCBzeXN0
ZW06IGh0dHBzOi8vd3d3LmFybWxpbnV4Lm9yZy51ay9kZXZlbG9wZXIvcGF0Y2hlcy8KRlRUQyBi
cm9hZGJhbmQgZm9yIDAuOG1pbGUgbGluZSBpbiBzdWJ1cmJpYTogc3luYyBhdCAxMi4xTWJwcyBk
b3duIDYyMmticHMgdXAKQWNjb3JkaW5nIHRvIHNwZWVkdGVzdC5uZXQ6IDExLjlNYnBzIGRvd24g
NTAwa2JwcyB1cApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
