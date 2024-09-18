Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B1497BCF4
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2024 15:19:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F89010E596;
	Wed, 18 Sep 2024 13:19:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="BStbco+z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2082.outbound.protection.outlook.com [40.107.244.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DEC610E264;
 Wed, 18 Sep 2024 13:19:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XEeB27tjb2IdgU70RX0xDwtzYyciYRg+OkxXz+Ni9ny2oTGzUWMRp9bnlzLBaxElR5IXYhlP/5+hiivI8up+punPU8BLS+KTzSJEzcnENyXu1bdYAi9ZoQDOX+XAXG8cNnoh8+AMdsGuoJReT+mGfxx1upNPHlPdmgkV1GemSMw+7RFn1Yr/8/sOxvnQiczD3iVM4yk4uX8tGRqf2zm4xu9jhBRIOpbiCTy+IQ1bEJpYELAd/LzRcqYb0jdHZDaZmNyw+VleNdk1v/G6RgNPyKS0mRI+Tv/PPS8cDMN1nf+q3EHWXiwiBu0iqvkT9cPoWscDbRfMK/mJcYqfkr320g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xh8e2UNRrVxXa9lNxTGeTfwArDuGmeWUtJOxsCTkBJw=;
 b=xDfAsEb4KEgRm5xDy20TnIc5QH7UleZmlpBXVSjT++zIpCFjn6lkcRIsU/JryL3Dsy63XhPr+E0suRGMDai/Ivvp0V4BQOZ8JyQp5YdYimZmXqXV8ZS5LofrrMnrcDyuTBZmsH6/AF4BUXvaReGRKSvitDpiW1YNTgZmqbl87p72PIre2m06pDKQyO76bhAAZ0OdHXAvPR9MO9wLqRsKMgWi2HwQNt4/hDPWphhTXfb/3aYPtsWYr5laEU7Y8M8FIKqdI14BVd60y3q84hSHBYOB7M8xW3ZLaUr8rGRz7BIvu4BXrWGQYZPbPr4yLY1BG5WyuSqiNyd/6XZ1D3a9Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xh8e2UNRrVxXa9lNxTGeTfwArDuGmeWUtJOxsCTkBJw=;
 b=BStbco+z6iZW8lXMgOObYtTNRFDhZ3xXkLVoy7ytvNo3wsBlHGJH+iEviWySdSyu1dwFYBUXnoy2gMa8bpX3rZlD2X5vrgYLopTOrBG2W731rTameKzSAWJ6UXcMDZX3UimI7mPuIHCaiQ+CdyOODLWTpLoPN0G3QiE3K0blE3A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CYYPR12MB8939.namprd12.prod.outlook.com (2603:10b6:930:b8::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.17; Wed, 18 Sep
 2024 13:18:58 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%2]) with mapi id 15.20.7982.012; Wed, 18 Sep 2024
 13:18:57 +0000
Message-ID: <b6808146-b798-45b6-b2b3-61d97825a85f@amd.com>
Date: Wed, 18 Sep 2024 15:18:50 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: RESEND Re: [RFC PATCH] dma-buf/dma-fence: Use a successful
 read_trylock() annotation for dma_fence_begin_signalling()
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 linaro-mm-sig@lists.linaro.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
References: <20230428125233.228353-1-thomas.hellstrom@linux.intel.com>
 <be9b192a-a125-6774-bb4f-8b9fb517ce0d@linux.intel.com>
 <ZrxYdIDdEJXRTFrn@phenom.ffwll.local>
 <0d406a89b1b63ebf53c5d0848843c72299c1ff75.camel@linux.intel.com>
 <a97c5f63053000b5fcfc14cb56c79c8ff976b4ad.camel@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <a97c5f63053000b5fcfc14cb56c79c8ff976b4ad.camel@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0031.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::18) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CYYPR12MB8939:EE_
