Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72932345BCA
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 11:19:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4D966E88B;
	Tue, 23 Mar 2021 10:19:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 189CE6E88B
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 10:19:54 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id h13so22789843eds.5
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 03:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=oAc0syotsHDUnWyUjFLewhBpFhavjrYGBoJ9MFF2Xj8=;
 b=HmyXfsI9Pe/+J8zgrd8Y2sOWrSTuZUWrcqk/O5qroUQU33ErVlE0JkHgu03sj7gLeU
 A9d/mbB4O++jrFFig9/opmNggnh9xaZPqb2rOciBwukuSx8dRE0cdblYz3sJR9MRYZ5C
 5C9D3OX11H8WTj6Uqt4l0UUnvZDiRbFdsERTb4Mm8BEB1frdUdGQS6I1R7l8zjwAbKf4
 JsPD728ycVHKQruKhCqc4jo66DbEzaTHwgqnGf9oOQo/YFGZVKJbgmE9YS0yY8TyAQJ4
 VVmXh2SwS8/kpPjPkyFiFhPb/y4RzbB0aKhFycbKaRj9San02vMXYCG8v437qIMGG9Ls
 L+OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=oAc0syotsHDUnWyUjFLewhBpFhavjrYGBoJ9MFF2Xj8=;
 b=PmEQOyh8MF4Ci0QNnT5EvKxW/cXh9SzOtLczKLhoK4UULZXA69zjrbvh1i/sW7AosU
 veNTrSpENAsnLy4QNqMmCm25NZyn6p/IZGH7AxqKC6AwPmkHPLHr/lzjPtUa77gldXV8
 wufKMhZeM86dIj/ycwcRZ+bSJ4MujJEBKlOm/ZQzP5SQS1ig/NQDWN9vRPTqRMhdcMt8
 +BIIfjR9mGMHsOUuXa8HzdflYr9McwSStQtCXqkQgqvN2tYLhS0jf/PcUeU4iPVVtPxn
 D7WF6vsd70Bhk2NXavkXvtKmr50v3bPC8MYG82yYNQJLBZwuOKihM3yiN+eTVExykuYe
 nwjw==
X-Gm-Message-State: AOAM533nxQq936qUD+FrQLq4LXvcegjFAUkrCnpIamTj8OSecysP8PuR
 ppiCblk0lGXgnWu+0mLwGgUCTyt068I=
X-Google-Smtp-Source: ABdhPJyljXwJ37t6sHFLWWEoIcufoEF8yk5RrUa7RC6ngqeII3jL7f2C5zBR4UU6JQHTecUV/6rSIA==
X-Received: by 2002:aa7:d0d7:: with SMTP id u23mr3735564edo.255.1616494792686; 
 Tue, 23 Mar 2021 03:19:52 -0700 (PDT)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id l12sm12506949edb.39.2021.03.23.03.19.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 03:19:48 -0700 (PDT)
Date: Tue, 23 Mar 2021 11:20:08 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v5 01/21] gpu: host1x: Use different lock classes for
 each client
Message-ID: <YFnA2HW4EuxaN6Kn@orome.fritz.box>
References: <20210111130019.3515669-1-mperttunen@nvidia.com>
 <20210111130019.3515669-2-mperttunen@nvidia.com>
 <YFitsk3I2l7IBnLR@orome.fritz.box>
 <6615105f-ccf1-7833-512c-090817c47952@gmail.com>
 <645366c2-c500-efcc-f44c-b933f6f470c4@nvidia.com>
 <6dec95ac-bd92-9434-76ba-eb7fcb316f49@gmail.com>
MIME-Version: 1.0
In-Reply-To: <6dec95ac-bd92-9434-76ba-eb7fcb316f49@gmail.com>
User-Agent: Mutt/2.0.6 (98f8cb83) (2021-03-06)
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org, jonathanh@nvidia.com,
 talho@nvidia.com, bhuntsman@nvidia.com, linux-tegra@vger.kernel.org,
 Mikko Perttunen <mperttunen@nvidia.com>
Content-Type: multipart/mixed; boundary="===============0894113103=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0894113103==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ycKTxQBNHbcJSd6i"
Content-Disposition: inline


