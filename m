Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 15CE91479B4
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2020 09:52:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56B1F6FF88;
	Fri, 24 Jan 2020 08:52:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 248396FE56
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2020 19:47:13 +0000 (UTC)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 483Xq32wGFz9twsF;
 Thu, 23 Jan 2020 20:47:11 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=GiT4oOAM; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id SdrD6o_7qs43; Thu, 23 Jan 2020 20:47:11 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 483Xq31j0Sz9twsD;
 Thu, 23 Jan 2020 20:47:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1579808831; bh=7aISpSDwk7v2lI/VXtmtSlwWRv+BW39/h3hG4uOf4xk=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=GiT4oOAMsDoIJbqHVSxG301CAWwldgZmQRaIfFMSVrBDbBc/V9IXlyBKUf1FQX89s
 crLgitQifrTzbgyEVrCPJRbrcv2z6CpXbA2e1nkKThpAmm/AlGNMSMpu/ixIreuf5B
 KfqT02ezurVVK0RQGGtRw0A4me1TlQkiUzi+NGDM=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 3C6F28B837;
 Thu, 23 Jan 2020 20:47:11 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id LHxckWJhJw66; Thu, 23 Jan 2020 20:47:11 +0100 (CET)
Received: from [192.168.232.53] (unknown [192.168.232.53])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 151148B836;
 Thu, 23 Jan 2020 20:47:10 +0100 (CET)
Subject: Re: [PATCH v3 2/7] uaccess: Tell user_access_begin() if it's for a
 write or not
To: Linus Torvalds <torvalds@linux-foundation.org>
References: <fed4f49349913cb6739dac647ba6a61d56b989d2.1579783936.git.christophe.leroy@c-s.fr>
 <e11a8f0670251267f87e3114e0bdbacb1eb72980.1579783936.git.christophe.leroy@c-s.fr>
 <CAHk-=wg4HEABOZdjxMzbembNmxs1zYfrNAEc2L+JS9FBSnM8JA@mail.gmail.com>
From: christophe leroy <christophe.leroy@c-s.fr>
Message-ID: <fc5c94a2-5a25-0715-5240-5ba3cbe0f2b2@c-s.fr>
Date: Thu, 23 Jan 2020 20:47:06 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <CAHk-=wg4HEABOZdjxMzbembNmxs1zYfrNAEc2L+JS9FBSnM8JA@mail.gmail.com>
Content-Language: fr
X-Antivirus: Avast (VPS 200122-2, 22/01/2020), Outbound message
X-Antivirus-Status: Not-Tested
X-Mailman-Approved-At: Fri, 24 Jan 2020 08:52:34 +0000
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
Cc: the arch/x86 maintainers <x86@kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux-MM <linux-mm@kvack.org>, Ingo Molnar <mingo@redhat.com>,
 Paul Mackerras <paulus@samba.org>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Michael Ellerman <mpe@ellerman.id.au>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>, Borislav Petkov <bp@alien8.de>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Thomas Gleixner <tglx@linutronix.de>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpMZSAyMy8wMS8yMDIwIMOgIDE5OjAyLCBMaW51cyBUb3J2YWxkcyBhIMOpY3JpdMKgOgo+IE9u
