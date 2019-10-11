Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E040AD415A
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2019 15:33:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C842B6EC3D;
	Fri, 11 Oct 2019 13:33:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb41.google.com (mail-yb1-xb41.google.com
 [IPv6:2607:f8b0:4864:20::b41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C14B36EC3D
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2019 13:33:36 +0000 (UTC)
Received: by mail-yb1-xb41.google.com with SMTP id y204so3089691yby.10
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2019 06:33:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=fUil4PoJuD217jBcYYSLeRYNO6tcCPLO0H6A/GL9Qb8=;
 b=G29GK/wNi2DAdKhGzglfQLOQHtuqT+g/lS5Vp3Svl7V3KCIsnnKLmxd1MZTTTIS3EW
 nOZWCS7AGAEWuAhA3ABcdqfGXphZKMBNyVtyBS/38CKmV9bM0bRGgoB0i7XaZcDAsSoS
 8Y6Ea5EBYwGP+5c0YsJ6mLBZQBa5YVmiDhxVmRP9WCiWO4/EptfoWj4RnXbtbcdx/dsx
 5Et5pOuCRSYNMD9ESTrQW3W9DbaKNkszjDszKQ04hCTtyIuWrIBnnR/R9ikLSyShveGQ
 zn4Rz9CHw3GOzSZxpVkgzXzRw3GK6hQLCANpvOLS4/xtCfkzJfZ9a2/4aq5l0PdBEogA
 En1w==
X-Gm-Message-State: APjAAAWwyKy47icraoINYxxOEl/H8iXEIYBEmN2BGP+A3ofMZCtpIFy1
 XT1Jgz54s3W0y7w4fLaEq5ba9hRlx3Y=
X-Google-Smtp-Source: APXvYqw0+xpWVbu3xuxTg7yss9b7ljSK7TFA5YBYlmLO0kEY9f0KN3BDNx+lWozZjo2Mvwl2v66Hzw==
X-Received: by 2002:a25:42:: with SMTP id 63mr10100988yba.262.1570800815687;
 Fri, 11 Oct 2019 06:33:35 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id p128sm2279522ywp.80.2019.10.11.06.33.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Oct 2019 06:33:35 -0700 (PDT)
Date: Fri, 11 Oct 2019 09:33:34 -0400
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2] drm/msm: Sanitize the modeset_is_locked checks in dpu
Message-ID: <20191011133334.GS85762@art_vandelay>
References: <CAKMK7uF2HsM5WrC5j_WNXWDjkXTyK5tP2DuoRt78FeaL5791QA@mail.gmail.com>
 <20191010181801.186069-1-sean@poorly.run>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191010181801.186069-1-sean@poorly.run>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=fUil4PoJuD217jBcYYSLeRYNO6tcCPLO0H6A/GL9Qb8=;
 b=O422ed7PWUyW1Vzn5pbCWtIZZc1J4f5CowakBf6mIxWgN9lTJR9Bju9h4aEOqtMDib
 OE0ugE4UNAj1Gk0cMxFAqvT8TERSZw6QkCvMu8s/3AQM0Du6AqjwC1gCDJcfslECF8RJ
 BIR2qh22F38mzl/j45Vt8KXHdg4B41oZcG1LGffHLAPEh8iWeTTKxShxYSBNM68jmpUY
 PpgC9TvNNBFRNSPXQ/LkDa+RyY66DXN5+Pj7t4qnk5mZrhitRAAHMCiv8dbseYfQqFBd
 2sn/xsnL0JwSd3HiWp27U08UTxx1D/VOr1t83xGEop//1jwsDQe36LUWDaeMoWNUrmgr
 3btg==
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Sean Paul <seanpaul@chromium.org>,
 linux-arm-msm@vger.kernel.org, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBPY3QgMTAsIDIwMTkgYXQgMDI6MTc6NDRQTSAtMDQwMCwgU2VhbiBQYXVsIHdyb3Rl
Ogo+IEZyb206IFNlYW4gUGF1bCA8c2VhbnBhdWxAY2hyb21pdW0ub3JnPgo+IAo+IEFzIERhbmll
bCBtZW50aW9ucyBpbiBoaXMgZW1haWwgWzFdLCBub24tYmxvY2tpbmcgY29tbWl0cyBkb24ndCBo
b2xkIHRoZQo+IG1vZGVzZXQgbG9ja3MsIHNvIHdlIGNhbiBzYWZlbHkgYWNjZXNzIHN0YXRlIGFz
IGxvbmcgYXMgdGhlc2UgZnVuY3Rpb25zCj4gYXJlIGluIHRoZSBjb21taXQgcGF0aC4gU28gcmVt
b3ZlIHRoZSBXQVJOX09OIGluIGRwdV9rbXNfZW5jb2Rlcl9lbmFibGUuCj4gCj4gSW4gZHB1X2Ny
dGNfZ2V0X2ludGZfbW9kZSwgdGhpbmdzIGFyZSBhIGJpdCBtb3JlIGNvbXBsaWNhdGVkLiBTbyBr
ZWVwCj4gdGhlIFdBUk5fT04sIGJ1dCBhZGQgYSBjb21tZW50IGV4cGxhaW5pbmcgdGhlIHNpdHVh
dGlvbiBhbmQgaG9wZSBzb21lb25lCj4gY29tZXMgYWxvbmcgYW5kIGZpeGVzIHRoZSBpc3N1ZS4K
PiAKPiBbMV0tIGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL2FyY2hpdmVzL2RyaS1kZXZl
bC8yMDE5LU9jdG9iZXIvMjM5NDQxLmh0bWwKPiAKPiBMaW5rIHRvIHYxOiBodHRwczovL3BhdGNo
d29yay5mcmVlZGVza3RvcC5vcmcvcGF0Y2gvbXNnaWQvMjAxOTEwMTAxNTEzNTEuMTI2NzM1LTEt
c2VhbkBwb29ybHkucnVuCj4gCj4gQ2hhbmdlcyBpbiB2MjoKPiAtIFJlc3RvcmVkIHRoZSBXQVJO
X09OIGluIGdldF9pbnRmX21vZGUgYW5kIGFkZGVkIGEgY2xhcmlmeWluZyBjb21tZW50IChEYW5p
ZWwpCj4gCj4gRml4ZXM6IDFkZmRiMGUxMDdkYiAoImRybS9tc206IGRwdTogQWRkIG1vZGVzZXQg
bG9jayBjaGVja3Mgd2hlcmUgYXBwbGljYWJsZSIpCj4gQ2M6IEpleWt1bWFyIFNhbmthcmFuIDxq
c2Fua2FAY29kZWF1cm9yYS5vcmc+Cj4gQ2M6IFJvYiBDbGFyayA8cm9iZGNsYXJrQGNocm9taXVt
Lm9yZz4KPiBTdWdnZXN0ZWQtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KPiBQ
YXJ0aWFsbHktUmV2aWV3ZWQtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwu
Y2g+CgpBcHBsaWVkIHRvIG1zbS1uZXh0IHdpdGggZGFudmV0J3MgZnVsbCBpcmMgci1iLCB0aGFu
a3MgZm9yIHRoZSByZXBvcnQgYW5kCnJldmlldyEKClNlYW4KCj4gU2lnbmVkLW9mZi1ieTogU2Vh
biBQYXVsIDxzZWFucGF1bEBjaHJvbWl1bS5vcmc+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9t
c20vZGlzcC9kcHUxL2RwdV9jcnRjLmMgfCA5ICsrKysrKysrKwo+ICBkcml2ZXJzL2dwdS9kcm0v
bXNtL2Rpc3AvZHB1MS9kcHVfa21zLmMgIHwgMSAtCj4gIDIgZmlsZXMgY2hhbmdlZCwgOSBpbnNl
cnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9tc20vZGlzcC9kcHUxL2RwdV9jcnRjLmMgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1
MS9kcHVfY3J0Yy5jCj4gaW5kZXggMGI5ZGMwNDJkMmUyMi4uZjE5N2RjZTU0NTc2MSAxMDA2NDQK
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfY3J0Yy5jCj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2NydGMuYwo+IEBAIC0yNzEsNiArMjcx
LDE1IEBAIGVudW0gZHB1X2ludGZfbW9kZSBkcHVfY3J0Y19nZXRfaW50Zl9tb2RlKHN0cnVjdCBk
cm1fY3J0YyAqY3J0YykKPiAgCQlyZXR1cm4gSU5URl9NT0RFX05PTkU7Cj4gIAl9Cj4gIAo+ICsJ
LyoKPiArCSAqIFRPRE86IFRoaXMgZnVuY3Rpb24gaXMgY2FsbGVkIGZyb20gZHB1IGRlYnVnZnMg
YW5kIGFzIHBhcnQgb2YgYXRvbWljCj4gKwkgKiBjaGVjay4gV2hlbiBjYWxsZWQgZnJvbSBkZWJ1
Z2ZzLCB0aGUgY3J0Yy0+bXV0ZXggbXVzdCBiZSBoZWxkIHRvCj4gKwkgKiByZWFkIGNydGMtPnN0
YXRlLiBIb3dldmVyIHJlYWRpbmcgY3J0Yy0+c3RhdGUgZnJvbSBhdG9taWMgY2hlY2sgaXNuJ3QK
PiArCSAqIGFsbG93ZWQgKHVubGVzcyB5b3UgaGF2ZSBhIGdvb2QgcmVhc29uLCBhIGJpZyBjb21t
ZW50LCBhbmQgYSBkZWVwCj4gKwkgKiB1bmRlcnN0YW5kaW5nIG9mIGhvdyB0aGUgYXRvbWljL21v
ZGVzZXQgbG9ja3Mgd29yayAoPC0gYW5kIHRoaXMgaXMKPiArCSAqIHByb2JhYmx5IG5vdCBwb3Nz
aWJsZSkpLiBTbyB3ZSdsbCBrZWVwIHRoZSBXQVJOX09OIGhlcmUgZm9yIG5vdywgYnV0Cj4gKwkg
KiByZWFsbHkgd2UgbmVlZCB0byBmaWd1cmUgb3V0IGEgYmV0dGVyIHdheSB0byB0cmFjayBvdXIg
b3BlcmF0aW5nIG1vZGUKPiArCSAqLwo+ICAJV0FSTl9PTighZHJtX21vZGVzZXRfaXNfbG9ja2Vk
KCZjcnRjLT5tdXRleCkpOwo+ICAKPiAgCS8qIFRPRE86IFJldHVybnMgdGhlIGZpcnN0IElOVEZf
TU9ERSwgY291bGQgdGhlcmUgYmUgbXVsdGlwbGUgdmFsdWVzPyAqLwo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfa21zLmMgYi9kcml2ZXJzL2dwdS9kcm0v
bXNtL2Rpc3AvZHB1MS9kcHVfa21zLmMKPiBpbmRleCBiMTY0NWFkODNhMWUxLi42YzkyZjBmYmVh
Yzk4IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9rbXMu
Ywo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9rbXMuYwo+IEBAIC0z
MTYsNyArMzE2LDYgQEAgdm9pZCBkcHVfa21zX2VuY29kZXJfZW5hYmxlKHN0cnVjdCBkcm1fZW5j
b2RlciAqZW5jb2RlcikKPiAgCWlmIChmdW5jcyAmJiBmdW5jcy0+Y29tbWl0KQo+ICAJCWZ1bmNz
LT5jb21taXQoZW5jb2Rlcik7Cj4gIAo+IC0JV0FSTl9PTighZHJtX21vZGVzZXRfaXNfbG9ja2Vk
KCZkZXYtPm1vZGVfY29uZmlnLmNvbm5lY3Rpb25fbXV0ZXgpKTsKPiAgCWRybV9mb3JfZWFjaF9j
cnRjKGNydGMsIGRldikgewo+ICAJCWlmICghKGNydGMtPnN0YXRlLT5lbmNvZGVyX21hc2sgJiBk
cm1fZW5jb2Rlcl9tYXNrKGVuY29kZXIpKSkKPiAgCQkJY29udGludWU7Cj4gLS0gCj4gU2VhbiBQ
YXVsLCBTb2Z0d2FyZSBFbmdpbmVlciwgR29vZ2xlIC8gQ2hyb21pdW0gT1MKPiAKCi0tIApTZWFu
IFBhdWwsIFNvZnR3YXJlIEVuZ2luZWVyLCBHb29nbGUgLyBDaHJvbWl1bSBPUwpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