--ycKTxQBNHbcJSd6i
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 22, 2021 at 07:01:34PM +0300, Dmitry Osipenko wrote:
> 22.03.2021 18:19, Mikko Perttunen =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On 22.3.2021 16.48, Dmitry Osipenko wrote:
> >> 22.03.2021 17:46, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >>> On Mon, Jan 11, 2021 at 02:59:59PM +0200, Mikko Perttunen wrote:
> >>>> To avoid false lockdep warnings, give each client lock a different
> >>>> lock class, passed from the initialization site by macro.
> >>>>
> >>>> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> >>>> ---
> >>>> =C2=A0 drivers/gpu/host1x/bus.c | 7 ++++---
> >>>> =C2=A0 include/linux/host1x.h=C2=A0=C2=A0 | 9 ++++++++-
> >>>> =C2=A0 2 files changed, 12 insertions(+), 4 deletions(-)
> >>>>
> >>>> diff --git a/drivers/gpu/host1x/bus.c b/drivers/gpu/host1x/bus.c
> >>>> index 347fb962b6c9..8fc79e9cb652 100644
> >>>> --- a/drivers/gpu/host1x/bus.c
> >>>> +++ b/drivers/gpu/host1x/bus.c
> >>>> @@ -715,13 +715,14 @@ EXPORT_SYMBOL(host1x_driver_unregister);
> >>>> =C2=A0=C2=A0 * device and call host1x_device_init(), which will in t=
urn call
> >>>> each client's
> >>>> =C2=A0=C2=A0 * &host1x_client_ops.init implementation.
> >>>> =C2=A0=C2=A0 */
> >>>> -int host1x_client_register(struct host1x_client *client)
> >>>> +int __host1x_client_register(struct host1x_client *client,
> >>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 struct lock_class_key *key)
> >>>
> >>> I've seen the kbuild robot warn about this because the kerneldoc is n=
ow
> >>> out of date.
> >>>
> >>>> =C2=A0 {
> >>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct host1x *host1x;
> >>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int err;
> >>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 INIT_LIST_HEAD(&client->list);
> >>>> -=C2=A0=C2=A0=C2=A0 mutex_init(&client->lock);
> >>>> +=C2=A0=C2=A0=C2=A0 __mutex_init(&client->lock, "host1x client lock"=
, key);
> >>>
> >>> Should we maybe attempt to make this unique? Could we use something l=
ike
> >>> dev_name(client->dev) for this?
> >>
> >> I'm curious who the lockdep warning could be triggered at all, I don't
> >> recall ever seeing it. Mikko, could you please clarify how to reproduce
> >> the warning?
> >>
> >=20
> > This is pretty difficult to read but I guess it's some interaction
> > related to the delayed initialization of host1x clients? In any case, I
> > consistently get it at boot (though it may be triggered by vic probe
> > instead of nvdec).
> >=20
> > I'll fix the kbuild robot warnings and see if I can add a
> > client-specific lock name for v6.
>=20
> Thank you for the clarification! We now actually have a similar problem o=
n Tegra20 after fixing the coupling of display controllers using the dc1_cl=
ient->parent=3Ddc0_client and I see the same warning when DC1 is enabled.
>=20
> [    3.808338] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [    3.808355] WARNING: possible recursive locking detected
> [    3.808376] 5.12.0-rc3-next-20210319-00176-g60867e51e180 #7219 Tainted=
: G        W       =20
> [    3.808406] --------------------------------------------
> [    3.808421] kworker/1:2/108 is trying to acquire lock:
> [    3.808449] c36b70a4 (&client->lock){+.+.}-{3:3}, at: host1x_client_re=
sume+0x17/0x58
> [    3.808586]=20
>                but task is already holding lock:
> [    3.808603] c34df8a4 (&client->lock){+.+.}-{3:3}, at: host1x_client_re=
sume+0x17/0x58
> [    3.808712]=20
>                other info that might help us debug this:
> [    3.808729]  Possible unsafe locking scenario:
>=20
> [    3.808744]        CPU0
> [    3.808757]        ----
> [    3.808771]   lock(&client->lock);
> [    3.808810]   lock(&client->lock);
> [    3.808821]=20
>                 *** DEADLOCK ***
>=20
> [    3.808825]  May be due to missing lock nesting notation
>=20
> [    3.808829] 15 locks held by kworker/1:2/108:
> [    3.808836]  #0: c20068a8 ((wq_completion)events){+.+.}-{0:0}, at: pro=
cess_one_work+0x15a/0x608
> [    3.808878]  #1: c2bbbf18 (deferred_probe_work){+.+.}-{0:0}, at: proce=
ss_one_work+0x15a/0x608
> [    3.808912]  #2: c366d4d8 (&dev->mutex){....}-{3:3}, at: __device_atta=
ch+0x29/0xdc
> [    3.808953]  #3: c141a980 (devices_lock){+.+.}-{3:3}, at: host1x_clien=
t_register+0x35/0xfc
> [    3.808986]  #4: c34df64c (&host1x->devices_lock){+.+.}-{3:3}, at: hos=
t1x_client_register+0x51/0xfc
> [    3.809017]  #5: c34ed4d8 (&dev->mutex){....}-{3:3}, at: __device_atta=
ch+0x29/0xdc
> [    3.809050]  #6: c13faf5c (registration_lock){+.+.}-{3:3}, at: registe=
r_framebuffer+0x2d/0x274
> [    3.809092]  #7: c132566c (console_lock){+.+.}-{0:0}, at: register_fra=
mebuffer+0x219/0x274
> [    3.809124]  #8: c36e7848 (&fb_info->lock){+.+.}-{3:3}, at: register_f=
ramebuffer+0x19f/0x274
> [    3.809157]  #9: c36d2d6c (&helper->lock){+.+.}-{3:3}, at: __drm_fb_he=
lper_restore_fbdev_mode_unlocked+0x41/0x8c
> [    3.809199]  #10: c36f00e8 (&dev->master_mutex){+.+.}-{3:3}, at: drm_m=
aster_internal_acquire+0x17/0x28
> [    3.809233]  #11: c36d2c50 (&client->modeset_mutex){+.+.}-{3:3}, at: d=
rm_client_modeset_commit_locked+0x1d/0x138
> [    3.809272]  #12: c2bbba28 (crtc_ww_class_acquire){+.+.}-{0:0}, at: dr=
m_client_modeset_commit_atomic+0x2f/0x1c4
> [    3.809306]  #13: c36e6448 (crtc_ww_class_mutex){+.+.}-{3:3}, at: drm_=
modeset_backoff+0x63/0x190
> [    3.809337]  #14: c34df8a4 (&client->lock){+.+.}-{3:3}, at: host1x_cli=
ent_resume+0x17/0x58
> [    3.809369]=20
>                stack backtrace:
> [    3.809375] CPU: 1 PID: 108 Comm: kworker/1:2 Tainted: G        W     =
    5.12.0-rc3-next-20210319-00176-g60867e51e180 #7219
> [    3.809387] Hardware name: NVIDIA Tegra SoC (Flattened Device Tree)
> [    3.809396] Workqueue: events deferred_probe_work_func
> [    3.809417] [<c010d1ad>] (unwind_backtrace) from [<c010961d>] (show_st=
ack+0x11/0x14)
> [    3.809447] [<c010961d>] (show_stack) from [<c0b7d7c9>] (dump_stack+0x=
9f/0xb8)
> [    3.809467] [<c0b7d7c9>] (dump_stack) from [<c0179eef>] (__lock_acquir=
e+0x7fb/0x253c)
> [    3.809495] [<c0179eef>] (__lock_acquire) from [<c017c403>] (lock_acqu=
ire+0xf3/0x420)
> [    3.809516] [<c017c403>] (lock_acquire) from [<c0b87663>] (__mutex_loc=
k+0x87/0x814)
> [    3.809544] [<c0b87663>] (__mutex_lock) from [<c0b87e09>] (mutex_lock_=
nested+0x19/0x20)
> [    3.809565] [<c0b87e09>] (mutex_lock_nested) from [<c05ccd2f>] (host1x=
_client_resume+0x17/0x58)
> [    3.809587] [<c05ccd2f>] (host1x_client_resume) from [<c05ccd37>] (hos=
t1x_client_resume+0x1f/0x58)
> [    3.809604] [<c05ccd37>] (host1x_client_resume) from [<c061d9a3>] (teg=
ra_crtc_atomic_enable+0x33/0x21c4)
> [    3.809634] [<c061d9a3>] (tegra_crtc_atomic_enable) from [<c05e0355>] =
(drm_atomic_helper_commit_modeset_enables+0x131/0x16c)
> [    3.809667] [<c05e0355>] (drm_atomic_helper_commit_modeset_enables) fr=
om [<c05e0e89>] (drm_atomic_helper_commit_tail_rpm+0x1d/0x4c)
> [    3.809691] [<c05e0e89>] (drm_atomic_helper_commit_tail_rpm) from [<c0=
610157>] (tegra_atomic_commit_tail+0x83/0x84)
> [    3.809712] [<c0610157>] (tegra_atomic_commit_tail) from [<c05e1271>] =
(commit_tail+0x71/0x138)
> [    3.809732] [<c05e1271>] (commit_tail) from [<c05e1b95>] (drm_atomic_h=
elper_commit+0xf1/0x114)
> [    3.809753] [<c05e1b95>] (drm_atomic_helper_commit) from [<c0607355>] =
(drm_client_modeset_commit_atomic+0x199/0x1c4)
> [    3.809777] [<c0607355>] (drm_client_modeset_commit_atomic) from [<c06=
07401>] (drm_client_modeset_commit_locked+0x3d/0x138)
> [    3.809798] [<c0607401>] (drm_client_modeset_commit_locked) from [<c06=
07517>] (drm_client_modeset_commit+0x1b/0x2c)
> [    3.809818] [<c0607517>] (drm_client_modeset_commit) from [<c05e5c4f>]=
 (__drm_fb_helper_restore_fbdev_mode_unlocked+0x73/0x8c)
> [    3.809842] [<c05e5c4f>] (__drm_fb_helper_restore_fbdev_mode_unlocked)=
 from [<c05e5cc9>] (drm_fb_helper_set_par+0x2d/0x4c)
> [    3.809862] [<c05e5cc9>] (drm_fb_helper_set_par) from [<c056c763>] (fb=
con_init+0x1cb/0x370)
> [    3.809883] [<c056c763>] (fbcon_init) from [<c05af8c7>] (visual_init+0=
x8b/0xc8)
> [    3.809902] [<c05af8c7>] (visual_init) from [<c05b07c5>] (do_bind_con_=
driver+0x13d/0x2b4)
> [    3.809919] [<c05b07c5>] (do_bind_con_driver) from [<c05b0b93>] (do_ta=
ke_over_console+0xdf/0x15c)
> [    3.809937] [<c05b0b93>] (do_take_over_console) from [<c056b1df>] (do_=
fbcon_takeover+0x4f/0x90)
> [    3.809955] [<c056b1df>] (do_fbcon_takeover) from [<c056545d>] (regist=
er_framebuffer+0x1a5/0x274)
> [    3.809977] [<c056545d>] (register_framebuffer) from [<c05e57cf>] (__d=
rm_fb_helper_initial_config_and_unlock+0x29f/0x438)
> [    3.809999] [<c05e57cf>] (__drm_fb_helper_initial_config_and_unlock) f=
rom [<c06115e1>] (tegra_drm_fb_init+0x25/0x5c)
> [    3.810022] [<c06115e1>] (tegra_drm_fb_init) from [<c060feff>] (host1x=
_drm_probe+0x247/0x404)
> [    3.810041] [<c060feff>] (host1x_drm_probe) from [<c0647ad9>] (really_=
probe+0xb1/0x2a4)
> [    3.810064] [<c0647ad9>] (really_probe) from [<c0647d0b>] (driver_prob=
e_device+0x3f/0x78)
> [    3.810086] [<c0647d0b>] (driver_probe_device) from [<c0646737>] (bus_=
for_each_drv+0x4f/0x78)
> [    3.810107] [<c0646737>] (bus_for_each_drv) from [<c06479d5>] (__devic=
e_attach+0x95/0xdc)
> [    3.810127] [<c06479d5>] (__device_attach) from [<c064702d>] (bus_prob=
e_device+0x5d/0x64)
> [    3.810147] [<c064702d>] (bus_probe_device) from [<c064581b>] (device_=
add+0x293/0x5c0)
> [    3.810166] [<c064581b>] (device_add) from [<c05cd211>] (host1x_subdev=
_register+0x8d/0xac)
> [    3.810186] [<c05cd211>] (host1x_subdev_register) from [<c05cd4d3>] (h=
ost1x_client_register+0x8f/0xfc)
> [    3.810204] [<c05cd4d3>] (host1x_client_register) from [<c061870f>] (t=
egra_dc_probe+0x1bf/0x2b0)
> [    3.810225] [<c061870f>] (tegra_dc_probe) from [<c064977b>] (platform_=
probe+0x43/0x80)
> [    3.810247] [<c064977b>] (platform_probe) from [<c0647ad9>] (really_pr=
obe+0xb1/0x2a4)
> [    3.810266] [<c0647ad9>] (really_probe) from [<c0647d0b>] (driver_prob=
e_device+0x3f/0x78)
> [    3.810286] [<c0647d0b>] (driver_probe_device) from [<c0646737>] (bus_=
for_each_drv+0x4f/0x78)
> [    3.810307] [<c0646737>] (bus_for_each_drv) from [<c06479d5>] (__devic=
e_attach+0x95/0xdc)
> [    3.810326] [<c06479d5>] (__device_attach) from [<c064702d>] (bus_prob=
e_device+0x5d/0x64)
> [    3.810346] [<c064702d>] (bus_probe_device) from [<c0647379>] (deferre=
d_probe_work_func+0x4d/0x70)
> [    3.810367] [<c0647379>] (deferred_probe_work_func) from [<c0139557>] =
(process_one_work+0x1eb/0x608)
> [    3.810391] [<c0139557>] (process_one_work) from [<c0139a6d>] (worker_=
thread+0xf9/0x3bc)
> [    3.810411] [<c0139a6d>] (worker_thread) from [<c013f3db>] (kthread+0x=
ff/0x134)
> [    3.810432] [<c013f3db>] (kthread) from [<c0100159>] (ret_from_fork+0x=
11/0x38)
> [    3.810449] Exception stack(0xc2bbbfb0 to 0xc2bbbff8)

Sounds like we should decouple this from the series and fast-track this
for v5.13, or perhaps even v5.12 along with the DC coupling fix?

Thierry

--ycKTxQBNHbcJSd6i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmBZwNgACgkQ3SOs138+
s6HTehAAu4QEPwwJFoucJfdb9SOeCGRCRTfDM9fuM07fYsaR6d87aISrA/UwNPy5
Louk0D73zp4Lb6QPSGNkCW11Gd/QCOuzHnbiQOu+NlWhHGYSQVw5DDYJihdPuTYZ
OYP0SKdQB7XnVC6rQwIEvf968stj/zi/HlmWf68Js4PoFg7j4ZEEAnJIT7Z0Dyay
bRDQdG09kpvt9ZLDOFHgcEz9eC9obCTHnOFawu30Mu4vts94RitKEA+cdb9w7Zpv
QCE7qS/9xwJhIoMFOmhIkAqp05gFiL8EqYxNtWXEVsc7s0BZ/1k+tKxoZKBcqEF1
8W8neTvyYnOb54MoouWtnM1A8K6VoeAJgXZCGN/YSKQiXLdB4ZCIRJbzFd9QPpHK
5bUJHWpL3Gru+qulkqXENDZ2i4exvvHKjVKffAFzqjOzHq3mw5T5Q2RUx9L4CAn0
MYosz5DAzwOKeyZly0bmWAH5sOw7ItUcsno+rFoPtBpOvXct6UtG407SxgE40HmU
C/nPT040DB/sN78MT2L+XRZIe2d9lUexvAmyh6CE9TvDTdbeYJrZjqGvhQZHSqO7
HH1/QLqEuMqvkkeQUnghaQ2QvqRe2ymgiVExtETevJNsl8Q5tXKckPp1U4t444eR
eRGgekZVs54LExt70DDlhkhGdCj3NZ6GBEcJG2vpwi47h7X99YE=
=miAu
-----END PGP SIGNATURE-----

--ycKTxQBNHbcJSd6i--

--===============0894113103==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0894113103==--
