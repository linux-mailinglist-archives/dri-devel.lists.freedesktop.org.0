Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C3B231AE6
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jul 2020 10:12:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17A5B6E46F;
	Wed, 29 Jul 2020 08:12:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com
 [209.85.218.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 435856E479
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jul 2020 08:12:01 +0000 (UTC)
Received: by mail-ej1-f68.google.com with SMTP id d6so9540666ejr.5
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jul 2020 01:12:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=i9KrD0P0TVKXN8xABDByJtLIfvKgiQPv5ea3HEknvYc=;
 b=ON9NeG2lTR6TDJkfAFSSOqD80mchn50OEFyNFp5OYKprK+i4ZKIk7hd3fxBojb76pT
 y+ylcMU+8pE5uGaiiaWLZV7q184UJ8rvFFNPRM8LLx9ZtU2dnEF4ClhrKr+9WgR69Q9w
 yHYgoNv28lzv+o0CxR62qpT/fBgQOxoULv/yRYi+VInzuo1mYSQNiBYFxV3DCj5ymB2r
 9Mq+Vo2qV8SeBYZrsa5X8IAFv1qQeC8zNVqfvVG9BUv2uEVL37V0eD2wF+1vWIFrhN9p
 CCZsKu/rOdZPWrFm6WylunBV8hhc+p/EtvIEPEFiiUGDNhBlyociWY3Huvh2Sh2qC0sY
 i2RQ==
X-Gm-Message-State: AOAM532Kp2P6BRKWPo1VuwcsOhbKjfG9vT8TVX5kkJ1zy+exlBbSnVe7
 7dQbelRvnTo/6tm+/WqVcISzlwMQ
X-Google-Smtp-Source: ABdhPJxiFig6WkqMe0S5Eyvxajz0KruotGDPWnuD6S9N6TWvqRnUc8Vm47L/P81vDiZav887EZuhrw==
X-Received: by 2002:a17:906:a3d5:: with SMTP id
 ca21mr13368266ejb.453.1596010319874; 
 Wed, 29 Jul 2020 01:11:59 -0700 (PDT)
Received: from ?IPv6:2a0b:e7c0:0:107::49? ([2a0b:e7c0:0:107::49])
 by smtp.gmail.com with ESMTPSA id a16sm961567ejy.78.2020.07.29.01.11.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Jul 2020 01:11:59 -0700 (PDT)
Subject: Re: [PATCH] vgacon: fix out of bounds write to the scrollback buffer
To: =?UTF-8?B?5byg5LqR5rW3?= <zhangyunhai@nsfocus.com>,
 b.zolnierkie@samsung.com
References: <20200729070249.20892-1-jslaby@suse.cz>
 <55075898-bf95-1805-3358-b0d1438feaa9@nsfocus.com>
From: Jiri Slaby <jirislaby@kernel.org>
Message-ID: <c1f267aa-dfb3-91fa-3111-30c1676f1a91@kernel.org>
Date: Wed, 29 Jul 2020 10:11:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <55075898-bf95-1805-3358-b0d1438feaa9@nsfocus.com>
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
Cc: Security Officers <security@kernel.org>, Kyungtae Kim <kt0755@gmail.com>,
 Anthony Liguori <aliguori@amazon.com>, Greg KH <greg@kroah.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-distros@vs.openwall.org,
 Solar Designer <solar@openwall.com>, Yang Yingliang <yangyingliang@huawei.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 "Srivatsa S. Bhat" <srivatsa@csail.mit.edu>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiAyOS4gMDcuIDIwLCA5OjUzLCDlvKDkupHmtbcgd3JvdGU6Cj4gVGhpcyBwYXRjaCBk
b3Nlbid0IGZpeCB0aGUgaXNzdWUsIHRoZSBjaGVjayBzaG91bGQgYmUgaW4gdGhlIGxvb3AuCj4g
Cj4gVGhlIGNoYW5nZSBvZiB0aGUgVlQgc3plIGlzIGJlZm9yZSB2Z2Fjb25fc2Nyb2xsYmFja191
cGRhdGUsIG5vdCBpbiB0aGUKPiBtZWFudGltZS4KPiAKPiBMZXQncyBjb25zaWRlciB0aGUgZm9s
bG93aW5nIHNpdHVhdGlvbjoKPiAJc3VwcG9zZToKPiAJCXZnYWNvbl9zY3JvbGxiYWNrX2N1ci0+
c2l6ZSBpcyA2NTQ0MAo+IAkJdmdhY29uX3Njcm9sbGJhY2tfY3VyLT50YWlsIGlzIDY0OTYwCj4g
CQljLT52Y19zaXplX3JvdyBpcyAxNjAKPiAJCWNvdW50IGlzIDUKPiAJCj4gCVJlc2V0IGMtPnZj
X3NpemVfcm93IHRvIDIwMCBieSBWVF9SRVNJWkUsIHRoZW4gY2FsbAo+IHZnYWNvbl9zY3JvbGxi
YWNrX3VwZGF0ZS4KPiAJCj4gCVRoaXMgd2lsbCBwYXNzIHRoZSBjaGVjaywgc2luY2UgKHZnYWNv
bl9zY3JvbGxiYWNrX2N1ci0+dGFpbCArCj4gYy0+dmNfc2l6ZV9yb3cpCj4gCWlzIDY1MTYwIHdo
aWNoIGlzIGxlc3MgdGhlbiB2Z2Fjb25fc2Nyb2xsYmFja19jdXItPnNpemUoNjU0NDApLgo+IAo+
IAlIb3dldmVyLCBpbiB0aGUgM3JkIGl0ZXJhdGlvbiBvZiB0aGUgbG9vcCwgdmdhY29uX3Njcm9s
bGJhY2tfY3VyLT50YWlsCj4gaXMgdXBkYXRlCj4gCXRvIDY1MzYwLCB0aGUgbWVtY3B5IHdpbGwg
b3ZlcmZsb3cuCgpCdXQgdGhlIGxvb3AgY2hlY2tzIGZvciB0aGUgb3ZlcmZsb3c6CiAgaWYgKHZn
YWNvbl9zY3JvbGxiYWNrX2N1ci0+dGFpbCA+PSB2Z2Fjb25fc2Nyb2xsYmFja19jdXItPnNpemUp
CiAgICAgICAgdmdhY29uX3Njcm9sbGJhY2tfY3VyLT50YWlsID0gMDsKClNvIHRoZSBmaXJzdCAy
IGl0ZXJhdGlvbnMgd291bGQgd3JpdGUgdG8gdGhlIGVuZCBvZiB0aGUgYnVmZmVyIGFuZCB0aGlz
CjNyZCBvbmUgc2hvdWxkIGhhdmUgemVyb2VkIC0+dGFpbC4KCnRoYW5rcywKLS0gCmpzCnN1c2Ug
bGFicwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
