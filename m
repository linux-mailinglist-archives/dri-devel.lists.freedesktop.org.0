Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B0830F72
	for <lists+dri-devel@lfdr.de>; Fri, 31 May 2019 16:00:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E23458949C;
	Fri, 31 May 2019 14:00:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 823B3894C9
 for <dri-devel@lists.freedesktop.org>; Fri, 31 May 2019 14:00:17 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id 16so1711551wmg.5
 for <dri-devel@lists.freedesktop.org>; Fri, 31 May 2019 07:00:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=NOwlld2o61g53ikPgtNne2HrK56iyMC4CudXWPFjlEI=;
 b=ncSkC31bkwC7nVSxC3VEPz14fkshNHXIcbCQa4lijeebMY/W3mO7iMArsgJL152Cgm
 Hm1QdFuhH54rBwhJYCjMEZ18jn7vMdQvXQb3MEvqOaJhBL5bBg+6i4nX2zefyJGkrIIV
 LkHkxFUMuPOAKjVnkHi5sJP3NDPtetadtyhPdXxsnve6ZtyxtUFC9a5tOGl/QwWsl44r
 EK5Og7kAe7scx7wLb/HfW3nl8Nkymr3k9jwWonciQyO9lIAVMjH9UYErkL2QEKndVXDp
 HHb879O+mCyqLTuNwo/vo3fgDAi88STMWiqncscs42WbKI+WAgznTJP/kifFiN5IAdbv
 FE6A==
X-Gm-Message-State: APjAAAXP5OM2OLz7F8QGEE35zGUVyyLFrkMDkhZXITL60XUP01c7gsFO
 dslpVTQMUvyd2dVyMnRjqTXNsO5R
X-Google-Smtp-Source: APXvYqzfNlf2DdFt2bxxDUMP+V68qs+JPCXOL1YaLFWxOZHmPbWlk1oJQADBFWBwjnMzpnbK4bKxyg==
X-Received: by 2002:a05:600c:506:: with SMTP id
 i6mr5968967wmc.57.1559311216221; 
 Fri, 31 May 2019 07:00:16 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id p3sm3387244wrd.47.2019.05.31.07.00.14
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 31 May 2019 07:00:15 -0700 (PDT)
Subject: Re: [PATCH 11/22] gpu: amdgpu: fix broken amdgpu_dma_buf.c references
To: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>
References: <cover.1559171394.git.mchehab+samsung@kernel.org>
 <f7378a751557277eab6f37f3f5692cf5f1aff8c6.1559171394.git.mchehab+samsung@kernel.org>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <bf8163be-eb1f-f060-1c5a-405bc6d4c8c5@gmail.com>
Date: Fri, 31 May 2019 16:00:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <f7378a751557277eab6f37f3f5692cf5f1aff8c6.1559171394.git.mchehab+samsung@kernel.org>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=NOwlld2o61g53ikPgtNne2HrK56iyMC4CudXWPFjlEI=;
 b=qveRJQgkceN4UUmgq0oCfgIJbTH/rwzmiKyj6+6zZ+Z/+INOpKfHZtlqrMuwzYWNEr
 yuDOcjIp+yL3QACa5tvGJBfnFbIv2026MCLU0lvV/NUSg2V9wIpAO+5uFv3CI50k6Zsy
 wTjh1Ad6538/Uvph9MtBwzFXJRNCAx+zgnqHlQsLdhnH7Nsqgd7r6vm6H83g9mDE3FDU
 H43egHgKX7QO75MZT5w+PDvZssLHmpR+WGzTqcQlE0+zZCa0iBSYMwB6JqJvR7bxYTVE
 sGj3/Z3Nbe1IASdWqBWRMoLI186S0LiHV+xtpldRQYOigYphkmoat/FdD+/CV/TG4Hl7
 8VhA==
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
Reply-To: christian.koenig@amd.com
Cc: Jonathan Corbet <corbet@lwn.net>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Mauro Carvalho Chehab <mchehab@infradead.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMzAuMDUuMTkgdW0gMDE6MjMgc2NocmllYiBNYXVybyBDYXJ2YWxobyBDaGVoYWI6Cj4gVGhp
cyBmaWxlIHdhcyByZW5hbWVkLCBidXQgZG9jcyB3ZXJlbid0IHVwZGF0ZWQgYWNjb3JkaW5nbHku
Cj4KPiAJV0FSTklORzoga2VybmVsLWRvYyAnLi9zY3JpcHRzL2tlcm5lbC1kb2MgLXJzdCAtZW5h
YmxlLWxpbmVubyAtZnVuY3Rpb24gUFJJTUUgQnVmZmVyIFNoYXJpbmcgLi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfcHJpbWUuYycgZmFpbGVkIHdpdGggcmV0dXJuIGNvZGUgMQo+
IAlXQVJOSU5HOiBrZXJuZWwtZG9jICcuL3NjcmlwdHMva2VybmVsLWRvYyAtcnN0IC1lbmFibGUt
bGluZW5vIC1pbnRlcm5hbCAuL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wcmlt
ZS5jJyBmYWlsZWQgd2l0aCByZXR1cm4gY29kZSAyCj4KPiBGaXhlczogOTg4MDc2Y2Q4YzVjICgi
ZHJtL2FtZGdwdTogcmVuYW1lIGFtZGdwdV9wcmltZS5bY2hdIGludG8gYW1kZ3B1X2RtYV9idWYu
W2NoXSIpCj4gU2lnbmVkLW9mZi1ieTogTWF1cm8gQ2FydmFsaG8gQ2hlaGFiIDxtY2hlaGFiK3Nh
bXN1bmdAa2VybmVsLm9yZz4KClJldmlld2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3Rp
YW4ua29lbmlnQGFtZC5jb20+Cgo+IC0tLQo+ICAgRG9jdW1lbnRhdGlvbi9ncHUvYW1kZ3B1LnJz
dCB8IDQgKystLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlv
bnMoLSkKPgo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2dwdS9hbWRncHUucnN0IGIvRG9j
dW1lbnRhdGlvbi9ncHUvYW1kZ3B1LnJzdAo+IGluZGV4IGE3NDBlNDkxZGZjYy4uYTE1MTk5YjFi
MDJlIDEwMDY0NAo+IC0tLSBhL0RvY3VtZW50YXRpb24vZ3B1L2FtZGdwdS5yc3QKPiArKysgYi9E
b2N1bWVudGF0aW9uL2dwdS9hbWRncHUucnN0Cj4gQEAgLTM3LDEwICszNywxMCBAQCBCdWZmZXIg
T2JqZWN0cwo+ICAgUFJJTUUgQnVmZmVyIFNoYXJpbmcKPiAgIC0tLS0tLS0tLS0tLS0tLS0tLS0t
Cj4gICAKPiAtLi4ga2VybmVsLWRvYzo6IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9wcmltZS5jCj4gKy4uIGtlcm5lbC1kb2M6OiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfZG1hX2J1Zi5jCj4gICAgICA6ZG9jOiBQUklNRSBCdWZmZXIgU2hhcmluZwo+ICAgCj4g
LS4uIGtlcm5lbC1kb2M6OiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcHJpbWUu
Ywo+ICsuLiBrZXJuZWwtZG9jOjogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rt
YV9idWYuYwo+ICAgICAgOmludGVybmFsOgo+ICAgCj4gICBNTVUgTm90aWZpZXIKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
