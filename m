Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E9041089C9
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2019 09:08:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFE8F89F6B;
	Mon, 25 Nov 2019 08:08:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C719F89CB9
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2019 00:53:47 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id 14so15320381qtf.5
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Nov 2019 16:53:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=W5KvmIUsZXoQMVbzDoxYnt7yT+pQC9oHjmWUHowLIDE=;
 b=fcprTrxLsqZ/DDehbX3kNID5KKn0p3ukaHtlR3gM7KyXpoAgq6UobDZJH1+3nX2+H0
 YuZL+NBZis2Sf/hJFrN1b/64ZF30NuwcAmfcP48VSnxVJezP9dgSo53QUChhLYO/b9fM
 RLspcroLXFFIOWHJapCIEdQ95EPUJmpNc2BdvnV2QwnmZedx4uQAIZNVkri1FKvAVJBe
 RWpQy3YIJpKzA8+vJA4TxKmhWsBaUoV9iF2bZg9WR+7N+2a/p57HhVZELfPOO2jyr9MT
 /lNb6DilXf6Z7/sbGHfJfFBoTBOL+Bc8zfJh1Yu+1aA3o391iFH8dEuY8L9pII+u6Q/y
 4+XA==
X-Gm-Message-State: APjAAAVdzlYkdhyczgmstN1z2mCuYSUQR4lqaZ6Q6wc+xw/dBAMyeLfb
 6HeDIWe1ywzyQocBdmtGLLtX3w==
X-Google-Smtp-Source: APXvYqyaLXo5MUyD+I9dO6HiLJFn2uWdH+8xt8jSkZ8bt7a48VQTUuqWsbmWyw/EGV6UxA2EsKJ0Ug==
X-Received: by 2002:ac8:2209:: with SMTP id o9mr27065091qto.246.1574643226463; 
 Sun, 24 Nov 2019 16:53:46 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-162-113-180.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.113.180])
 by smtp.gmail.com with ESMTPSA id o124sm2535273qkf.66.2019.11.24.16.53.45
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 24 Nov 2019 16:53:45 -0800 (PST)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1iZ2dH-00020J-3s; Sun, 24 Nov 2019 20:53:39 -0400
Date: Sun, 24 Nov 2019 20:53:39 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH v7 07/24] IB/umem: use get_user_pages_fast() to pin DMA
 pages
Message-ID: <20191125005339.GC5634@ziepe.ca>
References: <20191121071354.456618-1-jhubbard@nvidia.com>
 <20191121071354.456618-8-jhubbard@nvidia.com>
 <20191121080746.GC30991@infradead.org>
 <20191121143643.GC7448@ziepe.ca> <20191124100724.GH136476@unreal>
 <e8319590-a3f0-5ba4-af4c-65213358a742@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e8319590-a3f0-5ba4-af4c-65213358a742@nvidia.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Mon, 25 Nov 2019 08:07:41 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=W5KvmIUsZXoQMVbzDoxYnt7yT+pQC9oHjmWUHowLIDE=;
 b=bf4wQj5hUYAUJ6J+IG0+hDMiHwo0y37jHBHT8UdhIIsQlzBQ4CxdtIHJrRj51DxlRK
 CKLiYZNarSFFj4FEgRzMNxy+kI0kMWkp2JP+w0At3xJ5awQQfKCflGDMEbLjgI1axJbX
 hAKULgjdId2ND6JafSG19IZ76B47iyKuc//kc4PjYIOLOtUHlwtDFurR95sHJjXvaqXY
 fGrur8LfkpaaQNAoNniODg3+dsAf2S2GrC+6cEhUlICPkA/CU1JiTx+UkO0BkI15CMLp
 7s5O7Rwk6bHEYMLHf8Cgu9Ix5CmyXm+g4xBp1CqvpB7TPmrxsr5ItFDOP1iwxt6Ai6Gn
 z9sA==
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
 kvm@vger.kernel.org, linux-doc@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Dave Chinner <david@fromorbit.com>,
 dri-devel@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 linux-kselftest@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>,
 Leon Romanovsky <leon@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 linux-rdma@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
 Christoph Hellwig <hch@infradead.org>, Vlastimil Babka <vbabka@suse.cz>,
 =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>,
 linux-media@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 linux-block@vger.kernel.org,
 =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Dan Williams <dan.j.williams@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, bpf@vger.kernel.org,
 Magnus Karlsson <magnus.karlsson@intel.com>, Jens Axboe <axboe@kernel.dk>,
 netdev@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuLCBOb3YgMjQsIDIwMTkgYXQgMDQ6MDU6MTZQTSAtMDgwMCwgSm9obiBIdWJiYXJkIHdy
