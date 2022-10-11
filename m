Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF4DE5FB43F
	for <lists+dri-devel@lfdr.de>; Tue, 11 Oct 2022 16:08:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA27310E3FC;
	Tue, 11 Oct 2022 14:08:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2062.outbound.protection.outlook.com [40.107.92.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB3D810E826;
 Tue, 11 Oct 2022 14:07:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mu5AoU/WqOvjzkLK0gJlYzFtG2ui/G5rYfZOy06Elj6z6shngJLBp/9Z8BEDhrS/42gwvZi+hxL7EcG40nJKeMIiPYoKtn5ck9H2pk/xlmJE5xXHydBUoKWrBmGBwGtzq9SqwdYAogNgWexOBP3BYHIVhDsPo6yohIex8eWx9EDlyAFAC+vtaLqg99dzg2JKNDxw06O6sH78MXG4udvYWhm7oXF1wrmuBsq8s5XieGZbTB/xab3+7Jht8vBbDF+7+Fs8lffmNp8KxD3TlKNBd/Pyr8Dvgr7c9XaSciIfZND/NMAaWhmyRtFZmIoLrwzbhJ89GroNywH4F4X0dBDIPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=59lxDj0zsEwN/cOI7d4wIStCPgrrRM+B+eNmZ6snHxE=;
 b=ZbhethSxkvNCM8xYegb70J5ccpcsmHxzHalaxiXut4j4NvkETbQYMLOGwHGhYh5p0cfK8yk2y3cWqbHlbMtvMgSlBBFUd3kKMfPfqcd9WWADWWVnwDIHfT3i2mOiVvsE6BmXj+Ms73iKNvYazlsuAKUFXYz/WcrPwuJYJJf+SbsTTxwvJ+LW3VBAmhSZ2+UN1xIIRWCT2G9WBjFg3QgAwkiBzHpHa7LKGZLhXChSyNTKx6efi44qrNQ5tDP7kBGB2rasfgNx8JWAa3XUhXTZuUW4leLOqk0WFSLhWu8NR9ETMiv2z/yVPVSBFCcvtzslnNS+x8TMcbEF15mwlTORBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=59lxDj0zsEwN/cOI7d4wIStCPgrrRM+B+eNmZ6snHxE=;
 b=zj7Kw7e51xIvK6HubuTmemkzFBB4jwPmkP85/xdbonjdNKdzy354OG8Dwcgy22YiGoaS+0B90tSNYXDC00s7YS9kzk4wV4m4CX+BtT8VTNrnFsTzDcuDOzN7YhQjYeIRZU3O1i4GS/DbC6m+IkiFTcaM4BrLFf5Egn/4dKA9zPA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by BL1PR12MB5972.namprd12.prod.outlook.com (2603:10b6:208:39b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.36; Tue, 11 Oct
 2022 14:07:56 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::aef3:6aae:b904:e395]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::aef3:6aae:b904:e395%6]) with mapi id 15.20.5709.019; Tue, 11 Oct 2022
 14:07:56 +0000
Message-ID: <7724d8cc-54b9-1ef9-fe34-42fcbd9b93bf@amd.com>
Date: Tue, 11 Oct 2022 10:07:53 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH 03/15] drm/amd/display: stop using connector->override_edid
Content-Language: en-US
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
References: <cover.1665496046.git.jani.nikula@intel.com>
 <8620697ae6a13bb9202db9edbc26ff30d9f4e2e8.1665496046.git.jani.nikula@intel.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <8620697ae6a13bb9202db9edbc26ff30d9f4e2e8.1665496046.git.jani.nikula@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT1PR01CA0109.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2c::18) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|BL1PR12MB5972:EE_
