Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09515347B3C
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 15:58:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96A0B6EA23;
	Wed, 24 Mar 2021 14:58:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B41526EA1C
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 14:58:29 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id u20so30545975lja.13
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 07:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=PLtdqjyb6ZpFLIDzj9Gxiz79SYwzEifApQNTVEfut1U=;
 b=A3EPC3UQ8kD+Rd3alctOKpLMlz4xxaxxrnxbDYlbKDZ8X+oYDBwGzDBJJT5NcJFn5z
 Okdhg9HaLhWsZR/JRw1FzIss7RlY3Tha0v3+gxSo+Yp3POvySTGsEJxAcVfIx0ngHclO
 qNezcOLDQM1V7OjKABpI7pMl1OATgOTUjDx0Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=PLtdqjyb6ZpFLIDzj9Gxiz79SYwzEifApQNTVEfut1U=;
 b=cUJDH8AAyXbmzRgk3qovIUIcB9nw7IADtAQhfP15qxyMOmNsuGmP+f6sgl3YA8DL0K
 xlFjrc3mt/keN8u321NrAOsUiNJBFKvtD0H/vM7BC1rxt4xejF6tGkRdtsWhZFynO75p
 ScfazgxvtfS3FTC+CPacGDjEOmtufuBnG8jeXTb8O60qBW9Aw6CWW3YXCO57AoDFuBQe
 AoyVxTG8iVXNlgwf74IGGGO4WzKgBRN94Job0whIsf7iREAzcNFRdsw+TfEPPo8Xwzj6
 D99vtKv4T0jnrBu0FiroE8ysbvdvYjxPaXOKvQ5srd0nSJ+uHC/watuG2MmAsTOhMA70
 Fc9w==
X-Gm-Message-State: AOAM530PE6xUezdPYsL7C5oNnpFyEAsR0ndJkB90jfjvOr1DIQeU9T98
 amszfAXsaVEvU0lDK6/WSr4fO0dE2Z8hQVOX6NgoWQ==
X-Google-Smtp-Source: ABdhPJzOSWH3/u+MPhUU07Njrv73s8fqFdHTjDExCoqX7Y6oA+pTxQz90sS6GqREY59FPaVymifkHkn8/sj5qqBxcJk=
X-Received: by 2002:a2e:7403:: with SMTP id p3mr2331523ljc.239.1616597907996; 
 Wed, 24 Mar 2021 07:58:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210310161444.1015500-1-markyacoub@chromium.org>
 <CADnq5_P9aYcedOP2qduSz7VN1fCSnmQEtPa+FdjYu9Co7TwPog@mail.gmail.com>
 <CAC0gqY7Y2WxtAZ3GnWmASPYq7ahYTfmPhOHAAX5UjMNS9k098w@mail.gmail.com>
 <b4070483-5aa5-c712-6435-dcb4a206ca76@daenzer.net>
 <CAP+8YyExtmmZbFfAO_YR=XWHE+HbH6m7JqyJV4LB_hbGwsihBA@mail.gmail.com>
 <CAPj87rP+WkUPbS3yyGGfy0SRm_hsnCCUav99Dg2Q+tXCiJ5D+A@mail.gmail.com>
In-Reply-To: <CAPj87rP+WkUPbS3yyGGfy0SRm_hsnCCUav99Dg2Q+tXCiJ5D+A@mail.gmail.com>
From: Mark Yacoub <markyacoub@chromium.org>
Date: Wed, 24 Mar 2021 10:58:17 -0400
Message-ID: <CAJUqKUqQ0yrxpr+QVRXYXMk1hBRNByD0TP6mM0oLY54jDZimbw@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Ensure that the modifier requested is
 supported by plane.
