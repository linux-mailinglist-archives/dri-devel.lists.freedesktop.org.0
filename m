Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E76736214A
	for <lists+dri-devel@lfdr.de>; Fri, 16 Apr 2021 15:44:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65E7B6E0C9;
	Fri, 16 Apr 2021 13:44:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1AA46E0C9;
 Fri, 16 Apr 2021 13:44:24 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id v6so40926555ejo.6;
 Fri, 16 Apr 2021 06:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=cxwopNbqWhcLqoI9TeymrbLhHEY5Eid242g6tP2tLfw=;
 b=cUKaTYkmekRkYZVbVpxgBb7wR+jYs5nwq+2F+uSgNx20TGYuCbsp5OWa+DH90dcnJZ
 kDtPxYn0QxdnJxwHdZzxKE7902A7uD9eWSStyezQrzldb6Fz7CPeUxoGOMQi92QlnF67
 CfK1koGOg3NZGR5kulmzRsKq+ICsH+ZIcgl7TBRCI9NZv226jaFHIgjGhgbaGd7vm1R0
 nZuE3QQRp5jR59dKJMkh9Zk67QK/aIly6u++DOEDM4LD2ypAuy4IONeBbE/tubj4hTb3
 5vfVgsY7fp6gahmLET9bfvHfaZxTnhw8bCmH8eSA15G2v2rINE9jmqCNB3mpRL6FbUOv
 Ld9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=cxwopNbqWhcLqoI9TeymrbLhHEY5Eid242g6tP2tLfw=;
 b=Jy6AkVAeM9SoGycxplRV451g3a2F97dUr5oQqnESE0Dwkev6KidCmJdLi8/y4aQPzM
 BNg8N3D/e6Fi7PoFMrKLA75usSSxzxhNFF1vqQrScLn/XhbAItX49IOzdufJ0PJzv6O1
 +sWkVVZlbQxzrdMGaCIE/h0OF9prZmPWRrnC8csK0GAeHnsacrTRJSC6z+HAR9MpLQJN
 rSfcsSpInFfvSjiXNd8ElVLTqFm4+hZAiFXeZwP6pzFyVwyNH98uAYSkcvLiWSxFxGlI
 4c1hdFFfDKn9S0QPYJo9neyLRnUNtqAkylIhfuAM0sZgYVFbd/dfDpBtdRfrfQ1WCX/W
 cdKw==
X-Gm-Message-State: AOAM531PnYumJrOX7KqT7Usp3vYunYNvqUvWqoDA9DpMapiQwyJsmash
 dGNp2LxCtMJWmpFVjRaJ9lYv6JxElhk=
X-Google-Smtp-Source: ABdhPJx3cJ+HW/sGkuANOsPpGkwMMVlzjAsUdjmMI0D5Gg3af+qeoe8m+GcBqsOSzOF6Meoo8YHzZQ==
X-Received: by 2002:a17:907:264f:: with SMTP id
 ar15mr8581989ejc.484.1618580663452; 
 Fri, 16 Apr 2021 06:44:23 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:6a8a:26d6:7403:5ada?
 ([2a02:908:1252:fb60:6a8a:26d6:7403:5ada])
 by smtp.gmail.com with ESMTPSA id y26sm4298744ejj.98.2021.04.16.06.44.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Apr 2021 06:44:23 -0700 (PDT)
Subject: Re: [PATCH v3 0/7] drm: Clean up mmap for TTM-based GEM drivers
To: Thomas Zimmermann <tzimmermann@suse.de>, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@linux.ie, daniel@ffwll.ch,
 bskeggs@redhat.com, ray.huang@amd.com, linux-graphics-maintainer@vmware.com,
 sroland@vmware.com, zackr@vmware.com, shashank.sharma@amd.com,
 sam@ravnborg.org, emil.velikov@collabora.com, Felix.Kuehling@amd.com,
 nirmoy.das@amd.com
References: <20210416133146.24825-1-tzimmermann@suse.de>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <34aea3a4-9c34-f514-139c-f6d458a4fa3b@gmail.com>
Date: Fri, 16 Apr 2021 15:44:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210416133146.24825-1-tzimmermann@suse.de>
Content-Language: en-US
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
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UGF0Y2hlcyAjMS0jNCBhcmUgUmV2aWV3ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlh
bi5rb2VuaWdAYW1kLmNvbT4KCk9uZSBtb3JlIGNvbW1lbnQgb24gdGhlIHZtdyBwYXRjaGVzLgoK
UmVnYXJkcywKQ2hyaXN0aWFuLgoKQW0gMTYuMDQuMjEgdW0gMTU6MzEgc2NocmllYiBUaG9tYXMg
WmltbWVybWFubjoKPiBJbXBsZW1lbnQgbW1hcCB2aWEgc3RydWN0IGRybV9nZW1fb2JqZWN0X2Z1
bmN0aW9ucy5tbWFwIGluIGFtZGdwdSwKPiByYWRlb24gYW5kIG5vdXZlYXUuIFRoaXMgYWxsb3dz
IGZvciB1c2luZyBjb21tb24gRFJNIGhlbHBlcnMgZm9yCj4gdGhlIG1tYXAtcmVsYXRlZCBjYWxs
YmFja3MgaW4gc3RydWN0IGZpbGVfb3BlcmF0aW9ucyBhbmQgc3RydWN0Cj4gZHJtX2RyaXZlci4g
VGhlIGRyaXZlcnMgaGF2ZSB0aGVpciBvd24gdm1fb3BzLCB3aGljaCBhcmUgbm93IHNldAo+IGF1
dG9tYXRpY2FsbHkgYnkgdGhlIERSTSBjb3JlIGZ1bmN0aW9ucy4gVGhlIGNvZGUgaW4gZWFjaCBk
cml2ZXIncwo+IHZlcmlmeV9hY2Nlc3MgYmVjb21lcyBwYXJ0IG9mIHRoZSBkcml2ZXIncyBuZXcg
bW1hcCBpbXBsZW1lbnRhdGlvbi4KPgo+IFdpdGggdGhlIEdFTSBkcml2ZXJzIGNvbnZlcnRlZCwg
dm13Z2Z4IGlzIHRoZSBvbmx5IHVzZXIgb2YKPiB0dG1fYm9fbW1hcCgpIGFuZCByZWxhdGVkIGlu
ZnJhc3RydWN0dXJlLiBTbyBtb3ZlIGV2ZXJ5dGhpbmcgaW50bwo+IHZtd2dmeCBhbmQgZGVsZXRl
IHRoZSByc3AgY29kZSBmcm9tIFRUTS4KPgo+IFRoaXMgdG91Y2hlcyBzZXZlcmFsIGRyaXZlcnMu
IFByZWZlcmFibHkgZXZlcnl0aGluZyB3b3VsZCBiZSBtZXJnZWQKPiBhdCBvbmNlIHZpYSBkcm0t
bWlzYy1uZXh0Lgo+Cj4gdjM6Cj4gCSogdGlkeSB1cCB0aGUgbmV3IG1tYXAgZnVuY3Rpb25zIGlu
IGFtZGdwdSBhbmQgcmFkZW9uIChDaHJpc3RpYW4pCj4gdjI6Cj4gCSogcmVtb3ZhbCBvZiBhbWRn
cHUgZmJkZXYgbW1hcCBhbHJlYWR5IG1lcmdlZCAoQ2hyaXN0aWFuKQo+IAkqIHJlYmFzZSBvbiB0
b3Agb2YgYW1kZ3B1IGZpeGVzIFsxXSAoRmVsaXgpCj4gCSogcmVwbGFjZSBwcl9lcnIoKSB3aXRo
IGRybV9lcnIoKSBpbiB2bXdnZnggcGF0Y2ggKFphY2spCj4gCSogc2V2ZXJhbCB0eXBvcwo+Cj4g
WzFdIGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvODg4MjIvCj4KPiBU
aG9tYXMgWmltbWVybWFubiAoNyk6Cj4gICAgZHJtL3R0bTogRG9uJ3Qgb3ZlcnJpZGUgdm1fb3Bz
IGNhbGxiYWNrcywgaWYgc2V0Cj4gICAgZHJtL2FtZGdwdTogSW1wbGVtZW50IG1tYXAgYXMgR0VN
IG9iamVjdCBmdW5jdGlvbgo+ICAgIGRybS9yYWRlb246IEltcGxlbWVudCBtbWFwIGFzIEdFTSBv
YmplY3QgZnVuY3Rpb24KPiAgICBkcm0vbm91dmVhdTogSW1wbGVtZW50IG1tYXAgYXMgR0VNIG9i
amVjdCBmdW5jdGlvbgo+ICAgIGRybS92bXdnZng6IElubGluZSB0dG1fYm9fbW1hcCgpIGludG8g
dm13Z2Z4IGRyaXZlcgo+ICAgIGRybS92bXdnZng6IElubGluZSB2bXdfdmVyaWZ5X2FjY2Vzcygp
Cj4gICAgZHJtL3R0bTogUmVtb3ZlIHR0bV9ib19tbWFwKCkgYW5kIGZyaWVuZHMKPgo+ICAgZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RtYV9idWYuYyB8IDQ2IC0tLS0tLS0tLS0t
LS0tLQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RtYV9idWYuaCB8ICAy
IC0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYyAgICAgfCAgNCAr
LQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dlbS5jICAgICB8IDQ0ICsr
KysrKysrKysrKysrCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmMg
ICAgIHwgNjQgLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV90dG0uaCAgICAgfCAgMSAtCj4gICBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9u
b3V2ZWF1X2JvLmMgICAgICAgIHwgMTAgLS0tLQo+ICAgZHJpdmVycy9ncHUvZHJtL25vdXZlYXUv
bm91dmVhdV9kcm0uYyAgICAgICB8ICAzICstCj4gICBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9u
b3V2ZWF1X2dlbS5jICAgICAgIHwgMzYgKysrKysrKysrKysrCj4gICBkcml2ZXJzL2dwdS9kcm0v
bm91dmVhdS9ub3V2ZWF1X3R0bS5jICAgICAgIHwgNDkgLS0tLS0tLS0tLS0tLS0tLQo+ICAgZHJp
dmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV90dG0uaCAgICAgICB8ICAxIC0KPiAgIGRyaXZl
cnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2Rydi5jICAgICAgICAgfCAgMyArLQo+ICAgZHJpdmVy
cy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fZ2VtLmMgICAgICAgICB8IDQ5ICsrKysrKysrKysrKysr
KysKPiAgIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX3R0bS5jICAgICAgICAgfCA2NSAt
LS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX3R0
bS5oICAgICAgICAgfCAgMSAtCj4gICBkcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib192bS5jICAg
ICAgICAgICAgIHwgNjAgKystLS0tLS0tLS0tLS0tLS0tLQo+ICAgZHJpdmVycy9ncHUvZHJtL3Zt
d2dmeC92bXdnZnhfdHRtX2J1ZmZlci5jICB8ICA5IC0tLQo+ICAgZHJpdmVycy9ncHUvZHJtL3Zt
d2dmeC92bXdnZnhfdHRtX2dsdWUuYyAgICB8IDUzICsrKysrKysrKysrKysrKystCj4gICBpbmNs
dWRlL2RybS90dG0vdHRtX2JvX2FwaS5oICAgICAgICAgICAgICAgIHwgMTMgLS0tLS0KPiAgIGlu
Y2x1ZGUvZHJtL3R0bS90dG1fZGV2aWNlLmggICAgICAgICAgICAgICAgfCAxNSAtLS0tLQo+ICAg
MjAgZmlsZXMgY2hhbmdlZCwgMTkxIGluc2VydGlvbnMoKyksIDMzNyBkZWxldGlvbnMoLSkKPgo+
IC0tCj4gMi4zMS4xCj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwo+IGFtZC1nZnggbWFpbGluZyBsaXN0Cj4gYW1kLWdmeEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ft
ZC1nZngKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
