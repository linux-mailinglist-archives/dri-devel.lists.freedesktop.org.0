Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C84FF736D48
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jun 2023 15:27:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB93F10E2E3;
	Tue, 20 Jun 2023 13:27:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF17210E2EB
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jun 2023 13:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1687267620;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GDTReUqFEm/gMu/RLApQxRwHfhWVwwVpaDwRKY90drE=;
 b=M3O3L7dLwdaiLyB3TWJmneFvGqSpUqXOo+thq3tJJeh5jrDEQd8ZwSGAzEJvnMdqFEcraH
 CM4EsnzAaGePIuQl23HJXYoyFBFqnG3fiP4tI3lrwSSixFQLDcF9CqsXWVasyBcljZgx5P
 PbfVxpqF6Aush+5DX0WjEwXAx2QdGQM=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-133-UgKi-6SROO-tpcPnFoPsfA-1; Tue, 20 Jun 2023 09:26:55 -0400
X-MC-Unique: UgKi-6SROO-tpcPnFoPsfA-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-3112808cd0cso1769253f8f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jun 2023 06:26:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687267613; x=1689859613;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GDTReUqFEm/gMu/RLApQxRwHfhWVwwVpaDwRKY90drE=;
 b=kJY8a6xNaRiI+hC5FneO6jaB8mFAkw56fbuRq/bnYe6XeUm/CHPtRWsPWmRlz576zS
 Ufp5DM6KWIG+giMOz0NJdgXzh2Ld0fUkyIgRX8jGqy6ufYCHqJzWbfPI9lY2slpQuswB
 YprU8A7BsQrOG8v2rPLR8IXpWlh9zy4qqo7brYv0yt2vpjRU0pSS2QPIXf0DCOdaDYRq
 9SXrO6L/dot1yve/6G6YoPZqwMGr8Y+KEVsHBdfbRZ2j3h5/1UGHpyd0McV3J5byIDTp
 CXxbCkXW7pMui/FDokt0BNJihu+6LYWey25UZZF/HegY54ovDkfH0bF6lANaTTYb2SH4
 GLAQ==
X-Gm-Message-State: AC+VfDwcJBMY2dyYbDHDY9mV7N4KGmLfSRN6Y+mtTu2Cqw/3MoKnZA6+
 jaW9aYoizum5vwlb27eftyqxidCtH4JblMXtMe87rWgXGZ1tzpJLgnErEdCahFF20dHbJys0YnE
 tfU+htIbpr8gzsp2rCUNyZoWWRE87
X-Received: by 2002:adf:fc82:0:b0:30f:c188:67e0 with SMTP id
 g2-20020adffc82000000b0030fc18867e0mr10556633wrr.21.1687267613016; 
 Tue, 20 Jun 2023 06:26:53 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5AGs6WNsazPVkf2PhOlDJiUbeNoBu0vmYWBMuZHgNi5obEa1dsYtCjPtuHf+pRdXikfhV1/w==
X-Received: by 2002:adf:fc82:0:b0:30f:c188:67e0 with SMTP id
 g2-20020adffc82000000b0030fc18867e0mr10556619wrr.21.1687267612711; 
 Tue, 20 Jun 2023 06:26:52 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 n11-20020a5d4c4b000000b003113ccbf388sm2046488wrt.13.2023.06.20.06.26.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Jun 2023 06:26:52 -0700 (PDT)
Message-ID: <bcd6ed9a-cce7-53ce-4c33-8e0ecb7017a4@redhat.com>
Date: Tue, 20 Jun 2023 15:26:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 00/14] drm/ast: Refactor the device-detection code
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 daniel@ffwll.ch, jammy_huang@aspeedtech.com
References: <20230616140739.32042-1-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20230616140739.32042-1-tzimmermann@suse.de>
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

On 16/06/2023 15:52, Thomas Zimmermann wrote:
> Ast's code for detecting the device type and features is convoluted.
> It mixes up several state fields, chip types and sub-models. Rework
> the driver into somehting more understandable.
> 
> Patches 1 fixes a long-standing bug. The affected code has never
> worked correctly.
> 
> Patches 2 to 8 make various changes to the init code, or remove dead
> and duplicated code paths.
> 
> Patch 9 introduces chip generations. Until now, ast used the value
> of enum ast_chip to represent a certain set of related modes, and
> also used the enum to represent individal models. This makes the
> driver code hard to understand in certain places. The patch encodes
> a chip generation in each model enum and converts the driver to use
> it.

That's a very good thing, the handling of different AST revisions was a 
bit messy, and there was bugs when a new one was introduced.
> 
> Patches 10 to 12 replace duplicated model checks with the correct
> enum value. Detection of wide-screen functionality and the transmitter
> chip can then be moved into individual functions in patch 13.
> 
> Patch 14 merges the detection of the silicon revision and the chip
> model into s single function. Both need to be done in the same place
> and affect each other.
> 
> Tested on AST1100 and AST2300.

I've also tested (remotely) on AST2600

For the whole series:

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
Tested-by: Jocelyn Falempe <jfalempe@redhat.com>

> 
> Thomas Zimmermann (14):
>    drm/ast: Fix DRAM init on AST2200
>    drm/ast: Remove vga2_clone field
>    drm/ast: Implement register helpers in ast_drv.h
>    drm/ast: Remove dead else branch in POST code
>    drm/ast: Remove device POSTing and config from chip detection
>    drm/ast: Set PCI config before accessing I/O registers
>    drm/ast: Enable and unlock device access early during init
>    drm/ast: Set up release action right after enabling MMIO
>    drm/ast: Distinguish among chip generations
>    drm/ast: Detect AST 1300 model
>    drm/ast: Detect AST 1400 model
>    drm/ast: Detect AST 2510 model
>    drm/ast: Move widescreen- and tx-chip detection into separate helpers
>    drm/ast: Merge config and chip detection
> 
>   drivers/gpu/drm/ast/ast_dp501.c |   6 +-
>   drivers/gpu/drm/ast/ast_drv.h   |  97 +++++++---
>   drivers/gpu/drm/ast/ast_main.c  | 320 +++++++++++++++++++-------------
>   drivers/gpu/drm/ast/ast_mm.c    |   2 -
>   drivers/gpu/drm/ast/ast_mode.c  |  35 ++--
>   drivers/gpu/drm/ast/ast_post.c  |  74 ++------
>   6 files changed, 294 insertions(+), 240 deletions(-)
> 

