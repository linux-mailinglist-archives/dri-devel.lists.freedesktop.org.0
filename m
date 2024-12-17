Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A7649F567A
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 19:48:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CF0110E64A;
	Tue, 17 Dec 2024 18:48:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="GnCP1XbK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20617.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2009::617])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADA9010E64A
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2024 18:48:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DUhvbvg/8cgeuTXmCocRXBIzK6M61cxPsSSK7ptxrhOY4FjnRwocCFmsqNEaP476VPCNxwQm03vSxEtT3/0tAM1Ycv2tkBbeNjmA2Gqfu9JNhAg331UPINNKz8X+B6UVoLbW3r6qJS0uhzu6gCYexCf38za2wp7WdAxjKDLP2AnjN3+vzzWYyU9LBHFfeFKtksDGoQBGDN+bTye6oqPEskE+ZjLMRuM0wVGFfEPcYTbjimfJE0zsZ5lmZR3WnNNW/4vAhU/L5gAqJt9SNKHSLx1r091tnzPtGt7WF7sI98QMp0TGbssR1lG0EeaB7/dXRyd5JP0eqSBHwZOYrw3Zng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sudc6LhThoU6IxxTP70DvcOf1tYvH5pFuKL+8yTT/uY=;
 b=SAeKOntdvlBcQqF5h1H+9UWG+2hEsUsIJh/qwG1K4efVGwEpsgZo6XyziderrYeo+FOaNYjpmBZn4vokGqavRZRiSFNUrnav8ModsuPoh/QQl5A0/NYf53qlZxkG0B/hE52hvwGcZDNbEAbDb2BSn3/0aw/kXbwfxasest9zI1DcOUrlbgykDwaGdqoP2MggZRPaO/HRAZw0B6AISbRRmF0/hA/9xlLFESWyzkRVBYfofG6B8eFL5aalYvvaBC69sPiwsvgqltAzBm8joFOJXLdoMb3teEqh6wVjA9iEdgt8GQcBw9vKwYLg9lyZ42kZWOhVsK+jCgs5ZYbMMWRJgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sudc6LhThoU6IxxTP70DvcOf1tYvH5pFuKL+8yTT/uY=;
 b=GnCP1XbKiKu7RuZ9nFmTGjSu7VEtdXV5+8BV/ITYitdrkVmeRhPyQTEGhAPoUPAAlmRu2QuytvlcBE+ZhB9x+cIeTvEsfTZ0Ghk5rHEAnmrxfY+sduIfLjWBPyen39QzwUWyHRthfx/8CODyWTk6jf7T3gXlwRHG4Wr5x5XqpyU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS7PR12MB6095.namprd12.prod.outlook.com (2603:10b6:8:9c::19) by
 IA0PR12MB8895.namprd12.prod.outlook.com (2603:10b6:208:491::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8251.22; Tue, 17 Dec 2024 18:48:07 +0000
Received: from DS7PR12MB6095.namprd12.prod.outlook.com
 ([fe80::c48a:6eaf:96b0:8405]) by DS7PR12MB6095.namprd12.prod.outlook.com
 ([fe80::c48a:6eaf:96b0:8405%5]) with mapi id 15.20.8272.005; Tue, 17 Dec 2024
 18:48:06 +0000
Message-ID: <a12e7728-82a0-462d-b564-58ce8ab4df08@amd.com>
Date: Tue, 17 Dec 2024 12:47:56 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1 2/2] accel/amdxdna: Remove DRM_AMDXDNA_HWCTX_CONFIG_NUM
To: Lizhi Hou <lizhi.hou@amd.com>, ogabbay@kernel.org,
 quic_jhugo@quicinc.com, dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, min.ma@amd.com, max.zhen@amd.com,
 sonal.santan@amd.com, king.tam@amd.com
