Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C9049D4A05
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2024 10:31:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ADD510E8C6;
	Thu, 21 Nov 2024 09:31:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="H33ZGDLc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2072.outbound.protection.outlook.com [40.107.243.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CCAD10E8BD;
 Thu, 21 Nov 2024 09:31:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qabCTDPrgLyJ/1XfTTUCkPAnYt9UraYk57Q35nj0yk/volu2ZvTBrZhmplV8gNKEdcvEYInGnw0nTCniQbRiMQR0xJ78f5di9gB+E5BOKaKjwrEl25pPF2YRAN5L8zO06j16EGzmnv5gsMgo/iYGSuMZ6GRxmGqmanS/nyVcj2wie1AiM1x+NH4ZhoQrDFAVX5bnoc2EcbV9KmP834IH7S1qcVdjCAi3a/yxpoSMgXPQgKuGssrNGJ2ibZO6yVASACAEZwGSBQhVOat5WsVfLuArRe6cHeHxgMhrDZxctTh6T5IraixKFCUbDIiNJ5lrqTywVm3gAehAwpf+nXs/nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NE/6ka97K170s1wf+Tm0md0Y2Mfxqzi7fX4uRwGtADA=;
 b=SSPJCqYe7/Pbq6X089BQ6yaNmB+t+jl4nPBYRZNv62haeeR7yY2gbE6fvkTlBeTS2UVh2TBq1UF+mRKXev4TwMkAVJB1FihtAC4H1QG7XOk2b1QhxboBzxp7As385SzqXthNkcl5/hwftNDN8HWeJAzrilQqvq7DBWeOAQFjzFNxzZRTuzXSQAcYusf5RpbEJxfkh1nVNSnh4pERD6k6kcy+RJc7dVK6XB9ObhvyutkunjVxYbcQt1pTTpVmqGQyxHN4+NHk2K59h3K+v395IFA6/C1FDp4f/m16rWstREHODLe3v2EN7cvcA+DzS/Toc02QqgIVeKkTVc+ygvYtLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NE/6ka97K170s1wf+Tm0md0Y2Mfxqzi7fX4uRwGtADA=;
 b=H33ZGDLcupMWXWqmkXrEaW/Zq4aIm5KUIlgBzuuSYZ4Ba8PVR7gYtiqsfowRj0ZWWz2SBPckaiynMSnhEkZgSatPKanuMsSWme31+Ez7pn3hf0IOhmJSW49+ZGP8YKDILIoz8Mq/kThtBNsvTNkjp79cHGwEfm+a32ahWOWmsxw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SN7PR12MB8770.namprd12.prod.outlook.com (2603:10b6:806:34b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.23; Thu, 21 Nov
 2024 09:31:23 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8158.019; Thu, 21 Nov 2024
 09:31:23 +0000
Message-ID: <01678a48-828a-400f-b989-51c497845340@amd.com>
Date: Thu, 21 Nov 2024 10:31:16 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 02/29] dma-fence: Add dma_fence_user_fence
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 kenneth.w.graunke@intel.com, lionel.g.landwerlin@intel.com,
 jose.souza@intel.com, simona.vetter@ffwll.ch,
 thomas.hellstrom@linux.intel.com, boris.brezillon@collabora.com,
 airlied@gmail.com, mihail.atanassov@arm.com, steven.price@arm.com,
 shashank.sharma@amd.com
References: <20241118233757.2374041-1-matthew.brost@intel.com>
 <20241118233757.2374041-3-matthew.brost@intel.com>
 <f802caa1-85a7-4a5f-ae92-9b1c0f4c500e@amd.com>
 <Zz5nrl3H2wAagwgE@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <Zz5nrl3H2wAagwgE@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0141.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::12) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SN7PR12MB8770:EE_
