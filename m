Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B9CA73DCF7
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jun 2023 13:10:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 799B710E047;
	Mon, 26 Jun 2023 11:10:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C68A10E047
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jun 2023 11:10:45 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1qDk6W-0006UL-1D; Mon, 26 Jun 2023 13:10:00 +0200
Message-ID: <dcbc91af5ac17e7618440a693b71d8d4e2b4a8ef.camel@pengutronix.de>
Subject: Re: [PATCH v10 07/11] drm/etnaviv: Add support for the dma coherent
 device
From: Lucas Stach <l.stach@pengutronix.de>
To: Sui Jingfeng <suijingfeng@loongson.cn>, Sui Jingfeng
 <18949883232@163.com>,  Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Date: Mon, 26 Jun 2023 13:08:52 +0200
In-Reply-To: <064a39bd-cfca-2799-f72f-0e253215b927@loongson.cn>
References: <20230620094716.2231414-1-18949883232@163.com>
 <20230620094716.2231414-8-18949883232@163.com>
 <8f74f0962c8bab6c832919a5340667c54e1a7ddc.camel@pengutronix.de>
 <66fc74ae-299c-a5de-9cfb-07ae24fb3f07@loongson.cn>
 <8212078bd56c54ce508205eae0ed0b69e78d4c38.camel@pengutronix.de>
 <fd5dd250-b01e-fd00-1419-88398cb13347@loongson.cn>
 <62bf84f19318c54c50f154e1eb64a179fb2389ce.camel@pengutronix.de>
 <064a39bd-cfca-2799-f72f-0e253215b927@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: Bjorn Helgaas <bhelgaas@google.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, etnaviv@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Am Sonntag, dem 25.06.2023 um 11:51 +0800 schrieb Sui Jingfeng:
