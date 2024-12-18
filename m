Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E16B9F6F4A
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2024 22:12:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 204DD10E1C1;
	Wed, 18 Dec 2024 21:12:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="J3nfJvj/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2049.outbound.protection.outlook.com [40.107.96.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ADE910E104;
 Wed, 18 Dec 2024 21:12:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MggKQEUKBogmcvgm/Zs1jYw/dNBbOsMR54MtqtYPuzY86JQf77hI65Fl2hksP/Xg3oPsA2Mogmwal9BG+SaSHVyePJJVuz5jqkB/u3jWcNr6bWMQj0kOCd954FcsaQBpYuY0HNxtIylJ+qn5czKahclRBOxEi2IL9Vq9W8S/nk0wtdDAG/Tnwy9Uvwo6fCYuA7sTKs2KlMdBHIr28knJhroq15SazxN7mM3hNlt22abOKje4GA5EGdRx7oR+k2jvezxn58E385/TYrQReHBXmYIEEAh0xk/FGfvf4qPvzjtEBTfuDTcBX8XjmOFSqZyhHWR9BxYVq5Fz4zkmr2DxCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4IijPB0YXd0Y4LVNAzB0hq+ahgJDnBAJ0en1lJlCUbc=;
 b=EtVIAiVYy84RVjZe1GCgZlMIYhQYLLwxglllxZOMXS51MvmVCPV1YhPZGomP1h5CYgWYX+yueSHeET9LGMCRbRVvgZ/36U7xZVepwpI21pJ/0Lo3poYctVX6FWpm5NSMsQUooUF/pM6wKLOarmJNIWpN2SweXVbbGnBgvn9c9JMyEPLP9Lqvq+wYcUXsNVIaSO1LEGPnPhNoJacldWWG95B9K7HHvtoCvnpvROU7nCK3VLjWdkhjDfW2rK7QyRanFMjyvT4lTvfbuD/N/QDFSGwDX3mGUG5h41Y+iqmrRT0FpRX6qEW8WlzQDVVCTFPkR5JwHPdgUo2rGn+OJXI73A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4IijPB0YXd0Y4LVNAzB0hq+ahgJDnBAJ0en1lJlCUbc=;
 b=J3nfJvj/yC0175OQbXOcBlCTVwar/OIiqCUME0OpakWJYfQJ1sHwi4IaaYPu7WPLZxEBZmp1gqyeL716ys7aveOnQI7eNuFjGfJrRnYBNVfGkVWmAhi5mTLDD4xYZCJhM3gZ9i7AzkuCi12DoY9Rkjy8XIWiVHPTxPPYHWkA5D4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by DM4PR12MB7766.namprd12.prod.outlook.com (2603:10b6:8:101::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Wed, 18 Dec
 2024 21:12:09 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062%4]) with mapi id 15.20.8251.015; Wed, 18 Dec 2024
 21:12:09 +0000
