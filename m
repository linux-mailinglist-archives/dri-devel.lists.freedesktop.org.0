Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E259D2627EE
	for <lists+dri-devel@lfdr.de>; Wed,  9 Sep 2020 09:05:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15CA46E9E8;
	Wed,  9 Sep 2020 07:05:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1799C89F35
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Sep 2020 01:24:32 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id x69so699027lff.3
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Sep 2020 18:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=LzY8j6+lp2zxW8tZ2fUBBIsqMnRRZb5OpOzz/ZscZ90=;
 b=mFZws4PEWoArF556jKoP2YkvyUiWbADRhRGk6TzsTbg8+s33lW9+43k+q1e1fPQUWi
 41Cwyv58cJVuKxF8WUHsxXNt+32fpRuNg8gFwQYZXH3Mm1bysWDcXqjHOmHIGrFc+uMK
 WgWsGwz14zBQLkruMlSpCczMOFqrceNQs5rnX5KkMwfz0lzjMBU5KjFyH1rmhz38uqCT
 ePn7SiAQ5LtP7l1UeWvajniaxYSRiN85Ukn455V6ASlI7L/SNSpZx99yRS0//6ld32et
 y+956CePhLB9Q7ytb92gffiQYqoOnoCkbpwBpYrenpF0T5Ycj4ilMUYxb0hfbw9tZodz
 wPIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LzY8j6+lp2zxW8tZ2fUBBIsqMnRRZb5OpOzz/ZscZ90=;
 b=g/XPZLttDNWCIB5+CP+aKGahLaxw1j9Zme03S9MEXaRceOBmpBFuh8ms9BoG337eUU
 z3DWyInbCa3O7bKqjbCWWHsdeu2bMHVpD2EHrIJmZIPSaYq1bQw8yU3swHyPI+kxpE5V
 LTVYpDU5ZfYOJEVybE7/u5NtQcpX5VPdOoiWdqHVKg41U5dkTiuGtcwqPGDvhPNaao2G
 nvfWTLK/iBXFE8FByEscaRlo0KwlKZwxLyuXJkc8GmOsagPQy0Nie7LyYSN9YuYPDKsS
 33lLLGa+UIUQKRKK0IkZxKR365shAhjETPEhzglcYeIKyRqikBeCiVABnjvdvdTzcnT0
 791Q==
X-Gm-Message-State: AOAM531Fsx6wVs5j6fsFmfhItUptY8TRfxuA0rYQfFppfjyEDi+bO4Mk
 sB6ToL2RZU80Iyikw2eFi2WWmQuN8BY=
X-Google-Smtp-Source: ABdhPJwSplnh5KzBASjpDLr6JT5ph7pfEeWTFBfjb3K7VNWuo2PGN1cYQg6SizaXUDa/oCvV2jUC0A==
X-Received: by 2002:ac2:4355:: with SMTP id o21mr755419lfl.210.1599614670500; 
 Tue, 08 Sep 2020 18:24:30 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru.
 [109.252.170.211])
 by smtp.googlemail.com with ESMTPSA id s4sm324335lja.124.2020.09.08.18.24.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Sep 2020 18:24:29 -0700 (PDT)
Subject: Re: [RFC PATCH v2 17/17] WIP: drm/tegra: Implement new UAPI
 (submit_handle_syncpts)
From: Dmitry Osipenko <digetx@gmail.com>
To: Mikko Perttunen <mperttunen@nvidia.com>, thierry.reding@gmail.com,
 jonathanh@nvidia.com, airlied@linux.ie, daniel@ffwll.ch
References: <20200905103420.3021852-1-mperttunen@nvidia.com>
 <20200905103420.3021852-18-mperttunen@nvidia.com>
 <ac29394b-6a51-88d3-b52c-8b105f31b215@gmail.com>
Message-ID: <d063703c-461b-79a8-2483-856793dd2e5f@gmail.com>
Date: Wed, 9 Sep 2020 04:24:29 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <ac29394b-6a51-88d3-b52c-8b105f31b215@gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 09 Sep 2020 07:04:23 +0000
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

MDkuMDkuMjAyMCAwNDoxMywgRG1pdHJ5IE9zaXBlbmtvINC/0LjRiNC10YI6Ci4uLgo+IEhvdyBt
YW55IHN5bmMgcG9pbnRzIHdvdWxkIHVzZSBhbiBhdmVyYWdlIGpvYj8gTWF5YmUgaXQgc2hvdWxk
IGJlIGJldHRlcgo+IHRvIGhhdmUgdGhlIHByZWRlZmluZWQgYXJyYXkgb2Ygc3luYyBwb2ludHMg
d2l0aGluIHRoZSBzdHJ1Y3QKPiBkcm1fdGVncmFfY2hhbm5lbF9zdWJtaXQ/Cj4gCgpUaGUgc2Ft
ZSBxdWVzdGlvbiByZWdhcmRpbmcgdGhlIGNvbW1hbmRzLgoKV291bGRuJ3QgaXQgYmUgYSBnb29k
IGlkZWEgdG8gbWFrZSBib3RoIHVzcnB0ciBhcnJheXMgb2Ygc3luYyBwb2ludHMgYW5kCmNvbW1h
bmRzIG9wdGlvbmFsIGJ5IGhhdmluZyBhIHNtYWxsIGZpeGVkLXNpemUgYnVmZmVycyB3aXRoaW4K
ZHJtX3RlZ3JhX2NoYW5uZWxfc3VibWl0PyBUaGVuIGEgbWFqb3JpdHkgb2Ygam9icyB3b3VsZCBv
bmx5IG5lZWQgdG8KY29weSB0aGUgZ2F0aGVyIGRhdGEgZnJvbSB1c2Vyc3BhY2UuCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
