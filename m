Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF6B7C922
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2019 18:48:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEDA489FDB;
	Wed, 31 Jul 2019 16:48:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 657A189CAC;
 Wed, 31 Jul 2019 16:48:34 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id i2so30755631plt.1;
 Wed, 31 Jul 2019 09:48:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=0yU6+7Jqba/P/dYVUesQKoUXFUkl65XIpqFII+Vl9uI=;
 b=h7ijQAGl4fHYIXDE6v6SYHbfhsTUD1PHJFpuzii9/Mpa/1OXOuh+IgWcpMT4b7dgoh
 SM+xfDEJJLT6BOe8c3kTq3xkq0yPhqo3bhoj+QHxjlVti5Zq/2jTBLp+0oGRvcQsPn66
 BM9ZJ3xl3g0x/AdbfJLfBj0njxrZUsks90h6k0+09iUS29rUf7gegyEXfBimfjMr+afV
 +TluC/w5fftgBzPXMf5GOU/5vY7zsJ3fJBYvTtLPH/SWSXrlK5kpSK5PSiOWwpWxvufw
 XRSnLRQKd3GmJeKwN11w1CsaL+pgcPHVxYvVMlOzhfKz33F2ZQINBNEKx01zi4UCZ5Rk
 +WDQ==
X-Gm-Message-State: APjAAAWkkygu9TdSD4336lx5QN+/zH+TZANtg6g6TqnSQ6ht0h0E5PtC
 ymokoVc54nGtGUB4TfQ7lTY=
X-Google-Smtp-Source: APXvYqxFFgDlNniDL8CJHmZ07neF4gFczeMrZumpY8D33YQTsuHwvnRMvRsPvkoX1WVdvj5G5Yqdsg==
X-Received: by 2002:a17:902:934a:: with SMTP id
 g10mr123637304plp.18.1564591713720; 
 Wed, 31 Jul 2019 09:48:33 -0700 (PDT)
Received: from localhost ([121.137.63.184])
 by smtp.gmail.com with ESMTPSA id d18sm24192770pgi.40.2019.07.31.09.48.32
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 31 Jul 2019 09:48:32 -0700 (PDT)
From: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
X-Google-Original-From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Date: Thu, 1 Aug 2019 01:48:29 +0900
To: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
Subject: Re: [linux-next] mm/i915: i915_gemfs_init() NULL dereference
Message-ID: <20190731164829.GA399@tigerII.localdomain>
References: <20190721142930.GA480@tigerII.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190721142930.GA480@tigerII.localdomain>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=0yU6+7Jqba/P/dYVUesQKoUXFUkl65XIpqFII+Vl9uI=;
 b=TEShoLf6suD1oowWqmx+9hD1Z9ME22dg6oXWv+TZC0a59DtmlQsXGcIFRaKjW67vdc
 xJuBNUNjTffMUMovFe3HEn12UKyKzcwMLSkUBMlxgvtMebyzn/R7rPDCUr1I5Humd5+0
 ZUnKpZrKA1v1nxnaoUKzg3Hr5b0cYcTNuqqc4b0ExTtOj6SLqQqk3qUZHWxihx0AoILp
 gUfNyHNB3ZWYYEgqiktawoBoqtMdZGnEp0p6A0BBZDVFA33JHeXqbE1n1ExBaJVPvRj7
 nf220LhYoSaWsrlEKCnOevK8tDqEOu5Y1VGm9PD0fpTLKJL5CWc030WyaecUdDqbhAQo
 QWlg==
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
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 Hugh Dickins <hughd@google.com>, linux-kernel@vger.kernel.org,
 David Howells <dhowells@redhat.com>, linux-mm@kvack.org,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gKDA3LzIxLzE5IDIzOjI5KSwgU2VyZ2V5IFNlbm96aGF0c2t5IHdyb3RlOgo+IAo+ICBCVUc6
