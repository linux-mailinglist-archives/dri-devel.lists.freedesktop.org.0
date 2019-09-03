Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 620EDA7667
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2019 23:42:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FFF68989A;
	Tue,  3 Sep 2019 21:42:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1CF789700;
 Tue,  3 Sep 2019 21:42:29 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id y23so6471012lje.9;
 Tue, 03 Sep 2019 14:42:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=BE22rdpGi0wj7EdpVjb4I26895Qlqc0EPZOEPPFnqZo=;
 b=tcbed1o5DcBWWBsGpFF0lk5bgfY53gY+IQaFVGOsxSameMP8r4ABqsnkbhSOm9uwGe
 LVHWA6IvZjZwd9Mm9+1smr5mukM9LHhzbq6hETG6ZTJ0O9I/LdAVeYk6ftbCzGfFHFn2
 ICKnNMQCD1ioDijatVgwqLC0PjU64JzHcDzjy2i6SeFcX/bogoo+PDRK9mi+cxMKv3nj
 PXek07qu+Y4FAuYq37nybjv04ixIY9cxNXdo2XKw7Un+ARDA4s/lBlrtvKhKW9HBy7x0
 9gBu2ni2G6aMS76PeLk8JyPwUtbEIVYBJtO1DiiWEXxLbRZ4K2bwJGaOA8lReFkWAqik
 v/YA==
X-Gm-Message-State: APjAAAVwaJFt3OJsJhBfMXMZgORC3z3Bk5Fx8WFesC6byyWaAGDVOLcz
 bkVx/w/G9CjIlx7UF7Lqq8Eh9SiuQLZIv0xM3Jk=
X-Google-Smtp-Source: APXvYqzAMS9MZNAZGHChQ9oaIQKvzlBk9um2dNn1JwEC3QyBkv82BbGYL5E8ee1wZ6MWmqxI/zMHjvg4hK/ofe2+P3Y=
X-Received: by 2002:a2e:8658:: with SMTP id i24mr19669320ljj.188.1567546947949; 
 Tue, 03 Sep 2019 14:42:27 -0700 (PDT)
MIME-Version: 1.0
References: <20190903204645.25487-1-lyude@redhat.com>
 <20190903204645.25487-16-lyude@redhat.com>
In-Reply-To: <20190903204645.25487-16-lyude@redhat.com>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 4 Sep 2019 07:42:16 +1000
Message-ID: <CAPM=9ty-264nFotVRy7VwMw_BQPo-=7su7y3J2MjC9Sdkxcu+A@mail.gmail.com>
Subject: Re: [PATCH v2 15/27] drm/dp_mst: Cleanup drm_dp_send_link_address() a
 bit
To: Lyude Paul <lyude@redhat.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=BE22rdpGi0wj7EdpVjb4I26895Qlqc0EPZOEPPFnqZo=;
 b=pr0+4L4tXZKc3JFEDLzqAuzNkEU+eT3ZMdCa+GLkHKvWHop1oZuC3E06bnwvKkck1K
 A+H8W2OkRAKOWg5kXs8/UXRl47Cy0vte71lA+B3XGTdnqAqOAJXtQrIWXPH1GvqFocEM
 /g6t2giGYIPyplxKwitHuEcX7eF3c5UL/p0x4KimiOcc7AauAgWWQ28JtZNYkTdGzK96
 jkPYTcaGI1Wvme3qUbbsrWx7XCljWeyxjvFKq5zfqCe1sCITwPUiA5+2aaU9OcbtNc5V
 si35Ip6/glndUW84qWWIyjC9zEEInds/62VywYgdLJK+Ys1alXfDZZvO8Jk4sOq2qH3+
 PzRw==
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
Cc: Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@linux.ie>,
 nouveau <nouveau@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 Harry Wentland <hwentlan@amd.com>, dri-devel <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Sean Paul <sean@poorly.run>,
 Juston Li <juston.li@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCA0IFNlcCAyMDE5IGF0IDA2OjQ4LCBMeXVkZSBQYXVsIDxseXVkZUByZWRoYXQuY29t
PiB3cm90ZToKPgo+IERlY2xhcmUgbG9jYWwgcG9pbnRlciB0byB0aGUgZHJtX2RwX2xpbmtfYWRk
cmVzc19hY2tfcmVwbHkgc3RydWN0Cj4gaW5zdGVhZCBvZiBjb25zdGFudGx5IGRlcmVmZXJlbmNp
bmcgaXQgdGhyb3VnaCB0aGUgdW5pb24gaW4KPiB0eG1zZy0+cmVwbHkuIFRoZW4sIGludmVydCB0
aGUgb3JkZXIgb2YgY29uZGl0aW9uYWxzIHNvIHdlIGRvbid0IGhhdmUgdG8KPiBkbyB0aGUgYnVs
ayBvZiB0aGUgd29yayBpbnNpZGUgdGhlbSwgYW5kIGNhbiB3cmFwIGxpbmVzIGV2ZW4gbGVzcy4g
VGhlbgo+IGZpbmFsbHksIHJlYXJyYW5nZSB2YXJpYWJsZSBkZWNsYXJhdGlvbnMgYSBiaXQuCj4K
PiBDYzogSnVzdG9uIExpIDxqdXN0b24ubGlAaW50ZWwuY29tPgo+IENjOiBJbXJlIERlYWsgPGlt
cmUuZGVha0BpbnRlbC5jb20+Cj4gQ2M6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBs
aW51eC5pbnRlbC5jb20+Cj4gQ2M6IEhhcnJ5IFdlbnRsYW5kIDxod2VudGxhbkBhbWQuY29tPgo+
IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgo+IFNpZ25lZC1vZmYt
Ynk6IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5jb20+CgpSZXZpZXdlZC1ieTogRGF2ZSBBaXJs
aWUgPGFpcmxpZWRAcmVkaGF0LmNvbT4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
