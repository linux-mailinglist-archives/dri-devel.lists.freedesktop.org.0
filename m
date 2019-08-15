Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC018E716
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 10:39:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C011389EA3;
	Thu, 15 Aug 2019 08:39:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF0296E877
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2019 00:00:31 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id 44so592396qtg.11
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 17:00:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=uQcEycbJpYwq03WKUHr1Col8h+hbyHngyQSZBqVtuao=;
 b=qaRS5E8K6CYorOZIXqRXUmXVbNkU2QaptubIWJFot3zeeFtClmFWeN83NomrjWbWCJ
 0axb8tPQHB88YJWmckLIsGgwReRlot8GO0h172f2B0E2Ul9vF7ANUDcG9GE/12Xm692m
 6r2I3/QS1qObHtxzXANT0nvU9/42Qz1YOu+2i6QjDAbbCSxykGNAGVhySG+oO6AM0FFy
 /N2yeF27IP7rTjgwynpFu0vVA/Lx7zFd2zDGryVhXb4yLRQlwnf79pjpQYjbG87UynMz
 QaldFam0RAIy1ZL1WmtAswDWW7BpxYReDlhj5GdkHYiy1Jaq0KXjYHWPl6YY6VdhTZJJ
 0O/w==
X-Gm-Message-State: APjAAAVEgy7ctdNFZiO0oAA3Te4ZWRqUXfBD/xuO0GZ6eyu9Krug1QkK
 zY149sWw6Dz0XVS5lOqH7iKlTQ==
X-Google-Smtp-Source: APXvYqwowo9TRatjr9x+Z0wkhKzzctBv0bQD6WAaHI7YUR2Bla8hl5jGs4NuJx4xbIBRiBZ2H9DzbA==
X-Received: by 2002:ac8:5315:: with SMTP id t21mr1735710qtn.66.1565827231022; 
 Wed, 14 Aug 2019 17:00:31 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id u126sm637456qkf.132.2019.08.14.17.00.30
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 14 Aug 2019 17:00:30 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hy3Bt-0003UN-MJ; Wed, 14 Aug 2019 21:00:29 -0300
Date: Wed, 14 Aug 2019 21:00:29 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 3/5] mm, notifier: Catch sleeping/blocking for !blockable
Message-ID: <20190815000029.GC11200@ziepe.ca>
References: <20190814202027.18735-1-daniel.vetter@ffwll.ch>
 <20190814202027.18735-4-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190814202027.18735-4-daniel.vetter@ffwll.ch>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Thu, 15 Aug 2019 08:34:58 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=uQcEycbJpYwq03WKUHr1Col8h+hbyHngyQSZBqVtuao=;
 b=WqnDtaZOeGzmOCMQPC4We4PRD3RuiO/IALjyCYVZuuWQ7X8TuNS1arQXC7EG5H/WMM
 QoTLuRO+le+M6rRKQ+g/kpY4oRBlm26psPwlaph+NfO/QHkvqy5y7xLVn5asu5icHcX8
 4+cgO8/3DW0QOxaqqU3N1R3jkqcGn2CA/nu/llYZ7KTrYBM7rhgO5bNv15Mwl/qhHkFr
 xLgkDtM4ecYPJZGJaT+5ygz3Mtzt1oLeN40DNq1h3PCmx2kj0py9uxQtJ3zyBZMMMiMa
 2sMtpruVKWC3ihvALp2SoFVQLWI2B85dMUSqBzp9DgYpURT4u2F3Usbhyj4KoRDhvXLf
 XwZA==
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
Cc: Michal Hocko <mhocko@suse.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>, linux-mm@kvack.org,
 =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
 David Rientjes <rientjes@google.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBBdWcgMTQsIDIwMTkgYXQgMTA6MjA6MjVQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBXZSBuZWVkIHRvIG1ha2Ugc3VyZSBpbXBsZW1lbnRhdGlvbnMgZG9uJ3QgY2hlYXQg
YW5kIGRvbid0IGhhdmUgYQo+IHBvc3NpYmxlIHNjaGVkdWxlL2Jsb2NraW5nIHBvaW50IGRlZXBs
eSBidXJyaWVkIHdoZXJlIHJldmlldyBjYW4ndAo+IGNhdGNoIGl0Lgo+IAo+IEknbSBub3Qgc3Vy
ZSB3aGV0aGVyIHRoaXMgaXMgdGhlIGJlc3Qgd2F5IHRvIG1ha2Ugc3VyZSBhbGwgdGhlCj4gbWln
aHRfc2xlZXAoKSBjYWxsc2l0ZXMgdHJpZ2dlciwgYW5kIGl0J3MgYSBiaXQgdWdseSBpbiB0aGUg
Y29kZSBmbG93Lgo+IEJ1dCBpdCBnZXRzIHRoZSBqb2IgZG9uZS4KPiAKPiBJbnNwaXJlZCBieSBh
biBpOTE1IHBhdGNoIHNlcmllcyB3aGljaCBkaWQgZXhhY3RseSB0aGF0LCBiZWNhdXNlIHRoZQo+
IHJ1bGVzIGhhdmVuJ3QgYmVlbiBlbnRpcmVseSBjbGVhciB0byB1cy4KCkkgdGhvdWdodCBsb2Nr
ZGVwIGFscmVhZHkgd2FzIGFibGUgdG8gZGV0ZWN0OgoKIHNwaW5fbG9jaygpCiBtaWdodF9zbGVl
cCgpOwogc3Bpbl91bmxvY2soKQoKQW0gSSBtaXN0YWtlbj8gSWYgeWVzLCBjb3VsZG4ndCB0aGlz
IHBhdGNoIGp1c3QgaW5qZWN0IGEgZHVtbXkgbG9ja2RlcApzcGlubG9jaz8KCkphc29uCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
