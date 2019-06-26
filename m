Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A77055D9D
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 03:35:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C5526E17F;
	Wed, 26 Jun 2019 01:35:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A419A6E17F
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 01:35:38 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id j19so620215qtr.12
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 18:35:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=0LRAWyCoMm6qSJUgjbP8auCw69o7m+ZLWJtl7bdpb+w=;
 b=qLAgIxVonaasvAJqJOLa4vd3QYF3ex2RNaddWil/rTuhwJ8p7BIJtmbbuSkKDLlLk3
 yXRVg7pyG2JY3KzXADGAVme7k7Nos6+xdc46cJfwyZW9r8dpnn7n84PrQe3mRBVniESr
 bm4M14mo8jaGwA5rkpy98iP1HOLHhY36HXEYdRVzvoLbjbP2zTGu2C+z+q8gPARpIH4J
 BF4vxHStTHzJbBcM6zFcm0X5kuoSW7KbBkQQANGS3MgV/vSfMFq9T3zEFTiGcx/QqaEF
 Xn763t6eAEZWrz/0jM1UonuA2RHc27QlWfJEuetf+lSGkY6z7BCHXFmU7HTzOa26ZqWG
 UYIg==
X-Gm-Message-State: APjAAAUHvQfUMwTxbFS5pWlcENylbtuDlu/WPiQGHqq6gDtQjeR0tnqw
 AVxiGpp2gZsYK1JJbgC89Ws=
X-Google-Smtp-Source: APXvYqxpXDznfBJclCVx7xXV0zdyxRpLK69Oa2CuicRUspRtYvD+5giOq5ZovANyg2wCLBplsqvwMQ==
X-Received: by 2002:ac8:17a5:: with SMTP id o34mr1385680qtj.232.1561512937655; 
 Tue, 25 Jun 2019 18:35:37 -0700 (PDT)
Received: from smtp.gmail.com ([187.121.151.146])
 by smtp.gmail.com with ESMTPSA id 123sm7343770qkh.113.2019.06.25.18.35.32
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 25 Jun 2019 18:35:36 -0700 (PDT)
Date: Tue, 25 Jun 2019 22:35:30 -0300
From: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
To: Brian Starkey <brian.starkey@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Daniel Vetter <daniel@ffwll.ch>,
 Haneen Mohammed <hamohammed.sa@gmail.com>, Simon Ser <contact@emersion.fr>
Subject: [PATCH V3 0/5] drm/vkms: Introduces writeback support
Message-ID: <cover.1561491964.git.rodrigosiqueiramelo@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent;
 bh=0LRAWyCoMm6qSJUgjbP8auCw69o7m+ZLWJtl7bdpb+w=;
 b=Xwx6E+6qHDSLrgkTZG71QymmraL414RSn1b4jzWwNp/EQoGWChZXZCJ56w78XccijD
 1E+OOkSvvoDBM1ir+vgbxhq1ETv2ASxey+QcHAk0RffvDLUpCIiMwzBDcvl8aTWrspM9
 XsG2jdiayltXMWwNwSfszrKu3xxh8g/1rb9sEJ658YI+L7cYh87PrcXSNwTT8FBCTQh0
 jSpvEBID8+gwLbrQXSN0vNMY/mZg9v5On4L2zmP6Dojuz9QVukaYW9nzhWxNcmYSyX9u
 KMQdnGm0JDSZRi1Aq5eGZ92rrFhJldEE9SjhMRf9na6KrjyWi0nw0bZg+A6eNEhBrwkL
 U09A==
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBpcyB0aGUgVjMgdmVyc2lvbiBvZiBhIHNlcmllcyB0aGF0IGludHJvZHVjZXMgdGhlIHdy
aXRlYmFjayBzdXBwb3J0CnRvIHZrbXMuIEFzIGEgcmVzdWx0IG9mIHRoZSBwcmV2aW91cyByZXZp
ZXcsIHRoaXMgcGF0Y2hzZXQgY2FuIGJlIHNlZW4KaW4gdGhyZWUgcGFydHM6IG1ha2UgdmttcyBh
YmxlIHRvIHN1cHBvcnQgbXVsdGlwbGUgY29ubmVjdG9yLCBwcmUtd29yawpmb3IgdmttcywgYW5k
IHRoZSB2a21zIGltcGxlbWVudGF0aW9uLiBGb2xsb3dzIHRoZSBkZXRhaWxzOgoKKiBGaXJzdCBw
YXJ0OiBUaGUgZmlyc3QgcGF0Y2ggb2YgdGhpcyBzZXJpZXMgaXMgYSBmaXggdGhhdCBlbmFibGVz
IHZrbXMgdG8KYWNjZXB0IG5ldyBjb25uZWN0b3JzLCBzdWNoIGFzIHdyaXRlYmFjayBjb25uZWN0
b3IuCgoqIFNlY29uZCBwYXJ0OiBUaGUgc2Vjb25kIHBhcnQgb2YgdGhpcyBwYXRjaHNldCBzdGFy
dHMgb24gcGF0Y2ggMDIgYW5kCmZpbmlzaCBvbiBwYXRjaCAwNDsgYmFzaWNhbGx5IGl0IGlzIGEg
cHJlLXdvcmsgdGhhdCBhaW1zIHRvIG1ha2Ugdmttcwpjb21wb3NlciBvcGVyYXRpb25zIGEgbGl0
dGxlIGJpdCBtb3JlIGdlbmVyaWMuIFRoZXNlIHBhdGNoZXMgdXBkYXRlIHRoZQpDUkMgZmlsZXMg
YW5kIGZ1bmN0aW9uIHRvIG1ha2UgaXQgd29yayBhcyBhIGNvbXBvc2VyOyBpdCBhbHNvCmNlbnRy
YWxpemVzIHRoZSB2a21zIGZyYW1lYnVmZmVyIG9wZXJhdGlvbnMuIEFkZGl0aW9uYWxseSwgdGhl
c2UgY2hhbmdlcwplbmFibGUgdGhlIGNvbXBvc2VyIHRvIHVzZSB0aGUgd3JpdGViYWNrIGZyYW1l
YnVmZmVyIGluc3RlYWQgb2YgY3JlYXRpbmcKYSBjb3B5LgoKKiBUaGlyZCBwYXJ0OiBUaGUgZmlu
YWwgcGF0Y2ggZW5hYmxlcyB0aGUgc3VwcG9ydCBmb3Igd3JpdGViYWNrIGluIHZrbXMuCgpXaXRo
IHRoaXMgcGF0Y2hzZXQsIHZrbXMgY2FuIHN1Y2Nlc3NmdWxseSBwYXNzIGFsbCB0aGUga21zX3dy
aXRlYmFjawp0ZXN0cyBmcm9tIElHVC4KCk5vdGU6IE1vc3Qgb2YgdGhlIGNoYW5nZXMgaW4gdGhl
IFYzIHdhcyBzdWdnZXN0ZWQgYnkgRGFuaWVsIFZldHRlciBhcwpjYW4gYmUgc2VlbiBhdCB0aGUg
bGluawpodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvcGF0Y2gvMzExODQ0Lz9zZXJp
ZXM9NjE3MzgmcmV2PTIKCk5vdGU6IFRoaXMgcGF0Y2hzZXQgZGVwZW5kcyBvbiBEYW5pZWwncyBy
ZXdvcmsgb2YgQ1JDLCBzZWUgaXQgYXQKaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3Jn
L3Nlcmllcy82MTczNy8KClJvZHJpZ28gU2lxdWVpcmEgKDUpOgogIGRybS92a21zOiBBdm9pZCBh
c3NpZ25pbmcgMCBmb3IgcG9zc2libGVfY3J0YwogIGRybS92a21zOiBSZW5hbWUgdmttc19jcmMu
YyBpbnRvIHZrbXNfY29tcG9zZXIuYwogIGRybS92a21zOiBEZWNvdXBsZSBjcmMgb3BlcmF0aW9u
cyBmcm9tIGNvbXBvc2VyCiAgZHJtL3ZrbXM6IENvbXB1dGUgQ1JDIHdpdGhvdXQgY2hhbmdlIGlu
cHV0IGRhdGEKICBkcm0vdmttczogQWRkIHN1cHBvcnQgZm9yIHdyaXRlYmFjawoKIGRyaXZlcnMv
Z3B1L2RybS92a21zL01ha2VmaWxlICAgICAgICAgICAgICAgICB8ICAgOSArLQogLi4uL2RybS92
a21zL3t2a21zX2NyYy5jID0+IHZrbXNfY29tcG9zZXIuY30gIHwgMTc0ICsrKysrKysrKystLS0t
LS0tLQogZHJpdmVycy9ncHUvZHJtL3ZrbXMvdmttc19jcnRjLmMgICAgICAgICAgICAgIHwgIDMw
ICstLQogZHJpdmVycy9ncHUvZHJtL3ZrbXMvdmttc19kcnYuYyAgICAgICAgICAgICAgIHwgIDEw
ICstCiBkcml2ZXJzL2dwdS9kcm0vdmttcy92a21zX2Rydi5oICAgICAgICAgICAgICAgfCAgNDAg
KystLQogZHJpdmVycy9ncHUvZHJtL3ZrbXMvdmttc19vdXRwdXQuYyAgICAgICAgICAgIHwgIDE2
ICstCiBkcml2ZXJzL2dwdS9kcm0vdmttcy92a21zX3BsYW5lLmMgICAgICAgICAgICAgfCAgNDAg
KystLQogZHJpdmVycy9ncHUvZHJtL3ZrbXMvdmttc193cml0ZWJhY2suYyAgICAgICAgIHwgMTQx
ICsrKysrKysrKysrKysrCiA4IGZpbGVzIGNoYW5nZWQsIDMzMSBpbnNlcnRpb25zKCspLCAxMjkg
ZGVsZXRpb25zKC0pCiByZW5hbWUgZHJpdmVycy9ncHUvZHJtL3ZrbXMve3ZrbXNfY3JjLmMgPT4g
dmttc19jb21wb3Nlci5jfSAoNTElKQogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2Ry
bS92a21zL3ZrbXNfd3JpdGViYWNrLmMKCi0tIAoyLjIxLjAKCgotLSAKUm9kcmlnbyBTaXF1ZWly
YQpodHRwczovL3NpcXVlaXJhLnRlY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