X-MS-Office365-Filtering-Correlation-Id: e0f29413-8c00-4040-388b-08daab91fed9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Axf0HDFuh5f9VlX/6dXHHDMmwdEj1lZQFklLVJf0KNfKknzRw/QLO9M6a0e930dlIJO2ntOtZSk8HKDp65dbEcjKOQFcWJ1IHNPk5Nwej0lRXUn6MBdXO3hH+J6PaTfndc4q4xBGAkoXmvIL/7jwO8ABYcyKN7pIy0ms4WRhZYJLIijWNkdBqiOkHOtLLfMII3IfI937I4iDeNRxI4cb1UrHUNu5XHpsNmhysIZdWvcsD1pssfiFAw2xuIRjzsYOKs+ukFVsE62WBDMLbBAhcwJSu44X+CWisllepHzn2ddY4EJlRKHDyHee8zdyGQq95kZnzTmjZXrJgyGxJnxEOZ4jE/lHRkaeBU9v/DFToWVuKFMshFEt2q/MBqtXCP5Q2M4/l4vGpPdKNsCw7+l0UB72Cmri5oCRl7PflD1UxwnyJ6NSa6E2XX6upfzPoXLSZJsw64RFcaJEDWovHAoxe5UVTlKNYhlcq2UXkQ6oRb0iPi99NP4zhFiwu8ohhGbvvS3e05PWzlN02SkVNb3Hoj8YqJUfLw9xwk9FZXFNrH5ne1c/1SMEAWuyyyk1c0IokenqYPFhL7KI2H0wqXzqBhzrRB8yz0nbtFQgtAA/53wtV0x+bFWFa7Ymv3wJMOmisBLN88D4X4zmvEROs/C5HZnksIrH0Er1/nRhAv4SrCv9tUGD8rPukddaHY7DdJp0usqwOigC+SV+hekbDjC+yMBokxLM0Tcy2TzwR7cI0snzW6OnauGkf0yUpphr4IPLvjUWG5R4EdGMpSY9qO4jLBqjiVDYQpqLBOBqeigEGBw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(376002)(136003)(39860400002)(346002)(396003)(451199015)(66574015)(83380400001)(44832011)(2906002)(4001150100001)(31686004)(2616005)(8676002)(31696002)(478600001)(4326008)(6666004)(6506007)(53546011)(41300700001)(86362001)(66476007)(38100700002)(6486002)(36756003)(54906003)(5660300002)(186003)(66946007)(6512007)(316002)(66556008)(8936002)(26005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?clI0ZlFMNlJjZVQ0TE1GYkRtTFpLWlZZRTdjTWo3L2JiQ2RvREFiaXhkMEdr?=
 =?utf-8?B?aVZVdGJGTVR1M3BNc1JEYXl2dXRmUWtTVjd1MTZDOTVqa2dMcDRCN1ZFZzJz?=
 =?utf-8?B?NEJ6WE15c0RmQUZ6SHhyS1dWMmIvSnB0QnJGNnpzRU1manhaQ0ZVbEFzL2w1?=
 =?utf-8?B?OGQ2S1p2Zno1bVFJaVNtRzZKSjIvdzEzZG40aVpNSjBGdDRjNERwdXpoNkph?=
 =?utf-8?B?VWlMbWJVdkJ0c1pvUGVGell6Z0NKM0h1K2NFVGxQekRuWlBqOTZUMzR6dzNZ?=
 =?utf-8?B?cXF0b2FnODgwei9XZC9YaVhTc1ljWE03dnJpdmZzWTJwejlJOTczWUVZYnRi?=
 =?utf-8?B?bzJTQkhOVldSWXFCbUIxbXFxN2N3RlpNaHU3eVVwcjJaQkRLVlNUbW4wRkl4?=
 =?utf-8?B?MWlyUTNVNGMvakVIL1Q0Skltb1YvL3JsdzRvVG41OFBWa01CTTdPcnZaZmdF?=
 =?utf-8?B?dGw5YlViVUM2MDBqckVpd2F6Yyt1WXZ1TitnUldzS0JhTnFVaDdyUTJZdU5n?=
 =?utf-8?B?djJCV2owejBrRFI0RlU1UlMxci9ZakpSQzhWYlFkUUptc3U0cVd1eE1jTlp0?=
 =?utf-8?B?cmNpd1dVMjFhMG4xSFlmVVBPWVo4N3kxZmhmNFV1K0RlSUc2NVZQRmREWGRE?=
 =?utf-8?B?V2JmYTdCcktTbHRjWlN0WEJnQVR0V01OMWp4Y2p3UUhraStUT3hKckIrNnhw?=
 =?utf-8?B?QVZBTXZNS2VGdkQzTkVmM2Y1WVVWZUNwWXFJQ3NsK0JnNmhPRE1Tcmt6WWtQ?=
 =?utf-8?B?U3EvUVVNa0lBQzVWb0dqQTcxMXVCNDhUWU5JUkxZdE5Ma1hOaDFlWk5samJT?=
 =?utf-8?B?TGduamQvYU1lTDYxbkV3aVpHOGs3YUVyMHZRbm5OTUU3UFRyM21EajhhZXVP?=
 =?utf-8?B?dzUvdmwxNlNpRXpkTE5Ha0wyVjNOa1FRZXZ4V0IveXFueEY5Z0FFWElQdkt4?=
 =?utf-8?B?cFlQWnhCTG9uMzE1TGlpKzhwcGtaZnNIYmllUzlUV3lVcGIwMUVLUUJqbnNu?=
 =?utf-8?B?TGVxV3lRYU9jcC9uTnRnZ2tRQjBzemZWR0dSV0JvYUlzQTBXckhER3c1QnJt?=
 =?utf-8?B?SDBhRlJ5c2dQN2RqcnNpakdFUFhHUmduSGRtbTJTOGx6OVVFWEhpWlNqL2Rp?=
 =?utf-8?B?Ymk1K0s1aHFZYzUwb0k4ckdWekIybGNOTzJwUjJzdG9lb0FVcFNPVm9rNXVB?=
 =?utf-8?B?Ly9rV1dKM1kvTkNQWVJCdUdDbmFKVExXQWY2Tk8zODM1b2ZVZXV2dVhCM1JO?=
 =?utf-8?B?TWp4ekk0L2l6YVFnYUtVbUVnMXlvbjhhSDBwMW1yWXl2TzdpNjhpS1dyem5o?=
 =?utf-8?B?Y1ZJTUJoZG5oZFhCbUpXVXdFS0J5TVlKbHA0ZEtzeVZodXBoRktHbDhSQ2pr?=
 =?utf-8?B?VGZQazczZjh2dENVVVVNQTBVdzlXcVdza1luSlZ2TTM2c1h2cnc3Nm5SVXpV?=
 =?utf-8?B?WkMrZU1jSTdlTWlxc2IwVHJ2Ukh2Y2tISHlzSGc4Z2ZyeVhrSkliNStPVThN?=
 =?utf-8?B?NVcxTTNqaTRTRys3K2RoN3B6VnBwdUN2VWVrSGg1dlhrZVYyaFlJcFVBY2JX?=
 =?utf-8?B?U2RDbmx5ektMY2VNcHBiS25JYVNTdnFZcTlaSVlSSk5WOFNPaExRT25Lb05K?=
 =?utf-8?B?R2hMZ2h2bDFPLy9YdWx1a2tiNlg2bElrNVRJSkdwSVo5YWRaNmM3ay8xKzFn?=
 =?utf-8?B?YU1adFhKZk1iZG1Wd2FNdUdweEhwVFliekFtZTl3ZmN4S1pPQUdGUG1JWjM2?=
 =?utf-8?B?Y2cyM0hnNXUzNHlHZHNIMkRtNVQwRXFURURDemJqRXhlSVJiaTNGL09vZjhM?=
 =?utf-8?B?UWlkc2YyZms4Qk5yNGNJUUY1R0FpcEZMUmh4ZEM5ZUZUYVRpTmlCL1RSS1Vj?=
 =?utf-8?B?dXFia20rdGVqSUZGM0U3S01wQS90Z09qL2xJdXRsOFBIWkZFTnJqUStDZllW?=
 =?utf-8?B?VWVzWVd6QkxqcE9pSjloRFJPaWQ2eW95TENCL256dk5US2lqcjhkN25wV1VG?=
 =?utf-8?B?cUdFUEdaTzVkNVpuODMzVCtEWVNwV3B4cEhnTm85c25aRGlQd01GQy94UVVq?=
 =?utf-8?B?WEIrbk14VEhkSmpMV3gxM2FlMXlSZW1jU1BybUNKL2JQS3VaenJ4ZUFLd3lv?=
 =?utf-8?Q?+uONJ1JFD9tIgzhqNp0Yo0v0a?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0f29413-8c00-4040-388b-08daab91fed9
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2022 14:07:56.3102 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5HS+zenTk1bmnsGKx7JuKLuIeUYQNlYy4YvEu6HpWlL9bFHp4CGaXrrj8vFS7j5lY5HDKmuJtlHFNqIfNAZtFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5972
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
Cc: Alex Deucher <alexander.deucher@amd.com>, intel-gfx@lists.freedesktop.org,
 Xinhui Pan <Xinhui.Pan@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2022-10-11 09:49, Jani Nikula wrote:
> The connector->override_edid flag is strictly for EDID override debugfs
> management, and drivers have no business using it.
> 
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Xinhui Pan <Xinhui.Pan@amd.com>
> Cc: amd-gfx@lists.freedesktop.org
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> 
> ---
> 
> I really have no idea what the functional impact here is. I can only
> guess that the intention is to abuse ->override_edid to block EDID
> property updates. In any case, this use needs to go.
> 
> It also seems really curious we get here via connector .get_modes hook!
> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 4c73727e0b7d..d96877196a7f 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -6109,7 +6109,6 @@ static void create_eml_sink(struct amdgpu_dm_connector *aconnector)
>  				aconnector->base.name);
>  
>  		aconnector->base.force = DRM_FORCE_OFF;
> -		aconnector->base.override_edid = false;

I'm not even sure the DRM_FORCE_OFF business is right.

Either way, I don't think amdgpu should be messing with
override_edid, so this is
Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

>  		return;
>  	}
>  
> @@ -6144,8 +6143,6 @@ static void handle_edid_mgmt(struct amdgpu_dm_connector *aconnector)
>  		link->verified_link_cap.link_rate = LINK_RATE_HIGH2;
>  	}
>  
> -
> -	aconnector->base.override_edid = true;
>  	create_eml_sink(aconnector);
>  }
>  

