Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D86CC433DC
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 09:50:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A49D89791;
	Thu, 13 Jun 2019 07:50:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30D7689791
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 07:50:04 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 76AFE20851;
 Thu, 13 Jun 2019 07:50:03 +0000 (UTC)
Date: Thu, 13 Jun 2019 09:50:01 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Helen Koike <helen.koike@collabora.com>
Subject: Re: [PATCH] drm: don't block fb changes for async plane updates
Message-ID: <20190613075001.GD19685@kroah.com>
References: <156007626458164@kroah.com>
 <20190610133627.31923-1-helen.koike@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190610133627.31923-1-helen.koike@collabora.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1560412204;
 bh=XnEL3VlElUWB68j93Q14HwRdvSfpesy69g8LPOA0sHo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rZIMze5xvpEynR+1I1iwFtvEQuz9TKEAHIkA5gRCvuZ6xJU/sK1XaWvw8H3iscQUL
 oXEb+OEfNIcHEZy/vV9QW+SLtua2sqfveZLnVsrIY2WFb5r4HqkBqCasWH21QM62FV
 VLuW37KvucM8ggbwc7jHMmtwvqzkNlTipl4/2xn4=
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
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 stable@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdW4gMTAsIDIwMTkgYXQgMTA6MzY6MjdBTSAtMDMwMCwgSGVsZW4gS29pa2Ugd3Jv
dGU6Cj4gY29tbWl0IDg5YTRhYWMwYWIwZTZmNWVlYTEwZDdiZjQ4NjlkZDE1YzNkZTJjZDQgdXBz
dHJlYW0uCj4gCj4gSW4gdGhlIGNhc2Ugb2YgYSBub3JtYWwgc3luYyB1cGRhdGUsIHRoZSBwcmVw
YXJhdGlvbiBvZiBmcmFtZWJ1ZmZlcnMgKGJlCj4gaXQgY2FsbGluZyBkcm1fYXRvbWljX2hlbHBl
cl9wcmVwYXJlX3BsYW5lcygpIG9yIGRvaW5nIHNldHVwcyB3aXRoCj4gZHJtX2ZyYW1lYnVmZmVy
X2dldCgpKSBhcmUgcGVyZm9ybWVkIGluIHRoZSBuZXdfc3RhdGUgYW5kIHRoZSByZXNwZWN0aXZl
Cj4gY2xlYW51cHMgYXJlIHBlcmZvcm1lZCBpbiB0aGUgb2xkX3N0YXRlLgo+IAo+IEluIHRoZSBj
YXNlIG9mIGFzeW5jIHVwZGF0ZXMsIHRoZSBwcmVwYXJhdGlvbiBpcyBhbHNvIGRvbmUgaW4gdGhl
Cj4gbmV3X3N0YXRlIGJ1dCB0aGUgY2xlYW51cHMgYXJlIGRvbmUgaW4gdGhlIG5ld19zdGF0ZSAo
YmVjYXVzZSB1cGRhdGVzCj4gYXJlIHBlcmZvcm1lZCBpbiBwbGFjZSwgaS5lLiBpbiB0aGUgY3Vy
cmVudCBzdGF0ZSkuCj4gCj4gVGhlIGN1cnJlbnQgY29kZSBibG9ja3MgYXN5bmMgdWRwYXRlcyB3
aGVuIHRoZSBmYiBpcyBjaGFuZ2VkLCB0dXJuaW5nCj4gYXN5bmMgdXBkYXRlcyBpbnRvIHN5bmMg
dXBkYXRlcywgc2xvd2luZyBkb3duIGN1cnNvciB1cGRhdGVzIGFuZAo+IGludHJvZHVjaW5nIHJl
Z3Jlc3Npb25zIGluIGlndCB0ZXN0cyB3aXRoIGVycm9ycyBvZiB0eXBlOgo+IAo+ICJDUklUSUNB
TDogY29tcGxldGVkIDk3IGN1cnNvciB1cGRhdGVkIGluIGEgcGVyaW9kIG9mIDMwIGZsaXBzLCB3
ZQo+IGV4cGVjdCB0byBjb21wbGV0ZSBhcHByb3hpbWF0ZWx5IDE1MzYwIHVwZGF0ZXMsIHdpdGgg
dGhlIHRocmVzaG9sZCBzZXQKPiBhdCA3NjgwIgo+IAo+IEZiIGNoYW5nZXMgaW4gYXN5bmMgdXBk
YXRlcyB3ZXJlIHByZXZlbnRlZCB0byBhdm9pZCB0aGUgZm9sbG93aW5nIHNjZW5hcmlvOgo+IAo+
IC0gQXN5bmMgdXBkYXRlLCBvbGRmYiA9IE5VTEwsIG5ld2ZiID0gZmIxLCBwcmVwYXJlIGZiMSwg
Y2xlYW51cCBmYjEKPiAtIEFzeW5jIHVwZGF0ZSwgb2xkZmIgPSBmYjEsIG5ld2ZiID0gZmIyLCBw
cmVwYXJlIGZiMiwgY2xlYW51cCBmYjIKPiAtIE5vbi1hc3luYyBjb21taXQsIG9sZGZiID0gZmIy
LCBuZXdmYiA9IGZiMSwgcHJlcGFyZSBmYjEsIGNsZWFudXAgZmIyICh3cm9uZykKPiBXaGVyZSB3
ZSBoYXZlIGEgc2luZ2xlIGNhbGwgdG8gcHJlcGFyZSBmYjIgYnV0IGRvdWJsZSBjbGVhbnVwIGNh
bGwgdG8gZmIyLgo+IAo+IFRvIHNvbHZlIHRoZSBhYm92ZSBwcm9ibGVtcywgaW5zdGVhZCBvZiBi
bG9ja2luZyBhc3luYyBmYiBjaGFuZ2VzLCB3ZQo+IHBsYWNlIHRoZSBvbGQgZnJhbWVidWZmZXIg
aW4gdGhlIG5ld19zdGF0ZSBvYmplY3QsIHNvIHdoZW4gdGhlIGNvZGUKPiBwZXJmb3JtcyBjbGVh
bnVwcyBpbiB0aGUgbmV3X3N0YXRlIGl0IHdpbGwgY2xlYW51cCB0aGUgb2xkX2ZiIGFuZCB3ZQo+
IHdpbGwgaGF2ZSB0aGUgZm9sbG93aW5nIHNjZW5hcmlvIGluc3RlYWQ6Cj4gCj4gLSBBc3luYyB1
cGRhdGUsIG9sZGZiID0gTlVMTCwgbmV3ZmIgPSBmYjEsIHByZXBhcmUgZmIxLCBubyBjbGVhbnVw
Cj4gLSBBc3luYyB1cGRhdGUsIG9sZGZiID0gZmIxLCBuZXdmYiA9IGZiMiwgcHJlcGFyZSBmYjIs
IGNsZWFudXAgZmIxCj4gLSBOb24tYXN5bmMgY29tbWl0LCBvbGRmYiA9IGZiMiwgbmV3ZmIgPSBm
YjEsIHByZXBhcmUgZmIxLCBjbGVhbnVwIGZiMgo+IAo+IFdoZXJlIGNhbGxzIHRvIHByZXBhcmUv
Y2xlYW51cCBhcmUgYmFsYW5jZWQuCj4gCj4gQ2M6IDxzdGFibGVAdmdlci5rZXJuZWwub3JnPiAj
IHY0LjE0Kwo+IEZpeGVzOiAyNWRjMTk0YjM0ZGQgKCJkcm06IEJsb2NrIGZiIGNoYW5nZXMgZm9y
IGFzeW5jIHBsYW5lIHVwZGF0ZXMiKQo+IFN1Z2dlc3RlZC1ieTogQm9yaXMgQnJlemlsbG9uIDxi
b3Jpcy5icmV6aWxsb25AY29sbGFib3JhLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBIZWxlbiBLb2lr
ZSA8aGVsZW4ua29pa2VAY29sbGFib3JhLmNvbT4KPiBSZXZpZXdlZC1ieTogQm9yaXMgQnJlemls
bG9uIDxib3Jpcy5icmV6aWxsb25AY29sbGFib3JhLmNvbT4KPiBSZXZpZXdlZC1ieTogTmljaG9s
YXMgS2F6bGF1c2thcyA8bmljaG9sYXMua2F6bGF1c2thc0BhbWQuY29tPgo+IFNpZ25lZC1vZmYt
Ynk6IEJvcmlzIEJyZXppbGxvbiA8Ym9yaXMuYnJlemlsbG9uQGNvbGxhYm9yYS5jb20+Cj4gTGlu
azogaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3BhdGNoL21zZ2lkLzIwMTkwNjAz
MTY1NjEwLjI0NjE0LTYtaGVsZW4ua29pa2VAY29sbGFib3JhLmNvbQo+IC0tLQo+IAo+IEhpLAo+
IAo+IFRoaXMgcGF0Y2ggZmFpbGVkIHRvIGFwcGx5IG9uIGtlcm5lbCBzdGFibGUgdjQuMTQsIEkn
bSByZS1zZW5kaW5nIGl0Cj4gZml4aW5nIHRoZSBjb25mbGljdC4KCk5vdyBhcHBsaWVkLCB0aGFu
a3MuCgpncmVnIGstaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
