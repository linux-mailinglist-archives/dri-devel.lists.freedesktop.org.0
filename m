Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B30FAB79
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2019 08:56:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89CD66EA46;
	Wed, 13 Nov 2019 07:56:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02BDB6EC31
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 23:42:52 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id t20so460634qtn.9
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 15:42:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=vZiC7XI6w4qmcJhiszw5fcLLfKl81FBqJhCu/q1OZew=;
 b=oICCMuhGpvELF3EH15c+prhBj2v2+k5A0tXdlZHtozdW8UzKNbCin/uc2hnz4MeZcV
 erLp+UPlfMGeV7T05xiamnwEvN9bCFr9LpLkQyblIVDrGNxYETWlekFuQ0Kf5ufRI32/
 eUDM3QQxoiIkzkc0GuYw6c7eSMfxF4F6N3izpYTYqDsr0QkczLJqQdJjVaV4EERSoDxC
 DSMKOBubk/5r7dk8kZZOa/xzZp5hH0SJPqsL+w/R+0zXIHJi1OeiICFQ5PT3Dh54A/0u
 gjPrEql6qob6r2CYOyK7UuXsxVftbt49iyb4i+b9yPKncylB05XkBxupyAul3DQECcSD
 JrLQ==
X-Gm-Message-State: APjAAAWoPGqRpluB/mdYMGL/uwIeCGFB8Ag5BEdEYyw8kV+96MNIAkxa
 noiNPVPOXckZOszY0lcaWrHyTQ==
X-Google-Smtp-Source: APXvYqz3aftIVfOw8Wxd6a6UdmY0tmO8rvvaAb/aUmwkho+fgsveWFsBhLgURBNyxpICpzEXHNU+vQ==
X-Received: by 2002:aed:26e2:: with SMTP id q89mr18576100qtd.391.1573602171951; 
 Tue, 12 Nov 2019 15:42:51 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-162-113-180.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.113.180])
 by smtp.gmail.com with ESMTPSA id u11sm212203qtg.11.2019.11.12.15.42.51
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 12 Nov 2019 15:42:51 -0800 (PST)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1iUfoA-0005Um-OB; Tue, 12 Nov 2019 19:42:50 -0400
Date: Tue, 12 Nov 2019 19:42:50 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Dan Williams <dan.j.williams@intel.com>
Subject: Re: [PATCH v3 08/23] vfio, mm: fix get_user_pages_remote() and
 FOLL_LONGTERM
Message-ID: <20191112234250.GA19615@ziepe.ca>
References: <20191112000700.3455038-1-jhubbard@nvidia.com>
 <20191112000700.3455038-9-jhubbard@nvidia.com>
 <20191112204338.GE5584@ziepe.ca>
 <0db36e86-b779-01af-77e7-469af2a2e19c@nvidia.com>
 <CAPcyv4hAEgw6ySNS+EFRS4yNRVGz9A3Fu1vOk=XtpjYC64kQJw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPcyv4hAEgw6ySNS+EFRS4yNRVGz9A3Fu1vOk=XtpjYC64kQJw@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Wed, 13 Nov 2019 07:55:45 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=vZiC7XI6w4qmcJhiszw5fcLLfKl81FBqJhCu/q1OZew=;
 b=it8jHl8Aeod0zYq+Skrwrg8GwHh9Iu8Lk4aklL2UU1A7NrkgqGz5TacHTvuZENKCSO
 zX5vQsxL6WoNuMWNKkEQjxDubFJia3lLQ6vtybpi5bU815x8TqvUIIt9Kr2Uo5cBSRzI
 2VZYj93gQX0itc+geQUWbcwpbx7dsR+jspiqHjxUKDMEHdunGEQMz6R4qhshIz6xtcbf
 Zhwk9IxmoxlDCj68H/K3Yi1WAV8gDwI3vnoSzzJ5OjxNZ+oTEONNaXk9owbEXpdua0Ac
 Ytg9ljas4ej2TjoNx1nr1x9pd15vss2zsUb9mCqXq0UcPC7FIXHufZoDuL/IWSFTzLDE
 UAww==
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
 =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>,
 "Linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 Shuah Khan <shuah@kernel.org>, John Hubbard <jhubbard@nvidia.com>,
 linux-block@vger.kernel.org,
 =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
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

