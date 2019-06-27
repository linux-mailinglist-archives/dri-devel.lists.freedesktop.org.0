Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B401057D42
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2019 09:38:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8385F6E816;
	Thu, 27 Jun 2019 07:38:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 158046E816
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2019 07:38:51 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id e3so6070683edr.10
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2019 00:38:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=c/hXVEJf6Nv5/4m5Siq+hA/HsOdmfqAgogz8B7ShJRE=;
 b=YyGwjzkBbdygRoBFKn7cIIGsPWLnuOXIHU4nh/UIHUASIEJs8kw4JxCNqzfwBm0SCh
 oKTMyIiiFNKOP8DWZspzlTtNAIvzrKr1FSAu0r44u6oyHutAFHMvbhoqJqH6CLBq65rY
 B6XC/9Ix5QUDKX5XVP0neXEBLy0Tqu7GBel1bTxYFkGzIR39bNUNIcXtCe2Ak6JGROkH
 yHiu9xt6vaqHGuRZQjy+MwDEwVCectga5bMGuqNpguS50pHumfvD6ucAG6supg+p6mdX
 854QcLlY2zLfqmNHli/B9NbEjbOoJgLSekqCWWC79OSkYF+CPsNcao1BXhiINRtBUKTC
 wgIw==
X-Gm-Message-State: APjAAAVxhSaJ8FUnOG5wH13+a4yuoNN913GW2cCjbepCLxs8Jm7zOQFk
 brbxAHQCvxoke3C0UXmOYBvmwYIoW7A=
X-Google-Smtp-Source: APXvYqzdNX89+xR0sASXRbWa+2Qz+r5IZEph2dpmlKcWLa6yHHYEXRXUO+YW4I3HStHP4R7bZJiZwA==
X-Received: by 2002:a50:b6e6:: with SMTP id f35mr2363886ede.82.1561621129537; 
 Thu, 27 Jun 2019 00:38:49 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id y22sm444708edw.94.2019.06.27.00.38.48
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 27 Jun 2019 00:38:48 -0700 (PDT)
Date: Thu, 27 Jun 2019 09:38:46 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 3/7] drm/vc4: Use drm_gem_fb_prepare_fb
Message-ID: <20190627073846.GH12905@phenom.ffwll.local>
References: <20190625204208.5614-1-daniel.vetter@ffwll.ch>
 <20190625204208.5614-4-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190625204208.5614-4-daniel.vetter@ffwll.ch>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=c/hXVEJf6Nv5/4m5Siq+hA/HsOdmfqAgogz8B7ShJRE=;
 b=Lq2C8NXrlKK50vPkvt4GNShNJamPQ5jWSIt95o58AeIiUnYJRVBoC1B7OSVtqCX5Rm
 JtHzs3KuPYF+G4HcRLD1YIUJxKU45s0NnWRVb/Y0wjGZTA4qw8vHC8+mbAiSB5HJ4INL
 4lylnsogaTht5/B4yvkGf2Y+bIBsX3FWatpYs=
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdW4gMjUsIDIwMTkgYXQgMTA6NDI6MDRQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiB2YzQgaGFzIHN3aXRjaGVkIHRvIHVzaW5nIGRybV9mYi0+b2JqW10sIHNvIHdlIGNh
biBqdXN0IHVzZSB0aGUgaGVscGVyCj4gdW5jaGFuZ2VkLgo+IAo+IHYyOiBNYWtlIGl0IGNvbXBp
bGUgLi4uIG9vcHMuCj4gCj4gQ2M6IEVyaWMgQW5ob2x0IDxlcmljQGFuaG9sdC5uZXQ+Cj4gQ2M6
IEVtaWwgVmVsaWtvdiA8ZW1pbC52ZWxpa292QGNvbGxhYm9yYS5jb20+Cj4gU2lnbmVkLW9mZi1i
eTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+Cj4gQ2M6IEVyaWMgQW5o
b2x0IDxlcmljQGFuaG9sdC5uZXQ+CgpNZXJnZWQgdXAgdG8gdGhpcyBvbmUsIHRoYW5rcyBmb3Ig
dGhlIHJldmlld3MuCi1EYW5pZWwKCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS92YzQvdmM0X3Bs
YW5lLmMgfCA1ICsrLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDMgZGVs
ZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS92YzQvdmM0X3BsYW5l
LmMgYi9kcml2ZXJzL2dwdS9kcm0vdmM0L3ZjNF9wbGFuZS5jCj4gaW5kZXggMGEwMjA3YzM1MGE1
Li5hOTk2Y2E4ZmY5NzIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3ZjNC92YzRfcGxh
bmUuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS92YzQvdmM0X3BsYW5lLmMKPiBAQCAtMjAsNiAr
MjAsNyBAQAo+ICAjaW5jbHVkZSA8ZHJtL2RybV9mYl9jbWFfaGVscGVyLmg+Cj4gICNpbmNsdWRl
IDxkcm0vZHJtX3BsYW5lX2hlbHBlci5oPgo+ICAjaW5jbHVkZSA8ZHJtL2RybV9hdG9taWNfdWFw
aS5oPgo+ICsjaW5jbHVkZSA8ZHJtL2RybV9nZW1fZnJhbWVidWZmZXJfaGVscGVyLmg+Cj4gIAo+
ICAjaW5jbHVkZSAidWFwaS9kcm0vdmM0X2RybS5oIgo+ICAjaW5jbHVkZSAidmM0X2Rydi5oIgo+
IEBAIC0xMTIzLDcgKzExMjQsNiBAQCBzdGF0aWMgaW50IHZjNF9wcmVwYXJlX2ZiKHN0cnVjdCBk
cm1fcGxhbmUgKnBsYW5lLAo+ICAJCQkgIHN0cnVjdCBkcm1fcGxhbmVfc3RhdGUgKnN0YXRlKQo+
ICB7Cj4gIAlzdHJ1Y3QgdmM0X2JvICpibzsKPiAtCXN0cnVjdCBkbWFfZmVuY2UgKmZlbmNlOwo+
ICAJaW50IHJldDsKPiAgCj4gIAlpZiAoIXN0YXRlLT5mYikKPiBAQCAtMTEzMSw4ICsxMTMxLDcg
QEAgc3RhdGljIGludCB2YzRfcHJlcGFyZV9mYihzdHJ1Y3QgZHJtX3BsYW5lICpwbGFuZSwKPiAg
Cj4gIAlibyA9IHRvX3ZjNF9ibygmZHJtX2ZiX2NtYV9nZXRfZ2VtX29iaihzdGF0ZS0+ZmIsIDAp
LT5iYXNlKTsKPiAgCj4gLQlmZW5jZSA9IHJlc2VydmF0aW9uX29iamVjdF9nZXRfZXhjbF9yY3Uo
Ym8tPmJhc2UuYmFzZS5yZXN2KTsKPiAtCWRybV9hdG9taWNfc2V0X2ZlbmNlX2Zvcl9wbGFuZShz
dGF0ZSwgZmVuY2UpOwo+ICsJZHJtX2dlbV9mYl9wcmVwYXJlX2ZiKHBsYW5lLCBzdGF0ZSk7Cj4g
IAo+ICAJaWYgKHBsYW5lLT5zdGF0ZS0+ZmIgPT0gc3RhdGUtPmZiKQo+ICAJCXJldHVybiAwOwo+
IC0tIAo+IDIuMjAuMQo+IAoKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIElu
dGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
