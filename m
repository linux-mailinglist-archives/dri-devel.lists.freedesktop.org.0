Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2C668D02C5
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2024 16:08:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 029F410E0B1;
	Mon, 27 May 2024 14:08:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i2fkXIN3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A1B410E0B1;
 Mon, 27 May 2024 14:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716818921; x=1748354921;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=ZXwbZiy8td+gubmN1p/8TtpDqubSKNzO4ViE717nqXo=;
 b=i2fkXIN3qIZXOB6GjN8+mdHyAdSxcYPQrg4uqgFOaN5L+oxERO6bMHW6
 2fLcZoiLTlIFRMge9mHZ8O7/DlC3LSQH2isSURHETggYYomos77puKs91
 BEhH+FXlOffStyKDfwbNmT/xHwISpc/mpZ/DHUVLD30a3vH6Nycje4UP8
 A3SBtftCVqQVa/oPcvTUIryrllkOEFQ+bhg4uQr6MMUyLZiQi+cvmY4xH
 71rsqSjHv5bhxpS2wnaXo2K1osDORWq6DUairG4zBR4+4pFpgRRr777w/
 t0D/qx4dWSMhODTC3/8R8UJcZN5E+y8GMs39x7Ck8JwmsbKxm27PFXlI3 w==;
X-CSE-ConnectionGUID: +4B0NfmcTJ+PpXDU7RcLNw==
X-CSE-MsgGUID: U8VjLrZiTlqBvbp9YCiUTQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13314251"
X-IronPort-AV: E=Sophos;i="6.08,192,1712646000"; d="scan'208";a="13314251"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2024 07:08:40 -0700
X-CSE-ConnectionGUID: WclyaCNiQxKBcSASf3gFJQ==
X-CSE-MsgGUID: e/YtuAi0SRKK8zGxEOOCBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,192,1712646000"; d="scan'208";a="39318700"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.200])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2024 07:08:37 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, Kees Cook <keescook@chromium.org>, Andy
 Shevchenko <andy@kernel.org>
Subject: Re: [PATCH 2/2] drm: use mem_is_zero() instead of !memchr_inv(s, 0, n)
In-Reply-To: <CAHp75Ve0vyOv3KNY_7286wLKd8u6HOvu0Trm17rs46h-BOGsfA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240527094320.2653177-1-jani.nikula@intel.com>
 <20240527094320.2653177-2-jani.nikula@intel.com>
 <CAHp75Ve0vyOv3KNY_7286wLKd8u6HOvu0Trm17rs46h-BOGsfA@mail.gmail.com>
Date: Mon, 27 May 2024 17:08:34 +0300
Message-ID: <87h6ejmjod.fsf@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 27 May 2024, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> On Mon, May 27, 2024 at 12:43=E2=80=AFPM Jani Nikula <jani.nikula@intel.c=
om> wrote:
>>
>> Use the mem_is_zero() helper where possible.
>
> ...
>
>> -       if (memchr_inv(guid, 0, 16) =3D=3D NULL) {
>> +       if (mem_is_zero(guid, 16)) {
>>                 tmp64 =3D get_jiffies_64();
>>                 memcpy(&guid[0], &tmp64, sizeof(u64));
>>                 memcpy(&guid[8], &tmp64, sizeof(u64));
>
> What is the type of guid? Shouldn't it be guid_t with the respective
> guid_is_null()

I can leave out these parts of the patch.

BR,
Jani.

>
> ...
>
>> -       if (memchr_inv(guid, 0, 16))
>> +       if (!mem_is_zero(guid, 16))
>>                 return true;
>
> Ditto.

--=20
Jani Nikula, Intel
