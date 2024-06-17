Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8739290AE75
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2024 14:59:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D05810E081;
	Mon, 17 Jun 2024 12:59:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Z1BnwQMv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2066.outbound.protection.outlook.com [40.107.236.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB9F210E3A1
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 12:59:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mNW8DKb3r1FozoaoCvX26pk5xVcq2pkuboP0VjNTDJwlebEhLo3l9HWTRzVsuCUg9MeUJ54Go3iH81QWuo8on1W4quk6GeceoCKLt4+SpzPLeWOkzDQ2WVhABr+msJz8Rt91Am/c5Y62tLK2Pn4x402ykRzkjj1ji793/OdQUccYhJwIPzKepoiY3N2moYhhM6kD/RmzatNZ0cJOVxFSZqYP4f6P1e/Rp+eo/i8l9zw1avQVLCDhCzjSgfdn9aVQoNSGPb8iq1sEr3xge9BIRdfnX5XL+Rf+RIhcQMdE6a6wGR5BOuUZRV++3Cn8tSH3zM6og+7hLzX15QQxmoiAXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OmgNb4dK+oE53yPjKeHCwn815f53Q4+GHog29k1NnlY=;
 b=G9TRigLpby8Xj/9y7ovs/7GlY8sYUhAMm/3oB5FXtOl6QOOCZZtwV6AHR3HlNEqqXd2h5CRKBdpNiFb4jau28yLGjSpNUHDwGuX2McfSCfOPl6/JVoUxxe48+EaKGBHtIYJOKhOVMIm9iQXAuCELuTuPNzxXcT8RbQ3eGUH9YWnauea35DvBlcPr41MDZekDmB01U/N7/z+5EuUe6DN4XmcT5ylO8TSgN7JHNVAvNBa8/wtHdCpazSlEheXqWiPCuOUuO/PQOXceFWP7B+KjRxxj7lBpirx7J5Q0sqcRNCQ++0SkKRdJgph+Fi3DBg5j8+86lBWJNfrn8Uf3OYs0RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OmgNb4dK+oE53yPjKeHCwn815f53Q4+GHog29k1NnlY=;
 b=Z1BnwQMvzNnFhdCt8T0+4VgmJmnD7w85d5IfB+AKat/VB/bGE9wYqlBXAXWvVsy6gG//JDycvYxAMHwL6dBAlVjU62W3CmydZHrKF7UB2Lf/BrSXUPDnRXdOtnsPF5/bwpda4CWm/TSiYuDXeP/7W8RcXNndWZhnvWBaIeJhJ5k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW5PR12MB5684.namprd12.prod.outlook.com (2603:10b6:303:1a1::21)
 by SA1PR12MB7342.namprd12.prod.outlook.com (2603:10b6:806:2b3::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Mon, 17 Jun
 2024 12:59:35 +0000
Received: from MW5PR12MB5684.namprd12.prod.outlook.com
 ([fe80::9eac:1160:c373:f105]) by MW5PR12MB5684.namprd12.prod.outlook.com
 ([fe80::9eac:1160:c373:f105%6]) with mapi id 15.20.7677.030; Mon, 17 Jun 2024
 12:59:35 +0000
Message-ID: <3c40679d-66f7-483e-b6d6-cb3c2a25b39d@amd.com>
Date: Mon, 17 Jun 2024 14:59:26 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/4] drm/sched: add device name to the
 drm_sched_process_job event
To: Pierre-Eric Pelloux-Prayer <pierre-eric@damsy.net>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 alexander.deucher@amd.com, ltuikov89@gmail.com, matthew.brost@intel.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 ville.syrjala@linux.intel.com, rostedt@goodmis.org
References: <20240614081657.408397-1-pierre-eric.pelloux-prayer@amd.com>
 <20240614081657.408397-2-pierre-eric.pelloux-prayer@amd.com>
 <c30b3543-7358-483d-bb4b-d76651943fbc@amd.com>
 <739805b6-f321-40bb-95d6-29c45f145b24@damsy.net>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <739805b6-f321-40bb-95d6-29c45f145b24@damsy.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0167.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::6) To MW5PR12MB5684.namprd12.prod.outlook.com
 (2603:10b6:303:1a1::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW5PR12MB5684:EE_|SA1PR12MB7342:EE_
X-MS-Office365-Filtering-Correlation-Id: 2fc637ec-50a5-4d9b-bafb-08dc8ecd5686
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230037|366013|7416011|376011|1800799021|921017; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YU1ROEZLR2VCUllaakNaMnFkYURLTXM0UmdmSG9PQWVTWFZIVzVXd2VlcHRK?=
 =?utf-8?B?YTRsSnlVK2wzSFNsYnlxYVp3OWlYMEgvQ0I4cmtMUlhnQ29Id3UxRkVYZWMz?=
 =?utf-8?B?UzhOZWN0WDFVTnNVdzJFL0cvQ3gvZ1FFdHBSZy8vWkRnUXV4cTdoa3BXTjFQ?=
 =?utf-8?B?b2lNbmhRY0FVWHUwQmNVeG1samJKbnMycTJRS3VQb2YrNUdLZWptVVZpeGkx?=
 =?utf-8?B?bVc2MnpjZ1RxQkkyU2w4WkJLQjFMRjNhMHpJaStoQWtEVFVxb3RLRy9MOURL?=
 =?utf-8?B?d3hPZmpjM0s5SitPZVhPUEV3T1d0Y25jdG44YjIyU3lraUhMelBOTVVNSXhx?=
 =?utf-8?B?d01QRlFKMjhybm1vNTYwWVAwc2YvODAvcENPTFhMcTVVb3JFM01RdkhQTVox?=
 =?utf-8?B?cmJpZW83ckhRZjFHVXhZWm01Y3V6d1RNMjVPdmdEUmxycGtuN0pmek1IeE92?=
 =?utf-8?B?eXdBVlBTKzgxSmlkdDBuOHUxcWsrRVpsek1CU3IxZTFwTVVYRXVITFdvNzkr?=
 =?utf-8?B?YlcwajBWNVhTT3RKM0ZTcVA3N0pNR2FwZmh3QWFjclA4RnF5OEZPVkNaWHVm?=
 =?utf-8?B?bFQrZEtLQWV4S2FLNkJDZWdOdHBIdHl0d1F6YnhMMDJKdC9hWGRwZis0VVpM?=
 =?utf-8?B?ajFkNnF1R0hMaWxTNkgwUVFYbFVXblR4enkxWFd4dGw0TXZsYVhFU0tHZ0pw?=
 =?utf-8?B?WEE2SzkzdzJ4WHBLNkdzUlVFVjNwUU5UREVmeEZpMW9OeDZINW53SktOaElH?=
 =?utf-8?B?ZFlxcDBqeEZSaW9LUEp2dURvOERLQWZ1amRFNkI0a1RSZHFnazFVSFNRQy9B?=
 =?utf-8?B?MWJNc0tnM24vVWVRaFBnckozZXBuc3pOaUNESnkrRnNHZFJSM01NRk82d2Vw?=
 =?utf-8?B?Z1FIVndpbHpQNTI5VHREYldlZ2VnS2FyUFF1elFRTCs4OG0wUWk0MkR3OW9z?=
 =?utf-8?B?VlcycUJoWGVEaVZ6RU9TVENVMkZDU1gvMFJBOTcrNS82L1R1c2JwRG9jYkxn?=
 =?utf-8?B?TWJFYlg4S3pyS01wVER2VjErY2ZTZk1KUkJtcE9hSEMwOS9sT1Vrazc4Z2NK?=
 =?utf-8?B?WkZRTW1BVFVjTFNvZ0NrNzAwOGRkTms5OVIveEc5M2VxZFUwV0JmREZJSTRx?=
 =?utf-8?B?UmFoWFpIejVpaWdoT0x0RWxMdC9raWV6MU1pTTZudXFpYWc2Um5SU1ZDNGVi?=
 =?utf-8?B?bTVxRURtVjJDZitCdkpFSFB6L0pEZVBuY1Q0ZEFFWE9uWXIxS0IzbkhMeUNa?=
 =?utf-8?B?dCtRcFBJWGQzRytzWHJCdU1rZERQUXNNZGtVbThxTGxCSXNOY3k3RGtJdG9Y?=
 =?utf-8?B?M3R5YzVLTzJyQWUrTjYyV1BOZWNickl5MDJsQlo4bWhyeHdLRm5iOWx6VmRX?=
 =?utf-8?B?ZXEvZkF2YmlTT3ZSTExCMTRUMzFuQ2hNUnRreDV4TFh0enlHMXNHNndkVU1B?=
 =?utf-8?B?bm1KNTRUNWZjR3p1emlxVXVNUW1TSU5rUGpDN0dobktDT2lkSEZXb0VINDho?=
 =?utf-8?B?ZVF1MHQwclBhQ0tNWDVYVVRJOVlPR05WY1dEOUVERFJuSU1HdzFtVEU1QXRa?=
 =?utf-8?B?R1liYkcwWnV4aytnZ3JmaUdQMXllbENibkRlSWJGS3dzdGpaN0xNWGx3MDFu?=
 =?utf-8?B?UG1Rdmp3WWtqWjgvam5QNy9TYWRvOHBvNW92RmRodThGWXN1TVpxRGV5TDk1?=
 =?utf-8?B?Rys4Nmplems2a2crMGo3d2V1UmJTRzRiNENhcDdubFFCdGNpOXM1Tk8wb0NX?=
 =?utf-8?B?dDU0QzdHdjVLaXRzZlk3b1ZKZ1NZQ3Q2cStIcWwycmRGbDQ0NHBYdEhsTTYw?=
 =?utf-8?Q?EKbqRymy8iI819R0tuQ6vfnwyyMrntr6iQvss=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW5PR12MB5684.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(366013)(7416011)(376011)(1800799021)(921017); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QkUyb0JvWTlSRGpxMThwWFRObTF4TnhIWDF5eVdRQ1dNZmZ1T0oxRDc2eUpR?=
 =?utf-8?B?cXQ5YU1zWExDWTdEZWsrRjRaR0lpaUhlbFVNTVcrSFVMSEhRZUxqZVhLUUlM?=
 =?utf-8?B?dmJmTGRDN3FURGFVTGRydmxTbVRqeG9KZWtTOU00SVBHa1gveUVtVzN0K2hM?=
 =?utf-8?B?VFF4dC9ZS2ZTSk82eUJacUFrWlgwTWV0amFSMFp6a2t0dTg5bjlsV0JvaTZ5?=
 =?utf-8?B?OU5ITUNsWXJJc0RGVDhlVHNub1REWHJneW1BTytOQlV6a1pXYXBaaWNrRFdt?=
 =?utf-8?B?alAvS0p2SFpObWRtdE1ic0VvWHI1Y1g3ZlFMSkNmMVFJRnhuREI4VkJ2R0d4?=
 =?utf-8?B?Tll0Ti9ZZGpQakt2NEhzU2JaeFJaQkJlQWU0cENXVVNFcUR0c3RtRUxHYUxt?=
 =?utf-8?B?aE13Zk13aFJMcXRsNGN6MGh3VW5hdlh2TmxsVVA1VXJHcHRYWWJDZk5aTGtG?=
 =?utf-8?B?aWR2aGk1M3pESm9IMUIxSHMrdWFYZGIvOVg5dzZDY215N09PMVJ3ejlWdFBF?=
 =?utf-8?B?TzdQYkJoYVRFaXVWaFp1VFV5ZCtxNm9VNWhHK2hKTitMUmQrTWNHVmk3dEVv?=
 =?utf-8?B?WHlweGtQaWRKeTZPbG42MFVMcXhyT3pmQng3NUlCSFllbTBNaExrZ2xGQXlT?=
 =?utf-8?B?R2tIcUx0NHRvbVJZdldaMFdObUU0NHcxMzdGY09pNnEwQWdNL29CTkJta1U5?=
 =?utf-8?B?SGk4QTNnSHhaSHM4T091OTBXMUxuZVl0cmhWemxPTVlFOGo5NlB5K1JDN3M0?=
 =?utf-8?B?THBvaGZTMXcydlllTDRNQWM2WTZHV0hSYTV5bU9sSVBzYzhJcEs5ZzVPaGxi?=
 =?utf-8?B?NGlZSG84d2Q1QnRkTUttV2tmZDBpbERlYk5WNjdsSnRpb1RtY3REQWJFRng0?=
 =?utf-8?B?TXB1N2JTRXFZb0VxWUJEVXhZc1VLZEhvcGZ3dElMRXRydVQzeUhWQzRiRjhq?=
 =?utf-8?B?VjB6R0hVYnovOG5PcGtxRFhKclVnbzk1NXpSaVBGWVR1RnI0eWdKamVGME9h?=
 =?utf-8?B?NWJZT2daYmgxUDRYUnBmVjlOMnFOU0FpbHg0NGo5ZnpEa1hBY3FlVGNEZmRZ?=
 =?utf-8?B?WkpDNlRqUjNkMmtWUlFsaGNaVkovRTdBRDlkUis5Y3ZWZVZLTDJTL01vSE9Q?=
 =?utf-8?B?UVMveWMyL2cvSmptcnl4R1N5MEJ2L2YvY0ZoWTdCb3pzb0pJc0cwMHZvOHk4?=
 =?utf-8?B?VWdXSVVRbUJDSEpGQUk1UVlBdVdUc08zdmxCd1NRWlFYMHVQOXhSOFYxSWlI?=
 =?utf-8?B?Mi9hNm5mSkdUVUtKa0M0eVlyOXlyd0JwYnlaSlkxZW5nc1hITk9OT3FZYjFG?=
 =?utf-8?B?R3NhYlpFbkNmUjYvaVo3akxTNFM5OUlnbzF2SGNWN0dDeDBVSHZFdnNoY3J5?=
 =?utf-8?B?V3YzcFFWbjUxUmJQc0hqaGRZbkVMQS80VllFczU1SlorUEEreTNBU2o4Mjgy?=
 =?utf-8?B?azE1blFsczFkSFJ3NUxFaDlhNmVxK202N0pjcVZMR1l6SjlBdWhJM0RlQ01a?=
 =?utf-8?B?TGJONEVFcGpxWUhTVW8rc05XS3A4QkVmNUY4TTFJTysyTVBONWs0Y293bjRw?=
 =?utf-8?B?dzN0MElJYmFSV216bXpVOFRSQTRBN1c2WWJrSHR5VWZyS09SaElrTGJ3b0Vv?=
 =?utf-8?B?SUcyRkxQMm5NckVVUmZxSDRZdlA1b1Fta0ExQ2k3c29SN0tDZGE5YzZjYldj?=
 =?utf-8?B?Rm8xWm5aSTdXQU40VS9pbDc4Y1l4NHIxZCtxanJtV0dxTnlpdXQ1aXRadlpP?=
 =?utf-8?B?bWRPWFVKcE5IUUVYUmtmQVlMWDFremxlWmN2cHd0Mlc2WnhGSEd3dVBXbWVn?=
 =?utf-8?B?SDdteUtFRkh0L3NRQ1o0cjZMT0NFdkxSd2J4cURzZFVaTzNPK05LVlhzSUpx?=
 =?utf-8?B?K3V3c1pQK1FIY1JQdXEydnVLcEpIQlRhQXhvT3hrQVhYMHJCSHR4THpFUWxX?=
 =?utf-8?B?a3U5Uy9PekxsbFloOTdSelMrR291R0dHUnZ5a1JzeCtYcGR3UUx0cnhGNDBm?=
 =?utf-8?B?OGRNRHBSZTVtVkdkSWYwM2FYRkhYNnc5MDkvVkVUZFhxLzgvVXpHN09XTUp4?=
 =?utf-8?B?YzlxOTVXS0V2em9qSDJpZHRaWHpMbE9LZ0p2WXJoTGRKOGlUVzZyYU5EMEk3?=
 =?utf-8?Q?98wotxT/Gf3TUJLLP/3MMUTJv?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fc637ec-50a5-4d9b-bafb-08dc8ecd5686
X-MS-Exchange-CrossTenant-AuthSource: MW5PR12MB5684.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2024 12:59:35.3438 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PdXOEZP8zg3acV5G/a94Ce7BV8JQcmpxKmL/GXGC8P7C1I4NdYwhQoZ3UuVZYIfL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7342
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

Am 17.06.24 um 14:54 schrieb Pierre-Eric Pelloux-Prayer:
> Hi,
>
> Le 14/06/2024 à 11:08, Christian König a écrit :
>>
>>
>> Am 14.06.24 um 10:16 schrieb Pierre-Eric Pelloux-Prayer:
>>> Until the switch from kthread to workqueue, a userspace application 
>>> could
>>> determine the source device from the pid of the thread sending the 
>>> event.
>>>
>>> With workqueues this is not possible anymore, so the event needs to 
>>> contain
>>> the dev_name() to identify the device.
>>>
>>> Signed-off-by: Pierre-Eric Pelloux-Prayer 
>>> <pierre-eric.pelloux-prayer@amd.com>
>>> ---
>>>   drivers/gpu/drm/scheduler/gpu_scheduler_trace.h | 10 ++++++++--
>>>   1 file changed, 8 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h 
>>> b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
>>> index c75302ca3427..1f9c5a884487 100644
>>> --- a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
>>> +++ b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
>>> @@ -42,6 +42,7 @@ DECLARE_EVENT_CLASS(drm_sched_job,
>>>                    __field(uint64_t, id)
>>>                    __field(u32, job_count)
>>>                    __field(int, hw_job_count)
>>> +                 __string(dev, dev_name(sched_job->sched->dev))
>>>                    ),
>>>           TP_fast_assign(
>>> @@ -52,6 +53,7 @@ DECLARE_EVENT_CLASS(drm_sched_job,
>>>                  __entry->job_count = 
>>> spsc_queue_count(&entity->job_queue);
>>>                  __entry->hw_job_count = atomic_read(
>>> &sched_job->sched->credit_count);
>>> +               __assign_str(dev);
>>>                  ),
>>>           TP_printk("entity=%p, id=%llu, fence=%p, ring=%s, job 
>>> count:%u, hw job count:%d",
>>>                 __entry->entity, __entry->id,
>>> @@ -64,9 +66,13 @@ DEFINE_EVENT(drm_sched_job, drm_sched_job,
>>>           TP_ARGS(sched_job, entity)
>>>   );
>>> -DEFINE_EVENT(drm_sched_job, drm_run_job,
>>> +DEFINE_EVENT_PRINT(drm_sched_job, drm_run_job,
>>>           TP_PROTO(struct drm_sched_job *sched_job, struct 
>>> drm_sched_entity *entity),
>>> -        TP_ARGS(sched_job, entity)
>>> +        TP_ARGS(sched_job, entity),
>>> +        TP_printk("dev=%s, entity=%p id=%llu, fence=%p, ring=%s, 
>>> job count:%u, hw job count:%d",
>>> +              __get_str(dev), __entry->entity, __entry->id,
>>> +              __entry->fence, __get_str(name),
>>> +              __entry->job_count, __entry->hw_job_count)
>>
>> Why not doing that in the TP_printk() of the drm_sched_job event class?
>>
>
> I didn't because drm_sched_job + drm_run_job usually work in pair so 
> the ring+device information will be available anyway.
>
> But maybe you're right and it's better to add it in the event the job 
> never gets scheduled.
>
> For the other events it's not necessary IMO: the first event will 
> always be drm_sched_job, so it's possible to figure out which the 
> device/ring for a given job.

Yeah, but we have that strace in the trace event even when we don't 
print it.

I would just go ahead and always print it even when it is available 
somehow else.

Regards,
Christian.

>
> Regards,
> Pierre-eric
>
>> The device should now be available for all trace events of that class.
>>
>> Regards,
>> Christian.
>>
>>>   );
>>>   TRACE_EVENT(drm_sched_process_job,

