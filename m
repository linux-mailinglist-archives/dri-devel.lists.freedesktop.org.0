Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A32993608
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2024 20:24:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CC2710E224;
	Mon,  7 Oct 2024 18:24:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="UGchAhCk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2077.outbound.protection.outlook.com [40.107.223.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74E0310E058
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2024 18:24:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PSpGvs4D/l9aQdInH246JtnaBbNBWiEh87RYEi9/fCCYbHP5xi0RnbHjWgZE5wVKhU9UTuRPXJKlaS7yjRDFsicd+xHEkNYbQDTylx/n0Q8bQHTHX3Okel/4aIpASBaZIMRqzhf+8f9tXfNXq2fcLK1HJ6XF+W4sNZ0Tv574Z4xEy5tPmf4G6VuX6XCI2Nflc1XExp75Id5YtwJftWwTgIghfiPRsyFzDbY3ucywRp91nfjtzL7KHpcvuyO9MjNxG62VbI85WyhvYMikzqdTAkqQDLE3IBryDFtaUDZHodwCtSg5yI432+ZMffepZHXtHIgj7G/FF0gMs5Y1qOk9tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nmP9NKIBMTKdPJIRfs9tAf9Y0SH+s9FhzH+COH0bS9k=;
 b=Kl51+m8IfWosGWCCWU1YVm+Id/3p7F7bwMhh/9U45BOfmdcxqw523txe/Fwjn2voQ5NrFMwLI9USOwyg4NXtwqeSX5Px2HpshohmzRtQySprInoYOa23ji1lJvmlMhsY7U/3Q9uDpyXY2gD8RgiKuQaO5U/aslaYDxl5THXQ6nKDoAoskjtWpgGXsTML/3Mbgn4jLduBwEe77dcICq0UkZdVdzVd0Nz6GJN99rkhnXu9ILFtRP77g5vt05GYNyAR2EKT7q5Dw5NGhzYMBJMf9YczLYTzkMizxKh3r+aW1fg1khZUdDLI4cQuEL4g1j5tCweII3a4GFNM4/kX2Bgq0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nmP9NKIBMTKdPJIRfs9tAf9Y0SH+s9FhzH+COH0bS9k=;
 b=UGchAhCkB0M40v2oPt8ka8OK8RFSwETJe3Le78wbGbUO2AgWt2eKreC/qrRREOc9/J6ByQqMVTVZMSymjY1GGQQHrbvd7Pbu5P2KL3Rzg6olDnvn+Ye7BtWQ+wrn0Dcwfa9XUwtP8rCnPr5kRtzltzt3yJ7jLOX2/qdIdDh7zYU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH7PR12MB5877.namprd12.prod.outlook.com (2603:10b6:510:1d5::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.23; Mon, 7 Oct
 2024 18:24:00 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%2]) with mapi id 15.20.8026.020; Mon, 7 Oct 2024
 18:24:00 +0000
Message-ID: <dcd15de0-f2d7-45e1-bac0-1d600173465f@amd.com>
Date: Mon, 7 Oct 2024 20:23:54 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: Patch "drm/sched: Always wake up correct scheduler in
 drm_sched_entity_push_job" has been added to the 6.10-stable tree
To: Greg KH <gregkh@linuxfoundation.org>
Cc: airlied@gmail.com, alexander.deucher@amd.com, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, ltuikov89@gmail.com,
 matthew.brost@intel.com, pstanner@redhat.com, tvrtko.ursulin@igalia.com,
 stable-commits@vger.kernel.org
References: <2024100752-shaking-sycamore-3cc4@gregkh>
 <8badb067-3cb3-431f-8081-be1bc0b9729b@amd.com>
 <2024100743-oozy-moving-59d4@gregkh>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <2024100743-oozy-moving-59d4@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0116.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::20) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH7PR12MB5877:EE_
