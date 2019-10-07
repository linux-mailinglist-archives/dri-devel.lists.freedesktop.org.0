Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF55CEE66
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2019 23:27:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25A576E0E8;
	Mon,  7 Oct 2019 21:27:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A2626E0E8
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2019 21:27:13 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id j11so11178325wrp.1
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Oct 2019 14:27:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+8WHnqHPGHetk5a2zp8iHSZwK2TQo9c5ejvOe0oNFMg=;
 b=SZjP+W85YCTKhddyQoHB1bJNxG36xPqtCui3fN4B48/xgkSO1d9BtRYS6m22UYboAn
 cxUdY4LElIllFPopea0x+VvIW8sCNxOYbcdkc1IrCEVMVer/Yo612lWgLkMiy5otMzYd
 xFDprSawXJhB/gL+0REgzlhUbDmu0dt1bXqxO41lX1dLvAFXOou4Et+kOLAEFSk5g5L9
 VwjTxP/nrrGnEbXj1o14ifjeIbZweKyHZAEtzXTY5pg4iYIijUSghYY8Sx0yRf7OWH4w
 H0H0RaufotyCGvWwE14t+zeVVKMaWBg/mBiU94LG914KNod4ube6TcbHicrq9S9XNwE7
 EKBw==
X-Gm-Message-State: APjAAAVTdGKJZADeW2CjU3jLDgTEBYYfZmG4pm3upzpq3nIhO4pHPtuY
 uHqcmuuoSDUbUSX+9faPqqwzy2+WheSPuMJ1KD/+iQ==
X-Google-Smtp-Source: APXvYqyOYxJmSNS/HbH+PJUrgfD/Y/yCZlDImNd5GT/+xSfVS9D2D2PyIq3Xm1+PVkS3xMEmRiURpxxALcERacqIaqI=
X-Received: by 2002:adf:fc07:: with SMTP id i7mr9284755wrr.50.1570483631796;
 Mon, 07 Oct 2019 14:27:11 -0700 (PDT)
MIME-Version: 1.0
References: <20191007211830.42838-1-john.stultz@linaro.org>
 <20191007211830.42838-2-john.stultz@linaro.org>
 <ad064efe-4d86-3b81-ace2-152e90c72e94@infradead.org>
In-Reply-To: <ad064efe-4d86-3b81-ace2-152e90c72e94@infradead.org>
From: John Stultz <john.stultz@linaro.org>
Date: Mon, 7 Oct 2019 14:27:00 -0700
Message-ID: <CALAqxLV_ioD3ZnOQXP3YfixdC+zr=Bht4jkdLGHKViX_8smztA@mail.gmail.com>
Subject: Re: [PATCH v10 1/5] dma-buf: Add dma-buf heaps framework
To: Randy Dunlap <rdunlap@infradead.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=+8WHnqHPGHetk5a2zp8iHSZwK2TQo9c5ejvOe0oNFMg=;
 b=iRR2Xad8P3jKRgIZbf0Ci7pHA2GsQ8Uph1o2h1yDvXlqByGUCl3ouzt69oBBHaQcet
 Ed0hPQp9MY970Sc3pOnKr/alZnEVJSA8MLiQkKeIMr48eZVSlFD7HRkgig1Kpws+52GR
 jfenwn7/lHlrE739CljIHkwj3XvwIrF2Ai15YwLZ6f+MAk+2iCWGQAVKK5WjnM72Rlx2
 oNxO/+4FZ6QbvJExJpbivel7NWWrgv9fxxRy+aqZFC3UIB+bjmrUhj9OVZK74NlsmMgg
 kH/xOQD9Jcrqv46vFnJ3Ku5x1+GWbTdH/wDR6qmVuVnzS8MTGx3VFCp0MqbmBEGTEpJC
 /Z/w==
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
Cc: Hillf Danton <hdanton@sina.com>, Sudipto Paul <Sudipto.Paul@arm.com>,
 Vincent Donnefort <Vincent.Donnefort@arm.com>, Chenbo Feng <fengc@google.com>,
 lkml <linux-kernel@vger.kernel.org>, Liam Mark <lmark@codeaurora.org>,
 "Andrew F. Davis" <afd@ti.com>, Christoph Hellwig <hch@infradead.org>,
 Alistair Strachan <astrachan@google.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Hridya Valsaraju <hridya@google.com>, Pratik Patel <pratikp@codeaurora.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBPY3QgNywgMjAxOSBhdCAyOjIxIFBNIFJhbmR5IER1bmxhcCA8cmR1bmxhcEBpbmZy
YWRlYWQub3JnPiB3cm90ZToKPiBPbiAxMC83LzE5IDI6MTggUE0sIEpvaG4gU3R1bHR6IHdyb3Rl
Ogo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZG1hLWJ1Zi9LY29uZmlnIGIvZHJpdmVycy9kbWEt
YnVmL0tjb25maWcKPiA+IGluZGV4IGEyM2I2NzUyZDExYS4uNmU5YzdjNGQ3NDQ3IDEwMDY0NAo+
ID4gLS0tIGEvZHJpdmVycy9kbWEtYnVmL0tjb25maWcKPiA+ICsrKyBiL2RyaXZlcnMvZG1hLWJ1
Zi9LY29uZmlnCj4gPiBAQCAtNDQsNCArNDQsMTMgQEAgY29uZmlnIERNQUJVRl9TRUxGVEVTVFMK
PiA+ICAgICAgIGRlZmF1bHQgbgo+ID4gICAgICAgZGVwZW5kcyBvbiBETUFfU0hBUkVEX0JVRkZF
Ugo+ID4KPiA+ICttZW51Y29uZmlnIERNQUJVRl9IRUFQUwo+ID4gKyAgICAgYm9vbCAiRE1BLUJV
RiBVc2VybGFuZCBNZW1vcnkgSGVhcHMiCj4gPiArICAgICBzZWxlY3QgRE1BX1NIQVJFRF9CVUZG
RVIKPiA+ICsgICAgIGhlbHAKPiA+ICsgICAgICAgQ2hvb3NlIHRoaXMgb3B0aW9uIHRvIGVuYWJs
ZSB0aGUgRE1BLUJVRiB1c2VybGFuZCBtZW1vcnkgaGVhcHMsCj4KPiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaGVhcHMu
Cj4KPiA+ICsgICAgICAgdGhpcyBvcHRpb25zIGNyZWF0ZXMgcGVyIGhlYXAgY2hhcmRldnMgaW4g
L2Rldi9kbWFfaGVhcC8gd2hpY2gKPgo+ICAgICAgICAgICBUaGlzCj4KPiA+ICsgICAgICAgYWxs
b3dzIHVzZXJzcGFjZSB0byB1c2UgdG8gYWxsb2NhdGUgZG1hLWJ1ZnMgdGhhdCBjYW4gYmUgc2hh
cmVkCj4KPiA/PyAgICAgICAgICAgICAgICAgICAgICAgICB0byBhbGxvY2F0ZSAmIHVzZQoKSSB0
aGluayB0aGUgInRvIHVzZSIgd2FzIGp1c3QgZXh0cmFuZW91cy4gSSdsbCBkcm9wIGl0LgoKVGhh
bmtzIGZvciBjYXRjaGluZyB0aGVzZS4gSSdsbCBmaXggdGhlbSB1cCBhbmQgcmVzcGluIHYxMSBs
YXRlciB0aGlzIHdlZWsuCgp0aGFua3MKLWpvaG4KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