b3RlOgogCj4gSSBsb29rZWQgaW50byB0aGlzLCBhbmQgSSBiZWxpZXZlIHRoYXQgdGhlIHByb2Js
ZW0gaXMgaW4gZ3VwLmMuIFRoZXJlIGFwcGVhcnMgdG8KPiBoYXZlIGJlZW4gYW4gb3ZlcnNpZ2h0
LCBpbiBjb21taXQgODE3YmUxMjllNmYyICgibW06IHZhbGlkYXRlIGdldF91c2VyX3BhZ2VzX2Zh
c3QKPiBmbGFncyIpLCBpbiBmaWx0ZXJpbmcgb3V0IEZPTExfRk9SQ0UuIFRoZXJlIGlzIG5vdGhp
bmcgaW4gdGhlIF9mYXN0KCkgaW1wbGVtZW50YXRpb24KPiB0aGF0IHJlcXVpcmVzIHRoYXQgd2Ug
YXZvaWQgd3JpdGluZyB0byB0aGUgcGFnZXMuCgpJIHRoaW5rIGl0IGlzIHRvbyBsYXRlIHRvIGJl
IGRvaW5nIHRoZXNlIGtpbmRzIG9mIGNoYW5nZXMsIEkgd2lsbApyZXZlcnQgdGhlIHBhdGNoIGFu
ZCB0aGlzIHdpbGwgbWlzcyB0aGlzIG1lcmdlIHdpbmRvdy4KCkphc29uCgpGcm9tIGVjNmNiNDUy
OTJkMjFkMWFmOWI5ZDk1OTk3YjhjZjIwNGJiZTg1NGMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAx
CkZyb206IEphc29uIEd1bnRob3JwZSA8amdnQG1lbGxhbm94LmNvbT4KRGF0ZTogU3VuLCAyNCBO
b3YgMjAxOSAyMDo0Nzo1OSAtMDQwMApTdWJqZWN0OiBbUEFUQ0hdIFJldmVydCAiSUIvdW1lbTog
dXNlIGdldF91c2VyX3BhZ2VzX2Zhc3QoKSB0byBwaW4gRE1BIHBhZ2VzIgoKVGhpcyByZXZlcnRz
IGNvbW1pdCBjOWE3YTJlZDgzN2M1NjNmOWY4OTc0M2E2ZGI3MzI1OTFjYjQwMzViLgoKVGhpcyB3
YXMgbWVyZ2VkIGJlZm9yZSBlbm91Z2ggdGVzdGluZyB3YXMgZG9uZSwgYW5kIGl0IHRyaWdnZXJz
IGEgV0FSTl9PTigpCmluIGdldF91c2VyX3BhZ2VzX2Zhc3QoKToKCiAgV0FSTklORzogQ1BVOiAx
IFBJRDogMjU1NyBhdCBtbS9ndXAuYzoyNDA0IGdldF91c2VyX3BhZ2VzX2Zhc3QrMHgxMTUvMHgx
ODAKICBDYWxsIFRyYWNlOgogICBpYl91bWVtX2dldCsweDI5OC8weDU1MCBbaWJfdXZlcmJzXQog
ICBtbHg1X2liX2RiX21hcF91c2VyKzB4YWQvMHgxMzAgW21seDVfaWJdCiAgIG1seDVfaWJfY3Jl
YXRlX2NxKzB4MWU4LzB4YWEwIFttbHg1X2liXQogICBjcmVhdGVfY3ErMHgxYzgvMHgyZDAgW2li
X3V2ZXJic10KICAgaWJfdXZlcmJzX2NyZWF0ZV9jcSsweDcwLzB4YTAgW2liX3V2ZXJic10KICAg
aWJfdXZlcmJzX2hhbmRsZXJfVVZFUkJTX01FVEhPRF9JTlZPS0VfV1JJVEUrMHhjMi8weGYwIFtp
Yl91dmVyYnNdCiAgIGliX3V2ZXJic19jbWRfdmVyYnMuaXNyYS42KzB4NWJlLzB4YmUwIFtpYl91
dmVyYnNdCiAgID8gdXZlcmJzX2Rpc2Fzc29jaWF0ZV9hcGkrMHhkMC8weGQwIFtpYl91dmVyYnNd
CiAgID8ga3ZtX2Nsb2NrX2dldF9jeWNsZXMrMHhkLzB4MTAKICAgPyBrbWVtX2NhY2hlX2FsbG9j
KzB4MTc2LzB4MWMwCiAgID8gZmlsZW1hcF9tYXBfcGFnZXMrMHgxOGMvMHgzNTAKICAgaWJfdXZl
cmJzX2lvY3RsKzB4YzAvMHgxMjAgW2liX3V2ZXJic10KICAgZG9fdmZzX2lvY3RsKzB4YTEvMHg2
MTAKICAga3N5c19pb2N0bCsweDcwLzB4ODAKICAgX194NjRfc3lzX2lvY3RsKzB4MTYvMHgyMAog
ICBkb19zeXNjYWxsXzY0KzB4NDIvMHgxMTAKICAgZW50cnlfU1lTQ0FMTF82NF9hZnRlcl9od2Zy
YW1lKzB4NDQvMHhhOQoKMjQwNCAgICAgICAgIGlmIChXQVJOX09OX09OQ0UoZ3VwX2ZsYWdzICYg
fihGT0xMX1dSSVRFIHwgRk9MTF9MT05HVEVSTSkpKQoyNDA1ICAgICAgICAgICAgICAgICByZXR1
cm4gLUVJTlZBTDsKCldoaWxlIHdlIHRoaW5rIHRoaXMgV0FSTl9PTiBpcyBwcm9iYWJseSBib2d1
cywgcmVzb2x2aW5nIHRoaXMgd2lsbCBoYXZlIHRvCndhaXQuCgpTaWduZWQtb2ZmLWJ5OiBKYXNv
biBHdW50aG9ycGUgPGpnZ0BtZWxsYW5veC5jb20+Ci0tLQogZHJpdmVycy9pbmZpbmliYW5kL2Nv
cmUvdW1lbS5jIHwgMTcgKysrKysrKysrKystLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNl
cnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvaW5maW5pYmFu
ZC9jb3JlL3VtZW0uYyBiL2RyaXZlcnMvaW5maW5pYmFuZC9jb3JlL3VtZW0uYwppbmRleCAyMTRl
ODdhYTYwOWQ2ZS4uN2EzYjk5NTk3ZWFkYTEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvaW5maW5pYmFu
ZC9jb3JlL3VtZW0uYworKysgYi9kcml2ZXJzL2luZmluaWJhbmQvY29yZS91bWVtLmMKQEAgLTI2
NiwxMyArMjY2LDE2IEBAIHN0cnVjdCBpYl91bWVtICppYl91bWVtX2dldChzdHJ1Y3QgaWJfdWRh
dGEgKnVkYXRhLCB1bnNpZ25lZCBsb25nIGFkZHIsCiAJc2cgPSB1bWVtLT5zZ19oZWFkLnNnbDsK
IAogCXdoaWxlIChucGFnZXMpIHsKLQkJcmV0ID0gZ2V0X3VzZXJfcGFnZXNfZmFzdChjdXJfYmFz
ZSwKLQkJCQkJICBtaW5fdCh1bnNpZ25lZCBsb25nLCBucGFnZXMsCi0JCQkJCQlQQUdFX1NJWkUg
LwotCQkJCQkJc2l6ZW9mKHN0cnVjdCBwYWdlICopKSwKLQkJCQkJICBndXBfZmxhZ3MgfCBGT0xM
X0xPTkdURVJNLCBwYWdlX2xpc3QpOwotCQlpZiAocmV0IDwgMCkKKwkJZG93bl9yZWFkKCZtbS0+
bW1hcF9zZW0pOworCQlyZXQgPSBnZXRfdXNlcl9wYWdlcyhjdXJfYmFzZSwKKwkJCQkgICAgIG1p
bl90KHVuc2lnbmVkIGxvbmcsIG5wYWdlcywKKwkJCQkJICAgUEFHRV9TSVpFIC8gc2l6ZW9mIChz
dHJ1Y3QgcGFnZSAqKSksCisJCQkJICAgICBndXBfZmxhZ3MgfCBGT0xMX0xPTkdURVJNLAorCQkJ
CSAgICAgcGFnZV9saXN0LCBOVUxMKTsKKwkJaWYgKHJldCA8IDApIHsKKwkJCXVwX3JlYWQoJm1t
LT5tbWFwX3NlbSk7CiAJCQlnb3RvIHVtZW1fcmVsZWFzZTsKKwkJfQogCiAJCWN1cl9iYXNlICs9
IHJldCAqIFBBR0VfU0laRTsKIAkJbnBhZ2VzICAgLT0gcmV0OwpAQCAtMjgwLDYgKzI4Myw4IEBA
IHN0cnVjdCBpYl91bWVtICppYl91bWVtX2dldChzdHJ1Y3QgaWJfdWRhdGEgKnVkYXRhLCB1bnNp
Z25lZCBsb25nIGFkZHIsCiAJCXNnID0gaWJfdW1lbV9hZGRfc2dfdGFibGUoc2csIHBhZ2VfbGlz
dCwgcmV0LAogCQkJZG1hX2dldF9tYXhfc2VnX3NpemUoY29udGV4dC0+ZGV2aWNlLT5kbWFfZGV2
aWNlKSwKIAkJCSZ1bWVtLT5zZ19uZW50cyk7CisKKwkJdXBfcmVhZCgmbW0tPm1tYXBfc2VtKTsK
IAl9CiAKIAlzZ19tYXJrX2VuZChzZyk7Ci0tIAoyLjI0LjAKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
