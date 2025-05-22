Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F56AC0D1A
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 15:44:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CCBD10EB01;
	Thu, 22 May 2025 13:44:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="j/4N1Uj1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AB5B10EB01;
 Thu, 22 May 2025 13:44:02 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org
 [IPv6:2001:67c:2050:b231:465::202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4b38dq2Y6Dz9tm8;
 Thu, 22 May 2025 15:43:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1747921439; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bIJnvIa/3Jg8aseopOpG6NZGewhauVo4xSa65DTl6Lc=;
 b=j/4N1Uj1pxTvp+9++CpwUW7n6iU3QIss/sZ4y2driv53w6ZAboqFy7Yn8LU0pT+8306Tdn
 E8FcvGFLbqVGO+xe8uPHXCWPgJBK+9ubVj4isn/agviHD2QSCfo7O+j9eEfVpsCjZ9kIzk
 Q4xnIWGnQ1Yc2OTtX0fNw5az4sntOkaXBNPDZZMMUmTncb6xkRQBiw6fZN3rSAJ0DVkMy3
 r5moh98TLUsbWuRQCLidncXcRao4r5gcFwkhzfEsHVcGZR0JG43xF0oYFoloXp9kGHwgw6
 H2tuMB4u4+nZC3AQ5yREkvO/QAGbJBmf/bflePZfEH1pJ8EwRdZbW55vYYUK4A==
Message-ID: <3dda25c3108747bf1c7ab2974b2429a26f0762d0.camel@mailbox.org>
Subject: Re: [PATCH 2/2] drm/nouveau: Don't signal when killing the fence
 context
From: Philipp Stanner <phasta@mailbox.org>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, 
 phasta@kernel.org, Danilo Krummrich <dakr@kernel.org>
Cc: Lyude Paul <lyude@redhat.com>, David Airlie <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>, 
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Date: Thu, 22 May 2025 15:43:56 +0200
In-Reply-To: <dcc9f52a-4f46-4f24-bb33-b3af583a1956@amd.com>
References: <20250522112540.161411-2-phasta@kernel.org>
 <20250522112540.161411-3-phasta@kernel.org>
 <af03b541-0b69-4b3d-b498-b68e0beb3dcb@amd.com>
 <06210b9dc5e5ea8365295b77942c3ca030f02729.camel@mailbox.org>
 <eae0ff0f-31a6-433a-b255-9bdb4727a940@amd.com> <aC8fpEXYWZ9Oy41J@pollux>
 <ebedece4-9758-47e9-b621-37b40e3f0fc3@amd.com>
 <282de2b9251e3a1b793e02ef23675dace248725b.camel@mailbox.org>
 <dcc9f52a-4f46-4f24-bb33-b3af583a1956@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: c2dc99f67bb1c59b743
X-MBO-RS-META: aew4iha5nipx3gxxwrb9xtkauejjr1xe
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

On Thu, 2025-05-22 at 15:24 +0200, Christian K=C3=B6nig wrote:
> On 5/22/25 15:16, Philipp Stanner wrote:
> > On Thu, 2025-05-22 at 15:09 +0200, Christian K=C3=B6nig wrote:
> > > On 5/22/25 14:59, Danilo Krummrich wrote:
> > > > On Thu, May 22, 2025 at 02:34:33PM +0200, Christian K=C3=B6nig
> > > > wrote:
> > > > > See all the functions inside include/linux/dma-fence.h can be
> > > > > used by everybody. It's basically the public interface of the
> > > > > dma_fence object.
> > > >=20
> > > > As you write below, in certain cases it is valid to call this
> > > > from
> > > > drivers, so
> > > > it's not unreasonable to have it as part of the public API.
> > >=20
> > > The question is from which drivers?
> > >=20
> > > > > So testing if a fence is signaled without calling the
> > > > > callback is
> > > > > only allowed by whoever implemented the fence.
> > > > >=20
> > > > > In other words nouveau can test nouveau fences, i915 can test
> > > > > i915 fences, amdgpu can test amdgpu fences etc... But if you
> > > > > have
> > > > > the wrapper that makes it officially allowed that nouveau
> > > > > starts
> > > > > testing i915 fences and that would be problematic.
> > > >=20
> > > > In general, I like the=C2=A0 __dma_fence_is_signaled() helper,
> > > > because
> > > > this way we
> > > > can document in which cases it is allowed to be used, i.e. the
> > > > ones
> > > > you descibe
> > > > above.
> > > >=20
> > > > test_bit() can be called by anyone and there is no
> > > > documentation
> > > > comment
> > > > explaining that it is only allowed under certain conditions.
> > >=20
> > > That's a rather good argument.
> > >=20
> > > > Having the __dma_fence_is_signaled() helper properly documented
> > > > could get you
> > > > rid of having to explain in which case the test_bit() dance is
> > > > allowed to do
> > > > over and over again. :-)
> > >=20
> > > That's an even better argument.=20
> > >=20
> > > > I also think the name is good, since the '__' prefix already
> > > > implies that there
> > > > are some restrictions on the use of this helper.
> > >=20
> > > I'm still hesitating. Adding something to the API always made it
> > > usable by everybody.
> > >=20
> > > Now suddenly saying we add that to the include/linux/dma-fence.h
> > > header but only certainly code can use it still sounds
> > > questionable
> > > to me.
> >=20
> > If I understand the current code correctly, the documentation state
> > and
> > the question "which driver is allowed to do it?" is the same,
> > because
> > the documentation for the signaled callback doesn't specify that:
> >=20
> >=20
> > 	/**
> > 	 * @signaled:
> > 	 *
> > 	 * Peek whether the fence is signaled, as a fastpath
> > optimization for
> > 	 * e.g. dma_fence_wait() or dma_fence_add_callback(). Note
> > that this
> > 	 * callback does not need to make any guarantees beyond
> > that a fence
> > 	 * once indicates as signalled must always return true
> > from this
> > 	 * callback. This callback may return false even if the
> > fence has
> > 	 * completed already, in this case information hasn't
> > propogated throug
> > 	 * the system yet. See also dma_fence_is_signaled().
> > 	 *
> > 	 * May set &dma_fence.error if returning true.
> > 	 *
> > 	 * This callback is optional.
> > 	 */
> > 	bool (*signaled)(struct dma_fence *fence);
> >=20
> >=20
> > "optional". What if I don't ipmlement it? Who should implement it?
> >=20
> > If the callback is optional, then dma_fence_is_signaled() is the
> > same
> > as __dma_fence_is_signaled().
> >=20
> > IOW, it already needs to be better documented who needs to
> > implement
> > the callback and who doesn't. If we get clarity on that, we also
> > get
> > clarity on who may use __dma_fence_is_signaled().
>=20
> Well there is no need to implement it, but when it is implemented the
> caller *must* call it when polling.

I don't understand. Please elaborate on that a bit more. If there's no
need to implement it, then why can't one have a
__dma_fence_is_signaled(), which is then identical?

>=20
> IIRC the background that we didn't allowed this was that we already
> had the case that users only looked at the signaling bit and then
> where surprised that it never changed.

Why would anyone expect that a fence gets signaled by calling a
function with the name "dma_fence_is_signaled()"? :-)

That was my original point, the name is not intuitive at all.

For example, if a driver doesn't implement that callback but signals
fences in interrupt handlers, and then forgets to (re-)activate the
interrupt, fences will never get signaled and callers to
dma_fence_is_signaled() will never read 'true', which isn't surprising.

Again, the point remains the same: the driver must guarantee that
fences will get signaled. Independently from how consumers of the fence
check it. Consumers could just stop calling dma_fence_is_signaled()
after the point in time T alltogether and then the driver would still
have to signal everything.


P.



>=20
> Regards,
> Christian.
>=20
> >=20
> >=20
> > P.
> >=20
> > >=20
> > > Regards,
> > > Christian.
> >=20
>=20

