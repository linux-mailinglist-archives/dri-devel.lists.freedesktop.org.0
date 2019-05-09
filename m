Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B03DC185F6
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2019 09:18:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47B89899F0;
	Thu,  9 May 2019 07:18:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D53D89993;
 Thu,  9 May 2019 00:59:52 +0000 (UTC)
Received: from static-50-53-52-16.bvtn.or.frontiernet.net ([50.53.52.16]
 helo=midway.dunlab)
 by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hOXOb-0001bQ-J1; Thu, 09 May 2019 00:58:49 +0000
Subject: Re: [PATCH v2 3/7] lib/hexdump.c: Optionally suppress lines of
 repeated bytes
To: Alastair D'Silva <alastair@au1.ibm.com>, alastair@d-silva.org
References: <20190508070148.23130-1-alastair@au1.ibm.com>
 <20190508070148.23130-4-alastair@au1.ibm.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <dc093079-43a0-0a45-f5dd-88b20702fd93@infradead.org>
Date: Wed, 8 May 2019 17:58:46 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190508070148.23130-4-alastair@au1.ibm.com>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 09 May 2019 07:18:00 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jF6l3iV1rXe+x0MwS+AXxE/3MQbA5vLmSrDtVx8hKJ0=; b=iDLjyMGHb2MtEiX7sNEsrIOc+
 r555boyzgroaM/roefjfl/8sPXIlDAXxtafMFPJgts5KIWBA3q3sxMLL9Wjox7NuUoSN+lZsyGDWw
 1YIQfXQ89Etqt/gh+FhXMlhdhbL9rncYRHCp1u5Ydd7sskuGKJOM6SqnvXr8Ix+x0A1cHoy/Pusmm
 afAw4Qn3zKr+mSjjshNzlrS6rfxIYZK+kWmsANoEiID2eXPgmAt9+V8rVX6zZpa52fnCPoRfx1GZ/
 Wu13zOk/d8d44/7sOxIazBgLErLk/FQfGqZzRDcPlEkhHnuFiQz1PmBOXDcuzYl28U3M+xDV4tosD
 uSeh53laQ==;
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
 ath10k@lists.infradead.org, "James E.J. Bottomley" <jejb@linux.ibm.com>,
 Dan Carpenter <dan.carpenter@oracle.com>, Jose Abreu <Jose.Abreu@synopsys.com>,
 Petr Mladek <pmladek@suse.com>, intel-gfx@lists.freedesktop.org,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Steven Rostedt <rostedt@goodmis.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Kalle Valo <kvalo@codeaurora.org>, Karsten Keil <isdn@linux-pingi.de>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 David Laight <David.Laight@ACULAB.COM>, netdev@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>,
 Alexander Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gNS84LzE5IDEyOjAxIEFNLCBBbGFzdGFpciBEJ1NpbHZhIHdyb3RlOgo+IEZyb206IEFsYXN0
