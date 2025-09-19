Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47405B894BE
	for <lists+dri-devel@lfdr.de>; Fri, 19 Sep 2025 13:39:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83FF110E234;
	Fri, 19 Sep 2025 11:39:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="2HMKM9q1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011066.outbound.protection.outlook.com [40.107.208.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82B5910E234;
 Fri, 19 Sep 2025 11:39:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ym8hYrKM4rVRNr8aCUx2+g43/xQl7i5R0N4duieHXjvkAfhXD6bz0BeZgsMGki/QmYcHPISN/rQ88vg1x75pLcc5VOUnzhxMuZMghqIiA0aUqjJgzKKAbGFlKuOu7PD/JObopytBbzojj2F2EMn6zIowuzPMA2WbkPhMPhGA/EVUduITFi6s7rQkKJFfwaKlB9smBO/2lz1ynYRjKteFVhtgq5WFr3JZcTbRJZ2BqIrzIGPmCMlVELGwAqqbqQ1pmHDmvAF01VAj1XXjREQO+FRFqlwAWkfGPapgI3n2p6+h1kHIKmj3/RrMS38uN941hzeLScpLE1EcihlfUorcaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sz3JkAURYiQJ10819MqkeBOxK1qoM8fmJ6wappi2cc8=;
 b=yVUKBkyskg71h1ECtzElPWCGl98Yih56ILnP63abA2qDupCY3NNC5JlLwfC5JN1g33OFqgyn/XWMOYVmV8+Ux3CNp/yvzTlw/APejzJF/PkXfrhn5RzvOW/FK52+WfQo8mMYLdgzjZE7RQZAjgr8mVFChSNYaWJ9utgJE4dGB3Tog6sAPf7yNLBYEOx1zMC9oyPMiustvvrthUtNciFjy1ZrTX3KUGkq9ChYncE14cQNGMkHE8oXYDzbVTURVbJ107Mlc5caNl531Kg+N3neyuETgdTanRStAoCxdnXyzJq54RuNkNbdM6LPVBzHyzG1/fLJ4mv6L9ULkEjAuHkKoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sz3JkAURYiQJ10819MqkeBOxK1qoM8fmJ6wappi2cc8=;
 b=2HMKM9q1kNdVW8sOvsPlowAj6OQ5ca3Dq3HOPQq9+tc1trj/mYKM1M5VoASkYvTiUtBsRWLAhmtJWHxmKt+6PywCwjCFEhgnjFGEGcbEDxrS0q7tD9KkrI/8zvZLOg8HR9M09c+8tHwgt/aNH2C4qaQeRVvGWuBDJTrdBkSDyCU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CH2PR12MB4053.namprd12.prod.outlook.com (2603:10b6:610:7c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.16; Fri, 19 Sep
 2025 11:39:49 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9137.012; Fri, 19 Sep 2025
 11:39:49 +0000
Message-ID: <7c6a3aa0-c1eb-4726-988a-460c4895f615@amd.com>
Date: Fri, 19 Sep 2025 13:39:43 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 0/3] drm/ttm: allow direct reclaim to be skipped
To: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 Huang Rui <ray.huang@amd.com>, Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-dev@igalia.com,
 Sergey Senozhatsky <senozhatsky@chromium.org>
References: <20250918-ttm_pool_no_direct_reclaim-v2-0-135294e1f8a2@igalia.com>
 <6f92ff06-04c3-440b-becb-50a7693ecc39@amd.com>
 <67c83b24-01b6-4633-8645-52dc746c32e2@igalia.com>
 <96c117bc-389f-42d9-952e-894768aad780@amd.com>
 <aM06y7MP6LzHMBK7@quatroqueijos.cascardo.eti.br>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <aM06y7MP6LzHMBK7@quatroqueijos.cascardo.eti.br>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0055.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::14) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CH2PR12MB4053:EE_
