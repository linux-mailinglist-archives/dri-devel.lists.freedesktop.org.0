Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 55E9A6B73D
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jul 2019 09:09:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 021FA6E271;
	Wed, 17 Jul 2019 07:08:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7685389E4C
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2019 09:49:24 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id q10so8842041pff.9
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2019 02:49:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vOxxYg1gkl1a/ysoqs6BZ37K9CF/kS15FrSEdYGMrcE=;
 b=LRBB58MIJADRLb1jVQrXkJJIVfZakOzfH8GOOkXXfbJd5DEWKgauyOc5bL7dPpZsJI
 /vs29uY+p6p8hY0L1dRghB/Agm/qSUXj+SO9gqiipLZUVNeP/g1++4t+uoZh0Lcw0zpW
 ajAGULLUaaiw+x1QUV1wGR4oLieW3rztv6lxrx3YN2X1kmKyL8IN04u4ZAaRC/fuQJ58
 rGrqqrYgIcpe4yFCffIhCpFPRw8Zs3KID1Rf6ENU4RaKsXaVc/ruZysyUMNfFXU1xEw6
 dD0banek3IHAKFlDVAFpAqA7yWGbr/4utSRJkiGJLpUkgZOGaanyaouftNTVNOeXDhIg
 2OFw==
X-Gm-Message-State: APjAAAVJrPQiNXgB5aWI6LSBysrNI1yggbOpmQPusc2jpacnWT2Ae//V
 wKjRJtSAuYuZ2tgRcmoATVVk4Q==
X-Google-Smtp-Source: APXvYqw5SKHgwSs1ZhYtTM+f2bW5/Eb88H6yQX28Ko/X85JMot8sov7jCBSAQXBcHVwxNzo9et7lnA==
X-Received: by 2002:a65:4189:: with SMTP id a9mr7021968pgq.399.1563270563855; 
 Tue, 16 Jul 2019 02:49:23 -0700 (PDT)
Received: from localhost ([122.172.28.117])
 by smtp.gmail.com with ESMTPSA id c69sm22793150pje.6.2019.07.16.02.49.22
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 16 Jul 2019 02:49:23 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Rafael Wysocki <rjw@rjwysocki.net>,
 Amit Daniel Kachhap <amit.kachhap@gmail.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Eduardo Valentin <edubezval@gmail.com>,
 Erik Schmauss <erik.schmauss@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Javi Merino <javi.merino@kernel.org>, Len Brown <lenb@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Robert Moore <robert.moore@intel.com>, Zhang Rui <rui.zhang@intel.com>
Subject: [PATCH 00/10] cpufreq: Migrate users of policy notifiers to QoS
 requests