X-MS-Office365-Filtering-Correlation-Id: bc1d5416-5394-4353-261f-08dcd7e473ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Rld4eGtiNDJyaTIxK1hZY1NELzNBTXlGeVV0ek9vc3N5bms0ZnVuVGp6TUlB?=
 =?utf-8?B?QU1PaE9rVXdvMjI2TnIxN29CdWwvRHVWbklHYkJRTmlROWUrUzlBZEJSUGR3?=
 =?utf-8?B?N0JrOHUwYjAremJsa1drcVBNQ1NUcmFuNEVIK29XQzZTSFdRcjV3WS9oU0RF?=
 =?utf-8?B?bXRiZ21CeWFHK2FFZ2I5NUlVL1NLL2kxRGtsbDUrWFV3SllTS0dVeGw3dmpj?=
 =?utf-8?B?NGZxUXA4ZVBaYXNDTDhuaHppT1NrNG5kMDdEdFl0TGh1VEJzS3FFK3JnaFBj?=
 =?utf-8?B?clZrNlNndlFGTmdHWHFJV3kzZmNLT0ZudkR6cWNyTlZVSFZYN0hFVWYvekhG?=
 =?utf-8?B?YXNyQU1BeXpZM1JHN1ZFb2xvM3ViL2o5ZGtlRzJud1V4TUhNQmxKUFRqM0dn?=
 =?utf-8?B?VS9Jd3R0dFkwSmRRUzAxUVZuMFQvWVFaaGtKYmE1VjhnQmpXcHdXNTN6Vkdz?=
 =?utf-8?B?OW1HRU1zVTZuSXlURkw5Vi8ybnYxVkxManVPc1FBT2J2R3BLdUFldVZLNHRM?=
 =?utf-8?B?VWFzR0ZxTHE5QWhFWVRDYVlNUGVsRlg3Vzl6SUxKR250eXZ5U25jWVlJMlF4?=
 =?utf-8?B?S0xQdGJBVjBaOENYWW5hVWFKWkw1NldRRkhYT0VxTk9jdW5sSHpmbDB1SUFQ?=
 =?utf-8?B?T1Q5RkE0SDlndWhzUjdtZ0Q1VGZ5Vk9vbGxaY05XWjVTQmVtcVV0VmhnSkxY?=
 =?utf-8?B?R3d4RGtTbUdPOFFFZmRnNVZoYjEvSTZJblE1Ullwc01iNElXc1VoSzBkT21S?=
 =?utf-8?B?cHNzWkNtdGNENzJFaTJxUWJSWDkxS282U2xWcGljdHd5Nzl6Z1VHcjFtcy9X?=
 =?utf-8?B?Zm52V0FEQ0pXOWJjNEtZMlYxendNbUsycW9lNEcxUDNkWU1IZzhadzdhcVRk?=
 =?utf-8?B?RUdaeks0V3N4MTJzQWovSW8vc1V2aWJMVDVpV1FpakgvZ1p3WFdCampKZjE1?=
 =?utf-8?B?RERtbEFKckdqajFNRVRTbWt4RUpvQ2Zod3FrYmVRYUlJendkU3NmeDYxYi9C?=
 =?utf-8?B?cmJMSkNKSTR3QTlueGFwakVOWGtIK2NSRlYxVUdBRWRmbEpLRTlhNzhLRUpM?=
 =?utf-8?B?c0hGTTFianFHMnZrVDF6YkVvUWtwT3VudUhMOEJZMVhFOGxxZGZ4TjdVczBC?=
 =?utf-8?B?MTBIcThyNEZWTFFzL2FTQjhhVFdXbE5taFhYMU0ybzNTd21HV1J0OVA4RDcr?=
 =?utf-8?B?R0xKM1llbmF4TjdhYW9hWTF4NHRrMXdPYTZFVUVQanRFTCs5Z0RCRmcwNkJQ?=
 =?utf-8?B?Ty80K1ZKUmVhMnVrblN5S3ErL1BOSjh4WURNdkRMNnJVYS91cnBGUEM0eDdL?=
 =?utf-8?B?UnZZK0lva2EzRi9kV2FyTFFwS1p0clFZQTRBdzFYK1oxaHpnWmQrUmo5MmYr?=
 =?utf-8?B?dzg3QS8zTmhFSXBvL0QzUmxMRTVnRnFFUmhHQmpwRWZSVHo3azFBVVljYzVp?=
 =?utf-8?B?dWs1MWYydVg4emFjUWdmMDcvOWM2b2JLd2ZmTDU4TWtzNmZkUTUybTNsSTV1?=
 =?utf-8?B?SXlTOEZLVmxTRlVHQzJVNGJtRHFSZ0Q2alpUN25RaVI5UDZlSCs4cW0xdlBi?=
 =?utf-8?B?a1A3TjFDa2U5d0RXSUg5SXI5SVJxS05WZVg4QWJoVjJWZDEvSGY3Q2V5N3VM?=
 =?utf-8?B?WUUvcUFnbThyNUFYRjB5TUJvaVMxV1NZMXhwcEo5dGp5bVB6N0xnRlIvUDlW?=
 =?utf-8?B?SWo0UjMxUi8yUXYwaDZDcUJXT3ZXOWNXaGE4UXV1NFJFNGZ4U2JPbTdtTkND?=
 =?utf-8?B?WTM2QWdkS0VWcG54Y0ZoTnNvd25hUTJnZDBpcERHVGs5ZzBZRjdJOFJ1aGVk?=
 =?utf-8?B?VHAxMzVtR3gycGFOUTJmQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NVlUVkg5czdCaVBJamlYbjl4THJBa2s5QUg0SU1QNmRqYklQUXJDRyt5TW1m?=
 =?utf-8?B?dnB2b2pjQlVhVFpvQnl3M2V3UjNIL1k2MXJjaW1NSkdmM3dnSkZPZGNoc3Iz?=
 =?utf-8?B?NVdjaC9JZHZneUlUUUt3Vkk1S0VSbENjRDQ3WDUwRHJ4VGhHOUsyS3BKOUM4?=
 =?utf-8?B?OXE3M2NWRmtncUlWUWMwMTdOWHRSa3BqZ1FmZUZJd1hITTBaUHR3Y040Ympj?=
 =?utf-8?B?eUFRTnRoZjVSVTUzQmt5aFV4UG1sMkorUHFNWmNBTFNEWTduSlRXT28yTjlT?=
 =?utf-8?B?aW1OOHNVOXBxRkZ0d1RMcWZUSVNGdHg1OTF6TUQ0ejI5c05Jc0ZsUm5sNzlm?=
 =?utf-8?B?b2ZkZzRQVG1PSkhmdURXc0tUTDJnK2oveGxVZlR4eWFKVkFaK3UzUExSSHN5?=
 =?utf-8?B?U3dVRUo1clJyRm9mN0FOelNTeUw3dGQrQ2EydHVHZWY2NDBPeEdrNUpGSTFE?=
 =?utf-8?B?MUFZZE1XNytrRlN6K3h1aUExWnllOXZ5eTJvUjVLcHQvbTBLejh0TG9FaFlw?=
 =?utf-8?B?bitleHhEbmZjK3ZTOUcxWnpDOGR4NjR4ZFN6MUFhQTRucXRFWVRiRlc1bnZu?=
 =?utf-8?B?RGZtaHRBcWJhVlhreC9xSGtLMUpIYmluRmJkS3dzWkNWckdqMzBScThEMzdK?=
 =?utf-8?B?VXlLUzM0NHFOVk40NGJVZ3ZuM3RoRGdOcy9QMWZhYm16TTJ1eTdEeDYwUU0z?=
 =?utf-8?B?UFlNNy9PREF4aGpGTjNyU010WStLZVMzdmZ0MVBGclVraGdveDZRaUVSS1BL?=
 =?utf-8?B?VHFxekFzK0VGOElFUUsvbTRZOVN5QlJiTzdDWGxJK2JvZjNYMmZRSVRLMW5x?=
 =?utf-8?B?aHpwUU54ZVlrNXBmVWswTjZUc2dEV1BCcDhCWmVYanNIWTVCOEd2OE5uTXp6?=
 =?utf-8?B?YTdmLzR3d0MrdENzNnNQMVRUWDhIMkpjL0hHN1BjMWRWNWlhRVZibGUzZmlX?=
 =?utf-8?B?cnlaVzE3N3VpOVdrNU5YME1XUWlma2h5RW12eThBODlGV3loVGMxb0s3WjlT?=
 =?utf-8?B?cmYvaTNYYUpIZkQ1ZzF6RzFvRDJ6RVJHdHFKUWpTVDNmUlFTdlRMRnNIR0M5?=
 =?utf-8?B?NVhXTXlpOGFJQ3kxN3k3ZTgxc05PVSs1a2tUY3ErUTBlOUM4YmJLUGtEc1RZ?=
 =?utf-8?B?aXhtZFZCeDZMS29YL1lYcVJ0UXdhdmw1VThlZDBtaTd3dVpRcWhqaTd3dHdG?=
 =?utf-8?B?TzZFZ2ZXRWZvc29XU2kvdWdKZ1ROZVVCUndKNTVzL2FYTmNLQnpqVzFLRy9j?=
 =?utf-8?B?ajBqbm1RTktNWmd1c09mUVZrUjUvTnJVOEdKcWE3d01qaCs1VG96SjlQa2pj?=
 =?utf-8?B?bVZiMktFMFExWkJtU0MzcFNtemthVktQdnprUjFEeWZGRUlhL2Jnc2NUWjNC?=
 =?utf-8?B?d0kyY1JyMVhBc1ZVdStwNUJvaXRDRjc4ZCszdlJUSjJsc3lkSVlBUDJaTGlp?=
 =?utf-8?B?RFNnc3JYdFJZejhOWmxSSnA5WkhxK1ZOY09mUW55N0FUcGxYaGMzYlNtd2lN?=
 =?utf-8?B?QkRwVjVsS2hrNXhxTWtoclJ0M2NWa2pEdzFyU0lSZm1GMEJaUmRnSUdtL2JV?=
 =?utf-8?B?b0RCRkdTNldrN2t6ZHJ6ckE4U0VvUXRPTyt0VEpoU3hhZEp1ZEJPL0QveCt3?=
 =?utf-8?B?UjljaWIxMXU4dDBTQmM2ZVFHNE5TRDhmb1BlR0RTUjlXMUh0eFpOakYvRUZo?=
 =?utf-8?B?Z0FISzdESm8zWUNYbDVlcmtpWEtobThtdEh6SUJ6akdjMi8xNmxSdFBkNVlD?=
 =?utf-8?B?M0lObk5KL3F0ZjY4b3RoNUI3SmlSak1CcUgyZGluVU1OYm1VYU1tZkwzTGwv?=
 =?utf-8?B?MjUzdnBnL1hFNDkrcWpUVTVNUkg2VDg1UStEcmlqZW5ESFVlVlJPdkFaWElM?=
 =?utf-8?B?bkZTVGppVHczTG1Gb1ZKOHg2TktUZysra2UzaEZwREl0bDAwUlRtM3BDWUs1?=
 =?utf-8?B?TkE3Q0NQUWYxZXlDQmVCMDVaYWk1UTlFdkxtbTlpaGcrY3dQZGFqNWtRTTBQ?=
 =?utf-8?B?b0E0OHlMVkU1dEYweUxJU2k2NEZTL1hWa3h4MStQYWRNWWI3VXczbXlaN3Jm?=
 =?utf-8?B?ZHgvOGFpYTJvYUlCbFV0Z05sd05JTUtMQ204MEpEQ0tZYTlVekhRWHZPMDJi?=
 =?utf-8?Q?g/+E=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc1d5416-5394-4353-261f-08dcd7e473ab
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2024 13:18:57.5647 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +qM5JU+P/IksammlsGG/z7LrAkRgJQjJqMGr1ghOmRR4bmm4sn04B4bwq+rnHHGG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8939
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

