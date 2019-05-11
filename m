Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 398061A910
	for <lists+dri-devel@lfdr.de>; Sat, 11 May 2019 20:23:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BA0689829;
	Sat, 11 May 2019 18:23:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D02E89E57;
 Sat, 11 May 2019 01:37:04 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id p26so7626989edr.2;
 Fri, 10 May 2019 18:37:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=cMq/4MVOYTLAY5QCZFXsiVplr0BJ1X0QHMo57CSt7M0=;
 b=hAgxDorpgaQVmoNdJwqfUomFKDecQMgv6PGgg9RLuVVh9HpSGzY1DdX27Xg6CHzGL5
 Q5QpaajA/kEE6MIRo7cWcYXp/+Ok+ffbqvCjFSs3OrV+RmtLBUbY2/ANXanCNBNJ4MaS
 p8FU6ScN9+jXNWl54daq3RGT8IcyYrdNpxLqdX2O/zSxTs/gL6aooUBqJbrs7uvT2xim
 /7Q3Niwu83KMxONAmRAf7mBDINX3j1DfJfG7jMMhBOjwr25xU6O+go3I0DzaDCKHPBs/
 QCXu+sOZ944R8usZV/ZTxRkYm9T8IQqCXXGmhUYADcOKYSrADBXmyOwv+kANwEzhI9ze
 hZ5g==
X-Gm-Message-State: APjAAAU7ftxky/8MX0P8szc9FDo1BDjVUz160+LnzKImfxp6PNtrX9qh
 qZgqNXuhOxZwKD6Y2DNDZec=
X-Google-Smtp-Source: APXvYqwEslwWnu/DDdBLnHiDjFx0U3EFjNGO7nlU7JO0Cna0SAFoYxwor0qw9RJIv7RkJryDnJDIzQ==
X-Received: by 2002:a50:87ab:: with SMTP id a40mr14362661eda.188.1557538622698; 
 Fri, 10 May 2019 18:37:02 -0700 (PDT)
Received: from archlinux-i9 ([2a01:4f9:2b:2b84::2])
 by smtp.gmail.com with ESMTPSA id x49sm1943909edm.25.2019.05.10.18.37.01
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 10 May 2019 18:37:01 -0700 (PDT)
Date: Fri, 10 May 2019 18:37:00 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
To: Colin King <colin.king@canonical.com>
Subject: Re: [PATCH][next] drm/amdgpu: fix return of an uninitialized value
 in variable ret
Message-ID: <20190511013700.GA3530@archlinux-i9>
References: <20190510100842.30458-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190510100842.30458-1-colin.king@canonical.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Mailman-Approved-At: Sat, 11 May 2019 18:22:57 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=cMq/4MVOYTLAY5QCZFXsiVplr0BJ1X0QHMo57CSt7M0=;
 b=CkNDRldwZfIz+X4uABrZClSDUWHjBfaBuu7G2n7Gpczgt75QH0WclEqN4k6TsURw68
 Qxt3ESXCC/ATWtJOOqRe8qpgnsqNovPgvq7dC6tbcHMU//mqFVvwAEq8Vx8JBSaaxhM6
 /YSqC/tKAAnWDQDclisONzDZbVRc27N7lIsH+WlXYnFkSQf5NFehFX5vSY5JVk/9UQEx
 vx4BLyFZ5CtxqH6lTtR5r28RR3GuuEHO+fh/73/LD8XPw1rzG5BFaBmLlnM1KoBRatqE
 NtyXxvSkhlNSavw0FGRj4B7inEBomdaBSgl1ZgZ1PAJ2H4tP4CxfFG1YiknsYFqrurQJ
 PcdQ==
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
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBNYXkgMTAsIDIwMTkgYXQgMTE6MDg6NDJBTSArMDEwMCwgQ29saW4gS2luZyB3cm90
ZToKPiBGcm9tOiBDb2xpbiBJYW4gS2luZyA8Y29saW4ua2luZ0BjYW5vbmljYWwuY29tPgo+IAo+
IEluIHRoZSBjYXNlIHdoZXJlIGlzX2VuYWJsZSBpcyBmYWxzZSBhbmQgbG9fYmFzZV9hZGRyIGlz
IG5vbi16ZXJvIHRoZQo+IHZhcmlhYmxlIHJldCBoYXMgbm90IGJlZW4gaW5pdGlhbGl6ZWQgYW5k
IGlzIGJlaW5nIGNoZWNrZWQgZm9yIG5vbi16ZXJvCj4gYW5kIHBvdGVudGlhbGx5IGdhcmJhZ2Ug
aXMgYmVpbmcgcmV0dXJuZWQuIEZpeCB0aGlzIGJ5IG5vdCByZXR1cm5pbmcKPiByZXQgYnV0IGlu
c3RlYWQgcmV0dXJuaW5nIC1FSU5WQUwgb24gdGhlIHplcm8gbG9fYmFzZV9hZGRyIGNhc2UuCj4g
Cj4gQWRkcmVzc2VzLUNvdmVyaXR5OiAoIlVuaW5pdGlhbGl6ZWQgc2NhbGFyIHZhcmlhYmxlIikK
PiBGaXhlczogYTZhYzBiNDRiYWI5ICgiZHJtL2FtZGdwdTogYWRkIGRmIHBlcmZtb24gcmVncyBh
bmQgZnVuY3MgZm9yIHhnbWkiKQo+IFNpZ25lZC1vZmYtYnk6IENvbGluIElhbiBLaW5nIDxjb2xp
bi5raW5nQGNhbm9uaWNhbC5jb20+CgpSZXZpZXdlZC1ieTogTmF0aGFuIENoYW5jZWxsb3IgPG5h
dGVjaGFuY2VsbG9yQGdtYWlsLmNvbT4KClRoaXMgZml4ZXMgYSBjbGFuZyB3YXJuaW5nIGNvbXBs
YWluaW5nIGFib3V0IHRoZSBzYW1lIHRoaW5nLgoKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvZGZfdjNfNi5jIHwgNSArLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDQgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2RmX3YzXzYuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2RmX3YzXzYu
Ywo+IGluZGV4IGE1YzM1NTg4NjlmYi4uOGMwOWJmOTk0YWNkIDEwMDY0NAo+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2RmX3YzXzYuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2RmX3YzXzYuYwo+IEBAIC0zOTgsMTAgKzM5OCw3IEBAIHN0YXRpYyBpbnQgZGZf
djNfNl9zdGFydF94Z21pX2xpbmtfY250cihzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKPiAg
CQkJCU5VTEwpOwo+ICAKPiAgCQlpZiAobG9fYmFzZV9hZGRyID09IDApCj4gLQkJCXJldCA9IC1F
SU5WQUw7Cj4gLQo+IC0JCWlmIChyZXQpCj4gLQkJCXJldHVybiByZXQ7Cj4gKwkJCXJldHVybiAt
RUlOVkFMOwo+ICAKPiAgCQlsb192YWwgPSBSUkVHMzJfUENJRShsb19iYXNlX2FkZHIpOwo+ICAK
PiAtLSAKPiAyLjIwLjEKPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
