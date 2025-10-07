Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E86F0BC0C28
	for <lists+dri-devel@lfdr.de>; Tue, 07 Oct 2025 10:44:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB9EB10E07F;
	Tue,  7 Oct 2025 08:44:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="IQd7sPz4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010051.outbound.protection.outlook.com [52.101.85.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49BD210E00C;
 Tue,  7 Oct 2025 08:44:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OSl/ypiiRxRgdaQ938DcxFjdrnTf5MTJkzju515IsVF0AbhJlX0Sg7eLbo7LrXLmj5OrhrOMLaVysekXEOOc7uCqyZZznG13Fm5wXlheXFfnGXV+L7m2dFEUJRbmANVwuzapJZagaN8l7TcjwQn+RwKPWCCFb1VMgOQMtOpHmNUOFAg16ktPZ4fk8vfdhyL/TMxveWcrhdYSDVqirrxERTWwTWBSKgLzcs5Gk2id777pOOgy2P/bss2Etz9YunN03OhGDUocmUXTIYgZ7F2dG6ULhSeAthjcLUpZf8pfjrAxWuSJxukjk0eGZNzTCxlLUrVjaQabtYPXYs0YYa7eyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=udZL3UYZ01HvZzYrm3NTd3WMgvUthEyzT+tlJMMcy7Y=;
 b=wv725S4SB1VJJingq6cvGepbRLQpmi58BK0VD7d96sdp05HT2NRXrfoer8M8i1wH/h2+SbEKbB6rNNFW45PVOL2g9x6oSk8tYrVUw2vxGIANwAg8ez2ZYe2wwTpGn2ip9yNnVg81g8taf4a/miU7pn7IoUuXoE7bjKjPO/tqHWqUHKJ9EnvNADIyHzK+PbTP+4IPYDN2mmxqg+Fqey7xzCch2INXvjPCNkwvSEij1ppmZu2NYhM26RwwISfq7jOjy1t7/jMQJwxqUHjIP/BoRfO2+Yl2Rf7eUvMZeCZMipRVvjskc8VMFYqrV42nuk3ESID2YbPBadfI33OHheF4Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=udZL3UYZ01HvZzYrm3NTd3WMgvUthEyzT+tlJMMcy7Y=;
 b=IQd7sPz4RNQnAfWLsm7ndESGPA/17N25qb7wOHVxGJzrd97vZZPjRIUSYXxB7vAdiT3qqRoyyp8plpk217ZoF/IIkVOC7+VtNxvIp4RXHRJAVSOZvpiLhOZXs7gIDklpwDn8L1J2V47/Tvi6J1TZ7ALyESFKqV7cDQv+hKzU328=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by BY5PR12MB4323.namprd12.prod.outlook.com (2603:10b6:a03:211::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Tue, 7 Oct
 2025 08:44:06 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9182.017; Tue, 7 Oct 2025
 08:44:06 +0000
Message-ID: <43628878-d414-459c-acad-fe7bf1afa332@amd.com>
Date: Tue, 7 Oct 2025 10:44:00 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/4] drm/sched: Add pending job list iterator
To: Matthew Brost <matthew.brost@intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 alexdeucher@gmail.com, dakr@kernel.org, pstanner@redhat.com,
 Philipp Stanner <phasta@kernel.org>
References: <20251002051604.1865322-1-matthew.brost@intel.com>
 <20251002051604.1865322-2-matthew.brost@intel.com>
 <be806a5e-75c9-45da-962f-2c1db75b4a07@amd.com>
 <aOTKvgqYFk8kw6Tm@lstrano-desk.jf.intel.com>
 <aOTPMlBMHK/c5KBh@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <aOTPMlBMHK/c5KBh@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN1PR13CA0023.namprd13.prod.outlook.com
 (2603:10b6:408:e2::28) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|BY5PR12MB4323:EE_
X-MS-Office365-Filtering-Correlation-Id: 41b0d2d2-7ed5-4bb8-70b4-08de057dacdc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QTIvSXVuRGRHUVJGMm5Cbm40ejJLaTlpckFodUROeXovY1ZNc0g0Y0RJSGx4?=
 =?utf-8?B?ZFVxVE4rd2htaGY2ZVpVb1ArWnVTN3hlVUMvOWtBWXNlaDN5K2c3U1NwNnEr?=
 =?utf-8?B?L3lvUHZ5NkM4MWkzSkZzZXUvUnZzMEdFSm14dlExaTlNbFN5enZDSWpOdFJw?=
 =?utf-8?B?cGFvU0s2ZnVtMHd1UnBuM1FUaGFoeld4TGthRTg0Z1NRVjZ0SWYrQWVyL29h?=
 =?utf-8?B?RVdLK2ZFTDcwaWliSGtVNm82aEl6NjZWR2tEcnJXeVNkaDNGNGw4V0FQN2Jx?=
 =?utf-8?B?SEFQcFpTb1luZ3JZRVBDTDJyclAvT1B4dko4MS80ZkpZN3FXaEpBQkFla3BT?=
 =?utf-8?B?cHEzU1NYNlU0RVo5QVZ6cmh4Vk5IU0U0QmdoS3UzTW9rMFNCMVlKR0VtMG5Q?=
 =?utf-8?B?SXB6Zi9HUDBTTzFNRFIraC9qMUoyWlQ4NUt6VVFONnQwVE1TV3Y1R1Qvbko1?=
 =?utf-8?B?V3B6S3dDY0l3dDlwNDlaZWhMeE5hL3BlU0dCTVBiY3QvUXhWOGFGWjVINUNT?=
 =?utf-8?B?MWRxaldRNlV2dmZhd1B3a0ZrcVZIcTExeG9Hc2I3MXlpNExsVE1nZ1hBUmkv?=
 =?utf-8?B?WkhUSEx6Q2o4T2NYNUptaXJBT3Fab1YxYm5BcXo3TGRQakljVmQ4cWlPOUtZ?=
 =?utf-8?B?UlZEbFF4UVV3TDJjYXNaOGJLZ0ovSkkzVHF2Vm01anpXbkVIS0t3REhuTVdJ?=
 =?utf-8?B?UnY2dHRwSmhQTllyZHVzNTVlVk9Ianpnenk4T2U0R2NxSXQ0UE42bFlBVlpB?=
 =?utf-8?B?a3ZNK3RPYmVXbDU0SHY0N1g1UHFoa1U5UEJGSnM5UlYzNVhzY3RkWWx5Tjl3?=
 =?utf-8?B?V2xWNVJwcGRvUi9QdXVNSXBrOG9KcmZvdEFGcStvTHFVdmdTVU95Vm5IeU42?=
 =?utf-8?B?cU1MVVFuQmFaQWYwUlZrTWFEbW9MTVNtb2NrZWxHSUMyYis1ajQvbWN5VzQ5?=
 =?utf-8?B?TXZGcXE3V1d0SEMxNHhwc0xlTWV1ZXc0aDdBeEFhZDlkVGQ1ZjNIaXI3MDNj?=
 =?utf-8?B?eXNsSjNoNGxqKzUyR2xUU2JHQ0NTUEhHWjFTdURZTGdmTStqMGJrSWdxb202?=
 =?utf-8?B?OGRWU0ZmM2lHRkhOck9xUlRSY1FJeTk4ZXJMWDF2c3dkUXg5cGkwTGRZLzlV?=
 =?utf-8?B?UVl3bTZnMXl1SDROdmlIRFZGRUpUVUJiSVoxNmRzczRaMC9Ua3BoZGJpU2pB?=
 =?utf-8?B?dlNRU3dvNDB5NXJveWRrZDhaeVh2cFo1cDFEZUNiUmhxUWZhcUpnaXNTMVU3?=
 =?utf-8?B?T1JoQlp6RDlTQVdVWERkU3ViclpnWUdRUWdFWEdBcGxHRWMyaEk2M2VrNm01?=
 =?utf-8?B?TC9mR21Ud1NZS2Y4aVE0ODh5NGhXK3AweG9ORDk3ekkyVmpicXdhMlFFeG1o?=
 =?utf-8?B?ZnRTdW1XNVBzb09pbTdLUzFrUUwyR1VPYUhaTnFUMVFJaE8wMVhBNGJxNDhv?=
 =?utf-8?B?MjhHNVBrR1RWUnJRbklyNW81OGZrSTQ0T1l0QVdXSjhhMlovWnU4OFFQOThx?=
 =?utf-8?B?c0dsUzNITU1SckttaU5lTUlzeWh4SmM1OW5RUVE4L01HUGdpSUZQWmFsa2hm?=
 =?utf-8?B?cDFoRkF4UVpQWEloNDE2amowT2UvUlByV3B5RlFQMCtWZXJUVzZaRUwxR1VL?=
 =?utf-8?B?SjIrcGxMOEZQUEdWcFFXTXArMmRIZEhtbVVqTGZjTEpML1lQQUhRS1B4aXlF?=
 =?utf-8?B?V3dsQk5NRzVzdlYybG45T3pMTExEWnFHdVc5aHdyTC9KTzM5dFNHMnN4eVJN?=
 =?utf-8?B?UlZ2S1ZRTU1DOU9MOUdocFBtYTZac0g4NUdUVjJkdnd6bnozc3hHZDhWaHdX?=
 =?utf-8?B?emFEOWNTQUlHNkRmaHRIVWZjc2paSmxBN0RoT2NXbk16TW44Y2pTWUF6cERG?=
 =?utf-8?B?d2x1dGE0WUhlazhwc3k2SjBaNkdqNEVOSkxMZk1HVHBuRGp0YlpoY1JwUmZX?=
 =?utf-8?Q?VBR2dBk2axG0zD76S02gTUFyuBq/H1Wx?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZU5EWjdjRDRYMWhETXRCVWdqc3A3clNCNjFFWnZubHRPODdIRXBBNjcwejdQ?=
 =?utf-8?B?L1ZIWnc5Mk41WGNjbVRkVFRFM0Y3SUE4enR1aldHdW40bGk1dU5FeFdLQVNR?=
 =?utf-8?B?L3FLWTFMclBsV3hENHpRdUxQVFJIZXlRS2Zqc042cXVBVUVjNVNWZ0dBellU?=
 =?utf-8?B?R2xyZ2ZlR25SZW9TUCtUV1U5RE5DdVVKVG9qYXk3VjFIMW5sM1lMWHdrZ29Q?=
 =?utf-8?B?NXB1cWZMbGxMNS9QR2xFNUQrT1hJcjhhQU1XOXNCZHRSdGt5QnZCZGRtVElS?=
 =?utf-8?B?Nzd6TC8veCtMcnBsU3pzWnl3UG1MQmNieUJxSW95Yk5FcVJaZERmZmhibE9B?=
 =?utf-8?B?TWJSUStnVG5LQ1F0RlQ1bU1iZm5KRWJOalB5VTZjakR5dVZYNkxSRXp3OVFu?=
 =?utf-8?B?ZWZmb3lKczFtMG9tajRKenM1UzJseG92OG1tTDJ3ZWNVK28rMWhhS0ZnNGha?=
 =?utf-8?B?UkVPRnc2SFRVa2lkYm1HS25QcUxkTW5SK2NCcDFiczh1NjhtR002cUZuV0t0?=
 =?utf-8?B?ZmR2T3N4ODIwbUtWWU9sRzVXYk9wRDFVcmZ2VHJ1MVVLUWludE1uRm9lc3pD?=
 =?utf-8?B?TjFGTWxSNnBOdCtVa1RjR3ZHT2FkQjNNZnN6S2h6djJkNW5weE01S0lEVGhP?=
 =?utf-8?B?WDhjUVVqdVhnb2tFV3ZxOGZHSVltMjRBTkRvOTgvYndwbEZaMnI0cjBTSm0w?=
 =?utf-8?B?d1NVRnNGQk1FRGNpNXBvMldmTndubm5FUGIxMHpGNklSSkZtemIvbnNjV0xh?=
 =?utf-8?B?Z0lCc090QXM1ZGxoNGxwUEUxczBySkthTGo2S0pieVNxaDNhaEtZK3psbW9l?=
 =?utf-8?B?MGUwalkzVnhwWVI5ZGVIL1orSUZRbTBYQS84UTMwdENWb295R3U3Z3NOQm9t?=
 =?utf-8?B?ZVM5K2pHaEtwTCttVkxEbFJwY0VJdjhxQnBLWThhWFM3MzFQUVk0TzhCSTNQ?=
 =?utf-8?B?MGdWY3hWdk9ZclJHd0ZCVmxGWnVWUFE1QmluWTZXVm9PT29iYVhsMnVIRXpJ?=
 =?utf-8?B?cUp5VjZlaEowZVhVb1k3YVVOV2RDVURBTmpyQitCaVJRVnFwVjFINDVOQ2tw?=
 =?utf-8?B?eDl5dmNRQllLd25JcWloN3paazhHZmhUbXBwY1RNZm5XQ0pjc0dHcDZoYkx0?=
 =?utf-8?B?cWtEY3g1MmpZdmJidjFTbTZpV3NVYjBmZXdqbmJ5ZFFXY1N4VVJuVGlPNTc1?=
 =?utf-8?B?T0JGN2I1TEdQR2pGcnJmYmNMMEoydG4xem5MS3lTd3VTMk0za1l3ekNWYlI1?=
 =?utf-8?B?eEpDNHVsODYybm91bXhiTkNkZkpPKzRiU2Q3cUhpZFFVTDZHTlpMRzY2R2tx?=
 =?utf-8?B?Ti95RFo2N2tuUklSMTg1Y3l6MTI4WVhxRUcvb2VKWjVVelBtYjZ0UDVGNmx2?=
 =?utf-8?B?STRBa1N1VFRkMFpCRWZDU1U4eDBpVDcvTFdyYlVUMWZvbXlVaU9qSzFZYzVs?=
 =?utf-8?B?OTExV2cxZFpVbUtNdmpIMHFxQ2dpV05WdDAzSWhQVkJWRzdtWWZuZTlZUjlH?=
 =?utf-8?B?OGxIU2xheWRjVkxYYXdCMmMxWDZjUjFaNmJLd3ZtTnQvekFacGVabXpWeUtj?=
 =?utf-8?B?NTZVelZsc0RURzhLQlJ3TzJXb2J6T2tlaVBpdDA5TURzRFhSZW5uSjhJbDlp?=
 =?utf-8?B?eHRmUmdrUzZIZkxlVGhaWGF5aWJMMjhUcHhsb3czV3ZRMktoNDk2WExhSzJC?=
 =?utf-8?B?Tm9Ydk9pcEk2YUplTGVhd0Ywa1FQSytsMTlVY1NBRGthWFRwNEZKaUtXd3ZK?=
 =?utf-8?B?MXRkNnp0emkyTEJCV2N5WVdZTzBNN0VoejQrNGVycThqWTFYQ2VMRGdWRDdW?=
 =?utf-8?B?RFNnbGdubjlhejdtS2hyc1VET3lhWnNhN3BzRy9CS3FmRFRLbW5NU0s2Sk1R?=
 =?utf-8?B?M001c05aLy9wMk5lQUFQbHRhNGxpcUlad2lyWDhyVHYxbnNYVzBhWnhEVk5M?=
 =?utf-8?B?YTIxQXZPdjhWcldyUVBUK0k0bmdRQzR1Rlc0SzkyYmNPRVNDTFZqV3J6bkFZ?=
 =?utf-8?B?bVM0REVwOHZZbVdDc3JIVURNbkx5SEtVY20xaFRYLzBxWG1tSU1xWEFiSVRI?=
 =?utf-8?B?VXR2QnVNTVVuaHp4S21WczB5TjBJMVdWY0ovSlI0cjY2dmgvQVdqQWJ5RU50?=
 =?utf-8?Q?GkswPtG5G+xPYC+SmG+cQYyeN?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41b0d2d2-7ed5-4bb8-70b4-08de057dacdc
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2025 08:44:06.4532 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gUGXRdJL6ktGQYixqzK16aGe06YkEs6vMZYcdXlFrxAt6PLW+v45ru0mw5m5hO8A
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4323
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

