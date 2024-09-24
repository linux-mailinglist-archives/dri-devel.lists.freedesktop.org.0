Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8F52984EFA
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2024 01:28:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 530C310E912;
	Tue, 24 Sep 2024 23:28:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="AzcHixUF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5351F10E912;
 Tue, 24 Sep 2024 23:28:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1727220512; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=dSi5KxkRF8EDPsj9U7tcO6MiXT4GxAVBtU1OybjgEg5Vs33dwIy26Kjz69kO8sr5a0DPnu3B0pr6+JrpL8ErGnQzmg2eKsTA3bhAp/21QEc5ckK/pBF/RXnetNfRX/UNnXznR/IuFZTTUeySFutI2HQamilA2iNcuSo7ClYLx+g=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1727220512;
 h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To:Cc;
 bh=MCo3sAaNrLcndbHw0Qs7XvwC1EAx/5fkuDus4Feiap4=; 
 b=OGvvwvYmvsrgLRqzqgn43rf9w45jD+h1Rs/Ew2pGoGWhTHbHM8sSWxTisUr+1Z7QJtfQJI2fGSKd0ApIXTaphxEaZWU9XN2/2FKX9AhIOIhZaltDgnswrm6EDwXIWhE8qjXc9aIfWMFvjr70cKnv7/UsZwK/6imuYhVnUmnWFXA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1727220512; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:From:From:To:To:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
 bh=MCo3sAaNrLcndbHw0Qs7XvwC1EAx/5fkuDus4Feiap4=;
 b=AzcHixUFvnFliH2lV4sMIdKpcEd6aw1vVDvw3YTWjBmYbMjkL7S3KEYauVWfSaka
 pGnZvIhkAdJgID/jrW2BB6LsMfLzEnBDt2r/IXJlAAcQq3f+8j34c9GgFyfwjSHz4Yc
 Ud6rYpRokbEXMwe+KQZ1AM8I/cYS7lOAKn2GqWHI=
Received: by mx.zohomail.com with SMTPS id 1727220511136996.1369344638829;
 Tue, 24 Sep 2024 16:28:31 -0700 (PDT)
Message-ID: <ce271c12-f5ab-44eb-9d95-e87441212395@collabora.com>
Date: Wed, 25 Sep 2024 02:28:26 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/6] drm: add DRM_SET_NAME ioctl
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: Pierre-Eric Pelloux-Prayer <pierre-eric@damsy.net>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 dri-devel@lists.freedesktop.org, christian.koenig@amd.com,
 tursulin@igalia.com, simona.vetter@ffwll.ch, robdclark@gmail.com,
 alexander.deucher@amd.com, amd-gfx@lists.freedesktop.org
References: <20240920090920.1342694-1-pierre-eric.pelloux-prayer@amd.com>
 <20240920090920.1342694-2-pierre-eric.pelloux-prayer@amd.com>
 <75f56ed0-206a-4e81-9972-38c29a3e20be@collabora.com>
 <d27cdff0-0432-4813-9948-752f6145bef7@damsy.net>
 <b1544f77-17c3-40ca-a0a5-c061d6528435@collabora.com>
 <be392c92-5fa9-40a3-83cc-d3589314ebb9@collabora.com>
Content-Language: en-US
In-Reply-To: <be392c92-5fa9-40a3-83cc-d3589314ebb9@collabora.com>
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

On 9/23/24 21:18, Dmitry Osipenko wrote:
> On 9/23/24 21:09, Dmitry Osipenko wrote:
>>> Sure, I can do that if others prefer this way too.
>> Note that in the other email I suggested to use strndup_user(), that
>> will remove the name-length limitation, but then the name var will
>> remain to be a string pointer. To me best option would be to replicate
>> how dma_buf_set_name works.
> 
> My bad, strndup_user() is also size-limited. Then the point about static
> string remains.

To clarify a bit further, I'm fine with both variants. Having a
consistent solution across kernel is also good if it's good enough. I.e.
replicating the whole dma_buf_set_name using the name pointer is okay to
me, though not having string pointers is more robust in general. Choose
what you like more.

-- 
Best regards,
Dmitry

