Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B1D6AC0C84
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 15:16:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E2E110ECB7;
	Thu, 22 May 2025 13:16:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="ubolpMVR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62B2C10ECB7;
 Thu, 22 May 2025 13:16:32 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4b38251lNrz9tFZ;
 Thu, 22 May 2025 15:16:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1747919789; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2xY0ojqhuGBcKzHDlcpTqdk5F5P4zkhEB59bIyA/OVQ=;
 b=ubolpMVRg9ftBOJo2ByE6Gh0CtGNWIU4Uc0Aux6mIvl+Ze97x5YLo+34A6nlB5rooQNWYi
 JDko441+ZvW+EzSmD24mnxify0M592Iv9mKgemWy3Ka/pCUJys0YcuUJjzZopzPyC6NPoC
 xR5Bv/pfwQVMqsd9f589+MrozWiDiwio5xtwnvuKAxQiNnFvIds+nHCj2PUlNff0ywI+e4
 xX48IjaBDGJimuAdkaeoCQ4uKHfieEWjolVdXKTe/2cogNLO+IaP+IHK3xrv6RXmaKbUe6
 IpdTon4GXxpoyK8nE+zElOZBoLOmvSVAzrOmgyTpy5ezlsZYeReOl8g9yUt/+g==
Message-ID: <282de2b9251e3a1b793e02ef23675dace248725b.camel@mailbox.org>
Subject: Re: [PATCH 2/2] drm/nouveau: Don't signal when killing the fence
 context
From: Philipp Stanner <phasta@mailbox.org>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Danilo
 Krummrich <dakr@kernel.org>
Cc: phasta@kernel.org, Lyude Paul <lyude@redhat.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Sumit Semwal
 <sumit.semwal@linaro.org>, dri-devel@lists.freedesktop.org, 
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org
Date: Thu, 22 May 2025 15:16:25 +0200
In-Reply-To: <ebedece4-9758-47e9-b621-37b40e3f0fc3@amd.com>
References: <20250522112540.161411-2-phasta@kernel.org>
 <20250522112540.161411-3-phasta@kernel.org>
 <af03b541-0b69-4b3d-b498-b68e0beb3dcb@amd.com>
 <06210b9dc5e5ea8365295b77942c3ca030f02729.camel@mailbox.org>
 <eae0ff0f-31a6-433a-b255-9bdb4727a940@amd.com> <aC8fpEXYWZ9Oy41J@pollux>
 <ebedece4-9758-47e9-b621-37b40e3f0fc3@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: 3c2590ebf42a25dd418
X-MBO-RS-META: rtwsdkhdwdcmpueph13z64fnzp4ku9sf
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
Reply-To: phasta@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 2025-05-22 at 15:09 +0200, Christian K=C3=B6nig wrote:
> On 5/22/25 14:59, Danilo Krummrich wrote:
> > On Thu, May 22, 2025 at 02:34:33PM +0200, Christian K=C3=B6nig wrote:
> > > See all the functions inside include/linux/dma-fence.h can be
> > > used by everybody. It's basically the public interface of the
> > > dma_fence object.
> >=20
> > As you write below, in certain cases it is valid to call this from
> > drivers, so
> > it's not unreasonable to have it as part of the public API.
>=20
> The question is from which drivers?
>=20
> > > So testing if a fence is signaled without calling the callback is
> > > only allowed by whoever implemented the fence.
> > >=20
> > > In other words nouveau can test nouveau fences, i915 can test
> > > i915 fences, amdgpu can test amdgpu fences etc... But if you have
> > > the wrapper that makes it officially allowed that nouveau starts
> > > testing i915 fences and that would be problematic.
> >=20
> > In general, I like the=C2=A0 __dma_fence_is_signaled() helper, because
> > this way we
> > can document in which cases it is allowed to be used, i.e. the ones
> > you descibe
> > above.
> >=20
> > test_bit() can be called by anyone and there is no documentation
> > comment
> > explaining that it is only allowed under certain conditions.
>=20
> That's a rather good argument.
>=20
> > Having the __dma_fence_is_signaled() helper properly documented
> > could get you
> > rid of having to explain in which case the test_bit() dance is
> > allowed to do
> > over and over again. :-)
>=20
> That's an even better argument.=20
>=20
> > I also think the name is good, since the '__' prefix already
> > implies that there
> > are some restrictions on the use of this helper.
>=20
> I'm still hesitating. Adding something to the API always made it
> usable by everybody.
>=20
> Now suddenly saying we add that to the include/linux/dma-fence.h
> header but only certainly code can use it still sounds questionable
> to me.

If I understand the current code correctly, the documentation state and
the question "which driver is allowed to do it?" is the same, because
the documentation for the signaled callback doesn't specify that:


	/**
	 * @signaled:
	 *
	 * Peek whether the fence is signaled, as a fastpath optimization for
	 * e.g. dma_fence_wait() or dma_fence_add_callback(). Note that this
	 * callback does not need to make any guarantees beyond that a fence
	 * once indicates as signalled must always return true from this
	 * callback. This callback may return false even if the fence has
	 * completed already, in this case information hasn't propogated throug
	 * the system yet. See also dma_fence_is_signaled().
	 *
	 * May set &dma_fence.error if returning true.
	 *
	 * This callback is optional.
	 */
	bool (*signaled)(struct dma_fence *fence);


"optional". What if I don't ipmlement it? Who should implement it?

If the callback is optional, then dma_fence_is_signaled() is the same
as __dma_fence_is_signaled().

IOW, it already needs to be better documented who needs to implement
the callback and who doesn't. If we get clarity on that, we also get
clarity on who may use __dma_fence_is_signaled().


P.

>=20
> Regards,
> Christian.

