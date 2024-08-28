Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E21A596260E
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 13:31:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9DE310E42F;
	Wed, 28 Aug 2024 11:31:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=boris.brezillon@collabora.com header.b="AjdHZ32m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2933610E42F
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 11:31:07 +0000 (UTC)
Delivered-To: mary.guillemard@collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1724844653; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=kEmUWvx5TdbFyy2dfxhUGT27oraEOwbJFeeuNDnmZwXFLfJf40bdxElNV2AupYMszILzkQriz6k5dh/42mVIa/5CpcmH1sGxag0s4bY3La6RFM5dSu22/OmowNm9IiVpVDDz4QAA2l8MqxqILqzvz7D+YWRqr/2GjFnSSlqVY4Q=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1724844653;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=z57WRZxexRi0BGZvWyKLmh8V5LVchds8LoG56IN/+m4=; 
 b=I65gtZR35n1D9VhHknLbL92HFC9qdchvTO6hFV8HA8r6BP/zHsPyKVMKo8M3szGVGtYg/9RdCbJoePXwKwlON96FI2AxDyginYL9AlwmXlthvM2hoIfXUofptYYptH6ENLyZ1tf9BaIe0VL8nCU+53jiN0ARvw6NSZGns5BKXwA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=boris.brezillon@collabora.com;
 dmarc=pass header.from=<boris.brezillon@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1724844653; 
 s=zohomail; d=collabora.com; i=boris.brezillon@collabora.com; 
 h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=z57WRZxexRi0BGZvWyKLmh8V5LVchds8LoG56IN/+m4=;
 b=AjdHZ32mxKl5zZ1oRgdO537UsDDtMN8dSvdolxG/ypq3FlwG1cJ6k2y7mvV+Jf9K
 EnMLMOXekgnCu4H32VOt1068pjsLiNU36ilJfz1ZPRa4EdmQ0CRcXzRqm7Ekfp1yGJu
 VpcQi8LwPeEG7677lKfuJALJtOP9gd2zEEc3jisY=
Received: by mx.zohomail.com with SMTPS id 172484465166262.53866539524893;
 Wed, 28 Aug 2024 04:30:51 -0700 (PDT)
Date: Wed, 28 Aug 2024 13:30:42 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Mary Guillemard <mary.guillemard@collabora.com>
Cc: linux-kernel@vger.kernel.org, kernel@collabora.com, Christopher Healy
 <healych@amazon.com>, Steven Price <steven.price@arm.com>, Liviu Dudau
 <liviu.dudau@arm.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3] drm/panthor: Add DEV_QUERY_TIMESTAMP_INFO dev query
Message-ID: <20240828133042.4b731826@collabora.com>
In-Reply-To: <20240819112508.67988-2-mary.guillemard@collabora.com>
References: <20240819112508.67988-2-mary.guillemard@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 19 Aug 2024 13:25:08 +0200
Mary Guillemard <mary.guillemard@collabora.com> wrote:

> +/**
> + * struct drm_panthor_timestamp_info - Timestamp information
> + *
> + * Structure grouping all queryable information relating to the GPU timestamp.
> + */
> +struct drm_panthor_timestamp_info {
> +	/** @timestamp_frequency: The frequency of the timestamp timer. */
> +	__u64 timestamp_frequency;
> +
> +	/** @current_timestamp: The current timestamp. */
> +	__u64 current_timestamp;
> +
> +	/** @timestamp_offset: The offset of the timestamp timer. */
> +	__u64 timestamp_offset;

I'm not sure we should expose the offset to be honest. It looks like
something that's related to suspend/resume which only the kernel needs
to know.

> +};
