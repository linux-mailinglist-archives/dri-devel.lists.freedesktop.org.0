Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 90B3D7775A7
	for <lists+dri-devel@lfdr.de>; Thu, 10 Aug 2023 12:22:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E235910E4C2;
	Thu, 10 Aug 2023 10:22:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F01310E4C2
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Aug 2023 10:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1691662945;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x+MJTukZvFBu5uxNEvSdiWqLSCX8mU/1ji0YP/UX9Yo=;
 b=R/N04Wj7SrNQaQuaNVd7hTUQVQVH/6EjAqSJ8JGYncLBiwm3FP4S7TH9P9NV0WAxSDHu/i
 kEJNYmzEMq2ZdT/nyHlSAcESrFuE/wHCq8pukhGH2jxpkVQ9IEEHYbPFaK6EzKEP8SFP5f
 wZTC0jTBw0mpCnY31FZ8ksffVTl3WfY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-625-rdSevrOvN1eiKCz2Ym07GQ-1; Thu, 10 Aug 2023 06:22:22 -0400
X-MC-Unique: rdSevrOvN1eiKCz2Ym07GQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-3fe232ba9e5so4548795e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Aug 2023 03:22:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691662941; x=1692267741;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=x+MJTukZvFBu5uxNEvSdiWqLSCX8mU/1ji0YP/UX9Yo=;
 b=P9DDxZzDB8X7nt9UGPqxpFBqNFUsLZ/CNGjUlndmiWx3b1KON63J8THA5pJsEFfGk1
 NtZa1P12j1WmGfqfbFeMD94wHQenZdHZTBpEnsQVoJ8zKZYRj06wvNEhtP0/669pE/GT
 /5tFFQDPHjqRVd9UqAlwQF+gLlW+2MCJNanqYkI65zH2uDwtHeSNTloPdiEyX8rpdiBr
 gjORkYY3skZ3WpkejqRSk1MWMO6z1qBgNa6i4/5HIhd+O22A6C6NgczZoSsVOo+WHbHp
 Cra/5/XizhVHhBRjT2lTQ24tkKdiEfPXxdy2Hf4cjc6b/94livlV8Adk9TIop6dk8Nfp
 LaDw==
X-Gm-Message-State: AOJu0YyweVSyhWXHfsq9Ebk2yENB5y94vgShKgRGQ/d4OpLgBNZSeG6P
 gzzOLIe3xHsxshajAOr2miKaveHC0GoISq0faHu975NOsAnrBzFknFQP+eRBVTRre3Xz/0hyirZ
 p3V4A8uoxjGTIKp7gEfeKjQhp18em
X-Received: by 2002:a1c:740e:0:b0:3fe:f45:772d with SMTP id
 p14-20020a1c740e000000b003fe0f45772dmr1570724wmc.28.1691662940959; 
 Thu, 10 Aug 2023 03:22:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGzwHfTYreHO+eXlPBuX4pmdWM9b3WFP9zsHpBDnJdxa4lCgH6Zlb4VcONskeea4zwU+mnpUg==
X-Received: by 2002:a1c:740e:0:b0:3fe:f45:772d with SMTP id
 p14-20020a1c740e000000b003fe0f45772dmr1570707wmc.28.1691662940583; 
 Thu, 10 Aug 2023 03:22:20 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 n5-20020a05600c294500b003fbaade0735sm4596069wmd.19.2023.08.10.03.22.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Aug 2023 03:22:20 -0700 (PDT)
Message-ID: <59344d6e-78f1-d691-7e38-0ffc33b6b078@redhat.com>
Date: Thu, 10 Aug 2023 12:22:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 1/1] drm/fourcc: Add documentation about software color
 conversion.
To: Maxime Ripard <mripard@kernel.org>
References: <20230807140317.26146-1-jfalempe@redhat.com>
 <20230807140317.26146-2-jfalempe@redhat.com>
 <iadbqczfvboqyxebbnjkjef3dttcaa76vu3e4ylve6cxaypbqf@oz5hhu3xrryr>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <iadbqczfvboqyxebbnjkjef3dttcaa76vu3e4ylve6cxaypbqf@oz5hhu3xrryr>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: tzimmermann@suse.de, javierm@redhat.com, dri-devel@lists.freedesktop.org,
 ppaalanen@gmail.com, airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/08/2023 09:45, Maxime Ripard wrote:
> Hi
> 
> On Mon, Aug 07, 2023 at 03:45:15PM +0200, Jocelyn Falempe wrote:
>> After discussions on IRC, the consensus is that the DRM drivers should
>> not do software color conversion, and only advertise the supported formats.
>> Update the doc accordingly so that the rule and exceptions are clear for
>> everyone.
>>
>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
>> ---
>>   include/uapi/drm/drm_fourcc.h | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
>> index 8db7fd3f743e..00a29152da9f 100644
>> --- a/include/uapi/drm/drm_fourcc.h
>> +++ b/include/uapi/drm/drm_fourcc.h
>> @@ -38,6 +38,13 @@ extern "C" {
>>    * fourcc code, a Format Modifier may optionally be provided, in order to
>>    * further describe the buffer's format - for example tiling or compression.
>>    *
>> + * DRM drivers should not do software color conversion, and only advertise the
>> + * format they support in hardware. But there are two exceptions:
> 
> I would do a bullet list here:
> https://www.sphinx-doc.org/en/master/usage/restructuredtext/basics.html#lists-and-quote-like-blocks
> 
ok, that would look better.

>> + * The first is to support XRGB8888 if the hardware doesn't support it, because
>> + * it's the de facto standard for userspace applications.
> 
> We can also provide a bit more context here, something like:
> 
> All drivers must support XRGB8888, even if the hardware cannot support
> it. This has become the de-facto standard and a lot of user-space assume
> it will be present.

ok, I can add this before the first paragraph.
> 
>> + * The second is to drop the unused bits when sending the data to the hardware,
>> + * to improve the bandwidth, like dropping the "X" in XRGB8888.
> 
> I think it can be made a bit more generic, with something like:
> 
> Any driver is free to modify its internal representation of the format,
> as long as it doesn't alter the visible content in any way. An example
> would be to drop the padding component from a format to save some memory
> bandwidth.

ok,

> 
> Otherwise, on principle, I'm fine with that change :)

Thanks, I will wait a bit for other comments, and send a v2.

> 
> Maxime

