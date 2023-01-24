Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 662DE679D65
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jan 2023 16:26:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BBC110E6B0;
	Tue, 24 Jan 2023 15:26:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2083.outbound.protection.outlook.com [40.107.92.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE80010E6AD;
 Tue, 24 Jan 2023 15:26:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gbsl7E5nsCpBvgDS2oauykPaSs1CkBAVwz9pZvxDz1VsqjCidXwkUC9d/sJ285BnaCduY0fDuBKUR9Nni8abnZVhye3DBKnoqv9YBRNG9CZi5M0pb7C6UzlrWC1JfNsM1hZAwQRFi7HSxPgi5Gg5/8+vq80U733deTHs7bawYA6WwnWk6B+wJRJUl9aSPURf7sx1S8UngKLBiZW3fO/RDoIxNE5X/2IA/2eUtRRtlE6CcFbVAvuhxlEVrVvOb1KQvGMqd9DRDGFQ2DUIH8PSW3RP/OpIO5LEC7CAA25Sb/4C9dWNANyYv+yMmnDBjhfbuWBrlOEerMHJYWDs8xIr9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MfxfZ70fzv5Xuc1FK1ZGx9XlgIreUtBLGi9cwz+2sfU=;
 b=dvRJc3lh6ppXAhUaEg2RcXrcG98rKLHKAFBwfnTRUSeWYblwD74n8hJwVLFbZoLaO9g3Gmfascn5TBDag44AlzPvQL2e10+o3FuWyJ6tCPZKACDNzz0DAG0Dk2HyQvoQ7X3WdsqetL86ypQEonmokMQWrPyl/dFX2mvBJlU+9LxIf93HlsXlBRKdLL/VK4sGNHNO3uPHl92nqVS5SUeAZ813oKZqcaYE3kK8jYLQN6+wChivuoOkaEfCvy+IKWff0R/CZzO1TVEBZqcBLG7xTp7II6OXuGl9x4hHtNfAOLQ20y+VKh4MPypve4IbPpxZTLiOLR9Pp9Is/znPuU0Txw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MfxfZ70fzv5Xuc1FK1ZGx9XlgIreUtBLGi9cwz+2sfU=;
 b=o1t/nBeTavr18FeCaBshGTmiEovHIGxT2NfYcDkzYj1xtD1v7aVah5a73+RyhDFp0JaO4RvQU9xfeFolqtQCWyHMIg9cJH1lpVG5+twp+cAeAANDXHoF/mcTOP1lXT7lNLBQ9wDl0qcgcagdfaZ7SuKWbLqawi+ZX6Jttu9zKos=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5311.namprd12.prod.outlook.com (2603:10b6:5:39f::7) by
 PH7PR12MB6787.namprd12.prod.outlook.com (2603:10b6:510:1ad::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Tue, 24 Jan
 2023 15:26:14 +0000
Received: from DM4PR12MB5311.namprd12.prod.outlook.com
 ([fe80::2d5c:4370:2ece:ea]) by DM4PR12MB5311.namprd12.prod.outlook.com
 ([fe80::2d5c:4370:2ece:ea%4]) with mapi id 15.20.6002.033; Tue, 24 Jan 2023
 15:26:14 +0000
Message-ID: <349f8e1c-2e33-4519-5238-9080dbfc8009@amd.com>
Date: Tue, 24 Jan 2023 10:26:06 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 10/21] drm/amd/display: Signal mode_changed if
 colorspace changed
Content-Language: en-US
To: Harry Wentland <harry.wentland@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20230113162428.33874-1-harry.wentland@amd.com>
 <20230113162428.33874-11-harry.wentland@amd.com>
From: Leo Li <sunpeng.li@amd.com>
In-Reply-To: <20230113162428.33874-11-harry.wentland@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0290.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:6d::26) To DM4PR12MB5311.namprd12.prod.outlook.com
 (2603:10b6:5:39f::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5311:EE_|PH7PR12MB6787:EE_
X-MS-Office365-Filtering-Correlation-Id: f55a499c-6d0c-4516-4804-08dafe1f546d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Yw1QaqjkH6KUg6QIQTUyhZZ31ZyXWzFozxld+BFuVXV2lypdOW0lRnH6CfXMzCFxQe+o4TjoJRb/Uq+xjqRIoooSpMfLx1PAWeekl/R3ZFoa4Py3l84uXaE91lhnp5yhAmjpXxPbKo/+LcmnkmsPWUzXkzHKVGmKDo6k/ZxH+A1MzKlKJAPs3KjGyMDc4UJ+CglPGrpagv07UFvqdbkE69sNNJOoaCXQTGw0UmZSu8xhf0WqoZnvEEIqE8lBtBGVbjYsKxpC3wdwv/ZJYvhMsVdLaoWXwmOfuLVHpyEUpldYjeFxfheSskj8GCByPNiwu3rglyQ5sSVdUFjnQM9l6AE2hgz5yOuX5eodXKYVsqueMa2k1B+RW3FXzT/PbGXhjoXgj1nsmsRR/eKHKYwAQs4vuLoUlBNa5mdHzM8qsmS0ht6YrqlEMLHfro7aWinaCmMIZPBj8KDGLQsm1CEgTROFFz77Ni07/s4XiPYt1CwQs6xTMsUFQBjpeu0qC8Ly55n+0Cw3l63bFHgR4B+dcgKKxc8eebAZJNr0stYVj3WXyZaP0ie7cgg+9OvHPjyERPAnbFqTtwpzkSMhTtuCurME01cmhoh/mWuPQZAZKiduwB6xdHSDB9bmWvKX6V/7h550xgb6uUCAwKtAjmOvlum4Q5UdFumsF8qdk9JXmOcWWjctZl25hYfVsJykOP2edoNvEl/ar9m0sb8ab8BtK1th5QWR+Temfic9FQXqaaw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5311.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(136003)(376002)(366004)(346002)(396003)(451199015)(66574015)(83380400001)(2616005)(31696002)(86362001)(38100700002)(36756003)(4326008)(31686004)(8676002)(66476007)(66556008)(6506007)(66946007)(5660300002)(2906002)(41300700001)(8936002)(6666004)(6486002)(478600001)(53546011)(26005)(186003)(54906003)(6512007)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a01zVUsySlJ4VmF1OC9lVGdYb0tWd0VtYkFlUE5sWlNWWmVzckNrTmEyTE5M?=
 =?utf-8?B?M0RPVGdZMEE4SFd6NlNYczdDRDZJL0NBSjErK3dZKzU0MWlXUmx5S3BhOUd5?=
 =?utf-8?B?aWhjbWJWYndvSDk2TW9YTEhOZ0J1bGw0L3AraGtaZXl3eFhDRmpTSGNtMTRE?=
 =?utf-8?B?V3hmMHA4THlBakgrZW1VRGE5VmV3UVRKaGZVU3RyYVhUTFJOQ2VQcFVkVTVy?=
 =?utf-8?B?N2xrRnppRjhYWnR0YTAxN2pNRE43MW96NjBpQ0RLYjlBUmFFU3IzaHY0cmNj?=
 =?utf-8?B?bUdjQWkzUFdLUy90eC9sQXd1a2lXTU5WMWN3ais4R2tHMWszQUtQTE01UHZa?=
 =?utf-8?B?WnRYUEV2b1JUY0hLNkFESHZnMVp3T2dndEd0aHUweXBmNkFEOVhnK1BjWXR6?=
 =?utf-8?B?RVlQeXRLZWE1Y0kyTXpZemJUdjZydG14ejJKd1grZXNpR2U3RGN0eDBjZG40?=
 =?utf-8?B?bE1xSlcrV1FnaW1PTjNXUG80ekF3cnRXNjFRUDUvVUFkNEhMWEdnOHk1cnl0?=
 =?utf-8?B?Q3J1cU9ORnRncy8yWTVDMUZ5TW1FVktKVHYyV0RLazZhTUp2aVJ4Wkg1NHhl?=
 =?utf-8?B?WGsvaDQzbm1yemxZRlpsWWFUVWdHcTFwdTBLYjNGZi9BcjF3T1RTMGZtaUNr?=
 =?utf-8?B?ZWNEdjBMMmU0VkJjRjhWd0tCOWNFTVd1T2l2M2w5bG1UQVpUK0hHd2Zub216?=
 =?utf-8?B?Zkd6Q1dvemUrclpvZ0tLbEc5R09KNWhHNzhRQXR6YlFDZmVRMWFmSGJtTW9P?=
 =?utf-8?B?WTRSOUtPOWd4OHlDUE1TNjJrbzlNQ1JGZ21lR04xeUQvckprYk80dzA5c0dt?=
 =?utf-8?B?WnJjdWJoVU5GbDVOU0lBZmd6VjhuenVoSXBrRVlweGJyL1QrK3Jua2NJY2d0?=
 =?utf-8?B?K1VOdjZkaVhVMkwrRVM2dmluaVFrbjFZOVpVZktaV201TW5Gand0T3BReHgy?=
 =?utf-8?B?dTFuaGVGYzE3RXVJUU5PMmh2UVp6b2VXZGg5ODl3eG1HNm9PaWduY0tWVThu?=
 =?utf-8?B?Zk81T0d0ekxNdGc3V3ZSM3lUZ3JtWTU1WVNKZnpCRTVxVWkwZis5djdhQ0lV?=
 =?utf-8?B?V2VObUthYWhlYkI4QWI5QU8wdVFGT2w3Q2R2S2VySFNlSmpQZGsyY1l6bUN5?=
 =?utf-8?B?MmVVUXF6d01tUDBtdWw2Vk9iaWNzdWtDOVpHQVdIc0p2SGU2YndlZFllL2ZR?=
 =?utf-8?B?WldGNXpSTzFiaWM1cXZ4OVl2N3o2SXg5OWZIRTdWd1N0aEx6KzlCditLd0lN?=
 =?utf-8?B?Z3FlRjhhbnFzSkN5d2w2RmxmQ2ZHdnltZ3JsWVBUZ0taQXhUbTZHb21tK2xT?=
 =?utf-8?B?UGVyQWdCSElvTTEzay9ENlhvT0NMZnpzQ3lmK3RCQW41NmlHWVJkZklSVVQ5?=
 =?utf-8?B?YzlRWit0NXdnZ010VjlCK3JoNEdaWHRTWEE4K1I4ekxISklPV2J5ekJVVjFN?=
 =?utf-8?B?K0FUTkVvc1BtbDJBK2NZTldpS3RSVDV2eWFtWnFOREs4cy9DQ2MzTitSYzJL?=
 =?utf-8?B?dXFZbkdGUVBsdytKNW11bHp1L05idUhDOXpoT1FhRmVOaWUxcFVMNkhKQ0py?=
 =?utf-8?B?TFhzY3ZPWEtlNUxUbnpNU1JhZStpM2VxVW1RckZ2ZGc4c29HT01qQktqR2tN?=
 =?utf-8?B?bFExZVR2VzRHYit0MmxiSTd3cTA2L2ZTczd6eTcrYWszbEoxSjNWcTlXOWxR?=
 =?utf-8?B?azRremNlV1FiOFZiSWdWM3hrRzVBaEVmVGZ0MU95MzZuSm1sOURoMnAwdm1P?=
 =?utf-8?B?Y0RXbDRldE1aSm5YVXQ5YzhMdDVTVDRZMFJ1RFBrQTFKUDl3VDlJUjg3Qi83?=
 =?utf-8?B?anR0MCtSMDRWeUhXU29mVGpraTRKUDhNb1h0Skl6ODRVbUVva1F4ZWlBd0Rw?=
 =?utf-8?B?Z2w3YndtbExoQ0JNajR3bklDYlpOcXVYeWtsa2V1bk5xeitUd1JXZlNLeXBJ?=
 =?utf-8?B?NFNzZENQUVRsakNaMEsyOGpnMG5MZ2JMSHl6Z0xhNklaNTd3QmREd1dpQWxX?=
 =?utf-8?B?TkRVMkN5b2Y4em9aNnNzYlNNcEMzZTQybXVEVVVic2dpSHFxOHFpSzI5L1Ix?=
 =?utf-8?B?QmF1MDcvaWl6TGtjUjBuUVQvbHZ6eCtsbXcwRjkvcCt5TS8rdUs3eXE0MFRy?=
 =?utf-8?Q?ZBqYPF7hNOuumyQ3oMvCXlHYV?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f55a499c-6d0c-4516-4804-08dafe1f546d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5311.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2023 15:26:14.2266 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1Ka6PaOoaZSdv7PgjB+KUDzTlkxXjDosyAsvjBRTVQq1n1bIzLbhMJMjlL9Pno9Z
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6787
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 Pekka Paalanen <ppaalanen@gmail.com>, Uma Shankar <uma.shankar@intel.com>,
 Joshua Ashton <joshua@froggi.es>, Vitaly.Prosyak@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 1/13/23 11:24, Harry Wentland wrote:
> We need to signal mode_changed to make sure we update the output
> colorspace.
> 
> v2: No need to call drm_hdmi_avi_infoframe_colorimetry as DC does its
>      own infoframe packing.
> 
> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> Cc: Pekka Paalanen <ppaalanen@gmail.com>
> Cc: Sebastian Wick <sebastian.wick@redhat.com>
> Cc: Vitaly.Prosyak@amd.com
> Cc: Uma Shankar <uma.shankar@intel.com>
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Cc: Joshua Ashton <joshua@froggi.es>
> Cc: dri-devel@lists.freedesktop.org
> Cc: amd-gfx@lists.freedesktop.org

Reviewed-by: Leo Li <sunpeng.li@amd.com>

> ---
>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 10 +++++++++-
>   1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index c311135f1e6f..f74462c282a6 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -6492,6 +6492,14 @@ amdgpu_dm_connector_atomic_check(struct drm_connector *conn,
>   	if (!crtc)
>   		return 0;
>   
> +	if (new_con_state->colorspace != old_con_state->colorspace) {
> +		new_crtc_state = drm_atomic_get_crtc_state(state, crtc);
> +		if (IS_ERR(new_crtc_state))
> +			return PTR_ERR(new_crtc_state);
> +
> +		new_crtc_state->mode_changed = true;
> +	}
> +
>   	if (!drm_connector_atomic_hdr_metadata_equal(old_con_state, new_con_state)) {
>   		struct dc_info_packet hdr_infopacket;
>   
> @@ -6514,7 +6522,7 @@ amdgpu_dm_connector_atomic_check(struct drm_connector *conn,
>   		 * set is permissible, however. So only force a
>   		 * modeset if we're entering or exiting HDR.
>   		 */
> -		new_crtc_state->mode_changed =
> +		new_crtc_state->mode_changed = new_crtc_state->mode_changed ||
>   			!old_con_state->hdr_output_metadata ||
>   			!new_con_state->hdr_output_metadata;
>   	}
