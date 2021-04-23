Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D98D368E80
	for <lists+dri-devel@lfdr.de>; Fri, 23 Apr 2021 10:10:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D52146EB4F;
	Fri, 23 Apr 2021 08:10:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8480A6EB4F
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Apr 2021 08:10:29 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id v6so71304863ejo.6
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Apr 2021 01:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=9ehiXslja300i2vGj1/93A1eFwKfaTwfsPk1xeLX9g0=;
 b=mTvEpz2zpeZnMPAsi5WCXFZWP6lDmuYfIHb8spsDH+ZFdAw5955Jn4QCxuCahCwVhu
 2HfEZB6dg1r5ZFiYL9cFtr+Eg+uOdzzf10gwJshgk6Dk0/jn8oqeZ6Rqc3JHhUSCByZT
 eIqiD3BzxpNBtswgL1dPuvnJhlbvdIXqHw2F0hoP9T1nVa+685UqEsz5JoW4QpU4UulT
 bVnm/9Y+I6Z+7t0sDQ1YFdF9SQP7EVB/JVHanABcn7GMxf/teGdINxjrY+Gj0JyrTAOr
 1hauBrNq0ZirSeDDRTC+zCEK9hVLSWBSnmJ5d8NW+h2uj+kh7RoQqlzS0Xmt4zYOOKhW
 3X5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=9ehiXslja300i2vGj1/93A1eFwKfaTwfsPk1xeLX9g0=;
 b=qSl+idzs7E/UBVujQlqCDi+JQKmKHgxy5UUMJelH2LjrwReJ5uGXIJI78QH20A/+us
 ODJR6BjSpEVzVcElzbT5P5/Hr3HTQTIBZWwjngKfPix/L7IDiHlt7nYBpJfV4nDjsy23
 r4YvPtaL93wNFJqROKqrog+fkvJzMKdxWTQemocefThhGE1W+T5jozJKKkfE3fdLrLAy
 12q6rAGek7t0wPaZKTAIe5N3PMeI9FBYpA4Tr/bo/yh9vc6oKRgFU5nc/pGEZyonLRLB
 tYYNPRTGzEXT2R41UEcDt9H9UZ0F+oaTO3m9l9o8hQnSNOZgI6FiAXjGzDObqgfSYutk
 dGJQ==
X-Gm-Message-State: AOAM533WBSg+UH4NHYv47G6agXy9NDt0Hi3YcdSWDx1r1nXMkev9n1cx
 E6CjnT+81eiQLP6AhICxNpo=
X-Google-Smtp-Source: ABdhPJxVQP52a6KQPI83FRSHoKvz2CE8KYNXcsOBDRk9jrxzfsx25SaDMYXg1BKJAWCldqO9IVHctA==
X-Received: by 2002:a17:906:cc46:: with SMTP id
 mm6mr3007567ejb.138.1619165428070; 
 Fri, 23 Apr 2021 01:10:28 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:509f:9ae8:ad1c:20a4?
 ([2a02:908:1252:fb60:509f:9ae8:ad1c:20a4])
 by smtp.gmail.com with ESMTPSA id t14sm3461827ejj.77.2021.04.23.01.10.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Apr 2021 01:10:27 -0700 (PDT)
Subject: Re: [PATCH 1/2] coda: fix reference counting in coda_file_mmap error
 path
To: Jan Harkes <jaharkes@cs.cmu.edu>
References: <20210421132012.82354-1-christian.koenig@amd.com>
 <91292A4A-5F97-4FF8-ABAD-42392A0756B5@cs.cmu.edu>
 <f603f59b-ec52-7ad7-475a-fcf95902e145@gmail.com>
 <20210422135103.hif4a5znhzt4pc6f@cs.cmu.edu>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <1dce6311-c708-19a8-a9cb-489602d6e930@gmail.com>
Date: Fri, 23 Apr 2021 10:10:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210422135103.hif4a5znhzt4pc6f@cs.cmu.edu>
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
Cc: jgg@ziepe.ca, miklos@szeredi.hu, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-unionfs@vger.kernel.org,
 coda@cs.cmu.edu, akpm@linux-foundation.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjIuMDQuMjEgdW0gMTU6NTEgc2NocmllYiBKYW4gSGFya2VzOgo+IE9uIFRodSwgQXByIDIy
