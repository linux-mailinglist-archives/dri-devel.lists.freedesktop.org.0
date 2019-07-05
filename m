Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1419060C6D
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2019 22:35:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E39BA6E54E;
	Fri,  5 Jul 2019 20:35:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3F336E54E;
 Fri,  5 Jul 2019 20:35:09 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id c2so11029708wrm.8;
 Fri, 05 Jul 2019 13:35:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=k4BDG3Gb73jNiTZtUtMpfoGK9P735tSlZRxVBA+5Xuo=;
 b=gACjl/EsCkAtBsdRNpUoQFgds51bPVDbEgVScGafQJEiPSRn98ZUSSH1GnkoldSgjA
 e6H2b63PqL7gxhJC1owNYX1FiBCgngnJ1oVBzThxqGLMa1U+gOD1BFrsP9uAXW0t4k57
 yAYkaA86PtE/ysAyya0nMmik5UJDs5upAYzz9RC8YyObj9omeoCKTUGMSLFfQ+Eg/8ku
 b9b52ifo3i1L3QZwcQa+fjGTlaZBg49mQ5kdxjehZgKp+FVd0i/vP9q7WkbnWyJbO4PO
 HTXjTo+NGzJ86H/MsOgm/RrIPEdPknkP/NBxPj1WEhUrFvbGn/Qapxji8V6GdyV9HCGn
 C3dQ==
X-Gm-Message-State: APjAAAUFT+9r9ufS2vC9VTt4cNbCOED6NHtE2Z8hGInFBidUnbX02eLp
 ad7mQgMhJPeSRV/1mw4BYjK7gz0drLewdl4mTTg3X2ye
X-Google-Smtp-Source: APXvYqylofBLb1zWU/YUKF/s0FvCOodi1bulZJCl9uZLM9sGngoWbxuKh3qcs9cAqp86dnu11iDr4FNC6I1CcmwPjBM=
X-Received: by 2002:adf:d847:: with SMTP id k7mr2848276wrl.74.1562358908599;
 Fri, 05 Jul 2019 13:35:08 -0700 (PDT)
MIME-Version: 1.0
References: <20190530000819.GA25416@obi-wan> <20190604202149.GA20116@obi-wan>
 <CADnq5_OqVSz7Vfo0zP88i=wJur=wtz6Jd99ZTiQSbFNBcc3j7w@mail.gmail.com>
 <20190616144309.GA8174@obi-wan> <20190704201535.GA21911@obi-wan>
In-Reply-To: <20190704201535.GA21911@obi-wan>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 5 Jul 2019 16:34:57 -0400
Message-ID: <CADnq5_Oh76ABprkBrnJBaamv4gi15szfkJi8hM_Ys=d_4xTr+g@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/powerplay/smu7_hwmgr: replace blocking delay with
 non-blocking
To: Yrjan Skrimstad <yrjan@skrimstad.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=k4BDG3Gb73jNiTZtUtMpfoGK9P735tSlZRxVBA+5Xuo=;
 b=nX1TZpQU+TbhqeOxzhSX4XmNGFaXHjLcXDfAjecwM99P/9gcUkcZDA2xYl/mGET6EB
 4haXduw99strraMo4+Ckg4vPzdkgMw8l9MXuV9Q5g2QxNEoprNRn8FFTKPBpcvjOhcDJ
 HMuiTPtI7+OHJV6/a5oGZwA8aYpXwy+dVAogdGAxngs1OIG8eqOAOxbjjRNcp+LduAuS
 xdqXVZNZhwn/wLh8w6YT2IYXIt0J3jJoaY39Sz6x7IJJ+VE8wHu7a7+RxJp68MsNCpVP
 ctPZsRbu+L5tfaDSiKV9sO/8urpNSVwCf+ygtaXQ7+hkEw0KuviPK6GLVf9Jc7mM48du
 3elQ==
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>,
 Rex Zhu <rex.zhu@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdWwgNCwgMjAxOSBhdCA0OjE1IFBNIFlyamFuIFNrcmltc3RhZCA8eXJqYW5Ac2ty
aW1zdGFkLm5ldD4gd3JvdGU6Cj4KPiBPbiBTdW4sIEp1biAxNiwgMjAxOSBhdCAwNDo0MzoxMFBN
ICswMjAwLCBZcmphbiBTa3JpbXN0YWQgd3JvdGU6Cj4gPiBUaGF0IGlzIGFuIGludGVyZXN0aW5n
IG9ic2VydmF0aW9uIHRvIG1lLiBJIGFtIGFjdHVhbGx5IHJ1bm5pbmcKPiA+IGxtLXNlbnNvcnMs
IGFsdGhvdWdoIG9ubHkgZXZlcnkgMTUgc2Vjb25kcy4gSSBzdXBwb3NlIHRoYXQgdGhpcyBtaWdo
dAo+ID4gYmUgdGhlIHJlYXNvbiB0aGlzIGhhcHBlbnMgdG8gbWUuCj4KPiBUaG91Z2ggSSBkb24n
dCB0aGluayB0aGlzIHNob3VsZCByZWFzb25hYmx5IGNhdXNlIHByb2JsZW1zIHdpdGggdGhlCj4g
c3lzdGVtLCBldmVuIGlmIGl0IGRvZXMgaGVyZS4gSXMgdGhlcmUgYW4gdXBkYXRlIG9uIHRoZSBz
dGF0dXMgb2YgdGhpcwo+IHBhdGNoPwoKQXBwbGllZC4gIHNvcnJ5IGZvciB0aGUgZGVsYXkuCgpB
bGV4Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
