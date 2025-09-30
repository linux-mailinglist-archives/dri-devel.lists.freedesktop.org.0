Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FCB4BAC3AC
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 11:17:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 781C210E29A;
	Tue, 30 Sep 2025 09:17:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y7/YmSA8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FACE10E29A;
 Tue, 30 Sep 2025 09:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759223825; x=1790759825;
 h=mime-version:content-transfer-encoding:in-reply-to:
 references:subject:from:cc:to:date:message-id;
 bh=C8Cg/mdMvEeqn4tYaiyZTCeXPJbQSpUX3pWcbQSKvc4=;
 b=Y7/YmSA8MGiUq1aphO5nDNG1qxPX8LWnQrE6zHAO4ujyqNkGc1DnG0Hn
 fVhXdr4+IicdrgVLsK+vJxmQ3wr4669Ci286ELcAKu3VITMmKkmshEHWD
 8LIes5lQ/D0r/VZlUApgGTQCQcuQZbdKYHQ8d588gPvUdLqcDHPEV/lMU
 kSKbsUB72Gg+JG83gjgOLzzPmsRpj0pYi1T7Is19B+jrWINu27VUGuMEn
 Z7NNK3rI3mB1xq3ydfq6F64xEogeWZZgFa6ilDldva4IUe+JKm8t7RVPu
 AzqVHJFh9rjZBNbytTcqYJD3/kx5t4BGAQ3GeCQo7PGcjKI/BDASGVj+e Q==;
X-CSE-ConnectionGUID: F2SEYjNXSkKP+9ND+TYCGw==
X-CSE-MsgGUID: AYqI9ozcQYW7AHhCIg0Okw==
X-IronPort-AV: E=McAfee;i="6800,10657,11568"; a="61518887"
X-IronPort-AV: E=Sophos;i="6.18,304,1751266800"; d="scan'208";a="61518887"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 02:17:04 -0700
X-CSE-ConnectionGUID: amLqGN/MRZ6HIppG/Vrd5g==
X-CSE-MsgGUID: e79KT6whTIWD6ZWc8522TQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,304,1751266800"; d="scan'208";a="178074674"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.108])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 02:17:01 -0700
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAGfirffPy5biFVLtSNEW60UCXa6_=-=NrQbU7iLQ8+BXnFQ=1A@mail.gmail.com>
References: <CAGfirffPy5biFVLtSNEW60UCXa6_=-=NrQbU7iLQ8+BXnFQ=1A@mail.gmail.com>
Subject: Re: BUG: unable to handle kernel NULL pointer dereference in
 eb_release_vmas
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: jani.nikula@linux.intel.com, rodrigo.vivi@intel.com, tursulin@ursulin.net,
 airlied@gmail.com, simona@ffwll.ch, andi.shyti@linux.intel.com,
 ville.syrjala@linux.intel.com, nitin.r.gote@intel.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 syzkaller@googlegroups.com
To: intel-gfx@lists.freedesktop.org,
 =?utf-8?b?6rmA6rCV66+8?= <km.kim1503@gmail.com>
Date: Tue, 30 Sep 2025 12:16:58 +0300
Message-ID: <175922381867.30706.10351894191632562572@jlahtine-mobl>
User-Agent: alot/0.12.dev7+g16b50e5f
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

Hi,

Can you please open a bug as per the instructions in:

https://drm.pages.freedesktop.org/intel-docs/how-to-file-i915-bugs.html

Thanks in advance!

Regards, Joonas
