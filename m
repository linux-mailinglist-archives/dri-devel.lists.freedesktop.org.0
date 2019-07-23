Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B9DBA71F28
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2019 20:23:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAB7E6E36D;
	Tue, 23 Jul 2019 18:23:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F00566E180
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2019 07:39:07 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id g20so79767175ioc.12
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2019 00:39:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tM6ZfP29yHIXHkq5iTMeXQ4AjIL/XiZWUkv0a/I2jO4=;
 b=CnwTQqzEyXYqPNjezzQbSStVoYTN+O7Wtvif+KFaZXwd+gmmG2rbSjrjwhd5mcAo6A
 q9oh7W2qrUYFuYTszbXznM7gZsQiro6VOq8DwLhrWBi1o4+iAEE0Hj+z4mpU3fdfhhW/
 Sf9Zzncz2OfXxbGUA4zlUMWpEu+XhZqPKVn6MTNGButgAxvlplGLXfGoOR8CuGP0oRhu
 dfWnX+CY0i/FqZ/KxYAYPYHajk7LYNm/X2mezGPYEv1oiAjIiTGI2C2WF0ml8uSIhwKm
 I0rnqppE7AiQx0/WjMwixCl6PsaDSxDJkbM13K8AHLPo0HAbOWDM93jLCvKADrmYSSO/
 np1Q==
X-Gm-Message-State: APjAAAXPaCR72GKmjRnN/d0PwwLOFN5/7wNJya8Bd3SN90hyWvdM6E14
 0wAuXQ03AkmqqEbRSA3hmPiKzWXhyxfKVWOx0pXraA==
X-Google-Smtp-Source: APXvYqxknPLPiOAbuB7jqVAi6mu/Fl77yhGj6yGal1fmI4tdBfWn6NaR9DX5QN1Ija5E6QkqejVNYiWatG5/H9GGpW4=
X-Received: by 2002:a5e:de0d:: with SMTP id e13mr45601420iok.144.1563867546989; 
 Tue, 23 Jul 2019 00:39:06 -0700 (PDT)
MIME-Version: 1.0
References: <0000000000001a51c4058ddcb1b6@google.com>
In-Reply-To: <0000000000001a51c4058ddcb1b6@google.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Tue, 23 Jul 2019 09:38:56 +0200
Message-ID: <CACT4Y+ZGwKP+f4esJdx60AywO9b3Y5Bxb4zLtH6EEkaHpP6Zag@mail.gmail.com>
Subject: Re: kernel panic: stack is corrupted in pointer
To: syzbot <syzbot+79f5f028005a77ecb6bb@syzkaller.appspotmail.com>, 
 John Fastabend <john.fastabend@gmail.com>, bpf <bpf@vger.kernel.org>
X-Mailman-Approved-At: Tue, 23 Jul 2019 18:22:04 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=tM6ZfP29yHIXHkq5iTMeXQ4AjIL/XiZWUkv0a/I2jO4=;
 b=usbj8W35wjkWL0ZjAlNlOpJnA68U6AiUa2rQqc18HYqg/292MErMPXrVu08j64WLeQ
 0w/jTSSPy0WoIa1kquvmlS805CgCn/VEtUT7IrJmyzU18EllsyifJC7GjO7DcfmHvBvR
 1lyf1QQErv083xXVI6aqrUjw1695bMtzgRStNHuET/KnHMiXJnskh/TmNxT6IawrQ+EA
 TvKJRpwMnvXZIcBT5iMCnNwriaUgwmZ36nWR+ZeyE3vz2HWijcT5QBjh0ZbBFjG2YQqK
 UQW35jMAn/z+QawL1iqDcnfIDVcdW9nW1bK0w8F4SG8Eq6M2KAJD+fHb+ywbhzEI/nMR
 8nYw==
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
Cc: Daniel Borkmann <daniel@iogearbox.net>, David Airlie <airlied@linux.ie>,
 netdev <netdev@vger.kernel.org>,
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
 Alexei Starovoitov <ast@kernel.org>, amd-gfx@lists.freedesktop.org,
 LKML <linux-kernel@vger.kernel.org>, DRI <dri-devel@lists.freedesktop.org>,
 alexander.deucher@amd.com, leo.liu@amd.com, christian.koenig@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdWwgMTcsIDIwMTkgYXQgMTA6NTggQU0gc3l6Ym90CjxzeXpib3QrNzlmNWYwMjgw
