Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC09D51A76E
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 19:02:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 271E910E74C;
	Wed,  4 May 2022 17:02:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB99010E74C
 for <dri-devel@lists.freedesktop.org>; Wed,  4 May 2022 17:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651683730;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=su2fcE/ZTpO/A41EAyixuSURd7XYYslQVS9rF55do8s=;
 b=JyxAb6gMDuWww3cHyfkyShfmERIO+WEiu0KesV8vhJKh7tNepqfFgor10CdntSF0rKVumm
 RaMbIw0RjjmfeYlLZCnQKsY1Iw6gSHAJGgAqiGZf/5nIYRJExNHGmTnZRtLF0EYnPm9FW/
 rFHipIMkTkScjlt/vXq5/hVx/sbzXJM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-288-wL-HZ1Y1NV-pS7vwZqSk5Q-1; Wed, 04 May 2022 13:02:09 -0400
X-MC-Unique: wL-HZ1Y1NV-pS7vwZqSk5Q-1
Received: by mail-wm1-f70.google.com with SMTP id
 j5-20020a05600c1c0500b0039419a269a1so910644wms.3
 for <dri-devel@lists.freedesktop.org>; Wed, 04 May 2022 10:02:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=su2fcE/ZTpO/A41EAyixuSURd7XYYslQVS9rF55do8s=;
 b=cXrH0ld3JBKKO/ghSUfLEBWCuajcNCGgwM8aMk+vqM/sntxvU5PjArmhvAtvTbztsk
 VC8yhTH56B8QgER5WRVQTKL+qWN6B52gWhRtmuM6SI2sk/9HYdHfB88+3FAy2H9vI0oC
 zkNIJZuBzOsRR3R2O4JL9XT4Xo//bbZkNWaGVq37u2lBjp7bHh3NX7+BrJSPloxbpMD0
 /NnKBIn4q4MjHsV4OPYmFV5mnwUF4qLIcF+Ei9yxUUvQmh6g+rquxw1Q0cEbC065tCAQ
 Jsp7zXWpuVsMuYdRfnNZPLcj8eLII1U1TXH29+Ca5h8P8gz4/0O2WulBg72lfkmkV9df
 hVag==
X-Gm-Message-State: AOAM530DGf8i/zsFhA3sHUPLx6pZoUERi3gNmZbKqlg3VdYEsaS/RRcu
 qMUoLUsWJYKGr7aYfewtLaabArmw+p3pXbNz8PEioObo5A7++edz+XZ/JzzMZJb/sK0SxprEjyL
 7smZXbGIe8PCxx97vgJ90q42CMymr
X-Received: by 2002:a05:6000:1c02:b0:20c:7d20:cad6 with SMTP id
 ba2-20020a0560001c0200b0020c7d20cad6mr4049791wrb.373.1651683728521; 
 Wed, 04 May 2022 10:02:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzf1id7XWx3NZcKVfmk3aRE3FalMReMMEUbJDaOtcBm4Gbck3VS/Amr1NlXOkEwj/GbfgB1RA==
X-Received: by 2002:a05:6000:1c02:b0:20c:7d20:cad6 with SMTP id
 ba2-20020a0560001c0200b0020c7d20cad6mr4049781wrb.373.1651683728291; 
 Wed, 04 May 2022 10:02:08 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 l6-20020a05600c1d0600b003942a244f34sm3008867wms.13.2022.05.04.10.02.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 May 2022 10:02:07 -0700 (PDT)
Message-ID: <fd36a5ec-e795-8b60-3a02-b865ef897da2@redhat.com>
Date: Wed, 4 May 2022 19:02:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 1/2] Revert "drm/amdgpu: disable runpm if we are the
 primary adapter"
To: Alex Deucher <alexdeucher@gmail.com>
References: <20220504134833.1672728-1-alexander.deucher@amd.com>
 <f48a0482-7be9-29d5-b179-e572dfac11fa@redhat.com>
 <CADnq5_Mp7EnBUgXaT=-5ndWMW9svpsDbTypj+DdehOXsEAw_4w@mail.gmail.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <CADnq5_Mp7EnBUgXaT=-5ndWMW9svpsDbTypj+DdehOXsEAw_4w@mail.gmail.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 "open list:EFIFB FRAMEBUFFER DRIVER" <linux-fbdev@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/4/22 18:50, Alex Deucher wrote:
> On Wed, May 4, 2022 at 12:46 PM Javier Martinez Canillas
> <javierm@redhat.com> wrote:
>>
>> Hello Alex,
>>
>> On 5/4/22 15:48, Alex Deucher wrote:
>>> This reverts commit b95dc06af3e683d6b7ddbbae178b2b2a21ee8b2b.
>>>
>>> This workaround is no longer necessary.  We have a better workaround
>>> in commit f95af4a9236695 ("drm/amdgpu: don't runtime suspend if there are displays attached (v3)").
>>>
>>
>> I would write this line instead as:
>>
>> in commit f95af4a9236695 ("drm/amdgpu: don't runtime suspend if there are
>> displays attached (v3)").
> 
> When you do it that way checkpatch and some maintainers complain about
> splitting up a commit line across multiple lines.
>

It does indeed, how silly. Scratch my comment then.

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

