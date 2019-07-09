Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D83A4642C2
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2019 09:26:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DBF289C80;
	Wed, 10 Jul 2019 07:25:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D328389701
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2019 12:52:20 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id r21so15624584qke.2
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jul 2019 05:52:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=z8kNI881bPk48iQ1KRVTl0sXKkuyk/dxjSsIQFxaR8o=;
 b=V9uiOgBEUDf/4qAcMP5Nua90Vko4G/03bY2iD0m2TY2kSngHhfkrkUJU/0dZsK5qJ/
 uN0UVit2/8JgRu1Al8BiZchTnuUH6wR6bU3zCNGstSpiQFAn9IhcieraTLzIdgbqUx3b
 a415alsPQIFzU8j/zcUC6ExDZ9tPsREX0p0/BXD55Mm1GeL7JPZXlLEEM0NpDGd/C2+W
 Dmsu9Cd6mXW3J1ozCoBez6CaPpeVy7O4bkbKXHlHiLm3o+Bek5ZD3Knor/jWCoQ+Myd4
 9ocIeADjRNkXYGoirhgPGGbVI3nTFoEp6/WefPOFBuZW+j2fZg964k4+wYySymY/kLSH
 6NJQ==
X-Gm-Message-State: APjAAAUPpD1BZ5MzemBtE9ILY0TlgmmVheWeyjE+hQ0Hrz69Nk1D44l4
 BeFvRK5ADK+dmayq10uXvHE=
X-Google-Smtp-Source: APXvYqyHA5/Lol3yKNF2g17z/amMymzBG8mlvk2cI4jGu5NI2rCkAbu+/C+mLJhVZoKdUzWek1dpbA==
X-Received: by 2002:a37:a7d2:: with SMTP id
 q201mr18019316qke.150.1562676740061; 
 Tue, 09 Jul 2019 05:52:20 -0700 (PDT)
Received: from [192.168.2.145] (ppp79-139-233-208.pppoe.spdop.ru.
 [79.139.233.208])
 by smtp.googlemail.com with ESMTPSA id t6sm8836329qkh.129.2019.07.09.05.52.15
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 09 Jul 2019 05:52:17 -0700 (PDT)
Subject: Re: [PATCH v5 05/12] drm/modes: Rewrite the command line parser
To: Maxime Ripard <maxime.ripard@bootlin.com>
References: <cover.5190d070d1439d762d7ab273f4ae2573087fee20.1560783090.git-series.maxime.ripard@bootlin.com>
 <e32cd4009153b184103554009135c7bf7c9975d7.1560783090.git-series.maxime.ripard@bootlin.com>
 <e1fcea71-b551-274e-4ea0-178bb0d5f71c@gmail.com>
 <20190709124526.36szuriteq3jumhr@flea>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <41d24675-10df-5531-f4ee-4d801e2e4faf@gmail.com>
