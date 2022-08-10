Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1038758ED17
	for <lists+dri-devel@lfdr.de>; Wed, 10 Aug 2022 15:24:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C216B8FA0E;
	Wed, 10 Aug 2022 13:24:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2043.outbound.protection.outlook.com [40.107.93.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C22E810E465;
 Wed, 10 Aug 2022 13:23:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xhuf+PIDuqj+EB98ATeN19SUyDsoALrPUzMteItkt3QupX8U1lQpm0OlVIcPzI7fG5qutVIslYBsFu+AKaLIqNBhIoTwSQ/I4Wj026xiWcSgqKPzecJoniySTD2jGE4Mg6BUyan6gZI+cQR+hFULULzxeJZ6vZj6XZJJ94W+Hc8unYCZbDluoRzKO7uu6QqKpH7chXus5Yy6ZtuUh4KRhcYXR8Oy0TwkkvPRWhVZvuGeqfwDYitebh7lroQvTmJMaOwKdoU/KZllSL8mRZAWrJHGnXwFBAqAEkoQ/jysloCYCmQTIbqCbfiJ4rI4UTejGMPRgOgwMH1yRfAjYGmfKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vCWL1pBpQD3If8P/vGoHyCerMMA6vw6+LNehEp2o2vc=;
 b=R/hxj3k2cEvKBqeC5kaqHzvb99vVGSv4wf9iGHmYgEZ7Lj1KY/YZkur0bB8CIhTjN11do3qNLeT+0D2kQYGh2Ia13XXhYIFtrvAHm3gYK5UkFifODoEegjQOT/b67ruzGupGmRrVn+fDZo9FCjc304XAUnrI/Qsr3kwpvnZFmzw1qbtiRYYTOLHUIOiXAINxAN3k2y8T/n2Ymy7/TAVWPvzfQQpuFc3uCvLgR5KdbRy4b4EEOOwOeJSOs5kPQD2e7Hf8gjhynjqIKQp+wV+VA+wGzOMuSXCEo/r69EK0pplOrqtNNJtPkFB+XhMg6o3G3Be87INeFHxTl99Jd+cWBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vCWL1pBpQD3If8P/vGoHyCerMMA6vw6+LNehEp2o2vc=;
 b=KnkExeG+rHDY2mFgZSydh9naGnQ7Ljh/EmuqYd4ATQtG3A841MH+ah/vuGm573nJ2+RAJrMKJP7dVeRCY1rb946LQ11fqDcBvTGh+ituqnSdXkJlNVwJX06rAFnFnypO1cUvb+Wk1L6TZDgk0NCelQojTZBXbWLwxHn9ZzaS96U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6280.namprd12.prod.outlook.com (2603:10b6:8:a2::11) by
 MWHPR12MB1456.namprd12.prod.outlook.com (2603:10b6:301:f::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5504.14; Wed, 10 Aug 2022 13:23:44 +0000
Received: from DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::b44e:8a66:63eb:e8ee]) by DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::b44e:8a66:63eb:e8ee%8]) with mapi id 15.20.5525.010; Wed, 10 Aug 2022
 13:23:44 +0000
Message-ID: <a8de299f-0868-eef7-7bef-de8207900370@amd.com>
Date: Wed, 10 Aug 2022 09:23:50 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 1/3] drm/dp_mst: add passthrough_aux to struct
 drm_dp_mst_port
