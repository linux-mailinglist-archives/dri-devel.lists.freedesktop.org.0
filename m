Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7662134035C
	for <lists+dri-devel@lfdr.de>; Thu, 18 Mar 2021 11:33:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E614F6E0F3;
	Thu, 18 Mar 2021 10:33:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49DA76E0F3
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Mar 2021 10:33:41 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id x28so3743811lfu.6
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Mar 2021 03:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/pZ+kezBF2UIJIIaXW6PgYWm9Md+5QNCYNLeHlex5s4=;
 b=YrlTZbNx21OZWFoqPTG0Ww4LflBxA3ggLRD8xBun8L2ZEpfYyRqPejl2U9MZai+X//
 AdZMb6yNP3dntqiZ840DkeaqZRdwTckMkDOYVZkh7j0wUp8Z6+TN2v3pGzcSDWmMdJnM
 kPWLx+3g3vtDLY70mG4JBHco0khNHkoG9O6Fx+AX9PXnLI8rzpjb2WmxmFKepoDFOFpG
 YkrOnljWH3+u/oXCfugynJBNUeWG9EyRgllxKTgqQM8stY6H0aXT1iM72X/4jJczKRKW
 pagQk4UTF46F5WJJ5ZBGWLei3GRmPKgNearDWvIxs8uEaHYbpDQs1NmYooMpzk8whq+6
 Lv0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/pZ+kezBF2UIJIIaXW6PgYWm9Md+5QNCYNLeHlex5s4=;
 b=IPFG7mxA7XEyk1PLko+ilot9ziu1+XYNA4/Gpn+si4tFgtK63Tcp1zfKzCBUwT9Xya
 mBWE6WoEggRe6H1xCd+Qhmzq5cBFbEkcEzWF/UvPXGDqDF+B/8kUlUleyqsK6fn00hKf
 T+WMxvfJQx1o3F4l4ar7mSSDd3u6dm7aFfpbaJE0KymjVbXuE+PygEeGA5coxQrEvsPq
 bGDQIk20W8/CfKXdr0zB2df2tgy4NL0Lf6mxUEkCUhWYro0cSVWNo+dw00SP/tubxc8w
 KhLp0y4wvsePTVvQCo5IH2Ruvbs630ZF34F7WFj7S7Jr9UCdBCiwhQH+x/shL6pa6HZv
 9fXg==
X-Gm-Message-State: AOAM530zXq+7/Ep5DEH6AGaGtQUe9QFIWionWf+jRVxIXGyDfLJ4k6An
 FbokoIffw/yo7i42OHB9M4UsUsPB3xQ=
X-Google-Smtp-Source: ABdhPJyxMOynpXNQj3F5yIeEViZsBGK9MToVwqbacPUTlVyIe1ljh+G35/ctl0fCbVv1zVnkmo9+cA==
X-Received: by 2002:ac2:5feb:: with SMTP id s11mr4810902lfg.558.1616063619505; 
 Thu, 18 Mar 2021 03:33:39 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-52.dynamic.spd-mgts.ru.
 [109.252.193.52])
 by smtp.googlemail.com with ESMTPSA id f28sm175257lfk.67.2021.03.18.03.33.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Mar 2021 03:33:39 -0700 (PDT)
Subject: Re: [PATCH v16 1/2] drm/tegra: dc: Support memory bandwidth management
To: =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
References: <20210317185734.14661-1-digetx@gmail.com>
 <20210317185734.14661-2-digetx@gmail.com>
 <20210318093142.GB18038@qmqm.qmqm.pl>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <4ad258c7-964e-d6e7-2222-2f85030ded76@gmail.com>
Date: Thu, 18 Mar 2021 13:33:38 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210318093142.GB18038@qmqm.qmqm.pl>
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
Cc: linux-pm@vger.kernel.org, Nicolas Chauvet <kwizart@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Matt Merhar <mattmerhar@protonmail.com>, Peter Geis <pgwipeout@gmail.com>,
 linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MTguMDMuMjAyMSAxMjozMSwgTWljaGHFgiBNaXJvc8WCYXcg0L/QuNGI0LXRgjoKPj4gIHN0YXRp
YyBjb25zdCBzdHJ1Y3QgdGVncmFfd2luZG93Z3JvdXBfc29jIHRlZ3JhMTk0X2RjX3dncnBzW10g
PSB7Cj4+IEBAIC0yNDMwLDYgKzI3ODEsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHRlZ3JhX2Rj
X3NvY19pbmZvIHRlZ3JhMTk0X2RjX3NvY19pbmZvID0gewo+PiAgCS5oYXNfbnZkaXNwbGF5ID0g
dHJ1ZSwKPj4gIAkud2dycHMgPSB0ZWdyYTE5NF9kY193Z3JwcywKPj4gIAkubnVtX3dncnBzID0g
QVJSQVlfU0laRSh0ZWdyYTE5NF9kY193Z3JwcyksCj4+ICsJLnBsYW5lX3RpbGVkX21lbW9yeV9i
YW5kd2lkdGhfeDIgPSBmYWxzZSwKPj4gIH07Cj4gRm9yIGdsb2JhbHMgeW91IHdpbGwgaGF2ZSAu
eCA9IGZhbHNlIGJ5IGRlZmF1bHQ7IEknbSBub3Qgc3VyZSB0aG9zZSBlbnRyaWVzCj4gYWRkIG11
Y2ggdmFsdWUuCj4gCj4gUmV2aWV3ZWQtYnk6IE1pY2hhxYIgTWlyb3PFgmF3IDxtaXJxLWxpbnV4
QHJlcmUucW1xbS5wbD4KCklJUkMsIGluIHRoZSBwYXN0IFRoaWVycnkgcHJlZmVycmVkIHRvIGFk
ZCB0aGUgZGVmYXVsdHMgdG8gdGhpcyBkcml2ZXIKaW4gb3JkZXIgdG8gZWFzZSByZWFkaW5nL3Vu
ZGVyc3RhbmRpbmcgb2YgdGhlIGNvZGUuIFNvIEkgYWRkZWQgdGhlbSBmb3IKY29uc2lzdGVuY3ku
CgpUaGFuayB5b3UgdmVyeSBtdWNoIGZvciBoZWxwaW5nIHdpdGggdGhlIHJldmlldyEKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