LCAyMDIxIGF0IDAyOjM5OjQxUE0gKzAyMDAsIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4+IEFt
IDIyLjA0LjIxIHVtIDE0OjI3IHNjaHJpZWIgSmFuIEhhcmtlczoKPj4+IExvb2tzIGdvb2QgdG8g
bWUuCj4+Pgo+Pj4gSSdtIGFsc28gbWFpbnRhaW5pbmcgYW4gb3V0IG9mIHRyZWUgY29kYSBtb2R1
bGUgYnVpbGQgdGhhdCBwZW9wbGUgc29tZXRpbWVzIHVzZSwgd2hpY2ggaGFzIHdvcmthcm91bmRz
IGZvciBkaWZmZXJlbmNlcyBiZXR3ZWVuIHRoZSB2YXJpb3VzIGtlcm5lbCB2ZXJzaW9ucy4KPj4+
Cj4+PiBEbyB5b3UgaGF2ZSBhIHJlZmVyZW5jZSB0byB0aGUgY29ycmVzcG9uZGluZyBtbWFwX3Jl
Z2lvbiBjaGFuZ2U/IElmIGl0IGlzIG1lcmdlZCBhbHJlYWR5IEknbGwgcHJvYmFibHkgYmUgYWJs
ZSB0byBmaW5kIGl0LiBJcyB0aGlzIG1tYXBfcmVnaW9uIGNoYW5nZSBleHBlY3RlZCB0byBiZSBi
YWNrcG9ydGVkIHRvIGFueSBsdHMga2VybmVscz8KPj4gVGhhdCBpcyB0aGUgZm9sbG93aW5nIHVw
c3RyZWFtIGNvbW1pdCBpbiBMaW51cyB0cmVlOgo+Pgo+PiBjb21taXQgMTUyN2Y5MjZmZDA0NDkw
ZjY0OGM0MmY0MmI0NTIxOGEwNDc1NGY4Nwo+PiBBdXRob3I6IENocmlzdGlhbiBLw7ZuaWcgPGNo
cmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KPj4gRGF0ZTrCoMKgIEZyaSBPY3QgOSAxNTowODo1NSAy
MDIwICswMjAwCj4+Cj4+ICDCoMKgwqAgbW06IG1tYXA6IGZpeCBmcHV0IGluIGVycm9yIHBhdGgg
djIKPj4KPj4gQnV0IEkgZG9uJ3QgdGhpbmsgd2Ugc2hvdWxkIGJhY2twb3J0IHRoYXQuCj4+Cj4+
IEFuZCBzb3JyeSBmb3IgdGhlIG5vaXNlLiBXZSBoYWQgc28gbWFueSBwbGFjZXMgd2hpY2ggZXhw
ZWN0ZWQgZGlmZmVyZW50Cj4+IGJlaGF2aW9yIHRoYXQgSSBkaWRuJ3Qgbm90aWNlZCB0aGF0IHR3
byBvY2Nhc2lvbnMgaW4gdGhlIGZzIGNvZGUgYWN0dWFsbHkKPj4gcmVseSBvbiB0aGUgY3VycmVu
dCBiZWhhdmlvci4KPj4KPj4gRm9yIHlvdXIgb3V0IG9mIHRyZWUgbW9kdWxlIHlvdSBjb3VsZCBt
YWtlIHRoZSBjb2RlIHZlcnNpb24gaW5kZXBlbmRlbnQgYnkKPj4gc2V0dGluZyB0aGUgdm1hIGJh
Y2sgdG8gdGhlIG9yaWdpbmFsIGZpbGUgaW4gY2FzZSBvZiBhbiBlcnJvci4gVGhhdCBzaG91bGQK
Pj4gd29yayB3aXRoIGJvdGggYmVoYXZpb3JzIGluIG1tYXBfcmVnaW9uLgo+IEF3ZXNvbWUsIEkn
bGwgZ2l2ZSB0aGF0IGEgdHJ5LCBpdCBtYXkgdmVyeSB3ZWxsIGJlIGEgY2xlYW5lciBzb2x1dGlv
bgo+IGVpdGhlciB3YXkuCj4KPiBBbmQgdGhhbmsgeW91IGZvciBmb2xsb3dpbmcgdXAgYWZ0ZXIg
eW91ciBvcmlnaW5hbCBwYXRjaCBhbmQgZmluZGluZwo+IHRoZSBmaWxlc3lzdGVtcyB0aGF0IG1l
c3MgYXJvdW5kIHdpdGggdGhvc2UgbWFwcGluZ3MuIEknbSBzdXJlIGl0IHdvdWxkCj4gaGF2ZSB0
YWtlbiBtZSBhIHdoaWxlIHRvIGZpZ3VyZSBvdXQgd2h5IGZpbGUgcmVmY291bnRzIHdvdWxkIGdv
IHdlaXJkCj4gZm9yIHNvbWUgcGVvcGxlLCBlc3BlY2lhbGx5IGJlY2F1c2UgdGhpcyBvbmx5IGhh
cHBlbnMgaW4gdGhlIGVycm9yIHBhdGguCgpLdWRvcyBnb2VzIHRvIE1pa2xvcyBmb3IgZmlndXJl
ZCBvdXQgd2h5IHRoZSByZWZjb3VudCBmb3Igb3ZlcmxheWZzIHdhcyAKc3VkZGVubHkgd3Jvbmcu
CgpBbmQgcGxlYXNlIGFsc28gc2VlIHRoZSBmb2xsb3cgdXAgY29tbWl0OgoKY29tbWl0IDI5NTk5
MmZiODE1ZTc5MWQxNGIxOGVmN2NkYmJhZjFhNzYyMTFhMzEgKGFibGUvdm1hX2ZpbGUpCkF1dGhv
cjogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgpEYXRlOsKgwqAg
TW9uIFNlcCAxNCAxNTowOTozMyAyMDIwICswMjAwCgogwqDCoMKgIG1tOiBpbnRyb2R1Y2Ugdm1h
X3NldF9maWxlIGZ1bmN0aW9uIHY1CgpJdCBhZGRzIGEgbmV3IHZtYV9zZXRfZmlsZSgpIGZ1bmN0
aW9uIHdoaWNoIGltcGxlbWVudHMgdGhlIG5lY2Vzc2FyeSAKcmVmY291bnQgZGFuY2UgZm9yIGNo
YW5naW5nIHRoZSB2bWEgZmlsZSBpbiBhIGNsZWFuIG1hbm5lci4KClRoYW5rcywKQ2hyaXN0aWFu
LgoKPgo+IEphbgo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWwK
