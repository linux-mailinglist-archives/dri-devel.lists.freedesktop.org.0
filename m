Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IMDTLcmhjWlh5gAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 10:47:53 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E967312C008
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 10:47:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3235810E714;
	Thu, 12 Feb 2026 09:47:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=zohomail.com header.i=mhklkml@zohomail.com header.b="J1dOAx8m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 904 seconds by postgrey-1.36 at gabe;
 Wed, 11 Feb 2026 23:16:26 UTC
Received: from sender4-pp-o97.zoho.com (sender4-pp-o97.zoho.com
 [136.143.188.97])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 220A410E18F
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Feb 2026 23:16:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1770850875; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=LwxA8sJafi9WFL5Q0ruLOFqdyD9oE0ts03eJlUHHir2xssUSbYW1i5KcYDzOQ0YmoyfShIZ6pZUiXNfN6f90FPie2MWS47kid9y79kyOBu9AJUcG1fFjWLsGK+jBy/lDz3SUnmKuv9gQH6OaWbYK77UxdtCEOyIQuTsIKO+Oikk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1770850875;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=/v4IpnBx8AesptYQpTGBnp5aGZXOHZnGRAcZx9o9l6c=; 
 b=dV2WuD179DhT7Bt+cPu6Sv1Ab2EhoUX4sHncFfxbtvuyiB7y2o5Aw9+llsTay434BVZErTnQFphMTPit1ug/JKQyPC/flzzBPW5AYG1MXn5u1ld2HHP236Ab29fGQMZ6tHtn3rkgvZc62S7jCyeeRMclP/Edob2UWmdhsWRqm/g=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=zohomail.com;
 spf=pass  smtp.mailfrom=mhklkml@zohomail.com;
 dmarc=pass header.from=<mhklkml@zohomail.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1770850875; 
 s=zm2022; d=zohomail.com; i=mhklkml@zohomail.com;
 h=From:From:To:To:Cc:Cc:References:In-Reply-To:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Feedback-ID:Message-Id:Reply-To;
 bh=/v4IpnBx8AesptYQpTGBnp5aGZXOHZnGRAcZx9o9l6c=;
 b=J1dOAx8mMywlm6cUalzSFGXFw5PHe49Lyls+bTq2Wak/46lGSr+5EdH7Zh24qNxc
 HC6HbjIVu1imlntGPe2eV4F7vEgGqCezrJeupz30k9ktGns/eHegVcsHiXsLm7Dl40T
 3BrmQCAZsjm8dlI+nQFZqkDRnJuB1RoA6cl3bW0w=
Received: by mx.zohomail.com with SMTPS id 1770850873502363.73321615779025;
 Wed, 11 Feb 2026 15:01:13 -0800 (PST)
From: <mhklkml@zohomail.com>
To: "'Jocelyn Falempe'" <jfalempe@redhat.com>, <mhklinux@outlook.com>,
 <drawat.floss@gmail.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <simona@ffwll.ch>, <kys@microsoft.com>, <haiyangz@microsoft.com>,
 <wei.liu@kernel.org>, <decui@microsoft.com>, <longli@microsoft.com>,
 <ryasuoka@redhat.com>
Cc: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <linux-hyperv@vger.kernel.org>, <stable@vger.kernel.org>
References: <20260209070201.1492-1-mhklinux@outlook.com>
 <20260209070201.1492-2-mhklinux@outlook.com>
 <a5372b72-8dc0-4f2d-ad5c-086f3e75ee81@redhat.com>
In-Reply-To: <a5372b72-8dc0-4f2d-ad5c-086f3e75ee81@redhat.com>
Subject: RE: [PATCH 2/2] drm/hyperv: During panic do VMBus unload after frame
 buffer is flushed
