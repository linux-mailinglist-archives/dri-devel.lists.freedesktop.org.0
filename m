Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 12324308D36
	for <lists+dri-devel@lfdr.de>; Fri, 29 Jan 2021 20:25:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 383A26EC07;
	Fri, 29 Jan 2021 19:25:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EEC36EC07;
 Fri, 29 Jan 2021 19:25:05 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id g1so11847283edu.4;
 Fri, 29 Jan 2021 11:25:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=FNtQSP3BBPUQCBrUTqJZEuxufxe5lI/Obe9P4vBv6bo=;
 b=YvYQr6vriZ43XrQrmJnuZyJmwsyucWuoC2oXESohRHHTtpszHMeLPkESwmLSUteH3A
 ZvwmJEWvPS2sYaMoHO5EzyQxLiz7FpETVWONk5m8UfFtn0xDV7wWVava4gCaCIDCJLzG
 HxMz7x8raipTHEtZPVUNz52RKveLREULQqTU+nRHMYpSJiNOpGsDClELGLb1nlKHK6t3
 Ffb88GEe6Bywynk49rP8VHDnEZnY0zHtc1fr1lzwdkPStEOXbR/d+HKmODPmvRwWqVg2
 3ahfAxFfrQaJ+JcSQPvqoxxOwcC1wqYjrL1y52yWQQWZZbY66uDtqXUUZFgKud+8Ky1e
 Xr2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=FNtQSP3BBPUQCBrUTqJZEuxufxe5lI/Obe9P4vBv6bo=;
 b=hvNsfmuGJz/WINCmW1AfHkqtKVdIKau8iJJAPMB4v9bmJCMberySAVJoU8PU1gVjoR
 ttmvkCgUnLHukKsx6JkS7HMlyg0wcyqUJfxlpEPwhjJflWWg3NR9LZY5LOTDlOOFMscv
 ow7JSmTYbAOh97+yeoVH3zDb1A4LHxyC9Bc/VAwsKRpE94QMVu0f2jkDxAtZHCMOzF8G
 VDoc/mZjvGWBB6w0hj6PAQSIimGu40UmcvwbDgY6/pzqUnMde9IAc7v2dmjRzsXTxgid
 Swtp7Ipmh83ogUthDtLX+9A05kfbTzItWi2XY1FQnmfT3M0HhBLO4lebaQPCTpKOa1DH
 9BDg==
X-Gm-Message-State: AOAM533ybxXggyQ+tY1h+AOezwJZhLobMe5EV+UJ6NV+yuWrdSgDAq0S
 hcLBTo1vVo9PYy+j8epNrX4=
X-Google-Smtp-Source: ABdhPJyHom4GiN7jO9UlXRNW7jdFe8Xo1vYXuwXR6mSvOo10HafrndO5qeQoLvJkgRjqqpgnvR/gYQ==
X-Received: by 2002:a05:6402:1655:: with SMTP id
 s21mr6779636edx.360.1611948304202; 
 Fri, 29 Jan 2021 11:25:04 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id br6sm4243922ejb.46.2021.01.29.11.25.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Jan 2021 11:25:03 -0800 (PST)
Subject: Re: [PATCH v4 11/14] drm/amdgpu: Guard against write accesses after
 device removal
To: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
References: <1611003683-3534-1-git-send-email-andrey.grodzovsky@amd.com>
 <1611003683-3534-12-git-send-email-andrey.grodzovsky@amd.com>
 <35ecd67f-620f-df50-3e03-d24dc12452d6@gmail.com>
 <8925db97-bf81-7e5e-527d-f654713b400d@amd.com>
 <CAKMK7uHCzBpaC2YypKeQwbJiT0JG2Hq7V0BC5yC88f9nqgxUiw@mail.gmail.com>
 <8ed4a153-d503-e704-0a0d-3422877e50fa@amd.com>
 <91b8ea73-aa69-1478-2e7c-63ab1cb250ae@gmail.com>
 <7834dbdf-27ad-f21d-b58b-2772a598ea8a@amd.com>
 <07dceec0-0be9-1531-0357-353f04d1cb2b@amd.com>
 <69f036e2-f102-8233-37f6-5254a484bf97@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <0b502043-5a66-dcd5-53f9-5c190f22dc46@gmail.com>
