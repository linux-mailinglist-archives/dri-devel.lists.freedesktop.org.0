Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EBDE20024D
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jun 2020 08:58:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C305A6EC1D;
	Fri, 19 Jun 2020 06:58:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AFA96EA89
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jun 2020 14:37:03 +0000 (UTC)
Received: by mail-ot1-x341.google.com with SMTP id e5so4667202ote.11
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jun 2020 07:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=7BX2MczfwnklIekhyvJJ0NhkC58hgUYRasxuG2CoUtI=;
 b=nEAbYtXy/1I1In7K0fSkRnbxclDKPE5x+iwVmDxh5JN/AktyUce1FVefh+UH+8tA59
 D0+mklaklftZsz0TvqqJ7MjWoRLIt8OV3+1Fu8JsFhjL2/T+yHgfNK0eWq09CIH8E8bT
 EXht2WVfhgfZyC3FP+lG5cQMDLf0/wc75OfpBnmGWqqzcbiEpiPHxI5FZOh8bQIQgnMO
 b4eJxbLoIPn3SempL/oXznqAsWSTsu9ZWU3SiAvatJSxuZ+SiInzCS4aWSCnLFHNpeOK
 KzJAgIQ9O/0nDGYgiv3yxkiNtzUYdWRsHXl0hNIbdgik/8oeEiQJM4vpFDhBFFq2BiIm
 CGag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=7BX2MczfwnklIekhyvJJ0NhkC58hgUYRasxuG2CoUtI=;
 b=Zwd6Pgvf5pPvg/lrfRpQOlhSkCmMZr1ILjgbNmkbDImFvbt2S1z42DjFy5xJV4654J
 0Ka05sXXT1poT1RV6ApQBg85myvRH4mOP5wsNkUmgL7Hk/ECob96eXeff68Vkru5zdEF
 5XEvSFvAKpcj71MK3GgucdfH2TdvPi2w0+VbraYI6VYPe21hhUfJ8Yf7bckgzEj4T0LU
 SIKexhyEEiYmG/WNYDIsSuZpcQ8ARtzdL/joe90s2DxnK7FFXBWf2Et35osbK4+hdJ2f
 IoVZPvHtiotwx+YbivRNrmexsEz/rBwDrJ0ydwbk+DLhI17rjh2I8asipSrGB9MEAooG
 3HKw==
X-Gm-Message-State: AOAM533YybrunWlKmw5eCj7bjU2aTuzGZUKf2bp8CpAYAWjIHzyY1MYF
 97ly4KBks+0w3eXKXEIuVPw0pj0iu8b/W+IZNzk=
X-Google-Smtp-Source: ABdhPJwk6h8WIc7fO0xkSvAHrVqw51KS1v1wJFRZWH9JfYKzyXGeklPjICyAGIVoOBMnL4iwQ5OwV0yElfyM/8k0NS4=
X-Received: by 2002:a05:6830:2054:: with SMTP id
 f20mr3572787otp.358.1592491022659; 
 Thu, 18 Jun 2020 07:37:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200618100400.11464-1-colin.king@canonical.com>
 <20200618121405.GJ159988@e110455-lin.cambridge.arm.com>
 <5d08fbec-75d8-d9a9-af61-e6ab98e77c80@canonical.com>
 <20200618142106.GK159988@e110455-lin.cambridge.arm.com>
