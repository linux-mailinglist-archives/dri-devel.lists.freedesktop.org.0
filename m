Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBCF1627756
	for <lists+dri-devel@lfdr.de>; Mon, 14 Nov 2022 09:20:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61ECD10E275;
	Mon, 14 Nov 2022 08:19:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A42910E07D
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Nov 2022 08:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668413989;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+Yxpc0+M0IPWKSXHEyC3cyneUXB0jkXapCGIc8Lc3oY=;
 b=coBZKsLASCJ0W/Xri/PP4k349+TObPPC4zYd6ZRM/AFPd/0Qtm8VKVFxg+zxoIvq9U0aJy
 5x1PEuaEWTos3ftUy6CEhv0x0HrwoHJ4vVejmvybjMC1zd3HMitdIQpThfPJQjLfPjrdqo
 rpfwCjOXvI5Ix/eyowuEP+H1lt4cj6A=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-256-YdvBVAjANOeh7O1fYTRiOQ-1; Mon, 14 Nov 2022 03:19:47 -0500
X-MC-Unique: YdvBVAjANOeh7O1fYTRiOQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 y20-20020a056402271400b004630f3a32c3so7714416edd.15
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Nov 2022 00:19:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+Yxpc0+M0IPWKSXHEyC3cyneUXB0jkXapCGIc8Lc3oY=;
 b=skZEYGZTn8gGlLKWVPnSbHiP/HIsF9TTURqasrdM+Ny3fw3I16ROuL1v2mwFBvoScJ
 12n+LY3LOI1ppZ6g24sOMl/v0hVT9HJ8l9lYCJ7k81Q8A8dd3J25TWDYr8QEF/MLVIaA
 XyfgZQDuzc/5PEzoH5AmLZ/Jq0XNPko+szTqEhIdjfourlu3aNOnKTgSN334ovu/uELB
 6u68sC0AazdjfkN9KxJZxZoa/w9/+36wlGI+x7DOzvGr3TCgp9Y0xRgIf665etYH5wDo
 AmTl/nAMzvlJYvAZqOGrp1nxlhnPV4GyEBUBTx967D7Uf4cQFIkeviDcRvRC89RzvBtc
 PuuA==
X-Gm-Message-State: ANoB5pkayDRU4I534vOJHhmS5ukYvcedFpnTdM7LpN4Z8WLjDkQW/K9Z
 we1gZ6VxKWkcaX2hdbiN5gcdSHP1fWdByk7m4eNFhiSuoPcfGr/Ktk7/3UwSm9zP4CZODMY46qp
 9waHs6pPWBkfEjHiYiw5rp2+IX/4f
X-Received: by 2002:a17:906:5a6f:b0:7ad:8bd5:b7df with SMTP id
 my47-20020a1709065a6f00b007ad8bd5b7dfmr9198464ejc.57.1668413986799; 
 Mon, 14 Nov 2022 00:19:46 -0800 (PST)
X-Google-Smtp-Source: AA0mqf51p2NOcFiZ3Q4gnFIwqjGdYGaCfgTUB0YvTQf/RWWvsQXFVt45qefdd8RjE0Fo2ogYIQGtEA==
X-Received: by 2002:a17:906:5a6f:b0:7ad:8bd5:b7df with SMTP id
 my47-20020a1709065a6f00b007ad8bd5b7dfmr9198451ejc.57.1668413986549; 
 Mon, 14 Nov 2022 00:19:46 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
 by smtp.gmail.com with ESMTPSA id
 o6-20020a170906768600b007a6c25819f1sm3897632ejm.145.2022.11.14.00.19.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Nov 2022 00:19:45 -0800 (PST)
Message-ID: <33ef1207-aad7-b7cd-61ac-327e9afb0699@redhat.com>
Date: Mon, 14 Nov 2022 09:19:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: linux-next: manual merge of the drm-intel tree with Linus' tree
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20221114102327.6d53341e@canb.auug.org.au>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20221114102327.6d53341e@canb.auug.org.au>
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
Cc: Jani Nikula <jani.nikula@intel.com>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 11/14/22 00:23, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the drm-intel tree got a conflict in:
> 
>   drivers/gpu/drm/i915/display/intel_backlight.c
> 
> between commit:
> 
>   b1d36e73cc1c ("drm/i915: Don't register backlight when another backlight should be used (v2)")
> 
> from Linus' tree and commit:
> 
>   801543b2593b ("drm/i915: stop including i915_irq.h from i915_trace.h")
> 
> from the drm-intel tree.

This is weird, because the:

   b1d36e73cc1c ("drm/i915: Don't register backlight when another backlight should be used (v2)")

commit is in 6.1-rc1, so there can only be a conflict it 6.1-rc1 has not
been back-merged into drm-intel yet ?

Regards,

Hans