Message-ID: <1b0713c1-f5db-4e7d-9f4c-877ad16d6b92@amd.com>
Date: Wed, 18 Dec 2024 16:12:06 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 18/44] drm/vkms: Use s32 for internal color pipeline
 precision
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 wayland-devel@lists.freedesktop.org
References: <20241003200129.1732122-1-harry.wentland@amd.com>
 <20241003200129.1732122-19-harry.wentland@amd.com>
 <Zv_U4IETaaHbC4F_@louis-chauvet-laptop>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <Zv_U4IETaaHbC4F_@louis-chauvet-laptop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT1P288CA0028.CANP288.PROD.OUTLOOK.COM (2603:10b6:b01::41)
 To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|DM4PR12MB7766:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fd968de-f8bb-4d62-bfd8-08dd1fa8a206
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V3VEdUMrZHhKdVhCbFVqRjkvNWRhYVNDZmo4bmR3NUFwWS9KWk0xL0ErOG1X?=
 =?utf-8?B?S0pCVnR1QVlxUHdoUW5RMDBGT28xZHVDT2xPMUxlaGRpVWUveW03eUdPWjZu?=
 =?utf-8?B?amZiOTM1bEN3YWEzdWZqT1dYVk9udTZlczNTajZLU0NlV092MjkvOWRaRTdC?=
 =?utf-8?B?ZkIxZWgwa3BpMHRRdzFQbmpOVnlkK3dITjlQdHlWcUhnVy9xWldpRlpUeVhU?=
 =?utf-8?B?a1E4dHNwL3l1bXpNK0FZclpqZVJyNlNKSHozS1puMDJnc1pLMkRNK014Qk5q?=
 =?utf-8?B?RzFhZ2tFQkxwSjRyR1N1WXRUcTFINWdJUjlLNFM5MHczZlJYQm9xRHowZmh0?=
 =?utf-8?B?STFJRmN6R1VMV0JteGJWRFd1RlJsaGNuRlh4WU0yR05xSHQ2SEVEQ1o4dXdT?=
 =?utf-8?B?cDFHWFFyV0xOSTFMK25sOW1DdmQ1MHZ1TEhSYWlTWVg3RW5FcWdhWFZsV201?=
 =?utf-8?B?N3gzN2grZ2RoVmd5OWJmT0xFVS81bXBTZEsvcFBzRlZpWWxBQ0F0djNwUG5R?=
 =?utf-8?B?N2J5OHFoMnV5ZStuK3FTZ1ZOR2c3UUN0aGRCbXFFSzBSZXJ6emY1am1jb1Zp?=
 =?utf-8?B?cHVQeFVDWS9NOFJKV09MK25tUTRoQi9xdXd2NGIwZm1CMDJwWkdxNzdDbHlv?=
 =?utf-8?B?UlJPb1NwVnJkZEtlbUpTNGU1NGpQVlluTjduUlNRd1U5Qm9ON1VvMzFia0F3?=
 =?utf-8?B?RjlNOTIrNjhXUXYyc1dWRm1xUTBsdmsyUk1xelRVZnFCeW5MTk5aVnQ0L0x3?=
 =?utf-8?B?a0NUYUtTYU5Uc2hoOXdrei83WXJPTmlNYVZtcUZKajdUbEs4OC9JZ2RLTGtL?=
 =?utf-8?B?MSttRFYvajF4cFlqWTQ5KzMyamxYbTFGNEtvZCtHQWhIMGZsbndtUzRabG5I?=
 =?utf-8?B?OExESXdSbFE2a1g2RFEwVnlxYklSdmxUeHN0ei9zSHNocG9Rd0dHT2ptaGZT?=
 =?utf-8?B?d1Z2RmlrdnZZeDhWbytwSHNmUzJiVXA1d3gxYlVSc1dhTzkxek5KOFBuSmJ5?=
 =?utf-8?B?L1piVmxSYzBncnUycEI1SGQ0VmJNV1Q0aHdRZ2I1Ti9VanV0YzcrVDFxUm5a?=
 =?utf-8?B?empxMC9tSVUrL1BlY0d0a3c3SmFKTGxpSXBmTXAweTNHaFVJaFFxOGFFUVNx?=
 =?utf-8?B?d0hvaEJIcExvWDV1b3pFNnBlM052anprUitzL1VmZmlwZjJ0UjdTengyUFlo?=
 =?utf-8?B?Q1hab0xOV3I0eUhnMHJYMmcrVzM0amtpSGlCT1BQR0cvTUVoY3p2NStNMDZq?=
 =?utf-8?B?TmZNT3A2MVlhWDc5dG55U2p4QVFMazNqQmV0cHI5YmNjNjRsVzNkZVFRRWRE?=
 =?utf-8?B?cnZlQTEvRlJJdHY2NlkrMEx0dnlzeFZ4WUxuOTZXT2FrR29hd2xEdVB2ZFNj?=
 =?utf-8?B?bzVUcStCRzl3djRqSUVHajBYWUs5azF0L2hsTnpaQWRwTmZOelc1c3U4bHFS?=
 =?utf-8?B?RXBQRUVEemdEQkJPczNzVVphNmxvL3BNRklDemVIbnNINVZvZFdiN3U5Zm1j?=
 =?utf-8?B?RjVJNCtHQ0t0T0paNkRobTFBaXJKTTZ4VWNBL3dQdGwzR00yajlzN1pmUVUv?=
 =?utf-8?B?VklWNHYyWmJCTWxzMXFmYUVDRzk4ODdmTmE3U2hSaXhXSThTbXlraU9yU0Q3?=
 =?utf-8?B?Vnh1ajV4RExBdXBMWHFobnNuNmN5Z0xiVE5IYWdSaDNZeWtNNTVvNnRkU2lp?=
 =?utf-8?B?eU5BSStkaVhIcGtuRXIxMDF3WURuSnlVN0hFTHhNVWRRNlhyVEFzczREN1RF?=
 =?utf-8?B?NWJoRHhHM0N4WjdRSXhYOEJRc0M4RTJLMExXSFdNMWJJRW1OQWdRMzFITXZq?=
 =?utf-8?B?czgxQUU5T2lwN2lmSU9LUEk1NHJEYWY5eVlNWHFlc3NUOC90MnNKcVM5S3FW?=
 =?utf-8?Q?jIKsP4szdCUDS?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NWg5VEhRcmN5bTE1YnpMRmwwT0tXS1ZzZi9vcjQrNVBadStFeGo4RlhFcE0y?=
 =?utf-8?B?S0RXNDRqRm5kbllOKzk3MlYrQ0JyK2JPNENVbUdlQjFWK0pjeStJTjROcEFi?=
 =?utf-8?B?REhybk5HQnNPR2lTOHUvZWo1QmpNUVJNZkFpanVxSEtRVXhIbURHSWtsOTlU?=
 =?utf-8?B?ZEh1MjN2UVJRMUZSSnc2clNsbTZqR015T0huZGVaMDk1UExzeExkNUpCWkxG?=
 =?utf-8?B?UEtjc2tnRWxQby9aa2xFM2xyWUc2VzY3VG9HV1lTMFpMTnFkdllMYlIySU5Q?=
 =?utf-8?B?SFoyUUhwWUdNOEFhdGIzTENyYzZJRlFVVEdMQks0K3gydWNOaGtkRTFCaEtI?=
 =?utf-8?B?R3NPU3Y0TlZCRko5cEx3NGR6LzMrU0tGTTg2SXN0Wjc1MC94L3dXTmhwVHlz?=
 =?utf-8?B?N2hCbTNieGpyMGtEeFZuaFl0UVFVVmI5OExCbUxFMWF6MytwbFNCTldzVURK?=
 =?utf-8?B?SVVScXNuRk0rSFlRUlA4cEZoZlBMQTVqQTVHMDNoZllMeHlSRytXR3JVaXRJ?=
 =?utf-8?B?VDhQbU1kSnFyMy9mV09ZNGxROW1Cbmhoc0E2Vnh1cGJCZVZVNldTR0JpS3Nl?=
 =?utf-8?B?TFNHWmJ6ZERkT3E3dDBSeExzNm5kSGNaeERLa1YzV3hDbzhtWmh3R1FiOUxF?=
 =?utf-8?B?T01DQnVXdHZnbWZHTmZMVUZoQ2lLRUJPdHZxd2NyMXFweHZCZlh6Z0VvdlZw?=
 =?utf-8?B?OW01WG5CT2RqWnhpTDdtam9tQ0dQYVpGYVNMQno1MmY0RGhwY0p6Z2oveHp3?=
 =?utf-8?B?aEdlQnREMnhML0lLVE82V0lUNU9nd1lqMTZpNHF2RlNwd25PVEt5WjUxbHFM?=
 =?utf-8?B?ZkEwcFRONHhFWG1KN0h0cW5zWUR5N2ZyaHBkYmJKcVh5NFAyTTdrREVZcDBy?=
 =?utf-8?B?SUlza00rMklqNjV2bTNQVzVOTU5ZMUJDSXJmOTljZC9ERkYzS3NMZE8xU3ph?=
 =?utf-8?B?TDJFT3BHWXkrMGI0NWpBU1ExT2dvd3h1ckx1VGNiTi94dlpDVjFnd1pHZkdB?=
 =?utf-8?B?QzR4aFBqVXlWUkdKcnVvNUdkdVl4VFpiUVRxdGtpdnVFaVRDYTlEZmFYVC94?=
 =?utf-8?B?aVVQMEZodlZqVXcyTWlpT2tUMFVVbjBqVVlHL0lrNm1jcUZ5RDlyT21Ec1My?=
 =?utf-8?B?SXRsbllDNnNsQXM0WmpwNGRta3RJK0NCRDd3cDdzVEJ1Q1h4VHdWTjVBZ0Mv?=
 =?utf-8?B?bmFYT2ZIT2JNZXhlTUsrUEpiejBlUlB4T3l4ZFVEZ1VTWjRjVk84T3RaYisy?=
 =?utf-8?B?TDNjb2F5WngzMWxqOWFoeGpudUtlU2U3WFEzTWRuRmFtWXlJc2pRZXFxYXVU?=
 =?utf-8?B?MFlLVUY3MWlEWVJCL1c0dGpLWTRGRzZ2SGlHWThRSlZzUE5zeklxNDcwZFFz?=
 =?utf-8?B?OGFnTGI0ZEp6SFB3ZXExZ2lobzJFN0ZwRmpQQm13VDBwZUE4cWk0UE9ERDhv?=
 =?utf-8?B?alV5M05QQ29kVTdNUWhJbFo5NHJlLzQxMVd1OEMzV0Y0M0pRcjBFMUZvZUt6?=
 =?utf-8?B?SWVMeXFpZEo3V1l0ejlJZWcxajZubDNZNFU3R1gzM3ZtcU1yMHVmTVVxRGNp?=
 =?utf-8?B?WEJjdnZ5czZzdFdXNWhQRzlMYUs3VitQRDlMS2twV1doT1V1T3h2NElNWUo4?=
 =?utf-8?B?VmNOOUZEMFNHMFJoRDBrZW1FbnBkMVRIV056WUJSbmZSNkNVdG8ycFNFNWJU?=
 =?utf-8?B?UnlDMk8xQ3R5UXRqWVBBYXkwUW84WGpXMXRvRXJvc1RBTzN2elpRcFBMeXVv?=
 =?utf-8?B?WUZHb0o4VDJTY3Qzcys2ZjhmUDhyZDQzbjFyd09uNDF3ZGV1bnJQTFBBNkNl?=
 =?utf-8?B?V3pnM0d1b1dRVXRRL1JTOGZjZm1ZU1lSbjhoVURRK2xuckRJdFhYY3NleFZ3?=
 =?utf-8?B?bjd3WnltYW9lSSttb055cXVlNHZpcUM2UXVWdnIwaU03S0Q0SUJua1VxWGZ6?=
 =?utf-8?B?U3g0aXVvSm40ODVyekg2OXAwQ2J3eXIvK09STHVabEVvREp6NDk2djZhbHlv?=
 =?utf-8?B?YjV4MHZoQWVHeFlRVGx2OXBqY2YvMnJQU2lsNGtPekVBZmpXaUI5RmZncExs?=
 =?utf-8?B?S1gwWWJHdExpVW9EZ1hYSEovTzlzTGtRVU4wNVcrRzREZFcyS3krY2tCWk43?=
 =?utf-8?Q?iywNF3Xoy6PnfLW67HSJeiB8W?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fd968de-f8bb-4d62-bfd8-08dd1fa8a206
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2024 21:12:09.0966 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nQKS2f/5Ba+1COhivMGSl4XSGtsdAjGGIXbpjbrmxTFJfVIUYngXBon3vrrkds7rbyhJtklBbs/crPwdNvh6sQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7766
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