Date: Fri, 29 Jan 2021 20:25:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <69f036e2-f102-8233-37f6-5254a484bf97@amd.com>
Content-Language: en-US
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
Reply-To: christian.koenig@amd.com
Cc: Greg KH <gregkh@linuxfoundation.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Alex Deucher <Alexander.Deucher@amd.com>, Qiang Yu <yuq825@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjkuMDEuMjEgdW0gMTg6MzUgc2NocmllYiBBbmRyZXkgR3JvZHpvdnNreToKPgo+IE9uIDEv
MjkvMjEgMTA6MTYgQU0sIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4+IEFtIDI4LjAxLjIxIHVt
IDE4OjIzIHNjaHJpZWIgQW5kcmV5IEdyb2R6b3Zza3k6Cj4+Pgo+Pj4gT24gMS8xOS8yMSAxOjU5
IFBNLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+Pj4+IEFtIDE5LjAxLjIxIHVtIDE5OjIyIHNj
aHJpZWIgQW5kcmV5IEdyb2R6b3Zza3k6Cj4+Pj4+Cj4+Pj4+IE9uIDEvMTkvMjEgMTowNSBQTSwg
RGFuaWVsIFZldHRlciB3cm90ZToKPj4+Pj4+IFtTTklQXQo+Pj4+PiBTbyBzYXkgd3JpdGluZyBp
biBhIGxvb3AgdG8gc29tZSBoYXJtbGVzcyBzY3JhdGNoIHJlZ2lzdGVyIGZvciAKPj4+Pj4gbWFu
eSB0aW1lcyBib3RoIGZvciBwbHVnZ2VkCj4+Pj4+IGFuZCB1bnBsdWdnZWQgY2FzZSBhbmQgbWVh
c3VyZSB0b3RhbCB0aW1lIGRlbHRhID8KPj4+Pgo+Pj4+IEkgdGhpbmsgd2Ugc2hvdWxkIGF0IGxl
YXN0IG1lYXN1cmUgdGhlIGZvbGxvd2luZzoKPj4+Pgo+Pj4+IDEuIFdyaXRpbmcgWCB0aW1lcyB0
byBhIHNjcmF0Y2ggcmVnIHdpdGhvdXQgeW91ciBwYXRjaC4KPj4+PiAyLiBXcml0aW5nIFggdGlt
ZXMgdG8gYSBzY3JhdGNoIHJlZyB3aXRoIHlvdXIgcGF0Y2guCj4+Pj4gMy4gV3JpdGluZyBYIHRp
bWVzIHRvIGEgc2NyYXRjaCByZWcgd2l0aCB0aGUgaGFyZHdhcmUgcGh5c2ljYWxseSAKPj4+PiBk
aXNjb25uZWN0ZWQuCj4+Pj4KPj4+PiBJIHN1Z2dlc3QgdG8gcmVwZWF0IHRoYXQgb25jZSBmb3Ig
UG9sYXJpcyAob3Igb2xkZXIpIGFuZCBvbmNlIGZvciAKPj4+PiBWZWdhIG9yIE5hdmkuCj4+Pj4K
Pj4+PiBUaGUgU1JCTSBvbiBQb2xhcmlzIGlzIG1lYW50IHRvIGludHJvZHVjZSBzb21lIGRlbGF5
IGluIGVhY2ggCj4+Pj4gYWNjZXNzLCBzbyBpdCBtaWdodCByZWFjdCBkaWZmZXJlbnRseSB0aGVu
IHRoZSBuZXdlciBoYXJkd2FyZS4KPj4+Pgo+Pj4+IENocmlzdGlhbi4KPj4+Cj4+Pgo+Pj4gU2Vl
IGF0dGFjaGVkIHJlc3VsdHMgYW5kIHRoZSB0ZXN0aW5nIGNvZGUuIFJhbiBvbiBQb2xhcmlzIChn
Zng4KSBhbmQgCj4+PiBWZWdhMTAoZ2Z4OSkKPj4+Cj4+PiBJbiBzdW1tYXJ5LCBvdmVyIDEgbWls
bGlvbiBXV1JFRzMyIGluIGxvb3Agd2l0aCBhbmQgd2l0aG91dCB0aGlzIAo+Pj4gcGF0Y2ggeW91
IGdldCBhcm91bmQgMTBtcyBvZiBhY2N1bXVsYXRlZCBvdmVyaGVhZCAoIHNvIDAuMDAwMDEgCj4+
PiBtaWxsaXNlY29uZCBwZW5hbHR5IGZvciBlYWNoIFdXUkVHMzIpIGZvciB1c2luZyBkcm1fZGV2
X2VudGVyIGNoZWNrIAo+Pj4gd2hlbiB3cml0aW5nIHJlZ2lzdGVycy4KPj4+Cj4+PiBQLlMgQnVs
bGV0IDMgSSBjYW5ub3QgdGVzdCBhcyBJIG5lZWQgZUdQVSBhbmQgY3VycmVudGx5IEkgZG9uJ3Qg
aGF2ZSAKPj4+IG9uZS4KPj4KPj4gV2VsbCBpZiBJJ20gbm90IGNvbXBsZXRlbHkgbWlzdGFrZW4g
dGhhdCBhcmUgMTAwbXMgb2YgYWNjdW11bGF0ZWQgCj4+IG92ZXJoZWFkLiBTbyBhcm91bmQgMTAw
bnMgcGVyIHdyaXRlLiBBbmQgZXZlbiBiaWdnZXIgcHJvYmxlbSBpcyB0aGF0IAo+PiB0aGlzIGlz
IGEgfjY3JSBpbmNyZWFzZS4KPgo+Cj4gTXkgYmFkLCBhbmQgNjclIGZyb20gd2hhdCA/IEhvdyB1
IGNhbGN1bGF0ZSA/CgpNeSBiYWQsICgzMDg1MDEtMjA5Njg5KS8yMDk2ODk9NDclIGluY3JlYXNl
LgoKPj4KPj4gSSdtIG5vdCBzdXJlIGhvdyBtYW55IHdyaXRlIHdlIGRvIGR1cmluZyBub3JtYWwg
b3BlcmF0aW9uLCBidXQgdGhhdCAKPj4gc291bmRzIGxpa2UgYSBiaXQgbXVjaC4gSWRlYXM/Cj4K
PiBXZWxsLCB1IHN1Z2dlc3RlZCB0byBtb3ZlIHRoZSBkcm1fZGV2X2VudGVyIHdheSB1cCBidXQg
YXMgaSBzZWUgaXQgdGhlIAo+IHByb2JsZW0gd2l0aCB0aGlzIGlzIHRoYXQgaXQgaW5jcmVhc2Ug
dGhlIGNoYW5jZSBvZiByYWNlIHdoZXJlIHRoZQo+IGRldmljZSBpcyBleHRyYWN0ZWQgYWZ0ZXIg
d2UgY2hlY2sgZm9yIGRybV9kZXZfZW50ZXIgKHRoZXJlIGlzIGFsc28gCj4gc3VjaCBjaGFuY2Ug
ZXZlbiB3aGVuIGl0J3MgcGxhY2VkIGluc2lkZSBXV1JFRyBidXQgaXQncyBsb3dlcikuCj4gRWFy
bGllciBJIHByb3BzZWQgdGhhdCBpbnN0ZWFkIG9mIGRvaW5nIGFsbCB0aG9zZSBndWFyZHMgc2Nh
dHRlcmVkIGFsbCAKPiBvdmVyIHRoZSBjb2RlIHNpbXBseSBkZWxheSByZWxlYXNlIG9mIHN5c3Rl
bSBtZW1vcnkgcGFnZXMgYW5kIAo+IHVucmVzZXJ2ZSBvZgo+IE1NSU8gcmFuZ2VzIHRvIHVudGls
IGFmdGVyIHRoZSBkZXZpY2UgaXRzZWxmIGlzIGdvbmUgYWZ0ZXIgbGFzdCBkcm0gCj4gZGV2aWNl
IHJlZmVyZW5jZSBpcyBkcm9wcGVkLiBCdXQgRGFuaWVsIG9wcG9zZXMgZGVsYXlpbmcgTU1JTyBy
YW5nZXMgCj4gdW5yZXNlcnZlIHRvIGFmdGVyCj4gUENJIHJlbW92ZSBjb2RlIGJlY2F1c2UgYWNj
b3JkaW5nIHRvIGhpbSBpdCB3aWxsIHVwc2V0IHRoZSBQQ0kgc3Vic3l0ZW0uCgpZZWFoLCB0aGF0
J3MgbW9zdCBsaWtlbHkgdHJ1ZSBhcyB3ZWxsLgoKTWF5YmUgRGFuaWVsIGhhcyBhbm90aGVyIGlk
ZWEgd2hlbiBoZSdzIGJhY2sgZnJvbSB2YWNhdGlvbi4KCkNocmlzdGlhbi4KCj4KPiBBbmRyZXkK
Pgo+Pgo+PiBDaHJpc3RpYW4uCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KPiBhbWQtZ2Z4IG1haWxpbmcgbGlzdAo+IGFtZC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9hbWQtZ2Z4CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
