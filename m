Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 648EF6A3DD7
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 10:07:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 869DB10E388;
	Mon, 27 Feb 2023 09:07:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3D3810E390
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Feb 2023 09:07:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: lina@asahilina.net)
 by mail.marcansoft.com (Postfix) with ESMTPSA id 9042E3FA55;
 Mon, 27 Feb 2023 09:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=asahilina.net;
 s=default; t=1677488863;
 bh=Hu1UiUDZneAOWvyF5UlmcAk7mfpmmxARWq2Li7lV4JM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=luigA52L7N8RNgk0yjpn7ADs9Goq2bWRnQo9vRIc/HWGJV/3PO+KKSvHIUQBJvj9j
 NQOcD8JqUqLH0aqAk6BdJwtTUDudJoP84wwc5Fgk82sxjGG5gUoXhmu4PxEOYnacl6
 ZEaR4Ctd561uBlyDC9nmKgSMIHRpTHNm8i83ZEQMuqjnkaHcAR2sKt10qiaVx50Dws
 czeVVv5XEYruxL7QdktFvDFDZJSIWGg9RWpMCgF9gTCZiTd6MGcfbNIRdHMwxcopLd
 KRi6/28D9Krk1VQeH+V+427UfcSiJTFi7fNUWwPq/P2Ie6wz3ZEI/aQ6ovdMuSiNr1
 eCLYaEtN7rKTg==
Message-ID: <ad89998c-0ede-72da-b8e6-fe1de0f009f1@asahilina.net>
Date: Mon, 27 Feb 2023 18:07:38 +0900
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
 <e49127fb-abb9-16fc-42bd-2f380d1bd29d@asahilina.net>
 <3d94a119-dc83-aede-fd39-df7a3ee7cdc0@suse.de>
From: Asahi Lina <lina@asahilina.net>
In-Reply-To: <3d94a119-dc83-aede-fd39-df7a3ee7cdc0@suse.de>
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

On 27/02/2023 17.04, Thomas Zimmermann wrote:
> Hi
> 
> Am 27.02.23 um 08:55 schrieb Asahi Lina:
>> On 27/02/2023 16.45, Thomas Zimmermann wrote:
>>> Hi
>>>
>>> Am 25.02.23 um 22:51 schrieb Dmitry Osipenko:
>>>> On 2/5/23 15:51, Asahi Lina wrote:
>>>>> -EXPORT_SYMBOL_GPL(drm_gem_shmem_get_pages_sgt);
>>>>> +EXPORT_SYMBOL(drm_gem_shmem_get_pages_sgt);
>>>>
>>>> Note it was a GPL symbol. I expect that all drm-shmem exports should be GPL.
>>>
>>> Right. I didn't notice that change, but it's probably not allowed. This
>>> needs to be reverted to a GPL export
>>
>> I'm sorry, this was not intentional! I think I removed and re-added the
>> export as part of making the wrapper and didn't notice it used to be _GPL...
>>
>> Do you want me to send a patch to add it back?
> 
> Yes, please do. The Fixes tag is
> 
>    Fixes: ddddedaa0db9 ("drm/shmem-helper: Fix locking for 
> drm_gem_shmem_get_pages_sgt()")
> 
> This commit is in drm-misc-next-fixes. But the branch is closed already 
> as we're in the middle of the merge window. I think it's best to merge 
> the fix through drm-misc-fixes after the -rc1 hs been tagged.

Sent! I also noticed that there are quite a few other non-GPL exports in
the file, with no real logic that I can see... I'm guessing most of
those weren't intentional either?

~~ Lina
