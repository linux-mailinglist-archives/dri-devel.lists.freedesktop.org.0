Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C301A33F897
	for <lists+dri-devel@lfdr.de>; Wed, 17 Mar 2021 19:59:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 809866E235;
	Wed, 17 Mar 2021 18:59:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E81756E235
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Mar 2021 18:59:50 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id r20so4547643ljk.4
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Mar 2021 11:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aD+bgjnKcQpwKrmLfaSDWL9bnCurIUYHlVG+1S8dJKA=;
 b=GLqxKP2AkQDjOLk5j9uCP5FFyjIyG4W97tRtbx10R4PH/u3Ln9VZxZLz1DAC8C4dNr
 qo4LLTOSN5RtI6AYFPfDD/m9l6QHva4BWF6FfQW4AnMKR3pG6mw9UzWGWGDxdzgeYa83
 uUZOa9VQOs9fZ1fSsZzdJWkMOwDKAawrjvqwzInnBqocIhPbVSCvLUD/nKbc0JzaLlPR
 gbNZr8Poe5rQylaLaAymiEwLalXQXU8dVmRfWQR18Il1u5F5vA7kPtd0ot2S1/5jT9+p
 QWmgn4re6E6L+AnG1lRJUdyVwaGPQ1yjx2mjUdcyV9W9vG1i1N5zFb79k+OBOfsoch0M
 hJnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aD+bgjnKcQpwKrmLfaSDWL9bnCurIUYHlVG+1S8dJKA=;
 b=ca2xr2cVKulFInNLdIvWHWwwJ0g8JSLNd5roqCv0av2NVOpiQj++P6AVxqyM3Dg4Oa
 et5r08VqX/EkNFxj5o4n4GzdlKmOkuvgh1arF1YVkFz8Xq6teAEU3KErCItdzRvgIBU+
 4dQmLKWdN4lPQ24X7gfn+bvGtjJN9DB9mKrFIIUS4OlEIEI5r9ZdfJLTm554AQGDJm9C
 RDNvsf8bdEsAxKl20aPut9ulRa33/astx/Wpimd+Bm6Yqg/j2EU3X0dgnWEsPOBcVFZp
 UwkqC9F5Ukniwai4fVkK8Fye4ETxRTzz/sqA+MhaRgH7W0wWX/8T4NdA4YRLFSk1nJgm
 /org==
X-Gm-Message-State: AOAM530rUWOLZnSkjsugydZi21hnF9FyelvN26iutFKinLushCqjWKRn
 WmAViyvR0NIlgoXk4O0FAeA=
X-Google-Smtp-Source: ABdhPJw7gmOvSc1phTvkBLht6+c1l9w9p/jqGkafXriP21VPiDj23QRwlBPp4ZpspzWV79C6lnb4QA==
X-Received: by 2002:a2e:8909:: with SMTP id d9mr3181547lji.442.1616007589343; 
 Wed, 17 Mar 2021 11:59:49 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-52.dynamic.spd-mgts.ru.
 [109.252.193.52])
 by smtp.gmail.com with ESMTPSA id b28sm3442482lfo.219.2021.03.17.11.59.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Mar 2021 11:59:48 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Matt Merhar <mattmerhar@protonmail.com>, Peter Geis <pgwipeout@gmail.com>,
 Nicolas Chauvet <kwizart@gmail.com>,
 =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Subject: [PATCH v16 0/2] Add memory bandwidth management to NVIDIA Tegra DRM
 driver
