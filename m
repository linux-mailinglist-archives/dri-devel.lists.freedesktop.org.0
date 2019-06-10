Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E7FD3BB9E
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jun 2019 20:07:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BBAC89151;
	Mon, 10 Jun 2019 18:07:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43AC089154
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2019 18:07:06 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id n2so5434069pgp.11
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2019 11:07:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Qk1teTE+M+IujpCJ4fnOYjeYPWGwjvW8JXrxo/yH0Jc=;
 b=OcstxiV0fMJZdGHDr3HaEW6bAcwmebyeYRkJzJleYPiNiJ/ZfKT9jTVNN1LkRuDjwo
 j3Lei4yZNIM2goAVYRS2ExoLYNTntoZmgLeoT46cm2RHh0Qm9RPmaZKWiLJcG5owERyh
 4NQ8t0WBBLoBGed1Pvf5HV5hD+Y6EycwPv7yzY20PqPnpJw7sGRfKpqMHdBCniMLjcnI
 hNXmMssfFRhHTV2/X6+AeprdFiDTz4Ms2zTVXmaXNSDKyJ+UvEJEN2IXTTuIRpFfsq+p
 IDXIjC5Q5Z3ATMZvlPgnabYj9U0NFV/8+i4xCV6vfEm5lPlKRyFS++jbZw1Y+31LnnEZ
 N/vg==
X-Gm-Message-State: APjAAAUBlMn0FHkPy2AkaM2pJMAn6+/XPhC11FhBRmvJ9qSwbqyhuLBB
 PK6/ohgMP+77Sr6eEWX83tJd7Q==
X-Google-Smtp-Source: APXvYqwpdKpmgyrcHoPqfm2kAKseftWNyRK4QJdbz1OaJAD6dgVCG3NHvWUoe0J25QMfVAkrE6hAGQ==
X-Received: by 2002:a65:6104:: with SMTP id z4mr16749806pgu.319.1560190025622; 
 Mon, 10 Jun 2019 11:07:05 -0700 (PDT)
Received: from www.outflux.net
 (173-164-112-133-Oregon.hfc.comcastbusiness.net. [173.164.112.133])
 by smtp.gmail.com with ESMTPSA id x7sm11154611pfm.82.2019.06.10.11.07.04
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 10 Jun 2019 11:07:04 -0700 (PDT)
Date: Mon, 10 Jun 2019 11:07:03 -0700
From: Kees Cook <keescook@chromium.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH v16 02/16] arm64: untag user pointers in access_ok and
 __uaccess_mask_ptr
Message-ID: <201906101106.3CA50745E3@keescook>
References: <cover.1559580831.git.andreyknvl@google.com>
 <4327b260fb17c4776a1e3c844f388e4948cfb747.1559580831.git.andreyknvl@google.com>
 <20190610175326.GC25803@arrakis.emea.arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190610175326.GC25803@arrakis.emea.arm.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Qk1teTE+M+IujpCJ4fnOYjeYPWGwjvW8JXrxo/yH0Jc=;
 b=bS38Kka2lRnznRWhG8/qOGDxKjllgWQ6UMeG3F2amaGnqe8pK0xiGk3vZdBB3YxIb3
 SWpAwEtE9q/WxIcVXvPngtzttAwOIVkoldUG9+Ng+5o+FvKdQZW1HjakB3VBQBFOd4GH
 8QDt5M3wpL9e9LGdgrn8sofUH/zfBbAJ6Uge8=
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
Cc: Mark Rutland <mark.rutland@arm.com>, kvm@vger.kernel.org,
 Szabolcs Nagy <Szabolcs.Nagy@arm.com>, Will Deacon <will.deacon@arm.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Khalid Aziz <khalid.aziz@oracle.com>, linux-kselftest@vger.kernel.org,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Jacob Bramley <Jacob.Bramley@arm.com>, Leon Romanovsky <leon@kernel.org>,
 linux-rdma@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Dmitry Vyukov <dvyukov@google.com>, Dave Martin <Dave.Martin@arm.com>,
 Evgeniy Stepanov <eugenis@google.com>, linux-media@vger.kernel.org,
 Kevin Brodsky <kevin.brodsky@arm.com>,
 Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
 Andrey Konovalov <andreyknvl@google.com>,
 Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Kostya Serebryany <kcc@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yishai Hadas <yishaih@mellanox.com>, linux-kernel@vger.kernel.org,
 Jens Wiklander <jens.wiklander@linaro.org>, Lee Smith <Lee.Smith@arm.com>,
 Alexander Deucher <Alexander.Deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, enh <enh@google.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Christian Koenig <Christian.Koenig@amd.com>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdW4gMTAsIDIwMTkgYXQgMDY6NTM6MjdQTSArMDEwMCwgQ2F0YWxpbiBNYXJpbmFz
