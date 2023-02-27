Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 929006A41FE
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 13:48:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F04910E3FF;
	Mon, 27 Feb 2023 12:48:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A55C910E3FF;
 Mon, 27 Feb 2023 12:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677502113; x=1709038113;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=EUxj8+gJ+o1O9SJ6JzgePYCqC0lhvpupEsPOehirblU=;
 b=HWnqBT4DRsAtfeQGZCzUO1td1phai3qSpR6QKVy0NVKVzHh3IRkb7stH
 S0R3mTsaEomNL7Nmo3PMH/MXpdu1+7imSCY79neyrboDSC4K9DDbvj1X6
 WjFa7KiprCC5DF9f31rPsWP0I6a7K3xnJEPhqmdyXCZUTQM5VzwTUaDkL
 /5Zte3CH0qB3ruQw+EYpnW6GmlOAa63u105i6Ry4C/+hVobVo1l4GToIy
 GjTAmhjRdmfLZ36c4y1syNvuDEqu1cDVZjnUj0v9h6uxwedLOUCgz5ytr
 fripUpM485VpHL3WPM0HODCIIrANai8vER8BJH0SZas9hqkxOOHz2Tjc2 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10633"; a="322094769"
X-IronPort-AV: E=Sophos;i="5.97,332,1669104000"; d="scan'208";a="322094769"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2023 04:48:15 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10633"; a="667018754"
X-IronPort-AV: E=Sophos;i="5.97,332,1669104000"; d="scan'208";a="667018754"
Received: from jkaisrli-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.56.158])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2023 04:48:07 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [RFC PATCH 1/2] drm/msm/dpu: add dsc helper functions
In-Reply-To: <c4c0ebf8-275d-500f-4019-e3d7517a884f@quicinc.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <1677267647-28672-1-git-send-email-quic_khsieh@quicinc.com>
 <1677267647-28672-2-git-send-email-quic_khsieh@quicinc.com>
 <42b3c193-8897-cfe9-1cae-2f9a66f7983a@linaro.org>
 <741be2a3-0208-2f40-eedf-d439c4e6795b@quicinc.com>
 <F8A4FC18-C64E-4011-BC08-18EB3B95A357@linaro.org>
 <d5ee8233-66c8-9b88-417c-6cf9cc5c84fe@quicinc.com>
 <CAA8EJpro5Q-2ZpnDJt40UhFX7Zp9oBhrto=FDOERzCDR2BDPvQ@mail.gmail.com>
 <f0dfba42-4674-3748-bf5d-39f6e1745f67@quicinc.com>
 <f1a6ee82-9502-7ea5-fe48-f296fc7df497@linaro.org>
 <3e114c0f-a042-6801-69bf-67436cb2a448@quicinc.com>
 <113a10b6-6097-c80e-c29c-6f61b2b2896a@linaro.org>
 <c4c0ebf8-275d-500f-4019-e3d7517a884f@quicinc.com>
Date: Mon, 27 Feb 2023 14:48:04 +0200
Message-ID: <87k0031dh7.fsf@intel.com>
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
Cc: vkoul@kernel.org, quic_sbillaka@quicinc.com, andersson@kernel.org,
 freedreno@lists.freedesktop.org, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, agross@kernel.org,
 linux-arm-msm@vger.kernel.org, marijn.suijten@somainline.org,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, sean@poorly.run,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 26 Feb 2023, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> On 2/26/2023 5:09 AM, Dmitry Baryshkov wrote:
