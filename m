Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 251D394BB91
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2024 12:46:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1934410E6D0;
	Thu,  8 Aug 2024 10:46:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=mary.guillemard@collabora.com header.b="SAfcVST/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F0A810E6D0
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2024 10:46:49 +0000 (UTC)
Delivered-To: kernel@collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1723114000; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=azZa5nZN8r5OSARZsTxJtopNC4e7YGJ/gVNjDiT3OiRtcDOpn+mpABebHioN4yPK4MU9lma+S0Yv/x6DEjedR10Vt6Qx/AzsgJKOUBKugOgCJve64sQ7KTwE/KHx4slc6gKklxk2sUKrdlURRD1xJs32L6GswMYmsCJYm3Kzo5Q=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1723114000;
 h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=t+M3wOJceEQXPoAOrjXdGi2Q9xB7lebSyy+tJxgoNSw=; 
 b=BfGq3BD/njaLrkcK2c8Pip+FuVFwWeOV/6AZ3Kldd/55hFrSdTX81aHW4ujdb58WtmgWtsMJaJJ2IXd9SVfBKYOULK15bP2VjvH8nqH3mnkot0tV2B1P0ICapDDjtyO0UiTsYvprTulBtntqe93dpMpQybmuE/z8y8hbOK7KDms=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=mary.guillemard@collabora.com;
 dmarc=pass header.from=<mary.guillemard@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1723114000; 
 s=zohomail; d=collabora.com; i=mary.guillemard@collabora.com; 
 h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
 bh=t+M3wOJceEQXPoAOrjXdGi2Q9xB7lebSyy+tJxgoNSw=;
 b=SAfcVST/jtPvJ0PH7j76QqnCjrVU9sIoAFZZaNZ26Vtuvz4WA2SeETuV4aSDVqWo
 Rdo7jRNTchUA2yieRGD49E9AlLD+WTtN5QqaXcqjGcA9YyMkK5qOqEGtQPffH4tPnXr
 y+ugi8sC6Vt1CPwyt02MpOTI2v9LjMkdyW3KKl1s=
Received: by mx.zohomail.com with SMTPS id 1723113999747624.924931961419;
 Thu, 8 Aug 2024 03:46:39 -0700 (PDT)
Date: Thu, 8 Aug 2024 12:46:34 +0200
From: Mary Guillemard <mary.guillemard@collabora.com>
To: Steven Price <steven.price@arm.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 kernel@collabora.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 1/3] drm/panfrost: Add SYSTEM_TIMESTAMP and
 SYSTEM_TIMESTAMP_FREQUENCY parameters
Message-ID: <ZrSiCvq1mYid2BlA@kuroko.kudu-justice.ts.net>
References: <20240807160900.149154-1-mary.guillemard@collabora.com>
 <20240807160900.149154-2-mary.guillemard@collabora.com>
 <37be0bd0-219d-4e46-b17e-cde7f960becb@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <37be0bd0-219d-4e46-b17e-cde7f960becb@arm.com>
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

Hello Steve,

> VK_KHR_calibrated_timestamps says it should query 'quasi simultaneously
> from two time domains' - but this is purely providing an interface to
> read a single counter at a time.
> 
> It _may_ be useful to report the GPU's view of time and at the same time
> (or as near as possible) the architectural counters. That can be used to
> deal with drift between the GPU's counters and arch counters[1].
> 
> In general we try to avoid providing an interface to something which is
> unrelated to the GPU, especially when user space already has a mechanism.
> 
> Steve
> 
> [1] See Mihail's response to the panthor patches for details of
> differences that might occur.

I initially didn't saw the register to get the GPU timestamp and
wrongly assumed I would have to query it from the generic arch timer.

I will make SYSTEM_TIMESTAMP returns the value of the timestamp register
on v2 and keep SYSTEM_TIMESTAMP_FREQUENCY the same way as it is at the
moment.

Thanks for the review,

Mary

