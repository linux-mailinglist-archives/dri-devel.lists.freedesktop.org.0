Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E5082D839
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jan 2024 12:18:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDB6E10E24D;
	Mon, 15 Jan 2024 11:18:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F43910E24D
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jan 2024 11:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1705317534;
 bh=4oRLMdmdtyagzHfbv4tkXGarWi7zgMa3Ky9pyguhLpc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=LiESiptnhQz/i+ObtFuDOYpkH3xI0DxA1BCZV8lfnZg6/rwlwrT/kbSBF5vMaKNi+
 FZVl3gs1MncYA+w01ag2PZVtpKtTZ0RFjOtIprfm3Txt7HyiZZAyuOwFwYyWuvSkcH
 dFehXv6++OY9GlQCZ2zQPR6RSJUJJ8VXf8BjVR888RAEodRR6VbXKq1xYnnLBz4m3B
 3d6JYs/ev9JknPVDm/VSIWf5y0+d5Jrh7CdbWBu8D3wSnppBzRxaoGywnplsima3I1
 Wu2ZgAyTECrz7lFhYKw7N36Jc5fRPLz7pB5I03yoAUkTFMS0XcRJOlU4dBNOYqpu1J
 HDXVPMIHRfnSg==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 17E453780EC6;
 Mon, 15 Jan 2024 11:18:54 +0000 (UTC)
Date: Mon, 15 Jan 2024 12:18:52 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Chris Diamand <chris.diamand@foss.arm.com>
Subject: Re: [PATCH v3 01/14] drm/panthor: Add uAPI
Message-ID: <20240115121852.2b3252c7@collabora.com>
In-Reply-To: <c2097a0e-aa8a-4cdf-bca5-2fd2b0c5402e@foss.arm.com>
References: <20231204173313.2098733-1-boris.brezillon@collabora.com>
 <20231204173313.2098733-2-boris.brezillon@collabora.com>
 <c2097a0e-aa8a-4cdf-bca5-2fd2b0c5402e@foss.arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Nicolas Boichat <drinkcat@chromium.org>, Daniel Stone <daniels@collabora.com>,
 Liviu Dudau <Liviu.Dudau@arm.com>, dri-devel@lists.freedesktop.org,
 Steven Price <steven.price@arm.com>,
 =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>, kernel@collabora.com,
 Robin Murphy <robin.murphy@arm.com>,
 Faith Ekstrand <faith.ekstrand@collabora.com>, "Marty E .
 Plummer" <hanetzer@startmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 18 Dec 2023 13:20:07 +0000
Chris Diamand <chris.diamand@foss.arm.com> wrote:

> > +/**
> > + * struct drm_panthor_group_submit - Arguments passed to DRM_IOCTL_PANTHOR_VM_BIND
> > + */
> > +struct drm_panthor_group_submit {
> > +	/** @group_handle: Handle of the group to queue jobs to. */
> > +	__u32 group_handle;
> > +
> > +	/** @pad: MBZ. */
> > +	__u32 pad;
> > +
> > +	/** @queue_submits: Array of drm_panthor_queue_submit objects. */
> > +	struct drm_panthor_obj_array queue_submits;
> > +};  
> 
> 
> Hi! Very minor nit - but shouldn't the comment above say DRM_IOCTL_PANTHOR_GROUP_SUBMIT, not VM_BIND?

Certainly, I'll fix it in v4.
