Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A93ECBB2
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2019 23:50:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B32BC6F890;
	Fri,  1 Nov 2019 22:50:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DDB46E2C8
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Nov 2019 19:20:01 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id 15so11716215qkh.6
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Nov 2019 12:20:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=GwL3BzOKq0ds1hKB7ElDSudCiv4GvOB/hy58iKY5/B8=;
 b=ndkiMnw1joH3ODZe90xF0ADejcSFNNI3qUVyNxa4ldS53WUB6/QblmxWf5Nx+pjTPS
 5XV8bM7bCaC18WDxCRIiT3NjgczCs5pCUmdfoWHxqDDvv/oT7LdJiKQhlObCy/0zw+WQ
 T/gylZnVd4VcwfmLt2yH466QtDhdd4GRDBGHhI54OSyBZPVzsIT23QeaZvMfZbBvSpir
 wkvr1oIUwBIMxLBzzUzJiAqo6jvaa6Vv7RL+o/aiaYUqMqBfS9GJpu6D2HL0wTzmBQJ+
 MqpEceiTQupkNhMgWKQhBNWS71GBq2ACr3Q2WkZpAQio2adNQEbwLz8mOB8ufYlhhTZ6
 V31Q==
X-Gm-Message-State: APjAAAVLnXHogrR2EAfVi9XQ99KxmEvgCR5LBlpjheGc3ntx4hjvrP8k
 1I2/KxvjAl5Ni5QhOrffINRp5A==
X-Google-Smtp-Source: APXvYqzEDkQfD72DvPVzNHUDGv0HzF9IhjVJJOU3fqLQvuuBBx1c6gvz8fC1Pmu9FXNbHzO5K/kLfA==
X-Received: by 2002:a37:a5d3:: with SMTP id
 o202mr11070822qke.283.1572636000661; 
 Fri, 01 Nov 2019 12:20:00 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-162-113-180.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.113.180])
 by smtp.gmail.com with ESMTPSA id n20sm4777802qkn.118.2019.11.01.12.19.59
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 01 Nov 2019 12:19:59 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1iQcSl-0001WJ-Af; Fri, 01 Nov 2019 16:19:59 -0300
Date: Fri, 1 Nov 2019 16:19:59 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Yang, Philip" <Philip.Yang@amd.com>
Subject: Re: [PATCH v2 14/15] drm/amdgpu: Use mmu_range_notifier instead of
 hmm_mirror
Message-ID: <20191101191959.GC30938@ziepe.ca>
References: <20191028201032.6352-1-jgg@ziepe.ca>
 <20191028201032.6352-15-jgg@ziepe.ca>
 <a456ebd0-28cf-997b-31ff-72d9077a9b8e@amd.com>
 <20191029192544.GU22766@mellanox.com>
 <30b2f569-bf7a-5166-c98d-4a4a13d1351f@amd.com>
 <20191101151222.GN22766@mellanox.com>
 <8280fb65-a897-3d71-79f9-9f80d9e474e9@amd.com>
 <20191101174221.GO22766@mellanox.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191101174221.GO22766@mellanox.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Fri, 01 Nov 2019 22:50:15 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=GwL3BzOKq0ds1hKB7ElDSudCiv4GvOB/hy58iKY5/B8=;
 b=kA4XkYghuc1JhsLIKqtgHvYOYkbQmmO6SYAQeEOYSvqnxdZ9jZjDhUnlYr3SdULzs/
 VoX2uPnnM2cxYanlj78zNtQ8A185ZcJgnYIuK+wcaBJKUjnadFHxwWHFnNobP8aT09Cn
 HnhVwCqE58/HmHF5+ja6RFYUyhDE8o8qki7WdccEAWeGPWKB8fIH17+S7MdnxhZ3jZwr
 y9zYt4pe9WYFRB7vGaJ1TV38vnomkwp60DMN7hZ5n6Ba4axjFUG3uuRMMSdF/nELroE0
 XD1ENSPS4tRu1keLPM7zbG3a+3hiST+P1cHzfwyt+Rx8K72rUFTYxupuLkm6utoV1HB1
 nhHA==
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
Cc: "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBOb3YgMDEsIDIwMTkgYXQgMDI6NDI6MjFQTSAtMDMwMCwgSmFzb24gR3VudGhvcnBl
IHdyb3RlOgo+IE9uIEZyaSwgTm92IDAxLCAyMDE5IGF0IDAzOjU5OjI2UE0gKzAwMDAsIFlhbmcs
IFBoaWxpcCB3cm90ZToKPiA+ID4gVGhpcyB0ZXN0IGZvciByYW5nZV9ibG9ja2FibGUgc2hvdWxk
IGJlIGJlZm9yZSBtdXRleF9sb2NrLCBJIGNhbiBtb3ZlCj4gPiA+IGl0IHVwCj4gPiA+IAo+ID4g
eWVzLCB0aGFua3MuCj4gCj4gT2theSwgSSB3cm90ZSBpdCBsaWtlIHRoaXM6Cj4gCj4gCWlmICht
bXVfbm90aWZpZXJfcmFuZ2VfYmxvY2thYmxlKHJhbmdlKSkKPiAJCW11dGV4X2xvY2soJmFkZXYt
Pm5vdGlmaWVyX2xvY2spOwo+IAllbHNlIGlmICghbXV0ZXhfdHJ5bG9jaygmYWRldi0+bm90aWZp
ZXJfbG9jaykpCj4gCQlyZXR1cm4gZmFsc2U7CgpOZXZlciBtaW5kLCB0aGlzIHJvdXRpbmUgc2xl
ZXBzIGZvciBvdGhlciByZWFzb25zIGl0IHNob3VsZCBqdXN0IGJlIGFzCml0IHdhczoKCglpZiAo
IW1tdV9ub3RpZmllcl9yYW5nZV9ibG9ja2FibGUocmFuZ2UpKQoJCXJldHVybiBmYWxzZTsKCglt
dXRleF9sb2NrKCZhZGV2LT5ub3RpZmllcl9sb2NrKTsKCkphc29uCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
