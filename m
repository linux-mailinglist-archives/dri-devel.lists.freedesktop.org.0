Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 76E79CFE96
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2019 18:11:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A3CA6E84D;
	Tue,  8 Oct 2019 16:11:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3208189870;
 Tue,  8 Oct 2019 16:11:31 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id y3so18205922ljj.6;
 Tue, 08 Oct 2019 09:11:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AT+kDpEjrdBshsMqJBNVg8JsTs5Ln99yNIaxkRDtThA=;
 b=n7JtoM6i/MR8SUOVqbQbWEB/jKd5SUdlaG9XxxsoEbj8JLOiynTjEv7OagmHegsCaM
 4Qjv2p/1gc9AARAEJGYJQw/FVfRwJr3H+Ps8FI35SBBfB7rPjZZ6UhUOfH0VjGKQv62U
 NQ04UzXW6I/urDL2/6yuNEZpD7jvEJzVyXfgLo81MhvkAZNqYiBzKp79ssuMgOX9quUx
 i4uhW80/6e1ef+5YRPFEP+nxfVvbvbIeCZx7KHPrITz4DWboa5ArdYG0MG++ZjCu+r1V
 RM7RPR/gn1vr9FEVsyZiDVnDylClsMAt1KHqojILnuf389/6RRR/SeHXjJjypIJso90B
 MyPw==
X-Gm-Message-State: APjAAAU5ljryNbZhTTdfdebuqSukK5a7P/Uv0lZWXLQvn0S271fUvxBA
 Xohq24wnhIpQd3NH0FxZ3ZHQkLwDiojxQ5Ep3RU=
X-Google-Smtp-Source: APXvYqwn5DlZGijUmc7DgbkIfu62kvr3NLZ18Ba3IyP+/Ho1XmFOjIm2o1fNq5KIpNcvuRoaxSrAnDitq5DGjmcTndI=
X-Received: by 2002:a2e:7502:: with SMTP id q2mr23044246ljc.202.1570551089481; 
 Tue, 08 Oct 2019 09:11:29 -0700 (PDT)
MIME-Version: 1.0
References: <20190904171723.2956-1-robdclark@gmail.com>
In-Reply-To: <20190904171723.2956-1-robdclark@gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 8 Oct 2019 13:11:19 -0300
Message-ID: <CAOMZO5DgnB0kuSTxg1=ngJYiRvbq6bqBC4K-R5nQMzEinBYq7A@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: Use the correct dma_sync calls harder
To: Rob Clark <robdclark@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=AT+kDpEjrdBshsMqJBNVg8JsTs5Ln99yNIaxkRDtThA=;
 b=H6F4206g5t18kFz01VuQPieIxoQpVLKANGGFoXM6ePueTOX2VPQy9nC+c5TYLTnnzm
 cXmJh9QSTByOD5ZAOuYOjClZi5iBiCF0vNx1zq00dK7Wyi1H1+gZlfWIMVXePyHUeYca
 DY1z20zNcqEog30lb3AZ6JYZ1rz+7vvs4wfDZc0EOU+hH9z4Q1aohsLuA7I8reUzxSLw
 3K8n5XJvZDHvVgXXusNohBOFHHLJC86XiJ/xtyMX1XKyUSo2F2L+ZdP+p3GKZUX8WDMv
 B8EVK03VA/5XGiwYMQQnR7PVYVqDziUUOGQJqQZlwKxx2OrIIOUYImbDXX5TRgaykp2i
 qvKg==
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgUm9iLAoKT24gV2VkLCBTZXAgNCwgMjAxOSBhdCAyOjE5IFBNIFJvYiBDbGFyayA8cm9iZGNs
YXJrQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBGcm9tOiBSb2IgQ2xhcmsgPHJvYmRjbGFya0BjaHJv
bWl1bS5vcmc+Cj4KPiBMb29rcyBsaWtlIHRoZSBkbWFfc3luYyBjYWxscyBkb24ndCBkbyB3aGF0
IHdlIHdhbnQgb24gYXJtdjcgZWl0aGVyLgo+IEZpeGVzOgo+Cj4gICBVbmFibGUgdG8gaGFuZGxl
IGtlcm5lbCBwYWdpbmcgcmVxdWVzdCBhdCB2aXJ0dWFsIGFkZHJlc3MgNTAwMDEwMDAKPiAgIHBn
ZCA9IChwdHJ2YWwpCj4gICBbNTAwMDEwMDBdICpwZ2Q9MDAwMDAwMDAKPiAgIEludGVybmFsIGVy
cm9yOiBPb3BzOiA4MDUgWyMxXSBTTVAgQVJNCj4gICBNb2R1bGVzIGxpbmtlZCBpbjoKPiAgIENQ
VTogMCBQSUQ6IDEgQ29tbTogc3dhcHBlci8wIE5vdCB0YWludGVkIDUuMy4wLXJjNi0wMDI3MS1n
OWYxNTlhZTA3ZjA3ICM0Cj4gICBIYXJkd2FyZSBuYW1lOiBGcmVlc2NhbGUgaS5NWDUzIChEZXZp
Y2UgVHJlZSBTdXBwb3J0KQo+ICAgUEMgaXMgYXQgdjdfZG1hX2NsZWFuX3JhbmdlKzB4MjAvMHgz
OAo+ICAgTFIgaXMgYXQgX19kbWFfcGFnZV9jcHVfdG9fZGV2KzB4MjgvMHg5MAo+ICAgcGMgOiBb
PGMwMTFjNzZjPl0gICAgbHIgOiBbPGMwMTE4MWM0Pl0gICAgcHNyOiAyMDAwMDAxMwo+ICAgc3Ag
OiBkODBiNWE4OCAgaXAgOiBkZTk2YzAwMCAgZnAgOiBkODQwY2U2Ywo+ICAgcjEwOiAwMDAwMDAw
MCAgcjkgOiAwMDAwMDAwMSAgcjggOiBkODQzZTAxMAo+ICAgcjcgOiAwMDAwMDAwMCAgcjYgOiAw
MDAwODAwMCAgcjUgOiBkZGI2YzAwMCAgcjQgOiAwMDAwMDAwMAo+ICAgcjMgOiAwMDAwMDAzZiAg
cjIgOiAwMDAwMDA0MCAgcjEgOiA1MDAwODAwMCAgcjAgOiA1MDAwMTAwMAo+ICAgRmxhZ3M6IG56
Q3YgIElSUXMgb24gIEZJUXMgb24gIE1vZGUgU1ZDXzMyICBJU0EgQVJNICBTZWdtZW50IG5vbmUK
PiAgIENvbnRyb2w6IDEwYzUzODdkICBUYWJsZTogNzAwMDQwMTkgIERBQzogMDAwMDAwNTEKPiAg
IFByb2Nlc3Mgc3dhcHBlci8wIChwaWQ6IDEsIHN0YWNrIGxpbWl0ID0gMHgocHRydmFsKSkKPgo+
IFNpZ25lZC1vZmYtYnk6IFJvYiBDbGFyayA8cm9iZGNsYXJrQGNocm9taXVtLm9yZz4KPiBGaXhl
czogM2RlNDMzYzViMzhhICgiZHJtL21zbTogVXNlIHRoZSBjb3JyZWN0IGRtYV9zeW5jIGNhbGxz
IGluIG1zbV9nZW0iKQo+IFRlc3RlZC1ieTogRmFiaW8gRXN0ZXZhbSA8ZmVzdGV2YW1AZ21haWwu
Y29tPgoKSSBzZWUgdGhpcyBvbmUgZ290IGFwcGxpZWQgaW4gbGludXgtbmV4dCBhbHJlYWR5LgpD
b3VsZCBpdCBiZSBzZW50IHRvIDUuNC1yYywgcGxlYXNlPwoKbXg1MyBib2FyZHMgY2Fubm90IGJv
b3QgaW4gbWFpbmxpbmUgYmVjYXVzZSBvZiB0aGlzLgoKVGhhbmtzCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
