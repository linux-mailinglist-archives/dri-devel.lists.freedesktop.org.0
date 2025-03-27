Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D56D4A72FC8
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 12:37:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21CE210E0ED;
	Thu, 27 Mar 2025 11:37:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="c+q2ymV1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3135110E328
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Mar 2025 11:37:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1743075465; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=kE93UmAslX5mdpHXLr30GMa/gLQ+78Im8cNkSEucSVtG5ItWH4P1UT4NvyUGrrDyFlzjTI81gU5F0u5127pNqy1MCPnrJ2I3EYkhGaHowgPYz8WOVaLj2bPcqs9+8G5lteosyvAicbdMK0DHkcU1ik2LMce8t1BbD7BCeYQm784=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1743075465;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=YDPBgJ2uIKHtOJIPEbZDfG6dgwtwlWFqGk/zgFQv8XU=; 
 b=j1Oe6Wt5QAmpp9i277imuMKui3FknIBsGQ5jB7PtDBsKirjuVE9kUlB4FoRFPV8ptZ21l3g+fVgRCX03tyv6wAsIAlmld6xI/JNZ1w8Fi+mQsQKR8RVRBrCMmH0Me90Va4o25ugg+laebr6IXHMX6s+/4KfuMAADBC4sPdeUJcc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1743075465; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=YDPBgJ2uIKHtOJIPEbZDfG6dgwtwlWFqGk/zgFQv8XU=;
 b=c+q2ymV1/5UlgGA6DNODTYUXXj72XwVWwL4epkg9cgDK0WkiDw1wpruiSANycDAX
 rMQN8HYKm0cg/Db+PfacQ2At4waVstmtc9DHoGmucOkc43iV/+ZXyHJlbSVhgQqm6Wi
 XggH9Q3C5EJXXjcCgPt8hixkfpnl30lp+6rVkfzw=
Received: by mx.zohomail.com with SMTPS id 1743075462906613.4071965337324;
 Thu, 27 Mar 2025 04:37:42 -0700 (PDT)
Message-ID: <3a6a2168-3b38-4173-9731-6505a83d4d82@collabora.com>
Date: Thu, 27 Mar 2025 14:37:39 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] accel/ivpu: pages_use_count is now a refcount_t
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org
Cc: kernel@collabora.com,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Maciej Falkowski <maciej.falkowski@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>
References: <20250327104300.1982058-1-boris.brezillon@collabora.com>
 <878qoq678p.fsf@intel.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Language: en-US
In-Reply-To: <878qoq678p.fsf@intel.com>
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

On 3/27/25 14:30, Jani Nikula wrote:
> On Thu, 27 Mar 2025, Boris Brezillon <boris.brezillon@collabora.com> wrote:
>> Commit 051b6646d36d ("drm/shmem-helper: Use refcount_t for
>> pages_use_count") changed the type of
>> drm_gem_shmem_object::pages_use_count but accel drivers were left
>> behind.
>>
>> Fixes: 051b6646d36d ("drm/shmem-helper: Use refcount_t for pages_use_count")
>> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
>> Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>
>> Cc: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
>> Cc: Maciej Falkowski <maciej.falkowski@linux.intel.com>
>> Cc: Oded Gabbay <ogabbay@kernel.org>
>> Cc: dri-devel@lists.freedesktop.org
> 
> Just for build, on the series,
> 
> Tested-by: Jani Nikula <jani.nikula@intel.com>
> 
> Please merge.

Applied to misc-next

-- 
Best regards,
Dmitry
