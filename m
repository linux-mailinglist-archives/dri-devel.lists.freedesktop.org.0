Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D9911700E8
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2020 15:15:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7880F6E2D3;
	Wed, 26 Feb 2020 14:15:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D10E66E2D3;
 Wed, 26 Feb 2020 14:15:31 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id e8so3225802wrm.5;
 Wed, 26 Feb 2020 06:15:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=mdMg8Sa+YDOHuSHW5grLYYtS/WDgI37EbCoL+QmiyVM=;
 b=VBzMZvGYHbqZB0uvESRd13igVB+JjRyBuFugZp+9w4T9OyBokFw88rXNA0M6lxyhZR
 QxtiSNV8vJ72G82vrF3OEFtaqmyXY2/KtOJcfCmPhXjuDRwmR389PbAt6OfIas9NwELg
 MysBCsHkBX7qMdnEeWCaBYtRJSFz+A4qubXnj3J8cLgixlB9vCFPOLssdibgZdQ6pX9K
 bg5k5A+3EirU0lBePXIxEaH0sUOMNKTEI6dW9/HSreXQ99j56XHUibelUGm5hUrPyR35
 GOMeCuunWHZKaD5WBm2UZw6rOJ9Iz6WBATNTCNEBtf3iu2I12R47LUTfzq+bTsf+F29f
 hRrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=mdMg8Sa+YDOHuSHW5grLYYtS/WDgI37EbCoL+QmiyVM=;
 b=i9Csimyo3K9WXISvuzCOnhMuontJ+o1HeGjAz+c5vzXWVjvfn4Psur4aWjhr5oU2R0
 x1cW3JYEApoCk5NdUmzryAjfN3AK5kby73U50l/voel2IIWMtDG+JoKuXesFg/Inbz+H
 3Q10CAXFru8eRc5SrlznVfM4QjnWHvHR7XW1YzY2ifikmw3IIG/yJxRubzEZOOD9Q0XO
 5f31lJ/VwznVK8EX4dQ8Al/8a9GG0ym/G933UNmMQ8TMmr33TJQbV4CWFnjL9BoGb5ij
 0g9tTSRvl493wP4ufDdrfqBCXCeG4/pOnVQp8VLnbDPZj/1JPhgL34qY7RtG4BGH+6Ct
 NUVQ==
X-Gm-Message-State: APjAAAXX2Jc3L1sJLkUwx4p8FJ/R1/SDmDvS8HltRY/X9f+c0ZZwnDqw
 6Ann0Z8Qo2vBH3EqlF4aGuH+kAv/+ecivgXhfc4=
X-Google-Smtp-Source: APXvYqwPDLbSc29UNVgVFnv8aU7kruYNL8trd+HrJkooAtovAv/U9DjGeXVwPxf5VmgHGNNWeUGn7CYIDZptZBcbyBU=
X-Received: by 2002:adf:8b59:: with SMTP id v25mr6067744wra.419.1582726530460; 
 Wed, 26 Feb 2020 06:15:30 -0800 (PST)
MIME-Version: 1.0
References: <20200225185614.1058688-1-alexander.deucher@amd.com>
 <0e6fa597-62c4-3dd3-27bf-fa5ddd6ec1a4@gmail.com>
 <CADnq5_Ox=8+drn8TKSYoo6iCF9fQK6rCtD+uRQSFH3qqGQgO9A@mail.gmail.com>
 <42760da2-ad4f-4bc1-ca25-d176fb94a52d@amd.com>
 <33f5a17b-c2f3-1a56-276d-675c520a83fc@gmail.com>
