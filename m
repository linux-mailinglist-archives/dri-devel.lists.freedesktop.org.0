Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B29CA71FE0
	for <lists+dri-devel@lfdr.de>; Wed, 26 Mar 2025 21:09:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A13A10E736;
	Wed, 26 Mar 2025 20:09:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="EsH2tnBR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F293410E73C
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Mar 2025 20:09:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1743019743; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=d+c7ESZdkyR1GlQ6EZ4v8xLwEw/oKw0riRg66riBzhCfJSrAeGexqUzmzdfwFyCq7meKu7F2yQVysGolZvL7Unxzhpo0TkMRjfrfGn0+j8mwHiY6dCDTV4/9LH1TzQqdwGcsgoHiQ2wPp/Fy7KT7gTU79nc4pKQaRVfkPrBLX6Q=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1743019743;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=lJEcZ1DcNk21RCbuiJsB6ijhomxJfvHr1TaAlYoZBCc=; 
 b=GkIPcwwh7HB/IGpBH2AnXkqZAd4hdXSX3bj/p9sRcqnTLoUqRvjppr5kmQrz21LxgY/pqfJ4TCiM4jCPBuZmjJDJCz+ON117sz7dWksI/MYToc92QMLbfl9MJdMxJVhLMRkRrqbVZ2PDmcI0dMBhS0Y5oCqG0AuL6X2RDdIn8xA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1743019743; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=lJEcZ1DcNk21RCbuiJsB6ijhomxJfvHr1TaAlYoZBCc=;
 b=EsH2tnBRrr7dJdta9C+6iQk5/8TN4hAk1rhugDnJmCZNu7aO1o4Sq397v7a8Wu9u
 qu9mW3vOAy4mXE+LfgV636KHGGerkSq7tI2cZ81xUI3TdVgkFiFCMBiLoct9ynRoq/X
 MbGrIE07MV+DWEpqWf2cgezHYDTN4KRdxov+11Cg=
Received: by mx.zohomail.com with SMTPS id 1743019741127156.797910467649;
 Wed, 26 Mar 2025 13:09:01 -0700 (PDT)
Message-ID: <1c9daef3-cd64-4f2f-8021-6ab2f17ae572@collabora.com>
Date: Wed, 26 Mar 2025 23:08:55 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v20 00/10] Add generic DRM-shmem memory shrinker (part 1)
To: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Qiang Yu <yuq825@gmail.com>,
 Steven Price <steven.price@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com
References: <20250322212608.40511-1-dmitry.osipenko@collabora.com>
 <0e0686da-ae96-4a7a-81b2-b9ece1fa4837@suse.de>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Language: en-US
In-Reply-To: <0e0686da-ae96-4a7a-81b2-b9ece1fa4837@suse.de>
Content-Type: text/plain; charset=UTF-8
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

On 3/25/25 17:17, Thomas Zimmermann wrote:
> I've looked through this before, so
> 
> Acked-by: Thomas Zimmermann <tzimmermann@suse.d>
> 
> for the series.

Applied to misc-next, thanks!

-- 
Best regards,
Dmitry
