Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83FC0314EF
	for <lists+dri-devel@lfdr.de>; Fri, 31 May 2019 20:50:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22C4C8986D;
	Fri, 31 May 2019 18:50:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF2D689862;
 Fri, 31 May 2019 18:50:24 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id x25so3759554eds.8;
 Fri, 31 May 2019 11:50:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9F1WuqVm5Nwgt2J2M3yybMSAaWZKrJwC/jdTGtkMibQ=;
 b=s5CEntA1Rz2bobJwGV1a0KqtfRwGIWaawJm1pfk45fXCP9+qH+srlhxqtioSRFmbdS
 tFtgjla/FTW67bV5XbFDTvm2Aj1mrkFzV0m9fXADBuPLaGLHynKjBw3fSK8OK7r9hYIA
 Mm+764i8hfoHUImqJFXCwryY3xTaaXu1uwtVIi/et+pJeahk3TKEtrgEGPTJ8QwiCs6e
 RJ3qpmIEV3SqFNiONOvw85Iic0EyUvi0XjgUYdNFR58ibqMOReXzQEDvpvDraff+aEEu
 oWVI27ie6XOjiPlIo1bkir654Von+j5GqWe+lcsLF5WZiHGkh3L9LCUZT24iPn4oI5+G
 nvUA==
X-Gm-Message-State: APjAAAXz+m5u11Xc+Vq2RKDRHYA6UUl9ujfsgf9IZ+/d2vQ2CHJW6gkw
 OaqU8+aVtCqX5is9JgKt8A4jArNbB2avnj4eDXA=
X-Google-Smtp-Source: APXvYqzPMqyWQ+/oc5RiQ0JtssEbM6wdvalwO7IL3dmiggPgXl4aCaKyvkmw+wPethuMjUFG0dLNSwtXsRd8qIV8JHw=
X-Received: by 2002:a50:bc15:: with SMTP id j21mr13082718edh.163.1559328623286; 
 Fri, 31 May 2019 11:50:23 -0700 (PDT)
MIME-Version: 1.0
References: <20190314002027.7833-1-helen.koike@collabora.com>
 <20190314002027.7833-4-helen.koike@collabora.com>
 <c591d04c-a7f8-f64b-aff9-4a79b61356e7@koikeco.de>
In-Reply-To: <c591d04c-a7f8-f64b-aff9-4a79b61356e7@koikeco.de>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 31 May 2019 11:50:09 -0700
Message-ID: <CAF6AEGsRzgqNPPuNTopiqXWXQ8GLd1Zi2DsWZFQQ5PuCsDnmBA@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] drm/msm: fix fb references in async update
To: Helen Koike <helen@koikeco.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=9F1WuqVm5Nwgt2J2M3yybMSAaWZKrJwC/jdTGtkMibQ=;
 b=i/FN5emthvipoIzFp3zGS9/f6xBcQBDTkQ7GC/lmQe0TwDLTHCS3IgiVtCQRBB44uB
 6WEp7SwcJyAqdjMEYkv19i0jR/gVwbKMEhj2oMHnhpkKRJZ5d0RmumzwB+qOHE1anNKc
 0EoAj2WEuDVIMfXdkxJ3IGB25hWm23hdRd/FWTJFpXyho+ouicbkZl4TX2nNirMfcJ64
 mai4mjwMYtQ6nXS7rThoZY8t1lc4IYhFlbouzCfip/E3hE+7kuTzGaxnhDM8chWESfLK
 33z4dteGs8q9xfQWTk8CUAzFuf3deuNaSOza9pxhkogn2H2EOi/hLl8Wobn2pzywPjxr
 xrfA==
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
Cc: Sean Paul <sean@poorly.run>,
 =?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu@google.com>,
 Sean Paul <seanpaul@google.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Tomasz Figa <tfiga@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 Helen Koike <helen.koike@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Mamta Shukla <mamtashukla555@gmail.com>, stable <stable@vger.kernel.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, kernel@collabora.com,
 nicholas.kazlauskas@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBNYXkgMzEsIDIwMTkgYXQgMTA6NTQgQU0gSGVsZW4gS29pa2UgPGhlbGVuQGtvaWtl
