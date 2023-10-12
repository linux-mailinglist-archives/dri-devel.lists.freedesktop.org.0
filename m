Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC1827C6C19
	for <lists+dri-devel@lfdr.de>; Thu, 12 Oct 2023 13:15:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E334210E4AC;
	Thu, 12 Oct 2023 11:15:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AABD310E4AC
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Oct 2023 11:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697109350;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jjHTbxtjG1kVCfXijazC/Uq1BFv5/xWeEj6UoI2TVWE=;
 b=C4yOMG3+F8IXJYcwusCDD67/wQksYssZNz+ZRhUBoqimYJay0pQXGzVS3AZi2YlAbWA4IF
 EUkpGj2p7D2YYn62s+EkKvGF90O+PlgAVcmt/2zMx1Qfu6HAxLL6RjC3s5sKJeZaFOAIsb
 TCbWpsVodBwJKO0YcSnw8Sa38raas/w=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-517-D40X0VDQPX2OTqDqYPL_8A-1; Thu, 12 Oct 2023 07:15:49 -0400
X-MC-Unique: D40X0VDQPX2OTqDqYPL_8A-1
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-9ba0616b761so64304866b.2
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Oct 2023 04:15:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697109348; x=1697714148;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jjHTbxtjG1kVCfXijazC/Uq1BFv5/xWeEj6UoI2TVWE=;
 b=PKU7zULtCKdLis+bneN6bkc2W1WsCJi9cI3j21Ymwmd+BIEZ6zbqd2KG4nzM2Jec4n
 WlChrgZQUVZc8ZiNpWFsLhAfmYJt8kPSjTjcoEpkviEa2k7W+PBPro5Umm02EL9aZnAl
 BjotOvbg7lUvDqFnN4Gw8qBUjmQbj5gvChpREUDgkZ0B8DBfXkjWxs1HRqsakXUSvLA3
 K8lyEf0yDxFvBNrYJV6YlY0+0NRSrAGrKzlTtQw3X6ymoMgCOAfmNf7xwN7EPqHsRYkC
 yOIsIs4iK9AXG9BMiC+BFUk4zZ8lHY92TOGP+rv8+IpvoWZfyPfUjgQZet1KhYRWUIeA
 REtQ==
X-Gm-Message-State: AOJu0YyxViF3wNWQMo/Fu++4uoj69zdfx2KG1AAsdeHadvMFaNM/ywSg
 CSbG3zuDSHhWHErjIFqL78wZshP58Ln1gUH8ycw8wO38cQV50sEXj6jPIkk5OMkxANnUfCRC5Vr
 jAo51gQmNJbGiFJWbn4Nep7jjtRFv
X-Received: by 2002:a17:906:8a64:b0:9bd:84af:e686 with SMTP id
 hy4-20020a1709068a6400b009bd84afe686mr3012791ejc.76.1697109348608; 
 Thu, 12 Oct 2023 04:15:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEnIhitz+9miyik307B04q1LNWOxqxut0E0hWAlp+SfuBx+VA4xeZUjRDlsUY1pv3AcjZyw2g==
X-Received: by 2002:a17:906:8a64:b0:9bd:84af:e686 with SMTP id
 hy4-20020a1709068a6400b009bd84afe686mr3012769ejc.76.1697109348319; 
 Thu, 12 Oct 2023 04:15:48 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec?
 (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
 by smtp.gmail.com with ESMTPSA id
 p26-20020a1709060dda00b0099bc08862b6sm11153558eji.171.2023.10.12.04.15.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Oct 2023 04:15:47 -0700 (PDT)
Message-ID: <b68666c6-2267-6cc5-c22a-7edfdc68a8d8@redhat.com>
Date: Thu, 12 Oct 2023 13:15:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 0/4] drm/i915/vlv_dsi: Add quirks for x86 android tablets
 (v3)
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20230920195613.304091-1-hdegoede@redhat.com>
 <b308ab49-ceec-e1eb-cbf4-b272cea91e2e@redhat.com> <875y3d48e9.fsf@intel.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <875y3d48e9.fsf@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 10/11/23 15:05, Jani Nikula wrote:
> On Sun, 08 Oct 2023, Hans de Goede <hdegoede@redhat.com> wrote:
>> Hi All,
>>
>> Ping what is the status of this now? This v3 addresses all review
>> remarks from previous versions (specifically the request to file
>> + link gitlab issues).
>>
>> So AFAICT this is ready for merging ?
>>
>> But I'm waiting for an ack for this before pushing it
>> do drm-intel-next myself ...
> 
> There are maybe one or two things I could nitpick about, such as casting
> away the const in there, but then I just don't have the time to look
> into this much deeper, it's all fairly isolated, and, let's be honest,
> you of all people probably have the best idea how well the vlv dsi code
> works out in the real world.
> 
> Thanks for fixing all this stuff, and please just merge.
> 
> Acked-by: Jani Nikula <jani.nikula@intel.com>

Thank you, I've pushed this to drm-intel-next now.

Regards,

Hans