Date: Wed, 17 Mar 2021 21:57:32 +0300
Message-Id: <20210317185734.14661-1-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
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
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBzZXJpZXMgYWRkcyBtZW1vcnkgYmFuZHdpZHRoIG1hbmFnZW1lbnQgdG8gdGhlIE5WSURJ
QSBUZWdyYSBEUk0gZHJpdmVyLAp3aGljaCBpcyBkb25lIHVzaW5nIGludGVyY29ubmVjdCBmcmFt
ZXdvcmsuIEl0IGZpeGVzIGRpc3BsYXkgY29ycnVwdGlvbiB0aGF0CmhhcHBlbnMgZHVlIHRvIGlu
c3VmZmljaWVudCBtZW1vcnkgYmFuZHdpZHRoLgoKQ2hhbmdlbG9nOgoKdjE2OiAtIEltcGxlbWVu
dGVkIHN1Z2dlc3Rpb25zIHRoYXQgd2VyZSBnaXZlbiBieSBNaWNoYcWCIE1pcm9zxYJhdyB0byB2
MTUuCgogICAgIC0gQWRkZWQgci1iIGZyb20gTWljaGHFgiBNaXJvc8WCYXcgdG8gdGhlIGRlYnVn
LXN0YXRzIHBhdGNoLgoKICAgICAtIFJlYmFzZWQgb24gdG9wIG9mIGEgcmVjZW50IGxpbnV4LW5l
eHQuCgogICAgIC0gUmVtb3ZlZCBiYW5kd2lkdGggc2NhbGluZyBiYXNlZCBvbiB3aWR0aCBkaWZm
ZXJlbmNlIG9mIHNyYy9kc3QKICAgICAgIHdpbmRvd3Mgc2luY2UgaXQncyBub3QgYWN0dWFsIGFu
eW1vcmUuIEFwcGFyZW50bHkgdGhlIHJlY2VudCBtZW1vcnkKICAgICAgIGRyaXZlciBjaGFuZ2Vz
IGZpeGVkIHByb2JsZW1zIHRoYXQgSSB3aXRuZXNzZWQgYmVmb3JlLgoKICAgICAtIEF2ZXJhZ2Ug
YmFuZHdpZHRoIGNhbGN1bGF0aW9uIG5vdyB3b24ndCBvdmVyZmxvdyBmb3IgNGsgcmVzb2x1dGlv
bnMuCgogICAgIC0gQXZlcmFnZSBiYW5kd2lkdGggY2FsY3VsYXRpb24gbm93IHVzZXMgdGhlIHNp
emUgb2YgdGhlIHZpc2libGUKICAgICAgIGFyZWEgaW5zdGVhZCBvZiB0aGUgc3JjIGFyZWEgc2lu
Y2UgZGVidWcgc3RhdHMgb2YgdGhlIG1lbW9yeQogICAgICAgY29udHJvbGxlciBjbGVhcmx5IHNo
b3cgdGhhdCBkb3duc2NhbGVkIHdpbmRvdyB0YWtlcyBsZXNzIGJhbmR3aWR0aCwKICAgICAgIHBy
b3BvcnRpb25hbGx5IHRvIHRoZSBzY2FsZWQgc2l6ZS4KCiAgICAgLSBCYW5kd2lkdGggY2FsY3Vs
YXRpb24gbm93IHVzZXMgImFkanVzdGVkIG1vZGUiIG9mIHRoZSBDUlRDLCB3aGljaAogICAgICAg
aXMgd2hhdCB1c2VkIGZvciBoL3cgcHJvZ3JhbW1pbmcsIGluc3RlYWQgb2YgdGhlIG1vZGUgdGhh
dCB3YXMKICAgICAgIHJlcXVlc3RlZCBieSB1c2Vyc3BhY2UsIGFsdGhvdWdoIHRoZSB0d28gdXN1
YWxseSBtYXRjaCBpbiBwcmFjdGljZS4KCnYxNTogLSBDb3JyZWN0ZWQgdGVncmFfcGxhbmVfaWNj
X25hbWVzW10gTlVMTC1jaGVjayB0aGF0IHdhcyBwYXJ0aWFsbHkgbG9zdAogICAgICAgYnkgYWNj
aWRlbnQgaW4gdjE0IGFmdGVyIHVuc3VjY2Vzc2Z1bCByZWJhc2UuCgp2MTQ6IC0gTWFkZSBpbXBy
b3ZlbWVudHMgdGhhdCB3ZXJlIHN1Z2dlc3RlZCBieSBNaWNoYcWCIE1pcm9zxYJhdyB0byB2MTM6
CgogICAgICAgLSBDaGFuZ2VkICd1bnNpZ25lZCBpbnQnIHRvICdib29sJy4KICAgICAgIC0gUmVu
YW1lZCBmdW5jdGlvbnMgd2hpY2ggY2FsY3VsYXRlIGJhbmR3aWR0aCBzdGF0ZS4KICAgICAgIC0g
UmV3b3JrZWQgY29tbWVudCBpbiB0aGUgY29kZSB0aGF0IGV4cGxhaW5zIHdoeSBkb3duc2NhbGVk
IHBsYW5lCiAgICAgICAgIHJlcXVpcmUgaGlnaGVyIGJhbmR3aWR0aC4KICAgICAgIC0gQWRkZWQg
cm91bmQtdXAgdG8gYmFuZHdpZHRoIGNhbGN1bGF0aW9uLgogICAgICAgLSBBZGRlZCBzYW5pdHkg
Y2hlY2tzIG9mIHRoZSBwbGFuZSBpbmRleCBhbmQgZml4ZWQgb3V0LW9mLWJvdW5kcwogICAgICAg
ICBhY2Nlc3Mgd2hpY2ggaGFwcGVuZWQgb24gVDEyNCBkdWUgdG8gdGhlIGN1cnNvciBwbGFuZSBp
bmRleC4KCnYxMzogLSBObyBjb2RlIGNoYW5nZXMuIFBhdGNoZXMgbWlzc2VkIHY1LjEyLCByZS1z
ZW5kaW5nIHRoZW0gZm9yIHY1LjEzLgoKRG1pdHJ5IE9zaXBlbmtvICgyKToKICBkcm0vdGVncmE6
IGRjOiBTdXBwb3J0IG1lbW9yeSBiYW5kd2lkdGggbWFuYWdlbWVudAogIGRybS90ZWdyYTogZGM6
IEV4dGVuZCBkZWJ1ZyBzdGF0cyB3aXRoIHRvdGFsIG51bWJlciBvZiBldmVudHMKCiBkcml2ZXJz
L2dwdS9kcm0vdGVncmEvS2NvbmZpZyB8ICAgMSArCiBkcml2ZXJzL2dwdS9kcm0vdGVncmEvZGMu
YyAgICB8IDM2MiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCiBkcml2ZXJzL2dw
dS9kcm0vdGVncmEvZGMuaCAgICB8ICAxOSArKwogZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2RybS5j
ICAgfCAgMTQgKysKIGRyaXZlcnMvZ3B1L2RybS90ZWdyYS9odWIuYyAgIHwgICAzICsKIGRyaXZl
cnMvZ3B1L2RybS90ZWdyYS9wbGFuZS5jIHwgMTE2ICsrKysrKysrKysrCiBkcml2ZXJzL2dwdS9k
cm0vdGVncmEvcGxhbmUuaCB8ICAxNSArKwogNyBmaWxlcyBjaGFuZ2VkLCA1MzAgaW5zZXJ0aW9u
cygrKQoKLS0gCjIuMzAuMgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVsCg==
