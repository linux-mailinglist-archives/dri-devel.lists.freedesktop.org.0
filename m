Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D28C9634B
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 09:38:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A13E10E347;
	Mon,  1 Dec 2025 08:38:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="3IrNkrzE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012058.outbound.protection.outlook.com
 [40.93.195.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EE0610E345;
 Mon,  1 Dec 2025 08:38:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oDmxTjI3XRUdD4+57Spc7dhCIPJWs4Au5Vxx1Ww+WHhl4hfGSAGkknfvOt0Rzhayp2Evk/PrAeqTwy8eH0Edppp5ep9mopJZfkmRaHvXFdiN9LC2FPqGruGkFIXCVpM9mdw8UubmZOwuR8BowYLDSp4uAeNFdjOSXN8vFKDpAlJkzxr9NGQZuN7/458ODdnjWyqCN4JSp9hAc9nnRLl1d9JMlGf8jyz7TR72UB85g6uA2FbH6leccUhp7Vf9PY/dCrKLo4rcdakgSWWnk+mWO/WRMM+XafZNYZegi/4ej1ng+kuiUELUdEOovW9CdGmklDxePJA0JNrMDEDdjCfK1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NtboVAQkbfNVRgE1lLdI0cZDY6R5zAaPzxHBRx2tbmo=;
 b=hCdESglQj6UPCRkI3ldUA7VipRmo7qRKuPE7+BwRctqlS8OVopy7CVXiGVoPeNtSbx0s9jeohmks2dBH65PGdTLlKTzvv+hDfBLgAzTeME0zDrKb+WmaYPyB1/tz05DJFcks9A9tWV1AQ4AtGfYrH88c4z098Ia8vJRH5SO6kPQOUiS0M+dbZyRK0hYZOktRi94Ah7LuCqbyl8erO5WHDS0zjiHafkWRhpNXydLAYOEdFKWC0XXCSqEHkcRVc0cU3ERtG1H8DnZe4YXyOHE4UgYcGqb2y5CuSnL1QzxO16QMMJfW0WXbW4hG6WtdOpL3oNE5wiMwRe1TB94DuNyiCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NtboVAQkbfNVRgE1lLdI0cZDY6R5zAaPzxHBRx2tbmo=;
 b=3IrNkrzEn0PQgCD0dk4TUw9r0Gsx5ecNZQFB0/2/KEF8x0yZd2CNtITDNO/wksdjNqcfGPqZCiHreRWjK/wb5F7HKHIfxeyRafKS0DNdcyvD4vCNcBU7uZNIDjclYqA3Q+gs2LCe8aU8sfNuLFP+KPS9wDkuFoghC1rVWjEeWnk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH7PR12MB8596.namprd12.prod.outlook.com (2603:10b6:510:1b7::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 08:38:44 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 08:38:38 +0000
Message-ID: <cdecd1e2-de0d-466f-b98b-927b2f364f79@amd.com>
Date: Mon, 1 Dec 2025 09:38:34 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/sched: run free_job work on timeout workqueue
To: vitaly.prosyak@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Philipp Stanner <phasta@mailbox.org>,
 Alex Deucher <alexander.deucher@amd.com>
References: <20251128182235.47912-1-vitaly.prosyak@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20251128182235.47912-1-vitaly.prosyak@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FRYP281CA0006.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::16)
 To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH7PR12MB8596:EE_
X-MS-Office365-Filtering-Correlation-Id: 378f10fc-3945-4570-41ae-08de30b50620
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZUk3RFZJc2psSmw0SFF4dFJzMElCN2tWRWVDTzR3NnFmSVNKY1V0N1lxYmlF?=
 =?utf-8?B?anFsU3NOeENtQTgvUEdSYjgvNm5uMW9MOTU4VnFZYTZ4UU04TXNPdm1mR3BH?=
 =?utf-8?B?R0JRUHprUXE5RTQzeDdVL1kwV2liNEJQalIwa3pJbi81TGp6a1E0OUs2T2pF?=
 =?utf-8?B?S1pGNXp1dzNVdytmUGlTVmhBK1AvSVFBODhXQlZGQURKM0I2MmVNZkJsb004?=
 =?utf-8?B?K2xoeVVyZE1UeEd2R0hZM20wU2poRVlIclFjSU1CN2xubzJXT0kwNUJQSXd6?=
 =?utf-8?B?WXlaR0lXdHFsUHMzM2FhUGhEUDN3ZVp4QmpNUjkwdlBWRmFPbGZwMGtIenF4?=
 =?utf-8?B?M3UwaW8vcm0xelRUTm5yQ1pzSy9QMkYvaU5wOXVpSU9RbE9sanFPNnVmdVZU?=
 =?utf-8?B?Z2VQcTVxR0NBcGljbC9VdWhhOEtyNVMwWmNqMGp6R1VScTRad1pCMFpoNTlk?=
 =?utf-8?B?cm1VU21PZW92VGg4azBTYjFXK2llVnNIbUpKTHlNcTF6WnE2ZFlYYndGRWZk?=
 =?utf-8?B?TVN0dkpXa3p0Qjg4WGpVK2ZTRzBzaHZWcmI5ZmNUdThHUXA0VWFzd0Z1NG50?=
 =?utf-8?B?TEh6V1ZEcmg1c2toRjc3S2src3dMNEVTY3lMVFJRTGRjTTNhMXJIWDdjN3Mv?=
 =?utf-8?B?R3NSR2kvNk4rOWdiSk1uSklFWFVjeklMWWFDTlJ0Yk1GWDhkRHEwTUcvNnFr?=
 =?utf-8?B?eEJobEVVY2RTQXk4UU03MGVPVkJXaUlZZjBUWVRNSlgwa1hyWDJ5ZWFFWDZY?=
 =?utf-8?B?RWV6bWVqbkpXM1VBSU9WNklyMzdQT1JVUUtrNzRtelZwWXBpRmh3V3FWRWdN?=
 =?utf-8?B?Q2ZndFhwbFlxVkNYOWd4aXc3MU9VbkNEZjhvbUZpK3pBQVZ6bHBDYzB1ZWpa?=
 =?utf-8?B?RWVFL0RFbFZmSHdyQ2w2UnF2Rzc0Wmk2bUljd0h4OWEvY0h2ZjRwYWRiOFVC?=
 =?utf-8?B?UWN3d1liNWU3cjdpQjJ6VU55ZkFnbFdPYUE1dU9ldTBjNHVzVHJKNFlZT09z?=
 =?utf-8?B?NjVmcC9QT0prQ1YyWjFvU1hUTUtmbnorWm9ybmlaSXh0NFZCN3BXbEE2L3RH?=
 =?utf-8?B?ZGd0dksrSFoxS0FlRTZoYi9mcHI2aDBBR1NnQ1hoamwvSHVvSlhlMEZmNndM?=
 =?utf-8?B?U3RVejJGNWUyUjE4SUJjZTkrd3NTWHlQUXhhcEdZZkQzb25OaXZrOWNmbXlG?=
 =?utf-8?B?aEczOU9BeGxId2x0dXlHT2MwdUNwbTVKOTY4cDRnbVhNZ0VOQUxDRHZmNlFl?=
 =?utf-8?B?SmlrWTVtQStCQkNsVm9FODRsbTJ0eHA4TTJOVzBJUXR3UHZGRnFtNUZLN2NS?=
 =?utf-8?B?YWpYRnJOVzQ1a1I5V2RVbXd2RUJsRkhXQUViL3dpNUc0MFZtVE5GbU44YnBq?=
 =?utf-8?B?N2EwTWxPaWxOVW90S3VjQ3UyMERHK28rOThDYzZ3dE90bFFxRDZFNUVvaGNi?=
 =?utf-8?B?Y3dJQzQxRTdDdWtxRlFsbXpPMlkzdjRaZXo2VlBkRitjd01aNkw4YkhuSW1C?=
 =?utf-8?B?UUxuenRUMmdsbFQ5ZHZRVFBkMnpMZkNxVEtIeFFTS05pNEpJN2NmajFBSENT?=
 =?utf-8?B?OGRlS3hNVVlnUkNMdHdWeTZaM3VqMG1oczF0Y3J5Z0gzQXgyNk12bnFoVERy?=
 =?utf-8?B?ZFN3V2JKaVdyaTBiWTZENjdKbk9ycDZDZHVIc3RBR1RvUzlPSEFtMEhHMm00?=
 =?utf-8?B?RVJVZWFMMWk4T0pxYWs2ckliQ2hYTEZxVldTVGxOeEErQXRxLzh3cW1rVE5F?=
 =?utf-8?B?cXgzY2pTMmtrNjhGNVNMMktrcm81NW5pSXh5UVlvVjdYOGR3TzZ5Y3ZkeG0w?=
 =?utf-8?B?MXI1eG03UFE3a2kzekJOZmRUWFJSOVVTeldlV3ZIbkhvZnoxV2txNVhTYWEx?=
 =?utf-8?B?YzJqbnR2WFVuVGY5ZStGYVBFM2dVSXJLdkNWNzVtWFdsdjRuZVptYzlxaVFG?=
 =?utf-8?Q?Luv+Z3iBFWMvZmLflQKW10kptjla/5RU?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NTFYWmtMOEtRTzB6TnhZU3Yxd2ExdTR5UytBOFBXQmQ3S3dZSFVNSUVQSm9s?=
 =?utf-8?B?dVVBN2Jaa04rMEdkS0tZQVBwTDI2bldGbEtNNXg5anhIZHYvWXd6TWtFTmxn?=
 =?utf-8?B?TnphNGdhWjYwWisvVHBjeHFiMkZzVkZOaTJVSElmcVdBTHBTQkhFWHJNYjF1?=
 =?utf-8?B?TE1Ha2lDak4zVXgvZFI2Q2g5MTVtZkN0OXN6dndlRnZqWm5yWGcvbnIrNWpD?=
 =?utf-8?B?QzRTcFhURUEyMmVNcEVxVzlqV1Z5aTQ5alljUmRScThOa1ZTMG5NUWtidVhs?=
 =?utf-8?B?K012c1BNd0lQbmRqUVNIRi9EamxYM2dQbVl0Q2ZBZkNRRmc5VnlUNklFRDlt?=
 =?utf-8?B?MDRKYVdHYmtJV0t1VEc0eUhqdE12SHZxNllGc1M2Qzgza25LUkFrR1N3aTdF?=
 =?utf-8?B?b2NlUEJOSG5VSkZzb2h3b2dFZmJ3MXUzYzFyK1BrMDhoblE0dGlUNHBPVk9v?=
 =?utf-8?B?ckxDU3I3azc3bUFRNUNsaWRnTGtEaFNLbTFjWWFWV0lCZDdFOXlrQ2R3Mnpj?=
 =?utf-8?B?ajQ3TXVXaE85SWYzaE8xMmlWZWhjWGRudXZtVkRWMVFoMWxPaExaQkljOWlC?=
 =?utf-8?B?emtKWlBnSjYxOVZoc2Q4ZzZRdDJJa3Fha2RRN3h3RUwwNFNnTis5Kzdzc3Jj?=
 =?utf-8?B?NWZuREpjM1RseC9nRU94MDlvejZ3dDI5TXI5eVhnaXVwdi8xSnFSYmwyVXZC?=
 =?utf-8?B?KytHWUFpUkhwZWE2dzcyYjFXaC8yajZOalJIcWhhV1dTaVdrWDdyR3VVM29z?=
 =?utf-8?B?N2p1U0MyVjlSOHM4WUVTUE53UElnNlJ6Y0xwVDVweDIrRnF0cFFPaW10a3Qz?=
 =?utf-8?B?YXlmeWFnb1M1VjZ0M0lTYVZrQWVBbHNhZnU4WlhRRnZZSzNlam5uQUFSZlVZ?=
 =?utf-8?B?QXMzZ2dSbE5kWmlaZzNDbU1IMFRZQ0I4cDEwK3N3RHNjQ3VjZXRIdXJ5aXFn?=
 =?utf-8?B?RWdibGNQV2pVdUpISU9ZeW5iWXlGWWI1ZitxQ0lkZzBZY0VCZ1NONjd2Wk41?=
 =?utf-8?B?Vk1rT0tWNGR2SGxySlhlRUZVdTExZHcveGpwQm5rSUVPaTFValAxSEw3d2Vo?=
 =?utf-8?B?RHpoMXAzTGFZUU1DY2RhRTVCVm9qTVpxUjRoMXJ0MzZ6Zld3YlUzakdVcGxa?=
 =?utf-8?B?WTNVbkJzeUxaM0tDV3dmSGExUVBlWFBRd1Jqa2lwa0hzSkU4eitIMUJwaWlr?=
 =?utf-8?B?NUdmcUdLYi9LTFEzci84Unh6bEFLcFQyREJxSWJGNGZYRi81NVUyUXJDSWFo?=
 =?utf-8?B?NDJVQVdoR2RXMnpzQ3JVT3U2OVRndHpxWmFjb3IxTWMvT0dGMFRrR2FhZlZC?=
 =?utf-8?B?UzBsaklXQUIvTHhnVHlicGVYU1kyWVYzRG1yTkZaRXA5aVBaTHY1THFuQjVy?=
 =?utf-8?B?ZE8xb3RxVkpFbXhvamo3dnBIbGN2Ymw4ODhGUDlub0xLTnIycXl6cUwxOHpj?=
 =?utf-8?B?NVU2L2U0QjA4TUM0YlBxdndqcXBwTkhEWHBtZ214djlwNVdGZHVzeVgwaWww?=
 =?utf-8?B?bm9zb2ttUjlndHVYd2MwNXNTbFZ6YnJNQ2dxV2hEenk1OUZSK0VZalY2Ykw5?=
 =?utf-8?B?bDJUSFQvNVhvSXN2WGduRnE3TlF4dEN2WkN5S05xWUYxVkZmM1JwdzVkWlZy?=
 =?utf-8?B?MlNFTlhudVR0eU50b0NEeVdxbkQ3bWVrSFZvbUVYSnQ2WlVkQzNPQzJnODM5?=
 =?utf-8?B?TzlZY0U2UGs1eDhEa05veXorUXdmNEg3YWhkQVhNcjYxeW8rbjRIRysrSG1h?=
 =?utf-8?B?d1RkK2RZcW4vd056SFBTSU80ajFoQm5aUVFES3VvVVcvVytOME13UUNXRTRW?=
 =?utf-8?B?cnhObitHMlBaN2pBdzkyZGNuaHZGeloyNFR2QmFtRE1rdzNoRElUL2xHQlVm?=
 =?utf-8?B?VktwZ0ZQdzhxeDEvMlVjWG1yek1UcEwzdVlsRkRxV1RMSlJhVjlpU3hCVW51?=
 =?utf-8?B?Und0VmhPdmVaTy9nazBzOFh5QUt5cy9nYTNMZ2pFNjA5U0xVdWI5bWZhYVBD?=
 =?utf-8?B?STZXMG80a0Y5OHY2ckpRTUxPd2twYkg0dyttZWJoUTdVck56RmZlNHJzb3dY?=
 =?utf-8?B?UU9ld2FENllvN2dwdS9pWE1WQWV2Q1BJMFRYUlFHMkU5aU1kMWVIN0hxanEy?=
 =?utf-8?Q?AA2chIrv6sBWAHjwWVcdiyM6D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 378f10fc-3945-4570-41ae-08de30b50620
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 08:38:38.4802 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hTlmn6rN65xVl2cOFbuR93F4N4+AzoYblEZtpl1Ro3vo20jAURyGWPVsSP6wLDSE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8596
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

On 11/28/25 19:22, vitaly.prosyak@amd.com wrote:
> From: Vitaly Prosyak <vitaly.prosyak@amd.com>
> 
> Currently drm_sched runs run_job and free_job on the per-scheduler
> ordered submit workqueue, while timeouts (drm_sched_job_timedout())
> run on sched->timeout_wq (e.g. amdgpu reset_domain->wq).
> 
> For drivers like amdgpu the reset path entered from timeout_wq may
> still access the guilty job while free_job, running on submit_wq,
> frees it. This allows a use-after-free when recovery continues to
> touch job fields after drm_sched_free_job_work() has called
> ops->free_job().
> 
> Queue work_free_job on sched->timeout_wq instead of submit_wq, both
> from __drm_sched_run_free_queue() and drm_sched_wqueue_start(), so
> timeout/reset and free_job are always serialized on the same
> workqueue.
> 
> Behavior changes:
> 
> - work_run_job stays on sched->submit_wq (ordered).
> - work_free_job moves to sched->timeout_wq (timeout/reset queue).
> - Submission and freeing may now run in parallel on different
>   workqueues, but all shared state is already protected by
>   job_list_lock and atomics.
> 
> Pros:
> - Eliminates reset vs free_job race (no freeing while reset still
>   uses the job).
> - Matches the logical model: timeout selects guilty job and recovery,
>   including freeing, is handled on one queue.
> 
> Cons / considerations:
> - For users that don’t provide timeout_wq, free_job moves from the
>   per-sched ordered queue to system_wq, which slightly changes
>   scheduling behaviour but keeps correctness.

We should probably avoid that and use a single ordered wq for submit, timeout, free when the driver doesn't provide one.

We should potentially also add a warning/error when the driver supplied wq isn't ordered.

Apart from that the change looks sane to me and avoid all the hacky workarounds around job lifetime.

But removing those workarounds is should probably be a second step.

Regards,
Christian.

> 
> Cc: Philipp Stanner <phasta@mailbox.org>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Christian König <christian.koenig@amd.com>
> Suggested-by: Mathew from Intel during XDC
> Suggested-by: Christian König <christian.koenig@amd.com>
> Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
> ---
>  drivers/gpu/drm/scheduler/sched_main.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 81ad40d9582b..1243200d475e 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -355,7 +355,7 @@ static void drm_sched_run_job_queue(struct drm_gpu_scheduler *sched)
>  static void __drm_sched_run_free_queue(struct drm_gpu_scheduler *sched)
>  {
>  	if (!READ_ONCE(sched->pause_submit))
> -		queue_work(sched->submit_wq, &sched->work_free_job);
> +		queue_work(sched->timeout_wq, &sched->work_free_job);
>  }
>  
>  /**
> @@ -1493,6 +1493,6 @@ void drm_sched_wqueue_start(struct drm_gpu_scheduler *sched)
>  {
>  	WRITE_ONCE(sched->pause_submit, false);
>  	queue_work(sched->submit_wq, &sched->work_run_job);
> -	queue_work(sched->submit_wq, &sched->work_free_job);
> +	queue_work(sched->timeout_wq, &sched->work_free_job);
>  }
>  EXPORT_SYMBOL(drm_sched_wqueue_start);

