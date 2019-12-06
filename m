Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D82114C6C
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2019 07:50:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35F096E191;
	Fri,  6 Dec 2019 06:50:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6D446E191
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2019 06:50:52 +0000 (UTC)
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-1-qMuwrLI3P7O-KfoFCQzSsA-1; Fri, 06 Dec 2019 01:50:50 -0500
Received: by mail-oi1-f197.google.com with SMTP id z9so3131558oic.19
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Dec 2019 22:50:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yVvkWMiSAxuM0BwMeqQMAoEI7icvQ/1m6uzCT73Fits=;
 b=J3/X9R8yi0TJFIAST9jsRNyo+YEl4zrSU0RFH1qzZ1RMEGmgNDKUYFTCH2Oowk84Vs
 bZY/LSLAFujadyIYNLB/YI/FBXaT3ui6pc7d+/nSOZng6davS4QloFSYljnaCAb94YXU
 zUnVWbREpkXWhER1Z1fmXaY0c2ljPWJ1jG/JQT0ZSk2Q/ztfzehirVunvu/+ZD0GM33L
 v2guyrGkIDEyUSFR34vBGc6UDWQ/ZQUaYARPEBLKmDMfq6viAcY6gZQ9clDwi0o5I+6R
 TCvkMNtBmECceCWrvNDlVKn4zxjnLDK3msUj5nIZxcdklT9wJ1Du5ApzRGxNWyTsCwcS
 RswA==
X-Gm-Message-State: APjAAAXbcwq3r4Ur2r5l1wWJv0XYroWKwO8ExIHM/XFI/ZOm1OgW7XI7
 CC/5BFqg3LN6S9chDyjo59R7OocxR3o/HbpOrjSm8AWDR6jMRX9h8CuQOH9E2ll2fRb88eTz+WV
 rvbMAudv92Uysc79wolaN0grVqZRropicsx8U/MJ9ykFl
X-Received: by 2002:aca:dc45:: with SMTP id t66mr5410015oig.39.1575615049361; 
 Thu, 05 Dec 2019 22:50:49 -0800 (PST)
X-Google-Smtp-Source: APXvYqx1wAn+NhkoxZN7MfyTn+l32WedSCCgwHAVolsl64QyJvPl9RzP03rOiH1GqzGbtOqfTDW+JVKdBR1533CCMDI=
X-Received: by 2002:aca:dc45:: with SMTP id t66mr5409992oig.39.1575615048991; 
 Thu, 05 Dec 2019 22:50:48 -0800 (PST)
MIME-Version: 1.0
References: <20191126072545.22663-1-tzimmermann@suse.de>
 <20191126072545.22663-4-tzimmermann@suse.de>
 <20191126093710.GR29965@phenom.ffwll.local>
 <8099fad7-6b74-e769-9431-900a531c5d11@suse.de>
 <0FB4179F-B299-41A9-A75A-EF9294E0DD17@oracle.com>
 <edc3ed43-cede-e5ea-f2a4-b4fcfc8b8af7@suse.de>
 <CAPM=9tzPv8hxZg2m2ZO2tfPKRL=7NPvK9yO9jhHNeo==sEKUtA@mail.gmail.com>
 <90962ea9-941c-ed11-eb7a-10d726861c1a@suse.de>
In-Reply-To: <90962ea9-941c-ed11-eb7a-10d726861c1a@suse.de>
From: David Airlie <airlied@redhat.com>
Date: Fri, 6 Dec 2019 16:50:37 +1000
Message-ID: <CAMwc25qxAbR1eTa5FvCjv5EDOAknT75s75zt9+etppUecQvLdw@mail.gmail.com>
Subject: Re: [PATCH 3/4] drm/mgag200: Add workaround for HW that does not
 support 'startadd'
