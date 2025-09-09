Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA67B503BD
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 19:03:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD9E110E045;
	Tue,  9 Sep 2025 17:03:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="fr0YJ/+b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C30410E045;
 Tue,  9 Sep 2025 17:03:13 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4cLqrs57vcz9srv;
 Tue,  9 Sep 2025 19:03:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1757437389;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gnh3nnJLJ8fXDV4kePhARQNJMcnDJTqzyVMTCig6qPE=;
 b=fr0YJ/+bggFcJo82CjN6JWjO8psf23xB6n+MrlSvJE3ToQp85r93euMtYss/xubFlUd6Tn
 DFFwG+s4rZY6xoLUdzN3e5ew6AdDyhD4kqKVKXip994zzVqEWTS5LhG1ne8dN+ivxckHyq
 1GFlM0wpPYmgpTxypJ7ApcuOw7oASXRJG46ltRxBD1Jxu/MDrw8C+UHhqVbiJ1QxoA8NTy
 zCXh6ppFc5DWsD1EDHgUWQF+4quqARadws4UcK8UKvXwUmEz7BCYrtCk6nTFUK2+awd8aY
 IIsA88Xs8EvWNMA+ScxRg5APcwVKfNTCE6xzzlgm64TAj5NLZdIhu/ETnxTInA==
Message-ID: <1474accb-5b98-4b2d-9cd1-b7d1ed2f20a3@mailbox.org>
Date: Tue, 9 Sep 2025 19:03:08 +0200
MIME-Version: 1.0
Subject: Re: [PATCH] drm/radeon: use dev_warn_once() in CS parsers
From: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
To: Alex Deucher <alexander.deucher@amd.com>
Cc: "Borislav Petkov (AMD)" <bp@alien8.de>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20250902165332.2388864-1-alexander.deucher@amd.com>
 <34f2f0d9-dd77-41f4-b0bc-83b591238708@mailbox.org>
Content-Language: en-CA
In-Reply-To: <34f2f0d9-dd77-41f4-b0bc-83b591238708@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: spqt3mad99fg8tknj73w4hieckgwfixm
X-MBO-RS-ID: a4d491523511580fb04
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

On 09.09.25 18:06, Michel Dänzer wrote:
> On 02.09.25 18:53, Alex Deucher wrote:
>> Older GPUs did not support memory protection, so the kernel
>> driver would validate the command submissions (CS) from userspace
>> to avoid the GPU accessing any memory it shouldn't.
>>
>> Change any error messages in that validatio to dev_warn_once() to
>> avoid spamming the kernel log in the event of a bad CS.  If users
>> see any of these messages they should report them to the user space
>> component, which in most cases is mesa
>> (https://gitlab.freedesktop.org/mesa/mesa/-/issues).
> 
> As discussed in the "evergreen_packet3_check:... radeon 0000:1d:00.0: vbo resource seems too big for the bo" thread, based on similar rationale, these should arguably rather use some (preferably non-once) dbg variant.

While dev_warn_once might really be the best compromise for the specific case discussed in that other thread, my argument still applies to other cases which are followed by returning an error to user space, since that surely results in a corresponding user-space failure.


-- 
Earthling Michel Dänzer       \        GNOME / Xwayland / Mesa developer
https://redhat.com             \               Libre software enthusiast
