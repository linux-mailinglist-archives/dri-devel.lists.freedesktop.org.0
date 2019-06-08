Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7409E3A59A
	for <lists+dri-devel@lfdr.de>; Sun,  9 Jun 2019 14:54:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD180892E6;
	Sun,  9 Jun 2019 12:54:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52609891DA
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Jun 2019 01:47:22 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id g18so2460162qkl.3
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jun 2019 18:47:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=nc6xGH604Ibjz1J23Rb+p/HSbXggztW0x+56PG9xNfU=;
 b=UpgPMjzg6MbnKGx5ltTu/vX6N249AWCuJh3KdjdfRN/NAhZ8vkbMQdMsF3zhDp6VMQ
 IhMD7D4uWIwqAvHz/fVU0o77eCXeDqHKo78/3oDXv3dn9cfylpV1v/rJz1JVnNKKYfi/
 er9fQQ0nZkoDwyUc3BKwkqEKAfaUzHnnWRb1eySehld2VFj88RQ3cdy54RoqDIjTHcUw
 10K3TpCNYtWt2JvLOZwO8EqFXBEhr15LGhqXQDjjaIqo/LJyYQ4+ZlTVrUkGxnzKGQgM
 45mULCVPZtU064LQ+EBuocAawkPGSkA8PhGkztRjX9/1YY1gIy5HwgVkpD744iWRnhJg
 u+xw==
X-Gm-Message-State: APjAAAWWCik1T1Dyarc7T6QyOR13O0SS2B0SvE9f7zRbVDR4dVlqpnJ5
 ZyX6+37UXMlAZoRv+1XDbWdx4w==
X-Google-Smtp-Source: APXvYqzJ0Y9PkmyZQUNKepOagJid3O/yJSUEccWesudwHooEMgZ4TRfl4qAnoz7gxWh5y3LkbErzsw==
X-Received: by 2002:a05:620a:1285:: with SMTP id
 w5mr37337035qki.302.1559958441410; 
 Fri, 07 Jun 2019 18:47:21 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id m4sm1851701qka.70.2019.06.07.18.47.20
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 07 Jun 2019 18:47:20 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hZQS0-0002Fo-D2; Fri, 07 Jun 2019 22:47:20 -0300
Date: Fri, 7 Jun 2019 22:47:20 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Ralph Campbell <rcampbell@nvidia.com>
Subject: Re: [PATCH v2 hmm 05/11] mm/hmm: Remove duplicate condition test
 before wait_event_timeout
Message-ID: <20190608014720.GC7844@ziepe.ca>
References: <20190606184438.31646-1-jgg@ziepe.ca>
 <20190606184438.31646-6-jgg@ziepe.ca>
 <6833be96-12a3-1a1c-1514-c148ba2dd87b@nvidia.com>
 <20190607191302.GR14802@ziepe.ca>
 <e17aa8c5-790c-d977-2eb8-c18cdaa4cbb3@nvidia.com>
 <20190607204427.GU14802@ziepe.ca>
 <ba55e382-c982-8e50-4ee7-7f05c9f7fafa@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ba55e382-c982-8e50-4ee7-7f05c9f7fafa@nvidia.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Sun, 09 Jun 2019 12:54:16 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=nc6xGH604Ibjz1J23Rb+p/HSbXggztW0x+56PG9xNfU=;
 b=RzikS2kkWB0yrELIxgOKLXI7n4K6BJfDButHAVBC/ZMtnKj9yRR01Gnk1MX5Wvtry3
 kC7LOlMabScS8+6SgA690KRqkMx4YF/wk5KRtrM8TUpQIPevIFuD9RLh756wG5jzrO0u
 bszQkMJEE+oGUuSRlcoJcg81LGTFNkoJQzy6/hRMAA2ruxbSXL9D1pPwzRGFl89qiHD8
 bFLVrpGj4wTlH/KA7c/LZKJAdoc5Ll+42EURexdS0k7qha7cppex+m6A9m9qANDBZwGK
 ZC2QbDqv7tCrDTHZw0yqwsuUkrQHcVWL95VP2Zxvnz/oWzhVXifsSAXOWXXRMR0JbrBC
 I82w==
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
Cc: Andrea Arcangeli <aarcange@redhat.com>, linux-rdma@vger.kernel.org,
 John Hubbard <jhubbard@nvidia.com>, Felix.Kuehling@amd.com,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Jerome Glisse <jglisse@redhat.com>, amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdW4gMDcsIDIwMTkgYXQgMDM6MTM6MDBQTSAtMDcwMCwgUmFscGggQ2FtcGJlbGwg
