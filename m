Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8881A519BB3
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 11:29:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AE62112017;
	Wed,  4 May 2022 09:29:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CE85112017
 for <dri-devel@lists.freedesktop.org>; Wed,  4 May 2022 09:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651656570;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QiHfuXpjUO1Kx7oSpMgn+KkNUM21let3MfJCKQvBKl4=;
 b=ISMcOqYIfbrDQnenNI+3N1j6MP2Fdjw1T2o9WruXNT3QOGIh6GmahHML0Zg/0CWzaA0h1m
 ZBNU7Z52yUiZ5sqfFeC7nAzcWaiEFaKtNL5SVnWDJzHDGVUsFsoxo8HCnO9vgoxYEmtimg
 ebZk3DZS0N862XnmBo5T2e/X+RfFcGM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-342-r2bw1cLBPZCKfwUNDu1JvA-1; Wed, 04 May 2022 05:28:21 -0400
X-MC-Unique: r2bw1cLBPZCKfwUNDu1JvA-1
Received: by mail-wm1-f71.google.com with SMTP id
 n186-20020a1c27c3000000b00392ae974ca1so1456163wmn.0
 for <dri-devel@lists.freedesktop.org>; Wed, 04 May 2022 02:28:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=QiHfuXpjUO1Kx7oSpMgn+KkNUM21let3MfJCKQvBKl4=;
 b=gKTo+a8rN/a/PwWWvwGNG1Wl0dzehMc2qdRJFmcaJUtlXkjm1Jk9IOTKoL/y1tzLhG
 BJgiql8S04Yea9CnPAyFzWenE4O0YxxlMM5sGjTUAmbJGf4ikpYSrLWkTVz7x8suEcd/
 gYWOwxy3E2FZc/CFYrpL5FEJlDrz/D7P2ixslwjHMysp+64TvYy/AHOp4g+2db6S6r4H
 kqvc2pDXS7qVJ8RKfqcgPnhnFJZ+QY8nZhWI5Xa0p03u2mDuYi/1dfPVO2tXQM44exkW
 +NtgC/AchjlW5dEGqCMz9txwD5nRJZyC3XTA+KvVC9P+9l5zUDygaxEFw2+lgCPXKM3j
 tsSg==
X-Gm-Message-State: AOAM532H4SDl3hyy7oyJHzRubOIF2pJYzUFqB2t5s5FcbBjhSm+LxIES
 ftUDTxs/bW1FMsafHhStOwfKjrYfr855ZRGcoCdRxLVpoVEH8ghl+XYyoc+m6rkfQ3eGrR8m0Zt
 bKI8K1uCOOhuyPZp/wlfFsK8s/tqk
X-Received: by 2002:a05:600c:3b85:b0:393:edbb:ab9d with SMTP id
 n5-20020a05600c3b8500b00393edbbab9dmr6913217wms.126.1651656489508; 
 Wed, 04 May 2022 02:28:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwO3DLL2UeA2DZ+PW0v7ebQsybxG7YXPPfUWTKRUpRPBprerOB67LepYluV2171Xt8UBvnI7Q==
X-Received: by 2002:a05:600c:3b85:b0:393:edbb:ab9d with SMTP id
 n5-20020a05600c3b8500b00393edbbab9dmr6913196wms.126.1651656489202; 
 Wed, 04 May 2022 02:28:09 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 j30-20020adfb31e000000b0020c5253d8c2sm10915423wrd.14.2022.05.04.02.28.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 May 2022 02:28:08 -0700 (PDT)
Message-ID: <038f8365-b23b-9d81-f7b2-8f8c6eb3a065@redhat.com>
Date: Wed, 4 May 2022 11:28:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2] fbdev: Use helper to get fb_info in all file operations
To: linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Junxiao Chang <junxiao.chang@intel.com>, dri-devel@lists.freedesktop.org,
 Maxime Ripard <maxime@cerno.tech>, Thomas Zimmermann <tzimmermann@suse.de>,
 Sam Ravnborg <sam@ravnborg.org>
References: <20220503201934.681276-1-javierm@redhat.com>
 <YnJBGpvlViLV+0/a@phenom.ffwll.local>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <YnJBGpvlViLV+0/a@phenom.ffwll.local>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Daniel,

On 5/4/22 11:02, Daniel Vetter wrote:
> On Tue, May 03, 2022 at 10:19:34PM +0200, Javier Martinez Canillas wrote:
>> A reference to the framebuffer device struct fb_info is stored in the file
>> private data, but this reference could no longer be valid and must not be
>> accessed directly. Instead, the file_fb_info() accessor function must be
>> used since it does sanity checking to make sure that the fb_info is valid.
>>
>> This can happen for example if the registered framebuffer device is for a
>> driver that just uses a framebuffer provided by the system firmware. In
>> that case, the fbdev core would unregister the framebuffer device when a
>> real video driver is probed and ask to remove conflicting framebuffers.
>>
>> Most fbdev file operations already use the helper to get the fb_info but
>> get_fb_unmapped_area() and fb_deferred_io_fsync() don't. Fix those two.
>>
>> Since fb_deferred_io_fsync() is not in fbmem.o, the helper has to be
>> exported. Rename it and add a fb_ prefix to denote that is public now.
>>
>> Reported-by: Junxiao Chang <junxiao.chang@intel.com>
>> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> 
> Note that fb_file_info is hilariously racy since there's nothing
> preventing a concurrenct framebuffer_unregister. Or at least I'm not
> seeing anything. See cf4a3ae4ef33 ("fbdev: lock_fb_info cannot fail") for
> context, maybe reference that commit here in your patch.
>
> Either way this doesn't really make anything worse, so
> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>

Yes, I noticed is racy but at least checking this makes less likely to
occur. And thanks, I'll reference that commit in the description of v3.

BTW, I also noticed that the same race that happens with open(),read(),
close(), etc happens with the VM operations:

int fb_deferred_io_mmap(struct fb_info *info, struct vm_area_struct *vma)
{
...
	vma->vm_private_data = info;
...
}

static vm_fault_t fb_deferred_io_fault(struct vm_fault *vmf)
{
...
	struct fb_info *info = vmf->vma->vm_private_data;
...
}

static vm_fault_t fb_deferred_io_mkwrite(struct vm_fault *vmf)
{
...
	struct fb_info *info = vmf->vma->vm_private_data;
...
}

So something similar to fb_file_fb_info() is needed to check if
the vm_private_data is still valid. I guess that could be done
by using the vmf->vma->vm_file and attempting the same trick that
fb_file_fb_info() does ?

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

