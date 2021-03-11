Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8275E337A83
	for <lists+dri-devel@lfdr.de>; Thu, 11 Mar 2021 18:12:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB69F6E063;
	Thu, 11 Mar 2021 17:12:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E800D6E063
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Mar 2021 17:12:37 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id 18so40958933lff.6
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Mar 2021 09:12:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=3nZrNZAlQ7fNFVlB/ncHMU9Y9miXCLpFJ30rJ9BLUO0=;
 b=IVGXWiOD7hDdyxq2bFepgOqkWt0DZxmoYTw6XqGU6pEShXZewrfqA8T9tolPtSbIYk
 S61HsWxnZEuMEVPoj+gcBlWx/9Ptui0+iOe0QEoALTpTsCrelEg8NnWwnGqgJUuVKT2e
 MYWcWhkWVY0FaiH3MK86Cjht7SyzC3WVB2jsQZwbduTJjhZt/GhMjaEeER01bOQMGEi3
 n9Sxt5qLQoBbM948ZSoe0jqCReQnKbp5bhUDqWn/z0bs/9wqUVBw/D9OF36QH55DUQwT
 LB8eRKKvutTv2B60vgmfCsxkB452Z1s9/mUHObrL5moifmaYHxkzCuG9nMozc2chVxQY
 iSYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3nZrNZAlQ7fNFVlB/ncHMU9Y9miXCLpFJ30rJ9BLUO0=;
 b=P6e613eVvz4Lhi0OIQh53Uen8LJ3DgBkkXV/8El6u9tfyeJZE5tIfJ6kLuc6aY98bT
 IcGWWWSGPNH2cU8dO14uSGl3l2FTABqB8Xbas3aRsMelNxqxAuLuK2m9so8/X+J7GEeW
 h8/VLRAB7XyQJLE3hIlMH/0SqM15buXdEZELvwfSDpt6eJDbAZMQ+SUL07lR9ufXvodP
 8fOqHeolOeHL9ryaB5MpiKzsw7EyognhKz76ZC7Ar0ZaC2TyB71jYQp9Tx1BfUQLQSgK
 C/SLfCvT/PB/EQuGL35BJtjZCTye5FdPWsRR9kIenfjiK8kXdBolH5vTDX3PmdzXz0us
 NPbw==
X-Gm-Message-State: AOAM53177ytcKGfGJd6JIRG93e0PBE4KrVzUHUGD7gNs/ZPYdhXKLm/x
 mhVDKtFXaJDAqrWHwtGGxDuAScG1ygE=
X-Google-Smtp-Source: ABdhPJwT6mHPhMsF54uxKS8z3qLJNi9SUeGjUOLfvAmSHkBDOAhV/V5E7fdMr1abW61xPhdiTZqtEw==
X-Received: by 2002:a19:7fc3:: with SMTP id a186mr2691203lfd.626.1615482756315; 
 Thu, 11 Mar 2021 09:12:36 -0800 (PST)
Received: from [192.168.2.145] (109-252-193-52.dynamic.spd-mgts.ru.
 [109.252.193.52])
 by smtp.googlemail.com with ESMTPSA id v70sm1004633lfa.106.2021.03.11.09.12.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Mar 2021 09:12:36 -0800 (PST)
Subject: Re: [PATCH v14 1/2] drm/tegra: dc: Support memory bandwidth management
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Matt Merhar <mattmerhar@protonmail.com>, Peter Geis <pgwipeout@gmail.com>,
 Nicolas Chauvet <kwizart@gmail.com>
References: <20210311170606.7543-1-digetx@gmail.com>
 <20210311170606.7543-2-digetx@gmail.com>
Message-ID: <37ff0499-6601-e97a-9fba-8e3e6f338b86@gmail.com>
Date: Thu, 11 Mar 2021 20:12:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <20210311170606.7543-2-digetx@gmail.com>
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
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MTEuMDMuMjAyMSAyMDowNiwgRG1pdHJ5IE9zaXBlbmtvINC/0LjRiNC10YI6Cj4gK3N0YXRpYyBj
b25zdCBjaGFyICogY29uc3QgdGVncmFfcGxhbmVfaWNjX25hbWVzW1RFR1JBX0RDX0xFR0FDWV9Q
TEFORVNfTlVNXSA9IHsKPiArCSJ3aW5hIiwgIndpbmIiLCAid2luYyIsICIiLCAiIiwgIiIsICJj
dXJzb3IiLAo+ICt9Owo+ICsKPiAraW50IHRlZ3JhX3BsYW5lX2ludGVyY29ubmVjdF9pbml0KHN0
cnVjdCB0ZWdyYV9wbGFuZSAqcGxhbmUpCj4gK3sKPiArCWNvbnN0IGNoYXIgKmljY19uYW1lID0g
dGVncmFfcGxhbmVfaWNjX25hbWVzW3BsYW5lLT5pbmRleF07Cj4gKwlzdHJ1Y3QgZGV2aWNlICpk
ZXYgPSBwbGFuZS0+ZGMtPmRldjsKPiArCXN0cnVjdCB0ZWdyYV9kYyAqZGMgPSBwbGFuZS0+ZGM7
Cj4gKwlpbnQgZXJyOwo+ICsKPiArCWlmIChXQVJOX09OKHBsYW5lLT5pbmRleCA+PSBURUdSQV9E
Q19MRUdBQ1lfUExBTkVTX05VTSkgfHwKPiArCSAgICBXQVJOX09OKCF0ZWdyYV9wbGFuZV9pY2Nf
bmFtZXNbcGxhbmUtPmluZGV4XSkpCj4gKwkJcmV0dXJuIC1FSU5WQUw7CgpJdCBqdXN0IG9jY3Vy
cmVkIHRvIG1lIHRoYXQgSSBhZGRlZCB0aGUgTlVMTC1jaGVjayBoZXJlLCBidXQgbWlzc2VkIHRv
CmNoYW5nZSAiIiB0byBOVUxMcy4gSSdsbCBtYWtlIGEgdjE1IHNob3J0bHkuCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