d3JvdGU6Cj4gPiBEbyB5b3Ugc2VlIGEgcmVhc29uIHdoeSB0aGUgZmluZF92bWEoKSBldmVyIG5l
ZWRzIHRvIGJlIGJlZm9yZSB0aGUKPiA+ICdhZ2FpbicgaW4gbXkgYWJvdmUgZXhhbXBsZT8gcmFu
Z2Uudm1hIGRvZXMgbm90IG5lZWQgdG8gYmUgc2V0IGZvcgo+ID4gcmFuZ2VfcmVnaXN0ZXIuCj4g
Cj4gWWVzLCBmb3IgdGhlIEdQVSBjYXNlLCB0aGVyZSBjYW4gYmUgbWFueSBmYXVsdHMgaW4gYW4g
ZXZlbnQgcXVldWUKPiBhbmQgdGhlIGdvYWwgaXMgdG8gdHJ5IHRvIGhhbmRsZSBtb3JlIHRoYW4g
b25lIHBhZ2UgYXQgYSB0aW1lLgo+IFRoZSB2bWEgaXMgbmVlZGVkIHRvIGxpbWl0IHRoZSBhbW91
bnQgb2YgY29hbGVzY2luZyBhbmQgY2hlY2tpbmcKPiBmb3IgcGFnZXMgdGhhdCBjb3VsZCBiZSBz
cGVjdWxhdGl2ZWx5IG1pZ3JhdGVkIG9yIG1hcHBlZC4KCkknZCBuZWVkIHRvIHNlZSBhbiBhbGdv
cml0aG0gc2tldGNoIHRvIHNlZSB3aGF0IHlvdSBhcmUgdGhpbmtpbmcuLgoKQnV0LCBJIGd1ZXNz
IGEgZHJpdmVyIHdvdWxkIGhhdmUgZmlndXJlIG91dCBhIGxpc3Qgb2Ygd2hhdCB2aXJ0dWFsCnBh
Z2VzIGl0IHdhbnRzIHRvIGZhdWx0IHVuZGVyIHRoZSBtbWFwIHNlbSAobWF5YmUgdXNlIGZpbmRf
dmFtLCBldGMpLAp0aGVuIGRyb3AgbW1hcF9zZW0sIGFuZCBzdGFydCBwcm9jZXNzaW5nIHRob3Nl
IHBhZ2VzIGZvciBtaXJyb3JpbmcKdW5kZXIgdGhlIGhtbSBzaWRlLgoKaWUgdGhleSBhcmUgdHdv
IHNlcGVyYXRlIHVucmVsYXRlZCB0YXNrcy4KCkkgbG9va2VkIGF0IHRoZSBobW0ucnN0IGFnYWlu
LCBhbmQgdGhhdCByZWZlcmVuY2UgYWxnb3JpdGhtIGlzIGFscmVhZHkKc2hvd2luZyB0aGF0IHRo
YXQgdXBvbiByZXRyeSB0aGUgbW1hcF9zZW0gaXMgcmVsZWFzZWQ6CgogICAgICB0YWtlX2xvY2so
ZHJpdmVyLT51cGRhdGUpOwogICAgICBpZiAoIXJhbmdlLnZhbGlkKSB7CiAgICAgICAgICByZWxl
YXNlX2xvY2soZHJpdmVyLT51cGRhdGUpOwogICAgICAgICAgdXBfcmVhZCgmbW0tPm1tYXBfc2Vt
KTsKICAgICAgICAgIGdvdG8gYWdhaW47CgpTbyBhIGRyaXZlciBjYW5ub3QgYXNzdW1lIHRoYXQg
YW55IFZNQSByZWxhdGVkIHdvcmsgZG9uZSB1bmRlciB0aGUKbW1hcCBiZWZvcmUgdGhlIGhtbSAn
Y3JpdGljYWwgc2VjdGlvbicgY2FuIGNhcnJ5IGludG8gdGhlIGhtbSBjcml0aWNhbApzZWN0aW9u
IGFzIHRoZSBsb2NrIGNhbiBiZSByZWxlYXNlZCB1cG9uIHJldHJ5IGFuZCBpbnZhbGlkYXRlIGFs
bCB0aGF0CmRhdGEuLgoKRm9yY2luZyB0aGUgaG1tX3JhbmdlX3N0YXJ0X2FuZF9sb2NrKCkgdG8g
YWNxdWlyZSB0aGUgbW1hcF9zZW0gaXMgYQpyb3VnaCB3YXkgdG8gZm9yY2UgdGhlIGRyaXZlciBh
dXRob3IgdG8gcmVhbGl6ZSB0aGVyZSBhcmUgdHdvIGxvY2tpbmcKZG9tYWlucyBhbmQgbG9jayBw
cm90ZWN0ZWQgaW5mb3JtYXRpb24gY2Fubm90IGNyb3NzIGJldHdlZW4uCgo+IE9LLCBJIHVuZGVy
c3RhbmQuCj4gSWYgeW91IGNvbWUgdXAgd2l0aCBhIHNldCBvZiBjaGFuZ2VzLCBJIGNhbiB0cnkg
dGVzdGluZyB0aGVtLgoKVGhhbmtzLCBJIG1ha2UgYSBza2V0Y2ggb2YgdGhlIHBhdGNoLCBJIGhh
dmUgdG8gZ2V0IGJhY2sgdG8gaXQgYWZ0ZXIKdGhpcyBzZXJpZXMgaXMgZG9uZS4KCkphc29uCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
