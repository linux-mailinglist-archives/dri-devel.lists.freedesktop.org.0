Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D2C983B686
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jan 2024 02:26:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BF4D10F494;
	Thu, 25 Jan 2024 01:25:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D078B10E58D
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jan 2024 01:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1706145926;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GSP3KRvJZeXc55WyaIHMprqoGyTLKcs92jafQO1Ntfs=;
 b=YW9d0sd8fxSfwgPSBbCKKreCoW4R3gZMy60497waQq4t2oorrX5a4S5w82JGhHZMBGcskB
 T50WxnulRJ3esHfKExSSSlmHuBz4HWMTy908xUNua+xILv8+kzRbx7Y51GcmEcqVSpUGdO
 68OxBPphrkab8798MGfY2VL4NtawaMY=
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com
 [209.85.160.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-341-k2ab5yJAODaLeG8hw3Gb3w-1; Wed, 24 Jan 2024 20:25:24 -0500
X-MC-Unique: k2ab5yJAODaLeG8hw3Gb3w-1
Received: by mail-oa1-f71.google.com with SMTP id
 586e51a60fabf-210ecfa77f1so2900332fac.2
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jan 2024 17:25:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706145923; x=1706750723;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GSP3KRvJZeXc55WyaIHMprqoGyTLKcs92jafQO1Ntfs=;
 b=v8e1A3Lmqr4MvjfrIN9pE+eZZrZGBnZOp8yjKngSvTNVR+P3hqP8zNmK2OCToSAqNV
 xniuwxMoHmVo79cY45k7PwxBlUjnwHCGuKNMCdIgDOhAYWZGkMcldUhvHsF9NBdmIooL
 dN3zsFPtQ6bwFCIbkheD0VsIhKc4CFKdfpWve6skbiAuu8H48JwOZ+PSEjibLmM3Qc0j
 G+vOZHQcE3mcYleyXXOa44oTX7/AWPRFIoELQ0qd3Ahyn1bXON0lIqmNlmLAy58EkMTx
 wHOM0ZhwAvgRJHkV5zoN+tpwg1KsTCRKCcsbUZduBPmPDDMzs2Oyw0xFng8V5qLSAVAj
 Sybg==
X-Gm-Message-State: AOJu0YyfmJkx/dInL378hQhH1JBvelgGeEv8A1hBb9EpVkb227bosEaq
 P5Swc+CEtk5I0QD2iaWl5xZasU7kJxq1LPbrQ/5meeaAe47vqO+b8CcrZvh8yFp9mv9+9D3j+bU
 7rxZxjcOWl7LnwweKV0nFRlyzXz9Lg4s+Inj4qqdWQfJeDHnhHTFluPfrojTF8bSGsxH1rASInP
 m8iRIJcgR+aLIbBKQR+afuL0NrbTyUdVYApaTaQTZs
X-Received: by 2002:a05:6871:7582:b0:206:b96f:be9f with SMTP id
 nz2-20020a056871758200b00206b96fbe9fmr176152oac.32.1706145923576; 
 Wed, 24 Jan 2024 17:25:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHkwfNBYbHFxucJs4wwgHHQ0rIemE0NXyh/QLdR+TYwJP9QJ5zxGbCHP64N2NWzZa60JX0oPPFZMp4+bN+Q9cI=
X-Received: by 2002:a05:6871:7582:b0:206:b96f:be9f with SMTP id
 nz2-20020a056871758200b00206b96fbe9fmr176130oac.32.1706145922628; Wed, 24 Jan
 2024 17:25:22 -0800 (PST)
MIME-Version: 1.0
References: <20240117221223.18540-1-oak.zeng@intel.com>
 <20240117221223.18540-22-oak.zeng@intel.com>
 <ad21ec11-a9cb-4fb2-b9fd-00a4fa11525f@intel.com>
 <PH7PR11MB70049E7E6A2F40BF6282ECC292742@PH7PR11MB7004.namprd11.prod.outlook.com>
 <PH7PR11MB700440CE88BC0A94CFF8499792742@PH7PR11MB7004.namprd11.prod.outlook.com>
 <2928ce36-06a6-4bee-b115-8dd61cc41dca@amd.com>
 <SA1PR11MB699192584C01A26C781E2F9992742@SA1PR11MB6991.namprd11.prod.outlook.com>
 <ccf34f6a-d704-43de-a15e-2ae2890f9381@amd.com>
 <SA1PR11MB699106F7114DF265A6E0964D927A2@SA1PR11MB6991.namprd11.prod.outlook.com>
In-Reply-To: <SA1PR11MB699106F7114DF265A6E0964D927A2@SA1PR11MB6991.namprd11.prod.outlook.com>
From: David Airlie <airlied@redhat.com>
Date: Thu, 25 Jan 2024 11:25:11 +1000
Message-ID: <CAMwc25rZinyFDMmvPftWwnstOQSJJR01y1X8UkDUBTLgCAZ34Q@mail.gmail.com>
Subject: Re: Making drm_gpuvm work across gpu devices
To: "Zeng, Oak" <oak.zeng@intel.com>
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
Cc: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>,
 "Thomas.Hellstrom@linux.intel.com" <Thomas.Hellstrom@linux.intel.com>,
 "Winiarski, Michal" <michal.winiarski@intel.com>,
 Felix Kuehling <felix.kuehling@amd.com>, "Welty,
 Brian" <brian.welty@intel.com>, "Shah, Ankur N" <ankur.n.shah@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Gupta,
 saurabhg" <saurabhg.gupta@intel.com>, Danilo Krummrich <dakr@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, "Brost, Matthew" <matthew.brost@intel.com>,
 "Bommu, Krishnaiah" <krishnaiah.bommu@intel.com>, "Vishwanathapura,
 Niranjana" <niranjana.vishwanathapura@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

>
>
> For us, Xekmd doesn't need to know it is running under bare metal or virt=
ualized environment. Xekmd is always a guest driver. All the virtual addres=
s used in xekmd is guest virtual address. For SVM, we require all the VF de=
vices share one single shared address space with guest CPU program. So all =
the design works in bare metal environment can automatically work under vir=
tualized environment. +@Shah, Ankur N +@Winiarski, Michal to backup me if I=
 am wrong.
>
>
>
> Again, shared virtual address space b/t cpu and all gpu devices is a hard=
 requirement for our system allocator design (which means malloc=E2=80=99ed=
 memory, cpu stack variables, globals can be directly used in gpu program. =
Same requirement as kfd SVM design). This was aligned with our user space s=
oftware stack.

Just to make a very general point here (I'm hoping you listen to
Christian a bit more and hoping he replies in more detail), but just
because you have a system allocator design done, it doesn't in any way
enforce the requirements on the kernel driver to accept that design.
Bad system design should be pushed back on, not enforced in
implementation stages. It's a trap Intel falls into regularly since
they say well we already agreed this design with the userspace team
and we can't change it now. This isn't acceptable. Design includes
upstream discussion and feedback, if you say misdesigned the system
allocator (and I'm not saying you definitely have), and this is
pushing back on that, then you have to go fix your system
architecture.

KFD was an experiment like this, I pushed back on AMD at the start
saying it was likely a bad plan, we let it go and got a lot of
experience in why it was a bad design.

Dave.

