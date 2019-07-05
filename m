Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13E0E605E0
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2019 14:25:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A1AC6E468;
	Fri,  5 Jul 2019 12:25:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B0556E468
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2019 12:25:51 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id k8so8081374edr.11
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Jul 2019 05:25:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=sp6o/n6EyLOrj3/DcsUkjbmVbC7RVr0FqOl1AVMUQxE=;
 b=E6qML4Mau/ovsEUBQta3F+/gxfp2FGXol6u/YQsAUZC3JVvYRi/dejyNU2IaY9/9VC
 xi1hGApQQw3opx5Sq+eV33d3KvavNkgPn+a6e3iKOiYZEKVjs7gGhrf8/8o0PNC99aCf
 6rxC7rd8EZt9AA+UOcU2Jd7LYBkZBq1jhp5AFbsJz1JS77ehhjsrATYn2fCFdANlWOyr
 BTQEEHcI/us9w17qlAeN4vrhPtMHkBi+t3uEbvTv47TeEIUfF6HvN41Go3KcWZwc7BB6
 Y/kOrZC0tM5p3bHnaBIJJHtb4QhM3f4QXzIOR+gA8nzCeMpg1neFOG6hlWVlpGF2iyeZ
 m34Q==
X-Gm-Message-State: APjAAAWVFT0KHqH4iZTJI26bqZls25+fEO74rvneTakiXGTr2ZUsgdFO
 7goWVVC/LZ7DV+5Gf5WUb31nVQ==
X-Google-Smtp-Source: APXvYqyrlGbmN8C47H4iFrm3hb1tSo+V6ad6lMSzqx49wvXnGtJpcxvu8AeEvgWOKwH8fQl+HYOEzA==
X-Received: by 2002:a50:ec03:: with SMTP id g3mr4172335edr.233.1562329549795; 
 Fri, 05 Jul 2019 05:25:49 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id rv16sm1694956ejb.79.2019.07.05.05.25.48
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 05 Jul 2019 05:25:49 -0700 (PDT)
Date: Fri, 5 Jul 2019 14:25:46 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
Subject: Re: [PATCH 2/2] drm/komeda: Computing layer_split and image_enhancer
 internally
Message-ID: <20190705122546.GO15868@phenom.ffwll.local>
Mail-Followup-To: "james qian wang (Arm Technology China)"
 <james.qian.wang@arm.com>, 
 Liviu Dudau <Liviu.Dudau@arm.com>,
 "airlied@linux.ie" <airlied@linux.ie>,
 Brian Starkey <Brian.Starkey@arm.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "sean@poorly.run" <sean@poorly.run>, nd <nd@arm.com>,
 Ayan Halder <Ayan.Halder@arm.com>,
 "Oscar Zhang (Arm Technology China)" <Oscar.Zhang@arm.com>,
 "Tiannan Zhu (Arm Technology China)" <Tiannan.Zhu@arm.com>,
 "Jonathan Chai (Arm Technology China)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Julien Yin (Arm Technology China)" <Julien.Yin@arm.com>,
 "Channing Chen (Arm Technology China)" <Channing.Chen@arm.com>,
 "Yiqi Kang (Arm Technology China)" <Yiqi.Kang@arm.com>,
 "thomas Sun (Arm Technology China)" <thomas.Sun@arm.com>,
 "Lowry Li (Arm Technology China)" <Lowry.Li@arm.com>,
 Ben Davis <Ben.Davis@arm.com>
