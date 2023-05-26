Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D01712B19
	for <lists+dri-devel@lfdr.de>; Fri, 26 May 2023 18:54:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0BFE10E824;
	Fri, 26 May 2023 16:54:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6D6110E824
 for <dri-devel@lists.freedesktop.org>; Fri, 26 May 2023 16:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1685120082;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6BnPJ7eiUTPN3sJ4BxFB6a3n9CvSr2rgwmobQyXF5is=;
 b=XS30o8cjmJPs0ZHCeYthp0eTpn/7H0TeGsbsJBWlTIMI42bxz2X5Skq6kwUQNIIC4L+ikH
 6gS6pAhdRWc88wOliQoaSgLgMxybK2SaTgiCKj1hrKwW9u3DEdEdzPH5oJDNVRNaTttmWe
 9Tnlr2ta7nvqBzyWDnxYF5Txrw3ZPzE=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-54-1ZtePw0TNjuqvNkHLPhNkw-1; Fri, 26 May 2023 12:54:41 -0400
X-MC-Unique: 1ZtePw0TNjuqvNkHLPhNkw-1
Received: by mail-lj1-f199.google.com with SMTP id
 38308e7fff4ca-2af28aae675so4172051fa.0
 for <dri-devel@lists.freedesktop.org>; Fri, 26 May 2023 09:54:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685120080; x=1687712080;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6BnPJ7eiUTPN3sJ4BxFB6a3n9CvSr2rgwmobQyXF5is=;
 b=PL0A+ZUxNZEEaCoGBQUbFNM2zoDX36VTku3SthKbsG4vYs5oYRlJyYs7VICkGR25VH
 BT3JH1K1midhF46aUuYlYmUaDXJ/mP1JK4woyqnMAO0ULaF6Oj8L1ZyfRz7Hhitx3SfO
 e9HqTgzdsIaEbtBOHyfVlhirL6oXd/YU4SuAldyYxIFENrveVm2x5my5QzsP92aBRVOQ
 IkjmbzJ1lvVraYtS29vCEQj7lfYDWlbdjivEdWO4WkG8TkSeFcujiosrz+flJ4RNsigQ
 IDZIfOojR4jymcI5QppyxlrMWSw6+zjHMb1U1CVXYSzeUc4GV+I67hbdJFTCDyZEeNAV
 NGSw==
X-Gm-Message-State: AC+VfDxet5muOYQbhDpi+d9MBdobfTGL14xgsPu9H1RH0VGmpI6iRapp
 qY9YdeUNvPDwQX4cOa0x996t8GnHUYPhMv1Faim7WUYvne7zmHqp3jf3hJS/eIpXG+M9+PxGh6x
 xUZu4S/Q4oTxumvyL6lbzWVy/wirnVu8VzZkcggGO9eNu
X-Received: by 2002:a2e:9904:0:b0:2a8:d1cd:a04 with SMTP id
 v4-20020a2e9904000000b002a8d1cd0a04mr782083lji.48.1685120080143; 
 Fri, 26 May 2023 09:54:40 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4BGiYAK7lIcMVhAUA7FNfDEUrXSDsiYXqzvvb3fFtfgAHYFndU4Q/kZzacZ6FuTS48BB/bI0pBNG9rp3mpB8w=
X-Received: by 2002:a2e:9904:0:b0:2a8:d1cd:a04 with SMTP id
 v4-20020a2e9904000000b002a8d1cd0a04mr782075lji.48.1685120079821; Fri, 26 May
 2023 09:54:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230525191809.3524-1-harry.wentland@amd.com>
 <20230526161648.5865ce1a@eldfell>
 <CA+hFU4wv+4Qkyj-2ajv3o=2OX6N1+Pz=PVq0Z6YPnZaMJFPx7A@mail.gmail.com>
