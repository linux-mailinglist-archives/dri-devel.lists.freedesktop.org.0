Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC7436B1B3C
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 07:16:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B38010E0BF;
	Thu,  9 Mar 2023 06:16:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6DC910E0BF
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Mar 2023 06:16:09 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id da10so2833428edb.3
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Mar 2023 22:16:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678342568;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v+YXj3xuJamy46fVwlA5D0PVaIrEDpyBLL/CETayzIQ=;
 b=hIFJJL3N3RVC22Wt8jlMc8D2dF9QUADUbLNswq5IaxtMbS3J86O1P9IPVsN9hOD6Ft
 nAm0U23KpWuYNMDQWjPKO9IEcaT13eYcHJBI7BKh+3j79nMG9kWMEHNtnY+0QHfE7odK
 tt77olNALEeYo7jL2N31ZiTD3kjzLIbm7zmjHBtKrhMqACZnBRVjN9mTsC+zznDjmvWn
 Ll3h5AR/YgBIhI1XxYezIhuy93gwYJHJLetLhmlPjIdNA9TB2XWoh7AtETyqL7jJB8f8
 aNoulwlvgi8U1g9ajjPBuVIzzpYsPcc6CN574h3TlD61iIkR8zylv4vOj1aZtwZk2HTj
 MdgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678342568;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v+YXj3xuJamy46fVwlA5D0PVaIrEDpyBLL/CETayzIQ=;
 b=CwBcvNKqbZ4CB+cI1hq426DCldbjVeivtu004ZY6lST6QrcFzNpUbnd0/U1RGujK1z
 SJQIkLC6UGkE282ws/mmpqWU5UL4g21Pz+uS6w80Fq3+Kt6j9Y6gFWAPitnuR0FnurI8
 /TaAYaVTsfiM41xfirY48ji8vSUHTEDnsxbuhnBfeCsWyYSjo806aGoD0gjFw3EBKxek
 WLnGVu05l5LSLGW15UpvA2NCO09ZWBzP41ca4hbIRQqcuzxm/Yaqn6V8hwRb7AX8E5Fd
 srvHItC5brQrg7708bg20ZxTTEzrU3uXm5zKxDIKwfC96O1TvTn7BQyIAvfehkb+QTtD
 nEUQ==
X-Gm-Message-State: AO0yUKWTK/vBEJLJz7h1C+nrYCRPSH+EbujOus0pEV011Gqi32XAVtqq
 BAQPSLRrQ0G4odmHGI1v5ktArZB8zk4msdm6aeE=
X-Google-Smtp-Source: AK7set+pX4aXbrBAtPzUy0OOYdjRl9vI15JjJJrWhBl5M9MyxAE2uL+BYCgDCkNpTcYEk4FVcbdNDZ32jt3IYAjV1pI=
X-Received: by 2002:a50:c04b:0:b0:4bf:5fd5:da42 with SMTP id
 u11-20020a50c04b000000b004bf5fd5da42mr11522809edd.3.1678342567958; Wed, 08
 Mar 2023 22:16:07 -0800 (PST)
MIME-Version: 1.0
References: <20230307-rust-drm-v1-0-917ff5bc80a8@asahilina.net>
 <20230307-rust-drm-v1-1-917ff5bc80a8@asahilina.net>
 <c047e11f-33d0-6af4-21c3-adb384b68d8b@igalia.com>
 <93a57598-9deb-85f2-ebd9-8605404c1ef8@asahilina.net>
In-Reply-To: <93a57598-9deb-85f2-ebd9-8605404c1ef8@asahilina.net>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 9 Mar 2023 16:15:55 +1000
Message-ID: <CAPM=9tw6aUUgL63EFhX6W_mQa1ssEmcPjJJHhrssasRVPt76rg@mail.gmail.com>
Subject: Re: [PATCH RFC 01/18] rust: drm: ioctl: Add DRM ioctl abstraction
To: Asahi Lina <lina@asahilina.net>
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
Cc: Karol Herbst <kherbst@redhat.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, dri-devel@lists.freedesktop.org,
 Mary <mary@mary.zone>, Gary Guo <gary@garyguo.net>,
 Ella Stanforth <ella@iglunix.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>,
 Luben Tuikov <luben.tuikov@amd.com>, Alex Gaynor <alex.gaynor@gmail.com>,
 Miguel Ojeda <ojeda@kernel.org>, linux-media@vger.kernel.org,
 Wedson Almeida Filho <wedsonaf@gmail.com>, rust-for-linux@vger.kernel.org,
 Boqun Feng <boqun.feng@gmail.com>, linaro-mm-sig@lists.linaro.org,
 Faith Ekstrand <faith.ekstrand@collabora.com>, linux-sgx@vger.kernel.org,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 linux-kernel@vger.kernel.org, Jarkko Sakkinen <jarkko@kernel.org>,
 asahi@lists.linux.dev, Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 9 Mar 2023 at 15:32, Asahi Lina <lina@asahilina.net> wrote:
