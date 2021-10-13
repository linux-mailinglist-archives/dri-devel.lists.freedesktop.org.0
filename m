Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 58C2342B7E7
	for <lists+dri-devel@lfdr.de>; Wed, 13 Oct 2021 08:48:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37B276E08E;
	Wed, 13 Oct 2021 06:48:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C1406E08E
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Oct 2021 06:48:36 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id j21so7464509lfe.0
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Oct 2021 23:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=QjB1BdoR7ZGictHvD5ULpvTOZqW0I38odTyCHuq79oQ=;
 b=Mvh1c/bdTcW3v5TtlUWklGjNkvno75zxoWuQgrbMlergLlKkEr8XUkKo7qt68FrBMQ
 PPOMi4jN+RbtsRSMMZmCG5EnGf9tdN6xK+zr1Yl6OpFnR+Fx1EO3zBin/OPsCJkmhAG0
 3t582FErPmUh0rfNidrCNZyRJS+SkQciCOX7VkOffxmCYZg5i+yskxp0p6Mftpe6GDug
 1wuJGCC+9rQtPnksH8jtpsBxgBOky+z6uZ+kqxJlmFTbXDrtgWisAe0J9F8RGS7GlWHd
 jQYZI8k4YLtK4zopBXiRdxrIPL17rMY723iWzJC/UzfIMvp5MD0c4vPjArQKKlEPczvf
 yDbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QjB1BdoR7ZGictHvD5ULpvTOZqW0I38odTyCHuq79oQ=;
 b=TmGZSYHTYt51ThzjhoHNPYlK83HxnqiXykQCECtqjIUULc8a3ji9JtvOB8IeaphkzU
 zPp84mapzUGyurLAgnR5Ju/07rPqOHSo5XlyY2LVKLLjNkzj+8dBIYpR9YHSV0G3ERJa
 n9+KaF0dcKX1RanZ/TaJYfQhMPAQwcblRDLCIWyKXEhOx2jrdNhzuW2FrP7og9GgsRCd
 uAPwZqfRUaOCjrOoDFSvUtf9lEyF3YAQW0PVMOKc64sttoGR41JRMqMbqdTQkW6cIqI1
 C0QSh69xwNqXjuByv0fCCCWYhQN5siHljkobhKBVNJOqYJeuB+gNtRjb+VR/OsSa7G7I
 CK9Q==
X-Gm-Message-State: AOAM533WhLM83ZVmYRH786KaRZNHzlpwdBpRefnYw/O/3ONumVsbBBmE
 0Frvd05LySNwfzmKUPM7SHE=
X-Google-Smtp-Source: ABdhPJwdATS8P94EYvYkeNxeLQFIBnHOI838/Rw4VZAxZCsvqm8GAzbLvCqk//EcAyUrra3WfGGSIQ==
X-Received: by 2002:ac2:5dfc:: with SMTP id z28mr22823533lfq.79.1634107714098; 
 Tue, 12 Oct 2021 23:48:34 -0700 (PDT)
Received: from [192.168.0.14]
 (095160158079.dynamic-2-waw-k-4-2-0.vectranet.pl. [95.160.158.79])
 by smtp.gmail.com with ESMTPSA id p23sm1236840lfd.127.2021.10.12.23.48.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Oct 2021 23:48:33 -0700 (PDT)
Subject: Re: [PATCH] drm/bridge: Ignore -EPROBE_DEFER when bridge attach fails
To: =?UTF-8?Q?Guido_G=c3=bcnther?= <agx@sigxcpu.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Jyri Sarha <jyri.sarha@iki.fi>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <00493cc61d1443dab1c131c46c5890f95f6f9b25.1634068657.git.agx@sigxcpu.org>
 <YWXtQ778N/rn+Jnu@pendragon.ideasonboard.com>
 <YWX0UPyw+5OBsBA6@qwark.sigxcpu.org>
From: Andrzej Hajda <andrzej.hajda@gmail.com>
Message-ID: <78425826-1c28-4cb5-ba1f-23c6492a3810@gmail.com>
Date: Wed, 13 Oct 2021 08:48:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YWX0UPyw+5OBsBA6@qwark.sigxcpu.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12.10.2021 22:47, Guido Günther wrote:
> Hi Laurent,
> On Tue, Oct 12, 2021 at 11:17:07PM +0300, Laurent Pinchart wrote:
>> Hi Guido,
>>
>> Thank you for the patch.
>>
>> On Tue, Oct 12, 2021 at 09:58:58PM +0200, Guido Günther wrote:
>>> Otherwise logs are filled with
>>>
>>>    [drm:drm_bridge_attach] *ERROR* failed to attach bridge /soc@0/bus@30800000/mipi-dsi@30a0 0000 to encoder None-34: -517
>>>
>>> when the bridge isn't ready yet.
>>>
>>> Fixes: fb8d617f8fd6 ("drm/bridge: Centralize error message when bridge attach fails")
>>> Signed-off-by: Guido Günther <agx@sigxcpu.org>
>>> ---
>>>   drivers/gpu/drm/drm_bridge.c | 11 ++++++-----
>>>   1 file changed, 6 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
>>> index a8ed66751c2d..f0508e85ae98 100644
>>> --- a/drivers/gpu/drm/drm_bridge.c
>>> +++ b/drivers/gpu/drm/drm_bridge.c
>>> @@ -227,14 +227,15 @@ int drm_bridge_attach(struct drm_encoder *encoder, struct drm_bridge *bridge,
>>>   	bridge->encoder = NULL;
>>>   	list_del(&bridge->chain_node);
>>>   
>>> +	if (ret != -EPROBE_DEFER) {
>>>   #ifdef CONFIG_OF
>>> -	DRM_ERROR("failed to attach bridge %pOF to encoder %s: %d\n",
>>> -		  bridge->of_node, encoder->name, ret);
>>> +		DRM_ERROR("failed to attach bridge %pOF to encoder %s: %d\n",
>>> +			  bridge->of_node, encoder->name, ret);
>>>   #else
>>> -	DRM_ERROR("failed to attach bridge to encoder %s: %d\n",
>>> -		  encoder->name, ret);
>>> +		DRM_ERROR("failed to attach bridge to encoder %s: %d\n",
>>> +			  encoder->name, ret);
>>>   #endif
>>> -
>>> +	}
>>
>> This looks fine as such, but I'm concerned about the direction it's
>> taking. Ideally, probe deferral should happen at probe time, way before
>> the bridge is attached. Doing otherwise is a step in the wrong direction
>> in my opinion, and something we'll end up regretting when we'll feel the
>> pain it inflicts.
> 
> The particular case I'm seeing this is the nwl driver probe deferrals if
> the panel bridge isn't ready (which needs a bunch of components
> (dsi, panel, backlight wrapped led, ...) and it probes fine later on so I
> wonder where you see the actual error cause? That downstream of the
> bridge isn't ready or that the display controller is already attaching
> the bridge?

So it is something wrong there, nwl should not publish bridge interface 
until it gather its resources (the panel in this case).

Regards
Andrzej


> 
> Cheers,
>   -- Guido
> 
>>
>>>   	return ret;
>>>   }
>>>   EXPORT_SYMBOL(drm_bridge_attach);
>>
>> -- 
>> Regards,
>>
>> Laurent Pinchart
>>