X-MS-Office365-Filtering-Correlation-Id: 686784e8-6fcc-46ce-d9c5-08ddf7713d84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?djExbTV2Z05pY0tPRm1wbGJjQlZ0MjZ3WE1GU28xcUpjaEREaWptazJTRENV?=
 =?utf-8?B?cFJkWkJwZWd3Nk9WRFYwWkFETWNVWVpHTTJaU3FKaVdlRThpcmdGNVhlT3RV?=
 =?utf-8?B?Z3VMZkFVN1p1L1AySEdBTHBQSmsvNTFtbkRIaHE2U2VjS055dnpQYmQ0azVw?=
 =?utf-8?B?aU1UVlRENmNZTWt6dWZGc1ZXSFErN0c3Zm1Ddm0zNitscGlGVTBnaXF3Unls?=
 =?utf-8?B?K014cUhUODF1VUY4R3hSZmRPUkI4MTRCZUgwcGcxNWlEWi8wVy9FT0Zndk8x?=
 =?utf-8?B?Q09Oa2pXWWd6eXlxWGdPeDIra3haWVhLRWNUWC9lTWlYN1ZmS1JjQkdGSVhD?=
 =?utf-8?B?U1hrN3hRYjVrRy91UzdTME9KaG5VNWU4aXZuc1kvTkJGNXlENlMxQmVTdTdi?=
 =?utf-8?B?SHNaY0Z3QnlNSjNpZDFUVFNoNHlVQXZxSmpiQm9aUlE2K2d2czVIdTQ5bDJw?=
 =?utf-8?B?ckxMT1Q1QmxVMFc1RmNwNXNibGg2TGxIaWVibzVoS053enQ3bFdvY2ozOEU0?=
 =?utf-8?B?SU1DVlh4Y1VwOXRWaGttVUFxbURiWkh4cVcvSVpiRU84M2pKWDY4RFQrSmQ3?=
 =?utf-8?B?cExkVlFqQ09CeW9jdW9MeGtNTTl3NzVxdG1UMFBKbmZnd2dGV2V1WDhzN1JR?=
 =?utf-8?B?UFZYNThma2JSQVBjQUg5VEQxTlcxLzdwSVZpRlJQbCtFT0g4eFNXVXgreVlW?=
 =?utf-8?B?Y3FUMmdHa2NsZCtJKzRvdHlHTDl0bDIrYzVWcEdFekVjYWZpdVZUcVNFK3o1?=
 =?utf-8?B?ZGEvNkpDR0lqeDFaNTJpekNSUTZ3SENOK2MwUzdVTlJFc0RERkpZaURXTzlX?=
 =?utf-8?B?azYrRVkxbXIyeC9xZ3hoNzB5VkVBZUphUUJ5UzJjL0ZGYXpZZFA0NDkrcmMz?=
 =?utf-8?B?T2trSlhFMFdzZkFYK0RSSTdYQmYyMiticFhaKy8wRmpmWW9lQWVVajFTNkRr?=
 =?utf-8?B?S1U1MGFpclgxSEtKR0xmeHRkYjNpTStZSDVCcElwVnhrN0toTG9lWjl5empk?=
 =?utf-8?B?UVcweFh0Z2R2ZWpMbERiWk5MeU00VlNZRDVUZzRCcWJVTnJnVkxuY3ZsVTFn?=
 =?utf-8?B?STNTSTZLaHN3a2lUNnV4SlFuWE1tc21ZZ245K1U5OG5MNmxSNHBseWY3b21Y?=
 =?utf-8?B?cjhhUTJVKzBLS1Z4bWRBY1c0bXVMZGtpRVRmQUlPR0ZQYTlQY01nYzYwWkhG?=
 =?utf-8?B?VnBNRENiMnM2N1pQTzExcTkxMno1U1A0TWNEa3RybHF3K3VVR1kvN1lhd2dU?=
 =?utf-8?B?OWh2ejNUeVo1ejd0TTU4WmJxcDdDcktheHhYUEhOaFhGbThXUlF0WkhjVlND?=
 =?utf-8?B?eTFCc2VMN1hOQXVWdktDVCtCVE9pUmN6KzlrMEdLVU1VQ3JLdUJKcjVWcUx0?=
 =?utf-8?B?SWwrUm1FN1ROWVEzcmVFQU1BUTlCZWtDQ2NFZnJkb1ZzeTdlSjVqeDNVYy90?=
 =?utf-8?B?cEFoMnJIY0ZIb2VXR0Z6QXFGZzYyWTltWVBOaStRWXpOeDJGTS91aERwRkFh?=
 =?utf-8?B?cVNjN3N6WXdiUnBkbmp1ZElmQmNEcCsrb3JuTWVpQys3U3dxSG9jMXhMSklh?=
 =?utf-8?B?S2J5K2hjbHhXWGdHUG5EVnkrVTdHYjcvR01DcDg5WW93WDZXRUhwYUE2ZFU1?=
 =?utf-8?B?cWpSMkdEdXgyNkVxUytvRUJNY0tPZEtITHZsbzFiRytCdDB1KzFOOThyOUc1?=
 =?utf-8?B?MzZIM3ZjaE81ODNQQVNqcG4zODVtVXdpNnZjWlQ5WmJMS0wxOFlBY25XSzla?=
 =?utf-8?B?cDRDNzVwNmV3Nm1Ma2E0dVN2K3BpL3NXUnRRUE9nTkp3UjVOVWJYVm51K0cr?=
 =?utf-8?B?UUNaTFlIZFBtYklObWUrQmlPVjBGeVBSM2pCTU4vcXg0bHl3NGRSQzQzWHU1?=
 =?utf-8?B?aWgreElmM0t5QXpiT3IwUnNSVlpnOTZyY2IzK0JscWoreldzTlVUT0pXMkZi?=
 =?utf-8?Q?UbrZmUNpQp0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UHNwMTlkWXlIdE9QaXUwS2dJdkFWeEpBeXVqZklBMUpTS2N3T3FaUlltYktS?=
 =?utf-8?B?NzZvREJKdldyNE1hbnZtc0xMSHFvWnZvTmltWWV3dXk1ZkNVODh6REdiYzM3?=
 =?utf-8?B?RzB6UHZoTERKdWZnZWdNekxtQndoS0J3cVZmaGpyMnMyVnlxdGVndS9LZkRr?=
 =?utf-8?B?OGFaNnRpeUEzOFJ1R0dHOEk4ZUM2YUxVbjNVaWNXd05Ma2xpdjU2TDBZYWhp?=
 =?utf-8?B?ZkZkdlhxK1dvbWRMUy90UWhKWU1aTU5RSUZHSGdwTUw5SUVhT0MxMnk0RVZQ?=
 =?utf-8?B?RDhsNTc4UFNCRE50eFFiaUVYTDFXMkpVNnlTc3JCVmNDSGUwVlh3YVlxRXVU?=
 =?utf-8?B?WlpYaW9GTjZEU1BDbTZSYjlpMVh5dlgzZC9sNkxYdWNPZG9ndzE3dHdyKy9J?=
 =?utf-8?B?UE9LeWRnb2FtZWF1ZkQ3b2tTM2U0WXRtNzRPVHo5aGROelk2NHZ4TlB5b3BV?=
 =?utf-8?B?aHYzYmRqTTFtYUdrcEs5T0tzRlMyVmZaNnQyek5oaDlNUXB2VnVsdFVXOTdp?=
 =?utf-8?B?SS9zZ3p5bTJKdUtjZm1rR3plSy8yQVFSUkJXK0Nkbk1RR0JrNWVmMWFaeGxw?=
 =?utf-8?B?emJhRUptR3FpNzVoMENxckY2MjlWdE9ibEkwM3pLMktoVG9lSnJLblpSR1FX?=
 =?utf-8?B?VmRBOU5FcFk5ckRaM0RJbk5aQ2lWRk5pajMrVnBaSlZQYytkOEorVjNnVXRy?=
 =?utf-8?B?dm5qM1RpY09pMldCTDAvaEhtd2NZTjBEMzY5UDBHSnpjMjBKLzJMb0xvUWZT?=
 =?utf-8?B?MnlOYWhXNjdBRC81dWpFMnQxZUxaMG9XUDI3aHNiVWk2Z1QzSUFENmI2S1p5?=
 =?utf-8?B?N21zYjlYNis1Vm0yR2dXSU5rdUF0Rno0ZG9JT2UvNUxOWlppejFKWjkxdzRG?=
 =?utf-8?B?TGM0YU9MT1lZeEdET0F2VTE1Z0duUUFWUExDbTgwaUdyZDloRzZsY2VpRUwr?=
 =?utf-8?B?WEJrbVBYQ0lYNmFNaTltUUxybWprNWU5dHIwVXlyNEdpQmxmcnlEWGh3Rmtr?=
 =?utf-8?B?T1VDek1IV1l3QjhnZWhFdFpNenU4YnNDQ0hsMTVFNGtlWXJMeXJmQWtDdWxt?=
 =?utf-8?B?MWFoUXpQK1EvUG1iSy83a0tLYzNOU3lyektXdW1LaXBVcGRYeU1KUnZsWlk3?=
 =?utf-8?B?RXVvbHNjV29YS0Z1RUhjWjR1QmZ4UHJTL0tQYVdMNndORXBjR2tLMDR4VmxE?=
 =?utf-8?B?SXo4L01wVVkxZi9DRWlpYllla3dETitnNVBXbVpQTENucnNtU3lhVDJ3T2Er?=
 =?utf-8?B?OVZ3czAzZjFHQitXdWpJeEV0Vm1MSmZONmplWlBEanh0SUJkZjMvSFl2aGNN?=
 =?utf-8?B?U0VCSmVUMXlWRGNiTkJvQ2JrTUV3SnV0MjdvMWxabU9vd3hNcDU2YlJ0NWRE?=
 =?utf-8?B?dkNPUkpMQjlWVFlhdXByYmRQZnFFeXdleGVRTGk0aStiVGtxZ0dYN1Y0aDZ5?=
 =?utf-8?B?QWk2MFNCL0JzeU5NSEI4a0xPUGkzY01weVZrQWdqR1hreDhBem9pc0VkT2xk?=
 =?utf-8?B?aUtIc2Jsd2NoYVd2MmpqamVDMkZwMTJHMmVEZURFOFdFYmtmNkR5dENuTktD?=
 =?utf-8?B?NkdhY3BnZGx3NW9oQ1Z4VW9CSjBtMGVuY3VTMUtYSjd5R0JNeVhuM1hCdzdK?=
 =?utf-8?B?VEhOUDNUVk5NYUVmaCtqMGRRblpIb3I1OXhRQkM0cW1YVlY1bSs4YWlXK0pp?=
 =?utf-8?B?Y1kxN2dqcWhyZm5OQ3FhbWJRaDU5c1ROamtBVlVPTVJ2Q01tcXhGem1CelIy?=
 =?utf-8?B?ZDRPMUlXdXJxbHF1WDlyUTg4aExwdHNIMWdCWjJxVW9DWVFzMzRyTENSMjNp?=
 =?utf-8?B?VzhkcysrSTlOYjlEWXVYM2wxRUhhMWRZdUV1S1Z0clAxN0VXNmJxQ2JvL2Fh?=
 =?utf-8?B?U3Q1aGRrdDBjRkxPS1FwdVY1dTEvbmNwYXJnWmhSUzZ0amFqMDh4blcwaE13?=
 =?utf-8?B?UWF4eDFmSG0ySmRXY2srSnUzMmR4TitkdU9PSFJ6SmVMdDhrbW04TlhNbFhV?=
 =?utf-8?B?UkM4TGN5elV2bW5TSFVVdENaTmxEUHZDbzRMcW5udm5TblMwckFWSkRBMDUr?=
 =?utf-8?B?UTcxckVXTmpxWGZGMDhmSXNyTkc5b0U5NWt3dnNxaGRUVWRYYzk0YTQ0NFk3?=
 =?utf-8?Q?liQHvuS0TrBuJ+6aAvQbnuf76?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 686784e8-6fcc-46ce-d9c5-08ddf7713d84
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2025 11:39:49.3480 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fu9FZ+vynnHWfV/Lxb5XGl1hyr8UzeLPNy8ZQwLvy0TX94CXhMtxNxBeINVQQJNm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4053
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

