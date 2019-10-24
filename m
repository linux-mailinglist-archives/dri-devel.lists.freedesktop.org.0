Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E3DCE454F
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2019 10:12:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C70A46E8EA;
	Fri, 25 Oct 2019 08:12:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA1F26E44F
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2019 15:47:27 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id x4so13251356lfn.8
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2019 08:47:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2qiRK2XQalplNatOBEb/KYFsHIwExwL6yRbMFGJE3wM=;
 b=MwyJ19UWzC+Pf0msQxz6w7piIDp6lQKM0eCRS8dIa/hubiXHjEbIQoH+tPHtxvrr3h
 NIb0yM5jP8gdvOEPj37/w6f0sZqn+1zkXlToxE7+IVcEQ5HswAP1vIkc17faE70wDOkV
 Ul2UWoKw7f5Rtogu4+i1KO00ZxLkwVcbyyJ0nsu6utfr46G3tMehZJqcPY12wPcSPYIu
 EPRVqd4QadOwLAtLh5YRMlmDuBJ2O27QZiOseaIGMULiS9i9yK+BvRGf52FSLf8stV9r
 nTg2y1QP1HIUDTRJCR4+wRdgL4Q61Tlm75FEwsCGg2fhVR1j2y2Tvzi72aE+qM8qMzO0
 Hekg==
X-Gm-Message-State: APjAAAXjH6dGpyMu54t4Oc5joLfL3bONA13vbG+uIEqhGmDXqyE/jmtx
 Z3660NPxsuWbe9iRKgPIdkQ=
X-Google-Smtp-Source: APXvYqyLj/h0C/Xq91dKgaHmn/NP+f3iD/DCfdE8bWiVd/Pzmn8Y696mKlFDH4cYp54f3eUTb6dqVA==
X-Received: by 2002:ac2:46e3:: with SMTP id q3mr26813910lfo.147.1571932046130; 
 Thu, 24 Oct 2019 08:47:26 -0700 (PDT)
Received: from [192.168.2.145] (94-29-10-250.dynamic.spd-mgts.ru.
 [94.29.10.250]) by smtp.googlemail.com with ESMTPSA id
 n25sm10017898ljc.107.2019.10.24.08.47.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Oct 2019 08:47:25 -0700 (PDT)
Subject: Re: [PATCH v1 2/3] drm/tegra: Fix 2d and 3d clients detaching from
 IOMMU domain
To: Thierry Reding <thierry.reding@gmail.com>
References: <20190623173743.24088-1-digetx@gmail.com>
 <20190623173743.24088-2-digetx@gmail.com> <20191024115804.GB2924027@ulmo>
 <45926d95-3e7a-c56b-402a-2b2c6475c5db@gmail.com>
 <20191024135018.GD2924027@ulmo>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <38a67df0-2ede-e7fe-8eca-6c4491cdcc7b@gmail.com>
Date: Thu, 24 Oct 2019 18:47:23 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191024135018.GD2924027@ulmo>
Content-Language: en-US
X-Mailman-Approved-At: Fri, 25 Oct 2019 08:11:50 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=2qiRK2XQalplNatOBEb/KYFsHIwExwL6yRbMFGJE3wM=;
 b=fp/GEoFFGvXB/1uU3XVE6/qPgMOp1c+s2UYjIaj9rVB5/+YiGGPoaBbIY0AvWTvK0s
 KvmvNbx5a5psLlghFzyt7e4CSzJFE02uEszaZwuR9EBkQZOQQ/ktlTZhv9jzaoqdqdj+
 4eqenbSvlB9pfGba1leXkpu4923GjSy/7A/dMFi01FOkguYldlslhVTNjAsSRrjMI6jv
 YMobzrpvhtVT4O5c9Y+3z6x3kgv3seBxgftm141ImaYvjPs9QHLIY7EQlO6LjParXCeh
 nE5FCptY2WpylnDn2ZhVKeeniH+Cuf2V0mog7PmmVqbpZ+LRCraF7U+qxgSUgA7EYCT1
 iyDw==
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

