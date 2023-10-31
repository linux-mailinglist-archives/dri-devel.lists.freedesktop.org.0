Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E96EE7DD195
	for <lists+dri-devel@lfdr.de>; Tue, 31 Oct 2023 17:30:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06B8310E566;
	Tue, 31 Oct 2023 16:30:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3F3810E566
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Oct 2023 16:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698769829;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9ZhQHCTzkEZ31VTZ/X3IiLaeSZVmrJWT2/+nvVM5uzA=;
 b=JACBdQJ0sd9fMd0Pu12mX/yljHAFCHvaRRpXx5F9ROXtAyaf7bKbrueVWdljUGghQg4H0Z
 9nGVRzeHRyPE2g1Hh1c7VK0bDolJAkNaKg7jHJzzYAHKNPJRNEpddypHcwD4YqduBIyVkg
 38X8fH9zYMJ3KRf2IRE1l2efZPCHg1I=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-98-9xAkKlUcMmmkl33vsK-qtQ-1; Tue, 31 Oct 2023 12:30:28 -0400
X-MC-Unique: 9xAkKlUcMmmkl33vsK-qtQ-1
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-9d4b8735f48so134552866b.1
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Oct 2023 09:30:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698769827; x=1699374627;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9ZhQHCTzkEZ31VTZ/X3IiLaeSZVmrJWT2/+nvVM5uzA=;
 b=M0FooZKp+I6euED57dt696WKSOuWrBC62/tqzrsURhqBnu/yy3F9uGcK5zJchlKJl4
 ujc5k6R9pzUDhL628yyoslZAnfYrxbbqYariwdCVlGXdijmA6jvpn9ujFBsv0v8u3C8y
 lrq0J2C5kKOMdgnbA6fCSEZ1gaARPhj9vfOWsTC6HLSfUWOw7QEJ5rmGn9/t/khODMjx
 UZSRsd8KfXVqWRoB87Tre1RilSNg7ZA8eGpHb0nbOUalyscMTWOZF2NFqAY6xQL+qJx5
 OFMQhCk4q/Eid3P0+bJem1guvFm6iHUnffhrb/zDEA4XKFqY1dGRhyFq9jpZ5JXwsVR8
 7jlw==
X-Gm-Message-State: AOJu0YxljiReFMgJ/aodYYDUm/4en7QQzHOlMZFNdx1yHFlSrSXXMkwW
 c92Sd1Ar0rTeH1PtjJvsF7+72ddUcxegPbtHiNWwvJ2o/zsTM/Zggcf4JMe3ifkYEPlKPtoqoDs
 +MrGmDeVbxlQwgiXh4TkK8hRhEf2V
X-Received: by 2002:a17:906:ef09:b0:9d5:ecf9:e6a0 with SMTP id
 f9-20020a170906ef0900b009d5ecf9e6a0mr1777714ejs.0.1698769827310; 
 Tue, 31 Oct 2023 09:30:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEX8dKBeAvhU51+CB8hLv9HVKwlXbjill4FYjvxDmNT9fu1enl1Wlr1U6yt6UOWcwxS2AqOQg==
X-Received: by 2002:a17:906:ef09:b0:9d5:ecf9:e6a0 with SMTP id
 f9-20020a170906ef0900b009d5ecf9e6a0mr1777688ejs.0.1698769826905; 
 Tue, 31 Oct 2023 09:30:26 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:de9c:abf:b8ff:feee:998b?
 ([2a02:810d:4b3f:de9c:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 me7-20020a170906aec700b009c3f1b3e988sm1225376ejb.90.2023.10.31.09.30.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Oct 2023 09:30:26 -0700 (PDT)
Message-ID: <1e2acafb-fbc3-4256-b1e1-3fe6c47b1ef2@redhat.com>
Date: Tue, 31 Oct 2023 17:30:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH drm-misc-next v7 4/7] drm/gpuvm: add an abstraction for a
 VM / BO combination
To: Jani Nikula <jani.nikula@linux.intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 airlied@gmail.com, daniel@ffwll.ch, matthew.brost@intel.com,
 sarah.walker@imgtec.com, donald.robson@imgtec.com,
 boris.brezillon@collabora.com, christian.koenig@amd.com, faith@gfxstrand.net
References: <20231023201659.25332-1-dakr@redhat.com>
 <20231023201659.25332-5-dakr@redhat.com>
 <f00a4975cf32c3ae28124343a2c994acda083829.camel@linux.intel.com>
 <87zfzz3thp.fsf@intel.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <87zfzz3thp.fsf@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/31/23 12:45, Jani Nikula wrote:
> On Tue, 31 Oct 2023, Thomas Hellström <thomas.hellstrom@linux.intel.com> wrote:
>> On Mon, 2023-10-23 at 22:16 +0200, Danilo Krummrich wrote:
>>> + * Returns: a pointer to the &drm_gpuvm_bo on success, NULL on
>>
>> Still needs s/Returns:/Return:/g
> 
> FWIW, both work to accommodate the variance across the kernel, although
> I think only the latter is documented and recommended. It's also the
> most popular:
> 
>    10577 Return
>     3596 Returns

I'd like to keep "Returns", since that's what GPUVM uses already everywhere else.

>     1104 RETURN
>      568 return
>      367 returns
>      352 RETURNS
>        1 RETURNs
> 
> BR,
> Jani.
> 
> 

