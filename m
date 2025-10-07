Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB92BC23E5
	for <lists+dri-devel@lfdr.de>; Tue, 07 Oct 2025 19:21:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45B8910E1CA;
	Tue,  7 Oct 2025 17:21:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="icAB8/HE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D10010E1CA
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Oct 2025 17:21:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1759857701; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=ib9XOJr330e3oDWZMZXR2z5uDPNo2DaXCdiSc+QXXYXRXAKI0a9GKt8Fe7PCa20tz/wxa/J0v2wQvPmsDMbX2/tuE0LWhYwtVCBiI6mnR6pAHIhKgvFc9ZuTTrBle+7wXLB90eJQHZBwjT0WJnZPKiRXCMyZsyaLTpiMNtQeKDc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1759857701;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=pnUZVT3ra05XxDxluif3PwOXZEcp6jGQygFoMx/ef9A=; 
 b=ajHUWZ0VOToGF0lRm5ooPY9ikpDgJXp/vFO2zY9yMqOARnWMtf0gP8iVuI+Ti4GCokEstmWWZW2P7tMw5yFTW/7FoLvkZZLm1Yxw2UwR9aeCvTVMZ+yncU64/SQFR1Rh7ljo+qyRB8+ECyA8rJKaSZE6PRTtFHbT3wnqNuqZt8M=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1759857701; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:From:From:To:To:Cc:Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=pnUZVT3ra05XxDxluif3PwOXZEcp6jGQygFoMx/ef9A=;
 b=icAB8/HEMm2NMvmh920bXVqFYsF9QLi1HGrBb/XIASFEJY5AsTREJ5tXxAjKbFmO
 nwJz5ZlRMJRpbGyBqTzOaCm5axXb8Hn8pOvlyQuTjyCjdf8iWSvV43TpQ6MWN4I/kM1
 M0CpYjugXuGZ2QLRq7ROHnB7NV+IoLHvP5mfQXEU=
Received: by mx.zohomail.com with SMTPS id 1759857697443716.5449019173377;
 Tue, 7 Oct 2025 10:21:37 -0700 (PDT)
Message-ID: <da75f737-4593-4ddb-9a51-5a22b2bd635c@collabora.com>
Date: Tue, 7 Oct 2025 20:21:34 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] drm/virtio: Add support for saving and restoring
 virtio_gpu_objects
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: "Kim, Dongwon" <dongwon.kim@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Cc: "nirmoyd@nvidia.com" <nirmoyd@nvidia.com>
References: <20251003053402.732218-1-dongwon.kim@intel.com>
 <20251003053402.732218-3-dongwon.kim@intel.com>
 <059d3074-dc1f-47cf-9bdd-ca582e150511@collabora.com>
 <PH0PR11MB51125B8A88CBFAE48E7BDC62FAE4A@PH0PR11MB5112.namprd11.prod.outlook.com>
 <ef77d1e3-adea-4120-a23f-b2925ca23b38@collabora.com>
 <PH0PR11MB5112BF73084A79F3F0E785F6FAE4A@PH0PR11MB5112.namprd11.prod.outlook.com>
 <0fef25c6-c423-4d00-bbca-1744c2305afb@collabora.com>
 <PH0PR11MB511295459D829356E4416957FAE3A@PH0PR11MB5112.namprd11.prod.outlook.com>
 <11358030-ec48-4e07-b056-d5be29a38707@collabora.com>
Content-Language: en-US
In-Reply-To: <11358030-ec48-4e07-b056-d5be29a38707@collabora.com>
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

On 10/7/25 00:45, Dmitry Osipenko wrote:
> Also, reject hibernation on PM_HIBERNATION_PREPARE with a error msg if
> virgl is enabled.

fail hibernation if hostmem is enabled in addition to virgl since both
can't be restored

-- 
Best regards,
Dmitry
