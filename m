Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DAB15378E6
	for <lists+dri-devel@lfdr.de>; Mon, 30 May 2022 12:21:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E42610E51A;
	Mon, 30 May 2022 10:21:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C1F810E50D
 for <dri-devel@lists.freedesktop.org>; Mon, 30 May 2022 10:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653906110; x=1685442110;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=dYVHeIWN8WVuHvLRderCgM3pu/MLqIHVS5BHSz2DUvc=;
 b=PG0piEamFoJmVgnXJauvNpMU6791V+8Q3qXJdb94aihSNq67QAGjCILI
 KNM4wsHFVRbWKfiEERSFn1HBr2Ml+hJMzXrSzwKAls+H5AwgWTcCnsujL
 FxmDaQLmAeFugCTeKubg2VZ3MVtvzuYC/VG50nD83lLBcAmIrvNiUQpAH
 MXMiEhwKKDw6Iyiom9umyPcUBxkdwk4CUSftDVWy5yt340UKBrOtk+Akc
 FbDGl8Kntir0ZJe0ChUkOvQKsCW95fSKJay1i8nF9AuiHismLwEqx11i4
 NUTF7cgNnFMj3Po+0Xwxhrg5dRNHwPJ5Y+FbtX8P3kcabC4WeKjFgCadz w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10362"; a="361339488"
X-IronPort-AV: E=Sophos;i="5.91,262,1647327600"; d="scan'208";a="361339488"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2022 03:21:50 -0700
X-IronPort-AV: E=Sophos;i="5.91,262,1647327600"; d="scan'208";a="605118579"
Received: from jkuna-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.150.228])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2022 03:21:46 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Pekka Paalanen <ppaalanen@gmail.com>, Simon Ser <contact@emersion.fr>
Subject: Re: How should "max bpc" KMS property work?
In-Reply-To: <20220525133647.052d09da@eldfell>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220426113502.224d0a90@eldfell> <YmgyArRaJCh6JkQh@intel.com>
 <57d16ed5-8bfc-ce29-9250-14e2de18710a@redhat.com>
 <20220523112246.056ddc99@eldfell>
 <CA+hFU4wTHR9kLrFY3XkbeROZgxWamiZ6yGYL4jH+wpe8MzLvMw@mail.gmail.com>
 <20220525102850.5a70e58f@eldfell>
 <80798931-dbe7-54d7-8e1a-aaebfc39780c@mailbox.org>
 <U2A3FifHdFH9yDVrigaioxCTNx60MgkND7jcyIeKP2S4Ghu-BmmRaODqBDp6K0Q-aPBjPcqa2zUGuJNkGmRWZyQx2FjRJe9dVtJhQG9ZNCk=@emersion.fr>
 <20220525133647.052d09da@eldfell>
Date: Mon, 30 May 2022 13:21:44 +0300
Message-ID: <874k17tj5z.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 Michel =?utf-8?Q?D=C3=A4nz?= =?utf-8?Q?er?= <michel.daenzer@mailbox.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Hans de Goede <hdegoede@redhat.com>,
 Jonas =?utf-8?Q?=C3=85dahl?= <jadahl@redhat.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 25 May 2022, Pekka Paalanen <ppaalanen@gmail.com> wrote:
> Use two separate KMS properties for reporting current vs.
> programming desired. The KMS property reporting the current value
> must be read-only (immutable). This preserves the difference between
> what userspace wanted and what it got, making it possible to read
> back both without confusing them. It also allows preserving driver behaviour

This seems like a common theme. Wondering if we should evolve helpers to
create a property pair like this in one go.

BR,
Jani.

-- 
Jani Nikula, Intel Open Source Graphics Center
