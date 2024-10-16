Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9C4B9A0B7A
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2024 15:31:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4117C10E707;
	Wed, 16 Oct 2024 13:31:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=erik.faye-lund@collabora.com header.b="C9XYVgPB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 903 seconds by postgrey-1.36 at gabe;
 Wed, 16 Oct 2024 13:31:39 UTC
Received: from sender4-op-o10.zoho.com (sender4-op-o10.zoho.com
 [136.143.188.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 033F410E70C
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2024 13:31:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1729084588; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=dRLgIsVFjqSUpK1MeaR+VbXDOwJJV1YGeC5DuzcfvLMaRzStUqXui12ngZuBKYEx/hIanNu7HO7fB1DSg5vxLoCooT2lCfyDPzs2Do2FUtOHdcKv32l4jprSO8KhxdBAaXZ4lGJpZkMn8Gggc3U3nVjqDy1l6OT7Ul5N3jAd3sE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1729084588;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=cD5dw/JYl9rw/17srIoEYRWj3Jq+3lrXtAPtf9Ox2Yg=; 
 b=SyAxzOE+dt5hN+zzV16NfJYy6LaprWWi4iQx8Bs7xmqIR0uYQ5aO7IfhLyQsMZ+973GxKQ7ETlZfv0/OUnVdFJsUz5P8OA6Ev3S+oo9r9Hg4mMmoCpinQJ6lxrMcDdvl2M82Y0ot6GkcFhZE+QBHAGhiyO24qsUR4ec5Zwt2SaA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=erik.faye-lund@collabora.com;
 dmarc=pass header.from=<erik.faye-lund@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1729084588; 
 s=zohomail; d=collabora.com; i=erik.faye-lund@collabora.com;
 h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
 bh=cD5dw/JYl9rw/17srIoEYRWj3Jq+3lrXtAPtf9Ox2Yg=;
 b=C9XYVgPBmfFUZwxjPwb1ODuS8ChCrttVFF/N1IsZ9kylmU0CNIlWQ466Tlqwocmr
 NpiVDUGbboELfMfCxSF8vfcV8D00TuzbDU1/kSwcWANlN8SXWyv9bUXiJY8QSFz2Zt1
 qAVr5y/6L5Iag1qgGdnDvB9aEbNErsvp3+Fh5ZMM=
Received: by mx.zohomail.com with SMTPS id 1729084586866698.4160681009033;
 Wed, 16 Oct 2024 06:16:26 -0700 (PDT)
Message-ID: <64ff75ddede7623c16ed0272eef5e950ae34e7d5.camel@collabora.com>
Subject: Re: [PATCH v6 01/14] drm/panthor: Add uAPI
From: Erik Faye-Lund <erik.faye-lund@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>, 
 dri-devel@lists.freedesktop.org
Cc: Daniel Stone <daniels@collabora.com>, Liviu Dudau <Liviu.Dudau@arm.com>,
 Steven Price <steven.price@arm.com>, Robin Murphy <robin.murphy@arm.com>,
 kernel@collabora.com, Chris Diamand	 <chris.diamand@foss.arm.com>, Ketil
 Johnsen <ketil.johnsen@arm.com>
Date: Wed, 16 Oct 2024 15:16:22 +0200
In-Reply-To: <20240229162230.2634044-2-boris.brezillon@collabora.com>
References: <20240229162230.2634044-1-boris.brezillon@collabora.com>
 <20240229162230.2634044-2-boris.brezillon@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0 (by Flathub.org) 
MIME-Version: 1.0
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

On Thu, 2024-02-29 at 17:22 +0100, Boris Brezillon wrote:
> +/**
> + * enum drm_panthor_sync_op_flags - Synchronization operation flags.
> + */
> +enum drm_panthor_sync_op_flags {
> +	/** @DRM_PANTHOR_SYNC_OP_HANDLE_TYPE_MASK: Synchronization
> handle type mask. */
> +	DRM_PANTHOR_SYNC_OP_HANDLE_TYPE_MASK =3D 0xff,
> +
> +	/** @DRM_PANTHOR_SYNC_OP_HANDLE_TYPE_SYNCOBJ:
> Synchronization object type. */
> +	DRM_PANTHOR_SYNC_OP_HANDLE_TYPE_SYNCOBJ =3D 0,
> +
> +	/**
> +	 * @DRM_PANTHOR_SYNC_OP_HANDLE_TYPE_TIMELINE_SYNCOBJ:
> Timeline synchronization
> +	 * object type.
> +	 */
> +	DRM_PANTHOR_SYNC_OP_HANDLE_TYPE_TIMELINE_SYNCOBJ =3D 1,
> +
> +	/** @DRM_PANTHOR_SYNC_OP_WAIT: Wait operation. */
> +	DRM_PANTHOR_SYNC_OP_WAIT =3D 0 << 31,
> +
> +	/** @DRM_PANTHOR_SYNC_OP_SIGNAL: Signal operation. */
> +	DRM_PANTHOR_SYNC_OP_SIGNAL =3D (int)(1u << 31),

Why do we cast to int here? 1u << 31 doesn't fit in a 32-bit signed
integer, so isn't this undefined behavior in C?

I'm asking, because Coverity complains about overflows when we assign
the value to drm_panthor_sync_op::flags in Mesa, and looking at it...
it seems to be right in complaining!

For reference, here's the Coverity issue (requires login,
unfortunately):
https://scan5.scan.coverity.com/#/project-view/59795/10037?selectedIssue=3D=
1605083