In-Reply-To: <33f5a17b-c2f3-1a56-276d-675c520a83fc@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 26 Feb 2020 09:15:19 -0500
Message-ID: <CADnq5_PcQ2xEpPOjDPK2K0ABgZsHw8YBCBAD6Kr-aK82hhykfw@mail.gmail.com>
Subject: Re: [PATCH] drm/ttm: fix leaking fences via ttm_buffer_object_transfer
To: Christian Koenig <christian.koenig@amd.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Ahzo <Ahzo@tutanota.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBGZWIgMjYsIDIwMjAgYXQgODozMCBBTSBDaHJpc3RpYW4gS8O2bmlnCjxja29lbmln
LmxlaWNodHp1bWVya2VuQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBBbSAyNS4wMi4yMCB1bSAyMDox
MiBzY2hyaWViIENocmlzdGlhbiBLw7ZuaWc6Cj4gPiBBbSAyNS4wMi4yMCB1bSAyMDoxMSBzY2hy
aWViIEFsZXggRGV1Y2hlcjoKPiA+PiBPbiBUdWUsIEZlYiAyNSwgMjAyMCBhdCAyOjA5IFBNIENo
cmlzdGlhbiBLw7ZuaWcKPiA+PiA8Y2tvZW5pZy5sZWljaHR6dW1lcmtlbkBnbWFpbC5jb20+IHdy
b3RlOgo+ID4+PiBBbSAyNS4wMi4yMCB1bSAxOTo1NiBzY2hyaWViIEFsZXggRGV1Y2hlcjoKPiA+
Pj4+IEZyb206IEFoem8gPEFoem9AdHV0YW5vdGEuY29tPgo+ID4+Pj4KPiA+Pj4+IFNldCB0aGUg
ZHJtX2RldmljZSB0byBOVUxMLCBzbyB0aGF0IHRoZSBuZXdseSBjcmVhdGVkIGJ1ZmZlciBvYmpl
Y3QKPiA+Pj4+IGRvZXNuJ3QgYXBwZWFyIHRvIHVzZSB0aGUgZW1iZWRkZWQgZ2VtIG9iamVjdC4K
PiA+Pj4+Cj4gPj4+PiBUaGlzIGlzIG5lY2Vzc2FyeSwgYmVjYXVzZSBvdGhlcndpc2Ugbm8gY29y
cmVzcG9uZGluZyBkbWFfcmVzdl9maW5pCj4gPj4+PiBmb3IKPiA+Pj4+IHRoZSBkbWFfcmVzdl9p
bml0IGlzIGNhbGxlZCwgcmVzdWx0aW5nIGluIGEgbWVtb3J5IGxlYWsuCj4gPj4+Pgo+ID4+Pj4g
VGhlIGRtYV9yZXN2X2ZpbmkgaW4gdHRtX2JvX3JlbGVhc2VfbGlzdCBpcyBvbmx5IGNhbGxlZCBp
ZiB0aGUKPiA+Pj4+IGVtYmVkZGVkCj4gPj4+PiBnZW0gb2JqZWN0IGlzIG5vdCB1c2VkLCB3aGlj
aCBpcyBkZXRlcm1pbmVkIGJ5IGNoZWNraW5nIGlmIHRoZQo+ID4+Pj4gZHJtX2RldmljZSBpcyBO
VUxMLgo+ID4+Pj4KPiA+Pj4+IEJ1ZzoKPiA+Pj4+IGh0dHBzOi8vbmFtMTEuc2FmZWxpbmtzLnBy
b3RlY3Rpb24ub3V0bG9vay5jb20vP3VybD1odHRwcyUzQSUyRiUyRmdpdGxhYi5mcmVlZGVza3Rv
cC5vcmclMkZkcm0lMkZhbWQlMkZpc3N1ZXMlMkY5NTgmYW1wO2RhdGE9MDIlN0MwMSU3Q2Nocmlz
dGlhbi5rb2VuaWclNDBhbWQuY29tJTdDYWEzZjc3NGRhMDNlNGRmY2MwOWEwOGQ3YmEyNjgzMDUl
N0MzZGQ4OTYxZmU0ODg0ZTYwOGUxMWE4MmQ5OTRlMTgzZCU3QzAlN0MwJTdDNjM3MTgyNTQ2ODc5
MTQ0MDMwJmFtcDtzZGF0YT1OOFd4WVpaUmo1b2JNVTVTTHYwZ2lvZzBhMXNDWWklMkZvdXhTdVdO
b20wZ3clM0QmYW1wO3Jlc2VydmVkPTAKPiA+Pj4+IEZpeGVzOiAxZTA1M2IxMGJhNjAgKCJkcm0v
dHRtOiB1c2UgZ2VtIHJlc2VydmF0aW9uIG9iamVjdCIpCj4gPj4+PiBTaWduZWQtb2ZmLWJ5OiBB
aHpvIDxBaHpvQHR1dGFub3RhLmNvbT4KPiA+Pj4+IFNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hl
ciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KPiA+Pj4gR29vZCBjYXRjaCBJIHdhcyB0cnlp
bmcgdG8gaHVudCB0aGF0IG9uZSBkb3duIGFzIHdlbGwuCj4gPj4+Cj4gPj4+IFJldmlld2VkLWJ5
OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4gPj4gQ2FuIHlv
dSBhcHBseSBpdCB0byBkcm0tbWlzYz8KPiA+Cj4gPiBTdXJlLCBidXQgbm90IHRvZGF5LiBOZWVk
IHRvIGdldCB0aGUga2lkcyB0byBiZWQuCj4KPiBTbyBqdXN0IHB1c2hlZCB0byBkcm0tbWlzYy1m
aXhlcy4gRG8gd2UgYWxzbyBuZWVkIHRoYXQgb24KPiBhbWQtc3RhZ2luZy1kcm0tbmV4dD8KClN1
cmUuCgpBbGV4Cgo+Cj4gQ2hyaXN0aWFuLgo+Cj4gPgo+ID4gQ2hyaXN0aWFuLgo+ID4KPiA+Pgo+
ID4+IFRoYW5rcywKPiA+Pgo+ID4+IEFsZXgKPiA+Pgo+ID4+Pj4gLS0tCj4gPj4+PiAgICBkcml2
ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib191dGlsLmMgfCAxICsKPiA+Pj4+ICAgIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKQo+ID4+Pj4KPiA+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vdHRtL3R0bV9ib191dGlsLmMKPiA+Pj4+IGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1f
Ym9fdXRpbC5jCj4gPj4+PiBpbmRleCBjOGUzNTlkZWQxZGYuLjQ0YzFlN2FkZmI3YyAxMDA2NDQK
PiA+Pj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvX3V0aWwuYwo+ID4+Pj4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm9fdXRpbC5jCj4gPj4+PiBAQCAtNTE0LDYgKzUx
NCw3IEBAIHN0YXRpYyBpbnQgdHRtX2J1ZmZlcl9vYmplY3RfdHJhbnNmZXIoc3RydWN0Cj4gPj4+
PiB0dG1fYnVmZmVyX29iamVjdCAqYm8sCj4gPj4+PiAgICAgICAgICAgICAgICBmYm8tPmJhc2Uu
YmFzZS5yZXN2ID0gJmZiby0+YmFzZS5iYXNlLl9yZXN2Owo+ID4+Pj4KPiA+Pj4+ICAgICAgICBk
bWFfcmVzdl9pbml0KCZmYm8tPmJhc2UuYmFzZS5fcmVzdik7Cj4gPj4+PiArICAgICBmYm8tPmJh
c2UuYmFzZS5kZXYgPSBOVUxMOwo+ID4+Pj4gICAgICAgIHJldCA9IGRtYV9yZXN2X3RyeWxvY2so
JmZiby0+YmFzZS5iYXNlLl9yZXN2KTsKPiA+Pj4+ICAgICAgICBXQVJOX09OKCFyZXQpOwo+ID4+
Pj4KPiA+Cj4gPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Xwo+ID4gYW1kLWdmeCBtYWlsaW5nIGxpc3QKPiA+IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCj4gPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ft
ZC1nZngKPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
