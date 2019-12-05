Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A262011416A
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2019 14:26:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A14566E0EF;
	Thu,  5 Dec 2019 13:26:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com
 [IPv6:2607:f8b0:4864:20::e44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EF976E0EF
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2019 13:26:43 +0000 (UTC)
Received: by mail-vs1-xe44.google.com with SMTP id g15so2348752vsf.1
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Dec 2019 05:26:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3UyymAr15R7mGc5+1X9Z5FKVkz+GaB1JmhwPl6722sQ=;
 b=q9elUhHuOYmDRRIqQYj0vRfxnhU2pR2MvkNBN0R2uBJ+Nl7qILKx8tp3Y6ceMCEIdV
 ExmZIORjt7Ls5rnAeH//gPwUxlmgTVvB25B3p/zSsJMHOdHk4w1BZ/v7eONhLL/xktWT
 awSJ/aMNZOiRMvTYtzfwhZXL/o0QF2Id3GIiNma1hFIBA2a3aC31qbvVazKOsaSrU4yD
 0WOBwGVFQUpWjaEIcE9QboPELvii7NFW6MXJbTxa5YFEA1GM2EYgh/C3KFY9EFe8xvMg
 L7EbUUCMVSTCy9xcUj8dDE5NttSm+cJYRJuHK7Hz+DdAoUYgi32RkAIF81zVEfiYKea1
 m+bw==
X-Gm-Message-State: APjAAAWwP6Wa2ATwaTYQEQaGs/+JCW3GRQYTgSt54kdQGFIsTiuiGglE
 dSDkz1h1kb4GioJOJVgxw9ASutEjcEUzzv1rHuU=
X-Google-Smtp-Source: APXvYqzakkhZGffuUGzK+CgkmoWV/46uoSCMkwuQxpyccISuJwcP5sALnQGE1OVpMkBtigg+vL2zW+8+rQc6gQu8DnA=
X-Received: by 2002:a67:2ecf:: with SMTP id u198mr5488490vsu.37.1575552402284; 
 Thu, 05 Dec 2019 05:26:42 -0800 (PST)
MIME-Version: 1.0
References: <20191204132430.16874-1-tzimmermann@suse.de>
 <20191204132430.16874-7-tzimmermann@suse.de>
In-Reply-To: <20191204132430.16874-7-tzimmermann@suse.de>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Thu, 5 Dec 2019 13:25:37 +0000
Message-ID: <CACvgo523H173HQSLi5bsy0FTHX93yDsQ-2U2y20VtaXU5XYa1w@mail.gmail.com>
Subject: Re: [PATCH 6/7] drm/udl: Begin/end access to imported buffers in
 damage-handler
To: Thomas Zimmermann <tzimmermann@suse.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=3UyymAr15R7mGc5+1X9Z5FKVkz+GaB1JmhwPl6722sQ=;
 b=QrQs+dNeL9/5RpmIPOrzczQ8boy7VuXoa4iF41TU0Hkhr66R68j1brhZCg8aJAYfWX
 8pk1E9Kyz/xGT9DFmMlHrKZe+LTWC2pZN/zyvnHXLMHyAPz63blMynR0wAhppVhrk8VF
 tIremhCmMzqcaxHOSOgEEbgrk449qCzKoq82An4RS+5qnZviZN6CPA2dPXx81TzS2HYB
 Nyc+1Vo7Hi4/q1LS6lAaJL0dsuEXi01FKmzA+zO+aR/9P1UlScnWyiWjM6O4FpGOb/DS
 xU15OIEotzC6hqRNPYw7BsJkd7H07t+vl4U4yTLMZBQdYoqtpqwUcc+2SyKjDGNFRL9X
 v+/w==
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
Cc: ML dri-devel <dri-devel@lists.freedesktop.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Dave Airlie <airlied@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>, Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCA0IERlYyAyMDE5IGF0IDEzOjI0LCBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1h
bm5Ac3VzZS5kZT4gd3JvdGU6Cj4KPiBUaGUgZGFtYWdlLWhhbmRsZXIgY29kZSBub3cgaW52b2tl
cyBkbWFfYnVmX3tiZWdpbixlbmR9X2FjY2VzcygpCj4gZm9yIGltcG9ydGVkIGJ1ZmZlcnMuIFRo
ZXNlIGNhbGxzIHdlcmUgbWlzc2luZyBmcm9tIHRoZSBwYWdlLWZsaXAKPiBhbmQgbW9kZXNldHRp
bmcgY29kZSBwYXRocy4KPgo+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emlt
bWVybWFubkBzdXNlLmRlPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vdWRsL3VkbF9mYi5jIHwg
MzggKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2Vk
LCAxOSBpbnNlcnRpb25zKCspLCAxOSBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vdWRsL3VkbF9mYi5jIGIvZHJpdmVycy9ncHUvZHJtL3VkbC91ZGxfZmIuYwo+
IGluZGV4IDQ4Mjc4NmVlZWE2Yy4uN2QxODRmZjk2YTFmIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS91ZGwvdWRsX2ZiLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdWRsL3VkbF9mYi5j
Cj4gQEAgLTkyLDYgKzkyLDcgQEAgaW50IHVkbF9oYW5kbGVfZGFtYWdlKHN0cnVjdCBkcm1fZnJh
bWVidWZmZXIgKmZiLCBpbnQgeCwgaW50IHksCj4gIHsKPiAgICAgICAgIHN0cnVjdCBkcm1fZGV2
aWNlICpkZXYgPSBmYi0+ZGV2Owo+ICAgICAgICAgc3RydWN0IHVkbF9kZXZpY2UgKnVkbCA9IHRv
X3VkbChkZXYpOwo+ICsgICAgICAgc3RydWN0IGRtYV9idWZfYXR0YWNobWVudCAqaW1wb3J0X2F0
dGFjaCA9IGZiLT5vYmpbMF0tPmltcG9ydF9hdHRhY2g7Cj4gICAgICAgICBpbnQgaSwgcmV0Owo+
ICAgICAgICAgY2hhciAqY21kOwo+ICAgICAgICAgc3RydWN0IHVyYiAqdXJiOwo+IEBAIC0xMTcs
MTUgKzExOCwyMiBAQCBpbnQgdWRsX2hhbmRsZV9kYW1hZ2Uoc3RydWN0IGRybV9mcmFtZWJ1ZmZl
ciAqZmIsIGludCB4LCBpbnQgeSwKPiAgICAgICAgIGVsc2UgaWYgKChjbGlwLngyID4gZmItPndp
ZHRoKSB8fCAoY2xpcC55MiA+IGZiLT5oZWlnaHQpKQo+ICAgICAgICAgICAgICAgICByZXR1cm4g
LUVJTlZBTDsKPgo+ICsgICAgICAgaWYgKGltcG9ydF9hdHRhY2gpIHsKPiArICAgICAgICAgICAg
ICAgcmV0ID0gZG1hX2J1Zl9iZWdpbl9jcHVfYWNjZXNzKGltcG9ydF9hdHRhY2gtPmRtYWJ1ZiwK
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIERNQV9GUk9N
X0RFVklDRSk7Cj4gKyAgICAgICAgICAgICAgIGlmIChyZXQpCj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgcmV0dXJuIHJldDsKPiArICAgICAgIH0KPiArCj4gICAgICAgICB2YWRkciA9IGRybV9n
ZW1fc2htZW1fdm1hcChmYi0+b2JqWzBdKTsKPiAgICAgICAgIGlmIChJU19FUlIodmFkZHIpKSB7
Cj4gICAgICAgICAgICAgICAgIERSTV9FUlJPUigiZmFpbGVkIHRvIHZtYXAgZmJcbiIpOwo+IC0g
ICAgICAgICAgICAgICByZXR1cm4gMDsKPiArICAgICAgICAgICAgICAgZ290byBvdXRfZG1hX2J1
Zl9lbmRfY3B1X2FjY2VzczsKPiAgICAgICAgIH0KPgo+ICAgICAgICAgdXJiID0gdWRsX2dldF91
cmIoZGV2KTsKPiAgICAgICAgIGlmICghdXJiKQo+IC0gICAgICAgICAgICAgICBnb3RvIG91dDsK
PiArICAgICAgICAgICAgICAgZ290byBvdXRfZHJtX2dlbV9zaG1lbV92dW5tYXA7Cj4gICAgICAg
ICBjbWQgPSB1cmItPnRyYW5zZmVyX2J1ZmZlcjsKPgo+ICAgICAgICAgZm9yIChpID0gY2xpcC55
MTsgaSA8IGNsaXAueTI7IGkrKykgewo+IEBAIC0xMzYsNyArMTQ0LDcgQEAgaW50IHVkbF9oYW5k
bGVfZGFtYWdlKHN0cnVjdCBkcm1fZnJhbWVidWZmZXIgKmZiLCBpbnQgeCwgaW50IHksCj4gICAg
ICAgICAgICAgICAgIGlmICh1ZGxfcmVuZGVyX2hsaW5lKGRldiwgbG9nX2JwcCwgJnVyYiwgKGNo
YXIgKil2YWRkciwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJmNtZCwg
Ynl0ZV9vZmZzZXQsIGRldl9ieXRlX29mZnNldCwKPiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgYnl0ZV93aWR0aCkpCj4gLSAgICAgICAgICAgICAgICAgICAgICAgZ290byBv
dXQ7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgZ290byBvdXRfZHJtX2dlbV9zaG1lbV92dW5t
YXA7Cj4gICAgICAgICB9Cj4KPiAgICAgICAgIGlmIChjbWQgPiAoY2hhciAqKSB1cmItPnRyYW5z
ZmVyX2J1ZmZlcikgewo+IEBAIC0xNDksMTAgKzE1NywxNiBAQCBpbnQgdWRsX2hhbmRsZV9kYW1h
Z2Uoc3RydWN0IGRybV9mcmFtZWJ1ZmZlciAqZmIsIGludCB4LCBpbnQgeSwKPiAgICAgICAgIH0g
ZWxzZQo+ICAgICAgICAgICAgICAgICB1ZGxfdXJiX2NvbXBsZXRpb24odXJiKTsKPgo+IC1vdXQ6
Cj4gKyAgICAgICByZXQgPSAwOwo+ICsKPiArb3V0X2RybV9nZW1fc2htZW1fdnVubWFwOgo+ICAg
ICAgICAgZHJtX2dlbV9zaG1lbV92dW5tYXAoZmItPm9ialswXSwgdmFkZHIpOwo+ICtvdXRfZG1h
X2J1Zl9lbmRfY3B1X2FjY2VzczoKPiArICAgICAgIGlmIChpbXBvcnRfYXR0YWNoKQo+ICsgICAg
ICAgICAgICAgICByZXQgPSBkbWFfYnVmX2VuZF9jcHVfYWNjZXNzKGltcG9ydF9hdHRhY2gtPmRt
YWJ1ZiwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBETUFf
RlJPTV9ERVZJQ0UpOwo+Cj4gLSAgICAgICByZXR1cm4gMDsKPiArICAgICAgIHJldHVybiByZXQ7
ClNpbmNlIHlvdSdyZSB0b3VjaGluZyB0aGUgZW5kX2NwdV9hY2Nlc3MgY2FsbCwgd2UgbWlnaHQg
YXMgd2VsbAphZGRyZXNzIHRoZSBmb2xsb3dpbmcgYnVnLiBOYW1lbHk6CkV2ZW4gdGhvdWdoIHdl
IGdldCBhIGZhaWx1cmUgZnJvbSB1ZGxfcmVuZGVyX2hsaW5lKCkgb3Igb3RoZXJ3aXNlLCB0aGUK
ZnVuY3Rpb24gcmV0dXJuICJPSyIgd2hlbiBlbmRfY3B1X2FjY2VzcygpIGlzIHN1Y2Nlc3NmdWwu
CgpJZiB5b3UgcmVhbGx5IHdhbnQgdG8sIG9uZSBjYW4ga2VlcCBpdCBzZXBhcmF0ZSAoKyBDQyBz
dGFibGUpLAphbHRob3VnaCBpdCdzIGZpbmUgdG8gc3F1YXNoIGl0IGhlcmUgd2l0aCBhIHNtYWxs
IG5vdGUgaW4gdGhlIGNvbW1pdAptZXNzYWdlLgoKSFRICkVtaWwKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