MjQuMTAuMjAxOSAxNjo1MCwgVGhpZXJyeSBSZWRpbmcg0L/QuNGI0LXRgjoKPiBPbiBUaHUsIE9j
dCAyNCwgMjAxOSBhdCAwNDoyODo0MVBNICswMzAwLCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4+
IDI0LjEwLjIwMTkgMTQ6NTgsIFRoaWVycnkgUmVkaW5nINC/0LjRiNC10YI6Cj4+PiBPbiBTdW4s
IEp1biAyMywgMjAxOSBhdCAwODozNzo0MlBNICswMzAwLCBEbWl0cnkgT3NpcGVua28gd3JvdGU6
Cj4+Pj4gVGhpcyBzaG91bGQgc2hvdWxkIGZpcmUgdXAgb24gdGhlIERSTSdzIGRyaXZlciBtb2R1
bGUgcmUtbG9hZGVyIGJlY2F1c2UKPj4+PiB0aGVyZSB3b24ndCBiZSBlbm91Z2ggYXZhaWxhYmxl
IGRvbWFpbnMgb24gb2xkZXIgVGVncmEgU29Dcy4KPj4+Pgo+Pj4+IENjOiBzdGFibGUgPHN0YWJs
ZUB2Z2VyLmtlcm5lbC5vcmc+Cj4+Pj4gRml4ZXM6IDBjNDA3ZGU1ZWQxYSAoImRybS90ZWdyYTog
UmVmYWN0b3IgSU9NTVUgYXR0YWNoL2RldGFjaCIpCj4+Pj4gU2lnbmVkLW9mZi1ieTogRG1pdHJ5
IE9zaXBlbmtvIDxkaWdldHhAZ21haWwuY29tPgo+Pj4+IC0tLQo+Pj4+ICBkcml2ZXJzL2dwdS9k
cm0vdGVncmEvZGMuYyAgIHwgNCArKy0tCj4+Pj4gIGRyaXZlcnMvZ3B1L2RybS90ZWdyYS9kcm0u
YyAgfCA5ICsrKysrKy0tLQo+Pj4+ICBkcml2ZXJzL2dwdS9kcm0vdGVncmEvZHJtLmggIHwgMyAr
Ky0KPj4+PiAgZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2dyMmQuYyB8IDQgKystLQo+Pj4+ICBkcml2
ZXJzL2dwdS9kcm0vdGVncmEvZ3IzZC5jIHwgNCArKy0tCj4+Pj4gIDUgZmlsZXMgY2hhbmdlZCwg
MTQgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pCj4+Pgo+Pj4gSSB0aGluayBJIHVuZGVy
c3RhbmQgd2hhdCB0aGlzIGlzIHRyeWluZyB0byBkbywgYnV0IHRoZSBjb21taXQgbWVzc2FnZQo+
Pj4gZG9lcyBub3QgaGVscCBhdCBhbGwuIFNvIHdoYXQncyByZWFsbHkgZ29pbmcgb24gaGVyZSBp
cyB0aGF0IHdlIG5lZWQgdG8KPj4+IGRldGFjaCB0aGUgZGV2aWNlIGZyb20gdGhlIGdyb3VwIHJl
Z2FyZGxlc3Mgb2Ygd2hldGhlciB3ZSdyZSBzaGFyaW5nIHRoZQo+Pj4gZ3JvdXAgb3Igbm90LCBq
dXN0IGxpa2Ugd2UgYXR0YWNoIGdyb3VwcyB0byB0aGUgc2hhcmVkIGRvbWFpbiB3aGV0aGVyCj4+
PiB0aGV5IHNoYXJlIHRoZSBzYW1lIGdyb3VwIG9yIG5vdC4KPj4KPj4gWWVzLCB0aGUgY29tbWl0
J3MgbWVzc2FnZSBjb3VsZCBiZSBpbXByb3ZlZC4KPj4KPj4+IEJ1dCBpbiB0aGF0IGNhc2UsIEkg
d29uZGVyIGlmIGl0J3MgZXZlbiB3b3J0aCBzcGxpdHRpbmcgZ3JvdXBzIHRoZSB3YXkKPj4+IHdl
IGFyZSByaWdodCBub3cuIFdvdWxkbid0IGl0IGJlIGJldHRlciB0byBqdXN0IHB1dCBhbGwgdGhl
IGRldmljZXMgaW50bwo+Pj4gdGhlIHNhbWUgZ3JvdXAgYW5kIGJlIGRvbmUgd2l0aCBpdD8KPj4+
Cj4+PiBUaGUgY3VycmVudCBjb2RlIGdpdmVzIG1lIGhlYWRhY2hlcyBldmVyeSB0aW1lIEkgcmVh
ZCBpdCwgc28gaWYgd2UgY2FuCj4+PiBqdXN0IG1ha2UgaXQgc28gdGhhdCBhbGwgdGhlIGRldmlj
ZXMgdW5kZXIgdGhlIERSTSBkZXZpY2Ugc2hhcmUgdGhlIHNhbWUKPj4+IGdyb3VwLCB0aGlzIHdv
dWxkIGJlY29tZSBhIGxvdCBlYXNpZXIgdG8gZGVhbCB3aXRoLiBJJ20gbm90IHJlYWxseQo+Pj4g
Y29udmluY2VkIHRoYXQgaXQgbWFrZXMgbXVjaCBzZW5zZSB0byBrZWVwIHRoZW0gb24gc2VwYXJh
dGUgZG9tYWlucywKPj4+IGVzcGVjaWFsbHkgZ2l2ZW4gdGhlIGNvbnN0cmFpbnRzIG9uIHRoZSBu
dW1iZXIgb2YgZG9tYWlucyBhdmFpbGFibGUgb24KPj4+IGVhcmxpZXIgVGVncmEgZGV2aWNlcy4K
Pj4+Cj4+PiBOb3RlIHRoYXQgc2hhcmluZyBhIGdyb3VwIHdpbGwgYWxzbyBtYWtlIGl0IG11Y2gg
ZWFzaWVyIGZvciB0aGVzZSB0byB1c2UKPj4+IHRoZSBETUEgQVBJIGlmIGl0IGlzIGJhY2tlZCBi
eSBhbiBJT01NVS4KPj4KPj4gUHJvYmFibHkgSSdtIGJsYW5raW5nIG9uIGV2ZXJ5dGhpbmcgYWJv
dXQgSU9NTVUgbm93Li4gY291bGQgeW91IHBsZWFzZQo+PiByZW1pbmQgbWUgd2hhdCAiSU9NTVUg
Z3JvdXAiIGlzPwo+Pgo+PiBJc24ndCBpdCB0aGF0IGVhY2ggSU9NTVUgZ3JvdXAgcmVsYXRlcyB0
byB0aGUgSFcgSUQgKFNXR1JPVVApPyBCdXQgdGhlbgo+PiBlYWNoIGRpc3BsYXkgY29udHJvbGxl
ciBoYXMgaXRzIG93biBTV0dST1VQLi4gYW5kIHRodXMgdGhhdCBzaGFyaW5nIGp1c3QKPj4gZG9l
c24ndCBtYWtlIGFueSBzZW5zZSwgaG0uCj4gCj4gSU9NTVUgZ3JvdXBzIGFyZSBub3QgZGlyZWN0
bHkgcmVsYXRlZCB0byBTV0dST1VQcy4gQnV0IGJ5IGRlZmF1bHQgdGhlCj4gSU9NTVUgZnJhbWV3
b3JrIHdpbGwgc2hhcmUgYSBkb21haW4gYmV0d2VlbiBtZW1iZXJzIG9mIHRoZSBzYW1lIElPTU1V
Cj4gZ3JvdXAuCgpBaCwgSSByZS1maWd1cmVkIG91dCB0aGF0IGFnYWluLiBUaGUgbWVtb3J5IGNv
bnRyb2xsZXIgZHJpdmVycyBhcmUKZGVmaW5pbmcgYSBzaW5nbGUgIklPTU1VIGdyb3VwIiBmb3Ig
Ym90aCBvZiB0aGUgZGlzcGxheSBjb250cm9sbGVycy4KCj4gU2VlbXMgbGlrZSB0aGF0J3MgcmVh
bGx5IHdoYXQgd2Ugd2FudCBoZXJlLCBzbyB0aGF0IHdoZW4gd2UgZG8KPiB1c2UgdGhlIERNQSBB
UEksIGFsbCB0aGUgZGV2aWNlcyBwYXJ0IG9mIHRoZSBEUk0gZGV2aWNlIGdldCBhdHRhY2hlZCB0
bwo+IHRoZSBzYW1lIElPTU1VIGRvbWFpbiwgeWV0IGlmIHdlIGRvbid0IHdhbnQgdG8gdXNlIHRo
ZSBETUEgQVBJIHdlIG9ubHkKPiBuZWVkIHRvIGRldGFjaCB0aGUgb25lIGdyb3VwIGZyb20gdGhl
IGJhY2tpbmcuCgpZZXMsIGl0IHNob3VsZCBiZSBva2F5IHRvIHB1dCBhbGwgRFJNIGRldmljZXMg
aW50byB0aGUgc2FtZSBncm91cCwgbGlrZQppdCBpcyBkb25lIG5vdyBmb3IgdGhlIGRpc3BsYXlz
LiBJdCBhbHNvIHNob3VsZCByZXNvbHZlIHByb2JsZW0gd2l0aCB0aGUKZG9tYWlucyBzaG9ydGFn
ZSBvbiBUMzAgc2luY2Ugbm93IHRoZXJlIGFyZSBtYXhpbXVtIDMgZG9tYWlucyBpbiB1c2U6Cmhv
c3QxeCwgZHJtIGFuZCB2ZGUuCgpJIGFjdHVhbGx5IGp1c3QgY2hlY2tlZCB0aGF0IHRoZSBvcmln
aW5hbCBwcm9ibGVtIHN0aWxsIGV4aXN0cwphbmQgdGhpcyBjaGFuZ2Ugc29sdmVzIGl0IGFzIHdl
bGw6CgotLS0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVtb3J5L3RlZ3JhL3RlZ3JhMzAuYyBiL2Ry
aXZlcnMvbWVtb3J5L3RlZ3JhL3RlZ3JhMzAuYwppbmRleCA1YTBmNmUwYTE2NDMuLmU3MTA5NjQ5
ODQzNiAxMDA2NDQKLS0tIGEvZHJpdmVycy9tZW1vcnkvdGVncmEvdGVncmEzMC5jCisrKyBiL2Ry
aXZlcnMvbWVtb3J5L3RlZ3JhL3RlZ3JhMzAuYwpAQCAtMTAyMSw2ICsxMDIxLDkgQEAgc3RhdGlj
IGNvbnN0IHN0cnVjdCB0ZWdyYV9zbW11X3N3Z3JvdXAKdGVncmEzMF9zd2dyb3Vwc1tdID0gewog
c3RhdGljIGNvbnN0IHVuc2lnbmVkIGludCB0ZWdyYTMwX2dyb3VwX2Rpc3BsYXlbXSA9IHsKIAlU
RUdSQV9TV0dST1VQX0RDLAogCVRFR1JBX1NXR1JPVVBfRENCLAorCVRFR1JBX1NXR1JPVVBfRzIs
CisJVEVHUkFfU1dHUk9VUF9OViwKKwlURUdSQV9TV0dST1VQX05WMiwKIH07Cgogc3RhdGljIGNv
bnN0IHN0cnVjdCB0ZWdyYV9zbW11X2dyb3VwX3NvYyB0ZWdyYTMwX2dyb3Vwc1tdID0gewotLS0K
ClBsZWFzZSBsZXQgbWUga25vdyB3aGV0aGVyIHlvdSdyZSBnb2luZyB0byBtYWtlIGEgcGF0Y2gg
b3IgaWYgSSBzaG91bGQKZG8gaXQuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
