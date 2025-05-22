Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF423AC0D0F
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 15:42:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 444F410EE43;
	Thu, 22 May 2025 13:42:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ObjMY9jM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B57010EE13;
 Thu, 22 May 2025 13:42:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C5E915C57A4;
 Thu, 22 May 2025 13:39:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AF16C4CEED;
 Thu, 22 May 2025 13:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747921324;
 bh=aefwlKfamE6DcffrjNWnfeFHK+8y3ocMVzuWPfH954s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ObjMY9jM8+iR0WfaQGVtqUs8mWYuWJLr19dnGRpII49sMuQT0btj1FoAvJsQNfIT0
 0GH+iILZyxixLeDBM1bjjRpV3Szg3hMtglKlC9VE+PdJ+BWB1OMPKGAeyEdwFtfCmx
 2EU4RIebtM5oLlIrL+RJHEXTX+45JcNdxJ6B+Ja5UBEkiz5wV1F9UT/tNSCjazYv0X
 6wDeSwFBTwrS2LDGMBkOA/Z+we1vvKq3g9yrKjujeCE2L0eGvky1NAM41DeYx+Kxul
 WE3JIjr1cOhpr35d3hawVY/xNrAZ88LfnUHHxAa8yWFSE4mM1sAls6nm3JnMJwCiOL
 aznOAGZ/eoVrQ==
Date: Thu, 22 May 2025 15:41:59 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: phasta@kernel.org, Lyude Paul <lyude@redhat.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH 2/2] drm/nouveau: Don't signal when killing the fence
 context
Message-ID: <aC8pp1tOUkikGPKx@pollux>
References: <20250522112540.161411-2-phasta@kernel.org>
 <20250522112540.161411-3-phasta@kernel.org>
 <af03b541-0b69-4b3d-b498-b68e0beb3dcb@amd.com>
 <06210b9dc5e5ea8365295b77942c3ca030f02729.camel@mailbox.org>
 <eae0ff0f-31a6-433a-b255-9bdb4727a940@amd.com>
 <aC8fpEXYWZ9Oy41J@pollux>
 <ebedece4-9758-47e9-b621-37b40e3f0fc3@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ebedece4-9758-47e9-b621-37b40e3f0fc3@amd.com>
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

On Thu, May 22, 2025 at 03:09:49PM +0200, Christian König wrote:
> On 5/22/25 14:59, Danilo Krummrich wrote:
> > On Thu, May 22, 2025 at 02:34:33PM +0200, Christian König wrote:
> >> See all the functions inside include/linux/dma-fence.h can be used by everybody. It's basically the public interface of the dma_fence object.
> > 
> > As you write below, in certain cases it is valid to call this from drivers, so
> > it's not unreasonable to have it as part of the public API.
> 
> The question is from which drivers?

Well, any driver that uses it to check its own fences, as you say below.

> >> So testing if a fence is signaled without calling the callback is only allowed by whoever implemented the fence.
> >>
> >> In other words nouveau can test nouveau fences, i915 can test i915 fences, amdgpu can test amdgpu fences etc... But if you have the wrapper that makes it officially allowed that nouveau starts testing i915 fences and that would be problematic.
> > 
> > In general, I like the  __dma_fence_is_signaled() helper, because this way we
> > can document in which cases it is allowed to be used, i.e. the ones you descibe
> > above.
> > 
> > test_bit() can be called by anyone and there is no documentation comment
> > explaining that it is only allowed under certain conditions.
> 
> That's a rather good argument.
> 
> > Having the __dma_fence_is_signaled() helper properly documented could get you
> > rid of having to explain in which case the test_bit() dance is allowed to do
> > over and over again. :-)
> 
> That's an even better argument. 
> 
> > I also think the name is good, since the '__' prefix already implies that there
> > are some restrictions on the use of this helper.
> 
> I'm still hesitating. Adding something to the API always made it usable by everybody.

You can't prevent that, the test_bit() dance can be done by anyone, but you can
document it properly with this helper. :-)
