Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C58422ACC05
	for <lists+dri-devel@lfdr.de>; Tue, 10 Nov 2020 04:49:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D40B89740;
	Tue, 10 Nov 2020 03:49:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B765289740
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 03:49:38 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id i26so8996784pgl.5
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Nov 2020 19:49:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sDoxEoYXzOGDTRqKHmsK1PmkQ+v+kjtjORMumiaAdaY=;
 b=VRHtKHrHp+YYnxmp5gRTU5t79Mq1+WJABfC0oh+1Cza26fX35vqeIx0L7pTcKEGdU6
 oE7L7TMvPdmMiAWjDBxnEqqH6vZuu7nkQdgMtO4ya0zUSdp7zFPLHG3cAA/4+I6iJTSv
 Dfl+SskuSqxVcP06diQkjLgkoaYUzFobZyNAuAzBxuDJ8rW3bYmniabBkXEE0iYn6lKD
 2Offn4yIOhOBLAHNJbPGPN85qS+phnyo+6ye4t7WOzp8VkUz/Fdu0eGL1ZJ/ssKFriBO
 NlMBufWsCcZcYF5pfeFv30h41qabhd8gLf3ysS0yokatYdlM5+pOlK+I6mntknRC7TcX
 En8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sDoxEoYXzOGDTRqKHmsK1PmkQ+v+kjtjORMumiaAdaY=;
 b=rQ9u4dhEZr63nNbOCf3arHatubLb2Cxv+6OLG6dbcm7WZIiDxmbxuEq+G4DQ8BGlAu
 qXd15/hJYWXSOLifqH5Arg5UjDNriiSaOCyySaYJddRyhECVdtPXWt2oKVXknZATCmEb
 iNjIp8qZ6mxd/um6/iJqW7k7TEqYpG+Zc83usrqD0EO7aX3aq3nvJtdOx1cpMT1kFQyA
 5W3TB1i9B2Iedwq2/BLJ5I7SsyMUnJCV9YGIEjU9Kxa+vwG5Q2YVoJNDFYtKfeG2bfY4
 zYyq/O+UhcwbuLhWV7GQQ+tpccEXAA354HE2ENWWNTBpZ+Q3xFfSawIlCcZZlGUHoiY2
 cq6g==
X-Gm-Message-State: AOAM532jnO7HEboQOjkax1A99PdaxEl6Sgj+jte8IVt8UU/H9paMa6E1
 yJWY+SQG9wn+1MzrrrKZozsWhw==
X-Google-Smtp-Source: ABdhPJzH2pSKF1PV/0DDDEBwUaDZ0Qy7l115AmJfeyhAyHCxq657BbYMJVv7zdoWvPj0zHB54WdOCw==
X-Received: by 2002:a17:90b:3708:: with SMTP id
 mg8mr2765897pjb.192.1604980178162; 
 Mon, 09 Nov 2020 19:49:38 -0800 (PST)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
 by smtp.gmail.com with ESMTPSA id
 b4sm12380693pfi.208.2020.11.09.19.49.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2020 19:49:37 -0800 (PST)
From: John Stultz <john.stultz@linaro.org>
To: lkml <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 0/7] dma-buf: Performance improvements for system heap & a
 system-uncached implementation
Date: Tue, 10 Nov 2020 03:49:27 +0000
Message-Id: <20201110034934.70898-1-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: Sandeep Patil <sspatil@google.com>, dri-devel@lists.freedesktop.org,
 Ezequiel Garcia <ezequiel@collabora.com>, Robin Murphy <robin.murphy@arm.com>,
 James Jones <jajones@nvidia.com>, Liam Mark <lmark@codeaurora.org>,
 Laura Abbott <labbott@kernel.org>, Chris Goldsworthy <cgoldswo@codeaurora.org>,
 Hridya Valsaraju <hridya@google.com>,
 =?UTF-8?q?=C3=98rjan=20Eide?= <orjan.eide@arm.com>,
 linux-media@vger.kernel.org, Suren Baghdasaryan <surenb@google.com>,
 Daniel Mentz <danielmentz@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGV5IEFsbCwKICBTbyBqdXN0IHdhbnRlZCB0byBzZW5kIG15IGxhc3QgcmV2aXNpb24gb2YgbXkg