Content-Language: en-US
To: Lyude Paul <lyude@redhat.com>, linux-kernel@vger.kernel.org
References: <20220805211317.176672-1-hamza.mahfooz@amd.com>
 <8db8a726d1aac25b3590497db9cbdcc3fe161227.camel@redhat.com>
 <b6e10f4a-6834-fccb-0cba-0990dda37a76@amd.com>
 <3690a632acc9d5d83ae8a33dfc8b88db7fe8aebf.camel@redhat.com>
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
In-Reply-To: <3690a632acc9d5d83ae8a33dfc8b88db7fe8aebf.camel@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL0PR02CA0069.namprd02.prod.outlook.com
 (2603:10b6:207:3d::46) To DM4PR12MB6280.namprd12.prod.outlook.com
 (2603:10b6:8:a2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 972fac8b-2f9e-4539-cdaf-08da7ad38c7d
X-MS-TrafficTypeDiagnostic: MWHPR12MB1456:EE_
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8XbqviSOvE4kQK4IEVodciZLwMNSz+Gz4ajoNQ358qiYCYs82JKAl2+oj9pmlVLscRJFL7tN0HySChsLX3UN9pMS1GKdk3jjL0jCAA9xyIsKUB26o49Njbd53X1ipo5GYMCvDbDiGUAY3pKau/zBy1u0OYlPCz2n0Q2TgOQtDFwIxGGJhkhyNN+nXxup/SL7mIix3BSfhMxCPCrJJrBbfZK7z/BfufWbMtrn+Iz3jnkKgkGbduAgg7ynags05TOLBXM+OaMWKnGWgkJ1jAI2ymb5mcxq6SVxsUpoFEh4za1GftCdf0yU4NXfLM8O0JyAasD73fCUdrMh0T+TWVMZGUsiIbRClLp/WAk5CueXUdKnl3fX7HXIOl/z/E8j14/NWwFAcI6OLv1WDyWr0Qupl9eu0CfcWLmLJRCQApnlPmRrWzpu5At3R5pD4LkVMqDfn7az2SSXLG4ol3HbJsKzMV+zt8XXtY7qIDskQJfVORB6Ub8rX6N9P6oKY6YKJfN1x7dcw0YStSbvlc2ajr6yu10FZS0YPlbG0MAeHnN17o3fT+yTWEb8AmNR0e6+d77EwEoxHXnjBsRqhyYTG126moZTm+m5t9hzYXPLg5VsbWmHY3Kz+I9aUNJZKTl8fHh9aKDTP7/8oW0Ll9Q4/5VRQZN7+B0RxW1CMk7VAs+Y3LrwnMyAwfQyV+y8b6bdsJTjN5psjFGqsqbU3GYlFqRqEfiqDzKlmssi/znEMew6hxG7KIixEgImlSH0JajOAYsKofQiYGzEZONumkgB0Cj+NfqcWbYPqhSj0i9UwqiJrX4umqcDrqsBSoCOj5MN0uNs
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6280.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(39860400002)(136003)(396003)(346002)(376002)(66946007)(66476007)(66556008)(86362001)(186003)(31696002)(4326008)(8676002)(6512007)(53546011)(41300700001)(6666004)(26005)(8936002)(7416002)(6506007)(2906002)(5660300002)(478600001)(2616005)(38100700002)(6486002)(44832011)(316002)(36756003)(83380400001)(31686004)(54906003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SUdWRW91bFZPRnY0YmtPcHJ4SzdpTTRrQ3drY1hMYmIrTU9Gdlc5dzNhK253?=
 =?utf-8?B?YU4ra2hYUTVJaE1YOGpZTTlHUVFZNUJnRnR5UUdacDJybExkYzQ4TTJTWS8z?=
 =?utf-8?B?MUVaenRzZlVCV1lsMTZYV1UzVU5DR0RUWXhPd0tVMUlsUHZyOThYUnhtWC9r?=
 =?utf-8?B?Y2dIVVRRcDRqNy9lS0lCVHR5MHVTNGRMRkk4TTJUUFllSWwyQllVMlc5ZEs1?=
 =?utf-8?B?QjNsaVBIRFpLVFBlSThXNjNiMExIOVo1T0tSWHl6TDdJZkhYM3p4NktITHFk?=
 =?utf-8?B?aFhUQkMvQWUvdzk2VlpwdFYyQWR5Y1RJK1J3SGZJanhuK3NnVGlDdmtrN29v?=
 =?utf-8?B?aXpDSFJ3eE84Smd1dGM0bFhXclU3NjNzVGtvR08xOVY2U2p6OEFCbGU3M0Jx?=
 =?utf-8?B?NWtaYU9pdVg1UnF5dHJVRDdyYXRKdTE3S3RaM1pQc25aeUtGQUFRRFJVK0Z5?=
 =?utf-8?B?KzIySkRCVy9zY3dTVVJWQS9FNzMydVc4RWFOUkhtUktsTVdpdldEa1pHeklx?=
 =?utf-8?B?Qy9tSEtyV2ZhTnp4T1dOT1dYZFFoaXYvb3dMb21NTTZyc0phekd0dHpRZVJR?=
 =?utf-8?B?dVEyZitpQnFBUW9YcG04YWYrWm1OY0Jnb0hFQzNpek9GMlRxd3ZucTUzZVpU?=
 =?utf-8?B?bDJYRktjbHYzVkhvN0prVHJRQkZrNXdpVzhCdXc0cWFDWHIvRlQ1K3NSWlV0?=
 =?utf-8?B?OGI0UXdxUUtkZDlRT0Q1QlBwTnlKUlQyckp4RFVJQ0NzSXZvVk96TmRHZC9U?=
 =?utf-8?B?WGMxdWxLYXZSM1NkbGs5eU0xTi82OHljMHBZaGRuOFBXVEpyTTdCb1o0bklz?=
 =?utf-8?B?V2I5c1VoRC9ML01DOERKb200QitUcEJSMUNFS2Q4bkJaUFljMUxMZVUySVZT?=
 =?utf-8?B?c3RtZDVKTzM4RWhZSTRLWFRLQzhZYi9tekE2aHQzcjVlQXFUQTBjVXdJaU1W?=
 =?utf-8?B?NHZJMlVwTWxRSzRxbjR3TjE1Q1pncnNmMlRDeEoyOWVBWm90SUlsdk40Wmtt?=
 =?utf-8?B?dk52aGpxdTFneGlFSXU2NzFGeDNUNVhrOEtveTVvRUl5NW56N2xZNThFMGhy?=
 =?utf-8?B?RGM4L0tXZlZaZldHb0JuZTNPamRudnZKQThIV01SRG5vTER1ZnpKbmVmbEVn?=
 =?utf-8?B?dlF6eTZ2c21mWFBtOUhLOUd6cjg4Y25ZSU4rSk5SZ1VLOEEwUjBhY2lrMndi?=
 =?utf-8?B?aVZjT1ZwUSt2MEhCcm5MTmxhanRWaE9Fd2lGQjBtR0lRVTF0NWlPbGxCM0Vi?=
 =?utf-8?B?RjNyUllHaEdmSThsWFh0TEdwY1ByVHZ6Sk14YlpyUm5MQng2YTJGQjh6MkZ2?=
 =?utf-8?B?cHlWTEs4OXZxcEtuSk9FQkV6b21mVEFUcWgzd2NuOXpjUWE2TzVoVllRWG1M?=
 =?utf-8?B?QzYzcXFNdjJoSlRDUWtlcmpxMXdFMmtjUmdsTzBkNEY2azhCMnV2dUpEWUkv?=
 =?utf-8?B?VVFmL1pjR2lFQ242cXZsQmdKNkVsS3lLa2xHdTh0bDBNTHBJbkhXUERQQXJm?=
 =?utf-8?B?R1I4RUgyakN6RDQ3WmJIRFN5ZzQ3bnE5VVo4WHpZUHlRSXEwb28xUUE3S01P?=
 =?utf-8?B?dUVSYWc5YWgraEsrazBXK2tZYTBLQlcwVjZZWXMxcTJSajJFTnRKc0hmeHFi?=
 =?utf-8?B?Z1IyYVdUTkp3UlB2eHUva0xuY1lnVDZocWNPTGhLbldqUDY5dWxBRkFGS1N6?=
 =?utf-8?B?UmozOHU4TzJTQ0Z3UzZrUzVYcW5hYS9HdlUvSlZ2K2dRZHk0SHIwYldBQnhK?=
 =?utf-8?B?QmduOUt2elQ3d1lmNzdNZ0dKZ3BYNG5FeUlVbGxzbnFyWlEyNFpDeTROM0Rp?=
 =?utf-8?B?Q0JISVRiZ3lORjNqR1BCbXZzU1dmM0hmMFBwSkF3ZThzdVVYdDgzSzhYNlA2?=
 =?utf-8?B?cEx1RzMzRE5vZU05Qms3VG85THJKeDZzZHVLV3N2UHJaNzJzN3JJUll5WlRx?=
 =?utf-8?B?Tlc1M3ZPZ0xhMGZyVEQ0T0xNcHJFMUVaVGxXVGZzTkVFVkVoaVJRaS8zMXdo?=
 =?utf-8?B?NVZJQW5QNGMzOXp1WDZtdXIxNnVQRUxpQ2FBMTZhNzRRUEJ6TkxNd3dLdzlm?=
 =?utf-8?B?VGY0Rm05VUtGdXlsZWl6MTVNYnRFc1JUc2tNaFpuWmhGSmFPb1BRQWlwL2ZW?=
 =?utf-8?Q?SKOqOefeIDKdA0Xxc+1WvDl9e?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 972fac8b-2f9e-4539-cdaf-08da7ad38c7d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6280.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2022 13:23:44.2745 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YdDTMds7irrWKoWX/VqBu+W9Dfe+WZFY+D3VTlkEKQBVFg12oUKPmptbFcGpDO+l7vU/jSwch6rCLdpG8St+/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1456
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
Cc: Ian Chen <ian.chen@amd.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Imran Khan <imran.f.khan@oracle.com>,
 Kees Cook <keescook@chromium.org>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Javier Martinez Canillas <javierm@redhat.com>, amd-gfx@lists.freedesktop.org,
 Leo Li <sunpeng.li@amd.com>, Fangzhi Zuo <Jerry.Zuo@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Jani Nikula <jani.nikula@intel.com>, hersenxs.wu@amd.com,
 Mikita Lipski <mikita.lipski@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 David Zhang <dingchen.zhang@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Roman Li <Roman.Li@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Claudio Suarez <cssk@net-c.es>, Thomas Zimmermann <tzimmermann@suse.de>,
 Wayne Lin <Wayne.Lin@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Colin Ian King <colin.king@intel.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2022-08-09 18:01, Lyude Paul wrote:
> Ah yes of course! Probably should have asked when I gave the r-b :). Also,
> just so patchwork actually catches it I will say the magic incantation:
> 
> Reviewed-by: Lyude Paul <lyude@redhat.com>
> 
> Do we want to merge just this patch to drm-misc-next, or do you want to merge
> the whole series through there? If you'd rather just merge this through amd's
> branch I'm fine with that as well

In that case, it is preferable to have all of the patches in this series
to get merged through amd's branch.

> 
> On Tue, 2022-08-09 at 11:15 -0400, Hamza Mahfooz wrote:
>> Hey Lyude,
>>
>> On 2022-08-05 17:17, Lyude Paul wrote:
>>> lgtm!
>>>
>>
>> Any chance you can apply this to drm-misc-next?
>>
>>> Reviewed-by: Lyude Paul <lyude@redhat.com>
>>>
>>> On Fri, 2022-08-05 at 17:13 -0400, Hamza Mahfooz wrote:
>>>> Currently, there is no way to identify if DSC pass-through can be
>>>> enabled and what aux DSC pass-through requests ought to be sent to. So,
>>>> add a variable to struct drm_dp_mst_port that keeps track of the
>>>> aforementioned information.
>>>>
>>>> Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
>>>> ---
>>>> v2: define DP_DSC_PASSTHROUGH_IS_SUPPORTED
>>>> ---
>>>>    drivers/gpu/drm/display/drm_dp_mst_topology.c | 4 +++-
>>>>    include/drm/display/drm_dp.h                  | 1 +
>>>>    include/drm/display/drm_dp_mst_helper.h       | 3 +++
>>>>    3 files changed, 7 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
>>>> index 67b3b9697da7..71915afd9892 100644
>>>> --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
>>>> +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
>>>> @@ -5921,8 +5921,10 @@ struct drm_dp_aux *drm_dp_mst_dsc_aux_for_port(struct drm_dp_mst_port *port)
>>>>    		/* Enpoint decompression with DP-to-DP peer device */
>>>>    		if ((endpoint_dsc & DP_DSC_DECOMPRESSION_IS_SUPPORTED) &&
>>>>    		    (endpoint_fec & DP_FEC_CAPABLE) &&
>>>> -		    (upstream_dsc & 0x2) /* DSC passthrough */)
>>>> +		    (upstream_dsc & DP_DSC_PASSTHROUGH_IS_SUPPORTED)) {
>>>> +			port->passthrough_aux = &immediate_upstream_port->aux;
>>>>    			return &port->aux;
>>>> +		}
>>>>    
>>>>    		/* Virtual DPCD decompression with DP-to-DP peer device */
>>>>    		return &immediate_upstream_port->aux;
>>>> diff --git a/include/drm/display/drm_dp.h b/include/drm/display/drm_dp.h
>>>> index 9e3aff7e68bb..4d0abe4c7ea9 100644
>>>> --- a/include/drm/display/drm_dp.h
>>>> +++ b/include/drm/display/drm_dp.h
>>>> @@ -239,6 +239,7 @@
>>>>    
>>>>    #define DP_DSC_SUPPORT                      0x060   /* DP 1.4 */
>>>>    # define DP_DSC_DECOMPRESSION_IS_SUPPORTED  (1 << 0)
>>>> +# define DP_DSC_PASSTHROUGH_IS_SUPPORTED    (1 << 1)
>>>>    
>>>>    #define DP_DSC_REV                          0x061
>>>>    # define DP_DSC_MAJOR_MASK                  (0xf << 0)
>>>> diff --git a/include/drm/display/drm_dp_mst_helper.h b/include/drm/display/drm_dp_mst_helper.h
>>>> index 10adec068b7f..4a39c95f8afd 100644
>>>> --- a/include/drm/display/drm_dp_mst_helper.h
>>>> +++ b/include/drm/display/drm_dp_mst_helper.h
>>>> @@ -86,6 +86,8 @@ struct drm_dp_vcpi {
>>>>     * @next: link to next port on this branch device
>>>>     * @aux: i2c aux transport to talk to device connected to this port, protected
>>>>     * by &drm_dp_mst_topology_mgr.base.lock.
>>>> + * @passthrough_aux: parent aux to which DSC pass-through requests should be
>>>> + * sent, only set if DSC pass-through is possible.
>>>>     * @parent: branch device parent of this port
>>>>     * @vcpi: Virtual Channel Payload info for this port.
>>>>     * @connector: DRM connector this port is connected to. Protected by
>>>> @@ -140,6 +142,7 @@ struct drm_dp_mst_port {
>>>>    	 */
>>>>    	struct drm_dp_mst_branch *mstb;
>>>>    	struct drm_dp_aux aux; /* i2c bus for this port? */
>>>> +	struct drm_dp_aux *passthrough_aux;
>>>>    	struct drm_dp_mst_branch *parent;
>>>>    
>>>>    	struct drm_dp_vcpi vcpi;
>>>
>>
> 

-- 
Hamza