YWlyIEQnU2lsdmEgPGFsYXN0YWlyQGQtc2lsdmEub3JnPgo+IAo+IFNvbWUgYnVmZmVycyBtYXkg
b25seSBiZSBwYXJ0aWFsbHkgZmlsbGVkIHdpdGggdXNlZnVsIGRhdGEsIHdoaWxlIHRoZSByZXN0
Cj4gaXMgcGFkZGVkICh0eXBpY2FsbHkgd2l0aCAweDAwIG9yIDB4ZmYpLgo+IAo+IFRoaXMgcGF0
Y2ggaW50cm9kdWNlcyBhIGZsYWcgdG8gYWxsb3cgdGhlIHN1cHJlc3Npb24gb2YgbGluZXMgb2Yg
cmVwZWF0ZWQKPiBieXRlcywgd2hpY2ggYXJlIHJlcGxhY2VkIHdpdGggJyoqIFNraXBwZWQgJXUg
Ynl0ZXMgb2YgdmFsdWUgMHgleCAqKicKPiAKPiBBbiBpbmxpbmUgd3JhcHBlciBmdW5jdGlvbiBp
cyBwcm92aWRlZCBmb3IgYmFja3dhcmRzIGNvbXBhdGliaWxpdHkgd2l0aAo+IGV4aXN0aW5nIGNv
ZGUsIHdoaWNoIG1haW50YWlucyB0aGUgb3JpZ2luYWwgYmVoYXZpb3VyLgo+IAo+IFNpZ25lZC1v
ZmYtYnk6IEFsYXN0YWlyIEQnU2lsdmEgPGFsYXN0YWlyQGQtc2lsdmEub3JnPgo+IC0tLQo+ICBp
bmNsdWRlL2xpbnV4L3ByaW50ay5oIHwgMjUgKysrKysrKysrLS0tCj4gIGxpYi9oZXhkdW1wLmMg
ICAgICAgICAgfCA5MSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0K
PiAgMiBmaWxlcyBjaGFuZ2VkLCA5OSBpbnNlcnRpb25zKCspLCAxNyBkZWxldGlvbnMoLSkKPiAK
CkhpLApEaWQgeW91IGRvICJtYWtlIGh0bWxkb2NzIiBvciBzb21ldGhpbmcgc2ltaWxhciBvbiB0
aGlzPwoKPiBkaWZmIC0tZ2l0IGEvbGliL2hleGR1bXAuYyBiL2xpYi9oZXhkdW1wLmMKPiBpbmRl
eCAzOTQzNTA3YmMwZTkuLmQ2MWExZTRmMTlmYSAxMDA2NDQKPiAtLS0gYS9saWIvaGV4ZHVtcC5j
Cj4gKysrIGIvbGliL2hleGR1bXAuYwo+IEBAIC0yMTIsOCArMjEyLDQ0IEBAIGludCBoZXhfZHVt
cF90b19idWZmZXIoY29uc3Qgdm9pZCAqYnVmLCBzaXplX3QgbGVuLCBpbnQgcm93c2l6ZSwgaW50
IGdyb3Vwc2l6ZSwKPiAgRVhQT1JUX1NZTUJPTChoZXhfZHVtcF90b19idWZmZXIpOwo+ICAKPiAg
I2lmZGVmIENPTkZJR19QUklOVEsKPiArCj4gKy8qKgo+ICsgKiBDaGVjayBpZiBhIGJ1ZmZlciBj
b250YWlucyBvbmx5IGEgc2luZ2xlIGJ5dGUgdmFsdWUKPiArICogQGJ1ZjogcG9pbnRlciB0byB0
aGUgYnVmZmVyCj4gKyAqIEBsZW46IHRoZSBzaXplIG9mIHRoZSBidWZmZXIgaW4gYnl0ZXMKPiAr
ICogQHZhbDogb3V0cHV0cyB0aGUgdmFsdWUgaWYgaWYgdGhlIGJ5dGVzIGFyZSBpZGVudGljYWwK
CkRvZXMgdGhpcyB3b3JrIHdpdGhvdXQgYSBmdW5jdGlvbiBuYW1lPwpEb2N1bWVudGF0aW9uL2Rv
Yy1ndWlkZS9rZXJuZWwtZG9jLnJzdCBzYXlzIHRoZSBnZW5lcmFsIGZvcm1hdCBpczoKCiAgLyoq
CiAgICogZnVuY3Rpb25fbmFtZSgpIC0gQnJpZWYgZGVzY3JpcHRpb24gb2YgZnVuY3Rpb24uCiAg
ICogQGFyZzE6IERlc2NyaWJlIHRoZSBmaXJzdCBhcmd1bWVudC4KICAgKiBAYXJnMjogRGVzY3Jp
YmUgdGhlIHNlY29uZCBhcmd1bWVudC4KICAgKiAgICAgICAgT25lIGNhbiBwcm92aWRlIG11bHRp
cGxlIGxpbmUgZGVzY3JpcHRpb25zCiAgICogICAgICAgIGZvciBhcmd1bWVudHMuCiAgICoKCj4g
KyAqLwoKPiAgLyoqCj4gLSAqIHByaW50X2hleF9kdW1wIC0gcHJpbnQgYSB0ZXh0IGhleCBkdW1w
IHRvIHN5c2xvZyBmb3IgYSBiaW5hcnkgYmxvYiBvZiBkYXRhCj4gKyAqIHByaW50X2hleF9kdW1w
X2V4dDogZHVtcCBhIGJpbmFyeSBibG9iIG9mIGRhdGEgdG8gc3lzbG9nIGluIGhleGFkZWNpbWFs
CgpBbHNvIG5vdCBpbiB0aGUgZ2VuZXJhbCBkb2N1bWVudGVkIGZvcm1hdC4KCj4gICAqIEBsZXZl
bDoga2VybmVsIGxvZyBsZXZlbCAoZS5nLiBLRVJOX0RFQlVHKQo+ICAgKiBAcHJlZml4X3N0cjog
c3RyaW5nIHRvIHByZWZpeCBlYWNoIGxpbmUgd2l0aDsKPiAgICogIGNhbGxlciBzdXBwbGllcyB0
cmFpbGluZyBzcGFjZXMgZm9yIGFsaWdubWVudCBpZiBkZXNpcmVkCgoKLS0gCn5SYW5keQpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
