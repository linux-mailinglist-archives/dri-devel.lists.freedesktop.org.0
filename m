Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40132B00E02
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jul 2025 23:42:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF83D10E978;
	Thu, 10 Jul 2025 21:42:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="EhKcITll";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0304910E978
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jul 2025 21:42:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1752183758; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=jn1bdJhBXVNVHNSsl0tvg1KrPbwCu0MNQ8GHlC/PugN/l2oOu14PZQ0kTji6oLMAiwB3eZVcyICLaDD+HeOrGJ6jqDFFdJlFP+GcZSeELoaoCSt7zRTb7308sVanjkQ8WdgG70xhGgZ9jhzxBXhigkV44fjN7R3C+FpXRQqbLhs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1752183758;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=fNWN3i5m26Nu/65ULICAG8wa68sSZ9ePP0AvUli/hwE=; 
 b=dKbkTjYD83dKzjD/l0K736b9IwwCpD1jpoVeH/I44EbNbARjMJmWLNF83SyW6RDwibM2lzJgH1B+dU/FaBtzlDqDu69h/855Ht2KOWbAF8h/Gh/EZORLoKL2D9CmDlHDSnGrOdq7oq7MeUffCiRvaxjhXbQ4I1Yg6p3PmsKrGTM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1752183758; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=fNWN3i5m26Nu/65ULICAG8wa68sSZ9ePP0AvUli/hwE=;
 b=EhKcITllEMZB60onnnVFF+JaR6ppbjRWDn6UYrFGcjJ8dxXIOl7w4cbgNfVP3W+o
 sWR3XBVDBYsS//6XPP63sdJjvEde6kAICwyWFvVz3zfKnYP8ahBTJUj/45Ba/klTSOi
 AMvM9i0hm/QYG9HS2QOMydM6fTsiEx98Ehynel1Q=
Received: by mx.zohomail.com with SMTPS id 175218375549942.942743207452395;
 Thu, 10 Jul 2025 14:42:35 -0700 (PDT)
Message-ID: <0eb5e316-5eb5-468e-bee0-b4fc8d0490ae@collabora.com>
Date: Fri, 11 Jul 2025 00:42:32 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] drm/virtio: Implement save and restore for
 virtio_gpu_objects
To: "Kim, Dongwon" <dongwon.kim@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Cc: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
References: <20250702222430.2316723-1-dongwon.kim@intel.com>
 <20250702222430.2316723-3-dongwon.kim@intel.com>
 <633a9922-2281-4119-8378-8d35089ce89e@collabora.com>
 <PH8PR11MB6879AE6EDD72B112AADC0BF6FA49A@PH8PR11MB6879.namprd11.prod.outlook.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Language: en-US
In-Reply-To: <PH8PR11MB6879AE6EDD72B112AADC0BF6FA49A@PH8PR11MB6879.namprd11.prod.outlook.com>
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

On 7/9/25 18:34, Kim, Dongwon wrote:
> Hi Dmitry,
> 
> I thought about what you are saying - avoiding GPU reset and it would work with normal
> sleep and restore (s3) but the problem I saw was hibernation scenario (s4). In this case, QEMU
> process will be terminated after guest hibernation and this actually destroys all the resources
> anyway. So some sort of recreation seemed to be required from my point of view.

Can we add proper hibernation support/handling to the virtio-gpu driver?
I.e. restoring shmem buffers based on S4 PM_POST_HIBERNATION event and
not resetting GPU on S3. Entering S4 then should be prohibited if 3d
contexts feature enabled.

-- 
Best regards,
Dmitry
