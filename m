Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1117F7528D3
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 18:38:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 021DC10E776;
	Thu, 13 Jul 2023 16:37:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AFD510E773
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 16:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689266233;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jqgy2NuZDpJuPq/q4dfniYMdoYxkOs252udDJ3IijVE=;
 b=C4RPgezhqPPJBUhF5si+uLTdD6XdVIZrDEY5F89/OgFKN449qIKSfaO+gALRVSlONiqyM/
 Rsw6j4wuI6Tuqg8zTV8mJP36x8nq/wq4h9VkfGxrMYg3yLaukiRj2EPsAMjb10FEgcg+pr
 aXOkshD7WaMqRoXdB22sIJw7PSYpYXY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-353-J_DpaYrTMBeVv7JyYj5_UQ-1; Thu, 13 Jul 2023 12:34:04 -0400
X-MC-Unique: J_DpaYrTMBeVv7JyYj5_UQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-3f5df65f9f4so4850645e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 09:34:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689266043; x=1691858043;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jqgy2NuZDpJuPq/q4dfniYMdoYxkOs252udDJ3IijVE=;
 b=TbFhL/Is8yIdh88Ye+lUfFb4thn23Y2vf+Mix4n1TBP7gGF1G35H+wK3qolG3AWdBP
 SuQt+Nb0Oak3O/5wzP4tccyu/bly5jR6TW1oROrZS1QuV1LkV4D8i0SpHKuGcd6FYoZj
 NbvOoC/JjUTO9nGn7u3e/jgelCE0b4QaQ5f0ZmqIXyvm2tTkNs4rlEKvFGrMJT18SmFL
 lp0uBfcjplaPsOjxFGrecjwu0etDZvaB+xJ120L+dPm2M0lZ34u4soU9CmHnBQBcamOq
 lBBaS/o2BcY4r7I5Im9fRba7nhhLtuKwEoQ3fowITNmtEN99utrelXYBZYyRuiHJb0Kb
 cIIQ==
X-Gm-Message-State: ABy/qLaqCELfCu90gi+ybiqsndt86Ea9qEipR6KCSoOBYlyaY6SJKYHP
 elMMCa+jk1upuae+1Gu7omk2799PlwbZgdn15I+YLwvY5tbx97RjLnzsqZLA7u0Yty5puYaKs54
 Es/Yezko2WUGV4RViLcROGgtixe7b
X-Received: by 2002:a05:600c:224d:b0:3f7:f584:579b with SMTP id
 a13-20020a05600c224d00b003f7f584579bmr1820695wmm.9.1689266043322; 
 Thu, 13 Jul 2023 09:34:03 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGB48a8/IM2uKa2p6JFLwk6Xk5qAm/U1NNQ7v8jofP8DEBAsgQXzUHUaj2EJJbJ4ewjj9iRwA==
X-Received: by 2002:a05:600c:224d:b0:3f7:f584:579b with SMTP id
 a13-20020a05600c224d00b003f7f584579bmr1820686wmm.9.1689266043065; 
 Thu, 13 Jul 2023 09:34:03 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 q21-20020a7bce95000000b003fc06169abdsm8326018wmj.2.2023.07.13.09.34.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jul 2023 09:34:02 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2 4/5] drm/ssd130x: Don't allocate buffers on each
 plane update
In-Reply-To: <CAMuHMdX3VNcP1MS_Padps2Qwy=cmAU-4=XddVj+4-1sevCuErg@mail.gmail.com>
References: <20230609170941.1150941-1-javierm@redhat.com>
 <20230609170941.1150941-5-javierm@redhat.com>
 <CAMuHMdVXhi52KfpCmnum+9t74UWP+AOLE95xQU6VV6Nz=VHk1Q@mail.gmail.com>
 <87fs5sgdfh.fsf@minerva.mail-host-address-is-not-set>
 <CAMuHMdWmJjGX+s=z0bBMDz0=zqZJHrGhkzWyRkmstS0eW9aiTg@mail.gmail.com>
 <87cz0vhpd1.fsf@minerva.mail-host-address-is-not-set>
 <CAMuHMdX3VNcP1MS_Padps2Qwy=cmAU-4=XddVj+4-1sevCuErg@mail.gmail.com>
Date: Thu, 13 Jul 2023 18:34:01 +0200
Message-ID: <87zg3zu5xi.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Geert Uytterhoeven <geert@linux-m68k.org> writes:

Hello Geert,

> Hi Javier,

[...]

>> +static const struct drm_mode_config_helper_funcs ssd130x_mode_config_helpers = {
>> +        .atomic_commit_tail = drm_atomic_helper_commit_tail_rpm,
>> +};
>> +
>>  static const uint32_t ssd130x_formats[] = {
>>         DRM_FORMAT_XRGB8888,
>>  };
>> @@ -923,6 +927,7 @@ static int ssd130x_init_modeset(struct ssd130x_device *ssd130x)
>>         drm->mode_config.max_height = max_height;
>>         drm->mode_config.preferred_depth = 24;
>>         drm->mode_config.funcs = &ssd130x_mode_config_funcs;
>> +       drm->mode_config.helper_private = &ssd130x_mode_config_helpers;
>>
>>         /* Primary plane */
>>
>
> Thanks, that works!
>

Thanks for testing! Proper patch sent:

https://lists.freedesktop.org/archives/dri-devel/2023-July/413630.html

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

