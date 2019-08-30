Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 248FBA2F64
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2019 08:09:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4649D8937C;
	Fri, 30 Aug 2019 06:09:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F1DF8937C
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2019 06:08:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id BB4E030832C6;
 Fri, 30 Aug 2019 06:08:58 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-95.ams2.redhat.com
 [10.36.116.95])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6BB755C1D6;
 Fri, 30 Aug 2019 06:08:58 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id A32B317536; Fri, 30 Aug 2019 08:08:57 +0200 (CEST)
Date: Fri, 30 Aug 2019 08:08:57 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: David Riley <davidriley@chromium.org>
Subject: Re: [PATCH] drm/virtio: Use vmalloc for command buffer allocations.
Message-ID: <20190830060857.tzrzgoi2hrmchdi5@sirius.home.kraxel.org>
References: <20190829212417.257397-1-davidriley@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190829212417.257397-1-davidriley@chromium.org>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.44]); Fri, 30 Aug 2019 06:08:58 +0000 (UTC)
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Gurchetan Singh <gurchetansingh@chromium.org>,
 =?utf-8?B?U3TDqXBoYW5l?= Marchesin <marcheu@chromium.org>,
 virtualization@lists.linux-foundation.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ICBIaSwKCj4gIHsKPiAgCWlmICh2YnVmLT5yZXNwX3NpemUgPiBNQVhfSU5MSU5FX1JFU1BfU0la
RSkKPiAgCQlrZnJlZSh2YnVmLT5yZXNwX2J1Zik7Cj4gLQlrZnJlZSh2YnVmLT5kYXRhX2J1Zik7
Cj4gKwlrdmZyZWUodmJ1Zi0+ZGF0YV9idWYpOwoKaWYgKGlzX3ZtYWxsb2NfYWRkcih2YnVmLT5k
YXRhX2J1ZikpIC4uLgoKbmVlZGVkIGhlcmUgSSBndWVzPwoKPiArLyogQ3JlYXRlIHNnX3RhYmxl
IGZyb20gYSB2bWFsbG9jJ2QgYnVmZmVyLiAqLwo+ICtzdGF0aWMgc3RydWN0IHNnX3RhYmxlICp2
bWFsbG9jX3RvX3NndChjaGFyICpkYXRhLCB1aW50MzJfdCBzaXplKQoKSG1tLCBpc24ndCB0aGVy
ZSBhbiBleGlzdGluZyBmdW5jdGlvbiBmb3IgdGhhdD8KSSdkIGJlIHN1cnByaXNlZCBpZiB2aXJ0
aW8tZ3B1IGlzIHRoZSBmaXJzdCBkcml2ZXIgbmVlZGluZyB0aGlzIC4uLgoKQW5kIGl0IGNhc2Ug
dGhlcmUgcmVhbGx5IGlzbid0IG9uZSB0aGlzIHNob3VsZCBwcm9iYWJseSBhZGRlZCB0byB0aGUK
dm1hbGxvYyBvciBzY2F0dGVybGlzdCBjb2RlLCBub3QgdGhlIHZpcnRpby1ncHUgZHJpdmVyLgoK
Y2hlZXJzLAogIEdlcmQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
