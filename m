Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDCD22D06BC
	for <lists+dri-devel@lfdr.de>; Sun,  6 Dec 2020 20:03:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34CE76E4DD;
	Sun,  6 Dec 2020 19:03:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 662C76E4D4
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Dec 2020 19:03:08 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id z21so14856354lfe.12
 for <dri-devel@lists.freedesktop.org>; Sun, 06 Dec 2020 11:03:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eLxsg7EkjCm+oZc7/H4MeQJFzAKzFuMyJlMAucG5j6M=;
 b=ILdNiwFfM7J4+SrpF1knMWis/rnjLfkL9BW6opbCU1Tht72uZsNuwawgHaGa/TYKPf
 uzszEFxJDJHoljJLRysYP0ao1o/tHtZZd7QR4kMaCMZXf3naGJ2ARncpPHw0yQRwyPzf
 gg8YpdlAHdUuc6y0g726nvK95UCQgpT78x3PC/fAZgYGseaf/YNQ8p3l1n1VrCf7kEst
 uH81FAX3+vFTNjbGmFRV8NcLQwLM70sDtyAfAlw4toa6bIdQK8MbkzqN4OD8tSDh9Jb0
 UT4vJb9IwDqTlso6A9fQtuUqykaBwOa0H/dlMcgUhOiZDeAkhu6PPjI4W1jeoSJU4E6T
 M4wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=eLxsg7EkjCm+oZc7/H4MeQJFzAKzFuMyJlMAucG5j6M=;
 b=EWdYNrh2XXARR3BNZx4k7xdIcac4A0Le1mNadPh5kclbV24V5XL2tOrJqs1I3Q1N3L
 SNIMl9XPP5HunVkJwuAFPWEzXzE1vJILHr58bYD7Ygk4ir64FOR2WqvI6qsjrJehmZds
 3nH0wcGHgmDqb7fckKoAKyYNioMig59DWZcSqc9Ux8l7moow7sVb1bnHZ3LfQU3eAn4g
 FbS51dweV4ouxQ8Wzu1E/uvZA+xkDasQZrsZkbfDe/2dGk6H6CAe/Vy4I4irk0adTo2z
 i0FRhZf3XG55ciycj05sQrFFSI7XlaNvJ/4tklKPsaINioNi4YPZx7Z7Vo/YNotZ7mdU
 UGoA==
X-Gm-Message-State: AOAM532DKGBsYyR2bxcO8/7gqFut7TtzDhnhEITeK+1tqhKceK+Dakb6
 ziltxwJkL1kS6UGwx/0QR9o=
X-Google-Smtp-Source: ABdhPJxnM6yBu1jRcx8Og5RErbaxtRURZRQTgDs7BZFG81dlhoGPg5ALRRskqOrkcPkDhwvsIpFv1g==
X-Received: by 2002:a19:23d8:: with SMTP id j207mr4911471lfj.153.1607281386823; 
 Sun, 06 Dec 2020 11:03:06 -0800 (PST)
Received: from saturn.localdomain ([2a00:fd00:8060:1c00:c1c3:bbc6:3ac5:732d])
 by smtp.gmail.com with ESMTPSA id
 v28sm2483865ljv.29.2020.12.06.11.03.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Dec 2020 11:03:06 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Lee Jones <lee.jones@linaro.org>
Subject: [PATCH v3 05/13] sh: Fix set but not used warnings with !CONFIG_MMU
Date: Sun,  6 Dec 2020 20:02:39 +0100
Message-Id: <20201206190247.1861316-6-sam@ravnborg.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201206190247.1861316-1-sam@ravnborg.org>
References: <20201206190247.1861316-1-sam@ravnborg.org>
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
Cc: Rich Felker <dalias@libc.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Peter Zijlstra <peterz@infradead.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Gustavo A R Silva <gustavoars@kernel.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Peter Jones <pjones@redhat.com>, Sam Ravnborg <sam@ravnborg.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Ellerman <mpe@ellerman.id.au>, Thomas Zimmermann <tzimmermann@suse.de>,
 Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Thomas Winischhofer <thomas@winischhofer.net>,
 linux-arm-kernel@lists.infradead.org, Qilong Zhang <zhangqilong3@huawei.com>,
 Randy Dunlap <rdunlap@infradead.org>, Douglas Anderson <dianders@chromium.org>,
 Tony Prisk <linux@prisktech.co.nz>, Thierry Reding <thierry.reding@gmail.com>,
 Alexander Klimov <grandmaster@al2klimov.de>,
 Colin Ian King <colin.king@canonical.com>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QnVpbGRpbmcgZmJkZXYgZHJpdmVycyBmb3Igc2ggd2l0aCBXPTEgcHJvZHVjZXMgdGhlIGZvbGxv
