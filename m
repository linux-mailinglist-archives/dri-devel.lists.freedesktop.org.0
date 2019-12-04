Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A7D113C82
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2019 08:44:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03CE46E983;
	Thu,  5 Dec 2019 07:44:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [IPv6:2607:f8b0:4864:20::72d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC55B6E0F5
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2019 10:54:29 +0000 (UTC)
Received: by mail-qk1-x72d.google.com with SMTP id v19so6683212qkv.3
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Dec 2019 02:54:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=UXlbnLzz9HES2vhv5tD/Nn8F6D/cgg2//ybv0zzSBu4=;
 b=ULt0wl7rKTcJwCqcgc6V0+ZF4CtRw4ljD1nw5/DtJ1c11ENEJfq9fgK3g8oniZdUH9
 1ZQ1zgEzoFp4lkCY0PgqMqvTQyTlMyn9a6yf8FBjqtrE+sNKmXrsnFCHy1yiAVpCZpzC
 B5SuG6VBIcvAeJGCa9JeWMKto0gEKCx5VE1OfXYVdHR2y5y+7nIt7uV0zIo1PylwGMjp
 +q54KdqThtPI96Em03zYjopOktQ67AVGZnFY7Id/g0jcxvZmTlbBEnLgf4/ulbRxx/EC
 eJfIb451j+LM5XazcPo9Yc3KX5+tmUUHogE7Jz71bH/QSBUjQ9jnNKjnxo2KPbeOjv0q
 NgxQ==
X-Gm-Message-State: APjAAAVPjv6o6ZukzrsVN0YXFq9aBnqJn12553158JJqB+OqEc6aAc3R
 TGo+X6UUbRNSXcyfSMcF7xJyNw+kIBLafI6y3LfoiNV+en4=
X-Google-Smtp-Source: APXvYqzI5+IudYP6psb24pDdmt6InHaR+nukd19DyGQKbpxqUP9wI4CfgPkz/74ZbB0k0OAg/00CkKehF8XeADp09tk=
X-Received: by 2002:a37:e312:: with SMTP id y18mr2229324qki.250.1575456868384; 
 Wed, 04 Dec 2019 02:54:28 -0800 (PST)
MIME-Version: 1.0
From: Dmitry Vyukov <dvyukov@google.com>
Date: Wed, 4 Dec 2019 11:54:17 +0100
Message-ID: <CACT4Y+YjudGzx44Jw1UMgEPB4kfzp3jo-TcCVR62U+N+2C6tjA@mail.gmail.com>
Subject: cirrusfb: divide errors in
 cirrusfb_check_var/cirrusfb_check_pixclock/cirrusfb_set_par_foo
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 DRI <dri-devel@lists.freedesktop.org>
X-Mailman-Approved-At: Thu, 05 Dec 2019 07:44:39 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=UXlbnLzz9HES2vhv5tD/Nn8F6D/cgg2//ybv0zzSBu4=;
 b=PY5OgnzZ4Yu71ua3ifLEJX+TnVmFVZPPd+rDe3LYuHdkA2Q89ea7a/ydRQVhgmK3UO
 1oKJRNNK79gNEkGXJPPZeaT5S57B+d5qrQl2+vGw1lLV3E5qRzKYHBUV9FbdK8TSrgai
 VpKo3qDvmkg9AiAPPUjZ/gBLdtDTpUgT7kKXq33EjeLxxa+G71JQiQTq+oR94FbFHObp
 OYNyNauSEcBBfb2Di8jAdibSsH+rFtV2rMhq+8rtvoJKsiVvgtBgzH28zAxImU19H5wX
 6bkUpFHvK3wmYa3x23xHHzitD0A5TLTjmkKTuK/fA/IaZT6BZ3MBJ3kobNKuhxiYNgkX
 SgxQ==
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 syzkaller <syzkaller@googlegroups.com>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGVsbG8sCgpzeXprYWxsZXIgaGFzIGZvdW5kIDMgb2YgZGl2aWRlIGVycm9ycyBpbiB0aGUgY2ly
cnVzZmIgZHJpdmVyLgpLZXJuZWwgaXMgb24gYzVkYjkyOTA5YmVkZCBBZGQgbGludXgtbmV4dCBz
cGVjaWZpYyBmaWxlcyBmb3IgMjAxOTEyMDIuCgpkaXZpZGUgZXJyb3I6IDAwMDAgWyMxXSBQUkVF
TVBUIFNNUCBLQVNBTgpDUFU6IDAgUElEOiA4MTMzIENvbW06IHN5ei1leGVjdXRvci41IE5vdCB0
YWludGVkIDUuNC4wLW5leHQtMjAxOTEyMDIrICMxMwpIYXJkd2FyZSBuYW1lOiBRRU1VIFN0YW5k
YXJkIFBDIChRMzUgKyBJQ0g5LCAyMDA5KSwgQklPUwpyZWwtMS4xMi4wLTU5LWdjOWJhNTI3NmUz
MjEtcHJlYnVpbHQucWVtdS5vcmcgMDQvMDEvMjAxNApSSVA6IDAwMTA6Y2lycnVzZmJfc2V0X3Bh
cl9mb28rMHgxZDE3LzB4NjRiMCBkcml2ZXJzL3ZpZGVvL2ZiZGV2L2NpcnJ1c2ZiLmM6ODM2CkNh
bGwgVHJhY2U6CiBjaXJydXNmYl9zZXRfcGFyKzB4MTUvMHgyMCBkcml2ZXJzL3ZpZGVvL2ZiZGV2
L2NpcnJ1c2ZiLmM6MTI3MgogZmJfc2V0X3ZhcisweDUxOC8weGRkMCBkcml2ZXJzL3ZpZGVvL2Zi
ZGV2L2NvcmUvZmJtZW0uYzoxMDI0CiBkb19mYl9pb2N0bCsweDUwYy8weDgzMCBkcml2ZXJzL3Zp
ZGVvL2ZiZGV2L2NvcmUvZmJtZW0uYzoxMTA0CiBmYl9pb2N0bCsweGU2LzB4MTMwIGRyaXZlcnMv
dmlkZW8vZmJkZXYvY29yZS9mYm1lbS5jOjExODAKIHZmc19pb2N0bCBmcy9pb2N0bC5jOjQ3IFtp
bmxpbmVdCiBmaWxlX2lvY3RsIGZzL2lvY3RsLmM6NTQ1IFtpbmxpbmVdCiBkb192ZnNfaW9jdGwr
MHgxZGYvMHgxNDIwIGZzL2lvY3RsLmM6NzMyCiBrc3lzX2lvY3RsKzB4YTkvMHhkMCBmcy9pb2N0
bC5jOjc0OQoKZGl2aWRlIGVycm9yOiAwMDAwIFsjMV0gUFJFRU1QVCBTTVAgS0FTQU4KQ1BVOiAz
IFBJRDogNzYzOSBDb21tOiBzeXotZXhlY3V0b3IuMCBOb3QgdGFpbnRlZCA1LjQuMC1uZXh0LTIw
MTkxMjAyKyAjMTIKSGFyZHdhcmUgbmFtZTogUUVNVSBTdGFuZGFyZCBQQyAoUTM1ICsgSUNIOSwg
MjAwOSksIEJJT1MKcmVsLTEuMTIuMC01OS1nYzliYTUyNzZlMzIxLXByZWJ1aWx0LnFlbXUub3Jn
IDA0LzAxLzIwMTQKUklQOiAwMDEwOmNpcnJ1c2ZiX2NoZWNrX3BpeGNsb2NrIGRyaXZlcnMvdmlk
ZW8vZmJkZXYvY2lycnVzZmIuYzo0ODIgW2lubGluZV0KUklQOiAwMDEwOmNpcnJ1c2ZiX2NoZWNr
X3ZhcisweDZlOC8weDExNTAgZHJpdmVycy92aWRlby9mYmRldi9jaXJydXNmYi5jOjYyMwpDYWxs
IFRyYWNlOgogZmJfc2V0X3ZhcisweDIzNi8weGRkMCBkcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUv
ZmJtZW0uYzoxMDA1CiBkb19mYl9pb2N0bCsweDUwYy8weDgzMCBkcml2ZXJzL3ZpZGVvL2ZiZGV2
L2NvcmUvZmJtZW0uYzoxMTA0CiBmYl9pb2N0bCsweGU2LzB4MTMwIGRyaXZlcnMvdmlkZW8vZmJk
ZXYvY29yZS9mYm1lbS5jOjExODAKIHZmc19pb2N0bCBmcy9pb2N0bC5jOjQ3IFtpbmxpbmVdCiBm
aWxlX2lvY3RsIGZzL2lvY3RsLmM6NTQ1IFtpbmxpbmVdCiBkb192ZnNfaW9jdGwrMHgxZGYvMHgx
NDIwIGZzL2lvY3RsLmM6NzMyCiBrc3lzX2lvY3RsKzB4YTkvMHhkMCBmcy9pb2N0bC5jOjc0OQoK
ZGl2aWRlIGVycm9yOiAwMDAwIFsjMV0gUFJFRU1QVCBTTVAgS0FTQU4KQ1BVOiAxIFBJRDogMTI1
NTUgQ29tbTogc3l6LWV4ZWN1dG9yLjUgTm90IHRhaW50ZWQgNS40LjAtbmV4dC0yMDE5MTIwMisg
IzE1CkhhcmR3YXJlIG5hbWU6IFFFTVUgU3RhbmRhcmQgUEMgKFEzNSArIElDSDksIDIwMDkpLCBC
SU9TCnJlbC0xLjEyLjAtNTktZ2M5YmE1Mjc2ZTMyMS1wcmVidWlsdC5xZW11Lm9yZyAwNC8wMS8y
MDE0ClJJUDogMDAxMDpjaXJydXNmYl9jaGVja192YXIuY29sZC4xNisweDEyZS8weDFlNwpkcml2
ZXJzL3ZpZGVvL2ZiZGV2L2NpcnJ1c2ZiLmM6NTgxCkNhbGwgVHJhY2U6CiBmYl9zZXRfdmFyKzB4
MjM2LzB4ZGQwIGRyaXZlcnMvdmlkZW8vZmJkZXYvY29yZS9mYm1lbS5jOjEwMDUKIGRvX2ZiX2lv
Y3RsKzB4NTBjLzB4ODMwIGRyaXZlcnMvdmlkZW8vZmJkZXYvY29yZS9mYm1lbS5jOjExMDQKIGZi
X2lvY3RsKzB4ZTYvMHgxMzAgZHJpdmVycy92aWRlby9mYmRldi9jb3JlL2ZibWVtLmM6MTE4MAog
dmZzX2lvY3RsIGZzL2lvY3RsLmM6NDcgW2lubGluZV0KIGZpbGVfaW9jdGwgZnMvaW9jdGwuYzo1
NDUgW2lubGluZV0KIGRvX3Zmc19pb2N0bCsweDFkZi8weDE0MjAgZnMvaW9jdGwuYzo3MzIKIGtz
eXNfaW9jdGwrMHhhOS8weGQwIGZzL2lvY3RsLmM6NzQ5Cl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