>> On 26/02/2023 02:47, Abhinav Kumar wrote:
>>> Hi Dmitry
>>>
>>> On 2/25/2023 7:23 AM, Dmitry Baryshkov wrote:
>>>> On 25/02/2023 02:36, Abhinav Kumar wrote:
>>>>>
>>>>>
>>>>> On 2/24/2023 3:53 PM, Dmitry Baryshkov wrote:
>>>>>> On Sat, 25 Feb 2023 at 00:26, Abhinav Kumar=20
>>>>>> <quic_abhinavk@quicinc.com> wrote:
>>>>>>> On 2/24/2023 1:36 PM, Dmitry Baryshkov wrote:
>>>>>>>> 24 =D1=84=D0=B5=D0=B2=D1=80=D0=B0=D0=BB=D1=8F 2023 =D0=B3. 23:23:0=
3 GMT+02:00, Abhinav Kumar=20
>>>>>>>> <quic_abhinavk@quicinc.com> =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>>>>>>> On 2/24/2023 1:13 PM, Dmitry Baryshkov wrote:
>>>>>>>>>> On 24/02/2023 21:40, Kuogee Hsieh wrote:
>>>>>>>>>>> Add DSC helper functions based on DSC configuration profiles=20
>>>>>>>>>>> to produce
>>>>>>>>>>> DSC related runtime parameters through both table look up and=20
>>>>>>>>>>> runtime
>>>>>>>>>>> calculation to support DSC on DPU.
>>>>>>>>>>>
>>>>>>>>>>> There are 6 different DSC configuration profiles are supported=
=20
>>>>>>>>>>> currently.
>>>>>>>>>>> DSC configuration profiles are differiented by 5 keys, DSC=20
>>>>>>>>>>> version (V1.1),
>>>>>>>>>>> chroma (444/422/420), colorspace (RGB/YUV), bpc(8/10),
>>>>>>>>>>> bpp (6/7/7.5/8/9/10/12/15) and SCR (0/1).
>>>>>>>>>>>
>>>>>>>>>>> Only DSC version V1.1 added and V1.2 will be added later.
>>>>>>>>>>
>>>>>>>>>> These helpers should go to=20
>>>>>>>>>> drivers/gpu/drm/display/drm_dsc_helper.c
>>>>>>>>>> Also please check that they can be used for i915 or for amdgpu=20
>>>>>>>>>> (ideally for both of them).
>>>>>>>>>>
>>>>>>>>>
>>>>>>>>> No, it cannot. So each DSC encoder parameter is calculated based=
=20
>>>>>>>>> on the HW core which is being used.
>>>>>>>>>
>>>>>>>>> They all get packed to the same DSC structure which is the=20
>>>>>>>>> struct drm_dsc_config but the way the parameters are computed is=
=20
>>>>>>>>> specific to the HW.
>>>>>>>>>
>>>>>>>>> This DPU file helper still uses the drm_dsc_helper's=20
>>>>>>>>> drm_dsc_compute_rc_parameters() like all other vendors do but=20
>>>>>>>>> the parameters themselves are very HW specific and belong to=20
>>>>>>>>> each vendor's dir.
>>>>>>>>>
>>>>>>>>> This is not unique to MSM.
>>>>>>>>>
>>>>>>>>> Lets take a few other examples:
>>>>>>>>>
>>>>>>>>> AMD:=20
>>>>>>>>> https://gitlab.freedesktop.org/drm/msm/-/blob/msm-next/drivers/gp=
u/drm/amd/display/dc/dml/dsc/rc_calc_fpu.c#L165=20
>>>>>>>>>
>>>>>>>>>
>>>>>>>>> i915:=20
>>>>>>>>> https://gitlab.freedesktop.org/drm/msm/-/blob/msm-next/drivers/gp=
u/drm/i915/display/intel_vdsc.c#L379=20
>>>>>>>>>
>>>>>>>>
>>>>>>>> I checked several values here. Intel driver defines more bpc/bpp=20
>>>>>>>> combinations, but the ones which are defined in intel_vdsc and in=
=20
>>>>>>>> this patch seem to match. If there are major differences there,=20
>>>>>>>> please point me to the exact case.
>>>>>>>>
>>>>>>>> I remember that AMD driver might have different values.
>>>>>>>>
>>>>>>>
>>>>>>> Some values in the rc_params table do match. But the=20
>>>>>>> rc_buf_thresh[] doesnt.
>>>>>>
>>>>>> Because later they do:
>>>>>>
>>>>>> vdsc_cfg->rc_buf_thresh[i] =3D rc_buf_thresh[i] >> 6;
>>>>>>
>>>>>>>
>>>>>>> https://gitlab.freedesktop.org/drm/msm/-/blob/msm-next/drivers/gpu/=
drm/i915/display/intel_vdsc.c#L40=20
>>>>>>>
>>>>>>>
>>>>>>> Vs
>>>>>>>
>>>>>>> +static u16 dpu_dsc_rc_buf_thresh[DSC_NUM_BUF_RANGES - 1] =3D {
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 0x0e, 0x1c, 0x2a, 0x38, 0x46, 0x54,
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 0x62, 0x69, 0x70, 0x77, 0x79, 0x7b, 0x7d, 0x7e
>>>>>>> +};
>>>>>>
>>>>>> I'd prefer to have 896, 1792, etc. here, as those values come from t=
he
>>>>>> standard. As it's done in the Intel driver.
>>>>>>
>>>>>
>>>>> Got it, thanks
>>>>>
>>>>>>> I dont know the AMD calculation very well to say that moving this=20
>>>>>>> to the
>>>>>>> helper is going to help.
>>>>>>
>>>>>> Those calculations correspond (more or less) at the first glance to
>>>>>> what intel does for their newer generations. I think that's not our
>>>>>> problem for now.
>>>>>>
>>>>>
>>>>> Well, we have to figure out if each value matches and if each of=20
>>>>> them come from the spec for us and i915 and from which section. So=20
>>>>> it is unfortunately our problem.
>>>>
>>>> Otherwise it will have to be handled by Marijn, me or anybody else=20
>>>> wanting to hack up the DSC code. Or by anybody adding DSC support to=20
>>>> the next platform and having to figure out the difference between=20
>>>> i915, msm and their platform.
>>>>
>>>
>>> Yes, I wonder why the same doubt didn't arise when the other vendors=20
>>> added their support both from other maintainers and others.
>>>
>>> Which makes me think that like I wrote in my previous response, these=20
>>> are "recommended" values in the spec but its not mandatory.
>>=20
>> I think, it is because there were no other drivers to compare. In other=
=20
>> words, for a first driver it is pretty logical to have everything=20
>> handled on its own. As soon as we start getting other implementations of=
=20
>> a feature, it becomes logical to think if the code can be generalized.=20
>> This is what we see we with the HDCP series or with the code being moved=
=20
>> to DP helpers.
>>=20
>
> We were not the second, MSM was/is the third to add support for DSC afer=
=20
> i915 and AMD. Thats what made me think why whoever was the second didnt=20
> end up generalizing. Was it just missed out or was it intentionally left=
=20
> in the vendor driver.
>
>>>
>>> Moving this to the drm_dsc_helper is generalizing the tables and not=20
>>> giving room for the vendors to customize even if they want to (which=20
>>> the spec does allow).
>>=20
>> That depends on the API you select. For example, in=20
>> intel_dsc_compute_params() I see customization being applied to=20
>> rc_buf_thresh in 6bpp case. I'd leave that to the i915 driver.
>>=20
>
> Thanks for going through the i915 to figure out that the 6bpp is handled=
=20
> in a customized way. So what you are saying is let the helper first fill=
=20
> up the recommended values of the spec, whatever is changed from that let=
=20
> the vendor driver override that.
>
> Thats where the case-by-case handling comes.
>
> Why not we do this way? Like you mentioned lets move these tables to the=
=20
> drm_dsc_helper and let MSM driver first use those.
>
> Then in a separate patchset if i915 and AMD would like to move to that,=20
> let them handle it for their respective drivers instead of MSM going=20
> through whats customized for each calculation and doing it.
>
> I am hesitant to take up that effort.
>
> If the recommended values work for the vendor, they can clean it up and=20
> move to the drm_dsc_helper themselves and preserving their=20
> customizations rather than one vendor doing it for all of them.

