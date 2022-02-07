Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18ECA4AC96E
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 20:25:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C36E410F8D6;
	Mon,  7 Feb 2022 19:25:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2043.outbound.protection.outlook.com [40.107.237.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C359310F8CF
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Feb 2022 19:25:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c/b7dfzGVUmvRsL1Loq2eptJqMtnz0w2GfTX1Fi3y59ib+XKVA91+PbCPUUoxpIK/8vez2J6asU7UJ0HDH8IBIb52P03kn+MUfJgk3f7aB/fetaiKGwXym03BdzFgRggrfjz6O1YSP9SQ5g/1h4WAqJhHK1cQD+62bHsuoziPn4mMfBcsmRvalZzSe0Kt7F2cVjexDkLJaceahrEd8i2Phx0dL8VGw7QOdy/6SDBaVtwXTD4UWc7NR6GBunEZiN0bqsKDc2QeXt6oiBdPSvTvwp754gx5GF2TvL3BgeX1s4Z2dQpGqptnUaSZOA5kFuClRWsW9ARFe8w2B8mZmLjzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QOHpT/A7iNkvFIqBZ2IPQE4hPwpvOJMVCqLkbb2M8vU=;
 b=F2sNMWMMZkGae1qtsFyACIoaz/xZPqDG1uQcXnGFCJnSiYeTEfC67JZxQuS2mypagbbYQNsc6SqnBSSekR4YV+dI+tU56OnUeGhvu2aQsbPSyw2MyVjIhYFrLLsSwNyl4XUYQtjrMWKnpjIG4TatJPXyWcA7KR+kqkXS9IlnQ/fLJq2o44iJNA3wJ/Hxj8t3Vl2w9bnVZ6pIb9eSldG+oqxTV48AJ1yaWEy+wecW+Af5KsLTajtAUj5AKCrdXTqO6N3eWyzXQbpVY2JsPsQiImTnxdsTNjz3l1plrkIiVNQg/ZCoMXylYhNcuxbBZHO8fXsaFH0nECvXkUXd0J36Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QOHpT/A7iNkvFIqBZ2IPQE4hPwpvOJMVCqLkbb2M8vU=;
 b=KysoFfTqdh6yMBy3r9E2zGhdrKDCr25+wCwEAGqsTBZmjBIP3eThpNiFvaQ+sdBd5+yisCZZ4kt3x7wO03EC9pvwZ36vn6Ia4SjcM2Lq3Ar9OeF7QhSaY+Wi/Gjehud/GRW1q4nIb0u4ISiFffKJDykAsYVFcJTN6i/sKHJBA3o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by BY5PR12MB3889.namprd12.prod.outlook.com (2603:10b6:a03:1ad::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.17; Mon, 7 Feb
 2022 19:25:24 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::dd4b:b67b:1688:b52]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::dd4b:b67b:1688:b52%9]) with mapi id 15.20.4951.019; Mon, 7 Feb 2022
 19:25:24 +0000
Message-ID: <d90823ee-1632-441e-9928-811b6768001a@amd.com>
Date: Mon, 7 Feb 2022 14:25:20 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH 19/23] drm/object: Add default color encoding and range
 value at reset
Content-Language: en-US
To: Maxime Ripard <maxime@cerno.tech>, Daniel Vetter
 <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
References: <20220207163515.1038648-1-maxime@cerno.tech>
 <20220207163515.1038648-20-maxime@cerno.tech>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20220207163515.1038648-20-maxime@cerno.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT1PR01CA0089.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::28) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d9a78e95-152e-4d7c-6a48-08d9ea6f9673
