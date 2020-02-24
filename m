Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED43016A681
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2020 13:54:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC5F66E47A;
	Mon, 24 Feb 2020 12:54:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E48326E47A;
 Mon, 24 Feb 2020 12:54:11 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id p8so8539488oth.10;
 Mon, 24 Feb 2020 04:54:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=KuIMkn3CNjUmXT9na5O6u952ZSxUT8pEly8T96UQHaU=;
 b=bU2upSL2aUwk3r43ud2g/Me3njxddX6qs5qUdYCh0WKFDEPIDlVW6k14A9DufbqptD
 8+JzgC2FDq91jUgwfFuer1eyrkbkyXJo2bs4BLxqQespsnOttmKZkPfOvbMdsIqDEZEJ
 vmmW7pJsPVpFj5tfw5f7xxRkaOxgfmldYW3CcLtaaeq/XrSdHhcoGfCJyUr/GT+5XjOz
 tVX6kQ2srczlt4x8/oKsj9M9pFSTZmdQTHB2rUALyatnNKg10KngVovbBlUFnh3kXipw
 7N9gam4dNUZWC5PrB6lQmzBJu/7mJTWKbzD9X5qR+R2HlghgWPDlw/S+Xlermn3toCD0
 /vqQ==
X-Gm-Message-State: APjAAAVUKA9tzO4niwUkKeLGHHYeWhIMEo5HCr/1AStw5VCWHTsVoCdW
 UsWRY47UZDCE1ebBl1nYPFm6YlKsL25RiEBQelM=
X-Google-Smtp-Source: APXvYqwtZk2+zO66egcnUYHRtozVqcTMGUrrNpS9RZJQahGOv8qXCcCp9UcRypG9zsmrMsbFU1zCpBady1p1pO44v4k=
X-Received: by 2002:a9d:7984:: with SMTP id h4mr40460889otm.297.1582548851139; 
 Mon, 24 Feb 2020 04:54:11 -0800 (PST)
MIME-Version: 1.0
References: <20200219175007.13627-1-krzk@kernel.org>
 <20200219175007.13627-10-krzk@kernel.org>
 <518a9023-f802-17b3-fca5-582400bc34ae@gmail.com> <20200224124744.GA1949@pi3>
In-Reply-To: <20200224124744.GA1949@pi3>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 24 Feb 2020 13:54:00 +0100
Message-ID: <CAMuHMdVev0PLF=8bD3nHrhcU9UgM-DAgdQpXi09PgvAxdbt24A@mail.gmail.com>
Subject: Re: [RESEND PATCH v2 9/9] ath5k: Constify ioreadX() iomem argument
 (as in generic implementation)
To: Krzysztof Kozlowski <krzk@kernel.org>
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
Cc: Rich Felker <dalias@libc.org>, Jiri Slaby <jirislaby@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 "Michael S. Tsirkin" <mst@redhat.com>, David Airlie <airlied@linux.ie>,
 Jason Wang <jasowang@redhat.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 virtualization@lists.linux-foundation.org,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 netdev <netdev@vger.kernel.org>, Paul Mackerras <paulus@samba.org>,
 Linux-Arch <linux-arch@vger.kernel.org>, Dave Jiang <dave.jiang@intel.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Michael Ellerman <mpe@ellerman.id.au>, Helge Deller <deller@gmx.de>,
 Linux-sh list <linux-sh@vger.kernel.org>,
 Alexey Brodkin <abrodkin@synopsys.com>, Ben Skeggs <bskeggs@redhat.com>,
 nouveau@lists.freedesktop.org, Dave Airlie <airlied@redhat.com>,
 Matt Turner <mattst88@gmail.com>, arcml <linux-snps-arc@lists.infradead.org>,
 Nick Kossifidis <mickflemm@gmail.com>, Allen Hubbe <allenbh@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, alpha <linux-alpha@vger.kernel.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Kalle Valo <kvalo@codeaurora.org>,
 Richard Henderson <rth@twiddle.net>,
 Parisc List <linux-parisc@vger.kernel.org>, Vineet Gupta <vgupta@synopsys.com>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Jon Mason <jdmason@kudzu.us>,
 linux-ntb@googlegroups.com, Andrew Morton <akpm@linux-foundation.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgS3J6eXN6dG9mLAoKT24gTW9uLCBGZWIgMjQsIDIwMjAgYXQgMTo0NyBQTSBLcnp5c3p0b2Yg
