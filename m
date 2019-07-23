Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BA8E712A1
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2019 09:16:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F27F6E160;
	Tue, 23 Jul 2019 07:16:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D45C4890B9
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2019 06:14:21 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id l21so18865277pgm.3
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 23:14:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vuhDAdrwQAvGhhF1l4sTnH2/cYgn8v3uFIkNwLOWcSI=;
 b=gHHcdL9kVufmlMSsWUsZEOSouCZa3Fm3QvB666JLGzS+TsK8GxkdbCYcS4LRHHXs9D
 mSGG8DT++Pkl5KrNMtatQd5Q6FyyeaihZvPDw8TACVbALsMaSe72PQnisNr9vmo57zJ5
 l1gRrS9MsXwF0TXyEexkLyV15miA7nQzuAoVKuB/0mlFoCYCDyNhZkRp/xWcU/J27FAE
 3qExj+OdVe6ZSZr7VynN4hzcZN6whh+yRviy8jcmAX3VQtEXaX+0fYKxmZC+4mM2C8+w
 /J1N76Pk9gf1prVidxl97qCyqaf98XUhnEaKkU8LfaBEZsqNYUWw6VlrQmKHf5xK3QKn
 qmIQ==
X-Gm-Message-State: APjAAAXfJcKiQ7e+mdgdDUB8abcRXutFr6B5y7FQaR75glaK26MguStt
 kT9IqhjOhN9wqvOzlD8blhgjDg==
X-Google-Smtp-Source: APXvYqxP6bnPVRQ1MCBwzGR7VTcX3M/ry8bfvkqazsDReUg7h0RInIBa5NIHj45OVf4NXWgl6klj/w==
X-Received: by 2002:a63:c106:: with SMTP id w6mr75584400pgf.422.1563862461180; 
 Mon, 22 Jul 2019 23:14:21 -0700 (PDT)
Received: from localhost ([122.172.28.117])
 by smtp.gmail.com with ESMTPSA id o95sm36186558pjb.4.2019.07.22.23.14.19
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 22 Jul 2019 23:14:19 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Rafael Wysocki <rjw@rjwysocki.net>,
 Amit Daniel Kachhap <amit.kachhap@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Eduardo Valentin <edubezval@gmail.com>,
 Erik Schmauss <erik.schmauss@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Javi Merino <javi.merino@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Len Brown <lenb@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Robert Moore <robert.moore@intel.com>,
 Viresh Kumar <viresh.kumar@linaro.org>, Zhang Rui <rui.zhang@intel.com>
Subject: [PATCH V2 00/10] cpufreq: Migrate users of policy notifiers to QoS
 requests
Date: Tue, 23 Jul 2019 11:44:00 +0530
Message-Id: <cover.1563862014.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.21.0.rc0.269.g1a574e7a288b
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 23 Jul 2019 07:14:10 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vuhDAdrwQAvGhhF1l4sTnH2/cYgn8v3uFIkNwLOWcSI=;
 b=GLW0xIF/ikmhDxxaWkwedXQ3YAtiEnzbtfMJ9HikV4tL95rqEh2fkcB6NkefS0TByU
 +QQ1hhPN/eokT2aVxg0eTyR+90qMUvCEVt61eF45mxKmxYTxyaL9RYps9BAZTMO/3cDb
 9C4NZ3uhWr2iKuhcCIrARd0ii+fMDfM0DIeWksAUC6ORyiERFbDn1C2vq8S/hkwYbIHB
 g/xyhH2PR0cFm9DdI53v5Y67tYeflXFdxVK6L0Q8ZnqYVmdDUpOGII7k1z1MNqs5JNRA
 OPWC2yrAd7K4gFy5nbRUzC6OGpMxbNPocvSPv+RbcxEN1BWEsoCoEgPiI4t0kVS5DIyX
 10dw==
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
Cc: linux-fbdev@vger.kernel.org, Vincent Guittot <vincent.guittot@linaro.org>,
 linux-doc@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-acpi@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, devel@acpica.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGVsbG8sCgpOb3cgdGhhdCBjcHVmcmVxIGNvcmUgc3VwcG9ydHMgdGFraW5nIFFvUyByZXF1ZXN0
