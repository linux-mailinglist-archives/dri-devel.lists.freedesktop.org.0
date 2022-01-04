Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D484840C3
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jan 2022 12:25:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31C6E89E08;
	Tue,  4 Jan 2022 11:25:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0616E89E08
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jan 2022 11:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641295526; x=1672831526;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=x4D4/s4oQtbYCG/969o8arY4TX/i3CQNj+SMyZLVQM8=;
 b=J1zjKlTWQSnBtAS5ite3i9turBSJD7Zdso8DdrOTI/6qvRMnbDW+SXwy
 lhqJdDVrwz6zUzMZ1PLpurptscboi+51lbY3cONKSlLFqIiUyBfSlAnvL
 IeAIoUWe/ogpe0zICbm5J+OxHWXf+gXoMRq5JxeLd5S4MwtXwYJAL1Izy
 1Tru+m2sNZK0RK0QBBsRfonyiylzTNabXS7wNcCF+4e4wXKrpnqT+uRBF
 hW4kPOzpbkwuaV2+4tasqESVB+AyPUFNTWN4klqjTJaM8N2oB5bhuT+X6
 j2ZOLCeAmK3GchuyDqiO0Tia2hYcxzmYv9A/cAWwh/B2xKlZr9EY8tt1a A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10216"; a="229522187"
X-IronPort-AV: E=Sophos;i="5.88,260,1635231600"; d="scan'208";a="229522187"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2022 03:25:25 -0800
X-IronPort-AV: E=Sophos;i="5.88,260,1635231600"; d="scan'208";a="488164956"
Received: from gtobin-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.11.253])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2022 03:25:22 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: =?utf-8?B?6LW15Yab5aWO?= <bernard@vivo.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: =?utf-8?B?562U5aSNOg==?= [PATCH] gpu/drm: fix potential memleak
 in error branch
In-Reply-To: <PSAPR06MB40216FB1425E72891B6A6B28DF4A9@PSAPR06MB4021.apcprd06.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20211116124751.31181-1-bernard@vivo.com>
 <ACIArwAdEzJlxV*UItyRxarz.9.1640948962309.Hmail.bernard@vivo.com.@PDg3emdvaGh2emEuZnNmQGludGVsLmNvbT4=>
 <PSAPR06MB40216FB1425E72891B6A6B28DF4A9@PSAPR06MB4021.apcprd06.prod.outlook.com>
Date: Tue, 04 Jan 2022 13:25:19 +0200
Message-ID: <87k0ffu4io.fsf@intel.com>
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

On Tue, 04 Jan 2022, =E8=B5=B5=E5=86=9B=E5=A5=8E <bernard@vivo.com> wrote:
> -----=E9=82=AE=E4=BB=B6=E5=8E=9F=E4=BB=B6-----
> =E5=8F=91=E4=BB=B6=E4=BA=BA: bernard@vivo.com <bernard@vivo.com> =E4=BB=
=A3=E8=A1=A8 Jani Nikula
> =E5=8F=91=E9=80=81=E6=97=B6=E9=97=B4: 2021=E5=B9=B412=E6=9C=8831=E6=97=A5=
 19:09
> =E6=94=B6=E4=BB=B6=E4=BA=BA: =E8=B5=B5=E5=86=9B=E5=A5=8E <bernard@vivo.co=
m>; Maarten Lankhorst <maarten.lankhorst@linux.intel.com>; Maxime Ripard <m=
ripard@kernel.org>; Thomas Zimmermann <tzimmermann@suse.de>; David Airlie <=
airlied@linux.ie>; Daniel Vetter <daniel@ffwll.ch>; dri-devel@lists.freedes=
ktop.org; linux-kernel@vger.kernel.org
> =E6=8A=84=E9=80=81: =E8=B5=B5=E5=86=9B=E5=A5=8E <bernard@vivo.com>
> =E4=B8=BB=E9=A2=98: Re: [PATCH] gpu/drm: fix potential memleak in error b=
ranch
>
> On Tue, 16 Nov 2021, Bernard Zhao <bernard@vivo.com> wrote:
>> This patch try to fix potential memleak in error branch.
>
>>Please elaborate.
>
> Hi Jani:
>
> This patch try to fix potential memleak in error branch.
> For example:
> nv50_sor_create ->nv50_mstm_new-> drm_dp_mst_topology_mgr_init
> In function drm_dp_mst_topology_mgr_init, there are five error branches, =
error branch just return error code, no free called.=20
> And we see that the caller didn`t do the drm_dp_mst_topology_mgr_destroy =
job.
> I am not sure if there some gap, I think this may bring in the risk of me=
mleak issue.
> Thanks!

This should be part of the commit message.

>
> BR//Bernard
>
>>BR,
>>Jani.
>
>
>>
>> Signed-off-by: Bernard Zhao <bernard@vivo.com>
>> ---
>>  drivers/gpu/drm/drm_dp_mst_topology.c | 22 ++++++++++++++++------
>>  1 file changed, 16 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c=20
>> b/drivers/gpu/drm/drm_dp_mst_topology.c
>> index f3d79eda94bb..f73b180dee73 100644
>> --- a/drivers/gpu/drm/drm_dp_mst_topology.c
>> +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
>> @@ -5501,7 +5501,10 @@ int drm_dp_mst_topology_mgr_init(struct drm_dp_ms=
t_topology_mgr *mgr,
>>  				 int max_lane_count, int max_link_rate,
>>  				 int conn_base_id)
>>  {
>> -	struct drm_dp_mst_topology_state *mst_state;
>> +	struct drm_dp_mst_topology_state *mst_state =3D NULL;

This is superfluous.

Other than that,

Reviewed-by: Jani Nikula <jani.nikula@intel.com>


>> +
>> +	mgr->payloads =3D NULL;
>> +	mgr->proposed_vcpis =3D NULL;
>>=20=20
>>  	mutex_init(&mgr->lock);
>>  	mutex_init(&mgr->qlock);
>> @@ -5523,7 +5526,7 @@ int drm_dp_mst_topology_mgr_init(struct drm_dp_mst=
_topology_mgr *mgr,
>>  	 */
>>  	mgr->delayed_destroy_wq =3D alloc_ordered_workqueue("drm_dp_mst_wq", 0=
);
>>  	if (mgr->delayed_destroy_wq =3D=3D NULL)
>> -		return -ENOMEM;
>> +		goto out;
>>=20=20
>>  	INIT_WORK(&mgr->work, drm_dp_mst_link_probe_work);
>>  	INIT_WORK(&mgr->tx_work, drm_dp_tx_work); @@ -5539,18 +5542,18 @@=20
>> int drm_dp_mst_topology_mgr_init(struct drm_dp_mst_topology_mgr *mgr,
>>  	mgr->conn_base_id =3D conn_base_id;
>>  	if (max_payloads + 1 > sizeof(mgr->payload_mask) * 8 ||
>>  	    max_payloads + 1 > sizeof(mgr->vcpi_mask) * 8)
>> -		return -EINVAL;
>> +		goto failed;
>>  	mgr->payloads =3D kcalloc(max_payloads, sizeof(struct drm_dp_payload),=
 GFP_KERNEL);
>>  	if (!mgr->payloads)
>> -		return -ENOMEM;
>> +		goto failed;
>>  	mgr->proposed_vcpis =3D kcalloc(max_payloads, sizeof(struct drm_dp_vcp=
i *), GFP_KERNEL);
>>  	if (!mgr->proposed_vcpis)
>> -		return -ENOMEM;
>> +		goto failed;
>>  	set_bit(0, &mgr->payload_mask);
>>=20=20
>>  	mst_state =3D kzalloc(sizeof(*mst_state), GFP_KERNEL);
>>  	if (mst_state =3D=3D NULL)
>> -		return -ENOMEM;
>> +		goto failed;
>>=20=20
>>  	mst_state->total_avail_slots =3D 63;
>>  	mst_state->start_slot =3D 1;
>> @@ -5563,6 +5566,13 @@ int drm_dp_mst_topology_mgr_init(struct drm_dp_ms=
t_topology_mgr *mgr,
>>  				    &drm_dp_mst_topology_state_funcs);
>>=20=20
>>  	return 0;
>> +
>> +failed:
>> +	kfree(mgr->proposed_vcpis);
>> +	kfree(mgr->payloads);
>> +	destroy_workqueue(mgr->delayed_destroy_wq);
>> +out:
>> +	return -ENOMEM;
>>  }
>>  EXPORT_SYMBOL(drm_dp_mst_topology_mgr_init);
>
> --
> Jani Nikula, Intel Open Source Graphics Center

--=20
Jani Nikula, Intel Open Source Graphics Center
