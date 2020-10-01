Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC8427F904
	for <lists+dri-devel@lfdr.de>; Thu,  1 Oct 2020 07:25:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB4386E844;
	Thu,  1 Oct 2020 05:25:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com
 [IPv6:2a00:1450:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FE4B6E844
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Oct 2020 05:25:25 +0000 (UTC)
Received: by mail-ej1-x642.google.com with SMTP id p9so6106187ejf.6
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Sep 2020 22:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=vNs0ae89es5vVWd4uKb2jUPSw9iD9/d+IU3Hh0AS6sw=;
 b=ue90jW41LohhqwZg+t7SBjvrYW04Myf4lj8X5UI/bBxW+Pw0IM9wTaczIaTLTbHH5r
 d2zJvgsTnEn3icy9iZWaO9h39I1qrtOytui0hnuqwinSEPQM397SwA6MV1MQ6bWkOEwp
 aixA5yjBT1QXunBv3Yck3RhY9/ECAH46Kihd/p/QlPNe8BSWTNHGChmzPCUC5jT27h5d
 wd5FQoBouALurznet7erEaDKXTgIkrvmRrrHjU4UjGqrpjAlOSmU308wY3sT7JuMBwOQ
 aOwH+Si8NIIEmvmZCbFlv4eyMhl5UF9ugjrfjqh5uP6ZNkR3iGHs/f5Yv8lmDknxpysf
 rQeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=vNs0ae89es5vVWd4uKb2jUPSw9iD9/d+IU3Hh0AS6sw=;
 b=di5uvMZMMYpnoZOy6TuyF4/50oqctck8lQJysuwlyqEysYKWEIT9HQXGvJr9jsnUT9
 frIT+Qk97uge2OuyjuiQXGY6iFUfc3WIk4QPG6HV18CWTvr34Yn3eIcxikXTDrtLBour
 IAfgB4y7mYES0dWJRNgeHXEzgnDa9bVywq9kdk+0Ux8Gj2qupWUITYYUwIj1jAFYsE6j
 U7QQ6m7+a6Fwu1CADi7AtT5fE0PDISlCgNqUqr8OoiYxYMEmbcWHW+YxL4JDIEnWJhsW
 4qN217cPv8/GuNfs+s30lH195yc5yKgx7q0VR8F/3n59gKNWILUJfm+lRs3QFAI27K5c
 gJyQ==
X-Gm-Message-State: AOAM530P4JY8GT4l5BKsfxKlszPDN0aT54XEQQdNQtqE6vP0dS0QtKvL
 0vjeoqOgWHlSgtdc+XqzflrWj/mTeYhE5m9c9Ig=
X-Google-Smtp-Source: ABdhPJwr/24YrpuKzHHqIaP32n/RTj4pwxNAjcfpwmRmBFc6w0Kh5Exil2tWFwIGLXBVYutC2P5AlnymzahDQkQkYm0=
X-Received: by 2002:a17:906:3aca:: with SMTP id
 z10mr6191477ejd.419.1601529924463; 
 Wed, 30 Sep 2020 22:25:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200930055459.31310-1-airlied@gmail.com>
 <CAPM=9txdYB4WPaXZGZ1XO-s_9BHjv===-QGvW+-N405T1_RsDQ@mail.gmail.com>
 <CAPM=9tzdT8suD5PZJGrWMM-kOSYYcvA3ZP2y=muZoQ6gNyJkRQ@mail.gmail.com>
 <7fe46260-95ed-114d-940b-0512f39b857d@amd.com>
In-Reply-To: <7fe46260-95ed-114d-940b-0512f39b857d@amd.com>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 1 Oct 2020 15:25:13 +1000
Message-ID: <CAPM=9tzsY7a2iQbdBo7c3zVuV8WVzaGrxzaNce_4dC8n2fQGng@mail.gmail.com>
Subject: Re: [PATCH] drm/ttm: fix regression in ttm moves
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: Dave Airlie <airlied@redhat.com>, Huang Rui <ray.huang@amd.com>,
 Roland Scheidegger <sroland@vmware.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VHJhY2tlZCBpdCBkb3duIHRvIG15IGluaXQgbWVtIHR5cGUgY2hhbmdlcywgcGF0Y2ggaXMgb24g
dGhlIGxpc3QuCgpEYXZlLgoKT24gV2VkLCAzMCBTZXAgMjAyMCBhdCAxODoyOCwgQ2hyaXN0aWFu
IEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPiB3cm90ZToKPgo+IFRoYXQgc291bmRz
IGxpa2UgdGhlIHNhbWUgcHJvYmxlbSBJJ3ZlIGdvdCB3aGVuIGRybS1uZXh0IHdhcyBtZXJnZWQg
aW50bwo+IGRybS1taXNjLW5leHQuCj4KPiBJJ3ZlIGZpeGVkIGl0IGluIHRoaXMgY29tbWl0Ogo+
Cj4gY29tbWl0IDBiMDYyODY1NzliODE0NDliMWU4ZjE0Zjg4ZDNhOGRiMDkxZmQ0NDMKPiBBdXRo
b3I6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KPiBEYXRlOiAg
IFdlZCBBdWcgMTkgMTU6Mjc6NDggMjAyMCArMDIwMAo+Cj4gICAgICBkcm0vdHRtOiBmaXggYnJv
a2VuIG1lcmdlIGJldHdlZW4gZHJtLW5leHQgYW5kIGRybS1taXNjLW5leHQKPgo+ICAgICAgZHJt
LW5leHQgcmV2ZXJ0ZWQgdGhlIGNoYW5nZXMgdG8gdHRtX3R0X2NyZWF0ZSgpIHRvIGRvIHRoZQo+
ICAgICAgTlVMTCBjaGVjayBpbnNpZGUgdGhlIGZ1bmN0aW9uLCBidXQgZHJtLW1pc2MtbmV4dCBh
ZGRzIG5ldwo+ICAgICAgdXNlcnMgb2YgdGhpcyBhcHByb2FjaC4KPgo+ICAgICAgUmUtYXBwbHkg
dGhlIE5VTEwgY2hlY2sgY2hhbmdlIGluc2lkZSB0aGUgZnVuY3Rpb24gdG8gZml4IHRoaXMuCj4K
PiAgICAgIFNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdA
YW1kLmNvbT4KPiAgICAgIFJldmlld2VkLWJ5OiBEYXZlIEFpcmxpZSA8YWlybGllZEByZWRoYXQu
Y29tPgo+ICAgICAgTGluazogaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3BhdGNo
LzM4NjYyOC8KPgo+Cj4gTm90IHN1cmUgd2h5IGl0IHNob3VsZCBjYXVzZSBwcm9ibGVtcyB3aXRo
IGRybS1maXhlcyBhbmQgZHJtLW5leHQgYXMgd2VsbC4KPgo+IFJlZ2FyZHMsCj4gQ2hyaXN0aWFu
Lgo+Cj4gQW0gMzAuMDkuMjAgdW0gMDk6MDkgc2NocmllYiBEYXZlIEFpcmxpZToKPiA+IGp1c3Qg
RllJIEknbSBzZWVpbmcgYSByZWdyZXNzaW9uIG9uIHZtd2dmeCB3aXRoIGRybS1maXhlcyBhbmQg
ZHJtLW5leHQKPiA+IG1lcmdlZCBpbnRvIGl0Lgo+ID4KPiA+IEknbSBnb2luZyB0YWtlIHNvbWUg
dGltZSB0byBkaWcgdGhyb3VnaCBhbmQgd29yayBvdXQgd2hlcmUsIHRoZQo+ID4gcmVncmVzc2lv
biBpcyBhIGNvbW1hbmQgZmFpbHVyZSBhbmQgYSBpb3JlbWFwIGZhaWx1cmUuCj4gPgo+ID4gRGF2
ZS4KPiA+Cj4gPiBPbiBXZWQsIDMwIFNlcCAyMDIwIGF0IDE2OjI2LCBEYXZlIEFpcmxpZSA8YWly
bGllZEBnbWFpbC5jb20+IHdyb3RlOgo+ID4+IFVnZ2ggdGhpcyBpcyBwYXJ0IG9mIHRoZSBtZXNz
IHdpdGggdGhlIHJldmVydCwgSSdtIG5vdCBzdXJlIGhvdyBiZXN0Cj4gPj4gdG8gZGlnIG91dCBv
ZiB0aGlzIG9uZSB5ZXQuCj4gPj4KPiA+PiBEYXZlLgo+ID4+Cj4gPj4gT24gV2VkLCAzMCBTZXAg
MjAyMCBhdCAxNTo1NSwgRGF2ZSBBaXJsaWUgPGFpcmxpZWRAZ21haWwuY29tPiB3cm90ZToKPiA+
Pj4gRnJvbTogRGF2ZSBBaXJsaWUgPGFpcmxpZWRAcmVkaGF0LmNvbT4KPiA+Pj4KPiA+Pj4gVGhp
cyBmaXhlcyBhIGJ1ZyBpbnRyb2R1Y2VkIGluIGJlMTIxM2EzNDFhMjg5YWZjNTFmODkxODFjMzEw
ZTM2OGZiYTBiNjYKPiA+Pj4gZHJtL3R0bTogcmVtb3ZlIFRUTV9NRU1UWVBFX0ZMQUdfRklYRUQg
djIKPiA+Pj4KPiA+Pj4gT24gdm13Z2Z4IHRoaXMgY2F1c2VzIGEgQ29tbWFuZCBidWZmZXIgZXJy
b3IgV0FSTiB0byB0cmlnZ2VyLgo+ID4+Pgo+ID4+PiBUaGlzIGlzIGJlY2F1c2UgdGhlIG9sZCBj
b2RlIHVzZWQgdG8gY2hlY2sgaWYgYm8tPnR0bSB3YXMgdHJ1ZSwKPiA+Pj4gYW5kIHRoZSBuZXcg
Y29kZSBkb2Vzbid0LCBmaXggaXQgY29kZSB0byBhZGQgYmFjayB0aGUgY2hlY2sgcmVzb2x2ZXMK
PiA+Pj4gdGhlIGlzc3VlLgo+ID4+Pgo+ID4+PiBGaXhlczogYmUxMjEzYTM0MWEyICgiZHJtL3R0
bTogcmVtb3ZlIFRUTV9NRU1UWVBFX0ZMQUdfRklYRUQgdjIiKQo+ID4+PiBTaWduZWQtb2ZmLWJ5
OiBEYXZlIEFpcmxpZSA8YWlybGllZEByZWRoYXQuY29tPgo+ID4+PiAtLS0KPiA+Pj4gICBkcml2
ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jIHwgOCArKysrKy0tLQo+ID4+PiAgIDEgZmlsZSBjaGFu
Z2VkLCA1IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4gPj4+Cj4gPj4+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90
dG1fYm8uYwo+ID4+PiBpbmRleCA3MGIzYmVlMjc4NTAuLmU4YWEyZmU4ZTlkMSAxMDA2NDQKPiA+
Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYwo+ID4+PiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vdHRtL3R0bV9iby5jCj4gPj4+IEBAIC0yNTEsOSArMjUxLDExIEBAIHN0YXRpYyBp
bnQgdHRtX2JvX2hhbmRsZV9tb3ZlX21lbShzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLAo+
ID4+PiAgICAgICAgICAgICAgICAgIC8qIFplcm8gaW5pdCB0aGUgbmV3IFRUTSBzdHJ1Y3R1cmUg
aWYgdGhlIG9sZCBsb2NhdGlvbiBzaG91bGQKPiA+Pj4gICAgICAgICAgICAgICAgICAgKiBoYXZl
IHVzZWQgb25lIGFzIHdlbGwuCj4gPj4+ICAgICAgICAgICAgICAgICAgICovCj4gPj4+IC0gICAg
ICAgICAgICAgICByZXQgPSB0dG1fdHRfY3JlYXRlKGJvLCBvbGRfbWFuLT51c2VfdHQpOwo+ID4+
PiAtICAgICAgICAgICAgICAgaWYgKHJldCkKPiA+Pj4gLSAgICAgICAgICAgICAgICAgICAgICAg
Z290byBvdXRfZXJyOwo+ID4+PiArICAgICAgICAgICAgICAgaWYgKCFiby0+dHRtKSB7Cj4gPj4+
ICsgICAgICAgICAgICAgICAgICAgICAgIHJldCA9IHR0bV90dF9jcmVhdGUoYm8sIG9sZF9tYW4t
PnVzZV90dCk7Cj4gPj4+ICsgICAgICAgICAgICAgICAgICAgICAgIGlmIChyZXQpCj4gPj4+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZ290byBvdXRfZXJyOwo+ID4+PiArICAgICAg
ICAgICAgICAgfQo+ID4+Pgo+ID4+PiAgICAgICAgICAgICAgICAgIHJldCA9IHR0bV90dF9zZXRf
cGxhY2VtZW50X2NhY2hpbmcoYm8tPnR0bSwgbWVtLT5wbGFjZW1lbnQpOwo+ID4+PiAgICAgICAg
ICAgICAgICAgIGlmIChyZXQpCj4gPj4+IC0tCj4gPj4+IDIuMjAuMQo+ID4+Pgo+ID4+PiBfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4+PiBkcmktZGV2
ZWwgbWFpbGluZyBsaXN0Cj4gPj4+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiA+
Pj4gaHR0cHM6Ly9uYW0xMS5zYWZlbGlua3MucHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0
dHBzJTNBJTJGJTJGbGlzdHMuZnJlZWRlc2t0b3Aub3JnJTJGbWFpbG1hbiUyRmxpc3RpbmZvJTJG
ZHJpLWRldmVsJmFtcDtkYXRhPTAyJTdDMDElN0NjaHJpc3RpYW4ua29lbmlnJTQwYW1kLmNvbSU3
Q2E4ZTUxZGNlMWIxMzQ2MDE1YzFlMDhkODY1MGZkYzU5JTdDM2RkODk2MWZlNDg4NGU2MDhlMTFh
ODJkOTk0ZTE4M2QlN0MwJTdDMCU3QzYzNzM3MDQ2NjA4NTUwNzAxMyZhbXA7c2RhdGE9UXJ0U2dm
a21TcE5jTmZkSjcxWU5BVFMwVVJ5RWNNTkxlTVZtT2VuUnBhayUzRCZhbXA7cmVzZXJ2ZWQ9MAo+
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
