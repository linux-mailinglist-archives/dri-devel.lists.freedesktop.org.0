Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9788E977FC2
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2024 14:22:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D735710ED0E;
	Fri, 13 Sep 2024 12:22:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="kRIyGhxE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2043.outbound.protection.outlook.com [40.107.92.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E0B510ED0E
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 12:22:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QzGeCnB4KsceSD76xFod/6m4OI9jt9HshxW9COXMx7Kk0WOgqI0Q1BtTJ/FX4uBXsy6IwUqQl2zI2bAY0X2ZpxmE7gvJNmtFALUJ40nD0xXXlkd97mQiCPVzmX3gI7yhWZPK6d33lpbC5h7PINegy/MCPBFrRVsJZLJR2GyAt0mAMG1LGMh3lLrPyv9F85/VZr3nFdZsMTL8mjofB39hF/DpQpjTlQhIwDqxVbiBGOJWtMThMvzD2TZ/vXCren1b15T2L2JIjOECsr80UQI5KdCm2+JTj+EZr/VHmaWGJLKymDQrk5LORQObBWP9rG+aIBHMe2LFLnVYoNtCpJfeWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TFXggXFVbefCf4YAhQHVKw9F0tTpKftbLQ2vviNXyXE=;
 b=kXPWpComIJS4v9KYlKbu89mPpaSiSF4Doyqlp4ne005TAoJp+Dy5I6OHY0KYmZlqyLffeg+/UCU3SUm4fuz2VIq99jI55Ck7Na8swU5mg4egEcRoYbdmPB/f3kqcF38v8VCBR9F6H8WkCmeiZXzOrq7LbDro6L03I14DQwR0BC3VllNobiICNiZPef2Vbn1NCpcxq4CjQaYcdmeAWZVY022S6gc5eBunnaJLmNUZ4LKTRGOCv5nMhzX52X9KF6dxuKEK/9HHIhk8oyTA8TFc8Omvy5Sfe19lGlU+ZBBS85k+k44xyo5AadCWDoX47viHK5fjZaUQHtfBBDPLAEgTwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TFXggXFVbefCf4YAhQHVKw9F0tTpKftbLQ2vviNXyXE=;
 b=kRIyGhxECSZ/7mFESQm//jAuJowCn5hRuefntqpyy2Qq8T2GtaTzAeNgLfBraznoSEx8b8v90clW5YHW1wgH8vv1g4pbxZTdVh0m0uXDsIWpr2LUSIbX631W8IkCVPEEo6k4yQgsnoIwxHO3ESB9DQuRsdvBawFuYlV6KINMKdk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SN7PR12MB7956.namprd12.prod.outlook.com (2603:10b6:806:328::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.19; Fri, 13 Sep
 2024 12:21:52 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.7918.024; Fri, 13 Sep 2024
 12:21:52 +0000
Message-ID: <bed5f692-ad63-4d60-a1a1-7e0eab1b0915@amd.com>
Date: Fri, 13 Sep 2024 14:21:46 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm: add DRM_SET_NAME ioctl
To: Pierre-Eric Pelloux-Prayer <pierre-eric@damsy.net>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 dri-devel@lists.freedesktop.org, tursulin@igalia.com,
 simona.vetter@ffwll.ch, robdclark@gmail.com
References: <20240911145836.734080-1-pierre-eric.pelloux-prayer@amd.com>
 <83219d37-74c4-4a3e-bdca-59d81040dea3@igalia.com>
 <b9162c5d-b856-4450-91df-b3b8c25896e0@damsy.net>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <b9162c5d-b856-4450-91df-b3b8c25896e0@damsy.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0160.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b3::14) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SN7PR12MB7956:EE_
