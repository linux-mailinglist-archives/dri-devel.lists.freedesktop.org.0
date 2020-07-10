Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD6BE21B0A4
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jul 2020 09:53:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A9AC6EB95;
	Fri, 10 Jul 2020 07:53:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80E946E09F
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 03:17:17 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id e90so3235911ote.1
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Jul 2020 20:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kali.org; s=google;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=j0wwhr1/T/vy9n1+otmduXmzQCUiGkNtjh79hw1bxv4=;
 b=BbmOQTRp6gYkwQqXj3JMZ3m0Tqr0EIu9qZrevvaVT+MMCS/1fSHpqZLGJfeAU8puZy
 9RcjYup96/Cv7z5UP21se4Jg17+/9cQF39itTwIYmb3+k5ojm4IHmdtmCnd0FYxwv7o/
 4F0LZ2pAtf9q8WpVEUg5A+svER1CDsSU08jrknSpL7/Z5xPz/URGGp2MaIoeBGzQphIS
 5zdxdg44kQyrTEyNsxhy6Mo7Ig36nIcNVAgQSS5YehxC4DjMzkC40goTy4lsxyL1bBSO
 IqgFmV3UgI1u/2nCvd0NRCxtnvYzJZFyyVPaj01JfrUQX6ctJFyhIOpP/MKL6WANMXOQ
 YQTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=j0wwhr1/T/vy9n1+otmduXmzQCUiGkNtjh79hw1bxv4=;
 b=oMezVSL1e7PrcvDYWwmQLSRb+2Xi6eqI4iE9OZ5gpVOqDZFIylIMIgbtSvqjA6+eyO
 agqPTWtjF7Rn+DrNs9CblTskLPsGmGclMnP/KZqVNEXt5bpHWewVs0nwGXm5Wz9rWn3b
 PTccjtZpE/FbQ9sorde0uLcMB588StvoM45Kwcl3kyQ4aO4Tqx6/WbR5GNPVgb3sGL21
 tjGbPXF8c9CRiUzgGXqpgyjx4Xe8vVNasDFUNescXAEueFbk5SCZv49+fyHwcT+aNZRP
 TSy6tLbdqUN/hc4GX8IoQ9i5WWnPB20ggIGWPXaLd9+Scj0JrVUW6fcSlq2ihcpQwWbZ
 xkVw==
X-Gm-Message-State: AOAM531lAdQi1stMkKgm4VuEiOgQhsT35+jYtIV5/2Qmb61u/OtpgFlA
 DtmM1ezW5SGe/Aiv85yzI0YYDg==
X-Google-Smtp-Source: ABdhPJwpau8NTYn5wFg7gaMaXNs5CJF3bRoXICXIT+qLYysVXc/ruiVyQgs+tjrcp0KQC8fmsrEGCw==
X-Received: by 2002:a05:6830:1e03:: with SMTP id
 s3mr29365301otr.306.1594351036655; 
 Thu, 09 Jul 2020 20:17:16 -0700 (PDT)
Received: from [192.168.11.9] (cpe-173-175-113-3.satx.res.rr.com.
 [173.175.113.3])
 by smtp.gmail.com with ESMTPSA id f26sm942554oop.46.2020.07.09.20.17.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jul 2020 20:17:15 -0700 (PDT)
Subject: Re: [PATCH v3 6/9] drm/bridge: ti-sn65dsi86: Use 18-bit DP if we can
From: Steev Klimaszewski <steev@kali.org>
To: Doug Anderson <dianders@chromium.org>
References: <20191218143416.v3.6.Iaf8d698f4e5253d658ae283d2fd07268076a7c27@changeid>
 <20200710011935.GA7056@gentoo.org>
 <CAD=FV=X3oazamoKR1jHoXm-yCAp9208ahNd8y+NDPt1pU=5xRg@mail.gmail.com>
 <CAD=FV=UWQsGit6XMCzHn5cBRAC9nAaGReDyMzMM2Su02bfiPyQ@mail.gmail.com>
 <dc786abb-4bc2-2416-7ee5-de408aceb8f1@kali.org>
