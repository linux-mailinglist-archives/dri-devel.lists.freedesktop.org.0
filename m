Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5FB4103C08
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2019 14:40:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BEE56E9C3;
	Wed, 20 Nov 2019 13:40:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4013E6E9C3
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2019 13:40:15 +0000 (UTC)
Received: by mail-oi1-x241.google.com with SMTP id l20so22475575oie.10
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2019 05:40:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yk3BdSMEbTrPk0DCx6a1v/JqmveEQ/R9Y3pg54A2UIc=;
 b=medaKuaJad4IrgOAD7aeaCUjY17x31mBSx6YesIowub2XhpIxr6MR/VpOMMfDDf2Hh
 Jf8XU90TXuiohgrSjlKrnOiZsBELfZ+3qwB8AyH57vNpvvar7smprpMolMp/Zk/EbgzK
 qrrDL0XqN4xTCmIjrJJnqFDBy/4XRWW2OBMMpdo09xuSlx3R08QqYCpNEnILyZ2Uf19M
 FJM5BAhstT6K5OD1h7actzVUSYlnUkfFCNssCKaMykIfvQF8r1fISOorvfCQywWZMaRU
 qM6l7RQu+jvBefaFgCxjeyGYht/RjlWXy2NOKCn6YatqGE9PJjPSEuWnl/YECU4txfg3
 KmlA==
X-Gm-Message-State: APjAAAUfUi1aRgLOIaXA/pm+vOJBT98nRjymJ2sb3WiqTH4Gtr99Oiq7
 gjGnxYmOrYWej/7uBg+6Df3DV9CExJDPOHWYdbYLag==
X-Google-Smtp-Source: APXvYqzoXfKeTK2qYUj+BRsYUAxpP+5A0666/gTV6iQFRNw+oDNOIZ01OmwS4+LG4BzFwVBszylXtUtSGAxWr/2F8V4=
X-Received: by 2002:aca:3889:: with SMTP id f131mr2887510oia.14.1574257214262; 
 Wed, 20 Nov 2019 05:40:14 -0800 (PST)
MIME-Version: 1.0
References: <20191115105601.i7ahtapysv4j7mn7@sirius.home.kraxel.org>
 <CAKMK7uHNOF5pAWCbQ1-eFWcxEOZmOoKOYL450ZJd7TOeVhMvjw@mail.gmail.com>
 <20191118104026.zg5pt5yg2wkulmrr@sirius.home.kraxel.org>
 <20191118164927.GF23790@phenom.ffwll.local>
 <20191120080532.hjjjddxrsikozlpq@sirius.home.kraxel.org>
 <20191120103913.GH30416@phenom.ffwll.local>
 <20191120114038.6ytbvc3hc4fzb5aa@sirius.home.kraxel.org>
 <CAKMK7uFhFi7F9RZ=Jyf5qG2Bfss9N8UbCr=kVAoNWOsnmTZrtw@mail.gmail.com>
 <20191120121848.eq5jeh3qgpendm7l@sirius.home.kraxel.org>
 <CAKMK7uGNStNfNnyh2BZJ4kXEZYAnjcTq67jRd2W-1TvSc3tv7Q@mail.gmail.com>
 <20191120130841.3ajf6pho4zyqqcwg@sirius.home.kraxel.org>
In-Reply-To: <20191120130841.3ajf6pho4zyqqcwg@sirius.home.kraxel.org>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 20 Nov 2019 14:40:02 +0100
Message-ID: <CAKMK7uG5D9YeYgSx+H0v+g7uGt5bEnDyAij=mokQS8Qgez4Ukw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/gem: Fix mmap fake offset handling for
 drm_gem_object_funcs.mmap
