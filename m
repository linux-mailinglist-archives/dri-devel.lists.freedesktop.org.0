Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 52898174C3
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2019 11:14:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8AE789622;
	Wed,  8 May 2019 09:14:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6CBF89622;
 Wed,  8 May 2019 09:14:23 +0000 (UTC)
Received: from localhost (unknown [84.241.196.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AC7AE20656;
 Wed,  8 May 2019 09:14:22 +0000 (UTC)
Date: Wed, 8 May 2019 11:14:19 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Alastair D'Silva <alastair@au1.ibm.com>
Subject: Re: [PATCH v2 4/7] lib/hexdump.c: Replace ascii bool in
 hex_dump_to_buffer with flags
Message-ID: <20190508091419.GA1615@kroah.com>
References: <20190508070148.23130-1-alastair@au1.ibm.com>
 <20190508070148.23130-5-alastair@au1.ibm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190508070148.23130-5-alastair@au1.ibm.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1557306863;
 bh=zepv94OHfkba3xbpvBTN7GO3YZ8l+U6nzIqdU9DMmB8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Wa4AAzW6bKcVh7iubvvk3GvJcvX9eh9Ton6QrU6XEE4kYPzzMrW5IHFBOY1vybSPG
 /wtvTtJVfunzm6H4nT5HQc0T+zSmcxhBr+uYF1athP68gTxTE8SNNLlVwcpysi2lYW
 IFxa5soU7yPrrlENXIMWDlxa1//6jkZdyOT5fL7A=
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
Cc: linux-fbdev@vger.kernel.org, Stanislaw Gruszka <sgruszka@redhat.com>,
 Tom Lendacky <thomas.lendacky@amd.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, devel@driverdev.osuosl.org,
 linux-scsi@vger.kernel.org, Jassi Brar <jassisinghbrar@gmail.com>,
 ath10k@lists.infradead.org, alastair@d-silva.org,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 Dan Carpenter <dan.carpenter@oracle.com>, Jose Abreu <Jose.Abreu@synopsys.com>,
 Petr Mladek <pmladek@suse.com>, intel-gfx@lists.freedesktop.org,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Steven Rostedt <rostedt@goodmis.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Kalle Valo <kvalo@codeaurora.org>, Karsten Keil <isdn@linux-pingi.de>,
 "Martin K. Petersen" <martin.petersen@oracle.com>, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 David Laight <David.Laight@aculab.com>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>,
 Alexander Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBNYXkgMDgsIDIwMTkgYXQgMDU6MDE6NDRQTSArMTAwMCwgQWxhc3RhaXIgRCdTaWx2
YSB3cm90ZToKPiBGcm9tOiBBbGFzdGFpciBEJ1NpbHZhIDxhbGFzdGFpckBkLXNpbHZhLm9yZz4K
PiAKPiBJbiBvcmRlciB0byBzdXBwb3J0IGFkZGl0aW9uYWwgZmVhdHVyZXMgaW4gaGV4X2R1bXBf
dG9fYnVmZmVyLCByZXBsYWNlCj4gdGhlIGFzY2lpIGJvb2wgcGFyYW1ldGVyIHdpdGggZmxhZ3Mu
Cj4gCj4gU2lnbmVkLW9mZi1ieTogQWxhc3RhaXIgRCdTaWx2YSA8YWxhc3RhaXJAZC1zaWx2YS5v
cmc+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2ludGVsX2VuZ2luZV9jcy5jICAgICAg
ICAgICAgfCAgMiArLQo+ICBkcml2ZXJzL2lzZG4vaGFyZHdhcmUvbUlTRE4vbUlTRE5pc2FyLmMg
ICAgICAgICAgIHwgIDYgKysrKy0tCj4gIGRyaXZlcnMvbWFpbGJveC9tYWlsYm94LXRlc3QuYyAg
ICAgICAgICAgICAgICAgICAgfCAgMiArLQo+ICBkcml2ZXJzL25ldC9ldGhlcm5ldC9hbWQveGdi
ZS94Z2JlLWRydi5jICAgICAgICAgIHwgIDIgKy0KPiAgZHJpdmVycy9uZXQvZXRoZXJuZXQvc3lu
b3BzeXMvZHdjLXhsZ21hYy1jb21tb24uYyB8ICAyICstCj4gIGRyaXZlcnMvbmV0L3dpcmVsZXNz
L2F0aC9hdGgxMGsvZGVidWcuYyAgICAgICAgICAgfCAgMyArKy0KPiAgZHJpdmVycy9uZXQvd2ly
ZWxlc3MvaW50ZWwvaXdsZWdhY3kvMzk0NS1tYWMuYyAgICB8ICAyICstCj4gIGRyaXZlcnMvcGxh
dGZvcm0vY2hyb21lL3dpbGNvX2VjL2RlYnVnZnMuYyAgICAgICAgfCAgMiArLQo+ICBkcml2ZXJz
L3Njc2kvc2NzaV9sb2dnaW5nLmMgICAgICAgICAgICAgICAgICAgICAgIHwgIDggKysrLS0tLS0K
PiAgZHJpdmVycy9zdGFnaW5nL2ZidGZ0L2ZidGZ0LWNvcmUuYyAgICAgICAgICAgICAgICB8ICAy
ICstCj4gIGZzL3NlcV9maWxlLmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
fCAgMyArKy0KPiAgaW5jbHVkZS9saW51eC9wcmludGsuaCAgICAgICAgICAgICAgICAgICAgICAg
ICAgICB8ICA4ICsrKystLS0tCj4gIGxpYi9oZXhkdW1wLmMgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgfCAxNSArKysrKysrKy0tLS0tLS0KPiAgbGliL3Rlc3RfaGV4ZHVtcC5j
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICA1ICsrKy0tCj4gIDE0IGZpbGVzIGNo
YW5nZWQsIDMzIGluc2VydGlvbnMoKyksIDI5IGRlbGV0aW9ucygtKQoKRm9yIHN0YWdpbmcgc3R1
ZmY6CgpSZXZpZXdlZC1ieTogR3JlZyBLcm9haC1IYXJ0bWFuIDxncmVna2hAbGludXhmb3VuZGF0
aW9uLm9yZz4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
