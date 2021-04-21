Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19201366E0F
	for <lists+dri-devel@lfdr.de>; Wed, 21 Apr 2021 16:23:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77BDC6E986;
	Wed, 21 Apr 2021 14:23:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2066.outbound.protection.outlook.com [40.107.220.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AAD46E986;
 Wed, 21 Apr 2021 14:23:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VJO3Zv3ZrcjGcXaJrk4FmHTCZF9GjZJstSeWmvw1UeJUtCBlmk5Eoy51mTP6mqfzqYAiobdaa4eZf/QJy/u2PvzLWP+o9RzSzcrUQxPgRVg/GsfZaJ3NHPXHq2NXV/ScQm+1bT1X/gh8pMMOi/HGbe5x5eMjGScei8CQYdQPslDwmlN8BXO5GBmAWlYxwy7Tl8zGqyNKeLR8P/hkPlU2Dv20hChYX1hyvClMYz1mb2TpxQ0vLektzijpG5OC0EnOD/RW6XTtdx6d/I6xuIxff26oWz5+oNFHqORfjF/yy9aX6hYDkOEl9HTa7awuNX+fuCFtUKYUT1wJ7Oe6GGdWDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sbhLCF2jW1o4CffArA4/oGXrCchqD7i6yFX4TSgSs1A=;
 b=NQg/LoFHSRD8rFHe9fiVSQRSePGvDOwXo/ZtArf6kj0g1v+yQL92SALyCIkRaVYp/rGG6sEkn4oTJllkL8+ZgGKbz/YNiKICF05Nu3XKTfOM7jCdO0GJLB19JmIe2NSl0MxT4DHfqnDfEF50yXzCJ9FLDpHlTm0/dQ+HFJecA36oQwsv0ubSwqtxAs/RebOAE0QFYbRvjnEwFF9b/8jnPMjyKRN7QLhUPU0nVdNotd3PTehYsLfmbqlD59Mx7ColzgyXSzbdCZP69hKzwopnmnPxsrZUtMX3do8FpsuBDNp6xbbCms+WpWtDVCr2S8zcZVtdL5hqaaeQOi1/WMazDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sbhLCF2jW1o4CffArA4/oGXrCchqD7i6yFX4TSgSs1A=;
 b=PcAchEQCjocPEnVNQJmLtxZ8IscvCHfr4AsfULQ6g8mF1xg+1zzNsIMn4SfIV2HC2hsVZZ61s1VQWqsqs+oL6PoTKX585FER8Mj7+8sRmVZTrjd++4ib+j0/XvwzB5Hso84DroQn3MXZTv4xYaGNVpy0dk/+4RopE8aDjOLIJ2s=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from BY5PR12MB4644.namprd12.prod.outlook.com (2603:10b6:a03:1f9::11)
 by BYAPR12MB2712.namprd12.prod.outlook.com (2603:10b6:a03:65::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.19; Wed, 21 Apr
 2021 14:23:31 +0000
Received: from BY5PR12MB4644.namprd12.prod.outlook.com
 ([fe80::7063:edb0:6da8:c368]) by BY5PR12MB4644.namprd12.prod.outlook.com
 ([fe80::7063:edb0:6da8:c368%4]) with mapi id 15.20.4042.024; Wed, 21 Apr 2021
 14:23:31 +0000
Subject: Re: [PATCH v3 01/20] drm/amdgpu: Add error handling to
 amdgpu_dm_initialize_dp_connector()
To: Lyude Paul <lyude@redhat.com>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Thierry Reding <thierry.reding@gmail.com>
References: <20210419225523.184856-1-lyude@redhat.com>
 <20210419225523.184856-2-lyude@redhat.com>
From: Mikita Lipski <mlipski@amd.com>
Message-ID: <bf4f9c16-f5d7-214c-dbb7-08cb58cf6d7c@amd.com>
Date: Wed, 21 Apr 2021 10:23:25 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
In-Reply-To: <20210419225523.184856-2-lyude@redhat.com>
Content-Language: en-US
X-Originating-IP: [165.204.54.211]
X-ClientProxiedBy: YTXPR0101CA0057.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::34) To BY5PR12MB4644.namprd12.prod.outlook.com
 (2603:10b6:a03:1f9::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.31.19.100] (165.204.54.211) by
 YTXPR0101CA0057.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:1::34) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.21 via Frontend
 Transport; Wed, 21 Apr 2021 14:23:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 48536e22-4820-499f-3df8-08d904d109ed