I think the thing to do is to define *interfaces* for accessing the
various parameters in a reasonable manner.

Even in your code, it'll be helpful for any future conversion to shared
arrays to not access the local arrays directly.

If this gets added to kms helpers, with the spec values verbatim and
reasonable interfaces, i915 will happily convert to using them.

BR,
Jani.



>
>> In case the driver needs to perform customization of the params, nothing=
=20
>> stops it drop applying after filling all the RC params in the=20
>> drm_dsc_config struct via the generic helper.
>>=20
>>=20
>>> So if this has any merit and if you or Marijn would like to take it=20
>>> up, go for it. We would do the same thing as either of you would have=20
>>> to in terms of figuring out the difference between msm and the i915 cod=
e.
>>>
>>> This is not a generic API we are trying to put in a helper, these are=20
>>> hard-coded tables so there is a difference between looking at these Vs=
=20
>>> looking at some common code which can move to the core.
>>>
>>>>>
>>>>>>>
>>>>>>> Also, i think its too risky to change other drivers to use=20
>>>>>>> whatever math
>>>>>>> we put in the drm_dsc_helper to compute thr RC params because=20
>>>>>>> their code
>>>>>>> might be computing and using this tables differently.
>>>>>>>
>>>>>>> Its too much ownership for MSM developers to move this to=20
>>>>>>> drm_dsc_helper
>>>>>>> and own that as it might cause breakage of basic DSC even if some=20
>>>>>>> values
>>>>>>> are repeated.
>>>>>>
>>>>>> It's time to stop thinking about ownership and start thinking about
>>>>>> shared code. We already have two instances of DSC tables. I don't
>>>>>> think having a third instance, which is a subset of an existing
>>>>>> dataset, would be beneficial to anybody.
>>>>>> AMD has complicated code which supports half-bit bpp and calculates
>>>>>> some of the parameters. But sharing data with the i915 driver is
>>>>>> straightforward.
>>>>>>
>>>>>
>>>>> Sorry, but I would like to get an ack from i915 folks if this is going
>>>>> to be useful to them if we move this to helper because we have to=20
>>>>> look at every table. Not just one.
>>>>
>>>> Added i915 maintainers to the CC list for them to be able to answer.
>>>>
>>>
>>> Thanks, lets wait to hear from them about where finally these tables=20
>>> should go but thats can be taken up as a separate effort too.
>>>
>>>>>
>>>>> Also, this is just 1.1, we will add more tables for 1.2. So we will=20
>>>>> have to end up changing both 1.1 and 1.2 tables as they are=20
>>>>> different for QC.
>>>>
>>>> I haven't heard back from Kuogee about the possible causes of using=20
>>>> rc/qp values from 1.2 even for 1.1 panels. Maybe you can comment on=20
>>>> that? In other words, can we always stick to the values from 1.2=20
>>>> standard? What will be the drawback?
>>>>
>>>> Otherwise, we'd have to have two different sets of values, like you=20
>>>> do in your vendor driver.
>>>>
>>>
>>> I have responded to this in the other email.
>>>
>>> All this being said, even if the rc tables move the drm_dsc_helper=20
>>> either now or later on, we will still need MSM specific calculations=20
>>> for many of the other encoder parameters (which are again either=20
>>> hard-coded or calculated). Please refer to the=20
>>> sde_dsc_populate_dsc_config() downstream. And yes, you will not find=20
>>> those in the DP spec directly.
>>>
>>> So we will still need a dsc helper for MSM calculations to be common=20
>>> for DSI / DP irrespective of where the tables go.
>>>
>>> So, lets finalize that first.
>>=20
>> I went on and trimmed sde_dsc_populate_dsc_config() to remove=20
>> duplication with the drm_dsc_compute_rc_parameters() (which we already=20
>> use for the MSM DSI DSC).
>>=20
>> Not much is left:
>>=20
>> dsc->first_line_bpg_offset set via the switch
>>=20
>> dsc->line_buf_depth =3D bpc + 1;
>> dsc->mux_word_size =3D bpc > 10 ? DSC_MUX_WORD_SIZE_12_BPC:
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DSC_MUX_WORD_SIZE_8_10_BPC;
>>=20
>> if ((dsc->dsc_version_minor =3D=3D 0x2) && (dsc->native_420))
>>  =C2=A0=C2=A0=C2=A0 dsc->nsl_bpg_offset =3D (2048 *
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 (DIV_ROUND_UP(dsc->second_line_bpg_offset,
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (dsc->slice_height - 1))));
>>=20
>> dsc->initial_scale_value =3D 8 * dsc->rc_model_size /
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (dsc-=
>rc_model_size - dsc->initial_offset);
>>=20
>>=20
>> mux_word_size comes from the standard (must)
>> initial_scale_value calculation is recommended, but not required
>> nsl_bpg_offset follows the standard (must), also see below (*).
>>=20
>> first_line_bpg_offset calculation differs between three drivers. The=20
>> standard also provides a recommended formulas. I think we can leave it=20
>> as is for now.
>>=20
>> I think, that mux_word_size and nsl_bpg_offset calculation should be=20
>> moved to drm_dsc_compute_rc_parameters(), while leaving=20
>> initial_scale_value in place (in the driver code).
>>=20
>> * I think nsl_bpg_offset is slightly incorrectly calculated. Standard=20
>> demands that it is set to 'second_line_bpg_offset / (slice_height - 1),=
=20
>> rounded up to 16 fraction bits', while SDE driver code sets it to the=20
>> value rounded up to the next integer (having 16 fraction bits=20
>> representation).
>>=20
>> In my opinion correct calculation should be:
>> dsc->nsl_bpg_offset =3D DIV_ROUND_UP(2048 * dsc->second_line_bpg_offset,
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (dsc->slice_height - 1));
>>=20
>> Could you please check, which one is correct according to the standard?
>>=20
>>=20
>
> Sure, i will check about nsl_bpg_offset. But sorry if I was not more=20
> clear about this but sde_dsc_populate_dsc_config() is only one example=20
> which from your analysis can be moved to the drm_dsc_helper() but not=20
> the initial line calculation _dce_dsc_initial_line_calc(),=20
> _dce_dsc_ich_reset_override_needed() , _dce_dsc_setup_helper().
>
> All of these are again common between DSI and DP.
>
> So in addition to thinking about what can be moved to the drm_dsc_helper=
=20
> also think about what is specific to MSM but common to DSI and DP modules.
>
> That was the bigger picture I was trying to convey.

--=20
Jani Nikula, Intel Open Source Graphics Center
