Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F7179EE272
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2024 10:16:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09C5D10E2E6;
	Thu, 12 Dec 2024 09:16:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XMdc5Ira";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80CB210E208;
 Thu, 12 Dec 2024 09:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733994969; x=1765530969;
 h=mime-version:content-transfer-encoding:in-reply-to:
 references:subject:from:cc:to:date:message-id;
 bh=dHeloRYBZqsQ8YzyY7XBOB5omPuvszkfJNuWwK6lNHY=;
 b=XMdc5IraW2VNZTWG3GXwwwrapjbQTfOYtKl+Bl/G3TPNe98FmiGcHjwO
 pk5ZE7KgV5r2zEJtWpDOKZPBNGTHMdFk/3vsGvqKYjb9rNNl5UU12Q35+
 ADdLdKCsy93Feydhp9Gw1xZpgsW2pfyE2PJrHydQVoSzrYiqALbXAV/H7
 I6S3mDhNuvShV9vHQnc8yuvnDgX/159NiePGCuEaS10uXSsPhQb8/ZYHn
 gUwnf4cqhsDvPlZxpyuX+ELeeINfeAogDFYRGDmRZ1wHPbJ35tkQQch57
 rxHzpPQ7jInyJ/6sOwxcGM0HTvbWH1z4SBI9FZvfXQe4wAMsvJP3eOu/D A==;
X-CSE-ConnectionGUID: 3j+ZJFfiTIyyR74G5sKlIA==
X-CSE-MsgGUID: +mbxnEmDS0aK3pfoRnXoQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11283"; a="45012968"
X-IronPort-AV: E=Sophos;i="6.12,228,1728975600"; d="scan'208";a="45012968"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2024 01:16:09 -0800
X-CSE-ConnectionGUID: m2CkNjQTSoK0df2r8N+k6Q==
X-CSE-MsgGUID: 04tjzyQ5Tq++r5Fz+HHSxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,228,1728975600"; d="scan'208";a="95928861"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.28])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2024 01:16:05 -0800
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <Z1fDsvIKB4j_-Tv_@infradead.org>
References: <20241209133318.1806472-1-mika.kuoppala@linux.intel.com>
 <20241209133318.1806472-2-mika.kuoppala@linux.intel.com>
 <Z1fDsvIKB4j_-Tv_@infradead.org>
Subject: Re: [PATCH 01/26] ptrace: export ptrace_may_access
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, Oleg Nesterov <oleg@redhat.com>,
 linux-kernel@vger.kernel.org, Dave Airlie <airlied@redhat.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>, Andi Shyti <andi.shyti@intel.com>,
 Maciej Patelczyk <maciej.patelczyk@linux.intel.com>,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>
To: Christoph Hellwig <hch@infradead.org>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Date: Thu, 12 Dec 2024 11:16:02 +0200
Message-ID: <173399496234.20348.12425394481969055234@jlahtine-mobl.ger.corp.intel.com>
User-Agent: alot/0.10
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

Quoting Christoph Hellwig (2024-12-10 06:29:38)
> On Mon, Dec 09, 2024 at 03:32:52PM +0200, Mika Kuoppala wrote:
> > xe driver would like to allow fine grained access control
> > for GDB debugger using ptrace. Without this export, the only
> > option would be to check for CAP_SYS_ADMIN.
> >=20
> > The check intended for an ioctl to attach a GPU debugger
> > is similar to the ptrace use case: allow a calling process
> > to manipulate a target process if it has the necessary
> > capabilities or the same permissions, as described in
> > Documentation/process/adding-syscalls.rst.
> >=20
> > Export ptrace_may_access function to allow GPU debugger to
> > have identical access control for debugger(s)
> > as a CPU debugger.
>=20
> This seems to mis an actual user or you forgot to Cc linux-kernel on it.

Right, that is a miss on our side. For the time being, the whole series
can be found in lore archive:

https://lore.kernel.org/dri-devel/20241209133318.1806472-1-mika.kuoppala@li=
nux.intel.com/

The user is introduced in patch: [PATCH 03/26] drm/xe/eudebug: Introduce di=
scovery for resources [1]

Essentially, we want to check if PID1 has permission to ptrace PID2, before=
 we grant the
permission for PID1 to debug the GPU address space/memory of PID2.

Mika, please do Cc the relevant other patches of the series to LKML for nex=
t iteration.

Regards, Joonas

[1] https://lore.kernel.org/dri-devel/20241209133318.1806472-1-mika.kuoppal=
a@linux.intel.com/T/#md3d005faaaac1ba01451b139a634e5545c2a266f
