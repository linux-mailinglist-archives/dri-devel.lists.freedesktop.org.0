Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9470310BE6
	for <lists+dri-devel@lfdr.de>; Fri,  5 Feb 2021 14:36:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BEB26E2DE;
	Fri,  5 Feb 2021 13:36:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DF316E2DE
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Feb 2021 13:36:39 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id g10so7748797wrx.1
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Feb 2021 05:36:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1gQoFS6ud405970AWgVagisJdKuspo0iHcNG3yO+v+Y=;
 b=ZFx74dwXRN8XJoI8vReT6nG84gTmG6QDsKTETcJ06jTJw70JqS2qOLWzaeIPJLa2+q
 i3A1Tex+NtYld5e4GVoxTw0izBPXMnjweumu4hA9cypntxtKgmAi+PLJzkGHZ1RqPeVy
 tW/D5qIVWDn/14kg51lcnIhmcjtyQwf70EOXU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1gQoFS6ud405970AWgVagisJdKuspo0iHcNG3yO+v+Y=;
 b=ri64bnqMrbeIyyLZAibjXCl3LoLE2GwTkL1vAwQGdSUGuQBeIQsJEmXj/TGTD56nbv
 W6hauslhh5ldqh87R11j4CtPXA9pCRmQZeLRS2uEla+EQvFck54WZJSF+zeAVKNqm4/i
 WE3reoz0cLui3emxYfucOXI0QxLOXJi3Q/RDQ4LCY3V858pLpD3s63QJnZ1NiYh8an5G
 a9IQpO4PAcuU5pqf/SNCxbO4zljl8FBwGAIPw7sN9nJVRHBAhwJak92Ybax7tKJ3ZDk7
 c4qZCqBRNxBaHrbSoeIJbUPfbV8reWKKxgFG9MXDkvb8U2cZ6RgD407vXO7V8UO1tpu7
 z0jA==
X-Gm-Message-State: AOAM533H5xjeu4j+1OW+XbJmrsHSlqBZS+63Nrm2e8P9q1GG0Ja/O6t0
 2WoHorBgnCZpR8LjC/dqHDpjYA==
X-Google-Smtp-Source: ABdhPJzWE2gxGEZn4lzZcDo3tutehy5qX/E9j/4aIeZc6b9+p2my5zf6hrvCeUW2K6Drt8e7TSvqBw==
X-Received: by 2002:a5d:5283:: with SMTP id c3mr4938476wrv.319.1612532197971; 
 Fri, 05 Feb 2021 05:36:37 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id z8sm11944234wrh.83.2021.02.05.05.36.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 05:36:37 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH] PCI: Also set up legacy files only after sysfs init
Date: Fri,  5 Feb 2021 14:36:32 +0100
Message-Id: <20210205133632.2827730-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <d958eb8e32d5dd6ffd981b92cd54fe7b3fcebab9>
References: <d958eb8e32d5dd6ffd981b92cd54fe7b3fcebab9>
MIME-Version: 1.0
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-samsung-soc@vger.kernel.org,
 Jan Kara <jack@suse.cz>, Kees Cook <keescook@chromium.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-pci@vger.kernel.org,
 DRI Development <dri-devel@lists.freedesktop.org>, linux-mm@kvack.org,
 Jason Gunthorpe <jgg@ziepe.ca>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 John Hubbard <jhubbard@nvidia.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2UgYXJlIGFscmVhZHkgZG9pbmcgdGhpcyBmb3IgYWxsIHRoZSByZWd1bGFyIHN5c2ZzIGZpbGVz
IG9uIFBDSQpkZXZpY2VzLCBidXQgbm90IHlldCBvbiB0aGUgbGVnYWN5IGlvIGZpbGVzIG9uIHRo
ZSBQQ0kgYnVzZXMuIFRodXMgZmFyCm5vIHByb2JsZW0sIGJ1dCBpbiB0aGUgbmV4dCBwYXRjaCBJ
IHdhbnQgdG8gd2lyZSB1cCBpb21lbSByZXZva2UKc3VwcG9ydC4gVGhhdCBuZWVkcyB0aGUgdmZz
IHVwIGFuZCBydW5uaW5nIGFscmVhZHkgdG8gbWFrZSBzdXJlIHRoYXQKaW9tZW1fZ2V0X21hcHBp
bmcoKSB3b3Jrcy4KCldpcmUgaXQgdXAgZXhhY3RseSBsaWtlIHRoZSBleGlzdGluZyBjb2RlIGlu
CnBjaV9jcmVhdGVfc3lzZnNfZGV2X2ZpbGVzKCkuIE5vdGUgdGhhdCBwY2lfcmVtb3ZlX2xlZ2Fj
eV9maWxlcygpCmRvZXNuJ3QgbmVlZCBhIGNoZWNrIHNpbmNlIHRoZSBvbmUgZm9yIHBjaV9idXMt
PmxlZ2FjeV9pbyBpcwpzdWZmaWNpZW50LgoKQW4gYWx0ZXJuYXRpdmUgc29sdXRpb24gd291bGQg
YmUgdG8gaW1wbGVtZW50IGEgY2FsbGJhY2sgaW4gc3lzZnMgdG8Kc2V0IHVwIHRoZSBhZGRyZXNz
IHNwYWNlIGZyb20gaW9tZW1fZ2V0X21hcHBpbmcoKSB3aGVuIHVzZXJzcGFjZSBjYWxscwptbWFw
KCkuIFRoaXMgYWxzbyB3b3JrcywgYnV0IEdyZWcgZGlkbid0IHJlYWxseSBsaWtlIHRoYXQganVz
dCB0byB3b3JrCmFyb3VuZCBhbiBvcmRlcmluZyBpc3N1ZSB3aGVuIHRoZSBrZXJuZWwgbG9hZHMg
aW5pdGlhbGx5LgoKdjI6IEltcHJvdmUgY29tbWl0IG1lc3NhZ2UgKEJqb3JuKQoKU2lnbmVkLW9m
Zi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+CkNjOiBTdGVwaGVu
IFJvdGh3ZWxsIDxzZnJAY2FuYi5hdXVnLm9yZy5hdT4KQ2M6IEphc29uIEd1bnRob3JwZSA8amdn
QHppZXBlLmNhPgpDYzogS2VlcyBDb29rIDxrZWVzY29va0BjaHJvbWl1bS5vcmc+CkNjOiBEYW4g
V2lsbGlhbXMgPGRhbi5qLndpbGxpYW1zQGludGVsLmNvbT4KQ2M6IEFuZHJldyBNb3J0b24gPGFr
cG1AbGludXgtZm91bmRhdGlvbi5vcmc+CkNjOiBKb2huIEh1YmJhcmQgPGpodWJiYXJkQG52aWRp
YS5jb20+CkNjOiBKw6lyw7RtZSBHbGlzc2UgPGpnbGlzc2VAcmVkaGF0LmNvbT4KQ2M6IEphbiBL
YXJhIDxqYWNrQHN1c2UuY3o+CkNjOiBEYW4gV2lsbGlhbXMgPGRhbi5qLndpbGxpYW1zQGludGVs
LmNvbT4KQ2M6IEdyZWcgS3JvYWgtSGFydG1hbiA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+
CkNjOiBsaW51eC1tbUBrdmFjay5vcmcKQ2M6IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpDYzogbGludXgtc2Ftc3VuZy1zb2NAdmdlci5rZXJuZWwub3JnCkNjOiBsaW51eC1t
ZWRpYUB2Z2VyLmtlcm5lbC5vcmcKQ2M6IEJqb3JuIEhlbGdhYXMgPGJoZWxnYWFzQGdvb2dsZS5j
b20+CkNjOiBsaW51eC1wY2lAdmdlci5rZXJuZWwub3JnCi0tLQogZHJpdmVycy9wY2kvcGNpLXN5
c2ZzLmMgfCA3ICsrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKykKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL3BjaS9wY2ktc3lzZnMuYyBiL2RyaXZlcnMvcGNpL3BjaS1zeXNmcy5j
CmluZGV4IGZiMDcyZjRiMzE3Ni4uMGM0NWI0ZjdiMjE0IDEwMDY0NAotLS0gYS9kcml2ZXJzL3Bj
aS9wY2ktc3lzZnMuYworKysgYi9kcml2ZXJzL3BjaS9wY2ktc3lzZnMuYwpAQCAtOTI3LDYgKzky
Nyw5IEBAIHZvaWQgcGNpX2NyZWF0ZV9sZWdhY3lfZmlsZXMoc3RydWN0IHBjaV9idXMgKmIpCiB7
CiAJaW50IGVycm9yOwogCisJaWYgKCFzeXNmc19pbml0aWFsaXplZCkKKwkJcmV0dXJuOworCiAJ
Yi0+bGVnYWN5X2lvID0ga2NhbGxvYygyLCBzaXplb2Yoc3RydWN0IGJpbl9hdHRyaWJ1dGUpLAog
CQkJICAgICAgIEdGUF9BVE9NSUMpOwogCWlmICghYi0+bGVnYWN5X2lvKQpAQCAtMTQ0OCw2ICsx
NDUxLDcgQEAgdm9pZCBwY2lfcmVtb3ZlX3N5c2ZzX2Rldl9maWxlcyhzdHJ1Y3QgcGNpX2RldiAq
cGRldikKIHN0YXRpYyBpbnQgX19pbml0IHBjaV9zeXNmc19pbml0KHZvaWQpCiB7CiAJc3RydWN0
IHBjaV9kZXYgKnBkZXYgPSBOVUxMOworCXN0cnVjdCBwY2lfYnVzICpwYnVzID0gTlVMTDsKIAlp
bnQgcmV0dmFsOwogCiAJc3lzZnNfaW5pdGlhbGl6ZWQgPSAxOwpAQCAtMTQ1OSw2ICsxNDYzLDkg
QEAgc3RhdGljIGludCBfX2luaXQgcGNpX3N5c2ZzX2luaXQodm9pZCkKIAkJfQogCX0KIAorCXdo
aWxlICgocGJ1cyA9IHBjaV9maW5kX25leHRfYnVzKHBidXMpKSkKKwkJcGNpX2NyZWF0ZV9sZWdh
Y3lfZmlsZXMocGJ1cyk7CisKIAlyZXR1cm4gMDsKIH0KIGxhdGVfaW5pdGNhbGwocGNpX3N5c2Zz
X2luaXQpOwotLSAKMi4zMC4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWwK
