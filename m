Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0ED6889907
	for <lists+dri-devel@lfdr.de>; Mon, 25 Mar 2024 10:59:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46A7B10E2F1;
	Mon, 25 Mar 2024 09:59:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fi1MsueV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A99C10E2F1;
 Mon, 25 Mar 2024 09:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711360782; x=1742896782;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=21g+WqzKwAD3zhXLEDyHsi06mSY4W7FSg1T1tMyBDdE=;
 b=fi1MsueVs/yG37kTu3KAmh3Hhsnbq2jpoZAkGHjH1eJBRtuttgzzEd8N
 sJogj1dINVWmVTILJfiNR808shE/qSd044a0xX1L7YqM4tmIVQeBiQ5AU
 pzTHP1Edh4lWa6Zjy4v/CprSiJyvs9Q0Tiq5jtVEzJ6up9NYgey5Y+w2u
 ujbEO9qhMha7jJXFaxnVe2Q5A4MUJt0F4lbp1PcfS+9w8nCsYAE7Tm86+
 6oEmLa8/IAZJ1KM8uKZoibwIHlYjOOl8nZaARcqK9QtiZ4libqCS1yNyw
 +x4V9JGjZfekOrUfUyfKXZbq6nxomLAfOKcwwEfaFzDMJqWQUkOolxkau A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11023"; a="6208016"
X-IronPort-AV: E=Sophos;i="6.07,152,1708416000"; 
   d="scan'208";a="6208016"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 02:59:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,152,1708416000"; d="scan'208";a="15592153"
Received: from idirlea-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.55.171])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 02:59:37 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, Janusz
 Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, Joonas
 Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, Ashutosh
 Dixit <ashutosh.dixit@intel.com>, Dale B Stimson
 <dale.b.stimson@intel.com>, Anshuman Gupta <anshuman.gupta@intel.com>,
 Riana Tauro <riana.tauro@intel.com>, Andi Shyti
 <andi.shyti@linux.intel.com>
Subject: Re: [PATCH] drm/i915/hwmon: Fix potential UAF on driver unbind
In-Reply-To: <Zf3tfJFNscqtkWvT@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240322185415.1006700-2-janusz.krzysztofik@linux.intel.com>
 <Zf3tfJFNscqtkWvT@intel.com>
Date: Mon, 25 Mar 2024 11:59:34 +0200
Message-ID: <874jcuk4xl.fsf@intel.com>
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

On Fri, 22 Mar 2024, Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com=
> wrote:
> On Fri, Mar 22, 2024 at 07:54:03PM +0100, Janusz Krzysztofik wrote:
>> Hwmon is registered as a managed resource of i915.  Its functionality
>> depends of availability of i915 uncore.
>
> Instead of polluting all code with this junk I think
> either fixing the devm stuff, or just getting rid of it
> if it's unfixable would be preferable.

Yeah, ugh.

The worst part about sprinkling the checks around is actually that
people *will* cargo cult copy-paste them elsewhere, because they have no
confidence about the lifetimes of objects, and do this just to be
sure. And then we'll have these checks all over the place for no reason.

BR,
Jani.




>
>>=20
>> On i915 unbind, we now block i915 access to hwmon, but leave i915 uncore
>> still available to hwmon.  Since uncore structures may be freed before
>> hwmon is actually unregistered, that may lead to UAF if someone is still
>> using hwmon sysfs interface:
>>=20
>> <7> [469.045388] i915 0000:03:00.0: [drm] intel_gt_set_wedged called fro=
m intel_gt_set_wedged_on_fini+0xd/0x30 [i915]
>> <7> [469.120600] i915 0000:03:00.0: [drm:drm_client_release] drm_fb_help=
er
>> <4> [469.188183] general protection fault, probably for non-canonical ad=
dress 0x6b6b6b6b6b6b6dbf: 0000 [#1] PREEMPT SMP NOPTI
>> <4> [469.198970] CPU: 4 PID: 451 Comm: prometheus-node Tainted: G     U =
            6.8.0-CI_DRM_14465-g198e9d7559f7+ #1
>> <4> [469.209321] Hardware name: Intel Corporation Raptor Lake Client Pla=
tform/RPL-S ADP-S DDR5 UDIMM CRB, BIOS RPLSFWI1.R00.4221.A00.2305271351 05/=
27/2023
>> <4> [469.222589] RIP: 0010:hwm_energy+0x2b/0x100 [i915]
>> <4> [469.227527] Code: 48 89 e5 41 57 41 56 41 55 41 54 53 48 89 fb 48 8=
3 e4 f0 48 83 ec 10 4c 8b 77 08 4c 8b 2f 8b 7f 34 48 89 74 24 08 85 ff 78 2=
b <45> 8b bd 54 02 00 00 49 8b 7e 18 e8 35 df ea ff 49 89 c4 48 85 c0
>> <4> [469.246119] RSP: 0018:ffffc90007aa7d00 EFLAGS: 00010202
>> <4> [469.251314] RAX: 0000000000000000 RBX: ffff88812b4b5828 RCX: 000000=
0000000000
>> <4> [469.258396] RDX: 0000000000000001 RSI: ffffc90007aa7da0 RDI: 000000=
006b6b6b6b
>> <4> [469.265478] RBP: ffffc90007aa7d40 R08: ffffc90007aa7da0 R09: 000000=
0000000001
>> <4> [469.272559] R10: 0000000000000001 R11: ffff88811889d340 R12: ffff88=
810e088810
>> <4> [469.279641] R13: 6b6b6b6b6b6b6b6b R14: 6b6b6b6b6b6b6b6b R15: ffff88=
812b4b5828
>> <4> [469.286722] FS:  00007f7b9c800700(0000) GS:ffff88888d000000(0000) k=
nlGS:0000000000000000
>> <4> [469.294749] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>> <4> [469.300454] CR2: 0000561a5fb45d88 CR3: 0000000111ff0000 CR4: 000000=
0000f50ef0
>> <4> [469.307535] PKRU: 55555554
>> <4> [469.310237] Call Trace:
>> <4> [469.312678]  <TASK>
>> <4> [469.335396]  hwm_read+0x9a/0x310 [i915]
>> <4> [469.339342]  hwmon_attr_show+0x36/0x120
>> <4> [469.343163]  dev_attr_show+0x15/0x60
>> <4> [469.346723]  sysfs_kf_seq_show+0xb5/0x100
>>=20
>> Reset pointers to uncore in hwmon when unregistering i915, and teach hwm=
on
>> sysfs accessors to start with checking validity of those pointers and fa=
il
>> immediately if no longer valid.
>>=20
>> Suggested-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>> Fixes: b3b088e28183 ("drm/i915/hwmon: Add HWMON infrastructure")
>> Closes: https://gitlab.freedesktop.org/drm/intel/issues/10366
>> Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
>> Cc: Dale B Stimson <dale.b.stimson@intel.com>
>> Cc: Anshuman Gupta <anshuman.gupta@intel.com>
>> Cc: Riana Tauro <riana.tauro@intel.com>
>> Cc: <stable@vger.kernel.org> # v6.2+
>> ---
>>  drivers/gpu/drm/i915/i915_hwmon.c | 24 ++++++++++++++++++++++++
>>  1 file changed, 24 insertions(+)
>>=20
>> diff --git a/drivers/gpu/drm/i915/i915_hwmon.c b/drivers/gpu/drm/i915/i9=
15_hwmon.c
>> index b758fd110c204..f5c1d04dae054 100644
>> --- a/drivers/gpu/drm/i915/i915_hwmon.c
>> +++ b/drivers/gpu/drm/i915/i915_hwmon.c
>> @@ -619,6 +619,9 @@ hwm_is_visible(const void *drvdata, enum hwmon_senso=
r_types type,
>>  {
>>  	struct hwm_drvdata *ddat =3D (struct hwm_drvdata *)drvdata;
>>=20=20
>> +	if (!ddat->uncore)
>> +		return 0;
>> +
>>  	switch (type) {
>>  	case hwmon_in:
>>  		return hwm_in_is_visible(ddat, attr);
>> @@ -639,6 +642,9 @@ hwm_read(struct device *dev, enum hwmon_sensor_types=
 type, u32 attr,
>>  {
>>  	struct hwm_drvdata *ddat =3D dev_get_drvdata(dev);
>>=20=20
>> +	if (!ddat->uncore)
>> +		return -ENXIO;
>> +
>>  	switch (type) {
>>  	case hwmon_in:
>>  		return hwm_in_read(ddat, attr, val);
>> @@ -659,6 +665,9 @@ hwm_write(struct device *dev, enum hwmon_sensor_type=
s type, u32 attr,
>>  {
>>  	struct hwm_drvdata *ddat =3D dev_get_drvdata(dev);
>>=20=20
>> +	if (!ddat->uncore)
>> +		return -ENXIO;
>> +
>>  	switch (type) {
>>  	case hwmon_power:
>>  		return hwm_power_write(ddat, attr, channel, val);
>> @@ -686,6 +695,9 @@ hwm_gt_is_visible(const void *drvdata, enum hwmon_se=
nsor_types type,
>>  {
>>  	struct hwm_drvdata *ddat =3D (struct hwm_drvdata *)drvdata;
>>=20=20
>> +	if (!ddat->uncore)
>> +		return 0;
>> +
>>  	switch (type) {
>>  	case hwmon_energy:
>>  		return hwm_energy_is_visible(ddat, attr);
>> @@ -700,6 +712,9 @@ hwm_gt_read(struct device *dev, enum hwmon_sensor_ty=
pes type, u32 attr,
>>  {
>>  	struct hwm_drvdata *ddat =3D dev_get_drvdata(dev);
>>=20=20
>> +	if (!ddat->uncore)
>> +		return -ENXIO;
>> +
>>  	switch (type) {
>>  	case hwmon_energy:
>>  		return hwm_energy_read(ddat, attr, val);
>> @@ -850,5 +865,14 @@ void i915_hwmon_register(struct drm_i915_private *i=
915)
>>=20=20
>>  void i915_hwmon_unregister(struct drm_i915_private *i915)
>>  {
>> +	struct i915_hwmon *hwmon =3D i915->hwmon;
>> +	struct intel_gt *gt;
>> +	int i;
>> +
>> +	for_each_gt(gt, i915, i)
>> +		fetch_and_zero(&hwmon->ddat_gt[i].uncore);
>> +
>> +	fetch_and_zero(&hwmon->ddat.uncore);
>> +
>>  	fetch_and_zero(&i915->hwmon);
>>  }
>> --=20
>> 2.43.0

--=20
Jani Nikula, Intel