IHdyb3RlOgo+IE9uIE1vbiwgSnVuIDAzLCAyMDE5IGF0IDA2OjU1OjA0UE0gKzAyMDAsIEFuZHJl
eSBLb25vdmFsb3Ygd3JvdGU6Cj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9pbmNsdWRlL2Fz
bS91YWNjZXNzLmggYi9hcmNoL2FybTY0L2luY2x1ZGUvYXNtL3VhY2Nlc3MuaAo+ID4gaW5kZXgg
ZTVkNWYzMWM2ZDM2Li45MTY0ZWNiNWZlY2EgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL2FybTY0L2lu
Y2x1ZGUvYXNtL3VhY2Nlc3MuaAo+ID4gKysrIGIvYXJjaC9hcm02NC9pbmNsdWRlL2FzbS91YWNj
ZXNzLmgKPiA+IEBAIC05NCw3ICs5NCw3IEBAIHN0YXRpYyBpbmxpbmUgdW5zaWduZWQgbG9uZyBf
X3JhbmdlX29rKGNvbnN0IHZvaWQgX191c2VyICphZGRyLCB1bnNpZ25lZCBsb25nIHNpCj4gPiAg
CXJldHVybiByZXQ7Cj4gPiAgfQo+ID4gIAo+ID4gLSNkZWZpbmUgYWNjZXNzX29rKGFkZHIsIHNp
emUpCV9fcmFuZ2Vfb2soYWRkciwgc2l6ZSkKPiA+ICsjZGVmaW5lIGFjY2Vzc19vayhhZGRyLCBz
aXplKQlfX3JhbmdlX29rKHVudGFnZ2VkX2FkZHIoYWRkciksIHNpemUpCj4gCj4gSSdtIGdvaW5n
IHRvIHByb3Bvc2UgYW4gb3B0LWluIG1ldGhvZCBoZXJlIChSRkMgZm9yIG5vdykuIFdlIGNhbid0
IGhhdmUKPiBhIGNoZWNrIGluIHVudGFnZ2VkX2FkZHIoKSBzaW5jZSB0aGlzIGlzIGFscmVhZHkg
dXNlZCB0aHJvdWdob3V0IHRoZQo+IGtlcm5lbCBmb3IgYm90aCB1c2VyIGFuZCBrZXJuZWwgYWRk
cmVzc2VzIChraHdhc2FuKSBidXQgd2UgY2FuIGFkZCBvbmUKPiBpbiBfX3JhbmdlX29rKCkuIFRo
ZSBzYW1lIHByY3RsKCkgb3B0aW9uIHdpbGwgYmUgdXNlZCBmb3IgY29udHJvbGxpbmcKPiB0aGUg
cHJlY2lzZS9pbXByZWNpc2UgbW9kZSBvZiBNVEUgbGF0ZXIgb24uIFdlIGNhbiB1c2UgYSBUSUZf
IGZsYWcgaGVyZQo+IGFzc3VtaW5nIHRoYXQgdGhpcyB3aWxsIGJlIGNhbGxlZCBlYXJseSBvbiBh
bmQgYW55IGNsb25lZCB0aHJlYWQgd2lsbAo+IGluaGVyaXQgdGhpcy4KPiAKPiBBbnl3YXksIGl0
J3MgZWFzaWVyIHRvIHBhc3RlIHNvbWUgZGlmZiB0aGFuIGV4cGxhaW4gYnV0IFZpbmNlbnpvIGNh
bgo+IGZvbGQgdGhlbSBpbnRvIGhpcyBBQkkgcGF0Y2hlcyB0aGF0IHNob3VsZCByZWFsbHkgZ28g
dG9nZXRoZXIgd2l0aAo+IHRoZXNlLiBJIGFkZGVkIGEgY291cGxlIG9mIE1URSBkZWZpbml0aW9u
cyBmb3IgcHJjdGwoKSBhcyBhbiBleGFtcGxlLAo+IG5vdCB1c2VkIGN1cnJlbnRseToKPiAKPiAt
LS0tLS0tLS0tLS0tLS0tLS04PC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLQo+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2luY2x1ZGUvYXNtL3Byb2Nlc3Nvci5o
IGIvYXJjaC9hcm02NC9pbmNsdWRlL2FzbS9wcm9jZXNzb3IuaAo+IGluZGV4IGZjZDBlNjkxYjFl
YS4uMmQ0Y2I3ZTRlZGFiIDEwMDY0NAo+IC0tLSBhL2FyY2gvYXJtNjQvaW5jbHVkZS9hc20vcHJv
Y2Vzc29yLmgKPiArKysgYi9hcmNoL2FybTY0L2luY2x1ZGUvYXNtL3Byb2Nlc3Nvci5oCj4gQEAg
LTMwNyw2ICszMDcsMTAgQEAgZXh0ZXJuIHZvaWQgX19pbml0IG1pbnNpZ3N0a3N6X3NldHVwKHZv
aWQpOwo+ICAvKiBQUl9QQUNfUkVTRVRfS0VZUyBwcmN0bCAqLwo+ICAjZGVmaW5lIFBBQ19SRVNF
VF9LRVlTKHRzaywgYXJnKQlwdHJhdXRoX3ByY3RsX3Jlc2V0X2tleXModHNrLCBhcmcpCj4gIAo+
ICsvKiBQUl9VTlRBR0dFRF9VQUREUiBwcmN0bCAqLwo+ICtpbnQgdW50YWdnZWRfdWFkZHJfc2V0
X21vZGUodW5zaWduZWQgbG9uZyBhcmcpOwo+ICsjZGVmaW5lIFNFVF9VTlRBR0dFRF9VQUREUl9N
T0RFKGFyZykJdW50YWdnZWRfdWFkZHJfc2V0X21vZGUoYXJnKQo+ICsKPiAgLyoKPiAgICogRm9y
IENPTkZJR19HQ0NfUExVR0lOX1NUQUNLTEVBSwo+ICAgKgo+IGRpZmYgLS1naXQgYS9hcmNoL2Fy
bTY0L2luY2x1ZGUvYXNtL3RocmVhZF9pbmZvLmggYi9hcmNoL2FybTY0L2luY2x1ZGUvYXNtL3Ro
cmVhZF9pbmZvLmgKPiBpbmRleCBjMjg1ZDFjZTcxODYuLjg5Y2U3Nzc3M2M0OSAxMDA2NDQKPiAt
LS0gYS9hcmNoL2FybTY0L2luY2x1ZGUvYXNtL3RocmVhZF9pbmZvLmgKPiArKysgYi9hcmNoL2Fy
bTY0L2luY2x1ZGUvYXNtL3RocmVhZF9pbmZvLmgKPiBAQCAtMTAxLDYgKzEwMSw3IEBAIHZvaWQg
YXJjaF9yZWxlYXNlX3Rhc2tfc3RydWN0KHN0cnVjdCB0YXNrX3N0cnVjdCAqdHNrKTsKPiAgI2Rl
ZmluZSBUSUZfU1ZFCQkJMjMJLyogU2NhbGFibGUgVmVjdG9yIEV4dGVuc2lvbiBpbiB1c2UgKi8K
PiAgI2RlZmluZSBUSUZfU1ZFX1ZMX0lOSEVSSVQJMjQJLyogSW5oZXJpdCBzdmVfdmxfb25leGVj
IGFjcm9zcyBleGVjICovCj4gICNkZWZpbmUgVElGX1NTQkQJCTI1CS8qIFdhbnRzIFNTQiBtaXRp
Z2F0aW9uICovCj4gKyNkZWZpbmUgVElGX1VOVEFHR0VEX1VBRERSCTI2Cj4gIAo+ICAjZGVmaW5l
IF9USUZfU0lHUEVORElORwkJKDEgPDwgVElGX1NJR1BFTkRJTkcpCj4gICNkZWZpbmUgX1RJRl9O
RUVEX1JFU0NIRUQJKDEgPDwgVElGX05FRURfUkVTQ0hFRCkKPiBAQCAtMTE2LDYgKzExNyw3IEBA
IHZvaWQgYXJjaF9yZWxlYXNlX3Rhc2tfc3RydWN0KHN0cnVjdCB0YXNrX3N0cnVjdCAqdHNrKTsK
PiAgI2RlZmluZSBfVElGX0ZTQ0hFQ0sJCSgxIDw8IFRJRl9GU0NIRUNLKQo+ICAjZGVmaW5lIF9U
SUZfMzJCSVQJCSgxIDw8IFRJRl8zMkJJVCkKPiAgI2RlZmluZSBfVElGX1NWRQkJKDEgPDwgVElG
X1NWRSkKPiArI2RlZmluZSBfVElGX1VOVEFHR0VEX1VBRERSCSgxIDw8IFRJRl9VTlRBR0dFRF9V
QUREUikKPiAgCj4gICNkZWZpbmUgX1RJRl9XT1JLX01BU0sJCShfVElGX05FRURfUkVTQ0hFRCB8
IF9USUZfU0lHUEVORElORyB8IFwKPiAgCQkJCSBfVElGX05PVElGWV9SRVNVTUUgfCBfVElGX0ZP
UkVJR05fRlBTVEFURSB8IFwKPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9pbmNsdWRlL2FzbS91
YWNjZXNzLmggYi9hcmNoL2FybTY0L2luY2x1ZGUvYXNtL3VhY2Nlc3MuaAo+IGluZGV4IDkxNjRl
Y2I1ZmVjYS4uNTRmNWJiYWViYmM0IDEwMDY0NAo+IC0tLSBhL2FyY2gvYXJtNjQvaW5jbHVkZS9h
c20vdWFjY2Vzcy5oCj4gKysrIGIvYXJjaC9hcm02NC9pbmNsdWRlL2FzbS91YWNjZXNzLmgKPiBA
QCAtNzMsNiArNzMsOSBAQCBzdGF0aWMgaW5saW5lIHVuc2lnbmVkIGxvbmcgX19yYW5nZV9vayhj
b25zdCB2b2lkIF9fdXNlciAqYWRkciwgdW5zaWduZWQgbG9uZyBzaQo+ICB7Cj4gIAl1bnNpZ25l
ZCBsb25nIHJldCwgbGltaXQgPSBjdXJyZW50X3RocmVhZF9pbmZvKCktPmFkZHJfbGltaXQ7Cj4g
IAo+ICsJaWYgKHRlc3RfdGhyZWFkX2ZsYWcoVElGX1VOVEFHR0VEX1VBRERSKSkKPiArCQlhZGRy
ID0gdW50YWdnZWRfYWRkcihhZGRyKTsKPiArCj4gIAlfX2Noa191c2VyX3B0cihhZGRyKTsKPiAg
CWFzbSB2b2xhdGlsZSgKPiAgCS8vIEEgKyBCIDw9IEMgKyAxIGZvciBhbGwgQSxCLEMsIGluIGZv
dXIgZWFzeSBzdGVwczoKPiBAQCAtOTQsNyArOTcsNyBAQCBzdGF0aWMgaW5saW5lIHVuc2lnbmVk
IGxvbmcgX19yYW5nZV9vayhjb25zdCB2b2lkIF9fdXNlciAqYWRkciwgdW5zaWduZWQgbG9uZyBz
aQo+ICAJcmV0dXJuIHJldDsKPiAgfQo+ICAKPiAtI2RlZmluZSBhY2Nlc3Nfb2soYWRkciwgc2l6
ZSkJX19yYW5nZV9vayh1bnRhZ2dlZF9hZGRyKGFkZHIpLCBzaXplKQo+ICsjZGVmaW5lIGFjY2Vz
c19vayhhZGRyLCBzaXplKQlfX3JhbmdlX29rKGFkZHIsIHNpemUpCj4gICNkZWZpbmUgdXNlcl9h
ZGRyX21heAkJCWdldF9mcwo+ICAKPiAgI2RlZmluZSBfQVNNX0VYVEFCTEUoZnJvbSwgdG8pCQkJ
CQkJXAo+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2tlcm5lbC9wcm9jZXNzLmMgYi9hcmNoL2Fy
bTY0L2tlcm5lbC9wcm9jZXNzLmMKPiBpbmRleCAzNzY3ZmIyMWE1YjguLmZkMTkxYzViOTJhYSAx
MDA2NDQKPiAtLS0gYS9hcmNoL2FybTY0L2tlcm5lbC9wcm9jZXNzLmMKPiArKysgYi9hcmNoL2Fy
bTY0L2tlcm5lbC9wcm9jZXNzLmMKPiBAQCAtNTUyLDMgKzU1MiwxOCBAQCB2b2lkIGFyY2hfc2V0
dXBfbmV3X2V4ZWModm9pZCkKPiAgCj4gIAlwdHJhdXRoX3RocmVhZF9pbml0X3VzZXIoY3VycmVu
dCk7Cj4gIH0KPiArCj4gKy8qCj4gKyAqIEVuYWJsZSB0aGUgcmVsYXhlZCBBQkkgYWxsb3dpbmcg
dGFnZ2VkIHVzZXIgYWRkcmVzc2VzIGludG8gdGhlIGtlcm5lbC4KPiArICovCj4gK2ludCB1bnRh
Z2dlZF91YWRkcl9zZXRfbW9kZSh1bnNpZ25lZCBsb25nIGFyZykKPiArewo+ICsJaWYgKGlzX2Nv
bXBhdF90YXNrKCkpCj4gKwkJcmV0dXJuIC1FTk9UU1VQUDsKPiArCWlmIChhcmcpCj4gKwkJcmV0
dXJuIC1FSU5WQUw7Cj4gKwo+ICsJc2V0X3RocmVhZF9mbGFnKFRJRl9VTlRBR0dFRF9VQUREUik7
Cj4gKwo+ICsJcmV0dXJuIDA7Cj4gK30KCkkgdGhpbmsgdGhpcyBzaG91bGQgYmUgcGFpcmVkIHdp
dGggYSBmbGFnIGNsZWFyaW5nIGluIGNvcHlfdGhyZWFkKCksCnllcz8gKGkuZS4gZWFjaCBiaW5h
cnkgbmVlZHMgdG8gb3B0IGluKQoKLS0gCktlZXMgQ29vawpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
