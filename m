Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0225126DB6D
	for <lists+dri-devel@lfdr.de>; Thu, 17 Sep 2020 14:24:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 425B36E22D;
	Thu, 17 Sep 2020 12:24:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 573AF6E22D
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Sep 2020 12:24:33 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id i1so2344568edv.2
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Sep 2020 05:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=GBPWnK+O45hDPiwD6Yl2FVueQas8+06W2RHndFOU4x0=;
 b=YSwvclpgwQrjaZJLio4+fZCnlFslcy8Smk4D3Nl1taPur3YUbCtbgZhfm/6+rxDLDb
 wnpQZk8wKk/ZMKnF8vQJK7jlxVoRuJE6PwMpAZIlrRUdYNDuAbOMf896/BwdweSdvEDR
 egGfWHIWpyYNDLR+YDZFocW3Spw/+1H3TuHMdAE5hQV4Sa7vq171+oowCUwvVE1XPned
 BNGCHnafxMkf0uGcmrVb/SW+uYrSjukjUsITqm1O0eLlKXIQ//sx5vYoWXnSP9AjX43r
 JzICsn9YQNoT2j5O7gynMB4YyLqxhQ4BfDYgM40y/TSWY5dKWblFY0toaz+U49m5h2eD
 SrPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=GBPWnK+O45hDPiwD6Yl2FVueQas8+06W2RHndFOU4x0=;
 b=cTD6a5XqIeWvmEyboDvLggkmd//CwFj5alk6KKC/AdinKGtiTYzR5Jis2MKB24sBZK
 YBUekuGoYIJfn6NLosqE/3Tx0PqbOoby2ktG1MbzVqYtZalgXkcAnVD6alTdr2n5y6HD
 28WG5Rb8ENStMJu956kz+q7DvOrfQanif4USPRMKLKjJqfvlnE+xxjYCLqm1oVFstidn
 TPEFYQgeumxjh3Sg2yNqH8BJeENFX3jhwoau3wPTzat330SVbm7tUysRnDbNUzW44uDL
 sjuGQ7SpyF5sLshcJRx6vt/7dvJOnzI/Wu7kxY1hqWZDL/SDwq7Mv6TUWbV7KpmUED4s
 ZyIA==
X-Gm-Message-State: AOAM5336cynKoqETsGr09qWV3E+T7QF3uFzU5CoZzljI/AekYKqn+rkG
 lgSk6AKe6zXToKoGVJLtv7c=
X-Google-Smtp-Source: ABdhPJxjg1yiXefIk0NeL3VjLQ2zbCP7yoFRn/H/W2k2rNszWXwepBIqx8bZOzhUQkVeMcmckHNfJw==
X-Received: by 2002:a05:6402:1110:: with SMTP id
 u16mr32547477edv.253.1600345471990; 
 Thu, 17 Sep 2020 05:24:31 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id b5sm16198291edq.69.2020.09.17.05.24.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Sep 2020 05:24:31 -0700 (PDT)
Subject: Re: [Linaro-mm-sig] Changing vma->vm_file in dma_buf_mmap()
To: Jason Gunthorpe <jgg@ziepe.ca>, christian.koenig@amd.com
References: <20200916095359.GD438822@phenom.ffwll.local>
 <20200916140710.GA8409@ziepe.ca>
 <8db2474f-ecb7-0e17-5f5b-145708fe44d5@amd.com>
 <CAKMK7uFdwrT3HACPh3ADAKvhXJ-Hf3dExZmgJVAQ1KKjSai_0w@mail.gmail.com>
 <aa953b09-53b1-104b-dc4b-156ad8a75e62@gmail.com>
 <CAKMK7uHJNRzCJfWVSmMrLmGXE0qo+OCXiMd+zPTOkeG2pnVrmQ@mail.gmail.com>
 <8d8693db-a3f0-4f5f-3e32-57d23ca620f8@amd.com>
 <CAKMK7uE=UqZD3PVC8XZAXrgGH-VsUF_-YQD3MLV8KK1kpxO4yQ@mail.gmail.com>
 <20200917113110.GE8409@ziepe.ca>
 <6fd74b84-959c-8b3b-c27b-e9fbf66396c7@gmail.com>
 <20200917121858.GF8409@ziepe.ca>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <d82f08ee-2dec-18e8-fb06-d26f18ed777a@gmail.com>
