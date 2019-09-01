Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C7D8A4875
	for <lists+dri-devel@lfdr.de>; Sun,  1 Sep 2019 10:56:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87B386E1BD;
	Sun,  1 Sep 2019 08:56:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 262576E1BD
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Sep 2019 08:56:50 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id 4so2164974pgm.12
 for <dri-devel@lists.freedesktop.org>; Sun, 01 Sep 2019 01:56:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=W+lYISWLd+dLXJ92WanX0SAmm2/oFeQWs1BfMT2py3w=;
 b=NBuHuEFwXKsGiOWZrSMXHAv6uSap4wbq4+DQNEImc2/SkUUJiOuG6KeN07jCJ/a8OZ
 iXBkWG24iHqvYVKyRh1j46BuxQ/gtyC+GPswQ85LDizJtgw7rLZSdp6Y/bWmITU27Urd
 poHLE4KUN7Zw67JubDSOplCH2yXzo9x1OUutEewwBVf1DCTX51LGkQ48aYSNRBSSUIS4
 kxxXsN80MSGtSvBoQAmZSpaIk7lWFFMnrXaz9wtHvrAzJ8mrF3E6LaTef0+++rnOcGTr
 3zYsXFqhugWUbzRhOAPQtxsARGO4/55CnTyhqUGL+sHzqbFtv/ngG0osequBdyszNG4w
 lnNQ==
X-Gm-Message-State: APjAAAUf7CinIx1gtx7L5N5OrjSMLHAvP/obD1XXVe/CiR5+KBXRtQjH
 uDGGMIP/jEW1CGeuyzxlp0o=
X-Google-Smtp-Source: APXvYqy8daAkWI0h/2UCCRkS0vvaIRVjrZj/5mthq1euwOPfZ7ZhxdNHprlrtZwigNBFdz55q8iTkA==
X-Received: by 2002:a65:4106:: with SMTP id w6mr19893392pgp.175.1567328209482; 
 Sun, 01 Sep 2019 01:56:49 -0700 (PDT)
Received: from raspberrypi ([61.83.141.141])
 by smtp.gmail.com with ESMTPSA id c12sm16779697pfc.22.2019.09.01.01.56.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Sep 2019 01:56:48 -0700 (PDT)
Date: Sun, 1 Sep 2019 09:56:39 +0100
From: Sidong Yang <realwakka@gmail.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>
Subject: [PATCH] drm/vkms: Use alpha value to blend values.
Message-ID: <20190901085639.GA20694@raspberrypi>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent;
 bh=W+lYISWLd+dLXJ92WanX0SAmm2/oFeQWs1BfMT2py3w=;
 b=oDP406rRTaIX39SIvUpLS8n0W8bK0owcW8hoEKLZcbg/OVy/p5EpAq1CqHu8KDmO6B
 aQmESyGa4lhvcBPvzUEHJ17ay/eelPd73K5hmprOsZhcqrtcLeh3/G8Bvge4Jl8n+Y8G
 1obxUDHjBNa3S+Sp5HmfQGhxq+z7x9VFcGbZorCIhWxezN81617sNaK/4E3cD4fNwPEw
 3T5kfPxqgQnP5cfBt75vBXbe5FSmxCEYVtiFRYn7CctZ8V2PhR4hFmOAjCkke0pZIxih
 d2JLv2xFNxPZAbPyfkhx1gtJHjrMDcpCSXPZJiEhPUR3jMaH9Ca+B+GpHz9OGt9JXuph
 vtqQ==
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VXNlIGFscGhhIHZhbHVlIHRvIGJsZW5kIHNvdXJjZSB2YWx1ZSBhbmQgZGVzdGluYXRpb24gdmFs
dWUgSW5zdGVhZCBvZgpqdXN0IG92ZXJ3cml0ZSB3aXRoIHNvdXJjZSB2YWx1ZS4KClNpZ25lZC1v
ZmYtYnk6IFNpZG9uZyBZYW5nIDxyZWFsd2Fra2FAZ21haWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1
L2RybS92a21zL3ZrbXNfY29tcG9zZXIuYyB8IDEzICsrKysrKysrKysrLS0KIDEgZmlsZSBjaGFu
Z2VkLCAxMSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS92a21zL3ZrbXNfY29tcG9zZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS92a21zL3Zr
bXNfY29tcG9zZXIuYwppbmRleCBkNTU4NTY5NWM2NGQuLmI3NzYxODVlNWNiNSAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL3ZrbXMvdmttc19jb21wb3Nlci5jCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS92a21zL3ZrbXNfY29tcG9zZXIuYwpAQCAtNzUsNiArNzUsOSBAQCBzdGF0aWMgdm9pZCBi
bGVuZCh2b2lkICp2YWRkcl9kc3QsIHZvaWQgKnZhZGRyX3NyYywKIAlpbnQgeV9saW1pdCA9IHlf
c3JjICsgaF9kc3Q7CiAJaW50IHhfbGltaXQgPSB4X3NyYyArIHdfZHN0OwogCisJdTggKnNyYywg
KmRzdDsKKwl1MzIgYWxwaGEsIGludl9hbHBoYTsKKwogCWZvciAoaSA9IHlfc3JjLCBpX2RzdCA9
IHlfZHN0OyBpIDwgeV9saW1pdDsgKytpKSB7CiAJCWZvciAoaiA9IHhfc3JjLCBqX2RzdCA9IHhf
ZHN0OyBqIDwgeF9saW1pdDsgKytqKSB7CiAJCQlvZmZzZXRfZHN0ID0gZGVzdF9jb21wb3Nlci0+
b2Zmc2V0CkBAIC04NCw4ICs4NywxNCBAQCBzdGF0aWMgdm9pZCBibGVuZCh2b2lkICp2YWRkcl9k
c3QsIHZvaWQgKnZhZGRyX3NyYywKIAkJCQkgICAgICsgKGkgKiBzcmNfY29tcG9zZXItPnBpdGNo
KQogCQkJCSAgICAgKyAoaiAqIHNyY19jb21wb3Nlci0+Y3BwKTsKIAotCQkJbWVtY3B5KHZhZGRy
X2RzdCArIG9mZnNldF9kc3QsCi0JCQkgICAgICAgdmFkZHJfc3JjICsgb2Zmc2V0X3NyYywgc2l6
ZW9mKHUzMikpOworCQkJc3JjID0gdmFkZHJfc3JjICsgb2Zmc2V0X3NyYzsKKwkJCWRzdCA9IHZh
ZGRyX2RzdCArIG9mZnNldF9kc3Q7CisJCQlhbHBoYSA9IHNyY1szXSArIDE7CisJCQlpbnZfYWxw
aGEgPSAyNTYgLSBzcmNbM107CisJCQlkc3RbMF0gPSAoYWxwaGEgKiBzcmNbMF0gKyBpbnZfYWxw
aGEgKiBkc3RbMF0pID4+IDg7CisJCQlkc3RbMV0gPSAoYWxwaGEgKiBzcmNbMV0gKyBpbnZfYWxw
aGEgKiBkc3RbMV0pID4+IDg7CisJCQlkc3RbMl0gPSAoYWxwaGEgKiBzcmNbMl0gKyBpbnZfYWxw
aGEgKiBkc3RbMl0pID4+IDg7CisJCQlkc3RbM10gPSAweGZmOwogCQl9CiAJCWlfZHN0Kys7CiAJ
fQotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
