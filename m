Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22235116A00
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2019 10:47:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2E846E39B;
	Mon,  9 Dec 2019 09:47:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7A8A6FAF4
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Dec 2019 07:23:07 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id 38so9569951qtb.13
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Dec 2019 23:23:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WKRU5pSG2PRY1i50C6ckRyYjlPu0mkUgyvtTtKKNwF4=;
 b=NCldiHXK8Zx2BKg3f2mQs6OW1AyvR/Oyvnb9njCknZXd/sCstc5um6emA3Y9FWEtn5
 skLfc5od26R9yKiw5pSg/hCsj7AZX9tX3Ac7/C7qQUHXJSIqtdBOl5Epicj8b/B0cDl0
 AP8AqYuIsm9B3i7i2oKhclAzF33JAxg8trqpmRgSBzjxRwEqNlcF0487j2hG1sRNHSep
 VSx0wk33oGu+ffXGMDgYKwof0GrqNfbxUk1/iGhjXScELzSBs8XJV70pDzjd/Y2k/a86
 9u7F75uOQ85f295tTw3UVXrgCG3bjHelTWqSIFCYaNURuJnIbwSYPnrejF+/uIHO2HNm
 mtew==
X-Gm-Message-State: APjAAAWX44ax4B05vp/zsjWa8uJoYjI52I7YnIu3HVVNQw0d4/a0wmSK
 RuVyHGd7HLNjA9G2wz1AHyb6nkHb4FZo5eajJ8h1Zw==
X-Google-Smtp-Source: APXvYqzADYcdsyMtAGfTGhS9VBKWgLIVQ8HeiaaMSQTOXcfnjmm1OYt8/HHEC3dw5lwpNOgSzkdKcfJ7rQeL88sn7Ro=
X-Received: by 2002:ac8:3905:: with SMTP id s5mr16470924qtb.158.1575703386571; 
 Fri, 06 Dec 2019 23:23:06 -0800 (PST)
MIME-Version: 1.0
References: <000000000000e1d639059908223b@google.com>
 <000000000000fdd04105990b9c93@google.com>
In-Reply-To: <000000000000fdd04105990b9c93@google.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Sat, 7 Dec 2019 08:22:55 +0100
Message-ID: <CACT4Y+ahbULUDLhmNxqEffU1BbAiMuZ7Da6DurdX4XwUftROmg@mail.gmail.com>
Subject: Re: KASAN: use-after-free Read in soft_cursor
To: syzbot <syzbot+cf43fb300aa142fb024b@syzkaller.appspotmail.com>
X-Mailman-Approved-At: Mon, 09 Dec 2019 09:46:36 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=WKRU5pSG2PRY1i50C6ckRyYjlPu0mkUgyvtTtKKNwF4=;
 b=TSgkeFFjw9IXx/DReyCPlEeIMmu0k9IyhNUDT03zvwWvvnOt4VzeW6knY8j/T4K5zc
 JMzRL2mIa03FbkvOn3Wq+DnFMm1HZiqVi23oZL63A1ZKFBqOZ942cxk6h3ZDSTnP+6mb
 tJx2BEfefiTerW4vzKLvOLGzyU6N27A0nDi0mFMcMM5BJwmnGDf7DdbI1yg1NozpJxft
 Ven48GSQ08+cKs07SJsnB7OVl7W6S0QJhBBgsgZKtiqKZfNnd6W9v0Rf/3Y9s/dEDHRC
 khXrqNPdvJnIgOAV8r8/cTFE+mCQ/KGb4nkhTKqU3htoekizxTxrYC5GouMtlWrdWiPg
 5YrA==
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
Cc: stewart@linux.vnet.ibm.com,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 LKML <linux-kernel@vger.kernel.org>, Russell Currey <ruscur@russell.cc>,
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>, gwshan@linux.vnet.ibm.com,
 DRI <dri-devel@lists.freedesktop.org>, David Miller <davem@davemloft.net>,
 coreteam@netfilter.org, NetFilter <netfilter-devel@vger.kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>, netdev <netdev@vger.kernel.org>,
 Patrick McHardy <kaber@trash.net>, Pablo Neira Ayuso <pablo@netfilter.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBEZWMgNiwgMjAxOSBhdCA1OjM0IFBNIHN5emJvdAo8c3l6Ym90K2NmNDNmYjMwMGFh