Date: Tue, 9 Jul 2019 15:52:13 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190709124526.36szuriteq3jumhr@flea>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 10 Jul 2019 07:25:20 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=z8kNI881bPk48iQ1KRVTl0sXKkuyk/dxjSsIQFxaR8o=;
 b=E0e0ZIuEOatfHsh7mOJFiZl1I6rwVWxMVBR7/NP4v7/YzUMirQOcByvAHvg2T0kjXl
 VwE1HxqsblS7HwY/UtGp0m//pupC6TMCRZl2XI5xNvQGm/UfVz+R5OfvODRwLcV/HPTw
 3tnkuXGYjq6WfNB2kWqDnKnu0h8haGjl68eaL3kClCGwtKbPo24PYO7rnnjyVZV98G6G
 0Dom35EfORV1x1R7hGcOUM9gqD8MbpqncHi9NaLUSwTA1fuWVEZWf0Jpohz97vFKcnuQ
 Ra6z0d5JvZ4w8tRlVNDfByvvbYbnrxRDJb2DFj5K2FdzU+7DKeSL98HEk0MRjHWo9JEd
 68lA==
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
Cc: eben@raspberrypi.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sean Paul <seanpaul@chromium.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 Daniel Vetter <daniel.vetter@intel.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MDkuMDcuMjAxOSAxNTo0NSwgTWF4aW1lIFJpcGFyZCDQv9C40YjQtdGCOgo+IEhpLAo+IAo+IE9u
IEZyaSwgSnVsIDA1LCAyMDE5IGF0IDA3OjU0OjQ3UE0gKzAzMDAsIERtaXRyeSBPc2lwZW5rbyB3
cm90ZToKPj4gMTcuMDYuMjAxOSAxNzo1MSwgTWF4aW1lIFJpcGFyZCDQv9C40YjQtdGCOgo+Pj4g
RnJvbTogTWF4aW1lIFJpcGFyZCA8bWF4aW1lLnJpcGFyZEBmcmVlLWVsZWN0cm9ucy5jb20+Cj4+
Pgo+Pj4gUmV3cml0ZSB0aGUgY29tbWFuZCBsaW5lIHBhcnNlciBpbiBvcmRlciB0byBnZXQgYXdh
eSBmcm9tIHRoZSBzdGF0ZSBtYWNoaW5lCj4+PiBwYXJzaW5nIHRoZSB2aWRlbyBtb2RlIGxpbmVz
Lgo+Pj4KPj4+IEhvcGVmdWxseSwgdGhpcyB3aWxsIGFsbG93IHRvIGV4dGVuZCBpdCBtb3JlIGVh
c2lseSB0byBzdXBwb3J0IG5hbWVkIG1vZGVzCj4+PiBhbmQgLyBvciBwcm9wZXJ0aWVzIHNldCBk
aXJlY3RseSBvbiB0aGUgY29tbWFuZCBsaW5lLgo+Pj4KPj4+IFJldmlld2VkLWJ5OiBOb3JhbGYg
VHLDuG5uZXMgPG5vcmFsZkB0cm9ubmVzLm9yZz4KPj4+IFNpZ25lZC1vZmYtYnk6IE1heGltZSBS
aXBhcmQgPG1heGltZS5yaXBhcmRAZnJlZS1lbGVjdHJvbnMuY29tPgo+Pj4gLS0tCj4+PiAgZHJp
dmVycy9ncHUvZHJtL2RybV9tb2Rlcy5jIHwgMzI1ICsrKysrKysrKysrKysrKysrKysrKysrLS0t
LS0tLS0tLS0tLS0KPj4+ICAxIGZpbGUgY2hhbmdlZCwgMjEwIGluc2VydGlvbnMoKyksIDExNSBk
ZWxldGlvbnMoLSkKPj4KPj4gSSBoYXZlIGEgVGVncmEgZGV2aWNlIHRoYXQgdXNlcyBhIHN0b2Nr
IGFuZHJvaWQgYm9vdGxvYWRlciB3aGljaAo+PiBwYXNzZXMgInZpZGVvPXRlZ3JhZmIiIGluIHRo
ZSBrZXJuZWxzIGNtZGxpbmUuIFRoYXQgd2Fzbid0IGEgcHJvYmxlbQo+PiBiZWZvcmUgdGhpcyBw
YXRjaCwgYnV0IG5vdyBUZWdyYSBEUk0gZHJpdmVyIGZhaWxzIHRvIHByb2JlIGJlY2F1c2UKPj4g
dGhlIG1vZGUgaXMgMHgwOjAgYW5kIGhlbmNlIGZyYW1lYnVmZmVyIGFsbG9jYXRpb24gZmFpbHMu
IElzIGl0IGEKPj4gbGVnaXQgcmVncmVzc2lvbiB0aGF0IHNob3VsZCBiZSBmaXhlZCBpbiB1cHN0
cmVhbT8KPiAKPiBUaGllcnJ5IGluZGVlZCByZXBvcnRlZCB0aGF0IGlzc3VlLCBidXQgdGhlIGRp
c2N1c3Npb24gcHJldHR5IG11Y2gKPiBzdGFsbGVkIHNpbmNlIHRoZW4uCgpTb3JyeSwgdGhpcyBk
b2Vzbid0IGFuc3dlciBteSBxdWVzdGlvbi4gV2hlcmUgaXQgd2FzIHJlcG9ydGVkPwoKSWYgaXQn
cyBhIHZhbGlkIHJlZ3Jlc3Npb24gKG15IGRldmljZSBpcyBicm9rZW4pLCB0aGVuIHRoZSBwYXRj
aCBzaG91bGQgZWl0aGVyIGJlIGZpeGVkIG9yCnJldmVydGVkLgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