MDVhNzdlY2I2YmJAc3l6a2FsbGVyLmFwcHNwb3RtYWlsLmNvbT4gd3JvdGU6Cj4KPiBIZWxsbywK
Pgo+IHN5emJvdCBmb3VuZCB0aGUgZm9sbG93aW5nIGNyYXNoIG9uOgo+Cj4gSEVBRCBjb21taXQ6
ICAgIDE0MzhjZGU3IEFkZCBsaW51eC1uZXh0IHNwZWNpZmljIGZpbGVzIGZvciAyMDE5MDcxNgo+
IGdpdCB0cmVlOiAgICAgICBsaW51eC1uZXh0Cj4gY29uc29sZSBvdXRwdXQ6IGh0dHBzOi8vc3l6
a2FsbGVyLmFwcHNwb3QuY29tL3gvbG9nLnR4dD94PTEzOTg4MDU4NjAwMDAwCj4ga2VybmVsIGNv
bmZpZzogIGh0dHBzOi8vc3l6a2FsbGVyLmFwcHNwb3QuY29tL3gvLmNvbmZpZz94PTM0MzBhMTUx
ZTE0NTIzMzEKPiBkYXNoYm9hcmQgbGluazogaHR0cHM6Ly9zeXprYWxsZXIuYXBwc3BvdC5jb20v
YnVnP2V4dGlkPTc5ZjVmMDI4MDA1YTc3ZWNiNmJiCj4gY29tcGlsZXI6ICAgICAgIGdjYyAoR0ND
KSA5LjAuMCAyMDE4MTIzMSAoZXhwZXJpbWVudGFsKQo+IHN5eiByZXBybzogICAgICBodHRwczov
L3N5emthbGxlci5hcHBzcG90LmNvbS94L3JlcHJvLnN5ej94PTExMWZjOGFmYTAwMDAwCgpGcm9t
IHRoZSByZXBybyBpdCBsb29rcyBsaWtlIHRoZSBzYW1lIGJwZiBzdGFjayBvdmVyZmxvdyBidWcu
ICtKb2huCldlIG5lZWQgdG8gZHVwIHRoZW0gb250byBzb21lIGNhbm9uaWNhbCByZXBvcnQgZm9y
IHRoaXMgYnVnLCBvciB0aGlzCmJlY29tZXMgdW5tYW5hZ2VhYmxlLgoKI3N5eiBkdXA6IGtlcm5l
bCBwYW5pYzogY29ycnVwdGVkIHN0YWNrIGVuZCBpbiBkcHV0Cgo+IFRoZSBidWcgd2FzIGJpc2Vj
dGVkIHRvOgo+Cj4gY29tbWl0IDk2YTVkOGQ0OTE1ZjNlMjQxZWJiNDhkNWRlY2RkMTEwYWI5Yzdk
Y2YKPiBBdXRob3I6IExlbyBMaXUgPGxlby5saXVAYW1kLmNvbT4KPiBEYXRlOiAgIEZyaSBKdWwg
MTMgMTU6MjY6MjggMjAxOCArMDAwMAo+Cj4gICAgICBkcm0vYW1kZ3B1OiBNYWtlIHN1cmUgSUIg
dGVzdHMgZmx1c2hlZCBhZnRlciBJUCByZXN1bWUKPgo+IGJpc2VjdGlvbiBsb2c6ICBodHRwczov
L3N5emthbGxlci5hcHBzcG90LmNvbS94L2Jpc2VjdC50eHQ/eD0xNGE0NjIwMDYwMDAwMAo+IGZp
bmFsIGNyYXNoOiAgICBodHRwczovL3N5emthbGxlci5hcHBzcG90LmNvbS94L3JlcG9ydC50eHQ/
eD0xNmE0NjIwMDYwMDAwMAo+IGNvbnNvbGUgb3V0cHV0OiBodHRwczovL3N5emthbGxlci5hcHBz
cG90LmNvbS94L2xvZy50eHQ/eD0xMmE0NjIwMDYwMDAwMAo+Cj4gSU1QT1JUQU5UOiBpZiB5b3Ug
Zml4IHRoZSBidWcsIHBsZWFzZSBhZGQgdGhlIGZvbGxvd2luZyB0YWcgdG8gdGhlIGNvbW1pdDoK
PiBSZXBvcnRlZC1ieTogc3l6Ym90Kzc5ZjVmMDI4MDA1YTc3ZWNiNmJiQHN5emthbGxlci5hcHBz
cG90bWFpbC5jb20KPiBGaXhlczogOTZhNWQ4ZDQ5MTVmICgiZHJtL2FtZGdwdTogTWFrZSBzdXJl
IElCIHRlc3RzIGZsdXNoZWQgYWZ0ZXIgSVAKPiByZXN1bWUiKQo+Cj4gS2VybmVsIHBhbmljIC0g
bm90IHN5bmNpbmc6IHN0YWNrLXByb3RlY3RvcjogS2VybmVsIHN0YWNrIGlzIGNvcnJ1cHRlZCBp
bjoKPiBwb2ludGVyKzB4NzAyLzB4NzUwIGxpYi92c3ByaW50Zi5jOjIxODcKPiBTaHV0dGluZyBk
b3duIGNwdXMgd2l0aCBOTUkKPiBLZXJuZWwgT2Zmc2V0OiBkaXNhYmxlZAo+Cj4KPiAtLS0KPiBU
aGlzIGJ1ZyBpcyBnZW5lcmF0ZWQgYnkgYSBib3QuIEl0IG1heSBjb250YWluIGVycm9ycy4KPiBT
ZWUgaHR0cHM6Ly9nb28uZ2wvdHBzbUVKIGZvciBtb3JlIGluZm9ybWF0aW9uIGFib3V0IHN5emJv
dC4KPiBzeXpib3QgZW5naW5lZXJzIGNhbiBiZSByZWFjaGVkIGF0IHN5emthbGxlckBnb29nbGVn
cm91cHMuY29tLgo+Cj4gc3l6Ym90IHdpbGwga2VlcCB0cmFjayBvZiB0aGlzIGJ1ZyByZXBvcnQu
IFNlZToKPiBodHRwczovL2dvby5nbC90cHNtRUojc3RhdHVzIGZvciBob3cgdG8gY29tbXVuaWNh
dGUgd2l0aCBzeXpib3QuCj4gRm9yIGluZm9ybWF0aW9uIGFib3V0IGJpc2VjdGlvbiBwcm9jZXNz
IHNlZTogaHR0cHM6Ly9nb28uZ2wvdHBzbUVKI2Jpc2VjdGlvbgo+IHN5emJvdCBjYW4gdGVzdCBw
YXRjaGVzIGZvciB0aGlzIGJ1ZywgZm9yIGRldGFpbHMgc2VlOgo+IGh0dHBzOi8vZ29vLmdsL3Rw
c21FSiN0ZXN0aW5nLXBhdGNoZXMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