d2luZyB3YXJuaW5nOgoKICAgIHRtaW9mYi5jOiBJbiBmdW5jdGlvbiDigJh0bWlvZmJfcmVtb3Zl
4oCZOgogICAgdG1pb2ZiLmM6ODA1OjIxOiB3YXJuaW5nOiB2YXJpYWJsZSDigJhwYXLigJkgc2V0
IGJ1dCBub3QgdXNlZAoKVGhpcyBpcyB3aXRoIGFsbG1vZGNvbmZpZyBhbmQgQVJDSD1zaAoKVGhp
cyBib2lsZWQgZG93biB0byBpb3VubWFwKCkgZGVmaW5lZCBhcyBlbXB0eSBmb3IgIUNPTkZJR19N
TVUuCkZpeCB0aGlzIGJ5IGJ5IGFkZGluZyAiKHZvaWQpYWRkcjsiIHRvIHRlbGwgdGhlIGNvbXBp
bGVyIHRoZQphcmd1bWVudCB0byBpb3VubWFwKCkgc2hvdWxkIGJlIGNvbnNpZGVyZWQgdXNlZC4K
ClNpZ25lZC1vZmYtYnk6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KQ2M6IFRob21h
cyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPgpDYzogTGVlIEpvbmVzIDxsZWUuam9u
ZXNAbGluYXJvLm9yZz4KQ2M6IFJpY2ggRmVsa2VyIDxkYWxpYXNAbGliYy5vcmc+CkNjOiBBcm5k
IEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPgpDYzogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydCty
ZW5lc2FzQGdsaWRlci5iZT4KQ2M6IE1pa2UgUmFwb3BvcnQgPHJwcHRAa2VybmVsLm9yZz4KQ2M6
IEt1bmlub3JpIE1vcmltb3RvIDxrdW5pbm9yaS5tb3JpbW90by5neEByZW5lc2FzLmNvbT4KQ2M6
IFBldGVyIFppamxzdHJhIDxwZXRlcnpAaW5mcmFkZWFkLm9yZz4KQ2M6IFNhbSBSYXZuYm9yZyA8
c2FtQHJhdm5ib3JnLm9yZz4KQ2M6IEFuZHJldyBNb3J0b24gPGFrcG1AbGludXgtZm91bmRhdGlv
bi5vcmc+Ci0tLQogYXJjaC9zaC9pbmNsdWRlL2FzbS9pby5oIHwgMiArLQogMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9zaC9p
bmNsdWRlL2FzbS9pby5oIGIvYXJjaC9zaC9pbmNsdWRlL2FzbS9pby5oCmluZGV4IDZkNWM2NDYz
YmMwNy4uNWFkNTZjNmMxZTFlIDEwMDY0NAotLS0gYS9hcmNoL3NoL2luY2x1ZGUvYXNtL2lvLmgK
KysrIGIvYXJjaC9zaC9pbmNsdWRlL2FzbS9pby5oCkBAIC0yNzEsNyArMjcxLDcgQEAgc3RhdGlj
IGlubGluZSB2b2lkIF9faW9tZW0gKmlvcmVtYXBfcHJvdChwaHlzX2FkZHJfdCBvZmZzZXQsIHVu
c2lnbmVkIGxvbmcgc2l6ZSwKICNlbmRpZiAvKiBDT05GSUdfSEFWRV9JT1JFTUFQX1BST1QgKi8K
IAogI2Vsc2UgLyogQ09ORklHX01NVSAqLwotI2RlZmluZSBpb3VubWFwKGFkZHIpCQlkbyB7IH0g
d2hpbGUgKDApCisjZGVmaW5lIGlvdW5tYXAoYWRkcikJCWRvIHsgKHZvaWQpYWRkcjsgfSB3aGls
ZSAoMCkKICNkZWZpbmUgaW9yZW1hcChvZmZzZXQsIHNpemUpCSgodm9pZCBfX2lvbWVtICopKHVu
c2lnbmVkIGxvbmcpKG9mZnNldCkpCiAjZW5kaWYgLyogQ09ORklHX01NVSAqLwogCi0tIAoyLjI3
LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
