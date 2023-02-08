Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32D1968F8A8
	for <lists+dri-devel@lfdr.de>; Wed,  8 Feb 2023 21:15:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19A59899A3;
	Wed,  8 Feb 2023 20:15:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2062a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C640810E863;
 Wed,  8 Feb 2023 20:15:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aPpUjNPp3ZqvhTsduulDLeqFjFp5fdUy/xc3BbSWZvuBbpQwNJxzqHC3DQK78tc5X+XhNNV8XNyJpbe3pNdXEjE7ID5XcRfzrf+3hvhbRiWOni4SJsSbDVdswTGemhMcHdIR7JcUxzNupibv/wXO5k+0UxiSC4a0HrSFraTRQl9DcB6Y5lx9Q5eQAZqfIyQKot3raZsgitH5RyyfCGrYk+8mpAc2J+JXFfQnNCJuMiIFs+1op+s4timNbGWbIdjvLU0rgGhwd1PmYMRHFww46j//WKlR2dejPyT2Q3AHB+gcjcEKV55QQZh6i6Q6jpXzwWu7o9w4ycwVzTwHMTirAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GMsCqC5+85bQpeCOv+rUZYFL4rnl7CUgho59BJPalWo=;
 b=mn0ZgmtJloDWMrX0qQzjrm/mX9G4q7SjmPXWRNKW6IdcgHJK1qaOAMpnVuKrumiyArGG3bsfZ4zNfsGbFmYQioypsGDT4IaA76eXFjjmMnIicuz0lCy5RmyfxKbG73FpDL/qjOUJWzG5QfspxRlb6bNLgTkpoI8uLbUug/i1RZ5GS+knLn86NeeLSuxSsluFHQDCQk8rezhhi44XOE93oEBto0TsByUNwLUW+dTj4Z/8EhSGCOuzS/F0vpNZhoHYlgH1q1v0kbQZ7dCqLpZ5kcGSr8rKqkhg5/WvGf9Rof3fWiSS4CAPdn+vhF860A2rvZ9rRwYvfz3zBoqZ9o/HeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GMsCqC5+85bQpeCOv+rUZYFL4rnl7CUgho59BJPalWo=;
 b=0tXMNrKIsF4FwNHb3DgYksgIrebJXj/3/MOzv/a/VKfijlSGQU2PT0mnzTY5ujpeTQMBZH1XPQhSeLYa9I6bKlh5aTzhF5OvcnPtRI/z0Fw1Qj8Qis4ct4zHVCMqu2y3/G02TwobBII7ZCveYxGY3eSqj5MeOe0TZet41IjZKHY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by PH7PR12MB6419.namprd12.prod.outlook.com (2603:10b6:510:1fd::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.31; Wed, 8 Feb
 2023 20:15:32 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::aa28:9378:593:868a]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::aa28:9378:593:868a%9]) with mapi id 15.20.6064.034; Wed, 8 Feb 2023
 20:15:32 +0000
Message-ID: <52f84169-b50f-3ac3-a4df-45e20b349fa2@amd.com>
Date: Wed, 8 Feb 2023 15:15:27 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] drm/amd/display: don't call dc_interrupt_set() for
 disabled crtcs
