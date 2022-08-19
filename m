Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 72022599A6E
	for <lists+dri-devel@lfdr.de>; Fri, 19 Aug 2022 13:12:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64C5710E938;
	Fri, 19 Aug 2022 11:11:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B68A10E950
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Aug 2022 11:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660907507;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uyKEBhi8LTEdHgQsAAcWCSRvZCyy+0QioGOBKWMSHow=;
 b=dg2+XWVVkH8kImDeI/r0QM9Y/7ilM5scaUA5ywVmdeirATkjaEaSorf2blsBkWTTt/engK
 sne2Zey1W8r60TXbRpe5H8lIwy9uu19egNQnQKt9f+50AXHcNoBPoHE70+Bc6/B4YhVXuW
 WuKRigjlPMKU1On77IFPGU3/0NmaoaY=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-278-LwBuQW15MSyzT9lGzS48jg-1; Fri, 19 Aug 2022 07:11:46 -0400
X-MC-Unique: LwBuQW15MSyzT9lGzS48jg-1
Received: by mail-ed1-f69.google.com with SMTP id
 w5-20020a05640234c500b0043dda025648so2647498edc.8
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Aug 2022 04:11:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc;
 bh=uyKEBhi8LTEdHgQsAAcWCSRvZCyy+0QioGOBKWMSHow=;
 b=ZTRHE2eB6W1Pm2LpLHS+ehKRSgluh58NcdkoJAg0qfcvU+LjgBpwrD9orv8Oya+yew
 yQROzXVoWXywoHd11djrnB5O4xMvcOlNV9KPhdGeKU3QnXIYqzxbBefu2jay5vWMplHE
 0KfCiAojYmh9iRWbMF46sIB1LZvl6rZlxlmdjEs0cYusHJyfQfnXHgkQRijwAcKa0Z/a
 VMVkjk6CHrEKvqdiFo/DnzBT8wsgL4qAFzUeO9qba855W17d9iwR82TWQ7g0bx1P96lY
 XxOOr8uaYfm0LCMD3CkkdGvYByz4NJRkj4LlAdk43g3WrflELVqSkP0g3vfbCkqgI4e7
 aWdw==
X-Gm-Message-State: ACgBeo2V61t1mhiAjGWilzSsUx2ya+O5ANLW4qDsetvL1KxqYj5uyV1/
 IYvnPm91MKresIooe1hIEzJcWO+IDKPj6xHwW1a+vCYOFMdHIQ/uPpY0tZdySSpqj2z/ot9ak2u
 I70Ivln3wqhCE3b73skMk3FShMGDo
X-Received: by 2002:a17:907:7678:b0:730:e1ad:b128 with SMTP id
 kk24-20020a170907767800b00730e1adb128mr4657556ejc.67.1660907505125; 
 Fri, 19 Aug 2022 04:11:45 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5xkOeu4QqxyH3VwQMyC9h/lwMvmB9njj2Lcfg4Kwtf1gfWbGe05LGL/eKjTj7SpwlbIl6McQ==
X-Received: by 2002:a17:907:7678:b0:730:e1ad:b128 with SMTP id
 kk24-20020a170907767800b00730e1adb128mr4657547ejc.67.1660907504981; 
 Fri, 19 Aug 2022 04:11:44 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b40:2ee8:642:1aff:fe31:a15c?
 ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 g9-20020a50d0c9000000b00445dba95be9sm2998781edf.30.2022.08.19.04.11.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Aug 2022 04:11:44 -0700 (PDT)
Message-ID: <01bc2efd-7a3f-3c46-a163-5b19adc72f6e@redhat.com>
Date: Fri, 19 Aug 2022 13:11:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH drm-misc-next 2/3] drm/vc4: plane: protect device
 resources after removal
To: Maxime Ripard <maxime@cerno.tech>
References: <20220819002905.82095-1-dakr@redhat.com>
 <20220819002905.82095-3-dakr@redhat.com>
 <20220819072614.dthfuugbkk65o3ps@houat>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20220819072614.dthfuugbkk65o3ps@houat>
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org, tzimmermann@suse.de,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

On 8/19/22 09:26, Maxime Ripard wrote:
> Hi,
> 
> On Fri, Aug 19, 2022 at 02:29:04AM +0200, Danilo Krummrich wrote:
>> (Hardware) resources which are bound to the driver and device lifecycle
>> must not be accessed after the device and driver are unbound.
>>
>> However, the DRM device isn't freed as long as the last user closed it,
>> hence userspace can still call into the driver.
>>
>> Therefore protect the critical sections which are accessing those
>> resources with drm_dev_enter() and drm_dev_exit().
> 
> Ah good catch, thanks
> 
>> Fixes: 9872c7a31921 ("drm/vc4: plane: Switch to drmm_universal_plane_alloc()")
>> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
>> ---
>>   drivers/gpu/drm/vc4/vc4_drv.h   |  1 +
>>   drivers/gpu/drm/vc4/vc4_plane.c | 25 +++++++++++++++++++++++++
>>   2 files changed, 26 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
>> index 418a8242691f..80da9a9337cc 100644
>> --- a/drivers/gpu/drm/vc4/vc4_drv.h
>> +++ b/drivers/gpu/drm/vc4/vc4_drv.h
>> @@ -341,6 +341,7 @@ struct vc4_hvs {
>>   
>>   struct vc4_plane {
>>   	struct drm_plane base;
>> +	struct drm_device *dev;
> 
> That pointer already exists in struct drm_plane
Oops, I've sent a v2. Also addressing your comment from the other patch.

- Danilo
> 
> Looks good otherwise
> 
> Maxime

