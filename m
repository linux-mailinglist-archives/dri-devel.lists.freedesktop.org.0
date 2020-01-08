Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D10F135FC5
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2020 18:52:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDD346E936;
	Thu,  9 Jan 2020 17:51:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 769 seconds by postgrey-1.36 at gabe;
 Wed, 08 Jan 2020 08:48:48 UTC
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 708C66E878;
 Wed,  8 Jan 2020 08:48:48 +0000 (UTC)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 47t2wF6zpLz9v3Hd;
 Wed,  8 Jan 2020 09:48:45 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=Cd0z8iC9; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id eHCnKMUwPC8j; Wed,  8 Jan 2020 09:48:45 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 47t2wF5Z8xz9v3Hc;
 Wed,  8 Jan 2020 09:48:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1578473325; bh=kWCAIl6qlr/NQhjX84pOmCSHzIhFMSBDwvFc83ztIuI=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Cd0z8iC9RC8pjwPeyNjKHDYp8ooejNu3HGALPmb6+R1rGPni1Gqd3Osr1pzBr++DW
 qVroJ655pO9/GIgcKq73QC5BW2ualhxp5CandPHCNUTG1TbQ4ytfyemBB8YchvhikW
 Jys4zIMmlSAmxqdhihc3mS1nPdn3QvL04p1qUK10=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id BCA2B8B7ED;
 Wed,  8 Jan 2020 09:48:46 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id Z-k90vSTB5Ao; Wed,  8 Jan 2020 09:48:46 +0100 (CET)
Received: from [172.25.230.100] (po15451.idsi0.si.c-s.fr [172.25.230.100])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 2CC498B7EA;
 Wed,  8 Jan 2020 09:48:46 +0100 (CET)
Subject: Re: [RFT 00/13] iomap: Constify ioreadX() iomem argument
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <1578415992-24054-1-git-send-email-krzk@kernel.org>
 <CAMuHMdW4ek0OYQDrrbcpZjNUTTP04nSbwkmiZvBmKcU=PQM9qA@mail.gmail.com>
 <CAMuHMdUBmYtJKtSYzS_5u67hVZOqcKSgFY1rDGme6gLNRBJ_gA@mail.gmail.com>
 <CAJKOXPfq9vS4kSyx1jOPHBvi9_HjviRv0LU2A8ZwdmqgUuebHQ@mail.gmail.com>
 <2355489c-a207-1927-54cf-85c04b62f18f@c-s.fr>
 <CAMuHMdV=-m-eN4rOa=XQhk2oBDZZwgXXMU6RMVQRVsc6ALyeoA@mail.gmail.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <00a43e5c-0708-d49a-9cc4-eb2ce8b4cf99@c-s.fr>
Date: Wed, 8 Jan 2020 09:48:46 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <CAMuHMdV=-m-eN4rOa=XQhk2oBDZZwgXXMU6RMVQRVsc6ALyeoA@mail.gmail.com>
Content-Language: fr
X-Mailman-Approved-At: Thu, 09 Jan 2020 17:51:28 +0000
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
 "Michael S. Tsirkin" <mst@redhat.com>, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org, Jason Wang <jasowang@redhat.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 virtualization@lists.linux-foundation.org,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Paul Mackerras <paulus@samba.org>, Linux-Arch <linux-arch@vger.kernel.org>,
 Dave Jiang <dave.jiang@intel.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Helge Deller <deller@gmx.de>, Linux-sh list <linux-sh@vger.kernel.org>,
 Alexey Brodkin <abrodkin@synopsys.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Ben Skeggs <bskeggs@redhat.com>, Dave Airlie <airlied@redhat.com>,
 Matt Turner <mattst88@gmail.com>, arcml <linux-snps-arc@lists.infradead.org>,
 Nick Kossifidis <mickflemm@gmail.com>, Allen Hubbe <allenbh@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, Jon Mason <jdmason@kudzu.us>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Kalle Valo <kvalo@codeaurora.org>,
 Richard Henderson <rth@twiddle.net>,
 Parisc List <linux-parisc@vger.kernel.org>, netdev <netdev@vger.kernel.org>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Vineet Gupta <vgupta@synopsys.com>,
 alpha <linux-alpha@vger.kernel.org>, linux-ntb@googlegroups.com,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgR2VlcnQsCgpMZSAwOC8wMS8yMDIwIMOgIDA5OjQzLCBHZWVydCBVeXR0ZXJob2V2ZW4gYSDD
