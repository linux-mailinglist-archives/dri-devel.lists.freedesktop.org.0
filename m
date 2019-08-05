Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5464982CA6
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2019 09:25:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5810789FAD;
	Tue,  6 Aug 2019 07:24:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB47A6E14A;
 Mon,  5 Aug 2019 19:30:06 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id x15so75844278wmj.3;
 Mon, 05 Aug 2019 12:30:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=4TR1ROvSxrSW2jGMt/9xUpK6NJiArbHQHezkRC5T3No=;
 b=tpz4HCxfBjh8VIH5oHa+gkHtrs+IJGxyI6cfukRLTHc0EGEOGX1kQ5UPdtII0M7TiD
 1VlIQ3vcIFSQAN9iQIDnkxTtqg30HpUgUeiex3dSZ7HFe72Ihw2D5t4JzQG1XNOkducr
 0sjRF8vyThG2HDtZ7Kyymi9T4zo4rHvZnNvTese2u26ucpVPigMNr/fbwabKBkIIKUFA
 Kax/cJzBvu6oZ4DDkjzNep4G54A3KrT8b4RaYT1Pok8ac1Wjtf6jBsSipKRcXK7WJdlg
 FNRZ6RZuMCEsfOL9f1dpK5ef5CuAeHYvtCUVESDvjxSfO1pAo3pTjytSjd5fTU096Klq
 uBRQ==
X-Gm-Message-State: APjAAAVSc3tpiCsYshqxuUN/KCULFSsUGkyFimh1JwWr8Ini9l1CRmn3
 EpVpomhOWHG8gu5QvfkPcRhsM+k4pufwkgaHQFA=
X-Google-Smtp-Source: APXvYqyGSzwDfUb1BiB433k508Z+fmaGZSrxRSK52vSJD6e/xnBmIqpLNGWQq/QRx1YQtmC7gqxrqWy42fyxNAsztfw=
X-Received: by 2002:a05:600c:225a:: with SMTP id
 a26mr20957306wmm.81.1565033405310; 
 Mon, 05 Aug 2019 12:30:05 -0700 (PDT)
MIME-Version: 1.0
References: <51a4155c5bc2ca847a9cbe85c1c11918bb193141.1564086017.git.jpoimboe@redhat.com>
 <alpine.DEB.2.21.1907252355150.1791@nanos.tec.linutronix.de>
 <156416793450.30723.5556760526480191131@skylake-alporthouse-com>
 <alpine.DEB.2.21.1907262116530.1791@nanos.tec.linutronix.de>
 <156416944205.21451.12269136304831943624@skylake-alporthouse-com>
 <CA+icZUXwBFS-6e+Qp4e3PhnRzEHvwdzWtS6OfVsgy85R5YNGOg@mail.gmail.com>
In-Reply-To: <CA+icZUXwBFS-6e+Qp4e3PhnRzEHvwdzWtS6OfVsgy85R5YNGOg@mail.gmail.com>
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Mon, 5 Aug 2019 21:29:53 +0200
Message-ID: <CA+icZUWA6e0Zsio6sthRUC=Ehb2-mw_9U76UnvwGc_tOnOqt7w@mail.gmail.com>
Subject: Re: [PATCH] drm/i915: Remove redundant user_access_end() from
 __copy_from_user() error path
To: Chris Wilson <chris@chris-wilson.co.uk>
X-Mailman-Approved-At: Tue, 06 Aug 2019 07:24:35 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc;
 bh=4TR1ROvSxrSW2jGMt/9xUpK6NJiArbHQHezkRC5T3No=;
 b=rZTyzChfgcWwwgTvCD/CVNOqEZQsoKiuqoj6vu6VFXxDpBxWbk6/3on5trmksfOnUM
 X70HVqGO+45T01EKlSpcM/e498+YYNoj1r+r3ZfwxrA3DLrvx8JZZN5/2dBeOMh3DYoR
 YTgGq08SWRokl8/7az8va7hPyfo9h17732xhpydMZ9QkZDZTChlAvwvkAhzzUQuICJa1
 mtjvYaSwTv+/VuNuFmSLV4upxvAZVJdFv7aS6dU5vG/50Qvylr5mRb8UQCK0F12Gqbnn
 WtD66meo/gDN8udvs2t6HhYX0P3+EuKF48/xi5ibJVGT/4jAC1H29FMQ7esFHiaUncLz
 G8gw==
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
Reply-To: sedat.dilek@gmail.com
Cc: Arnd Bergmann <arnd@arndb.de>, Peter Zijlstra <peterz@infradead.org>,
 intel-gfx@lists.freedesktop.org, Nick Desaulniers <ndesaulniers@google.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Josh Poimboeuf <jpoimboe@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Nathan Chancellor <natechancellor@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdWwgMzEsIDIwMTkgYXQgMjoyNSBQTSBTZWRhdCBEaWxlayA8c2VkYXQuZGlsZWtA
