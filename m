Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F77FAB7E
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2019 08:56:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EB536EC35;
	Wed, 13 Nov 2019 07:56:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 531396E51C
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 20:38:04 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id 15so15731800qkh.6
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 12:38:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=GMi4xT2UOd2CFR3VJjVGTgOG1WxBYR/HDNQyyBU/zGM=;
 b=Sg59OgbRodRVgrywohXvY0Muu8Rx2qc6MyHxkF8q9IOovJ5gnAXMrRB1qppqNnSSEp
 oyQIDnXjegS0/bM1RER1BBtckyOHovzv4Oqz9yU2Tzvms7Z8jPBf+z3vkhah/shF/5kp
 /ucpBoZ76+FyfjcK4TavD1WWGou3GaCtRgtv8PdQevBpOnYl6PMKDyoaBheWwdukmym/
 FMzdsyVraLqV+46J8glQxyvNd1dvNzQbsf46ZiSJ8Mn6fMsgIXWEVvJSBBMQIYdirMA3
 5vRzDtBAwC42Hg7F1OCZE9aDVPQWQBHqs1tfkgZ4m3gF2jt3BaBMVIX2fOye3PDNZkAN
 yn8w==
X-Gm-Message-State: APjAAAViMgUod6CB/ice2W7qi1B77ObKk6edElwJEq3dHWmqs4HedIfV
 6Qk6bKzBTZs6Q4dKpCA5nWa0TQ==
X-Google-Smtp-Source: APXvYqwLkTug1hfsKRZbiUckKPR5+bmE3pOvHeIup8u/vHZbKyWy6tiIbngDLXx22jZap3IUKn0tSg==
X-Received: by 2002:a37:dc44:: with SMTP id v65mr7289252qki.72.1573591083419; 
 Tue, 12 Nov 2019 12:38:03 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-162-113-180.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.113.180])
 by smtp.gmail.com with ESMTPSA id k40sm11983680qta.76.2019.11.12.12.38.02
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 12 Nov 2019 12:38:02 -0800 (PST)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1iUcvK-00043t-G4; Tue, 12 Nov 2019 16:38:02 -0400
Date: Tue, 12 Nov 2019 16:38:02 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH v3 00/23] mm/gup: track dma-pinned pages: FOLL_PIN,
 FOLL_LONGTERM
Message-ID: <20191112203802.GD5584@ziepe.ca>
References: <20191112000700.3455038-1-jhubbard@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191112000700.3455038-1-jhubbard@nvidia.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Wed, 13 Nov 2019 07:55:45 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=GMi4xT2UOd2CFR3VJjVGTgOG1WxBYR/HDNQyyBU/zGM=;
 b=j3NNIjPO3cADqvZd/hJQbIxM+DDhVRAEGcC+3T6+Q3fhxmcfREpCirlLaEIJBZkEdd
 e3aBqytbSt/O1y6azCg5mzciQb9aXN7nl404GgQzXcRXFb+31Gp+DUUM20vq+CBmnlhO
 OI6Itn853T6kP0jxgCe/92EYcvYqEI5wpO6FG/uJe2R9DweqI3FnTjwOvYkLmRQ3s4Xc
 zG96fPghzfwVyKWk9G5BMiBAMZoSIJhIZiNOrjmRw2PjfIwZlx+LuvDRDWa51OzyNGdk
 7PnZkzKlvewWQFyt2QF7slB5Swx6CEiwuOCbZxYFCsytkVXhCWtpdK2fshpP/jsmV8fx
 ZjTQ==
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
 Jonathan Corbet <corbet@lwn.net>, linux-rdma@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>, Christoph Hellwig <hch@infradead.org>,
 Vlastimil Babka <vbabka@suse.cz>,
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

T24gTW9uLCBOb3YgMTEsIDIwMTkgYXQgMDQ6MDY6MzdQTSAtMDgwMCwgSm9obiBIdWJiYXJkIHdy
b3RlOgo+IEhpLAo+IAo+IFRoZSBjb3ZlciBsZXR0ZXIgaXMgbG9uZywgc28gdGhlIG1vcmUgaW1w
b3J0YW50IHN0dWZmIGlzIGZpcnN0Ogo+IAo+ICogSmFzb24sIGlmIHlvdSBvciBzb21lb25lIGNv
dWxkIGxvb2sgYXQgdGhlIHRoZSBWRklPIGNsZWFudXAgKHBhdGNoIDgpCj4gICBhbmQgY29udmVy
c2lvbiB0byBGT0xMX1BJTiAocGF0Y2ggMTgpLCB0byBtYWtlIHN1cmUgaXQncyB1c2Ugb2YKPiAg
IHJlbW90ZSBhbmQgbG9uZ3Rlcm0gZ3VwIG1hdGNoZXMgd2hhdCB3ZSBkaXNjdXNzZWQgZHVyaW5n
IHRoZSByZXZpZXcKPiAgIG9mIHYyLCBJJ2QgYXBwcmVjaWF0ZSBpdC4KPiAKPiAqIEFsc28gZm9y
IEphc29uIGFuZCBJQjogYXMgbm90ZWQgYmVsb3csIGluIHBhdGNoIDExLCBJIGFtICh0b28/KSBi
b2xkbHkKPiAgIGNvbnZlcnRpbmcgZnJvbSBwdXRfdXNlcl9wYWdlcygpIHRvIHJlbGVhc2VfcGFn
ZXMoKS4KCldoeSBhcmUgd2UgZG9pbmcgdGhpcz8gSSB0aGluayB0aGluZ3MgZ290IGNvbmZ1c2Vk
IGhlcmUgc29tZXBsYWNlLCBhcwp0aGUgY29tbWVudCBzdGlsbCBzYXlzOgoKLyoqCiAqIHB1dF91
c2VyX3BhZ2UoKSAtIHJlbGVhc2UgYSBndXAtcGlubmVkIHBhZ2UKICogQHBhZ2U6ICAgICAgICAg
ICAgcG9pbnRlciB0byBwYWdlIHRvIGJlIHJlbGVhc2VkCiAqCiAqIFBhZ2VzIHRoYXQgd2VyZSBw
aW5uZWQgdmlhIGdldF91c2VyX3BhZ2VzKigpIG11c3QgYmUgcmVsZWFzZWQgdmlhCiAqIGVpdGhl
ciBwdXRfdXNlcl9wYWdlKCksIG9yIG9uZSBvZiB0aGUgcHV0X3VzZXJfcGFnZXMqKCkgcm91dGlu
ZXMKICogYmVsb3cuCgpJIGZlZWwgbGlrZSBpZiBwdXRfdXNlcl9wYWdlcygpIGlzIG5vdCB0aGUg
Y29ycmVjdCB3YXkgdG8gdW5kbwpnZXRfdXNlcl9wYWdlcygpIHRoZW4gaXQgbmVlZHMgdG8gYmUg
ZGVsZXRlZC4KCkphc29uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