qWNyaXTCoDoKPiBIaSBDaHJpc3RvcGhlLAo+IAo+IE9uIFdlZCwgSmFuIDgsIDIwMjAgYXQgOToz
NSBBTSBDaHJpc3RvcGhlIExlcm95IDxjaHJpc3RvcGhlLmxlcm95QGMtcy5mcj4gd3JvdGU6Cj4+
IExlIDA4LzAxLzIwMjAgw6AgMDk6MTgsIEtyenlzenRvZiBLb3psb3dza2kgYSDDqWNyaXQgOgo+
Pj4gT24gV2VkLCA4IEphbiAyMDIwIGF0IDA5OjEzLCBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0
QGxpbnV4LW02OGsub3JnPiB3cm90ZToKPj4+PiBPbiBXZWQsIEphbiA4LCAyMDIwIGF0IDk6MDcg
QU0gR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4gd3JvdGU6Cj4+Pj4+
IE9uIFR1ZSwgSmFuIDcsIDIwMjAgYXQgNTo1MyBQTSBLcnp5c3p0b2YgS296bG93c2tpIDxrcnpr
QGtlcm5lbC5vcmc+IHdyb3RlOgo+Pj4+Pj4gVGhlIGlvcmVhZDgvMTYvMzIoKSBhbmQgb3RoZXJz
IGhhdmUgaW5jb25zaXN0ZW50IGludGVyZmFjZSBhbW9uZyB0aGUKPj4+Pj4+IGFyY2hpdGVjdHVy
ZXM6IHNvbWUgdGFraW5nIGFkZHJlc3MgYXMgY29uc3QsIHNvbWUgbm90Lgo+Pj4+Pj4KPj4+Pj4+
IEl0IHNlZW1zIHRoZXJlIGlzIG5vdGhpbmcgcmVhbGx5IHN0b3BwaW5nIGFsbCBvZiB0aGVtIHRv
IHRha2UKPj4+Pj4+IHBvaW50ZXIgdG8gY29uc3QuCj4+Pj4+Cj4+Pj4+IFNob3VsZG4ndCBhbGwg
b2YgdGhlbSB0YWtlIGNvbnN0IHZvbGF0aWxlIF9faW9tZW0gcG9pbnRlcnM/Cj4+Pj4+IEl0IHNl
ZW1zIHRoZSAidm9sYXRpbGUiIGlzIG1pc3NpbmcgZnJvbSBhbGwgYnV0IHRoZSBpbXBsZW1lbnRh
dGlvbnMgaW4KPj4+Pj4gaW5jbHVkZS9hc20tZ2VuZXJpYy9pby5oLgo+Pj4+Cj4+Pj4gQXMgbXkg
InZvbGF0aWxlIiBjb21tZW50IGFwcGxpZXMgdG8gaW93cml0ZSooKSwgdG9vLCBwcm9iYWJseSB0
aGF0IHNob3VsZCBiZQo+Pj4+IGRvbmUgaW4gYSBzZXBhcmF0ZSBwYXRjaC4KPj4+Pgo+Pj4+IEhl
bmNlIHdpdGggcGF0Y2hlcyAxLTUgc3F1YXNoZWQsIGFuZCBmb3IgcGF0Y2hlcyAxMS0xMzoKPj4+
PiBSZXZpZXdlZC1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydCtyZW5lc2FzQGdsaWRlci5i
ZT4KPj4+Cj4+PiBJJ2xsIGFkZCB0byB0aGlzIG9uZSBhbHNvIGNoYW5nZXMgdG8gaW9yZWFkWF9y
ZXAoKSBhbmQgYWRkIGFub3RoZXIKPj4+IHBhdGNoIGZvciB2b2xhdGlsZSBmb3IgcmVhZHMgYW5k
IHdyaXRlcy4gSSBndWVzcyB5b3VyIHJldmlldyB3aWxsIGJlCj4+PiBhcHByZWNpYXRlZCBvbmNl
IG1vcmUgYmVjYXVzZSBvZiBpb3JlYWRYX3JlcCgpCj4+Cj4+IHZvbGF0aWxlIHNob3VsZCByZWFs
bHkgb25seSBiZSB1c2VkIHdoZXJlIGRlZW1lZCBuZWNlc3Nhcnk6Cj4+Cj4+IGh0dHBzOi8vd3d3
Lmtlcm5lbC5vcmcvZG9jL2h0bWwvbGF0ZXN0L3Byb2Nlc3Mvdm9sYXRpbGUtY29uc2lkZXJlZC1o
YXJtZnVsLmh0bWwKPj4KPj4gSXQgaXMgc2FpZDogIiAuLi4gIGFjY2Vzc29yIGZ1bmN0aW9ucyBt
aWdodCB1c2Ugdm9sYXRpbGUgb24KPj4gYXJjaGl0ZWN0dXJlcyB3aGVyZSBkaXJlY3QgSS9PIG1l
bW9yeSBhY2Nlc3MgZG9lcyB3b3JrLiBFc3NlbnRpYWxseSwKPj4gZWFjaCBhY2Nlc3NvciBjYWxs
IGJlY29tZXMgYSBsaXR0bGUgY3JpdGljYWwgc2VjdGlvbiBvbiBpdHMgb3duIGFuZAo+PiBlbnN1
cmVzIHRoYXQgdGhlIGFjY2VzcyBoYXBwZW5zIGFzIGV4cGVjdGVkIGJ5IHRoZSBwcm9ncmFtbWVy
LiIKPiAKPiBUaGF0IGlzIGV4YWN0bHkgdGhlIHVzZSBjYXNlIGhlcmU6IGFsbCBhYm92ZSBhcmUg
YWNjZXNzb3IgZnVuY3Rpb25zLgo+IAo+IFdoeSB3b3VsZCBpb3JlYWRYKCkgbm90IG5lZWQgdm9s
YXRpbGUsIHdoaWxlIHJlYWRZKCkgZG9lcz8KPiAKCk15IHBvaW50IHdhczogaXQgbWlnaHQgYmUg
bmVjZXNzYXJ5IGZvciBzb21lIGFyY2hlcyBhbmQgbm90IGZvciBvdGhlcnMuCgpBbmQgYXMgcG9p
bnRlZCBieSBBcm5kLCB0aGUgdm9sYXRpbGUgaXMgcmVhbGx5IG9ubHkgbmVjZXNzYXJ5IGZvciB0
aGUgCmRlcmVmZXJlbmNlIGl0c2VsZiwgc2hvdWxkIHRoZSBhcmNoIHVzZSBkZXJlZmVyZW5jaW5n
LgoKU28gSSBndWVzcyB0aGUgYmVzdCB3b3VsZCBiZSB0byBnbyBpbiB0aGUgb3RoZXIgZGlyZWN0
aW9uOiByZW1vdmUgCnZvbGF0aWxlIGtleXdvcmQgd2hlcmV2ZXIgcG9zc2libGUgaW5zdGVhZCBv
ZiBhZGRpbmcgaXQgd2hlcmUgaXQgaXMgbm90IApuZWVkZWQuCgpDaHJpc3RvcGhlCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
