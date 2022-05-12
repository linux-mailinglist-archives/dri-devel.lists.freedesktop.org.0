Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3800F525487
	for <lists+dri-devel@lfdr.de>; Thu, 12 May 2022 20:15:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BDDA10E36A;
	Thu, 12 May 2022 18:15:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 086E010E36A;
 Thu, 12 May 2022 18:15:12 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 70AA021B15;
 Thu, 12 May 2022 18:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1652379310; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y5mM0HQM8pAQjku1w2nmlt4lHhMPdkzOuqIdXoLXS4Q=;
 b=E1bPL/RMWjkG/VM2r/nQONAtXYN0KRTYjM59dZnqMk2diAqQQ26BmNtFBmR2MijBvdoyuJ
 bKMni5HDVKOoLTsp4WrxKwQd9eMZGVzSXCq7M9PQy4GxRoswGggXG7aR9eUc085zzddpwQ
 ACpGrceWeQZbqz+MLovQGwzLrQ34yWA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1652379310;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y5mM0HQM8pAQjku1w2nmlt4lHhMPdkzOuqIdXoLXS4Q=;
 b=Hem4fo4S7qi3PlmN8P6pL6clusERWO57cjmyletsW7el6O4y8bKHgVogXMXdMZtYeI/TMN
 2m/YCUIqoAugngDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0A1F113A84;
 Thu, 12 May 2022 18:15:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id tv6BAK5OfWLANgAAMHmgww
 (envelope-from <jroedel@suse.de>); Thu, 12 May 2022 18:15:10 +0000
Date: Thu, 12 May 2022 20:15:08 +0200
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <jroedel@suse.de>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [BUG] Warning and NULL-ptr dereference in amdgpu driver with 5.18
Message-ID: <Yn1OrPG2LyTfbFAK@suse.de>
References: <YnTAc96Uv0CXcGhD@suse.de>
 <CADnq5_NT3UtawpGuPDwF+dgmRdaoysb7sD_-oWWBC=T3BoUH7Q@mail.gmail.com>
 <YnpIjdTT3esZ72Bf@suse.de>
 <CADnq5_NYVvjcUru9hfbnATfcHJR5+eiK9bJAA9m41WKa=OJsog@mail.gmail.com>
 <505081FC-4323-4424-87A9-89B95A89515D@suse.de>
 <CADnq5_PoWLHydAGqHXKNwBnnc_Uz7xc01Mmp2ri-h+RtnRqgfQ@mail.gmail.com>
 <YnzG1KE9tasxdUbX@suse.de>
 <CADnq5_OyfTZ1ma_9rc9ePqhRUqcuNbdCPh7eAYUC7zdX+ZOuyA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADnq5_OyfTZ1ma_9rc9ePqhRUqcuNbdCPh7eAYUC7zdX+ZOuyA@mail.gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, xinhui pan <Xinhui.Pan@amd.com>, "Siqueira,
 Rodrigo" <Rodrigo.Siqueira@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Christian Koenig <christian.koenig@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, "Kazlauskas,
 Nicholas" <nicholas.kazlauskas@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 12, 2022 at 09:47:29AM -0400, Alex Deucher wrote:
> Are those new?  Maybe the card is not seated correctly?  Can you try
> another slot?

I can't remember having seen these TLP error messages with older
kernels. 5.17 still works fine with this card.

I will try to put the card into another slot tomorrow.

> As for the null pointer defer in the display code, @Wentland, Harry
> any ideas?  I don't see why that should happen.  Maybe some hotplug
> pin is faulty or the display has input detection and that is causing
> some sort of hotplug interrupt that causes a race somewhere in the
> driver?  Can you make sure the monitor connector is firmly seated on
> the GPU?

The connectors are fine, the displays are connected via miniDP on the
GPU and DP on the display side. On the other hand my monitors do not
seem to have the highest quality. Occassionally the resolution is
wrongly detected or DP signal is lost. I am not sure why, I suspect
there is some interference between the two DP cables. But this is a
problem for as long as I have these two monitors, the NULL-ptr deref
only happens with v5.18.

Regards,

-- 
Jörg Rödel
jroedel@suse.de

SUSE Software Solutions Germany GmbH
Maxfeldstr. 5
90409 Nürnberg
Germany
 
(HRB 36809, AG Nürnberg)
Geschäftsführer: Ivo Totev

