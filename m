Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E37B135FD4
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2020 18:52:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 759FF6E959;
	Thu,  9 Jan 2020 17:51:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68F616E878;
 Wed,  8 Jan 2020 08:50:49 +0000 (UTC)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 47t2dP2tfYz9v3gf;
 Wed,  8 Jan 2020 09:35:53 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=fxUelGuu; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id I0TjIRBHFA-4; Wed,  8 Jan 2020 09:35:53 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 47t2dP1Xwtz9v3gS;
 Wed,  8 Jan 2020 09:35:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1578472553; bh=pyCqgPPZ7kRofrDb80nScePrylWdxYR2l2/ULCClPrs=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=fxUelGuuZbXfGsWb57/3BxUjvtvdC/2QbyAEo6YqIvKJAL5rv4xC8YAPDeq7nhud3
 dkB/UdAQUigd1rFWPHMhgX/6Fa4jCdXgPI62S3zygNDeTcqR1ZOBKH62ej2i0cflHq
 zb2g6a/VdTBtVa3azjNLc7pwBVFpYUnXR94BgWzQ=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 2FF4A8B7EC;
 Wed,  8 Jan 2020 09:35:54 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id PkGUzhhRpTGx; Wed,  8 Jan 2020 09:35:54 +0100 (CET)
Received: from [172.25.230.100] (po15451.idsi0.si.c-s.fr [172.25.230.100])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id BE1C98B7EA;
 Wed,  8 Jan 2020 09:35:53 +0100 (CET)
Subject: Re: [RFT 00/13] iomap: Constify ioreadX() iomem argument
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>
References: <1578415992-24054-1-git-send-email-krzk@kernel.org>
 <CAMuHMdW4ek0OYQDrrbcpZjNUTTP04nSbwkmiZvBmKcU=PQM9qA@mail.gmail.com>
 <CAMuHMdUBmYtJKtSYzS_5u67hVZOqcKSgFY1rDGme6gLNRBJ_gA@mail.gmail.com>
 <CAJKOXPfq9vS4kSyx1jOPHBvi9_HjviRv0LU2A8ZwdmqgUuebHQ@mail.gmail.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <2355489c-a207-1927-54cf-85c04b62f18f@c-s.fr>
Date: Wed, 8 Jan 2020 09:35:54 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <CAJKOXPfq9vS4kSyx1jOPHBvi9_HjviRv0LU2A8ZwdmqgUuebHQ@mail.gmail.com>
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
 Alexey Brodkin <abrodkin@synopsys.com>, Ben Skeggs <bskeggs@redhat.com>,
 Dave Airlie <airlied@redhat.com>, Matt Turner <mattst88@gmail.com>,
 arcml <linux-snps-arc@lists.infradead.org>,
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

CgpMZSAwOC8wMS8yMDIwIMOgIDA5OjE4LCBLcnp5c3p0b2YgS296bG93c2tpIGEgw6ljcml0wqA6
Cj4gT24gV2VkLCA4IEphbiAyMDIwIGF0IDA5OjEzLCBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0
QGxpbnV4LW02OGsub3JnPiB3cm90ZToKPj4KPj4gSGkgS3J6eXN6dG9mLAo+Pgo+PiBPbiBXZWQs
IEphbiA4LCAyMDIwIGF0IDk6MDcgQU0gR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1t
NjhrLm9yZz4gd3JvdGU6Cj4+PiBPbiBUdWUsIEphbiA3LCAyMDIwIGF0IDU6NTMgUE0gS3J6eXN6
dG9mIEtvemxvd3NraSA8a3J6a0BrZXJuZWwub3JnPiB3cm90ZToKPj4+PiBUaGUgaW9yZWFkOC8x
Ni8zMigpIGFuZCBvdGhlcnMgaGF2ZSBpbmNvbnNpc3RlbnQgaW50ZXJmYWNlIGFtb25nIHRoZQo+
Pj4+IGFyY2hpdGVjdHVyZXM6IHNvbWUgdGFraW5nIGFkZHJlc3MgYXMgY29uc3QsIHNvbWUgbm90
Lgo+Pj4+Cj4+Pj4gSXQgc2VlbXMgdGhlcmUgaXMgbm90aGluZyByZWFsbHkgc3RvcHBpbmcgYWxs
IG9mIHRoZW0gdG8gdGFrZQo+Pj4+IHBvaW50ZXIgdG8gY29uc3QuCj4+Pgo+Pj4gU2hvdWxkbid0
IGFsbCBvZiB0aGVtIHRha2UgY29uc3Qgdm9sYXRpbGUgX19pb21lbSBwb2ludGVycz8KPj4+IEl0
IHNlZW1zIHRoZSAidm9sYXRpbGUiIGlzIG1pc3NpbmcgZnJvbSBhbGwgYnV0IHRoZSBpbXBsZW1l
bnRhdGlvbnMgaW4KPj4+IGluY2x1ZGUvYXNtLWdlbmVyaWMvaW8uaC4KPj4KPj4gQXMgbXkgInZv
bGF0aWxlIiBjb21tZW50IGFwcGxpZXMgdG8gaW93cml0ZSooKSwgdG9vLCBwcm9iYWJseSB0aGF0
IHNob3VsZCBiZQo+PiBkb25lIGluIGEgc2VwYXJhdGUgcGF0Y2guCj4+Cj4+IEhlbmNlIHdpdGgg
cGF0Y2hlcyAxLTUgc3F1YXNoZWQsIGFuZCBmb3IgcGF0Y2hlcyAxMS0xMzoKPj4gUmV2aWV3ZWQt
Ynk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+Cj4gCj4gSSds
bCBhZGQgdG8gdGhpcyBvbmUgYWxzbyBjaGFuZ2VzIHRvIGlvcmVhZFhfcmVwKCkgYW5kIGFkZCBh
bm90aGVyCj4gcGF0Y2ggZm9yIHZvbGF0aWxlIGZvciByZWFkcyBhbmQgd3JpdGVzLiBJIGd1ZXNz
IHlvdXIgcmV2aWV3IHdpbGwgYmUKPiBhcHByZWNpYXRlZCBvbmNlIG1vcmUgYmVjYXVzZSBvZiBp
b3JlYWRYX3JlcCgpCj4gCgp2b2xhdGlsZSBzaG91bGQgcmVhbGx5IG9ubHkgYmUgdXNlZCB3aGVy
ZSBkZWVtZWQgbmVjZXNzYXJ5OgoKaHR0cHM6Ly93d3cua2VybmVsLm9yZy9kb2MvaHRtbC9sYXRl
c3QvcHJvY2Vzcy92b2xhdGlsZS1jb25zaWRlcmVkLWhhcm1mdWwuaHRtbAoKSXQgaXMgc2FpZDog
IiAuLi4gIGFjY2Vzc29yIGZ1bmN0aW9ucyBtaWdodCB1c2Ugdm9sYXRpbGUgb24gCmFyY2hpdGVj
dHVyZXMgd2hlcmUgZGlyZWN0IEkvTyBtZW1vcnkgYWNjZXNzIGRvZXMgd29yay4gRXNzZW50aWFs
bHksIAplYWNoIGFjY2Vzc29yIGNhbGwgYmVjb21lcyBhIGxpdHRsZSBjcml0aWNhbCBzZWN0aW9u
IG9uIGl0cyBvd24gYW5kIAplbnN1cmVzIHRoYXQgdGhlIGFjY2VzcyBoYXBwZW5zIGFzIGV4cGVj
dGVkIGJ5IHRoZSBwcm9ncmFtbWVyLiIKCkNocmlzdG9waGUKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
