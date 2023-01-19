Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 602E4673D97
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 16:35:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A7A010E97E;
	Thu, 19 Jan 2023 15:35:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2060.outbound.protection.outlook.com [40.107.93.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2FD610E08A;
 Thu, 19 Jan 2023 15:35:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=llG0H+JjX4MdlJhw23KQ5FzHrMArgmNXbuJhMfFHAbiqGF9VtGJUyhEO9yoMwabbTK98rLqb31bmhSC0G8454/m02gxMwj8+4hNmyOSGQCpA94/aCIjebr9pj/OZDkr2t+l7W0QI6yc8M04w/H3P7qaordXZKrX36JQV2diBVh8PWZyrr9xjofszhYFmlntb6Zza1Ogdv4/792N8vEuHaSAeBhivmTWw+K4iHzYr5EsFQLfX9ERfaAhaIBBRixFS3w+fcmJnB6imYPS8g+O9g+ZjOgqCPfdMtprBMAyXjCnwlVe7uUQR3k2jHU6XhoxYWptkB1md5zLZCmCTqCgcCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uE5P/oH/crPe5G6rQ/T6cpMHuJytU9SbtlZPSgjEk+M=;
 b=OCWsZW823PGE8GrLDHQJEysye3U5056mtZK+Lg4YT+3BNl11dILEqPdl9/vPWPTwNiYYyM1cmj+oReIk/IVe97jms6tFIm9jfFTdzYwAZD7BLWicfM8xU5lAqB6Fr2m8PByVtqPZLTz2mhHubAF3CiYCea13nWstPCG12q8BHtECaGwBGF8Y+QBPeXD6CgjLbGNEi5S03qsceoFTFUMjoZRLjTvAhPYktILXEYU+OQPGSxkJIA6N/Nb55eIHRn0xFhtYVWoXDB8AK3ciGhd90u4lFLn33X8jlUjyUETxQ2AkSUjMgXXn99Lhh9wMRIPUord/6kNj4b8Qs+KmLs3gDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uE5P/oH/crPe5G6rQ/T6cpMHuJytU9SbtlZPSgjEk+M=;
 b=PaTnP04iBaNP2Zz/cUTa3zGleJ+yaQ0H7ky/WfocWUsbZlXJONJUB0x1Rdb2sS5zoNC8yM3wJvW6MhxL/PA7vVg+W1x/D2dWFXGUyEajSMNQaSBpvT+1AncaPX7lWOFAv3TgTwyQet/+/xNtx7zqeBdJ7kjqKzB9GXEpo1mXW8U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by DM8PR12MB5447.namprd12.prod.outlook.com (2603:10b6:8:36::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.24; Thu, 19 Jan 2023 15:35:05 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::152b:e615:3d60:2bf0]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::152b:e615:3d60:2bf0%5]) with mapi id 15.20.6002.025; Thu, 19 Jan 2023
 15:35:04 +0000
Message-ID: <12bb8690-19a9-dd36-fe05-901e5e889f30@amd.com>
Date: Thu, 19 Jan 2023 10:35:02 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCHv2 1/2] drm: Add SDP Error Detection Configuration Register
Content-Language: en-US
To: Arun R Murthy <arun.r.murthy@intel.com>, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, jani.nikula@intel.com
References: <20230113043653.795183-1-arun.r.murthy@intel.com>
 <20230119114707.1425501-1-arun.r.murthy@intel.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20230119114707.1425501-1-arun.r.murthy@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0059.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:111::9) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|DM8PR12MB5447:EE_