X-MS-Office365-Filtering-Correlation-Id: e9575f59-1023-4387-ee69-08dcd3eea5e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M3QvMDFYbWYxdVRpU0hVTEI0RUUvcFZsaTBFUmdvendXTGVoMVVUZ1ZEa2VY?=
 =?utf-8?B?eXIrekNRTkRYZ3Q3V2ZTRTkxRnRPSll2UWlvRGNCR2lqS3JmRUNRalBrcElo?=
 =?utf-8?B?WWx4QXhIcGZtdlZRYzByNzRLS1hPNUxEemIxbGtBOWYvaUkyaWlzbnRFNHlx?=
 =?utf-8?B?aEhJaTZyU29EWnpYTUNBMUcyT3VUUjRaOURGc1Y3UGJnbGVudFhIN0ZnKzUz?=
 =?utf-8?B?ME9MSXJYVXBwa2RzcGJFU0RIK0JPME9rMWNydFVzTFZBeFc3QVZFblI4M25x?=
 =?utf-8?B?ZkJmaDVwZjh5UDZWQWlvMXJtaXp2S08veFdhVGtvSTZCbkxXQi9WVGo2RGhM?=
 =?utf-8?B?aE92Q0F4WjlGdkdIVlBtN2pXdXIwdW1zRzBadUNsb0N4NzJ1OVpEVHZRTnhx?=
 =?utf-8?B?aXEzdThlb3MwMTRPWlVCS3RteVNOZXV1TmNPSk1SUWRvSDlJSHVPSHRzT3VC?=
 =?utf-8?B?bWdUQTZINnZXS2dEYi8rWFNwSUh6QTQvcTZ3aWdsKy9VN2ZidjBScndHdUs3?=
 =?utf-8?B?ZEFxWXp1c2lldTlmQ2JiR3BLRlpEVW1tWWdrY1Z1TDZCVXZ5UnRzQ1dIcWZD?=
 =?utf-8?B?Wm9UakZMR0FjaUo0dllmY3VpVDBoeDl5MERvM0xQeUNvSU1jUEF2V0k2Qm53?=
 =?utf-8?B?Mnl1dE5Va3NmQWF2Nk04eTRML2M1Rks4dUFwZWxPUUFuRVZjalExWDRHNUlB?=
 =?utf-8?B?ZzlUY2ZHMis5QnJGb1hqQURieTA5Zk5FbjlWU1ZySHJLbk5zS09OYWVVRHk5?=
 =?utf-8?B?akVGWHUzS2JoaS9SLzFNaUdHcFkxam5aQ1laQTk4UkRRNXJDbVg0cGdVaGw4?=
 =?utf-8?B?ajhMa095UElhdmViSnRIV1pSUjF1My9IaVFLMVFTQS9tNVdXQ0FJbGdtT2ZI?=
 =?utf-8?B?Q084NEpiYnFNMHU5K0RiUkcvQ3Y2bHpiQTh6aWFzcXZkaWlqU0piSTcydmE5?=
 =?utf-8?B?REQwMXBNbUR3MjhNU2tvem84T0ZnY1NiQ3RIckZlYURTQms1VUprK0lhMXNa?=
 =?utf-8?B?WnJETTZOZWREWmpOMXFPMzZjNnVVWG0xbmxkdzhURXNzUlZQbE5WWFJ2QTJk?=
 =?utf-8?B?ekZ1UGpQOFk1R1dNM1o5UVV5RFE3aW9NVXkzeG13S1lyTnkwK1V0SmhpeTFT?=
 =?utf-8?B?SC9TL0pyTUVYUDE2SnNDK043cllsQmZmdkhkaDZhV1gybzhuU3BucGtLZjln?=
 =?utf-8?B?VW16RzRnaW8rMVhMRURzY2FGNjFVYmNmYnhsZDFFZHRtRWxqTEhaVURqVDNw?=
 =?utf-8?B?NDJaMVN2ajA0SVlxWWVrMnA3WUpsR1J6TDg0cnZNc1Npc0EyL1J0TXUxMysx?=
 =?utf-8?B?WkhOaHA1dzVjWndzM3ZyZUF1TEoraGN0WThBUUMweFd5R25Gd0YraXVUVlRJ?=
 =?utf-8?B?bXd3dXdxWDluVktGamtaWnh1V2RNYTY3cFpCM2dmVVJBQTZYZEYrd1FGMjVr?=
 =?utf-8?B?UHV0U210dFV1M3hpbk9kcHJzUFQ2YUtlNlhQbGpZT2k0RWxCcGFDdVZGZWs3?=
 =?utf-8?B?alNvTktsM05MTnUwOTYvalU3TXBTZzJqclJoN2xjSmxrSThWdXI3Q0U2N0wy?=
 =?utf-8?B?eUtzc0NqYlZUL2pKNTFob0NLNVUzNXdabEMxQWNMLzc0d2I5WEluQkZad1po?=
 =?utf-8?B?d3pPenZSMUNtdEpJU2VhckhpY1dpZ0JPRzJ5c09valdCbVBqTUJaNTZydlJQ?=
 =?utf-8?B?ek5uWFo0dzBXNCtMdTVEb2FZczVBZGk2RDhNdDRPek1wRG5KWnVrc3pEdEpa?=
 =?utf-8?Q?HdR/Juuvv9CNl78TpE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bTlUV1ZxbjV2SUU0Lzg2UzM5RzRmVlFhdGVwSldndlFtS0h1TFNUaXZiYXIv?=
 =?utf-8?B?MHNuYmZhTFplNTU2RitzNFFQSGZoRGZOdzdpWmZUSE9Gd3VhTnk1cXdRSFBW?=
 =?utf-8?B?bHR3Nzd4eVhIY1hEREF1eHBUZTQ1djRiQitDa1VNNUh0THQxZHVDZndtSzl6?=
 =?utf-8?B?ZjJLbzlqeFhod1VrS0F2S3pHV3JqVXdYYlJ2ci8yQXpwSTNyK0hjZTQ4elpl?=
 =?utf-8?B?NXhLekRCL0JvUDNGUlNxcWxwdWUxRW5jQWhjL3Z4cjIrY09CRlFTRjhxNVh6?=
 =?utf-8?B?WnFXT1VBNTU4eXJKeFNPbVNESzNibDFMUnoxZ05UTWJxaUpMaUpIejN0N09W?=
 =?utf-8?B?ZWFFZTV5Z1RDYzA1anhxSERLTnQ3dGl5RnF3MlB0WURleGVTejduQjV1ZlVS?=
 =?utf-8?B?bVVmdmxvR0plU2lrZlFEWk11dXpPVVY2OCt3cUFldElweFdTV05aK3JGQm93?=
 =?utf-8?B?OG40cGhHWE5GdTdoblVSRUZKTG9wZmthNUxNZjhCZEJPL1BSMGczQjJzaGVY?=
 =?utf-8?B?bEZzaTNyVHk1MTFwYVA0ck9aYXVXUEJpVXduanFiZE42TEJlYkF5UE15VURm?=
 =?utf-8?B?ZXdxQ2c1b3RjSmg0eW1RWWNsWXNtT1hyMHJuaENmRkQwUC9IMitMc3ZtWEtZ?=
 =?utf-8?B?QlRTd2s1cFFLUUlDSWZkUmhnWjkxOEJOYzlYNnc5WUJ0eS9ieTBQTGxodnlq?=
 =?utf-8?B?MHhTaGdVWDFTSTZ1Q0syQlNVMUF6b0NrVVYyRkNMMDQraVh0SVlZUkdWSit4?=
 =?utf-8?B?QVE4RE1FVTBjR3pXOUNGamdnV1ZSVWZjNXhEODVXSlRKa0xVZVZKR1BvQWdV?=
 =?utf-8?B?TVhidGlxQVJoT0Vsb0k0TC8zWnRaNzg5eENMdm9TMmJLTThPUHlCS0xkbVA5?=
 =?utf-8?B?RjRxMWpnaFZCMmY3d29YNjErN2tqNTNaN0U5cmw4U0xZWGNJY0l4aVFSekdm?=
 =?utf-8?B?cERvWlQ1aVdjNVpDV1NLaWV5SWp6dkcwYUFycFU3M2UxQldzQ2ZoRy9MRnlp?=
 =?utf-8?B?MFdHa2JKRGt3bnROM1dTNnJLd3M4dHZ5RUcwbWZVUHRSbi9POVVOanlSek43?=
 =?utf-8?B?T0ptQjBoMWN1MW4wUEp3UEtvVGREZ2pOR1dOdEI1ek05aXl0SENJMmRzRFpE?=
 =?utf-8?B?VmN4Vkk1UmdRcWM0Y0JMcUhlck9jYlM0TGVxSUpLTjNWZFFGMVVpeUE1ZnR2?=
 =?utf-8?B?U3VjeVlibjhmUXVzdzlWaUF4d3QxSnpTbnRITmhxRjRxK2F3YVFuVVEwNWQ3?=
 =?utf-8?B?UDcxVDROMEtQWFowV2xlRVBEUGtSR1Z5UnYwY296cHBxZFpneUtjN3FOejFq?=
 =?utf-8?B?UldwaVFRMm9tb3BzVWFwbGlUZE16a3BKOFhycjg1UGR4aEt3RFQvc3M5OUIr?=
 =?utf-8?B?dTlCVmxhMzZiOC9XUUlvN0sxbDR3TTF2eXI3WWE3dXZmamQ3NDgrZWhJamxl?=
 =?utf-8?B?TkxzeGdGRzN4YXBua3lMOVQ5N08yQTdOSVVnWlk1V1h5NkZDUVVNQjUrZ1M1?=
 =?utf-8?B?d0tBTFV0QjVzWlRoUE1QREUzWnozOUNubHlSOVpRZkR0Q2MrVGFRWDJRUmtB?=
 =?utf-8?B?bE1HTUFuZ0hMWEJVbGl4RExNUWtQMWx5M1RaWjd4V3lOR0t2bXFJbjBwTXB0?=
 =?utf-8?B?Y21lbTBrNGxacUVMRjlZdEo1NmF0bHlSSUFjV0R5K2U0ZGxTaWplZjdySjNr?=
 =?utf-8?B?TkFKOGNiZlFaMUVOSFc5TDluK0xGOXdROFNIU2xLamFVQ3hiSnlNa2lweFJn?=
 =?utf-8?B?aWQxeGUzdTdmWDRpSGJ0RStVcS92dkg3TzdzOW5XTS8zK1hLSkVxQjIxNlRu?=
 =?utf-8?B?YlhiZU5Yc0FFdHR5akpud2xuTWhzZE1xTEN4RVpwc1Y5bWJEaWFjK0ZwWkR4?=
 =?utf-8?B?aVY2UzV4VmRySEZNaUJuWjJHenhKekF5VTYveG0xQUk4TlBkQmw1UmNyYTdX?=
 =?utf-8?B?bVh6UW8zWGk4bW9ISnZEeHlyV3B2bTY0dVJpbGFtUFh2aXZHZjgwOGhoSURn?=
 =?utf-8?B?bDY1aStHVFRIYjgrcjB4ZlI5Vm5HNHhoQmQxQlAzZU5jdXJtUkU5TE5pc29B?=
 =?utf-8?B?WkYvUjd3d2k3SXZWZmJONVJENDZGcndENXdIaG4yeG5xbThSbGRDazltNi9p?=
 =?utf-8?Q?/RxU=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9575f59-1023-4387-ee69-08dcd3eea5e5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2024 12:21:52.1638 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cP5mGB+gXYoZj/R95Z2ecQMnTOZK55953Au3B5lAFTsJ18CPZUnPQneEPB1jMIVa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7956
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

