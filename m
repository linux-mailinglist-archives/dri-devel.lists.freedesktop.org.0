Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25322584264
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jul 2022 16:56:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50F8910E73D;
	Thu, 28 Jul 2022 14:56:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEECD112759
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jul 2022 14:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659020195;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ow7cxV/Atc87f2QLcR9gN0+95qXSVO5SPHOy85HIOrM=;
 b=TBcVhfDQMIAe+vWG+S3gh0eMhO4+4OMaBPYegSEWMsv8yhW4PRfyrHOTvISxCwAnMoIOHH
 5SBMytCrPPgzu6uFR2ym2JZNUObM83u5HuvsIL2btR9hUP2+rtECq+5d1cEpmvtLwSE5AE
 NCCr3bA/to+96fTNBl0GKmbOzkQ/8v8=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-605-ZHJt0f5cNgeC4IhoH4G2Dg-1; Thu, 28 Jul 2022 10:56:33 -0400
X-MC-Unique: ZHJt0f5cNgeC4IhoH4G2Dg-1
Received: by mail-ej1-f71.google.com with SMTP id
 sb15-20020a1709076d8f00b0072b692d938cso717451ejc.10
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jul 2022 07:56:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Ow7cxV/Atc87f2QLcR9gN0+95qXSVO5SPHOy85HIOrM=;
 b=P6BtWFojpW1oRoCZYaMk0fYEG1LyFZ5gxOGeTHvqtBTe26rAQRqf8A0Gx0nAzQA6Gk
 gmdb5/MQhOCIIosYpqyjoma5YWI2N7mIQUaQzKcSE4JKo/ZzG7OsQWZrAylokTSE94lj
 aCdRravGyamEiT5cvkytoV8WoVP0pu1f3H9U/KjqsdZdLBa+0NYKI6r+/33+Yh/7kUnu
 chYLIk2Vbu58em97jMx43iZjW0r/bl9TdLnQtnaFLw7L3MVyIKFviFFfiGPgaQGYc7KT
 w+EIvur0hl4x52YaWxLemiwGbNjOEShn4gtHOYpu63qoRSLrIddUpGOwxzoAgFzh3iK5
 9ClA==
X-Gm-Message-State: AJIora8NDlpxnau27zZ7AR4nSQ+pK8CKVj48K03Kglk9nehzuwDvaW+v
 qHbgBtBWBbuUUDNXPBIbjC+a1hY8ovPokuJA3ewtBJlKBlFfJsSOvaS80Wh/ZY7J/WTXV7kVcO8
 ZPd+6LSN3Qri5qp0sfVpwqRQyPfrA
X-Received: by 2002:a05:6402:428a:b0:42e:8f7e:1638 with SMTP id
 g10-20020a056402428a00b0042e8f7e1638mr27739879edc.228.1659020192254; 
 Thu, 28 Jul 2022 07:56:32 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tDmdcEEoul6TEaJrWO7TmsyTDEwAQLTQHfD/I1YBrvGdzgxhGW04Dbh9agWYJX6WNHPzo8Kg==
X-Received: by 2002:a05:6402:428a:b0:42e:8f7e:1638 with SMTP id
 g10-20020a056402428a00b0042e8f7e1638mr27739865edc.228.1659020192019; 
 Thu, 28 Jul 2022 07:56:32 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b40:2ee8:642:1aff:fe31:a15c?
 ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 l24-20020a056402029800b0043a7293a03dsm820031edv.7.2022.07.28.07.56.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Jul 2022 07:56:31 -0700 (PDT)
Message-ID: <f44b703b-dc53-932a-6701-00d553fe56d0@redhat.com>
Date: Thu, 28 Jul 2022 16:56:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 00/10] drm: use idr_init_base() over idr_init() if
 applicable
To: Maxime Ripard <maxime@cerno.tech>, emma@anholt.net, daniel@ffwll.ch,
 airlied@linux.ie, christian.koenig@amd.com
References: <20220701185303.284082-1-dakr@redhat.com>
 <165901911294.5946.5075667196143577988.b4-ty@cerno.tech>
 <20220728144413.nebc2js26vlwovr3@penduick>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20220728144413.nebc2js26vlwovr3@penduick>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dakr@redhat.com
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/28/22 16:44, Maxime Ripard wrote:
> On Thu, Jul 28, 2022 at 04:41:41PM +0200, Maxime Ripard wrote:
>> On Fri, 1 Jul 2022 20:52:53 +0200, dakr@redhat.com wrote:
>>> From: Danilo Krummrich <dakr@redhat.com>
>>>
>>> This patch series initializes IDRs with idr_init_base(&idr, 1) rather than
>>> idr_init(&idr) in case for the particular IDR no IDs < 1 are ever requested -
>>> this avoids unnecessary tree walks.
>>>
>>> Danilo Krummrich (10):
>>>    drm/amdgpu: use idr_init_base() to initialize mgr->ctx_handles
>>>    drm/amdgpu: use idr_init_base() to initialize fpriv->bo_list_handles
>>>    drm: use idr_init_base() to initialize master->magic_map
>>>    drm: use idr_init_base() to initialize master->lessee_idr
>>>    drm: use idr_init_base() to initialize mode_config.object_idr
>>>    drm: use idr_init_base() to initialize mode_config.tile_idr
>>>    drm/sis: use idr_init_base() to initialize dev_priv->object_idr
>>>    drm/v3d: use idr_init_base() to initialize v3d_priv->perfmon.idr
>>>    drm/via: use idr_init_base() to initialize dev_priv->object_idr
>>>    drm/todo: remove task for idr_init_base()
>>>
>>> [...]
>>
>> Applied to drm/drm-misc (drm-misc-next).

Thanks.

> 
> The via driver had changed a bit and the patch 9 didn't apply at all.
> I've moved the change to where it looked like it belonged, but you might
> want to double check.

LGTM.

- Danilo
> 
> Maxime