IFRodSwgSmFuIDIzLCAyMDIwIGF0IDQ6NTkgQU0gQ2hyaXN0b3BoZSBMZXJveQo+IDxjaHJpc3Rv
cGhlLmxlcm95QGMtcy5mcj4gd3JvdGU6Cj4+Cj4+IE9uIDMyIGJpdHMgcG93ZXJQQyAoYm9vazNz
LzMyKSwgb25seSB3cml0ZSBhY2Nlc3NlcyB0byB1c2VyIGFyZQo+PiBwcm90ZWN0ZWQgYW5kIHRo
ZXJlIGlzIG5vIHBvaW50IHNwZW5kaW5nIHRpbWUgb24gdW5sb2NraW5nIGZvciByZWFkcy4KPiAK
PiBIb25lc3RseSwgSSdtIHN0YXJ0aW5nIHRvIHRoaW5rIHRoYXQgMzItYml0IHBwYyBqdXN0IG5l
ZWRzIHRvIGxvb2sKPiBtb3JlIGxpa2UgZXZlcnlib2R5IGVsc2UsIHRoYW4gbWFrZSB0aGVzZSBj
aGFuZ2VzLgoKV2VsbCwgYmVzaWRlIHBwYzMyLCBJIHdhcyBhbHNvIHNlZW4gaXQgYXMgYW4gb3Bw
b3J0dW5pdHkgZm9yIHRoZSBtb2Rlcm4gCnBwYzY0LiBPbiBpdCwgeW91IGNhbiB1bmxvY2sgZWl0
aGVyIHJlYWQgb3Igd3JpdGUgb3IgYm90aC4gQW5kIHRoaXMgaXMgCndoYXQgaXMgZG9uZSBmb3Ig
Z2V0X3VzZXIoKSAvIHB1dF91c2VyKCkgYW5kIGZyaWVuZHM6IHVubG9jayBvbmx5IHJlYWRzIApm
b3IgZ2V0X3VzZXIoKSBhbmQgb25seSB3cml0ZXMgZm9yIHB1dF91c2VyKCkuCgpDb3VsZCBhbHNv
IGJlIGEgY29tcHJvbWlzZSBiZXR3ZWVuIHBlcmZvcm1hbmNlIGFuZCBzZWN1cml0eToga2VlcGlu
ZyAKcmVhZHMgYWxsb3dlZCBhdCBhbGwgdGltZSBhbmQgb25seSBwcm90ZWN0IGFnYWluc3Qgd3Jp
dGVzIG9uIG1vZGVybiAKYXJjaGl0ZWN0dXJlcyB3aGljaCBzdXBwb3J0IGl0IGxpa2UgcHBjNjQu
Cgo+IAo+IFdlIHVzZWQgdG8gaGF2ZSBhIHJlYWQvd3JpdGUgYXJndW1lbnQgdG8gdGhlIG9sZCAi
dmVyaWZ5X2FyZWEoKSIgYW5kCj4gImFjY2Vzc19vaygpIiBtb2RlbCwgYW5kIGl0IHdhcyBhIG1p
c3Rha2UuIEl0IHdhcyBkdWUgdG8gb2RkIGkzODYgdXNlcgo+IGFjY2VzcyBpc3N1ZXMuIFdlIGdv
dCByaWQgb2YgaXQuIEknbSBub3QgY29udmluY2VkIHRoaXMgaXMgYW55IGJldHRlcgo+IC0gaXQg
bG9va3MgdmVyeSBzaW1pbGFyIGFuZCBmb3Igb2RkIHBwYyBhY2Nlc3MgaXNzdWVzLgoKSSdtIGdv
aW5nIHRvIGxlYXZlIGl0IGFzaWRlLCBhdCBsZWFzdCBmb3IgdGhlIHRpbWUgYmVpbmcsIGFuZCBk
byBpdCBhcyBhIApzZWNvbmQgc3RlcCBsYXRlciBhZnRlciBldmFsdWF0aW5nIHRoZSByZWFsIHBl
cmZvcm1hbmNlIGltcGFjdC4gSSdsbCAKcmVzcGluIHRvbW9ycm93IGluIHRoYXQgd2F5LgoKPiAK
PiBCdXQgaWYgd2UgcmVhbGx5IGRvIHdhbnQgdG8gZG8gdGhpcywgdGhlbjoKCkluZGVlZCBJIHRv
b2sgdGhlIGlkZWEgZnJvbSBhIGRpc2N1c3Npb24gaW4gbGFzdCBPY3RvYnJlIChTdWJqZWN0OiAK
ImJvb2szcy8zMiBLVUFQICh3YXMgUmU6IFtQQVRDSF0gQ29udmVydCBmaWxsZGlyWzY0XSgpIGZy
b20gX19wdXRfdXNlcigpIAp0byB1bnNhZmVfcHV0X3VzZXIoKSkiICkKCmh0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL2xrbWwvODdoODRhdmZmaS5mc2ZAbXBlLmVsbGVybWFuLmlkLmF1LwoKCj4gCj4+
IEFkZCBhbiBhcmd1bWVudCB0byB1c2VyX2FjY2Vzc19iZWdpbigpIHRvIHRlbGwgd2hlbiBpdCdz
IGZvciB3cml0ZSBhbmQKPj4gcmV0dXJuIGFuIG9wYXF1ZSBrZXkgdGhhdCB3aWxsIGJlIHVzZWQg
YnkgdXNlcl9hY2Nlc3NfZW5kKCkgdG8ga25vdwo+PiB3aGF0IHdhcyBkb25lIGJ5IHVzZXJfYWNj
ZXNzX2JlZ2luKCkuCj4gCj4gWW91IHNob3VsZCBtYWtlIGl0IG1vcmUgb3BhcXVlIHRoYW4gInVu
c2lnbmVkIGxvbmciLgo+IAo+IEFsc28sIGl0IHNob3VsZG4ndCBiZSBhICJpcyB0aGlzIGEgd3Jp
dGUiLiBXaGF0IGlmIGl0J3MgYSByZWFkIF9hbmRfIGEKPiB3cml0ZT8gT25seSBhIHdyaXRlPyBP
bmx5IGEgcmVhZD8KCkluZGVlZCB0aGF0IHdhcyBtb3JlOiBkb2VzIGl0IGluY2x1ZGVzIGEgd3Jp
dGUuIEl0J3MgZWl0aGVyIFJPIG9yIFJXCgpDaHJpc3RvcGhlCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