IGtlcm5lbCBOVUxMIHBvaW50ZXIgZGVyZWZlcmVuY2UsIGFkZHJlc3M6IDAwMDAwMDAwMDAwMDAw
MDAKPiAgI1BGOiBzdXBlcnZpc29yIGluc3RydWN0aW9uIGZldGNoIGluIGtlcm5lbCBtb2RlCj4g
ICNQRjogZXJyb3JfY29kZSgweDAwMTApIC0gbm90LXByZXNlbnQgcGFnZQo+ICBQR0QgMCBQNEQg
MCAKPiAgT29wczogMDAxMCBbIzFdIFBSRUVNUFQgU01QIFBUSQo+ICBSSVA6IDAwMTA6MHgwCj4g
IENvZGU6IEJhZCBSSVAgdmFsdWUuCj4gIFsuLl0KPiAgQ2FsbCBUcmFjZToKPiAgIGk5MTVfZ2Vt
ZnNfaW5pdCsweDZlLzB4YTAgW2k5MTVdCj4gICBpOTE1X2dlbV9pbml0X2Vhcmx5KzB4NzYvMHg5
MCBbaTkxNV0KPiAgIGk5MTVfZHJpdmVyX3Byb2JlKzB4MzBhLzB4MTY0MCBbaTkxNV0KPiAgID8g
a2VybmZzX2FjdGl2YXRlKzB4NWEvMHg4MAo+ICAgPyBrZXJuZnNfYWRkX29uZSsweGRkLzB4MTMw
Cj4gICBwY2lfZGV2aWNlX3Byb2JlKzB4OWUvMHgxMTAKPiAgIHJlYWxseV9wcm9iZSsweGNlLzB4
MjMwCj4gICBkcml2ZXJfcHJvYmVfZGV2aWNlKzB4NGIvMHhjMAo+ICAgZGV2aWNlX2RyaXZlcl9h
dHRhY2grMHg0ZS8weDYwCj4gICBfX2RyaXZlcl9hdHRhY2grMHg0Ny8weGIwCj4gICA/IGRldmlj
ZV9kcml2ZXJfYXR0YWNoKzB4NjAvMHg2MAo+ICAgYnVzX2Zvcl9lYWNoX2RldisweDYxLzB4OTAK
PiAgIGJ1c19hZGRfZHJpdmVyKzB4MTY3LzB4MWIwCj4gICBkcml2ZXJfcmVnaXN0ZXIrMHg2Ny8w
eGFhCj4gICA/IDB4ZmZmZmZmZmZjMDUyMjAwMAo+ICAgZG9fb25lX2luaXRjYWxsKzB4MzcvMHgx
M2YKPiAgID8ga21lbV9jYWNoZV9hbGxvYysweDExYS8weDE1MAo+ICAgZG9faW5pdF9tb2R1bGUr
MHg1MS8weDIwMAo+ICAgX19zZV9zeXNfaW5pdF9tb2R1bGUrMHhlZi8weDEwMAo+ICAgZG9fc3lz
Y2FsbF82NCsweDQ5LzB4MjUwCj4gICBlbnRyeV9TWVNDQUxMXzY0X2FmdGVyX2h3ZnJhbWUrMHg0
NC8weGE5CgoKU28gInRoZSBuZXcgbW91bnQgQVBJIiBjb252ZXJzaW9uIHByb2JhYmx5IGxvb2tz
IGxpa2Ugc29tZXRoaW5nIGJlbG93LgpCdXQgSSdtIG5vdCAxMDAlIHN1cmUuCgotLS0KIGRyaXZl
cnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbWZzLmMgfCAzMiArKysrKysrKysrKysrKysrKysr
KystLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyNSBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbWZzLmMgYi9k
cml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1mcy5jCmluZGV4IDA5OWYzMzk3YWFkYS4u
MmUzNjViMjZmOGVlIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9n
ZW1mcy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbWZzLmMKQEAgLTcs
MTIgKzcsMTQgQEAKICNpbmNsdWRlIDxsaW51eC9mcy5oPgogI2luY2x1ZGUgPGxpbnV4L21vdW50
Lmg+CiAjaW5jbHVkZSA8bGludXgvcGFnZW1hcC5oPgorI2luY2x1ZGUgPGxpbnV4L2ZzX2NvbnRl
eHQuaD4KIAogI2luY2x1ZGUgImk5MTVfZHJ2LmgiCiAjaW5jbHVkZSAiaTkxNV9nZW1mcy5oIgog
CiBpbnQgaTkxNV9nZW1mc19pbml0KHN0cnVjdCBkcm1faTkxNV9wcml2YXRlICppOTE1KQogewor
CXN0cnVjdCBmc19jb250ZXh0ICpmYzsKIAlzdHJ1Y3QgZmlsZV9zeXN0ZW1fdHlwZSAqdHlwZTsK
IAlzdHJ1Y3QgdmZzbW91bnQgKmdlbWZzOwogCkBAIC0zNiwxOSArMzgsMzUgQEAgaW50IGk5MTVf
Z2VtZnNfaW5pdChzdHJ1Y3QgZHJtX2k5MTVfcHJpdmF0ZSAqaTkxNSkKIAkJc3RydWN0IHN1cGVy
X2Jsb2NrICpzYiA9IGdlbWZzLT5tbnRfc2I7CiAJCS8qIEZJWE1FOiBEaXNhYmxlZCB1bnRpbCB3
ZSBnZXQgVy9BIGZvciByZWFkIEJXIGlzc3VlLiAqLwogCQljaGFyIG9wdGlvbnNbXSA9ICJodWdl
PW5ldmVyIjsKLQkJaW50IGZsYWdzID0gMDsKIAkJaW50IGVycjsKIAotCQllcnIgPSBzYi0+c19v
cC0+cmVtb3VudF9mcyhzYiwgJmZsYWdzLCBvcHRpb25zKTsKLQkJaWYgKGVycikgewotCQkJa2Vy
bl91bm1vdW50KGdlbWZzKTsKLQkJCXJldHVybiBlcnI7Ci0JCX0KKwkJZmMgPSBmc19jb250ZXh0
X2Zvcl9yZWNvbmZpZ3VyZShzYi0+c19yb290LCAwLCAwKTsKKwkJaWYgKElTX0VSUihmYykpCisJ
CQlnb3RvIGVycjsKKworCQlpZiAoIWZjLT5vcHMtPnBhcnNlX21vbm9saXRoaWMpCisJCQlnb3Rv
IGVycjsKKworCQllcnIgPSBmYy0+b3BzLT5wYXJzZV9tb25vbGl0aGljKGZjLCBvcHRpb25zKTsK
KwkJaWYgKGVycikKKwkJCWdvdG8gZXJyOworCisJCWlmICghZmMtPm9wcy0+cmVjb25maWd1cmUp
CisJCQlnb3RvIGVycjsKKworCQllcnIgPSBmYy0+b3BzLT5yZWNvbmZpZ3VyZShmYyk7CisJCWlm
IChlcnIpCisJCQlnb3RvIGVycjsKIAl9CiAKIAlpOTE1LT5tbS5nZW1mcyA9IGdlbWZzOwotCiAJ
cmV0dXJuIDA7CisKK2VycjoKKwlwcl9lcnIoImk5MTUgZ2VtZnMgaW5pdCgpIGZhaWxlZFxuIik7
CisJcHV0X2ZzX2NvbnRleHQoZmMpOworCWtlcm5fdW5tb3VudChnZW1mcyk7CisJcmV0dXJuIC1F
SU5WQUw7CiB9CiAKIHZvaWQgaTkxNV9nZW1mc19maW5pKHN0cnVjdCBkcm1faTkxNV9wcml2YXRl
ICppOTE1KQotLSAKMi4yMi4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