X-MS-Office365-Filtering-Correlation-Id: fe9c8db1-7b9b-4237-c541-08dafa32bca8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0VdCqk6Cm+Ww7qD0rLdPnt6BTuSiDBiuVJopkNfO+dgHP3Xlt7pe2cMQSbf0QL/uMgqko31oQEUEFaaX02xF2K/BYF6rh2j4YkAh9mlS0ydJtly5PRvzfNhNIjbdZw8F2P3vh+l0xtl3u9NYk6blQkz6OLBaxFnYUmermRy2W97faAX3Wl6yRzrKdFfs2kGecSGkTd26lQPs3VvhFt6DRoTdVM6OUuwmGtoqPTsEMkHCqbgGZkepdp0nzJ9o2Kfpult4qtXtfWo2Yrf9POEToDTo8eogAMalOnE0Q7Kpx7nIjyvN+OtXTj0XcAHQ1mfpo37T6LOXOEXMYH3U8pbbwexGuH0/VpAZrXI3DM0gEUGz4BiLJNKde8b8bpf2ALJJge8mpIMNwDVy98h4wQp0/HtLEv3NyugjCYhfL2VrWdXjc/f1jXNq9syvuqN+YCyAecPJM2ZLS27ivdKCnfxcvSZqOA9La8HWS1mYVnl1NuSIo1S0bUrnMt8q/Frggp7vlLYywgpHSI5jp2PzBcD2LlAWOzf1VoIBE3fbUZEQCZcQt4ElDOXY7gm54Q7Vpu3VcnBjp7WO7zk6N1k3yePBq6mj6DBmM58Wi7ve3MGBYslD1k3Lh68Ax0COg/yjJBLQzvSV8e62MT2vQih4knSPnQ+SUDbs+q+dhitSFILYfhQXoGFX+Oa4BMMt+i3N+DCz6oXy/99gHvi5IqonQBm9agxqpsGThacgwOtW1W+DLOY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(376002)(136003)(366004)(346002)(39860400002)(451199015)(31686004)(66946007)(44832011)(4744005)(66556008)(8936002)(2906002)(5660300002)(66476007)(31696002)(38100700002)(53546011)(316002)(6506007)(86362001)(6486002)(478600001)(36756003)(41300700001)(8676002)(186003)(6512007)(83380400001)(2616005)(26005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bzhQUUlRUDlpcXBHR085NGMwcExONk9hMzl0Zmw0aytXZG1mMUNXUCtUSHpP?=
 =?utf-8?B?UjUvaXhwSDJQTGU1dnZWbW1HMEVYWER2WnkvY0FLbDc5R3FRU1VoS0tzaUpy?=
 =?utf-8?B?L0FOaWFjelF3NE9MTFd6a2d5eTM2cUhLUnB5SjRoU0VwTmRhdjFKMzFnbEE0?=
 =?utf-8?B?M1phTStoSGJmeWU5cDlHSzQyenQvL1Q5bWVRWTBoZGQ1QzZQWkVCcEtxZjg3?=
 =?utf-8?B?amMvY0g2Z1JqbWIxcm9kdU5HMVdBSWVFTVlDVXlIZDd2Ny9Sd2VzSXJCNXQw?=
 =?utf-8?B?OVJ4cEYzbjFZMXN3UFdwbFhJcmgwVDcydStOMzEyUXlIeGZXVlpFeVNTV3cz?=
 =?utf-8?B?Vys2Y2ltUExvY2prcFlrUE5oSkNqOFEvMWJuL01rQnRmQ1ZKQkM3eW1tbks1?=
 =?utf-8?B?NURoTnZMRjJiMjF1NlJ3UGQ4TXJvK2wycXZydzA0Q3NLQi9uQXZJbmFWdGRs?=
 =?utf-8?B?dUc4V1l1c1FnK3pxQ0p2U3E1bzVJMnpDQU9oMHNIb3lmdW1hUHVncEl6clJv?=
 =?utf-8?B?dG8yOUhzMmk5WDlGNUcwRHYvUWZxUmloMlVnVEZITFNUQ09VT0NuK21SQWNu?=
 =?utf-8?B?ZUpicmlMeWtxK0pYbGNNc3ZZV2M0dXl4UEcxNEhyT2FvOHVrdTRMWmhwQkZy?=
 =?utf-8?B?enNUZ2FrWFFnRXZUWFZHaEcrYW9uWHVWTGlzcTJhTm53NXJTa2xUcllSa29s?=
 =?utf-8?B?dWF6dFVpZGVyUGpUN1ZZWjJINVhiVUlNb1BkeUN1Qm5ZdTlmOVVmcHZNRDNo?=
 =?utf-8?B?cWZsYjZKRDRabm05dmswb24yN3I5MWdvMjlaSHRiMnN2b0wrKys5YVVTK0J2?=
 =?utf-8?B?bTZ6bDhpYXpIRi9XVmRSVm1MSU5Yb2VFejREQXI5dkNTb1lGU3R6eGpLS3Zp?=
 =?utf-8?B?b0k3UGhZbjRvZU8xZGJkL09wUEhQMGlXWkFWSnJ3Zit6RmFWSTlmMERGV0J3?=
 =?utf-8?B?UlVJT2NzRExiei9XVFZ5MGczSVMyTXFVU2ZRL2lhU01kVTZidmx5WmJtMy9W?=
 =?utf-8?B?OWZYN1NxRlRlcHoxZEpjS1hhdFgraUZZQ1NsTHZZeHgweS8rajBEbzJYQ2p4?=
 =?utf-8?B?QjF4VGJsZnNtenhxempybkFLcE5RQ3FmZ1JWcXYxNzlDQ0k1Nmd5ak5TSXk4?=
 =?utf-8?B?UUhjdWZtdklGVXdFbjNkd09oRGhyQVp0aG5HbmJZTVM5dUV6c3dYdXF0UWFw?=
 =?utf-8?B?cFk3eUVCWlRWQ2JSRWRnbk9tcUNjRUdscDJGcHMycmRRcmx0T0RPem9RWmFG?=
 =?utf-8?B?ZG42WU84R3V0ZUFSdnlQcHRVZ0RucFp0N29QQVd1RDVuSE9HdmRKM29rTWxD?=
 =?utf-8?B?MFZINWtYVk9TV2x4U2RBb0lubnArdEl1SkxYQkdTYlhyRW5WTS9VU0l2Y1BL?=
 =?utf-8?B?bkRPVDVmYnNTaUpJVVZlWDVYTHZVeEh4QlRKR29maEpPL2lhMllVVFVPTURR?=
 =?utf-8?B?MUl5amZ0ZFh1UGpxMFUwQmRGSWFIQXREQkxrYURFWW5oRUZuUEdzWlZiQXBi?=
 =?utf-8?B?RmJaR05SNGtFME0ycWV4a081Y3Z1MHVZQnNFWE1kYTFGVUd6VmNzamFFcFpw?=
 =?utf-8?B?ckV3aEdJMm9tSkVERzFvTC9aTjNJbVBnR1VNdlY5bFBPcmFZTVFKb251SnEx?=
 =?utf-8?B?Q0swUk1SQnNBMlNqa1pMY1RSSjZNZ0ZLNFY5VVNKQ3RUeGUzWVIxUW5UaWFh?=
 =?utf-8?B?bmFFK1FXSUdQQmdvTk5HRk1mRm1PTFd6MTdQOXZJL3ppNkRpZFpUWWxPMlk3?=
 =?utf-8?B?OUxmM29YY0l0anN2MW1ZV2lIckYwYlFRL09NTllqd1JsK2tGTjk3SSs2OWZk?=
 =?utf-8?B?V0xDQlB1a3BjSTNBM3d1VkhTcUVJeWlUN0l5SndGcWZJRVVRZlkzcmwwYndl?=
 =?utf-8?B?QkswMW1qRFhudGc2MjJnWWZPSmtHbm9rQng3a1ZrR2FIVUNoVmp3dWhIcHpx?=
 =?utf-8?B?QWgyaUVqUzlaN3R2NlUzSHRzUnlvSWQ5YjBSczZ2SzBMTEoyZm9DSGVIUU1u?=
 =?utf-8?B?NUNMMThlSTNPTGJZeHRnc2traHM2WVpOQksrSk1IZlVRempBQXBoZVpSUk1Z?=
 =?utf-8?B?YTVPSUNZK1ptemNMMjNWY25FM0NNSjQyOC9aT2tyc2IvU3RFTE4rYjdZK1Qx?=
 =?utf-8?Q?WusOflIn594CIDp6dzlCBAg1n?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe9c8db1-7b9b-4237-c541-08dafa32bca8
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2023 15:35:04.8707 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dEHCDetItYr5PGyc8NMB986ZdJDauxSBn7qPC9ZcPRMgXomhZ9wwAwM+U06TGdrO5v1/Gl9/1EmiikZFJ7RwZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR12MB5447
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

On 1/19/23 06:47, Arun R Murthy wrote:
> DP2.0 E11 defines a new register to facilitate SDP error detection by a
> 128B/132B capable DPRX device.
> 
> v2: Update the macro name to reflect the DP spec(Harry)
> 
> Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> ---
>  include/drm/display/drm_dp.h | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/include/drm/display/drm_dp.h b/include/drm/display/drm_dp.h
> index 632376c291db..358db4a9f167 100644
> --- a/include/drm/display/drm_dp.h
> +++ b/include/drm/display/drm_dp.h
> @@ -692,6 +692,9 @@
>  # define DP_FEC_LANE_2_SELECT		    (2 << 4)
>  # define DP_FEC_LANE_3_SELECT		    (3 << 4)
>  
> +#define DP_SDP_ERROR_DETECTION_CONFIGURATION	0x121	/* DP 2.0 E11 */
> +#define DP_SDP_CRC16_128B132B_EN		BIT(0)
> +
>  #define DP_AUX_FRAME_SYNC_VALUE		    0x15c   /* eDP 1.4 */
>  # define DP_AUX_FRAME_SYNC_VALID	    (1 << 0)
>  