References: <20190705114427.17456-1-james.qian.wang@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190705114427.17456-1-james.qian.wang@arm.com>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=sp6o/n6EyLOrj3/DcsUkjbmVbC7RVr0FqOl1AVMUQxE=;
 b=juUdJDhCXFnJ0I3tvrOBE6o+BNxVkxERdKLMu+waFpCNXRdetjSibdR8/MwI8NUeiZ
 zd1RWnNgguXBUeuoW6+0QaFuUos1KOMqXrt2uG1sj41V8EB2AdDwzsdhrdti2I56lg59
 NQFAOykAAoBiSkU9pnUa1fYe9EtGLW/58vYr4=
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
Cc: Ayan Halder <Ayan.Halder@arm.com>,
 "Oscar Zhang \(Arm Technology China\)" <Oscar.Zhang@arm.com>,
 "Tiannan Zhu \(Arm Technology China\)" <Tiannan.Zhu@arm.com>,
 "airlied@linux.ie" <airlied@linux.ie>, Liviu Dudau <Liviu.Dudau@arm.com>,
 "Jonathan Chai \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Julien Yin \(Arm Technology China\)" <Julien.Yin@arm.com>,
 "Channing Chen \(Arm Technology China\)" <Channing.Chen@arm.com>,
 "Yiqi Kang \(Arm Technology China\)" <Yiqi.Kang@arm.com>,
 Ben Davis <Ben.Davis@arm.com>,
 "thomas Sun \(Arm Technology China\)" <thomas.Sun@arm.com>, nd <nd@arm.com>,
 "sean@poorly.run" <sean@poorly.run>,
 "Lowry Li \(Arm Technology China\)" <Lowry.Li@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdWwgMDUsIDIwMTkgYXQgMTE6NDQ6NDVBTSArMDAwMCwgamFtZXMgcWlhbiB3YW5n
