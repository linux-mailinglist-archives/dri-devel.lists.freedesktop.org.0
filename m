Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 504936A3BDD
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 08:56:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26D5710E1BE;
	Mon, 27 Feb 2023 07:56:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA0D510E1BE
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Feb 2023 07:56:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: lina@asahilina.net)
 by mail.marcansoft.com (Postfix) with ESMTPSA id C841C42404;
 Mon, 27 Feb 2023 07:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=asahilina.net;
 s=default; t=1677484558;
 bh=KkBGVkl+T1va9CwpeEL7yMJF1010hMN2AAYA+6Rnmls=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=AfIi3pqjK0IIm7vQQsxK1WlQIUfSOUGyPBSnZr8lbFyHEBcC0WtxP5enpbjIhZZfv
 PnWrwrGkPoYkBPepsIvBSUFC66Lb6854pSxQXjfKp/gAnA4AP6ICp8CXeU5vmKG7BF
 ZrbdBy4jFSCc/d1ub2QoTCbr1JQMIzTbRWKYoRxU+7zZEMYRV2BR2rWGfZQXt8AMey
 JSg3jGnrLqDIzQPiLPbcb7qHObgv96N5oUL2eV+4WYFSKybpodqPdIlGGmirKSqeX/
 Q2yk4GVLAo2TaKTrE7oYAq8t+wcWjsygVVFRwCl8K/vaqMpjCgdSj2hgMZXowPwwT9
 kvcVMrAUdKoSQ==
Message-ID: <e49127fb-abb9-16fc-42bd-2f380d1bd29d@asahilina.net>
Date: Mon, 27 Feb 2023 16:55:53 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] drm/shmem-helper: Fix locking for
 drm_gem_shmem_get_pages_sgt()
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20230205125124.2260-1-lina@asahilina.net>
 <eddfa36c-4553-d392-0047-313002c613d4@collabora.com>
 <cc1c34c6-18d1-a8c5-bf70-078e7b7205f8@suse.de>
From: Asahi Lina <lina@asahilina.net>
In-Reply-To: <cc1c34c6-18d1-a8c5-bf70-078e7b7205f8@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 linux-kernel@vger.kernel.org, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 asahi@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 27/02/2023 16.45, Thomas Zimmermann wrote:
> Hi
> 
> Am 25.02.23 um 22:51 schrieb Dmitry Osipenko:
>> On 2/5/23 15:51, Asahi Lina wrote:
>>> -EXPORT_SYMBOL_GPL(drm_gem_shmem_get_pages_sgt);
>>> +EXPORT_SYMBOL(drm_gem_shmem_get_pages_sgt);
>>
>> Note it was a GPL symbol. I expect that all drm-shmem exports should be GPL.
> 
> Right. I didn't notice that change, but it's probably not allowed. This 
> needs to be reverted to a GPL export

I'm sorry, this was not intentional! I think I removed and re-added the
export as part of making the wrapper and didn't notice it used to be _GPL...

Do you want me to send a patch to add it back?

~~ Lina