S296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+IHdyb3RlOgo+IE9uIFRodSwgRmViIDIwLCAyMDIw
IGF0IDEwOjQ4OjMzQU0gKzAxMDAsIEppcmkgU2xhYnkgd3JvdGU6Cj4gPiBPbiAxOS4gMDIuIDIw
LCAxODo1MCwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPiA+ID4gVGhlIGlvcmVhZFgoKSBo
ZWxwZXJzIGhhdmUgaW5jb25zaXN0ZW50IGludGVyZmFjZS4gIE9uIHNvbWUgYXJjaGl0ZWN0dXJl
cwo+ID4gPiB2b2lkICpfX2lvbWVtIGFkZHJlc3MgYXJndW1lbnQgaXMgYSBwb2ludGVyIHRvIGNv
bnN0LCBvbiBzb21lIG5vdC4KPiA+ID4KPiA+ID4gSW1wbGVtZW50YXRpb25zIG9mIGlvcmVhZFgo
KSBkbyBub3QgbW9kaWZ5IHRoZSBtZW1vcnkgdW5kZXIgdGhlIGFkZHJlc3MKPiA+ID4gc28gdGhl
eSBjYW4gYmUgY29udmVydGVkIHRvIGEgImNvbnN0IiB2ZXJzaW9uIGZvciBjb25zdC1zYWZldHkg
YW5kCj4gPiA+IGNvbnNpc3RlbmN5IGFtb25nIGFyY2hpdGVjdHVyZXMuCj4gPiA+Cj4gPiA+IFNp
Z25lZC1vZmYtYnk6IEtyenlzenRvZiBLb3psb3dza2kgPGtyemtAa2VybmVsLm9yZz4KPiA+ID4g
QWNrZWQtYnk6IEthbGxlIFZhbG8gPGt2YWxvQGNvZGVhdXJvcmEub3JnPgo+ID4gPiAtLS0KPiA+
ID4gIGRyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGg1ay9haGIuYyB8IDEwICsrKysrLS0tLS0K
PiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4g
PiA+Cj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoNWsvYWhi
LmMgYi9kcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoNWsvYWhiLmMKPiA+ID4gaW5kZXggMmM5
Y2VjOGI1M2Q5Li44YmQwMWRmMzY5ZmIgMTAwNjQ0Cj4gPiA+IC0tLSBhL2RyaXZlcnMvbmV0L3dp
cmVsZXNzL2F0aC9hdGg1ay9haGIuYwo+ID4gPiArKysgYi9kcml2ZXJzL25ldC93aXJlbGVzcy9h
dGgvYXRoNWsvYWhiLmMKPiA+ID4gQEAgLTEzOCwxOCArMTM4LDE4IEBAIHN0YXRpYyBpbnQgYXRo
X2FoYl9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ID4gPgo+ID4gPiAgICAg
aWYgKGJjZmctPmRldmlkID49IEFSNUtfU1JFVl9BUjIzMTVfUjYpIHsKPiA+ID4gICAgICAgICAg
ICAgLyogRW5hYmxlIFdNQUMgQUhCIGFyYml0cmF0aW9uICovCj4gPiA+IC0gICAgICAgICAgIHJl
ZyA9IGlvcmVhZDMyKCh2b2lkIF9faW9tZW0gKikgQVI1S19BUjIzMTVfQUhCX0FSQl9DVEwpOwo+
ID4gPiArICAgICAgICAgICByZWcgPSBpb3JlYWQzMigoY29uc3Qgdm9pZCBfX2lvbWVtICopIEFS
NUtfQVIyMzE1X0FIQl9BUkJfQ1RMKTsKPiA+Cj4gPiBXaGlsZSBJIHVuZGVyc3RhbmQgd2h5IHRo
ZSBwYXJhbWV0ZXIgb2YgaW9yZWFkMzIgc2hvdWxkIGJlIGNvbnN0LCBJCj4gPiBkb24ndCBzZWUg
YSByZWFzb24gZm9yIHRoZXNlIGNhc3RzIG9uIHRoZSB1c2Vycycgc2lkZS4gV2hhdCBkb2VzIGl0
Cj4gPiBicmluZyBleGNlcHQgbG9uZ2VyIGNvZGUgdG8gcmVhZD8KPgo+IEJlY2F1c2UgdGhlIGFy
Z3VtZW50IGlzIGFuIGludDoKPgo+IGRyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGg1ay9haGIu
YzogSW4gZnVuY3Rpb24g4oCYYXRoX2FoYl9wcm9iZeKAmToKPiBkcml2ZXJzL25ldC93aXJlbGVz
cy9hdGgvYXRoNWsvYWhiLmM6MTQxOjE4OiB3YXJuaW5nOiBwYXNzaW5nIGFyZ3VtZW50IDEgb2Yg
4oCYaW9yZWFkMzLigJkgbWFrZXMgcG9pbnRlciBmcm9tIGludGVnZXIgd2l0aG91dCBhIGNhc3Qg
Wy1XaW50LWNvbnZlcnNpb25dCj4gICAgcmVnID0gaW9yZWFkMzIoQVI1S19BUjIzMTVfQUhCX0FS
Ql9DVEwpOwoKVGhhdCdzIGFuIGFyZ3VtZW50IGZvciBrZWVwaW5nIHRoZSBjYXN0IHRvICJ2b2lk
IF9faW9tZW0gKiIsIG5vdCBmb3IKYWRkaW5nIHRoZSAiY29uc3QiLCByaWdodD8KCkdye29ldGpl
LGVldGluZ31zLAoKICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQKCi0tIApHZWVydCBVeXR0
ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxp
bnV4LW02OGsub3JnCgpJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBl
b3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0CndoZW4gSSdtIHRhbGtpbmcgdG8gam91
cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4K
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcwpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
