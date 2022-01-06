Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 046B84869A5
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jan 2022 19:20:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC28910E7B9;
	Thu,  6 Jan 2022 18:20:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B2D110E66A
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jan 2022 16:26:36 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id k15so11331429edk.13
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jan 2022 08:26:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=M3WBgNvuzR0WIM72X4IIZhdl+Kt7G0oeF/Hg+m6AnQQ=;
 b=fgiBBLNYIvYGIfdhyPt4wlDj5rXuxLmRzyNOioyVzzAUKj4l3Caq6fqK9F2EsIHX4I
 X4HlCLY/Z0X8Imh4hK8c/IUQPlTTteF7PV185QA3p/gtCMS8jBTLoWndm5NQzRo/HhKl
 Nfzm/wEL6Ug8PUl+nFhKfaKS3Cpa6qigrWMjJAfV+Xa4uF1t37FKDYU6hygy3FTxu6EW
 WFKpGeFU44cT3zVqQYXSpvR9MVqTYHAxqj0OSdHqrtgmm7ILScJav6crXJFK1Vdfcy2z
 L4MlteqfpRl/3cODA32ciAsahNPrTnXuUftywFoc6esuJKy8l5MlM+G4Gzn7okOim+Wz
 xnYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=M3WBgNvuzR0WIM72X4IIZhdl+Kt7G0oeF/Hg+m6AnQQ=;
 b=lEuT0O1pstzgEUPF/tlXe7EviBqBqtK6iQZLA5DzZZo4Z5egeBBGNjDhzRrV9ZcWQC
 jYfELjvvIqz9QAful3ccEIcYIWfbM3uqfm94+nxpz6BHmbGlBvq7M3nWIFodkizo/FYv
 2bE0YKdkfsDe8G74uetLKDv1YMLU9vdnTCj0Z8B20aRcOeEBtcFQHogJn8unbkvZnPK+
 M32fbwppRdle2shKv8N81nL5U9NMKJXKX2jQLvD6SK5VzXkGLhRJ+PcQH2Zzuo4O3jY0
 ELv0h5qCCz1Rg+fq6WU+IurFMXeJBdj9G+fws3k46hzWO41ZEVfsA7myt0Ieigt/nkVC
 K/OA==
X-Gm-Message-State: AOAM531jE6diuCryC1i8amdJMvqm5cKGNQDJ5ncjIhcDhqyI5ZlJuRBj
 vUdrloKC2LnP1GmlObDXwXk=
X-Google-Smtp-Source: ABdhPJzkLPEDxZ+Q9y6t19YtLkNWFcwnXI5cBQncyffs1BgDiayMRg1pyYzUb7voCgh6Ar0CWePj4w==
X-Received: by 2002:a17:907:97cd:: with SMTP id
 js13mr46470367ejc.497.1641486388365; 
 Thu, 06 Jan 2022 08:26:28 -0800 (PST)
Received: from [192.168.1.10] ([46.249.74.23])
 by smtp.googlemail.com with ESMTPSA id p8sm889653edq.46.2022.01.06.08.26.26
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 06 Jan 2022 08:26:27 -0800 (PST)
Subject: Re: [PATCH] drm: omapdrm: Fix implicit dma_buf fencing
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 sumit.semwal@linaro.org, christian.koenig@amd.com
References: <1641397018-29872-1-git-send-email-ivo.g.dimitrov.75@gmail.com>
 <0ba4b947-57e0-8a80-68d6-a481d5145ab4@ideasonboard.com>
From: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Message-ID: <e55b3d0f-2217-c949-f166-63ca738b44f6@gmail.com>
Date: Thu, 6 Jan 2022 18:26:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Firefox/60.0 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <0ba4b947-57e0-8a80-68d6-a481d5145ab4@ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 06 Jan 2022 18:20:20 +0000
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
Cc: philipp@uvos.xyz, airlied@linux.ie, merlijn@wizzup.org,
 openpvrsgx-devgroup@letux.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 6.01.22 г. 15:43 ч., Tomi Valkeinen wrote:
> Hi,
> 
> On 05/01/2022 17:36, Ivaylo Dimitrov wrote:
>> Currently omapdrm driver does not initialize dma_buf_export_info resv
>> member, which leads to a new dma_resv being allocated and attached to
>> the exported dma_buf. This leads to the issue that fences created on
>> dma_buf objects imported by other drivers are ignored by omapdrm, as only
>> fences in gem object resv are waited on. This leads to various issues 
>> like
>> displaying incomplete frames.
>>
>> Fix that by initializing dma_buf resv to the resv of the gem object being
>> exported.
>>
>> Signed-off-by: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
>> ---
>>   drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c 
>> b/drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c
>> index f1f93cabb61e..a111e5c91925 100644
>> --- a/drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c
>> +++ b/drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c
>> @@ -88,6 +88,7 @@ struct dma_buf *omap_gem_prime_export(struct 
>> drm_gem_object *obj, int flags)
>>       exp_info.size = omap_gem_mmap_size(obj);
>>       exp_info.flags = flags;
>>       exp_info.priv = obj;
>> +    exp_info.resv = obj->resv;
>>       return drm_gem_dmabuf_export(obj->dev, &exp_info);
>>   }
> 
> Thanks! Pushed to drm-misc-next.
> 

Thanks,

I think lts kernels shall get that fix too, but I have no idea how :) .

Ivo.