IChBcm0gVGVjaG5vbG9neSBDaGluYSkgd3JvdGU6Cj4gRm9yIGxheWVyX3NwbGl0Ogo+IEVuYWJs
ZSBpdCBpZiB0aGUgc2NhbGluZyBleGNlZWQgdGhlIGFjY2VwdCByYW5nZSBvZiBzY2FsZXIuCj4g
Cj4gRm9yIGltYWdlX2VuaGFuY2VyOgo+IEVuYWJsZSBpdCBpZiB0aGUgc2NhbGluZyBpcyBhIDJ4
KyBzY2FsaW5nCgpJbW8gc2hvdWxkIGJlIHR3byBwYXRjaGVzLiBBc2lkZSBmcm9tIHRoYXQgKGFu
ZCB3aXRoIDAga25vd2xlZGdlIGFib3V0IHRoZQpodywganVzdCBsb29raW5nIGF0IHRoaXMgZnJv
bSBhIGttcy9hdG9taWMgdWFwaSBwb3YpOgoKQWNrZWQtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmll
bC52ZXR0ZXJAZmZ3bGwuY2g+Cgo+IAo+IFNpZ25lZC1vZmYtYnk6IGphbWVzIHFpYW4gd2FuZyAo
QXJtIFRlY2hub2xvZ3kgQ2hpbmEpIDxqYW1lcy5xaWFuLndhbmdAYXJtLmNvbT4KPiAtLS0KPiAg
Li4uL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9waXBlbGluZS5oICB8ICAzICsr
LQo+ICAuLi4vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9waXBlbGluZV9zdGF0ZS5jICAgIHwg
MTUgKysrKysrKysrKysrKystCj4gIGRyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEv
a29tZWRhX3BsYW5lLmMgfCAgOCArLS0tLS0tLQo+ICAuLi4vZHJtL2FybS9kaXNwbGF5L2tvbWVk
YS9rb21lZGFfd2JfY29ubmVjdG9yLmMgIHwgMTAgKy0tLS0tLS0tLQo+ICA0IGZpbGVzIGNoYW5n
ZWQsIDE4IGluc2VydGlvbnMoKyksIDE4IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9waXBlbGluZS5oIGIvZHJp
dmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGlwZWxpbmUuaAo+IGluZGV4
IGZjMWI4NjEzMzg1ZS4uYTkwYmNiYjNjYjIzIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX3BpcGVsaW5lLmgKPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9waXBlbGluZS5oCj4gQEAgLTUzNyw3ICs1
MzcsOCBAQCB2b2lkIGtvbWVkYV9waXBlbGluZV9kaXNhYmxlKHN0cnVjdCBrb21lZGFfcGlwZWxp
bmUgKnBpcGUsCj4gIHZvaWQga29tZWRhX3BpcGVsaW5lX3VwZGF0ZShzdHJ1Y3Qga29tZWRhX3Bp
cGVsaW5lICpwaXBlLAo+ICAJCQkgICAgc3RydWN0IGRybV9hdG9taWNfc3RhdGUgKm9sZF9zdGF0
ZSk7Cj4gIAo+IC12b2lkIGtvbWVkYV9jb21wbGV0ZV9kYXRhX2Zsb3dfY2ZnKHN0cnVjdCBrb21l
ZGFfZGF0YV9mbG93X2NmZyAqZGZsb3csCj4gK3ZvaWQga29tZWRhX2NvbXBsZXRlX2RhdGFfZmxv
d19jZmcoc3RydWN0IGtvbWVkYV9sYXllciAqbGF5ZXIsCj4gKwkJCQkgICBzdHJ1Y3Qga29tZWRh
X2RhdGFfZmxvd19jZmcgKmRmbG93LAo+ICAJCQkJICAgc3RydWN0IGRybV9mcmFtZWJ1ZmZlciAq
ZmIpOwo+ICAKPiAgI2VuZGlmIC8qIF9LT01FREFfUElQRUxJTkVfSF8qLwo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9waXBlbGluZV9zdGF0
ZS5jIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGlwZWxpbmVf
c3RhdGUuYwo+IGluZGV4IDJiNDE1ZWYyYjdkMy4uNzA5ODcwYmRhYTRmIDEwMDY0NAo+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX3BpcGVsaW5lX3N0YXRl
LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9waXBl
bGluZV9zdGF0ZS5jCj4gQEAgLTc4NCw5ICs3ODQsMTEgQEAga29tZWRhX3RpbWluZ19jdHJscl92
YWxpZGF0ZShzdHJ1Y3Qga29tZWRhX3RpbWluZ19jdHJsciAqY3RybHIsCj4gIAlyZXR1cm4gMDsK
PiAgfQo+ICAKPiAtdm9pZCBrb21lZGFfY29tcGxldGVfZGF0YV9mbG93X2NmZyhzdHJ1Y3Qga29t
ZWRhX2RhdGFfZmxvd19jZmcgKmRmbG93LAo+ICt2b2lkIGtvbWVkYV9jb21wbGV0ZV9kYXRhX2Zs
b3dfY2ZnKHN0cnVjdCBrb21lZGFfbGF5ZXIgKmxheWVyLAo+ICsJCQkJICAgc3RydWN0IGtvbWVk
YV9kYXRhX2Zsb3dfY2ZnICpkZmxvdywKPiAgCQkJCSAgIHN0cnVjdCBkcm1fZnJhbWVidWZmZXIg
KmZiKQo+ICB7Cj4gKwlzdHJ1Y3Qga29tZWRhX3NjYWxlciAqc2NhbGVyID0gbGF5ZXItPmJhc2Uu
cGlwZWxpbmUtPnNjYWxlcnNbMF07Cj4gIAl1MzIgdyA9IGRmbG93LT5pbl93Owo+ICAJdTMyIGgg
PSBkZmxvdy0+aW5faDsKPiAgCj4gQEAgLTgwMyw2ICs4MDUsMTcgQEAgdm9pZCBrb21lZGFfY29t
cGxldGVfZGF0YV9mbG93X2NmZyhzdHJ1Y3Qga29tZWRhX2RhdGFfZmxvd19jZmcgKmRmbG93LAo+
ICAKPiAgCWRmbG93LT5lbl9zY2FsaW5nID0gKHcgIT0gZGZsb3ctPm91dF93KSB8fCAoaCAhPSBk
Zmxvdy0+b3V0X2gpOwo+ICAJZGZsb3ctPmlzX3l1diA9IGZiLT5mb3JtYXQtPmlzX3l1djsKPiAr
Cj4gKwkvKiB0cnkgdG8gZW5hYmxlIGltYWdlIGVuaGFuY2VyIGlmIGl0IGlzIGEgMngrIHVwc2Nh
bGluZyAqLwo+ICsJZGZsb3ctPmVuX2ltZ19lbmhhbmNlbWVudCA9IGRmbG93LT5vdXRfdyA+PSAy
ICogdyB8fAo+ICsJCQkJICAgIGRmbG93LT5vdXRfaCA+PSAyICogaDsKPiArCj4gKwkvKiB0cnkg
dG8gZW5hYmxlIHNwbGl0IGlmIHNjYWxpbmcgZXhjZWVkIHRoZSBzY2FsZXIncyBhY2NlcHRhYmxl
Cj4gKwkgKiBpbnB1dC9vdXRwdXQgcmFuZ2UuCj4gKwkgKi8KPiArCWlmIChkZmxvdy0+ZW5fc2Nh
bGluZyAmJiBzY2FsZXIpCj4gKwkJZGZsb3ctPmVuX3NwbGl0ID0gIWluX3JhbmdlKCZzY2FsZXIt
PmhzaXplLCBkZmxvdy0+aW5fdykgfHwKPiArCQkJCSAgIWluX3JhbmdlKCZzY2FsZXItPmhzaXpl
LCBkZmxvdy0+b3V0X3cpOwo+ICB9Cj4gIAo+ICBzdGF0aWMgYm9vbCBtZXJnZXJfaXNfYXZhaWxh
YmxlKHN0cnVjdCBrb21lZGFfcGlwZWxpbmUgKnBpcGUsCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX3BsYW5lLmMgYi9kcml2ZXJzL2dwdS9k
cm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9wbGFuZS5jCj4gaW5kZXggNWJiODU1M2NjMTE3
Li5jMDk1YWYxNTQyMTYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5
L2tvbWVkYS9rb21lZGFfcGxhbmUuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxh
eS9rb21lZGEva29tZWRhX3BsYW5lLmMKPiBAQCAtMTgsNyArMTgsNiBAQCBrb21lZGFfcGxhbmVf
aW5pdF9kYXRhX2Zsb3coc3RydWN0IGRybV9wbGFuZV9zdGF0ZSAqc3QsCj4gIAkJCSAgICBzdHJ1
Y3Qga29tZWRhX2RhdGFfZmxvd19jZmcgKmRmbG93KQo+ICB7Cj4gIAlzdHJ1Y3Qga29tZWRhX3Bs
YW5lICprcGxhbmUgPSB0b19rcGxhbmUoc3QtPnBsYW5lKTsKPiAtCXN0cnVjdCBrb21lZGFfcGxh
bmVfc3RhdGUgKmtwbGFuZV9zdCA9IHRvX2twbGFuZV9zdChzdCk7Cj4gIAlzdHJ1Y3QgZHJtX2Zy
YW1lYnVmZmVyICpmYiA9IHN0LT5mYjsKPiAgCWNvbnN0IHN0cnVjdCBrb21lZGFfZm9ybWF0X2Nh
cHMgKmNhcHMgPSB0b19rZmIoZmIpLT5mb3JtYXRfY2FwczsKPiAgCXN0cnVjdCBrb21lZGFfcGlw
ZWxpbmUgKnBpcGUgPSBrcGxhbmUtPmxheWVyLT5iYXNlLnBpcGVsaW5lOwo+IEBAIC01NywxMCAr
NTYsNyBAQCBrb21lZGFfcGxhbmVfaW5pdF9kYXRhX2Zsb3coc3RydWN0IGRybV9wbGFuZV9zdGF0
ZSAqc3QsCj4gIAkJcmV0dXJuIC1FSU5WQUw7Cj4gIAl9Cj4gIAo+IC0JZGZsb3ctPmVuX2ltZ19l
bmhhbmNlbWVudCA9ICEha3BsYW5lX3N0LT5pbWdfZW5oYW5jZW1lbnQ7Cj4gLQlkZmxvdy0+ZW5f
c3BsaXQgPSAhIWtwbGFuZV9zdC0+bGF5ZXJfc3BsaXQ7Cj4gLQo+IC0Ja29tZWRhX2NvbXBsZXRl
X2RhdGFfZmxvd19jZmcoZGZsb3csIGZiKTsKPiArCWtvbWVkYV9jb21wbGV0ZV9kYXRhX2Zsb3df
Y2ZnKGtwbGFuZS0+bGF5ZXIsIGRmbG93LCBmYik7Cj4gIAo+ICAJcmV0dXJuIDA7Cj4gIH0KPiBA
QCAtMTc1LDggKzE3MSw2IEBAIGtvbWVkYV9wbGFuZV9hdG9taWNfZHVwbGljYXRlX3N0YXRlKHN0
cnVjdCBkcm1fcGxhbmUgKnBsYW5lKQo+ICAKPiAgCW9sZCA9IHRvX2twbGFuZV9zdChwbGFuZS0+
c3RhdGUpOwo+ICAKPiAtCW5ldy0+aW1nX2VuaGFuY2VtZW50ID0gb2xkLT5pbWdfZW5oYW5jZW1l
bnQ7Cj4gLQo+ICAJcmV0dXJuICZuZXctPmJhc2U7Cj4gIH0KPiAgCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX3diX2Nvbm5lY3Rvci5jIGIv
ZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfd2JfY29ubmVjdG9yLmMK
PiBpbmRleCBiYjhhNjFmNmU5YTQuLjYxN2UxZjdiODQ3MiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV93Yl9jb25uZWN0b3IuYwo+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX3diX2Nvbm5lY3Rvci5j
Cj4gQEAgLTEzLDcgKzEzLDYgQEAga29tZWRhX3diX2luaXRfZGF0YV9mbG93KHN0cnVjdCBrb21l
ZGFfbGF5ZXIgKndiX2xheWVyLAo+ICAJCQkgc3RydWN0IGtvbWVkYV9jcnRjX3N0YXRlICprY3J0
Y19zdCwKPiAgCQkJIHN0cnVjdCBrb21lZGFfZGF0YV9mbG93X2NmZyAqZGZsb3cpCj4gIHsKPiAt
CXN0cnVjdCBrb21lZGFfc2NhbGVyICpzY2FsZXIgPSB3Yl9sYXllci0+YmFzZS5waXBlbGluZS0+
c2NhbGVyc1swXTsKPiAgCXN0cnVjdCBkcm1fZnJhbWVidWZmZXIgKmZiID0gY29ubl9zdC0+d3Jp
dGViYWNrX2pvYi0+ZmI7Cj4gIAo+ICAJbWVtc2V0KGRmbG93LCAwLCBzaXplb2YoKmRmbG93KSk7
Cj4gQEAgLTI4LDE0ICsyNyw3IEBAIGtvbWVkYV93Yl9pbml0X2RhdGFfZmxvdyhzdHJ1Y3Qga29t
ZWRhX2xheWVyICp3Yl9sYXllciwKPiAgCWRmbG93LT5waXhlbF9ibGVuZF9tb2RlID0gRFJNX01P
REVfQkxFTkRfUElYRUxfTk9ORTsKPiAgCWRmbG93LT5yb3QgPSBEUk1fTU9ERV9ST1RBVEVfMDsK
PiAgCj4gLQlrb21lZGFfY29tcGxldGVfZGF0YV9mbG93X2NmZyhkZmxvdywgZmIpOwo+IC0KPiAt
CS8qIGlmIHNjYWxpbmcgZXhjZWVkIHRoZSBhY2NlcHRhYmxlIHNjYWxlciBpbnB1dC9vdXRwdXQg
cmFuZ2UsIHRyeSB0bwo+IC0JICogZW5hYmxlIHNwbGl0Lgo+IC0JICovCj4gLQlpZiAoZGZsb3ct
PmVuX3NjYWxpbmcgJiYgc2NhbGVyKQo+IC0JCWRmbG93LT5lbl9zcGxpdCA9ICFpbl9yYW5nZSgm
c2NhbGVyLT5oc2l6ZSwgZGZsb3ctPmluX3cpIHx8Cj4gLQkJCQkgICFpbl9yYW5nZSgmc2NhbGVy
LT5oc2l6ZSwgZGZsb3ctPm91dF93KTsKPiArCWtvbWVkYV9jb21wbGV0ZV9kYXRhX2Zsb3dfY2Zn
KHdiX2xheWVyLCBkZmxvdywgZmIpOwo+ICAKPiAgCXJldHVybiAwOwo+ICB9Cj4gLS0gCj4gMi4y
MC4xCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
PiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
Zwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCgotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRp
b24KaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
