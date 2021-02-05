Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D078311175
	for <lists+dri-devel@lfdr.de>; Fri,  5 Feb 2021 20:47:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61ECD6F4BD;
	Fri,  5 Feb 2021 19:47:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FA716F4BA
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Feb 2021 19:47:40 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id a8so11520539lfi.8
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Feb 2021 11:47:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=JpFQEtQj4C0OZQX0JhcEbS+mtM0J6361EvZ8pnT2TSE=;
 b=L/O8FpF6LlQ1+mtrZtK+VtKD+UUwgDHsysQWj+/uvhSwZGo1Eh2QdS4GfGMzmkCV/L
 dDZA9pKSv4B4myTCSTpIhhomB2+Z/K4c+q2WwpEg3Xwbj+ZBIPKawEHR0zlgnwaP1gAK
 Z1x5iSvolMkSNC0wpljVeFY3ptOa5llNld5RUARcT8gw66Aed7NI/BbM+AczKGjIEqTz
 r6wsUKUQaXnzMUvn6NGWqiMk7ykLYy/iHQGcyltHzQJo5Gl4qLat0QDAP/QPgZyuKIVv
 RczfcHPCgoEYDvo3BXUC64rPEIgnPcyVpl9/7EgSRfq4SEZq8zOSlOBbcbSWxpBn8YVC
 w/WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=JpFQEtQj4C0OZQX0JhcEbS+mtM0J6361EvZ8pnT2TSE=;
 b=rGUyU5W/HkC5Yj7krz/+M0/zBgGr5niRaVstenCkposaM06xjZXxyhwI/YPSca8Ur3
 xXKRRxRLXcAmFEsnMjzmoZL0RClIux2oWvperfwXHbv6JLHS1CVGYjKwiPViXoX6xkzF
 wcoMcKbV9riZlrnaN8BTNOOWrtXV/P8lxjLOfeHKQMvH9jr1fHHBB1R4OxJiOFLdU8o8
 huiPGuFGb3Vzin0RaUbjd7sQwzehrR16M4YnAdPiE/xGBGaw2h0tDTkgOBdiBU/MghrL
 04jbPPxZ9mtOZFLKriShzyu6pgsYW60+pLC7XpvMKooh2zTlxN2+bFD09kVYdfYUic1J
 PjSQ==
X-Gm-Message-State: AOAM532MfY0yqwzoYCTxkuRAjKDqoB2tcYKiIkdHyeYcfAvc2jZbZzLe
 FZh5Wop+sJ/eEj541usiAAzvjOL1eymmb3AkANhFPMyp0/U=
X-Google-Smtp-Source: ABdhPJxYzWAehEnsDpGaws8y+Zfq5m5I1qYWKUBMjcHBCecyBa1VQDARHSmA2ubfIx1mf62FNZS+cAX6p5NtKrw7Vgg=
X-Received: by 2002:ac2:5590:: with SMTP id v16mr3187334lfg.626.1612554458492; 
 Fri, 05 Feb 2021 11:47:38 -0800 (PST)
MIME-Version: 1.0
References: <20210205080621.3102035-1-john.stultz@linaro.org>
 <20210205080621.3102035-4-john.stultz@linaro.org>
 <8a4cacb7-3042-53c7-02fe-de18cc49fc0e@amd.com>
In-Reply-To: <8a4cacb7-3042-53c7-02fe-de18cc49fc0e@amd.com>
From: John Stultz <john.stultz@linaro.org>
Date: Fri, 5 Feb 2021 11:47:25 -0800
Message-ID: <CALAqxLX7KT8Zqv+qjpbiDzSLubvDgXz6Ayk_U_q5e0veweHcFw@mail.gmail.com>
Subject: Re: [RFC][PATCH v6 3/7] drm: ttm_pool: Rework ttm_pool_free_page to
 allow us to use it as a function pointer
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 Sandeep Patil <sspatil@google.com>, Ezequiel Garcia <ezequiel@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>, James Jones <jajones@nvidia.com>,
 lkml <linux-kernel@vger.kernel.org>, Liam Mark <lmark@codeaurora.org>,
 Laura Abbott <labbott@kernel.org>, Chris Goldsworthy <cgoldswo@codeaurora.org>,
 Hridya Valsaraju <hridya@google.com>,
 =?UTF-8?Q?=C3=98rjan_Eide?= <orjan.eide@arm.com>,
 linux-media <linux-media@vger.kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Daniel Mentz <danielmentz@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBGZWIgNSwgMjAyMSBhdCAxMjoyOCBBTSBDaHJpc3RpYW4gS8O2bmlnCjxjaHJpc3Rp
YW4ua29lbmlnQGFtZC5jb20+IHdyb3RlOgo+IEFtIDA1LjAyLjIxIHVtIDA5OjA2IHNjaHJpZWIg
Sm9obiBTdHVsdHo6Cj4gPiBUaGlzIHJlZmFjdG9ycyB0dG1fcG9vbF9mcmVlX3BhZ2UoKSwgYW5k
IGJ5IGFkZGluZyBleHRyYSBlbnRyaWVzCj4gPiB0byB0dG1fcG9vbF9wYWdlX2RhdCwgd2UgdGhl
biB1c2UgaXQgZm9yIGFsbCBhbGxvY2F0aW9ucywgd2hpY2gKPiA+IGFsbG93cyB1cyB0byBzaW1w
bGlmeSB0aGUgYXJndW1lbnRzIG5lZWRlZCB0byBiZSBwYXNzZWQgdG8KPiA+IHR0bV9wb29sX2Zy
ZWVfcGFnZSgpLgo+Cj4gVGhpcyBpcyBhIGNsZWFyIE5BSyBzaW5jZSB0aGUgcGVlciBwYWdlIGRh
dGEgaXMganVzdCBhIHdvcmthcm91bmQgZm9yCj4gdGhlIERNQS1BUEkgaGFjayB0byBncmFiIHBh
Z2VzIGZyb20gdGhlcmUuCj4KPiBBZGRpbmcgdGhpcyB0byBhbGwgcGFnZXMgd291bGQgaW5jcmVh
c2UgdGhlIG1lbW9yeSBmb290cHJpbnQgZHJhc3RpY2FsbHkuCgpZZWEsIHRoYXQncyBhIGdvb2Qg
cG9pbnQhICBIcm0uLi4gYnVtbWVyLiBJJ2xsIGhhdmUgdG8gc2VlIGlmIHRoZXJlJ3MKc29tZSBv
dGhlciB3YXkgSSBjYW4gZ2V0IHRoZSBuZWVkZWQgY29udGV4dCBmb3IgdGhlIGZyZWUgZnJvbSB0
aGUKZ2VuZXJpYyBwYWdlLXBvb2wgc2lkZS4KClRoYW5rcyBzbyBtdWNoIGZvciB0aGUgcmV2aWV3
IQotam9obgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
