Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F832A38A6D
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2025 18:13:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C92C610E55E;
	Mon, 17 Feb 2025 17:13:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="Rjd2KS+p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A0BB10E55E
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 17:13:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1739812401; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=k+tHooWYvQM/fTEDMF9ezaEaNcNSJYBkzIiQ5gYnA1s+3bx/eQDyDFcm842u1C+Od48XNLeZMak2czPD8B1/rODrhFdI2MIgmoFC1F7/Ee+AkyRvkDE6/9pBiejLz42nXzLXYA56KU65CMHevZQuYUKLflElQBzxOABdbOief6o=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1739812401;
 h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To:Cc;
 bh=3Fph9gBvBdd9qmUmWvxYRjabYcIMdMHd6ordv+O4sLg=; 
 b=KSAw0obWukX0sFZBbkLaLz6jEKUjpGXXObeMa2qicojvn363bKCfxEXfKXxKUhWnn4xrBX1QWqm8T7iguleboQTP8rWY6MeH6emq6bPla6SJL9rZ7jL05VEFT369KNtnrwYqNiJPyO2m+rYTZ+vsrnpQDaNQ5wYIdGPN8Vsm1qw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1739812401; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
 bh=3Fph9gBvBdd9qmUmWvxYRjabYcIMdMHd6ordv+O4sLg=;
 b=Rjd2KS+pyolOdpxLdQH4Uhq0zh5C+s+JS58HSjxRu92ooURgwQwe/W782xX1EE5V
 GSO6vnT/sXwLkXIRUH964iZ0pNV5pXmFoaB9Tld/at7BIl3SxIcaG0MuYRjcxNnCPa2
 IEzL7doicT0pCrWRWcbefPHDYGhpJoDt3GBHI5e0=
Received: by mx.zohomail.com with SMTPS id 1739812399496485.4004078827304;
 Mon, 17 Feb 2025 09:13:19 -0800 (PST)
Message-ID: <f9f6c845-154e-4efe-b73a-b7ea561ae291@collabora.com>
Date: Mon, 17 Feb 2025 20:13:15 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] dma-buf: dma-buf: stop mapping sg_tables on attach
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 sumit.semwal@linaro.org, tzimmermann@suse.de, simona@ffwll.ch,
 tvrtko.ursulin@igalia.com, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
References: <20250211163109.12200-1-christian.koenig@amd.com>
 <20250211163109.12200-4-christian.koenig@amd.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Language: en-US
In-Reply-To: <20250211163109.12200-4-christian.koenig@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

On 2/11/25 19:31, Christian König wrote:
> As a workaround to smoothly transit from static to dynamic DMA-buf
> handling we cached the sg_table on attach if dynamic handling mismatched
> between exporter and importer.
> 
> Since Dmitry and Thomas cleaned that up and also documented the lock
> handling we can drop this workaround now.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>  drivers/dma-buf/dma-buf.c | 149 ++++++++++++++------------------------
>  include/linux/dma-buf.h   |  14 ----
>  2 files changed, 56 insertions(+), 107 deletions(-)

Looks good, as long as IGT passes.

Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

-- 
Best regards,
Dmitry
