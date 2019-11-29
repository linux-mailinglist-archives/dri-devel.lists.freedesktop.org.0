Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC4410D403
	for <lists+dri-devel@lfdr.de>; Fri, 29 Nov 2019 11:30:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58D966E8B3;
	Fri, 29 Nov 2019 10:30:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5703E6E8B3;
 Fri, 29 Nov 2019 10:30:18 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Nov 2019 02:30:17 -0800
X-IronPort-AV: E=Sophos;i="5.69,257,1571727600"; d="scan'208";a="384051125"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Nov 2019 02:30:14 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org
Subject: [PATCH v2 03/14] video: smscufx: don't restore fb_mmap after deferred
 IO cleanup
Date: Fri, 29 Nov 2019 12:29:33 +0200
Message-Id: <480dcc682481e6972e5648181d7e92120929ec6b.1575022735.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1575022735.git.jani.nikula@intel.com>
References: <cover.1575022735.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: jani.nikula@intel.com, Steve Glendinning <steve.glendinning@shawell.net>,
 intel-gfx@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RGVmZXJyZWQgSU8gbm93IHByZXNlcnZlcyB0aGUgZmJfb3BzLgoKQ2M6IFN0ZXZlIEdsZW5kaW5u
aW5nIDxzdGV2ZS5nbGVuZGlubmluZ0BzaGF3ZWxsLm5ldD4KQ2M6IGxpbnV4LWZiZGV2QHZnZXIu
a2VybmVsLm9yZwpSZXZpZXdlZC1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZnds
bC5jaD4KU2lnbmVkLW9mZi1ieTogSmFuaSBOaWt1bGEgPGphbmkubmlrdWxhQGludGVsLmNvbT4K
LS0tCiBkcml2ZXJzL3ZpZGVvL2ZiZGV2L3Ntc2N1ZnguYyB8IDEgLQogMSBmaWxlIGNoYW5nZWQs
IDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L3Ntc2N1Zngu
YyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvc21zY3VmeC5jCmluZGV4IDBlMGY1YmJmYzVlZi4uZTM2
MmQ3ZGE4N2ZjIDEwMDY0NAotLS0gYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L3Ntc2N1ZnguYworKysg
Yi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L3Ntc2N1ZnguYwpAQCAtMTE3MCw3ICsxMTcwLDYgQEAgc3Rh
dGljIGludCB1Znhfb3BzX3JlbGVhc2Uoc3RydWN0IGZiX2luZm8gKmluZm8sIGludCB1c2VyKQog
CQlmYl9kZWZlcnJlZF9pb19jbGVhbnVwKGluZm8pOwogCQlrZnJlZShpbmZvLT5mYmRlZmlvKTsK
IAkJaW5mby0+ZmJkZWZpbyA9IE5VTEw7Ci0JCWluZm8tPmZib3BzLT5mYl9tbWFwID0gdWZ4X29w
c19tbWFwOwogCX0KIAogCXByX2RlYnVnKCJyZWxlYXNlZCAvZGV2L2ZiJWQgdXNlcj0lZCBjb3Vu
dD0lZCIsCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
