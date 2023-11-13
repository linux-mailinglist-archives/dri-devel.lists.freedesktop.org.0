Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E76887EA000
	for <lists+dri-devel@lfdr.de>; Mon, 13 Nov 2023 16:31:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 336D410E3B0;
	Mon, 13 Nov 2023 15:31:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4181F10E3AD
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Nov 2023 15:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1699889463;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jKGX78Rd4vtXziqIRA9TJ7KjXTfZXb4iRfxaCkYZ5m8=;
 b=HOd+tyKLLKWAKl4fxDaBjhn0M9OnkjigVdrsPJ4BK7NlhPk9B+SvkkS2jN5HECNgtSI8am
 4UAHY+h9emCzng9O/Y+3TcZ13Q8PX6fErVs+ZUN9simaZ9B4uABRRarqXcP6Yi9k3LvQ+G
 +al8VohsB6w7d06i3OSG/hZTP+Y9hrY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-179-J-GiPZB8OiqDQXjy8ibvHg-1; Mon, 13 Nov 2023 10:30:55 -0500
X-MC-Unique: J-GiPZB8OiqDQXjy8ibvHg-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-32dceab634dso2019050f8f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Nov 2023 07:30:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699889454; x=1700494254;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jKGX78Rd4vtXziqIRA9TJ7KjXTfZXb4iRfxaCkYZ5m8=;
 b=pK/Z+IAycMn4fC+UICPbscFkNzwF+wXO1MNwKvnvOSf8PdOhscmcRVsmMEIraUJqxH
 EzTJc4uks/dPqU8xtKM2ym9zZ7dEG8xebiKRNnhjtN4GU48fZO8b+1GIN51ysAxjCA7M
 Ia/wk0CGy2rzMGleUXa3D60dKNp+FOcGUfb+6YKB/txFiyqu02tq2N0VpKGgKE0ofChj
 yaHZfkit4h2bMVvISdW6n5KqFdLIhrOswblpWFZhzv9JsIdVq6EMj9OcqvopJpuBd4F+
 Wv6lpEYu5lXiRfd/2v4P/7ThNmxtAwqRMx4gFi5mEyfRoz16bpXlsxCCztpqlW5yWmQh
 jFUA==
X-Gm-Message-State: AOJu0YyPo+Qgbtv2Qo+NhWv6jiWtCutVt7hoYAaHiawVK1onbMHA7JBE
 eKppmplp/6Q23E8NnGecRsKtfrbclQo+nwuq+noaHpiW3GUVgsfDshWKN5vhwJR7HMg36YmWWKt
 Pc/jyfm2+7M71aulhYzP95PO6LZRTVyh+DRUx
X-Received: by 2002:adf:f341:0:b0:32f:7ae6:64a7 with SMTP id
 e1-20020adff341000000b0032f7ae664a7mr4766311wrp.55.1699889453809; 
 Mon, 13 Nov 2023 07:30:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEIVFjTclCrk4e5hSloeUEt6mEFUJE6gpByivfCy3F1MCGULCby9VDADXKW2ugb0dunL7apgA==
X-Received: by 2002:adf:f341:0:b0:32f:7ae6:64a7 with SMTP id
 e1-20020adff341000000b0032f7ae664a7mr4766298wrp.55.1699889453477; 
 Mon, 13 Nov 2023 07:30:53 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 q12-20020a05600000cc00b0032db4e660d9sm5649149wrx.56.2023.11.13.07.30.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Nov 2023 07:30:53 -0800 (PST)
Message-ID: <5f1e1c51-a5e7-4a46-aeb0-52e345287901@redhat.com>
Date: Mon, 13 Nov 2023 16:30:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/10] drm/ast: Detect device type before init
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, daniel@ffwll.ch,
 airlied@gmail.com
References: <20231113091439.17181-1-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20231113091439.17181-1-tzimmermann@suse.de>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 13/11/2023 09:50, Thomas Zimmermann wrote:
> Detecting the ast device's chipset type and configuration mode
> involves several registers, DT properties and possibly POSTing
> parts of the chip. It is preferable to do this before initializing
> the DRM driver, so that that each chip type can have an individual
> setup code.
> 
> The patchset addresses the problem by moving all early detection
> code before the allocation of the ast device.
> 
> Patch one gets a lock out of the way. The lock is only relevant
> for mode setting. Move it there.
> 
> Patches 2 and 3 rework the detection of the correct I/O memory
> ranges. It is now self-contained, more readable and works without
> an instance of struct ast_device.
> 
> Patches 4 to 7 rework the setup of various registers that are
> required for detection. Access helpers for I/O can now operate
> without an instance of struct ast_device. The setup functions
> operate on the I/O ranges that have been made available with
> patch 3, but again without struct ast_device.
> 
> With the detection's internals done, patches 8 and 9 rework the
> chip's and config-mode's detection code to operate without struct
> ast_device as well.
> 
> Finally, patch 10 moves the detection code into the PCI probe
> function. it runs before any of the DRM device code. The fucntion
> for creating an ast device, ast_device_create(), receives the
> detected I/O memory ranges, chip type and configuration mode.
> 
> This cleans up the detection code. There is more chip-specific
> code in other parts of the driver. In a later patch, the ast device
> setup can be split up so that each chip type gets its own code
> path that does not interfere with other chips.
> 
> Tested on AST1100 and AST2100.
> 
> Thomas Zimmermann (10):
>    drm/ast: Turn ioregs_lock to modeset_lock
>    drm/ast: Rework I/O register setup
>    drm/ast: Retrieve I/O-memory ranges without ast device
>    drm/ast: Add I/O helpers without ast device
>    drm/ast: Enable VGA without ast device instance
>    drm/ast: Enable MMIO without ast device instance
>    drm/ast: Partially implement POST without ast device instance
>    drm/ast: Add enum ast_config_mode
>    drm/ast: Detect ast device type and config mode without ast device
>    drm/ast: Move detection code into PCI probe helper
> 
>   drivers/gpu/drm/ast/ast_drv.c  | 261 ++++++++++++++++++++++++++++++++-
>   drivers/gpu/drm/ast/ast_drv.h  | 101 +++++++++----
>   drivers/gpu/drm/ast/ast_main.c | 244 ++----------------------------
>   drivers/gpu/drm/ast/ast_mode.c |  26 ++--
>   drivers/gpu/drm/ast/ast_post.c |  73 +++++----
>   drivers/gpu/drm/ast/ast_reg.h  |  12 +-
>   6 files changed, 411 insertions(+), 306 deletions(-)
> 
> 
> base-commit: b7816c393496dc4497c1327310821407f7171d8b
> prerequisite-patch-id: 0aa359f6144c4015c140c8a6750be19099c676fb
> prerequisite-patch-id: c67e5d886a47b7d0266d81100837557fda34cb24
> prerequisite-patch-id: cbc453ee02fae02af22fbfdce56ab732c7a88c36

I've reviewed the whole series, and I have only a minor comment on patch 
9. That's a good thing to move the chip detection to its own functions, 
and will allow further refactoring later.


For the whole series:
Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

-- 

Jocelyn

