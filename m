Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C017DF1063
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2019 08:33:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02E906EC22;
	Wed,  6 Nov 2019 07:33:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D9D66EAD5
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2019 19:45:42 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id l20so4600394lje.4
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Nov 2019 11:45:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Y3BcbOs57gWFh/ah69CL0h9sxEBGQhpKXaYCWrN6SpY=;
 b=BtCOM2/U3rmtky7tI3c/R8QWh2Q1cRvYLafrl4B/plSvdjW9e6YkP1ootjpGXfEipV
 hT0xsCp6Lz5mi5+og2FFej0v4otvdbPUUbql4i9oLyVctJN+MkdvPSQ9NKn4kPwuiPnG
 ZKqp8WlKvMdCSGJzEKpmXlXIXaiRXO1Pi91fEAzoNxMFLkqfjv7bNpBPGLXBjO1vEAxJ
 /ZWucKaoHDgPUzeJ0uQxH7bPSK+rDJw54dPLs6XDKkbvIqrk+d+0Azu1zo/Ku20qRTvN
 /tCsA8Inzah6N9qWLkxZObd6JIQcHMV6EAb5nKg2p2O9qNI0RQLSoDPkOQgfS0HwiUoa
 6mmQ==
X-Gm-Message-State: APjAAAVjQOZD1QgX/7xwFxroOgIosxA/WqbL2pflGm8DfYpsfAK3aTqt
 2Djb7S+hhEzxY/m62d9I3uqqjmveRpc7+m6vsFhI
X-Google-Smtp-Source: APXvYqyssOuoWi0UcqcvDqo/zAc5x8LQM6rfaCcvUKFhj8iPBEc3x2wR1G8kWEl+x2h61qoIiDUVfKenZ6lfArbNtYo=
X-Received: by 2002:a2e:95c5:: with SMTP id y5mr15130636ljh.184.1572983139446; 
 Tue, 05 Nov 2019 11:45:39 -0800 (PST)
MIME-Version: 1.0
References: <CAKT=dDk0sNAXxz-angd5WvQXXLF8p3sPLEzOt=wVSLhuaP8dkQ@mail.gmail.com>
 <20191028152602.GA5057@redhat.com>
 <CAKT=dDnXwa76_aOVhTaKyE2=2HT2qGHvP9HGqnMzArr-Jt3A+Q@mail.gmail.com>
 <CAKT=dDnhth-6giOWgym7qpLNeH=86=XhQmPcgHM2J8B_L3myRQ@mail.gmail.com>
 <CAOWid-c_5+Z438kHpgn-h9KGt12kzoSD43nRfg0-v10NUKa+tw@mail.gmail.com>
 <CAKT=dD=Jyqn25hrZycQu96pwqcEWepjJFy2yVMyAp2RL42b+Hw@mail.gmail.com>
 <CAOWid-cy3LWHP5JZK1y_GiO_D1ioH2e4LVN-H4MruPr=dU-u=A@mail.gmail.com>
 <20191101103657.2107c6e1@eldfell.localdomain>
 <CAKT=dDmLao+P-hHrc2fsQ-7yyViFm-QFKKOEZ4D2EFobvAJLhg@mail.gmail.com>
 <20191105094719.GY10326@phenom.ffwll.local>
In-Reply-To: <20191105094719.GY10326@phenom.ffwll.local>
From: Yiwei Zhang <zzyiwei@google.com>
Date: Tue, 5 Nov 2019 11:45:28 -0800
Message-ID: <CAKT=dDk1UQmhq6zYa0XCHwJU3utmtoymTa0DPHj195ETJvQfiw@mail.gmail.com>
Subject: Re: Proposal to report GPU private memory allocations with sysfs
 nodes [plain text version]
