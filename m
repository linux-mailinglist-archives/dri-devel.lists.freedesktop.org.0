Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CE1C5008F4
	for <lists+dri-devel@lfdr.de>; Thu, 14 Apr 2022 10:56:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF6F410FCC6;
	Thu, 14 Apr 2022 08:56:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A9B710FCC7
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Apr 2022 08:56:26 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [80.241.60.240])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4KfCxM4tkkz9sR6;
 Thu, 14 Apr 2022 10:56:23 +0200 (CEST)
Message-ID: <2bd105a2-9e55-f6f1-9d62-c4533470b05b@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1649926581;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g1ZNldq/EyB3mNJsRKqgMP8pcQ4qEP3WnTy07X0W1ek=;
 b=edpTTMLBlCs71+gtLUa5JE5qq4dai3UjdycEZQASCY6Zu4Mz3pK3JCoyRdieXSRU3ZJ7WZ
 cGPlODtsz8SNt7XuSqFb9qjhWpfBTHe/fmvqusco7X1H+NW9Nuas15RKBpxQGsF4NRj7Zs
 ltXuK/pQm9eqzSXWT6ifvdZH963vk0OCAenA9w3vE63mZt7ym+pb2pAy9Et9HuCinET8/+
 JILXzGmWuuhDzCdAIfuPX5IqPcpJ/jGHne4rQBS8+ebj6ehfSoW13KpEY9R5E8fV8T6PVb
 CqobR+2exmpkIHHz2blD11mwuWAdWyG/4du8Tf9TdFDHZiKY0cNXtok4j7uWPw==
Date: Thu, 14 Apr 2022 10:56:15 +0200
MIME-Version: 1.0
Subject: Re: [PATCH] drm/radeon: Add build directory to include path
Content-Language: en-CA
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>
References: <20220413161450.1854370-1-michel@daenzer.net>
 <f425b789-5081-fa70-555f-7553d7cc5bd5@gmail.com>
 <ca5ca8ab-9c48-8d81-2dd6-fbdfface6519@mailbox.org>
 <abd87438-3ff4-6b62-81b4-6162d167348a@gmail.com>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel.daenzer@mailbox.org>
In-Reply-To: <abd87438-3ff4-6b62-81b4-6162d167348a@gmail.com>
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
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-04-14 10:44, Christian König wrote:
> Am 14.04.22 um 09:37 schrieb Michel Dänzer:
>> On 2022-04-14 08:24, Christian König wrote:
>>> Am 13.04.22 um 18:14 schrieb Michel Dänzer:
>>>> From: Michel Dänzer <mdaenzer@redhat.com>
>>>>
>>>> Fixes compile errors with out-of-tree builds, e.g.
>>>>
>>>> ../drivers/gpu/drm/radeon/r420.c:38:10: fatal error: r420_reg_safe.h: No such file or directory
>>>>      38 | #include "r420_reg_safe.h"
>>>>         |          ^~~~~~~~~~~~~~~~~
>>>
>>> Well stuff like that usually points to a broken build environment.
>> Just a separate build directory. Specifically, I'm hitting the errors with
>>
>>   make -C build-amd64 M=drivers/gpu/drm
>>
>> Generated headers such as r420_reg_safe.h reside in the build directory, so source files in the source directory can't find them without an explicit search path.
> 
> I'm trying to swap back into my brain how all of this used to work, but that's a really long time ago that I tried this as well.
> 
>> Are you saying that should get added automagically somehow?
> 
> Yes, exactly that. I'm like 95% sure that used to work, but I don't know why exactly either.

Maybe it worked at some point, but regressed in the meantime? I only just switched to a separate build directory (so that I can easily build-test for other architectures).


-- 
Earthling Michel Dänzer            |                  https://redhat.com
Libre software enthusiast          |         Mesa and Xwayland developer
