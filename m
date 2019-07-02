Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C73C5DE6F
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2019 09:13:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CF5C6E0CA;
	Wed,  3 Jul 2019 07:13:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9239F898E4
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jul 2019 09:48:49 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id n4so16975982wrw.13
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Jul 2019 02:48:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UdYCIZGQ7tAt7A88vWqWA422Qpx5IuQReKn9P3m3xX8=;
 b=eSBRZP3Uq7z5g8CgfDHz9KxiySP6z3mxdFk1YsckgONA5dNvomzaK1uKKf2tWXp9YV
 3TiCDIE9PnYT/8E3yIg80YwYIZDP+rvAjYYrI9KNFXXVQtgbpWwUKJz0DMxFktKx7OHu
 fz0H0eISxY8mKiIMo3hLR5qqqHa7cOJGIPa1m4J+/y4tyqxLg2DO2sLQVDiAHotNbNw6
 3gDEpff+bcLPRUfJzRfuFqM3L1D3cbi1zwnDs6HLhWlThRYa5pIoAdz8VrjrfA8U+as0
 k+cj+A7yfv/wSHpsAoLsIDStIE1ZGNvFqeHzefD3QOw19T5y227QL3JGqGSGzcE1UYuH
 encg==
X-Gm-Message-State: APjAAAXodA8+buaORJwVFQptGFHsx34IumWHy0N/ykQcV+AwIsX6DRCT
 1J0jSHugvKuc7qvHP8ufxItBXliyYeehCw==
X-Google-Smtp-Source: APXvYqw+cs3wphtlInYiqa/iYYLL5YBkbuaWsrCFwdpkqDK8kfUrPvl8YI8TNOvUo+26MvPNs1E1Ng==
X-Received: by 2002:adf:9487:: with SMTP id 7mr9588274wrr.114.1562060928176;
 Tue, 02 Jul 2019 02:48:48 -0700 (PDT)
Received: from [10.176.68.244] ([192.19.248.250])
 by smtp.gmail.com with ESMTPSA id l124sm2421987wmf.36.2019.07.02.02.48.46
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 02 Jul 2019 02:48:47 -0700 (PDT)
Subject: Re: use exact allocation for dma coherent memory
To: Christoph Hellwig <hch@lst.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Ian Abbott <abbotti@mev.co.uk>,
 H Hartley Sweeten <hsweeten@visionengravers.com>
References: <20190614134726.3827-1-hch@lst.de> <20190701084833.GA22927@lst.de>
From: Arend Van Spriel <arend.vanspriel@broadcom.com>
Message-ID: <74eb9d99-6aa6-d1ad-e66d-6cc9c496b2f3@broadcom.com>
Date: Tue, 2 Jul 2019 11:48:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190701084833.GA22927@lst.de>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 03 Jul 2019 07:13:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=UdYCIZGQ7tAt7A88vWqWA422Qpx5IuQReKn9P3m3xX8=;
 b=PZuM9EJbQb3YhMp+qaw+VF6BwkhSSyYMquhljCcVZSO+tjIcy06ofVIGPbwYNmREXi
 pRcuGFWqgU+nSlEobDVIi97m26fD20LGHZVCL/m/+eGewb0yAO7NlvlF/9gBYN5Rgy0B
 UVcUnIeulg2Ui8pzjNF76wVB55J/p/3pN/YrI=
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
Cc: devel@driverdev.osuosl.org, linux-s390@vger.kernel.org,
 Intel Linux Wireless <linuxwifi@intel.com>, linux-rdma@vger.kernel.org,
 netdev@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 iommu@lists.linux-foundation.org,
 "moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>,
 linux-media@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpPbiA3LzEvMjAxOSAxMDo0OCBBTSwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4gT24gRnJp
