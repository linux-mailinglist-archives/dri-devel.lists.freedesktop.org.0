Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E9DA4347C
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 11:08:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 340D78946E;
	Thu, 13 Jun 2019 09:08:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D03A8946E
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 09:08:19 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id p26so26089109edr.2
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 02:08:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=oGEIi8ZbA4ElBKoNoWg8Zqmm+0W4iEZ9Wl2E4vqqzu4=;
 b=SS3uQGCsfuaVVMcSYewgS3qOgEpFzxI6Ab14uFyDtQSbWZM0MhCq362D46U2mjdgw7
 zupxOhuqeAczY0BRl1qRSnQ1nIZ3yxzBSMQHgM2Ks5Kj18B/jGfFuV8Ckm8lGEXROEoZ
 D051QY+YXLqpLaJDx0uLmDAag6pEXqo9EVZN7bJOdG5l+1TszVhrPyiYTYha49V+6PMu
 jVbDYqt7bd/14+iM70nD2opRFh49XfVrKVQ8ybqBH0Aqe67tZ7ABNRyXd2BIiK0bnvpC
 ALvF4yUDQZpXWdhsLlNNuZVbRDoRj2e0ePZYqWq7zfJY6qeiCzW9pXRerNkBx4zH3Qd2
 jM8Q==
X-Gm-Message-State: APjAAAVObrLy5GbMaVnLy89XOq3aZf0uPJKGFlrKcEVNbl76D1aqtq2O
 J5m1FUVs0kCMN7yWCmCUMA6/4Q==
X-Google-Smtp-Source: APXvYqydkA6pzT/U0/NpSQ7oV3DnmdRZaVFlX0FJYEsGCpXnNScbZQ+PXN4JLY8tF6ss3+ZxAaGP9g==
X-Received: by 2002:a50:aa7c:: with SMTP id p57mr44549776edc.179.1560416898007; 
 Thu, 13 Jun 2019 02:08:18 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id w7sm436487ejn.92.2019.06.13.02.08.16
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 13 Jun 2019 02:08:16 -0700 (PDT)
Date: Thu, 13 Jun 2019 11:08:14 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Liviu Dudau <Liviu.Dudau@arm.com>
Subject: Re: [PATCH v2 2/2] drm/komeda: Adds komeda_kms_drop_master
Message-ID: <20190613090814.GJ23020@phenom.ffwll.local>
Mail-Followup-To: Liviu Dudau <Liviu.Dudau@arm.com>,
 "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>,
 "Lowry Li (Arm Technology China)" <Lowry.Li@arm.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "seanpaul@chromium.org" <seanpaul@chromium.org>,
 "airlied@linux.ie" <airlied@linux.ie>,
 Brian Starkey <Brian.Starkey@arm.com>,
 Ayan Halder <Ayan.Halder@arm.com>,
 "Jonathan Chai (Arm Technology China)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Julien Yin (Arm Technology China)" <Julien.Yin@arm.com>,
 nd <nd@arm.com>
References: <1560251589-31827-1-git-send-email-lowry.li@arm.com>
 <1560251589-31827-3-git-send-email-lowry.li@arm.com>
 <20190611123038.GC2458@phenom.ffwll.local>
 <20190612022617.GA8595@james-ThinkStation-P300>
 <20190613081727.GE23020@phenom.ffwll.local>
 <20190613082813.GM4173@e110455-lin.cambridge.arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190613082813.GM4173@e110455-lin.cambridge.arm.com>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=oGEIi8ZbA4ElBKoNoWg8Zqmm+0W4iEZ9Wl2E4vqqzu4=;
 b=afRoLu+5c04elHJ9uSoU2wVJnLiY9rPJ9vYsrVBioEbs51ckV/BunuGGpEgJFvzl0l
 I1R/fsNKud2MVuDRx41d91f6KvBM1srcUoi9bm980sFG3jlIS6+Yl9Iz3IW2NPNrv+dJ
 GarwtuEbHx4dlM9c/5rvuXuCEdW7ReVjVeu8I=
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
Cc: nd <nd@arm.com>, Ayan Halder <Ayan.Halder@arm.com>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "Jonathan Chai \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Julien Yin \(Arm Technology China\)" <Julien.Yin@arm.com>,
 "seanpaul@chromium.org" <seanpaul@chromium.org>,
 "james qian wang \(Arm Technology China\)" <james.qian.wang@arm.com>,
 "Lowry Li \(Arm Technology China\)" <Lowry.Li@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdW4gMTMsIDIwMTkgYXQgMDk6Mjg6MTNBTSArMDEwMCwgTGl2aXUgRHVkYXUgd3Jv