Date: Wed, 11 Feb 2026 15:01:09 -0800
Message-ID: <002601dc9baa$517d8b40$f478a1c0$@zohomail.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-us
Thread-Index: AQJO9nqM+3PSL28VGf9uaee72s+bfQD8X2UsAcZTyQS0g09e4A==
Feedback-ID: rr080112276f0bff552fa972c91e69bbc60000e8c5825fb1e45bc2f26668e518962c583bee303c4ddbc88c1f:zu080112270d1c11740cd942b4e357bf9c000070af211c092d8af91d7479311df3c99054c758bc409412f527:rf08011226531496a33a4b9bfb5b113bd40000f39f2acda6414885ed869a26970cd68ab6a548dd3bef5a06:ZohoMail
X-ZohoMailClient: External
X-Mailman-Approved-At: Thu, 12 Feb 2026 09:47:42 +0000
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[zohomail.com:s=zohoarc:i=1];
	DMARC_POLICY_ALLOW(-0.50)[zohomail.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[zohomail.com:s=zm2022];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jfalempe@redhat.com,m:mhklinux@outlook.com,m:drawat.floss@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:kys@microsoft.com,m:haiyangz@microsoft.com,m:wei.liu@kernel.org,m:decui@microsoft.com,m:longli@microsoft.com,m:ryasuoka@redhat.com,m:linux-kernel@vger.kernel.org,m:linux-hyperv@vger.kernel.org,m:stable@vger.kernel.org,m:drawatfloss@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_TO(0.00)[redhat.com,outlook.com,gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,microsoft.com];
	FORGED_SENDER(0.00)[mhklkml@zohomail.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[mhklkml@zohomail.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[zohomail.com:+];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[outlook.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: E967312C008
X-Rspamd-Action: no action

From: Jocelyn Falempe <jfalempe@redhat.com> Sent: Wednesday, February 11, 2026 1:54 PM
> 
> On 09/02/2026 08:02, mhkelley58@gmail.com wrote:
> > From: Michael Kelley <mhklinux@outlook.com>
> >
> > In a VM, Linux panic information (reason for the panic, stack trace,
> > etc.) may be written to a serial console and/or a virtual frame buffer
> > for a graphics console. The latter may need to be flushed back to the
> > host hypervisor for display.
> >
> > The current Hyper-V DRM driver for the frame buffer does the flushing
> > *after* the VMBus connection has been unloaded, such that panic messages
> > are not displayed on the graphics console. A user with a Hyper-V graphics
> > console is left with just a hung empty screen after a panic. The enhanced
> > control that DRM provides over the panic display in the graphics console
> > is similarly non-functional.
> >
> > Commit 3671f3777758 ("drm/hyperv: Add support for drm_panic") added
> > the Hyper-V DRM driver support to flush the virtual frame buffer. It
> > provided necessary functionality but did not handle the sequencing
> > problem with VMBus unload.
> >
> > Fix the full problem by using VMBus functions to suppress the VMBus
> > unload that is normally done by the VMBus driver in the panic path. Then
> > after the frame buffer has been flushed, do the VMBus unload so that a
> > kdump kernel can start cleanly. As expected, CONFIG_DRM_PANIC must be
> > selected for these changes to have effect. As a side benefit, the
> > enhanced features of the DRM panic path are also functional.
> 
> Thanks for properly fixing this issue with DRM Panic on hyperv.
> 
> I've a small comment below.
> 
> With that fixed:
> Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
> 
> The first patch looks good too, I can review it if no other step up, as
> I'm not familiar with hyperv.
> 
> >
> > Fixes: 3671f3777758 ("drm/hyperv: Add support for drm_panic")
> > Signed-off-by: Michael Kelley <mhklinux@outlook.com>
> > ---
> >   drivers/gpu/drm/hyperv/hyperv_drm_drv.c     |  4 ++++
> >   drivers/gpu/drm/hyperv/hyperv_drm_modeset.c | 15 ++++++++-------
> >   2 files changed, 12 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
> b/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
> > index 06b5d96e6eaf..79e51643be67 100644
> > --- a/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
> > +++ b/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
> > @@ -150,6 +150,9 @@ static int hyperv_vmbus_probe(struct hv_device *hdev,
> >   		goto err_free_mmio;
> >   	}
> >
> > +	/* If DRM panic path is stubbed out VMBus code must do the unload */
> > +	if (IS_ENABLED(CONFIG_DRM_PANIC) && IS_ENABLED(CONFIG_PRINTK))
> 
> I think drm_panic should still work without printk.
> The "user" panic screen would be unaffected, but the "kmsg" screen might
> be blank, and the "qr_code" would generate an empty qr code.
> (Actually I never tried to build a kernel without printk).

Yeah, I had never built such a kernel either until recently when the kernel
test robot flagged an error in Hyper-V code when CONFIG_PRINTK is not set. :-) 

But for this patch, the issue is that drm_panic() never gets called if CONFIG_PRINTK
isn't set. In that case, kmsg_dump_register() is a stub that returns an error.  So
drm_panic_register() never registers the callback to drm_panic(). And if
drm_panic() isn't going to run, responsibility for doing the VMBus unload
must remain with the VMBus code. It's hard to actually test this case because
of depending on printk() for debugging output, so double-check my
thinking.

Michael

> 
> > +		vmbus_set_skip_unload(true);
> >   	drm_client_setup(dev, NULL);
> >
> >   	return 0;

