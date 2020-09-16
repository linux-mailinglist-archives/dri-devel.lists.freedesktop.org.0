Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 02B3A26D5BE
	for <lists+dri-devel@lfdr.de>; Thu, 17 Sep 2020 10:08:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FF1C6EB7A;
	Thu, 17 Sep 2020 08:08:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 521026EB34
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Sep 2020 21:38:00 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id c2so152884ljj.12
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Sep 2020 14:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=K5mbCSIAeWAEdWVtEp7XKprNFHQC1dqRIziOBIZxb+s=;
 b=gJluukteUSfBTWl31n7U4/oMgRD2+ycm1sKw/nkvTQralJ4g2wpvpNhH+mFqX29A09
 fOm/xRxdQFqOy4SKOoPer0QWrIDlfeXJp9Jhs1M/esIU535eVsdK0sUuvRzeK3GN7b/1
 C4cJC6t0Sf0aCB3SrpT1E5r0Kap3ucKcOqnwvJAV9J7CvpXa7bNU+HyZyWCitpbu5AWz
 MbLL8occtIofkn22FV9kAzSaxVyTwS93zxEA3UjiquJcmFXky9UzrvepMCftCm16sKwT
 56eNE6DsaQP6Wp+QUg/q3d7nnvdemYzt+x4bq8ziHmqpAjxlNcBLxLrgaCHn8WMuU9tn
 OhzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=K5mbCSIAeWAEdWVtEp7XKprNFHQC1dqRIziOBIZxb+s=;
 b=qC95HBJYw5g+2G/cSSUH3HzqSzvxSWi1uRlbTPP1d41FZb/+DoENe+Iawgn5FmcxXg
 Aa3ROMz/2p5shwFLAq1oM6XUyEqSJyj4V/sUj+av9EPV2M+ENWtVLMa/euXWWB/+Srpf
 eVvYqhVC+4zalv7yjrf8+ldxKpXQDhk5rbe5Y+tWUMKMRIy8SZQzcjhTbffUWtSMlHuk
 u70OYzeCLTcehdjkhIPZ4Hxo56nUs2J1QZ5YRP/HdUBJisqOMm2fn6NZQTCsPb+/V6d0
 /nzxdR5l0xQarzJpEmwBd1eZ44b4u7gDM6zoS9FSLBuVCMfkdaBjkGRnMwnY7z7wCByM
 qk/Q==
X-Gm-Message-State: AOAM530d13RKYrKT9FIVZF5upldupzZ28gkwiX4iSl5Q6LzLV3pduAEF
 JtSSgXOmwJ25WLhpGfTa1Uk=
X-Google-Smtp-Source: ABdhPJxfYjUE55ilmwcVrsIzLhvX5guab3MxK0ccCNYyITCitPGVUFoDjChTwa5szdpVCGaDN1nfHg==
X-Received: by 2002:a2e:3208:: with SMTP id y8mr9684682ljy.216.1600292278806; 
 Wed, 16 Sep 2020 14:37:58 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru.
 [109.252.170.211])
 by smtp.googlemail.com with ESMTPSA id i12sm5103657lfi.48.2020.09.16.14.37.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Sep 2020 14:37:58 -0700 (PDT)
Subject: Re: [RFC PATCH v2 13/17] gpu: host1x: Reset max value when freeing a
 syncpoint
To: Mikko Perttunen <cyndis@kapsi.fi>, Mikko Perttunen
 <mperttunen@nvidia.com>, thierry.reding@gmail.com, jonathanh@nvidia.com,
 airlied@linux.ie, daniel@ffwll.ch
References: <20200905103420.3021852-1-mperttunen@nvidia.com>
 <20200905103420.3021852-14-mperttunen@nvidia.com>
 <b4b3ae98-4ccb-152a-deda-2da81d1c46ef@gmail.com>
 <0d12991e-3599-c5bf-11e5-78031f0f8088@kapsi.fi>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <343e4518-e132-6ea8-6169-0685f000b89c@gmail.com>