On 07.10.25 10:28, Matthew Brost wrote:
> On Tue, Oct 07, 2025 at 01:09:34AM -0700, Matthew Brost wrote:
>> On Tue, Oct 07, 2025 at 09:28:56AM +0200, Christian König wrote:
>>> On 02.10.25 07:16, Matthew Brost wrote:
>>>> Stop open coding pending job list in drivers. Add pending job list
>>>> iterator which safely walks DRM scheduler list either locklessly
>>>> asserting DRM scheduler is stopped or takes pending job list lock.
>>>
>>> Taking the job list lock and walking the pending list while the scheduler is not stopped is most likely a NO-GO.
> 
> Oops, I misread your statement—it's late here.
> 
> The use case for walking the scheduler with acquiring the job list lock
> and without being stopped is in debugfs for Xe, where it prints out
> pending job information. That seems valid. There are couple of other
> upstream cases where this is done but likely not needed.

Yeah, I thought it would be something like that.

> I checked and found that AMD acquires job_list_lock and walks the
> pending list in two cases within amdgpu_debugfs.c. PVR also acquires the
> lock in imagination/pvr_queue.c.
> 
> If this is really controversial, we don’t strictly need this in Xe and
> can remove it. But of course, AMD GPU and PVR would need to be fixed as
> well.

