Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D361D268C38
	for <lists+dri-devel@lfdr.de>; Mon, 14 Sep 2020 15:30:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECD586E0F6;
	Mon, 14 Sep 2020 13:30:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 733106E0F6
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Sep 2020 13:30:50 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id ay8so17570425edb.8
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Sep 2020 06:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=MJZms6QlGOYEjnVyjgzH8924ZUFCbrOAjhB8S+SOw0Q=;
 b=AZo4Zrph06jSQFMyghqg1VeH/uJOLm2FTxlr/lwLz7LcGc0dGWMtJGTGfIa56pfqRD
 SfHBHsrbfH2iLoCUhK/MZHqrDpM/JA26F/AGyypmlC8llez2CWnSY5tQ3e2HcDw2L9BQ
 Idd41N3fpgLMR5/YftegmeplJ+0U4knjuLatzRauZq3iLjrWvmUDIVY8+gM3rBhrXqyO
 5fAQ4JfxeJMiJ3yLE4UMugQzETfzbzi9LiAlrW8D3PaHaUUg0XX1Gb8R/XnjddNgeN8y
 hPH3z3PjWYW7jYaLwy++Ij502YqCHABMpErfK7GUyDUDXbvFsj5PDRunJeTmU9KmumUU
 4vjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=MJZms6QlGOYEjnVyjgzH8924ZUFCbrOAjhB8S+SOw0Q=;
 b=JgkpImMpc26NjX/Sfknb9V3MLqlRj/RuTBhvWPfujIo2Gmm5BT0NLk+JXW/glyXf+N
 r6zlzzsWKC5zSeb6GN7x5WuLi24V7beLi2B60s276BeJg8xmlacLgTkmp19yXyjKQdtP
 ZQ2URfnnHyXu7vXyicDxTaB7oxPS857pemNx0YDqrn4seLm7Z1VhvNS9O2W5s61I6ipe
 B5KxdTWBb7V+Cvz9KxkyZrLBp4gAGPkudhW0eCY2FdkYbqYDXjzlfVT/+2BUhdvsrrxG
 hjqh7cXx1bZOiYYhQb64nBKFIQxAm07jWBHlV5Ey9OdvqOw4ud/0E++1pvzCqDPFC5ta
 XV8w==
X-Gm-Message-State: AOAM531q3PUAm3ohq+zw7qM8YqCiB2sR673Tp3YLstWtkWjakM3v8Zna
 7xbRbm2yx3UXWKbf9Jwsk7g=
X-Google-Smtp-Source: ABdhPJwM5ZL8+pefIM8N8Pp/HAs1Da9AhS9+TCqXwmw1+Bfwc5H4UJw/fibBFv4vSEBRyYvPybunNQ==
X-Received: by 2002:a50:fb15:: with SMTP id d21mr17942730edq.150.1600090249097; 
 Mon, 14 Sep 2020 06:30:49 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id nh1sm7646664ejb.21.2020.09.14.06.30.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Sep 2020 06:30:48 -0700 (PDT)
Subject: Re: Changing vma->vm_file in dma_buf_mmap()
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
To: akpm@linux-foundation.org
References: <20200914132920.59183-1-christian.koenig@amd.com>
Message-ID: <40cd26ae-b855-4627-5a13-4dcea5d622f6@gmail.com>
Date: Mon, 14 Sep 2020 15:30:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200914132920.59183-1-christian.koenig@amd.com>
Content-Language: en-US
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-mm@kvack.org, linux-media@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTQuMDkuMjAgdW0gMTU6Mjkgc2NocmllYiBDaHJpc3RpYW4gS8O2bmlnOgo+IEhpIEFuZHJl
dywKClNvcnJ5IGZvcmdvdCB0byBhZGQgRGFuaWVsIGFzIHdlbGwuCgo+Cj4gSSdtIHRoZSBuZXcg
RE1BLWJ1ZiBtYWludGFpbmVyIGFuZCBEYW5pZWwgYW5kIG90aGVycyBjYW1lIHVwIHdpdGggcGF0
Y2hlcyBleHRlbmRpbmcgdGhlIHVzZSBvZiB0aGUgZG1hX2J1Zl9tbWFwKCkgZnVuY3Rpb24uCj4K
PiBOb3cgdGhpcyBmdW5jdGlvbiBpcyBkb2luZyBzb21ldGhpbmcgYSBiaXQgb2RkIGJ5IGNoYW5n
aW5nIHRoZSB2bWEtPnZtX2ZpbGUgd2hpbGUgaW5zdGFsbGluZyBhIFZNQSBpbiB0aGUgbW1hcCgp
IHN5c3RlbSBjYWxsCj4KPiBUaGUgYmFja2dyb3VuZCBoZXJlIGlzIHRoYXQgRE1BLWJ1ZiBhbGxv
d3MgZGV2aWNlIGRyaXZlcnMgdG8gZXhwb3J0IGJ1ZmZlciB3aGljaCBhcmUgdGhlbiBpbXBvcnRl
ZCBpbnRvIGFub3RoZXIgZGV2aWNlIGRyaXZlci4gVGhlIG1tYXAoKSBoYW5kbGVyIG9mIHRoZSBp
bXBvcnRpbmcgZGV2aWNlIGRyaXZlciB0aGVuIGZpbmQgdGhhdCB0aGUgcGdvZmYgYmVsb25ncyB0
byB0aGUgZXhwb3J0aW5nIGRldmljZSBhbmQgc28gcmVkaXJlY3RzIHRoZSBtbWFwKCkgY2FsbCB0
aGVyZS4KPgo+IEluIG90aGVyIHdvcmRzIHVzZXIgc3BhY2UgY2FsbHMgbW1hcCgpIG9uIG9uZSBm
aWxlIGRlc2NyaXB0b3IsIGJ1dCBnZXQgYSBkaWZmZXJlbnQgb25lIG1hcHBlZCBpbnRvIHlvdXIg
dmlydHVhbCBhZGRyZXNzIHNwYWNlLgo+Cj4gTXkgcXVlc3Rpb24gaXMgbm93OiBJcyB0aGF0IGxl
Z2FsIG9yIGNhbiB5b3UgdGhpbmsgb2Ygc29tZXRoaW5nIHdoaWNoIGJyZWFrcyBoZXJlPwo+Cj4g
SWYgaXQncyBub3QgbGVnYWwgd2Ugc2hvdWxkIHByb2JhYmx5IGJsb2NrIGFueSBuZXcgdXNlcnMg
b2YgdGhlIGRtYV9idWZfbW1hcCgpIGZ1bmN0aW9uIGFuZCBjb25zaWRlciB3aGF0IHNob3VsZCBo
YXBwZW4gd2l0aCB0aGUgdHdvIGV4aXN0aW5nIG9uZXMuCj4KPiBJZiB0aGF0IGlzIGxlZ2FsIEkg
d291bGQgbGlrZSB0byBkb2N1bWVudCB0aGlzIGJ5IGFkZGluZyBhIG5ldyB2bWFfc2V0X2ZpbGUo
KSBmdW5jdGlvbiB3aGljaCBkb2VzIHRoZSBuZWNlc3NhcnkgcmVmZXJlbmNlIGNvdW50IGRhbmNl
Lgo+Cj4gVGhhbmtzIGluIGFkdmFuY2UsCj4gQ2hyaXN0aWFuLgo+Cj4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