Am 13.09.24 um 14:17 schrieb Pierre-Eric Pelloux-Prayer:
> Hi Tvrtko,
>
> Le 12/09/2024 à 10:13, Tvrtko Ursulin a écrit :
>>
>> On 11/09/2024 15:58, Pierre-Eric Pelloux-Prayer wrote:
>>> Giving the opportunity to userspace to associate a free-form
>>> name with a drm_file struct is helpful for tracking and debugging.
>>>
>>> This is similar to the existing DMA_BUF_SET_NAME ioctl.
>>>
>>> Access to name is protected by a mutex, and the 'clients' debugfs
>>> file has been updated to print it.
>>>
>>> Userspace MR to use this ioctl:
>>> https://gitlab.freedesktop.org/virgl/virglrenderer/-/merge_requests/1428 
>>>
>>
>> Idea seems useful to me. Various classes of comments/questions below:
>>
>>> Signed-off-by: Pierre-Eric Pelloux-Prayer 
>>> <pierre-eric.pelloux-prayer@amd.com>
>>> ---
>>>   drivers/gpu/drm/drm_debugfs.c | 12 ++++++++----
>>>   drivers/gpu/drm/drm_file.c    |  5 +++++
>>>   drivers/gpu/drm/drm_ioctl.c   | 28 ++++++++++++++++++++++++++++
>>>   include/drm/drm_file.h        |  9 +++++++++
>>>   include/uapi/drm/drm.h        | 14 ++++++++++++++
>>>   5 files changed, 64 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/drm_debugfs.c 
>>> b/drivers/gpu/drm/drm_debugfs.c
>>> index 6b239a24f1df..b7492225ae88 100644
>>> --- a/drivers/gpu/drm/drm_debugfs.c
>>> +++ b/drivers/gpu/drm/drm_debugfs.c
>>> @@ -78,12 +78,13 @@ static int drm_clients_info(struct seq_file *m, 
>>> void *data)
>>>       kuid_t uid;
>>>       seq_printf(m,
>>> -           "%20s %5s %3s master a %5s %10s\n",
>>> +           "%20s %5s %3s master a %5s %10s %20s\n",
>>>              "command",
>>>              "tgid",
>>>              "dev",
>>>              "uid",
>>> -           "magic");
>>> +           "magic",
>>> +           "name");
>>>       /* dev->filelist is sorted youngest first, but we want to present
>>>        * oldest first (i.e. kernel, servers, clients), so walk 
>>> backwardss.
>>> @@ -94,19 +95,22 @@ static int drm_clients_info(struct seq_file *m, 
>>> void *data)
>>>           struct task_struct *task;
>>>           struct pid *pid;
>>> +        mutex_lock(&priv->name_lock);
>>>           rcu_read_lock(); /* Locks priv->pid and pid_task()->comm! */
>>>           pid = rcu_dereference(priv->pid);
>>>           task = pid_task(pid, PIDTYPE_TGID);
>>>           uid = task ? __task_cred(task)->euid : GLOBAL_ROOT_UID;
>>> -        seq_printf(m, "%20s %5d %3d   %c    %c %5d %10u\n",
>>> +        seq_printf(m, "%20s %5d %3d   %c    %c %5d %10u %20s\n",
>>>                  task ? task->comm : "<unknown>",
>>>                  pid_vnr(pid),
>>>                  priv->minor->index,
>>>                  is_current_master ? 'y' : 'n',
>>>                  priv->authenticated ? 'y' : 'n',
>>>                  from_kuid_munged(seq_user_ns(m), uid),
>>> -               priv->magic);
>>> +               priv->magic,
>>> +               priv->name ? priv->name : "");
>>>           rcu_read_unlock();
>>> +        mutex_unlock(&priv->name_lock);
>>
>> FWIW it is possible you could get away without the need for a lock on 
>> the read side if you make the pointer RCU managed and stick a 
>> synchronize_rcu before kfree in the ioctl update path.
>>
>> Not because this lock would be a contentended one per se, but mostly 
>> to avoid complications such as amdgpu_debugfs_gem_info_show() where 
>> 3/3 has it broken - cannot take the mutex in rcu locked section. Just 
>> something to consider in case it would end up simpler code.
>
> I don't mind using RCU or a mutex. Christian suggested a mutex, so I 
> used that, but I'm happy to switch if the RCU approach is preferred.