Date: Thu, 17 Sep 2020 00:37:57 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <0d12991e-3599-c5bf-11e5-78031f0f8088@kapsi.fi>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 17 Sep 2020 08:08:02 +0000
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
Cc: linux-tegra@vger.kernel.org, talho@nvidia.com, bhuntsman@nvidia.com,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MTYuMDkuMjAyMCAyMzo0MywgTWlra28gUGVydHR1bmVuINC/0LjRiNC10YI6Ci4uLgo+PiBQbGVh
c2Ugbm90ZSB0aGF0IHRoZSBzeW5jIHBvaW50IHN0YXRlIGFjdHVhbGx5IG5lZWRzIHRvIGJlIGNv
bXBsZXRlbHkKPj4gcmVzZXQgYXQgdGhlIHN5bmMgcG9pbnQgcmVxdWVzdC10aW1lIGJlY2F1c2Ug
Ym90aCBkb3duc3RyZWFtIGZhc3Rib290Cj4+IGFuZCB1cHN0cmVhbSB1LWJvb3QgWzFdIGFyZSBu
ZWVkbGVzc2x5IGVuYWJsaW5nIGRpc3BsYXkgVkJMQU5LIGludGVycnVwdAo+PiB0aGF0IGNvbnRp
bnVvdXNseSBpbmNyZW1lbnRzIHN5bmMgcG9pbnQgIzI2IGR1cmluZyBvZiBrZXJuZWwgYm9vdCB1
bnRpbAo+PiBkaXNwbGF5IGNvbnRyb2xsZXIgaXMgcmVzZXQuCj4+Cj4+IFsxXQo+PiBodHRwczov
L2dpdGh1Yi5jb20vdS1ib290L3UtYm9vdC9ibG9iL21hc3Rlci9kcml2ZXJzL3ZpZGVvL3RlZ3Jh
LmMjTDE1NQo+Pgo+PiBIZW5jZSBvbmNlIHN5bmMgcG9pbnQgIzI2IGlzIHJlcXVlc3RlZCwgaXQg
d2lsbCBoYXZlIGEgZGlydHkgc3RhdGUuIFNvCj4+IGZhciB0aGlzIGRvZXNuJ3QgaGF2ZSBhbnkg
dmlzaWJsZSBlZmZlY3QgYmVjYXVzZSBzeW5jIHBvaW50cyBhcmVuJ3QgdXNlZAo+PiBtdWNoLgo+
Pgo+IAo+IE1heWJlIHdlIGNhbiBpbnN0ZWFkIHJlc2VydmUgc3luY3BvaW50cyB0aGF0IG1pZ2h0
IGJlIHVzZWQgYnkgdGhlIGJvb3QKPiBjaGFpbiwgYW5kIG9ubHkgYWxsb3cgYWxsb2NhdGluZyB0
aGVtIG9uY2UgdGhlIGRpc3BsYXkgZHJpdmVyIGhhcyBhY2tlZAo+IHRoYXQgdGhlIHN5bmNwb2lu
dCB3aWxsIG5vIGxvbmdlciBiZSBpbmNyZW1lbnRlZD8gVGhhdCB3YXkgaWYgdGhlCj4gZGlzcGxh
eSBkcml2ZXIgaXMgZGlzYWJsZWQgZm9yIHNvbWUgcmVhc29uIHdlJ2xsIHN0aWxsIGJlIGZpbmUu
Cgpzb3VuZHMgZ29vZAoKPiBMb29raW5nIGF0IHRoZSBkb3duc3RyZWFtIGRyaXZlciwgaXQgKHN0
aWxsLCBvbiBuZXcgY2hpcHMuLikgcmVzZXJ2ZXMKPiB0aGUgZm9sbG93aW5nIHN5bmNwb2ludHM6
Cj4gCj4gLSAxMCAoQVZQKQo+IC0gMjIgKDNEKQo+IC0gMjYgKFZCTEFOSzApCj4gLSAyNyAoVkJM
QU5LMSkKPiAKPiBhbmQgc2F5cyB0aGF0IHRoaXMgYXBwbGllcyB0byBUMjAsIFQzMCwgVDExNCBh
bmQgVDE0OC4KPiAKPiBJIHN1cHBvc2UgaWYgeW91IGhhdmVuJ3Qgb2JzZXJ2ZWQgdGhpcyBoYXBw
ZW5pbmcgdG8gb3RoZXIgc3luY3BvaW50cwo+IHRoYW4gMjYsIHRoZW4gcmVzZXJ2aW5nIDI2IHdv
dWxkIHByb2JhYmx5IGJlIGVub3VnaC4KCkkgb25seSBzYXcgU1AgMjYgYmVpbmcgdXNlZCBieSB0
aGUgREMsIGJ1dCBwZXJoYXBzIHRoYXQgbWF5IHZhcnkgZnJvbQpkZXZpY2UgdG8gZGV2aWNlIGFu
ZCBTUCAyNyBjb3VsZCBhY3R1YWxseSBiZSB1c2VkIGluIGEgd2lsZCBhcyB3ZWxsLgoKSSB0aGlu
ayB0aGUgQVZQIFNQIHNob3VsZCBvbmx5IHJlbGF0ZSB0byB0aGUgQVZQLWZpcm13YXJlIHRoYXQg
dXBzdHJlYW0KZG9lc24ndCBzdXBwb3J0LCBzbyB3ZSBjYW4gaWdub3JlIGl0cyByZXNlcnZhdGlv
bi4KCkkndmUgbm8gaWRlYSB3aGF0IG1heSB1c2UgdGhlIDNEIFNQLgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