Message-ID: <e0702671-3bed-9e3d-c7f4-d050c617eb65@kali.org>
Date: Thu, 9 Jul 2020 22:17:14 -0500
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <dc786abb-4bc2-2416-7ee5-de408aceb8f1@kali.org>
Content-Language: en-US
X-Mailman-Approved-At: Fri, 10 Jul 2020 07:52:58 +0000
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
Cc: Rob Clark <robdclark@chromium.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Neil Armstrong <narmstrong@baylibre.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Sean Paul <seanpaul@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Steev Klimaszewski <steev@gentoo.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDcvOS8yMCAxMDoxMiBQTSwgU3RlZXYgS2xpbWFzemV3c2tpIHdyb3RlOgo+Cj4gT24gNy85
LzIwIDk6MTQgUE0sIERvdWcgQW5kZXJzb24gd3JvdGU6Cj4+IEhpLAo+Pgo+PiBPbiBUaHUsIEp1
bCA5LCAyMDIwIGF0IDY6MzggUE0gRG91ZyBBbmRlcnNvbiA8ZGlhbmRlcnNAY2hyb21pdW0ub3Jn
PiAKPj4gd3JvdGU6Cj4+PiBIaSwKPj4+Cj4+PiBPbiBUaHUsIEp1bCA5LCAyMDIwIGF0IDY6MTkg
UE0gU3RlZXYgS2xpbWFzemV3c2tpIDxzdGVldkBnZW50b28ub3JnPiAKPj4+IHdyb3RlOgo+Pj4+
IEhpIERvdWcsCj4+Pj4KPj4+PiBJJ3ZlIGJlZW4gdGVzdGluZyA1LjggYW5kIGxpbnV4LW5leHQg
b24gdGhlIExlbm92byBZb2dhIEM2MzAsIGFuZCAKPj4+PiB3aXRoIHRoaXMgcGF0Y2ggYXBwbGll
ZCwgdGhlcmUgaXMgcmVhbGx5IGJhZCBiYW5kaW5nIG9uIHRoZSBkaXNwbGF5Lgo+Pj4+Cj4+Pj4g
SSdtIHJlYWxseSBiYWQgYXQgZXhwbGFpbmluZyBpdCwgYnV0IHlvdSBjYW4gc2VlIHRoZSBkaWZm
ZXJlbmNlcyBpbiAKPj4+PiB0aGUgZm9sbG93aW5nOgo+Pj4+Cj4+Pj4gMjRiaXQgKHByZS01Ljgp
IC0gaHR0cHM6Ly9kZXYuZ2VudG9vLm9yZy9+c3RlZXYvZmlsZXMvaW1hZ2UwLmpwZwo+Pj4+Cj4+
Pj4gMThiaXQgKDUuOC9saW51eC1uZXh0KSAtIAo+Pj4+IGh0dHBzOi8vZGV2LmdlbnRvby5vcmcv
fnN0ZWV2L2ZpbGVzL2ltYWdlMS5qcGcKPj4+IFByZXN1bWFibHkgdGhpcyBtZWFucyB0aGF0IHlv
dXIgcGFuZWwgaXMgZGVmaW5lZCBpbXByb3Blcmx5PyBJZiB0aGUKPj4+IHBhbmVsIHJlcG9ydHMg
dGhhdCBpdCdzIGEgNiBiaXRzIHBlciBwaXhlbCBwYW5lbCBidXQgaXQncyBhY3R1YWxseSBhbgo+
Pj4gOCBiaXRzIHBlciBwaXhlbCBwYW5lbCB0aGVuIHlvdSdsbCBydW4gaW50byB0aGlzIHByb2Js
ZW0uCj4+Pgo+Pj4gSSB3b3VsZCBoYXZlIHRvIGFzc3VtZSB5b3UgaGF2ZSBhIGJ1bmNoIG9mIG91
dCBvZiB0cmVlIHBhdGNoZXMgdG8KPj4+IHN1cHBvcnQgeW91ciBoYXJkd2FyZSBzaW5jZSBJIGRv
bid0IHNlZSBhbnkgZGV2aWNlIHRyZWVzIGluIGxpbnV4bmV4dAo+Pj4gKG90aGVyIHRoYW4gY2hl
emEpIHRoYXQgdXNlIHRoaXMgYnJpZGdlIGNoaXAuwqAgT3RoZXJ3aXNlIEkgY291bGQgdHJ5Cj4+
PiB0byBjaGVjayBhbmQgY29uZmlybSB0aGF0IHdhcyB0aGUgcHJvYmxlbS4KPj4gQWgsIGludGVy
ZXN0aW5nLsKgIE1heWJlIHlvdSBoYXZlIHRoZSBwYW5lbDoKPj4KPj4gYm9lLG52MTMzZmhtLW42
MQo+Pgo+PiBBcyBmYXIgYXMgSSBjYW4gdGVsbCBmcm9tIHRoZSBkYXRhc2hlZXQgKEkgaGF2ZSB0
aGUgc2ltaWxhcgo+PiBib2UsbnYxMzNmaG0tbjYyKSB0aGlzIGlzIGEgNmJwcCBwYW5lbC7CoCAu
Li5idXQgaWYgeW91IGZlZWQgaXQgOGJwcAo+PiB0aGUgYmFuZGluZyBnb2VzIGF3YXkhwqAgTWF5
YmUgdGhlIHBhbmVsIGl0c2VsZiBrbm93cyBob3cgdG8gZGl0aGVyPz8/Cj4+IC4uLm9yIG1heWJl
IHRoZSBkYXRhc2hlZXQgLyBlZGlkIGFyZSB3cm9uZyBhbmQgdGhpcyBpcyBhY3R1YWxseSBhbgo+
PiA4YnBwIHBhbmVsLsKgIFNlZW1zIHVubGlrZWx5Li4uCj4+Cj4+IEluIGFueSBjYXNlLCBvbmUg
Zml4IGlzIHRvIHBpY2sKPj4gPGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2RyaS1kZXZlbC8xNTkz
MDg3NDE5LTkwMy0xLWdpdC1zZW5kLWVtYWlsLWthbHlhbl90QGNvZGVhdXJvcmEub3JnLz4sIAo+
Pgo+PiB0aG91Z2ggcmlnaHQgbm93IHRoYXQgcGF0Y2ggaXMgb25seSBlbmFibGVkIGZvciBzYzcx
ODAuwqAgTWF5YmUgeW91Cj4+IGNvdWxkIGZpZ3VyZSBvdXQgaG93IHRvIGFwcGx5IGl0IHRvIHlv
dXIgaGFyZHdhcmU/Cj4+Cj4+IC4uLmFub3RoZXIgZml4IHdvdWxkIGJlIHRvIHByZXRlbmQgdGhh
dCB5b3VyIHBhbmVsIGlzIDhicHAgZXZlbiB0aG91Z2gKPj4gaXQncyBhY3R1YWxseSA2YnBwLsKg
IElyb25pY2FsbHkgaWYgYW55b25lIGV2ZXIgdHJpZWQgdG8gY29uZmlndXJlIEJQUAo+PiBmcm9t
IHRoZSBFRElEIHRoZXknZCBnbyBiYWNrIHRvIDZicHAuwqAgWW91IGNhbiByZWFkIHRoZSBFRElE
IG9mIHlvdXIKPj4gcGFuZWwgd2l0aCB0aGlzOgo+Pgo+PiBidXM9JChpMmNkZXRlY3QgLWwgfCBn
cmVwIHNuNjUgfCBzZWQgJ3MvaTJjLVwoWzAtOV0qXCkuKiQvXDEvJykKPj4gaTJjZHVtcCAke2J1
c30gMHg1MCBpCj4+Cj4+IFdoZW4gSSBkbyB0aGF0IGFuZCB0aGVuIGRlY29kZSBpdCBvbiB0aGUg
ImJvZSxudjEzM2ZobS1uNjIiIHBhbmVsLCBJIAo+PiBmaW5kOgo+Pgo+PiA2IGJpdHMgcGVyIHBy
aW1hcnkgY29sb3IgY2hhbm5lbAo+Pgo+PiAtRG91Zwo+Cj4KPiBIaSBEb3VnLAo+Cj4gRGVjb2Rp
bmcgaXQgZG9lcyBzaG93IGJlIHRvIGJvZSxudjEzM2ZobS1uNjEgLSBhbmQgeWVhaCBpdCBkb2Vz
IHNheSAKPiBpdCdzIDYtYml0IGFjY29yZGluZyB0byBwYW5lbG9vaydzIHNwZWNzIGZvciBpdC4K
Pgo+Cj4gSSdsbCB0YWtlIGEgbG9vayBhdCB0aGUgcGF0Y2ggYW5kIHNlZSB3aGF0IEkgY2FuIGNv
bWUgdXAgd2l0aC4uLiBhdCAKPiB0aGUgbW9tZW50LCBJJ20gZm9yY2luZyBpdCB0byBiZSA4Yml0
IGFuZCB0aGF0IGRvZXMgIndvcmsgZmluZSIgYnV0IAo+IEknZCBsaWtlIGl0IHRvIGJlIGZpeGVk
IHByb3Blcmx5IGluc3RlYWQgb2YgbXkgaGFjay4KPgo+IFRoYW5rcyBmb3IgeW91ciB0aW1lIGFu
ZCB3b3JrIQo+Cj4gLS0gU3RlZXYKPgpGb3Igd2hhdCBpdCdzIHdvcnRoIC0gdGhlIDUuOCB0aGF0
IEknbSB0ZXN0aW5nIGlzIGF0IApodHRwczovL2dpdGh1Yi5jb20vc3RlZXYvbGludXgvY29tbWl0
cy9jNjMwLTUuOC1yYzQtaW5saW5lLWVuY3J5cHRpb24KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVsCg==
