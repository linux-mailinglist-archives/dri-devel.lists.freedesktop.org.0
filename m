Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E948EAC2E
	for <lists+dri-devel@lfdr.de>; Thu, 31 Oct 2019 10:05:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A5026EDD2;
	Thu, 31 Oct 2019 09:04:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com
 [IPv6:2607:f8b0:4864:20::836])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F2F5889A5
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Oct 2019 10:25:27 +0000 (UTC)
Received: by mail-qt1-x836.google.com with SMTP id e14so2508081qto.1
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Oct 2019 03:25:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=9hYolxApZ/voYxD7XS53KDc3a6r4YHM/nktkVUKF4bg=;
 b=X0Pi7N4doREKSMJx7Uj3Cef6XmZCB51rv82+NRTVFnpCPfw16teMuD+fp0K93SKA9m
 Y0CZ0pp3Ewd46o6Qi8b6/dTJwBq9jFirW8WRtYDkHR+b0mgI+JZ4crFk9xba/sPickmj
 gkxYmndgXOZkJgWfXT06YbWtyrrBwpJoSU9Mlg344mNbFu5is3HSiUjSRndDu/7QMoSs
 rNiprcbsedA+76MjoxB3r0yVI+yeo/KGf8ELtKNvaVsyv4E9FeRSzAKi0TPzyMlCmtBb
 M7pDG00kXNe6dUuDquRimvvqyg0WZcKzHhEV4UISQpMd/nkmPi9YjdO2bxucavnlioIw
 eiOA==
X-Gm-Message-State: APjAAAXnoWxLTi/1P6Ij288dBLR6eOsCfT47Dl+cHRB2aI6VUCEQbvq0
 sYwz5Hj6+iPLcim6Q/aHCxtaHMTHJ3+yWxiTrVTsYg==
X-Google-Smtp-Source: APXvYqzNfLMLIkciJzW8nsmVfiUh78OIF1sL++gBSs7L09dwfMzhLoANZOYDahvQhclKEA2zZZCa7WDy2c6dLP7Vl2g=
X-Received: by 2002:a0c:b0fa:: with SMTP id p55mr28866680qvc.239.1572431126096; 
 Wed, 30 Oct 2019 03:25:26 -0700 (PDT)
MIME-Version: 1.0
From: Chris Chiu <chiu@endlessm.com>
Date: Wed, 30 Oct 2019 18:25:14 +0800
Message-ID: <CAB4CAwcMqyOLJFPcVyoGuiXo-ujeyzL2TJkpZ3qAc1HymJ2x7A@mail.gmail.com>
Subject: Unexpected screen flicker during i915 initialization
To: Jani Nikula <jani.nikula@intel.com>, joonas.lahtinen@linux.intel.com, 
 rodrigo.vivi@intel.com, David Airlie <airlied@linux.ie>, daniel@ffwll.ch, 
 intel-gfx@lists.freedesktop.org, dri-devel <dri-devel@lists.freedesktop.org>
X-Mailman-Approved-At: Thu, 31 Oct 2019 09:04:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=endlessm-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=9hYolxApZ/voYxD7XS53KDc3a6r4YHM/nktkVUKF4bg=;
 b=sqZ7uuLJqy730ZPYSTR3LHmqWEKUT8SAed5nP4lEaiR0imK6och+z0G4ydgFDSC4R8
 CNWFzVe4eXEN7/5UJawavpoFt20OD5sT6lGoWKWAzT20pqBI0EspLjYfGQ5u2cjXeyFB
 mVmfgG41vaTH+sG5M30eJrVnnTYMJ5BtCc7KLg2cLLeR7NaYyqI687dkc/3qWhT1JVt/
 zQnIy5qKzlC4yAenkBP77ubVrnfVPZltYQ1NTzPNoClZVq9BKJpGdWdgEvtJVyHSi4lX
 cx2FVaZcsh9EX9lQtuwmVSZ8I6AfgdBoHUU86wXoWPV7D6z743C9IdiQyOoaqLPRqti6
 lzWg==
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
Cc: Linux Kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgZ3V5cywKICAgIFdlIGhhdmUgMiBsYXB0b3BzLCBBU1VTIFo0MDZNQSBhbmQgQWNlciBUcmF2
ZWxNYXRlIEIxMTgsIGJvdGgKcG93ZXJlZCBieSB0aGUgc2FtZSBJbnRlbCBONTAwMCBHZW1uaUxh
a2UgQ1BVLiBPbiB0aGUgQWNlciBsYXB0b3AsIHRoZQpwYW5lbCB3aWxsIGJsaW5rIG9uY2UgZHVy
aW5nIGJvb3Qgd2hpY2ggbmV2ZXIgaGFwcGVucyBvbiB0aGUgQVNVUwpsYXB0b3AuIEl0IGNhdWdo
dCBteSBhdHRlbnRpb24gYW5kIEkgZmluZCB0aGUgZGlmZmVyZW5jZSBiZXR3ZWVuIHRoZW0KYnV0
IEkgbmVlZCBoZWxwIGZvciBtb3JlIGluZm9ybWF0aW9uLAoKICAgIFRoZSBtYWpvciBkaWZmZXJl
bmNlIGhhcHBlbnMgaW4gYnh0X3Nhbml0aXplX2NkY2xrKCkgb24gdGhlCmZvbGxvd2luZyBjb25k
aXRpb24gY2hlY2suCiAgICAgICAgaWYgKGNkY3RsID09IGV4cGVjdGVkKQogICAgICAgICAgICAg
ICAgLyogQWxsIHdlbGw7IG5vdGhpbmcgdG8gc2FuaXRpemUgKi8KICAgICAgICAgICAgICAgIHJl
dHVybjsKCiAgICBPbiB0aGUgcHJvYmxlbWF0aWMgQWNlciBsYXB0b3AsIHRoZSB2YWx1ZSBvZiBj
ZGN0bCBpcyAweDI3YSB3aGlsZQp0aGUgc2FtZSBjZGN0bCBpcyAweDI3OCBvbiBBU1VTIG1hY2hp
bmUuIER1ZSB0byB0aGUgMHgyN2EgaXMgbm90IGVxdWFsCnRvIHRoZSBleHBlY3RlZCB2YWx1ZSAw
eDI3OCBzbyBpdCBuZWVkcyB0byBiZSBzYW5pdGl6ZWQgYnkgYXNzaWduaW5nCi0xIHRvICBkZXZf
cHJpdi0+Y2RjbGsuaHcudmNvLiBUaGVuIHRoZSBjb25zZXF1ZW50IGJ4dF9zZXRfY2RjbGsoKQp3
aWxsIGZvcmNlIHRoZSBmdWxsIFBMTCBkaXNhYmxlIGFuZCBlbmFibGUuIEFuZCB0aGF0J3MgdGhl
IGZsaWNrZXIKKGJsaW5rKSB3ZSBvYnNlcnZlZCBkdXJpbmcgYm9vdC4KCiAgICBBbHRob3VnaCBJ
IGNhbid0IGZpbmQgdGhlIGRlZmluaXRpb24gYWJvdXQgdGhlIEJJVCgyKSBvZiBDRENMS19DVEwK
d2hpY2ggY2F1c2UgdGhpcyBkaWZmZXJlbmNlLiBDYW4gYW55b25lIHN1Z2dlc3Qgd2hhdCBleGFj
dGx5IHRoZQpwcm9ibGVtIGlzIGFuZCBob3cgc2hvdWxkIHdlIGRlYWwgd2l0aCBpdD8gVGhhbmtz
LgoKQ2hyaXMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
