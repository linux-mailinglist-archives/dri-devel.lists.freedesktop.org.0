Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6282474817A
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jul 2023 11:53:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1E4E10E349;
	Wed,  5 Jul 2023 09:53:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E944210E349
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jul 2023 09:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1688550802;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DRNRYYR3em1ug3SJuQFxKqDHhttEDU94J84H5e4z6eY=;
 b=DbCMNgBqUuPGYVWaNkP6yTrkxq4OBOT135lr3urH0bzLn6dip8ttFY+dt0pdnVVffH+DYI
 rRzFQfxhythU+d0vIrRKGnuRpyyXSXPJJFJsAAg0SOCfZgc6aG42liaq27/2xl83E+f510
 ViU7HFeS5SaDvUkhD03m6THTG4L4Dd8=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-28-IM8it2LaO5K0s1OlPRg2jA-1; Wed, 05 Jul 2023 05:53:19 -0400
X-MC-Unique: IM8it2LaO5K0s1OlPRg2jA-1
Received: by mail-lf1-f69.google.com with SMTP id
 2adb3069b0e04-4fb9c4b7020so5547327e87.0
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Jul 2023 02:53:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688550798; x=1691142798;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DRNRYYR3em1ug3SJuQFxKqDHhttEDU94J84H5e4z6eY=;
 b=VTp+RI/jGjfIY9CFfH19hhaHPAaXbjVmXtrdfqCosKJlJwbY1AYd0EhWlqu3nPpruD
 gVB2IdjTNIUjhurRdRDb1BDSVfEVrY2s1TE4tMZQ4O7ExG3MhZu9v14dpq/EYZpIEq7a
 VT9D3t43KwdgsImsHG1sgBkV5Hb9iCH1INIqHQ2F0kG6MIb57MQwRg7B84305PjBN6Yr
 Z4rxzjJc6Fz10zWYGh0CSRIehsycH9Zzy+wrmQ4B0ypFN6Dc1fJDC4tSiNnNfsNUihX1
 7aGsbyFUlMtKJ9McbUj05bKZF+W8A+a7mWDZdMTYPAX5eDvEI/9kHlvuR3ZeE8hm3cN8
 2xFQ==
X-Gm-Message-State: ABy/qLYaXsnxhobD3J0ys9A4QsaPfQ1OPbgzhpIJ+k6fQnpDL3BLYpSE
 t75UWWsW+BKF+WqaQNP5UXx2YsxG3eEQ/Ln14GfWTQu6uE9UZu1+f2qekmNhmJS8TzdRS6kdYgt
 ycVSxC0ajIwg+tu9DTPUvbF8bRYgf
X-Received: by 2002:a05:6512:68c:b0:4fb:897e:21cc with SMTP id
 t12-20020a056512068c00b004fb897e21ccmr16115764lfe.67.1688550798482; 
 Wed, 05 Jul 2023 02:53:18 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGfRPzFk83Dq4TRvBUdnBTYWW72Dkqa6fZSxS4fGVLTYvFLeND2XwmxN1ZysjO2uVZDU0mefw==
X-Received: by 2002:a05:6512:68c:b0:4fb:897e:21cc with SMTP id
 t12-20020a056512068c00b004fb897e21ccmr16115751lfe.67.1688550798187; 
 Wed, 05 Jul 2023 02:53:18 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 z9-20020a05600c220900b003fbdf8292a7sm1606487wml.46.2023.07.05.02.53.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jul 2023 02:53:17 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org
Subject: Re: [PATCH 06/10] drm/exynos: Set fbdev flags
In-Reply-To: <a69f00d6-d6f9-377a-a4a6-fc6cc4bd6b7f@suse.de>
References: <20230704160133.20261-1-tzimmermann@suse.de>
 <20230704160133.20261-7-tzimmermann@suse.de>
 <87r0pmrbdn.fsf@minerva.mail-host-address-is-not-set>
 <a69f00d6-d6f9-377a-a4a6-fc6cc4bd6b7f@suse.de>
Date: Wed, 05 Jul 2023 11:53:17 +0200
Message-ID: <877crer8fm.fsf@minerva.mail-host-address-is-not-set>
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
Cc: linux-fbdev@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 dri-devel@lists.freedesktop.org, Kyungmin Park <kyungmin.park@samsung.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Hi
>
> Am 05.07.23 um 10:49 schrieb Javier Martinez Canillas:

[...]

>> 
>> The #define FBINFO_FLAG_DEFAULT	FBINFO_DEFAULT seems to be there since the
>> original v2.6.12-rc2 git import in commit 1da177e4c3f4, so is hard to know
>> why was introduced. FBINFO_DEFAULT is more used, I will just stick to that:
>
> Thanks for commenting on this issue. I didn't notice that.
>
> I think I'll just remove these _DEFAULT assignments from the patchset.
>
> And I think we should nuke them entirely everywhere. The _DEFAULT values 
> are just 0 after commit 376b3ff54c9a1. So there's no value in assigning 
> them at all.
>

Agreed.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

