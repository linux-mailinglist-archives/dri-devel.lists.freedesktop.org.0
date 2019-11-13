Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 10DD8FB36E
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2019 16:15:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25A736ED46;
	Wed, 13 Nov 2019 15:15:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa44.google.com (mail-vk1-xa44.google.com
 [IPv6:2607:f8b0:4864:20::a44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A80F6ED46
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 15:15:50 +0000 (UTC)
Received: by mail-vk1-xa44.google.com with SMTP id d10so647262vke.3
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 07:15:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Tdx64IKqxKujdLSoPw+cjx2+bVR8WBgZkb8xil7EtMM=;
 b=sp7qQloxnc6TlhyMKhtKP6WhGz1KbM+CwyyQakPya+T1jhaE34l26Jpq2s3BJ5i3Fm
 BtgTuVfgjSyBT1eLeqyEvvnlZ5oCVSPIb00X2OaO3yUYSWVFwoYVw6zJpOtqpXcS2p6n
 WFY8feImjbuvTNHfDcxASGYshZIUNXXkvBTfYIZNT5IAkvBQE1RHA9Ra9EkVF0Htw5j/
 iaT+aNBufK9aAGNxkEOK9XRF1fJcKbuVxv6VltWoQ+KzqlYHGh0ArRF5AXndlEsMEuwu
 C33XfZ61FkSwXDuwRUvnMQ1YZ9SCA4/S+EbeXYHBM91RYemXTjhRWcgd+SAdZ3q9CJnI
 eodg==
X-Gm-Message-State: APjAAAWvnAtb6IpunjwbZmXko9zzWkSbETFr5/8FzEypR30dH9efFCo6
 TG5szGjdn6ZqQg50G2bxSgqF0g/Aj3m8BFqDc/0=
X-Google-Smtp-Source: APXvYqwwACa+02CrVM7lnQq8G9xOFlxb696P1JSOC3QIO3M+yBf6hT1VsVmH1ipJUkNQQy14paArRCJowFOcazun1gI=
X-Received: by 2002:a1f:a1ce:: with SMTP id k197mr1986349vke.28.1573658149379; 
 Wed, 13 Nov 2019 07:15:49 -0800 (PST)
MIME-Version: 1.0
References: <20191106163031.808061-1-adrian.ratiu@collabora.com>
 <20191106163031.808061-3-adrian.ratiu@collabora.com>
In-Reply-To: <20191106163031.808061-3-adrian.ratiu@collabora.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Wed, 13 Nov 2019 15:15:22 +0000
Message-ID: <CACvgo51TpL1GMwf-QFidsbAQ-GiE6ry+QHwmi9x0Nen9Gg4B1g@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] drm: bridge: dw_mipi_dsi: abstract register access
 using reg_fields
To: Adrian Ratiu <adrian.ratiu@collabora.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=Tdx64IKqxKujdLSoPw+cjx2+bVR8WBgZkb8xil7EtMM=;
 b=Kiaj0N5S0qYuVlCpJBh03NNDuyWtcNFnOuJsukl9zdoiOeFcx8h4ED9IUaW/x4fITZ
 tYZ0Le24vH3+ac2xQ/6lGGC+9jq9R+JXkAVb5c8k/UtUgtPpEpiU3ULFRARyfY4dFdqg
 tZQdf67Tiwl23gMVa1lI8+BqS//VN6Y3kNX+XkjvoQN1V6JXq6UoiUXJjuRTOqHPXEdM
 jzzP+kAZDU9zY+J/O0raG0KPLhX41af5R0cHcBJUk+o7penJeGbFwOkqh+BP1+OyA5fe
 yr0GyhqxCK9Lej974x047/O+3wkrx097s9AYydjrreC5U2UMB99SKacR5BccrvtPV/iS
 XFzw==
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 linux-rockchip <linux-rockchip@lists.infradead.org>,
 Boris Brezillon <boris.brezillon@collabora.com>, kernel@collabora.com,
 linux-stm32@st-md-mailman.stormreply.com,
 LAKML <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQWRyaWFuLAoKT24gV2VkLCA2IE5vdiAyMDE5IGF0IDE2OjMxLCBBZHJpYW4gUmF0aXUgPGFk
cmlhbi5yYXRpdUBjb2xsYWJvcmEuY29tPiB3cm90ZToKPgo+IFJlZ2lzdGVyIGV4aXN0ZW5jZSwg
YWRkcmVzcy9vZmZzZXRzLCBmaWVsZCBsYXlvdXRzLCByZXNlcnZlZCBiaXRzIGFuZAo+IHNvIG9u
IGRpZmZlciBiZXR3ZWVuIE1JUEktRFNJIHZlcnNpb25zIGFuZCBiZXR3ZWVuIFNvQyB2ZW5kb3Ig
Ym9hcmRzLgo+IERlc3BpdGUgdGhlc2UgZGlmZmVyZW5jZXMgdGhlIGh3IElQIGFuZCBwcm90b2Nv
bHMgYXJlIG1vc3RseSB0aGUgc2FtZQo+IHNvIHRoZSBnZW5lcmljIGRyaXZlciBjYW4gYmUgbWFk
ZSB0byBjb21wZW5zYXRlIHRoZXNlIGRpZmZlcmVuY2VzLgo+Cj4gVGhlIGN1cnJlbnQgUm9ja2No
aXAgYW5kIFNUTSBkcml2ZXJzIGhhcmRjb2RlZCBhIGxvdCBvZiB0aGVpciBjb21tb24KPiBkZWZp
bml0aW9ucyBpbiB0aGUgYnJpZGdlIGNvZGUgYmVjYXVzZSB0aGV5J3JlIGJhc2VkIG9uIERTSSB2
MS4zMCBhbmQKPiAxLjMxIHdoaWNoIGFyZSByZWxhdGl2ZWx5IGNsb3NlLCBidXQgaW4gb3JkZXIg
dG8gc3VwcG9ydCBvbGRlci9mdXR1cmUKPiB2ZXJzaW9ucyB3aXRoIG1vcmUgZGl2ZXJnaW5nIGxh
eW91dHMgbGlrZSB0aGUgdjEuMDEgcHJlc2VudCBvbiBpbXg2LAo+IHdlIGFic3RyYWN0IHNvbWUg
b2YgdGhlIHJlZ2lzdGVyIGFjY2Vzc2VzIHZpYSB0aGUgcmVnbWFwIGZpZWxkIEFQSXMuCj4KPiBU
aGUgYnJpZGdlIGRldGVjdHMgdGhlIERTSSBjb3JlIHZlcnNpb24gYW5kIGluaXRpYWxpemVzIHRo
ZSByZXF1aXJlZAo+IHJlZ21hcCByZWdpc3RlciBsYXlvdXQsIHNvIHBsYXRmb3JtIGRyaXZlcnMg
d2lsbCBjb250aW51ZSB0byB1c2UgdGhlCj4gcmVnbWFwIGFzIGJlZm9yZS4gT3RoZXIgRFNJIHZl
cnNpb25zIC8gcmVnaXN0ZXIgbGF5b3V0cyBjYW4gZWFzaWx5IGJlCj4gYWRkZWQgaW4gdGhlIGZ1
dHVyZSBieSBvbmx5IGNoYW5naW5nIHRoZSBicmlkZ2UgY29kZS4KPgo+IEFuIGFkZGl0aW9uYWwg
YmVuZWZpdCBvZiB1c2luZyB0aGUgcmVnX2ZpZWxkIEFQSSBpcyB0aGF0IG11Y2ggb2YgdGhlCj4g
Yml0LXNoaWZ0aW5nIGFuZCBtYXNraW5nIGJvaWxlcnBsYXRlIGlzIHJlbW92ZWQgYmVjYXVzZSBp
dCdzIG5vdwo+IGhhbmRsZWQgYXV0b21hdGljYWxseSBieSB0aGUgcmVnbWFwIHN1YnN5c3RlbS4K
Pgo+IE5vdCBhbGwgcmVnaXN0ZXIgYWNjZXNzZXMgaGF2ZSBiZWVuIGNvbnZlcnRlZDogb25seSB0
aGUgbWluaW11bSBkaWZmCj4gYmV0d2VlbiB0aGUgdGhyZWUgaG9zdCBjb250cm9sbGVyIHZlcnNp
b25zIHN1cHBvcnRlZCBieSB0aGUgY3VycmVudAo+IHZlbmRvciBwbGF0Zm9ybSBkcml2ZXJzIChy
b2NrY2hpcCwgc3RtIGFuZCBub3cgaW14KSwgbW9yZSBjYW4gYmUgYWRkZWQKPiBpbiB0aGUgZnV0
dXJlIGFzIG5lZWRlZC4KPgo+IFN1Z2dlc3RlZC1ieTogQm9yaXMgQnJlemlsbG9uIDxib3Jpcy5i
cmV6aWxsb25AY29sbGFib3JhLmNvbT4KPiBSZXZpZXdlZC1ieTogTmVpbCBBcm1zdHJvbmcgPG5h
cm1zdHJvbmdAYmF5bGlicmUuY29tPgo+IFJldmlld2VkLWJ5OiBFbWlsIFZlbGlrb3YgPGVtaWwu
bC52ZWxpa292QGdtYWlsLmNvbT4KCldpdGggdGhlIGV4dHJhIGNvbnN0IG1lbnRpb25lZCBiZWxv
dyB0aGUgcGF0Y2ggaXM6ClJldmlld2VkLWJ5OiBFbWlsIFZlbGlrb3YgPGVtaWwudmVsaWtvdkBj
b2xsYWJvcmEuY29tPgoKPiArCj4gK3N0YXRpYyBzdHJ1Y3QgZHdfbWlwaV9kc2lfdmFyaWFudCBk
d19taXBpX2RzaV92MTMwX3YxMzFfbGF5b3V0ID0gewpJdCdzIGEgbm9uLWNvbnN0IGhlcmUsIHdo
aWxlIHdlIGNvbnNpZGVyIGl0IGEgY29uc3QgYmVsb3cuIEknZCBhZGQgdGhlIGV4cGxpY2l0CmNv
bnN0IGRlY2xhcmF0aW9uIGhlcmUuCgo+ICsjZGVmaW5lIElOSVRfRklFTEQoZikgSU5JVF9GSUVM
RF9DRkcoZmllbGRfIyNmLCBjZmdfIyNmKQo+ICsjZGVmaW5lIElOSVRfRklFTERfQ0ZHKGYsIGNv
bmYpICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ICsg
ICAgICAgZG8geyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIFwKPiArICAgICAgICAgICAgICAgZHNpLT5mID0gZGV2bV9yZWdtYXBfZmll
bGRfYWxsb2MoZHNpLT5kZXYsIGRzaS0+cmVncywgICBcCj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHZhcmlhbnQtPmNvbmYpOyAgICAgICAgXAo+ICsg
ICAgICAgICAgICAgICBpZiAoSVNfRVJSKGRzaS0+ZikpICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIFwKPiArICAgICAgICAgICAgICAgICAgICAgICBkZXZfd2Fybihkc2ktPmRl
diwgIklnbm9yaW5nIHJlZ21hcCBmaWVsZCAiICNmICJcbiIpOyBcCj4gKyAgICAgICB9IHdoaWxl
ICgwKQo+ICsKPiArc3RhdGljIGludCBkd19taXBpX2RzaV9yZWdtYXBfZmllbGRzX2luaXQoc3Ry
dWN0IGR3X21pcGlfZHNpICpkc2kpCj4gK3sKPiArICAgICAgIGNvbnN0IHN0cnVjdCBkd19taXBp
X2RzaV92YXJpYW50ICp2YXJpYW50ID0gJmR3X21pcGlfZHNpX3YxMzBfdjEzMV9sYXlvdXQ7Cj4g
KwoKSGF2aW5nIGEgY2xvc2VyIGxvb2sgYXQgdGhlIGNvbnN0LW5lc3MgdGhpbmc6CmRldm1fcmVn
bWFwX2ZpZWxkX2FsbG9jKCkgdXNlcyBhIHJlYWQvd3JpdGUgY29weSBvZiB0aGUgcmVnX2ZpZWxk
IHN0cnVjdCAoNQp1bnNpZ25lZCBpbnRzKSwgZXZlbiB0aG91Z2ggaXQgb25seSB1c2VzIHRoZW0g
YXMgcmVhZC1vbmx5LiBBIHNlbnNpYmxlIHdheSB0bwppbXByb3ZlIGlzIGlzIHRvIHBhc3MgYSAi
Y29uc3Qgc3RydWN0IHJlZ19maWVsZCAqIiBpbnN0ZWFkLgoKQnV0IHRoYXQgZm9yIGFub3RoZXIg
ZGF5IC4uLiBtaWdodCBiZSB3b3J0aCBhZGRpbmcgYSBuZXdiaWUgcmVnbWFwIHRhc2sgZm9yLCBp
Zgp5b3UgY2FuIHNlZSB3aGVyZSB0byBmaWxlIHRoYXQuCgoKLUVtaWwKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