Date: Tue, 16 Jul 2019 15:18:56 +0530
Message-Id: <cover.1563269894.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.21.0.rc0.269.g1a574e7a288b
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 17 Jul 2019 07:08:01 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vOxxYg1gkl1a/ysoqs6BZ37K9CF/kS15FrSEdYGMrcE=;
 b=EpO9lcJJCleKXGgnbBcmT0vu4HaYAgr9cMkeEXTp7CyyD4yV+yFnl1mxqPgDrOOQFv
 uX4IGgyhvlC0Ycx0OgWkLzAlykS9IJaLFR2yukDVSE+KIOS23muUiLalQLQa03Wse+/Y
 FIaNNN0uwHO6LUKp+rICHDSjzUm8mrleslaGLlOHrsYK0tU9PucY0BVtOnLOBG1WYHJT
 Y41fadi2cSZHeYEnTHQY9LiafFF2DeAdHLwZ6m+FmkVnzFZMM3swsG+hfik7+0CzsULk
 CfxvI0eWRu5hr0QvUkVSUcvOiO4XnmJcvSFY/IXMPQ2Dp5U1QyJgJ6fT0ADilqS/soWL
 b0iw==
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
 linux-pm@vger.kernel.org, Viresh Kumar <viresh.kumar@linaro.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-acpi@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, devel@acpica.org
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
b3IgdGhlIGFjcGkgc3R1ZmYgc3BlY2lmaWNhbGx5LiBTbwp0aGUgcG9saWN5IG5vdGlmaWVycyBh
cmVuJ3QgY29tcGxldGVseSByZW1vdmVkLgoKQm9vdCB0ZXN0ZWQgb24gbXkgeDg2IFBDIGFuZCBB
Uk0gaGlrZXkgYm9hcmQuIE5vdGhpbmcgbG9va2VkIGJyb2tlbiA6KQoKVGhpcyBoYXMgYWxyZWFk
eSBnb25lIHRocm91Z2ggYnVpbGQgYm90IGZvciBhIGZldyBkYXlzIG5vdy4KCi0tCnZpcmVzaAoK
VmlyZXNoIEt1bWFyICgxMCk6CiAgY3B1ZnJlcTogQWRkIHBvbGljeSBjcmVhdGUvcmVtb3ZlIG5v
dGlmaWVycwogIHZpZGVvOiBzYTExMDBmYjogUmVtb3ZlIGNwdWZyZXEgcG9saWN5IG5vdGlmaWVy
CiAgdmlkZW86IHB4YWZiOiBSZW1vdmUgY3B1ZnJlcSBwb2xpY3kgbm90aWZpZXIKICBhcmNoX3Rv
cG9sb2d5OiBVc2UgQ1BVRlJFUV9DUkVBVEVfUE9MSUNZIGluc3RlYWQgb2YgQ1BVRlJFUV9OT1RJ
RlkKICB0aGVybWFsOiBjcHVfY29vbGluZzogU3dpdGNoIHRvIFFvUyByZXF1ZXN0cyBpbnN0ZWFk
IG9mIGNwdWZyZXEKICAgIG5vdGlmaWVyCiAgcG93ZXJwYzogbWFjaW50b3NoOiBTd2l0Y2ggdG8g
UW9TIHJlcXVlc3RzIGluc3RlYWQgb2YgY3B1ZnJlcSBub3RpZmllcgogIGNwdWZyZXE6IHBvd2Vy
cGNfY2JlOiBTd2l0Y2ggdG8gUW9TIHJlcXVlc3RzIGluc3RlYWQgb2YgY3B1ZnJlcQogICAgbm90
aWZpZXIKICBBQ1BJOiBjcHVmcmVxOiBTd2l0Y2ggdG8gUW9TIHJlcXVlc3RzIGluc3RlYWQgb2Yg
Y3B1ZnJlcSBub3RpZmllcgogIGNwdWZyZXE6IFJlbW92ZSBDUFVGUkVRX0FESlVTVCBhbmQgQ1BV
RlJFUV9OT1RJRlkgcG9saWN5IG5vdGlmaWVyCiAgICBldmVudHMKICBEb2N1bWVudGF0aW9uOiBj
cHVmcmVxOiBVcGRhdGUgcG9saWN5IG5vdGlmaWVyIGRvY3VtZW50YXRpb24KCiBEb2N1bWVudGF0
aW9uL2NwdS1mcmVxL2NvcmUudHh0ICAgICAgICAgICAgfCAgMTYgKy0tCiBkcml2ZXJzL2FjcGkv
cHJvY2Vzc29yX2RyaXZlci5jICAgICAgICAgICAgfCAgNDQgKysrKysrKystCiBkcml2ZXJzL2Fj
cGkvcHJvY2Vzc29yX3BlcmZsaWIuYyAgICAgICAgICAgfCAxMDYgKysrKysrKysrLS0tLS0tLS0t
LS0KIGRyaXZlcnMvYWNwaS9wcm9jZXNzb3JfdGhlcm1hbC5jICAgICAgICAgICB8ICA4MSArKysr
KysrKy0tLS0tLS0KIGRyaXZlcnMvYmFzZS9hcmNoX3RvcG9sb2d5LmMgICAgICAgICAgICAgICB8
ICAgMiArLQogZHJpdmVycy9jcHVmcmVxL2NwdWZyZXEuYyAgICAgICAgICAgICAgICAgIHwgIDUx
ICsrKystLS0tLS0KIGRyaXZlcnMvY3B1ZnJlcS9wcGNfY2JlX2NwdWZyZXEuYyAgICAgICAgICB8
ICAxOSArKystCiBkcml2ZXJzL2NwdWZyZXEvcHBjX2NiZV9jcHVmcmVxLmggICAgICAgICAgfCAg
IDggKysKIGRyaXZlcnMvY3B1ZnJlcS9wcGNfY2JlX2NwdWZyZXFfcG1pLmMgICAgICB8ICA5NiAr
KysrKysrKysrKy0tLS0tLS0KIGRyaXZlcnMvbWFjaW50b3NoL3dpbmRmYXJtX2NwdWZyZXFfY2xh
bXAuYyB8ICA3NyArKysrKysrKysrLS0tLS0KIGRyaXZlcnMvdGhlcm1hbC9jcHVfY29vbGluZy5j
ICAgICAgICAgICAgICB8IDExMCArKysrKy0tLS0tLS0tLS0tLS0tLS0KIGRyaXZlcnMvdmlkZW8v
ZmJkZXYvcHhhZmIuYyAgICAgICAgICAgICAgICB8ICAyMSAtLS0tCiBkcml2ZXJzL3ZpZGVvL2Zi
ZGV2L3B4YWZiLmggICAgICAgICAgICAgICAgfCAgIDEgLQogZHJpdmVycy92aWRlby9mYmRldi9z
YTExMDBmYi5jICAgICAgICAgICAgIHwgIDI3IC0tLS0tCiBkcml2ZXJzL3ZpZGVvL2ZiZGV2L3Nh
MTEwMGZiLmggICAgICAgICAgICAgfCAgIDEgLQogaW5jbHVkZS9hY3BpL3Byb2Nlc3Nvci5oICAg
ICAgICAgICAgICAgICAgIHwgIDIyICsrKy0tCiBpbmNsdWRlL2xpbnV4L2NwdWZyZXEuaCAgICAg
ICAgICAgICAgICAgICAgfCAgIDQgKy0KIDE3IGZpbGVzIGNoYW5nZWQsIDMyNyBpbnNlcnRpb25z
KCspLCAzNTkgZGVsZXRpb25zKC0pCgotLSAKMi4yMS4wLnJjMC4yNjkuZzFhNTc0ZTdhMjg4YgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
