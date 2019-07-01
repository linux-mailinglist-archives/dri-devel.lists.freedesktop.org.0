Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD52A5C3F8
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jul 2019 21:55:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D565389C97;
	Mon,  1 Jul 2019 19:55:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93C12898F0;
 Mon,  1 Jul 2019 19:55:22 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id w13so25010102eds.4;
 Mon, 01 Jul 2019 12:55:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aDvBdz4CIhUwGc+WxUTMAssQu59DUKrshXV4PJF0Vqo=;
 b=q4H1Q0QGXUOfTglINQBloOCPguupWhrN2xjUw3/sXtRH992QvfRkhn5Xa0EXQXSgYi
 C8kD8619kHlh2GSrhpy79tiUgEZc9Nkea9nJuqEEbuTYB3EAvx1UhYd3+nJlDrGXgK6p
 e/dthRXbiQnOkW4xnAn/5pJF76CFsQiQUbY6IXuQOiVte/PYzqwfM42j/7oukqCJMinT
 9aBBGtWr1d1T4GW9EOYMIjdLSnEQ8DYbYlEWchBKDoFR4unbhuOdgWC9oVNjdidD6lr9
 zJh67QwZw0x75ivhdUogW4KBq13JjUj9GaJQxJ1mSFNp1Ri5gxxlL8Yj/c14pnVy4zHK
 tluA==
X-Gm-Message-State: APjAAAWH8WfcY6eD6aTpACcBVKfpAEt9u9AhF2BY/nODlUhTuhkwh8Zz
 BykWnoCSdcMEzICGedzEPyOlqvqunwN9pgSJlhk=
X-Google-Smtp-Source: APXvYqxRkskgrX6ttwwTzfZWxYIUz7bV7uQgkLArcijalzyyJWLD/+AWOAPLPdaO2F7CFX7FQozjAXt7BLsZ79S0Xj8=
X-Received: by 2002:a50:9468:: with SMTP id q37mr31076816eda.163.1562010921237; 
 Mon, 01 Jul 2019 12:55:21 -0700 (PDT)
