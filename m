Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 05F5D2F94FF
	for <lists+dri-devel@lfdr.de>; Sun, 17 Jan 2021 20:52:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED3AC89C8F;
	Sun, 17 Jan 2021 19:52:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2074.outbound.protection.outlook.com [40.107.237.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A72D389C8F;
 Sun, 17 Jan 2021 19:52:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SD0Opn4MAhCTKpCE9stUSJuh8qlxtP0O0x4RkZYE1Awgkv0HCBuAZyEKD8wtMKpODHt+OEMZP7oBLI/N3NVFDOWZUg3qP3AGgU3WZLCkgXi6ZwR2pUg30QfAQli67A5QLXhDHGH9fWWfzsfWjO8p1oDOuu77g3obkJXylkEeEwFbWF8/rpxt39ZNkE33Ac2CIhEwaZzxZbNNoUpdnJ/JOrByEaAidcALkXabe0H1G1upb579H/lZ85O7gVwgKCOt6e3/R1JvUtjfKFAzM5Uv8OW85b53QJe7tx8Ue6+mryGo0zNHuDg6Zgq6G1V234p9rB6bdDDyhhn8/KZZjzU5Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yrApn5jcbMmFIuz3oZ7UsEHWTjn44r6doEY8ZtZCKwo=;
 b=bdZB+qVWruaTpyr8rmGePCEOCMfpMexIfNA2DD++6uog7RtfYcQIe7Jf8lX2ORs+3/OJ3gJOT2yG0iZX0S70k0+t23Z0MLxx690n7+dRCoJT3TXIohg9AY/OmIKxtr8Grgerj4VGaV64+n946Px7OwCdGNpmwJCTe0ameReZ6psqmrni9WnxPTDjvX2Rjx4hrap3hzNgWPtwR17qZlBhn+hKbQSyoFGpPXxRhAomXB5wIv6OswIInoA3QiIU0WAC3LoHkw8vApgBLHk4w4k4gh9YzAtYB6U4ZOZbSTENMKYp/PM/G6TXmejNViJ24+dWINaEtvO+856V7HUHE4bEQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yrApn5jcbMmFIuz3oZ7UsEHWTjn44r6doEY8ZtZCKwo=;
 b=qyk3c5CtriFVpUUt0rkrqehab+Cp79VFaEwKR+bVkGyha8f694BrVf7vCM5u2OqiMxwBkJnsmagzFZ9WTnQ6aVtkqWTTLCGjDIeRP2OxmvnkzPzP7PUcbR/L9aKhBDPyWquvtl/WXQmd5rTCq5Ka+nf8K1W2WQV2O7A1WQYm1Go=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from BN6PR12MB1939.namprd12.prod.outlook.com (2603:10b6:404:107::12)
 by BN8PR12MB3634.namprd12.prod.outlook.com (2603:10b6:408:47::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9; Sun, 17 Jan
 2021 19:52:38 +0000
Received: from BN6PR12MB1939.namprd12.prod.outlook.com
 ([fe80::584b:493b:4126:e042]) by BN6PR12MB1939.namprd12.prod.outlook.com
 ([fe80::584b:493b:4126:e042%7]) with mapi id 15.20.3763.014; Sun, 17 Jan 2021
 19:52:38 +0000
Date: Sun, 17 Jan 2021 14:52:27 -0500
From: Aurabindo Pillai <aurabindo.pillai@amd.com>
Subject: Re: [PATCH v3 3/3] drm/amd/display: Skip modeset for front
 =?UTF-8?Q?porch=0D=0A?= change
To: "Kazlauskas, Nicholas" <nicholas.kazlauskas@amd.com>
Message-Id: <FJG3NQ.G71BWG7EC3AR1@amd.com>
In-Reply-To: <ca40cea2-cbdb-73ad-9995-f18e750fb090@amd.com>
References: <20210104210800.789944-1-aurabindo.pillai@amd.com>
 <20210104210800.789944-4-aurabindo.pillai@amd.com>
 <ca40cea2-cbdb-73ad-9995-f18e750fb090@amd.com>
X-Mailer: geary/3.38.1
X-Originating-IP: [165.204.84.11]
X-ClientProxiedBy: BN6PR17CA0021.namprd17.prod.outlook.com
 (2603:10b6:404:65::31) To BN6PR12MB1939.namprd12.prod.outlook.com
 (2603:10b6:404:107::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.31.5.183] (165.204.84.11) by
 BN6PR17CA0021.namprd17.prod.outlook.com (2603:10b6:404:65::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3763.9 via Frontend Transport; Sun, 17 Jan 2021 19:52:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ea49f3ac-b1b0-48b2-7f62-08d8bb217119
X-MS-TrafficTypeDiagnostic: BN8PR12MB3634:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN8PR12MB3634CAD4F95BB3FFB5F2A5928BA50@BN8PR12MB3634.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HGmEyEyNq/Qk7+GWqkv6jYJyrHO9bXpbeUhLNy2kdJjmaGD4ORnFeualmqsqEaa8pmINMhm61uirKVwws8kPNdaPGm7X2axFQyndXsnKqlvmNRHFVz6jHsIA7CfbZzVB67NIuSDF+sGdwA+qXgCGLo0oF5+VRypOXqXC2ZYxIc37byXCekTGOovaDrqPqvGCvF65SXGUOxDm20+YrcTTmUtXowOli9yCAH86QVh8oUFQVqQdza6zZ6nA7w+vBWqa7SAmDxuU8Bk2hXc0Vbzr2DmUALY52KzjipQSSlOdoSkLxTxfXjHEMjq156K0IGPv3LDvrWCrHBLLvFhMKb8a4H/NgEuEKEzvdrofVCXW/IerJklyuxJTRRnur7pUjNW4AY12RGIFiHqiP9BK9J3a8w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR12MB1939.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(396003)(376002)(366004)(346002)(37006003)(8676002)(44832011)(6636002)(52116002)(86362001)(316002)(16576012)(2616005)(956004)(53546011)(33656002)(66556008)(66476007)(4326008)(478600001)(450100002)(36756003)(6862004)(6666004)(66574015)(8936002)(6486002)(2906002)(5660300002)(66946007)(186003)(16526019)(26005)(30864003)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?iso-8859-1?Q?SyA5ygKosLzQxXaWJncQPtN+eZQqcJyToye29WI4Q3VhGXmu32uYUpC7CK?=
 =?iso-8859-1?Q?lNjY2R+67fszsxRMzChXgvLwz41eC/cT/npjqjjTEfE8YXXD+P8cA1ivMe?=
 =?iso-8859-1?Q?OWAIaDd6k4zFvnZRNs8ilC3Udzx0QH1boAgioW5S/xDO0THjPGk7bjjaQL?=
 =?iso-8859-1?Q?t5zUCKuQ7py2+a8nkP/sCl59I1v0iNuw5Bzay9YQfssmLseLsXrDAF9RMx?=
 =?iso-8859-1?Q?zdpKr+x9LDNGBv/7SljiTA6/pDL3Lyb4fQHUPwSFQd+1XhPf4fzwfNP/mY?=
 =?iso-8859-1?Q?U9lwuEHcXdQocNWmxJpPswySjI3oOCLZH8eOgHVvGkK5+BMfEvrpJ/2o2z?=
 =?iso-8859-1?Q?nJ5s2ikPLdQQUEJA10x/o2bmHyB5Satk8p2YOhnaHXsvIvBqU23q4l7Afx?=
 =?iso-8859-1?Q?xbdAqZNS++ivUnxIludp3lX5I3xvhzgOQFs64P2VErRLYcvVDFdqKoVHrf?=
 =?iso-8859-1?Q?YW5yuR6zILdN1zAWOVBB7TAvqt+lkTZSer/PB3UkxG8C2CR37o389V/CB0?=
 =?iso-8859-1?Q?Co+W83RAVnQodjT3+1w4SDrw/6Ay4kjPeMZdyJWZ4/tVA3rNT1FpM4xXXF?=
 =?iso-8859-1?Q?ScpST4vVvEDSfOOkpjpZhpAJwKRrLTvopk+LOKl44a/f/nymH8sF9GDpgN?=
 =?iso-8859-1?Q?ETpG5fdWZRBA0JNegtiqvyrpaUAwdEHAgvIBNX89opIVna03RPeDO8mcpf?=
 =?iso-8859-1?Q?OFuqUau//qC7QK43aFvcD/bzHDogvOvHl8aIB78wm7O19ziaAnWQqFVtt2?=
 =?iso-8859-1?Q?YHZJ8Bb+Iz2YiIdqTUTNtunPXVhrCNSrmwoyVMnbH45LpO3mg1BZKmu/AS?=
 =?iso-8859-1?Q?AbXitDYC9ryVZ+WJV+YntY7srUfhG3UqVKkmnY3WATQas+RZjlF62oerdX?=
 =?iso-8859-1?Q?tFl6iDiF+edtqbb2TYGGaJCMTqYr1mQf6MJNgDpUezxK5ZlIKOCyyHi7tV?=
 =?iso-8859-1?Q?1bJ20cmPZD/tjiuliKDCZZQVDiPYenWmqDW5k7X8YtKK4Uq655pXNjNTnU?=
 =?iso-8859-1?Q?WllYP6eBXB2GYWsAYOo2lAzUccQOQQbES3tnMG?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea49f3ac-b1b0-48b2-7f62-08d8bb217119
X-MS-Exchange-CrossTenant-AuthSource: BN6PR12MB1939.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2021 19:52:38.2234 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wktUKrdwvjoyn0vkzVwXn+adATwtm/4yjYQvg7lKpS2R6++jLRAA31ppGTJZ1m7ORaC4XyitM1aPErTCMZ/juQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3634
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
Cc: stylon.wang@amd.com, shashank.sharma@amd.com, thong.thai@amd.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 wayne.lin@amd.com, alexander.deucher@amd.com,
 Christian =?iso-8859-1?b?S/ZuaWc=?= <christian.koenig@amd.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--

Thanks & Regards,
Aurabindo Pillai

On Wed, Jan 6, 2021 at 15:02, "Kazlauskas, Nicholas" =

<nicholas.kazlauskas@amd.com> wrote:
> On 2021-01-04 4:08 p.m., Aurabindo Pillai wrote:
>> [Why&How]
>> Inorder to enable freesync video mode, driver adds extra
>> modes based on preferred modes for common freesync frame rates.
>> When commiting these mode changes, a full modeset is not needed.
>> If the change in only in the front porch timing value, skip full
>> modeset and continue using the same stream.
>> =

>> Signed-off-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
>> Acked-by: Christian K=F6nig <christian.koenig@amd.com>
>> ---
>>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 219 =

>> +++++++++++++++---
>>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |   1 +
>>   2 files changed, 188 insertions(+), 32 deletions(-)
>> =

>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c =

>> b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> index aaef2fb528fd..315756207f0f 100644
>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> @@ -213,6 +213,9 @@ static bool amdgpu_dm_psr_disable_all(struct =

>> amdgpu_display_manager *dm);
>>   static const struct drm_format_info *
>>   amd_get_format_info(const struct drm_mode_fb_cmd2 *cmd);
>>   =7F+static bool
>> +is_timing_unchanged_for_freesync(struct drm_crtc_state =

>> *old_crtc_state,
>> +				 struct drm_crtc_state *new_crtc_state);
>>   /*
>>    * dm_vblank_get_counter
>>    *
>> @@ -4940,7 +4943,8 @@ static void =

>> fill_stream_properties_from_drm_display_mode(
>>   	const struct drm_connector *connector,
>>   	const struct drm_connector_state *connector_state,
>>   	const struct dc_stream_state *old_stream,
>> -	int requested_bpc)
>> +	int requested_bpc,
>> +	bool is_in_modeset)
>>   {
>>   	struct dc_crtc_timing *timing_out =3D &stream->timing;
>>   	const struct drm_display_info *info =3D &connector->display_info;
>> @@ -4995,19 +4999,28 @@ static void =

>> fill_stream_properties_from_drm_display_mode(
>>   		timing_out->hdmi_vic =3D hv_frame.vic;
>>   	}
>>   =7F-	timing_out->h_addressable =3D mode_in->crtc_hdisplay;
>> -	timing_out->h_total =3D mode_in->crtc_htotal;
>> -	timing_out->h_sync_width =3D
>> -		mode_in->crtc_hsync_end - mode_in->crtc_hsync_start;
>> -	timing_out->h_front_porch =3D
>> -		mode_in->crtc_hsync_start - mode_in->crtc_hdisplay;
>> -	timing_out->v_total =3D mode_in->crtc_vtotal;
>> -	timing_out->v_addressable =3D mode_in->crtc_vdisplay;
>> -	timing_out->v_front_porch =3D
>> -		mode_in->crtc_vsync_start - mode_in->crtc_vdisplay;
>> -	timing_out->v_sync_width =3D
>> -		mode_in->crtc_vsync_end - mode_in->crtc_vsync_start;
>> -	timing_out->pix_clk_100hz =3D mode_in->crtc_clock * 10;
>> +	if (is_in_modeset) {
>> +		timing_out->h_addressable =3D mode_in->hdisplay;
>> +		timing_out->h_total =3D mode_in->htotal;
>> +		timing_out->h_sync_width =3D mode_in->hsync_end - =

>> mode_in->hsync_start;
>> +		timing_out->h_front_porch =3D mode_in->hsync_start - =

>> mode_in->hdisplay;
>> +		timing_out->v_total =3D mode_in->vtotal;
>> +		timing_out->v_addressable =3D mode_in->vdisplay;
>> +		timing_out->v_front_porch =3D mode_in->vsync_start - =

>> mode_in->vdisplay;
>> +		timing_out->v_sync_width =3D mode_in->vsync_end - =

>> mode_in->vsync_start;
>> +		timing_out->pix_clk_100hz =3D mode_in->clock * 10;
>> +	} else {
>> +		timing_out->h_addressable =3D mode_in->crtc_hdisplay;
>> +		timing_out->h_total =3D mode_in->crtc_htotal;
>> +		timing_out->h_sync_width =3D mode_in->crtc_hsync_end - =

>> mode_in->crtc_hsync_start;
>> +		timing_out->h_front_porch =3D mode_in->crtc_hsync_start - =

>> mode_in->crtc_hdisplay;
>> +		timing_out->v_total =3D mode_in->crtc_vtotal;
>> +		timing_out->v_addressable =3D mode_in->crtc_vdisplay;
>> +		timing_out->v_front_porch =3D mode_in->crtc_vsync_start - =

>> mode_in->crtc_vdisplay;
>> +		timing_out->v_sync_width =3D mode_in->crtc_vsync_end - =

>> mode_in->crtc_vsync_start;
>> +		timing_out->pix_clk_100hz =3D mode_in->crtc_clock * 10;
>> +	}
>> +
>>   	timing_out->aspect_ratio =3D get_aspect_ratio(mode_in);
>>   =7F  	stream->output_color_space =3D =

>> get_output_color_space(timing_out);
>> @@ -5227,6 +5240,33 @@ get_highest_refresh_rate_mode(struct =

>> amdgpu_dm_connector *aconnector,
>>   	return m_pref;
>>   }
>>   =7F+static bool is_freesync_video_mode(struct drm_display_mode *mode,
>> +				   struct amdgpu_dm_connector *aconnector)
>> +{
>> +	struct drm_display_mode *high_mode;
>> +	int timing_diff;
>> +
>> +	high_mode =3D get_highest_refresh_rate_mode(aconnector, false);
>> +	if (!high_mode || !mode)
>> +		return false;
>> +
>> +	timing_diff =3D high_mode->vtotal - mode->vtotal;
>> +
>> +	if (high_mode->clock =3D=3D 0 || high_mode->clock !=3D mode->clock ||
>> +	    high_mode->hdisplay !=3D mode->hdisplay ||
>> +	    high_mode->vdisplay !=3D mode->vdisplay ||
>> +	    high_mode->hsync_start !=3D mode->hsync_start ||
>> +	    high_mode->hsync_end !=3D mode->hsync_end ||
>> +	    high_mode->htotal !=3D mode->htotal ||
>> +	    high_mode->hskew !=3D mode->hskew ||
>> +	    high_mode->vscan !=3D mode->vscan ||
>> +	    high_mode->vsync_start - mode->vsync_start !=3D timing_diff ||
>> +	    high_mode->vsync_end - mode->vsync_end !=3D timing_diff)
>> +		return false;
>> +	else
>> +		return true;
>> +}
>> +
>>   static struct dc_stream_state *
>>   create_stream_for_sink(struct amdgpu_dm_connector *aconnector,
>>   		       const struct drm_display_mode *drm_mode,
>> @@ -5240,15 +5280,21 @@ create_stream_for_sink(struct =

>> amdgpu_dm_connector *aconnector,
>>   		dm_state ? &dm_state->base : NULL;
>>   	struct dc_stream_state *stream =3D NULL;
>>   	struct drm_display_mode mode =3D *drm_mode;
>> +	struct drm_display_mode saved_mode;
>> +	struct drm_display_mode *freesync_mode =3D NULL;
>>   	bool native_mode_found =3D false;
>>   	bool scale =3D dm_state ? (dm_state->scaling !=3D RMX_OFF) : false;
>>   	int mode_refresh;
>>   	int preferred_refresh =3D 0;
>> +	bool is_fs_vid_mode =3D 0;
> =

> nitpick: change 0 to false
> =

>>   #if defined(CONFIG_DRM_AMD_DC_DCN)
>>   	struct dsc_dec_dpcd_caps dsc_caps;
>>   	uint32_t link_bandwidth_kbps;
>>   #endif
>>   	struct dc_sink *sink =3D NULL;
>> +
>> +	memset(&saved_mode, 0, sizeof(struct drm_display_mode));
> =

> nitpick: sizeof(saved_mode)
> =

>> +
>>   	if (aconnector =3D=3D NULL) {
>>   		DRM_ERROR("aconnector is NULL!\n");
>>   		return stream;
>> @@ -5301,25 +5347,39 @@ create_stream_for_sink(struct =

>> amdgpu_dm_connector *aconnector,
>>   		 */
>>   		DRM_DEBUG_DRIVER("No preferred mode found\n");
>>   	} else {
>> -		decide_crtc_timing_for_drm_display_mode(
>> +		is_fs_vid_mode =3D is_freesync_video_mode(&mode, aconnector);
>> +		if (is_fs_vid_mode) {
>> +			freesync_mode =3D get_highest_refresh_rate_mode(aconnector, false);
>> +			saved_mode =3D mode;
>> +			mode =3D *freesync_mode;
>> +		}
>> +
>> +		if (!is_fs_vid_mode)
> =

> nitpick: don't need to check this twice, just use an } else {
> =

>> +			decide_crtc_timing_for_drm_display_mode(
>>   				&mode, preferred_mode,
>>   				dm_state ? (dm_state->scaling !=3D RMX_OFF) : false);
>> +
>>   		preferred_refresh =3D drm_mode_vrefresh(preferred_mode);
>>   	}
>>   =7F  	if (!dm_state)
>>   		drm_mode_set_crtcinfo(&mode, 0);
>>   =7F-	/*
>> +	if (dm_state && is_fs_vid_mode)
>> +		drm_mode_set_crtcinfo(&saved_mode, 0);
>> +
>> +       /*
>>   	* If scaling is enabled and refresh rate didn't change
>>   	* we copy the vic and polarities of the old timings
>>   	*/
>> -	if (!scale || mode_refresh !=3D preferred_refresh)
>> -		fill_stream_properties_from_drm_display_mode(stream,
>> -			&mode, &aconnector->base, con_state, NULL, requested_bpc);
>> +	if (!(scale && is_fs_vid_mode) || mode_refresh !=3D =

>> preferred_refresh)
>> +		fill_stream_properties_from_drm_display_mode(
>> +			stream, &mode, &aconnector->base, con_state, NULL,
>> +			requested_bpc, dm_state ? 1 : 0);
> =

> Some notes on this dm_state 1 : 0 stuff below...
> =

>>   	else
>> -		fill_stream_properties_from_drm_display_mode(stream,
>> -			&mode, &aconnector->base, con_state, old_stream, requested_bpc);
>> +		fill_stream_properties_from_drm_display_mode(
>> +			stream, &mode, &aconnector->base, con_state, old_stream,
>> +			requested_bpc, dm_state ? 1 : 0);
>>   =7F  	stream->timing.flags.DSC =3D 0;
>>   =7F@@ -7847,13 +7907,29 @@ static void update_stream_irq_parameters(
>>   	if (new_crtc_state->vrr_supported &&
>>   	    config.min_refresh_in_uhz &&
>>   	    config.max_refresh_in_uhz) {
>> +		/*
>> +		 * if freesync compatible mode was set, config.state will be set
>> +		 * in atomic check
>> +		 */
>> +		if (config.state =3D=3D VRR_STATE_ACTIVE_FIXED &&
>> +		    config.fixed_refresh_in_uhz && config.max_refresh_in_uhz &&
>> +		    config.min_refresh_in_uhz &&
>> +		    (!drm_atomic_crtc_needs_modeset(&new_crtc_state->base) ||
>> +		     new_crtc_state->freesync_video_mode)) {
>> +			vrr_params.max_refresh_in_uhz =3D config.max_refresh_in_uhz;
>> +			vrr_params.min_refresh_in_uhz =3D config.min_refresh_in_uhz;
>> +			vrr_params.fixed_refresh_in_uhz =3D config.fixed_refresh_in_uhz;
>> +			vrr_params.state =3D VRR_STATE_ACTIVE_FIXED;
>> +			goto out;
> =

> style nitpick: can just drop this goto if you do an } else { here.
> =

>> +		}
>> +
>>   		config.state =3D new_crtc_state->base.vrr_enabled ?
>>   			VRR_STATE_ACTIVE_VARIABLE :
>>   			VRR_STATE_INACTIVE;
>> -	} else {
>> +	} else
> =

> style nitpick: prefer braces on all conditions if they're on any, ie. =

> use } else {
> =

>>   		config.state =3D VRR_STATE_UNSUPPORTED;
>> -	}
>>   =7F+out:
>>   	mod_freesync_build_vrr_params(dm->freesync_module,
>>   				      new_stream,
>>   				      &config, &vrr_params);
>> @@ -8171,7 +8247,9 @@ static void amdgpu_dm_commit_planes(struct =

>> drm_atomic_state *state,
>>   		 * as part of commit.
>>   		 */
>>   		if (amdgpu_dm_vrr_active(dm_old_crtc_state) !=3D
>> -		    amdgpu_dm_vrr_active(acrtc_state)) {
>> +		    amdgpu_dm_vrr_active(acrtc_state) ||
>> +		    acrtc_state->freesync_config.state =3D=3D VRR_STATE_ACTIVE_FIXED =

>> ||
> =

> You should be modifying the amdgpu_dm_vrr_active check instead. It's =

> important that we're sending back the correct vblank events to =

> userspace as long as we're in DRR.
> =

> The logic that does this is in the IRQ handlers, but you should only =

> need to modify this check function.

This is a duplicate check indeed. Will have it removed. However the =

check for freesync_video_mode is still needed. Will send a v5 along =

with other changes suggested above.

> =

> =

>> +		    acrtc_state->freesync_video_mode) {
>>   			spin_lock_irqsave(&pcrtc->dev->event_lock, flags);
>>   			dc_stream_adjust_vmin_vmax(
>>   				dm->dc, acrtc_state->stream,
>> @@ -8867,6 +8945,7 @@ static void get_freesync_config_for_crtc(
>>   			to_amdgpu_dm_connector(new_con_state->base.connector);
>>   	struct drm_display_mode *mode =3D &new_crtc_state->base.mode;
>>   	int vrefresh =3D drm_mode_vrefresh(mode);
>> +	bool fs_vid_mode =3D false;
>>   =7F  	new_crtc_state->vrr_supported =3D =

>> new_con_state->freesync_capable &&
>>   					vrefresh >=3D aconnector->min_vfreq &&
>> @@ -8874,17 +8953,26 @@ static void get_freesync_config_for_crtc(
>>   =7F  	if (new_crtc_state->vrr_supported) {
>>   		new_crtc_state->stream->ignore_msa_timing_param =3D true;
>> -		config.state =3D new_crtc_state->base.vrr_enabled ?
>> -				VRR_STATE_ACTIVE_VARIABLE :
>> -				VRR_STATE_INACTIVE;
>> -		config.min_refresh_in_uhz =3D
>> -				aconnector->min_vfreq * 1000000;
>> -		config.max_refresh_in_uhz =3D
>> -				aconnector->max_vfreq * 1000000;
>> +		fs_vid_mode =3D new_crtc_state->freesync_config.state =3D=3D =

>> VRR_STATE_ACTIVE_FIXED ||
>> +			new_crtc_state->freesync_video_mode;
>> +
>> +		config.min_refresh_in_uhz =3D aconnector->min_vfreq * 1000000;
>> +		config.max_refresh_in_uhz =3D aconnector->max_vfreq * 1000000;
>>   		config.vsif_supported =3D true;
>>   		config.btr =3D true;
>> -	}
>>   =7F+		if (fs_vid_mode) {
>> +			config.state =3D VRR_STATE_ACTIVE_FIXED;
>> +			config.fixed_refresh_in_uhz =3D =

>> new_crtc_state->freesync_config.fixed_refresh_in_uhz;
>> +			goto out;
>> +		}
>> +		else if (new_crtc_state->base.vrr_enabled && !fs_vid_mode)
>> +			config.state =3D VRR_STATE_ACTIVE_VARIABLE;
>> +		else
>> +			config.state =3D VRR_STATE_INACTIVE;
> =

> style nitpick: braces on all if conditions
> =

> You also don't need to check !fs_vid_mode, it's always false in this =

> branch.

Will fix.

> =

>> +
>> +	}
>> +out:
>>   	new_crtc_state->freesync_config =3D config;
>>   }
>>   =7F@@ -8897,6 +8985,51 @@ static void reset_freesync_config_for_crtc(
>>   	       sizeof(new_crtc_state->vrr_infopacket));
>>   }
>>   =7F+static bool
>> +is_timing_unchanged_for_freesync(struct drm_crtc_state =

>> *old_crtc_state,
>> +				 struct drm_crtc_state *new_crtc_state)
>> +{
>> +	struct drm_display_mode old_mode, new_mode;
>> +
>> +	if (!old_crtc_state || !new_crtc_state)
>> +		return false;
>> +
>> +	old_mode =3D old_crtc_state->mode;
>> +	new_mode =3D new_crtc_state->mode;
>> +
>> +	if (old_mode.clock       =3D=3D new_mode.clock &&
>> +	    old_mode.hdisplay    =3D=3D new_mode.hdisplay &&
>> +	    old_mode.vdisplay    =3D=3D new_mode.vdisplay &&
>> +	    old_mode.htotal      =3D=3D new_mode.htotal &&
>> +	    old_mode.vtotal      !=3D new_mode.vtotal &&
>> +	    old_mode.hsync_start =3D=3D new_mode.hsync_start &&
>> +	    old_mode.vsync_start !=3D new_mode.vsync_start &&
>> +	    old_mode.hsync_end   =3D=3D new_mode.hsync_end &&
>> +	    old_mode.vsync_end   !=3D new_mode.vsync_end &&
>> +	    old_mode.hskew       =3D=3D new_mode.hskew &&
>> +	    old_mode.vscan       =3D=3D new_mode.vscan &&
>> +	    (old_mode.vsync_end - old_mode.vsync_start) =3D=3D
>> +	    (new_mode.vsync_end - new_mode.vsync_start))
>> +		return true;
>> +
>> +	return false;
>> +}
>> +
>> +static void set_freesync_fixed_config(struct dm_crtc_state =

>> *dm_new_crtc_state) {
>> +	uint64_t num, den, res;
>> +	struct drm_crtc_state *new_crtc_state =3D &dm_new_crtc_state->base;
>> +
>> +	dm_new_crtc_state->freesync_config.state =3D VRR_STATE_ACTIVE_FIXED;
>> +
>> +	num =3D (unsigned long long)new_crtc_state->mode.clock * 1000 * =

>> 1000000;
>> +	den =3D (unsigned long long)new_crtc_state->mode.htotal *
>> +	      (unsigned long long)new_crtc_state->mode.vtotal;
>> +
>> +	res =3D div_u64(num, den);
>> +	dm_new_crtc_state->freesync_config.fixed_refresh_in_uhz =3D res;
>> +	dm_new_crtc_state->freesync_video_mode =3D true;
> =

> The 'freesync_video_mode' doesn't automatically carry over when CRTC =

> state is duplicated. You'll need to add that to =

> dm_crtc_duplicate_state as well, but keep in mind that I don't see =

> you resetting this to false anywhere.
> =

> You might want to add that in on removing the stream, but I haven't =

> looked too deep into this.

Freesync config is already copied in dm_crtc_duplicate_state, so we =

only need to add freesync_video_mode duplication there. Will add =

resetting freesync_video_mode as well. I'm not sure if setting this to =

false during stream removal is necessary though, since other freesync =

parameters appear to be untouched in dm's commit_tail. What I'm =

thinking is like:

---
static void amdgpu_dm_atomic_commit_tail(struct drm_atomic_state *state)

[snip]
                                continue;
                        }

-                       if (dm_old_crtc_state->stream)
+                       if (dm_old_crtc_state->stream) {
                                remove_stream(adev, acrtc, =

dm_old_crtc_state->stream);
+                               dm_old_crtc_state->freesync_video_mode =

=3D 0;
+                       }

                        pm_runtime_get_noresume(dev->dev);
---


> =

>> +}
>> +
>>   static int dm_update_crtc_state(struct amdgpu_display_manager *dm,
>>   				struct drm_atomic_state *state,
>>   				struct drm_crtc *crtc,
>> @@ -8987,6 +9120,11 @@ static int dm_update_crtc_state(struct =

>> amdgpu_display_manager *dm,
>>   		 * TODO: Refactor this function to allow this check to work
>>   		 * in all conditions.
>>   		 */
>> +		if (dm_new_crtc_state->stream &&
>> +		    is_timing_unchanged_for_freesync(new_crtc_state, =

>> old_crtc_state) &&
>> +		    amdgpu_exp_freesync_vid_mode)
> =

> Reorder this so that we have amdgpu_exp_freesync_vid_mode as the =

> first check. Small optimization.
> =

>> +			goto skip_modeset;
>> +
>>   		if (dm_new_crtc_state->stream &&
>>   		    dc_is_stream_unchanged(new_stream, =

>> dm_old_crtc_state->stream) &&
>>   		    dc_is_stream_scaling_unchanged(new_stream, =

>> dm_old_crtc_state->stream)) {
>> @@ -9018,6 +9156,23 @@ static int dm_update_crtc_state(struct =

>> amdgpu_display_manager *dm,
>>   		if (!dm_old_crtc_state->stream)
>>   			goto skip_modeset;
>>   =7F+		if (dm_new_crtc_state->stream &&
>> +		    is_timing_unchanged_for_freesync(new_crtc_state, =

>> old_crtc_state) &&
>> +		    amdgpu_exp_freesync_vid_mode) {
> =

> Reorder this so that we have amdgpu_exp_freesync_vid_mode as the =

> first check. Small optimization.
> =


Will do these two reorders.

> Regards,
> Nicholas Kazlauskas
> =

>> +			new_crtc_state->mode_changed =3D false;
>> +			DRM_DEBUG_DRIVER(
>> +				"Mode change not required for front porch change, "
>> +				"setting mode_changed to %d",
>> +				new_crtc_state->mode_changed);
>> +
>> +			set_freesync_fixed_config(dm_new_crtc_state);
>> +
>> +			goto skip_modeset;
>> +		} else if (aconnector &&
>> +			   is_freesync_video_mode(&new_crtc_state->mode, aconnector) &&
>> +			   amdgpu_exp_freesync_vid_mode)
>> +			set_freesync_fixed_config(dm_new_crtc_state);
>> +
>>   		ret =3D dm_atomic_get_state(state, &dm_state);
>>   		if (ret)
>>   			goto fail;
>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h =

>> b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
>> index 3ea85be9c546..ff4675572125 100644
>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
>> @@ -474,6 +474,7 @@ struct dm_crtc_state {
>>   =7F  	bool freesync_timing_changed;
>>   	bool freesync_vrr_info_changed;
>> +	bool freesync_video_mode;
>>   =7F  	bool dsc_force_changed;
>>   	bool vrr_supported;
>> =

> =


--

Thanks & Regards,
Aurabindo



_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