References: <20241217165446.2607585-1-lizhi.hou@amd.com>
 <20241217165446.2607585-2-lizhi.hou@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20241217165446.2607585-2-lizhi.hou@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA1PR02CA0007.namprd02.prod.outlook.com
 (2603:10b6:806:2cf::18) To DS7PR12MB6095.namprd12.prod.outlook.com
 (2603:10b6:8:9c::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB6095:EE_|IA0PR12MB8895:EE_
X-MS-Office365-Filtering-Correlation-Id: 21462940-555c-44a8-be07-08dd1ecb57fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NTVQdjM5WjFzMmdqNXk0ZkV1WjNtSEYrZHJ2MkJudjNTTndzL0pHSG1CcnlM?=
 =?utf-8?B?dU01Z015clh6U0RpTWJiNDFRMHVMcjRKSVZ0MTV4VW5BZEtLMkFObWtVUkxM?=
 =?utf-8?B?WFJYUldNTHJUS1dzektQejNSTEVWWC8xR0JDeEdFdFJSa2xYMjlFUzZ1ZVJk?=
 =?utf-8?B?MWxtNUlMWWRHOUZzOG9sZG05WXFCVEZpUUI3Z21rVDJYOGJQM3FNMVBqMDFS?=
 =?utf-8?B?c1IrYVNlbDk0S2V6NGVsNmVtenptRTR6UHptb3BlUXVqZ3pIODNPazF5aUhQ?=
 =?utf-8?B?ZWFaRk1mZDcwVUNHUUNBRWVicWQ0NlRzbUZXaGo5TW52bjBuS2I0Q0NoUExG?=
 =?utf-8?B?OXFxVkdrbmVEWUJXeFo2T0ZFRVBwbFRiS1VVUGtkcEpWL0pIS1dyQWxFNWVV?=
 =?utf-8?B?YnNNZlh1aVBqNUdlbHR5bGp3MUxQZ3FKZ2lidzlNdEpiNnV6cDRRZGhnSlV5?=
 =?utf-8?B?VGk3VURodWd2Qy9BTnIvcEVKT0l2N1lFcFp5UEpRWk9mOXNocDFSQllVYXZQ?=
 =?utf-8?B?RzNObjFPK3poMGdXaWtwVEIzYzFSVnRYVFQxUnNYcXJYZDNNc3RCbkhmQjJP?=
 =?utf-8?B?ZnMvM29CanN4K2huVGZQRnhZbnQzZVRTNEQxcERNeEVJSnJ6aS9DZU1VNHFO?=
 =?utf-8?B?UWw5NEtpMFltd0tDcDZYaE16S3oxSnp1dzA0S2NNRWgzSXFDWm4zY01NMTVa?=
 =?utf-8?B?RFhIcnFObkhvYkd0ZVBKZExHVk01VzFRaDBwUnVDd3p2WXVkK3cxOXhyZG5t?=
 =?utf-8?B?NGFILzkreXRaNXV3V1hFcUtESVBOT1AwS1J4YXRYNVh1bU1QUEVDeThBVFJ4?=
 =?utf-8?B?TzM1NUJINnBTUTZuMUpqNE1vYjJIenJVa1k3N1YzZUpRMzhXeFdQQyt3VHQw?=
 =?utf-8?B?VGJPQmFGNGVTME5aMldTSU1RMnhja0k2ZzBZOU5aOEQyMGNyV2JaZkUxbmRS?=
 =?utf-8?B?bGE1N3VZd1NWbStKQUFncVVnMEhxWW5idDRhYnRhbFd3TjVQS245NVNGMDU4?=
 =?utf-8?B?bnFPVDhHVFFJQi83cXgveVJhYW9ITG8xN2R6S0FrY0g1SGQ3a0RPQlJGeTJm?=
 =?utf-8?B?dlJNYjlMdUxOK2h6QTRQK2lrbnlXWGxWemI5N1ZSc053ZDZtSFNkQ3I5ZGZB?=
 =?utf-8?B?c0lGeXN0QS95SjNrNDJYQ1p0dFRjOU9uMGYrdi9vU3FLbXVxdkZYY2JvSjd4?=
 =?utf-8?B?eldpMWpJV212U051TjJoOWZZRFRsMFVudk43bWVXYXExcEVibDEza3MwUDVa?=
 =?utf-8?B?dGV2TjdmeG90QVhycVlaMXh5dFRFK0VYTkwwcUUvbE1ka3pmZllBZjRDKzZY?=
 =?utf-8?B?Rlc4U3JUWVdnbGgxaDRmZUtsL0liTGtzMTNtUnZaeVozNVVFNmV1UmJnWkRa?=
 =?utf-8?B?YXBHWGU4UzR0c3pZUDk3MnBBQ0tuSmFFaVZiNEZKMEkyakY0VlpJUGlVQnpO?=
 =?utf-8?B?ekhFZWFOVi9FT3NGTE13Yzh1ZGpyRjVxQlB4b21wcUNDTzRRT081djBHVTRy?=
 =?utf-8?B?Rll6aVNadjVyMVAxNkxJdEpyem1WbUV6Yjlncmt4ZHBLLy9JMjZrNW4xd3M0?=
 =?utf-8?B?SjNhRE1UbitGUCtZR2QvK2p1UTUzOGtLNWtVZ0lQdEt6a0V5REJxS1hrQnZi?=
 =?utf-8?B?czhSTXEzdGROU2xHcklMak5wb1Jtelg3S0k0bHN6cWxyaXAyNDUzUkNLYlRO?=
 =?utf-8?B?UlQycEprQThxVFFoYlkwL0QrVU84RHdUR3owM3F6ZzNxZ2tFdzZZMW1qbmVE?=
 =?utf-8?B?ZmpONjQrSWRlMzFud3hQUTBqditLQjh6LzJEak9wTE14T2xOa0lGTDNvTHQy?=
 =?utf-8?B?ZDhvQlkxU1V0bkpxRlFiZkc3dlBxTkRKL2p6VU1JL2FDbktvZ2ljd1ArZUpM?=
 =?utf-8?Q?90uToPZUNIjDb?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR12MB6095.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SWNYNUhQalFxNXJsYzZIUkM1R1FVSmQ4QjZLd1hRWlh1L3p2dkJWS2IvOGhR?=
 =?utf-8?B?T2JTM1g4cXRSbnczd0pHYzBZQmZGR3JCaDNCRllGOFUyN3BrSUxreVVYbkRs?=
 =?utf-8?B?TkRBTlduTUVJN25EbXZ2T2o4SEYyWVF1enR0cE1kV0dkZXVxeFo1UTZNZlpy?=
 =?utf-8?B?VlBKSjV1MU1wQTJ1OHBzbmV0VkdMMzluU3hvYTAyNk9LUWxUSCtZWitWbzFP?=
 =?utf-8?B?UEVHVnUwN3FJa2F3U0l0R1hUSzNUeDltck1uWTZkVEp5d095QWFmbGZEQVlU?=
 =?utf-8?B?dXBiaGdYS05XUlJ6SXZINzJsN0FmUy9TOExtNVVIclVvaDVqZC9PbUE0UVFU?=
 =?utf-8?B?L2ZPckF4Um9Md29vZXJlZllsQW4vNWtERUNxM3NnOGZ0QjBzcmo4THNMSVVn?=
 =?utf-8?B?Z25wWVpDSW5EbjIwSDVxaXFZMzAxaTU3L0I5bDMxczFGWnVJMmlkTnVDT2tY?=
 =?utf-8?B?TW8xNStFR1dlK0JyY1lMeDI3Q3B1Ym0yZDJENy9mSjlSclpoc3BKdVpRTG1I?=
 =?utf-8?B?RHhGVzUwUHMwblRRYk1YODVqU3VwdmZoby9TQ1lzL0FJVGFhSGtoSXJNSlVv?=
 =?utf-8?B?WlYzdS9IV3J6NlVtTnZWZkJwODIrcHZQNksyemVybTFkTnZnZ05RVnpHcUZ6?=
 =?utf-8?B?aW4zck9VL0VoN0VlZUt4cUxUMTB3ZmFhUGZ1azkyTVd4dm5QVmp1R0NUVnhy?=
 =?utf-8?B?MDJjZEdLYU4wNUlEWEl3Zm95emFSZm9wY1NIaWJSbWIvK0ZpUjNSS2FteHR0?=
 =?utf-8?B?TVMyZHc1a2pkWFR1TWN0cmorbExSQVBpcGxqM29DU3luNTJFUnFVVVhHM2J5?=
 =?utf-8?B?K3NZbWllSTZkMldZZEczTXJzc3ZtakVTWlA5MVRhR1p3NEhiL2JFYlo3S0tv?=
 =?utf-8?B?OHZVWnpRMGZ2VFJwU0gzK25Cd05Nb25BVGxtdjJ2ZlZqS1lTbnY0ZUhNT1Vq?=
 =?utf-8?B?ZWNRMkc3NnlCU2xsZzE2RFFnOTVJeDFrUjRldlRsMHl5aXozUTZZamdwNWw5?=
 =?utf-8?B?aGQ4K2ZHUkoxeW01WDZtVitDTVMxakJ1WCtRdTQ5cnYvdFMxbHUvdGFlRUwv?=
 =?utf-8?B?cFBnTVdtTm1BL2RuNi9EMkFENzVWeFEvTStTUzNHOHFRSmNIdXdTMTc3OFlO?=
 =?utf-8?B?Z1FGK09UTkZjbGNKWWpVR2xoNG9xckdYN1JESGRNUlBmSHlyUDdLSzhwQWtT?=
 =?utf-8?B?a2cyK1FNSlRtVndlZVJ0Z0ZjWXhFekhVTk1XM2d3dDhuOHFPY21yK0hXRXZU?=
 =?utf-8?B?dXJOOXMyRU40Sk9iWEd5TFM5bmYyNDlrazk1WDBHbjlZQUsvMmdoTElxQ2Za?=
 =?utf-8?B?R1N0QWVyK09MdlZwUkh0YjZQVHlUN00wU1Q1MU54MjNvQ2x2bEYrZURacW9B?=
 =?utf-8?B?NUFtbUpxOUNoRlpYby80RzFkNFlTbFh6NWVHeWRkOHRHRzFkVW9sVUdYdXNk?=
 =?utf-8?B?WVhmeStIdVk4QkxZaElDT2RsY0dKaStScFB6VUE4Ymo1d0JjR212dXFrTzRL?=
 =?utf-8?B?aytsTmFTalk4Qmc2M3hoS3pMcFp4OEtiVE40azRrRVNyTUNERUlodERsN2pH?=
 =?utf-8?B?ZGhaYjUwWGNINUhaZFpqbERUYlIwRFVaVDdaOWFpQy9vUTJ5RTZ3Z2ZSbFkx?=
 =?utf-8?B?S3RCbk9BWHJkQ2U3dEZwOFBsdE9ZamZJUGRsOHpENHZodnlRYkxYdFZvL2Fi?=
 =?utf-8?B?Zk5RbURPS3IzaUJJN1dWS0NjbU15bnNsOU05M0pMaGVacmE2ZWsxQ1hwVk01?=
 =?utf-8?B?eTVDL1VVL0FGQlFneXVUOUQybTVUSjBMUmMxL3J5dG9ncDlVWE8zTldNSS81?=
 =?utf-8?B?UkxrNytRNUEzcWNiSzBZY2Q1QjlxeTN0azhTNVhFbWd4OFlpNlJFY2hOWitt?=
 =?utf-8?B?S2QzbC9IVmdFNzliWWttZ2pReFVNOStJcjVVOXJzNitscGtYUWpKVU41a0cz?=
 =?utf-8?B?a1VFZmN5REx4eGtVOHVSalVKZkEzekl3RkFSY0VUR3E0NTc1Smk4RlF6bjYx?=
 =?utf-8?B?UlZOYkFPZ2ZZYzRQQ0Y2QW8zeW9VRnJydm16c21NTGNnNXlWUy8ycE4rNkdZ?=
 =?utf-8?B?ZUJHNi9SekZwbi85aDM1VUxPcHJCcmNNTUVJVTQ2Qlg4L1ZmeHFCaDI4dWRD?=
 =?utf-8?Q?ImVheELHSWHmButZuwJYTA7Eo?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21462940-555c-44a8-be07-08dd1ecb57fd
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB6095.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2024 18:48:06.1594 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uVL1JMEXNNdAXdU+svN7dgPnd3bQND/4mdVX9v1wlCpdzwNmoPJ6bqk24QAQSDoucSa5Eq6RYEWrQYYQp/zT2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8895
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

On 12/17/2024 10:54, Lizhi Hou wrote:
> Defining a number of enum elements in uapi header is meaningless. It will
> not be used as expected and can potentially lead to incompatible issue
> between user space application and driver.
> 
> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
> ---
>   include/uapi/drm/amdxdna_accel.h | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/include/uapi/drm/amdxdna_accel.h b/include/uapi/drm/amdxdna_accel.h
> index 92eff83fac1f..a706ead39082 100644
> --- a/include/uapi/drm/amdxdna_accel.h
> +++ b/include/uapi/drm/amdxdna_accel.h
> @@ -122,7 +122,6 @@ enum amdxdna_drm_config_hwctx_param {
>   	DRM_AMDXDNA_HWCTX_CONFIG_CU,
>   	DRM_AMDXDNA_HWCTX_ASSIGN_DBG_BUF,
>   	DRM_AMDXDNA_HWCTX_REMOVE_DBG_BUF,
> -	DRM_AMDXDNA_HWCTX_CONFIG_NUM
>   };
>   
>   /**

I've applied both patches to drm-misc-next.  Thanks!

6a8d72b80807a accel/amdxdna: Remove DRM_AMDXDNA_HWCTX_CONFIG_NUM 
  

03c318a0af96f accel/amdxdna: Add zero check for pad in ioctl input 
structures 
  

