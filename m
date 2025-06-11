Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEAD9AD6120
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jun 2025 23:22:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 918B110E733;
	Wed, 11 Jun 2025 21:21:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="OTSRUEzC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EA1510E736;
 Wed, 11 Jun 2025 21:21:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 60018A519F7;
 Wed, 11 Jun 2025 21:21:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D853FC4CEE3;
 Wed, 11 Jun 2025 21:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749676908;
 bh=wSMLjnF4pKnpfzQ8bFRhw7tIJS06byplGjawAcKIzzU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OTSRUEzCXgmDlV3m3QtQT20fJPvNpen1FjCqD4ysMWKuFWjzimOKnySKlHyk5kYzW
 SeGHos3mjXNnm3D5nAfJBPR+cOnCENdcxTSnsEZ6/6VbI+TfnlITTw4EXqWcJVVfSC
 nJp6T6ny03ByAes9uo52wHQuP6foUMSXaBcO+4IAnMub0GvisoWLmkm7m/EDHcMSca
 CAr0wXqUjdmgPh3jYHd6ybotbrjDBrkBM25mrbek3GMo9Y7mixVh8+iF+gV+PQYQBi
 b93kONbDqb/t09IgDC0qlv4xBpkYMFTwuDP/sZtxvq151C6sRKL/nZYPdAydbSWlSi
 HuQ4KwqHgasqA==
Date: Wed, 11 Jun 2025 23:21:42 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: phasta@kernel.org, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Lyude Paul <lyude@redhat.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Matthew Brost <matthew.brost@intel.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [RFC PATCH 0/6] drm/sched: Avoid memory leaks by canceling
 job-by-job
Message-ID: <aEnzZts6acAtg3IX@cassiopeiae>
References: <20250603093130.100159-2-phasta@kernel.org>
 <fae980fa-e173-4921-90e2-6a4f6b8833a8@igalia.com>
 <8256799772c200103124c0c10490a9c1db04e355.camel@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8256799772c200103124c0c10490a9c1db04e355.camel@mailbox.org>
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

> On Tue, 2025-06-03 at 13:27 +0100, Tvrtko Ursulin wrote:
> > On 03/06/2025 10:31, Philipp Stanner wrote:
> > What I am not that ecstatic about is only getting the Suggested-by 
> > credit in 1/6. Given it is basically my patch with some cosmetic
> > changes 
> > like the kernel doc and the cancel loop extracted to a helper.
> 
> Sign the patch off and I give you the authorship if you want.

AFAICS, the proposal of having cancel_job() has been a review comment which has
been clarified with a reference patch.

IMO, the fact that after some discussion Philipp decided to go with this
suggestion and implement the suggestion in his patch series does not result in
an obligation for him to hand over authorship of the patch he wrote to the
person who suggested the change in the context of the code review.

Anyways, it seems that Philipp did offer it however, so this seems to be
resolved?