To: Daniel Vetter <daniel@ffwll.ch>
X-Mailman-Approved-At: Wed, 06 Nov 2019 07:33:32 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=Y3BcbOs57gWFh/ah69CL0h9sxEBGQhpKXaYCWrN6SpY=;
 b=gZNItFtH773JKZsIc7JlOrSX/fSnY9d5qkUgqV9Nhd5cLw6SHog1fQVXseCh7oYWL+
 4zW+saBXdebP32DoB2BWZCuvzPD8euO5hU+NNiOMe3xuN3enIeJjsbBaP9dOFNtU4D94
 JQXY0s6k3ZSNYtBKxa9v1JT9PxoT6G7/kpII2p2T/dTLLJP6SRnCf/Ks1oyhqMP64Gl3
 zsvSeSUjzO/yNRGYGgMqO//Pc/YR2Ke4wOR6EK7gw4lUTrSRRAmOkvyCbXUNg1h4/ItF
 CriuhB+7q7RKlkF/XgPG03arSIhsz3LWnSpLjWJ9nvyhIL3XNpI12k9Z2qqRAOXYOZ3p
 35gw==
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
Cc: Alistair Delva <adelva@google.com>, Rohan Garg <rohan.garg@collabora.com>,
 Prahlad Kilambi <prahladk@google.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Kenny Ho <y2kenny@gmail.com>,
 kraxel@redhat.com, Jerome Glisse <jglisse@redhat.com>,
 Sean Paul <seanpaul@chromium.org>, Chris Forbes <chrisforbes@google.com>,
 kernel-team@android.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGFuaWVsLAoKPiAtIFRoZSBsYWJlbHMgYXJlIGN1cnJlbnRseSBmcmVlLWZvcm0sIGJha2lu
ZyB0aGVtIGJhY2sgaW50byB5b3VyIHN0cnVjdHVyZQo+ICB3b3VsZCBtZWFuIHdlJ2QgbmVlZCB0
byBkbyBsb3RzIG9mIGhvdCBhZGQvcmVtb3ZlIG9mIHN5c2ZzIGRpcmVjdG9yeQo+ICB0cmVlcy4g
V2hpY2ggc291bmRzIGxpa2UgYSByZWFsIGJhZCBpZGVhIDotLwpHaXZlbiB0aGUgZnJlZSBmb3Jt
IG9mIHRoYXQgaW9jdGwsIHdoYXQncyB0aGUgcGxhbiBvZiB1c2luZyB0aGF0IGFuZAp0aGUgcmVw
b3J0aW5nIG9mIHRoZSBsYWJlbGVkIEJPcz8KRG8geW91IHRoaW5rIHVwc3RyZWFtIGtlcm5lbCBu
ZWVkIHRvIGhhdmUgY2VydGFpbiByZXNvdXJjZSBjYXRlZ29yeQpiYXNlZCB0cmFja2luZyBmb3Ig
Z3B1IHByaXZhdGUgYWxsb2NhdGlvbnM/Cgo+IC0gQnVmZmVyIG9iamVjdHMgYXJlbid0IGF0dGFj
aGVkIHRvIHBpZHMsIGJ1dCBmaWxlcy4gQW5kIGZpbGVzIGNhbiBiZQo+ICBzaGFyZWQuIElmIHdl
IHdhbnQgdG8gbGlzdCB0aGlzIHNvbWV3aGVyZSBvdXRzaWRlIG9mIGRlYnVnZnMsIHdlIG5lZWQg
dG8KPiAgdGllIHRoaXMgaW50byB0aGUgZmlsZXMgc29tZWhvdyAoc28gcHJvYyksIGV4Y2VwdCB0
aGUgdW5kZXJseWluZyBmaWxlcwo+ICBhcmUgYWxsIGFub24gaW5vZGVzLCBzbyB0aGlzIGdldHMg
cmVhbGx5IHRyaWNreSBJIHRoaW5rIHRvIG1ha2Ugd29yawo+ICB3ZWxsLgpTbyB0aGVyZSBpc24n
dCBhbnkgZ3B1IHByaXZhdGUgYWxsb2NhdGlvbnMgb24gdGhlIHVwc3RyZWFtIHNpZGU/CkhvdyBk
b2VzIHVwc3RyZWFtIGRlYWwgd2l0aCBkdXBsaWNhdGUgYWNjb3VudGluZyBmb3IgdGhlIHNoYXJl
ZCBtZW1vcnk/CgpCZXN0LApZaXdlaQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