I think for debugging it is valid, but we should then have two different iterators.

One for debugging which can only be used when CONFIG_DEBUG/DEBUGFS is enabled.

And a different one for the functional side, e.g. iterating while the scheduler is stopped.

Christian.

> 
> Matt
> 
>>>
>>
>> I agree. But this patch doesn’t do that — it actually does the opposite.
>>
>> It ensures that if you need to walk the scheduler list locklessly, the
>> scheduler is stopped at both the beginning and end of the iterator, or
>> it correctly takes the pending list lock.
>>
>> So, what’s the issue? Or is there just some confusion about what this
>> patch is actually doing?
>>
>>> As far as I understand it that is exactly what Philip rejected as looking into scheduler internals during the discussion on XDC.
>>>
>>
>> I thought we agreed on having a well-defined iterator for walking the
>> pending list, ensuring correct usage, rather than having drivers walk
>> the pending list themselves. From my understanding, this is exactly what
>> we agreed upon.
>>
>>> So why is that actually needed? For debugging or something functional?
>>>
>>
>> Drivers inevitably need to walk the pending list during recovery flows
>> (such as resets, resubmissions, VF migration, etc.). This ensures that a
>> driver knows what it’s doing when it does so, and avoids directly
>> touching scheduler internals. Instead, it should just call
>> drm_sched_for_each_pending_job.
>>
>> This has actually been helpful in Xe already — when I was working on
>> scheduler backend changes, it helped catch cases where I accidentally
>> flipped the stopped flag while walking the job list. Without this, it
>> could have randomly blown up later if a perfectly timed race condition
>> occured (e.g., free_job fired).
>>
>> Matt
>>
>>> Regards,
>>> Christian.
>>>
>>>>
>>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>>> ---
>>>>  include/drm/gpu_scheduler.h | 64 +++++++++++++++++++++++++++++++++++++
>>>>  1 file changed, 64 insertions(+)
>>>>
>>>> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
>>>> index fb88301b3c45..a2dcabab8284 100644
>>>> --- a/include/drm/gpu_scheduler.h
>>>> +++ b/include/drm/gpu_scheduler.h
>>>> @@ -698,4 +698,68 @@ void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
>>>>  				   struct drm_gpu_scheduler **sched_list,
>>>>  				   unsigned int num_sched_list);
>>>>  
>>>> +/* Inlines */
>>>> +
>>>> +/**
>>>> + * struct drm_sched_iter_pending_job - DRM scheduler pending job iterator state
>>>> + * @sched: DRM scheduler associated with pending job iterator
>>>> + * @stopped: DRM scheduler stopped state associated with pending job iterator
>>>> + */
>>>> +struct drm_sched_iter_pending_job {
>>>> +	struct drm_gpu_scheduler *sched;
>>>> +	bool stopped;
>>>> +};
>>>> +
>>>> +/* Drivers should never call this directly */
>>>> +static inline struct drm_sched_iter_pending_job
>>>> +__drm_sched_iter_pending_job_begin(struct drm_gpu_scheduler *sched, bool stopped)
>>>> +{
>>>> +	struct drm_sched_iter_pending_job iter = {
>>>> +		.sched = sched,
>>>> +		.stopped = stopped,
>>>> +	};
>>>> +
>>>> +	if (stopped)
>>>> +		WARN_ON(!READ_ONCE(sched->pause_submit));
>>>> +	else
>>>> +		spin_lock(&sched->job_list_lock);
>>>> +
>>>> +	return iter;
>>>> +}
>>>> +
>>>> +/* Drivers should never call this directly */
>>>> +static inline void
>>>> +__drm_sched_iter_pending_job_end(const struct drm_sched_iter_pending_job iter)
>>>> +{
>>>> +	if (iter.stopped)
>>>> +		WARN_ON(!READ_ONCE(iter.sched->pause_submit));
>>>> +	else
>>>> +		spin_unlock(&iter.sched->job_list_lock);
>>>> +}
>>>> +
>>>> +DEFINE_CLASS(drm_sched_iter_pending_job, struct drm_sched_iter_pending_job,
>>>> +	     __drm_sched_iter_pending_job_end(_T);,
>>>> +	     __drm_sched_iter_pending_job_begin(__sched, __stopped),
>>>> +	     struct drm_gpu_scheduler * __sched, bool __stopped);
>>>> +static inline void
>>>> +*class_drm_sched_iter_pending_job_lock_ptr(class_drm_sched_iter_pending_job_t *_T)
>>>> +{return _T; }
>>>> +#define class_drm_sched_iter_pending_job_is_conditional false
>>>> +
>>>> +/**
>>>> + * drm_sched_for_each_pending_job() - Iterator for each pending job in scheduler
>>>> + * @__job: Current pending job being iterated over
>>>> + * @__sched: DRM scheduler to iterate over pending jobs
>>>> + * @__entity: DRM scheduler entity to filter jobs, NULL indicates no filter
>>>> + * @__stopped: DRM scheduler stopped state
>>>> + *
>>>> + * Iterator for each pending job in scheduler, filtering on an entity, and
>>>> + * enforcing locking rules (either scheduler fully stoppped or correctly takes
>>>> + * job_list_lock).
>>>> + */
>>>> +#define drm_sched_for_each_pending_job(__job, __sched, __entitiy, __stopped)	\
>>>> +	scoped_guard(drm_sched_iter_pending_job, __sched, __stopped)		\
>>>> +	list_for_each_entry(__job, &(__sched)->pending_list, list)		\
>>>> +	for_each_if(!__entitiy || (__job)->entity == (__entitiy))
>>>> +
>>>>  #endif
>>>

