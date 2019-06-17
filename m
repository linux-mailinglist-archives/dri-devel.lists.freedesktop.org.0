Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F407E47A8B
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2019 09:14:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0948D8919E;
	Mon, 17 Jun 2019 07:14:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ushosting.nmnhosting.com (ushosting.nmnhosting.com
 [66.55.73.32])
 by gabe.freedesktop.org (Postfix) with ESMTP id B460489159;
 Mon, 17 Jun 2019 04:07:40 +0000 (UTC)
Received: from mail2.nmnhosting.com (unknown [202.169.106.97])
 by ushosting.nmnhosting.com (Postfix) with ESMTPS id E75102DC007F;
 Mon, 17 Jun 2019 00:07:39 -0400 (EDT)
Received: from adsilva.ozlabs.ibm.com (static-82-10.transact.net.au
 [122.99.82.10] (may be forged)) (authenticated bits=0)
 by mail2.nmnhosting.com (8.15.2/8.15.2) with ESMTPSA id x5H47CvI055927
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Mon, 17 Jun 2019 14:07:28 +1000 (AEST)
 (envelope-from alastair@d-silva.org)
Message-ID: <da2ff58290c4b6f08eb5ac25c288bdd03b5688f7.camel@d-silva.org>
Subject: Re: [PATCH v3 3/7] lib/hexdump.c: Optionally suppress lines of
 repeated bytes
From: "Alastair D'Silva" <alastair@d-silva.org>
To: Jani Nikula <jani.nikula@linux.intel.com>
Date: Mon, 17 Jun 2019 14:07:12 +1000
In-Reply-To: <20190617020430.8708-4-alastair@au1.ibm.com>
References: <20190617020430.8708-1-alastair@au1.ibm.com>
 <20190617020430.8708-4-alastair@au1.ibm.com>
User-Agent: Evolution 3.32.2 (3.32.2-1.fc30) 
MIME-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.2
 (mail2.nmnhosting.com [10.0.1.20]); Mon, 17 Jun 2019 14:07:35 +1000 (AEST)
X-Mailman-Approved-At: Mon, 17 Jun 2019 07:13:33 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=d-silva.org; s=201810a; t=1560744460;
 bh=fcIJWb9zFrSz2UB8a7mxef1I4k9iDutEwQyvrCEDLlQ=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=WCFaSA53OEIg+og8L/naQbQPlaTsOoXPKsvTwtmXP2Vk09oVK0XuS5AD3x5/CqLrM
 G0GIng39m1v0lZ4sKpUf3T99/+YBxM9RX44WLALuhESqgh+r5BAShy10176lEQBE3q
 DQvd2fgD6zwuDb2r3HtAMEKvNfyGEklzY4KUQ+U+VxMilUgRO+yfLfvjALw1DuedIj
 U07cuyKZx46E0NJINEB5+8FVHhYvvSWxSY7sKWAoGvSBG/TJ18P0TuXGu+r+H6bH0e
 aXUQ8ilJHofP52ff/zDalxsvFnS/I19R0WtGSyZHeql8nV+rZAy3ckW9tGr7DubBUl
 qpbsJvQK16Hb/jOSoEHhPkG1VKXuLKMb1qy/wzkUplRpkQy3lck+ggy2ukzRhUgkqh
 N1Q6mMJi30A9PGd1HWpWuLWkLg4LedcJItJ961IWPw6XnamogZOK4OajearEtq6Wug
 Q7fZpUvUrqSKSyRRBPeipKEoLRw/YY+95nWqf7l5GKHjuTC0GylNVU3e6c29Aa3j+X
 5pRuwG5Xw/zIJlIzmObseyKrpDD4TC7M/3O2j/4ernSmXnXxPfSq1dRv9DqHM2oKIk
 cA8ovQOzGfvEiJha5fCrgByfWUnR6D8Ngp3/azplb/9QJOs0SiH1pg9yh8F/C3rFek
 9RkRnoy0sArwZ3E9Df8kzHf0=
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
 Petr Mladek <pmladek@suse.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, devel@driverdev.osuosl.org,
 linux-scsi@vger.kernel.org, Jassi Brar <jassisinghbrar@gmail.com>,
 ath10k@lists.infradead.org, intel-gfx@lists.freedesktop.org,
 Dan Carpenter <dan.carpenter@oracle.com>, Jose Abreu <Jose.Abreu@synopsys.com>,
 Tom Lendacky <thomas.lendacky@amd.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 Steven Rostedt <rostedt@goodmis.org>, linux-fsdevel@vger.kernel.org,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Kalle Valo <kvalo@codeaurora.org>,
 Karsten Keil <isdn@linux-pingi.de>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 David Laight <David.Laight@ACULAB.COM>, netdev@vger.kernel.org,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAyMDE5LTA2LTE3IGF0IDEyOjA0ICsxMDAwLCBBbGFzdGFpciBEJ1NpbHZhIHdyb3Rl
Ogo+IEZyb206IEFsYXN0YWlyIEQnU2lsdmEgPGFsYXN0YWlyQGQtc2lsdmEub3JnPgo+IAo+IFNv
bWUgYnVmZmVycyBtYXkgb25seSBiZSBwYXJ0aWFsbHkgZmlsbGVkIHdpdGggdXNlZnVsIGRhdGEs
IHdoaWxlIHRoZQo+IHJlc3QKPiBpcyBwYWRkZWQgKHR5cGljYWxseSB3aXRoIDB4MDAgb3IgMHhm
ZikuCj4gCj4gVGhpcyBwYXRjaCBpbnRyb2R1Y2VzIGEgZmxhZyB0byBhbGxvdyB0aGUgc3VwcmVz
c2lvbiBvZiBsaW5lcyBvZgo+IHJlcGVhdGVkCj4gYnl0ZXMsIHdoaWNoIGFyZSByZXBsYWNlZCB3
aXRoICcqKiBTa2lwcGVkICV1IGJ5dGVzIG9mIHZhbHVlIDB4JXggKionCj4gCj4gQW4gaW5saW5l
IHdyYXBwZXIgZnVuY3Rpb24gaXMgcHJvdmlkZWQgZm9yIGJhY2t3YXJkcyBjb21wYXRpYmlsaXR5
Cj4gd2l0aAo+IGV4aXN0aW5nIGNvZGUsIHdoaWNoIG1haW50YWlucyB0aGUgb3JpZ2luYWwgYmVo
YXZpb3VyLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFsYXN0YWlyIEQnU2lsdmEgPGFsYXN0YWlyQGQt
c2lsdmEub3JnPgo+IC0tLQo+ICBpbmNsdWRlL2xpbnV4L3ByaW50ay5oIHwgMjUgKysrKysrKysr
LS0tCj4gIGxpYi9oZXhkdW1wLmMgICAgICAgICAgfCA5MSArKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKystLQo+IC0tLS0KPiAgMiBmaWxlcyBjaGFuZ2VkLCA5OSBpbnNlcnRpb25z
KCspLCAxNyBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9wcmlu
dGsuaCBiL2luY2x1ZGUvbGludXgvcHJpbnRrLmgKPiBpbmRleCBjZWZkMzc0YzQ3YjEuLmQ3NzU0
Nzk5Y2ZlMCAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2xpbnV4L3ByaW50ay5oCj4gKysrIGIvaW5j
bHVkZS9saW51eC9wcmludGsuaAo+IEBAIC00ODEsMTMgKzQ4MSwxOCBAQCBlbnVtIHsKPiAgCURV
TVBfUFJFRklYX0FERFJFU1MsCj4gIAlEVU1QX1BSRUZJWF9PRkZTRVQKPiAgfTsKPiArCj4gIGV4
dGVybiBpbnQgaGV4X2R1bXBfdG9fYnVmZmVyKGNvbnN0IHZvaWQgKmJ1Ziwgc2l6ZV90IGxlbiwg
aW50Cj4gcm93c2l6ZSwKPiAgCQkJICAgICAgaW50IGdyb3Vwc2l6ZSwgY2hhciAqbGluZWJ1Ziwg
c2l6ZV90Cj4gbGluZWJ1ZmxlbiwKPiAgCQkJICAgICAgYm9vbCBhc2NpaSk7Cj4gKwo+ICsjZGVm
aW5lIEhFWERVTVBfQVNDSUkJCQlCSVQoMCkKPiArI2RlZmluZSBIRVhEVU1QX1NVUFBSRVNTX1JF
UEVBVEVECUJJVCgxKQo+ICsKClRoaXMgaXMgbWlzc2luZyB0aGUgaW5jbHVkZSBvZiBsaW51eC9i
aXRzLmgsIEknbGwgZml4IHRoaXMgaW4gdGhlIG5leHQKdmVyc2lvbi4KCi0tIApBbGFzdGFpciBE
J1NpbHZhICAgICAgICAgICBtb2I6IDA0MjMgNzYyIDgxOQpza3lwZTogYWxhc3RhaXJfZHNpbHZh
ICAgIApUd2l0dGVyOiBARXZpbERlZWNlCmJsb2c6IGh0dHA6Ly9hbGFzdGFpci5kLXNpbHZhLm9y
ZwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