To: Hamza Mahfooz <hamza.mahfooz@amd.com>, amd-gfx@lists.freedesktop.org
References: <20230208200150.155684-1-hamza.mahfooz@amd.com>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20230208200150.155684-1-hamza.mahfooz@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT1PR01CA0130.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::9) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|PH7PR12MB6419:EE_
X-MS-Office365-Filtering-Correlation-Id: 65093a7e-60cc-48c8-fd44-08db0a113a8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GYeHb+qzPz5+6d7xOegjVGdl936+gTj0v6d4PxU7mu+2u7TYdGr/cHTH1oVLZq+AAEBBuFTMyFbkwND4S5hDqEdgYZOO409sB/KafXeIJQHf9vvxtUwGSIp+YYk3nawrSXlPfWCNrH/aITdw9nM4CgqyO9OtDZ1ZasXiyKFkFUeQ2WRv4JkmwL8zH4UrbLirudDUHXrr0U4WRdkAvVGE8D5sohK4yeRqCcZUL0ei79T2auqe0PA/wA22wJJBA4ypR6Cq78B4kzmX+CjNm84K3L+TXW13vGoZwAI52laeU+RDEH8QR+UgNjFLYRMUGhuYA271UdjOVbGqNfcOBNm4Y67vIQFNVEo7dGyN2Jd+TjwmtPbYRAGdrdjVsJ63NtOoLCT903vx05iFE9yY62ebaXUm1/qBjzK3zBT7SdslC0h08xeikdL1fFo3fkGUdXHsm8fQL4VLU787Xur2E6nF5V+IGopCWyYUA/2DfXXAeCLYCSS+1xFFbjG3yOZ+o55rfLqvwurghmE4WHaQkcuKq571drhLxltXyD5x6hU6BK98BrjcrqdkPnYMyQoLm0AYObx/PnIMQpK2Fe+mBBJIW3N3BJPVfVsaex8r4TlMKzjOgx/S+5smXqf3zmEaXgCW8aoCmYm+6yemcH1nu2PfwodasA0yL13oxT3TfgUgQPZO/h2/bu8WDNLd8JAIr64jWmMjvk1JoDZ49syFRVDZ1Q3az3zxm8/dyamx43JnyhEKLYtS5td0cHFSfV5B5oK0
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(366004)(396003)(136003)(39860400002)(376002)(451199018)(26005)(6512007)(186003)(38100700002)(31686004)(2906002)(316002)(53546011)(8936002)(5660300002)(6506007)(54906003)(31696002)(83380400001)(6666004)(2616005)(86362001)(66476007)(36756003)(478600001)(4326008)(6486002)(66946007)(44832011)(66556008)(8676002)(41300700001)(17423001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZGh1Ny9zUlAxejZna0RUUXNVcmtHaitCVXZKTklMbWptOWNveEY4b1RNN0VM?=
 =?utf-8?B?VHQ1VzRWd2xpeXh5ejllVnpMVkVKelpyTlVMcUVHTFNjaE80V05WSU5MbXp4?=
 =?utf-8?B?WDBlOWlpTGpxTTFaZ0JlME9HVXF0b3VJU0FYa1hGM3o2YlVrVGZJSkJ5ZkNX?=
 =?utf-8?B?bDI5YmIrL0x1UmFvdm9Bbml4SGI0aXk3V1dMVlYzdDNHa3V4RXRoOWFza2s2?=
 =?utf-8?B?OG1LcGFSYk9ab0xYTGh3eERwTWlzYjhYaytsV29yZVNsUTNLK3ROdWU3OWJx?=
 =?utf-8?B?b2poK1BySklSc2swTTZTaHdUVUpZemM0TXJVK1oySVB2WHkxdjZZZkRVTDNY?=
 =?utf-8?B?Z1dFZEE4bUpBbVJXdjlySDJLdjRDN29ROGk3cm9ibUE5allYZ2REUUdXZE5p?=
 =?utf-8?B?U1ltZHU1S00ybms4UDZBeVBMZ1RldndkSmZ1MUxaelhZclpQd2hSbnFWL3lh?=
 =?utf-8?B?TXNhaGlsalBGWGFXcjdGRTd3NTVHRUhpT3J6RzBxNDY0YUw2clM1cUZWcTFj?=
 =?utf-8?B?bmdUaW1GNzI1bmV4c3R1Yk9HQ3c0dkhEUDZ2Z0FSZWI0NEpwZlBDY3NVYWIv?=
 =?utf-8?B?bXFHY0p0MzBVeS9UWENhWmFoNmhBZUR2TTRYZFJUQjEzUTl3bzNVL1FCY1Fn?=
 =?utf-8?B?WHFhbGpFLytuZTZsSjl6MnFHZEJxU3lhc2s4NVhJWEMxaGpmYmZNUm8vL3lF?=
 =?utf-8?B?N2R1TmV6bHJZTUpvVFM0TEpWSUhYandVNmhlQUF3TVp2OUZ3ZVhsQi9aOEwx?=
 =?utf-8?B?MmJVVFRqSUw0THVoOW9tZ0RKYSt6TkRmc0ZXMERRdG16RC9wa3FORWdpc0tl?=
 =?utf-8?B?MzFDaHR4dTBrSlNaVGNKdmszZWRJdnc5ajIycm9YYWh1V2I1aXg1NnFDczRY?=
 =?utf-8?B?Tk10bFVVekQrZDF3d3pIdmxzR2pKeUtoNUxVMG8xRmhtMUludzZRbFN2VHg3?=
 =?utf-8?B?VzdiS0pPMjNUQlZjUTZRVHhKMzYxRTlHRE9QRVFvZUtSQ2RXNTJaTG1rL0kx?=
 =?utf-8?B?Ym0rcjlBcXZvd21pdWFSdS9TeFA1dkM4WldyQTM3cXNjM2JLUTZBODhIWkFs?=
 =?utf-8?B?MGs3NnBKUEFMdTRwM1pac0tQek5vSW9BM2lMYnNIaTJ6M0E3aW9QVktRZU9I?=
 =?utf-8?B?c3l3MnVNMmlBdlhNQmFIRlZNL09zMDJVNzBNby8vTWVxaUtDSk9yMi9EQzlt?=
 =?utf-8?B?Mk5hVW9Hb0R6eS9ZUytTWTRyV29xUERFZUpKSWhFLzFzNHFtWXpvL0lPQmUw?=
 =?utf-8?B?RnZFTTZoc254bStuTVJhL1B5djZTN21ZMmxLNHpSZ3pZRXhaUVhBZGpMZzhl?=
 =?utf-8?B?OVQ0OW03cE00dm5ENTRaN2FFWUo3dFdDS0ZmMlFKYlZBa2dxUWVVMGd2bE1w?=
 =?utf-8?B?Z2hScTJndzlBa24rQTIrcGU5dEJMQ1J0V2F4aFVZNDFFcGQzK2VWUDdqS1dN?=
 =?utf-8?B?R2tjclZ1d1VBbHczV3ppTFdnakhVZTd5MkR6cDJJWkxManA4WFliWEdGeDJm?=
 =?utf-8?B?Z21vQy9BdTJLU0tDakVNbTN6MUl2OTdqdnluM2Q5aU1mWWRIYjZwR2tNcHJh?=
 =?utf-8?B?bHFNTEkvZWw3NXp4SjJuUThJRDFQRTU1L2hLVE8vVks4QXoyVTRVNWxOWWgz?=
 =?utf-8?B?L1dHOXh1c2NiTnN6bmFwRmJsMVJuSVkyWHYxYUx4dkQwTzhrTWhpZGVYK1di?=
 =?utf-8?B?dnRkSENpRU0reWIxZ1VxN2JmUVZkdFJFenVFN2tJNTRXVWxvcGxWK2FWNjAy?=
 =?utf-8?B?NWVoZ0dhUmdGQXMyOHE3Sk5MR3VBbGpDRTZJZmhlMEhFaXRlRWpHenBueVpo?=
 =?utf-8?B?SnVTbXNoT3dMQ1ZQTmhNWE05K3IxYmlOSFNEUjNPOUpPbzdMRmE2WmFXOVla?=
 =?utf-8?B?bkFMTVdaeHFMSU1YRDVIYUI2OTE2R0lNRFhnOVhqdnpKRVc4ME9IdXRNZWhV?=
 =?utf-8?B?MEJQTVBtM2tJbnFtSmZnSjJqVGJsdzdHZjVISEp2aEZkc2pob09FNzdCTk50?=
 =?utf-8?B?OUR5UE9YOTE2RVFsbGhkc01lZjg3NmMwY1J0NnF2UStCZ1VNWEVkazI4YzdV?=
 =?utf-8?B?RFNHK2VxNFlPM29GMEQyY1l2bHoyNDdYeVRJRzZhMlVqOStxOFlEblZsWk9U?=
 =?utf-8?Q?ZeZycDZfPNrxI8jW1GOCJwu4X?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65093a7e-60cc-48c8-fd44-08db0a113a8c
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2023 20:15:31.8440 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s98JGYuYQ2K6xjckg5bycvulUgkXbn14mBKFFm2ScjI0GGnHAIai+tzjE/5LLLeFAIPjn+tO0hUAGi32ev3J/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6419
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
Cc: Alan Liu <HaoPing.Liu@amd.com>, Deepak R Varma <drv@mailo.com>,
 Leo Li <sunpeng.li@amd.com>, Tony Cheng <Tony.Cheng@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Nicholas Kazlauskas <Nicholas.Kazlauskas@amd.com>,
 Melissa Wen <mwen@igalia.com>, Alex Hung <alex.hung@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/8/23 15:01, Hamza Mahfooz wrote:
> As made mention of in commit 4ea7fc09539b ("drm/amd/display: Do not
> program interrupt status on disabled crtc"), we shouldn't program
> disabled crtcs. So, filter out disabled crtcs in dm_set_vupdate_irq()
> and dm_set_vblank().
> 
> Fixes: 589d2739332d ("drm/amd/display: Use crtc enable/disable_vblank hooks")
> Fixes: d2574c33bb71 ("drm/amd/display: In VRR mode, do DRM core vblank handling at end of vblank. (v2)")
> Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
> index 1e39d0939700..dc4f37240beb 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
> @@ -77,6 +77,9 @@ int dm_set_vupdate_irq(struct drm_crtc *crtc, bool enable)
>  	struct amdgpu_device *adev = drm_to_adev(crtc->dev);
>  	int rc;
>  
> +	if (acrtc->otg_inst == -1)
> +		return 0;
> +
>  	irq_source = IRQ_TYPE_VUPDATE + acrtc->otg_inst;
>  
>  	rc = dc_interrupt_set(adev->dm.dc, irq_source, enable) ? 0 : -EBUSY;
> @@ -151,6 +154,9 @@ static inline int dm_set_vblank(struct drm_crtc *crtc, bool enable)
>  	struct vblank_control_work *work;
>  	int rc = 0;
>  
> +	if (acrtc->otg_inst == -1)
> +		goto skip;
> +
>  	if (enable) {
>  		/* vblank irq on -> Only need vupdate irq in vrr mode */
>  		if (amdgpu_dm_vrr_active(acrtc_state))
> @@ -168,6 +174,7 @@ static inline int dm_set_vblank(struct drm_crtc *crtc, bool enable)
>  	if (!dc_interrupt_set(adev->dm.dc, irq_source, enable))
>  		return -EBUSY;
>  
> +skip:
>  	if (amdgpu_in_reset(adev))
>  		return 0;
>  