> Hi,
>=20
> On 2023/6/22 01:45, Lucas Stach wrote:
> > Am Donnerstag, dem 22.06.2023 um 01:21 +0800 schrieb Sui Jingfeng:
> > > Hi,
> > >=20
> > > On 2023/6/21 23:58, Lucas Stach wrote:
> > > > Am Mittwoch, dem 21.06.2023 um 23:30 +0800 schrieb Sui Jingfeng:
> > > > > Hi,
> > > > >=20
> > > > > On 2023/6/21 18:00, Lucas Stach wrote:
> > > > > > >     		dma_sync_sgtable_for_cpu(dev->dev, etnaviv_obj->sgt,
> > > > > > >     					 etnaviv_op_to_dma_dir(op));
> > > > > > >     		etnaviv_obj->last_cpu_prep_op =3D op;
> > > > > > > @@ -408,8 +421,9 @@ int etnaviv_gem_cpu_fini(struct drm_gem_o=
bject *obj)
> > > > > > >     {
> > > > > > >     	struct drm_device *dev =3D obj->dev;
> > > > > > >     	struct etnaviv_gem_object *etnaviv_obj =3D to_etnaviv_bo=
(obj);
> > > > > > > +	struct etnaviv_drm_private *priv =3D dev->dev_private;
> > > > > > >    =20
> > > > > > > -	if (etnaviv_obj->flags & ETNA_BO_CACHED) {
> > > > > > > +	if (!priv->dma_coherent && etnaviv_obj->flags & ETNA_BO_CAC=
HED) {
> > > > > > >     		/* fini without a prep is almost certainly a userspace =
error */
> > > > > > >     		WARN_ON(etnaviv_obj->last_cpu_prep_op =3D=3D 0);
> > > > > > >     		dma_sync_sgtable_for_device(dev->dev, etnaviv_obj->sgt,
> > > > > > > diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c b/dr=
ivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
> > > > > > > index 3524b5811682..754126992264 100644
> > > > > > > --- a/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
> > > > > > > +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
> > > > > > > @@ -112,11 +112,16 @@ static const struct etnaviv_gem_ops etn=
aviv_gem_prime_ops =3D {
> > > > > > >     struct drm_gem_object *etnaviv_gem_prime_import_sg_table(=
struct drm_device *dev,
> > > > > > >     	struct dma_buf_attachment *attach, struct sg_table *sgt)
> > > > > > >     {
> > > > > > > +	struct etnaviv_drm_private *priv =3D dev->dev_private;
> > > > > > >     	struct etnaviv_gem_object *etnaviv_obj;
> > > > > > >     	size_t size =3D PAGE_ALIGN(attach->dmabuf->size);
> > > > > > > +	u32 cache_flags =3D ETNA_BO_WC;
> > > > > > >     	int ret, npages;
> > > > > > >    =20
> > > > > > > -	ret =3D etnaviv_gem_new_private(dev, size, ETNA_BO_WC,
> > > > > > > +	if (priv->dma_coherent)
> > > > > > > +		cache_flags =3D ETNA_BO_CACHED;
> > > > > > > +
> > > > > > Drop this change. Instead etnaviv_gem_new_impl() should do the =
upgrade
> > > > > > from WC to CACHED as necessary by adding something like this:
> > > > > I understand you are a profession person in vivante GPU driver do=
main.
> > > > >=20
> > > > > I respect you reviews and instruction.
> > > > >=20
> > > > > But, I'm really reluctant to agree with this, is there any space =
to
> > > > > negotiate?
> > > > >=20
> > > > > > /*
> > > > > >     * Upgrade WC to CACHED when the device is hardware coherent=
 and the
> > > > > >     * platform doesn't allow mixing cached and writecombined ma=
ppings to
> > > > > >     * the same memory area.
> > > > > >     */
> > > > > > if ((flags & ETNA_BO_CACHE_MASK) =3D=3D ETNA_BO_WC &&
> > > > > >        dev_is_dma_coherent(dev) && !drm_arch_can_wc_memory())
> > > > > >            flags =3D (flags & ~ETNA_BO_CACHE_MASK) & ETNA_BO_CA=
CHED;
> > > > > This is policy, not a mechanism.
> > > > >=20
> > > > > Using what cache property is a user-space program's choice.
> > > > >=20
> > > > > While you are override the WC with CACHED mapping. This is not co=
rrect
> > > > > in the concept!
> > > > >=20
> > > > Please explain why you think that this isn't correct.
> > > Again,
> > >=20
> > > this is user-space things!
> > >=20
> > > this is user-space things!
> > >=20
> > > this is user-space things!
> > >=20
> > > I have explained several times.
> > >=20
> > > made the decision for the user-space program is wrong.
> > >=20
> > This mode of communication isn't helpful. Please stop it.
> >=20
> > As I tried to explain to you multiple times: if userspace can break
> > coherency by selecting the wrong mapping type then this is something
> > the kernel should prevent.
>=20
> You are right in overall.
>=20
>=20
> This is the only one benefit which WC mapping is preferred over the=20
> cached mapping.
>=20
> As you already told me,=C2=A0 the WC mapping don't *pollute CPU's cache*.
>=20
>=20
> If we can make sure that a BO is *only* going to be used by the GPU,
>=20
> then we still can choose WC mapping as the cache property of this BO.
>=20
> As the cache property is CPU side thing.
>=20
But if it only used by the GPU, then WC won't help you either as the
CPU is never touching the memory. The benefit of WC is that the CPU can
write around the cache, so if it uploads data to the GPU this data
won't pollute the cache. If the buffer is only used by the GPU, then
there is no risk of cache pollution through the CPU, right?

>=20
> > > > It allows
> > > > userspace to use WC mappings that would potentially cause loss of
> > > > coherency between CPU and GPU, which isn't acceptable.
> > > Before made the WC works correctly,=C2=A0 you need the developing env=
ironment.
> > >=20
> > > userspace program can tune the BO cache mapping easily.
> > >=20
> > > Either environment or supply a conf file.
> > >=20
> > >=20
> > > While with your implement, we don't have the opportunity to do debugg=
ing
> > > and the development.
> > You can always add a patch to your local kernel to re-allow WC mappings
> > while you work on making them behave as expected on your platform.
>=20
>=20
> We are doing the things about the *upstream*.
>=20
Upstream is not about doing experiments. You can always do those
experiments in your development kernel and if they prove to be
beneficial, we can think about how to integrate them with the upstream
kernel without the risk of inadvertently breaking things.

>=20
> >   With
> > the mainline kernel there is no way that the kernel driver will allow
> > broken coherency.
>=20
>=20
> A buffer is used by the GPU solely won't break the coherency.
>=20
>=20
> > And as I also mentioned before, there is a clear upgrade path here:
> > once WC mappings work as expected on your platform we can easily drop
> > the upgrading from the kernel driver again. The userspace driver can
> > already be changed to use CACHED BOs where beneficial on your platform
> > in the meantime.
>=20
> For our platform, I think the problem is that the GPU always write to L3=
=20
> share cache,
>=20
> even you use the WC mapping.

As long as that is the case, I think forcing the CPU to go through the
same cache by upgrading the BOs to cached is the right thing to do.
>=20
> As I already said, the WC mapping only influence the CPU side.
>=20
> How can I control the GPU when a BO is WC mapping ?

Hm, newer GPUs allow to use different AXI attributes (which include the
cachability) controlled via a pagetable setting, but I'm not sure if
the GC1000 on your platform supports this.

Can you ask your hardware guys if there is a way to set the PCI "no-
snoop" transaction flag from the GPU and if that will cause the GPU
memory accesses to bypass the L3 cache?
=20
>=20
> Does the GPU know that whether a BO=C2=A0 is WC mapping or not ?
>=20
> How can I let(or tell) the GPU that
>=20
> please not write to shared L3 cache,=C2=A0 write to the system RAM direct=
ly?
>=20
> On out platform, the coherency between the CPU and peripheral IO=20
> device's cache
>=20
> is maintained by hardware. While at here.=C2=A0 the hardware is the share=
d L3=20
> cache.
>=20
>=20
> I guess the current problem is that the GPU don't listen to me,
>=20
> he still write to CPU cache's even you choose the WC mapping.
>=20
> Then if you want to read the rendered image by CPU,
>=20
> the CPU go the un-cached path. Then I think the CPU will get wrong data.
>=20
Yes, that sounds plausible and I don't see much of a way around this
other than forcing the CPU to use the same path through the cache.

Regards,
Lucas

