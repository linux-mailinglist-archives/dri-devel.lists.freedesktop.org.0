Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DFF92A5F5D
	for <lists+dri-devel@lfdr.de>; Wed,  4 Nov 2020 09:23:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0993D89D3E;
	Wed,  4 Nov 2020 08:22:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DA0A6E926
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Nov 2020 03:04:00 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id c20so16098737pfr.8
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Nov 2020 19:04:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=M+7yANrvElG7vvXiOwG93dIUVBVs3AW4QD34DhOvCCI=;
 b=btFJkwgN45cTDxVtmE+Vf/+i4KTd+QJ7t7NUxCyZTE8m1tbcZbzqjNbBGYprvd57iN
 UShejiWVREUTlyzMsd8UIEC1n3FLdTx5oKihlzv2zQeOYrsmRCZgIbcc6awaLDRftLtE
 zXyerpEX+lcba+6EjdtoMaErPXzcXtWX9M4Y9iH8f2tOBVl07bUpcttN9jtz5woiWfKs
 E+NHYqOnfFZuFluN5f3wZdCPeP0xl5bojj8vXL3BjMJXkdIgBBDDevUeORWDZDPkDzVZ
 H2onAvXjL0GO/VwttnAAAPMr+4GLy0YLVKE1PsLXoA6a+UqtctBYVCJ+sIAt5sIl2M7Z
 d8QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=M+7yANrvElG7vvXiOwG93dIUVBVs3AW4QD34DhOvCCI=;
 b=mGYTQ58ZYtwL0nGX+Zi8liPZ0mVAjFuav+hyEA47CFyScb4bkf5D/S9MUdMnjzlwjL
 q+ElDje0ruWZc7W/oVRPfC6TI3AAjkJ1Dm3j/HypWCqWdYfJt5kYqIHfrgVtxpJCMXNZ
 jZCMJWVB7JmoLNFme88zZZZs00rAB5zgsxh2riwnZ9lTj9+Jvi1MSKLsHTTZ25mJGuiD
 +W/S19XKSUjAUXa/O9F2UkSZXR8bezGyclMqyCBKtf56efERhTZqf+/ff3LkUZ//1syo
 9TXRWoT5csEt/iaYlSBoYujEj5K8+9szFzktf5QNZmK/jO3hRlApO44mKl6hzLVXMY5U
 wGkQ==
X-Gm-Message-State: AOAM531NW7FO8mAkQJ8pjv0iW9xFtwJ0MhCP8rcivJopu2Xc1VUt5uyV
 FmomlmIzmHnWmjTcRKU5QWQt7g==
X-Google-Smtp-Source: ABdhPJye/niTkH7khNS36zvZ3Ubb6lzZ6FDeMgMpWSwwwaQ4FeRK9FDZcZ/yYMErd1iByJeq4uoX+A==
X-Received: by 2002:a17:90a:5882:: with SMTP id
 j2mr2156165pji.177.1604459039793; 
 Tue, 03 Nov 2020 19:03:59 -0800 (PST)
Received: from localhost ([122.172.12.172])
 by smtp.gmail.com with ESMTPSA id n64sm491754pfn.134.2020.11.03.19.03.57
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 03 Nov 2020 19:03:58 -0800 (PST)
Date: Wed, 4 Nov 2020 08:33:53 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH v2 07/22] drm/msm: Do rpm get sooner in the submit path
Message-ID: <20201104030353.ny7zvakgb4fsye6r@vireshk-i7>
References: <CAF6AEGstGtBswUUiyHxT2cCm8NwZekDnMzD0J_pQH37GwS=LiA@mail.gmail.com>
 <20201020090729.qgqish5kqamhvatj@vireshk-i7>
 <CAKMK7uHAgVUPHOPxDdt3LeAWqokxfuzqjZj4qqFkoKxFbRbRrg@mail.gmail.com>
 <20201020112413.xbk2vow2kgjky3pb@vireshk-i7>
 <CAF6AEGsCj-AtFozn8d1xiNNFNbuMJ0UxS-eMhBVXiQ7rKahKnQ@mail.gmail.com>
 <20201022080644.2ck4okrxygmkuatn@vireshk-i7>
 <CAF6AEGv6RMCsK4yp-W2d1mVTMcEiiwFGAb+V8rYLhDdMhqP80Q@mail.gmail.com>
 <20201027113532.nriqqws7gdcu5su6@vireshk-i7>
 <20201103054715.4l5j57pyjz6zd6ed@vireshk-i7>
 <CAF6AEGtgUVXm6Wwod0FC38g91Q8CotLFSoC4NmXx7GzcA=1mOA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAF6AEGtgUVXm6Wwod0FC38g91Q8CotLFSoC4NmXx7GzcA=1mOA@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
X-Mailman-Approved-At: Wed, 04 Nov 2020 08:22:13 +0000
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>, "Menon, Nishanth" <nm@ti.com>,
 David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 03-11-20, 08:50, Rob Clark wrote:
> sorry, it didn't apply cleanly (which I guess is due to some other
> dependencies that need to be picked back to v5.4 product kernel), and
> due to some other things I'm in middle of debugging I didn't have time
> yet to switch to v5.10-rc or look at what else needs to
> cherry-picked..
> 
> If you could, pushing a branch with this patch somewhere would be a
> bit easier to work with (ie. fetch && cherry-pick is easier to deal
> with than picking things from list)

It has been in linux-next for a few days. Here is the HEAD to pick
from. There are few patches there since rc1.

commit 203e29749cc0 ("opp: Allocate the OPP table outside of opp_table_lock")

-- 
viresh
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