To: Thomas Zimmermann <tzimmermann@suse.de>
X-MC-Unique: qMuwrLI3P7O-KfoFCQzSsA-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1575615051;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FsmbYNOyFp2Zop/wlsG3c6ByAzxyI+HLU/bzyhDzxqI=;
 b=i/fAoBaM6j7pQQtCo7nockKN8xVcczrUA7B2PSKUvtLK8lhju69mNRHswlsIEIg7H1RSBd
 XZDLbLFC+EWS89sjvlSuTKiFrsgdWNAbypRj+OHnlue0N7wM3WupodDJ4JxVMl+8RInL4e
 P+bNy8HkmGD2Y8/IiOeAeZZfjgGxVwQ=
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
Cc: John Donnelly <john.p.donnelly@oracle.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBEZWMgNiwgMjAxOSBhdCA0OjE0IFBNIFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVy
bWFubkBzdXNlLmRlPiB3cm90ZToKPgo+IEhpCj4KPiBBbSAwNC4xMi4xOSB1bSAxMDozNiBzY2hy
aWViIERhdmUgQWlybGllOgo+ID4gT24gV2VkLCA0IERlYyAyMDE5IGF0IDE3OjMwLCBUaG9tYXMg
WmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4gd3JvdGU6Cj4gPj4KPiA+PiBIaSBKb2hu
Cj4gPj4KPiA+PiBBbSAwMy4xMi4xOSB1bSAxODo1NSBzY2hyaWViIEpvaG4gRG9ubmVsbHk6Cj4g
Pj4+IEhpICwKPiA+Pj4KPiA+Pj4gU2VlIGJlbG93ICwKPiA+Pj4KPiA+Pj4KPiA+Pj4+IE9uIE5v
diAyNiwgMjAxOSwgYXQgMzo1MCBBTSwgVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1
c2UuZGU+IHdyb3RlOgo+ID4+Pj4KPiA+Pj4+IEhpCj4gPj4+Pgo+ID4+Pj4gQW0gMjYuMTEuMTkg
dW0gMTA6Mzcgc2NocmllYiBEYW5pZWwgVmV0dGVyOgo+ID4+Pj4+IE9uIFR1ZSwgTm92IDI2LCAy
MDE5IGF0IDA4OjI1OjQ0QU0gKzAxMDAsIFRob21hcyBaaW1tZXJtYW5uIHdyb3RlOgo+ID4+Pj4+
PiBUaGVyZSdzIGF0IGxlYXN0IG9uZSBzeXN0ZW0gdGhhdCBkb2VzIG5vdCBpbnRlcnByZXQgdGhl
IHZhbHVlIG9mCj4gPj4+Pj4+IHRoZSBkZXZpY2UncyAnc3RhcnRhZGQnIGZpZWxkIGNvcnJlY3Rs
eSwgd2hpY2ggbGVhZHMgdG8gaW5jb3JyZWN0bHkKPiA+Pj4+Pj4gZGlzcGxheWVkIHNjYW5vdXQg
YnVmZmVycy4gQWx3YXlzIHBsYWNpbmcgdGhlIGFjdGl2ZSBzY2Fub3V0IGJ1ZmZlcgo+ID4+Pj4+
PiBhdCBvZmZzZXQgMCB3b3JrcyBhcm91bmQgdGhlIHByb2JsZW0uCj4gPj4+Pj4+Cj4gPj4+Pj4+
IFNpZ25lZC1vZmYtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPgo+
ID4+Pj4+PiBSZXBvcnRlZC1ieTogSm9obiBEb25uZWxseSA8am9obi5wLmRvbm5lbGx5QG9yYWNs
ZS5jb20+Cj4gPj4+Pj4+IExpbms6IGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9kcm0v
bWlzYy9pc3N1ZXMvNwo+ID4+Pj4+Cj4gPj4+Pj4gVGVzdGVkLWJ5OiBKb2huIERvbm5lbGx5IDxq
b2huLnAuZG9ubmVsbHlAb3JhY2xlLmNvbT4KPiA+Pj4+Pgo+ID4+Pj4+IChOb3QgcXVpdGUgdGhp
cyBwYXRjaCwgYnV0IHByZXR0eSBtdWNoIHRoZSBsb2dpYywgc28gY291bnRzKS4KPiA+Pj4+Pgo+
ID4+Pj4+IEZpeGVzOiA4MWRhODdmNjNhMWUgKCJkcm06IFJlcGxhY2UgZHJtX2dlbV92cmFtX3B1
c2hfdG9fc3lzdGVtKCkgd2l0aCBrdW5tYXAgKyB1bnBpbiIpCj4gPj4+Pj4gQ2M6IDxzdGFibGVA
dmdlci5rZXJuZWwub3JnPiAjIHY1LjMrCj4gPj4+Pj4KPiA+Pj4+PiBBbHNvIHlvdSBuZWVkIHRo
ZSBzdGFibGUgbGluZSBvbiBib3RoIHByZXAgcGF0Y2hlcyB0b28uIEZvciBuZXh0IHRpbWUKPiA+
Pj4+PiBhcm91bmQsCj4gPj4+Pj4KPiA+Pj4+PiAkIGRpbSBmaXhlcyA4MWRhODdmNjNhMWUKPiA+
Pj4+Pgo+ID4+Pj4+IHdpbGwgZ2VuZXJhdGUgYWxsIHRoZSBzdHVmZiB5b3UgbmVlZCwgaW5jbHVk
aW5nIGEgZ29vZCBzZXQgb2Ygc3VnZ2VzdGVkCj4gPj4+Pj4gQ2M6IHlvdSBzaG91bGQgaGF2ZS4K
PiA+Pj4+Pgo+ID4+Pj4+IE9uIHRoZSBmaXJzdCAzIHBhdGNoZXMsIHdpdGggYWxsIHRoYXQgc3R1
ZmYgYWRkZWQ6Cj4gPj4+Pj4KPiA+Pj4+PiBSZXZpZXdlZC1ieTogRGFuaWVsIFZldHRlciA8ZGFu
aWVsLnZldHRlckBmZndsbC5jaD4KPiA+Pj4+Cj4gPj4+PiBUaGFua3MgZm9yIHRoZSByZXZpZXcu
Cj4gPj4+Pgo+ID4+Pj4gU29ycnkgZm9yIGxlYXZpbmcgb3V0IHNvbWUgb2YgdGhlIHRhZ3MuIEkg
d2FudGVkIHRvIHdhaXQgZm9yIGZlZWRiYWNrCj4gPj4+PiBiZWZvcmUgYWRkaW5nIHRlc3RlZC1i
eSwgZml4ZXMsIHN0YWJsZS4gSSdsbCBzcGxpdCBvZmYgcGF0Y2ggNCBmcm9tIHRoZQo+ID4+Pj4g
c2VyaWVzIGFuZCBnZXQgMSB0byAzIG1lcmdlZCBBU0FQLgo+ID4+Pj4KPiA+Pj4+IEJlc3QgcmVn
YXJkcwo+ID4+Pj4gVGhvbWFzCj4gPj4+Pgo+ID4+Pj4+Cj4gPj4+Pj4gUGxlYXNlIHB1c2ggdGhl
c2UgdG8gZHJtLW1pc2MtbmV4dC1maXhlcyBzbyB0aGV5IGdldCBiYWNrcG9ydGVkIGFzIHF1aWNr
bHkKPiA+Pj4+PiBhcyBwb3NzaWJsZS4KPiA+Pj4+PiAtRGFuaWVsCj4gPj4+Pj4KPiA+Pj4+Pj4g
LS0tCj4gPj4+Pj4+IGRyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfZHJ2LmMgfCAzNiAr
KysrKysrKysrKysrKysrKysrKysrKysrKy0KPiA+Pj4+Pj4gZHJpdmVycy9ncHUvZHJtL21nYWcy
MDAvbWdhZzIwMF9kcnYuaCB8ICAzICsrKwo+ID4+Pj4+PiAyIGZpbGVzIGNoYW5nZWQsIDM4IGlu
c2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiA+Pj4+Pj4KPiA+Pj4+Pj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0v
bWdhZzIwMC9tZ2FnMjAwX2Rydi5jCj4gPj4+Pj4+IGluZGV4IDM5N2Y4YjBhOWFmOC4uZDQzOTUx
Y2FlZWEwIDEwMDY0NAo+ID4+Pj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWdhZzIwMC9tZ2Fn
MjAwX2Rydi5jCj4gPj4+Pj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBf
ZHJ2LmMKPiA+Pj4+Pj4gQEAgLTMwLDYgKzMwLDggQEAgbW9kdWxlX3BhcmFtX25hbWVkKG1vZGVz
ZXQsIG1nYWcyMDBfbW9kZXNldCwgaW50LCAwNDAwKTsKPiA+Pj4+Pj4gc3RhdGljIHN0cnVjdCBk
cm1fZHJpdmVyIGRyaXZlcjsKPiA+Pj4+Pj4KPiA+Pj4+Pj4gc3RhdGljIGNvbnN0IHN0cnVjdCBw
Y2lfZGV2aWNlX2lkIHBjaWlkbGlzdFtdID0gewo+ID4+Pj4+PiArICB7IFBDSV9WRU5ET1JfSURf
TUFUUk9YLCAweDUyMiwgUENJX1ZFTkRPUl9JRF9TVU4sIDB4NDg1MiwgMCwgMCwKPiA+Pj4+Pj4g
KyAgICAgICAgICBHMjAwX1NFX0EgfCBNR0FHMjAwX0ZMQUdfSFdfQlVHX05PX1NUQVJUQUREfSwK
PiA+Pj4KPiA+Pj4KPiA+Pj4KPiA+Pj4gSSB3aWxsIGhhdmUgYW4gYWRkaXRpb25hbCBsaXN0IG9m
IHZlbmRvciBJRHMgKDB4NDg1MikgIEkgd2lsbCBwcm92aWRlIGluIGEgZm9sbG93IHVwIHBhdGNo
IHNob3J0bHkgLiAgVGhpcyBmaXhlcyBvbmx5IDEgZmxhdm9yICBvZiBzZXJ2ZXIuCj4gPj4KPiA+
PiBUaGFuayB5b3UgZm9yIGFsbCB0aGUgdGVzdGluZyB5b3UgZG8uIFdlIGNhbiBhZGQgdGhlc2Ug
aWRzIGFzIG5lY2Vzc2FyeS4KPiA+Pgo+ID4+IEJlZm9yZSwgSSBwb3N0ZWQgYSBwYXRjaCBhdCBb
MV0gdGhhdCBwcmludHMgYW4gaW50ZXJuYWwgdW5pcXVlIGlkLiBUaGUKPiA+PiBpZCBvZiB5b3Vy
IG9yaWdpbmFsIHRlc3QgbWFjaGluZSB3YXMgMHgyIElJUkMuCj4gPj4KPiA+PiBNeSBndWVzcyBp
cyB0aGF0IHRoZSBwcm9ibGVtIG1pZ2h0IGJlIHJlbGF0ZWQgdG8gdGhlIGNoaXAncyByZXZpc2lv
bi4gSWYKPiA+PiB5b3UgaGF2ZSB0aGUgb3B0aW9uIG9mIGJvb3RpbmcgeW91ciBvd24ga2VybmVs
cyBvbiBhbGwgdGhlc2UgbWFjaGluZXMsCj4gPj4gY291bGQgeW91IGFwcGx5IHRoZSBwYXRjaCBh
bmQgbG9vayBmb3IgYSBwYXR0ZXJuIGluIHRoZXNlIGlkcz8gTWF5YmUKPiA+PiBvbmx5IHJldmlz
aW9uIDB4MiBpcyBhZmZlY3RlZC4KPiA+Pgo+ID4KPiA+IEkndmUgZ290IGFuIG9sZCBidWcgSSBu
ZXZlciBnb3QgYXJvdW5kIHRvIHRoYXQgaGFzIGEgY29tbWVudCBmcm9tIE1hdHJveAo+ID4KPiA+
ICJUaGUgaXNzdWUgaXMgcmVwcm9kdWNpYmxlIHdpdGggRzIwMGUgY2hpcC4gVGhlIGRldmljZSBJ
RCBpcyAweDA1MjIuIgo+ID4KPiA+IHNvIGl0IG1pZ2h0IGJlIGEgYnJvYWRlciBwcm9ibGVtIHRo
YW4gd2UgdGhpbmsuCj4KPiBEaWQgdGhleSB0ZWxsIHlvdSBhIHN1YnZlbmRvciBpZD8gSm9obiBy
ZXBvcnRlZCB0aGF0IHRoZSBpbnRlcm5hbAo+IHJldmlzaW9uIGlkIGRpZmZlcnMgYW1vbmcgYWZm
ZWN0ZWQgbWFjaGluZXMuIEknbSB0aGlua2luZyBhYm91dCBmbGFnZ2luZwo+IGVpdGhlciBTdW4g
ZGV2aWNlcyBvciBhbGwgMHgwNTIyIGRldmljZXMgYXMgYnJva2VuLgoKV2VsbCBpdCB3YXMgZnJv
bSBNYXRyb3ggdGhlbXNlbHZlcywgc28gdGhleSBhcmUgdGhlIHZlbmRvciBJRCwgaXQKZGlkbid0
IHNvdW5kcyBsaWtlIHN1YnZlbmRvciBtYXR0ZXJlZCwgdGhvdWdoIEkgZXhwZWN0IHRoZSBwcm9i
bGVtIGlzCnRoZSBCTUMgZmlybXdhcmUgYW55d2F5cywgbm90IHN1cmUgaWYgd2UgY2FuIGV2ZW4g
a25vdyB3aGF0IHRocyBpcy4KCkRhdmUuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
