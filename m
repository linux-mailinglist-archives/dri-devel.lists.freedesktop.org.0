Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68ACE4A203
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2019 15:22:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB90E6E17F;
	Tue, 18 Jun 2019 13:22:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 407DB6E17F
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 13:21:59 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id w13so21747744eds.4
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 06:21:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=gPxHPlcPBpNmsxraB6zwaHf7lilECwsy9olDlPYn2GE=;
 b=WdET3meOnjP189N1y11KP8BkaKt+h1pGbzSPZS0wx/oWo4OhK5HrIWfXuU6jYgDHiZ
 buJyfAGP2Qr1n3bLf71z14IHoFb9fn6ecSWBE30BHovta8Ow2f/1SxwJtHP1Oil11Sqw
 s7UtpoIjTsA7k+TaGJVehPMf4D7E1ZgolJ30QiUS/DVRTqLK6GXFlIX89FIYRBhTtB76
 PIP6aciTR5l0jzT6gcK/CRLjnhhH/ZoiOVXi/B87oFtLsr9e9Hc9T562r39yPVPHjLYC
 0E5K3hyBy7Jpyhv/DcM77pcmy6I4ViMwKYXMWX45qMgf+MJPZPJ/ANS91ZoKXcI+h9o1
 1L9w==
X-Gm-Message-State: APjAAAX2silytdkLOMf7Jm0WS2Z0ne9gbvkUV0D5ZkQQNhmG7CZHmntZ
 GSk6sOc3JUb/M7C0yHNqq1jTpA==
X-Google-Smtp-Source: APXvYqz5xh0Ks+/le9Qy+t4yCWlWexol0YmMW1dbV2XBjweGTWy3hGYi07Gf0FlO9P3UPMtZksFFiA==
X-Received: by 2002:a50:b617:: with SMTP id b23mr56523354ede.135.1560864117949; 
 Tue, 18 Jun 2019 06:21:57 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id q56sm4702093eda.28.2019.06.18.06.21.56
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 18 Jun 2019 06:21:57 -0700 (PDT)
Date: Tue, 18 Jun 2019 15:21:55 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH] drm: rcar-du: Replace drm_driver GEM ops with GEM object
 functions
Message-ID: <CAKMK7uEDmTfyEft4v0vpZsmYTC-jA2pCMMTt=T9r5Dis7gKEmQ@mail.gmail.com>
References: <20190618131329.30336-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190618131329.30336-1-laurent.pinchart+renesas@ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=gPxHPlcPBpNmsxraB6zwaHf7lilECwsy9olDlPYn2GE=;
 b=MwgFvwzeufOEXf7Klj4gLJ53sRFaqfMEtTpeEbB5Hy+dz4nuD2yZzsxZlUDtfWFfn1
 b2SpwK0KF6L9P2FujH4IsHZSzel04d8nCObWVlQl1nYkOBXeEXAcloC8iNiOxDoVpse9
 gkum8aCvbOQAWnw9m+GNHV549io7hFn5+XFnU=
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
Cc: "open list:DRM DRIVERS FOR RENESAS" <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdW4gMTgsIDIwMTkgYXQgMzoxMyBQTSBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50
LnBpbmNoYXJ0K3JlbmVzYXNAaWRlYXNvbmJvYXJkLmNvbT4gd3JvdGU6Cj4KPiBUaGUgcmVjb21t
ZW5kZWQgd2F5IHRvIHNwZWNpZnkgR0VNIG9iamVjdCBmdW5jdGlvbnMgaXMgdG8gcHJvdmlkZSBh
Cj4gZHJtX2dlbV9vYmplY3RfZnVuY3Mgc3RydWN0dXJlIGluc3RhbmNlIGFuZCBzZXQgdGhlIEdF
TSBvYmplY3QgdG8gcG9pbnQKPiB0byBpdC4gVGhlIGRybV9jbWFfZ2VtX2NyZWF0ZV9vYmplY3Rf
ZGVmYXVsdF9mdW5jcygpIGZ1bmN0aW9uIHByb3ZpZGVkCj4gYnkgdGhlIEdFTSBDTUEgaGVscGVy
IGRvZXMgc28gd2hlbiBjcmVhdGluZyB0aGUgR0VNIG9iamVjdCwgc2ltcGxpZnlpbmcKPiB0aGUg
ZHJpdmVyIGltcGxlbWVudGF0aW9uLiBTd2l0Y2ggdG8gaXQsIGFuZCByZW1vdmUgdGhlIHRoZW4g
dW5uZWVkZWQKPiBHRU0tcmVsYXRlZCBvcGVydGlvbnMgZnJvbSByY2FyX2R1X2RyaXZlci4KPgo+
IFN1Z2dlc3RlZC1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KPiBT
aWduZWQtb2ZmLWJ5OiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0K3JlbmVzYXNA
aWRlYXNvbmJvYXJkLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9k
dV9kcnYuYyB8IDggKy0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCA3
IGRlbGV0aW9ucygtKQo+Cj4gRGFuaWVsLCBpcyB0aGlzIHdoYXQgeW91IGhhZCBpbiBtaW5kID8K
Cll1cCwgSSB0aGluayB0aGF0J3MgaXQuIE5vcmFsZiBjb21tZW50ZWQgdGhhdCB3ZSBtaWdodCB3
YW50IHRvIGhhdmUKRFJNX0dFTV9DTUFfRFJJVkVSX09QUyBtYWNybyBmb3IgdGhlIHJlbWFpbmlu
ZyBmZXcgZHJtX2RyaXZlciBob29rcywgbGlrZQpEUk1fR0VNX0NNQV9WTUFQX0RSSVZFUl9PUFMg
YnV0IHdpdGhvdXQgdGhlIGZvcmNlZCB2bWFwIG9uIGltcG9ydC4gQnV0CnRoYXQncyBvayB0byBk
byBpbiBzb21lIGZvbGxvdy11cCBjbGVhbnVwIHRvby4gT24gdGhpczoKClJldmlld2VkLWJ5OiBE
YW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgoKCj4KPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9kdV9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9y
Y2FyLWR1L3JjYXJfZHVfZHJ2LmMKPiBpbmRleCAzZTVlODM1ZWEyYjYuLjRjYmI4MjAwOTkzMSAx
MDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2FyX2R1X2Rydi5jCj4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9kdV9kcnYuYwo+IEBAIC00NDUsMTYgKzQ0
NSwxMCBAQCBERUZJTkVfRFJNX0dFTV9DTUFfRk9QUyhyY2FyX2R1X2ZvcHMpOwo+ICBzdGF0aWMg
c3RydWN0IGRybV9kcml2ZXIgcmNhcl9kdV9kcml2ZXIgPSB7Cj4gICAgICAgICAuZHJpdmVyX2Zl
YXR1cmVzICAgICAgICA9IERSSVZFUl9HRU0gfCBEUklWRVJfTU9ERVNFVCB8IERSSVZFUl9QUklN
RQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCBEUklWRVJfQVRPTUlDLAo+IC0g
ICAgICAgLmdlbV9mcmVlX29iamVjdF91bmxvY2tlZCA9IGRybV9nZW1fY21hX2ZyZWVfb2JqZWN0
LAo+IC0gICAgICAgLmdlbV92bV9vcHMgICAgICAgICAgICAgPSAmZHJtX2dlbV9jbWFfdm1fb3Bz
LAo+ICsgICAgICAgLmdlbV9jcmVhdGVfb2JqZWN0ICAgICAgPSBkcm1fY21hX2dlbV9jcmVhdGVf
b2JqZWN0X2RlZmF1bHRfZnVuY3MsCj4gICAgICAgICAucHJpbWVfaGFuZGxlX3RvX2ZkICAgICA9
IGRybV9nZW1fcHJpbWVfaGFuZGxlX3RvX2ZkLAo+ICAgICAgICAgLnByaW1lX2ZkX3RvX2hhbmRs
ZSAgICAgPSBkcm1fZ2VtX3ByaW1lX2ZkX3RvX2hhbmRsZSwKPiAtICAgICAgIC5nZW1fcHJpbWVf
aW1wb3J0ICAgICAgID0gZHJtX2dlbV9wcmltZV9pbXBvcnQsCj4gLSAgICAgICAuZ2VtX3ByaW1l
X2V4cG9ydCAgICAgICA9IGRybV9nZW1fcHJpbWVfZXhwb3J0LAo+IC0gICAgICAgLmdlbV9wcmlt
ZV9nZXRfc2dfdGFibGUgPSBkcm1fZ2VtX2NtYV9wcmltZV9nZXRfc2dfdGFibGUsCj4gICAgICAg
ICAuZ2VtX3ByaW1lX2ltcG9ydF9zZ190YWJsZSA9IGRybV9nZW1fY21hX3ByaW1lX2ltcG9ydF9z
Z190YWJsZSwKPiAtICAgICAgIC5nZW1fcHJpbWVfdm1hcCAgICAgICAgID0gZHJtX2dlbV9jbWFf
cHJpbWVfdm1hcCwKPiAtICAgICAgIC5nZW1fcHJpbWVfdnVubWFwICAgICAgID0gZHJtX2dlbV9j
bWFfcHJpbWVfdnVubWFwLAo+ICAgICAgICAgLmdlbV9wcmltZV9tbWFwICAgICAgICAgPSBkcm1f
Z2VtX2NtYV9wcmltZV9tbWFwLAo+ICAgICAgICAgLmR1bWJfY3JlYXRlICAgICAgICAgICAgPSBy
Y2FyX2R1X2R1bWJfY3JlYXRlLAo+ICAgICAgICAgLmZvcHMgICAgICAgICAgICAgICAgICAgPSAm
cmNhcl9kdV9mb3BzLAo+IC0tCj4gUmVnYXJkcywKPgo+IExhdXJlbnQgUGluY2hhcnQKPgoKCi0t
CkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCis0MSAo
MCkgNzkgMzY1IDU3IDQ4IC0gaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
