Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09334B167F1
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jul 2025 23:00:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2012410E050;
	Wed, 30 Jul 2025 21:00:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bmailout1.hostsharing.net (bmailout1.hostsharing.net
 [83.223.95.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 530EA10E050
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jul 2025 21:00:28 +0000 (UTC)
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
 by bmailout1.hostsharing.net (Postfix) with ESMTPS id 6AE042C02AD6;
 Wed, 30 Jul 2025 23:00:26 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
 id 52DF939C007; Wed, 30 Jul 2025 23:00:26 +0200 (CEST)
Date: Wed, 30 Jul 2025 23:00:26 +0200
From: Lukas Wunner <lukas@wunner.de>
To: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>,
 Lijo Lazar <lijo.lazar@amd.com>, Ruhl@freedesktop.org,
 Michael J <michael.j.ruhl@intel.com>, Riana Tauro <riana.tauro@intel.com>,
 Anshuman Gupta <anshuman.gupta@intel.com>
Subject: Re: [RFC v5 0/5] Proposal to use netlink for RAS and Telemetry
 across drm subsystem
Message-ID: <aIqH6ip02p3WQ7Jv@wunner.de>
References: <20250730064956.1385855-1-aravind.iddamsetty@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250730064956.1385855-1-aravind.iddamsetty@linux.intel.com>
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

On Wed, Jul 30, 2025 at 12:19:51PM +0530, Aravind Iddamsetty wrote:
> Our hardware supports RAS(Reliability, Availability, Serviceability) by
> reporting the errors to the host, which the KMD processes and exposes a
> set of error counters which can be used by observability tools to take 
> corrective actions or repairs. Traditionally there were being exposed 
> via PMU (for relative counters) and sysfs interface (for absolute 
> value) in our internal branch. But, due to the limitations in this 
> approach to use two interfaces and also not able to have an event based 
> reporting or configurability, an alternative approach to try netlink 
> was suggested by community for drm subsystem wide UAPI for RAS and 
> telemetry as discussed in [2]. 
> 
> This [2] is the inspiration to this series. It uses the generic
> netlink(genl) family subsystem and exposes a set of commands that can
> be used by every drm driver, the framework provides a means to have
> custom commands too.

It seems this series was originally conceived in 2023.  In the meantime,
tooling has been introduced to auto-generate all the netlink boilerplate
code from a YAML description in Documentation/netlink/specs/.  I *think*
using it is mandatory for all newly introduced Netlink protocols.

Basically you create the uapi and kernel header files plus kernel source
like this:

tools/net/ynl/pyynl/ynl_gen_c.py --spec Documentation/netlink/specs/drm.yaml \
  --mode uapi --header
tools/net/ynl/pyynl/ynl_gen_c.py --spec Documentation/netlink/specs/drm.yaml \
  --mode kernel --header
tools/net/ynl/pyynl/ynl_gen_c.py --spec Documentation/netlink/specs/drm.yaml \
  --mode kernel --source

And then you add both the YAML file as well as the generated files to
the commit.  The reason you have to do that is because Python is
optional for building the kernel per Documentation/process/changes.rst,
so the files cannot be generated at compile time.  It is possible though
to regenerate them with tools/net/ynl/ynl-regen.sh whenever the YAML file
is changed.

ynl_gen_c.py is capable of auto-generating code for user space applications
as well.  And there's tools/net/ynl/pyynl/cli.py to listen to events or
send requests without having to write any code.

Thanks,

Lukas
