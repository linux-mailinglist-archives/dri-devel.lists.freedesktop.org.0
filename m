Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A7ADCE44
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2019 20:39:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E367B6EBB0;
	Fri, 18 Oct 2019 18:37:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE84A6EB19
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2019 11:05:20 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id r22so4399274lfm.1
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2019 04:05:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1Cn1hU5yCQ6xCe+ib7juhWIPuz2TbnyYwQLFnP7/FrE=;
 b=jf6F2eVGfVy5CBC/Xt1H2HI8UH8wRHdj2XjHavLuguWV6xDHHi5xIYaF5/xG47WRbT
 BHe9dDSv/bC0i7vHcidfHcpYXPBv+ue2wK6BsdODZuFmQDxQHWvCaf69+D1ByHj+VDWt
 +xGASeGdfAZ0NagPYdwihh+/KFJtBREXU7tX1d4bMlesZbKNiNKeMzD2l0KredC31GpJ
 HZv3urvPluscDAUZNxzjCxnaKM3eiB7erwYSyXQnRX5E6QDKtH6fxzEQ+rCoYa32tlCh
 rME65aT8EM4Y7MkUMeneqKLPD5ElVs4AxR/RZcpAe7XIw7gFLiZlbNJaxUKbHqzeSB/4
 rT0w==
X-Gm-Message-State: APjAAAVJnRGkZmTo8L7LPxXD5nLXOQ7XQhJeZCKgm6JfEmflUH9yvdG+
 gA+SOLyG34+8kwFi0KAnZB+DwZWC
X-Google-Smtp-Source: APXvYqzVpdRJAYbdEU1nQWgzPyhExNcqFHwC05v2PtU2LxoNPX7L1BbH614yQC4uFDjd+cpsjQ6qKA==
X-Received: by 2002:a19:22d3:: with SMTP id i202mr5636924lfi.69.1571396718903; 
 Fri, 18 Oct 2019 04:05:18 -0700 (PDT)
Received: from [192.168.2.145] ([94.29.10.250])
 by smtp.googlemail.com with ESMTPSA id i17sm3227263lfj.35.2019.10.18.04.05.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Oct 2019 04:05:18 -0700 (PDT)
Subject: Re: [PATCH 10/14] drm/tegra: Move IOMMU group into host1x client
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
References: <20191014125049.425101-1-thierry.reding@gmail.com>
 <20191014125049.425101-11-thierry.reding@gmail.com>
 <ef11047c-3235-1b8b-d1b0-80d368099e05@gmail.com>
Message-ID: <f65853be-6a65-3c78-e832-df650bf10a55@gmail.com>
Date: Fri, 18 Oct 2019 14:05:17 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <ef11047c-3235-1b8b-d1b0-80d368099e05@gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Fri, 18 Oct 2019 18:37:46 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1Cn1hU5yCQ6xCe+ib7juhWIPuz2TbnyYwQLFnP7/FrE=;
 b=uFvxikpwj0BfMnSMrfrpscUXZtvf3lZAVCwfcvTLR8I2RgM43KRZ81TAIIEstqBXiM
 sFViuhGSc07KyRVpATVY2KZjc1N7dAb9NZDlq85pgcvc03huskAxyUD1UVbw1IlEbJ6B
 vLc2b6xTsZ/GdmG7aaANosTxvWBIWH43mqvxEtqjQYAGZCBMRhfIJsDsDL0w3cBwj6rC
 6vO0tH5PDAjBtgdBrzrZC98hBeZratEi8uHAx0dEg2gRefgOCBh+bzEEvupzvF2SuG6q
 Bid6bKU7z3e2WHHFkBG/oHYklh/ABqeVooVxYcG+EwzSS2WhTtcFnENOmb+4px799AKW
 U+4w==
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MTYuMTAuMjAxOSAxODozMywgRG1pdHJ5IE9zaXBlbmtvINC/0LjRiNC10YI6Cj4gMTQuMTAuMjAx
OSAxNTo1MCwgVGhpZXJyeSBSZWRpbmcg0L/QuNGI0LXRgjoKPj4gRnJvbTogVGhpZXJyeSBSZWRp
bmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KPj4KPj4gSGFuZGxpbmcgb2YgdGhlIElPTU1VIGdyb3Vw
IGF0dGFjaG1lbnQgaXMgY29tbW9uIHRvIGFsbCBjbGllbnRzLCBzbyBtb3ZlCj4+IHRoZSBncm91
cCBpbnRvIHRoZSBjbGllbnQgdG8gc2ltcGxpZnkgY29kZS4KPj4KPj4gU2lnbmVkLW9mZi1ieTog
VGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KPj4gLS0tCj4+ICBkcml2ZXJzL2dw
dS9kcm0vdGVncmEvZGMuYyAgIHwgIDkgKysrKy0tLS0tCj4+ICBkcml2ZXJzL2dwdS9kcm0vdGVn
cmEvZGMuaCAgIHwgIDIgLS0KPj4gIGRyaXZlcnMvZ3B1L2RybS90ZWdyYS9kcm0uYyAgfCAyMiAr
KysrKysrKysrKy0tLS0tLS0tLS0tCj4+ICBkcml2ZXJzL2dwdS9kcm0vdGVncmEvZHJtLmggIHwg
IDYgKystLS0tCj4+ICBkcml2ZXJzL2dwdS9kcm0vdGVncmEvZ3IyZC5jIHwgMTAgKysrKy0tLS0t
LQo+PiAgZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2dyM2QuYyB8IDEwICsrKystLS0tLS0KPj4gIGRy
aXZlcnMvZ3B1L2RybS90ZWdyYS92aWMuYyAgfCAxMCArKysrLS0tLS0tCj4+ICBpbmNsdWRlL2xp
bnV4L2hvc3QxeC5oICAgICAgIHwgIDIgKysKPj4gIDggZmlsZXMgY2hhbmdlZCwgMzEgaW5zZXJ0
aW9ucygrKSwgNDAgZGVsZXRpb25zKC0pCj4gCj4gSGVsbG8gVGhpZXJyeSwKPiAKPiBJcyB0aGVy
ZSBhbnkgY2hhbmNlIHRoYXQgeW91IGNvdWxkIHBpY2sgdXAgdGhlc2UgcGF0Y2hlcyBbMF0gYW5k
IHJlYmFzZQo+IHlvdXJzIHNlcmllcyBvbiB0b3Agb2YgdGhlbT8KPiAKPiBbMF0gaHR0cHM6Ly9w
YXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2xpbnV4LXRlZ3JhL2xpc3QvP3Nlcmllcz0xMTU2
MDgKPiAKCkkgd2FudCB0byBjbGFyaWZ5IHRoYXQgdGhlIHJlYXNvbiBvZiBteSByZXF1ZXN0IGlz
IHRoYXQgIkZpeCAyZCBhbmQgM2QKY2xpZW50cyBkZXRhY2hpbmcgZnJvbSBJT01NVSBkb21haW4i
IHBhdGNoIHdvbid0IGJlIGJhY2twb3J0YWJsZSBpZiBJJ2xsCnJlYmFzZSBteSBwYXRjaGVzIG9u
IHRvcCB0aGlzIHNlcmllcyBhbmQgaXQgbG9va3MgdG8gbWUgdGhhdCBpdCB3b24ndCBiZQp0aGUg
bGVhc3QgdG8gZml4IHRoZSBidWcuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