cyBmb3IgbWluL21heCBjcHUKZnJlcXVlbmNpZXMsIGxldHMgbWlncmF0ZSByZXN0IG9mIHRoZSB1
c2VycyB0byB1c2luZyB0aGVtIGluc3RlYWQgb2YgdGhlCnBvbGljeSBub3RpZmllcnMuCgpUaGUg
Q1BVRlJFUV9OT1RJRlkgYW5kIENQVUZSRVFfQURKVVNUIGV2ZW50cyBvZiB0aGUgcG9saWN5IG5v
dGlmaWVycyBhcmUKcmVtb3ZlZCBhcyBhIHJlc3VsdCwgYnV0IHdlIGhhdmUgdG8gYWRkIENQVUZS
RVFfQ1JFQVRFX1BPTElDWSBhbmQKQ1BVRlJFUV9SRU1PVkVfUE9MSUNZIGV2ZW50cyB0byBpdCBm
b3IgdGhlIGFjcGkgc3R1ZmYgc3BlY2lmaWNhbGx5LAp0aG91Z2ggdGhleSBhcmUgYWxzbyB1c2Vk
IGJ5IGFyY2hfdG9wb2xvZ3kgc3R1ZmYgbm93LiBTbyB0aGUgcG9saWN5Cm5vdGlmaWVycyBhcmVu
J3QgY29tcGxldGVseSByZW1vdmVkLgoKQm9vdCB0ZXN0ZWQgb24gbXkgeDg2IFBDIGFuZCBBUk0g
aGlrZXkgYm9hcmQuCgpUaGlzIGhhcyBhbHJlYWR5IGdvbmUgdGhyb3VnaCBidWlsZCBib3QgZm9y
IGEgZmV3IGRheXMgbm93LgoKVjEtPlYyOgotIEFkZGVkIEFja2VkLWJ5IHRhZ3MKLSBSZW9yZGVy
ZWQgdG8ga2VlcCBjbGVhbnVwcyBhdCB0aGUgYm90dG9tCi0gUmViYXNlZCBvdmVyIDUuMy1yYzEK
Ci0tCnZpcmVzaAoKVmlyZXNoIEt1bWFyICgxMCk6CiAgY3B1ZnJlcTogQWRkIHBvbGljeSBjcmVh
dGUvcmVtb3ZlIG5vdGlmaWVycwogIHRoZXJtYWw6IGNwdV9jb29saW5nOiBTd2l0Y2ggdG8gUW9T
IHJlcXVlc3RzIGluc3RlYWQgb2YgY3B1ZnJlcQogICAgbm90aWZpZXIKICBwb3dlcnBjOiBtYWNp
bnRvc2g6IFN3aXRjaCB0byBRb1MgcmVxdWVzdHMgaW5zdGVhZCBvZiBjcHVmcmVxIG5vdGlmaWVy
CiAgY3B1ZnJlcTogcG93ZXJwY19jYmU6IFN3aXRjaCB0byBRb1MgcmVxdWVzdHMgaW5zdGVhZCBv
ZiBjcHVmcmVxCiAgICBub3RpZmllcgogIEFDUEk6IGNwdWZyZXE6IFN3aXRjaCB0byBRb1MgcmVx
dWVzdHMgaW5zdGVhZCBvZiBjcHVmcmVxIG5vdGlmaWVyCiAgYXJjaF90b3BvbG9neTogVXNlIENQ
VUZSRVFfQ1JFQVRFX1BPTElDWSBpbnN0ZWFkIG9mIENQVUZSRVFfTk9USUZZCiAgdmlkZW86IHNh
MTEwMGZiOiBSZW1vdmUgY3B1ZnJlcSBwb2xpY3kgbm90aWZpZXIKICB2aWRlbzogcHhhZmI6IFJl
bW92ZSBjcHVmcmVxIHBvbGljeSBub3RpZmllcgogIGNwdWZyZXE6IFJlbW92ZSBDUFVGUkVRX0FE
SlVTVCBhbmQgQ1BVRlJFUV9OT1RJRlkgcG9saWN5IG5vdGlmaWVyCiAgICBldmVudHMKICBEb2N1
bWVudGF0aW9uOiBjcHVmcmVxOiBVcGRhdGUgcG9saWN5IG5vdGlmaWVyIGRvY3VtZW50YXRpb24K
CiBEb2N1bWVudGF0aW9uL2NwdS1mcmVxL2NvcmUudHh0ICAgICAgICAgICAgfCAgMTYgKy0tCiBk
cml2ZXJzL2FjcGkvcHJvY2Vzc29yX2RyaXZlci5jICAgICAgICAgICAgfCAgNDQgKysrKysrKyst
CiBkcml2ZXJzL2FjcGkvcHJvY2Vzc29yX3BlcmZsaWIuYyAgICAgICAgICAgfCAxMDYgKysrKysr
KysrLS0tLS0tLS0tLS0KIGRyaXZlcnMvYWNwaS9wcm9jZXNzb3JfdGhlcm1hbC5jICAgICAgICAg
ICB8ICA4MSArKysrKysrKy0tLS0tLS0KIGRyaXZlcnMvYmFzZS9hcmNoX3RvcG9sb2d5LmMgICAg
ICAgICAgICAgICB8ICAgMiArLQogZHJpdmVycy9jcHVmcmVxL2NwdWZyZXEuYyAgICAgICAgICAg
ICAgICAgIHwgIDUxICsrKystLS0tLS0KIGRyaXZlcnMvY3B1ZnJlcS9wcGNfY2JlX2NwdWZyZXEu
YyAgICAgICAgICB8ICAxOSArKystCiBkcml2ZXJzL2NwdWZyZXEvcHBjX2NiZV9jcHVmcmVxLmgg
ICAgICAgICAgfCAgIDggKysKIGRyaXZlcnMvY3B1ZnJlcS9wcGNfY2JlX2NwdWZyZXFfcG1pLmMg
ICAgICB8ICA5NiArKysrKysrKysrKy0tLS0tLS0KIGRyaXZlcnMvbWFjaW50b3NoL3dpbmRmYXJt
X2NwdWZyZXFfY2xhbXAuYyB8ICA3NyArKysrKysrKysrLS0tLS0KIGRyaXZlcnMvdGhlcm1hbC9j
cHVfY29vbGluZy5jICAgICAgICAgICAgICB8IDExMCArKysrKy0tLS0tLS0tLS0tLS0tLS0KIGRy
aXZlcnMvdmlkZW8vZmJkZXYvcHhhZmIuYyAgICAgICAgICAgICAgICB8ICAyMSAtLS0tCiBkcml2
ZXJzL3ZpZGVvL2ZiZGV2L3B4YWZiLmggICAgICAgICAgICAgICAgfCAgIDEgLQogZHJpdmVycy92
aWRlby9mYmRldi9zYTExMDBmYi5jICAgICAgICAgICAgIHwgIDI3IC0tLS0tCiBkcml2ZXJzL3Zp
ZGVvL2ZiZGV2L3NhMTEwMGZiLmggICAgICAgICAgICAgfCAgIDEgLQogaW5jbHVkZS9hY3BpL3By
b2Nlc3Nvci5oICAgICAgICAgICAgICAgICAgIHwgIDIyICsrKy0tCiBpbmNsdWRlL2xpbnV4L2Nw
dWZyZXEuaCAgICAgICAgICAgICAgICAgICAgfCAgIDQgKy0KIDE3IGZpbGVzIGNoYW5nZWQsIDMy
NyBpbnNlcnRpb25zKCspLCAzNTkgZGVsZXRpb25zKC0pCgotLSAKMi4yMS4wLnJjMC4yNjkuZzFh
NTc0ZTdhMjg4YgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