On 19.09.25 13:13, Thadeu Lima de Souza Cascardo wrote:
>>>
>>>> The alternative I can offer is to disable the fallback which in your case would trigger the OOM killer.
>>>>
> 
> Warning could be as simple as removing __GFP_NOWARN. But I don't think we
> want either a warning or to trigger the OOM killer when allocating lower
> order pages are still possible. That will already happen when we get to 0
> order pages, where there is no fallback available anymore, and, then, it
> makes sense to try harder and warn if no page can be allocated.

I don't think you understand the problem.

Allocating lower order pages is not really an alternative. You run into really a lot of technical issues with that.

The reason we have it is to prevent crashes in OOM situations. In other words still allow displaying warning messages for example.

> Under my current workload, the balance skews torwards 0-order pages,
> reducing the amount of 10 and 9 order pages to half, when comparing runs
> with direct reclaim and without direct reclaim.

That pretty much completely disqualifies this approach.

This is a clear indicator that your system simply doesn't have enough memory for the workload you are trying to run.

> So, I understand your
> concern in respect to the impact on the GPU TLB and potential flickering.
> Is there a way we can measure it on the devices we are using? And, then, if
> it does not show to be a problem on those devices, would making this be a
> setting per-device be acceptable to you? In a way that we could have in
> userspace a list of devices where it is okay to prefer not to reclaim over
> getting huge pages and that could be set if the workload prefers lower
> latency in those allocations?