MTQyZmIwMjRiQHN5emthbGxlci5hcHBzcG90bWFpbC5jb20+IHdyb3RlOgo+Cj4gc3l6Ym90IGhh
cyBiaXNlY3RlZCB0aGlzIGJ1ZyB0bzoKPgo+IGNvbW1pdCAyZGU1MGU5Njc0ZmM0Y2EzYzYxNzRi
MDQ0NzdmNjllYjI2YjRlZTMxCj4gQXV0aG9yOiBSdXNzZWxsIEN1cnJleSA8cnVzY3VyQHJ1c3Nl
bGwuY2M+Cj4gRGF0ZTogICBNb24gRmViIDggMDQ6MDg6MjAgMjAxNiArMDAwMAo+Cj4gICAgICBw
b3dlcnBjL3Bvd2VybnY6IFJlbW92ZSBzdXBwb3J0IGZvciBwNWlvYzIKCkFub3RoZXIgd2VpcmQg
b25lLCBJIG11c3QgYmUgbWlzc2luZyBzb21ldGhpbmcgb2J2aW91cyBhYm91dCBob3cgZ2l0CmJp
c2VjdCB3b3Jrcy4uLiBJIGtlZXAgYWRkaW5nIHRoZXNlIHRvOgpodHRwczovL2dpdGh1Yi5jb20v
Z29vZ2xlL3N5emthbGxlci9pc3N1ZXMvMTUyNwoKPiBiaXNlY3Rpb24gbG9nOiAgaHR0cHM6Ly9z
eXprYWxsZXIuYXBwc3BvdC5jb20veC9iaXNlY3QudHh0P3g9MTUxMmQxYmNlMDAwMDAKPiBzdGFy
dCBjb21taXQ6ICAgYjBkNGJlYWEgTWVyZ2UgYnJhbmNoICduZXh0LmF1dG9mcycgb2YgZ2l0Oi8v
Z2l0Lmtlcm5lbC5vci4uCj4gZ2l0IHRyZWU6ICAgICAgIHVwc3RyZWFtCj4gZmluYWwgY3Jhc2g6
ICAgIGh0dHBzOi8vc3l6a2FsbGVyLmFwcHNwb3QuY29tL3gvcmVwb3J0LnR4dD94PTE3MTJkMWJj
ZTAwMDAwCj4gY29uc29sZSBvdXRwdXQ6IGh0dHBzOi8vc3l6a2FsbGVyLmFwcHNwb3QuY29tL3gv
bG9nLnR4dD94PTEzMTJkMWJjZTAwMDAwCj4ga2VybmVsIGNvbmZpZzogIGh0dHBzOi8vc3l6a2Fs
bGVyLmFwcHNwb3QuY29tL3gvLmNvbmZpZz94PWYwN2EyMzAyMGZkN2QyMWEKPiBkYXNoYm9hcmQg
bGluazogaHR0cHM6Ly9zeXprYWxsZXIuYXBwc3BvdC5jb20vYnVnP2V4dGlkPWNmNDNmYjMwMGFh
MTQyZmIwMjRiCj4gc3l6IHJlcHJvOiAgICAgIGh0dHBzOi8vc3l6a2FsbGVyLmFwcHNwb3QuY29t
L3gvcmVwcm8uc3l6P3g9MTc0NWE5MGVlMDAwMDAKPiBDIHJlcHJvZHVjZXI6ICAgaHR0cHM6Ly9z
eXprYWxsZXIuYXBwc3BvdC5jb20veC9yZXByby5jP3g9MTM2MTA0MmFlMDAwMDAKPgo+IFJlcG9y
dGVkLWJ5OiBzeXpib3QrY2Y0M2ZiMzAwYWExNDJmYjAyNGJAc3l6a2FsbGVyLmFwcHNwb3RtYWls
LmNvbQo+IEZpeGVzOiAyZGU1MGU5Njc0ZmMgKCJwb3dlcnBjL3Bvd2VybnY6IFJlbW92ZSBzdXBw
b3J0IGZvciBwNWlvYzIiKQo+Cj4gRm9yIGluZm9ybWF0aW9uIGFib3V0IGJpc2VjdGlvbiBwcm9j
ZXNzIHNlZTogaHR0cHM6Ly9nb28uZ2wvdHBzbUVKI2Jpc2VjdGlvbgo+Cj4gLS0KPiBZb3UgcmVj
ZWl2ZWQgdGhpcyBtZXNzYWdlIGJlY2F1c2UgeW91IGFyZSBzdWJzY3JpYmVkIHRvIHRoZSBHb29n
bGUgR3JvdXBzICJzeXprYWxsZXItYnVncyIgZ3JvdXAuCj4gVG8gdW5zdWJzY3JpYmUgZnJvbSB0
aGlzIGdyb3VwIGFuZCBzdG9wIHJlY2VpdmluZyBlbWFpbHMgZnJvbSBpdCwgc2VuZCBhbiBlbWFp
bCB0byBzeXprYWxsZXItYnVncyt1bnN1YnNjcmliZUBnb29nbGVncm91cHMuY29tLgo+IFRvIHZp
ZXcgdGhpcyBkaXNjdXNzaW9uIG9uIHRoZSB3ZWIgdmlzaXQgaHR0cHM6Ly9ncm91cHMuZ29vZ2xl
LmNvbS9kL21zZ2lkL3N5emthbGxlci1idWdzLzAwMDAwMDAwMDAwMGZkZDA0MTA1OTkwYjljOTMl
NDBnb29nbGUuY29tLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
