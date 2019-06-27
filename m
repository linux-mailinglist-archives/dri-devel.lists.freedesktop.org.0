Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 717B058B73
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2019 22:17:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EBEC6E4C5;
	Thu, 27 Jun 2019 20:17:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 003C86E4C5;
 Thu, 27 Jun 2019 20:17:21 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id x4so3918314wrt.6;
 Thu, 27 Jun 2019 13:17:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EXzBT3SunxKtxtFb1Dg3VQpAWP4tlhEFZulyYdsn0Sg=;
 b=p3OyhoiBehka07+PzcV2lq1zOt0gTzO1HmZwPUHvf8uTMgHLFslZRqe9O/iy8MKeoJ
 ggqUwS+403SJuUNh0To+FZP31Ehp3jwVenxqjncBEbz764zIeGeuXoqPU79Z6ca2HhyM
 uqrdTBWj25nBUI+1Q8FxfCXF8shGQHAlgxw1RD2bX7tcxdJKg9bF8XiRf4TcEhXN8tIs
 KXt48eVbGvRxezW5qx3/pDlu/vDSX6GjuMrDekrFwZ0Ixk/fcacaqVVcpmFHtK7RVDT6
 /KDm9goHqxRh6Lk1uYbCM2yMZy99BHa3PMe/X6PAgZwSCUZKqZHhdrS36FtFXb1LgdUr
 N+yg==
X-Gm-Message-State: APjAAAWo7z+DKutSMT+9quTnQPsJdmxBFbgvUKGdXaM8mEJfk5qghZdb
 uqJS414SsJ7/lW8QqHY+eXM2jnHhZJfrHmNqasg=
X-Google-Smtp-Source: APXvYqy2ZhVkbooaFovwSFxpbAMvY1dZgmrog/A6N3mMxS5Gr/v9nVs6Mlatx89uIZNMImhvcttLFIOmwtnKbdxnMx4=
X-Received: by 2002:a5d:4810:: with SMTP id l16mr4334706wrq.48.1561666640514; 
 Thu, 27 Jun 2019 13:17:20 -0700 (PDT)
MIME-Version: 1.0
References: <20190626150522.11618-1-Kenny.Ho@amd.com>
 <20190626150522.11618-8-Kenny.Ho@amd.com>
 <20190626161254.GS12905@phenom.ffwll.local>
 <CAOWid-f3kKnM=4oC5Bba5WW5WNV2MH5PvVamrhO6LBr5ydPJQg@mail.gmail.com>
 <20190627060113.GC12905@phenom.ffwll.local>
In-Reply-To: <20190627060113.GC12905@phenom.ffwll.local>
From: Kenny Ho <y2kenny@gmail.com>
Date: Thu, 27 Jun 2019 16:17:09 -0400
Message-ID: <CAOWid-e=M4Rf30s8ZoK5n2fOYNHhvpun0H=7URsKmsGc3Z0FDQ@mail.gmail.com>
Subject: Re: [RFC PATCH v3 07/11] drm, cgroup: Add TTM buffer allocation stats
To: Daniel Vetter <daniel@ffwll.ch>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=EXzBT3SunxKtxtFb1Dg3VQpAWP4tlhEFZulyYdsn0Sg=;
 b=i7QK1Cxd0JSWlH18qyEN9Mv/lp44691Nj55zulskqgrX72OQvk7YFR1nDIgca+HNg7
 NG6nnIPqVZCmtp5Wfo3wiqzeOUrM2UUWfCtqaIqilBHRcOrIldAHXNsSUtSBROmNLMnd
 zN+ST3EHPUgawYpptlnNCLsnh/go12WUYbNKB/I6V4lIJNd2+2QIQoSNnj88I8TR6Qnq
 lDVGSY3SU5JA5i38w2SPlw2drQVCxCzbTlFVe7yut5F0GKs7xpcxP0iP7Bs6gzR0vGfv
 hZQrisQSdXWzIaUvsElpsF6vyFoEiVYVy7ZjObZM9bxeLhfhSMegUwwPlmsiD59IO5YB
 LiPQ==
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
Cc: Kenny Ho <Kenny.Ho@amd.com>, dri-devel <dri-devel@lists.freedesktop.org>,
 Brian Welty <brian.welty@intel.com>, jsparks@cray.com,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, lkaplan@cray.com,
 Alex Deucher <alexander.deucher@amd.com>, kraxel@redhat.com,
 joseph.greathouse@amd.com, Tejun Heo <tj@kernel.org>, cgroups@vger.kernel.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdW4gMjcsIDIwMTkgYXQgMjowMSBBTSBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3
bGwuY2g+IHdyb3RlOgo+Cj4gYnR3IHJlbWluZHMgbWU6IEkgZ3Vlc3MgaXQgd291bGQgYmUgZ29v
ZCB0byBoYXZlIGEgcGVyLXR5cGUgLnRvdGFsCj4gcmVhZC1vbmx5IGV4cG9zZWQsIHNvIHRoYXQg
dXNlcnNwYWNlIGhhcyBhbiBpZGVhIG9mIGhvdyBtdWNoIHRoZXJlIGlzPwo+IHR0bSBpcyB0cnlp
bmcgdG8gYmUgYWdub3N0aWMgdG8gdGhlIGFsbG9jYXRvciB0aGF0J3MgdXNlZCB0byBtYW5hZ2Ug
YQo+IG1lbW9yeSB0eXBlL3Jlc291cmNlLCBzbyBkb2Vzbid0IGV2ZW4ga25vdyB0aGF0LiBCdXQg
SSB0aGluayBzb21ldGhpbmcgd2UKPiBuZWVkIHRvIGV4cG9zZSB0byBhZG1pbnMsIG90aGVyd2lz
ZSB0aGV5IGNhbid0IG1lYW5pbmdmdWxseSBzZXQgbGltaXRzLgoKSSBkb24ndCB0aGluayBJIHVu
ZGVyc3RhbmQgdGhpcyBiaXQsIGRvIHlvdSBtZWFuIHRvdGFsIGFjcm9zcyBtdWx0aXBsZQpHUFUg
b2YgdGhlIHNhbWUgbWVtIHR5cGU/ICBPciBkbyB5b3UgbWVhbiB0aGUgdG90YWwgYXZhaWxhYmxl
IHBlciBHUFUKKG9yIHNvbWV0aGluZyBlbHNlPykKClJlZ2FyZHMsCktlbm55Cl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