Y28uZGU+IHdyb3RlOgo+Cj4gSGVsbG8sCj4KPiBPbiAzLzEzLzE5IDk6MjAgUE0sIEhlbGVuIEtv
aWtlIHdyb3RlOgo+ID4gQXN5bmMgdXBkYXRlIGNhbGxiYWNrcyBhcmUgZXhwZWN0ZWQgdG8gc2V0
IHRoZSBvbGRfZmIgaW4gdGhlIG5ld19zdGF0ZQo+ID4gc28gcHJlcGFyZS9jbGVhbnVwIGZyYW1l
YnVmZmVycyBhcmUgYmFsYW5jZWQuCj4gPgo+ID4gQ2M6IDxzdGFibGVAdmdlci5rZXJuZWwub3Jn
PiAjIHY0LjE0Kwo+ID4gRml4ZXM6IDIyNGE0Yzk3MDk4NyAoImRybS9tc206IHVwZGF0ZSBjdXJz
b3JzIGFzeW5jaHJvbm91c2x5IHRocm91Z2ggYXRvbWljIikKPiA+IFN1Z2dlc3RlZC1ieTogQm9y
aXMgQnJlemlsbG9uIDxib3Jpcy5icmV6aWxsb25AY29sbGFib3JhLmNvbT4KPiA+IFNpZ25lZC1v
ZmYtYnk6IEhlbGVuIEtvaWtlIDxoZWxlbi5rb2lrZUBjb2xsYWJvcmEuY29tPgoKVGhhbmtzLCBJ
J20gbm90IHN1cGVyIGhhcHB5IGFib3V0IHRoZSByZWZjbnQnaW5nIHN1YnRsZW5lc3MgaGVyZQoo
bW9zdGx5IGJlY2F1c2UgaXQgbWFrZXMgaXQgaGFyZGVyIHRvIHBhZ2UgaW4gaG93IHRoaW5ncyB3
b3JrIG9uCmtlcm5lbC9kaXNwbGF5IHNpZGUgYWZ0ZXIgc3BlbmRpbmcgbW9zdCBvZiBteSB0aW1l
IGluIHVzZXJzcGFjZS9tZXNhKSwKYnV0IEkgZG9uJ3Qgd2FudCB0byBob2xkIHRoaXMgdXAuLgoK
QWNrZWQtYnk6IFJvYiBDbGFyayA8cm9iZGNsYXJrQGdtYWlsLmNvbT4KCj4gPgo+ID4gLS0tCj4g
PiBIZWxsbywKPiA+Cj4gPiBBcyBtZW50aW9uZWQgaW4gdGhlIGNvdmVyIGxldHRlciwKPiA+IEJ1
dCBJIGNvdWxkbid0IHRlc3Qgb24gTVNNIGJlY2F1c2UgSSBkb24ndCBoYXZlIHRoZSBoYXJkd2Fy
ZSBhbmQgSSB3b3VsZAo+ID4gYXBwcmVjaWF0ZSBpZiBhbnlvbmUgY291bGQgdGVzdCBpdC4KPgo+
IEkgZ290IHRoaXMgdGVzdGVkIG9uIGEgZHJhZ29uYm9hcmQgNDEwYywgbm8gcmVncmVzc2lvbnMg
d2hlcmUgZm91bmQgYW5kCj4gbm8gZXh0cmEgd2FybmluZ3MuCj4KPiBUaGVzZSB0d28gdGVzdHMg
d2hlcmUgYWxyZWFkeSBmYWlsaW5nIGZvciBvdGhlciByZWFzb25zOgo+IGZsaXAtdnMtY3Vyc29y
LWNyYy1hdG9taWMKPiBmbGlwLXZzLWN1cnNvci1jcmMtbGVnYWN5Cj4KPiBJZiB5b3Ugd2FudCB0
byBzZWUgdGhlIGZ1bGwgbG9nOgo+Cj4gaHR0cHM6Ly9wZW9wbGUuY29sbGFib3JhLmNvbS9+a29p
a2UvZHJtLWZpeGVzLXJlc3VsdHMuemlwCj4KPiBUaGFua3MKPiBIZWxlbgo+Cj4gPgo+ID4gSW4g
b3RoZXIgcGxhdGZvcm1zIChWQzQsIEFNRCwgUm9ja2NoaXApLCB0aGVyZSBpcyBhIGhpZGRlbgo+
ID4gZHJtX2ZyYW1lYnVmZmVyX2dldChuZXdfZmIpL2RybV9mcmFtZWJ1ZmZlcl9wdXQob2xkX2Zi
KSBpbiBhc3luY191cGRhdGUKPiA+IHRoYXQgaXMgd3JvbmcsIGJ1dCBJIGNvdWxkbid0IGlkZW50
aWZ5IHRob3NlIGhlcmUsIG5vdCBzdXJlIGlmIGl0IGlzIGhpZGRlbgo+ID4gc29tZXdoZXJlIGVs
c2UsIGJ1dCBpZiB0ZXN0cyBmYWlsIHRoaXMgaXMgcHJvYmFibHkgdGhlIGNhdXNlLgo+ID4KPiA+
IFRoYW5rcyEKPiA+IEhlbGVuCj4gPgo+ID4gQ2hhbmdlcyBpbiB2MzogTm9uZQo+ID4gQ2hhbmdl
cyBpbiB2MjoKPiA+IC0gdXBkYXRlIENDIHN0YWJsZSBhbmQgRml4ZXMgdGFnCj4gPgo+ID4gIGRy
aXZlcnMvZ3B1L2RybS9tc20vZGlzcC9tZHA1L21kcDVfcGxhbmUuYyB8IDQgKysrKwo+ID4gIDEg
ZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL21zbS9kaXNwL21kcDUvbWRwNV9wbGFuZS5jIGIvZHJpdmVycy9ncHUvZHJtL21z
bS9kaXNwL21kcDUvbWRwNV9wbGFuZS5jCj4gPiBpbmRleCBiZTEzMTQwOTY3YjQuLmI4NTRmNDcx
ZTllNSAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9tZHA1L21kcDVf
cGxhbmUuYwo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL21kcDUvbWRwNV9wbGFu
ZS5jCj4gPiBAQCAtNTAyLDYgKzUwMiw4IEBAIHN0YXRpYyBpbnQgbWRwNV9wbGFuZV9hdG9taWNf
YXN5bmNfY2hlY2soc3RydWN0IGRybV9wbGFuZSAqcGxhbmUsCj4gPiAgc3RhdGljIHZvaWQgbWRw
NV9wbGFuZV9hdG9taWNfYXN5bmNfdXBkYXRlKHN0cnVjdCBkcm1fcGxhbmUgKnBsYW5lLAo+ID4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgZHJtX3BsYW5l
X3N0YXRlICpuZXdfc3RhdGUpCj4gPiAgewo+ID4gKyAgICAgc3RydWN0IGRybV9mcmFtZWJ1ZmZl
ciAqb2xkX2ZiID0gcGxhbmUtPnN0YXRlLT5mYjsKPiA+ICsKPiA+ICAgICAgIHBsYW5lLT5zdGF0
ZS0+c3JjX3ggPSBuZXdfc3RhdGUtPnNyY194Owo+ID4gICAgICAgcGxhbmUtPnN0YXRlLT5zcmNf
eSA9IG5ld19zdGF0ZS0+c3JjX3k7Cj4gPiAgICAgICBwbGFuZS0+c3RhdGUtPmNydGNfeCA9IG5l
d19zdGF0ZS0+Y3J0Y194Owo+ID4gQEAgLTUyNCw2ICs1MjYsOCBAQCBzdGF0aWMgdm9pZCBtZHA1
X3BsYW5lX2F0b21pY19hc3luY191cGRhdGUoc3RydWN0IGRybV9wbGFuZSAqcGxhbmUsCj4gPgo+
ID4gICAgICAgKnRvX21kcDVfcGxhbmVfc3RhdGUocGxhbmUtPnN0YXRlKSA9Cj4gPiAgICAgICAg
ICAgICAgICp0b19tZHA1X3BsYW5lX3N0YXRlKG5ld19zdGF0ZSk7Cj4gPiArCj4gPiArICAgICBu
ZXdfc3RhdGUtPmZiID0gb2xkX2ZiOwo+ID4gIH0KPiA+Cj4gPiAgc3RhdGljIGNvbnN0IHN0cnVj
dCBkcm1fcGxhbmVfaGVscGVyX2Z1bmNzIG1kcDVfcGxhbmVfaGVscGVyX2Z1bmNzID0gewo+ID4K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