X-MS-Office365-Filtering-Correlation-Id: cfd33ff8-3331-470a-5670-08dd0a0f437d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a3BBeVAxTWFpYXAwMjV3TlhNWGtkNnd6SFAxSk4vWkZ0YU5ORmcrVmZGOXRV?=
 =?utf-8?B?Nnh1SUZJd2dwdFMrV0JUeDlTUHlNQy9rbCtNSEYwNVcyVkRhbHAxMTZOSjdr?=
 =?utf-8?B?dEMrSkZoTTVHVEhQN0d0a0pkcWVQUXZPYWcrdmhsMG5YTVZsQ2tSZFc1M2Ur?=
 =?utf-8?B?YXlVTWxlZ3lDYjVoaVM4QnJXMTluUEQ3ZGtuL3ZoeFpFS0REMWN1YSttWkla?=
 =?utf-8?B?RjdrcmF6NGpwV294d0hwd05wS09pWDQ4cGpmbitwaWkvVC9ic3Z4R1AvNHNI?=
 =?utf-8?B?cExvWGU2ZTNuZXVjcE5aOFVvdytiMjcrWE8rVS9kSGFqT09QdVhlMm1jVS9j?=
 =?utf-8?B?RHVhQlZ2SVlEeXh4U2oxSFJKbFFuenp6a2RKa3JKTjlSQmpVbTYwK21HTzZv?=
 =?utf-8?B?NnBuRDdoajFteCtMTDRiMEEyK0huOStvVkFnQVJNVURXMzZUeThYUXMyaVNt?=
 =?utf-8?B?b1F4UXgyMUNxYXg0ekRFcmlFNXd2NGJTVlhDbnQydFJ4N3g1MGplS3FPeFVx?=
 =?utf-8?B?alZ3bkZhSytGR0FxNlE4cEY3dGJWOHA3YVVkdEhJL3ZXc3BhczdtQVlUUWQz?=
 =?utf-8?B?WlUvaHM4WWhwRVhVSzJXRWJsbWRSWkNla28rLy9kNUZiMDQvRS9tbHhYRjd5?=
 =?utf-8?B?eWZ0K0lwcy9wTnA4a21HYnRVSHNEYVdtelBxNTZZeHhqZDdzQTB1N1ozMHFm?=
 =?utf-8?B?ck1wV245bllwTVR5MmZ1Q0tkV0N0VXlJbXZGc202UldVT2NrOTFON3RreEZU?=
 =?utf-8?B?V0xpVkR1SFJ5WFR1ME1oN0s5VXRyOEIxOGllNWRUTmhyZlhKa2syMm5uanRF?=
 =?utf-8?B?MEF1UXh0NlFCN2NlVmxTVXBLRWY5TEFGT09wb1FibnJvUi8zVm1sd0gyZFhk?=
 =?utf-8?B?dlVFdlFlZXF3M09naGN3d2xoQUUvMmlQSk0vTFIxdWlKMThOUDZWcVBiNk9j?=
 =?utf-8?B?TDBSYktRQmIxbzdvdWlROG1BWFhrNTRaaHk3dTU0dGx1YkRaNzMxRnN5RnZQ?=
 =?utf-8?B?MXZpeUk4cmMvQnNSTjFaYnMwalpyVTMwYTNTa3BuTnhsVWVXc3RldmtiR0Vl?=
 =?utf-8?B?VGEwVUV0ZFREQjdBMU1yUnZ6ZkpTT0ljVGZVbnhGUUJoQ3hxdWllMnZ1bG9o?=
 =?utf-8?B?Ynd1ZHp1Z0FNZDVIMXdzb2pHWGIvczZ1RTRZVVpVVW8zZlpHR1plRmVqRk5B?=
 =?utf-8?B?WDFmM0ZLdUtVQWx0TnlUL3FCb2h1SXBaMWR2QkpjS29ESHdMMS8ySmkyaHFT?=
 =?utf-8?B?Qys4MDZ0UFZPd3FEL2w0WVhUYUtsY3lLR1A5bitxUUZwQnFUL25PNlZUZ1pr?=
 =?utf-8?B?TmQya3BkVnQzajl3K0VLTUhHUThoemhPdWpjanVGRCtUSkd2U0Z3REsyc2hU?=
 =?utf-8?B?aXNOV1pRTlg4Tm93b2dWVUUxaEpwS2JORzlZRjNiT0FQL2dtdkVzR3REVThR?=
 =?utf-8?B?MXgwYlViYnhLQUtIZXlUUGZSVk02bjFRd21mZE8zZitJN2xyR1d1Z0xoOGJn?=
 =?utf-8?B?ekJLMktrbG9aWnExTmdJMHY5T1c4RU1Bc2pSalV5VjRjS0pIck9IN1JBb0FD?=
 =?utf-8?B?dkZvOFU1TEhyTlVmeEV6dGZxVHF4OVArRDFzWWtrQjJhMXEzQWl3WHNCN084?=
 =?utf-8?B?ei8xbVg1dk9JQlBKTGpCa2RPL0FTTkFUMnlhSHFXWnM4bWlBQmhDMEZ4Z0Q5?=
 =?utf-8?B?ZmR3bnRRdy91UGZWaDlzSGNZa2VVMk9xZ2VmeW9wRFdieVNoeitWRXFGWnV0?=
 =?utf-8?Q?QzKwNUEz9RG4uksJZkNH9o42O1dGafjykgJ5hsh?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TVNOZGd0Zm42STQrODJJdEZScXFqbUdsNWdiRkpoWkltdkR2alNLNFkwUlUv?=
 =?utf-8?B?RjJQb2dHRzZ5QXlUT1pVWnVUOVplRmluU3Z6aXBSdStoZ1NKamtIaHJabk12?=
 =?utf-8?B?ZmpOMW5aS0U4UG5EU0Z1eUN1ckY3NDZjenBhZWlBbzhScWtkcTJWc2prKzZL?=
 =?utf-8?B?clNEaUhnTVZMc013bjBsVzJjNXo5ci85dFBDSHY2enVhOFpzbUhDSXdRMFV2?=
 =?utf-8?B?a2lEMkhhZkQ4RkNpOXIzZWJ4MnF2ZkVaMnhobDFkMkg5cXBUS2FacTVZanFF?=
 =?utf-8?B?eDc2ODN5N0FnSHlpajM0UFl2MCs2bFVldGZ5Si9UcGxObi9QeGlPMXNFeTg3?=
 =?utf-8?B?S0xKM3dBRDQwRkdUWFBDelpnQTR1bUU2d3BENnNScTBRU0RscGFIbExlNGYx?=
 =?utf-8?B?UVdKWmdjd1N4OUtRZzhYYVhPa3V2N1V2Uy9WWDlFWW1aOEZZSEtkaGdJRDJj?=
 =?utf-8?B?ank4U05OV1FmS3Vudk9oUHh5NEh1RkE1S296OEhwUW1nNGcrVStVVzcrbHht?=
 =?utf-8?B?c2dMT1Jjd3FMWVBBVkZCVG1iSFBmN1VkRTR1N29aMDZrOFpqK1kzMlp5MGFL?=
 =?utf-8?B?ZUUwdlI0a2ZmVWxlVWZ4QmVPS3hoMDVXVVlRN3hybWdJamc0UllzZU5VOFhr?=
 =?utf-8?B?RTd2c0cvdGFucDl4MTJVU1JGbEhUejZtUERRUml1TEJRMDFLVHc3K09aN1pB?=
 =?utf-8?B?UjAwRXJZcUR4WXFCSGNrcldCOTN4VkFmUjNYS0QxMkwxRlgvNXFRYlJEbE1w?=
 =?utf-8?B?WGhBS1o1R0p3dmhwbmVxMWhiZDlyVHY1dWM0V1E3N1JWSkx5R2Fub1k2dWk4?=
 =?utf-8?B?REZKQ2VQRnZkUkdDNHB6ZG56SDFxa2dERlhXbGwwcng3NGhUT29hWlhubW5W?=
 =?utf-8?B?Y0RxMGRvbnFneTJseDZPVXJLZmxnSTFBbHl1QXl3L3ZIbkthbXZsYUFiQWFv?=
 =?utf-8?B?STRkeHZTZk5VMVBEbnEyMndvZkJwQUpIN0tHK2ZZcy9oYTlxTEphczF5VHUx?=
 =?utf-8?B?Ny9nMzBWL2xOYXplZEw4bTloVHQ5ZjRNZVpublhxZTArazdDODczcVAxdXdq?=
 =?utf-8?B?eThhemRjOFNNZDh6ZmFiSFIzcHNyNHo2N3p0eDFtd096RGY0L3hMdWJpeUtN?=
 =?utf-8?B?VXN2aW5WNGg5Q0xESFhLb2NjVDRKMVM0clh6V0FYM1FDZXI2RnJHcGk1Nk5l?=
 =?utf-8?B?ODM3WmZOZExST2ZaRXVnbGVxRFFPSnZWUFllMVBManVJdFJTYzBYOS9sSmM1?=
 =?utf-8?B?aGRiQWptNnZYV2IwdFk3RitXckQ5MUQyNy9iMC9rajV5WUtneEVad2tLeEhZ?=
 =?utf-8?B?TTNUNS9KOXp6VjlUTWJ4Z0hvWldQMW5OMjNKV2JQY1B4eWJtU3ppQkxWVGN1?=
 =?utf-8?B?VzNnbjZNeTFLV3ZLc0ZWZ0o2OVh5NmFBclNjQ3cySElVS08yZk9SeFR3c0xV?=
 =?utf-8?B?eVptYjE4bWNDaXNYYmh5R3BXVzNDNkM0Vlc0bGNQTXllZVdkbVYrRnZGakNr?=
 =?utf-8?B?KzcyNjR2R2crakdRSDFZei9FM2R5YW1Zd0lJeSt4TU9SRG90T1BJUHJtV2Nt?=
 =?utf-8?B?VC9hckZkcTl5dGpCTjVIdXhlYUw0OTl4cmRLQVBLbFRuZWtqZGVtZ2RTTjl2?=
 =?utf-8?B?NWY4SllrWmhBUy9MY1JPYnlKay84VjNLQWNBUzliaytjUllBTFpVMnFQOTFO?=
 =?utf-8?B?aXBiZFIvNENrOVNQN2ZIRXdRT3RxYUNnd3VsLytiTUZ1NERybnJrdWN2K0py?=
 =?utf-8?B?VCtQN3ZNeC9IUENqdFZYdk4yWDdUTVRsUUxlZ2JtTGhVVDBkL1piaXZ6bmJi?=
 =?utf-8?B?OW80YmY0eGtEUTRnV3hwZ0NJbnUxWmFIZEhEMlM1RFBFS3g4S01XTnNqVEhB?=
 =?utf-8?B?V3NnWkVHZTBkRVhDRnVRQklqY1VlK3hPbUVNTkZXSnE1K0ZGR3hNdmJZT0hs?=
 =?utf-8?B?b2hveGllb3o0aXFJQ1hvUy9NVlJySDZRWDNMRDNleHRCT3JITTJkcDdFVnln?=
 =?utf-8?B?WFhkeFNYVG1YL05QM2ZiQTg5QVdJSFZQZE1hSWFyb2lQM2lwV3NrdEwxV0V2?=
 =?utf-8?B?ZU5tNWM1ZnFGM1FuOXhCWHlDdy8zYzRqeStGZ3VFamFhdjA5N0VYZlpxZ3Rl?=
 =?utf-8?Q?mq/D7KMSE0gh2YXQSzQtsplqY?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfd33ff8-3331-470a-5670-08dd0a0f437d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2024 09:31:23.2195 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q86j0dYVR3h/VJbWI+T50olM8AWhjCI7918zk7Ae3OgT4WCKOK4OpmFvKpOGYQQ/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8770
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

