Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35BFC29C47
	for <lists+dri-devel@lfdr.de>; Fri, 24 May 2019 18:30:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57CFF6E123;
	Fri, 24 May 2019 16:30:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26F646E120;
 Fri, 24 May 2019 16:30:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 8D8EBC062ECD;
 Fri, 24 May 2019 16:30:27 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-112-47.ams2.redhat.com
 [10.36.112.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 632D160610;
 Fri, 24 May 2019 16:30:23 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Daniel Vetter <daniel.vetter@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [[PATCH 0/4] drm/i915/dsi: Read back pclk set by GOP and use that as
 pclk (version 3)
Date: Fri, 24 May 2019 18:30:16 +0200
Message-Id: <20190524163020.17099-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.31]); Fri, 24 May 2019 16:30:32 +0000 (UTC)
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
Cc: Hans de Goede <hdegoede@redhat.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQWxsLAoKVGhpcyBpcyBhIHJlc2VuZCBvZiBteSAzdGggYXR0ZW1wdCB0byBmaXggdGhlIHBj
bGsgd2UgY2FsY3VsYXRlIGZvcgpEU0kgcGFuZWxzIGFuZCB0aGUgcGNsayB3aGljaCB0aGUgR09Q
IGhhcyBjb25maWd1cmVkLCBjYXVzaW5nIGZhc3Rib290CnRvIG5vdCB3b3JrLgoKQXMgcmVxdWVz
dGVkIGluIHRoZSByZXZpZXcgb2YgZWFybGllciB2ZXJzaW9ucywgdGhpcyB2ZXJzaW9uIG1vdmVz
IHRoZQpvdmVycmlkaW5nIG9mIHRoZSBwY2xrIG91dCBvZiBpbnRlbF9kc2lfdmJ0LmMgYW5kIGlu
dG8gdmx2X2RzaS5jLgoKVGhpcyBzZXJpZXMgd2FzIGZpcnN0IHBvc3RlZCBpbiBEZWNlbWJlciAy
MDE4LCBidXQgaGFzIGdvdHRlbiAwIGNvbW1lbnRzLgoKVGhpcyByZXNlbmQgaXMgcmViYXNlZCBv
biB0b3Agb2YgNC4xMi1yYzEgYW5kIGFwcGxpZXMgY2xlYW5seSB0byB0aGUKY3VycmVudCBkcm0t
dGlwLgoKUmVnYXJkcywKCkhhbnMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
