Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD67F9D63
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2019 23:46:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C51FB6EC1E;
	Tue, 12 Nov 2019 22:46:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A392A6EC1E
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 22:46:02 +0000 (UTC)
Received: by mail-oi1-x244.google.com with SMTP id s71so16431239oih.11
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 14:46:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7VZux41I9l8WsaFw4dnSKoQ+DL1POYbdTwXxPgsqOD8=;
 b=aMyfiX9B36kMnX5mzbp0iDYjV3ZhI7Z8GdTFl741sJx8HMrxJLDrJCW9WAzMJiIAM0
 UGETxjQcFksutI/DlganT48eLX5oBqdfxFv2b7dIIuViyjWB9L5rHyMPofLV/2Wlg75/
 j09TJnJ0p6LUKqfEIwq0oZHsv/YlgGGIkBg9cS1umUGmMnznbWM7LBN1Bp0T/XVni6cS
 wI4WVcbuhqTWvN0IonB9aZeq98zxURh+KzHt/h6i6QssLSeZ+yVzbEp9f42yplogOzwR
 Fs5t3J6r/gg+9uWbA5sxcs+YjlqG5eNXwsXM30Ja7G3tdOblZZtsYN1sInz5+DQoE8Nz
 rMWA==
X-Gm-Message-State: APjAAAUbSW3H9mbvBnyZmdoN2Ajjjb4dbFAMAUF1s4s0gjJBGewD+rdE
 E060edyAFetiuurCsGPMADWqCLsNjA1+umBcNemA8g==
X-Google-Smtp-Source: APXvYqwYMdEjXlo/ZXkQ25Q7OqLij5wE38qfmFx+c4Kh6ETnZQ80hOGe2SgdovvfY1Nwmo4LDa9vLeLDcR91Ofxlyck=
X-Received: by 2002:aca:ea57:: with SMTP id i84mr83905oih.73.1573598761920;
 Tue, 12 Nov 2019 14:46:01 -0800 (PST)
MIME-Version: 1.0
References: <20191112000700.3455038-1-jhubbard@nvidia.com>
 <20191112000700.3455038-9-jhubbard@nvidia.com>
 <20191112204338.GE5584@ziepe.ca>
 <0db36e86-b779-01af-77e7-469af2a2e19c@nvidia.com>
In-Reply-To: <0db36e86-b779-01af-77e7-469af2a2e19c@nvidia.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Tue, 12 Nov 2019 14:45:51 -0800
Message-ID: <CAPcyv4hAEgw6ySNS+EFRS4yNRVGz9A3Fu1vOk=XtpjYC64kQJw@mail.gmail.com>
Subject: Re: [PATCH v3 08/23] vfio,
 mm: fix get_user_pages_remote() and FOLL_LONGTERM
To: John Hubbard <jhubbard@nvidia.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=7VZux41I9l8WsaFw4dnSKoQ+DL1POYbdTwXxPgsqOD8=;
 b=g+shynx9wA4O7/ZPSOmOhvhdFUBcChFyBb7EYzal20VNZRr14tSC8CEEu8RhYVOSKP
 ujUV0PqIhIH36zKviPook+HnkIHuRG88nmkcJhEvO3dJXo36vkvTp3d/Rv5+wpQSmOnU
 bQU0r/Fslk/8pH+0JUylPowC6D4ZnT5PrmHiZ30JXUbKpZ1rMZQ7kmT50jl8KfJoHp7m
 VvEK+ooBIm3vYED6+FUL9oFvr5SRhfXOEafMoAbLZrqHGNUi1aW7WiDjR5Rr2M+YKo5Q
 1bTGao6fq7ZjCHqOdYHjYnxFv2rb5XbPoQBWE0A1WALsbQq7HL4C3F5HipXsfgbDt8Vf
 nWjw==
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
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Vlastimil Babka <vbabka@suse.cz>,
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

T24gVHVlLCBOb3YgMTIsIDIwMTkgYXQgMjo0MyBQTSBKb2huIEh1YmJhcmQgPGpodWJiYXJkQG52
aWRpYS5jb20+IHdyb3RlOgo+Cj4gT24gMTEvMTIvMTkgMTI6NDMgUE0sIEphc29uIEd1bnRob3Jw
ZSB3cm90ZToKPiAuLi4KPiA+PiAtICAgICAgICAgICAgfQo+ID4+ICsgICAgcmV0ID0gZ2V0X3Vz
ZXJfcGFnZXNfcmVtb3RlKE5VTEwsIG1tLCB2YWRkciwgMSwgZmxhZ3MgfCBGT0xMX0xPTkdURVJN
LAo+ID4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhZ2UsIHZtYXMsIE5VTEwp
Owo+ID4+ICsgICAgLyoKPiA+PiArICAgICAqIFRoZSBsaWZldGltZSBvZiBhIHZhZGRyX2dldF9w
Zm4oKSBwYWdlIHBpbiBpcwo+ID4+ICsgICAgICogdXNlcnNwYWNlLWNvbnRyb2xsZWQuIEluIHRo
ZSBmcy1kYXggY2FzZSB0aGlzIGNvdWxkCj4gPj4gKyAgICAgKiBsZWFkIHRvIGluZGVmaW5pdGUg
c3RhbGxzIGluIGZpbGVzeXN0ZW0gb3BlcmF0aW9ucy4KPiA+PiArICAgICAqIERpc2FsbG93IGF0
dGVtcHRzIHRvIHBpbiBmcy1kYXggcGFnZXMgdmlhIHRoaXMKPiA+PiArICAgICAqIGludGVyZmFj
ZS4KPiA+PiArICAgICAqLwo+ID4+ICsgICAgaWYgKHJldCA+IDAgJiYgdm1hX2lzX2ZzZGF4KHZt
YXNbMF0pKSB7Cj4gPj4gKyAgICAgICAgICAgIHJldCA9IC1FT1BOT1RTVVBQOwo+ID4+ICsgICAg
ICAgICAgICBwdXRfcGFnZShwYWdlWzBdKTsKPiA+PiAgICAgIH0KPiA+Cj4gPiBBRkFJSyB0aGlz
IGNodW5rIGlzIHJlZHVuZGFudCBub3cgYXMgaXQgaXMgc29tZSBoYWNrIHRvIGVtdWxhdGUKPiA+
IEZPTExfTE9OR1RFUk0/IFNvIHZtYXMgY2FuIGJlIGRlbGV0ZWQgdG9vLgo+Cj4gTGV0IG1lIGZp
cnN0IG1ha2Ugc3VyZSBJIHVuZGVyc3RhbmQgd2hhdCBEYW4gaGFzIGluIG1pbmQgZm9yIHRoZSB2
bWEKPiBjaGVja2luZywgaW4gdGhlIG90aGVyIHRocmVhZC4uLgoKSXQncyBub3QgcmVkdW5kYW50
IHJlbGF0aXZlIHRvIHVwc3RyZWFtIHdoaWNoIGRvZXMgbm90IGRvIGFueXRoaW5nIHRoZQpGT0xM
X0xPTkdURVJNIGluIHRoZSBndXAtc2xvdyBwYXRoLi4uIGJ1dCBJIGhhdmUgbm90IGxvb2tlZCBh
dCBwYXRjaGVzCjEtNyB0byBzZWUgaWYgc29tZXRoaW5nIHRoZXJlIG1hZGUgaXQgcmVkdW5kYW50
LgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
