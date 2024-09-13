Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32101977C13
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2024 11:19:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7A0710ECD4;
	Fri, 13 Sep 2024 09:19:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19BA810ECD4
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 09:19:23 +0000 (UTC)
Received: from icess-ProLiant-DL380-Gen10.. (unknown [183.174.60.14])
 by APP-03 (Coremail) with SMTP id rQCowAAXHHyEA+RmIphXAw--.1451S2;
 Fri, 13 Sep 2024 17:19:12 +0800 (CST)
From: Ma Ke <make24@iscas.ac.cn>
To: alain.volmat@foss.st.com
Cc: airlied@gmail.com, akpm@linux-foundation.org, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, laurent.pinchart@ideasonboard.com,
 linux-kernel@vger.kernel.org, maarten.lankhorst@linux.intel.com,
 make24@iscas.ac.cn, mripard@kernel.org, stable@vger.kernel.org,
 tzimmermann@suse.de
Subject: Re: [PATCH RESEND] drm/sti: avoid potential dereference of error
 pointers
Date: Fri, 13 Sep 2024 17:19:00 +0800
Message-Id: <20240913091900.2025122-1-make24@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240912070118.GA3783204@gnbcxd0016.gnb.st.com>
References: <20240912070118.GA3783204@gnbcxd0016.gnb.st.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-CM-TRANSID: rQCowAAXHHyEA+RmIphXAw--.1451S2
X-Coremail-Antispam: 1UD129KBjvJXoWxXr1kWFW5JFyfZry3Gr4fGrg_yoW5GFy8pr
 W7GF1j9rWYqa17J3s2qw1qqF4S9395K3y7Gr98G3s2qw1Dtry3GF1akr43ua15Wry8Gw1Y
 yF9F9FZIqay5ZaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUBI14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
 JVWxJr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26r
 xl6s0DM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVAC
 Y4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJV
 W8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI2
 0VAGYxC7M4IIrI8v6xkF7I0E8cxan2IY04v7MxkF7I0En4kS14v26r1q6r43MxAIw28Icx
 kI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2Iq
 xVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42
 IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY
 6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aV
 CY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VU122NtUUUUU==
X-Originating-IP: [183.174.60.14]
X-CM-SenderInfo: ppdnvj2u6l2u1dvotugofq/
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

Alain Volmat<alain.volmat@foss.st.com> wrote:=0D
> Hi,=0D
> =0D
> I probably went a bit fast on the commit message.  It seems to me that=0D
> the Fixes line would be probably better with below one instead.=0D
> =0D
> Fixes: dd86dc2f9ae1 ("drm/sti: implement atomic_check for the planes")=0D
> =0D
> The same fix is actually necessary for all planes (cursor / gdp / hqvdp),=
=0D
> which is related to the same original commit.  Hence sti_cursor/sti_gdp=0D
> and sti_hqvdp.=0D
> =0D
> Would you be ok to have those 3 fixes within a commit ?=0D
> =0D
> Regards,=0D
> Alain=0D
> =0D
> On Tue, Sep 10, 2024 at 07:25:43PM +0200, Alain Volmat wrote:=0D
> > Hi,=0D
> > =0D
> > Thanks for your patch.=0D
> > =0D
> > Acked-by: Alain Volmat <alain.volmat@foss.st.com>=0D
> > =0D
> > Regards,=0D
> > Alain=0D
> > =0D
> > On Mon, Aug 26, 2024 at 01:26:52PM +0800, Ma Ke wrote:=0D
> > > The return value of drm_atomic_get_crtc_state() needs to be=0D
> > > checked. To avoid use of error pointer 'crtc_state' in case=0D
> > > of the failure.=0D
> > > =0D
> > > Cc: stable@vger.kernel.org=0D
> > > Fixes: dec92020671c ("drm: Use the state pointer directly in planes a=
tomic_check")=0D
> > > =0D
> > > Signed-off-by: Ma Ke <make24@iscas.ac.cn>=0D
> > > ---=0D
> > >  drivers/gpu/drm/sti/sti_cursor.c | 2 ++=0D
> > >  1 file changed, 2 insertions(+)=0D
> > > =0D
> > > diff --git a/drivers/gpu/drm/sti/sti_cursor.c b/drivers/gpu/drm/sti/s=
ti_cursor.c=0D
> > > index db0a1eb53532..e460f5ba2d87 100644=0D
> > > --- a/drivers/gpu/drm/sti/sti_cursor.c=0D
> > > +++ b/drivers/gpu/drm/sti/sti_cursor.c=0D
> > > @@ -200,6 +200,8 @@ static int sti_cursor_atomic_check(struct drm_pla=
ne *drm_plane,=0D
> > >  		return 0;=0D
> > >  =0D
> > >  	crtc_state =3D drm_atomic_get_crtc_state(state, crtc);=0D
> > > +	if (IS_ERR(crtc_state))=0D
> > > +		return PTR_ERR(crtc_state);=0D
> > >  	mode =3D &crtc_state->mode;=0D
> > >  	dst_x =3D new_plane_state->crtc_x;=0D
> > >  	dst_y =3D new_plane_state->crtc_y;=0D
> > > -- =0D
> > > 2.25.1=0D
> > > =0D
Hi=EF=BC=8C=0D
=0D
I appreciate your guidance regarding the modification of the Fixes tag. As =
=0D
your observation, I have also identified the additional instance=0D
(sti_hqvdp_atomic_check) where a similar issue exists, necessitating the =0D
same patch. I have recognized the problem and was in the process of =0D
reporting it. To prevent any confusion and ensure accurate reporting, I =0D
have updated the patch already submitted as patch v2. The issue in =0D
sti_hqvdp_atomic_check has also been reported, and I kindly request you to =
=0D
review it.(I am not very familiar with how to combine the reporting of =0D
vulnerabilities in multiple functions, so to avoid unnecessary errors or =0D
confusion, I reported them one by one. Hope for your understanding.) Thank =
=0D
you for your prompt response. Your assistance is invaluable to me.=0D
=0D
Best regards,=0D
Ma Ke=

