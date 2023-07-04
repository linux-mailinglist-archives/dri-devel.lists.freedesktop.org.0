Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF33C746C18
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jul 2023 10:37:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E54210E09C;
	Tue,  4 Jul 2023 08:37:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87AFD10E09C;
 Tue,  4 Jul 2023 08:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688459830; x=1719995830;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=e8gLwcZzeO72npmU6MumfcPKN+ua5xNlilXyaSjNRac=;
 b=RQ+I29riZZ54dBB9JJe8UiByKGI20RT5ao3y3WGeEU1b+J/SLbl/MMVD
 YFP/ZZL4i8agmfix0oHSLQ3hHB8KmMYlDPyCZjtFIiJPKoJrZclNHF55z
 9cS9LX0/yJ+dBF5kT1SVx1L2HFDVQHh2ugMPovm8xfSEjojYes2WCQpSR
 GYZTIy7FlP9VwBPcFrcrFI4KlgUr9rl/OnJkgIbyIJ53Zj8wYPi0UGZhY
 yvRWw59zpXTkqvhPLqWLAEYKjueMc84gtiv6dm+WI9DKoj1GjBp/PGOYu
 jgBxUAzN8k5d3gtd5OVF6P/HPGIingbV6kOTQQaEek/POH77TqtJkKp80 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="343406509"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; d="scan'208";a="343406509"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2023 01:37:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="669014207"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; d="scan'208";a="669014207"
Received: from jbouhlil-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.48.173])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2023 01:37:06 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Uros Bizjak <ubizjak@gmail.com>
Subject: Re: [PATCH] drm/i915/pmu: Use local64_try_cmpxchg in
 i915_pmu_event_read
In-Reply-To: <CAFULd4YDHqUud94Q1mbKyKqGHh==Gv7+FpNhgm5s1p=0ZwcAXg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230703150859.6176-1-ubizjak@gmail.com>
 <87o7ks16gh.fsf@intel.com>
 <CAFULd4YDHqUud94Q1mbKyKqGHh==Gv7+FpNhgm5s1p=0ZwcAXg@mail.gmail.com>
Date: Tue, 04 Jul 2023 11:37:04 +0300
Message-ID: <87lefw139r.fsf@intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 04 Jul 2023, Uros Bizjak <ubizjak@gmail.com> wrote:
> On Tue, Jul 4, 2023 at 9:28=E2=80=AFAM Jani Nikula <jani.nikula@linux.int=
el.com> wrote:
>> You could save everyone a lot of time by actually documenting what these
>> functions do. Assume you don't know what local64_try_cmpxchg() does, and
>> see how many calls you have to go through to figure it out.
>
> These functions are documented in Documentation/atomic_t.txt (under
> "RMW ops:" section), and the difference is explained in a separate
> section "CMPXCHG vs TRY_CMPXCGS" in the same file.

Thanks, but *sigh*.

No kernel-doc above the functions, not even a regular comment
referencing atomic_t.txt.

$ git grep local.*_try -- Documentation
[nothing]


BR,
Jani.


--=20

"But the plans were on display..."

"On display? I eventually had to go down to the cellar to find them."

"That's the display department."

"With a flashlight."

"Ah, well, the lights had probably gone."

"So had the stairs."

"But look, you found the notice, didn't you?"

"Yes," said Arthur, "yes I did. It was on display in the bottom of a
locked filing cabinet stuck in a disused lavatory with a sign on the
door saying 'Beware of the Leopard'."

- Douglas Adams, The Hitchhiker's Guide to the Galaxy=20

--=20
Jani Nikula, Intel Open Source Graphics Center
