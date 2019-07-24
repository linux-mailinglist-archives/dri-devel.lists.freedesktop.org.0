Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3492A74821
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2019 09:30:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B14226E66E;
	Thu, 25 Jul 2019 07:29:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CF606E640
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 19:25:06 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id s145so34625598qke.7
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 12:25:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=OkPU/CLyukMOj3ZbNY/O7tpHR8CxfiQ425Gxa1fb2JQ=;
 b=uH9nCuZw4Jnrc0so4ysuWMLgwX7dq6SI5WO7yHaOVS47eiIYMLOCVFqH9zxYuKbGoZ
 H+KLvPsXR/4mBk0b4K94UNPRNVvPitiz8h2kV2rjahIpjKa65QD0dpzX9vjWwsSdot1Q
 Ho+EfhC0V5sTuS2hHx0H54W8JmUAno6tnE5ATOLVNACyr3QWZ8B1HN6YyTNsyeGpYHoh
 E3xtT7PRAAfERZO0shdMWAfsGBIwtM2RpWpPkVbchPEhuFWaSlTWUkzF6z14GUJMnv3j
 pQy1SB3nbdMw7dtlIDfkp8/f7Y9WoUQ+EKckf+EHVJ6dvhvTMYyixzfd+S9TNrgHrVTI
 Mycg==
X-Gm-Message-State: APjAAAX09sJdraqRsxf8Aljp6i80OAL+4MAo9JqfakN/VXsidBncu5CC
 yYmTNkBlDATfbUx4Qcma5vGMaw==
X-Google-Smtp-Source: APXvYqyhflls5Pd07xc/KaSNWazAfdY/U63489DoRwgjjWJQqGNW++Rr6B+pQE207tw0i/3votp85A==
X-Received: by 2002:a05:620a:1f4:: with SMTP id
 x20mr56790548qkn.415.1563996305707; 
 Wed, 24 Jul 2019 12:25:05 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id r40sm29245885qtk.2.2019.07.24.12.25.05
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 24 Jul 2019 12:25:05 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hqMsq-0001Uo-Fh; Wed, 24 Jul 2019 16:25:04 -0300
Date: Wed, 24 Jul 2019 16:25:04 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Andrey Konovalov <andreyknvl@google.com>
Subject: Re: [PATCH v19 11/15] IB/mlx4: untag user pointers in mlx4_get_umem_mr
Message-ID: <20190724192504.GA5716@ziepe.ca>
References: <cover.1563904656.git.andreyknvl@google.com>
 <7969018013a67ddbbf784ac7afeea5a57b1e2bcb.1563904656.git.andreyknvl@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7969018013a67ddbbf784ac7afeea5a57b1e2bcb.1563904656.git.andreyknvl@google.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Thu, 25 Jul 2019 07:29:33 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=OkPU/CLyukMOj3ZbNY/O7tpHR8CxfiQ425Gxa1fb2JQ=;
 b=cizJvBvS9LWtQgqD7tHrOnbfUKLn3IKwTexaKlCz0aV8WGl+nqxYE5pseR5xXgl2ZJ
 m8csupMpr7OwAKhyoW9lBHKDfnN0nYwK9z7/RsX4VX3pqa9PWl3XI5/GUR4dWGbBS/2X
 l7xDDDeEor3Zjue37hzwItxKtPGOFgmLJ5n/YPHgvOS+Y7TaohrswgfdoQ2xx5ljLnn5
 gCACdxiqqXuMTz9u7PVtheBQ9dr7K2gpEpuVehHqwNFqED9VeiqZrebhSMSMl/zhVVtH
 139CJQm906dlJU9cmPZyBRd9LIjBH6vCpXIBSECVQGTTiiTBHHUCo4qXoOTM7WaE9BBS
 G4Sg==
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
Cc: Mark Rutland <mark.rutland@arm.com>, kvm@vger.kernel.org,
 Szabolcs Nagy <Szabolcs.Nagy@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Khalid Aziz <khalid.aziz@oracle.com>, linux-kselftest@vger.kernel.org,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Jacob Bramley <Jacob.Bramley@arm.com>, Leon Romanovsky <leon@kernel.org>,
 linux-rdma@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@infradead.org>, Dmitry Vyukov <dvyukov@google.com>,
 Dave Martin <Dave.Martin@arm.com>, Evgeniy Stepanov <eugenis@google.com>,
 linux-media@vger.kernel.org, Kevin Brodsky <kevin.brodsky@arm.com>,
 Kees Cook <keescook@chromium.org>, Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
 Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Kostya Serebryany <kcc@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yishai Hadas <yishaih@mellanox.com>, linux-kernel@vger.kernel.org,
 Jens Wiklander <jens.wiklander@linaro.org>, Lee Smith <Lee.Smith@arm.com>,
 Alexander Deucher <Alexander.Deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, enh <enh@google.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Christian Koenig <Christian.Koenig@amd.com>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdWwgMjMsIDIwMTkgYXQgMDc6NTg6NDhQTSArMDIwMCwgQW5kcmV5IEtvbm92YWxv
diB3cm90ZToKPiBUaGlzIHBhdGNoIGlzIGEgcGFydCBvZiBhIHNlcmllcyB0aGF0IGV4dGVuZHMg
a2VybmVsIEFCSSB0byBhbGxvdyB0byBwYXNzCj4gdGFnZ2VkIHVzZXIgcG9pbnRlcnMgKHdpdGgg
dGhlIHRvcCBieXRlIHNldCB0byBzb21ldGhpbmcgZWxzZSBvdGhlciB0aGFuCj4gMHgwMCkgYXMg
c3lzY2FsbCBhcmd1bWVudHMuCj4gCj4gbWx4NF9nZXRfdW1lbV9tcigpIHVzZXMgcHJvdmlkZWQg
dXNlciBwb2ludGVycyBmb3Igdm1hIGxvb2t1cHMsIHdoaWNoIGNhbgo+IG9ubHkgYnkgZG9uZSB3
aXRoIHVudGFnZ2VkIHBvaW50ZXJzLgo+IAo+IFVudGFnIHVzZXIgcG9pbnRlcnMgaW4gdGhpcyBm
dW5jdGlvbi4KPiAKPiBSZXZpZXdlZC1ieTogSmFzb24gR3VudGhvcnBlIDxqZ2dAbWVsbGFub3gu
Y29tPgo+IEFja2VkLWJ5OiBDYXRhbGluIE1hcmluYXMgPGNhdGFsaW4ubWFyaW5hc0Bhcm0uY29t
Pgo+IFJldmlld2VkLWJ5OiBLZWVzIENvb2sgPGtlZXNjb29rQGNocm9taXVtLm9yZz4KPiBTaWdu
ZWQtb2ZmLWJ5OiBBbmRyZXkgS29ub3ZhbG92IDxhbmRyZXlrbnZsQGdvb2dsZS5jb20+Cj4gLS0t
Cj4gIGRyaXZlcnMvaW5maW5pYmFuZC9ody9tbHg0L21yLmMgfCA3ICsrKystLS0KPiAgMSBmaWxl
IGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCkFwcGxpZWQgdG8gcmRt
YS1mb3IgbmV4dCwgcGxlYXNlIGRvbid0IHNlbnQgaXQgdmlhIG90aGVyIHRyZWVzIDopCgpUaGFu
a3MsCkphc29uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
