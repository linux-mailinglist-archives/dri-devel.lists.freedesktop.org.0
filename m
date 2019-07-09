Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C2A43642AA
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2019 09:25:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E221789B66;
	Wed, 10 Jul 2019 07:25:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EB9289FA7
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2019 13:40:24 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id l9so13368830qtu.6
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jul 2019 06:40:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tv27Rfc5F1/22AUNBd83Muk5qt7AIozrFwrcdJ4deqI=;
 b=ouWbXjWA0BAV6L2xEK7jW1vvETkg/aas6gPQyyavZKpeJl5dXVwYPv4o8WFyI+4U/D
 3SCL6FNeDlukTnNySjcZe3jrDtNmc+Vm32QFoaB8F+MhJ6fVxqvbfoU+dejDNAZwwL7H
 shvu84U42C+rhkVc0kxW8ov/S4BUietJNIG3AZgzYgH6Spibp3bPxDo4o7NniOyDco6b
 TryyZS7SW6Uz3aPZfnrDUbRGpfyZLMk1KxBblVt/g2HhNlhD6VEw4U6+s6Q+YjecfO/t
 Gwe13s+oPt3ujy9xcZDlaYpUUg3vKg4yyFaAsm6JPRQ+BOvQCBHzeUmoksCgJVBElq82
 J/bQ==
X-Gm-Message-State: APjAAAVbJkJufEr9eSiZdQKlmEMekusU5qxzwGftdgaAAOA5mqEGWNvv
 girDN4p7D2Oh3mECFwoxGy8=
X-Google-Smtp-Source: APXvYqyqEPKTyK7MsdBTZXWVLR2v9cx+z96+o6uR4WVGZEPy3MHrbKX+InNCodsNZIL8lPzu8eIBjw==
X-Received: by 2002:aed:3f29:: with SMTP id p38mr18287931qtf.126.1562679623810; 
 Tue, 09 Jul 2019 06:40:23 -0700 (PDT)
Received: from [192.168.2.145] (ppp79-139-233-208.pppoe.spdop.ru.
 [79.139.233.208])
 by smtp.googlemail.com with ESMTPSA id q2sm8537525qkc.118.2019.07.09.06.40.21
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 09 Jul 2019 06:40:23 -0700 (PDT)
Subject: Re: [PATCH v5 05/12] drm/modes: Rewrite the command line parser
To: Jon Hunter <jonathanh@nvidia.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>
References: <cover.5190d070d1439d762d7ab273f4ae2573087fee20.1560783090.git-series.maxime.ripard@bootlin.com>
 <e32cd4009153b184103554009135c7bf7c9975d7.1560783090.git-series.maxime.ripard@bootlin.com>
 <e1fcea71-b551-274e-4ea0-178bb0d5f71c@gmail.com>
 <20190709124526.36szuriteq3jumhr@flea>
 <41d24675-10df-5531-f4ee-4d801e2e4faf@gmail.com>
 <918c4477-6d59-06a6-ead0-9b2fc3e1eb10@nvidia.com>
 <fbf926f0-dc9f-af8f-5365-1a67af8d5b60@nvidia.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <763b0a94-0b64-c4fa-00a4-dba6b4247c73@gmail.com>
Date: Tue, 9 Jul 2019 16:40:20 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <fbf926f0-dc9f-af8f-5365-1a67af8d5b60@nvidia.com>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 10 Jul 2019 07:25:20 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=tv27Rfc5F1/22AUNBd83Muk5qt7AIozrFwrcdJ4deqI=;
 b=idwO+/1lpeDv2O8VT9JEBvK3sh4MMw6hYiAwtDt7soAYVZf6w7ZyCm35uLyCJc0D+Q
 9GjQHiWRgIa4sbjrKa1VgP7OckOBF4qUQSjMR7FBa2rcUCS0EkWLCaHElqiZaGKgaXZg
 hAMI+Y5lDT2mhxHxLNVIAHD4EQl5lp914nTZ3CdRTPUsSeNqunWaKUVjZ4XJ2qYayi6L
 do+ylBKh0OIaT1u03hQZHtvoClwkU34gwce7raEQX9jmsE8mZYy6JPRmx5vbhShqR+fd
 48tZc2Afv5h++CMCq8XyU/hYzTfWmaPNiqdl/wvwRmg3Po5WYTfm73IheQtUPbJI+6F4
 wxZQ==
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