RCU on a pure string is easier said than done. So I strongly suggest to 
stick with a mutex for now.

It's not that contention is performance critical here.

Regards,
Christian.

>
>
>>
>>>       }
>>>       mutex_unlock(&dev->filelist_mutex);
>>>       return 0;
>>> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
>>> index 01fde94fe2a9..558151c3912e 100644
>>> --- a/drivers/gpu/drm/drm_file.c
>>> +++ b/drivers/gpu/drm/drm_file.c
>>> @@ -158,6 +158,7 @@ struct drm_file *drm_file_alloc(struct drm_minor 
>>> *minor)
>>>       spin_lock_init(&file->master_lookup_lock);
>>>       mutex_init(&file->event_read_lock);
>>> +    mutex_init(&file->name_lock);
>>>       if (drm_core_check_feature(dev, DRIVER_GEM))
>>>           drm_gem_open(dev, file);
>>> @@ -259,6 +260,10 @@ void drm_file_free(struct drm_file *file)
>>>       WARN_ON(!list_empty(&file->event_list));
>>>       put_pid(rcu_access_pointer(file->pid));
>>> +
>>> +    mutex_destroy(&file->name_lock);
>>> +    kvfree(file->name);
>>
>> I think kfree is correct here.
>>
>
> OK, I'll update in v2.
>
>>> +
>>>       kfree(file);
>>>   }
>>> diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
>>> index 51f39912866f..ba2f2120e99b 100644
>>> --- a/drivers/gpu/drm/drm_ioctl.c
>>> +++ b/drivers/gpu/drm/drm_ioctl.c
>>> @@ -540,6 +540,32 @@ int drm_version(struct drm_device *dev, void 
>>> *data,
>>>       return err;
>>>   }
>>> +static int drm_set_name(struct drm_device *dev, void *data,
>>> +            struct drm_file *file_priv)
>>> +{
>>> +    struct drm_set_name *name = data;
>>> +    void *user_ptr;
>>> +    char *new_name;
>>> +
>>> +    if (name->name_len >= NAME_MAX)
>>> +        return -EINVAL;
>>
>> Any special reason to use the filesystem NAME_MAX?
>
> Not really - feel free to suggest something else.
>
>>
>>> +
>>> +    user_ptr = u64_to_user_ptr(name->name);
>>> +
>>> +    new_name = memdup_user_nul(user_ptr, name->name_len);
>>> +
>>> +    if (IS_ERR(new_name))
>>> +        return PTR_ERR(new_name);
>>> +
>>> +    mutex_lock(&file_priv->name_lock);
>>> +    if (file_priv->name)
>>> +        kvfree(file_priv->name);
>>> +    file_priv->name = new_name;
>>> +    mutex_unlock(&file_priv->name_lock);
>>
>> One question is whether allowing name changes is interesting or it 
>> should be one shot?
>
> dma_buf_set_name allows to override the name, so I re-used the same 
> logic.
>
>>
>> Second issue is to avoid any Little Bobby Tables situations and 
>> somewhat validate the input. At least when kernel dumps in in debugfs 
>> and fdinfo, we probably don't want to allow userspace to be too 
>> creative. Like output newlines or some other special characters.
>
> You mean checking "isgraph(c)" for each char? Or even stricter 
> "isalnum(c) || c == '_' || c == '-'"?
>
> Thanks,
> Pierre-Eric
>
>
>>
>> Regards,
>>
>> Tvrtko
>>
>>> +
>>> +    return 0;
>>> +}
>>> +
>>>   static int drm_ioctl_permit(u32 flags, struct drm_file *file_priv)
>>>   {
>>>       /* ROOT_ONLY is only for CAP_SYS_ADMIN */
>>> @@ -610,6 +636,8 @@ static const struct drm_ioctl_desc drm_ioctls[] = {
>>>       DRM_IOCTL_DEF(DRM_IOCTL_PRIME_HANDLE_TO_FD, 
>>> drm_prime_handle_to_fd_ioctl, DRM_RENDER_ALLOW),
>>>       DRM_IOCTL_DEF(DRM_IOCTL_PRIME_FD_TO_HANDLE, 
>>> drm_prime_fd_to_handle_ioctl, DRM_RENDER_ALLOW),
>>> +    DRM_IOCTL_DEF(DRM_IOCTL_SET_NAME, drm_set_name, DRM_RENDER_ALLOW),
>>> +
>>>       DRM_IOCTL_DEF(DRM_IOCTL_MODE_GETPLANERESOURCES, 
>>> drm_mode_getplane_res, 0),
>>>       DRM_IOCTL_DEF(DRM_IOCTL_MODE_GETCRTC, drm_mode_getcrtc, 0),
>>>       DRM_IOCTL_DEF(DRM_IOCTL_MODE_SETCRTC, drm_mode_setcrtc, 
>>> DRM_MASTER),
>>> diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
>>> index 8c0030c77308..df26eee8f79c 100644
>>> --- a/include/drm/drm_file.h
>>> +++ b/include/drm/drm_file.h
>>> @@ -388,6 +388,15 @@ struct drm_file {
>>>        * Per-file buffer caches used by the PRIME buffer sharing code.
>>>        */
>>>       struct drm_prime_file_private prime;
>>> +
>>> +    /**
>>> +     * @name:
>>> +     *
>>> +     * Userspace-provided name; useful for accounting and debugging.
>>> +     */
>>> +    const char *name;
>>> +    /** @name_lock: Protects @name. */
>>> +    struct mutex name_lock;
>>>   };
>>>   /**
>>> diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
>>> index 16122819edfe..fc62bb21f79e 100644
>>> --- a/include/uapi/drm/drm.h
>>> +++ b/include/uapi/drm/drm.h
>>> @@ -1024,6 +1024,12 @@ struct drm_crtc_queue_sequence {
>>>       __u64 user_data;    /* user data passed to event */
>>>   };
>>> +struct drm_set_name {
>>> +    __u64 name_len;
>>> +    __u64 name;
>>> +};
>>> +
>>> +
>>>   #if defined(__cplusplus)
>>>   }
>>>   #endif
>>> @@ -1288,6 +1294,14 @@ extern "C" {
>>>    */
>>>   #define DRM_IOCTL_MODE_CLOSEFB        DRM_IOWR(0xD0, struct 
>>> drm_mode_closefb)
>>> +/**
>>> + * DRM_IOCTL_SET_NAME - Attach a name to a drm_file
>>> + *
>>> + * This ioctl is similar to DMA_BUF_SET_NAME - it allows for easier 
>>> tracking
>>> + * and debugging.
>>> + */
>>> +#define DRM_IOCTL_SET_NAME        DRM_IOWR(0xD1, struct drm_set_name)
>>> +
>>>   /*
>>>    * Device specific ioctls should only be in their respective headers
>>>    * The device specific ioctl range is from 0x40 to 0x9f.

