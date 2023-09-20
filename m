Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3716B7A7340
	for <lists+dri-devel@lfdr.de>; Wed, 20 Sep 2023 08:54:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC62A10E444;
	Wed, 20 Sep 2023 06:54:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BCF310E444
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Sep 2023 06:54:19 +0000 (UTC)
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx0.riseup.net (Postfix) with ESMTPS id 4Rr8Qf68G2z9rw4;
 Wed, 20 Sep 2023 06:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1695192859; bh=V8atDNK1E+JZZDisWMyJdt+WViZGxRZeLthL+8kYzIQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=hdAllFN9JuRC87+Ed7jTZjPxd+LDBIbDJwf+v0lcxy6TsYvQsavnaz/ccY+uGKo/d
 h7nc9PwWtbQKa6PYMPmB8mtC9xgKAZBoYjC0NhpUfllTfuPub86YA1BsE/zYkSKCaK
 VBg56cBZew5lkaCn2pBeIGc8qUCLGCfFs6loYGJ8=
X-Riseup-User-ID: 1F06F83D7576BE04B4DB58FA17051608CD162D04D693EEF396E0701C2059C758
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4Rr8QM6tp0zFqj9;
 Wed, 20 Sep 2023 06:54:03 +0000 (UTC)
Message-ID: <8d346098-a5fa-5e58-2484-3b3a35370619@riseup.net>
Date: Wed, 20 Sep 2023 03:54:00 -0300
MIME-Version: 1.0
Subject: Re: [PATCH 3/3] drm/tests: Fix a use-after-free bug in
 __drm_kunit_helper_alloc_drm_device()
To: Maxime Ripard <mripard@kernel.org>
References: <20230920-kunit-kasan-fixes-v1-0-1a0fc261832d@riseup.net>
 <20230920-kunit-kasan-fixes-v1-3-1a0fc261832d@riseup.net>
 <66zj2spgswo2adyhh2xbcefimggiyci2whxjhsygdistyyqvob@rot736yxggcw>
Content-Language: en-US
From: Arthur Grillo <arthurgrillo@riseup.net>
In-Reply-To: <66zj2spgswo2adyhh2xbcefimggiyci2whxjhsygdistyyqvob@rot736yxggcw>
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
Cc: mairacanal@riseup.net, tales.aparecida@gmail.com,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Brendan Higgins <brendan.higgins@linux.dev>,
 David Gow <davidgow@google.com>, andrealmeid@riseup.net,
 kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 20/09/23 03:40, Maxime Ripard wrote:
> Hi,
> 
> On Wed, Sep 20, 2023 at 03:11:38AM -0300, Arthur Grillo wrote:
>> In __drm_kunit_helper_alloc_drm_device_with_driver(), a drm_driver is
>> allocated with kunit_kzalloc. If the dev argument was allocated by
>> drm_kunit_helper_alloc_device, its deferred actions would access the
>> already deallocated drm_driver.
> 
> We already have a fix for that in drm-misc-fixes, could you give it a try?

Oh! I didn't see that. I just ran it, it worked! Great fix :)

Best Regards,
~Arthur Grillo

> 
> Thanks!
> Maxime
