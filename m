Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3846DA78E90
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 14:34:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2A4410E776;
	Wed,  2 Apr 2025 12:34:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="IyZ00P8C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A374410E77F
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Apr 2025 12:34:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1743597277; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=STaBJNr4rZBo8f01c6VRqrJWEa0Y6jLfwmOHdlCvjodQKacGTfeaEE7N5YlXonxCccgYZ4HEq7s1mRNJDTe7NOVVjoNJReZJ7Z64g+qyWraTupVXUcU5zppU2Shmd2soFlyTwTAtME7D5npLiqVetN+ywpYqxoT+BoaaG17vcFA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1743597277;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=1KX7JQi6EbzwxEG4xd90S9IXnOU37kajAaOpaq/ajeQ=; 
 b=Ne5sMX5Z95USWS5DMV7uKspCnRByCk51Z6WBz9V65lkQ/I++oArYVEuEJ3aB0OdZiw2lABgTXDq+igo6cQc8CVhrCYyX4mCKA2aUy2plEVGNVT8m/Y9qIBfKA7CQPZhsyXdUiQ0pa5b9sohZ6unPaILhdroDkmsIsqFskb4oeGw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1743597277; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=1KX7JQi6EbzwxEG4xd90S9IXnOU37kajAaOpaq/ajeQ=;
 b=IyZ00P8CTrqdu6kCoQM8fd5GvRu8kjnC1RpMZznrTwGNp2DYkVbMXMPbPplrXu6F
 RSRoS7MOiMkcbvklCEMqDdstjlherVOurFLhFgXlg+my5abvLXcurVmGuqK586T8xky
 Q1ZfUfihpvqr6pu98D1ldAZVGwQx5uWiH0vp3HIs=
Received: by mx.zohomail.com with SMTPS id 1743597273931232.0685945330315;
 Wed, 2 Apr 2025 05:34:33 -0700 (PDT)
Message-ID: <975582a3-313b-4989-aac2-c3b309ba55b6@collabora.com>
Date: Wed, 2 Apr 2025 15:34:28 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/7] drm/virtio: implement userptr: add interval tree
To: "Huang, Honglei1" <Honglei1.Huang@amd.com>,
 David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Simona Vetter <simona@ffwll.ch>, Rob Clark <robdclark@gmail.com>,
 Huang Rui <ray.huang@amd.com>
Cc: dri-devel@lists.freedesktop.org, virtualization@lists.linux.dev,
 linux-kernel@vger.kernel.org, Demi Marie Obenour <demiobenour@gmail.com>
References: <20250321080029.1715078-1-honglei1.huang@amd.com>
 <20250321080029.1715078-8-honglei1.huang@amd.com>
 <810789ec-c034-4bdd-961a-f49c67336e45@collabora.com>
 <6e796751-86f3-42e5-b0a6-3a3602d3af13@amd.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Language: en-US
In-Reply-To: <6e796751-86f3-42e5-b0a6-3a3602d3af13@amd.com>
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

On 4/2/25 04:53, Huang, Honglei1 wrote:
> 
> On 2025/3/30 19:57, Dmitry Osipenko wrote:
>> If the purpose of this feature is to dedup usrptr BOs of a the single
>> process/application, can this can be done in userspace? 

I assume it can be done in userspace, don't see why it needs to be in
kernel.

-- 
Best regards,
Dmitry