Z21haWwuY29tPiB3cm90ZToKPgo+IE9uIEZyaSwgSnVsIDI2LCAyMDE5IGF0IDk6MzAgUE0gQ2hy
aXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+IHdyb3RlOgo+ID4KPiA+IFF1b3Rp
bmcgVGhvbWFzIEdsZWl4bmVyICgyMDE5LTA3LTI2IDIwOjE4OjMyKQo+ID4gPiBPbiBGcmksIDI2
IEp1bCAyMDE5LCBDaHJpcyBXaWxzb24gd3JvdGU6Cj4gPiA+ID4gUXVvdGluZyBUaG9tYXMgR2xl
aXhuZXIgKDIwMTktMDctMjUgMjI6NTU6NDUpCj4gPiA+ID4gPiBPbiBUaHUsIDI1IEp1bCAyMDE5
LCBKb3NoIFBvaW1ib2V1ZiB3cm90ZToKPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IE9ianRvb2wgcmVw
b3J0czoKPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0v
aTkxNV9nZW1fZXhlY2J1ZmZlci5vOiB3YXJuaW5nOiBvYmp0b29sOiAuYWx0aW5zdHJfcmVwbGFj
ZW1lbnQrMHgzNjogcmVkdW5kYW50IFVBQ0NFU1MgZGlzYWJsZQo+ID4gPiA+ID4gPgo+ID4gPiA+
ID4gPiBfX2NvcHlfZnJvbV91c2VyKCkgYWxyZWFkeSBkb2VzIGJvdGggU1RBQyBhbmQgQ0xBQywg
c28gdGhlCj4gPiA+ID4gPiA+IHVzZXJfYWNjZXNzX2VuZCgpIGluIGl0cyBlcnJvciBwYXRoIGFk
ZHMgYW4gZXh0cmEgdW5uZWNlc3NhcnkgQ0xBQy4KPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gRml4
ZXM6IDBiMmM4ZjhiNmIwYyAoImk5MTU6IGZpeCBtaXNzaW5nIHVzZXJfYWNjZXNzX2VuZCgpIGlu
IHBhZ2UgZmF1bHQgZXhjZXB0aW9uIGNhc2UiKQo+ID4gPiA+ID4gPiBSZXBvcnRlZC1ieTogVGhv
bWFzIEdsZWl4bmVyIDx0Z2x4QGxpbnV0cm9uaXguZGU+Cj4gPiA+ID4gPiA+IFJlcG9ydGVkLWJ5
OiBTZWRhdCBEaWxlayA8c2VkYXQuZGlsZWtAZ21haWwuY29tPgo+ID4gPiA+ID4gPiBBY2tlZC1i
eTogUGV0ZXIgWmlqbHN0cmEgKEludGVsKSA8cGV0ZXJ6QGluZnJhZGVhZC5vcmc+Cj4gPiA+ID4g
PiA+IFRlc3RlZC1ieTogTmljayBEZXNhdWxuaWVycyA8bmRlc2F1bG5pZXJzQGdvb2dsZS5jb20+
Cj4gPiA+ID4gPiA+IFRlc3RlZC1ieTogU2VkYXQgRGlsZWsgPHNlZGF0LmRpbGVrQGdtYWlsLmNv
bT4KPiA+ID4gPiA+ID4gTGluazogaHR0cHM6Ly9naXRodWIuY29tL0NsYW5nQnVpbHRMaW51eC9s
aW51eC9pc3N1ZXMvNjE3Cj4gPiA+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IEpvc2ggUG9pbWJvZXVm
IDxqcG9pbWJvZUByZWRoYXQuY29tPgo+ID4gPiA+ID4KPiA+ID4gPiA+IFJldmlld2VkLWJ5OiBU
aG9tYXMgR2xlaXhuZXIgPHRnbHhAbGludXRyb25peC5kZT4KPiA+ID4gPgo+ID4gPiA+IFdoaWNo
IHRyZWUgZG8geW91IHBsYW4gdG8gYXBwbHkgaXQgdG8/IEkgY2FuIHB1dCBpbiBkcm0taW50ZWws
IGFuZCB3aXRoCj4gPiA+ID4gdGhlIGZpeGVzIHRhZyBpdCB3aWxsIHBlcmNvbGF0ZSB0aHJvdWdo
IHRvIDUuMyBhbmQgYmV5b25kLCBidXQgaWYgeW91Cj4gPiA+ID4gd2FudCB0byBhcHBseSBpdCBk
aXJlY3RseSB0byBzcXVhc2ggdGhlIGJ1aWxkIHdhcm5pbmdzLCBmZWVsIGZyZWUuCj4gPiA+Cj4g
PiA+IEl0IHdvdWxkIGJlIG5pY2UgdG8gZ2V0IGl0IGludG8gNS4zLiBJIGNhbiByb3V0ZSBpdCBs
aW51eHdhcmRzIGlmIHlvdSBnaXZlCj4gPiA+IGFuIEFja2VkLWJ5LCBidXQgSSdtIGhhcHB5IHRv
IGhhbmQgaXQgdG8geW91IDopCj4gPgo+ID4gQWNrZWQtYnk6IENocmlzIFdpbHNvbiA8Y2hyaXNA
Y2hyaXMtd2lsc29uLmNvLnVrPgo+Cj4gVGhvbWFzIGRpZCB5b3UgdGFrZSB0aGlzIHRocm91Z2gg
dGlwIHRyZWUgYWZ0ZXIgQ2hyaXMnIEFDSz8KPgoKSGksCgpHZW50bGUgcGluZy4uLgpUaG9tYXMg
YW5kIENocmlzOiBXaWxsIHNvbWVvbmUgb2YgeW91IHBpY2sgdGhpcyB1cD8KQXMgIm9ianRvb2w6
IEltcHJvdmUgVUFDQ0VTUyBjb3ZlcmFnZSIgWzFdIHdlbnQgdHJvdWdoIHRpcCB0cmVlIEkKaGln
aGx5IGFwcHJlY2lhdGUgdG8gZG8gc28gd2l0aCB0aGlzIG9uZS4KClRoYW5rcy4KClJlZ2FyZHMs
Ci0gU2VkYXQgLQoKWzFdIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvbGludXMvODgyYTBkYjlkMTQz
ZTVlOGRhYzU0Yjk2ZTgzMTM1YmNjZDFmNjhkMQpbMl0gaHR0cHM6Ly9naXRodWIuY29tL0NsYW5n
QnVpbHRMaW51eC9saW51eC9pc3N1ZXMvNjE3Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
