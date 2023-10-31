Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 106EE7DCFC2
	for <lists+dri-devel@lfdr.de>; Tue, 31 Oct 2023 15:56:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCBD610E513;
	Tue, 31 Oct 2023 14:56:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org
 [IPv6:2001:67c:2050:0:465::202])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25B0B10E513;
 Tue, 31 Oct 2023 14:56:15 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org
 [IPv6:2001:67c:2050:b231:465::202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4SKY9l1jXJz9sqQ;
 Tue, 31 Oct 2023 15:56:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1698764171;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7vgHb9/9uI27o8PrvnTFJvOucoKF/3w/EkDN+Pej4AE=;
 b=XSrgYrJwvAn8R5+wZt7Sp28iHNqvqXAx3qE7n0BiG1fyyhKnCyaUuZlS0o5fVZhwL1Aheu
 qJMmnVTebLtnI/p7UpTlSNTEd33nqOxJWj/yvKEJ+ekt04U3lIhDe1kPQVYua2JmhEZtN/
 GmDDFkot73xY+sWGIP+EYpHXLxFCaZyRCLPmy+7kSHiPSYDivKStmpBoD2ntu+YQYkKSZh
 6SkIOppD9dslxOUEDPgeCxJHtn4zoATjv8AHnWj8FxrYt+21LAb4gcWQHdUTfJ0TbUuMFp
 bzbXmjKt6db7QrTbmqH2KhOLLZvn7AaXvvcEyPp29H2iRkcimSz0YBJKCI2MiQ==
Message-ID: <9c9db2e0-a4a2-600d-a6b4-74b5e781ac16@mailbox.org>
Date: Tue, 31 Oct 2023 15:56:09 +0100
MIME-Version: 1.0
Subject: Re: [PATCH 5/6] drm/amdgpu: Add flag to disable implicit sync for GEM
 operations.
Content-Language: de-CH-frami, en-CA
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Tatsuyuki Ishi <ishitatsuyuki@gmail.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
References: <20231031134059.171277-1-ishitatsuyuki@gmail.com>
 <20231031134059.171277-6-ishitatsuyuki@gmail.com>
 <454e7d7f-8a23-58bd-8822-55c13beba97f@mailbox.org>
 <02d7fe0c-cf7e-413a-a2c2-714c932062d5@amd.com>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel.daenzer@mailbox.org>
In-Reply-To: <02d7fe0c-cf7e-413a-a2c2-714c932062d5@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 86uqnryfy6cprnsj3g5dzu1m3qpbeqzp
X-MBO-RS-ID: a8d17a7bcde7a416b21
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

On 10/31/23 15:34, Christian König wrote:
> Am 31.10.23 um 15:14 schrieb Michel Dänzer:
> 
>> FWIW, RADV will also want explicit sync in the CS ioctl.
> You can replace that with the DMA-buf IOCTLs like Faith is planning to do for NVK. 

Those ioctls cannot disable implicit sync for the CS ioctl. They can be used for making implicit sync work correctly for individual BOs though, once implicit sync is disabled for the CS ioctl.


-- 
Earthling Michel Dänzer            |                  https://redhat.com
Libre software enthusiast          |         Mesa and Xwayland developer