To: Gerd Hoffmann <kraxel@redhat.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=yk3BdSMEbTrPk0DCx6a1v/JqmveEQ/R9Y3pg54A2UIc=;
 b=NZeaQPDrao/exZEi5CFl2SBGy6yRaFrX0X6Zk4XRxZfTLCxKpJEoNnnK3rUyRMyL2l
 YRtCmVvTLWrlsAVlfJio2xLSYl/W4JclqMvue28fnHaygABm3NhOD9Rrurq14gZHjsad
 lC0VpaEJ4bTZwyN7D2y+xAQG5hi0eDT6J/fB0=
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBOb3YgMjAsIDIwMTkgYXQgMjowOCBQTSBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVk
aGF0LmNvbT4gd3JvdGU6Cj4gPiBBaCwgd2UncmUgbm90IGdvaW5nIHRvIHJlcGxhY2UgdGhlIG1h
cHBpbmcgb24gdGhlIGRtYS1idWYgZmlsZS4gT25seQo+ID4gdGhlIGZpbGUgb2YgdGhlIHZtYSBz
dHJ1Y3R1cmUuIERvaW5nIHRoZSBmb3JtZXIgd291bGQgaW5kZWVkIGJlIHByZXR0eQo+ID4gYmFk
IGZyb20gYSBzZWN1cml0eSBwb3YuCj4KPiBOb3cgd2hlcmUgZG8gSSBnZXQgYSBmaWxwIGZyb20/
ICBDYW4gSSBqdXN0IGNhbGwgZHJtX29wZW4/CgpIbSwgbm93IEkgd29uZGVyIHdoZXRoZXIgaXQn
cyBtYXliZSBvayB0byBqdXN0IGV4Y2hhbmdlIHRoZQpmaWxwLT5mX21hcHBpbmcuIEFzIGxvbmcg
YXMgd2UgZG9uJ3QgbWl4IHVwIHRoZSBraW5kcyBvZiBtYXBwaW5nIGFuZApwYWdlLWNhY2hlIG1h
bmFnZW1lbnQgdGhhdCBjYW4gaGFwcG9uIG9uIGEgZ2l2ZW4gYWRkcmVzc19zcGFjZQpzdHJ1Y3R1
cmUgKHRoYXQncyB3aHkgSSdtIG5vdCBrZWVvbiB0aGUgc2htZW0gbWFwcGluZyByZXVzZWQsIHNp
bmNlCnNobWVtIHVzZXMgdGhlIHNhbWUgYWRkcmVzc19zcGFjZSBzdHJ1Y3R1cmUgaW50ZXJuYWxs
eSB0byBtYW5hZ2UgdGhlCnBhZ2UgYWxsb2NhdGlvbnMgLSBhZGRyZXNzX3NwYWNlIGJvdGggY29u
dGFpbnMgdGhlIHBhZ2UgY2FjaGUgZm9yIGEKZmlsZSwgYW5kIGFsc28gdGhlIHJldmVyc2UgbWFw
cGluZyBpbmZvcm1hdGlvbikuIFNvIGtpbmRhIHdoYXQKZHJtX29wZW4gZG9lcywgZXhjZXB0IHdl
IGRvIHRoYXQgdG8gdGhlIGRtYS1idWYgZmlsZS4gU28gZXhhY3RseSB3aGF0CmFtZGdwdSBpcyBk
b2luZyBhbmQgdGhhdCBJIGp1c3QgY29tcGxhaW5lZCBhYm91dCA6LSkKCkFzaWRlOiB0aGUgYW1k
Z3B1IGlzbid0IGdyZWF0IGJlY2F1c2UgaXQncyByYWN5LCB1c2Vyc3BhY2UgY291bGQgaGF2ZQpn
dWVzc2VkIHRoZSBmZCBhbmQgYWxyZWFkeSBzdGFydGVkIGFuIG1tYXAgYmVmb3JlIHdlIG1hbmFn
ZWQgdG8gdXBkYXRlCnN0dWZmLiBCdXQgYXNpZGUgZnJvbSB0aGF0IG1heWJlIHJvbGxpbmcgb3V0
IHRoZSBhbWRncHUgdHJpY2sgZm9yCmV2ZXJ5b25lIGlzIHRoZSByaWdodCB3YXk/Ci1EYW5pZWwK
LS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCis0
MSAoMCkgNzkgMzY1IDU3IDQ4IC0gaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
