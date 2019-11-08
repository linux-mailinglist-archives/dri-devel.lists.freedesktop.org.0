Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB866F6CC5
	for <lists+dri-devel@lfdr.de>; Mon, 11 Nov 2019 03:30:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 885666E847;
	Mon, 11 Nov 2019 02:29:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4755B6E0F7;
 Fri,  8 Nov 2019 22:12:40 +0000 (UTC)
Received: by mail-io1-xd42.google.com with SMTP id c11so7990545iom.10;
 Fri, 08 Nov 2019 14:12:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VP7wzPTh3axuUTTJzTE2O0Yvg4rYT63oka2jFERivYw=;
 b=pKnSravG3sSC4xCjzPY+EwoQYCcQs5hElf5OXsj/MFfAy2cLbwrcjCvqx3N81AE/Mu
 FJYvAQlAV7RVtmiAvfBQsQg042HirChqLNlJl1QhrpgV7n6ivIQq24qp299CJbqjMjsG
 XTu0zU+PVEaA47CnOU1hUddyTTj57sD9b+xbOkkL9KaydUEQHHgvpV1skKGdkR7Osel0
 la3ggYy8AX99VxFwMOH78vBllS4g8fOC1W0oEYIF245GI5+ZnWSSkCZJf/SGSXQdPw89
 beEjooNVwDg27kgc2mz1LlXBCG/rLKKSJtTq+Y700tGSYFA5cvO30cWY/KN0N56nxa4j
 5rCA==
X-Gm-Message-State: APjAAAVGTMx46unSZT7D8Np+JGQ6LEoRqUi3N8+VVI+kfiTe5w10I8Vb
 n1JZDQyBjGp27xBTESPHBw+55LY2XFbS0auw6kM=
X-Google-Smtp-Source: APXvYqy74eTMXO2Bj8kE7ehtqnYovvN+7sRr+xSwJFSn6HaKnfhynYsLnin/wm4/30Ybps3M0mXYER00BmutigydhI4=
X-Received: by 2002:a6b:7846:: with SMTP id h6mr12161721iop.33.1573251159632; 
 Fri, 08 Nov 2019 14:12:39 -0800 (PST)
MIME-Version: 1.0
References: <20191108212840.13586-1-stephan@gerhold.net>
In-Reply-To: <20191108212840.13586-1-stephan@gerhold.net>
From: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date: Fri, 8 Nov 2019 15:12:28 -0700
Message-ID: <CAOCk7No7r6Frdu8jSbdBCroXeF+HY=kqEQoJnK0HbkyjLse5Rg@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH] drm/msm/dsi: Delay drm_panel_enable() until
 dsi_mgr_bridge_enable()
To: Stephan Gerhold <stephan@gerhold.net>
X-Mailman-Approved-At: Mon, 11 Nov 2019 02:29:25 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=VP7wzPTh3axuUTTJzTE2O0Yvg4rYT63oka2jFERivYw=;
 b=BvJos1COGV7s6Cc1rkvcxs/EByFGDz8rXSGaYgt+s0GChqZR3f9N2yT/jsTzEquUwY
 2T9IkfFqMXmbGpMZaWUE8R2KfgJdityZ9kQ1Kjj/wh90qNlgbYWHd/PXaHdXjzy/WDtu
 iD/zZoqKgESpFL1ayUvTXr9vj5faGQTz6FBVi1Rs9u+xAcXXbytw8aCKiI9xMzX6VUw8
 spODN7nOy1J6hB2EVK0E4qE1xF1r9DCQDB3UQi/4IbRmfqYVYrp9rJfWdWi4YoL6yAm0
 SVSU0+GExY6K1XtJUYf6addLiRAt7c+KE+l/hTdsU18kRBGPK4AkJjqmbCmUTxLap1Cb
 Jx4g==
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
Cc: Jasper Korten <jja2000@gmail.com>, David Airlie <airlied@linux.ie>,
 Sean Paul <sean@poorly.run>, lkml <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 MSM <linux-arm-msm@vger.kernel.org>,
 freedreno <freedreno@lists.freedesktop.org>, Hai Li <hali@codeaurora.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBOb3YgOCwgMjAxOSBhdCAyOjI5IFBNIFN0ZXBoYW4gR2VyaG9sZCA8c3RlcGhhbkBn
