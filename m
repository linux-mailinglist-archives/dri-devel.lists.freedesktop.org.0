Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 139EE9FE3D0
	for <lists+dri-devel@lfdr.de>; Mon, 30 Dec 2024 09:40:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E051510E0CD;
	Mon, 30 Dec 2024 08:40:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="k1Ts7Esn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 174DC10E0D7
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Dec 2024 08:40:03 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E1BE21C0004;
 Mon, 30 Dec 2024 08:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1735547981;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ozww/CUAveKXzP/E7/4wcHm/md9vRCr7Us26rY2MA+A=;
 b=k1Ts7EsnOUVhslaqug9Y1mJ+W7/+vN59JkNrTBxHV1CKy8mxMBkt1sI6wlvfp1AZAdLScz
 aesBssTAog9UzzYSU7SFqbopra5dM390woQO/ea7S8BbrQ/POowbPm54eVUAOq+cvFDwXT
 UZpDV5swHnlC9peA3sTziBtPVQ/xRwcV1qeJM+AFWwrXzPcDt+3D3N1NVGSM0i6pqPoUpe
 fHoTbb5fEEFJ/eQlPNwgvRjns/SDJTIzU7O/ANCp5aIW8lQWOCLAVYjmOWXn55xauY6hQc
 Kf2+dx8HWl2iACIFauqyPpeK4bZfGL5I4gAxIT14eriM2SPjljykuYuI524fKw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Usyskin, Alexander" <alexander.usyskin@intel.com>
Cc: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,  "Poosa, Karthik"
 <karthik.poosa@intel.com>,  "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,  Maxime Ripard
 <mripard@kernel.org>,  Thomas Zimmermann <tzimmermann@suse.de>,  David
 Airlie <airlied@gmail.com>,  Simona Vetter <simona@ffwll.ch>,  Jani Nikula
 <jani.nikula@linux.intel.com>,  Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>,  Tvrtko Ursulin <tursulin@ursulin.net>,
 "Weil, Oren jer" <oren.jer.weil@intel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 06/10] mtd: intel-dg: wake card on operations
In-Reply-To: <CY5PR11MB63663D73FA8ED331F8229AA1ED082@CY5PR11MB6366.namprd11.prod.outlook.com>
 (Alexander Usyskin's message of "Sun, 29 Dec 2024 15:08:56 +0000")
References: <20241119140112.790720-1-alexander.usyskin@intel.com>
 <20241119140112.790720-7-alexander.usyskin@intel.com>
 <Z2H_7Xry3R2fWpMZ@intel.com>
 <24725a85-47c2-49c3-b2ae-443279b2bd13@intel.com>
 <CY5PR11MB63663382E44A258B0BAEF1BAED052@CY5PR11MB6366.namprd11.prod.outlook.com>
 <CY5PR11MB6366CBE2D1AA392AD3F745F7ED052@CY5PR11MB6366.namprd11.prod.outlook.com>
 <87cyhiqk7a.fsf@bootlin.com>
 <CY5PR11MB63663D73FA8ED331F8229AA1ED082@CY5PR11MB6366.namprd11.prod.outlook.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 30 Dec 2024 09:39:39 +0100
Message-ID: <87o70ta7jo.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com
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

On 29/12/2024 at 15:08:56 GMT, "Usyskin, Alexander" <alexander.usyskin@inte=
l.com> wrote:

>>=20
>> Hello Alexander,
>>=20
>> >> If so, I have to add patch for mtd subsystem to always have device for
>> master
>> >> initialized regardless of kernel flag.
>> >> Only to initialize struct device, not to create full mtd node.
>> >>
>> >> Miquel - are you agree to this?
>>=20
>> Conceptually yes, but please mind one thing: we do not break
>> userspace. So if you want to keep the master mtd device, fine, but you
>> need to do it in a consistent way so that people not enabling the kernel
>> flag won't get a new device in their rootfs, shifting all indexes
>> upwards.
>>=20
>> That being said, you are probably going in the right direction by doing
>> that.
>>=20
>> Thanks,
>> Miqu=C3=A8l
>
> I've looked into this endeavour and seemed that there a need for special
> device class and careful attention in release flow to use right class.
> It will take time to do right.
> Miquel, Rodrigo, Karthik, Lucas - may the DG NVM code be merged in the cu=
rrent
> form and this device be added later?

In general, yes. But maybe you want to select
CONFIG_MTD_PARTITIONED_MASTER (IIUC your problem).

Thanks,
Miqu=C3=A8l
