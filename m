Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B4B2B7BE7
	for <lists+dri-devel@lfdr.de>; Wed, 18 Nov 2020 11:57:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37A8E6E3DB;
	Wed, 18 Nov 2020 10:57:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B49A6E3DB
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Nov 2020 10:57:48 +0000 (UTC)
Received: by mail-ej1-x643.google.com with SMTP id s25so2120324ejy.6
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Nov 2020 02:57:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=Ujs+84h/AV5va5lsnNUE6Cha4z0WdYf4Awwp5uvYq2s=;
 b=ec2dXjyKAgBuZgQiPsDp5dlX2Axa3/ZR+q3LPAUbNQK51MefRbkfyUzwGdwcFCNNsl
 DmAkYKWSssBL8pDXSTuIMb03r27h8P3C7U+//k3tiWfmUbqOc6vYiFgAr7mFQguCiSkc
 OrEEYzGMqPmV/YS7MOh6wuDzbz4ZtukA4ppcicdJqLSkgi9vmxq6hUetlEIql9xC1e+D
 gJYjQu75/yP0gqDhZ9DoHavl6V6VBNPHDiB4x1nDLZ49YGYM471bij22ozZh9FBiPYHY
 mft78EPbgAOqjcnAMJTpESq0Q+59GL2BcUtH6vopcqxr4H2uFtMKhBjytC9I6vggoFOh
 CQlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=Ujs+84h/AV5va5lsnNUE6Cha4z0WdYf4Awwp5uvYq2s=;
 b=PakNAXpZUpFQ7txlB6XbJ9ysj0tf2QoiFnv1wobeRsz2hXZoyOmHlDhz27EQoxZLY4
 SS0E80LghaoiOFUIzcOs791FwyHBZ+/EbjiKHj7XVbHPleDpgjBBDIl7eNfsKeTcZ0tJ
 CoOzxyv+Dqfl15T3AIQ/gYnZel7fnb3+UBWRkL8frisDSq3KMRgY6sWfZPbMjqq+r/h5
 cK3S5cRI20R544dCNQProTncXq46BJ+XrogmEnP26R0lwOeYAqBl+im9+c67LtUNwrWe
 RqhTRQGcK3KXnO9vsrn5Z4HvumsU3Ms6w8PEBFNLLOwBxXmgp0pd+0L5THJpJLM9khGi
 Q0Vg==
X-Gm-Message-State: AOAM533/j+pC3a/oLzCMlKMzAYSewMXTbnVzxlDEaP5I7839F2bVWFP7
 eC34l89jHZU/4jZXFTPViuM=
X-Google-Smtp-Source: ABdhPJzwcar3mNBUaai8RXeIr42FsqX4abG+v5tYsTGBLf/nO0azD5aQGORqzDbjWMSqF0AU+Vgykw==
X-Received: by 2002:a17:906:2e0f:: with SMTP id
 n15mr6409546eji.486.1605697066669; 
 Wed, 18 Nov 2020 02:57:46 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id n12sm12761784ejs.19.2020.11.18.02.57.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Nov 2020 02:57:46 -0800 (PST)
Subject: Re: [PATCH 1/2] mm: mmap: fix fput in error path v2
To: Andrew Morton <akpm@linux-foundation.org>
References: <20201106114806.46015-1-christian.koenig@amd.com>
 <20201106114806.46015-2-christian.koenig@amd.com>
 <20201106144811.cf228ca9278ec78887d42960@linux-foundation.org>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <e5a25173-ebea-d856-ed25-45437769f17f@gmail.com>
Date: Wed, 18 Nov 2020 11:57:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201106144811.cf228ca9278ec78887d42960@linux-foundation.org>
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
Reply-To: christian.koenig@amd.com
Cc: linaro-mm-sig@lists.linaro.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMDYuMTEuMjAgdW0gMjM6NDggc2NocmllYiBBbmRyZXcgTW9ydG9uOgo+IE9uIEZyaSwgIDYg
Tm92IDIwMjAgMTI6NDg6MDUgKzAxMDAgIkNocmlzdGlhbiBLw7ZuaWciIDxja29lbmlnLmxlaWNo
dHp1bWVya2VuQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPj4gUGF0Y2ggIjQ5NWMxMGNjMWMwYyBDSFJP
TUlVTTogZG1hLWJ1ZjogcmVzdG9yZSBhcmdzLi4uIgo+PiBhZGRzIGEgd29ya2Fyb3VuZCBmb3Ig
YSBidWcgaW4gbW1hcF9yZWdpb24uCj4+Cj4+IEFzIHRoZSBjb21tZW50IHN0YXRlcyAtPm1tYXAo
KSBjYWxsYmFjayBjYW4gY2hhbmdlCj4+IHZtYS0+dm1fZmlsZSBhbmQgc28gd2UgbWlnaHQgY2Fs
bCBmcHV0KCkgb24gdGhlIHdyb25nIGZpbGUuCj4+Cj4+IFJldmVydCB0aGUgd29ya2Fyb3VuZCBh
bmQgcHJvcGVyIGZpeCB0aGlzIGluIG1tYXBfcmVnaW9uLgo+Pgo+IFNlZW1zIGNvcnJlY3QsIGJl
c3QgSSBjYW4gdGVsbC4gIFByZXN1bWFibHkgYWxsIC0+bW1hcCgpIGluc3RhbmNlcyB3aWxsCj4g
Y29ycmVjdGx5IGZwdXQoKSB0byBvcmlnaW5hbCBmaWxlKiBpZiB0aGV5J3JlIHJld3JpdGluZyB2
bWEtPnZtX2ZpbGUuCgpZZXMsIGV4YWN0bHkuCgpQYXRjaCAjMiBwcm92aWRlcyBhIGhlbHBlciB0
byBtYWtlIHN1cmUgdGhhdCBldmVyeWJvZHkgZ2V0cyB0aGUgCmdldF9maWxlKCkvZnB1dCgpIGNv
cnJlY3RseSB3aGlsZSB1cGRhdGluZyB2bWEtPnZtX2ZpbGUuCgpDYW4gSSBhZGQgeW91ciBhY2tl
ZC1ieSB0byB0aGUgcGF0Y2hlcyBhbmQgcHVzaCB0aGVtIHVwc3RyZWFtIHRocm91Z2ggCmRybS1t
aXNjLW5leHQ/CgpUaGFua3MsCkNocmlzdGlhbi4KCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwK
