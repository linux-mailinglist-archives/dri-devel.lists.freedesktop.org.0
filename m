Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B9DB8823E99
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jan 2024 10:26:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 297CE10E42B;
	Thu,  4 Jan 2024 09:26:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org
 [IPv6:2001:67c:2050:0:465::101])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FF9D10E3FE
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jan 2024 09:26:53 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4T5Lnh4Ck1z9srL;
 Thu,  4 Jan 2024 10:26:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1704360408;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xWovRk+P/bdsn8nOpwKltuiPWTz3laevvMIThtgsQLg=;
 b=U3DQ9N2bxWLpnMjB8jxRrT2CWrDKzKvS2xM6N+qJgtYA4cBb+lOIMcdPPMIMc+dUFK26e/
 LeldvoC0v9WYfmGfwHw2vUN/1mEq2rvk13uNulTUtmBbT/5ml6b3RNBaccoN1SHYurrP7s
 8+PNXKI4mn2zVhsQmkwWkrR2dqSlJeS8XDjwpD2K0Wxv2hEHPjo8LZOPUdzT+G8aNgawBG
 yJCkdQ+SQNkFq5V69P7kNZ2upyRjDn0dbpeU3KEzL8bmOymmWEK1i5fIUzatt2lg924Clt
 4dOr2FUMA5lQPN9N8ePe26qSW7crROYoeBSbF/EtBZgomCi9vkW6S5HRlTp29Q==
Message-ID: <ff58a489-105c-4fdc-9af5-59efb9d05ec0@mailbox.org>
Date: Thu, 4 Jan 2024 10:26:42 +0100
MIME-Version: 1.0
Subject: Re: [1/3] drm: property: One function call less in
 drm_property_create() after error detection
Content-Language: en-CA
To: Markus Elfring <Markus.Elfring@web.de>, dri-devel@lists.freedesktop.org,
 kernel-janitors@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
References: <ff7ce5d0-59fa-470c-8dd6-68dbe65c18e5@web.de>
 <9b1e7330-f4f6-47f8-a568-eaea1624bb6f@web.de>
 <37647c33-7f9d-4763-8bf4-cfc5c9a811de@mailbox.org>
 <c5f1a7bf-b444-4934-a205-3c2b3a045ff7@web.de>
 <dd300771-851f-4cfb-b9a2-d87d2b4399aa@mailbox.org>
 <93cfabee-9692-491c-8d38-dec142e90252@web.de>
From: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
In-Reply-To: <93cfabee-9692-491c-8d38-dec142e90252@web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 38e99d7ff20122c4020
X-MBO-RS-META: h6ub15cgqr57uqbao87qcbq61xrf345r
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
Cc: LKML <linux-kernel@vger.kernel.org>, cocci@inria.fr
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2024-01-03 19:08, Markus Elfring wrote:
> 
>> Without seeing the actual Coccinelle report,
> 
> There is no “official” report according to the discussed patch which is triggered
> by known advices for the application of labels in goto chains.

The commit log says:

 This issue was detected by using the Coccinelle software.

Either that's inaccurate then, or you should be able to provide the corresponding output from Coccinelle.


-- 
Earthling Michel Dänzer            |                  https://redhat.com
Libre software enthusiast          |         Mesa and Xwayland developer

