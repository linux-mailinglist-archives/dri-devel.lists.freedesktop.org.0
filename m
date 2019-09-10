Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4136AEF16
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2019 18:03:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D67696E120;
	Tue, 10 Sep 2019 16:03:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 803E36E11D;
 Tue, 10 Sep 2019 16:03:34 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id b2so21361205qtq.5;
 Tue, 10 Sep 2019 09:03:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=7aIOX124CvBDQ+soNFV0AIGLUFHPyLLvAhmjlVF2WPk=;
 b=ON/M62hHII3Rr4JnOlIi9g2vVv2WLR5mk4xcfLFP3KykYY4UeCCaymjcsZ6fCMqA/1
 jkPQonQRHSsvYY4716IlW10oypYKCUrtt/AOxt9VXpipbKvG6y/yabquRII2duqjEyt1
 HT2Q+qDEIdQIrXerxhcz83FVcCrdIedUSp5a8Aapz9XWWJkNW9A1yoIlUv81JbG1F4Xr
 faF8nhO+Z3DS03cwzfSbcmjphRXpgxJugS8HAG2svf/sRejmhrp+l1yvLkcEM0tqOdFf
 OjmE8Mkj5o2O681HtD3BCRoTXi0Dp8m6d6zh2xSSIOBC+ZjGLjWNfvHOdasGFacW8msl
 GBIQ==
X-Gm-Message-State: APjAAAWdo7o2RCUhrAZUNoBEZXhD6MbTCHAhnkK3Td1O9vYNlCB1tYL8
 yqepzhFQKH3w5pSxG+P8Vng=
X-Google-Smtp-Source: APXvYqx5gqcyO2isFyQIcHOc2o+DcKf/TqnH/zbLgQZA4VElls50DS+7LNJQCVGNDmDZFbFJ4RCP6Q==
X-Received: by 2002:aed:2d67:: with SMTP id h94mr29270980qtd.63.1568131413281; 
 Tue, 10 Sep 2019 09:03:33 -0700 (PDT)
Received: from localhost ([2620:10d:c091:500::2:f049])
 by smtp.gmail.com with ESMTPSA id e17sm9285328qkn.61.2019.09.10.09.03.32
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 10 Sep 2019 09:03:32 -0700 (PDT)
Date: Tue, 10 Sep 2019 09:03:29 -0700
From: Tejun Heo <tj@kernel.org>
To: Michal Hocko <mhocko@kernel.org>
Subject: Re: [PATCH RFC v4 00/16] new cgroup controller for gpu/drm subsystem
Message-ID: <20190910160329.GR2263813@devbig004.ftw2.facebook.com>
References: <20190829060533.32315-1-Kenny.Ho@amd.com>
 <20190831042857.GD2263813@devbig004.ftw2.facebook.com>
 <20190903075550.GJ2112@phenom.ffwll.local>
 <20190903185013.GI2263813@devbig004.ftw2.facebook.com>
 <CAKMK7uE5Bj-3cJH895iqnLpwUV+GBDM1Y=n4Z4A3xervMdJKXg@mail.gmail.com>
 <20190906152320.GM2263813@devbig004.ftw2.facebook.com>
 <CAKMK7uEXP7XLFB2aFU6+E0TH_DepFRkfCoKoHwkXtjZRDyhHig@mail.gmail.com>
 <20190906154539.GP2263813@devbig004.ftw2.facebook.com>
 <20190910115448.GT2063@dhcp22.suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190910115448.GT2063@dhcp22.suse.cz>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=7aIOX124CvBDQ+soNFV0AIGLUFHPyLLvAhmjlVF2WPk=;
 b=VqkWghjlkTpH+A8hE16ODggPKsNxNZPC2yhI1hjp84XcqzJbGwKU6z8oknVnI7TadB
 PHemMFbHH5gvsYBqcWlvRyRxP4VRQ3tpv8Q8FV/8k0cwe9Gs9BHCFpHFy1pVKBlSKOQr
 5Sky68xI/IuGVVBezT7cYQo4JOmj/9g/gWri1H3bfoKG+F/gRyw5my6rpbxMkPN7+DlO
 uKDrPZ9958F75rMuAIQ2BXJLAznPnFZUPvnKoQrBSmmopoOxVILteEphyDO7v4gWhGwR
 E47gNFbPptPrTFOAtK4SexBzeZN9jrwYCatSt1d+mXYimj1UDBzcH1LZ2YuZrwi4OHd9
 1zfQ==
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
Cc: "Greathouse, Joseph" <joseph.greathouse@amd.com>,
 Kenny Ho <Kenny.Ho@amd.com>, "Kuehling, Felix" <felix.kuehling@amd.com>,
 jsparks@cray.com, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 lkaplan@cray.com, Kenny Ho <y2kenny@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, cgroups@vger.kernel.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGVsbG8sIE1pY2hhbC4KCk9uIFR1ZSwgU2VwIDEwLCAyMDE5IGF0IDAxOjU0OjQ4UE0gKzAyMDAs