MDkuMDcuMjAxOSAxNjoyOCwgSm9uIEh1bnRlciDQv9C40YjQtdGCOgo+IAo+IE9uIDA5LzA3LzIw
MTkgMTQ6MjYsIEpvbiBIdW50ZXIgd3JvdGU6Cj4+Cj4+IE9uIDA5LzA3LzIwMTkgMTM6NTIsIERt
aXRyeSBPc2lwZW5rbyB3cm90ZToKPj4+IDA5LjA3LjIwMTkgMTU6NDUsIE1heGltZSBSaXBhcmQg
0L/QuNGI0LXRgjoKPj4+PiBIaSwKPj4+Pgo+Pj4+IE9uIEZyaSwgSnVsIDA1LCAyMDE5IGF0IDA3
OjU0OjQ3UE0gKzAzMDAsIERtaXRyeSBPc2lwZW5rbyB3cm90ZToKPj4+Pj4gMTcuMDYuMjAxOSAx
Nzo1MSwgTWF4aW1lIFJpcGFyZCDQv9C40YjQtdGCOgo+Pj4+Pj4gRnJvbTogTWF4aW1lIFJpcGFy
ZCA8bWF4aW1lLnJpcGFyZEBmcmVlLWVsZWN0cm9ucy5jb20+Cj4+Pj4+Pgo+Pj4+Pj4gUmV3cml0
ZSB0aGUgY29tbWFuZCBsaW5lIHBhcnNlciBpbiBvcmRlciB0byBnZXQgYXdheSBmcm9tIHRoZSBz
dGF0ZSBtYWNoaW5lCj4+Pj4+PiBwYXJzaW5nIHRoZSB2aWRlbyBtb2RlIGxpbmVzLgo+Pj4+Pj4K
Pj4+Pj4+IEhvcGVmdWxseSwgdGhpcyB3aWxsIGFsbG93IHRvIGV4dGVuZCBpdCBtb3JlIGVhc2ls
eSB0byBzdXBwb3J0IG5hbWVkIG1vZGVzCj4+Pj4+PiBhbmQgLyBvciBwcm9wZXJ0aWVzIHNldCBk
aXJlY3RseSBvbiB0aGUgY29tbWFuZCBsaW5lLgo+Pj4+Pj4KPj4+Pj4+IFJldmlld2VkLWJ5OiBO
b3JhbGYgVHLDuG5uZXMgPG5vcmFsZkB0cm9ubmVzLm9yZz4KPj4+Pj4+IFNpZ25lZC1vZmYtYnk6
IE1heGltZSBSaXBhcmQgPG1heGltZS5yaXBhcmRAZnJlZS1lbGVjdHJvbnMuY29tPgo+Pj4+Pj4g
LS0tCj4+Pj4+PiAgZHJpdmVycy9ncHUvZHJtL2RybV9tb2Rlcy5jIHwgMzI1ICsrKysrKysrKysr
KysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0KPj4+Pj4+ICAxIGZpbGUgY2hhbmdlZCwgMjEwIGlu
c2VydGlvbnMoKyksIDExNSBkZWxldGlvbnMoLSkKPj4+Pj4KPj4+Pj4gSSBoYXZlIGEgVGVncmEg
ZGV2aWNlIHRoYXQgdXNlcyBhIHN0b2NrIGFuZHJvaWQgYm9vdGxvYWRlciB3aGljaAo+Pj4+PiBw
YXNzZXMgInZpZGVvPXRlZ3JhZmIiIGluIHRoZSBrZXJuZWxzIGNtZGxpbmUuIFRoYXQgd2Fzbid0
IGEgcHJvYmxlbQo+Pj4+PiBiZWZvcmUgdGhpcyBwYXRjaCwgYnV0IG5vdyBUZWdyYSBEUk0gZHJp
dmVyIGZhaWxzIHRvIHByb2JlIGJlY2F1c2UKPj4+Pj4gdGhlIG1vZGUgaXMgMHgwOjAgYW5kIGhl
bmNlIGZyYW1lYnVmZmVyIGFsbG9jYXRpb24gZmFpbHMuIElzIGl0IGEKPj4+Pj4gbGVnaXQgcmVn
cmVzc2lvbiB0aGF0IHNob3VsZCBiZSBmaXhlZCBpbiB1cHN0cmVhbT8KPj4+Pgo+Pj4+IFRoaWVy
cnkgaW5kZWVkIHJlcG9ydGVkIHRoYXQgaXNzdWUsIGJ1dCB0aGUgZGlzY3Vzc2lvbiBwcmV0dHkg
bXVjaAo+Pj4+IHN0YWxsZWQgc2luY2UgdGhlbi4KPj4KPj4gWWVzIFRoaWVycnkgaXMgY3VycmVu
dGx5IG91dCBhbmQgaGVuY2UgaGFzIG5vdCByZXNwb25kZWQuIEkgaGFkIGJlZW4KPj4gcGxhbm5p
bmcgdG8gbG9vayBhdCB0aGlzIHRoaXMgd2VlayBhbmQgcmVzcG9uZGVkLgo+Pgo+Pj4gU29ycnks
IHRoaXMgZG9lc24ndCBhbnN3ZXIgbXkgcXVlc3Rpb24uIFdoZXJlIGl0IHdhcyByZXBvcnRlZD8K
Pj4KPj4gU2FtZSB0aHJlYWQgWzBdLgo+IAo+IENvcnJlY3Rpb24sIGl0IHdhcyBvbiBwYXRjaCA2
LzEyIGFuZCBub3QgdGhpcyBvbmUuCgpUaGFuayB5b3UgdmVyeSBtdWNoLCBKb24hIFNvIGxvb2tz
IGxpa2UgdGhpcyBwYXRjaCBpcyBzaW1wbHkgYnJva2VuIGJlY2F1c2UgaXQgc2lsZW50bHkKY29w
aWVzIHRoZSAibW9kZSdzIG5hbWUiIGFuZCB0aGVuIGRybV9jb25uZWN0b3JfZ2V0X2NtZGxpbmVf
bW9kZSgpIGRvZXNuJ3QgZXZlbiB0cnkgdG8KdmFsaWRhdGUgdGhlIG1vZGUuCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
