Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qDHcMIWNj2kXRgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 21:45:57 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EDC41397FD
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 21:45:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EB0C10E1B7;
	Fri, 13 Feb 2026 20:45:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="aX7yXxl2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com
 [209.85.218.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 643B710E1B7
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Feb 2026 20:45:52 +0000 (UTC)
Received: by mail-ej1-f65.google.com with SMTP id
 a640c23a62f3a-b884d5c787bso173262366b.0
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Feb 2026 12:45:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1771015546; x=1771620346;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XjReM9ADg6zhlxMDPHdkasEcLNhY554Cqko3b+W+YjU=;
 b=aX7yXxl2p7rP4cf6NACQK54KMfDzDQ0ZdjUzoklmXjpB0nR+VawNfQEATlVKcFTeW2
 NJVKPuVnNYR4bLEF07PCGJ8VolzhG41txEwKPtgYN+zAzCDElBM7v/4bpU1xbmi0QXCg
 Zsrf6+7ISmlmPAFXM7qhY7nmx7tuvQGwl1jo8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771015546; x=1771620346;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=XjReM9ADg6zhlxMDPHdkasEcLNhY554Cqko3b+W+YjU=;
 b=uzWnpCBiUqkJAiRNMYkaCWYRTO8Zk/BsOkoi3LC0s1n8+t/ZgaGl+GQJZCBk6rTy+R
 Unth+K44NQSy7QCfAxYjS8lswEsQsVDitbiYjSKmwSQc3oGwnu3NouSNXck4UQhQ9tXu
 c1eZKlfswLJiROsKgsOp+Yw4aaFTqadYi/pSNWhgNTa0TFJZJ7JqBDdG22rCAj4rLKPK
 EyACtowgls5RRiz7KRQjFt0+108IekkVea9p5SfVDDie6+SZDfblV7fQDXoTmk6dAMpH
 q2O5Pj7bLmoSABExxQFzjNzbJoSaq4ylv5t5nvSj2pIfRjRQjUZFbE2dANgbend5ALj4
 t0lA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUrHh53MPt69WtXGhuB95CIac07lECqYRyiJluRKtkGsw5KogtG9f1yNtklNapxBe+BXeCZg6GA6/w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwA1q1n/OE2leq+wRiaF1TfZsrQcOhT2e+qE8i3iqLWvDPl/d4v
 olCtlHPPzqVBnYR/nhGuYF4ne37n5jm8tWUpp9c5vNlN0dxty671GiyDFsfthL8Z2bjlDolrGhB
 xxzrMDFGTjmM=
X-Gm-Gg: AZuq6aIikA4VqpHN1skMXkt3/oTj+cHAkAU07EgP2Keu6ll4grOrrnTj9f5ytaFEgsW
 TJOwx15mN/M0Ck6ZjJ9pNPGS51nvyJXhunzEZp/e2AbDT649kaWDMpkBv+DGysSSnUiwPRrabUo
 ngUtR6LJ2CL2ZdVXKzelxbt/yK3nUsSM0/+WPBmI/misZk1aJWozIYuXlAnF7xZsQZlrtqkxl04
 3exsm5kFaHCw5+nAKmH2Ae+tlHBvG1jykSNO1/qv5tSBtBVFkQdn707TteNMcoEIW1Lu8dLwVQW
 SIpwrzf+aYZE02BiozeI2ESvELg3KvqmLfQRrZpuTAoXxQdMTc/wEkviEWz5NFN/VzlUzT7KajL
 Cq8Lw8zcMbFDPgtZ7/oy+nT73eZBgUgpyLAnKVJTVhOZuRT3OdJLO55RFphbnFIrrsU4IyjQyOd
 aJBu4/wJpNMUXoJNpkat1+raoDG2iX2VanSBRiPWYcedZqTPU1vG2yA9/OgWySwQ==
X-Received: by 2002:a17:907:8689:b0:b87:324b:9ae1 with SMTP id
 a640c23a62f3a-b8fc3c7e2d3mr44937266b.40.1771015546060; 
 Fri, 13 Feb 2026 12:45:46 -0800 (PST)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com.
 [209.85.221.48]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8fc7385d99sm1040366b.17.2026.02.13.12.45.43
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Feb 2026 12:45:45 -0800 (PST)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-43590777e22so861646f8f.3
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Feb 2026 12:45:43 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXpdbrYnTDrsJBUpi1FmPjhav/oTCVFLxSGh/FzQ4ySA46Bp6cfWZp7MI9y9jn9CZiWbNqISPs6WnM=@lists.freedesktop.org
X-Received: by 2002:a05:6000:144b:b0:431:808:2d58 with SMTP id
 ffacd0b85a97d-4379db98611mr1384034f8f.51.1771015542925; Fri, 13 Feb 2026
 12:45:42 -0800 (PST)
MIME-Version: 1.0
References: <20260206123758.374555-1-fra.schnyder@gmail.com>
 <CAD=FV=UO3wHqGKep67pY04PgBJKgvOgDf8u1qxeXmWkgVMLXiQ@mail.gmail.com>
 <20260206161054.GA101724@francesco-nb>
 <CAD=FV=VvePQt9LgupM+hW72doRja4UPBj6sBXUh091yHFxcxVw@mail.gmail.com>
In-Reply-To: <CAD=FV=VvePQt9LgupM+hW72doRja4UPBj6sBXUh091yHFxcxVw@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 13 Feb 2026 12:45:31 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VLNXWT2_e=nk2MsQVmFCuJmw9sgDAwntGo0nE0Q3sADQ@mail.gmail.com>
X-Gm-Features: AZwV_Qiw3C9EmV38eXLLKegttFQVVJNwB5dzTwKeOXTHmmgbU3iR_KdDERbJVB4
Message-ID: <CAD=FV=VLNXWT2_e=nk2MsQVmFCuJmw9sgDAwntGo0nE0Q3sADQ@mail.gmail.com>
Subject: Re: [PATCH v1] drm/bridge: ti-sn65dsi86: Enable HPD polling if IRQ is
 not used
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Franz Schnyder <fra.schnyder@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Franz Schnyder <franz.schnyder@toradex.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:francesco@dolcini.it,m:fra.schnyder@gmail.com,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:franz.schnyder@toradex.com,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,m:fraschnyder@gmail.com,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,linux.intel.com,suse.de,ffwll.ch,toradex.com,lists.freedesktop.org,vger.kernel.org];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[dianders@chromium.org,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[dianders@chromium.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[chromium.org:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chromium.org:email,chromium.org:dkim,dolcini.it:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 2EDC41397FD
X-Rspamd-Action: no action

Hi,

On Fri, Feb 6, 2026 at 8:27=E2=80=AFAM Doug Anderson <dianders@chromium.org=
> wrote:
>
> Hi,
>
> On Fri, Feb 6, 2026 at 8:11=E2=80=AFAM Francesco Dolcini <francesco@dolci=
ni.it> wrote:
> >
> > Hello Doug,
> >
> > On Fri, Feb 06, 2026 at 07:46:10AM -0800, Doug Anderson wrote:
> > > On Fri, Feb 6, 2026 at 4:38=E2=80=AFAM Franz Schnyder <fra.schnyder@g=
mail.com> wrote:
> > > >
> > > > From: Franz Schnyder <franz.schnyder@toradex.com>
> > > >
> > > > Fallback to polling to detect hotplug events on systems without
> > > > interrupts.
> > > >
> > > > On systems where the interrupt line of the bridge is not connected,
> > > > the bridge cannot notify hotplug events. Only add the
> > > > DRM_BRIDGE_OP_HPD flag if an interrupt has been registered
> > > > otherwise remain in polling mode.
> > > >
> > > > Fixes: 9133bc3f0564 ("drm/bridge: ti-sn65dsi86: Add support for Dis=
playPort mode with HPD")
> > > > Fixes: 55e8ff842051 ("drm/bridge: ti-sn65dsi86: Add HPD for Display=
Port connector type")
> > > > Cc: stable@vger.kernel.org
> > > > Signed-off-by: Franz Schnyder <franz.schnyder@toradex.com>
> > > > ---
> > > >  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 6 ++++--
> > > >  1 file changed, 4 insertions(+), 2 deletions(-)
> > >
> > > It's weird that you have two fixes, but upon closer inspection, I see
> > > why you tagged it as you did.
> > >
> > > The first commit that landed, commit 55e8ff842051 ("drm/bridge:
> > > ti-sn65dsi86: Add HPD for DisplayPort connector type"), was still
> > > using polling mode and just using the HPD line for polling. That
> > > commit incorrectly set the flag "DRM_BRIDGE_OP_HPD". So the proper
> > > backport to kernels with just that commit would be to take away that
> > > flag. Unfortunately, I didn't notice this problem during the review
> > > and I don't personally have any hardware using this bridge for DP,
> > > only eDP.
> > >
> > > The second commit that landed, commit 9133bc3f0564 ("drm/bridge:
> > > ti-sn65dsi86: Add support for DisplayPort mode with HPD"), actually
> > > added support for the HPD interrupt. After this commit, your fix
> > > (which makes the flag "DRM_BRIDGE_OP_HPD" depend on the IRQ) is the
> > > correct one.
> > >
> > > Unfortunately, I think the above will confuse the stable scripts.
> > > Since your patch applied cleanly atop the first commit then it will
> > > picked to any kernels with it, even if they don't have the second
> > > commit.
> > >
> > > I think the first commit landed in v6.16 and the second commit isn't
> > > yet in any stable release.
> > >
> > > Maybe the right way to look at this is to just call the 2nd patch a
> > > prereq? So this:
> > >
> > > Fixes: 55e8ff842051 ("drm/bridge: ti-sn65dsi86: Add HPD for
> > > DisplayPort connector type")
> > > Cc: <stable@vger.kernel.org> # 6.16: 9133bc3f0564: drm/bridge: ti-sn6=
5dsi86: Add
> > >
> > > That will cause the 2nd patch to get picked up for stable too, but
> > > that would be preferable to having just your fix without the 2nd
> > > patch. Alternatively, you could try to add some other note to the
> > > stable team to help them arrive at the right backport.
> >
> > We had some internal review before sending this patch and I am the one
> > that suggested to put both commit as fixes in the end.
> >
> > I agree that your solution is the correct one (I am not familiar with
> > the syntax there, but I agree on the concept), assuming
> > nobody disagree on this, should we send a v2, or are you going to amend
> > the commit message when applying it?
>
> You can see the docs at:
>
> Documentation/process/stable-kernel-rules.rst
>
> As long as you agree with what I came up with, there's no need for you
> to resend and I can adjust it when I land the patch. I'll still let it
> sit on the list for at least next week to give others a chance to
> review / comment.

Pushed to drm-misc-fixes with the updated Fixes / stable line.

[1/1] drm/bridge: ti-sn65dsi86: Enable HPD polling if IRQ is not used
      commit: 0b87d51690dd5131cbe9fbd23746b037aab89815
