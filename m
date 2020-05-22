Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4987C1DF65C
	for <lists+dri-devel@lfdr.de>; Sat, 23 May 2020 11:34:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 269416E1B3;
	Sat, 23 May 2020 09:34:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F405B6E989
 for <dri-devel@lists.freedesktop.org>; Fri, 22 May 2020 07:25:31 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id k13so9171135wrx.3
 for <dri-devel@lists.freedesktop.org>; Fri, 22 May 2020 00:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=D2Vxxx9xwQZv2HFZw44HLDX0KJ9fcafykGilE0KusFA=;
 b=Bt6mpwNETM8CL17HN9OVzEcNWXBfIJiVKqfh3Oke4QRDt5hbauCQiFHDYm/qhoOvBh
 TorP/DDfDotp3275SRFVk8I4bonijzearlJ8DHnVuqPInLz07HkE7uisgCyWJNL1Bikq
 Ne7sEITHz76tdICx67J2ToF5oqaYJjea6EfNrWWOP5j50tqQB9VJy0OpmxS2oPUWeziA
 lqxJWd//yolQqc8sDWKf8u76eEPqhBrqEIYdBa+PwGTbOwhGuk4qEhagA5myvRg8rwaO
 3PiwKAuf4+quXgY74OrIZ3dMQgNBYCXoMbsOkZpHkIavLqpw0+N+CI3uCQ37uAXa1Riu
 M6Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=D2Vxxx9xwQZv2HFZw44HLDX0KJ9fcafykGilE0KusFA=;
 b=nbxfX5XRe9frnX0E3ls9do5SW2ERlrSbnx/5Bm7JRZpmYbRmua6nEkyouoBKJsthoL
 z0nBnr4PgQL/rxBOtBnONWAT2XauXc9AVIx3y4YhTSUDSKAxQ+Zl50vs46op7AfsmSM3
 oTYh9N25PLTd1NCdAb0WlbuESRyLuANgmRYUlB/dUxIzDW59AThp+lgvzN62QAmM0O0J
 5ItUAg9G5TqzDEFuGCxIPOmQqvJ3A2rQejKDD6xEV6rU1I5KZPbB9mvs71u3vgXYNY1f
 p+gIoKVGSeXeXUU1wNwDyv7fJYk95lExtzVsFN7sEocH1cSDA7JL/HB/xOl0EHTx1M8Q
 9nUA==
X-Gm-Message-State: AOAM533/Ax5dSdNXgcrCl/nrS7CnZkTzzYVeqC+JNesRLDv3TGP/7EF6
 E4G97fK+Jr+xg+htYirTEb0=
X-Google-Smtp-Source: ABdhPJz/6awZjxVQ+Dp6vSmq92QOklfTK8MOtAn8ONy1iHZCnqeROK6pCNgWTiXRSFDpznJtdikrKQ==
X-Received: by 2002:adf:fdc1:: with SMTP id i1mr2409080wrs.0.1590132330633;
 Fri, 22 May 2020 00:25:30 -0700 (PDT)
Received: from skynet.lan (159.red-83-44-12.dynamicip.rima-tde.net.
 [83.44.12.159])
 by smtp.gmail.com with ESMTPSA id f128sm9299898wme.1.2020.05.22.00.25.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 May 2020 00:25:30 -0700 (PDT)
From: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>
To: computersforpeace@gmail.com, kdasu.kdev@gmail.com,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 sumit.semwal@linaro.org, linux-mtd@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: [PATCH v3 2/5] mtd: rawnand: brcmnand: fix CS0 layout
Date: Fri, 22 May 2020 09:25:22 +0200
Message-Id: <20200522072525.3919332-3-noltari@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200522072525.3919332-1-noltari@gmail.com>
References: <20200512073329.742893-1-noltari@gmail.com>
 <20200522072525.3919332-1-noltari@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 23 May 2020 09:33:36 +0000
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
Cc: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T25seSB2My4zLXY1LjAgaGF2ZSBhIGRpZmZlcmVudCBDUzAgbGF5b3V0LgpDb250cm9sbGVycyBi
ZWZvcmUgdjMuMyB1c2UgdGhlIHNhbWUgbGF5b3V0IGZvciBldmVyeSBDUy4KCkZpeGVzOiAyN2M1
YjE3Y2QxYjEgKCJtdGQ6IG5hbmQ6IGFkZCBOQU5EIGRyaXZlciAibGlicmFyeSIgZm9yIEJyb2Fk
Y29tIFNUQiBOQU5EIGNvbnRyb2xsZXIiKQpTaWduZWQtb2ZmLWJ5OiDDgWx2YXJvIEZlcm7DoW5k
ZXogUm9qYXMgPG5vbHRhcmlAZ21haWwuY29tPgotLS0KIHYzOiBubyBjaGFuZ2VzLgogdjI6IGZp
eCBjb21taXQgbG9nLgoKIGRyaXZlcnMvbXRkL25hbmQvcmF3L2JyY21uYW5kL2JyY21uYW5kLmMg
fCA1ICsrKy0tCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L2JyY21uYW5kL2JyY21uYW5kLmMg
Yi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9icmNtbmFuZC9icmNtbmFuZC5jCmluZGV4IDZhMDhkZDA3
YjA1OC4uNzJiMjY4ZDhlM2E0IDEwMDY0NAotLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9icmNt
bmFuZC9icmNtbmFuZC5jCisrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L2JyY21uYW5kL2JyY21u
YW5kLmMKQEAgLTYwNiw4ICs2MDYsOSBAQCBzdGF0aWMgaW50IGJyY21uYW5kX3JldmlzaW9uX2lu
aXQoc3RydWN0IGJyY21uYW5kX2NvbnRyb2xsZXIgKmN0cmwpCiAJfSBlbHNlIHsKIAkJY3RybC0+
Y3Nfb2Zmc2V0cyA9IGJyY21uYW5kX2NzX29mZnNldHM7CiAKLQkJLyogdjUuMCBhbmQgZWFybGll
ciBoYXMgYSBkaWZmZXJlbnQgQ1MwIG9mZnNldCBsYXlvdXQgKi8KLQkJaWYgKGN0cmwtPm5hbmRf
dmVyc2lvbiA8PSAweDA1MDApCisJCS8qIHYzLjMtNS4wIGhhdmUgYSBkaWZmZXJlbnQgQ1MwIG9m
ZnNldCBsYXlvdXQgKi8KKwkJaWYgKGN0cmwtPm5hbmRfdmVyc2lvbiA+PSAweDAzMDMgJiYKKwkJ
ICAgIGN0cmwtPm5hbmRfdmVyc2lvbiA8PSAweDA1MDApCiAJCQljdHJsLT5jczBfb2Zmc2V0cyA9
IGJyY21uYW5kX2NzX29mZnNldHNfY3MwOwogCX0KIAotLSAKMi4yNi4yCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
