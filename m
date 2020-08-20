Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41EF824AF3E
	for <lists+dri-devel@lfdr.de>; Thu, 20 Aug 2020 08:32:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B136F6E8AD;
	Thu, 20 Aug 2020 06:32:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com
 [209.85.218.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B66D6E8AD;
 Thu, 20 Aug 2020 06:32:55 +0000 (UTC)
Received: by mail-ej1-f67.google.com with SMTP id kq25so1234037ejb.3;
 Wed, 19 Aug 2020 23:32:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SgEFdKBZY//GtW7WsFuomYHty6ucGmzytYgl2NILbLg=;
 b=gPC7CRtvG8z52bdq4R51HuS6ryvmjgOyuNXTyCuqmo3TxEeoSbQFwzv10kPtLKYCKQ
 kqbE/gfoG/LZvH95Ww1nb/oK3JxJIJx6CxYLVTUs1jkgCaNd217u3GQe9ut++evKMrRC
 G0dmSVKxTW4kLR1UWJPL/fYHWkM2RvIYySE5YvuaJYg5SF4w1UjIUiwgF8uTQX0266y0
 K9uiTfrf2EBGDd6UbTgRcX1bXzkusiP91A7JoVxIgrG/Rq+rf3K2N7LMdlObC6y08mXu
 zc2YfWh/ace9Nyp8roe1VV90Q9cKcjb0dVp0evrDExCr8plEo7Ma2Rt9ix0eYiQanr+l
 URZw==
X-Gm-Message-State: AOAM533y2TwabTgRZ2KlKDNp8r0P1wRPDMVSwScAtSf8VpPFV0MamJev
 SHmfNkGL8bJJSS2Yxibw2ck=
X-Google-Smtp-Source: ABdhPJyHawhDiHi/8EM4M6MQhQhAbU8noSyyH9M22iSRBN8m/XtenQpygiq47OuBbRtJNtz77xVc2A==
X-Received: by 2002:a17:906:ca5a:: with SMTP id
 jx26mr1780134ejb.62.1597905174107; 
 Wed, 19 Aug 2020 23:32:54 -0700 (PDT)
Received: from ?IPv6:2a0b:e7c0:0:107::49? ([2a0b:e7c0:0:107::49])
 by smtp.gmail.com with ESMTPSA id y9sm707523edt.34.2020.08.19.23.32.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Aug 2020 23:32:53 -0700 (PDT)
Subject: Re: [PATCH 2/2] drm/virtio: Remove open-coded commit-tail function
To: Gerd Hoffmann <kraxel@redhat.com>
References: <20200707201229.472834-4-daniel.vetter@ffwll.ch>
 <20200709123339.547390-1-daniel.vetter@ffwll.ch>
 <20200709123339.547390-2-daniel.vetter@ffwll.ch>
 <5cb80369-75a5-fc83-4683-3a6fc2814104@kernel.org>
 <20200819132408.jnqjhdgd4jbnarhh@sirius.home.kraxel.org>
From: Jiri Slaby <jirislaby@kernel.org>
Message-ID: <8a80b434-c8ed-daa3-753b-dd2ec89b9067@kernel.org>
Date: Thu, 20 Aug 2020 08:32:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200819132408.jnqjhdgd4jbnarhh@sirius.home.kraxel.org>
Content-Language: en-US
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
Cc: linux-rdma@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 virtualization@lists.linux-foundation.org, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 19. 08. 20, 15:24, Gerd Hoffmann wrote:
> On Wed, Aug 19, 2020 at 02:43:28PM +0200, Jiri Slaby wrote:
>> On 09. 07. 20, 14:33, Daniel Vetter wrote:
>>> Exactly matches the one in the helpers.
>>
>> It's not that exact. The order of modeset_enables and planes is
>> different. And this causes a regression -- no fb in qemu.
> 
> Does https://patchwork.freedesktop.org/patch/385980/ help?

Yes, it does.

thanks,
-- 
js
suse labs
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
