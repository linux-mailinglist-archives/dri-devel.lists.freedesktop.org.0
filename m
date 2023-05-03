Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1EDE6F5117
	for <lists+dri-devel@lfdr.de>; Wed,  3 May 2023 09:19:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E900F10E1B5;
	Wed,  3 May 2023 07:19:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4DC210E1B5
 for <dri-devel@lists.freedesktop.org>; Wed,  3 May 2023 07:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683098365;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JWuwBsoA7E+ixFPnuQyU62/zGQyUSXimh/xtxQzzOds=;
 b=SUU7ihEkpyyqjh3czHo/6KRgq/Bc3/f/6cs9aniaK3KN2+f1KywA21rXVcyp8iV9tnzOWM
 4gsXn9KVFVHQJLHQQ67X86CT5AHi3BwQfbfXFXqpkja3Ocb0EnXaANw8mWHqnmT5kOvA86
 my+ZBn2Ngt6eHQzl12Wzds1LOeT6WVI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-267-lsObsbDOPnaN7FEJb18jcg-1; Wed, 03 May 2023 03:19:24 -0400
X-MC-Unique: lsObsbDOPnaN7FEJb18jcg-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-3f3fde29b1fso667585e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 03 May 2023 00:19:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683098363; x=1685690363;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JWuwBsoA7E+ixFPnuQyU62/zGQyUSXimh/xtxQzzOds=;
 b=FSbifxZpZgJ4/Y1vGvNUmlfGtu7jTJSEcwHgvdMuOljckfPh9bpv4ISn6JzOZBCk8e
 e74lZDSjosKvePBMYLptqy7e8/VWXajw7cRG76WeNF7czfqHriO/w8yqYimroVq5OoDd
 J0xH5Idgg1QRHFzfdmufKtq1eg9NyqgCWtuMR/MbrSadBPSDRrqKPLjJYzEXDhuKZljo
 9GZBSRf7OSO/eBurVdYhtiDRDDmzmCoe3uPWdgASs6/z2q5ZRnR+7HYL+8LemMJhKMj0
 SSyqM26K9k/zo0DTH9J99HFdZzwYa5WMygk2dUCnqgtXtaIAZi5/Da9SrEXvL6Koq2aG
 sbpA==
X-Gm-Message-State: AC+VfDxI1AP6aoHCgUoPpKC1l7VWUrAbUOFkp3W2x2HpRE+6xIZv6qBi
 8jX5mgoH2QBz8vWSdjjqKBD1gT02FTusnTZSCjBoD/Go0ECTV19m+REX+hoiSGTJmNQPrU+VD1E
 YSMZg7EGgu/Qn9AYMutF08OzIgASp
X-Received: by 2002:a5d:4536:0:b0:2f9:4fe9:74de with SMTP id
 j22-20020a5d4536000000b002f94fe974demr14583295wra.16.1683098363277; 
 Wed, 03 May 2023 00:19:23 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4YmDJ5fSjEX9bYJcvGxxrKGNEefuG/olEhGMwhxvTP6ZpCZhJEgcZLb8yFcLBX87Q12Wuhlg==
X-Received: by 2002:a5d:4536:0:b0:2f9:4fe9:74de with SMTP id
 j22-20020a5d4536000000b002f94fe974demr14583271wra.16.1683098363001; 
 Wed, 03 May 2023 00:19:23 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 u7-20020a5d5147000000b002cde25fba30sm33050954wrt.1.2023.05.03.00.19.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:19:22 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v3 4/6] fbdev: Include <linux/io.h> via <asm/fb.h>
In-Reply-To: <563673c0-799d-e353-974c-91b1ab881a22@suse.de>
References: <20230502130223.14719-1-tzimmermann@suse.de>
 <20230502130223.14719-5-tzimmermann@suse.de>
 <20230502195429.GA319489@ravnborg.org>
 <563673c0-799d-e353-974c-91b1ab881a22@suse.de>
Date: Wed, 03 May 2023 09:19:21 +0200
Message-ID: <87354dyj9i.fsf@minerva.mail-host-address-is-not-set>
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
Cc: linux-arch@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org, arnd@arndb.de,
 deller@gmx.de, chenhuacai@kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, James.Bottomley@hansenpartnership.com,
 linux-m68k@lists.linux-m68k.org, geert@linux-m68k.org,
 loongarch@lists.linux.dev, vgupta@kernel.org, sparclinux@vger.kernel.org,
 kernel@xen0n.name, linux-snps-arc@lists.infradead.org, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

Hello Thomas,

> Am 02.05.23 um 21:54 schrieb Sam Ravnborg:
>> On Tue, May 02, 2023 at 03:02:21PM +0200, Thomas Zimmermann wrote:

[...]

>>>   #include <linux/console.h> /* Why should fb driver call console functions? because console_lock() */
>>>   #include <video/vga.h>
>>>   
>>> +#include <asm/fb.h>
>> 
>> When we have a header like linux/fb.h - it is my understanding that it is
>> preferred to include that file, and not the asm/fb.h variant.
>> 
>> This is assuming the linux/fb.h contains the generic stuff, and includes
>> asm/fb.h for the architecture specific parts.
>> 
>> So drivers will include linux/fb.h and then they automatically get the
>> architecture specific parts from asm/fb.h.
>> 
>> In other words, drivers are not supposed to include asm/fb.h, if
>> linux.fb.h exists - and linux/fb.h shall include the asm/fb.h.
>> 
>> If the above holds true, then it is wrong and not needed to add asm/fb.h
>> as seen above.
>> 
>> 
>> There are countless examples where the above are not followed,
>> but to my best understanding the above it the preferred way to do it.
>
> Where did youher this? I only know about this in the case of asm/io.h 
> vs. linux/io.h.
>

I understand that's the case too. I believe even checkpatch.pl complains
about it? (not that the script always get right, but just as an example).

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

