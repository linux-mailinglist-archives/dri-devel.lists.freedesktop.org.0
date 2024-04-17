Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D7B28A8C5A
	for <lists+dri-devel@lfdr.de>; Wed, 17 Apr 2024 21:57:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8628B10EA00;
	Wed, 17 Apr 2024 19:57:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="1rI0aU73";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2085.outbound.protection.outlook.com [40.107.237.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D5B710EA00;
 Wed, 17 Apr 2024 19:57:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H6lRAusSYICn1nBz0pAJPKvFb+5Y9lqN2mdvmKZCLBjsOYTapP/1GJQuCbRzE8LqXfXkUpiV09WBYNdoUme3D9NXdUJ5WzDlRTyO8A1D7z5/brxWGuKtJmBhRQeCPlhkzbRSxfJRbLkRg+aj/cVLYwtelP1vVQPp/OqUNOhHOl2t4QTzgz8i/kHw6uHUqKMuM7MNfzJsTS/ff270tv+yEedjubm1nVB6StKSIZFjRN1hHWnri7izSqlCTGTkk+sGoXqp8vYhbnWTTrUcSspNNahCK9GofKQwjGgUY1n+24xZpFCjjKhw/3EdTPOm54LMfxwXuBpfysqLPZYt2u5J5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j2pxiBsvftUqbrkJr62IW9KcD75oy5eNRYECvcUreho=;
 b=hMbBhmMqLV49NKzbbf2dJ3KJKJDrsTtsL1Hok3skeoQZri0sJg1TP2fJ3J+FKmP7tQd83V3Ybaq+RIy8fjn/pq72yRyOKgBShSatsaskDqYjQK+FQ0mMH4msJLtuZm7PJWqY+EVsD6MbKAxj4w1i1+bdGA8vxqO5x2pTciV2sdfJLSK+7IL+npetHkqc3jZ2rFnfs0rjP+Ecs20+kAG8njr49mgb6HF6muUMrZPlp0iMAx4VTesE/SvtoD9U0iuz5MgxoME1AbCiejxzLvksNiRAxU1+QQwTLyjPo7fnkOKiyIjUliHXhGzrA6tm/5LE8969l3DvOumQzq+qCPzBGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j2pxiBsvftUqbrkJr62IW9KcD75oy5eNRYECvcUreho=;
 b=1rI0aU73o9um9bR7Z73NJioy2yc0fRBc5fW5Yve66Hkhrxas5Gi+AIx1GrbB4p+XftDoeBkbaxqfiGFBX47qJWc2Ua/katF3RV5lz1hSd4spDbB2pf9LPDiW8uKISWfqiT9Dt9SPms+D8wr9BsrEaaiB+Nw1Xzi/bQAyGk+IP3o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by PH7PR12MB7820.namprd12.prod.outlook.com (2603:10b6:510:268::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.39; Wed, 17 Apr
 2024 19:57:30 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062%5]) with mapi id 15.20.7452.049; Wed, 17 Apr 2024
 19:57:30 +0000
Message-ID: <50eeda1a-f3e5-401b-a7f3-0b3fa219c212@amd.com>
Date: Wed, 17 Apr 2024 15:57:18 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] drm/uAPI: Add "force color format" drm property as
 setting for userspace
To: Andri Yngvason <andri@yngvason.is>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 Simon Ser <contact@emersion.fr>, Werner Sembach <wse@tuxedocomputers.com>
References: <20240115160554.720247-1-andri@yngvason.is>
 <20240115160554.720247-3-andri@yngvason.is>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20240115160554.720247-3-andri@yngvason.is>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0452.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10d::18) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|PH7PR12MB7820:EE_
