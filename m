Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 307B62C0128
	for <lists+dri-devel@lfdr.de>; Mon, 23 Nov 2020 09:12:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E604389BDB;
	Mon, 23 Nov 2020 08:12:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 433A089B65
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Nov 2020 06:32:13 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id c198so14924355wmd.0
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Nov 2020 22:32:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=cvoVqwP9FE52rvFYms7Y+WcvtyD/16/j90QsV7N1aWk=;
 b=xbRF9fS5clfnIPpqfycFtmWKqkeQgkcTHmz41tiQsJghMhZkvIdgBAPvw0T3BXSA4I
 wV3Q/ntGbWkU8zpZ9heYLLMcLsHqFKKmSqoBnzkvBSDGoNJA91LlKYGzEP25u3NQF3QB
 AivQoi1x7qkh9O1LRv+4sWnBn4SvV5o/8m90JmW7oA9ZLgw8PTzUp2epvQbGiBciQtVq
 1nBVi64/QS2RAHBg5pyr15f/p7i1uqIms5dwWdfDdU25n9vNbp299oBH2IqkkTO0cDx1
 UJC3P8LeWo+IqZuJLsQ8UpHhv+M2yxn7CD9mgGWviZO1w7WI2U/islls/qAJUAon2DrE
 J/9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=cvoVqwP9FE52rvFYms7Y+WcvtyD/16/j90QsV7N1aWk=;
 b=H8QS/tc6bOekpr6cFMMsWABcp3JwFMbwacqgAuhYtFftxAa+lkLe7VBd0lWxFeeQcY
 qxxVlEZqaCEcP++mhHcmGVF5FzPr/91QoNsX8ekOjN4kTcyl2Gk+vcqi+3fK4cBhV/3U
 rqTVNDGqYDX6Pec/vRCOKV7qP687Y5mXRV8nr8zWiQ8M5HOjf3WcE0j2SRncEZV0IsP4
 NXCinjbpuRTfKi4PYSStlBYxagob9UIaSfl1j59piEQpfpXzVrrNBXSgA9fX+YQ/+iUL
 ZGiGfwGtkNE+y5IdmE5kr+cetAhfSnc50B0Vomh/YRzRYA6A+b4UoUrEU/HMBKZO+Q4o
 ltPg==
X-Gm-Message-State: AOAM532A1BV8yvjkEtJyjWPR3Kh4QAvPOGOT+nrUAUS1YG2L0kzq6B+t
 JptJI7Fi6vl7JSjkfV3qdlc/Uj9QdXLCLA==
X-Google-Smtp-Source: ABdhPJwTKWks2V4u6Zzj4GGmt0mUu9p9zEiVEx7S7M5Igkq/WpJwqdS3vmhU4wIkWy4oSAnhkJUiDg==
X-Received: by 2002:a1c:9901:: with SMTP id b1mr21807743wme.18.1606113131688; 
 Sun, 22 Nov 2020 22:32:11 -0800 (PST)
Received: from MacBook-Pro.local ([212.45.64.13])
 by smtp.googlemail.com with ESMTPSA id
 a144sm15756349wmd.47.2020.11.22.22.32.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 22 Nov 2020 22:32:10 -0800 (PST)
Subject: Re: [PATCH v10 03/19] memory: tegra30: Support interconnect framework
To: Dmitry Osipenko <digetx@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Peter De Schrijver <pdeschrijver@nvidia.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Mikko Perttunen <cyndis@kapsi.fi>,
 Viresh Kumar <vireshk@kernel.org>, Peter Geis <pgwipeout@gmail.com>,
 Nicolas Chauvet <kwizart@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>
References: <20201123002723.28463-1-digetx@gmail.com>
 <20201123002723.28463-4-digetx@gmail.com>
From: Georgi Djakov <georgi.djakov@linaro.org>
Message-ID: <109bc617-f7d9-8635-3db1-3f4869b32f4d@linaro.org>
Date: Mon, 23 Nov 2020 08:32:09 +0200
MIME-Version: 1.0
In-Reply-To: <20201123002723.28463-4-digetx@gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Mon, 23 Nov 2020 08:12:51 +0000
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dmitry,

On 23.11.20 2:27, Dmitry Osipenko wrote:
> Now Internal and External memory controllers are memory interconnection
> providers. This allows us to use interconnect API for tuning of memory
> configuration. EMC driver now supports OPPs and DVFS. MC driver now
> supports tuning of memory arbitration latency, which needs to be done
> for ISO memory clients, like a Display client for example.
> 
> Tested-by: Peter Geis <pgwipeout@gmail.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>

Acked-by: Georgi Djakov <georgi.djakov@linaro.org>

Thank you for the continuous work on this patchset!

BR,
Georgi

> ---
>   drivers/memory/tegra/Kconfig       |   1 +
>   drivers/memory/tegra/tegra30-emc.c | 344 +++++++++++++++++++++++++++--
>   drivers/memory/tegra/tegra30.c     | 173 ++++++++++++++-
>   3 files changed, 496 insertions(+), 22 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
