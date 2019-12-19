Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45575125AC0
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2019 06:28:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76CF66E113;
	Thu, 19 Dec 2019 05:27:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E8066E113
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2019 05:27:54 +0000 (UTC)
Received: by mail-ot1-x342.google.com with SMTP id 59so5591377otp.12
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2019 21:27:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=YiNT2OwN1PC5xiClJXvmIxtU8FKdWcajydHQPOKowMQ=;
 b=dqorifJ4f+v2Gylbu8oAiFDcKa1F8skIpz6V3IgWOqRB33n7U59EJyePbqvuTj6Vy4
 uOPeG7Kob1GhJUtITzia2N5iO6b+FgQt0PfBLv1SShdXtnPTkzPXC4wv8NlfHewxSVCr
 BWaS5xgO+C3htMgxe5c7ubvEmgYEe4TsZt+Zn5XRlxBQhxFahwlW/Mo0S+TgOXqQ/47k
 mtfOMZwImte59GAX6ig1VEn2mK8lUBxmhPPLTpVmIFFbH4EVvah9nw+1Oh0aFp9cBJiW
 sz8ohgGLCmoNne0NYqks6igeYI3pnrq7++p4oBryH4HFQcsawtXKY12nyEVckq37Q8q+
 63BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=YiNT2OwN1PC5xiClJXvmIxtU8FKdWcajydHQPOKowMQ=;
 b=cbSijgEU62YO21NoUqV/Iw4lL5eelGskQ+hN1OH6BhUG/OBI9tWm/74+sKSq0u9SvE
 ci2+VR3Jv2SaFeHpNvgkyJrLNlQKNP1oqh4t/pkh99aagRiealvDiky6825CnCaRXO/I
 Snk/esKfXuTo3DRq+z1swxkriHJv+2/wBVeG7/f6dy9zT13No+kSwzlumNL/sPGRIirU
 n13lPOLo4oOwqCYuUZ6Y09QFtT61U+8d5PDuzrEMX9P2qSN201AS42bWYb+1xn55fte9
 oU9d3zTsAdpkT5pcbXPH729IBjkqD4JhfT/74A6S+NFiAf0xq/axGZOyn+e9BmIyP5qs
 Q19Q==
X-Gm-Message-State: APjAAAWeJ47Scm6f2NAvBz0/qhcqTXwXzmSsOT/7z+YcXwNwsRNnecvD
 pu1IyFnA4k4xz3wNYtYRLDHSmWQcaqlSBlMQDldc6A==
X-Google-Smtp-Source: APXvYqzIho60C4tgIgH4FPSEG3bP2Gra7VUCaG88r8S6eX3efYPsOK7esN+4WGhr8L+TiHfEgJwBcHps0ms7QGyGe6Y=
X-Received: by 2002:a05:6830:1744:: with SMTP id
 4mr6583360otz.71.1576733274234; 
 Wed, 18 Dec 2019 21:27:54 -0800 (PST)
MIME-Version: 1.0
References: <20191216222537.491123-1-jhubbard@nvidia.com>
 <20191216222537.491123-5-jhubbard@nvidia.com>
In-Reply-To: <20191216222537.491123-5-jhubbard@nvidia.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Wed, 18 Dec 2019 21:27:43 -0800
Message-ID: <CAPcyv4hQBMxYMurxG=Vwh0=FKWoT3z-Kf=dqES1-icRV5bLwKg@mail.gmail.com>
Subject: Re: [PATCH v11 04/25] mm: devmap: refactor 1-based refcounting for
 ZONE_DEVICE pages