X-MS-Office365-Filtering-Correlation-Id: 4256c96d-afe6-4085-f51b-08dc5f1898c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uVbq9qPTr5f0jGS+KAa6C4AZY3sg4P2rjsWV1HADo97Molb/9edkZIy4E4B5B30Gbf13njl/7i0qUd+SuFxYGIJ0rcJYDCrg1PXIp9fVzEENIEaZbjAgZHObTlzDd2FAjNj62Aa64xe1LwBxzAthyU0NygWtrpJCJBpnx1LR9Vva4Hxg8uiGogshU1c9vgSst45H5d/imDQ+Y+i8j+0Ge1v4bgLO1AR4QpRgu2IYQq/Mo8aglQkpTy/aFVqCAUafiLBd1CSE/+rArAQHoI/EC3PSI9+xr5TJm6MEfEenIu2sRguHhWKvls+CcRIRBvgOH2cN1RYhBKUT12CqESN7o020sh+b3HDEdjeaXKj8hR7Y+bDDmY/PKoM7hhY2dQIq+PkCZ+76MliIYnl/QOUWbxPXuvkNFdemyKPe7Z/OxaYqDFBw/5oo58h6JG8YIdTXiS7j3YGW82ALmTxeRliKzvXzZb8YNeN9Q+vOFtJwQj5V0NFsxPbTIyCYuPVxjr94Zjtl0/Ihx2wE4hD6bhURv3lh5mzJ1ARdNtRKmxNMcEVXCllrd/jOLFHT64uq9kTcykuqy3Bq3xxMdm4AMUuFgJv1KGtuvOSY1TG48hzj1C9cKVnQ9cPW7Ta/05YUE3BNiLTqZ9tZWwPqMCbZslE+T0JMTasiO2gVACp7REdTMug2LtRed2Uo0eKcThCkD0NsGTrbRTI+IZs6UbX1KNF0lg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(7416005)(1800799015)(366007)(921011); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eWkzK0M1UHpTRUtoNGRPdUhNd2dNdnF4N01pcUVka3hRREhwUlE0WnUvenFH?=
 =?utf-8?B?WHhQNk83bEsyQkFrUlh4Q1VwSlFvNTZxZXNteFpENmZ2UjQzM1BWZ2FIeHZk?=
 =?utf-8?B?WUVDOFhtL2RleHJDNmNqREFnejF0d05wYVhvYXpxZkhLQnZGMkVzK3RuZlhk?=
 =?utf-8?B?d1U0N1orSmNMdytuTjZNNS9rVXR4SlZMbGYzVFl4S0EwVi96TmF5Q0hMeTNE?=
 =?utf-8?B?bGZ2ZnB6SVZyaTVKTXNBN2tDc3QwYjhnaE5RT2pOZGJRTlZJK1pTQk9rOWxZ?=
 =?utf-8?B?aGdYeXJ4RTMzL2ZmQk02eFVFMzBEbkJPcmdJTXJaaE9IYmJDRGJVMllxK0VD?=
 =?utf-8?B?RFV5R283MVhCMVhNN05tU0ZIM3RzMkNwZDRJQ0NwSjNBekpxUzBTYjNIUXdt?=
 =?utf-8?B?MWErYkNmNkNUTnY3ZDRNREVtcnIxZjVQMkVwdU1ENEFiRVlxZm8vVFRCenFu?=
 =?utf-8?B?eDRRcU51eTBpRjcyS2lGbGh6cTUzdlBRa3lYVlkxdHorUitMSFowWkIwTmdy?=
 =?utf-8?B?OFVIMkxwaEJjS05reW50aG9SVHJxWTJWMC9iU0ZuNVB2Z0lhSXFubU9BYXFQ?=
 =?utf-8?B?L0kxTkh5RHpBTEFzUGhDSWpaOGJMTkI2SVdJVkM1dTI0aGkwZFFhQ09vYkFK?=
 =?utf-8?B?VHVSZDY0S05yemcxRjFQVUQxak1yRHJQOGZMTVpJa3JTbFZnckgwOTNXemsx?=
 =?utf-8?B?RmNtMmVmeXg0WjVRRmt3a3h5d0xGazBmcUtGOGM0dWFCUHZ1M09CbllUbi9L?=
 =?utf-8?B?V205TVgyVXA4a01rZmw5YXJVdVgxQ0lSeXErbWgrclEzazRGMzdIUkZmQW1O?=
 =?utf-8?B?SmJQbGtoeU8rUmFibkJ0SEpOZXdoU3JPYnhTTG1rbWRrMk1IQWMzL0FoMnlQ?=
 =?utf-8?B?aTh4VlFwM0hrWkk3NVRWTlc3anMwNStHMVdnUXBySHRZN1hVdTk2RGF4ckJq?=
 =?utf-8?B?RVZMcFVTMWVyNDlQWld1UFJCdjhLWkZ4T1dBUkNKRFM3enRaTW9LNGhaYnRo?=
 =?utf-8?B?NHZJZDNPYS9jK0NPaFpsOXJvRnRzS2hnR0xaMzUrYytRTEVNMlk3RXVWRllU?=
 =?utf-8?B?RytKUFl5aVlpQTA4TUhpOTU1WEtodnA4QWo3RDhHUEU2R0dOKzZKckR0SjAr?=
 =?utf-8?B?VXNnMi8zZjZ0QVNvN1lyYnNvanBkVjZRcnM4Q0ZCWlRjOU1JTm5tZUFLT1ll?=
 =?utf-8?B?SFg1d05mMkkydk5BN1lvTlNKWmptOUZ5UngxV0Fla25GYkRaakhubHc4M1hv?=
 =?utf-8?B?a0thSW9uZ3J0b3JFUG5acTlsK1ZqNlQyU3lUSTRxaHRyeEJ3cElPMFl4SEoz?=
 =?utf-8?B?UGY4TStqd0t2K1g3cGpnUVJ6WUl0QjhJVmpleHVER2hwc0dlcHNkNlc5MGVJ?=
 =?utf-8?B?NGJUYVEwNG1UemRMdm1iSUlTdFRUd3k4U2tsNVFDUk9ZN0ptcWErenNpOXBp?=
 =?utf-8?B?ampZZGNEbXBweHkyZG1mUFhoanAwNFYrdC8yTHU1cjliQ2xFK05Ic2dZOFlW?=
 =?utf-8?B?UTdvanpNU2FWQzZJTm1pVDRjajRJeGU2K2FZZ29neFdIOWVzUnoxemRWb2pi?=
 =?utf-8?B?eHhqOStZOC9QbHJVNGU2ditWY1g1UnU4cEw1T3JrVDF2MmdMcVFkVDRqS0JI?=
 =?utf-8?B?THVMNjFROUg5SmtHaTJoNHIxc3QvWksrOWF0TEsyZXJDb0VLVkRBRUNzSGRh?=
 =?utf-8?B?c3A1RkVJall2YUtlSDVHWDg0bE41ZGlrK2F1VC9TUHd2QkJscGxJRHRWaHQ2?=
 =?utf-8?B?ZjI1bElDbGZVcFYzYTNzekQyYk5BL2pQMFMvNk9BbEpNeklxTTd2UldCc2ls?=
 =?utf-8?B?ZWlvM2tLNEJrRnhqOFh6YzExMklVeHBVQWNNVUMrVVc3dk1xY3p3OVJndHJi?=
 =?utf-8?B?VENMLzZFYk1GSWNLZTFiWG84Tml5REluaHNnVUpicndnaCt0d0RHR09DTnZV?=
 =?utf-8?B?RmVBeGlDN0dSbTl5QU5EMEUrd2lXRkpCaGxsNDhaRDQrUTV6eFJsclhLbVh1?=
 =?utf-8?B?SVdhUmFadnhNUW82ZDd0VW1JbmZsOEtVNUJ2alk5WjM0UExxTldHQmxUSXhN?=
 =?utf-8?B?ZGJ1QXZuaHJrdU9sUHhrTjJpY1daWUc0d0txVTkyaGFPRWxFMndFRnlxVHRN?=
 =?utf-8?Q?HszKPGznwHY+QmiPukKYawpLR?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4256c96d-afe6-4085-f51b-08dc5f1898c4
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2024 19:57:30.6334 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wVU1H0yzIYF+kOY8I3dC7sLTBZ/F8+rmenMbrbXkZY68g7HFev3Dh8TrU6uYTlU7VAmdUdWbhxUno4ljZIWsKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7820
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