LCBKdW4gMTQsIDIwMTkgYXQgMDM6NDc6MTBQTSArMDIwMCwgQ2hyaXN0b3BoIEhlbGx3aWcgd3Jv
dGU6Cj4+IFN3aXRjaGluZyB0byBhIHNsaWdodGx5IGNsZWFuZWQgdXAgYWxsb2NfcGFnZXNfZXhh
Y3QgaXMgcHJldHR5IGVhc3ksCj4+IGJ1dCBpdCB0dXJucyBvdXQgdGhhdCBiZWNhdXNlIHdlIGRp
ZG4ndCBmaWx0ZXIgdmFsaWQgZ2ZwX3QgZmxhZ3MKPj4gb24gdGhlIERNQSBhbGxvY2F0b3IsIGEg
YnVuY2ggb2YgZHJpdmVycyB3ZXJlIHBhc3NpbmcgX19HRlBfQ09NUAo+PiB0byBpdCwgd2hpY2gg
aXMgcmF0aGVyIGJvZ3VzIGluIHRvbyBtYW55IHdheXMgdG8gZXhwbGFpbi4gIEFybSBoYXMKPj4g
YmVlbiBmaWx0ZXJpbmcgaXQgZm9yIGEgd2hpbGUsIGJ1dCB0aGlzIHNlcmllcyBpbnN0ZWFkIHRy
aWVzIHRvIGZpeAo+PiB0aGUgZHJpdmVycyBhbmQgd2FybiB3aGVuIF9fR0ZQX0NPTVAgaXMgcGFz
c2VkLCB3aGljaCBtYWtlcyBpdCBtdWNoCj4+IGxhcmdlciB0aGFuIGp1c3QgYWRkaW5nIHRoZSBm
dW5jdGlvbmFsaXR5Lgo+IAo+IERlYXIgZHJpdmVyIG1haW50YWluZXJzLAo+IAo+IGNhbiB5b3Ug
bG9vayBvdmVyIHRoZSBwYXRjaGVzIHRvdWNoaW5nIHlvdXIgZHJpdmVycywgcGxlYXNlPyAgSSdk
Cj4gbGlrZSB0byBnZXQgYXMgbXVjaCBhcyBwb3NzaWJsZSBvZiB0aGUgZHJpdmVyIHBhdGNoZXMg
aW50byB0aGlzCj4gbWVyZ2Ugd2luZG93LCBzbyB0aGF0IGl0IGNhbiB5b3UgdGhyb3VnaCB5b3Vy
IG1haW50YWluZXIgdHJlZXMuCgpZb3UgbWFkZSBtZSBsb29rIDstKSBBY3R1YWxseSBub3QgdG91
Y2hpbmcgbXkgZHJpdmVycyBzbyBJJ20gb2ZmIHRoZSAKaG9vay4gSG93ZXZlciwgSSB3YXMgd29u
ZGVyaW5nIGlmIGRyaXZlcnMgY291bGQga25vdyBzbyBJIGRlY2lkZWQgdG8gCmxvb2sgaW50byB0
aGUgRE1BLUFQSS50eHQgZG9jdW1lbnRhdGlvbiB3aGljaCBjdXJyZW50bHkgc3RhdGVzOgoKIiIi
ClRoZSBmbGFnIHBhcmFtZXRlciAoZG1hX2FsbG9jX2NvaGVyZW50KCkgb25seSkgYWxsb3dzIHRo
ZSBjYWxsZXIgdG8Kc3BlY2lmeSB0aGUgYGBHRlBfYGAgZmxhZ3MgKHNlZSBrbWFsbG9jKCkpIGZv
ciB0aGUgYWxsb2NhdGlvbiAodGhlCmltcGxlbWVudGF0aW9uIG1heSBjaG9vc2UgdG8gaWdub3Jl
IGZsYWdzIHRoYXQgYWZmZWN0IHRoZSBsb2NhdGlvbiBvZgp0aGUgcmV0dXJuZWQgbWVtb3J5LCBs
aWtlIEdGUF9ETUEpLgoiIiIKCkkgZG8gZXhwZWN0IHlvdSBhcmUgZ29pbmcgdG8gY2hhbmdlIHRo
YXQgZGVzY3JpcHRpb24gYXMgd2VsbCBub3cgdGhhdCAKeW91IGFyZSBnb2luZyB0byBpc3N1ZSBh
IHdhcm5pbmcgb24gX19HRlBfQ09NUC4gTWF5YmUgaW5jbHVkZSB0aGF0IGluIApwYXRjaCAxNS8x
NiB3aGVyZSB5b3UgaW50cm9kdWNlIHRoYXQgd2FybmluZy4KClJlZ2FyZHMsCkFyZW5kCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
