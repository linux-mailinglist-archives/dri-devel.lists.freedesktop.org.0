Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DAAC3F9FB1
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2019 01:59:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8119A6E045;
	Wed, 13 Nov 2019 00:59:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBE2C6E045
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 00:59:09 +0000 (UTC)
Received: by mail-ot1-x342.google.com with SMTP id m15so127602otq.7
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 16:59:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bbhHvXUlpKSBxAaen2slRAaR7FABAWW5b4ZHt5uDQAs=;
 b=NkIPaZG1mi0M4CFDl/J/nRsA1RDgYv7qBybMVTVOB3jX+L4+sAJm+03U/w3kOt6lcJ
 ZD0BjGMV0s3Tgs3+rUv/e7VrYPSKD2SWMCnQZ23FyjrskgM41MNqXk6GYLvhq+NXecEx
 sNK+P0nRL3i8cvRwNpr7jY9lkGBGbnVJ0dKDIUwg0J6ziamK3n2wzPGBp0jmJ9HSv4k9
 8z707dYCFfQYyCdGflHN0et619PAxbsszAaI/pGHJpdHjAgUN/FzB8s5TcqoXlIAhZcK
 C1Zq+e8kn0gtF9rtNEbbJ1X84LZLYtUntDpfmno+oADuwHlElrc/fnmWgIVyq8uTa/hL
 CW2A==
X-Gm-Message-State: APjAAAVC7WJKcvkPGEbiH4XTnbZg/hz9CS2DBaqOHBMdiB3A2QMsnBGX
 X4YDqp6jk6HEuE9B1Ww4hn60CV30qrWHf5A55r3qpQ==
X-Google-Smtp-Source: APXvYqwE5wMeaGSIvNyY2BTy28AxuQMGsjlQOMQJ/g9Nuz73c9JXx/mbsafhYfzhqVldWgO1VAvXOO9/vT+g3CHkLek=
X-Received: by 2002:a05:6830:1b70:: with SMTP id
 d16mr300372ote.71.1573606748988; 
 Tue, 12 Nov 2019 16:59:08 -0800 (PST)
MIME-Version: 1.0
References: <20191112000700.3455038-1-jhubbard@nvidia.com>
 <20191112000700.3455038-9-jhubbard@nvidia.com>
 <20191112204338.GE5584@ziepe.ca>
 <0db36e86-b779-01af-77e7-469af2a2e19c@nvidia.com>
 <CAPcyv4hAEgw6ySNS+EFRS4yNRVGz9A3Fu1vOk=XtpjYC64kQJw@mail.gmail.com>
 <20191112234250.GA19615@ziepe.ca>
In-Reply-To: <20191112234250.GA19615@ziepe.ca>
From: Dan Williams <dan.j.williams@intel.com>
Date: Tue, 12 Nov 2019 16:58:57 -0800
Message-ID: <CAPcyv4hwFKmsQpp04rS6diCmZwGtbnriCjfY2ofWV485qT9kzg@mail.gmail.com>
Subject: Re: [PATCH v3 08/23] vfio,
 mm: fix get_user_pages_remote() and FOLL_LONGTERM
To: Jason Gunthorpe <jgg@ziepe.ca>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=bbhHvXUlpKSBxAaen2slRAaR7FABAWW5b4ZHt5uDQAs=;
 b=aNNgsrA5EIFA9nVSCXy/uyenu1ifAR2ZxMR/sDW6HqK6vSTYpxIpmBrjP/vDjDaVnk
 l4xh/AHHGyooUHFp1c42LTwLTpwdgtUaJfWvN3Y7CFSVzmwzvxLUaHQBl+Ibev8TBoid
 2FUFgDLM8vD2vOwzS+IEshtyE4Y+b3ieXpqqo3Mxdly/m4ak6FnwfnCLEy5DGwsI7qq9
 7rFre8WIcpfUZvKl+y7wQa6yOvynR61ZdKROoMobKwRLP3lkc2bkhgPK6DIYIEcGXZ4p
 WUPwy1pR33Kp+/7N+4r5VmPuWnlSLsuN14iR6BROP5kh/8NTzRoeUzJllo7I56/tNtvu
 ttpQ==
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
Cc: Michal Hocko <mhocko@suse.com>, Jan Kara <jack@suse.cz>,
 KVM list <kvm@vger.kernel.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, Dave Chinner <david@fromorbit.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Linux MM <linux-mm@kvack.org>,
 Paul Mackerras <paulus@samba.org>, linux-kselftest@vger.kernel.org,
 Ira Weiny <ira.weiny@intel.com>, Jonathan Corbet <corbet@lwn.net>,
 linux-rdma <linux-rdma@vger.kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Christoph Hellwig <hch@infradead.org>, Vlastimil Babka <vbabka@suse.cz>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>,
 "Linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 Shuah Khan <shuah@kernel.org>, John Hubbard <jhubbard@nvidia.com>,
 linux-block@vger.kernel.org,
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