No, you are clearly trying to run a use case which as far as I can see we can't really support without running into a lot of trouble sooner or later.

Regards,
Christian.

> 
> Thanks.
> Cascardo.
> 
>>>> Regards,
>>>> Christian.
>>>>
>>>>>
>>>>> Other drivers can later opt to use this mechanism too.
>>>>>
>>>>> Signed-off-by: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
>>>>> ---
>>>>> Changes in v2:
>>>>> - Make disabling direct reclaim an option.
>>>>> - Link to v1: https://lore.kernel.org/r/20250910-ttm_pool_no_direct_reclaim-v1-1-53b0fa7f80fa@igalia.com
>>>>>
>>>>> ---
>>>>> Thadeu Lima de Souza Cascardo (3):
>>>>>        ttm: pool: allow requests to prefer latency over throughput
>>>>>        ttm: pool: add a module parameter to set latency preference
>>>>>        drm/amdgpu: allow allocation preferences when creating GEM object
>>>>>
>>>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c    |  3 ++-
>>>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c |  3 ++-
>>>>>   drivers/gpu/drm/ttm/ttm_pool.c             | 23 +++++++++++++++++------
>>>>>   drivers/gpu/drm/ttm/ttm_tt.c               |  2 +-
>>>>>   include/drm/ttm/ttm_bo.h                   |  5 +++++
>>>>>   include/drm/ttm/ttm_pool.h                 |  2 +-
>>>>>   include/drm/ttm/ttm_tt.h                   |  2 +-
>>>>>   include/uapi/drm/amdgpu_drm.h              |  9 +++++++++
>>>>>   8 files changed, 38 insertions(+), 11 deletions(-)
>>>>> ---
>>>>> base-commit: f83ec76bf285bea5727f478a68b894f5543ca76e
>>>>> change-id: 20250909-ttm_pool_no_direct_reclaim-ee0807a2d3fe
>>>>>
>>>>> Best regards,
>>>>
>>>
>>

