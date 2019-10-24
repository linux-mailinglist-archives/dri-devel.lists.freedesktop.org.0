Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F76E454B
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2019 10:11:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29C7C6E8DF;
	Fri, 25 Oct 2019 08:11:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B0286E40A
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2019 13:28:46 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id f5so25053485ljg.8
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2019 06:28:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qpRvQzuCmX419tk1RXW8tLuM29gmSdeDEbb3mw63/Z8=;
 b=K7+jP64NcVdVLcEBmJCgy3crHabl0bB7U8+Vj+mU9reXidFsCQD76sLET08tgdj4On
 SMJZMVGwMW9ZJ8XbR8S4eDyDhechhlVDP/crzxdOZArO8D0BFXU7ZN8+rfD9QFZ2uaP2
 e2F2W7jTwYaXGpBSrUA8ja/nwTgxtiwGgH1kz84t92kEZlj7mMA8tjnBUNKGb9kGW7MY
 AJsw0n3jtY0kQUmBaR4fRI8jbaYc6L5fjN77bsafq233gsFj/Qe6wYXPKscQ8Z3PCYs/
 UGF4/2uw9+wFgRY77QJrXFIAv9xfFa748Ex7NNllnmrZwJL0pOfcDhIpPfzb2KifOzh0
 y3UA==
X-Gm-Message-State: APjAAAV/Ya61zbr7cXvNUwgaSiqwpX+QTV1y6CrWCnYCIpHWVcd/TeE8
 g4pS/V9zGzfYgxypswwXUzo=
X-Google-Smtp-Source: APXvYqxEyUIn2nPYDdkJADbTEtVDmWGoK1iE92aiqKCeecsa1zc9eSC17TYokztPqlhjJTC+iGPbIg==
X-Received: by 2002:a2e:207:: with SMTP id 7mr25972549ljc.198.1571923724328;
 Thu, 24 Oct 2019 06:28:44 -0700 (PDT)
Received: from [192.168.2.145] (94-29-10-250.dynamic.spd-mgts.ru.
 [94.29.10.250])
 by smtp.googlemail.com with ESMTPSA id p18sm13528791lfh.24.2019.10.24.06.28.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Oct 2019 06:28:43 -0700 (PDT)
Subject: Re: [PATCH v1 2/3] drm/tegra: Fix 2d and 3d clients detaching from
 IOMMU domain
To: Thierry Reding <thierry.reding@gmail.com>
References: <20190623173743.24088-1-digetx@gmail.com>
 <20190623173743.24088-2-digetx@gmail.com> <20191024115804.GB2924027@ulmo>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <45926d95-3e7a-c56b-402a-2b2c6475c5db@gmail.com>
