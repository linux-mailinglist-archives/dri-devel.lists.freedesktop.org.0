Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF713325BC
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jun 2019 02:40:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EE64891AD;
	Mon,  3 Jun 2019 00:40:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D4F788E38
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jun 2019 00:40:31 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id z19so7474330qtz.13
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Jun 2019 17:40:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=lIh61OjDuOcWtLUnuz9frfgmzrtE9Yjc5UwT3oKcfeo=;
 b=X+1Xoz57t2YxYAQX6sDfbiVbXSiT2cFRX5BQxqQKgkWyO42NyaHkai364JZv7CPVSB
 Lj22gP3Ja9a+FmjGDshEdbIl2HQ+9+hWdKfdPsBsXmZylJSgSpRKEO7Zx1quJuOlITnk
 I/WqO87LCm6h1nC7DF6DktHB4K6kjLrSHH+yCM1n+wD9W7fv3QX0JYTRF+zzFxdPGa0i
 cB9UpouYhxgvnI7YnVes7CNFhBjYnprOVLWAcfLZsbQeUM5jxJ1qtTfFXuS69c5b6WgT
 WBojUeyg9CkbZaPDRBjy7IJQED7baiOE/wnhN5Womf20rWrmq3oGfVInid4RGWOu0woH
 Y69Q==
X-Gm-Message-State: APjAAAXeFukvjTni2r+Pgaah6mqZhh+Bfn4eGi5SCS3wI7ne/EZKgWgx
 1Ws8wYS+kKAKcwSKvu4o3YByvA5OVnE=
X-Google-Smtp-Source: APXvYqxOlLn+OjDDZts83x+KSZgz9X415NmGXvJPtAntoBiNxySHhlQ+22AEdeSzIqk8yohMq5rVqQ==
X-Received: by 2002:ac8:23f2:: with SMTP id r47mr9786979qtr.261.1559522430149; 
 Sun, 02 Jun 2019 17:40:30 -0700 (PDT)
Received: from athos.fios-router.home
 (pool-173-68-20-215.nycmny.fios.verizon.net. [173.68.20.215])
 by smtp.gmail.com with ESMTPSA id t8sm1432609qtc.80.2019.06.02.17.40.29
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 02 Jun 2019 17:40:29 -0700 (PDT)
From: Ilia Mirkin <imirkin@alum.mit.edu>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH libdrm 05/10] util: add cairo drawing for 30bpp formats when
 available
Date: Sun,  2 Jun 2019 20:40:13 -0400
Message-Id: <20190603004017.7114-6-imirkin@alum.mit.edu>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190603004017.7114-1-imirkin@alum.mit.edu>
References: <20190603004017.7114-1-imirkin@alum.mit.edu>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lIh61OjDuOcWtLUnuz9frfgmzrtE9Yjc5UwT3oKcfeo=;
 b=GLsPv2b8esLRJF7FSPIzGWYpotdwGtXTjRCYSeOwNcCzyF4la9KJ31FhVhZJQe1n+I
 3WHYv6km78ZbYzoxMrmj/8QScIiuYsPhfU5rq8etw7aR0VYlyNncWGUOigQIMVg3Od0h
 aFnookZx1omk1vZMor3TJCG/oa+zgAPCOUg5//wxuGhuI0OVD7/r6t5ldQIiXNDSui9/
 94DltlVp3ZF/9ZNnNSLQrEpVqVNIbzCXBu2LVkK7Yqb6C2W7waJ7+aC98jmP27yDhg/M
 rjDMmj4jwR8gM16WvFftIksilOwME7VuI0enHVFjfispuIScMftWwgYKJGYGWURMr/er
 cnJA==
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U2lnbmVkLW9mZi1ieTogSWxpYSBNaXJraW4gPGltaXJraW5AYWx1bS5taXQuZWR1PgotLS0KIHRl
c3RzL3V0aWwvcGF0dGVybi5jIHwgOCArKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0
aW9ucygrKQoKZGlmZiAtLWdpdCBhL3Rlc3RzL3V0aWwvcGF0dGVybi5jIGIvdGVzdHMvdXRpbC9w
YXR0ZXJuLmMKaW5kZXggMzc3OTZkYmYuLmQxOTdjNDQ0IDEwMDY0NAotLS0gYS90ZXN0cy91dGls
L3BhdHRlcm4uYworKysgYi90ZXN0cy91dGlsL3BhdHRlcm4uYwpAQCAtNzg4LDYgKzc4OCwxNCBA
QCBzdGF0aWMgdm9pZCBtYWtlX3B3ZXR0eSh2b2lkICpkYXRhLCB1bnNpZ25lZCBpbnQgd2lkdGgs
IHVuc2lnbmVkIGludCBoZWlnaHQsCiAJY2FzZSBEUk1fRk9STUFUX0JHUjU2NToKIAkJY2Fpcm9f
Zm9ybWF0ID0gQ0FJUk9fRk9STUFUX1JHQjE2XzU2NTsKIAkJYnJlYWs7CisjaWYgQ0FJUk9fVkVS
U0lPTl9NQUpPUiA+IDEgfHwgKENBSVJPX1ZFUlNJT05fTUFKT1IgPT0gMSAmJiBDQUlST19WRVJT
SU9OX01JTk9SID49IDEyKQorCWNhc2UgRFJNX0ZPUk1BVF9BUkdCMjEwMTAxMDoKKwljYXNlIERS
TV9GT1JNQVRfWFJHQjIxMDEwMTA6CisJY2FzZSBEUk1fRk9STUFUX0FCR1IyMTAxMDEwOgorCWNh
c2UgRFJNX0ZPUk1BVF9YQkdSMjEwMTAxMDoKKwkJY2Fpcm9fZm9ybWF0ID0gQ0FJUk9fRk9STUFU
X1JHQjMwOworCQlicmVhazsKKyNlbmRpZgogCWRlZmF1bHQ6CiAJCXJldHVybjsKIAl9Ci0tIAoy
LjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
