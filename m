Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EAE96EFBE4
	for <lists+dri-devel@lfdr.de>; Wed, 26 Apr 2023 22:49:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B74C10E105;
	Wed, 26 Apr 2023 20:49:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2058.outbound.protection.outlook.com [40.107.243.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE1E810E0F1;
 Wed, 26 Apr 2023 20:49:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iBupB4NCRII8yD7NW3ba61hr/TFbFd1Hy7LUq16PFkhsKS0WZVi5Q8BIHMhlncpxPhjDGdYDhhHngnldE1WWZB6w41FmaE9SvGQjjoq1CbAOH3QoSsAsyy/xwlbum+6a0GHO+2XO33gY7XNcFQ46/bQYfW8akkHWIgWz0YkouVGlVNOMF7GGUvSLJNyUaEZfmceLeRna9j7uJgBqlwrLM1ivJdYNnM0RQwH+eTOXmxaTvoBifwdz8ipZmuq9+5h1HTNBq5o8ifMery7D2oJABeinSMQ8Z9dL4r4zKGUSTmKG7II++0GdJIU3PSXpcgt/R76FfB+q7FKVHIrMWel82w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JtybJ2AMXkthBvlpzTRMWUEiYTyygiMVEQ4ejI3+sLc=;
 b=QnTlc4trwgMk7Quow72J63mFDeDD0xbmp0r7rgAllLCXFnu/h2DTohrbl4G+z1K0AROlK7n5MQPMYpthBLSxlvEzO/EgzQFTbvnGapPxmdPB1oQnxhrkQCIw9DEccZcTIIQRnOan2bJlboH6wfXN4/xzjEqqjloeuYf9t+e+J8MfbQkKK613KMwheeER95HmdgJGQLUxzaDdQ1XlgVly1T0et37P7/LdHTRmtAGInLyHnwUMXczNvwIPcFHre255v1B1AgEixBeah+pJa+FuyZA1Zvt/4GRV2SrkfFAI4PXHDF2tizstK91aqDu7bTAN+6LsHkyKTR4wRxueZTvoaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JtybJ2AMXkthBvlpzTRMWUEiYTyygiMVEQ4ejI3+sLc=;
 b=OdTGtSrhzVU1HjelNntDQchtM1WzyzzQ6U8eYTDMPdIZftcr0ovY9Q0fZpHvLbhxUE2pzb3SKyb8KVl4u0rn10KhKO9PizjMf9pa4dZLgD8PsIQWcAVr4FkIdGU18/n4qdyqQLC/+39wO3haBMbw5kvnv0vGlcZ7JwXBkyrLNwU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6280.namprd12.prod.outlook.com (2603:10b6:8:a2::11) by
 CH3PR12MB9023.namprd12.prod.outlook.com (2603:10b6:610:17b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.34; Wed, 26 Apr
 2023 20:49:20 +0000
Received: from DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::fe53:2742:10f9:b8f1]) by DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::fe53:2742:10f9:b8f1%9]) with mapi id 15.20.6340.021; Wed, 26 Apr 2023
 20:49:20 +0000
Message-ID: <f7c89749-3870-cd13-542e-5d33fd85ddcf@amd.com>
Date: Wed, 26 Apr 2023 16:50:44 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH] drm/amd/display: return status of
 dmub_srv_get_fw_boot_status
Content-Language: en-US
To: Tom Rix <trix@redhat.com>, harry.wentland@amd.com, sunpeng.li@amd.com,
 Rodrigo.Siqueira@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, Alvin.Lee2@amd.com, Jun.Lei@amd.com, qingqing.zhuo@amd.com,
 Max.Tseng@amd.com, Josip.Pavic@amd.com, Eric.Yang2@amd.com,
 aurabindo.pillai@amd.com