MIME-Version: 1.0
References: <20190701174120.15551-1-jeffrey.l.hugo@gmail.com>
In-Reply-To: <20190701174120.15551-1-jeffrey.l.hugo@gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 1 Jul 2019 12:55:05 -0700
Message-ID: <CAF6AEGsGRcuk3xnWG8KspW4wzG38o-Xg8tybnND9Lb24PWP5dw@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/mdp5: Use eariler mixers when possible
To: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=aDvBdz4CIhUwGc+WxUTMAssQu59DUKrshXV4PJF0Vqo=;
 b=U9nn1Kg5IOugwawL1Z7TRIycorfaFuo8YkKcLYXI8vSjK0RBsXQUXEaWn2POhWqroI
 5ba+6tR7izhRX8RE1nPTzlKMBGmcSGLyLzTDZneyOzk9wJNv04HC1Jv0jYtZTh8m0Eg1
 wbbYzRLKsxGX56VZhlzAKMJSw3SpqR3dzl0pBWNeGtohgc+g8lMql84ZmlSYTdq9OhQi
 seQQbAmYn0XgUX64pl2k7tGpBtPQwT08SMkLZm5SjcIRLk6qlXKFFulJqrF38P7xywlG
 e3JFe8zOpwYgr8EtnvmVuMs0P6U/pcNbv6WBtfdzQW/eKUKqDyva8Zb91ru3ewVtFPxC
 sEyg==
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
Cc: freedreno <freedreno@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdWwgMSwgMjAxOSBhdCAxMDo0MSBBTSBKZWZmcmV5IEh1Z28gPGplZmZyZXkubC5o
dWdvQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBXaGVuIGFzc2lnbmluZyBhIG1peGVyLCB3ZSB3aWxs
IGl0ZXJhdGUgdGhyb3VnaCB0aGUgZW50aXJlIGxpc3QgbG9va2luZyBmb3IKPiBhIHN1aXRhYmxl
IG1hdGNoLiAgVGhpcyByZXN1bHRzIGluIHNlbGVjdGluZyB0aGUgbGFzdCBtYXRjaC4gIFdlIHNo
b3VsZAo+IHN0b3AgYXQgdGhlIGZpcnN0IG1hdGNoLCBzaW5jZSBsb3dlciBudW1iZXJlZCBtaXhl
cnMgd2lsbCB0eXBpY2FsbHkgaGF2ZQo+IG1vcmUgY2FwYWJpbGl0aWVzLCBhbmQgYXJlIGxpa2Vs
eSB0byBiZSB3aGF0IHRoZSBib290bG9hZGVyIHVzZWQsIGlmIHdlCj4gYXJlIGxvb2tpbmcgdG8g
cmV1c2UgdGhlIGJvb3Rsb2FkZXIgY29uZmlnIGluIGZ1dHVyZS4KCkkgdGhpbmsgZm9yIG1hdGNo
aW5nIGJvb3Rsb2FkZXIgY29uZmlnLCB3ZSBuZWVkIHRvIHJlYWQgaXQgb3V0IG9mIHRoZQpodyBh
bmQgZG8gaXQgdGhlIGhhcmQgd2F5LCByYXRoZXIgdGhhbiBtYWtpbmcgYXNzdW1wdGlvbnMuCgpG
b3IgcGlja2luZyBod3BpcGUgZm9yIGEgcGxhbmUsIEkgbWFkZSBhbiBlZmZvcnQgdG8gcGljayB0
aGUgYXZhaWxhYmxlCmh3cGlwZSB3LyB0aGUgKmxlYXN0KiBjYXBhYmlsaXRpZXMgdGhhdCBmaXQg
dGhlIHJlcXVpcmVtZW50cyAoaWUuCnNjYWxpbmcveXV2L2V0YykgaW4gb3JkZXIgdG8gbGVhdmUg
dGhlIG1vcmUgY2FwYWJsZSBod3BpcGUgYXZhaWxhYmxlCmZvciBmdXR1cmUgdXNlLiAgTm90IHN1
cmUgaWYgc2FtZSBhcHByb2FjaCB3b3VsZCBtYWtlIHNlbnNlIGZvcgptaXhlcnM/ICBCdXQgbm90
IHN1cmUgaWYgcGlja2luZyBzb21ldGhpbmcgdGhhdCBib290bG9hZGVyIHByb2JhYmx5CmFsc28g
d291bGQgaGF2ZSBwaWNrZWQgaXMgYSBncmVhdCBhcmd1bWVudC4KCkkgZG8gaGF2ZSBzb21lIChu
b3cgYW5jaWVudCkgY29kZSBmcm9tIGRiNDEwL21kcDUgdG8gcmVhZCBvdXQgaGUgaHcKc3RhdGUu
LiBJICp0aGluayogdGhhdCBtaWdodCBoYXZlIHBvc3QtZGF0ZWQgZHluYW1pY2FsbHkgcGlja2lu
ZwptaXhlcnMuICAoVGhlIG9sZGVyIG1kcDUgb24gZGI0MTBjIGFsc28gaGFkIHRvIGRlYWwgd2l0
aCBmaWd1cmluZyBvdXQKU01QIGJsb2NrIGNvbmZpZywgaWlyYy4uIHRoYW5rZnVsbHkgbmV3ZXIg
bWRwNSBkb2Vzbid0IGhhdmUgdG8gZGVhbAp3aXRoIHRoYXQuKQoKQlIsCi1SCgo+Cj4gU2lnbmVk
LW9mZi1ieTogSmVmZnJleSBIdWdvIDxqZWZmcmV5LmwuaHVnb0BnbWFpbC5jb20+Cj4gLS0tCj4g
IGRyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9tZHA1L21kcDVfbWl4ZXIuYyB8IDExICsrKysrKysr
KysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL21kcDUvbWRwNV9taXhlci5jIGIvZHJpdmVycy9ncHUv
ZHJtL21zbS9kaXNwL21kcDUvbWRwNV9taXhlci5jCj4gaW5kZXggOTU0ZGI2ODNhZTQ0Li4xNjM4
MDQyYWQ5NzQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL21kcDUvbWRw
NV9taXhlci5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL21kcDUvbWRwNV9taXhl
ci5jCj4gQEAgLTk2LDYgKzk2LDE3IEBAIGludCBtZHA1X21peGVyX2Fzc2lnbihzdHJ1Y3QgZHJt
X2F0b21pY19zdGF0ZSAqcywgc3RydWN0IGRybV9jcnRjICpjcnRjLAo+ICAgICAgICAgICAgICAg
ICAgKi8KPiAgICAgICAgICAgICAgICAgaWYgKCEoKm1peGVyKSB8fCBjdXItPmNhcHMgJiBNRFBf
TE1fQ0FQX1BBSVIpCj4gICAgICAgICAgICAgICAgICAgICAgICAgKm1peGVyID0gY3VyOwo+ICsK
PiArICAgICAgICAgICAgICAgLyoKPiArICAgICAgICAgICAgICAgICogV2UgaGF2ZSBldmVyeXRo
aW5nIHdlIGNvdWxkIHdhbnQsIGV4aXQgZWFybHkuCj4gKyAgICAgICAgICAgICAgICAqIFdlIGhh
dmUgYSB2YWxpZCBtaXhlciwgdGhhdCBtaXhlciBwYWlycyB3aXRoIGFub3RoZXIgaWYgd2UKPiAr
ICAgICAgICAgICAgICAgICogbmVlZCB0aGF0IGFiaWxpdHkgaW4gZnV0dXJlLCBhbmQgd2UgaGF2
ZSBhIHJpZ2h0IG1peGVyIGlmCj4gKyAgICAgICAgICAgICAgICAqIG5lZWRlZC4KPiArICAgICAg
ICAgICAgICAgICogTGF0ZXIgTE1zIGNvdWxkIGJlIGxlc3Mgb3B0aW1hbAo+ICsgICAgICAgICAg
ICAgICAgKi8KPiArICAgICAgICAgICAgICAgaWYgKCptaXhlciAmJiAoKm1peGVyKS0+Y2FwcyAm
IE1EUF9MTV9DQVBfUEFJUiAmJgo+ICsgICAgICAgICAgICAgICAgICAgKChyX21peGVyICYmICpy
X21peGVyKSB8fCAhcl9taXhlcikpCj4gKyAgICAgICAgICAgICAgICAgICAgICAgYnJlYWs7Cj4g
ICAgICAgICB9Cj4KPiAgICAgICAgIGlmICghKCptaXhlcikpCj4gLS0KPiAyLjE3LjEKPgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