I'm a bit late to the game but I don't think this is merged
yet.

On 2024-01-15 11:05, Andri Yngvason wrote:
> From: Werner Sembach <wse@tuxedocomputers.com>
> 
> Add a new general drm property "force color format" which can be used
> by userspace to tell the graphics driver which color format to use.
> 
> Possible options are:
>     - auto (default/current behaviour)
>     - rgb
>     - ycbcr444
>     - ycbcr422 (supported by neither amdgpu or i915)

If no driver uses this should we expose this now? I would
prefer to leave ycbcr422 out of this until we have a driver
that actually uses it.

I've seen too many properties with ever possible value defined
but they're not used by any (open) userspace and then become
the object of intense discussion on how they should work. I
doubt that this would happen here, but I still feel a slight
aversion to defining things that no open userspace can use at
this point.

I agree with all of Sebastian and Pekka's comments elsewhere in
this thread, in particular with Sebastian's comments to not
advertise color formats that a driver can't support. See this
patch for how I implemented something similar for Colorspace
c265f340eaa8 ("drm/connector: Allow drivers to pass list of supported colorspaces")

Harry

>     - ycbcr420
> 
> In theory the auto option should choose the best available option for the
> current setup, but because of bad internal conversion some monitors look
> better with rgb and some with ycbcr444.
> 
> Also, because of bad shielded connectors and/or cables, it might be
> preferable to use the less bandwidth heavy ycbcr422 and ycbcr420 formats
> for a signal that is less susceptible to interference.
> 
> In the future, automatic color calibration for screens might also depend on
> this option being available.
> 
> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
> Signed-off-by: Andri Yngvason <andri@yngvason.is>
> Tested-by: Andri Yngvason <andri@yngvason.is>
> ---
> 
> Changes in v2:
>  - Renamed to "force color format" from "preferred color format"
>  - Removed Reported-by pointing to invalid email address
> 
> ---
>  drivers/gpu/drm/drm_atomic_helper.c |  4 +++
>  drivers/gpu/drm/drm_atomic_uapi.c   |  4 +++
>  drivers/gpu/drm/drm_connector.c     | 48 +++++++++++++++++++++++++++++
>  include/drm/drm_connector.h         | 16 ++++++++++
>  4 files changed, 72 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> index 39ef0a6addeba..1dabd164c4f09 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -707,6 +707,10 @@ drm_atomic_helper_check_modeset(struct drm_device *dev,
>  			if (old_connector_state->max_requested_bpc !=
>  			    new_connector_state->max_requested_bpc)
>  				new_crtc_state->connectors_changed = true;
> +
> +			if (old_connector_state->force_color_format !=
> +			    new_connector_state->force_color_format)
> +				new_crtc_state->connectors_changed = true;
>  		}
>  
>  		if (funcs->atomic_check)
> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
> index 29d4940188d49..e45949bf4615f 100644
> --- a/drivers/gpu/drm/drm_atomic_uapi.c
> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> @@ -776,6 +776,8 @@ static int drm_atomic_connector_set_property(struct drm_connector *connector,
>  		state->max_requested_bpc = val;
>  	} else if (property == connector->privacy_screen_sw_state_property) {
>  		state->privacy_screen_sw_state = val;
> +	} else if (property == connector->force_color_format_property) {
> +		state->force_color_format = val;
>  	} else if (connector->funcs->atomic_set_property) {
>  		return connector->funcs->atomic_set_property(connector,
>  				state, property, val);
> @@ -859,6 +861,8 @@ drm_atomic_connector_get_property(struct drm_connector *connector,
>  		*val = state->max_requested_bpc;
>  	} else if (property == connector->privacy_screen_sw_state_property) {
>  		*val = state->privacy_screen_sw_state;
> +	} else if (property == connector->force_color_format_property) {
> +		*val = state->force_color_format;
>  	} else if (connector->funcs->atomic_get_property) {
>  		return connector->funcs->atomic_get_property(connector,
>  				state, property, val);
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> index b0516505f7ae9..e0535e58b4535 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -1061,6 +1061,14 @@ static const struct drm_prop_enum_list drm_dp_subconnector_enum_list[] = {
>  	{ DRM_MODE_SUBCONNECTOR_Native,	     "Native"    }, /* DP */
>  };
>  
> +static const struct drm_prop_enum_list drm_force_color_format_enum_list[] = {
> +	{ 0, "auto" },
> +	{ DRM_COLOR_FORMAT_RGB444, "rgb" },
> +	{ DRM_COLOR_FORMAT_YCBCR444, "ycbcr444" },
> +	{ DRM_COLOR_FORMAT_YCBCR422, "ycbcr422" },
> +	{ DRM_COLOR_FORMAT_YCBCR420, "ycbcr420" },
> +};
> +
>  DRM_ENUM_NAME_FN(drm_get_dp_subconnector_name,
>  		 drm_dp_subconnector_enum_list)
>  
> @@ -1396,6 +1404,15 @@ static const u32 dp_colorspaces =
>   *	drm_connector_attach_max_bpc_property() to create and attach the
>   *	property to the connector during initialization.
>   *
> + * force color format:
> + *	This property is used by userspace to change the used color format. When
> + *	used the driver will use the selected format if valid for the hardware,
> + *	sink, and current resolution and refresh rate combination. Drivers to
> + *	use the function drm_connector_attach_force_color_format_property()
> + *	to create and attach the property to the connector during
> + *	initialization. Possible values are "auto", "rgb", "ycbcr444",
> + *	"ycbcr422", and "ycbcr420".
> + *
>   * Connectors also have one standardized atomic property:
>   *
>   * CRTC_ID:
> @@ -2457,6 +2474,37 @@ int drm_connector_attach_max_bpc_property(struct drm_connector *connector,
>  }
>  EXPORT_SYMBOL(drm_connector_attach_max_bpc_property);
>  
> +/**
> + * drm_connector_attach_force_color_format_property - attach "force color format" property
> + * @connector: connector to attach force color format property on.
> + *
> + * This is used to add support for selecting a color format on a connector.
> + *
> + * Returns:
> + * Zero on success, negative errno on failure.
> + */
> +int drm_connector_attach_force_color_format_property(struct drm_connector *connector)
> +{
> +	struct drm_device *dev = connector->dev;
> +	struct drm_property *prop;
> +
> +	if (!connector->force_color_format_property) {
> +		prop = drm_property_create_enum(dev, 0, "force color format",
> +						drm_force_color_format_enum_list,
> +						ARRAY_SIZE(drm_force_color_format_enum_list));
> +		if (!prop)
> +			return -ENOMEM;
> +
> +		connector->force_color_format_property = prop;
> +	}
> +
> +	drm_object_attach_property(&connector->base, prop, 0);
> +	connector->state->force_color_format = 0;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(drm_connector_attach_force_color_format_property);
> +
>  /**
>   * drm_connector_attach_hdr_output_metadata_property - attach "HDR_OUTPUT_METADA" property
>   * @connector: connector to attach the property on.
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index fe88d7fc6b8f4..9830e7c09c0ba 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -1026,6 +1026,14 @@ struct drm_connector_state {
>  	 */
>  	enum drm_privacy_screen_status privacy_screen_sw_state;
>  
> +	/**
> +	 * @force_color_format: Property set by userspace to tell the GPU
> +	 * driver which color format to use. It only gets applied if hardware,
> +	 * meaning both the computer and the monitor, and the driver support the
> +	 * given format at the current resolution and refresh rate.
> +	 */
> +	u32 force_color_format;
> +
>  	/**
>  	 * @hdr_output_metadata:
>  	 * DRM blob property for HDR output metadata
> @@ -1699,6 +1707,12 @@ struct drm_connector {
>  	 */
>  	struct drm_property *privacy_screen_hw_state_property;
>  
> +	/**
> +	 * @force_color_format_property: Default connector property for the
> +	 * force color format to be driven out of the connector.
> +	 */
> +	struct drm_property *force_color_format_property;
> +
>  #define DRM_CONNECTOR_POLL_HPD (1 << 0)
>  #define DRM_CONNECTOR_POLL_CONNECT (1 << 1)
>  #define DRM_CONNECTOR_POLL_DISCONNECT (1 << 2)
> @@ -2053,6 +2067,8 @@ void drm_connector_attach_privacy_screen_provider(
>  	struct drm_connector *connector, struct drm_privacy_screen *priv);
>  void drm_connector_update_privacy_screen(const struct drm_connector_state *connector_state);
>  
> +int drm_connector_attach_force_color_format_property(struct drm_connector *connector);
> +
>  /**
>   * struct drm_tile_group - Tile group metadata
>   * @refcount: reference count