IE1pY2hhbCBIb2NrbyB3cm90ZToKPiA+IFNvLCB3aGlsZSBpdCdkIGdyZWF0IHRvIGhhdmUgc2hy
aW5rZXJzIGluIHRoZSBsb25nZXIgdGVybSwgaXQncyBub3QgYQo+ID4gc3RyaWN0IHJlcXVpcmVt
ZW50IHRvIGJlIGFjY291bnRlZCBpbiBtZW1jZy4gIEl0IGFscmVhZHkgYWNjb3VudHMgYQo+ID4g
bG90IG9mIG1lbW9yeSB3aGljaCBpc24ndCByZWNsYWltYWJsZSAoYSBsb3Qgb2Ygc2xhYnMgYW5k
IHNvY2tldAo+ID4gYnVmZmVyKS4KPiAKPiBZZWFoLCBoYXZpbmcgYSBzaHJpbmtlciBpcyBwcmVm
ZXJyZWQgYnV0IHRoZSBtZW1vcnkgc2hvdWxkIGJldHRlciBiZQo+IHJlY2xhaW1hYmxlIGluIHNv
bWUgZm9ybS4gSWYgbm90IGJ5IGFueSBvdGhlciBtZWFucyB0aGVuIGF0IGxlYXN0IGJvdW5kCj4g
dG8gYSB1c2VyIHByb2Nlc3MgY29udGV4dCBzbyB0aGF0IGl0IGdvZXMgYXdheSB3aXRoIGEgdGFz
ayBiZWluZyBraWxsZWQKPiBieSB0aGUgT09NIGtpbGxlci4gSWYgdGhhdCBpcyBub3QgdGhlIGNh
c2UgdGhlbiB3ZSBjYW5ub3QgcmVhbGx5IGNoYXJnZQo+IGl0IGJlY2F1c2UgdGhlbiB0aGUgbWVt
Y2cgY29udHJvbGxlciBpcyBvZiBubyB1c2UuIFdlIGNhbiB0b2xlcmF0ZSBpdCB0bwo+IHNvbWUg
ZGVncmVlIGlmIHRoZSBhbW91bnQgb2YgbWVtb3J5IGNoYXJnZWQgbGlrZSB0aGF0IGlzIG5lZ2xp
Z2libGUgdG8KPiB0aGUgb3ZlcmFsbCBzaXplLiBCdXQgZnJvbSB0aGUgZGlzY3Vzc2lvbiBpdCBz
ZWVtcyB0aGF0IHRoZXNlIGJ1ZmZlcnMKPiBhcmUgcmVhbGx5IGxhcmdlLgoKWWVhaCwgb29tIGtp
bGxzIHNob3VsZCBiZSBhYmxlIHRvIHJlZHVjZSB0aGUgdXNhZ2U7IGhvd2V2ZXIsIHBsZWFzZQpu
b3RlIHRoYXQgdG1wZnMsIGFtb25nIG90aGVyIHRoaW5ncywgY2FuIGFscmVhZHkgZXNjYXBlIHRo
aXMKcmVzdHJpY3Rpb24gYW5kIHdlIGNhbiBoYXZlIGNncm91cHMgd2hpY2ggYXJlIG92ZXIgbWF4
IGFuZCBlbXB0eS4KSXQncyBvYnZpb3VzbHkgbm90IGlkZWFsIGJ1dCB0aGUgc3lzdGVtIGRvZXNu
J3QgbWVsdCBkb3duIGZyb20gaXQKZWl0aGVyLgoKVGhhbmtzLgoKLS0gCnRlanVuCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