Date: Thu, 24 Oct 2019 16:28:41 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191024115804.GB2924027@ulmo>
Content-Language: en-US
X-Mailman-Approved-At: Fri, 25 Oct 2019 08:11:50 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qpRvQzuCmX419tk1RXW8tLuM29gmSdeDEbb3mw63/Z8=;
 b=Kovun9oAV/Qbjri23VchT2LL8J3Rk6T4/3T+ZqBT2hJk2n9yWkfFaFl6JZPn6vma0P
 ULYfNhxTO66dzQt6pb1FdLeilIgUpeh6DCGYRLv71aZS68AW0wailQ3mJ45gOoc5r6Dd
 sA4fTZJ36PimL6hPdLisA/dGmsvO2tiorj9N61qsqNh2fcWmV1uGMF7OLMerRibbDDkU
 fJYiThddg1l+sHOLjDbT8CflmqiNGWE1EzeVhLNdr7KJwAR74GwLwi/8Ag2zSIil8Gx9
 qZeAoyDLdV64+YhMAvXzhKQPHvD9MxmVB2JqMeDZYWII+yAdo0QIPKWMcdb1vCN14N2Y
 /9bQ==
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
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MjQuMTAuMjAxOSAxNDo1OCwgVGhpZXJyeSBSZWRpbmcg0L/QuNGI0LXRgjoKPiBPbiBTdW4sIEp1
biAyMywgMjAxOSBhdCAwODozNzo0MlBNICswMzAwLCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4+
IFRoaXMgc2hvdWxkIHNob3VsZCBmaXJlIHVwIG9uIHRoZSBEUk0ncyBkcml2ZXIgbW9kdWxlIHJl
LWxvYWRlciBiZWNhdXNlCj4+IHRoZXJlIHdvbid0IGJlIGVub3VnaCBhdmFpbGFibGUgZG9tYWlu
cyBvbiBvbGRlciBUZWdyYSBTb0NzLgo+Pgo+PiBDYzogc3RhYmxlIDxzdGFibGVAdmdlci5rZXJu
ZWwub3JnPgo+PiBGaXhlczogMGM0MDdkZTVlZDFhICgiZHJtL3RlZ3JhOiBSZWZhY3RvciBJT01N
VSBhdHRhY2gvZGV0YWNoIikKPj4gU2lnbmVkLW9mZi1ieTogRG1pdHJ5IE9zaXBlbmtvIDxkaWdl
dHhAZ21haWwuY29tPgo+PiAtLS0KPj4gIGRyaXZlcnMvZ3B1L2RybS90ZWdyYS9kYy5jICAgfCA0
ICsrLS0KPj4gIGRyaXZlcnMvZ3B1L2RybS90ZWdyYS9kcm0uYyAgfCA5ICsrKysrKy0tLQo+PiAg
ZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2RybS5oICB8IDMgKystCj4+ICBkcml2ZXJzL2dwdS9kcm0v
dGVncmEvZ3IyZC5jIHwgNCArKy0tCj4+ICBkcml2ZXJzL2dwdS9kcm0vdGVncmEvZ3IzZC5jIHwg
NCArKy0tCj4+ICA1IGZpbGVzIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9u
cygtKQo+IAo+IEkgdGhpbmsgSSB1bmRlcnN0YW5kIHdoYXQgdGhpcyBpcyB0cnlpbmcgdG8gZG8s
IGJ1dCB0aGUgY29tbWl0IG1lc3NhZ2UKPiBkb2VzIG5vdCBoZWxwIGF0IGFsbC4gU28gd2hhdCdz
IHJlYWxseSBnb2luZyBvbiBoZXJlIGlzIHRoYXQgd2UgbmVlZCB0bwo+IGRldGFjaCB0aGUgZGV2
aWNlIGZyb20gdGhlIGdyb3VwIHJlZ2FyZGxlc3Mgb2Ygd2hldGhlciB3ZSdyZSBzaGFyaW5nIHRo
ZQo+IGdyb3VwIG9yIG5vdCwganVzdCBsaWtlIHdlIGF0dGFjaCBncm91cHMgdG8gdGhlIHNoYXJl
ZCBkb21haW4gd2hldGhlcgo+IHRoZXkgc2hhcmUgdGhlIHNhbWUgZ3JvdXAgb3Igbm90LgoKWWVz
LCB0aGUgY29tbWl0J3MgbWVzc2FnZSBjb3VsZCBiZSBpbXByb3ZlZC4KCj4gQnV0IGluIHRoYXQg
Y2FzZSwgSSB3b25kZXIgaWYgaXQncyBldmVuIHdvcnRoIHNwbGl0dGluZyBncm91cHMgdGhlIHdh
eQo+IHdlIGFyZSByaWdodCBub3cuIFdvdWxkbid0IGl0IGJlIGJldHRlciB0byBqdXN0IHB1dCBh
bGwgdGhlIGRldmljZXMgaW50bwo+IHRoZSBzYW1lIGdyb3VwIGFuZCBiZSBkb25lIHdpdGggaXQ/
Cj4gCj4gVGhlIGN1cnJlbnQgY29kZSBnaXZlcyBtZSBoZWFkYWNoZXMgZXZlcnkgdGltZSBJIHJl
YWQgaXQsIHNvIGlmIHdlIGNhbgo+IGp1c3QgbWFrZSBpdCBzbyB0aGF0IGFsbCB0aGUgZGV2aWNl
cyB1bmRlciB0aGUgRFJNIGRldmljZSBzaGFyZSB0aGUgc2FtZQo+IGdyb3VwLCB0aGlzIHdvdWxk
IGJlY29tZSBhIGxvdCBlYXNpZXIgdG8gZGVhbCB3aXRoLiBJJ20gbm90IHJlYWxseQo+IGNvbnZp
bmNlZCB0aGF0IGl0IG1ha2VzIG11Y2ggc2Vuc2UgdG8ga2VlcCB0aGVtIG9uIHNlcGFyYXRlIGRv
bWFpbnMsCj4gZXNwZWNpYWxseSBnaXZlbiB0aGUgY29uc3RyYWludHMgb24gdGhlIG51bWJlciBv
ZiBkb21haW5zIGF2YWlsYWJsZSBvbgo+IGVhcmxpZXIgVGVncmEgZGV2aWNlcy4KPiAKPiBOb3Rl
IHRoYXQgc2hhcmluZyBhIGdyb3VwIHdpbGwgYWxzbyBtYWtlIGl0IG11Y2ggZWFzaWVyIGZvciB0
aGVzZSB0byB1c2UKPiB0aGUgRE1BIEFQSSBpZiBpdCBpcyBiYWNrZWQgYnkgYW4gSU9NTVUuCgpQ
cm9iYWJseSBJJ20gYmxhbmtpbmcgb24gZXZlcnl0aGluZyBhYm91dCBJT01NVSBub3cuLiBjb3Vs
ZCB5b3UgcGxlYXNlCnJlbWluZCBtZSB3aGF0ICJJT01NVSBncm91cCIgaXM/CgpJc24ndCBpdCB0
aGF0IGVhY2ggSU9NTVUgZ3JvdXAgcmVsYXRlcyB0byB0aGUgSFcgSUQgKFNXR1JPVVApPyBCdXQg
dGhlbgplYWNoIGRpc3BsYXkgY29udHJvbGxlciBoYXMgaXRzIG93biBTV0dST1VQLi4gYW5kIHRo
dXMgdGhhdCBzaGFyaW5nIGp1c3QKZG9lc24ndCBtYWtlIGFueSBzZW5zZSwgaG0uCgo+IExldCBt
ZSBzZWUgaWYgSSBjYW4gdGhyb3cgc29tZXRoaW5nIHRvZ2V0aGVyIHRvIHRoYXQgZWZmZWN0LgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