ZXJob2xkLm5ldD4gd3JvdGU6Cj4KPiBBdCB0aGUgbW9tZW50LCB0aGUgTVNNIERTSSBkcml2ZXIg
Y2FsbHMgZHJtX3BhbmVsX2VuYWJsZSgpIHJhdGhlciBlYXJseQo+IGZyb20gdGhlIERTSSBicmlk
Z2UgcHJlX2VuYWJsZSgpIGZ1bmN0aW9uLiBBdCB0aGlzIHBvaW50LCB0aGUgZW5jb2Rlcgo+IChl
LmcuIE1EUDUpIGlzIG5vdCBlbmFibGVkLCBzbyB3ZSBoYXZlIG5vdCBzdGFydGVkIHRyYW5zbWl0
dGluZwo+IHZpZGVvIGRhdGEuCj4KPiBIb3dldmVyLCB0aGUgZHJtX3BhbmVsX2Z1bmNzIGRvY3Vt
ZW50YXRpb24gc3RhdGVzIHRoYXQgZW5hYmxlKCkKPiBzaG91bGQgYmUgY2FsbGVkIG9uIHRoZSBw
YW5lbCAqYWZ0ZXIqIHZpZGVvIGRhdGEgaXMgYmVpbmcgdHJhbnNtaXR0ZWQ6Cj4KPiAgIFRoZSAu
cHJlcGFyZSgpIGZ1bmN0aW9uIGlzIHR5cGljYWxseSBjYWxsZWQgYmVmb3JlIHRoZSBkaXNwbGF5
IGNvbnRyb2xsZXIKPiAgIHN0YXJ0cyB0byB0cmFuc21pdCB2aWRlbyBkYXRhLiBbLi4uXSBBZnRl
ciB0aGUgZGlzcGxheSBjb250cm9sbGVyIGhhcwo+ICAgc3RhcnRlZCB0cmFuc21pdHRpbmcgdmlk
ZW8gZGF0YSwgaXQncyBzYWZlIHRvIGNhbGwgdGhlIC5lbmFibGUoKSBmdW5jdGlvbi4KPiAgIFRo
aXMgd2lsbCB0eXBpY2FsbHkgZW5hYmxlIHRoZSBiYWNrbGlnaHQgdG8gbWFrZSB0aGUgaW1hZ2Ug
b24gc2NyZWVuIHZpc2libGUuCj4KPiBDYWxsaW5nIGRybV9wYW5lbF9lbmFibGUoKSB0b28gZWFy
bHkgY2F1c2VzIHByb2JsZW1zIGZvciBzb21lIHBhbmVsczoKPiBUaGUgVEZUIExDRCBwYW5lbCB1
c2VkIGluIHRoZSBTYW1zdW5nIEdhbGF4eSBUYWIgQSA5LjcgKDIwMTUpIChBUFE4MDE2KQo+IHVz
ZXMgdGhlIE1JUElfRENTX1NFVF9ESVNQTEFZX0JSSUdIVE5FU1MgY29tbWFuZCB0byBjb250cm9s
Cj4gYmFja2xpZ2h0L2JyaWdodG5lc3Mgb2YgdGhlIHNjcmVlbi4gVGhlIGVuYWJsZSBzZXF1ZW5j
ZSBpcyB0aGVyZWZvcmU6Cj4KPiAgIGRybV9wYW5lbF9lbmFibGUoKQo+ICAgICBkcm1fcGFuZWxf
ZnVuY3MuZW5hYmxlKCk6Cj4gICAgICAgYmFja2xpZ2h0X2VuYWJsZSgpCj4gICAgICAgICBiYWNr
bGlnaHRfb3BzLnVwZGF0ZV9zdGF0dXMoKToKPiAgICAgICAgICAgbWlwaV9kc2lfZGNzX3NldF9k
aXNwbGF5X2JyaWdodG5lc3MoZHNpLCBibC0+cHJvcHMuYnJpZ2h0bmVzcyk7Cj4KPiBUaGUgcGFu
ZWwgc2VlbXMgdG8gc2lsZW50bHkgaWdub3JlIHRoZSBNSVBJX0RDU19TRVRfRElTUExBWV9CUklH
SFRORVNTCj4gY29tbWFuZCBpZiBpdCBpcyBzZW50IHRvbyBlYXJseS4gVGhpcyBwcmV2ZW50cyBz
ZXR0aW5nIHRoZSBpbml0aWFsIGJyaWdodG5lc3MsCj4gY2F1c2luZyB0aGUgZGlzcGxheSB0byBi
ZSBlbmFibGVkIHdpdGggbWluaW11bSBicmlnaHRuZXNzIGluc3RlYWQuCj4gQWRkaW5nIHZhcmlv
dXMgZGVsYXlzIGluIHRoZSBwYW5lbCBpbml0aWFsaXphdGlvbiBjb2RlIGRvZXMgbm90IHJlc3Vs
dAo+IGluIGFueSBkaWZmZXJlbmNlLgo+Cj4gT24gdGhlIG90aGVyIGhhbmQsIG1vdmluZyBkcm1f
cGFuZWxfZW5hYmxlKCkgdG8gZHNpX21ncl9icmlkZ2VfZW5hYmxlKCkKPiBmaXhlcyB0aGUgcHJv
YmxlbSwgaW5kaWNhdGluZyB0aGF0IHRoZSBwYW5lbCByZXF1aXJlcyB0aGUgdmlkZW8gc3RyZWFt
Cj4gdG8gYmUgYWN0aXZlIGJlZm9yZSB0aGUgYnJpZ2h0bmVzcyBjb21tYW5kIGlzIGFjY2VwdGVk
Lgo+Cj4gVGhlcmVmb3JlOiBNb3ZlIGRybV9wYW5lbF9lbmFibGUoKSB0byBkc2lfbWdyX2JyaWRn
ZV9lbmFibGUoKSB0bwo+IGRlbGF5IGNhbGxpbmcgaXQgdW50aWwgdmlkZW8gZGF0YSBpcyBiZWlu
ZyB0cmFuc21pdHRlZC4KPgo+IE1vdmUgZHJtX3BhbmVsX2Rpc2FibGUoKSB0byBkc2lfbWdyX2Jy
aWRnZV9kaXNhYmxlKCkgZm9yIHNpbWlsYXIgcmVhc29ucy4KPiAoVGhpcyBpcyBub3Qgc3RyaWN0
bHkgcmVxdWlyZWQgZm9yIHRoZSBwYW5lbCBhZmZlY3RlZCBhYm92ZS4uLikKPgo+IFRlc3RlZC1i
eTogSmFzcGVyIEtvcnRlbiA8amphMjAwMEBnbWFpbC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogU3Rl
cGhhbiBHZXJob2xkIDxzdGVwaGFuQGdlcmhvbGQubmV0Pgo+IC0tLQo+IFNpbmNlIHRoaXMgaXMg
YSBjb3JlIGNoYW5nZSBJIHRob3VnaHQgaXQgd291bGQgYmUgYmV0dGVyIHRvIHNlbmQgdGhpcwo+
IGVhcmx5LiBJIGJlbGlldmUgSmFzcGVyIHN0aWxsIHdhbnRzIHRvIGZpbmlzaCBzb21lIG90aGVy
IGNoYW5nZXMgYmVmb3JlCj4gc3VibWl0dGluZyB0aGUgaW5pdGlhbCBkZXZpY2UgdHJlZSBmb3Ig
dGhlIFNhbXN1bmcgR2FsYXh5IFRhYiBBIDkuNyAoMjAxNSkuIDspCj4KPiBJIGFsc28gdGVzdGVk
IGl0IG9uIG1zbTg5MTYtc2Ftc3VuZy1hNXUtZXVyLCBpdHMgZGlzcGxheSBpcyB3b3JraW5nIGZp
bmUKPiB3aXRoIG9yIHdpdGhvdXQgdGhpcyBwYXRjaC4KCk5hY2ssIHBsZWFzZS4gIEkgd2FzIGN1
cmlvdXMgc28gSSB0aHJldyB0aGlzIG9uIHRoZSBMZW5vdm8gTWlpeCA2MzAKbGFwdG9wLiAgSSBk
b24ndCBnZXQgYSBkaXNwbGF5IGJhY2sgd2l0aCB0aGlzIHBhdGNoLiAgSSdsbCB0cnkgdG8KZmln
dXJlIG91dCB3aHksIGJ1dCBjdXJyZW50bHkgSSBjYW4ndCBnZXQgaW50byB0aGUgbWFjaGluZS4K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
