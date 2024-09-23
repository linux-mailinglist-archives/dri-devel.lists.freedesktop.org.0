Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB27197F04D
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2024 20:18:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDD6D10E287;
	Mon, 23 Sep 2024 18:18:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="gVTWwO6y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9D5C10E287;
 Mon, 23 Sep 2024 18:18:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1727115519; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=jL1srCDpYE8wDylU5VHb/B2mfEQTmMhvzK3Q07US208FBq5XHA+jCGMONc3obUWo93l8tTrAdGw/ZV/9zLzESkws0DHM1TnHM5f/dI69itxdyNE4kU8IvkebsWc4koD31mxRXH5PeGjZv+m4MZDy1lcKwtfk3LZ9UMxJ1o0j1/0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1727115519;
 h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To:Cc;
 bh=L6skfTsnZxtmWOmdyLgGYeXFU/tAlXXZpzlo/3dd5L0=; 
 b=KgtKb/QTWdlLpOpIF7dlCe4nbnZrQ+ZV19YmZb6vCQKNQDxlWMEX6ImwiuK5dYy4xFzoWJG1GMPOMEXapqka5biONa9NSD/WvtLEMH4AhlfMyJ9vxqHvlB0+sDIFfWxD0+FIks8uHP0xSIr1OHzImnVBnXsYRBWBhsZzMnsjWVs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1727115519; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:From:From:To:To:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
 bh=L6skfTsnZxtmWOmdyLgGYeXFU/tAlXXZpzlo/3dd5L0=;
 b=gVTWwO6y1IpoWhwe1+1q3T0ctAGDFPcMbibrEiKxxVALr5cEry7bmq1QJVPDyOn9
 EIgc/GzCrjPIlKuKniazfcmxx0ShzBTUT/3LMLwZtYvsdFpkx6IymBRrcUmxxnBtDQG
 1TKiYlW9/H3kDqLCNbP8CUl07ejPKPWg1u0O6WFQ=
Received: by mx.zohomail.com with SMTPS id 1727115517470828.4581202413573;
 Mon, 23 Sep 2024 11:18:37 -0700 (PDT)
Message-ID: <be392c92-5fa9-40a3-83cc-d3589314ebb9@collabora.com>
Date: Mon, 23 Sep 2024 21:18:34 +0300
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
Content-Language: en-US
In-Reply-To: <b1544f77-17c3-40ca-a0a5-c061d6528435@collabora.com>
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

On 9/23/24 21:09, Dmitry Osipenko wrote:
>> Sure, I can do that if others prefer this way too.
> Note that in the other email I suggested to use strndup_user(), that
> will remove the name-length limitation, but then the name var will
> remain to be a string pointer. To me best option would be to replicate
> how dma_buf_set_name works.

My bad, strndup_user() is also size-limited. Then the point about static
string remains.

-- 
Best regards,
Dmitry