X-MS-TrafficTypeDiagnostic: BY5PR12MB3889:EE_
X-Microsoft-Antispam-PRVS: <BY5PR12MB3889136CFD9FFBBBCF2C488A8C2C9@BY5PR12MB3889.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PE5yzgbjUk5Zn/Vgf0nlMblxxwA3KncGqviZ/gnmECXkR1lHm5StCgTGQLLwD14pQIiVrdlvJTLjgHZToQM/DGQB8zJ0jMvjSqkr6flWxvMG/8vDRkl+3Vp/GXw076f3QRyy3QB47UH6Fr4XqpafIGT2nJ4Dd2oev2GOeHhJgEo4i9y2weK9uVp3q1QeCMN+cCcnW0VGuaXlF6xpDd8EewEMz38ps8Xb0KAGInH3wogBt5fxmyvPB1lE+RJLoan4jTF11z4R4zf+ncEvYD6egAOIXRaYJ0PWJB+H3ozFRphebszXdMLOgSEBeIducfa4odcWGRd2l8NK+Wv1VFpr//GC8I4iA9k6YL63g8pvyYdLbKuYgQ+RPYIZOw/h+zQaxWZ9FvJO574do8nCzLRvv86LzKzFoMYC2vI8V0UPv7sDUGNS+T7VSzAocc5Vp3lvH5+7VW7k8EjysuI9EyuV85GNXAGqZx09rQ5JYYgKCE4i5CQk6YNsnIrCBOv3QGW5ZuxGEqUDAgwSCkZqtaK8FsqVrergpnAWLF5QZxegbnrOHf7PjSvCi1jEvanzB+z7lKnAJzfGF70NV6OAK8feKIcbsK3zOY7m0r2oTrBewSU9XEKcUGsEzb8dyYPPcDSB4Uh+fNkYpoD7OK294aw8n8eCy7eWGtAuJX3pXro+cjiJeCCWRXGarj4x0tn6t+ktE5JbqnycApr5SNdXOhmxQ95Vy7UldxTEvEAlfMDpZykbZeIt0AYzow9sdSOdnXqM
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6506007)(6666004)(6512007)(26005)(86362001)(110136005)(6486002)(53546011)(38100700002)(316002)(54906003)(8676002)(186003)(2616005)(31696002)(508600001)(4326008)(8936002)(66946007)(66556008)(66476007)(36756003)(83380400001)(31686004)(2906002)(44832011)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T2E5TE1TVXNvMjdZdXpZaHdaWjNxTFVPVVVoRm8xb3BJdk1UVXN1ejdjMGpW?=
 =?utf-8?B?NGdKNXM2QkpDM1dZbG8weHhkbXJUSUMvaTNXWURyaWZUQ0lVVGNQWlN6ZWNS?=
 =?utf-8?B?OFRHUVl2azNLWnMycjFQT3pDMUxuOElFUVN5RllwQ2gydW5McWlpd2VSb0gw?=
 =?utf-8?B?MUNQc1RRdDZYUGk3V1lGTzcyUksrczdRdkFlZGJuZlE4K2wrRHE3WG5xYkU1?=
 =?utf-8?B?eUozNEI5WnZlcGxicExadTNxMlhLYWZkY3E4WE0zT1hibWIraU94R0FvZWt3?=
 =?utf-8?B?V1RXWU1YY0RPT3FKOURzNWl3MDZ0bzlxajNXTUpVM0Y0UXFQbVFvRTZ5bm9o?=
 =?utf-8?B?RHdINHBGK1RxTzI3b3dGWjZ2c1BMUWJhbjVhemdNdXpqWTZkTE5QMGJWQm1q?=
 =?utf-8?B?elk4Tm5hN2wxa2RPUzg2NWUybmFMelRzWjF5TklWRVRzM2tzV0w3eFR5SkVV?=
 =?utf-8?B?RTNiRGNNU3ZnMjhoMkxYenExTTNZUUozOTZtOVhrV0Y2V0dsRGZ0cHJleFBx?=
 =?utf-8?B?Mit0TEJGTDNJbFdxcC9hTnNLMU1aRmZPNEQyRzIyaUEybW5QQkRReXdQcVJv?=
 =?utf-8?B?TDFUNksyb3BSNTd3Y2FxdEtNbjdxejZYMVNncXhBU0ZpU09zbWQ5Ukk3d0NN?=
 =?utf-8?B?RFA4Yk82eU41OStnSy9UcklCWGJ1Qy9zNVBzaE9NTnlVK0N4WEFmekt4NmJu?=
 =?utf-8?B?aU5WRWRDcWdLQVJpMVV4ZDVyNHlKcHRodVhBRTZmWVdQRFBZaUc0SzZQd3B0?=
 =?utf-8?B?UmJMQ2JrRGw2TXdMR1RUYUNnamIxQlJGMEsvTWR6MXNCZ2FWa2ZvUms3UTcv?=
 =?utf-8?B?Qkljb0E5NVpiV1lhbFNWMUhpOW95YlhidUkzb25qaWNjU2ZtV1ZLZG9KOEVw?=
 =?utf-8?B?ZHNwV0RHYWw3Z1hxd0VwZU5aOXlxcWgzZTIyYTd2QVRad2ZWQk9JZHdlSnNQ?=
 =?utf-8?B?N2Frb2VURGEySFJIOUVONU5XdXg4a3NQaWFQUkdIbnBDUVpiSis5NEZlU2JI?=
 =?utf-8?B?cG53Si9sakcwZWJaRUl4NWxTamZFQndZVld6djV3M3hhRXJzZWg1NG9jUG52?=
 =?utf-8?B?a3FoaURJN0JaSWlEOFNuRnFmbEh5UWN3QWpiUXg5MDEwcjkyUERvVTlVa1NO?=
 =?utf-8?B?bFRvVktiUkZUR0xuL0JTaGVoMHFkRXoxMFpyeHpVTERrQVd1YkkxT0VHTHFT?=
 =?utf-8?B?R0RIeVRZYWxlVERZSzNzQVhDeWFlVGlSTENwT0VRMXA3ampCZ2N6bS9tMmdX?=
 =?utf-8?B?b3BvMGI3T1YrVmVaM3VyL2NRd290blB4YmFaVjUvcGlUK2gxYWJrWlNodDlj?=
 =?utf-8?B?aWZuNnhMbkNZb0lwNUN4K0Q1YU9QU3VxTi9Ua1NwVkZZcTBZd0ZvcXo3ZHJX?=
 =?utf-8?B?VmFaY3R1b2tRRDZoZTBFc0pwK2JEei9TeEFoYlFicWVhRTdHeTJSdmtNS3Vw?=
 =?utf-8?B?dENvaHFHbkE1Ym5pcm9jS1g4Slk2SkFhY2hpMGdKM2FnZkRTQ2FBOUxRRmZL?=
 =?utf-8?B?K2hVY04rYWhmdWFkMFRlQjFOekZzeUsyNVppVmM5MFd3aklNaHNnbVk3amty?=
 =?utf-8?B?cnNudHBudHlzT3V4aGc3TzNNY2FlVGhqYUJwVTF4OCtWUjVxaGVWZ3dzeDA2?=
 =?utf-8?B?bmRrQ3g2U0lST3BsOFp0SnhqK2lnUmpyQzNCM3VoMjBOR2pnYjg0QTh3RUpQ?=
 =?utf-8?B?NkpmZG1TWHhoYTZSSHVBeEdITUcyb3VrZHpvUHZpdUo4SEp0SmJmY24yT3lm?=
 =?utf-8?B?cGh6MnJiM3paaHljMFE5NXdNV0F1ZlJoTjNoK3I0Q1RkZ1ZsTEJQa0xzb2gy?=
 =?utf-8?B?K3lUYVluakYrc1JwazJWZTV5MTF4QWJCVTdrbEV2eG5MWnFIRkZOM1NEdHVN?=
 =?utf-8?B?aEp4VTFCLzJwdktzc3RUY1RBL2VuTmxGWGI3cWtuK3E4T1pBUGhmbG5qZGtJ?=
 =?utf-8?B?WGFwZHAxb003eEh3aC9Jakw4Q0JxNjM1dUg2YXNFdUpaYUhqM1pzNkpSU2xP?=
 =?utf-8?B?Z2F3VGhGQXExYUZlc2k1UC9YcEIwVE93NXVyVGJ3a2pLNDdzd0ZVQ2JsbFJi?=
 =?utf-8?B?K1RXdThhRXpka213c3h6eEdOUmVkZmJGdFVTLzMvZThHVlRQVVZpdnhGWnhI?=
 =?utf-8?B?UmZPMmdJVjVpNCttR0pCb3hmdGFOc204S05HMi85c2I2VGRZMW80a1pUWGJF?=
 =?utf-8?Q?yXefKE5t5DnGMmgzv9RL7zM=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9a78e95-152e-4d7c-6a48-08d9ea6f9673
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2022 19:25:23.8721 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iPwLhCjR2t1TIMjLYUmp+wos1rC2lScbJh6l4Bv7K3fpdQjI+a+IT7SFOkTrJT5WWmpnuPgTfakystwVfC8gTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3889
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
Cc: Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2022-02-07 11:35, Maxime Ripard wrote:
> From: Dave Stevenson <dave.stevenson@raspberrypi.com>
> 
> The drm_plane_create_color_properties() function asks for an initial
> value for the color encoding and range, and will set the associated
> plane state variable with that value if a state is present.
> 
> However, that function is usually called at a time where there's no
> state yet. Since the drm_plane_state reset helper doesn't take care of
> reading that value when it's called, it means that in most cases the
> initial value will be 0 (so DRM_COLOR_YCBCR_BT601 and
> DRM_COLOR_YCBCR_LIMITED_RANGE, respectively), or the drivers will have
> to work around it.
> 
> Let's add some code in __drm_atomic_helper_plane_state_reset() to get
> the initial encoding and range value if the property has been attached
> in order to fix this.
> 
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> ---
>  drivers/gpu/drm/drm_atomic_state_helper.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
> index 1412cee404ca..3b6d3bdbd099 100644
> --- a/drivers/gpu/drm/drm_atomic_state_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_state_helper.c
> @@ -251,6 +251,20 @@ void __drm_atomic_helper_plane_state_reset(struct drm_plane_state *plane_state,
>  	plane_state->alpha = DRM_BLEND_ALPHA_OPAQUE;
>  	plane_state->pixel_blend_mode = DRM_MODE_BLEND_PREMULTI;
>  
> +	if (plane->color_encoding_property) {
> +		if (!drm_object_property_get_default_value(&plane->base,
> +							   plane->color_encoding_property,
> +							   &val))
> +			plane_state->color_encoding = val;
> +	}
> +
> +	if (plane->color_range_property) {
> +		if (!drm_object_property_get_default_value(&plane->base,
> +							   plane->color_range_property,
> +							   &val))
> +			plane_state->color_range = val;
> +	}
> +
>  	if (plane->zpos_property) {
>  		if (!drm_object_property_get_default_value(&plane->base,
>  							   plane->zpos_property,

