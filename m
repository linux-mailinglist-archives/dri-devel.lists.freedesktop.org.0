Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CA14F9CA9
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2019 22:57:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7AC26E52D;
	Tue, 12 Nov 2019 21:57:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B47A36E52D
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 21:57:38 +0000 (UTC)
Received: by mail-ot1-x341.google.com with SMTP id d5so15752418otp.4
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 13:57:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GVsjPqJbGl0vB/+Gk+mdS3wPD6eGzXnfLsFoQJ3IvwY=;
 b=thAQymqp+Wl9JyJFMYkcf++jkx/+prkjJlRWBZtw+E1tkMchcs7DecpwRNLTmHmCXz
 fbd/Z282ty9/7NcwVZwjjLdAR2zkYDOFu3HkxLOKSDvoNKtnNWV1c2mqGKVmt2Gy+GUN
 9CxWsoOwSBxdmMg8hDNmlCo96DYJlND7jwecnzX/CUvKNfZ1pTN5SHtfiwsTwHkPKNL4
 nCGsleMkOhsRYzjc0g08T4CmTXf1rzLlhw6itcIJYN4imRZD29ZM3y694v8ZkeRHo5et
 s1JRBae7Ki7Ch+lKAxLWzyUm/3Yg2eOQ3/bSZK1CIRmO5bN1Fhs3eSEdiNkNnRoUEKJ4
 6Utw==
X-Gm-Message-State: APjAAAWxmeueueRefYjZJpPu3i/pDf2aa7IoR+zRugjybCMzIv+PKeAH
 zJnlhxXj7VY/lGKBXyir0DzjV1TcpgvxeGyC3PDXZg==
X-Google-Smtp-Source: APXvYqzkEVRCSmKc+X1f3BY1LRLo7eG1sZvx8YX/MxrMpGOBy0kbPmD/k6U1Bv0DnK/agC4LCbQG5TvJ1BrQq2DF3mo=
X-Received: by 2002:a9d:5f11:: with SMTP id f17mr5454287oti.207.1573595857896; 
 Tue, 12 Nov 2019 13:57:37 -0800 (PST)
MIME-Version: 1.0
References: <20191112000700.3455038-1-jhubbard@nvidia.com>
 <20191112000700.3455038-9-jhubbard@nvidia.com>
In-Reply-To: <20191112000700.3455038-9-jhubbard@nvidia.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Tue, 12 Nov 2019 13:57:27 -0800
Message-ID: <CAPcyv4hgKEqoxeQJH9R=YiZosvazj308Kk7jJA1NLxJkNenDcQ@mail.gmail.com>
Subject: Re: [PATCH v3 08/23] vfio,
 mm: fix get_user_pages_remote() and FOLL_LONGTERM
To: John Hubbard <jhubbard@nvidia.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=GVsjPqJbGl0vB/+Gk+mdS3wPD6eGzXnfLsFoQJ3IvwY=;
 b=Xi5VpxURlOvKgdnc2CCM8ogRa/H5/0k5sFmSuFB8dP7mdDgr87G2ihgcoAULaWG/WG
 Hj8o+3+ie5rrJujDRUeLRQcOeiNzn8YKMM2VBeVNBKVsnBN0FQns+w7w3PsW4i65s8a5
 N+VULX92Qszd6uoAo9krZIME0J3xIfL4gJiRjCsCskWvVjLpfyuINcuFYSor/+iuZuqF
 2TY8xkdKZQu+VBpockLjH+8q98S3mNVqmKjCD+wTD8kkFuDZ2LtRYTFByjXSsRxruC6f
 SXuVKXEgsV4rmu18ICvQbVomOgOwxUGMXKdLYloN5hq1WNlcDitiNl2/AmVQ4Ykyplh2
 IsGw==
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

T24gTW9uLCBOb3YgMTEsIDIwMTkgYXQgNDowNyBQTSBKb2huIEh1YmJhcmQgPGpodWJiYXJkQG52
aWRpYS5jb20+IHdyb3RlOgo+Cj4gQXMgaXQgc2F5cyBpbiB0aGUgdXBkYXRlZCBjb21tZW50IGlu
IGd1cC5jOiBjdXJyZW50IEZPTExfTE9OR1RFUk0KPiBiZWhhdmlvciBpcyBpbmNvbXBhdGlibGUg
d2l0aCBGQVVMVF9GTEFHX0FMTE9XX1JFVFJZIGJlY2F1c2Ugb2YgdGhlCj4gRlMgREFYIGNoZWNr
IHJlcXVpcmVtZW50IG9uIHZtYXMuCj4KPiBIb3dldmVyLCB0aGUgY29ycmVzcG9uZGluZyByZXN0
cmljdGlvbiBpbiBnZXRfdXNlcl9wYWdlc19yZW1vdGUoKSB3YXMKPiBzbGlnaHRseSBzdHJpY3Rl
ciB0aGFuIGlzIGFjdHVhbGx5IHJlcXVpcmVkOiBpdCBmb3JiYWRlIGFsbAo+IEZPTExfTE9OR1RF
Uk0gY2FsbGVycywgYnV0IHdlIGNhbiBhY3R1YWxseSBhbGxvdyBGT0xMX0xPTkdURVJNIGNhbGxl
cnMKPiB0aGF0IGRvIG5vdCBzZXQgdGhlICJsb2NrZWQiIGFyZy4KPgo+IFVwZGF0ZSB0aGUgY29k
ZSBhbmQgY29tbWVudHMgYWNjb3JkaW5nbHksIGFuZCB1cGRhdGUgdGhlIFZGSU8gY2FsbGVyCj4g
dG8gdGFrZSBhZHZhbnRhZ2Ugb2YgdGhpcywgZml4aW5nIGEgYnVnIGFzIGEgcmVzdWx0OiB0aGUg
VkZJTyBjYWxsZXIKPiBpcyBsb2dpY2FsbHkgYSBGT0xMX0xPTkdURVJNIHVzZXIuCj4KPiBUaGFu
a3MgdG8gSmFzb24gR3VudGhvcnBlIGZvciBwb2ludGluZyBvdXQgYSBjbGVhbiB3YXkgdG8gZml4
IHRoaXMuCj4KPiBTdWdnZXN0ZWQtYnk6IEphc29uIEd1bnRob3JwZSA8amdnQHppZXBlLmNhPgo+
IENjOiBKZXJvbWUgR2xpc3NlIDxqZ2xpc3NlQHJlZGhhdC5jb20+Cj4gQ2M6IElyYSBXZWlueSA8
aXJhLndlaW55QGludGVsLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBKb2huIEh1YmJhcmQgPGpodWJi
YXJkQG52aWRpYS5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvdmZpby92ZmlvX2lvbW11X3R5cGUxLmMg
fCAzMCArKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0KPiAgbW0vZ3VwLmMgICAgICAgICAg
ICAgICAgICAgICAgICB8IDEzICsrKysrKysrLS0tLS0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAyMSBp
bnNlcnRpb25zKCspLCAyMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3Zm
aW8vdmZpb19pb21tdV90eXBlMS5jIGIvZHJpdmVycy92ZmlvL3ZmaW9faW9tbXVfdHlwZTEuYwo+
IGluZGV4IGQ4NjQyNzdlYTE2Zi4uMDE3Njg5YjdjMzJiIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMv
dmZpby92ZmlvX2lvbW11X3R5cGUxLmMKPiArKysgYi9kcml2ZXJzL3ZmaW8vdmZpb19pb21tdV90
eXBlMS5jCj4gQEAgLTM0OCwyNCArMzQ4LDIwIEBAIHN0YXRpYyBpbnQgdmFkZHJfZ2V0X3Bmbihz
dHJ1Y3QgbW1fc3RydWN0ICptbSwgdW5zaWduZWQgbG9uZyB2YWRkciwKPiAgICAgICAgICAgICAg
ICAgZmxhZ3MgfD0gRk9MTF9XUklURTsKPgo+ICAgICAgICAgZG93bl9yZWFkKCZtbS0+bW1hcF9z
ZW0pOwo+IC0gICAgICAgaWYgKG1tID09IGN1cnJlbnQtPm1tKSB7Cj4gLSAgICAgICAgICAgICAg
IHJldCA9IGdldF91c2VyX3BhZ2VzKHZhZGRyLCAxLCBmbGFncyB8IEZPTExfTE9OR1RFUk0sIHBh
Z2UsCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHZtYXMpOwo+IC0gICAg
ICAgfSBlbHNlIHsKPiAtICAgICAgICAgICAgICAgcmV0ID0gZ2V0X3VzZXJfcGFnZXNfcmVtb3Rl
KE5VTEwsIG1tLCB2YWRkciwgMSwgZmxhZ3MsIHBhZ2UsCj4gLSAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICB2bWFzLCBOVUxMKTsKPiAtICAgICAgICAgICAgICAgLyoK
PiAtICAgICAgICAgICAgICAgICogVGhlIGxpZmV0aW1lIG9mIGEgdmFkZHJfZ2V0X3BmbigpIHBh
Z2UgcGluIGlzCj4gLSAgICAgICAgICAgICAgICAqIHVzZXJzcGFjZS1jb250cm9sbGVkLiBJbiB0
aGUgZnMtZGF4IGNhc2UgdGhpcyBjb3VsZAo+IC0gICAgICAgICAgICAgICAgKiBsZWFkIHRvIGlu
ZGVmaW5pdGUgc3RhbGxzIGluIGZpbGVzeXN0ZW0gb3BlcmF0aW9ucy4KPiAtICAgICAgICAgICAg
ICAgICogRGlzYWxsb3cgYXR0ZW1wdHMgdG8gcGluIGZzLWRheCBwYWdlcyB2aWEgdGhpcwo+IC0g
ICAgICAgICAgICAgICAgKiBpbnRlcmZhY2UuCj4gLSAgICAgICAgICAgICAgICAqLwo+IC0gICAg
ICAgICAgICAgICBpZiAocmV0ID4gMCAmJiB2bWFfaXNfZnNkYXgodm1hc1swXSkpIHsKPiAtICAg
ICAgICAgICAgICAgICAgICAgICByZXQgPSAtRU9QTk9UU1VQUDsKPiAtICAgICAgICAgICAgICAg
ICAgICAgICBwdXRfcGFnZShwYWdlWzBdKTsKPiAtICAgICAgICAgICAgICAgfQo+ICsgICAgICAg
cmV0ID0gZ2V0X3VzZXJfcGFnZXNfcmVtb3RlKE5VTEwsIG1tLCB2YWRkciwgMSwgZmxhZ3MgfCBG
T0xMX0xPTkdURVJNLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhZ2Us
IHZtYXMsIE5VTEwpOwoKSG1tLCB3aGF0J3MgdGhlIHBvaW50IG9mIHBhc3NpbmcgRk9MTF9MT05H
VEVSTSB0bwpnZXRfdXNlcl9wYWdlc19yZW1vdGUoKSBpZiBnZXRfdXNlcl9wYWdlc19yZW1vdGUo
KSBpcyBub3QgZ29pbmcgdG8KY2hlY2sgdGhlIHZtYT8gSSB0aGluayB3ZSBnb3QgdG8gdGhpcyBj
b2RlIHN0YXRlIGJlY2F1c2UgdGhlCmdldF91c2VyX3BhZ2VzKCkgdnMgZ2V0X3VzZXJfcGFnZXNf
cmVtb3RlKCkgc3BsaXQgcHJlZGF0ZWQgdGhlCmludHJvZHVjdGlvbiBvZiBGT0xMX0xPTkdURVJN
LgoKSSB0aGluayBjaGVja192bWFfZmxhZ3MoKSBzaG91bGQgZG8gdGhlICgoRk9MTF9MT05HVEVS
TSB8IEZPTExfR0VUKSAmJgp2bWFfaXNfZnNkYXgoKSkgY2hlY2sgYW5kIHRoYXQgd291bGQgYWxz
byByZW1vdmUgdGhlIG5lZWQgZm9yCl9fZ3VwX2xvbmd0ZXJtX2xvY2tlZC4KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
