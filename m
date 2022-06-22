Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F398554C00
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 16:01:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC1D210E9A4;
	Wed, 22 Jun 2022 14:01:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DE6510E9A4
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 14:01:02 +0000 (UTC)
Received: from localhost (82-69-11-11.dsl.in-addr.zen.co.uk [82.69.11.11])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 (Authenticated sender: alarumbe)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id DAF8066016CC;
 Wed, 22 Jun 2022 15:01:00 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1655906461;
 bh=a+Yf8EwljCTGnG2qBMj2nXrtv/z2tTqkczBVhMesITY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=n417a7QzkW3gWUXbfjYGZPzKeXoyc6mpmEjDmJU6Ku56IcfQze7qrlQZTmzZLgSLa
 XfW5U4Y+VnLxmnzrASVibQMzySoFdnGayLs0k+4AWfvkmXl6AXOjSuHNmz+XVROpRn
 QZrPSa9WlgoIq1WfAegOgSThzQAw/SgKmSLj8L5J7Llt2pXs0E7wD2dihtvqpWIepz
 rP1CevO1ZFfB0sI7qunYCqdBO6hpZpiyypFt31wamyk6Zj7BFRoFfo5sQoUBuX2HLN
 MKd+3R9TvC8PaQDTeReBJ5rDzSaHqvzwEmnSW291MjJx/Tawi/f2f9bpA3uEvi5qvx
 QSSNIM/uN1JHA==
Date: Wed, 22 Jun 2022 15:00:58 +0100
From: Adri??n Larumbe <adrian.larumbe@collabora.com>
To: Alyssa Rosenzweig <alyssa@collabora.com>
Subject: Re: [PATCH v3 1/1] drm/panfrost: Add support for devcoredump
Message-ID: <20220622140058.3oykas4zfxprmv56@sobremesa>
References: <20220622015420.1130814-1-adrian.larumbe@collabora.com>
 <20220622015420.1130814-2-adrian.larumbe@collabora.com>
 <YrMIXvPaUz5EbT5X@maud>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YrMIXvPaUz5EbT5X@maud>
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
Cc: dri-devel@lists.freedesktop.org, alyssa.rosenzweig@collabora.com,
 tomeu.vizoso@collabora.com, steven.price@arm.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 22.06.2022 08:17, Alyssa Rosenzweig wrote:
>> +			js_as_offset = slot * 0x80;
>
>JS_SLOT_STRIDE

Sorry about this blunder.

>> +	slot = panfrost_job_get_slot(job);
>> +	slot = slot ? slot : 0;
>
>`slot = slot ? slot : 0` is a no-op. Delete the line.

I think what I meant here was 'slot = (slot >= 0) ? slot : 0;' but for some
reason I blundered again. The point of this was ensuring the slot value wouldn't
end up wrapping about the maximum unsigned integer value when using it as an
array offset, in the off-chance that panfrost_job_get_slot() ever returned a
negative value.

In v4 I've instead rewritten this as a sanity check:

WARN_ON(slot < 0);

Although perhaps in the future panfrost_job_get_slot should return an unsigned
integer instead?

>> +			if (!IS_ERR(page))
>> +				*bomap++ = cpu_to_le64(page_to_phys(page));
>> +			else {
>> +				dev_err(pfdev->dev, "Panfrost Dump: wrong page\n");
>> +				*bomap++ = ~cpu_to_le64(0);
>> +			}
>> +		}
>
>Nit: because you have { braces } around half the if, please add
>{ braces } around the other half for consistency.

I thought checkpatch.pl would complain about braces wrapping a single if
statement, but apparently it's fine with it in this case.

>---
>
>As a general note, I'd appreciate breaking out the panfrost_regs.h
>changes into a separate patch, as they are a logically separate clean
>up to make room for this patch. Thanks.

Done in v4.

Cheers,
Adrian