Am 20.11.24 um 23:50 schrieb Matthew Brost:
> On Wed, Nov 20, 2024 at 02:38:49PM +0100, Christian König wrote:
>> Am 19.11.24 um 00:37 schrieb Matthew Brost:
>>> Normalize user fence attachment to a DMA fence. A user fence is a simple
>>> seqno write to memory, implemented by attaching a DMA fence callback
>>> that writes out the seqno. Intended use case is importing a dma-fence
>>> into kernel and exporting a user fence.
>>>
>>> Helpers added to allocate, attach, and free a dma_fence_user_fence.
>>>
>>> Cc: Dave Airlie <airlied@redhat.com>
>>> Cc: Simona Vetter <simona.vetter@ffwll.ch>
>>> Cc: Christian Koenig <christian.koenig@amd.com>
>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>> ---
>>>    drivers/dma-buf/Makefile               |  2 +-
>>>    drivers/dma-buf/dma-fence-user-fence.c | 73 ++++++++++++++++++++++++++
>>>    include/linux/dma-fence-user-fence.h   | 31 +++++++++++
>>>    3 files changed, 105 insertions(+), 1 deletion(-)
>>>    create mode 100644 drivers/dma-buf/dma-fence-user-fence.c
>>>    create mode 100644 include/linux/dma-fence-user-fence.h
>>>
>>> diff --git a/drivers/dma-buf/Makefile b/drivers/dma-buf/Makefile
>>> index c25500bb38b5..ba9ba339319e 100644
>>> --- a/drivers/dma-buf/Makefile
>>> +++ b/drivers/dma-buf/Makefile
>>> @@ -1,6 +1,6 @@
>>>    # SPDX-License-Identifier: GPL-2.0-only
>>>    obj-y := dma-buf.o dma-fence.o dma-fence-array.o dma-fence-chain.o \
>>> -	 dma-fence-preempt.o dma-fence-unwrap.o dma-resv.o
>>> +	 dma-fence-preempt.o dma-fence-unwrap.o dma-fence-user-fence.o dma-resv.o
>>>    obj-$(CONFIG_DMABUF_HEAPS)	+= dma-heap.o
>>>    obj-$(CONFIG_DMABUF_HEAPS)	+= heaps/
>>>    obj-$(CONFIG_SYNC_FILE)		+= sync_file.o
>>> diff --git a/drivers/dma-buf/dma-fence-user-fence.c b/drivers/dma-buf/dma-fence-user-fence.c
>>> new file mode 100644
>>> index 000000000000..5a4b289bacb8
>>> --- /dev/null
>>> +++ b/drivers/dma-buf/dma-fence-user-fence.c
>>> @@ -0,0 +1,73 @@
>>> +// SPDX-License-Identifier: MIT
>>> +/*
>>> + * Copyright © 2024 Intel Corporation
>>> + */
>>> +
>>> +#include <linux/dma-fence-user-fence.h>
>>> +#include <linux/slab.h>
>>> +
>>> +static void user_fence_cb(struct dma_fence *fence, struct dma_fence_cb *cb)
>>> +{
>>> +	struct dma_fence_user_fence *user_fence =
>>> +		container_of(cb, struct dma_fence_user_fence, cb);
>>> +
>>> +	if (user_fence->map.is_iomem)
>>> +		writeq(user_fence->seqno, user_fence->map.vaddr_iomem);
>>> +	else
>>> +		*(u64 *)user_fence->map.vaddr = user_fence->seqno;
>>> +
>>> +	dma_fence_user_fence_free(user_fence);
>>> +}
>>> +
>>> +/**
>>> + * dma_fence_user_fence_alloc() - Allocate user fence
>>> + *
>>> + * Return: Allocated struct dma_fence_user_fence on Success, NULL on failure
>>> + */
>>> +struct dma_fence_user_fence *dma_fence_user_fence_alloc(void)
>>> +{
>>> +	return kmalloc(sizeof(struct dma_fence_user_fence), GFP_KERNEL);
>>> +}
>>> +EXPORT_SYMBOL(dma_fence_user_fence_alloc);
>>> +
>>> +/**
>>> + * dma_fence_user_fence_free() - Free user fence
>>> + *
>>> + * Free user fence. Should only be called on a user fence if
>>> + * dma_fence_user_fence_attach is not called to cleanup original allocation from
>>> + * dma_fence_user_fence_alloc.
>>> + */
>>> +void dma_fence_user_fence_free(struct dma_fence_user_fence *user_fence)
>>> +{
>>> +	kfree(user_fence);
>> We need to give that child a different name, e.g. something like
>> dma_fence_seq_write or something like that.
>>
> Yea, I didn't like this name either. dma_fence_seq_write seems better.
>
>> I was just about to complain that all dma_fence implementations need to be
>> RCU save and only then saw that this isn't a dma_fence implementation.
>>
> Nope, just a helper to back a value which user space can find when a
> dma-fence signals.
>
>> Question: Why is that useful in the first place? At least AMD HW can write
>> to basically all memory locations and even registers when a fence finishes?
>>
> This could be used in a few places.
>
> 1. VM bind completion a seqno is written which user jobs can then wait
> on via ring instructions. We have something similar to this is Xe for LR
> VMs already but I don't really like that interface - it is user address
> + write value. This would be based on a BO + offset which I think makes
> a bit more sense and should perform quite a better too. I haven't wired
> this up in this series but plan to doing this.
>
> 2. Convert an input dma-fence into seqno writeback when the dma-fence
> signals. Again this seqno is something the user can wiat on via ring
> instructions.
>
> The flow here would be, a user job needs to wait on external dma-fence
> in a syncobj, syncfile, etc..., call the convert dma-fence to user fence
> IOCTL before the submission (patch 22, 28 in this series), program the
> wait via ring instructions, and then do the user submission. This would
> avoid blocking on external dma-fences in the submission path.
>
> I think this makes sense and having a light weight helper to normalize
> this flow across drivers makes a bit sense too.

Well we have pretty much the same concept, but all writes are done by 
the hardware and not go by a round-trip through the CPU.

We have a read only mapped seq64 area in the kernel reserved part of the 
VM address space.

Through this area the queues can see each others fence progress and we 
can say things like BO mapping and TLB flush are finished when this 
seq64 increases please suspend further processing until you see that.

Could be that this is useful for more than XE, but at least for AMD I 
currently don't see that.

Regards,
Christian.

>
> Matt
>
>> Regards,
>> Christian.
>>
>>> +}
>>> +EXPORT_SYMBOL(dma_fence_user_fence_free);
>>> +
>>> +/**
>>> + * dma_fence_user_fence_attach() - Attach user fence to dma-fence
>>> + *
>>> + * @fence: fence
>>> + * @user_fence user fence
>>> + * @map: IOSYS map to write seqno to
>>> + * @seqno: seqno to write to IOSYS map
>>> + *
>>> + * Attach a user fence, which is a seqno write to an IOSYS map, to a DMA fence.
>>> + * The caller must guarantee that the memory in the IOSYS map doesn't move
>>> + * before the fence signals. This is typically done by installing the DMA fence
>>> + * into the BO's DMA reservation bookkeeping slot from which the IOSYS was
>>> + * derived.
>>> + */
>>> +void dma_fence_user_fence_attach(struct dma_fence *fence,
>>> +				 struct dma_fence_user_fence *user_fence,
>>> +				 struct iosys_map *map, u64 seqno)
>>> +{
>>> +	int err;
>>> +
>>> +	user_fence->map = *map;
>>> +	user_fence->seqno = seqno;
>>> +
>>> +	err = dma_fence_add_callback(fence, &user_fence->cb, user_fence_cb);
>>> +	if (err == -ENOENT)
>>> +		user_fence_cb(NULL, &user_fence->cb);
>>> +}
>>> +EXPORT_SYMBOL(dma_fence_user_fence_attach);
>>> diff --git a/include/linux/dma-fence-user-fence.h b/include/linux/dma-fence-user-fence.h
>>> new file mode 100644
>>> index 000000000000..8678129c7d56
>>> --- /dev/null
>>> +++ b/include/linux/dma-fence-user-fence.h
>>> @@ -0,0 +1,31 @@
>>> +/* SPDX-License-Identifier: MIT */
>>> +/*
>>> + * Copyright © 2024 Intel Corporation
>>> + */
>>> +
>>> +#ifndef __LINUX_DMA_FENCE_USER_FENCE_H
>>> +#define __LINUX_DMA_FENCE_USER_FENCE_H
>>> +
>>> +#include <linux/dma-fence.h>
>>> +#include <linux/iosys-map.h>
>>> +
>>> +/** struct dma_fence_user_fence - User fence */
>>> +struct dma_fence_user_fence {
>>> +	/** @cb: dma-fence callback used to attach user fence to dma-fence */
>>> +	struct dma_fence_cb cb;
>>> +	/** @map: IOSYS map to write seqno to */
>>> +	struct iosys_map map;
>>> +	/** @seqno: seqno to write to IOSYS map */
>>> +	u64 seqno;
>>> +};
>>> +
>>> +struct dma_fence_user_fence *dma_fence_user_fence_alloc(void);
>>> +
>>> +void dma_fence_user_fence_free(struct dma_fence_user_fence *user_fence);
>>> +
>>> +void dma_fence_user_fence_attach(struct dma_fence *fence,
>>> +				 struct dma_fence_user_fence *user_fence,
>>> +				 struct iosys_map *map,
>>> +				 u64 seqno);
>>> +
>>> +#endif

