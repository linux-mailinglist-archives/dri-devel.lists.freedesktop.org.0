Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B43ECAC6AA
	for <lists+dri-devel@lfdr.de>; Mon, 08 Dec 2025 08:49:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6312E10E0D8;
	Mon,  8 Dec 2025 07:49:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="fuyCgF08";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F9C210E0D8
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Dec 2025 07:49:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1765180115; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=ipiTebBwC6hNl8e/08TZhdxr9uOWsHlgUeDTK0ogBXJgCHJ89Tc/MUuAL3YsE31KLMNx9enhgPVL1VVtyvLjYcs6THJez6FfIhl8ifxhZtJE8ZbpcmlC6kZNdX4vS17DgG3iGojYyjg9Fyx3UioVqPkqGpJeabZMFSwXSX5iZ4k=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1765180115;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=Wecwc9o8tbKQDuTk1MgiAMDXw3RQp0/C2OWU9JCzcx0=; 
 b=TEUI2zWM7uQa4VnjcPl4yQusJJBaTfej4OOVZ9NF9b1nLuxLxBU46zuV8biDK9t5W6pD/PkrDBliW6SCI/o9YULAsUDyxCHhN9mCbOi+dGg0J9v9NEgMbAaXlsJDH4Z9BmIW5xigxZfva4oZU9hWseBnpN6kMz72UQuCrPE7deM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1765180115; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
 bh=Wecwc9o8tbKQDuTk1MgiAMDXw3RQp0/C2OWU9JCzcx0=;
 b=fuyCgF088U5W8YFUPNBhR6NhgcVsEvtcMPyxHuC+J8lliw7glAmHOMwtEUL5rPek
 bRbWavI4y7uLjpOgTUn/q4E4IjaYQU6X4s9be2ZZQ8+3jyXYddtK/cJxzmfK/ZeN20J
 uQe+JW3t1WITF/trVIElutX73eGLkwgWt6/UcNHs=
Received: by mx.zohomail.com with SMTPS id 1765180113613818.8643704905451;
 Sun, 7 Dec 2025 23:48:33 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Chia-I Wu <olvaffe@gmail.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 kernel@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/2] drm/panthor: Add tracepoint for hardware utilisation
 changes
Date: Mon, 08 Dec 2025 08:48:28 +0100
Message-ID: <10765657.nUPlyArG6x@workhorse>
In-Reply-To: <CAPaKu7SQP9jYmq5UCA98_YmO50st6ChBjYNjYNON7-YAWozzaQ@mail.gmail.com>
References: <20251203-panthor-tracepoints-v1-0-871c8917e084@collabora.com>
 <15112867.uLZWGnKmhe@workhorse>
 <CAPaKu7SQP9jYmq5UCA98_YmO50st6ChBjYNjYNON7-YAWozzaQ@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
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

On Friday, 5 December 2025 22:16:44 Central European Standard Time Chia-I W=
u wrote:
> On Fri, Dec 5, 2025 at 2:48=E2=80=AFAM Nicolas Frattaroli
> <nicolas.frattaroli@collabora.com> wrote:
> >
> > On Thursday, 4 December 2025 21:21:08 Central European Standard Time Ch=
ia-I Wu wrote:
> > > On Wed, Dec 3, 2025 at 6:04=E2=80=AFAM Nicolas Frattaroli
> > > <nicolas.frattaroli@collabora.com> wrote:
> > > >
> > > > Mali GPUs have three registers that indicate which parts of the har=
dware
> > > > are powered and active at any moment. These take the form of bitmap=
s. In
> > > > the case of SHADER_PWRACTIVE for example, a high bit indicates that=
 the
> > > > shader core corresponding to that bit index is active. These bitmaps
> > > > aren't solely contiguous bits, as it's common to have holes in the
> > > > sequence of shader core indices, and the actual set of which cores =
are
> > > > present is defined by the "shader present" register.
> > > >
> > > > When the GPU finishes a power state transition, it fires a
> > > > GPU_IRQ_POWER_CHANGED_ALL interrupt. After such an interrupt is
> > > > received, the PWRACTIVE registers will likely contain interesting n=
ew
> > > > information.
> > > I am seeing
> > >
> > >    irq/342-panthor-412     [000] .....   934.526754: gpu_power_active:
> > > shader_bitmap=3D0x0 tiler_bitmap=3D0x0 l2_bitmap=3D0x0
> > >    irq/342-panthor-412     [000] .....   936.640356: gpu_power_active:
> > > shader_bitmap=3D0x0 tiler_bitmap=3D0x0 l2_bitmap=3D0x0
> > >
> > > on a gpu-bound test. It does not look like collecting samples on
> > > GPU_IRQ_POWER_CHANGED_ALL gives too much info.
> >
> > On what GPU and SoC is that? If it's MT8196 then I wouldn't be
> > surprised if it just broke that hardware register, considering
> > what it did to the SHADER_PRESENT register.
> Indeed I was on mt8196.

I don't have much faith in the Mali integration of that SoC being
representative of how the Mali hardware is supposed to work. The
SHADER_PRESENT thing is just the tip of the iceberg, I've also
noticed while developing mtk-mfg-pmdomain that it seemingly messes
with the Mali GPU's internal MCU from the GPUEB depending on the
commands you send it, and can get it into a broken state with
enough luck.

