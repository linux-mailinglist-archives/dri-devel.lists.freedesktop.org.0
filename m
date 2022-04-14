Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E93DE50070C
	for <lists+dri-devel@lfdr.de>; Thu, 14 Apr 2022 09:37:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CAD710FBC9;
	Thu, 14 Apr 2022 07:37:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org
 [IPv6:2001:67c:2050:0:465::102])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C00110E113
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Apr 2022 07:37:16 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:105:465:1:1:0])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4KfBB23TxQz9sWP;
 Thu, 14 Apr 2022 09:37:14 +0200 (CEST)
Message-ID: <ca5ca8ab-9c48-8d81-2dd6-fbdfface6519@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1649921831;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5ugP9mxdZjTV6JyPUGBKdJZsCaevGGG8M7k2bOgNyNk=;
 b=TGg+dffAkAQSZFahgJ+36xPmz7qGzfj7jVQRnheUpHK7Iew5syLd4dJsTri+TTIs/kVHVN
 15o5Nl+PCxHaZuo5hdC7jgjJmGbPHJvl7+iBbpayqEzPXMQbn7tCDPUFQs7bQAenRWEjws
 l8yQ8ew1X5TQLZ2wIKUR5bhMk1OMb/5fVPXlcBxZGSZqMB2k+QWYKesbi4V+nWKBza+9sZ
 haHwR1XK6Kp/L1G0qWFR8jFd2KXXk+WX9NOm1b2BhS8LYFTF3J5rchvGYJiI2AxTj6sNsG
 dWO9KamNZAPOymIfU5Y8/HaTtduY4OTap1//gpfTEzKnaO/SgouZuOa2GV3tTg==
Date: Thu, 14 Apr 2022 09:37:07 +0200
MIME-Version: 1.0
Subject: Re: [PATCH] drm/radeon: Add build directory to include path
Content-Language: en-CA
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>
References: <20220413161450.1854370-1-michel@daenzer.net>
 <f425b789-5081-fa70-555f-7553d7cc5bd5@gmail.com>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel.daenzer@mailbox.org>
In-Reply-To: <f425b789-5081-fa70-555f-7553d7cc5bd5@gmail.com>
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-04-14 08:24, Christian König wrote:
> Am 13.04.22 um 18:14 schrieb Michel Dänzer:
>> From: Michel Dänzer <mdaenzer@redhat.com>
>>
>> Fixes compile errors with out-of-tree builds, e.g.
>>
>> ../drivers/gpu/drm/radeon/r420.c:38:10: fatal error: r420_reg_safe.h: No such file or directory
>>     38 | #include "r420_reg_safe.h"
>>        |          ^~~~~~~~~~~~~~~~~
> 
> 
> Well stuff like that usually points to a broken build environment.

Just a separate build directory. Specifically, I'm hitting the errors with

 make -C build-amd64 M=drivers/gpu/drm

Generated headers such as r420_reg_safe.h reside in the build directory, so source files in the source directory can't find them without an explicit search path. Are you saying that should get added automagically somehow?

FWIW, this is pretty common in the kernel according to git grep.


-- 
Earthling Michel Dänzer            |                  https://redhat.com
Libre software enthusiast          |         Mesa and Xwayland developer