T24gVHVlLCBOb3YgMTIsIDIwMTkgYXQgMDI6NDU6NTFQTSAtMDgwMCwgRGFuIFdpbGxpYW1zIHdy
b3RlOgo+IE9uIFR1ZSwgTm92IDEyLCAyMDE5IGF0IDI6NDMgUE0gSm9obiBIdWJiYXJkIDxqaHVi
YmFyZEBudmlkaWEuY29tPiB3cm90ZToKPiA+Cj4gPiBPbiAxMS8xMi8xOSAxMjo0MyBQTSwgSmFz
b24gR3VudGhvcnBlIHdyb3RlOgo+ID4gLi4uCj4gPiA+PiAtICAgICAgICAgICAgfQo+ID4gPj4g
KyAgICByZXQgPSBnZXRfdXNlcl9wYWdlc19yZW1vdGUoTlVMTCwgbW0sIHZhZGRyLCAxLCBmbGFn
cyB8IEZPTExfTE9OR1RFUk0sCj4gPiA+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBwYWdlLCB2bWFzLCBOVUxMKTsKPiA+ID4+ICsgICAgLyoKPiA+ID4+ICsgICAgICogVGhlIGxp
ZmV0aW1lIG9mIGEgdmFkZHJfZ2V0X3BmbigpIHBhZ2UgcGluIGlzCj4gPiA+PiArICAgICAqIHVz
ZXJzcGFjZS1jb250cm9sbGVkLiBJbiB0aGUgZnMtZGF4IGNhc2UgdGhpcyBjb3VsZAo+ID4gPj4g
KyAgICAgKiBsZWFkIHRvIGluZGVmaW5pdGUgc3RhbGxzIGluIGZpbGVzeXN0ZW0gb3BlcmF0aW9u
cy4KPiA+ID4+ICsgICAgICogRGlzYWxsb3cgYXR0ZW1wdHMgdG8gcGluIGZzLWRheCBwYWdlcyB2
aWEgdGhpcwo+ID4gPj4gKyAgICAgKiBpbnRlcmZhY2UuCj4gPiA+PiArICAgICAqLwo+ID4gPj4g
KyAgICBpZiAocmV0ID4gMCAmJiB2bWFfaXNfZnNkYXgodm1hc1swXSkpIHsKPiA+ID4+ICsgICAg
ICAgICAgICByZXQgPSAtRU9QTk9UU1VQUDsKPiA+ID4+ICsgICAgICAgICAgICBwdXRfcGFnZShw
YWdlWzBdKTsKPiA+ID4+ICAgICAgfQo+ID4gPgo+ID4gPiBBRkFJSyB0aGlzIGNodW5rIGlzIHJl
ZHVuZGFudCBub3cgYXMgaXQgaXMgc29tZSBoYWNrIHRvIGVtdWxhdGUKPiA+ID4gRk9MTF9MT05H
VEVSTT8gU28gdm1hcyBjYW4gYmUgZGVsZXRlZCB0b28uCj4gPgo+ID4gTGV0IG1lIGZpcnN0IG1h
a2Ugc3VyZSBJIHVuZGVyc3RhbmQgd2hhdCBEYW4gaGFzIGluIG1pbmQgZm9yIHRoZSB2bWEKPiA+
IGNoZWNraW5nLCBpbiB0aGUgb3RoZXIgdGhyZWFkLi4uCj4gCj4gSXQncyBub3QgcmVkdW5kYW50
IHJlbGF0aXZlIHRvIHVwc3RyZWFtIHdoaWNoIGRvZXMgbm90IGRvIGFueXRoaW5nIHRoZQo+IEZP
TExfTE9OR1RFUk0gaW4gdGhlIGd1cC1zbG93IHBhdGguLi4gYnV0IEkgaGF2ZSBub3QgbG9va2Vk
IGF0IHBhdGNoZXMKPiAxLTcgdG8gc2VlIGlmIHNvbWV0aGluZyB0aGVyZSBtYWRlIGl0IHJlZHVu
ZGFudC4KCk9oLCB0aGUgaHVuayBKb2huIGhhZCBiZWxvdyBmb3IgZ2V0X3VzZXJfcGFnZXNfcmVt
b3RlKCkgYWxzbyBuZWVkcyB0bwpjYWxsIF9fZ3VwX2xvbmd0ZXJtX2xvY2tlZCgpIHdoZW4gRk9M
TF9MT05HVEVSTSBpcyBzcGVjaWZpZWQsIHRoZW4KdGhhdCBjYWxscyBjaGVja19kYXhfdm1hcygp
IHdoaWNoIGR1cGxpY2F0ZXMgdGhlIHZtYV9pc19mc2RheCgpIGNoZWNrCmFib3ZlLgoKQ2VydGFp
bmx5IG5vIGNhbGxlciBvZiBGT0xMX0xPTkdURVJNIHNob3VsZCBoYXZlIHRvIGRvIGRheCBzcGVj
aWZpYwpWTUEgY2hlY2tpbmcuCgpKYXNvbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
