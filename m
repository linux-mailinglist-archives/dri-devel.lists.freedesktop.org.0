Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 71CA778E18C
	for <lists+dri-devel@lfdr.de>; Wed, 30 Aug 2023 23:41:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 725F810E182;
	Wed, 30 Aug 2023 21:41:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 588E410E163
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Aug 2023 21:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1693431700;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MZhf7II9vtbJCXNAso1V6B0RA+VgorocPdsW3cpI4rA=;
 b=jQdbEBLI42lPpgAkR7dKgtAXbzpusiDsK5w9Ue9bXSE2v7Z52SqxiwkCDeRnnpGOQrhnuG
 WFD4jBMciU3e8+Ug3n5suvMLAK1A6VsLRczdyWN3KfTv4Fv5aoQzKA+rqFuDkjn+dwQ7A7
 XngEbs89iAYN5WGV57xGocSicSSJH40=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-398-bXwYgRU7PlSqyAvsnyvRFA-1; Wed, 30 Aug 2023 17:41:39 -0400
X-MC-Unique: bXwYgRU7PlSqyAvsnyvRFA-1
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-410f0988ea6so1628621cf.3
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Aug 2023 14:41:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693431698; x=1694036498;
 h=mime-version:user-agent:content-transfer-encoding:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MZhf7II9vtbJCXNAso1V6B0RA+VgorocPdsW3cpI4rA=;
 b=Outhgi8thPRa455KiSfFfpr5tmv7kH+Bexqi5JuX1ywYW3wBqSdraLDwMR9So233Km
 pMFDTkFA991LYzmhoM684Ijf3l1U9/gaM1jxC4Eq8uwMh6e4g/PWeio5vs4A8t21yE6b
 kSOTZrdtYZevyTZK7MGhkZ96TnBsCkvWMBVn1w1N0rTe3wu9/w4jvFrimpjFgg9xMTtd
 hZL7I5GUBIG3dBJwvc/7hFqjkskd3UldT+YyvnTmsawAO/JwzKgtzaJfHwsfCXSl+sc/
 jTyYA/m1c+LpC9xBDEZWUCQJYJCakjL6GLE2e0NbE0Z/gSEld3bJOFsi0/CcJWIstEA7
 MaaQ==
X-Gm-Message-State: AOJu0YzRwVFizOGZO2zDaaSOobeR4DVpsO9o8Aojwmsqx8XKywm21sn6
 Ao3TLxaWy1ioyn6hd5HEh8E8Ncuwpv8T9JNbLShWNAtAbwLVRIxyS+zeBNcHHoOUfFeuGGbjQmL
 +/uiP/4L2ehRh/oaY6tPSnTMvND4N
X-Received: by 2002:a05:622a:1187:b0:410:7b5:3f13 with SMTP id
 m7-20020a05622a118700b0041007b53f13mr1213792qtk.16.1693431698527; 
 Wed, 30 Aug 2023 14:41:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHMgqp9xD2SGBugS5P7h0e/1BnqXqlsEDl+s7SDTNfo953w0fNTue1ZedsIWzK1w0tD9C8rZg==
X-Received: by 2002:a05:622a:1187:b0:410:7b5:3f13 with SMTP id
 m7-20020a05622a118700b0041007b53f13mr1213776qtk.16.1693431698210; 
 Wed, 30 Aug 2023 14:41:38 -0700 (PDT)
Received: from ?IPv6:2600:4040:5c7d:5f00::feb? ([2600:4040:5c7d:5f00::feb])
 by smtp.gmail.com with ESMTPSA id
 h14-20020ac8776e000000b004069782c943sm3986894qtu.40.2023.08.30.14.41.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Aug 2023 14:41:37 -0700 (PDT)
Message-ID: <06b50235b6bb02d0774fe0bdf5186ab999c0940a.camel@redhat.com>
Subject: Re: [PATCH v4 0/6] drm/i915/dp_link_training: Define a final
 failure state when link training fails
From: Lyude Paul <lyude@redhat.com>
To: Gil Dekel <gildekel@chromium.org>, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
Date: Wed, 30 Aug 2023 17:41:37 -0400
In-Reply-To: <20230824205335.500163-1-gildekel@chromium.org>
References: <20230824205335.500163-1-gildekel@chromium.org>
Organization: Red Hat Inc.
User-Agent: Evolution 3.48.3 (3.48.3-1.fc38)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: seanpaul@chromium.org, navaremanasi@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Other then the name typo (s/Pual/Paul):

Signed-off-by: Lyude Paul <lyude@redhat.com> (just since I co-authored
things~)
Reviewed-by: Lyude Paul <lyude@redhat.com>

I think we definitely want to make sure we get intel's opinions on this
though, especially regarding the usage of link-status. I think we're close
enough to link-status's intended purpose, but I definitely would like to kn=
ow
what others think about that since userspace will definitely have to handle
situations like this a bit differently than with SST.

Also - definitely make sure you take a look at Imre's patch series that's
currently on the list (I just finished reviewing it), since it adds some
things to the helpers that might end up being useful here :)

https://patchwork.freedesktop.org/series/122589/