cGF0Y2ggc2VyaWVzCm9mIHBlcmZvcm1hbmNlIG9wdGltaXphdGlvbnMgdG8gdGhlIGRtYS1idWYg
c3lzdGVtIGhlYXAuCgpUaGlzIHNlcmllcyByZXdvcmtzIHRoZSBzeXN0ZW0gaGVhcCB0byB1c2Ug
c2d0YWJsZXMsIGFuZCB0aGVuCmNvbnNvbGlkYXRlcyB0aGUgcGFnZWxpc3QgbWV0aG9kIGZyb20g
dGhlIGhlYXAtaGVscGVycyBpbnRvIHRoZQpDTUEgaGVhcC4gQWZ0ZXIgd2hpY2ggdGhlIGhlYXAt
aGVscGVycyBsb2dpYyBpcyByZW1vdmVkIChhcyBpdAppcyB1bnVzZWQpLiBJJ2Qgc3RpbGwgbGlr
ZSB0byBmaW5kIGEgYmV0dGVyIHdheSB0byBhdm9pZCBzb21lIG9mCnRoZSBsb2dpYyBkdXBsaWNh
dGlvbiBpbiBpbXBsZW1lbnRpbmcgdGhlIGVudGlyZSBkbWFfYnVmX29wcwpoYW5kbGVycyBwZXIg
aGVhcC4gQnV0IHVuZm9ydHVuYXRlbHkgdGhhdCBjb2RlIGlzIHRpZWQgc29tZXdoYXQKdG8gaG93
IHRoZSBidWZmZXIncyBtZW1vcnkgaXMgdHJhY2tlZC4gQXMgbW9yZSBoZWFwcyBzaG93IHVwIEkK
dGhpbmsgd2UnbGwgaGF2ZSBhIGJldHRlciBpZGVhIGhvdyB0byBiZXN0IHNoYXJlIGNvZGUsIHNv
IGZvcgpub3cgSSB0aGluayB0aGlzIGlzIG9rLgoKQWZ0ZXIgdGhpcywgdGhlIHNlcmllcyBpbnRy
b2R1Y2VzIGFuIG9wdGltaXphdGlvbiB0aGF0CsOYcmphbiBFaWRlIGltcGxlbWVudGVkIGZvciBJ
T04gdGhhdCBhdm9pZHMgY2FsbGluZyBzeW5jIG9uCmF0dGFjaG1lbnRzIHRoYXQgZG9uJ3QgaGF2
ZSBhIG1hcHBpbmcuCgpOZXh0LCBhbiBvcHRpbWl6YXRpb24gdG8gdXNlIGxhcmdlciBvcmRlciBw
YWdlcyBmb3IgdGhlIHN5c3RlbQpoZWFwLiBUaGlzIGNoYW5nZSBicmluZ3MgdXMgY2xvc2VyIHRv
IHRoZSBjdXJyZW50IHBlcmZvcm1hbmNlCm9mIHRoZSBJT04gYWxsb2NhdGlvbiBjb2RlICh0aG91
Z2ggdGhlcmUgc3RpbGwgaXMgYSBnYXAgZHVlCnRvIElPTiB1c2luZyBhIG1peCBvZiBkZWZlcnJl
ZC1mcmVlaW5nIGFuZCBwYWdlIHBvb2xzLCBJJ2xsIGJlCmxvb2tpbmcgYXQgaW50ZWdyYXRpbmcg
dGhvc2UgZXZlbnR1YWxseSkuCgpGaW5hbGx5LCBhIHJld29ya2VkIHZlcnNpb24gb2YgbXkgdW5j
YWNoZWQgc3lzdGVtIGhlYXAKaW1wbGVtZW50YXRpb24gSSB3YXMgc3VibWl0dGluZyBhIGZldyB3
ZWVrcyBiYWNrLiBTaW5jZSBpdApkdXBsaWNhdGVkIGEgbG90IG9mIHRoZSBub3cgcmV3b3JrZWQg
c3lzdGVtIGhlYXAgY29kZSwgSQpyZWFsaXplZCBpdCB3b3VsZCBiZSBtdWNoIHNpbXBsZXIgdG8g
YWRkIHRoZSBmdW5jdGlvbmFsaXR5IHRvCnRoZSBzeXN0ZW1faGVhcCBpbXBsZW1lbnRhdGlvbiBp
dHNlbGYuCgpXaGlsZSBub3QgaW1wcm92aW5nIHRoZSBjb3JlIGFsbG9jYXRpb24gcGVyZm9ybWFu
Y2UsIHRoZQp1bmNhY2hlZCBoZWFwIGFsbG9jYXRpb25zIGRvIHJlc3VsdCBpbiAqbXVjaCogaW1w
cm92ZWQKcGVyZm9ybWFuY2Ugb24gSGlLZXk5NjAgYXMgaXQgYXZvaWRzIGEgbG90IG9mIGZsdXNo
aW5nIGFuZAppbnZhbGlkYXRpbmcgYnVmZmVycyB0aGF0IHRoZSBjcHUgZG9lc24ndCB0b3VjaCBv
ZnRlbi4KCkZlZWRiYWNrIG9uIHRoZXNlIHdvdWxkIGJlIGdyZWF0IQoKdGhhbmtzCi1qb2huCgpO
ZXcgaW4gdjU6CiogQWRkZWQgYSBjb21tZW50IGV4cGxhaW5pbmcgd2h5IHRoZSBvcmRlciBzaXpl
cyBhcmUKICBjaG9zZW4gYXMgdGhleSBhcmUKCkNjOiBTdW1pdCBTZW13YWwgPHN1bWl0LnNlbXdh
bEBsaW5hcm8ub3JnPgpDYzogTGlhbSBNYXJrIDxsbWFya0Bjb2RlYXVyb3JhLm9yZz4KQ2M6IExh
dXJhIEFiYm90dCA8bGFiYm90dEBrZXJuZWwub3JnPgpDYzogQnJpYW4gU3RhcmtleSA8QnJpYW4u
U3RhcmtleUBhcm0uY29tPgpDYzogSHJpZHlhIFZhbHNhcmFqdSA8aHJpZHlhQGdvb2dsZS5jb20+
CkNjOiBTdXJlbiBCYWdoZGFzYXJ5YW4gPHN1cmVuYkBnb29nbGUuY29tPgpDYzogU2FuZGVlcCBQ
YXRpbCA8c3NwYXRpbEBnb29nbGUuY29tPgpDYzogRGFuaWVsIE1lbnR6IDxkYW5pZWxtZW50ekBn
b29nbGUuY29tPgpDYzogQ2hyaXMgR29sZHN3b3J0aHkgPGNnb2xkc3dvQGNvZGVhdXJvcmEub3Jn
PgpDYzogw5hyamFuIEVpZGUgPG9yamFuLmVpZGVAYXJtLmNvbT4KQ2M6IFJvYmluIE11cnBoeSA8
cm9iaW4ubXVycGh5QGFybS5jb20+CkNjOiBFemVxdWllbCBHYXJjaWEgPGV6ZXF1aWVsQGNvbGxh
Ym9yYS5jb20+CkNjOiBTaW1vbiBTZXIgPGNvbnRhY3RAZW1lcnNpb24uZnI+CkNjOiBKYW1lcyBK
b25lcyA8amFqb25lc0BudmlkaWEuY29tPgpDYzogbGludXgtbWVkaWFAdmdlci5rZXJuZWwub3Jn
CkNjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCgpKb2huIFN0dWx0eiAoNyk6CiAg
ZG1hLWJ1Zjogc3lzdGVtX2hlYXA6IFJld29yayBzeXN0ZW0gaGVhcCB0byB1c2Ugc2d0YWJsZXMg
aW5zdGVhZCBvZgogICAgcGFnZWxpc3RzCiAgZG1hLWJ1ZjogaGVhcHM6IE1vdmUgaGVhcC1oZWxw
ZXIgbG9naWMgaW50byB0aGUgY21hX2hlYXAKICAgIGltcGxlbWVudGF0aW9uCiAgZG1hLWJ1Zjog
aGVhcHM6IFJlbW92ZSBoZWFwLWhlbHBlcnMgY29kZQogIGRtYS1idWY6IGhlYXBzOiBTa2lwIHN5
bmMgaWYgbm90IG1hcHBlZAogIGRtYS1idWY6IHN5c3RlbV9oZWFwOiBBbGxvY2F0ZSBoaWdoZXIg
b3JkZXIgcGFnZXMgaWYgYXZhaWxhYmxlCiAgZG1hLWJ1ZjogZG1hLWhlYXA6IEtlZXAgdHJhY2sg
b2YgdGhlIGhlYXAgZGV2aWNlIHN0cnVjdAogIGRtYS1idWY6IHN5c3RlbV9oZWFwOiBBZGQgYSBz
eXN0ZW0tdW5jYWNoZWQgaGVhcCByZS11c2luZyB0aGUgc3lzdGVtCiAgICBoZWFwCgogZHJpdmVy
cy9kbWEtYnVmL2RtYS1oZWFwLmMgICAgICAgICAgIHwgIDMzICstCiBkcml2ZXJzL2RtYS1idWYv
aGVhcHMvTWFrZWZpbGUgICAgICAgfCAgIDEgLQogZHJpdmVycy9kbWEtYnVmL2hlYXBzL2NtYV9o
ZWFwLmMgICAgIHwgMzI0ICsrKysrKysrKysrKysrKy0tLQogZHJpdmVycy9kbWEtYnVmL2hlYXBz
L2hlYXAtaGVscGVycy5jIHwgMjcwIC0tLS0tLS0tLS0tLS0tLQogZHJpdmVycy9kbWEtYnVmL2hl
YXBzL2hlYXAtaGVscGVycy5oIHwgIDUzIC0tLQogZHJpdmVycy9kbWEtYnVmL2hlYXBzL3N5c3Rl
bV9oZWFwLmMgIHwgNDk0ICsrKysrKysrKysrKysrKysrKysrKysrKy0tLQogaW5jbHVkZS9saW51
eC9kbWEtaGVhcC5oICAgICAgICAgICAgIHwgICA5ICsKIDcgZmlsZXMgY2hhbmdlZCwgNzUzIGlu
c2VydGlvbnMoKyksIDQzMSBkZWxldGlvbnMoLSkKIGRlbGV0ZSBtb2RlIDEwMDY0NCBkcml2ZXJz
L2RtYS1idWYvaGVhcHMvaGVhcC1oZWxwZXJzLmMKIGRlbGV0ZSBtb2RlIDEwMDY0NCBkcml2ZXJz
L2RtYS1idWYvaGVhcHMvaGVhcC1oZWxwZXJzLmgKCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
