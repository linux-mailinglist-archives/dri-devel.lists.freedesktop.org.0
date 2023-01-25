Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C324167AE95
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 10:44:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 787B110E0DB;
	Wed, 25 Jan 2023 09:44:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1F2E10E0DB
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jan 2023 09:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674639863;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tz7iyPImvcUWB9Dn0OtZ/fnzXULpckXnCuNXHm7FVL4=;
 b=JVRoi+i7G4m9cWCbYRfo/0ASO62Wli7ClHFpO4pSXsMoLQtGHnyNGN0AgRSEsZvu/Felh5
 G9KlilfqGMhl1Jyx1sTuv1aLLCa5KkIWrUBLTIACJA02XUWrTlwkY6VLGYZj/xP7KbFYOP
 8UEtgeg8OHiaAOSzc0YI+HrCol0nY5Q=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-627-aabyz-LDPuqhLdgprjsnMQ-1; Wed, 25 Jan 2023 04:44:21 -0500
X-MC-Unique: aabyz-LDPuqhLdgprjsnMQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 v15-20020adfe4cf000000b002bf9413bc50so2249973wrm.16
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jan 2023 01:44:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tz7iyPImvcUWB9Dn0OtZ/fnzXULpckXnCuNXHm7FVL4=;
 b=qD37wYS5Fe2skdVlpGS/JTKQNEkZpmV5iFh7OpiNCMg+isV90NPykVtQiSW6tf2R3j
 ebquFTgL9cvrWt6/maoBDXVU1r+rw0akEd1XCGSgFSf7COlM0LDKB/ZrFs+haQZdlWyH
 08TnP4dedBpBjwFOtPCWfA+AjQp4AMOTT38BQ53yqO8rBZqqTfGRr02S4mIuLZbvkDaq
 tVBtxKKslweheHHQuxV0PekH56ZxhmjGewEVUkQXX7/b+29zT//i1Irg+AKulvdQHnKg
 +2i//uG8Uv/q+UjkYUsTbYE9kCwptq8dYXsmckq0zeZTTdm+DKqgzE2ZHL8RUkhdzsHY
 FfPw==
X-Gm-Message-State: AFqh2kqsSQdmBA+FEBvd2EE1jiUrJhSYqbBo97Auz8ouYa3MTachDerZ
 jUlaBaT5yqTq8kZdrD1vpr1tis4FDzx+L7RlMfaEikmGnucSjlwToU9m7Y5fx9CX/DUsDp4OQc0
 +DcSLiK1j8o7rnzSyXhR+amvaNwEP
X-Received: by 2002:a1c:4b19:0:b0:3da:fb5c:8754 with SMTP id
 y25-20020a1c4b19000000b003dafb5c8754mr28002623wma.2.1674639860819; 
 Wed, 25 Jan 2023 01:44:20 -0800 (PST)
X-Google-Smtp-Source: AMrXdXs/ZWxYog8h3iR/G4m+bOHxbXPWtvCX/ZVFIUBahKB+Crw5vqS3Y5d/LkCiQwFYvGuCaEiL4A==
X-Received: by 2002:a1c:4b19:0:b0:3da:fb5c:8754 with SMTP id
 y25-20020a1c4b19000000b003dafb5c8754mr28002601wma.2.1674639860545; 
 Wed, 25 Jan 2023 01:44:20 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 h9-20020a05600c314900b003c6f8d30e40sm1345518wmo.31.2023.01.25.01.44.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Jan 2023 01:44:20 -0800 (PST)
Message-ID: <13f04dbd-07f2-f01a-7d67-75a554374ddf@redhat.com>
Date: Wed, 25 Jan 2023 10:44:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 07/10] drm/fbdev-generic: Minimize hotplug error
 handling
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@gmail.com,
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org
References: <20230124134010.30263-1-tzimmermann@suse.de>
 <20230124134010.30263-8-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20230124134010.30263-8-tzimmermann@suse.de>
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
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/24/23 14:40, Thomas Zimmermann wrote:
> Call drm_fb_helper_init() in the generic-fbdev hotplug helper

drm_fb_helper_fini()

> to revert the effects of drm_fb_helper_init(). No full cleanup
> is required.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

