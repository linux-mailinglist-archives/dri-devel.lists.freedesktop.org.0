Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 37DDED3992
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2019 08:48:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BF3C6EBA6;
	Fri, 11 Oct 2019 06:48:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75EF06E3EB;
 Thu, 10 Oct 2019 23:34:40 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id w67so5661996lff.4;
 Thu, 10 Oct 2019 16:34:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=OzTCu5I04s+EnaAbwN6eYgKI0KQPTUphwOlhf37qoKM=;
 b=nUsOZ0nR5fnRHol8ljaJC5ClX1s5gkXPeFteDvHft/L1zTQuqpUDY/Rg5hdQ56ZVMf
 +/i3cnAzmhIN5sIVRER1m5gGWeq+tQrBIc7tqdqNiR/IZVDbQqJtrcfGmprKIlTwuNjE
 GnS+WEjXx8JYKpeko8Du+h7GUw6NhGWXeSJA5K+wAYphmmvoIyiYW7lwNr0eW37641KE
 4MPBXTy2Lb4rqNsxLqnOCw8HpmRjjBNa+uMLJ0yW7LfcXjm6S0WbBEwDv8F7MpU4gR16
 Z3DZGVO+8P8lbw5JdML+EnUB1J8wZPLVHnW90TRBb6u2EoGya6g9gNRYx5Lhb3+7Xoy8
 BAhg==
X-Gm-Message-State: APjAAAXBnBEq1k3Gt34PQn0XKzq8hxCjxEY0azXdosiDKVOcboUYpHt/
 FlansA2uXb057DdJQCY3UtB/rlDQXMAVdlAVZw==
X-Google-Smtp-Source: APXvYqy3SIYI31R+EmdX4s4IYa//aTqrlhyKysAJJuq8mJhKiFdjY7189S10bJX2gMIbWgAlvDqUgkSl4Q+4KdktoKk=
X-Received: by 2002:ac2:424c:: with SMTP id m12mr7351197lfl.140.1570750478898; 
 Thu, 10 Oct 2019 16:34:38 -0700 (PDT)
MIME-Version: 1.0
From: Gabriel C <nix.or.die@gmail.com>
Date: Fri, 11 Oct 2019 01:34:08 +0200
Message-ID: <CAEJqkgi-9_1D91GUm_MbS-=RRRwMZjqEYWhCCdk+STvc0PeYXw@mail.gmail.com>
Subject: [amdgpu] ASSERT()'s in write_i2c*retimer_setting() functions
To: LKML <linux-kernel@vger.kernel.org>, amd-gfx@lists.freedesktop.org, 
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
X-Mailman-Approved-At: Fri, 11 Oct 2019 06:48:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=OzTCu5I04s+EnaAbwN6eYgKI0KQPTUphwOlhf37qoKM=;
 b=izvtbYCZRJQnH6TCdDLZC0uFGCK4uHtEx+/NINpDi8P3ng/wp/4lWDOs1Ho2AcBdel
 p44UhCtPD/wH3Ki3TQO2pdYGeWEvn9ZaAwZRqJavX9Lma5Ui52o+XaWM9V8LMugdQu3e
 uYGmbCd3fmn9g4FT7i9cWMQKZ6H9Gq4N6uYmpJoTg/pf40KsMGPFVThGECBAQrrokBKN
 UyMS54tT1I3yHtxknsQ5BAfgn3N61ZZWp+/HyY3tgubshEQ4/7keFfPTnNZh11e+BnMB
 uihu0MMw4yZRFuBcmQXMrRsTesF7+P1t0dzGpnhsTxkjyCS2Xi65uniSlNJ4WdvwTnzW
 yPmw==
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
Cc: dri-devel@lists.freedesktop.org, Zeyu Fan <Zeyu.Fan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGVsbG8sCgpJJ3ZlIGJ1aWx0IHJlY2VudGx5IGEgbmV3IGJveCB3aXRoIGEgUnl6ZW4zIDIyMDBH
IEFQVS4KCkVhY2ggdGltZSBJIHBsdWcgaW4gYW4gSERNSSBjYWJsZSAoIHRvIGEgVFYgb3IgTW9u
aXRvciApLApvciBib290IHdpdGggSERNSSBjb25uZWN0ZWQgYSBsb3QgQVNTRVJUKCkncyBmcm9t
CndyaXRlX2kyYypyZXRpbWVyX3NldHRpbmcoKSBmdW5jdGlvbnMgYXJlIHRyaWdnZXJlZC4KCkkg
c2VlIHRoZSBzYW1lIG9uIGEgTGFwdG9wIHdpdGggYSBSeXplbjcgMzc1MEggd2l0aApoeWJyaWQg
R1BVIGNvbmZpZ3VyYXRpb24uCgpCZXNpZGVzIHRoZSBub2lzZSBpbiBkbWVzZyBhbmQgdGhlIGRl
bGF5IG9uIGJvb3QsCmV2ZXJ5dGhpbmcgaXMgd29ya2luZyBmaW5lLiBJIGNhbm5vdCBmaW5kIGFu
eXRoaW5nIHdyb25nCm9yIGJyb2tlbi4KClNpbmNlIHRoZSB3cml0ZSBlcnJvcnMgc2VlbSB0byBu
b3QgYmUgZmF0YWwsIEkgdGhpbmsgYSBmcmllbmRseSBtZXNzYWdlCndvdWxkIGhlbHAgbW9yZSBp
bnN0ZWFkIG9mIGZsb29kaW5nIHRoZSBkbWVzZyB3aXRoIGR1bXBzIHdoaWxlCmV2ZXJ5dGhpbmcg
aXMgd29ya2luZyBwcm9wZXJseS4KCldoeSBpcyBBU1NFUlQoKSB1c2VkIHRoZXJlPwoKSSBoYXZl
IGEgZG1lc2cgZnJvbSB0aGUgUnl6ZW4zIGJveCB3aXRoIGRybS5kZWJ1ZyBhbmQgYSBzbmlwcGVk
CmZyb20gdGhlIExhcHRvcCAoIG5vdCBuZWFyIG1lIHJpZ2h0IG5vdyApIHVwbG9hZGVkIHRoZXJl
OgoKaHR0cHM6Ly9jcmF6eS5kZXYuZnJ1Z2Fsd2FyZS5vcmcvYW1kZ3B1LwoKUGxlYXNlIGxldCBt
ZSBrbm93IGlmIHlvdSBuZWVkIG1vcmUgaW5mb3JtYXRpb24sCklmIG5lZWRlZCBJIGNhbiB1cGxv
YWQgYSBkbWVzZyBmcm9tIHRoZSBMYXB0b3Agd2l0aCBkcm0uZGVidWcgdG9vLgoKCkJlc3QgUmVn
YXJkcywKCkdhYnJpZWwgQwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
