Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A43E84CAF07
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 20:47:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 775E410E4FA;
	Wed,  2 Mar 2022 19:47:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A233410E4FA
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Mar 2022 19:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646250468;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9ndR+qkKf8IiCmXwP6/0TLhJyNK+iAc9DAT0Oa/pgpY=;
 b=Se8jp0NCtqyftC3zslnmgnyFSoxnIokS7NuWydbb0NCHnVKnWT6w/sqRorq2nUYJXvdhgo
 WPSoowWM49uN1mcveTdUAtz29i1xCjfR2dtq2/FAjeEzoeKvbq16yYZzDkK1KzyDy/wBBa
 iI8EkNSsISWZsWO2IUUAxpZlNyFJ1+k=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-534-pLIfb8HvN8iiMLL5Ww015Q-1; Wed, 02 Mar 2022 14:47:44 -0500
X-MC-Unique: pLIfb8HvN8iiMLL5Ww015Q-1
Received: by mail-wm1-f72.google.com with SMTP id
 h19-20020a05600c351300b0038141cf26deso1218180wmq.8
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Mar 2022 11:47:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=9ndR+qkKf8IiCmXwP6/0TLhJyNK+iAc9DAT0Oa/pgpY=;
 b=QPl/M7oVgP71GS31GpqTwxAyCyre+IDfK6Jiryhn7Yn3g8y/CQtYhQLufnMoD5U11f
 yex/5A1w8/A+b8/4T950l+IvAdNDBlTT/wV7wP/vCANf9+msdPxrMHzqkpSyofN9snQ6
 kjx5EnZvS8yM8vXODN2/GJRGyDp4WKtcGfaTTcCp3nlehy8PkX44EpPGqxSDtu0SAfpS
 F22N2d9baommfRbklychzn8q1PVlN7IX4jXXhzjUTUIi3GWGLHLoj+J0cAdz0uLxuqbN
 NgkGhSRn/nMmnT1ATW7wysKRMw0yqpezybUYHJVjULeMq56FMFt7L4iaWmVuWOOkMivY
 6ceQ==
X-Gm-Message-State: AOAM5314Vz6gcg/ujwG3Wmk4j3PE1CRLd8+nQTGc3t/dIdOq8oMdl2WB
 c401ZS0bX7nuKqAwuiI8F51KH/RJCcFMsrBsI3/5XOS+8rRmzawcnxBQmE0yzpFD8KvDIbSXw/9
 4DQ9gNukmehVsFSA19yjYfx9xaIfJ
X-Received: by 2002:adf:a749:0:b0:1ef:7d81:f4cd with SMTP id
 e9-20020adfa749000000b001ef7d81f4cdmr17935819wrd.133.1646250463115; 
 Wed, 02 Mar 2022 11:47:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJytQkVIbt3RjmxG7srv9p6KdE7ADQdJ/WVQfRQmhaoGILBPTLLpENUyF/E4HqcmI+2MYZN+gw==
X-Received: by 2002:adf:a749:0:b0:1ef:7d81:f4cd with SMTP id
 e9-20020adfa749000000b001ef7d81f4cdmr17935812wrd.133.1646250462893; 
 Wed, 02 Mar 2022 11:47:42 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 z5-20020a05600c0a0500b0037fa93193a8sm8935824wmp.44.2022.03.02.11.47.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Mar 2022 11:47:42 -0800 (PST)
Message-ID: <2ba8497f-ba6d-558b-d782-bb3ee67d23ec@redhat.com>
Date: Wed, 2 Mar 2022 20:47:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] simpldrm: Enable boot time VESA graphic mode selection.
To: =?UTF-8?Q?Michal_Such=c3=a1nek?= <msuchanek@suse.de>,
 Thomas Zimmermann <tzimmermann@suse.de>
References: <20220218093334.24830-1-msuchanek@suse.de>
 <354f3cfd-bfa0-3ebe-3d67-705423d9294e@suse.de>
 <20220302193846.GT3113@kunlun.suse.cz>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220302193846.GT3113@kunlun.suse.cz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: linux-fbdev@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>,
 Arnd Bergmann <arnd@arndb.de>, David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 x86@kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-video@atrey.karlin.mff.cuni.cz, Borislav Petkov <bp@alien8.de>,
 Maxime Ripard <maxime@cerno.tech>, "H. Peter Anvin" <hpa@zytor.com>,
 Martin Mares <mj@ucw.cz>, Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sam Ravnborg <sam@ravnborg.org>, Ingo Molnar <mingo@redhat.com>,
 Daniel Mack <daniel@zonque.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

On 3/2/22 20:38, Michal Suchánek wrote:
> Hello,
> 
> On Wed, Mar 02, 2022 at 08:31:25PM +0100, Thomas Zimmermann wrote:
>> Hi,
>>
>> is this ready to be merged?
> 
> The objections raised so far have been addressed in v4.
>
> I think this is good to merge.
>

The v4 patches looks good to me and have provided my Reviewed-by to all of them.
 
> Thanks
> 
> Michal
> 
>>
-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

