Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 482BD632795
	for <lists+dri-devel@lfdr.de>; Mon, 21 Nov 2022 16:14:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2782A10E18B;
	Mon, 21 Nov 2022 15:14:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4D0410E2E9
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Nov 2022 15:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202112;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IvJc3Xv91Y5fWMzRMgRvPbtd/n2RP+MXKy/jwSMMdg4=; b=KBvnAaJHQsfCsUB3ryG9L8ZSz3
 dGoqcVwgn8/tqM1/dIyqO4vzSqmzN9JSS8K4RxRLbLiCw3cvHdUEb7/mCr4QVOdpez+Y6C4VlUCTF
 9NxC91ooWoOoqTVgR+y44tDm6L4auzT00q1d2A4cmwv/pBTHK+6HS4bQtOF3JkNizcS4dLIU3BBGr
 E4GI2v2qdRSep0Pz/Wqtk9GRqJOR4yI8q93pMW+jrI0dUC6kRv2XQeD5B4qOrMGouNz3kwQTyoW0m
 4qDg0uJvjq9NCFtIwqMh4b7wi6x21OrQiZJkXUbtBOsrqlkMXBsL9QMNloRwbiN7aAoQXXRJXRqDn
 ND/tGpfA==;
Received: from [2a01:799:95e:1700:6395:ccbd:d000:d42b] (port=61750)
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1ox8VE-0001KK-3J; Mon, 21 Nov 2022 16:14:32 +0100
Message-ID: <f14e9985-ecd2-7e94-878f-d6564ead44a3@tronnes.org>
Date: Mon, 21 Nov 2022 16:14:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 0/8] drm/mipi-dbi: Convert to shadow-plane helpers
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 thierry.reding@gmail.com, sam@ravnborg.org, emma@anholt.net,
 david@lechnology.com, kamlesh.gurudasani@gmail.com, javierm@redhat.com
References: <20221121104532.8301-1-tzimmermann@suse.de>
 <86f5b25d-55cc-c759-d9ec-b086d7f05698@tronnes.org>
 <98ed3b6c-bca1-c184-faab-c8d7b5771fb0@suse.de>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <98ed3b6c-bca1-c184-faab-c8d7b5771fb0@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Den 21.11.2022 13.41, skrev Thomas Zimmermann:
> Hi
> 
> Am 21.11.22 um 13:27 schrieb Noralf Trønnes:
>>
>>
>> Den 21.11.2022 11.45, skrev Thomas Zimmermann:
>>> Convert the MIPI-DBI-based drivers to shadow-plane helpers. The
>>> drivers vmap/vunmap GEM buffer memory during the atomic commit.
>>> Shadow-plane helpers automate this process.
>>>
>>> Patches 1 to 4 prepare the MIPI code for the change and simplify
>>> the restof the patchset.
>>>
>>> Patches 5 to 7 rework the vmap code in the MIPI-DBI drivers and add
>>> shadow-plane helpers. Most of the affected drivers call MIPI-DBI
>>> helpers and get the update automatically. Only ili9225 and st7586
>>> require changes to their source code.
>>>
>>> Patch 8 simplifies drm_dev_enter() and _exit(). It's not strictly
>>> needed, but streamlines the driver code and make sense overall.
>>>
>>> Testing is welcome, as I don't have any hardware to test these
>>> changes myself.
>>>
>>
>> I can do a test this weekend.
> 
> Thanks a lot.
> 
>>
>> Btw I've converted drm/gud to the shadow plane helper, I just need to
>> solve an smtp problem[1] so I can send out the patchset.
> 
> How so?  When I looked at it, the vmap/vunmap happened on a separate
> worker than the commit IIRC.
> 

Yes you're right, originally the driver only did flushing asynchronously
in a worker which meant it could access the framebuffer at the same time
as userspace. Later when GNOME got support for one rendering loop per
display, I added a module parameter to enable synchronous flushing
during the commit, it also uses the worker for this but waits for it to
complete.

What I've done in the patchset is to inline the sync flushing and use a
shadow buffer for the async path which still uses the worker, but now it
won't risk reading the framebuffer while userspace writes to it, instead
it reads from the shadow buffer.

Noralf.

> Best regards
> Thomas
> 
>>
>> [1]
>> https://lore.kernel.org/dri-devel/1bc45775-0667-01f8-36e1-9f65d3081092@tronnes.org/T/#u
>>
>> Noralf.
> 
