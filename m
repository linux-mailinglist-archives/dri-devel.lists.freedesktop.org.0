Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2611B7DCC10
	for <lists+dri-devel@lfdr.de>; Tue, 31 Oct 2023 12:46:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 260E310E116;
	Tue, 31 Oct 2023 11:46:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BB0810E116;
 Tue, 31 Oct 2023 11:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698752761; x=1730288761;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=/yq1RVlNm6tZQvfQXhB0bbLvhcRCOBHe93SCZE+4CC0=;
 b=EoebP5Q1gV8FIdfT5rBWkOGtrV67ymCDA+myUl0L4BehppUzEnF+npQs
 ae8nk661pyyOmxcGxKvtvxUJx5UO5QMx3/A31do2SGCvmE2omhGpemu78
 NbtDAGJH0gScgb5djiaCqt90F7wfcjPMj4X9leoarluI6kjL1RK5nZA09
 XI+tEBwaWM8T2ReR/EngEI29wHEQCRnjWcV2n5cOTI2OS3N++3n6Djkfr
 kUdM8HPdoIEMM+pc4f2JysDCW6m4n/nici8WezucvYSJYpG9xSKBV9FdB
 A1AZpMLpKQDoKUaLNB9byeW4BhxD69C151jjCTqWMevG26B+oOCD7ZwMj g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="388093007"
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200"; d="scan'208";a="388093007"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2023 04:46:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="904318456"
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200"; d="scan'208";a="904318456"
Received: from moelschl-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.51.45])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2023 04:45:57 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Danilo Krummrich <dakr@redhat.com>, airlied@gmail.com, daniel@ffwll.ch,
 matthew.brost@intel.com, sarah.walker@imgtec.com,
 donald.robson@imgtec.com, boris.brezillon@collabora.com,
 christian.koenig@amd.com, faith@gfxstrand.net
Subject: Re: [PATCH drm-misc-next v7 4/7] drm/gpuvm: add an abstraction for
 a VM / BO combination
In-Reply-To: <f00a4975cf32c3ae28124343a2c994acda083829.camel@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20231023201659.25332-1-dakr@redhat.com>
 <20231023201659.25332-5-dakr@redhat.com>
 <f00a4975cf32c3ae28124343a2c994acda083829.camel@linux.intel.com>
Date: Tue, 31 Oct 2023 13:45:54 +0200
Message-ID: <87zfzz3thp.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 31 Oct 2023, Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.co=
m> wrote:
> On Mon, 2023-10-23 at 22:16 +0200, Danilo Krummrich wrote:
>> + * Returns: a pointer to the &drm_gpuvm_bo on success, NULL on
>
> Still needs s/Returns:/Return:/g

FWIW, both work to accommodate the variance across the kernel, although
I think only the latter is documented and recommended. It's also the
most popular:

  10577 Return
   3596 Returns
   1104 RETURN
    568 return
    367 returns
    352 RETURNS
      1 RETURNs

BR,
Jani.


--=20
Jani Nikula, Intel