In-Reply-To: <CA+hFU4wv+4Qkyj-2ajv3o=2OX6N1+Pz=PVq0Z6YPnZaMJFPx7A@mail.gmail.com>
From: Sebastian Wick <sebastian.wick@redhat.com>
Date: Fri, 26 May 2023 18:54:28 +0200
Message-ID: <CA+hFU4yW6FU0R5FRKTNRvoswztYHxoQUWaZSD+QT6to6DVqg8A@mail.gmail.com>
Subject: Re: [PATCH v4 00/13] Enable Colorspace connector property in amdgpu
To: Pekka Paalanen <ppaalanen@gmail.com>
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
Cc: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 amd-gfx@lists.freedesktop.org, Melissa Wen <mwen@igalia.com>,
 Uma Shankar <uma.shankar@intel.com>, dri-devel@lists.freedesktop.org,
 Joshua Ashton <joshua@froggi.es>, Vitaly.Prosyak@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

With the documentation about RGB and YCC variants added the drm core patche=
s are

Reviewed-by: Sebastian Wick <sebastian.wick@redhat.com>


On Fri, May 26, 2023 at 6:24=E2=80=AFPM Sebastian Wick
<sebastian.wick@redhat.com> wrote:
>
> On Fri, May 26, 2023 at 3:16=E2=80=AFPM Pekka Paalanen <ppaalanen@gmail.c=
om> wrote:
> >
> > On Thu, 25 May 2023 15:17:56 -0400
> > Harry Wentland <harry.wentland@amd.com> wrote:
> >
> > > This patchset is based on Joshua's previous patchset [1], as well
> > > as my previous patchset [2].
> > >
> > > It is
> > > - enabling support for the colorspace property in amdgpu, as well as
> > > - allowing drivers to specify the supported set of colorspaces, and
> > >
> > > Colorspace, Infoframes, and YCbCr matrix
> > > ---------------------------------------
> > >
> > > Even though the initial intent of the colorspace property was to set =
the
> > > colorspace field in the respective HDMI AVI and DP SDP infoframes tha=
t
> > > is not sufficient in all scenarios. For DP the colorspace information
> > > also affects the MSA (main stream attribute) packet. For YUV output t=
he
> > > colorspace affects the RGB-to-YCbCr conversion matrix. The colorspace
> > > field of the infopackets also depends on the encoding used, which is
> > > something that is decided by the driver and not known to userspace.
> >
> > Hi Harry,
> >
> > the "deprecation" of BT2020 RGB vs. YCC is now dropped completely.
> > Should there still be a patch that adds some UAPI documentation only,
> > saying that drivers are free to swap e.g. between BT2020 RGB and YCC
> > based which encoding they actually chose?
>
> Yes please!
>
> > Even if just BT2020 variant specifically.
> >
> > I have nothing against with this series now.
> >
> >
> > Thanks,
> > pq
> >
> > >
> > > For these reasons a driver will need to be able to select the support=
ed
> > > colorspaces at property creation.
> > >
> > > Note: There seems to be an understanding that the colorspace property
> > > should ONLY modify the infoframe. While this is current behavior and
> > > sufficient in some cases it is nowhere specified that this should be =
the
> > > only use of this property. As outlined above this limitation is not
> > > going to work in all cases.
> > >
> > > This patchset does not affect current behavior for the drivers that
> > > implement this property: i915 and vc4.
> > >
> > > In the future we might want to give userspace control over the encodi=
ng
> > > format on the wire, in particular to avoid use of YUV420 when image
> > > fidelity is important. This work would likely go hand in hand with a
> > > min_bpc property and wouldn't conflict with the work done in this
> > > patchset. I would expect this future work to tag along with a drm_crt=
c
> > > or drm_connector's Color Pipeline, similar to the one propsed for
> > > drm_plane [3].
> > >
> > > Colorspace on crtc or connector?
> > > --------------------------------
> > >
> > > There have been suggestions of programming 'colorspace' on the drm_cr=
tc
> > > but I don't think the crtc is the right place for this property. The
> > > drm_plane and drm_crtc will be used to offload color processing that
> > > would normally be done via the GFX or other pipelines. The drm_connec=
tor
> > > controls the signalling with the display and ensures the wire format =
is
> > > appropriate for the encoding by programming the RGB-to-YCbCr matrix.
> > >
> > > [1] https://patchwork.freedesktop.org/series/113632/
> > > [2] https://patchwork.freedesktop.org/series/111865/
> > > [3] https://lists.freedesktop.org/archives/dri-devel/2023-May/403173.=
html

