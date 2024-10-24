Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A38B39AE0CC
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2024 11:31:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED98B10E8E3;
	Thu, 24 Oct 2024 09:31:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.b="JSoqJntJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAC0010E8E3;
 Thu, 24 Oct 2024 09:31:17 +0000 (UTC)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49O7X44G026963;
 Thu, 24 Oct 2024 09:30:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=pp1; bh=ad3G7t
 gT1LngrbCIX5zxplfREJhzCNpOY81vO9NiHaw=; b=JSoqJntJJMYj6dZwqdaVVU
 020F4AtcQvGN330K1KOAPMVgEeu+nDHuiJh5VgYMiIyIWfYxydU5vejx4VeEhicx
 ywEHKuPTrN/VxW9AsAlrfnkw+I8BJVgWo9qdLOykjrNhWK7BdewaDaVNTu+5zEzv
 /OUATsvFRaMqVDccpfSYGmSfhtCdcV0gQEnoWKJV6rRx7DSsShbCPprVX5U7Q7kC
 K60ljMe4HsbX69v7Hf5jvRo2tFHMK6sKJgEjtYQJEe3UP9LiNGRLFBQOnv/unHUS
 Sap4hmsjcpSkjGbE+LIaaFaZggd2kHmA4m3ZR+5XiQg8Y1EBqjHSQOMH30i385yg
 ==
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42fhxnrjmq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Oct 2024 09:30:52 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
 by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 49O9UqU1015425;
 Thu, 24 Oct 2024 09:30:52 GMT
Received: from ppma21.wdc07v.mail.ibm.com
 (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42fhxnrjmg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Oct 2024 09:30:52 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
 by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 49O6otaq014287;
 Thu, 24 Oct 2024 09:30:50 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
 by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 42emhfqptj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Oct 2024 09:30:50 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com
 [10.20.54.103])
 by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 49O9UmIP12452224
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 24 Oct 2024 09:30:48 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8D14C2004B;
 Thu, 24 Oct 2024 09:30:48 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 42C3E20043;
 Thu, 24 Oct 2024 09:30:48 +0000 (GMT)
Received: from oc-fedora.boeblingen.de.ibm.com (unknown [9.152.212.119])
 by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTPS;
 Thu, 24 Oct 2024 09:30:48 +0000 (GMT)
Date: Thu, 24 Oct 2024 11:30:40 +0200
From: Niklas Schnelle <schnelle@linux.ibm.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, Arnd Bergmann <arnd@arndb.de>,
 Brian Cain <bcain@quicinc.com>, Marcel Holtmann <marcel@holtmann.org>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Dave Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Dave Airlie <airlied@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, "Maciej W. Rozycki" <macro@orcam.me.uk>,
 Heiko Carstens <hca@linux.ibm.com>
Cc: linux-kernel@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-bluetooth@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux.dev, spice-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-serial@vger.kernel.org,
 Linux-Arch <linux-arch@vger.kernel.org>, Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH v8 3/5] drm: handle HAS_IOPORT dependencies
Message-ID: <eptfarsehuuiulqz5523xu7h26jvb365rd3u5mx3mmubw74uld@53ebnpkpq6sc>
References: <20241008-b4-has_ioport-v8-0-793e68aeadda@linux.ibm.com>
 <20241008-b4-has_ioport-v8-3-793e68aeadda@linux.ibm.com>
 <64cc9c8f-fff3-4845-bb32-d7f1046ef619@suse.de>
 <a25086c4-e2fc-4ffc-bc20-afa50e560d96@app.fastmail.com>
 <aa679655-290e-4d19-9195-1a581431b9e6@suse.de>
 <892ba1e2f94a278813621a4872e841d66456e2f7.camel@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <892ba1e2f94a278813621a4872e841d66456e2f7.camel@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: wJpB2cynEZVL7E3mkIzZ2ArKfrNnIlDQ
X-Proofpoint-GUID: Fwu-J5BH5WGsugJjHbEIa2RHlaLwjr2D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0
 mlxlogscore=999 malwarescore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 mlxscore=0 suspectscore=0 lowpriorityscore=0
 phishscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410240073
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