To: Daniel Stone <daniel@fooishbar.org>
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
Cc: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>, Mark Yacoub <markyacoub@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBNYXIgMjQsIDIwMjEgYXQgODoxMCBBTSBEYW5pZWwgU3RvbmUgPGRhbmllbEBmb29p
c2hiYXIub3JnPiB3cm90ZToKPgo+IE9uIFdlZCwgMjQgTWFyIDIwMjEgYXQgMTA6NTMsIEJhcyBO
aWV1d2VuaHVpemVuIDxiYXNAYmFzbmlldXdlbmh1aXplbi5ubD4gd3JvdGU6Cj4+Cj4+IE9uIFdl
ZCwgTWFyIDI0LCAyMDIxIGF0IDExOjEzIEFNIE1pY2hlbCBEw6RuemVyIDxtaWNoZWxAZGFlbnpl
ci5uZXQ+IHdyb3RlOgo+Pj4KPj4+IE5vIG1vZGlmaWVyIHN1cHBvcnQgZG9lcyBub3QgaW1wbHkg
bGluZWFyLiBJdCdzIGdlbmVyYWxseSBzaWduYWxsZWQgdmlhIERSTV9GT1JNQVRfTU9EX0lOVkFM
SUQsIHdoaWNoIHJvdWdobHkgbWVhbnMgInRpbGluZyBpcyBkZXRlcm1pbmVkIGJ5IGRyaXZlciBz
cGVjaWZpYyBtZWNoYW5pc21zIi4KU28geW91IG1lYW4gaXQgd291bGQgbWFrZSBtb3JlIHNlbnNl
IHRvIGJlIG1vcmUgZXhwbGljaXQgaW4gaGFuZGxpbmcKRFJNX0ZPUk1BVF9NT0RfSU5WQUxJRCBh
cyBhbiBpbmNvbWluZyBtb2RpZmllciAod2hpY2ggd2lsbCwganVzdCBsaWtlCkRSTV9GT1JNQVRf
TU9EX0xJTkVBUiwgd2lsbCByZXR1cm4gdHJ1ZSBpbgpkbV9wbGFuZV9mb3JtYXRfbW9kX3N1cHBv
cnRlZCk/Cj4+Cj4+Cj4+IERvZXNuJ3QgcXVpdGUgd29yayB0aGF0IHdheSBpbiB0aGUga2VybmVs
IHNhZGx5LiBJZiB5b3UgZG9uJ3Qgc2V0IERSTV9NT0RFX0ZCX01PRElGSUVSUyB0aGVuIHRoZSBt
b2RpZmllciBmaWVsZHMgaGF2ZSB0byBiZSAwICh3aGljaCBoYXBwZW5zIHRvIGFsaWFzIERSTV9G
T1JNQVRfTU9EX0xJTkVBUiBhbmQgdGhlbiBub3cgZGVwcmVjYXRlZCBEUk1fRk9STUFUX01PRF9O
T05FKS4gVGhpcyBpcyB2ZXJpZmllZCBpbiBzaGFyZWQgZHJtIGNvZGUuCj4+Cj4+IChhbmQgYWxs
IHVzZXJzcGFjZSBjb2RlIEkndmUgc2VlbiBzaW1wbHkgZG9lc24ndCBzZXQgRFJNX01PREVfRkJf
TU9ESUZJRVJTIGlmIHRoZSBpbmNvbWluZyBtb2RpZmllciBpcyBEUk1fRk9STUFUX01PRF9JTlZB
TElEKQo+Cj4KPiBZZXMsIGJ1dCBldmVuIHRob3VnaCB0aGUgZmllbGQgaXMgemVybywgdGhlIGxh
Y2sgb2YgdGhlIGZsYWcgbWVhbnMgaXQgbXVzdCBiZSB0cmVhdGVkIGFzIElOVkFMSUQuIElmIHRo
ZSBrZXJuZWwgaXMgbm90IGRvaW5nIHRoaXMsIHRoZSBrZXJuZWwgaXMgb2JqZWN0aXZlbHkgd3Jv
bmcuIChBbmQgSSBrbm93IGl0IGRvZXNuJ3QgZG8gdGhpcyBpbiBtb3N0IGNhc2VzLCBiZWNhdXNl
IG90aGVyd2lzZSBJIHdvdWxkbid0IGJlIGFibGUgdG8gdXNlIHRoaXMgR05PTUUgc2Vzc2lvbiBv
biBhbiBJbnRlbCBsYXB0b3AsIHdoZXJlIG1vZGlmaWVycyBhcmUgYmxhY2tsaXN0ZWQuKQo+Cj4g
Q2hlZXJzLAo+IERhbmllbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWwK
