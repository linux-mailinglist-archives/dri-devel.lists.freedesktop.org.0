Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A9E5A096
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2019 18:14:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DF126E95E;
	Fri, 28 Jun 2019 16:14:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 457E06E95E;
 Fri, 28 Jun 2019 16:14:24 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id d18so6896247wrs.5;
 Fri, 28 Jun 2019 09:14:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=mzjGpdyUnE8tyWhfYrbzoAUHHWJgOjqtqKpiy65Gd94=;
 b=IdApYemat+36CC1Mmml4c4KcZ/CPXjIFbXNGkB9ugqIAXtjtmzbVrBM5hSGgXCXNaE
 0VgIwHAyfldYYgdNxpts19/8hUeMOr9J1Pdo25BZFfqJDmi0ThipZaiRwIjf0yCyJfgK
 iaoG3gdPkESgsmLp2tZIW75UuXyPGySfkQGMVczeC2OgF+qcbQxNf1wUY4OptS/f0NvV
 NE86e6Y7uJDuXJnmzXhlvg4lNZdVo3dDsMDafMqPJEaIZaj694TIjNr1asqf+4WQuMiK
 N52kpGBZofrrL7IKUSxX89HqGW7PELRfmLH5RPU8ucJku/wCgvk/1kZUCLrZlUPTB20q
 qNXA==
X-Gm-Message-State: APjAAAXrW/6bmj9joKqEQovkkcbGm0zfDYcHK5Q6f032JImBAY9Ksz0r
 /+knUKEoyADXPsQ0rbgl6bE=
X-Google-Smtp-Source: APXvYqwgSYtXslBI4nEh1NIMxUpLMncY4ImUQPrqrFy1d1FX6KP2Ju4QzmSxf/2eNv+kxQyfYWi6wA==
X-Received: by 2002:adf:ee0a:: with SMTP id y10mr3267299wrn.169.1561738462929; 
 Fri, 28 Jun 2019 09:14:22 -0700 (PDT)
