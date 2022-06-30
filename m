Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 63AE656142B
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jun 2022 10:07:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25528112FB7;
	Thu, 30 Jun 2022 08:07:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C86A112FC3
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 08:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656576439;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TiXa+gCeWNyXkf/FMJ+YbOqqxdxMOxrx3XoPm+dfiIM=;
 b=DdjWS38EUaaQnoe4snAu2lgx6LlaUwr6y7yFjkW18TWv/H2qhGe32OtpvTUhr63inBNVlf
 keQp6/dlvMH/VWQcRdq0LYobOumobC+sCmyAmEWWSN5tSWJbZcaRdrynYmaFyaT0SaOe1W
 bun4FwDzF5xA8uO5wj30j0sNKw3nd0s=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-591-vDXVVzC8OAubx-Umbm75ww-1; Thu, 30 Jun 2022 04:07:15 -0400
X-MC-Unique: vDXVVzC8OAubx-Umbm75ww-1
Received: by mail-wm1-f70.google.com with SMTP id
 j35-20020a05600c1c2300b003a167dfa0ecso1119237wms.5
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 01:07:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=TiXa+gCeWNyXkf/FMJ+YbOqqxdxMOxrx3XoPm+dfiIM=;
 b=L5S0QQP909f8eTnj7+iklkQE5+YwV9Zg+mNh6NDYfcoIKw44plSeOfxj7hvTKyMrTp
 IzGAhWyBZCGQtD3c8MFtQDsTpdL7zbR1qnSzml+aDV1t6Fwg7Ev+7guHi3DErJoo4hj6
 6jIYBo6z1Gml76L2I84Bo7irfvK24cRp1UqTVe7xXn9t+djVVWXuVFTHKw3H7r2MCe7W
 4Vx4ocKGN4iPkghWYaU6qBQYZiALScEOFuumoZGehT6aTblIfJbdz6wAk3IcRY1E5eHg
 YrGeA0Dp1Xrqu4OK7eqGpcRMbxCAnvfvTKNvtE6QLkIMyYn4SzVmom5Q/5ICkrgmUKEW
 LCAw==
X-Gm-Message-State: AJIora8dtEyzGH0up+DDrnKb42AOZZdCtyI9hmkjP+FkHvLtuW140/k6
 utjlTQxURYSVnTG83roZ35duLcuNBYTv6GWYYdZWh5F6Lejta691FDdVqYnftpH6xeK0r/H8IKc
 UQgXNfkAK9V8iI16x2OkVP9/GWHmI
X-Received: by 2002:a05:6000:2a4:b0:21d:1896:763e with SMTP id
 l4-20020a05600002a400b0021d1896763emr7102524wry.248.1656576434173; 
 Thu, 30 Jun 2022 01:07:14 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1s9kFCec/e1AvHP0tv/O4dbDh682YD+7Q6paaaCWze+vFyHUcm+XZhsAnnBx7Nt1qd1EPkjQQ==
X-Received: by 2002:a05:6000:2a4:b0:21d:1896:763e with SMTP id
 l4-20020a05600002a400b0021d1896763emr7102499wry.248.1656576433877; 
 Thu, 30 Jun 2022 01:07:13 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 k5-20020a05600c1c8500b003a0fb88a197sm5500095wms.16.2022.06.30.01.07.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jun 2022 01:07:13 -0700 (PDT)
Message-ID: <6de4f449-bd4a-48ec-974b-8ace58947b70@redhat.com>
Date: Thu, 30 Jun 2022 10:07:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 00/28] OpenChrome DRM for Linux 5.20
To: Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>
References: <20220624202633.3978-1-kevinbrace@gmx.com>
 <dacc0636-d307-3f2f-260d-09208a0dd9c1@suse.de>
 <Yroh0fe4Fzqgam3W@ravnborg.org>
 <58475858-cc98-0aab-d248-f3473b179fab@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <58475858-cc98-0aab-d248-f3473b179fab@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
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
Cc: Kevin Brace <kevinbrace@bracecomputerlab.com>,
 dri-devel@lists.freedesktop.org, Kevin Brace <kevinbrace@gmx.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

On 6/28/22 14:21, Thomas Zimmermann wrote:
> Hi
> 
> Am 27.06.22 um 23:32 schrieb Sam Ravnborg:
>> Hi Kevin/Thomas,
>>
>>>
>>> I had a brief look over the patches. Even though the code looks fairly rough
>>> in places, I think we should get this driver merged ASAP.
>>
>> Agreed, we have a had a few cases where we dragged out committing much
>> too long time.
>>
>> Timing wise, it would be good if we can already hit drm-misc-next right
>> _after_ the pull -so we have a full cycle to fix anything before it hits
>> mainline.
>>
>>> For the old via driver, I think we need a better apprach. IMHO it would be
>>> preferable to put the new driver into via/ but keep the old driver there as
>>> well.  A build option would control which is being used.
>>
>> I assume the user base for via drivers are very small and they have the
>> fbdev driver already.
>> So I support replacing the current via drm driver as Kevin tries to do.
> 
> I don't know if there are still users of the old userspace, but if so I 
> would consider this removal a regression. I think the old code supports 
> 3d and video decoding. Depending on the feature set, 3d support might 
> not be useful any longer, but video decoding probably is.  (I might be 
> wrong about all this.) IMHO we should not simply remove this at least 
> until we can verify that it's no longer useful to anyone.
>

I strongly agree with Thomas on this.
 
> However, legacy support is trivial. Kevin, please see the attached files 
> for two cleanup patches. You're welcome to add them to the start of your 
> patchset to get the legacy code out of the way.
>

I'm not sure about this approach, I think that having completely separated
drivers would be better to maintain in the long run since it's likely that
the legacy VIA driver will only get bug fixes (if any) and could be removed
once the new modsetting driver has feature parity, the legacy can be dropped.
 
Maybe an alternative could be to add a drivers/gpu/drm/legacy directory and
move all the legacy DRM drivers there ? And the Kconfig symbol could be i.e:
CONFIG_DRM_LEGACY_VIA and same for the others legacy DRM drivers.

And the directory could only be sourced from Kconfig when CONFIG_DRM_LEGACY
is enabled and make it default to n. If in a few of releases nobody complains
then the whole directory could be removed.

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