In-Reply-To: <20200618142106.GK159988@e110455-lin.cambridge.arm.com>
From: Garrit Franke <garritfranke@gmail.com>
Date: Thu, 18 Jun 2020 16:36:51 +0200
Message-ID: <CAD16O86ebsDkwbnuw2G04YZWfukqxJ=_Tex5OT07icEpfPdQNw@mail.gmail.com>
Subject: Re: [PATCH] drm/arm: fix unintentional integer overflow on left shift
To: Liviu Dudau <liviu.dudau@arm.com>
X-Mailman-Approved-At: Fri, 19 Jun 2020 06:58:10 +0000
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
Cc: David Airlie <airlied@linux.ie>, Colin Ian King <colin.king@canonical.com>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgYWxsLCBuZXdiaWUgaGVyZS4KQ2FuIHRoZSBCSVQgbWFjcm8gYmUgc2FmZWx5IHVzZWQgb24g
b3RoZXIgcGFydHMgb2YgdGhlIGtlcm5lbCBhcyB3ZWxsPwpKdXN0IHVzaW5nIGdpdCBncmVwICIx
IDw8IiByZXR1cm5zIGEgdG9uIG9mIHJlc3VsdHMgd2hlcmUgYml0IHNoaWZ0aW5nCmlzIHVzZWQg
dGhlIG9sZCBmYXNoaW9uZWQgd2F5LgoKQW0gRG8uLCAxOC4gSnVuaSAyMDIwIHVtIDE2OjIzIFVo
ciBzY2hyaWViIExpdml1IER1ZGF1IDxsaXZpdS5kdWRhdUBhcm0uY29tPjoKPgo+IE9uIFRodSwg
SnVuIDE4LCAyMDIwIGF0IDAxOjUwOjM0UE0gKzAxMDAsIENvbGluIElhbiBLaW5nIHdyb3RlOgo+
ID4gT24gMTgvMDYvMjAyMCAxMzoxNCwgTGl2aXUgRHVkYXUgd3JvdGU6Cj4gPiA+IE9uIFRodSwg
SnVuIDE4LCAyMDIwIGF0IDExOjA0OjAwQU0gKzAxMDAsIENvbGluIEtpbmcgd3JvdGU6Cj4gPiA+
PiBGcm9tOiBDb2xpbiBJYW4gS2luZyA8Y29saW4ua2luZ0BjYW5vbmljYWwuY29tPgo+ID4gPgo+
ID4gPiBIaSBDb2xpbiwKPiA+ID4KPiA+ID4+Cj4gPiA+PiBTaGlmdGluZyB0aGUgaW50ZWdlciB2
YWx1ZSAxIGlzIGV2YWx1YXRlZCB1c2luZyAzMi1iaXQgYXJpdGhtZXRpYwo+ID4gPj4gYW5kIHRo
ZW4gdXNlZCBpbiBhbiBleHByZXNzaW9uIHRoYXQgZXhwZWN0cyBhIGxvbmcgdmFsdWUgbGVhZHMg
dG8KPiA+ID4+IGEgcG90ZW50aWFsIGludGVnZXIgb3ZlcmZsb3cuCj4gPiA+Cj4gPiA+IEknbSBh
ZnJhaWQgdGhpcyBleHBsYW5hdGlvbiBtYWtlcyBubyBzZW5zZSB0byBtZS4gRG8geW91IGNhcmUg
dG8gZXhwbGFpbiBiZXR0ZXIgd2hhdAo+ID4gPiB5b3UgdGhpbmsgdGhlIGlzc3VlIGlzPyBJZiB0
aGUgc2hpZnQgaXMgZG9uZSBhcyAzMi1iaXQgYXJpdGhtZXRpYyBhbmQgdGhlbiBwcm9tb3RlZAo+
ID4gPiB0byBsb25nIGhvdyBkb2VzIHRoZSBvdmVyZmxvdyBoYXBwZW4/Cj4gPgo+ID4gVGhlIHNo
aWZ0IGlzIHBlcmZvcm1lZCB1c2luZyAzMiBiaXQgc2lnbmVkIG1hdGggYW5kIHRoZW4gYXNzaWdu
ZWQgdG8gYW4KPiA+IHVuc2lnbmVkIDY0IGJpdCBsb25nLiBUaGlzIGlmIHRoZSBzaGlmdCBpcyAz
MSBiaXRzIHRoZW4gdGhlIHNpZ25lZCBpbnQKPiA+IGNvbnZlcnNpb24gb2YgMHg4MDAwMDAwMCB0
byB1bnNpZ25lZCBsb25nIGJlY29tZXMgMHhmZmZmZmZmZjgwMDAwMDAwLgo+ID4gSWYgdGhlIHNo
aWZ0IGlzIG1vcmUgdGhhbiAzMiBiaXRzIHRoZW4gcmVzdWx0IG92ZXJmbG93cyBhbmQgYmVjb21l
cyAweDAuCj4KPiBZb3UgYXJlIHJpZ2h0LCBJJ3ZlIG1pc3NlZCB0aGUgZmFjdCB0aGF0IGl0IGlz
IHNpZ25lZCBtYXRoLiBOb3QgdmVyeSBsaWtlbHkgdGhhdAo+IHdlIGFyZSBnb2luZyB0byBldmVy
IGhhdmUgMzAgb3IgbW9yZSBDUlRDcyBpbiB0aGUgZHJpdmVyLCBidXQgQ292ZXJpdHkgaGFzIG5v
Cj4gd2F5IG9mIGtub3dpbmcgdGhhdC4KPgo+IEFja2VkLWJ5OiBMaXZpdSBEdWRhdSA8bGl2aXUu
ZHVkYXVAYXJtLmNvbT4KPgo+IEkgd2lsbCBwdWxsIHRoaXMgaW50byBkcm0tbWlzYy1uZXh0IHRv
ZGF5Lgo+Cj4gQmVzdCByZWdhcmRzLAo+IExpdml1Cj4KPiA+Cj4gPiBDb2xpbgo+ID4KPiA+ID4K
PiA+ID4gQmVzdCByZWdhcmRzLAo+ID4gPiBMaXZpdQo+ID4gPgo+ID4gPj4gRml4IHRoaXMgYnkg
dXNpbmcgdGhlIEJJVCBtYWNybyB0bwo+ID4gPj4gcGVyZm9ybSB0aGUgc2hpZnQgdG8gYXZvaWQg
dGhlIG92ZXJmbG93Lgo+ID4gPj4KPiA+ID4+IEFkZHJlc3Nlcy1Db3Zlcml0eTogKCJVbmludGVu
dGlvbmFsIGludGVnZXIgb3ZlcmZsb3ciKQo+ID4gPj4gRml4ZXM6IGFkNDlmODYwMmZlOCAoImRy
bS9hcm06IEFkZCBzdXBwb3J0IGZvciBNYWxpIERpc3BsYXkgUHJvY2Vzc29ycyIpCj4gPiA+PiBT
aWduZWQtb2ZmLWJ5OiBDb2xpbiBJYW4gS2luZyA8Y29saW4ua2luZ0BjYW5vbmljYWwuY29tPgo+
ID4gPj4gLS0tCj4gPiA+PiAgZHJpdmVycy9ncHUvZHJtL2FybS9tYWxpZHBfcGxhbmVzLmMgfCAy
ICstCj4gPiA+PiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
Cj4gPiA+Pgo+ID4gPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vbWFsaWRwX3Bs
YW5lcy5jIGIvZHJpdmVycy9ncHUvZHJtL2FybS9tYWxpZHBfcGxhbmVzLmMKPiA+ID4+IGluZGV4
IDM3NzE1Y2M2MDY0ZS4uYWI0NWFjNDQ1MDQ1IDEwMDY0NAo+ID4gPj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2FybS9tYWxpZHBfcGxhbmVzLmMKPiA+ID4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9h
cm0vbWFsaWRwX3BsYW5lcy5jCj4gPiA+PiBAQCAtOTI4LDcgKzkyOCw3IEBAIGludCBtYWxpZHBf
ZGVfcGxhbmVzX2luaXQoc3RydWN0IGRybV9kZXZpY2UgKmRybSkKPiA+ID4+ICAgIGNvbnN0IHN0
cnVjdCBtYWxpZHBfaHdfcmVnbWFwICptYXAgPSAmbWFsaWRwLT5kZXYtPmh3LT5tYXA7Cj4gPiA+
PiAgICBzdHJ1Y3QgbWFsaWRwX3BsYW5lICpwbGFuZSA9IE5VTEw7Cj4gPiA+PiAgICBlbnVtIGRy
bV9wbGFuZV90eXBlIHBsYW5lX3R5cGU7Cj4gPiA+PiAtICB1bnNpZ25lZCBsb25nIGNydGNzID0g
MSA8PCBkcm0tPm1vZGVfY29uZmlnLm51bV9jcnRjOwo+ID4gPj4gKyAgdW5zaWduZWQgbG9uZyBj
cnRjcyA9IEJJVChkcm0tPm1vZGVfY29uZmlnLm51bV9jcnRjKTsKPiA+ID4+ICAgIHVuc2lnbmVk
IGxvbmcgZmxhZ3MgPSBEUk1fTU9ERV9ST1RBVEVfMCB8IERSTV9NT0RFX1JPVEFURV85MCB8IERS
TV9NT0RFX1JPVEFURV8xODAgfAo+ID4gPj4gICAgICAgICAgICAgICAgICAgICAgICAgIERSTV9N
T0RFX1JPVEFURV8yNzAgfCBEUk1fTU9ERV9SRUZMRUNUX1ggfCBEUk1fTU9ERV9SRUZMRUNUX1k7
Cj4gPiA+PiAgICB1bnNpZ25lZCBpbnQgYmxlbmRfY2FwcyA9IEJJVChEUk1fTU9ERV9CTEVORF9Q
SVhFTF9OT05FKSB8Cj4gPiA+PiAtLQo+ID4gPj4gMi4yNy4wLnJjMAo+ID4gPj4KPiA+ID4KPiA+
Cj4gPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4g
ZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+ID4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
Zwo+ID4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWwKPgo+IC0tCj4gPT09PT09PT09PT09PT09PT09PT0KPiB8IEkgd291bGQgbGlrZSB0byB8
Cj4gfCBmaXggdGhlIHdvcmxkLCAgfAo+IHwgYnV0IHRoZXkncmUgbm90IHwKPiB8IGdpdmluZyBt
ZSB0aGUgICB8Cj4gIFwgc291cmNlIGNvZGUhICAvCj4gICAtLS0tLS0tLS0tLS0tLS0KPiAgICAg
wq9cXyjjg4QpXy/CrwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWwK
