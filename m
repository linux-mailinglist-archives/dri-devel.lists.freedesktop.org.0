Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 041AE1B2510
	for <lists+dri-devel@lfdr.de>; Tue, 21 Apr 2020 13:26:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E3506E048;
	Tue, 21 Apr 2020 11:26:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 775B788FBD
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Apr 2020 11:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587468411;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wz4VbvB++wEfRs6vgYsKShIscVlUFGxxa9BcmRhqVZE=;
 b=WV1gucei3YnCpNYP3q1Fts70RtlRprH5c7iq0RjT21Bc7GaxTkmoImRJmuU4P0m83l/3zs
 OFXOZc+Sc5vm5dgUqgUwyjbdwJtceGHwCD30ucE74QDt5hJkSwkpYMAaxm7fQgmYhn/HS5
 BPtIIYyQliSire1oNZv9uhP538occ3E=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-418-6dtOXGBOPeCJrukS1zfe3A-1; Tue, 21 Apr 2020 07:26:49 -0400
X-MC-Unique: 6dtOXGBOPeCJrukS1zfe3A-1
Received: by mail-wr1-f70.google.com with SMTP id r17so7343564wrg.19
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Apr 2020 04:26:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rdnJwtlpirvD/9L7xBhvp5m2pmFh+za9be9mrI0LQDE=;
 b=YX4aQNUMmmJlUVA0cItm4ObvWNzUFv4KEuYAGByIGhblU+pqlLuvRJDDk1YCM7StDY
 3VFl2sTxSPDx+Ywc2HGJtkJnCj7zgbDInrI+5eIxnP/NyBA1np5HtiXVX3Rd6x5bbcR5
 Re+1O/fZo9jCskoUTl6yC+8rJ9Vku91t/JDgwDey/M19n5GOBWtWj9iHzJg5dJZP7gyt
 1K6cYm4XOVAk3jpPaz9qyclb5xCLr3BVhO+kWeXglYDNKtami7AaCU1FboCN1FfTB6bi
 QG1MOPXexE2dUSmRERXSbFufZ0LGYBMELTn4jp70fYj5mw4EzGulFK3Pxr7ONPQOH/4H
 PFUA==
X-Gm-Message-State: AGi0PuYLf34Haztjt6sP4NJf1Bum1LgzU0hP5Te9Ks50w11TspKVE9lQ
 23y8JUkllH9giX0xO7fMoV9yGRCsqhnbmKTZgQa6tEcP/k35BftSbuRivU5Y2W0jMVVqYefKjDQ
 owms681kqjBgZfhnwqpWr4Y2CB5k8
X-Received: by 2002:adf:9d8b:: with SMTP id p11mr19729421wre.322.1587468408410; 
 Tue, 21 Apr 2020 04:26:48 -0700 (PDT)
X-Google-Smtp-Source: APiQypLFuKY9/+ahvd0H1GaLlnzWhUfHQUCFYS4RPKLURvSUVIanlHjWMhAT2wQvuycrqclvo4/jpg==
X-Received: by 2002:adf:9d8b:: with SMTP id p11mr19729360wre.322.1587468408223; 
 Tue, 21 Apr 2020 04:26:48 -0700 (PDT)
Received: from localhost.localdomain ([194.230.155.194])
 by smtp.gmail.com with ESMTPSA id z15sm3213949wrs.47.2020.04.21.04.26.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Apr 2020 04:26:47 -0700 (PDT)
Subject: Re: [PATCH 2/8] fs: extract simple_pin/release_fs to separate files
To: Frederic Barrat <fbarrat@linux.ibm.com>, linux-nfs@vger.kernel.org
References: <20200414124304.4470-1-eesposit@redhat.com>
 <20200414124304.4470-3-eesposit@redhat.com>
 <7abfdd3b-dbbe-52ab-df53-95e9f86d39cd@linux.ibm.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-ID: <0d33b363-3801-8147-6f49-f1d6a845fdaf@redhat.com>
Date: Tue, 21 Apr 2020 13:26:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <7abfdd3b-dbbe-52ab-df53-95e9f86d39cd@linux.ibm.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: Song Liu <songliubraving@fb.com>, linux-usb@vger.kernel.org,
 bpf@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>,
 David Airlie <airlied@linux.ie>, Heiko Carstens <heiko.carstens@de.ibm.com>,
 Alexei Starovoitov <ast@kernel.org>, dri-devel@lists.freedesktop.org,
 "J. Bruce Fields" <bfields@fieldses.org>,
 Joseph Qi <joseph.qi@linux.alibaba.com>, Hugh Dickins <hughd@google.com>,
 Paul Mackerras <paulus@samba.org>, John Johansen <john.johansen@canonical.com>,
 linux-s390@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
 Andrew Donnellan <ajd@linux.ibm.com>,
 Matthew Garrett <matthew.garrett@nebula.com>, linux-efi@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Daniel Borkmann <daniel@iogearbox.net>,
 Christian Borntraeger <borntraeger@de.ibm.com>, linux-rdma@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>, Mark Fasheh <mark@fasheh.com>,
 Anton Vorontsov <anton@enomsg.org>, John Fastabend <john.fastabend@gmail.com>,
 James Morris <jmorris@namei.org>, Ard Biesheuvel <ardb@kernel.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Doug Ledford <dledford@redhat.com>,
 oprofile-list@lists.sf.net, Yonghong Song <yhs@fb.com>,
 Ian Kent <raven@themaw.net>, Andrii Nakryiko <andriin@fb.com>,
 Alexey Dobriyan <adobriyan@gmail.com>, "Serge E. Hallyn" <serge@hallyn.com>,
 netdev@vger.kernel.org, Robert Richter <rric@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Vasily Gorbik <gor@linux.ibm.com>,
 Tony Luck <tony.luck@intel.com>, Kees Cook <keescook@chromium.org>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>, autofs@vger.kernel.org,
 Uma Krishnan <ukrishn@linux.ibm.com>, "Manoj N. Kumar" <manoj@linux.ibm.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Jakub Kicinski <kuba@kernel.org>,
 KP Singh <kpsingh@chromium.org>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 "Matthew R. Ochs" <mrochs@linux.ibm.com>,
 "David S. Miller" <davem@davemloft.net>, Felipe Balbi <balbi@kernel.org>,
 Mike Marciniszyn <mike.marciniszyn@intel.com>,
 Iurii Zaikin <yzaikin@google.com>, linux-scsi@vger.kernel.org,
 "Martin K. Petersen" <martin.petersen@oracle.com>, linux-mm@kvack.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dennis Dalessandro <dennis.dalessandro@intel.com>,
 Miklos Szeredi <miklos@szeredi.hu>, linux-security-module@vger.kernel.org,
 linux-kernel@vger.kernel.org, Anna Schumaker <anna.schumaker@netapp.com>,
 Luis Chamberlain <mcgrof@kernel.org>, Chuck Lever <chuck.lever@oracle.com>,
 Jeremy Kerr <jk@ozlabs.org>, Colin Cross <ccross@android.com>,
 linux-fsdevel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Mike Kravetz <mike.kravetz@oracle.com>, linuxppc-dev@lists.ozlabs.org,
 Martin KaFai Lau <kafai@fb.com>, ocfs2-devel@oss.oracle.com,
 Joel Becker <jlbec@evilplan.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpPbiA0LzIxLzIwIDE6MTkgUE0sIEZyZWRlcmljIEJhcnJhdCB3cm90ZToKPiAKPiAKPj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvbWlzYy9jeGwvS2NvbmZpZyBiL2RyaXZlcnMvbWlzYy9jeGwvS2Nv
bmZpZwo+PiBpbmRleCAzOWVlYzkwMzE0ODcuLmE2Mjc5NTA3OWQ5YyAxMDA2NDQKPj4gLS0tIGEv
ZHJpdmVycy9taXNjL2N4bC9LY29uZmlnCj4+ICsrKyBiL2RyaXZlcnMvbWlzYy9jeGwvS2NvbmZp
Zwo+PiBAQCAtMTksNiArMTksNyBAQCBjb25maWcgQ1hMCj4+IMKgwqDCoMKgwqAgc2VsZWN0IENY
TF9CQVNFCj4+IMKgwqDCoMKgwqAgc2VsZWN0IENYTF9BRlVfRFJJVkVSX09QUwo+PiDCoMKgwqDC
oMKgIHNlbGVjdCBDWExfTElCCj4+ICvCoMKgwqAgc2VsZWN0IFNJTVBMRUZTCj4+IMKgwqDCoMKg
wqAgZGVmYXVsdCBtCj4+IMKgwqDCoMKgwqAgaGVscAo+PiDCoMKgwqDCoMKgwqDCoCBTZWxlY3Qg
dGhpcyBvcHRpb24gdG8gZW5hYmxlIGRyaXZlciBzdXBwb3J0IGZvciBJQk0gQ29oZXJlbnQKPj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWlzYy9jeGwvYXBpLmMgYi9kcml2ZXJzL21pc2MvY3hsL2Fw
aS5jCj4+IGluZGV4IGI0OTNkZTk2MjE1My4uMGI4ZjhkZTc0NzVhIDEwMDY0NAo+PiAtLS0gYS9k
cml2ZXJzL21pc2MvY3hsL2FwaS5jCj4+ICsrKyBiL2RyaXZlcnMvbWlzYy9jeGwvYXBpLmMKPj4g
QEAgLTksNiArOSw3IEBACj4+IMKgICNpbmNsdWRlIDxtaXNjL2N4bC5oPgo+PiDCoCAjaW5jbHVk
ZSA8bGludXgvbW9kdWxlLmg+Cj4+IMKgICNpbmNsdWRlIDxsaW51eC9tb3VudC5oPgo+PiArI2lu
Y2x1ZGUgPGxpbnV4L3NpbXBsZWZzLmg+Cj4+IMKgICNpbmNsdWRlIDxsaW51eC9wc2V1ZG9fZnMu
aD4KPj4gwqAgI2luY2x1ZGUgPGxpbnV4L3NjaGVkL21tLmg+Cj4+IMKgICNpbmNsdWRlIDxsaW51
eC9tbXVfY29udGV4dC5oPgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9taXNjL29jeGwvS2NvbmZp
ZyBiL2RyaXZlcnMvbWlzYy9vY3hsL0tjb25maWcKPj4gaW5kZXggMmQyMjY2YzE0MzllLi5kZGQ5
MjQ1ZmZmM2QgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvbWlzYy9vY3hsL0tjb25maWcKPj4gKysr
IGIvZHJpdmVycy9taXNjL29jeGwvS2NvbmZpZwo+PiBAQCAtMTIsNiArMTIsNyBAQCBjb25maWcg
T0NYTAo+PiDCoMKgwqDCoMKgIGRlcGVuZHMgb24gUFBDX1BPV0VSTlYgJiYgUENJICYmIEVFSAo+
PiDCoMKgwqDCoMKgIHNlbGVjdCBPQ1hMX0JBU0UKPj4gwqDCoMKgwqDCoCBzZWxlY3QgSE9UUExV
R19QQ0lfUE9XRVJOVgo+PiArwqDCoMKgIHNlbGVjdCBTSU1QTEVGUwo+IAo+IAo+IEl0J3Mgbm90
IGNsZWFyIHRvIG1lIHRoZSBLY29uZmlnIHVwZGF0ZWQgaXMgbmVlZGVkIGZvciB0aGUgb2N4bCBk
cml2ZXIuIAo+IEkgdGhpbmsgaXQncyBvbmx5IG5lZWRlZCBmb3IgdGhlIGN4bCBkcml2ZXIuCgpJ
IGFtIGdvaW5nIHRvIGdldCByaWQgb2YgdGhlIHNlcGFyYXRlIHNpbXBsZWZzLmMgZmlsZSBhbmQg
cmVsYXRlZCAKS2NvbmZpZyBlbnRyeSBhbmQgcHV0IGV2ZXJ5dGhpbmcgaW4gZnMvbGliZnMuYywg
c28gdGhpcyBmaWxlICh0b2dldGhlciAKd2l0aCBtYW55IG90aGVycyB0b3VjaGVkIGluIHRoaXMg
cGF0Y2gpIHdvbid0IGJlIG1vZGlmaWVkIGluIHYyLgoKVGhhbmtzLAoKRW1hbnVlbGUKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
