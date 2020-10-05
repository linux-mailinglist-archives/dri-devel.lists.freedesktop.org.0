Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C4E628474F
	for <lists+dri-devel@lfdr.de>; Tue,  6 Oct 2020 09:32:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FB916E431;
	Tue,  6 Oct 2020 07:31:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf43.google.com (mail-qv1-xf43.google.com
 [IPv6:2607:f8b0:4864:20::f43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACA6B89CA1
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Oct 2020 14:37:18 +0000 (UTC)
Received: by mail-qv1-xf43.google.com with SMTP id de3so1575154qvb.5
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Oct 2020 07:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=TRhkx8XpeN9CeF5cEhP4BTdxGRsLqYAybwrIXicVRyw=;
 b=g4uOyk1vF6JnppHf+cmhEsdrx/imAVEV3qm6M88McCLKeyXHxx7dQLX3Qa6+f4K0My
 aNEEKPeIc0OYkbFMLrhdHU7EAKGtr+5V3rWOURrXeVuY+9kAXkLzGYs+gyoANk/B3q7J
 n2kpYVlQhvO+pwrtf723Te8oQxFZ5DAnXQD6maNxH0U0UbJC6mcC/1qsGeKTiTcOam4e
 bgAigiy9gaLlOwc+8Br425/P/36ybGf7RRSXWxtMxRDCPHe7ISXPsahuQ07wFC86fonE
 xRlhrFth4f+7+M04giaY74oUiXtfsI7Rlv0Byxnee/7HN5UvEO6V9AxChGotTH1S55ga
 3iIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TRhkx8XpeN9CeF5cEhP4BTdxGRsLqYAybwrIXicVRyw=;
 b=CYYBLv7eJ96sjsY4uXlu7B/LDyUEmweLVRo9q4MbpIvSRuPBEPDKWnYGc7Vnf/9kDn
 qrFMBOL0NEPCCEWoAowiKEDTmeTViV7JevT+8AZgXCRCHfaGQtukAp6JTrVkf4oyhW5/
 zhY6GcsBgUUBNi7HnNorVhGy51/BUKMTrOzizcVI80b6ckGSD2plfzFpTaCp1Gqz2AUa
 L6iG3BExBRqyAZHtUa0EtmFQSfuU1z0kXkrwdTF0eibxRTN5BM+ZZsQnDy2jQSQG277c
 +OIS5gKEOyu+X5ILvI9uVRLQrAY/FA80Fz9mhwy8NHM7B5LqqFndEwWJ7cJ/yCr1yvzC
 tHmg==
X-Gm-Message-State: AOAM5306O5YFvyCZLX9KdKA7xcT9CGvshnjURYzaIxxh9PAaJHBDtW9k
 xsH05nD++jdf6EQd3bdefFcUxA==
X-Google-Smtp-Source: ABdhPJyi+49wGLIUxrKIgGYZ337lCqeB0hW5hNuy6GwMzFj2CNJLAt9QKQKSeB3gCNxr0ID1rt688A==
X-Received: by 2002:a0c:e788:: with SMTP id x8mr14075471qvn.27.1601908637734; 
 Mon, 05 Oct 2020 07:37:17 -0700 (PDT)
Received: from [192.168.0.189] ([147.253.86.153])
 by smtp.gmail.com with ESMTPSA id g7sm435832qtc.19.2020.10.05.07.37.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Oct 2020 07:37:16 -0700 (PDT)
Subject: Re: [PATCH 2/3] drm/msm: add DRM_MSM_GEM_SYNC_CACHE for non-coherent
 cache maintenance
To: Christoph Hellwig <hch@infradead.org>
References: <20201001002709.21361-1-jonathan@marek.ca>
 <20201001002709.21361-3-jonathan@marek.ca>
 <20201002075321.GA7547@infradead.org>
 <b22fb797-67b0-a912-1d23-2b47c9a9e674@marek.ca>
 <20201005082914.GA31702@infradead.org>
From: Jonathan Marek <jonathan@marek.ca>
Message-ID: <3e0b91be-e4a4-4ea5-7d58-6e71b8d51932@marek.ca>
Date: Mon, 5 Oct 2020 10:35:43 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20201005082914.GA31702@infradead.org>
Content-Language: en-US
X-Mailman-Approved-At: Tue, 06 Oct 2020 07:31:05 +0000
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
Cc: David Airlie <airlied@linux.ie>, freedreno@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sean Paul <sean@poorly.run>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/5/20 4:29 AM, Christoph Hellwig wrote:
> On Fri, Oct 02, 2020 at 08:46:35AM -0400, Jonathan Marek wrote:
>>>> +void msm_gem_sync_cache(struct drm_gem_object *obj, uint32_t flags,
>>>> +		size_t range_start, size_t range_end)
>>>> +{
>>>> +	struct msm_gem_object *msm_obj = to_msm_bo(obj);
>>>> +
>>>> +	/* TODO: sync only the required range, and don't invalidate on clean */
>>>> +
>>>> +	if (flags & MSM_GEM_SYNC_CACHE_CLEAN)
>>>> +		sync_for_device(msm_obj);
>>>> +
>>>> +	if (flags & MSM_GEM_SYNC_CACHE_INVALIDATE)
>>>> +		sync_for_cpu(msm_obj);
>>>
>>> And make to these ones as well.  They are complete abuses of the DMA
>>> API, and while we had to live with that for now to not cause regressions
>>> they absoutely must not be exposed in a userspace ABI like this.
>>>
>>
>> How do you propose that cached non-coherent memory be implemented? It is a
>> useful feature for userspace.
> 
> If the driver is using the DMA API you need to use dma_alloc_noncoherent
> and friends as of 5.10 (see the iommu list for the discussion).
> 
> If you use the raw IOMMU API (which I think the msm drm driver does) you
> need to work with the maintainers to implement a cache synchronization
> API that is not tied to the DMA API.
> 

The cache synchronization doesn't have anything to do with IOMMU (for 
example: cache synchronization would be useful in cases where drm/msm 
doesn't use IOMMU).

What is needed is to call arch_sync_dma_for_{cpu,device} (which is what 
I went with initially, but then decided to re-use drm/msm's 
sync_for_{cpu,device}). But you are also saying those functions aren't 
for driver use, and I doubt IOMMU maintainers will want to add wrappers 
for these functions just to satisfy this "not for driver use" requirement.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
