Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C0517DB20
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2019 14:15:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CE696E5A6;
	Thu,  1 Aug 2019 12:15:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE9C86E5A0
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Aug 2019 12:15:19 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id s15so41629137wmj.3
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Aug 2019 05:15:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=Aagu9W/ubb4X5ymrK2ozOiK3Ep+AoG04QTHQQYENEHk=;
 b=dn1fOFKDZNBgVehew0c56tSPo5xekGc52gVZezDSJCV7/xn+8ODZ2J+x+hducuOwuX
 HQUd8bp/GO3Oh/llzXodfwJ1JH2hCO0PXDI/7BmudXmEHQq6+bhUlSCKyYnhk0p8HJ2t
 lDGX31yXCaAZPfadfUvA9l+x8ZV0b4OzsXrs8vYzrVylGWDSWoN6Ymi4KjbNFwQkfpZJ
 XZSqECqDtsvNUl3HnOKuN2QCBxOCBkQWrH1ikxxCGRqdT0+s1/HCikFZ9LSq2fun4+I7
 6Z1BYxhxNWuDuApIAZkq7GbtKOOYkAg69E/Hfb4ME1fviJUTPYEWsuji4P3ivVcS1kkE
 /UPg==
X-Gm-Message-State: APjAAAXQsvMVBLAQeWxO7j0v+aZWEEGIGlu+ddgzm1NMFL1bIdQJFEEf
 3sA0NmR5h2Nkm8Jq1VyVCTW7Kg==
X-Google-Smtp-Source: APXvYqwMyK8Q3JRQSo7cIstSrD9W+dbpaB9d5bwZQvI+jYKT0Vg2frEzC49iGpSKocm9KjCiAu+PPA==
X-Received: by 2002:a1c:a8d7:: with SMTP id
 r206mr117061987wme.47.1564661718160; 
 Thu, 01 Aug 2019 05:15:18 -0700 (PDT)
