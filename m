Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE87AA6006E
	for <lists+dri-devel@lfdr.de>; Thu, 13 Mar 2025 20:04:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3791010E91A;
	Thu, 13 Mar 2025 19:04:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b="ABhqq4Bj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D34A410E91A
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Mar 2025 19:04:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1741892667; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=IDai2uCPeDltdnQDWMLspcg/wpWhfJjWrHiFe0Oxud8trPkbuItbTwPuFtBu2bKWZP5HQ1jy6RRWDZo0r+8GsE8DXHALA0KEoVM149PtwDyn8m3zvn9cfUF3NGPOMhmJGYBaAtYFNZeDzE2QQetK0Ueo04up/jXQuEMWEVHLz98=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1741892667;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=0oIWPDRciLqWE5onPVwFJiWQ7qoNl5vDCFa0WS9jdh4=; 
 b=DTujC8IarYC+WlMIUIA3V0dfkynhjraTTMeFsnB2KEqbUu/k3LXGKBkjdIs0fOtxrcMjuBJlTpGBIfK7T+54EpBTiRMzZ7opNtbGbrabZe6zfoBEY0AbYuobq32eCHgF92H/Fm+Ew1iaLsLH5OQspxGxoqHpn4yvbfOrRpWc5KU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
 dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1741892667; 
 s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=0oIWPDRciLqWE5onPVwFJiWQ7qoNl5vDCFa0WS9jdh4=;
 b=ABhqq4BjNTKf0mQ2n2Hu4xIa+Uv0npWPfJe4cdjtmkAbYQRP0OMUUrxvxZ70q2Cc
 Hs54FPNtEfwy1R3Gei2dh/xKBnyV7eTBO2jSGseJgJu8+a+2RONFS68nZwm7e5PeapU
 lHVS1KkEufwpimWodvMlv4XaWdzfcHP76NqFvYws=
Received: by mx.zohomail.com with SMTPS id 17418926658661000.7935840965962;
 Thu, 13 Mar 2025 12:04:25 -0700 (PDT)
Message-ID: <fa5ff28c-ffa0-47d7-9498-ef8b297c7afb@collabora.com>
Date: Thu, 13 Mar 2025 16:04:18 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 5/6] drm/panfrost: Enable AARCH64_4K page table format
 on mediatek_mt8188
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 robh@kernel.org, steven.price@arm.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 kernel@collabora.com, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, sjoerd@collabora.com
References: <20250310195921.157511-1-ariel.dalessandro@collabora.com>
 <20250310195921.157511-6-ariel.dalessandro@collabora.com>
 <20250311090649.0d15d74d@collabora.com>
Content-Language: en-US
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
In-Reply-To: <20250311090649.0d15d74d@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

Boris,

On 3/11/25 5:06 AM, Boris Brezillon wrote:
> On Mon, 10 Mar 2025 16:59:20 -0300
> Ariel D'Alessandro <ariel.dalessandro@collabora.com> wrote:
> 
>> Now that Panfrost supports AARCH64_4K page table format, let's enable it
>> on Mediatek MT8188.
> 
> Can you maybe give more details on why this is needed
> (legacy shareability/cacheability not suitable for this GPU?)?

Ack, will expand in v2.

Thanks!

-- 
Ariel D'Alessandro
Software Engineer

Collabora Ltd.
Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK 
Registered in England & Wales, no. 5513718

