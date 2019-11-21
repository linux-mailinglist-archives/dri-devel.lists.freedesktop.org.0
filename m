Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 574D11057B0
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2019 18:00:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EB4F6F4B5;
	Thu, 21 Nov 2019 17:00:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2474D6F4B5
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2019 17:00:11 +0000 (UTC)
Received: by mail-oi1-x241.google.com with SMTP id o12so3802391oic.9
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2019 09:00:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SDymYy1Cr6msxqeKtzOvSyToG0ApR3Ly++FnBPiFfAU=;
 b=J0WKgBFREKLmB4wuvGR2s03eAR+8z45xwibmQ6ufg9YW7Df3FM2MHDWQLhJKDO4qEe
 kpyhBDJ62uTF4gvVJih8XZ0xrQLpnAPiHWo2H8+6C7AZNL+z60YGYvS3Fsct2zSROvnh
 ThYfhwhdd6k+LZm504JGdoBQDUAJKfwRchSn8yAMeOb0Vlo/JdqYoIePGjnpBOKgWtEB
 TnuimdO0pTyCl12QJmDDVFV3OBKQopwCDHQ8yp4ITWFBfF4spVHjkb2bdYvUvdAUdAD+
 OqAUJxosgG62aNT/CfdKIRz90t9c8+KExo9tT0NM1Mq++mGYeQU4OxKgr4Kq3u7PhjH2
 pMqw==
X-Gm-Message-State: APjAAAXm57p39ZZIfabBQyz9bRXqI5AK94USOa6kysY9x3Ftcf27iSgJ
 hBDYECDvDNWSuVMi8xzikDufY2nL2wSRw5Nm/gkB7w==
X-Google-Smtp-Source: APXvYqzaKFA5sHA2BoiQUxyQp/rlYSGdVkc2qiU+T2e7CfLgs6CP/GdyTJIUkjrV/y2OAJbT5zFGq6OvhTpLAGKVq9Q=
X-Received: by 2002:aca:ea57:: with SMTP id i84mr8187454oih.73.1574355610298; 
 Thu, 21 Nov 2019 09:00:10 -0800 (PST)
MIME-Version: 1.0
References: <20191121071354.456618-1-jhubbard@nvidia.com>
 <20191121071354.456618-6-jhubbard@nvidia.com>
 <20191121080555.GC24784@lst.de>
 <c5f8750f-af82-8aec-ce70-116acf24fa82@nvidia.com>
In-Reply-To: <c5f8750f-af82-8aec-ce70-116acf24fa82@nvidia.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Thu, 21 Nov 2019 08:59:57 -0800
Message-ID: <CAPcyv4jzDfxFAnAYc6g8Zz=3DweQFEBLBQyA_tSDP2Wy-RoA4A@mail.gmail.com>
Subject: Re: [PATCH v7 05/24] mm: devmap: refactor 1-based refcounting for
 ZONE_DEVICE pages
To: John Hubbard <jhubbard@nvidia.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=SDymYy1Cr6msxqeKtzOvSyToG0ApR3Ly++FnBPiFfAU=;
 b=f+VuCObIDRfrJmbTAA4m3SQhOXNZ4pbf+ZyigT8J2YciKJHX1toKS54ABD40/HbC1d
 7Pkwsh8oyyINQzVpjfjsJLe3RxxCFvky++3gAGs9me3lgi9X2Cs94Bu46By7m8IZ2aX6
 6VCe60NDY4cCmQm2ZZlTacWdZ6Ps9MXHsxEoPPvq4YYJFGrJauw8LzXEJJdEFg7nFNai
 NT0xpYhDehIOprr6cUNw9YoHqOqwfQCKgM0QWVQ6U7LVeCnx2wYwSu33Ka73HmSeIHM7
 JqrB5AsBrlMh6M533DPgzCdMMVEMlw9v2LJQn2e/uD0VclTth1B3dpfknn3iLontgkuH
 3IWg==
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

T24gVGh1LCBOb3YgMjEsIDIwMTkgYXQgMTI6NTcgQU0gSm9obiBIdWJiYXJkIDxqaHViYmFyZEBu
dmlkaWEuY29tPiB3cm90ZToKPgo+IE9uIDExLzIxLzE5IDEyOjA1IEFNLCBDaHJpc3RvcGggSGVs
bHdpZyB3cm90ZToKPiA+IFNvIHdoaWxlIHRoaXMgbG9va3MgY29ycmVjdCBhbmQgSSBzdGlsbCBy
ZWFsbHkgZG9uJ3Qgc2VlIHRoZSBtYWpvcgo+ID4gYmVuZWZpdCBvZiB0aGUgbmV3IGNvZGUgb3Jn
YW5pemF0aW9uLCBlc3BlY2lhbGx5IGFzIGl0IGJsb2F0cyBhbGwKPiA+IHB1dF9wYWdlIGNhbGxl
cnMuCj4gPgo+ID4gSSdkIGxvdmUgdG8gc2VlIGNvZGUgc2l6ZSBjaGFuZ2Ugc3RhdHMgZm9yIGFu
IGFsbHllc2NvbmZpZyBvbiB0aGlzCj4gPiBjb21taXQuCj4gPgo+Cj4gUmlnaHQsIEknbSBydW5u
aW5nIHRoYXQgbm93LCB3aWxsIHBvc3QgdGhlIHJlc3VsdHMuIChidHcsIGlmIHRoZXJlIGlzCj4g
YSBzY3JpcHQgYW5kL29yIHN0YW5kYXJkIGZvcm1hdCBJIHNob3VsZCB1c2UsIEknbSBhbGwgZWFy
cy4gSSdsbCBkaWcKPiB0aHJvdWdoIGx3bi4uLikKPgoKSnVzdCBydW46CgogICAgc2l6ZSB2bWxp
bnV4Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
