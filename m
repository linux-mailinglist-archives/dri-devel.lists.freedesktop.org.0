Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50D82315540
	for <lists+dri-devel@lfdr.de>; Tue,  9 Feb 2021 18:39:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08AD2897EF;
	Tue,  9 Feb 2021 17:39:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 629D7897EF
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Feb 2021 17:39:47 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id d24so10392673lfs.8
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Feb 2021 09:39:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=RkQ9vh4yHUNqVTEH9lJ/reKjXo3DF861DsD0QmnSzao=;
 b=N7llKSi9PpveMhdKx9xFWCvBHfHBAEZF2BNttLhfhzwUAdD4W9ReMGo73szZaANrKl
 VcnbJBIFTnpQJgDor/Od67/25QCDuIiZxkwbDVkQowxGCk65fCPdLuhz1RQfNgFYUHiq
 olCZzFff5vrRI5lmdsAgq7azbkEU5MjZ9MRmqu6uGbX4bF2leAoJf0YkRFQmq+H1JbCu
 PSZwQADyTLn6WNsuifyYk256YVp1/VtEkqN7/LHzaYayGGCSMElb6bwh2aDwIzWaRwCG
 NVO5zzMJzunaFugHouKNsVDFDmlAD4Q/BDXv8xdRFndRX6nX698viwIk2ZfuK0qWgrp0
 IpFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=RkQ9vh4yHUNqVTEH9lJ/reKjXo3DF861DsD0QmnSzao=;
 b=R61Qm8atiT0mgkR6bkdQCijM7yRtYVKduSacDo/fBSTBOu7nLqRU71EoviY8TRskVv
 mx/L2Lqt5TPGHXurtBf1hegrXm1acmUAU5jDw7ca15yx425ToSlYmu1b93CSg9rNTcli
 YxrLUOfKNzwnNy5Cur4BUzqDNxOxc5lcQN2YUkxAlUcrmguF6cmOq7v3aHOsbP39IhUo
 M1eHN73oytAYdTdTd3PWHvECVqOc28eHs1X0ANlbBoBUGW4OefCw36Wf+YkR6s2RPV8X
 g54d2p/MHafTOIwqRvrnT5ug77D8VnXbH4EaVf51MeuZYTYzNwt8z68dT2etPyLpHFIr
 ZA1g==
X-Gm-Message-State: AOAM533m2v9RttMby5opqFdLK5ZPahTQzBQb4qWhl75wLPmiykL3Gcg4
 IkSW8EtlRna2YJwExPsIlC6JrF5EkLZmpQqtKYfSFg==
X-Google-Smtp-Source: ABdhPJzrDXc4vT0Fk7D8staW62ex8KneZgtMn7QMusPWBtWdKsMcFJ9BaCm5zAqfshm6yQqG8tawHz9xEn9pKWy5XT4=
X-Received: by 2002:a05:6512:11f2:: with SMTP id
 p18mr4450601lfs.535.1612892385826; 
 Tue, 09 Feb 2021 09:39:45 -0800 (PST)
MIME-Version: 1.0
References: <20210205080621.3102035-1-john.stultz@linaro.org>
 <20210205080621.3102035-4-john.stultz@linaro.org>
 <8a4cacb7-3042-53c7-02fe-de18cc49fc0e@amd.com>
 <CALAqxLX7KT8Zqv+qjpbiDzSLubvDgXz6Ayk_U_q5e0veweHcFw@mail.gmail.com>
 <884a5f8f-00e2-5aa6-6dfb-67e86c89e599@amd.com>
In-Reply-To: <884a5f8f-00e2-5aa6-6dfb-67e86c89e599@amd.com>
From: John Stultz <john.stultz@linaro.org>
Date: Tue, 9 Feb 2021 09:39:33 -0800
Message-ID: <CALAqxLVtn664Xd-F2Te1Lqvte5WYBJ+Pdu336kga9xqntQPumw@mail.gmail.com>
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

T24gVHVlLCBGZWIgOSwgMjAyMSBhdCA0OjE0IEFNIENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlh
bi5rb2VuaWdAYW1kLmNvbT4gd3JvdGU6Cj4gQW0gMDUuMDIuMjEgdW0gMjA6NDcgc2NocmllYiBK
b2huIFN0dWx0ejoKPiA+IE9uIEZyaSwgRmViIDUsIDIwMjEgYXQgMTI6MjggQU0gQ2hyaXN0aWFu
IEvDtm5pZwo+ID4gPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4gd3JvdGU6Cj4gPj4gQWRkaW5n
IHRoaXMgdG8gYWxsIHBhZ2VzIHdvdWxkIGluY3JlYXNlIHRoZSBtZW1vcnkgZm9vdHByaW50IGRy
YXN0aWNhbGx5Lgo+ID4gWWVhLCB0aGF0J3MgYSBnb29kIHBvaW50ISAgSHJtLi4uIGJ1bW1lci4g
SSdsbCBoYXZlIHRvIHNlZSBpZiB0aGVyZSdzCj4gPiBzb21lIG90aGVyIHdheSBJIGNhbiBnZXQg
dGhlIG5lZWRlZCBjb250ZXh0IGZvciB0aGUgZnJlZSBmcm9tIHRoZQo+ID4gZ2VuZXJpYyBwYWdl
LXBvb2wgc2lkZS4KPgo+IFdoYXQgZXhhY3RseSBpcyB0aGUgcHJvYmxlbSBoZXJlPwoKTWUsIHVz
dWFsbHkuIDopCgo+IEFzIGZhciBhcyBJIGNhbiBzZWUgd2UganVzdCBoYXZlIHRoZQo+IGxydSBl
bnRyeSAobGlzdF9oZWFkKSBhbmQgdGhlIHBvb2wuCgpZZWEsIEkgcmV3b3JrZWQgaXQgdG8gYW4g
ZW1iZWRkZWQgZHJtX3BhZ2VfcG9vbCBzdHJ1Y3QsIGJ1dCB0aGF0IGlzCm1vc3RseSBhIGxpc3Rf
aGVhZC4KCj4gSG93IHRoZSBscnUgaXMgY2FzdCB0byB0aGUgcGFnZSBjYW4gYmUgY29tcGxldGVs
eSBwb29sIGltcGxlbWVudGF0aW9uCj4gc3BlY2lmaWMuCgpZZWEsIEkgaGFkIGl0IGRvIGNvbnRh
aW5lcl9vZigpLCBqdXN0IGhhdmVuJ3QgZ290dGVuIGFyb3VuZCB0byBzZW5kaW5nCml0IG91dCB5
ZXQuCgpUaGFua3Mgc28gbXVjaCBmb3IgdGhlIGZlZWRiYWNrIGFuZCBpZGVhcyEKCnRoYW5rcwot
am9obgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
