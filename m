Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 68EA6533DE1
	for <lists+dri-devel@lfdr.de>; Wed, 25 May 2022 15:28:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07BBF10EA00;
	Wed, 25 May 2022 13:28:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org
 [IPv6:2001:67c:2050:0:465::102])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9CE610EA00
 for <dri-devel@lists.freedesktop.org>; Wed, 25 May 2022 13:28:48 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4L7X2j0JCbz9ssr;
 Wed, 25 May 2022 15:28:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1653485325;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aRQWRPkRkCsk8MA5HurITXUbflKlQ4WCJAgVg/vNYHk=;
 b=HO/tvAbhDOGVkDR3da/Ya/vEZi1mu2iAdJcq08PmEAlrtSsP9U/m4LQVZM+fk5M3j4n7TO
 QghFjVElgpTLVRc6mgQt9M3Jos4R4Z+CSDyz1MP25QCyGHcxjYZrmXUiqNxwgmGIleGeif
 JdbZd8vDyLntbeceJYQ+NuCdI7cIV61d5aiMbrcEixkOkN42TMNHepRybX/JbYBZxPQNGU
 sIGhpuHPPidUcXvJBh0HOYnyozabG2S70Vh6dqTWnNvOW7opWVUlMNohy1fxFfz9sq6F4G
 qzbkYfq7JRk1iIgSSCzHWWc9wmpHfAqCdZn0Bcmy24nDwKKeIOkzWK3A79KiGw==
Message-ID: <19808e9e-a5a6-c878-a2f7-5b33444f547d@mailbox.org>
Date: Wed, 25 May 2022 15:28:41 +0200
MIME-Version: 1.0
Subject: Re: Tackling the indefinite/user DMA fence problem
Content-Language: en-CA
To: Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <20220502163722.3957-1-christian.koenig@amd.com>
 <YnJQs1iusrBvpuMs@phenom.ffwll.local>
 <a01c7703-f7f7-f8ce-f80e-632a6fdcbbbe@gmail.com>
 <Ynkg81p6ADyZBa/L@phenom.ffwll.local>
 <a249c0c4-ee6c-bfb0-737b-eb6afae29602@amd.com>
 <Yo4pin1Js4KXs2HL@phenom.ffwll.local>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel.daenzer@mailbox.org>
In-Reply-To: <Yo4pin1Js4KXs2HL@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 8fobohk8h85i8nfr1u7m7beikuii4hc6
X-MBO-RS-ID: acba8404cc4e0ad8a77
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
Cc: tvrtko.ursulin@linux.intel.com, sergemetral@google.com, gustavo@padovan.org,
 Felix.Kuehling@amd.com, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, maad.aldabagh@amd.com, tzimmermann@suse.de,
 alexander.deucher@amd.com, daniels@collabora.com, skhawaja@google.com,
 sumit.semwal@linaro.org, jason@jlekstrand.net, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-05-25 15:05, Daniel Vetter wrote:
> On Tue, May 17, 2022 at 12:28:17PM +0200, Christian König wrote:
>> Am 09.05.22 um 16:10 schrieb Daniel Vetter:
>>> On Mon, May 09, 2022 at 08:56:41AM +0200, Christian König wrote:
>>>> Am 04.05.22 um 12:08 schrieb Daniel Vetter:
>>>>>
>>>>> If the goal is specifically atomic kms, then there's an entire can of
>>>>> worms there that I really don't want to think about, but it exists: We
>>>>> have dma_fence as out-fences from atomic commit, and that's already
>>>>> massively broken since most drivers allocate some memory or at least take
>>>>> locks which can allocate memory in their commit path. Like i2c. Putting a
>>>>> userspace memory fence as in-fence in there makes that problem
>>>>> substantially worse, since at least in theory you're just not allowed to
>>>>> might_faul in atomic_commit_tail.
>>>> Yes, that's unfortunately one of the goals as well and yes I completely
>>>> agree on the can of worms. But I think I've solved that.
>>>>
>>>> What I do in the patch set is to enforce that the out fence is an user fence
>>>> when the driver supports user in fences as well.
>>>>
>>>> Since user fences doesn't have the memory management dependency drivers can
>>>> actually allocate memory or call I2C functions which takes locks which have
>>>> memory allocation dependencies.
>>>>
>>>> Or do I miss some other reason why you can't fault or allocate memory in
>>>> atomic_commit_tail? At least lockdep seems to be happy about that now.
>>> The problem is a bit that this breaks the uapi already. At least if the
>>> goal is to have this all be perfectly transparent for userspace - as you
>>> as you have multi-gpu setups going on at least.
>>
>> Question here is why do you think there is an UAPI break? We currently wait
>> in a work item already, so where exactly is the problem?
> 
> It's a bit washy, but dma_fence and hence implicit sync is supposed to
> finish in finite time. umf just doesn't.
> 
> Ofc in reality you can still flood your compositor and they're not very
> robust, but with umf it's trivial to just hang your compositor forever and
> nothing happens.

You can add that to the list of reasons why compositors need to stop using buffers with unsignaled fences. There's plenty of other reasons there already (the big one being that otherwise slow clients can slow down the compositor, even if the compositor uses a high priority context and the HW supports preemption).


-- 
Earthling Michel Dänzer            |                  https://redhat.com
Libre software enthusiast          |         Mesa and Xwayland developer
