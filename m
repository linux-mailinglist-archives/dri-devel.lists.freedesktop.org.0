Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDBC098D8B
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2019 10:23:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA5BF6E49A;
	Thu, 22 Aug 2019 08:23:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 776666E49A
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2019 08:23:32 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id z1so4502831wru.13
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2019 01:23:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=mHJwv/dmEXrbQ0yLWkXi+BJ6R6ibM6vVujAbVHAGxf8=;
 b=YGHWkQP1RtLVM1sAs0ZLh2BUUncNqKhJFOYDP3KHPiNXUHX4XLpnbORL9238vFmdn8
 ui4VkmJMs0Ht99MSdMlOGmd9Bdz/2ugvJvPjv18ix3W1+7pPxf8dAS0jGNvR/3yD4bVe
 qx0UgdaHOsEJQLXh7hrQinUH678gY4BFND7VU2m1StE9vJJdMFcDrmGA5CKkfuL8ZUlZ
 ZYKwfB0gJd8OT6zXNPvqLEfEzdUddnWCodAD3zL+e4DlMhx3cNRbhMxiyJIcv0yTSS7c
 09dEeZCzRhQilNJZyNEarkcWgmbEGwQDrc02u1E95jw9kY2gHETdzIQ6KGDk/23qMnei
 qjaA==
X-Gm-Message-State: APjAAAWYYbUNWibNLEeGjdnCiwWVT7AQ0N4w/5P3Je55/6ueqxfXJdVf
 BWnslktecDNUwp9h2ThZECM=
X-Google-Smtp-Source: APXvYqxtA5/FlOVudUnT39p+G3xdnBUDJ3HdAqwO8tUek7poJGRDB0yTGr3f57tMjA0UXKHO+6FOUQ==
X-Received: by 2002:a05:6000:4d:: with SMTP id
 k13mr45696163wrx.196.1566462211182; 
 Thu, 22 Aug 2019 01:23:31 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id s192sm2324408wme.17.2019.08.22.01.23.30
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 22 Aug 2019 01:23:30 -0700 (PDT)
Subject: Re: [PATCH 07/10] dma-buf/resv: add new fences container
 implementation
To: Daniel Vetter <daniel@ffwll.ch>
References: <20190821123147.110736-1-christian.koenig@amd.com>
 <20190821123147.110736-8-christian.koenig@amd.com>
 <20190821160454.GN11147@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <c1ff88ef-0e49-fd7a-6317-de432a04ddf2@gmail.com>
Date: Thu, 22 Aug 2019 10:23:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190821160454.GN11147@phenom.ffwll.local>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=mHJwv/dmEXrbQ0yLWkXi+BJ6R6ibM6vVujAbVHAGxf8=;
 b=oQmP8Nr0nPGEfRgu9DLXQMVLv7gXQdsBuM9zA2zLlZAmD0nkbID7M0rmA49HscEo4r
 jkIZkfiY0Ab6BTng3I8gW8DS/YtZe2GdcxQv8Rlod5YE169PIYiFLrjCZnPJ735npgEx
 NmvIT80AgAZjdAGgjv1lkvziK1XxAROXIsRx59hIMgzbNuYm919FLN+kZr/OURAdcQdA
 SJGQfFqOC6GwwJHjRLbjHGojdnm9Df2s4IoFBZMGKIJsLGQ4AW0EoiLTHwYAf04N4kbq
 2S7cl1/XDidDpnS72jkoiJUJ74vOMWaHMTQTGsw/Y4IfH9KoO6UV502OzYOUUOsDzRVw
 WQTA==
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
Reply-To: christian.koenig@amd.com
Cc: daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjEuMDguMTkgdW0gMTg6MDQgc2NocmllYiBEYW5pZWwgVmV0dGVyOgo+IE9uIFdlZCwgQXVn
IDIxLCAyMDE5IGF0IDAyOjMxOjQ0UE0gKzAyMDAsIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4+
IFtTTklQXQo+PiArCS8qIFRyeSB0byBkcm9wIHRoZSBsYXN0IHJlZmVyZW5jZSAqLwo+PiArCWlm
ICghZG1hX2ZlbmNlX2FycmF5X3JlY3ljbGUoc3RhZ2VkKSkKPiBXaXRob3V0IGFuIHJjdSBiYXJy
aWVyIGhlcmUgeW91J3JlIG5vdCBzeW5jaW5nIHRvIG5ldyBjbGllbnRzIGF0IGFsbC4KPiBJIGRv
bid0IHRoaW5rIHRoaXMgd29ya3MsIGFuZCBJIGV4cGVjdCB0aGF0IG9uY2UgeW91J3ZlIHJlYWRk
ZWQgYWxsIHRoZQo+IGJhcnJpZXJzIGFuZCByZXRyeSBsb29wcyB3ZSdyZSBiYWNrIHRvIHNlcWxv
Y2tzLgoKVGhlIGtleSBkaWZmZXJlbmNlIGlzIHRoYXQgUkNVIHVzZXJzIG5vdyB1c2UgZG1hX2Zl
bmNlX2dldF9yY3Vfc2FmZSgpIHRvIApncmFiIGEgcmVmZXJlbmNlIHRvIHRoZSBjdXJyZW50IHNl
dCBvZiBmZW5jZXMuCgpJbiBvdGhlciB3b3JkcyB0aGUgd2hvbGUgYXJyYXkgaXMgcmVmZXJlbmNl
IGNvdW50ZWQgYW5kIFJDVSBwcm90ZWN0ZWQgCmluc3RlYWQgb2YgZWFjaCBpbmRpdmlkdWFsIGVu
dHJ5IGluIHRoZSBhcnJheS4KClRoaXMgd2F5IHlvdSBkb24ndCBuZWVkIHRoZSBzZXF1ZW5jZSBj
b3VudCBhbnkgbW9yZSBiZWNhdXNlIHlvdSBncmFiIGEgCnJlZmVyZW5jZSB0byBhbGwgb2YgdGhl
bSBhdCBvbmNlIGFuZCB0aGVuIGNhbiBiZSBzdXJlIHRoYXQgdGhleSBkb24ndCAKY2hhbmdlLgoK
UmVnYXJkcywKQ2hyaXN0aWFuLgoKPiAtRGFuaWVsCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