dGU6Cj4gT24gVGh1LCBKdW4gMTMsIDIwMTkgYXQgMTA6MTc6MjdBTSArMDIwMCwgRGFuaWVsIFZl
dHRlciB3cm90ZToKPiA+IE9uIFdlZCwgSnVuIDEyLCAyMDE5IGF0IDAyOjI2OjI0QU0gKzAwMDAs
IGphbWVzIHFpYW4gd2FuZyAoQXJtIFRlY2hub2xvZ3kgQ2hpbmEpIHdyb3RlOgo+ID4gPiBPbiBU
dWUsIEp1biAxMSwgMjAxOSBhdCAwMjozMDozOFBNICswMjAwLCBEYW5pZWwgVmV0dGVyIHdyb3Rl
Ogo+ID4gPiA+IE9uIFR1ZSwgSnVuIDExLCAyMDE5IGF0IDExOjEzOjQ1QU0gKzAwMDAsIExvd3J5
IExpIChBcm0gVGVjaG5vbG9neSBDaGluYSkgd3JvdGU6Cj4gPiA+ID4gPiBGcm9tOiAiTG93cnkg
TGkgKEFybSBUZWNobm9sb2d5IENoaW5hKSIgPExvd3J5LkxpQGFybS5jb20+Cj4gPiA+ID4gPgo+
ID4gPiA+ID4gVGhlIGtvbWVkYSBpbnRlcm5hbCByZXNvdXJjZXMgKHBpcGVsaW5lcykgYXJlIHNo
YXJlZCBiZXR3ZWVuIGNydGNzLAo+ID4gPiA+ID4gYW5kIHJlc291cmNlcyByZWxlYXNlIGJ5IGRp
c2FibGVfY3J0Yy4gVGhpcyBjb21taXQgaXMgd29ya2luZyBmb3Igb25jZQo+ID4gPiA+ID4gdXNl
ciBmb3Jnb3QgZGlzYWJsaW5nIGNydGMgbGlrZSBhcHAgcXVpdCBhYm5vbWFsbHksIGFuZCB0aGVu
IHRoZQo+ID4gPiA+ID4gcmVzb3VyY2VzIGNhbiBub3QgYmUgdXNlZCBieSBhbm90aGVyIGNydGMu
IEFkZHMgZHJvcF9tYXN0ZXIgdG8KPiA+ID4gPiA+IHNodXRkb3duIHRoZSBkZXZpY2UgYW5kIG1h
a2Ugc3VyZSBhbGwgdGhlIGtvbWVkYSByZXNvdXJjZXMgaGF2ZSBiZWVuCj4gPiA+ID4gPiByZWxl
YXNlZCBhbmQgY2FuIGJlIHVzZWQgZm9yIHRoZSBuZXh0IHVzYWdlLgo+ID4gPiA+ID4KPiA+ID4g
PiA+IFNpZ25lZC1vZmYtYnk6IExvd3J5IExpIChBcm0gVGVjaG5vbG9neSBDaGluYSkgPGxvd3J5
LmxpQGFybS5jb20+Cj4gPiA+ID4gPiAtLS0KPiA+ID4gPiA+ICBkcml2ZXJzL2dwdS9kcm0vYXJt
L2Rpc3BsYXkva29tZWRhL2tvbWVkYV9rbXMuYyB8IDEzICsrKysrKysrKysrKysKPiA+ID4gPiA+
ICAxIGZpbGUgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKQo+ID4gPiA+ID4KPiA+ID4gPiA+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9rbXMu
YyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2ttcy5jCj4gPiA+
ID4gPiBpbmRleCA4NTQzODYwLi42NDdiY2U1IDEwMDY0NAo+ID4gPiA+ID4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfa21zLmMKPiA+ID4gPiA+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2ttcy5jCj4gPiA+ID4g
PiBAQCAtNTQsMTEgKzU0LDI0IEBAIHN0YXRpYyBpcnFyZXR1cm5fdCBrb21lZGFfa21zX2lycV9o
YW5kbGVyKGludCBpcnEsIHZvaWQgKmRhdGEpCj4gPiA+ID4gPiAgcmV0dXJuIHN0YXR1czsKPiA+
ID4gPiA+ICB9Cj4gPiA+ID4gPgo+ID4gPiA+ID4gKy8qIEtvbWVkYSBpbnRlcm5hbCByZXNvdXJj
ZXMgKHBpcGVsaW5lcykgYXJlIHNoYXJlZCBiZXR3ZWVuIGNydGNzLCBhbmQgcmVzb3VyY2VzCj4g
PiA+ID4gPiArICogYXJlIHJlbGVhc2VkIGJ5IGRpc2FibGVfY3J0Yy4gQnV0IGlmIHVzZXIgZm9y
Z2V0IGRpc2FibGluZyBjcnRjIGxpa2UgYXBwIHF1aXQKPiA+ID4gPiA+ICsgKiBhYm5vcm1hbGx5
LCB0aGUgcmVzb3VyY2VzIGNhbiBub3QgYmUgdXNlZCBieSBhbm90aGVyIGNydGMuCj4gPiA+ID4g
PiArICogVXNlIGRyb3BfbWFzdGVyIHRvIHNodXRkb3duIHRoZSBkZXZpY2UgYW5kIG1ha2Ugc3Vy
ZSBhbGwgdGhlIGtvbWVkYSByZXNvdXJjZXMKPiA+ID4gPiA+ICsgKiBoYXZlIGJlZW4gcmVsZWFz
ZWQsIGFuZCBjYW4gYmUgdXNlZCBmb3IgdGhlIG5leHQgdXNhZ2UuCj4gPiA+ID4gPiArICovCj4g
PiA+ID4KPiA+ID4gPiBOby4gSWYgd2Ugd2FudCB0aGlzLCB3ZSBuZWVkIHRvIGltcGxlbWVudCB0
aGlzIGFjcm9zcyBkcml2ZXJzLCBub3Qgd2l0aAo+ID4gPiA+IHBlci12ZW5kb3IgaGFja3MuCj4g
PiA+ID4KPiA+ID4gPiBUaGUga2VybmVsZG9jIHNob3VsZCBoYXZlIGJlZW4gYSBzb2xpZCBoaW50
OiAiT25seSB1c2VkIGJ5IHZtd2dmeC4iCj4gPiA+ID4gLURhbmllbAo+ID4gPiAKPiA+ID4gSGkg
RGFuaWVsOgo+ID4gPiBUaGlzIGRyb3BfbWFzdGVyIGlzIHJlYWxseSB3aGF0IHdlIHdhbnQsIGNh
biB3ZSB1cGRhdGUgdGhlIGRvYyBhbmQKPiA+ID4gYWRkIGtvbWVkYSBhcyBhIHVzZXIgb2YgdGhp
cyBoYWNrcyBsaWtlICJ1c2VkIGJ5IHZtd2ZneCBhbmQga29tZWRhIiwKPiA+ID4gb3IgbWF5YmUg
ZGlyZWN0bHkgcHJvbW90ZSB0aGlzIHBlci12ZW5kb3IgaGFja3MgYXMgYW4gb3B0aW9uYWwgY2hp
cAo+ID4gPiBmdW5jdGlvbiA/Cj4gPiAKPiA+IFN0aWxsIG5vLCBiZWNhdXNlIGl0IHdvdWxkIG1l
YW4gZGlmZmVyZW50IGJlaGF2aW91ciBmb3IgYXJtL2tvbWVkYQo+ID4gY29tcGFyZWQgdG8gZXZl
cnlvbmUgZWxzZS4gQW5kIHdlIHJlYWxseSBkb24ndCB3YW50IHRoaXMsIGJlY2F1c2UgdGhpcwo+
ID4gd291bGQgY29tcGxldGVseSBicmVhayBmbGlja2VyLWxlc3MgdnQtc3dpdGNoaW5nLgo+ID4g
Cj4gPiBDdXJyZW50bHkgdGhlIG9ubHkgZmFsbGJhY2sgZm9yIHRoaXMgY2FzZSBpcyB0aGUgbGFz
dGNsb3NlIGhhbmRsZXIsIHdoaWNoCj4gPiBhdG0ganVzdCByZXN0b3JlcyBmYmNvbi9mYmRldi4g
SWYgeW91IHdhbnQgdG8gY2hhbmdlL2V4dGVuZCB0aGF0IHRvIHdvcmsKPiA+IHdpdGhvdXQgZmJk
ZXYsIHRoZW4gdGhhdCdzIHRoZSBwbGFjZSB0byBkbyB0aGUgY2hhbmdlLiBBbmQgYWNyb3NzIF9h
bGxfCj4gPiBkcm0ga21zIGRyaXZlcnMsIHNvIHRoYXQgd2UgaGF2ZSBjb25zaXN0ZW50IGJlaGF2
aW91ci4KPiAKPiBTbGlnaHRseSB1bnJlbGF0ZWQsIGp1c3QgdGhpbmtpbmcgb2YgYSBzb2x1dGlv
biBhbmQgd2FudGVkIGNvbmZpcm1hdGlvbi9kb3VibGUKPiBjaGVja2luZzogY2FuIGEgQ1JUQyBi
ZSBpbnN0YW50aWF0ZWQgd2l0aG91dCBhbnkgcGxhbmVzIChvciB3aXRob3V0IGEgcHJpbWFyeQo+
IHBsYW5lKT8KCldpdGhvdXQgYSBwcmltYXJ5IHBsYW5lIG1heWJlIG5vdCBzbyByZWNvbW1lbmRl
ZCwgYmVjYXVzZSBpdCB3b3VsZCBicmVhawphbGwgdGhlIGxlZ2FjeSB1c2Vyc3BhY2UuIE1pZ2h0
IGV2ZW4gcmVzdWx0IGluIHNvbWUgb29wc2VzLCBub3Qgc3VyZSB3ZQpjaGVjayBmb3IgY3J0Yy0+
cHJpbWFyeSAhPSBOVUxMLgoKSSdtIG5vdCBzdXJlIHdoYXQgeW91IG1lYW4gYWJvdXQgaW5zdGFu
dGlhdGluZyBpdCB3aXRob3V0IGFueSBwbGFuZSBhdAphbGwuIFRoYXQgd291bGQgYmUgcmF0aGVy
IHVzZWxlc3MuCi1EYW5pZWwKCj4gCj4gQmVzdCByZWdhcmRzLAo+IExpdml1Cj4gCj4gPiAKPiA+
IGttcyBpcyBhIGNyb3NzLXZlbmRvciBhcGksIHZlbmRvciBoYWNrcyBhcmUgdmVyeSwgdmVyeSBt
dWNoIG5vdCBjb29sLgo+ID4gLURhbmllbAo+ID4gCj4gPiA+IAo+ID4gPiBKYW1lcwo+ID4gPiAK
PiA+ID4gPiA+ICtzdGF0aWMgdm9pZCBrb21lZGFfa21zX2Ryb3BfbWFzdGVyKHN0cnVjdCBkcm1f
ZGV2aWNlICpkZXYsCj4gPiA+ID4gPiArICAgc3RydWN0IGRybV9maWxlICpmaWxlX3ByaXYpCj4g
PiA+ID4gPiArewo+ID4gPiA+ID4gK2RybV9hdG9taWNfaGVscGVyX3NodXRkb3duKGRldik7Cj4g
PiA+ID4gPiArfQo+ID4gPiA+ID4gKwo+ID4gPiA+ID4gIHN0YXRpYyBzdHJ1Y3QgZHJtX2RyaXZl
ciBrb21lZGFfa21zX2RyaXZlciA9IHsKPiA+ID4gPiA+ICAuZHJpdmVyX2ZlYXR1cmVzID0gRFJJ
VkVSX0dFTSB8IERSSVZFUl9NT0RFU0VUIHwgRFJJVkVSX0FUT01JQyB8Cj4gPiA+ID4gPiAgICAg
RFJJVkVSX1BSSU1FIHwgRFJJVkVSX0hBVkVfSVJRLAo+ID4gPiA+ID4gIC5sYXN0Y2xvc2U9IGRy
bV9mYl9oZWxwZXJfbGFzdGNsb3NlLAo+ID4gPiA+ID4gIC5pcnFfaGFuZGxlcj0ga29tZWRhX2tt
c19pcnFfaGFuZGxlciwKPiA+ID4gPiA+ICsubWFzdGVyX2Ryb3A9IGtvbWVkYV9rbXNfZHJvcF9t
YXN0ZXIsCj4gPiA+ID4gPiAgLmdlbV9mcmVlX29iamVjdF91bmxvY2tlZD0gZHJtX2dlbV9jbWFf
ZnJlZV9vYmplY3QsCj4gPiA+ID4gPiAgLmdlbV92bV9vcHM9ICZkcm1fZ2VtX2NtYV92bV9vcHMs
Cj4gPiA+ID4gPiAgLmR1bWJfY3JlYXRlPSBrb21lZGFfZ2VtX2NtYV9kdW1iX2NyZWF0ZSwKPiA+
ID4gPiA+IC0tCj4gPiA+ID4gPiAxLjkuMQo+ID4gPiA+ID4KPiA+ID4gPiA+IF9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gPiA+ID4gPiBkcmktZGV2ZWwg
bWFpbGluZyBsaXN0Cj4gPiA+ID4gPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4g
PiA+ID4gPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbAo+ID4gPiA+Cj4gPiA+ID4gLS0KPiA+ID4gPiBEYW5pZWwgVmV0dGVyCj4gPiA+ID4g
U29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCj4gPiA+ID4gaHR0cDovL2Jsb2cu
ZmZ3bGwuY2gKPiA+ID4gSU1QT1JUQU5UIE5PVElDRTogVGhlIGNvbnRlbnRzIG9mIHRoaXMgZW1h
aWwgYW5kIGFueSBhdHRhY2htZW50cyBhcmUgY29uZmlkZW50aWFsIGFuZCBtYXkgYWxzbyBiZSBw
cml2aWxlZ2VkLiBJZiB5b3UgYXJlIG5vdCB0aGUgaW50ZW5kZWQgcmVjaXBpZW50LCBwbGVhc2Ug
bm90aWZ5IHRoZSBzZW5kZXIgaW1tZWRpYXRlbHkgYW5kIGRvIG5vdCBkaXNjbG9zZSB0aGUgY29u
dGVudHMgdG8gYW55IG90aGVyIHBlcnNvbiwgdXNlIGl0IGZvciBhbnkgcHVycG9zZSwgb3Igc3Rv
cmUgb3IgY29weSB0aGUgaW5mb3JtYXRpb24gaW4gYW55IG1lZGl1bS4gVGhhbmsgeW91Lgo+ID4g
PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4gPiBk
cmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gPiA+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKPiA+ID4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWwKPiA+IAo+ID4gLS0gCj4gPiBEYW5pZWwgVmV0dGVyCj4gPiBTb2Z0d2FyZSBFbmdp
bmVlciwgSW50ZWwgQ29ycG9yYXRpb24KPiA+IGh0dHA6Ly9ibG9nLmZmd2xsLmNoCj4gCj4gLS0g
Cj4gPT09PT09PT09PT09PT09PT09PT0KPiB8IEkgd291bGQgbGlrZSB0byB8Cj4gfCBmaXggdGhl
IHdvcmxkLCAgfAo+IHwgYnV0IHRoZXkncmUgbm90IHwKPiB8IGdpdmluZyBtZSB0aGUgICB8Cj4g
IFwgc291cmNlIGNvZGUhICAvCj4gICAtLS0tLS0tLS0tLS0tLS0KPiAgICAgwq9cXyjjg4QpXy/C
rwo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gZHJp
LWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAoK
LS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCmh0
dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
