Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBFFAACDB8F
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jun 2025 12:01:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43B0810E72E;
	Wed,  4 Jun 2025 10:01:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=ashley.smith@collabora.com header.b="Vp82e9Wh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBE2F10E7C1
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Jun 2025 10:01:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1749031289; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=FRejhhTIFTuj4rxFeJOSz3XFZ0qEUzvBM97t7uJ3067hEZJ7JEFjGWyNrUfOeOJn5ghJlcsmMO/Cmecetp9EL389menn4U6w0/0L2Cvptz5bNFdJXMRepw/nKiLziCL3sK7WOX3VlK3fJkHIz9XT6yFPyYqDO1HB7o5v9KeAwpg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1749031289;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=9gcEv4agCiJl8Utx0HIyKDah065hsCsg0Lwo1J+yp8k=; 
 b=ZwGvFOXgS9pIwa0ELza71Wk1WefJ6MYt1Dh7YO8VDY0UayzB8wM6BohEr1RA7uVCCWtokijL5eCIrYVO6dsbS6gNin574RGWEcYiVVDPdWoywalst8e8meqypRCvXeVM2sMOGbzAsbLrJtBOZ4UxO4B7Yy6e4WVbl1IlFWVun2c=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=ashley.smith@collabora.com;
 dmarc=pass header.from=<ashley.smith@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1749031289; 
 s=zohomail; d=collabora.com; i=ashley.smith@collabora.com;
 h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=9gcEv4agCiJl8Utx0HIyKDah065hsCsg0Lwo1J+yp8k=;
 b=Vp82e9Wh9xGss/m1WtWrBanV3U9BlR/l9NOClM4uFlocKdw+sBYkG9iLmEsvcGao
 rZ+WSoSq2TyrE+rKxl86wIrpaoNgvMjedWXyMdd9bqnSF2hbnqJa9swLFPfTUBvvnc1
 bm4n1y6vnEJnr/7T2OEME5LYxiRh6EK/BYrgkKTQ=
Received: from mail.zoho.com by mx.zohomail.com
 with SMTP id 1749031287445538.6080897635943;
 Wed, 4 Jun 2025 03:01:27 -0700 (PDT)
Date: Wed, 04 Jun 2025 11:01:27 +0100
From: Ashley Smith <ashley.smith@collabora.com>
To: "Liviu Dudau" <liviu.dudau@arm.com>
Cc: "Boris Brezillon" <boris.brezillon@collabora.com>,
 "Steven Price" <steven.price@arm.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>,
 "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "kernel" <kernel@collabora.com>,
 "open list:ARM MALI PANTHOR DRM DRIVER" <dri-devel@lists.freedesktop.org>,
 "open list" <linux-kernel@vger.kernel.org>
Message-ID: <1973a637a7f.b61987aa482053.3031227813632792112@collabora.com>
In-Reply-To: <aD7X-O8ykIGZjHjc@e110455-lin.cambridge.arm.com>
References: <20250603094952.4188093-1-ashley.smith@collabora.com>
 <20250603094952.4188093-2-ashley.smith@collabora.com>
 <aD7X-O8ykIGZjHjc@e110455-lin.cambridge.arm.com>
Subject: Re: [PATCH v5 1/2] drm/panthor: Reset queue slots if termination fails
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
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

On Tue, 03 Jun 2025 12:09:44 +0100 Liviu Dudau <liviu.dudau@arm.com> wrote:
 > On Tue, Jun 03, 2025 at 10:49:31AM +0100, Ashley Smith wrote: 
 > > This fixes a bug where if we timeout after a suspend and the termination 
 > > fails, due to waiting on a fence that will never be signalled for 
 > > example, we do not resume the group correctly. The fix forces a reset 
 > > for groups that are not terminated correctly. 
 >  
 > I have a question on the commit message: you're describing a situation where 
 > a fence will *never* be signalled. Is that a real example? I thought this is 
 > not supposed to ever happen! Or are you trying to say that the fence signalling 
 > happens after the timeout?

This covers cases where a fence is never signalled. It shouldn't happen, but we have found this in some situations with a FW hang. Since queue_suspend_timeout() is only called on state update, if a suspend/terminate fails due to a FW hang for example this will leave delayed work, possibly leading to an incorrect queue_timeout_work(). Maybe I should not have used the word bug, it's more choosing a failsafe path.