Received: from arch-x1c3 ([2a00:5f00:102:0:9665:9cff:feee:aa4d])
 by smtp.gmail.com with ESMTPSA id 15sm2634618wmk.34.2019.06.28.09.14.21
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 28 Jun 2019 09:14:22 -0700 (PDT)
Date: Fri, 28 Jun 2019 17:14:51 +0100
From: Emil Velikov <emil.l.velikov@gmail.com>
To: Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [RFC] Exposing plane type mask and handling 'all' planes
Message-ID: <20190628161451.GC30611@arch-x1c3>
References: <20190619160353.GE1896@arch-x1c3> <20190619163327.GC5942@intel.com>
 <CACvgo52N9MMDrVcofD8AB-nFiuGiwBGxf5NbKBRN4cV+v9YsQg@mail.gmail.com>
 <20190619182456.GE5942@intel.com>
 <20190626004642.GJ24125@mdroper-desk.amr.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190626004642.GJ24125@mdroper-desk.amr.corp.intel.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=mzjGpdyUnE8tyWhfYrbzoAUHHWJgOjqtqKpiy65Gd94=;
 b=TBIhCW8F0y/R+vf0jQx3XQ8uDejAGZekOtZTf2R5k4a3tVcJbMSf7OyNz2b6pkcXB8
 m5lrvZDfgS+qo31Gc8UFnnZPZbFG4s1GM5LJmjAffzsJ9HxGod8mhwjB6itkMNxspKCm
 6ldwHvR9+V0kC75fhbD+suk1UP2IzBO5JQyGn2zOI8U4xvNfhyHIHpSp+iUWyCZDTZ7u
 IWZ1cbBrKwsgiYKqY2PXw0wD1N1fx+uItJLIvZGLa252B3nOB/wLFlypJVcIAqrv6Gg4
 /KsSD+OVPU7MQM+LvuuziO5+TKo/ysRqlSP9loQNSvl8PpXMaz6tYV75Kg7J6xItnvJS
 Wyyg==
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Miguel Casas-Sanchez <mcasas@chromium.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Alexandros Frantzis <alexandros.frantzis@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTWF0dCwKClRoYW5rcyBmb3IgdGhlIGVubGlnaHRlbmluZyBpbnB1dCA6LSkKCk9uIDIwMTkv
MDYvMjUsIE1hdHQgUm9wZXIgd3JvdGU6Cgo+IFBMQU5FX0NVUlNPUiBpcyBiYXNpY2FsbHkganVz
dCBhbiBpbmRpY2F0aW9uIHRoYXQgdGhhdCBzcGVjaWZpYyBwbGFuZSBpcwo+IHRoZSBvbmUgdGhh
dCdzIGFsc28gaG9va2VkIHVwIHRvIHRoZSBsZWdhY3kgY3Vyc29yIGlvY3RsczsgbGlrZSBWaWxs
ZQo+IHNheXMsIGl0IHNob3VsZG4ndCBkaXJlY3RseSBpbmRpY2F0ZSB0aGF0IHRoZSBwbGFuZSBp
cyBsZXNzCj4gZmVhdHVyZS1jYXBhYmxlIHRoYW4gb3RoZXIgcGxhbmVzLiAgWW91IGNhbiBlaXRo
ZXIgZGV0ZWN0IHRoZSB0cnVlCj4gY2FwYWJpbGl0aWVzIG9mIHRoZSBjdXJzb3IgcGxhbmUgYnkg
Y2hlY2tpbmcgZm9yIHRoZSBwcmVzZW5jZS9hYnNlbmNlIG9mCj4gb3RoZXIgcGxhbmUgcHJvcGVy
dGllcyBhbmQvb3IgZXhwZXJpbWVudGluZyB3aXRoIGF0b21pYyBURVNUX09OTFkKPiBjb21taXRz
IHRvIHNlZSB3aGF0J3MgcmVhbGx5IHBvc3NpYmxlLgo+IApJbnRlcmVzdGluZywgbXkgdW5kZXJz
dGFuZGluZyB3YXMgdGhlIHBsYW5lIHR5cGUgd2FzIGEgaGludCBhYm91dCB0aGUKY2FwYWJpbGl0
aWVzLiBBbHRob3VnaCB5ZXMsIHVzZXJzcGFjZSBtdXN0IGNoZWNrIHZpYSBURVNUX09OTFkgdG8g
ZW5zdXJlCnRoZSBwcm9wZXJ0aWVzIGNob3NlbiB3aWxsIHdvcmsuCgoKPiBUaGUgaWRlYWwgc29s
dXRpb24gZm9yIEludGVsIGdlbjkgaGFyZHdhcmUgd291bGQgaGF2ZSBiZWVuIHRvIGp1c3QgbmV2
ZXIKPiBoYXZlIHRoZSBkcml2ZXIgYWR2ZXJ0aXNlIG9yIHByb2dyYW0gdGhlIGRlZGljYXRlZCBo
YXJkd2FyZSBjdXJzb3IgYXQKPiBhbGwsIGJ1dCB0byBpbnN0ZWFkIGV4cG9zZSB0aGUgdG9wLW1v
c3QgdW5pdmVyc2FsIHBsYW5lIHRvIHVzZXJzcGFjZSwKPiBkZXNjcmliZSBpdCBhcyBQTEFORV9D
VVJTT1IsIGFuZCByb3V0ZSB0aGUgbGVnYWN5IGN1cnNvciBpb2N0bCdzIHRvIHRoYXQKPiBwbGFu
ZSBpbnN0ZWFkLiAgVGhhdCB3b3VsZCBhbGxvdyBsZWdhY3kgY3Vyc29yIGJlaGF2aW9yIHRvIHdv
cmsgYXMKPiB1c3VhbCwgYnV0IHdvdWxkIGFsc28gYWxsb3cgYXRvbWljIHVzZXJzcGFjZSB0byB1
c2UgdGhlIHBsYW5lIGluIGEgbW9yZQo+IGZ1bGwtZmVhdHVyZWQgbWFubmVyLiAgSSB3cm90ZSBw
YXRjaGVzIHRvIGRvIGV4YWN0bHkgdGhpcyBhIGNvdXBsZSB5ZWFycwo+IGFnbywgYnV0IHNhZGx5
IHdlIGRpc2NvdmVyZWQgdGhhdCB0aGUgdW5pdmVyc2FsIHBsYW5lcyBvbiBnZW45IGhhdmUgYQo+
IHNsaWdodCBhbHBoYSBibGVuZGluZyBkZWZlY3QgdGhhdCB0aGUgZGVkaWNhdGVkIGhhcmR3YXJl
IGN1cnNvciBkb2VzIG5vdAo+IGV4aGliaXQuICBUaHVzIHJlcGxhY2luZyB0aGUgaGFyZHdhcmUg
Y3Vyc29yIHdpdGggdGhlIHRvcG1vc3QgdW5pdmVyc2FsCj4gcGxhbmUgbGVkIHRvIGEgc2xpZ2h0
IHJlZ3Jlc3Npb24gZm9yIGV4aXN0aW5nIHVzZXJzIGFuZCB3ZSBoYWQgdG8gc2NyYXAKPiB0aGUg
d2hvbGUgaWRlYS4gIDotKAo+IAo+IEZvciByZWZlcmVuY2UsIHRoZSByZWxldmFudCBwYXRjaCBm
cm9tIGEgZmV3IHllYXJzIGFnbyBpcyBoZXJlOgo+ICAgICAgICAgaHR0cHM6Ly9wYXRjaHdvcmsu
a2VybmVsLm9yZy9wYXRjaC85Mzk4NTcxLwo+IApJbiB0aGF0IHRocmVhZCB5b3UgbWVudGlvbjoK
CiIuLi4gSSBiZWxpZXZlIHRoZSBjb2xvciBjb3JyZWN0aW9uIHNldHRpbmdzIGFyZSBkaWZmZXJl
bnQgZm9yIHRoZQp1bml2ZXJzYWwgcGxhbmUgdnMgdGhlIGN1cnNvciBwbGFuZSAod2hpY2ggY2F1
c2VzIElHVCBDUkMgbWlzbWF0Y2hlcyBhdAp0aGUgbW9tZW50IGFuZCBtYXkgYmUgdmlzdWFsbHkg
bm90aWNlYWJsZSBpZiB5b3UgaGF2ZSBnb29kIGV5ZXMpOyB0aGF0CnNob3VsZG4ndCBiZSBoYXJk
IHRvIHRyYWNrIGRvd24gYW5kIGZpeC4iCgpZZXQgYWJvdmUgeW91IG1lbnRpb24gdGhhdCB1bml2
ZXJzYWwgcGxhbmVzIGhhdmUgYWxwaGEgYmxlbmRpbmcgZGVmZWN0LgpEaWQgeW91IGNvbmZpcm0g
dGhhdCB3aXRoIEhXL3NpbXVsYXRpb24gdGVhbXMgb3IgaXMgdGhhdCBiYXNlZCBvbiB0aGUKZG9j
dW1lbnRhdGlvbj8gSSB3b3VsZCBsb3ZlIHRvIHJlYWQgYSBiaXQgbW9yZSBvbiB0aGUgdG9waWMu
CgpJbiBwYXJ0aWN1bGFyLCBidXQgbm90IGxpbWl0ZWQgdG8sIGlmIHRoaXMgZGVmZWN0IGlzIGFw
cGxpY2FibGUgb25seSBmb3IKcGxhbmUzIG9yIGxpdGVyYWxseSBhbGwgdW5pdmVyc2FsIHBsYW5l
cy4KClRoYW5rcyBhZ2FpbiwKRW1pbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
