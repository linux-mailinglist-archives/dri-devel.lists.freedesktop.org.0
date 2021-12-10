Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 60DCE46FEC5
	for <lists+dri-devel@lfdr.de>; Fri, 10 Dec 2021 11:30:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8695910E537;
	Fri, 10 Dec 2021 10:30:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56AA610E535;
 Fri, 10 Dec 2021 10:30:16 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10193"; a="301706704"
X-IronPort-AV: E=Sophos;i="5.88,195,1635231600"; d="scan'208";a="301706704"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2021 02:30:15 -0800
X-IronPort-AV: E=Sophos;i="5.88,195,1635231600"; d="scan'208";a="517179939"
Received: from mpcorrig-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.4.173])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2021 02:30:08 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Daniele Ceraolo Spurio
 <daniele.ceraolospurio@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/guc: Use correct context lock when
 callig clr_context_registered
In-Reply-To: <439fb357-cdda-2996-bb63-eaf41a7fe4d1@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20211209184814.21125-1-matthew.brost@intel.com>
 <d1fb9875-4af7-301e-cd83-9aeb7e8a5b52@intel.com>
 <439fb357-cdda-2996-bb63-eaf41a7fe4d1@linux.intel.com>
Date: Fri, 10 Dec 2021 12:30:01 +0200
Message-ID: <877dcc3g7q.fsf@intel.com>
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

On Fri, 10 Dec 2021, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com> wrote:
> On 09/12/2021 19:14, Daniele Ceraolo Spurio wrote:
>>=20
>>=20
>> On 12/9/2021 10:48 AM, Matthew Brost wrote:
>>> s/ce/cn/ when grabbing guc_state.lock before calling
>>> clr_context_registered.
>>>
>>> Fixes: 0f7976506de61 ("drm/i915/guc: Rework and simplify locking")
>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>> Cc: <stable@vger.kernel.org>
>
> I think Cc: stable is not needed here:
>
> $ git tag --contains 0f7976506de61
> drm-intel-fixes-2021-11-18
> drm-intel-gt-next-2021-10-08
> drm-intel-gt-next-2021-10-21
> drm-intel-gt-next-2021-11-22
> drm-intel-next-2021-10-15
> drm-intel-next-fixes-2021-11-09
> v5.16-rc1
> v5.16-rc2
> v5.16-rc3
> v5.16-rc4

'dim fixes 0f7976506de61' concurs.

BR,
Jani.






>
> So still can hit 5.16 via fixes. Rodrigo, did I get this right and you=20
> will be able to pick it up next week or so?
>
>> Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>>=20
>> I'm assuming we didn't see any splat from the lockdep assert in=20
>> clr_context_registered in our CI runs because we never hit this case as=
=20
>> it requires 64k+ contexts. Maybe we can add a selftest to purposely=20
>> exercise this path? Not a blocker for merging this fix.
>
> Was the bug found by inspection or reported?
>
> Given the buggy function is called steal_guc_id, so if the implication=20
> is there is no testing for guc id stealing, then it indeed please add=20
> some coverage ASAP.
>
> Regards,
>
> Tvrtko
>
>>=20
>> Daniele
>>=20
>>> ---
>>> =C2=A0 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 4 ++--
>>> =C2=A0 1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c=20
>>> b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>> index 1f9d4fde421f..9b7b4f4e0d91 100644
>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>> @@ -1937,9 +1937,9 @@ static int steal_guc_id(struct intel_guc *guc,=20
>>> struct intel_context *ce)
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 list_del_init(&c=
n->guc_id.link);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ce->guc_id =3D c=
n->guc_id;
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 spin_lock(&ce->guc_state.lo=
ck);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 spin_lock(&cn->guc_state.lo=
ck);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 clr_context_regi=
stered(cn);
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 spin_unlock(&ce->guc_state.=
lock);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 spin_unlock(&cn->guc_state.=
lock);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 set_context_guc_=
id_invalid(cn);
>>=20

--=20
Jani Nikula, Intel Open Source Graphics Center
