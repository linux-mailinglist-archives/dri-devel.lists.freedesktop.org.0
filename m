Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E8661B0A5
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2019 09:01:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E181894C0;
	Mon, 13 May 2019 07:01:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f68.google.com (mail-vs1-f68.google.com
 [209.85.217.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 350E58946E;
 Mon, 13 May 2019 07:01:27 +0000 (UTC)
Received: by mail-vs1-f68.google.com with SMTP id q13so2482222vso.2;
 Mon, 13 May 2019 00:01:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KZeUlM9HFwsoPba3BedCeGi13MK+EsvDzCuCOHnSeSU=;
 b=MXF3dn638OP0bBSjPsF1dxYLsPOKMIUa4DU2MOKh96QT7XED385jOinS4etD6K4des
 6Zy2YpFqKZPmSX84KH5Y9+5nvFp4figFgWw16wOzw2SWtKiZQPguOBm21E+VvDJW3frH
 ONgNaQxwqGViEsmJOuQvxiyh5USHDbUs/Jg13+fQKM8qTuturRwuDaTuOmSmD1nBid3G
 g7h3YLpKGi43K0l15cEXzRQjCMsWnwXz0PVCNmdwZdv6nT+AghTwmWsuKYwq+9VVcNT8
 5AiI1YSY/7Rk4y1ugKipHVwon4xN73pm6HV6K6hh1mLqMR8ghdwcPwaTiRpAEnDcez1Q
 QBjw==
X-Gm-Message-State: APjAAAWJwq1eV+4QQdXzbZfxScwM471FijRm8IFHuWtkCI6iZd4DLnob
 JMGFAPyVPKPuTRRl9hA4yp/cJMLtPwiQPPFsMQ4=
X-Google-Smtp-Source: APXvYqxs4U9cC6qSMiyVDwFNxNbvddkvfAvZ+WOBelGbmcS7WwGSJect4/Alo1+2rHfzk8JgMisDv2BcZmORdVLPpig=
X-Received: by 2002:a67:770f:: with SMTP id s15mr4419527vsc.11.1557730886319; 
 Mon, 13 May 2019 00:01:26 -0700 (PDT)
MIME-Version: 1.0
References: <20190508070148.23130-1-alastair@au1.ibm.com>
 <20190508070148.23130-4-alastair@au1.ibm.com>
In-Reply-To: <20190508070148.23130-4-alastair@au1.ibm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 13 May 2019 09:01:14 +0200
Message-ID: <CAMuHMdVefYTgHzGKBc0ebku1z8V3wsM0ydN+6-S2nFKaB8eH_Q@mail.gmail.com>
Subject: Re: [PATCH v2 3/7] lib/hexdump.c: Optionally suppress lines of
 repeated bytes
To: "Alastair D'Silva" <alastair@au1.ibm.com>
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
 Stanislaw Gruszka <sgruszka@redhat.com>, Petr Mladek <pmladek@suse.com>,
 David Airlie <airlied@linux.ie>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 driverdevel <devel@driverdev.osuosl.org>, scsi <linux-scsi@vger.kernel.org>,
 Jassi Brar <jassisinghbrar@gmail.com>, ath10k@lists.infradead.org,
 Steven Rostedt <rostedt@goodmis.org>, alastair@d-silva.org,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Dan Carpenter <dan.carpenter@oracle.com>, Jose Abreu <Jose.Abreu@synopsys.com>,
 Tom Lendacky <thomas.lendacky@amd.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 Linux FS Devel <linux-fsdevel@vger.kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Kalle Valo <kvalo@codeaurora.org>,
 Karsten Keil <isdn@linux-pingi.de>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 David Laight <David.Laight@aculab.com>, netdev <netdev@vger.kernel.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQWxhc3RhaXIsCgpUaGFua3MgZm9yIHlvdXIgcGF0Y2ghCgpPbiBXZWQsIE1heSA4LCAyMDE5
IGF0IDk6MDQgQU0gQWxhc3RhaXIgRCdTaWx2YSA8YWxhc3RhaXJAYXUxLmlibS5jb20+IHdyb3Rl
Ogo+IEZyb206IEFsYXN0YWlyIEQnU2lsdmEgPGFsYXN0YWlyQGQtc2lsdmEub3JnPgo+Cj4gU29t
ZSBidWZmZXJzIG1heSBvbmx5IGJlIHBhcnRpYWxseSBmaWxsZWQgd2l0aCB1c2VmdWwgZGF0YSwg
d2hpbGUgdGhlIHJlc3QKPiBpcyBwYWRkZWQgKHR5cGljYWxseSB3aXRoIDB4MDAgb3IgMHhmZiku
Cj4KPiBUaGlzIHBhdGNoIGludHJvZHVjZXMgYSBmbGFnIHRvIGFsbG93IHRoZSBzdXByZXNzaW9u
IG9mIGxpbmVzIG9mIHJlcGVhdGVkCj4gYnl0ZXMsCgpHaXZlbiBwcmludF9oZXhfZHVtcCgpIG9w
ZXJhdGVzIG9uIGVudGl0aWVzIG9mIGdyb3Vwc2l6ZSAoMSwgMiwgNCwgb3IgOCkKYnl0ZXMsIHdv
dWxkbid0IGl0IG1ha2UgbW9yZSBzZW5zZSB0byBjb25zaWRlciByZXBlYXRlZCBncm91cHMgaW5z
dGVhZApvZiByZXBlYXRlZCBieXRlcz8KCj4gd2hpY2ggYXJlIHJlcGxhY2VkIHdpdGggJyoqIFNr
aXBwZWQgJXUgYnl0ZXMgb2YgdmFsdWUgMHgleCAqKicKClVzaW5nIGEgY3VzdG9tIG1lc3NhZ2Ug
aW5zdGVhZCBvZiBqdXN0ICIqIiwgbGlrZSAiaGV4ZHVtcCIgdXNlcywgd2lsbApyZXF1aXJlIHBy
ZXByb2Nlc3NpbmcgdGhlIG91dHB1dCB3aGVuIHJlY292ZXJpbmcgdGhlIG9yaWdpbmFsIGJpbmFy
eQpkYXRhIGJ5IGZlZWRpbmcgaXQgdG8gZS5nLiAieHhkIi4KVGhpcyBtYXkgc291bmQgd29yc2Ug
dGhhbiBpdCBpcywgdGhvdWdoLCBhcyBJIG5ldmVyIGdvdCAieHhkIiB0byB3b3JrCndpdGhvdXQg
cHJlcHJvY2Vzc2luZyBhbnl3YXkgOy0pCgogICAgJCBjYXQgJCh0eXBlIC1wIHVuaGV4ZHVtcCkK
ICAgICMhL2Jpbi9zaAogICAgc2VkICdzL15bMC05YS1mXSovLycgJDEgfCB4eGQgLXIgLXAgfCBk
ZCBjb252PXN3YWIKCkdye29ldGplLGVldGluZ31zLAoKICAgICAgICAgICAgICAgICAgICAgICAg
R2VlcnQKCi0tIApHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJl
eW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LW02OGsub3JnCgpJbiBwZXJzb25hbCBjb252ZXJzYXRp
b25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0Cndo
ZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Ig
c29tZXRoaW5nIGxpa2UgdGhhdC4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBM
aW51cyBUb3J2YWxkcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
