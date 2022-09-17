Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB845BBA72
	for <lists+dri-devel@lfdr.de>; Sat, 17 Sep 2022 22:47:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9428010E13C;
	Sat, 17 Sep 2022 20:47:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DE1510E13C
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Sep 2022 20:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663447665;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K0k8c/0j8UePRbHaSXXHrN+L/OKdJoUuIZo6ECt9FPs=;
 b=PwHgDKYzjnlLzAqcEy4rn0f8DgAFJwnhZlBzAzqPCEmJAzSC+4RVS9LejxdxcB/BiNl2RW
 Vv0DXWZbeOxu/2TIgjgdOXlZe0F/XmEQg62tat6qPtyO7rsEdaN8VYYv9YefuhTZ+hnVNk
 7ltgvyiwLHzcIBs/GE3TDN/SzvLBRYk=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-675-ovqUx0nyMEORLTEncHIbSw-1; Sat, 17 Sep 2022 16:47:44 -0400
X-MC-Unique: ovqUx0nyMEORLTEncHIbSw-1
Received: by mail-ed1-f70.google.com with SMTP id
 h13-20020a056402280d00b004528c8400afso9164728ede.6
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Sep 2022 13:47:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=K0k8c/0j8UePRbHaSXXHrN+L/OKdJoUuIZo6ECt9FPs=;
 b=h63W+jInTdOg3PbJHPQ+eGGPnzfUU0fjk1qT7TaawNuF7/wo/pDf58gyD17YByEdVd
 aQAVaHr2oofop24YATxAIe+WgtU007QHEuDyKyfKqawj4UfJkOIGUgR1BxridS8VTEhk
 rts5qnOdDlEavhGMD8uPsNHyvbDDt2yp49W97ykzjLQP+Ii/CPvoir7YMtMG81uFHbuL
 BtKzXrfwhwXMWv8Rz2sgiXpY9Erh+t+7uZlZCLz/lZxcpBXvRNZFpwyvOyEgjdfRiprM
 zaigqLKKD4AP8cE4MfqKfMni94wqn2rEIyTvUWbrLnOulWv8elNTYJ0sjvq/MDMITq/u
 d/mA==
X-Gm-Message-State: ACrzQf0APArgcPWnlfprd5kH5C0eIiG6N1xrvJMxe8jzJHMugTaPeb0Y
 BE8S2/rKoFMoGi2G8uWxfEKbRwIcWk8qLD3Dmx/C9cchM5wESSviCAwNvNR8Z4Z46WLT2wEXJ4B
 acV4PGs7aZfSUSy3Mu25YLoX08sBM
X-Received: by 2002:a17:907:9605:b0:6f5:c66:7c13 with SMTP id
 gb5-20020a170907960500b006f50c667c13mr8145585ejc.66.1663447663369; 
 Sat, 17 Sep 2022 13:47:43 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4sge60MpF0lBNz6i4lA+RgdYAr0rvx5olZz7TOFqrX1jaauQH5cneT2QKu6aehUWGf5uGAdg==
X-Received: by 2002:a17:907:9605:b0:6f5:c66:7c13 with SMTP id
 gb5-20020a170907960500b006f50c667c13mr8145576ejc.66.1663447663175; 
 Sat, 17 Sep 2022 13:47:43 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81?
 (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
 by smtp.gmail.com with ESMTPSA id
 z15-20020a170906434f00b007413360a48fsm1505884ejm.50.2022.09.17.13.47.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 17 Sep 2022 13:47:42 -0700 (PDT)
Message-ID: <2a974ade-500b-a22f-489f-2c0cadb5ae02@redhat.com>
Date: Sat, 17 Sep 2022 22:47:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v2 1/5] drm/gma500: Refactor backlight support
To: kernel test robot <lkp@intel.com>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>
References: <20220917140352.526507-2-hdegoede@redhat.com>
 <202209180122.NFgTVRJb-lkp@intel.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <202209180122.NFgTVRJb-lkp@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: kbuild-all@lists.01.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 9/17/22 19:35, kernel test robot wrote:
> Hi Hans,
> 
> I love your patch! Perhaps something to improve:
> 
> [auto build test WARNING on drm-misc/drm-misc-next]
> [cannot apply to linus/master v6.0-rc5 next-20220916]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Hans-de-Goede/drm-gma500-Backlight-handling-changes/20220917-220535
> base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
> config: x86_64-allmodconfig
> compiler: gcc-11 (Debian 11.3.0-5) 11.3.0
> reproduce (this is a W=1 build):
>         # https://github.com/intel-lab-lkp/linux/commit/ff9adbc897036a56bb7c57aa407a489db1985400
>         git remote add linux-review https://github.com/intel-lab-lkp/linux
>         git fetch --no-tags linux-review Hans-de-Goede/drm-gma500-Backlight-handling-changes/20220917-220535
>         git checkout ff9adbc897036a56bb7c57aa407a489db1985400
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/gpu/drm/gma500/
> 
> If you fix the issue, kindly add following tag where applicable
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All warnings (new ones prefixed by >>):
> 
>    drivers/gpu/drm/gma500/backlight.c: In function 'gma_backlight_init':
>>> drivers/gpu/drm/gma500/backlight.c:73:37: warning: unused variable 'props' [-Wunused-variable]
>       73 |         struct backlight_properties props = {};
>          |                                     ^~~~~
>    At top level:
>>> drivers/gpu/drm/gma500/backlight.c:65:35: warning: 'gma_backlight_ops' defined but not used [-Wunused-const-variable=]
>       65 | static const struct backlight_ops gma_backlight_ops = {
>          |                                   ^~~~~~~~~~~~~~~~~
> 

This is caused by these not being used when the kernel's config does
not have CONFIG_BACKLIGHT enabled. I will send out a v3 series / v2
of this patch adding __maybe_unused to these 2 variables to fix this.

Regards,

Hans


> 
> vim +/props +73 drivers/gpu/drm/gma500/backlight.c
> 
>     64	
>   > 65	static const struct backlight_ops gma_backlight_ops = {
>     66		.get_brightness = gma_backlight_get_brightness,
>     67		.update_status  = gma_backlight_update_status,
>     68	};
>     69	
>     70	int gma_backlight_init(struct drm_device *dev)
>     71	{
>     72		struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
>   > 73		struct backlight_properties props = {};
>     74		int ret;
>     75	
>     76		dev_priv->backlight_enabled = true;
>     77		dev_priv->backlight_level = 100;
>     78	
>     79		ret = dev_priv->ops->backlight_init(dev);
>     80		if (ret)
>     81			return ret;
>     82	
> 