Check if the registers ever read anything but 0, e.g. by dumping
them from sysfs like this:

=2D--
diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/pantho=
r/panthor_drv.c
index d1d4c50da5bf..b0e67dc17c92 100644
=2D-- a/drivers/gpu/drm/panthor/panthor_drv.c
+++ b/drivers/gpu/drm/panthor/panthor_drv.c
@@ -1678,8 +1678,69 @@ static ssize_t profiling_store(struct device *dev,
=20
 static DEVICE_ATTR_RW(profiling);
=20
+static ssize_t print_active_bitmask(char *buf, ssize_t len, u64 present, u=
64 active)
+{
+	unsigned int i =3D 0;
+	u64 bit;
+
+	while (present) {
+		bit =3D BIT(i);
+		if (present & bit) {
+			present &=3D ~bit;
+			len +=3D sysfs_emit_at(buf, len, "%s", (active & bit) ? "1" : "0");
+		} else {
+			len +=3D sysfs_emit_at(buf, len, "_");
+		}
+		i++;
+	}
+
+	return len;
+}
+
+static ssize_t power_active_show(struct device *dev, struct device_attribu=
te *attr,
+				 char *buf)
+{
+	struct panthor_device *ptdev =3D dev_get_drvdata(dev);
+	ssize_t len =3D 0;
+	u64 present;
+	int ret;
+
+	if (pm_runtime_suspended(ptdev->base.dev))
+		return sysfs_emit(buf, "Shader:\t0\nTiler:\t0\nL2:\t0\n");
+
+	ret =3D pm_runtime_resume_and_get(ptdev->base.dev);
+	if (ret)
+		return ret;
+
+	len +=3D sysfs_emit_at(buf, len, "Shader:\t");
+	len +=3D print_active_bitmask(buf, len, gpu_read64(ptdev, GPU_SHADER_PRES=
ENT),
+				    gpu_read64(ptdev, SHADER_PWRACTIVE));
+	len +=3D sysfs_emit_at(buf, len, "\n");
+
+	present =3D gpu_read64(ptdev, GPU_TILER_PRESENT);
+	if (present =3D=3D 0x1) /* "Implementation defined", just try to dump all=
 */
+		present =3D U64_MAX;
+	len +=3D sysfs_emit_at(buf, len, "Tiler:\t");
+	len +=3D print_active_bitmask(buf, len, present, gpu_read64(ptdev, TILER_=
PWRACTIVE));
+	len +=3D sysfs_emit_at(buf, len, "\n");
+
+	present =3D gpu_read64(ptdev, GPU_L2_PRESENT);
+	if (present =3D=3D 0x1) /* "Implementation defined", just try to dump all=
 */
+		present =3D U64_MAX;
+	len +=3D sysfs_emit_at(buf, len, "L2:\t");
+	len +=3D print_active_bitmask(buf, len, present, gpu_read64(ptdev, L2_PWR=
ACTIVE));
+	len +=3D sysfs_emit_at(buf, len, "\n");
+
+	pm_runtime_put(ptdev->base.dev);
+
+	return len;
+}
+
+static DEVICE_ATTR_RO(power_active);
+
 static struct attribute *panthor_attrs[] =3D {
 	&dev_attr_profiling.attr,
+	&dev_attr_power_active.attr,
 	NULL,
 };
=2D--

If they always read 0 regardless of whether you're running a GPU
workload or not, then it's just not properly wired up.

> >
> > On RK3588 (v10), GPU_IRQ_POWER_CHANGED_ALL reliably fires when
> > there is new information available in those registers. I haven't
> > tried on MT8196 (v13) yet because that still doesn't boot with
> > mainline so testing anything is a pain.
> >
> > I don't have any v12 or v11 hardware to test with. From what I
> > understand, there's no open enough platform to do v11 testing on,
> > just the Pixel 8 and Pixel 9. I could look into the Cix SoC for v12
> > though some day, but I don't own one at the moment.
> >
> > >
> > > I think they are more useful to be collected periodically, such that
> > > we know that in the past X seconds, Y out of a total of Z samples
> > > indicates activities. That's best done in userspace, and panthor's
> > > role should be to provide an uapi such as
> > > https://lore.kernel.org/all/cover.1743517880.git.lukas.zapolskas@arm.=
com/.
> >
> > This wouldn't give you information on the time a power transition has
> > completed, which is one of the motivations. A periodically collected
> > PWRACTIVE would just be roughly correlated to how busy the GPU is,
> > which isn't very useful additional information as the performance
> > counters themselves are likely a better source of that kind of info.
> {SHADER,TILER,L2}_READY might be more appropriate if you want to trace
> power transitions?

Depends, the documentation I have access to isn't explicit about
what "READY" means. Is a busy core non-ready? Is there ever a case
where a significant number of cores are READY but not PWRACTIVE?

I can answer the first question with some more poking on RK3588,
but for the latter a simple experiment on one piece of hardware
isn't going to answer it. Plus, the core being active will probably
be more interesting than it either sitting idle but powered or
actually doing work.

>=20
> >
> > What I need to do is restrict this to <=3D v13 in the next revision
> > however, because v14 reworks this stuff.
> >
> > Kind regards,
> > Nicolas Frattaroli
> >
> >
>=20