To: John Hubbard <jhubbard@nvidia.com>
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
Cc: Michal Hocko <mhocko@suse.com>, Jan Kara <jack@suse.cz>,
 KVM list <kvm@vger.kernel.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, Dave Chinner <david@fromorbit.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Linux MM <linux-mm@kvack.org>,
 Paul Mackerras <paulus@samba.org>, linux-kselftest@vger.kernel.org,
 Ira Weiny <ira.weiny@intel.com>, Christoph Hellwig <hch@lst.de>,
 Jonathan Corbet <corbet@lwn.net>, linux-rdma <linux-rdma@vger.kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@suse.cz>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>,
 "Linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 Shuah Khan <shuah@kernel.org>, linux-block@vger.kernel.org,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 bpf@vger.kernel.org, Magnus Karlsson <magnus.karlsson@intel.com>,
 Jens Axboe <axboe@kernel.dk>, Netdev <netdev@vger.kernel.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S . Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBEZWMgMTYsIDIwMTkgYXQgMjoyNiBQTSBKb2huIEh1YmJhcmQgPGpodWJiYXJkQG52
aWRpYS5jb20+IHdyb3RlOgo+Cj4gQW4gdXBjb21pbmcgcGF0Y2ggY2hhbmdlcyBhbmQgY29tcGxp
Y2F0ZXMgdGhlIHJlZmNvdW50aW5nIGFuZAo+IGVzcGVjaWFsbHkgdGhlICJwdXQgcGFnZSIgYXNw
ZWN0cyBvZiBpdC4gSW4gb3JkZXIgdG8ga2VlcAo+IGV2ZXJ5dGhpbmcgY2xlYW4sIHJlZmFjdG9y
IHRoZSBkZXZtYXAgcGFnZSByZWxlYXNlIHJvdXRpbmVzOgo+Cj4gKiBSZW5hbWUgcHV0X2Rldm1h
cF9tYW5hZ2VkX3BhZ2UoKSB0byBwYWdlX2lzX2Rldm1hcF9tYW5hZ2VkKCksCj4gICBhbmQgbGlt
aXQgdGhlIGZ1bmN0aW9uYWxpdHkgdG8gInJlYWQgb25seSI6IHJldHVybiBhIGJvb2wsCj4gICB3
aXRoIG5vIHNpZGUgZWZmZWN0cy4KPgo+ICogQWRkIGEgbmV3IHJvdXRpbmUsIHB1dF9kZXZtYXBf
bWFuYWdlZF9wYWdlKCksIHRvIGhhbmRsZSBjaGVja2luZwo+ICAgd2hhdCBraW5kIG9mIHBhZ2Ug
aXQgaXMsIGFuZCB3aGF0IGtpbmQgb2YgcmVmY291bnQgaGFuZGxpbmcgaXQKPiAgIHJlcXVpcmVz
Lgo+Cj4gKiBSZW5hbWUgX19wdXRfZGV2bWFwX21hbmFnZWRfcGFnZSgpIHRvIGZyZWVfZGV2bWFw
X21hbmFnZWRfcGFnZSgpLAo+ICAgYW5kIGxpbWl0IHRoZSBmdW5jdGlvbmFsaXR5IHRvIHVuY29u
ZGl0aW9uYWxseSBmcmVlaW5nIGEgZGV2bWFwCj4gICBwYWdlLgo+Cj4gVGhpcyBpcyBvcmlnaW5h
bGx5IGJhc2VkIG9uIGEgc2VwYXJhdGUgcGF0Y2ggYnkgSXJhIFdlaW55LCB3aGljaAo+IGFwcGxp
ZWQgdG8gYW4gZWFybHkgdmVyc2lvbiBvZiB0aGUgcHV0X3VzZXJfcGFnZSgpIGV4cGVyaW1lbnRz
Lgo+IFNpbmNlIHRoZW4sIErDqXLDtG1lIEdsaXNzZSBzdWdnZXN0ZWQgdGhlIHJlZmFjdG9yaW5n
IGRlc2NyaWJlZCBhYm92ZS4KPgo+IENjOiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4K
PiBTdWdnZXN0ZWQtYnk6IErDqXLDtG1lIEdsaXNzZSA8amdsaXNzZUByZWRoYXQuY29tPgo+IFJl
dmlld2VkLWJ5OiBEYW4gV2lsbGlhbXMgPGRhbi5qLndpbGxpYW1zQGludGVsLmNvbT4KPiBSZXZp
ZXdlZC1ieTogSmFuIEthcmEgPGphY2tAc3VzZS5jej4KPiBTaWduZWQtb2ZmLWJ5OiBJcmEgV2Vp
bnkgPGlyYS53ZWlueUBpbnRlbC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogSm9obiBIdWJiYXJkIDxq
aHViYmFyZEBudmlkaWEuY29tPgo+IC0tLQo+ICBpbmNsdWRlL2xpbnV4L21tLmggfCAxNyArKysr
KysrKysrKysrLS0tLQo+ICBtbS9tZW1yZW1hcC5jICAgICAgfCAxNiArKy0tLS0tLS0tLS0tLS0t
Cj4gIG1tL3N3YXAuYyAgICAgICAgICB8IDI0ICsrKysrKysrKysrKysrKysrKysrKysrKwo+ICAz
IGZpbGVzIGNoYW5nZWQsIDM5IGluc2VydGlvbnMoKyksIDE4IGRlbGV0aW9ucygtKQo+Cj4gZGlm
ZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvbW0uaCBiL2luY2x1ZGUvbGludXgvbW0uaAo+IGluZGV4
IGM5N2VhM2I2OTRlNi4uNzdhNGRmMDZjOGE3IDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvbGludXgv
bW0uaAo+ICsrKyBiL2luY2x1ZGUvbGludXgvbW0uaAo+IEBAIC05NTIsOSArOTUyLDEwIEBAIHN0
YXRpYyBpbmxpbmUgYm9vbCBpc196b25lX2RldmljZV9wYWdlKGNvbnN0IHN0cnVjdCBwYWdlICpw
YWdlKQo+ICAjZW5kaWYKPgo+ICAjaWZkZWYgQ09ORklHX0RFVl9QQUdFTUFQX09QUwo+IC12b2lk
IF9fcHV0X2Rldm1hcF9tYW5hZ2VkX3BhZ2Uoc3RydWN0IHBhZ2UgKnBhZ2UpOwo+ICt2b2lkIGZy
ZWVfZGV2bWFwX21hbmFnZWRfcGFnZShzdHJ1Y3QgcGFnZSAqcGFnZSk7Cj4gIERFQ0xBUkVfU1RB
VElDX0tFWV9GQUxTRShkZXZtYXBfbWFuYWdlZF9rZXkpOwo+IC1zdGF0aWMgaW5saW5lIGJvb2wg
cHV0X2Rldm1hcF9tYW5hZ2VkX3BhZ2Uoc3RydWN0IHBhZ2UgKnBhZ2UpCj4gKwo+ICtzdGF0aWMg
aW5saW5lIGJvb2wgcGFnZV9pc19kZXZtYXBfbWFuYWdlZChzdHJ1Y3QgcGFnZSAqcGFnZSkKPiAg
ewo+ICAgICAgICAgaWYgKCFzdGF0aWNfYnJhbmNoX3VubGlrZWx5KCZkZXZtYXBfbWFuYWdlZF9r
ZXkpKQo+ICAgICAgICAgICAgICAgICByZXR1cm4gZmFsc2U7Cj4gQEAgLTk2Myw3ICs5NjQsNiBA
QCBzdGF0aWMgaW5saW5lIGJvb2wgcHV0X2Rldm1hcF9tYW5hZ2VkX3BhZ2Uoc3RydWN0IHBhZ2Ug
KnBhZ2UpCj4gICAgICAgICBzd2l0Y2ggKHBhZ2UtPnBnbWFwLT50eXBlKSB7Cj4gICAgICAgICBj
YXNlIE1FTU9SWV9ERVZJQ0VfUFJJVkFURToKPiAgICAgICAgIGNhc2UgTUVNT1JZX0RFVklDRV9G
U19EQVg6Cj4gLSAgICAgICAgICAgICAgIF9fcHV0X2Rldm1hcF9tYW5hZ2VkX3BhZ2UocGFnZSk7
Cj4gICAgICAgICAgICAgICAgIHJldHVybiB0cnVlOwo+ICAgICAgICAgZGVmYXVsdDoKPiAgICAg
ICAgICAgICAgICAgYnJlYWs7Cj4gQEAgLTk3MSw3ICs5NzEsMTQgQEAgc3RhdGljIGlubGluZSBi
b29sIHB1dF9kZXZtYXBfbWFuYWdlZF9wYWdlKHN0cnVjdCBwYWdlICpwYWdlKQo+ICAgICAgICAg
cmV0dXJuIGZhbHNlOwo+ICB9Cj4KPiArYm9vbCBwdXRfZGV2bWFwX21hbmFnZWRfcGFnZShzdHJ1
Y3QgcGFnZSAqcGFnZSk7Cj4gKwo+ICAjZWxzZSAvKiBDT05GSUdfREVWX1BBR0VNQVBfT1BTICov
Cj4gK3N0YXRpYyBpbmxpbmUgYm9vbCBwYWdlX2lzX2Rldm1hcF9tYW5hZ2VkKHN0cnVjdCBwYWdl
ICpwYWdlKQo+ICt7Cj4gKyAgICAgICByZXR1cm4gZmFsc2U7Cj4gK30KPiArCj4gIHN0YXRpYyBp
bmxpbmUgYm9vbCBwdXRfZGV2bWFwX21hbmFnZWRfcGFnZShzdHJ1Y3QgcGFnZSAqcGFnZSkKPiAg
ewo+ICAgICAgICAgcmV0dXJuIGZhbHNlOwo+IEBAIC0xMDI4LDggKzEwMzUsMTAgQEAgc3RhdGlj
IGlubGluZSB2b2lkIHB1dF9wYWdlKHN0cnVjdCBwYWdlICpwYWdlKQo+ICAgICAgICAgICogbmVl
ZCB0byBpbmZvcm0gdGhlIGRldmljZSBkcml2ZXIgdGhyb3VnaCBjYWxsYmFjay4gU2VlCj4gICAg
ICAgICAgKiBpbmNsdWRlL2xpbnV4L21lbXJlbWFwLmggYW5kIEhNTSBmb3IgZGV0YWlscy4KPiAg
ICAgICAgICAqLwo+IC0gICAgICAgaWYgKHB1dF9kZXZtYXBfbWFuYWdlZF9wYWdlKHBhZ2UpKQo+
ICsgICAgICAgaWYgKHBhZ2VfaXNfZGV2bWFwX21hbmFnZWQocGFnZSkpIHsKPiArICAgICAgICAg
ICAgICAgcHV0X2Rldm1hcF9tYW5hZ2VkX3BhZ2UocGFnZSk7Cj4gICAgICAgICAgICAgICAgIHJl
dHVybjsKPiArICAgICAgIH0KPgo+ICAgICAgICAgaWYgKHB1dF9wYWdlX3Rlc3R6ZXJvKHBhZ2Up
KQo+ICAgICAgICAgICAgICAgICBfX3B1dF9wYWdlKHBhZ2UpOwo+IGRpZmYgLS1naXQgYS9tbS9t
ZW1yZW1hcC5jIGIvbW0vbWVtcmVtYXAuYwo+IGluZGV4IGU4OTlmYTg3NmE2Mi4uMmJhNzczODU5
MDMxIDEwMDY0NAo+IC0tLSBhL21tL21lbXJlbWFwLmMKPiArKysgYi9tbS9tZW1yZW1hcC5jCj4g
QEAgLTQxMSwyMCArNDExLDggQEAgc3RydWN0IGRldl9wYWdlbWFwICpnZXRfZGV2X3BhZ2VtYXAo
dW5zaWduZWQgbG9uZyBwZm4sCj4gIEVYUE9SVF9TWU1CT0xfR1BMKGdldF9kZXZfcGFnZW1hcCk7
Cj4KPiAgI2lmZGVmIENPTkZJR19ERVZfUEFHRU1BUF9PUFMKPiAtdm9pZCBfX3B1dF9kZXZtYXBf
bWFuYWdlZF9wYWdlKHN0cnVjdCBwYWdlICpwYWdlKQo+ICt2b2lkIGZyZWVfZGV2bWFwX21hbmFn
ZWRfcGFnZShzdHJ1Y3QgcGFnZSAqcGFnZSkKPiAgewo+IC0gICAgICAgaW50IGNvdW50ID0gcGFn
ZV9yZWZfZGVjX3JldHVybihwYWdlKTsKPiAtCj4gLSAgICAgICAvKiBzdGlsbCBidXN5ICovCj4g
LSAgICAgICBpZiAoY291bnQgPiAxKQo+IC0gICAgICAgICAgICAgICByZXR1cm47Cj4gLQo+IC0g
ICAgICAgLyogb25seSB0cmlnZ2VyZWQgYnkgdGhlIGRldl9wYWdlbWFwIHNodXRkb3duIHBhdGgg
Ki8KPiAtICAgICAgIGlmIChjb3VudCA9PSAwKSB7Cj4gLSAgICAgICAgICAgICAgIF9fcHV0X3Bh
Z2UocGFnZSk7Cj4gLSAgICAgICAgICAgICAgIHJldHVybjsKPiAtICAgICAgIH0KPiAtCj4gICAg
ICAgICAvKiBub3RpZnkgcGFnZSBpZGxlIGZvciBkYXggKi8KPiAgICAgICAgIGlmICghaXNfZGV2
aWNlX3ByaXZhdGVfcGFnZShwYWdlKSkgewo+ICAgICAgICAgICAgICAgICB3YWtlX3VwX3Zhcigm
cGFnZS0+X3JlZmNvdW50KTsKPiBAQCAtNDYxLDUgKzQ0OSw1IEBAIHZvaWQgX19wdXRfZGV2bWFw
X21hbmFnZWRfcGFnZShzdHJ1Y3QgcGFnZSAqcGFnZSkKPiAgICAgICAgIHBhZ2UtPm1hcHBpbmcg
PSBOVUxMOwo+ICAgICAgICAgcGFnZS0+cGdtYXAtPm9wcy0+cGFnZV9mcmVlKHBhZ2UpOwo+ICB9
Cj4gLUVYUE9SVF9TWU1CT0woX19wdXRfZGV2bWFwX21hbmFnZWRfcGFnZSk7Cj4gK0VYUE9SVF9T
WU1CT0woZnJlZV9kZXZtYXBfbWFuYWdlZF9wYWdlKTsKClRoaXMgcGF0Y2ggZG9lcyBub3QgaGF2
ZSBhIG1vZHVsZSBjb25zdW1lciBmb3IKZnJlZV9kZXZtYXBfbWFuYWdlZF9wYWdlKCksIHNvIHRo
ZSBleHBvcnQgc2hvdWxkIG1vdmUgdG8gdGhlIHBhdGNoCnRoYXQgbmVlZHMgdGhlIG5ldyBleHBv
cnQuCgpBbHNvIHRoZSBvbmx5IHJlYXNvbiB0aGF0IHB1dF9kZXZtYXBfbWFuYWdlZF9wYWdlKCkg
aXMgRVhQT1JUX1NZTUJPTAppbnN0ZWFkIG9mIEVYUE9SVF9TWU1CT0xfR1BMIGlzIHRoYXQgdGhl
cmUgd2FzIG5vIHByYWN0aWNhbCB3YXkgdG8KaGlkZSB0aGUgZGV2bWFwIGRldGFpbHMgZnJvbSBl
dmV5IG1vZHVsZSBpbiB0aGUga2VybmVsIHRoYXQgZGlkCnB1dF9wYWdlKCkuIEkgd291bGQgZXhw
ZWN0IGZyZWVfZGV2bWFwX21hbmFnZWRfcGFnZSgpIHRvCkVYUE9SVF9TWU1CT0xfR1BMIGlmIGl0
IGlzIG5vdCBpbmxpbmVkIGludG8gYW4gZXhpc3RpbmcgZXhwb3J0ZWQKc3RhdGljIGlubGluZSBh
cGkuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
