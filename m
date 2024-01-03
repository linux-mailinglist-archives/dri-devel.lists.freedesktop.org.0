Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F8082331C
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jan 2024 18:18:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5B4610E33D;
	Wed,  3 Jan 2024 17:18:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org
 [IPv6:2001:67c:2050:0:465::202])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 295CA10E33D
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jan 2024 17:18:24 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4T4xJD4kg8z9skm;
 Wed,  3 Jan 2024 18:18:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1704302300;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H9Inf9KTIOOuafLHFpFPsLLmeqzoKAhBG4TxdZv4V1Q=;
 b=L5ziap7k4Dj1fDzmrDiEP3MQtfRJkXSqW1zOihLhFoM66qmPX2GRVM2E+dCJxeryvWYusI
 hap79P6ZYnJ/hCmd6ntFwOvpG5DHwxysEdfb7tbZdg2zKb12YhaQ9KpdQyPfN/E0qzGN73
 WMkHOEx0p1Ko0Iyg69wKhejZSoskh/1B+qcdgNBmaH1E4B57hriS+SWOSUqXH/dxLHAPXz
 1UYnMS/9YVQIr72bPE6mE9uMs/4UdLdV8SQbRTDz/pE3bdN4BtETzBw8I/0RNCOHM1iwXU
 bwfeDcVZGRexCLi0axE968wmxkcusuVdqPhR+jt+wQLcvgVmoOhEqRCyVSDjlA==
Message-ID: <dd300771-851f-4cfb-b9a2-d87d2b4399aa@mailbox.org>
Date: Wed, 3 Jan 2024 18:18:13 +0100
MIME-Version: 1.0
Subject: Re: [PATCH 1/3] drm: property: One function call less in
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
From: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
In-Reply-To: <c5f1a7bf-b444-4934-a205-3c2b3a045ff7@web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 51b942f4997b0e75b14
X-MBO-RS-META: 7gkhgojj8hqinqnum7czaaskymgcguyf
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

On 2024-01-03 17:24, Markus Elfring wrote:
> 
>> Out of curiosity, what exactly did Coccinelle report?
> 
> Some SmPL scripts from my own selection tend to point questionable implementation details out.

That doesn't answer my question.

Without seeing the actual Coccinelle report, I'll assume that it didn't actually call for this change.


-- 
Earthling Michel Dänzer            |                  https://redhat.com
Libre software enthusiast          |         Mesa and Xwayland developer