References: <20230420135901.3889747-1-trix@redhat.com>
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
In-Reply-To: <20230420135901.3889747-1-trix@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0128.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:5::31) To DM4PR12MB6280.namprd12.prod.outlook.com
 (2603:10b6:8:a2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6280:EE_|CH3PR12MB9023:EE_
X-MS-Office365-Filtering-Correlation-Id: d8c5ebe7-a350-400b-3e59-08db4697b4c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2V8WYXXMuS1IJ8axRGmSX3jhtnvVFXlNSyh9TNpdM4vTJS5eW8Ap0ClsmuyxCZ6s4eHbgTDuX6u2sDfEPLc8kdwN1+2gDb2W+57jMQoX8t16vNhK/62y8f0+p7aH0bVkumxtpEraBnHELOYf16djKofA6j2ck+raoHg8c5ua9kE+Vp+1woP9nDojCAbM6HPCZugak2G/jMGsw2euaEEhbb9MPSkqDUF6Jv9nsj/XZFWWvzdP9+cfkBXqbUt5CsdD8lc0xeLRQ3qCPGjB9awZ7Ik6guNk5XcG9jTOKzgwPUwUDOfD6OKgNdyajSXEKREhQcKWMZyb76hB63h+Hje5VmoQ7ocC4zE0UUMfVIW7FdSUgtZSZ2hjUvtSro9eA7JgI2f2DwG2m9iNKMf1bcmxrc8I4P9jUJftY9ZQZxYeiQlD05vu9FWSiqmlOuSa9mp15qH856eSHUfF7Jhkrxf2WJcU0eiiPKsJDKkv+gHN7hL7yCK+B5h1MP5F4UwfFLLfKDo37t1WDH6iU1JV//eGJExeQnnbjWhMh3dttCXVsHFp6qMYGp6TomgwwQDKFpEZvWL9c4OI2iSs9S8wFGtYl4LkzZuJaJwgjlmcqD03p7p7/OnCN8VBnnCDHbhcQeYOv5u+ISvUXPHZ0JzcSspkQ639R5yhTEk+brM8YyXBEiY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6280.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(366004)(39860400002)(376002)(346002)(396003)(451199021)(6636002)(31686004)(2616005)(921005)(66946007)(36756003)(44832011)(8676002)(316002)(8936002)(5660300002)(38100700002)(86362001)(2906002)(31696002)(41300700001)(66476007)(66556008)(83380400001)(4326008)(6486002)(6666004)(6512007)(26005)(6506007)(53546011)(186003)(478600001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZStwSWdtaEQwdmxGdTdqYS9rOHZLNVJkcnRibG1TaHIwa015S1pISkRwa2Jz?=
 =?utf-8?B?TExRb0h3ZytxdkE1WW83R2FFSE9JSVh2T3F4OVVDck9Ca29waU1hTXNWUjZ1?=
 =?utf-8?B?bWQxdXVaNGpYeVpiZkREWjRvd2JjZjBFRDFFdEZhSk5qNSt6TjhtbEZkS2tG?=
 =?utf-8?B?TGVsZ3RidDQ5UHdRWkFaMFliek9MRWl1SWZZZ2NRTjhCYnF1cWpwbnhyNHVP?=
 =?utf-8?B?bXQ5NkxHVzgwYTVGTTR0WHczdXliMDI5REhXQkNJaVRBR1BnVWk1UEJmUGQw?=
 =?utf-8?B?WFlETE5oVFNrTVdhUkMyOVN1SEgwWnpnaGNFTkg2QUlKU3hjTzBwdW1CamtR?=
 =?utf-8?B?VjZWRXNMZGFQZkgzWDRlcUlBTlhreEVhTi9nVVZrOXJjNThSZ20yZ2dPUEMy?=
 =?utf-8?B?cFZidW5wUW4vSmlNME1mMHJNeVdmeHByRHI1amR0Sm5qRW9uZkxzUTdBV3py?=
 =?utf-8?B?dGFPc0ZLcUpIWVVqMWJXeTBRU3JPOFoya2VTZTlIcHd3elBkN1JERUZtNjhv?=
 =?utf-8?B?SHppNlNUYW1ocDh0eE4rU2ZEdHFSUGNsbUc4aFAyTFdoeVNhSi9jWUZEWE4v?=
 =?utf-8?B?VDNuUVhaQWhjSWFsR0o2M3RJYjRnYkg5ZkFibG93a2RBWUlCcGg0SHBpUEk3?=
 =?utf-8?B?YXZjNkk3QjJiYWJsWElvSVg0b0R6YlBEWXV6dWNzTnRhOVBWQWFvVUlGYVpU?=
 =?utf-8?B?OGlXaVdxa3NTb0QzanFOelZZMEZIYjd6ZU9sZzIyWWRlWks1cldCK3NhUTBJ?=
 =?utf-8?B?alpOMjdEalR1OGI4S3hLYnEyQjl6SU9EVFZ4N3QrOVcvaC9KZkdxRllLbWNv?=
 =?utf-8?B?ZFJUTUhQUU1FVXJKcW1BTmJiMlUya0lUc0JLaVJhdkFjNHp5ekVGZzRVeEEy?=
 =?utf-8?B?andiNzF0KzM2N1VQZW5RTTUxQVNmb3hmSWx2Mk13ZkQ1eW40VC82Z0IwRnBR?=
 =?utf-8?B?YkxLWkNhM3NFY1V0UWdKSFc3NFpudTU0QTRYV2xkaFdYQTFYTGpJcDdsZHVD?=
 =?utf-8?B?UFViMGhNY1dZaE5uWERmNm1CR1paZ3QyMG9QOTJNUEFvN3lMRXFZeGlhNlNr?=
 =?utf-8?B?eWwrK0hqM0hTZ0NXUVVGNExkUkNzTWoyU1dvSy9zdWF0NzJWN3VvUVk0NWhZ?=
 =?utf-8?B?MTU3WlZaeE94TXJmYmlwWU1GNmlrQ1JmN0FjcExhVTdlckRHYlV0Q2hpaHVZ?=
 =?utf-8?B?ek9YQkNqTVBOSzVvU2RQMm5hVk1TbHNaSThBdXZrU3lXWW1KRFJPMVhpLzQ5?=
 =?utf-8?B?QWIrUGZMRm13RG9VTXF2NjExT3JrUmRkNjRFNWhIRk80cXRKMkxpMTdmQ0Zx?=
 =?utf-8?B?MW5kR3ZVMGtkM1pSbFZrMDBYeDdwUnFydDU2Y2I0OTB0M0hGcUpKYmdGQ1B4?=
 =?utf-8?B?SFJWK1hxTXdRenBRZ3Z0RjJPN203Tks0RS9JUFRiSXdvVjNZK1hCdC9EcGo3?=
 =?utf-8?B?ZFJhbFNiWDFNTEdncUxlL0g2M1RUdUZpdlAvUDNrQW9QSVhPMzB6MzcwTFlk?=
 =?utf-8?B?WndYeFFLUnZsNzB0YmpCQmh6d2tJOEdWbFVkbnZVZlpMeTZFd01zV3RYS252?=
 =?utf-8?B?bk1LVzRsSXRrOE9aNHRKUTVVYW8vV1JDendheWJMbHpsOGZoWkI3SHk3NUs3?=
 =?utf-8?B?azNTNXRxNDY1MTVyS0pBc2tPZ2hvbzdZYWhpalFnZzdObkg4L2tCYW1icWhI?=
 =?utf-8?B?MmllWks1V0tyN1Uvb044MzVsVXc4K3IxbWtJTTd3T2hLemFhM0FxdVFxYTkw?=
 =?utf-8?B?WnN0TW53SzBLYUQ2V0VLWUNQdFA3bUFLT0x3U2pEM21qZmpTYmhYdHBwalQ2?=
 =?utf-8?B?YUdMVUpxS3VFbW1UdVRLeitiZ1ZsdE13NHhwbElZMGpsUUlYWjF4RVFwR3Ro?=
 =?utf-8?B?UGlSUXRxMEtPbU5GSXg0MFM1QWFpbTlPVlRGMUhEQ1ZVZDBxK2RWZG50dDFU?=
 =?utf-8?B?TzlBUDNHMVhNUEtYVVR4YnJRb3R5dkRVTmxyTGNtMG92eGp0SUJzVXNaOGVj?=
 =?utf-8?B?dlRDTGoxTnZ1azRaeDR5T0ZsMThpK1htSjZvNC9LMU96YVpodVFNMzlmUjNU?=
 =?utf-8?B?OXVuTEVsZ2NsZVNnTVBwdUhHSzM0VHU2R01HTmZ1VEZNS0JEMzdBOU00dTMx?=
 =?utf-8?Q?gCU6yxJBo5Dy8IqytCG6+7hfs?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8c5ebe7-a350-400b-3e59-08db4697b4c3
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6280.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2023 20:49:20.0590 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H8Urg43IdrdGk6eYuYsPIURVIwNlrEIpXsp5Jt+Iusz14Y1CtnVfOvxNntPMCAR7+CahGTikmQsvLX/Kv/LQMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9023
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
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/20/23 09:59, Tom Rix wrote:
> gcc with W=1 reports
> drivers/gpu/drm/amd/amdgpu/../display/dc/dc_dmub_srv.c:
>    In function ‘dc_dmub_srv_optimized_init_done’:
> drivers/gpu/drm/amd/amdgpu/../display/dc/dc_dmub_srv.c:184:26:
>    error: variable ‘dmub’ set but not used [-Werror=unused-but-set-variable]
>    184 |         struct dmub_srv *dmub;
>        |                          ^~~~
> 
> The return status is never set.
> It looks like a call to dmub_srv_get_fw_boot_status is missing.
> 
> Fixes: 499e4b1c722e ("drm/amd/display: add mechanism to skip DCN init")
> Signed-off-by: Tom Rix <trix@redhat.com>

Applied, thanks!

> ---
>   drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c | 13 +++++++++++--
>   1 file changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c b/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c
> index d15ec32243e2..36d936ab4300 100644
> --- a/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c
> +++ b/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c
> @@ -182,14 +182,23 @@ bool dc_dmub_srv_cmd_run_list(struct dc_dmub_srv *dc_dmub_srv, unsigned int coun
>   bool dc_dmub_srv_optimized_init_done(struct dc_dmub_srv *dc_dmub_srv)
>   {
>   	struct dmub_srv *dmub;
> -	union dmub_fw_boot_status status;
> +	struct dc_context *dc_ctx;
> +	union dmub_fw_boot_status boot_status;
> +	enum dmub_status status;
>   
>   	if (!dc_dmub_srv || !dc_dmub_srv->dmub)
>   		return false;
>   
>   	dmub = dc_dmub_srv->dmub;
> +	dc_ctx = dc_dmub_srv->ctx;
> +
> +	status = dmub_srv_get_fw_boot_status(dmub, &boot_status);
> +	if (status != DMUB_STATUS_OK) {
> +		DC_ERROR("Error querying DMUB boot status: error=%d\n", status);
> +		return false;
> +	}
>   
> -	return status.bits.optimized_init_done;
> +	return boot_status.bits.optimized_init_done;
>   }
>   
>   bool dc_dmub_srv_notify_stream_mask(struct dc_dmub_srv *dc_dmub_srv,
-- 
Hamza