>
> On 08/03/2023 00.32, Ma=C3=ADra Canal wrote:
> > On 3/7/23 11:25, Asahi Lina wrote:
> >> DRM drivers need to be able to declare which driver-specific ioctls th=
ey
> >> support. This abstraction adds the required types and a helper macro t=
o
> >> generate the ioctl definition inside the DRM driver.
> >>
> >> Note that this macro is not usable until further bits of the
> >> abstraction are in place (but it will not fail to compile on its own, =
if
> >> not called).
> >>
> >> Signed-off-by: Asahi Lina <lina@asahilina.net>
> >> ---
> >>   drivers/gpu/drm/Kconfig         |   7 ++
> >>   rust/bindings/bindings_helper.h |   2 +
> >>   rust/kernel/drm/ioctl.rs        | 147 ++++++++++++++++++++++++++++++=
++++++++++
> >>   rust/kernel/drm/mod.rs          |   5 ++
> >>   rust/kernel/lib.rs              |   2 +
> >>   5 files changed, 163 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> >> index dc0f94f02a82..dab8f0f9aa96 100644
> >> --- a/drivers/gpu/drm/Kconfig
> >> +++ b/drivers/gpu/drm/Kconfig
> >> @@ -27,6 +27,13 @@ menuconfig DRM
> >>        details.  You should also select and configure AGP
> >>        (/dev/agpgart) support if it is available for your platform.
> >>
> >
> > [...]
> >
> >> +
> >> +/// Declare the DRM ioctls for a driver.
> >> +///
> >> +/// Each entry in the list should have the form:
> >> +///
> >> +/// `(ioctl_number, argument_type, flags, user_callback),`
> >> +///
> >> +/// `argument_type` is the type name within the `bindings` crate.
> >> +/// `user_callback` should have the following prototype:
> >> +///
> >> +/// ```
> >> +/// fn foo(device: &kernel::drm::device::Device<Self>,
> >> +///        data: &mut bindings::argument_type,
> >> +///        file: &kernel::drm::file::File<Self::File>,
> >> +/// )
> >> +/// ```
> >> +/// where `Self` is the drm::drv::Driver implementation these ioctls =
are being declared within.
> >> +///
> >> +/// # Examples
> >> +///
> >> +/// ```
> >> +/// kernel::declare_drm_ioctls! {
> >> +///     (FOO_GET_PARAM, drm_foo_get_param, ioctl::RENDER_ALLOW, my_ge=
t_param_handler),
> >> +/// }
> >> +/// ```
> >> +///
> >> +#[macro_export]
> >> +macro_rules! declare_drm_ioctls {
> >> +    ( $(($cmd:ident, $struct:ident, $flags:expr, $func:expr)),* $(,)?=
 ) =3D> {
> >> +        const IOCTLS: &'static [$crate::drm::ioctl::DrmIoctlDescripto=
r] =3D {
> >> +            const _:() =3D {
> >> +                let i: u32 =3D $crate::bindings::DRM_COMMAND_BASE;
> >> +                // Assert that all the IOCTLs are in the right order =
and there are no gaps,
> >> +                // and that the sizeof of the specified type is corre=
ct.
> >
> > I believe that not necessarily the IOCTLs need to be in the right order=
 and
> > with no gaps. For example, armada_drm.h has a gap in between 0x00 and
> > 0x02 and exynos_drm.h also have gaps. Moreover, some drivers, like vgem=
 and
> > virtgpu, start their IOCTLs with 0x01.
>
> Yeah, we talked about this a bit... do you have any ideas about how to
> design this? I think it should be possible with a const function
> initializing an array entry by entry, we just need a two-pass macro
> (once to determine the max ioctl number, then again to actually output
> the implementation).
>
> I'm not sure why drivers would have gaps in the ioctl numbers though...
> my idea was that new drivers shouldn't need that as far as I can tell
> (you can't remove APIs after the fact due to UAPI stability guarantees,
> so as long as you don't have gaps to begin with...). But I guess if
> we're reimplementing existing drivers in Rust we'll need this... though
> maybe it makes sense to just say it's not supported and require
> reimplementations that have holes to just explicitly add dummy ioctls
> that return EINVAL? We could even provide such a dummy generic ioctl
> handler on the abstraction side, so drivers just have to add it to the
> list, or make the macro take a special token that is used for
> placeholder ioctls that don't exist (which then creates the NULL
> function pointer that the drm core interprets as invalid)...

I can think of two reason for gaps having appeared:

a) developers wanted to group new uapis at a nice base number.
This is never essential it's just makes things easier to read, and
allows slotting other ioctls into the gaps later.

b) parallel feature development ends up conflicting then one thread never l=
ands.
I've got two-three devs each adding a uAPI, we assign them 0x10, 0x11,
0x12 while they work, then 0x11 never lands because it was a bad idea.

However I think you should be fine enforcing a non-sparse space here
unless we want to handle replacing current drivers, as long as it's
hard to screw up so you know early.

Dave.