On Thu, 2023-08-24 at 16:50 -0400, Gil Dekel wrote:
> Next version of https://patchwork.freedesktop.org/series/122850/
>=20
> v4:
>   Another blunder. I uploaded the patches from my ChromeiumOS kernel dev =
repo
>   instead of drm-tip/drm-tip. Apologies for the noise :(
>=20
> v3:
>   Still learning the ropes of upstream workflow. Apologies for mucking up=
 v2.
>   This is just a re-upload.
>=20
> v2:
>   Reorganize into:
>   1) Add for final failure state for SST and MST link training fallback.
>   2) Add a DRM helper for setting downstream MST ports' link-status state=
.
>   3) Make handling SST and MST connectors simpler via intel_dp.
>   4) Update link-status for downstream MST ports.
>   5) Emit a uevent with the "link-status" trigger property.
>=20
> v1:
> Currently, when link training fails after all fallback values have been
> exhausted, the i915 driver seizes to send uevents to userspace. This leav=
e
> userspace thinking that the last passing atomic commit was successful, an=
d that
> all connectors (displays) are connected and operational, when in fact, th=
e last
> link failed to train and the displays remain dark. This manifests as "zom=
bie"
> displays in userspace, in which users observe the displays appear in thei=
r
> display settings page, but they are dark and unresponsive.
>=20
> Since, at the time of writing, MST link training fallback is not implemen=
ted,
> failing MST link training is a significantly more common case then a comp=
lete
> SST link training failure. And with users using MST hubs more than ever t=
o
> connect multiple displays via their USB-C ports we observe this case ofte=
n.
>=20
> This patchset series suggest a solution, in which a final failure state i=
s
> defined. In this final state, the connector's bit rate capabilities, name=
ly
> max_link_rate and max_link_lane_count, are set to 0. This effectively set=
 the
> connector's bandwidth to 0Gbps, thus causing all its modes to be pruned i=
n the
> following connector probing.
>=20
> Next, with this state defined, we emit a link-status=3DBad uevent. The ne=
xt time
> userspace probes the connector, it should recognize that the connector ha=
s no
> modes and ignore it since it is in a bad state.
>=20
> I am aware that always sending a uevent and never stopping may result in =
some
> userspaces having their expectations broken and enter an infinite loop of
> modesets and link-training attempts. However, per DRM link-status spec:
> ```
>  * link-status:
>  *      Connector link-status property to indicate the status of link. Th=
e
>  *      default value of link-status is "GOOD". If something fails during=
 or
>  *      after modeset, the kernel driver may set this to "BAD" and issue =
a
>  *      hotplug uevent. Drivers should update this value using
>  *      drm_connector_set_link_status_property().
>  *
>  *      When user-space receives the hotplug uevent and detects a "BAD"
>  *      link-status, the sink doesn't receive pixels anymore (e.g. the sc=
reen
>  *      becomes completely black). The list of available modes may have
>  *      changed. User-space is expected to pick a new mode if the current=
 one
>  *      has disappeared and perform a new modeset with link-status set to
>  *      "GOOD" to re-enable the connector.
> ```
> (form drivers/gpu/drm/drm_connector.c - DOC: standard connector propertie=
s)
>=20
> it seems reasonable to assume that the suggested state is an extension of=
 the
> spec's guidelines, in which the next new mode userspace picks for a conne=
ctor
> with no modes is - none, thus breaking the cycle of failed link-training
> attempts.
>=20
> I suspect that, maybe, zeroing out the bit rate capabilities is not the r=
ight
> way to go, and perhaps marking the connector as disconnected instead may =
be a
> better solution. However, if marking a connector disconnected is the way =
to go,
> We will have to iterate over all MST ports in the MST case and mark the s=
pawned
> connectors as disconnected as well.

I -think- this is probably fine, that's likely how I'd=20

>=20
> As a final note I should add that this approach was tested with ChromeOS =
as
> userspace, and we observed that the zombie displays stop showing up once =
the
> connectors are pruned of all their modes and are ignored by userspace.
>=20
> For your consideration and guidance.
> Thanks,
>=20
> Gil Dekel (6):
>   drm/i915/dp_link_training: Add a final failing state to link training
>     fallback
>   drm/i915/dp_link_training: Add a final failing state to link training
>     fallback for MST
>   drm/dp_mst: Add drm_dp_set_mst_topology_link_status()
>   drm/i915: Move DP modeset_retry_work into intel_dp
>   drm/i915/dp_link_training: Set all downstream MST ports to BAD before
>     retrying
>   drm/i915/dp_link_training: Emit a link-status=3DBad uevent with trigger
>     property
>=20
>  drivers/gpu/drm/display/drm_dp_mst_topology.c | 39 ++++++++++
>  drivers/gpu/drm/i915/display/intel_display.c  | 14 +++-
>  .../drm/i915/display/intel_display_types.h    |  6 +-
>  drivers/gpu/drm/i915/display/intel_dp.c       | 75 ++++++++++++-------
>  drivers/gpu/drm/i915/display/intel_dp.h       |  2 +-
>  .../drm/i915/display/intel_dp_link_training.c | 11 ++-
>  include/drm/display/drm_dp_mst_helper.h       |  3 +
>  7 files changed, 110 insertions(+), 40 deletions(-)
>=20
> --
> Gil Dekel, Software Engineer, Google / ChromeOS Display and Graphics
>=20

--=20
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

