Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A072A6E18C
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jul 2019 09:16:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DCDD6E5A9;
	Fri, 19 Jul 2019 07:16:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D91066E466
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2019 19:51:55 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id o13so13341520pgp.12
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2019 12:51:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:mime-version
 :content-transfer-encoding:in-reply-to:references:subject:to:cc:from
 :user-agent:date;
 bh=zfYhBy8rXbE//COaxouGyZdN8XuohHpGRV5GXewnrg0=;
 b=gQI43xOdUWYZXAux6pCJjkbSS9HUjd+ZvniPl4iNTQCNcqNPVOGS7eWUxNFCPvl8yg
 g4S849zCybbKg4UKoN1iIwPGMUBtJRTern3wbX1fBjyfIICMql6r3HHM8ni9pheo+qld
 I9bkgTkiGfrTtE8tzhOsgMM6tdaSgRcNk3Yv4IC/76whEFAWMbCefcYwZj1t249l3J59
 JGsmag758nzhb4YfnxlgC3Iohijb5hWHIMhZaIjZmdudph1DyRfBWJp+WMgV+/BNvQKP
 2fsQwc4PWEIszgCi3qHvr+plUq0CxEGqHoCsfj6E8TUECvDQI1NxeOnbne9ZVZWDQ38S
 BTuA==
X-Gm-Message-State: APjAAAUHzZP7Gp5qqBLJi1ROygUveK7g5jMycRVwnjRRNU7r7pqUQPjb
 oZyME0hujiiJbt9yjZaFEggKbw==
X-Google-Smtp-Source: APXvYqzX3YfqRbUFuVRr8VkMWQFTqQ6b7l4FMXcRmJo8G3y5rS4fIdQe2lsE0s0MX+8ly1O9es6xBg==
X-Received: by 2002:a63:205f:: with SMTP id r31mr49503340pgm.159.1563479515402; 
 Thu, 18 Jul 2019 12:51:55 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
 by smtp.gmail.com with ESMTPSA id y23sm30556546pfo.106.2019.07.18.12.51.54
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 18 Jul 2019 12:51:54 -0700 (PDT)
Message-ID: <5d30cdda.1c69fb81.de220.1f10@mx.google.com>
MIME-Version: 1.0
In-Reply-To: <20190630124735.27786-1-robdclark@gmail.com>
References: <20190630124735.27786-1-robdclark@gmail.com>
Subject: Re: [PATCH] drm/msm: stop abusing dma_map/unmap for cache
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.8.1
Date: Thu, 18 Jul 2019 12:51:53 -0700
X-Mailman-Approved-At: Fri, 19 Jul 2019 07:16:02 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=message-id:mime-version:content-transfer-encoding:in-reply-to
 :references:subject:to:cc:from:user-agent:date;
 bh=zfYhBy8rXbE//COaxouGyZdN8XuohHpGRV5GXewnrg0=;
 b=DKzzyJpgwrlpAymFb04FfC77Rz/8v2x2vMt97Uo5AbdJL5GOULus42XL9FeHmoaRKU
 63iDopVnfj/IHyacy+pTTzrtu2JsX/GIkaMVxiVuO9aQob2DW/xay1dZuqkLoDJlE19X
 clXgrN9nBoB9+m3VTyBOgFl4dyyN77fIsnv98=
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBSb2IgQ2xhcmsgKDIwMTktMDYtMzAgMDU6NDc6MjIpCj4gRnJvbTogUm9iIENsYXJr
IDxyb2JkY2xhcmtAY2hyb21pdW0ub3JnPgo+IAo+IFJlY2VudGx5IHNwbGF0cyBsaWtlIHRoaXMg
c3RhcnRlZCBzaG93aW5nIHVwOgo+IAo+ICAgIFdBUk5JTkc6IENQVTogNCBQSUQ6IDI1MSBhdCBk
cml2ZXJzL2lvbW11L2RtYS1pb21tdS5jOjQ1MSBfX2lvbW11X2RtYV91bm1hcCsweGI4LzB4YzAK
PiAgICBNb2R1bGVzIGxpbmtlZCBpbjogYXRoMTBrX3Nub2MgYXRoMTBrX2NvcmUgZnVzZSBtc20g
YXRoIG1hYzgwMjExIHV2Y3ZpZGVvIGNmZzgwMjExIHZpZGVvYnVmMl92bWFsbG9jIHZpZGVvYnVm
Ml9tZW1vcHMgdmlkZQo+ICAgIENQVTogNCBQSUQ6IDI1MSBDb21tOiBrd29ya2VyL3UxNjo0IFRh
aW50ZWQ6IEcgICAgICAgIFcgICAgICAgICA1LjIuMC1yYzUtbmV4dC0yMDE5MDYxOSsgIzIzMTcK
PiAgICBIYXJkd2FyZSBuYW1lOiBMRU5PVk8gODFKTC9MTlZOQjE2MTIxNiwgQklPUyA5VUNOMjNX
VyhWMS4wNikgMTAvMjUvMjAxOAo+ICAgIFdvcmtxdWV1ZTogbXNtIG1zbV9nZW1fZnJlZV93b3Jr
IFttc21dCj4gICAgcHN0YXRlOiA4MGMwMDAwNSAoTnpjdiBkYWlmICtQQU4gK1VBTykKPiAgICBw
YyA6IF9faW9tbXVfZG1hX3VubWFwKzB4YjgvMHhjMAo+ICAgIGxyIDogX19pb21tdV9kbWFfdW5t
YXArMHg1NC8weGMwCj4gICAgc3AgOiBmZmZmMDAwMDExOWFiY2UwCj4gICAgeDI5OiBmZmZmMDAw
MDExOWFiY2UwIHgyODogMDAwMDAwMDAwMDAwMDAwMAo+ICAgIHgyNzogZmZmZjgwMDFmOTk0NjY0
OCB4MjY6IGZmZmY4MDAxZWMyNzEwNjgKPiAgICB4MjU6IDAwMDAwMDAwMDAwMDAwMDAgeDI0OiBm
ZmZmODAwMWVhMzU4MGE4Cj4gICAgeDIzOiBmZmZmODAwMWY5NWJhMDEwIHgyMjogZmZmZjgwMDE4
ZTgzYmE4OAo+ICAgIHgyMTogZmZmZjgwMDFlNTQ4ZjAwMCB4MjA6IGZmZmZmZmZmZmZmZmYwMDAK
PiAgICB4MTk6IDAwMDAwMDAwMDAwMDEwMDAgeDE4OiAwMDAwMDAwMGMwMDAwMWZlCj4gICAgeDE3
OiAwMDAwMDAwMDAwMDAwMDAwIHgxNjogMDAwMDAwMDAwMDAwMDAwMAo+ICAgIHgxNTogZmZmZjAw
MDAxNWI3MDA2OCB4MTQ6IDAwMDAwMDAwMDAwMDAwMDUKPiAgICB4MTM6IDAwMDMxNDJjYzFiZTE3
NjggeDEyOiAwMDAwMDAwMDAwMDAwMDAxCj4gICAgeDExOiBmZmZmODAwMWY2ZGU5MTAwIHgxMDog
MDAwMDAwMDAwMDAwMDAwOQo+ICAgIHg5IDogZmZmZjAwMDAxNWI3ODAwMCB4OCA6IDAwMDAwMDAw
MDAwMDAwMDAKPiAgICB4NyA6IDAwMDAwMDAwMDAwMDAwMDEgeDYgOiBmZmZmZmZmZmZmZmZmMDAw
Cj4gICAgeDUgOiAwMDAwMDAwMDAwMDAwZmZmIHg0IDogZmZmZjAwMDAxMDY1ZGJjOAo+ICAgIHgz
IDogMDAwMDAwMDAwMDAwMDAwZCB4MiA6IDAwMDAwMDAwMDAwMDEwMDAKPiAgICB4MSA6IGZmZmZm
ZmZmZmZmZmYwMDAgeDAgOiAwMDAwMDAwMDAwMDAwMDAwCj4gICAgQ2FsbCB0cmFjZToKPiAgICAg
X19pb21tdV9kbWFfdW5tYXArMHhiOC8weGMwCj4gICAgIGlvbW11X2RtYV91bm1hcF9zZysweDk4
LzB4YjgKPiAgICAgcHV0X3BhZ2VzKzB4NWMvMHhmMCBbbXNtXQo+ICAgICBtc21fZ2VtX2ZyZWVf
d29yaysweDEwYy8weDE1MCBbbXNtXQo+ICAgICBwcm9jZXNzX29uZV93b3JrKzB4MWUwLzB4MzMw
Cj4gICAgIHdvcmtlcl90aHJlYWQrMHg0MC8weDQzOAo+ICAgICBrdGhyZWFkKzB4MTJjLzB4MTMw
Cj4gICAgIHJldF9mcm9tX2ZvcmsrMHgxMC8weDE4Cj4gICAgLS0tWyBlbmQgdHJhY2UgYWZjMGRj
NWFiODFhMDZiZiBdLS0tCgpUZXN0ZWQtYnk6IFN0ZXBoZW4gQm95ZCA8c3dib3lkQGNocm9taXVt
Lm9yZz4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
