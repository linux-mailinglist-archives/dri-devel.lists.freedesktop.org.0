Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C317B1F13
	for <lists+dri-devel@lfdr.de>; Thu, 28 Sep 2023 15:58:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20F9D10E66B;
	Thu, 28 Sep 2023 13:58:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org
 [IPv6:2001:67c:2050:0:465::102])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5510C10E66B
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Sep 2023 13:58:27 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:b231:465::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4RxFSH5bkDz9spv;
 Thu, 28 Sep 2023 15:58:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1695909503;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PxoA+0ABygDnUFl66t6uioAmBBQjT2hB7ZDDRHDe5t0=;
 b=lxFUiSoKZXUmvUvrT3ziVJZoNpOLehnwbRGYWbeOcSL5jzKUNpyuP5oCgJUvOWApcidlg7
 nnZpYwcSw7n/BlZA7iVc1wrJ1zB0NEeO06H+w3Jvuwm2rQJwR26kyRbBnvY/HYFvlKqh++
 4cPsCoGr8BsZKJnNH+5MPM8R2JbyGdOYR1HYQAf4hZB7Q24C5xYuvEP3JM9gm0uN8qn1mc
 MCoq2NpNZUWJPRH8je7GGdgzeCMlQtqtgOkkGQ0UDEDNpuH1wi0h1x3Zgb3JilfrG/JoWa
 9kDP86EjHVtvXEJR6SlzeGLyxpo+KOEHvdGl3yKop9Gmvdmb78xmCY/qwXLVJw==
Message-ID: <d7e3fd7c-410e-46a3-a663-d7f6a41d1a53@mailbox.org>
Date: Thu, 28 Sep 2023 15:58:21 +0200
MIME-Version: 1.0
Subject: Re: [PATCH] drm/atomic: Perform blocking commits on workqueue
Content-Language: en-CA
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Ray Strode <halfline@gmail.com>
References: <20230926170549.2589045-1-halfline@gmail.com>
 <c2ffc21e-bf92-81f6-aa9b-233e3475025f@amd.com>
 <CAA_UwzKiNJe6hjbAo7SK7-OB7sb_ieV_DcQ_8vf6UYw2gppGcA@mail.gmail.com>
 <a1316597-e91b-32f8-78d3-13977438149b@amd.com>
 <CAA_UwzLYbSXaa-JLHwcyKpe45MAkYuaheXNO2m6ZAW1iyMJ_yQ@mail.gmail.com>
 <e0d0e283-fab3-b023-ecdc-89e5cc913da3@amd.com>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel.daenzer@mailbox.org>
In-Reply-To: <e0d0e283-fab3-b023-ecdc-89e5cc913da3@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 210e4f8096ec2703995
X-MBO-RS-META: sdsfdiqwgwn7xte1s8a6mkoobyqmnsjt
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
Cc: alexander.deucher@amd.com, daniel.vetter@ffwll.ch, Xinhui.Pan@amd.com,
 dri-devel@lists.freedesktop.org, airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/28/23 15:23, Christian König wrote:
> 
> What you need to do here is to report those problems to the driver teams and not try to hide them this way.

See the linked issue: https://gitlab.freedesktop.org/drm/amd/-/issues/2861 (BTW, the original reporter of that issue isn't hitting it with DPMS off but just starting a game, so there seem to be at least two separate causes of exceeding 200ms for an atomic commit in DC)

It's not like GitLab issues get much if any attention by DC developers though... So Ray tried to come up with some kind of solution.


-- 
Earthling Michel Dänzer            |                  https://redhat.com
Libre software enthusiast          |         Mesa and Xwayland developer