X-MS-Office365-Filtering-Correlation-Id: 47ba7418-71b3-4583-2921-08dce6fd36f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UG9DcWQ4MVh4U21wa1BQK1JLUjJFL29VMTRwUFV5Ym52SnUvV2FTalBRd0lW?=
 =?utf-8?B?RzVNak53Y2d2SVRLSFVuSEFvNGk2TzBWV1VwNlk1M0p5OGFHNXFhaFlHNXJ2?=
 =?utf-8?B?a1d4djdFQyttL3IzeHhMWGNrT1lPT2xma08vME14Wk5nZW5wVG5SSHJrL0xV?=
 =?utf-8?B?WWJkNFZLTlZ6VXpzb21hbTYwaGNrMEorMVRqQW5KbUt4Z2o2VkdkcWFNNFpu?=
 =?utf-8?B?cC9FZ0ppZmEvaFlhQ1RJNmZ3bldzbjlZSG1EaHdwSDNjWlBQRHZGdFRJMks2?=
 =?utf-8?B?OVdqNkx1WmVwTEowUjNPbXNZdUl6cjB4ei9ZcStJNVpwdmRIUzg3U2hvMXpk?=
 =?utf-8?B?Ym1KbDZyOU9mWUdrMENIaXdabzhaaThlM3dtWXVpcHNtN2RvZzcrcUFKM1h6?=
 =?utf-8?B?QXRRYmVMWExVdzlyR2VpdWtybkYzZHdVUzhaUDZEMHY5aEh6cUxtUXJOOXFJ?=
 =?utf-8?B?L0ozM0hJTmZNSUNQN2J1R2JOM1FhbkhERERpV2lISEswSE9uUlgxTXVhR3BC?=
 =?utf-8?B?ZGdQNjRva3J2R2FwcmRXc1M1aWRmeUxBUHY3c0xFYncwc2wrbzRSV3NNeGlr?=
 =?utf-8?B?bnhQNlVpWVNWNlhGWHdudlV0MC8xc05xbm10WnhpRjNKY3pDN2lMSXNsbmtO?=
 =?utf-8?B?VlRCb1c3V05Qamg1eHFCWW9KcDNJN1hnTzJNdWQzYmN4Y0FncS9HbUFFTS9n?=
 =?utf-8?B?QUN4VjNHK2xvaCt0ekdhSndmTDM4RU15V3dzVTJ2c0ZlZGxnc0hpQmpSVjNq?=
 =?utf-8?B?bTFocHRqK2UxNy90dU5NaUFHQzV3d3BmOVJWcThhdHN2aDNwNFdFS1ZTd1NI?=
 =?utf-8?B?NzZ1WnRqRzhXd2VXeG5uNThuTENKQysxQnZ4cTZ1OVpRd1lld3pJZFNDdVVG?=
 =?utf-8?B?ZEFMallMSUZkNklSU3ZvNWpDM1FnRlNHMlBWV3h1M3dHWHJ1L2t6WCs2SUtW?=
 =?utf-8?B?NW5TZWwwVTZpQXk5Y2toUVFqc29lUFJMdUptUHZYRWZsTXpIVkEwenRFclpu?=
 =?utf-8?B?V2xIRm45MEIwd2JyOFVBL0FOdEtQRFhUc0pEUDlHKzBSN0djaHFSY2FFdk5W?=
 =?utf-8?B?Nm00RWNVSEl6b1Y5d0Nha1Uybkc1eG1XV0Y0Q0xXTlVNS3dCRVIydG8yUnNG?=
 =?utf-8?B?L3NJcTRJS2tIYVp4dlhVUktqRnFoeHI4RTJKQkduY2cvZnJTd0dUVGZBTFFU?=
 =?utf-8?B?alQxU0xaRzBuV2tJcmVsK0IrdXhGZmw2SDQ1TEZ4ZUhRY3Yzcjg4MXFwSzdk?=
 =?utf-8?B?MDdrUmhFQUFsRi9mUXJ5SnBSenNWcEptOUxBU01VUHRpU3oxUFZPSXVsbXVO?=
 =?utf-8?B?SlJwczBRNkpla3hKUGZhYnZrVlJMNFU5RkErLzJUekUrR1pzTTlUdjZZU1Bp?=
 =?utf-8?B?R0NkbDVxaXZwejBPeTBqU0Z4eGUyTXFlbUtyOWgvNjRubEVHbW5EWFc2cmtu?=
 =?utf-8?B?dzdHREs0ckFFVXRKWkZpSjZhUC9OUWlnRUZiMjJyb3krblFmNlg1UlEzUGNt?=
 =?utf-8?B?QUhDRVVRWldDeHo4Rlh1UFE1SDg4cUk2WTY1c2lWTEY4aHFmWTNBdWhINzZv?=
 =?utf-8?B?bVcyNkJUVFNpUDlqRTl4cDdOUXpQbC9obGVyNGg5L1ZDSDM5TWFTSS8ySnVI?=
 =?utf-8?Q?y7588ZnLyEKtqxujfL9YrdEUiWrIncHeSYRagOz3Dck0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bEoyOUx3VXhmbkZTWTIvVzhURGM3TkFrc0xMV25CS1duU2hYd2RBTVU4SE5F?=
 =?utf-8?B?b0s1UWc1NEJTZTJ5UHl1aEFVOEcwaXhKVFRDMTd6SUpqbjFYRzJObnZNRjNY?=
 =?utf-8?B?aVhUZzNRcDVFVlVTaUEyR1l4WU5laWJtdG1zZXpMSVJ1N01rQVdUUW56cWYw?=
 =?utf-8?B?VDBDUStNb0Z1SGtBNVBqY2VGRXc4bnpNRC9TV0dUZzBEZTBHNVY0Y1o0OVFt?=
 =?utf-8?B?TFN3ZFJVODZCZm5QQ1p5NFVYQTdOc2VvTXpSVVp5dDZ4Nm1GNXlkeTNjMWdq?=
 =?utf-8?B?TkpKVXdic3ZuSk1oNWlLL0ZjNDJIRVl6eTFYeHRWL0xsUHVPeDk3NlNyVlgx?=
 =?utf-8?B?WmlZOEwzMWRxQ00yTTFBK1hIUHVncG5wSWF4Y215NTV0UjRsT3FsUFBTdWtV?=
 =?utf-8?B?M2hpV0NCUCt1enU5a3BkOXU0dFBLVzVJUjl4ek5wQTRnbGJSVU5RS0h5Z2lw?=
 =?utf-8?B?aE1EeXNWYmtMU29Mdnd6QnZxSXFqYXVvM1NYVDZiRlVkK2FhNW1ON3FPeGdk?=
 =?utf-8?B?NTJqT0FFbWxhOUc3UG5rSmF0ZnFFMHZ4UnY3QVJVNjdNeVRRZDdCbHVUQU8v?=
 =?utf-8?B?bXdQL3FHOC9KTUY4L3o4eW1DbjNYd1BxNlFTYTIyeUV5RDhKai9PQTN1dk9Q?=
 =?utf-8?B?aWJkcXd1Z3c3ZkVWeXJtc2g4SjMrSXVrbWZSclIyVjA0N2xMbkwwTy9Bb0Fp?=
 =?utf-8?B?a3BKS3hSUWJSV0lhbWp3N3hidXhmS1VjQ0xRYTVFZi9kMGpRRWdlUkxmRUtn?=
 =?utf-8?B?MU0vSTRJZk82RjQ3S3JrVlVyZXBYRE40clQzMHkweEZ3Y0RhcFE3VXQ2K1ha?=
 =?utf-8?B?YTM1bzcwZWxGa3lGYVJKRmFSNVdNQ1dvRzR1emdyYmNNampXaFhIUmxWeDl4?=
 =?utf-8?B?MG9wYlhxajRQRklTQnlZQVpFc0d3cmFrWjBsY2pZaHlXZEFReEFTYXdyTkF0?=
 =?utf-8?B?ZmdaTzVTZDF5aWZxVnRkSDYvaHJtM3VnSXRCT2NINk5SRUt2VDhpcUJGR2wr?=
 =?utf-8?B?Q0RmYnVuWGJ2SnFlemk4bnJ4MGF1NFZ1empXeU0rM1A0amhRTlA5ME9QMmNs?=
 =?utf-8?B?d0FoVFFQVmhSdlZQWDcxWnVYZ0l2MGNrbE16TmRNUTMrRHBIVkJqOXFhRTlh?=
 =?utf-8?B?UDBEQUZTdTRvT2lJWGw4OXVEZnVVYkpQNEFCRDlzelA5QmxkM2VQZUM4TjBv?=
 =?utf-8?B?WTMvRGVsdjF2TzlPeXVDb3JtTGQ5dVNQaFBVR0hjcWVtMnByTk9HN3hDQldJ?=
 =?utf-8?B?bnZuMDZrZ3E1aDgzS3V4L1l0RE1nekxSb0U1Q3dUM2lmS0JoN1BOUVplVCtY?=
 =?utf-8?B?bGwvVFhTRjhBN00vNGhzM0xNQ3lmL3F2ZGh6K0pIUE1YUmtnR0NKVEdFQWp1?=
 =?utf-8?B?NkdVeWVIYXNIbEpMc05vKys2QXhwNVAyNElxVHZNQ3B2TDlNMTdlVjJrSGgw?=
 =?utf-8?B?bHdHTURMVFNydXNRY1NxNGJFRitmenhLZHdxVWs2ZGludUtHWU1Cb0ZWN015?=
 =?utf-8?B?VFZISTIxRWNHTG1HT2Q1OHRHQzYrVjV2R1IzNXBhUU45T3Vyc0JQa3FybHJz?=
 =?utf-8?B?czJranJFZFVtMUo3MThJcStla3dPcHJjTVp3R2U1eVR1bWRBMVR0RkVhN3o2?=
 =?utf-8?B?SDZUNGF1WG9CbjUrZnUwaVJ4anhiUHc5TWtvWnVOL3lwZ1F0OHFSSFM2OFYy?=
 =?utf-8?B?L3F3TmhwS0dRM0dkSGgyV2pHaDBsTlVOb3FyWDNEcGJaaEFrbytKVjI5Nlpl?=
 =?utf-8?B?eHlCa2p3MDFnL01uajBUYmhCSWZpODN4bkhCY2dydEZYUzRYMDQyV09jY2tZ?=
 =?utf-8?B?SXgxUE1UaTZkQSt0dzhpbm0xYUp1Kzg1N0svSDNEYWlUYTA3YkhJSjA1YXF5?=
 =?utf-8?B?REhXa2hmcDlLMjVxZm9OcjM5QTE1SW9LU2N1WVQvYXczQlFFeTVkSGVWVS9Y?=
 =?utf-8?B?dGxzUmZIMVdMQlRHT1hPVlJzUExpa1UxMFRzR2FSanI3dXBCdGZ1SUY3ckQx?=
 =?utf-8?B?THNFcEZEOHFRNjR5RGlMUERTRVdIMmx3Rkl2ZVFTZ09XMlF2alFCQ21uY1pj?=
 =?utf-8?B?UTdrWXQyaERwaUtkTUFZS25EUmJXdDlMNTYyY0pyY2t5OXRDd1VSUjVsbTZj?=
 =?utf-8?Q?G/BFv2BP571ADzrjuWZJfuDNR?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47ba7418-71b3-4583-2921-08dce6fd36f4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2024 18:24:00.5779 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YZ3QaD9U0dMVeLHAF5CROEfX1Ll3e+BaRMXxxrqc/5irB2CAWKGT8fiewWFswzhu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5877
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

