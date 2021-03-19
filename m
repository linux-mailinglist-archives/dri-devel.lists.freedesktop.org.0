Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ACCC4342706
	for <lists+dri-devel@lfdr.de>; Fri, 19 Mar 2021 21:36:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 770286EAB2;
	Fri, 19 Mar 2021 20:36:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2052.outbound.protection.outlook.com [40.107.243.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDDF16EAA2;
 Fri, 19 Mar 2021 20:36:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XN3g87jrtBXH+ECgayjzEFY4yEbaTgDJ9rYpEvg3uwmPiYpUZ1pYCwyTOsLl3xTMDzecingtKJhB8De+AQAWpvTyhpn3EGS8yBachgnU34ELOLdDIuY7tUwt5ILmzvap2xDiG9wRX34h0Z0Dxa1KPAkUjle9Ap7vBHDc7Hu9vw4rhuzG1sphss18YVV2CDeTGttqZHd5TyCWqME1p4NhqD8y/EU/u9di+KLfr0ZdmZzzYOM6VZEx7qzgJ7U4oSSy30evIG370p9QTvc60IQmkAgGJB+60nDignOSDTBNonc2eYhD60rCX2YmfeMuNJbYYuh/vG/xi1HBYQ4lr2YCZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LQIOBFPbNelIpifalnYLgpdltoIMnJrjaSR/S/8uhhY=;
 b=H/OyRZH1pGWnQwKJu/OHB+5FemIunGEhfoPCgh+rt+facLzg25m7WUY63jQXZ/MMlcJew7OdrunrQlodZ4LLfGvcmofc68BrZTowata4518pjYa8SW2iMfOpvh9+efhFM+30PnASBio5ENY8W0sdcABeKBpp15pu5QFjDvJ48qvxOL3sGVf9927z48FU1DlEfssKQrlKRDT72chTIggoSjkwDFcWLtNJ4QzGwMGp5lxSfJB1cRSE+MPpidJgi1ZHwl2HeoO8+NXJ9vCiWzrbrLcXOv6OzJdaOIgc3ma5W9Fth0CVInlHHut2j2Xl+1cmw7kagVDIijqm/W3a6LyTDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LQIOBFPbNelIpifalnYLgpdltoIMnJrjaSR/S/8uhhY=;
 b=USoT55jOHBvjMfn2maqK/fcZ/I/TVCwJGebx94Tit7fQCiAbHD9kZ7fA0L6E+MvapL7B4f5GNkVrPEaKfaYOGMtNnAj0JYZer5wlwxTN/2RyfkSmphrTqt8aWysIK1XA7oMhDkySmZd7wCQEqDYZGm+WTL3EUTVvtme3AHnY+GE=
Authentication-Results: ideasonboard.com; dkim=none (message not signed)
 header.d=none;ideasonboard.com; dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4379.namprd12.prod.outlook.com (2603:10b6:303:5e::11)
 by MW2PR12MB2346.namprd12.prod.outlook.com (2603:10b6:907:4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Fri, 19 Mar
 2021 20:36:43 +0000
Received: from MW3PR12MB4379.namprd12.prod.outlook.com
 ([fe80::4987:8b2f:78ca:deb8]) by MW3PR12MB4379.namprd12.prod.outlook.com
 ([fe80::4987:8b2f:78ca:deb8%7]) with mapi id 15.20.3955.018; Fri, 19 Mar 2021
 20:36:43 +0000
Subject: Re: [PATCH 2/3] drm/connector: Add helper to compare HDR metadata
To: Maxime Ripard <maxime@cerno.tech>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
References: <20210319124922.144726-1-maxime@cerno.tech>
 <20210319124922.144726-2-maxime@cerno.tech>
From: Harry Wentland <harry.wentland@amd.com>
Message-ID: <e92fe32f-70d1-edc1-c4af-38eee5d2a5f8@amd.com>
Date: Fri, 19 Mar 2021 16:36:35 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210319124922.144726-2-maxime@cerno.tech>
Content-Language: en-US
X-Originating-IP: [198.200.67.155]
X-ClientProxiedBy: YT1PR01CA0122.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2c::31) To MW3PR12MB4379.namprd12.prod.outlook.com
 (2603:10b6:303:5e::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.193] (198.200.67.155) by
 YT1PR01CA0122.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2c::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3890.25 via Frontend Transport; Fri, 19 Mar 2021 20:36:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a1fb7c84-ea9e-41ad-2363-08d8eb16b4cd
X-MS-TrafficTypeDiagnostic: MW2PR12MB2346:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MW2PR12MB2346F4C64A93AA9E4BACE4C28C689@MW2PR12MB2346.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ycL1ySMc/cjugGFw7SA0UOOGu7yqevkpkWTfpTDdO5507AEg6ZcgQMhotqUPjWH75qVyYha8PewiuC4uAaaADERzPDy7hvLaUoos3wVC1lDMG3/YPJQrCUwXEEPk8a9RUftHxu3vfQyG+l8aXW0Cbg0qsIey40KInQz8qRGfNxYq0ErAGaA8w5mG6vENkIJW3n8NB5voQmIl+EXypcLKfEOxGVofAnMxlG39ZgxcT5qdR6RSPxs0q/X08Stx9rh0s97S9yAEtu0ALRCp9QyjZ0JZbaXtQQRcSu2yS1PriMTuLWbOIFttstHvyBEgOQZkvaa83h0ojG7sJHqbNaTGl5r5z2RVz6SYMxIh7CLQoOLC0/QmMq8pjsPdTmJMCtDJh0UX+qHxcv9eYX98Ye5KnMIZB67raWavApwSoZ8DRvFK8xJAWEPUYwmcnjl2i8xt6FhD5hfdJKHNqiIkNJju3GP9J/0gkDMwjmsVbvtGpQqKxXAqHU5d/WArUQhBTmHqVcTR9aQIiOtqv7AtwBrY2tgG2sVYnUWSNZTkuXUnVnsFxg5DHKwSyxG/RjFktxp2X5BmJ+NFSwrQSD/pSQhOR2fN7/sYzQlR2A3zVyQN7NSXx6BJT9Lkp1GAZAFo8hsXgbd5D7/Hi+hbpAg+KE8DyGR3C8C7EWrZSOzLgEUVH+aITPOkkfICBvE5Rpe1GtRXB+W6WBsR13WkWQynisqxRtYSJPW66ZViGtJpcKYTe44=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR12MB4379.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(39860400002)(396003)(366004)(346002)(86362001)(478600001)(16576012)(316002)(8676002)(7416002)(36756003)(66556008)(2906002)(8936002)(5660300002)(53546011)(26005)(956004)(6486002)(66946007)(110136005)(44832011)(31686004)(2616005)(54906003)(16526019)(83380400001)(31696002)(6666004)(186003)(4326008)(38100700001)(66476007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?T3FvRWRVWE96R3M5MUd3N0JpUWNSQ3RhS3R6RVdsam1XNWVHd0RvUFh2Rm1F?=
 =?utf-8?B?bTlSZGVaeHdZNHB4Sk1qNE1RYzNlOUp5OFNETnFtN0RxZTdpcytlTHl5N1Uz?=
 =?utf-8?B?d1dBZEVXK0NmQ2xLOXpwTHlLSUd2K0MvL21DSnhodzZuaUZEN3RUNUZ0WTNC?=
 =?utf-8?B?c0k2S21NWjNVc1dnc2JHTUJXeWdVZjUrUjlDSE5sdHF3Ulo4REhwemU3bTlJ?=
 =?utf-8?B?Sk5BT1dQd2VJRWs4d2NDMzloVURYV0duNGo1YUFlRk84R1RpNVRtU1k1VHNu?=
 =?utf-8?B?TXJsYy8veTl4cE5IYmVHa24wRUJOZVl2QXNIcmU2ZlV5ZmhoNTBVSXAwSTZQ?=
 =?utf-8?B?d0RIK0xRYmZBWUM5cjJpMkpmc2Z0OG5tdnVHWXV3MzYyS2FTL2QzVDFFbnZK?=
 =?utf-8?B?MmV0UWFpajFCNGZ4bVVBSXZzWjBlQWFIS0hGcGpLWE52c1BTdGlCN0NxdHl4?=
 =?utf-8?B?VVlNb1l6Q1RrbXJsWllvUVNnQW83b1BxSkhYdlJoZmhwTlprOUllUVFlVnNM?=
 =?utf-8?B?ZGp2MFdDK1FjY3haOGg5ODhZZytZcEpsbU45S05Cb0xodSs0SWNxbkp3TUY2?=
 =?utf-8?B?eEhUcEt4Sjk0NXdrZkpxMHBRWnFtQVRWb2xEeTlKRGJrMDRQanBISkxpeGVs?=
 =?utf-8?B?djlrb1o2TFJJREg0aDFtWld3R0ZDcStPYnJwN0NhT3hPdUpNN25MWllMMHZN?=
 =?utf-8?B?ZlBETElLc2l2YXBUUG5sSkxQb0Nxem9URXpBY002M3laeFdSNTloVnZueEhu?=
 =?utf-8?B?dmxxMlVkTzRoS0RYd2xJaXUrQStIOWFPTlFTOWh3VDRlWjN4VzVlaVNZNnFU?=
 =?utf-8?B?OUFmUGFpckVUeHovQ08zUmd4Sjl6WWZuNzdZWnhoblNIcnhkU1Y1MlZYWm9K?=
 =?utf-8?B?dTZlVkdOb0Y1OXBGeWl2VW1CaG85dGxlK25HaUgvTXBOVWR6ZXh6RmVGSDB0?=
 =?utf-8?B?UFdpMHVHSWR3NXJGdXkwWWJlYWg5akVyYVBEbzFLNnR5TjNCMk1BYXByS3I5?=
 =?utf-8?B?VEp6aWd0aCsrcitRWGdBS1NKUEFVaDk5N3lFMFk4cnpOc2lURCtsT0JYUFJZ?=
 =?utf-8?B?aWZ3SFg4K2pkRGpTUEI3MUFTeDNjOVNmUnB0L0FyQUpwT0VpVXk5d3pWSCs4?=
 =?utf-8?B?N1hCaWxmT3B2VzRSZFh0eG8vcVN1REJGLzZvaDNZUXBTc3huUk03L3RYOFJk?=
 =?utf-8?B?QzgrUDN0ZmFvNU54ZUprZWZGdXRaeDQyTmo4UW9hQVB3bFZpUGxuRFhVc2tH?=
 =?utf-8?B?WW5GK2NBRFRNQ0RQL1diRGJ6N1UxYUhXSWRaNnZEUWZBY0RML2wxRDVRcHdF?=
 =?utf-8?B?dEdDSlIxUUV4L25sc0hVZUlDNFV6MXJ3VW1rSXBMOE1hRHJkNkdMNzJDc2Vu?=
 =?utf-8?B?a0x5UnBKaDcwS2Z3Rzljak1ZNWxINXdibHJ2YUVTVUFFWGFwUk12T0tNME5O?=
 =?utf-8?B?MTJLVU5Cd2JsSzJHSHZPcW11aElIelBLWWZRLzNtcUl2OCsxMlpVK05USkJh?=
 =?utf-8?B?N2pCWEVjazVXS2hOOUtUR243UHVtSllzdk1WVWtpc0VzRE9SMHdqVjJLS3hE?=
 =?utf-8?B?RldveEQvSUlJTE1qcWMxODg3eUlEdkRRRkt0YTJROXJySjVpVkVibkxXcDNE?=
 =?utf-8?B?Sm14SkJkd1gyS0R2YmxFWnNvam54cjFVWndaNGlSWW9XdHlkakJ3ZlE4Skdk?=
 =?utf-8?B?WXhDSGVDU3B3R1RMSHorQW1MRk5XOW1aVFFzbllkZlEvUC9zZWZFQVBacW9o?=
 =?utf-8?Q?YdvZlozqmx6mC04a3sGRRflB0yhHOZBcpdzNH6/?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1fb7c84-ea9e-41ad-2363-08d8eb16b4cd
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4379.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2021 20:36:43.3561 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GqxeKIWMfqVYjbYSkd8r+CuclPmvtJJNx8JaAkIvXUgq8o+yjr9efIl65/z24mgJBSWi2NrDZtbtk9vDtn2GXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR12MB2346
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Dom Cobley <dom@raspberrypi.com>,
 Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, Leo Li <sunpeng.li@amd.com>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 Andrzej Hajda <a.hajda@samsung.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, Phil Elwell <phil@raspberrypi.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-03-19 8:49 a.m., Maxime Ripard wrote:
> All the drivers that support the HDR metadata property have a similar
> function to compare the metadata from one connector state to the next,
> and force a mode change if they differ.
> 
> All these functions run pretty much the same code, so let's turn it into
> an helper that can be shared across those drivers.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Patches 1 & 2 are
Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> ---
>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 21 +-------------
>   drivers/gpu/drm/bridge/synopsys/dw-hdmi.c     | 17 +----------
>   drivers/gpu/drm/drm_connector.c               | 28 +++++++++++++++++++
>   drivers/gpu/drm/i915/display/intel_atomic.c   | 13 +--------
>   include/drm/drm_connector.h                   |  2 ++
>   5 files changed, 33 insertions(+), 48 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 06908a3cee0f..4eb5201e566a 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -5924,25 +5924,6 @@ static int fill_hdr_info_packet(const struct drm_connector_state *state,
>   	return 0;
>   }
>   
> -static bool
> -is_hdr_metadata_different(const struct drm_connector_state *old_state,
> -			  const struct drm_connector_state *new_state)
> -{
> -	struct drm_property_blob *old_blob = old_state->hdr_output_metadata;
> -	struct drm_property_blob *new_blob = new_state->hdr_output_metadata;
> -
> -	if (old_blob != new_blob) {
> -		if (old_blob && new_blob &&
> -		    old_blob->length == new_blob->length)
> -			return memcmp(old_blob->data, new_blob->data,
> -				      old_blob->length);
> -
> -		return true;
> -	}
> -
> -	return false;
> -}
> -
>   static int
>   amdgpu_dm_connector_atomic_check(struct drm_connector *conn,
>   				 struct drm_atomic_state *state)
> @@ -5960,7 +5941,7 @@ amdgpu_dm_connector_atomic_check(struct drm_connector *conn,
>   	if (!crtc)
>   		return 0;
>   
> -	if (is_hdr_metadata_different(old_con_state, new_con_state)) {
> +	if (!drm_connector_atomic_hdr_metadata_equal(old_con_state, new_con_state)) {
>   		struct dc_info_packet hdr_infopacket;
>   
>   		ret = fill_hdr_info_packet(new_con_state, &hdr_infopacket);
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> index f24bbb840dbf..f871e33c2fc9 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -2395,21 +2395,6 @@ static int dw_hdmi_connector_get_modes(struct drm_connector *connector)
>   	return ret;
>   }
>   
> -static bool hdr_metadata_equal(const struct drm_connector_state *old_state,
> -			       const struct drm_connector_state *new_state)
> -{
> -	struct drm_property_blob *old_blob = old_state->hdr_output_metadata;
> -	struct drm_property_blob *new_blob = new_state->hdr_output_metadata;
> -
> -	if (!old_blob || !new_blob)
> -		return old_blob == new_blob;
> -
> -	if (old_blob->length != new_blob->length)
> -		return false;
> -
> -	return !memcmp(old_blob->data, new_blob->data, old_blob->length);
> -}
> -
>   static int dw_hdmi_connector_atomic_check(struct drm_connector *connector,
>   					  struct drm_atomic_state *state)
>   {
> @@ -2423,7 +2408,7 @@ static int dw_hdmi_connector_atomic_check(struct drm_connector *connector,
>   	if (!crtc)
>   		return 0;
>   
> -	if (!hdr_metadata_equal(old_state, new_state)) {
> +	if (!drm_connector_atomic_hdr_metadata_equal(old_state, new_state)) {
>   		crtc_state = drm_atomic_get_crtc_state(state, crtc);
>   		if (IS_ERR(crtc_state))
>   			return PTR_ERR(crtc_state);
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> index e25248e23e18..d781a3a1e9bf 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -2170,6 +2170,34 @@ int drm_connector_attach_hdr_output_metadata_property(struct drm_connector *conn
>   }
>   EXPORT_SYMBOL(drm_connector_attach_hdr_output_metadata_property);
>   
> +/**
> + * drm_connector_atomic_hdr_metadata_equal - checks if the hdr metadata changed
> + * @old_state: old connector state to compare
> + * @new_state: new connector state to compare
> + *
> + * This is used by HDR-enabled drivers to test whether the HDR metadata
> + * have changed between two different connector state (and thus probably
> + * requires a full blown mode change).
> + *
> + * Returns:
> + * True if the metadata are equal, False otherwise
> + */
> +bool drm_connector_atomic_hdr_metadata_equal(struct drm_connector_state *old_state,
> +					     struct drm_connector_state *new_state)
> +{
> +	struct drm_property_blob *old_blob = old_state->hdr_output_metadata;
> +	struct drm_property_blob *new_blob = new_state->hdr_output_metadata;
> +
> +	if (!old_blob || !new_blob)
> +		return old_blob == new_blob;
> +
> +	if (old_blob->length != new_blob->length)
> +		return false;
> +
> +	return !memcmp(old_blob->data, new_blob->data, old_blob->length);
> +}
> +EXPORT_SYMBOL(drm_connector_atomic_hdr_metadata_equal);
> +
>   /**
>    * drm_connector_set_vrr_capable_property - sets the variable refresh rate
>    * capable property for a connector
> diff --git a/drivers/gpu/drm/i915/display/intel_atomic.c b/drivers/gpu/drm/i915/display/intel_atomic.c
> index e00fdc47c0eb..efec9454af5a 100644
> --- a/drivers/gpu/drm/i915/display/intel_atomic.c
> +++ b/drivers/gpu/drm/i915/display/intel_atomic.c
> @@ -109,16 +109,6 @@ int intel_digital_connector_atomic_set_property(struct drm_connector *connector,
>   	return -EINVAL;
>   }
>   
> -static bool blob_equal(const struct drm_property_blob *a,
> -		       const struct drm_property_blob *b)
> -{
> -	if (a && b)
> -		return a->length == b->length &&
> -			!memcmp(a->data, b->data, a->length);
> -
> -	return !a == !b;
> -}
> -
>   int intel_digital_connector_atomic_check(struct drm_connector *conn,
>   					 struct drm_atomic_state *state)
>   {
> @@ -149,8 +139,7 @@ int intel_digital_connector_atomic_check(struct drm_connector *conn,
>   	    new_conn_state->base.picture_aspect_ratio != old_conn_state->base.picture_aspect_ratio ||
>   	    new_conn_state->base.content_type != old_conn_state->base.content_type ||
>   	    new_conn_state->base.scaling_mode != old_conn_state->base.scaling_mode ||
> -	    !blob_equal(new_conn_state->base.hdr_output_metadata,
> -			old_conn_state->base.hdr_output_metadata))
> +	    !drm_connector_atomic_hdr_metadata_equal(old_state, new_state))
>   		crtc_state->mode_changed = true;
>   
>   	return 0;
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index 32172dab8427..1f51d73ca715 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -1672,6 +1672,8 @@ int drm_connector_attach_scaling_mode_property(struct drm_connector *connector,
>   int drm_connector_attach_vrr_capable_property(
>   		struct drm_connector *connector);
>   int drm_connector_attach_hdr_output_metadata_property(struct drm_connector *connector);
> +bool drm_connector_atomic_hdr_metadata_equal(struct drm_connector_state *old_state,
> +					     struct drm_connector_state *new_state);
>   int drm_mode_create_aspect_ratio_property(struct drm_device *dev);
>   int drm_mode_create_hdmi_colorspace_property(struct drm_connector *connector);
>   int drm_mode_create_dp_colorspace_property(struct drm_connector *connector);
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
