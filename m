Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OEutM2pgjGmWlwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 11:56:42 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CCFD123A9F
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 11:56:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BBD610E394;
	Wed, 11 Feb 2026 10:56:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="AqimoI6M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DBD810E01F;
 Wed, 11 Feb 2026 10:56:37 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4f9wNJ5fDgz9tpf;
 Wed, 11 Feb 2026 11:56:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1770807392; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8D2K+brmcX9jyLHAA/rQuQznyMmiZsmCIlbxqnliqqs=;
 b=AqimoI6MrWRJ/OVq1KjxAIVBZFJ8CbxzfeYbkIgj+wiOrcquAsbvKT9Ma+OrMQQeEJBuDr
 egMts1/FDconUdwxJfr7TpJQBvMexWM1Q6KD2O/puui71a3trxgSVhTlGkFoKK4nyDI5pU
 0uxWVjzj8soaNgSEWsOzMzeQgYC/FPMS+42dj/OmqtAiJS7HJNmtS5h2s33ENMgh6qqybx
 zt+v2fnjTuBzeQpN5Jl1ZQA+cnQhI/39baMhMV5ubSyK+ykZZxI8SZh4R2iTquG56lfAMZ
 iJHNo/9/7uIXw5paJTSR3JB+DdwdJJX4ZZOrmvftc6GHrTjfpyqEdZW6mr7W3A==
Message-ID: <ef514066e5771e8ac1deb3ae6baa14b798305fd2.camel@mailbox.org>
Subject: Re: [PATCH v6 06/31] drm/sched: Add some scheduling quality unit tests
From: Philipp Stanner <phasta@mailbox.org>
To: kernel test robot <lkp@intel.com>, Tvrtko Ursulin
 <tvrtko.ursulin@igalia.com>, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 kernel-dev@igalia.com,  Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Danilo Krummrich <dakr@kernel.org>, Matthew
 Brost <matthew.brost@intel.com>, Philipp Stanner <phasta@kernel.org>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Date: Wed, 11 Feb 2026 11:56:27 +0100
In-Reply-To: <202601292335.YI2PBzhs-lkp@intel.com>
References: <20260128110806.38350-7-tvrtko.ursulin@igalia.com>
 <202601292335.YI2PBzhs-lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: c4318eafb0eaf8ea950
X-MBO-RS-META: 8856ey5gqawaq6z5rij179qc97fac74p
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
Reply-To: phasta@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	HAS_REPLYTO(0.00)[phasta@kernel.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phasta@mailbox.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[mailbox.org:+];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mailbox.org:mid,mailbox.org:dkim,intel.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,gitlab.freedesktop.org:url]
X-Rspamd-Queue-Id: 2CCFD123A9F
X-Rspamd-Action: no action

On Thu, 2026-01-29 at 23:31 +0800, kernel test robot wrote:
> Hi Tvrtko,
>=20
> kernel test robot noticed the following build errors:
>=20
> [auto build test ERROR on drm-misc/drm-misc-next]
> [also build test ERROR on drm-xe/drm-xe-next daeinki-drm-exynos/exynos-dr=
m-next drm/drm-next drm-i915/for-linux-next drm-i915/for-linux-next-fixes d=
rm-tip/drm-tip linus/master v6.19-rc7 next-20260128]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]

Hi Tvrtko,

what about this build error? Seems to be an Xe branch conflict?


BTW, I think Danilo and I told you a few times already that we would
like to get the whole patch series into our inboxes. You seem to
exclude patches for other components, but it's important for me to see
all the other driver maintainers' RBs etc. there and be easily able to
ping those who haven't reacted yet and so on. Also quickly coyping an
mbox to test-apply something etc. etc. is easier

I guess you want to spare people from noisy mail traffic, but getting
31 patches is not a problem, those who don't care can simple ignore
them or collapse the thread in their mail program and so on.


Thanks
P.


>=20
> url:=C2=A0=C2=A0=C2=A0 https://github.com/intel-lab-lkp/linux/commits/Tvr=
tko-Ursulin/drm-amdgpu-Reject-impossible-entities-early/20260128-191117
> base:=C2=A0=C2=A0 https://gitlab.freedesktop.org/drm/misc/kernel.git=C2=
=A0drm-misc-next
> patch link:=C2=A0=C2=A0=C2=A0 https://lore.kernel.org/r/20260128110806.38=
350-7-tvrtko.ursulin%40igalia.com
> patch subject: [PATCH v6 06/31] drm/sched: Add some scheduling quality un=
it tests
> config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20260=
129/202601292335.YI2PBzhs-lkp@intel.com/config)
> compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project=C2=
=A07cbf1a2591520c2491aa35339f227775f4d3adf6)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20260129/202601292335.YI2PBzhs-lkp@intel.com/reproduce)
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes: https://lore.kernel.org/oe-kbuild-all/202601292335.YI2PBzhs-lkp=
@intel.com/
>=20
> All errors (new ones prefixed by >>):
>=20
> > > drivers/gpu/drm/scheduler/tests/tests_scheduler.c:676:10: error: init=
ializer element is not a compile-time constant
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_sched_scheduler_two_clien=
ts_attr),
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
> =C2=A0=C2=A0 include/kunit/test.h:224:13: note: expanded from macro 'KUNI=
T_CASE_PARAM_ATTR'
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .attr =3D attributes, .mod=
ule_name =3D KBUILD_MODNAME}
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~~~
> =C2=A0=C2=A0 1 error generated.
>=20
>=20
> vim +676 drivers/gpu/drm/scheduler/tests/tests_scheduler.c
>=20
> =C2=A0=C2=A0 672=09
> =C2=A0=C2=A0 673	static struct kunit_case drm_sched_scheduler_two_clients=
_tests[] =3D {
> =C2=A0=C2=A0 674		KUNIT_CASE_PARAM_ATTR(drm_sched_scheduler_two_clients_t=
est,
> =C2=A0=C2=A0 675				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_sched_scheduler_tw=
o_clients_gen_params,
> =C2=A0> 676				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_sched_scheduler_two_cli=
ents_attr),
> =C2=A0=C2=A0 677		{}
> =C2=A0=C2=A0 678	};
> =C2=A0=C2=A0 679=09
>=20

