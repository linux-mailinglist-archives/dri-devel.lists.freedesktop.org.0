Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F80355499E
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 14:17:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E88B11334A;
	Wed, 22 Jun 2022 12:17:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F53411334A
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 12:17:44 +0000 (UTC)
Received: from maud (unknown [184.175.41.107])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 (Authenticated sender: alyssa)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 8F7F36600BA8;
 Wed, 22 Jun 2022 13:17:40 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1655900263;
 bh=BhUFGwufMNw0DhMIbmO084SZ+9Ine/27Bx+AKOuUbkQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NX2U4P/vs2bkiuQ59lJ1BuR1E8U9bqSbsmFnPXpVeGqTskIeO+Hy4e45/VaHZZYjE
 Y+ieoFat/67RowJu3Kxc+tnaMNc+T+MxHH8wPrsceNvXYKIXE7RNZeY35SfGPdCgZI
 GXmRlSjWxIVz1jeWNDElneyWjMmtkVO+0xd7A1RJqcOonVqTrf97ar/Ncih8QGo+xx
 sH4MycyoRSc2FF8dDN3d5gx990P4GHfH48UWh5Ti5QF5tiIqTQtU3/VFzgwHPjNeo9
 hxmLZ/Gbpk9eKq8C/gO4COcAjC8cmZJAa94Fc9vYtUZ6/4oVP/8/2irsZLQOTfCfUu
 bVnSdsM1z88Eg==
Date: Wed, 22 Jun 2022 08:17:34 -0400
From: Alyssa Rosenzweig <alyssa@collabora.com>
To: Adri??n Larumbe <adrian.larumbe@collabora.com>
Subject: Re: [PATCH v3 1/1] drm/panfrost: Add support for devcoredump
Message-ID: <YrMIXvPaUz5EbT5X@maud>
References: <20220622015420.1130814-1-adrian.larumbe@collabora.com>
 <20220622015420.1130814-2-adrian.larumbe@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220622015420.1130814-2-adrian.larumbe@collabora.com>
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

> +			js_as_offset = slot * 0x80;

JS_SLOT_STRIDE

> +	slot = panfrost_job_get_slot(job);
> +	slot = slot ? slot : 0;

`slot = slot ? slot : 0` is a no-op. Delete the line.

> +			if (!IS_ERR(page))
> +				*bomap++ = cpu_to_le64(page_to_phys(page));
> +			else {
> +				dev_err(pfdev->dev, "Panfrost Dump: wrong page\n");
> +				*bomap++ = ~cpu_to_le64(0);
> +			}
> +		}

Nit: because you have { braces } around half the if, please add
{ braces } around the other half for consistency.

---

As a general note, I'd appreciate breaking out the panfrost_regs.h
changes into a separate patch, as they are a logically separate clean
up to make room for this patch. Thanks.