On 2024-10-04 07:43, Louis Chauvet wrote:
> On 03/10/24 - 16:01, Harry Wentland wrote:
>> Certain operations require us to preserve values below 0.0 and
>> above 1.0 (0x0 and 0xffff respectively in 16 bpc unorm). One
>> such operation is a BT709 encoding operation followed by its
>> decoding operation, or the reverse.
>>
>> We'll use s32 values as intermediate in and outputs of our
>> color operations, for the operations where it matters.
>>
>> For now this won't apply to LUT operations. We might want to
>> update those to work on s32 as well, but it's unclear how
>> that should work for unorm LUT definitions. We'll revisit
>> that once we add LUT + CTM tests.
>>
>> In order to allow for this we'll also invert the nesting of our
>> colorop processing loops. We now use the pixel iteration loop
>> on the outside and the colorop iteration on the inside.
>>
>> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
>> ---
>> v6:
>>  - use clamp_val instead of manual clamping (Louis Chauvet)
> 
> Perfect!
>  
>> v4:
>>  - Clarify that we're packing 16-bit UNORM into s32, not
>>    converting values to a different representation (Pekka)
>>
>> v3:
>>  - Use new colorop->next pointer
>>
>>  drivers/gpu/drm/vkms/vkms_composer.c | 27 +++++++++++++++++++++++++--
>>  drivers/gpu/drm/vkms/vkms_drv.h      |  4 ++++
>>  2 files changed, 29 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
>> index b4aaad2bf45f..01fa81ebc93b 100644
>> --- a/drivers/gpu/drm/vkms/vkms_composer.c
>> +++ b/drivers/gpu/drm/vkms/vkms_composer.c
>> @@ -159,7 +159,7 @@ static void apply_lut(const struct vkms_crtc_state *crtc_state, struct line_buff
>>  	}
>>  }
>>
>> -static void apply_colorop(struct pixel_argb_u16 *pixel, struct drm_colorop *colorop)
>> +static void apply_colorop(struct pixel_argb_s32 *pixel, struct drm_colorop *colorop)
> 
> I agree with this change, but I think we may face conversion issues 
> in apply_lut_to_channel_value, as it takes u16 and returns u16, but with 
> your change, you pass s32 and expect s32.
> 

