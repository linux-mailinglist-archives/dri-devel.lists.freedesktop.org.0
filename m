Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C389F10F4A8
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 02:48:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F32156E35F;
	Tue,  3 Dec 2019 01:48:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E55E6E35F
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2019 01:48:31 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id a13so1783808ljm.10
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Dec 2019 17:48:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oMVSw/JGNv0EeaGiSVuvi8O6EbJ20XBVekh+RkZj4rI=;
 b=cQCrQhw5aBu0ZopPfVT1lV+f0aNjXKe+0AtRrbKkXR8HIDq4W7QX69HSYLNsrD+04q
 fvtPy1kWs6zu3ErF7PqFQIq/sZ4vWg6neR4o7+jnLFT/if9lWKXQUjJWChkGy698RaGz
 xLDwfpxHj+Xjh8a5ZUGj6tIdj4w+T0ytBkhe1MrK8R66zVTjwlBpF1Mz0zUNDsOcqqIp
 9LiRmBqBS0nRktTYLj/YbDjRp2dVYrFZI2Qam3wCncO1n0tx+VUnDGiyeAe1hk0juMpa
 z3cuYrGEFOd8fxMhGtdXVIsVEAI5DB9a4RCtoK7fpwgCp0JCK9xABRXUOLAQF2aXi5gR
 PYlA==
X-Gm-Message-State: APjAAAV7NZFA4ljx68l0vEpb9hfdqm6Yw8j36S8agspUht63vVbd8sbN
 4Ht4k+SLxT0eKiTFt1tpOzfELjXwiys=
X-Google-Smtp-Source: APXvYqy4FIAWbFmk/m1TwYOxPoBzOXtA2zvZNcoWTob6VjlPFdcttl6DNwd7qxh1WN3xyUJT66hGVA==
X-Received: by 2002:a2e:9e97:: with SMTP id f23mr989960ljk.89.1575337709661;
 Mon, 02 Dec 2019 17:48:29 -0800 (PST)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com.
 [209.85.208.171])
 by smtp.gmail.com with ESMTPSA id g6sm504554lja.10.2019.12.02.17.48.29
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Dec 2019 17:48:29 -0800 (PST)
Received: by mail-lj1-f171.google.com with SMTP id 21so1868043ljr.0
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Dec 2019 17:48:29 -0800 (PST)
X-Received: by 2002:a2e:8e97:: with SMTP id z23mr953785ljk.125.1575337708687; 
 Mon, 02 Dec 2019 17:48:28 -0800 (PST)
MIME-Version: 1.0
References: <20191126011056.67928-1-gurchetansingh@chromium.org>
 <20191126011056.67928-2-gurchetansingh@chromium.org>
 <20191128114809.ukvsmuvzssxctvoe@sirius.home.kraxel.org>
In-Reply-To: <20191128114809.ukvsmuvzssxctvoe@sirius.home.kraxel.org>
From: Gurchetan Singh <gurchetansingh@chromium.org>
Date: Mon, 2 Dec 2019 17:48:17 -0800
X-Gmail-Original-Message-ID: <CAAfnVBmaVS=KqVybDnZnJd2_ZbaL2Dh_BsA41VJFWgK4qougPg@mail.gmail.com>
Message-ID: <CAAfnVBmaVS=KqVybDnZnJd2_ZbaL2Dh_BsA41VJFWgK4qougPg@mail.gmail.com>
Subject: Re: [PATCH 2/5] udmabuf: allow userspace to set map attributes
To: Gerd Hoffmann <kraxel@redhat.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=oMVSw/JGNv0EeaGiSVuvi8O6EbJ20XBVekh+RkZj4rI=;
 b=UCvmf/oJHWc/+65ryprPpgkC58ZP7SuDa+yazg/ryWs3CkAsKqqz5R4xVF9KQnZ+Bu
 rR3R8uMKkJomKS8z2qUcThyJQoQEBF9VhqXqpJQ8vLhNC6v6yo/X6GtoAN6hDHBfxFeH
 ULQlMFxg7EYzoVCho88D8/2nOHGtGXa7wXmdA=
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
Cc: hch@lst.de, ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBOb3YgMjgsIDIwMTkgYXQgMzo0OCBBTSBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVk
aGF0LmNvbT4gd3JvdGU6Cj4KPiAgIEhpLAo+Cj4gPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS91YXBp
L2xpbnV4L3VkbWFidWYuaCBiL2luY2x1ZGUvdWFwaS9saW51eC91ZG1hYnVmLmgKPiA+IGluZGV4
IDQ2YjY1MzJlZDg1NS4uZjkwODMxZjJiYjBkIDEwMDY0NAo+ID4gLS0tIGEvaW5jbHVkZS91YXBp
L2xpbnV4L3VkbWFidWYuaAo+ID4gKysrIGIvaW5jbHVkZS91YXBpL2xpbnV4L3VkbWFidWYuaAo+
ID4gQEAgLTYsNiArNiw4IEBACj4gPiAgI2luY2x1ZGUgPGxpbnV4L2lvY3RsLmg+Cj4gPgo+ID4g
ICNkZWZpbmUgVURNQUJVRl9GTEFHU19DTE9FWEVDICAgICAgICAweDAxCj4gPiArI2RlZmluZSBV
RE1BQlVGX0ZMQUdTX1dDICAgICAweDAyCj4gPiArI2RlZmluZSBVRE1BQlVGX0ZMQUdTX05PTkNB
Q0hFRCAweDA0Cj4gPgo+ID4gIHN0cnVjdCB1ZG1hYnVmX2NyZWF0ZSB7Cj4gPiAgICAgICBfX3Uz
MiBtZW1mZDsKPgo+IFRoaXMgaXMgYSB1YXBpIGNoYW5nZSBhbmQgc2hvdWxkIGdvIHRvIGEgc2Vw
YXJhdGUgcGF0Y2gsCj4gY2xlYXJseSBmbGFnZ2luZyB0aGF0IGluICRzdWJqZWN0Lgo+Cj4gKG5l
dyBwb2xpY3kgYnkgYWlybGllZCBmb3IgdGhlIGRybSB0cmVlKS4KClRoZSBuZXcgcG9saWN5IHJl
cXVpcmVzIGEgbm9uLXRveSB1c2Vyc3BhY2VbMV0sIHdoaWNoIG1heSB0YWtlIGEKd2hpbGUuICBS
ZW1vdmVkIHRoZSBVQVBJIGNoYW5nZXMgaW4gdGhlIGxhdGVzdCBwYXRjaCBzZXJpZXMuCgpbMV0g
aHR0cHM6Ly8wMS5vcmcvbGludXhncmFwaGljcy9nZngtZG9jcy9kcm0vZ3B1L2RybS11YXBpLmh0
bWwjb3Blbi1zb3VyY2UtdXNlcnNwYWNlLXJlcXVpcmVtZW50cwoKPgo+IE90aGVyd2lzZSB0aGUg
c2VyaWVzIGxvb2tzIGdvb2QgdG8gbWUuCj4KPiBjaGVlcnMsCj4gICBHZXJkCj4KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