On Mon, Oct 21, 2024 at 01:18:20PM +0200, Niklas Schnelle wrote:
> On Mon, 2024-10-21 at 12:58 +0200, Thomas Zimmermann wrote:
> > Hi
> > 
> > Am 21.10.24 um 12:08 schrieb Arnd Bergmann:
> > > On Mon, Oct 21, 2024, at 07:52, Thomas Zimmermann wrote:
> > > > Am 08.10.24 um 14:39 schrieb Niklas Schnelle:
> > > d 100644
> > > > > --- a/drivers/gpu/drm/qxl/Kconfig
> > > > > +++ b/drivers/gpu/drm/qxl/Kconfig
> > > > > @@ -2,6 +2,7 @@
> > > > >    config DRM_QXL
> > > > >    	tristate "QXL virtual GPU"
> > > > >    	depends on DRM && PCI && MMU
> > > > > +	depends on HAS_IOPORT
> > > > Is there a difference between this style (multiple 'depends on') and the
> > > > one used for gma500 (&& && &&)?
> > > No, it's the same. Doing it in one line is mainly useful
> > > if you have some '||' as well.
> > > 
> > > > > @@ -105,7 +106,9 @@ static void bochs_vga_writeb(struct bochs_device *bochs, u16 ioport, u8 val)
> > > > >    
> > > > >    		writeb(val, bochs->mmio + offset);
> > > > >    	} else {
> > > > > +#ifdef CONFIG_HAS_IOPORT
> > > > >    		outb(val, ioport);
> > > > > +#endif
> > > > Could you provide empty defines for the out() interfaces at the top of
> > > > the file?
> > > That no longer works since there are now __compiletime_error()
> > > versions of these funcitons. However we can do it more nicely like:
> > > 
> > > diff --git a/drivers/gpu/drm/tiny/bochs.c b/drivers/gpu/drm/tiny/bochs.c
> > > index 9b337f948434..034af6e32200 100644
> > > --- a/drivers/gpu/drm/tiny/bochs.c
> > > +++ b/drivers/gpu/drm/tiny/bochs.c
> > > @@ -112,14 +112,12 @@ static void bochs_vga_writeb(struct bochs_device *bochs, u16 ioport, u8 val)
> > >   	if (WARN_ON(ioport < 0x3c0 || ioport > 0x3df))
> > >   		return;
> > >   
> > > -	if (bochs->mmio) {
> > > +	if (!IS_DEFINED(CONFIG_HAS_IOPORT) || bochs->mmio) {
> > >   		int offset = ioport - 0x3c0 + 0x400;
> > >   
> > >   		writeb(val, bochs->mmio + offset);
> > >   	} else {
> > > -#ifdef CONFIG_HAS_IOPORT
> > >   		outb(val, ioport);
> > > -#endif
> > >   	}
> > 
> > For all functions with such a pattern, could we use:
> > 
> > bool bochs_uses_mmio(bochs)
> > {
> >      return !IS_DEFINED(CONFIG_HAS_IOPORT) || bochs->mmio
> > }
> > 
> > void writeb_func()
> > {
> >      if (bochs_uses_mmio()) {
> >        writeb()
> > #if CONFIG_HAS_IOPORT
> >      } else {
> >        outb()
> > #endif
> >      }
> > }
> > 
> 
> I think if the helper were __always_inline we could still take
> advantage of the dead code elimination and combine this with Arnd's
> approach. Though I feel like it is a bit odd to try to do the MMIO
> approach despite bochs->mmio being false on !HAS_IOPORT systems.
> Is that what you wanted to correct by keeping the #ifdef
> CONFIG_HAS_IOPORT around the else? And yes the warning makes sense to
> me too.

Working on this now, I think we don't need a warning in the bochs_uses_mmio()
helper because we should never get here with !IS_ENABLED(CONFIG_HAS_IOPORT)
at runtime thanks to the check added in bochs_hw_init(). This also takes
care of my original worry that we might try writeb()/readb() with an invalid
bochs->mmio value. I'll sent a v9 with the helper added and #ifdefs's removed.

Thanks,
Niklas
