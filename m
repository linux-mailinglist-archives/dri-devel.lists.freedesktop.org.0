Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6631D69AA3B
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 12:23:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52E8B10EF6D;
	Fri, 17 Feb 2023 11:23:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0112F10EF6D
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 11:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676633024;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=seb+UnT6fXFwECQkziBuKI673IsXhXzJa3B+Rdcr3n8=;
 b=H0Xyw+H7jX5oTdCRwaebUhOSHlF9nfYcJWR7AoEEhCvImkocHzcemyUbZ1kam2ZrbRLkpF
 gXl6i0uWhecX7klVFtEJhJS1TyXmlPHci7vfxWpTZFZDm0MSZetusPGvLoiwV9UmDyxKKz
 CqzWFPgd/YDwSi43XoUNI0BAbqFz2y0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-190-pPquP8v8OAOZArzETREnKA-1; Fri, 17 Feb 2023 06:23:41 -0500
X-MC-Unique: pPquP8v8OAOZArzETREnKA-1
Received: by mail-wm1-f72.google.com with SMTP id
 p30-20020a05600c1d9e00b003dffc7343c3so489568wms.0
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 03:23:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=seb+UnT6fXFwECQkziBuKI673IsXhXzJa3B+Rdcr3n8=;
 b=eHFDpcexdbNn9SmYi1Vqg/F6pLCdCn6CQi8STXXRsXNpDuUSDokyaOvDNAr58qwqm5
 zJbdfsvqxP9hQme/TLxW6BM1KQrIg2l4S0Dj8UE6ObuxcgUUWsFQOktkwJtCn88dZXMQ
 X1kb7azrXBbpznRoLurLs3TjWo0qCLn/9/iRg+QjjmkOXY6hEA30/qHdWTmzLkCIq+Sy
 LrMW/f31S2I+sBG77Fit0IuX5+WMN7us9PD5YdSsaTxuAjQQ1LzsyqxPvlZWdMrZYx+5
 WcqsyqJgWjmRLQaICFmZhvnUPrnjpRMbJHLLNbOXbajSx6pgm/RxxbrRnq56oOCaFwJ5
 S/EQ==
X-Gm-Message-State: AO0yUKURKlUO8EFuyySm6Jue+N1wiYgSU18BgOK6r7zZI6l+OzzbqG2n
 fTeTNtAl32v9Vt+fAwtsbwKxG1oIXWmVz6rcIcB4lM2TBuLMTrt/3XG1zgFq5vwo9/hUjoqEmlQ
 OwHCQUkdC31KMCsF1S29OTXoURWwB
X-Received: by 2002:a5d:49c4:0:b0:2c5:5f95:7746 with SMTP id
 t4-20020a5d49c4000000b002c55f957746mr7312230wrs.56.1676633019926; 
 Fri, 17 Feb 2023 03:23:39 -0800 (PST)
X-Google-Smtp-Source: AK7set9EFBEl4WDoRU8Iwut2hV1mfRRFMcd1jJye0+8k8u1HqbEZwr9yUu/4Qf4uxNyoSAl+SsFhNg==
X-Received: by 2002:a5d:49c4:0:b0:2c5:5f95:7746 with SMTP id
 t4-20020a5d49c4000000b002c55f957746mr7312210wrs.56.1676633019651; 
 Fri, 17 Feb 2023 03:23:39 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 n18-20020a5d6612000000b002c551f7d452sm3893041wru.98.2023.02.17.03.23.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Feb 2023 03:23:39 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, deller@gmx.de, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, geoff@infradead.org, mpe@ellerman.id.au,
 npiggin@gmail.com, christophe.leroy@csgroup.eu
Subject: Re: [PATCH 02/11] fbdev: Transfer video= option strings to caller;
 clarify ownership
In-Reply-To: <2c589464-bc37-4138-d9a6-b38cd05e5f99@suse.de>
References: <20230209135509.7786-1-tzimmermann@suse.de>
 <20230209135509.7786-3-tzimmermann@suse.de>
 <87a61cy9et.fsf@minerva.mail-host-address-is-not-set>
 <2c589464-bc37-4138-d9a6-b38cd05e5f99@suse.de>
Date: Fri, 17 Feb 2023 12:23:37 +0100
Message-ID: <87y1ow4jt2.fsf@minerva.mail-host-address-is-not-set>
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
Cc: linux-fbdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Hi
>
> Am 17.02.23 um 09:37 schrieb Javier Martinez Canillas:
>> Thomas Zimmermann <tzimmermann@suse.de> writes:
>> 
>>> In fb_get_options(), always duplicate the returned option string and
>>> transfer ownership of the memory to the function's caller.
>>>
>>> Until now, only the global option string got duplicated and transferred
>>> to the caller; the per-driver options were owned by fb_get_options().
>>> In the end, it was impossible for the function's caller to detect if
>>> it had to release the string's memory buffer. Hence, all calling drivers
>>> leak the memory buffer. The leaks have existed ever since, but drivers
>>> only call fb_get_option() once as part of module initialization. So the
>>> amount of leaked memory is not significant.
>>>
>>> Fix the semantics of fb_get_option() by unconditionally transferring
>>> ownership of the memory buffer to the caller. Later patches can resolve
>>> the memory leaks in the fbdev drivers.
>>>
>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>> ---
>> 
>> [...]
>> 
>>> +	if (option) {
>>> +		if (options)
>>> +			*option = kstrdup(options, GFP_KERNEL);
>>> +		else
>>> +			*option = NULL;
>>> +	}
>>>
>> 
>> I know the old code wasn't checking if kstrdup() succeeded, but you should
>
> Kstrdup uses kmalloc, which already warns about failed allocations. I 
> think it's discouraged to warn again. (Wasn't there a warning in sparse 
> or checkpatch?)  So I'd rather leave it as is.
>

I didn't mean to warn but to return an error code.

>> do it here and let the caller know. And same if (!options). So I guess the
>> following check can be added (to be consistent with the rest of the code):
>> 
>> 	if (!*option)
>> 		retval = 1;
>
> Why is that needed for consistency?
>
> Retval is the state of the output: enabled or not. If there are no 
> options, retval should be 0(=enabled). 1(=disabled) is only set by 
> video=off or that ofonly thing.
>

Ah, I see. I misundertood what retval was about. Forget this comment then.

Maybe while you are there could have another patch to document the return
value in the fb_get_options() kernel-doc?

And this patch looks good to me too after your explanations.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

Best regards,
Javier

