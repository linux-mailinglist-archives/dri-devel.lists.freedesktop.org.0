Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AC527BCDCF
	for <lists+dri-devel@lfdr.de>; Sun,  8 Oct 2023 12:38:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10E9710E0D5;
	Sun,  8 Oct 2023 10:38:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org
 [IPv6:2001:67c:2050:0:465::102])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9B9C10E0D5
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Oct 2023 10:38:00 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4S3JXP25rTz9sm9;
 Sun,  8 Oct 2023 12:37:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1696761477;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5+tuAv/pj1ZLoJ+t+m4/ES6isn8uzyLyzOkk5zYx4lA=;
 b=hzTe0Zq01gQD9CzgUJqcB/br00AeG0hN0uw/e5uxxBoHWrs/Th6tRXnudiL0nnU/cqeOg2
 66UzxLrHsqKriW3cUf9p0fq668pjmO++UaqeYdMMn95HD//At3bo6BvYVnNZP3wQQb/l89
 HAnsUovoGzQUpAFdddTHAPsOU1cGA1Q7arTpR5vXcOMs+XJJ66Fastr3woe4U1JkBHTQUg
 i+flkB5z2mezZbn1wOY0y6055n7fLbdsOnN8apotegnkBJcNsiguLgeZdPQo7gVUumJd9I
 pqfrIZbsNpkQmL1sAVtcqMo1COmfanJP1qcq6dxPc82SVp5m85pPpmLecRqo7Q==
Message-ID: <87fe01dc-94f9-86b5-1718-de5df928d11c@mailbox.org>
Date: Sun, 8 Oct 2023 12:37:54 +0200
MIME-Version: 1.0
Subject: Re: [PATCH] drm/atomic: Perform blocking commits on workqueue
Content-Language: de-CH-frami, en-CA
To: Ray Strode <halfline@gmail.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20230926170549.2589045-1-halfline@gmail.com>
 <ZR6IlVR-A5KtIHEU@phenom.ffwll.local>
 <CAA_UwzL=2PjeH_qW2GJa_XzJCeWkz9NcokPQX3-qn2f0iPz+Rw@mail.gmail.com>
 <90e7f66f-96bf-4e90-88c8-75019bc506a4@amd.com>
 <CAA_UwzJ7q8aq_iw3wimeQXmvKp8Z253J7oqi3UQqcKdkRmAcAA@mail.gmail.com>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel.daenzer@mailbox.org>
In-Reply-To: <CAA_UwzJ7q8aq_iw3wimeQXmvKp8Z253J7oqi3UQqcKdkRmAcAA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: qn598uiika5qc5z6q8aofj6bectos8oz
X-MBO-RS-ID: a4dae9d635a972d67e4
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

On 10/6/23 20:48, Ray Strode wrote:
> 
> Note, a point that I don't think has been brought up yet, too, is
> the system unbound workqueue doesn't run with real time priority.
> Given the lion's share of mutter's drmModeAtomicCommit calls are
> nonblock, and so are using the system unbound workqueue for handling
> the commits, even without this patch, that somewhat diminishes the
> utility of using a realtime thread anyway. I believe the original
> point of the realtime thread was to make sure mouse cursor motion
> updates are as responsive as possible, because any latency there is
> something the user really feels.

Mutter's KMS thread needs to be real-time so that it can reliably schedule its work building up to calling the atomic commit ioctl for minimal input → output latency. That some of the ioctl's own work doesn't run at the same priority doesn't necessarily matter for this, as long as it can hit the next vertical blank period.

BTW, I understand kwin has or is planning to get a real-time KMS thread as well, for the same reasons.


> Maybe there needs to be a different mechanism in place to make sure
> user perceived interactivity is given priority.

The only alternative I'm aware of having been discussed so far is allowing atomic commits to be amended. I don't think that would be a great solution for this issue though, as it would result in Wayland compositors wasting CPU cycles (in other words, energy) for constant amendments of atomic commits, in the hope that one of them results in good latency.


-- 
Earthling Michel Dänzer            |                  https://redhat.com
Libre software enthusiast          |         Mesa and Xwayland developer