apply_lut() still passes and expects a u16.

apply_colorop() should be fine with passing/getting u16 values to
apply_lut_to_channel_value(). The only way I could see this become
an issue is if someone uses a CTM that results in negative or greater
than 16-bit (1.0f) values that then feed into a LUT. But I'm not
sure how realistic such a use-case is and would rather address this
when we see a need for it. An IGT test that creates such a scenario
would fail, but we don't have such a test currently.

I also don't have time to dig into it, rework apply_lut_to_channel_value
and do correct clipping where needed and I'd rather not touch it unless
I have time to be thorough with it.

So, I think it's fine for now but we might want to rework it at some
point.

Harry

> If it is not an issue: Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
> 
>>  {
>>  	struct drm_colorop_state *colorop_state = colorop->state;
>>
>> @@ -185,9 +185,26 @@ static void apply_colorop(struct pixel_argb_u16 *pixel, struct drm_colorop *colo
>>
>>  static void pre_blend_color_transform(const struct vkms_plane_state *plane_state, struct line_buffer *output_buffer)
>>  {
>> +	struct pixel_argb_s32 pixel;
>> +
>>  	for (size_t x = 0; x < output_buffer->n_pixels; x++) {
>>  		struct drm_colorop *colorop = plane_state->base.base.color_pipeline;
>>
>> +		/*
>> +		 * Some operations, such as applying a BT709 encoding matrix,
>> +		 * followed by a decoding matrix, require that we preserve
>> +		 * values above 1.0 and below 0.0 until the end of the pipeline.
>> +		 *
>> +		 * Pack the 16-bit UNORM values into s32 to give us head-room to
>> +		 * avoid clipping until we're at the end of the pipeline. Clip
>> +		 * intentionally at the end of the pipeline before packing
>> +		 * UNORM values back into u16.
>> +		 */
>> +		pixel.a = output_buffer->pixels[x].a;
>> +		pixel.r = output_buffer->pixels[x].r;
>> +		pixel.g = output_buffer->pixels[x].g;
>> +		pixel.b = output_buffer->pixels[x].b;
>> +
>>  		while (colorop) {
>>  			struct drm_colorop_state *colorop_state;
>>
>> @@ -197,10 +214,16 @@ static void pre_blend_color_transform(const struct vkms_plane_state *plane_state
>>  				return;
>>
>>  			if (!colorop_state->bypass)
>> -				apply_colorop(&output_buffer->pixels[x], colorop);
>> +				apply_colorop(&pixel, colorop);
>>
>>  			colorop = colorop->next;
>>  		}
>> +
>> +		/* clamp values */
>> +		output_buffer->pixels[x].a = clamp_val(pixel.a, 0, 0xffff);
>> +		output_buffer->pixels[x].r = clamp_val(pixel.r, 0, 0xffff);
>> +		output_buffer->pixels[x].g = clamp_val(pixel.g, 0, 0xffff);
>> +		output_buffer->pixels[x].b = clamp_val(pixel.b, 0, 0xffff);
>>  	}
>>  }
>>
>> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
>> index 278cf3533f58..b78bc2611746 100644
>> --- a/drivers/gpu/drm/vkms/vkms_drv.h
>> +++ b/drivers/gpu/drm/vkms/vkms_drv.h
>> @@ -36,6 +36,10 @@ struct vkms_frame_info {
>>  	unsigned int cpp;
>>  };
>>
>> +struct pixel_argb_s32 {
>> +	s32 a, r, g, b;
>> +};
>> +
>>  struct pixel_argb_u16 {
>>  	u16 a, r, g, b;
>>  };
>> --
>> 2.46.2
>>

