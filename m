Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE06E5570FC
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jun 2022 04:18:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 339EF10E658;
	Thu, 23 Jun 2022 02:18:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D228F10E658;
 Thu, 23 Jun 2022 02:18:39 +0000 (UTC)
Received: by mail-pj1-x1041.google.com with SMTP id
 g10-20020a17090a708a00b001ea8aadd42bso1223411pjk.0; 
 Wed, 22 Jun 2022 19:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=8ktKbr7uBGDRIVppttuunEQkJn1Tz5nrNAaC4on+v0g=;
 b=PZy1DCFm6VpQWMaVejGZNjuXi4UybX5QZT64O/psnQdBhPkjjm48qJ7dPLqMPWDBQd
 lCPHJ2ZagZYPSMb4tCRN95tBV163wrNzlIRgtF5zO0Zkxomcc9DA48gDBYr8MJm3I5k7
 vaDUsv2VR8jpun/P8LdR/apzQTZ8MU3ewo+hW8/JIMXZSw7wuT7wU1E6IvXUmiBvsCtR
 u5aAorWCcFj3lc+I8qa2GU5Orecw1CbB0oShX4mboKDgwM1Nya9yk2xxyZ8/31pHAqKi
 h/iN/GEqhK9ZxZfowmvHCuXOK1bMp1iXDQErigcbp++0H1G4vV+klEjBQOFAlIAbNM5o
 8T7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=8ktKbr7uBGDRIVppttuunEQkJn1Tz5nrNAaC4on+v0g=;
 b=s1DeFUFMHPuOKayN4gfPI8rF/0145gA0za74Mge6FWzDnvhb40otXanuaWC1gjUJwT
 12pigXp3ZO2sHDuEZyu+GIQ3ADOKDlR3O2vkrRwLEtXhJnDQqdrOtBI10aF0OtRPR9V/
 45M2pQn2MY8vyUZDoA62/AGdfqvtE/nl76wU1UOlL4uOlye1FS8ItLoxzucTNWFmBOL2
 3C1FqM7r3eTYj+WBD4bf3Ym9YV8t/Dec9YHQc0GgbiIDLuaeq6hf/qZikFD0rjdHDMI2
 BRQfuMfDJS0sO7J/c8JhhmDviW6hVIs8LhJgEA+O44uQX+ZEA5rPj2A/j8N1iyLEG35a
 XAKg==
X-Gm-Message-State: AJIora853mLipPquthK2z8TsDbW2o/UysZXepVgr+pXoLKGYoN/n6Rcs
 uO6XBcSv+di9E0MAqIrLWLY=
X-Google-Smtp-Source: AGRyM1sQThxRbXyIFTiEzJVpV6QhVBvyJ0zMT9vUlv3siu/xzAiDGYHLugyfHAmo3rWLsrZDWAfk7Q==
X-Received: by 2002:a17:902:ce85:b0:16a:4637:c4da with SMTP id
 f5-20020a170902ce8500b0016a4637c4damr7061580plg.82.1655950719413; 
 Wed, 22 Jun 2022 19:18:39 -0700 (PDT)
Received: from [192.168.50.247] ([103.84.139.165])
 by smtp.gmail.com with ESMTPSA id
 y2-20020a170902ed4200b0016a09da5541sm10859253plb.135.2022.06.22.19.18.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Jun 2022 19:18:38 -0700 (PDT)
Message-ID: <2c51aa6e-1947-a4b2-c9af-f8c12b6a1985@gmail.com>
Date: Thu, 23 Jun 2022 10:18:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] drm: i915: fix a possible refcount leak in
 intel_dp_add_mst_connector()
Content-Language: en-US
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, tvrtko.ursulin@linux.intel.com, airlied@linux.ie,
 daniel@ffwll.ch, ville.syrjala@linux.intel.com, jose.souza@intel.com,
 Bhawanpreet.Lakha@amd.com, matthew.d.roper@intel.com, heying24@huawei.com,
 anshuman.gupta@intel.com, james.ausmus@intel.com
References: <20220516071922.22955-1-hbh25y@gmail.com>
From: Hangyu Hua <hbh25y@gmail.com>
In-Reply-To: <20220516071922.22955-1-hbh25y@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022/5/16 15:19, Hangyu Hua wrote:
> If drm_connector_init fails, intel_connector_free will be called to take
> care of proper free. So it is necessary to drop the refcount of port
> before intel_connector_free.
> 
> Fixes: 091a4f91942a ("drm/i915: Handle drm-layer errors in intel_dp_add_mst_connector")
> Signed-off-by: Hangyu Hua <hbh25y@gmail.com>
> ---
>   drivers/gpu/drm/i915/display/intel_dp_mst.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> index e30e698aa684..f7d46ea3afb9 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> @@ -841,6 +841,7 @@ static struct drm_connector *intel_dp_add_mst_connector(struct drm_dp_mst_topolo
>   	ret = drm_connector_init(dev, connector, &intel_dp_mst_connector_funcs,
>   				 DRM_MODE_CONNECTOR_DisplayPort);
>   	if (ret) {
> +		drm_dp_mst_put_port_malloc(port);
>   		intel_connector_free(intel_connector);
>   		return NULL;
>   	}

Gentel ping.
