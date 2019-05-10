Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD2921999C
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2019 10:24:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BF5289A5D;
	Fri, 10 May 2019 08:23:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EAB989916;
 Fri, 10 May 2019 05:50:58 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id z16so2433703pgv.11;
 Thu, 09 May 2019 22:50:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=7DNbQy+XeUwJNnsLrbsf7GgVt3vG1E1+vrBOysMv8YE=;
 b=nzfYQfGudmFEiENyFC8o3Ioy/qvaOHaWAAa9c2OzBj5VWG5uVonWpWMgqVXjkl693H
 3PiTv9b0QeWxU91sLnnAzMlgKjv12i3nWZuE6zqE5j/DDMhf8bC2rFiiM2LyCa6wpDb5
 0fSvMU26ftHpRQuI9Lu4e+GTb1x97+k7JukqDsvi/X1+VhnW6WGJutrlnc3hipQPTmfK
 weuw5NW5mks9p2AyZSAGDM2uh2JBIUE4NASy6zn+z2hDskxiqAzcf7vij1Qe64Q6zfgz
 s5bhs4acYdN9PC1Lmfw3kF1H2XAMWhH3mpiyJr+XoAeRofFNVbCw7K+h2Hof86CQCE2G
 RA3g==
X-Gm-Message-State: APjAAAUQMd2V7TqNCgTAoYvU0gF9CjLfz2n39OcmRmpkQbocWSJ4Eteu
 k6vO1IicwP59pco2MNJ1Qw0=
X-Google-Smtp-Source: APXvYqzoTTJJuY7emFpyseXgmhhtAkOmA0sg3IQDQa3Kp5WUeM/5FO2g9Cz09UPUzVof3g3O+Df1Sg==
X-Received: by 2002:a63:a55:: with SMTP id z21mr11336025pgk.440.1557467457679; 
 Thu, 09 May 2019 22:50:57 -0700 (PDT)
Received: from localhost ([39.7.15.25])
 by smtp.gmail.com with ESMTPSA id i12sm4613535pgb.61.2019.05.09.22.50.55
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 09 May 2019 22:50:56 -0700 (PDT)
Date: Fri, 10 May 2019 14:50:53 +0900
From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH] kernel/locking/semaphore: use wake_q in up()
Message-ID: <20190510055053.GA9864@jagdpanzerIV>
References: <20190509120903.28939-1-daniel.vetter@ffwll.ch>
 <20190509200633.19678-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190509200633.19678-1-daniel.vetter@ffwll.ch>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Mailman-Approved-At: Fri, 10 May 2019 08:23:54 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=7DNbQy+XeUwJNnsLrbsf7GgVt3vG1E1+vrBOysMv8YE=;
 b=pUfvvAZFqUVTiqjxv40mkHsNUmq7PBox1pFF166ZopvOvdfQGvbOVJnOm+aoJu5sEz
 DOggZuoz45ZIDa8GI90MV1/vdHaAAtQI9uW956G/4MxykZgBJ2dWMiXvBvfSHjOFwgFO
 /H0TseWHxGUXAS4l8bz4i3L4KVPE7Ts5JNHc7z4SLbLGzOGL7XDZuY3s+d85vDTOMcBO
 0KezU2gXMeA0eGAB4od6jTnHD0HZmFlH0OXeiTpfzy2NhQdcpFyHsUTxdOz8w2oL6U4o
 xXOdPK6D0yIW2TzK4KruW/bOPNR9VrQJG3ue4SDSTv3AHdmqAvYgCpT6pVAQyxERl4ge
 tf5A==
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
Cc: Petr Mladek <pmladek@suse.com>, John Ogness <john.ogness@linutronix.de>,
 Peter Zijlstra <peterz@infradead.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Ingo Molnar <mingo@redhat.com>, Steven Rostedt <rostedt@goodmis.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gKDA1LzA5LzE5IDIyOjA2KSwgRGFuaWVsIFZldHRlciB3cm90ZToKWy4uXQo+ICsvKiBGdW5j
dGlvbnMgZm9yIHRoZSBjb250ZW5kZWQgY2FzZSAqLwo+ICsKPiArc3RydWN0IHNlbWFwaG9yZV93
YWl0ZXIgewo+ICsJc3RydWN0IGxpc3RfaGVhZCBsaXN0Owo+ICsJc3RydWN0IHRhc2tfc3RydWN0
ICp0YXNrOwo+ICsJYm9vbCB1cDsKPiArfTsKPiArCj4gIC8qKgo+ICAgKiB1cCAtIHJlbGVhc2Ug
dGhlIHNlbWFwaG9yZQo+ICAgKiBAc2VtOiB0aGUgc2VtYXBob3JlIHRvIHJlbGVhc2UKPiBAQCAt
MTc5LDI0ICsxODcsMjUgQEAgRVhQT1JUX1NZTUJPTChkb3duX3RpbWVvdXQpOwo+ICB2b2lkIHVw
KHN0cnVjdCBzZW1hcGhvcmUgKnNlbSkKPiAgewo+ICAJdW5zaWduZWQgbG9uZyBmbGFnczsKPiAr
CXN0cnVjdCBzZW1hcGhvcmVfd2FpdGVyICp3YWl0ZXI7Cj4gKwlERUZJTkVfV0FLRV9RKHdha2Vf
cSk7Cj4gIAo+ICAJcmF3X3NwaW5fbG9ja19pcnFzYXZlKCZzZW0tPmxvY2ssIGZsYWdzKTsKPiAt
CWlmIChsaWtlbHkobGlzdF9lbXB0eSgmc2VtLT53YWl0X2xpc3QpKSkKPiArCWlmIChsaWtlbHko
bGlzdF9lbXB0eSgmc2VtLT53YWl0X2xpc3QpKSkgewo+ICAJCXNlbS0+Y291bnQrKzsKPiAtCWVs
c2UKPiAtCQlfX3VwKHNlbSk7Cj4gKwl9IGVsc2Ugewo+ICsJCXdhaXRlciA9ICBsaXN0X2ZpcnN0
X2VudHJ5KCZzZW0tPndhaXRfbGlzdCwKPiArCQkJCQkgICBzdHJ1Y3Qgc2VtYXBob3JlX3dhaXRl
ciwgbGlzdCk7Cj4gKwkJbGlzdF9kZWwoJndhaXRlci0+bGlzdCk7Cj4gKwkJd2FpdGVyLT51cCA9
IHRydWU7Cj4gKwkJd2FrZV9xX2FkZCgmd2FrZV9xLCB3YWl0ZXItPnRhc2spOwo+ICsJfQo+ICAJ
cmF3X3NwaW5fdW5sb2NrX2lycXJlc3RvcmUoJnNlbS0+bG9jaywgZmxhZ3MpOwoKU28gdGhlIG5l
dyBjb2RlIHN0aWxsIGNhbiBwcmludGsvV0FSTiB1bmRlciBzZW0tPmxvY2sgaW4gc29tZSBidWdn
eQpjYXNlcy4KCkUuZy4KCXdha2VfcV9hZGQoKQoJIGdldF90YXNrX3N0cnVjdCgpCgkgIHJlZmNv
dW50X2luY19jaGVja2VkKCkKCSAgIFdBUk5fT05DRSgpCgpBcmUgd2UgZmluZSB3aXRoIHRoYXQ/
CgoJLXNzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