Date: Thu, 17 Sep 2020 14:24:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200917121858.GF8409@ziepe.ca>
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
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Linux MM <linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTcuMDkuMjAgdW0gMTQ6MTggc2NocmllYiBKYXNvbiBHdW50aG9ycGU6Cj4gT24gVGh1LCBT
ZXAgMTcsIDIwMjAgYXQgMDI6MDM6NDhQTSArMDIwMCwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToK
Pj4gQW0gMTcuMDkuMjAgdW0gMTM6MzEgc2NocmllYiBKYXNvbiBHdW50aG9ycGU6Cj4+PiBPbiBU
aHUsIFNlcCAxNywgMjAyMCBhdCAxMDowOToxMkFNICswMjAwLCBEYW5pZWwgVmV0dGVyIHdyb3Rl
Ogo+Pj4KPj4+PiBZZWFoLCBidXQgaXQgZG9lc24ndCB3b3JrIHdoZW4gZm9yd2FyZGluZyBmcm9t
IHRoZSBkcm0gY2hhcmRldiB0byB0aGUKPj4+PiBkbWEtYnVmIG9uIHRoZSBpbXBvcnRlciBzaWRl
LCBzaW5jZSB5b3UnZCBuZWVkIGEgdG9uIG9mIGRpZmZlcmVudAo+Pj4+IGFkZHJlc3Mgc3BhY2Vz
LiBBbmQgeW91IHN0aWxsIHJlbHkgb24gdGhlIGNvcmUgY29kZSBwaWNraW5nIHVwIHlvdXIKPj4+
PiBwZ29mZiBtYW5nbGluZywgd2hpY2ggZmVlbHMgYWJvdXQgYXMgcmlza3kgdG8gbWUgYXMgdGhl
IHZtYSBmaWxlCj4+Pj4gcG9pbnRlciB3cmFuZ2xpbmcgLSBpZiBpdCdzIG5vdCBjb25zaXN0ZW50
bHkgYXBwbGllZCB0aGUgcmV2ZXJzZSBtYXAKPj4+PiBpcyB0b2FzdCBhbmQgdW5tYXBfbWFwcGlu
Z19yYW5nZSBkb2Vzbid0IHdvcmsgY29ycmVjdGx5IGZvciBvdXIgbmVlZHMuCj4+PiBJIHdvdWxk
IHRoaW5rIHRoZSBwZ29mZiBoYXMgdG8gYmUgdHJhbnNsYXRlZCBhdCB0aGUgc2FtZSB0aW1lIHRo
ZQo+Pj4gdm0tPnZtX2ZpbGUgaXMgY2hhbmdlZD8KPj4+Cj4+PiBUaGUgb3duZXIgb2YgdGhlIGRt
YV9idWYgc2hvdWxkIGhhdmUgb25lIHZpcnR1YWwgYWRkcmVzcyBzcGFjZSBhbmQgRkQsCj4+PiBh
bGwgaXRzIGRtYSBidWZzIHNob3VsZCBiZSBsaW5rZWQgdG8gaXQsIGFuZCBhbGwgcGdvZmZzIHRy
YW5zbGF0ZWQgdG8KPj4+IHRoYXQgc3BhY2UuCj4+IFllYWgsIHRoYXQgaXMgZXhhY3RseSBsaWtl
IGFtZGdwdSBpcyBkb2luZyBpdC4KPj4KPj4gR29pbmcgdG8gZG9jdW1lbnQgdGhhdCBzb21laG93
IHdoZW4gSSdtIGRvbmUgd2l0aCBUVE0gY2xlYW51cHMuCj4gQlRXLCB3aGlsZSBwZW9wbGUgYXJl
IGxvb2tpbmcgYXQgdGhpcywgaXMgdGhlcmUgYSB3YXkgdG8gZ28gZnJvbSBhIFZNQQo+IHRvIGEg
ZG1hX2J1ZiB0aGF0IG93bnMgaXQ/CgpPbmx5IGEgZHJpdmVyIHNwZWNpZmljIG9uZS4KCkZvciBU
VE0gZHJpdmVycyB2bWEtPnZtX3ByaXZhdGVfZGF0YSBwb2ludHMgdG8gdGhlIGJ1ZmZlciBvYmpl
Y3QuIE5vdCAKc3VyZSBhYm91dCB0aGUgZHJpdmVycyB1c2luZyBHRU0gb25seS4KCldoeSBhcmUg
eW91IGFza2luZz8KClJlZ2FyZHMsCkNocmlzdGlhbi4KCj4KPiBKYXNvbgo+IF9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gTGluYXJvLW1tLXNpZyBtYWls
aW5nIGxpc3QKPiBMaW5hcm8tbW0tc2lnQGxpc3RzLmxpbmFyby5vcmcKPiBodHRwczovL2xpc3Rz
LmxpbmFyby5vcmcvbWFpbG1hbi9saXN0aW5mby9saW5hcm8tbW0tc2lnCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
