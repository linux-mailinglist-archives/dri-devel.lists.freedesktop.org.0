Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D80E6A748DF
	for <lists+dri-devel@lfdr.de>; Fri, 28 Mar 2025 12:01:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E64010E9E4;
	Fri, 28 Mar 2025 11:01:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="R/9r3fIP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A39410E9E3;
 Fri, 28 Mar 2025 11:01:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id C3B04614B4;
 Fri, 28 Mar 2025 11:01:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6976AC4CEE4;
 Fri, 28 Mar 2025 11:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743159702;
 bh=4vR8XRswEcbeL+RPvYmMfrweBQ190iuWvm0Je9EsKYk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=R/9r3fIPYj/ps3KXy1Z6/3LE2y6u43k3U039GsWELz8dEOKJ7+SCoLif7Bca5eyxU
 A1qBazYDMi6pJdhU3nkmawkR1TmGh4PnGgOUP+OP4tezzTlv9xBCy52Vp4ajIGrGfo
 ya1XNLi0xNiNiBJO3s7Qv3+Dw+W8Fn8ekOoZGwooQiP0PmNMKcL+jHl1dsOFRPyjYv
 oAHZeOWB5dqy/CyUkY8w2CJTISMkryuvbaeWYpZTMTbNpQBT5Z6giZKLNE+zX8GaUG
 MU+WS7RJrBymSIRHcR78Ste4fouYaYTcM3AHb66Yb/6VteeANa1GqtwPembSnOkHcd
 6MrbuUd3BqKyQ==
Date: Fri, 28 Mar 2025 12:01:37 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: Chris Bainbridge <chris.bainbridge@gmail.com>
Cc: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 nouveau@lists.freedesktop.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, lyude@redhat.com, sumit.semwal@linaro.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/prime: fix drm_prime_gem_destroy comment
Message-ID: <Z-aBkc2p5BZLrBJH@pollux>
References: <Z9GHj-edWJmyzpdY@debian.local>
 <00e4d9c4-ecfc-4784-b603-12db04cda806@amd.com>
 <Z9q-ggKKgTsvW-Rz@debian.local> <Z9rA0G2urlVHFOSx@cassiopeiae>
 <1f4a534f-8883-4793-b191-60c2773f6217@amd.com>
 <Z9rSTkXlub-JZAz0@cassiopeiae> <Z-P4zQ1464SeZGmB@debian.local>
 <94eeb36a-9aa5-4afd-9ba6-76e8ace10122@amd.com>
 <Z-P84iMUP4NBAY7k@debian.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z-P84iMUP4NBAY7k@debian.local>
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

On Wed, Mar 26, 2025 at 01:10:58PM +0000, Chris Bainbridge wrote:
> Edit the comments on correct usage of drm_prime_gem_destroy to note
> that, if using TTM, drm_prime_gem_destroy must be called in the
> ttm_buffer_object.destroy hook, to avoid the dma_buf being freed leaving
> a dangling pointer which will be later dereferenced by
> ttm_bo_delayed_delete.
> 
> Signed-off-by: Chris Bainbridge <chris.bainbridge@gmail.com>
> Suggested-by: Christian König <christian.koenig@amd.com>

Can you please send new version of patches as a new mail thread (not in reply to
previous versions) please?

Otherwise,

	Reviewed-by: Danilo Krummrich <dakr@kernel.org>

@Christian, I assume you will pick this one up?