X-MS-TrafficTypeDiagnostic: BYAPR12MB2712:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR12MB27122F89C24E6956868A37E6E4479@BYAPR12MB2712.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: u7PrFPlOnEeR1qC4vbXbjVj0azMcvlif65xBd4pjddRbJsKIVb4VuVUsaS7zuwg+sX9aP+ZcNzKeyly4U6Uzds9xrZ53y6a07CrLkHv9Nt3V0TRCjFPSa82QRZcEZFvSf0AmMT+wyeacjxJqIfo6yoUK8Eei3Jn7tr2w2h2EkFQipWaVkepM+CiAKiHuLA77W0f+MX4TvqfXUJjj2r4IT/ePnyq/LiMNqa4nLQcIvfhlnDJPYeaUX/qb+90mbKSO4eDLo4JygwJZLLO4X9NtBP4Ul0I5dgbmIOyeQ6+H1WaCq7+wlDmhzSWgJGPrHQYhLGPzeJ96s1BaCM0BzdonTOm5nIF/JuzXQ9W3lu6dvn+qoPVs6PYMg+58GkbneMWlJAWZeFYpBjxVzsj6MpKAXIXWI65he246Am/kYHXACzOJDR3ZkzFrJB80eIAuhBM1vueGuYBMMwbVH+SR1mtiWP9lY+qx3ydF1QyOcQmV4wkrqkI8TH+rDDZ2rd3sNJld0SdlVJWWZt8MVWE66ZJvufax4I5I2XpXS46v0W3nclBHRdgmszrfVaQjFKDHVVbcHQdORRGopIDkZ9iJaMC6KAVY0mKb15Kb+AILCmQcUcJ4FuqhSsnN9DOXUMD25znQO+L/+cOeN0NsT1kznOlWmm1aJVdw/Tg9dA0M27cvB9PNMsgHq1mb2G2YG6diSG2AxnotZEv1T+Ot/ld/+1lkBGbd7DjcHw/6iTq9yxzx+jKuMjNy03+BHcmQVpDGTDb3
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4644.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(366004)(39850400004)(136003)(396003)(16576012)(186003)(53546011)(83380400001)(956004)(4326008)(921005)(16526019)(478600001)(31686004)(316002)(6486002)(8676002)(5660300002)(8936002)(54906003)(38350700002)(38100700002)(36756003)(2906002)(52116002)(66476007)(31696002)(66946007)(26005)(110136005)(2616005)(66556008)(7416002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RlJrejdRQ2NPOURMVmpUUm9ibUZXeTkyZ00vbGJMTFdXNERoYXU0VmpvbDFT?=
 =?utf-8?B?Q0ZDMjdDMkkzUGp2TkZSdFFNUHIrNXNtQjRIWXVpWVllWC9XZnFPSTNaN2Zu?=
 =?utf-8?B?MnFQWTllVHFjSDZwaXRjKzZmTXJ2SldyVHVUbVBwdTVKaENHaE9kVjFBNllH?=
 =?utf-8?B?L2tIb1NhbXJLV2FxRG1nVXlBMDhlVDFKZjVuRTUwMWVjNXA0TThheUdHbVVX?=
 =?utf-8?B?dDhCZmE5cEtCcXR6clhGUmZRdmltaXpGV29HTUw3d2NMVVBHMyt2YkJ3VDZ1?=
 =?utf-8?B?bFVadGpKTmVTVlRiNW1BMCt2b1V3elgzaGc0TTFldWRWbXpDY0Q4Q3gzWWM0?=
 =?utf-8?B?ajIxVXIrdlNzVW5walppM244bUFzU1hZcXZadUtVVVY5aTFCbGYwaDY0TTVH?=
 =?utf-8?B?c1NrZ0w5SS9PYklPeDJxTStoN2QyV1pJUFRyTWJaaFQxTDZzUjgxM0dHSjVx?=
 =?utf-8?B?VHM4QkFtNXNRYmpjN25zQWlBQU9YckJDM3U2L1M5SlZjazdKOEgvd1VHVVBu?=
 =?utf-8?B?MmpaOU9jbVg0VWVxMFUxUzQxUVYzalkxYTJyaHUwcktiTU1vMDY1b3pCZkRx?=
 =?utf-8?B?NjZ4TVYrVjE3c2dHUWs4dHB6aXhGUGZSOWp4VFdWVUhvdUladEpqTE9LUUI0?=
 =?utf-8?B?RXB3cGVHNy9xNGJxSEtIRTRaVTFxTS9neGsxMWtLQnJPSjU0UXk3T0h1RXVK?=
 =?utf-8?B?dDlnYUVCRERSMktjaEZWaWZVS3lORnREeWxrK0VYTDNrNUlIR2lvSEE0KzlC?=
 =?utf-8?B?LzQ3UG82Q0JwaVQ1UGt0RUtMMktuK09FNnpybC9JMUxmNVUvQ0FVcHUzRGtl?=
 =?utf-8?B?OUtqdjlKR3U2U3Q3dmNrdEdrV3ZRdFdBQ0NDQTkvRlhIZHRtbEFENUE5WnRQ?=
 =?utf-8?B?ZFg4S1N3cWdlQVdheS9hQS9DamV5Z21SMHowa0hVQzcwNjAzVEFmT04ybkxv?=
 =?utf-8?B?UUF0dmM3dkhDeDg2anFMZFNLT1YzY29zZXdqRHEvMnh4RVZId3Zvc043QzlK?=
 =?utf-8?B?NGswMUppOFNjUkxIUnpSQ3BPQ2FJQ3BPTTNPVldYVktHWG03YlpMR0hrQXhO?=
 =?utf-8?B?QmNsVkZDQ085eEhlRmtBTjNlYmVlMHAydGYwbUppRytrYVVFWGZ1M1pZSzhq?=
 =?utf-8?B?c0cwQ25xOWdCVmY0cklWQ2h2Z2szclJQdytwTW1IMklzVVBOaGdpbHEyblVH?=
 =?utf-8?B?b245Mjdza056WmhvOFdwVjQ0MG5YajhBUlVVeGw3eDlBVFdZc2k3YUYyM0hG?=
 =?utf-8?B?c3VualBkMzJnZnJLejJ1ZkRzUzIrNVFUNXJqZWZKS0xTblBpdEc5ei9uQjBv?=
 =?utf-8?B?OUozcU1qNEFjRXZiYjZ0c3BaTklMSk1OektzRjkwR2JBT1U3R2FIMmZVMyt3?=
 =?utf-8?B?SFZ0ajMxNGF0K2htdjQrWmozSytxcysvVklDeFpvdjZHTUFueTg1bTBjT2RQ?=
 =?utf-8?B?SXdzMklvSnB3a2NCUUNiYVI2T29rNzhtbUNNQVBoVStXTDBJaU02dG1sWHdi?=
 =?utf-8?B?cUZGR1JZMFNHb0xIYmRWaGR5SnU2V21tZGp5TTc1MnFIYU1MN01uRENpS3NX?=
 =?utf-8?B?NWozdTBLY0ZZUWtsY2g0T1J2K3hkTXBvNzMvZ1lpKzN1SEloV29XMDZTYWd1?=
 =?utf-8?B?N21weHNZdkRGb0ZoR3MybkxtTm5oRHU4YktaNVI4S3BrcDUxZnFSN3k5KzNJ?=
 =?utf-8?B?VFpxZnBHbHRMS3BOUGlQTU1EeHRJM1drMklQNllIZXpkVXRvRHZlTFU3NjAx?=
 =?utf-8?Q?PoKdLOCR3JweURJ5jHNpB77j/L1c5JpCra4Cf+K?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48536e22-4820-499f-3df8-08d904d109ed
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4644.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2021 14:23:31.5432 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1hF9wSI42bc0bMJQ/udM3sXxyvDem9W3iib5k0ygJjlgTxYn3G5TN3TVqVl59Cbf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2712
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
Cc: Stylon Wang <stylon.wang@amd.com>, Chris Park <Chris.Park@amd.com>,
 Eryk Brol <eryk.brol@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 open list <linux-kernel@vger.kernel.org>,
 Nikola Cornij <nikola.cornij@amd.com>,
 Meenakshikumar Somasundaram <meenakshikumar.somasundaram@amd.com>,
 David Airlie <airlied@linux.ie>, Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Wayne Lin <Wayne.Lin@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Mikita Lipski <mikita.lipski@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks for the change!

Reviewed-by: Mikita Lipski <Mikita.Lipski@amd.com>

On 2021-04-19 6:55 p.m., Lyude Paul wrote:
> While working on moving i2c device registration into drm_dp_aux_init() - I
> realized that in order to do so we need to make sure that drivers calling
> drm_dp_aux_init() handle any errors it could possibly return. In the
> process of doing that, I noticed that the majority of AMD's code for DP
> connector creation doesn't attempt to do any real error handling.
> 
> So, let's fix this and also cleanup amdgpu_dm_initialize_dp_connector()
> while we're at it. This way we can handle the error codes from
> drm_dp_aux_init().
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 29 +++++++-----
>   .../display/amdgpu_dm/amdgpu_dm_mst_types.c   | 44 +++++++++++--------
>   .../display/amdgpu_dm/amdgpu_dm_mst_types.h   |  6 +--
>   3 files changed, 45 insertions(+), 34 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index a0c8c41e4e57..fc5d315bbb05 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -7608,10 +7608,9 @@ static int amdgpu_dm_connector_init(struct amdgpu_display_manager *dm,
>   
>   	aconnector->i2c = i2c;
>   	res = i2c_add_adapter(&i2c->base);
> -
>   	if (res) {
>   		DRM_ERROR("Failed to register hw i2c %d\n", link->link_index);
> -		goto out_free;
> +		goto fail_free;
>   	}
>   
>   	connector_type = to_drm_connector_type(link->connector_signal);
> @@ -7625,8 +7624,7 @@ static int amdgpu_dm_connector_init(struct amdgpu_display_manager *dm,
>   
>   	if (res) {
>   		DRM_ERROR("connector_init failed\n");
> -		aconnector->connector_id = -1;
> -		goto out_free;
> +		goto fail_id;
>   	}
>   
>   	drm_connector_helper_add(
> @@ -7643,15 +7641,22 @@ static int amdgpu_dm_connector_init(struct amdgpu_display_manager *dm,
>   	drm_connector_attach_encoder(
>   		&aconnector->base, &aencoder->base);
>   
> -	if (connector_type == DRM_MODE_CONNECTOR_DisplayPort
> -		|| connector_type == DRM_MODE_CONNECTOR_eDP)
> -		amdgpu_dm_initialize_dp_connector(dm, aconnector, link->link_index);
> -
> -out_free:
> -	if (res) {
> -		kfree(i2c);
> -		aconnector->i2c = NULL;
> +	if (connector_type == DRM_MODE_CONNECTOR_DisplayPort ||
> +	    connector_type == DRM_MODE_CONNECTOR_eDP) {
> +		res = amdgpu_dm_initialize_dp_connector(dm, aconnector, link->link_index);
> +		if (res)
> +			goto fail_cleanup;
>   	}
> +
> +	return 0;
> +fail_cleanup:
> +	drm_connector_cleanup(&aconnector->base);
> +fail_id:
> +	aconnector->connector_id = -1;
> +fail_free:
> +	kfree(i2c);
> +	aconnector->i2c = NULL;
> +
>   	return res;
>   }
>   
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> index 73cdb9fe981a..3dee9cce9c9e 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> @@ -425,33 +425,39 @@ static const struct drm_dp_mst_topology_cbs dm_mst_cbs = {
>   	.add_connector = dm_dp_add_mst_connector,
>   };
>   
> -void amdgpu_dm_initialize_dp_connector(struct amdgpu_display_manager *dm,
> -				       struct amdgpu_dm_connector *aconnector,
> -				       int link_index)
> +int amdgpu_dm_initialize_dp_connector(struct amdgpu_display_manager *dm,
> +				      struct amdgpu_dm_connector *aconnector,
> +				      int link_index)
>   {
> -	aconnector->dm_dp_aux.aux.name =
> -		kasprintf(GFP_KERNEL, "AMDGPU DM aux hw bus %d",
> -			  link_index);
> -	aconnector->dm_dp_aux.aux.transfer = dm_dp_aux_transfer;
> -	aconnector->dm_dp_aux.ddc_service = aconnector->dc_link->ddc;
> +	struct amdgpu_dm_dp_aux *dm_aux = &aconnector->dm_dp_aux;
> +	int ret;
>   
> -	drm_dp_aux_init(&aconnector->dm_dp_aux.aux);
> -	drm_dp_cec_register_connector(&aconnector->dm_dp_aux.aux,
> -				      &aconnector->base);
> +	dm_aux->aux.name = kasprintf(GFP_KERNEL, "AMDGPU DM aux hw bus %d", link_index);
> +	if (!dm_aux->aux.name)
> +		return -ENOMEM;
> +
> +	dm_aux->aux.transfer = dm_dp_aux_transfer;
> +	dm_aux->ddc_service = aconnector->dc_link->ddc;
> +
> +	drm_dp_aux_init(&dm_aux->aux);
> +	drm_dp_cec_register_connector(&dm_aux->aux, &aconnector->base);
>   
>   	if (aconnector->base.connector_type == DRM_MODE_CONNECTOR_eDP)
> -		return;
> +		return 0;
>   
>   	aconnector->mst_mgr.cbs = &dm_mst_cbs;
> -	drm_dp_mst_topology_mgr_init(
> -		&aconnector->mst_mgr,
> -		adev_to_drm(dm->adev),
> -		&aconnector->dm_dp_aux.aux,
> -		16,
> -		4,
> -		aconnector->connector_id);
> +	ret = drm_dp_mst_topology_mgr_init(&aconnector->mst_mgr, adev_to_drm(dm->adev),
> +					   &dm_aux->aux, 16, 4, aconnector->connector_id);
> +	if (ret)
> +		goto unreg_cec;
>   
>   	drm_connector_attach_dp_subconnector_property(&aconnector->base);
> +
> +	return 0;
> +unreg_cec:
> +	drm_dp_cec_unregister_connector(&dm_aux->aux);
> +	kfree(dm_aux->aux.name);
> +	return ret;
>   }
>   
>   int dm_mst_get_pbn_divider(struct dc_link *link)
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.h
> index b38bd68121ce..cf771ff58bb3 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.h
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.h
> @@ -31,9 +31,9 @@ struct amdgpu_dm_connector;
>   
>   int dm_mst_get_pbn_divider(struct dc_link *link);
>   
> -void amdgpu_dm_initialize_dp_connector(struct amdgpu_display_manager *dm,
> -				       struct amdgpu_dm_connector *aconnector,
> -				       int link_index);
> +int amdgpu_dm_initialize_dp_connector(struct amdgpu_display_manager *dm,
> +				      struct amdgpu_dm_connector *aconnector,
> +				      int link_index);
>   
>   void
>   dm_dp_create_fake_mst_encoders(struct amdgpu_device *adev);
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