Am 07.10.24 um 19:59 schrieb Greg KH:
> On Mon, Oct 07, 2024 at 07:53:26PM +0200, Christian König wrote:
>> Hi Greg,
>>
>> please drop this patch from all backports. It turned out to be broken and
>> the old handling has been restored by a revert.
>>
>> Sorry for the noise. The revert should show up in Linus tree by the end of
>> the week.
> What is the revert's git id?  I'd rather take that so we don't have any
> "why wasn't this patch applied" stuff later on.

Good point. I was also not 100% sure which ones of Tvrtko's patches we 
had to revert.

Here is the git Id from the drm-misc-fixes branch:

commit abf201f6ce14c4ceeccde5471bdf59614b83a3d8
Author: Christian König <christian.koenig@amd.com>
Date:   Mon Sep 30 15:07:49 2024 +0200

     drm/sched: revert "Always increment correct scheduler score"

     This reverts commit 087913e0ba2b3b9d7ccbafb2acf5dab9e35ae1d5.

     It turned out that the original code was correct since the rq can only
     change when there is no armed job for an entity.

     This change here broke the logic since we only incremented the counter
     for the first job, so revert it.

     Signed-off-by: Christian König <christian.koenig@amd.com>
     Acked-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
     Link: 
https://patchwork.freedesktop.org/patch/msgid/20240930131451.536150-1-christian.koenig@amd.com

Sorry for the noise, we should have catched that during the review and 
put the stable tag on the revert as well.

Regards,
Christian.

>
> thanks,
>
> greg k-h