Sorry, somehow completely missed that. Feel free to push it to 
drm-misc-next.

Christian.

Am 18.09.24 um 14:34 schrieb Thomas Hellström:
> Christian,
>
> Ping?
>
>
> On Wed, 2024-08-14 at 10:37 +0200, Thomas Hellström wrote:
>> Christian,
>>
>> Ack to merge this through drm-misc-next, or do you want to pick it up
>> for dma-buf?
>>
>> Thanks,
>> Thomas
>>
>>
>> On Wed, 2024-08-14 at 09:10 +0200, Daniel Vetter wrote:
>>> On Fri, May 26, 2023 at 01:11:28PM +0200, Thomas Hellström wrote:
>>>> Daniel,
>>>>
>>>> On 4/28/23 14:52, Thomas Hellström wrote:
>>>>> Condsider the following call sequence:
>>>>>
>>>>> /* Upper layer */
>>>>> dma_fence_begin_signalling();
>>>>> lock(tainted_shared_lock);
>>>>> /* Driver callback */
>>>>> dma_fence_begin_signalling();
>>>>> ...
>>>>>
>>>>> The driver might here use a utility that is annotated as
>>>>> intended
>>>>> for the
>>>>> dma-fence signalling critical path. Now if the upper layer
>>>>> isn't
>>>>> correctly
>>>>> annotated yet for whatever reason, resulting in
>>>>>
>>>>> /* Upper layer */
>>>>> lock(tainted_shared_lock);
>>>>> /* Driver callback */
>>>>> dma_fence_begin_signalling();
>>>>>
>>>>> We will receive a false lockdep locking order violation
>>>>> notification from
>>>>> dma_fence_begin_signalling(). However entering a dma-fence
>>>>> signalling
>>>>> critical section itself doesn't block and could not cause a
>>>>> deadlock.
>>>>>
>>>>> So use a successful read_trylock() annotation instead for
>>>>> dma_fence_begin_signalling(). That will make sure that the
>>>>> locking order
>>>>> is correctly registered in the first case, and doesn't register
>>>>> any
>>>>> locking order in the second case.
>>>>>
>>>>> The alternative is of course to make sure that the "Upper
>>>>> layer"
>>>>> is always
>>>>> correctly annotated. But experience shows that's not easily
>>>>> achievable
>>>>> in all cases.
>>>>>
>>>>> Signed-off-by: Thomas Hellström
>>>>> <thomas.hellstrom@linux.intel.com>
>>>> Resurrecting the discussion on this one. I can't see a situation
>>>> where we
>>>> would miss *relevant* locking
>>>> order violation warnings with this patch. Ofc if we have a
>>>> scheduler
>>>> annotation patch that would work fine as well, but the lack of
>>>> annotation in
>>>> the scheduler callbacks is really starting to hurt us.
>>> Yeah this is just a bit too brain-melting to review, but I concur
>>> now.
>>>
>>> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>> I think what would help is some lockdep selftests to check that we
>>> both
>>> catch the stuff we want to, and don't incur false positives. Maybe
>>> with a
>>> plea that lockdep should have some native form of cross-release
>>> annotations ...
>>>
>>> But definitely seperate patch set, since it might take a few rounds
>>> of
>>> review by lockdep folks.
>>> -Sima
>>>
>>>> Thanks,
>>>>
>>>> Thomas
>>>>
>>>>
>>>>
>>>>> ---
>>>>>    drivers/dma-buf/dma-fence.c | 6 +++---
>>>>>    1 file changed, 3 insertions(+), 3 deletions(-)
>>>>>
>>>>> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-
>>>>> fence.c
>>>>> index f177c56269bb..17f632768ef9 100644
>>>>> --- a/drivers/dma-buf/dma-fence.c
>>>>> +++ b/drivers/dma-buf/dma-fence.c
>>>>> @@ -308,8 +308,8 @@ bool dma_fence_begin_signalling(void)
>>>>>    	if (in_atomic())
>>>>>    		return true;
>>>>> -	/* ... and non-recursive readlock */
>>>>> -	lock_acquire(&dma_fence_lockdep_map, 0, 0, 1, 1, NULL,
>>>>> _RET_IP_);
>>>>> +	/* ... and non-recursive successful read_trylock */
>>>>> +	lock_acquire(&dma_fence_lockdep_map, 0, 1, 1, 1, NULL,
>>>>> _RET_IP_);
>>>>>    	return false;
>>>>>    }
>>>>> @@ -340,7 +340,7 @@ void __dma_fence_might_wait(void)
>>>>>    	lock_map_acquire(&dma_fence_lockdep_map);
>>>>>    	lock_map_release(&dma_fence_lockdep_map);
>>>>>    	if (tmp)
>>>>> -		lock_acquire(&dma_fence_lockdep_map, 0, 0, 1,
>>>>> 1,
>>>>> NULL, _THIS_IP_);
>>>>> +		lock_acquire(&dma_fence_lockdep_map, 0, 1, 1,
>>>>> 1,
>>>>> NULL, _THIS_IP_);
>>>>>    }
>>>>>    #endif