Received: from [10.1.2.12] (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id k63sm87640142wmb.2.2019.08.01.05.15.16
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 01 Aug 2019 05:15:17 -0700 (PDT)
Subject: Re: [PATCH 02/13] drm/radeon: Eliminate possible use of an
 uninitialized variable
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 dri-devel@lists.freedesktop.org
References: <65481afa-1104-4ee9-e53d-f2732a10d4b9@baylibre.com>
 <cover.1564591626.git.andrzej.p@collabora.com>
 <cfff357a07bfa572baad058947f281b7095e1794.1564591626.git.andrzej.p@collabora.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <7cacac43-737e-1ddb-2951-394fcf9ad0b2@baylibre.com>
Date: Thu, 1 Aug 2019 14:15:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <cfff357a07bfa572baad058947f281b7095e1794.1564591626.git.andrzej.p@collabora.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:openpgp:autocrypt:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=Aagu9W/ubb4X5ymrK2ozOiK3Ep+AoG04QTHQQYENEHk=;
 b=jSZ0DYo20Lse3oBCuziaTTy2OaNf25kG7DxLqT2P/ckZmCnsjzeZA4+ebbBe5NqNa9
 zXDg4owKoJR27sevUem8GuSH8bz5u1zagzKYuvJay4UU7djdJLWevnp18X8SmHO9KXDw
 KiP1CAX1hNeSjwt5htf1cDNu+SsMOTHZ6pSb3MAzfUngjpGCN2AbJFo4XcihNMtZt1Qh
 417rFiIhqZ8MvqZhyuKVmyCB7fNhCfXWLN9I1zOzHUWyLVz7U4kNBAOFK5tfTUHI9klS
 Dui1QkMax3ZyDC0dDlVs9Fyf3DPDxzjeK/qhq9en5mLQds8bQGqquygo1IgmLBHvLNjD
 vwLA==
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
Cc: David Airlie <airlied@linux.ie>, Matthias Brugger <matthias.bgg@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 kernel@collabora.com, Anthony Koo <Anthony.Koo@amd.com>,
 linux-samsung-soc@vger.kernel.org, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 David Francis <David.Francis@amd.com>, Mamta Shukla <mamtashukla555@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-rockchip@lists.infradead.org,
 Kukjin Kim <kgene@kernel.org>, Allison Randal <allison@lohutok.net>,
 Leo Li <sunpeng.li@amd.com>, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, Jyri Sarha <jsarha@ti.com>,
 linux-mediatek@lists.infradead.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 linux-tegra@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 linux-arm-kernel@lists.infradead.org, Sean Paul <sean@poorly.run>,
 amd-gfx@lists.freedesktop.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Todor Tomov <todor.tomov@linaro.org>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQW5kcnplaiwKCkkgaGFkIHRvIHJldmVydCB0aGUgcHJldmlvdXMgcGF0Y2gsIHNvIHlvdSBz
aG91bGQgcmUtc3BpbiBpdCBlbnRpcmVseSA6Cgo9PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PQpBZnRlciBtZXJnaW5nIHRoZSBkcm0tbWlzYyB0cmVlLCB0b2RheSdzIGxpbnV4LW5leHQg
YnVpbGQgKHg4Nl82NAphbGxtb2Rjb25maWcpIGZhaWxlZCBsaWtlIHRoaXM6Cgpkcml2ZXJzL2dw
dS9kcm0vcmFkZW9uL3JhZGVvbl9jb25uZWN0b3JzLmM6IEluIGZ1bmN0aW9uICdyYWRlb25fYWRk
X2xlZ2FjeV9jb25uZWN0b3InOgpkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9jb25uZWN0
b3JzLmM6MjQzMzo1OiBlcnJvcjogJ2RkYycgdW5kZWNsYXJlZCAoZmlyc3QgdXNlIGluIHRoaXMg
ZnVuY3Rpb24pCiAgICAgZGRjID0gJnJhZGVvbl9jb25uZWN0b3ItPmRkY19idXMtPmFkYXB0ZXI7
CiAgICAgXn5+CmRyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2Nvbm5lY3RvcnMuYzoyNDMz
OjU6IG5vdGU6IGVhY2ggdW5kZWNsYXJlZCBpZGVudGlmaWVyIGlzIHJlcG9ydGVkIG9ubHkgb25j
ZSBmb3IgZWFjaCBmdW5jdGlvbiBpdCBhcHBlYXJzIGluCgpDYXVzZWQgYnkgY29tbWl0CgogIGJl
ZDdhMjE4MmRlNiAoImRybS9yYWRlb246IFByb3ZpZGUgZGRjIHN5bWxpbmsgaW4gY29ubmVjdG9y
IHN5c2ZzIGRpcmVjdG9yeSIpCgpJIGhhdmUgdXNlZCB0aGUgZHJtLW1pc2MgdHJlZSBmcm9tIG5l
eHQtMjAxOTA3MzEgZm9yIHRvZGF5Lgo9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
CgpOZWlsCgpPbiAzMS8wNy8yMDE5IDE4OjU4LCBBbmRyemVqIFBpZXRyYXNpZXdpY3ogd3JvdGU6
Cj4gZGRjIGxvY2FsIHZhcmlhYmxlIGlzIHBhc3NlZCB0byBkcm1fY29ubmVjdG9yX2luaXRfd2l0
aF9kZGMoKSBhbmQgc2hvdWxkCj4gYmUgTlVMTCBpZiBubyBkZGMgaXMgYXZhaWxhYmxlLgo+IAo+
IFNpZ25lZC1vZmYtYnk6IEFuZHJ6ZWogUGlldHJhc2lld2ljeiA8YW5kcnplai5wQGNvbGxhYm9y
YS5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2Nvbm5lY3RvcnMu
YyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
Cj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2Nvbm5lY3Rv
cnMuYyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2Nvbm5lY3RvcnMuYwo+IGluZGV4
IGIzYWQ4ZDg5MDgwMS4uZDExMTMxZDAzZWQ2IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9yYWRlb24vcmFkZW9uX2Nvbm5lY3RvcnMuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRl
b24vcmFkZW9uX2Nvbm5lY3RvcnMuYwo+IEBAIC0xODcwLDcgKzE4NzAsNyBAQCByYWRlb25fYWRk
X2F0b21fY29ubmVjdG9yKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsCj4gIAlzdHJ1Y3QgcmFkZW9u
X2Nvbm5lY3Rvcl9hdG9tX2RpZyAqcmFkZW9uX2RpZ19jb25uZWN0b3I7Cj4gIAlzdHJ1Y3QgZHJt
X2VuY29kZXIgKmVuY29kZXI7Cj4gIAlzdHJ1Y3QgcmFkZW9uX2VuY29kZXIgKnJhZGVvbl9lbmNv
ZGVyOwo+IC0Jc3RydWN0IGkyY19hZGFwdGVyICpkZGM7Cj4gKwlzdHJ1Y3QgaTJjX2FkYXB0ZXIg
KmRkYyA9IE5VTEw7Cj4gIAl1aW50MzJfdCBzdWJwaXhlbF9vcmRlciA9IFN1YlBpeGVsTm9uZTsK
PiAgCWJvb2wgc2hhcmVkX2RkYyA9IGZhbHNlOwo+ICAJYm9vbCBpc19kcF9icmlkZ2UgPSBmYWxz
ZTsKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