T24gVHVlLCBOb3YgMTIsIDIwMTkgYXQgMzo0MyBQTSBKYXNvbiBHdW50aG9ycGUgPGpnZ0B6aWVw
ZS5jYT4gd3JvdGU6Cj4KPiBPbiBUdWUsIE5vdiAxMiwgMjAxOSBhdCAwMjo0NTo1MVBNIC0wODAw
LCBEYW4gV2lsbGlhbXMgd3JvdGU6Cj4gPiBPbiBUdWUsIE5vdiAxMiwgMjAxOSBhdCAyOjQzIFBN
IEpvaG4gSHViYmFyZCA8amh1YmJhcmRAbnZpZGlhLmNvbT4gd3JvdGU6Cj4gPiA+Cj4gPiA+IE9u
IDExLzEyLzE5IDEyOjQzIFBNLCBKYXNvbiBHdW50aG9ycGUgd3JvdGU6Cj4gPiA+IC4uLgo+ID4g
PiA+PiAtICAgICAgICAgICAgfQo+ID4gPiA+PiArICAgIHJldCA9IGdldF91c2VyX3BhZ2VzX3Jl
bW90ZShOVUxMLCBtbSwgdmFkZHIsIDEsIGZsYWdzIHwgRk9MTF9MT05HVEVSTSwKPiA+ID4gPj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFnZSwgdm1hcywgTlVMTCk7Cj4gPiA+
ID4+ICsgICAgLyoKPiA+ID4gPj4gKyAgICAgKiBUaGUgbGlmZXRpbWUgb2YgYSB2YWRkcl9nZXRf
cGZuKCkgcGFnZSBwaW4gaXMKPiA+ID4gPj4gKyAgICAgKiB1c2Vyc3BhY2UtY29udHJvbGxlZC4g
SW4gdGhlIGZzLWRheCBjYXNlIHRoaXMgY291bGQKPiA+ID4gPj4gKyAgICAgKiBsZWFkIHRvIGlu
ZGVmaW5pdGUgc3RhbGxzIGluIGZpbGVzeXN0ZW0gb3BlcmF0aW9ucy4KPiA+ID4gPj4gKyAgICAg
KiBEaXNhbGxvdyBhdHRlbXB0cyB0byBwaW4gZnMtZGF4IHBhZ2VzIHZpYSB0aGlzCj4gPiA+ID4+
ICsgICAgICogaW50ZXJmYWNlLgo+ID4gPiA+PiArICAgICAqLwo+ID4gPiA+PiArICAgIGlmIChy
ZXQgPiAwICYmIHZtYV9pc19mc2RheCh2bWFzWzBdKSkgewo+ID4gPiA+PiArICAgICAgICAgICAg
cmV0ID0gLUVPUE5PVFNVUFA7Cj4gPiA+ID4+ICsgICAgICAgICAgICBwdXRfcGFnZShwYWdlWzBd
KTsKPiA+ID4gPj4gICAgICB9Cj4gPiA+ID4KPiA+ID4gPiBBRkFJSyB0aGlzIGNodW5rIGlzIHJl
ZHVuZGFudCBub3cgYXMgaXQgaXMgc29tZSBoYWNrIHRvIGVtdWxhdGUKPiA+ID4gPiBGT0xMX0xP
TkdURVJNPyBTbyB2bWFzIGNhbiBiZSBkZWxldGVkIHRvby4KPiA+ID4KPiA+ID4gTGV0IG1lIGZp
cnN0IG1ha2Ugc3VyZSBJIHVuZGVyc3RhbmQgd2hhdCBEYW4gaGFzIGluIG1pbmQgZm9yIHRoZSB2
bWEKPiA+ID4gY2hlY2tpbmcsIGluIHRoZSBvdGhlciB0aHJlYWQuLi4KPiA+Cj4gPiBJdCdzIG5v
dCByZWR1bmRhbnQgcmVsYXRpdmUgdG8gdXBzdHJlYW0gd2hpY2ggZG9lcyBub3QgZG8gYW55dGhp
bmcgdGhlCj4gPiBGT0xMX0xPTkdURVJNIGluIHRoZSBndXAtc2xvdyBwYXRoLi4uIGJ1dCBJIGhh
dmUgbm90IGxvb2tlZCBhdCBwYXRjaGVzCj4gPiAxLTcgdG8gc2VlIGlmIHNvbWV0aGluZyB0aGVy
ZSBtYWRlIGl0IHJlZHVuZGFudC4KPgo+IE9oLCB0aGUgaHVuayBKb2huIGhhZCBiZWxvdyBmb3Ig
Z2V0X3VzZXJfcGFnZXNfcmVtb3RlKCkgYWxzbyBuZWVkcyB0bwo+IGNhbGwgX19ndXBfbG9uZ3Rl
cm1fbG9ja2VkKCkgd2hlbiBGT0xMX0xPTkdURVJNIGlzIHNwZWNpZmllZCwgdGhlbgo+IHRoYXQg
Y2FsbHMgY2hlY2tfZGF4X3ZtYXMoKSB3aGljaCBkdXBsaWNhdGVzIHRoZSB2bWFfaXNfZnNkYXgo
KSBjaGVjawo+IGFib3ZlLgoKT2ggdHJ1ZSwgZ29vZCBleWUuIEl0IGlzIHJlZHVuZGFudCBpZiBp
dCBkb2VzIGFkZGl0aW9uYWxseSBjYWxsCl9fZ3VwX2xvbmd0ZXJtX2xvY2tlZCgpLCBhbmQgaXQg
bmVlZHMgdG8gZG8gdGhhdCBvdGhlcndpc2VzIGl0IHVuZG9lcwp0aGUgQ01BIG1pZ3JhdGlvbiBt
YWdpYyB0aGF0IEFuZWVzaCBhZGRlZC4KCj4KPiBDZXJ0YWlubHkgbm8gY2FsbGVyIG9mIEZPTExf
TE9OR1RFUk0gc2hvdWxkIGhhdmUgdG8gZG8gZGF4IHNwZWNpZmljCj4gVk1BIGNoZWNraW5nLgoK
QWdyZWUsIHRoYXQgd2FzIG15IGNvbW1lbnQgYWJvdXQgY2xlYW5pbmcgdXAgdGhlIHZtYV9pc19m
c2RheCgpIGNoZWNrCnRvIGJlIGludGVybmFsIHRvIHRoZSBndXAgY29yZS4KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
