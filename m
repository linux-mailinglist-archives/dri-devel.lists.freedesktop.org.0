Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A6B318CD78
	for <lists+dri-devel@lfdr.de>; Fri, 20 Mar 2020 13:07:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 445406EB14;
	Fri, 20 Mar 2020 12:07:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20FDF6EB14
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Mar 2020 12:07:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: shadeslayer) with ESMTPSA id 3F3CE297408
From: Rohan Garg <rohan.garg@collabora.com>
To: dri-devel@lists.freedesktop.org, Jerome Glisse <jglisse@redhat.com>
Subject: Re: Proposal to report GPU private memory allocations with sysfs
 nodes [plain text version]
Date: Fri, 20 Mar 2020 13:07:26 +0100
Message-ID: <12494517.uLZWGnKmhe@solembum>
Organization: Collabora Ltd.
In-Reply-To: <CAKT=dDmMs1VOFst3gVUbsAp8yFuvV9e+zq0DqayBQ8G7+utc7g@mail.gmail.com>
References: <CAKT=dDnhth-6giOWgym7qpLNeH=86=XhQmPcgHM2J8B_L3myRQ@mail.gmail.com>
 <1931035.d46ecxlGCF@saphira>
 <CAKT=dDmMs1VOFst3gVUbsAp8yFuvV9e+zq0DqayBQ8G7+utc7g@mail.gmail.com>
MIME-Version: 1.0
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
Cc: Alistair Delva <adelva@google.com>, Prahlad Kilambi <prahladk@google.com>,
 Yiwei Zhang <zzyiwei@google.com>, Sean Paul <seanpaul@chromium.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Kenny Ho <y2kenny@gmail.com>,
 Chris Forbes <chrisforbes@google.com>,
 Android Kernel Team <kernel-team@android.com>
Content-Type: multipart/mixed; boundary="===============0240737050=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0240737050==
Content-Type: multipart/signed; boundary="nextPart2725416.e9J7NaK4W3"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart2725416.e9J7NaK4W3
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Yiwei
After some deliberation on how to move forward with my BO Labeling patches[1],
we've come up with the following structure for debugfs entries:

/debugfs/dri/128/bo/<handle>/label
/debugfs/dri/128/bo/<handle>/size

My initial idea was to count the total memory allocated for a particular label 
in kernel space, but that turned out to be far too complicated to implement. 
Which is why we decided to move towards something simpler and handle collating 
this information on the userspace side of things.

Would this satisfy most of the Android  teams requirements? I understand that 
it would leave out the memory tracking requirements tied to a specific PID, 
but correct me if I'm wrong, would this not possible with gralloc on Android?

Cheers
Rohan Garg

[1] https://patchwork.freedesktop.org/patch/335508/?series=66752&rev=4

On lunes, 6 de enero de 2020 21:47:21 (CET) Yiwei Zhang wrote:
> Thanks, I'll check it out.
> 
> Best,
> Yiwei
> 
> On Mon, Jan 6, 2020 at 2:46 AM Rohan Garg <rohan.garg@collabora.com> wrote:
> > Hi Yiwei
> > 
> > On jueves, 19 de diciembre de 2019 19:52:26 (CET) Yiwei Zhang wrote:
> > > Hi Rohan,
> > > 
> > > Thanks for pointing out the pids issue! Then the index would be
> > 
> > {namespace
> > 
> > > + pid(in that namespace)}. I'll grab a setup and play with the driver to
> > > see what I can do. I know how to find an Intel or Freedreno setup, but
> > 
> > I'd
> > 
> > > still like to know is there a development friendly Mali setup?
> > 
> > You should be able to setup a Mali T860 compatible device with this guide
> > [1].
> > 
> > Cheers
> > Rohan Garg
> > 
> > [1] https://panfrost.freedesktop.org/building-panfrost-mesa.html


--nextPart2725416.e9J7NaK4W3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEYitc3NselT9dMmhSpwS9TvJnIJQFAl50sf4ACgkQpwS9TvJn
IJTAkw//cLeQWZ0PqUJaF/4Dcoh2FpdYbjOgeViwigIKvMDf9I+ienbllaDLqcmd
Tftl4FpTMhYQn52qDC7QNYHrYzaJxwCKI4kc5GFO2ihIZwGtXqc8AA+ngT6uj8Vf
/+o/eHUUswCTg/ovuZ0CxDhwI/auTgtG2QuByx/LVKkLUnH6YgiHagjuzP/Fxm+1
C1YLwEsj0iXIYe/mVWa/vDPMpo2NIC9sIXNXxmNF3iLsOahA4a5l8lmfz78RmZPl
VM8zz99iB0U9hm20G9NiIBwCThYRNMBEgiqaLEa/VlKBpdhjSojqvxUAuo59Nq3I
pf3L1iF8NobKLssKVOHbC3fk7aoLgSm4P7u6xCjM4z+pz7aA2Pm43A24wq9b14tI
DpB6BIN9U+Qx9wt/ODXQSoKiJ2RS3LJI6yebFOzr4jiAIJdtbRuvZ/CnZPPm4wv6
vcWEz4whSNn7a3zieBOl/UMdO38XZtxwl7H5Z1LJJsSyiKrzZ183a7vDex9ui4j8
8i2uZZvNSbDlreyh8CQa1LctPDx2lHBt6yVtJUB2T3yqU+gxdznq361PrM6ApWnO
f81AqZbX76cjOsI6OLfNkvrBQtat+d6t6RIip+mFDhATW+P/DWOL3MmOAVy4WbEH
m/sesVoFaGYjHrUZbDCCJI0jxq1WrglPalnJLMLNbCPa+5Q+UAw=
=i9Li
-----END PGP SIGNATURE-----

--nextPart2725416.e9J7NaK4W3--




--===============0240737050==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0240737050==--



